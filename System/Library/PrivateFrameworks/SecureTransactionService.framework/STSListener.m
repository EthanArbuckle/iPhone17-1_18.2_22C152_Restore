@interface STSListener
- (STSListener)init;
- (STSListenerDelegate)delegate;
- (id)startWithDelegate:(id)a3;
- (id)stop;
- (void)didEndSession;
- (void)didEnterField:(id)a3;
- (void)didExitField;
- (void)didStartSession:(id)a3;
- (void)fieldDetectSession:(id)a3 didDetectField:(BOOL)a4;
- (void)fieldDetectSession:(id)a3 didEnterFieldWithNotification:(id)a4;
- (void)fieldDetectSessionDidEndUnexpectedly:(id)a3;
- (void)fieldDetectSessionDidExitField:(id)a3;
@end

@implementation STSListener

- (STSListener)init
{
  v13.receiver = self;
  v13.super_class = (Class)STSListener;
  id v5 = [(STSListener *)&v13 init];
  if (v5)
  {
    sub_2211983A0(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener init]", 29, (uint64_t)"Creating listener", v2, v3, v4, (uint64_t)v13.receiver);
    ClassName = object_getClassName(v5);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(ClassName, v7);
    v9 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v8;

    uint64_t v10 = objc_opt_new();
    v11 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v10;

    dispatch_suspend(*((dispatch_object_t *)v5 + 1));
  }
  return (STSListener *)v5;
}

- (id)startWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_221170000, "startWithDelegate:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener startWithDelegate:]", 44, self, @"Starting withdelegate", v6, v7, v12[0]);
  objc_storeWeak((id *)&self->_delegate, v4);
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v14 = 0x3032000000;
  v15 = sub_2211919F0;
  v16 = sub_221191A00;
  id v17 = 0;
  dispatch_queue_t v8 = [(STSHardwareManagerWrapper *)self->_nfHwManager manager];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = (uint64_t)sub_221191A08;
  v12[3] = (uint64_t)&unk_264594C68;
  v12[4] = (uint64_t)self;
  v12[5] = (uint64_t)&state;
  id v9 = (id)[v8 startFieldDetectSession:v12];

  id v10 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v10;
}

- (id)stop
{
  uint64_t v3 = _os_activity_create(&dword_221170000, "stop", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  nearFieldFdSession = self->_nearFieldFdSession;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_221191BC0;
  v6[3] = &unk_264594620;
  v6[4] = self;
  [(NFFieldDetectSession *)nearFieldFdSession endSessionWithCompletion:v6];
  return 0;
}

- (void)didEndSession
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didEndSession]", 76, self, &stru_26D2FDEC0, v2, v3, v6);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_221191C70;
  block[3] = &unk_264594620;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

- (void)didStartSession:(id)a3
{
  id v4 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didStartSession:]", 87, self, &stru_26D2FDEC0, v5, v6, v9[0]);
  callbackQueue = self->_callbackQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = (uint64_t)sub_221191DC4;
  v9[3] = (uint64_t)&unk_2645945A8;
  v9[4] = (uint64_t)self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(callbackQueue, v9);
}

- (void)didEnterField:(id)a3
{
  id v4 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didEnterField:]", 98, self, &stru_26D2FDEC0, v5, v6, v9[0]);
  callbackQueue = self->_callbackQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = (uint64_t)sub_221191F18;
  v9[3] = (uint64_t)&unk_2645945A8;
  v9[4] = (uint64_t)self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(callbackQueue, v9);
}

- (void)didExitField
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didExitField]", 110, self, &stru_26D2FDEC0, v2, v3, v6);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_221192054;
  block[3] = &unk_264594620;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

- (void)fieldDetectSession:(id)a3 didDetectField:(BOOL)a4
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener fieldDetectSession:didDetectField:]", 121, self, @"fieldPresent=%d", v4, v5, a4);
}

- (void)fieldDetectSession:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener fieldDetectSession:didEnterFieldWithNotification:]", 126, self, @"%@", v6, v7, (uint64_t)v5);
  sub_221199468(v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [(STSListener *)self didEnterField:v8];
}

- (void)fieldDetectSessionDidExitField:(id)a3
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener fieldDetectSessionDidExitField:]", 132, self, &stru_26D2FDEC0, v3, v4, v6);
  MEMORY[0x270F9A6D0](self, sel_didExitField);
}

- (void)fieldDetectSessionDidEndUnexpectedly:(id)a3
{
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSListener fieldDetectSessionDidEndUnexpectedly:]", 137, self, &stru_26D2FDEC0, v3, v4, v6);
  MEMORY[0x270F9A6D0](self, sel_didEndSession);
}

- (STSListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STSListenerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nfHwManager, 0);
  objc_storeStrong((id *)&self->_lastField, 0);
  objc_storeStrong((id *)&self->_nearFieldFdSession, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end