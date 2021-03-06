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


require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment = Comment.new(name: 'joey', comment: 'foo bar baz', calculation: '23')
    @comment.poll = polls(:alices_poll)
  end

  test 'valid comment' do
    assert @comment.save
  end

  test 'honeypot_touched' do
    @comment.ubarlcbg = 'omnomnomnomnom'
    assert !@comment.save
  end

  test 'alternative_calculation' do
    @comment.calculation = '0x17'
    assert @comment.save
  end

  test 'calculation_wrong' do
    @comment.calculation = '42'
    assert !@comment.save
  end

end
