@interface OTControlCLI
+ (id)annotateStatus:(id)a3;
- (OTControl)control;
- (OTControlCLI)initWithOTControl:(id)a3;
- (int)checkAndPrintEscrowRecords:(id)a3 error:(id)a4 json:(BOOL)a5;
- (int)checkCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5;
- (int)checkInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5;
- (int)checkRecoveryKeyWithArguments:(id)a3;
- (int)createCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 json:(BOOL)a5 timeout:(double)a6;
- (int)createInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 json:(BOOL)a5 timeout:(double)a6;
- (int)createInheritanceKeyWithClaimTokenAndWrappingKey:(id)a3 uuidString:(id)a4 claimToken:(id)a5 wrappingKey:(id)a6 json:(BOOL)a7 timeout:(double)a8;
- (int)depart:(id)a3;
- (int)disableWalrusWithArguments:(id)a3 timeout:(double)a4;
- (int)disableWebAccessWithArguments:(id)a3 timeout:(double)a4;
- (int)enableWalrusWithArguments:(id)a3 timeout:(double)a4;
- (int)enableWebAccessWithArguments:(id)a3 timeout:(double)a4;
- (int)fetchAccountSettingsWithArguments:(id)a3 json:(BOOL)a4;
- (int)fetchAccountWideSettingsWithArguments:(id)a3 useDefault:(BOOL)a4 forceFetch:(BOOL)a5 json:(BOOL)a6;
- (int)fetchAllBottles:(id)a3 control:(id)a4 overrideEscrowCache:(BOOL)a5;
- (int)fetchAllEscrowRecords:(id)a3 json:(BOOL)a4 overrideEscrowCache:(BOOL)a5;
- (int)fetchEscrowRecords:(id)a3 json:(BOOL)a4 overrideEscrowCache:(BOOL)a5;
- (int)fetchUserControllableViewsSyncStatus:(id)a3;
- (int)generateInheritanceKeyWithArguments:(id)a3 json:(BOOL)a4 timeout:(double)a5;
- (int)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 json:(BOOL)a6;
- (int)joinWithCustodianRecoveryKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7;
- (int)joinWithInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7;
- (int)joinWithRecoveryKeyWithArguments:(id)a3 recoveryKey:(id)a4;
- (int)performEscrowRecovery:(id)a3 recordID:(id)a4 appleID:(id)a5 secret:(id)a6 overrideForAccountScript:(BOOL)a7 overrideEscrowCache:(BOOL)a8;
- (int)performSilentEscrowRecovery:(id)a3 appleID:(id)a4 secret:(id)a5;
- (int)preflightJoinWithCustodianRecoveryKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7;
- (int)preflightJoinWithInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7;
- (int)preflightJoinWithRecoveryKeyWithArguments:(id)a3 recoveryKey:(id)a4;
- (int)printAccountMetadataWithArguments:(id)a3 json:(BOOL)a4;
- (int)recoverUsingBottleID:(id)a3 entropy:(id)a4 arguments:(id)a5 control:(id)a6;
- (int)recreateInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 wrappingKey:(id)a5 wrappedKey:(id)a6 claimToken:(id)a7 json:(BOOL)a8 timeout:(double)a9;
- (int)refetchCKKSPolicy:(id)a3;
- (int)removeCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5;
- (int)removeInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5;
- (int)removeRecoveryKeyWithArguments:(id)a3;
- (int)rerollWithArguments:(id)a3 json:(BOOL)a4;
- (int)reset:(id)a3 appleID:(id)a4 isGuitarfish:(BOOL)a5 dsid:(id)a6;
- (int)resetAccountCDPContentsWithArguments:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6;
- (int)resetOctagon:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 isGuitarfish:(BOOL)a7 timeout:(double)a8;
- (int)resetProtectedData:(id)a3 appleID:(id)a4 dsid:(id)a5 idmsTargetContext:(id)a6 idmsCuttlefishPassword:(id)a7 isGuitarfish:(BOOL)a8 notifyIdMS:(BOOL)a9;
- (int)setMachineIDOverride:(id)a3 machineID:(id)a4 json:(BOOL)a5;
- (int)setRecoveryKeyWithArguments:(id)a3;
- (int)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4;
- (int)signIn:(id)a3;
- (int)signOut:(id)a3;
- (int)simulateReceivePush:(id)a3 json:(BOOL)a4;
- (int)startOctagonStateMachine:(id)a3;
- (int)status:(id)a3 json:(BOOL)a4;
- (int)storeInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7;
- (int)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5;
- (int)tlkRecoverability:(id)a3;
- (void)printCRKWithPeer:(id)a3 information:(id)a4 prefix:(id)a5;
- (void)printPeer:(id)a3 prefix:(id)a4;
- (void)printPeers:(id)a3 egoPeerID:(id)a4 informationOnPeers:(id)a5 informationOnCRKs:(id)a6;
- (void)setControl:(id)a3;
@end

@implementation OTControlCLI

- (void).cxx_destruct
{
}

- (void)setControl:(id)a3
{
}

- (OTControl)control
{
  return (OTControl *)objc_getProperty(self, a2, 8, 1);
}

- (int)reset:(id)a3 appleID:(id)a4 isGuitarfish:(BOOL)a5 dsid:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)OTConfigurationContext);
  v13 = sub_100006AE8(v10, v9);

  [v12 setPasswordEquivalentToken:v13];
  [v12 setAuthenticationAppleID:v10];

  v14 = [v11 altDSID];
  [v12 setAltDSID:v14];

  v15 = [v11 contextID];
  [v12 setContext:v15];

  v16 = [v11 containerName];

  [v12 setContainerName:v16];
  [v12 setIsGuitarfish:v6];
  id v24 = 0;
  unsigned __int8 v17 = +[OTClique clearCliqueFromAccount:v12 error:&v24];
  id v18 = v24;
  v19 = v18;
  if (v18 || (v17 & 1) == 0)
  {
    v21 = __stderrp;
    id v22 = [v18 description];
    fprintf(v21, "Failed to wipe account data: %s\n", (const char *)[v22 UTF8String]);

    int v20 = 1;
  }
  else
  {
    puts("Account data wiped.");
    int v20 = 0;
  }

  return v20;
}

- (int)rerollWithArguments:(id)a3 json:(BOOL)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 1;
  v7 = [(OTControlCLI *)self control];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006E5C;
  v10[3] = &unk_100020610;
  BOOL v11 = a4;
  v10[4] = &v12;
  [v7 reroll:v6 reply:v10];

  int v8 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (int)printAccountMetadataWithArguments:(id)a3 json:(BOOL)a4
{
  id v6 = a3;
  v7 = [(OTControlCLI *)self control];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000075A0;
  v9[3] = &unk_100020748;
  BOOL v10 = a4;
  [v7 getAccountMetadata:v6 reply:v9];

  return 1;
}

- (int)setMachineIDOverride:(id)a3 machineID:(id)a4 json:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 1;
  BOOL v10 = [(OTControlCLI *)self control];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100007808;
  v13[3] = &unk_100020610;
  BOOL v14 = a5;
  v13[4] = &v15;
  [v10 setMachineIDOverride:v8 machineID:v9 reply:v13];

  int v11 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (int)fetchAccountWideSettingsWithArguments:(id)a3 useDefault:(BOOL)a4 forceFetch:(BOOL)a5 json:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  BOOL v10 = [v9 makeConfigurationContext];
  if (v8)
  {
    uint64_t v28 = 0;
    int v11 = (id *)&v28;
    uint64_t v12 = +[OTClique fetchAccountWideSettingsDefaultWithForceFetch:v7 configuration:v10 error:&v28];
  }
  else
  {
    uint64_t v27 = 0;
    int v11 = (id *)&v27;
    uint64_t v12 = +[OTClique fetchAccountWideSettingsWithForceFetch:v7 configuration:v10 error:&v27];
  }
  v13 = (void *)v12;
  id v14 = *v11;

  if (v14)
  {
    if (v6)
    {
      CFStringRef v31 = @"error";
      id v15 = [v14 description];
      id v32 = v15;
      int v16 = 1;
      uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      sub_100006F78(v17);
    }
    else
    {
      id v22 = __stderrp;
      id v15 = [v14 description];
      fprintf(v22, "Failed to fetch account wide settings: %s\n", (const char *)[v15 UTF8String]);
      int v16 = 1;
    }
  }
  else
  {
    if (v6)
    {
      v29[0] = @"walrus";
      int v18 = [v13 walrus];
      v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 enabled]);
      v29[1] = @"webAccess";
      v30[0] = v19;
      int v20 = [v13 webAccess];
      v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v20 enabled]);
      v30[1] = v21;
      id v15 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];

      sub_100006F78(v15);
    }
    else
    {
      puts("successfully fetched account wide settings!");
      v23 = [v13 walrus];
      if ([v23 enabled]) {
        id v24 = @"YES";
      }
      else {
        id v24 = @"NO";
      }
      printf("walrus enabled? %s\n", (const char *)[(__CFString *)v24 UTF8String]);

      id v15 = [v13 webAccess];
      if ([v15 enabled]) {
        v25 = @"YES";
      }
      else {
        v25 = @"NO";
      }
      printf("web access enabled? %s\n", (const char *)[(__CFString *)v25 UTF8String]);
    }
    int v16 = 0;
  }

  return v16;
}

- (int)fetchAccountSettingsWithArguments:(id)a3 json:(BOOL)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 1;
  BOOL v7 = [(OTControlCLI *)self control];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007CF0;
  v10[3] = &unk_100020728;
  BOOL v11 = a4;
  v10[4] = &v12;
  [v7 fetchAccountSettings:v6 reply:v10];

  int v8 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (int)disableWalrusWithArguments:(id)a3 timeout:(double)a4
{
  id v15 = a3;
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:a4];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 1;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = -86;
  id v7 = objc_alloc_init((Class)OTAccountSettings);
  id v8 = objc_alloc_init((Class)OTWalrus);
  [v8 setEnabled:0];
  [v7 setWalrus:v8];
  uint64_t v14 = v8;
  id v9 = v21;
  do
  {
    *((unsigned char *)v9 + 24) = 0;
    BOOL v10 = [(OTControlCLI *)self control];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100008144;
    v16[3] = &unk_1000204E8;
    id v11 = v6;
    id v17 = v11;
    int v18 = &v20;
    v19 = &v24;
    [v10 setAccountSetting:v15 setting:v7 reply:v16];

    id v9 = v21;
  }
  while (*((unsigned char *)v21 + 24));
  int v12 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (int)enableWalrusWithArguments:(id)a3 timeout:(double)a4
{
  id v15 = a3;
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:a4];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 1;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = -86;
  id v7 = objc_alloc_init((Class)OTAccountSettings);
  id v8 = objc_alloc_init((Class)OTWalrus);
  [v8 setEnabled:1];
  [v7 setWalrus:v8];
  uint64_t v14 = v8;
  id v9 = v21;
  do
  {
    *((unsigned char *)v9 + 24) = 0;
    BOOL v10 = [(OTControlCLI *)self control];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100008408;
    v16[3] = &unk_1000204E8;
    id v11 = v6;
    id v17 = v11;
    int v18 = &v20;
    v19 = &v24;
    [v10 setAccountSetting:v15 setting:v7 reply:v16];

    id v9 = v21;
  }
  while (*((unsigned char *)v21 + 24));
  int v12 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (int)enableWebAccessWithArguments:(id)a3 timeout:(double)a4
{
  id v15 = a3;
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:a4];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 1;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = -86;
  id v7 = objc_alloc_init((Class)OTAccountSettings);
  id v8 = objc_alloc_init((Class)OTWebAccess);
  [v8 setEnabled:1];
  [v7 setWebAccess:v8];
  uint64_t v14 = v8;
  id v9 = v21;
  do
  {
    *((unsigned char *)v9 + 24) = 0;
    BOOL v10 = [(OTControlCLI *)self control];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000086CC;
    v16[3] = &unk_1000204E8;
    id v11 = v6;
    id v17 = v11;
    int v18 = &v20;
    v19 = &v24;
    [v10 setAccountSetting:v15 setting:v7 reply:v16];

    id v9 = v21;
  }
  while (*((unsigned char *)v21 + 24));
  int v12 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (int)disableWebAccessWithArguments:(id)a3 timeout:(double)a4
{
  id v15 = a3;
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:a4];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 1;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = -86;
  id v7 = objc_alloc_init((Class)OTAccountSettings);
  id v8 = objc_alloc_init((Class)OTWebAccess);
  [v8 setEnabled:0];
  [v7 setWebAccess:v8];
  uint64_t v14 = v8;
  id v9 = v21;
  do
  {
    *((unsigned char *)v9 + 24) = 0;
    BOOL v10 = [(OTControlCLI *)self control];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100008990;
    v16[3] = &unk_1000204E8;
    id v11 = v6;
    id v17 = v11;
    int v18 = &v20;
    v19 = &v24;
    [v10 setAccountSetting:v15 setting:v7 reply:v16];

    id v9 = v21;
  }
  while (*((unsigned char *)v21 + 24));
  int v12 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (int)createInheritanceKeyWithClaimTokenAndWrappingKey:(id)a3 uuidString:(id)a4 claimToken:(id)a5 wrappingKey:(id)a6 json:(BOOL)a7 timeout:(double)a8
{
  id v26 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v13)
  {
    id v25 = [objc_alloc((Class)NSUUID) initWithUUIDString:v13];
    if (!v25)
    {
      int v16 = 1;
      fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      goto LABEL_14;
    }
  }
  else
  {
    id v25 = 0;
  }
  id v17 = +[NSDate dateWithTimeIntervalSinceNow:a8];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  int v39 = 1;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = -86;
  id v18 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v15 options:0];
  if (v18)
  {
    id v19 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v14 options:0];
    if (v19)
    {
      id v23 = v15;
      uint64_t v20 = v33;
      do
      {
        *((unsigned char *)v20 + 24) = 0;
        v21 = [(OTControlCLI *)self control];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_100008D44;
        v27[3] = &unk_100020700;
        id v28 = v17;
        v29 = &v32;
        v30 = &v36;
        BOOL v31 = a7;
        [v21 createInheritanceKey:v26 uuid:v25 claimTokenData:v19 wrappingKeyData:v18 reply:v27];

        uint64_t v20 = v33;
      }
      while (*((unsigned char *)v33 + 24));
      int v16 = *((_DWORD *)v37 + 6);
      id v15 = v23;
    }
    else
    {
      int v16 = 1;
      fwrite("bad base64 data for claimToken\n", 0x1FuLL, 1uLL, __stderrp);
    }
  }
  else
  {
    int v16 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

LABEL_14:
  return v16;
}

- (int)recreateInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 wrappingKey:(id)a5 wrappedKey:(id)a6 claimToken:(id)a7 json:(BOOL)a8 timeout:(double)a9
{
  id v37 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  if (v16)
  {
    id v20 = [objc_alloc((Class)NSUUID) initWithUUIDString:v16];
    if (!v20)
    {
      int v21 = 1;
      fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      goto LABEL_20;
    }
  }
  else
  {
    id v20 = 0;
  }
  uint64_t v36 = +[NSDate dateWithTimeIntervalSinceNow:a9];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  int v51 = 1;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = -86;
  id v22 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v17 options:0];
  if (v22)
  {
    id v23 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v18 options:0];
    if (v23)
    {
      id v24 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v19 options:0];
      if (v24)
      {
        id v34 = v23;
        id v35 = v22;
        id v33 = objc_alloc_init((Class)NSUUID);
        id v43 = 0;
        id v25 = [objc_alloc((Class)OTInheritanceKey) initWithWrappedKeyData:v23 wrappingKeyData:v22 claimTokenData:v24 uuid:v33 error:&v43];
        id v26 = v43;
        uint64_t v32 = v26;
        if (v25)
        {
          int v27 = v45;
          do
          {
            *((unsigned char *)v27 + 24) = 0;
            id v28 = [(OTControlCLI *)self control];
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472;
            v38[2] = sub_1000093DC;
            v38[3] = &unk_100020700;
            id v39 = v36;
            v40 = &v44;
            v41 = &v48;
            BOOL v42 = a8;
            [v28 recreateInheritanceKey:v37 uuid:v20 oldIK:v25 reply:v38];

            int v27 = v45;
          }
          while (*((unsigned char *)v45 + 24));
          int v21 = *((_DWORD *)v49 + 6);
        }
        else
        {
          v29 = __stderrp;
          id v30 = [v26 description];
          fprintf(v29, "failed to create OTInheritanceKey: %s\n", (const char *)[v30 UTF8String]);

          int v21 = 1;
        }

        id v23 = v34;
        id v22 = v35;
      }
      else
      {
        int v21 = 1;
        fwrite("bad base64 data for claimToken\n", 0x1FuLL, 1uLL, __stderrp);
      }
    }
    else
    {
      int v21 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }
  }
  else
  {
    int v21 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

LABEL_20:
  return v21;
}

- (int)checkInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = +[NSDate dateWithTimeIntervalSinceNow:a5];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 1;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = -86;
  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v9];
  if (v11)
  {
    id v16 = v9;
    int v12 = v22;
    do
    {
      *((unsigned char *)v12 + 24) = 0;
      id v13 = [(OTControlCLI *)self control];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000096F0;
      v17[3] = &unk_100020688;
      id v18 = v10;
      id v19 = &v21;
      id v20 = &v25;
      [v13 checkInheritanceKey:v8 uuid:v11 reply:v17];

      int v12 = v22;
    }
    while (*((unsigned char *)v22 + 24));
    int v14 = *((_DWORD *)v26 + 6);
    id v9 = v16;
  }
  else
  {
    int v14 = 1;
    fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (int)removeInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = +[NSDate dateWithTimeIntervalSinceNow:a5];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 1;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = -86;
  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v9];
  if (v11)
  {
    id v16 = v9;
    int v12 = v22;
    do
    {
      *((unsigned char *)v12 + 24) = 0;
      id v13 = [(OTControlCLI *)self control];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000099FC;
      v17[3] = &unk_1000204E8;
      id v18 = v10;
      id v19 = &v21;
      id v20 = &v25;
      [v13 removeInheritanceKey:v8 uuid:v11 reply:v17];

      int v12 = v22;
    }
    while (*((unsigned char *)v22 + 24));
    int v14 = *((_DWORD *)v26 + 6);
    id v9 = v16;
  }
  else
  {
    int v14 = 1;
    fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (int)preflightJoinWithInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = +[NSDate dateWithTimeIntervalSinceNow:a7];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  int v43 = 1;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = -86;
  id v17 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v13 options:0];
  if (v17)
  {
    id v18 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v14 options:0];
    if (v18)
    {
      id v19 = [objc_alloc((Class)NSUUID) initWithUUIDString:v15];
      id v20 = v19;
      if (v19)
      {
        id v30 = v19;
        id v35 = 0;
        id v21 = [objc_alloc((Class)OTInheritanceKey) initWithWrappedKeyData:v18 wrappingKeyData:v17 uuid:v19 error:&v35];
        id v22 = v35;
        v29 = v22;
        if (v21)
        {
          uint64_t v23 = v37;
          do
          {
            *((unsigned char *)v23 + 24) = 0;
            char v24 = [(OTControlCLI *)self control];
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_100009E2C;
            v31[3] = &unk_1000204E8;
            id v32 = v16;
            id v33 = &v36;
            id v34 = &v40;
            [v24 preflightJoinWithInheritanceKey:v12 inheritanceKey:v21 reply:v31];

            uint64_t v23 = v37;
          }
          while (*((unsigned char *)v37 + 24));
          int v25 = *((_DWORD *)v41 + 6);
        }
        else
        {
          id v26 = __stderrp;
          id v27 = [v22 description];
          fprintf(v26, "failed to create OTInheritanceKey: %s\n", (const char *)[v27 UTF8String]);

          int v25 = 1;
        }
        id v20 = v30;
      }
      else
      {
        int v25 = 1;
        fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      }
    }
    else
    {
      int v25 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }
  }
  else
  {
    int v25 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

- (int)joinWithInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = +[NSDate dateWithTimeIntervalSinceNow:a7];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  int v43 = 1;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = -86;
  id v17 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v13 options:0];
  if (v17)
  {
    id v18 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v14 options:0];
    if (v18)
    {
      id v19 = [objc_alloc((Class)NSUUID) initWithUUIDString:v15];
      id v20 = v19;
      if (v19)
      {
        id v30 = v19;
        id v35 = 0;
        id v21 = [objc_alloc((Class)OTInheritanceKey) initWithWrappedKeyData:v18 wrappingKeyData:v17 uuid:v19 error:&v35];
        id v22 = v35;
        v29 = v22;
        if (v21)
        {
          uint64_t v23 = v37;
          do
          {
            *((unsigned char *)v23 + 24) = 0;
            char v24 = [(OTControlCLI *)self control];
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_10000A25C;
            v31[3] = &unk_1000204E8;
            id v32 = v16;
            id v33 = &v36;
            id v34 = &v40;
            [v24 joinWithInheritanceKey:v12 inheritanceKey:v21 reply:v31];

            uint64_t v23 = v37;
          }
          while (*((unsigned char *)v37 + 24));
          int v25 = *((_DWORD *)v41 + 6);
        }
        else
        {
          id v26 = __stderrp;
          id v27 = [v22 description];
          fprintf(v26, "failed to create OTInheritanceKey: %s\n", (const char *)[v27 UTF8String]);

          int v25 = 1;
        }
        id v20 = v30;
      }
      else
      {
        int v25 = 1;
        fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      }
    }
    else
    {
      int v25 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }
  }
  else
  {
    int v25 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

- (int)storeInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = +[NSDate dateWithTimeIntervalSinceNow:a7];
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  int v42 = 1;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = -86;
  id v17 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v13 options:0];
  if (v17)
  {
    id v18 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v14 options:0];
    if (v18)
    {
      id v19 = [objc_alloc((Class)NSUUID) initWithUUIDString:v15];
      id v20 = v19;
      if (v19)
      {
        id v29 = v19;
        id v34 = 0;
        id v21 = [objc_alloc((Class)OTInheritanceKey) initWithWrappedKeyData:v18 wrappingKeyData:v17 uuid:v19 error:&v34];
        id v22 = v34;
        int v28 = v22;
        if (v21)
        {
          uint64_t v23 = v36;
          do
          {
            *((unsigned char *)v23 + 24) = 0;
            char v24 = [(OTControlCLI *)self control];
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            void v30[2] = sub_10000A640;
            v30[3] = &unk_1000204E8;
            id v31 = v16;
            id v32 = &v35;
            id v33 = &v39;
            [v24 storeInheritanceKey:v12 ik:v21 reply:v30];

            uint64_t v23 = v36;
          }
          while (*((unsigned char *)v36 + 24));
          int v25 = *((_DWORD *)v40 + 6);
        }
        else
        {
          id v26 = [v22 description];
          printf("failed to create OTInheritanceKey: %s\n", (const char *)[v26 UTF8String]);

          int v25 = 1;
        }
        id v20 = v29;
      }
      else
      {
        puts("bad format for inheritanceUUID");
        int v25 = 1;
      }
    }
    else
    {
      puts("bad base64 data for wrappedKey");
      int v25 = 1;
    }
  }
  else
  {
    puts("bad base64 data for wrappingKey");
    int v25 = 1;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v25;
}

- (int)generateInheritanceKeyWithArguments:(id)a3 json:(BOOL)a4 timeout:(double)a5
{
  id v8 = &v23;
  id v9 = a3;
  BOOL v10 = +[NSDate dateWithTimeIntervalSinceNow:a5];
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 1;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = -86;
  do
  {
    *id v8 = 0;
    id v11 = [(OTControlCLI *)self control];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000A8A4;
    v15[3] = &unk_100020700;
    id v12 = v10;
    id v16 = v12;
    id v17 = &v20;
    id v18 = &v24;
    BOOL v19 = a4;
    [v11 generateInheritanceKey:v9 uuid:0 reply:v15];

    id v8 = (char *)(v21 + 3);
  }
  while (*((unsigned char *)v21 + 24));
  int v13 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

- (int)createInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 json:(BOOL)a5 timeout:(double)a6
{
  id v18 = a3;
  id v10 = a4;
  if (v10)
  {
    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
    if (!v11)
    {
      int v12 = 1;
      fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      goto LABEL_8;
    }
  }
  else
  {
    id v11 = 0;
  }
  int v13 = &v27;
  id v14 = +[NSDate dateWithTimeIntervalSinceNow:a6];
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  int v31 = 1;
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = -86;
  do
  {
    char *v13 = 0;
    id v15 = [(OTControlCLI *)self control];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000ABBC;
    v19[3] = &unk_100020700;
    id v16 = v14;
    id v20 = v16;
    id v21 = &v24;
    uint64_t v22 = &v28;
    BOOL v23 = a5;
    [v15 createInheritanceKey:v18 uuid:v11 reply:v19];

    int v13 = (char *)(v25 + 3);
  }
  while (*((unsigned char *)v25 + 24));
  int v12 = *((_DWORD *)v29 + 6);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

LABEL_8:
  return v12;
}

- (int)preflightJoinWithRecoveryKeyWithArguments:(id)a3 recoveryKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 1;
  id v8 = [(OTControlCLI *)self control];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000ADFC;
  v11[3] = &unk_1000206D8;
  id v9 = v7;
  id v12 = v9;
  int v13 = &v14;
  [v8 preflightRecoverOctagonUsingRecoveryKey:v6 recoveryKey:v9 reply:v11];

  LODWORD(v8) = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);

  return (int)v8;
}

- (int)checkRecoveryKeyWithArguments:(id)a3
{
  v3 = [a3 makeConfigurationContext];
  id v12 = 0;
  unsigned int v4 = +[OTClique isRecoveryKeySet:v3 error:&v12];
  id v5 = v12;
  id v6 = v5;
  if (v5)
  {
    id v7 = __stderrp;
    id v8 = [v5 description];
    fprintf(v7, "check recovery key failed: %s\n", (const char *)[v8 UTF8String]);

    int v9 = 1;
  }
  else
  {
    id v10 = "not set";
    if (v4) {
      id v10 = "set";
    }
    printf("recovery key is %s\n", v10);
    int v9 = v4 ^ 1;
  }

  return v9;
}

- (int)joinWithRecoveryKeyWithArguments:(id)a3 recoveryKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 1;
  id v8 = [(OTControlCLI *)self control];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000B0D0;
  v11[3] = &unk_1000206B0;
  id v9 = v7;
  id v12 = v9;
  int v13 = &v14;
  [v8 joinWithRecoveryKey:v6 recoveryKey:v9 reply:v11];

  LODWORD(v8) = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);

  return (int)v8;
}

- (int)setRecoveryKeyWithArguments:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 1;
  uint64_t v16 = 0;
  id v5 = SecRKCreateRecoveryKeyString();
  id v6 = 0;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v10 = __stderrp;
    id v11 = [v6 description];
    fprintf(v10, "failed to create recovery key: %s\n", (const char *)[v11 UTF8String]);

    int v9 = *((_DWORD *)v18 + 6);
  }
  else
  {
    id v8 = [(OTControlCLI *)self control];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000B308;
    v13[3] = &unk_1000206B0;
    id v14 = v5;
    id v15 = &v17;
    [v8 createRecoveryKey:v4 recoveryKey:v14 reply:v13];

    int v9 = *((_DWORD *)v18 + 6);
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (int)removeRecoveryKeyWithArguments:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 1;
  id v5 = [(OTControlCLI *)self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B4A8;
  v7[3] = &unk_1000204C0;
  v7[4] = &v8;
  [v5 removeRecoveryKey:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)checkCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[NSDate dateWithTimeIntervalSinceNow:a5];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 1;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = -86;
  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v9];
  if (v11)
  {
    id v16 = v9;
    id v12 = v22;
    do
    {
      *((unsigned char *)v12 + 24) = 0;
      int v13 = [(OTControlCLI *)self control];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000B73C;
      v17[3] = &unk_100020688;
      id v18 = v10;
      uint64_t v19 = &v21;
      int v20 = &v25;
      [v13 checkCustodianRecoveryKey:v8 uuid:v11 reply:v17];

      id v12 = v22;
    }
    while (*((unsigned char *)v22 + 24));
    int v14 = *((_DWORD *)v26 + 6);
    id v9 = v16;
  }
  else
  {
    int v14 = 1;
    fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (int)removeCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[NSDate dateWithTimeIntervalSinceNow:a5];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 1;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = -86;
  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v9];
  if (v11)
  {
    id v16 = v9;
    id v12 = v22;
    do
    {
      *((unsigned char *)v12 + 24) = 0;
      int v13 = [(OTControlCLI *)self control];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000BA48;
      v17[3] = &unk_1000204E8;
      id v18 = v10;
      uint64_t v19 = &v21;
      int v20 = &v25;
      [v13 removeCustodianRecoveryKey:v8 uuid:v11 reply:v17];

      id v12 = v22;
    }
    while (*((unsigned char *)v22 + 24));
    int v14 = *((_DWORD *)v26 + 6);
    id v9 = v16;
  }
  else
  {
    int v14 = 1;
    fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (int)preflightJoinWithCustodianRecoveryKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = +[NSDate dateWithTimeIntervalSinceNow:a7];
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  int v43 = 1;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = -86;
  id v17 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v13 options:0];
  if (v17)
  {
    id v18 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v14 options:0];
    if (v18)
    {
      id v19 = [objc_alloc((Class)NSUUID) initWithUUIDString:v15];
      int v20 = v19;
      if (v19)
      {
        id v30 = v19;
        id v35 = 0;
        id v21 = [objc_alloc((Class)OTCustodianRecoveryKey) initWithWrappedKey:v18 wrappingKey:v17 uuid:v19 error:&v35];
        id v22 = v35;
        id v29 = v22;
        if (v21)
        {
          uint64_t v23 = v37;
          do
          {
            *((unsigned char *)v23 + 24) = 0;
            char v24 = [(OTControlCLI *)self control];
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_10000BE78;
            v31[3] = &unk_1000204E8;
            id v32 = v16;
            id v33 = &v36;
            id v34 = &v40;
            [v24 preflightJoinWithCustodianRecoveryKey:v12 custodianRecoveryKey:v21 reply:v31];

            uint64_t v23 = v37;
          }
          while (*((unsigned char *)v37 + 24));
          int v25 = *((_DWORD *)v41 + 6);
        }
        else
        {
          uint64_t v26 = __stderrp;
          id v27 = [v22 description];
          fprintf(v26, "failed to create OTCustodianRecoveryKey: %s\n", (const char *)[v27 UTF8String]);

          int v25 = 1;
        }
        int v20 = v30;
      }
      else
      {
        int v25 = 1;
        fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
      }
    }
    else
    {
      int v25 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }
  }
  else
  {
    int v25 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

- (int)joinWithCustodianRecoveryKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = +[NSDate dateWithTimeIntervalSinceNow:a7];
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  int v43 = 1;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = -86;
  id v17 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v13 options:0];
  if (v17)
  {
    id v18 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v14 options:0];
    if (v18)
    {
      id v19 = [objc_alloc((Class)NSUUID) initWithUUIDString:v15];
      int v20 = v19;
      if (v19)
      {
        id v30 = v19;
        id v35 = 0;
        id v21 = [objc_alloc((Class)OTCustodianRecoveryKey) initWithWrappedKey:v18 wrappingKey:v17 uuid:v19 error:&v35];
        id v22 = v35;
        id v29 = v22;
        if (v21)
        {
          uint64_t v23 = v37;
          do
          {
            *((unsigned char *)v23 + 24) = 0;
            char v24 = [(OTControlCLI *)self control];
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_10000C2A8;
            v31[3] = &unk_1000204E8;
            id v32 = v16;
            id v33 = &v36;
            id v34 = &v40;
            [v24 joinWithCustodianRecoveryKey:v12 custodianRecoveryKey:v21 reply:v31];

            uint64_t v23 = v37;
          }
          while (*((unsigned char *)v37 + 24));
          int v25 = *((_DWORD *)v41 + 6);
        }
        else
        {
          uint64_t v26 = __stderrp;
          id v27 = [v22 description];
          fprintf(v26, "failed to create OTCustodianRecoveryKey: %s\n", (const char *)[v27 UTF8String]);

          int v25 = 1;
        }
        int v20 = v30;
      }
      else
      {
        int v25 = 1;
        fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
      }
    }
    else
    {
      int v25 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }
  }
  else
  {
    int v25 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

- (int)createCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 json:(BOOL)a5 timeout:(double)a6
{
  id v18 = a3;
  id v10 = a4;
  if (v10)
  {
    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
    if (!v11)
    {
      int v12 = 1;
      fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
      goto LABEL_8;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v13 = &v27;
  id v14 = +[NSDate dateWithTimeIntervalSinceNow:a6];
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  int v31 = 1;
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = -86;
  do
  {
    char *v13 = 0;
    id v15 = [(OTControlCLI *)self control];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000C590;
    v19[3] = &unk_100020660;
    id v16 = v14;
    id v20 = v16;
    id v21 = &v24;
    id v22 = &v28;
    BOOL v23 = a5;
    [v15 createCustodianRecoveryKey:v18 uuid:v11 reply:v19];

    id v13 = (char *)(v25 + 3);
  }
  while (*((unsigned char *)v25 + 24));
  int v12 = *((_DWORD *)v29 + 6);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

LABEL_8:
  return v12;
}

- (int)resetAccountCDPContentsWithArguments:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 1;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  id v14 = [(OTControlCLI *)self control];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000C85C;
  v19[3] = &unk_1000206B0;
  id v21 = &v22;
  id v15 = v13;
  id v20 = v15;
  [v14 resetAccountCDPContents:v10 idmsTargetContext:v11 idmsCuttlefishPassword:v12 notifyIdMS:v6 reply:v19];

  dispatch_time_t v16 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v15, v16))
  {
    int v17 = 1;
    fwrite("timed out waiting for restore/recover\n", 0x26uLL, 1uLL, __stderrp);
    *((_DWORD *)v23 + 6) = 1;
  }
  else
  {
    int v17 = *((_DWORD *)v23 + 6);
  }

  _Block_object_dispose(&v22, 8);
  return v17;
}

- (int)fetchUserControllableViewsSyncStatus:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 1;
  id v5 = [(OTControlCLI *)self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C9EC;
  v7[3] = &unk_100020638;
  v7[4] = &v8;
  [v5 fetchUserControllableViewsSyncStatus:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 1;
  id v7 = [(OTControlCLI *)self control];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000CBA8;
  v9[3] = &unk_100020638;
  void v9[4] = &v10;
  [v7 setUserControllableViewsSyncStatus:v6 enabled:v4 reply:v9];

  LODWORD(v4) = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);

  return v4;
}

- (int)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 1;
  int v11 = [(OTControlCLI *)self control];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000CD8C;
  v13[3] = &unk_1000204C0;
  void v13[4] = &v14;
  [v11 tapToRadar:v8 description:v9 radar:v10 reply:v13];

  LODWORD(v11) = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);

  return (int)v11;
}

- (int)refetchCKKSPolicy:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 1;
  id v5 = [(OTControlCLI *)self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CF1C;
  v7[3] = &unk_1000204C0;
  v7[4] = &v8;
  [v5 refetchCKKSPolicy:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)simulateReceivePush:(id)a3 json:(BOOL)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 1;
  id v7 = [(OTControlCLI *)self control];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000D0B4;
  v10[3] = &unk_100020610;
  BOOL v11 = a4;
  v10[4] = &v12;
  [v7 simulateReceivePush:v6 reply:v10];

  int v8 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (int)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 json:(BOOL)a6
{
  uint64_t v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 1;
  BOOL v11 = [(OTControlCLI *)self control];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000D2F4;
  v13[3] = &unk_1000205E8;
  BOOL v14 = a6;
  void v13[4] = &v15;
  [v11 healthCheck:v10 skipRateLimitingCheck:v8 repair:v7 reply:v13];

  LODWORD(v7) = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);

  return v7;
}

- (int)fetchAllBottles:(id)a3 control:(id)a4 overrideEscrowCache:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  int v40 = 1;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_100006CB0;
  v35[4] = sub_100006CC0;
  id v36 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_100006CB0;
  id v33 = sub_100006CC0;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100006CB0;
  char v27 = sub_100006CC0;
  id v28 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000D758;
  v17[3] = &unk_100020560;
  if (v5) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 0;
  }
  id v19 = &v37;
  id v20 = v35;
  id v21 = &v29;
  uint64_t v22 = &v23;
  BOOL v11 = v9;
  int v18 = v11;
  [v8 fetchAllViableBottles:v7 source:v10 reply:v17];
  dispatch_time_t v12 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    int v13 = secLogObjForScope();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "findOptimalBottleIDsWithContextData failed to fetch bottles\n", v16, 2u);
    }

    int v14 = 1;
  }
  else
  {
    [(id)v30[5] enumerateObjectsUsingBlock:&stru_1000205A0];
    [(id)v24[5] enumerateObjectsUsingBlock:&stru_1000205C0];
    int v14 = *((_DWORD *)v38 + 6);
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v37, 8);

  return v14;
}

- (int)recoverUsingBottleID:(id)a3 entropy:(id)a4 arguments:(id)a5 control:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 1;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000DB00;
  v19[3] = &unk_100020538;
  uint64_t v22 = &v23;
  id v14 = v9;
  id v20 = v14;
  uint64_t v15 = v13;
  id v21 = v15;
  [v12 restoreFromBottle:v11 entropy:v10 bottleID:v14 reply:v19];
  dispatch_time_t v16 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v15, v16)) {
    fwrite("timed out waiting for restore/recover\n", 0x26uLL, 1uLL, __stderrp);
  }
  int v17 = *((_DWORD *)v24 + 6);

  _Block_object_dispose(&v23, 8);
  return v17;
}

- (int)status:(id)a3 json:(BOOL)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 1;
  id v7 = [(OTControlCLI *)self control];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000DCD0;
  v9[3] = &unk_100020510;
  BOOL v10 = a4;
  void v9[4] = self;
  void v9[5] = &v11;
  [v7 status:v6 reply:v9];

  LODWORD(self) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return (int)self;
}

- (int)tlkRecoverability:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)OTClique);
  BOOL v5 = [v3 makeConfigurationContext];
  id v6 = [v4 initWithContextData:v5];

  if (v6)
  {
    id v7 = [v3 makeConfigurationContext];
    id v54 = 0;
    id v8 = +[OTClique fetchAllEscrowRecords:v7 error:&v54];
    id v9 = v54;

    if (!v8 || v9)
    {
      id v33 = __stderrp;
      id v10 = [v9 description];
      fprintf(v33, "Failed to fetch escrow records: %s.\n", (const char *)[v10 UTF8String]);
    }
    else
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v10 = v8;
      id v43 = [v10 countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v43)
      {
        id v36 = v8;
        id v37 = v3;
        uint64_t v11 = *(void *)v51;
        id v40 = v6;
        int v41 = 1;
        uint64_t v38 = *(void *)v51;
        id v39 = v10;
        do
        {
          for (i = 0; i != v43; i = (char *)i + 1)
          {
            if (*(void *)v51 != v11) {
              objc_enumerationMutation(v10);
            }
            uint64_t v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            id v49 = 0;
            int v14 = [v6 tlkRecoverabilityForEscrowRecord:v13 error:&v49];
            id v15 = v49;
            if (v14 && ([v14 count] ? (BOOL v16 = v15 == 0) : (BOOL v16 = 0), v16))
            {
              long long v47 = 0u;
              long long v48 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              id v18 = v14;
              id v26 = [v18 countByEnumeratingWithState:&v45 objects:v55 count:16];
              if (v26)
              {
                id v27 = v26;
                id v42 = v15;
                uint64_t v28 = *(void *)v46;
                do
                {
                  for (j = 0; j != v27; j = (char *)j + 1)
                  {
                    if (*(void *)v46 != v28) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v30 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
                    id v31 = [v13 recordId];
                    printf("%s has recoverable view: %s\n", (const char *)[v31 UTF8String], (const char *)[v30 UTF8String]);
                  }
                  id v27 = [v18 countByEnumeratingWithState:&v45 objects:v55 count:16];
                }
                while (v27);
                int v41 = 0;
                id v10 = v39;
                id v6 = v40;
                uint64_t v11 = v38;
                id v15 = v42;
              }
              else
              {
                int v41 = 0;
              }
            }
            else
            {
              uint64_t v44 = v14;
              int v17 = __stderrp;
              id v18 = [v13 recordId];
              id v19 = (const char *)[v18 UTF8String];
              [v15 description];
              uint64_t v20 = v11;
              id v21 = v6;
              id v22 = v10;
              id v23 = v15;
              id v24 = objc_claimAutoreleasedReturnValue();
              id v35 = (const char *)[v24 UTF8String];
              uint64_t v25 = v17;
              int v14 = v44;
              fprintf(v25, "%s Failed TLK recoverability check: %s\n", v19, v35);

              id v15 = v23;
              id v10 = v22;
              id v6 = v21;
              uint64_t v11 = v20;
            }
          }
          id v43 = [v10 countByEnumeratingWithState:&v50 objects:v56 count:16];
        }
        while (v43);
        id v8 = v36;
        id v3 = v37;
        id v9 = 0;
        int v32 = v41;
        goto LABEL_30;
      }
    }
    int v32 = 1;
LABEL_30:

    goto LABEL_31;
  }
  int v32 = 1;
  fwrite("Failed to create clique\n", 0x18uLL, 1uLL, __stderrp);
LABEL_31:

  return v32;
}

- (int)performSilentEscrowRecovery:(id)a3 appleID:(id)a4 secret:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)OTICDPRecordContext);
  id v11 = objc_alloc_init((Class)OTCDPRecoveryInformation);
  [v10 setCdpInfo:v11];

  id v12 = [v10 cdpInfo];
  [v12 setRecoverySecret:v8];

  uint64_t v13 = [v10 cdpInfo];
  [v13 setContainsIcdpData:1];

  int v14 = [v10 cdpInfo];
  [v14 setSilentRecoveryAttempt:1];

  id v15 = [v10 cdpInfo];
  [v15 setUsesMultipleIcsc:1];

  id v16 = objc_alloc_init((Class)OTEscrowAuthenticationInformation);
  [v10 setAuthInfo:v16];

  int v17 = [v10 authInfo];
  [v17 setAuthenticationAppleid:v9];

  id v18 = sub_100006AE8(v9, 0);

  id v19 = [v10 authInfo];
  [v19 setAuthenticationPassword:v18];

  uint64_t v20 = [v7 makeConfigurationContext];
  id v31 = 0;
  id v21 = +[OTClique fetchEscrowRecords:v20 error:&v31];
  id v22 = v31;

  if (!v21 || v22)
  {
    id v26 = __stderrp;
    id v24 = [v22 description];
    fprintf(v26, "Failed to fetch escrow records: %s.\n", (const char *)[v24 UTF8String]);
LABEL_8:
    int v25 = 1;
    goto LABEL_9;
  }
  id v23 = [v7 makeConfigurationContext];
  id v30 = 0;
  id v24 = +[OTClique performSilentEscrowRecovery:v23 cdpContext:v10 allRecords:v21 error:&v30];
  id v22 = v30;

  if (!v24 || v22)
  {
    id v27 = __stderrp;
    id v28 = [v22 description];
    fprintf(v27, "Escrow recovery failed: %s\n", (const char *)[v28 UTF8String]);

    goto LABEL_8;
  }
  puts("Successfully performed escrow recovery.");
  int v25 = 0;
LABEL_9:

  return v25;
}

- (int)performEscrowRecovery:(id)a3 recordID:(id)a4 appleID:(id)a5 secret:(id)a6 overrideForAccountScript:(BOOL)a7 overrideEscrowCache:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = objc_alloc_init((Class)OTICDPRecordContext);
  id v18 = objc_alloc_init((Class)OTCDPRecoveryInformation);
  [v17 setCdpInfo:v18];

  id v19 = [v17 cdpInfo];
  [v19 setRecoverySecret:v16];

  uint64_t v20 = [v17 cdpInfo];
  [v20 setContainsIcdpData:1];

  id v21 = [v17 cdpInfo];
  [v21 setUsesMultipleIcsc:1];

  id v22 = objc_alloc_init((Class)OTEscrowAuthenticationInformation);
  [v17 setAuthInfo:v22];

  id v23 = [v17 authInfo];
  [v23 setAuthenticationAppleid:v15];

  id v24 = sub_100006AE8(v15, 0);
  int v25 = [v17 authInfo];
  [v25 setAuthenticationPassword:v24];

  id v26 = [v13 makeConfigurationContext];
  id v27 = v26;
  if (v8) {
    uint64_t v28 = 2;
  }
  else {
    uint64_t v28 = 0;
  }
  [v26 setEscrowFetchSource:v28];
  [v27 setOverrideForSetupAccountScript:v9];
  id v65 = 0;
  v58 = v27;
  uint64_t v29 = +[OTClique fetchEscrowRecords:v27 error:&v65];
  id v30 = v65;
  id v31 = v30;
  v57 = v29;
  if (!v29 || v30)
  {
    id v43 = __stderrp;
    id v44 = [v30 description];
    fprintf(v43, "Failed to fetch escrow records: %s\n", (const char *)[v44 UTF8String]);

    int v45 = 1;
  }
  else
  {
    v55 = v13;
    id v56 = v17;
    id v53 = v16;
    id v54 = v15;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v32 = v29;
    id v33 = [v32 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v62;
LABEL_8:
      uint64_t v36 = 0;
      while (1)
      {
        if (*(void *)v62 != v35) {
          objc_enumerationMutation(v32);
        }
        id v37 = *(void **)(*((void *)&v61 + 1) + 8 * v36);
        id v60 = 0;
        uint64_t v38 = [v37 escrowInformationMetadata];
        id v39 = [v38 peerInfo];
        uint64_t v40 = SOSPeerInfoCreateFromData();

        if (v40)
        {
          if ([(id)SOSPeerInfoGetPeerID() isEqualToString:v14])
          {
            id v46 = v37;

            if (!v46) {
              goto LABEL_23;
            }
            id v13 = v55;
            long long v47 = [v55 makeConfigurationContext];
            [v47 setEscrowFetchSource:2];
            id v59 = 0;
            long long v48 = +[OTClique performEscrowRecovery:v47 cdpContext:v56 escrowRecord:v46 error:&v59];
            id v49 = v59;
            id v31 = v49;
            if (!v48 || v49)
            {
              long long v50 = __stderrp;
              id v51 = [v49 description];
              fprintf(v50, "Escrow recovery failed: %s\n", (const char *)[v51 UTF8String]);

              int v45 = 1;
            }
            else
            {
              puts("Successfully performed escrow recovery.");
              int v45 = 0;
            }

            goto LABEL_26;
          }
        }
        else
        {
          int v41 = __stderrp;
          id v42 = [v60 description];
          fprintf(v41, "Failed SOSPeerInfoCreateFromData: %s\n", (const char *)[v42 UTF8String]);
        }
        if (v34 == (id)++v36)
        {
          id v34 = [v32 countByEnumeratingWithState:&v61 objects:v66 count:16];
          if (v34) {
            goto LABEL_8;
          }
          break;
        }
      }
    }

LABEL_23:
    int v45 = 1;
    fwrite("Failed to find escrow record to restore.\n", 0x29uLL, 1uLL, __stderrp);
    id v31 = 0;
    id v13 = v55;
LABEL_26:
    id v16 = v53;
    id v15 = v54;
    id v17 = v56;
  }

  return v45;
}

- (int)fetchAllEscrowRecords:(id)a3 json:(BOOL)a4 overrideEscrowCache:(BOOL)a5
{
  BOOL v5 = a4;
  if (a5) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = [a3 makeConfigurationContext];
  [v8 setEscrowFetchSource:v7];
  id v13 = 0;
  BOOL v9 = +[OTClique fetchAllEscrowRecords:v8 error:&v13];
  id v10 = v13;
  int v11 = [(OTControlCLI *)self checkAndPrintEscrowRecords:v9 error:v10 json:v5];

  return v11;
}

- (int)fetchEscrowRecords:(id)a3 json:(BOOL)a4 overrideEscrowCache:(BOOL)a5
{
  BOOL v5 = a4;
  if (a5) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = [a3 makeConfigurationContext];
  [v8 setEscrowFetchSource:v7];
  id v13 = 0;
  BOOL v9 = +[OTClique fetchEscrowRecords:v8 error:&v13];
  id v10 = v13;
  int v11 = [(OTControlCLI *)self checkAndPrintEscrowRecords:v9 error:v10 json:v5];

  return v11;
}

- (int)checkAndPrintEscrowRecords:(id)a3 error:(id)a4 json:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (!v7 || v8)
  {
    if (v5)
    {
      CFStringRef v56 = @"error";
      id v34 = [v8 description];
      v57 = v34;
      int v35 = 1;
      uint64_t v36 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      sub_100006F78(v36);
    }
    else
    {
      id v37 = __stderrp;
      id v38 = [v8 description];
      fprintf(v37, "fetching escrow records failed: %s\n", (const char *)[v38 UTF8String]);

      int v35 = 1;
    }
  }
  else
  {
    BOOL v45 = v5;
    if (!v5)
    {
      id v10 = [v7 count];
      id v11 = [v7 count];
      id v12 = "s";
      if (v11 == (id)1) {
        id v12 = (const char *)&unk_10001D6FE;
      }
      printf("Successfully fetched %lu record%s.\n", v10, v12);
    }
    id v13 = +[NSMutableArray array];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v44 = v7;
    id obj = v7;
    id v14 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v53;
      do
      {
        id v17 = 0;
        do
        {
          if (*(void *)v53 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v17);
          id v19 = [v18 escrowInformationMetadata];
          uint64_t v20 = [v19 peerInfo];
          if (!v20)
          {

LABEL_17:
            uint64_t v28 = [v18 recordId];
LABEL_18:
            uint64_t v29 = (void *)v28;
            [v13 addObject:v28];

            goto LABEL_19;
          }
          id v21 = (void *)v20;
          id v22 = [v18 escrowInformationMetadata];
          id v23 = [v22 peerInfo];
          id v24 = [v23 bytes];

          if (!v24) {
            goto LABEL_17;
          }
          id v51 = 0;
          int v25 = [v18 escrowInformationMetadata];
          id v26 = [v25 peerInfo];
          uint64_t v27 = SOSPeerInfoCreateFromData();

          if (v27)
          {
            uint64_t v28 = SOSPeerInfoGetPeerID();
            goto LABEL_18;
          }
          id v30 = __stderrp;
          id v31 = [v51 description];
          fprintf(v30, "Failed SOSPeerInfoCreateFromData: %s\n", (const char *)[v31 UTF8String]);

LABEL_19:
          id v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v32 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
        id v15 = v32;
      }
      while (v32);
    }

    if (v45)
    {
      CFStringRef v59 = @"escrowRecords";
      id v60 = v13;
      id v33 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      sub_100006F78(v33);
      id v7 = v44;
    }
    else
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v33 = v13;
      id v39 = [v33 countByEnumeratingWithState:&v47 objects:v58 count:16];
      id v7 = v44;
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v48;
        do
        {
          for (i = 0; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v48 != v41) {
              objc_enumerationMutation(v33);
            }
            printf("fetched record id: %s\n", (const char *)[*(id *)(*((void *)&v47 + 1) + 8 * i) UTF8String]);
          }
          id v40 = [v33 countByEnumeratingWithState:&v47 objects:v58 count:16];
        }
        while (v40);
      }
    }

    int v35 = 0;
    BOOL v9 = 0;
  }

  return v35;
}

- (void)printPeers:(id)a3 egoPeerID:(id)a4 informationOnPeers:(id)a5 informationOnCRKs:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v23 = a6;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v10);
        }
        id v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v18 = [v12 objectForKeyedSubscript:v17];
        if (v18)
        {
          if ([v17 isEqualToString:v11])
          {
            id v19 = self;
            uint64_t v20 = v18;
            CFStringRef v21 = @"    Self: ";
          }
          else
          {
            id v19 = self;
            uint64_t v20 = v18;
            CFStringRef v21 = @"    Peer: ";
          }
          [(OTControlCLI *)v19 printPeer:v20 prefix:v21];
        }
        else
        {
          id v22 = [v23 objectForKeyedSubscript:v17];
          if (v22) {
            [(OTControlCLI *)self printCRKWithPeer:v17 information:v22 prefix:@"    CRK: "];
          }
          else {
            printf("    Peer:  %s; further information missing\n",
          }
              (const char *)[v17 UTF8String]);
        }
      }
      id v14 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }
}

- (void)printCRKWithPeer:(id)a3 information:(id)a4 prefix:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v9 objectForKeyedSubscript:@"uuid"];
  id v11 = [v9 objectForKeyedSubscript:@"kind"];

  if (v8) {
    id v12 = (const char *)[v8 UTF8String];
  }
  else {
    id v12 = (const char *)&unk_10001D6FE;
  }
  id v17 = v7;
  id v13 = (const char *)[v17 UTF8String];
  id v14 = v10;
  uint64_t v15 = (const char *)[v14 UTF8String];
  if (v11) {
    uint64_t v16 = (const char *)[v11 UTF8String];
  }
  else {
    uint64_t v16 = "-";
  }
  printf("%s%s uuid: %s kind: %s\n", v12, v13, v15, v16);
}

- (void)printPeer:(id)a3 prefix:(id)a4
{
  id v27 = a4;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"peerID"];
  id v7 = [v5 objectForKeyedSubscript:@"permanentInfo"];
  id v8 = [v7 objectForKeyedSubscript:@"model_id"];

  id v9 = [v5 objectForKeyedSubscript:@"permanentInfo"];
  long long v26 = [v9 objectForKeyedSubscript:@"epoch"];

  id v10 = [v5 objectForKeyedSubscript:@"stableInfo"];
  id v11 = [v10 objectForKeyedSubscript:@"device_name"];

  id v12 = [v5 objectForKeyedSubscript:@"stableInfo"];
  id v13 = [v12 objectForKeyedSubscript:@"serial_number"];

  id v14 = [v5 objectForKeyedSubscript:@"stableInfo"];

  uint64_t v15 = [v14 objectForKeyedSubscript:@"os_version"];

  if (v27) {
    long long v25 = (const char *)[v27 UTF8String];
  }
  else {
    long long v25 = (const char *)&unk_10001D6FE;
  }
  id v16 = v6;
  long long v24 = (const char *)[v16 UTF8String];
  id v17 = v8;
  id v18 = (const char *)[v17 UTF8String];
  id v19 = v11;
  uint64_t v20 = (const char *)[v19 UTF8String];
  id v21 = v13;
  id v22 = (const char *)[v21 UTF8String];
  id v23 = v15;
  printf("%s%s hw:'%s' name:'%s' serial: '%s' os:'%s' epoch:%d\n", v25, v24, v18, v20, v22, (const char *)[v23 UTF8String], [v26 intValue]);
}

- (int)resetProtectedData:(id)a3 appleID:(id)a4 dsid:(id)a5 idmsTargetContext:(id)a6 idmsCuttlefishPassword:(id)a7 isGuitarfish:(BOOL)a8 notifyIdMS:(BOOL)a9
{
  BOOL v9 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = objc_alloc_init((Class)OTConfigurationContext);
  uint64_t v20 = sub_100006AE8(v17, v16);

  [v19 setPasswordEquivalentToken:v20];
  [v19 setAuthenticationAppleID:v17];

  id v21 = [v18 altDSID];
  [v19 setAltDSID:v21];

  id v22 = [v18 contextID];
  [v19 setContext:v22];

  id v23 = [v18 containerName];

  [v19 setContainerName:v23];
  [v19 setIsGuitarfish:v9];
  id v31 = 0;
  long long v24 = +[OTClique resetProtectedData:v19 idmsTargetContext:v15 idmsCuttlefishPassword:v14 notifyIdMS:a9 error:&v31];

  id v25 = v31;
  long long v26 = v25;
  if (!v24 || v25)
  {
    uint64_t v28 = __stderrp;
    id v29 = [v25 description];
    fprintf(v28, "resetProtectedData failed: %s\n", (const char *)[v29 UTF8String]);

    int v27 = 1;
  }
  else
  {
    puts("resetProtectedData succeeded");
    int v27 = 0;
  }

  return v27;
}

- (int)resetOctagon:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 isGuitarfish:(BOOL)a7 timeout:(double)a8
{
  BOOL v10 = a6;
  id v14 = &v31;
  id v23 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = +[NSDate dateWithTimeIntervalSinceNow:a8];
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 1;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = -86;
  do
  {
    char *v14 = 0;
    id v18 = [(OTControlCLI *)self control];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000FFE4;
    v24[3] = &unk_1000204E8;
    id v19 = v17;
    id v25 = v19;
    long long v26 = &v28;
    int v27 = &v32;
    LOBYTE(v22) = a7;
    [v18 resetAndEstablish:v23 resetReason:1 idmsTargetContext:v15 idmsCuttlefishPassword:v16 notifyIdMS:v10 accountSettings:0 isGuitarfish:v22 reply:v24];

    id v14 = (char *)(v29 + 3);
  }
  while (*((unsigned char *)v29 + 24));
  int v20 = *((_DWORD *)v33 + 6);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v20;
}

- (int)depart:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 1;
  id v5 = [(OTControlCLI *)self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000101B4;
  v7[3] = &unk_1000204C0;
  v7[4] = &v8;
  [v5 leaveClique:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)signOut:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 1;
  id v5 = [(OTControlCLI *)self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010344;
  v7[3] = &unk_1000204C0;
  v7[4] = &v8;
  [v5 appleAccountSignedOut:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)signIn:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 1;
  id v5 = [(OTControlCLI *)self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000104D4;
  v7[3] = &unk_1000204C0;
  v7[4] = &v8;
  [v5 appleAccountSignedIn:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)startOctagonStateMachine:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 1;
  id v5 = [(OTControlCLI *)self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010664;
  v7[3] = &unk_1000204C0;
  v7[4] = &v8;
  [v5 startOctagonStateMachine:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (OTControlCLI)initWithOTControl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OTControlCLI;
  id v6 = [(OTControlCLI *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_control, a3);
  }

  return v7;
}

+ (id)annotateStatus:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithDictionary:v3];
  id v5 = [v4 objectForKeyedSubscript:@"contextDump"];

  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"contextDump"];
    id v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];

    [v4 setObject:v7 forKeyedSubscript:@"contextDump"];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"self"];

    if (v8)
    {
      objc_super v9 = [v7 objectForKeyedSubscript:@"self"];
      uint64_t v10 = [v9 objectForKeyedSubscript:@"dynamicInfo"];

      if (v10)
      {
        int v11 = [v9 objectForKeyedSubscript:@"dynamicInfo"];
        id v12 = [v11 objectForKeyedSubscript:@"included"];
        if (v12)
        {
          id v13 = objc_alloc((Class)NSSet);
          id v14 = [v11 objectForKeyedSubscript:@"included"];
          id v34 = [v13 initWithArray:v14];
        }
        else
        {
          id v34 = objc_alloc_init((Class)NSSet);
        }

        id v16 = [v11 objectForKeyedSubscript:@"excluded"];
        if (v16)
        {
          id v17 = objc_alloc((Class)NSSet);
          id v18 = [v11 objectForKeyedSubscript:@"excluded"];
          id v19 = [v17 initWithArray:v18];
        }
        else
        {
          id v19 = objc_alloc_init((Class)NSSet);
        }

        int v20 = [v7 objectForKeyedSubscript:@"custodian_recovery_keys"];

        if (v20)
        {
          uint64_t v30 = v9;
          uint64_t v32 = v4;
          id v33 = v3;
          id v21 = +[NSMutableArray array];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          char v31 = v7;
          uint64_t v22 = [v7 objectForKeyedSubscript:@"custodian_recovery_keys"];
          id v23 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v36;
            do
            {
              for (i = 0; i != v24; i = (char *)i + 1)
              {
                if (*(void *)v36 != v25) {
                  objc_enumerationMutation(v22);
                }
                int v27 = +[NSMutableDictionary dictionaryWithDictionary:*(void *)(*((void *)&v35 + 1) + 8 * i)];
                uint64_t v28 = [v27 objectForKeyedSubscript:@"peerID"];
                if ([v34 containsObject:v28]) {
                  [v27 setObject:&__kCFBooleanTrue forKeyedSubscript:@"trusted_by_self"];
                }
                if ([v19 containsObject:v28]) {
                  [v27 setObject:&__kCFBooleanTrue forKeyedSubscript:@"distrusted_by_self"];
                }
                [v21 addObject:v27];
              }
              id v24 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
            }
            while (v24);
          }

          id v7 = v31;
          [v31 setObject:v21 forKeyedSubscript:@"custodian_recovery_keys"];
          id v4 = v32;
          id v15 = v32;

          id v3 = v33;
          objc_super v9 = v30;
        }
        else
        {
          id v15 = v3;
        }
      }
      else
      {
        id v15 = v3;
      }
    }
    else
    {
      id v15 = v3;
    }
  }
  else
  {
    id v15 = v3;
  }

  return v15;
}

@end