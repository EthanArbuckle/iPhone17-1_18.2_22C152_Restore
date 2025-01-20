@interface PDPeerPaymentNearbySetupUserNotification
+ (BOOL)supportsSecureCoding;
- (PDPeerPaymentNearbySetupUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentNearbySetupUserNotification)initWithPassUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 amount:(id)a5 senderName:(id)a6;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentNearbySetupUserNotification

- (PDPeerPaymentNearbySetupUserNotification)initWithPassUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 amount:(id)a5 senderName:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  v14 = +[NSString stringWithFormat:@"peerPaymentNearbySetup-%@", a4];
  v21.receiver = self;
  v21.super_class = (Class)PDPeerPaymentNearbySetupUserNotification;
  v15 = [(PDUserNotification *)&v21 initWithNotificationIdentifier:v14 forPassUniqueIdentifier:v13];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_amount, a5);
    objc_storeStrong((id *)&v15->_senderName, a6);
    v16 = +[NSDate date];
    [(PDUserNotification *)v15 setDate:v16];
    id v17 = objc_alloc_init((Class)PKPeerPaymentAccountResolutionControllerConfiguration);
    [v17 setCurrencyAmount:v11];
    [v17 setRegistrationFlowState:2];
    [v17 setSenderAddress:v12];
    [v17 setPaymentMode:2];
    v18 = PKPeerPaymentGetSetupSensitiveURLWithConfiguration();
    v19 = [v18 absoluteString];
    [(PDUserNotification *)v15 setCustomActionURLString:v19];
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentNearbySetupUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDPeerPaymentNearbySetupUserNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderName"];
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPeerPaymentNearbySetupUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_amount, @"amount", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_senderName forKey:@"senderName"];
}

- (id)_titleString
{
  return (id)PKLocalizedNearbyPeerPaymentString(@"NEARBY_SUCCESSFUL_TRANSACTION_GHOST_PASS_SETUP_TITLE");
}

- (id)_messageString
{
  senderName = self->_senderName;
  v3 = [(PKCurrencyAmount *)self->_amount formattedStringValue];
  id v4 = PKLocalizedNearbyPeerPaymentString(@"NEARBY_SUCCESSFUL_TRANSACTION_GHOST_PASS_SETUP_MESSAGE", @"%@%@", senderName, v3);

  return v4;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDPeerPaymentNearbySetupUserNotification;
  id v4 = [(PDUserNotification *)&v8 notificationContentWithDataSource:a3];
  objc_super v5 = [(PDPeerPaymentNearbySetupUserNotification *)self _titleString];
  [v4 setSubtitle:v5];

  uint64_t v6 = [(PDPeerPaymentNearbySetupUserNotification *)self _messageString];
  [v4 setBody:v6];

  return v4;
}

- (unint64_t)notificationType
{
  return 80;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end