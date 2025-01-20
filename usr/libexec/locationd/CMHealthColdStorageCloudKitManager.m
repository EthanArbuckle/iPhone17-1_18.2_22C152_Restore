@interface CMHealthColdStorageCloudKitManager
- (BOOL)addPendingRecordChanges:(id)a3 forZoneName:(id)a4;
- (CKContainer)container;
- (CKSyncEngine)syncEngine;
- (CMHealthColdStorageCloudKitManager)initWithColdStorageManager:(void *)a3;
- (id).cxx_construct;
- (id)getSyncEngineMetadata;
- (id)getUserRecordIDName;
- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4;
- (id)zoneIDForZoneName:(id)a3;
- (void)createZone:(id)a3;
- (void)dealloc;
- (void)deleteSyncEngineMetadata;
- (void)deleteZone:(id)a3;
- (void)handleAccountChange:(id)a3;
- (void)handleDidFetchChanges:(id)a3;
- (void)handleDidFetchRecordZoneChanges:(id)a3;
- (void)handleDidSendChanges:(id)a3;
- (void)handleFetchedDatabaseChanges:(id)a3;
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
- (void)initializeSyncEngine;
- (void)persistSyncEngineMetadata:(id)a3;
- (void)setUserRecordIDName:(id)a3;
- (void)syncEngine:(id)a3 handleEvent:(id)a4;
- (void)updateDeviceUnlockedState:(BOOL)a3;
@end

@implementation CMHealthColdStorageCloudKitManager

- (CMHealthColdStorageCloudKitManager)initWithColdStorageManager:(void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CMHealthColdStorageCloudKitManager;
  v4 = [(CMHealthColdStorageCloudKitManager *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_coldStorageManager = a3;
    unsigned __int8 v9 = 0;
    sub_1004CC0F0(&v9, &v10);
    shared_ptr<CMHealthColdStorageCloudKitMetadataDb> v6 = v10;
    shared_ptr<CMHealthColdStorageCloudKitMetadataDb> v10 = (shared_ptr<CMHealthColdStorageCloudKitMetadataDb>)0;
    cntrl = (std::__shared_weak_count *)v5->_metadataDb.__cntrl_;
    v5->_metadataDb = v6;
    if (cntrl)
    {
      sub_1000DB0A0(cntrl);
      if (v10.__cntrl_) {
        sub_1000DB0A0((std::__shared_weak_count *)v10.__cntrl_);
      }
    }
    v5->_deviceUnlocked = 0;
    v5->_zoneIDs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v5->_container = (CKContainer *)[objc_alloc((Class)CKContainer) initWithContainerID:[objc_alloc((Class)CKContainerID) initWithContainerIdentifier:@"com.apple.coremotion.coldstorage" environment:1]];
  }
  return v5;
}

- (void)dealloc
{
  zoneIDs = self->_zoneIDs;
  if (zoneIDs)
  {

    self->_zoneIDs = 0;
  }
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
  v6.receiver = self;
  v6.super_class = (Class)CMHealthColdStorageCloudKitManager;
  [(CMHealthColdStorageCloudKitManager *)&v6 dealloc];
}

- (BOOL)addPendingRecordChanges:(id)a3 forZoneName:(id)a4
{
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_1022B65F0);
  }
  v7 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = a4;
    __int16 v22 = 2112;
    id v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[CloudKit] addPendingRecordChanges - zoneName: %@, recordNames: %@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    int v16 = 138412546;
    id v17 = a4;
    __int16 v18 = 2112;
    id v19 = a3;
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager addPendingRecordChanges:forZoneName:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  syncEngine = self->_syncEngine;
  if (!syncEngine)
  {
    [(CMHealthColdStorageCloudKitManager *)self initializeSyncEngine];
    syncEngine = self->_syncEngine;
  }
  LOBYTE(v9) = 0;
  if (a4)
  {
    if (a3)
    {
      if (syncEngine)
      {
        id v9 = [a3 count];
        if (v9)
        {
          shared_ptr<CMHealthColdStorageCloudKitMetadataDb> v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a3 count]);
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_1004C6854;
          v15[3] = &unk_1022B6420;
          v15[4] = self;
          v15[5] = a4;
          v15[6] = v10;
          [a3 enumerateObjectsUsingBlock:v15];
          [(CKSyncEngineState *)[(CKSyncEngine *)self->_syncEngine state] addPendingRecordZoneChanges:v10];
          if (qword_102419300 != -1) {
            dispatch_once(&qword_102419300, &stru_1022B65F0);
          }
          objc_super v11 = qword_102419308;
          if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[CloudKit] Added pending changes", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419300 != -1) {
              dispatch_once(&qword_102419300, &stru_1022B65F0);
            }
            LOWORD(v16) = 0;
            v13 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager addPendingRecordChanges:forZoneName:]", "%s\n", v13);
            if (v13 != (char *)buf) {
              free(v13);
            }
          }
          LOBYTE(v9) = 1;
        }
      }
    }
  }
  return (char)v9;
}

- (void)updateDeviceUnlockedState:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_1022B65F0);
  }
  v5 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[CloudKit] updateDeviceUnlockedState", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager updateDeviceUnlockedState:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (!self->_syncEngine && !self->_deviceUnlocked && v3)
  {
    coldStorageManager = self->_coldStorageManager;
    if (coldStorageManager)
    {
      if (sub_1010078AC((uint64_t)coldStorageManager))
      {
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_1022B65F0);
        }
        v7 = qword_102419308;
        if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CloudKit] Device has been unlocked. Will now initialize the sync engine.", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419300 != -1) {
            dispatch_once(&qword_102419300, &stru_1022B65F0);
          }
          id v9 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager updateDeviceUnlockedState:]", "%s\n", v9);
          if (v9 != (char *)buf) {
            free(v9);
          }
        }
        [(CMHealthColdStorageCloudKitManager *)self initializeSyncEngine];
      }
    }
  }
  self->_deviceUnlocked = v3;
}

- (id)zoneIDForZoneName:(id)a3
{
  if (!-[NSMutableDictionary objectForKey:](self->_zoneIDs, "objectForKey:")) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_zoneIDs, "setObject:forKeyedSubscript:", [objc_alloc((Class)CKRecordZoneID) initWithZoneName:a3 ownerName:CKCurrentUserDefaultName], a3);
  }
  zoneIDs = self->_zoneIDs;

  return [(NSMutableDictionary *)zoneIDs objectForKeyedSubscript:a3];
}

- (void)initializeSyncEngine
{
  id v3 = [(CMHealthColdStorageCloudKitManager *)self getSyncEngineMetadata];
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  id v5 = [objc_alloc((Class)CKSyncEngineConfiguration) initWithDatabase:-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase") stateSerialization:v3 delegate:self];
  [v5 setApsMachServiceName:@"com.apple.aps.locationd.coldstorage.cloudkit"];
  [v5 setPriority:2];
  [v5 setXpcActivityCriteriaOverrides:v4];
  self->_syncEngine = (CKSyncEngine *)[objc_alloc((Class)CKSyncEngine) initWithConfiguration:v5];

  xpc_release(v4);
}

- (id)getSyncEngineMetadata
{
  uint64_t v8 = 0;
  int64x2_t v9 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  uint64_t v10 = 0;
  BOOL v2 = sub_1004C6F5C(self->_metadataDb.__ptr_, (uint64_t)&v8);
  id result = 0;
  if (v2 && v10 != 0)
  {
    uint64_t v7 = 0;
    id result = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v7];
    if (v7)
    {
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      id v5 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[CloudKit] CloudKit manager failed to read metadata. Error:%@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_1022B65F0);
        }
        int v11 = 138412290;
        uint64_t v12 = v7;
        objc_super v6 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager getSyncEngineMetadata]", "%s\n", v6);
        if (v6 != (char *)buf) {
          free(v6);
        }
      }
      return 0;
    }
  }
  return result;
}

- (void)persistSyncEngineMetadata:(id)a3
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v9 = 0;
  objc_super v6 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v9];
  if (v9)
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    uint64_t v7 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] CloudKit manager failed to write metadata. Error:%{public}@", (uint8_t *)&buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      int v10 = 138543362;
      uint64_t v11 = v9;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager persistSyncEngineMetadata:]", "%s\n", v8);
      if (v8 != (char *)&buf) {
        free(v8);
      }
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((CFAbsoluteTime *)&buf + 1) = Current;
    CFAbsoluteTime v13 = Current;
    uint64_t v14 = v6;
    sub_100EAB8EC(self->_metadataDb.__ptr_, (uint64_t)&buf);
  }
}

- (void)deleteSyncEngineMetadata
{
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_1022B65F0);
  }
  id v3 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CloudKit] Deleting all sync engine metadata", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    xpc_object_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager deleteSyncEngineMetadata]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  sub_1011F9E28((void *)self->_metadataDb.__ptr_ + 9);
}

- (void)deleteZone:(id)a3
{
  if (a3)
  {
    if (self->_syncEngine)
    {
      id v4 = [objc_alloc((Class)CKSyncEnginePendingZoneDelete) initWithZoneID:a3];
      id v5 = [(CKSyncEngine *)self->_syncEngine state];
      id v6 = v4;
      [(CKSyncEngineState *)v5 addPendingDatabaseChanges:+[NSArray arrayWithObjects:&v6 count:1]];
    }
  }
}

- (void)createZone:(id)a3
{
  if (a3 && self->_syncEngine)
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v5 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[CloudKit] Creating new zone with ZoneID: %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      int v11 = 138412290;
      id v12 = a3;
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager createZone:]", "%s\n", v9);
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

- (void)handleZoneDeleted:(id)a3
{
  -[CMHealthColdStorageCloudKitManager createZone:](self, "createZone:");
  coldStorageManager = self->_coldStorageManager;
  if (coldStorageManager)
  {
    id v6 = [a3 zoneName];
    sub_101007754((uint64_t)coldStorageManager, v6);
  }
}

- (void)handleServerRecordChanged:(id)a3
{
  if (a3)
  {
    if (self->_syncEngine)
    {
      coldStorageManager = self->_coldStorageManager;
      if (coldStorageManager)
      {
        if ((sub_1010075B0((uint64_t)coldStorageManager, [a3 recordID], +[CMHealthColdStorageUtils getSystemFieldsFromCKRecord:](CMHealthColdStorageUtils, "getSystemFieldsFromCKRecord:", a3)) & 1) == 0)
        {
          if (qword_102419300 != -1) {
            dispatch_once(&qword_102419300, &stru_1022B65F0);
          }
          id v4 = qword_102419308;
          if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[CloudKit] ServerRecordChanged: Failed to update local system fields", buf, 2u);
          }
          if (sub_10013D1A0(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419300 == -1)
            {
LABEL_19:
              id v6 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleServerRecordChanged:]", "%s\n", v6);
              if (v6 != (char *)buf) {
                free(v6);
              }
              return;
            }
LABEL_21:
            dispatch_once(&qword_102419300, &stru_1022B65F0);
            goto LABEL_19;
          }
        }
      }
    }
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v5 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[CloudKit] Cannot handle server record change, invalid record", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 == -1) {
        goto LABEL_19;
      }
      goto LABEL_21;
    }
  }
}

- (void)handleUnknownItem:(id)a3
{
  if (a3 && self->_syncEngine)
  {
    coldStorageManager = self->_coldStorageManager;
    if (coldStorageManager && (sub_1010075B0((uint64_t)coldStorageManager, [a3 recordID], 0) & 1) == 0)
    {
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      id v6 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] UnknownItem: Failed to update local system fields", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_1022B65F0);
        }
        int v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleUnknownItem:]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
      }
    }
    id v7 = objc_alloc((Class)CKSyncEnginePendingRecordZoneChange);
    id v8 = [a3 recordID];
    id v9 = [v7 initWithRecordID:v8 type:CKSyncEnginePendingRecordZoneChangeTypeSave];
    id v10 = [(CKSyncEngine *)self->_syncEngine state];
    id v12 = v9;
    [(CKSyncEngineState *)v10 addPendingRecordZoneChanges:+[NSArray arrayWithObjects:&v12 count:1]];
  }
}

- (void)handleZoneNotFound:(id)a3
{
  if (a3)
  {
    if (self->_syncEngine)
    {
      -[CMHealthColdStorageCloudKitManager createZone:](self, "createZone:", [objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID")]);
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
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_1022B65F0);
  }
  id v4 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138477827;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CloudKit] Setting userRecordIDName to %{private}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager setUserRecordIDName:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  uint64_t v5 = sub_1000A6958();
  sub_1004D3518(v5, @"kColdStorageCloudKitUserID", (char *)[a3 UTF8String]);
  uint64_t v6 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v6 + 944))();
}

- (id)getUserRecordIDName
{
  memset(&__p, 0, sizeof(__p));
  uint64_t v2 = sub_1000A6958();
  sub_1000A7CF8(v2, @"kColdStorageCloudKitUserID", &__p);
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

- (void)syncEngine:(id)a3 handleEvent:(id)a4
{
  if (a4)
  {
    if (self->_syncEngine == a3)
    {
      switch((unint64_t)[a4 type])
      {
        case 0uLL:
          [(CMHealthColdStorageCloudKitManager *)self handleStateUpdate:a4];
          break;
        case 1uLL:
          [(CMHealthColdStorageCloudKitManager *)self handleAccountChange:a4];
          break;
        case 2uLL:
          [(CMHealthColdStorageCloudKitManager *)self handleFetchedDatabaseChanges:a4];
          break;
        case 3uLL:
          [(CMHealthColdStorageCloudKitManager *)self handleFetchedRecordZoneChanges:a4];
          break;
        case 4uLL:
          [(CMHealthColdStorageCloudKitManager *)self handleSentDatabaseChanges:a4];
          break;
        case 5uLL:
          [(CMHealthColdStorageCloudKitManager *)self handleSentRecordZoneChanges:a4];
          break;
        case 6uLL:
          [(CMHealthColdStorageCloudKitManager *)self handleWillFetchChanges:a4];
          break;
        case 7uLL:
          [(CMHealthColdStorageCloudKitManager *)self handleWillFetchRecordZoneChanges:a4];
          break;
        case 8uLL:
          [(CMHealthColdStorageCloudKitManager *)self handleDidFetchRecordZoneChanges:a4];
          break;
        case 9uLL:
          [(CMHealthColdStorageCloudKitManager *)self handleDidFetchChanges:a4];
          break;
        case 0xAuLL:
          [(CMHealthColdStorageCloudKitManager *)self handleWillSendChanges:a4];
          break;
        case 0xBuLL:
          [(CMHealthColdStorageCloudKitManager *)self handleDidSendChanges:a4];
          break;
        default:
          return;
      }
    }
    else
    {
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      id v6 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v11 = a3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] Sync engine (%@) doesn't match internal reference.", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419300 == -1)
        {
LABEL_54:
          id v9 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager syncEngine:handleEvent:]", "%s\n", v9);
          if (v9 != (char *)buf) {
            free(v9);
          }
          return;
        }
LABEL_56:
        dispatch_once(&qword_102419300, &stru_1022B65F0);
        goto LABEL_54;
      }
    }
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v7 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] Sync engine (%@) called back for invalid event", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 == -1) {
        goto LABEL_54;
      }
      goto LABEL_56;
    }
  }
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
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          CFAbsoluteTime v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v6, "containsObject:", objc_msgSend(objc_msgSend(v13, "recordID"), "zoneID"))) {
            [v8 addObject:v13];
          }
        }
        id v10 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
    id v7 = +[NSArray arrayWithArray:v8];
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1004C87EC;
  v14[3] = &unk_1022B6448;
  v14[4] = self;
  return [objc_alloc((Class)CKSyncEngineRecordZoneChangeBatch) initWithPendingChanges:v7 recordProvider:v14];
}

- (void)handleStateUpdate:(id)a3
{
  id v5 = [a3 stateUpdateEvent];
  if (v5)
  {
    id v6 = [v5 stateSerialization];
    [(CMHealthColdStorageCloudKitManager *)self persistSyncEngineMetadata:v6];
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v7 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineStateUpdateEvent (%@)", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      id v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleStateUpdate:]", "%s\n", v8);
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
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      id v14 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[CloudKit] iCloud switched accounts. Deleting all records and sync engine metadata.", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_1022B65F0);
        }
        id v19 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleAccountChange:]", "%s\n", v19);
        if (v19 != (char *)buf) {
          free(v19);
        }
      }
      coldStorageManager = (CFAbsoluteTime *)self->_coldStorageManager;
      if (coldStorageManager) {
        sub_10100768C(coldStorageManager);
      }
      [(CMHealthColdStorageCloudKitManager *)self deleteSyncEngineMetadata];
    }
    else
    {
      if (v7 != (id)1)
      {
        if (v7) {
          return;
        }
        id v8 = [(CMHealthColdStorageCloudKitManager *)self getUserRecordIDName];
        if (v8)
        {
          unsigned int v9 = [v8 isEqualToString:[v6 currentUser].recordName];
          [(CMHealthColdStorageCloudKitManager *)self deleteSyncEngineMetadata];
          p_coldStorageManager = &self->_coldStorageManager;
          if (!self->_coldStorageManager) {
            goto LABEL_44;
          }
          if (!v9)
          {
            if (qword_102419300 != -1) {
              dispatch_once(&qword_102419300, &stru_1022B65F0);
            }
            uint64_t v11 = qword_102419308;
            if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[CloudKit] iCloud account change. User switched account", buf, 2u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419300 != -1) {
                dispatch_once(&qword_102419300, &stru_1022B65F0);
              }
              id v21 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleAccountChange:]", "%s\n", v21);
              if (v21 != (char *)buf) {
                free(v21);
              }
            }
            sub_10100768C((CFAbsoluteTime *)*p_coldStorageManager);
            goto LABEL_44;
          }
        }
        else
        {
          [(CMHealthColdStorageCloudKitManager *)self deleteSyncEngineMetadata];
          p_coldStorageManager = &self->_coldStorageManager;
          if (!self->_coldStorageManager) {
            goto LABEL_44;
          }
        }
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_1022B65F0);
        }
        long long v17 = qword_102419308;
        if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[CloudKit] iCloud account change. User signed in with same account", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419300 != -1) {
            dispatch_once(&qword_102419300, &stru_1022B65F0);
          }
          v20 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleAccountChange:]", "%s\n", v20);
          if (v20 != (char *)buf) {
            free(v20);
          }
        }
        sub_101007720((uint64_t)*p_coldStorageManager);
LABEL_44:
        -[CMHealthColdStorageCloudKitManager setUserRecordIDName:](self, [objc_msgSend(objc_msgSend(v6, "currentUser"), "recordName"]);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_1022B65F0);
        }
        long long v18 = qword_102419308;
        if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[CloudKit] iCloud account change. User signed in.", buf, 2u);
        }
        if (!sub_10013D1A0(115, 2)) {
          return;
        }
        bzero(buf, 0x65CuLL);
        if (qword_102419300 == -1) {
          goto LABEL_55;
        }
LABEL_66:
        dispatch_once(&qword_102419300, &stru_1022B65F0);
LABEL_55:
        CFAbsoluteTime v13 = (uint8_t *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleAccountChange:]", "%s\n");
LABEL_56:
        if (v13 != buf) {
          free(v13);
        }
        return;
      }
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      long long v16 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[CloudKit] iCloud account change. User signed out.", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419300 == -1) {
          goto LABEL_55;
        }
        goto LABEL_66;
      }
    }
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v12 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineAccountChangeEvent (%@)", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      CFAbsoluteTime v13 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleAccountChange:]", "%s\n");
      goto LABEL_56;
    }
  }
}

- (void)handleFetchedDatabaseChanges:(id)a3
{
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_1022B65F0);
  }
  id v3 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CloudKit] Fetched database changes event", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleFetchedDatabaseChanges:]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)handleFetchedRecordZoneChanges:(id)a3
{
  id v5 = [a3 fetchedRecordZoneChangesEvent];
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1004C96A0;
    v9[3] = &unk_1022B6470;
    v9[4] = self;
    [objc_msgSend(v5, "modifications") enumerateObjectsUsingBlock:v9];
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v6 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CloudKit] Fetched record zone event", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      LOWORD(v10) = 0;
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleFetchedRecordZoneChanges:]", "%s\n");
LABEL_19:
      if (v7 != buf) {
        free(v7);
      }
    }
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v8 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineFetchedRecordZoneChangesEvent (%@)", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      int v10 = 138412290;
      id v11 = a3;
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleFetchedRecordZoneChanges:]", "%s\n");
      goto LABEL_19;
    }
  }
}

- (void)handleSentDatabaseChanges:(id)a3
{
  id v5 = [a3 sentDatabaseChangesEvent];
  if (v5)
  {
    id v6 = v5;
    [objc_msgSend(v5, "savedZones") enumerateObjectsUsingBlock:&stru_1022B64B0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1004C9B14;
    v10[3] = &unk_1022B64D8;
    v10[4] = self;
    [objc_msgSend(v6, "deletedZoneIDs") enumerateObjectsUsingBlock:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1004C9CE4;
    v9[3] = &unk_1022B6500;
    v9[4] = self;
    [objc_msgSend(v6, "failedZoneSaves") enumerateObjectsUsingBlock:v9];
    [objc_msgSend(v6, "failedZoneDeletes") enumerateKeysAndObjectsUsingBlock:&stru_1022B6540];
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v7 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineSentDatabaseChangesEvent (%@)", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      int v11 = 138412290;
      id v12 = a3;
      id v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleSentDatabaseChanges:]", "%s\n", v8);
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
    v11[2] = sub_1004CA3D0;
    v11[3] = &unk_1022B6470;
    v11[4] = self;
    [objc_msgSend(v5, "savedRecords") enumerateObjectsUsingBlock:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1004CA700;
    v10[3] = &unk_1022B6568;
    v10[4] = self;
    [objc_msgSend(v6, "deletedRecordIDs") enumerateObjectsUsingBlock:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1004CA9FC;
    v9[3] = &unk_1022B6590;
    v9[4] = self;
    [objc_msgSend(v6, "failedRecordSaves") enumerateObjectsUsingBlock:v9];
    [objc_msgSend(v6, "failedRecordDeletes") enumerateKeysAndObjectsUsingBlock:&stru_1022B65D0];
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v7 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineSentRecordZoneChangesEvent (%@)", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      int v12 = 138412290;
      id v13 = a3;
      id v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleSentRecordZoneChanges:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)handleWillFetchChanges:(id)a3
{
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_1022B65F0);
  }
  id v3 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CloudKit] Sync engine is about to fetch changes", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleWillFetchChanges:]", "%s\n", v4);
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
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v6 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138543362;
      id v10 = [v5 zoneID];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CloudKit] Sync engine is about to fetch zone changes for zoneID %{public}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      [v5 zoneID];
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleWillFetchRecordZoneChanges:]", "%s\n");
LABEL_19:
      if (v7 != buf) {
        free(v7);
      }
    }
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v8 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineWillFetchRecordZoneChangesEvent (%@)", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleWillFetchRecordZoneChanges:]", "%s\n");
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
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      id v6 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        id v11 = [v5 zoneID];
        __int16 v12 = 2114;
        id v13 = [v5 error];
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] Error fetching record zone changes for %{public}@. Error: %{public}@", buf, 0x16u);
      }
      if (!sub_10013D1A0(115, 0)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      [v5 zoneID];
      [v5 error];
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleDidFetchRecordZoneChanges:]", "%s\n");
    }
    else
    {
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      unsigned int v9 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543362;
        id v11 = [v5 zoneID];
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[CloudKit] Sync engine successfully fetched zone changes for zoneID %{public}@", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      [v5 zoneID];
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleDidFetchRecordZoneChanges:]", "%s\n");
    }
    if (v7 != buf) {
LABEL_30:
    }
      free(v7);
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v8 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineDidFetchRecordZoneChangesEvent (%@)", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022B65F0);
      }
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleDidFetchRecordZoneChanges:]", "%s\n", (const char *)v7);
      if (v7 != buf) {
        goto LABEL_30;
      }
    }
  }
}

- (void)handleDidFetchChanges:(id)a3
{
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_1022B65F0);
  }
  id v3 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CloudKit] Sync engine did fetch changes", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleDidFetchChanges:]", "%s\n", v4);
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
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v6 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v10) = [v5 context].reason;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CloudKit] Sync engine will send changes. Reason: %d", buf, 8u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    [objc_msgSend(v5, "context") reason];
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleWillSendChanges:]", "%s\n", v7);
    if (v7 == (char *)buf) {
      return;
    }
LABEL_20:
    free(v7);
    return;
  }
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_1022B65F0);
  }
  id v8 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineWillSendChangesEvent (%@)", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleWillSendChanges:]", "%s\n", v7);
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
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v6 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v10) = [v5 context].reason;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CloudKit] Sync engine did send changes. Reason: %d", buf, 8u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    [objc_msgSend(v5, "context") reason];
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleDidSendChanges:]", "%s\n", v7);
    if (v7 == (char *)buf) {
      return;
    }
LABEL_20:
    free(v7);
    return;
  }
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_1022B65F0);
  }
  id v8 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineDidSendChangesEvent (%@)", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022B65F0);
    }
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleDidSendChanges:]", "%s\n", v7);
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
  cntrl = self->_metadataDb.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end