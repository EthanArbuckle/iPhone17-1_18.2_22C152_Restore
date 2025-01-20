@interface NFConnectionHandoverReceiver
+ (id)receiverWithDelegate:(id)a3;
+ (id)receiverWithDelegate:(id)a3 callbackQueue:(id)a4;
- (BOOL)_processSelectCommand:(id)a3 response:(id)a4;
- (BOOL)roleBroadcastInBackground;
- (BOOL)sendHandoverSelect:(id)a3 error:(id *)a4;
- (NFConnectionHandoverReceiver)initWithDelegate:(id)a3;
- (NFConnectionHandoverReceiver)initWithDelegate:(id)a3 callbackQueue:(id)a4;
- (NFConnectionHandoverReceiverDelegate)delegate;
- (void)_emuAssertTimerExpired;
- (void)_processConnect;
- (void)_processDisconnectWithPossibleDiscoveryRestart:(uint64_t)a1;
- (void)_processRetryRequest:(id)a3;
- (void)_sendFailureAPDU;
- (void)_startWithAutoResume:(BOOL)a3 customBroadcastData:(id)a4;
- (void)_stopWithError:(id)a3;
- (void)_triggerSessionInvalidatedCB:(uint64_t)a1;
- (void)forceResumeWithCompletionHandler:(id)a3;
- (void)handleSessionResumed;
- (void)hceSession:(id)a3 didReceiveAPDU:(id)a4;
- (void)hceSession:(id)a3 didReceiveField:(id)a4;
- (void)hceSession:(id)a3 triggeredByField:(id)a4 started:(BOOL)a5;
- (void)hceSessionDidConnect:(id)a3;
- (void)hceSessionDidDisconnect:(id)a3;
- (void)hceSessionDidEndUnexpectedly:(id)a3;
- (void)sendHandoverSelect:(id)a3 delay:(double)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setEmuAssertTimer:(uint64_t)a1;
- (void)setPendingCHSelect:(uint64_t)a1;
- (void)start;
- (void)startAutoResumeOnFieldDisableWithCustomBroadcastData:(id)a3;
- (void)startWithAutoResumeOnFieldDisable;
- (void)startWithCustomBroadcastData:(id)a3;
- (void)stop;
@end

@implementation NFConnectionHandoverReceiver

+ (id)receiverWithDelegate:(id)a3
{
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v5 = a3;
  dispatch_queue_t v6 = dispatch_queue_create("NFConnectionHandoverReceiverCallback", v4);

  v7 = [[NFConnectionHandoverReceiver alloc] initWithDelegate:v5 callbackQueue:v6];
  return v7;
}

+ (id)receiverWithDelegate:(id)a3 callbackQueue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[NFConnectionHandoverReceiver alloc] initWithDelegate:v6 callbackQueue:v5];

  return v7;
}

- (NFConnectionHandoverReceiver)initWithDelegate:(id)a3
{
  id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v6 = a3;
  dispatch_queue_t v7 = dispatch_queue_create("NFConnectionHandoverReceiverCallback", v5);

  v8 = [(NFConnectionHandoverReceiver *)self initWithDelegate:v6 callbackQueue:v7];
  return v8;
}

- (NFConnectionHandoverReceiver)initWithDelegate:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NFHardwareManager sharedHardwareManager];
  int v9 = [v8 isBackgroundTagReadingAvailable];

  if (v9) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  v11 = (NFConnectionHandoverReceiver *)-[NFConnectionHandoverController initWithType:initiator:callbackQueue:]((id *)&self->super.super.isa, (void *)v10, 0, v7);

  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v6);
    v12 = v11;
  }

  return v11;
}

- (BOOL)roleBroadcastInBackground
{
  v2 = +[NFHardwareManager sharedHardwareManager];
  char v3 = [v2 isBackgroundTagReadingAvailable];

  return v3;
}

- (void)forceResumeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self) {
    hceSession = self->_hceSession;
  }
  else {
    hceSession = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__NFConnectionHandoverReceiver_forceResumeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E595D5E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFHCESession *)hceSession resumeSessionFromWaitingOnFieldWithCompletion:v7];
}

void __65__NFConnectionHandoverReceiver_forceResumeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(NSObject **)(v4 + 32);
  }
  else {
    id v5 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__NFConnectionHandoverReceiver_forceResumeWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E595D540;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __65__NFConnectionHandoverReceiver_forceResumeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)startWithAutoResumeOnFieldDisable
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__NFConnectionHandoverReceiver_startWithAutoResumeOnFieldDisable__block_invoke;
  v2[3] = &unk_1E595CC98;
  v2[4] = self;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v2);
}

uint64_t __65__NFConnectionHandoverReceiver_startWithAutoResumeOnFieldDisable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startWithAutoResume:0 customBroadcastData:0];
}

- (void)startAutoResumeOnFieldDisableWithCustomBroadcastData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__NFConnectionHandoverReceiver_startAutoResumeOnFieldDisableWithCustomBroadcastData___block_invoke;
  v6[3] = &unk_1E595D0C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v6);
}

uint64_t __85__NFConnectionHandoverReceiver_startAutoResumeOnFieldDisableWithCustomBroadcastData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startWithAutoResume:0 customBroadcastData:*(void *)(a1 + 40)];
}

- (void)start
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__NFConnectionHandoverReceiver_start__block_invoke;
  v2[3] = &unk_1E595CC98;
  v2[4] = self;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v2);
}

uint64_t __37__NFConnectionHandoverReceiver_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startWithAutoResume:1 customBroadcastData:0];
}

- (void)startWithCustomBroadcastData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__NFConnectionHandoverReceiver_startWithCustomBroadcastData___block_invoke;
  v6[3] = &unk_1E595D0C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v6);
}

uint64_t __61__NFConnectionHandoverReceiver_startWithCustomBroadcastData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startWithAutoResume:1 customBroadcastData:*(void *)(a1 + 40)];
}

- (void)_startWithAutoResume:(BOOL)a3 customBroadcastData:(id)a4
{
  BOOL v4 = a3;
  v114[5] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v7 length] == 6) {
        goto LABEL_4;
      }
      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      v16 = [NSString stringWithUTF8String:"nfcd"];
      v111[0] = *MEMORY[0x1E4F28568];
      v21 = [NSString stringWithUTF8String:"Invalid Parameter"];
      v112[0] = v21;
      v112[1] = &unk_1EEF357A0;
      v111[1] = @"Line";
      v111[2] = @"Method";
      v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
      v112[2] = v22;
      v111[3] = *MEMORY[0x1E4F28228];
      v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 1221);
      v112[3] = v23;
      v111[4] = *MEMORY[0x1E4F28588];
      v24 = (void *)[[NSString alloc] initWithFormat:@"Invalid data length"];
      v112[4] = v24;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      v26 = v112;
      v27 = v111;
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      v16 = [NSString stringWithUTF8String:"nfcd"];
      v113[0] = *MEMORY[0x1E4F28568];
      v21 = [NSString stringWithUTF8String:"Invalid Parameter"];
      v114[0] = v21;
      v114[1] = &unk_1EEF35788;
      v113[1] = @"Line";
      v113[2] = @"Method";
      v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
      v114[2] = v22;
      v113[3] = *MEMORY[0x1E4F28228];
      v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 1218);
      v114[3] = v23;
      v113[4] = *MEMORY[0x1E4F28588];
      v24 = (void *)[[NSString alloc] initWithFormat:@"Invalid data type"];
      v114[4] = v24;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      v26 = v114;
      v27 = v113;
    }
    v28 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:5];
    v29 = v20;
    v30 = v16;
    uint64_t v31 = 10;
LABEL_20:
    v32 = (void *)[v29 initWithDomain:v30 code:v31 userInfo:v28];
    -[NFConnectionHandoverReceiver _triggerSessionInvalidatedCB:]((uint64_t)self, v32);

LABEL_21:
    goto LABEL_22;
  }
LABEL_4:
  if (!self) {
    goto LABEL_23;
  }
  int64_t state = self->super._state;
  if (state == 3)
  {
    v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19D636000, v16, OS_LOG_TYPE_FAULT, "Dropping start request due to invalidation is in progress", buf, 2u);
    }
    goto LABEL_21;
  }
  if (state != 2)
  {
    if (state == 1)
    {
      id v9 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v15 = 45;
        if (isMetaClass) {
          uint64_t v15 = 43;
        }
        v11(6, "%c[%{public}s %{public}s]:%i Start is in progress", v15, ClassName, Name, 1227);
      }
      dispatch_get_specific(*v9);
      v16 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v98 = v18;
      __int16 v99 = 2082;
      v100 = object_getClassName(self);
      __int16 v101 = 2082;
      v102 = sel_getName(a2);
      __int16 v103 = 1024;
      int v104 = 1227;
      v19 = "%c[%{public}s %{public}s]:%i Start is in progress";
      goto LABEL_66;
    }
LABEL_23:
    v33 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v34 = NFLogGetLogger();
    v35 = (void (*)(uint64_t, const char *, ...))v34;
    if (v7)
    {
      if (v34)
      {
        v36 = object_getClass(self);
        BOOL v37 = class_isMetaClass(v36);
        v38 = object_getClassName(self);
        v39 = sel_getName(a2);
        v40 = [v7 debugDescription];
        uint64_t v41 = 45;
        if (v37) {
          uint64_t v41 = 43;
        }
        v35(6, "%c[%{public}s %{public}s]:%i autoResume=%{public}d, customBroadcast=%{public}@", v41, v38, v39, 1245, v4, v40);
      }
      dispatch_get_specific(*v33);
      v42 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = object_getClass(self);
        if (class_isMetaClass(v43)) {
          int v44 = 43;
        }
        else {
          int v44 = 45;
        }
        v45 = object_getClassName(self);
        v46 = sel_getName(a2);
        v47 = [v7 debugDescription];
        *(_DWORD *)buf = 67110402;
        int v98 = v44;
        __int16 v99 = 2082;
        v100 = v45;
        __int16 v101 = 2082;
        v102 = v46;
        __int16 v103 = 1024;
        int v104 = 1245;
        __int16 v105 = 1026;
        BOOL v106 = v4;
        __int16 v107 = 2114;
        v108 = v47;
        _os_log_impl(&dword_19D636000, v42, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i autoResume=%{public}d, customBroadcast=%{public}@", buf, 0x32u);
      }
    }
    else
    {
      if (v34)
      {
        v59 = object_getClass(self);
        BOOL v60 = class_isMetaClass(v59);
        v85 = object_getClassName(self);
        v88 = sel_getName(a2);
        uint64_t v61 = 45;
        if (v60) {
          uint64_t v61 = 43;
        }
        v35(6, "%c[%{public}s %{public}s]:%i autoResume=%{public}d", v61, v85, v88, 1247, v4);
      }
      dispatch_get_specific(*v33);
      v42 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v62 = object_getClass(self);
        if (class_isMetaClass(v62)) {
          int v63 = 43;
        }
        else {
          int v63 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v98 = v63;
        __int16 v99 = 2082;
        v100 = object_getClassName(self);
        __int16 v101 = 2082;
        v102 = sel_getName(a2);
        __int16 v103 = 1024;
        int v104 = 1247;
        __int16 v105 = 1026;
        BOOL v106 = v4;
        _os_log_impl(&dword_19D636000, v42, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i autoResume=%{public}d", buf, 0x28u);
      }
    }

    if (self)
    {
      if (self->_hceSession)
      {
        dispatch_get_specific(*v33);
        uint64_t v64 = NFLogGetLogger();
        if (v64)
        {
          v65 = (void (*)(uint64_t, const char *, ...))v64;
          v66 = object_getClass(self);
          BOOL v67 = class_isMetaClass(v66);
          v68 = object_getClassName(self);
          v89 = sel_getName(a2);
          uint64_t v69 = 45;
          if (v67) {
            uint64_t v69 = 43;
          }
          v65(6, "%c[%{public}s %{public}s]:%i Already started in receiver mode", v69, v68, v89, 1251);
        }
        dispatch_get_specific(*v33);
        v16 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        v70 = object_getClass(self);
        if (class_isMetaClass(v70)) {
          int v71 = 43;
        }
        else {
          int v71 = 45;
        }
        v72 = object_getClassName(self);
        v73 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v98 = v71;
        __int16 v99 = 2082;
        v100 = v72;
        __int16 v101 = 2082;
        v102 = v73;
        __int16 v103 = 1024;
        int v104 = 1251;
        v19 = "%c[%{public}s %{public}s]:%i Already started in receiver mode";
LABEL_66:
        _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0x22u);
        goto LABEL_21;
      }
      self->_hceAppSelected = 0;
    }
    v16 = _GenerateInitiatorECPFrame(0);
    uint64_t v74 = _GeneratePreferredReceiverECPFrame(0);
    v75 = _GenerateAutoNegotiationECPFrame(0);
    v76 = objc_opt_new();
    [v76 addObject:v16];
    if (self && self->super._type == 2)
    {
      [v76 addObject:v74];
      [v76 addObject:v75];
    }
    v90 = (void *)v74;
    id v77 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v95[0] = @"StartOnECP";
    v95[1] = @"EmulationOnSessionStart";
    v96[0] = v76;
    v96[1] = &unk_1EEF357D0;
    v95[2] = @"ReadOnReaderConnected";
    v95[3] = @"SuspendOnDisconnect";
    v96[2] = &unk_1EEF357D0;
    v96[3] = &unk_1EEF357D0;
    v95[4] = @"BackgroundTagReadingECP";
    v95[5] = @"ListenOnAllField";
    v96[4] = &unk_1EEF357D0;
    v96[5] = &unk_1EEF357D0;
    v96[6] = &unk_1EEF357D0;
    v95[6] = @"FDRestartOnMatchingECPTermInfo";
    v95[7] = @"disableAutostartOnField";
    v78 = [NSNumber numberWithInt:!v4];
    v96[7] = v78;
    v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:8];
    v80 = (void *)[v77 initWithDictionary:v79];

    if (self && self->super._type == 2)
    {
      v81 = _GeneratePreferredReceiverECPFrame(v7);
      [v80 setObject:v81 forKey:@"ECPBroadcast"];

      v94 = v75;
      v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
      [v80 setObject:v82 forKey:@"ECPBroadcastFieldMatch"];
    }
    else
    {
      if (v7)
      {
        v83 = _GenerateAutoNegotiationECPFrame(v7);
        [v80 setObject:v83 forKeyedSubscript:@"bkgTagReadECPOverride"];
      }
      if (!self) {
        goto LABEL_78;
      }
    }
    self->super._int64_t state = 1;
LABEL_78:
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __73__NFConnectionHandoverReceiver__startWithAutoResume_customBroadcastData___block_invoke;
    v91[3] = &unk_1E595D4A0;
    id v92 = v80;
    SEL v93 = a2;
    v91[4] = self;
    id v84 = v80;
    +[NFHardwareManager sharedHardwareManagerWithOptions:&unk_1EEF35DC8 readyCompletion:v91];

    goto LABEL_21;
  }
  v48 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t v49 = NFLogGetLogger();
  if (v49)
  {
    v50 = (void (*)(uint64_t, const char *, ...))v49;
    v51 = object_getClass(self);
    BOOL v52 = class_isMetaClass(v51);
    v53 = object_getClassName(self);
    v87 = sel_getName(a2);
    uint64_t v54 = 45;
    if (v52) {
      uint64_t v54 = 43;
    }
    v50(6, "%c[%{public}s %{public}s]:%i Previously started", v54, v53, v87, 1232);
  }
  dispatch_get_specific(*v48);
  v55 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = object_getClass(self);
    if (class_isMetaClass(v56)) {
      int v57 = 43;
    }
    else {
      int v57 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v98 = v57;
    __int16 v99 = 2082;
    v100 = object_getClassName(self);
    __int16 v101 = 2082;
    v102 = sel_getName(a2);
    __int16 v103 = 1024;
    int v104 = 1232;
    _os_log_impl(&dword_19D636000, v55, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Previously started", buf, 0x22u);
  }

  if (v7)
  {
    id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
    v16 = [NSString stringWithUTF8String:"nfcd"];
    v109[0] = *MEMORY[0x1E4F28568];
    v21 = [NSString stringWithUTF8String:"Invalid State"];
    v110[0] = v21;
    v110[1] = &unk_1EEF357B8;
    v109[1] = @"Line";
    v109[2] = @"Method";
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
    v110[2] = v22;
    v109[3] = *MEMORY[0x1E4F28228];
    v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 1234);
    v110[3] = v23;
    v109[4] = *MEMORY[0x1E4F28588];
    v24 = (void *)[[NSString alloc] initWithFormat:@"Can't update broadcast data unless session is stopped"];
    v110[4] = v24;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:5];
    v29 = v58;
    v30 = v16;
    uint64_t v31 = 12;
    goto LABEL_20;
  }
LABEL_22:
}

- (void)_triggerSessionInvalidatedCB:(uint64_t)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1 && *(void *)(a1 + 24) != 4)
  {
    *(void *)(a1 + 24) = 4;
    id v5 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__NFConnectionHandoverReceiver__triggerSessionInvalidatedCB___block_invoke;
    block[3] = &unk_1E595CC48;
    block[4] = a1;
    id v7 = v3;
    id v8 = sel__triggerSessionInvalidatedCB_;
    dispatch_async(v5, block);
  }
}

void __73__NFConnectionHandoverReceiver__startWithAutoResume_customBroadcastData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(os_unfair_lock_s **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__NFConnectionHandoverReceiver__startWithAutoResume_customBroadcastData___block_invoke_2;
  v8[3] = &unk_1E595CDD8;
  id v9 = v3;
  id v10 = v4;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v11 = v7;
  id v6 = v3;
  -[NFConnectionHandoverController executeWithLock:](v4, v8);
}

void __73__NFConnectionHandoverReceiver__startWithAutoResume_customBroadcastData___block_invoke_2(uint64_t a1)
{
  v40[4] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) getHwSupport] - 4 > 0xFFFFFFFD)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9 && *(void *)(v9 + 24) == 1)
    {
      id v10 = *(void **)(a1 + 32);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __73__NFConnectionHandoverReceiver__startWithAutoResume_customBroadcastData___block_invoke_428;
      v30[3] = &unk_1E595D608;
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      v30[4] = v9;
      v30[5] = v12;
      v13 = [v10 startHCESessionWithConfiguration:v11 completion:v30];
      uint64_t v14 = *(void *)(a1 + 40);
      if (v14) {
        objc_storeStrong((id *)(v14 + 56), v13);
      }

      uint64_t v15 = *(void *)(a1 + 40);
      if (v15) {
        v16 = *(void **)(v15 + 56);
      }
      else {
        v16 = 0;
      }
      objc_msgSend(v16, "setDelegate:");
    }
    else
    {
      v17 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v19 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 40));
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 40));
        Name = sel_getName(*(SEL *)(a1 + 56));
        uint64_t v23 = 45;
        if (isMetaClass) {
          uint64_t v23 = 43;
        }
        v19(6, "%c[%{public}s %{public}s]:%i Previously start request is terminated", v23, ClassName, Name, 1307);
      }
      dispatch_get_specific(*v17);
      v24 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = object_getClass(*(id *)(a1 + 40));
        if (class_isMetaClass(v25)) {
          int v26 = 43;
        }
        else {
          int v26 = 45;
        }
        v27 = object_getClassName(*(id *)(a1 + 40));
        v28 = sel_getName(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 67109890;
        int v32 = v26;
        __int16 v33 = 2082;
        uint64_t v34 = v27;
        __int16 v35 = 2082;
        v36 = v28;
        __int16 v37 = 1024;
        int v38 = 1307;
        _os_log_impl(&dword_19D636000, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Previously start request is terminated", buf, 0x22u);
      }
    }
  }
  else
  {
    id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v3 = [NSString stringWithUTF8String:"nfcd"];
    v39[0] = *MEMORY[0x1E4F28568];
    BOOL v4 = [NSString stringWithUTF8String:"No NFC on device"];
    v40[0] = v4;
    v40[1] = &unk_1EEF357E8;
    v39[1] = @"Line";
    v39[2] = @"Method";
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
    v40[2] = v5;
    v39[3] = *MEMORY[0x1E4F28228];
    id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 1301);
    v40[3] = v6;
    long long v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:4];
    id v8 = (void *)[v2 initWithDomain:v3 code:57 userInfo:v7];

    -[NFConnectionHandoverReceiver _triggerSessionInvalidatedCB:](*(void *)(a1 + 40), v8);
  }
}

void __73__NFConnectionHandoverReceiver__startWithAutoResume_customBroadcastData___block_invoke_428(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    long long v7 = *(os_unfair_lock_s **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__NFConnectionHandoverReceiver__startWithAutoResume_customBroadcastData___block_invoke_2_429;
    v12[3] = &unk_1E595CC48;
    v12[4] = v7;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 40);
    id v13 = v8;
    uint64_t v14 = v9;
    -[NFConnectionHandoverController executeWithLock:](v7, v12);
  }
  else
  {
    [a2 setSessionTimeLimit:0.0];
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10 && *(void *)(v10 + 24) != 2)
    {
      *(void *)(v10 + 24) = 2;
      uint64_t v11 = *(NSObject **)(v10 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__NFConnectionHandoverReceiver__triggerSessionStartedCB__block_invoke;
      block[3] = &unk_1E595CC98;
      block[4] = v10;
      dispatch_async(v11, block);
    }
  }
}

void __73__NFConnectionHandoverReceiver__startWithAutoResume_customBroadcastData___block_invoke_2_429(uint64_t a1)
{
  v16[5] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  BOOL v4 = [NSString stringWithUTF8String:"nfcd"];
  uint64_t v5 = [*(id *)(a1 + 40) code];
  v15[0] = *MEMORY[0x1E4F28568];
  id v6 = NSString;
  if ([*(id *)(a1 + 40) code] > 70) {
    uint64_t v7 = 71;
  }
  else {
    uint64_t v7 = [*(id *)(a1 + 40) code];
  }
  id v8 = [v6 stringWithUTF8String:NFResultCodeString_0[v7]];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  uint64_t v10 = *(void *)(a1 + 40);
  v16[0] = v8;
  v16[1] = v10;
  v15[1] = v9;
  v15[2] = @"Line";
  v16[2] = &unk_1EEF35800;
  v15[3] = @"Method";
  uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v16[3] = v11;
  v15[4] = *MEMORY[0x1E4F28228];
  uint64_t v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 1315);
  v16[4] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];
  uint64_t v14 = (void *)[v3 initWithDomain:v4 code:v5 userInfo:v13];
  [v2 _stopWithError:v14];
}

- (void)stop
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __36__NFConnectionHandoverReceiver_stop__block_invoke;
  v2[3] = &unk_1E595CC98;
  v2[4] = self;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v2);
}

uint64_t __36__NFConnectionHandoverReceiver_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopWithError:0];
}

- (void)_stopWithError:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self) {
    goto LABEL_25;
  }
  int64_t state = self->super._state;
  if ((unint64_t)(state - 1) < 2)
  {
    int v18 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v23 = 45;
      if (isMetaClass) {
        uint64_t v23 = 43;
      }
      v20(6, "%c[%{public}s %{public}s]:%i error=%{public}@", v23, ClassName, Name, 1354, v5);
    }
    dispatch_get_specific(*v18);
    v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = object_getClass(self);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v59 = v26;
      __int16 v60 = 2082;
      uint64_t v61 = object_getClassName(self);
      __int16 v62 = 2082;
      int v63 = sel_getName(a2);
      __int16 v64 = 1024;
      int v65 = 1354;
      __int16 v66 = 2114;
      int64_t v67 = (int64_t)v5;
      _os_log_impl(&dword_19D636000, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
    }

    self->super._int64_t state = 3;
    hceSession = self->_hceSession;
    if (hceSession)
    {
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __47__NFConnectionHandoverReceiver__stopWithError___block_invoke;
      v56[3] = &unk_1E595D0C8;
      v56[4] = self;
      id v57 = v5;
      [(NFSession *)hceSession endSessionWithCompletion:v56];
      objc_storeStrong((id *)&self->_hceSession, 0);
    }
    else
    {
      -[NFConnectionHandoverReceiver _triggerSessionInvalidatedCB:]((uint64_t)self, 0);
    }
    self->_hceAppSelected = 0;
    self->_didConnect = 0;
    [(NFTimer *)self->_emuAssertTimer stopTimer];
    emuAssertTimer = self->_emuAssertTimer;
    self->_emuAssertTimer = 0;
    goto LABEL_52;
  }
  if (state != 4)
  {
    if (state == 3)
    {
      uint64_t v7 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v8 = NFLogGetLogger();
      if (v8)
      {
        uint64_t v9 = (void (*)(uint64_t, const char *, ...))v8;
        uint64_t v10 = object_getClass(self);
        BOOL v11 = class_isMetaClass(v10);
        uint64_t v12 = object_getClassName(self);
        v53 = sel_getName(a2);
        uint64_t v13 = 45;
        if (v11) {
          uint64_t v13 = 43;
        }
        v9(6, "%c[%{public}s %{public}s]:%i Stop in progress", v13, v12, v53, 1341);
      }
      dispatch_get_specific(*v7);
      emuAssertTimer = NFSharedLogGetLogger();
      if (os_log_type_enabled(emuAssertTimer, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = object_getClass(self);
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v59 = v16;
        __int16 v60 = 2082;
        uint64_t v61 = object_getClassName(self);
        __int16 v62 = 2082;
        int v63 = sel_getName(a2);
        __int16 v64 = 1024;
        int v65 = 1341;
        v17 = "%c[%{public}s %{public}s]:%i Stop in progress";
LABEL_48:
        uint64_t v41 = emuAssertTimer;
        uint32_t v42 = 34;
LABEL_49:
        _os_log_impl(&dword_19D636000, v41, OS_LOG_TYPE_DEFAULT, v17, buf, v42);
        goto LABEL_52;
      }
      goto LABEL_52;
    }
LABEL_25:
    v28 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v29 = NFLogGetLogger();
    if (v29)
    {
      v30 = (void (*)(uint64_t, const char *, ...))v29;
      uint64_t v31 = object_getClass(self);
      if (class_isMetaClass(v31)) {
        uint64_t v32 = 43;
      }
      else {
        uint64_t v32 = 45;
      }
      __int16 v33 = object_getClassName(self);
      uint64_t v34 = sel_getName(a2);
      if (self) {
        int64_t v35 = self->super._state;
      }
      else {
        int64_t v35 = 0;
      }
      v30(6, "%c[%{public}s %{public}s]:%i Session not started, state=%ld", v32, v33, v34, 1350, v35);
    }
    dispatch_get_specific(*v28);
    emuAssertTimer = NFSharedLogGetLogger();
    if (os_log_type_enabled(emuAssertTimer, OS_LOG_TYPE_DEFAULT))
    {
      v36 = object_getClass(self);
      if (class_isMetaClass(v36)) {
        int v37 = 43;
      }
      else {
        int v37 = 45;
      }
      int v38 = object_getClassName(self);
      v39 = sel_getName(a2);
      if (self) {
        int64_t v40 = self->super._state;
      }
      else {
        int64_t v40 = 0;
      }
      *(_DWORD *)buf = 67110146;
      int v59 = v37;
      __int16 v60 = 2082;
      uint64_t v61 = v38;
      __int16 v62 = 2082;
      int v63 = v39;
      __int16 v64 = 1024;
      int v65 = 1350;
      __int16 v66 = 2048;
      int64_t v67 = v40;
      v17 = "%c[%{public}s %{public}s]:%i Session not started, state=%ld";
      uint64_t v41 = emuAssertTimer;
      uint32_t v42 = 44;
      goto LABEL_49;
    }
    goto LABEL_52;
  }
  v43 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t v44 = NFLogGetLogger();
  if (v44)
  {
    v45 = (void (*)(uint64_t, const char *, ...))v44;
    v46 = object_getClass(self);
    BOOL v47 = class_isMetaClass(v46);
    v48 = object_getClassName(self);
    v55 = sel_getName(a2);
    uint64_t v49 = 45;
    if (v47) {
      uint64_t v49 = 43;
    }
    v45(6, "%c[%{public}s %{public}s]:%i Session previously invalidated", v49, v48, v55, 1345);
  }
  dispatch_get_specific(*v43);
  emuAssertTimer = NFSharedLogGetLogger();
  if (os_log_type_enabled(emuAssertTimer, OS_LOG_TYPE_DEFAULT))
  {
    v50 = object_getClass(self);
    if (class_isMetaClass(v50)) {
      int v51 = 43;
    }
    else {
      int v51 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v59 = v51;
    __int16 v60 = 2082;
    uint64_t v61 = object_getClassName(self);
    __int16 v62 = 2082;
    int v63 = sel_getName(a2);
    __int16 v64 = 1024;
    int v65 = 1345;
    v17 = "%c[%{public}s %{public}s]:%i Session previously invalidated";
    goto LABEL_48;
  }
LABEL_52:
}

void __47__NFConnectionHandoverReceiver__stopWithError___block_invoke(uint64_t a1)
{
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__NFConnectionHandoverReceiver__stopWithError___block_invoke_2;
  v2[3] = &unk_1E595D0C8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  -[NFConnectionHandoverController executeWithLock:](v1, v2);
}

void __47__NFConnectionHandoverReceiver__stopWithError___block_invoke_2(uint64_t a1)
{
}

- (void)setEmuAssertTimer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (BOOL)sendHandoverSelect:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__NFConnectionHandoverReceiver_sendHandoverSelect_error___block_invoke;
  v12[3] = &unk_1E595D630;
  id v13 = v7;
  SEL v14 = a2;
  v12[4] = self;
  id v8 = v7;
  uint64_t v9 = -[NFConnectionHandoverController executeWithLockAndReturn:]((os_unfair_lock_s *)self, v12);
  uint64_t v10 = v9;
  if (a4) {
    *a4 = v9;
  }

  return v10 == 0;
}

id __57__NFConnectionHandoverReceiver_sendHandoverSelect_error___block_invoke(uint64_t a1)
{
  v78[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || !*(unsigned char *)(v2 + 40))
  {
    uint64_t v23 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v25 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v29 = 45;
      if (isMetaClass) {
        uint64_t v29 = 43;
      }
      v25(3, "%c[%{public}s %{public}s]:%i App not selected", v29, ClassName, Name, 1378);
    }
    dispatch_get_specific(*v23);
    v30 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v31)) {
        int v32 = 43;
      }
      else {
        int v32 = 45;
      }
      __int16 v33 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v34 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v68 = v32;
      __int16 v69 = 2082;
      v70 = v33;
      __int16 v71 = 2082;
      v72 = v34;
      __int16 v73 = 1024;
      int v74 = 1378;
      _os_log_impl(&dword_19D636000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i App not selected", buf, 0x22u);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    int v16 = [NSString stringWithUTF8String:"nfcd"];
    v77[0] = *MEMORY[0x1E4F28568];
    v17 = [NSString stringWithUTF8String:"Invalid State"];
    v78[0] = v17;
    v78[1] = &unk_1EEF35818;
    v77[1] = @"Line";
    v77[2] = @"Method";
    int v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
    v78[2] = v18;
    v77[3] = *MEMORY[0x1E4F28228];
    v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 1379);
    v78[3] = v19;
    id v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = v78;
    v22 = v77;
    goto LABEL_40;
  }
  if (*(void *)(v2 + 24) != 2)
  {
    int64_t v35 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v36 = NFLogGetLogger();
    if (v36)
    {
      int v37 = (void (*)(uint64_t, const char *, ...))v36;
      int v38 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v38)) {
        uint64_t v39 = 43;
      }
      else {
        uint64_t v39 = 45;
      }
      int64_t v40 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v41 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v42 = *(void *)(a1 + 32);
      if (v42) {
        uint64_t v42 = *(void *)(v42 + 24);
      }
      v37(3, "%c[%{public}s %{public}s]:%i Invalid state: %ld", v39, v40, v41, 1381, v42);
    }
    dispatch_get_specific(*v35);
    v43 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v44)) {
        int v45 = 43;
      }
      else {
        int v45 = 45;
      }
      v46 = object_getClassName(*(id *)(a1 + 32));
      BOOL v47 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v48 = *(void *)(a1 + 32);
      if (v48) {
        uint64_t v48 = *(void *)(v48 + 24);
      }
      *(_DWORD *)buf = 67110146;
      int v68 = v45;
      __int16 v69 = 2082;
      v70 = v46;
      __int16 v71 = 2082;
      v72 = v47;
      __int16 v73 = 1024;
      int v74 = 1381;
      __int16 v75 = 2048;
      uint64_t v76 = v48;
      _os_log_impl(&dword_19D636000, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid state: %ld", buf, 0x2Cu);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    int v16 = [NSString stringWithUTF8String:"nfcd"];
    v65[0] = *MEMORY[0x1E4F28568];
    v17 = [NSString stringWithUTF8String:"Invalid State"];
    v66[0] = v17;
    v66[1] = &unk_1EEF35830;
    v65[1] = @"Line";
    v65[2] = @"Method";
    int v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
    v66[2] = v18;
    v65[3] = *MEMORY[0x1E4F28228];
    v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 1382);
    v66[3] = v19;
    id v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = v66;
    v22 = v65;
    goto LABEL_40;
  }
  if (*(void *)(v2 + 64))
  {
    id v3 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v4 = NFLogGetLogger();
    if (v4)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))v4;
      id v6 = object_getClass(*(id *)(a1 + 32));
      BOOL v7 = class_isMetaClass(v6);
      id v8 = object_getClassName(*(id *)(a1 + 32));
      int v59 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (v7) {
        uint64_t v9 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i Previous delay send in progress", v9, v8, v59, 1384);
    }
    dispatch_get_specific(*v3);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      id v13 = object_getClassName(*(id *)(a1 + 32));
      SEL v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v68 = v12;
      __int16 v69 = 2082;
      v70 = v13;
      __int16 v71 = 2082;
      v72 = v14;
      __int16 v73 = 1024;
      int v74 = 1384;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Previous delay send in progress", buf, 0x22u);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    int v16 = [NSString stringWithUTF8String:"nfcd"];
    v63[0] = *MEMORY[0x1E4F28568];
    v17 = [NSString stringWithUTF8String:"Invalid State"];
    v64[0] = v17;
    v64[1] = &unk_1EEF35848;
    v63[1] = @"Line";
    v63[2] = @"Method";
    int v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
    v64[2] = v18;
    v63[3] = *MEMORY[0x1E4F28228];
    v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 1385);
    v64[3] = v19;
    id v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = v64;
    v22 = v63;
LABEL_40:
    uint64_t v49 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:4];
    v50 = (void *)[v15 initWithDomain:v16 code:12 userInfo:v49];

    goto LABEL_41;
  }
  int v16 = [*(id *)(a1 + 40) encode];
  BOOL v52 = *(void **)(a1 + 32);
  if (v16)
  {
    if (v52) {
      BOOL v52 = (void *)v52[7];
    }
    v50 = [v52 sendAPDU:v16 startReadOnCompletion:1];
  }
  else
  {
    [v52 _sendFailureAPDU];
    id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v54 = [NSString stringWithUTF8String:"nfcd"];
    v61[0] = *MEMORY[0x1E4F28568];
    v55 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v62[0] = v55;
    v62[1] = &unk_1EEF35860;
    v61[1] = @"Line";
    v61[2] = @"Method";
    v56 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
    v62[2] = v56;
    v61[3] = *MEMORY[0x1E4F28228];
    id v57 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 1392);
    v62[3] = v57;
    id v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:4];
    v50 = (void *)[v53 initWithDomain:v54 code:10 userInfo:v58];

    int v16 = 0;
  }
LABEL_41:

  return v50;
}

- (void)_emuAssertTimerExpired
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i Assertion expired", v10, ClassName, Name, 1404);
  }
  dispatch_get_specific(*v4);
  BOOL v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&uint8_t buf[4] = v13;
    *(_WORD *)BOOL v47 = 2082;
    *(void *)&v47[2] = object_getClassName(self);
    *(_WORD *)&v47[10] = 2082;
    *(void *)&v47[12] = sel_getName(a2);
    *(_WORD *)&v47[20] = 1024;
    *(_DWORD *)&v47[22] = 1404;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Assertion expired", buf, 0x22u);
  }

  *(void *)buf = 0;
  *(void *)BOOL v47 = buf;
  *(void *)&v47[8] = 0x3032000000;
  *(void *)&v47[16] = __Block_byref_object_copy__5;
  *(void *)&v47[24] = __Block_byref_object_dispose__5;
  id v48 = 0;
  uint64_t v32 = 0;
  __int16 v33 = &v32;
  uint64_t v34 = 0x3032000000;
  int64_t v35 = __Block_byref_object_copy__446;
  uint64_t v36 = __Block_byref_object_dispose__447;
  id v37 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __54__NFConnectionHandoverReceiver__emuAssertTimerExpired__block_invoke;
  v31[3] = &unk_1E595D748;
  v31[4] = self;
  v31[5] = buf;
  v31[6] = &v32;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v31);
  if (self) {
    callbackQueue = self->super._callbackQueue;
  }
  else {
    callbackQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__NFConnectionHandoverReceiver__emuAssertTimerExpired__block_invoke_2;
  block[3] = &unk_1E595D658;
  block[4] = buf;
  void block[5] = a2;
  dispatch_async(callbackQueue, block);
  id v15 = v33[5];
  if (v15)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __54__NFConnectionHandoverReceiver__emuAssertTimerExpired__block_invoke_451;
    v29[3] = &unk_1E595CC98;
    v29[4] = self;
    dispatch_async(v15, v29);
  }
  else
  {
    dispatch_get_specific(*v4);
    uint64_t v16 = NFLogGetLogger();
    if (v16)
    {
      v17 = (void (*)(uint64_t, const char *, ...))v16;
      int v18 = object_getClass(self);
      BOOL v19 = class_isMetaClass(v18);
      id v20 = object_getClassName(self);
      v28 = sel_getName(a2);
      uint64_t v21 = 45;
      if (v19) {
        uint64_t v21 = 43;
      }
      v17(5, "%c[%{public}s %{public}s]:%i Dropping disconnect callback", v21, v20, v28, 1423);
    }
    dispatch_get_specific(*v4);
    v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = object_getClass(self);
      if (class_isMetaClass(v23)) {
        int v24 = 43;
      }
      else {
        int v24 = 45;
      }
      v25 = object_getClassName(self);
      int v26 = sel_getName(a2);
      *(_DWORD *)int v38 = 67109890;
      int v39 = v24;
      __int16 v40 = 2082;
      uint64_t v41 = v25;
      __int16 v42 = 2082;
      v43 = v26;
      __int16 v44 = 1024;
      int v45 = 1423;
      _os_log_impl(&dword_19D636000, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Dropping disconnect callback", v38, 0x22u);
    }
  }
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(buf, 8);
}

void __54__NFConnectionHandoverReceiver__emuAssertTimerExpired__block_invoke(uint64_t *a1)
{
  -[NFConnectionHandoverReceiver setPendingCHSelect:](a1[4], 0);
  uint64_t v2 = a1[4];
  if (v2) {
    id v3 = *(void **)(v2 + 80);
  }
  else {
    id v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v3);
  id v5 = (void *)a1[4];
  if (v5)
  {
    objc_setProperty_nonatomic_copy(v5, v4, 0, 80);
    id v6 = (void *)a1[4];
    if (v6) {
      id v6 = (void *)v6[7];
    }
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v10 = v6;
  uint64_t v7 = [v10 callbackQueue];
  uint64_t v8 = *(void *)(a1[6] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)setPendingCHSelect:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

void __54__NFConnectionHandoverReceiver__emuAssertTimerExpired__block_invoke_2(uint64_t a1)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v4 = [NSString stringWithUTF8String:"nfcd"];
    v10[0] = *MEMORY[0x1E4F28568];
    id v5 = [NSString stringWithUTF8String:"Timeout"];
    v11[0] = v5;
    v11[1] = &unk_1EEF35878;
    v10[1] = @"Line";
    v10[2] = @"Method";
    id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
    v11[2] = v6;
    v10[3] = *MEMORY[0x1E4F28228];
    uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 1418);
    v11[3] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
    uint64_t v9 = (void *)[v3 initWithDomain:v4 code:5 userInfo:v8];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v9);
  }
}

void __54__NFConnectionHandoverReceiver__emuAssertTimerExpired__block_invoke_451(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    -[NFConnectionHandoverReceiver _processDisconnectWithPossibleDiscoveryRestart:](v1, 0);
  }
}

- (void)sendHandoverSelect:(id)a3 delay:(double)a4 completionHandler:(id)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke;
  v59[3] = &unk_1E595D6A8;
  v59[4] = self;
  v59[5] = a2;
  *(double *)&v59[6] = a4;
  uint64_t v11 = -[NFConnectionHandoverController executeWithLockAndReturn:]((os_unfair_lock_s *)self, v59);
  if (v11)
  {
    int v12 = (void *)v11;
    [(NFConnectionHandoverReceiver *)self _sendFailureAPDU];
    if (self) {
      self = (NFConnectionHandoverReceiver *)self->super._callbackQueue;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_2;
    block[3] = &unk_1E595D540;
    id v57 = v12;
    id v58 = v10;
    id v13 = v12;
    dispatch_async(&self->super.super, block);

    id v14 = v58;
  }
  else if (a4 == 0.0)
  {
    uint64_t v15 = [v9 encode];
    if (v15)
    {
      id v13 = (id)v15;
      if (self) {
        hceSession = self->_hceSession;
      }
      else {
        hceSession = 0;
      }
      v17 = hceSession;
      int v18 = [(NFHCESession *)v17 sendAPDU:v13 startReadOnCompletion:1];

      if (self) {
        self = (NFConnectionHandoverReceiver *)self->super._callbackQueue;
      }
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_461;
      v50[3] = &unk_1E595D540;
      id v51 = v18;
      id v52 = v10;
      id v14 = v18;
      dispatch_async(&self->super.super, v50);
    }
    else
    {
      [(NFConnectionHandoverReceiver *)self _sendFailureAPDU];
      if (self) {
        self = (NFConnectionHandoverReceiver *)self->super._callbackQueue;
      }
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_3;
      v53[3] = &unk_1E595D4C8;
      id v54 = v10;
      SEL v55 = a2;
      dispatch_async(&self->super.super, v53);
      id v13 = 0;
      id v14 = v54;
    }
  }
  else
  {
    BOOL v19 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v21 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v25 = 45;
      if (isMetaClass) {
        uint64_t v25 = 43;
      }
      v21(6, "%c[%{public}s %{public}s]:%i delay=%{public}fs, adjustedDelay=%{public}fs", v25, ClassName, Name, 1490, *(void *)&a4, a4 + 0.3);
    }
    dispatch_get_specific(*v19);
    int v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = object_getClass(self);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      uint64_t v29 = object_getClassName(self);
      v30 = sel_getName(a2);
      *(_DWORD *)buf = 67110402;
      int v61 = v28;
      __int16 v62 = 2082;
      int v63 = v29;
      __int16 v64 = 2082;
      int v65 = v30;
      __int16 v66 = 1024;
      int v67 = 1490;
      __int16 v68 = 2050;
      double v69 = a4;
      __int16 v70 = 2050;
      double v71 = a4 + 0.3;
      _os_log_impl(&dword_19D636000, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i delay=%{public}fs, adjustedDelay=%{public}fs", buf, 0x36u);
    }

    if (self) {
      uint64_t v31 = self->_hceSession;
    }
    else {
      uint64_t v31 = 0;
    }
    uint64_t v32 = v31;
    __int16 v33 = [(NFHCESession *)v32 requestEmulationAssertion:a4 + 0.3];

    if (v33)
    {
      [(NFConnectionHandoverReceiver *)self _sendFailureAPDU];
      if (self) {
        self = (NFConnectionHandoverReceiver *)self->super._callbackQueue;
      }
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_463;
      v47[3] = &unk_1E595D540;
      id v49 = v10;
      id v13 = v33;
      id v48 = v13;
      dispatch_async(&self->super.super, v47);

      id v14 = v49;
    }
    else
    {
      id v14 = +[NFConnectionHandoverSelect selectWithRetry:a4];
      uint64_t v34 = [v14 encode];
      if (self) {
        int64_t v35 = self->_hceSession;
      }
      else {
        int64_t v35 = 0;
      }
      uint64_t v36 = v35;
      id v13 = [(NFHCESession *)v36 sendAPDU:v34 startReadOnCompletion:1];

      if (v13)
      {
        if (self) {
          self = (NFConnectionHandoverReceiver *)self->super._callbackQueue;
        }
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_2_464;
        v44[3] = &unk_1E595D540;
        id v46 = v10;
        id v45 = v13;
        dispatch_async(&self->super.super, v44);

        id v37 = v46;
      }
      else
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_3_465;
        v39[3] = &unk_1E595D6D0;
        void v39[4] = self;
        id v40 = v9;
        id v41 = v14;
        id v42 = v10;
        double v43 = a4 + 0.3;
        -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v39);

        id v37 = v40;
      }
    }
  }
}

id __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke(uint64_t a1)
{
  v72[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || !*(unsigned char *)(v2 + 40))
  {
    uint64_t v23 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v25 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v29 = 45;
      if (isMetaClass) {
        uint64_t v29 = 43;
      }
      v25(3, "%c[%{public}s %{public}s]:%i App not selected", v29, ClassName, Name, 1439);
    }
    dispatch_get_specific(*v23);
    v30 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v31)) {
        int v32 = 43;
      }
      else {
        int v32 = 45;
      }
      __int16 v33 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v34 = sel_getName(*(SEL *)(a1 + 40));
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v32;
      __int16 v63 = 2082;
      __int16 v64 = v33;
      __int16 v65 = 2082;
      __int16 v66 = v34;
      __int16 v67 = 1024;
      int v68 = 1439;
      _os_log_impl(&dword_19D636000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i App not selected", (uint8_t *)&buf, 0x22u);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = [NSString stringWithUTF8String:"nfcd"];
    v71[0] = *MEMORY[0x1E4F28568];
    v17 = [NSString stringWithUTF8String:"Invalid State"];
    v72[0] = v17;
    v72[1] = &unk_1EEF35890;
    v71[1] = @"Line";
    v71[2] = @"Method";
    int v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
    v72[2] = v18;
    v71[3] = *MEMORY[0x1E4F28228];
    BOOL v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 1440);
    v72[3] = v19;
    id v20 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v21 = v72;
    v22 = v71;
    goto LABEL_40;
  }
  if (*(void *)(v2 + 24) != 2)
  {
    int64_t v35 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v36 = NFLogGetLogger();
    if (v36)
    {
      id v37 = (void (*)(uint64_t, const char *, ...))v36;
      int v38 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v38)) {
        uint64_t v39 = 43;
      }
      else {
        uint64_t v39 = 45;
      }
      id v40 = object_getClassName(*(id *)(a1 + 32));
      id v41 = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v42 = *(void *)(a1 + 32);
      if (v42) {
        uint64_t v42 = *(void *)(v42 + 24);
      }
      v37(3, "%c[%{public}s %{public}s]:%i Invalid state: %ld", v39, v40, v41, 1442, v42);
    }
    dispatch_get_specific(*v35);
    double v43 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      __int16 v44 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v44)) {
        int v45 = 43;
      }
      else {
        int v45 = 45;
      }
      id v46 = object_getClassName(*(id *)(a1 + 32));
      BOOL v47 = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v48 = *(void *)(a1 + 32);
      if (v48) {
        uint64_t v48 = *(void *)(v48 + 24);
      }
      LODWORD(buf) = 67110146;
      HIDWORD(buf) = v45;
      __int16 v63 = 2082;
      __int16 v64 = v46;
      __int16 v65 = 2082;
      __int16 v66 = v47;
      __int16 v67 = 1024;
      int v68 = 1442;
      __int16 v69 = 2048;
      uint64_t v70 = v48;
      _os_log_impl(&dword_19D636000, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid state: %ld", (uint8_t *)&buf, 0x2Cu);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = [NSString stringWithUTF8String:"nfcd"];
    v60[0] = *MEMORY[0x1E4F28568];
    v17 = [NSString stringWithUTF8String:"Invalid State"];
    v61[0] = v17;
    v61[1] = &unk_1EEF358A8;
    v60[1] = @"Line";
    v60[2] = @"Method";
    int v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
    v61[2] = v18;
    v60[3] = *MEMORY[0x1E4F28228];
    BOOL v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 1443);
    v61[3] = v19;
    id v20 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v21 = v61;
    v22 = v60;
    goto LABEL_40;
  }
  if (*(void *)(v2 + 64))
  {
    id v3 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v4 = NFLogGetLogger();
    if (v4)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))v4;
      id v6 = object_getClass(*(id *)(a1 + 32));
      BOOL v7 = class_isMetaClass(v6);
      uint64_t v8 = object_getClassName(*(id *)(a1 + 32));
      id v54 = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v9 = 45;
      if (v7) {
        uint64_t v9 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i Previous delay send in progress", v9, v8, v54, 1445);
    }
    dispatch_get_specific(*v3);
    id v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      id v13 = object_getClassName(*(id *)(a1 + 32));
      id v14 = sel_getName(*(SEL *)(a1 + 40));
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v12;
      __int16 v63 = 2082;
      __int16 v64 = v13;
      __int16 v65 = 2082;
      __int16 v66 = v14;
      __int16 v67 = 1024;
      int v68 = 1445;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Previous delay send in progress", (uint8_t *)&buf, 0x22u);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = [NSString stringWithUTF8String:"nfcd"];
    v58[0] = *MEMORY[0x1E4F28568];
    v17 = [NSString stringWithUTF8String:"Invalid State"];
    v59[0] = v17;
    v59[1] = &unk_1EEF358C0;
    v58[1] = @"Line";
    v58[2] = @"Method";
    int v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
    v59[2] = v18;
    v58[3] = *MEMORY[0x1E4F28228];
    BOOL v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 1446);
    v59[3] = v19;
    id v20 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v21 = v59;
    v22 = v58;
LABEL_40:
    id v49 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:4];
    v50 = (void *)[v15 initWithDomain:v16 code:12 userInfo:v49];

LABEL_41:
    goto LABEL_42;
  }
  if (*(double *)(a1 + 48) > 0.0 && !*(void *)(v2 + 72))
  {
    uint64_t v16 = dispatch_get_global_queue(25, 0);
    objc_initWeak(&buf, (id)v2);
    id v52 = objc_alloc(MEMORY[0x1E4FBA890]);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_458;
    v56[3] = &unk_1E595D680;
    objc_copyWeak(&v57, &buf);
    id v53 = (void *)[v52 initWithCallback:v56 queue:v16];
    -[NFConnectionHandoverReceiver setEmuAssertTimer:](*(void *)(a1 + 32), v53);

    objc_destroyWeak(&v57);
    objc_destroyWeak(&buf);
    v50 = 0;
    goto LABEL_41;
  }
  v50 = 0;
LABEL_42:
  return v50;
}

void __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_458(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _emuAssertTimerExpired];
}

uint64_t __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_3(uint64_t a1)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v4 = [NSString stringWithUTF8String:"nfcd"];
  v10[0] = *MEMORY[0x1E4F28568];
  id v5 = [NSString stringWithUTF8String:"Invalid Parameter"];
  v11[0] = v5;
  v11[1] = &unk_1EEF358D8;
  v10[1] = @"Line";
  v10[2] = @"Method";
  id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x1E4F28228];
  BOOL v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 1476);
  v11[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  uint64_t v9 = (void *)[v3 initWithDomain:v4 code:10 userInfo:v8];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v9);
}

uint64_t __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_461(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_463(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_2_464(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_3_465(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 40) copy];
  -[NFConnectionHandoverReceiver setPendingCHSelect:](*(void *)(a1 + 32), v2);

  id v3 = [*(id *)(a1 + 48) retryRandom];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 64);
  }
  else {
    id v5 = 0;
  }
  [v5 setRetryRandom:v3];

  BOOL v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_setProperty_nonatomic_copy(v7, v6, *(id *)(a1 + 56), 80);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      BOOL v7 = *(void **)(v8 + 72);
    }
    else {
      BOOL v7 = 0;
    }
  }
  double v9 = *(double *)(a1 + 64);
  return [v7 startTimer:v9];
}

- (void)_sendFailureAPDU
{
  id v5 = (id)objc_opt_new();
  [v5 appendBytes:&SW_STATUS_FAILURE length:2];
  if (self) {
    hceSession = self->_hceSession;
  }
  else {
    hceSession = 0;
  }
  id v4 = [(NFHCESession *)hceSession sendAPDU:v5 startReadOnCompletion:1];
}

void __56__NFConnectionHandoverReceiver__triggerSessionStartedCB__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 controllerDidStart:*(void *)(a1 + 32)];
  }
}

void __61__NFConnectionHandoverReceiver__triggerSessionInvalidatedCB___block_invoke(uint64_t a1)
{
  v19[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) delegate];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 32);
    if (v4)
    {
      [v5 controller:*(void *)(a1 + 32) didInvalidated:*(void *)(a1 + 40)];
    }
    else
    {
      id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
      double v9 = [NSString stringWithUTF8String:"nfcd"];
      v18[0] = *MEMORY[0x1E4F28568];
      id v10 = [NSString stringWithUTF8String:"Success"];
      v19[0] = v10;
      v19[1] = &unk_1EEF358F0;
      v18[1] = @"Line";
      v18[2] = @"Method";
      uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
      v19[2] = v11;
      v18[3] = *MEMORY[0x1E4F28228];
      int v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 1559);
      v19[3] = v12;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
      id v14 = (void *)[v8 initWithDomain:v9 code:0 userInfo:v13];
      [v6 controller:v7 didInvalidated:v14];
    }
  }
  id v15 = [*(id *)(a1 + 32) delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    v17 = [*(id *)(a1 + 32) delegate];
    [v17 controller:*(void *)(a1 + 32) didInvalidate:*(void *)(a1 + 40)];
  }
}

- (BOOL)_processSelectCommand:(id)a3 response:(id)a4
{
  *(void *)&v70[5] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&CH_APP_NAME length:12];
  id v10 = [v7 payload];
  if ((unint64_t)[v10 length] <= 0xB)
  {
  }
  else
  {
    uint64_t v11 = [v7 payload];
    int v12 = objc_msgSend(v11, "subdataWithRange:", 0, 12);
    char v13 = [v12 isEqualToData:v9];

    if (v13)
    {
      id v14 = [v7 payload];
      unint64_t v15 = [v14 length];

      if (v15 < 0xE)
      {
        BOOL v18 = 0;
      }
      else
      {
        id v16 = [v7 payload];
        int v17 = *(unsigned __int8 *)([v16 bytes] + 13);

        BOOL v18 = v17 != 0;
      }
      id v40 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v42 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        if (class_isMetaClass(Class)) {
          uint64_t v44 = 43;
        }
        else {
          uint64_t v44 = 45;
        }
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        if (self) {
          uint64_t version = self->super._version;
        }
        else {
          uint64_t version = 0;
        }
        v42(6, "%c[%{public}s %{public}s]:%i Recv SELECT. CurrentVer=%{public}d, remoteVer=%{public}d", v44, ClassName, Name, 1599, version, v18);
      }
      dispatch_get_specific(*v40);
      uint64_t v48 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        id v49 = object_getClass(self);
        if (class_isMetaClass(v49)) {
          int v50 = 43;
        }
        else {
          int v50 = 45;
        }
        id v51 = object_getClassName(self);
        id v52 = sel_getName(a2);
        if (self) {
          int v53 = self->super._version;
        }
        else {
          int v53 = 0;
        }
        *(_DWORD *)id buf = 67110402;
        int v62 = v50;
        __int16 v63 = 2082;
        __int16 v64 = v51;
        __int16 v65 = 2082;
        __int16 v66 = v52;
        __int16 v67 = 1024;
        int v68 = 1599;
        __int16 v69 = 1026;
        v70[0] = v53;
        LOWORD(v70[1]) = 1026;
        *(_DWORD *)((char *)&v70[1] + 2) = v18;
        _os_log_impl(&dword_19D636000, v48, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Recv SELECT. CurrentVer=%{public}d, remoteVer=%{public}d", buf, 0x2Eu);
      }

      if (self) {
        uint64_t v54 = self->super._version;
      }
      else {
        uint64_t v54 = 0;
      }
      __int16 v33 = [MEMORY[0x1E4FBA880] TLVWithTag:206 unsignedChar:v54];
      SEL v55 = (void *)MEMORY[0x1E4FBA880];
      __int16 v60 = v33;
      BOOL v39 = 1;
      v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
      id v57 = [v55 TLVWithTag:165 children:v56];

      id v58 = [v57 asData];
      [v8 appendData:v58];

      [v8 appendBytes:&SW_STATUS_SUCCESS length:2];
      goto LABEL_34;
    }
  }
  [v8 appendBytes:&SW_STATUS_FAILURE length:2];
  BOOL v19 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t v20 = NFLogGetLogger();
  if (v20)
  {
    uint64_t v21 = (void (*)(uint64_t, const char *, ...))v20;
    v22 = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(v22);
    int v24 = object_getClassName(self);
    uint64_t v25 = sel_getName(a2);
    [v7 payload];
    int v26 = self;
    id v27 = v7;
    id v28 = v8;
    uint64_t v29 = a2;
    uint64_t v31 = v30 = v9;
    uint64_t v32 = 45;
    if (isMetaClass) {
      uint64_t v32 = 43;
    }
    v21(4, "%c[%{public}s %{public}s]:%i Recv unsupported SELECT : %@", v32, v24, v25, 1578, v31);

    double v9 = v30;
    a2 = v29;
    id v8 = v28;
    id v7 = v27;
    self = v26;
    BOOL v19 = (const void **)MEMORY[0x1E4FBA898];
  }
  dispatch_get_specific(*v19);
  __int16 v33 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    uint64_t v34 = object_getClass(self);
    if (class_isMetaClass(v34)) {
      int v35 = 43;
    }
    else {
      int v35 = 45;
    }
    uint64_t v36 = object_getClassName(self);
    id v37 = sel_getName(a2);
    int v38 = [v7 payload];
    *(_DWORD *)id buf = 67110146;
    int v62 = v35;
    __int16 v63 = 2082;
    __int16 v64 = v36;
    __int16 v65 = 2082;
    __int16 v66 = v37;
    __int16 v67 = 1024;
    int v68 = 1578;
    __int16 v69 = 2112;
    *(void *)uint64_t v70 = v38;
    _os_log_impl(&dword_19D636000, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Recv unsupported SELECT : %@", buf, 0x2Cu);
  }
  BOOL v39 = 0;
LABEL_34:

  return v39;
}

- (void)_processRetryRequest:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__446;
  id v84 = __Block_byref_object_dispose__447;
  id v85 = 0;
  uint64_t v74 = 0;
  __int16 v75 = &v74;
  uint64_t v76 = 0x3032000000;
  id v77 = __Block_byref_object_copy__5;
  v78 = __Block_byref_object_dispose__5;
  id v79 = 0;
  uint64_t v70 = 0;
  double v71 = &v70;
  uint64_t v72 = 0x2020000000;
  char v73 = 0;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __53__NFConnectionHandoverReceiver__processRetryRequest___block_invoke;
  v65[3] = &unk_1E595D6F8;
  void v65[4] = self;
  id v6 = v5;
  id v66 = v6;
  __int16 v67 = &v70;
  int v68 = &v74;
  __int16 v69 = &v80;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v65);
  if (!*((unsigned char *)v71 + 24))
  {
    if (!v75[5])
    {
      v56 = [MEMORY[0x1E4F28B00] currentHandler];
      [v56 handleFailureInMethod:a2 object:self file:@"NFConnectionHandoverController.m" lineNumber:1653 description:@"Missing handler"];
    }
    int v24 = (void *)v81[5];
    if (!v24)
    {
      id v57 = [MEMORY[0x1E4F28B00] currentHandler];
      [v57 handleFailureInMethod:a2 object:self file:@"NFConnectionHandoverController.m" lineNumber:1654 description:@"Missing pending select"];

      int v24 = (void *)v81[5];
    }
    BOOL v19 = [v24 encode];
    if ([v19 length])
    {
      if (v75[5]) {
        goto LABEL_12;
      }
      uint64_t v25 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        id v27 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v31 = 45;
        if (isMetaClass) {
          uint64_t v31 = 43;
        }
        v27(3, "%c[%{public}s %{public}s]:%i Unexpected state: handler=nil", v31, ClassName, Name, 1663);
      }
      dispatch_get_specific(*v25);
      uint64_t v32 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        __int16 v33 = object_getClass(self);
        if (class_isMetaClass(v33)) {
          int v34 = 43;
        }
        else {
          int v34 = 45;
        }
        int v35 = object_getClassName(self);
        uint64_t v36 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v89 = v34;
        __int16 v90 = 2082;
        v91 = v35;
        __int16 v92 = 2082;
        SEL v93 = v36;
        __int16 v94 = 1024;
        int v95 = 1663;
        _os_log_impl(&dword_19D636000, v32, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state: handler=nil", buf, 0x22u);
      }

      uint64_t v37 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&SW_STATUS_FAILURE length:2];
      uint64_t v20 = 0;
    }
    else
    {
      int v38 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v39 = NFLogGetLogger();
      if (v39)
      {
        id v40 = (void (*)(uint64_t, const char *, ...))v39;
        id v41 = object_getClass(self);
        BOOL v42 = class_isMetaClass(v41);
        double v43 = object_getClassName(self);
        __int16 v60 = sel_getName(a2);
        uint64_t v44 = 45;
        if (v42) {
          uint64_t v44 = 43;
        }
        v40(3, "%c[%{public}s %{public}s]:%i Unexpected state: apdu empty", v44, v43, v60, 1659);
      }
      dispatch_get_specific(*v38);
      int v45 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        id v46 = object_getClass(self);
        if (class_isMetaClass(v46)) {
          int v47 = 43;
        }
        else {
          int v47 = 45;
        }
        uint64_t v48 = object_getClassName(self);
        id v49 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v89 = v47;
        __int16 v90 = 2082;
        v91 = v48;
        __int16 v92 = 2082;
        SEL v93 = v49;
        __int16 v94 = 1024;
        int v95 = 1659;
        _os_log_impl(&dword_19D636000, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state: apdu empty", buf, 0x22u);
      }

      uint64_t v37 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&SW_STATUS_FAILURE length:2];
      id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v51 = [NSString stringWithUTF8String:"nfcd"];
      v86[0] = *MEMORY[0x1E4F28568];
      id v52 = [NSString stringWithUTF8String:"Invalid State"];
      v87[0] = v52;
      v87[1] = &unk_1EEF35908;
      v86[1] = @"Line";
      v86[2] = @"Method";
      int v53 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
      v87[2] = v53;
      v86[3] = *MEMORY[0x1E4F28228];
      uint64_t v54 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 1661);
      v87[3] = v54;
      SEL v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:4];
      uint64_t v20 = (void *)[v50 initWithDomain:v51 code:12 userInfo:v55];
    }
    BOOL v19 = (void *)v37;
    if (self) {
      goto LABEL_13;
    }
LABEL_47:
    hceSession = 0;
    goto LABEL_14;
  }
  id v7 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t v8 = NFLogGetLogger();
  if (v8)
  {
    double v9 = (void (*)(uint64_t, const char *, ...))v8;
    id v10 = object_getClass(self);
    BOOL v11 = class_isMetaClass(v10);
    int v12 = object_getClassName(self);
    id v58 = sel_getName(a2);
    uint64_t v13 = 45;
    if (v11) {
      uint64_t v13 = 43;
    }
    v9(4, "%c[%{public}s %{public}s]:%i Unexpected state: random mismatch, dropping request", v13, v12, v58, 1650);
  }
  dispatch_get_specific(*v7);
  id v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    unint64_t v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    int v17 = object_getClassName(self);
    BOOL v18 = sel_getName(a2);
    *(_DWORD *)id buf = 67109890;
    int v89 = v16;
    __int16 v90 = 2082;
    v91 = v17;
    __int16 v92 = 2082;
    SEL v93 = v18;
    __int16 v94 = 1024;
    int v95 = 1650;
    _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state: random mismatch, dropping request", buf, 0x22u);
  }

  BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&SW_STATUS_FAILURE length:2];
LABEL_12:
  uint64_t v20 = 0;
  if (!self) {
    goto LABEL_47;
  }
LABEL_13:
  hceSession = self->_hceSession;
LABEL_14:
  v22 = hceSession;
  uint64_t v23 = [(NFHCESession *)v22 sendAPDU:v19 startReadOnCompletion:1];

  if (v75[5] && !*((unsigned char *)v71 + 24))
  {
    if (self) {
      self = (NFConnectionHandoverReceiver *)self->super._callbackQueue;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__NFConnectionHandoverReceiver__processRetryRequest___block_invoke_485;
    block[3] = &unk_1E595D720;
    id v62 = v23;
    __int16 v64 = &v74;
    id v63 = v20;
    dispatch_async(&self->super.super, block);
  }
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);

  _Block_object_dispose(&v80, 8);
}

void __53__NFConnectionHandoverReceiver__processRetryRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[8];
  }
  char v3 = v2;
  uint64_t v4 = [v3 retryRandom];
  int v5 = [v4 unsignedShortValue];
  id v6 = [*(id *)(a1 + 40) retryRandom];

  LODWORD(v3) = [v6 unsignedShortValue];
  if (v5 == v3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v8 = *(void **)(v7 + 80);
    }
    else {
      uint64_t v8 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v8);
    id v10 = *(void **)(a1 + 32);
    if (v10 && (objc_setProperty_nonatomic_copy(v10, v9, 0, 80), (uint64_t v11 = *(void *)(a1 + 32)) != 0)) {
      int v12 = *(void **)(v11 + 64);
    }
    else {
      int v12 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v12);
    -[NFConnectionHandoverReceiver setPendingCHSelect:](*(void *)(a1 + 32), 0);
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      id v14 = *(void **)(v13 + 72);
    }
    else {
      id v14 = 0;
    }
    [v14 stopTimer];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

uint64_t __53__NFConnectionHandoverReceiver__processRetryRequest___block_invoke_485(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (!v2) {
    uint64_t v2 = a1[5];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);
}

- (void)_processConnect
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__NFConnectionHandoverReceiver__processConnect__block_invoke;
  v2[3] = &unk_1E595CC98;
  v2[4] = self;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v2);
}

void __47__NFConnectionHandoverReceiver__processConnect__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (*(unsigned char *)(v2 + 40) = 1, (uint64_t v2 = *(void *)(a1 + 32)) == 0))
  {
    uint64_t v3 = 0;
LABEL_5:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__NFConnectionHandoverReceiver__processConnect__block_invoke_2;
    block[3] = &unk_1E595CC98;
    void block[4] = v2;
    dispatch_async(v3, block);
    uint64_t v2 = *(void *)(a1 + 32);
    if (!v2) {
      return;
    }
    goto LABEL_6;
  }
  if (!*(unsigned char *)(v2 + 41))
  {
    uint64_t v3 = *(NSObject **)(v2 + 32);
    goto LABEL_5;
  }
LABEL_6:
  *(unsigned char *)(v2 + 41) = 1;
}

void __47__NFConnectionHandoverReceiver__processConnect__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didConnectedToInitiator:*(void *)(a1 + 32)];
}

- (void)_processDisconnectWithPossibleDiscoveryRestart:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __79__NFConnectionHandoverReceiver__processDisconnectWithPossibleDiscoveryRestart___block_invoke;
    v21[3] = &unk_1E595D748;
    v21[4] = a1;
    v21[5] = &v26;
    v21[6] = &v22;
    -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)a1, v21);
    uint64_t v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass((id)a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName((id)a1);
      Name = sel_getName(sel__processDisconnectWithPossibleDiscoveryRestart_);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v6(6, "%c[%{public}s %{public}s]:%i pending select=%d, didConnect=%d", v11, ClassName, Name, 1714, *((unsigned __int8 *)v27 + 24), *((unsigned __int8 *)v23 + 24));
    }
    dispatch_get_specific(*v4);
    int v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = object_getClass((id)a1);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      unint64_t v15 = object_getClassName((id)a1);
      int v16 = sel_getName(sel__processDisconnectWithPossibleDiscoveryRestart_);
      int v17 = *((unsigned __int8 *)v27 + 24);
      int v18 = *((unsigned __int8 *)v23 + 24);
      *(_DWORD *)id buf = 67110402;
      int v31 = v14;
      __int16 v32 = 2082;
      __int16 v33 = v15;
      __int16 v34 = 2082;
      int v35 = v16;
      __int16 v36 = 1024;
      int v37 = 1714;
      __int16 v38 = 1024;
      int v39 = v17;
      __int16 v40 = 1024;
      int v41 = v18;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i pending select=%d, didConnect=%d", buf, 0x2Eu);
    }

    if (*((unsigned char *)v27 + 24) || !*((unsigned char *)v23 + 24))
    {
      if (a2) {
        [*(id *)(a1 + 56) restartDiscovery];
      }
    }
    else
    {
      BOOL v19 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__NFConnectionHandoverReceiver__processDisconnectWithPossibleDiscoveryRestart___block_invoke_489;
      block[3] = &unk_1E595CC98;
      void block[4] = a1;
      dispatch_async(v19, block);
    }
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
  }
}

void *__79__NFConnectionHandoverReceiver__processDisconnectWithPossibleDiscoveryRestart___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (v1) {
    uint64_t v1 = *(void *)(v1 + 64);
  }
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = v1 != 0;
  uint64_t v2 = result[4];
  if (v2) {
    LOBYTE(v2) = *(unsigned char *)(v2 + 41) != 0;
  }
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = v2;
  if (!*(unsigned char *)(*(void *)(result[5] + 8) + 24))
  {
    uint64_t v3 = result[4];
    if (v3) {
      *(unsigned char *)(v3 + 41) = 0;
    }
  }
  return result;
}

void __79__NFConnectionHandoverReceiver__processDisconnectWithPossibleDiscoveryRestart___block_invoke_489(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didDisconnectedFromInitiator:*(void *)(a1 + 32)];
}

- (void)hceSessionDidEndUnexpectedly:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i Session terminated unexpectedly", v11, ClassName, Name, 1731);
  }
  dispatch_get_specific(*v5);
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)id buf = 67109890;
    int v18 = v14;
    __int16 v19 = 2082;
    uint64_t v20 = object_getClassName(self);
    __int16 v21 = 2082;
    uint64_t v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 1731;
    _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session terminated unexpectedly", buf, 0x22u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__NFConnectionHandoverReceiver_hceSessionDidEndUnexpectedly___block_invoke;
  v16[3] = &unk_1E595C698;
  v16[4] = self;
  v16[5] = a2;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v16);
}

void __61__NFConnectionHandoverReceiver_hceSessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v6 = [NSString stringWithUTF8String:"nfcd"];
  v12[0] = *MEMORY[0x1E4F28568];
  uint64_t v7 = [NSString stringWithUTF8String:"Session terminated"];
  v13[0] = v7;
  v13[1] = &unk_1EEF35920;
  v12[1] = @"Line";
  v12[2] = @"Method";
  uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v13[2] = v8;
  v12[3] = *MEMORY[0x1E4F28228];
  double v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 1734);
  v13[3] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  uint64_t v11 = (void *)[v5 initWithDomain:v6 code:44 userInfo:v10];
  -[NFConnectionHandoverReceiver _triggerSessionInvalidatedCB:](v4, v11);
}

- (void)hceSessionDidConnect:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__NFConnectionHandoverReceiver_hceSessionDidConnect___block_invoke;
  v19[3] = &unk_1E595D770;
  v19[4] = self;
  void v19[5] = &v20;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v19);
  id v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i Reader connected; pending select=%d",
      v12,
      ClassName,
      Name,
      1745,
      *((unsigned __int8 *)v21 + 24));
  }
  dispatch_get_specific(*v5);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    int v16 = object_getClassName(self);
    int v17 = sel_getName(a2);
    int v18 = *((unsigned __int8 *)v21 + 24);
    *(_DWORD *)id buf = 67110146;
    int v25 = v15;
    __int16 v26 = 2082;
    id v27 = v16;
    __int16 v28 = 2082;
    char v29 = v17;
    __int16 v30 = 1024;
    int v31 = 1745;
    __int16 v32 = 1024;
    int v33 = v18;
    _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Reader connected; pending select=%d",
      buf,
      0x28u);
  }

  _Block_object_dispose(&v20, 8);
}

uint64_t __53__NFConnectionHandoverReceiver_hceSessionDidConnect___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    uint64_t v1 = *(void *)(v1 + 64);
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1 != 0;
  return result;
}

- (void)hceSessionDidDisconnect:(id)a3
{
}

- (void)hceSession:(id)a3 didReceiveAPDU:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19D636000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", "", buf, 2u);
  }

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FBA850]) initWithData:v8];
  if (v10)
  {
    if ([v10 isSelectCommand])
    {
      uint64_t v11 = objc_opt_new();
      BOOL v12 = [(NFConnectionHandoverReceiver *)self _processSelectCommand:v10 response:v11];
      id v13 = (id)[v7 sendAPDU:v11 startReadOnCompletion:1];
      int v14 = NFSharedSignpostLog();
      if (os_signpost_enabled(v14))
      {
        int v15 = "N";
        if (v12) {
          int v15 = "Y";
        }
        *(_DWORD *)id buf = 136315138;
        *(void *)v87 = v15;
        _os_signpost_emit_with_name_impl(&dword_19D636000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", "SELECTED=%s", buf, 0xCu);
      }

      if (v12)
      {
        [(NFConnectionHandoverReceiver *)self _processConnect];
      }
      else if (self)
      {
        -[NFConnectionHandoverReceiver _processDisconnectWithPossibleDiscoveryRestart:]((uint64_t)self, 0);
      }

      goto LABEL_50;
    }
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x2020000000;
    char v85 = 0;
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __58__NFConnectionHandoverReceiver_hceSession_didReceiveAPDU___block_invoke;
    v81[3] = &unk_1E595D770;
    v81[4] = self;
    v81[5] = &v82;
    -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v81);
    if (*((unsigned char *)v83 + 24))
    {
      if ([v10 instruction] == 202
        && [v10 p1] == 1
        && ([v10 p2] == 3 || objc_msgSend(v10, "p2") == 4))
      {
        int v17 = [v10 p2];
        int v18 = [v10 payload];
        __int16 v19 = v18;
        if (v17 != 4)
        {
          uint64_t v48 = [v18 decodeCHRequest];

          if (v48)
          {
            if (self) {
              callbackQueue = self->super._callbackQueue;
            }
            else {
              callbackQueue = 0;
            }
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __58__NFConnectionHandoverReceiver_hceSession_didReceiveAPDU___block_invoke_499;
            block[3] = &unk_1E595D0C8;
            void block[4] = self;
            uint64_t v20 = v48;
            uint64_t v80 = v20;
            dispatch_async(callbackQueue, block);
          }
          else
          {
            id v62 = (const void **)MEMORY[0x1E4FBA898];
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              __int16 v64 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v68 = 45;
              if (isMetaClass) {
                uint64_t v68 = 43;
              }
              v64(4, "%c[%{public}s %{public}s]:%i Invalid request received!", v68, ClassName, Name, 1833);
            }
            dispatch_get_specific(*v62);
            __int16 v69 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              uint64_t v70 = object_getClass(self);
              if (class_isMetaClass(v70)) {
                int v71 = 43;
              }
              else {
                int v71 = 45;
              }
              uint64_t v72 = object_getClassName(self);
              char v73 = sel_getName(a2);
              *(_DWORD *)id buf = 67109890;
              *(_DWORD *)v87 = v71;
              *(_WORD *)&void v87[4] = 2082;
              *(void *)&v87[6] = v72;
              __int16 v88 = 2082;
              int v89 = v73;
              __int16 v90 = 1024;
              int v91 = 1833;
              _os_log_impl(&dword_19D636000, v69, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid request received!", buf, 0x22u);
            }

            [(NFConnectionHandoverReceiver *)self _sendFailureAPDU];
            uint64_t v74 = NFSharedSignpostLog();
            if (os_signpost_enabled(v74))
            {
              *(_WORD *)id buf = 0;
              _os_signpost_emit_with_name_impl(&dword_19D636000, v74, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", "RequestDecodeFailure", buf, 2u);
            }

            uint64_t v20 = 0;
          }
          goto LABEL_49;
        }
        uint64_t v20 = [v18 decodeCHRequestRetry];

        if (v20)
        {
          [(NFConnectionHandoverReceiver *)self _processRetryRequest:v20];
          __int16 v21 = NFSharedSignpostLog();
          if (!os_signpost_enabled(v21))
          {
LABEL_67:

            goto LABEL_49;
          }
          *(_WORD *)id buf = 0;
          uint64_t v22 = "RequestRetryReceived";
        }
        else
        {
          [(NFConnectionHandoverReceiver *)self _sendFailureAPDU];
          id v50 = (const void **)MEMORY[0x1E4FBA898];
          dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
          uint64_t v51 = NFLogGetLogger();
          if (v51)
          {
            id v52 = (void (*)(uint64_t, const char *, ...))v51;
            int v53 = object_getClass(self);
            BOOL v54 = class_isMetaClass(v53);
            SEL v55 = object_getClassName(self);
            id v77 = sel_getName(a2);
            uint64_t v56 = 45;
            if (v54) {
              uint64_t v56 = 43;
            }
            v52(4, "%c[%{public}s %{public}s]:%i Invalid retry request", v56, v55, v77, 1818);
          }
          dispatch_get_specific(*v50);
          id v57 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            id v58 = object_getClass(self);
            if (class_isMetaClass(v58)) {
              int v59 = 43;
            }
            else {
              int v59 = 45;
            }
            __int16 v60 = object_getClassName(self);
            int v61 = sel_getName(a2);
            *(_DWORD *)id buf = 67109890;
            *(_DWORD *)v87 = v59;
            *(_WORD *)&void v87[4] = 2082;
            *(void *)&v87[6] = v60;
            __int16 v88 = 2082;
            int v89 = v61;
            __int16 v90 = 1024;
            int v91 = 1818;
            _os_log_impl(&dword_19D636000, v57, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid retry request", buf, 0x22u);
          }

          __int16 v21 = NFSharedSignpostLog();
          if (!os_signpost_enabled(v21)) {
            goto LABEL_67;
          }
          *(_WORD *)id buf = 0;
          uint64_t v22 = "RequestDecodeFailure";
        }
        _os_signpost_emit_with_name_impl(&dword_19D636000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", v22, buf, 2u);
        goto LABEL_67;
      }
      [(NFConnectionHandoverReceiver *)self _sendFailureAPDU];
      char v23 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v24 = NFLogGetLogger();
      if (v24)
      {
        int v25 = (void (*)(uint64_t, const char *, ...))v24;
        __int16 v26 = object_getClass(self);
        BOOL v27 = class_isMetaClass(v26);
        __int16 v28 = object_getClassName(self);
        __int16 v75 = sel_getName(a2);
        uint64_t v29 = 45;
        if (v27) {
          uint64_t v29 = 43;
        }
        v25(4, "%c[%{public}s %{public}s]:%i Unsupported command received.", v29, v28, v75, 1808);
      }
      dispatch_get_specific(*v23);
      __int16 v30 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        int v31 = object_getClass(self);
        if (class_isMetaClass(v31)) {
          int v32 = 43;
        }
        else {
          int v32 = 45;
        }
        int v33 = object_getClassName(self);
        uint64_t v34 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        *(_DWORD *)v87 = v32;
        *(_WORD *)&void v87[4] = 2082;
        *(void *)&v87[6] = v33;
        __int16 v88 = 2082;
        int v89 = v34;
        __int16 v90 = 1024;
        int v91 = 1808;
        _os_log_impl(&dword_19D636000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unsupported command received.", buf, 0x22u);
      }

      uint64_t v20 = NFSharedSignpostLog();
      if (!os_signpost_enabled(v20)) {
        goto LABEL_49;
      }
      *(_WORD *)id buf = 0;
      int v35 = "UnsupportedCommand";
    }
    else
    {
      [(NFConnectionHandoverReceiver *)self _sendFailureAPDU];
      __int16 v36 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v37 = NFLogGetLogger();
      if (v37)
      {
        __int16 v38 = (void (*)(uint64_t, const char *, ...))v37;
        int v39 = object_getClass(self);
        BOOL v40 = class_isMetaClass(v39);
        int v41 = object_getClassName(self);
        uint64_t v76 = sel_getName(a2);
        uint64_t v42 = 45;
        if (v40) {
          uint64_t v42 = 43;
        }
        v38(4, "%c[%{public}s %{public}s]:%i Not in selected state", v42, v41, v76, 1794);
      }
      dispatch_get_specific(*v36);
      double v43 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = object_getClass(self);
        if (class_isMetaClass(v44)) {
          int v45 = 43;
        }
        else {
          int v45 = 45;
        }
        id v46 = object_getClassName(self);
        int v47 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        *(_DWORD *)v87 = v45;
        *(_WORD *)&void v87[4] = 2082;
        *(void *)&v87[6] = v46;
        __int16 v88 = 2082;
        int v89 = v47;
        __int16 v90 = 1024;
        int v91 = 1794;
        _os_log_impl(&dword_19D636000, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Not in selected state", buf, 0x22u);
      }

      uint64_t v20 = NFSharedSignpostLog();
      if (!os_signpost_enabled(v20)) {
        goto LABEL_49;
      }
      *(_WORD *)id buf = 0;
      int v35 = "AppNotSelected";
    }
    _os_signpost_emit_with_name_impl(&dword_19D636000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", v35, buf, 2u);
LABEL_49:

    _Block_object_dispose(&v82, 8);
    goto LABEL_50;
  }
  [(NFConnectionHandoverReceiver *)self _sendFailureAPDU];
  int v16 = NFSharedSignpostLog();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19D636000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", "APDUDecodeFailure", buf, 2u);
  }

LABEL_50:
}

uint64_t __58__NFConnectionHandoverReceiver_hceSession_didReceiveAPDU___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    LOBYTE(v1) = *(unsigned char *)(v1 + 40) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1;
  return result;
}

void __58__NFConnectionHandoverReceiver_hceSession_didReceiveAPDU___block_invoke_499(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) didReceiveRequest:*(void *)(a1 + 40)];

  uint64_t v3 = NFSharedSignpostLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_19D636000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", "RequestReceived", v4, 2u);
  }
}

- (void)hceSession:(id)a3 didReceiveField:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    double v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 1848, v6);
  }
  dispatch_get_specific(*v7);
  id v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)id buf = 67110146;
    int v46 = v15;
    __int16 v47 = 2082;
    uint64_t v48 = object_getClassName(self);
    __int16 v49 = 2082;
    id v50 = sel_getName(a2);
    __int16 v51 = 1024;
    int v52 = 1848;
    __int16 v53 = 2114;
    BOOL v54 = v6;
    _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  if ([v6 notificationType] == 3)
  {
    int v16 = v6;
    if ([v16 terminalType] == 5
      && ![v16 terminalSubType])
    {
      if (self) {
        callbackQueue = self->super._callbackQueue;
      }
      else {
        callbackQueue = 0;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__NFConnectionHandoverReceiver_hceSession_didReceiveField___block_invoke;
      block[3] = &unk_1E595D0C8;
      void block[4] = self;
      int v16 = v16;
      uint64_t v44 = v16;
      dispatch_async(callbackQueue, block);
    }
    else
    {
      dispatch_get_specific(*v7);
      uint64_t v17 = NFLogGetLogger();
      if (v17)
      {
        int v18 = (void (*)(uint64_t, const char *, ...))v17;
        __int16 v19 = object_getClass(self);
        BOOL v20 = class_isMetaClass(v19);
        __int16 v38 = object_getClassName(self);
        int v41 = sel_getName(a2);
        uint64_t v21 = 45;
        if (v20) {
          uint64_t v21 = 43;
        }
        v18(6, "%c[%{public}s %{public}s]:%i Ignore unrelated field: %@", v21, v38, v41, 1857, v16);
      }
      dispatch_get_specific(*v7);
      uint64_t v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        char v23 = object_getClass(self);
        if (class_isMetaClass(v23)) {
          int v24 = 43;
        }
        else {
          int v24 = 45;
        }
        int v25 = object_getClassName(self);
        __int16 v26 = sel_getName(a2);
        *(_DWORD *)id buf = 67110146;
        int v46 = v24;
        __int16 v47 = 2082;
        uint64_t v48 = v25;
        __int16 v49 = 2082;
        id v50 = v26;
        __int16 v51 = 1024;
        int v52 = 1857;
        __int16 v53 = 2112;
        BOOL v54 = v16;
        _os_log_impl(&dword_19D636000, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignore unrelated field: %@", buf, 0x2Cu);
      }
    }
  }
  else
  {
    dispatch_get_specific(*v7);
    uint64_t v27 = NFLogGetLogger();
    if (v27)
    {
      __int16 v28 = (void (*)(uint64_t, const char *, ...))v27;
      uint64_t v29 = object_getClass(self);
      BOOL v30 = class_isMetaClass(v29);
      int v39 = object_getClassName(self);
      uint64_t v42 = sel_getName(a2);
      uint64_t v31 = 45;
      if (v30) {
        uint64_t v31 = 43;
      }
      v28(6, "%c[%{public}s %{public}s]:%i Ignore unrelated field: %@", v31, v39, v42, 1850, v6);
    }
    dispatch_get_specific(*v7);
    int v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = object_getClass(self);
      if (class_isMetaClass(v32)) {
        int v33 = 43;
      }
      else {
        int v33 = 45;
      }
      uint64_t v34 = object_getClassName(self);
      int v35 = sel_getName(a2);
      *(_DWORD *)id buf = 67110146;
      int v46 = v33;
      __int16 v47 = 2082;
      uint64_t v48 = v34;
      __int16 v49 = 2082;
      id v50 = v35;
      __int16 v51 = 1024;
      int v52 = 1850;
      __int16 v53 = 2112;
      BOOL v54 = v6;
      _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignore unrelated field: %@", buf, 0x2Cu);
    }
  }
}

void __59__NFConnectionHandoverReceiver_hceSession_didReceiveField___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) didReceiveField:*(void *)(a1 + 40)];
}

- (void)hceSession:(id)a3 triggeredByField:(id)a4 started:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  double v9 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v11(6, "%c[%{public}s %{public}s]:%i started=%d", v14, ClassName, Name, 1868, v5);
  }
  dispatch_get_specific(*v9);
  int v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    *(_DWORD *)id buf = 67110146;
    int v27 = v17;
    __int16 v28 = 2082;
    uint64_t v29 = object_getClassName(self);
    __int16 v30 = 2082;
    uint64_t v31 = sel_getName(a2);
    __int16 v32 = 1024;
    int v33 = 1868;
    __int16 v34 = 1024;
    BOOL v35 = v5;
    _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i started=%d", buf, 0x28u);
  }

  if (!v5)
  {
    int v18 = [(NFConnectionHandoverReceiver *)self delegate];
    if (objc_opt_respondsToSelector())
    {
    }
    else
    {
      __int16 v19 = [(NFConnectionHandoverReceiver *)self delegate];
      char v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) == 0) {
        goto LABEL_17;
      }
    }
    if (self) {
      callbackQueue = self->super._callbackQueue;
    }
    else {
      callbackQueue = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__NFConnectionHandoverReceiver_hceSession_triggeredByField_started___block_invoke;
    block[3] = &unk_1E595D0C8;
    void block[4] = self;
    id v25 = v8;
    dispatch_async(callbackQueue, block);
  }
LABEL_17:
}

void __68__NFConnectionHandoverReceiver_hceSession_triggeredByField_started___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    [v4 controllerDidDetectPotentialInitiator:*(void *)(a1 + 32)];
  }
  BOOL v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    [v7 controllerDidDetectPotentialInitiator:*(void *)(a1 + 32) field:*(void *)(a1 + 40)];
  }
}

- (void)handleSessionResumed
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    char v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 1892);
  }
  dispatch_get_specific(*v4);
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
    *(_DWORD *)id buf = 67109890;
    int v20 = v13;
    __int16 v21 = 2082;
    uint64_t v22 = object_getClassName(self);
    __int16 v23 = 2082;
    int v24 = sel_getName(a2);
    __int16 v25 = 1024;
    int v26 = 1892;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  uint64_t v14 = [(NFConnectionHandoverReceiver *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    if (self) {
      callbackQueue = self->super._callbackQueue;
    }
    else {
      callbackQueue = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__NFConnectionHandoverReceiver_handleSessionResumed__block_invoke;
    block[3] = &unk_1E595CC98;
    void block[4] = self;
    dispatch_async(callbackQueue, block);
  }
}

void __52__NFConnectionHandoverReceiver_handleSessionResumed__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controllerDidDetectPotentialInitiator:*(void *)(a1 + 32)];
}

- (NFConnectionHandoverReceiverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NFConnectionHandoverReceiverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delaySendSelectCompletion, 0);
  objc_storeStrong((id *)&self->_emuAssertTimer, 0);
  objc_storeStrong((id *)&self->_pendingCHSelect, 0);
  objc_storeStrong((id *)&self->_hceSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end