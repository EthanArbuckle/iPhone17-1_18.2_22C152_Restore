@interface MAAutoAssetPushNotification
+ (BOOL)supportsSecureCoding;
+ (id)pushReasonName:(int64_t)a3;
- (MAAutoAssetPushNotification)initWithCoder:(id)a3;
- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3;
- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6;
- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6 withUpdatePolicy:(id)a7;
- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6 withUpdatePolicy:(id)a7 withAdditional:(id)a8;
- (MAAutoAssetUpdatePolicy)autoUpdatePolicy;
- (NSDictionary)additionalPushParameters;
- (NSDictionary)historyRepresentation;
- (NSString)assetSpecifier;
- (NSString)assetType;
- (NSString)assetVersion;
- (id)newAssetName;
- (id)newSummaryDictionary;
- (id)pushReasonName;
- (id)summary;
- (int64_t)pushReason;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalPushParameters:(id)a3;
- (void)setPushReason:(int64_t)a3;
@end

@implementation MAAutoAssetPushNotification

- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3
{
  return [(MAAutoAssetPushNotification *)self initWithPushReason:a3 forAssetType:0 withAssetSpecifier:0 matchingAssetVersion:0 withUpdatePolicy:0 withAdditional:0];
}

- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6
{
  return [(MAAutoAssetPushNotification *)self initWithPushReason:a3 forAssetType:a4 withAssetSpecifier:a5 matchingAssetVersion:a6 withUpdatePolicy:0 withAdditional:0];
}

- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6 withUpdatePolicy:(id)a7
{
  return [(MAAutoAssetPushNotification *)self initWithPushReason:a3 forAssetType:a4 withAssetSpecifier:a5 matchingAssetVersion:a6 withUpdatePolicy:a7 withAdditional:0];
}

- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6 withUpdatePolicy:(id)a7 withAdditional:(id)a8
{
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)MAAutoAssetPushNotification;
  v18 = [(MAAutoAssetPushNotification *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_pushReason = a3;
    objc_storeStrong((id *)&v18->_assetType, a4);
    objc_storeStrong((id *)&v19->_assetSpecifier, a5);
    objc_storeStrong((id *)&v19->_assetVersion, a6);
    objc_storeStrong((id *)&v19->_autoUpdatePolicy, a7);
    objc_storeStrong((id *)&v19->_additionalPushParameters, a8);
  }

  return v19;
}

- (MAAutoAssetPushNotification)initWithCoder:(id)a3
{
  v21[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetPushNotification;
  v5 = [(MAAutoAssetPushNotification *)&v20 init];
  if (v5)
  {
    v5->_pushReason = [v4 decodeIntegerForKey:@"pushReason"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetType"];
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSpecifier"];
    assetSpecifier = v5->_assetSpecifier;
    v5->_assetSpecifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetVersion"];
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoUpdatePolicy"];
    autoUpdatePolicy = v5->_autoUpdatePolicy;
    v5->_autoUpdatePolicy = (MAAutoAssetUpdatePolicy *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v21[4] = objc_opt_class();
    v21[5] = objc_opt_class();
    v21[6] = objc_opt_class();
    v21[7] = objc_opt_class();
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:8];
    id v16 = [v14 setWithArray:v15];

    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"additionalPushParameters"];
    additionalPushParameters = v5->_additionalPushParameters;
    v5->_additionalPushParameters = (NSDictionary *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetPushNotification pushReason](self, "pushReason"), @"pushReason");
  v5 = [(MAAutoAssetPushNotification *)self assetType];
  [v4 encodeObject:v5 forKey:@"assetType"];

  uint64_t v6 = [(MAAutoAssetPushNotification *)self assetSpecifier];
  [v4 encodeObject:v6 forKey:@"assetSpecifier"];

  v7 = [(MAAutoAssetPushNotification *)self assetVersion];
  [v4 encodeObject:v7 forKey:@"assetVersion"];

  uint64_t v8 = [(MAAutoAssetPushNotification *)self autoUpdatePolicy];
  [v4 encodeObject:v8 forKey:@"autoUpdatePolicy"];

  id v9 = [(MAAutoAssetPushNotification *)self additionalPushParameters];
  [v4 encodeObject:v9 forKey:@"additionalPushParameters"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)newAssetName
{
  v3 = [(MAAutoAssetPushNotification *)self assetType];

  if (!v3) {
    return &stru_1F0A75970;
  }
  id v4 = [(MAAutoAssetPushNotification *)self assetSpecifier];

  if (v4)
  {
    v5 = [(MAAutoAssetPushNotification *)self assetVersion];

    id v6 = [NSString alloc];
    v7 = [(MAAutoAssetPushNotification *)self assetType];
    uint64_t v8 = [(MAAutoAssetPushNotification *)self assetSpecifier];
    id v9 = (void *)v8;
    if (v5)
    {
      uint64_t v10 = [(MAAutoAssetPushNotification *)self assetVersion];
      v11 = (void *)[v6 initWithFormat:@"(%@|%@|%@)", v7, v9, v10];
    }
    else
    {
      v11 = (void *)[v6 initWithFormat:@"(%@|%@)", v7, v8];
    }
  }
  else
  {
    id v12 = [NSString alloc];
    v7 = [(MAAutoAssetPushNotification *)self assetType];
    v11 = (void *)[v12 initWithFormat:@"(%@)", v7];
  }

  return v11;
}

- (id)summary
{
  id v4 = NSString;
  v5 = [(MAAutoAssetPushNotification *)self pushReasonName];
  id v6 = [(MAAutoAssetPushNotification *)self newAssetName];
  v7 = [(MAAutoAssetPushNotification *)self autoUpdatePolicy];
  if (v7)
  {
    v2 = [(MAAutoAssetPushNotification *)self autoUpdatePolicy];
    uint64_t v8 = [v2 summary];
  }
  else
  {
    uint64_t v8 = @"NONE";
  }
  id v9 = [(MAAutoAssetPushNotification *)self additionalPushParameters];
  uint64_t v10 = @"PRESENT";
  if (!v9) {
    uint64_t v10 = @"NONE";
  }
  v11 = [v4 stringWithFormat:@"%@%@|policy:%@|additional:%@", v5, v6, v8, v10];

  if (v7)
  {
  }
  return v11;
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MAAutoAssetPushNotification *)self pushReasonName];
  [v3 setSafeObject:v4 forKey:@"pushReason"];

  id v5 = [(MAAutoAssetPushNotification *)self newAssetName];
  [v3 setSafeObject:v5 forKey:@"assetName"];

  id v6 = [(MAAutoAssetPushNotification *)self autoUpdatePolicy];
  if (v6)
  {
    id v7 = [(MAAutoAssetPushNotification *)self autoUpdatePolicy];
    uint64_t v8 = (void *)[v7 newSummaryDictionary];
    [v3 setSafeObject:v8 forKey:@"autoUpdatePolicy"];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    [v3 setSafeObject:v7 forKey:@"autoUpdatePolicy"];
  }

  id v9 = [(MAAutoAssetPushNotification *)self additionalPushParameters];
  if (v9)
  {
    id v10 = [(MAAutoAssetPushNotification *)self additionalPushParameters];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  v11 = v10;
  [v3 setSafeObject:v10 forKey:@"additionalPushParameters"];

  return v3;
}

- (id)pushReasonName
{
  int64_t v2 = [(MAAutoAssetPushNotification *)self pushReason];
  return +[MAAutoAssetPushNotification pushReasonName:v2];
}

+ (id)pushReasonName:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"UNKNOWN";
  }
  else {
    return off_1E6004418[a3];
  }
}

- (NSDictionary)historyRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(MAAutoAssetPushNotification *)self assetType];

  if (v4)
  {
    id v5 = [(MAAutoAssetPushNotification *)self assetType];
    [v3 setSafeObject:v5 forKey:@"assetType"];
  }
  id v6 = [(MAAutoAssetPushNotification *)self assetSpecifier];

  if (v6)
  {
    id v7 = [(MAAutoAssetPushNotification *)self assetSpecifier];
    [v3 setSafeObject:v7 forKey:@"assetSpecifier"];
  }
  uint64_t v8 = [(MAAutoAssetPushNotification *)self pushReasonName];

  if (v8)
  {
    id v9 = [(MAAutoAssetPushNotification *)self pushReasonName];
    [v3 setSafeObject:v9 forKey:@"pushReasonName"];
  }
  uint64_t v10 = [(MAAutoAssetPushNotification *)self autoUpdatePolicy];
  if (v10)
  {
    v11 = (void *)v10;
    id v12 = [(MAAutoAssetPushNotification *)self autoUpdatePolicy];
    v13 = [v12 updatePolicyName];

    if (v13)
    {
      v14 = [(MAAutoAssetPushNotification *)self autoUpdatePolicy];
      id v15 = [v14 updatePolicyName];
      [v3 setSafeObject:v15 forKey:@"autoUpdatePolicy"];
    }
  }
  id v16 = [(MAAutoAssetPushNotification *)self assetVersion];

  if (v16)
  {
    uint64_t v17 = [(MAAutoAssetPushNotification *)self assetVersion];
    [v3 setSafeObject:v17 forKey:@"assetVersion"];
  }
  v18 = (void *)[v3 copy];

  return (NSDictionary *)v18;
}

- (int64_t)pushReason
{
  return self->_pushReason;
}

- (void)setPushReason:(int64_t)a3
{
  self->_pushReason = a3;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)assetSpecifier
{
  return self->_assetSpecifier;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (MAAutoAssetUpdatePolicy)autoUpdatePolicy
{
  return self->_autoUpdatePolicy;
}

- (NSDictionary)additionalPushParameters
{
  return self->_additionalPushParameters;
}

- (void)setAdditionalPushParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPushParameters, 0);
  objc_storeStrong((id *)&self->_autoUpdatePolicy, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetSpecifier, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

@end