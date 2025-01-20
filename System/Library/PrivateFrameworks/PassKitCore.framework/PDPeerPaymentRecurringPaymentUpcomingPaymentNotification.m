@interface PDPeerPaymentRecurringPaymentUpcomingPaymentNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForRecurringPaymentIdentifier:(id)a3;
- (BOOL)isValid;
- (PDPeerPaymentRecurringPaymentUpcomingPaymentNotification)initWithCoder:(id)a3;
- (PDPeerPaymentRecurringPaymentUpcomingPaymentNotification)initWithPassUniqueIdentifier:(id)a3 recurringPayment:(id)a4;
- (PKPeerPaymentRecurringPayment)recurringPayment;
- (id)_recipientNameForAddress:(id)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentRecurringPaymentUpcomingPaymentNotification

- (PDPeerPaymentRecurringPaymentUpcomingPaymentNotification)initWithPassUniqueIdentifier:(id)a3 recurringPayment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 type] == (id)1 && objc_msgSend(v7, "sentByMe"))
  {
    v8 = [v7 identifier];
    v9 = +[PDPeerPaymentRecurringPaymentUpcomingPaymentNotification notificationIdentifierForRecurringPaymentIdentifier:v8];

    v18.receiver = self;
    v18.super_class = (Class)PDPeerPaymentRecurringPaymentUpcomingPaymentNotification;
    v10 = [(PDUserNotification *)&v18 initWithNotificationIdentifier:v9 forPassUniqueIdentifier:v6];
    p_isa = (id *)&v10->super.super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_recurringPayment, a4);
      uint64_t v12 = PKURLActionRoutePeerPaymentPass;
      uint64_t v13 = PKURLActionRouteRecurringPayment;
      v14 = [p_isa[17] identifier];
      v15 = +[NSString stringWithFormat:@"%@/%@/%@", v12, v13, v14];

      [p_isa setCustomActionRoute:v15];
    }
    self = p_isa;

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)notificationIdentifierForRecurringPaymentIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"PDPeerPaymentRecurringPaymentUpcomingPaymentNotification-%@", a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentRecurringPaymentUpcomingPaymentNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDPeerPaymentRecurringPaymentUpcomingPaymentNotification;
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
  v5.super_class = (Class)PDPeerPaymentRecurringPaymentUpcomingPaymentNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_recurringPayment, @"recurringPayment", v5.receiver, v5.super_class);
}

- (BOOL)isValid
{
  if ([(PKPeerPaymentRecurringPayment *)self->_recurringPayment type] != (id)1) {
    return 0;
  }
  recurringPayment = self->_recurringPayment;
  return [(PKPeerPaymentRecurringPayment *)recurringPayment sentByMe];
}

- (unint64_t)notificationType
{
  return 73;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PDPeerPaymentRecurringPaymentUpcomingPaymentNotification;
  id v4 = [(PDUserNotification *)&v18 notificationContentWithDataSource:a3];
  objc_super v5 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_RECURRING_PAYMENT_UPCOMING_PAYMENT_TITLE");
  [v4 setTitle:v5];

  uint64_t v6 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment memo];
  id v7 = [v6 text];

  v8 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment amount];
  objc_super v9 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment currency];
  v10 = PKCurrencyAmountMake();

  id v11 = [v7 length];
  uint64_t v12 = [v10 minimalFormattedStringValue];
  uint64_t v13 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment recipientAddress];
  uint64_t v14 = [(PDPeerPaymentRecurringPaymentUpcomingPaymentNotification *)self _recipientNameForAddress:v13];
  v15 = (void *)v14;
  if (v11) {
    PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_RECURRING_PAYMENT_UPCOMING_PAYMENT_MESSAGE_MEMO", @"%@%@%@", v12, v14, v7);
  }
  else {
  v16 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_RECURRING_PAYMENT_UPCOMING_PAYMENT_MESSAGE", @"%@%@", v12, v14);
  }
  [v4 setBody:v16];

  return v4;
}

- (id)_recipientNameForAddress:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)CNContactStore);
  objc_super v5 = +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys];
  id v6 = [objc_alloc((Class)PKContactResolver) initWithContactStore:v4 keysToFetch:v5];
  id v7 = [v6 contactForHandle:v3];
  v8 = +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:v3 contact:v7];

  return v8;
}

- (PKPeerPaymentRecurringPayment)recurringPayment
{
  return self->_recurringPayment;
}

- (void).cxx_destruct
{
}

@end