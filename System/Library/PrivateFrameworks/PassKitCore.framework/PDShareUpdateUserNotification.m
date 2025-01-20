@interface PDShareUpdateUserNotification
+ (BOOL)supportsSecureCoding;
- (NSArray)shareIdentifiers;
- (PDShareUpdateUserNotification)initWithCoder:(id)a3;
- (PDShareUpdateUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 shareIdentifiers:(id)a6;
- (id)description;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDShareUpdateUserNotification

- (PDShareUpdateUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 shareIdentifiers:(id)a6
{
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PDShareUpdateUserNotification;
  v12 = [(PDGenericUserNotification *)&v17 initWithTitle:a3 message:a4 forPassUniqueIdentifier:a5];
  v13 = v12;
  if (v12)
  {
    [(PDUserNotification *)v12 setCustomActionRoute:PKUserNotificationActionRouteViewPass];
    [(PDUserNotification *)v13 setCustomActionVerb:PKUserNotificationActionRouteViewShareDetails];
    objc_storeStrong((id *)&v13->_shareIdentifiers, a6);
    if (v11)
    {
      uint64_t v18 = PKUserNotificationActionQueryItemShareIdentifiers;
      v14 = [v11 componentsJoinedByString:@","];
      v19 = v14;
      v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      [(PDUserNotification *)v13 setCustomActionQueryParameters:v15];
    }
    [(PDUserNotification *)v13 setReissueBannerOnUpdate:1];
  }

  return v13;
}

- (unint64_t)notificationType
{
  return 47;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@: %p; ", v4, self];

  v6 = [(PDUserNotification *)self passUniqueIdentifier];
  [v5 appendFormat:@"passIdentifier: '%@'; ", v6];

  v7 = [(PDGenericUserNotification *)self title];
  [v5 appendFormat:@"title: '%@'; ", v7];

  v8 = [(PDGenericUserNotification *)self message];
  [v5 appendFormat:@"message: '%@'; ", v8];

  [v5 appendFormat:@"shareIdentifiers: '%@'; ", self->_shareIdentifiers];
  [v5 appendFormat:@">"];
  v9 = +[NSString stringWithString:v5];

  return v9;
}

- (PDShareUpdateUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDShareUpdateUserNotification;
  v5 = [(PDGenericUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"shareIdentifiers"];
    shareIdentifiers = v5->_shareIdentifiers;
    v5->_shareIdentifiers = (NSArray *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDShareUpdateUserNotification;
  id v4 = a3;
  [(PDGenericUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_shareIdentifiers, @"shareIdentifiers", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)shareIdentifiers
{
  return self->_shareIdentifiers;
}

- (void).cxx_destruct
{
}

@end