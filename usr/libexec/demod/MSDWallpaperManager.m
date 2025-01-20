@interface MSDWallpaperManager
+ (id)sharedInstance;
- (BOOL)justBootUp;
- (BOOL)useFactoryDefault;
- (MSDWallpaperManager)init;
- (NSString)wallpaperSettingsFilePath;
- (PRSWallpaperObserver)posterObserver;
- (void)_handleWallpaperConfigChange;
- (void)_resetWallpaperSettingsToFactoryDefault;
- (void)_startPosterConfigChangeMonitor;
- (void)restoreWallpaperSettingsIfNeeded;
- (void)setJustBootUp:(BOOL)a3;
- (void)setPosterObserver:(id)a3;
- (void)setUseFactoryDefault:(BOOL)a3;
- (void)setWallpaperSettingsFilePath:(id)a3;
- (void)stashWallpaperSettingsIfNeeded;
@end

@implementation MSDWallpaperManager

+ (id)sharedInstance
{
  if (qword_100189A00 != -1) {
    dispatch_once(&qword_100189A00, &stru_100152AA0);
  }
  v2 = (void *)qword_100189A08;

  return v2;
}

- (MSDWallpaperManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDWallpaperManager;
  v2 = [(MSDWallpaperManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MSDWallpaperManager *)v2 setWallpaperSettingsFilePath:@"/var/mobile/Library/Application Support/ScreenSaverManager/.savedWallpaperSettings.plist"];
    [(MSDWallpaperManager *)v3 setJustBootUp:1];
    [(MSDWallpaperManager *)v3 setUseFactoryDefault:0];
  }
  return v3;
}

- (void)stashWallpaperSettingsIfNeeded
{
  v3 = +[NSFileManager defaultManager];
  v4 = [(MSDWallpaperManager *)self wallpaperSettingsFilePath];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = objc_alloc((Class)NSDictionary);
    v7 = [(MSDWallpaperManager *)self wallpaperSettingsFilePath];
    v8 = +[NSURL fileURLWithPath:v7];
    id v25 = 0;
    v9 = (_UNKNOWN **)[v6 initWithContentsOfURL:v8 error:&v25];
    id v10 = v25;

    v11 = sub_100068600();
    v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Persistent wallpaper settings loaded: %{public}@", buf, 0xCu);
      }

      v13 = [v9 objectForKey:@"UseFactoryDefault"];
      [(MSDWallpaperManager *)self setUseFactoryDefault:[v13 BOOLValue]];
LABEL_11:

      if (![(MSDWallpaperManager *)self useFactoryDefault]) {
        [(MSDWallpaperManager *)self _startPosterConfigChangeMonitor];
      }
      goto LABEL_13;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000CE250(v10);
    }

    v9 = 0;
  }
  else
  {
    v14 = [(MSDWallpaperManager *)self wallpaperSettingsFilePath];
    v15 = [v14 stringByDeletingLastPathComponent];
    id v24 = 0;
    unsigned __int8 v16 = [v3 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v10 = v24;

    if (v16)
    {
      v17 = [(MSDWallpaperManager *)self wallpaperSettingsFilePath];
      v18 = +[NSURL fileURLWithPath:v17];
      id v23 = v10;
      unsigned __int8 v19 = [&off_100162FA8 writeToURL:v18 error:&v23];
      id v20 = v23;

      v21 = sub_100068600();
      v13 = v21;
      if (v19)
      {
        v9 = &off_100162FA8;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v27 = &off_100162FA8;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Persistent wallpaper settings saved: %{public}@", buf, 0xCu);
        }
        id v10 = v20;
        goto LABEL_11;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000CE2D4(v20);
      }

      v9 = &off_100162FA8;
      id v10 = v20;
    }
    else
    {
      v22 = sub_100068600();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000CE358(v10);
      }

      v9 = &off_100162FA8;
    }
  }
LABEL_13:
}

- (void)restoreWallpaperSettingsIfNeeded
{
  if ([(MSDWallpaperManager *)self useFactoryDefault])
  {
    v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Wallpaper settings have changed. Resetting wallpaper settings to factory default!", v4, 2u);
    }

    [(MSDWallpaperManager *)self _resetWallpaperSettingsToFactoryDefault];
  }
}

- (void)_startPosterConfigChangeMonitor
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up poster config change observer...", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)PRSWallpaperLocationStateObserver);
  [v4 setLocations:12];
  [v4 setNeedsSandboxExtensions:0];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000475CC;
  v9[3] = &unk_100152AC8;
  v9[4] = self;
  [v4 setHandler:v9];
  id v5 = objc_alloc_init((Class)PRSWallpaperObserverConfiguration);
  id v6 = dispatch_get_global_queue(21, 0);
  [v5 setQueue:v6];

  [v5 setLocationStateObserver:v4];
  id v7 = [objc_alloc((Class)PRSWallpaperObserver) initWithExplanation:@"Store Demo Mode"];
  [(MSDWallpaperManager *)self setPosterObserver:v7];

  v8 = [(MSDWallpaperManager *)self posterObserver];
  [v8 activateWithConfiguration:v5];
}

- (void)_handleWallpaperConfigChange
{
  if ([(MSDWallpaperManager *)self justBootUp])
  {
    v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ignore first poster config change call after observer is first registered.", buf, 2u);
    }

    [(MSDWallpaperManager *)self setJustBootUp:0];
  }
  else if (![(MSDWallpaperManager *)self useFactoryDefault])
  {
    id v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will reset wallpaper settings to factory default next time.", v12, 2u);
    }

    id v5 = [(MSDWallpaperManager *)self wallpaperSettingsFilePath];
    id v6 = +[NSURL fileURLWithPath:v5];
    id v11 = 0;
    unsigned __int8 v7 = [&off_100162FD0 writeToURL:v6 error:&v11];
    id v8 = v11;

    if (v7)
    {
      [(MSDWallpaperManager *)self setUseFactoryDefault:1];
      v9 = [(MSDWallpaperManager *)self posterObserver];
      [v9 invalidate];

      [(MSDWallpaperManager *)self setPosterObserver:0];
    }
    else
    {
      id v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000CE2D4(v8);
      }
    }
  }
}

- (void)_resetWallpaperSettingsToFactoryDefault
{
  id v2 = objc_alloc_init((Class)PRSService);
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  dispatch_time_t v4 = dispatch_time(0, 3000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004794C;
  v7[3] = &unk_100152AF0;
  id v5 = v3;
  id v8 = v5;
  [v2 deleteDataStoreWithCompletion:v7];
  if (dispatch_semaphore_wait(v5, v4))
  {
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CE3DC(v6);
    }
  }
}

- (NSString)wallpaperSettingsFilePath
{
  return self->_wallpaperSettingsFilePath;
}

- (void)setWallpaperSettingsFilePath:(id)a3
{
}

- (PRSWallpaperObserver)posterObserver
{
  return self->_posterObserver;
}

- (void)setPosterObserver:(id)a3
{
}

- (BOOL)justBootUp
{
  return self->_justBootUp;
}

- (void)setJustBootUp:(BOOL)a3
{
  self->_justBootUp = a3;
}

- (BOOL)useFactoryDefault
{
  return self->_useFactoryDefault;
}

- (void)setUseFactoryDefault:(BOOL)a3
{
  self->_useFactoryDefault = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterObserver, 0);

  objc_storeStrong((id *)&self->_wallpaperSettingsFilePath, 0);
}

@end