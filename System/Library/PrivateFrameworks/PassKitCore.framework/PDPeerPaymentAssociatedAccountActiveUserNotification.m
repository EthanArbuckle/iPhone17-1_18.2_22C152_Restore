@interface PDPeerPaymentAssociatedAccountActiveUserNotification
+ (BOOL)supportsSecureCoding;
- (PDPeerPaymentAssociatedAccountActiveUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentAssociatedAccountActiveUserNotification)initWithPassUniqueIdentifier:(id)a3 familyMember:(id)a4;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)familyNotificationType;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentAssociatedAccountActiveUserNotification

- (PDPeerPaymentAssociatedAccountActiveUserNotification)initWithPassUniqueIdentifier:(id)a3 familyMember:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 altDSID];
  v10 = +[NSString stringWithFormat:@"peerPaymentAssociatedAccountActive-%@", v9];

  v20.receiver = self;
  v20.super_class = (Class)PDPeerPaymentAssociatedAccountActiveUserNotification;
  v11 = [(PDUserNotification *)&v20 initWithNotificationIdentifier:v10 forPassUniqueIdentifier:v8];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_familyMember, a4);
    v12 = [(PKFamilyMember *)v11->_familyMember appleID];
    v13 = PKPeerPaymentGetSendPaymentSensitiveURL();

    v14 = [v13 absoluteString];
    [(PDUserNotification *)v11 setCustomActionURLString:v14];

    v15 = +[NSDate date];
    if (PKIsAltAccountPairedOrPairing())
    {
      v16 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Currently pairing a tinker watch. Delaying the associated account active notification by 10 minutes", buf, 2u);
      }

      uint64_t v17 = [v15 dateByAddingTimeInterval:600.0];

      v15 = (void *)v17;
    }
    [(PDUserNotification *)v11 setDate:v15];
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentAssociatedAccountActiveUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDPeerPaymentAssociatedAccountActiveUserNotification;
  v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyMember"];
    familyMember = v5->_familyMember;
    v5->_familyMember = (PKFamilyMember *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPeerPaymentAssociatedAccountActiveUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_familyMember, @"familyMember", v5.receiver, v5.super_class);
}

- (id)_titleString
{
  v2 = [(PKFamilyMember *)self->_familyMember firstName];
  v3 = PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_ASSOCIATED_ACCOUNT_ACTIVE_NOTIFICATION_TITLE", @"%@", v2);

  return v3;
}

- (id)_messageString
{
  return (id)PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_ASSOCIATED_ACCOUNT_ACTIVE_NOTIFICATION_MESSAGE");
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDPeerPaymentAssociatedAccountActiveUserNotification;
  id v4 = [(PDUserNotification *)&v8 notificationContentWithDataSource:a3];
  objc_super v5 = [(PDPeerPaymentAssociatedAccountActiveUserNotification *)self _titleString];
  [v4 setSubtitle:v5];

  uint64_t v6 = [(PDPeerPaymentAssociatedAccountActiveUserNotification *)self _messageString];
  [v4 setBody:v6];

  return v4;
}

- (unint64_t)notificationType
{
  return 36;
}

- (unint64_t)familyNotificationType
{
  return self->_familyMember != 0;
}

- (void).cxx_destruct
{
}

@end