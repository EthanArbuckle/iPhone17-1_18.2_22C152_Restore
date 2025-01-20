@interface PedestrianARMuteSpeechOverrideTask
+ (int64_t)creationPreference;
- (BOOL)previousMuteSpeechOverride;
- (MNNavigationService)navigationService;
- (NavigationSession)navigationSession;
- (PedestrianARMuteSpeechOverrideTask)initWithNavigationService:(id)a3;
- (unint64_t)previousVoiceGuidanceLevel;
- (void)dealloc;
- (void)pedestrianARViewControllerDidAppearNotification:(id)a3;
- (void)pedestrianARViewControllerDidDisappearNotification:(id)a3;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)setNavigationService:(id)a3;
- (void)setNavigationSession:(id)a3;
- (void)setPreviousMuteSpeechOverride:(BOOL)a3;
- (void)setPreviousVoiceGuidanceLevel:(unint64_t)a3;
@end

@implementation PedestrianARMuteSpeechOverrideTask

- (PedestrianARMuteSpeechOverrideTask)initWithNavigationService:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "-[PedestrianARMuteSpeechOverrideTask initWithNavigationService:]";
      __int16 v17 = 2080;
      v18 = "PedestrianARMuteSpeechOverrideTask.m";
      __int16 v19 = 1024;
      int v20 = 38;
      __int16 v21 = 2080;
      v22 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)PedestrianARMuteSpeechOverrideTask;
  v6 = [(PedestrianARMuteSpeechOverrideTask *)&v14 init];
  if (v6)
  {
    v7 = sub_100109FF4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v16 = (const char *)v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_navigationService, a3);
    v6->_previousVoiceGuidanceLevel = -1;
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v6 selector:"pedestrianARViewControllerDidAppearNotification:" name:@"PedestrianARViewControllerDidAppearNotification" object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v6 selector:"pedestrianARViewControllerDidDisappearNotification:" name:@"PedestrianARViewControllerDidDisappearNotification" object:0];
  }
  return v6;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)dealloc
{
  v3 = sub_100109FF4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARMuteSpeechOverrideTask;
  [(PedestrianARMuteSpeechOverrideTask *)&v4 dealloc];
}

- (void)pedestrianARViewControllerDidAppearNotification:(id)a3
{
  objc_super v4 = [(PedestrianARMuteSpeechOverrideTask *)self navigationSession];
  id v5 = [v4 guidanceType];

  v6 = sub_100109FF4();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5 == (id)2)
  {
    if (v7)
    {
      int v9 = 134349056;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Ignoring AR did appear notification during route preview", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      int v9 = 134349056;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Setting voice guidance level override to \"None\".", (uint8_t *)&v9, 0xCu);
    }

    v8 = [(PedestrianARMuteSpeechOverrideTask *)self navigationService];
    self->_previousVoiceGuidanceLevel = (unint64_t)[v8 voiceGuidanceLevel];

    v6 = [(PedestrianARMuteSpeechOverrideTask *)self navigationService];
    [v6 setVoiceGuidanceLevelOverride:0];
  }
}

- (void)pedestrianARViewControllerDidDisappearNotification:(id)a3
{
  objc_super v4 = [(PedestrianARMuteSpeechOverrideTask *)self navigationSession];
  id v5 = [v4 guidanceType];

  v6 = sub_100109FF4();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5 == (id)2)
  {
    if (v7)
    {
      int v9 = 134349056;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Ignoring AR did disappear notification during route preview", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      int v9 = 134349056;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Restoring previous voice guidance level.", (uint8_t *)&v9, 0xCu);
    }

    v8 = [(PedestrianARMuteSpeechOverrideTask *)self navigationService];
    [v8 setVoiceGuidanceLevelOverride:self->_previousVoiceGuidanceLevel];

    self->_previousVoiceGuidanceLevel = -1;
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v8;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  [(PedestrianARMuteSpeechOverrideTask *)self setNavigationSession:v7];
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (void)setNavigationSession:(id)a3
{
}

- (BOOL)previousMuteSpeechOverride
{
  return self->_previousMuteSpeechOverride;
}

- (void)setPreviousMuteSpeechOverride:(BOOL)a3
{
  self->_previousMuteSpeechOverride = a3;
}

- (unint64_t)previousVoiceGuidanceLevel
{
  return self->_previousVoiceGuidanceLevel;
}

- (void)setPreviousVoiceGuidanceLevel:(unint64_t)a3
{
  self->_previousVoiceGuidanceLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSession, 0);

  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end