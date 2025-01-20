@interface RDAnalyticsEventListener
+ (void)initialize;
- (int64_t)cacheDelete:(id)a3 purgeWithUrgency:(int64_t)a4 dryRun:(BOOL)a5;
- (void)dealloc;
- (void)gizmoSync:(id)a3 didDecryptArchiveWithKey:(id)a4 sensor:(id)a5;
- (void)gizmoSync:(id)a3 didDeliverAndUnarchive:(id)a4 sensor:(id)a5 keyName:(id)a6 archiveStatus:(int64_t)a7;
- (void)gizmoSync:(id)a3 didUnarchiveWithKey:(id)a4 sensor:(id)a5;
- (void)gizmoSync:(id)a3 failedToAddKey:(id)a4 toKeyChainForSensor:(id)a5;
- (void)gizmoSync:(id)a3 failedToDecryptArchiveWithKey:(id)a4 sensor:(id)a5;
- (void)gizmoSync:(id)a3 failedToEncryptArchive:(id)a4 keyName:(id)a5 sensor:(id)a6;
- (void)gizmoSync:(id)a3 failedToStoreEncryptedArchive:(id)a4 key:(id)a5 sensor:(id)a6 fileExists:(BOOL)a7;
- (void)gizmoSync:(id)a3 failedToUnarchiveWithKey:(id)a4 sensor:(id)a5;
- (void)gizmoSync:(id)a3 willRunXPCActivityNamed:(id)a4;
- (void)gizmoSyncDidSyncTime:(id)a3;
- (void)service:(id)a3 didDeliverMessageWithIDSIdentifier:(id)a4;
- (void)service:(id)a3 didFailIDSMessage:(id)a4 IDSIdentifier:(id)a5 withError:(id)a6;
- (void)service:(id)a3 didFailMessageWithIDSIdentifier:(id)a4 error:(id)a5;
- (void)service:(id)a3 didFailResource:(id)a4 IDSIdentifier:(id)a5 keyName:(id)a6 sensor:(id)a7 withError:(id)a8;
- (void)service:(id)a3 didReceiveArchive:(id)a4 sensor:(id)a5 gizmoSnapshotURL:(id)a6 metadata:(id)a7 fromID:(id)a8;
- (void)service:(id)a3 didReceiveKeyServiceMessage:(id)a4 fromID:(id)a5 key:(id)a6 keyName:(id)a7 sensor:(id)a8 archiveURLPath:(id)a9 deviceID:(id)a10;
- (void)service:(id)a3 didReceiveResourceServiceMessage:(id)a4 fromID:(id)a5 incomingResponseIdentifier:(id)a6 outgoingResponseIdentifier:(id)a7;
- (void)service:(id)a3 didRequestToSendIDSMessage:(id)a4 withIDSIdentifier:(id)a5;
- (void)service:(id)a3 didRequestToSendResource:(id)a4 withIDSIdentifier:(id)a5 keyName:(id)a6 sensor:(id)a7 isRetry:(BOOL)a8;
@end

@implementation RDAnalyticsEventListener

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EC68 = (uint64_t)os_log_create("com.apple.SensorKit", "AnalyticsGizmoSyncEventListener");
  }
}

- (void)dealloc
{
  if (self) {
    objc_setProperty_nonatomic(self, a2, 0, 24);
  }
  v3.receiver = self;
  v3.super_class = (Class)RDAnalyticsEventListener;
  [(RDAnalyticsEventListener *)&v3 dealloc];
}

- (void)service:(id)a3 didRequestToSendIDSMessage:(id)a4 withIDSIdentifier:(id)a5
{
  id v8 = [a4 objectForKeyedSubscript:@"RDGizmoSyncMessageTypeKey"];
  if (v8)
  {
    [(NSCache *)self->_messageTypesByIDSIdentifier setObject:v8 forKey:a5];
    unint64_t v9 = (unint64_t)[v8 integerValue];
    if (v9 > 0xA) {
      return;
    }
  }
  else
  {
    v10 = qword_10006EC68;
    if (os_log_type_enabled((os_log_t)qword_10006EC68, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = a4;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Failed to find message type in IDS message %{public}@", buf, 0xCu);
      unint64_t v9 = (unint64_t)[0 integerValue];
      if (v9 > 0xA) {
        return;
      }
    }
    else
    {
      unint64_t v9 = (unint64_t)[0 integerValue];
      if (v9 > 0xA) {
        return;
      }
    }
  }
  if (((1 << v9) & 0x17E) != 0 || ((1 << v9) & 0x480) != 0) {
    AnalyticsSendEventLazy();
  }
}

- (void)service:(id)a3 didFailIDSMessage:(id)a4 IDSIdentifier:(id)a5 withError:(id)a6
{
}

- (void)service:(id)a3 didRequestToSendResource:(id)a4 withIDSIdentifier:(id)a5 keyName:(id)a6 sensor:(id)a7 isRetry:(BOOL)a8
{
}

- (void)service:(id)a3 didFailResource:(id)a4 IDSIdentifier:(id)a5 keyName:(id)a6 sensor:(id)a7 withError:(id)a8
{
}

- (void)service:(id)a3 didFailMessageWithIDSIdentifier:(id)a4 error:(id)a5
{
  if ([(NSCache *)self->_messageTypesByIDSIdentifier objectForKey:a4])
  {
    AnalyticsSendEventLazy();
  }
  else
  {
    v6 = qword_10006EC68;
    if (os_log_type_enabled((os_log_t)qword_10006EC68, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v8 = a4;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "No message found for IDS Identifier %{public}@", buf, 0xCu);
    }
  }
}

- (void)service:(id)a3 didDeliverMessageWithIDSIdentifier:(id)a4
{
  if ([(NSCache *)self->_messageTypesByIDSIdentifier objectForKey:a4])
  {
    AnalyticsSendEventLazy();
  }
  else
  {
    v5 = qword_10006EC68;
    if (os_log_type_enabled((os_log_t)qword_10006EC68, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v7 = a4;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "No message found for IDS Identifier %{public}@", buf, 0xCu);
    }
  }
}

- (void)service:(id)a3 didReceiveArchive:(id)a4 sensor:(id)a5 gizmoSnapshotURL:(id)a6 metadata:(id)a7 fromID:(id)a8
{
  stateCache = self->_stateCache;
  if (stateCache)
  {
    uint64_t v9 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v10 = qword_10006EC90;
    double v11 = *(double *)&qword_10006EC98;
    double v12 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v10 >= v9) {
      double v13 = -v13;
    }
    if (v12 + v11 + v13 < stateCache->_localDaemonLaunchTime + 3.0 + stateCache->_remoteRTCOffset)
    {
      AnalyticsSendEventLazy();
    }
  }
}

- (void)service:(id)a3 didReceiveKeyServiceMessage:(id)a4 fromID:(id)a5 key:(id)a6 keyName:(id)a7 sensor:(id)a8 archiveURLPath:(id)a9 deviceID:(id)a10
{
  stateCache = self->_stateCache;
  if (stateCache)
  {
    uint64_t v12 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v13 = qword_10006EC90;
    double v14 = *(double *)&qword_10006EC98;
    double v15 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v13 >= v12) {
      double v16 = -v16;
    }
    if (v15 + v14 + v16 < stateCache->_localDaemonLaunchTime + 3.0 + stateCache->_remoteRTCOffset) {
      AnalyticsSendEventLazy();
    }
  }
  v17 = (char *)[objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"RDGizmoSyncMessageTypeKey", a4, a5, a6), "integerValue");
  v18 = v17;
  if ((unint64_t)(v17 - 1) < 6) {
    goto LABEL_9;
  }
  if (v17 == (char *)7)
  {
    AnalyticsSendEventLazy();
    return;
  }
  if (v17 == (char *)8)
  {
LABEL_9:
    v19 = qword_10006EC68;
    if (os_log_type_enabled((os_log_t)qword_10006EC68, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = v18;
      _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Shouldn't be receiving message %ld on the key service", buf, 0xCu);
    }
  }
}

- (void)service:(id)a3 didReceiveResourceServiceMessage:(id)a4 fromID:(id)a5 incomingResponseIdentifier:(id)a6 outgoingResponseIdentifier:(id)a7
{
  id v9 = [[objc_msgSend(a4, "objectForKeyedSubscript:", @"RDGizmoSyncMessageTypeKey") integerValue];
  if (self && v9 == (id)8)
  {
    if (objc_loadWeak((id *)&self->_delegate))
    {
      [a4 objectForKeyedSubscript:@"RDGizmoSyncGizmoRecordingStatesKey"];
      [objc_msgSend(a4, "objectForKeyedSubscript:", @"RDGizmoSyncGizmoPrerequisitesKey") integerValue];
      AnalyticsSendEventLazy();
    }
  }
}

- (void)gizmoSync:(id)a3 failedToAddKey:(id)a4 toKeyChainForSensor:(id)a5
{
}

- (void)gizmoSync:(id)a3 failedToStoreEncryptedArchive:(id)a4 key:(id)a5 sensor:(id)a6 fileExists:(BOOL)a7
{
}

- (void)gizmoSync:(id)a3 willRunXPCActivityNamed:(id)a4
{
  stateCache = self->_stateCache;
  if (stateCache)
  {
    uint64_t v5 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v6 = qword_10006EC90;
    double v7 = *(double *)&qword_10006EC98;
    double v8 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v6 >= v5) {
      double v9 = -v9;
    }
    if (v8 + v7 + v9 < stateCache->_localDaemonLaunchTime + 3.0 + stateCache->_remoteRTCOffset) {
      AnalyticsSendEventLazy();
    }
  }
}

- (void)gizmoSync:(id)a3 failedToDecryptArchiveWithKey:(id)a4 sensor:(id)a5
{
}

- (void)gizmoSync:(id)a3 didDecryptArchiveWithKey:(id)a4 sensor:(id)a5
{
}

- (void)gizmoSync:(id)a3 didUnarchiveWithKey:(id)a4 sensor:(id)a5
{
}

- (void)gizmoSync:(id)a3 failedToUnarchiveWithKey:(id)a4 sensor:(id)a5
{
}

- (void)gizmoSync:(id)a3 failedToEncryptArchive:(id)a4 keyName:(id)a5 sensor:(id)a6
{
}

- (void)gizmoSync:(id)a3 didDeliverAndUnarchive:(id)a4 sensor:(id)a5 keyName:(id)a6 archiveStatus:(int64_t)a7
{
  if (AnalyticsIsEventUsed())
  {
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [a4 path]))
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100040188;
      v11[3] = &unk_10005D900;
      v11[4] = a4;
      v11[5] = a5;
      v11[6] = a6;
      sub_10000A830((uint64_t)RDUnarchiver, (uint64_t)a4, (uint64_t)v11);
    }
    v12[0] = @"RDAnalyticsWatchSyncEventKey";
    v12[1] = @"RDAnalyticsKeyStatusKey";
    v13[0] = &off_100061308;
    v13[1] = &off_100061368;
    v12[2] = @"RDAnalyticsArchiveStatusKey";
    v13[2] = +[NSNumber numberWithInteger:a7];
    v13[3] = a5;
    v12[3] = @"RDAnalyticsSensorIdentifierKey";
    v12[4] = @"RDAnalyticsKeyNameKey";
    v13[4] = a6;
    sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5]);
    AnalyticsSendEvent();
  }
}

- (void)gizmoSyncDidSyncTime:(id)a3
{
  v3[0] = @"RDAnalyticsWatchSyncEventKey";
  v3[1] = @"RDAnalyticsSyncSideKey";
  v4[0] = &off_100061398;
  v4[1] = &off_100061338;
  sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2]);
  AnalyticsSendEvent();
}

- (int64_t)cacheDelete:(id)a3 purgeWithUrgency:(int64_t)a4 dryRun:(BOOL)a5
{
  return 0;
}

- (void).cxx_destruct
{
}

@end