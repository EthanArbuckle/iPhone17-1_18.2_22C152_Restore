@interface VSAudioSession
+ (id)sharedInstance;
+ (int64_t)_VSAudioCategoryForActivity:(int64_t)a3;
- (VSAudioSession)init;
- (int64_t)_nextActivityForActive:(BOOL)a3 activity:(int64_t)a4 serverActivity:(int64_t)a5;
- (int64_t)_safeServerGeneration;
- (void)_audioSessionInterrupted:(id)a3;
- (void)_mediaServicesWereReset:(id)a3;
- (void)_safeSetActive:(BOOL)a3 withActivity:(int64_t)a4;
- (void)_safeSetBluetoothInputAllowed:(BOOL)a3;
- (void)_safeSetCategoryForActivity:(int64_t)a3;
- (void)_safeSetupAudioSession;
- (void)_setCategoryForActivity:(int64_t)a3;
- (void)_setupAudioSession;
- (void)dealloc;
@end

@implementation VSAudioSession

- (void).cxx_destruct
{
}

- (void)_safeSetBluetoothInputAllowed:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EE1A8;
  v4[3] = &unk_1000FEA40;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync((dispatch_queue_t)queue, v4);
}

- (void)_safeSetActive:(BOOL)a3 withActivity:(int64_t)a4
{
  if (a4)
  {
    BOOL v5 = a3;
    v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = "INACTIVE";
      if (v5) {
        v9 = "ACTIVE";
      }
      *(_DWORD *)buf = 67109378;
      int v13 = a4;
      __int16 v14 = 2080;
      v15 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#AudioSession : activity %d --> %s\n", buf, 0x12u);
    }

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EE4A4;
    block[3] = &unk_1000FEA18;
    BOOL v11 = v5;
    block[4] = self;
    block[5] = a4;
    dispatch_sync((dispatch_queue_t)queue, block);
  }
}

- (void)_safeSetCategoryForActivity:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EE84C;
  v4[3] = &unk_1000FE9F0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync((dispatch_queue_t)queue, v4);
}

- (int64_t)_safeServerGeneration
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EE904;
  v5[3] = &unk_1000FEAB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_safeSetupAudioSession
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE98C;
  block[3] = &unk_1000FEA88;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (int64_t)_nextActivityForActive:(BOOL)a3 activity:(int64_t)a4 serverActivity:(int64_t)a5
{
  activityBag = self->_activityBag;
  if (a3)
  {
    if (activityBag)
    {
      if ((a4 & 1) == 0) {
        goto LABEL_4;
      }
    }
    else
    {
      activityBag = CFBagCreateMutable(kCFAllocatorDefault, 0, 0);
      self->_activityBag = activityBag;
      if ((a4 & 1) == 0)
      {
LABEL_4:
        if ((a4 & 2) == 0) {
          return a5 | a4;
        }
LABEL_5:
        CFBagAddValue(self->_activityBag, (const void *)2);
        return a5 | a4;
      }
    }
    CFBagAddValue(activityBag, (const void *)1);
    if ((a4 & 2) == 0) {
      return a5 | a4;
    }
    goto LABEL_5;
  }
  if (!activityBag)
  {
    int v13 = VSGetLogDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = 0;
      __int16 v14 = "#AudioSession active count went negative!\n";
      v15 = (uint8_t *)&v18;
LABEL_28:
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, v15, 2u);
    }
LABEL_29:

    return a5;
  }
  if ((a4 & 1) == 0) {
    goto LABEL_12;
  }
  CFIndex CountOfValue = CFBagGetCountOfValue(activityBag, (const void *)1);
  if (CountOfValue)
  {
    CFIndex v10 = CountOfValue;
    CFBagRemoveValue(self->_activityBag, (const void *)1);
    if (v10 == 1) {
      a5 &= ~1uLL;
    }
LABEL_12:
    if ((a4 & 2) == 0) {
      return a5;
    }
LABEL_13:
    CFIndex v11 = CFBagGetCountOfValue(self->_activityBag, (const void *)2);
    if (v11)
    {
      CFIndex v12 = v11;
      CFBagRemoveValue(self->_activityBag, (const void *)2);
      if (v12 == 1) {
        return a5 & 0xFFFFFFFFFFFFFFFDLL;
      }
      return a5;
    }
    int v13 = VSGetLogDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v14 = "#AudioSession active count went negative for output!\n";
      v15 = buf;
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  v16 = VSGetLogDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v20 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#AudioSession active count went negative for input!\n", v20, 2u);
  }

  if ((a4 & 2) != 0) {
    goto LABEL_13;
  }
  return a5;
}

- (void)_setCategoryForActivity:(int64_t)a3
{
  int64_t v4 = +[VSAudioSession _VSAudioCategoryForActivity:a3];
  if (v4)
  {
    int64_t v5 = v4;
    if (self->_cachedState.category != v4)
    {
      uint64_t v6 = VSGetLogDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#AudioSession : category = %d\n", buf, 8u);
      }

      if (self->_cachedState.category == 2) {
        sub_1000EE6AC();
      }
      v7 = +[AVAudioSession sharedInstance];
      uint64_t v8 = AVAudioSessionCategoryVoiceCommand;
      uint64_t v9 = (void *)AVAudioSessionCategoryVoiceOver;
      if (v5 == 2) {
        uint64_t v9 = (void *)AVAudioSessionCategoryVoiceCommand;
      }
      id v10 = v9;
      id v21 = 0;
      [v7 setCategory:v10 error:&v21];
      id v11 = v21;
      if (v11)
      {
        id v12 = v11;
        int v13 = VSGetLogDefault();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          __int16 v18 = (const char *)[v12 code];
          *(_DWORD *)buf = 134217984;
          v23 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#AudioSession error %ld setting audio category\n", buf, 0xCu);
        }
      }
      else
      {
        if (v5 == 2
          && (unint64_t v14 = (unint64_t)[v7 categoryOptions], self->_bluetoothAllowed == ((v14 & 4) == 0)))
        {
          id v20 = 0;
          [v7 setCategory:v8 withOptions:v14 ^ 4 error:&v20];
          id v12 = v20;
          v15 = VSGetLogDefault();
          v16 = v15;
          if (v12)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v17 = (const char *)[v12 code];
              *(_DWORD *)buf = 134217984;
              v23 = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#AudioSession error %ld setting bluetooth allowability\n", buf, 0xCu);
            }
          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              if (self->_bluetoothAllowed) {
                v19 = "en";
              }
              else {
                v19 = "dis";
              }
              *(_DWORD *)buf = 136315138;
              v23 = v19;
              _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "#AudioSession : Bluetooth %sabled\n", buf, 0xCu);
            }
            id v12 = 0;
          }
        }
        else
        {
          id v12 = 0;
        }
        self->_cachedState.category = v5;
      }
      self->_desiredState.category = v5;
    }
  }
}

- (void)_setupAudioSession
{
  if (!self->_audioSessionIsSetUp)
  {
    int64_t v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#AudioSession : Setting up audio session", buf, 2u);
    }

    int64_t v4 = +[AVAudioSession sharedInstance];
    id v8 = 0;
    [v4 setPreferredSampleRate:&v8 error:48000.0];
    id v5 = v8;

    if (v5)
    {
      uint64_t v6 = VSGetLogDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = [v5 code];
        *(_DWORD *)buf = 134217984;
        id v10 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#AudioSession error setting HW sample rate: %ld\n", buf, 0xCu);
      }
    }
    self->_audioSessionIsSetUp = 1;
  }
}

- (void)_mediaServicesWereReset:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EEFF0;
  block[3] = &unk_1000FEA88;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_audioSessionInterrupted:(id)a3
{
  int64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:AVAudioSessionInterruptionTypeKey];
  id v6 = [v5 integerValue];

  if (v6 == (id)1)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EF14C;
    block[3] = &unk_1000FEA88;
    block[4] = self;
    dispatch_async((dispatch_queue_t)queue, block);
  }
}

- (void)dealloc
{
  int64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  activityBag = self->_activityBag;
  if (activityBag) {
    CFRelease(activityBag);
  }
  v5.receiver = self;
  v5.super_class = (Class)VSAudioSession;
  [(VSAudioSession *)&v5 dealloc];
}

- (VSAudioSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)VSAudioSession;
  v2 = [(VSAudioSession *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("VSAudioSessionQueue", 0);
    int64_t v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    objc_super v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_audioSessionInterrupted:" name:AVAudioSessionInterruptionNotification object:0];
    [v5 addObserver:v2 selector:"_mediaServicesWereReset:" name:AVAudioSessionMediaServicesWereResetNotification object:0];
  }
  return (VSAudioSession *)v2;
}

+ (int64_t)_VSAudioCategoryForActivity:(int64_t)a3
{
  if (a3) {
    return 2;
  }
  else {
    return ((unint64_t)a3 >> 1) & 1;
  }
}

+ (id)sharedInstance
{
  if (qword_100106B48 != -1) {
    dispatch_once(&qword_100106B48, &stru_1000FE9C8);
  }
  v2 = (void *)qword_100106B40;
  return v2;
}

@end