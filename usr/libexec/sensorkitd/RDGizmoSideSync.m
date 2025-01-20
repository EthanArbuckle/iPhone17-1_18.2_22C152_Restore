@interface RDGizmoSideSync
+ (void)initialize;
- (BOOL)isRemoteSupported;
- (BOOL)prepareArchivesForSensor:(id)a3 deviceId:(id)a4;
- (RDAnalyticsEventDelegate)analyticsDelegate;
- (RDGizmoSyncDelegate)delegate;
- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4;
- (void)dealloc;
- (void)peripheral:(id)a3 didReceiveTimeSyncWithReferenceTime:(id)a4 localAbsolute:(id)a5 remoteAbsolute:(id)a6 receiveTime:(id)a7 GMTDelta:(id)a8 error:(id)a9;
- (void)sendSnapshotForSensor:(id)a3 deviceId:(id)a4;
- (void)sendStateToPeer:(id)a3;
- (void)service:(id)a3 didFailMessageWithIDSIdentifier:(id)a4 error:(id)a5;
- (void)service:(id)a3 didReceiveResourceServiceMessage:(id)a4 fromID:(id)a5 incomingResponseIdentifier:(id)a6 outgoingResponseIdentifier:(id)a7;
- (void)service:(id)a3 didRequestToSendIDSMessage:(id)a4 withIDSIdentifier:(id)a5;
- (void)service:(uint64_t)a1 connectedDevicesChanged:;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation RDGizmoSideSync

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EBC8 = (uint64_t)os_log_create("com.apple.SensorKit", "RDGizmoSideSync");
  }
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 72);
    objc_setProperty_nonatomic(self, v3, 0, 48);
    objc_setProperty_nonatomic(self, v4, 0, 56);
    objc_setProperty_nonatomic(self, v5, 0, 64);
    objc_setProperty_nonatomic(self, v6, 0, 80);
    objc_setProperty_nonatomic(self, v7, 0, 88);
    objc_setProperty_nonatomic(self, v8, 0, 96);
    objc_setProperty_nonatomic(self, v9, 0, 104);
  }

  dispatch_release((dispatch_object_t)self->_q);
  v10.receiver = self;
  v10.super_class = (Class)RDGizmoSideSync;
  [(RDGizmoSideSync *)&v10 dealloc];
}

- (BOOL)isRemoteSupported
{
  return 1;
}

- (void)service:(id)a3 didReceiveResourceServiceMessage:(id)a4 fromID:(id)a5 incomingResponseIdentifier:(id)a6 outgoingResponseIdentifier:(id)a7
{
  id v11 = [a4 objectForKeyedSubscript:];
  if (v11)
  {
    v12 = v11;
    v13 = [(RDGizmoSideSync *)self delegate];
    id v14 = [v12 integerValue];
    switch((unint64_t)v14)
    {
      case 2uLL:
        if (!self) {
          goto LABEL_138;
        }
        id v21 = [a4 objectForKeyedSubscript:@"RDGizmoSyncCompanionAbsoluteTimeKey"];
        if (v21)
        {
          v22 = v21;
          id v23 = [a4 objectForKeyedSubscript:@"RDGizmoSyncGizmoAbsoluteTimeKey"];
          if (v23)
          {
            v24 = v23;
            id v25 = [a4 objectForKeyedSubscript:@"RDGizmoSyncCompanionContinuousAbsoluteOffsetKey"];
            if (v25)
            {
              v26 = v25;
              id v27 = [a4 objectForKeyedSubscript:@"RDGizmoSyncCompanionRTCContinuousOffsetKey"];
              if (v27)
              {
                v28 = v27;
                uint64_t v29 = mach_continuous_time();
                if (qword_10006EC88 != -1) {
                  dispatch_once(&qword_10006EC88, &stru_10005CDC0);
                }
                unint64_t v30 = qword_10006EC90;
                double v31 = *(double *)&qword_10006EC98;
                double v32 = *(double *)&qword_10006ECA0;
                TMConvertTicksToSeconds();
                if (v30 >= v29) {
                  double v34 = -v33;
                }
                else {
                  double v34 = v33;
                }
                v170 = 0;
                id v35 = [v24 unsignedLongLongValue];
                id v36 = [v22 unsignedLongLongValue];
                id v37 = [v26 unsignedLongLongValue];
                [v28 doubleValue];
                BOOL v39 = SRAbsoluteTimeSetSyntheticStartFromRemoteTime((unint64_t)v35, (unint64_t)v36, v38, (uint64_t)v37, (double *)&v170);
                powerAssertion = self->_powerAssertion;
                if (powerAssertion)
                {
                  CFRelease(powerAssertion);
                  self->_powerAssertion = 0;
                }
                v41 = qword_10006EBC8;
                if (v39)
                {
                  double v42 = v32 + v31 + v34;
                  if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v43 = mach_continuous_time();
                    if (qword_10006EC88 != -1) {
                      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
                    }
                    unint64_t v44 = qword_10006EC90;
                    double v45 = *(double *)&qword_10006EC98;
                    double v46 = *(double *)&qword_10006ECA0;
                    TMConvertTicksToSeconds();
                    if (v44 >= v43) {
                      double v47 = -v47;
                    }
                    *(_DWORD *)buf = 134349056;
                    *(double *)&buf[4] = v46 + v45 + v47;
                    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Time synced with remote. New current time is: %{public}f", buf, 0xCu);
                  }
                  v48 = [(RDGizmoSideSync *)self delegate];
                  [(RDGizmoSyncDelegate *)v48 gizmoSync:self didSyncRTCOffset:*(double *)&v170 timeBeforeUpdate:v42];
                  gizmoSyncService = self->_gizmoSyncService;
                  if (!gizmoSyncService) {
                    goto LABEL_152;
                  }
LABEL_139:
                  id v123 = sub_100024F68((uint64_t)gizmoSyncService);
                  id v124 = sub_100024DD4(gizmoSyncService, (uint64_t)v123, [(IDSService *)gizmoSyncService->_resourceService devices]);
LABEL_140:
                  v125 = sub_100039FA8(0, v124, self->_fileURLs, self->_defaults);
                  v126 = sub_100013D80([RDIDSMessageStore alloc], v125);
                  v154[0] = _NSConcreteStackBlock;
                  v154[1] = 3221225472;
                  v154[2] = sub_100021308;
                  v154[3] = &unk_10005D248;
                  v154[4] = v126;
                  sub_100013E44((uint64_t)v126, (uint64_t)v154);

                  return;
                }
                if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_FAULT))
                {
                  SRAbsoluteTime Current = SRAbsoluteTimeGetCurrent();
                  TMGetKernelMonotonicClock();
                  uint64_t v134 = v133;
                  uint64_t v135 = mach_continuous_time();
                  id v136 = [v24 unsignedLongLongValue];
                  id v137 = [v22 unsignedLongLongValue];
                  id v138 = [v26 unsignedLongLongValue];
                  [v28 doubleValue];
                  *(_DWORD *)buf = 134219520;
                  *(SRAbsoluteTime *)&buf[4] = Current;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v134;
                  *(_WORD *)&buf[22] = 2048;
                  v159 = (__CFString *)v135;
                  __int16 v160 = 2048;
                  id v161 = v136;
                  __int16 v162 = 2048;
                  id v163 = v137;
                  __int16 v164 = 2048;
                  id v165 = v138;
                  __int16 v166 = 2048;
                  uint64_t v167 = v139;
                  _os_log_fault_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_FAULT, "Invalid time synced with remote. currentTime: %f, currentRTC: %f, currentContinuous: %llu, localAbsolute: %llu, remoteAbsolute: %llu, remoteContinuousAbsoluteOffset: %llu, remoteRTCContinuousOffset: %f", buf, 0x48u);
                  gizmoSyncService = self->_gizmoSyncService;
                  if (gizmoSyncService) {
                    goto LABEL_139;
                  }
                  goto LABEL_152;
                }
                goto LABEL_138;
              }
              v98 = qword_10006EBC8;
              if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                v99 = "Time sync requested but no companion RTC/continuous offset provided";
LABEL_124:
                _os_log_error_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, v99, buf, 2u);
                gizmoSyncService = self->_gizmoSyncService;
                if (gizmoSyncService) {
                  goto LABEL_139;
                }
LABEL_152:
                id v124 = 0;
                goto LABEL_140;
              }
            }
            else
            {
              v98 = qword_10006EBC8;
              if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                v99 = "Time sync requested but no companion continuous/absolute offset provided";
                goto LABEL_124;
              }
            }
          }
          else
          {
            v98 = qword_10006EBC8;
            if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v99 = "Time sync requested but no gizmo absolute time provided";
              goto LABEL_124;
            }
          }
        }
        else
        {
          v98 = qword_10006EBC8;
          if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v99 = "Time sync requested but no companion absolute time provided";
            goto LABEL_124;
          }
        }
LABEL_138:
        gizmoSyncService = self->_gizmoSyncService;
        if (gizmoSyncService) {
          goto LABEL_139;
        }
        goto LABEL_152;
      case 3uLL:
        id v50 = [a4 objectForKeyedSubscript:@"RDGizmoSyncSensorIdentifierKey"];
        id v51 = [a4 objectForKeyedSubscript:@"RDGizmoSyncSamplesURLKey"];
        sub_10002135C((uint64_t)self, (uint64_t)[v51 lastPathComponent]);
        if (self)
        {
          fileURLs = self->_fileURLs;
          defaults = self->_defaults;
        }
        else
        {
          fileURLs = 0;
          defaults = 0;
        }
        v54 = sub_100039FA8(v50, 0, fileURLs, defaults);
        v55 = (NSString *)sub_100012F98([RDEncryptingDatastore alloc], v54);
        v56 = sub_1000132D8(v55, (char *)[v51 lastPathComponent]);

        v57 = (__CFString *)[[a4 objectForKeyedSubscript:@"RDGizmoSyncArchiveTransferStatusKey"] integerValue];
        v58 = qword_10006EBC8;
        if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v50;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v56;
          *(_WORD *)&buf[22] = 2050;
          v159 = v57;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Archive Transfer Status for %{public}@ with key %{public}@ unarchived on companion: %{public}ld", buf, 0x20u);
        }
        self;
        if (qword_10006ECB0)
        {
          v59 = self->_fileURLs;
          v141 = (void *)qword_10006ECB0;
          uint64_t v157 = qword_10006ECB0;
          v60 = sub_10001BB24((uint64_t)v59, (uint64_t)+[NSArray arrayWithObjects:&v157 count:1], v50);
          id v61 = [v51 lastPathComponent];
          v62 = v60;
          p_cb = &OBJC_PROTOCOL___CBPeripheralDelegate.cb;
          v64 = +[NSURL fileURLWithPath:v61 isDirectory:0 relativeToURL:v62];
          v65 = [(RDGizmoSideSync *)self analyticsDelegate];
          obj = v64;
          switch((unint64_t)v57)
          {
            case 0uLL:
              goto LABEL_105;
            case 1uLL:
              if (![+[NSFileManager defaultManager] fileExistsAtPath:[(NSURL *)v64 path]])
              {
                v127 = qword_10006EBC8;
                if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)&buf[4] = v64;
                  _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_INFO, "Already received no key status for %{public}@", buf, 0xCu);
                }
                return;
              }
              [(RDAnalyticsEventDelegate *)v65 gizmoSync:self didDeliverAndUnarchive:v64 sensor:v50 keyName:v56 archiveStatus:9];
              v170 = 0;
              v108 = qword_10006EBC8;
              if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v50;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v64;
                _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_INFO, "Attempting to mark %{public}@/%{public}@ as delivered", buf, 0x16u);
              }
              v109 = sub_100039FA8(v50, v141, self->_fileURLs, self->_defaults);
              v110 = sub_10000F800([RDArchiveableDatastore alloc], (void **)&v109->super.isa);
              char v111 = sub_100012264((uint64_t)v110, (char *)v64, (NSURL **)&v170);

              if ((v111 & 1) == 0)
              {
                v131 = qword_10006EBC8;
                if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  *(void *)&buf[4] = v64;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v50;
                  *(_WORD *)&buf[22] = 2114;
                  v159 = v170;
                  _os_log_error_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_ERROR, "Failed to mark snapshot %{public}@ as delivered for sensor %{public}@ because %{public}@", buf, 0x20u);
                }
                return;
              }
              v112 = self->_gizmoSyncService;
              if (v112) {
                goto LABEL_120;
              }
              id v114 = 0;
              goto LABEL_121;
            case 2uLL:
              v100 = qword_10006EBC8;
              if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "Error unarchiving on the companion. Removing our local snapshot", buf, 2u);
              }
LABEL_105:
              if (v57) {
                uint64_t v101 = 4;
              }
              else {
                uint64_t v101 = 3;
              }
              v102 = obj;
              [(RDAnalyticsEventDelegate *)v65 gizmoSync:self didDeliverAndUnarchive:obj sensor:v50 keyName:v56 archiveStatus:v101];
              v103 = qword_10006EBC8;
              if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT))
              {
                v104 = [(NSURL *)obj lastPathComponent];
                *(_DWORD *)buf = 138543362;
                *(void *)&buf[4] = v104;
                _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "Snapshot has been sent, removing %{public}@", buf, 0xCu);
              }
              self;
              if (qword_10006ECB0)
              {
                v105 = sub_100039FA8(v50, (void *)qword_10006ECB0, self->_fileURLs, self->_defaults);
                id v106 = sub_10000CC60([RDPruneableDatastore alloc], (void **)&v105->super.isa);
                v170 = 0;
                int v107 = sub_10000DC68((uint64_t)v106, (const char *)[(NSURL *)obj lastPathComponent], (uint64_t)&v170);

                if ([(__CFString *)v170 code] == (id)260 || [(__CFString *)v170 code] == (id)4)
                {
                  int v107 = 1;
                }
                else
                {
                  v129 = v170;
                  if (v170)
                  {
                    v130 = qword_10006EBC8;
                    if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      *(void *)&buf[4] = obj;
                      *(_WORD *)&buf[12] = 2114;
                      *(void *)&buf[14] = v129;
                      _os_log_error_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_ERROR, "Failed to remove snapshot URL %{public}@ because %{public}@", buf, 0x16u);
                    }
                  }
                }
                p_cb = (_DWORD *)(&OBJC_PROTOCOL___CBPeripheralDelegate + 64);
              }
              else
              {
                v117 = qword_10006EBC8;
                if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_ERROR, "Failed to find current device id", buf, 2u);
                }
                int v107 = 0;
                v102 = obj;
              }
              v118 = *((void *)p_cb + 377);
              if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v102;
                *(_WORD *)&buf[12] = 1026;
                *(_DWORD *)&buf[14] = v107;
                _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "Attempted to remove snapshot %{public}@ (%{public, BOOL}d)", buf, 0x12u);
              }
              if (!v107) {
                return;
              }
              if (a7)
              {
                v119 = self->_gizmoSyncService;
                *(void *)buf = &off_100061080;
                v170 = @"RDGizmoSyncMessageTypeKey";
                CFStringRef v171 = @"RDGizmoSyncSnapshotKey";
                v120 = [(NSURL *)v102 path];
                CFStringRef v172 = @"RDGizmoSyncSensorIdentifierKey";
                *(void *)&buf[8] = v120;
                *(void *)&buf[16] = v50;
                v121 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v170 count:3];
                uint64_t v168 = IDSSendMessageOptionPeerResponseIdentifierKey;
                id v169 = a7;
                v122 = +[NSDictionary dictionaryWithObjects:&v169 forKeys:&v168 count:1];
                if (v119) {
                  sub_1000250CC((uint64_t)v119, v121, v119->_resourceService, (uint64_t)v122);
                }
                v112 = self->_gizmoSyncService;
                if (v112)
                {
LABEL_120:
                  id v113 = sub_100024F68((uint64_t)self->_gizmoSyncService);
                  id v114 = sub_100024DD4(v112, (uint64_t)v113, [(IDSService *)v112->_resourceService devices]);
                }
                else
                {
                  id v114 = 0;
                }
LABEL_121:
                v115 = sub_100039FA8(v50, v114, self->_fileURLs, self->_defaults);
                v116 = sub_100013D80([RDIDSMessageStore alloc], v115);
                sub_1000149FC((uint64_t)v116, (const char *)a7);

                [(RDGizmoSideSync *)self sendSnapshotForSensor:v50 deviceId:v141];
                return;
              }
              v128 = *((void *)p_cb + 377);
              if (!os_log_type_enabled(v128, OS_LOG_TYPE_FAULT)) {
                return;
              }
              *(_WORD *)buf = 0;
              v17 = "Companion should have sent an archive message ID";
              v18 = v128;
              uint32_t v19 = 2;
              break;
            case 3uLL:
            case 4uLL:
              uint64_t v16 = qword_10006EBC8;
              if (!os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_FAULT)) {
                return;
              }
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v57;
              v17 = "Should not be receiving archive status %ld on the watch";
              goto LABEL_5;
            default:
              return;
          }
          goto LABEL_6;
        }
        v96 = qword_10006EBC8;
        if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v97 = "Failed to find current device id";
          goto LABEL_96;
        }
        return;
      case 4uLL:
        v66 = qword_10006EBC8;
        if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = a4;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Received companion state: %{public}@", buf, 0xCu);
        }
        if (self)
        {
          v67 = self->_gizmoSyncService;
          if (v67)
          {
            id v68 = sub_100024DD4(v67, (uint64_t)a5, [(IDSService *)v67->_resourceService devices]);
            if (v68)
            {
              id v69 = v68;
              v70 = objc_alloc_init(RDGizmoSyncState);
              id v71 = [[objc_msgSend(a4, "objectForKeyedSubscript:", @"RDGizmoSyncCompanionPrerequisitesKey") integerValue];
              if (v70) {
                v70->_prerequisites = (unint64_t)v71;
              }
              unsigned __int8 v72 = [[objc_msgSend(a4, "objectForKeyedSubscript:", @"RDGizmoSyncCompanionRequiredAppInstalledKey") boolValue];
              if (v70)
              {
                v70->_requiredAppInstalled_deprecated = v72;
                id v73 = [a4 objectForKeyedSubscript:@"RDGizmoSyncCompanionRecordingStatesKey"];
                objc_setProperty_nonatomic(v70, v74, v73, 16);
                id v75 = [a4 objectForKeyedSubscript:@"RDGizmoSyncCompanionServiceStartTimesKey"];
                objc_setProperty_nonatomic(v70, v76, v75, 24);
              }
              else
              {
                [a4 objectForKeyedSubscript:@"RDGizmoSyncCompanionRecordingStatesKey"];
                [a4 objectForKeyedSubscript:@"RDGizmoSyncCompanionServiceStartTimesKey"];
              }
              id v77 = [[objc_msgSend(a4, "objectForKeyedSubscript:", @"RDGizmoSyncCapabilitiesKey") unsignedIntegerValue];
              if (v70)
              {
                v70->_capabilities = (unint64_t)v77;
                id v78 = [a4 objectForKeyedSubscript:@"RDGizmoSyncSensorConfigurations"];
                objc_setProperty_nonatomic(v70, v79, v78, 40);
              }
              else
              {
                [a4 objectForKeyedSubscript:@"RDGizmoSyncSensorConfigurations"];
              }
              [(RDGizmoSyncDelegate *)v13 gizmoSync:self didSyncState:v70 deviceID:v69];

              self->_marshalledCapabilities = 0;
              -[RDGizmoSideSync service:connectedDevicesChanged:]_0((uint64_t)self);
              goto LABEL_50;
            }
          }
        }
        v96 = qword_10006EBC8;
        if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v97 = "Failed to find remote device id";
          goto LABEL_96;
        }
        return;
      case 5uLL:
LABEL_50:
        id obja = [a4 objectForKeyedSubscript:@"RDGizmoSyncCompanionRequiredKeysKey"];
        v80 = qword_10006EBC8;
        if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = obja;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Received request for keys %{public}@", buf, 0xCu);
        }
        self;
        v81 = (void *)qword_10006ECB0;
        if (qword_10006ECB0)
        {
          unsigned __int8 v145 = sub_10001FE50((void **)&self->super.isa);
          long long v150 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          long long v153 = 0u;
          id v142 = [obja countByEnumeratingWithState:&v150 objects:v156 count:16];
          if (v142)
          {
            uint64_t v140 = *(void *)v151;
            do
            {
              for (i = 0; i != v142; i = (char *)i + 1)
              {
                if (*(void *)v151 != v140) {
                  objc_enumerationMutation(obja);
                }
                v83 = *(void **)(*((void *)&v150 + 1) + 8 * i);
                if ((v145 & 2) != 0) {
                  id v84 = objc_alloc_init((Class)NSMutableArray);
                }
                else {
                  id v84 = 0;
                }
                long long v148 = 0u;
                long long v149 = 0u;
                long long v146 = 0u;
                long long v147 = 0u;
                id v85 = [obja objectForKeyedSubscript:v83];
                v86 = (char *)[v85 countByEnumeratingWithState:&v146 objects:v155 count:16];
                if (v86)
                {
                  v87 = v86;
                  uint64_t v88 = *(void *)v147;
                  if ((v145 & 2) != 0)
                  {
                    do
                    {
                      for (j = 0; j != v87; ++j)
                      {
                        if (*(void *)v147 != v88) {
                          objc_enumerationMutation(v85);
                        }
                        v90 = sub_10002193C((NSDictionary *)self, *(char **)(*((void *)&v146 + 1) + 8 * (void)j), v83, v81);
                        if ([(NSDictionary *)v90 count]) {
                          [v84 addObject:v90];
                        }
                      }
                      v87 = (char *)[v85 countByEnumeratingWithState:&v146 objects:v155 count:16];
                    }
                    while (v87);
                  }
                  else if (self)
                  {
                    do
                    {
                      for (k = 0; k != v87; ++k)
                      {
                        if (*(void *)v147 != v88) {
                          objc_enumerationMutation(v85);
                        }
                        v92 = sub_10002193C((NSDictionary *)self, *(char **)(*((void *)&v146 + 1) + 8 * (void)k), v83, v81);
                        if ([(NSDictionary *)v92 count])
                        {
                          v93 = self->_gizmoSyncService;
                          if (v93) {
                            sub_1000250CC((uint64_t)v93, v92, v93->_keyService, 0);
                          }
                        }
                      }
                      v87 = (char *)[v85 countByEnumeratingWithState:&v146 objects:v155 count:16];
                    }
                    while (v87);
                  }
                  else
                  {
                    while (1)
                    {
                      if (*(void *)v147 != v88) {
                        objc_enumerationMutation(v85);
                      }
                      [0 count];
                      if (!--v87)
                      {
                        v87 = (char *)[v85 countByEnumeratingWithState:&v146 objects:v155 count:16];
                        if (!v87) {
                          break;
                        }
                      }
                    }
                  }
                }
                if ([v84 count])
                {
                  if (self)
                  {
                    v170 = @"RDGizmoSyncMessageTypeKey";
                    CFStringRef v171 = @"RDGizmoSyncKeysKey";
                    *(void *)buf = &off_100061038;
                    *(void *)&buf[8] = v84;
                    CFStringRef v172 = @"RDGizmoSyncSensorIdentifierKey";
                    *(void *)&buf[16] = v83;
                    v94 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v170 count:3];
                    v95 = self->_gizmoSyncService;
                    if (v95) {
                      sub_1000250CC((uint64_t)v95, v94, v95->_keyService, 0);
                    }
                  }
                }
              }
              id v142 = [obja countByEnumeratingWithState:&v150 objects:v156 count:16];
            }
            while (v142);
          }
        }
        else
        {
          v96 = qword_10006EBC8;
          if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v97 = "Failed to find current device id";
LABEL_96:
            _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, v97, buf, 2u);
          }
        }
        return;
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
        id v15 = v14;
        uint64_t v16 = qword_10006EBC8;
        if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v15;
          v17 = "Shouldn't receive message type %ld on gizmo side";
LABEL_5:
          v18 = v16;
          uint32_t v19 = 12;
LABEL_6:
          _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, v17, buf, v19);
        }
        return;
      default:
        return;
    }
  }
  v20 = qword_10006EBC8;
  if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "No message id key found. Ignoring message", buf, 2u);
  }
}

- (void)service:(uint64_t)a1 connectedDevicesChanged:
{
  if (!a1) {
    return;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (([*(id *)(a1 + 104) sensorKitActive] & 1) == 0)
  {
    v12 = qword_10006EBC8;
    if (!os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)buf = 0;
    v13 = "Skipping time sync because SensorKit is not authorized";
    goto LABEL_14;
  }
  uint64_t v2 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v3 = qword_10006EC90;
  double v4 = *(double *)&qword_10006EC98;
  double v5 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v3 >= v2) {
    double v6 = -v6;
  }
  double v7 = v5 + v4 + v6;
  uint64_t v8 = *(void *)(a1 + 88);
  if (v8)
  {
    double v9 = vabdd_f64(v7, *(double *)(v8 + 32));
    if (v9 < sub_10002BCA0(*(void *)(a1 + 80)))
    {
LABEL_9:
      objc_super v10 = qword_10006EBC8;
      if (!os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_DWORD *)buf = 134349056;
      double v45 = v9;
      id v11 = "Skipping time sync because we synced %{public}f seconds ago";
      goto LABEL_11;
    }
  }
  else
  {
    double v9 = vabdd_f64(v7, 0.0);
    if (v9 < sub_10002BCA0(*(void *)(a1 + 80))) {
      goto LABEL_9;
    }
  }
  __uint64_t v14 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v15 = *(void *)(a1 + 112);
  if (v14 < v15)
  {
    __uint64_t v16 = v14;
    v17 = qword_10006EBC8;
    if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349312;
      double v45 = *(double *)&v16;
      __int16 v46 = 2050;
      __uint64_t v47 = v15;
      _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "clock_gettime_nsec_np(CLOCK_MONOTONIC_RAW) is not increasing monotonically: now %{public}llu, before: %{public}llu", buf, 0x16u);
    }
    return;
  }
  double v18 = (double)((v14 - v15) / 0x3B9ACA00);
  double v19 = sub_10002BCA0(*(void *)(a1 + 80));
  uint64_t v20 = *(void *)(a1 + 120);
  double v21 = (double)(v20 * v20 * XPC_ACTIVITY_INTERVAL_1_MIN);
  double v22 = fmin(v21, v19);
  if (v19 > v21) {
    uint64_t v23 = v20 + 1;
  }
  else {
    uint64_t v23 = 0;
  }
  *(void *)(a1 + 120) = v23;
  if (v22 <= v18)
  {
    if ([*(id *)(a1 + 48) state] != (id)5)
    {
      double v33 = qword_10006EBC8;
      if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEBUG))
      {
        id v34 = [*(id *)(a1 + 48) state];
        *(_DWORD *)buf = 134349056;
        double v45 = *(double *)&v34;
        _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Ignoring CBManager state %{public}ld", buf, 0xCu);
      }
      return;
    }
    uint64_t v24 = *(void *)(a1 + 72);
    if (v24)
    {
      id v25 = [sub_100024C94(v24) nsuuid];
      if (v25)
      {
        id v26 = v25;
        id v27 = [*(id *)(a1 + 48) retrieveConnectedPeripheralsWithServices:&__NSArray0__struct allowAll:1];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v28 = [v27 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v40;
          while (2)
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v40 != v30) {
                objc_enumerationMutation(v27);
              }
              double v32 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              if (objc_msgSend(objc_msgSend(v32, "identifier"), "isEqual:", v26))
              {
                id v35 = qword_10006EBC8;
                if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_INFO))
                {
                  id v37 = [v32 identifier];
                  *(_DWORD *)buf = 138543362;
                  double v45 = *(double *)&v37;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Found connected peripheral %{public}@", buf, 0xCu);
                }
                objc_setProperty_nonatomic((id)a1, v36, v32, 56);
                [*(id *)(a1 + 56) setDelegate:a1];
                double v38 = *(const void **)(a1 + 16);
                if (v38)
                {
                  CFRelease(v38);
                  *(void *)(a1 + 16) = 0;
                }
                *(void *)(a1 + 16) = CPPowerAssertionCreate();
                *(void *)(a1 + 112) = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
                [*(id *)(a1 + 56) getTimeSyncData];
                return;
              }
            }
            id v29 = [v27 countByEnumeratingWithState:&v39 objects:v43 count:16];
            if (v29) {
              continue;
            }
            break;
          }
        }
        return;
      }
    }
    v12 = qword_10006EBC8;
    if (!os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)buf = 0;
    v13 = "No connected device so not updating peripherals";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v13, buf, 2u);
    return;
  }
  objc_super v10 = qword_10006EBC8;
  if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    double v45 = v18;
    id v11 = "Skipping time sync because we sent a sync request %{public}f seconds ago";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
  }
}

- (void)service:(id)a3 didFailMessageWithIDSIdentifier:(id)a4 error:(id)a5
{
  gizmoSyncService = self->_gizmoSyncService;
  if (gizmoSyncService)
  {
    id v8 = sub_100024F68((uint64_t)self->_gizmoSyncService);
    id v9 = sub_100024DD4(gizmoSyncService, (uint64_t)v8, [(IDSService *)gizmoSyncService->_resourceService devices]);
  }
  else
  {
    id v9 = 0;
  }
  objc_super v10 = sub_100039FA8(0, v9, self->_fileURLs, self->_defaults);
  __uint64_t v15 = sub_100013D80([RDIDSMessageStore alloc], v10);
  id v11 = sub_1000142D8(v15, (const char *)a4);
  id v12 = [[objc_msgSend(v11, "objectForKeyedSubscript:", @"RDGizmoSyncMessageTypeKey") integerValue];
  if (v12 == (id)2)
  {
    powerAssertion = self->_powerAssertion;
    if (powerAssertion)
    {
      CFRelease(powerAssertion);
      self->_powerAssertion = 0;
    }
  }
  else if (v12 == (id)9)
  {
    id v13 = [[objc_msgSend(v11, "objectForKeyedSubscript:", @"RDGizmoSyncSamplesURLKey") lastPathComponent];
    if (v13) {
      sub_10002135C((uint64_t)self, (uint64_t)v13);
    }
  }
  sub_1000149FC((uint64_t)v15, (const char *)a4);
}

- (void)service:(id)a3 didRequestToSendIDSMessage:(id)a4 withIDSIdentifier:(id)a5
{
  if (objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"RDGizmoSyncMessageTypeKey"), "integerValue") == (id)2)
  {
    if (a3
      && (id v9 = sub_100024F68((uint64_t)a3), sub_100024DD4(a3, (uint64_t)v9, [*((id *)a3 + 3) devices])))
    {
      gizmoSyncService = self->_gizmoSyncService;
      if (gizmoSyncService)
      {
        id v11 = sub_100024F68((uint64_t)self->_gizmoSyncService);
        id v12 = sub_100024DD4(gizmoSyncService, (uint64_t)v11, [(IDSService *)gizmoSyncService->_resourceService devices]);
      }
      else
      {
        id v12 = 0;
      }
      id v13 = sub_100039FA8(0, v12, self->_fileURLs, self->_defaults);
      __uint64_t v15 = sub_100013D80([RDIDSMessageStore alloc], v13);
      sub_1000144D8((uint64_t)v15, (const char *)a4, (uint64_t)a5);
    }
    else
    {
      __uint64_t v14 = qword_10006EBC8;
      if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No remote device ID found", buf, 2u);
      }
    }
  }
}

- (BOOL)prepareArchivesForSensor:(id)a3 deviceId:(id)a4
{
  if (!self) {
    return 0;
  }
  double v7 = sub_100039FA8(a3, a4, self->_fileURLs, self->_defaults);
  id v8 = (NSDirectoryEnumerator *)sub_10000E0F0([RDInformingDatastore alloc], v7);
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3052000000;
  v60 = sub_100022564;
  id v61 = sub_100022574;
  uint64_t v62 = 0;
  *(void *)&long long v67 = _NSConcreteStackBlock;
  *((void *)&v67 + 1) = 3221225472;
  id v68 = sub_100022580;
  id v69 = &unk_10005D270;
  BOOL v74 = (sub_10001FE50((void **)&self->super.isa) & 2) != 0;
  unsigned __int8 v72 = &v57;
  uint64_t v73 = 20;
  v70 = self;
  id v71 = a3;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v48 = v8;
  objc_super v10 = sub_10000E964(v8, v9);
  id v12 = [(NSDirectoryEnumerator *)v10 countByEnumeratingWithState:&v53 objects:v78 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v54;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v54 != v13) {
          objc_enumerationMutation(v10);
        }
        __uint64_t v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        __uint64_t v16 = qword_10006EBC8;
        if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Snapshot %{public}@ found. Resending key but not regerating archive.", (uint8_t *)&buf, 0xCu);
        }
        v17 = sub_10002193C((NSDictionary *)self, (char *)[v15 lastPathComponent], a3, a4);
        if ([(NSDictionary *)v17 count]) {
          v68((uint64_t)&v67, v17);
        }
      }
      id v12 = [(NSDirectoryEnumerator *)v10 countByEnumeratingWithState:&v53 objects:v78 count:16];
    }
    while (v12);
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  double v18 = sub_10000EB64(v48, v11);
  id v19 = [(NSDirectoryEnumerator *)v18 countByEnumeratingWithState:&v49 objects:&v63 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v50;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v50 != v20) {
          objc_enumerationMutation(v18);
        }
        double v22 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
        uint64_t v23 = qword_10006EBC8;
        if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Snapshot %{public}@ found. Resending key for delivered snapshot but not regerating archive.", (uint8_t *)&buf, 0xCu);
        }
        uint64_t v24 = sub_10002193C((NSDictionary *)self, (char *)[v22 lastPathComponent], a3, a4);
        if ([(NSDictionary *)v24 count]) {
          v68((uint64_t)&v67, v24);
        }
      }
      id v19 = [(NSDirectoryEnumerator *)v18 countByEnumeratingWithState:&v49 objects:&v63 count:16];
    }
    while (v19);
  }
  if ([(id)v58[5] count])
  {
    uint64_t v25 = v58[5];
    v75[0] = @"RDGizmoSyncMessageTypeKey";
    v75[1] = @"RDGizmoSyncKeysKey";
    *(void *)&long long buf = &off_100061038;
    *((void *)&buf + 1) = v25;
    v75[2] = @"RDGizmoSyncSensorIdentifierKey";
    id v77 = a3;
    id v26 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v75 count:3];
    gizmoSyncService = self->_gizmoSyncService;
    if (gizmoSyncService) {
      sub_1000250CC((uint64_t)gizmoSyncService, v26, gizmoSyncService->_keyService, 0);
    }
  }

  _Block_object_dispose(&v57, 8);
  id v28 = sub_100039FA8(a3, a4, self->_fileURLs, self->_defaults);
  id v29 = sub_10000E0F0([RDInformingDatastore alloc], v28);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  double v31 = sub_10000EA64(v29, v30);
  id v32 = [(NSDirectoryEnumerator *)v31 countByEnumeratingWithState:&v63 objects:v78 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v64;
LABEL_29:
    uint64_t v34 = 0;
    while (1)
    {
      if (*(void *)v64 != v33) {
        objc_enumerationMutation(v31);
      }
      id v35 = *(void **)(*((void *)&v63 + 1) + 8 * v34);
      id v36 = qword_10006EBC8;
      if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v67) = 138543362;
        *(void *)((char *)&v67 + 4) = v35;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Decrypted snapshot %{public}@ found. Retrying encryption", (uint8_t *)&v67, 0xCu);
      }
      if (!sub_100022728((uint64_t)self, v35, a3, a4)) {
        return 0;
      }
      if (v32 == (id)++v34)
      {
        id v32 = [(NSDirectoryEnumerator *)v31 countByEnumeratingWithState:&v63 objects:v78 count:16];
        if (v32) {
          goto LABEL_29;
        }
        break;
      }
    }
  }
  id v37 = sub_100039FA8(a3, a4, self->_fileURLs, self->_defaults);
  uint64_t v38 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v39 = qword_10006EC90;
  double v40 = *(double *)&qword_10006EC98;
  double v41 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v39 >= v38) {
    double v42 = -v42;
  }
  uint64_t v43 = [(NSURL *)sub_10001BFB4(v41 + v40 + v42) lastPathComponent];
  unint64_t v44 = sub_10000F800([RDArchiveableDatastore alloc], (void **)&v37->super.isa);
  double v45 = sub_100010E54((uint64_t)v44, (const char *)v43);

  if (!v45)
  {
    __uint64_t v47 = qword_10006EBC8;
    if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v78 = 138543362;
      id v79 = a3;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "No archive created for %{public}@", v78, 0xCu);
    }
    return 0;
  }

  return sub_100022728((uint64_t)self, v45, a3, a4);
}

- (void)sendSnapshotForSensor:(id)a3 deviceId:(id)a4
{
  if (self)
  {
    fileURLs = self->_fileURLs;
    defaults = self->_defaults;
  }
  else
  {
    fileURLs = 0;
    defaults = 0;
  }
  id v9 = sub_100039FA8(a3, a4, fileURLs, defaults);
  objc_super v10 = sub_10000E0F0([RDInformingDatastore alloc], v9);
  id v12 = sub_10000E5A4(v10, v11);
  if (v12)
  {
    uint64_t v13 = v12;
    *(void *)&long long v49 = 0;
    *((void *)&v49 + 1) = &v49;
    uint64_t v50 = 0x3052000000;
    long long v51 = sub_100022564;
    long long v52 = sub_100022574;
    uint64_t v53 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = (double *)&v42;
    uint64_t v44 = 0x2020000000;
    uint64_t v45 = 0;
    gizmoSyncService = self->_gizmoSyncService;
    if (gizmoSyncService)
    {
      id v15 = sub_100024F68((uint64_t)self->_gizmoSyncService);
      id v16 = sub_100024DD4(gizmoSyncService, (uint64_t)v15, [(IDSService *)gizmoSyncService->_resourceService devices]);
    }
    else
    {
      id v16 = 0;
    }
    v17 = sub_100039FA8(a3, v16, self->_fileURLs, self->_defaults);
    double v18 = sub_100013D80([RDIDSMessageStore alloc], v17);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100022EC8;
    v41[3] = &unk_10005D298;
    v41[4] = v13;
    v41[5] = &v49;
    v41[6] = &v42;
    sub_100013E44((uint64_t)v18, (uint64_t)v41);

    uint64_t v19 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v20 = qword_10006EC90;
    double v21 = *(double *)&qword_10006EC98;
    double v22 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v20 >= v19) {
      double v24 = -v23;
    }
    else {
      double v24 = v23;
    }
    double v25 = v43[3];
    id v26 = sub_10002BAFC(&self->_defaults->super.isa, a3);
    double v27 = v43[3];
    if (v27 <= 0.0 || (double v28 = v22 + v21 + v24, (uint64_t)v26 <= (uint64_t)(v28 - v25)))
    {
      uint64_t v30 = *(const char **)(*((void *)&v49 + 1) + 40);
      sub_100022F78((uint64_t)self);
      -[NSMutableSet addObject:](self->_inflightArchives, "addObject:", [v13 lastPathComponent]);
      if (v30)
      {
        double v31 = qword_10006EBC8;
        if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          *(void *)&uint8_t buf[4] = v30;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Cancelling previously send IDS message %{public}@", buf, 0xCu);
        }
        id v32 = self->_gizmoSyncService;
        if (v32
          && ([(IDSService *)v32->_resourceService cancelIdentifier:v30 error:0],
              (uint64_t v33 = self->_gizmoSyncService) != 0))
        {
          id v34 = sub_100024F68((uint64_t)self->_gizmoSyncService);
          id v35 = sub_100024DD4(v33, (uint64_t)v34, [(IDSService *)v33->_resourceService devices]);
        }
        else
        {
          id v35 = 0;
        }
        id v36 = sub_100039FA8(a3, v35, self->_fileURLs, self->_defaults);
        id v37 = sub_100013D80([RDIDSMessageStore alloc], v36);
        sub_1000149FC((uint64_t)v37, v30);
      }
      uint64_t v38 = self->_gizmoSyncService;
      *(void *)long long buf = a3;
      v56[0] = @"RDGizmoSyncSensorIdentifierKey";
      v56[1] = @"RDGizmoSyncSamplesURLKey";
      *(void *)&buf[8] = [v13 path];
      unint64_t v39 = +[NSDictionary dictionaryWithObjects:buf forKeys:v56 count:2];
      uint64_t v54 = IDSSendMessageOptionTimeoutKey;
      long long v55 = +[NSNumber numberWithDouble:sub_10002B968((uint64_t)self->_defaults)];
      sub_100025454((uint64_t)v38, v13, a3, (uint64_t)v39, (uint64_t)+[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1], v30 != 0);
    }
    else
    {
      id v29 = qword_10006EBC8;
      if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543874;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2050;
        *(double *)&buf[14] = v27;
        __int16 v47 = 2050;
        double v48 = v28;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Archive %{public}@ was sent too recently (%{public}f, now: %{public}f). Not resending", buf, 0x20u);
      }
      sub_100022F78((uint64_t)self);
    }

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v49, 8);
  }
  else
  {
    double v40 = qword_10006EBC8;
    if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_INFO))
    {
      LODWORD(v49) = 138543362;
      *(void *)((char *)&v49 + 4) = a3;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "No snapshot to send for %{public}@", (uint8_t *)&v49, 0xCu);
    }
  }
}

- (void)sendStateToPeer:(id)a3
{
  if (self) {
    gizmoSyncService = self->_gizmoSyncService;
  }
  else {
    gizmoSyncService = 0;
  }
  v11[0] = &off_100061050;
  v10[0] = @"RDGizmoSyncMessageTypeKey";
  v10[1] = @"RDGizmoSyncGizmoRecordingStatesKey";
  if (a3)
  {
    uint64_t v5 = *((void *)a3 + 2);
    uint64_t v6 = *((void *)a3 + 4);
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  v11[1] = v5;
  v10[2] = @"RDGizmoSyncGizmoPrerequisitesKey";
  v11[2] = +[NSNumber numberWithUnsignedInteger:v6];
  v10[3] = @"RDGizmoSyncGizmoServiceStartTimesKey";
  if (a3)
  {
    uint64_t v7 = *((void *)a3 + 3);
    uint64_t v8 = *((void *)a3 + 5);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  v10[4] = @"RDGizmoSyncSensorConfigurations";
  v11[3] = v7;
  v11[4] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];
  if (gizmoSyncService) {
    sub_1000250CC((uint64_t)gizmoSyncService, v9, gizmoSyncService->_resourceService, 0);
  }
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  uint64_t v7 = qword_10006EBC8;
  if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138543618;
    id v9 = NSStringFromSelector(a2);
    __int16 v10 = 2114;
    id v11 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@, peripheral %{public}@", (uint8_t *)&v8, 0x16u);
  }
  -[RDGizmoSideSync service:connectedDevicesChanged:]_0((uint64_t)self);
}

- (void)peripheral:(id)a3 didReceiveTimeSyncWithReferenceTime:(id)a4 localAbsolute:(id)a5 remoteAbsolute:(id)a6 receiveTime:(id)a7 GMTDelta:(id)a8 error:(id)a9
{
  if (a9)
  {
    id v10 = [a9 code:a3, a4, a5, a6, a7, a8];
    id v11 = qword_10006EBC8;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v25 = a9;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to get time sync data. %{public}@", buf, 0xCu);
        if (!self) {
          return;
        }
LABEL_12:
        powerAssertion = self->_powerAssertion;
        if (powerAssertion)
        {
          CFRelease(powerAssertion);
          self->_powerAssertion = 0;
        }
        return;
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Unable to get time sync data. Time sync will retry later.", buf, 2u);
      if (!self) {
        return;
      }
      goto LABEL_12;
    }
    if (!self) {
      return;
    }
    goto LABEL_12;
  }
  p_isa = (void **)a3;
  if (self)
  {
    connectedPeripheral = self->_connectedPeripheral;
    if (connectedPeripheral != a3)
    {
      id v15 = qword_10006EBC8;
      if (!os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      goto LABEL_9;
    }
    p_isa = (void **)&self->_gizmoSyncService->super.isa;
  }
  else if (a3)
  {
    id v15 = qword_10006EBC8;
    if (!os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    connectedPeripheral = 0;
LABEL_9:
    *(_DWORD *)long long buf = 138412546;
    id v25 = p_isa;
    __int16 v26 = 2112;
    double v27 = connectedPeripheral;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to get correct time sync data because peripheral %@ does not match expected %@", buf, 0x16u);
    return;
  }
  v23[0] = &off_100061098;
  v22[0] = @"RDGizmoSyncMessageTypeKey";
  v22[1] = @"RDGizmoSyncGizmoAbsoluteTimeKey";
  v22[2] = @"RDGizmoSyncCompanionAbsoluteTimeKey";
  v23[1] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [a5 unsignedLongLongValue]);
  v23[2] = a6;
  v17 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  uint64_t v20 = IDSSendMessageOptionTimeoutKey;
  if (self) {
    defaults = self->_defaults;
  }
  else {
    defaults = 0;
  }
  double v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_10002BF5C((uint64_t)defaults), v20);
  uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  if (p_isa) {
    sub_1000250CC((uint64_t)p_isa, v17, p_isa[3], (uint64_t)v19);
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