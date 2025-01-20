@interface W5WiFiPerfLoggingManager
- (BOOL)__wlCLIWithArguments:(id)a3 outputFilePath:(id)a4 outputData:(id)a5;
- (W5WiFiPerfLoggingManager)init;
- (W5WiFiPerfLoggingManager)initWithStatusManager:(id)a3;
- (id)__pendingRequestWithUUID:(id)a3;
- (void)__cancelActiveRequestAndReply:(id)a3;
- (void)__collectNetworkCountersPOST;
- (void)__collectNetworkCountersPRE;
- (void)__collectWiFiCountersPOST;
- (void)__collectWiFiCountersPRE;
- (void)__collectWiFiDeviceConfig;
- (void)__collectWiFiMemoryStatsWithFilename:(id)a3;
- (void)__dumpCoreCaptureLogsWithReason:(id)a3;
- (void)__nextRequest;
- (void)__runToolWithOutputFileHandle:(id)a3 launchPath:(id)a4 arguments:(id)a5;
- (void)__runToolWithOutputFileHandle:(id)a3 readFromStandardError:(BOOL)a4 launchPath:(id)a5 arguments:(id)a6 addCommand:(BOOL)a7 addTimestamps:(BOOL)a8;
- (void)__setupWatchdogTask;
- (void)__startAWDLPerfLogging;
- (void)__startAWDLQueryTimer;
- (void)__startCoreCaptureTriggerTimerWithInterval:(unint64_t)a3;
- (void)__startNANPerfLogging;
- (void)__startNANQueryTimer;
- (void)__startP2PPerfLogging;
- (void)__startPerfLogging;
- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4;
- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4 addCommand:(BOOL)a5 addTimestamps:(BOOL)a6;
- (void)addRequest:(id)a3;
- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)teardownAndNotify:(id)a3;
@end

@implementation W5WiFiPerfLoggingManager

- (W5WiFiPerfLoggingManager)initWithStatusManager:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)W5WiFiPerfLoggingManager;
  v4 = [(W5WiFiPerfLoggingManager *)&v11 init];
  v5 = v4;
  if (!a3) {
    goto LABEL_9;
  }
  if (!v4) {
    goto LABEL_9;
  }
  v4->_status = (W5StatusManager *)a3;
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.wifivelocity.wifiperf", 0);
  v5->_queue = (OS_dispatch_queue *)v6;
  if (!v6) {
    goto LABEL_9;
  }
  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v5->_pendingRequests = v7;
  if (v7
    && (v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray), (v5->_runningTasks = v8) != 0)
    && (v9 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter), (v5->_dateFormatter = v9) != 0))
  {
    [(NSDateFormatter *)v9 setDateFormat:@"HH:mm:ss.SSS"];
  }
  else
  {
LABEL_9:

    return 0;
  }
  return v5;
}

- (W5WiFiPerfLoggingManager)init
{
}

- (void)dealloc
{
  awdlQueryTimer = self->_awdlQueryTimer;
  if (awdlQueryTimer)
  {
    dispatch_source_cancel(awdlQueryTimer);
    dispatch_release((dispatch_object_t)self->_awdlQueryTimer);
    self->_awdlQueryTimer = 0;
  }
  nanQueryTimer = self->_nanQueryTimer;
  if (nanQueryTimer)
  {
    dispatch_source_cancel(nanQueryTimer);
    dispatch_release((dispatch_object_t)self->_nanQueryTimer);
    self->_nanQueryTimer = 0;
  }
  coreCaptureTriggerTimer = self->_coreCaptureTriggerTimer;
  if (coreCaptureTriggerTimer)
  {
    dispatch_source_cancel(coreCaptureTriggerTimer);
    dispatch_release((dispatch_object_t)self->_coreCaptureTriggerTimer);
    self->_coreCaptureTriggerTimer = 0;
  }
  beginGroup = self->_beginGroup;
  if (beginGroup) {
    dispatch_release(beginGroup);
  }
  endGroup = self->_endGroup;
  if (endGroup) {
    dispatch_release(endGroup);
  }
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v9.receiver = self;
  v9.super_class = (Class)W5WiFiPerfLoggingManager;
  [(W5WiFiPerfLoggingManager *)&v9 dealloc];
}

- (void)teardownAndNotify:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F4B4;
  v4[3] = &unk_1000DDC08;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)addRequest:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F5C4;
  v4[3] = &unk_1000DDC30;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)__pendingRequestWithUUID:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  pendingRequests = self->_pendingRequests;
  id v5 = [(NSMutableArray *)pendingRequests countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(pendingRequests);
    }
    objc_super v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "uuid"), "isEqual:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableArray *)pendingRequests countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F798;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)__dumpCoreCaptureLogsWithReason:(id)a3
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F9D8;
  block[3] = &unk_1000DDC80;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

- (void)__startCoreCaptureTriggerTimerWithInterval:(unint64_t)a3
{
  id v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  self->_coreCaptureTriggerTimer = v5;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001FD6C;
  handler[3] = &unk_1000DDC80;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
  coreCaptureTriggerTimer = self->_coreCaptureTriggerTimer;
  a3 *= 1000000000;
  dispatch_time_t v7 = dispatch_time(0, a3);
  dispatch_source_set_timer(coreCaptureTriggerTimer, v7, a3, 0);
  dispatch_resume((dispatch_object_t)self->_coreCaptureTriggerTimer);
}

- (void)__startPerfLogging
{
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v3 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), @"tcpdump.pcap");
  v43[0] = @"-n";
  v43[1] = @"-p";
  v43[2] = @"-i";
  v43[3] = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  v43[4] = @"-s";
  v43[5] = @"300";
  v43[6] = @"-w";
  v43[7] = v3;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100020A08;
  v35[3] = &unk_1000DDCA8;
  v35[4] = self;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100020ADC;
  v34[3] = &unk_1000DDCD0;
  v34[4] = self;
  +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", @"/usr/sbin/tcpdump", +[NSArray arrayWithObjects:v43 count:8], v35, v34);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v4 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), @"netstat_inout.txt");
  v42[0] = @"-I";
  v42[1] = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  v42[2] = @"-w";
  v42[3] = @"1";
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100020AF8;
  v33[3] = &unk_1000DDCA8;
  v33[4] = self;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100020BCC;
  v32[3] = &unk_1000DDCD0;
  v32[4] = self;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", @"/usr/sbin/netstat", +[NSArray arrayWithObjects:v42 count:4], v4, v33, v32);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v5 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), @"netstat_queue.txt")];
  v41[0] = @"-I";
  v41[1] = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  v41[2] = @"-w";
  v41[3] = @"1";
  v41[4] = @"-qq";
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100020BE8;
  v31[3] = &unk_1000DDCA8;
  v31[4] = self;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100020CBC;
  v30[3] = &unk_1000DDCD0;
  v30[4] = self;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", @"/usr/sbin/netstat", +[NSArray arrayWithObjects:v41 count:5], v5, v31, v30);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v6 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), @"netstat_tcp.txt");
  v40[0] = @"-I";
  v40[1] = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  v40[2] = @"-w";
  v40[3] = @"1";
  v40[4] = @"-s";
  v40[5] = @"-p";
  v40[6] = @"tcp";
  v28[4] = self;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100020CD8;
  v29[3] = &unk_1000DDCA8;
  v29[4] = self;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100020DAC;
  v28[3] = &unk_1000DDCD0;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", @"/usr/sbin/netstat", +[NSArray arrayWithObjects:v40 count:7], v6, v29, v28);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v7 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), @"netstat_udp.txt")]
  v39[0] = @"-I";
  v39[1] = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  v39[2] = @"-w";
  v39[3] = @"1";
  v39[4] = @"-s";
  v39[5] = @"-p";
  v39[6] = @"udp";
  uint64_t v8 = +[NSArray arrayWithObjects:v39 count:7];
  v26[4] = self;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100020DC8;
  v27[3] = &unk_1000DDCA8;
  v27[4] = self;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100020E9C;
  v26[3] = &unk_1000DDCD0;
  +[NSTask runTaskWithLaunchPath:@"/usr/sbin/netstat" arguments:v8 outputFilePath:v7 launchHandler:v27 reply:v26];
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v9 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")] stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), @"nettop.txt");
  v24[4] = self;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100020EB8;
  v25[3] = &unk_1000DDCA8;
  v25[4] = self;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100020F8C;
  v24[3] = &unk_1000DDCD0;
  +[NSTask runTaskWithLaunchPath:@"/usr/bin/nettop" arguments:&off_1000EF360 outputFilePath:v9 launchHandler:v25 reply:v24];
  id v10 = [(NSDictionary *)[(W5WiFiPerfLoggingRequest *)self->_activeRequest configuration] objectForKeyedSubscript:@"WiFiStatsSampleInterval"];
  if (v10)
  {
    v38[0] = @"-vrftsR";
    v38[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v10 integerValue]);
    long long v11 = +[NSArray arrayWithObjects:v38 count:2];
  }
  else
  {
    long long v11 = (NSArray *)&off_1000EF378;
  }
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v12 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")] stringByAppendingPathComponent:@"wifistats.txt"];
  v22[4] = self;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100020FA8;
  v23[3] = &unk_1000DDCA8;
  v23[4] = self;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002107C;
  v22[3] = &unk_1000DDCD0;
  +[NSTask runTaskWithLaunchPath:@"/usr/local/bin/wifistats" arguments:v11 outputFilePath:v12 launchHandler:v23 reply:v22];
  id v13 = [(NSDictionary *)[(W5WiFiPerfLoggingRequest *)self->_activeRequest configuration] objectForKeyedSubscript:@"PowermetricsCPUSampleInterval"];
  if (v13) {
    id v14 = [v13 integerValue];
  }
  else {
    id v14 = 0;
  }
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v15 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")] stringByAppendingPathComponent:@"powermetrics.txt"];
  v37[0] = @"-b";
  v37[1] = @"/usr/local/bin/powermetrics";
  v37[2] = @"-i";
  v37[3] = +[NSString stringWithFormat:@"%ld", v14];
  v37[4] = @"--samplers";
  v37[5] = @"cpu_power,tasks,network,interrupts";
  v37[6] = @"--show-usage-summary";
  v37[7] = @"--show-plimits";
  v37[8] = @"--show-process-qos";
  v37[9] = @"--show-process-netstats";
  v37[10] = @"--show-process-energy";
  v37[11] = @"--show-process-samp-norm";
  v37[12] = @"--show-process-gpu";
  v37[13] = @"--show-process-io";
  v37[14] = @"--show-process-wait-times";
  v37[15] = @"-u";
  v37[16] = v15;
  v20[4] = self;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100021098;
  v21[3] = &unk_1000DDCA8;
  v21[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002116C;
  v20[3] = &unk_1000DDCD0;
  +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", @"/usr/sbin/taskpolicy", +[NSArray arrayWithObjects:v37 count:17], v21, v20);
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[W5WiFiPerfLoggingRequest configuration](self->_activeRequest, "configuration"), "objectForKeyedSubscript:", @"IncludeArtrace"), "BOOLValue"))
  {
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v16 = [[objc_msgSend(@"/var/run/com.apple.wifivelocity/wifiperf", "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")) stringByAppendingPathComponent:@"wifiperf.artrace"];
    v36[0] = @"-o";
    v36[1] = v16;
    v18[4] = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100021188;
    v19[3] = &unk_1000DDCA8;
    v19[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002125C;
    v18[3] = &unk_1000DDCD0;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", @"/usr/local/bin/artrace", +[NSArray arrayWithObjects:v36 count:2], v19, v18);
  }
  id v17 = [(NSDictionary *)[(W5WiFiPerfLoggingRequest *)self->_activeRequest configuration] objectForKeyedSubscript:@"CoreCaptureTriggerInterval"];
  if (v17) {
    -[W5WiFiPerfLoggingManager __startCoreCaptureTriggerTimerWithInterval:](self, "__startCoreCaptureTriggerTimerWithInterval:", [v17 unsignedIntegerValue]);
  }
}

- (void)__startAWDLPerfLogging
{
  id v3 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status awdl] interfaceName];
  if (v3)
  {
    id v4 = v3;
    [(W5WiFiPerfLoggingManager *)self __startAWDLQueryTimer];
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v5 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", v4, @"io80211.pcap"]);
    v31[0] = v4;
    v31[1] = @"-logf='vv el+ set'";
    v31[2] = @"-quiet";
    v31[3] = +[NSString stringWithFormat:@"-outfile=%@", v5];
    v31[4] = @"-dlog";
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100021B44;
    v25[3] = &unk_1000DDCA8;
    v25[4] = self;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100021C18;
    v24[3] = &unk_1000DDCD0;
    v24[4] = self;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", @"/usr/local/bin/apple80211", +[NSArray arrayWithObjects:v31 count:5], v25, v24);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v6 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", v4, @"tcpdump.pcap"]);
    v30[0] = @"-n";
    v30[1] = @"-p";
    v30[2] = @"-i";
    v30[3] = v4;
    v30[4] = @"-s";
    void v30[5] = @"300";
    v30[6] = @"-w";
    v30[7] = v6;
    v22[4] = self;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100021C34;
    v23[3] = &unk_1000DDCA8;
    v23[4] = self;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100021D08;
    v22[3] = &unk_1000DDCD0;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", @"/usr/sbin/tcpdump", +[NSArray arrayWithObjects:v30 count:8], v23, v22);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v7 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_inout.txt");
    v29[0] = @"-I";
    v29[1] = v4;
    v29[2] = @"-w";
    v29[3] = @"1";
    v20[4] = self;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100021D24;
    v21[3] = &unk_1000DDCA8;
    v21[4] = self;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100021DF8;
    v20[3] = &unk_1000DDCD0;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", @"/usr/sbin/netstat", +[NSArray arrayWithObjects:v29 count:4], v7, v21, v20);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v8 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_queue.txt");
    v28[0] = @"-I";
    v28[1] = v4;
    v28[2] = @"-w";
    v28[3] = @"1";
    v28[4] = @"-qq";
    v18[4] = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100021E14;
    v19[3] = &unk_1000DDCA8;
    v19[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100021EE8;
    v18[3] = &unk_1000DDCD0;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", @"/usr/sbin/netstat", +[NSArray arrayWithObjects:v28 count:5], v8, v19, v18);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v9 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_tcp.txt"]);
    v27[0] = @"-I";
    v27[1] = v4;
    v27[2] = @"-w";
    v27[3] = @"1";
    v27[4] = @"-s";
    void v27[5] = @"-p";
    v27[6] = @"tcp";
    v16[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100021F04;
    v17[3] = &unk_1000DDCA8;
    v17[4] = self;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100021FD8;
    v16[3] = &unk_1000DDCD0;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", @"/usr/sbin/netstat", +[NSArray arrayWithObjects:v27 count:7], v9, v17, v16);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v10 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_udp.txt");
    v26[0] = @"-I";
    v26[1] = v4;
    v26[2] = @"-w";
    v26[3] = @"1";
    v26[4] = @"-s";
    void v26[5] = @"-p";
    v26[6] = @"udp";
    v14[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100021FF4;
    v15[3] = &unk_1000DDCA8;
    v15[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000220C8;
    v14[3] = &unk_1000DDCD0;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", @"/usr/sbin/netstat", +[NSArray arrayWithObjects:v26 count:7], v10, v15, v14);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v11 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", v4, @"nettop.txt"]);
    v12[4] = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000220E4;
    v13[3] = &unk_1000DDCA8;
    v13[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000221B8;
    v12[3] = &unk_1000DDCD0;
    +[NSTask runTaskWithLaunchPath:@"/usr/bin/nettop" arguments:&off_1000EF390 outputFilePath:v11 launchHandler:v13 reply:v12];
  }
}

- (void)__startAWDLQueryTimer
{
  id v3 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")], "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl_%@", @"apple80211.txt"];
  [+[NSFileManager defaultManager] removeItemAtPath:v3 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v3 contents:0 attributes:0];
  self->_awdlQueryFileHandle = +[NSFileHandle fileHandleForUpdatingAtPath:v3];
  id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  self->_awdlQueryTimer = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100022388;
  handler[3] = &unk_1000DDC80;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v4, handler);
  awdlQueryTimer = self->_awdlQueryTimer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000224B0;
  v8[3] = &unk_1000DDC80;
  v8[4] = self;
  dispatch_source_set_cancel_handler(awdlQueryTimer, v8);
  id v6 = self->_awdlQueryTimer;
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_awdlQueryTimer);
}

- (void)__startNANPerfLogging
{
  id v3 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status nan] interfaceName];
  if (v3)
  {
    id v4 = v3;
    [(W5WiFiPerfLoggingManager *)self __startNANQueryTimer];
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v5 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")] stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", v4, @"io80211.pcap"];
    v24[0] = v4;
    v24[1] = @"-logf='vv el+ set'";
    v24[2] = @"-quiet";
    v24[3] = +[NSString stringWithFormat:@"-outfile=%@", v5];
    v24[4] = @"-dlog";
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100022B80;
    v19[3] = &unk_1000DDCA8;
    v19[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100022C54;
    v18[3] = &unk_1000DDCD0;
    v18[4] = self;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", @"/usr/local/bin/apple80211", +[NSArray arrayWithObjects:v24 count:5], v19, v18);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v6 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", v4, @"tcpdump.pcap"]];
    v23[0] = @"-n";
    v23[1] = @"-p";
    v23[2] = @"-i";
    v23[3] = v4;
    v23[4] = @"-s";
    void v23[5] = @"300";
    v23[6] = @"-w";
    v23[7] = v6;
    v16[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100022C70;
    v17[3] = &unk_1000DDCA8;
    v17[4] = self;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100022D44;
    v16[3] = &unk_1000DDCD0;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", @"/usr/sbin/tcpdump", +[NSArray arrayWithObjects:v23 count:8], v17, v16);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v7 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_queue.txt"]];
    v22[0] = @"-I";
    v22[1] = v4;
    v22[2] = @"-w";
    v22[3] = @"1";
    v22[4] = @"-qq";
    v14[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100022D60;
    v15[3] = &unk_1000DDCA8;
    v15[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100022E34;
    v14[3] = &unk_1000DDCD0;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", @"/usr/sbin/netstat", +[NSArray arrayWithObjects:v22 count:5], v7, v15, v14);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v8 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_tcp.txt"]);
    v21[0] = @"-I";
    v21[1] = v4;
    v21[2] = @"-w";
    v21[3] = @"1";
    v21[4] = @"-s";
    void v21[5] = @"-p";
    v21[6] = @"tcp";
    v12[4] = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100022E50;
    v13[3] = &unk_1000DDCA8;
    v13[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100022F24;
    v12[3] = &unk_1000DDCD0;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", @"/usr/sbin/netstat", +[NSArray arrayWithObjects:v21 count:7], v8, v13, v12);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v9 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_udp.txt");
    v20[0] = @"-I";
    v20[1] = v4;
    v20[2] = @"-w";
    v20[3] = @"1";
    v20[4] = @"-s";
    void v20[5] = @"-p";
    v20[6] = @"udp";
    v10[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100022F40;
    v11[3] = &unk_1000DDCA8;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100023014;
    v10[3] = &unk_1000DDCD0;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", @"/usr/sbin/netstat", +[NSArray arrayWithObjects:v20 count:7], v9, v11, v10);
  }
}

- (void)__startNANQueryTimer
{
  id v3 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString") stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"nan_%@", @"apple80211.txt");
  [+[NSFileManager defaultManager] removeItemAtPath:v3 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v3 contents:0 attributes:0];
  self->_nanQueryFileHandle = +[NSFileHandle fileHandleForUpdatingAtPath:v3];
  id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  self->_nanQueryTimer = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000231E4;
  handler[3] = &unk_1000DDC80;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v4, handler);
  nanQueryTimer = self->_nanQueryTimer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000232F4;
  v8[3] = &unk_1000DDC80;
  v8[4] = self;
  dispatch_source_set_cancel_handler(nanQueryTimer, v8);
  id v6 = self->_nanQueryTimer;
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_nanQueryTimer);
}

- (void)__startP2PPerfLogging
{
  [(W5WiFiPerfLoggingManager *)self __startAWDLPerfLogging];

  [(W5WiFiPerfLoggingManager *)self __startNANPerfLogging];
}

- (void)__setupWatchdogTask
{
  id v3 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"( ");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  runningTasks = self->_runningTasks;
  id v5 = [(NSMutableArray *)runningTasks countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(runningTasks);
        }
        -[NSMutableString appendFormat:](v3, "appendFormat:", @"%d ", [*(id *)(*((void *)&v12 + 1) + 8 * i) processIdentifier]);
      }
      id v6 = [(NSMutableArray *)runningTasks countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }
  [(NSMutableString *)v3 appendString:@""]);
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"CHILDPIDS=%@; while kill -0 %d; do sleep 10; done; for PID in ${CHILDPIDS[@]}; do kill -9 $PID; done;",
         v3,
         [+[NSProcessInfo processInfo] processIdentifier]);
  v16[0] = @"-c";
  v16[1] = v9;
  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100023584;
  v11[3] = &unk_1000DDCA8;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002364C;
  v10[3] = &unk_1000DDCD0;
  +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", @"/bin/sh", +[NSArray arrayWithObjects:v16 count:2], v11, v10);
}

- (void)__nextRequest
{
  if (!self->_activeRequest && [(NSMutableArray *)self->_pendingRequests count])
  {
    self->_activeRequest = (W5WiFiPerfLoggingRequest *)[[-[NSMutableArray firstObject](self->_pendingRequests, "firstObject") copy];
    [(NSMutableArray *)self->_pendingRequests removeObjectAtIndex:0];
    beginGroup = self->_beginGroup;
    if (beginGroup) {
      dispatch_release(beginGroup);
    }
    self->_beginGroup = (OS_dispatch_group *)dispatch_group_create();
    endGroup = self->_endGroup;
    if (endGroup) {
      dispatch_release(endGroup);
    }
    self->_endGroup = (OS_dispatch_group *)dispatch_group_create();
    [+[NSFileManager defaultManager] createDirectoryAtPath:@"/var/run/com.apple.wifivelocity/wifiperf" withIntermediateDirectories:0 attributes:0 error:0];
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", @"/var/run/com.apple.wifivelocity/wifiperf/[W5WiFiPerfLoggingRequest uuid](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString"), 0, 0, 0);
    [+[NSFileManager defaultManager] createDirectoryAtPath:@"/var/run/com.apple.wifivelocity/wifiperf" withIntermediateDirectories:0 attributes:0 error:0];
    id v5 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")] stringByAppendingPathComponent:@"thermtune.csv"];
    v9[0] = @"--tGraphLogFile";
    v9[1] = v5;
    +[NSTask runTaskWithLaunchPath:arguments:error:](NSTask, "runTaskWithLaunchPath:arguments:error:", @"/usr/local/bin/thermtune", +[NSArray arrayWithObjects:v9 count:2], 0);
    [(W5WiFiPerfLoggingManager *)self __collectWiFiCountersPRE];
    [(W5WiFiPerfLoggingManager *)self __collectNetworkCountersPRE];
    [(W5WiFiPerfLoggingManager *)self __collectWiFiMemoryStatsWithFilename:@"wifi_memory_usage_pre.txt"];
    [(W5WiFiPerfLoggingManager *)self __startPerfLogging];
    if ([-[NSDictionary objectForKeyedSubscript:](-[W5WiFiPerfLoggingRequest configuration](self->_activeRequest, "configuration"), "objectForKeyedSubscript:", @"IncludeP2P") boolValue])[-[W5WiFiPerfLoggingManager __startP2PPerfLogging](self, "__startP2PPerfLogging"); {
    queue = self->_queue;
    }
    id v6 = self->_beginGroup;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100023894;
    v8[3] = &unk_1000DDC80;
    v8[4] = self;
    dispatch_group_notify(v6, queue, v8);
  }
}

- (void)__runToolWithOutputFileHandle:(id)a3 launchPath:(id)a4 arguments:(id)a5
{
}

- (void)__runToolWithOutputFileHandle:(id)a3 readFromStandardError:(BOOL)a4 launchPath:(id)a5 arguments:(id)a6 addCommand:(BOOL)a7 addTimestamps:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v12 = a4;
  if (a7)
  {
    id v15 = +[NSMutableString string];
    [v15 appendString:@"--------------------------------------------------------------------\n"];
    [v15 appendFormat:@"%@ %@\n", [a5 lastPathComponent], [a6 componentsJoinedByString:@" "];
    [v15 appendString:@"--------------------------------------------------------------------\n"];
    [a3 writeData:[v15 dataUsingEncoding:4]];
  }
  id v16 = [a3 offsetInFile];
  id v17 = +[NSDate date];
  if (v8)
  {
    v18 = v17;
    id v19 = +[NSMutableString string];
    [v19 appendFormat:@"BEGIN: %@, END: 00:00:00.000\n", -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18)];
    [v19 appendString:@"--------------------------------------------------------------------\n"];
    [a3 writeData:[v19 dataUsingEncoding:4]];
    if (v12) {
      id v20 = 0;
    }
    else {
      id v20 = a3;
    }
    if (v12) {
      id v21 = a3;
    }
    else {
      id v21 = 0;
    }
    +[NSTask runTaskWithLaunchPath:a5 arguments:a6 timeout:v20 outputFileHandle:v21 errorFileHandle:0 launchHandler:0 didLaunch:10.0 error:0];
    [a3 seekToFileOffset:v16];
    id v22 = +[NSMutableString string];
    [v22 appendFormat:@"BEGIN: %@, END: %@\n", -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18), -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", +[NSDate date](NSDate, "date"))];
    [v22 appendString:@"--------------------------------------------------------------------\n"];
    [a3 writeData:[v22 dataUsingEncoding:4]];
    [a3 seekToEndOfFile];
LABEL_18:
    [a3 writeData:[@"\n" dataUsingEncoding:4]];
    return;
  }
  if (v12) {
    id v23 = 0;
  }
  else {
    id v23 = a3;
  }
  if (v12) {
    id v24 = a3;
  }
  else {
    id v24 = 0;
  }
  +[NSTask runTaskWithLaunchPath:a5 arguments:a6 timeout:v23 outputFileHandle:v24 errorFileHandle:0 launchHandler:0 didLaunch:10.0 error:0];
  if (v9) {
    goto LABEL_18;
  }
}

- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4
{
}

- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4 addCommand:(BOOL)a5 addTimestamps:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:a4 readFromStandardError:0 launchPath:@"/usr/local/bin/wl" arguments:a3 addCommand:v7 addTimestamps:v6];
  }
  else if (v7)
  {
    id v11 = +[NSMutableString string];
    [v11 appendString:@"--------------------------------------------------------------------\n"];
    [v11 appendFormat:@"%@ %@ -- NOT ASSOCIATED, NOOP\n", @"/usr/local/bin/wl", [a3 componentsJoinedByString:@" "];
    [v11 appendString:@"--------------------------------------------------------------------\n\n"];
    [a4 writeData:[v11 dataUsingEncoding:4]];
  }
}

- (BOOL)__wlCLIWithArguments:(id)a3 outputFilePath:(id)a4 outputData:(id)a5
{
  if (![(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID]) {
    return 0;
  }
  if (a4)
  {
    return +[NSTask runTaskWithLaunchPath:@"/usr/local/bin/wl" arguments:a3 outputFilePath:a4 error:0];
  }
  if (!a5) {
    return 0;
  }

  return +[NSTask runTaskWithLaunchPath:@"/usr/local/bin/wl" arguments:a3 outputData:a5 error:0];
}

- (void)__collectWiFiMemoryStatsWithFilename:(id)a3
{
  id v4 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")] stringByAppendingPathComponent:a3];
  [+[NSFileManager defaultManager] removeItemAtPath:v4 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v4 contents:0 attributes:0];
  id v5 = +[NSFileHandle fileHandleForUpdatingAtPath:v4];
  if (v5)
  {
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v5 readFromStandardError:1 launchPath:@"/usr/local/bin/easyperf" arguments:&off_1000EF420 addCommand:1 addTimestamps:1];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v5 launchPath:@"/usr/bin/heap" arguments:&off_1000EF438];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v5 launchPath:@"/usr/bin/vmmap" arguments:&off_1000EF450];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v5 launchPath:@"/usr/bin/footprint" arguments:&off_1000EF468];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v5 launchPath:@"/usr/bin/zprint" arguments:0];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v5 launchPath:@"/usr/local/bin/jetsam_priority" arguments:&off_1000EF480];
  }

  [(NSFileHandle *)v5 closeFile];
}

- (void)__collectNetworkCountersPRE
{
  id v3 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")] stringByAppendingPathComponent:@"network_counters_pre.txt"];
  [+[NSFileManager defaultManager] removeItemAtPath:v3 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v3 contents:0 attributes:0];
  id v4 = +[NSFileHandle fileHandleForUpdatingAtPath:v3];
  if (v4)
  {
    +[NSTask runTaskWithLaunchPath:@"/usr/local/bin/netusage" arguments:&off_1000EF498 error:0];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/local/bin/netusage" arguments:&off_1000EF4B0];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/sbin/netstat" arguments:&off_1000EF4C8];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/sbin/netstat" arguments:&off_1000EF4E0];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/sbin/netstat" arguments:&off_1000EF4F8];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/sbin/netstat" arguments:&off_1000EF510];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/sbin/netstat" arguments:&off_1000EF528];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/bin/nettop" arguments:&off_1000EF540];
  }

  [(NSFileHandle *)v4 closeFile];
}

- (void)__collectNetworkCountersPOST
{
  id v3 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")] stringByAppendingPathComponent:@"network_counters_post.txt"];
  [+[NSFileManager defaultManager] removeItemAtPath:v3 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v3 contents:0 attributes:0];
  id v4 = +[NSFileHandle fileHandleForUpdatingAtPath:v3];
  if (v4)
  {
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/local/bin/netusage" arguments:&off_1000EF558];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/sbin/netstat" arguments:&off_1000EF570];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/sbin/netstat" arguments:&off_1000EF588];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/sbin/netstat" arguments:&off_1000EF5A0];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/sbin/netstat" arguments:&off_1000EF5B8];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/sbin/netstat" arguments:&off_1000EF5D0];
    [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v4 launchPath:@"/usr/bin/nettop" arguments:&off_1000EF5E8];
  }

  [(NSFileHandle *)v4 closeFile];
}

- (void)__collectWiFiCountersPRE
{
  id v3 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  if (v3)
  {
    id v4 = v3;
    id v5 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status awdl] interfaceName];
    BOOL v6 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status nan] interfaceName];
    id v7 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")] stringByAppendingPathComponent:@"wifi_counters_pre.txt"];
    [+[NSFileManager defaultManager] removeItemAtPath:v7 error:0];
    [+[NSFileManager defaultManager] createFileAtPath:v7 contents:0 attributes:0];
    BOOL v8 = +[NSFileHandle fileHandleForUpdatingAtPath:v7];
    if (v8)
    {
      BOOL v9 = +[NSMutableData dataWithCapacity:0];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF600 outputFilePath:0 outputData:v9];
      id v10 = [[objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v9, 4) componentsSeparatedByString:@" "];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF618 outputFilePath:0 outputData:0];
      if ([v10 containsObject:@"bcntrim"]) {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF630 outputFilePath:0 outputData:0];
      }
      if ([v10 containsObject:@"ops"]) {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF648 outputFilePath:0 outputData:0];
      }
      if ([v10 containsObject:@"rsdb"])
      {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF660 outputFilePath:0 outputData:0];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF678 outputFilePath:0 outputData:0];
        if ([v10 containsObject:@"tdmtx"]) {
          [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF690 outputFilePath:0 outputData:0];
        }
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF6A8 outputFileHandle:v8];
        id v11 = &off_1000EF6C0;
      }
      else
      {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF6D8 outputFilePath:0 outputData:0];
        id v11 = &off_1000EF6F0;
      }
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:v11 outputFileHandle:v8];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF708 outputFileHandle:v8];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF720 outputFileHandle:v8];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF738 outputFileHandle:v8];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF750 outputFileHandle:v8];
      v19[0] = v4;
      v19[1] = @"-leaky_ap_stats=0";
      +[NSTask runTaskWithLaunchPath:arguments:error:](NSTask, "runTaskWithLaunchPath:arguments:error:", @"/usr/local/bin/apple80211", +[NSArray arrayWithObjects:v19 count:2], 0);
      v18[0] = v4;
      v18[1] = @"-dbg=getmimops";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v18 count:2]];
      v17[0] = v4;
      v17[1] = @"-dbg=print_packets";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v17 count:2]];
      v16[0] = v4;
      v16[1] = @"-dbg=print_peers";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v16 count:2]];
      v15[0] = v4;
      v15[1] = @"-dbg=m";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v15 count:2]];
      v14[0] = v4;
      v14[1] = @"-dbg=proptx";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v14 count:2]];
      if (v5)
      {
        v13[0] = v5;
        v13[1] = @"-dbg=print_peers";
        [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v13 count:2]];
      }
      if (v6)
      {
        v12[0] = v6;
        v12[1] = @"-dbg=print_peers";
        [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v12 count:2]];
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  [(NSFileHandle *)v8 closeFile];
}

- (void)__collectWiFiCountersPOST
{
  id v3 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  if (!v3)
  {
    BOOL v8 = 0;
    goto LABEL_16;
  }
  id v4 = v3;
  id v5 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status awdl] interfaceName];
  BOOL v6 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status nan] interfaceName];
  id v7 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")] stringByAppendingPathComponent:@"wifi_counters_post.txt"];
  [+[NSFileManager defaultManager] removeItemAtPath:v7 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v7 contents:0 attributes:0];
  BOOL v8 = +[NSFileHandle fileHandleForUpdatingAtPath:v7];
  if (v8)
  {
    BOOL v9 = +[NSMutableData dataWithCapacity:0];
    [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF768 outputFilePath:0 outputData:v9];
    id v10 = [[objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v9, 4) componentsSeparatedByString:@" "];
    [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF780 outputFileHandle:v8];
    if ([v10 containsObject:@"rsdb"])
    {
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF798 outputFileHandle:v8];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF7B0 outputFileHandle:v8];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF7C8 outputFileHandle:v8];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF7E0 outputFileHandle:v8];
      if (([v10 containsObject:@"tdmtx"] & 1) == 0)
      {
LABEL_8:
        if ([v10 containsObject:@"bcntrim"]) {
          [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF840 outputFileHandle:v8];
        }
        if ([v10 containsObject:@"ops"]) {
          [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF858 outputFileHandle:v8];
        }
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF870 outputFileHandle:v8];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF888 outputFileHandle:v8];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF8A0 outputFileHandle:v8];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF8B8 outputFileHandle:v8];
        v19[0] = v4;
        v19[1] = @"-leaky_ap_stats";
        [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v19 count:2]];
        v18[0] = v4;
        v18[1] = @"-dbg=getmimops";
        [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v18 count:2]];
        v17[0] = v4;
        v17[1] = @"-dbg=print_packets";
        [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v17 count:2]];
        v16[0] = v4;
        v16[1] = @"-dbg=print_peers";
        [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v16 count:2]];
        v15[0] = v4;
        v15[1] = @"-dbg=m";
        [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v15 count:2]];
        v14[0] = v4;
        v14[1] = @"-dbg=proptx";
        [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v14 count:2]];
        if (v5)
        {
          v13[0] = v5;
          v13[1] = @"-dbg=print_peers";
          [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v13 count:2]];
        }
        if (v6)
        {
          v12[0] = v6;
          v12[1] = @"-dbg=print_peers";
          [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v12 count:2]];
        }
        goto LABEL_16;
      }
      id v11 = &off_1000EF7F8;
    }
    else
    {
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF810 outputFileHandle:v8];
      id v11 = &off_1000EF828;
    }
    [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:v11 outputFileHandle:v8];
    goto LABEL_8;
  }
LABEL_16:
  [(NSFileHandle *)v8 closeFile];
}

- (void)__collectWiFiDeviceConfig
{
  id v3 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  if (v3)
  {
    id v4 = v3;
    id v5 = [[@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")] stringByAppendingPathComponent:@"wifi_device_config.txt"];
    [+[NSFileManager defaultManager] removeItemAtPath:v5 error:0];
    [+[NSFileManager defaultManager] createFileAtPath:v5 contents:0 attributes:0];
    BOOL v6 = +[NSFileHandle fileHandleForUpdatingAtPath:v5];
    if (v6)
    {
      id v7 = +[NSMutableData dataWithCapacity:0];
      v29[0] = v4;
      v29[1] = @"-cardcap";
      +[NSTask runTaskWithLaunchPath:arguments:outputData:error:](NSTask, "runTaskWithLaunchPath:arguments:outputData:error:", @"/usr/local/bin/apple80211", +[NSArray arrayWithObjects:v29 count:2], v7, 0);
      id v8 = [[[objc_alloc((Class)NSString) initWithData:v7 encoding:4] componentsSeparatedByString:@"\n"];
      [(NSMutableData *)v7 setLength:0];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF8D0 outputFilePath:0 outputData:v7];
      id v9 = [[[objc_alloc((Class)NSString) initWithData:v7 encoding:4] componentsSeparatedByString:@" "];
      v28[0] = v4;
      v28[1] = @"-driver_ver";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v28 count:2]];
      v27[0] = v4;
      v27[1] = @"-hardware_ver";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v27 count:2]];
      v26[0] = v4;
      v26[1] = @"-ssid";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v26 count:2]];
      v25[0] = v4;
      v25[1] = @"-bssid";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v25 count:2]];
      v24[0] = v4;
      v24[1] = @"-rssi";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v24 count:2]];
      v23[0] = v4;
      v23[1] = @"-noise";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v23 count:2]];
      v22[0] = v4;
      v22[1] = @"-channel";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v22 count:2]];
      v21[0] = v4;
      v21[1] = @"-authtype";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v21 count:2]];
      v20[0] = v4;
      v20[1] = @"-country_code";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v20 count:2]];
      v19[0] = v4;
      v19[1] = @"-rateset";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v19 count:2]];
      v18[0] = v4;
      v18[1] = @"-leaky_ap_stats_mode";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v18 count:2]];
      v17[0] = v4;
      v17[1] = @"-cardcap";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v17 count:2]];
      v16[0] = v4;
      v16[1] = @"-dbg=mimopsstatus";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v16 count:2]];
      if ([v8 containsObject:@"roam"])
      {
        v15[0] = v4;
        v15[1] = @"-dbg=print-roam";
        [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v15 count:2]];
      }
      if ([v8 containsObject:@"ocl"])
      {
        v14[0] = v4;
        v14[1] = @"-dbg=ocl_status";
        [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v14 count:2]];
        v13[0] = v4;
        v13[1] = @"-dbg=ocl_rssi_threshold";
        [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v13 count:2]];
      }
      if ([v8 containsObject:@"awdl"]) {
        [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:&off_1000EF8E8];
      }
      if ([v8 containsObject:@"timesync"]) {
        [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:&off_1000EF900];
      }
      v12[0] = v4;
      v12[1] = @"-dbg=bgscan-private-mac";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v12 count:2]];
      v11[0] = v4;
      v11[1] = @"-dbg=dtim";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v11 count:2]];
      v10[0] = v4;
      v10[1] = @"-dbg=private-mac";
      [(W5WiFiPerfLoggingManager *)self __runToolWithOutputFileHandle:v6 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v10 count:2]];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF918 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF930 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF948 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF960 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF978 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF990 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF9A8 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF9C0 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF9D8 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EF9F0 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFA08 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFA20 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFA38 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFA50 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFA68 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFA80 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFA98 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFAB0 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFAC8 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFAE0 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFAF8 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFB10 outputFileHandle:v6];
      if ([v9 containsObject:@"ampdu"]) {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFB28 outputFileHandle:v6];
      }
      if ([v9 containsObject:@"amsdu"]) {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFB40 outputFileHandle:v6];
      }
      if ([v9 containsObject:@"ocl"])
      {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFB58 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFB70 outputFileHandle:v6];
      }
      if ([v9 containsObject:@"txcap"]) {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFB88 outputFileHandle:v6];
      }
      if ([v9 containsObject:@"mim_ps"])
      {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFBA0 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFBB8 outputFileHandle:v6];
      }
      if ([v9 containsObject:@"ops"])
      {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFBD0 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFBE8 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFC00 outputFileHandle:v6];
      }
      if ([v9 containsObject:@"nap"])
      {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFC18 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFC30 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFC48 outputFileHandle:v6];
      }
      if ([v9 containsObject:@"bcntrim"])
      {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFC60 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFC78 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFC90 outputFileHandle:v6];
      }
      if ([v9 containsObject:@"rsdb"])
      {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFCA8 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFCC0 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFCD8 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFCF0 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFD08 outputFileHandle:v6];
        if ([v9 containsObject:@"tdmtx"])
        {
          [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFD20 outputFileHandle:v6];
          [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFD38 outputFileHandle:v6];
        }
      }
      if ([v9 containsObject:@"tvpm"])
      {
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFD50 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFD68 outputFileHandle:v6];
        [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFD80 outputFileHandle:v6];
      }
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFD98 outputFileHandle:v6];
      [(W5WiFiPerfLoggingManager *)self __wlCLIWithArguments:&off_1000EFDB0 outputFileHandle:v6];
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  [(NSFileHandle *)v6 closeFile];
}

- (void)__cancelActiveRequestAndReply:(id)a3
{
  if (self->_activeRequest)
  {
    coreCaptureTriggerTimer = self->_coreCaptureTriggerTimer;
    if (coreCaptureTriggerTimer)
    {
      dispatch_source_cancel(coreCaptureTriggerTimer);
      dispatch_release((dispatch_object_t)self->_coreCaptureTriggerTimer);
      self->_coreCaptureTriggerTimer = 0;
    }
    awdlQueryTimer = self->_awdlQueryTimer;
    if (awdlQueryTimer)
    {
      dispatch_source_cancel(awdlQueryTimer);
      dispatch_release((dispatch_object_t)self->_awdlQueryTimer);
      self->_awdlQueryTimer = 0;
    }
    nanQueryTimer = self->_nanQueryTimer;
    if (nanQueryTimer)
    {
      dispatch_source_cancel(nanQueryTimer);
      dispatch_release((dispatch_object_t)self->_nanQueryTimer);
      self->_nanQueryTimer = 0;
    }
    +[NSTask runTaskWithLaunchPath:@"/usr/local/bin/thermtune" arguments:&off_1000EFDC8 error:0];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    runningTasks = self->_runningTasks;
    id v9 = [(NSMutableArray *)runningTasks countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(runningTasks);
          }
          kill((pid_t)[*(id *)(*((void *)&v17 + 1) + 8 * i) processIdentifier], 9);
        }
        id v10 = [(NSMutableArray *)runningTasks countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
    [(NSMutableArray *)self->_runningTasks removeAllObjects];
    [(W5WiFiPerfLoggingManager *)self __collectWiFiCountersPOST];
    [(W5WiFiPerfLoggingManager *)self __collectNetworkCountersPOST];
    [(W5WiFiPerfLoggingManager *)self __collectWiFiMemoryStatsWithFilename:@"wifi_memory_usage_post.txt"];
    [(W5WiFiPerfLoggingManager *)self __collectWiFiDeviceConfig];
    endGroup = self->_endGroup;
    queue = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_100025B90;
    v16[3] = &unk_1000DDC08;
    v16[4] = self;
    void v16[5] = a3;
    dispatch_group_notify(endGroup, queue, v16);
  }
  else
  {
    [(W5WiFiPerfLoggingManager *)self __nextRequest];
    if (a3)
    {
      id v15 = (void (*)(id, void))*((void *)a3 + 2);
      v15(a3, 0);
    }
  }
}

@end