@interface MTChaperoneParser
- (BOOL)isKeybagRollingNeeded;
- (MTChaperoneParser)init;
- (id)_allCommands;
- (id)_applyRedemptionCode:(id)a3;
- (id)_clearPasscode:(id)a3;
- (id)_managedApplicationList:(id)a3;
- (id)_profileList:(id)a3;
- (id)_removeApplication:(id)a3;
- (id)_removeProfile:(id)a3;
- (id)_requestUnlockToken:(id)a3;
- (unint64_t)_profileInstallationStyleForRequest:(id)a3;
- (void)_installApplication:(id)a3 completionBlock:(id)a4;
- (void)_processRequest:(id)a3 accessRights:(unint64_t)a4 assertion:(id)a5 completionBlock:(id)a6;
- (void)commandDefaultMDMOptionsCompletionBlock:(id)a3;
- (void)commandProceedWithKeybagMigrationRequest:(id)a3 completionBlock:(id)a4;
- (void)commandSetDefaultMDMOptionsRequest:(id)a3 completionBlock:(id)a4;
- (void)processRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)waitUntilKeybagRollingHasBeenPerformedCompletionBlock:(id)a3 timeRemaining:(double)a4;
@end

@implementation MTChaperoneParser

- (MTChaperoneParser)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTChaperoneParser;
  v2 = [(MTChaperoneParser *)&v6 initWithManagingProfileIdentifier:0];
  if (v2)
  {
    v3 = objc_alloc_init(MTIPCUTunnelParser);
    iPCUParser = v2->_iPCUParser;
    v2->_iPCUParser = v3;

    [(MTChaperoneParser *)v2 setIsMDM:0];
  }
  return v2;
}

- (void)processRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
}

- (void)_processRequest:(id)a3 accessRights:(unint64_t)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 objectForKey:kMCTPRequestTypeKey];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  if (![v13 isEqualToString:@"DefaultMDMOptions"])
  {
    if ([v13 isEqualToString:@"SetDefaultMDMOptions"])
    {
      [(MTChaperoneParser *)self commandSetDefaultMDMOptionsRequest:v10 completionBlock:v12];
      goto LABEL_9;
    }
    if ([v13 isEqualToString:@"ProceedWithKeybagMigration"])
    {
      [(MTChaperoneParser *)self commandProceedWithKeybagMigrationRequest:v10 completionBlock:v12];
      goto LABEL_9;
    }
LABEL_8:
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000060A4;
    v15[3] = &unk_100010830;
    v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    v14.receiver = self;
    v14.super_class = (Class)MTChaperoneParser;
    [(MTChaperoneParser *)&v14 _processRequest:v16 accessRights:a4 assertion:v17 completionBlock:v15];

    goto LABEL_9;
  }
  [(MTChaperoneParser *)self commandDefaultMDMOptionsCompletionBlock:v12];
LABEL_9:
}

- (id)_allCommands
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006270;
  block[3] = &unk_1000107A0;
  block[4] = self;
  if (qword_100014BE0 != -1) {
    dispatch_once(&qword_100014BE0, block);
  }
  return (id)qword_100014BC8;
}

- (unint64_t)_profileInstallationStyleForRequest:(id)a3
{
  v3 = [a3 objectForKey:kMCTPRequestTypeKey];
  unint64_t v4 = [v3 isEqualToString:kMDMPRequestTypeInstallProfileSilent];

  return v4;
}

- (void)_installApplication:(id)a3 completionBlock:(id)a4
{
  id v4 = a4;
  if (v4)
  {
    v5 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000066F8;
    block[3] = &unk_100010858;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

- (id)_applyRedemptionCode:(id)a3
{
  return +[MTChaperoneParser responseWithStatus:kMCTPStatusCommandFormatError];
}

- (id)_managedApplicationList:(id)a3
{
  return +[MTChaperoneParser responseWithStatus:kMCTPStatusCommandFormatError];
}

- (id)_removeApplication:(id)a3
{
  return +[MTChaperoneParser responseWithStatus:kMCTPStatusCommandFormatError];
}

- (id)_profileList:(id)a3
{
  return [(MTChaperoneParser *)self _profileList:a3 filterFlags:85];
}

- (id)_removeProfile:(id)a3
{
  id v4 = [a3 objectForKey:kIdentifierKey];
  if (v4)
  {
    v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Chaperone requested removal of profile “%{public}@”", (uint8_t *)&v11, 0xCu);
    }
    objc_super v6 = +[MDMMCInterface profileIdentifiersWithFilterFlags:69];
    if ([v6 containsObject:v4])
    {
      uint64_t v7 = [(MTChaperoneParser *)self _removeProfileWithIdentifier:v4 installationType:0];
    }
    else
    {
      v9 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Chaperone attempted to remove profile unavailable to Chaperone", (uint8_t *)&v11, 2u);
      }
      uint64_t v7 = +[MDMParser responseWithStatus:kMCTPStatusAcknowledged];
    }
    v8 = (void *)v7;
  }
  else
  {
    v8 = +[MDMParser responseWithStatus:kMCTPStatusCommandFormatError];
  }

  return v8;
}

- (id)_requestUnlockToken:(id)a3
{
  if (+[MDMMCInterface isPasscodeSet])
  {
    id v3 = +[NSError errorWithDomain:DMCKeybagErrorDomain code:37002 userInfo:0];
    id v4 = +[MTChaperoneParser responseWithError:v3];
  }
  else
  {
    v5 = MDMKeybagCreateSupervisionEscrowWithPasscode();
    id v3 = 0;
    if (v5)
    {
      id v4 = +[MTChaperoneParser responseWithStatus:kMCTPStatusAcknowledged];
      [v4 setObject:v5 forKeyedSubscript:@"UnlockToken"];
    }
    else
    {
      id v4 = +[MTChaperoneParser responseWithError:v3];
    }
  }

  return v4;
}

- (id)_clearPasscode:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:kMDMPUnlockTokenKey];
  v12[1] = 0;
  id v4 = MDMKeybagRetrieveSupervisionEscrowSecret();
  id v5 = 0;
  objc_super v6 = v5;
  if (v4)
  {
    v12[0] = v5;
    unsigned __int8 v7 = +[MDMMCInterface clearPasscodeWithEscrowKeybagData:v3 secret:v4 outError:v12];
    id v8 = v12[0];

    if (v7)
    {
      uint64_t v9 = +[MDMParser responseWithStatus:kMCTPStatusAcknowledged];
      goto LABEL_7;
    }
    objc_super v6 = v8;
  }
  else
  {
    id v8 = v5;
  }
  uint64_t v9 = +[MDMParser responseWithError:v6];
LABEL_7:
  id v10 = (void *)v9;

  return v10;
}

- (void)commandDefaultMDMOptionsCompletionBlock:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  id v3 = +[MTChaperoneParser responseWithStatus:kMCTPStatusAcknowledged];
  id v4 = +[MDMOptionsUtilities defaultMDMOptions];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"DefaultMDMOptions"];
  }
  if (v5) {
    v5[2](v5, v3);
  }
}

- (void)commandSetDefaultMDMOptionsRequest:(id)a3 completionBlock:(id)a4
{
  id v8 = (void (**)(id, void *))a4;
  id v5 = [a3 objectForKeyedSubscript:@"DefaultMDMOptions"];
  objc_super v6 = +[MDMOptionsUtilities validatedMDMOptionsFromOptionsDictionary:v5];
  +[MDMOptionsUtilities setDefaultMDMOptions:v6];
  unsigned __int8 v7 = +[MTChaperoneParser responseWithStatus:kMCTPStatusAcknowledged];
  if (v8) {
    v8[2](v8, v7);
  }
}

- (BOOL)isKeybagRollingNeeded
{
  if (qword_100014BF0 != -1) {
    dispatch_once(&qword_100014BF0, &stru_100010878);
  }
  CFProperty = (void *)IORegistryEntryCreateCFProperty(dword_100014BEC, @"enable-rolld-dev1", 0, 0);
  id v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 67109120;
    v5[1] = CFProperty != 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Is keybag rolling needed: %d", (uint8_t *)v5, 8u);
  }

  return CFProperty != 0;
}

- (void)waitUntilKeybagRollingHasBeenPerformedCompletionBlock:(id)a3 timeRemaining:(double)a4
{
  id v4 = a3;
  int v15 = 0;
  int SystemGeneration = MKBKeyBagGetSystemGeneration();
  objc_super v6 = *(NSObject **)DMCLogObjects();
  if (SystemGeneration)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Could not get keybag system generation number.", buf, 2u);
    }
    if (v4)
    {
      unsigned __int8 v7 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100007530;
      block[3] = &unk_100010858;
      id v12 = v4;
      dispatch_async(v7, block);

      id v8 = v12;
LABEL_12:
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      int v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Keybag system generation status: %d", buf, 8u);
    }
    uint64_t v9 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Keybag system generation is sufficient to proceed.", buf, 2u);
    }
    if (v4)
    {
      id v10 = dispatch_get_global_queue(0, 0);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100007390;
      v13[3] = &unk_100010858;
      id v14 = v4;
      dispatch_async(v10, v13);

      id v8 = v14;
      goto LABEL_12;
    }
  }
}

- (void)commandProceedWithKeybagMigrationRequest:(id)a3 completionBlock:(id)a4
{
  CFStringRef v5 = (const __CFString *)kMDMKeybagMigrationHasBeenClearedByHostKey;
  CFStringRef v6 = (const __CFString *)kMDMNotBackedUpPreferencesDomain;
  CFStringRef v7 = (const __CFString *)kMDMPreferencesMobileUserName;
  id v8 = a4;
  CFPreferencesSetValue(v5, kCFBooleanTrue, v6, v7, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(v6, v7, kCFPreferencesAnyHost);
  MDMSendTriggerRollKeybagsNotification();
  [(MTChaperoneParser *)self waitUntilKeybagRollingHasBeenPerformedCompletionBlock:v8 timeRemaining:300.0];
}

- (void).cxx_destruct
{
}

@end