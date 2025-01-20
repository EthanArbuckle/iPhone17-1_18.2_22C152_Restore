@interface STSSessionBase
- (BOOL)hasStartedWithDelegate;
- (NFSecureElementManagerSession)masterSESession;
- (NFSession)initiatingSession;
- (OS_dispatch_queue)callbackQueue;
- (STSHandler)handler;
- (STSSessionBase)init;
- (STSSessionBaseDelegate)delegate;
- (double)isTimeLimited;
- (id)activateChildSession;
- (id)canStartSession;
- (id)createHandlerForCredential:(id)a3;
- (id)createHandoffToken:(id *)a3;
- (id)nfHardwareManager;
- (id)setActiveCredential:(id)a3;
- (id)setActiveCredentials:(id)a3;
- (id)theStartCallback;
- (id)validateCredentials:(id)a3;
- (id)waitForControlSessionToBeReady:(int)a3;
- (void)_tearDownOnQueue:(BOOL)a3 completion:(id)a4;
- (void)clearSessionTimer;
- (void)dealloc;
- (void)endSessionWithCompletion:(id)a3;
- (void)fireSessionDidEndUnexpectedlyEventWithStatus:(unint64_t)a3;
- (void)handleSessionResumed:(id)a3;
- (void)handleSessionSuspended:(id)a3 withToken:(id)a4;
- (void)secureElementManagerSessionDidEndUnexpectedly:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setInitiatingSession:(id)a3;
- (void)setMasterSESession:(id)a3;
- (void)setSessionTimeLimit:(double)a3;
- (void)setTheStartCallback:(id)a3;
- (void)startWithDelegate:(id)a3 isFirstInQueue:(BOOL *)a4;
- (void)startWithDelegate:(id)a3 isFirstInQueue:(BOOL *)a4 completion:(id)a5;
@end

@implementation STSSessionBase

- (STSSessionBase)init
{
  v11.receiver = self;
  v11.super_class = (Class)STSSessionBase;
  v2 = [(STSSessionBase *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, -1);

    ClassName = object_getClassName(v2);
    dispatch_queue_t v6 = dispatch_queue_create(ClassName, v4);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v6;

    v2->_sessionUpdateLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = objc_opt_new();
    nfHwManager = v2->_nfHwManager;
    v2->_nfHwManager = (STSHardwareManagerWrapper *)v8;
  }
  return v2;
}

- (void)dealloc
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase dealloc]", 47, self, &stru_26D2FDEC0, v2, v3, (uint64_t)v5.receiver);
  [(STSSessionBase *)self clearSessionTimer];
  [(STSSessionBase *)self _tearDownOnQueue:0 completion:0];
  v5.receiver = self;
  v5.super_class = (Class)STSSessionBase;
  [(STSSessionBase *)&v5 dealloc];
}

- (id)createHandlerForCredential:(id)a3
{
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase createHandlerForCredential:]", 56, self, @"Subclass must implement this!", v3, v4, vars0);
  return 0;
}

- (id)nfHardwareManager
{
  return [(STSHardwareManagerWrapper *)self->_nfHwManager manager];
}

- (void)startWithDelegate:(id)a3 isFirstInQueue:(BOOL *)a4
{
  id v6 = a3;
  [(STSSessionBase *)self setDelegate:v6];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_221174998;
  aBlock[3] = &unk_264594530;
  aBlock[4] = self;
  id v14 = v6;
  v15 = a4;
  id v7 = v6;
  uint64_t v8 = (void (**)(void))_Block_copy(aBlock);
  v9 = [(STSSessionBase *)self masterSESession];

  if (v9)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase startWithDelegate:isFirstInQueue:]", 112, self, @"Previous session exists, tear down now", v10, v11, v12);
    [(STSSessionBase *)self _tearDownOnQueue:1 completion:v8];
  }
  else
  {
    v8[2](v8);
  }
}

- (void)startWithDelegate:(id)a3 isFirstInQueue:(BOOL *)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _os_activity_create(&dword_221170000, "startWithDelegate:isFirstInQueue:completion:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase startWithDelegate:isFirstInQueue:completion:]", 123, self, &stru_26D2FDEC0, v11, v12, v15[0]);
  v13 = [(STSSessionBase *)self canStartSession];
  if (v13)
  {
    id v14 = [(STSSessionBase *)self callbackQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = (uint64_t)sub_221174EC4;
    v15[3] = (uint64_t)&unk_264594558;
    id v17 = v9;
    id v16 = v13;
    dispatch_async(v14, v15);
  }
  else
  {
    [(STSSessionBase *)self setTheStartCallback:v9];
    [(STSSessionBase *)self startWithDelegate:v8 isFirstInQueue:a4];
  }
}

- (id)canStartSession
{
  uint64_t v15[4] = *MEMORY[0x263EF8340];
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase canStartSession]", 136, self, @"Subclass must implement this!", v2, v3, v13);
  objc_super v5 = (void *)MEMORY[0x263F087E8];
  id v6 = [NSString stringWithUTF8String:"STS.fwk"];
  v14[0] = *MEMORY[0x263F08320];
  id v7 = [NSString stringWithUTF8String:"Unexpected Result"];
  v15[0] = v7;
  v15[1] = &unk_26D307618;
  v14[1] = @"Line";
  v14[2] = @"Method";
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
  v15[2] = v8;
  v14[3] = *MEMORY[0x263F07F80];
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 137);
  v15[3] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  uint64_t v11 = [v5 errorWithDomain:v6 code:10 userInfo:v10];

  return v11;
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = _os_activity_create(&dword_221170000, "endSessionWithCompletion:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase endSessionWithCompletion:]", 142, self, &stru_26D2FDEC0, v6, v7, v9);
  objc_initWeak((id *)&state, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2211751E8;
  v10[3] = &unk_264594580;
  objc_copyWeak(&v12, (id *)&state);
  id v8 = v4;
  v10[4] = self;
  id v11 = v8;
  [(STSSessionBase *)self _tearDownOnQueue:1 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)&state);
}

- (id)activateChildSession
{
  v22[4] = *MEMORY[0x263EF8340];
  id v4 = [(STSSessionBase *)self handler];
  objc_super v5 = [v4 handoffToken];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = [(STSSessionBase *)self masterSESession];
    id v20 = 0;
    id v8 = [v7 createSessionHandoffToken:&v20];
    id v9 = v20;

    if (v9)
    {
      id v6 = v9;
    }
    else
    {
      if ([v8 length])
      {
        sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase activateChildSession]", 189, self, @"activating new handler with token: %@", v10, v11, (uint64_t)v8);
        id v12 = [(STSSessionBase *)self handler];
        id v6 = [v12 activateWithHandoffToken:v8];
      }
      else
      {
        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase activateChildSession]", 185, self, @"Invalid token", v10, v11, v19);
        uint64_t v13 = (void *)MEMORY[0x263F087E8];
        id v12 = [NSString stringWithUTF8String:"STS.fwk"];
        v21[0] = *MEMORY[0x263F08320];
        id v14 = [NSString stringWithUTF8String:"Invalid State"];
        v22[0] = v14;
        v22[1] = &unk_26D307630;
        v21[1] = @"Line";
        v21[2] = @"Method";
        v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v22[2] = v15;
        v21[3] = *MEMORY[0x263F07F80];
        id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 186);
        v22[3] = v16;
        id v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
        id v6 = [v13 errorWithDomain:v12 code:9 userInfo:v17];
      }
    }
  }
  return v6;
}

- (id)setActiveCredential:(id)a3
{
  v57[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _os_activity_create(&dword_221170000, "setActiveCredential:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 198, self, @"%@", v7, v8, (uint64_t)v5);
  id v9 = [(STSSessionBase *)self handler];

  if (v9)
  {
    if (!v5
      || ([(STSSessionBase *)self handler],
          id v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 supportedCredentialType],
          int v14 = [v5 type],
          v12,
          v13 == v14))
    {
      v15 = 0;
      goto LABEL_11;
    }
    id v17 = [(STSSessionBase *)self handler];
    v18 = [v17 activeSTSCredential];
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 210, self, @"new handler required, switching credential from %@ to %@", v19, v20, (uint64_t)v18);

    uint64_t v21 = [(STSSessionBase *)self createHandlerForCredential:v5];
    if (!v21)
    {
      v46 = (void *)MEMORY[0x263F087E8];
      v40 = [NSString stringWithUTF8String:"STS.fwk"];
      v56[0] = *MEMORY[0x263F08320];
      v47 = [NSString stringWithUTF8String:"Feature Not Supported"];
      v57[0] = v47;
      v57[1] = &unk_26D307648;
      v56[1] = @"Line";
      v56[2] = @"Method";
      v48 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2), v5);
      v57[2] = v48;
      v56[3] = *MEMORY[0x263F07F80];
      v49 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 213);
      v57[3] = v49;
      v50 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:4];
      v35 = [v46 errorWithDomain:v40 code:11 userInfo:v50];

LABEL_18:
      goto LABEL_19;
    }
    id v16 = (void *)v21;
    v22 = [(STSSessionBase *)self handler];
    [v22 tearDownWithCompletion:0];

    [(STSSessionBase *)self setHandler:v16];
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 219, self, @"Waiting for Control SE session ready", v23, v24, v52);
    uint64_t v25 = [(STSSessionBase *)self waitForControlSessionToBeReady:1];
    v15 = (void *)v25;
    if (v25) {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 223, self, @"Control SE session not ready: %@", v26, v27, v25);
    }
LABEL_10:

LABEL_11:
    v28 = [(STSSessionBase *)self handler];

    if (v28)
    {
      v31 = [(STSSessionBase *)self handler];
      int v32 = [v31 activateChildSessionOnSetActiveCredential];

      if (v32)
      {
        v35 = [(STSSessionBase *)self activateChildSession];

        if (v35)
        {
          sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 233, self, @"Handler activation failure: %@", v36, v37, (uint64_t)v35);
          v38 = [(STSSessionBase *)self handler];
          [v38 tearDownWithCompletion:0];

          [(STSSessionBase *)self setHandler:0];
          goto LABEL_19;
        }
      }
      else
      {
        sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 240, self, @" Handoff not ready to be activated yet", v33, v34, v51);
      }
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 243, self, @"Seting new activeCredential %@ on handler", v36, v37, (uint64_t)v5);
      v40 = [(STSSessionBase *)self handler];
      v35 = [v40 setActiveCredential:v5];
    }
    else
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 246, self, @"Unable to find a valid handler", v29, v30, v51);
      v39 = (void *)MEMORY[0x263F087E8];
      v40 = [NSString stringWithUTF8String:"STS.fwk"];
      v54[0] = *MEMORY[0x263F08320];
      v41 = [NSString stringWithUTF8String:"Feature Not Supported"];
      v55[0] = v41;
      v55[1] = &unk_26D307660;
      v54[1] = @"Line";
      v54[2] = @"Method";
      v42 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v55[2] = v42;
      v54[3] = *MEMORY[0x263F07F80];
      v43 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 247);
      v55[3] = v43;
      v44 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:4];
      v35 = [v39 errorWithDomain:v40 code:11 userInfo:v44];
    }
    goto LABEL_18;
  }
  if (v5)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 206, self, @"Creating initial handler", v10, v11, v51);
    id v16 = [(STSSessionBase *)self createHandlerForCredential:v5];
    [(STSSessionBase *)self setHandler:v16];
    v15 = 0;
    goto LABEL_10;
  }
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 202, self, @"Handler does not exist for deactivation.", v10, v11, v51);
  v35 = 0;
LABEL_19:

  return v35;
}

- (id)validateCredentials:(id)a3
{
  v45[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![v5 count])
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase validateCredentials:]", 255, self, @"Empty credential array provided.", v6, v7, v33);
    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = [NSString stringWithUTF8String:"STS.fwk"];
    v44[0] = *MEMORY[0x263F08320];
    id v13 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v45[0] = v13;
    v45[1] = &unk_26D307678;
    v44[1] = @"Line";
    v44[2] = @"Method";
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v45[2] = v23;
    v44[3] = *MEMORY[0x263F07F80];
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 256);
    v45[3] = v24;
    uint64_t v25 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];
    uint64_t v21 = [v22 errorWithDomain:v8 code:8 userInfo:v25];
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v8 = [v5 firstObject];
  uint64_t v9 = [v8 type];
  if (!v9)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase validateCredentials:]", 263, self, @"Invalid credential type.", v10, v11, v33);
    v31 = (void *)MEMORY[0x263F087E8];
    id v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v42[0] = *MEMORY[0x263F08320];
    uint64_t v23 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v43[0] = v23;
    v43[1] = &unk_26D307690;
    v42[1] = @"Line";
    v42[2] = @"Method";
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v43[2] = v24;
    v42[3] = *MEMORY[0x263F07F80];
    uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 264);
    v43[3] = v25;
    uint64_t v29 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:4];
    uint64_t v21 = [v31 errorWithDomain:v13 code:8 userInfo:v29];
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v12 = v9;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        unsigned int v18 = [*(id *)(*((void *)&v35 + 1) + 8 * i) type];
        if (v12 != v18)
        {
          uint64_t v34 = v12;
          sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase validateCredentials:]", 272, self, @"Invalid or mismatching credential types; found %d, expects %d",
            v19,
            v20,
            v18);
          uint64_t v26 = (void *)MEMORY[0x263F087E8];
          uint64_t v23 = [NSString stringWithUTF8String:"STS.fwk"];
          v39[0] = *MEMORY[0x263F08320];
          uint64_t v24 = [NSString stringWithUTF8String:"Invalid Parameter"];
          v40[0] = v24;
          v40[1] = &unk_26D3076A8;
          v39[1] = @"Line";
          v39[2] = @"Method";
          uint64_t v27 = NSString;
          Name = sel_getName(a2);
          uint64_t v25 = objc_msgSend(v27, "stringWithFormat:", @"%s", Name, v34, (void)v35);
          v40[2] = v25;
          v39[3] = *MEMORY[0x263F07F80];
          uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 273);
          v40[3] = v29;
          uint64_t v30 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];
          uint64_t v21 = [v26 errorWithDomain:v23 code:8 userInfo:v30];

          goto LABEL_15;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  uint64_t v21 = 0;
LABEL_17:

  return v21;
}

- (id)setActiveCredentials:(id)a3
{
  v58[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = _os_activity_create(&dword_221170000, "setActiveCredentials:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 285, self, @"%@", v7, v8, (uint64_t)v5);
  if ([v5 count] != 1)
  {
    if (v5)
    {
      uint64_t v10 = [(STSSessionBase *)self validateCredentials:v5];
      if (v10) {
        goto LABEL_26;
      }
      uint64_t v9 = [v5 firstObject];
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v11 = [(STSSessionBase *)self handler];

    if (v11)
    {
      if (!v9
        || ([(STSSessionBase *)self handler],
            uint64_t v14 = objc_claimAutoreleasedReturnValue(),
            int v15 = [v14 supportedCredentialType],
            int v16 = [v9 type],
            v14,
            v15 == v16))
      {
        id v17 = 0;
        goto LABEL_17;
      }
      uint64_t v19 = [(STSSessionBase *)self handler];
      uint64_t v20 = [v19 activeSTSCredential];
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 314, self, @"new handler required, switching credential from %@ to %@", v21, v22, (uint64_t)v20);

      uint64_t v23 = [(STSSessionBase *)self createHandlerForCredential:v9];
      if (!v23)
      {
        v47 = (void *)MEMORY[0x263F087E8];
        v41 = [NSString stringWithUTF8String:"STS.fwk"];
        v57[0] = *MEMORY[0x263F08320];
        v48 = [NSString stringWithUTF8String:"Feature Not Supported"];
        v58[0] = v48;
        v58[1] = &unk_26D3076C0;
        v57[1] = @"Line";
        v57[2] = @"Method";
        v49 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2), v9);
        v58[2] = v49;
        v57[3] = *MEMORY[0x263F07F80];
        v50 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 317);
        v58[3] = v50;
        uint64_t v51 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:4];
        uint64_t v10 = [v47 errorWithDomain:v41 code:11 userInfo:v51];

        goto LABEL_24;
      }
      unsigned int v18 = (void *)v23;
      uint64_t v24 = [(STSSessionBase *)self handler];
      [v24 tearDownWithCompletion:0];

      [(STSSessionBase *)self setHandler:v18];
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 323, self, @"Waiting for Control SE session ready", v25, v26, v53);
      uint64_t v27 = [(STSSessionBase *)self waitForControlSessionToBeReady:1];
      id v17 = (void *)v27;
      if (v27) {
        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 327, self, @"Control SE session not ready: %@", v28, v29, v27);
      }
    }
    else
    {
      if (!v5)
      {
        sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 306, self, @"Handler does not exist for deactivation.", v12, v13, v52);
        uint64_t v10 = 0;
        goto LABEL_25;
      }
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 310, self, @"Creating initial handler", v12, v13, v52);
      unsigned int v18 = [(STSSessionBase *)self createHandlerForCredential:v9];
      [(STSSessionBase *)self setHandler:v18];
      id v17 = 0;
    }

LABEL_17:
    uint64_t v30 = [(STSSessionBase *)self handler];

    if (v30)
    {
      uint64_t v33 = [(STSSessionBase *)self handler];
      int v34 = [v33 activateChildSessionOnSetActiveCredential];

      if (v34)
      {
        uint64_t v10 = [(STSSessionBase *)self activateChildSession];

        if (v10)
        {
          sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 337, self, @"Handler activation failure: %@", v37, v38, (uint64_t)v10);
          v39 = [(STSSessionBase *)self handler];
          [v39 tearDownWithCompletion:0];

          [(STSSessionBase *)self setHandler:0];
          goto LABEL_25;
        }
      }
      else
      {
        sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 343, self, @"Handler not ready to be activated yet", v35, v36, v52);
      }
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 346, self, @"Setting new activeCredentials %@ on handler", v37, v38, (uint64_t)v5);
      v41 = [(STSSessionBase *)self handler];
      uint64_t v10 = [v41 setActiveCredentials:v5];
    }
    else
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 349, self, @"Unable to find a valid handler", v31, v32, v52);
      v40 = (void *)MEMORY[0x263F087E8];
      v41 = [NSString stringWithUTF8String:"STS.fwk"];
      v55[0] = *MEMORY[0x263F08320];
      v42 = [NSString stringWithUTF8String:"Feature Not Supported"];
      v56[0] = v42;
      v56[1] = &unk_26D3076D8;
      v55[1] = @"Line";
      v55[2] = @"Method";
      v43 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v56[2] = v43;
      v55[3] = *MEMORY[0x263F07F80];
      v44 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 350);
      v56[3] = v44;
      v45 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:4];
      uint64_t v10 = [v40 errorWithDomain:v41 code:11 userInfo:v45];
    }
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v9 = [v5 firstObject];
  uint64_t v10 = [(STSSessionBase *)self setActiveCredential:v9];
LABEL_25:

LABEL_26:
  return v10;
}

- (id)createHandoffToken:(id *)a3
{
  v33[5] = *MEMORY[0x263EF8340];
  uint64_t v6 = [(STSSessionBase *)self handler];
  uint64_t v7 = [v6 handoffToken];

  if (v7)
  {
    uint64_t v8 = [(STSSessionBase *)self handler];
    uint64_t v9 = [v8 handoffToken];
    *a3 = (id)[v9 copy];

    uint64_t v10 = 0;
    goto LABEL_9;
  }
  uint64_t v11 = [(STSSessionBase *)self masterSESession];
  id v29 = 0;
  uint64_t v12 = [v11 createSessionHandoffToken:&v29];
  id v13 = v29;

  if (v13)
  {
    *a3 = 0;
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    int v15 = [NSString stringWithUTF8String:"STS.fwk"];
    v32[0] = *MEMORY[0x263F08320];
    int v16 = [NSString stringWithUTF8String:"Unexpected Result"];
    uint64_t v17 = *MEMORY[0x263F08608];
    v33[0] = v16;
    v33[1] = v13;
    v32[1] = v17;
    v32[2] = @"Line";
    v33[2] = &unk_26D3076F0;
    v32[3] = @"Method";
    unsigned int v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v33[3] = v18;
    v32[4] = *MEMORY[0x263F07F80];
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 367);
    v33[4] = v19;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:5];
    uint64_t v21 = v14;
    uint64_t v22 = v15;
    uint64_t v23 = 10;
  }
  else
  {
    if ([v12 length])
    {
      uint64_t v10 = 0;
      *a3 = v12;
      goto LABEL_8;
    }
    *a3 = 0;
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase createHandoffToken:]", 370, self, @"Invalid token", v24, v25, v28);
    uint64_t v27 = (void *)MEMORY[0x263F087E8];
    int v15 = [NSString stringWithUTF8String:"STS.fwk"];
    v30[0] = *MEMORY[0x263F08320];
    int v16 = [NSString stringWithUTF8String:"Invalid State"];
    v31[0] = v16;
    v31[1] = &unk_26D307708;
    v30[1] = @"Line";
    v30[2] = @"Method";
    unsigned int v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v31[2] = v18;
    v30[3] = *MEMORY[0x263F07F80];
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 371);
    v31[3] = v19;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
    uint64_t v21 = v27;
    uint64_t v22 = v15;
    uint64_t v23 = 9;
  }
  uint64_t v10 = [v21 errorWithDomain:v22 code:v23 userInfo:v20];

LABEL_8:
LABEL_9:
  return v10;
}

- (void)setSessionTimeLimit:(double)a3
{
  id v5 = _os_activity_create(&dword_221170000, "setSessionTimeLimit:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  if (a3 <= 0.0)
  {
    [(STSSessionBase *)self clearSessionTimer];
  }
  else
  {
    sessionKillSwitch = self->_sessionKillSwitch;
    if (!sessionKillSwitch)
    {
      objc_initWeak((id *)&state, self);
      uint64_t v7 = [STSTimer alloc];
      uint64_t v10 = MEMORY[0x263EF8330];
      uint64_t v11 = 3221225472;
      uint64_t v12 = sub_221176CAC;
      id v13 = &unk_2645945D0;
      objc_copyWeak(v14, (id *)&state);
      v14[1] = *(id *)&a3;
      uint64_t v8 = [(STSTimer *)v7 initSleepTimerWithCallback:&v10 queue:self->_callbackQueue];
      uint64_t v9 = self->_sessionKillSwitch;
      self->_sessionKillSwitch = v8;

      objc_destroyWeak(v14);
      objc_destroyWeak((id *)&state);
      sessionKillSwitch = self->_sessionKillSwitch;
    }
    -[STSTimer startTimer:](sessionKillSwitch, "startTimer:", a3, v10, v11, v12, v13);
  }
}

- (void)clearSessionTimer
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase clearSessionTimer]", 411, self, @"Clearing session kill switch timer", v2, v3, v6);
  [(STSTimer *)self->_sessionKillSwitch stopTimer];
  sessionKillSwitch = self->_sessionKillSwitch;
  self->_sessionKillSwitch = 0;
}

- (double)isTimeLimited
{
  return 900.0;
}

- (void)_tearDownOnQueue:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(void))a4;
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase _tearDownOnQueue:completion:]", 422, self, &stru_26D2FDEC0, v7, v8, v17[0]);
  if (v4) {
    uint64_t v9 = dispatch_group_create();
  }
  else {
    uint64_t v9 = 0;
  }
  os_unfair_lock_lock(&self->_sessionUpdateLock);
  uint64_t v10 = [(STSSessionBase *)self handler];

  if (v10)
  {
    if (v9) {
      dispatch_group_enter(v9);
    }
    uint64_t v11 = [(STSSessionBase *)self handler];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_221177208;
    v23[3] = &unk_2645945F8;
    uint64_t v24 = v9;
    [v11 tearDownWithCompletion:v23];

    [(STSSessionBase *)self setHandler:0];
  }
  uint64_t v12 = [(STSSessionBase *)self masterSESession];

  if (v12)
  {
    if (v9) {
      dispatch_group_enter(v9);
    }
    id v13 = [(STSSessionBase *)self masterSESession];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_221177218;
    v21[3] = &unk_264594620;
    uint64_t v22 = v9;
    [v13 endSessionWithCompletion:v21];

    [(STSSessionBase *)self setMasterSESession:0];
  }
  uint64_t v14 = [(STSSessionBase *)self initiatingSession];

  if (v14)
  {
    if (v9) {
      dispatch_group_enter(v9);
    }
    int v15 = [(STSSessionBase *)self initiatingSession];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_221177228;
    v19[3] = &unk_264594620;
    uint64_t v20 = v9;
    [v15 endSessionWithCompletion:v19];

    [(STSSessionBase *)self setInitiatingSession:0];
  }
  os_unfair_lock_unlock(&self->_sessionUpdateLock);
  if (v6)
  {
    if (v9)
    {
      int v16 = [(STSSessionBase *)self callbackQueue];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = (uint64_t)sub_221177238;
      v17[3] = (uint64_t)&unk_264594648;
      unsigned int v18 = v6;
      dispatch_group_notify(v9, v16, v17);
    }
    else
    {
      v6[2](v6);
    }
  }
}

- (void)handleSessionSuspended:(id)a3 withToken:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase handleSessionSuspended:withToken:]", 466, v7, @"Control SE session is suspended with token: %@", v8, v9, (uint64_t)v6);
  v7->_controlSessionSuspended = 1;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  controlSessionSem = v7->_controlSessionSem;
  v7->_controlSessionSem = (OS_dispatch_semaphore *)v10;

  objc_sync_exit(v7);
}

- (void)handleSessionResumed:(id)a3
{
  id v9 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase handleSessionResumed:]", 474, v4, @"Control SE session resumed", v5, v6, v8);
  v4->_controlSessionSuspended = 0;
  controlSessionSem = v4->_controlSessionSem;
  if (controlSessionSem) {
    dispatch_semaphore_signal(controlSessionSem);
  }
  objc_sync_exit(v4);
}

- (id)waitForControlSessionToBeReady:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v25[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL controlSessionSuspended = v5->_controlSessionSuspended;
  objc_sync_exit(v5);

  if (!controlSessionSuspended) {
    goto LABEL_6;
  }
  controlSessionSem = v5->_controlSessionSem;
  dispatch_time_t v8 = dispatch_time(0, 1000000000 * (int)v3);
  if (dispatch_semaphore_wait(controlSessionSem, v8)) {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase waitForControlSessionToBeReady:]", 492, v5, @"Control SE session failed to resume after %d seconds", v9, v10, v3);
  }
  uint64_t v11 = v5;
  objc_sync_enter(v11);
  BOOL v12 = v5->_controlSessionSuspended;
  objc_sync_exit(v11);

  if (v12)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase waitForControlSessionToBeReady:]", 501, v11, @"Control SE session did not resume", v13, v14, v23);
    int v15 = (void *)MEMORY[0x263F087E8];
    int v16 = [NSString stringWithUTF8String:"STS.fwk"];
    v24[0] = *MEMORY[0x263F08320];
    uint64_t v17 = [NSString stringWithUTF8String:"Invalid State"];
    v25[0] = v17;
    v25[1] = &unk_26D307720;
    v24[1] = @"Line";
    v24[2] = @"Method";
    unsigned int v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v25[2] = v18;
    v24[3] = *MEMORY[0x263F07F80];
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 502);
    v25[3] = v19;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
    uint64_t v21 = [v15 errorWithDomain:v16 code:9 userInfo:v20];
  }
  else
  {
LABEL_6:
    uint64_t v21 = 0;
  }
  return v21;
}

- (void)secureElementManagerSessionDidEndUnexpectedly:(id)a3
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase secureElementManagerSessionDidEndUnexpectedly:]", 511, self, @"Connection closed unexpectedly.", v3, v4, v6);
  [(STSSessionBase *)self fireSessionDidEndUnexpectedlyEventWithStatus:0];
}

- (STSSessionBaseDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STSSessionBaseDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (STSHandler)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NFSession)initiatingSession
{
  return self->_initiatingSession;
}

- (void)setInitiatingSession:(id)a3
{
}

- (NFSecureElementManagerSession)masterSESession
{
  return self->_masterSESession;
}

- (void)setMasterSESession:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (id)theStartCallback
{
  return self->_theStartCallback;
}

- (void)setTheStartCallback:(id)a3
{
}

- (BOOL)hasStartedWithDelegate
{
  return self->_hasStartedWithDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_theStartCallback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_masterSESession, 0);
  objc_storeStrong((id *)&self->_initiatingSession, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_sessionKillSwitch, 0);
  objc_storeStrong((id *)&self->_nfHwManager, 0);
  objc_storeStrong((id *)&self->_controlSessionSem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)fireSessionDidEndUnexpectedlyEventWithStatus:(unint64_t)a3
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase(EVENTS) fireSessionDidEndUnexpectedlyEventWithStatus:]", 16, self, @"fireSessionDidEndUnexpectedlyEventWithStatus %d", v3, v4, a3);
  id v7 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 stsSessionDidEndUnexpectedly:self errorCode:a3];
  }
}

@end