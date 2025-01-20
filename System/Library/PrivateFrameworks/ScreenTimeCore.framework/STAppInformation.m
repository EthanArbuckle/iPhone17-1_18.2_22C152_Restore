@interface STAppInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)distributorIsThirdParty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAppInformation:(id)a3;
- (NSData)iconData;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (NSString)distributorID;
- (STAppInformation)initWithBundleIdentifier:(id)a3 displayName:(id)a4 iconData:(id)a5 distributorID:(id)a6 distributorIsThirdParty:(BOOL)a7 adamID:(unint64_t)a8 versionIdentifier:(unint64_t)a9 betaVersionIdentifier:(unint64_t)a10;
- (STAppInformation)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)adamID;
- (unint64_t)betaVersionIdentifier;
- (unint64_t)hash;
- (unint64_t)versionIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STAppInformation

- (STAppInformation)initWithBundleIdentifier:(id)a3 displayName:(id)a4 iconData:(id)a5 distributorID:(id)a6 distributorIsThirdParty:(BOOL)a7 adamID:(unint64_t)a8 versionIdentifier:(unint64_t)a9 betaVersionIdentifier:(unint64_t)a10
{
  v29.receiver = self;
  v29.super_class = (Class)STAppInformation;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [(STAppInformation *)&v29 init];
  v19->_adamID = a8;
  v19->_betaVersionIdentifier = a10;
  v20 = (NSString *)objc_msgSend(v18, "copy", v29.receiver, v29.super_class);

  bundleIdentifier = v19->_bundleIdentifier;
  v19->_bundleIdentifier = v20;

  v22 = (NSString *)[v15 copy];
  distributorID = v19->_distributorID;
  v19->_distributorID = v22;

  v19->_distributorIsThirdParty = a7;
  v24 = (NSString *)[v17 copy];

  displayName = v19->_displayName;
  v19->_displayName = v24;

  v19->_versionIdentifier = a9;
  v26 = (NSData *)[v16 copy];

  iconData = v19->_iconData;
  v19->_iconData = v26;

  return v19;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STAppInformation *)self bundleIdentifier];
  v5 = [(STAppInformation *)self displayName];
  v6 = +[NSString stringWithFormat:@"<%@ { BundleID: %@, DisplayName: %@ }>", v3, v4, v5];

  return v6;
}

- (STAppInformation)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"iconData"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"distributorID"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"distributorIsThirdParty"];
  id v9 = [v8 BOOLValue];

  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"adamID"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"versionIdentifier"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"betaVersionIdentifier"];

  v13 = -[STAppInformation initWithBundleIdentifier:displayName:iconData:distributorID:distributorIsThirdParty:adamID:versionIdentifier:betaVersionIdentifier:](self, "initWithBundleIdentifier:displayName:iconData:distributorID:distributorIsThirdParty:adamID:versionIdentifier:betaVersionIdentifier:", v4, v5, v6, v7, v9, [v10 unsignedLongLongValue], objc_msgSend(v11, "unsignedLongLongValue"), objc_msgSend(v12, "unsignedLongLongValue"));
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(STAppInformation *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  v6 = [(STAppInformation *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  v7 = [(STAppInformation *)self iconData];
  [v4 encodeObject:v7 forKey:@"iconData"];

  v8 = [(STAppInformation *)self distributorID];
  [v4 encodeObject:v8 forKey:@"distributorID"];

  id v9 = +[NSNumber numberWithBool:[(STAppInformation *)self distributorIsThirdParty]];
  [v4 encodeObject:v9 forKey:@"distributorIsThirdParty"];

  v10 = +[NSNumber numberWithUnsignedLongLong:[(STAppInformation *)self adamID]];
  [v4 encodeObject:v10 forKey:@"adamID"];

  v11 = +[NSNumber numberWithUnsignedLongLong:[(STAppInformation *)self versionIdentifier]];
  [v4 encodeObject:v11 forKey:@"versionIdentifier"];

  id v12 = +[NSNumber numberWithUnsignedLongLong:[(STAppInformation *)self betaVersionIdentifier]];
  [v4 encodeObject:v12 forKey:@"betaVersionIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBundleIdentifier:displayName:iconData:distributorID:distributorIsThirdParty:adamID:versionIdentifier:betaVersionIdentifier:", self->_bundleIdentifier, self->_displayName, self->_iconData, self->_distributorID, self->_distributorIsThirdParty, self->_adamID, self->_versionIdentifier, self->_betaVersionIdentifier);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STAppInformation *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STAppInformation *)self isEqualToAppInformation:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToAppInformation:(id)a3
{
  id v4 = (STAppInformation *)a3;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    BOOL v5 = [(STAppInformation *)self bundleIdentifier];
    v6 = [(STAppInformation *)v4 bundleIdentifier];
    if ([v5 isEqualToString:v6])
    {
      v7 = [(STAppInformation *)self displayName];
      v8 = [(STAppInformation *)v4 displayName];
      unsigned __int8 v9 = [v7 isEqualToString:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(STAppInformation *)self bundleIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (unint64_t)adamID
{
  return self->_adamID;
}

- (unint64_t)betaVersionIdentifier
{
  return self->_betaVersionIdentifier;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)distributorID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)distributorIsThirdParty
{
  return self->_distributorIsThirdParty;
}

- (NSData)iconData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_distributorID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end