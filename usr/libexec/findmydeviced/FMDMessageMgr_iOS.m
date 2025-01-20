@interface FMDMessageMgr_iOS
+ (id)sharedInstance;
- (FMDMessage)activeMessage;
- (FMDMessageMgr_iOS)init;
- (__CFUserNotification)cfNotification;
- (id)_fillVibrationPattern:(id)a3 toDuration:(double)a4;
- (id)_vibrationPattern;
- (id)_xpcTransactionNameFor:(id)a3;
- (id)initSingleton;
- (void)_playSoundFor:(id)a3;
- (void)activateMessage:(id)a3;
- (void)dealloc;
- (void)setActiveMessage:(id)a3;
- (void)setCfNotification:(__CFUserNotification *)a3;
- (void)stopAllSounds;
- (void)stopSound;
@end

@implementation FMDMessageMgr_iOS

+ (id)sharedInstance
{
  if (qword_10031E6B0 != -1) {
    dispatch_once(&qword_10031E6B0, &stru_1002D9258);
  }
  v2 = (void *)qword_10031E6A8;
  if (!qword_10031E6A8)
  {
    v3 = sub_100004238();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** The FMDMessageMgr_iOS singleton seems to have been deallocated. This is unexpected & damaging.", v5, 2u);
    }

    v2 = (void *)qword_10031E6A8;
  }

  return v2;
}

- (FMDMessageMgr_iOS)init
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10023AF3C(v3);
  }

  return 0;
}

- (id)initSingleton
{
  v5.receiver = self;
  v5.super_class = (Class)FMDMessageMgr_iOS;
  v2 = [(FMDMessageMgr_iOS *)&v5 init];
  if (v2)
  {
    v3 = sub_100004238();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10023AF80(v3);
    }

    objc_storeStrong((id *)&qword_10031E6A8, v2);
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10023AFC4(self, v3);
  }

  v4 = (void *)qword_10031E6A8;
  qword_10031E6A8 = 0;

  v5.receiver = self;
  v5.super_class = (Class)FMDMessageMgr_iOS;
  [(FMDMessageMgr_iOS *)&v5 dealloc];
}

- (void)activateMessage:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSMutableDictionary dictionary];
  v6 = [(FMDMessageMgr_iOS *)self cfNotification];
  if (v6)
  {
    v7 = v6;
    v8 = [(FMDMessageMgr_iOS *)self activeMessage];
    v9 = +[FMXPCTransactionManager sharedInstance];
    v10 = [(FMDMessageMgr_iOS *)self _xpcTransactionNameFor:v8];
    [v9 endTransaction:v10];

    CFUserNotificationCancel(v7);
    [(FMDMessageMgr_iOS *)self setCfNotification:0];
    [(FMDMessageMgr_iOS *)self setActiveMessage:0];
  }
  unsigned __int8 v11 = +[FMPreferencesUtil BOOLForKey:@"DisableSoundPlayback" inDomain:kFMDNotBackedUpPrefDomain];
  if ([v4 showMessage])
  {
    v12 = [v4 defaultButtonTitle];
    [v5 fm_safelyMapKey:kCFUserNotificationDefaultButtonTitleKey toObject:v12];

    v13 = [v4 alternateButtonTitle];
    [v5 fm_safelyMapKey:kCFUserNotificationAlternateButtonTitleKey toObject:v13];

    v14 = [v4 msgText];
    [v5 fm_safelyMapKey:kCFUserNotificationAlertMessageKey toObject:v14];

    v15 = [v4 msgTitle];
    [v5 fm_safelyMapKey:kCFUserNotificationAlertHeaderKey toObject:v15];

    v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 showMsgInLockScreen]);
    [v5 setObject:v16 forKeyedSubscript:kCFUserNotificationAlertTopMostKey];

    v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 dismissMsgOnUnlock] ^ 1);
    [v5 setObject:v17 forKeyedSubscript:SBUserNotificationDontDismissOnUnlock];

    v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 dismissMsgOnLock]);
    [v5 setObject:v18 forKeyedSubscript:SBUserNotificationDismissOnLock];

    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationAllowMenuButtonDismissal];
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationAllowInCarKey];
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationIgnoresQuietMode];
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationSystemAperturePresentationKey];
    id v19 = objc_alloc_init((Class)SBSUserNotificationSystemApertureContentDefinition);
    v20 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FindMyDevice.framework"];
    uint64_t v21 = [v20 pathForResource:@"findiphone-asset-JINDO" ofType:@"ca"];

    v50 = (void *)v21;
    v22 = +[SBSUserNotificationCAPackageDefinition definitionWithCAPackagePath:v21];
    [v19 setLeadingAssetDefinition:v22];
    v23 = [v4 msgText];
    [v19 setAlertMessage:v23];

    v24 = [v4 msgTitle];
    [v19 setAlertHeader:v24];

    v25 = +[BSColor colorWithRed:0.287 green:1.0 blue:0.719 alpha:1.0];
    v26 = +[SBSUserNotificationColorDefinition definitionWithColor:v25];
    [v19 setKeyColor:v26];
    if (objc_opt_respondsToSelector()) {
      [v19 setPreventsAutomaticDismissal:1];
    }
    v27 = [v19 build];
    [v5 setObject:v27 forKeyedSubscript:SBUserNotificationSystemApertureContentDefinitionKey];

    if ([v4 playSound])
    {
      if (v11)
      {
        v28 = sub_100004238();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Play sound will be activated, but sound playback is disabled.", buf, 2u);
        }
      }
      else
      {
        v30 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FindMyDevice.framework"];
        v31 = [v4 soundName];
        v28 = [v30 pathForResource:v31 ofType:@"caf"];

        id v32 = [objc_alloc((Class)NSURL) initFileURLWithPath:v28 isDirectory:0];
        [v5 setObject:v32 forKeyedSubscript:kCFUserNotificationSoundURLKey];
        [v5 setObject:&off_1002F1D08 forKeyedSubscript:SBUserNotificationSoundAlertTypeKey];
        [v5 setObject:TLAlertTopicSystemNotificationFindMyDevice forKeyedSubscript:SBUserNotificationSoundAlertTopicKey];
        v33 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 soundDuration]);
        [v5 setObject:v33 forKeyedSubscript:SBUserNotificationSoundRepeatDurationKey];

        if ([v4 vibrate])
        {
          v34 = [(FMDMessageMgr_iOS *)self _vibrationPattern];
          -[FMDMessageMgr_iOS _fillVibrationPattern:toDuration:](self, "_fillVibrationPattern:toDuration:", v34, (double)(int)[v4 soundDuration]);
          v35 = id v49 = v32;

          v53[0] = @"Intensity";
          v53[1] = @"VibePattern";
          v54[0] = &off_1002F21B0;
          v54[1] = v35;
          v36 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
          [v5 setObject:v36 forKeyedSubscript:SBUserNotificationSoundVibrationPatternKey];

          id v32 = v49;
        }
      }
    }
    *(_DWORD *)buf = 0;
    [v4 timeout];
    CFUserNotificationRef v38 = CFUserNotificationCreate(kCFAllocatorDefault, v37, 3uLL, (SInt32 *)buf, (CFDictionaryRef)v5);
    if (v38)
    {
      CFUserNotificationRef v39 = v38;
      [(FMDMessageMgr_iOS *)self setActiveMessage:v4];
      [(FMDMessageMgr_iOS *)self setCfNotification:v39];
      CFRelease(v39);
      v40 = +[FMXPCTransactionManager sharedInstance];
      v41 = [(FMDMessageMgr_iOS *)self _xpcTransactionNameFor:v4];
      [v40 beginTransaction:v41];

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000083B0;
      block[3] = &unk_1002D9278;
      block[4] = v39;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v42 = sub_100004238();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_10023B05C((uint64_t)buf, v42, v43, v44, v45, v46, v47, v48);
      }
    }
  }
  else if ([v4 playSound])
  {
    if (v11)
    {
      v29 = sub_100004238();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Play sound will be activated, but sound playback is disabled.", buf, 2u);
      }
    }
    else
    {
      [(FMDMessageMgr_iOS *)self _playSoundFor:v4];
    }
  }
}

- (void)stopAllSounds
{
}

- (void)_playSoundFor:(id)a3
{
  id v3 = a3;
  id v7 = (id)objc_opt_new();
  [v7 setSoundDuration:[v3 soundDuration]];
  id v4 = [v3 soundName];
  [v7 setSoundName:v4];

  id v5 = [v3 vibrate];
  [v7 setVibrate:v5];
  v6 = +[FMDFMIPManager sharedInstance];
  [v6 playSoundWithMessage:v7 completion:&stru_1002D92B8];
}

- (void)stopSound
{
  id v2 = +[FMDFMIPManager sharedInstance];
  [v2 stopSoundMessageWithCompletion:&stru_1002D92D8];
}

- (id)_xpcTransactionNameFor:(id)a3
{
  return +[NSString stringWithFormat:@"Message-%lX", a3];
}

- (id)_fillVibrationPattern:(id)a3 toDuration:(double)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  if ((uint64_t)a4 >= 1)
  {
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      v9 = [v5 objectAtIndexedSubscript:v7];
      [v6 addObject:v9];

      v10 = [v5 objectAtIndexedSubscript:v7 + 1];
      [v6 addObject:v10];
      v8 += (uint64_t)[v10 integerValue];
      v7 += 2;
      if (v7 >= (unint64_t)[v5 count]) {
        unint64_t v7 = 0;
      }
    }
    while (v8 < 1000 * (uint64_t)a4);
  }
  id v11 = [v6 copy];

  return v11;
}

- (id)_vibrationPattern
{
  return &off_1002F2D38;
}

- (FMDMessage)activeMessage
{
  return self->_activeMessage;
}

- (void)setActiveMessage:(id)a3
{
}

- (__CFUserNotification)cfNotification
{
  return self->_cfNotification;
}

- (void)setCfNotification:(__CFUserNotification *)a3
{
}

- (void).cxx_destruct
{
}

@end