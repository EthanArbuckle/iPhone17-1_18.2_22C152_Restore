@interface PowerUISmartChargeClientAudioAccessories
+ (id)remoteInterface;
- (BOOL)connectAndDisableOBCforDevice:(id)a3 withError:(id *)a4;
- (BOOL)disableSmartChargingForDevice:(id)a3 withError:(id *)a4;
- (BOOL)enableSmartChargingForDevice:(id)a3 withError:(id *)a4;
- (BOOL)setState:(unint64_t)a3 forDevice:(id)a4 withError:(id *)a5;
- (BOOL)temporarilyDisableSmartChargingForDevice:(id)a3 withError:(id *)a4;
- (BOOL)temporarilyEnableChargingForDevice:(id)a3 withError:(id *)a4;
- (BOOL)updateOBCDeadline:(id)a3 forDevice:(id)a4 withError:(id *)a5;
- (NSString)clientName;
- (NSXPCConnection)connection;
- (OS_os_log)log;
- (PowerUISmartChargeClientAudioAccessories)initWithClientName:(id)a3;
- (id)fullChargeDeadlineForDevice:(id)a3 withError:(id *)a4;
- (id)getAvailableDevices;
- (id)getStatusForDevice:(id)a3;
- (id)lastUsedLeewayWithError:(id *)a3;
- (id)unfilteredDeadlineForDevice:(id)a3 withError:(id *)a4;
- (unint64_t)isSmartChargingCurrentlyEnabledForDevice:(id)a3 withError:(id *)a4;
- (unint64_t)lastActionForDevice:(id)a3;
- (void)clearLastActionForDevice:(id)a3;
- (void)connectAndDisableOBCforDevice:(id)a3 withHandler:(id)a4;
- (void)dealloc;
- (void)deleteRecordsForDevice:(id)a3;
- (void)disableSmartChargingForDevice:(id)a3 withHandler:(id)a4;
- (void)enableSmartChargingForDevice:(id)a3 withHandler:(id)a4;
- (void)engageUntil:(id)a3 forDevice:(id)a4 overrideAllSignals:(BOOL)a5;
- (void)fakeConnectionForDevice:(id)a3;
- (void)fullChargeDeadlineForDevice:(id)a3 withHandler:(id)a4;
- (void)isSmartChargingCurrentlyEnabledForDevice:(id)a3 withHandler:(id)a4;
- (void)setClientName:(id)a3;
- (void)setConnection:(id)a3;
- (void)setFakeConnectionStatusTo:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)startMockingBluetoothForFakeDevice:(id)a3;
- (void)stopMockingBluetooth;
- (void)temporarilyDisableSmartChargingForDevice:(id)a3 withHandler:(id)a4;
- (void)temporarilyEnableChargingForDevice:(id)a3 withHandler:(id)a4;
- (void)timeSeriesForDevice:(id)a3;
- (void)unfilteredDeadlineForDevice:(id)a3 withHandler:(id)a4;
- (void)updateOBCDeadline:(id)a3 forDevice:(id)a4 withHandler:(id)a5;
@end

@implementation PowerUISmartChargeClientAudioAccessories

+ (id)remoteInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D38E700];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_getAvailableDevicesWithHandler_ argumentIndex:0 ofReply:1];

  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_getStatusForDevice_withHandler_ argumentIndex:0 ofReply:1];

  v9 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v9 forSelector:sel_getStatusForDevice_withHandler_ argumentIndex:0 ofReply:0];

  return v2;
}

- (PowerUISmartChargeClientAudioAccessories)initWithClientName:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PowerUISmartChargeClientAudioAccessories;
  v6 = [(PowerUISmartChargeClientAudioAccessories *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientName, a3);
    os_log_t v8 = os_log_create("com.apple.powerui.smartcharging.AudioAccessory", (const char *)[v5 UTF8String]);
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.powerui.audioAccessorySmartChargeManager" options:4096];
    connection = v7->_connection;
    v7->_connection = (NSXPCConnection *)v10;

    v12 = v7->_connection;
    v13 = [(id)objc_opt_class() remoteInterface];
    [(NSXPCConnection *)v12 setRemoteObjectInterface:v13];

    [(NSXPCConnection *)v7->_connection resume];
  }

  return v7;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PowerUISmartChargeClientAudioAccessories;
  [(PowerUISmartChargeClientAudioAccessories *)&v3 dealloc];
}

- (void)connectAndDisableOBCforDevice:(id)a3 withHandler:(id)a4
{
  connection = self->_connection;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v9 client:self->_clientName connectAndDisableOBCforDevice:v8 withHandler:v7];
}

- (BOOL)connectAndDisableOBCforDevice:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  uint64_t v14 = 0;
  objc_super v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __84__PowerUISmartChargeClientAudioAccessories_connectAndDisableOBCforDevice_withError___block_invoke;
  v13[3] = &unk_2645A6490;
  v13[4] = &v18;
  v13[5] = &v14;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  clientName = self->_clientName;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84__PowerUISmartChargeClientAudioAccessories_connectAndDisableOBCforDevice_withError___block_invoke_2;
  v12[3] = &unk_2645A64B8;
  v12[4] = &v18;
  v12[5] = &v14;
  [v8 client:clientName connectAndDisableOBCforDevice:v6 withHandler:v12];

  if (a4) {
    *a4 = (id) v19[5];
  }
  char v10 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __84__PowerUISmartChargeClientAudioAccessories_connectAndDisableOBCforDevice_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __84__PowerUISmartChargeClientAudioAccessories_connectAndDisableOBCforDevice_withError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)setState:(unint64_t)a3 forDevice:(id)a4 withError:(id *)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    clientName = self->_clientName;
    v11 = NSNumber;
    v12 = log;
    v13 = [v11 numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = clientName;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "Client '%@'requests state '%@'.", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  connection = self->_connection;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __73__PowerUISmartChargeClientAudioAccessories_setState_forDevice_withError___block_invoke;
  v20[3] = &unk_2645A6490;
  v20[4] = buf;
  v20[5] = &v21;
  objc_super v15 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v20];
  uint64_t v16 = self->_clientName;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __73__PowerUISmartChargeClientAudioAccessories_setState_forDevice_withError___block_invoke_2;
  v19[3] = &unk_2645A64B8;
  v19[4] = buf;
  v19[5] = &v21;
  [v15 client:v16 setState:a3 forDevice:v8 withHandler:v19];

  if (a5) {
    *a5 = *(id *)(*(void *)&buf[8] + 40);
  }
  BOOL v17 = *((unsigned char *)v22 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(buf, 8);

  return v17;
}

void __73__PowerUISmartChargeClientAudioAccessories_setState_forDevice_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __73__PowerUISmartChargeClientAudioAccessories_setState_forDevice_withError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (unint64_t)isSmartChargingCurrentlyEnabledForDevice:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__5;
  uint64_t v21 = __Block_byref_object_dispose__5;
  id v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 1;
  connection = self->_connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __95__PowerUISmartChargeClientAudioAccessories_isSmartChargingCurrentlyEnabledForDevice_withError___block_invoke;
  v12[3] = &unk_2645A5EE8;
  v12[4] = &v17;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __95__PowerUISmartChargeClientAudioAccessories_isSmartChargingCurrentlyEnabledForDevice_withError___block_invoke_2;
  v11[3] = &unk_2645A62B0;
  v11[4] = &v17;
  v11[5] = &v13;
  [v8 isSmartChargingCurrentlyEnabledForDevice:v6 withHandler:v11];

  if (a4) {
    *a4 = (id) v18[5];
  }
  unint64_t v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __95__PowerUISmartChargeClientAudioAccessories_isSmartChargingCurrentlyEnabledForDevice_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __95__PowerUISmartChargeClientAudioAccessories_isSmartChargingCurrentlyEnabledForDevice_withError___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)isSmartChargingCurrentlyEnabledForDevice:(id)a3 withHandler:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v8 isSmartChargingCurrentlyEnabledForDevice:v7 withHandler:v6];
}

- (BOOL)disableSmartChargingForDevice:(id)a3 withError:(id *)a4
{
  return [(PowerUISmartChargeClientAudioAccessories *)self setState:0 forDevice:a3 withError:a4];
}

- (void)disableSmartChargingForDevice:(id)a3 withHandler:(id)a4
{
  connection = self->_connection;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v9 client:self->_clientName setState:0 forDevice:v8 withHandler:v7];
}

- (BOOL)temporarilyDisableSmartChargingForDevice:(id)a3 withError:(id *)a4
{
  return [(PowerUISmartChargeClientAudioAccessories *)self setState:3 forDevice:a3 withError:a4];
}

- (void)temporarilyDisableSmartChargingForDevice:(id)a3 withHandler:(id)a4
{
  connection = self->_connection;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v9 client:self->_clientName setState:3 forDevice:v8 withHandler:v7];
}

- (BOOL)enableSmartChargingForDevice:(id)a3 withError:(id *)a4
{
  return [(PowerUISmartChargeClientAudioAccessories *)self setState:1 forDevice:a3 withError:a4];
}

- (void)enableSmartChargingForDevice:(id)a3 withHandler:(id)a4
{
  connection = self->_connection;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v9 client:self->_clientName setState:1 forDevice:v8 withHandler:v7];
}

- (BOOL)temporarilyEnableChargingForDevice:(id)a3 withError:(id *)a4
{
  return [(PowerUISmartChargeClientAudioAccessories *)self setState:2 forDevice:a3 withError:a4];
}

- (void)temporarilyEnableChargingForDevice:(id)a3 withHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    clientName = self->_clientName;
    int v11 = 138412290;
    v12 = clientName;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Client '%@'requests temporarilyEnableChargingWithHandler.", (uint8_t *)&v11, 0xCu);
  }
  char v10 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v10 client:self->_clientName setState:2 forDevice:v6 withHandler:v7];
}

- (id)fullChargeDeadlineForDevice:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  connection = self->_connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__PowerUISmartChargeClientAudioAccessories_fullChargeDeadlineForDevice_withError___block_invoke;
  v12[3] = &unk_2645A5EE8;
  v12[4] = &v13;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__PowerUISmartChargeClientAudioAccessories_fullChargeDeadlineForDevice_withError___block_invoke_2;
  v11[3] = &unk_2645A63A0;
  v11[4] = &v19;
  v11[5] = &v13;
  [v8 fullChargeDeadlineForDevice:v6 withHandler:v11];

  if (a4) {
    *a4 = (id) v14[5];
  }
  id v9 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __82__PowerUISmartChargeClientAudioAccessories_fullChargeDeadlineForDevice_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __82__PowerUISmartChargeClientAudioAccessories_fullChargeDeadlineForDevice_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)fullChargeDeadlineForDevice:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__PowerUISmartChargeClientAudioAccessories_fullChargeDeadlineForDevice_withHandler___block_invoke;
  v11[3] = &unk_2645A63C8;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  char v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  [v10 fullChargeDeadlineForDevice:v9 withHandler:v8];
}

uint64_t __84__PowerUISmartChargeClientAudioAccessories_fullChargeDeadlineForDevice_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)unfilteredDeadlineForDevice:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  connection = self->_connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__PowerUISmartChargeClientAudioAccessories_unfilteredDeadlineForDevice_withError___block_invoke;
  v12[3] = &unk_2645A5EE8;
  v12[4] = &v13;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__PowerUISmartChargeClientAudioAccessories_unfilteredDeadlineForDevice_withError___block_invoke_2;
  v11[3] = &unk_2645A63A0;
  void v11[4] = &v19;
  v11[5] = &v13;
  [v8 unfilteredDeadlineForDevice:v6 withHandler:v11];

  if (a4) {
    *a4 = (id) v14[5];
  }
  id v9 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __82__PowerUISmartChargeClientAudioAccessories_unfilteredDeadlineForDevice_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __82__PowerUISmartChargeClientAudioAccessories_unfilteredDeadlineForDevice_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)unfilteredDeadlineForDevice:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__PowerUISmartChargeClientAudioAccessories_unfilteredDeadlineForDevice_withHandler___block_invoke;
  v11[3] = &unk_2645A63C8;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  char v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  [v10 unfilteredDeadlineForDevice:v9 withHandler:v8];
}

uint64_t __84__PowerUISmartChargeClientAudioAccessories_unfilteredDeadlineForDevice_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)updateOBCDeadline:(id)a3 forDevice:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  id v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  connection = self->_connection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__PowerUISmartChargeClientAudioAccessories_updateOBCDeadline_forDevice_withError___block_invoke;
  v16[3] = &unk_2645A6490;
  v16[4] = &v21;
  v16[5] = &v17;
  id v11 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v16];
  clientName = self->_clientName;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __82__PowerUISmartChargeClientAudioAccessories_updateOBCDeadline_forDevice_withError___block_invoke_2;
  v15[3] = &unk_2645A64B8;
  v15[4] = &v21;
  v15[5] = &v17;
  [v11 client:clientName updateOBCDeadline:v8 forDevice:v9 withHandler:v15];

  if (a5) {
    *a5 = (id) v22[5];
  }
  char v13 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v13;
}

void __82__PowerUISmartChargeClientAudioAccessories_updateOBCDeadline_forDevice_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __82__PowerUISmartChargeClientAudioAccessories_updateOBCDeadline_forDevice_withError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)updateOBCDeadline:(id)a3 forDevice:(id)a4 withHandler:(id)a5
{
  connection = self->_connection;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v11 updateOBCDeadline:v10 forDevice:v9 withHandler:v8];
}

- (void)engageUntil:(id)a3 forDevice:(id)a4 overrideAllSignals:(BOOL)a5
{
  BOOL v5 = a5;
  connection = self->_connection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __85__PowerUISmartChargeClientAudioAccessories_engageUntil_forDevice_overrideAllSignals___block_invoke;
  v13[3] = &unk_2645A6328;
  v13[4] = self;
  v13[5] = a2;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__PowerUISmartChargeClientAudioAccessories_engageUntil_forDevice_overrideAllSignals___block_invoke_104;
  v12[3] = &unk_2645A6788;
  v12[4] = self;
  [v11 engageUntil:v10 forDevice:v9 overrideAllSignals:v5 withHandler:v12];
}

void __85__PowerUISmartChargeClientAudioAccessories_engageUntil_forDevice_overrideAllSignals___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = *(const char **)(a1 + 40);
    id v6 = v4;
    uint64_t v7 = NSStringFromSelector(v5);
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "%@ Error: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __85__PowerUISmartChargeClientAudioAccessories_engageUntil_forDevice_overrideAllSignals___block_invoke_104(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Unable to send custom timestamp", v7, 2u);
    }
  }
}

- (id)getAvailableDevices
{
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__5;
  char v13 = __Block_byref_object_dispose__5;
  id v14 = (id)MEMORY[0x263EFFA68];
  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__PowerUISmartChargeClientAudioAccessories_getAvailableDevices__block_invoke;
  v8[3] = &unk_2645A6328;
  v8[4] = self;
  v8[5] = a2;
  id v4 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__PowerUISmartChargeClientAudioAccessories_getAvailableDevices__block_invoke_105;
  v7[3] = &unk_2645A67B0;
  v7[4] = self;
  v7[5] = &v9;
  [v4 getAvailableDevicesWithHandler:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __63__PowerUISmartChargeClientAudioAccessories_getAvailableDevices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    uint64_t v7 = [v5 clientName];
    int v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412802;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);
  }
}

void __63__PowerUISmartChargeClientAudioAccessories_getAvailableDevices__block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSNumber;
    id v6 = v4;
    uint64_t v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    int v10 = 138412290;
    __int16 v11 = v7;
    _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "%@ devices about to be returned from client", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

- (id)getStatusForDevice:(id)a3
{
  id v5 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__5;
  uint64_t v16 = __Block_byref_object_dispose__5;
  id v17 = (id)MEMORY[0x263EFFA78];
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__PowerUISmartChargeClientAudioAccessories_getStatusForDevice___block_invoke;
  v11[3] = &unk_2645A6328;
  void v11[4] = self;
  v11[5] = a2;
  uint64_t v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__PowerUISmartChargeClientAudioAccessories_getStatusForDevice___block_invoke_107;
  v10[3] = &unk_2645A6350;
  v10[4] = &v12;
  [v7 getStatusForDevice:v5 withHandler:v10];

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __63__PowerUISmartChargeClientAudioAccessories_getStatusForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    uint64_t v7 = [v5 clientName];
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412802;
    int v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);
  }
}

void __63__PowerUISmartChargeClientAudioAccessories_getStatusForDevice___block_invoke_107(uint64_t a1, void *a2)
{
}

- (unint64_t)lastActionForDevice:(id)a3
{
  id v5 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__PowerUISmartChargeClientAudioAccessories_lastActionForDevice___block_invoke;
  v11[3] = &unk_2645A6328;
  void v11[4] = self;
  v11[5] = a2;
  uint64_t v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__PowerUISmartChargeClientAudioAccessories_lastActionForDevice___block_invoke_109;
  v10[3] = &unk_2645A67D8;
  v10[4] = &v12;
  [v7 lastActionForDevice:v5 withHandler:v10];

  unint64_t v8 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __64__PowerUISmartChargeClientAudioAccessories_lastActionForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    uint64_t v7 = [v5 clientName];
    unint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412802;
    int v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);
  }
}

uint64_t __64__PowerUISmartChargeClientAudioAccessories_lastActionForDevice___block_invoke_109(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)clearLastActionForDevice:(id)a3
{
  connection = self->_connection;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  unint64_t v8 = __69__PowerUISmartChargeClientAudioAccessories_clearLastActionForDevice___block_invoke;
  int v9 = &unk_2645A6328;
  int v10 = self;
  SEL v11 = a2;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&v6];
  objc_msgSend(v5, "clearLastActionForDevice:", v4, v6, v7, v8, v9, v10, v11);
}

void __69__PowerUISmartChargeClientAudioAccessories_clearLastActionForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 clientName];
    unint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412802;
    int v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)startMockingBluetoothForFakeDevice:(id)a3
{
  connection = self->_connection;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  unint64_t v8 = __79__PowerUISmartChargeClientAudioAccessories_startMockingBluetoothForFakeDevice___block_invoke;
  int v9 = &unk_2645A6328;
  int v10 = self;
  SEL v11 = a2;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&v6];
  objc_msgSend(v5, "startMockingBluetoothForFakeDevice:", v4, v6, v7, v8, v9, v10, v11);
}

void __79__PowerUISmartChargeClientAudioAccessories_startMockingBluetoothForFakeDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 clientName];
    unint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412802;
    int v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)stopMockingBluetooth
{
  connection = self->_connection;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__PowerUISmartChargeClientAudioAccessories_stopMockingBluetooth__block_invoke;
  v4[3] = &unk_2645A6328;
  v4[4] = self;
  v4[5] = a2;
  id v3 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v4];
  [v3 stopMockingBluetooth];
}

void __64__PowerUISmartChargeClientAudioAccessories_stopMockingBluetooth__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 clientName];
    unint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412802;
    int v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)deleteRecordsForDevice:(id)a3
{
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObject:a3];
  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__PowerUISmartChargeClientAudioAccessories_deleteRecordsForDevice___block_invoke;
  v8[3] = &unk_2645A6328;
  v8[4] = self;
  v8[5] = a2;
  uint64_t v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 deleteRecordsForDevices:v5];
}

void __67__PowerUISmartChargeClientAudioAccessories_deleteRecordsForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 clientName];
    unint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412802;
    int v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)fakeConnectionForDevice:(id)a3
{
  connection = self->_connection;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  unint64_t v8 = __68__PowerUISmartChargeClientAudioAccessories_fakeConnectionForDevice___block_invoke;
  int v9 = &unk_2645A6328;
  int v10 = self;
  SEL v11 = a2;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&v6];
  objc_msgSend(v5, "fakeConnectionForDevice:", v4, v6, v7, v8, v9, v10, v11);
}

void __68__PowerUISmartChargeClientAudioAccessories_fakeConnectionForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 clientName];
    unint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412802;
    int v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)setFakeConnectionStatusTo:(BOOL)a3
{
  BOOL v3 = a3;
  connection = self->_connection;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__PowerUISmartChargeClientAudioAccessories_setFakeConnectionStatusTo___block_invoke;
  v6[3] = &unk_2645A6328;
  v6[4] = self;
  v6[5] = a2;
  id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v6];
  [v5 setFakeConnectionStatusTo:v3];
}

void __70__PowerUISmartChargeClientAudioAccessories_setFakeConnectionStatusTo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 clientName];
    unint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412802;
    int v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)lastUsedLeewayWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__5;
  id v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__5;
  uint64_t v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke;
  v11[3] = &unk_2645A6328;
  void v11[4] = self;
  v11[5] = a2;
  uint64_t v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke_111;
  v10[3] = &unk_2645A65F8;
  v10[4] = self;
  void v10[5] = &v18;
  v10[6] = &v12;
  v10[7] = a2;
  [v7 currentLeewayWithHandler:v10];

  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke_cold_1(a1, v4);
  }
}

void __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke_111(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v8 = *(NSObject **)(a1[4] + 24);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke_111_cold_1((uint64_t)a1, v8);
    }
  }
}

- (void)timeSeriesForDevice:(id)a3
{
  connection = self->_connection;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __64__PowerUISmartChargeClientAudioAccessories_timeSeriesForDevice___block_invoke;
  int v9 = &unk_2645A6328;
  int v10 = self;
  SEL v11 = a2;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&v6];
  objc_msgSend(v5, "timeSeriesForDevice:", v4, v6, v7, v8, v9, v10, v11);
}

void __64__PowerUISmartChargeClientAudioAccessories_timeSeriesForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 clientName];
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412802;
    int v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);
  }
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

void __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  v2 = *(const char **)(a1 + 40);
  id v3 = a2;
  id v4 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_2(&dword_22135E000, v5, v6, "%@ Error: %@", v7, v8, v9, v10, v11);
}

void __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke_111_cold_1(uint64_t a1, void *a2)
{
  v2 = *(const char **)(a1 + 56);
  id v3 = a2;
  id v4 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_2(&dword_22135E000, v5, v6, "%@ Error: %@", v7, v8, v9, v10, v11);
}

@end