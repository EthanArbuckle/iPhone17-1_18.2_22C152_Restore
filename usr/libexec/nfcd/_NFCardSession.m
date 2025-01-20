@interface _NFCardSession
+ (id)validateEntitlements:(id)a3;
+ (void)isEligibleWithUserPrompt:(BOOL)a3 auditToken:(id *)a4 completion:(id)a5;
- (BOOL)fieldPresent;
- (BOOL)validateReceivedAPDU:(id)a3;
- (BOOL)willStartSession;
- (NFServiceWhitelistChecker)allowlistChecker;
- (NSMutableOrderedSet)paymentAIDPrefixes;
- (_NFCardSession)initWithConfig:(id)a3 allowlistChecker:(id)a4 remoteObject:(id)a5 workQueue:(id)a6;
- (id)initialRoutingConfig;
- (id)initialRoutingConfigWithField:(id)a3;
- (int64_t)cardState;
- (void)_activateUIControllerWithCompletion:(id)a3;
- (void)_initPaymentAIDPrefixList;
- (void)_invalidateUIController;
- (void)_invalidateUIControllerWithStatus:(BOOL)a3;
- (void)_sendErrorStatus:(unsigned __int16)a3;
- (void)asyncReadAPDUWithCompletion:(id)a3;
- (void)cleanup;
- (void)didStartSession:(id)a3;
- (void)handleFieldChanged:(BOOL)a3;
- (void)handleFieldNotification:(id)a3;
- (void)readAPDUWithCompletion:(id)a3;
- (void)requestEmulationAssertion:(id)a3 completion:(id)a4;
- (void)restartDiscovery;
- (void)resumeSessionFromWaitingOnFieldWithCompletion:(id)a3;
- (void)sendAPDU:(id)a3 completion:(id)a4;
- (void)setCardState:(int64_t)a3;
- (void)setFieldPresent:(BOOL)a3;
- (void)setPaymentAIDPrefixes:(id)a3;
- (void)startEmulationWithCompletion:(id)a3;
- (void)stopEmulationWithStatus:(BOOL)a3 completion:(id)a4;
- (void)updateUIString:(id)a3 completion:(id)a4;
@end

@implementation _NFCardSession

- (_NFCardSession)initWithConfig:(id)a3 allowlistChecker:(id)a4 remoteObject:(id)a5 workQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_NFCardSession;
  v12 = [(_NFXPCSession *)&v21 initWithRemoteObject:a5 workQueue:a6];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_allowlistChecker, a4);
    uint64_t v14 = objc_opt_new();
    uiService = v13->_uiService;
    v13->_uiService = (NFUIService *)v14;

    v16 = v13->_uiService;
    if (v16)
    {
      [(NFUIService *)v16 coreNFCUISetMode:3];
      v17 = v13->_uiService;
      v18 = [v10 initialUIText];
      [(NFUIService *)v17 coreNFCUISetScanText:v18];

      v13->_uiServiceWasActivated = 0;
      [(_NFHCESession *)v13 setReadOnConnected:1];
    }
    [(_NFCardSession *)v13 _initPaymentAIDPrefixList];
    v19 = v13;
  }

  return v13;
}

- (void)_activateUIControllerWithCompletion:(id)a3
{
  v5 = (void (**)(id, void))a3;
  if (self->_uiServiceWasActivated)
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
      v7(6, "%c[%{public}s %{public}s]:%i UI already activated", v11, ClassName, Name, 77);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v14;
      __int16 v23 = 2082;
      v24 = object_getClassName(self);
      __int16 v25 = 2082;
      v26 = sel_getName(a2);
      __int16 v27 = 1024;
      int v28 = 77;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i UI already activated", (uint8_t *)&buf, 0x22u);
    }

    v5[2](v5, 0);
  }
  else
  {
    objc_initWeak(&buf, self);
    uiService = self->_uiService;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001A40C4;
    v20[3] = &unk_1003067D0;
    objc_copyWeak(v21, &buf);
    v21[1] = (id)a2;
    v20[4] = self;
    [(NFUIService *)uiService coreNFCUISetInvalidationHandler:v20];
    v16 = self->_uiService;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001A4468;
    v18[3] = &unk_1003067F8;
    v18[4] = self;
    v19 = v5;
    [(NFUIService *)v16 coreNFCUIActivateWithCompletion:v18];

    objc_destroyWeak(v21);
    objc_destroyWeak(&buf);
  }
}

- (void)_initPaymentAIDPrefixList
{
  v3 = (NSMutableOrderedSet *)objc_opt_new();
  paymentAIDPrefixes = self->_paymentAIDPrefixes;
  self->_paymentAIDPrefixes = v3;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(NFServiceWhitelistChecker *)self->_allowlistChecker nfcCardSessionAIDPrefixList];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = [v10 NF_asHexString];
        if (+[NFATLMobileSettings findAID:filterType:](NFATLMobileSettings, "findAID:filterType:", v11, 1)|| +[NFATLMobileSettings findAID:v11 filterType:0])
        {
          [(NSMutableOrderedSet *)self->_paymentAIDPrefixes addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_invalidateUIController
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Invalidating...", v9, ClassName, Name, 132);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)id buf = 67109890;
    int v15 = v12;
    __int16 v16 = 2082;
    v17 = object_getClassName(self);
    __int16 v18 = 2082;
    v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 132;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalidating...", buf, 0x22u);
  }

  [(NFUIService *)self->_uiService coreNFCUIInvalidate];
}

- (void)_invalidateUIControllerWithStatus:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i Invalidating with status %{public}d...", v10, ClassName, Name, 138, v3);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)id buf = 67110146;
    int v17 = v13;
    __int16 v18 = 2082;
    v19 = object_getClassName(self);
    __int16 v20 = 2082;
    int v21 = sel_getName(a2);
    __int16 v22 = 1024;
    int v23 = 138;
    __int16 v24 = 1026;
    BOOL v25 = v3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalidating with status %{public}d...", buf, 0x28u);
  }

  [(NFUIService *)self->_uiService coreNFCUITagScannedCount:v3];
  [(NFUIService *)self->_uiService coreNFCUIInvalidate];
}

- (void)sendAPDU:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(_NFSession *)self workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001A4AE4;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)startEmulationWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = NFSharedSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_START_EMULATION_XPC", (const char *)&unk_100286819, buf, 2u);
  }

  id v7 = [(_NFSession *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A4FD0;
  block[3] = &unk_100301D38;
  id v10 = v5;
  SEL v11 = a2;
  block[4] = self;
  id v8 = v5;
  dispatch_async(v7, block);
}

- (void)stopEmulationWithStatus:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[NFRoutingConfig routingOffWithFD:1];
  [(_NFHCESession *)self stopEmulationAndConfigWithRouting:v7 completion:v6];

  [(_NFCardSession *)self _invalidateUIControllerWithStatus:v4];
}

- (void)updateUIString:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(_NFSession *)self workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001A5790;
  v12[3] = &unk_100301D60;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  SEL v16 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, v12);
}

- (void)_sendErrorStatus:(unsigned __int16)a3
{
  __int16 v5 = __rev16(a3);
  id v4 = [objc_alloc((Class)NSData) initWithBytes:&v5 length:2];
  [(_NFCardSession *)self sendAPDU:v4 completion:&stru_100306818];
}

- (BOOL)validateReceivedAPDU:(id)a3
{
  id v5 = a3;
  id v6 = [(_NFHCESession *)self caLogger];
  id v7 = [objc_alloc((Class)NFCommandAPDU) initWithData:v5];
  id v8 = v7;
  if (!v7)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v27 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      v31 = a2;
      Name = sel_getName(a2);
      [v5 NF_asHexString];
      v33 = self;
      v35 = id v34 = v5;
      v109 = Name;
      a2 = v31;
      uint64_t v36 = 45;
      if (isMetaClass) {
        uint64_t v36 = 43;
      }
      v27(3, "%c[%{public}s %{public}s]:%i Invalid ISO7816 APDU detected, %{public}@", v36, ClassName, v109, 236, v35);

      id v5 = v34;
      self = v33;
      id v8 = 0;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v20 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    v37 = object_getClass(self);
    if (class_isMetaClass(v37)) {
      int v38 = 43;
    }
    else {
      int v38 = 45;
    }
    v39 = object_getClassName(self);
    v40 = sel_getName(a2);
    v41 = [v5 NF_asHexString];
    *(_DWORD *)id buf = 67110146;
    int v122 = v38;
    __int16 v123 = 2082;
    v124 = v39;
    __int16 v125 = 2082;
    v126 = v40;
    __int16 v127 = 1024;
    int v128 = 236;
    __int16 v129 = 2114;
    v130 = v41;
    v42 = "%c[%{public}s %{public}s]:%i Invalid ISO7816 APDU detected, %{public}@";
LABEL_40:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v42, buf, 0x2Cu);

LABEL_52:
    [(_NFCardSession *)self _sendErrorStatus:27265];
    BOOL v67 = 0;
    goto LABEL_53;
  }
  unsigned int v9 = [v7 isSecureMessaging];
  unsigned int v10 = [v8 isSelectByDFNameCommand];
  if (v10) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v43 = NFLogGetLogger();
    if (v43)
    {
      v44 = (void (*)(uint64_t, const char *, ...))v43;
      v45 = object_getClass(self);
      BOOL v46 = class_isMetaClass(v45);
      v47 = object_getClassName(self);
      v48 = a2;
      v49 = sel_getName(a2);
      [v5 NF_asHexString];
      v50 = v8;
      v51 = self;
      v53 = id v52 = v5;
      v110 = v49;
      a2 = v48;
      uint64_t v54 = 45;
      if (v46) {
        uint64_t v54 = 43;
      }
      v44(3, "%c[%{public}s %{public}s]:%i Invalid ISO7816 SELECT command detected, %{public}@", v54, v47, v110, 245, v53);

      id v5 = v52;
      self = v51;
      id v8 = v50;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v20 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    v55 = object_getClass(self);
    if (class_isMetaClass(v55)) {
      int v56 = 43;
    }
    else {
      int v56 = 45;
    }
    v57 = object_getClassName(self);
    v58 = sel_getName(a2);
    v41 = [v5 NF_asHexString];
    *(_DWORD *)id buf = 67110146;
    int v122 = v56;
    __int16 v123 = 2082;
    v124 = v57;
    __int16 v125 = 2082;
    v126 = v58;
    __int16 v127 = 1024;
    int v128 = 245;
    __int16 v129 = 2114;
    v130 = v41;
    v42 = "%c[%{public}s %{public}s]:%i Invalid ISO7816 SELECT command detected, %{public}@";
    goto LABEL_40;
  }
  unsigned int v12 = v10;
  if ((id)[(_NFCardSession *)self cardState] == (id)1) {
    char v13 = v12;
  }
  else {
    char v13 = 1;
  }
  if ((v13 & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v59 = NFLogGetLogger();
    if (v59)
    {
      v60 = (void (*)(uint64_t, const char *, ...))v59;
      v61 = object_getClass(self);
      BOOL v62 = class_isMetaClass(v61);
      v63 = object_getClassName(self);
      v111 = sel_getName(a2);
      uint64_t v64 = 45;
      if (v62) {
        uint64_t v64 = 43;
      }
      v60(6, "%c[%{public}s %{public}s]:%i No active application selected", v64, v63, v111, 251);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v20 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_52;
    }
    v65 = object_getClass(self);
    if (class_isMetaClass(v65)) {
      int v66 = 43;
    }
    else {
      int v66 = 45;
    }
    *(_DWORD *)id buf = 67109890;
    int v122 = v66;
    __int16 v123 = 2082;
    v124 = object_getClassName(self);
    __int16 v125 = 2082;
    v126 = sel_getName(a2);
    __int16 v127 = 1024;
    int v128 = 251;
    int v23 = "%c[%{public}s %{public}s]:%i No active application selected";
    goto LABEL_50;
  }
  if (!v12)
  {
    if ((id)[(_NFCardSession *)self cardState] == (id)3)
    {
      BOOL v67 = 1;
      goto LABEL_53;
    }
    [(_NFCardSession *)self setCardState:1];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v97 = NFLogGetLogger();
    if (v97)
    {
      v98 = (void (*)(uint64_t, const char *, ...))v97;
      v99 = object_getClass(self);
      v100 = v6;
      BOOL v101 = class_isMetaClass(v99);
      v102 = object_getClassName(self);
      v112 = sel_getName(a2);
      BOOL v11 = !v101;
      id v6 = v100;
      uint64_t v103 = 45;
      if (!v11) {
        uint64_t v103 = 43;
      }
      v98(6, "%c[%{public}s %{public}s]:%i No active application selected", v103, v102, v112, 301);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v20 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_52;
    }
    v104 = object_getClass(self);
    if (class_isMetaClass(v104)) {
      int v105 = 43;
    }
    else {
      int v105 = 45;
    }
    *(_DWORD *)id buf = 67109890;
    int v122 = v105;
    __int16 v123 = 2082;
    v124 = object_getClassName(self);
    __int16 v125 = 2082;
    v126 = sel_getName(a2);
    __int16 v127 = 1024;
    int v128 = 301;
    int v23 = "%c[%{public}s %{public}s]:%i No active application selected";
LABEL_50:
    __int16 v24 = v20;
    os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
LABEL_51:
    _os_log_impl((void *)&_mh_execute_header, v24, v25, v23, buf, 0x22u);
    goto LABEL_52;
  }
  if ([v8 payloadLength] >= 0x11)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v14 = NFLogGetLogger();
    if (v14)
    {
      id v15 = (void (*)(uint64_t, const char *, ...))v14;
      SEL v16 = object_getClass(self);
      BOOL v17 = class_isMetaClass(v16);
      __int16 v18 = object_getClassName(self);
      v108 = sel_getName(a2);
      uint64_t v19 = 45;
      if (v17) {
        uint64_t v19 = 43;
      }
      v15(3, "%c[%{public}s %{public}s]:%i Invalid ISO7816 SELECT command detected; AID length invalid",
        v19,
        v18,
        v108,
        258);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v20 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    int v21 = object_getClass(self);
    if (class_isMetaClass(v21)) {
      int v22 = 43;
    }
    else {
      int v22 = 45;
    }
    *(_DWORD *)id buf = 67109890;
    int v122 = v22;
    __int16 v123 = 2082;
    v124 = object_getClassName(self);
    __int16 v125 = 2082;
    v126 = sel_getName(a2);
    __int16 v127 = 1024;
    int v128 = 258;
    int v23 = "%c[%{public}s %{public}s]:%i Invalid ISO7816 SELECT command detected; AID length invalid";
    __int16 v24 = v20;
    os_log_type_t v25 = OS_LOG_TYPE_ERROR;
    goto LABEL_51;
  }
  sel = a2;
  v114 = v6;
  id v115 = v5;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  v69 = [(_NFCardSession *)self allowlistChecker];
  v70 = [v69 nfcCardSessionAIDPrefixList];

  id v71 = [v70 countByEnumeratingWithState:&v116 objects:v120 count:16];
  if (!v71)
  {
LABEL_66:

    [(_NFCardSession *)self setCardState:1];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v81 = NFLogGetLogger();
    if (v81)
    {
      v82 = (void (*)(uint64_t, const char *, ...))v81;
      v83 = object_getClass(self);
      BOOL v84 = class_isMetaClass(v83);
      v85 = object_getClassName(self);
      v86 = sel_getName(sel);
      v87 = [v8 payload];
      v88 = [v87 NF_asHexString];
      uint64_t v89 = 45;
      if (v84) {
        uint64_t v89 = 43;
      }
      v82(6, "%c[%{public}s %{public}s]:%i AID %{public}@ is disallowed", v89, v85, v86, 293, v88);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v90 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      v91 = object_getClass(self);
      if (class_isMetaClass(v91)) {
        int v92 = 43;
      }
      else {
        int v92 = 45;
      }
      v93 = object_getClassName(self);
      v94 = sel_getName(sel);
      v95 = [v8 payload];
      v96 = [v95 NF_asHexString];
      *(_DWORD *)id buf = 67110146;
      int v122 = v92;
      __int16 v123 = 2082;
      v124 = v93;
      __int16 v125 = 2082;
      v126 = v94;
      __int16 v127 = 1024;
      int v128 = 293;
      __int16 v129 = 2114;
      v130 = v96;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i AID %{public}@ is disallowed", buf, 0x2Cu);
    }
    [(_NFCardSession *)self _sendErrorStatus:27266];
    BOOL v67 = 0;
LABEL_88:
    id v6 = v114;
    id v5 = v115;
    goto LABEL_53;
  }
  id v72 = v71;
  uint64_t v73 = *(void *)v117;
LABEL_58:
  uint64_t v74 = 0;
  while (1)
  {
    if (*(void *)v117 != v73) {
      objc_enumerationMutation(v70);
    }
    v75 = *(void **)(*((void *)&v116 + 1) + 8 * v74);
    v76 = [v8 payload];
    id v77 = [v76 length];
    id v78 = [v75 length];

    if (v77 < v78) {
      goto LABEL_64;
    }
    v79 = [v8 payload];
    v80 = [v79 subdataWithRange:0, [v75 length]];

    if ([v80 isEqualToData:v75]) {
      break;
    }

LABEL_64:
    if (v72 == (id)++v74)
    {
      id v72 = [v70 countByEnumeratingWithState:&v116 objects:v120 count:16];
      if (v72) {
        goto LABEL_58;
      }
      goto LABEL_66;
    }
  }
  v106 = [(_NFCardSession *)self paymentAIDPrefixes];
  unsigned int v107 = [v106 containsObject:v75];

  [(_NFCardSession *)self setCardState:2];
  BOOL v67 = 1;
  if (!v107) {
    goto LABEL_88;
  }
  id v6 = v114;
  id v5 = v115;
  if (v114) {
    v114[43] = 257;
  }
LABEL_53:

  return v67;
}

- (void)asyncReadAPDUWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc((Class)NSError);
  id v7 = +[NSString stringWithUTF8String:"nfcd"];
  v13[0] = NSLocalizedDescriptionKey;
  id v8 = +[NSString stringWithUTF8String:"Feature Not Supported"];
  v14[0] = v8;
  v14[1] = &off_10031D3C8;
  v13[1] = @"Line";
  v13[2] = @"Method";
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v14[2] = v9;
  v13[3] = NSDebugDescriptionErrorKey;
  id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 310];
  v14[3] = v10;
  BOOL v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  id v12 = [v6 initWithDomain:v7 code:14 userInfo:v11];
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v12);
}

- (void)readAPDUWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc((Class)NSError);
  id v7 = +[NSString stringWithUTF8String:"nfcd"];
  v13[0] = NSLocalizedDescriptionKey;
  id v8 = +[NSString stringWithUTF8String:"Feature Not Supported"];
  v14[0] = v8;
  v14[1] = &off_10031D3E0;
  v13[1] = @"Line";
  v13[2] = @"Method";
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v14[2] = v9;
  v13[3] = NSDebugDescriptionErrorKey;
  id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 314];
  v14[3] = v10;
  BOOL v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  id v12 = [v6 initWithDomain:v7 code:14 userInfo:v11];
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v12);
}

- (void)restartDiscovery
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
    v5(5, "%c[%{public}s %{public}s]:%i Feature not supported", v9, ClassName, Name, 318);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)id buf = 67109890;
    int v15 = v12;
    __int16 v16 = 2082;
    BOOL v17 = object_getClassName(self);
    __int16 v18 = 2082;
    uint64_t v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 318;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Feature not supported", buf, 0x22u);
  }
}

- (void)requestEmulationAssertion:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)NSError);
  id v8 = +[NSString stringWithUTF8String:"nfcd"];
  v14[0] = NSLocalizedDescriptionKey;
  uint64_t v9 = +[NSString stringWithUTF8String:"Feature Not Supported"];
  v15[0] = v9;
  v15[1] = &off_10031D3F8;
  v14[1] = @"Line";
  v14[2] = @"Method";
  id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v15[2] = v10;
  v14[3] = NSDebugDescriptionErrorKey;
  id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 323];
  v15[3] = v11;
  int v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  id v13 = [v7 initWithDomain:v8 code:14 userInfo:v12];
  (*((void (**)(id, id))a4 + 2))(v6, v13);
}

- (void)resumeSessionFromWaitingOnFieldWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc((Class)NSError);
  id v7 = +[NSString stringWithUTF8String:"nfcd"];
  v13[0] = NSLocalizedDescriptionKey;
  id v8 = +[NSString stringWithUTF8String:"Feature Not Supported"];
  v14[0] = v8;
  v14[1] = &off_10031D410;
  v13[1] = @"Line";
  v13[2] = @"Method";
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v14[2] = v9;
  v13[3] = NSDebugDescriptionErrorKey;
  id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 327];
  v14[3] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  id v12 = [v6 initWithDomain:v7 code:14 userInfo:v11];
  (*((void (**)(id, id))a3 + 2))(v5, v12);
}

+ (id)validateEntitlements:(id)a3
{
  id v5 = a3;
  if ([v5 nfcCardSessionAccess])
  {
    id v6 = [v5 nfcCardSessionAIDPrefixList];
    id v7 = [v6 count];

    if (v7)
    {
      id v8 = 0;
      goto LABEL_25;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v26 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v30 = 45;
      if (isMetaClass) {
        uint64_t v30 = 43;
      }
      v26(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring non-empty AID prefix list", v30, ClassName, Name, 340);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v31 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = object_getClass(a1);
      if (class_isMetaClass(v32)) {
        int v33 = 43;
      }
      else {
        int v33 = 45;
      }
      *(_DWORD *)id buf = 67109890;
      int v43 = v33;
      __int16 v44 = 2082;
      v45 = object_getClassName(a1);
      __int16 v46 = 2082;
      v47 = sel_getName(a2);
      __int16 v48 = 1024;
      int v49 = 340;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring non-empty AID prefix list", buf, 0x22u);
    }

    id v18 = objc_alloc((Class)NSError);
    uint64_t v19 = +[NSString stringWithUTF8String:"nfcd"];
    v38[0] = NSLocalizedDescriptionKey;
    __int16 v20 = +[NSString stringWithUTF8String:"Not entitled"];
    v39[0] = v20;
    v39[1] = &off_10031D440;
    v38[1] = @"Line";
    v38[2] = @"Method";
    id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v39[2] = v21;
    v38[3] = NSDebugDescriptionErrorKey;
    id v22 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 341];
    v39[3] = v22;
    int v23 = v39;
    __int16 v24 = v38;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v9 = NFLogGetLogger();
    if (v9)
    {
      id v10 = (void (*)(uint64_t, const char *, ...))v9;
      id v11 = object_getClass(a1);
      BOOL v12 = class_isMetaClass(v11);
      id v13 = object_getClassName(a1);
      uint64_t v36 = sel_getName(a2);
      uint64_t v14 = 45;
      if (v12) {
        uint64_t v14 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", v14, v13, v36, 335);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = object_getClass(a1);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      *(_DWORD *)id buf = 67109890;
      int v43 = v17;
      __int16 v44 = 2082;
      v45 = object_getClassName(a1);
      __int16 v46 = 2082;
      v47 = sel_getName(a2);
      __int16 v48 = 1024;
      int v49 = 335;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", buf, 0x22u);
    }

    id v18 = objc_alloc((Class)NSError);
    uint64_t v19 = +[NSString stringWithUTF8String:"nfcd"];
    v40[0] = NSLocalizedDescriptionKey;
    __int16 v20 = +[NSString stringWithUTF8String:"Not entitled"];
    v41[0] = v20;
    v41[1] = &off_10031D428;
    v40[1] = @"Line";
    v40[2] = @"Method";
    id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v41[2] = v21;
    v40[3] = NSDebugDescriptionErrorKey;
    id v22 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 336];
    v41[3] = v22;
    int v23 = v41;
    __int16 v24 = v40;
  }
  id v34 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v24 count:4];
  id v8 = [v18 initWithDomain:v19 code:32 userInfo:v34];

LABEL_25:

  return v8;
}

- (void)didStartSession:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_NFCardSession;
  [(_NFHCESession *)&v5 didStartSession:a3];
  id v4 = [(_NFHCESession *)self caLogger];
  if (v4) {
    v4[85] = 1;
  }
}

- (BOOL)willStartSession
{
  +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_100323528];
  v4.receiver = self;
  v4.super_class = (Class)_NFCardSession;
  return [(_NFHCESession *)&v4 willStartSession];
}

- (void)handleFieldChanged:(BOOL)a3
{
  BOOL v3 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_NFCardSession;
  -[_NFHCESession handleFieldChanged:](&v19, "handleFieldChanged:");
  if ([(_NFCardSession *)self fieldPresent] != v3)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i fieldPresent=%{public}d", v10, ClassName, Name, 365, v3);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(self);
      int v15 = sel_getName(a2);
      *(_DWORD *)id buf = 67110146;
      int v21 = v13;
      __int16 v22 = 2082;
      int v23 = v14;
      __int16 v24 = 2082;
      os_log_type_t v25 = v15;
      __int16 v26 = 1024;
      int v27 = 365;
      __int16 v28 = 1026;
      BOOL v29 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i fieldPresent=%{public}d", buf, 0x28u);
    }

    __int16 v16 = [(_NFXPCSession *)self remoteObject];
    [v16 fieldChanged:v3];

    [(_NFCardSession *)self setFieldPresent:v3];
  }
}

- (void)handleFieldNotification:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 374, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)id buf = 67110146;
    int v18 = v13;
    __int16 v19 = 2082;
    __int16 v20 = object_getClassName(self);
    __int16 v21 = 2082;
    __int16 v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 374;
    __int16 v25 = 2114;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v14 = NFSharedSignpostLog();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_FIELD_NTF", (const char *)&unk_100286819, buf, 2u);
  }
}

- (void)cleanup
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
    v5(6, "%c[%{public}s %{public}s]:%i Cleanup ...", v9, ClassName, Name, 380);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)id buf = 67109890;
    int v27 = v12;
    __int16 v28 = 2082;
    BOOL v29 = object_getClassName(self);
    __int16 v30 = 2082;
    v31 = sel_getName(a2);
    __int16 v32 = 1024;
    int v33 = 380;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cleanup ...", buf, 0x22u);
  }

  if ([(_NFSession *)self needsCleanup])
  {
    [(_NFCardSession *)self _invalidateUIController];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v13 = NFLogGetLogger();
    if (v13)
    {
      uint64_t v14 = (void (*)(uint64_t, const char *, ...))v13;
      int v15 = object_getClass(self);
      BOOL v16 = class_isMetaClass(v15);
      int v17 = object_getClassName(self);
      __int16 v25 = sel_getName(a2);
      uint64_t v18 = 45;
      if (v16) {
        uint64_t v18 = 43;
      }
      v14(6, "%c[%{public}s %{public}s]:%i Cleanup not needed ...", v18, v17, v25, 382);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      __int16 v22 = object_getClassName(self);
      __int16 v23 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v27 = v21;
      __int16 v28 = 2082;
      BOOL v29 = v22;
      __int16 v30 = 2082;
      v31 = v23;
      __int16 v32 = 1024;
      int v33 = 382;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cleanup not needed ...", buf, 0x22u);
    }
  }
}

- (id)initialRoutingConfigWithField:(id)a3
{
  id v5 = a3;
  if ([(_NFHCESession *)self emulationOnSessionStart])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001A7CF4;
    v9[3] = &unk_100301F70;
    v9[4] = self;
    v9[5] = a2;
    [(_NFCardSession *)self _activateUIControllerWithCompletion:v9];
  }
  v8.receiver = self;
  v8.super_class = (Class)_NFCardSession;
  id v6 = [(_NFHCESession *)&v8 initialRoutingConfigWithField:v5];

  return v6;
}

- (id)initialRoutingConfig
{
  if ([(_NFHCESession *)self emulationOnSessionStart])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001A7F6C;
    v7[3] = &unk_100301F70;
    v7[4] = self;
    v7[5] = a2;
    [(_NFCardSession *)self _activateUIControllerWithCompletion:v7];
  }
  v6.receiver = self;
  v6.super_class = (Class)_NFCardSession;
  objc_super v4 = [(_NFHCESession *)&v6 initialRoutingConfig];

  return v4;
}

- (NFServiceWhitelistChecker)allowlistChecker
{
  return self->_allowlistChecker;
}

- (int64_t)cardState
{
  return self->_cardState;
}

- (void)setCardState:(int64_t)a3
{
  self->_cardState = a3;
}

- (BOOL)fieldPresent
{
  return self->_fieldPresent;
}

- (void)setFieldPresent:(BOOL)a3
{
  self->_fieldPresent = a3;
}

- (NSMutableOrderedSet)paymentAIDPrefixes
{
  return self->_paymentAIDPrefixes;
}

- (void)setPaymentAIDPrefixes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentAIDPrefixes, 0);
  objc_storeStrong((id *)&self->_allowlistChecker, 0);

  objc_storeStrong((id *)&self->_uiService, 0);
}

+ (void)isEligibleWithUserPrompt:(BOOL)a3 auditToken:(id *)a4 completion:(id)a5
{
  id v9 = a5;
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_10000B8E8;
  int v27 = sub_1001A8350;
  sub_1000B7E3C();
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v24[5];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001A8358;
  v15[3] = &unk_100306868;
  id v18 = a1;
  SEL v19 = a2;
  id v11 = v9;
  long long v12 = *(_OWORD *)&a4->var0[4];
  long long v20 = *(_OWORD *)a4->var0;
  long long v21 = v12;
  id v16 = v11;
  int v17 = &v23;
  BOOL v22 = a3;
  long long v13 = *(_OWORD *)&a4->var0[4];
  v14[0] = *(_OWORD *)a4->var0;
  v14[1] = v13;
  sub_1000B80BC(v10, 0, v14, v15);

  _Block_object_dispose(&v23, 8);
}

@end