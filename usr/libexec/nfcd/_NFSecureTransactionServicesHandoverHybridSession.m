@interface _NFSecureTransactionServicesHandoverHybridSession
+ (BOOL)isRoleValid:(unint64_t)a3;
+ (id)validateEntitlements:(id)a3;
- (BOOL)willStartSession;
- (NFDriverWrapper)driverWrapper;
- (NFSecureElementProxyListener)seProxyListener;
- (NFSecureElementWrapper)seWrapper;
- (NFTNEPHandler)tnepHandler;
- (NFTagInternal)connectedTag;
- (NSError)deviceHandoverSelectError;
- (STSHelperLibrary)stsHelper;
- (_NFSecureTransactionServicesHandoverHybridSession)initWithRemoteObject:(id)a3 role:(unint64_t)a4 type:(unint64_t)a5 expressModeManager:(id)a6 seWrapper:(id)a7 driverWrapper:(id)a8 workQueue:(id)a9;
- (id)_asynchronousRemoteProxyWithErrorHandler:(id)a3;
- (id)_synchronousRemoteProxyWithErrorHandler:(id)a3;
- (id)createCHSelectErrorMessage;
- (id)initialRoutingConfig;
- (unint64_t)defaultEmulationType;
- (unint64_t)getCHConfig;
- (unint64_t)getSTSHelperOperation;
- (unint64_t)role;
- (unint64_t)type;
- (void)_setReaderECP;
- (void)_startSEProxyListener;
- (void)_startTNEPDeviceWithServices:(id)a3 optionalRecords:(id)a4 callback:(id)a5;
- (void)_startTNEPReaderWithCallback:(id)a3;
- (void)cleanup;
- (void)coreDuetActivityRevoked;
- (void)didStartSession:(id)a3;
- (void)enablePlasticCardMode:(BOOL)a3 completion:(id)a4;
- (void)endSession:(id)a3;
- (void)getAppletsWithCompletion:(id)a3;
- (void)getFelicaAppletState:(id)a3 completion:(id)a4;
- (void)getTransitAppletState:(id)a3 completion:(id)a4;
- (void)handleFieldChanged:(BOOL)a3;
- (void)handleFieldNotification:(id)a3;
- (void)handleHostCardReaderDetected:(id)a3;
- (void)handleReaderBurnoutCleared;
- (void)handleReaderBurnoutTimer;
- (void)handleRemoteTagsDetected:(id)a3;
- (void)iso18013DataRetrievalCompleted;
- (void)relinquishSEProxy;
- (void)reqlinquishNFCReaderProxy;
- (void)restartNFCReaderDiscovery;
- (void)setConnectedTag:(id)a3;
- (void)setDeviceHandoverSelectError:(id)a3;
- (void)setDriverWrapper:(id)a3;
- (void)setRole:(unint64_t)a3;
- (void)setSeProxyListener:(id)a3;
- (void)setSeWrapper:(id)a3;
- (void)setStsHelper:(id)a3;
- (void)setTnepHandler:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)startDeferredCardEmulationWithAuthorization:(id)a3 completion:(id)a4;
- (void)startExpressModeWithCompletion:(id)a3;
- (void)startHCEProcessingWithDevice:(id)a3 completion:(id)a4;
- (void)startHostCardEmulationWithCompletion:(id)a3;
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

@implementation _NFSecureTransactionServicesHandoverHybridSession

- (_NFSecureTransactionServicesHandoverHybridSession)initWithRemoteObject:(id)a3 role:(unint64_t)a4 type:(unint64_t)a5 expressModeManager:(id)a6 seWrapper:(id)a7 driverWrapper:(id)a8 workQueue:(id)a9
{
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)_NFSecureTransactionServicesHandoverHybridSession;
  v18 = [(_NFXPCSession *)&v21 initWithRemoteObject:a3 workQueue:a9 expressModeManager:a6 allowsBackgroundMode:1];
  v19 = v18;
  if (v18)
  {
    *(void *)(v18 + 363) = a4;
    *(void *)(v18 + 371) = a5;
    objc_storeStrong((id *)(v18 + 387), a7);
    objc_storeStrong((id *)(v19 + 379), a8);
  }

  return (_NFSecureTransactionServicesHandoverHybridSession *)v19;
}

+ (BOOL)isRoleValid:(unint64_t)a3
{
  return a3 == 3 || a3 == 0;
}

- (BOOL)willStartSession
{
  v3 = objc_opt_new();
  [(_NFSecureTransactionServicesHandoverHybridSession *)self setStsHelper:v3];

  v5.receiver = self;
  v5.super_class = (Class)_NFSecureTransactionServicesHandoverHybridSession;
  return [(_NFContactlessSession *)&v5 willStartSession];
}

- (void)endSession:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_NFSecureTransactionServicesHandoverHybridSession *)self stsHelper];
  [v5 invalidate];

  [(_NFSecureTransactionServicesHandoverHybridSession *)self setStsHelper:0];
  v6.receiver = self;
  v6.super_class = (Class)_NFSecureTransactionServicesHandoverHybridSession;
  [(_NFXPCSession *)&v6 endSession:v4];
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
      v7(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v13, ClassName, Name, 99, v12);
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
      id v17 = object_getClassName(self);
      v18 = sel_getName(a2);
      v19 = [(_NFSession *)self sessionUID];
      *(_DWORD *)buf = 67110146;
      int v32 = v16;
      __int16 v33 = 2082;
      v34 = v17;
      __int16 v35 = 2082;
      v36 = v18;
      __int16 v37 = 1024;
      int v38 = 99;
      __int16 v39 = 2114;
      v40 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v20 = NFLogGetLogger();
    if (v20)
    {
      objc_super v21 = (void (*)(uint64_t, const char *, ...))v20;
      v22 = object_getClass(self);
      BOOL v23 = class_isMetaClass(v22);
      v24 = object_getClassName(self);
      v30 = sel_getName(a2);
      uint64_t v25 = 45;
      if (v23) {
        uint64_t v25 = 43;
      }
      v21(6, "%c[%{public}s %{public}s]:%i ", v25, v24, v30, 102);
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
      int v32 = v28;
      __int16 v33 = 2082;
      v34 = object_getClassName(self);
      __int16 v35 = 2082;
      v36 = sel_getName(a2);
      __int16 v37 = 1024;
      int v38 = 102;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    v14 = [(_NFSecureTransactionServicesHandoverHybridSession *)self stsHelper];
    id v29 = [v14 connectToNotificationListener:v5];
  }
}

- (void)getAppletsWithCompletion:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_NFSecureTransactionServicesHandoverHybridSession;
  [(_NFContactlessPaymentSession *)&v3 getAppletsWithCompletion:a3];
}

- (void)startDeferredCardEmulationWithAuthorization:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)NSError);
  v8 = +[NSString stringWithUTF8String:"nfcd"];
  v14[0] = NSLocalizedDescriptionKey;
  v9 = +[NSString stringWithUTF8String:"Feature Not Supported"];
  v15[0] = v9;
  v15[1] = &off_10031FF60;
  v14[1] = @"Line";
  v14[2] = @"Method";
  id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v15[2] = v10;
  v14[3] = NSDebugDescriptionErrorKey;
  id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 119];
  v15[3] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  id v13 = [v7 initWithDomain:v8 code:14 userInfo:v12];
  (*((void (**)(id, id))a4 + 2))(v6, v13);
}

- (void)startHostCardEmulationWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc((Class)NSError);
  id v7 = +[NSString stringWithUTF8String:"nfcd"];
  v13[0] = NSLocalizedDescriptionKey;
  v8 = +[NSString stringWithUTF8String:"Feature Not Supported"];
  v14[0] = v8;
  v14[1] = &off_10031FF78;
  v13[1] = @"Line";
  v13[2] = @"Method";
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v14[2] = v9;
  v13[3] = NSDebugDescriptionErrorKey;
  id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 125];
  v14[3] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  id v12 = [v6 initWithDomain:v7 code:14 userInfo:v11];
  (*((void (**)(id, id))a3 + 2))(v5, v12);
}

- (void)getFelicaAppletState:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)NSError);
  v8 = +[NSString stringWithUTF8String:"nfcd"];
  v14[0] = NSLocalizedDescriptionKey;
  id v9 = +[NSString stringWithUTF8String:"Feature Not Supported"];
  v15[0] = v9;
  v15[1] = &off_10031FF90;
  v14[1] = @"Line";
  v14[2] = @"Method";
  id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v15[2] = v10;
  v14[3] = NSDebugDescriptionErrorKey;
  id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 131];
  v15[3] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  id v13 = [v7 initWithDomain:v8 code:14 userInfo:v12];
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v13);
}

- (void)getTransitAppletState:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)NSError);
  v8 = +[NSString stringWithUTF8String:"nfcd"];
  v14[0] = NSLocalizedDescriptionKey;
  id v9 = +[NSString stringWithUTF8String:"Feature Not Supported"];
  v15[0] = v9;
  v15[1] = &off_10031FFA8;
  v14[1] = @"Line";
  v14[2] = @"Method";
  id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v15[2] = v10;
  v14[3] = NSDebugDescriptionErrorKey;
  id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 137];
  v15[3] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  id v13 = [v7 initWithDomain:v8 code:14 userInfo:v12];
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v13);
}

- (void)enablePlasticCardMode:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)NSError);
  v8 = +[NSString stringWithUTF8String:"nfcd"];
  v14[0] = NSLocalizedDescriptionKey;
  id v9 = +[NSString stringWithUTF8String:"Feature Not Supported"];
  v15[0] = v9;
  v15[1] = &off_10031FFC0;
  v14[1] = @"Line";
  v14[2] = @"Method";
  id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v15[2] = v10;
  v14[3] = NSDebugDescriptionErrorKey;
  id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 143];
  v15[3] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  id v13 = [v7 initWithDomain:v8 code:14 userInfo:v12];
  (*((void (**)(id, id))a4 + 2))(v6, v13);
}

- (void)startExpressModeWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc((Class)NSError);
  id v7 = +[NSString stringWithUTF8String:"nfcd"];
  v13[0] = NSLocalizedDescriptionKey;
  v8 = +[NSString stringWithUTF8String:"Feature Not Supported"];
  v14[0] = v8;
  v14[1] = &off_10031FFD8;
  v13[1] = @"Line";
  v13[2] = @"Method";
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v14[2] = v9;
  v13[3] = NSDebugDescriptionErrorKey;
  id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 149];
  v14[3] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  id v12 = [v6 initWithDomain:v7 code:14 userInfo:v11];
  (*((void (**)(id, id))a3 + 2))(v5, v12);
}

- (void)handleFieldChanged:(BOOL)a3
{
  BOOL v3 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100230B00;
  v5[3] = &unk_100301F70;
  v5[4] = self;
  v5[5] = a2;
  id v4 = [(_NFSecureTransactionServicesHandoverHybridSession *)self _asynchronousRemoteProxyWithErrorHandler:v5];
  [v4 fieldChange:v3];
}

- (void)handleFieldNotification:(id)a3
{
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_100230D34;
  id v9 = &unk_100301F70;
  id v10 = self;
  SEL v11 = a2;
  id v4 = a3;
  id v5 = [(_NFSecureTransactionServicesHandoverHybridSession *)self _asynchronousRemoteProxyWithErrorHandler:&v6];
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
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, v7, "ReaderDetected", (const char *)&unk_100286819, v8, 2u);
    }
  }

  [(_NFSecureTransactionServicesHandoverHybridSession *)self startHCEProcessingWithDevice:v4 completion:0];
}

- (void)handleRemoteTagsDetected:(id)a3
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v7 = *(void *)v26;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      id v10 = [v9 tagA];
      if (v10)
      {

LABEL_13:
        id v6 = v9;

        if (!v6) {
          goto LABEL_16;
        }
        id v13 = [(_NFSecureTransactionServicesHandoverHybridSession *)self driverWrapper];
        if (v13)
        {
          v14 = v13;
          int v15 = sub_10018FAE8(v13, v6, 0);

          if (v15) {
            goto LABEL_16;
          }
        }
        id v17 = NFSharedSignpostLog();
        unint64_t v18 = [(_NFSession *)self signpostId];
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v19 = v18;
          if (os_signpost_enabled(v17))
          {
            *(_WORD *)v24 = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, v19, "TargetTagDetected", (const char *)&unk_100286819, v24, 2u);
          }
        }

        [(_NFSecureTransactionServicesHandoverHybridSession *)self setConnectedTag:v6];
        uint64_t v20 = [(_NFSecureTransactionServicesHandoverHybridSession *)self tnepHandler];
        if (v20)
        {
          objc_super v21 = (void *)v20;
          if ((id)[(_NFSecureTransactionServicesHandoverHybridSession *)self role] == (id)4)
          {

LABEL_25:
            int v16 = [(_NFSecureTransactionServicesHandoverHybridSession *)self tnepHandler];
            BOOL v23 = [(_NFSecureTransactionServicesHandoverHybridSession *)self connectedTag];
            sub_1002537AC(v16, v23);

            goto LABEL_17;
          }
          unint64_t v22 = [(_NFSecureTransactionServicesHandoverHybridSession *)self role];

          if (v22 == 1) {
            goto LABEL_25;
          }
        }
        id v12 = +[NSAssertionHandler currentHandler];
        [v12 handleFailureInMethod:a2 object:self file:@"_NFSecureTransactionServicesHandoverHybridSession.m" lineNumber:220 description:@"Tag not handle!"];
        goto LABEL_11;
      }
      SEL v11 = [v9 tagB];

      if (v11) {
        goto LABEL_13;
      }
    }
    id v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_10:
  id v12 = v5;
LABEL_11:

LABEL_16:
  int v16 = [(_NFSecureTransactionServicesHandoverHybridSession *)self driverWrapper];
  sub_1002128B4(v16);
LABEL_17:
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
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", v12, ClassName, Name, 232);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v13 = NFSharedLogGetLogger();
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
      id v29 = object_getClassName(a1);
      __int16 v30 = 2082;
      v31 = sel_getName(a2);
      __int16 v32 = 1024;
      int v33 = 232;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", buf, 0x22u);
    }

    id v16 = objc_alloc((Class)NSError);
    id v17 = +[NSString stringWithUTF8String:"nfcd"];
    v24[0] = NSLocalizedDescriptionKey;
    unint64_t v18 = +[NSString stringWithUTF8String:"Not entitled"];
    v25[0] = v18;
    v25[1] = &off_10031FFF0;
    v24[1] = @"Line";
    v24[2] = @"Method";
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v25[2] = v19;
    v24[3] = NSDebugDescriptionErrorKey;
    id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 233];
    v25[3] = v20;
    objc_super v21 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
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

    if ((id)[(_NFSecureTransactionServicesHandoverHybridSession *)self role] == (id)1
      || (id)[(_NFSecureTransactionServicesHandoverHybridSession *)self role] == (id)4)
    {
      v8 = +[_NFHardwareManager sharedHardwareManager];
      unsigned __int8 v9 = [v8 configureECPPolling:0];

      if ((v9 & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          SEL v11 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          uint64_t v15 = 45;
          if (isMetaClass) {
            uint64_t v15 = 43;
          }
          v11(3, "%c[%{public}s %{public}s]:%i Failed to restore ECP", v15, ClassName, Name, 253);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v16 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = object_getClass(self);
          if (class_isMetaClass(v17)) {
            int v18 = 43;
          }
          else {
            int v18 = 45;
          }
          id v19 = object_getClassName(self);
          id v20 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v26 = v18;
          __int16 v27 = 2082;
          __int16 v28 = v19;
          __int16 v29 = 2082;
          __int16 v30 = v20;
          __int16 v31 = 1024;
          int v32 = 253;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore ECP", buf, 0x22u);
        }
      }
    }
    objc_super v21 = [(_NFSecureTransactionServicesHandoverHybridSession *)self stsHelper];
    [v21 invalidate];
  }
  v24.receiver = self;
  v24.super_class = (Class)_NFSecureTransactionServicesHandoverHybridSession;
  [(_NFContactlessPaymentSession *)&v24 cleanup];
  unint64_t v22 = NFSharedSignpostLog();
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureTransactionServicesHelperSession", buf, 2u);
  }
}

- (void)_setReaderECP
{
  id v3 = [objc_alloc((Class)NSData) initWithBytes:&unk_1002844D0 length:6];
  v2 = +[_NFHardwareManager sharedHardwareManager];
  [v2 configureECPPolling:v3];
}

- (void)_startSEProxyListener
{
  id v4 = [NFSecureElementProxyListener alloc];
  id v5 = [(_NFSecureTransactionServicesHandoverHybridSession *)self driverWrapper];
  id v6 = [(NFSecureElementProxyListener *)v4 initWithDriverWrapper:v5];
  [(_NFSecureTransactionServicesHandoverHybridSession *)self setSeProxyListener:v6];

  id v7 = [(_NFSecureTransactionServicesHandoverHybridSession *)self stsHelper];
  v8 = [(_NFSecureTransactionServicesHandoverHybridSession *)self seProxyListener];
  unsigned __int8 v9 = [(_NFSession *)self workQueue];
  id v10 = [v7 startSEProxyListener:v8 parameters:&__NSDictionary0__struct workQueue:v9];

  if (v10)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v12(3, "%c[%{public}s %{public}s]:%i SE proxy listener start error=%{public}@", v15, ClassName, Name, 278, v10);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v22 = v18;
      __int16 v23 = 2082;
      objc_super v24 = object_getClassName(self);
      __int16 v25 = 2082;
      int v26 = sel_getName(a2);
      __int16 v27 = 1024;
      int v28 = 278;
      __int16 v29 = 2114;
      __int16 v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SE proxy listener start error=%{public}@", buf, 0x2Cu);
    }
  }
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
  v121.receiver = self;
  v121.super_class = (Class)_NFSecureTransactionServicesHandoverHybridSession;
  [(_NFContactlessPaymentSession *)&v121 didStartSession:v5];
  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472;
  v120[2] = sub_1002329AC;
  v120[3] = &unk_100301F70;
  v120[4] = self;
  v120[5] = a2;
  id v6 = objc_retainBlock(v120);
  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472;
  v119[2] = sub_100232D6C;
  v119[3] = &unk_100301C40;
  v119[4] = self;
  v119[5] = a2;
  id v7 = objc_retainBlock(v119);
  if (v5)
  {
    ((void (*)(void *, id))v6[2])(v6, v5);
    goto LABEL_93;
  }
  if ((id)[(_NFSecureTransactionServicesHandoverHybridSession *)self role] == (id)1
    || (id)[(_NFSecureTransactionServicesHandoverHybridSession *)self role] == (id)4)
  {
    [(_NFSecureTransactionServicesHandoverHybridSession *)self _setReaderECP];
    if ((id)[(_NFSecureTransactionServicesHandoverHybridSession *)self role] == (id)1)
    {
      unint64_t v8 = [(_NFSecureTransactionServicesHandoverHybridSession *)self getCHConfig];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        id v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v13 = 45;
        if (isMetaClass) {
          uint64_t v13 = 43;
        }
        v10(6, "%c[%{public}s %{public}s]:%i Starting ISO18013 reader polling, hoConfig=0x%lx", v13, ClassName, Name, 313, v8);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = object_getClass(self);
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        id v17 = object_getClassName(self);
        int v18 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v126 = v16;
        *(_WORD *)&v126[4] = 2082;
        *(void *)&v126[6] = v17;
        __int16 v127 = 2082;
        v128 = v18;
        __int16 v129 = 1024;
        int v130 = 313;
        __int16 v131 = 2048;
        unint64_t v132 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting ISO18013 reader polling, hoConfig=0x%lx", buf, 0x2Cu);
      }

      id v19 = NFSharedSignpostLog();
      unint64_t v20 = [(_NFSession *)self signpostId];
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v21 = v20;
        if (os_signpost_enabled(v19))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "Start_ISO18013_Reader", (const char *)&unk_100286819, buf, 2u);
        }
      }

      int v22 = [(_NFSecureTransactionServicesHandoverHybridSession *)self stsHelper];
      __int16 v23 = [v22 startISO18013WithConnectionHandoverConfiguration:v8 type:-[_NFSecureTransactionServicesHandoverHybridSession getSTSHelperOperation] credentialType:5 delegate:self];

      objc_super v24 = NFSharedSignpostLog();
      unint64_t v25 = [(_NFSession *)self signpostId];
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v26 = v25;
        if (os_signpost_enabled(v24))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v126 = v23;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v26, "Start_ISO18013_Reader", "error=%@", buf, 0xCu);
        }
      }

      if (v23)
      {
LABEL_22:
        ((void (*)(void *, void *))v6[2])(v6, v23);
LABEL_92:

        goto LABEL_93;
      }
      v62 = NFSharedSignpostLog();
      unint64_t v63 = [(_NFSession *)self signpostId];
      if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v64 = v63;
        if (os_signpost_enabled(v62))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v62, OS_SIGNPOST_INTERVAL_BEGIN, v64, "Start_SEProxyListener", (const char *)&unk_100286819, buf, 2u);
        }
      }

      [(_NFSecureTransactionServicesHandoverHybridSession *)self _startSEProxyListener];
      int v38 = NFSharedSignpostLog();
      unint64_t v65 = [(_NFSession *)self signpostId];
      if (v65 - 1 > 0xFFFFFFFFFFFFFFFDLL || (os_signpost_id_t v40 = v65, !os_signpost_enabled(v38)))
      {
LABEL_58:

        v115[0] = _NSConcreteStackBlock;
        v115[1] = 3221225472;
        v115[2] = sub_100232F94;
        v115[3] = &unk_1003021D8;
        v115[4] = self;
        SEL v118 = a2;
        v116 = v6;
        v117 = v7;
        [(_NFSecureTransactionServicesHandoverHybridSession *)self _startTNEPReaderWithCallback:v115];

        goto LABEL_93;
      }
      *(_WORD *)buf = 0;
      v41 = "Start_SEProxyListener";
      v42 = v38;
      os_signpost_type_t v43 = OS_SIGNPOST_INTERVAL_END;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v27 = NFLogGetLogger();
      if (v27)
      {
        int v28 = (void (*)(uint64_t, const char *, ...))v27;
        __int16 v29 = object_getClass(self);
        BOOL v30 = class_isMetaClass(v29);
        __int16 v31 = object_getClassName(self);
        v107 = sel_getName(a2);
        uint64_t v32 = 45;
        if (v30) {
          uint64_t v32 = 43;
        }
        v28(6, "%c[%{public}s %{public}s]:%i Starting TNEP reader", v32, v31, v107, 331);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v33 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = object_getClass(self);
        if (class_isMetaClass(v34)) {
          int v35 = 43;
        }
        else {
          int v35 = 45;
        }
        v36 = object_getClassName(self);
        __int16 v37 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v126 = v35;
        *(_WORD *)&v126[4] = 2082;
        *(void *)&v126[6] = v36;
        __int16 v127 = 2082;
        v128 = v37;
        __int16 v129 = 1024;
        int v130 = 331;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting TNEP reader", buf, 0x22u);
      }

      int v38 = NFSharedSignpostLog();
      unint64_t v39 = [(_NFSession *)self signpostId];
      if (v39 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_58;
      }
      os_signpost_id_t v40 = v39;
      if (!os_signpost_enabled(v38)) {
        goto LABEL_58;
      }
      *(_WORD *)buf = 0;
      v41 = "Start_TNEP_Reader";
      v42 = v38;
      os_signpost_type_t v43 = OS_SIGNPOST_EVENT;
    }
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, v43, v40, v41, (const char *)&unk_100286819, buf, 2u);
    goto LABEL_58;
  }
  if (![(_NFSecureTransactionServicesHandoverHybridSession *)self role]
    || (id)[(_NFSecureTransactionServicesHandoverHybridSession *)self role] == (id)3)
  {
    unint64_t v44 = [(_NFSecureTransactionServicesHandoverHybridSession *)self role];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v45 = NFLogGetLogger();
    v46 = (void (*)(uint64_t, const char *, ...))v45;
    if (v44)
    {
      if (v45)
      {
        v47 = object_getClass(self);
        BOOL v48 = class_isMetaClass(v47);
        v49 = object_getClassName(self);
        v108 = sel_getName(a2);
        uint64_t v50 = 45;
        if (v48) {
          uint64_t v50 = 43;
        }
        v46(6, "%c[%{public}s %{public}s]:%i Starting TNEP device", v50, v49, v108, 362);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v51 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = object_getClass(self);
        if (class_isMetaClass(v52)) {
          int v53 = 43;
        }
        else {
          int v53 = 45;
        }
        v54 = object_getClassName(self);
        v55 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v126 = v53;
        *(_WORD *)&v126[4] = 2082;
        *(void *)&v126[6] = v54;
        __int16 v127 = 2082;
        v128 = v55;
        __int16 v129 = 1024;
        int v130 = 362;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting TNEP device", buf, 0x22u);
      }

      v56 = NFSharedSignpostLog();
      unint64_t v57 = [(_NFSession *)self signpostId];
      if (v57 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_91;
      }
      os_signpost_id_t v58 = v57;
      if (!os_signpost_enabled(v56)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      v59 = "Start_TNEP_Device";
      v60 = v56;
      os_signpost_type_t v61 = OS_SIGNPOST_EVENT;
    }
    else
    {
      if (v45)
      {
        v84 = object_getClass(self);
        BOOL v85 = class_isMetaClass(v84);
        v86 = object_getClassName(self);
        v110 = sel_getName(a2);
        uint64_t v87 = 45;
        if (v85) {
          uint64_t v87 = 43;
        }
        v46(6, "%c[%{public}s %{public}s]:%i Starting ISO18013 device", v87, v86, v110, 345);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v88 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        v89 = object_getClass(self);
        if (class_isMetaClass(v89)) {
          int v90 = 43;
        }
        else {
          int v90 = 45;
        }
        v91 = object_getClassName(self);
        v92 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v126 = v90;
        *(_WORD *)&v126[4] = 2082;
        *(void *)&v126[6] = v91;
        __int16 v127 = 2082;
        v128 = v92;
        __int16 v129 = 1024;
        int v130 = 345;
        _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting ISO18013 device", buf, 0x22u);
      }

      v93 = NFSharedSignpostLog();
      unint64_t v94 = [(_NFSession *)self signpostId];
      if (v94 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v95 = v94;
        if (os_signpost_enabled(v93))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v93, OS_SIGNPOST_INTERVAL_BEGIN, v95, "Start_ISO18013_Device", (const char *)&unk_100286819, buf, 2u);
        }
      }

      v96 = [(_NFSecureTransactionServicesHandoverHybridSession *)self stsHelper];
      __int16 v23 = [v96 startISO18013WithConnectionHandoverConfiguration:-[_NFSecureTransactionServicesHandoverHybridSession getCHConfig] type:-[_NFSecureTransactionServicesHandoverHybridSession getSTSHelperOperation] credentialType:5 delegate:self];

      v97 = NFSharedSignpostLog();
      unint64_t v98 = [(_NFSession *)self signpostId];
      if (v98 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v99 = v98;
        if (os_signpost_enabled(v97))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v126 = v23;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v97, OS_SIGNPOST_INTERVAL_END, v99, "Start_ISO18013_Device", "error=%@", buf, 0xCu);
        }
      }

      if (v23) {
        goto LABEL_22;
      }
      v100 = NFSharedSignpostLog();
      unint64_t v101 = [(_NFSession *)self signpostId];
      if (v101 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v102 = v101;
        if (os_signpost_enabled(v100))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v100, OS_SIGNPOST_INTERVAL_BEGIN, v102, "Start_SEProxyListener", (const char *)&unk_100286819, buf, 2u);
        }
      }

      [(_NFSecureTransactionServicesHandoverHybridSession *)self _startSEProxyListener];
      v56 = NFSharedSignpostLog();
      unint64_t v103 = [(_NFSession *)self signpostId];
      if (v103 - 1 > 0xFFFFFFFFFFFFFFFDLL || (os_signpost_id_t v58 = v103, !os_signpost_enabled(v56)))
      {
LABEL_91:

        __int16 v23 = +[NFTNEPService serviceWithURI:@"urn:nfc:sn:handover" minWaitTime:20 maxWaitTimeExtension:31 maxMessageSize:2048];
        v124 = v23;
        v104 = +[NSArray arrayWithObjects:&v124 count:1];
        v111[0] = _NSConcreteStackBlock;
        v111[1] = 3221225472;
        v111[2] = sub_1002332EC;
        v111[3] = &unk_1003021D8;
        v111[4] = self;
        SEL v114 = a2;
        v112 = v6;
        v113 = v7;
        [(_NFSecureTransactionServicesHandoverHybridSession *)self _startTNEPDeviceWithServices:v104 optionalRecords:0 callback:v111];

        goto LABEL_92;
      }
      *(_WORD *)buf = 0;
      v59 = "Start_SEProxyListener";
      v60 = v56;
      os_signpost_type_t v61 = OS_SIGNPOST_INTERVAL_END;
    }
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v60, v61, v58, v59, (const char *)&unk_100286819, buf, 2u);
    goto LABEL_91;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v66 = NFLogGetLogger();
  if (v66)
  {
    v67 = (void (*)(uint64_t, const char *, ...))v66;
    v68 = object_getClass(self);
    BOOL v69 = class_isMetaClass(v68);
    v70 = object_getClassName(self);
    v109 = sel_getName(a2);
    uint64_t v71 = 45;
    if (v69) {
      uint64_t v71 = 43;
    }
    v67(3, "%c[%{public}s %{public}s]:%i Invalid command", v71, v70, v109, 381);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v72 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
  {
    v73 = object_getClass(self);
    if (class_isMetaClass(v73)) {
      int v74 = 43;
    }
    else {
      int v74 = 45;
    }
    v75 = object_getClassName(self);
    v76 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v126 = v74;
    *(_WORD *)&v126[4] = 2082;
    *(void *)&v126[6] = v75;
    __int16 v127 = 2082;
    v128 = v76;
    __int16 v129 = 1024;
    int v130 = 381;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid command", buf, 0x22u);
  }

  id v77 = objc_alloc((Class)NSError);
  v78 = +[NSString stringWithUTF8String:"nfcd"];
  v122[0] = NSLocalizedDescriptionKey;
  v79 = +[NSString stringWithUTF8String:"Invalid Command"];
  v123[0] = v79;
  v123[1] = &off_100320038;
  v122[1] = @"Line";
  v122[2] = @"Method";
  id v80 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v123[2] = v80;
  v122[3] = NSDebugDescriptionErrorKey;
  id v81 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 382];
  v123[3] = v81;
  v82 = +[NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:4];
  id v83 = [v77 initWithDomain:v78 code:11 userInfo:v82];
  ((void (*)(void *, id))v6[2])(v6, v83);

LABEL_93:
}

- (unint64_t)defaultEmulationType
{
  return 6;
}

- (void)_startTNEPDeviceWithServices:(id)a3 optionalRecords:(id)a4 callback:(id)a5
{
  id v9 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = a5;
  id v11 = a4;
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v16 = 45;
    if (isMetaClass) {
      uint64_t v16 = 43;
    }
    v13(6, "%c[%{public}s %{public}s]:%i services=%{public}@", v16, ClassName, Name, 397, v9);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v29 = v19;
    __int16 v30 = 2082;
    __int16 v31 = object_getClassName(self);
    __int16 v32 = 2082;
    int v33 = sel_getName(a2);
    __int16 v34 = 1024;
    int v35 = 397;
    __int16 v36 = 2114;
    id v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i services=%{public}@", buf, 0x2Cu);
  }

  unint64_t v20 = [NFTNEPHandler alloc];
  unint64_t v21 = [(_NFSecureTransactionServicesHandoverHybridSession *)self role];
  if (v21)
  {
    int v22 = [(_NFXPCSession *)self remoteObject];
  }
  else
  {
    int v22 = self;
  }
  __int16 v23 = [(_NFSecureTransactionServicesHandoverHybridSession *)self driverWrapper];
  objc_super v24 = sub_1002535F4((id *)&v20->super.isa, 0, v22, v23, [(_NFSession *)self signpostId]);
  [(_NFSecureTransactionServicesHandoverHybridSession *)self setTnepHandler:v24];

  if (v21) {
  unint64_t v25 = [(_NFSecureTransactionServicesHandoverHybridSession *)self tnepHandler];
  }
  [v25 startTNEPDeviceWithServices:v9 optionalRecords:v11 callback:v10];
}

- (void)_startTNEPReaderWithCallback:(id)a3
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
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 408);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v27 = v14;
    __int16 v28 = 2082;
    int v29 = object_getClassName(self);
    __int16 v30 = 2082;
    __int16 v31 = sel_getName(a2);
    __int16 v32 = 1024;
    int v33 = 408;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  uint64_t v15 = [NFTNEPHandler alloc];
  unint64_t v16 = [(_NFSecureTransactionServicesHandoverHybridSession *)self role];
  id v17 = self;
  if (v16 != 1)
  {
    id v17 = [(_NFXPCSession *)self remoteObject];
  }
  int v18 = [(_NFSecureTransactionServicesHandoverHybridSession *)self driverWrapper];
  int v19 = sub_1002535F4((id *)&v15->super.isa, (void *)1, v17, v18, [(_NFSession *)self signpostId]);
  [(_NFSecureTransactionServicesHandoverHybridSession *)self setTnepHandler:v19];

  if (v16 != 1) {
  unint64_t v20 = [(_NFSecureTransactionServicesHandoverHybridSession *)self tnepHandler];
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100233B68;
  v23[3] = &unk_100302228;
  id v24 = v5;
  SEL v25 = a2;
  v23[4] = self;
  id v21 = v5;
  [v20 startTNEPReaderWithCallback:v23];
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 439);
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
    *(_DWORD *)buf = 67109890;
    int v18 = v12;
    __int16 v19 = 2082;
    unint64_t v20 = object_getClassName(self);
    __int16 v21 = 2082;
    int v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 439;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  uint64_t v13 = +[_NFHardwareManager sharedHardwareManager];
  int v14 = +[NFRoutingConfig embeddedWiredMode];
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 446);
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
    *(_DWORD *)buf = 67109890;
    int v16 = v12;
    __int16 v17 = 2082;
    int v18 = object_getClassName(self);
    __int16 v19 = 2082;
    unint64_t v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 446;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  uint64_t v13 = [(_NFSecureTransactionServicesHandoverHybridSession *)self stsHelper];
  [v13 stopSEProxyListener];

  [(_NFSecureTransactionServicesHandoverHybridSession *)self setSeProxyListener:0];
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 454);
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
    *(_DWORD *)buf = 67109890;
    int v15 = v12;
    __int16 v16 = 2082;
    __int16 v17 = object_getClassName(self);
    __int16 v18 = 2082;
    __int16 v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 454;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  sub_1002128B4(*(void **)((char *)&self->_type + 3));
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 460);
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
    *(_DWORD *)buf = 67109890;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = object_getClassName(self);
    __int16 v21 = 2082;
    int v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 460;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  uint64_t v13 = +[_NFHardwareManager sharedHardwareManager];
  int v14 = +[NFRoutingConfig routingOff];
  id v15 = [v13 setRoutingConfig:v14];
}

- (void)coreDuetActivityRevoked
{
  id v3 = [(_NFSession *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023463C;
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
  block[2] = sub_1002347F4;
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
  v12[2] = sub_10023500C;
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
  block[2] = sub_100235668;
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
  v12[2] = sub_100235C1C;
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
  block[2] = sub_10023626C;
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
  v12[2] = sub_1002368CC;
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
  block[2] = sub_100236F08;
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
      v5(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v7, ClassName, Name, 609, v10);
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
      __int16 v34 = v15;
      __int16 v35 = 1024;
      int v36 = 609;
      __int16 v37 = 2114;
      int v38 = v16;
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
      int v27 = sel_getName(a2);
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v18(6, "%c[%{public}s %{public}s]:%i ", v22, v21, v27, 611);
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
      __int16 v34 = sel_getName(a2);
      __int16 v35 = 1024;
      int v36 = 611;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", (uint8_t *)&buf, 0x22u);
    }

    objc_initWeak(&buf, self);
    os_signpost_id_t v26 = [(_NFSession *)self workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100237884;
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 630);
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
    int v21 = 630;
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
    v12(6, "%c[%{public}s %{public}s]:%i service=%{public}@, status=%ld", v16, ClassName, Name, 640, v7, v10);
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
    os_signpost_id_t v26 = object_getClassName(self);
    __int16 v27 = 2082;
    __int16 v28 = sel_getName(a2);
    __int16 v29 = 1024;
    int v30 = 640;
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
    v22[2] = sub_100237E68;
    v22[3] = &unk_100301F70;
    v22[4] = self;
    v22[5] = a2;
    __int16 v20 = [(_NFSecureTransactionServicesHandoverHybridSession *)self _asynchronousRemoteProxyWithErrorHandler:v22];
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
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    int v12 = [(_NFSecureTransactionServicesHandoverHybridSession *)self deviceHandoverSelectError];
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i CH status=%{public}@, link error=%{public}@", v13, ClassName, Name, 654, v12, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    uint64_t v17 = object_getClassName(self);
    __int16 v18 = sel_getName(a2);
    int v19 = [(_NFSecureTransactionServicesHandoverHybridSession *)self deviceHandoverSelectError];
    *(_DWORD *)id buf = 67110402;
    *(_DWORD *)&uint8_t buf[4] = v16;
    __int16 v36 = 2082;
    __int16 v37 = v17;
    __int16 v38 = 2082;
    unint64_t v39 = v18;
    __int16 v40 = 1024;
    int v41 = 654;
    __int16 v42 = 2114;
    os_signpost_type_t v43 = v19;
    __int16 v44 = 2114;
    id v45 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i CH status=%{public}@, link error=%{public}@", buf, 0x36u);
  }
  __int16 v20 = [(_NFSecureTransactionServicesHandoverHybridSession *)self deviceHandoverSelectError];

  if (v20)
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1002384D8;
    v34[3] = &unk_100301F70;
    v34[4] = self;
    v34[5] = a2;
    int v21 = [(_NFSecureTransactionServicesHandoverHybridSession *)self _asynchronousRemoteProxyWithErrorHandler:v34];
    uint64_t v22 = [(_NFSecureTransactionServicesHandoverHybridSession *)self deviceHandoverSelectError];
    [v21 connectionHandoverProcessFailure:v22];

    [(_NFSecureTransactionServicesHandoverHybridSession *)self setDeviceHandoverSelectError:0];
  }
  else if (v5)
  {
    if ([v5 code] == (id)28)
    {
      uint64_t v23 = STS_XCPHELPER_ERROR_DOMAIN;
      NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
      *(void *)id buf = STSXPCHelperErrorDescriptions[8];
      int v24 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v46 count:1];
      uint64_t v25 = v23;
      uint64_t v26 = 8;
    }
    else if ([v5 code] == (id)62 || objc_msgSend(v5, "code") == (id)59)
    {
      uint64_t v28 = STS_XCPHELPER_ERROR_DOMAIN;
      NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
      *(void *)id buf = STSXPCHelperErrorDescriptions[2];
      int v24 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v46 count:1];
      uint64_t v25 = v28;
      uint64_t v26 = 2;
    }
    else
    {
      uint64_t v29 = STS_XCPHELPER_ERROR_DOMAIN;
      NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
      *(void *)id buf = STSXPCHelperErrorDescriptions[10];
      int v24 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v46 count:1];
      uint64_t v25 = v29;
      uint64_t v26 = 10;
    }
    int v30 = +[NSError errorWithDomain:v25 code:v26 userInfo:v24];

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100238670;
    v33[3] = &unk_100301F70;
    v33[4] = self;
    v33[5] = a2;
    __int16 v31 = [(_NFSecureTransactionServicesHandoverHybridSession *)self _asynchronousRemoteProxyWithErrorHandler:v33];
    [v31 connectionHandoverProcessFailure:v30];
  }
  else
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100238808;
    v32[3] = &unk_100301F70;
    v32[4] = self;
    v32[5] = a2;
    __int16 v27 = [(_NFSecureTransactionServicesHandoverHybridSession *)self _asynchronousRemoteProxyWithErrorHandler:v32];
    [v27 connectionHandoverProcessCompleted];
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

  unsigned int v9 = [(_NFSecureTransactionServicesHandoverHybridSession *)self stsHelper];
  uint64_t v10 = [v5 asData];

  id v11 = [(_NFSession *)self workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100238AE8;
  v12[3] = &unk_1003022F0;
  v12[4] = self;
  void v12[5] = a2;
  [v9 processConnectionHandoverRequestData:v10 callbackQueue:v11 responseHandler:v12];
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
    v7(6, "%c[%{public}s %{public}s]:%i services=%{public}@", v10, ClassName, Name, 715, v5);
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
    uint64_t v50 = object_getClassName(self);
    __int16 v51 = 2082;
    v52 = sel_getName(a2);
    __int16 v53 = 1024;
    int v54 = 715;
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
          v41[2] = sub_1002395AC;
          v41[3] = &unk_100301F70;
          v41[4] = self;
          v41[5] = a2;
          int v30 = objc_retainBlock(v41);
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_1002399CC;
          v40[3] = &unk_100301F70;
          v40[4] = self;
          v40[5] = a2;
          __int16 v31 = [(_NFSecureTransactionServicesHandoverHybridSession *)self _asynchronousRemoteProxyWithErrorHandler:v40];
          [v31 connectionHandoverTNEPServiceSelected:@"urn:nfc:sn:handover"];

          id v32 = [(_NFSecureTransactionServicesHandoverHybridSession *)self tnepHandler];
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_100239B64;
          v37[3] = &unk_100302228;
          id v38 = v30;
          SEL v39 = a2;
          v37[4] = self;
          __int16 v33 = v30;
          [v32 tnepReaderSelectService:@"urn:nfc:sn:handover" callback:v37];

          goto LABEL_29;
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
    __int16 v20 = (void (*)(uint64_t, const char *, ...))v19;
    int v21 = object_getClass(self);
    BOOL v22 = class_isMetaClass(v21);
    uint64_t v23 = object_getClassName(self);
    __int16 v36 = sel_getName(a2);
    uint64_t v24 = 45;
    if (v22) {
      uint64_t v24 = 43;
    }
    v20(4, "%c[%{public}s %{public}s]:%i No matching service found", v24, v23, v36, 726);
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
    uint64_t v28 = object_getClassName(self);
    uint64_t v29 = sel_getName(a2);
    *(_DWORD *)id buf = 67109890;
    int v48 = v27;
    __int16 v49 = 2082;
    uint64_t v50 = v28;
    __int16 v51 = 2082;
    v52 = v29;
    __int16 v53 = 1024;
    int v54 = 726;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No matching service found", buf, 0x22u);
  }

LABEL_29:
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
    v7(6, "%c[%{public}s %{public}s]:%i handover select = %@", v10, ClassName, Name, 797, v5);
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
    int v21 = v13;
    __int16 v22 = 2082;
    uint64_t v23 = object_getClassName(self);
    __int16 v24 = 2082;
    uint64_t v25 = sel_getName(a2);
    __int16 v26 = 1024;
    int v27 = 797;
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i handover select = %@", buf, 0x2Cu);
  }

  id v14 = [(_NFSecureTransactionServicesHandoverHybridSession *)self stsHelper];
  id v15 = [v5 asData];
  id v16 = [(_NFSession *)self workQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10023AAE4;
  v19[3] = &unk_100301F70;
  v19[4] = self;
  v19[5] = a2;
  [v14 connectRemoteWithConnectionHandoverSelect:v15 callbackQueue:v16 responseHandler:v19];
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
    v10(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v13, ClassName, Name, 820, v5);
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
    __int16 v26 = v17;
    __int16 v27 = 2082;
    __int16 v28 = v18;
    __int16 v29 = 1024;
    int v30 = 820;
    __int16 v31 = 2114;
    id v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10023B300;
  v22[3] = &unk_100301F70;
  v22[4] = self;
  v22[5] = a2;
  uint64_t v19 = [(_NFSecureTransactionServicesHandoverHybridSession *)self _asynchronousRemoteProxyWithErrorHandler:v22];
  [v19 tnepReaderServicesAborted:v5];
}

- (void)startHCEProcessingWithDevice:(id)a3 completion:(id)a4
{
  id v7 = a3;
  os_signpost_id_t v8 = (void (**)(id, void))a4;
  unsigned int v9 = [(_NFSecureTransactionServicesHandoverHybridSession *)self tnepHandler];

  if (v9)
  {
    uint64_t v10 = [(_NFSecureTransactionServicesHandoverHybridSession *)self tnepHandler];
    id v11 = (void *)v10;
    if (v10) {
      sub_100253720(v10, v7);
    }

    if (v8) {
      v8[2](v8, 0);
    }
  }
  else
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
      v13(3, "%c[%{public}s %{public}s]:%i Missing tnepHandler", v17, ClassName, Name, 834);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = object_getClass(self);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      *(_DWORD *)id buf = 67109890;
      int v30 = v20;
      __int16 v31 = 2082;
      id v32 = object_getClassName(self);
      __int16 v33 = 2082;
      uint64_t v34 = sel_getName(a2);
      __int16 v35 = 1024;
      int v36 = 834;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing tnepHandler", buf, 0x22u);
    }

    if (v8)
    {
      id v21 = objc_alloc((Class)NSError);
      __int16 v22 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
      uint64_t v23 = +[NSString stringWithUTF8String:"Unexpected Result"];
      __int16 v28 = v23;
      int v24 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      id v25 = [v21 initWithDomain:v22 code:13 userInfo:v24];
      ((void (**)(id, id))v8)[2](v8, v25);
    }
  }
}

- (unint64_t)getCHConfig
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
    unint64_t v19 = [(_NFSecureTransactionServicesHandoverHybridSession *)self type];
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i type=0x%lx", v10, ClassName, Name, 841, v19);
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
    int v21 = v13;
    __int16 v22 = 2082;
    uint64_t v23 = object_getClassName(self);
    __int16 v24 = 2082;
    id v25 = sel_getName(a2);
    __int16 v26 = 1024;
    int v27 = 841;
    __int16 v28 = 2048;
    unint64_t v29 = [(_NFSecureTransactionServicesHandoverHybridSession *)self type];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i type=0x%lx", buf, 0x2Cu);
  }

  unsigned __int8 v14 = [(_NFSecureTransactionServicesHandoverHybridSession *)self type];
  unint64_t v15 = [(_NFSecureTransactionServicesHandoverHybridSession *)self type];
  unint64_t v16 = [(_NFSecureTransactionServicesHandoverHybridSession *)self type];
  unint64_t v17 = [(_NFSecureTransactionServicesHandoverHybridSession *)self type];
  return (16 * (v14 & 1)) | (v15 >> 1) & 1 | (v16 >> 1) & 2 | (v17 >> 1) & 4 | ([(_NFSecureTransactionServicesHandoverHybridSession *)self type] >> 1) & 8;
}

- (unint64_t)getSTSHelperOperation
{
  unint64_t v4 = [(_NFSecureTransactionServicesHandoverHybridSession *)self role];
  if (v4 - 2 >= 3 && v4 != -1) {
    return v4 == 1;
  }
  id v6 = +[NSAssertionHandler currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"_NFSecureTransactionServicesHandoverHybridSession.m" lineNumber:865 description:@"Invalid"];

  return -1;
}

- (id)_synchronousRemoteProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(_NFXPCSession *)self remoteObject];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_asynchronousRemoteProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(_NFXPCSession *)self remoteObject];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)createCHSelectErrorMessage
{
  id v2 = objc_alloc_init((Class)NFNdefRecordInternal);
  [v2 setTypeNameFormat:1];
  id v3 = [objc_alloc((Class)NSData) initWithBytes:&unk_1002844D6 length:3];
  [v2 setType:v3];

  id v4 = [objc_alloc((Class)NSData) initWithBytes:&unk_1002844D9 length:2];
  [v2 setPayload:v4];

  id v5 = objc_alloc_init((Class)NFNdefRecordInternal);
  id v6 = [objc_alloc((Class)NSMutableData) initWithBytes:&unk_1002844DD length:2];
  id v7 = [v2 asData];
  [v6 appendData:v7];

  [v5 setTypeNameFormat:1];
  id v8 = [objc_alloc((Class)NSData) initWithBytes:&unk_1002844DB length:2];
  [v5 setType:v8];

  [v5 setPayload:v6];
  id v9 = objc_alloc_init((Class)NFNdefMessageInternal);
  [v9 addRecord:v5];

  return v9;
}

- (void)handleReaderBurnoutTimer
{
  id v4 = [(_NFSession *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = NFSharedSignpostLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "handleReaderBurnoutTimer", (const char *)&unk_100286819, buf, 2u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10023BE14;
  v12[3] = &unk_100301F70;
  v12[4] = self;
  void v12[5] = a2;
  id v6 = [(_NFSecureTransactionServicesHandoverHybridSession *)self _synchronousRemoteProxyWithErrorHandler:v12];
  id v7 = objc_alloc((Class)NSError);
  id v8 = +[NSString stringWithUTF8String:"nfcd"];
  NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
  id v9 = +[NSString stringWithUTF8String:"Reader mode temporarily disabled"];
  unint64_t v15 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v11 = [v7 initWithDomain:v8 code:47 userInfo:v10];
  [v6 tnepReaderServicesAborted:v11];

  [(_NFSecureTransactionServicesHandoverHybridSession *)self endSession:0];
}

- (void)handleReaderBurnoutCleared
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
    v5(6, "%c[%{public}s %{public}s]:%i Warning : message received - session should be gone.", v9, ClassName, Name, 928);
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
    int v15 = v12;
    __int16 v16 = 2082;
    unint64_t v17 = object_getClassName(self);
    __int16 v18 = 2082;
    unint64_t v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 928;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Warning : message received - session should be gone.", buf, 0x22u);
  }
}

- (unint64_t)role
{
  return *(void *)(&self->super._transactionState + 1);
}

- (void)setRole:(unint64_t)a3
{
  *(void *)(&self->super._transactionState + 1) = a3;
}

- (unint64_t)type
{
  return *(unint64_t *)((char *)&self->_role + 3);
}

- (void)setType:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_role + 3) = a3;
}

- (NFDriverWrapper)driverWrapper
{
  return *(NFDriverWrapper **)((char *)&self->_type + 3);
}

- (void)setDriverWrapper:(id)a3
{
}

- (NFSecureElementWrapper)seWrapper
{
  return *(NFSecureElementWrapper **)((char *)&self->_driverWrapper + 3);
}

- (void)setSeWrapper:(id)a3
{
}

- (STSHelperLibrary)stsHelper
{
  return *(STSHelperLibrary **)((char *)&self->_seWrapper + 3);
}

- (void)setStsHelper:(id)a3
{
}

- (NFTagInternal)connectedTag
{
  return *(STSHelperLibrary **)((char *)&self->_stsHelper + 3);
}

- (void)setConnectedTag:(id)a3
{
}

- (NFTNEPHandler)tnepHandler
{
  return *(NFTNEPHandler **)((char *)&self->_connectedTag + 3);
}

- (void)setTnepHandler:(id)a3
{
}

- (NFSecureElementProxyListener)seProxyListener
{
  return *(NFSecureElementProxyListener **)((char *)&self->_tnepHandler + 3);
}

- (void)setSeProxyListener:(id)a3
{
}

- (NSError)deviceHandoverSelectError
{
  return *(NSError **)((char *)&self->_seProxyListener + 3);
}

- (void)setDeviceHandoverSelectError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_seProxyListener + 3), 0);
  objc_storeStrong((id *)((char *)&self->_tnepHandler + 3), 0);
  objc_storeStrong((id *)((char *)&self->_connectedTag + 3), 0);
  objc_storeStrong((id *)((char *)&self->_stsHelper + 3), 0);
  objc_storeStrong((id *)((char *)&self->_seWrapper + 3), 0);
  objc_storeStrong((id *)((char *)&self->_driverWrapper + 3), 0);

  objc_storeStrong((id *)((char *)&self->_type + 3), 0);
}

@end