@interface FMDExtAccessoryConfiguration
+ (BOOL)supportsSecureCoding;
- (FMDExtAccessoryConfiguration)initWithCoder:(id)a3;
- (FMDExtAccessoryConfiguration)initWithConfigurationInfo:(id)a3;
- (FMDSupportedAccessory)supportedAccessory;
- (NSDictionary)features;
- (NSString)accessoryType;
- (NSString)version;
- (double)detachNotificaitonsWaitTime;
- (double)timeoutForFeature:(id)a3;
- (id)flavorForFeature:(id)a3;
- (id)infoForFeature:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FMDExtAccessoryConfiguration

- (FMDExtAccessoryConfiguration)initWithConfigurationInfo:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FMDExtAccessoryConfiguration;
  v5 = [(FMDExtAccessoryConfiguration *)&v20 init];
  if (!v5) {
    goto LABEL_7;
  }
  v6 = [v4 objectForKeyedSubscript:@"config"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = sub_100059878();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      v18 = "Invalid configuration type %@";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
    }
LABEL_13:

    v16 = 0;
    goto LABEL_14;
  }
  uint64_t v7 = [v6 objectForKeyedSubscript:@"type"];
  accessoryType = v5->_accessoryType;
  v5->_accessoryType = (NSString *)v7;

  uint64_t v9 = [v6 objectForKeyedSubscript:@"version"];
  version = v5->_version;
  v5->_version = (NSString *)v9;

  uint64_t v11 = [v6 objectForKeyedSubscript:@"features"];
  features = v5->_features;
  v5->_features = (NSDictionary *)v11;

  if (!v5->_accessoryType || !v5->_version || !v5->_features)
  {
    v17 = sub_100059878();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      v18 = "Partial configuration received %@";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v13 = [(FMDExtAccessoryConfiguration *)v5 infoForFeature:@"lastKnownLocation"];
  v14 = [[FMDSupportedAccessory alloc] initWithType:v5->_accessoryType locationInfo:v13];
  supportedAccessory = v5->_supportedAccessory;
  v5->_supportedAccessory = v14;

LABEL_7:
  v16 = v5;
LABEL_14:

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDExtAccessoryConfiguration *)self accessoryType];
  [v4 encodeObject:v5 forKey:@"accessoryType"];

  v6 = [(FMDExtAccessoryConfiguration *)self version];
  [v4 encodeObject:v6 forKey:@"version"];

  uint64_t v7 = [(FMDExtAccessoryConfiguration *)self features];
  [v4 encodeObject:v7 forKey:@"features"];

  id v8 = [(FMDExtAccessoryConfiguration *)self supportedAccessory];
  [v4 encodeObject:v8 forKey:@"supportedAccessory"];
}

- (FMDExtAccessoryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FMDExtAccessoryConfiguration;
  v5 = [(FMDExtAccessoryConfiguration *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryType"];
    accessoryType = v5->_accessoryType;
    v5->_accessoryType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"features"];
    features = v5->_features;
    v5->_features = (NSDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportedAccessory"];
    supportedAccessory = v5->_supportedAccessory;
    v5->_supportedAccessory = (FMDSupportedAccessory *)v16;
  }
  return v5;
}

- (id)flavorForFeature:(id)a3
{
  id v4 = a3;
  v5 = [(FMDExtAccessoryConfiguration *)self features];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  if (!v6)
  {
    uint64_t v12 = 0;
    goto LABEL_5;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [(FMDExtAccessoryConfiguration *)self features];
  uint64_t v9 = [v8 objectForKeyedSubscript:v4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(FMDExtAccessoryConfiguration *)self features];
    uint64_t v11 = [v5 objectForKeyedSubscript:v4];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"flavor"];

LABEL_5:
    goto LABEL_7;
  }
  uint64_t v12 = 0;
LABEL_7:

  return v12;
}

- (double)timeoutForFeature:(id)a3
{
  id v4 = a3;
  v5 = [(FMDExtAccessoryConfiguration *)self features];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  double v7 = 2.0;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v6 objectForKeyedSubscript:@"timeout"];
      if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v8 doubleValue];
        double v7 = v9;
      }
    }
  }

  return v7;
}

- (id)infoForFeature:(id)a3
{
  id v4 = a3;
  v5 = [(FMDExtAccessoryConfiguration *)self features];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (double)detachNotificaitonsWaitTime
{
  v2 = [(FMDExtAccessoryConfiguration *)self features];
  v3 = [v2 objectForKeyedSubscript:@"nwd"];

  double v4 = 0.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v3 objectForKeyedSubscript:@"delay"];
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v5 doubleValue];
        double v4 = v6;
      }
    }
  }

  return v4;
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (NSString)version
{
  return self->_version;
}

- (NSDictionary)features
{
  return self->_features;
}

- (FMDSupportedAccessory)supportedAccessory
{
  return self->_supportedAccessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedAccessory, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_accessoryType, 0);
}

@end