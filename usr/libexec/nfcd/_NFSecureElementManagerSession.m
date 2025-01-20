@interface _NFSecureElementManagerSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)_activateSecureElementWrapper:(id)a3;
- (BOOL)isDirty;
- (BOOL)isSessionSEOnly;
- (NFDriverWrapper)driverWrapper;
- (NFSecureElementWrapper)embeddedSecureElementWrapper;
- (_NFSecureElementManagerSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6;
- (id)_createResponseFromCommand:(id)a3 params:(id)a4 rapdu:(id)a5 duration:(unint64_t)a6;
- (id)_getAllApplets:(id *)a3;
- (id)_getSecureElementForAID:(id)a3;
- (id)_getSecureElementWrapperForSEID:(id)a3;
- (id)_processCommandDataProtocol:(id)a3 response:(id)a4;
- (id)_sendOneCommand:(id)a3 params:(id)a4 responses:(id)a5 lastStatus:(int64_t *)a6 totalTXTime:(unint64_t *)a7 failureDetected:(BOOL *)a8;
- (id)initialRoutingConfig;
- (void)_triggerProvisioningBugCatpture:(id)a3 response:(id)a4;
- (void)cleanup;
- (void)deleteAllAppletsWithCompletion:(id)a3;
- (void)deleteApplets:(id)a3 completion:(id)a4;
- (void)didExitRestrictedMode:(id)a3 completion:(id)a4;
- (void)didStartSession:(id)a3;
- (void)disableAuthorizationForApplets:(id)a3 andKey:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)disableAuthorizationForPasses:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)dumpDomain:(unsigned __int8)a3 forSEID:(id)a4 completion:(id)a5;
- (void)execRemoteAdminScript:(id)a3 params:(id)a4 completion:(id)a5;
- (void)expressModesInfoWithCompletion:(id)a3;
- (void)getAndResetLPEMCounterWithCompletion:(id)a3;
- (void)getAppletsWithCompletion:(id)a3;
- (void)getAttackCounterLogForSEID:(id)a3 acknowledgeLogs:(BOOL)a4 completion:(id)a5;
- (void)getAttackLogPresence:(id)a3 callback:(id)a4;
- (void)getCryptogramWithCompletion:(id)a3;
- (void)getExpressPassConfigWithCompletion:(id)a3;
- (void)getFelicaAppletState:(id)a3 completion:(id)a4;
- (void)getOSUpdateLogWithCompletion:(id)a3;
- (void)getServiceProviderDataForApplet:(id)a3 publicKey:(id)a4 scheme:(id)a5 completion:(id)a6;
- (void)getSignedPlatformDataForSeid:(id)a3 completion:(id)a4;
- (void)getTransitAppletState:(id)a3 completion:(id)a4;
- (void)handleFelicaStateEvent:(id)a3 appletAID:(id)a4;
- (void)handleTransactionEndEvent:(id)a3 atlData:(id)a4;
- (void)handleTransactionStartEvent:(id)a3 atlData:(id)a4;
- (void)markAsDirty:(BOOL)a3;
- (void)performPeerPaymentEnrollment:(id)a3 completion:(id)a4;
- (void)powerCycleSEID:(id)a3 completion:(id)a4;
- (void)refreshSecureElement:(id)a3 completion:(id)a4;
- (void)restoreAuthorizarionForKeys:(id)a3 onApplet:(id)a4 completion:(id)a5;
- (void)restoreAuthorizationForAllAppletsExcept:(id)a3 completion:(id)a4;
- (void)setDriverWrapper:(id)a3;
- (void)setEmbeddedSecureElementWrapper:(id)a3;
- (void)setExpressModesControlState:(int64_t)a3 completion:(id)a4;
- (void)setExpressPassConfig:(id)a3 restoreAuthorization:(BOOL)a4 completion:(id)a5;
- (void)signChallenge:(id)a3 completion:(id)a4;
- (void)signChallenge:(id)a3 forAID:(id)a4 completion:(id)a5;
- (void)signChallenge:(id)a3 useOSVersion:(BOOL)a4 completion:(id)a5;
- (void)stateInformationWithCompletion:(id)a3;
- (void)stateInformationWithRedirectInfo:(id)a3 appletFiltering:(BOOL)a4 completion:(id)a5;
- (void)stateInformationWithRedirectInfo:(id)a3 completion:(id)a4;
- (void)transceive:(id)a3 forSEID:(id)a4 toOS:(int64_t)a5 completion:(id)a6;
- (void)transceiveMultiple:(id)a3 forSEID:(id)a4 toOS:(int64_t)a5 completion:(id)a6;
- (void)validateSEPairingsWithCompletion:(id)a3;
@end

@implementation _NFSecureElementManagerSession

+ (id)validateEntitlements:(id)a3
{
  if ([a3 seSessionAccess])
  {
    id v5 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring SE access", v11, ClassName, Name, 110);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(a1);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v26 = v14;
      __int16 v27 = 2082;
      v28 = object_getClassName(a1);
      __int16 v29 = 2082;
      v30 = sel_getName(a2);
      __int16 v31 = 1024;
      int v32 = 110;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring SE access", buf, 0x22u);
    }

    id v15 = objc_alloc((Class)NSError);
    v16 = +[NSString stringWithUTF8String:"nfcd"];
    v23[0] = NSLocalizedDescriptionKey;
    v17 = +[NSString stringWithUTF8String:"Not entitled"];
    v24[0] = v17;
    v24[1] = &off_10031C678;
    v23[1] = @"Line";
    v23[2] = @"Method";
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v24[2] = v18;
    v23[3] = NSDebugDescriptionErrorKey;
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 111];
    v24[3] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    id v5 = [v15 initWithDomain:v16 code:32 userInfo:v20];
  }

  return v5;
}

- (_NFSecureElementManagerSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6
{
  v14.receiver = self;
  v14.super_class = (Class)_NFSecureElementManagerSession;
  v6 = [(_NFXPCSession *)&v14 initWithRemoteObject:a3 workQueue:a4 expressModeManager:a5 allowsBackgroundMode:a6];
  if (v6)
  {
    v7 = objc_alloc_init(NFFelicaStateEvent);
    felicaEvents = v6->_felicaEvents;
    v6->_felicaEvents = v7;

    uint64_t v9 = objc_opt_new();
    appletRequiresEndOfTransactionProcessing = v6->_appletRequiresEndOfTransactionProcessing;
    v6->_appletRequiresEndOfTransactionProcessing = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    appletChangedByTSM = v6->_appletChangedByTSM;
    v6->_appletChangedByTSM = (NSMutableArray *)v11;

    v6->_delayExpressMode = 0.0;
  }
  return v6;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig embeddedWiredModeWithFD:1];
}

- (void)didStartSession:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_NFSecureElementManagerSession;
  id v4 = a3;
  [(_NFSession *)&v9 didStartSession:v4];
  id v5 = +[_NFHardwareManager sharedHardwareManager];
  v6 = [v5 secureElementWrapper];
  embeddedSecureElementWrapper = self->_embeddedSecureElementWrapper;
  self->_embeddedSecureElementWrapper = v6;

  v8 = [(_NFXPCSession *)self remoteObject];
  [v8 didStartSession:v4];
}

- (void)markAsDirty:(BOOL)a3
{
  self->_seDirty = a3;
}

- (BOOL)isDirty
{
  return self->_seDirty;
}

- (BOOL)_activateSecureElementWrapper:(id)a3
{
  if (!a3)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i secureElementWrapper is nil!", v11, ClassName, Name, 169);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v18 = v14;
      __int16 v19 = 2082;
      v20 = object_getClassName(self);
      __int16 v21 = 2082;
      v22 = sel_getName(a2);
      __int16 v23 = 1024;
      int v24 = 169;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i secureElementWrapper is nil!", buf, 0x22u);
    }
  }
  return a3 != 0;
}

- (id)_getSecureElementWrapperForSEID:(id)a3
{
  id v5 = a3;
  v6 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
  v7 = [v6 serialNumber];
  if ([v7 isEqualToString:v5])
  {

LABEL_4:
    uint64_t v11 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
    goto LABEL_15;
  }
  v8 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
  objc_super v9 = [v8 systemOSSerialNumber];
  unsigned int v10 = [v9 isEqualToString:v5];

  if (v10) {
    goto LABEL_4;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v16 = 45;
    if (isMetaClass) {
      uint64_t v16 = 43;
    }
    v13(3, "%c[%{public}s %{public}s]:%i Unknown secure element id: %{public}@", v16, ClassName, Name, 181, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v24 = v19;
    __int16 v25 = 2082;
    int v26 = object_getClassName(self);
    __int16 v27 = 2082;
    v28 = sel_getName(a2);
    __int16 v29 = 1024;
    int v30 = 181;
    __int16 v31 = 2114;
    id v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unknown secure element id: %{public}@", buf, 0x2Cu);
  }

  uint64_t v11 = 0;
LABEL_15:

  return v11;
}

- (id)_getSecureElementForAID:(id)a3
{
  id v4 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
  v6 = sub_1002431DC(v5);

  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v32;
LABEL_3:
    uint64_t v11 = 0;
    v12 = v9;
    while (1)
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(v6);
      }
      id v9 = *(id *)(*((void *)&v31 + 1) + 8 * (void)v11);

      v13 = [v9 identifier];
      unsigned __int8 v14 = [v13 isEqualToString:v4];

      if (v14) {
        break;
      }
      uint64_t v11 = (char *)v11 + 1;
      v12 = v9;
      if (v8 == v11)
      {
        id v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v8) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    id v15 = [(_NFSecureElementManagerSession *)self _getAllApplets:0];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v16 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
    v6 = sub_1002431DC(v16);

    id v17 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (!v17)
    {
      int v24 = 0;
      goto LABEL_21;
    }
    id v18 = v17;
    id v9 = 0;
    uint64_t v19 = *(void *)v28;
LABEL_12:
    v20 = 0;
    __int16 v21 = v9;
    while (1)
    {
      if (*(void *)v28 != v19) {
        objc_enumerationMutation(v6);
      }
      id v9 = *(id *)(*((void *)&v27 + 1) + 8 * (void)v20);

      v22 = [v9 identifier];
      unsigned __int8 v23 = [v22 isEqualToString:v4];

      if (v23) {
        break;
      }
      v20 = (char *)v20 + 1;
      __int16 v21 = v9;
      if (v18 == v20)
      {
        id v18 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v18) {
          goto LABEL_12;
        }
        int v24 = 0;
        goto LABEL_20;
      }
    }
  }
  id v25 = v9;
  int v24 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
  id v9 = v6;
  v6 = v25;
LABEL_20:

LABEL_21:

  return v24;
}

- (id)_getAllApplets:(id *)a3
{
  v6 = objc_opt_new();
  id v7 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
  unsigned __int8 v8 = [(_NFSecureElementManagerSession *)self _activateSecureElementWrapper:v7];

  if ((v8 & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v17 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v21 = 45;
      if (isMetaClass) {
        uint64_t v21 = 43;
      }
      v17(3, "%c[%{public}s %{public}s]:%i Failed to activate embedded secure element", v21, ClassName, Name, 212);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v23 = object_getClass(self);
      if (class_isMetaClass(v23)) {
        int v24 = 43;
      }
      else {
        int v24 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v38 = v24;
      __int16 v39 = 2082;
      v40 = object_getClassName(self);
      __int16 v41 = 2082;
      v42 = sel_getName(a2);
      __int16 v43 = 1024;
      int v44 = 212;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to activate embedded secure element", buf, 0x22u);
    }

    id v25 = objc_alloc((Class)NSError);
    uint64_t v10 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    id v26 = +[NSString stringWithUTF8String:"Stack Error"];
    id v36 = v26;
    long long v27 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v28 = [v25 initWithDomain:v10 code:15 userInfo:v27];
    goto LABEL_17;
  }
  id v9 = [(_NFXPCSession *)self connection];
  uint64_t v10 = [v9 NF_whitelistChecker];

  unsigned __int8 v11 = [v10 useUnfilteredApplets];
  v12 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
  v13 = v12;
  if (v11)
  {
    uint64_t v34 = 0;
    unsigned __int8 v14 = (id *)&v34;
    uint64_t v15 = sub_100246F2C(v12, &v34);
  }
  else
  {
    uint64_t v33 = 0;
    unsigned __int8 v14 = (id *)&v33;
    uint64_t v15 = sub_100243D60(v12, &v33);
  }
  long long v29 = (void *)v15;
  id v26 = *v14;

  if (v29)
  {
    id v28 = v29;
    long long v27 = v28;
LABEL_17:
    long long v30 = v28;
    goto LABEL_18;
  }
  if (v26) {
    [v6 addObjectsFromArray:v26];
  }
  long long v27 = 0;
  long long v30 = 0;
  if (a3) {
    *a3 = v6;
  }
LABEL_18:

  return v30;
}

- (void)_triggerProvisioningBugCatpture:(id)a3 response:(id)a4
{
  id v5 = a4;
  v6 = [a3 objectForKey:@"kData"];
  id v7 = [v6 uppercaseString];

  v15[0] = @"Status Word";
  unsigned int v8 = [v5 status];
  uint64_t v9 = 0;
  uint64_t v10 = "Unknown Error";
  while ((unsigned __int16)word_100305B18[v9] != v8)
  {
    v9 += 8;
    if (v9 == 192) {
      goto LABEL_6;
    }
  }
  uint64_t v10 = *(const char **)&word_100305B18[v9 + 4];
LABEL_6:
  unsigned __int8 v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s (%04X)", v10, [v5 status]);
  v16[0] = v11;
  v16[1] = @"Serious Bug";
  v15[1] = @"Classification";
  v15[2] = @"FailureKey";
  v16[2] = @"ttrProvisioning";
  v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  if (([v7 hasPrefix:@"80E6"] & 1) != 0
    || [v7 hasPrefix:@"84E6"])
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Install Command, Response: 0x%04X", [v5 status]);
    sub_100199150((uint64_t)NFBugCapture, @"Applet Installation Failed", v13, v12);
    uint64_t v14 = 0;
LABEL_15:

    +[NFExceptionsCALogger postAnalyticsAppletProvisioningFailureEvent:responseCode:](NFExceptionsCALogger, "postAnalyticsAppletProvisioningFailureEvent:responseCode:", v14, [v5 status]);
    goto LABEL_16;
  }
  if (([v7 hasPrefix:@"80E8"] & 1) != 0
    || [v7 hasPrefix:@"84E8"])
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Load Command, Response: 0x%04X", [v5 status]);
    sub_100199150((uint64_t)NFBugCapture, @"Applet Loading Failed", v13, v12);
    uint64_t v14 = 1;
    goto LABEL_15;
  }
  if (([v7 hasPrefix:@"80E2"] & 1) != 0
    || [v7 hasPrefix:@"84E2"])
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Store Data Command, Response: 0x%04X", [v5 status]);
    sub_100199150((uint64_t)NFBugCapture, @"Applet Personalization Failed", v13, v12);
    uint64_t v14 = 2;
    goto LABEL_15;
  }
LABEL_16:
}

- (id)_processCommandDataProtocol:(id)a3 response:(id)a4
{
  id v7 = a3;
  unsigned int v8 = +[NFResponseAPDU responseWithData:a4];
  if (!v8)
  {
    id v23 = objc_alloc((Class)NSError);
    uint64_t v9 = +[NSString stringWithUTF8String:"nfcd"];
    v99[0] = NSLocalizedDescriptionKey;
    int v24 = +[NSString stringWithUTF8String:"Empty response"];
    v100[0] = v24;
    v100[1] = &off_10031C690;
    v99[1] = @"Line";
    v99[2] = @"Method";
    id v25 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v100[2] = v25;
    v99[3] = NSDebugDescriptionErrorKey;
    id v26 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 276];
    v100[3] = v26;
    long long v27 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:4];
    id v22 = [v23 initWithDomain:v9 code:66 userInfo:v27];

LABEL_30:
    goto LABEL_31;
  }
  uint64_t v9 = [v7 objectForKeyedSubscript:@"dataProtocol"];
  if (!v9) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      long long v29 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v79 = object_getClassName(v9);
      uint64_t v34 = 45;
      if (isMetaClass) {
        uint64_t v34 = 43;
      }
      v29(3, "%c[%{public}s %{public}s]:%i Incorrect data protocol parameter: %s", v34, ClassName, Name, 283, v79);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    NSErrorUserInfoKey v35 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v36 = object_getClass(self);
      if (class_isMetaClass(v36)) {
        int v37 = 43;
      }
      else {
        int v37 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v90 = v37;
      __int16 v91 = 2082;
      v92 = object_getClassName(self);
      __int16 v93 = 2082;
      v94 = sel_getName(a2);
      __int16 v95 = 1024;
      int v96 = 283;
      __int16 v97 = 2080;
      v98 = object_getClassName(v9);
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Incorrect data protocol parameter: %s", buf, 0x2Cu);
    }

    id v38 = objc_alloc((Class)NSError);
    int v24 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
    id v25 = +[NSString stringWithUTF8String:"Decoding Error"];
    id v88 = v25;
    __int16 v39 = &v88;
    v40 = &v87;
LABEL_29:
    __int16 v41 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v40 count:1];
    id v22 = [v38 initWithDomain:v24 code:23 userInfo:v41];

    goto LABEL_30;
  }
  if ([v9 isEqualToString:@"GlobalPlatform"]) {
    goto LABEL_5;
  }
  if (([v9 isEqualToString:@"MiFare"] & 1) == 0)
  {
    if ([v9 isEqualToString:@"FeliCa"])
    {
LABEL_5:
      if ([v8 status] == 36864)
      {
LABEL_17:
        id v22 = 0;
        goto LABEL_31;
      }
      goto LABEL_6;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v66 = NFLogGetLogger();
    if (v66)
    {
      v67 = (void (*)(uint64_t, const char *, ...))v66;
      v68 = object_getClass(self);
      BOOL v69 = class_isMetaClass(v68);
      v74 = object_getClassName(self);
      v77 = sel_getName(a2);
      uint64_t v70 = 45;
      if (v69) {
        uint64_t v70 = 43;
      }
      v67(3, "%c[%{public}s %{public}s]:%i Incorrect data protocol parameter: %{public}@", v70, v74, v77, 294, v9);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v71 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      v72 = object_getClass(self);
      if (class_isMetaClass(v72)) {
        int v73 = 43;
      }
      else {
        int v73 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v90 = v73;
      __int16 v91 = 2082;
      v92 = object_getClassName(self);
      __int16 v93 = 2082;
      v94 = sel_getName(a2);
      __int16 v95 = 1024;
      int v96 = 294;
      __int16 v97 = 2114;
      v98 = (const char *)v9;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Incorrect data protocol parameter: %{public}@", buf, 0x2Cu);
    }

    id v38 = objc_alloc((Class)NSError);
    int v24 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v85 = NSLocalizedDescriptionKey;
    id v25 = +[NSString stringWithUTF8String:"Decoding Error"];
    id v86 = v25;
    __int16 v39 = &v86;
    v40 = &v85;
    goto LABEL_29;
  }
  if ([v8 status] == 36864)
  {
    v58 = [v7 objectForKey:@"kData"];
    if (![v58 compare:@"80E2", 1, 0, objc_msgSend(@"80E2", "length") options range]
      || ![v58 compare:@"84E2", 1, 0, objc_msgSend(@"84E2", "length") options range])
    {
      v59 = [v8 data];
      unsigned int v60 = +[NFMSEIParser parseResponseAPDU:v59];

      if (v60)
      {
        id v61 = objc_alloc((Class)NSError);
        v62 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
        if (v60 >= 0x47) {
          int v63 = 71;
        }
        else {
          int v63 = v60;
        }
        v64 = +[NSString stringWithUTF8String:off_100305838[v63]];
        v84 = v64;
        v65 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        id v22 = [v61 initWithDomain:v62 code:v60 userInfo:v65];

        goto LABEL_31;
      }
    }

    goto LABEL_17;
  }
LABEL_6:
  uint64_t v10 = [v7 NF_numberForKey:@"kIgnoreResult"];
  if ([v10 BOOLValue])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v11 = NFLogGetLogger();
    if (v11)
    {
      v12 = (void (*)(uint64_t, const char *, ...))v11;
      v13 = object_getClass(self);
      BOOL v14 = class_isMetaClass(v13);
      uint64_t v15 = object_getClassName(self);
      uint64_t v16 = v10;
      id v17 = sel_getName(a2);
      uint64_t v78 = [v8 status];
      v75 = v17;
      uint64_t v10 = v16;
      uint64_t v18 = 45;
      if (v14) {
        uint64_t v18 = 43;
      }
      v12(5, "%c[%{public}s %{public}s]:%i Ignoring R-APDU Error: 0x%04x", v18, v15, v75, 319, v78);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v90 = v21;
      __int16 v91 = 2082;
      v92 = object_getClassName(self);
      __int16 v93 = 2082;
      v94 = sel_getName(a2);
      __int16 v95 = 1024;
      int v96 = 319;
      __int16 v97 = 1024;
      LODWORD(v98) = [v8 status];
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignoring R-APDU Error: 0x%04x", buf, 0x28u);
    }

    goto LABEL_17;
  }
  [(_NFSecureElementManagerSession *)self _triggerProvisioningBugCatpture:v7 response:v8];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v43 = NFLogGetLogger();
  if (v43)
  {
    int v44 = (void (*)(uint64_t, const char *, ...))v43;
    v45 = object_getClass(self);
    BOOL v46 = class_isMetaClass(v45);
    v47 = object_getClassName(self);
    v48 = v10;
    v49 = sel_getName(a2);
    uint64_t v80 = [v8 status];
    v76 = v49;
    uint64_t v10 = v48;
    uint64_t v50 = 45;
    if (v46) {
      uint64_t v50 = 43;
    }
    v44(3, "%c[%{public}s %{public}s]:%i R-APDU Error: 0x%04x", v50, v47, v76, 324, v80);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v51 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    v52 = object_getClass(self);
    if (class_isMetaClass(v52)) {
      int v53 = 43;
    }
    else {
      int v53 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v90 = v53;
    __int16 v91 = 2082;
    v92 = object_getClassName(self);
    __int16 v93 = 2082;
    v94 = sel_getName(a2);
    __int16 v95 = 1024;
    int v96 = 324;
    __int16 v97 = 1024;
    LODWORD(v98) = [v8 status];
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i R-APDU Error: 0x%04x", buf, 0x28u);
  }

  id v54 = objc_alloc((Class)NSError);
  v55 = +[NSString stringWithUTF8String:"nfcd"];
  NSErrorUserInfoKey v81 = NSLocalizedDescriptionKey;
  v56 = +[NSString stringWithUTF8String:"Commmand Error"];
  v82 = v56;
  v57 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
  id v22 = [v54 initWithDomain:v55 code:16 userInfo:v57];

LABEL_31:

  return v22;
}

- (void)handleFelicaStateEvent:(id)a3 appletAID:(id)a4
{
}

- (void)handleTransactionStartEvent:(id)a3 atlData:(id)a4
{
  id v6 = a3;
  id v7 = [v6 appletIdentifier];
  unsigned int v8 = [(_NFSecureElementManagerSession *)self _getSecureElementForAID:v7];

  if ([(_NFSecureElementManagerSession *)self _activateSecureElementWrapper:v8])
  {
    uint64_t v9 = [v6 appletIdentifier];
    uint64_t v10 = sub_1002473C8(v8, v9);

    if ([v10 isTypeF] && (sub_100253528(v8, v10) & 1) == 0)
    {
      appletRequiresEndOfTransactionProcessing = self->_appletRequiresEndOfTransactionProcessing;
      v12 = [v6 appletIdentifier];
      [(NSMutableArray *)appletRequiresEndOfTransactionProcessing addObject:v12];

      appletChangedByTSM = self->_appletChangedByTSM;
      BOOL v14 = [v6 appletIdentifier];
      [(NSMutableArray *)appletChangedByTSM addObject:v14];
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v16 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v20 = 45;
      if (isMetaClass) {
        uint64_t v20 = 43;
      }
      v16(3, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", v20, ClassName, Name, 348);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = object_getClass(self);
      if (class_isMetaClass(v22)) {
        int v23 = 43;
      }
      else {
        int v23 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v26 = v23;
      __int16 v27 = 2082;
      id v28 = object_getClassName(self);
      __int16 v29 = 2082;
      long long v30 = sel_getName(a2);
      __int16 v31 = 1024;
      int v32 = 348;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", buf, 0x22u);
    }
  }
}

- (void)handleTransactionEndEvent:(id)a3 atlData:(id)a4
{
  id v6 = a3;
  id v7 = [v6 appletIdentifier];

  if (v7)
  {
    appletChangedByTSM = self->_appletChangedByTSM;
    uint64_t v9 = [v6 appletIdentifier];
    [(NSMutableArray *)appletChangedByTSM addObject:v9];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i NULL AID !", v15, ClassName, Name, 371);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v21 = v18;
      __int16 v22 = 2082;
      int v23 = object_getClassName(self);
      __int16 v24 = 2082;
      id v25 = sel_getName(a2);
      __int16 v26 = 1024;
      int v27 = 371;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NULL AID !", buf, 0x22u);
    }
  }
}

- (void)cleanup
{
  v3 = NFSharedSignpostLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureElementManagerSession", buf, 2u);
  }

  if ([(_NFSession *)self needsCleanup] && ![(_NFSession *)self isSuspended])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 381);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = object_getClass(self);
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      v13 = object_getClassName(self);
      BOOL v14 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v177 = v12;
      *(_WORD *)&v177[4] = 2082;
      *(void *)&v177[6] = v13;
      *(_WORD *)&v177[14] = 2082;
      *(void *)&v177[16] = v14;
      __int16 v178 = 1024;
      int v179 = 381;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    uint64_t v15 = self->_appletRequiresEndOfTransactionProcessing;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v171 objects:v184 count:16];
    if (v16)
    {
      id v17 = v16;
      id v18 = *(id *)v172;
      v159 = self;
      id obj = *(id *)v172;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(id *)v172 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v171 + 1) + 8 * i);
          int v21 = [(_NFSecureElementManagerSession *)self _getSecureElementForAID:v20];
          if ([(_NFSecureElementManagerSession *)self _activateSecureElementWrapper:v21])
          {
            __int16 v22 = self;
            id v23 = v17;
            __int16 v24 = sub_1002473C8(v21, v20);
            id v170 = 0;
            id v25 = sub_100253230(v21, v24, &v170);
            __int16 v26 = v170;
            int v27 = v26;
            if (v25) {
              BOOL v28 = v26 == 0;
            }
            else {
              BOOL v28 = 0;
            }
            if (!v28)
            {
              __int16 v29 = v15;
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v30 = NFLogGetLogger();
              if (v30)
              {
                __int16 v31 = (void (*)(uint64_t, const char *, ...))v30;
                int v32 = object_getClass(v159);
                BOOL v33 = class_isMetaClass(v32);
                uint64_t v34 = object_getClassName(v159);
                v147 = sel_getName(a2);
                uint64_t v35 = 45;
                if (v33) {
                  uint64_t v35 = 43;
                }
                v31(3, "%c[%{public}s %{public}s]:%i processEndOfFelicaTransactionForApplet failed: %{public}@ or output dictionary is nil: %{public}@", v35, v34, v147, 396, v27, v25);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              id v36 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                int v37 = object_getClass(v159);
                if (class_isMetaClass(v37)) {
                  int v38 = 43;
                }
                else {
                  int v38 = 45;
                }
                __int16 v39 = object_getClassName(v159);
                v40 = sel_getName(a2);
                *(_DWORD *)buf = 67110402;
                *(_DWORD *)v177 = v38;
                *(_WORD *)&v177[4] = 2082;
                *(void *)&v177[6] = v39;
                *(_WORD *)&v177[14] = 2082;
                *(void *)&v177[16] = v40;
                __int16 v178 = 1024;
                int v179 = 396;
                __int16 v180 = 2114;
                v181 = v27;
                __int16 v182 = 2114;
                id v183 = v25;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i processEndOfFelicaTransactionForApplet failed: %{public}@ or output dictionary is nil: %{public}@", buf, 0x36u);
              }

              uint64_t v15 = v29;
              __int16 v22 = v159;
              id v18 = obj;
            }

            id v17 = v23;
            self = v22;
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v41 = NFLogGetLogger();
            if (v41)
            {
              v42 = (void (*)(uint64_t, const char *, ...))v41;
              uint64_t v43 = object_getClass(self);
              BOOL v44 = class_isMetaClass(v43);
              v45 = object_getClassName(self);
              v148 = sel_getName(a2);
              uint64_t v46 = 45;
              if (v44) {
                uint64_t v46 = 43;
              }
              v42(3, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", v46, v45, v148, 400);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            int v27 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v47 = object_getClass(self);
              if (class_isMetaClass(v47)) {
                int v48 = 43;
              }
              else {
                int v48 = 45;
              }
              v49 = object_getClassName(self);
              uint64_t v50 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v177 = v48;
              *(_WORD *)&v177[4] = 2082;
              *(void *)&v177[6] = v49;
              *(_WORD *)&v177[14] = 2082;
              *(void *)&v177[16] = v50;
              __int16 v178 = 1024;
              int v179 = 400;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", buf, 0x22u);
            }
          }
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v171 objects:v184 count:16];
      }
      while (v17);
    }

    if (self->_delayExpressMode > 0.0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v51 = NFLogGetLogger();
      if (v51)
      {
        v52 = (void (*)(uint64_t, const char *, ...))v51;
        int v53 = object_getClass(self);
        BOOL v54 = class_isMetaClass(v53);
        v55 = object_getClassName(self);
        v149 = sel_getName(a2);
        uint64_t v56 = 45;
        if (v54) {
          uint64_t v56 = 43;
        }
        v52(6, "%c[%{public}s %{public}s]:%i Delaying express transit after transaction", v56, v55, v149, 405);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v57 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v58 = object_getClass(self);
        if (class_isMetaClass(v58)) {
          int v59 = 43;
        }
        else {
          int v59 = 45;
        }
        unsigned int v60 = object_getClassName(self);
        id v61 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v177 = v59;
        *(_WORD *)&v177[4] = 2082;
        *(void *)&v177[6] = v60;
        *(_WORD *)&v177[14] = 2082;
        *(void *)&v177[16] = v61;
        __int16 v178 = 1024;
        int v179 = 405;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Delaying express transit after transaction", buf, 0x22u);
      }

      v62 = [(_NFSession *)self expressModeManager];
      sub_1000471EC(v62, self->_delayExpressMode);
    }
    if (![(_NFSecureElementManagerSession *)self isDirty]) {
      goto LABEL_94;
    }
    int v63 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];

    if (!v63) {
      goto LABEL_94;
    }
    v64 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
    unsigned int v65 = [(_NFSecureElementManagerSession *)self _activateSecureElementWrapper:v64];

    if (!v65) {
      goto LABEL_94;
    }
    uint64_t v66 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
    v67 = [v66 handle];
    v68 = [v67 info];

    BOOL v69 = +[_NFHardwareManager sharedHardwareManager];
    [v69 refreshSecureElementInfo];

    uint64_t v70 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
    id v71 = sub_10024379C(v70);

    v72 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
    id v73 = sub_100250F44(v72);

    v74 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
    id v75 = [v74 refreshISDCounter];

    if ([v68 migrationState] == (id)1
      || [v68 migrationContext] != (id)4 && objc_msgSend(v68, "migrationContext") != (id)5)
    {
LABEL_93:

LABEL_94:
      [(NFFelicaStateEvent *)self->_felicaEvents asDictionary];
      v169[0] = _NSConcreteStackBlock;
      v169[1] = 3221225472;
      v169[2] = sub_1001662AC;
      v169[3] = &unk_100305A80;
      v169[4] = self;
      v154 = v169[5] = a2;
      [v154 enumerateKeysAndObjectsUsingBlock:v169];
      long long v167 = 0u;
      long long v168 = 0u;
      long long v165 = 0u;
      long long v166 = 0u;
      objb = self->_appletChangedByTSM;
      id v125 = [(NSMutableArray *)objb countByEnumeratingWithState:&v165 objects:v175 count:16];
      if (v125)
      {
        id v126 = v125;
        uint64_t v127 = *(void *)v166;
        do
        {
          for (j = 0; j != v126; j = (char *)j + 1)
          {
            if (*(void *)v166 != v127) {
              objc_enumerationMutation(objb);
            }
            v129 = *(NSObject **)(*((void *)&v165 + 1) + 8 * (void)j);
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v130 = NFLogGetLogger();
            if (v130)
            {
              v131 = (void (*)(uint64_t, const char *, ...))v130;
              v132 = object_getClass(self);
              BOOL v133 = class_isMetaClass(v132);
              v145 = object_getClassName(self);
              v152 = sel_getName(a2);
              uint64_t v134 = 45;
              if (v133) {
                uint64_t v134 = 43;
              }
              v131(6, "%c[%{public}s %{public}s]:%i TSM update notification for AID %{public}@", v134, v145, v152, 450, v129);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v135 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
            {
              v136 = object_getClass(self);
              if (class_isMetaClass(v136)) {
                int v137 = 43;
              }
              else {
                int v137 = 45;
              }
              v138 = object_getClassName(self);
              v139 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)v177 = v137;
              *(_WORD *)&v177[4] = 2082;
              *(void *)&v177[6] = v138;
              *(_WORD *)&v177[14] = 2082;
              *(void *)&v177[16] = v139;
              __int16 v178 = 1024;
              int v179 = 450;
              __int16 v180 = 2114;
              v181 = v129;
              _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TSM update notification for AID %{public}@", buf, 0x2Cu);
            }

            v140 = +[_NFHardwareManager sharedHardwareManager];
            sub_1000FA94C(v140, (uint64_t)"com.apple.stockholm.se.update.by.tsm", v129);

            v141 = NFSharedSignpostLog();
            if (os_signpost_enabled(v141))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)v177 = "com.apple.stockholm.se.update.by.tsm";
              *(_WORD *)&v177[8] = 2112;
              *(void *)&v177[10] = v129;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v141, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UPDATE_BY_TSM_NOTIFICATION", "%s, aid: %@", buf, 0x16u);
            }
          }
          id v126 = [(NSMutableArray *)objb countByEnumeratingWithState:&v165 objects:v175 count:16];
        }
        while (v126);
      }

      if (self->_scriptExecuted)
      {
        v142 = +[_NFHardwareManager sharedHardwareManager];
        sub_1000FA94C(v142, (uint64_t)"com.apple.stockholm.tsm.script.executed", 0);
      }
      goto LABEL_115;
    }
    id obja = v68;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v76 = NFLogGetLogger();
    if (v76)
    {
      v77 = (void (*)(uint64_t, const char *, ...))v76;
      uint64_t v78 = object_getClass(self);
      BOOL v155 = class_isMetaClass(v78);
      v157 = object_getClassName(self);
      v79 = sel_getName(a2);
      uint64_t v80 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
      NSErrorUserInfoKey v81 = [v80 handle];
      v82 = [v81 info];
      id v83 = [v82 migrationState];
      v84 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
      NSErrorUserInfoKey v85 = [v84 handle];
      id v86 = [v85 info];
      id v153 = [v86 migrationContext];
      uint64_t v87 = 45;
      if (v155) {
        uint64_t v87 = 43;
      }
      v77(4, "%c[%{public}s %{public}s]:%i Recovering slam in state %lu context %lu", v87, v157, v79, 425, v83, v153);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v88 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      v89 = object_getClass(self);
      if (class_isMetaClass(v89)) {
        int v90 = 43;
      }
      else {
        int v90 = 45;
      }
      int v158 = v90;
      v156 = object_getClassName(self);
      __int16 v91 = sel_getName(a2);
      v92 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
      __int16 v93 = [v92 handle];
      v94 = [v93 info];
      __int16 v95 = [v94 migrationState];
      int v96 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
      __int16 v97 = [v96 handle];
      v98 = [v97 info];
      id v99 = [v98 migrationContext];
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v177 = v158;
      *(_WORD *)&v177[4] = 2082;
      *(void *)&v177[6] = v156;
      *(_WORD *)&v177[14] = 2082;
      *(void *)&v177[16] = v91;
      __int16 v178 = 1024;
      int v179 = 425;
      __int16 v180 = 2048;
      v181 = v95;
      __int16 v182 = 2048;
      id v183 = v99;
      _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Recovering slam in state %lu context %lu", buf, 0x36u);
    }
    v100 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
    v101 = [v100 recoverSLAM];

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v102 = NFLogGetLogger();
    v103 = (void (*)(uint64_t, const char *, ...))v102;
    if (v101)
    {
      if (v102)
      {
        v104 = object_getClass(self);
        BOOL v105 = class_isMetaClass(v104);
        v144 = object_getClassName(self);
        v150 = sel_getName(a2);
        uint64_t v106 = 45;
        if (v105) {
          uint64_t v106 = 43;
        }
        v103(3, "%c[%{public}s %{public}s]:%i Failed to recover SLAM? %{public}@", v106, v144, v150, 428, v101);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v107 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
        goto LABEL_92;
      }
      v108 = object_getClass(self);
      if (class_isMetaClass(v108)) {
        int v109 = 43;
      }
      else {
        int v109 = 45;
      }
      v110 = object_getClassName(self);
      v111 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v177 = v109;
      *(_WORD *)&v177[4] = 2082;
      *(void *)&v177[6] = v110;
      *(_WORD *)&v177[14] = 2082;
      *(void *)&v177[16] = v111;
      __int16 v178 = 1024;
      int v179 = 428;
      __int16 v180 = 2114;
      v181 = v101;
      v112 = "%c[%{public}s %{public}s]:%i Failed to recover SLAM? %{public}@";
      v113 = v107;
      os_log_type_t v114 = OS_LOG_TYPE_ERROR;
      uint32_t v115 = 44;
    }
    else
    {
      if (v102)
      {
        v116 = object_getClass(self);
        BOOL v117 = class_isMetaClass(v116);
        v118 = object_getClassName(self);
        v151 = sel_getName(a2);
        uint64_t v119 = 45;
        if (v117) {
          uint64_t v119 = 43;
        }
        v103(6, "%c[%{public}s %{public}s]:%i SLAM Recovery successful", v119, v118, v151, 430);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v107 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_92;
      }
      v120 = object_getClass(self);
      if (class_isMetaClass(v120)) {
        int v121 = 43;
      }
      else {
        int v121 = 45;
      }
      v122 = object_getClassName(self);
      v123 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v177 = v121;
      *(_WORD *)&v177[4] = 2082;
      *(void *)&v177[6] = v122;
      *(_WORD *)&v177[14] = 2082;
      *(void *)&v177[16] = v123;
      __int16 v178 = 1024;
      int v179 = 430;
      v112 = "%c[%{public}s %{public}s]:%i SLAM Recovery successful";
      v113 = v107;
      os_log_type_t v114 = OS_LOG_TYPE_DEFAULT;
      uint32_t v115 = 34;
    }
    _os_log_impl((void *)&_mh_execute_header, v113, v114, v112, buf, v115);
LABEL_92:

    v124 = +[_NFHardwareManager sharedHardwareManager];
    [v124 refreshSecureElementInfo];

    v68 = obja;
    goto LABEL_93;
  }
LABEL_115:
  v164.receiver = self;
  v164.super_class = (Class)_NFSecureElementManagerSession;
  [(_NFSession *)&v164 cleanup];
  v143 = NFSharedSignpostLog();
  if (os_signpost_enabled(v143))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v143, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureElementManagerSession", buf, 2u);
  }
}

- (void)stateInformationWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void, id))a3;
  if ([(_NFSession *)self didStart]
    && ![(_NFSession *)self isSuspended]
    && ![(_NFSession *)self didEnd])
  {
    CFStringRef v26 = @"version";
    id v25 = +[NSNumber numberWithInt:2];
    int v27 = v25;
    int v21 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];

    [(_NFSecureElementManagerSession *)self stateInformationWithRedirectInfo:v21 completion:v5];
    goto LABEL_15;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    int v12 = [(_NFSession *)self sessionUID];
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v13, ClassName, Name, 470, v12);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  BOOL v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    id v17 = object_getClassName(self);
    id v18 = sel_getName(a2);
    uint64_t v19 = [(_NFSession *)self sessionUID];
    *(_DWORD *)buf = 67110146;
    int v31 = v16;
    __int16 v32 = 2082;
    BOOL v33 = v17;
    __int16 v34 = 2082;
    uint64_t v35 = v18;
    __int16 v36 = 1024;
    int v37 = 470;
    __int16 v38 = 2114;
    __int16 v39 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
  }
  if (v5)
  {
    id v20 = objc_alloc((Class)NSError);
    int v21 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    __int16 v22 = +[NSString stringWithUTF8String:"Session not active"];
    __int16 v29 = v22;
    id v23 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v24 = [v20 initWithDomain:v21 code:54 userInfo:v23];
    v5[2](v5, 0, v24);

LABEL_15:
  }
}

- (void)stateInformationWithRedirectInfo:(id)a3 completion:(id)a4
{
}

- (void)stateInformationWithRedirectInfo:(id)a3 appletFiltering:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_NFSecureElementManagerSession;
  uint64_t v11 = [(_NFSession *)&v19 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100166904;
  block[3] = &unk_100304740;
  id v16 = v10;
  SEL v17 = a2;
  block[4] = self;
  id v15 = v9;
  BOOL v18 = a4;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, block);
}

- (void)signChallenge:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFSecureElementManagerSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10016729C;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)signChallenge:(id)a3 useOSVersion:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_NFSecureElementManagerSession;
  id v11 = [(_NFSession *)&v19 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100167DF8;
  block[3] = &unk_100304740;
  id v16 = v10;
  SEL v17 = a2;
  BOOL v18 = a4;
  block[4] = self;
  id v15 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, block);
}

- (void)signChallenge:(id)a3 forAID:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_NFSecureElementManagerSession;
  id v12 = [(_NFSession *)&v21 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100168C78;
  block[3] = &unk_100302250;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  dispatch_async(v12, block);
}

- (void)getSignedPlatformDataForSeid:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFSecureElementManagerSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100169A64;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)getAppletsWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSecureElementManagerSession;
  id v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016A158;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)deleteApplets:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFSecureElementManagerSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10016A614;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)deleteAllAppletsWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSecureElementManagerSession;
  id v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016AFD8;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)transceive:(id)a3 forSEID:(id)a4 toOS:(int64_t)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_NFSecureElementManagerSession;
  id v14 = [(_NFSession *)&v24 workQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10016BE50;
  v18[3] = &unk_100305AA8;
  v18[4] = self;
  id v19 = v12;
  id v20 = v11;
  id v21 = v13;
  SEL v22 = a2;
  int64_t v23 = a5;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  dispatch_async(v14, v18);
}

- (void)transceiveMultiple:(id)a3 forSEID:(id)a4 toOS:(int64_t)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_NFSecureElementManagerSession;
  id v14 = [(_NFSession *)&v24 workQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10016C35C;
  v18[3] = &unk_100305AA8;
  v18[4] = self;
  id v19 = v12;
  id v20 = v11;
  id v21 = v13;
  SEL v22 = a2;
  int64_t v23 = a5;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  dispatch_async(v14, v18);
}

- (id)_createResponseFromCommand:(id)a3 params:(id)a4 rapdu:(id)a5 duration:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v12 = objc_opt_new();
  id v13 = [v9 NF_stringForKey:@"kMessageName"];
  id v14 = [v10 NF_asHexString];

  [v12 setObject:v14 forKeyedSubscript:@"kData"];
  id v15 = [v9 objectForKeyedSubscript:@"kMessageId"];
  [v12 setObject:v15 forKeyedSubscript:@"kMessageId"];

  LODWORD(v14) = [v11 includeAPDUDuration];
  if (v14)
  {
    id v16 = +[NSNumber numberWithUnsignedLongLong:a6];
    [v12 setObject:v16 forKeyedSubscript:@"durationInMS"];
  }
  if (v13)
  {
    id v17 = [v13 stringByAppendingString:@"_RESP"];
    [v12 setObject:v17 forKeyedSubscript:@"kMessageName"];
  }
  id v18 = [v9 NF_stringForKey:@"dataProtocol"];
  if (v18) {
    [v12 setObject:v18 forKeyedSubscript:@"dataProtocol"];
  }

  return v12;
}

- (id)_sendOneCommand:(id)a3 params:(id)a4 responses:(id)a5 lastStatus:(int64_t *)a6 totalTXTime:(unint64_t *)a7 failureDetected:(BOOL *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v139 = a5;
  id v14 = [v12 NF_numberForKey:@"kChainingResponse"];
  uint64_t v15 = [v12 NF_stringForKey:@"kMessageName"];
  uint64_t v16 = [v12 NF_stringForKey:@"kData"];
  uint64_t v17 = +[NSData NF_dataWithHexString:v16];
  v140 = (void *)v17;
  id v141 = v13;
  v138 = v14;
  if (!v17)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v36 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      if (v15) {
        CFStringRef v41 = (const __CFString *)v15;
      }
      else {
        CFStringRef v41 = @"NO_NAME";
      }
      uint64_t v42 = 45;
      if (isMetaClass) {
        uint64_t v42 = 43;
      }
      v36(3, "%c[%{public}s %{public}s]:%i Invalid C-APDU %{public}@", v42, ClassName, Name, 1022, v41);
    }
    int v137 = (void *)v16;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v43 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      BOOL v44 = object_getClass(self);
      if (class_isMetaClass(v44)) {
        int v45 = 43;
      }
      else {
        int v45 = 45;
      }
      uint64_t v46 = object_getClassName(self);
      v47 = sel_getName(a2);
      LODWORD(buf) = 67110146;
      if (v15) {
        CFStringRef v48 = (const __CFString *)v15;
      }
      else {
        CFStringRef v48 = @"NO_NAME";
      }
      HIDWORD(buf) = v45;
      *(_WORD *)v156 = 2082;
      *(void *)&v156[2] = v46;
      *(_WORD *)&v156[10] = 2082;
      *(void *)&v156[12] = v47;
      *(_WORD *)&v156[20] = 1024;
      *(_DWORD *)&v156[22] = 1022;
      __int16 v157 = 2114;
      uint64_t v158 = (uint64_t)v48;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid C-APDU %{public}@", (uint8_t *)&buf, 0x2Cu);
    }

    id v49 = objc_alloc((Class)NSError);
    +[NSString stringWithUTF8String:"nfcd"];
    v51 = uint64_t v50 = a2;
    v153[0] = NSLocalizedDescriptionKey;
    v52 = +[NSString stringWithUTF8String:"Decoding Error"];
    v154[0] = v52;
    v154[1] = &off_10031C6F0;
    v153[1] = @"Line";
    v153[2] = @"Method";
    int v53 = [[objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(v50)];
    v154[2] = v53;
    v153[3] = NSDebugDescriptionErrorKey;
    id v54 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(v50), 1023];
    v154[3] = v54;
    +[NSDictionary dictionaryWithObjects:v154 forKeys:v153 count:4];
    uint64_t v56 = v55 = (void *)v15;
    id v57 = [v49 initWithDomain:v51 code:23 userInfo:v56];

    v58 = v55;
    goto LABEL_30;
  }
  id v18 = (void *)v17;
  uint64_t v130 = a8;
  v136 = [objc_alloc((Class)NFCommandAPDU) initWithData:v17];
  BOOL v133 = (void *)v15;
  if (![v13 checkAIDAllowList]) {
    goto LABEL_4;
  }
  id v19 = [v13 AIDAllowList];
  id v20 = +[NSSet setWithArray:v19];
  char v21 = ValidateAPDUWithAIDAllowList();

  id v18 = v140;
  id v13 = v141;
  if (v21)
  {
LABEL_4:
    v131 = a2;
    id v132 = v12;
    int v137 = (void *)v16;
    mach_continuous_time();
    if ([v13 toSystemOS]) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = 0;
    }
    unsigned int v23 = [v14 BOOLValue];
    id v24 = v18;
    id v25 = v24;
    if (self)
    {
      id v25 = v24;
      char v147 = *(unsigned char *)[v25 bytes];
      int v148 = 192;
      v142 = objc_opt_new();
      id v26 = 0;
      uint64_t v27 = -1;
      id v127 = v25;
      while (1)
      {
        NSErrorUserInfoKey v28 = v26;
        __int16 v29 = [(_NFSecureElementManagerSession *)self embeddedSecureElementWrapper];
        id v146 = v26;
        uint64_t v30 = [v29 transceiveData:v25 toOS:v22 error:&v146];
        id v26 = v146;

        if (!v30) {
          break;
        }
        int v31 = +[NFResponseAPDU responseWithData:v30];
        __int16 v32 = v31;
        if (!v31)
        {
          id v128 = objc_alloc((Class)NSError);
          id v126 = +[NSString stringWithUTF8String:"nfcd"];
          NSErrorUserInfoKey v159 = NSLocalizedDescriptionKey;
          v129 = +[NSString stringWithUTF8String:"Unexpected Result"];
          buf = v129;
          *(void *)v156 = &off_10031C6D8;
          CFStringRef v160 = @"Line";
          CFStringRef v161 = @"Method";
          id v76 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName("_transceive:targetOS:chainingEnable:finalSWStatus:outError:")];
          *(void *)&v156[8] = v76;
          NSErrorUserInfoKey v162 = NSDebugDescriptionErrorKey;
          id v77 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName("_transceive:targetOS:chainingEnable:finalSWStatus:outError:"), 947];
          *(void *)&v156[16] = v77;
          uint64_t v78 = +[NSDictionary dictionaryWithObjects:&buf forKeys:&v159 count:4];
          id v75 = [v128 initWithDomain:v126 code:13 userInfo:v78];

LABEL_47:
          goto LABEL_48;
        }
        uint64_t v27 = [v31 status];
        BOOL v33 = [v32 response];
        [v142 appendData:v33];

        if (!v23)
        {
          id v75 = 0;
          id v25 = v127;
          goto LABEL_47;
        }
        if (([v32 status] & 0xFF00) != 0x6100)
        {
          id v75 = 0;
          goto LABEL_47;
        }
        HIBYTE(v148) = [v32 status];
        uint64_t v34 = +[NSData dataWithBytesNoCopy:&v147 length:5 freeWhenDone:0];

        id v25 = (id)v34;
      }
      if (v26)
      {
        id v75 = v26;
        id v26 = v75;
      }
      else
      {
        id v116 = objc_alloc((Class)NSError);
        BOOL v117 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v159 = NSLocalizedDescriptionKey;
        v118 = +[NSString stringWithUTF8String:"Stack Error"];
        buf = v118;
        *(void *)v156 = &off_10031C6C0;
        CFStringRef v160 = @"Line";
        CFStringRef v161 = @"Method";
        id v119 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName("_transceive:targetOS:chainingEnable:finalSWStatus:outError:")];
        *(void *)&v156[8] = v119;
        NSErrorUserInfoKey v162 = NSDebugDescriptionErrorKey;
        id v120 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName("_transceive:targetOS:chainingEnable:finalSWStatus:outError:"), 940];
        *(void *)&v156[16] = v120;
        int v121 = +[NSDictionary dictionaryWithObjects:&buf forKeys:&v159 count:4];
        id v75 = [v116 initWithDomain:v117 code:15 userInfo:v121];

        id v26 = 0;
      }
LABEL_48:
      id v12 = v132;
      id v61 = v141;
      uint64_t v80 = a7;
      v79 = a6;
      if (v27 != -1)
      {
        __int16 v145 = bswap32(v27) >> 16;
        [v142 appendBytes:&v145 length:2];
      }
    }
    else
    {
      uint64_t v27 = 0;
      id v75 = 0;
      v142 = 0;
      id v61 = v141;
      uint64_t v80 = a7;
      v79 = a6;
    }

    id v57 = v75;
    mach_continuous_time();
    uint64_t ElapsedTimeInMillisecondsFromMachTime = GetElapsedTimeInMillisecondsFromMachTime();
    *v80 += ElapsedTimeInMillisecondsFromMachTime;
    int64_t *v79 = v27;
    if (v57)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v82 = NFLogGetLogger();
      v62 = v139;
      int v59 = v137;
      if (v82)
      {
        id v83 = (void (*)(uint64_t, const char *, ...))v82;
        v84 = object_getClass(self);
        BOOL v85 = class_isMetaClass(v84);
        id v86 = v61;
        uint64_t v87 = object_getClassName(self);
        id v88 = sel_getName(v131);
        if (v133) {
          v89 = v133;
        }
        else {
          v89 = v137;
        }
        v123 = v87;
        uint64_t v90 = 45;
        if (v85) {
          uint64_t v90 = 43;
        }
        id v61 = v86;
        v62 = v139;
        v83(3, "%c[%{public}s %{public}s]:%i Failed to execute C-APDU %{public}@", v90, v123, v88, 1044, v89);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v53 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        __int16 v91 = object_getClass(self);
        v92 = v61;
        if (class_isMetaClass(v91)) {
          int v93 = 43;
        }
        else {
          int v93 = 45;
        }
        v94 = object_getClassName(self);
        __int16 v95 = sel_getName(v131);
        v58 = v133;
        LODWORD(buf) = 67110146;
        if (v133) {
          uint64_t v96 = (uint64_t)v133;
        }
        else {
          uint64_t v96 = (uint64_t)v137;
        }
        HIDWORD(buf) = v93;
        id v61 = v92;
        *(_WORD *)v156 = 2082;
        *(void *)&v156[2] = v94;
        *(_WORD *)&v156[10] = 2082;
        *(void *)&v156[12] = v95;
        *(_WORD *)&v156[20] = 1024;
        *(_DWORD *)&v156[22] = 1044;
        __int16 v157 = 2114;
        uint64_t v158 = v96;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to execute C-APDU %{public}@", (uint8_t *)&buf, 0x2Cu);
        v52 = v136;
        uint64_t v51 = v142;
        unsigned int v60 = v140;
      }
      else
      {
        v52 = v136;
        uint64_t v51 = v142;
        unsigned int v60 = v140;
        v58 = v133;
      }
      goto LABEL_75;
    }
    uint64_t v97 = ElapsedTimeInMillisecondsFromMachTime;
    v52 = v142;
    int v59 = v137;
    if ([v142 length])
    {
      v98 = [(_NFSecureElementManagerSession *)self _createResponseFromCommand:v12 params:v61 rapdu:v142 duration:v97];
      uint64_t v51 = v98;
      v58 = v133;
      if (v98 && [v98 count]) {
        [v139 addObject:v51];
      }
      id v57 = [(_NFSecureElementManagerSession *)self _processCommandDataProtocol:v12 response:v142];
      if (v57) {
        *uint64_t v130 = 1;
      }
      int v53 = v136;
      unsigned int v60 = v140;
      goto LABEL_31;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v100 = NFLogGetLogger();
    v58 = v133;
    if (v100)
    {
      v101 = (void (*)(uint64_t, const char *, ...))v100;
      uint64_t v102 = object_getClass(self);
      BOOL v103 = class_isMetaClass(v102);
      v104 = object_getClassName(self);
      id v125 = sel_getName(v131);
      uint64_t v105 = 45;
      if (v103) {
        uint64_t v105 = 43;
      }
      v101(5, "%c[%{public}s %{public}s]:%i Unexpected empty response with no error", v105, v104, v125, 1048);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v106 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      v107 = object_getClass(self);
      if (class_isMetaClass(v107)) {
        int v108 = 43;
      }
      else {
        int v108 = 45;
      }
      int v109 = object_getClassName(self);
      v110 = sel_getName(v131);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v108;
      *(_WORD *)v156 = 2082;
      *(void *)&v156[2] = v109;
      *(_WORD *)&v156[10] = 2082;
      *(void *)&v156[12] = v110;
      *(_WORD *)&v156[20] = 1024;
      *(_DWORD *)&v156[22] = 1048;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unexpected empty response with no error", (uint8_t *)&buf, 0x22u);
    }

    id v111 = objc_alloc((Class)NSError);
    int v53 = +[NSString stringWithUTF8String:"nfcd"];
    v149[0] = NSLocalizedDescriptionKey;
    v112 = +[NSString stringWithUTF8String:"Empty response"];
    v150[0] = v112;
    v150[1] = &off_10031C720;
    v149[1] = @"Line";
    v149[2] = @"Method";
    id v113 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(v131)];
    v150[2] = v113;
    v149[3] = NSDebugDescriptionErrorKey;
    id v114 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(v131), 1049];
    v150[3] = v114;
    uint32_t v115 = +[NSDictionary dictionaryWithObjects:v150 forKeys:v149 count:4];
    id v57 = [v111 initWithDomain:v53 code:66 userInfo:v115];

    v52 = v136;
    uint64_t v51 = v142;
LABEL_30:
    int v59 = v137;
    unsigned int v60 = v140;
    id v61 = v141;
LABEL_31:
    v62 = v139;
    goto LABEL_75;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v63 = NFLogGetLogger();
  if (v63)
  {
    v64 = (void (*)(uint64_t, const char *, ...))v63;
    unsigned int v65 = object_getClass(self);
    BOOL v66 = class_isMetaClass(v65);
    v122 = object_getClassName(self);
    v124 = sel_getName(a2);
    uint64_t v67 = 45;
    if (v66) {
      uint64_t v67 = 43;
    }
    v64(3, "%c[%{public}s %{public}s]:%i Validation failed, C-APDU %{public}@", v67, v122, v124, 1027, v16);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v68 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
  {
    BOOL v69 = object_getClass(self);
    if (class_isMetaClass(v69)) {
      int v70 = 43;
    }
    else {
      int v70 = 45;
    }
    LODWORD(buf) = 67110146;
    HIDWORD(buf) = v70;
    *(_WORD *)v156 = 2082;
    *(void *)&v156[2] = object_getClassName(self);
    *(_WORD *)&v156[10] = 2082;
    *(void *)&v156[12] = sel_getName(a2);
    *(_WORD *)&v156[20] = 1024;
    *(_DWORD *)&v156[22] = 1027;
    __int16 v157 = 2114;
    uint64_t v158 = v16;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Validation failed, C-APDU %{public}@", (uint8_t *)&buf, 0x2Cu);
  }

  id v144 = objc_alloc((Class)NSError);
  v52 = +[NSString stringWithUTF8String:"nfcd"];
  v151[0] = NSLocalizedDescriptionKey;
  int v53 = +[NSString stringWithUTF8String:"Commmand Error"];
  v152[0] = v53;
  v152[1] = &off_10031C708;
  v151[1] = @"Line";
  v151[2] = @"Method";
  id v71 = (void *)v16;
  id v72 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v152[2] = v72;
  v151[3] = NSDebugDescriptionErrorKey;
  id v73 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 1028];
  v152[3] = v73;
  v74 = +[NSDictionary dictionaryWithObjects:v152 forKeys:v151 count:4];
  id v57 = [v144 initWithDomain:v52 code:16 userInfo:v74];

  int v59 = v71;
  v62 = v139;
  unsigned int v60 = v140;
  v58 = v133;
  uint64_t v51 = v136;
  id v61 = v141;
LABEL_75:

  return v57;
}

- (void)execRemoteAdminScript:(id)a3 params:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_NFSecureElementManagerSession;
  id v12 = [(_NFSession *)&v21 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016E700;
  block[3] = &unk_100302250;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  dispatch_async(v12, block);
}

- (void)refreshSecureElement:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFSecureElementManagerSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100170640;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)validateSEPairingsWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSecureElementManagerSession;
  id v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100170E6C;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)didExitRestrictedMode:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFSecureElementManagerSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001715E0;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)getCryptogramWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSecureElementManagerSession;
  id v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001719F4;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)setExpressPassConfig:(id)a3 restoreAuthorization:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  objc_super v11 = NFSharedSignpostLog();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:setExpressPassConfig", "in", buf, 2u);
  }

  v20.receiver = self;
  v20.super_class = (Class)_NFSecureElementManagerSession;
  id v12 = [(_NFSession *)&v20 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100172250;
  block[3] = &unk_100304740;
  id v17 = v10;
  SEL v18 = a2;
  block[4] = self;
  id v16 = v9;
  BOOL v19 = a4;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v12, block);
}

- (void)getExpressPassConfigWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSecureElementManagerSession;
  id v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100172A08;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)setExpressModesControlState:(int64_t)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = NFSharedSignpostLog();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:setExpressModesControlState", "in", buf, 2u);
  }

  v15.receiver = self;
  v15.super_class = (Class)_NFSecureElementManagerSession;
  id v9 = [(_NFSession *)&v15 workQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10017310C;
  v11[3] = &unk_100302648;
  v11[4] = self;
  id v12 = v7;
  SEL v13 = a2;
  int64_t v14 = a3;
  id v10 = v7;
  dispatch_async(v9, v11);
}

- (void)restoreAuthorizationForAllAppletsExcept:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:restoreAuthorizationForAllAppletsExcept", "in", buf, 2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)_NFSecureElementManagerSession;
  id v10 = [(_NFSession *)&v17 workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100173EF0;
  v13[3] = &unk_100302278;
  id v15 = v8;
  SEL v16 = a2;
  v13[4] = self;
  id v14 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)restoreAuthorizarionForKeys:(id)a3 onApplet:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = NFSharedSignpostLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:restoreAuthorizarionForKeys", "in", buf, 2u);
  }

  v22.receiver = self;
  v22.super_class = (Class)_NFSecureElementManagerSession;
  SEL v13 = [(_NFSession *)&v22 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100174988;
  block[3] = &unk_100302250;
  id v20 = v11;
  SEL v21 = a2;
  block[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v11;
  dispatch_async(v13, block);
}

- (void)disableAuthorizationForApplets:(id)a3 andKey:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v29 = a4;
  id v12 = a5;
  SEL v13 = (void (**)(id, id))a6;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v14 = v11;
  id v15 = (char *)[v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v39;
    while (2)
    {
      id v18 = 0;
      do
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v13)
          {
            id v22 = objc_alloc((Class)NSError);
            unsigned int v23 = +[NSString stringWithUTF8String:"nfcd"];
            v42[0] = NSLocalizedDescriptionKey;
            id v24 = +[NSString stringWithUTF8String:"Invalid State"];
            v43[0] = v24;
            v43[1] = &off_10031C840;
            v42[1] = @"Line";
            v42[2] = @"Method";
            id v25 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
            v43[2] = v25;
            v42[3] = NSDebugDescriptionErrorKey;
            id v26 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 1526];
            v43[3] = v26;
            uint64_t v27 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:4];
            id v28 = [v22 initWithDomain:v23 code:12 userInfo:v27];
            v13[2](v13, v28);
          }
          SEL v21 = v29;
          goto LABEL_15;
        }
        ++v18;
      }
      while (v16 != v18);
      id v16 = (char *)[v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v19 = NFSharedSignpostLog();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:disableAuthorizationForApplets", "in", buf, 2u);
  }

  v36.receiver = self;
  v36.super_class = (Class)_NFSecureElementManagerSession;
  id v20 = [(_NFSession *)&v36 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100175538;
  block[3] = &unk_100304D28;
  block[4] = self;
  SEL v35 = a2;
  uint64_t v34 = v13;
  id v31 = v14;
  SEL v21 = v29;
  id v32 = v29;
  id v33 = v12;
  dispatch_async(v20, block);

LABEL_15:
}

- (void)disableAuthorizationForPasses:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = NFSharedSignpostLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:disableAuthorizationForPasses", "in", buf, 2u);
  }

  v22.receiver = self;
  v22.super_class = (Class)_NFSecureElementManagerSession;
  SEL v13 = [(_NFSession *)&v22 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100176140;
  block[3] = &unk_100302250;
  id v20 = v11;
  SEL v21 = a2;
  block[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v11;
  dispatch_async(v13, block);
}

- (void)getFelicaAppletState:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:getFelicaAppletState", "in", buf, 2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)_NFSecureElementManagerSession;
  id v10 = [(_NFSession *)&v17 workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100176CEC;
  v13[3] = &unk_100302278;
  id v15 = v8;
  SEL v16 = a2;
  v13[4] = self;
  id v14 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)getTransitAppletState:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:getTransitAppletState", "in", buf, 2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)_NFSecureElementManagerSession;
  id v10 = [(_NFSession *)&v17 workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100177780;
  v13[3] = &unk_100302278;
  id v15 = v8;
  SEL v16 = a2;
  v13[4] = self;
  id v14 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)getServiceProviderDataForApplet:(id)a3 publicKey:(id)a4 scheme:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = NFSharedSignpostLog();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:getServiceProviderDataForApplet", "in", buf, 2u);
  }

  v27.receiver = self;
  v27.super_class = (Class)_NFSecureElementManagerSession;
  SEL v16 = [(_NFSession *)&v27 workQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10017810C;
  v21[3] = &unk_100304D28;
  id v25 = v14;
  SEL v26 = a2;
  v21[4] = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v14;
  dispatch_async(v16, v21);
}

- (void)getAndResetLPEMCounterWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSecureElementManagerSession;
  id v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100178820;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)expressModesInfoWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSecureElementManagerSession;
  id v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100179020;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)performPeerPaymentEnrollment:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFSecureElementManagerSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001796E0;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)powerCycleSEID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFSecureElementManagerSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100179F3C;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)getAttackCounterLogForSEID:(id)a3 acknowledgeLogs:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_NFSecureElementManagerSession;
  id v11 = [(_NFSession *)&v19 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017A60C;
  block[3] = &unk_100304740;
  id v16 = v10;
  SEL v17 = a2;
  block[4] = self;
  id v15 = v9;
  BOOL v18 = a4;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, block);
}

- (void)getAttackLogPresence:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFSecureElementManagerSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10017B004;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)dumpDomain:(unsigned __int8)a3 forSEID:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_NFSecureElementManagerSession;
  id v11 = [(_NFSession *)&v19 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017B7B8;
  block[3] = &unk_100304740;
  id v16 = v10;
  SEL v17 = a2;
  block[4] = self;
  id v15 = v9;
  unsigned __int8 v18 = a3;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, block);
}

- (void)getOSUpdateLogWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSecureElementManagerSession;
  id v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017BD74;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (BOOL)isSessionSEOnly
{
  return 1;
}

- (NFDriverWrapper)driverWrapper
{
  return (NFDriverWrapper *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDriverWrapper:(id)a3
{
}

- (NFSecureElementWrapper)embeddedSecureElementWrapper
{
  return self->_embeddedSecureElementWrapper;
}

- (void)setEmbeddedSecureElementWrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedSecureElementWrapper, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_appletChangedByTSM, 0);
  objc_storeStrong((id *)&self->_appletRequiresEndOfTransactionProcessing, 0);

  objc_storeStrong((id *)&self->_felicaEvents, 0);
}

@end