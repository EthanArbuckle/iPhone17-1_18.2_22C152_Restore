@interface PRPosterDescriptor(PBFUtilities)
- (id)pbf_posterProvider;
- (id)pbf_posterUUID;
- (uint64_t)pbf_isInitialPosterDescriptor;
@end

@implementation PRPosterDescriptor(PBFUtilities)

- (id)pbf_posterUUID
{
  v1 = [a1 _path];
  v2 = [v1 serverIdentity];
  v3 = [v2 posterUUID];

  return v3;
}

- (id)pbf_posterProvider
{
  v1 = [a1 _path];
  v2 = [v1 serverIdentity];
  v3 = [v2 provider];

  return v3;
}

- (uint64_t)pbf_isInitialPosterDescriptor
{
  v2 = [a1 descriptorIdentifier];
  if (v2)
  {
    v3 = objc_msgSend(a1, "pbf_posterProvider");
    if (v3)
    {
      v4 = [a1 role];
      v5 = [MEMORY[0x1E4F922D0] entryWithExtensionID:v3 descriptorID:v2];
      v6 = +[PBFInitialPosterHelper hostConfigurationForRole:v4];
      v7 = [v6 entries];
      uint64_t v8 = [v7 containsObject:v5];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end