require 'prawn'
class StudentsController < ApplicationController
    
    def index
        @students = Unirest.get('https://secure-ravine-87574.herokuapp.com/api/v1/students.json').body

    end

    def show
        student = Unirest.get("https://secure-ravine-87574.herokuapp.com/api/v1/students/#{params[:id]}.json").body
        experiences = Unirest.get("https://secure-ravine-87574.herokuapp.com/api/v1/students/#{params[:id]}/experiences.json").body

          respond_to do |format|
                        format.html
                        format.pdf do
                            pdf = Prawn::Document.new
                            pdf.text "#{student['first_name']} #{student['last_name']}"
                            pdf.text "#{student['short_bio']}"
                            pdf.text "#{student['email']} | #{student['phone']}"
                            pdf.text "#{student['linkedin_url']}| #{student['twitter_handle']}"
                            
                            experiences.each do |exp|
                                pdf.text "#{ exp['company_name']}"
                                pdf.text "#{ exp['job_title']}"
                                pdf.text "#{ exp['start_date']}"
                                pdf.text "#{ exp['end_date']}"
                                pdf.text "#{ exp['details']}"
                            end
                            send_data pdf.render, filename: "resume_#{student['last_name']}"
                        end
                    end
    end
end
