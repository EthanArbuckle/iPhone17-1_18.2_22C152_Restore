@interface PDPeerPaymentRecurringPaymentStatusChangeUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDPeerPaymentRecurringPaymentStatusChangeUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentRecurringPaymentStatusChangeUserNotification)initWithPassUniqueIdentifier:(id)a3 recurringPayment:(id)a4;
- (PKPeerPaymentRecurringPayment)recurringPayment;
- (id)_recipientNameForAddress:(id)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentRecurringPaymentStatusChangeUserNotification

- (PDPeerPaymentRecurringPaymentStatusChangeUserNotification)initWithPassUniqueIdentifier:(id)a3 recurringPayment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 type] != (id)1 || objc_msgSend(v7, "sentByMe"))
  {
    v8 = [v7 identifier];
    v9 = +[NSString stringWithFormat:@"PDPeerPaymentRecurringPaymentStatusChange-%@", v8];

    v20.receiver = self;
    v20.super_class = (Class)PDPeerPaymentRecurringPaymentStatusChangeUserNotification;
    v10 = [(PDUserNotification *)&v20 initWithNotificationIdentifier:v9 forPassUniqueIdentifier:v6];
    v11 = v10;
    if (v10)
    {
      p_recurringPayment = (id *)&v10->_recurringPayment;
      objc_storeStrong((id *)&v10->_recurringPayment, a4);
      id v13 = [*p_recurringPayment type];
      if (v13 == (id)1)
      {
        uint64_t v16 = PKURLActionRoutePeerPaymentPass;
        uint64_t v17 = PKURLActionRouteRecurringPayment;
        v18 = [*p_recurringPayment identifier];
        v14 = +[NSString stringWithFormat:@"%@/%@/%@", v16, v17, v18];

        goto LABEL_9;
      }
      if (v13 == (id)3)
      {
        v14 = +[NSString stringWithFormat:@"%@/%@", PKURLActionRoutePeerPaymentPass, PKURLActionRouteAutoReload];
LABEL_9:
        [(PDUserNotification *)v11 setCustomActionRoute:v14];
      }
    }
    self = v11;

    v15 = self;
    goto LABEL_11;
  }
  v15 = 0;
LABEL_11:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentRecurringPaymentStatusChangeUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDPeerPaymentRecurringPaymentStatusChangeUserNotification;
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
  v5.super_class = (Class)PDPeerPaymentRecurringPaymentStatusChangeUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_recurringPayment, @"recurringPayment", v5.receiver, v5.super_class);
}

- (BOOL)isValid
{
  id v3 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment type];
  if (v3 == (id)3) {
    return 1;
  }
  if (v3 != (id)1) {
    return 0;
  }
  recurringPayment = self->_recurringPayment;
  return [(PKPeerPaymentRecurringPayment *)recurringPayment sentByMe];
}

- (unint64_t)notificationType
{
  return 72;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PDPeerPaymentRecurringPaymentStatusChangeUserNotification;
  id v4 = [(PDUserNotification *)&v12 notificationContentWithDataSource:a3];
  id v5 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment type];
  if (v5 == (id)1)
  {
    if (PKPassbookIsSupported()) {
      objc_super v9 = @"NOTIFICATION_RECURRING_PAYMENT_ERROR_MESSAGE";
    }
    else {
      objc_super v9 = @"NOTIFICATION_RECURRING_PAYMENT_ERROR_MESSAGE_SETTINGS";
    }
    id v7 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment recipientAddress];
    v8 = [(PDPeerPaymentRecurringPaymentStatusChangeUserNotification *)self _recipientNameForAddress:v7];
    v10 = PKLocalizedPeerPaymentRecurringString(&v9->isa, @"%@", v8);
    [v4 setBody:v10];
  }
  else
  {
    if (v5 != (id)3) {
      goto LABEL_9;
    }
    uint64_t v6 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_THRESHOLD_TOP_UP_ERROR_TITLE");
    [v4 setTitle:v6];

    PDDeviceSpecificLocalizedStringKeyForKey();
    id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = PKLocalizedPeerPaymentRecurringString(v7);
    [v4 setBody:v8];
  }

LABEL_9:
  return v4;
}

- (id)_recipientNameForAddress:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)CNContactStore);
  id v5 = +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys];
  id v6 = [objc_alloc((Class)PKContactResolver) initWithContactStore:v4 keysToFetch:v5];
  id v7 = [v6 contactForHandle:v3];
  v8 = [v7 givenName];
  objc_super v9 = v8;
  if (!v8) {
    v8 = v3;
  }
  id v10 = v8;

  return v10;
}

- (PKPeerPaymentRecurringPayment)recurringPayment
{
  return self->_recurringPayment;
}

- (void).cxx_destruct
{
}

@end