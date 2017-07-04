require 'prawn'
class StudentsController < ApplicationController
    
    def index
        @students = Unirest.get('https://secure-ravine-87574.herokuapp.com/api/v1/students.json').body

    end

    def show
        student = Unirest.get("https://secure-ravine-87574.herokuapp.com/api/v1/students/#{params[:id]}.json").body
        
          respond_to do |format|
                        format.html
                        format.pdf do
                            pdf = Prawn::Document.new
                            pdf.text "#{student['first_name']} #{student['']}"
                            send_data pdf.render, filename: "student_#{student['last_name']}"
                        end
                    end
    end
end
