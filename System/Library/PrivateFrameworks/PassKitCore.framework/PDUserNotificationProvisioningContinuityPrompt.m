@interface PDUserNotificationProvisioningContinuityPrompt
+ (BOOL)supportsSecureCoding;
- (NSString)continuitySessionIdentifier;
- (PDUserNotificationProvisioningContinuityPrompt)initWithCoder:(id)a3;
- (PDUserNotificationProvisioningContinuityPrompt)initWithTitle:(id)a3 message:(id)a4 continuitySessionIdentifier:(id)a5;
- (id)description;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDUserNotificationProvisioningContinuityPrompt

- (PDUserNotificationProvisioningContinuityPrompt)initWithTitle:(id)a3 message:(id)a4 continuitySessionIdentifier:(id)a5
{
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PDUserNotificationProvisioningContinuityPrompt;
  v10 = [(PDGenericUserNotification *)&v16 initWithTitle:a3 message:a4 forPassUniqueIdentifier:0];
  v11 = v10;
  if (v10)
  {
    p_continuitySessionIdentifier = &v10->_continuitySessionIdentifier;
    objc_storeStrong((id *)&v10->_continuitySessionIdentifier, a5);
    [(PDUserNotification *)v11 setNotificationIdentifier:*p_continuitySessionIdentifier];
    id v13 = objc_alloc((Class)NSString);
    id v14 = [v13 initWithFormat:@"https://%@/%@/%@", PKWalletUniversalLinkHostName, PKURLActionProvisioningContinuityKey, *p_continuitySessionIdentifier];
    [(PDUserNotification *)v11 setCustomActionURLString:v14];
    [(PDUserNotification *)v11 setReissueBannerOnUpdate:1];
    [(PDUserNotification *)v11 setSuppressionBehavior:0];
    [(PDUserNotification *)v11 setPreventAutomaticDismissal:1];
  }
  return v11;
}

- (unint64_t)notificationType
{
  return 79;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@: %p; ", v4, self];

  [v5 appendFormat:@"continuitySessionIdentifier: '%@'; ", self->_continuitySessionIdentifier];
  v6 = [(PDGenericUserNotification *)self title];
  [v5 appendFormat:@"title: '%@'; ", v6];

  v7 = [(PDGenericUserNotification *)self message];
  [v5 appendFormat:@"message: '%@'; ", v7];

  [v5 appendFormat:@">"];
  v8 = +[NSString stringWithString:v5];

  return v8;
}

- (PDUserNotificationProvisioningContinuityPrompt)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDUserNotificationProvisioningContinuityPrompt;
  v5 = [(PDGenericUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"continuitySessionIdentifier"];
    continuitySessionIdentifier = v5->_continuitySessionIdentifier;
    v5->_continuitySessionIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDUserNotificationProvisioningContinuityPrompt;
  id v4 = a3;
  [(PDGenericUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_continuitySessionIdentifier, @"continuitySessionIdentifier", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)continuitySessionIdentifier
{
  return self->_continuitySessionIdentifier;
}

- (void).cxx_destruct
{
}

@end