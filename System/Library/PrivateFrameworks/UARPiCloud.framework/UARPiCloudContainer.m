@interface UARPiCloudContainer
- (BOOL)isCHIPContainer;
- (BOOL)requiresPrefForSigningBeta;
- (CKContainer)container;
- (CKDatabase)database;
- (CKServerChangeToken)databaseChangeToken;
- (NSData)verificationCertificate;
- (NSDictionary)verificationCertificates;
- (NSMutableSet)updatedRecords;
- (NSMutableSet)updatedZones;
- (NSString)containerID;
- (UARPiCloudContainer)initWithContainerID:(id)a3;
- (id)publicKey;
- (void)createContainerWithIdentifier:(id)a3;
- (void)processVerificationCertificateRecord:(id)a3;
- (void)setDatabaseChangeToken:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setUpdatedRecords:(id)a3;
- (void)setUpdatedZones:(id)a3;
- (void)setVerificationCertificate:(id)a3;
- (void)setVerificationCertificates:(id)a3;
@end

@implementation UARPiCloudContainer

- (UARPiCloudContainer)initWithContainerID:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UARPiCloudContainer;
  v5 = [(UARPiCloudContainer *)&v17 init];
  v6 = v5;
  if (v5)
  {
    [(UARPiCloudContainer *)v5 createContainerWithIdentifier:v4];
    if (!v6->_container)
    {
      v15 = 0;
      goto LABEL_6;
    }
    uint64_t v7 = [v4 copy];
    containerID = v6->_containerID;
    v6->_containerID = (NSString *)v7;

    uint64_t v9 = [(CKContainer *)v6->_container publicCloudDatabase];
    database = v6->_database;
    v6->_database = (CKDatabase *)v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    updatedZones = v6->_updatedZones;
    v6->_updatedZones = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    updatedRecords = v6->_updatedRecords;
    v6->_updatedRecords = v13;
  }
  v15 = v6;
LABEL_6:

  return v15;
}

- (void)createContainerWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = CFPreferencesGetAppBooleanValue(@"developmentEnvironment", @"com.apple.UARPiCloud", 0) != 0;
  if ([v4 containsString:@"com.apple.chip"])
  {
    v6 = [NSURL fileURLWithPath:@"/Library/Managed Preferences/mobile/com.apple.UARPiCloud.plist"];
    id v14 = 0;
    uint64_t v7 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v6 error:&v14];
    id v8 = v14;
    if (v7)
    {
      uint64_t v9 = [v7 objectForKey:@"developmentEnvironment"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v5 = [v9 BOOLValue];
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[UARPiCloudContainer createContainerWithIdentifier:]";
      __int16 v17 = 2112;
      v18 = v6;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_225D74000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Failed to read managedPrefs at %@ error %@", buf, 0x20u);
    }
  }
  if (v5) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  v11 = (void *)[objc_alloc(MEMORY[0x263EFD618]) initWithContainerIdentifier:v4 environment:v10];
  v12 = (CKContainer *)[objc_alloc(MEMORY[0x263EFD608]) initWithContainerID:v11];
  container = self->_container;
  self->_container = v12;
}

- (void)setUpdatedZones:(id)a3
{
  self->_updatedZones = (NSMutableSet *)[a3 mutableCopy];
  MEMORY[0x270F9A758]();
}

- (NSMutableSet)updatedZones
{
  return self->_updatedZones;
}

- (void)setUpdatedRecords:(id)a3
{
  self->_updatedRecords = (NSMutableSet *)[a3 mutableCopy];
  MEMORY[0x270F9A758]();
}

- (NSMutableSet)updatedRecords
{
  return self->_updatedRecords;
}

- (void)setDatabaseChangeToken:(id)a3
{
  id v4 = (CKServerChangeToken *)a3;
  if (![(UARPiCloudContainer *)self isCHIPContainer] && v4)
  {
    id v9 = 0;
    int v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v9];
    id v6 = v9;
    uint64_t v7 = [NSString stringWithFormat:@"%@_%@", self->_containerID, @"Database"];
    saveEntryForKey(v5, v7);
  }
  databaseChangeToken = self->_databaseChangeToken;
  self->_databaseChangeToken = v4;
}

- (CKServerChangeToken)databaseChangeToken
{
  if (![(UARPiCloudContainer *)self isCHIPContainer])
  {
    v3 = [NSString stringWithFormat:@"%@_%@", self->_containerID, @"Database"];
    id v4 = v3;
    if (!self->_databaseChangeToken)
    {
      uint64_t v5 = getEntryForKey(v3);
      if (v5)
      {
        id v6 = (void *)v5;
        id v12 = 0;
        uint64_t v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v12];
        id v8 = v12;
        databaseChangeToken = self->_databaseChangeToken;
        self->_databaseChangeToken = v7;
      }
    }
  }
  uint64_t v10 = self->_databaseChangeToken;
  return v10;
}

- (void)setVerificationCertificate:(id)a3
{
  id v4 = (NSData *)a3;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@_%@", self->_containerID, @"VerificationCertificate"];
    saveEntryForKey(v4, v5);
  }
  verificationCertificate = self->_verificationCertificate;
  self->_verificationCertificate = v4;
}

- (void)setPublicKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@_%@", self->_containerID, @"PublicKey"];
    saveEntryForKey(v4, v5);
  }
  id publicKey = self->_publicKey;
  self->_id publicKey = v4;
}

- (NSData)verificationCertificate
{
  v3 = [NSString stringWithFormat:@"%@_%@", self->_containerID, @"VerificationCertificate"];
  verificationCertificate = self->_verificationCertificate;
  if (!verificationCertificate)
  {
    getEntryForKey(v3);
    uint64_t v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_verificationCertificate;
    self->_verificationCertificate = v5;

    verificationCertificate = self->_verificationCertificate;
  }
  uint64_t v7 = verificationCertificate;

  return v7;
}

- (id)publicKey
{
  v3 = [NSString stringWithFormat:@"%@_%@", self->_containerID, @"PublicKey"];
  id publicKey = self->_publicKey;
  if (!publicKey)
  {
    uint64_t v5 = getEntryForKey(v3);
    id v6 = self->_publicKey;
    self->_id publicKey = v5;

    id publicKey = self->_publicKey;
  }
  id v7 = publicKey;

  return v7;
}

- (BOOL)requiresPrefForSigningBeta
{
  if ([(NSString *)self->_containerID isEqualToString:@"com.apple.uarp.uat"]
    || [(NSString *)self->_containerID isEqualToString:@"com.apple.uarp.staging.uat"]
    || [(NSString *)self->_containerID isEqualToString:@"com.apple.uarp.beta"]
    || [(NSString *)self->_containerID isEqualToString:@"com.apple.uarp.staging.beta"]
    || [(NSString *)self->_containerID isEqualToString:@"com.apple.uarp.staging"])
  {
    return 1;
  }
  containerID = self->_containerID;
  return [(NSString *)containerID isEqualToString:@"com.apple.chip.staging"];
}

- (BOOL)isCHIPContainer
{
  if ([(NSString *)self->_containerID isEqualToString:@"com.apple.chip"]) {
    return 1;
  }
  containerID = self->_containerID;
  return [(NSString *)containerID isEqualToString:@"com.apple.chip.staging"];
}

- (void)processVerificationCertificateRecord:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(UARPiCloudContainer *)self isCHIPContainer])
  {
    uint64_t v5 = [v4 objectForKey:@"certificate"];
    if (v5)
    {
      id v6 = v5;
      id v7 = (void *)MEMORY[0x263F08900];
      id v8 = [v5 dataUsingEncoding:4];
      id v12 = 0;
      id v9 = [v7 JSONObjectWithData:v8 options:0 error:&v12];
      id v10 = v12;
      verificationCertificates = self->_verificationCertificates;
      self->_verificationCertificates = v9;

      if (v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v10;
        _os_log_impl(&dword_225D74000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to create _verificationCertificates with error: %@", buf, 0xCu);
      }
    }
  }
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (CKDatabase)database
{
  return (CKDatabase *)objc_getProperty(self, a2, 64, 1);
}

- (NSDictionary)verificationCertificates
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setVerificationCertificates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationCertificates, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_updatedRecords, 0);
  objc_storeStrong((id *)&self->_updatedZones, 0);
  objc_storeStrong(&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_verificationCertificate, 0);
  objc_storeStrong((id *)&self->_databaseChangeToken, 0);
}

@end