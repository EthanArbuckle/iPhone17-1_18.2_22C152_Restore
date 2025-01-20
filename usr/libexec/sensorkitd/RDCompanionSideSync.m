@interface RDCompanionSideSync
+ (void)initialize;
- (BOOL)isRemoteSupported;
- (RDAnalyticsEventDelegate)analyticsDelegate;
- (RDGizmoSyncDelegate)delegate;
- (void)dealloc;
- (void)decryptArchivesWithActivity:(id)a3;
- (void)sendStateToPeer:(id)a3;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 didReceiveArchive:(id)a4 sensor:(id)a5 gizmoSnapshotURL:(id)a6 metadata:(id)a7 fromID:(id)a8;
- (void)service:(id)a3 didReceiveKeyServiceMessage:(id)a4 fromID:(id)a5 key:(id)a6 keyName:(id)a7 sensor:(id)a8 archiveURLPath:(id)a9 deviceID:(id)a10;
- (void)service:(id)a3 didReceiveResourceServiceMessage:(id)a4 fromID:(id)a5 incomingResponseIdentifier:(id)a6 outgoingResponseIdentifier:(id)a7;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)validatePreferWifiAssertion;
@end

@implementation RDCompanionSideSync

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EAB8 = (uint64_t)os_log_create("com.apple.SensorKit", "RDCompanionSideSync");
  }
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 40);
    objc_setProperty_nonatomic(self, v3, 0, 24);
    objc_setProperty_nonatomic(self, v4, 0, 48);
    objc_setProperty_nonatomic(self, v5, 0, 32);
    objc_setProperty_nonatomic(self, v6, 0, 56);
  }
  v7.receiver = self;
  v7.super_class = (Class)RDCompanionSideSync;
  [(RDCompanionSideSync *)&v7 dealloc];
}

- (BOOL)isRemoteSupported
{
  id v2 = [sub_100024F04((NSDictionary *)self->_gizmoSyncService) objectForKeyedSubscript:@"supportsCurrentVersion"];

  return [v2 BOOLValue];
}

- (void)validatePreferWifiAssertion
{
  stateCache = self->_stateCache;
  if (stateCache && stateCache->_preferWifiAssertionEndTime != 0.0)
  {
    uint64_t v4 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v5 = qword_10006EC90;
    double v6 = *(double *)&qword_10006EC98;
    double v7 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v5 >= v4) {
      double v8 = -v8;
    }
    double v9 = v7 + v6 + v8;
    v10 = self->_stateCache;
    if (v10)
    {
      if (v9 <= v10->_preferWifiAssertionEndTime) {
        return;
      }
    }
    else if (v9 <= 0.0)
    {
      return;
    }
    sub_100024BD8((id *)&self->_gizmoSyncService->super.isa, 0);
    v11 = self->_stateCache;
    if (v11)
    {
      v11->_preferWifiAssertionEndTime = 0.0;
      sub_1000283D8((uint64_t)v11);
    }
  }
}

- (void)decryptArchivesWithActivity:(id)a3
{
  unint64_t v5 = sub_100039F34(self->_fileURLs, self->_defaults);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v20 = sub_10000EC64([RDTopLevelInformingDatastore alloc], v5);
  obj = sub_10000ED28(v20, 1);
  id v23 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v33;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(__CFString **)(*((void *)&v32 + 1) + 8 * v6);
        if ([a3 deferIfNeeded])
        {
          goto LABEL_20;
        }
        context = v8;
        uint64_t v26 = v6;
        double v9 = sub_100039FA8(v7, 0, self->_fileURLs, self->_defaults);
        v10 = (NSSet *)sub_10000E0F0([RDInformingDatastore alloc], v9);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v24 = v10;
        v11 = sub_10000E348(v10);
        id v12 = [(NSSet *)v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v29;
LABEL_10:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v28 + 1) + 8 * v15);
            if ([a3 deferIfNeeded]) {
              break;
            }
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_100003F60;
            v27[3] = &unk_10005CA18;
            v27[4] = a3;
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_100005420;
            v36[3] = &unk_10005CAA8;
            v36[4] = v7;
            v36[5] = v16;
            v36[6] = self;
            v36[7] = v27;
            sub_10000566C((uint64_t)self, v7, v16, (uint64_t)v36);
            sub_1000059D4((void **)&self->super.isa, v7, v16, (uint64_t)v36);
            if (v13 == (id)++v15)
            {
              id v13 = [(NSSet *)v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
              if (v13) {
                goto LABEL_10;
              }
              break;
            }
          }
        }

        uint64_t v6 = v26 + 1;
      }
      while ((id)(v26 + 1) != v23);
      id v23 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
LABEL_20:

  if (!a3 || (v19 = (_xpc_activity_s *)*((void *)a3 + 3)) == 0 || xpc_activity_get_state(v19) != 3) {
    [a3 markCompleted];
  }
}

- (void)service:(id)a3 didReceiveArchive:(id)a4 sensor:(id)a5 gizmoSnapshotURL:(id)a6 metadata:(id)a7 fromID:(id)a8
{
  if (self)
  {
    gizmoSyncService = self->_gizmoSyncService;
    if (gizmoSyncService)
    {
      id v14 = sub_100024DD4(gizmoSyncService, (uint64_t)a8, [(IDSService *)gizmoSyncService->_resourceService devices]);
      if (v14)
      {
        uint64_t v15 = v14;
        v16 = sub_100039FA8(a5, v14, self->_fileURLs, self->_defaults);
        v17 = (NSURL *)sub_10000F800([RDArchiveableDatastore alloc], (void **)&v16->super.isa);
        v18 = sub_100011E0C(v17, (const char *)a4, (uint64_t)[a6 lastPathComponent]);

        if (v18)
        {
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_100004334;
          v37[3] = &unk_10005CA40;
          v37[4] = self;
          v37[5] = v18;
          v37[6] = a5;
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_100005420;
          v39 = &unk_10005CAA8;
          id v40 = a5;
          v41 = v15;
          v42 = self;
          v43 = v37;
          sub_10000566C((uint64_t)self, a5, v15, (uint64_t)buf);
          sub_1000059D4((void **)&self->super.isa, (__CFString *)a5, v15, (uint64_t)buf);
          sub_100024BD8((id *)&self->_gizmoSyncService->super.isa, 1);
          uint64_t v21 = mach_continuous_time();
          if (qword_10006EC88 != -1) {
            dispatch_once(&qword_10006EC88, &stru_10005CDC0);
          }
          unint64_t v22 = qword_10006EC90;
          double v23 = *(double *)&qword_10006EC98;
          double v24 = *(double *)&qword_10006ECA0;
          TMConvertTicksToSeconds();
          double v26 = v25;
          v27 = sub_10002BC54((id *)&self->_defaults->super.isa);
          stateCache = self->_stateCache;
          if (stateCache)
          {
            double v29 = -v26;
            if (v22 < v21) {
              double v29 = v26;
            }
            stateCache->_preferWifiAssertionEndTime = v24 + v23 + v29 + (double)(uint64_t)v27;
            sub_1000283D8((uint64_t)stateCache);
          }
          return;
        }
        BOOL v31 = -[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [a4 path]);
        uint64_t v32 = qword_10006EAB8;
        BOOL v33 = os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_ERROR);
        if (v31)
        {
          if (v33)
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = a5;
            long long v34 = "Failed to store the encrypted archive for %{public}@!";
            long long v35 = v32;
            uint32_t v36 = 12;
LABEL_20:
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
          }
        }
        else if (v33)
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = a4;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = a5;
          long long v34 = "Got an incoming resource %{public}@ for %{public}@ but unable to locate the IDS resource";
          long long v35 = v32;
          uint32_t v36 = 22;
          goto LABEL_20;
        }
        -[RDAnalyticsEventDelegate gizmoSync:failedToStoreEncryptedArchive:key:sensor:fileExists:](-[RDCompanionSideSync analyticsDelegate](self, "analyticsDelegate"), "gizmoSync:failedToStoreEncryptedArchive:key:sensor:fileExists:", self, a4, sub_100024B50((uint64_t)self->_gizmoSyncService, (char *)[a4 path], a5), a5, v31);
        return;
      }
    }
  }
  long long v30 = qword_10006EAB8;
  if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = a8;
    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to find a device id from IDS id %{public}@", buf, 0xCu);
  }
}

- (void)service:(id)a3 didReceiveKeyServiceMessage:(id)a4 fromID:(id)a5 key:(id)a6 keyName:(id)a7 sensor:(id)a8 archiveURLPath:(id)a9 deviceID:(id)a10
{
  uint64_t v15 = qword_10006EAB8;
  if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = a9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = a8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Key for %{public}@ received for %{public}@ adding to the keychain", buf, 0x16u);
  }
  id v16 = [a4 objectForKeyedSubscript:@"RDGizmoSyncIVKey"];
  if (v16 && (v17 = v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v18 = sub_100039FA8(a8, a10, self->_fileURLs, self->_defaults);
    v19 = sub_100012F98([RDEncryptingDatastore alloc], v18);
    char v20 = sub_100013358((uint64_t)v19, a6, v17, a9);

    if (v20)
    {
      fileURLs = self->_fileURLs;
      id v26 = a10;
      if ([+[NSFileManager defaultManager](NSFileManager, "defaultManager") fileExistsAtPath:[+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", a9, 0, sub_10001BB24((uint64_t)fileURLs, (uint64_t)+[NSArray arrayWithObjects:&v26 count:1], a8)) path]])
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100005420;
        long long v28 = &unk_10005CAA8;
        id v29 = a8;
        id v30 = a10;
        BOOL v31 = self;
        uint64_t v32 = 0;
        sub_10000566C((uint64_t)self, a8, a10, (uint64_t)buf);
        sub_1000059D4((void **)&self->super.isa, (__CFString *)a8, a10, (uint64_t)buf);
      }
    }
    else
    {
      double v25 = qword_10006EAB8;
      if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = a9;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = a8;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Failed to add key for %{public}@ for %{public}@ to keychain. Registering to retry on next unlock.", buf, 0x16u);
      }
      [(RDAnalyticsEventDelegate *)[(RDCompanionSideSync *)self analyticsDelegate] gizmoSync:self failedToAddKey:a7 toKeyChainForSensor:a8];
    }
  }
  else
  {
    double v24 = qword_10006EAB8;
    if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Message missing IV. Dropping", buf, 2u);
    }
  }
}

- (void)service:(id)a3 didReceiveResourceServiceMessage:(id)a4 fromID:(id)a5 incomingResponseIdentifier:(id)a6 outgoingResponseIdentifier:(id)a7
{
  id v10 = [a4 objectForKeyedSubscript:@"RDGizmoSyncMessageTypeKey"];
  if (v10)
  {
    id v11 = [v10 integerValue];
    switch((unint64_t)v11)
    {
      case 1uLL:
        uint64_t v15 = qword_10006EAB8;
        if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          id v16 = "Shouldn't be receiving recording message on the companion side";
          goto LABEL_45;
        }
        return;
      case 2uLL:
        id v17 = [a4 objectForKeyedSubscript:@"RDGizmoSyncCompanionAbsoluteTimeKey"];
        if (v17)
        {
          v18 = v17;
          id v19 = [a4 objectForKeyedSubscript:@"RDGizmoSyncGizmoAbsoluteTimeKey"];
          if (v19)
          {
            id v20 = v19;
            double v21 = *(double *)&qword_10006EC98;
            TMConvertTicksToSeconds();
            double v23 = v21 - v22;
            *(void *)buf = 0;
            mach_get_times();
            if (self) {
              self = (RDCompanionSideSync *)self->_gizmoSyncService;
            }
            v54[0] = &off_100060F78;
            v53[0] = @"RDGizmoSyncMessageTypeKey";
            v53[1] = @"RDGizmoSyncCompanionRTCContinuousOffsetKey";
            v54[1] = +[NSNumber numberWithDouble:v23];
            v53[2] = @"RDGizmoSyncCompanionContinuousAbsoluteOffsetKey";
            v54[2] = +[NSNumber numberWithLongLong:0];
            v54[3] = v20;
            v53[3] = @"RDGizmoSyncGizmoAbsoluteTimeKey";
            v53[4] = @"RDGizmoSyncCompanionAbsoluteTimeKey";
            v54[4] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v18 unsignedLongLongValue]);
            double v24 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:5];
            if (self) {
              sub_1000250CC((uint64_t)self, v24, self->_fileURLs, 0);
            }
            return;
          }
          uint64_t v15 = qword_10006EAB8;
          if (!os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_ERROR)) {
            return;
          }
          *(_WORD *)buf = 0;
          id v16 = "Time sync requested but no gizmo absolute time provided";
        }
        else
        {
          uint64_t v15 = qword_10006EAB8;
          if (!os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_ERROR)) {
            return;
          }
          *(_WORD *)buf = 0;
          id v16 = "Time sync requested but no companion absolute time provided";
        }
LABEL_45:
        v47 = v15;
        uint32_t v48 = 2;
        goto LABEL_46;
      case 3uLL:
        id v25 = [[a4 objectForKeyedSubscript:@"RDGizmoSyncArchiveTransferStatusKey"] integerValue];
        if (v25 == (id)4)
        {
          v49 = qword_10006EAB8;
          if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Received request from gizmo to expire our prefer infra wifi assertion", buf, 2u);
          }
          if (self)
          {
            sub_100024BD8((id *)&self->_gizmoSyncService->super.isa, 0);
            stateCache = self->_stateCache;
            if (stateCache)
            {
              stateCache->_preferWifiAssertionEndTime = 0.0;
              sub_1000283D8((uint64_t)stateCache);
            }
          }
        }
        else if (v25 == (id)3)
        {
          id v26 = qword_10006EAB8;
          if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Received request from gizmo to renew our prefer infra wifi assertion", buf, 2u);
          }
          if (self)
          {
            sub_100024BD8((id *)&self->_gizmoSyncService->super.isa, 1);
            uint64_t v27 = mach_continuous_time();
            if (qword_10006EC88 != -1) {
              dispatch_once(&qword_10006EC88, &stru_10005CDC0);
            }
            unint64_t v28 = qword_10006EC90;
            double v29 = *(double *)&qword_10006EC98;
            double v30 = *(double *)&qword_10006ECA0;
            TMConvertTicksToSeconds();
            double v32 = v31;
            BOOL v33 = sub_10002BC54((id *)&self->_defaults->super.isa);
            long long v34 = self->_stateCache;
            if (v34)
            {
              double v35 = -v32;
              if (v28 < v27) {
                double v35 = v32;
              }
              v34->_preferWifiAssertionEndTime = v30 + v29 + v35 + (double)(uint64_t)v33;
              sub_1000283D8((uint64_t)v34);
            }
          }
        }
        return;
      case 4uLL:
      case 5uLL:
      case 7uLL:
      case 9uLL:
      case 0xAuLL:
        id v12 = v11;
        id v13 = qword_10006EAB8;
        if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v12;
          _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Shouldn't be getting message type %ld on this IDS service", buf, 0xCu);
        }
        return;
      case 8uLL:
        if (self
          && (gizmoSyncService = self->_gizmoSyncService) != 0
          && (id v37 = sub_100024DD4(gizmoSyncService, (uint64_t)a5, [(IDSService *)gizmoSyncService->_resourceService devices])) != 0)
        {
          id v38 = v37;
          selfa = objc_alloc_init(RDGizmoSyncState);
          id v39 = [[objc_msgSend(a4, "objectForKeyedSubscript:", @"RDGizmoSyncGizmoPrerequisitesKey") integerValue];
          if (selfa)
          {
            selfa->_prerequisites = (unint64_t)v39;
            id v40 = [a4 objectForKeyedSubscript:@"RDGizmoSyncGizmoRecordingStatesKey"];
            objc_setProperty_nonatomic(selfa, v41, v40, 16);
            id v42 = [a4 objectForKeyedSubscript:@"RDGizmoSyncGizmoServiceStartTimesKey"];
            objc_setProperty_nonatomic(selfa, v43, v42, 24);
            id v44 = [a4 objectForKeyedSubscript:@"RDGizmoSyncSensorConfigurations"];
            objc_setProperty_nonatomic(selfa, v45, v44, 40);
          }
          else
          {
            [a4 objectForKeyedSubscript:@"RDGizmoSyncGizmoRecordingStatesKey"];
            [a4 objectForKeyedSubscript:@"RDGizmoSyncGizmoServiceStartTimesKey"];
            [a4 objectForKeyedSubscript:@"RDGizmoSyncSensorConfigurations"];
          }
          [(RDGizmoSyncDelegate *)[(RDCompanionSideSync *)self delegate] gizmoSync:self didSyncState:selfa deviceID:v38];
        }
        else
        {
          uint64_t v46 = qword_10006EAB8;
          if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = 8;
            id v16 = "Got message %ld from unknown device";
            v47 = v46;
            uint32_t v48 = 12;
LABEL_46:
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, v16, buf, v48);
          }
        }
        return;
      default:
        return;
    }
  }
  id v14 = qword_10006EAB8;
  if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "No message type key found. Ignoring message", buf, 2u);
  }
}

- (void)sendStateToPeer:(id)a3
{
  uint64_t v4 = self;
  [(RDCompanionSideSync *)self validatePreferWifiAssertion];
  if (v4)
  {
    p_isa = (id *)&v4->_gizmoSyncService->super.isa;
    if (p_isa
      && (id v6 = sub_100024F68((uint64_t)v4->_gizmoSyncService),
          (id v44 = sub_100024DD4(p_isa, (uint64_t)v6, [p_isa[3] devices])) != 0))
    {
      id v36 = a3;
      SEL v45 = (void **)&v4->super.isa;
      double v7 = sub_100039F34(v4->_fileURLs, v4->_defaults);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v37 = sub_10000EC64([RDTopLevelInformingDatastore alloc], v7);
      obj = sub_10000ED28(v37, 1);
      id v8 = [obj countByEnumeratingWithState:&v54 objects:buf count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v55;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v55 != v10) {
              objc_enumerationMutation(obj);
            }
            id v12 = *(__CFString **)(*((void *)&v54 + 1) + 8 * i);
            v70[0] = _NSConcreteStackBlock;
            v70[1] = 3221225472;
            v70[2] = sub_100005420;
            v70[3] = &unk_10005CAA8;
            v70[4] = v12;
            v70[5] = v44;
            v70[6] = v45;
            v70[7] = &stru_10005CA80;
            sub_10000566C((uint64_t)v45, v12, v44, (uint64_t)v70);
            sub_1000059D4(v45, v12, v44, (uint64_t)v70);
          }
          id v9 = [obj countByEnumeratingWithState:&v54 objects:buf count:16];
        }
        while (v9);
      }
      id v15 = +[NSMutableDictionary dictionary];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v38 = sub_10000ED28(v37, 1);
      id v40 = [v38 countByEnumeratingWithState:&v50 objects:v70 count:16];
      if (v40)
      {
        uint64_t v39 = *(void *)v51;
        do
        {
          for (j = 0; j != v40; j = (char *)j + 1)
          {
            if (*(void *)v51 != v39) {
              objc_enumerationMutation(v38);
            }
            id v17 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
            v18 = sub_100039FA8(v17, v44, v45[3], v45[4]);
            id v19 = (NSDirectoryEnumerator *)sub_10000E0F0([RDInformingDatastore alloc], v18);
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            SEL v41 = v19;
            double v21 = sub_10000E964(v19, v20);
            id v22 = [(NSDirectoryEnumerator *)v21 countByEnumeratingWithState:&v46 objects:v69 count:16];
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v47;
              do
              {
                for (k = 0; k != v23; k = (char *)k + 1)
                {
                  if (*(void *)v47 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  id v26 = *(void **)(*((void *)&v46 + 1) + 8 * (void)k);
                  if (![v15 objectForKeyedSubscript:v17]) {
                    [v15 setObject:+[NSMutableArray array](NSMutableArray, "array") forKeyedSubscript:v17];
                  }
                  [objc_msgSend(v15, "objectForKeyedSubscript:", v17) addObject:[v26 lastPathComponent]];
                }
                id v23 = [(NSDirectoryEnumerator *)v21 countByEnumeratingWithState:&v46 objects:v69 count:16];
              }
              while (v23);
            }
          }
          id v40 = [v38 countByEnumeratingWithState:&v50 objects:v70 count:16];
        }
        while (v40);
      }

      uint64_t v27 = +[NSDictionary dictionaryWithDictionary:v15];
      a3 = v36;
      uint64_t v4 = (RDCompanionSideSync *)v45;
      unint64_t v28 = qword_10006EAB8;
      if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
    }
    else
    {
      double v29 = qword_10006EAB8;
      if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Unable to find a remote device ID therefore there are no required keys", buf, 2u);
      }
      uint64_t v27 = (NSDictionary *)&__NSDictionary0__struct;
      unint64_t v28 = qword_10006EAB8;
      if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
    }
  }
  else
  {
    uint64_t v27 = 0;
    unint64_t v28 = qword_10006EAB8;
    if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_32:
      *(_DWORD *)buf = 138543362;
      v72 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Asking for required keys: %{public}@", buf, 0xCu);
    }
  }
  if (v4) {
    uint64_t v4 = (RDCompanionSideSync *)v4->_gizmoSyncService;
  }
  v63[0] = &off_100060F90;
  v58[0] = @"RDGizmoSyncMessageTypeKey";
  v58[1] = @"RDGizmoSyncCompanionRecordingStatesKey";
  if (a3) {
    uint64_t v30 = *((void *)a3 + 2);
  }
  else {
    uint64_t v30 = 0;
  }
  v63[1] = v30;
  v63[2] = v27;
  v58[2] = @"RDGizmoSyncCompanionRequiredKeysKey";
  v58[3] = @"RDGizmoSyncCompanionPrerequisitesKey";
  if (a3)
  {
    v64 = +[NSNumber numberWithUnsignedInteger:*((void *)a3 + 4)];
    CFStringRef v59 = @"RDGizmoSyncSensorConfigurations";
    double v31 = &__NSDictionary0__struct;
    if (*((void *)a3 + 5)) {
      double v31 = (void *)*((void *)a3 + 5);
    }
    BOOL v32 = *((unsigned char *)a3 + 8) != 0;
  }
  else
  {
    v64 = +[NSNumber numberWithUnsignedInteger:0];
    CFStringRef v59 = @"RDGizmoSyncSensorConfigurations";
    BOOL v32 = 0;
    double v31 = &__NSDictionary0__struct;
  }
  v65 = v31;
  CFStringRef v60 = @"RDGizmoSyncCompanionRequiredAppInstalledKey";
  v66 = +[NSNumber numberWithBool:v32];
  CFStringRef v61 = @"RDGizmoSyncCompanionServiceStartTimesKey";
  if (a3)
  {
    uint64_t v33 = *((void *)a3 + 3);
    uint64_t v34 = *((void *)a3 + 6);
  }
  else
  {
    uint64_t v33 = 0;
    uint64_t v34 = 0;
  }
  uint64_t v67 = v33;
  CFStringRef v62 = @"RDGizmoSyncCapabilitiesKey";
  v68 = +[NSNumber numberWithUnsignedInteger:v34];
  double v35 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v58 count:8];
  if (v4) {
    sub_1000250CC((uint64_t)v4, v35, v4->_fileURLs, 0);
  }
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  if (self)
  {
    gizmoSyncService = self->_gizmoSyncService;
    if (gizmoSyncService)
    {
      id v7 = sub_100024F68((uint64_t)self->_gizmoSyncService);
      id v8 = sub_100024DD4(gizmoSyncService, (uint64_t)v7, [(IDSService *)gizmoSyncService->_resourceService devices]);
      if (sub_100024DD4(gizmoSyncService, (uint64_t)v8, a4))
      {
        id v9 = [(RDCompanionSideSync *)self delegate];
        [(RDGizmoSyncDelegate *)v9 gizmoSyncConnectedDevicesAdded:self];
      }
    }
  }
}

- (RDGizmoSyncDelegate)delegate
{
  return (RDGizmoSyncDelegate *)objc_loadWeak((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (RDAnalyticsEventDelegate)analyticsDelegate
{
  return (RDAnalyticsEventDelegate *)objc_loadWeak((id *)&self->analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->analyticsDelegate);

  objc_destroyWeak((id *)&self->delegate);
}

@end