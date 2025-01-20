@interface UABestAppSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (NSDate)lastActiveTime;
- (NSDate)lastUpdateTime;
- (NSDate)when;
- (NSDictionary)options;
- (NSString)activityType;
- (NSString)bundleIdentifier;
- (NSString)dynamicIdentifier;
- (NSString)originatingDeviceIdentifier;
- (NSString)originatingDeviceName;
- (NSString)originatingDeviceType;
- (NSString)userActivityTypeIdentifier;
- (NSUUID)uniqueIdentifier;
- (UABestAppSuggestion)initWithBundleIdentifier:(id)a3 uuid:(id)a4 activityType:(id)a5 dynamicIdentifier:(id)a6 lastUpdateTime:(id)a7 lastActiveTime:(id)a8 type:(unint64_t)a9 deviceName:(id)a10 deviceIdentifier:(id)a11 deviceType:(id)a12 options:(id)a13 isActive:(BOOL)a14;
- (UABestAppSuggestion)initWithCoder:(id)a3;
- (double)confidence;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityType:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation UABestAppSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UABestAppSuggestion)initWithBundleIdentifier:(id)a3 uuid:(id)a4 activityType:(id)a5 dynamicIdentifier:(id)a6 lastUpdateTime:(id)a7 lastActiveTime:(id)a8 type:(unint64_t)a9 deviceName:(id)a10 deviceIdentifier:(id)a11 deviceType:(id)a12 options:(id)a13 isActive:(BOOL)a14
{
  id v19 = a3;
  id v20 = a4;
  id obj = a5;
  id v21 = a5;
  v22 = v20;
  id v52 = v21;
  id v53 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v28 = a13;
  v29 = [(UABestAppSuggestion *)self init];
  if (v29)
  {
    uint64_t v30 = [v28 copy];
    options = v29->_options;
    v29->_options = (NSDictionary *)v30;

    v29->_type = a9;
    if (v19)
    {
      id v32 = v19;
      uint64_t v33 = objc_msgSend(v19, "copy", obj);
      bundleIdentifier = v29->_bundleIdentifier;
      v29->_bundleIdentifier = (NSString *)v33;
    }
    else
    {
      id v32 = 0;
      bundleIdentifier = v29->_bundleIdentifier;
      v29->_bundleIdentifier = 0;
    }

    if (v22) {
      v35 = v22;
    }
    else {
      v35 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    }
    uniqueIdentifier = v29->_uniqueIdentifier;
    v29->_uniqueIdentifier = v35;

    objc_storeStrong((id *)&v29->_activityType, obj);
    uint64_t v37 = [v53 copy];
    dynamicIdentifier = v29->_dynamicIdentifier;
    v29->_dynamicIdentifier = (NSString *)v37;

    if (v23) {
      v39 = (NSDate *)v23;
    }
    else {
      v39 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    }
    lastUpdateTime = v29->_lastUpdateTime;
    v29->_lastUpdateTime = v39;

    if (v24) {
      v41 = (NSDate *)v24;
    }
    else {
      v41 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    }
    lastActiveTime = v29->_lastActiveTime;
    v29->_lastActiveTime = v41;

    v29->_confidence = 0.75;
    uint64_t v43 = [v25 copy];
    originatingDeviceName = v29->_originatingDeviceName;
    v29->_originatingDeviceName = (NSString *)v43;

    uint64_t v45 = [v26 copy];
    originatingDeviceIdentifier = v29->_originatingDeviceIdentifier;
    v29->_originatingDeviceIdentifier = (NSString *)v45;

    uint64_t v47 = [v27 copy];
    originatingDeviceType = v29->_originatingDeviceType;
    v29->_originatingDeviceType = (NSString *)v47;

    v29->_isActive = a14;
    id v19 = v32;
  }

  return v29;
}

- (id)description
{
  v3 = NSString;
  v4 = suggestedActionTypeString(self->_type);
  v5 = [(NSUUID *)self->_uniqueIdentifier UUIDString];
  v6 = [v3 stringWithFormat:@"UABestAppSuggestion(%@ %@ %@ %@:%@ %@ from:%@/%@/%@)", v4, v5, self->_bundleIdentifier, self->_activityType, self->_dynamicIdentifier, self->_lastActiveTime, self->_originatingDeviceName, self->_originatingDeviceIdentifier, self->_originatingDeviceType];

  return v6;
}

- (id)debugDescription
{
  v3 = [(UABestAppSuggestion *)self options];

  if (v3
    && (v4 = (void *)MEMORY[0x1E4F28D90],
        [(UABestAppSuggestion *)self options],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v4 dataWithJSONObject:v5 options:0 error:0],
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    v7 = (__CFString *)[[NSString alloc] initWithData:v6 encoding:4];
  }
  else
  {
    v7 = &stru_1F0CB4508;
  }
  v8 = NSString;
  v9 = [(UABestAppSuggestion *)self bundleIdentifier];
  v10 = [(UABestAppSuggestion *)self uniqueIdentifier];
  v11 = [v10 UUIDString];
  v12 = [(UABestAppSuggestion *)self lastUpdateTime];
  v13 = [v8 stringWithFormat:@"BestApp: %@ %@ %@ %d %@", v9, v11, v12, -[UABestAppSuggestion type](self, "type"), v7];

  return v13;
}

- (NSDate)when
{
  return self->_lastUpdateTime;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UABestAppSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else if (v4 {
         && (v10.receiver = self,
  }
             v10.super_class = (Class)UABestAppSuggestion,
             [(UABestAppSuggestion *)&v10 isEqual:v4]))
  {
    uniqueIdentifier = self->_uniqueIdentifier;
    v7 = [(UABestAppSuggestion *)v5 uniqueIdentifier];
    char v8 = [(NSUUID *)uniqueIdentifier isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uniqueIdentifier hash];
}

- (UABestAppSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UABestAppSuggestion;
  v5 = [(UABestAppSuggestion *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdateTime"];
    lastUpdateTime = v5->_lastUpdateTime;
    v5->_lastUpdateTime = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastActiveTime"];
    lastActiveTime = v5->_lastActiveTime;
    v5->_lastActiveTime = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatingDeviceIdentifier"];
    originatingDeviceIdentifier = v5->_originatingDeviceIdentifier;
    v5->_originatingDeviceIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatingDeviceName"];
    originatingDeviceName = v5->_originatingDeviceName;
    v5->_originatingDeviceName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatingDeviceType"];
    originatingDeviceType = v5->_originatingDeviceType;
    v5->_originatingDeviceType = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityType"];
    activityType = v5->_activityType;
    v5->_activityType = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dynamicIdentifier"];
    dynamicIdentifier = v5->_dynamicIdentifier;
    v5->_dynamicIdentifier = (NSString *)v22;

    v5->_isActive = [v4 decodeBoolForKey:@"isActive"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  id v4 = [(UABestAppSuggestion *)self bundleIdentifier];
  [v13 encodeObject:v4 forKey:@"bundleIdentifier"];

  v5 = [(UABestAppSuggestion *)self lastUpdateTime];
  [v13 encodeObject:v5 forKey:@"lastUpdateTime"];

  uint64_t v6 = [(UABestAppSuggestion *)self lastActiveTime];
  [v13 encodeObject:v6 forKey:@"lastActiveTime"];

  v7 = [(UABestAppSuggestion *)self originatingDeviceIdentifier];
  [v13 encodeObject:v7 forKey:@"originatingDeviceIdentifier"];

  uint64_t v8 = [(UABestAppSuggestion *)self originatingDeviceName];
  [v13 encodeObject:v8 forKey:@"originatingDeviceName"];

  v9 = [(UABestAppSuggestion *)self originatingDeviceType];
  [v13 encodeObject:v9 forKey:@"originatingDeviceType"];

  uint64_t v10 = [(UABestAppSuggestion *)self uniqueIdentifier];
  [v13 encodeObject:v10 forKey:@"uniqueIdentifier"];

  v11 = [(UABestAppSuggestion *)self activityType];
  [v13 encodeObject:v11 forKey:@"activityType"];

  uint64_t v12 = [(UABestAppSuggestion *)self dynamicIdentifier];
  [v13 encodeObject:v12 forKey:@"dynamicIdentifier"];

  objc_msgSend(v13, "encodeBool:forKey:", -[UABestAppSuggestion isActive](self, "isActive"), @"isActive");
}

- (unint64_t)type
{
  return self->_type;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setActivityType:(id)a3
{
}

- (NSString)dynamicIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)lastUpdateTime
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (double)confidence
{
  return self->_confidence;
}

- (NSString)originatingDeviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)originatingDeviceName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)originatingDeviceType
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSDate)lastActiveTime
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveTime, 0);
  objc_storeStrong((id *)&self->_originatingDeviceType, 0);
  objc_storeStrong((id *)&self->_originatingDeviceName, 0);
  objc_storeStrong((id *)&self->_originatingDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_dynamicIdentifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSString)userActivityTypeIdentifier
{
  return self->_activityType;
}

@end