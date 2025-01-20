@interface WAXPCConnection
- (NSString)token;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (WAXPCConnection)initWithXPCConnection:(id)a3;
- (WAXPCConnectionDelegate)delegate;
- (void)clearMessageStoreAndReply:(id)a3;
- (void)convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 andReply:(id)a6;
- (void)establishConnectionWithToken:(id)a3 andReply:(id)a4;
- (void)getDeviceAnalyticsConfigurationAndReply:(id)a3;
- (void)getDpsStatsandReply:(id)a3;
- (void)getMessagesModelForGroupType:(int64_t)a3 andReply:(id)a4;
- (void)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 andReply:(id)a5;
- (void)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(id)a5 andReply:(id)a6;
- (void)getUsageStatsandReply:(id)a3;
- (void)issueIOReportManagementCommand:(unint64_t)a3 andReply:(id)a4;
- (void)killDaemonAndReply:(id)a3;
- (void)lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4;
- (void)lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5;
- (void)registerMessageGroup:(int64_t)a3 andReply:(id)a4;
- (void)sendMemoryPressureRequestAndReply:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceAnalyticsConfiguration:(id)a3 andReply:(id)a4;
- (void)setQueue:(id)a3;
- (void)setToken:(id)a3;
- (void)submitMessage:(id)a3 groupType:(int64_t)a4 andReply:(id)a5;
- (void)submitWiFiAnalyticsMessageAdvanced:(id)a3 andReply:(id)a4;
- (void)summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4 andReply:(id)a5;
- (void)trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4;
- (void)triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 waMessage:(id)a4 andReply:(id)a5;
- (void)triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3;
- (void)triggerQueryForNWActivity:(int64_t)a3 andReply:(id)a4;
@end

@implementation WAXPCConnection

- (WAXPCConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WAXPCConnection;
  v6 = [(WAXPCConnection *)&v12 init];
  v7 = v6;
  if (!v5) {
    goto LABEL_4;
  }
  if (!v6) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_connection, a3);
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifianalytics.xpc-connection", v8);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v9;

  if (!v7->_queue)
  {
LABEL_4:

    v7 = 0;
  }

  return v7;
}

- (void)establishConnectionWithToken:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(WAXPCConnection *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__WAXPCConnection_establishConnectionWithToken_andReply___block_invoke;
  v11[3] = &unk_264466FF0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __57__WAXPCConnection_establishConnectionWithToken_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained establishConnectionWithToken:*(void *)(a1 + 32) andReply:*(void *)(a1 + 40)];
}

- (void)registerMessageGroup:(int64_t)a3 andReply:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(WAXPCConnection *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__WAXPCConnection_registerMessageGroup_andReply___block_invoke;
  v9[3] = &unk_264467018;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __49__WAXPCConnection_registerMessageGroup_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained registerMessageGroup:*(void *)(a1 + 48) andReply:*(void *)(a1 + 32)];
}

- (void)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(id)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [(WAXPCConnection *)self queue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__WAXPCConnection_getNewMessageForKey_groupType_withCopy_andReply___block_invoke;
  v17[3] = &unk_264467040;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  v21[1] = (id)a4;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __67__WAXPCConnection_getNewMessageForKey_groupType_withCopy_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained getNewMessageForKey:*(void *)(a1 + 32) groupType:*(void *)(a1 + 64) withCopy:*(void *)(a1 + 40) andReply:*(void *)(a1 + 48)];
}

- (void)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(WAXPCConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__WAXPCConnection_getNewMessageForKey_groupType_andReply___block_invoke;
  block[3] = &unk_264467068;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __58__WAXPCConnection_getNewMessageForKey_groupType_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [WeakRetained delegate];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = [NSNumber numberWithBool:0];
  [v4 xpcConnection:WeakRetained getNewMessageForKey:v5 groupType:v6 withCopy:v7 andReply:*(void *)(a1 + 40)];
}

- (void)getMessagesModelForGroupType:(int64_t)a3 andReply:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(WAXPCConnection *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__WAXPCConnection_getMessagesModelForGroupType_andReply___block_invoke;
  v9[3] = &unk_264467018;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __57__WAXPCConnection_getMessagesModelForGroupType_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained getMessagesModelForGroupType:*(void *)(a1 + 48) andReply:*(void *)(a1 + 32)];
}

- (void)submitMessage:(id)a3 groupType:(int64_t)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(WAXPCConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__WAXPCConnection_submitMessage_groupType_andReply___block_invoke;
  block[3] = &unk_264467068;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __52__WAXPCConnection_submitMessage_groupType_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained submitMessage:*(void *)(a1 + 32) groupType:*(void *)(a1 + 56) andReply:*(void *)(a1 + 40)];
}

- (void)submitWiFiAnalyticsMessageAdvanced:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(WAXPCConnection *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __63__WAXPCConnection_submitWiFiAnalyticsMessageAdvanced_andReply___block_invoke;
  v11[3] = &unk_264466FF0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __63__WAXPCConnection_submitWiFiAnalyticsMessageAdvanced_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained submitWiFiAnalyticsMessageAdvanced:*(void *)(a1 + 32) andReply:*(void *)(a1 + 40)];
}

- (void)triggerQueryForNWActivity:(int64_t)a3 andReply:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(WAXPCConnection *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__WAXPCConnection_triggerQueryForNWActivity_andReply___block_invoke;
  v9[3] = &unk_264467018;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __54__WAXPCConnection_triggerQueryForNWActivity_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained triggerQueryForNWActivity:*(void *)(a1 + 48) andReply:*(void *)(a1 + 32)];
}

- (void)convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [(WAXPCConnection *)self queue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __85__WAXPCConnection_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply___block_invoke;
  v17[3] = &unk_264467040;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  v21[1] = (id)a4;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __85__WAXPCConnection_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained convertWiFiStatsIntoPercentile:*(void *)(a1 + 32) analysisGroup:*(void *)(a1 + 64) groupTarget:*(void *)(a1 + 40) andReply:*(void *)(a1 + 48)];
}

- (void)triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 waMessage:(id)a4 andReply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(WAXPCConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__WAXPCConnection_triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply___block_invoke;
  block[3] = &unk_264467068;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __82__WAXPCConnection_triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained triggerDatapathDiagnosticsAndCollectUpdates:*(void *)(a1 + 56) waMessage:*(void *)(a1 + 32) andReply:*(void *)(a1 + 40)];
}

- (void)killDaemonAndReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WAXPCConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__WAXPCConnection_killDaemonAndReply___block_invoke;
  block[3] = &unk_264467090;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__WAXPCConnection_killDaemonAndReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained killDaemonAndReply:*(void *)(a1 + 32)];
}

- (void)clearMessageStoreAndReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WAXPCConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__WAXPCConnection_clearMessageStoreAndReply___block_invoke;
  block[3] = &unk_264467090;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__WAXPCConnection_clearMessageStoreAndReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained clearMessageStoreAndReply:*(void *)(a1 + 32)];
}

- (void)trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(WAXPCConnection *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __77__WAXPCConnection_trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply___block_invoke;
  v11[3] = &unk_264466FF0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __77__WAXPCConnection_trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained trapCrashMiniTracerDumpReadyForInterfaceWithName:*(void *)(a1 + 32) andReply:*(void *)(a1 + 40)];
}

- (void)lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(WAXPCConnection *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __69__WAXPCConnection_lqmCrashTracerNotifyForInterfaceWithName_andReply___block_invoke;
  v11[3] = &unk_264466FF0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __69__WAXPCConnection_lqmCrashTracerNotifyForInterfaceWithName_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained lqmCrashTracerNotifyForInterfaceWithName:*(void *)(a1 + 32) andReply:*(void *)(a1 + 40)];
}

- (void)lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(WAXPCConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__WAXPCConnection_lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply___block_invoke;
  block[3] = &unk_2644670B8;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __76__WAXPCConnection_lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained lqmCrashTracerReceiveBlock:*(void *)(a1 + 32) forInterfaceWithName:*(void *)(a1 + 40) andReply:*(void *)(a1 + 48)];
}

- (void)setDeviceAnalyticsConfiguration:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(WAXPCConnection *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __60__WAXPCConnection_setDeviceAnalyticsConfiguration_andReply___block_invoke;
  v11[3] = &unk_264466FF0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __60__WAXPCConnection_setDeviceAnalyticsConfiguration_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained setDeviceAnalyticsConfiguration:*(void *)(a1 + 32) andReply:*(void *)(a1 + 40)];
}

- (void)getDeviceAnalyticsConfigurationAndReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WAXPCConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__WAXPCConnection_getDeviceAnalyticsConfigurationAndReply___block_invoke;
  block[3] = &unk_264467090;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__WAXPCConnection_getDeviceAnalyticsConfigurationAndReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained getDeviceAnalyticsConfigurationAndReply:*(void *)(a1 + 32)];
}

- (void)summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(WAXPCConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__WAXPCConnection_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply___block_invoke;
  block[3] = &unk_264467068;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __76__WAXPCConnection_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained summarizeDeviceAnalyticsForNetwork:*(void *)(a1 + 32) maxAgeInDays:*(void *)(a1 + 56) andReply:*(void *)(a1 + 40)];
}

- (void)getDpsStatsandReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WAXPCConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__WAXPCConnection_getDpsStatsandReply___block_invoke;
  block[3] = &unk_264467090;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __39__WAXPCConnection_getDpsStatsandReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained getDpsStatsandReply:*(void *)(a1 + 32)];
}

- (void)getUsageStatsandReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WAXPCConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__WAXPCConnection_getUsageStatsandReply___block_invoke;
  block[3] = &unk_264467090;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__WAXPCConnection_getUsageStatsandReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained getUsageStatsandReply:*(void *)(a1 + 32)];
}

- (void)triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WAXPCConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__WAXPCConnection_triggerDeviceAnalyticsStoreMigrationAndReply___block_invoke;
  block[3] = &unk_264467090;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__WAXPCConnection_triggerDeviceAnalyticsStoreMigrationAndReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained triggerDeviceAnalyticsStoreMigrationAndReply:*(void *)(a1 + 32)];
}

- (void)sendMemoryPressureRequestAndReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WAXPCConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__WAXPCConnection_sendMemoryPressureRequestAndReply___block_invoke;
  block[3] = &unk_264467090;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__WAXPCConnection_sendMemoryPressureRequestAndReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained sendMemoryPressureRequestAndReply:*(void *)(a1 + 32)];
}

- (void)issueIOReportManagementCommand:(unint64_t)a3 andReply:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(WAXPCConnection *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__WAXPCConnection_issueIOReportManagementCommand_andReply___block_invoke;
  v9[3] = &unk_264467018;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __59__WAXPCConnection_issueIOReportManagementCommand_andReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained delegate];
  [v4 xpcConnection:WeakRetained issueIOReportManagementCommand:*(void *)(a1 + 48) andReply:*(void *)(a1 + 32)];
}

- (WAXPCConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WAXPCConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end