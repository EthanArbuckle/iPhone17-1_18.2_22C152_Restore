@interface PKPaymentPassDetailCollectedProperties
- (NSDictionary)actionForBalanceIdentifier;
- (NSDictionary)balances;
- (NSDictionary)reminderForBalanceIdentifier;
- (PKPaymentBalanceReminder)transitPropertiesBalanceReminder;
- (PKPaymentPass)pass;
- (PKPaymentPassDetailCollectedProperties)initWithPass:(id)a3 transitPassProperties:(id)a4 transitBalanceModel:(id)a5 balances:(id)a6 actionForBalanceIdentifier:(id)a7 transitPropertiesBalanceReminder:(id)a8 reminderForBalanceIdentifier:(id)a9;
- (PKTransitBalanceModel)transitBalanceModel;
- (PKTransitPassProperties)transitPassProperties;
- (void)setActionForBalanceIdentifier:(id)a3;
- (void)setBalances:(id)a3;
- (void)setPass:(id)a3;
- (void)setReminderForBalanceIdentifier:(id)a3;
- (void)setTransitBalanceModel:(id)a3;
- (void)setTransitPassProperties:(id)a3;
- (void)setTransitPropertiesBalanceReminder:(id)a3;
@end

@implementation PKPaymentPassDetailCollectedProperties

- (PKPaymentPassDetailCollectedProperties)initWithPass:(id)a3 transitPassProperties:(id)a4 transitBalanceModel:(id)a5 balances:(id)a6 actionForBalanceIdentifier:(id)a7 transitPropertiesBalanceReminder:(id)a8 reminderForBalanceIdentifier:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentPassDetailCollectedProperties;
  v18 = [(PKPaymentPassDetailCollectedProperties *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pass, a3);
    objc_storeStrong((id *)&v19->_transitPassProperties, a4);
    objc_storeStrong((id *)&v19->_transitBalanceModel, a5);
    objc_storeStrong((id *)&v19->_balances, a6);
    objc_storeStrong((id *)&v19->_actionForBalanceIdentifier, a7);
    objc_storeStrong((id *)&v19->_transitPropertiesBalanceReminder, a8);
    objc_storeStrong((id *)&v19->_reminderForBalanceIdentifier, a9);
  }

  return v19;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (PKTransitPassProperties)transitPassProperties
{
  return self->_transitPassProperties;
}

- (void)setTransitPassProperties:(id)a3
{
}

- (PKTransitBalanceModel)transitBalanceModel
{
  return self->_transitBalanceModel;
}

- (void)setTransitBalanceModel:(id)a3
{
}

- (NSDictionary)balances
{
  return self->_balances;
}

- (void)setBalances:(id)a3
{
}

- (NSDictionary)actionForBalanceIdentifier
{
  return self->_actionForBalanceIdentifier;
}

- (void)setActionForBalanceIdentifier:(id)a3
{
}

- (PKPaymentBalanceReminder)transitPropertiesBalanceReminder
{
  return self->_transitPropertiesBalanceReminder;
}

- (void)setTransitPropertiesBalanceReminder:(id)a3
{
}

- (NSDictionary)reminderForBalanceIdentifier
{
  return self->_reminderForBalanceIdentifier;
}

- (void)setReminderForBalanceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderForBalanceIdentifier, 0);
  objc_storeStrong((id *)&self->_transitPropertiesBalanceReminder, 0);
  objc_storeStrong((id *)&self->_actionForBalanceIdentifier, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_transitPassProperties, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end