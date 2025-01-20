@interface MSDAppSwitcherManager
+ (id)sharedInstance;
- (BOOL)clearAppSwitcherForDemoMode;
- (BOOL)createSwitcherModelAtPath:(id)a3;
- (BOOL)loadStashedSwitcherModelFromPath:(id)a3;
- (BOOL)stashSwitcherModelToPath:(id)a3 overwrite:(BOOL)a4;
- (MSDAppSwitcherManager)init;
- (NSFileManager)fileManager;
- (SBSTestAutomationService)sbAppSwitcher;
- (void)dealloc;
- (void)initializeClearAppSwitcherStateForDemoMode;
- (void)setFileManager:(id)a3;
- (void)setSbAppSwitcher:(id)a3;
@end

@implementation MSDAppSwitcherManager

+ (id)sharedInstance
{
  if (qword_1001899D0 != -1) {
    dispatch_once(&qword_1001899D0, &stru_100152910);
  }
  v2 = (void *)qword_1001899D8;

  return v2;
}

- (MSDAppSwitcherManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDAppSwitcherManager;
  v2 = [(MSDAppSwitcherManager *)&v6 init];
  if (v2)
  {
    v3 = +[NSFileManager defaultManager];
    [(MSDAppSwitcherManager *)v2 setFileManager:v3];

    id v4 = objc_alloc_init((Class)SBSTestAutomationService);
    [(MSDAppSwitcherManager *)v2 setSbAppSwitcher:v4];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(MSDAppSwitcherManager *)self sbAppSwitcher];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)MSDAppSwitcherManager;
  [(MSDAppSwitcherManager *)&v4 dealloc];
}

- (void)initializeClearAppSwitcherStateForDemoMode
{
  v3 = [(MSDAppSwitcherManager *)self fileManager];
  unsigned int v4 = [v3 fileExistsAtPath:@"/var/mobile/Library/Application Support/ScreenSaverManager/demoModeAppSwitcher.plist"];

  if (v4)
  {
    v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      v7 = "-[MSDAppSwitcherManager initializeClearAppSwitcherStateForDemoMode]";
      __int16 v8 = 2114;
      CFStringRef v9 = @"/var/mobile/Library/Application Support/ScreenSaverManager/demoModeAppSwitcher.plist";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - AppSwitcher model file already exists at path %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    [(MSDAppSwitcherManager *)self createSwitcherModelAtPath:@"/var/mobile/Library/Application Support/ScreenSaverManager/demoModeAppSwitcher.plist"];
  }
}

- (BOOL)clearAppSwitcherForDemoMode
{
  return [(MSDAppSwitcherManager *)self loadStashedSwitcherModelFromPath:@"/var/mobile/Library/Application Support/ScreenSaverManager/demoModeAppSwitcher.plist"];
}

- (BOOL)loadStashedSwitcherModelFromPath:(id)a3
{
  id v4 = a3;
  v5 = [(MSDAppSwitcherManager *)self fileManager];
  unsigned int v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    v7 = [(MSDAppSwitcherManager *)self sbAppSwitcher];
    [v7 loadStashedSwitcherModelFromPath:v4];
  }
  else
  {
    v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000CCD38();
    }
  }

  return v6;
}

- (BOOL)stashSwitcherModelToPath:(id)a3 overwrite:(BOOL)a4
{
  id v6 = a3;
  unsigned __int8 v18 = 0;
  v7 = [v6 stringByDeletingLastPathComponent];
  if (!a4)
  {
    __int16 v8 = [(MSDAppSwitcherManager *)self fileManager];
    unsigned int v9 = [v8 fileExistsAtPath:v6];

    if (v9)
    {
      v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[MSDAppSwitcherManager stashSwitcherModelToPath:overwrite:]";
        __int16 v21 = 2114;
        id v22 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s - AppSwitcher model file already exists at path %{public}@", buf, 0x16u);
      }
LABEL_13:

      BOOL v16 = 0;
      goto LABEL_14;
    }
  }
  v11 = [(MSDAppSwitcherManager *)self fileManager];
  unsigned int v12 = [v11 fileExistsAtPath:v7 isDirectory:&v18];
  int v13 = v18;

  if (!v12 || !v13)
  {
    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000CCE20();
    }
    goto LABEL_13;
  }
  uint64_t v14 = [(MSDAppSwitcherManager *)self sbAppSwitcher];
  [(id)v14 stashSwitcherModelToPath:v6];

  v15 = [(MSDAppSwitcherManager *)self fileManager];
  LOBYTE(v14) = [v15 fileExistsAtPath:v6];

  if ((v14 & 1) == 0)
  {
    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000CCDAC();
    }
    goto LABEL_13;
  }
  BOOL v16 = 1;
LABEL_14:

  return v16;
}

- (BOOL)createSwitcherModelAtPath:(id)a3
{
  id v3 = a3;
  id v4 = +[NSArray array];
  v5 = +[NSURL fileURLWithPath:v3];
  id v11 = 0;
  unsigned __int8 v6 = [v4 writeToURL:v5 error:&v11];
  id v7 = v11;

  __int16 v8 = sub_100068600();
  unsigned int v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v13 = "-[MSDAppSwitcherManager createSwitcherModelAtPath:]";
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - Writing empty app switcher model to path %{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_1000CCE94((uint64_t)v3, v7, v9);
  }

  return v6;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (SBSTestAutomationService)sbAppSwitcher
{
  return self->_sbAppSwitcher;
}

- (void)setSbAppSwitcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbAppSwitcher, 0);

  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end