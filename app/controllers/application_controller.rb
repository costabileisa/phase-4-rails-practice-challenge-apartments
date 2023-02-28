class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

private

def record_not_found(exception)
  render json: { errors: exception.record.errors.full_messages }, status: :not_found
end

def record_invalid(exception)
  render json: { errors: exception.model + " not found" }, status: :unprocessable_entity
end
end
