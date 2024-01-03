resource "aws_budgets_budget" "my_production_monthly_budget" {
  name         = "My Production Monthly Budget"
  budget_type  = "COST"
  limit_amount = "400"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  cost_filter {
    name = "TagKeyValue"
    values = [
      "environment$Production",
    ]
  }

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 90
    threshold_type      = "PERCENTAGE"
    notification_type   = "ACTUAL"
    subscriber_email_addresses = [
      "email1@my.team",
      "email2@my.team"
    ]
  }

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 110
    threshold_type      = "PERCENTAGE"
    notification_type   = "FORECASTED"
    subscriber_email_addresses = [
      "email1@my.team",
      "email2@my.team"
    ]
  }
}