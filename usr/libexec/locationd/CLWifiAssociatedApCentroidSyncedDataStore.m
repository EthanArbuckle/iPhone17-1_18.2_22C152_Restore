@interface CLWifiAssociatedApCentroidSyncedDataStore
- (BOOL)addPendingRecordChanges:(id)a3 pendingRecordZoneChangeType:(int64_t)a4;
- (BOOL)addPendingRecordDeleteChanges:(id)a3;
- (BOOL)addPendingRecordSaveChanges:(id)a3;
- (BOOL)addRecord:(id)a3;
- (BOOL)areCentroidDbAndMetadataDbValid;
- (BOOL)deleteAllRecords;
- (BOOL)deleteRecordByMac:(CLMacAddress)a3;
- (BOOL)deleteRecordByMac:(CLMacAddress)a3 sync:(BOOL)a4;
- (BOOL)deleteRecordByMacString:(id)a3;
- (BOOL)isCentroidDatabaseValid;
- (BOOL)isMetadataDatabaseValid;
- (BOOL)isValid;
- (BOOL)purgeOlderRecords;
- (CKContainer)container;
- (CKSyncEngine)syncEngine;
- (CLWifiAssociatedApCentroidSyncedDataStore)init;
- (basic_string<char,)getBasicInfo;
- (id).cxx_construct;
- (id)fetchRecord:(id)a3;
- (id)getSyncEngineMetadata;
- (id)getUserRecordIDName;
- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4;
- (int)count;
- (vector<CLWifiAssociatedApCentroidDatabaseEntry,)fetchAllEntries;
- (void)createZone:(id)a3;
- (void)dealloc;
- (void)deleteSyncEngineMetadata;
- (void)deleteZone:(id)a3;
- (void)handleAccountChange:(id)a3;
- (void)handleDidFetchChanges:(id)a3;
- (void)handleDidFetchRecordZoneChanges:(id)a3;
- (void)handleDidSendChanges:(id)a3;
- (void)handleFetchedDatabaseChanges:(id)a3;
- (void)handleFetchedRecordDeletion:(id)a3;
- (void)handleFetchedRecordModification:(id)a3;
- (void)handleFetchedRecordZoneChanges:(id)a3;
- (void)handleSentDatabaseChanges:(id)a3;
- (void)handleSentRecordZoneChanges:(id)a3;
- (void)handleServerRecordChanged:(id)a3;
- (void)handleStateUpdate:(id)a3;
- (void)handleUnknownItem:(id)a3;
- (void)handleWillFetchChanges:(id)a3;
- (void)handleWillFetchRecordZoneChanges:(id)a3;
- (void)handleWillSendChanges:(id)a3;
- (void)handleZoneDeleted:(id)a3;
- (void)handleZoneNotFound:(id)a3;
- (void)initCentroidDatabase;
- (void)initCentroidDbAndMetadataDb;
- (void)initMetadataDatabase;
- (void)initializeSyncEngine;
- (void)persistSyncEngineMetadata:(id)a3;
- (void)purgeRecordsWithDistanceLargerThanThreshold:(const CLDaemonLocation *)a3;
- (void)reInitializeDatabasesAndSyncEngineIfNeeded;
- (void)setUserRecordIDName:(id)a3;
- (void)submitMetricsIfPossible:(BOOL)a3;
- (void)syncEngine:(id)a3 handleEvent:(id)a4;
@end

@implementation CLWifiAssociatedApCentroidSyncedDataStore

- (CLWifiAssociatedApCentroidSyncedDataStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLWifiAssociatedApCentroidSyncedDataStore;
  v2 = [(CLWifiAssociatedApCentroidSyncedDataStore *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(CLWifiAssociatedApCentroidSyncedDataStore *)v2 initCentroidDbAndMetadataDb];
    v3->_container = (CKContainer *)[objc_alloc((Class)CKContainer) initWithContainerID:[objc_alloc((Class)CKContainerID) initWithContainerIdentifier:@"com.apple.locationd.clx" environment:1]];
    [(CLWifiAssociatedApCentroidSyncedDataStore *)v3 initializeSyncEngine];
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    v4 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, init", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore init]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  container = self->_container;
  if (container)
  {

    self->_container = 0;
  }
  syncEngine = self->_syncEngine;
  if (syncEngine)
  {

    self->_syncEngine = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CLWifiAssociatedApCentroidSyncedDataStore;
  [(CLWifiAssociatedApCentroidSyncedDataStore *)&v5 dealloc];
}

- (void)initCentroidDatabase
{
  if (![(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid]) {
    operator new();
  }
}

- (void)initMetadataDatabase
{
  if (![(CLWifiAssociatedApCentroidSyncedDataStore *)self isMetadataDatabaseValid]) {
    operator new();
  }
}

- (void)initCentroidDbAndMetadataDb
{
  [(CLWifiAssociatedApCentroidSyncedDataStore *)self initCentroidDatabase];

  [(CLWifiAssociatedApCentroidSyncedDataStore *)self initMetadataDatabase];
}

- (BOOL)isCentroidDatabaseValid
{
  value = self->_centroidDb.__ptr_.__value_;
  if (value) {
    LOBYTE(value) = sub_10064E538((uint64_t)value);
  }
  return (char)value;
}

- (BOOL)isMetadataDatabaseValid
{
  value = self->_metadataDb.__ptr_.__value_;
  if (value) {
    LOBYTE(value) = sub_1002083F4((uint64_t)value);
  }
  return (char)value;
}

- (BOOL)areCentroidDbAndMetadataDbValid
{
  unsigned int v3 = [(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid];
  unsigned int v4 = [(CLWifiAssociatedApCentroidSyncedDataStore *)self isMetadataDatabaseValid];
  if (v3 != v4)
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    objc_super v5 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67240448;
      unsigned int v9 = v3;
      __int16 v10 = 1026;
      unsigned int v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "[CloudKit] WifiAssociatedApCentroidStore, centroid DB and metadata DB are in different states: %{public}d vs %{public}d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      objc_super v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore areCentroidDbAndMetadataDbValid]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  return v3 & v4;
}

- (BOOL)isValid
{
  BOOL v3 = [(CLWifiAssociatedApCentroidSyncedDataStore *)self areCentroidDbAndMetadataDbValid];
  if (v3) {
    LOBYTE(v3) = self->_syncEngine != 0;
  }
  return v3;
}

- (BOOL)addRecord:(id)a3
{
  if (![(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid]) {
    return 0;
  }
  sub_1008B56B0((uint64_t)v17, [a3 toNSDictionary]);
  objc_super v5 = +[NSMutableArray arrayWithCapacity:1];
  if (SHIBYTE(v19) < 0)
  {
    sub_1000DC48C(__p, (void *)v18, *((unint64_t *)&v18 + 1));
  }
  else
  {
    *(_OWORD *)__p = v18;
    uint64_t v25 = v19;
  }
  if (v25 >= 0) {
    objc_super v7 = __p;
  }
  else {
    objc_super v7 = (void **)__p[0];
  }
  [(NSMutableArray *)v5 addObject:+[NSString stringWithUTF8String:v7]];
  if (SHIBYTE(v25) < 0) {
    operator delete(__p[0]);
  }
  if ([(CLWifiAssociatedApCentroidSyncedDataStore *)self addPendingRecordSaveChanges:+[NSArray arrayWithArray:v5]])
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    v8 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      sub_1008B61F4((uint64_t)v17);
      unsigned int v9 = v25 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136380675;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordSaveChanges, success, entry: %{private}s", buf, 0xCu);
      if (SHIBYTE(v25) < 0) {
        operator delete(__p[0]);
      }
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      sub_1008B61F4((uint64_t)v17);
      if (v21 >= 0) {
        v13 = buf;
      }
      else {
        v13 = *(unsigned char **)buf;
      }
      int v22 = 136380675;
      v23 = v13;
      v14 = (char *)_os_log_send_and_compose_impl();
      if (v21 < 0) {
        operator delete(*(void **)buf);
      }
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore addRecord:]", "%s\n", v14);
      if (v14 != (char *)__p) {
        free(v14);
      }
    }
    char v6 = sub_100DB2378((uint64_t)self->_centroidDb.__ptr_.__value_);
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    __int16 v10 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      sub_1008B61F4((uint64_t)v17);
      unsigned int v11 = v25 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136380675;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordSaveChanges, warning, could not add to sync engine: %{private}s", buf, 0xCu);
      if (SHIBYTE(v25) < 0) {
        operator delete(__p[0]);
      }
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      sub_1008B61F4((uint64_t)v17);
      if (v21 >= 0) {
        v15 = buf;
      }
      else {
        v15 = *(unsigned char **)buf;
      }
      int v22 = 136380675;
      v23 = v15;
      v16 = (char *)_os_log_send_and_compose_impl();
      if (v21 < 0) {
        operator delete(*(void **)buf);
      }
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore addRecord:]", "%s\n", v16);
      if (v16 != (char *)__p) {
        free(v16);
      }
    }
    char v6 = 0;
  }
  sub_1008B5A70(v17);
  return v6;
}

- (id)fetchRecord:(id)a3
{
  if (![(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid]) {
    return 0;
  }
  sub_100134750(__p, (char *)[a3 UTF8String]);
  __int16 v10 = (void ***)sub_100B38F04((uint64_t)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  sub_100DB3A60((uint64_t)self->_centroidDb.__ptr_.__value_, &v10, __p);
  if (!v9) {
    return 0;
  }
  objc_super v5 = [[CLWifiAssociatedApCentroidDO alloc] initWithNSDictionary:sub_1008B5F6C((uint64_t)__p)];
  if (v9) {
    sub_1008B5A70(__p);
  }
  return v5;
}

- (vector<CLWifiAssociatedApCentroidDatabaseEntry,)fetchAllEntries
{
  result = (vector<CLWifiAssociatedApCentroidDatabaseEntry, std::allocator<CLWifiAssociatedApCentroidDatabaseEntry>> *)[(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid];
  if (result)
  {
    value = self->_centroidDb.__ptr_.__value_;
    sub_100DB39D0((uint64_t)value, retstr);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  return result;
}

- (BOOL)deleteAllRecords
{
  if (![(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid]) {
    return 0;
  }
  sub_100DB39D0((uint64_t)self->_centroidDb.__ptr_.__value_, &v12);
  if (sub_100DB4828((uint64_t)self->_centroidDb.__ptr_.__value_))
  {
    BOOL v3 = +[NSMutableArray arrayWithCapacity:0x6DB6DB6DB6DB6DB7 * ((v13 - v12) >> 4)];
    uint64_t v4 = v12;
    for (uint64_t i = v13; v4 != i; v4 += 112)
    {
      if (*(char *)(v4 + 103) < 0)
      {
        sub_1000DC48C(__p, *(void **)(v4 + 80), *(void *)(v4 + 88));
      }
      else
      {
        long long v6 = *(_OWORD *)(v4 + 80);
        uint64_t v11 = *(void *)(v4 + 96);
        *(_OWORD *)__p = v6;
      }
      if (v11 >= 0) {
        objc_super v7 = __p;
      }
      else {
        objc_super v7 = (void **)__p[0];
      }
      [(NSMutableArray *)v3 addObject:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7, __p[0], __p[1], v11)];
      if (SHIBYTE(v11) < 0) {
        operator delete(__p[0]);
      }
    }
    BOOL v8 = [(CLWifiAssociatedApCentroidSyncedDataStore *)self addPendingRecordDeleteChanges:+[NSArray arrayWithArray:v3]];
  }
  else
  {
    BOOL v8 = 0;
  }
  __p[0] = &v12;
  sub_100946620((void ***)__p);
  return v8;
}

- (BOOL)deleteRecordByMacString:(id)a3
{
  sub_100134750(__p, (char *)[a3 UTF8String]);
  uint64_t v4 = sub_100B38F04((uint64_t)__p);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return [(CLWifiAssociatedApCentroidSyncedDataStore *)self deleteRecordByMac:v4];
}

- (BOOL)deleteRecordByMac:(CLMacAddress)a3 sync:(BOOL)a4
{
  BOOL v4 = a4;
  var0 = (void ***)a3.var0;
  if ([(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid]
    && (sub_100DB3A60((uint64_t)self->_centroidDb.__ptr_.__value_, &var0, v11), v14))
  {
    LODWORD(v6) = sub_100DB3F14((uint64_t)self->_centroidDb.__ptr_.__value_);
    if (v6 & v4)
    {
      long long v6 = +[NSMutableArray arrayWithCapacity:1];
      if (SHIBYTE(v13) < 0)
      {
        sub_1000DC48C(__p, (void *)v12, *((unint64_t *)&v12 + 1));
      }
      else
      {
        *(_OWORD *)__p = v12;
        uint64_t v10 = v13;
      }
      if (v10 >= 0) {
        char v7 = __p;
      }
      else {
        char v7 = (void **)__p[0];
      }
      [(NSMutableArray *)v6 addObject:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7, __p[0], __p[1], v10)];
      if (SHIBYTE(v10) < 0) {
        operator delete(__p[0]);
      }
      LOBYTE(v6) = [(CLWifiAssociatedApCentroidSyncedDataStore *)self addPendingRecordDeleteChanges:+[NSArray arrayWithArray:v6]];
    }
    if (v14) {
      sub_1008B5A70(v11);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return (char)v6;
}

- (BOOL)deleteRecordByMac:(CLMacAddress)a3
{
  return [(CLWifiAssociatedApCentroidSyncedDataStore *)self deleteRecordByMac:a3.var0 sync:1];
}

- (BOOL)purgeOlderRecords
{
  if ([(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid])
  {
    BOOL v3 = sub_1014122A8();
    double v18 = sub_101412DFC(v3);
    value = self->_centroidDb.__ptr_.__value_;
    *(void *)buf = CFAbsoluteTimeGetCurrent();
    sub_100DB5600((uint64_t)value, &v18, (double *)buf, (uint64_t *)&v16);
    objc_super v5 = v16;
    long long v6 = v17;
    for (int i = 1; v5 != v6; v5 += 14)
    {
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      BOOL v8 = qword_1024193A8;
      if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
      {
        double v9 = v18;
        *(void *)uint64_t v19 = CFAbsoluteTimeGetCurrent();
        double v10 = sub_1008B61C8((uint64_t)v5, (double *)v19);
        *(_DWORD *)buf = 134283777;
        *(double *)&uint8_t buf[4] = v9;
        __int16 v23 = 2049;
        double v24 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, purging local records older than %{private}.1f, age, %{private}.1f", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193A0 != -1) {
          dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
        }
        double v11 = v18;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        double v12 = sub_1008B61C8((uint64_t)v5, &Current);
        *(_DWORD *)uint64_t v19 = 134283777;
        *(double *)&v19[4] = v11;
        __int16 v20 = 2049;
        double v21 = v12;
        uint64_t v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore purgeOlderRecords]", "%s\n", v13);
        if (v13 != buf) {
          free(v13);
        }
      }
      i &= [(CLWifiAssociatedApCentroidSyncedDataStore *)self deleteRecordByMac:*v5 sync:0];
    }
    *(void *)buf = &v16;
    sub_100946620((void ***)buf);
  }
  else
  {
    LOBYTE(i) = 0;
  }
  return i;
}

- (void)purgeRecordsWithDistanceLargerThanThreshold:(const CLDaemonLocation *)a3
{
  if ([(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid])
  {
    value = self->_centroidDb.__ptr_.__value_;
    sub_100DB5758((uint64_t)value, (uint64_t)a3);
  }
}

- (int)count
{
  if (![(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid]) {
    return -1;
  }
  value = self->_centroidDb.__ptr_.__value_;

  return sub_100DB50A8((uint64_t)value);
}

- (basic_string<char,)getBasicInfo
{
  v2 = v1;
  if ([v1 isCentroidDatabaseValid])
  {
    uint64_t v4 = v2[2];
    sub_100DB5CC8(v4);
  }
  else
  {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_100134750(retstr, "invalid database");
  }
  return result;
}

- (void)submitMetricsIfPossible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid])
  {
    value = self->_centroidDb.__ptr_.__value_;
    sub_100DB5D58((uint64_t)value, v3);
  }
}

- (void)reInitializeDatabasesAndSyncEngineIfNeeded
{
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
  }
  BOOL v3 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, re-initialize databases and sync engine if needed", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore reInitializeDatabasesAndSyncEngineIfNeeded]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLWifiAssociatedApCentroidSyncedDataStore *)self initCentroidDbAndMetadataDb];
  [(CLWifiAssociatedApCentroidSyncedDataStore *)self initializeSyncEngine];
}

- (void)initializeSyncEngine
{
  if ([(CLWifiAssociatedApCentroidSyncedDataStore *)self areCentroidDbAndMetadataDbValid])
  {
    if (!self->_syncEngine)
    {
      id v3 = [(CLWifiAssociatedApCentroidSyncedDataStore *)self getSyncEngineMetadata];
      id v4 = [objc_alloc((Class)CKSyncEngineConfiguration) initWithDatabase:-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase") stateSerialization:v3 delegate:self];
      [v4 setApsMachServiceName:@"com.apple.aps.locationd"];
      [v4 setPriority:2];
      self->_syncEngine = (CKSyncEngine *)[objc_alloc((Class)CKSyncEngine) initWithConfiguration:v4];
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      objc_super v5 = qword_1024193A8;
      if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
      {
        long long v6 = "yes";
        if (!v3) {
          long long v6 = "no";
        }
        *(_DWORD *)buf = 136315138;
        double v10 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, initializeSyncEngine with metadata? %s", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193A0 != -1) {
          dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
        }
LABEL_21:
        BOOL v8 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore initializeSyncEngine]", "%s\n", v8);
        if (v8 != (char *)buf) {
          free(v8);
        }
      }
    }
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    char v7 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, not initializing sync engine due to invalid databases. Most likely device is locked.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      goto LABEL_21;
    }
  }
}

- (id)getSyncEngineMetadata
{
  if (![(CLWifiAssociatedApCentroidSyncedDataStore *)self isMetadataDatabaseValid])
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    long long v6 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, could not get sync engine metadata due to invalid database. Most likely device is locked.", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    LOWORD(v9) = 0;
    goto LABEL_22;
  }
  sub_100F94260((uint64_t)self->_metadataDb.__ptr_.__value_);
  if (v3)
  {
    uint64_t v8 = 0;
    id result = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
    if (!v8) {
      return result;
    }
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    objc_super v5 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, failed to read metadata. Error: %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      int v9 = 138412290;
      uint64_t v10 = v8;
LABEL_22:
      char v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore getSyncEngineMetadata]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  return 0;
}

- (void)persistSyncEngineMetadata:(id)a3
{
  if ([(CLWifiAssociatedApCentroidSyncedDataStore *)self isMetadataDatabaseValid])
  {
    uint64_t v10 = 0;
    objc_super v5 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v10];
    if (!v10)
    {
      int v9 = v5;
      *(void *)&buf[0] = CFAbsoluteTimeGetCurrent();
      *((void *)&buf[0] + 1) = v9;
      sub_100F93B24((uint64_t)self->_metadataDb.__ptr_.__value_);
      return;
    }
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    long long v6 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 138543362;
      *(void *)((char *)buf + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, failed to write metadata. Error: %{public}@", (uint8_t *)buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      int v11 = 138543362;
      uint64_t v12 = v10;
LABEL_19:
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore persistSyncEngineMetadata:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    char v7 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, could not persist sync engine metadata due to invalid database. Most likely device is locked.", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      LOWORD(v11) = 0;
      goto LABEL_19;
    }
  }
}

- (void)deleteSyncEngineMetadata
{
  if ([(CLWifiAssociatedApCentroidSyncedDataStore *)self isMetadataDatabaseValid])
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    uint64_t v3 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Deleting sync engine metadata", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      objc_super v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore deleteSyncEngineMetadata]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
    sub_100F94740((uint64_t)self->_metadataDb.__ptr_.__value_);
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v4 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, could not delete sync engine metadata due to invalid database. Most likely device is locked.", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      long long v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore deleteSyncEngineMetadata]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (BOOL)addPendingRecordChanges:(id)a3 pendingRecordZoneChangeType:(int64_t)a4
{
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
  }
  char v7 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v25 = @"com.apple.clx.cloudkit.zone";
    __int16 v26 = 2112;
    id v27 = a3;
    __int16 v28 = 2048;
    int64_t v29 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordChanges - zoneName: %@, recordNames: %@, type: %ld", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    int v18 = 138412802;
    CFStringRef v19 = @"com.apple.clx.cloudkit.zone";
    __int16 v20 = 2112;
    id v21 = a3;
    __int16 v22 = 2048;
    int64_t v23 = a4;
    uint64_t v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordChanges:pendingRecordZoneChangeType:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  syncEngine = self->_syncEngine;
  if (syncEngine)
  {
    if (!a3) {
      goto LABEL_18;
    }
  }
  else
  {
    [(CLWifiAssociatedApCentroidSyncedDataStore *)self initializeSyncEngine];
    syncEngine = self->_syncEngine;
    if (!a3)
    {
LABEL_18:
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      uint64_t v12 = qword_1024193A8;
      if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, warning, could not add pending changes", buf, 2u);
      }
      BOOL v11 = sub_10013D1A0(115, 2);
      if (v11)
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193A0 != -1) {
          dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
        }
        LOWORD(v18) = 0;
        char v14 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordChanges:pendingRecordZoneChangeType:]", "%s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
        LOBYTE(v11) = 0;
      }
      return v11;
    }
  }
  if (!syncEngine || ![a3 count]) {
    goto LABEL_18;
  }
  int v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a3 count]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100B305E4;
  v17[3] = &unk_1022E5A30;
  v17[5] = v9;
  v17[6] = a4;
  v17[4] = @"com.apple.clx.cloudkit.zone";
  [a3 enumerateObjectsUsingBlock:v17];
  [(CKSyncEngineState *)[(CKSyncEngine *)self->_syncEngine state] addPendingRecordZoneChanges:v9];
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
  }
  uint64_t v10 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, successfully added pending changes", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    LOWORD(v18) = 0;
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordChanges:pendingRecordZoneChangeType:]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  LOBYTE(v11) = 1;
  return v11;
}

- (BOOL)addPendingRecordSaveChanges:(id)a3
{
  return [(CLWifiAssociatedApCentroidSyncedDataStore *)self addPendingRecordChanges:a3 pendingRecordZoneChangeType:CKSyncEnginePendingRecordZoneChangeTypeSave];
}

- (BOOL)addPendingRecordDeleteChanges:(id)a3
{
  return [(CLWifiAssociatedApCentroidSyncedDataStore *)self addPendingRecordChanges:a3 pendingRecordZoneChangeType:CKSyncEnginePendingRecordZoneChangeTypeDelete];
}

- (void)createZone:(id)a3
{
  if (a3 && self->_syncEngine)
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    objc_super v5 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Creating new zone with ZoneID: %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      int v11 = 138412290;
      id v12 = a3;
      int v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore createZone:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    id v6 = [objc_alloc((Class)CKRecordZone) initWithZoneID:a3];
    id v7 = [objc_alloc((Class)CKSyncEnginePendingZoneSave) initWithZone:v6];
    uint64_t v8 = [(CKSyncEngine *)self->_syncEngine state];
    id v10 = v7;
    [(CKSyncEngineState *)v8 addPendingDatabaseChanges:+[NSArray arrayWithObjects:&v10 count:1]];
  }
}

- (void)deleteZone:(id)a3
{
  if (a3)
  {
    if (self->_syncEngine)
    {
      id v4 = [objc_alloc((Class)CKSyncEnginePendingZoneDelete) initWithZoneID:a3];
      objc_super v5 = [(CKSyncEngine *)self->_syncEngine state];
      id v6 = v4;
      [(CKSyncEngineState *)v5 addPendingDatabaseChanges:+[NSArray arrayWithObjects:&v6 count:1]];
    }
  }
}

- (void)handleZoneDeleted:(id)a3
{
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
  }
  uint64_t v3 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, handleZoneDeleted. Do we need to do anything here?", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleZoneDeleted:]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)handleServerRecordChanged:(id)a3
{
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
  }
  objc_super v5 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, handle ServerRecordChanged", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    int v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleServerRecordChanged:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  if (a3)
  {
    if (self->_syncEngine)
    {
      value = self->_centroidDb.__ptr_.__value_;
      if (value)
      {
        if ((sub_100DB5008((uint64_t)value, [a3 recordID], a3) & 1) == 0)
        {
          if (qword_1024193A0 != -1) {
            dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
          }
          id v7 = qword_1024193A8;
          if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, ServerRecordChanged: Failed to update local system fields", buf, 2u);
          }
          if (sub_10013D1A0(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024193A0 == -1)
            {
LABEL_28:
              id v10 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleServerRecordChanged:]", "%s\n", v10);
              if (v10 != (char *)buf) {
                free(v10);
              }
              return;
            }
LABEL_30:
            dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
            goto LABEL_28;
          }
        }
      }
    }
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    uint64_t v8 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, could not handle server record change, invalid server record", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 == -1) {
        goto LABEL_28;
      }
      goto LABEL_30;
    }
  }
}

- (void)handleUnknownItem:(id)a3
{
  if (a3 && self->_syncEngine)
  {
    if ([(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid]
      && (sub_100DB5008((uint64_t)self->_centroidDb.__ptr_.__value_, [a3 recordID], 0) & 1) == 0)
    {
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      objc_super v5 = qword_1024193A8;
      if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, UnknownItem: Failed to update local system fields", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193A0 != -1) {
          dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
        }
        id v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleUnknownItem:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
    }
    id v6 = objc_alloc((Class)CKSyncEnginePendingRecordZoneChange);
    id v7 = [a3 recordID];
    id v8 = [v6 initWithRecordID:v7 type:CKSyncEnginePendingRecordZoneChangeTypeSave];
    int v9 = [(CKSyncEngine *)self->_syncEngine state];
    id v11 = v8;
    [(CKSyncEngineState *)v9 addPendingRecordZoneChanges:+[NSArray arrayWithObjects:&v11 count:1]];
  }
}

- (void)handleZoneNotFound:(id)a3
{
  if (a3)
  {
    if (self->_syncEngine)
    {
      -[CLWifiAssociatedApCentroidSyncedDataStore createZone:](self, "createZone:", [objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID")]);
      id v5 = objc_alloc((Class)CKSyncEnginePendingRecordZoneChange);
      id v6 = [a3 recordID];
      id v7 = [v5 initWithRecordID:v6 type:CKSyncEnginePendingRecordZoneChangeTypeSave];
      id v8 = [(CKSyncEngine *)self->_syncEngine state];
      id v9 = v7;
      [(CKSyncEngineState *)v8 addPendingRecordZoneChanges:+[NSArray arrayWithObjects:&v9 count:1]];
    }
  }
}

- (void)setUserRecordIDName:(id)a3
{
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
  }
  id v4 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, Setting userRecordIDName to %{private}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore setUserRecordIDName:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  uint64_t v5 = sub_1000A6958();
  sub_1004D3518(v5, @"kWifiAssociatedApCentroidCloudKitUserID", (char *)[a3 UTF8String]);
  uint64_t v6 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v6 + 944))();
}

- (id)getUserRecordIDName
{
  memset(&__p, 0, sizeof(__p));
  uint64_t v2 = sub_1000A6958();
  sub_1000A7CF8(v2, @"kWifiAssociatedApCentroidCloudKitUserID", &__p);
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

- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4
{
  if (self->_syncEngine != a3) {
    return 0;
  }
  id v6 = [objc_msgSend(a4, "options") zoneIDs];
  id v7 = [(CKSyncEngineState *)[(CKSyncEngine *)self->_syncEngine state] pendingRecordZoneChanges];
  if (v6)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v44;
      do
      {
        for (int i = 0; i != v10; int i = (char *)i + 1)
        {
          if (*(void *)v44 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (objc_msgSend(v6, "containsObject:", objc_msgSend(objc_msgSend(v13, "recordID"), "zoneID"))) {
            [v8 addObject:v13];
          }
        }
        id v10 = [(NSArray *)v7 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v10);
    }
    id v7 = +[NSArray arrayWithArray:v8];
  }
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100B31A64;
  v42[3] = &unk_1022B6448;
  v42[4] = self;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v33 = [objc_alloc((Class)CKSyncEngineRecordZoneChangeBatch) initWithPendingChanges:v7 recordProvider:v42];
  id v14 = [v33 recordsToSave];
  id v15 = [v14 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v39;
    do
    {
      int v18 = 0;
      do
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v38 + 1) + 8 * (void)v18);
        if (qword_1024193A0 != -1) {
          dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
        }
        __int16 v20 = qword_1024193A8;
        if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          uint64_t v51 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, nextRecordZoneChangeBatch, record to save: %{private}@", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024193A0 != -1) {
            dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
          }
          int v48 = 138477827;
          uint64_t v49 = v19;
          id v21 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore syncEngine:nextRecordZoneChangeBatchForContext:]", "%s\n", v21);
          if (v21 != (char *)buf) {
            free(v21);
          }
        }
        int v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v22 = [v14 countByEnumeratingWithState:&v38 objects:v52 count:16];
      id v16 = v22;
    }
    while (v22);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = v33;
  id v23 = [v33 recordIDsToDelete];
  id v24 = [v23 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v35;
    do
    {
      id v27 = 0;
      do
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v27);
        if (qword_1024193A0 != -1) {
          dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
        }
        int64_t v29 = qword_1024193A8;
        if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          uint64_t v51 = v28;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, nextRecordZoneChangeBatch, record to delete: %{private}@", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024193A0 != -1) {
            dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
          }
          int v48 = 138477827;
          uint64_t v49 = v28;
          v30 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore syncEngine:nextRecordZoneChangeBatchForContext:]", "%s\n", v30);
          if (v30 != (char *)buf) {
            free(v30);
          }
        }
        id v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v31 = [v23 countByEnumeratingWithState:&v34 objects:v47 count:16];
      id v25 = v31;
    }
    while (v31);
    return v33;
  }
  return v4;
}

- (void)syncEngine:(id)a3 handleEvent:(id)a4
{
  if (a4)
  {
    if (self->_syncEngine == a3)
    {
      switch((unint64_t)[a4 type])
      {
        case 0uLL:
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleStateUpdate:a4];
          break;
        case 1uLL:
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleAccountChange:a4];
          break;
        case 2uLL:
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleFetchedDatabaseChanges:a4];
          break;
        case 3uLL:
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleFetchedRecordZoneChanges:a4];
          break;
        case 4uLL:
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleSentDatabaseChanges:a4];
          break;
        case 5uLL:
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleSentRecordZoneChanges:a4];
          break;
        case 6uLL:
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleWillFetchChanges:a4];
          break;
        case 7uLL:
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleWillFetchRecordZoneChanges:a4];
          break;
        case 8uLL:
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleDidFetchRecordZoneChanges:a4];
          break;
        case 9uLL:
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleDidFetchChanges:a4];
          break;
        case 0xAuLL:
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleWillSendChanges:a4];
          break;
        case 0xBuLL:
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleDidSendChanges:a4];
          break;
        default:
          return;
      }
    }
    else
    {
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      id v6 = qword_1024193A8;
      if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v11 = a3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine %{private}@ doesn't match internal reference.", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193A0 == -1)
        {
LABEL_54:
          id v9 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore syncEngine:handleEvent:]", "%s\n", v9);
          if (v9 != (char *)buf) {
            free(v9);
          }
          return;
        }
LABEL_56:
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
        goto LABEL_54;
      }
    }
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v7 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine %{private}@ called back for invalid event", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 == -1) {
        goto LABEL_54;
      }
      goto LABEL_56;
    }
  }
}

- (void)handleStateUpdate:(id)a3
{
  id v5 = [a3 stateUpdateEvent];
  if (v5)
  {
    id v6 = [v5 stateSerialization];
    [(CLWifiAssociatedApCentroidSyncedDataStore *)self persistSyncEngineMetadata:v6];
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v7 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineStateUpdateEvent (%@)", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      id v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleStateUpdate:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)handleAccountChange:(id)a3
{
  id v5 = [a3 accountChangeEvent];
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 changeType];
    if (v7 == (id)2)
    {
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      id v12 = qword_1024193A8;
      if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, iCloud switched accounts. Deleting all records and sync engine metadata.", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193A0 != -1) {
          dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
        }
        id v16 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]", "%s\n", v16);
        if (v16 != (char *)buf) {
          free(v16);
        }
      }
      if ([(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid]) {
        sub_100DB4828((uint64_t)self->_centroidDb.__ptr_.__value_);
      }
      [(CLWifiAssociatedApCentroidSyncedDataStore *)self deleteSyncEngineMetadata];
    }
    else
    {
      if (v7 != (id)1)
      {
        if (v7) {
          return;
        }
        id v8 = [(CLWifiAssociatedApCentroidSyncedDataStore *)self getUserRecordIDName];
        if (v8) {
          LOBYTE(v8) = [v8 isEqualToString:[v6 currentUser].recordName] ^ 1;
        }
        [(CLWifiAssociatedApCentroidSyncedDataStore *)self deleteSyncEngineMetadata];
        if ([(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid])
        {
          if (v8)
          {
            if (qword_1024193A0 != -1) {
              dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
            }
            id v9 = qword_1024193A8;
            if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User switched account", buf, 2u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024193A0 != -1) {
                dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
              }
              uint64_t v17 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]", "%s\n", v17);
              if (v17 != (char *)buf) {
                free(v17);
              }
            }
            sub_100DB4828((uint64_t)self->_centroidDb.__ptr_.__value_);
          }
          else
          {
            if (qword_1024193A0 != -1) {
              dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
            }
            id v14 = qword_1024193A8;
            if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed in with same account", buf, 2u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024193A0 != -1) {
                dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
              }
              int v18 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]", "%s\n", v18);
              if (v18 != (char *)buf) {
                free(v18);
              }
            }
          }
        }
        -[CLWifiAssociatedApCentroidSyncedDataStore setUserRecordIDName:[objc_msgSend(objc_msgSend(v6, "currentUser"), "recordName")];
        if (qword_1024193A0 != -1) {
          dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
        }
        id v15 = qword_1024193A8;
        if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed in.", buf, 2u);
        }
        if (!sub_10013D1A0(115, 2)) {
          return;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1024193A0 == -1) {
          goto LABEL_54;
        }
LABEL_65:
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
LABEL_54:
        id v11 = (uint8_t *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]", "%s\n");
LABEL_55:
        if (v11 != buf) {
          free(v11);
        }
        return;
      }
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      uint64_t v13 = qword_1024193A8;
      if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed out.", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193A0 == -1) {
          goto LABEL_54;
        }
        goto LABEL_65;
      }
    }
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v10 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineAccountChangeEvent (%@)", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      id v11 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]", "%s\n");
      goto LABEL_55;
    }
  }
}

- (void)handleFetchedDatabaseChanges:(id)a3
{
  id v4 = [a3 fetchedDatabaseChangesEvent];
  if (v4)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v26 = v4;
    id v5 = [v4 modifications];
    id v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v32;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v9);
          if (qword_1024193A0 != -1) {
            dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
          }
          id v11 = qword_1024193A8;
          if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            id v40 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, CKRecordZone modification %{private}@", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024193A0 != -1) {
              dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
            }
            int v37 = 138477827;
            id v38 = v10;
            id v12 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:]", "%s\n", v12);
            if (v12 != (char *)buf) {
              free(v12);
            }
          }
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v13 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
        id v7 = v13;
      }
      while (v13);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = [v26 deletions];
    id v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        int v18 = 0;
        do
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v18);
          if (qword_1024193A0 != -1) {
            dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
          }
          id v20 = qword_1024193A8;
          if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            id v40 = v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, CKRecordZone deletion %{private}@", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024193A0 != -1) {
              dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
            }
            int v37 = 138477827;
            id v38 = v19;
            id v21 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:]", "%s\n", v21);
            if (v21 != (char *)buf) {
              free(v21);
            }
          }
          int v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v22 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
        id v16 = v22;
      }
      while (v22);
    }
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v23 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, Fetched database changes event", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      LOWORD(v37) = 0;
      id v24 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:]", "%s\n");
LABEL_53:
      if (v24 != buf) {
        free(v24);
      }
    }
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v25 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v40 = a3;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineFetchedDatabaseChangesEvent: %{private}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      int v37 = 138477827;
      id v38 = a3;
      id v24 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:]", "%s\n");
      goto LABEL_53;
    }
  }
}

- (void)handleFetchedRecordZoneChanges:(id)a3
{
  id v5 = [a3 fetchedRecordZoneChangesEvent];
  if (v5)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v27 = v5;
    id v6 = [v5 modifications];
    id v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v10);
          if (qword_1024193A0 != -1) {
            dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
          }
          id v12 = qword_1024193A8;
          if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            id v41 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, CKRecord modification: %{private}@", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024193A0 != -1) {
              dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
            }
            int v38 = 138477827;
            id v39 = v11;
            id v13 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:]", "%s\n", v13);
            if (v13 != (char *)buf) {
              free(v13);
            }
          }
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleFetchedRecordModification:v11];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v14 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
        id v8 = v14;
      }
      while (v14);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v15 = [v27 deletions];
    id v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v19);
          if (qword_1024193A0 != -1) {
            dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
          }
          id v21 = qword_1024193A8;
          if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            id v41 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, CKRecord deletion: %{private}@", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024193A0 != -1) {
              dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
            }
            int v38 = 138477827;
            id v39 = v20;
            id v22 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:]", "%s\n", v22);
            if (v22 != (char *)buf) {
              free(v22);
            }
          }
          [(CLWifiAssociatedApCentroidSyncedDataStore *)self handleFetchedRecordDeletion:v20];
          uint64_t v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v23 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
        id v17 = v23;
      }
      while (v23);
    }
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v24 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, Fetched record zone event", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      LOWORD(v38) = 0;
      id v25 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:]", "%s\n");
LABEL_53:
      if (v25 != buf) {
        free(v25);
      }
    }
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    uint64_t v26 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v41 = a3;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineFetchedRecordZoneChangesEvent: %{private}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      int v38 = 138477827;
      id v39 = a3;
      id v25 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:]", "%s\n");
      goto LABEL_53;
    }
  }
}

- (void)handleFetchedRecordModification:(id)a3
{
  if (!a3)
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v10 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, warning, nil record in handleFetchedRecordModification", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 == -1) {
      goto LABEL_38;
    }
LABEL_40:
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
LABEL_38:
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordModification:]", "%s\n", v9);
    if (v9 == (char *)buf) {
      return;
    }
    goto LABEL_39;
  }
  id v5 = [a3 recordType];
  if (!v5 || ([v5 isEqualToString:@"WifiAssociatedApCentroid"] & 1) == 0)
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v8 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = [a3 recordType];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, ignoring record type: %{private}@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    [a3 recordType];
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordModification:]", "%s\n", v9);
    if (v9 == (char *)buf) {
      return;
    }
LABEL_39:
    free(v9);
    return;
  }
  if ([(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid])
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v6 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, inserting record %{private}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      id v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordModification:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    value = self->_centroidDb.__ptr_.__value_;
    sub_1008B5178((uint64_t)buf, a3);
    sub_100DB2378((uint64_t)value);
    sub_1008B5A70(buf);
    return;
  }
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
  }
  id v11 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, warning, invalid database in handleFetchedRecordModification", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 == -1) {
      goto LABEL_38;
    }
    goto LABEL_40;
  }
}

- (void)handleFetchedRecordDeletion:(id)a3
{
  if (!a3)
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v10 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, warning, nil record in handleFetchedRecordDeletion", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 == -1) {
      goto LABEL_38;
    }
LABEL_40:
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
LABEL_38:
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordDeletion:]", "%s\n", v9);
    if (v9 == (char *)buf) {
      return;
    }
    goto LABEL_39;
  }
  id v5 = [a3 recordType];
  if (!v5 || ([v5 isEqualToString:@"WifiAssociatedApCentroid"] & 1) == 0)
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v8 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = [a3 recordType];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, ignoring record type: %{private}@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    [a3 recordType];
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordDeletion:]", "%s\n", v9);
    if (v9 == (char *)buf) {
      return;
    }
LABEL_39:
    free(v9);
    return;
  }
  if ([(CLWifiAssociatedApCentroidSyncedDataStore *)self isCentroidDatabaseValid])
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v6 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, deleting record %{private}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      id v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordDeletion:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    value = self->_centroidDb.__ptr_.__value_;
    [a3 recordID];
    sub_100DB4370((uint64_t)value);
    return;
  }
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
  }
  id v11 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, warning, invalid database in handleFetchedRecordDeletion", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 == -1) {
      goto LABEL_38;
    }
    goto LABEL_40;
  }
}

- (void)handleSentDatabaseChanges:(id)a3
{
  id v5 = [a3 sentDatabaseChangesEvent];
  if (v5)
  {
    id v6 = v5;
    [objc_msgSend(v5, "savedZones") enumerateObjectsUsingBlock:&stru_1022E5A50];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100B3475C;
    v10[3] = &unk_1022B64D8;
    v10[4] = self;
    [objc_msgSend(v6, "deletedZoneIDs") enumerateObjectsUsingBlock:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100B3492C;
    v9[3] = &unk_1022B6500;
    v9[4] = self;
    [objc_msgSend(v6, "failedZoneSaves") enumerateObjectsUsingBlock:v9];
    [objc_msgSend(objc_msgSend(v6, "failedZoneDeletes"), "enumerateKeysAndObjectsUsingBlock:", &stru_1022E5A70);
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v7 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineSentDatabaseChangesEvent: %{private}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      int v11 = 138477827;
      id v12 = a3;
      id v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleSentDatabaseChanges:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)handleSentRecordZoneChanges:(id)a3
{
  id v5 = [a3 sentRecordZoneChangesEvent];
  if (v5)
  {
    id v6 = v5;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100B35018;
    v11[3] = &unk_1022B6470;
    v11[4] = self;
    [objc_msgSend(v5, "savedRecords") enumerateObjectsUsingBlock:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100B35328;
    v10[3] = &unk_1022B6568;
    v10[4] = self;
    [objc_msgSend(v6, "deletedRecordIDs") enumerateObjectsUsingBlock:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100B3562C;
    v9[3] = &unk_1022B6590;
    v9[4] = self;
    [objc_msgSend(v6, "failedRecordSaves") enumerateObjectsUsingBlock:v9];
    [objc_msgSend(v6, "failedRecordDeletes") enumerateKeysAndObjectsUsingBlock:&stru_1022E5A90];
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v7 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineSentRecordZoneChangesEvent: %{private}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      int v12 = 138477827;
      id v13 = a3;
      id v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleSentRecordZoneChanges:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)handleWillFetchChanges:(id)a3
{
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
  }
  uint64_t v3 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine is about to fetch changes", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillFetchChanges:]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)handleWillFetchRecordZoneChanges:(id)a3
{
  id v4 = [a3 willFetchRecordZoneChangesEvent];
  if (v4)
  {
    id v5 = v4;
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v6 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = [v5 zoneID];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine is about to fetch zone changes for zoneID %{public}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      [v5 zoneID];
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillFetchRecordZoneChanges:]", "%s\n");
LABEL_19:
      if (v7 != buf) {
        free(v7);
      }
    }
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v8 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineWillFetchRecordZoneChangesEvent: %{private}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillFetchRecordZoneChanges:]", "%s\n");
      goto LABEL_19;
    }
  }
}

- (void)handleDidFetchRecordZoneChanges:(id)a3
{
  id v4 = [a3 didFetchRecordZoneChangesEvent];
  if (v4)
  {
    id v5 = v4;
    if ([v4 error])
    {
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      id v6 = qword_1024193A8;
      if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v11 = [v5 zoneID];
        __int16 v12 = 2114;
        id v13 = [v5 error];
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Error fetching record zone changes for %{public}@. Error: %{public}@", buf, 0x16u);
      }
      if (!sub_10013D1A0(115, 0)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      [v5 zoneID];
      [v5 error];
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchRecordZoneChanges:]", "%s\n");
    }
    else
    {
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      uint64_t v9 = qword_1024193A8;
      if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v11 = [v5 zoneID];
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine successfully fetched zone changes for zoneID %{public}@", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      [v5 zoneID];
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchRecordZoneChanges:]", "%s\n");
    }
    if (v7 != buf) {
LABEL_30:
    }
      free(v7);
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v8 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineDidFetchRecordZoneChangesEvent: %{private}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
      }
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchRecordZoneChanges:]", "%s\n", (const char *)v7);
      if (v7 != buf) {
        goto LABEL_30;
      }
    }
  }
}

- (void)handleDidFetchChanges:(id)a3
{
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
  }
  uint64_t v3 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine did fetch changes", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchChanges:]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)handleWillSendChanges:(id)a3
{
  id v4 = [a3 willSendChangesEvent];
  if (v4)
  {
    id v5 = v4;
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v6 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v10) = [v5 context].reason;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine will send changes. Reason: %d", buf, 8u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    [objc_msgSend(v5, "context") reason];
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillSendChanges:]", "%s\n", v7);
    if (v7 == (char *)buf) {
      return;
    }
LABEL_20:
    free(v7);
    return;
  }
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
  }
  id v8 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineWillSendChangesEvent: %{private}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillSendChanges:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      goto LABEL_20;
    }
  }
}

- (void)handleDidSendChanges:(id)a3
{
  id v4 = [a3 didSendChangesEvent];
  if (v4)
  {
    id v5 = v4;
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v6 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v10) = [v5 context].reason;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine did send changes. Reason: %d", buf, 8u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    [objc_msgSend(v5, "context") reason];
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidSendChanges:]", "%s\n", v7);
    if (v7 == (char *)buf) {
      return;
    }
LABEL_20:
    free(v7);
    return;
  }
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
  }
  id v8 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineDidSendChangesEvent: %{private}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022E5AB0);
    }
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidSendChanges:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      goto LABEL_20;
    }
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
  value = self->_centroidDb.__ptr_.__value_;
  self->_centroidDb.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(CLWifiAssociatedApCentroidDatabase *, SEL))(*(void *)value + 8))(value, a2);
  }
  id v6 = self->_metadataDb.__ptr_.__value_;
  p_metadataDb = &self->_metadataDb;
  uint64_t v4 = (uint64_t)v6;
  p_metadataDb->__ptr_.__value_ = 0;
  if (v6)
  {
    sub_100B37208((uint64_t)p_metadataDb, v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end