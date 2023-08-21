class DataEntriesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update]

  def create
    data_entry = DataEntry.new(data_entry_params)

    if data_entry.save
      notify_third_party_endpoints(data_entry)
      render json: { message: 'Data entry created successfully' }
    else
      render json: { errors: data_entry.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    data_entry = DataEntry.find(params[:id])

    if data_entry.update(data_entry_params)
      notify_third_party_endpoints(data_entry)
      render json: { message: 'Data entry updated successfully' }
    else
      render json: { errors: data_entry.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def data_entry_params
    params.require(:data_entry).permit(:name, :data)
  end

  def notify_third_party_endpoints(data_entry)
    # Implement the logic to send notifications to configured third-party endpoints
  end
end
