@interface CLVO2MaxCloudKitManager
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)shouldKeepLocalDataOnAccountChange;
- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4;
- (CKContainer)container;
- (CKSyncEngine)syncEngine;
- (CLVO2MaxCloudKitManager)init;
- (VO2MaxCloudKitSyncEngineMetadata)getCKSyncEngineMetadata;
- (id).cxx_construct;
- (id)createCKRecordForInput:(id)a3;
- (id)createCKRecordForOutput:(id)a3;
- (id)getSystemFieldsFromCKRecord:(id)a3;
- (id)getUserRecordIDName;
- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4;
- (void)addRecordIDsForSessionId:(id)a3 shouldUploadToOutputZone:(BOOL)a4 shouldUploadToInputZone:(BOOL)a5;
- (void)beginService;
- (void)bulkUploadRecordIDsShouldReupload:(BOOL)a3 shouldUploadToOutputZone:(BOOL)a4 shouldUploadToInputZone:(BOOL)a5 shouldThrottle:(BOOL)a6;
- (void)checkForDeletionOfVO2MaxData:(int)a3;
- (void)cloudKitAccountDidChange:(id)a3;
- (void)createVO2MaxInputZone;
- (void)createVO2MaxOutputZone;
- (void)deleteCloudKitRecords;
- (void)deleteLocalVO2MaxData;
- (void)deleteZone:(id)a3;
- (void)endService;
- (void)handleFetchedInputRecord:(id)a3;
- (void)handleFetchedOutputRecord:(id)a3;
- (void)handleServerRecordChanged:(id)a3;
- (void)handleSyncUpload:(id)a3;
- (void)handleUnknownItem:(id)a3;
- (void)handleWatchAppFitnessTrackingUpdate:(int)a3;
- (void)handleZoneDeleted:(id)a3;
- (void)handleZoneNotFound:(id)a3;
- (void)handleZonePurge:(id)a3;
- (void)initializeSyncEngine;
- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onSyncActivity:(id)a3;
- (void)receiveVO2MaxCloudKitDailyStatsFromWatch:(id)a3;
- (void)resetDailyStats;
- (void)resetSyncActivity:(id)a3 withDelay:(int64_t)a4;
- (void)saveInputsAndOutputsForSessionId:(id)a3;
- (void)saveRetrocomputedOutputs;
- (void)setUpSyncActivity;
- (void)setUserRecordIDName:(id)a3;
- (void)stopSyncing:(BOOL)a3;
- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4;
- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4;
- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4;
- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4;
- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4;
- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4;
- (void)updateDeviceUnlocked:(BOOL)a3;
- (void)updateInputSystemFields:(id)a3 inputRecord:(id)a4;
- (void)updateOutputSystemFields:(id)a3 outputRecord:(id)a4;
- (void)validateAccount;
@end

@implementation CLVO2MaxCloudKitManager

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10247ACE8 != -1) {
    dispatch_once(&qword_10247ACE8, &stru_1022B5988);
  }
  return (id)qword_10247ACE0;
}

- (CLVO2MaxCloudKitManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLVO2MaxCloudKitManager;
  return [(CLVO2MaxCloudKitManager *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLVO2MaxCloudKitManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLVO2MaxCloudKitManagerClientProtocol];
}

+ (BOOL)isSupported
{
  if (qword_10247ACF8 != -1) {
    dispatch_once(&qword_10247ACF8, &stru_1022B59A8);
  }
  return byte_10247ACF0;
}

- (void)beginService
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  objc_super v3 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLVO2MaxCloudKitManager", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    LOWORD(v10) = 0;
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager beginService]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  self->_syncEngine = 0;
  self->fDeviceUnlocked = 0;
  unsigned __int8 v9 = 0;
  sub_1004B3AD0(&v9, buf);
  shared_ptr<CLVO2MaxInputCache> v4 = *(shared_ptr<CLVO2MaxInputCache> *)buf;
  memset(buf, 0, sizeof(buf));
  cntrl = self->fInputCache.__cntrl_;
  self->fInputCache = v4;
  if (cntrl)
  {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  sub_1004B3C28((uint64_t *)&self->fInputCache, buf);
  shared_ptr<CLVO2MaxInputStore> v6 = *(shared_ptr<CLVO2MaxInputStore> *)buf;
  memset(buf, 0, sizeof(buf));
  v7 = self->fInputStore.__cntrl_;
  self->fInputStore = v6;
  if (v7)
  {
    sub_1000DB0A0((std::__shared_weak_count *)v7);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  operator new();
}

- (void)endService
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  objc_super v3 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CLVO2MaxCloudKitManager", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    shared_ptr<CLVO2MaxInputStore> v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager endService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:CKAccountChangedNotification object:0];
  value = self->fDataProtectionClient.__ptr_.__value_;
  if (value) {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
  }
  unint64_t v5 = self->fFitnessTrackingClient.__ptr_.__value_;
  if (v5) {
    [*((id *)v5 + 2) unregister:*((void *)v5 + 1) forNotification:6];
  }

  self->_syncEngine = 0;
  self->_container = 0;
}

- (void)saveInputsAndOutputsForSessionId:(id)a3
{
  [(CLVO2MaxCloudKitManager *)self addRecordIDsForSessionId:a3 shouldUploadToOutputZone:1 shouldUploadToInputZone:1];
}

- (void)saveRetrocomputedOutputs
{
  if (self->_syncEngine)
  {
    *(void *)buf = 0;
    int v10 = 0;
    uint64_t v11 = 0;
    sub_1012C912C((uint64_t)self->fStagingOutputStore.__ptr_.__value_, buf);
    *(void *)uu1 = 0;
    uint64_t v13 = 0;
    objc_super v3 = *(unsigned __int8 **)buf;
    shared_ptr<CLVO2MaxInputCache> v4 = v10;
    if (*(unsigned __int8 **)buf != v10)
    {
      do
      {
        if (uuid_compare(uu1, v3 + 24))
        {
          uuid_copy(uu1, v3 + 24);
          -[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:](self, "addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:", [objc_alloc((Class)NSUUID) initWithUUIDBytes:v3 + 24].UUIDString, 1, 0);
        }
        v3 += 184;
      }
      while (v3 != v4);
      objc_super v3 = *(unsigned __int8 **)buf;
    }
    if (v3)
    {
      int v10 = v3;
      operator delete(v3);
    }
  }
  else
  {
    uint64_t v6 = sub_1011E124C();
    if ((sub_1011E2DD0(v6) & 1) == 0)
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      v7 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Attempt to save retrocomputed outputs to CloudKit failed", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B5A80);
        }
        *(_WORD *)uu1 = 0;
        v8 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager saveRetrocomputedOutputs]", "%s\n", v8);
        if (v8 != (char *)buf) {
          free(v8);
        }
      }
    }
  }
}

- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe].silo
  if (!*a3)
  {
    BOOL v7 = *(_DWORD *)a4 == 1;
    [(CLVO2MaxCloudKitManager *)self updateDeviceUnlocked:v7];
  }
}

- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe].silo
  if (*a3 == 6)
  {
    uint64_t v8 = *(_DWORD *)a4;
    [(CLVO2MaxCloudKitManager *)self handleWatchAppFitnessTrackingUpdate:v8];
  }
  else if (*a3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    unsigned __int8 v9 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_FAULT))
    {
      int v10 = *a3;
      *(_DWORD *)buf = 67109120;
      int v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "[CKManager] #Warning: Unhandled FitnessTracking notification type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager onFitnessTrackingNotification:data:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
  else
  {
    uint64_t v7 = *(unsigned char *)a4 & 1;
    [(CLVO2MaxCloudKitManager *)self handleFitnessTrackingEnabled:v7];
  }
}

- (void)setUpSyncActivity
{
  sub_1000E1294((uint64_t *)v16, (uint64_t)"VO2MaxCloudKitManager.setUpSyncActivity", 0);
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = sub_1000D3E78();
  sub_10006B564(v4, &v14);
  double v13 = 0.0;
  sub_1000A699C(v14, "VO2MaxCloudKitManagerNextActivityTime", &v13);
  double v5 = v13;
  if (v13 > Current + (double)XPC_ACTIVITY_INTERVAL_1_DAY)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v6 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "VO2MaxCloudKitManagerNextActivityTime";
      __int16 v25 = 2050;
      double v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s is too far in the future (%{public}.2f). Resetting!", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      int v17 = 136446466;
      v18 = "VO2MaxCloudKitManagerNextActivityTime";
      __int16 v19 = 2050;
      double v20 = v13;
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager setUpSyncActivity]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    sub_1004CF7DC(v14, "VO2MaxCloudKitManagerNextActivityTime", 0xFFFFFFFFLL);
    double v13 = 0.0;
    double v5 = 0.0;
  }
  double v7 = v5 - Current;
  if (XPC_ACTIVITY_INTERVAL_30_MIN <= (uint64_t)v7) {
    int64_t v8 = (uint64_t)v7;
  }
  else {
    int64_t v8 = XPC_ACTIVITY_INTERVAL_30_MIN;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  unsigned __int8 v9 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v24 = "com.apple.vo2max.CloudKitManager";
    __int16 v25 = 2050;
    double v26 = v13;
    __int16 v27 = 2050;
    int64_t v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: Registering XPC Activity with nextPreprocessingTime=(%{public}.2f) and delay=(%{public}lld)", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    int v17 = 136446722;
    v18 = "com.apple.vo2max.CloudKitManager";
    __int16 v19 = 2050;
    double v20 = v13;
    __int16 v21 = 2050;
    int64_t v22 = v8;
    int v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager setUpSyncActivity]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  xpc_activity_unregister("com.apple.vo2max.CloudKitManager");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1004A8518;
  handler[3] = &unk_1022AD1E8;
  handler[4] = [objc_msgSend(-[CLVO2MaxCloudKitManager universe](self, "universe"), "vendor") proxyForService:@"CLVO2MaxCloudKitManager"];
  handler[5] = v8;
  xpc_activity_register("com.apple.vo2max.CloudKitManager", XPC_ACTIVITY_CHECK_IN, handler);
  if (v15) {
    sub_1000DB0A0(v15);
  }
  sub_1000E1098(v16);
}

- (void)resetSyncActivity:(id)a3 withDelay:(int64_t)a4
{
  double v6 = CFAbsoluteTimeGetCurrent() + (double)a4;
  double v14 = v6;
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  double v7 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "VO2MaxCloudKitManagerNextActivityTime";
    *(_WORD *)&buf[12] = 2050;
    *(double *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Resetting next activity time to: %{public}.1f", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    int v15 = 136446466;
    v16 = "VO2MaxCloudKitManagerNextActivityTime";
    __int16 v17 = 2050;
    double v18 = v6;
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager resetSyncActivity:withDelay:]", "%s\n", v11);
    if (v11 != buf) {
      free(v11);
    }
  }
  uint64_t v8 = sub_1000D3E78();
  sub_10006B564(v8, buf);
  sub_10016332C(*(uint64_t *)buf, "VO2MaxCloudKitManagerNextActivityTime", &v14);
  if (*(void *)&buf[8]) {
    sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
  }
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    unsigned __int8 v9 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_FAULT))
    {
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = state;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Failed to mark activity as Done. Current state is %{public}ld", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      xpc_activity_state_t v12 = xpc_activity_get_state((xpc_activity_t)a3);
      int v15 = 134349056;
      v16 = (const char *)v12;
      double v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager resetSyncActivity:withDelay:]", "%s\n", v13);
      if (v13 != buf) {
        free(v13);
      }
    }
  }
  [(CLVO2MaxCloudKitManager *)self setUpSyncActivity];
}

- (void)onSyncActivity:(id)a3
{
  if (!a3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    double v7 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419220 == -1)
    {
LABEL_21:
      unsigned __int8 v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager onSyncActivity:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
      return;
    }
LABEL_23:
    dispatch_once(&qword_102419220, &stru_1022B5A80);
    goto LABEL_21;
  }
  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    [(CLVO2MaxCloudKitManager *)self handleSyncUpload:a3];
    return;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v8 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unexpected activity state: %ld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 == -1) {
      goto LABEL_21;
    }
    goto LABEL_23;
  }
}

- (void)handleSyncUpload:(id)a3
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  double v5 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "com.apple.vo2max.CloudKitManager";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CKManager] Running XPC activity: %{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    int v33 = 136446210;
    v34 = "com.apple.vo2max.CloudKitManager";
    int64_t v22 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v22);
    if (v22 != buf) {
      free(v22);
    }
  }
  [(CLVO2MaxCloudKitManager *)self checkForDeletionOfVO2MaxData:self->fCloudKitDeletionState];
  [(CLVO2MaxCloudKitManager *)self getCKSyncEngineMetadata];
  if (v36 && [v36 length])
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    xpc_activity_state_t v6 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sync engine metadata available, so attempting to upload unsynced local data", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      *(_WORD *)int64_t v28 = 0;
      __int16 v25 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v25);
      if (v25 != buf) {
        free(v25);
      }
    }
    uint64_t v7 = 0;
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v8 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No sync engine metadata available, so attempting to upload all local data", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      *(_WORD *)int64_t v28 = 0;
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v23);
      if (v23 != buf) {
        free(v23);
      }
    }
    uint64_t v7 = 1;
  }
  [(CLVO2MaxCloudKitManager *)self bulkUploadRecordIDsShouldReupload:v7 shouldUploadToOutputZone:1 shouldUploadToInputZone:1 shouldThrottle:1];
  double v9 = 0.0;
  if (v35 != 1.79769313e308) {
    double v9 = CFAbsoluteTimeGetCurrent() - v35;
  }
  uint32_t v10 = arc4random_uniform(self->fMinTimeBetweenForcedFetches);
  sub_100103240();
  int v11 = sub_10073E30C();
  double fMinTimeBetweenForcedFetches = self->fMinTimeBetweenForcedFetches;
  if (fMinTimeBetweenForcedFetches == 0.0) {
    int v13 = v11;
  }
  else {
    int v13 = 0;
  }
  if (v13 == 1)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    double v14 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[CKManager] INTERNAL - Forcing CloudKit Fetch. Does not count towards daily stats (VO2MaxCloudKitMinTimeBetweenForcedFetches == 0)", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      *(_WORD *)int64_t v28 = 0;
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v24);
      if (v24 != buf) {
        free(v24);
      }
    }
    [(CKSyncEngine *)self->_syncEngine setNeedsToFetchChanges];
  }
  else if (v9 > fMinTimeBetweenForcedFetches + (double)v10)
  {
    double v27 = 0.0;
    uint64_t v15 = sub_1000D3E78();
    sub_10006B564(v15, buf);
    sub_1000A699C(*(uint64_t *)buf, "VO2MaxCloudKitLastForcedFetch", &v27);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
    double v16 = CFAbsoluteTimeGetCurrent() - v27;
    if (v16 > self->fMinTimeBetweenForcedFetches)
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      __int16 v17 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349568;
        *(double *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2050;
        *(double *)&buf[14] = v16;
        __int16 v38 = 1026;
        uint32_t v39 = v10;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Forcing fetch from CloudKit. secondsSinceMetadataUpdate: %{public}f, secondsSinceLastForcedFetch: %{public}f, buffer: %{public}d", buf, 0x1Cu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B5A80);
        }
        *(_DWORD *)int64_t v28 = 134349568;
        *(double *)&v28[4] = v9;
        __int16 v29 = 2050;
        double v30 = v16;
        __int16 v31 = 1026;
        uint32_t v32 = v10;
        double v26 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v26);
        if (v26 != buf) {
          free(v26);
        }
      }
      [(CKSyncEngine *)self->_syncEngine setNeedsToFetchChanges];
      uint64_t v18 = sub_1000D3E78();
      sub_10006B564(v18, buf);
      uint64_t v19 = *(void *)buf;
      *(void *)int64_t v28 = CFAbsoluteTimeGetCurrent();
      sub_10016332C(v19, "VO2MaxCloudKitLastForcedFetch", v28);
      if (*(void *)&buf[8]) {
        sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
      }
      ++self->fDailyStats.forcedFetchRequestedCount;
    }
  }
  int v20 = _os_feature_enabled_impl();
  __int16 v21 = &XPC_ACTIVITY_INTERVAL_4_HOURS;
  if (!v20) {
    __int16 v21 = &XPC_ACTIVITY_INTERVAL_1_DAY;
  }
  [(CLVO2MaxCloudKitManager *)self resetSyncActivity:a3 withDelay:*v21];
}

- (void)cloudKitAccountDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004A9AD8;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_async([objc_msgSend(objc_msgSend(-[CLVO2MaxCloudKitManager universe](self, "universe", a3), "silo"), "queue"), block);
}

- (void)validateAccount
{
  container = self->_container;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1004A9B5C;
  v3[3] = &unk_1022B59F8;
  v3[4] = self;
  [(CKContainer *)container accountInfoWithCompletionHandler:v3];
}

- (void)deleteLocalVO2MaxData
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  objc_super v3 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CKManager] Deleting all VO2 Max data local to this device", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    double v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager deleteLocalVO2MaxData]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v4 = (void *)sub_1011E124C();
  sub_1011E1538(v4);
  sub_1011C4BF4((uint64_t)self->fInputStore.__ptr_);
  sub_1012C9450(self->fStagingOutputStore.__ptr_.__value_);
  sub_1011F9E28((void *)self->fRetrocomputeDb.__ptr_.__value_ + 9);
}

- (void)deleteCloudKitRecords
{
  if (self->_container && self->_syncEngine)
  {
    self->fCloudKitDeletionState = 2;
    objc_super v3 = [(CKContainer *)self->_container privateCloudDatabase];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1004AAC08;
    v6[3] = &unk_10229FF00;
    v6[4] = self;
    [(CKDatabase *)v3 fetchAllRecordZonesWithCompletionHandler:v6];
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v4 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[CKManager] Attempted to delete records without a CKContainer or CKSyncEngine", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      __int16 v7 = 0;
      double v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager deleteCloudKitRecords]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
    self->fCloudKitDeletionState = 3;
  }
}

- (BOOL)shouldKeepLocalDataOnAccountChange
{
  BOOL v6 = 0;
  uint64_t v2 = sub_1000D3E78();
  sub_10006B564(v2, &v4);
  sub_1000D2988(v4, "VO2MaxCloudKitKeepLocalDataOnAccountChange", &v6);
  if (v5) {
    sub_1000DB0A0(v5);
  }
  sub_100103240();
  BOOL result = sub_10073E30C();
  if (!v6) {
    return 0;
  }
  return result;
}

- (void)setUserRecordIDName:(id)a3
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v4 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting userRecordIDName to %{private}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    __int16 v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager setUserRecordIDName:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  uint64_t v5 = sub_1000A6958();
  sub_1004D3518(v5, @"kCloudKitUserRecordId", (char *)[a3 UTF8String]);
  uint64_t v6 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v6 + 944))();
}

- (id)getUserRecordIDName
{
  memset(&__p, 0, sizeof(__p));
  uint64_t v2 = sub_1000A6958();
  sub_1000A7CF8(v2, @"kCloudKitUserRecordId", &__p);
  std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  if (!size)
  {
    id v6 = 0;
    if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) == 0) {
      return v6;
    }
    goto LABEL_8;
  }
  id v4 = objc_alloc((Class)NSString);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  id v6 = [v4 initWithUTF8String:p_p];
  if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) != 0) {
LABEL_8:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
  return v6;
}

- (void)updateDeviceUnlocked:(BOOL)a3
{
  if (!self->_syncEngine && !self->fDeviceUnlocked && a3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    id v6 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device has been unlocked. Will now initialize the sync engine.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      __int16 v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager updateDeviceUnlocked:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    [(CLVO2MaxCloudKitManager *)self initializeSyncEngine];
  }
  self->fDeviceUnlocked = a3;
}

- (void)handleWatchAppFitnessTrackingUpdate:(int)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      self->fCloudKitDeletionState = 1;
      [(CLVO2MaxCloudKitManager *)self checkForDeletionOfVO2MaxData:1];
    }
    else if (a3 == 1)
    {
      self->fCloudKitDeletionState = 0;
    }
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    objc_super v3 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CKManager] Received an unknown Watch.app Fitness Tracking state", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      id v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleWatchAppFitnessTrackingUpdate:]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
}

- (void)checkForDeletionOfVO2MaxData:(int)a3
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v5 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240192;
    int v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[CKManager] Checking if CloudKit deletion is necessary. State=%{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager checkForDeletionOfVO2MaxData:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (a3 == 3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    __int16 v7 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CKManager] Re-attempting VO2 Max data deletion after previous failure", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_20;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419220 == -1) {
      goto LABEL_27;
    }
    goto LABEL_29;
  }
  if (a3 != 1) {
    return;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  id v6 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CKManager] VO2Max disabled via Watch FitnessTracking switch. Deleting VO2 Max data", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 == -1)
    {
LABEL_27:
      id v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager checkForDeletionOfVO2MaxData:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
      goto LABEL_20;
    }
LABEL_29:
    dispatch_once(&qword_102419220, &stru_1022B5A80);
    goto LABEL_27;
  }
LABEL_20:
  [(CLVO2MaxCloudKitManager *)self deleteLocalVO2MaxData];
  [(CLVO2MaxCloudKitManager *)self deleteCloudKitRecords];
}

- (VO2MaxCloudKitSyncEngineMetadata)getCKSyncEngineMetadata
{
  retstr->var0 = 0;
  *(int64x2_t *)&retstr->var1 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  retstr->var3 = 0;
  uint64_t v4 = sub_1011E124C();
  sub_1011E2138(v4, (uint64_t)retstr);
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v5 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [retstr->var3 length];
    *(_DWORD *)buf = 134349056;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loaded sync engine metadata, length = %{public}lu", buf, 0xCu);
  }
  BOOL result = (VO2MaxCloudKitSyncEngineMetadata *)sub_10013D1A0(115, 2);
  if (result)
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    [retstr->var3 length];
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    BOOL result = (VO2MaxCloudKitSyncEngineMetadata *)sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager getCKSyncEngineMetadata]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  return result;
}

- (void)initializeSyncEngine
{
  if (self) {
    [(CLVO2MaxCloudKitManager *)self getCKSyncEngineMetadata];
  }
  else {
    long long v7 = 0u;
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  id v4 = [objc_alloc((Class)CKSyncEngineConfiguration) initWithDatabase:-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase") dataSource:self metadata:*((void *)&v7 + 1)];
  [v4 setApsMachServiceName:@"com.apple.aps.locationd.vo2max.cloudkit"];
  [v4 setPriority:2];
  [v4 setXpcActivityCriteriaOverrides:v3];
  self->_syncEngine = (CKSyncEngine *)[objc_alloc((Class)CKSyncEngine) initWithConfiguration:v4];
  self->fDailyStats.syncEngineEnabled = 1;
  syncEngine = self->_syncEngine;
  fOutputZoneID = self->fOutputZoneID;
  [(CKSyncEngine *)syncEngine fetchChangesForZoneIDs:+[NSArray arrayWithObjects:&fOutputZoneID count:1] completionHandler:&stru_1022B5A18];
  if (self->fFetchChangesForInputZone)
  {
    id v6 = self->_syncEngine;
    fInputZoneID = self->fInputZoneID;
    [(CKSyncEngine *)v6 fetchChangesForZoneIDs:+[NSArray arrayWithObjects:&fInputZoneID count:1] completionHandler:&stru_1022B5A38];
  }
  xpc_release(v3);
  [(CLVO2MaxCloudKitManager *)self setUpSyncActivity];
}

- (void)createVO2MaxOutputZone
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  xpc_object_t v3 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating VO2MaxOutputs zone", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager createVO2MaxOutputZone]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  syncEngine = self->_syncEngine;
  id v6 = [objc_alloc((Class)CKRecordZone) initWithZoneID:self->fOutputZoneID];
  [(CKSyncEngine *)syncEngine addRecordZonesToSave:+[NSArray arrayWithObjects:&v6 count:1] recordZoneIDsToDelete:0];
}

- (void)createVO2MaxInputZone
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  xpc_object_t v3 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating VO2MaxInputs zone", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager createVO2MaxInputZone]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  syncEngine = self->_syncEngine;
  id v6 = [objc_alloc((Class)CKRecordZone) initWithZoneID:self->fInputZoneID];
  [(CKSyncEngine *)syncEngine addRecordZonesToSave:+[NSArray arrayWithObjects:&v6 count:1] recordZoneIDsToDelete:0];
}

- (void)deleteZone:(id)a3
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v5 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting zone with zoneID = %{public}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    int v9 = 138543362;
    id v10 = a3;
    long long v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager deleteZone:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  syncEngine = self->_syncEngine;
  id v8 = a3;
  [(CKSyncEngine *)syncEngine addRecordZonesToSave:0 recordZoneIDsToDelete:+[NSArray arrayWithObjects:&v8 count:1]];
}

- (void)addRecordIDsForSessionId:(id)a3 shouldUploadToOutputZone:(BOOL)a4 shouldUploadToInputZone:(BOOL)a5
{
  if (self->_syncEngine)
  {
    BOOL v6 = a5;
    if (a4)
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      id v8 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = a3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding sessionId %{public}@ to RecordIDs for sync engine to save to VO2MaxOutputZone", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B5A80);
        }
        int v20 = 138543362;
        id v21 = a3;
        double v16 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:]", "%s\n", v16);
        if (v16 != (char *)buf) {
          free(v16);
        }
      }
      id v9 = [objc_alloc((Class)CKRecordID) initWithRecordName:a3 zoneID:self->fOutputZoneID];
      syncEngine = self->_syncEngine;
      id v19 = v9;
      [(CKSyncEngine *)syncEngine addRecordIDsToSave:+[NSArray arrayWithObjects:&v19 count:1] recordIDsToDelete:0];
      ++self->fDailyStats.outputSaveQueuedCount;
    }
    if (v6)
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      int v11 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Adding sessionId %{public}@ to RecordIDs for sync engine to save to VO2MaxInputZone", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B5A80);
        }
        int v20 = 138543362;
        id v21 = a3;
        __int16 v17 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:]", "%s\n", v17);
        if (v17 != (char *)buf) {
          free(v17);
        }
      }
      id v12 = [objc_alloc((Class)CKRecordID) initWithRecordName:a3 zoneID:self->fInputZoneID];
      int v13 = self->_syncEngine;
      id v18 = v12;
      [(CKSyncEngine *)v13 addRecordIDsToSave:+[NSArray arrayWithObjects:&v18 count:1] recordIDsToDelete:0];
      ++self->fDailyStats.inputSaveQueuedCount;
    }
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    double v14 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sync engine uninitialized, so not adding sessionId %{public}@ to RecordIDs for sync engine to save", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      int v20 = 138543362;
      id v21 = a3;
      uint64_t v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
  }
}

- (void)bulkUploadRecordIDsShouldReupload:(BOOL)a3 shouldUploadToOutputZone:(BOOL)a4 shouldUploadToInputZone:(BOOL)a5 shouldThrottle:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v30 = a5;
  BOOL v32 = a4;
  std::string __p = 0;
  v34 = 0;
  uint64_t v35 = 0;
  uint64_t v8 = sub_1011E124C();
  sub_1011E1DF0(v8, &__p);
  unint64_t v9 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * (((char *)v34 - (unsigned char *)__p) >> 4));
  *(void *)buf = sub_1004AD4A8;
  if (v34 == __p) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }
  sub_1004B3F38((__n128 *)__p, v34, (unsigned int (**)(void, void))buf, v10, 1);
  *(void *)buf = sub_1004AD4CC;
  int v11 = sub_1004B5E64((long long *)__p, (long long *)v34, (unsigned int (**)(void, void))buf);
  if (v34 != (__n128 *)v11) {
    v34 = (__n128 *)v11;
  }
  BOOL v29 = v6 && 0xCCCCCCCCCCCCCCCDLL * (((char *)v11 - (unsigned char *)__p) >> 4) > self->fMaxSessionsForUploadThrottling;
  if (__p != v11)
  {
    int v12 = 0;
    int v13 = (long long *)((char *)__p + 80);
    do
    {
      long long v39 = *(v13 - 5);
      long long v14 = *(v13 - 4);
      long long v15 = *(v13 - 3);
      long long v16 = *(v13 - 1);
      v40[2] = *(v13 - 2);
      long long v41 = v16;
      v40[0] = v14;
      v40[1] = v15;
      id v18 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v40];
      if (v32)
      {
        BOOL v19 = 1;
        if (!a3 && (void)v41) {
          BOOL v19 = [(id)v41 length] == 0;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
      BOOL v20 = v30
         && (a3 || !*((void *)&v41 + 1) || ![*((id *)&v41 + 1) length])
         && sub_1011C4C00((uint64_t *)self->fInputStore.__ptr_, (const unsigned __int8 *)v40);
      if ((v19 || v20)
        && (-[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:](self, "addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:", [v18 UUIDString], v19, v20), v29)&& (++v12, v12 >= self->fMaxSessionsForUploadThrottling))
      {
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B5A80);
        }
        id v23 = qword_102419228;
        if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
        {
          int fMaxSessionsForUploadThrottling = self->fMaxSessionsForUploadThrottling;
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&uint8_t buf[4] = fMaxSessionsForUploadThrottling;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Hit the max of %{public}d sessions per CloudKit upload. Will check for more data later.", buf, 8u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419220 != -1) {
            dispatch_once(&qword_102419220, &stru_1022B5A80);
          }
          int v25 = self->fMaxSessionsForUploadThrottling;
          int v36 = 67240192;
          int v37 = v25;
          double v26 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone:shouldThrottle:]", "%s\n", v26);
          if (v26 != (char *)buf) {
            free(v26);
          }
        }
        char v21 = 1;
      }
      else
      {
        char v21 = 0;
      }
      if (v13 == v11) {
        char v22 = 1;
      }
      else {
        char v22 = v21;
      }
      v13 += 5;
    }
    while ((v22 & 1) == 0);
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  double v27 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Done adding sessions to sync", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    LOWORD(v39) = 0;
    int64_t v28 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone:shouldThrottle:]", "%s\n", v28);
    if (v28 != (char *)buf) {
      free(v28);
    }
  }
  if (__p)
  {
    v34 = (__n128 *)__p;
    operator delete(__p);
  }
}

- (id)getSystemFieldsFromCKRecord:(id)a3
{
  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [a3 encodeSystemFieldsWithCoder:v4];
  [v4 finishEncoding];

  return [v4 encodedData];
}

- (id)createCKRecordForOutput:(id)a3
{
  v30[0] = 0;
  v30[1] = 0;
  [objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", objc_msgSend(a3, "recordName")) getUUIDBytes:v30];
  id v28 = 0;
  uint64_t v29 = 0;
  uint64_t v5 = sub_1011E124C();
  if (!sub_1011E1D1C(v5, (const unsigned __int8 *)v30, v27))
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v10 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      double v26 = *(double *)&a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve VO2MaxSessionAttributes for CKRecordID: %{public}@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    int v23 = 138543362;
    double v24 = *(double *)&a3;
    goto LABEL_36;
  }
  if ([v28 length])
  {
    double v22 = 0.0;
    id v6 = objc_alloc((Class)NSKeyedUnarchiver);
    id v7 = [v6 initForReadingFromData:[v28 copy] error:&v22];
    [v7 setRequiresSecureCoding:1];
    id v8 = [objc_alloc((Class)CKRecord) initWithCoder:v7];
    [v7 finishDecoding];
    if (!v8)
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      unint64_t v9 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        double v26 = v22;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to decode output record from system fields data: %{public}@", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 0)) {
        return 0;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      int v23 = 138543362;
      double v24 = v22;
LABEL_36:
      id v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager createCKRecordForOutput:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
      return 0;
    }
  }
  else
  {
    id v8 = [objc_alloc((Class)CKRecord) initWithRecordType:@"VO2MaxOutput" recordID:a3];
  }
  int v11 = objc_alloc_init(CLCKVO2MaxSessionOutput);
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v13 = sub_1011E124C();
  if (sub_1011E222C(v13, (const unsigned __int8 *)v30, v11))
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    long long v14 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
    {
      CFAbsoluteTime v15 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349056;
      double v26 = v15 - Current;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Completed fetch of output proto; duration: %{public}f",
        buf,
        0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      CFAbsoluteTime v19 = CFAbsoluteTimeGetCurrent();
      int v23 = 134349056;
      double v24 = v19 - Current;
      BOOL v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager createCKRecordForOutput:]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
    [objc_msgSend(objc_msgSend(v8, "encryptedValuesByKey"), "setObject:forKeyedSubscript:", -[CLCKVO2MaxSessionOutput data](v11, "data"), @"sessionData"];
    ++self->fDailyStats.outputSaveAttemptedCount;
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    long long v16 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Unable to get output due to device being locked, clearing the sync engine and will try again later.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      LOWORD(v23) = 0;
      char v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager createCKRecordForOutput:]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
    id v8 = 0;
    self->_syncEngine = 0;
    self->fDailyStats.syncEngineEnabled = 0;
    self->fDeviceUnlocked = 0;
  }
  return v8;
}

- (void)updateOutputSystemFields:(id)a3 outputRecord:(id)a4
{
  v31[0] = 0;
  v31[1] = 0;
  [objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", objc_msgSend(objc_msgSend(a4, "recordID"), "recordName")) getUUIDBytes:v31];
  std::string __p = 0;
  char v21 = 0;
  uint64_t v22 = 0;
  uint64_t v7 = sub_1011E124C();
  if (sub_1011E1DBC(v7, (const unsigned __int8 *)v31, (uint64_t)&__p))
  {
    id v8 = (long long *)__p;
    unint64_t v9 = v21;
    if (__p != v21)
    {
      do
      {
        long long v26 = *v8;
        long long v10 = v8[1];
        long long v11 = v8[2];
        long long v12 = v8[4];
        v27[2] = v8[3];
        long long v28 = v12;
        v27[0] = v10;
        v27[1] = v11;
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)v27, out);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B5A80);
        }
        uint64_t v13 = qword_102419228;
        if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          BOOL v30 = out;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Saving output metadata %s", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419220 != -1) {
            dispatch_once(&qword_102419220, &stru_1022B5A80);
          }
          int v23 = 136315138;
          double v24 = out;
          CFAbsoluteTime v15 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager updateOutputSystemFields:outputRecord:]", "%s\n", v15);
          if (v15 != (char *)buf) {
            free(v15);
          }
        }
        *(void *)&long long v28 = a3;
        uint64_t v14 = sub_1011E124C();
        sub_1011E1C78(v14, (uint64_t)&v26);
        v8 += 5;
      }
      while (v8 != v9);
    }
    ++self->fDailyStats.outputSaveSuccessCount;
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    long long v16 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = (char *)[a4 recordID];
      *(_DWORD *)buf = 138543362;
      BOOL v30 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to retrieve VO2MaxSessionAttributes for CKRecord with ID: %{public}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      id v18 = [a4 recordID];
      LODWORD(v26) = 138543362;
      *(void *)((char *)&v26 + 4) = v18;
      CFAbsoluteTime v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager updateOutputSystemFields:outputRecord:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
  }
  if (__p)
  {
    char v21 = (long long *)__p;
    operator delete(__p);
  }
}

- (void)handleFetchedOutputRecord:(id)a3
{
  uint64_t v5 = [[[CLCKVO2MaxSessionOutput alloc] initWithData:[objc_msgSend(objc_msgSend(a3, "encryptedValuesByKey"), "objectForKeyedSubscript:", @"sessionData")];
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v7 = sub_1011E124C();
  if (sub_1011E2688(v7, v5, (uint64_t)[(CLVO2MaxCloudKitManager *)self getSystemFieldsFromCKRecord:a3]))
  {
    ++self->fDailyStats.outputFetchSuccessCount;
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    id v8 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to persist fetched output due to device being locked, clearing the sync engine and will try again later.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      long long v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleFetchedOutputRecord:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    self->_syncEngine = 0;
    self->fDailyStats.syncEngineEnabled = 0;
    self->fDeviceUnlocked = 0;
    ++self->fDailyStats.outputFetchFailureCount;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  unint64_t v9 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
  {
    CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134349056;
    double v14 = v10 - Current;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Completed save of output proto; duration: %{public}f",
      buf,
      0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    CFAbsoluteTimeGetCurrent();
    long long v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleFetchedOutputRecord:]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
}

- (id)createCKRecordForInput:(id)a3
{
  v29[0] = 0;
  v29[1] = 0;
  [objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", objc_msgSend(a3, "recordName")) getUUIDBytes:v29];
  uint64_t v27 = 0;
  id v28 = 0;
  uint64_t v5 = sub_1011E124C();
  if (!sub_1011E1D1C(v5, (const unsigned __int8 *)v29, v26))
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    CFAbsoluteTime v10 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      double v25 = *(double *)&a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve VO2MaxSessionAttributes for CKRecordID: %{public}@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    int v22 = 138543362;
    double v23 = *(double *)&a3;
    goto LABEL_37;
  }
  if ([v28 length])
  {
    double v21 = 0.0;
    id v6 = objc_alloc((Class)NSKeyedUnarchiver);
    id v7 = [v6 initForReadingFromData:[v28 copy] error:&v21];
    [v7 setRequiresSecureCoding:1];
    id v8 = [objc_alloc((Class)CKRecord) initWithCoder:v7];
    [v7 finishDecoding];
    if (!v8)
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      unint64_t v9 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        double v25 = v21;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to decode input record from system fields data: %{public}@", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 0)) {
        return 0;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      int v22 = 138543362;
      double v23 = v21;
LABEL_37:
      __int16 v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager createCKRecordForInput:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
      return 0;
    }
  }
  else
  {
    id v8 = [objc_alloc((Class)CKRecord) initWithRecordType:@"VO2MaxInput" recordID:a3];
  }
  long long v11 = objc_alloc_init(CLCKVO2MaxSessionInput);
  double Current = CFAbsoluteTimeGetCurrent();
  if (sub_1011C4C24((uint64_t *)self->fInputStore.__ptr_, (const unsigned __int8 *)v29, v11))
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v13 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
    {
      CFAbsoluteTime v14 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349056;
      double v25 = v14 - Current;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Completed fetch of input proto; duration: %{public}f",
        buf,
        0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      CFAbsoluteTime v18 = CFAbsoluteTimeGetCurrent();
      int v22 = 134349056;
      double v23 = v18 - Current;
      CFAbsoluteTime v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager createCKRecordForInput:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    if ([(NSMutableArray *)[(CLCKVO2MaxSessionInput *)v11 inputs] count])
    {
      [objc_msgSend(objc_msgSend(v8, "encryptedValuesByKey"), "setObject:forKeyedSubscript:", -[CLCKVO2MaxSessionInput data](v11, "data"), @"sessionData"];
      ++self->fDailyStats.inputSaveAttemptedCount;
      return v8;
    }
    return 0;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  CFAbsoluteTime v15 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to get input due to device being locked, clearing the sync engine and will try again later.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    LOWORD(v22) = 0;
    BOOL v20 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager createCKRecordForInput:]", "%s\n", v20);
    if (v20 != (char *)buf) {
      free(v20);
    }
  }
  id v8 = 0;
  self->_syncEngine = 0;
  self->fDailyStats.syncEngineEnabled = 0;
  self->fDeviceUnlocked = 0;
  return v8;
}

- (void)updateInputSystemFields:(id)a3 inputRecord:(id)a4
{
  v31[0] = 0;
  v31[1] = 0;
  [objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", objc_msgSend(objc_msgSend(a4, "recordID"), "recordName")) getUUIDBytes:v31];
  std::string __p = 0;
  double v21 = 0;
  uint64_t v22 = 0;
  uint64_t v7 = sub_1011E124C();
  if (sub_1011E1DBC(v7, (const unsigned __int8 *)v31, (uint64_t)&__p))
  {
    id v8 = (long long *)__p;
    unint64_t v9 = v21;
    if (__p != v21)
    {
      do
      {
        long long v26 = *v8;
        long long v10 = v8[1];
        long long v11 = v8[2];
        long long v12 = v8[4];
        v27[2] = v8[3];
        long long v28 = v12;
        v27[0] = v10;
        v27[1] = v11;
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)v27, out);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B5A80);
        }
        uint64_t v13 = qword_102419228;
        if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          BOOL v30 = out;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Saving input metadata %s", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419220 != -1) {
            dispatch_once(&qword_102419220, &stru_1022B5A80);
          }
          int v23 = 136315138;
          double v24 = out;
          CFAbsoluteTime v15 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager updateInputSystemFields:inputRecord:]", "%s\n", v15);
          if (v15 != (char *)buf) {
            free(v15);
          }
        }
        *((void *)&v28 + 1) = a3;
        uint64_t v14 = sub_1011E124C();
        sub_1011E1C78(v14, (uint64_t)&v26);
        v8 += 5;
      }
      while (v8 != v9);
    }
    ++self->fDailyStats.inputSaveSuccessCount;
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    long long v16 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = (char *)[a4 recordID];
      *(_DWORD *)buf = 138543362;
      BOOL v30 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to retrieve VO2MaxSessionAttributes for CKRecord with ID: %{public}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      id v18 = [a4 recordID];
      LODWORD(v26) = 138543362;
      *(void *)((char *)&v26 + 4) = v18;
      CFAbsoluteTime v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager updateInputSystemFields:inputRecord:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
  }
  if (__p)
  {
    double v21 = (long long *)__p;
    operator delete(__p);
  }
}

- (void)handleFetchedInputRecord:(id)a3
{
  if (self->fFetchChangesForInputZone)
  {
    uint64_t v5 = -[CLCKVO2MaxSessionInput initWithData:]([CLCKVO2MaxSessionInput alloc], "initWithData:", [objc_msgSend(objc_msgSend(a3, "encryptedValuesByKey"), "objectForKeyedSubscript:", @"sessionData")]);
    double Current = CFAbsoluteTimeGetCurrent();
    ptr = (uint64_t *)self->fInputStore.__ptr_;
    [(CLVO2MaxCloudKitManager *)self getSystemFieldsFromCKRecord:a3];
    if (sub_1011C4DF4(ptr, v5))
    {
      ++self->fDailyStats.inputFetchSuccessCount;
    }
    else
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      id v8 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to persist fetched input due to device being locked, clearing the sync engine and will try again later.", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B5A80);
        }
        long long v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleFetchedInputRecord:]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
      self->_syncEngine = 0;
      self->fDailyStats.syncEngineEnabled = 0;
      self->fDeviceUnlocked = 0;
      ++self->fDailyStats.inputFetchFailureCount;
    }
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    unint64_t v9 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
    {
      CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349056;
      double v14 = v10 - Current;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Completed save of input proto; duration: %{public}f",
        buf,
        0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      CFAbsoluteTimeGetCurrent();
      long long v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleFetchedInputRecord:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)handleServerRecordChanged:(id)a3
{
  if (a3)
  {
    if (objc_msgSend(objc_msgSend(a3, "recordType"), "isEqualToString:", @"VO2MaxOutput"))
    {
      [(CLVO2MaxCloudKitManager *)self updateOutputSystemFields:[(CLVO2MaxCloudKitManager *)self getSystemFieldsFromCKRecord:a3] outputRecord:a3];
    }
    else if (objc_msgSend(objc_msgSend(a3, "recordType"), "isEqualToString:", @"VO2MaxInput"))
    {
      [(CLVO2MaxCloudKitManager *)self updateInputSystemFields:[(CLVO2MaxCloudKitManager *)self getSystemFieldsFromCKRecord:a3] inputRecord:a3];
    }
    else
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      uint64_t v7 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = [a3 recordType];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CloudKit provided server record of unexpected type: %{public}@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B5A80);
        }
        int v11 = 138543362;
        id v12 = [a3 recordType];
        unint64_t v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager handleServerRecordChanged:]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
    }
    syncEngine = self->_syncEngine;
    id v10 = [a3 recordID];
    [(CKSyncEngine *)syncEngine addRecordIDsToSave:+[NSArray arrayWithObjects:&v10 count:1] recordIDsToDelete:0];
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v5 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Expected server record is missing from error after failed record save", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      LOWORD(v11) = 0;
      id v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager handleServerRecordChanged:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)handleUnknownItem:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "recordType"), "isEqualToString:", @"VO2MaxOutput"))
  {
    [(CLVO2MaxCloudKitManager *)self updateOutputSystemFields:0 outputRecord:a3];
  }
  else if (objc_msgSend(objc_msgSend(a3, "recordType"), "isEqualToString:", @"VO2MaxInput"))
  {
    [(CLVO2MaxCloudKitManager *)self updateInputSystemFields:0 inputRecord:a3];
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v5 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = [a3 recordType];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CloudKit provided record of unexpected type: %{public}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      int v9 = 138543362;
      id v10 = [a3 recordType];
      uint64_t v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager handleUnknownItem:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  syncEngine = self->_syncEngine;
  id v8 = [a3 recordID];
  [(CKSyncEngine *)syncEngine addRecordIDsToSave:+[NSArray arrayWithObjects:&v8 count:1] recordIDsToDelete:0];
}

- (void)handleZoneNotFound:(id)a3
{
  if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"), "zoneName"), "isEqualToString:", @"VO2MaxOutputZone"))
  {
    [(CLVO2MaxCloudKitManager *)self createVO2MaxOutputZone];
    syncEngine = self->_syncEngine;
    id v12 = [a3 recordID];
    id v6 = &v12;
LABEL_5:
    [(CKSyncEngine *)syncEngine addRecordIDsToSave:+[NSArray arrayWithObjects:v6 count:1] recordIDsToDelete:0];
    return;
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"), "zoneName"), "isEqualToString:", @"VO2MaxInputZone"))
  {
    [(CLVO2MaxCloudKitManager *)self createVO2MaxInputZone];
    syncEngine = self->_syncEngine;
    id v11 = [a3 recordID];
    id v6 = &v11;
    goto LABEL_5;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v7 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = [[[a3 recordID] zoneID] zoneName];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Will not attempt to save unexpected zone: %{public}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    [objc_msgSend(objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"), "zoneName");
    id v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager handleZoneNotFound:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
}

- (void)handleZoneDeleted:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", @"VO2MaxOutputZone"))
  {
    [(CLVO2MaxCloudKitManager *)self createVO2MaxOutputZone];
    uint64_t v5 = self;
    uint64_t v6 = 1;
    uint64_t v7 = 0;
LABEL_5:
    [(CLVO2MaxCloudKitManager *)v5 bulkUploadRecordIDsShouldReupload:1 shouldUploadToOutputZone:v6 shouldUploadToInputZone:v7 shouldThrottle:0];
    return;
  }
  if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", @"VO2MaxInputZone"))
  {
    [(CLVO2MaxCloudKitManager *)self createVO2MaxInputZone];
    uint64_t v5 = self;
    uint64_t v6 = 0;
    uint64_t v7 = 1;
    goto LABEL_5;
  }
  if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", CKRecordZoneDefaultName))
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    id v8 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = [a3 zoneName];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[CKManager] Delete reported for zone (%@)", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      [a3 zoneName];
      int v9 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleZoneDeleted:]", "%s\n");
LABEL_26:
      if (v9 != buf) {
        free(v9);
      }
    }
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    id v10 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = [a3 zoneName];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Delete reported for unexpected zone: %{public}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      [a3 zoneName];
      int v9 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager handleZoneDeleted:]", "%s\n");
      goto LABEL_26;
    }
  }
}

- (void)handleZonePurge:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", @"VO2MaxOutputZone"))
  {
    uint64_t v5 = (void *)sub_1011E124C();
    sub_1011E1538(v5);
    [(CLVO2MaxCloudKitManager *)self createVO2MaxOutputZone];
  }
  else if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", @"VO2MaxInputZone"))
  {
    sub_1011C4BF4((uint64_t)self->fInputStore.__ptr_);
    [(CLVO2MaxCloudKitManager *)self createVO2MaxInputZone];
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v6 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = [a3 zoneName];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Will not attempt to purge unexpected zone: %{public}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      [a3 zoneName];
      uint64_t v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager handleZonePurge:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)stopSyncing:(BOOL)a3
{
  BOOL v3 = a3;
  self->_syncEngine = 0;
  self->fDailyStats.syncEngineEnabled = 0;
  value = self->fDataProtectionClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v5 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Attempting unregistration when fDataProtectionClient is not initialized", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      uint64_t v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager stopSyncing:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  if (v3)
  {
    uint64_t v6 = sub_1011E124C();
    sub_1011E2224(v6);
  }
}

- (void)resetDailyStats
{
  self->fDailyStatsStartTime = CFAbsoluteTimeGetCurrent();
  *(_OWORD *)&self->fDailyStats.outputSaveQueuedCount = 0u;
  *(_OWORD *)&self->fDailyStats.outputFetchSuccessCount = 0u;
  *(_OWORD *)&self->fDailyStats.inputSaveSuccessCount = 0u;
  *(_OWORD *)&self->fDailyStats.inputFetchFailureCount = 0u;
}

- (void)receiveVO2MaxCloudKitDailyStatsFromWatch:(id)a3
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v5 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received daily stats message from paired watch", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    __int16 v14 = 0;
    id v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager receiveVO2MaxCloudKitDailyStatsFromWatch:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    LOBYTE(v14) = 0;
    *(void *)&long long v6 = -1;
    *((void *)&v6 + 1) = -1;
    long long v15 = v6;
    v16[0] = v6;
    v16[1] = v6;
    int v17 = -1;
    unint64_t v18 = 0xBFF0000000000000;
    [a3 getBytes:&v14 length:64];
    self->fDailyStats.secondsOfDataCollection = CFAbsoluteTimeGetCurrent() - self->fDailyStatsStartTime;
    uint64_t v7 = [(objc_class *)off_10241BB60() sharedInstance];
    if (v7)
    {
      if ([(objc_class *)v7 isPaired])
      {
        [[-[objc_class sharedInstance](off_10241BB60(), "sharedInstance") getPairedDevices] count];
LABEL_32:
        AnalyticsSendEventLazy();
        goto LABEL_33;
      }
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      id v11 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to retrieve number of paired watches: not paired according to device registry", buf, 2u);
      }
      if (!sub_10013D1A0(115, 0)) {
        goto LABEL_32;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419220 == -1)
      {
LABEL_39:
        uint64_t v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager receiveVO2MaxCloudKitDailyStatsFromWatch:]", "%s\n", v13);
        if (v13 != (char *)buf) {
          free(v13);
        }
        goto LABEL_32;
      }
    }
    else
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      id v10 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to retrieve number of paired watches: device registry unavailable", buf, 2u);
      }
      if (!sub_10013D1A0(115, 0)) {
        goto LABEL_32;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419220 == -1) {
        goto LABEL_39;
      }
    }
    dispatch_once(&qword_102419220, &stru_1022B5A80);
    goto LABEL_39;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  id v8 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "VO2MaxCloudKitDailyCounts,Not sending analytics, no IHA permission", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    __int16 v14 = 0;
    id v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager receiveVO2MaxCloudKitDailyStatsFromWatch:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
LABEL_33:
  [(CLVO2MaxCloudKitManager *)self resetDailyStats];
}

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v5 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved CKRecordZone %{public}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    long long v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:didSaveRecordZone:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4
{
  if (self->_syncEngine == a3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    long long v6 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sync engine reports successful deletion of CKRecordZone with zoneID: %{public}@. Will recreate zone and reupload local data.", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      uint64_t v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:didDeleteRecordZoneWithID:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    [(CLVO2MaxCloudKitManager *)self handleZoneDeleted:a4];
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  id v8 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = a4;
    __int16 v12 = 2114;
    id v13 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save CKRecordZone: %{public}@, error = %{public}@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    id v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:failedToSaveRecordZone:error:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  if (objc_msgSend(objc_msgSend(a5, "domain"), "isEqualToString:", CKErrorDomain))
  {
    if ([a5 code] == (id)112) {
      -[CLVO2MaxCloudKitManager deleteZone:](self, "deleteZone:", [a4 zoneID]);
    }
  }
}

- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v7 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = a5;
    __int16 v11 = 2114;
    id v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Sync engine reports failure to delete CKRecordZone: %{public}@, zoneID = %{public}@. This is unexpected, as we should not be deleting any zones", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    id v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:failedToDeleteRecordZoneWithID:error:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
}

- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v5 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sync engine reports that CKRecordZone with identifier %{public}@ changed", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    long long v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:zoneWithIDChanged:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  if (self->_syncEngine == a3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    long long v6 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sync engine reports that CKRecordZone with identifier %{public}@ was deleted", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      uint64_t v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:zoneWithIDWasDeleted:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    [(CLVO2MaxCloudKitManager *)self handleZoneDeleted:a4];
  }
}

- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4
{
  if (self->_syncEngine == a3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    long long v6 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sync engine reports that CKRecordZone with identifier %{public}@ was purged", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      uint64_t v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:zoneWithIDWasPurged:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    [(CLVO2MaxCloudKitManager *)self handleZonePurge:a4];
  }
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  if (self->_syncEngine != a3) {
    return 0;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v7 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sync engine is asking for CKRecord with ID %{public}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    __int16 v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:recordToSaveForRecordID:]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(a4, "zoneID"), "zoneName"), "isEqualToString:", @"VO2MaxOutputZone"))
  {
    id v4 = [(CLVO2MaxCloudKitManager *)self createCKRecordForOutput:a4];
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    id v8 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Returning output CKRecord: %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 == -1)
      {
LABEL_37:
        long long v15 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:recordToSaveForRecordID:]", "%s\n", v15);
        if (v15 != (char *)buf) {
          free(v15);
        }
        return v4;
      }
LABEL_39:
      dispatch_once(&qword_102419220, &stru_1022B5A80);
      goto LABEL_37;
    }
  }
  else
  {
    if (!objc_msgSend(objc_msgSend(objc_msgSend(a4, "zoneID"), "zoneName"), "isEqualToString:", @"VO2MaxInputZone"))
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      __int16 v11 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
      {
        id v12 = [objc_msgSend(a4, "zoneID") zoneName];
        *(_DWORD *)buf = 138543362;
        id v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "RecordID associated with unexpected zone: %{public}@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B5A80);
        }
        [objc_msgSend(a4, "zoneID") zoneName];
        id v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:recordToSaveForRecordID:]", "%s\n", v13);
        if (v13 != (char *)buf) {
          free(v13);
        }
      }
      return 0;
    }
    id v4 = [(CLVO2MaxCloudKitManager *)self createCKRecordForInput:a4];
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    id v9 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Returning input CKRecord: %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 == -1) {
        goto LABEL_37;
      }
      goto LABEL_39;
    }
  }
  return v4;
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  if (self->_syncEngine == a3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    long long v6 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v12 = [a4 recordID];
      __int16 v13 = 2113;
      id v14 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sync engine saved CKRecord with CKRecordID %{public}@, record = %{private}@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      [a4 recordID];
      id v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:didSaveRecord:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", @"VO2MaxOutput"))
    {
      [(CLVO2MaxCloudKitManager *)self updateOutputSystemFields:[(CLVO2MaxCloudKitManager *)self getSystemFieldsFromCKRecord:a4] outputRecord:a4];
    }
    else if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", @"VO2MaxInput"))
    {
      [(CLVO2MaxCloudKitManager *)self updateInputSystemFields:[(CLVO2MaxCloudKitManager *)self getSystemFieldsFromCKRecord:a4] inputRecord:a4];
    }
    else
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      uint64_t v7 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
      {
        id v8 = [a4 recordType];
        *(_DWORD *)buf = 138543362;
        id v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CloudKit reporting saved record of unexpected type: %{public}@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B5A80);
        }
        [a4 recordType];
        id v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:didSaveRecord:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
    }
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  if (self->_syncEngine == a3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    id v8 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544131;
      id v12 = [a5 domain];
      __int16 v13 = 2050;
      id v14 = [a5 code];
      __int16 v15 = 2114;
      id v16 = a5;
      __int16 v17 = 2113;
      id v18 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Sync engine failed to save CKRecord: error domain = %{public}@, code = %{public}ld, error = %{public}@, record = %{private}@", buf, 0x2Au);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      [a5 domain];
      [a5 code];
      id v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:failedToSaveRecord:error:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", @"VO2MaxOutput"))
    {
      p_outputSaveFailureCount = &self->fDailyStats.outputSaveFailureCount;
    }
    else
    {
      if (!objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", @"VO2MaxInput")) {
        goto LABEL_12;
      }
      p_outputSaveFailureCount = &self->fDailyStats.inputSaveFailureCount;
    }
    ++*p_outputSaveFailureCount;
LABEL_12:
    if (CKErrorIsCode())
    {
      -[CLVO2MaxCloudKitManager handleServerRecordChanged:](self, "handleServerRecordChanged:", [objc_msgSend(objc_msgSend(a5, "userInfo"), "objectForKeyedSubscript:", CKRecordChangedErrorServerRecordKey)];
    }
    else if (CKErrorIsCode())
    {
      [(CLVO2MaxCloudKitManager *)self handleUnknownItem:a4];
    }
    else if (CKErrorIsCode())
    {
      [(CLVO2MaxCloudKitManager *)self handleZoneNotFound:a4];
    }
    else if (CKErrorIsCode())
    {
      [(CLVO2MaxCloudKitManager *)self stopSyncing:0];
    }
    else if (CKErrorIsCode())
    {
      -[CLVO2MaxCloudKitManager deleteZone:[objc_msgSend(objc_msgSend(a4, "recordID"), "zoneID")];
    }
  }
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v5 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sync engine deleted CKRecord with CKRecordID %{public}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    long long v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:didDeleteRecordWithID:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v7 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138544130;
    id v10 = [a5 domain];
    __int16 v11 = 2050;
    id v12 = [a5 code];
    __int16 v13 = 2114;
    id v14 = a5;
    __int16 v15 = 2114;
    id v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Sync engine failed to delete CKRecord: error domain = %{public}@, code = %{public}ld, error = %{public}@, recordID = %{public}@", buf, 0x2Au);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    [a5 domain];
    [a5 code];
    id v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:failedToDeleteRecordWithID:error:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v7 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v18[0] = [a4 zoneName];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Sync engine asking if it should fetch changes for %{public}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    [a4 zoneName];
    __int16 v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:shouldFetchChangesForZoneID:]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  if (self->_syncEngine != a3) {
    goto LABEL_13;
  }
  if (self->fCloudKitDeletionState)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    id v8 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
    {
      int fCloudKitDeletionState = self->fCloudKitDeletionState;
      *(_DWORD *)buf = 67240450;
      LODWORD(v18[0]) = fCloudKitDeletionState;
      WORD2(v18[0]) = 2114;
      *(void *)((char *)v18 + 6) = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[CKManager] CloudKit deletion was requested (state=%{public}d). Not fetching changes for zone: %{public}@", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      id v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:shouldFetchChangesForZoneID:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
LABEL_13:
    LOBYTE(fFetchChangesForInputZone) = 0;
    return fFetchChangesForInputZone;
  }
  if (objc_msgSend(objc_msgSend(a4, "zoneName"), "isEqualToString:", @"VO2MaxOutputZone"))
  {
    BOOL fFetchChangesForInputZone = 1;
  }
  else if (objc_msgSend(objc_msgSend(a4, "zoneName"), "isEqualToString:", @"VO2MaxInputZone"))
  {
    BOOL fFetchChangesForInputZone = self->fFetchChangesForInputZone;
  }
  else
  {
    BOOL fFetchChangesForInputZone = 0;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  id v12 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [a4 zoneName];
    *(_DWORD *)buf = 67240450;
    LODWORD(v18[0]) = fFetchChangesForInputZone;
    WORD2(v18[0]) = 2114;
    *(void *)((char *)v18 + 6) = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Answering sync engine shouldFetchChangesForZone = %{public}d for zone: %{public}@", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    [a4 zoneName];
    id v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:shouldFetchChangesForZoneID:]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  return fFetchChangesForInputZone;
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  if (self->_syncEngine == a3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v7 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v13 = [a4 recordID];
      __int16 v14 = 2113;
      id v15 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sync engine fetched CKRecord with CKRecordID %{public}@, record = %{private}@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      [a4 recordID];
      id v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:didFetchRecord:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", @"VO2MaxOutput"))
    {
      [(CLVO2MaxCloudKitManager *)self handleFetchedOutputRecord:a4];
    }
    else if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", @"VO2MaxInput"))
    {
      [(CLVO2MaxCloudKitManager *)self handleFetchedInputRecord:a4];
    }
    else
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      id v8 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
      {
        id v9 = [a4 recordType];
        *(_DWORD *)buf = 138543362;
        id v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Fetched record of unexpected type: %{public}@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B5A80);
        }
        [a4 recordType];
        __int16 v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:didFetchRecord:]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
      }
    }
  }
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B5A80);
  }
  uint64_t v7 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = a4;
    __int16 v11 = 2114;
    id v12 = a5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Sync engine unexpectedly fetched deletion of CKRecord with CKRecordID %{public}@ of type %{public}@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    id v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:recordWithIDWasDeleted:recordType:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  if (self->_syncEngine == a3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B5A80);
    }
    uint64_t v5 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134349056;
      *(void *)((char *)&buf + 4) = [a4 length];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received updated metadata from sync engine, length = %{public}lu", (uint8_t *)&buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B5A80);
      }
      [a4 length];
      id v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:didUpdateMetadata:]", "%s\n", v8);
      if (v8 != (char *)&buf) {
        free(v8);
      }
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(void *)&long long buf = 0;
    *((CFAbsoluteTime *)&buf + 1) = Current;
    CFAbsoluteTime v10 = Current;
    id v11 = a4;
    uint64_t v7 = sub_1011E124C();
    sub_1011E1F54(v7, (uint64_t)&buf);
  }
}

- (CKContainer)container
{
  return self->_container;
}

- (CKSyncEngine)syncEngine
{
  return self->_syncEngine;
}

- (void).cxx_destruct
{
  value = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  id v4 = self->fDataProtectionClient.__ptr_.__value_;
  self->fDataProtectionClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8))(v4, a2);
  }
  uint64_t v5 = self->fRetrocomputeDb.__ptr_.__value_;
  self->fRetrocomputeDb.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(CLVO2MaxRetrocomputeRecorderDb *, SEL))(*(void *)v5 + 24))(v5, a2);
  }
  long long v6 = self->fStagingOutputStore.__ptr_.__value_;
  self->fStagingOutputStore.__ptr_.__value_ = 0;
  if (v6) {
    sub_1004B3ED0((uint64_t)&self->fStagingOutputStore, (uint64_t)v6);
  }
  cntrl = self->fInputStore.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  id v8 = self->fInputCache.__cntrl_;
  if (v8)
  {
    sub_1000DB0A0((std::__shared_weak_count *)v8);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((unsigned char *)self + 112) = 0;
  *((_DWORD *)self + 41) = -1;
  *(void *)&long long v2 = -1;
  *((void *)&v2 + 1) = -1;
  *(_OWORD *)((char *)self + 148) = v2;
  *(_OWORD *)((char *)self + 132) = v2;
  *(_OWORD *)((char *)self + 116) = v2;
  *((void *)self + 21) = 0xBFF0000000000000;
  return self;
}

@end