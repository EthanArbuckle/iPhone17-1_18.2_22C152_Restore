@interface FMDAccessoryPlaySoundAction
- (BOOL)bypassInEarCheck;
- (BOOL)forceConnection;
- (BOOL)playingSound;
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (BOOL)terminated;
- (FMDAccessoryPlaySoundAction)initWithAccessory:(id)a3 accessoryRegistry:(id)a4 channels:(id)a5;
- (FMDAccessoryRegistry)accessoryRegistry;
- (FMDBluetoothDeviceDiscovering)discovery;
- (FMDBluetoothDeviceDiscovering)earlyDiscovery;
- (FMDBluetoothManaging)bluetoothManager;
- (FMDExtAccessoryProtocol)statusController;
- (FMDInternalAccessory)accessory;
- (FMDispatchTimer)inEarTimer;
- (FMDispatchTimer)timeoutTimer;
- (FMFuture)future;
- (NSArray)channels;
- (NSDate)timeoutDate;
- (NSError)timeoutError;
- (NSNumber)duration;
- (NSNumber)inEarDetectionTimeout;
- (NSNumber)rampDownDuration;
- (NSNumber)rampUpDuration;
- (NSNumber)timeout;
- (NSString)safetyAlertType;
- (OS_dispatch_queue)serialQueue;
- (id)actionCompletion;
- (id)actionType;
- (id)commandStatusForInternalAccessoryAudioSafetyStatus:(unint64_t)a3;
- (id)completion;
- (int64_t)playSoundRetryCounter;
- (unint64_t)defaultAudioSafetyStatus;
- (void)_executePlaySoundUsingExtensions;
- (void)_playSoundEnd:(id)a3 withCode:(int64_t)a4;
- (void)_playSoundNow:(id)a3;
- (void)_stopDiscoveryForExtAccessory;
- (void)accessoryDidUpdate:(id)a3;
- (void)cancelTimer;
- (void)dealloc;
- (void)discardEarlyDiscovery;
- (void)executePlaySound;
- (void)notifyCompletionWithStatus:(id)a3;
- (void)runWithCompletion:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setAccessoryRegistry:(id)a3;
- (void)setActionCompletion:(id)a3;
- (void)setBluetoothManager:(id)a3;
- (void)setBypassInEarCheck:(BOOL)a3;
- (void)setChannels:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDefaultAudioSafetyStatus:(unint64_t)a3;
- (void)setDiscovery:(id)a3;
- (void)setDuration:(id)a3;
- (void)setEarlyDiscovery:(id)a3;
- (void)setForceConnection:(BOOL)a3;
- (void)setFuture:(id)a3;
- (void)setInEarDetectionTimeout:(id)a3;
- (void)setInEarTimer:(id)a3;
- (void)setPlaySoundRetryCounter:(int64_t)a3;
- (void)setPlayingSound:(BOOL)a3;
- (void)setRampDownDuration:(id)a3;
- (void)setRampUpDuration:(id)a3;
- (void)setSafetyAlertType:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setStatusController:(id)a3;
- (void)setTerminated:(BOOL)a3;
- (void)setTimeout:(id)a3;
- (void)setTimeoutDate:(id)a3;
- (void)setTimeoutError:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)stopSoundFromUnexpectedPanning;
- (void)terminate;
- (void)willCancelAction;
@end

@implementation FMDAccessoryPlaySoundAction

- (FMDAccessoryPlaySoundAction)initWithAccessory:(id)a3 accessoryRegistry:(id)a4 channels:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FMDAccessoryPlaySoundAction;
  v11 = [(FMDAccessoryPlaySoundAction *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(FMDAccessoryPlaySoundAction *)v11 setAccessory:v8];
    [(FMDAccessoryPlaySoundAction *)v12 setAccessoryRegistry:v9];
    [(FMDAccessoryPlaySoundAction *)v12 setChannels:v10];
    [(FMDAccessoryPlaySoundAction *)v12 setBypassInEarCheck:0];
    [(FMDAccessoryPlaySoundAction *)v12 setForceConnection:1];
    [(FMDAccessoryPlaySoundAction *)v12 setPlayingSound:0];
    [(FMDAccessoryPlaySoundAction *)v12 setTerminated:0];
    dispatch_queue_t v13 = dispatch_queue_create("FMDAccessoryPlaySoundActionQueue", 0);
    [(FMDAccessoryPlaySoundAction *)v12 setSerialQueue:v13];
  }
  return v12;
}

- (void)setBluetoothManager:(id)a3
{
  id v5 = a3;
  v6 = [(FMDAccessoryPlaySoundAction *)self accessory];
  id v7 = [v6 category];

  if (v7 != (id)3)
  {
    objc_storeStrong((id *)&self->_bluetoothManager, a3);
    if (v5)
    {
      id v8 = [(FMDAccessoryPlaySoundAction *)self earlyDiscovery];

      if (!v8)
      {
        id v9 = [v5 newDiscovery];
        [(FMDAccessoryPlaySoundAction *)self setEarlyDiscovery:v9];

        id v10 = sub_100004238();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = [(FMDAccessoryPlaySoundAction *)self earlyDiscovery];
          int v14 = 134218242;
          objc_super v15 = self;
          __int16 v16 = 2112;
          v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction(0x%lX) - earlyDiscovery %@", (uint8_t *)&v14, 0x16u);
        }
        v12 = [(FMDAccessoryPlaySoundAction *)self earlyDiscovery];
        dispatch_queue_t v13 = [(FMDAccessoryPlaySoundAction *)self duration];
        [v13 doubleValue];
        [v12 startDiscoveryForDuration:];
      }
    }
  }
}

- (id)actionType
{
  return @"AccessoryPlaySoundAction";
}

- (void)willCancelAction
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) will cancel.", (uint8_t *)&v4, 0xCu);
  }

  [(FMDAccessoryPlaySoundAction *)self notifyCompletionWithStatus:&off_1002F1E70];
  [(FMDAccessoryPlaySoundAction *)self terminate];
  [(FMDAccessoryPlaySoundAction *)self discardEarlyDiscovery];
}

- (NSNumber)timeout
{
  if (self->_timeout) {
    return self->_timeout;
  }
  else {
    return (NSNumber *)&off_1002F2200;
  }
}

- (NSNumber)inEarDetectionTimeout
{
  if (self->_inEarDetectionTimeout) {
    return self->_inEarDetectionTimeout;
  }
  else {
    return (NSNumber *)&off_1002F2210;
  }
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[FMXPCTransactionManager sharedInstance];
  [v5 beginTransaction:@"FMDAccessoryPlaySoundActionActivity"];

  [(FMDAccessoryPlaySoundAction *)self setCompletion:v4];
  v6 = [(FMDAccessoryPlaySoundAction *)self timeout];
  [v6 doubleValue];
  double v8 = v7;

  id v9 = +[NSDate dateWithTimeIntervalSinceNow:v8];
  [(FMDAccessoryPlaySoundAction *)self setTimeoutDate:v9];

  if (v8 >= 0.0)
  {
    objc_initWeak(&location, self);
    v12 = sub_100004238();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v29 = self;
      __int16 v30 = 2048;
      double v31 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) will timeout after %f", buf, 0x16u);
    }

    id v13 = objc_alloc((Class)FMDispatchTimer);
    id v14 = &_dispatch_main_q;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10002A150;
    v25[3] = &unk_1002D9238;
    objc_copyWeak(&v26, &location);
    v25[4] = self;
    id v15 = [v13 initWithQueue:&_dispatch_main_q timeout:v25 completion:v8];
    [(FMDAccessoryPlaySoundAction *)self setTimeoutTimer:v15];

    __int16 v16 = [(FMDAccessoryPlaySoundAction *)self timeoutTimer];
    [v16 start];

    v17 = [(FMDAccessoryPlaySoundAction *)self bluetoothManager];
    id v18 = [v17 newDiscovery];
    [(FMDAccessoryPlaySoundAction *)self setDiscovery:v18];

    v19 = [(FMDAccessoryPlaySoundAction *)self discovery];
    v20 = [(FMDAccessoryPlaySoundAction *)self duration];
    [v20 doubleValue];
    [v19 startDiscoveryForDuration:];

    v21 = [(FMDAccessoryPlaySoundAction *)self discovery];
    LODWORD(v19) = v21 == 0;

    if (v19)
    {
      v22 = sub_100004238();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10023C7C4();
      }
    }
    v23 = sub_100004238();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [(FMDAccessoryPlaySoundAction *)self discovery];
      *(_DWORD *)buf = 134218242;
      v29 = self;
      __int16 v30 = 2112;
      double v31 = *(double *)&v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction(0x%lX) - init newDiscovery %@", buf, 0x16u);
    }
    [(FMDAccessoryPlaySoundAction *)self discardEarlyDiscovery];
    [(FMDAccessoryPlaySoundAction *)self executePlaySound];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = sub_100004238();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) the given command expired before starting.", buf, 0xCu);
    }

    v11 = +[NSNumber numberWithInteger:qword_10031CB88];
    [(FMDAccessoryPlaySoundAction *)self notifyCompletionWithStatus:v11];

    [(FMDAccessoryPlaySoundAction *)self terminate];
  }
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (void)executePlaySound
{
  objc_initWeak(&location, self);
  id v3 = [(FMDAccessoryPlaySoundAction *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A424;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_stopDiscoveryForExtAccessory
{
  id v11 = [(FMDAccessoryPlaySoundAction *)self accessory];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = [(FMDAccessoryPlaySoundAction *)self statusController];

      if (v3)
      {
        id v4 = +[FMDExtConfigurationRegistry sharedInstance];
        id v5 = [v11 accessoryType];
        v6 = [v4 configForAccessoryType:v5];

        double v7 = [v6 infoForFeature:@"availability"];
        double v8 = [(FMDAccessoryPlaySoundAction *)self statusController];
        id v9 = [v11 accessoryIdentifier];
        id v10 = [v9 stringValue];
        [v8 stopDiscoveryForAccessory:v10 info:v7 withCompletion:&stru_1002DA1D8];
      }
    }
  }
}

- (void)_executePlaySoundUsingExtensions
{
  id v3 = sub_100059910();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[NSDate date];
    id v5 = [(FMDAccessoryPlaySoundAction *)self timeoutDate];
    [v5 timeIntervalSinceNow];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "started at time = %@ with timeout = %f", buf, 0x16u);
  }
  double v7 = [(FMDAccessoryPlaySoundAction *)self accessory];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v8 = [v7 accessoryIdentifier];
      v82 = [v8 stringValue];

      id v9 = +[FMDExtConfigurationRegistry sharedInstance];
      id v10 = [v7 accessoryType];
      id v11 = [v9 configForAccessoryType:v10];

      v83 = [v11 flavorForFeature:@"sound"];
      v77 = [v11 flavorForFeature:@"availability"];
      v12 = [v11 flavorForFeature:@"connection"];
      v81 = [(FMDAccessoryPlaySoundAction *)self accessoryRegistry];
      v80 = [v11 infoForFeature:@"sound"];
      v78 = [v11 infoForFeature:@"availability"];
      group = dispatch_group_create();
      if (!v12 || !v83)
      {
        v22 = sub_100059910();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10023C910();
        }

        [(FMDAccessoryPlaySoundAction *)self _playSoundEnd:@"Unssuported device" withCode:qword_10031CBA0];
        goto LABEL_69;
      }
      id v13 = [(FMDAccessoryPlaySoundAction *)self channels];
      BOOL v14 = [v13 count] == 0;

      if (v14)
      {
        [(FMDAccessoryPlaySoundAction *)self cancelTimer];
        v23 = sub_100059910();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = [v7 name];
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PlaySoundAction (0x%lX) Stopping sound for accessory %@", buf, 0x16u);
        }
        v25 = +[FMDExtExtensionHelper getAccessoryControllerForFeature:@"sound" flavor:v83];
        if (v25)
        {
          id v26 = [(FMDAccessoryPlaySoundAction *)self channels];
          v107[0] = _NSConcreteStackBlock;
          v107[1] = 3221225472;
          v107[2] = sub_10002C4D0;
          v107[3] = &unk_1002D9378;
          v107[4] = self;
          [v81 updateAccessory:v7 playbackChannels:v26 completion:v107];

          v27 = sub_100059910();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v25;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "daemon stop sound controller = %@", buf, 0xCu);
          }

          v28 = [(FMDAccessoryPlaySoundAction *)self rampDownDuration];
          [v28 doubleValue];
          double v30 = v29;
          v104[0] = _NSConcreteStackBlock;
          v104[1] = 3221225472;
          v104[2] = sub_10002C538;
          v104[3] = &unk_1002DA200;
          id v105 = v7;
          v106 = self;
          [v25 stopSoundForAccessory:v82 info:v80 rampDownDuration:v104 withCompletion:v30];
        }
        else
        {
          double v31 = sub_100059910();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_10023C994();
          }

          [(FMDAccessoryPlaySoundAction *)self _playSoundEnd:@"unable to get sound controller" withCode:qword_10031CBA0];
        }

        goto LABEL_69;
      }
      uint64_t v100 = 0;
      v101 = &v100;
      uint64_t v102 = 0x2020000000;
      BOOL v103 = 0;
      BOOL v103 = [v7 connectionState] != 0;
      if (!*((unsigned char *)v101 + 24) && [(FMDAccessoryPlaySoundAction *)self forceConnection])
      {
        uint64_t v15 = +[FMDExtExtensionHelper getAccessoryControllerForFeature:@"connection" flavor:v12];
        if (!v15)
        {
          v32 = sub_100059910();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = [v7 name];
            sub_10023C9C8(v33, buf, v32);
          }

          [(FMDAccessoryPlaySoundAction *)self _playSoundEnd:@"Not able to get connectionController" withCode:qword_10031CBA0];
          goto LABEL_68;
        }
        __int16 v16 = (void *)v15;
        dispatch_group_enter(group);
        v17 = [v11 infoForFeature:@"connection"];
        v97[0] = _NSConcreteStackBlock;
        v97[1] = 3221225472;
        v97[2] = sub_10002C5A8;
        v97[3] = &unk_1002DA228;
        v99 = &v100;
        id v18 = group;
        v98 = v18;
        [v16 forceConnectToAccessory:v82 info:v17 withCompletion:v97];
        v76 = v16;

        v19 = [(FMDAccessoryPlaySoundAction *)self timeoutDate];
        [v19 timeIntervalSinceNow];
        double v21 = v20;

        if (v21 < 0.0)
        {
          [(FMDAccessoryPlaySoundAction *)self _playSoundEnd:@"timeout occured before we can try to connect" withCode:qword_10031CB88];
LABEL_33:

LABEL_67:
          goto LABEL_68;
        }
        dispatch_time_t v34 = dispatch_time(0, (uint64_t)(v21 * 1000000000.0));
        if (dispatch_group_wait(v18, v34))
        {
          v35 = sub_100059910();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            sub_10023CB14();
          }

          [(FMDAccessoryPlaySoundAction *)self _playSoundEnd:@"timeout occured before we can connect" withCode:qword_10031CB88];
          goto LABEL_33;
        }
      }
      if (!*((unsigned char *)v101 + 24))
      {
        [(FMDAccessoryPlaySoundAction *)self _playSoundEnd:@"Unable to Connect" withCode:qword_10031CB88];
LABEL_68:
        _Block_object_dispose(&v100, 8);
LABEL_69:

        goto LABEL_70;
      }
      v76 = [v11 flavorForFeature:@"safetyAlert"];
      uint64_t v93 = 0;
      v94 = &v93;
      uint64_t v95 = 0x2020000000;
      char v96 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v113 = sub_10002C618;
      v114 = sub_10002C628;
      id v115 = 0;
      if ([(FMDAccessoryPlaySoundAction *)self bypassInEarCheck])
      {
LABEL_37:
        *((unsigned char *)v94 + 24) = 1;
        v36 = sub_100059910();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v108 = 0;
          v37 = "warning safet alert disabled";
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v37, v108, 2u);
          goto LABEL_47;
        }
        goto LABEL_47;
      }
      v38 = +[FMSystemInfo sharedInstance];
      if ([v38 isInternalBuild])
      {
        unsigned int v39 = +[FMPreferencesUtil BOOLForKey:@"DisableInEarCheck" inDomain:kFMDNotBackedUpPrefDomain];

        if (v39) {
          goto LABEL_37;
        }
      }
      else
      {
      }
      if ([v76 isEqualToString:@"ALWAYS"])
      {
        *((unsigned char *)v94 + 24) = 0;
        v36 = *(NSObject **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = @"ALWAYS";
        goto LABEL_47;
      }
      if (v76)
      {
        v64 = +[FMDExtExtensionHelper getAccessoryControllerForFeature:flavor:](FMDExtExtensionHelper, "getAccessoryControllerForFeature:flavor:", @"safetyAlert");
        if (!v64)
        {
          v71 = sub_100059910();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            v72 = [v7 name];
            sub_10023CA54(v72, v108, v71);
          }

          [(FMDAccessoryPlaySoundAction *)self _playSoundEnd:@"Not safe to play" withCode:qword_10031CBA0];
          goto LABEL_66;
        }
        dispatch_group_enter(group);
        v65 = [v11 infoForFeature:@"safetyAlert"];
        v89[0] = _NSConcreteStackBlock;
        v89[1] = 3221225472;
        v89[2] = sub_10002C630;
        v89[3] = &unk_1002DA250;
        v91 = &v93;
        v92 = buf;
        v66 = group;
        v90 = v66;
        [v64 safetyAlertForAccessory:v82 info:v65 withCompletion:v89];
        v75 = v64;

        v67 = [(FMDAccessoryPlaySoundAction *)self timeoutDate];
        [v67 timeIntervalSinceNow];
        double v69 = v68;

        v70 = sub_100059910();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v108 = 134217984;
          *(double *)v109 = v69;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "safety check timeout = %f", v108, 0xCu);
        }

        if (v69 >= 0.0)
        {
          dispatch_time_t v73 = dispatch_time(0, (uint64_t)(v69 * 1000000000.0));
          if (!dispatch_group_wait(v66, v73))
          {

            v36 = v64;
            goto LABEL_47;
          }
          v74 = sub_100059910();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
            sub_10023CAAC();
          }

          [(FMDAccessoryPlaySoundAction *)self _playSoundEnd:@"timeout occured while doing safety check" withCode:qword_10031CB88];
        }
        else
        {
          [(FMDAccessoryPlaySoundAction *)self _playSoundEnd:@"timeout occured before we can try to check safety status" withCode:qword_10031CB88];
        }
        id v49 = v90;
        goto LABEL_58;
      }
      *((unsigned char *)v94 + 24) = 1;
      v36 = sub_100059910();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v108 = 0;
        v37 = "warning safet alert feature not found";
        goto LABEL_39;
      }
LABEL_47:

      if (!*((unsigned char *)v94 + 24))
      {
        v59 = sub_100059910();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          int v60 = *((unsigned __int8 *)v101 + 24);
          int v61 = *((unsigned __int8 *)v94 + 24);
          uint64_t v62 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v108 = 67109634;
          *(_DWORD *)v109 = v60;
          *(_WORD *)&v109[4] = 1024;
          *(_DWORD *)&v109[6] = v61;
          __int16 v110 = 2112;
          uint64_t v111 = v62;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "returning playing sound connected = %d safe = %d safetyAlertType = %@", v108, 0x18u);
        }

        [(FMDAccessoryPlaySoundAction *)self setSafetyAlertType:*(void *)(*(void *)&buf[8] + 40)];
        [(FMDAccessoryPlaySoundAction *)self _playSoundEnd:@"Not safe to play" withCode:qword_10031CB98];
        goto LABEL_66;
      }
      v40 = sub_100059910();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        int v41 = *((unsigned __int8 *)v101 + 24);
        int v42 = *((unsigned __int8 *)v94 + 24);
        uint64_t v43 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v108 = 67109634;
        *(_DWORD *)v109 = v41;
        *(_WORD *)&v109[4] = 1024;
        *(_DWORD *)&v109[6] = v42;
        __int16 v110 = 2112;
        uint64_t v111 = v43;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "palying sound with connected = %d safe = %d safetyAlertType = %@", v108, 0x18u);
      }

      v75 = +[FMDExtExtensionHelper getAccessoryControllerForFeature:@"sound" flavor:v83];
      v44 = [(FMDAccessoryPlaySoundAction *)self statusController];
      BOOL v45 = v44 == 0;

      if (v45)
      {
        v46 = +[FMDExtExtensionHelper getAccessoryControllerForFeature:@"availability" flavor:v77 withDelegate:v81];
        [(FMDAccessoryPlaySoundAction *)self setStatusController:v46];
      }
      v47 = [(FMDAccessoryPlaySoundAction *)self statusController];
      v48 = [(FMDAccessoryPlaySoundAction *)self duration];
      [v48 doubleValue];
      [v47 startDiscoveryForAccessory:v82 duration:v78 info:&stru_1002DA270 withCompletion:];

      if (!v75)
      {
        v63 = sub_100059910();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          sub_10023CA20();
        }

        [(FMDAccessoryPlaySoundAction *)self _playSoundEnd:@"unable to get sound controller" withCode:qword_10031CBA0];
        goto LABEL_65;
      }
      id v49 = [(FMDAccessoryPlaySoundAction *)self channels];
      v50 = sub_100059910();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v108 = 138412290;
        *(void *)v109 = v49;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "channel Array = %@", v108, 0xCu);
      }

      objc_initWeak(&location, self);
      v51 = sub_100059910();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v108 = 138412290;
        *(void *)v109 = v75;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "daemon play sound controller = %@", v108, 0xCu);
      }

      [(FMDAccessoryPlaySoundAction *)self setPlaySoundRetryCounter:(char *)[(FMDAccessoryPlaySoundAction *)self playSoundRetryCounter] + 1];
      v52 = [(FMDAccessoryPlaySoundAction *)self duration];
      [v52 doubleValue];
      double v54 = v53;
      v55 = [(FMDAccessoryPlaySoundAction *)self rampDownDuration];
      [v55 doubleValue];
      double v57 = v56;
      v58 = [(FMDAccessoryPlaySoundAction *)self channels];
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = sub_10002C7F4;
      v84[3] = &unk_1002DA2C0;
      v84[4] = self;
      objc_copyWeak(&v87, &location);
      id v85 = v81;
      id v86 = v7;
      [v75 playSoundForAccessory:v82 info:v80 duration:v58 rampUpDuration:v84 channels:v54 withCompletion:v57];

      objc_destroyWeak(&v87);
      objc_destroyWeak(&location);
LABEL_58:

LABEL_65:
LABEL_66:
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v93, 8);
      goto LABEL_67;
    }
  }
LABEL_70:
}

- (void)_playSoundEnd:(id)a3 withCode:(int64_t)a4
{
  id v6 = a3;
  double v7 = sub_100059910();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [(FMDAccessoryPlaySoundAction *)self accessory];
    id v9 = [v8 name];
    int v11 = 138412546;
    v12 = v9;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "play sound failed for %@ with %@", (uint8_t *)&v11, 0x16u);
  }
  [(FMDAccessoryPlaySoundAction *)self cancelTimer];
  id v10 = +[NSNumber numberWithInteger:a4];
  [(FMDAccessoryPlaySoundAction *)self notifyCompletionWithStatus:v10];

  [(FMDAccessoryPlaySoundAction *)self terminate];
}

- (void)notifyCompletionWithStatus:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v26 = self;
    __int16 v27 = 2048;
    id v28 = [v4 integerValue];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) did finish %li", buf, 0x16u);
  }

  [(FMDAccessoryPlaySoundAction *)self setTerminated:1];
  CFStringRef v23 = @"status";
  id v24 = v4;
  id v6 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v7 = [v6 mutableCopy];

  double v8 = [(FMDAccessoryPlaySoundAction *)self safetyAlertType];
  [v7 fm_safeSetObject:v8 forKey:@"safetyAlertType"];

  id v9 = [(FMDAccessoryPlaySoundAction *)self timeoutError];
  [v7 fm_safeSetObject:v9 forKey:@"timeoutError"];

  id v10 = [(FMDAccessoryPlaySoundAction *)self future];
  [(FMDAccessoryPlaySoundAction *)self setFuture:0];
  id v11 = [v4 integerValue];
  if (v11 == (id)qword_10031CB88)
  {
    v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.icloud.findmydeviced.FMDAccessoryPlaySoundAction", [v4 integerValue], 0);
    [v10 finishWithError:v12];
  }
  else
  {
    [v10 finishWithResult:v7];
  }
  id v13 = [v4 integerValue];
  if (v13 == (id)qword_10031CB88
    || (id v14 = [v4 integerValue], v14 == (id)qword_10031CB90)
    || (id v15 = [v4 integerValue], v15 == (id)qword_10031CB98)
    || (id v16 = [v4 integerValue], v16 == (id)qword_10031CBB0)
    || (id v17 = [v4 integerValue], v17 == (id)qword_10031CBA8)
    || (id v18 = [v4 integerValue], v18 == (id)qword_10031CBB8)
    || (id v19 = [v4 integerValue], v19 == (id)qword_10031CBC0))
  {
    double v20 = [(FMDAccessoryPlaySoundAction *)self discovery];
    [v20 stopDiscovery];
  }
  double v21 = [(FMDAccessoryPlaySoundAction *)self actionCompletion];

  if (v21)
  {
    v22 = [(FMDAccessoryPlaySoundAction *)self actionCompletion];
    ((void (**)(void, id))v22)[2](v22, v7);

    [(FMDAccessoryPlaySoundAction *)self setActionCompletion:0];
  }
}

- (void)cancelTimer
{
  id v3 = [(FMDAccessoryPlaySoundAction *)self inEarTimer];
  [v3 cancel];

  [(FMDAccessoryPlaySoundAction *)self setInEarTimer:0];
  id v4 = [(FMDAccessoryPlaySoundAction *)self timeoutTimer];
  [v4 cancel];

  [(FMDAccessoryPlaySoundAction *)self setTimeoutTimer:0];
}

- (void)terminate
{
  id v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) will terminate.", (uint8_t *)&v6, 0xCu);
  }

  [(FMDAccessoryPlaySoundAction *)self setPlaySoundRetryCounter:0];
  [(FMDAccessoryPlaySoundAction *)self cancelTimer];
  id v4 = [(FMDAccessoryPlaySoundAction *)self completion];
  [(FMDAccessoryPlaySoundAction *)self setCompletion:0];
  if (v4) {
    v4[2](v4);
  }
  id v5 = +[FMXPCTransactionManager sharedInstance];
  [v5 endTransaction:@"FMDAccessoryPlaySoundActionActivity"];

  [(FMDAccessoryPlaySoundAction *)self discardEarlyDiscovery];
  [(FMDAccessoryPlaySoundAction *)self _stopDiscoveryForExtAccessory];
}

- (void)discardEarlyDiscovery
{
  id v3 = [(FMDAccessoryPlaySoundAction *)self earlyDiscovery];

  if (v3)
  {
    id v4 = sub_100004238();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(FMDAccessoryPlaySoundAction *)self earlyDiscovery];
      int v7 = 134218242;
      double v8 = self;
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction(0x%lX) - discard earlyDiscovery %@", (uint8_t *)&v7, 0x16u);
    }
    int v6 = [(FMDAccessoryPlaySoundAction *)self earlyDiscovery];
    [v6 stopDiscovery];

    [(FMDAccessoryPlaySoundAction *)self setEarlyDiscovery:0];
  }
}

- (void)dealloc
{
  [(FMDAccessoryPlaySoundAction *)self discardEarlyDiscovery];
  [(FMDAccessoryPlaySoundAction *)self _stopDiscoveryForExtAccessory];
  v3.receiver = self;
  v3.super_class = (Class)FMDAccessoryPlaySoundAction;
  [(FMDAccessoryPlaySoundAction *)&v3 dealloc];
}

- (void)_playSoundNow:(id)a3
{
  id v4 = a3;
  if ([(FMDAccessoryPlaySoundAction *)self playingSound])
  {
    id v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v26 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) already playing - ignoring.", buf, 0xCu);
    }
  }
  [(FMDAccessoryPlaySoundAction *)self setPlayingSound:1];
  [(FMDAccessoryPlaySoundAction *)self cancelTimer];
  int v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v26 = self;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) Playing sound for accessory %@", buf, 0x16u);
  }

  int v7 = [(FMDAccessoryPlaySoundAction *)self channels];
  double v8 = [(FMDAccessoryPlaySoundAction *)self duration];
  __int16 v9 = [(FMDAccessoryPlaySoundAction *)self rampUpDuration];
  if (+[FMPreferencesUtil BOOLForKey:@"CustomRampUpDurationEnabled" inDomain:kFMDPrefDomain])
  {
    uint64_t v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[FMPreferencesUtil integerForKey:@"CustomRampUpDuration" inDomain:kFMDPrefDomain]);

    __int16 v9 = (void *)v10;
  }
  [(FMDAccessoryPlaySoundAction *)self setPlaySoundRetryCounter:(char *)[(FMDAccessoryPlaySoundAction *)self playSoundRetryCounter] + 1];
  objc_initWeak((id *)buf, self);
  id v11 = +[FMDFMIPManager sharedInstance];
  [v8 doubleValue];
  double v13 = v12;
  [v9 doubleValue];
  double v15 = v14;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002D890;
  v19[3] = &unk_1002DA310;
  objc_copyWeak(&v24, (id *)buf);
  id v16 = v4;
  id v20 = v16;
  double v21 = self;
  id v17 = v7;
  id v22 = v17;
  id v18 = v8;
  id v23 = v18;
  [v11 startPlayingSoundForAccessory:v16 duration:v17 rampUpDuration:v19 channels:v13 completion:v15];

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

- (id)commandStatusForInternalAccessoryAudioSafetyStatus:(unint64_t)a3
{
  if (a3 <= 7)
  {
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *off_1002DA330[a3], v3);
    self = (FMDAccessoryPlaySoundAction *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (void)accessoryDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 accessoryIdentifier];
  int v6 = [(FMDAccessoryPlaySoundAction *)self accessory];
  int v7 = [v6 accessoryIdentifier];
  unsigned int v8 = [v5 isEqual:v7];

  if (v8)
  {
    [(FMDAccessoryPlaySoundAction *)self setAccessory:v4];
    __int16 v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218498;
      double v12 = self;
      __int16 v13 = 2112;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2048;
      id v16 = v4;
      id v10 = v14;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction(%lu) playsound accessoryDidUpdate %@(%lu)", (uint8_t *)&v11, 0x20u);
    }
    [(FMDAccessoryPlaySoundAction *)self executePlaySound];
    [(FMDAccessoryPlaySoundAction *)self stopSoundFromUnexpectedPanning];
  }
}

- (void)stopSoundFromUnexpectedPanning
{
  if ([(FMDAccessoryPlaySoundAction *)self terminated]
    || [(FMDAccessoryPlaySoundAction *)self playingSound])
  {
    id v8 = [(FMDAccessoryPlaySoundAction *)self accessory];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = [(FMDAccessoryPlaySoundAction *)self accessory];
      unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___FMDAudioAccessory];

      if (v4)
      {
        id v5 = [(FMDAccessoryPlaySoundAction *)self accessory];
        if ([v5 shouldStopSoundNow])
        {
          int v6 = sub_100004238();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stop sound from panning", buf, 2u);
          }

          [v5 updatePlaybackChannels:&__NSArray0__struct];
          int v7 = +[FMDFMIPManager sharedInstance];
          v9[0] = _NSConcreteStackBlock;
          v9[1] = 3221225472;
          v9[2] = sub_10002E45C;
          v9[3] = &unk_1002D9768;
          v9[4] = self;
          [v7 stopPlayingSoundForAccessory:v5 rampDownDuration:v9 completion:1.0];
        }
      }
    }
    else
    {
    }
  }
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (void)setTimeout:(id)a3
{
}

- (void)setInEarDetectionTimeout:(id)a3
{
}

- (NSNumber)rampUpDuration
{
  return self->_rampUpDuration;
}

- (void)setRampUpDuration:(id)a3
{
}

- (NSNumber)rampDownDuration
{
  return self->_rampDownDuration;
}

- (void)setRampDownDuration:(id)a3
{
}

- (unint64_t)defaultAudioSafetyStatus
{
  return self->_defaultAudioSafetyStatus;
}

- (void)setDefaultAudioSafetyStatus:(unint64_t)a3
{
  self->_defaultAudioSafetyStatus = a3;
}

- (FMFuture)future
{
  return self->_future;
}

- (void)setFuture:(id)a3
{
}

- (FMDBluetoothManaging)bluetoothManager
{
  return self->_bluetoothManager;
}

- (BOOL)bypassInEarCheck
{
  return self->_bypassInEarCheck;
}

- (void)setBypassInEarCheck:(BOOL)a3
{
  self->_bypassInEarCheck = a3;
}

- (BOOL)forceConnection
{
  return self->_forceConnection;
}

- (void)setForceConnection:(BOOL)a3
{
  self->_forceConnection = a3;
}

- (id)actionCompletion
{
  return self->_actionCompletion;
}

- (void)setActionCompletion:(id)a3
{
}

- (FMDInternalAccessory)accessory
{
  return (FMDInternalAccessory *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAccessory:(id)a3
{
}

- (FMDAccessoryRegistry)accessoryRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryRegistry);

  return (FMDAccessoryRegistry *)WeakRetained;
}

- (void)setAccessoryRegistry:(id)a3
{
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
}

- (FMDispatchTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (NSDate)timeoutDate
{
  return self->_timeoutDate;
}

- (void)setTimeoutDate:(id)a3
{
}

- (NSError)timeoutError
{
  return self->_timeoutError;
}

- (void)setTimeoutError:(id)a3
{
}

- (NSString)safetyAlertType
{
  return self->_safetyAlertType;
}

- (void)setSafetyAlertType:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (BOOL)playingSound
{
  return self->_playingSound;
}

- (void)setPlayingSound:(BOOL)a3
{
  self->_playingSound = a3;
}

- (BOOL)terminated
{
  return self->_terminated;
}

- (void)setTerminated:(BOOL)a3
{
  self->_terminated = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (FMDBluetoothDeviceDiscovering)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (FMDispatchTimer)inEarTimer
{
  return self->_inEarTimer;
}

- (void)setInEarTimer:(id)a3
{
}

- (int64_t)playSoundRetryCounter
{
  return self->_playSoundRetryCounter;
}

- (void)setPlaySoundRetryCounter:(int64_t)a3
{
  self->_playSoundRetryCounter = a3;
}

- (FMDExtAccessoryProtocol)statusController
{
  return self->_statusController;
}

- (void)setStatusController:(id)a3
{
}

- (FMDBluetoothDeviceDiscovering)earlyDiscovery
{
  return self->_earlyDiscovery;
}

- (void)setEarlyDiscovery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earlyDiscovery, 0);
  objc_storeStrong((id *)&self->_statusController, 0);
  objc_storeStrong((id *)&self->_inEarTimer, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_safetyAlertType, 0);
  objc_storeStrong((id *)&self->_timeoutError, 0);
  objc_storeStrong((id *)&self->_timeoutDate, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_destroyWeak((id *)&self->_accessoryRegistry);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong(&self->_actionCompletion, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
  objc_storeStrong((id *)&self->_future, 0);
  objc_storeStrong((id *)&self->_rampDownDuration, 0);
  objc_storeStrong((id *)&self->_rampUpDuration, 0);
  objc_storeStrong((id *)&self->_inEarDetectionTimeout, 0);
  objc_storeStrong((id *)&self->_timeout, 0);

  objc_storeStrong((id *)&self->_duration, 0);
}

@end