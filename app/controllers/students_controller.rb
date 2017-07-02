class StudentsController < ApplicationController
<<<<<<< HEAD

=======
<<<<<<< HEAD

=======
    def index
        @students = "sample data"
    end

    def show
        @student = {
                    first_name: "",
                    last_name: '',
                    email: '',
                    phone_number: '',
                    bio: '',
                    linkedin_url: '',
                    twitter_url: '',
                    blog_url: '',
                    resume_url: '',
                    github_url: '',
                    photo: '',
                    experience: [{
                                start_date: '',
                                end_date: '',
                                job_title: '',
                                company_name: '',
                                details: ''
                                }],
                    education: [{
                                start_date: '',
                                end_date: '',
                                degree: '',
                                university_name: '',
                                details: ''
                                }],
                    skills: [{
                                skill_name: ''
                            }],
                    capstone: [{
                                name: '',
                                description: '',
                                url: '',
                                screenshot: ''
                        }]
                    },
    end
>>>>>>> 6d22940ac26f2aa821952805061f632871348817
>>>>>>> 089f8314d12edfe017654ab0bafbdfc0e10f02c3
end
