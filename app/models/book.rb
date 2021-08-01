class Book < ApplicationRecord
    enum status: [:borrowed, :on_shelf]
end
