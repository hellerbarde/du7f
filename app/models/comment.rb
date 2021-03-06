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


class Comment < ApplicationRecord

  validates_presence_of :name, :comment
  validate :honeypot_must_be_untouched
  validate :calculation_must_be_correct

  belongs_to :poll

  def ubarlcbg
    @honeypot
  end

  def ubarlcbg=(value)
    @honeypot = value
  end

  def calculation
    @calculation
  end

  def calculation=(value)
    @calculation = value
  end

  private

  def honeypot_must_be_untouched
    self.errors.add(:base, 'nope!') unless ubarlcbg.blank?
  end

  def calculation_must_be_correct
    self.errors.add(:base, 'nope!') unless %w(23 0x17).include? calculation
  end

end
