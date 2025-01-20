@interface _NFACReaderSession
- (BOOL)willStartSession;
- (NFSystemPowerConsumptionMonitor)powerConsumptionReporter;
- (_NFACReaderSession)initWithRemoteObject:(id)a3 workQueue:(id)a4;
- (double)_getMaxRFTimeLimitOverride;
- (id)_readTypeATagId:(id *)a3;
- (id)_readTypeVTagId:(id *)a3;
- (id)_send7816Command:(id)a3 error:(id *)a4;
- (id)transceive:(id)a3 response:(id *)a4 maxTimeout:(double)a5;
- (void)_transceiveNTAG5VAccessoryCommand:(id)a3 callback:(id)a4;
- (void)_transceiveTypeAAccessoryCommand:(id)a3 callback:(id)a4;
- (void)checkNdefSupport:(id)a3;
- (void)checkPresence:(id)a3;
- (void)cleanup;
- (void)connectTag:(id)a3 callback:(id)a4;
- (void)didStartSession:(id)a3;
- (void)disconnectTag:(id)a3;
- (void)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4 callback:(id)a5;
- (void)handleFieldChanged:(BOOL)a3;
- (void)handleReaderBurnoutCleared;
- (void)handleReaderBurnoutTimer;
- (void)handleRemoteTagsDetected:(id)a3;
- (void)readRawNdef:(id)a3;
- (void)readTypeIdentifier:(id)a3;
- (void)restartPolling:(id)a3;
- (void)setPowerConsumptionReporter:(id)a3;
- (void)setTagDataRate:(int64_t)a3 callback:(id)a4;
- (void)startPolling:(id)a3;
- (void)startPollingForTechnology:(unsigned int)a3 lpcd:(BOOL)a4 callback:(id)a5;
- (void)stopPolling:(id)a3;
- (void)transceive:(id)a3 callback:(id)a4;
- (void)transceiveAccessoryCommand:(id)a3 callback:(id)a4;
@end

@implementation _NFACReaderSession

- (_NFACReaderSession)initWithRemoteObject:(id)a3 workQueue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_NFACReaderSession;
  result = [(_NFACSession *)&v5 initWithRemoteObject:a3 workQueue:a4];
  if (result)
  {
    result->_tagDataRate = 0;
    result->_continuousWaveEnabled = 0;
  }
  return result;
}

- (BOOL)willStartSession
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    objc_super v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 111);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    v19 = object_getClassName(self);
    __int16 v20 = 2082;
    v21 = sel_getName(a2);
    __int16 v22 = 1024;
    int v23 = 111;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v15.receiver = self;
  v15.super_class = (Class)_NFACReaderSession;
  return [(_NFACSession *)&v15 willStartSession];
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
  v6 = NFSharedSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_READER_SESSION_START", (const char *)&unk_100286819, buf, 2u);
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 118);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    v16 = object_getClassName(self);
    int v17 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v37 = v15;
    __int16 v38 = 2082;
    v39 = v16;
    __int16 v40 = 2082;
    v41 = v17;
    __int16 v42 = 1024;
    int v43 = 118;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v35.receiver = self;
  v35.super_class = (Class)_NFACReaderSession;
  [(_NFACSession *)&v35 didStartSession:v5];
  __int16 v18 = [(_NFACSession *)self driverWrapper];
  v19 = +[NFRoutingConfig none];
  id v20 = [v18 setRouting:v19];

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v21 = NFLogGetLogger();
  if (v21)
  {
    __int16 v22 = (void (*)(uint64_t, const char *, ...))v21;
    int v23 = object_getClass(self);
    BOOL v24 = class_isMetaClass(v23);
    v25 = object_getClassName(self);
    v34 = sel_getName(a2);
    uint64_t v26 = 45;
    if (v24) {
      uint64_t v26 = 43;
    }
    v22(6, "%c[%{public}s %{public}s]:%i Invoking didStartSessioncallback", v26, v25, v34, 123);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v27 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = object_getClass(self);
    if (class_isMetaClass(v28)) {
      int v29 = 43;
    }
    else {
      int v29 = 45;
    }
    v30 = object_getClassName(self);
    v31 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v37 = v29;
    __int16 v38 = 2082;
    v39 = v30;
    __int16 v40 = 2082;
    v41 = v31;
    __int16 v42 = 1024;
    int v43 = 123;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invoking didStartSessioncallback", buf, 0x22u);
  }

  v32 = [(_NFACSession *)self remoteObject];
  [v32 didStartSession:v5];
}

- (void)cleanup
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 129);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v23 = v12;
    __int16 v24 = 2082;
    v25 = object_getClassName(self);
    __int16 v26 = 2082;
    v27 = sel_getName(a2);
    __int16 v28 = 1024;
    int v29 = 129;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v13 = NFSharedSignpostLog();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFACReaderSession", buf, 2u);
  }

  if ([(_NFACSession *)self needsCleanup])
  {
    [(NFTimer *)self->_maxRFTimer stopTimer];
    if (self->_continuousWaveEnabled)
    {
      v14 = [(_NFACSession *)self driverWrapper];
      id v15 = [v14 enableContinuousWave:0 withFrequencySweep:0];

      self->_continuousWaveEnabled = 0;
    }
    sub_1001B03F0((uint64_t)self->_powerConsumptionReporter, self);
    v16 = [(_NFACSession *)self driverWrapper];
    int v17 = +[NFRoutingConfig none];
    id v18 = [v16 setRouting:v17];
  }
  v21.receiver = self;
  v21.super_class = (Class)_NFACReaderSession;
  [(_NFACSession *)&v21 cleanup];
  v19 = NFSharedSignpostLog();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFACReaderSession", buf, 2u);
  }
}

- (void)handleRemoteTagsDetected:(id)a3
{
  id v5 = a3;
  v6 = NFSharedSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_READER_TAGS_DETECTED", (const char *)&unk_100286819, buf, 2u);
  }

  if (self->_scanning)
  {
    self->_scanning = 0;
    v7 = NFSharedSignpostLog();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "scanningForTags", (const char *)&unk_100286819, buf, 2u);
    }
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 161, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    v16 = object_getClassName(self);
    int v17 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v22 = v15;
    __int16 v23 = 2082;
    __int16 v24 = v16;
    __int16 v25 = 2082;
    __int16 v26 = v17;
    __int16 v27 = 1024;
    int v28 = 161;
    __int16 v29 = 2114;
    id v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  id v18 = [(_NFACSession *)self remoteObject];
  [v18 didDetectTags:v5];
}

- (void)handleFieldChanged:(BOOL)a3
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 167);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v16 = v13;
    __int16 v17 = 2082;
    id v18 = object_getClassName(self);
    __int16 v19 = 2082;
    id v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 167;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }
}

- (id)transceive:(id)a3 response:(id *)a4 maxTimeout:(double)a5
{
  id v8 = a3;
  uint64_t v9 = [(_NFACSession *)self driverWrapper];
  curTag = self->_curTag;
  id v14 = 0;
  v11 = [v9 transceive:v8 tag:curTag maxTimeout:&v14 error:a5];

  id v12 = v14;
  *a4 = v11;

  return v12;
}

- (void)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4 callback:(id)a5
{
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_NFACReaderSession;
  uint64_t v10 = [(_NFACSession *)&v17 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100067030;
  v12[3] = &unk_100302368;
  id v13 = v9;
  SEL v14 = a2;
  BOOL v15 = a3;
  BOOL v16 = a4;
  v12[4] = self;
  id v11 = v9;
  dispatch_async(v10, v12);
}

- (void)startPolling:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 207);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v22 = v14;
    __int16 v23 = 2082;
    __int16 v24 = object_getClassName(self);
    __int16 v25 = 2082;
    __int16 v26 = sel_getName(a2);
    __int16 v27 = 1024;
    int v28 = 207;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v20.receiver = self;
  v20.super_class = (Class)_NFACReaderSession;
  BOOL v15 = [(_NFACSession *)&v20 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006770C;
  block[3] = &unk_100302390;
  block[4] = self;
  id v19 = v5;
  id v16 = v5;
  dispatch_async(v15, block);
}

- (void)startPollingForTechnology:(unsigned int)a3 lpcd:(BOOL)a4 callback:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a5;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v11(6, "%c[%{public}s %{public}s]:%i tech = 0x%04x", v14, ClassName, Name, 220, v6);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  BOOL v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v28 = v17;
    __int16 v29 = 2082;
    id v30 = object_getClassName(self);
    __int16 v31 = 2082;
    v32 = sel_getName(a2);
    __int16 v33 = 1024;
    int v34 = 220;
    __int16 v35 = 1024;
    int v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tech = 0x%04x", buf, 0x28u);
  }

  v26.receiver = self;
  v26.super_class = (Class)_NFACReaderSession;
  id v18 = [(_NFACSession *)&v26 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067A5C;
  block[3] = &unk_1003023B8;
  BOOL v25 = a4;
  int v24 = v6;
  block[4] = self;
  id v23 = v9;
  id v19 = v9;
  dispatch_async(v18, block);
}

- (void)stopPolling:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 247);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v22 = v14;
    __int16 v23 = 2082;
    int v24 = object_getClassName(self);
    __int16 v25 = 2082;
    objc_super v26 = sel_getName(a2);
    __int16 v27 = 1024;
    int v28 = 247;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v20.receiver = self;
  v20.super_class = (Class)_NFACReaderSession;
  BOOL v15 = [(_NFACSession *)&v20 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067E28;
  block[3] = &unk_100302390;
  block[4] = self;
  id v19 = v5;
  id v16 = v5;
  dispatch_async(v15, block);
}

- (void)restartPolling:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 261);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v22 = v14;
    __int16 v23 = 2082;
    int v24 = object_getClassName(self);
    __int16 v25 = 2082;
    objc_super v26 = sel_getName(a2);
    __int16 v27 = 1024;
    int v28 = 261;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v20.receiver = self;
  v20.super_class = (Class)_NFACReaderSession;
  BOOL v15 = [(_NFACSession *)&v20 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068150;
  block[3] = &unk_100302390;
  block[4] = self;
  id v19 = v5;
  id v16 = v5;
  dispatch_async(v15, block);
}

- (void)connectTag:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i tag: %{public}@", v13, ClassName, Name, 277, v7);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v28 = v16;
    __int16 v29 = 2082;
    id v30 = object_getClassName(self);
    __int16 v31 = 2082;
    v32 = sel_getName(a2);
    __int16 v33 = 1024;
    int v34 = 277;
    __int16 v35 = 2114;
    id v36 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tag: %{public}@", buf, 0x2Cu);
  }

  v26.receiver = self;
  v26.super_class = (Class)_NFACReaderSession;
  int v17 = [(_NFACSession *)&v26 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000684C8;
  block[3] = &unk_100301D60;
  block[4] = self;
  id v23 = v7;
  id v24 = v8;
  SEL v25 = a2;
  id v18 = v8;
  id v19 = v7;
  dispatch_async(v17, block);
}

- (void)disconnectTag:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 329);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v22 = v14;
    __int16 v23 = 2082;
    id v24 = object_getClassName(self);
    __int16 v25 = 2082;
    objc_super v26 = sel_getName(a2);
    __int16 v27 = 1024;
    int v28 = 329;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v20.receiver = self;
  v20.super_class = (Class)_NFACReaderSession;
  BOOL v15 = [(_NFACSession *)&v20 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068D00;
  block[3] = &unk_100302390;
  block[4] = self;
  id v19 = v5;
  id v16 = v5;
  dispatch_async(v15, block);
}

- (void)checkPresence:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 370);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v23 = v14;
    __int16 v24 = 2082;
    __int16 v25 = object_getClassName(self);
    __int16 v26 = 2082;
    __int16 v27 = sel_getName(a2);
    __int16 v28 = 1024;
    int v29 = 370;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v21.receiver = self;
  v21.super_class = (Class)_NFACReaderSession;
  BOOL v15 = [(_NFACSession *)&v21 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000692C4;
  block[3] = &unk_100301D38;
  block[4] = self;
  id v19 = v5;
  SEL v20 = a2;
  id v16 = v5;
  dispatch_async(v15, block);
}

- (void)checkNdefSupport:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 391);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v22 = v14;
    __int16 v23 = 2082;
    __int16 v24 = object_getClassName(self);
    __int16 v25 = 2082;
    __int16 v26 = sel_getName(a2);
    __int16 v27 = 1024;
    int v28 = 391;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v20.receiver = self;
  v20.super_class = (Class)_NFACReaderSession;
  BOOL v15 = [(_NFACSession *)&v20 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000698CC;
  block[3] = &unk_100302390;
  block[4] = self;
  id v19 = v5;
  id v16 = v5;
  dispatch_async(v15, block);
}

- (void)readRawNdef:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 404);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v22 = v14;
    __int16 v23 = 2082;
    __int16 v24 = object_getClassName(self);
    __int16 v25 = 2082;
    __int16 v26 = sel_getName(a2);
    __int16 v27 = 1024;
    int v28 = 404;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v20.receiver = self;
  v20.super_class = (Class)_NFACReaderSession;
  BOOL v15 = [(_NFACSession *)&v20 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069BD8;
  block[3] = &unk_100302390;
  block[4] = self;
  id v19 = v5;
  id v16 = v5;
  dispatch_async(v15, block);
}

- (void)transceive:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i ", v14, ClassName, Name, 428);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  BOOL v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v29 = v17;
    __int16 v30 = 2082;
    __int16 v31 = object_getClassName(self);
    __int16 v32 = 2082;
    __int16 v33 = sel_getName(a2);
    __int16 v34 = 1024;
    int v35 = 428;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v27.receiver = self;
  v27.super_class = (Class)_NFACReaderSession;
  id v18 = [(_NFACSession *)&v27 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006A040;
  block[3] = &unk_100301D60;
  id v23 = v7;
  __int16 v24 = self;
  id v25 = v8;
  SEL v26 = a2;
  id v19 = v8;
  id v20 = v7;
  dispatch_async(v18, block);
}

- (double)_getMaxRFTimeLimitOverride
{
  double v4 = 0.0;
  if (NFPlatformShouldLimitAccessoryReaderTime())
  {
    id v5 = +[_NFACHardwareManager sharedHardwareManager];
    unsigned int v6 = [v5 isWalletAttached];

    if (v6) {
      double v4 = 10.0;
    }
    else {
      double v4 = 3.0;
    }
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i %f", v12, ClassName, Name, 466, *(void *)&v4);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v19 = v15;
    __int16 v20 = 2082;
    objc_super v21 = object_getClassName(self);
    __int16 v22 = 2082;
    id v23 = sel_getName(a2);
    __int16 v24 = 1024;
    int v25 = 466;
    __int16 v26 = 2048;
    double v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %f", buf, 0x2Cu);
  }

  return v4;
}

- (void)_transceiveTypeAAccessoryCommand:(id)a3 callback:(id)a4
{
  unsigned int v6 = (void (**)(id, void *, void))a4;
  id v7 = a3;
  id v8 = NFSharedSignpostLog();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToTypeS", (const char *)&unk_100286819, buf, 2u);
  }

  char v39 = 0;
  int v38 = 43520;
  __int16 v40 = bswap32([v7 length]) >> 16;
  id v9 = [objc_alloc((Class)NSMutableData) initWithBytes:&v38 length:7];
  [v9 appendData:v7];

  __int16 v37 = 0;
  [v9 appendBytes:&v37 length:2];
  uint64_t v10 = [(_NFACSession *)self driverWrapper];
  curTag = self->_curTag;
  id v36 = 0;
  uint64_t v12 = [v10 transceive:v9 tag:curTag maxTimeout:&v36 error:2.0];
  id v13 = v36;

  uint64_t v14 = +[NFResponseAPDU responseWithData:v12];
  int v15 = v14;
  if (v14 && [v14 status] == 36864)
  {
    id v16 = [v15 response];
    v6[2](v6, v16, 0);

    id v17 = v13;
  }
  else
  {
    id v18 = objc_alloc((Class)NSError);
    int v19 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
    __int16 v20 = +[NSString stringWithUTF8String:"Commmand Error"];
    v54 = v20;
    objc_super v21 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    id v17 = [v18 initWithDomain:v19 code:16 userInfo:v21];

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v27 = 45;
      if (isMetaClass) {
        uint64_t v27 = 43;
      }
      v23(3, "%c[%{public}s %{public}s]:%i Command failed: %{public}@   error:%{public}@", v27, ClassName, Name, 498, v9, v17);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      __int16 v31 = object_getClassName(self);
      __int16 v32 = sel_getName(a2);
      *(_DWORD *)buf = 67110402;
      int v42 = v30;
      __int16 v43 = 2082;
      v44 = v31;
      __int16 v45 = 2082;
      v46 = v32;
      __int16 v47 = 1024;
      int v48 = 498;
      __int16 v49 = 2114;
      id v50 = v9;
      __int16 v51 = 2114;
      id v52 = v17;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Command failed: %{public}@   error:%{public}@", buf, 0x36u);
    }

    ((void (**)(id, void *, id))v6)[2](v6, 0, v17);
  }
  __int16 v33 = NFSharedSignpostLog();
  if (os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToTypeS", (const char *)&unk_100286819, buf, 2u);
  }
}

- (void)_transceiveNTAG5VAccessoryCommand:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i ", v14, ClassName, Name, 510);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v101 = v17;
    __int16 v102 = 2082;
    v103 = object_getClassName(self);
    __int16 v104 = 2082;
    v105 = sel_getName(a2);
    __int16 v106 = 1024;
    int v107 = 510;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  id v18 = NFSharedSignpostLog();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c", (const char *)&unk_100286819, buf, 2u);
  }

  id v19 = [objc_alloc((Class)NFAccessoryTagI2CBridge) initWithType:0 delegate:self];
  __int16 v20 = [(NFTagInternal *)self->_curTag tagID];
  [v19 setTagUUID:v20];

  [v19 setSelected:self->_tagSelected];
  if (self->_tagSelected) {
    goto LABEL_13;
  }
  uint64_t v53 = [v19 selectTag];
  if (!v53)
  {
    self->_tagSelected = 1;
LABEL_13:
    id v93 = 0;
    objc_super v21 = [v19 writeToBridge:v7 fragmentationSupport:1 response:&v93];
    __int16 v22 = v93;
    id v23 = v22;
    if (v21)
    {
      sel = a2;
      v91 = v22;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v24 = NFLogGetLogger();
      if (v24)
      {
        int v25 = (void (*)(uint64_t, const char *, ...))v24;
        __int16 v26 = object_getClass(self);
        id v27 = v19;
        int v28 = v21;
        int v29 = v8;
        BOOL v30 = class_isMetaClass(v26);
        id v31 = v7;
        __int16 v32 = object_getClassName(self);
        __int16 v33 = sel_getName(sel);
        __int16 v34 = [v91 NF_asHexString];
        v84 = v32;
        BOOL v35 = !v30;
        id v8 = v29;
        objc_super v21 = v28;
        id v19 = v27;
        uint64_t v36 = 45;
        if (!v35) {
          uint64_t v36 = 43;
        }
        id v7 = v31;
        v25(3, "%c[%{public}s %{public}s]:%i Failed to write payload, status=0x%{public}@", v36, v84, v33, 534, v34);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v37 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        int v38 = object_getClass(self);
        id v39 = v19;
        __int16 v40 = v21;
        v41 = v8;
        if (class_isMetaClass(v38)) {
          int v42 = 43;
        }
        else {
          int v42 = 45;
        }
        __int16 v43 = object_getClassName(self);
        v44 = sel_getName(sel);
        __int16 v45 = [v91 NF_asHexString];
        *(_DWORD *)buf = 67110146;
        int v101 = v42;
        id v8 = v41;
        objc_super v21 = v40;
        id v19 = v39;
        __int16 v102 = 2082;
        v103 = v43;
        __int16 v104 = 2082;
        v105 = v44;
        __int16 v106 = 1024;
        int v107 = 534;
        __int16 v108 = 2114;
        v109 = v45;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to write payload, status=0x%{public}@", buf, 0x2Cu);
      }
      id v46 = objc_alloc((Class)NSError);
      __int16 v47 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v96 = NSLocalizedDescriptionKey;
      int v48 = +[NSString stringWithUTF8String:"Tag Error"];
      v97 = v48;
      __int16 v49 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
      id v50 = [v46 initWithDomain:v47 code:29 userInfo:v49];
      v8[2](v8, 0, v50);

      __int16 v51 = NFSharedSignpostLog();
      if (os_signpost_enabled(v51))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c", (const char *)&unk_100286819, buf, 2u);
      }
      id v52 = v91;
    }
    else
    {
      v92 = v22;
      objc_super v21 = [v19 readFromBridge:0 fragmentationSupport:1 response:&v92];
      id v52 = v92;

      if (v21)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v69 = NFLogGetLogger();
        if (v69)
        {
          v70 = (void (*)(uint64_t, const char *, ...))v69;
          v71 = object_getClass(self);
          BOOL v72 = class_isMetaClass(v71);
          v86 = object_getClassName(self);
          v89 = sel_getName(a2);
          uint64_t v73 = 45;
          if (v72) {
            uint64_t v73 = 43;
          }
          v70(3, "%c[%{public}s %{public}s]:%i Failed to read payload, error=%{public}@", v73, v86, v89, 542, v21);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v74 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          v75 = object_getClass(self);
          if (class_isMetaClass(v75)) {
            int v76 = 43;
          }
          else {
            int v76 = 45;
          }
          v77 = object_getClassName(self);
          v78 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v101 = v76;
          __int16 v102 = 2082;
          v103 = v77;
          __int16 v104 = 2082;
          v105 = v78;
          __int16 v106 = 1024;
          int v107 = 542;
          __int16 v108 = 2114;
          v109 = v21;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to read payload, error=%{public}@", buf, 0x2Cu);
        }

        id v79 = objc_alloc((Class)NSError);
        v80 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v94 = NSLocalizedDescriptionKey;
        v81 = +[NSString stringWithUTF8String:"Tag Error"];
        v95 = v81;
        v82 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        id v83 = [v79 initWithDomain:v80 code:29 userInfo:v82];
        v8[2](v8, 0, v83);

        __int16 v51 = NFSharedSignpostLog();
        if (os_signpost_enabled(v51))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c", (const char *)&unk_100286819, buf, 2u);
        }
      }
      else
      {
        ((void (**)(id, NSObject *, id))v8)[2](v8, v52, 0);
        __int16 v51 = NFSharedSignpostLog();
        if (os_signpost_enabled(v51))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c", (const char *)&unk_100286819, buf, 2u);
          objc_super v21 = 0;
        }
      }
    }

    goto LABEL_27;
  }
  objc_super v21 = (void *)v53;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v54 = NFLogGetLogger();
  if (v54)
  {
    v55 = (void (*)(uint64_t, const char *, ...))v54;
    v56 = object_getClass(self);
    BOOL v57 = class_isMetaClass(v56);
    v85 = object_getClassName(self);
    v88 = sel_getName(a2);
    uint64_t v58 = 45;
    if (v57) {
      uint64_t v58 = 43;
    }
    v55(3, "%c[%{public}s %{public}s]:%i Tag selection failed, status=0x%{public}@", v58, v85, v88, 523, v21);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v59 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    v60 = object_getClass(self);
    if (class_isMetaClass(v60)) {
      int v61 = 43;
    }
    else {
      int v61 = 45;
    }
    v62 = object_getClassName(self);
    v63 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v101 = v61;
    __int16 v102 = 2082;
    v103 = v62;
    __int16 v104 = 2082;
    v105 = v63;
    __int16 v106 = 1024;
    int v107 = 523;
    __int16 v108 = 2114;
    v109 = v21;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag selection failed, status=0x%{public}@", buf, 0x2Cu);
  }

  id v64 = objc_alloc((Class)NSError);
  v65 = +[NSString stringWithUTF8String:"nfcd"];
  NSErrorUserInfoKey v98 = NSLocalizedDescriptionKey;
  v66 = +[NSString stringWithUTF8String:"Tag Error"];
  v99 = v66;
  v67 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
  id v68 = [v64 initWithDomain:v65 code:29 userInfo:v67];
  v8[2](v8, 0, v68);

  id v52 = NFSharedSignpostLog();
  if (os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c", (const char *)&unk_100286819, buf, 2u);
  }
LABEL_27:
}

- (void)transceiveAccessoryCommand:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i ", v14, ClassName, Name, 559);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v28 = v17;
    __int16 v29 = 2082;
    BOOL v30 = object_getClassName(self);
    __int16 v31 = 2082;
    __int16 v32 = sel_getName(a2);
    __int16 v33 = 1024;
    int v34 = 559;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v26.receiver = self;
  v26.super_class = (Class)_NFACReaderSession;
  id v18 = [(_NFACSession *)&v26 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B648;
  block[3] = &unk_100302278;
  id v24 = v8;
  SEL v25 = a2;
  void block[4] = self;
  id v23 = v7;
  id v19 = v7;
  id v20 = v8;
  dispatch_async(v18, block);
}

- (id)_readTypeVTagId:(id *)a3
{
  id v5 = +[NSData NF_dataWithHexString:@"02230003"];
  unsigned int v6 = [(_NFACSession *)self driverWrapper];
  curTag = self->_curTag;
  id v19 = 0;
  id v8 = [v6 transceive:v5 tag:curTag maxTimeout:&v19 error:2.0];
  id v9 = v19;

  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10 || (unint64_t)[v8 length] <= 0xF)
  {
    id v11 = objc_alloc((Class)NSError);
    uint64_t v12 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    id v13 = +[NSString stringWithUTF8String:"Commmand Error"];
    id v23 = v13;
    uint64_t v14 = &v23;
    int v15 = &v22;
LABEL_7:
    id v16 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v15 count:1];
    *a3 = [v11 initWithDomain:v12 code:16 userInfo:v16];

    int v17 = 0;
    goto LABEL_8;
  }
  if ((unint64_t)[v8 length] < 0x10)
  {
    id v11 = objc_alloc((Class)NSError);
    uint64_t v12 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    id v13 = +[NSString stringWithUTF8String:"Commmand Error"];
    objc_super v21 = v13;
    uint64_t v14 = &v21;
    int v15 = &v20;
    goto LABEL_7;
  }
  int v17 = [v8 subdataWithRange:[v8 length] - 6, 4];
LABEL_8:

  return v17;
}

- (id)_send7816Command:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSData NF_dataWithHexString:v6];
  id v8 = [(_NFACSession *)self driverWrapper];
  id v9 = [v8 transceive:v7 tag:self->_curTag maxTimeout:a4 error:2.0];

  BOOL v10 = +[NFResponseAPDU responseWithData:v9];
  id v11 = v10;
  if (v10 && [v10 status] == 36864)
  {
    id v12 = v11;
  }
  else
  {
    if (!*a4)
    {
      id v13 = objc_alloc((Class)NSError);
      uint64_t v14 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
      int v15 = +[NSString stringWithUTF8String:"Commmand Error"];
      __int16 v45 = v15;
      id v16 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      *a4 = [v13 initWithDomain:v14 code:16 userInfo:v16];
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v23 = 45;
      if (isMetaClass) {
        uint64_t v23 = 43;
      }
      v18(3, "%c[%{public}s %{public}s]:%i Command failed: %{public}@   error:%{public}@", v23, ClassName, Name, 627, v6, *a4);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      SEL v25 = object_getClass(self);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      id v27 = object_getClassName(self);
      int v28 = sel_getName(a2);
      id v29 = *a4;
      *(_DWORD *)buf = 67110402;
      int v33 = v26;
      __int16 v34 = 2082;
      BOOL v35 = v27;
      __int16 v36 = 2082;
      __int16 v37 = v28;
      __int16 v38 = 1024;
      int v39 = 627;
      __int16 v40 = 2114;
      id v41 = v6;
      __int16 v42 = 2114;
      id v43 = v29;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Command failed: %{public}@   error:%{public}@", buf, 0x36u);
    }

    id v12 = 0;
  }

  return v12;
}

- (id)_readTypeATagId:(id *)a3
{
  v3 = a3;
  uint64_t v6 = [(_NFACReaderSession *)self _send7816Command:@"00A4040007D276000085010100" error:a3];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(_NFACReaderSession *)self _send7816Command:@"00A4000C02E103" error:v3];

    if (v8)
    {
      id v9 = [(_NFACReaderSession *)self _send7816Command:@"00B0000000" error:v3];

      if (v9)
      {
        BOOL v10 = [v9 response];
        if ((unint64_t)[v10 length] >= 2
          && (v11 = v10, unint64_t v12 = *((unsigned __int8 *)[v11 bytes] + 1), v12 >= 4)
          && (unint64_t)[v11 length] >= v12)
        {
          v3 = [v11 subdataWithRange:(v12 - 4) length:4];
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            id v19 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            uint64_t v22 = 45;
            if (isMetaClass) {
              uint64_t v22 = 43;
            }
            v19(6, "%c[%{public}s %{public}s]:%i id: %{public}@", v22, ClassName, Name, 661, v3);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v14 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = object_getClass(self);
            if (class_isMetaClass(v23)) {
              int v24 = 43;
            }
            else {
              int v24 = 45;
            }
            *(_DWORD *)buf = 67110146;
            int v30 = v24;
            __int16 v31 = 2082;
            __int16 v32 = object_getClassName(self);
            __int16 v33 = 2082;
            __int16 v34 = sel_getName(a2);
            __int16 v35 = 1024;
            int v36 = 661;
            __int16 v37 = 2114;
            __int16 v38 = v3;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i id: %{public}@", buf, 0x2Cu);
          }
        }
        else
        {
          if (!v3)
          {
LABEL_10:

            goto LABEL_12;
          }
          id v13 = objc_alloc((Class)NSError);
          uint64_t v14 = +[NSString stringWithUTF8String:"nfcd"];
          NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
          int v15 = +[NSString stringWithUTF8String:"Commmand Error"];
          int v28 = v15;
          id v16 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          void *v3 = [v13 initWithDomain:v14 code:16 userInfo:v16];

          v3 = 0;
        }

        goto LABEL_10;
      }
    }
  }
  v3 = 0;
LABEL_12:

  return v3;
}

- (void)readTypeIdentifier:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 674);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  unint64_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v23 = v14;
    __int16 v24 = 2082;
    SEL v25 = object_getClassName(self);
    __int16 v26 = 2082;
    NSErrorUserInfoKey v27 = sel_getName(a2);
    __int16 v28 = 1024;
    int v29 = 674;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v21.receiver = self;
  v21.super_class = (Class)_NFACReaderSession;
  int v15 = [(_NFACSession *)&v21 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006C440;
  block[3] = &unk_100301D38;
  id v19 = v5;
  SEL v20 = a2;
  void block[4] = self;
  id v16 = v5;
  dispatch_async(v15, block);
}

- (void)setTagDataRate:(int64_t)a3 callback:(id)a4
{
  id v7 = a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 703);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v26 = v16;
    __int16 v27 = 2082;
    __int16 v28 = object_getClassName(self);
    __int16 v29 = 2082;
    int v30 = sel_getName(a2);
    __int16 v31 = 1024;
    int v32 = 703;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v24.receiver = self;
  v24.super_class = (Class)_NFACReaderSession;
  int v17 = [(_NFACSession *)&v24 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006C9D8;
  block[3] = &unk_100302648;
  SEL v22 = a2;
  int64_t v23 = a3;
  void block[4] = self;
  id v21 = v7;
  id v18 = v7;
  dispatch_async(v17, block);
}

- (void)handleReaderBurnoutTimer
{
  v5.receiver = self;
  v5.super_class = (Class)_NFACReaderSession;
  v3 = [(_NFACSession *)&v5 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006CD5C;
  block[3] = &unk_100301C68;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleReaderBurnoutCleared
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    objc_super v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Warning : message received - session should be gone.", v9, ClassName, Name, 736);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  BOOL v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v15 = v12;
    __int16 v16 = 2082;
    int v17 = object_getClassName(self);
    __int16 v18 = 2082;
    id v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 736;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Warning : message received - session should be gone.", buf, 0x22u);
  }
}

- (NFSystemPowerConsumptionMonitor)powerConsumptionReporter
{
  return (NFSystemPowerConsumptionMonitor *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPowerConsumptionReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerConsumptionReporter, 0);
  objc_storeStrong((id *)&self->_maxRFTimer, 0);

  objc_storeStrong((id *)&self->_curTag, 0);
}

@end