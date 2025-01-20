@interface NCEventTrackerNotificationMetadata
+ (id)metadataForNotificationRequest:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)bundleIdentifier;
- (NSString)notificationIdentifier;
- (id)_initWithNotificationIdentifier:(id)a3 bundleIdentifier:(id)a4 date:(id)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation NCEventTrackerNotificationMetadata

+ (id)metadataForNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 notificationIdentifier];
  v7 = [v4 sectionIdentifier];
  v8 = [v4 timestamp];

  v9 = (void *)[v5 _initWithNotificationIdentifier:v6 bundleIdentifier:v7 date:v8];

  return v9;
}

- (id)_initWithNotificationIdentifier:(id)a3 bundleIdentifier:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NCEventTrackerNotificationMetadata;
  v11 = [(NCEventTrackerNotificationMetadata *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    notificationIdentifier = v11->_notificationIdentifier;
    v11->_notificationIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    date = v11->_date;
    v11->_date = (NSDate *)v16;
  }
  return v11;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(NCEventTrackerNotificationMetadata *)self notificationIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"notification identifier"];

  v6 = [(NCEventTrackerNotificationMetadata *)self bundleIdentifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"bundle identifier"];

  id v8 = [(NCEventTrackerNotificationMetadata *)self date];
  id v9 = (id)[v3 appendObject:v8 withName:@"date"];

  id v10 = [v3 build];

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(NCEventTrackerNotificationMetadata *)self notificationIdentifier];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(NCEventTrackerNotificationMetadata *)self bundleIdentifier];
  id v7 = (id)[v3 appendObject:v6];

  id v8 = [(NCEventTrackerNotificationMetadata *)self date];
  id v9 = (id)[v3 appendObject:v8];

  unint64_t v10 = [v3 hash];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NCEventTrackerNotificationMetadata *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      && (id v5 = v4) != 0)
    {
      v6 = v5;
      id v7 = [(NCEventTrackerNotificationMetadata *)self notificationIdentifier];
      id v8 = [(NCEventTrackerNotificationMetadata *)v6 notificationIdentifier];
      if (BSEqualObjects())
      {
        id v9 = [(NCEventTrackerNotificationMetadata *)self bundleIdentifier];
        unint64_t v10 = [(NCEventTrackerNotificationMetadata *)v6 bundleIdentifier];
        if (BSEqualObjects())
        {
          v11 = [(NCEventTrackerNotificationMetadata *)self date];
          uint64_t v12 = [(NCEventTrackerNotificationMetadata *)v6 date];
          char v13 = BSEqualObjects();
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (NSString)notificationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_notificationIdentifier, 0);
}

@end