@interface PLLibraryOpenerCreationOptions
+ (BOOL)validateContinerIdentifier:(id)a3 connectionAuthorization:(id)a4;
+ (int64_t)resolvePhotoLibraryDomainWithOptionsDictionary:(id)a3;
- (BOOL)hasCustomUUID;
- (NSDictionary)createDatabaseOptionsDictionary;
- (NSDictionary)internalTestOptions;
- (NSString)containerIdentifier;
- (NSString)libraryName;
- (NSString)userDescription;
- (NSString)uuid;
- (NSURL)libraryBundleURL;
- (PLLibraryOpenerCreationOptions)initWithOptionsDictionary:(id)a3 connectionAuthorization:(id)a4;
- (PLLibraryOpenerCreationOptions)initWithWellKnownLibraryIdentifier:(int64_t)a3;
- (id)debugDescription;
- (int64_t)domain;
@end

@implementation PLLibraryOpenerCreationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryBundleURL, 0);
  objc_storeStrong((id *)&self->_internalTestOptions, 0);
  objc_storeStrong((id *)&self->_createDatabaseOptionsDictionary, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_libraryName, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSURL)libraryBundleURL
{
  return self->_libraryBundleURL;
}

- (NSDictionary)internalTestOptions
{
  return self->_internalTestOptions;
}

- (NSDictionary)createDatabaseOptionsDictionary
{
  return self->_createDatabaseOptionsDictionary;
}

- (NSString)userDescription
{
  return self->_userDescription;
}

- (NSString)libraryName
{
  return self->_libraryName;
}

- (int64_t)domain
{
  return self->_domain;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)debugDescription
{
  v3 = [(PLLibraryOpenerCreationOptions *)self internalTestOptions];
  if (v3)
  {
    v4 = NSString;
    v5 = [(PLLibraryOpenerCreationOptions *)self internalTestOptions];
    v6 = [v5 description];
    v7 = [v4 stringWithFormat:@"\n(testOptions):%@", v6];
  }
  else
  {
    v7 = &stru_1EEB2EB80;
  }

  v8 = [(PLLibraryOpenerCreationOptions *)self createDatabaseOptionsDictionary];
  if (v8)
  {
    v9 = NSString;
    v10 = [(PLLibraryOpenerCreationOptions *)self createDatabaseOptionsDictionary];
    v11 = [v10 description];
    v12 = [v9 stringWithFormat:@"\n(createDBOptions):%@", v11];
  }
  else
  {
    v12 = &stru_1EEB2EB80;
  }

  v22.receiver = self;
  v22.super_class = (Class)PLLibraryOpenerCreationOptions;
  v13 = [(PLLibraryOpenerCreationOptions *)&v22 description];
  v14 = [(PLLibraryOpenerCreationOptions *)self uuid];
  v15 = [(PLLibraryOpenerCreationOptions *)self containerIdentifier];
  int64_t v16 = [(PLLibraryOpenerCreationOptions *)self domain];
  v17 = [(PLLibraryOpenerCreationOptions *)self libraryName];
  v18 = [(PLLibraryOpenerCreationOptions *)self userDescription];
  v19 = [(PLLibraryOpenerCreationOptions *)self libraryBundleURL];
  v20 = [v13 stringByAppendingFormat:@": UUID:[%@], cId:[%@], d:[%d], name:[%@], uDesc:[%@], libraryURL:[%@]%@%@", v14, v15, v16, v17, v18, v19, v7, v12];

  return v20;
}

- (BOOL)hasCustomUUID
{
  return self->_hasCustomUUID;
}

- (PLLibraryOpenerCreationOptions)initWithWellKnownLibraryIdentifier:(int64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PLLibraryOpenerCreationOptions;
  v4 = [(PLLibraryOpenerCreationOptions *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F8B980] libraryCreateOptionsForWellKnownLibraryIdentifier:a3];
    if (v5)
    {
      v11 = @"PLPhotoLibraryCreateOptions";
      v6 = [NSNumber numberWithUnsignedInteger:v5];
      v12[0] = v6;
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      createDatabaseOptionsDictionary = v4->_createDatabaseOptionsDictionary;
      v4->_createDatabaseOptionsDictionary = (NSDictionary *)v7;
    }
    objc_storeStrong((id *)&v4->_containerIdentifier, @"com.apple.photos");
  }
  return v4;
}

- (PLLibraryOpenerCreationOptions)initWithOptionsDictionary:(id)a3 connectionAuthorization:(id)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PLLibraryOpenerCreationOptions;
  v8 = [(PLLibraryOpenerCreationOptions *)&v34 init];
  if (!v8) {
    goto LABEL_22;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"PLPhotoLibraryOpenerOptionsBundleURLKey"];
  libraryBundleURL = v8->_libraryBundleURL;
  v8->_libraryBundleURL = (NSURL *)v9;

  uint64_t v11 = [v6 objectForKeyedSubscript:@"PLPhotoLibraryOpenerOptionsNameKey"];
  libraryName = v8->_libraryName;
  v8->_libraryName = (NSString *)v11;

  uint64_t v13 = [v6 objectForKeyedSubscript:@"PLPhotoLibraryOpenerOptionsDescriptionKey"];
  userDescription = v8->_userDescription;
  v8->_userDescription = (NSString *)v13;

  uint64_t v15 = [v6 objectForKeyedSubscript:@"PLPhotoLibraryOpenerOptionsTestOptionsKey"];
  internalTestOptions = v8->_internalTestOptions;
  v8->_internalTestOptions = (NSDictionary *)v15;

  uint64_t v17 = [v6 objectForKeyedSubscript:@"PLPhotoLibraryCreateOptions"];
  v18 = (void *)v17;
  if (v17)
  {
    v37 = @"PLPhotoLibraryCreateOptions";
    v38[0] = v17;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    createDatabaseOptionsDictionary = v8->_createDatabaseOptionsDictionary;
    v8->_createDatabaseOptionsDictionary = (NSDictionary *)v19;
  }
  v21 = [v6 objectForKeyedSubscript:@"PLPhotoLibraryOpenerOptionsIdentifierUUIDKey"];
  objc_super v22 = v21;
  if (v21)
  {
    v8->_hasCustomUUID = 1;
    v23 = v21;
    uuid = v8->_uuid;
    v8->_uuid = v23;
  }
  else
  {
    uuid = [MEMORY[0x1E4F29128] UUID];
    uint64_t v25 = [uuid UUIDString];
    v26 = v8->_uuid;
    v8->_uuid = (NSString *)v25;
  }
  uint64_t domain = [(id)objc_opt_class() resolvePhotoLibraryDomainWithOptionsDictionary:v6];
  v8->_uint64_t domain = domain;
  if (domain == 3)
  {
    v29 = [v6 objectForKeyedSubscript:@"PLPhotoLibraryOpenerOptionsContainerIdentifierKey"];
    if (v29)
    {
      if (![(id)objc_opt_class() validateContinerIdentifier:v29 connectionAuthorization:v7])goto LABEL_15; {
      v30 = v29;
      }
    }
    else
    {
      v30 = [v7 trustedCallerBundleID];
    }
    containerIdentifier = v8->_containerIdentifier;
    v8->_containerIdentifier = v30;

    goto LABEL_15;
  }
  if (domain != 2) {
    goto LABEL_16;
  }
  v28 = @"com.apple.photos";
  v29 = v8->_containerIdentifier;
  v8->_containerIdentifier = (NSString *)@"com.apple.photos";
LABEL_15:

  uint64_t domain = v8->_domain;
LABEL_16:
  if (!domain || !v8->_containerIdentifier)
  {
    v32 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v6;
      _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Unsupported library domain/container in options %@", buf, 0xCu);
    }

    v8 = 0;
  }

LABEL_22:
  return v8;
}

+ (BOOL)validateContinerIdentifier:(id)a3 connectionAuthorization:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v5 length] != 0;

  return v7;
}

+ (int64_t)resolvePhotoLibraryDomainWithOptionsDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"PLPhotoLibraryOpenerOptionsDomainKey"];
  id v5 = [v3 objectForKeyedSubscript:@"PLPhotoLibraryOpenerOptionsContainerIdentifierKey"];

  if (v4 && [v4 integerValue] != 2)
  {
    if ([v4 integerValue] == 3
      && (!v5 || ([v5 isEqualToString:@"com.apple.photos"] & 1) == 0))
    {
      int64_t v6 = 3;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (v5 && ![v5 isEqualToString:@"com.apple.photos"])
  {
LABEL_9:
    int64_t v6 = 0;
    goto LABEL_11;
  }
  int64_t v6 = 2;
LABEL_11:

  return v6;
}

@end