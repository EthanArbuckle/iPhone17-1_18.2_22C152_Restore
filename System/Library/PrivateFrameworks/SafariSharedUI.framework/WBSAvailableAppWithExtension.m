@interface WBSAvailableAppWithExtension
- (BOOL)isEqual:(id)a3;
- (NSString)adamID;
- (NSString)platformSpecificBundleID;
- (NSString)requiredTeamID;
- (WBSAvailableAppWithExtension)initWithAdamID:(id)a3 platformSpecificBundleID:(id)a4;
- (unint64_t)hash;
- (void)setRequiredTeamID:(id)a3;
@end

@implementation WBSAvailableAppWithExtension

- (WBSAvailableAppWithExtension)initWithAdamID:(id)a3 platformSpecificBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSAvailableAppWithExtension;
  v8 = [(WBSAvailableAppWithExtension *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    adamID = v8->_adamID;
    v8->_adamID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    platformSpecificBundleID = v8->_platformSpecificBundleID;
    v8->_platformSpecificBundleID = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [v4 adamID];
    if (WBSIsEqual())
    {
      id v6 = [v4 platformSpecificBundleID];
      char v7 = WBSIsEqual();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  if (self->_platformSpecificBundleID) {
    platformSpecificBundleID = (__CFString *)self->_platformSpecificBundleID;
  }
  else {
    platformSpecificBundleID = &stru_1F031A860;
  }
  id v3 = [(NSString *)self->_adamID stringByAppendingString:platformSpecificBundleID];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (NSString)platformSpecificBundleID
{
  return self->_platformSpecificBundleID;
}

- (NSString)requiredTeamID
{
  return self->_requiredTeamID;
}

- (void)setRequiredTeamID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredTeamID, 0);
  objc_storeStrong((id *)&self->_platformSpecificBundleID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end