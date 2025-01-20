@interface MIBUSUController
- (BOOL)cancelled;
- (MIBUSUController)initWithDelegate:(id)a3;
- (MIBUSoftwareUpdateDelegate)delegate;
- (MIBUWiFiHelper)wifiHelper;
- (NSDictionary)phaseTranslationTable;
- (NSNumber)progress;
- (NSNumber)timeRemaining;
- (OS_dispatch_queue)suDelegateQueue;
- (SUManagerClient)manager;
- (id)_getPhaseTranslationTable;
- (unint64_t)phase;
- (void)_initSUClient;
- (void)_proccessScanResults:(id)a3 andError:(id)a4;
- (void)_purgeSoftwareUpdate;
- (void)_softwareUpdateCompleteWithError:(id)a3;
- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 downloadDidFinish:(id)a4;
- (void)client:(id)a3 downloadDidStart:(id)a4;
- (void)client:(id)a3 downloadProgressDidChange:(id)a4;
- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 installDidFinish:(id)a4;
- (void)client:(id)a3 installDidStart:(id)a4;
- (void)download:(id)a3;
- (void)forcePurge;
- (void)install;
- (void)setCancelled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setManager:(id)a3;
- (void)setPhaseTranslationTable:(id)a3;
- (void)setSuDelegateQueue:(id)a3;
- (void)setWifiHelper:(id)a3;
- (void)start;
- (void)terminate;
@end

@implementation MIBUSUController

- (MIBUSUController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MIBUSUController;
  v5 = [(MIBUSUController *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(MIBUSUController *)v5 setDelegate:v4];
    v7 = +[MIBUWiFiHelper sharedInstance];
    [(MIBUSUController *)v6 setWifiHelper:v7];

    progress = v6->_progress;
    v6->_phase = 256;
    v6->_progress = 0;

    timeRemaining = v6->_timeRemaining;
    v6->_timeRemaining = 0;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mibu_sumanagerclient_queue", 0);
    [(MIBUSUController *)v6 setSuDelegateQueue:v10];

    v11 = [(MIBUSUController *)v6 _getPhaseTranslationTable];
    [(MIBUSUController *)v6 setPhaseTranslationTable:v11];
  }
  return v6;
}

- (void)start
{
  objc_initWeak(&location, self);
  [(MIBUSUController *)self _initSUClient];
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A4F0);
  }
  v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting software update controller...", buf, 2u);
  }
  self->_phase = 257;
  if (os_variant_has_internal_content())
  {
    id v4 = +[MIBUTestPreferences sharedInstance];
    unsigned int v5 = [v4 skipWiFiAssociation];

    if (v5)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005A510);
      }
      v6 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Skipping WiFi Association...", buf, 2u);
      }
      goto LABEL_12;
    }
  }
  v7 = [(MIBUSUController *)self wifiHelper];
  id v25 = 0;
  [v7 connectAndMonitor:&v25];
  id v8 = v25;

  if (!v8)
  {
LABEL_12:
    self->_phase = 258;
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A550);
    }
    v9 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Scanning for updates ...", buf, 2u);
    }
    id v10 = objc_alloc_init((Class)SUScanOptions);
    [v10 setForced:1];
    progress = self->_progress;
    self->_progress = 0;

    timeRemaining = self->_timeRemaining;
    self->_timeRemaining = 0;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019D70;
    block[3] = &unk_10005A5A0;
    objc_copyWeak(&v24, &location);
    id v23 = v10;
    id v13 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v24);
    id v8 = 0;
    goto LABEL_17;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A530);
  }
  v14 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
    sub_10003F1B0(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  [(MIBUSUController *)self _softwareUpdateCompleteWithError:v8];
LABEL_17:
  objc_destroyWeak(&location);
}

- (void)download:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_10001A170;
  id v24 = sub_10001A180;
  id v25 = 0;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init((Class)SUMutableDownloadMetadata);
  v6 = self;
  objc_sync_enter(v6);
  if ([(MIBUSUController *)v6 cancelled])
  {
    id v13 = (id *)(v21 + 5);
    id obj = (id)v21[5];
    sub_1000102B8(&obj, 67108870, 0, @"Software Update cancelled", v7, v8, v9, v10, v15[0]);
    objc_storeStrong(v13, obj);
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A5C0);
    }
    v14 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Software Update cancelled, not starting SU download", buf, 2u);
    }
    objc_sync_exit(v6);

    [(MIBUSUController *)v6 _softwareUpdateCompleteWithError:v21[5]];
  }
  else
  {
    [v5 setDownloadOnly:1];
    id v11 = [objc_alloc((Class)SUDownloadOptions) initWithMetadata:v5 andDescriptor:v4];
    [v11 setAutoDownload:0];
    v6->_phase = 512;
    v12 = [(MIBUSUController *)v6 manager];
    v15[0] = (uint64_t)_NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = (uint64_t)sub_10001A1F0;
    v15[3] = (uint64_t)&unk_10005A608;
    v15[4] = (uint64_t)&v20;
    objc_copyWeak(&v16, &location);
    [v12 startDownloadWithOptions:v11 withResult:v15];

    objc_destroyWeak(&v16);
    objc_sync_exit(v6);
  }
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);
}

- (void)install
{
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A3F8;
  block[3] = &unk_10005A5A0;
  objc_copyWeak(&v4, &location);
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)terminate
{
  v2 = self;
  objc_sync_enter(v2);
  if (![(MIBUSUController *)v2 cancelled])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A6A8);
    }
    v3 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Terminating software update...", buf, 2u);
    }
    [(MIBUSUController *)v2 setCancelled:1];
    if (v2->_phase < 0x103)
    {
      id v4 = [(MIBUSUController *)v2 manager];

      if (v4)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005A6C8);
        }
        id v5 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidating SU client...", v10, 2u);
        }
        v6 = [(MIBUSUController *)v2 manager];
        [v6 invalidate];

        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005A6E8);
        }
        uint64_t v7 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SU client invalidated", v9, 2u);
        }
      }
    }
    else
    {
      [(MIBUSUController *)v2 _purgeSoftwareUpdate];
    }
    uint64_t v8 = [(MIBUSUController *)v2 wifiHelper];
    [v8 stopMonitor];

    v2->_phase = 1280;
  }
  objc_sync_exit(v2);
}

- (void)forcePurge
{
  id obj = self;
  objc_sync_enter(obj);
  [(MIBUSUController *)obj setCancelled:1];
  [(MIBUSUController *)obj _purgeSoftwareUpdate];
  obj->_phase = 1280;
  objc_sync_exit(obj);
}

- (void)client:(id)a3 downloadDidStart:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A708);
  }
  uint64_t v7 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Software update download started", v8, 2u);
  }
}

- (void)client:(id)a3 downloadDidFinish:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A728);
  }
  uint64_t v8 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Software update download finished", v11, 2u);
  }
  self->_phase = 1024;
  uint64_t v9 = [(MIBUSUController *)self delegate];
  uint64_t v10 = [v7 descriptor];
  [v9 downloadDidFinishForUpdate:v10];
}

- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A748);
  }
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
    sub_10003F994();
  }
  id v17 = 0;
  sub_1000102B8(&v17, 67108867, v10, @"Failed SU download", v11, v12, v13, v14, v16);
  id v15 = v17;
  [(MIBUSUController *)self _softwareUpdateCompleteWithError:v15];
}

- (void)client:(id)a3 downloadProgressDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [v5 progress];
  id v7 = [v6 phase];

  id v8 = [v5 progress];
  [v8 percentComplete];
  float v10 = v9;

  uint64_t v11 = [v5 progress];
  [v11 normalizedPercentComplete];
  float v13 = v12;

  uint64_t v14 = [v5 progress];

  [v14 timeRemaining];
  double v16 = v15;

  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A768);
  }
  id v17 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138544130;
    v26 = v7;
    __int16 v27 = 2048;
    double v28 = v10;
    __int16 v29 = 2048;
    double v30 = v13;
    __int16 v31 = 2048;
    double v32 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Software update download phase: %{public}@; progress: %f; normalized progress: %f; time remaining: %lf",
      (uint8_t *)&v25,
      0x2Au);
  }
  uint64_t v18 = [(MIBUSUController *)self phaseTranslationTable];
  uint64_t v19 = [v18 objectForKey:v7];

  if (v19)
  {
    self->_phase = [v19 unsignedIntValue];
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A788);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F9FC();
    }
  }
  *(float *)&double v20 = v13;
  uint64_t v21 = +[NSNumber numberWithFloat:v20];
  progress = self->_progress;
  self->_progress = v21;

  id v23 = +[NSNumber numberWithDouble:v16];
  timeRemaining = self->_timeRemaining;
  self->_timeRemaining = v23;
}

- (void)client:(id)a3 installDidStart:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A7A8);
  }
  id v8 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Software update installation started.", v12, 2u);
  }
  progress = self->_progress;
  self->_progress = 0;

  timeRemaining = self->_timeRemaining;
  self->_timeRemaining = 0;

  uint64_t v11 = [(MIBUSUController *)self delegate];
  [v11 installDidStartForUpdate:v7];
}

- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A7C8);
  }
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
    sub_10003FA64();
  }
  id v17 = 0;
  sub_1000102B8(&v17, 67108868, v10, @"Failed SU install", v11, v12, v13, v14, v16);
  id v15 = v17;
  [(MIBUSUController *)self _softwareUpdateCompleteWithError:v15];
}

- (void)client:(id)a3 installDidFinish:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A7E8);
  }
  id v7 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Software update installation complete!", v8, 2u);
  }
}

- (void)_softwareUpdateCompleteWithError:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(33, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001B5AC;
  v7[3] = &unk_10005A430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_proccessScanResults:(id)a3 andError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 domain];
  if ([v8 isEqualToString:SUErrorDomain])
  {
    id v9 = [v7 code];

    if (v9 == (id)3)
    {
      id v25 = 0;
      sub_1000102B8(&v25, 67108871, 0, @"Device is already up-to-date", v10, v11, v12, v13, (uint64_t)v24);
      id v14 = v25;
      goto LABEL_4;
    }
  }
  else
  {
  }
  if (v6)
  {
    id v15 = [(MIBUSUController *)self delegate];
    [v15 scanDidFinishWithResults:v6];

    goto LABEL_8;
  }
  sub_1000102B8(&v24, 67108866, v7, @"No updates found", v10, v11, v12, v13, 0);
  id v14 = v24;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A808);
  }
  uint64_t v16 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
    sub_10003FACC(v16, v17, v18, v19, v20, v21, v22, v23);
  }
LABEL_4:
  [(MIBUSUController *)self _softwareUpdateCompleteWithError:v14];

LABEL_8:
}

- (id)_getPhaseTranslationTable
{
  v4[0] = kSUDownloadPhaseStarting;
  v4[1] = kSUDownloadPhaseBrainFetching;
  v5[0] = &off_100060150;
  v5[1] = &off_100060168;
  v4[2] = kSUDownloadPhaseBrainFetchingStalled;
  v4[3] = kSUDownloadPhaseBrainVerifying;
  v5[2] = &off_100060180;
  v5[3] = &off_100060198;
  v4[4] = kSUDownloadPhaseBrainExtracting;
  v4[5] = kSUDownloadPhaseUpdateFetching;
  v5[4] = &off_1000601B0;
  v5[5] = &off_1000601C8;
  v4[6] = kSUDownloadPhaseUpdateFetchingStalled;
  v4[7] = kSUDownloadPhasePreparingForInstallation;
  v5[6] = &off_1000601E0;
  v5[7] = &off_1000601F8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];

  return v2;
}

- (void)_initSUClient
{
  v3 = [(MIBUSUController *)self manager];

  if (!v3)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A828);
    }
    id v4 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing SUManagerClient...", v8, 2u);
    }
    id v5 = objc_alloc((Class)SUManagerClient);
    id v6 = [(MIBUSUController *)self suDelegateQueue];
    id v7 = [v5 initWithDelegate:self queue:v6 clientType:0];
    [(MIBUSUController *)self setManager:v7];
  }
}

- (void)_purgeSoftwareUpdate
{
  [(MIBUSUController *)self _initSUClient];
  objc_initWeak(&location, self);
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A848);
  }
  v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling software update download...", buf, 2u);
  }
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = objc_opt_new();
  [v5 setNotifyUser:0];
  [v5 setUserRequested:0];
  id v6 = [(MIBUSUController *)self manager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001BE20;
  v13[3] = &unk_10005A938;
  objc_copyWeak(&v17, &location);
  id v7 = v5;
  id v14 = v7;
  id v15 = self;
  id v8 = v4;
  uint64_t v16 = v8;
  [v6 cancelDownloadWithOptions:v7 withResult:v13];

  dispatch_time_t v9 = dispatch_time(0, 180000000000);
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A958);
  }
  uint64_t v10 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v20 = 180;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Waiting %ds to purge SU...", buf, 8u);
  }
  if (dispatch_semaphore_wait(v8, v9))
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A978);
    }
    uint64_t v11 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003FB04(v11);
    }
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A998);
    }
    uint64_t v12 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Purged software update", buf, 2u);
    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (unint64_t)phase
{
  return self->_phase;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (NSNumber)timeRemaining
{
  return self->_timeRemaining;
}

- (MIBUSoftwareUpdateDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (MIBUWiFiHelper)wifiHelper
{
  return self->_wifiHelper;
}

- (void)setWifiHelper:(id)a3
{
}

- (SUManagerClient)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (OS_dispatch_queue)suDelegateQueue
{
  return self->_suDelegateQueue;
}

- (void)setSuDelegateQueue:(id)a3
{
}

- (NSDictionary)phaseTranslationTable
{
  return self->_phaseTranslationTable;
}

- (void)setPhaseTranslationTable:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phaseTranslationTable, 0);
  objc_storeStrong((id *)&self->_suDelegateQueue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_wifiHelper, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_timeRemaining, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

@end