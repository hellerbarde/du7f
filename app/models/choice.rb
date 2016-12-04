# du7f - a simple web app for simple polls
# Copyright (C) 2011  Adrian Friedli <adi@koalatux.ch>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


class Choice < ActiveRecord::Base
  validates_presence_of :poll, :title, :unless => Proc.new {|c| c.destroyed?}

  belongs_to :poll
  has_many :entries, dependent: :destroy

  def count_answers(answer)
    @count_answers or (@count_answers = {})
    @count_answers[answer] or (@count_answers[answer] = self.entries.where(answer: answer).count)
  end
end
