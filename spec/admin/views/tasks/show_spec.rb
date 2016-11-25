require 'spec_helper'
require_relative '../../../../apps/admin/views/tasks/show'

RSpec.describe Admin::Views::Tasks::Show do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/tasks/show.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  describe '#link_to_edit' do
    let(:task) { Task.new(id: 1, title: 'test') }

    it 'returns link to special task' do
      link = view.link_to_edit(task)
      expect(link.to_s).to eq '<a href="/admin/tasks/1/edit">Edit task</a>'
    end
  end
end