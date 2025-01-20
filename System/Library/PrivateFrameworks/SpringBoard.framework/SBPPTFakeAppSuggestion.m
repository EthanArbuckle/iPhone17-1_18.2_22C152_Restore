@interface SBPPTFakeAppSuggestion
- (BOOL)isEqual:(id)a3;
- (SBPPTFakeAppSuggestion)initWithBundleIdentifier:(id)a3;
- (id)activityType;
- (id)bundleIdentifier;
- (id)originatingDeviceName;
- (id)originatingDeviceType;
- (id)suggestedLocationName;
- (id)uniqueIdentifier;
- (unint64_t)hash;
@end

@implementation SBPPTFakeAppSuggestion

- (SBPPTFakeAppSuggestion)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBPPTFakeAppSuggestion;
  v6 = [(SBPPTFakeAppSuggestion *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v7;

    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v6;
}

- (id)uniqueIdentifier
{
  return self->_uuid;
}

- (id)bundleIdentifier
{
  v2 = (void *)[(NSString *)self->_bundleIdentifier copy];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 uniqueIdentifier];
    v6 = [(SBPPTFakeAppSuggestion *)self uniqueIdentifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(SBPPTFakeAppSuggestion *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)activityType
{
  return @"Testing";
}

- (id)originatingDeviceName
{
  return @"Simulated Cute Device Name";
}

- (id)originatingDeviceType
{
  return @"Simulated iPhone";
}

- (id)suggestedLocationName
{
  return @"Work";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end