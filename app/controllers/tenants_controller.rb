class TenantsController < ApplicationController
  def index
    render json: Tenant.all
  end

  def show
    tenant = find_tenant
    render json: tenant, status: :ok
  end

  def create
    tenant = Tenant.create!(tenant_params)
    render json: tenant, status: :created
  end

  def update
    tenant = find_tenant
    tenant.update!(tenant_params)
    render json: tenant, status: :ok
  end

  def destroy
    tenant = find_tenant
    tenant.destroy
    head :no_content
  end

  private

  def tenant_params
    params.permit(:name, :age)
  end

  def find_tenant
    Tenant.find(params[:id])
  end
end
