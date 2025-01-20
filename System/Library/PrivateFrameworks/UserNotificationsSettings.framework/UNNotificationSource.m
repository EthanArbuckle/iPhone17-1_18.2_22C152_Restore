@interface UNNotificationSource
+ (BOOL)supportsSecureCoding;
- (BOOL)isHiddenFromSettings;
- (NSString)bundlePath;
- (NSString)displayName;
- (NSString)sourceIdentifier;
- (UNNotificationIcon)icon;
- (UNNotificationSource)initWithCoder:(id)a3;
- (UNNotificationSource)initWithIdentifier:(id)a3 isHidden:(BOOL)a4 displayName:(id)a5 icon:(id)a6 settings:(id)a7 bundlePath:(id)a8;
- (UNNotificationSourceSettings)sourceSettings;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationSource

- (UNNotificationSource)initWithIdentifier:(id)a3 isHidden:(BOOL)a4 displayName:(id)a5 icon:(id)a6 settings:(id)a7 bundlePath:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)UNNotificationSource;
  v19 = [(UNNotificationSource *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    sourceIdentifier = v19->_sourceIdentifier;
    v19->_sourceIdentifier = (NSString *)v20;

    v19->_isHiddenFromSettings = a4;
    uint64_t v22 = [v15 copy];
    displayName = v19->_displayName;
    v19->_displayName = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    icon = v19->_icon;
    v19->_icon = (UNNotificationIcon *)v24;

    uint64_t v26 = [v17 copy];
    sourceSettings = v19->_sourceSettings;
    v19->_sourceSettings = (UNNotificationSourceSettings *)v26;

    uint64_t v28 = [v18 copy];
    bundlePath = v19->_bundlePath;
    v19->_bundlePath = (NSString *)v28;
  }
  return v19;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(UNNotificationSource *)self sourceIdentifier];
  if ([(UNNotificationSource *)self isHiddenFromSettings]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [(UNNotificationSource *)self displayName];
  v8 = [(UNNotificationSource *)self icon];
  v9 = [(UNNotificationSource *)self sourceSettings];
  v10 = [(UNNotificationSource *)self bundlePath];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: %@ isHidden: %@, displayName: %@, icon: %@, source settings: %@, bundlePath: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
  v11 = v10);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UNNotificationSource *)self sourceIdentifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationSource isHiddenFromSettings](self, "isHiddenFromSettings"), @"isHidden");
  v6 = [(UNNotificationSource *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  v7 = [(UNNotificationSource *)self icon];
  [v4 encodeObject:v7 forKey:@"icon"];

  v8 = [(UNNotificationSource *)self sourceSettings];
  [v4 encodeObject:v8 forKey:@"sourceSettings"];

  id v9 = [(UNNotificationSource *)self bundlePath];
  [v4 encodeObject:v9 forKey:@"bundlePath"];
}

- (UNNotificationSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [v4 decodeBoolForKey:@"isHidden"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceSettings"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundlePath"];

  v11 = [(UNNotificationSource *)self initWithIdentifier:v5 isHidden:v6 displayName:v7 icon:v8 settings:v9 bundlePath:v10];
  return v11;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (BOOL)isHiddenFromSettings
{
  return self->_isHiddenFromSettings;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (UNNotificationIcon)icon
{
  return self->_icon;
}

- (UNNotificationSourceSettings)sourceSettings
{
  return self->_sourceSettings;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_sourceSettings, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

@end