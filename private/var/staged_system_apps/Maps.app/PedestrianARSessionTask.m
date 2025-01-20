@interface PedestrianARSessionTask
+ (BOOL)isPedestrianARModeSupported;
+ (BOOL)isSupportedForTransportType:(int64_t)a3;
+ (int64_t)creationPreference;
- (PedestrianARSessionStateManager)stateManager;
- (PedestrianARSessionTask)initWithPlatformController:(id)a3;
- (PlatformController)platformController;
- (void)dealloc;
- (void)setPlatformController:(id)a3;
- (void)setStateManager:(id)a3;
- (void)stateManager:(id)a3 didChangeState:(BOOL)a4;
@end

@implementation PedestrianARSessionTask

- (PedestrianARSessionTask)initWithPlatformController:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "-[PedestrianARSessionTask initWithPlatformController:]";
      __int16 v18 = 2080;
      v19 = "PedestrianARSessionTask.m";
      __int16 v20 = 1024;
      int v21 = 37;
      __int16 v22 = 2080;
      v23 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PedestrianARSessionTask;
  v5 = [(PedestrianARSessionTask *)&v15 init];
  if (v5)
  {
    v6 = sub_10000D3F0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v17 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_platformController, v4);
    v7 = [PedestrianARSessionStateManager alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v5->_platformController);
    v9 = [(PedestrianARSessionStateManager *)v7 initWithPlatformController:WeakRetained];
    stateManager = v5->_stateManager;
    v5->_stateManager = v9;

    [(PedestrianARSessionStateManager *)v5->_stateManager addObserver:v5];
  }

  return v5;
}

+ (BOOL)isPedestrianARModeSupported
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CA50;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160EFA0 != -1) {
    dispatch_once(&qword_10160EFA0, block);
  }
  return byte_10160EF98;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (PedestrianARSessionStateManager)stateManager
{
  return self->_stateManager;
}

- (void)dealloc
{
  v3 = sub_10000D3F0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  [(PedestrianARSessionStateManager *)self->_stateManager removeObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)PedestrianARSessionTask;
  [(PedestrianARSessionTask *)&v4 dealloc];
}

+ (BOOL)isSupportedForTransportType:(int64_t)a3
{
  return a3 == 2;
}

- (void)stateManager:(id)a3 didChangeState:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(PedestrianARSessionTask *)self platformController];
  v7 = [v6 chromeViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    v10 = [v9 userLocationView];
    [v10 setIsPedestrianARAvailable:v4];
  }
  else
  {
    v11 = sub_10000D3F0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 134349056;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] chromeVC was not an IOSBased one; ignoring",
        (uint8_t *)&v12,
        0xCu);
    }
  }
}

- (void)setStateManager:(id)a3
{
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformController);

  objc_storeStrong((id *)&self->_stateManager, 0);
}

@end