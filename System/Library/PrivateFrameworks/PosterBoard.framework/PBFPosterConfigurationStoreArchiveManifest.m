@interface PBFPosterConfigurationStoreArchiveManifest
+ (BOOL)isManifestDictionaryValid:(id)a3;
+ (id)unsupportedVersions;
+ (int64_t)manifestVersion;
- (NSString)buildVersion;
- (NSString)extensionIdentifier;
- (NSString)role;
- (NSUUID)configurationUUID;
- (PBFPosterConfigurationStoreArchiveManifest)initWithConfigurationStoreCoordinator:(id)a3;
- (PBFPosterConfigurationStoreArchiveManifest)initWithDataRepresentation:(id)a3;
- (PBFPosterConfigurationStoreArchiveManifest)initWithDictionaryRepresentation:(id)a3;
- (id)dataRepresentationWithError:(id *)a3;
- (int64_t)archiveVersion;
- (int64_t)dataStoreVersion;
- (unint64_t)latestConfigurationSupplement;
- (unint64_t)latestConfigurationVersion;
@end

@implementation PBFPosterConfigurationStoreArchiveManifest

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

- (PBFPosterConfigurationStoreArchiveManifest)initWithConfigurationStoreCoordinator:(id)a3
{
  v23[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21 = (void *)MGCopyAnswer();
  v5 = [v4 identityOfLatestVersion];
  uint64_t v19 = [v5 provider];

  int v6 = [v4 identityOfLatestVersion];
  v22[0] = @"archiveVersion";
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "manifestVersion"));
  v23[0] = v7;
  v22[1] = @"dataStoreVersion";
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", +[PBFPosterExtensionDataStore dataStoreVersion](PBFPosterExtensionDataStore, "dataStoreVersion"));
  v23[1] = v8;
  v23[2] = v21;
  v22[2] = @"buildVersion";
  v22[3] = @"extensionIdentifier";
  v23[3] = v19;
  v22[4] = @"configurationUUID";
  v9 = [v4 posterUUID];

  v10 = [v9 UUIDString];
  v23[4] = v10;
  v22[5] = @"latestConfigurationVersion";
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "version"));
  v23[5] = v11;
  v22[6] = @"latestConfigurationSupplement";
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "supplement"));
  v23[6] = v12;
  v22[7] = @"role";
  uint64_t v13 = [v6 role];
  v14 = (void *)v13;
  uint64_t v15 = *MEMORY[0x1E4F923B8];
  if (v13) {
    uint64_t v15 = v13;
  }
  v23[7] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, v22, 8, v19);

  v17 = [(PBFPosterConfigurationStoreArchiveManifest *)self initWithDictionaryRepresentation:v16];
  return v17;
}

- (PBFPosterConfigurationStoreArchiveManifest)initWithDataRepresentation:(id)a3
{
  id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:0];
  v5 = [(PBFPosterConfigurationStoreArchiveManifest *)self initWithDictionaryRepresentation:v4];

  return v5;
}

- (PBFPosterConfigurationStoreArchiveManifest)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() isManifestDictionaryValid:v4])
  {
    v10.receiver = self;
    v10.super_class = (Class)PBFPosterConfigurationStoreArchiveManifest;
    v5 = [(PBFPosterConfigurationStoreArchiveManifest *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      dictionaryRepsentation = v5->_dictionaryRepsentation;
      v5->_dictionaryRepsentation = (NSDictionary *)v6;
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
  v2 = [(NSDictionary *)self->_dictionaryRepsentation objectForKeyedSubscript:@"archiveVersion"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)dataStoreVersion
{
  v2 = [(NSDictionary *)self->_dictionaryRepsentation objectForKeyedSubscript:@"dataStoreVersion"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSString)buildVersion
{
  return (NSString *)[(NSDictionary *)self->_dictionaryRepsentation objectForKeyedSubscript:@"buildVersion"];
}

- (NSString)extensionIdentifier
{
  return (NSString *)[(NSDictionary *)self->_dictionaryRepsentation objectForKeyedSubscript:@"extensionIdentifier"];
}

- (NSUUID)configurationUUID
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  id v4 = [(NSDictionary *)self->_dictionaryRepsentation objectForKeyedSubscript:@"configurationUUID"];
  v5 = (void *)[v3 initWithUUIDString:v4];

  return (NSUUID *)v5;
}

- (unint64_t)latestConfigurationVersion
{
  v2 = [(NSDictionary *)self->_dictionaryRepsentation objectForKeyedSubscript:@"latestConfigurationVersion"];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (unint64_t)latestConfigurationSupplement
{
  v2 = [(NSDictionary *)self->_dictionaryRepsentation objectForKeyedSubscript:@"latestConfigurationSupplement"];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:self->_dictionaryRepsentation format:100 options:0 error:a3];
}

- (NSString)role
{
  v2 = [(NSDictionary *)self->_dictionaryRepsentation objectForKeyedSubscript:@"role"];
  unint64_t v3 = v2;
  if (!v2) {
    v2 = (void *)*MEMORY[0x1E4F923B8];
  }
  id v4 = v2;

  return v4;
}

- (void).cxx_destruct
{
}

@end