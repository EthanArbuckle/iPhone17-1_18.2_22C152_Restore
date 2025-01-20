@interface PDAccountPendingFamilyMemberReminderNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForAltDSID:(id)a3;
- (BOOL)isValid;
- (PDAccountPendingFamilyMemberReminderNotification)initWithCoder:(id)a3;
- (PDAccountPendingFamilyMemberReminderNotification)initWithFamilyMember:(id)a3 accountIdentifier:(id)a4 passUniqueIdentifier:(id)a5;
- (PKFamilyMember)familyMember;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountPendingFamilyMemberReminderNotification

+ (id)notificationIdentifierForAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"accountPendingFamilyMemberReminder-%@", v3];

  return v4;
}

- (PDAccountPendingFamilyMemberReminderNotification)initWithFamilyMember:(id)a3 accountIdentifier:(id)a4 passUniqueIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_opt_class();
  v13 = [v9 altDSID];
  v14 = [v12 notificationIdentifierForAltDSID:v13];

  v19.receiver = self;
  v19.super_class = (Class)PDAccountPendingFamilyMemberReminderNotification;
  v15 = [(PDUserNotification *)&v19 initWithNotificationIdentifier:v14 forPassUniqueIdentifier:v11];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_familyMember, a3);
    [(PDUserNotification *)v15 setAccountIdentifier:v10];
    [(PDUserNotification *)v15 setCustomActionRoute:PKURLActionRouteCreditAccountAddUser];
    v16 = +[NSDate date];
    v17 = [v16 dateByAddingTimeInterval:300.0];
    [(PDUserNotification *)v15 setDate:v17];
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountPendingFamilyMemberReminderNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDAccountPendingFamilyMemberReminderNotification;
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
  v5.super_class = (Class)PDAccountPendingFamilyMemberReminderNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_familyMember, @"familyMember", v5.receiver, v5.super_class);
}

- (unint64_t)notificationType
{
  return 38;
}

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)PDAccountPendingFamilyMemberReminderNotification;
  if (![(PDUserNotification *)&v6 isValid] || !self->_familyMember) {
    return 0;
  }
  id v3 = [(PDUserNotification *)self accountIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDAccountPendingFamilyMemberReminderNotification;
  BOOL v4 = [(PDUserNotification *)&v8 notificationContentWithDataSource:a3];
  objc_super v5 = [(PDAccountPendingFamilyMemberReminderNotification *)self _titleString];
  [v4 setSubtitle:v5];
  objc_super v6 = [(PDAccountPendingFamilyMemberReminderNotification *)self _messageString];
  [v4 setBody:v6];

  return v4;
}

- (id)_titleString
{
  return (id)PKLocalizedMadisonString(@"SHARING_INVITATION_FAMILY_MEMBER_REMINDER_TITLE");
}

- (id)_messageString
{
  return (id)PKLocalizedMadisonString(@"SHARING_INVITATION_FAMILY_MEMBER_REMINDER_MESSAGE");
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void).cxx_destruct
{
}

@end