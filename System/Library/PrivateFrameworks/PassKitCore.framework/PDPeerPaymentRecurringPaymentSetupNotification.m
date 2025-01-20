@interface PDPeerPaymentRecurringPaymentSetupNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDPeerPaymentRecurringPaymentSetupNotification)initWithCoder:(id)a3;
- (PDPeerPaymentRecurringPaymentSetupNotification)initWithPassUniqueIdentifier:(id)a3 recurringPayment:(id)a4;
- (PKPeerPaymentRecurringPayment)recurringPayment;
- (id)_formattedCounterpartName;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentRecurringPaymentSetupNotification

- (PDPeerPaymentRecurringPaymentSetupNotification)initWithPassUniqueIdentifier:(id)a3 recurringPayment:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 identifier];
  v10 = +[NSString stringWithFormat:@"PDPeerPaymentRecurringPaymentSetUp-%@", v9];

  v17.receiver = self;
  v17.super_class = (Class)PDPeerPaymentRecurringPaymentSetupNotification;
  v11 = [(PDUserNotification *)&v17 initWithNotificationIdentifier:v10 forPassUniqueIdentifier:v8];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_recurringPayment, a4);
    if ([(PKPeerPaymentRecurringPayment *)v11->_recurringPayment type] == (id)1)
    {
      uint64_t v12 = PKURLActionRoutePeerPaymentPass;
      uint64_t v13 = PKURLActionRouteRecurringPayment;
      v14 = [(PKPeerPaymentRecurringPayment *)v11->_recurringPayment identifier];
      v15 = +[NSString stringWithFormat:@"%@/%@/%@", v12, v13, v14];

      [(PDUserNotification *)v11 setCustomActionRoute:v15];
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentRecurringPaymentSetupNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDPeerPaymentRecurringPaymentSetupNotification;
  v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recurringPayment"];
    recurringPayment = v5->_recurringPayment;
    v5->_recurringPayment = (PKPeerPaymentRecurringPayment *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPeerPaymentRecurringPaymentSetupNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_recurringPayment, @"recurringPayment", v5.receiver, v5.super_class);
}

- (BOOL)isValid
{
  return [(PKPeerPaymentRecurringPayment *)self->_recurringPayment type] == (id)1;
}

- (unint64_t)notificationType
{
  return 74;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PDPeerPaymentRecurringPaymentSetupNotification;
  id v4 = [(PDUserNotification *)&v17 notificationContentWithDataSource:a3];
  if ([(PKPeerPaymentRecurringPayment *)self->_recurringPayment type] == (id)1)
  {
    objc_super v5 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment memo];
    uint64_t v6 = [v5 text];

    id v7 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment amount];
    id v8 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment currency];
    objc_super v9 = PKCurrencyAmountMake();

    id v10 = [v6 length];
    v11 = [v9 minimalFormattedStringValue];
    uint64_t v12 = [(PDPeerPaymentRecurringPaymentSetupNotification *)self _formattedCounterpartName];
    uint64_t v13 = (void *)v12;
    if (v10) {
      PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_RECURRING_PAYMENT_SET_UP_MESSAGE_MEMO", @"%@%@%@", v11, v12, v6);
    }
    else {
    v14 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_RECURRING_PAYMENT_SET_UP_MESSAGE", @"%@%@", v11, v12);
    }
    [v4 setBody:v14];

    v15 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_RECURRING_PAYMENT_SET_UP_TITLE");
    [v4 setTitle:v15];
  }
  return v4;
}

- (id)_formattedCounterpartName
{
  v2 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment recipientAddress];
  id v3 = objc_alloc_init((Class)CNContactStore);
  id v4 = +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys];
  id v5 = [objc_alloc((Class)PKContactResolver) initWithContactStore:v3 keysToFetch:v4];
  uint64_t v6 = [v5 contactForHandle:v2];
  id v7 = +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:v2 contact:v6];

  return v7;
}

- (PKPeerPaymentRecurringPayment)recurringPayment
{
  return self->_recurringPayment;
}

- (void).cxx_destruct
{
}

@end