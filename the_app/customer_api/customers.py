from flask import Blueprint

customers_blueprint = Blueprint('customers_blueprint', __name__)

@customers_blueprint.route('/customers')
def get_all_customers():
    return f'<h1>Getting all the customers from {__file__} file.</h1>'