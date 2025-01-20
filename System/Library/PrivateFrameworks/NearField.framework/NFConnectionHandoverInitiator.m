@interface NFConnectionHandoverInitiator
+ (id)initiatorWithDelegate:(id)a3;
+ (id)initiatorWithDelegate:(id)a3 callbackQueue:(id)a4;
- (BOOL)_processSelectResponse:(id)a3;
- (NFConnectionHandoverInitiator)initWithDelegate:(id)a3;
- (NFConnectionHandoverInitiator)initWithDelegate:(id)a3 callbackQueue:(id)a4;
- (NFConnectionHandoverInitiatorDelegate)delegate;
- (void)_delayRequestDidExpire;
- (void)_processSelectRetry:(id)a3 originalRequest:(id)a4 responseHandler:(id)a5;
- (void)_startWithCustomBroadcastData:(id)a3;
- (void)_stopWithError:(id)a3;
- (void)_tagConnectionDidExpire;
- (void)_triggerDelayRequestCompletionWithSelect:(id)a3 error:(id)a4;
- (void)_triggerInvalidateCB:(uint64_t)a1;
- (void)handleSessionSuspended:(id)a3 token:(id)a4 reason:(int64_t)a5 field:(id)a6;
- (void)readerSession:(id)a3 didDetectTags:(id)a4;
- (void)readerSession:(id)a3 externalReaderFieldNotification:(id)a4;
- (void)readerSessionDidEndUnexpectedly:(id)a3;
- (void)readerSessionDidEndUnexpectedly:(id)a3 reason:(id)a4;
- (void)send:(id)a3 responseHandler:(id)a4;
- (void)sendHandoverRequest:(id)a3 responseHandler:(id)a4;
- (void)setDelayRequest:(uint64_t)a1;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)startWithCustomBroadcastData:(id)a3;
- (void)stop;
@end

@implementation NFConnectionHandoverInitiator

+ (id)initiatorWithDelegate:(id)a3
{
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v5 = a3;
  dispatch_queue_t v6 = dispatch_queue_create("NFConnectionHandoverReceiverCallback", v4);

  v7 = [[NFConnectionHandoverInitiator alloc] initWithDelegate:v5 callbackQueue:v6];
  return v7;
}

+ (id)initiatorWithDelegate:(id)a3 callbackQueue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[NFConnectionHandoverInitiator alloc] initWithDelegate:v6 callbackQueue:v5];

  return v7;
}

- (NFConnectionHandoverInitiator)initWithDelegate:(id)a3
{
  id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v6 = a3;
  dispatch_queue_t v7 = dispatch_queue_create("NFConnectionHandoverReceiverCallback", v5);

  v8 = [(NFConnectionHandoverInitiator *)self initWithDelegate:v6 callbackQueue:v7];
  return v8;
}

- (NFConnectionHandoverInitiator)initWithDelegate:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NFHardwareManager sharedHardwareManager];
  int v9 = [v8 isBackgroundTagReadingAvailable];

  if (v9) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 2;
  }
  v11 = (NFConnectionHandoverInitiator *)-[NFConnectionHandoverController initWithType:initiator:callbackQueue:]((id *)&self->super.super.isa, (void *)v10, 1, v7);

  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v6);
    v12 = v11;
  }

  return v11;
}

- (void)start
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__NFConnectionHandoverInitiator_start__block_invoke;
  v2[3] = &unk_1E595CC98;
  v2[4] = self;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v2);
}

uint64_t __38__NFConnectionHandoverInitiator_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startWithCustomBroadcastData:0];
}

- (void)startWithCustomBroadcastData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__NFConnectionHandoverInitiator_startWithCustomBroadcastData___block_invoke;
  v6[3] = &unk_1E595D0C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v6);
}

uint64_t __62__NFConnectionHandoverInitiator_startWithCustomBroadcastData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startWithCustomBroadcastData:*(void *)(a1 + 40)];
}

- (void)_startWithCustomBroadcastData:(id)a3
{
  v96[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v5 length] == 6) {
        goto LABEL_4;
      }
      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      v14 = [NSString stringWithUTF8String:"nfcd"];
      v93[0] = *MEMORY[0x1E4F28568];
      v19 = [NSString stringWithUTF8String:"Invalid Parameter"];
      v94[0] = v19;
      v94[1] = &unk_1EEF355F0;
      v93[1] = @"Line";
      v93[2] = @"Method";
      v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
      v94[2] = v20;
      v93[3] = *MEMORY[0x1E4F28228];
      v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 587);
      v94[3] = v21;
      v93[4] = *MEMORY[0x1E4F28588];
      v22 = (void *)[[NSString alloc] initWithFormat:@"Invalid data length"];
      v94[4] = v22;
      v23 = (void *)MEMORY[0x1E4F1C9E8];
      v24 = v94;
      v25 = v93;
    }
    else
    {
      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      v14 = [NSString stringWithUTF8String:"nfcd"];
      v95[0] = *MEMORY[0x1E4F28568];
      v19 = [NSString stringWithUTF8String:"Invalid Parameter"];
      v96[0] = v19;
      v96[1] = &unk_1EEF355D8;
      v95[1] = @"Line";
      v95[2] = @"Method";
      v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
      v96[2] = v20;
      v95[3] = *MEMORY[0x1E4F28228];
      v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 584);
      v96[3] = v21;
      v95[4] = *MEMORY[0x1E4F28588];
      v22 = (void *)[[NSString alloc] initWithFormat:@"Invalid data type"];
      v96[4] = v22;
      v23 = (void *)MEMORY[0x1E4F1C9E8];
      v24 = v96;
      v25 = v95;
    }
    v26 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:5];
    v27 = v18;
    v28 = v14;
    uint64_t v29 = 10;
LABEL_20:
    v30 = (void *)[v27 initWithDomain:v28 code:v29 userInfo:v26];
    -[NFConnectionHandoverInitiator _triggerInvalidateCB:]((uint64_t)self, v30);

LABEL_21:
    goto LABEL_22;
  }
LABEL_4:
  if (!self) {
    goto LABEL_23;
  }
  int64_t state = self->super._state;
  switch(state)
  {
    case 3:
      v46 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19D636000, v46, OS_LOG_TYPE_FAULT, "Dropping start request due to invalidation is in progress", buf, 2u);
      }

      break;
    case 2:
      v47 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v49 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v53 = 45;
        if (isMetaClass) {
          uint64_t v53 = 43;
        }
        v49(6, "%c[%{public}s %{public}s]:%i Previously started", v53, ClassName, Name, 598);
      }
      dispatch_get_specific(*v47);
      v54 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = object_getClass(self);
        if (class_isMetaClass(v55)) {
          int v56 = 43;
        }
        else {
          int v56 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v82 = v56;
        __int16 v83 = 2082;
        v84 = object_getClassName(self);
        __int16 v85 = 2082;
        v86 = sel_getName(a2);
        __int16 v87 = 1024;
        int v88 = 598;
        _os_log_impl(&dword_19D636000, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Previously started", buf, 0x22u);
      }

      if (v5)
      {
        id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
        v14 = [NSString stringWithUTF8String:"nfcd"];
        v91[0] = *MEMORY[0x1E4F28568];
        v19 = [NSString stringWithUTF8String:"Invalid State"];
        v92[0] = v19;
        v92[1] = &unk_1EEF35608;
        v91[1] = @"Line";
        v91[2] = @"Method";
        v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
        v92[2] = v20;
        v91[3] = *MEMORY[0x1E4F28228];
        v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 600);
        v92[3] = v21;
        v91[4] = *MEMORY[0x1E4F28588];
        v22 = (void *)[[NSString alloc] initWithFormat:@"Can't update broadcast data unless session is stopped"];
        v92[4] = v22;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:5];
        v27 = v57;
        v28 = v14;
        uint64_t v29 = 12;
        goto LABEL_20;
      }
      break;
    case 1:
      id v7 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v8 = NFLogGetLogger();
      if (v8)
      {
        int v9 = (void (*)(uint64_t, const char *, ...))v8;
        uint64_t v10 = object_getClass(self);
        BOOL v11 = class_isMetaClass(v10);
        v12 = object_getClassName(self);
        v74 = sel_getName(a2);
        uint64_t v13 = 45;
        if (v11) {
          uint64_t v13 = 43;
        }
        v9(6, "%c[%{public}s %{public}s]:%i Start is in progress", v13, v12, v74, 593);
      }
      dispatch_get_specific(*v7);
      v14 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v82 = v16;
      __int16 v83 = 2082;
      v84 = object_getClassName(self);
      __int16 v85 = 2082;
      v86 = sel_getName(a2);
      __int16 v87 = 1024;
      int v88 = 593;
      v17 = "%c[%{public}s %{public}s]:%i Start is in progress";
      goto LABEL_67;
    default:
LABEL_23:
      v31 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v32 = NFLogGetLogger();
      v33 = (void (*)(uint64_t, const char *, ...))v32;
      if (v5)
      {
        if (v32)
        {
          v34 = object_getClass(self);
          BOOL v35 = class_isMetaClass(v34);
          v36 = object_getClassName(self);
          v37 = sel_getName(a2);
          v38 = [v5 debugDescription];
          uint64_t v39 = 45;
          if (v35) {
            uint64_t v39 = 43;
          }
          v33(6, "%c[%{public}s %{public}s]:%i customBroadcast=%{public}@", v39, v36, v37, 611, v38);
        }
        dispatch_get_specific(*v31);
        v40 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = object_getClass(self);
          if (class_isMetaClass(v41)) {
            int v42 = 43;
          }
          else {
            int v42 = 45;
          }
          v43 = object_getClassName(self);
          v44 = sel_getName(a2);
          v45 = [v5 debugDescription];
          *(_DWORD *)buf = 67110146;
          int v82 = v42;
          __int16 v83 = 2082;
          v84 = v43;
          __int16 v85 = 2082;
          v86 = v44;
          __int16 v87 = 1024;
          int v88 = 611;
          __int16 v89 = 2114;
          v90 = v45;
          _os_log_impl(&dword_19D636000, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i customBroadcast=%{public}@", buf, 0x2Cu);
        }
      }
      else
      {
        if (v32)
        {
          v58 = object_getClass(self);
          BOOL v59 = class_isMetaClass(v58);
          v60 = object_getClassName(self);
          v76 = sel_getName(a2);
          uint64_t v61 = 45;
          if (v59) {
            uint64_t v61 = 43;
          }
          v33(6, "%c[%{public}s %{public}s]:%i ", v61, v60, v76, 613);
        }
        dispatch_get_specific(*v31);
        v40 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v62 = object_getClass(self);
          if (class_isMetaClass(v62)) {
            int v63 = 43;
          }
          else {
            int v63 = 45;
          }
          *(_DWORD *)buf = 67109890;
          int v82 = v63;
          __int16 v83 = 2082;
          v84 = object_getClassName(self);
          __int16 v85 = 2082;
          v86 = sel_getName(a2);
          __int16 v87 = 1024;
          int v88 = 613;
          _os_log_impl(&dword_19D636000, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
        }
      }

      if (!self || !self->_readerSession)
      {
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __63__NFConnectionHandoverInitiator__startWithCustomBroadcastData___block_invoke;
        v78[3] = &unk_1E595D4A0;
        v78[4] = self;
        SEL v80 = a2;
        id v79 = v5;
        +[NFHardwareManager sharedHardwareManagerWithOptions:&unk_1EEF35DA0 readyCompletion:v78];

        break;
      }
      dispatch_get_specific(*v31);
      uint64_t v64 = NFLogGetLogger();
      if (v64)
      {
        v65 = (void (*)(uint64_t, const char *, ...))v64;
        v66 = object_getClass(self);
        BOOL v67 = class_isMetaClass(v66);
        v68 = object_getClassName(self);
        v77 = sel_getName(a2);
        uint64_t v69 = 45;
        if (v67) {
          uint64_t v69 = 43;
        }
        v65(6, "%c[%{public}s %{public}s]:%i Already started in initiator mode", v69, v68, v77, 617);
      }
      dispatch_get_specific(*v31);
      v14 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
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
      int v82 = v71;
      __int16 v83 = 2082;
      v84 = v72;
      __int16 v85 = 2082;
      v86 = v73;
      __int16 v87 = 1024;
      int v88 = 617;
      v17 = "%c[%{public}s %{public}s]:%i Already started in initiator mode";
LABEL_67:
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0x22u);
      goto LABEL_21;
  }
LABEL_22:
}

- (void)_triggerInvalidateCB:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && *(void *)(a1 + 24) != 4)
  {
    *(void *)(a1 + 24) = 4;
    id v5 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__NFConnectionHandoverInitiator__triggerInvalidateCB___block_invoke;
    block[3] = &unk_1E595CC48;
    block[4] = a1;
    id v7 = v3;
    uint64_t v8 = sel__triggerInvalidateCB_;
    dispatch_async(v5, block);
  }
}

void __63__NFConnectionHandoverInitiator__startWithCustomBroadcastData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(os_unfair_lock_s **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__NFConnectionHandoverInitiator__startWithCustomBroadcastData___block_invoke_2;
  v8[3] = &unk_1E595CDD8;
  id v9 = v3;
  uint64_t v10 = v4;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v11 = v7;
  id v6 = v3;
  -[NFConnectionHandoverController executeWithLock:](v4, v8);
}

void __63__NFConnectionHandoverInitiator__startWithCustomBroadcastData___block_invoke_2(uint64_t a1)
{
  v33[4] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) getHwSupport] - 4 > 0xFFFFFFFD)
  {
    uint64_t v8 = objc_opt_new();
    id v9 = _GenerateInitiatorECPFrame(0);
    [v8 addObject:v9];

    uint64_t v10 = *(void *)(a1 + 40);
    if (v10 && *(void *)(v10 + 16) == 2)
    {
      long long v11 = _GeneratePreferredReceiverECPFrame(0);
      [v8 addObject:v11];
    }
    id v12 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v30 = @"session.suspendOnECP";
    v31 = v8;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v14 = (void *)[v12 initWithDictionary:v13];

    uint64_t v15 = *(void *)(a1 + 40);
    if (v15 && *(void *)(v15 + 16) == 2)
    {
      int v16 = _GeneratePreferredReceiverECPFrame(*(void **)(a1 + 48));
    }
    else
    {
      int v16 = _GenerateInitiatorECPFrame(*(void **)(a1 + 48));
    }
    v17 = v16;
    uint64_t v18 = *(void *)(a1 + 40);
    if (v18) {
      objc_storeStrong((id *)(v18 + 96), v16);
    }

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __63__NFConnectionHandoverInitiator__startWithCustomBroadcastData___block_invoke_200;
    v29[3] = &unk_1E595D478;
    v19 = *(void **)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 56);
    v29[4] = *(void *)(a1 + 40);
    v29[5] = v20;
    v21 = [v19 startReaderSessionWithAttributes:v14 completion:v29];
    uint64_t v22 = *(void *)(a1 + 40);
    if (v22) {
      objc_storeStrong((id *)(v22 + 48), v21);
    }

    uint64_t v23 = *(void *)(a1 + 40);
    if (v23) {
      v24 = *(void **)(v23 + 48);
    }
    else {
      v24 = 0;
    }
    objc_msgSend(v24, "setDelegate:");
    uint64_t v25 = *(void *)(a1 + 40);
    if (v25) {
      v26 = *(void **)(v25 + 48);
    }
    else {
      v26 = 0;
    }
    objc_msgSend(v26, "setSessionDelegate:");
    uint64_t v27 = *(void *)(a1 + 40);
    if (v27)
    {
      objc_storeStrong((id *)(v27 + 56), 0);
      uint64_t v28 = *(void *)(a1 + 40);
      if (v28) {
        *(void *)(v28 + 24) = 1;
      }
    }
  }
  else
  {
    id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v3 = [NSString stringWithUTF8String:"nfcd"];
    v32[0] = *MEMORY[0x1E4F28568];
    id v4 = [NSString stringWithUTF8String:"No NFC on device"];
    v33[0] = v4;
    v33[1] = &unk_1EEF35620;
    v32[1] = @"Line";
    v32[2] = @"Method";
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
    v33[2] = v5;
    v32[3] = *MEMORY[0x1E4F28228];
    id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 628);
    v33[3] = v6;
    long long v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:4];
    uint64_t v8 = (void *)[v2 initWithDomain:v3 code:57 userInfo:v7];

    -[NFConnectionHandoverInitiator _triggerInvalidateCB:](*(void *)(a1 + 40), v8);
  }
}

void __63__NFConnectionHandoverInitiator__startWithCustomBroadcastData___block_invoke_200(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = *(os_unfair_lock_s **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__NFConnectionHandoverInitiator__startWithCustomBroadcastData___block_invoke_2_201;
  v11[3] = &unk_1E595CDD8;
  id v12 = v6;
  uint64_t v13 = v7;
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v5;
  uint64_t v15 = v8;
  id v9 = v5;
  id v10 = v6;
  -[NFConnectionHandoverController executeWithLock:](v7, v11);
}

void __63__NFConnectionHandoverInitiator__startWithCustomBroadcastData___block_invoke_2_201(uint64_t a1)
{
  v23[5] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void **)(a1 + 40);
    id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v4 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v5 = [*(id *)(a1 + 32) code];
    v22[0] = *MEMORY[0x1E4F28568];
    id v6 = NSString;
    if ([*(id *)(a1 + 32) code] > 70) {
      uint64_t v7 = 71;
    }
    else {
      uint64_t v7 = [*(id *)(a1 + 32) code];
    }
    id v9 = [v6 stringWithUTF8String:NFResultCodeString_0[v7]];
    uint64_t v15 = *MEMORY[0x1E4F28A50];
    uint64_t v16 = *(void *)(a1 + 32);
    v23[0] = v9;
    v23[1] = v16;
    v22[1] = v15;
    v22[2] = @"Line";
    v23[2] = &unk_1EEF35638;
    v22[3] = @"Method";
    v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
    v23[3] = v17;
    v22[4] = *MEMORY[0x1E4F28228];
    uint64_t v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 651);
    v23[4] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];
    uint64_t v20 = (void *)[v3 initWithDomain:v4 code:v5 userInfo:v19];
    [v2 _stopWithError:v20];
  }
  else
  {
    uint64_t v8 = +[NFReaderSessionPollConfig pollConfigWithTechnology:1];
    id v9 = v8;
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      uint64_t v11 = *(void *)(v10 + 96);
    }
    else {
      uint64_t v11 = 0;
    }
    [v8 setEcp:v11];
    [v9 setSkipMifareClassify:1];
    [v9 setPollDuration:75];
    id v12 = *(void **)(a1 + 48);
    id v21 = 0;
    char v13 = [v12 startPollingWithConfig:v9 error:&v21];
    id v4 = v21;
    id v14 = *(void **)(a1 + 40);
    if (v13)
    {
      if (v14) {
        v14[3] = 2;
      }
    }
    else
    {
      [v14 _stopWithError:v4];
    }
  }
}

- (void)_tagConnectionDidExpire
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!self->_connectedTag)
  {
    id v4 = (const void **)MEMORY[0x1E4FBA898];
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
      v6(6, "%c[%{public}s %{public}s]:%i Tag connection timer expired", v10, ClassName, Name, 686);
    }
    dispatch_get_specific(*v4);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v25 = v13;
      __int16 v26 = 2082;
      uint64_t v27 = object_getClassName(self);
      __int16 v28 = 2082;
      uint64_t v29 = sel_getName(a2);
      __int16 v30 = 1024;
      int v31 = 686;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag connection timer expired", buf, 0x22u);
    }

    [(NFReaderSession *)self->_readerSession stopPollingWithError:0];
    if (self->_delayRequestCompletion)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v15 = [NSString stringWithUTF8String:"nfcd"];
      v22[0] = *MEMORY[0x1E4F28568];
      uint64_t v16 = [NSString stringWithUTF8String:"Tag Not Found"];
      v23[0] = v16;
      v23[1] = &unk_1EEF35650;
      v22[1] = @"Line";
      v22[2] = @"Method";
      v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
      v23[2] = v17;
      v22[3] = *MEMORY[0x1E4F28228];
      uint64_t v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 690);
      v23[3] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
      uint64_t v20 = (void *)[v14 initWithDomain:v15 code:28 userInfo:v19];
      [(NFConnectionHandoverInitiator *)self _triggerDelayRequestCompletionWithSelect:0 error:v20];
    }
  }
}

- (void)_delayRequestDidExpire
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = (const void **)MEMORY[0x1E4FBA898];
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
    v6(6, "%c[%{public}s %{public}s]:%i Retry send request", v10, ClassName, Name, 696);
  }
  dispatch_get_specific(*v4);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v41 = v13;
    __int16 v42 = 2082;
    v43 = object_getClassName(self);
    __int16 v44 = 2082;
    v45 = sel_getName(a2);
    __int16 v46 = 1024;
    int v47 = 696;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Retry send request", buf, 0x22u);
  }

  if (self && self->_readerSession)
  {
    id v14 = +[NFReaderSessionPollConfig pollConfigWithTechnology:1];
    [v14 setEcp:self->_ecpFrame];
    [v14 setSkipMifareClassify:1];
    [v14 setPollDuration:75];
    readerSession = self->_readerSession;
    id v37 = 0;
    uint64_t v16 = readerSession;
    BOOL v17 = [(NFReaderSession *)v16 startPollingWithConfig:v14 error:&v37];
    id v18 = v37;

    if (v17)
    {
      [(NFTimer *)self->_tagConnectionTimer startTimer:1.0];
    }
    else
    {
      [(NFConnectionHandoverInitiator *)self _triggerDelayRequestCompletionWithSelect:0 error:v18];
      [(NFConnectionHandoverInitiator *)self _stopWithError:v18];
    }
  }
  else
  {
    dispatch_get_specific(*v4);
    uint64_t v19 = NFLogGetLogger();
    if (v19)
    {
      uint64_t v20 = (void (*)(uint64_t, const char *, ...))v19;
      id v21 = object_getClass(self);
      BOOL v22 = class_isMetaClass(v21);
      uint64_t v23 = object_getClassName(self);
      v36 = sel_getName(a2);
      uint64_t v24 = 45;
      if (v22) {
        uint64_t v24 = 43;
      }
      v20(3, "%c[%{public}s %{public}s]:%i Reader session terminated", v24, v23, v36, 699);
    }
    dispatch_get_specific(*v4);
    int v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = object_getClass(self);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      __int16 v28 = object_getClassName(self);
      uint64_t v29 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v41 = v27;
      __int16 v42 = 2082;
      v43 = v28;
      __int16 v44 = 2082;
      v45 = v29;
      __int16 v46 = 1024;
      int v47 = 699;
      _os_log_impl(&dword_19D636000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader session terminated", buf, 0x22u);
    }

    id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v18 = [NSString stringWithUTF8String:"nfcd"];
    v38[0] = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithUTF8String:"Invalid State"];
    v39[0] = v14;
    v39[1] = &unk_1EEF35668;
    v38[1] = @"Line";
    v38[2] = @"Method";
    int v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
    v39[2] = v31;
    v38[3] = *MEMORY[0x1E4F28228];
    uint64_t v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 700);
    v39[3] = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];
    v34 = (void *)[v30 initWithDomain:v18 code:12 userInfo:v33];
    [(NFConnectionHandoverInitiator *)self _triggerDelayRequestCompletionWithSelect:0 error:v34];
  }
}

- (void)_processSelectRetry:(id)a3 originalRequest:(id)a4 responseHandler:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 retryInMS];
  double v13 = (double)[v12 integerValue] / 1000.0;

  id v14 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  uint64_t v16 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v13 >= 0.0)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v27 = 45;
      if (isMetaClass) {
        uint64_t v27 = 43;
      }
      v16(6, "%c[%{public}s %{public}s]:%i Received delay request=%fs", v27, ClassName, Name, 733, *(void *)&v13);
    }
    dispatch_get_specific(*v14);
    __int16 v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v51 = v30;
      __int16 v52 = 2082;
      uint64_t v53 = object_getClassName(self);
      __int16 v54 = 2082;
      v55 = sel_getName(a2);
      __int16 v56 = 1024;
      int v57 = 733;
      __int16 v58 = 2048;
      double v59 = v13;
      _os_log_impl(&dword_19D636000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Received delay request=%fs", buf, 0x2Cu);
    }

    int v31 = (void *)[v10 copy];
    -[NFConnectionHandoverInitiator setDelayRequest:]((uint64_t)self, v31);

    uint64_t v32 = [v9 retryRandom];
    if (self)
    {
      [(NFConnectionHandoverRequest *)self->_delayRequest setRetryRandom:v32];

      objc_setProperty_nonatomic_copy(self, v33, v11, 72);
      readerSession = self->_readerSession;
    }
    else
    {
      [0 setRetryRandom:v32];

      readerSession = 0;
    }
    [(NFReaderSession *)readerSession stopPolling];
    connectedTag = self->_connectedTag;
    self->_connectedTag = 0;

    delayRequestTimer = self->_delayRequestTimer;
    if (!delayRequestTimer)
    {
      if (!self->_tagConnectionTimer)
      {
        id v37 = objc_alloc(MEMORY[0x1E4FBA890]);
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_219;
        v46[3] = &unk_1E595CC98;
        v46[4] = self;
        v38 = dispatch_get_global_queue(25, 0);
        uint64_t v39 = (void *)[v37 initWithCallback:v46 queue:v38];
        objc_storeStrong((id *)&self->_tagConnectionTimer, v39);
      }
      id v40 = objc_alloc(MEMORY[0x1E4FBA890]);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_3;
      v45[3] = &unk_1E595CC98;
      v45[4] = self;
      int v41 = dispatch_get_global_queue(25, 0);
      __int16 v42 = (void *)[v40 initWithCallback:v45 queue:v41];
      objc_storeStrong((id *)&self->_delayRequestTimer, v42);

      delayRequestTimer = self->_delayRequestTimer;
    }
    [(NFTimer *)delayRequestTimer startTimer:v13];
  }
  else
  {
    if (Logger)
    {
      BOOL v17 = object_getClass(self);
      BOOL v18 = class_isMetaClass(v17);
      uint64_t v19 = object_getClassName(self);
      v43 = sel_getName(a2);
      uint64_t v20 = 45;
      if (v18) {
        uint64_t v20 = 43;
      }
      v16(3, "%c[%{public}s %{public}s]:%i Invalid delay request=%fs", v20, v19, v43, 727, *(void *)&v13);
    }
    dispatch_get_specific(*v14);
    id v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = object_getClass(self);
      if (class_isMetaClass(v22)) {
        int v23 = 43;
      }
      else {
        int v23 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v51 = v23;
      __int16 v52 = 2082;
      uint64_t v53 = object_getClassName(self);
      __int16 v54 = 2082;
      v55 = sel_getName(a2);
      __int16 v56 = 1024;
      int v57 = 727;
      __int16 v58 = 2048;
      double v59 = v13;
      _os_log_impl(&dword_19D636000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid delay request=%fs", buf, 0x2Cu);
    }

    if (self) {
      self = (NFConnectionHandoverInitiator *)self->super._callbackQueue;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke;
    block[3] = &unk_1E595D4C8;
    id v48 = v11;
    SEL v49 = a2;
    dispatch_async(&self->super.super, block);
  }
}

void __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke(uint64_t a1)
{
  void v11[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v4 = [NSString stringWithUTF8String:"nfcd"];
  v10[0] = *MEMORY[0x1E4F28568];
  uint64_t v5 = [NSString stringWithUTF8String:"Invalid State"];
  v11[0] = v5;
  v11[1] = &unk_1EEF35680;
  v10[1] = @"Line";
  v10[2] = @"Method";
  id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x1E4F28228];
  uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 729);
  v11[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  id v9 = (void *)[v3 initWithDomain:v4 code:12 userInfo:v8];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v9);
}

- (void)setDelayRequest:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

void __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_219(uint64_t a1)
{
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_2;
  v2[3] = &unk_1E595CC98;
  v2[4] = v1;
  -[NFConnectionHandoverController executeWithLock:](v1, v2);
}

uint64_t __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tagConnectionDidExpire];
}

void __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_3(uint64_t a1)
{
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_4;
  v2[3] = &unk_1E595CC98;
  v2[4] = v1;
  -[NFConnectionHandoverController executeWithLock:](v1, v2);
}

uint64_t __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _delayRequestDidExpire];
}

- (void)sendHandoverRequest:(id)a3 responseHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 encode];
  if ([v9 length])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__NFConnectionHandoverInitiator_sendHandoverRequest_responseHandler___block_invoke_222;
    v13[3] = &unk_1E595D518;
    id v10 = (id *)v15;
    v15[0] = v8;
    v15[1] = a2;
    v13[4] = self;
    id v14 = v7;
    id v11 = v8;
    [(NFConnectionHandoverInitiator *)self send:v9 responseHandler:v13];
  }
  else
  {
    if (self) {
      self = (NFConnectionHandoverInitiator *)self->super._callbackQueue;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__NFConnectionHandoverInitiator_sendHandoverRequest_responseHandler___block_invoke;
    block[3] = &unk_1E595D4C8;
    id v10 = (id *)v17;
    v17[0] = v8;
    v17[1] = a2;
    id v12 = v8;
    dispatch_async(&self->super.super, block);
  }
}

void __69__NFConnectionHandoverInitiator_sendHandoverRequest_responseHandler___block_invoke(uint64_t a1)
{
  void v11[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v4 = [NSString stringWithUTF8String:"nfcd"];
  v10[0] = *MEMORY[0x1E4F28568];
  uint64_t v5 = [NSString stringWithUTF8String:"Unexpected Result"];
  v11[0] = v5;
  v11[1] = &unk_1EEF35698;
  v10[1] = @"Line";
  v10[2] = @"Method";
  id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x1E4F28228];
  id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 766);
  v11[3] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  id v9 = (void *)[v3 initWithDomain:v4 code:13 userInfo:v8];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v9);
}

void __69__NFConnectionHandoverInitiator_sendHandoverRequest_responseHandler___block_invoke_222(uint64_t a1, void *a2, uint64_t a3)
{
  v44[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    uint64_t v5 = [a2 decodeCHSelect];
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 retryInMS];
      if (v7
        && (id v8 = (void *)v7,
            [v6 retryRandom],
            id v9 = objc_claimAutoreleasedReturnValue(),
            v9,
            v8,
            v9))
      {
        id v10 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          id v12 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 56));
          uint64_t v16 = 45;
          if (isMetaClass) {
            uint64_t v16 = 43;
          }
          v12(6, "%c[%{public}s %{public}s]:%i Received retry response", v16, ClassName, Name, 785);
        }
        dispatch_get_specific(*v10);
        BOOL v17 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v18 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v18)) {
            int v19 = 43;
          }
          else {
            int v19 = 45;
          }
          uint64_t v20 = object_getClassName(*(id *)(a1 + 32));
          id v21 = sel_getName(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 67109890;
          int v36 = v19;
          __int16 v37 = 2082;
          v38 = v20;
          __int16 v39 = 2082;
          id v40 = v21;
          __int16 v41 = 1024;
          int v42 = 785;
          _os_log_impl(&dword_19D636000, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Received retry response", buf, 0x22u);
        }

        BOOL v22 = *(os_unfair_lock_s **)(a1 + 32);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __69__NFConnectionHandoverInitiator_sendHandoverRequest_responseHandler___block_invoke_226;
        v31[3] = &unk_1E595D4F0;
        v31[4] = v22;
        id v32 = v6;
        id v33 = *(id *)(a1 + 40);
        id v34 = *(id *)(a1 + 48);
        -[NFConnectionHandoverController executeWithLock:](v22, v31);
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    else
    {
      id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v24 = [NSString stringWithUTF8String:"nfcd"];
      v43[0] = *MEMORY[0x1E4F28568];
      int v25 = [NSString stringWithUTF8String:"Decoding Error"];
      v44[0] = v25;
      v44[1] = &unk_1EEF356B0;
      v43[1] = @"Line";
      v43[2] = @"Method";
      __int16 v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
      v44[2] = v26;
      v43[3] = *MEMORY[0x1E4F28228];
      uint64_t v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 779);
      v44[3] = v27;
      __int16 v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:4];
      uint64_t v29 = (void *)[v23 initWithDomain:v24 code:23 userInfo:v28];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

uint64_t __69__NFConnectionHandoverInitiator_sendHandoverRequest_responseHandler___block_invoke_226(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processSelectRetry:*(void *)(a1 + 40) originalRequest:*(void *)(a1 + 48) responseHandler:*(void *)(a1 + 56)];
}

- (void)send:(id)a3 responseHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke;
  v11[3] = &unk_1E595D568;
  id v13 = v8;
  SEL v14 = a2;
  void v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  id v10 = v8;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v11);
}

void __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_11;
  }
  id v3 = *(id *)(v2 + 48);
  if (!v3)
  {
LABEL_7:
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      id v11 = *(NSObject **)(v10 + 32);
LABEL_9:
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_2;
      v18[3] = &unk_1E595D4C8;
      id v12 = *(id *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      id v19 = v12;
      uint64_t v20 = v13;
      dispatch_async(v11, v18);
      id v9 = v19;
      goto LABEL_10;
    }
LABEL_11:
    id v11 = 0;
    goto LABEL_9;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {

    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(v4 + 56);

  if (!v5) {
    goto LABEL_7;
  }
  id v6 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_230;
  block[3] = &unk_1E595D568;
  id v7 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v16 = v7;
  long long v14 = *(_OWORD *)(a1 + 48);
  id v8 = (id)v14;
  long long v17 = v14;
  dispatch_async(v6, block);

  id v9 = v16;
LABEL_10:
}

void __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_2(uint64_t a1)
{
  void v11[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v4 = [NSString stringWithUTF8String:"nfcd"];
  v10[0] = *MEMORY[0x1E4F28568];
  uint64_t v5 = [NSString stringWithUTF8String:"Invalid State"];
  v11[0] = v5;
  v11[1] = &unk_1EEF356C8;
  v10[1] = @"Line";
  v10[2] = @"Method";
  id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x1E4F28228];
  id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 803);
  v11[3] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  id v9 = (void *)[v3 initWithDomain:v4 code:12 userInfo:v8];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v9);
}

void __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_230(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[6];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v35 = 0;
  uint64_t v4 = v2;
  uint64_t v5 = [v4 transceive:v3 error:&v35];
  id v6 = v35;

  if (v6)
  {
    id v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Send request error = %{public}@", v12, ClassName, Name, 812, v6);
    }
    dispatch_get_specific(*v7);
    uint64_t v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      id v16 = object_getClassName(*(id *)(a1 + 32));
      long long v17 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v37 = v15;
      __int16 v38 = 2082;
      __int16 v39 = v16;
      __int16 v40 = 2082;
      __int16 v41 = v17;
      __int16 v42 = 1024;
      int v43 = 812;
      __int16 v44 = 2114;
      id v45 = v6;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Send request error = %{public}@", buf, 0x2Cu);
    }

    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      id v19 = *(void **)(v18 + 48);
    }
    else {
      id v19 = 0;
    }
    [v19 endSession];
    uint64_t v20 = *(void *)(a1 + 32);
    if (v20) {
      id v21 = *(NSObject **)(v20 + 32);
    }
    else {
      id v21 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_232;
    block[3] = &unk_1E595D540;
    BOOL v22 = &v34;
    id v34 = *(id *)(a1 + 48);
    id v23 = &v33;
    id v33 = v6;
    dispatch_async(v21, block);
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 32);
    if (v24) {
      int v25 = *(NSObject **)(v24 + 32);
    }
    else {
      int v25 = 0;
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_2_233;
    v28[3] = &unk_1E595CD38;
    BOOL v22 = &v31;
    id v31 = *(id *)(a1 + 48);
    id v23 = &v29;
    id v29 = v5;
    id v30 = 0;
    dispatch_async(v25, v28);
  }
}

uint64_t __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_232(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_2_233(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)stop
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__NFConnectionHandoverInitiator_stop__block_invoke;
  v2[3] = &unk_1E595CC98;
  v2[4] = self;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v2);
}

uint64_t __37__NFConnectionHandoverInitiator_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopWithError:0];
}

- (void)_stopWithError:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self) {
    goto LABEL_26;
  }
  int64_t state = self->super._state;
  if ((unint64_t)(state - 1) >= 2)
  {
    if (state == 4)
    {
      uint64_t v46 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        id v48 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v52 = 45;
        if (isMetaClass) {
          uint64_t v52 = 43;
        }
        v48(6, "%c[%{public}s %{public}s]:%i Session previously invalidated", v52, ClassName, Name, 841);
      }
      dispatch_get_specific(*v46);
      long long v14 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      uint64_t v53 = object_getClass(self);
      if (class_isMetaClass(v53)) {
        int v54 = 43;
      }
      else {
        int v54 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v62 = v54;
      __int16 v63 = 2082;
      uint64_t v64 = object_getClassName(self);
      __int16 v65 = 2082;
      v66 = sel_getName(a2);
      __int16 v67 = 1024;
      int v68 = 841;
      long long v17 = "%c[%{public}s %{public}s]:%i Session previously invalidated";
LABEL_49:
      __int16 v44 = v14;
      uint32_t v45 = 34;
LABEL_50:
      _os_log_impl(&dword_19D636000, v44, OS_LOG_TYPE_DEFAULT, v17, buf, v45);
LABEL_51:

      goto LABEL_52;
    }
    if (state == 3)
    {
      id v7 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v8 = NFLogGetLogger();
      if (v8)
      {
        id v9 = (void (*)(uint64_t, const char *, ...))v8;
        uint64_t v10 = object_getClass(self);
        BOOL v11 = class_isMetaClass(v10);
        uint64_t v12 = object_getClassName(self);
        __int16 v56 = sel_getName(a2);
        uint64_t v13 = 45;
        if (v11) {
          uint64_t v13 = 43;
        }
        v9(6, "%c[%{public}s %{public}s]:%i Stop in progress", v13, v12, v56, 837);
      }
      dispatch_get_specific(*v7);
      long long v14 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      int v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v62 = v16;
      __int16 v63 = 2082;
      uint64_t v64 = object_getClassName(self);
      __int16 v65 = 2082;
      v66 = sel_getName(a2);
      __int16 v67 = 1024;
      int v68 = 837;
      long long v17 = "%c[%{public}s %{public}s]:%i Stop in progress";
      goto LABEL_49;
    }
LABEL_26:
    id v31 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v32 = NFLogGetLogger();
    if (v32)
    {
      id v33 = (void (*)(uint64_t, const char *, ...))v32;
      id v34 = object_getClass(self);
      if (class_isMetaClass(v34)) {
        uint64_t v35 = 43;
      }
      else {
        uint64_t v35 = 45;
      }
      int v36 = object_getClassName(self);
      int v37 = sel_getName(a2);
      if (self) {
        int64_t v38 = self->super._state;
      }
      else {
        int64_t v38 = 0;
      }
      v33(6, "%c[%{public}s %{public}s]:%i Session not started, state=%ld", v35, v36, v37, 846, v38);
    }
    dispatch_get_specific(*v31);
    long long v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    __int16 v39 = object_getClass(self);
    if (class_isMetaClass(v39)) {
      int v40 = 43;
    }
    else {
      int v40 = 45;
    }
    __int16 v41 = object_getClassName(self);
    __int16 v42 = sel_getName(a2);
    if (self) {
      int64_t v43 = self->super._state;
    }
    else {
      int64_t v43 = 0;
    }
    *(_DWORD *)buf = 67110146;
    int v62 = v40;
    __int16 v63 = 2082;
    uint64_t v64 = v41;
    __int16 v65 = 2082;
    v66 = v42;
    __int16 v67 = 1024;
    int v68 = 846;
    __int16 v69 = 2048;
    int64_t v70 = v43;
    long long v17 = "%c[%{public}s %{public}s]:%i Session not started, state=%ld";
    __int16 v44 = v14;
    uint32_t v45 = 44;
    goto LABEL_50;
  }
  uint64_t v18 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t v19 = NFLogGetLogger();
  if (v19)
  {
    uint64_t v20 = (void (*)(uint64_t, const char *, ...))v19;
    id v21 = object_getClass(self);
    BOOL v22 = class_isMetaClass(v21);
    v55 = object_getClassName(self);
    int v57 = sel_getName(a2);
    uint64_t v23 = 45;
    if (v22) {
      uint64_t v23 = 43;
    }
    v20(6, "%c[%{public}s %{public}s]:%i error=%{public}@", v23, v55, v57, 850, v5);
  }
  dispatch_get_specific(*v18);
  uint64_t v24 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = object_getClass(self);
    if (class_isMetaClass(v25)) {
      int v26 = 43;
    }
    else {
      int v26 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v62 = v26;
    __int16 v63 = 2082;
    uint64_t v64 = object_getClassName(self);
    __int16 v65 = 2082;
    v66 = sel_getName(a2);
    __int16 v67 = 1024;
    int v68 = 850;
    __int16 v69 = 2114;
    int64_t v70 = (int64_t)v5;
    _os_log_impl(&dword_19D636000, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
  }

  self->super._int64_t state = 3;
  p_connectedTag = &self->_connectedTag;
  if (self->_connectedTag)
  {
    [(NFReaderSession *)self->_readerSession disconnectTag];
    __int16 v28 = *p_connectedTag;
    *p_connectedTag = 0;
  }
  readerSession = self->_readerSession;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __48__NFConnectionHandoverInitiator__stopWithError___block_invoke;
  v59[3] = &unk_1E595D0C8;
  v59[4] = self;
  id v60 = v5;
  [(NFSession *)readerSession endSessionWithCompletion:v59];
  objc_storeStrong((id *)&self->_readerSession, 0);
  objc_storeStrong((id *)&self->_connectedTag, 0);
  objc_storeStrong((id *)&self->_delayRequest, 0);
  objc_setProperty_nonatomic_copy(self, v30, 0, 72);
  [(NFTimer *)self->_delayRequestTimer stopTimer];
  [(NFTimer *)self->_tagConnectionTimer stopTimer];

LABEL_52:
}

void __48__NFConnectionHandoverInitiator__stopWithError___block_invoke(uint64_t a1)
{
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__NFConnectionHandoverInitiator__stopWithError___block_invoke_2;
  v2[3] = &unk_1E595D0C8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  -[NFConnectionHandoverController executeWithLock:](v1, v2);
}

void __48__NFConnectionHandoverInitiator__stopWithError___block_invoke_2(uint64_t a1)
{
}

void __54__NFConnectionHandoverInitiator__triggerInvalidateCB___block_invoke(uint64_t a1)
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
      id v9 = [NSString stringWithUTF8String:"nfcd"];
      v18[0] = *MEMORY[0x1E4F28568];
      uint64_t v10 = [NSString stringWithUTF8String:"Success"];
      v19[0] = v10;
      v19[1] = &unk_1EEF356E0;
      v18[1] = @"Line";
      v18[2] = @"Method";
      BOOL v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
      v19[2] = v11;
      v18[3] = *MEMORY[0x1E4F28228];
      uint64_t v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 883);
      v19[3] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
      long long v14 = (void *)[v8 initWithDomain:v9 code:0 userInfo:v13];
      [v6 controller:v7 didInvalidated:v14];
    }
  }
  int v15 = [*(id *)(a1 + 32) delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    long long v17 = [*(id *)(a1 + 32) delegate];
    [v17 controller:*(void *)(a1 + 32) didInvalidate:*(void *)(a1 + 40)];
  }
}

- (void)_triggerDelayRequestCompletionWithSelect:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self)
  {
    id delayRequestCompletion = self->_delayRequestCompletion;
    if (delayRequestCompletion)
    {
      id v9 = delayRequestCompletion;
      objc_setProperty_nonatomic_copy(self, v10, 0, 72);
      objc_storeStrong((id *)&self->_delayRequest, 0);
      callbackQueue = self->super._callbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__NFConnectionHandoverInitiator__triggerDelayRequestCompletionWithSelect_error___block_invoke;
      block[3] = &unk_1E595CD38;
      id v16 = v9;
      id v14 = v6;
      id v15 = v7;
      id v12 = v9;
      dispatch_async(callbackQueue, block);
    }
  }
}

uint64_t __80__NFConnectionHandoverInitiator__triggerDelayRequestCompletionWithSelect_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)handleSessionSuspended:(id)a3 token:(id)a4 reason:(int64_t)a5 field:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  if (a5 == 2)
  {
    SEL v10 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
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
      v12(6, "%c[%{public}s %{public}s]:%i Suspend on remote initiator field detected", v16, ClassName, Name, 918);
    }
    dispatch_get_specific(*v10);
    long long v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = object_getClass(self);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v26 = v19;
      __int16 v27 = 2082;
      __int16 v28 = object_getClassName(self);
      __int16 v29 = 2082;
      SEL v30 = sel_getName(a2);
      __int16 v31 = 1024;
      int v32 = 918;
      _os_log_impl(&dword_19D636000, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Suspend on remote initiator field detected", buf, 0x22u);
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__NFConnectionHandoverInitiator_handleSessionSuspended_token_reason_field___block_invoke;
    v21[3] = &unk_1E595CC48;
    id v22 = v9;
    uint64_t v23 = self;
    SEL v24 = a2;
    -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v21);
  }
}

void __75__NFConnectionHandoverInitiator_handleSessionSuspended_token_reason_field___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 chFieldType];
    uint64_t v4 = 12;
    if (v3 == 4) {
      uint64_t v4 = 67;
    }
    if (v3 == 5) {
      uint64_t v5 = 68;
    }
    else {
      uint64_t v5 = v4;
    }
    id v6 = *(void **)(a1 + 40);
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v8 = [NSString stringWithUTF8String:"nfcd"];
    v31[0] = *MEMORY[0x1E4F28568];
    id v9 = [NSString stringWithUTF8String:NFResultCodeString_0[v5]];
    v32[0] = v9;
    v32[1] = &unk_1EEF35710;
    v31[1] = @"Line";
    v31[2] = @"Method";
    SEL v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
    v32[2] = v10;
    v31[3] = *MEMORY[0x1E4F28228];
    BOOL v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 941);
    v32[3] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];
    uint64_t v13 = v7;
    id v14 = v8;
    uint64_t v15 = v5;
  }
  else
  {
    uint64_t v16 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 40));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 40));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v18(3, "%c[%{public}s %{public}s]:%i Missing field", v22, ClassName, Name, 921);
    }
    dispatch_get_specific(*v16);
    uint64_t v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      SEL v24 = object_getClass(*(id *)(a1 + 40));
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      int v26 = object_getClassName(*(id *)(a1 + 40));
      __int16 v27 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v36 = v25;
      __int16 v37 = 2082;
      int64_t v38 = v26;
      __int16 v39 = 2082;
      int v40 = v27;
      __int16 v41 = 1024;
      int v42 = 921;
      _os_log_impl(&dword_19D636000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing field", buf, 0x22u);
    }

    id v6 = *(void **)(a1 + 40);
    id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v8 = [NSString stringWithUTF8String:"nfcd"];
    v33[0] = *MEMORY[0x1E4F28568];
    id v9 = [NSString stringWithUTF8String:"Invalid State"];
    v34[0] = v9;
    v34[1] = &unk_1EEF356F8;
    v33[1] = @"Line";
    v33[2] = @"Method";
    SEL v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
    v34[2] = v10;
    v33[3] = *MEMORY[0x1E4F28228];
    BOOL v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 922);
    v34[3] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:4];
    uint64_t v13 = v28;
    id v14 = v8;
    uint64_t v15 = 12;
  }
  __int16 v29 = (void *)[v13 initWithDomain:v14 code:v15 userInfo:v12];
  [v6 _stopWithError:v29];
}

- (BOOL)_processSelectResponse:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 status] == 27013)
  {
    id v6 = (void *)MEMORY[0x1E4FBA880];
    id v7 = [v5 response];
    id v8 = [v6 TLVsWithData:v7];

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v77 objects:v93 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v78;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v78 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v77 + 1) + 8 * v13);
        if ([v14 tag] == 165) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v77 objects:v93 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      uint64_t v15 = v14;

      if (!v15) {
        goto LABEL_34;
      }
      uint64_t v16 = [v15 childWithTag:206];
      if (v16)
      {
        long long v17 = v16;
        unsigned __int8 v75 = [v16 valueAsUnsignedShort];
        uint64_t v18 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          uint64_t v20 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          if (class_isMetaClass(Class)) {
            uint64_t v22 = 43;
          }
          else {
            uint64_t v22 = 45;
          }
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          if (self) {
            uint64_t version = self->super._version;
          }
          else {
            uint64_t version = 0;
          }
          v20(6, "%c[%{public}s %{public}s]:%i CurrentVer=%{public}d, remoteVer=%{public}d", v22, ClassName, Name, 974, version, v75);
        }
        dispatch_get_specific(*v18);
        int v26 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v27 = object_getClass(self);
          if (class_isMetaClass(v27)) {
            int v28 = 43;
          }
          else {
            int v28 = 45;
          }
          __int16 v29 = object_getClassName(self);
          SEL v30 = sel_getName(a2);
          if (self) {
            int v31 = self->super._version;
          }
          else {
            int v31 = 0;
          }
          *(_DWORD *)buf = 67110402;
          int v82 = v28;
          __int16 v83 = 2082;
          v84 = v29;
          __int16 v85 = 2082;
          v86 = v30;
          __int16 v87 = 1024;
          int v88 = 974;
          __int16 v89 = 1026;
          int v90 = v31;
          __int16 v91 = 1026;
          int v92 = v75;
          _os_log_impl(&dword_19D636000, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i CurrentVer=%{public}d, remoteVer=%{public}d", buf, 0x2Eu);
        }

        int v32 = NFSharedSignpostLog();
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19D636000, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MISMATCH_APP_VERSION", "", buf, 2u);
        }

        if (self) {
          callbackQueue = self->super._callbackQueue;
        }
        else {
          callbackQueue = 0;
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__NFConnectionHandoverInitiator__processSelectResponse___block_invoke;
        block[3] = &unk_1E595CC98;
        void block[4] = self;
        dispatch_async(callbackQueue, block);

        goto LABEL_32;
      }
      double v59 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v60 = NFLogGetLogger();
      if (v60)
      {
        uint64_t v61 = (void (*)(uint64_t, const char *, ...))v60;
        int v62 = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(v62);
        uint64_t v64 = object_getClassName(self);
        v73 = sel_getName(a2);
        uint64_t v65 = 45;
        if (isMetaClass) {
          uint64_t v65 = 43;
        }
        v61(6, "%c[%{public}s %{public}s]:%i Missing FCI", v65, v64, v73, 968);
      }
      dispatch_get_specific(*v59);
      v66 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v67 = object_getClass(self);
        if (class_isMetaClass(v67)) {
          int v68 = 43;
        }
        else {
          int v68 = 45;
        }
        __int16 v69 = object_getClassName(self);
        int64_t v70 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v82 = v68;
        __int16 v83 = 2082;
        v84 = v69;
        __int16 v85 = 2082;
        v86 = v70;
        __int16 v87 = 1024;
        int v88 = 968;
        _os_log_impl(&dword_19D636000, v66, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing FCI", buf, 0x22u);
      }
    }
    else
    {
LABEL_10:

LABEL_34:
      uint64_t v35 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v36 = NFLogGetLogger();
      if (v36)
      {
        __int16 v37 = (void (*)(uint64_t, const char *, ...))v36;
        int64_t v38 = object_getClass(self);
        BOOL v39 = class_isMetaClass(v38);
        int v40 = object_getClassName(self);
        v72 = sel_getName(a2);
        uint64_t v41 = 45;
        if (v39) {
          uint64_t v41 = 43;
        }
        v37(6, "%c[%{public}s %{public}s]:%i Missing FCI", v41, v40, v72, 962);
      }
      dispatch_get_specific(*v35);
      uint64_t v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v42 = object_getClass(self);
        if (class_isMetaClass(v42)) {
          int v43 = 43;
        }
        else {
          int v43 = 45;
        }
        __int16 v44 = object_getClassName(self);
        uint32_t v45 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v82 = v43;
        __int16 v83 = 2082;
        v84 = v44;
        __int16 v85 = 2082;
        v86 = v45;
        __int16 v87 = 1024;
        int v88 = 962;
        _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing FCI", buf, 0x22u);
      }
    }

    goto LABEL_63;
  }
LABEL_32:
  if ([v5 status] != 36864)
  {
    uint64_t v46 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v47 = NFLogGetLogger();
    if (v47)
    {
      id v48 = (void (*)(uint64_t, const char *, ...))v47;
      SEL v49 = object_getClass(self);
      BOOL v50 = class_isMetaClass(v49);
      int v51 = object_getClassName(self);
      uint64_t v52 = sel_getName(a2);
      uint64_t v74 = [v5 status];
      uint64_t v53 = 45;
      if (v50) {
        uint64_t v53 = 43;
      }
      v48(6, "%c[%{public}s %{public}s]:%i SELECT failed: status=0x%x", v53, v51, v52, 984, v74);
    }
    dispatch_get_specific(*v46);
    id v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v54 = object_getClass(self);
      if (class_isMetaClass(v54)) {
        int v55 = 43;
      }
      else {
        int v55 = 45;
      }
      __int16 v56 = object_getClassName(self);
      int v57 = sel_getName(a2);
      int v58 = [v5 status];
      *(_DWORD *)buf = 67110146;
      int v82 = v55;
      __int16 v83 = 2082;
      v84 = v56;
      __int16 v85 = 2082;
      v86 = v57;
      __int16 v87 = 1024;
      int v88 = 984;
      __int16 v89 = 1024;
      int v90 = v58;
      _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SELECT failed: status=0x%x", buf, 0x28u);
    }
LABEL_63:

    BOOL v34 = 0;
    goto LABEL_64;
  }
  BOOL v34 = 1;
LABEL_64:

  return v34;
}

void __56__NFConnectionHandoverInitiator__processSelectResponse___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controllerDidDetectUnsupportedReceiverVersion:*(void *)(a1 + 32)];
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v8 count])
  {
    id v9 = [v8 firstObject];
    id v96 = 0;
    int v10 = [v7 connectTag:v9 error:&v96];
    id v11 = v96;
    id v12 = v11;
    if (!v10 || v11)
    {
      __int16 v44 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v46 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v49 = 45;
        if (isMetaClass) {
          uint64_t v49 = 43;
        }
        v46(6, "%c[%{public}s %{public}s]:%i Failed to connect to tag : %@", v49, ClassName, Name, 1003, v12);
      }
      dispatch_get_specific(*v44);
      BOOL v50 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        int v51 = object_getClass(self);
        if (class_isMetaClass(v51)) {
          int v52 = 43;
        }
        else {
          int v52 = 45;
        }
        uint64_t v53 = object_getClassName(self);
        int v54 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v98 = v52;
        __int16 v99 = 2082;
        v100 = v53;
        __int16 v101 = 2082;
        v102 = v54;
        __int16 v103 = 1024;
        int v104 = 1003;
        __int16 v105 = 2112;
        id v106 = v12;
        _os_log_impl(&dword_19D636000, v50, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to connect to tag : %@", buf, 0x2Cu);
      }

      [v7 disconnectTagWithCardRemoval:0];
    }
    else
    {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:&CH_APP_NAME length:12];
      id v14 = v13;
      if (self)
      {
        unsigned __int8 version = self->super._version;
        if (version)
        {
          buf[0] = 46;
          buf[1] = version;
          [v13 appendBytes:buf length:2];
        }
      }
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4FBA850], "buildAPDUHeaderWithClass:instruction:p1:p2:len:useExtendedLength:", 0, 164, 4, 0, objc_msgSend(v14, "length"), 0);
      [v16 appendData:v14];
      id v17 = (id)[MEMORY[0x1E4FBA850] appendExpectedLength:0 usingExtendedLength:0 toAPDU:v16];
      id v95 = 0;
      uint64_t v18 = [v7 transceive:v16 error:&v95];
      id v12 = v95;
      if (v12)
      {
        long long v80 = v14;
        int v82 = v9;
        int v19 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t v20 = NFLogGetLogger();
        if (v20)
        {
          id v21 = (void (*)(uint64_t, const char *, ...))v20;
          uint64_t v22 = object_getClass(self);
          BOOL v23 = class_isMetaClass(v22);
          v72 = object_getClassName(self);
          uint64_t v74 = sel_getName(a2);
          uint64_t v24 = 45;
          if (v23) {
            uint64_t v24 = 43;
          }
          v21(6, "%c[%{public}s %{public}s]:%i SELECT failed: %@", v24, v72, v74, 1025, v12);
        }
        dispatch_get_specific(*v19);
        int v25 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = object_getClass(self);
          if (class_isMetaClass(v26)) {
            int v27 = 43;
          }
          else {
            int v27 = 45;
          }
          int v28 = object_getClassName(self);
          __int16 v29 = v18;
          SEL v30 = v28;
          int v31 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v98 = v27;
          __int16 v99 = 2082;
          v100 = v30;
          uint64_t v18 = v29;
          __int16 v101 = 2082;
          v102 = v31;
          __int16 v103 = 1024;
          int v104 = 1025;
          __int16 v105 = 2112;
          id v106 = v12;
          _os_log_impl(&dword_19D636000, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SELECT failed: %@", buf, 0x2Cu);
        }

        [v7 disconnectTagWithCardRemoval:0];
        id v14 = v80;
        id v9 = v82;
      }
      else
      {
        uint64_t v79 = [MEMORY[0x1E4FBA870] responseWithData:v18];
        if (-[NFConnectionHandoverInitiator _processSelectResponse:](self, "_processSelectResponse:"))
        {
          long long v78 = v18;
          uint64_t v91 = 0;
          int v92 = &v91;
          uint64_t v93 = 0x2020000000;
          char v94 = 0;
          v88[0] = MEMORY[0x1E4F143A8];
          v88[1] = 3221225472;
          v88[2] = __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke;
          v88[3] = &unk_1E595D720;
          v88[4] = self;
          id v89 = v9;
          int v90 = &v91;
          -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v88);
          if (*((unsigned char *)v92 + 24))
          {
            v81 = v14;
            __int16 v83 = v9;
            int v55 = (const void **)MEMORY[0x1E4FBA898];
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t v56 = NFLogGetLogger();
            if (v56)
            {
              int v57 = (void (*)(uint64_t, const char *, ...))v56;
              int v58 = object_getClass(self);
              BOOL v59 = class_isMetaClass(v58);
              uint64_t v60 = object_getClassName(self);
              long long v77 = sel_getName(a2);
              uint64_t v61 = 45;
              if (v59) {
                uint64_t v61 = 43;
              }
              v57(6, "%c[%{public}s %{public}s]:%i Sending retry request", v61, v60, v77, 1045);
            }
            dispatch_get_specific(*v55);
            int v62 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v63 = object_getClass(self);
              if (class_isMetaClass(v63)) {
                int v64 = 43;
              }
              else {
                int v64 = 45;
              }
              uint64_t v65 = object_getClassName(self);
              v66 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v98 = v64;
              __int16 v99 = 2082;
              v100 = v65;
              __int16 v101 = 2082;
              v102 = v66;
              __int16 v103 = 1024;
              int v104 = 1045;
              _os_log_impl(&dword_19D636000, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Sending retry request", buf, 0x22u);
            }

            if (self) {
              delayRequest = self->_delayRequest;
            }
            else {
              delayRequest = 0;
            }
            id v14 = v81;
            id v9 = v83;
            int v68 = delayRequest;
            __int16 v69 = [(NFConnectionHandoverRequest *)v68 encode];
            v85[0] = MEMORY[0x1E4F143A8];
            v85[1] = 3221225472;
            v85[2] = __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke_261;
            v85[3] = &unk_1E595D5B8;
            v85[4] = self;
            id v86 = v7;
            SEL v87 = a2;
            [(NFConnectionHandoverInitiator *)self send:v69 responseHandler:v85];

            uint64_t v18 = v78;
            int64_t v70 = (void *)v79;
          }
          else
          {
            if (self) {
              callbackQueue = self->super._callbackQueue;
            }
            else {
              callbackQueue = 0;
            }
            int64_t v70 = (void *)v79;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke_264;
            block[3] = &unk_1E595CC98;
            void block[4] = self;
            dispatch_async(callbackQueue, block);
          }

          _Block_object_dispose(&v91, 8);
        }
        else
        {
          [v7 disconnectTagWithCardRemoval:0];
          int64_t v70 = (void *)v79;
        }
      }
    }
  }
  else
  {
    int v32 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v33 = NFLogGetLogger();
    if (v33)
    {
      BOOL v34 = (void (*)(uint64_t, const char *, ...))v33;
      uint64_t v35 = object_getClass(self);
      BOOL v36 = class_isMetaClass(v35);
      __int16 v37 = object_getClassName(self);
      unsigned __int8 v75 = sel_getName(a2);
      uint64_t v38 = 45;
      if (v36) {
        uint64_t v38 = 43;
      }
      v34(6, "%c[%{public}s %{public}s]:%i No tag found, restart polling", v38, v37, v75, 994);
    }
    dispatch_get_specific(*v32);
    BOOL v39 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = object_getClass(self);
      if (class_isMetaClass(v40)) {
        int v41 = 43;
      }
      else {
        int v41 = 45;
      }
      int v42 = object_getClassName(self);
      int v43 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v98 = v41;
      __int16 v99 = 2082;
      v100 = v42;
      __int16 v101 = 2082;
      v102 = v43;
      __int16 v103 = 1024;
      int v104 = 994;
      _os_log_impl(&dword_19D636000, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No tag found, restart polling", buf, 0x22u);
    }

    [v7 disconnectTagWithCardRemoval:0];
  }
}

uint64_t __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v2 = *(void *)(v2 + 64);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 88);
  }
  else {
    uint64_t v4 = 0;
  }
  return [v4 stopTimer];
}

void __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke_261(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(os_unfair_lock_s **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke_2;
  v10[3] = &unk_1E595D590;
  void v10[4] = v7;
  id v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = *(void *)(a1 + 48);
  id v8 = v5;
  id v9 = v6;
  -[NFConnectionHandoverController executeWithLock:](v7, v10);
}

void __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke_2(uint64_t a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  -[NFConnectionHandoverInitiator setDelayRequest:](*(void *)(a1 + 32), 0);
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 48) disconnectTagWithCardRemoval:0];
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 _triggerDelayRequestCompletionWithSelect:0 error:v3];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 56) decodeCHSelect];
    if (v4)
    {
      id v5 = 0;
    }
    else
    {
      id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v7 = [NSString stringWithUTF8String:"nfcd"];
      v12[0] = *MEMORY[0x1E4F28568];
      id v8 = [NSString stringWithUTF8String:"Decoding Error"];
      v13[0] = v8;
      v13[1] = &unk_1EEF35728;
      v12[1] = @"Line";
      v12[2] = @"Method";
      id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 64)));
      v13[2] = v9;
      v12[3] = *MEMORY[0x1E4F28228];
      int v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 64)), 1058);
      v13[3] = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
      id v5 = (void *)[v6 initWithDomain:v7 code:23 userInfo:v11];
    }
    [*(id *)(a1 + 32) _triggerDelayRequestCompletionWithSelect:v4 error:v5];
  }
}

void __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke_264(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controllerDidConnectToReceiver:*(void *)(a1 + 32)];
}

- (void)readerSessionDidEndUnexpectedly:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
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
    v7(6, "%c[%{public}s %{public}s]:%i Session terminated unexpectedly", v11, ClassName, Name, 1074);
  }
  dispatch_get_specific(*v5);
  id v12 = NFSharedLogGetLogger();
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
    uint64_t v20 = object_getClassName(self);
    __int16 v21 = 2082;
    uint64_t v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 1074;
    _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session terminated unexpectedly", buf, 0x22u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__NFConnectionHandoverInitiator_readerSessionDidEndUnexpectedly___block_invoke;
  v16[3] = &unk_1E595C698;
  v16[4] = self;
  v16[5] = a2;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v16);
}

void __65__NFConnectionHandoverInitiator_readerSessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  v15[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v8 = [NSString stringWithUTF8String:"nfcd"];
  v14[0] = *MEMORY[0x1E4F28568];
  id v9 = [NSString stringWithUTF8String:"Session terminated"];
  v15[0] = v9;
  v15[1] = &unk_1EEF35740;
  v14[1] = @"Line";
  v14[2] = @"Method";
  int v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  void v15[2] = v10;
  v14[3] = *MEMORY[0x1E4F28228];
  uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 1078);
  v15[3] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  id v13 = (void *)[v7 initWithDomain:v8 code:44 userInfo:v12];
  -[NFConnectionHandoverInitiator _triggerInvalidateCB:](v6, v13);
}

- (void)readerSessionDidEndUnexpectedly:(id)a3 reason:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i Session terminated unexpectedly", v13, ClassName, Name, 1084);
  }
  dispatch_get_specific(*v7);
  int v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v23 = v16;
    __int16 v24 = 2082;
    uint64_t v25 = object_getClassName(self);
    __int16 v26 = 2082;
    int v27 = sel_getName(a2);
    __int16 v28 = 1024;
    int v29 = 1084;
    _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session terminated unexpectedly", buf, 0x22u);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__NFConnectionHandoverInitiator_readerSessionDidEndUnexpectedly_reason___block_invoke;
  v19[3] = &unk_1E595CC48;
  v19[4] = self;
  id v20 = v6;
  SEL v21 = a2;
  id v17 = v6;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v19);
}

void __72__NFConnectionHandoverInitiator_readerSessionDidEndUnexpectedly_reason___block_invoke(uint64_t a1)
{
  v20[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v8 = [NSString stringWithUTF8String:"nfcd"];
  uint64_t v9 = [*(id *)(a1 + 40) code];
  v19[0] = *MEMORY[0x1E4F28568];
  int v10 = NSString;
  if ([*(id *)(a1 + 40) code] > 70) {
    uint64_t v11 = 71;
  }
  else {
    uint64_t v11 = [*(id *)(a1 + 40) code];
  }
  id v12 = [v10 stringWithUTF8String:NFResultCodeString_0[v11]];
  uint64_t v13 = *MEMORY[0x1E4F28A50];
  uint64_t v14 = *(void *)(a1 + 40);
  v20[0] = v12;
  v20[1] = v14;
  v19[1] = v13;
  v19[2] = @"Line";
  v20[2] = &unk_1EEF35758;
  v19[3] = @"Method";
  uint64_t v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v20[3] = v15;
  v19[4] = *MEMORY[0x1E4F28228];
  int v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 1088);
  v20[4] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];
  int v18 = (void *)[v7 initWithDomain:v8 code:v9 userInfo:v17];
  -[NFConnectionHandoverInitiator _triggerInvalidateCB:](v6, v18);
}

- (void)readerSession:(id)a3 externalReaderFieldNotification:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__NFConnectionHandoverInitiator_readerSession_externalReaderFieldNotification___block_invoke;
  v11[3] = &unk_1E595CDD8;
  void v11[4] = self;
  id v12 = v8;
  id v13 = v7;
  SEL v14 = a2;
  id v9 = v7;
  id v10 = v8;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v11);
}

void __79__NFConnectionHandoverInitiator_readerSession_externalReaderFieldNotification___block_invoke(uint64_t a1)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || *(void *)(v2 + 24) != 2)
  {
    int v18 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(Class)) {
        uint64_t v22 = 43;
      }
      else {
        uint64_t v22 = 45;
      }
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v25 = *(void *)(a1 + 32);
      if (v25) {
        uint64_t v25 = *(void *)(v25 + 24);
      }
      v20(6, "%c[%{public}s %{public}s]:%i Dropping notification due to invalid state: %ld", v22, ClassName, Name, 1096, v25);
    }
    dispatch_get_specific(*v18);
    id v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    __int16 v26 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v26)) {
      int v27 = 43;
    }
    else {
      int v27 = 45;
    }
    __int16 v28 = object_getClassName(*(id *)(a1 + 32));
    int v29 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v30 = *(void **)(a1 + 32);
    if (v30) {
      uint64_t v30 = (void *)v30[3];
    }
    *(_DWORD *)buf = 67110146;
    int v68 = v27;
    __int16 v69 = 2082;
    int64_t v70 = v28;
    __int16 v71 = 2082;
    v72 = v29;
    __int16 v73 = 1024;
    int v74 = 1096;
    __int16 v75 = 2048;
    id v76 = v30;
    uint64_t v15 = "%c[%{public}s %{public}s]:%i Dropping notification due to invalid state: %ld";
    int v16 = v10;
    uint32_t v17 = 44;
    goto LABEL_27;
  }
  if ([*(id *)(a1 + 40) cachedBeforeRFReset])
  {
    uint64_t v3 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v4 = NFLogGetLogger();
    if (v4)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))v4;
      uint64_t v6 = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(v6);
      id v8 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v60 = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v5(6, "%c[%{public}s %{public}s]:%i Ignore preexisting field", v9, v8, v60, 1101);
    }
    dispatch_get_specific(*v3);
    id v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    SEL v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67109890;
    int v68 = v12;
    __int16 v69 = 2082;
    int64_t v70 = v13;
    __int16 v71 = 2082;
    v72 = v14;
    __int16 v73 = 1024;
    int v74 = 1101;
    uint64_t v15 = "%c[%{public}s %{public}s]:%i Ignore preexisting field";
    int v16 = v10;
    uint32_t v17 = 34;
LABEL_27:
    _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_28:

    return;
  }
  uint64_t v31 = *(void *)(a1 + 32);
  if (v31) {
    int v32 = *(NSObject **)(v31 + 32);
  }
  else {
    int v32 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__NFConnectionHandoverInitiator_readerSession_externalReaderFieldNotification___block_invoke_272;
  block[3] = &unk_1E595D0C8;
  void block[4] = v31;
  id v64 = *(id *)(a1 + 40);
  dispatch_async(v32, block);
  if (([*(id *)(a1 + 40) chFieldType] & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    uint64_t v33 = *(void **)(a1 + 48);
    id v62 = 0;
    char v34 = [v33 restartPollingWithError:&v62];
    id v35 = v62;
    if ((v34 & 1) == 0)
    {
      BOOL v36 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v37 = NFLogGetLogger();
      if (v37)
      {
        uint64_t v38 = (void (*)(uint64_t, const char *, ...))v37;
        BOOL v39 = object_getClass(*(id *)(a1 + 32));
        BOOL v40 = class_isMetaClass(v39);
        BOOL v59 = object_getClassName(*(id *)(a1 + 32));
        uint64_t v61 = sel_getName(*(SEL *)(a1 + 56));
        uint64_t v41 = 45;
        if (v40) {
          uint64_t v41 = 43;
        }
        v38(3, "%c[%{public}s %{public}s]:%i Unexpected error=%@", v41, v59, v61, 1117, v35);
      }
      dispatch_get_specific(*v36);
      int v42 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        int v43 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v43)) {
          int v44 = 43;
        }
        else {
          int v44 = 45;
        }
        uint32_t v45 = object_getClassName(*(id *)(a1 + 32));
        uint64_t v46 = sel_getName(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 67110146;
        int v68 = v44;
        __int16 v69 = 2082;
        int64_t v70 = v45;
        __int16 v71 = 2082;
        v72 = v46;
        __int16 v73 = 1024;
        int v74 = 1117;
        __int16 v75 = 2112;
        id v76 = v35;
        _os_log_impl(&dword_19D636000, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected error=%@", buf, 0x2Cu);
      }

      uint64_t v47 = *(void **)(a1 + 32);
      id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v49 = [NSString stringWithUTF8String:"nfcd"];
      uint64_t v50 = [v35 code];
      v65[0] = *MEMORY[0x1E4F28568];
      int v51 = NSString;
      if ([v35 code] > 70) {
        uint64_t v52 = 71;
      }
      else {
        uint64_t v52 = [v35 code];
      }
      uint64_t v53 = [v51 stringWithUTF8String:NFResultCodeString_0[v52]];
      uint64_t v54 = *MEMORY[0x1E4F28A50];
      v66[0] = v53;
      v66[1] = v35;
      v65[1] = v54;
      v65[2] = @"Line";
      v66[2] = &unk_1EEF35770;
      v65[3] = @"Method";
      int v55 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
      v66[3] = v55;
      v65[4] = *MEMORY[0x1E4F28228];
      uint64_t v56 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 1118);
      v66[4] = v56;
      int v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:5];
      int v58 = (void *)[v48 initWithDomain:v49 code:v50 userInfo:v57];
      [v47 _stopWithError:v58];
    }
  }
}

void __79__NFConnectionHandoverInitiator_readerSession_externalReaderFieldNotification___block_invoke_272(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) didReceiveField:*(void *)(a1 + 40)];
}

- (NFConnectionHandoverInitiatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NFConnectionHandoverInitiatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecpFrame, 0);
  objc_storeStrong((id *)&self->_tagConnectionTimer, 0);
  objc_storeStrong((id *)&self->_delayRequestTimer, 0);
  objc_storeStrong(&self->_delayRequestCompletion, 0);
  objc_storeStrong((id *)&self->_delayRequest, 0);
  objc_storeStrong((id *)&self->_connectedTag, 0);
  objc_storeStrong((id *)&self->_readerSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end