@interface _NFSecureElementReaderSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)shouldHandleSecureElementTransactionData;
- (BOOL)suspendWithInfo:(id)a3;
- (NFDriverWrapper)driverWrapper;
- (NFSecureElementWrapper)embeddedSecureElementWrapper;
- (NFSystemPowerConsumptionMonitor)powerConsumptionReporter;
- (id)_disconnectWithCardRemoval:(BOOL)a3;
- (id)initialRoutingConfig;
- (id)selectApplets:(id)a3;
- (void)_cleanupVAS;
- (void)cleanup;
- (void)connect:(id)a3 completion:(id)a4;
- (void)didStartSession:(id)a3;
- (void)disconnectWithCardRemoval:(BOOL)a3 completion:(id)a4;
- (void)handleReaderBurnoutCleared;
- (void)handleReaderBurnoutTimer;
- (void)handleRemoteTagsDetected:(id)a3;
- (void)handleSecureElementTransactionData:(id)a3 appletIdentifier:(id)a4;
- (void)performSelectVASWithCompletion:(id)a3;
- (void)performVAS:(id)a3 select:(BOOL)a4 completion:(id)a5;
- (void)secureElementReaderStarted:(id)a3;
- (void)secureElementReaderStopped:(id)a3;
- (void)selectApplets:(id)a3 completion:(id)a4;
- (void)setDriverWrapper:(id)a3;
- (void)setEmbeddedSecureElementWrapper:(id)a3;
- (void)setPowerConsumptionReporter:(id)a3;
- (void)startSecureElementReaderWithCompletion:(id)a3;
- (void)startVASPolling:(id)a3 completion:(id)a4;
- (void)stopSecureElementReaderWithCompletion:(id)a3;
- (void)stopVASPolling:(id)a3;
- (void)transceive:(id)a3 completion:(id)a4;
@end

@implementation _NFSecureElementReaderSession

+ (id)validateEntitlements:(id)a3
{
  id v5 = a3;
  if ([v5 seSessionAccess]
    && ([v5 readerInternalAccess] & 1) != 0)
  {
    id v6 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", v12, ClassName, Name, 53);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = object_getClass(a1);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v27 = v15;
      __int16 v28 = 2082;
      v29 = object_getClassName(a1);
      __int16 v30 = 2082;
      v31 = sel_getName(a2);
      __int16 v32 = 1024;
      int v33 = 53;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", buf, 0x22u);
    }

    id v16 = objc_alloc((Class)NSError);
    v17 = +[NSString stringWithUTF8String:"nfcd"];
    v24[0] = NSLocalizedDescriptionKey;
    v18 = +[NSString stringWithUTF8String:"Not entitled"];
    v25[0] = v18;
    v25[1] = &off_10031C3D8;
    v24[1] = @"Line";
    v24[2] = @"Method";
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v25[2] = v19;
    v24[3] = NSDebugDescriptionErrorKey;
    id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 54];
    v25[3] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
    id v6 = [v16 initWithDomain:v17 code:32 userInfo:v21];
  }

  return v6;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig embeddedWiredModeWithFD:1];
}

- (void)cleanup
{
  v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureElementReaderSession", buf, 2u);
  }

  if ([(_NFSession *)self needsCleanup] && ![(_NFSession *)self isSuspended])
  {
    [(_NFSecureElementReaderSession *)self _cleanupVAS];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
    sub_1001B03F0((uint64_t)WeakRetained, self);

    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = [(_NFXPCSession *)self clientName];
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", v13, ClassName, Name, 74, v12);
    }
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      v17 = object_getClassName(self);
      v18 = sel_getName(a2);
      id v19 = [(_NFXPCSession *)self clientName];
      *(_DWORD *)buf = 67110146;
      int v23 = v16;
      __int16 v24 = 2082;
      v25 = v17;
      __int16 v26 = 2082;
      int v27 = v18;
      __int16 v28 = 1024;
      int v29 = 74;
      __int16 v30 = 2112;
      v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", buf, 0x2Cu);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)_NFSecureElementReaderSession;
  [(_NFSession *)&v21 cleanup];
  id v20 = NFSharedSignpostLog();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureElementReaderSession", buf, 2u);
  }
}

- (void)didStartSession:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_NFSecureElementReaderSession;
  id v4 = a3;
  [(_NFSession *)&v9 didStartSession:v4];
  id v5 = +[_NFHardwareManager sharedHardwareManager];
  id v6 = [v5 secureElementWrapper];
  embeddedSecureElementWrapper = self->_embeddedSecureElementWrapper;
  self->_embeddedSecureElementWrapper = v6;

  v8 = [(_NFXPCSession *)self remoteObject];
  [v8 didStartSession:v4];
}

- (BOOL)suspendWithInfo:(id)a3
{
  v36.receiver = self;
  v36.super_class = (Class)_NFSecureElementReaderSession;
  BOOL v5 = [(_NFXPCSession *)&v36 suspendWithInfo:a3];
  if (v5 && self->_readerOn)
  {
    id v6 = +[_NFHardwareManager sharedHardwareManager];
    v7 = +[NFRoutingConfig embeddedWiredMode];
    v8 = [v6 setRoutingConfig:v7];

    if (v8)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v14 = 45;
        if (isMetaClass) {
          uint64_t v14 = 43;
        }
        v10(3, "%c[%{public}s %{public}s]:%i Failed to change routing.", v14, ClassName, Name, 103);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = object_getClass(self);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        v18 = object_getClassName(self);
        id v19 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v38 = v17;
        __int16 v39 = 2082;
        v40 = v18;
        __int16 v41 = 2082;
        v42 = v19;
        __int16 v43 = 1024;
        int v44 = 103;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to change routing.", buf, 0x22u);
      }
    }
    else
    {
      self->_readerOn = 0;
      self->_tooHot = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
      sub_1001B03F0((uint64_t)WeakRetained, self);

      uint64_t v21 = NFLogGetLogger();
      if (v21)
      {
        v22 = (void (*)(uint64_t, const char *, ...))v21;
        int v23 = object_getClass(self);
        BOOL v24 = class_isMetaClass(v23);
        v25 = object_getClassName(self);
        __int16 v26 = sel_getName(a2);
        int v27 = [(_NFXPCSession *)self clientName];
        uint64_t v28 = 45;
        if (v24) {
          uint64_t v28 = 43;
        }
        v22(6, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", v28, v25, v26, 101, v27);
      }
      int v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = object_getClass(self);
        if (class_isMetaClass(v29)) {
          int v30 = 43;
        }
        else {
          int v30 = 45;
        }
        v31 = object_getClassName(self);
        __int16 v32 = sel_getName(a2);
        int v33 = [(_NFXPCSession *)self clientName];
        *(_DWORD *)buf = 67110146;
        int v38 = v30;
        __int16 v39 = 2082;
        v40 = v31;
        __int16 v41 = 2082;
        v42 = v32;
        __int16 v43 = 1024;
        int v44 = 101;
        __int16 v45 = 2112;
        v46 = v33;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", buf, 0x2Cu);
      }
    }
  }
  return v5;
}

- (BOOL)shouldHandleSecureElementTransactionData
{
  return 1;
}

- (void)handleReaderBurnoutTimer
{
  v6.receiver = self;
  v6.super_class = (Class)_NFSecureElementReaderSession;
  id v4 = [(_NFSession *)&v6 workQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100150370;
  v5[3] = &unk_100301C40;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

- (void)handleReaderBurnoutCleared
{
  self->_tooHot = 0;
  id v2 = [(_NFXPCSession *)self remoteObject];
  [v2 didReceiveThermalIndication:0];
}

- (id)selectApplets:(id)a3
{
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v5 = a3;
  id v55 = [v5 countByEnumeratingWithState:&v57 objects:v75 count:16];
  if (v55)
  {
    uint64_t v53 = *(void *)v58;
    objc_super v6 = &AMFDRSealingMapCopyLocalData_ptr;
    id v50 = v5;
    sel = a2;
    v52 = self;
    while (2)
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(void *)v58 != v53) {
          objc_enumerationMutation(v5);
        }
        uint64_t v8 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          v10 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          uint64_t v13 = 45;
          if (isMetaClass) {
            uint64_t v13 = 43;
          }
          objc_super v6 = &AMFDRSealingMapCopyLocalData_ptr;
          v10(6, "%c[%{public}s %{public}s]:%i Selecting %{public}@", v13, ClassName, Name, 154, v8);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v14 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = object_getClass(self);
          if (class_isMetaClass(v15)) {
            int v16 = 43;
          }
          else {
            int v16 = 45;
          }
          int v17 = object_getClassName(self);
          v18 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v66 = v16;
          __int16 v67 = 2082;
          v68 = v17;
          __int16 v69 = 2082;
          v70 = v18;
          __int16 v71 = 1024;
          int v72 = 154;
          __int16 v73 = 2114;
          uint64_t v74 = v8;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Selecting %{public}@", buf, 0x2Cu);
        }

        id v19 = [(_NFSecureElementReaderSession *)self embeddedSecureElementWrapper];
        uint64_t v54 = v8;
        id v20 = +[NSData NF_dataWithHexString:v8];
        id v56 = 0;
        uint64_t v21 = [v19 selectByName:v20 error:&v56];
        id v22 = v56;

        if (v22 || [v21 status] != 36864)
        {
          if ([v21 status] != 36864)
          {
            unsigned int v23 = [v21 status];
            id v24 = objc_alloc((Class)NSError);
            v25 = [v6[466] stringWithUTF8String:"nfcd"];
            if (v23 == 25392)
            {
              NSErrorUserInfoKey v63 = NSLocalizedDescriptionKey;
              __int16 v26 = [v6[466] stringWithUTF8String:"Reader mode prohibit timer"];
              v64 = v26;
              int v27 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
              id v28 = [v24 initWithDomain:v25 code:64 userInfo:v27];
            }
            else
            {
              v61[0] = NSLocalizedDescriptionKey;
              uint64_t v29 = [v6[466] stringWithUTF8String:"Commmand Error"];
              int v30 = v6;
              __int16 v26 = (void *)v29;
              v61[1] = NSLocalizedFailureReasonErrorKey;
              v62[0] = v29;
              id v31 = objc_alloc((Class)v30[466]);
              int v27 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v21 status]);
              uint64_t v32 = [v27 stringValue];
              id v33 = [v31 initWithFormat:@"%@", v32];
              v62[1] = v33;
              v34 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
              id v28 = [v24 initWithDomain:v25 code:16 userInfo:v34];

              a2 = sel;
              id v22 = (id)v32;
              id v5 = v50;
            }

            id v22 = v28;
            self = v52;
            objc_super v6 = &AMFDRSealingMapCopyLocalData_ptr;
          }
          if (v22)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v35 = NFLogGetLogger();
            if (v35)
            {
              objc_super v36 = (void (*)(uint64_t, const char *, ...))v35;
              v37 = object_getClass(self);
              BOOL v38 = class_isMetaClass(v37);
              __int16 v39 = object_getClassName(self);
              v49 = sel_getName(sel);
              uint64_t v40 = 45;
              if (v38) {
                uint64_t v40 = 43;
              }
              v36(3, "%c[%{public}s %{public}s]:%i Failed to select applet %{public}@", v40, v39, v49, 170, v54);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            __int16 v41 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              v42 = object_getClass(self);
              if (class_isMetaClass(v42)) {
                int v43 = 43;
              }
              else {
                int v43 = 45;
              }
              int v44 = object_getClassName(self);
              __int16 v45 = sel_getName(sel);
              *(_DWORD *)buf = 67110146;
              int v66 = v43;
              __int16 v67 = 2082;
              v68 = v44;
              __int16 v69 = 2082;
              v70 = v45;
              __int16 v71 = 1024;
              int v72 = 170;
              __int16 v73 = 2114;
              uint64_t v74 = v54;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet %{public}@", buf, 0x2Cu);
            }

            goto LABEL_36;
          }
        }
      }
      id v55 = [v5 countByEnumeratingWithState:&v57 objects:v75 count:16];
      if (v55) {
        continue;
      }
      break;
    }
  }
  id v22 = 0;
LABEL_36:

  return v22;
}

- (void)selectApplets:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, id))a4;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = v7;
  v10 = (char *)[v9 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v10)
  {
    v11 = v10;
    uint64_t v12 = *(void *)v40;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            int v16 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            uint64_t v20 = 45;
            if (isMetaClass) {
              uint64_t v20 = 43;
            }
            v16(3, "%c[%{public}s %{public}s]:%i Invalid applet type", v20, ClassName, Name, 183);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v21 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            id v22 = object_getClass(self);
            if (class_isMetaClass(v22)) {
              int v23 = 43;
            }
            else {
              int v23 = 45;
            }
            id v24 = object_getClassName(self);
            v25 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v46 = v23;
            __int16 v47 = 2082;
            v48 = v24;
            __int16 v49 = 2082;
            id v50 = v25;
            __int16 v51 = 1024;
            int v52 = 183;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid applet type", buf, 0x22u);
          }

          id v26 = objc_alloc((Class)NSError);
          int v27 = +[NSString stringWithUTF8String:"nfcd"];
          v43[0] = NSLocalizedDescriptionKey;
          id v28 = +[NSString stringWithUTF8String:"Invalid Parameter"];
          v44[0] = v28;
          v44[1] = &off_10031C3F0;
          v43[1] = @"Line";
          v43[2] = @"Method";
          id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v44[2] = v29;
          v43[3] = NSDebugDescriptionErrorKey;
          id v30 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 184];
          v44[3] = v30;
          id v31 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:4];
          id v32 = [v26 initWithDomain:v27 code:10 userInfo:v31];
          v8[2](v8, v32);

          goto LABEL_20;
        }
      }
      v11 = (char *)[v9 countByEnumeratingWithState:&v39 objects:v53 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v38.receiver = self;
  v38.super_class = (Class)_NFSecureElementReaderSession;
  uint64_t v14 = [(_NFSession *)&v38 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001511CC;
  block[3] = &unk_100302278;
  block[4] = self;
  SEL v37 = a2;
  objc_super v36 = v8;
  id v35 = v9;
  dispatch_async(v14, block);

LABEL_20:
}

- (void)startSecureElementReaderWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSecureElementReaderSession;
  objc_super v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001517C8;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)stopSecureElementReaderWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSecureElementReaderSession;
  objc_super v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100151F5C;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)transceive:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFSecureElementReaderSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001526B0;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)startVASPolling:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFSecureElementReaderSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100152E0C;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)stopVASPolling:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSecureElementReaderSession;
  objc_super v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100153C20;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)performSelectVASWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSecureElementReaderSession;
  objc_super v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100154438;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)performVAS:(id)a3 select:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_NFSecureElementReaderSession;
  objc_super v11 = [(_NFSession *)&v19 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100154F1C;
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

- (void)connect:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___NFTag])
  {
    v21.receiver = self;
    v21.super_class = (Class)_NFSecureElementReaderSession;
    id v9 = [(_NFSession *)&v21 workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100155F20;
    block[3] = &unk_100301D60;
    block[4] = self;
    SEL v20 = a2;
    id v18 = v7;
    id v19 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = objc_alloc((Class)NSError);
    objc_super v11 = +[NSString stringWithUTF8String:"nfcd"];
    v22[0] = NSLocalizedDescriptionKey;
    id v12 = +[NSString stringWithUTF8String:"Invalid Parameter"];
    v23[0] = v12;
    v23[1] = &off_10031C438;
    v22[1] = @"Line";
    v22[2] = @"Method";
    id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v23[2] = v13;
    v22[3] = NSDebugDescriptionErrorKey;
    id v14 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 500];
    v23[3] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    id v16 = [v10 initWithDomain:v11 code:10 userInfo:v15];
    (*((void (**)(id, id))v8 + 2))(v8, v16);
  }
}

- (void)disconnectWithCardRemoval:(BOOL)a3 completion:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NFSecureElementReaderSession;
  id v8 = [(_NFSession *)&v14 workQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001565D4;
  v10[3] = &unk_100302E40;
  id v11 = v7;
  SEL v12 = a2;
  v10[4] = self;
  BOOL v13 = a3;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (id)_disconnectWithCardRemoval:(BOOL)a3
{
  currentTag = self->_currentTag;
  if (!currentTag)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v18(3, "%c[%{public}s %{public}s]:%i Invalid tag state", v22, ClassName, Name, 555);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v35 = v25;
      __int16 v36 = 2082;
      SEL v37 = object_getClassName(self);
      __int16 v38 = 2082;
      long long v39 = sel_getName(a2);
      __int16 v40 = 1024;
      int v41 = 555;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag state", buf, 0x22u);
    }

    id v26 = objc_alloc((Class)NSError);
    id v9 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    SEL v12 = +[NSString stringWithUTF8String:"Invalid State"];
    id v33 = v12;
    BOOL v13 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    objc_super v14 = v26;
    id v15 = v9;
    uint64_t v16 = 12;
    goto LABEL_17;
  }
  unsigned int v6 = sub_1001900C4(self->_driverWrapper, currentTag, a3);
  id v7 = self->_currentTag;
  self->_currentTag = 0;

  if (v6)
  {
    id v8 = objc_alloc((Class)NSError);
    id v9 = +[NSString stringWithUTF8String:"nfcd"];
    uint64_t v10 = v6;
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    if (v6 >= 0x47) {
      int v11 = 71;
    }
    else {
      int v11 = v6;
    }
    SEL v12 = +[NSString stringWithUTF8String:off_1003050D8[v11]];
    id v31 = v12;
    BOOL v13 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    objc_super v14 = v8;
    id v15 = v9;
    uint64_t v16 = v10;
LABEL_17:
    id v27 = [v14 initWithDomain:v15 code:v16 userInfo:v13];

    goto LABEL_19;
  }
  id v27 = 0;
LABEL_19:

  return v27;
}

- (void)_cleanupVAS
{
  if (self->_currentTag) {
    id v4 = [(_NFSecureElementReaderSession *)self _disconnectWithCardRemoval:0];
  }
  if (self->_vasECP)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      unsigned int v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(6, "%c[%{public}s %{public}s]:%i Stopping routing", v10, ClassName, Name, 578);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      SEL v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v60 = v13;
      __int16 v61 = 2082;
      v62 = object_getClassName(self);
      __int16 v63 = 2082;
      v64 = sel_getName(a2);
      __int16 v65 = 1024;
      int v66 = 578;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Stopping routing", buf, 0x22u);
    }

    objc_super v14 = +[_NFHardwareManager sharedHardwareManager];
    id v15 = +[NFRoutingConfig routingOffWithFD:0];
    id v16 = [v14 setRoutingConfig:v15];

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v17 = NFLogGetLogger();
    if (v17)
    {
      id v18 = (void (*)(uint64_t, const char *, ...))v17;
      id v19 = object_getClass(self);
      BOOL v20 = class_isMetaClass(v19);
      objc_super v21 = object_getClassName(self);
      id v56 = sel_getName(a2);
      uint64_t v22 = 45;
      if (v20) {
        uint64_t v22 = 43;
      }
      v18(6, "%c[%{public}s %{public}s]:%i Resetting ECP", v22, v21, v56, 583);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      id v26 = object_getClassName(self);
      id v27 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v60 = v25;
      __int16 v61 = 2082;
      v62 = v26;
      __int16 v63 = 2082;
      v64 = v27;
      __int16 v65 = 1024;
      int v66 = 583;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resetting ECP", buf, 0x22u);
    }

    self->_vasECP = 0;
    id v28 = +[_NFHardwareManager sharedHardwareManager];
    unsigned __int8 v29 = [v28 configureECPPolling:0];

    if ((v29 & 1) == 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v30 = NFLogGetLogger();
      if (v30)
      {
        id v31 = (void (*)(uint64_t, const char *, ...))v30;
        NSErrorUserInfoKey v32 = object_getClass(self);
        BOOL v33 = class_isMetaClass(v32);
        v34 = object_getClassName(self);
        long long v57 = sel_getName(a2);
        uint64_t v35 = 45;
        if (v33) {
          uint64_t v35 = 43;
        }
        v31(3, "%c[%{public}s %{public}s]:%i Failed to restore ECP", v35, v34, v57, 587);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v36 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        SEL v37 = object_getClass(self);
        if (class_isMetaClass(v37)) {
          int v38 = 43;
        }
        else {
          int v38 = 45;
        }
        long long v39 = object_getClassName(self);
        __int16 v40 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v60 = v38;
        __int16 v61 = 2082;
        v62 = v39;
        __int16 v63 = 2082;
        v64 = v40;
        __int16 v65 = 1024;
        int v66 = 587;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore ECP", buf, 0x22u);
      }
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v41 = NFLogGetLogger();
    if (v41)
    {
      long long v42 = (void (*)(uint64_t, const char *, ...))v41;
      int v43 = object_getClass(self);
      BOOL v44 = class_isMetaClass(v43);
      __int16 v45 = object_getClassName(self);
      long long v58 = sel_getName(a2);
      uint64_t v46 = 45;
      if (v44) {
        uint64_t v46 = 43;
      }
      v42(6, "%c[%{public}s %{public}s]:%i Restoring initial session routing", v46, v45, v58, 590);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v47 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = object_getClass(self);
      if (class_isMetaClass(v48)) {
        int v49 = 43;
      }
      else {
        int v49 = 45;
      }
      id v50 = object_getClassName(self);
      __int16 v51 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v60 = v49;
      __int16 v61 = 2082;
      v62 = v50;
      __int16 v63 = 2082;
      v64 = v51;
      __int16 v65 = 1024;
      int v66 = 590;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Restoring initial session routing", buf, 0x22u);
    }

    int v52 = +[_NFHardwareManager sharedHardwareManager];
    uint64_t v53 = [(_NFSecureElementReaderSession *)self initialRoutingConfig];
    id v54 = [v52 setRoutingConfig:v53];
  }
}

- (void)secureElementReaderStarted:(id)a3
{
  id v4 = a3;
  id v5 = [(_NFXPCSession *)self remoteObject];
  [v5 didStartSecureElementReader:v4];
}

- (void)secureElementReaderStopped:(id)a3
{
  id v4 = a3;
  id v6 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v4];

  if (self->_tooHot) {
    [v6 setObject:&off_10031C450 forKeyedSubscript:@"tooHot"];
  }
  id v5 = [(_NFXPCSession *)self remoteObject];
  [v5 didEndSecureElementReader:v6];
}

- (void)handleSecureElementTransactionData:(id)a3 appletIdentifier:(id)a4
{
  id v34 = a3;
  id v7 = a4;
  uint64_t v39 = 0;
  __int16 v40 = &v39;
  uint64_t v41 = 0x3032000000;
  long long v42 = sub_10000B878;
  int v43 = sub_100157950;
  id v44 = 0;
  embeddedSecureElementWrapper = self->_embeddedSecureElementWrapper;
  id v38 = 0;
  id v9 = sub_100246F2C(embeddedSecureElementWrapper, &v38);
  id v10 = v38;

  if (v9)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v13 = 43;
      }
      else {
        uint64_t v13 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Failed to validate applets", v13, ClassName, Name, 618);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      id v19 = object_getClassName(self);
      BOOL v20 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v46 = v18;
      __int16 v47 = 2082;
      v48 = v19;
      __int16 v49 = 2082;
      id v50 = v20;
      __int16 v51 = 1024;
      int v52 = 618;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to validate applets", buf, 0x22u);
    }
  }
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100157958;
  v35[3] = &unk_100305348;
  id v21 = v7;
  id v36 = v21;
  SEL v37 = &v39;
  [v10 enumerateObjectsUsingBlock:v35];
  if (v40[5])
  {
    uint64_t v22 = [(_NFXPCSession *)self remoteObject];
    [v22 receivedSecureElementReaderData:v34 forApplet:v40[5]];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v23)
    {
      id v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        uint64_t v25 = 43;
      }
      else {
        uint64_t v25 = 45;
      }
      id v26 = object_getClassName(self);
      id v27 = sel_getName(a2);
      id v28 = [v21 NF_asHexString];
      v23(5, "%c[%{public}s %{public}s]:%i Failed to find applet %{public}@", v25, v26, v27, 631, v28);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      id v31 = object_getClassName(self);
      NSErrorUserInfoKey v32 = sel_getName(a2);
      BOOL v33 = [v21 NF_asHexString];
      *(_DWORD *)buf = 67110146;
      int v46 = v30;
      __int16 v47 = 2082;
      v48 = v31;
      __int16 v49 = 2082;
      id v50 = v32;
      __int16 v51 = 1024;
      int v52 = 631;
      __int16 v53 = 2114;
      id v54 = v33;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to find applet %{public}@", buf, 0x2Cu);
    }
  }

  _Block_object_dispose(&v39, 8);
}

- (void)handleRemoteTagsDetected:(id)a3
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
    v7(6, "%c[%{public}s %{public}s]:%i tags: %{public}@", v10, ClassName, Name, 638, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    SEL v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    id v21 = object_getClassName(self);
    __int16 v22 = 2082;
    int v23 = sel_getName(a2);
    __int16 v24 = 1024;
    int v25 = 638;
    __int16 v26 = 2114;
    id v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tags: %{public}@", buf, 0x2Cu);
  }

  objc_super v14 = NFSharedSignpostLog();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_NFSecureElementReaderSession+detect_tags", (const char *)&unk_100286819, buf, 2u);
  }

  id v15 = [(_NFXPCSession *)self remoteObject];
  [v15 didDetectTags:v5];
}

- (NFDriverWrapper)driverWrapper
{
  return (NFDriverWrapper *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDriverWrapper:(id)a3
{
}

- (NFSystemPowerConsumptionMonitor)powerConsumptionReporter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);

  return (NFSystemPowerConsumptionMonitor *)WeakRetained;
}

- (void)setPowerConsumptionReporter:(id)a3
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
  objc_destroyWeak((id *)&self->_powerConsumptionReporter);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_vasReader, 0);
  objc_storeStrong((id *)&self->_currentTag, 0);

  objc_storeStrong((id *)&self->_applets, 0);
}

@end