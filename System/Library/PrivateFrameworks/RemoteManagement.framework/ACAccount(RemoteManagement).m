@interface ACAccount(RemoteManagement)
+ (id)rm_createBearerAccountWithStore:()RemoteManagement username:description:enrollmentURL:authToken:;
+ (id)rm_createMAIDAccountWithStore:()RemoteManagement username:description:dsid:altDSID:personaIdentifier:enrollmentURL:;
+ (id)rm_createTestAccountWithStore:()RemoteManagement username:description:enrollmentURL:;
- (uint64_t)rm_DSID;
- (uint64_t)rm_accountScheme;
- (uint64_t)rm_altDSID;
- (uint64_t)rm_bearerToken;
- (uint64_t)rm_enrollmentToken;
- (uint64_t)rm_enrollmentURL;
- (uint64_t)rm_isAccountSchemeBearer;
- (uint64_t)rm_isAccountSchemeMAID;
- (uint64_t)rm_isAccountSchemeTest;
- (uint64_t)rm_managedByOlympus;
- (uint64_t)rm_managementSourceIdentifier;
- (uint64_t)rm_personaIdentifier;
- (uint64_t)rm_remoteManagingAccountIdentifier;
- (uint64_t)rm_setAccountScheme:()RemoteManagement;
- (uint64_t)rm_setAltDSID:()RemoteManagement;
- (uint64_t)rm_setBearerToken:()RemoteManagement;
- (uint64_t)rm_setDSID:()RemoteManagement;
- (uint64_t)rm_setEnrollmentToken:()RemoteManagement;
- (uint64_t)rm_setEnrollmentURL:()RemoteManagement;
- (uint64_t)rm_setManagementSourceIdentifier:()RemoteManagement;
- (uint64_t)rm_setPersonaIdentifier:()RemoteManagement;
- (uint64_t)rm_setRemoteManagingAccountIdentifier:()RemoteManagement;
@end

@implementation ACAccount(RemoteManagement)

+ (id)rm_createTestAccountWithStore:()RemoteManagement username:description:enrollmentURL:
{
  v9 = (objc_class *)MEMORY[0x263EFB1F8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v9 alloc];
  v15 = objc_msgSend(v13, "rm_RemoteManagementAccountType");

  v16 = (void *)[v14 initWithAccountType:v15];
  objc_msgSend(v16, "rm_setAccountScheme:", @"Test");
  [v16 setUsername:v12];

  [v16 setAccountDescription:v11];
  objc_msgSend(v16, "rm_setEnrollmentURL:", v10);

  [v16 setAuthenticated:1];

  return v16;
}

+ (id)rm_createBearerAccountWithStore:()RemoteManagement username:description:enrollmentURL:authToken:
{
  id v11 = (objc_class *)MEMORY[0x263EFB1F8];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v11 alloc];
  v18 = objc_msgSend(v16, "rm_RemoteManagementAccountType");

  v19 = (void *)[v17 initWithAccountType:v18];
  objc_msgSend(v19, "rm_setAccountScheme:", @"Bearer");
  [v19 setUsername:v15];

  [v19 setAccountDescription:v14];
  objc_msgSend(v19, "rm_setEnrollmentURL:", v13);

  objc_msgSend(v19, "rm_setBearerToken:", v12);
  [v19 setAuthenticated:1];

  return v19;
}

+ (id)rm_createMAIDAccountWithStore:()RemoteManagement username:description:dsid:altDSID:personaIdentifier:enrollmentURL:
{
  id v15 = (objc_class *)MEMORY[0x263EFB1F8];
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [v15 alloc];
  v24 = objc_msgSend(v22, "rm_RemoteManagementAccountType");

  v25 = (void *)[v23 initWithAccountType:v24];
  objc_msgSend(v25, "rm_setAccountScheme:", @"MAID");
  [v25 setUsername:v21];

  [v25 setAccountDescription:v20];
  objc_msgSend(v25, "rm_setDSID:", v19);

  objc_msgSend(v25, "rm_setAltDSID:", v18);
  objc_msgSend(v25, "rm_setPersonaIdentifier:", v17);

  objc_msgSend(v25, "rm_setEnrollmentURL:", v16);
  [v25 setAuthenticated:1];

  return v25;
}

- (uint64_t)rm_accountScheme
{
  return [a1 objectForKeyedSubscript:@"RMAccountScheme"];
}

- (uint64_t)rm_setAccountScheme:()RemoteManagement
{
  return [a1 setObject:a3 forKeyedSubscript:@"RMAccountScheme"];
}

- (uint64_t)rm_altDSID
{
  return [a1 objectForKeyedSubscript:@"RMAltDSID"];
}

- (uint64_t)rm_setAltDSID:()RemoteManagement
{
  return [a1 setObject:a3 forKeyedSubscript:@"RMAltDSID"];
}

- (uint64_t)rm_DSID
{
  return [a1 objectForKeyedSubscript:@"RMDSID"];
}

- (uint64_t)rm_setDSID:()RemoteManagement
{
  return [a1 setObject:a3 forKeyedSubscript:@"RMDSID"];
}

- (uint64_t)rm_enrollmentToken
{
  return [a1 objectForKeyedSubscript:@"RMEnrollmentToken"];
}

- (uint64_t)rm_setEnrollmentToken:()RemoteManagement
{
  return [a1 setObject:a3 forKeyedSubscript:@"RMEnrollmentToken"];
}

- (uint64_t)rm_enrollmentURL
{
  return [a1 objectForKeyedSubscript:@"RMEnrollmentURL"];
}

- (uint64_t)rm_setEnrollmentURL:()RemoteManagement
{
  return [a1 setObject:a3 forKeyedSubscript:@"RMEnrollmentURL"];
}

- (uint64_t)rm_managementSourceIdentifier
{
  return [a1 objectForKeyedSubscript:@"RMManagementSourceIdentifier"];
}

- (uint64_t)rm_setManagementSourceIdentifier:()RemoteManagement
{
  return [a1 setObject:a3 forKeyedSubscript:@"RMManagementSourceIdentifier"];
}

- (uint64_t)rm_remoteManagingAccountIdentifier
{
  return [a1 objectForKeyedSubscript:*MEMORY[0x263EFADF0]];
}

- (uint64_t)rm_setRemoteManagingAccountIdentifier:()RemoteManagement
{
  return [a1 setObject:a3 forKeyedSubscript:*MEMORY[0x263EFADF0]];
}

- (uint64_t)rm_personaIdentifier
{
  return [a1 objectForKeyedSubscript:*MEMORY[0x263EFADE0]];
}

- (uint64_t)rm_setPersonaIdentifier:()RemoteManagement
{
  return [a1 setObject:a3 forKeyedSubscript:*MEMORY[0x263EFADE0]];
}

- (uint64_t)rm_managedByOlympus
{
  v1 = [a1 objectForKeyedSubscript:@"additionalInfo"];
  v2 = [v1 objectForKeyedSubscript:@"managedByMDM"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)rm_bearerToken
{
  return [a1 objectForKeyedSubscript:@"RMBearerToken"];
}

- (uint64_t)rm_setBearerToken:()RemoteManagement
{
  return [a1 setObject:a3 forKeyedSubscript:@"RMBearerToken"];
}

- (uint64_t)rm_isAccountSchemeTest
{
  v1 = objc_msgSend(a1, "rm_accountScheme");
  uint64_t v2 = [v1 isEqualToString:@"Test"];

  return v2;
}

- (uint64_t)rm_isAccountSchemeBearer
{
  v1 = objc_msgSend(a1, "rm_accountScheme");
  uint64_t v2 = [v1 isEqualToString:@"Bearer"];

  return v2;
}

- (uint64_t)rm_isAccountSchemeMAID
{
  v1 = objc_msgSend(a1, "rm_accountScheme");
  uint64_t v2 = [v1 isEqualToString:@"MAID"];

  return v2;
}

@end