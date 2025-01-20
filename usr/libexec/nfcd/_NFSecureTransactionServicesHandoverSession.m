@interface _NFSecureTransactionServicesHandoverSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)willStartSession;
- (id)initialRoutingConfig;
- (void)cleanup;
- (void)coreDuetActivityRevoked;
- (void)didStartSession:(id)a3;
- (void)endSession:(id)a3;
- (void)handleFieldChanged:(BOOL)a3;
- (void)handleFieldNotification:(id)a3;
- (void)handleHostCardReaderDetected:(id)a3;
- (void)handleRemoteTagsDetected:(id)a3;
- (void)iso18013DataRetrievalCompleted;
- (void)relinquishSEProxy;
- (void)reqlinquishNFCReaderProxy;
- (void)restartNFCReaderDiscovery;
- (void)startSTSNotificationListenerEndpoint:(id)a3;
- (void)startTNEPDeviceWithServices:(id)a3 optionalRecords:(id)a4 callback:(id)a5;
- (void)startTNEPReaderWithCallback:(id)a3;
- (void)staticReaderEngagementDiscovered:(id)a3;
- (void)tnepReaderDeselectWithCallback:(id)a3;
- (void)tnepReaderRestartPollingWithCallback:(id)a3;
- (void)tnepReaderSelectService:(id)a3 callback:(id)a4;
- (void)tnepReaderSend:(id)a3 callback:(id)a4;
- (void)tnepReaderServicesAborted:(id)a3;
- (void)tnepReaderServicesDiscovered:(id)a3;
- (void)tnepServiceInvalidate;
- (void)tnepTagDeviceDeselected:(id)a3;
- (void)tnepTagDeviceNDEFMessageReceived:(id)a3;
- (void)tnepTagDeviceReaderDetected;
- (void)tnepTagDeviceSelected:(id)a3 respondHandler:(id)a4;
- (void)tnepTagDeviceSendNDEFMessage:(id)a3 callback:(id)a4;
@end

@implementation _NFSecureTransactionServicesHandoverSession

- (BOOL)willStartSession
{
  v3 = objc_opt_new();
  sub_10005AB74((uint64_t)self, v3);

  v5.receiver = self;
  v5.super_class = (Class)_NFSecureTransactionServicesHandoverSession;
  return [(_NFSession *)&v5 willStartSession];
}

- (void)endSession:(id)a3
{
  if (self) {
    stsHelper = self->_stsHelper;
  }
  else {
    stsHelper = 0;
  }
  id v5 = a3;
  [(STSHelperLibrary *)stsHelper invalidate];
  sub_10005AB74((uint64_t)self, 0);
  v6.receiver = self;
  v6.super_class = (Class)_NFSecureTransactionServicesHandoverSession;
  [(_NFXPCSession *)&v6 endSession:v5];
}

- (void)startSTSNotificationListenerEndpoint:(id)a3
{
  id v5 = a3;
  if (![(_NFSession *)self didStart]
    || [(_NFSession *)self isSuspended]
    || [(_NFSession *)self didEnd])
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
      v12 = [(_NFSession *)self sessionUID];
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v13, ClassName, Name, 102, v12);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      v17 = object_getClassName(self);
      v18 = sel_getName(a2);
      v19 = [(_NFSession *)self sessionUID];
      *(_DWORD *)buf = 67110146;
      int v33 = v16;
      __int16 v34 = 2082;
      v35 = v17;
      __int16 v36 = 2082;
      v37 = v18;
      __int16 v38 = 1024;
      int v39 = 102;
      __int16 v40 = 2114;
      v41 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v20 = NFLogGetLogger();
    if (v20)
    {
      v21 = (void (*)(uint64_t, const char *, ...))v20;
      v22 = object_getClass(self);
      BOOL v23 = class_isMetaClass(v22);
      v24 = object_getClassName(self);
      v31 = sel_getName(a2);
      uint64_t v25 = 45;
      if (v23) {
        uint64_t v25 = 43;
      }
      v21(6, "%c[%{public}s %{public}s]:%i ", v25, v24, v31, 105);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = object_getClass(self);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v33 = v28;
      __int16 v34 = 2082;
      v35 = object_getClassName(self);
      __int16 v36 = 2082;
      v37 = sel_getName(a2);
      __int16 v38 = 1024;
      int v39 = 105;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    if (self) {
      stsHelper = self->_stsHelper;
    }
    else {
      stsHelper = 0;
    }
    id v30 = [(STSHelperLibrary *)stsHelper connectToNotificationListener:v5];
  }
}

- (void)handleFieldChanged:(BOOL)a3
{
  BOOL v3 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005AFE8;
  v5[3] = &unk_100301F70;
  v5[4] = self;
  v5[5] = a2;
  v4 = sub_10005B180(self, v5);
  [v4 fieldChange:v3];
}

- (void)handleFieldNotification:(id)a3
{
  objc_super v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_10005B28C;
  v9 = &unk_100301F70;
  v10 = self;
  SEL v11 = a2;
  id v4 = a3;
  id v5 = sub_10005B180(self, &v6);
  [v5 fieldNotification:v4, v6, v7, v8, v9, v10, v11];
}

- (void)handleHostCardReaderDetected:(id)a3
{
  id v4 = a3;
  id v5 = NFSharedSignpostLog();
  unint64_t v6 = [(_NFSession *)self signpostId];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, v7, "ReaderDetected", (const char *)&unk_100286819, buf, 2u);
    }
  }

  id v8 = v4;
  if (self)
  {
    tnepHandler = self->_tnepHandler;
    if (tnepHandler)
    {
      sub_100253720((uint64_t)tnepHandler, v8);
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        SEL v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName("startHCEProcessingWithDevice:completion:");
        uint64_t v15 = 45;
        if (isMetaClass) {
          uint64_t v15 = 43;
        }
        v11(3, "%c[%{public}s %{public}s]:%i Missing tnepHandler", v15, ClassName, Name, 804);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v16 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = object_getClass(self);
        if (class_isMetaClass(v17)) {
          int v18 = 43;
        }
        else {
          int v18 = 45;
        }
        v19 = object_getClassName(self);
        uint64_t v20 = sel_getName("startHCEProcessingWithDevice:completion:");
        *(_DWORD *)buf = 67109890;
        int v23 = v18;
        __int16 v24 = 2082;
        uint64_t v25 = v19;
        __int16 v26 = 2082;
        v27 = v20;
        __int16 v28 = 1024;
        int v29 = 804;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing tnepHandler", buf, 0x22u);
      }
    }
  }
}

- (void)handleRemoteTagsDetected:(id)a3
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v7 = *(void *)v22;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v22 != v7) {
        objc_enumerationMutation(v5);
      }
      v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      v10 = [v9 tagA];
      if (v10)
      {

LABEL_13:
        id v6 = v9;

        if (!v6) {
          goto LABEL_24;
        }
        if (self)
        {
          driverWrapper = self->_driverWrapper;
          if (driverWrapper)
          {
            if (sub_10018FAE8(driverWrapper, v6, 0)) {
              goto LABEL_25;
            }
          }
        }
        v14 = NFSharedSignpostLog();
        unint64_t v15 = [(_NFSession *)self signpostId];
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v16 = v15;
          if (os_signpost_enabled(v14))
          {
            *(_WORD *)uint64_t v20 = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, v16, "TargetTagDetected", (const char *)&unk_100286819, v20, 2u);
          }
        }

        if (self)
        {
          objc_storeStrong((id *)&self->_connectedTag, v9);
          v17 = self->_tnepHandler;
          if (v17)
          {
            unint64_t role = self->_role;
            if (role == 4)
            {

LABEL_29:
              sub_1002537AC((id *)&self->_tnepHandler->super.isa, self->_connectedTag);
              goto LABEL_27;
            }

            if (role == 1) {
              goto LABEL_29;
            }
          }
        }
        v12 = +[NSAssertionHandler currentHandler];
        [v12 handleFailureInMethod:a2 object:self file:@"_NFSecureTransactionServicesHandoverSession.m" lineNumber:192 description:@"Tag not handle!"];
        goto LABEL_11;
      }
      SEL v11 = [v9 tagB];

      if (v11) {
        goto LABEL_13;
      }
    }
    id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_10:
  v12 = v5;
LABEL_11:

LABEL_24:
  if (self) {
LABEL_25:
  }
    v19 = self->_driverWrapper;
  else {
    v19 = 0;
  }
  sub_1002128B4(v19);
LABEL_27:
}

+ (id)validateEntitlements:(id)a3
{
  id v5 = a3;
  if [v5 seSessionAccess] && (objc_msgSend(v5, "hceAccess"))
  {
    id v6 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", v12, ClassName, Name, 203);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v13 = NFSharedLogGetLogger();
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
      int v29 = object_getClassName(a1);
      __int16 v30 = 2082;
      v31 = sel_getName(a2);
      __int16 v32 = 1024;
      int v33 = 203;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", buf, 0x22u);
    }

    id v16 = objc_alloc((Class)NSError);
    v17 = +[NSString stringWithUTF8String:"nfcd"];
    v24[0] = NSLocalizedDescriptionKey;
    int v18 = +[NSString stringWithUTF8String:"Not entitled"];
    v25[0] = v18;
    v25[1] = &off_10031A4E8;
    v24[1] = @"Line";
    v24[2] = @"Method";
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v25[2] = v19;
    v24[3] = NSDebugDescriptionErrorKey;
    id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 204];
    v25[3] = v20;
    long long v21 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
    id v6 = [v16 initWithDomain:v17 code:32 userInfo:v21];
  }

  return v6;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig embeddedWiredMode];
}

- (void)cleanup
{
  id v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureTransactionServicesHelperSession", buf, 2u);
  }

  if ([(_NFSession *)self needsCleanup] && ![(_NFSession *)self isSuspended])
  {
    id v5 = +[_NFHardwareManager sharedHardwareManager];
    id v6 = +[NFRoutingConfig routingOffWithFD:0];
    id v7 = [v5 setRoutingConfig:v6];

    if (self)
    {
      unint64_t role = self->_role;
      if (role == 4 || role == 1)
      {
        v10 = +[_NFHardwareManager sharedHardwareManager];
        unsigned __int8 v11 = [v10 configureECPPolling:0];

        if ((v11 & 1) == 0)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            uint64_t v13 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            uint64_t v17 = 45;
            if (isMetaClass) {
              uint64_t v17 = 43;
            }
            v13(3, "%c[%{public}s %{public}s]:%i Failed to restore ECP", v17, ClassName, Name, 224);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          int v18 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            id v19 = object_getClass(self);
            if (class_isMetaClass(v19)) {
              int v20 = 43;
            }
            else {
              int v20 = 45;
            }
            long long v21 = object_getClassName(self);
            long long v22 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v28 = v20;
            __int16 v29 = 2082;
            __int16 v30 = v21;
            __int16 v31 = 2082;
            __int16 v32 = v22;
            __int16 v33 = 1024;
            int v34 = 224;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore ECP", buf, 0x22u);
          }
        }
      }
      stsHelper = self->_stsHelper;
    }
    else
    {
      stsHelper = 0;
    }
    [(STSHelperLibrary *)stsHelper invalidate];
  }
  v26.receiver = self;
  v26.super_class = (Class)_NFSecureTransactionServicesHandoverSession;
  [(_NFSession *)&v26 cleanup];
  long long v24 = NFSharedSignpostLog();
  if (os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureTransactionServicesHelperSession", buf, 2u);
  }
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
  v126.receiver = self;
  v126.super_class = (Class)_NFSecureTransactionServicesHandoverSession;
  [(_NFSession *)&v126 didStartSession:v5];
  v125[0] = _NSConcreteStackBlock;
  v125[1] = 3221225472;
  v125[2] = sub_10005D058;
  v125[3] = &unk_100301F70;
  v125[4] = self;
  v125[5] = a2;
  id v6 = objc_retainBlock(v125);
  v124[0] = _NSConcreteStackBlock;
  v124[1] = 3221225472;
  v124[2] = sub_10005D420;
  v124[3] = &unk_100301C40;
  v124[4] = self;
  v124[5] = a2;
  id v7 = objc_retainBlock(v124);
  if (!v5)
  {
    if (self)
    {
      switch(self->_role)
      {
        case 0uLL:
          goto LABEL_28;
        case 1uLL:
        case 4uLL:
          id v8 = [objc_alloc((Class)NSData) initWithBytes:&unk_1002836E8 length:6];
          v9 = +[_NFHardwareManager sharedHardwareManager];
          [v9 configureECPPolling:v8];

          if (self->_role != 1)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              v94 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v98 = 45;
              if (isMetaClass) {
                uint64_t v98 = 43;
              }
              v94(6, "%c[%{public}s %{public}s]:%i Starting TNEP reader", v98, ClassName, Name, 302);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v99 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
            {
              v100 = object_getClass(self);
              if (class_isMetaClass(v100)) {
                int v101 = 43;
              }
              else {
                int v101 = 45;
              }
              v102 = object_getClassName(self);
              v103 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v131 = v101;
              *(_WORD *)&v131[4] = 2082;
              *(void *)&v131[6] = v102;
              __int16 v132 = 2082;
              v133 = v103;
              __int16 v134 = 1024;
              int v135 = 302;
              _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting TNEP reader", buf, 0x22u);
            }

            __int16 v32 = NFSharedSignpostLog();
            unint64_t v104 = [(_NFSession *)self signpostId];
            if (v104 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
              goto LABEL_82;
            }
            os_signpost_id_t v34 = v104;
            if (!os_signpost_enabled(v32)) {
              goto LABEL_82;
            }
            *(_WORD *)buf = 0;
            v35 = "Start_TNEP_Reader";
            __int16 v36 = v32;
            os_signpost_type_t v37 = OS_SIGNPOST_EVENT;
            goto LABEL_81;
          }
          uint64_t v10 = sub_10005D648((uint64_t)self);
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v11 = NFLogGetLogger();
          if (v11)
          {
            uint64_t v12 = (void (*)(uint64_t, const char *, ...))v11;
            uint64_t v13 = object_getClass(self);
            BOOL v14 = class_isMetaClass(v13);
            v110 = object_getClassName(self);
            v111 = sel_getName(a2);
            uint64_t v15 = 45;
            if (v14) {
              uint64_t v15 = 43;
            }
            v12(6, "%c[%{public}s %{public}s]:%i Starting ISO18013 reader polling, hoConfig=0x%lx", v15, v110, v111, 284, v10);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v16 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = object_getClass(self);
            if (class_isMetaClass(v17)) {
              int v18 = 43;
            }
            else {
              int v18 = 45;
            }
            id v19 = object_getClassName(self);
            int v20 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v131 = v18;
            *(_WORD *)&v131[4] = 2082;
            *(void *)&v131[6] = v19;
            __int16 v132 = 2082;
            v133 = v20;
            __int16 v134 = 1024;
            int v135 = 284;
            __int16 v136 = 2048;
            uint64_t v137 = v10;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting ISO18013 reader polling, hoConfig=0x%lx", buf, 0x2Cu);
          }

          long long v21 = NFSharedSignpostLog();
          unint64_t v22 = [(_NFSession *)self signpostId];
          if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v23 = v22;
            if (os_signpost_enabled(v21))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, v23, "Start_ISO18013_Reader", (const char *)&unk_100286819, buf, 2u);
            }
          }

          long long v24 = self->_stsHelper;
          uint64_t v25 = [(STSHelperLibrary *)v24 startISO18013WithConnectionHandoverConfiguration:v10 type:sub_10005D810((uint64_t)self) credentialType:2 delegate:self];

          objc_super v26 = NFSharedSignpostLog();
          unint64_t v27 = [(_NFSession *)self signpostId];
          if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v28 = v27;
            if (os_signpost_enabled(v26))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v131 = v25;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v28, "Start_ISO18013_Reader", "error=%@", buf, 0xCu);
            }
          }

          if (!v25)
          {
            __int16 v29 = NFSharedSignpostLog();
            unint64_t v30 = [(_NFSession *)self signpostId];
            if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v31 = v30;
              if (os_signpost_enabled(v29))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, v31, "Start_SEProxyListener", (const char *)&unk_100286819, buf, 2u);
              }
            }

            sub_10005BEFC((uint64_t)self);
            __int16 v32 = NFSharedSignpostLog();
            unint64_t v33 = [(_NFSession *)self signpostId];
            if (v33 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
              goto LABEL_82;
            }
            os_signpost_id_t v34 = v33;
            if (!os_signpost_enabled(v32)) {
              goto LABEL_82;
            }
            *(_WORD *)buf = 0;
            v35 = "Start_SEProxyListener";
            __int16 v36 = v32;
            os_signpost_type_t v37 = OS_SIGNPOST_INTERVAL_END;
LABEL_81:
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, v37, v34, v35, (const char *)&unk_100286819, buf, 2u);
LABEL_82:

            v120[0] = _NSConcreteStackBlock;
            v120[1] = 3221225472;
            v120[2] = sub_10005D8B8;
            v120[3] = &unk_1003021D8;
            v120[4] = self;
            SEL v123 = a2;
            v121 = v6;
            v122 = v7;
            sub_10005DC10((uint64_t)self, v120);

            goto LABEL_92;
          }
          break;
        case 3uLL:
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v76 = NFLogGetLogger();
          if (v76)
          {
            v77 = (void (*)(uint64_t, const char *, ...))v76;
            v78 = object_getClass(self);
            BOOL v79 = class_isMetaClass(v78);
            v80 = object_getClassName(self);
            v114 = sel_getName(a2);
            uint64_t v81 = 45;
            if (v79) {
              uint64_t v81 = 43;
            }
            v77(6, "%c[%{public}s %{public}s]:%i Starting TNEP device", v81, v80, v114, 333);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v82 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            v83 = object_getClass(self);
            if (class_isMetaClass(v83)) {
              int v84 = 43;
            }
            else {
              int v84 = 45;
            }
            v85 = object_getClassName(self);
            v86 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v131 = v84;
            *(_WORD *)&v131[4] = 2082;
            *(void *)&v131[6] = v85;
            __int16 v132 = 2082;
            v133 = v86;
            __int16 v134 = 1024;
            int v135 = 333;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting TNEP device", buf, 0x22u);
          }

          v87 = NFSharedSignpostLog();
          unint64_t v88 = [(_NFSession *)self signpostId];
          if (v88 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_90;
          }
          os_signpost_id_t v89 = v88;
          if (!os_signpost_enabled(v87)) {
            goto LABEL_90;
          }
          *(_WORD *)buf = 0;
          v90 = "Start_TNEP_Device";
          v91 = v87;
          os_signpost_type_t v92 = OS_SIGNPOST_EVENT;
          goto LABEL_89;
        default:
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v58 = NFLogGetLogger();
          if (v58)
          {
            v59 = (void (*)(uint64_t, const char *, ...))v58;
            v60 = object_getClass(self);
            BOOL v61 = class_isMetaClass(v60);
            v62 = object_getClassName(self);
            v113 = sel_getName(a2);
            uint64_t v63 = 45;
            if (v61) {
              uint64_t v63 = 43;
            }
            v59(3, "%c[%{public}s %{public}s]:%i Invalid command", v63, v62, v113, 352);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v64 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            v65 = object_getClass(self);
            if (class_isMetaClass(v65)) {
              int v66 = 43;
            }
            else {
              int v66 = 45;
            }
            v67 = object_getClassName(self);
            v68 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v131 = v66;
            *(_WORD *)&v131[4] = 2082;
            *(void *)&v131[6] = v67;
            __int16 v132 = 2082;
            v133 = v68;
            __int16 v134 = 1024;
            int v135 = 352;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid command", buf, 0x22u);
          }

          id v69 = objc_alloc((Class)NSError);
          v70 = +[NSString stringWithUTF8String:"nfcd"];
          v127[0] = NSLocalizedDescriptionKey;
          v71 = +[NSString stringWithUTF8String:"Invalid Command"];
          v128[0] = v71;
          v128[1] = &off_10031A530;
          v127[1] = @"Line";
          v127[2] = @"Method";
          id v72 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v128[2] = v72;
          v127[3] = NSDebugDescriptionErrorKey;
          id v73 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 353];
          v128[3] = v73;
          v74 = +[NSDictionary dictionaryWithObjects:v128 forKeys:v127 count:4];
          id v75 = [v69 initWithDomain:v70 code:11 userInfo:v74];
          ((void (*)(void *, id))v6[2])(v6, v75);

          goto LABEL_92;
      }
    }
    else
    {
LABEL_28:
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v38 = NFLogGetLogger();
      if (v38)
      {
        int v39 = (void (*)(uint64_t, const char *, ...))v38;
        __int16 v40 = object_getClass(self);
        BOOL v41 = class_isMetaClass(v40);
        v42 = object_getClassName(self);
        v112 = sel_getName(a2);
        uint64_t v43 = 45;
        if (v41) {
          uint64_t v43 = 43;
        }
        v39(6, "%c[%{public}s %{public}s]:%i Starting ISO18013 device", v43, v42, v112, 316);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v44 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = object_getClass(self);
        if (class_isMetaClass(v45)) {
          int v46 = 43;
        }
        else {
          int v46 = 45;
        }
        v47 = object_getClassName(self);
        v48 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v131 = v46;
        *(_WORD *)&v131[4] = 2082;
        *(void *)&v131[6] = v47;
        __int16 v132 = 2082;
        v133 = v48;
        __int16 v134 = 1024;
        int v135 = 316;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting ISO18013 device", buf, 0x22u);
      }

      v49 = NFSharedSignpostLog();
      unint64_t v50 = [(_NFSession *)self signpostId];
      if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v51 = v50;
        if (os_signpost_enabled(v49))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_BEGIN, v51, "Start_ISO18013_Device", (const char *)&unk_100286819, buf, 2u);
        }
      }

      if (self) {
        stsHelper = self->_stsHelper;
      }
      else {
        stsHelper = 0;
      }
      v53 = stsHelper;
      uint64_t v54 = sub_10005D648((uint64_t)self);
      uint64_t v25 = [(STSHelperLibrary *)v53 startISO18013WithConnectionHandoverConfiguration:v54 type:sub_10005D810((uint64_t)self) credentialType:2 delegate:self];

      v55 = NFSharedSignpostLog();
      unint64_t v56 = [(_NFSession *)self signpostId];
      if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v57 = v56;
        if (os_signpost_enabled(v55))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v131 = v25;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_END, v57, "Start_ISO18013_Device", "error=%@", buf, 0xCu);
        }
      }

      if (!v25)
      {
        v105 = NFSharedSignpostLog();
        unint64_t v106 = [(_NFSession *)self signpostId];
        if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v107 = v106;
          if (os_signpost_enabled(v105))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v105, OS_SIGNPOST_INTERVAL_BEGIN, v107, "Start_SEProxyListener", (const char *)&unk_100286819, buf, 2u);
          }
        }

        sub_10005BEFC((uint64_t)self);
        v87 = NFSharedSignpostLog();
        unint64_t v108 = [(_NFSession *)self signpostId];
        if (v108 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v89 = v108;
          if (os_signpost_enabled(v87))
          {
            *(_WORD *)buf = 0;
            v90 = "Start_SEProxyListener";
            v91 = v87;
            os_signpost_type_t v92 = OS_SIGNPOST_INTERVAL_END;
LABEL_89:
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v91, v92, v89, v90, (const char *)&unk_100286819, buf, 2u);
          }
        }
LABEL_90:

        uint64_t v25 = +[NFTNEPService serviceWithURI:@"urn:nfc:sn:handover" minWaitTime:20 maxWaitTimeExtension:31 maxMessageSize:2048];
        v129 = v25;
        v109 = +[NSArray arrayWithObjects:&v129 count:1];
        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472;
        v116[2] = sub_10005DEB0;
        v116[3] = &unk_1003021D8;
        v116[4] = self;
        SEL v119 = a2;
        v117 = v6;
        v118 = v7;
        sub_10005E208((uint64_t)self, v109, 0, v116);

        goto LABEL_91;
      }
    }
    ((void (*)(void *, void *))v6[2])(v6, v25);
LABEL_91:

    goto LABEL_92;
  }
  ((void (*)(void *, id))v6[2])(v6, v5);
LABEL_92:
}

- (void)iso18013DataRetrievalCompleted
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 409);
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
    *(_DWORD *)buf = 67109890;
    int v18 = v12;
    __int16 v19 = 2082;
    int v20 = object_getClassName(self);
    __int16 v21 = 2082;
    unint64_t v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 409;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  uint64_t v13 = +[_NFHardwareManager sharedHardwareManager];
  BOOL v14 = +[NFRoutingConfig embeddedWiredMode];
  id v15 = [v13 setRoutingConfig:v14];
}

- (void)relinquishSEProxy
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 416);
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
    *(_DWORD *)buf = 67109890;
    int v15 = v12;
    __int16 v16 = 2082;
    uint64_t v17 = object_getClassName(self);
    __int16 v18 = 2082;
    __int16 v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 416;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  if (self)
  {
    [(STSHelperLibrary *)self->_stsHelper stopSEProxyListener];
    objc_storeStrong((id *)&self->_seProxyListener, 0);
  }
  else
  {
    [0 stopSEProxyListener];
  }
}

- (void)restartNFCReaderDiscovery
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 424);
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
    *(_DWORD *)buf = 67109890;
    int v15 = v12;
    __int16 v16 = 2082;
    uint64_t v17 = object_getClassName(self);
    __int16 v18 = 2082;
    __int16 v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 424;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  sub_1002128B4(self->_driverWrapper);
}

- (void)reqlinquishNFCReaderProxy
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 430);
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
    *(_DWORD *)buf = 67109890;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = object_getClassName(self);
    __int16 v21 = 2082;
    unint64_t v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 430;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  uint64_t v13 = +[_NFHardwareManager sharedHardwareManager];
  BOOL v14 = +[NFRoutingConfig routingOff];
  id v15 = [v13 setRoutingConfig:v14];
}

- (void)coreDuetActivityRevoked
{
  BOOL v3 = [(_NFSession *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F060;
  block[3] = &unk_100301C68;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)startTNEPDeviceWithServices:(id)a3 optionalRecords:(id)a4 callback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = [(_NFSession *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F210;
  block[3] = &unk_100302250;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

- (void)tnepTagDeviceSendNDEFMessage:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(_NFSession *)self workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005FA2C;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)startTNEPReaderWithCallback:(id)a3
{
  id v5 = a3;
  id v6 = [(_NFSession *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000600D4;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)tnepReaderSelectService:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(_NFSession *)self workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100060694;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)tnepReaderDeselectWithCallback:(id)a3
{
  id v5 = a3;
  id v6 = [(_NFSession *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060D24;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)tnepReaderSend:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(_NFSession *)self workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000613C4;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)tnepReaderRestartPollingWithCallback:(id)a3
{
  id v5 = a3;
  id v6 = [(_NFSession *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061A44;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)tnepServiceInvalidate
{
  if (![(_NFSession *)self didStart]
    || [(_NFSession *)self isSuspended]
    || [(_NFSession *)self didEnd])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v7 = 43;
      }
      else {
        uint64_t v7 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      SEL v10 = [(_NFSession *)self sessionUID];
      v5(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v7, ClassName, Name, 579, v10);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      id v14 = object_getClassName(self);
      SEL v15 = sel_getName(a2);
      __int16 v16 = [(_NFSession *)self sessionUID];
      LODWORD(buf) = 67110146;
      HIDWORD(buf) = v13;
      __int16 v31 = 2082;
      __int16 v32 = v14;
      __int16 v33 = 2082;
      os_signpost_id_t v34 = v15;
      __int16 v35 = 1024;
      int v36 = 579;
      __int16 v37 = 2114;
      uint64_t v38 = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", (uint8_t *)&buf, 0x2Cu);
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v17 = NFLogGetLogger();
    if (v17)
    {
      id v18 = (void (*)(uint64_t, const char *, ...))v17;
      id v19 = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(v19);
      __int16 v21 = object_getClassName(self);
      unint64_t v27 = sel_getName(a2);
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v18(6, "%c[%{public}s %{public}s]:%i ", v22, v21, v27, 581);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v25;
      __int16 v31 = 2082;
      __int16 v32 = object_getClassName(self);
      __int16 v33 = 2082;
      os_signpost_id_t v34 = sel_getName(a2);
      __int16 v35 = 1024;
      int v36 = 581;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", (uint8_t *)&buf, 0x22u);
    }

    objc_initWeak(&buf, self);
    objc_super v26 = [(_NFSession *)self workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100062414;
    block[3] = &unk_1003022A0;
    objc_copyWeak(v29, &buf);
    v29[1] = (id)a2;
    dispatch_async(v26, block);

    objc_destroyWeak(v29);
    objc_destroyWeak(&buf);
  }
}

- (void)tnepTagDeviceReaderDetected
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 600);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  SEL v10 = NFSharedLogGetLogger();
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
    int v15 = v12;
    __int16 v16 = 2082;
    uint64_t v17 = object_getClassName(self);
    __int16 v18 = 2082;
    id v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 600;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }
}

- (void)tnepTagDeviceSelected:(id)a3 respondHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, void))a4;
  unsigned int v9 = [v7 isEqualToString:@"urn:nfc:sn:handover"];
  uint64_t v10 = v9 ^ 1;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v16 = 45;
    if (isMetaClass) {
      uint64_t v16 = 43;
    }
    v12(6, "%c[%{public}s %{public}s]:%i service=%{public}@, status=%ld", v16, ClassName, Name, 610, v7, v10);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    *(_DWORD *)id buf = 67110402;
    int v24 = v19;
    __int16 v25 = 2082;
    objc_super v26 = object_getClassName(self);
    __int16 v27 = 2082;
    os_signpost_id_t v28 = sel_getName(a2);
    __int16 v29 = 1024;
    int v30 = 610;
    __int16 v31 = 2114;
    id v32 = v7;
    __int16 v33 = 2048;
    uint64_t v34 = v9 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i service=%{public}@, status=%ld", buf, 0x36u);
  }

  if (v9)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000629F4;
    v22[3] = &unk_100301F70;
    v22[4] = self;
    v22[5] = a2;
    __int16 v20 = sub_10005B180(self, v22);
    [v20 connectionHandoverTNEPServiceSelected:@"urn:nfc:sn:handover"];
  }
  v8[2](v8, v10, 0);
}

- (void)tnepTagDeviceDeselected:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v9 = 43;
    }
    else {
      uint64_t v9 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    if (self) {
      deviceHandoverSelectError = self->_deviceHandoverSelectError;
    }
    else {
      deviceHandoverSelectError = 0;
    }
    v7(6, "%c[%{public}s %{public}s]:%i CH status=%{public}@, link error=%{public}@", v9, ClassName, Name, 624, deviceHandoverSelectError, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    uint64_t v16 = object_getClassName(self);
    uint64_t v17 = sel_getName(a2);
    if (self) {
      __int16 v18 = self->_deviceHandoverSelectError;
    }
    else {
      __int16 v18 = 0;
    }
    *(_DWORD *)id buf = 67110402;
    *(_DWORD *)&uint8_t buf[4] = v15;
    __int16 v33 = 2082;
    uint64_t v34 = v16;
    __int16 v35 = 2082;
    int v36 = v17;
    __int16 v37 = 1024;
    int v38 = 624;
    __int16 v39 = 2114;
    __int16 v40 = v18;
    __int16 v41 = 2114;
    id v42 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i CH status=%{public}@, link error=%{public}@", buf, 0x36u);
  }

  if (self && self->_deviceHandoverSelectError)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100063040;
    v31[3] = &unk_100301F70;
    v31[4] = self;
    v31[5] = a2;
    int v19 = sub_10005B180(self, v31);
    [v19 connectionHandoverProcessFailure:self->_deviceHandoverSelectError];

    sub_1000631D8((uint64_t)self, 0);
  }
  else if (v5)
  {
    if ([v5 code] == (id)28)
    {
      uint64_t v20 = STS_XCPHELPER_ERROR_DOMAIN;
      NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
      *(void *)id buf = STSXPCHelperErrorDescriptions[8];
      int v21 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v43 count:1];
      uint64_t v22 = v20;
      uint64_t v23 = 8;
    }
    else if ([v5 code] == (id)62 || objc_msgSend(v5, "code") == (id)59)
    {
      uint64_t v25 = STS_XCPHELPER_ERROR_DOMAIN;
      NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
      *(void *)id buf = STSXPCHelperErrorDescriptions[2];
      int v21 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v43 count:1];
      uint64_t v22 = v25;
      uint64_t v23 = 2;
    }
    else
    {
      uint64_t v26 = STS_XCPHELPER_ERROR_DOMAIN;
      NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
      *(void *)id buf = STSXPCHelperErrorDescriptions[10];
      int v21 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v43 count:1];
      uint64_t v22 = v26;
      uint64_t v23 = 10;
    }
    __int16 v27 = +[NSError errorWithDomain:v22 code:v23 userInfo:v21];

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000631F0;
    v30[3] = &unk_100301F70;
    v30[4] = self;
    v30[5] = a2;
    os_signpost_id_t v28 = sub_10005B180(self, v30);
    [v28 connectionHandoverProcessFailure:v27];
  }
  else
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    id v29[2] = sub_100063388;
    v29[3] = &unk_100301F70;
    v29[4] = self;
    v29[5] = a2;
    int v24 = sub_10005B180(self, v29);
    [v24 connectionHandoverProcessCompleted];
  }
}

- (void)tnepTagDeviceNDEFMessageReceived:(id)a3
{
  id v5 = a3;
  id v6 = NFSharedSignpostLog();
  unint64_t v7 = [(_NFSession *)self signpostId];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CH_Negotiation", (const char *)&unk_100286819, buf, 2u);
    }
  }

  if (self) {
    stsHelper = self->_stsHelper;
  }
  else {
    stsHelper = 0;
  }
  uint64_t v10 = stsHelper;
  id v11 = [v5 asData];

  int v12 = [(_NFSession *)self workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100063678;
  v13[3] = &unk_1003022F0;
  v13[4] = self;
  v13[5] = a2;
  [(STSHelperLibrary *)v10 processConnectionHandoverRequestData:v11 callbackQueue:v12 responseHandler:v13];
}

- (void)tnepReaderServicesDiscovered:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    unint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i services=%{public}@", v10, ClassName, Name, 685, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
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
    int v48 = v13;
    __int16 v49 = 2082;
    unint64_t v50 = object_getClassName(self);
    __int16 v51 = 2082;
    v52 = sel_getName(a2);
    __int16 v53 = 1024;
    int v54 = 685;
    __int16 v55 = 2114;
    id v56 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i services=%{public}@", buf, 0x2Cu);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v14 = v5;
  id v15 = [v14 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v43;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(v14);
        }
        if ([*(id *)(*((void *)&v42 + 1) + 8 * i) isEqualToString:@"urn:nfc:sn:handover"])
        {

          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_100064274;
          v41[3] = &unk_100301F70;
          v41[4] = self;
          v41[5] = a2;
          int v30 = objc_retainBlock(v41);
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100064694;
          v40[3] = &unk_100301F70;
          v40[4] = self;
          v40[5] = a2;
          __int16 v31 = sub_10005B180(self, v40);
          [v31 connectionHandoverTNEPServiceSelected:@"urn:nfc:sn:handover"];

          if (self) {
            tnepHandler = self->_tnepHandler;
          }
          else {
            tnepHandler = 0;
          }
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_10006482C;
          v37[3] = &unk_100302228;
          id v38 = v30;
          SEL v39 = a2;
          v37[4] = self;
          __int16 v33 = v30;
          [(NFTNEPHandler *)tnepHandler tnepReaderSelectService:@"urn:nfc:sn:handover" callback:v37];

          goto LABEL_31;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v19 = NFLogGetLogger();
  if (v19)
  {
    uint64_t v20 = (void (*)(uint64_t, const char *, ...))v19;
    int v21 = object_getClass(self);
    BOOL v22 = class_isMetaClass(v21);
    uint64_t v23 = object_getClassName(self);
    int v36 = sel_getName(a2);
    uint64_t v24 = 45;
    if (v22) {
      uint64_t v24 = 43;
    }
    v20(4, "%c[%{public}s %{public}s]:%i No matching service found", v24, v23, v36, 696);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = object_getClass(self);
    if (class_isMetaClass(v26)) {
      int v27 = 43;
    }
    else {
      int v27 = 45;
    }
    os_signpost_id_t v28 = object_getClassName(self);
    __int16 v29 = sel_getName(a2);
    *(_DWORD *)id buf = 67109890;
    int v48 = v27;
    __int16 v49 = 2082;
    unint64_t v50 = v28;
    __int16 v51 = 2082;
    v52 = v29;
    __int16 v53 = 1024;
    int v54 = 696;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No matching service found", buf, 0x22u);
  }

LABEL_31:
}

- (void)staticReaderEngagementDiscovered:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    unint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i handover select = %@", v10, ClassName, Name, 767, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
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
    int v22 = v13;
    __int16 v23 = 2082;
    uint64_t v24 = object_getClassName(self);
    __int16 v25 = 2082;
    uint64_t v26 = sel_getName(a2);
    __int16 v27 = 1024;
    int v28 = 767;
    __int16 v29 = 2112;
    id v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i handover select = %@", buf, 0x2Cu);
  }

  if (self) {
    stsHelper = self->_stsHelper;
  }
  else {
    stsHelper = 0;
  }
  id v15 = stsHelper;
  id v16 = [v5 asData];
  uint64_t v17 = [(_NFSession *)self workQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000657D8;
  v20[3] = &unk_100301F70;
  v20[4] = self;
  v20[5] = a2;
  [(STSHelperLibrary *)v15 connectRemoteWithConnectionHandoverSelect:v16 callbackQueue:v17 responseHandler:v20];
}

- (void)tnepReaderServicesAborted:(id)a3
{
  id v5 = a3;
  id v6 = NFSharedSignpostLog();
  unint64_t v7 = [(_NFSession *)self signpostId];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, v8, "ReaderServicesAborted", (const char *)&unk_100286819, buf, 2u);
    }
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v10(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v13, ClassName, Name, 790, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    uint64_t v17 = object_getClassName(self);
    __int16 v18 = sel_getName(a2);
    *(_DWORD *)id buf = 67110146;
    int v24 = v16;
    __int16 v25 = 2082;
    uint64_t v26 = v17;
    __int16 v27 = 2082;
    int v28 = v18;
    __int16 v29 = 1024;
    int v30 = 790;
    __int16 v31 = 2114;
    id v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100065FF4;
  v22[3] = &unk_100301F70;
  v22[4] = self;
  v22[5] = a2;
  uint64_t v19 = sub_10005B180(self, v22);
  [v19 tnepReaderServicesAborted:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceHandoverSelectError, 0);
  objc_storeStrong((id *)&self->_seProxyListener, 0);
  objc_storeStrong((id *)&self->_tnepHandler, 0);
  objc_storeStrong((id *)&self->_connectedTag, 0);
  objc_storeStrong((id *)&self->_stsHelper, 0);
  objc_storeStrong((id *)&self->_seWrapper, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);

  objc_storeStrong((id *)&self->_powerConsumptionReporter, 0);
}

@end