@interface PDPeerPaymentRecurringTransactionUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSData)imageData;
- (PDPeerPaymentRecurringTransactionUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentRecurringTransactionUserNotification)initWithPassUniqueIdentifier:(id)a3 transaction:(id)a4 imageData:(id)a5;
- (PKPaymentTransaction)transaction;
- (id)_formattedCounterpartName;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentRecurringTransactionUserNotification

- (PDPeerPaymentRecurringTransactionUserNotification)initWithPassUniqueIdentifier:(id)a3 transaction:(id)a4 imageData:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 serviceIdentifier];
  v13 = +[NSString stringWithFormat:@"PDPeerPaymentRecurringTransaction-%@", v12];

  v20.receiver = self;
  v20.super_class = (Class)PDPeerPaymentRecurringTransactionUserNotification;
  v14 = [(PDUserNotification *)&v20 initWithNotificationIdentifier:v13 forPassUniqueIdentifier:v11];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_transaction, a4);
    objc_storeStrong((id *)&v14->_imageData, a5);
    [(PDUserNotification *)v14 setCustomActionRoute:PKUserNotificationActionRouteViewTransaction];
    v15 = [(PKPaymentTransaction *)v14->_transaction identifier];
    v16 = [(PKPaymentTransaction *)v14->_transaction transactionSourceIdentifier];
    id v17 = objc_alloc_init((Class)NSMutableDictionary);
    if ([v15 length]) {
      [v17 setObject:v15 forKey:PKUserNotificationActionQueryItemTransactionIdentifier];
    }
    if ([v16 length]) {
      [v17 setObject:v16 forKey:PKUserNotificationActionQueryItemTransactionSourceIdentifier];
    }
    id v18 = [v17 copy];
    [(PDUserNotification *)v14 setCustomActionQueryParameters:v18];
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentRecurringTransactionUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDPeerPaymentRecurringTransactionUserNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentTransaction"];
    transaction = v5->_transaction;
    v5->_transaction = (PKPaymentTransaction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPeerPaymentRecurringTransactionUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageData, @"imageData", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_transaction forKey:@"paymentTransaction"];
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)notificationType
{
  return 69;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v34.receiver = self;
  v34.super_class = (Class)PDPeerPaymentRecurringTransactionUserNotification;
  id v4 = a3;
  objc_super v5 = [(PDUserNotification *)&v34 notificationContentWithDataSource:v4];
  uint64_t v6 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_RECURRING_PAYMENT_TRANSACTION_TITLE");
  [v5 setTitle:v6];

  v7 = [(PKPaymentTransaction *)self->_transaction recurringPeerPayment];
  uint64_t v8 = [v7 memo];

  id v9 = [v8 text];
  id v10 = [(PKPaymentTransaction *)self->_transaction peerPaymentType];
  id v11 = [v9 length];
  v12 = [(PKPaymentTransaction *)self->_transaction currencyAmount];
  v13 = [v12 minimalFormattedStringValue];
  uint64_t v14 = [(PDPeerPaymentRecurringTransactionUserNotification *)self _formattedCounterpartName];
  v15 = (void *)v14;
  if (v10 == (id)2)
  {
    if (v11)
    {
      uint64_t v31 = v14;
      v33 = v9;
      v29 = v13;
      v16 = @"NOTIFICATION_RECURRING_PAYMENT_TRANSACTION_RECEIVED_MESSAGE_MEMO";
LABEL_6:
      PKLocalizedPeerPaymentRecurringString(&v16->isa, @"%@%@%@", v29, v31, v33);
      goto LABEL_10;
    }
    v30 = v13;
    uint64_t v32 = v14;
    id v17 = @"NOTIFICATION_RECURRING_PAYMENT_TRANSACTION_RECEIVED_MESSAGE";
  }
  else
  {
    if (v11)
    {
      uint64_t v31 = v14;
      v33 = v9;
      v29 = v13;
      v16 = @"NOTIFICATION_RECURRING_PAYMENT_TRANSACTION_SENT_MESSAGE_MEMO";
      goto LABEL_6;
    }
    v30 = v13;
    uint64_t v32 = v14;
    id v17 = @"NOTIFICATION_RECURRING_PAYMENT_TRANSACTION_SENT_MESSAGE";
  }
  PKLocalizedPeerPaymentRecurringString(&v17->isa, @"%@%@", v30, v32);
  id v18 = LABEL_10:;
  [v5 setBody:v18];

  id v19 = objc_alloc((Class)NSString);
  objc_super v20 = [v8 emoji];
  [v8 color];
  v21 = PKSemanticColorToString();
  id v22 = [v19 initWithFormat:@"%@-%@", v20, v21];

  v23 = [v4 fileURLForImage:self->_imageData identifier:v22];

  if (v23)
  {
    v24 = +[NSUUID UUID];
    v25 = [v24 UUIDString];
    v26 = +[UNNotificationAttachment attachmentWithIdentifier:v25 URL:v23 options:0 error:0];

    v35 = v26;
    v27 = +[NSArray arrayWithObjects:&v35 count:1];
    [v5 setAttachments:v27];
  }
  return v5;
}

- (id)_formattedCounterpartName
{
  v2 = [(PKPaymentTransaction *)self->_transaction peerPaymentCounterpartHandle];
  id v3 = objc_alloc_init((Class)CNContactStore);
  id v4 = +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys];
  id v5 = [objc_alloc((Class)PKContactResolver) initWithContactStore:v3 keysToFetch:v4];
  uint64_t v6 = [v5 contactForHandle:v2];
  v7 = +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:v2 contact:v6];

  return v7;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end