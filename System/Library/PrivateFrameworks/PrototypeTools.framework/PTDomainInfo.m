@interface PTDomainInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)domainGroupName;
- (NSString)domainName;
- (NSString)settingsClassName;
- (NSString)settingsFrameworkBundlePath;
- (NSString)uniqueIdentifier;
- (PTDomainInfo)initWithCoder:(id)a3;
- (PTDomainInfo)initWithDomain:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)loadSettingsClassBundleIfNecessary;
@end

@implementation PTDomainInfo

- (PTDomainInfo)initWithDomain:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PTDomainInfo;
  v5 = [(PTDomainInfo *)&v19 init];
  if (v5)
  {
    v6 = objc_opt_class();
    uint64_t v7 = [v6 domainGroupName];
    domainGroupName = v5->_domainGroupName;
    v5->_domainGroupName = (NSString *)v7;

    uint64_t v9 = [v6 domainName];
    domainName = v5->_domainName;
    v5->_domainName = (NSString *)v9;

    v11 = (objc_class *)[v6 rootSettingsClass];
    if (v11)
    {
      v12 = v11;
      uint64_t v13 = NSStringFromClass(v11);
      settingsClassName = v5->_settingsClassName;
      v5->_settingsClassName = (NSString *)v13;

      v15 = [MEMORY[0x1E4F28B50] bundleForClass:v12];
      uint64_t v16 = [v15 bundlePath];
      settingsFrameworkBundlePath = v5->_settingsFrameworkBundlePath;
      v5->_settingsFrameworkBundlePath = (NSString *)v16;
    }
  }

  return v5;
}

- (NSString)uniqueIdentifier
{
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    id v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v5 = [(NSString *)self->_domainGroupName componentsSeparatedByCharactersInSet:v4];
    v6 = [v5 componentsJoinedByString:&stru_1F19C8540];

    uint64_t v7 = [(NSString *)self->_domainName componentsSeparatedByCharactersInSet:v4];
    v8 = [v7 componentsJoinedByString:&stru_1F19C8540];

    uint64_t v9 = [NSString stringWithFormat:@"%@-%@", v6, v8];
    v10 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v9;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  return uniqueIdentifier;
}

- (void)loadSettingsClassBundleIfNecessary
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = self;
  v3 = [(PTDomainInfo *)v2 settingsClassName];
  id v4 = v3;
  if (v3 && !NSClassFromString(v3))
  {
    v5 = [(PTDomainInfo *)v2 settingsFrameworkBundlePath];
    if (!v5)
    {
LABEL_18:

      goto LABEL_19;
    }
    v6 = [MEMORY[0x1E4F28B50] bundleWithPath:v5];
    uint64_t v7 = v6;
    if (!v6)
    {
      uint64_t v9 = PTLogObjectForTopic(2);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        objc_super v19 = v4;
        __int16 v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_1BEC4F000, v9, OS_LOG_TYPE_DEFAULT, "No bundle found for settings class '%@' at path %@", buf, 0x16u);
      }
      goto LABEL_17;
    }
    id v17 = 0;
    char v8 = [v6 loadAndReturnError:&v17];
    uint64_t v9 = v17;
    if ((v8 & 1) == 0)
    {
      v11 = PTLogObjectForTopic(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [v9 localizedDescription];
        *(_DWORD *)buf = 138412546;
        objc_super v19 = (NSString *)v5;
        __int16 v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_1BEC4F000, v11, OS_LOG_TYPE_DEFAULT, "Unable to load settings bundle at path %@: %@", buf, 0x16u);
      }
      goto LABEL_16;
    }
    Class v10 = NSClassFromString(v4);
    v11 = PTLogObjectForTopic(2);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        objc_super v19 = v4;
        uint64_t v13 = "Successfully loaded bundle for settings class '%@'";
        v14 = v11;
        uint32_t v15 = 12;
LABEL_15:
        _os_log_impl(&dword_1BEC4F000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
    else if (v12)
    {
      *(_DWORD *)buf = 138412546;
      objc_super v19 = v4;
      __int16 v20 = 2112;
      v21 = v5;
      uint64_t v13 = "Unable to find settings class '%@' even after loading bundle at path %@";
      v14 = v11;
      uint32_t v15 = 22;
      goto LABEL_15;
    }
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
LABEL_19:
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && BSEqualStrings()
    && BSEqualStrings()
    && BSEqualStrings())
  {
    char v4 = BSEqualStrings();
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_domainGroupName];
  id v5 = (id)[v3 appendString:self->_domainName];
  id v6 = (id)[v3 appendString:self->_settingsClassName];
  id v7 = (id)[v3 appendString:self->_settingsFrameworkBundlePath];
  unint64_t v8 = [v3 hash];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  domainName = self->_domainName;
  id v5 = a3;
  [v5 encodeObject:domainName forKey:@"domainName"];
  [v5 encodeObject:self->_settingsClassName forKey:@"settingsClassName"];
  [v5 encodeObject:self->_settingsFrameworkBundlePath forKey:@"settingsBundlePath"];
  [v5 encodeObject:self->_domainGroupName forKey:@"groupName"];
}

- (PTDomainInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PTDomainInfo;
  id v5 = [(PTDomainInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainName"];
    domainName = v5->_domainName;
    v5->_domainName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"settingsClassName"];
    settingsClassName = v5->_settingsClassName;
    v5->_settingsClassName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"settingsBundlePath"];
    settingsFrameworkBundlePath = v5->_settingsFrameworkBundlePath;
    v5->_settingsFrameworkBundlePath = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
    domainGroupName = v5->_domainGroupName;
    v5->_domainGroupName = (NSString *)v12;
  }
  return v5;
}

- (NSString)domainGroupName
{
  return self->_domainGroupName;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (NSString)settingsClassName
{
  return self->_settingsClassName;
}

- (NSString)settingsFrameworkBundlePath
{
  return self->_settingsFrameworkBundlePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsFrameworkBundlePath, 0);
  objc_storeStrong((id *)&self->_settingsClassName, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_domainGroupName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end