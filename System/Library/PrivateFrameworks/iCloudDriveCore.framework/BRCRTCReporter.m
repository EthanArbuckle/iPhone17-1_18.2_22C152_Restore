@interface BRCRTCReporter
- (BOOL)_shouldRemoveZoneNameWithPayload:(id)a3;
- (BRCRTCReporter)init;
- (BRCRTCReporter)initWithFPRTCReportingSession:(id)a3;
- (void)_init;
- (void)_processReportingBatch;
- (void)close;
- (void)init;
- (void)postReportWithCategory:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 error:(id)a6;
@end

@implementation BRCRTCReporter

- (void)_init
{
  v24[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F62AC8];
  v23[0] = *MEMORY[0x263F62AB8];
  v23[1] = v3;
  v24[0] = @"bird";
  v24[1] = @"clouddocs";
  v4 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  userInfo = self->_userInfo;
  self->_userInfo = v4;

  v6 = objc_alloc_init(BRCDeviceConfiguration);
  v7 = [(BRCDeviceConfiguration *)v6 getConfiguration];
  v21[0] = @"isIcloudAnalyticsFlagOn";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", +[BRCAnalyticsReporter isTelemetryReportingEnabled](BRCAnalyticsReporter, "isTelemetryReportingEnabled"));
  v22[0] = v8;
  v21[1] = @"isDesktopEnabled";
  v9 = NSNumber;
  v10 = +[BRCAccountHandler currentiCloudAccount];
  v11 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "br_isEnabledForDesktopSync"));
  v22[1] = v11;
  v21[2] = @"isEDS";
  v12 = [v7 objectForKeyedSubscript:@"EDS"];
  v22[2] = v12;
  v21[3] = @"isFPFS";
  v13 = [v7 objectForKeyedSubscript:@"FPFS"];
  v22[3] = v13;
  v21[4] = @"isTestDevice";
  v14 = [v7 objectForKeyedSubscript:@"TESTING"];
  v22[4] = v14;
  v21[5] = @"isSharedIPad";
  v15 = [v7 objectForKeyedSubscript:@"SHARED_IPAD"];
  v22[5] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:6];
  globalPayload = self->_globalPayload;
  self->_globalPayload = v16;

  v18 = +[BRCUserDefaults defaultsForMangledID:0];
  v19 = [v18 telemetryRTCAllowedZoneNamePrefixes];
  allowedZoneNamePrefixes = self->_allowedZoneNamePrefixes;
  self->_allowedZoneNamePrefixes = v19;
}

- (BRCRTCReporter)initWithFPRTCReportingSession:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRCRTCReporter;
  v6 = [(BRCRTCReporter *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reportingManager, a3);
    v8 = +[BRCUserDefaults defaultsForMangledID:0];
    [v8 telemetryRTCPacerMinFireInterval];

    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.rtc.pacer.queue", v10);

    pacerQueue = v7->_pacerQueue;
    v7->_pacerQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = br_pacer_create();
    reportingPacer = v7->_reportingPacer;
    v7->_reportingPacer = (br_pacer *)v13;

    v18 = v7;
    br_pacer_set_event_handler();
    br_pacer_resume();
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    events = v18->_events;
    v18->_events = v15;

    [(BRCRTCReporter *)v18 _init];
  }

  return v7;
}

uint64_t __48__BRCRTCReporter_initWithFPRTCReportingSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processReportingBatch];
}

- (BRCRTCReporter)init
{
  uint64_t v3 = [MEMORY[0x263F3C718] defaultManager];
  if (!v3)
  {
    v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      [(BRCRTCReporter *)(uint64_t)v4 init];
    }
  }
  v6 = [(BRCRTCReporter *)self initWithFPRTCReportingSession:v3];

  return v6;
}

- (void)close
{
  pacerQueue = self->_pacerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__BRCRTCReporter_close__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_sync(pacerQueue, block);
}

uint64_t __23__BRCRTCReporter_close__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  objc_sync_enter(v2);
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  objc_sync_exit(v2);

  return br_pacer_cancel();
}

- (BOOL)_shouldRemoveZoneNameWithPayload:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"zoneName"];
  id v5 = v4;
  if (v4)
  {
    allowedZoneNamePrefixes = self->_allowedZoneNamePrefixes;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__BRCRTCReporter__shouldRemoveZoneNameWithPayload___block_invoke;
    v9[3] = &unk_265085238;
    id v10 = v4;
    char v7 = [(NSArray *)allowedZoneNamePrefixes br_none_of:v9];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

uint64_t __51__BRCRTCReporter__shouldRemoveZoneNameWithPayload___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasPrefix:a2];
}

- (void)_processReportingBatch
{
  uint64_t v3 = self->_events;
  objc_sync_enter(v3);
  id v4 = (id)[(NSMutableDictionary *)self->_events copy];
  [(NSMutableDictionary *)self->_events removeAllObjects];
  objc_sync_exit(v3);

  if ([v4 count]) {
    [(FPRTCReportingSessionManager *)self->_reportingManager postMultipleReports:v4 type:1 userinfo:self->_userInfo session:0 observer:0];
  }
}

- (void)postReportWithCategory:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 error:(id)a6
{
  id v22 = a5;
  id v9 = a6;
  if ([(BRCRTCReporter *)self _shouldRemoveZoneNameWithPayload:v22]) {
    [v22 setObject:@"private" forKeyedSubscript:@"zoneName"];
  }
  if (v22)
  {
    id v10 = v22;
  }
  else
  {
    id v10 = [MEMORY[0x263EFF9A0] dictionary];
  }
  dispatch_queue_t v11 = v10;
  [v10 addEntriesFromDictionary:self->_globalPayload];
  v12 = self->_events;
  objc_sync_enter(v12);
  events = self->_events;
  v14 = [NSNumber numberWithUnsignedInteger:a3];
  v15 = [(NSMutableDictionary *)events objectForKey:v14];

  if (!v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
    v17 = self->_events;
    v18 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v17 setObject:v16 forKeyedSubscript:v18];
  }
  objc_super v19 = self->_events;
  v20 = [NSNumber numberWithUnsignedInteger:a3];
  v21 = [(NSMutableDictionary *)v19 objectForKeyedSubscript:v20];
  [v21 addObject:v11];

  objc_sync_exit(v12);
  br_pacer_signal();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_reportingPacer, 0);
  objc_storeStrong((id *)&self->_pacerQueue, 0);
  objc_storeStrong((id *)&self->_allowedZoneNamePrefixes, 0);
  objc_storeStrong((id *)&self->_globalPayload, 0);
  objc_storeStrong((id *)&self->_reportingManager, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23FA42000, a2, (os_log_type_t)0x90u, "[ERROR] BRCRTCReporter Failed to start%@", (uint8_t *)&v2, 0xCu);
}

@end