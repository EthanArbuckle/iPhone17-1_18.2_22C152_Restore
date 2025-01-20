@interface RCUserSegmentationConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)defaultConfiguration;
+ (id)userSegmentationConfigurationWithConfigDict:(id)a3 environment:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)endpointURLString;
- (NSString)todayEndpointURLString;
- (NSString)widgetEndpointURLString;
- (RCUserSegmentationConfiguration)initWithCoder:(id)a3;
- (RCUserSegmentationConfiguration)initWithForegroundRefreshRate:(unint64_t)a3 backgroundRefreshRate:(unint64_t)a4 modThreshold:(unint64_t)a5 modMax:(unint64_t)a6 endpointURLString:(id)a7 widgetEndpointURLString:(id)a8 todayEndpointURLString:(id)a9;
- (id)description;
- (unint64_t)backgroundRefreshRate;
- (unint64_t)foregroundRefreshRate;
- (unint64_t)hash;
- (unint64_t)modMax;
- (unint64_t)modThreshold;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RCUserSegmentationConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)endpointURLString
{
  return self->_endpointURLString;
}

- (unint64_t)foregroundRefreshRate
{
  return self->_foregroundRefreshRate;
}

- (unint64_t)modThreshold
{
  return self->_modThreshold;
}

- (unint64_t)modMax
{
  return self->_modMax;
}

- (RCUserSegmentationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RCUserSegmentationConfiguration;
  v5 = [(RCUserSegmentationConfiguration *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foregroundRefreshRate"];
    v5->_foregroundRefreshRate = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundRefreshRate"];
    v5->_backgroundRefreshRate = [v7 unsignedIntegerValue];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modThreshold"];
    v5->_modThreshold = [v8 unsignedIntegerValue];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modMax"];
    v5->_modMax = [v9 unsignedIntegerValue];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpointURL"];
    endpointURLString = v5->_endpointURLString;
    v5->_endpointURLString = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widgetEndpointURL"];
    widgetEndpointURLString = v5->_widgetEndpointURLString;
    v5->_widgetEndpointURLString = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"todayEndpointURL"];
    todayEndpointURLString = v5->_todayEndpointURLString;
    v5->_todayEndpointURLString = (NSString *)v14;
  }
  return v5;
}

+ (id)defaultConfiguration
{
  v2 = [[RCUserSegmentationConfiguration alloc] initWithForegroundRefreshRate:300 backgroundRefreshRate:3600 modThreshold:1000 modMax:1000 endpointURLString:0 widgetEndpointURLString:0 todayEndpointURLString:0];

  return v2;
}

+ (id)userSegmentationConfigurationWithConfigDict:(id)a3 environment:(unint64_t)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = RCJSONIntegerValue(v5, @"appConfigRefreshRate", 300);
  RCJSONArrayValue(v5, @"endpointConfigs");
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)[v7 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v8)
  {
    uint64_t v26 = v6;
    uint64_t v9 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v12 = RCJSONStringValue(v11, @"environment", 0);
        uint64_t v13 = RCUserSegmentationEnvironmentForEnvironmentString(v12);

        if (v13 == a4)
        {
          v28 = RCJSONStringValue(v11, @"configurationEndpointUrl", 0);
          uint64_t v14 = RCJSONStringValue(v11, @"widgetConfigurationEndpointUrl", 0);
          v8 = RCJSONStringValue(v11, @"todayConfigurationEndpointUrl", 0);
          goto LABEL_11;
        }
      }
      v8 = (void *)[v7 countByEnumeratingWithState:&v29 objects:v41 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    uint64_t v14 = 0;
    v28 = 0;
LABEL_11:
    uint64_t v6 = v26;
  }
  else
  {
    uint64_t v14 = 0;
    v28 = 0;
  }

  v15 = RCJSONDictionaryValue(v5, @"userSegmentationApiConfiguration");
  v16 = v15;
  if (v15)
  {
    uint64_t v27 = RCJSONIntegerValue(v15, @"userSegmentationApiModMax", 1000);
    uint64_t v17 = RCJSONIntegerValue(v16, @"userSegmentationApiModThreshold", 1000);
    uint64_t v6 = RCJSONIntegerValue(v16, @"userSegmentationRefreshRate", v6);
    uint64_t v18 = RCJSONIntegerValue(v16, @"userSegmentationBackgroundRefreshRate", 3600);
  }
  else
  {
    uint64_t v18 = 3600;
    uint64_t v27 = 1000;
    uint64_t v17 = 1000;
  }
  v19 = RCJSONDictionaryValue(v5, @"widgetConfiguration");
  v20 = v19;
  if (v19)
  {
    uint64_t v21 = RCJSONIntegerValue(v19, @"user_segmentation_foreground_refresh_rate", v6);
    uint64_t v18 = RCJSONIntegerValue(v20, @"user_segmentation_refresh_rate", v21);
    uint64_t v6 = v18;
  }
  v22 = RCSharedLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    uint64_t v34 = v6;
    __int16 v35 = 2048;
    uint64_t v36 = v18;
    __int16 v37 = 2048;
    uint64_t v38 = v27;
    __int16 v39 = 2048;
    uint64_t v40 = v17;
    _os_log_impl(&dword_1A4AB3000, v22, OS_LOG_TYPE_DEFAULT, "creating user segmentation config with foreground refresh rate: %lu background refresh rate: %lu modMax: %lu modThreshold: %lu", buf, 0x2Au);
  }

  v23 = RCSharedLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v34 = (uint64_t)v28;
    __int16 v35 = 2112;
    uint64_t v36 = (uint64_t)v14;
    __int16 v37 = 2112;
    uint64_t v38 = (uint64_t)v8;
    _os_log_impl(&dword_1A4AB3000, v23, OS_LOG_TYPE_DEFAULT, "creating user segmentation config with endpointURL: %@ widgetEndpointURL: %@ todayEndpointURL: %@", buf, 0x20u);
  }

  v24 = [[RCUserSegmentationConfiguration alloc] initWithForegroundRefreshRate:v6 backgroundRefreshRate:v18 modThreshold:v17 modMax:v27 endpointURLString:v28 widgetEndpointURLString:v14 todayEndpointURLString:v8];

  return v24;
}

- (RCUserSegmentationConfiguration)initWithForegroundRefreshRate:(unint64_t)a3 backgroundRefreshRate:(unint64_t)a4 modThreshold:(unint64_t)a5 modMax:(unint64_t)a6 endpointURLString:(id)a7 widgetEndpointURLString:(id)a8 todayEndpointURLString:(id)a9
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)RCUserSegmentationConfiguration;
  uint64_t v18 = [(RCUserSegmentationConfiguration *)&v27 init];
  v19 = v18;
  if (v18)
  {
    v18->_foregroundRefreshRate = a3;
    v18->_backgroundRefreshRate = a4;
    v18->_modThreshold = a5;
    v18->_modMax = a6;
    uint64_t v20 = [v15 copy];
    endpointURLString = v19->_endpointURLString;
    v19->_endpointURLString = (NSString *)v20;

    uint64_t v22 = [v16 copy];
    widgetEndpointURLString = v19->_widgetEndpointURLString;
    v19->_widgetEndpointURLString = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    todayEndpointURLString = v19->_todayEndpointURLString;
    v19->_todayEndpointURLString = (NSString *)v24;
  }
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(RCUserSegmentationConfiguration *)self foregroundRefreshRate];
    if (v6 == [v5 foregroundRefreshRate]
      && (unint64_t v7 = [(RCUserSegmentationConfiguration *)self backgroundRefreshRate],
          v7 == [v5 backgroundRefreshRate])
      && (unint64_t v8 = [(RCUserSegmentationConfiguration *)self modThreshold],
          v8 == [v5 modThreshold])
      && (unint64_t v9 = -[RCUserSegmentationConfiguration modMax](self, "modMax"), v9 == [v5 modMax]))
    {
      uint64_t v10 = [(RCUserSegmentationConfiguration *)self endpointURLString];
      v11 = [v5 endpointURLString];
      if ([v10 isEqualToString:v11])
      {
        uint64_t v12 = [(RCUserSegmentationConfiguration *)self widgetEndpointURLString];
        uint64_t v13 = [v5 widgetEndpointURLString];
        if ([v12 isEqualToString:v13])
        {
          uint64_t v14 = [(RCUserSegmentationConfiguration *)self todayEndpointURLString];
          id v15 = [v5 todayEndpointURLString];
          char v16 = [v14 isEqualToString:v15];
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration foregroundRefreshRate](self, "foregroundRefreshRate"));
  uint64_t v4 = [v3 hash];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration backgroundRefreshRate](self, "backgroundRefreshRate"));
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration modThreshold](self, "modThreshold"));
  uint64_t v8 = [v7 hash];
  unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration modMax](self, "modMax"));
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(RCUserSegmentationConfiguration *)self endpointURLString];
  uint64_t v12 = [v11 hash];
  uint64_t v13 = [(RCUserSegmentationConfiguration *)self widgetEndpointURLString];
  uint64_t v14 = v12 ^ [v13 hash];
  id v15 = [(RCUserSegmentationConfiguration *)self todayEndpointURLString];
  unint64_t v16 = v10 ^ v14 ^ [v15 hash];

  return v16;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(RCUserSegmentationConfiguration *)self foregroundRefreshRate];
  unint64_t v6 = [(RCUserSegmentationConfiguration *)self backgroundRefreshRate];
  unint64_t v7 = [(RCUserSegmentationConfiguration *)self modThreshold];
  unint64_t v8 = [(RCUserSegmentationConfiguration *)self modMax];
  unint64_t v9 = [(RCUserSegmentationConfiguration *)self endpointURLString];
  uint64_t v10 = [(RCUserSegmentationConfiguration *)self widgetEndpointURLString];
  v11 = [(RCUserSegmentationConfiguration *)self todayEndpointURLString];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; foregroundRefreshRate: %lu\n backgroundRefreshRate: %lu\n modThreshold: %lu\n modMax: %lu endpointURL: %@ widgetEndpointURL: %@ todayEndpointURL: %@",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  uint64_t v12 = v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  unint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration foregroundRefreshRate](self, "foregroundRefreshRate"));
  [v5 encodeObject:v6 forKey:@"foregroundRefreshRate"];

  unint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration backgroundRefreshRate](self, "backgroundRefreshRate"));
  [v5 encodeObject:v7 forKey:@"backgroundRefreshRate"];

  unint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration modThreshold](self, "modThreshold"));
  [v5 encodeObject:v8 forKey:@"modThreshold"];

  unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration modMax](self, "modMax"));
  [v5 encodeObject:v9 forKey:@"modMax"];

  uint64_t v10 = [(RCUserSegmentationConfiguration *)self endpointURLString];
  [v5 encodeObject:v10 forKey:@"endpointURL"];

  v11 = [(RCUserSegmentationConfiguration *)self widgetEndpointURLString];
  [v5 encodeObject:v11 forKey:@"widgetEndpointURL"];

  id v12 = [(RCUserSegmentationConfiguration *)self todayEndpointURLString];
  [v5 encodeObject:v12 forKey:@"todayEndpointURL"];
}

- (unint64_t)backgroundRefreshRate
{
  return self->_backgroundRefreshRate;
}

- (NSString)widgetEndpointURLString
{
  return self->_widgetEndpointURLString;
}

- (NSString)todayEndpointURLString
{
  return self->_todayEndpointURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todayEndpointURLString, 0);
  objc_storeStrong((id *)&self->_widgetEndpointURLString, 0);

  objc_storeStrong((id *)&self->_endpointURLString, 0);
}

@end