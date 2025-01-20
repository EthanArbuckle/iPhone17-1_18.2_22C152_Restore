@interface WRM_UCMInterface
- (BOOL)checkConnection:(id)a3;
- (WRM_UCMInterface)init;
- (id)getWirelessFrequencyBandUpdatesForMIC:(void *)a3;
- (id)getWirelessULFrequencyBandUpdates:(id)a3;
- (int64_t)getWirelessRadioManagerReportLoad:(int)a3 loadDuration:(double)a4 callback:(void *)a5;
- (unsigned)getInstantLoad;
- (unsigned)startTimer:(double)a3;
- (unsigned)stopTimer;
- (void)dealloc;
- (void)handleNotification:(id)a3 :(BOOL)a4;
- (void)processBTConnectedLinksNotification:(id)a3;
- (void)reConnect;
- (void)registerClient:(int)a3 queue:(id)a4;
- (void)sendBtLoad:(id)a3;
- (void)sendNRFrequencyUpdateForMic:(id)a3;
- (void)sendULFrequencyUpdate:(id)a3;
- (void)setAWDLEnabled:(BOOL)a3;
- (void)setCriticalAirPlayEnabled:(BOOL)a3 estimatedDuration:(unsigned int)a4 criticalityPercentage:(unsigned __int16)a5;
- (void)setNANEnabled:(BOOL)a3;
- (void)subscribeBtConnectedLinksNotification:(id)a3;
- (void)unregisterClient;
@end

@implementation WRM_UCMInterface

- (void)registerClient:(int)a3 queue:(id)a4
{
  keys[1] = *(char **)MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (OS_dispatch_queue *)v6;
    p_mQueue = &self->mQueue;
    mQueue = self->mQueue;
    self->mQueue = v8;
  }
  else
  {
    v11 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
    id v12 = MEMORY[0x263EF83A0];
    p_mQueue = &self->mQueue;
    mQueue = self->mQueue;
    self->mQueue = v11;
  }

  self->mProcessId = a3;
  objc_initWeak(&location, self);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __41__WRM_UCMInterface_registerClient_queue___block_invoke;
  v28[3] = &unk_26422A250;
  objc_copyWeak(&v29, &location);
  v13 = (void *)MEMORY[0x2166AEE70](v28);
  id mNotificationBlock = self->mNotificationBlock;
  if (mNotificationBlock)
  {
    self->id mNotificationBlock = 0;
  }
  v15 = (void *)[v13 copy];
  id v16 = self->mNotificationBlock;
  self->id mNotificationBlock = v15;

  if (!self->mConnection)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", (dispatch_queue_t)*p_mQueue, 0);
    mConnection = self->mConnection;
    self->mConnection = mach_service;

    v19 = self->mConnection;
    if (v19)
    {
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __41__WRM_UCMInterface_registerClient_queue___block_invoke_2;
      handler[3] = &unk_26422A630;
      objc_copyWeak(&v27, &location);
      xpc_connection_set_event_handler(v19, handler);
      xpc_connection_resume(self->mConnection);
      keys[0] = "kWCMRegisterProcess_ProcessId";
      xpc_object_t v20 = xpc_uint64_create(a3);
      xpc_object_t values = v20;
      xpc_object_t v21 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
      *(_OWORD *)v32 = xmmword_26422A728;
      xpc_object_t v22 = xpc_uint64_create(1uLL);
      v31[0] = v22;
      id v23 = v21;
      v31[1] = v23;
      xpc_object_t v24 = xpc_dictionary_create((const char *const *)v32, v31, 2uLL);
      xpc_connection_send_message(self->mConnection, v24);

      for (uint64_t i = 1; i != -1; --i)
      objc_destroyWeak(&v27);
    }

    v13 = 0;
  }
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)unregisterClient
{
  mConnection = self->mConnection;
  if (mConnection)
  {
    self->mConnection = 0;
  }
  id mNotificationBlock = self->mNotificationBlock;
  if (mNotificationBlock)
  {
    self->id mNotificationBlock = 0;
  }
  id mBtConnectedLinksObserver = self->mBtConnectedLinksObserver;
  if (mBtConnectedLinksObserver)
  {
    self->id mBtConnectedLinksObserver = 0;
  }
  if (self->mNRFrequencyUpdateForMicFuncPtr) {
    self->mNRFrequencyUpdateForMicFuncPtr = 0;
  }
}

- (void)subscribeBtConnectedLinksNotification:(id)a3
{
  id v4 = a3;
  mQueue = self->mQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__WRM_UCMInterface_subscribeBtConnectedLinksNotification___block_invoke;
  v7[3] = &unk_26422A328;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(mQueue, v7);
}

- (void)setCriticalAirPlayEnabled:(BOOL)a3 estimatedDuration:(unsigned int)a4 criticalityPercentage:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  uint64_t v20 = *MEMORY[0x263EF8340];
  v9 = "disable";
  if (a3) {
    v9 = "enable";
  }
  unsigned int mProcessId = self->mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    v11 = (&off_26422A760)[mProcessId];
  }
  else if (mProcessId == 42)
  {
    v11 = "WRMSOS";
  }
  else
  {
    v11 = "INVALID_PROC_ID!!!";
  }
  NSLog(&cfstr_ReceivedCritic.isa, a2, v9, v11);
  xpc_object_t v12 = xpc_uint64_create(0x76CuLL);
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v13, "kWCMAirplayCritical", a3);
  xpc_dictionary_set_uint64(v13, "kWCMAirplayDuration", a4);
  xpc_dictionary_set_uint64(v13, "kWCMAirplayCriticalityPercentage", v5);
  *(_OWORD *)keys = xmmword_26422A728;
  id v14 = v12;
  values[0] = v14;
  id v15 = v13;
  values[1] = v15;
  xpc_object_t v16 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  xpc_connection_send_message(self->mConnection, v16);

  for (uint64_t i = 1; i != -1; --i)
}

- (void)setAWDLEnabled:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->mIsAwdlEnabled != a3)
  {
    unsigned int v5 = "disable";
    if (a3) {
      unsigned int v5 = "enable";
    }
    unsigned int mProcessId = self->mProcessId;
    if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
    {
      v7 = (&off_26422A760)[mProcessId];
    }
    else if (mProcessId == 42)
    {
      v7 = "WRMSOS";
    }
    else
    {
      v7 = "INVALID_PROC_ID!!!";
    }
    NSLog(&cfstr_SendingAwdlSFr.isa, a2, v5, v7);
    xpc_object_t v8 = xpc_uint64_create(0xA8CuLL);
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v9, "kWCMP2PAWDLOn", a3);
    *(_OWORD *)keys = xmmword_26422A728;
    id v10 = v8;
    values[0] = v10;
    id v11 = v9;
    values[1] = v11;
    xpc_object_t v12 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    xpc_connection_send_message(self->mConnection, v12);
    self->mIsAwdlEnabled = a3;

    for (uint64_t i = 1; i != -1; --i)
  }
}

- (void)setNANEnabled:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->mIsNanEnabled != a3)
  {
    unsigned int v5 = "disable";
    if (a3) {
      unsigned int v5 = "enable";
    }
    unsigned int mProcessId = self->mProcessId;
    if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
    {
      v7 = (&off_26422A760)[mProcessId];
    }
    else if (mProcessId == 42)
    {
      v7 = "WRMSOS";
    }
    else
    {
      v7 = "INVALID_PROC_ID!!!";
    }
    NSLog(&cfstr_SendingNanSFro.isa, a2, v5, v7);
    xpc_object_t v8 = xpc_uint64_create(0xA8DuLL);
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v9, "kWCMP2PNANOn", a3);
    *(_OWORD *)keys = xmmword_26422A728;
    id v10 = v8;
    values[0] = v10;
    id v11 = v9;
    values[1] = v11;
    xpc_object_t v12 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    xpc_connection_send_message(self->mConnection, v12);
    self->mIsNanEnabled = a3;

    for (uint64_t i = 1; i != -1; --i)
  }
}

- (WRM_UCMInterface)init
{
  v10.receiver = self;
  v10.super_class = (Class)WRM_UCMInterface;
  v2 = [(WRM_UCMInterface *)&v10 init];
  v3 = v2;
  if (v2)
  {
    id mBtConnectedLinksObserver = v2->mBtConnectedLinksObserver;
    v2->id mBtConnectedLinksObserver = 0;

    mConnection = v3->mConnection;
    v3->mConnection = 0;

    mQueue = v3->mQueue;
    v3->mQueue = 0;

    v3->unsigned int mProcessId = 0;
    id mNotificationBlock = v3->mNotificationBlock;
    v3->id mNotificationBlock = 0;

    *(_WORD *)&v3->mIsAwdlEnabled = 0;
    xpc_object_t v8 = v3;
  }

  return v3;
}

- (void)dealloc
{
  [(WRM_UCMInterface *)self unregisterClient];
  v3.receiver = self;
  v3.super_class = (Class)WRM_UCMInterface;
  [(WRM_UCMInterface *)&v3 dealloc];
}

- (void)reConnect
{
  [(WRM_UCMInterface *)self unregisterClient];
  [(WRM_UCMInterface *)self registerClient:self->mProcessId queue:self->mQueue];
  NSLog(&cfstr_ReSendingState.isa);
  int mProcessId = self->mProcessId;
  if (mProcessId == 39)
  {
    BOOL mIsNanEnabled = self->mIsNanEnabled;
    [(WRM_UCMInterface *)self setNANEnabled:mIsNanEnabled];
  }
  else if (mProcessId == 38)
  {
    BOOL mIsAwdlEnabled = self->mIsAwdlEnabled;
    [(WRM_UCMInterface *)self setAWDLEnabled:mIsAwdlEnabled];
  }
}

- (void)handleNotification:(id)a3 :(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  xpc_object_t xdict = v6;
  if (v4)
  {
    NSLog(&cfstr_InvokingReconn.isa);
    [(WRM_UCMInterface *)self reConnect];
    goto LABEL_14;
  }
  int64_t uint64 = xpc_dictionary_get_uint64(v6, "kMessageId");
  xpc_object_t v8 = xpc_dictionary_get_value(xdict, "kMessageArgs");
  if (uint64 > 2805)
  {
    xpc_object_t v9 = xdict;
    if (uint64 == 2806)
    {
      [(WRM_UCMInterface *)self sendNRFrequencyUpdateForMic:v8];
      goto LABEL_13;
    }
    if (uint64 == 2808)
    {
      [(WRM_UCMInterface *)self sendULFrequencyUpdate:v8];
      goto LABEL_13;
    }
LABEL_10:
    NSLog(&cfstr_ReceivedUnknow.isa, v9);
    goto LABEL_13;
  }
  xpc_object_t v9 = xdict;
  if (uint64 == 1429)
  {
    [(WRM_UCMInterface *)self processBTConnectedLinksNotification:v8];
    goto LABEL_13;
  }
  if (uint64 != 2803) {
    goto LABEL_10;
  }
  [(WRM_UCMInterface *)self sendBtLoad:v8];
LABEL_13:

LABEL_14:
}

- (void)processBTConnectedLinksNotification:(id)a3
{
  id v4 = a3;
  mQueue = self->mQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__WRM_UCMInterface_processBTConnectedLinksNotification___block_invoke;
  v7[3] = &unk_26422A2B0;
  id v8 = v4;
  xpc_object_t v9 = self;
  id v6 = v4;
  dispatch_async(mQueue, v7);
}

- (BOOL)checkConnection:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 == (id)MEMORY[0x263EF86A0])
  {
    NSLog(&cfstr_XpcErrorConnec.isa);
LABEL_8:
    BOOL v5 = 0;
    goto LABEL_9;
  }
  if (v3 == (id)MEMORY[0x263EF86A8])
  {
    NSLog(&cfstr_XpcErrorConnec_0.isa);
    goto LABEL_8;
  }
  if (v3 == (id)MEMORY[0x263EF86C0])
  {
    NSLog(&cfstr_XpcErrorTermin.isa);
    goto LABEL_8;
  }
  BOOL v5 = 1;
LABEL_9:

  return v5;
}

- (void)sendBtLoad:(id)a3
{
  id v4 = a3;
  mQueue = self->mQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__WRM_UCMInterface_sendBtLoad___block_invoke;
  v7[3] = &unk_26422A2B0;
  id v8 = v4;
  xpc_object_t v9 = self;
  id v6 = v4;
  dispatch_async(mQueue, v7);
}

- (unsigned)getInstantLoad
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  id v14 = self->mConnection;
  mQueue = self->mQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__WRM_UCMInterface_getInstantLoad__block_invoke;
  v8[3] = &unk_26422A690;
  dispatch_semaphore_t v9 = v3;
  objc_super v10 = self;
  id v11 = v13;
  xpc_object_t v12 = &v15;
  BOOL v5 = v3;
  dispatch_async(mQueue, v8);
  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v5, v6);
  LODWORD(v3) = *((_DWORD *)v16 + 6);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
  return v3;
}

- (unsigned)stopTimer
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  id v14 = self->mConnection;
  mQueue = self->mQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__WRM_UCMInterface_stopTimer__block_invoke;
  v8[3] = &unk_26422A690;
  dispatch_semaphore_t v9 = v3;
  objc_super v10 = self;
  id v11 = v13;
  xpc_object_t v12 = &v15;
  BOOL v5 = v3;
  dispatch_async(mQueue, v8);
  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v5, v6);
  LODWORD(v3) = *((_DWORD *)v16 + 6);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
  return v3;
}

- (unsigned)startTimer:(double)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  uint64_t v17 = self->mConnection;
  mQueue = self->mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__WRM_UCMInterface_startTimer___block_invoke;
  block[3] = &unk_26422A6B8;
  double v15 = a3;
  dispatch_semaphore_t v11 = v5;
  xpc_object_t v12 = self;
  xpc_object_t v13 = v16;
  id v14 = &v18;
  v7 = v5;
  dispatch_async(mQueue, block);
  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v7, v8);
  LODWORD(v5) = *((_DWORD *)v19 + 6);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
  return v5;
}

- (int64_t)getWirelessRadioManagerReportLoad:(int)a3 loadDuration:(double)a4 callback:(void *)a5
{
  NSLog(&cfstr_ReceivedGetwir.isa, a2);
  if (a3 == 2)
  {
    LODWORD(result) = [(WRM_UCMInterface *)self stopTimer];
    self->mHomeKitBTLoadFunctionPointer = 0;
  }
  else if (a3 == 1)
  {
    self->mHomeKitBTLoadFunctionPointer = a5;
    if (a4 <= 0.0)
    {
      NSLog(&cfstr_DurationIsNotV.isa);
      LODWORD(result) = 0;
    }
    else
    {
      LODWORD(result) = [(WRM_UCMInterface *)self startTimer:a4];
    }
  }
  else
  {
    if (a3) {
      return 0;
    }
    LODWORD(result) = [(WRM_UCMInterface *)self getInstantLoad];
  }
  return result;
}

- (void)sendNRFrequencyUpdateForMic:(id)a3
{
  id v4 = a3;
  mQueue = self->mQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__WRM_UCMInterface_sendNRFrequencyUpdateForMic___block_invoke;
  v7[3] = &unk_26422A2B0;
  id v8 = v4;
  dispatch_semaphore_t v9 = self;
  id v6 = v4;
  dispatch_async(mQueue, v7);
}

- (id)getWirelessFrequencyBandUpdatesForMIC:(void *)a3
{
  v33[2] = *MEMORY[0x263EF8340];
  NSLog(&cfstr_ReceivedGetwir_0.isa, a2);
  self->mNRFrequencyUpdateForMicFuncPtr = a3;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  id v23 = self->mConnection;
  mQueue = self->mQueue;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  double v15 = __58__WRM_UCMInterface_getWirelessFrequencyBandUpdatesForMIC___block_invoke;
  uint64_t v16 = &unk_26422A708;
  v19 = v22;
  v7 = v5;
  uint64_t v17 = v7;
  uint64_t v18 = self;
  uint64_t v20 = &v28;
  int v21 = &v24;
  dispatch_async(mQueue, &v13);
  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v7, v8);
  v32[0] = @"NRBand41Enabled";
  dispatch_semaphore_t v9 = objc_msgSend(NSNumber, "numberWithBool:", *((unsigned __int8 *)v29 + 24), v13, v14, v15, v16);
  v32[1] = @"NRBand7xEnabled";
  v33[0] = v9;
  objc_super v10 = [NSNumber numberWithBool:*((unsigned __int8 *)v25 + 24)];
  v33[1] = v10;
  dispatch_semaphore_t v11 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return v11;
}

- (void)sendULFrequencyUpdate:(id)a3
{
  id v4 = a3;
  mQueue = self->mQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__WRM_UCMInterface_sendULFrequencyUpdate___block_invoke;
  v7[3] = &unk_26422A2B0;
  id v8 = v4;
  dispatch_semaphore_t v9 = self;
  id v6 = v4;
  dispatch_async(mQueue, v7);
}

- (id)getWirelessULFrequencyBandUpdates:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_ReceivedGetwir_1.isa);
  dispatch_semaphore_t v5 = (void *)MEMORY[0x2166AEE70](v4);
  id mULFrequencyUpdatesObserver = self->mULFrequencyUpdatesObserver;
  self->id mULFrequencyUpdatesObserver = v5;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy_;
  v11[4] = __Block_byref_object_dispose_;
  xpc_object_t v12 = self->mConnection;
  mQueue = self->mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__WRM_UCMInterface_getWirelessULFrequencyBandUpdates___block_invoke;
  block[3] = &unk_26422A740;
  void block[4] = v11;
  dispatch_async(mQueue, block);
  id v8 = (void *)[&unk_26C5A1DC8 copy];
  _Block_object_dispose(v11, 8);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mQueue, 0);
  objc_storeStrong((id *)&self->mConnection, 0);
  objc_storeStrong(&self->mULFrequencyUpdatesObserver, 0);
  objc_storeStrong(&self->mNotificationBlock, 0);
  objc_storeStrong(&self->mBtConnectedLinksObserver, 0);
}

@end