@interface PDPassAccountStateChangeUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (BOOL)requiresDebtCollectionNotices;
- (PDPassAccountStateChangeUserNotification)initWithAccountIdentifier:(id)a3 accountState:(unint64_t)a4 accountStateReason:(unint64_t)a5 featureIdentifier:(unint64_t)a6;
- (PDPassAccountStateChangeUserNotification)initWithCoder:(id)a3;
- (PDPassAccountStateChangeUserNotification)initWithPassUniqueIdentifier:(id)a3 accountState:(unint64_t)a4 accountStateReason:(unint64_t)a5 accessLevel:(unint64_t)a6 featureIdentifier:(unint64_t)a7 requiresDebtCollectionNotices:(BOOL)a8;
- (id)_messageStringWithGenericMessaging:(BOOL)a3;
- (id)_titleStringWithGenericMessaging:(BOOL)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)accessLevel;
- (unint64_t)accountState;
- (unint64_t)accountStateReason;
- (unint64_t)featureIdentifier;
- (unint64_t)notificationType;
- (void)_updateAutoDismissal;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassAccountStateChangeUserNotification

- (PDPassAccountStateChangeUserNotification)initWithPassUniqueIdentifier:(id)a3 accountState:(unint64_t)a4 accountStateReason:(unint64_t)a5 accessLevel:(unint64_t)a6 featureIdentifier:(unint64_t)a7 requiresDebtCollectionNotices:(BOOL)a8
{
  v16.receiver = self;
  v16.super_class = (Class)PDPassAccountStateChangeUserNotification;
  v13 = [(PDUserNotification *)&v16 initWithNotificationIdentifier:@"accountStateChange" forPassUniqueIdentifier:a3];
  v14 = v13;
  if (v13)
  {
    v13->_featureIdentifier = a7;
    v13->_requiresDebtCollectionNotices = a8;
    v13->_accountState = a4;
    v13->_accountStateReason = a5;
    v13->_accessLevel = a6;
    [(PDPassAccountStateChangeUserNotification *)v13 _updateAutoDismissal];
  }
  return v14;
}

- (PDPassAccountStateChangeUserNotification)initWithAccountIdentifier:(id)a3 accountState:(unint64_t)a4 accountStateReason:(unint64_t)a5 featureIdentifier:(unint64_t)a6
{
  v12.receiver = self;
  v12.super_class = (Class)PDPassAccountStateChangeUserNotification;
  v9 = [(PDUserNotification *)&v12 initWithNotificationIdentifier:@"accountStateChange" forAccountIdentifier:a3];
  v10 = v9;
  if (v9)
  {
    v9->_featureIdentifier = a6;
    v9->_requiresDebtCollectionNotices = 0;
    v9->_accountState = a4;
    v9->_accountStateReason = a5;
    v9->_accessLevel = 0;
    [(PDPassAccountStateChangeUserNotification *)v9 _updateAutoDismissal];
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassAccountStateChangeUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PDPassAccountStateChangeUserNotification;
  v5 = [(PDUserNotification *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_featureIdentifier = (unint64_t)[v4 decodeIntegerForKey:@"accountFeatureIdentifier"];
    v5->_accountState = (unint64_t)[v4 decodeIntegerForKey:@"accountState"];
    v5->_accountStateReason = (unint64_t)[v4 decodeIntegerForKey:@"accountStateReason"];
    v5->_accessLevel = (unint64_t)[v4 decodeIntegerForKey:@"accountAccessLevel"];
    v5->_requiresDebtCollectionNotices = [v4 decodeBoolForKey:@"debtCollectionNotices"];
    [(PDPassAccountStateChangeUserNotification *)v5 _updateAutoDismissal];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassAccountStateChangeUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_accountState, @"accountState", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_accountStateReason forKey:@"accountStateReason"];
  [v4 encodeInteger:self->_featureIdentifier forKey:@"accountFeatureIdentifier"];
  [v4 encodeInteger:self->_accessLevel forKey:@"accountAccessLevel"];
  [v4 encodeBool:self->_requiresDebtCollectionNotices forKey:@"debtCollectionNotices"];
}

- (void)_updateAutoDismissal
{
  BOOL v2 = self->_featureIdentifier == 2 && self->_accountStateReason == 8;
  [(PDUserNotification *)self setPreventAutomaticDismissal:v2];
}

- (id)_titleStringWithGenericMessaging:(BOOL)a3
{
  unint64_t accessLevel = self->_accessLevel;
  if (accessLevel >= 2)
  {
    if (accessLevel != 2)
    {
      v6 = 0;
      goto LABEL_7;
    }
    uint64_t v5 = PKLocalizedMadisonString(@"SHARING_STOPPED_TITLE");
  }
  else
  {
    uint64_t v5 = PKLocalizedFeatureString();
  }
  v6 = (void *)v5;
LABEL_7:
  unint64_t featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier == 2)
  {
    if (self->_accountStateReason != 8) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (featureIdentifier == 5 && self->_accountState == 4)
  {
LABEL_12:
    uint64_t v8 = PKLocalizedFeatureString();

    v6 = (void *)v8;
  }
LABEL_13:
  return v6;
}

- (id)_messageStringWithGenericMessaging:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t accessLevel = self->_accessLevel;
  if (accessLevel >= 2)
  {
    if (accessLevel == 2)
    {
      objc_super v7 = PKLocalizedMadisonString(@"SHARING_STOPPED_MESSAGE");
    }
    else
    {
      objc_super v7 = 0;
    }
  }
  else
  {
    v6 = PDDeviceSpecificLocalizedStringKeyForKey();
    objc_super v7 = PKLocalizedFeatureString();
  }
  unint64_t featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier == 2)
  {
    if (self->_accountStateReason != 8) {
      goto LABEL_20;
    }
    if (self->_requiresDebtCollectionNotices || v3)
    {
      uint64_t v11 = PDDeviceSpecificLocalizedStringKeyForKey();
      uint64_t v12 = PKLocalizedFeatureString();

      objc_super v7 = (void *)v11;
LABEL_19:

      objc_super v7 = (void *)v12;
      goto LABEL_20;
    }
LABEL_18:
    uint64_t v12 = PKLocalizedFeatureString();
    goto LABEL_19;
  }
  if (featureIdentifier == 5)
  {
    unint64_t accountState = self->_accountState;
    if (accountState == 4 || accountState == 3 || accountState == 2) {
      goto LABEL_18;
    }
  }
LABEL_20:
  return v7;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PDPassAccountStateChangeUserNotification;
  id v4 = a3;
  uint64_t v5 = [(PDUserNotification *)&v12 notificationContentWithDataSource:v4];
  v6 = objc_msgSend(v4, "notificationSettings", v12.receiver, v12.super_class);

  BOOL v7 = [v6 showPreviewsSetting] == 0;
  uint64_t v8 = [(PDPassAccountStateChangeUserNotification *)self _titleStringWithGenericMessaging:v7];
  [v5 setTitle:v8];

  v9 = [(PDPassAccountStateChangeUserNotification *)self _messageStringWithGenericMessaging:v7];
  [v5 setBody:v9];

  v10 = [(PDUserNotification *)self date];
  [v5 setDate:v10];

  if (self->_featureIdentifier == 2 && self->_accountStateReason == 8) {
    [v5 setInterruptionLevel:2];
  }

  return v5;
}

- (BOOL)isValid
{
  unint64_t featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier == 3 || featureIdentifier == 5) {
    return 1;
  }
  unint64_t accountState = self->_accountState;
  if (accountState == 2) {
    return 1;
  }
  if (accountState != 4) {
    return 0;
  }
  BOOL result = self->_accessLevel == 2;
  if (self->_accountStateReason == 8) {
    return 1;
  }
  return result;
}

- (unint64_t)notificationType
{
  return 20;
}

- (unint64_t)accountState
{
  return self->_accountState;
}

- (unint64_t)accountStateReason
{
  return self->_accountStateReason;
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (BOOL)requiresDebtCollectionNotices
{
  return self->_requiresDebtCollectionNotices;
}

@end