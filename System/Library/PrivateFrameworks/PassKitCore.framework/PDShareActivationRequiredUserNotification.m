@interface PDShareActivationRequiredUserNotification
+ (BOOL)supportsSecureCoding;
- (NSString)shareIdentifier;
- (PDShareActivationRequiredUserNotification)initWithCoder:(id)a3;
- (PDShareActivationRequiredUserNotification)initWithTitle:(id)a3 message:(id)a4 shareIdentifier:(id)a5;
- (id)description;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDShareActivationRequiredUserNotification

- (PDShareActivationRequiredUserNotification)initWithTitle:(id)a3 message:(id)a4 shareIdentifier:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PDShareActivationRequiredUserNotification;
  v9 = [(PDGenericUserNotification *)&v12 initWithTitle:a3 message:a4 forPassUniqueIdentifier:0];
  if (v9)
  {
    v10 = +[NSString stringWithFormat:@"wallet://%@/%@/%@", PKURLActionShare, v8, PKURLActionShareActivateShare];
    [(PDUserNotification *)v9 setCustomActionURLString:v10];

    [(PDUserNotification *)v9 setReissueBannerOnUpdate:1];
  }

  return v9;
}

- (unint64_t)notificationType
{
  return 48;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@: %p; ", v4, self];

  [v5 appendFormat:@"shareIdentifier: '%@'; ", self->_shareIdentifier];
  [v5 appendFormat:@">"];
  v6 = +[NSString stringWithString:v5];

  return v6;
}

- (PDShareActivationRequiredUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDShareActivationRequiredUserNotification;
  v5 = [(PDGenericUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareIdentifier"];
    shareIdentifier = v5->_shareIdentifier;
    v5->_shareIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDShareActivationRequiredUserNotification;
  id v4 = a3;
  [(PDGenericUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_shareIdentifier, @"shareIdentifier", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void).cxx_destruct
{
}

@end