@interface PDPeerPaymentGraduationUserNotification
+ (BOOL)supportsSecureCoding;
- (PDPeerPaymentGraduationUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentGraduationUserNotification)initWithPassUniqueIdentifier:(id)a3 familyMember:(id)a4;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)familyNotificationType;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentGraduationUserNotification

- (PDPeerPaymentGraduationUserNotification)initWithPassUniqueIdentifier:(id)a3 familyMember:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 altDSID];
  v10 = +[NSString stringWithFormat:@"peerPaymentGraduation-%@", v9];

  v13.receiver = self;
  v13.super_class = (Class)PDPeerPaymentGraduationUserNotification;
  v11 = [(PDUserNotification *)&v13 initWithNotificationIdentifier:v10 forPassUniqueIdentifier:v8];

  if (v11) {
    objc_storeStrong((id *)&v11->_familyMember, a4);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentGraduationUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDPeerPaymentGraduationUserNotification;
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
  v5.super_class = (Class)PDPeerPaymentGraduationUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_familyMember, @"familyMember", v5.receiver, v5.super_class);
}

- (id)_titleString
{
  return (id)PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_GRADUATION_NOTIFICATION_TITLE");
}

- (id)_messageString
{
  v2 = [(PKFamilyMember *)self->_familyMember firstName];
  v3 = PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_GRADUATION_NOTIFICATION_MESSAGE", @"%@", v2);

  return v3;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PDPeerPaymentGraduationUserNotification;
  id v4 = [(PDUserNotification *)&v9 notificationContentWithDataSource:a3];
  objc_super v5 = [(PDPeerPaymentGraduationUserNotification *)self _titleString];
  [v4 setSubtitle:v5];

  uint64_t v6 = [(PDPeerPaymentGraduationUserNotification *)self _messageString];
  [v4 setBody:v6];

  id v7 = [(PDUserNotification *)self date];
  [v4 setDate:v7];

  return v4;
}

- (unint64_t)notificationType
{
  return 33;
}

- (unint64_t)familyNotificationType
{
  return self->_familyMember != 0;
}

- (void).cxx_destruct
{
}

@end