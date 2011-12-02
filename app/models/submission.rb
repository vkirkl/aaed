class Submission < ActiveRecord::Base
  validates_presence_of :species
  validates_presence_of :country
  validates_presence_of :data_type
  validates_presence_of :right_to_grant_permission

  belongs_to :user

  has_many :population_submissions

  has_many :survey_aerial_sample_counts, :through => :population_submissions
  has_many :survey_aerial_total_counts, :through => :population_submissions
  has_many :survey_dung_count_line_transects, :through => :population_submissions
  has_many :survey_faecal_dnas, :through => :population_submissions
  has_many :survey_ground_sample_counts, :through => :population_submissions
  has_many :survey_ground_total_counts, :through => :population_submissions
  has_many :survey_individual_registrations, :through => :population_submissions
  has_many :survey_others, :through => :population_submissions

  belongs_to :species
  belongs_to :country

  def range_states
    if species.nil?
      {}
    else
      species.range_states
    end
  end
end
