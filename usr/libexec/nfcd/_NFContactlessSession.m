@interface _NFContactlessSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)_configureEmulationType:(unint64_t)a3;
- (BOOL)_configureEmulationType:(unint64_t)a3 routingConfigWhenEmulationOff:(id)a4;
- (BOOL)_expressModeRequiredForApplet:(id)a3 keySet:(id)a4;
- (BOOL)_startFieldDetectAndKeepSEOn:(BOOL)a3;
- (BOOL)canEnableExpress;
- (BOOL)plasticCardMode;
- (BOOL)startDefaultMode;
- (BOOL)startDefaultModeAndKeepSEOn:(BOOL)a3;
- (BOOL)startFieldDetectMode;
- (BOOL)startWiredMode;
- (BOOL)suspendWithInfo:(id)a3;
- (BOOL)useFilteredApplets;
- (BOOL)willStartSession;
- (NFApplet)activeApplet;
- (NFApplet)deferredActivationApplet;
- (NFSecureElementWrapper)secureElementWrapper;
- (NFSystemPowerConsumptionMonitor)powerConsumptionReporter;
- (NSArray)activeAppletGroupMembers;
- (NSArray)applets;
- (NSSet)activeKeyIdentifiers;
- (NSSet)activeSecondaryKeyIdentifiers;
- (id)_activateKeys:(BOOL)a3 aidsAndKeys:(id)a4;
- (id)_activateKeys:(BOOL)a3 forIdentifiers:(id)a4 onApplet:(id)a5;
- (id)_getAppletsForAids:(id)a3;
- (id)_getRelatedGroupMembersForActiveApplet;
- (id)_getSecureElementWrapperForApplet:(id)a3;
- (id)_resetVolatileConfigOnApplet:(id)a3;
- (id)initialRoutingConfig;
- (id)preloadApplets;
- (id)seidForApplet:(id)a3;
- (id)setActiveApplet:(id)a3;
- (id)setActiveApplets:(id)a3;
- (id)setActiveKeys:(id)a3 allowBackgroundTransactions:(BOOL)a4;
- (id)setActiveKeys:(id)a3 onApplet:(id)a4 allowBackgroundTransactions:(BOOL)a5;
- (int)_getActiveAppletEmulationType:(id)a3;
- (void)_internalCleanup;
- (void)_setActiveSecureElementWrapper:(id)a3;
- (void)cleanup;
- (void)didStartSession:(id)a3;
- (void)getAppletsWithCompletion:(id)a3;
- (void)handleFelicaStateEvent:(id)a3;
- (void)handleFieldChanged:(BOOL)a3;
- (void)handleFieldNotification:(id)a3;
- (void)handleFieldReset;
- (void)handleSelectEvent:(id)a3;
- (void)setActiveApplet:(id)a3 completion:(id)a4;
- (void)setDeferredActivationApplet:(id)a3;
- (void)setPlasticCardMode:(BOOL)a3;
- (void)setPowerConsumptionReporter:(id)a3;
- (void)setSecureElementWrapper:(id)a3;
- (void)startCardEmulationWithCompletion:(id)a3;
- (void)stopCardEmulationWithCompletion:(id)a3;
- (void)switchToSecureElementWrapperForApplet:(id)a3;
@end

@implementation _NFContactlessSession

+ (id)validateEntitlements:(id)a3
{
  if ([a3 cardModeAccess])
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
      v7(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", v11, ClassName, Name, 42);
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
      int v32 = 42;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", buf, 0x22u);
    }

    id v15 = objc_alloc((Class)NSError);
    v16 = +[NSString stringWithUTF8String:"nfcd"];
    v23[0] = NSLocalizedDescriptionKey;
    v17 = +[NSString stringWithUTF8String:"Not entitled"];
    v24[0] = v17;
    v24[1] = &off_10031B208;
    v23[1] = @"Line";
    v23[2] = @"Method";
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v24[2] = v18;
    v23[3] = NSDebugDescriptionErrorKey;
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 43];
    v24[3] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    id v5 = [v15 initWithDomain:v16 code:32 userInfo:v20];
  }

  return v5;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig routingOffWithFD:1];
}

- (BOOL)willStartSession
{
  sub_1001B0384((uint64_t)self->_powerConsumptionReporter);
  sub_1002535C4();
  v4.receiver = self;
  v4.super_class = (Class)_NFContactlessSession;
  return [(_NFSession *)&v4 willStartSession];
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
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
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 67);
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
    *(_DWORD *)buf = 67109890;
    int v23 = v14;
    __int16 v24 = 2082;
    v25 = object_getClassName(self);
    __int16 v26 = 2082;
    __int16 v27 = sel_getName(a2);
    __int16 v28 = 1024;
    int v29 = 67;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v21.receiver = self;
  v21.super_class = (Class)_NFContactlessSession;
  [(_NFSession *)&v21 didStartSession:v5];
  if (!v5)
  {
    id v15 = +[_NFHardwareManager sharedHardwareManager];
    v16 = [v15 secureElementWrapper];
    secureElementWrapper = self->_secureElementWrapper;
    self->_secureElementWrapper = v16;

    id v18 = [(_NFContactlessSession *)self preloadApplets];
  }
  id v19 = [(_NFXPCSession *)self remoteObject];
  [v19 didStartSession:v5];
}

- (void)_internalCleanup
{
  if (![(_NFSession *)self isSuspended])
  {
    if (self->_activeKeyIdentifiers && self->_activeApplet) {
      id v4 = -[_NFContactlessSession _resetVolatileConfigOnApplet:](self, "_resetVolatileConfigOnApplet:");
    }
    if (self->_activeSecondaryKeyIdentifiers && self->_activeSecondaryApplet)
    {
      id v5 = -[_NFContactlessSession _resetVolatileConfigOnApplet:](self, "_resetVolatileConfigOnApplet:");
      activeSecondaryApplet = self->_activeSecondaryApplet;
      self->_activeSecondaryApplet = 0;

      activeSecondaryKeyIdentifiers = self->_activeSecondaryKeyIdentifiers;
      self->_activeSecondaryKeyIdentifiers = 0;
    }
    if (self->_activeApplet)
    {
      uint64_t v8 = [(_NFSession *)self expressModeManager];
      if (v8)
      {
        v9 = (void *)v8;
        v10 = [(_NFSession *)self expressModeManager];
        uint64_t v11 = [(NFApplet *)self->_activeApplet identifier];
        char v12 = sub_100046A30((uint64_t)v10, v11);

        if ((v12 & 1) == 0)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            int v14 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            uint64_t v19 = 45;
            if (isMetaClass) {
              uint64_t v19 = 43;
            }
            v14(6, "%c[%{public}s %{public}s]:%i Deselecting applet %{public}@", v19, ClassName, Name, 97, self->_activeApplet);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v20 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_super v21 = object_getClass(self);
            if (class_isMetaClass(v21)) {
              int v22 = 43;
            }
            else {
              int v22 = 45;
            }
            int v23 = object_getClassName(self);
            __int16 v24 = sel_getName(a2);
            activeApplet = self->_activeApplet;
            *(_DWORD *)buf = 67110146;
            int v31 = v22;
            __int16 v32 = 2082;
            v33 = v23;
            __int16 v34 = 2082;
            v35 = v24;
            __int16 v36 = 1024;
            int v37 = 97;
            __int16 v38 = 2114;
            v39 = activeApplet;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Deselecting applet %{public}@", buf, 0x2Cu);
          }

          __int16 v26 = [(_NFSession *)self expressModeManager];
          sub_1000471A0((uint64_t)v26, 1);

          id v27 = [(_NFContactlessSession *)self setActiveApplet:0];
          __int16 v28 = [(_NFSession *)self expressModeManager];
          if (v28)
          {
            uint64_t v29 = v28[2];
            if (v29) {
              *(unsigned char *)(v29 + 220) = 0;
            }
          }
        }
      }
    }
    sub_1001AF914((uint64_t)self->_powerConsumptionReporter);
  }
}

- (void)cleanup
{
  id v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFContactlessSession", buf, 2u);
  }

  if ([(_NFSession *)self needsCleanup])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 110);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      char v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      int v14 = object_getClassName(self);
      id v15 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v20 = v13;
      __int16 v21 = 2082;
      int v22 = v14;
      __int16 v23 = 2082;
      __int16 v24 = v15;
      __int16 v25 = 1024;
      int v26 = 110;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    [(_NFContactlessSession *)self _internalCleanup];
  }
  v18.receiver = self;
  v18.super_class = (Class)_NFContactlessSession;
  [(_NFSession *)&v18 cleanup];
  v16 = NFSharedSignpostLog();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFContactlessSession", buf, 2u);
  }
}

- (BOOL)suspendWithInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NFContactlessSession;
  BOOL v4 = [(_NFXPCSession *)&v6 suspendWithInfo:a3];
  if (v4) {
    [(_NFContactlessSession *)self _internalCleanup];
  }
  return v4;
}

- (NFApplet)activeApplet
{
  return self->_activeApplet;
}

- (NSArray)activeAppletGroupMembers
{
  return self->_activeGroupMembers;
}

- (NSArray)applets
{
  return self->_applets;
}

- (BOOL)useFilteredApplets
{
  return 0;
}

- (BOOL)canEnableExpress
{
  activeApplet = self->_activeApplet;
  if (activeApplet)
  {
    BOOL v4 = activeApplet;
  }
  else
  {
    BOOL v4 = [(_NFContactlessSession *)self deferredActivationApplet];
  }
  id v5 = v4;
  BOOL v6 = [(_NFContactlessSession *)self _expressModeRequiredForApplet:v4 keySet:self->_activeKeyIdentifiers];

  return v6;
}

- (BOOL)_expressModeRequiredForApplet:(id)a3 keySet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(_NFSession *)self expressModeManager];
    if (!v8)
    {
      uint64_t v11 = 0;
      LOBYTE(v9) = 0;
LABEL_11:

      goto LABEL_12;
    }
    if (*(void *)(v8 + 136) == 1)
    {

LABEL_7:
      activeKeyIdentifiers = self->_activeKeyIdentifiers;
      uint64_t v11 = [(_NFSession *)self expressModeManager];
      char v12 = [v6 identifier];
      if (activeKeyIdentifiers) {
        char v13 = sub_100046B5C((uint64_t)v11, v12, v7);
      }
      else {
        char v13 = sub_100046A30((uint64_t)v11, v12);
      }
      LOBYTE(v9) = v13;

      goto LABEL_11;
    }
    int v9 = *(unsigned __int8 *)(v8 + 170);

    if (v9) {
      goto LABEL_7;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
LABEL_12:

  return v9;
}

- (void)_setActiveSecureElementWrapper:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(_NFContactlessSession *)self secureElementWrapper];

    if (v6 != v5)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v8 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v12 = 45;
        if (isMetaClass) {
          uint64_t v12 = 43;
        }
        v8(6, "%c[%{public}s %{public}s]:%i switching to eSE", v12, ClassName, Name, 176);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      char v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = object_getClass(self);
        if (class_isMetaClass(v14)) {
          int v15 = 43;
        }
        else {
          int v15 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v18 = v15;
        __int16 v19 = 2082;
        int v20 = object_getClassName(self);
        __int16 v21 = 2082;
        int v22 = sel_getName(a2);
        __int16 v23 = 1024;
        int v24 = 176;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i switching to eSE", buf, 0x22u);
      }

      [(_NFContactlessSession *)self setSecureElementWrapper:v5];
    }
  }
}

- (id)_getSecureElementWrapperForApplet:(id)a3
{
  id v5 = a3;
  id v6 = [(_NFContactlessSession *)self secureElementWrapper];
  v62 = v6;
  id v7 = +[NSArray arrayWithObjects:&v62 count:1];

  if (v5)
  {
    appletMap = self->_appletMap;
    int v9 = [v5 identifier];
    uint64_t v10 = [(NSMutableDictionary *)appletMap objectForKey:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v46 objects:v61 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v47;
    v40 = self;
    v41 = a2;
    uint64_t v39 = *(void *)v47;
    while (2)
    {
      int v15 = 0;
      do
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v15);
        if (v10)
        {
          v17 = [*(id *)(*((void *)&v46 + 1) + 8 * (void)v15) serialNumber];
          if ([v10 isEqualToString:v17])
          {

LABEL_39:
            id v35 = v16;
LABEL_34:
            v30 = v11;
            goto LABEL_35;
          }
          int v18 = [v16 systemOSSerialNumber];
          unsigned int v19 = [v10 isEqualToString:v18];

          if (v19) {
            goto LABEL_39;
          }
        }
        if (!v5) {
          goto LABEL_39;
        }
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        int v20 = sub_1002431DC(v16);
        id v21 = [v20 countByEnumeratingWithState:&v42 objects:v60 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v43;
          while (2)
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v43 != v23) {
                objc_enumerationMutation(v20);
              }
              if ([*(id *)(*((void *)&v42 + 1) + 8 * i) isEqualToApplet:v5])
              {
                id v35 = v16;

                goto LABEL_34;
              }
            }
            id v22 = [v20 countByEnumeratingWithState:&v42 objects:v60 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        int v15 = (char *)v15 + 1;
        self = v40;
        a2 = v41;
        uint64_t v14 = v39;
      }
      while (v15 != v13);
      id v13 = [v11 countByEnumeratingWithState:&v46 objects:v61 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v26 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v29 = 45;
    if (isMetaClass) {
      uint64_t v29 = 43;
    }
    v26(3, "%c[%{public}s %{public}s]:%i No secure element wrapper found for applet %{public}@", v29, ClassName, Name, 206, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v30 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    int v31 = object_getClass(self);
    if (class_isMetaClass(v31)) {
      int v32 = 43;
    }
    else {
      int v32 = 45;
    }
    v33 = object_getClassName(self);
    __int16 v34 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v51 = v32;
    __int16 v52 = 2082;
    v53 = v33;
    __int16 v54 = 2082;
    v55 = v34;
    __int16 v56 = 1024;
    int v57 = 206;
    __int16 v58 = 2114;
    id v59 = v5;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No secure element wrapper found for applet %{public}@", buf, 0x2Cu);
  }
  id v35 = 0;
LABEL_35:

  return v35;
}

- (void)switchToSecureElementWrapperForApplet:(id)a3
{
  id v4 = [(_NFContactlessSession *)self _getSecureElementWrapperForApplet:a3];
  [(_NFContactlessSession *)self _setActiveSecureElementWrapper:v4];
}

- (id)seidForApplet:(id)a3
{
  appletMap = self->_appletMap;
  id v4 = [a3 identifier];
  id v5 = [(NSMutableDictionary *)appletMap objectForKey:v4];

  return v5;
}

- (id)_activateKeys:(BOOL)a3 forIdentifiers:(id)a4 onApplet:(id)a5
{
  BOOL v6 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v16 = 45;
    if (isMetaClass) {
      uint64_t v16 = 43;
    }
    v12(6, "%c[%{public}s %{public}s]:%i applet: %{public}@  keyIdentifiers: %{public}@", v16, ClassName, Name, 223, v10, v9);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    *(_DWORD *)buf = 67110402;
    int v42 = v19;
    __int16 v43 = 2082;
    long long v44 = object_getClassName(self);
    __int16 v45 = 2082;
    long long v46 = sel_getName(a2);
    __int16 v47 = 1024;
    int v48 = 223;
    __int16 v49 = 2114;
    id v50 = v10;
    __int16 v51 = 2114;
    id v52 = v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i applet: %{public}@  keyIdentifiers: %{public}@", buf, 0x36u);
  }

  if (v10 && [v10 containsSubKeys])
  {
    [(_NFContactlessSession *)self switchToSecureElementWrapperForApplet:v10];
    if ([(_NFContactlessSession *)self startWiredMode])
    {
      int v20 = [(_NFContactlessSession *)self secureElementWrapper];
      sub_10024CE74(v20, v6, v9, v10);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v22 = NFLogGetLogger();
      if (v22)
      {
        uint64_t v23 = (void (*)(uint64_t, const char *, ...))v22;
        int v24 = object_getClass(self);
        BOOL v25 = class_isMetaClass(v24);
        int v26 = object_getClassName(self);
        __int16 v38 = sel_getName(a2);
        uint64_t v27 = 45;
        if (v25) {
          uint64_t v27 = 43;
        }
        v23(3, "%c[%{public}s %{public}s]:%i Failed to start wired mode to eSE", v27, v26, v38, 234);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v28 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = object_getClass(self);
        if (class_isMetaClass(v29)) {
          int v30 = 43;
        }
        else {
          int v30 = 45;
        }
        int v31 = object_getClassName(self);
        int v32 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v42 = v30;
        __int16 v43 = 2082;
        long long v44 = v31;
        __int16 v45 = 2082;
        long long v46 = v32;
        __int16 v47 = 1024;
        int v48 = 234;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start wired mode to eSE", buf, 0x22u);
      }

      id v33 = objc_alloc((Class)NSError);
      int v20 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
      __int16 v34 = +[NSString stringWithUTF8String:"Stack Error"];
      v40 = v34;
      id v35 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      id v21 = [v33 initWithDomain:v20 code:15 userInfo:v35];
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)_activateKeys:(BOOL)a3 aidsAndKeys:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i aidsAndKeys: %{public}@", v12, ClassName, Name, 246, v7);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v41 = v15;
    __int16 v42 = 2082;
    __int16 v43 = object_getClassName(self);
    __int16 v44 = 2082;
    __int16 v45 = sel_getName(a2);
    __int16 v46 = 1024;
    int v47 = 246;
    __int16 v48 = 2114;
    id v49 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i aidsAndKeys: %{public}@", buf, 0x2Cu);
  }

  if ([(_NFContactlessSession *)self startWiredMode])
  {
    uint64_t v16 = [(_NFContactlessSession *)self secureElementWrapper];
    sub_10024D9AC(v16, v4, v7);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v18 = NFLogGetLogger();
    if (v18)
    {
      int v19 = (void (*)(uint64_t, const char *, ...))v18;
      int v20 = object_getClass(self);
      BOOL v21 = class_isMetaClass(v20);
      uint64_t v22 = object_getClassName(self);
      int v37 = sel_getName(a2);
      uint64_t v23 = 45;
      if (v21) {
        uint64_t v23 = 43;
      }
      v19(3, "%c[%{public}s %{public}s]:%i Failed to start wired mode to eSE", v23, v22, v37, 250);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      BOOL v25 = object_getClass(self);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      uint64_t v27 = object_getClassName(self);
      __int16 v28 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v41 = v26;
      __int16 v42 = 2082;
      __int16 v43 = v27;
      __int16 v44 = 2082;
      __int16 v45 = v28;
      __int16 v46 = 1024;
      int v47 = 250;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start wired mode to eSE", buf, 0x22u);
    }

    id v29 = objc_alloc((Class)NSError);
    uint64_t v16 = +[NSString stringWithUTF8String:"nfcd"];
    v38[0] = NSLocalizedDescriptionKey;
    int v30 = +[NSString stringWithUTF8String:"Stack Error"];
    v39[0] = v30;
    v39[1] = &off_10031B220;
    v38[1] = @"Line";
    v38[2] = @"Method";
    id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v39[2] = v31;
    v38[3] = NSDebugDescriptionErrorKey;
    id v32 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 251];
    v39[3] = v32;
    id v33 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
    id v17 = [v29 initWithDomain:v16 code:15 userInfo:v33];
  }

  return v17;
}

- (id)_resetVolatileConfigOnApplet:(id)a3
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
    v7(6, "%c[%{public}s %{public}s]:%i applet: %{public}@", v10, ClassName, Name, 262, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v39 = v13;
    __int16 v40 = 2082;
    int v41 = object_getClassName(self);
    __int16 v42 = 2082;
    __int16 v43 = sel_getName(a2);
    __int16 v44 = 1024;
    int v45 = 262;
    __int16 v46 = 2114;
    id v47 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i applet: %{public}@", buf, 0x2Cu);
  }

  if (v5 && [v5 containsSubKeys])
  {
    [(_NFContactlessSession *)self switchToSecureElementWrapperForApplet:v5];
    if ([(_NFContactlessSession *)self startWiredMode])
    {
      uint64_t v14 = [(_NFContactlessSession *)self secureElementWrapper];
      sub_10024E7B8(v14, v5);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v16 = NFLogGetLogger();
      if (v16)
      {
        id v17 = (void (*)(uint64_t, const char *, ...))v16;
        uint64_t v18 = object_getClass(self);
        BOOL v19 = class_isMetaClass(v18);
        int v20 = object_getClassName(self);
        id v35 = sel_getName(a2);
        uint64_t v21 = 45;
        if (v19) {
          uint64_t v21 = 43;
        }
        v17(3, "%c[%{public}s %{public}s]:%i Failed to start wired mode eSE", v21, v20, v35, 273);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = object_getClass(self);
        if (class_isMetaClass(v23)) {
          int v24 = 43;
        }
        else {
          int v24 = 45;
        }
        BOOL v25 = object_getClassName(self);
        int v26 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v39 = v24;
        __int16 v40 = 2082;
        int v41 = v25;
        __int16 v42 = 2082;
        __int16 v43 = v26;
        __int16 v44 = 1024;
        int v45 = 273;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start wired mode eSE", buf, 0x22u);
      }

      id v27 = objc_alloc((Class)NSError);
      uint64_t v14 = +[NSString stringWithUTF8String:"nfcd"];
      v36[0] = NSLocalizedDescriptionKey;
      __int16 v28 = +[NSString stringWithUTF8String:"Stack Error"];
      v37[0] = v28;
      v37[1] = &off_10031B238;
      v36[1] = @"Line";
      v36[2] = @"Method";
      id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v37[2] = v29;
      v36[3] = NSDebugDescriptionErrorKey;
      id v30 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 274];
      v37[3] = v30;
      id v31 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
      id v15 = [v27 initWithDomain:v14 code:15 userInfo:v31];
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)setActiveKeys:(id)a3 onApplet:(id)a4 allowBackgroundTransactions:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v16 = 45;
    if (isMetaClass) {
      uint64_t v16 = 43;
    }
    v12(6, "%c[%{public}s %{public}s]:%i applet: %{public}@  keyIdentifiers: %{public}@", v16, ClassName, Name, 284, v10, v9);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    *(_DWORD *)buf = 67110402;
    int v45 = v19;
    __int16 v46 = 2082;
    id v47 = object_getClassName(self);
    __int16 v48 = 2082;
    id v49 = sel_getName(a2);
    __int16 v50 = 1024;
    int v51 = 284;
    __int16 v52 = 2114;
    unint64_t v53 = v10;
    __int16 v54 = 2114;
    unint64_t v55 = v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i applet: %{public}@  keyIdentifiers: %{public}@", buf, 0x36u);
  }

  if (self->_activeApplet && self->_activeKeyIdentifiers)
  {
    -[_NFContactlessSession _activateKeys:forIdentifiers:onApplet:](self, "_activateKeys:forIdentifiers:onApplet:", 0);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20) {
      goto LABEL_34;
    }
    activeKeyIdentifiers = self->_activeKeyIdentifiers;
    self->_activeKeyIdentifiers = 0;
  }
  if (v9 | v10)
  {
    if (!v9 || v10)
    {
      if (v9) {
        uint64_t v36 = 1;
      }
      else {
        uint64_t v36 = v5;
      }
      id v20 = [(_NFContactlessSession *)self _activateKeys:v36 forIdentifiers:v9 onApplet:v10];
      if (v20) {
        goto LABEL_34;
      }
      int v37 = (NSSet *)(id)v9;
      id v33 = self->_activeKeyIdentifiers;
      self->_activeKeyIdentifiers = v37;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v22 = NFLogGetLogger();
      if (v22)
      {
        uint64_t v23 = (void (*)(uint64_t, const char *, ...))v22;
        int v24 = object_getClass(self);
        BOOL v25 = class_isMetaClass(v24);
        int v39 = object_getClassName(self);
        int v41 = sel_getName(a2);
        uint64_t v26 = 45;
        if (v25) {
          uint64_t v26 = 43;
        }
        v23(3, "%c[%{public}s %{public}s]:%i An applet is needed to activate keys %{public}@", v26, v39, v41, 316, v9);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v27 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = object_getClass(self);
        if (class_isMetaClass(v28)) {
          int v29 = 43;
        }
        else {
          int v29 = 45;
        }
        id v30 = object_getClassName(self);
        id v31 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v45 = v29;
        __int16 v46 = 2082;
        id v47 = v30;
        __int16 v48 = 2082;
        id v49 = v31;
        __int16 v50 = 1024;
        int v51 = 316;
        __int16 v52 = 2114;
        unint64_t v53 = v9;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i An applet is needed to activate keys %{public}@", buf, 0x2Cu);
      }

      id v32 = objc_alloc((Class)NSError);
      id v33 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
      __int16 v34 = +[NSString stringWithUTF8String:"Invalid Parameter"];
      __int16 v43 = v34;
      id v35 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      id v20 = [v32 initWithDomain:v33 code:10 userInfo:v35];
    }
  }
  else
  {
    id v20 = 0;
  }
LABEL_34:

  return v20;
}

- (id)setActiveKeys:(id)a3 allowBackgroundTransactions:(BOOL)a4
{
  id v6 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i keyIdentifiers: %{public}@", v11, ClassName, Name, 332, v6);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v104 = v14;
    __int16 v105 = 2082;
    v106 = object_getClassName(self);
    __int16 v107 = 2082;
    v108 = sel_getName(a2);
    __int16 v109 = 1024;
    int v110 = 332;
    __int16 v111 = 2114;
    id v112 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i keyIdentifiers: %{public}@", buf, 0x2Cu);
  }

  if (self->_activeApplet && self->_activeKeyIdentifiers)
  {
    uint64_t v15 = -[_NFContactlessSession _activateKeys:forIdentifiers:onApplet:](self, "_activateKeys:forIdentifiers:onApplet:", 0);
    if (v15)
    {
      id v16 = (id)v15;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v17 = NFLogGetLogger();
      if (v17)
      {
        uint64_t v18 = (void (*)(uint64_t, const char *, ...))v17;
        int v19 = object_getClass(self);
        BOOL v20 = class_isMetaClass(v19);
        uint64_t v21 = object_getClassName(self);
        v92 = sel_getName(a2);
        uint64_t v22 = 45;
        if (v20) {
          uint64_t v22 = 43;
        }
        v18(3, "%c[%{public}s %{public}s]:%i Unable to deactivate keys on avtiveApplet", v22, v21, v92, 343);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v23 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v24 = object_getClass(self);
        if (class_isMetaClass(v24)) {
          int v25 = 43;
        }
        else {
          int v25 = 45;
        }
        uint64_t v26 = object_getClassName(self);
        id v27 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v104 = v25;
        __int16 v105 = 2082;
        v106 = v26;
        __int16 v107 = 2082;
        v108 = v27;
        __int16 v109 = 1024;
        int v110 = 343;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to deactivate keys on avtiveApplet", buf, 0x22u);
      }
      goto LABEL_72;
    }
    activeKeyIdentifiers = self->_activeKeyIdentifiers;
    self->_activeKeyIdentifiers = 0;

    activeSecondaryKeyIdentifiers = self->_activeSecondaryKeyIdentifiers;
    self->_activeSecondaryKeyIdentifiers = 0;
  }
  if (v6)
  {
    id v30 = [v6 allKeys];
    uint64_t v23 = [v30 objectAtIndex:0];

    id v31 = [v6 objectForKey:v23];
    if (v31)
    {
      uint64_t v32 = [(_NFContactlessSession *)self _activateKeys:1 aidsAndKeys:v6];
      if (v32)
      {
        id v16 = (id)v32;
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v33 = NFLogGetLogger();
        if (v33)
        {
          __int16 v34 = (void (*)(uint64_t, const char *, ...))v33;
          id v35 = object_getClass(self);
          BOOL v36 = class_isMetaClass(v35);
          v90 = object_getClassName(self);
          v93 = sel_getName(a2);
          uint64_t v37 = 45;
          if (v36) {
            uint64_t v37 = 43;
          }
          v34(3, "%c[%{public}s %{public}s]:%i Unable to activate Keys : error = %@", v37, v90, v93, 381, v16);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v38 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          int v39 = object_getClass(self);
          if (class_isMetaClass(v39)) {
            int v40 = 43;
          }
          else {
            int v40 = 45;
          }
          int v41 = object_getClassName(self);
          NSErrorUserInfoKey v42 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v104 = v40;
          __int16 v105 = 2082;
          v106 = v41;
          __int16 v107 = 2082;
          v108 = v42;
          __int16 v109 = 1024;
          int v110 = 381;
          __int16 v111 = 2112;
          id v112 = v16;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to activate Keys : error = %@", buf, 0x2Cu);
        }
      }
      else
      {
        __int16 v38 = +[NSSet setWithObject:v31];
        objc_storeStrong((id *)&self->_activeKeyIdentifiers, v38);
        if ((unint64_t)[v6 count] >= 2)
        {
          v75 = [v6 allKeys];
          v76 = [v75 objectAtIndex:1];

          if (v76)
          {
            v77 = [v6 objectForKey:v76];
            if (v77)
            {
              v78 = +[NSSet setWithObject:v77];
              p_super = &self->_activeSecondaryKeyIdentifiers->super;
              self->_activeSecondaryKeyIdentifiers = v78;
            }
            else
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v80 = NFLogGetLogger();
              if (v80)
              {
                v81 = (void (*)(uint64_t, const char *, ...))v80;
                v82 = object_getClass(self);
                BOOL v97 = class_isMetaClass(v82);
                v98 = object_getClassName(self);
                v96 = sel_getName(a2);
                uint64_t v83 = 45;
                if (v97) {
                  uint64_t v83 = 43;
                }
                v81(6, "%c[%{public}s %{public}s]:%i Invalid secondaryKeyIdentifier. Not setting", v83, v98, v96, 376);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              p_super = NFSharedLogGetLogger();
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
              {
                v84 = object_getClass(self);
                if (class_isMetaClass(v84)) {
                  int v85 = 43;
                }
                else {
                  int v85 = 45;
                }
                v86 = object_getClassName(self);
                v87 = sel_getName(a2);
                *(_DWORD *)buf = 67109890;
                int v104 = v85;
                __int16 v105 = 2082;
                v106 = v86;
                __int16 v107 = 2082;
                v108 = v87;
                __int16 v109 = 1024;
                int v110 = 376;
                _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid secondaryKeyIdentifier. Not setting", buf, 0x22u);
              }
            }
          }
        }
        id v16 = 0;
      }
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v59 = NFLogGetLogger();
      if (v59)
      {
        v60 = (void (*)(uint64_t, const char *, ...))v59;
        v61 = object_getClass(self);
        BOOL v62 = class_isMetaClass(v61);
        v63 = object_getClassName(self);
        v95 = sel_getName(a2);
        uint64_t v64 = 45;
        if (v62) {
          uint64_t v64 = 43;
        }
        v60(3, "%c[%{public}s %{public}s]:%i Invaid primaryKeyIdentifier", v64, v63, v95, 357);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v65 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v66 = object_getClass(self);
        if (class_isMetaClass(v66)) {
          int v67 = 43;
        }
        else {
          int v67 = 45;
        }
        v68 = object_getClassName(self);
        v69 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v104 = v67;
        __int16 v105 = 2082;
        v106 = v68;
        __int16 v107 = 2082;
        v108 = v69;
        __int16 v109 = 1024;
        int v110 = 357;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invaid primaryKeyIdentifier", buf, 0x22u);
      }

      id v70 = objc_alloc((Class)NSError);
      __int16 v38 = +[NSString stringWithUTF8String:"nfcd"];
      v99[0] = NSLocalizedDescriptionKey;
      v71 = +[NSString stringWithUTF8String:"Invalid Parameter"];
      v100[0] = v71;
      v100[1] = &off_10031B268;
      v99[1] = @"Line";
      v99[2] = @"Method";
      id v72 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v100[2] = v72;
      v99[3] = NSDebugDescriptionErrorKey;
      id v73 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 359];
      v100[3] = v73;
      v74 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:4];
      id v16 = [v70 initWithDomain:v38 code:10 userInfo:v74];
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v43 = NFLogGetLogger();
    if (v43)
    {
      __int16 v44 = (void (*)(uint64_t, const char *, ...))v43;
      int v45 = object_getClass(self);
      BOOL v46 = class_isMetaClass(v45);
      id v47 = object_getClassName(self);
      v94 = sel_getName(a2);
      uint64_t v48 = 45;
      if (v46) {
        uint64_t v48 = 43;
      }
      v44(3, "%c[%{public}s %{public}s]:%i No applets or keyIdentifiers ", v48, v47, v94, 349);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v49 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      __int16 v50 = object_getClass(self);
      if (class_isMetaClass(v50)) {
        int v51 = 43;
      }
      else {
        int v51 = 45;
      }
      __int16 v52 = object_getClassName(self);
      unint64_t v53 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v104 = v51;
      __int16 v105 = 2082;
      v106 = v52;
      __int16 v107 = 2082;
      v108 = v53;
      __int16 v109 = 1024;
      int v110 = 349;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No applets or keyIdentifiers ", buf, 0x22u);
    }

    id v54 = objc_alloc((Class)NSError);
    uint64_t v23 = +[NSString stringWithUTF8String:"nfcd"];
    v101[0] = NSLocalizedDescriptionKey;
    unint64_t v55 = +[NSString stringWithUTF8String:"Invalid Parameter"];
    v102[0] = v55;
    v102[1] = &off_10031B250;
    v101[1] = @"Line";
    v101[2] = @"Method";
    id v56 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v102[2] = v56;
    v101[3] = NSDebugDescriptionErrorKey;
    id v57 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 350];
    v102[3] = v57;
    __int16 v58 = +[NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:4];
    id v16 = [v54 initWithDomain:v23 code:10 userInfo:v58];
  }
LABEL_72:

  return v16;
}

- (id)setActiveApplet:(id)a3
{
  id v6 = (NFApplet *)a3;
  id v7 = [(_NFSession *)self expressModeManager];

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  unint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
  if (!v7)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v60 = 45;
      if (isMetaClass) {
        uint64_t v60 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i EMM is nil", v60, ClassName, Name, 390);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v61 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      BOOL v62 = object_getClass(self);
      if (class_isMetaClass(v62)) {
        int v63 = 43;
      }
      else {
        int v63 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v161 = v63;
      __int16 v162 = 2082;
      v163 = object_getClassName(self);
      __int16 v164 = 2082;
      v165 = sel_getName(a2);
      __int16 v166 = 1024;
      int v167 = 390;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i EMM is nil", buf, 0x22u);
    }

    id v64 = objc_alloc((Class)NSError);
    v65 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v176 = NSLocalizedDescriptionKey;
    v66 = +[NSString stringWithUTF8String:"Invalid State"];
    v177 = v66;
    int v67 = +[NSDictionary dictionaryWithObjects:&v177 forKeys:&v176 count:1];
    v68 = v64;
    v69 = v65;
    uint64_t v70 = 12;
    goto LABEL_96;
  }
  if (Logger)
  {
    unint64_t v10 = object_getClass(self);
    BOOL v11 = class_isMetaClass(v10);
    v145 = object_getClassName(self);
    v150 = sel_getName(a2);
    uint64_t v12 = 45;
    if (v11) {
      uint64_t v12 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@", v12, v145, v150, 394, v6);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v161 = v15;
    __int16 v162 = 2082;
    v163 = object_getClassName(self);
    __int16 v164 = 2082;
    v165 = sel_getName(a2);
    __int16 v166 = 1024;
    int v167 = 394;
    __int16 v168 = 2114;
    v169 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  if (!v6 || ![(NFApplet *)self->_activeApplet isEqualToApplet:v6])
  {
    if (self->_activeApplet)
    {
      -[_NFContactlessSession switchToSecureElementWrapperForApplet:](self, "switchToSecureElementWrapperForApplet:");
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v16 = NFLogGetLogger();
      if (v16)
      {
        uint64_t v17 = (void (*)(uint64_t, const char *, ...))v16;
        uint64_t v18 = object_getClass(self);
        BOOL v19 = class_isMetaClass(v18);
        BOOL v20 = object_getClassName(self);
        uint64_t v21 = sel_getName(a2);
        uint64_t v22 = 45;
        if (v19) {
          uint64_t v22 = 43;
        }
        v17(6, "%c[%{public}s %{public}s]:%i Deselecting current active applet: %{public}@", v22, v20, v21, 401, self->_activeApplet);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v23 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = object_getClass(self);
        if (class_isMetaClass(v24)) {
          int v25 = 43;
        }
        else {
          int v25 = 45;
        }
        uint64_t v26 = object_getClassName(self);
        id v27 = sel_getName(a2);
        activeApplet = self->_activeApplet;
        *(_DWORD *)buf = 67110146;
        int v161 = v25;
        __int16 v162 = 2082;
        v163 = v26;
        __int16 v164 = 2082;
        v165 = v27;
        __int16 v166 = 1024;
        int v167 = 401;
        __int16 v168 = 2114;
        v169 = activeApplet;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Deselecting current active applet: %{public}@", buf, 0x2Cu);
      }

      if (![(_NFContactlessSession *)self startWiredMode])
      {
        id v71 = objc_alloc((Class)NSError);
        v65 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v174 = NSLocalizedDescriptionKey;
        v66 = +[NSString stringWithUTF8String:"Stack Error"];
        v175 = v66;
        id v72 = &v175;
        id v73 = &v174;
LABEL_95:
        int v67 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v73 count:1];
        v68 = v71;
        v69 = v65;
        uint64_t v70 = 15;
LABEL_96:
        BOOL v46 = (NFApplet *)[v68 initWithDomain:v69 code:v70 userInfo:v67];

        goto LABEL_97;
      }
      if (self->_activeKeyIdentifiers)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v29 = NFLogGetLogger();
        if (v29)
        {
          id v30 = (void (*)(uint64_t, const char *, ...))v29;
          id v31 = object_getClass(self);
          BOOL v32 = class_isMetaClass(v31);
          uint64_t v33 = object_getClassName(self);
          __int16 v34 = sel_getName(a2);
          id v35 = [(NFApplet *)self->_activeApplet identifier];
          uint64_t v36 = 45;
          if (v32) {
            uint64_t v36 = 43;
          }
          v30(6, "%c[%{public}s %{public}s]:%i Resetting volatile config on: %{public}@", v36, v33, v34, 408, v35);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v37 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v38 = object_getClass(self);
          if (class_isMetaClass(v38)) {
            int v39 = 43;
          }
          else {
            int v39 = 45;
          }
          int v40 = object_getClassName(self);
          int v41 = sel_getName(a2);
          NSErrorUserInfoKey v42 = [(NFApplet *)self->_activeApplet identifier];
          *(_DWORD *)buf = 67110146;
          int v161 = v39;
          __int16 v162 = 2082;
          v163 = v40;
          __int16 v164 = 2082;
          v165 = v41;
          __int16 v166 = 1024;
          int v167 = 408;
          __int16 v168 = 2114;
          v169 = v42;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resetting volatile config on: %{public}@", buf, 0x2Cu);
        }
        uint64_t v43 = [(_NFContactlessSession *)self secureElementWrapper];
        id v44 = sub_10024E7B8(v43, self->_activeApplet);
      }
      int v45 = [(_NFContactlessSession *)self secureElementWrapper];
      sub_1002457D4(v45);
      BOOL v46 = (NFApplet *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v47 = NFLogGetLogger();
        if (v47)
        {
          uint64_t v48 = (void (*)(uint64_t, const char *, ...))v47;
          id v49 = object_getClass(self);
          BOOL v50 = class_isMetaClass(v49);
          v146 = object_getClassName(self);
          v151 = sel_getName(a2);
          uint64_t v51 = 45;
          if (v50) {
            uint64_t v51 = 43;
          }
          v48(3, "%c[%{public}s %{public}s]:%i deactivateAll failed: %{public}@", v51, v146, v151, 415, v46);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v52 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          unint64_t v53 = object_getClass(self);
          if (class_isMetaClass(v53)) {
            int v54 = 43;
          }
          else {
            int v54 = 45;
          }
          unint64_t v55 = object_getClassName(self);
          id v56 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v161 = v54;
          __int16 v162 = 2082;
          v163 = v55;
          __int16 v164 = 2082;
          v165 = v56;
          __int16 v166 = 1024;
          int v167 = 415;
          __int16 v168 = 2114;
          v169 = v46;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i deactivateAll failed: %{public}@", buf, 0x2Cu);
        }

        goto LABEL_97;
      }
      if ([(_NFContactlessSession *)self plasticCardMode])
      {
        v117 = [(_NFContactlessSession *)self secureElementWrapper];
        sub_100251A48(v117, 0, self->_activeApplet);
        v118 = (NFApplet *)objc_claimAutoreleasedReturnValue();

        if (v118)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v119 = NFLogGetLogger();
          if (v119)
          {
            v120 = (void (*)(uint64_t, const char *, ...))v119;
            v121 = object_getClass(self);
            BOOL v122 = class_isMetaClass(v121);
            v149 = object_getClassName(self);
            v156 = sel_getName(a2);
            uint64_t v123 = 45;
            if (v122) {
              uint64_t v123 = 43;
            }
            v120(3, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", v123, v149, v156, 422, v118);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v124 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
          {
            v125 = object_getClass(self);
            if (class_isMetaClass(v125)) {
              int v126 = 43;
            }
            else {
              int v126 = 45;
            }
            v127 = object_getClassName(self);
            v128 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v161 = v126;
            __int16 v162 = 2082;
            v163 = v127;
            __int16 v164 = 2082;
            v165 = v128;
            __int16 v166 = 1024;
            int v167 = 422;
            __int16 v168 = 2114;
            v169 = v118;
            _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", buf, 0x2Cu);
          }
        }
      }
      else
      {
        v118 = 0;
      }
      v129 = self->_activeApplet;
      self->_activeApplet = 0;

      activeGroupMembers = self->_activeGroupMembers;
      self->_activeGroupMembers = 0;

      if (!v6) {
        goto LABEL_114;
      }
    }
    else
    {
      -[_NFContactlessSession switchToSecureElementWrapperForApplet:](self, "switchToSecureElementWrapperForApplet:");
      if (!v6)
      {
LABEL_114:
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v131 = NFLogGetLogger();
        if (v131)
        {
          v132 = (void (*)(uint64_t, const char *, ...))v131;
          v133 = object_getClass(self);
          BOOL v134 = class_isMetaClass(v133);
          v135 = object_getClassName(self);
          v157 = sel_getName(a2);
          uint64_t v136 = 45;
          if (v134) {
            uint64_t v136 = 43;
          }
          v132(6, "%c[%{public}s %{public}s]:%i Removing express mode aid restriction", v136, v135, v157, 434);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v137 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
        {
          v138 = object_getClass(self);
          if (class_isMetaClass(v138)) {
            int v139 = 43;
          }
          else {
            int v139 = 45;
          }
          v140 = object_getClassName(self);
          v141 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v161 = v139;
          __int16 v162 = 2082;
          v163 = v140;
          __int16 v164 = 2082;
          v165 = v141;
          __int16 v166 = 1024;
          int v167 = 434;
          _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Removing express mode aid restriction", buf, 0x22u);
        }

        v142 = [(_NFSession *)self expressModeManager];
        sub_10004BB60((uint64_t)v142, 0);

        BOOL v46 = 0;
        self->_activeAppletEmulationType = 0;
        goto LABEL_97;
      }
    }
  }
  if (self->_activeApplet)
  {
LABEL_58:
    BOOL v46 = 0;
    self->_activeAppletEmulationType = -[_NFContactlessSession _getActiveAppletEmulationType:](self, "_getActiveAppletEmulationType:");
    goto LABEL_97;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v74 = NFLogGetLogger();
  if (v74)
  {
    v75 = (void (*)(uint64_t, const char *, ...))v74;
    v76 = object_getClass(self);
    BOOL v77 = class_isMetaClass(v76);
    v147 = object_getClassName(self);
    v153 = sel_getName(a2);
    uint64_t v78 = 45;
    if (v77) {
      uint64_t v78 = 43;
    }
    v75(6, "%c[%{public}s %{public}s]:%i Activating %{public}@", v78, v147, v153, 440, v6);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v79 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v80 = object_getClass(self);
    if (class_isMetaClass(v80)) {
      int v81 = 43;
    }
    else {
      int v81 = 45;
    }
    v82 = object_getClassName(self);
    uint64_t v83 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v161 = v81;
    __int16 v162 = 2082;
    v163 = v82;
    __int16 v164 = 2082;
    v165 = v83;
    __int16 v166 = 1024;
    int v167 = 440;
    __int16 v168 = 2114;
    v169 = v6;
    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Activating %{public}@", buf, 0x2Cu);
  }

  [(_NFContactlessSession *)self switchToSecureElementWrapperForApplet:v6];
  if (![(_NFContactlessSession *)self startWiredMode])
  {
    id v71 = objc_alloc((Class)NSError);
    v65 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v172 = NSLocalizedDescriptionKey;
    v66 = +[NSString stringWithUTF8String:"Stack Error"];
    v173 = v66;
    id v72 = &v173;
    id v73 = &v172;
    goto LABEL_95;
  }
  v84 = [(_NFContactlessSession *)self secureElementWrapper];
  id v85 = sub_1002457D4(v84);

  if ([(_NFContactlessSession *)self plasticCardMode])
  {
    v86 = [(_NFContactlessSession *)self secureElementWrapper];
    sub_100251A48(v86, 1, v6);
    v87 = (NFApplet *)objc_claimAutoreleasedReturnValue();

    if (v87)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v88 = NFLogGetLogger();
      if (v88)
      {
        v89 = (void (*)(uint64_t, const char *, ...))v88;
        v90 = object_getClass(self);
        BOOL v91 = class_isMetaClass(v90);
        v148 = object_getClassName(self);
        v154 = sel_getName(a2);
        uint64_t v92 = 45;
        if (v91) {
          uint64_t v92 = 43;
        }
        v89(3, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", v92, v148, v154, 454, v87);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v93 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        v94 = object_getClass(self);
        if (class_isMetaClass(v94)) {
          int v95 = 43;
        }
        else {
          int v95 = 45;
        }
        v96 = object_getClassName(self);
        BOOL v97 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v161 = v95;
        __int16 v162 = 2082;
        v163 = v96;
        __int16 v164 = 2082;
        v165 = v97;
        __int16 v166 = 1024;
        int v167 = 454;
        __int16 v168 = 2114;
        v169 = v87;
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", buf, 0x2Cu);
      }
    }
  }
  v98 = [(_NFContactlessSession *)self secureElementWrapper];
  sub_1002440F8(v98, v6);
  BOOL v46 = (NFApplet *)objc_claimAutoreleasedReturnValue();

  if (!v46)
  {
    objc_storeStrong((id *)&self->_activeApplet, a3);
    v143 = [(_NFContactlessSession *)self _getRelatedGroupMembersForActiveApplet];
    v144 = self->_activeGroupMembers;
    self->_activeGroupMembers = v143;

    goto LABEL_58;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v99 = NFLogGetLogger();
  if (v99)
  {
    v100 = (void (*)(uint64_t, const char *, ...))v99;
    v101 = object_getClass(self);
    BOOL v102 = class_isMetaClass(v101);
    v103 = object_getClassName(self);
    v155 = sel_getName(a2);
    uint64_t v104 = 45;
    if (v102) {
      uint64_t v104 = 43;
    }
    v100(3, "%c[%{public}s %{public}s]:%i Activation failed: %{public}@ : %{public}@", v104, v103, v155, 461, v6, v46);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v105 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
  {
    v106 = object_getClass(self);
    if (class_isMetaClass(v106)) {
      int v107 = 43;
    }
    else {
      int v107 = 45;
    }
    v108 = object_getClassName(self);
    __int16 v109 = sel_getName(a2);
    *(_DWORD *)buf = 67110402;
    int v161 = v107;
    __int16 v162 = 2082;
    v163 = v108;
    __int16 v164 = 2082;
    v165 = v109;
    __int16 v166 = 1024;
    int v167 = 461;
    __int16 v168 = 2114;
    v169 = v6;
    __int16 v170 = 2114;
    v171 = v46;
    _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Activation failed: %{public}@ : %{public}@", buf, 0x36u);
  }

  int v110 = [(NFApplet *)v6 identifier];
  __int16 v111 = [(NFApplet *)v6 packageIdentifier];
  id v112 = [(NFApplet *)v6 moduleIdentifier];
  v113 = +[NSString stringWithFormat:@"Unable to activate applet with AID: %@, PID: %@, MID: %@. Error: %@", v110, v111, v112, v46];

  v158[0] = @"Applet Identifier";
  v114 = [(NFApplet *)v6 identifier];
  v159[0] = v114;
  v159[1] = @"Other Bug";
  v158[1] = @"Classification";
  v158[2] = @"FailureKey";
  v159[2] = @"ttrTransaction";
  v115 = +[NSDictionary dictionaryWithObjects:v159 forKeys:v158 count:3];
  sub_100198F4C((uint64_t)NFBugCapture, @"Failed to activate applet", v113, v115);

LABEL_97:

  return v46;
}

- (id)setActiveApplets:(id)a3
{
  BOOL v5 = (NFApplet *)a3;
  id v6 = [(_NFSession *)self expressModeManager];

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  uint64_t v8 = (void (*)(uint64_t, const char *, ...))Logger;
  if (!v6)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v60 = 45;
      if (isMetaClass) {
        uint64_t v60 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i EMM is nil", v60, ClassName, Name, 492);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v61 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      BOOL v62 = object_getClass(self);
      if (class_isMetaClass(v62)) {
        int v63 = 43;
      }
      else {
        int v63 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v190 = v63;
      __int16 v191 = 2082;
      v192 = object_getClassName(self);
      __int16 v193 = 2082;
      v194 = sel_getName(a2);
      __int16 v195 = 1024;
      int v196 = 492;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i EMM is nil", buf, 0x22u);
    }

    id v64 = objc_alloc((Class)NSError);
    int v15 = +[NSString stringWithUTF8String:"nfcd"];
    v207[0] = NSLocalizedDescriptionKey;
    uint64_t v16 = +[NSString stringWithUTF8String:"Invalid State"];
    v208[0] = v16;
    v208[1] = &off_10031B280;
    v207[1] = @"Line";
    v207[2] = @"Method";
    id v65 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v208[2] = v65;
    v207[3] = NSDebugDescriptionErrorKey;
    id v66 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 493];
    v208[3] = v66;
    int v67 = +[NSDictionary dictionaryWithObjects:v208 forKeys:v207 count:4];
    v68 = v64;
    v69 = v15;
    uint64_t v70 = 12;
    goto LABEL_67;
  }
  if (Logger)
  {
    unint64_t v9 = object_getClass(self);
    BOOL v10 = class_isMetaClass(v9);
    __int16 v168 = object_getClassName(self);
    NSErrorUserInfoKey v174 = sel_getName(a2);
    uint64_t v11 = 45;
    if (v10) {
      uint64_t v11 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@", v11, v168, v174, 495, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v190 = v14;
    __int16 v191 = 2082;
    v192 = object_getClassName(self);
    __int16 v193 = 2082;
    v194 = sel_getName(a2);
    __int16 v195 = 1024;
    int v196 = 495;
    __int16 v197 = 2114;
    v198 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  if ([(NFApplet *)v5 count] != (id)2)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v71 = NFLogGetLogger();
    if (v71)
    {
      id v72 = (void (*)(uint64_t, const char *, ...))v71;
      id v73 = object_getClass(self);
      BOOL v74 = class_isMetaClass(v73);
      __int16 v170 = object_getClassName(self);
      v177 = sel_getName(a2);
      uint64_t v75 = 45;
      if (v74) {
        uint64_t v75 = 43;
      }
      v72(3, "%c[%{public}s %{public}s]:%i Invalid number of applets %{public}@", v75, v170, v177, 498, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v76 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      BOOL v77 = object_getClass(self);
      if (class_isMetaClass(v77)) {
        int v78 = 43;
      }
      else {
        int v78 = 45;
      }
      v79 = object_getClassName(self);
      uint64_t v80 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v190 = v78;
      __int16 v191 = 2082;
      v192 = v79;
      __int16 v193 = 2082;
      v194 = v80;
      __int16 v195 = 1024;
      int v196 = 498;
      __int16 v197 = 2114;
      v198 = v5;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid number of applets %{public}@", buf, 0x2Cu);
    }

    id v81 = objc_alloc((Class)NSError);
    int v15 = +[NSString stringWithUTF8String:"nfcd"];
    v205[0] = NSLocalizedDescriptionKey;
    uint64_t v16 = +[NSString stringWithUTF8String:"Invalid Parameter"];
    v206[0] = v16;
    v206[1] = &off_10031B298;
    v205[1] = @"Line";
    v205[2] = @"Method";
    id v65 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v206[2] = v65;
    v205[3] = NSDebugDescriptionErrorKey;
    id v66 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 499];
    v206[3] = v66;
    int v67 = +[NSDictionary dictionaryWithObjects:v206 forKeys:v205 count:4];
    v68 = v81;
    v69 = v15;
    uint64_t v70 = 10;
LABEL_67:
    BOOL v46 = (NFApplet *)[v68 initWithDomain:v69 code:v70 userInfo:v67];

    goto LABEL_68;
  }
  int v15 = [(NFApplet *)v5 firstObject];
  uint64_t v16 = [(NFApplet *)v5 lastObject];
  if (!v15 || ![(NFApplet *)self->_activeApplet isEqualToApplet:v15])
  {
    if (self->_activeApplet)
    {
      -[_NFContactlessSession switchToSecureElementWrapperForApplet:](self, "switchToSecureElementWrapperForApplet:");
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v17 = NFLogGetLogger();
      if (v17)
      {
        uint64_t v18 = (void (*)(uint64_t, const char *, ...))v17;
        BOOL v19 = object_getClass(self);
        BOOL v20 = class_isMetaClass(v19);
        uint64_t v21 = object_getClassName(self);
        uint64_t v22 = sel_getName(a2);
        uint64_t v23 = 45;
        if (v20) {
          uint64_t v23 = 43;
        }
        v18(6, "%c[%{public}s %{public}s]:%i Deselecting current active applet: %{public}@", v23, v21, v22, 510, self->_activeApplet);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v24 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = object_getClass(self);
        if (class_isMetaClass(v25)) {
          int v26 = 43;
        }
        else {
          int v26 = 45;
        }
        id v27 = object_getClassName(self);
        __int16 v28 = sel_getName(a2);
        activeApplet = self->_activeApplet;
        *(_DWORD *)buf = 67110146;
        int v190 = v26;
        __int16 v191 = 2082;
        v192 = v27;
        __int16 v193 = 2082;
        v194 = v28;
        __int16 v195 = 1024;
        int v196 = 510;
        __int16 v197 = 2114;
        v198 = activeApplet;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Deselecting current active applet: %{public}@", buf, 0x2Cu);
      }

      if (![(_NFContactlessSession *)self startWiredMode])
      {
        id v83 = objc_alloc((Class)NSError);
        v84 = +[NSString stringWithUTF8String:"nfcd"];
        v203[0] = NSLocalizedDescriptionKey;
        id v85 = +[NSString stringWithUTF8String:"Stack Error"];
        v204[0] = v85;
        v204[1] = &off_10031B2B0;
        v203[1] = @"Line";
        v203[2] = @"Method";
        id v86 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v204[2] = v86;
        v203[3] = NSDebugDescriptionErrorKey;
        id v87 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 513];
        v204[3] = v87;
        uint64_t v88 = v204;
        v89 = v203;
LABEL_124:
        v149 = +[NSDictionary dictionaryWithObjects:v88 forKeys:v89 count:4];
        BOOL v46 = (NFApplet *)[v83 initWithDomain:v84 code:15 userInfo:v149];

        goto LABEL_68;
      }
      v186 = v16;
      if (self->_activeKeyIdentifiers)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v30 = NFLogGetLogger();
        if (v30)
        {
          id v31 = (void (*)(uint64_t, const char *, ...))v30;
          BOOL v32 = object_getClass(self);
          BOOL v33 = class_isMetaClass(v32);
          v182 = object_getClassName(self);
          __int16 v34 = sel_getName(a2);
          id v35 = [(NFApplet *)self->_activeApplet identifier];
          uint64_t v36 = 45;
          if (v33) {
            uint64_t v36 = 43;
          }
          v31(6, "%c[%{public}s %{public}s]:%i Resetting volatile config on: %{public}@", v36, v182, v34, 517, v35);

          uint64_t v16 = v186;
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v37 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v38 = object_getClass(self);
          if (class_isMetaClass(v38)) {
            int v39 = 43;
          }
          else {
            int v39 = 45;
          }
          int v183 = v39;
          int v40 = object_getClassName(self);
          int v41 = sel_getName(a2);
          NSErrorUserInfoKey v42 = [(NFApplet *)self->_activeApplet identifier];
          *(_DWORD *)buf = 67110146;
          int v190 = v183;
          __int16 v191 = 2082;
          v192 = v40;
          __int16 v193 = 2082;
          v194 = v41;
          __int16 v195 = 1024;
          int v196 = 517;
          __int16 v197 = 2114;
          v198 = v42;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resetting volatile config on: %{public}@", buf, 0x2Cu);

          uint64_t v16 = v186;
        }

        uint64_t v43 = [(_NFContactlessSession *)self secureElementWrapper];
        id v44 = sub_10024E7B8(v43, self->_activeApplet);
      }
      int v45 = [(_NFContactlessSession *)self secureElementWrapper];
      sub_1002457D4(v45);
      BOOL v46 = (NFApplet *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v47 = NFLogGetLogger();
        if (v47)
        {
          uint64_t v48 = (void (*)(uint64_t, const char *, ...))v47;
          id v49 = object_getClass(self);
          BOOL v50 = class_isMetaClass(v49);
          v169 = object_getClassName(self);
          v175 = sel_getName(a2);
          uint64_t v51 = 45;
          if (v50) {
            uint64_t v51 = 43;
          }
          v48(3, "%c[%{public}s %{public}s]:%i deactivateAll failed: %{public}@", v51, v169, v175, 524, v46);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v52 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          unint64_t v53 = object_getClass(self);
          if (class_isMetaClass(v53)) {
            int v54 = 43;
          }
          else {
            int v54 = 45;
          }
          unint64_t v55 = object_getClassName(self);
          id v56 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v190 = v54;
          __int16 v191 = 2082;
          v192 = v55;
          __int16 v193 = 2082;
          v194 = v56;
          __int16 v195 = 1024;
          int v196 = 524;
          __int16 v197 = 2114;
          v198 = v46;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i deactivateAll failed: %{public}@", buf, 0x2Cu);
        }

        uint64_t v16 = v186;
        goto LABEL_68;
      }
      if ([(_NFContactlessSession *)self plasticCardMode])
      {
        v137 = [(_NFContactlessSession *)self secureElementWrapper];
        sub_100251A48(v137, 0, self->_activeApplet);
        v138 = (NFApplet *)objc_claimAutoreleasedReturnValue();

        if (v138)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v139 = NFLogGetLogger();
          if (v139)
          {
            v140 = (void (*)(uint64_t, const char *, ...))v139;
            v141 = object_getClass(self);
            BOOL v142 = class_isMetaClass(v141);
            v173 = object_getClassName(self);
            v180 = sel_getName(a2);
            uint64_t v143 = 45;
            if (v142) {
              uint64_t v143 = 43;
            }
            uint64_t v16 = v186;
            v140(3, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", v143, v173, v180, 531, v138);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v144 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
          {
            v145 = object_getClass(self);
            if (class_isMetaClass(v145)) {
              int v146 = 43;
            }
            else {
              int v146 = 45;
            }
            v147 = object_getClassName(self);
            v148 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v190 = v146;
            uint64_t v16 = v186;
            __int16 v191 = 2082;
            v192 = v147;
            __int16 v193 = 2082;
            v194 = v148;
            __int16 v195 = 1024;
            int v196 = 531;
            __int16 v197 = 2114;
            v198 = v138;
            _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", buf, 0x2Cu);
          }
        }
      }
      else
      {
        v138 = 0;
      }
      v150 = self->_activeApplet;
      self->_activeApplet = 0;

      activeSecondaryApplet = self->_activeSecondaryApplet;
      self->_activeSecondaryApplet = 0;

      activeGroupMembers = self->_activeGroupMembers;
      self->_activeGroupMembers = 0;

      if (!v15) {
        goto LABEL_127;
      }
    }
    else
    {
      -[_NFContactlessSession switchToSecureElementWrapperForApplet:](self, "switchToSecureElementWrapperForApplet:");
      if (!v15)
      {
LABEL_127:
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v153 = NFLogGetLogger();
        if (v153)
        {
          v154 = (void (*)(uint64_t, const char *, ...))v153;
          v155 = object_getClass(self);
          BOOL v156 = class_isMetaClass(v155);
          v157 = object_getClassName(self);
          v181 = sel_getName(a2);
          uint64_t v158 = 45;
          if (v156) {
            uint64_t v158 = 43;
          }
          v154(6, "%c[%{public}s %{public}s]:%i Removing express mode aid restriction", v158, v157, v181, 543);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v159 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
        {
          v160 = object_getClass(self);
          if (class_isMetaClass(v160)) {
            int v161 = 43;
          }
          else {
            int v161 = 45;
          }
          __int16 v162 = object_getClassName(self);
          v163 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v190 = v161;
          __int16 v191 = 2082;
          v192 = v162;
          __int16 v193 = 2082;
          v194 = v163;
          __int16 v195 = 1024;
          int v196 = 543;
          _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Removing express mode aid restriction", buf, 0x22u);
        }

        __int16 v164 = [(_NFSession *)self expressModeManager];
        sub_10004BB60((uint64_t)v164, 0);

        if (!v5) {
          goto LABEL_137;
        }
        goto LABEL_73;
      }
    }
  }
  if (!v5)
  {
LABEL_137:
    BOOL v46 = 0;
    self->_activeAppletEmulationType = 0;
    goto LABEL_68;
  }
LABEL_73:
  if (self->_activeApplet)
  {
LABEL_74:
    BOOL v46 = 0;
    self->_activeAppletEmulationType = -[_NFContactlessSession _getActiveAppletEmulationType:](self, "_getActiveAppletEmulationType:");
    goto LABEL_68;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v90 = NFLogGetLogger();
  if (v90)
  {
    BOOL v91 = (void (*)(uint64_t, const char *, ...))v90;
    uint64_t v92 = object_getClass(self);
    BOOL v93 = class_isMetaClass(v92);
    v171 = object_getClassName(self);
    v178 = sel_getName(a2);
    uint64_t v94 = 45;
    if (v93) {
      uint64_t v94 = 43;
    }
    v91(6, "%c[%{public}s %{public}s]:%i Activating %{public}@", v94, v171, v178, 549, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v95 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    v96 = object_getClass(self);
    if (class_isMetaClass(v96)) {
      int v97 = 43;
    }
    else {
      int v97 = 45;
    }
    v98 = object_getClassName(self);
    uint64_t v99 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v190 = v97;
    __int16 v191 = 2082;
    v192 = v98;
    __int16 v193 = 2082;
    v194 = v99;
    __int16 v195 = 1024;
    int v196 = 549;
    __int16 v197 = 2114;
    v198 = v5;
    _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Activating %{public}@", buf, 0x2Cu);
  }

  [(_NFContactlessSession *)self switchToSecureElementWrapperForApplet:v15];
  if (![(_NFContactlessSession *)self startWiredMode])
  {
    id v83 = objc_alloc((Class)NSError);
    v84 = +[NSString stringWithUTF8String:"nfcd"];
    v201[0] = NSLocalizedDescriptionKey;
    id v85 = +[NSString stringWithUTF8String:"Stack Error"];
    v202[0] = v85;
    v202[1] = &off_10031B2C8;
    v201[1] = @"Line";
    v201[2] = @"Method";
    id v86 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v202[2] = v86;
    v201[3] = NSDebugDescriptionErrorKey;
    id v87 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 555];
    v202[3] = v87;
    uint64_t v88 = v202;
    v89 = v201;
    goto LABEL_124;
  }
  v100 = [(_NFContactlessSession *)self secureElementWrapper];
  id v101 = sub_1002457D4(v100);

  if ([(_NFContactlessSession *)self plasticCardMode])
  {
    BOOL v102 = [(_NFContactlessSession *)self secureElementWrapper];
    sub_100251A48(v102, 1, v15);
    v103 = (NFApplet *)objc_claimAutoreleasedReturnValue();

    if (v103)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v104 = NFLogGetLogger();
      if (v104)
      {
        __int16 v105 = (void (*)(uint64_t, const char *, ...))v104;
        v106 = object_getClass(self);
        int v107 = v16;
        BOOL v108 = class_isMetaClass(v106);
        v184 = object_getClassName(self);
        __int16 v109 = sel_getName(a2);
        BOOL v110 = !v108;
        uint64_t v16 = v107;
        uint64_t v111 = 45;
        if (!v110) {
          uint64_t v111 = 43;
        }
        v105(3, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", v111, v184, v109, 563, v103);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v112 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
      {
        v113 = object_getClass(self);
        if (class_isMetaClass(v113)) {
          int v114 = 43;
        }
        else {
          int v114 = 45;
        }
        int v185 = v114;
        v115 = v16;
        v116 = object_getClassName(self);
        v117 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v190 = v185;
        __int16 v191 = 2082;
        v192 = v116;
        uint64_t v16 = v115;
        __int16 v193 = 2082;
        v194 = v117;
        __int16 v195 = 1024;
        int v196 = 563;
        __int16 v197 = 2114;
        v198 = v103;
        _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", buf, 0x2Cu);
      }
    }
  }
  v118 = [(_NFContactlessSession *)self secureElementWrapper];
  sub_10024461C(v118, v5);
  BOOL v46 = (NFApplet *)objc_claimAutoreleasedReturnValue();

  if (!v46)
  {
    objc_storeStrong((id *)&self->_activeApplet, v15);
    objc_storeStrong((id *)&self->_activeSecondaryApplet, v16);
    v165 = [(_NFContactlessSession *)self _getRelatedGroupMembersForActiveApplet];
    __int16 v166 = self->_activeGroupMembers;
    self->_activeGroupMembers = v165;

    goto LABEL_74;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v119 = NFLogGetLogger();
  if (v119)
  {
    v120 = (void (*)(uint64_t, const char *, ...))v119;
    v121 = object_getClass(self);
    BOOL v122 = class_isMetaClass(v121);
    uint64_t v123 = v16;
    v124 = object_getClassName(self);
    v179 = sel_getName(a2);
    uint64_t v125 = 45;
    if (v122) {
      uint64_t v125 = 43;
    }
    NSErrorUserInfoKey v172 = v124;
    uint64_t v16 = v123;
    v120(3, "%c[%{public}s %{public}s]:%i Activation failed: %{public}@ : %{public}@", v125, v172, v179, 570, v5, v46);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v126 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
  {
    v127 = object_getClass(self);
    if (class_isMetaClass(v127)) {
      int v128 = 43;
    }
    else {
      int v128 = 45;
    }
    v129 = object_getClassName(self);
    v130 = sel_getName(a2);
    *(_DWORD *)buf = 67110402;
    int v190 = v128;
    __int16 v191 = 2082;
    v192 = v129;
    __int16 v193 = 2082;
    v194 = v130;
    __int16 v195 = 1024;
    int v196 = 570;
    __int16 v197 = 2114;
    v198 = v5;
    __int16 v199 = 2114;
    v200 = v46;
    _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Activation failed: %{public}@ : %{public}@", buf, 0x36u);
  }

  uint64_t v131 = [v15 identifier];
  v132 = [v15 packageIdentifier];
  v133 = [v15 moduleIdentifier];
  BOOL v134 = +[NSString stringWithFormat:@"Unable to activate applet with AID: %@, PID: %@, MID: %@. Error: %@", v131, v132, v133, v46];

  v187[0] = @"Applet Identifier";
  v135 = [v15 identifier];
  if (v135)
  {
    uint64_t v136 = [v15 identifier];
  }
  else
  {
    uint64_t v136 = @"NULL";
  }
  v188[0] = v136;
  v188[1] = @"Other Bug";
  v187[1] = @"Classification";
  v187[2] = @"FailureKey";
  v188[2] = @"ttrTransaction";
  int v167 = +[NSDictionary dictionaryWithObjects:v188 forKeys:v187 count:3];
  sub_100198F4C((uint64_t)NFBugCapture, @"Failed to activate applet", v134, v167);

  if (v135) {
LABEL_68:
  }

  return v46;
}

- (id)preloadApplets
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(_NFContactlessSession *)v2 secureElementWrapper];
  uint64_t v111 = v3;
  int v78 = +[NSArray arrayWithObjects:&v111 count:1];

  BOOL v4 = [(_NFSession *)v2 expressModeManager];
  LODWORD(v3) = v4 == 0;

  if (v3)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v2);
      if (class_isMetaClass(Class)) {
        uint64_t v10 = 43;
      }
      else {
        uint64_t v10 = 45;
      }
      ClassName = object_getClassName(v2);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i EMM is nil!", v10, ClassName, Name, 608);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = object_getClass(v2);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v104 = v15;
      __int16 v105 = 2082;
      v106 = object_getClassName(v2);
      __int16 v107 = 2082;
      BOOL v108 = sel_getName(a2);
      __int16 v109 = 1024;
      int v110 = 608;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i EMM is nil!", buf, 0x22u);
    }

    id v16 = objc_alloc((Class)NSError);
    id v82 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v101 = NSLocalizedDescriptionKey;
    id obj = +[NSString stringWithUTF8String:"Invalid State"];
    id v102 = obj;
    id v17 = +[NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    id v7 = [v16 initWithDomain:v82 code:12 userInfo:v17];
LABEL_92:

    goto LABEL_93;
  }
  if (!v2->_appletMap)
  {
    BOOL v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    appletMap = v2->_appletMap;
    v2->_appletMap = v5;
  }
  if (v2->_applets)
  {
    id v7 = 0;
    goto LABEL_94;
  }
  [(NSMutableDictionary *)v2->_appletMap removeAllObjects];
  id v82 = (id)objc_opt_new();
  uint64_t v18 = [(_NFSession *)v2 expressModeManager];
  sub_1000471A0((uint64_t)v18, 1);

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = v78;
  id v80 = [obj countByEnumeratingWithState:&v91 objects:v100 count:16];
  if (!v80) {
    goto LABEL_45;
  }
  uint64_t v79 = *(void *)v92;
  while (2)
  {
    for (i = 0; i != v80; i = (char *)i + 1)
    {
      if (*(void *)v92 != v79) {
        objc_enumerationMutation(obj);
      }
      BOOL v19 = *(void **)(*((void *)&v91 + 1) + 8 * i);
      [(_NFContactlessSession *)v2 _setActiveSecureElementWrapper:v19];
      BOOL v20 = sub_1002431DC(v19);
      if (v20 && (unsigned int v21 = [(_NFContactlessSession *)v2 useFilteredApplets], v20, v21))
      {
        sub_1002431DC(v19);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        int v83 = 1;
        if (v17) {
          goto LABEL_33;
        }
      }
      else
      {
        if (![(_NFContactlessSession *)v2 startWiredMode])
        {
          id v35 = [(_NFSession *)v2 expressModeManager];
          if (v35)
          {
            uint64_t v36 = v35[2];
            if (v36) {
              *(unsigned char *)(v36 + 220) = 0;
            }
          }

          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v37)
          {
            __int16 v38 = object_getClass(v2);
            if (class_isMetaClass(v38)) {
              uint64_t v39 = 43;
            }
            else {
              uint64_t v39 = 45;
            }
            int v40 = object_getClassName(v2);
            int v41 = sel_getName(a2);
            v37(3, "%c[%{public}s %{public}s]:%i Failed to start wired mode for eSE", v39, v40, v41, 639);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          NSErrorUserInfoKey v42 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            uint64_t v43 = object_getClass(v2);
            if (class_isMetaClass(v43)) {
              int v44 = 43;
            }
            else {
              int v44 = 45;
            }
            int v45 = object_getClassName(v2);
            BOOL v46 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v104 = v44;
            __int16 v105 = 2082;
            v106 = v45;
            __int16 v107 = 2082;
            BOOL v108 = v46;
            __int16 v109 = 1024;
            int v110 = 639;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start wired mode for eSE", buf, 0x22u);
          }

          id v47 = objc_alloc((Class)NSError);
          id v17 = +[NSString stringWithUTF8String:"nfcd"];
          NSErrorUserInfoKey v98 = NSLocalizedDescriptionKey;
          uint64_t v48 = +[NSString stringWithUTF8String:"Stack Error"];
          uint64_t v99 = v48;
          id v49 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
          id v7 = [v47 initWithDomain:v17 code:15 userInfo:v49];
          goto LABEL_77;
        }
        if ([(_NFContactlessSession *)v2 useFilteredApplets])
        {
          uint64_t v22 = [(_NFContactlessSession *)v2 secureElementWrapper];
          uint64_t v90 = 0;
          uint64_t v23 = (id *)&v90;
          sub_100243D60(v22, &v90);
        }
        else
        {
          uint64_t v22 = [(_NFContactlessSession *)v2 secureElementWrapper];
          uint64_t v89 = 0;
          uint64_t v23 = (id *)&v89;
          sub_100246F2C(v22, &v89);
        }
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        id v17 = *v23;

        if (v7 && [v7 code] != (id)24)
        {
          id v64 = [(_NFSession *)v2 expressModeManager];
          if (v64)
          {
            uint64_t v65 = v64[2];
            if (v65) {
              *(unsigned char *)(v65 + 220) = 0;
            }
          }

          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v66 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v66)
          {
            int v67 = object_getClass(v2);
            if (class_isMetaClass(v67)) {
              uint64_t v68 = 43;
            }
            else {
              uint64_t v68 = 45;
            }
            v69 = object_getClassName(v2);
            uint64_t v70 = sel_getName(a2);
            v66(3, "%c[%{public}s %{public}s]:%i Failed to get applets from eSE", v68, v69, v70, 655);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v71 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            id v72 = object_getClass(v2);
            if (class_isMetaClass(v72)) {
              int v73 = 43;
            }
            else {
              int v73 = 45;
            }
            BOOL v74 = object_getClassName(v2);
            uint64_t v75 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v104 = v73;
            __int16 v105 = 2082;
            v106 = v74;
            __int16 v107 = 2082;
            BOOL v108 = v75;
            __int16 v109 = 1024;
            int v110 = 655;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get applets from eSE", buf, 0x22u);
          }

          [(_NFContactlessSession *)v2 startDefaultMode];
          goto LABEL_92;
        }

        int v83 = 0;
        if (v17) {
LABEL_33:
        }
          [v82 addObjectsFromArray:v17];
      }
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v17 = v17;
      id v24 = [v17 countByEnumeratingWithState:&v85 objects:v97 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v86;
        do
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v86 != v25) {
              objc_enumerationMutation(v17);
            }
            id v27 = *(void **)(*((void *)&v85 + 1) + 8 * (void)j);
            __int16 v28 = v2->_appletMap;
            uint64_t v29 = [v19 serialNumber];
            uint64_t v30 = [v27 identifier];
            [(NSMutableDictionary *)v28 setObject:v29 forKey:v30];
          }
          id v24 = [v17 countByEnumeratingWithState:&v85 objects:v97 count:16];
        }
        while (v24);
      }

      if (v83 && ![(_NFContactlessSession *)v2 startWiredMode])
      {
        BOOL v50 = [(_NFSession *)v2 expressModeManager];
        if (v50)
        {
          uint64_t v51 = v50[2];
          if (v51) {
            *(unsigned char *)(v51 + 220) = 0;
          }
        }

        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v52 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v52)
        {
          unint64_t v53 = object_getClass(v2);
          if (class_isMetaClass(v53)) {
            uint64_t v54 = 43;
          }
          else {
            uint64_t v54 = 45;
          }
          unint64_t v55 = object_getClassName(v2);
          id v56 = sel_getName(a2);
          v52(3, "%c[%{public}s %{public}s]:%i Failed to start wired mode for eSE", v54, v55, v56, 676);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v57 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          __int16 v58 = object_getClass(v2);
          if (class_isMetaClass(v58)) {
            int v59 = 43;
          }
          else {
            int v59 = 45;
          }
          uint64_t v60 = object_getClassName(v2);
          v61 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v104 = v59;
          __int16 v105 = 2082;
          v106 = v60;
          __int16 v107 = 2082;
          BOOL v108 = v61;
          __int16 v109 = 1024;
          int v110 = 676;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start wired mode for eSE", buf, 0x22u);
        }

        id v62 = objc_alloc((Class)NSError);
        uint64_t v48 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v95 = NSLocalizedDescriptionKey;
        id v49 = +[NSString stringWithUTF8String:"Stack Error"];
        v96 = v49;
        int v63 = +[NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
        id v7 = [v62 initWithDomain:v48 code:15 userInfo:v63];

LABEL_77:
        goto LABEL_92;
      }
      id v31 = [(_NFContactlessSession *)v2 secureElementWrapper];
      id v32 = sub_1002457D4(v31);
    }
    id v80 = [obj countByEnumeratingWithState:&v91 objects:v100 count:16];
    if (v80) {
      continue;
    }
    break;
  }
LABEL_45:

  BOOL v33 = [(_NFSession *)v2 expressModeManager];
  if (v33)
  {
    uint64_t v34 = v33[2];
    if (v34) {
      *(unsigned char *)(v34 + 220) = 0;
    }
  }

  objc_storeStrong((id *)&v2->_applets, v82);
  [(_NFContactlessSession *)v2 startDefaultMode];
  id v7 = 0;
LABEL_93:

LABEL_94:
  objc_sync_exit(v2);

  return v7;
}

- (id)_getAppletsForAids:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  id v6 = [(_NFContactlessSession *)self secureElementWrapper];
  id v7 = sub_1002431DC(v6);

  if (v7)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = [(_NFContactlessSession *)self secureElementWrapper];
    unint64_t v9 = sub_1002431DC(v8);

    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          int v15 = [v14 identifier];
          unsigned int v16 = [v4 containsObject:v15];

          if (v16) {
            [v5 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
  }
  if ([v5 count]) {
    id v17 = v5;
  }
  else {
    id v17 = 0;
  }

  return v17;
}

- (id)_getRelatedGroupMembersForActiveApplet
{
  activeApplet = self->_activeApplet;
  if (!activeApplet) {
    goto LABEL_39;
  }
  BOOL v5 = [(NFApplet *)activeApplet multiSEGroupMemberIDs];

  id v6 = self->_activeApplet;
  if (v5)
  {
    uint64_t v7 = [(NFApplet *)v6 multiSEGroupMemberIDs];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      unint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(6, "%c[%{public}s %{public}s]:%i MultiSE group members found: %{public}@", v12, ClassName, Name, 719, v7);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v50 = v15;
      __int16 v51 = 2082;
      __int16 v52 = object_getClassName(self);
      __int16 v53 = 2082;
      uint64_t v54 = sel_getName(a2);
      __int16 v55 = 1024;
      int v56 = 719;
      __int16 v57 = 2114;
      uint64_t v58 = v7;
      unsigned int v16 = "%c[%{public}s %{public}s]:%i MultiSE group members found: %{public}@";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 0x2Cu);
    }
  }
  else
  {
    id v17 = [(NFApplet *)v6 groupMemberIDs];

    uint64_t v18 = self->_activeApplet;
    if (v17)
    {
      uint64_t v7 = [(NFApplet *)v18 groupMemberIDs];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v19 = NFLogGetLogger();
      if (v19)
      {
        long long v20 = (void (*)(uint64_t, const char *, ...))v19;
        long long v21 = object_getClass(self);
        BOOL v22 = class_isMetaClass(v21);
        uint64_t v43 = object_getClassName(self);
        BOOL v46 = sel_getName(a2);
        uint64_t v23 = 45;
        if (v22) {
          uint64_t v23 = 43;
        }
        v20(6, "%c[%{public}s %{public}s]:%i Group members found: %{public}@", v23, v43, v46, 723, v7);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = object_getClass(self);
        if (class_isMetaClass(v24)) {
          int v25 = 43;
        }
        else {
          int v25 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v50 = v25;
        __int16 v51 = 2082;
        __int16 v52 = object_getClassName(self);
        __int16 v53 = 2082;
        uint64_t v54 = sel_getName(a2);
        __int16 v55 = 1024;
        int v56 = 723;
        __int16 v57 = 2114;
        uint64_t v58 = v7;
        unsigned int v16 = "%c[%{public}s %{public}s]:%i Group members found: %{public}@";
        goto LABEL_22;
      }
    }
    else
    {
      id v27 = [(NFApplet *)v18 groupHeadID];

      if (!v27) {
        goto LABEL_39;
      }
      __int16 v28 = [(NFApplet *)self->_activeApplet groupHeadID];
      uint64_t v48 = v28;
      uint64_t v29 = +[NSArray arrayWithObjects:&v48 count:1];
      int v13 = [(_NFContactlessSession *)self _getAppletsForAids:v29];

      if (!v13 || [v13 count] != (id)1)
      {
        int v26 = 0;
        goto LABEL_25;
      }
      uint64_t v30 = [v13 objectAtIndex:0];
      uint64_t v7 = [v30 groupMemberIDs];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v31 = NFLogGetLogger();
      if (v31)
      {
        id v32 = (void (*)(uint64_t, const char *, ...))v31;
        BOOL v33 = object_getClass(self);
        BOOL v34 = class_isMetaClass(v33);
        int v44 = object_getClassName(self);
        id v47 = sel_getName(a2);
        uint64_t v35 = 45;
        if (v34) {
          uint64_t v35 = 43;
        }
        v32(6, "%c[%{public}s %{public}s]:%i Group members found: %{public}@", v35, v44, v47, 730, v7);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v36 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = object_getClass(self);
        if (class_isMetaClass(v37)) {
          int v38 = 43;
        }
        else {
          int v38 = 45;
        }
        uint64_t v39 = object_getClassName(self);
        int v40 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v50 = v38;
        __int16 v51 = 2082;
        __int16 v52 = v39;
        __int16 v53 = 2082;
        uint64_t v54 = v40;
        __int16 v55 = 1024;
        int v56 = 730;
        __int16 v57 = 2114;
        uint64_t v58 = v7;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Group members found: %{public}@", buf, 0x2Cu);
      }
    }
  }

  if (v7)
  {
    int v26 = [(_NFContactlessSession *)self _getAppletsForAids:v7];
    int v13 = v7;
LABEL_25:

    goto LABEL_40;
  }
LABEL_39:
  int v26 = 0;
LABEL_40:

  return v26;
}

- (int)_getActiveAppletEmulationType:(id)a3
{
  id v5 = a3;
  id v6 = [v5 identifierAsData];
  id v7 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283938 length:14];
  unsigned int v8 = [v6 isEqualToData:v7];

  if (v8)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v10(6, "%c[%{public}s %{public}s]:%i Enabling ABF for FTA", v14, ClassName, Name, 743);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v55 = v17;
      __int16 v56 = 2082;
      __int16 v57 = object_getClassName(self);
      __int16 v58 = 2082;
      int v59 = sel_getName(a2);
      __int16 v60 = 1024;
      int v61 = 743;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Enabling ABF for FTA", buf, 0x22u);
    }

    int v18 = 7;
  }
  else
  {
    unsigned int v19 = [v5 isTypeF];
    if ([v5 groupActivationStyle] == 1)
    {
      if (v19) {
        int v18 = 4;
      }
      else {
        int v18 = 3;
      }
    }
    else if ([v5 groupActivationStyle] {
           || ([v5 groupHeadID],
    }
               id v24 = objc_claimAutoreleasedReturnValue(),
               v24,
               !v24))
    {
      long long v20 = [v5 groupHeadID];
      if (v20)
      {
        long long v21 = [(_NFContactlessSession *)self secureElementWrapper];
        BOOL v22 = [v5 groupHeadID];
        sub_1002473C8(v21, v22);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v23 = v5;
      }

      BOOL v34 = [v23 groupMemberIDs];
      uint64_t v35 = v34;
      if (v34) {
        id v36 = v34;
      }
      else {
        id v36 = (id)objc_opt_new();
      }
      uint64_t v37 = v36;

      if (v23)
      {
        if ([v23 isTypeF]) {
          int v18 = 4;
        }
        else {
          int v18 = 3;
        }
      }
      else
      {
        int v18 = 0;
      }
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v38 = v37;
      id v39 = [v38 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v50;
        do
        {
          for (i = 0; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v50 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            int v44 = [(_NFContactlessSession *)self secureElementWrapper];
            int v45 = sub_1002473C8(v44, v43);

            if (v45)
            {
              if ([v45 isTypeF]) {
                v18 |= 4u;
              }
              else {
                v18 |= 3u;
              }
            }
          }
          id v40 = [v38 countByEnumeratingWithState:&v49 objects:v53 count:16];
        }
        while (v40);
      }
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v25 = NFLogGetLogger();
      if (v25)
      {
        int v26 = (void (*)(uint64_t, const char *, ...))v25;
        id v27 = object_getClass(self);
        BOOL v28 = class_isMetaClass(v27);
        uint64_t v29 = object_getClassName(self);
        uint64_t v48 = sel_getName(a2);
        uint64_t v30 = 45;
        if (v28) {
          uint64_t v30 = 43;
        }
        v26(4, "%c[%{public}s %{public}s]:%i Invalid GP group activation", v30, v29, v48, 754);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v31 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v32 = object_getClass(self);
        if (class_isMetaClass(v32)) {
          int v33 = 43;
        }
        else {
          int v33 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v55 = v33;
        __int16 v56 = 2082;
        __int16 v57 = object_getClassName(self);
        __int16 v58 = 2082;
        int v59 = sel_getName(a2);
        __int16 v60 = 1024;
        int v61 = 754;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid GP group activation", buf, 0x22u);
      }

      int v18 = 0;
    }
  }

  return v18;
}

- (BOOL)_configureEmulationType:(unint64_t)a3
{
  if (!a3)
  {
    unint64_t v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_NFContactlessSession.m" lineNumber:788 description:@"Invalid argument"];
  }
  id v5 = +[NFRoutingConfig routingOff];
  BOOL v6 = [(_NFContactlessSession *)self _configureEmulationType:a3 routingConfigWhenEmulationOff:v5];

  return v6;
}

- (BOOL)_configureEmulationType:(unint64_t)a3 routingConfigWhenEmulationOff:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    if (self->_emulationState)
    {
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v12 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        int v17 = [(_NFXPCSession *)self clientName];
        uint64_t v18 = 45;
        if (isMetaClass) {
          uint64_t v18 = 43;
        }
        v12(6, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: %@", v18, ClassName, Name, 802, v17);
      }
      unsigned int v19 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        long long v20 = object_getClass(self);
        if (class_isMetaClass(v20)) {
          int v21 = 43;
        }
        else {
          int v21 = 45;
        }
        BOOL v22 = object_getClassName(self);
        id v23 = sel_getName(a2);
        id v24 = [(_NFXPCSession *)self clientName];
        *(_DWORD *)buf = 67110146;
        int v67 = v21;
        __int16 v68 = 2082;
        v69 = v22;
        __int16 v70 = 2082;
        uint64_t v71 = v23;
        __int16 v72 = 1024;
        int v73 = 802;
        __int16 v74 = 2112;
        uint64_t v75 = v24;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: %@", buf, 0x2Cu);
      }
    }
    self->_emulationState = 0;
    uint64_t v25 = +[_NFHardwareManager sharedHardwareManager];
    int v26 = [v25 setRoutingConfig:v7];
    BOOL v27 = v26 == 0;

    goto LABEL_18;
  }
  if ((a3 & 8) != 0)
  {
    self->_emulationState = 8;
    uint64_t v25 = +[_NFHardwareManager sharedHardwareManager];
    BOOL v28 = +[NFRoutingConfig expressOnly];
    uint64_t v29 = [v25 setRoutingConfig:v28];
    BOOL v27 = v29 == 0;

LABEL_18:
    goto LABEL_58;
  }
  unint64_t v8 = self->_emulationState & 0xFFFFFFFFFFFFFFF7;
  self->_emulationState = v8;
  unint64_t v9 = v8 | a3;
  if ((v8 | a3) == 4)
  {
    uint64_t v10 = +[NFRoutingConfig hostCardEmulation];
  }
  else
  {
    unsigned int activeAppletEmulationType = self->_activeAppletEmulationType;
    if ((v9 & 4) != 0)
    {
      unsigned int v32 = [(NFApplet *)self->_activeApplet supportedTypeFSystem];
      if (v32 == 2) {
        activeAppletEmulationType |= 4u;
      }
      else {
        activeAppletEmulationType |= 3u;
      }
      uint64_t v31 = v32 != 2;
    }
    else
    {
      uint64_t v31 = 0;
    }
    if ([(NFApplet *)self->_activeApplet suppressTypeB])
    {
      activeAppletEmulationType &= ~2u;
    }
    else if ([(NFApplet *)self->_activeApplet groupActivationStyle] == 2)
    {
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      int v33 = [(NFApplet *)self->_activeApplet groupMemberIDs];
      BOOL v34 = [(_NFContactlessSession *)self _getAppletsForAids:v33];

      id v35 = [v34 countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (v35)
      {
        id v36 = v35;
        unsigned int v56 = v31;
        unint64_t v58 = v9;
        uint64_t v37 = *(void *)v62;
        while (2)
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            if (*(void *)v62 != v37) {
              objc_enumerationMutation(v34);
            }
            if ([*(id *)(*((void *)&v61 + 1) + 8 * i) suppressTypeB])
            {
              activeAppletEmulationType &= ~2u;
              goto LABEL_38;
            }
          }
          id v36 = [v34 countByEnumeratingWithState:&v61 objects:v65 count:16];
          if (v36) {
            continue;
          }
          break;
        }
LABEL_38:
        unint64_t v9 = v58;
        uint64_t v31 = v56;
      }
    }
    if ([(NFApplet *)self->_activeApplet suppressTypeA]) {
      uint64_t v39 = activeAppletEmulationType & 0xFFFFFFFE;
    }
    else {
      uint64_t v39 = activeAppletEmulationType;
    }
    uint64_t v10 = +[NFRoutingConfig embeddedCardEmulationWithHCE:v31 emulationType:v39];
  }
  id v40 = (void *)v10;
  uint64_t v41 = +[_NFHardwareManager sharedHardwareManager];
  NSErrorUserInfoKey v42 = [v41 setRoutingConfig:v40];
  BOOL v27 = v42 == 0;

  if (!v42)
  {
    if (!self->_emulationState)
    {
      uint64_t v43 = NFLogGetLogger();
      if (v43)
      {
        int v44 = (void (*)(uint64_t, const char *, ...))v43;
        int v45 = object_getClass(self);
        BOOL v57 = class_isMetaClass(v45);
        int v59 = object_getClassName(self);
        BOOL v46 = sel_getName(a2);
        id v47 = [(_NFXPCSession *)self clientName];
        uint64_t v48 = 45;
        if (v57) {
          uint64_t v48 = 43;
        }
        v44(6, "%c[%{public}s %{public}s]:%i NFC emulation mode activated: %@", v48, v59, v46, 857, v47);
      }
      long long v49 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        long long v50 = object_getClass(self);
        unint64_t v60 = v9;
        if (class_isMetaClass(v50)) {
          int v51 = 43;
        }
        else {
          int v51 = 45;
        }
        long long v52 = object_getClassName(self);
        __int16 v53 = sel_getName(a2);
        uint64_t v54 = [(_NFXPCSession *)self clientName];
        *(_DWORD *)buf = 67110146;
        int v67 = v51;
        unint64_t v9 = v60;
        __int16 v68 = 2082;
        v69 = v52;
        __int16 v70 = 2082;
        uint64_t v71 = v53;
        __int16 v72 = 1024;
        int v73 = 857;
        __int16 v74 = 2112;
        uint64_t v75 = v54;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode activated: %@", buf, 0x2Cu);
      }
    }
    self->_emulationState = v9;
  }

LABEL_58:
  return v27;
}

- (void)getAppletsWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFContactlessSession;
  BOOL v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D02A8;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)setActiveApplet:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFContactlessSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D06D0;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)startCardEmulationWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFContactlessSession;
  BOOL v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D0BF0;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)stopCardEmulationWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFContactlessSession;
  BOOL v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D12B0;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (BOOL)startWiredMode
{
  v3 = +[NFRoutingConfig embeddedWiredModeWithFD:0];
  LOBYTE(self) = [(_NFContactlessSession *)self _configureEmulationType:0 routingConfigWhenEmulationOff:v3];

  return (char)self;
}

- (BOOL)_startFieldDetectAndKeepSEOn:(BOOL)a3
{
  if (a3) {
    +[NFRoutingConfig embeddedWiredModeWithFD:1];
  }
  else {
  id v4 = +[NFRoutingConfig routingOffWithFD:1];
  }
  BOOL v5 = [(_NFContactlessSession *)self _configureEmulationType:0 routingConfigWhenEmulationOff:v4];

  return v5;
}

- (BOOL)startFieldDetectMode
{
  return [(_NFContactlessSession *)self _startFieldDetectAndKeepSEOn:0];
}

- (BOOL)startDefaultModeAndKeepSEOn:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v6 = [(_NFSession *)self expressModeManager];

  if (v6)
  {
    activeApplet = self->_activeApplet;
    if (activeApplet)
    {
      id v8 = activeApplet;
    }
    else
    {
      id v8 = [(_NFContactlessSession *)self deferredActivationApplet];
    }
    p_super = &v8->super;
    if ([(_NFContactlessSession *)self canEnableExpress])
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        long long v20 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v25 = 45;
        if (isMetaClass) {
          uint64_t v25 = 43;
        }
        v20(6, "%c[%{public}s %{public}s]:%i in session express for aid:%{public}@ kids:%{public}@", v25, ClassName, Name, 974, p_super, self->_activeKeyIdentifiers);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v26 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v27 = object_getClass(self);
        if (class_isMetaClass(v27)) {
          int v28 = 43;
        }
        else {
          int v28 = 45;
        }
        uint64_t v29 = object_getClassName(self);
        uint64_t v30 = sel_getName(a2);
        activeKeyIdentifiers = self->_activeKeyIdentifiers;
        *(_DWORD *)buf = 67110402;
        int v80 = v28;
        __int16 v81 = 2082;
        id v82 = v29;
        __int16 v83 = 2082;
        v84 = v30;
        __int16 v85 = 1024;
        int v86 = 974;
        __int16 v87 = 2114;
        long long v88 = p_super;
        __int16 v89 = 2114;
        uint64_t v90 = activeKeyIdentifiers;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in session express for aid:%{public}@ kids:%{public}@", buf, 0x36u);
      }

      unsigned int v32 = [(_NFSession *)self expressModeManager];
      BOOL v33 = sub_100044DB8((BOOL)v32);

      if (v33)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v34 = NFLogGetLogger();
        if (v34)
        {
          id v35 = (void (*)(uint64_t, const char *, ...))v34;
          id v36 = object_getClass(self);
          BOOL v37 = class_isMetaClass(v36);
          id v38 = object_getClassName(self);
          v76 = sel_getName(a2);
          uint64_t v39 = 45;
          if (v37) {
            uint64_t v39 = 43;
          }
          v35(6, "%c[%{public}s %{public}s]:%i Express mode is active", v39, v38, v76, 977);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v40 = NFSharedLogGetLogger();
        if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v41 = object_getClass(self);
          if (class_isMetaClass(v41)) {
            int v42 = 43;
          }
          else {
            int v42 = 45;
          }
          uint64_t v43 = object_getClassName(self);
          int v44 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v80 = v42;
          __int16 v81 = 2082;
          id v82 = v43;
          __int16 v83 = 2082;
          v84 = v44;
          __int16 v85 = 1024;
          int v86 = 977;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Express mode is active", buf, 0x22u);
        }
LABEL_49:

        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v60 = NFLogGetLogger();
        if (v60)
        {
          long long v61 = (void (*)(uint64_t, const char *, ...))v60;
          long long v62 = object_getClass(self);
          BOOL v63 = class_isMetaClass(v62);
          long long v64 = object_getClassName(self);
          int v78 = sel_getName(a2);
          uint64_t v65 = 45;
          if (v63) {
            uint64_t v65 = 43;
          }
          v61(6, "%c[%{public}s %{public}s]:%i Start in session express", v65, v64, v78, 990);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v66 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          int v67 = object_getClass(self);
          if (class_isMetaClass(v67)) {
            int v68 = 43;
          }
          else {
            int v68 = 45;
          }
          v69 = object_getClassName(self);
          __int16 v70 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v80 = v68;
          __int16 v81 = 2082;
          id v82 = v69;
          __int16 v83 = 2082;
          v84 = v70;
          __int16 v85 = 1024;
          int v86 = 990;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Start in session express", buf, 0x22u);
        }

        uint64_t v71 = [(_NFSession *)self expressModeManager];
        sub_10004BB60((uint64_t)v71, p_super);

        __int16 v72 = [(_NFSession *)self expressModeManager];
        sub_100040348((uint64_t)v72);

        unsigned __int8 v73 = [(_NFContactlessSession *)self _configureEmulationType:8];
        goto LABEL_60;
      }
      int v45 = [(_NFSession *)self expressModeManager];
      if (v45)
      {
        int v46 = v45[169];

        if (v46)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v47 = NFLogGetLogger();
          if (v47)
          {
            uint64_t v48 = (void (*)(uint64_t, const char *, ...))v47;
            long long v49 = object_getClass(self);
            BOOL v50 = class_isMetaClass(v49);
            int v51 = object_getClassName(self);
            BOOL v77 = sel_getName(a2);
            uint64_t v52 = 45;
            if (v50) {
              uint64_t v52 = 43;
            }
            v48(6, "%c[%{public}s %{public}s]:%i Cancel previous delayed express restart request; force express enable",
              v52,
              v51,
              v77,
              984);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v53 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v54 = object_getClass(self);
            if (class_isMetaClass(v54)) {
              int v55 = 43;
            }
            else {
              int v55 = 45;
            }
            unsigned int v56 = object_getClassName(self);
            BOOL v57 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v80 = v55;
            __int16 v81 = 2082;
            id v82 = v56;
            __int16 v83 = 2082;
            v84 = v57;
            __int16 v85 = 1024;
            int v86 = 984;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cancel previous delayed express restart request; force express enable",
              buf,
              0x22u);
          }

          uint64_t v58 = [(_NFSession *)self expressModeManager];
          uint64_t v40 = v58;
          if (v58)
          {
            int v59 = *(void **)(v58 + 72);
            if (v59)
            {
              *(unsigned char *)(v40 + 169) = 0;
              [v59 stopTimer];
            }
          }
          goto LABEL_49;
        }
      }
    }
    unsigned __int8 v73 = [(_NFContactlessSession *)self _startFieldDetectAndKeepSEOn:v3];
LABEL_60:
    BOOL v18 = v73;
    goto LABEL_61;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v9 = NFLogGetLogger();
  if (v9)
  {
    SEL v10 = (void (*)(uint64_t, const char *, ...))v9;
    objc_super v11 = object_getClass(self);
    BOOL v12 = class_isMetaClass(v11);
    id v13 = object_getClassName(self);
    uint64_t v75 = sel_getName(a2);
    uint64_t v14 = 45;
    if (v12) {
      uint64_t v14 = 43;
    }
    v10(3, "%c[%{public}s %{public}s]:%i EMM is nil!", v14, v13, v75, 964);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  p_super = NFSharedLogGetLogger();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
  {
    objc_super v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v80 = v17;
    __int16 v81 = 2082;
    id v82 = object_getClassName(self);
    __int16 v83 = 2082;
    v84 = sel_getName(a2);
    __int16 v85 = 1024;
    int v86 = 964;
    _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i EMM is nil!", buf, 0x22u);
  }
  BOOL v18 = 0;
LABEL_61:

  return v18;
}

- (BOOL)startDefaultMode
{
  return [(_NFContactlessSession *)self startDefaultModeAndKeepSEOn:0];
}

- (void)handleFieldChanged:(BOOL)a3
{
  BOOL v3 = a3;
  self->_fieldPresent = a3;
  BOOL v5 = [(_NFXPCSession *)self remoteObject];
  [v5 didDetectField:v3];

  if (self->_emulationState) {
    BOOL v6 = !v3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    v10[0] = @"FieldTechnology";
    v10[1] = @"SystemCode";
    v11[0] = &off_10031B2E0;
    v11[1] = &off_10031B2F8;
    id v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    id v8 = +[NFFieldNotification notificationWithDictionary:v7];

    uint64_t v9 = [(_NFXPCSession *)self remoteObject];
    [v9 didDetectFieldNotification:v8];
  }
}

- (void)handleFieldNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(_NFXPCSession *)self remoteObject];
  [v5 didDetectFieldNotification:v4];
}

- (void)handleFieldReset
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 1032);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  SEL v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v15 = v12;
    __int16 v16 = 2082;
    int v17 = object_getClassName(self);
    __int16 v18 = 2082;
    unsigned int v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 1032;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }
}

- (void)handleSelectEvent:(id)a3
{
  id v5 = a3;
  if ([(_NFContactlessSession *)self plasticCardMode])
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
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i Ignoring due to plasticCardMode", v11, ClassName, Name, 1038);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v18 = v14;
      __int16 v19 = 2082;
      __int16 v20 = object_getClassName(self);
      __int16 v21 = 2082;
      BOOL v22 = sel_getName(a2);
      __int16 v23 = 1024;
      int v24 = 1038;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignoring due to plasticCardMode", buf, 0x22u);
    }
  }
  else
  {
    int v15 = [(_NFXPCSession *)self remoteObject];
    [v15 didSelectApplet:v5];
  }
}

- (void)handleFelicaStateEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(_NFXPCSession *)self remoteObject];
  [v5 didFelicaStateChange:v4];
}

- (NFSecureElementWrapper)secureElementWrapper
{
  return (NFSecureElementWrapper *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSecureElementWrapper:(id)a3
{
}

- (NFSystemPowerConsumptionMonitor)powerConsumptionReporter
{
  return (NFSystemPowerConsumptionMonitor *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPowerConsumptionReporter:(id)a3
{
}

- (NFApplet)deferredActivationApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 240, 1);
}

- (void)setDeferredActivationApplet:(id)a3
{
}

- (NSSet)activeKeyIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 248, 1);
}

- (NSSet)activeSecondaryKeyIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 256, 1);
}

- (BOOL)plasticCardMode
{
  return self->_plasticCardMode;
}

- (void)setPlasticCardMode:(BOOL)a3
{
  self->_plasticCardMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSecondaryKeyIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeKeyIdentifiers, 0);
  objc_storeStrong((id *)&self->_deferredActivationApplet, 0);
  objc_storeStrong((id *)&self->_powerConsumptionReporter, 0);
  objc_storeStrong((id *)&self->_secureElementWrapper, 0);
  objc_storeStrong((id *)&self->_applets, 0);
  objc_storeStrong((id *)&self->_appletMap, 0);
  objc_storeStrong((id *)&self->_activeGroupMembers, 0);
  objc_storeStrong((id *)&self->_activeSecondaryApplet, 0);

  objc_storeStrong((id *)&self->_activeApplet, 0);
}

@end