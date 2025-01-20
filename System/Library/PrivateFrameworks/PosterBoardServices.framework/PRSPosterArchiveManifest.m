@interface PRSPosterArchiveManifest
+ (BOOL)isManifestDictionaryValid:(id)a3;
+ (id)unsupportedVersions;
+ (int64_t)manifestVersion;
- (NSDictionary)dictionaryRepresentation;
- (NSString)buildVersion;
- (NSString)extensionIdentifier;
- (NSString)role;
- (NSUUID)configurationUUID;
- (PRSPosterArchiveManifest)initWithConfigurationAttributes:(id)a3;
- (PRSPosterArchiveManifest)initWithDataRepresentation:(id)a3;
- (PRSPosterArchiveManifest)initWithDictionaryRepresentation:(id)a3;
- (id)dataRepresentationWithError:(id *)a3;
- (int64_t)archiveVersion;
- (int64_t)dataStoreVersion;
- (unint64_t)latestConfigurationSupplement;
- (unint64_t)latestConfigurationVersion;
- (void)setDictionaryRepresentation:(id)a3;
@end

@implementation PRSPosterArchiveManifest

+ (int64_t)manifestVersion
{
  return 1;
}

+ (id)unsupportedVersions
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)isManifestDictionaryValid:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"archiveVersion"];
  if (v4)
  {
    v5 = [a1 unsupportedVersions];
    int v6 = [v5 containsObject:v4] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (PRSPosterArchiveManifest)initWithConfigurationAttributes:(id)a3
{
  v14[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 extensionIdentifier];
  v13[0] = @"archiveVersion";
  int v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "manifestVersion"));
  v14[0] = v6;
  v14[1] = v5;
  v13[1] = @"extensionIdentifier";
  v13[2] = @"configurationUUID";
  v7 = [v4 posterUUID];
  v8 = [v7 UUIDString];
  v14[2] = v8;
  v14[3] = &unk_1EFD98050;
  v13[3] = @"latestConfigurationVersion";
  v13[4] = @"latestConfigurationSupplement";
  v14[4] = &unk_1EFD98050;
  v13[5] = @"role";
  v9 = [v4 role];

  v14[5] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];

  v11 = [(PRSPosterArchiveManifest *)self initWithDictionaryRepresentation:v10];
  return v11;
}

- (PRSPosterArchiveManifest)initWithDataRepresentation:(id)a3
{
  id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:0];
  v5 = [(PRSPosterArchiveManifest *)self initWithDictionaryRepresentation:v4];

  return v5;
}

- (PRSPosterArchiveManifest)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() isManifestDictionaryValid:v4])
  {
    v10.receiver = self;
    v10.super_class = (Class)PRSPosterArchiveManifest;
    v5 = [(PRSPosterArchiveManifest *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      dictionaryRepresentation = v5->_dictionaryRepresentation;
      v5->_dictionaryRepresentation = (NSDictionary *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)archiveVersion
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"archiveVersion"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)dataStoreVersion
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"dataStoreVersion"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSString)extensionIdentifier
{
  return (NSString *)[(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"extensionIdentifier"];
}

- (NSUUID)configurationUUID
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  id v4 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"configurationUUID"];
  v5 = (void *)[v3 initWithUUIDString:v4];

  return (NSUUID *)v5;
}

- (unint64_t)latestConfigurationVersion
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"latestConfigurationVersion"];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (unint64_t)latestConfigurationSupplement
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"latestConfigurationSupplement"];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:self->_dictionaryRepresentation format:100 options:0 error:a3];
}

- (NSString)role
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"role"];
  unint64_t v3 = v2;
  if (!v2) {
    v2 = @"PRPosterRoleLockScreen";
  }
  id v4 = v2;

  return v4;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void)setDictionaryRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

- (NSString)buildVersion
{
  return (NSString *)[(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"buildVersion"];
}

@end