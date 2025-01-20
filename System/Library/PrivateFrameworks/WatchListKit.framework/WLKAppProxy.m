@interface WLKAppProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)isAppStoreVendable;
- (BOOL)isBetaApp;
- (BOOL)isEntitled;
- (BOOL)isSystemApp;
- (BOOL)isTVApp;
- (BOOL)supportsTVApp;
- (NSNumber)itemID;
- (NSString)bundleIdentifier;
- (NSString)subscriptionInfo;
- (NSString)version;
- (WLKAppProxy)initWithCoder:(id)a3;
- (WLKAppProxy)initWithDictionary:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WLKAppProxy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (WLKAppProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    v16.receiver = self;
    v16.super_class = (Class)WLKAppProxy;
    v5 = [(WLKAppProxy *)&v16 init];
    if (v5)
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKAppProxy.bundleIdentifier"];
      bundleIdentifier = v5->_bundleIdentifier;
      v5->_bundleIdentifier = (NSString *)v6;

      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKAppProxy.version"];
      version = v5->_version;
      v5->_version = (NSString *)v8;

      v5->_isEntitled = [v4 decodeBoolForKey:@"WLKAppProxy.isEntitled"];
      v5->_isBetaApp = [v4 decodeBoolForKey:@"WLKAppProxy.isBeta"];
      v5->_isAppStoreVendable = [v4 decodeBoolForKey:@"WLKAppProxy.isAppStoreVendable"];
      v5->_isSystemApp = [v4 decodeBoolForKey:@"WLKAppProxy.isSystem"];
      v5->_supportsTVApp = [v4 decodeBoolForKey:@"WLKAppProxy.supportsTVApp"];
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKAppProxy.subscriptionInfo"];
      subscriptionInfo = v5->_subscriptionInfo;
      v5->_subscriptionInfo = (NSString *)v10;

      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKAppProxy.itemID"];
      itemID = v5->_itemID;
      v5->_itemID = (NSNumber *)v12;
    }
    self = v5;
    v14 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v4 encodeObject:self->_bundleIdentifier forKey:@"WLKAppProxy.bundleIdentifier"];
  [v4 encodeObject:self->_version forKey:@"WLKAppProxy.version"];
  [v4 encodeBool:self->_isEntitled forKey:@"WLKAppProxy.isEntitled"];
  [v4 encodeBool:self->_isBetaApp forKey:@"WLKAppProxy.isBeta"];
  [v4 encodeBool:self->_isAppStoreVendable forKey:@"WLKAppProxy.isAppStoreVendable"];
  [v4 encodeBool:self->_isSystemApp forKey:@"WLKAppProxy.isSystem"];
  [v4 encodeBool:self->_supportsTVApp forKey:@"WLKAppProxy.supportsTVApp"];
  [v4 encodeObject:self->_subscriptionInfo forKey:@"WLKAppProxy.subscriptionInfo"];
  [v4 encodeObject:self->_itemID forKey:@"WLKAppProxy.itemID"];
}

- (WLKAppProxy)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)WLKAppProxy;
    v5 = [(WLKAppProxy *)&v16 init];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(v4, "wlk_stringForKey:", @"WLKAppProxy.bundleIdentifier");
      bundleIdentifier = v5->_bundleIdentifier;
      v5->_bundleIdentifier = (NSString *)v6;

      uint64_t v8 = objc_msgSend(v4, "wlk_stringForKey:", @"WLKAppProxy.version");
      version = v5->_version;
      v5->_version = (NSString *)v8;

      v5->_isEntitled = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"WLKAppProxy.isEntitled", 0);
      v5->_isBetaApp = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"WLKAppProxy.isBeta", 0);
      v5->_isAppStoreVendable = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"WLKAppProxy.isAppStoreVendable", 0);
      v5->_isSystemApp = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"WLKAppProxy.isSystem", 0);
      v5->_supportsTVApp = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"WLKAppProxy.supportsTVApp", 0);
      uint64_t v10 = objc_msgSend(v4, "wlk_stringForKey:", @"WLKAppProxy.subscriptionInfo");
      subscriptionInfo = v5->_subscriptionInfo;
      v5->_subscriptionInfo = (NSString *)v10;

      uint64_t v12 = objc_msgSend(v4, "wlk_numberForKey:", @"WLKAppProxy.itemID");
      itemID = v5->_itemID;
      v5->_itemID = (NSNumber *)v12;
    }
    self = v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_bundleIdentifier forKeyedSubscript:@"WLKAppProxy.bundleIdentifier"];
  [v3 setObject:self->_version forKeyedSubscript:@"WLKAppProxy.version"];
  id v4 = [NSNumber numberWithBool:self->_isEntitled];
  [v3 setObject:v4 forKeyedSubscript:@"WLKAppProxy.isEntitled"];

  v5 = [NSNumber numberWithBool:self->_isBetaApp];
  [v3 setObject:v5 forKeyedSubscript:@"WLKAppProxy.isBeta"];

  uint64_t v6 = [NSNumber numberWithBool:self->_isAppStoreVendable];
  [v3 setObject:v6 forKeyedSubscript:@"WLKAppProxy.isAppStoreVendable"];

  v7 = [NSNumber numberWithBool:self->_isSystemApp];
  [v3 setObject:v7 forKeyedSubscript:@"WLKAppProxy.isSystem"];

  uint64_t v8 = [NSNumber numberWithBool:self->_supportsTVApp];
  [v3 setObject:v8 forKeyedSubscript:@"WLKAppProxy.supportsTVApp"];

  [v3 setObject:self->_subscriptionInfo forKeyedSubscript:@"WLKAppProxy.subscriptionInfo"];
  [v3 setObject:self->_itemID forKeyedSubscript:@"WLKAppProxy.itemID"];

  return v3;
}

- (BOOL)isTVApp
{
  v2 = [(WLKAppProxy *)self bundleIdentifier];
  if (v2)
  {
    v3 = WLKTVAppBundleID();
    char v4 = [v2 isEqualToString:v3];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)WLKAppProxy;
  char v4 = [(WLKAppProxy *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ %@", v4, self->_bundleIdentifier];

  return v5;
}

- (NSString)version
{
  return self->_version;
}

- (BOOL)isEntitled
{
  return self->_isEntitled;
}

- (BOOL)isBetaApp
{
  return self->_isBetaApp;
}

- (BOOL)isAppStoreVendable
{
  return self->_isAppStoreVendable;
}

- (BOOL)isSystemApp
{
  return self->_isSystemApp;
}

- (BOOL)supportsTVApp
{
  return self->_supportsTVApp;
}

- (NSString)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end