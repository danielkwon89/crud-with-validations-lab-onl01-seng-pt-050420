class Song < ApplicationRecord

    validates :title, presence: true
    validates :artist_name, presence: true, if: :released?
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
    validates :title, uniqueness: { scope: %i[release_year artist_name], message: 'cannot be repeated by the same artist in the same year' }
    validates :released, inclusion: { in: [true, false] }

    # you can use "with_options" (below) for duplicated options

    # with_options if: :released? do |song|
    #     song.validates :release_year, presence: true
    #     song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
    # end

    def released?
        released
    end

end