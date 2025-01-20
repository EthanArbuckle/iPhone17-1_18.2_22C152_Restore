@interface NFStepUpController
- (NFStepUpController)initWithQueue:(id)a3 driverWrapper:(id)a4;
- (id)connectToNotificationListener:(id)a3;
- (id)startISO18013WithConnectionHandoverConfiguration;
- (void)handleStepUpEvent:(id)a3 transactionType:(unsigned int)a4 forApplet:(id)a5;
- (void)hceReadWithHandle:(id)a3 completion:(id)a4;
- (void)invalidate;
@end

@implementation NFStepUpController

- (NFStepUpController)initWithQueue:(id)a3 driverWrapper:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)NFStepUpController;
  v10 = [(NFStepUpController *)&v28 init];
  v11 = v10;
  if (v10
    && (objc_storeStrong((id *)&v10->_workQueue, a3),
        objc_storeStrong((id *)&v11->_driverWrapper, a4),
        v11->_transactionType = 0,
        uint64_t v12 = objc_opt_new(),
        stsHelper = v11->_stsHelper,
        v11->_stsHelper = (STSHelperLibrary *)v12,
        stsHelper,
        !v11->_stsHelper))
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v16 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v11);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v11);
      Name = sel_getName(a2);
      uint64_t v20 = 45;
      if (isMetaClass) {
        uint64_t v20 = 43;
      }
      v16(3, "%c[%{public}s %{public}s]:%i Could not allocate STS helper object", v20, ClassName, Name, 44);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(v11);
      if (class_isMetaClass(v22)) {
        int v23 = 43;
      }
      else {
        int v23 = 45;
      }
      v24 = object_getClassName(v11);
      v25 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v30 = v23;
      __int16 v31 = 2082;
      v32 = v24;
      __int16 v33 = 2082;
      v34 = v25;
      __int16 v35 = 1024;
      int v36 = 44;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not allocate STS helper object", buf, 0x22u);
    }

    v14 = 0;
  }
  else
  {
    v14 = v11;
  }

  return v14;
}

- (void)invalidate
{
  [(STSHelperLibrary *)self->_stsHelper invalidate];
  stsHelper = self->_stsHelper;
  self->_stsHelper = 0;

  applet = self->_applet;
  self->_applet = 0;
}

- (id)connectToNotificationListener:(id)a3
{
  return [(STSHelperLibrary *)self->_stsHelper connectToNotificationListener:a3];
}

- (id)startISO18013WithConnectionHandoverConfiguration
{
  return [(STSHelperLibrary *)self->_stsHelper startISO18013WithConnectionHandoverConfiguration:32 type:2 credentialType:3 delegate:self];
}

- (void)handleStepUpEvent:(id)a3 transactionType:(unsigned int)a4 forApplet:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [v10 objectForKeyedSubscript:@"StepUpReaderData"];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v62 = v11;
    objc_storeStrong((id *)&self->_theStepUpEvent, a3);
    self->_transactionType = a4;
    objc_storeStrong((id *)&self->_applet, a5);
    v13 = [v10 objectForKeyedSubscript:@"appletIdentifier"];

    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      v14 = [v13 copy];
    }
    else {
      v14 = 0;
    }
    v61 = [v10 objectForKeyedSubscript:@"StepUpReaderData"];
    int v23 = [v61 objectForKeyedSubscript:@"SharedSecret"];

    if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v63 = [v23 copy];
    }
    else {
      id v63 = 0;
    }
    uint64_t v12 = [v10 objectForKeyedSubscript:@"endPointIdentifier"];

    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v24 = [v12 copy];
    }
    else {
      id v24 = 0;
    }
    uint64_t v25 = +[NSData NF_dataWithHexString:v24];
    v26 = (void *)v25;
    if (v63 && v25 && v14)
    {
      id v59 = v24;
      v76[0] = @"appletIdentifier";
      v76[1] = STSUAStepupEventKeyEndpointData;
      v77[0] = v14;
      v77[1] = v25;
      v76[2] = STSUAStepupEventKeySharedSecretData;
      v77[2] = v63;
      v27 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:3];
      objc_super v28 = [(STSHelperLibrary *)self->_stsHelper signalUnifiedAccessStepUpWithEventDictionary:v27];
      if (v28)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          int v30 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          uint64_t v33 = 45;
          if (isMetaClass) {
            uint64_t v33 = 43;
          }
          v30(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v33, ClassName, Name, 118, v28);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v34 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          __int16 v35 = object_getClass(self);
          if (class_isMetaClass(v35)) {
            int v36 = 43;
          }
          else {
            int v36 = 45;
          }
          *(_DWORD *)buf = 67110146;
          int v65 = v36;
          __int16 v66 = 2082;
          v67 = object_getClassName(self);
          __int16 v68 = 2082;
          v69 = sel_getName(a2);
          __int16 v70 = 1024;
          int v71 = 118;
          __int16 v72 = 2114;
          CFStringRef v73 = v28;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
        }
      }
      id v24 = v59;
      v37 = v61;
    }
    else
    {
      v60 = (void *)v25;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v38 = NFLogGetLogger();
      if (v38)
      {
        v39 = (void (*)(uint64_t, const char *, ...))v38;
        v40 = object_getClass(self);
        BOOL v41 = class_isMetaClass(v40);
        id v42 = v24;
        v43 = object_getClassName(self);
        v44 = sel_getName(a2);
        CFStringRef v45 = @"Missing Step-Up data ";
        if (v63) {
          CFStringRef v45 = &stru_100309C40;
        }
        CFStringRef v46 = @"Missing Endpoint identifier";
        if (v60) {
          CFStringRef v46 = &stru_100309C40;
        }
        CFStringRef v56 = v45;
        uint64_t v47 = 45;
        if (v41) {
          uint64_t v47 = 43;
        }
        v54 = v43;
        id v24 = v42;
        v39(3, "%c[%{public}s %{public}s]:%i Invalid data from Event. %{public}@ %{public}@", v47, v54, v44, 121, v56, v46);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v27 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v48 = object_getClass(self);
        if (class_isMetaClass(v48)) {
          int v49 = 43;
        }
        else {
          int v49 = 45;
        }
        v50 = object_getClassName(self);
        v51 = sel_getName(a2);
        *(_DWORD *)buf = 67110402;
        CFStringRef v52 = &stru_100309C40;
        if (v63) {
          CFStringRef v53 = &stru_100309C40;
        }
        else {
          CFStringRef v53 = @"Missing Step-Up data ";
        }
        v26 = v60;
        int v65 = v49;
        if (!v60) {
          CFStringRef v52 = @"Missing Endpoint identifier";
        }
        __int16 v66 = 2082;
        v67 = v50;
        __int16 v68 = 2082;
        v69 = v51;
        __int16 v70 = 1024;
        int v71 = 121;
        __int16 v72 = 2114;
        CFStringRef v73 = v53;
        __int16 v74 = 2114;
        CFStringRef v75 = v52;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid data from Event. %{public}@ %{public}@", buf, 0x36u);
        v37 = v61;
      }
      else
      {
        v26 = v60;
        v37 = v61;
      }
    }

    id v11 = v62;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v15 = NFLogGetLogger();
    if (v15)
    {
      v16 = (void (*)(uint64_t, const char *, ...))v15;
      v17 = object_getClass(self);
      BOOL v18 = class_isMetaClass(v17);
      v19 = object_getClassName(self);
      v55 = sel_getName(a2);
      uint64_t v20 = 45;
      if (v18) {
        uint64_t v20 = 43;
      }
      v16(3, "%c[%{public}s %{public}s]:%i StepUp event from ATL is of invalid type", v20, v19, v55, 80);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(self);
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v65 = v22;
      __int16 v66 = 2082;
      v67 = object_getClassName(self);
      __int16 v68 = 2082;
      v69 = sel_getName(a2);
      __int16 v70 = 1024;
      int v71 = 80;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i StepUp event from ATL is of invalid type", buf, 0x22u);
    }
  }
}

- (void)hceReadWithHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v44 = 0;
  CFStringRef v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_10000B8B8;
  v48 = sub_10018524C;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  BOOL v41 = sub_10000B8B8;
  id v42 = sub_10018524C;
  id v43 = (id)objc_opt_new();
  id v37 = 0;
  id v8 = [v6 readApduAndReturnError:&v37];
  id v9 = v37;
  theStepUpEvent = self->_theStepUpEvent;
  if (theStepUpEvent)
  {
    id v11 = [(NSDictionary *)theStepUpEvent objectForKeyedSubscript:@"appletIdentifier"];

    if (v11)
    {
      uint64_t v12 = [(NSDictionary *)self->_theStepUpEvent objectForKeyedSubscript:@"appletIdentifier"];
      [(id)v39[5] setObject:v12 forKeyedSubscript:@"appletIdentifier"];
    }
  }
  if (v8 && !v9)
  {
    strcpy((char *)buf, "o");
    id v13 = [objc_alloc((Class)NSData) initWithBytes:buf length:2];
    v14 = v13;
    stsHelper = self->_stsHelper;
    if (stsHelper)
    {
      workQueue = self->_workQueue;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100185254;
      v29[3] = &unk_100306078;
      v29[4] = v13;
      uint64_t v33 = &v38;
      v34 = &v44;
      int v30 = (NSDictionary *)v6;
      __int16 v31 = self;
      id v32 = v7;
      [(STSHelperLibrary *)stsHelper processUnifiedAccessStepupAPDU:v8 callbackQueue:workQueue responseHandler:v29];

      v17 = v30;
    }
    else
    {
      [v6 sendAPDU:v13];
      [(id)v39[5] setObject:&__kCFBooleanTrue forKeyedSubscript:@"didError"];
      id v24 = [NFContactlessPaymentEndEvent alloc];
      uint64_t v25 = [(NFContactlessPaymentEndEvent *)v24 initWithDictionary:v39[5]];
      v26 = (void *)v45[5];
      v45[5] = (uint64_t)v25;

      (*((void (**)(id, uint64_t, NSDictionary *))v7 + 2))(v7, v45[5], self->_theStepUpEvent);
      v27 = self->_theStepUpEvent;
      if (!v27)
      {
LABEL_19:

        goto LABEL_20;
      }
      sub_1000B4830((uint64_t)NFUnifiedAccessTransactionCALogger, v27, self->_transactionType, 28416);
      objc_super v28 = NFSharedSignpostLog();
      if (os_signpost_enabled(v28))
      {
        *(_WORD *)__int16 v35 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AtlEvent", "AtlStepUpEventComplete", v35, 2u);
      }

      v17 = self->_theStepUpEvent;
      self->_theStepUpEvent = 0;
    }

    goto LABEL_19;
  }
  if ([v9 code] == (id)62)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    sub_1002128B4(self->_driverWrapper);
    [(id)v39[5] setObject:&__kCFBooleanTrue forKeyedSubscript:@"didError"];
    BOOL v18 = [NFContactlessPaymentEndEvent alloc];
    v19 = [(NFContactlessPaymentEndEvent *)v18 initWithDictionary:v39[5]];
    uint64_t v20 = (void *)v45[5];
    v45[5] = (uint64_t)v19;

    (*((void (**)(id, uint64_t, NSDictionary *))v7 + 2))(v7, v45[5], self->_theStepUpEvent);
    v21 = self->_theStepUpEvent;
    if (v21)
    {
      sub_1000B4830((uint64_t)NFUnifiedAccessTransactionCALogger, v21, self->_transactionType, (uint64_t)[v9 code]);
      int v22 = NFSharedSignpostLog();
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AtlEvent", "AtlStepUpEventComplete", buf, 2u);
      }

      int v23 = self->_theStepUpEvent;
      self->_theStepUpEvent = 0;
    }
  }
LABEL_20:

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_theStepUpEvent, 0);
  objc_storeStrong((id *)&self->_stsHelper, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_driverWrapper, 0);
}

@end