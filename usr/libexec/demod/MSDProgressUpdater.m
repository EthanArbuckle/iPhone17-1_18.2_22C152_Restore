@interface MSDProgressUpdater
+ (id)sharedInstance;
- (MSDBundleProgressTracker)backgroundBundle;
- (MSDBundleProgressTracker)bundleInProgress;
- (MSDBundleProgressTracker)installedBundle;
- (MSDBundleProgressTracker)installingBundle;
- (MSDProgressUpdater)init;
- (id)getContentStatus;
- (id)getContentUpdateType;
- (int)currentStage;
- (int64_t)getInternalStatus;
- (void)demoUpdateCompleted:(id)a3;
- (void)demoUpdateFailed:(id)a3;
- (void)loadBundles;
- (void)markBundleInProgressAsBundleCompleted;
- (void)resetTrackerForBundleType:(int)a3;
- (void)setBackgroundBundle:(id)a3;
- (void)setBundleInProgress:(id)a3;
- (void)setCurrentStage:(int)a3;
- (void)setInstalledBundle:(id)a3;
- (void)setInstallingBundle:(id)a3;
- (void)startBundleUpdateMonitor:(id)a3 inMode:(int)a4;
- (void)updateStage:(int)a3;
@end

@implementation MSDProgressUpdater

+ (id)sharedInstance
{
  if (qword_100189BC8 != -1) {
    dispatch_once(&qword_100189BC8, &stru_1001535A8);
  }
  v2 = (void *)qword_100189BC0;

  return v2;
}

- (MSDProgressUpdater)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDProgressUpdater;
  v2 = [(MSDProgressUpdater *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MSDProgressUpdater *)v2 updateStage:199];
  }
  return v3;
}

- (void)updateStage:(int)a3
{
}

- (void)resetTrackerForBundleType:(int)a3
{
  if (a3 == 1) {
    [(MSDProgressUpdater *)self setBackgroundBundle:0];
  }
}

- (void)markBundleInProgressAsBundleCompleted
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[MSDProgressUpdater markBundleInProgressAsBundleCompleted]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s entered.", (uint8_t *)&v8, 0xCu);
  }

  v4 = [(MSDProgressUpdater *)self bundleInProgress];
  [v4 markBundleInProgressAsCompleted];

  objc_super v5 = +[MSDMailProcessor sharedInstance];
  [v5 reportBundleInstallCompleted];

  v6 = [(MSDProgressUpdater *)self bundleInProgress];
  [v6 renameBundleInPrgressToBundleInstalled];

  v7 = [(MSDProgressUpdater *)self installingBundle];
  [(MSDProgressUpdater *)self setInstalledBundle:v7];

  [(MSDProgressUpdater *)self setInstallingBundle:0];
  [(MSDProgressUpdater *)self setBundleInProgress:0];
}

- (void)startBundleUpdateMonitor:(id)a3 inMode:(int)a4
{
  id v6 = a3;
  v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138543362;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "start content update monitor:%{public}@", (uint8_t *)&v28, 0xCu);
  }

  int v8 = sub_100068600();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v9)
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Inside start content background", (uint8_t *)&v28, 2u);
    }

    v10 = [(MSDProgressUpdater *)self backgroundBundle];
    unsigned __int8 v11 = +[MSDBundleProgressTracker isBundleInstance:v10 identicalWithNewBundle:v6];

    if ((v11 & 1) == 0)
    {
      v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "not the same background bundle...", (uint8_t *)&v28, 2u);
      }

      v13 = +[MSDTargetDevice sharedInstance];
      [v13 cleanUpBackgroundState:1];

      v14 = [MSDBundleProgressTracker alloc];
      v15 = [(MSDBundleProgressTracker *)v14 initializeTrackerForBundle:v6 withContentType:1];
      [(MSDProgressUpdater *)self setBackgroundBundle:v15];
    }
    uint64_t v16 = [(MSDProgressUpdater *)self backgroundBundle];
  }
  else
  {
    if (v9)
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Inside start content foreground", (uint8_t *)&v28, 2u);
    }

    v17 = [(MSDProgressUpdater *)self installingBundle];
    unsigned __int8 v18 = +[MSDBundleProgressTracker isBundleInstance:v17 identicalWithNewBundle:v6];

    if ((v18 & 1) == 0)
    {
      v19 = sub_100068600();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "not the same foreground bundle...", (uint8_t *)&v28, 2u);
      }

      v20 = [MSDBundleProgressTracker alloc];
      v21 = [(MSDBundleProgressTracker *)v20 initializeTrackerForBundle:v6 withContentType:2];
      [(MSDProgressUpdater *)self setInstallingBundle:v21];

      v22 = [(MSDProgressUpdater *)self backgroundBundle];
      LODWORD(v20) = +[MSDBundleProgressTracker isBundleInstance:v22 identicalWithNewBundle:v6];

      if (v20)
      {
        v23 = [(MSDProgressUpdater *)self installingBundle];
        v24 = [(MSDProgressUpdater *)self backgroundBundle];
        [v24 getBundleUpdateTime];
        [v23 addToBundleUpdateTime:];
      }
    }
    uint64_t v16 = [(MSDProgressUpdater *)self installingBundle];
  }
  v25 = (void *)v16;
  [(MSDProgressUpdater *)self setBundleInProgress:v16];

  v26 = sub_100068600();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [(MSDProgressUpdater *)self bundleInProgress];
    int v28 = 138543362;
    id v29 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "bundleInProgress:%{public}@", (uint8_t *)&v28, 0xCu);
  }
}

- (void)loadBundles
{
  v3 = +[MSDTargetDevice sharedInstance];
  v4 = [MSDBundleProgressTracker alloc];
  objc_super v5 = [(MSDBundleProgressTracker *)v4 retrieveObjectFromPreferences:0];
  [(MSDProgressUpdater *)self setInstalledBundle:v5];

  id v6 = [MSDBundleProgressTracker alloc];
  v7 = [(MSDBundleProgressTracker *)v6 retrieveObjectFromPreferences:1];
  [(MSDProgressUpdater *)self setBackgroundBundle:v7];

  int v8 = [MSDBundleProgressTracker alloc];
  BOOL v9 = [(MSDBundleProgressTracker *)v8 retrieveObjectFromPreferences:2];
  [(MSDProgressUpdater *)self setInstallingBundle:v9];

  if ([v3 mode] < 2 || objc_msgSend(v3, "mode") > 4)
  {
    unsigned __int8 v11 = [(MSDProgressUpdater *)self backgroundBundle];
    unsigned int v12 = [v11 bundleState];

    if (v12) {
      [(MSDProgressUpdater *)self backgroundBundle];
    }
    else {
    uint64_t v10 = [(MSDProgressUpdater *)self installedBundle];
    }
  }
  else
  {
    uint64_t v10 = [(MSDProgressUpdater *)self installingBundle];
  }
  v13 = (void *)v10;
  [(MSDProgressUpdater *)self setBundleInProgress:v10];

  v14 = sub_100068600();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(MSDProgressUpdater *)self installedBundle];
    uint64_t v16 = [(MSDProgressUpdater *)self backgroundBundle];
    v17 = [(MSDProgressUpdater *)self installingBundle];
    int v18 = 138543874;
    v19 = v15;
    __int16 v20 = 2114;
    v21 = v16;
    __int16 v22 = 2114;
    v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Bundles are: installedBundle:%{public}@ backgroundBundle:%{public}@ installingBundle:%{public}@", (uint8_t *)&v18, 0x20u);
  }
}

- (id)getContentStatus
{
  v3 = +[MSDTargetDevice sharedInstance];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  int v8 = [(MSDProgressUpdater *)self installedBundle];

  v74 = v5;
  if (v8)
  {
    BOOL v9 = [v3 hubSuppliedSettings];
    v66 = [v9 objectForKey:@"Components"];

    uint64_t v10 = [(MSDProgressUpdater *)self installedBundle];
    unsigned __int8 v11 = [v10 bundleInfo];
    unsigned int v12 = +[NSMutableDictionary dictionaryWithDictionary:v11];

    v13 = [(MSDProgressUpdater *)self installedBundle];
    v14 = [v13 installedComponentList];
    id v15 = [v14 copy];

    uint64_t v16 = [(MSDProgressUpdater *)self installedBundle];
    unsigned __int8 v17 = [v16 bundleState];

    [v12 removeObjectForKey:@"ManifestVersion"];
    [v6 setObject:v12 forKey:@"ContentDetails"];
    int v18 = [(MSDProgressUpdater *)self installedBundle];
    v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 preInstalledContent]);
    [v6 setObject:v19 forKey:@"PreInstalledContent"];

    if ((v17 - 3) > 3u) {
      __int16 v20 = &off_100162258;
    }
    else {
      __int16 v20 = off_100153608[(char)(v17 - 3)];
    }
    id v75 = v6;
    [v6 setObject:v20 forKey:@"Status"];
    id v5 = v74;
    if (v66 && [v66 count])
    {
      id v68 = v7;
      id v70 = v4;
      v72 = v3;
      __int16 v22 = +[NSMutableDictionary dictionary];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v24 = v66;
      id v25 = [v24 countByEnumeratingWithState:&v77 objects:v81 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v78;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v78 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v77 + 1) + 8 * i);
            v30 = [v15 objectForKey:v29];
            if (v30) {
              [v22 setObject:v30 forKey:v29];
            }
          }
          id v26 = [v24 countByEnumeratingWithState:&v77 objects:v81 count:16];
        }
        while (v26);
      }

      id v4 = v70;
      v3 = v72;
      id v7 = v68;
      id v5 = v74;
    }
    else
    {
      __int16 v22 = +[NSDictionary dictionaryWithDictionary:v15];
    }

    v23 = v75;
  }
  else
  {
    uint64_t v21 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:&__NSDictionary0__struct, @"ContentDetails", 0, @"Status", &__kCFBooleanFalse, @"PreInstalledContent", 0];

    __int16 v22 = +[NSDictionary dictionary];
    v23 = (void *)v21;
  }
  v76 = v23;
  [v7 setObject:forKey:];
  [v7 setObject:v22 forKey:@"MSDDemoComponentsInstalled"];
  v31 = [(MSDProgressUpdater *)self bundleInProgress];
  unsigned int v32 = [v31 bundleType];

  if (v32)
  {
    v33 = [(MSDProgressUpdater *)self bundleInProgress];
    unsigned int v34 = [v33 bundleType];

    v71 = v4;
    v73 = v3;
    v69 = v7;
    if (v34 == 1)
    {
      v35 = [(MSDProgressUpdater *)self backgroundBundle];
      v36 = [v35 contentProgress];
      [v5 setObject:v36 forKey:@"DownloadingProgress"];

      v37 = [(MSDProgressUpdater *)self backgroundBundle];
      v38 = [v37 downloadedContentSource];
      v39 = +[NSDictionary dictionaryWithDictionary:v38];

      v40 = [(MSDProgressUpdater *)self backgroundBundle];
      v41 = [v40 bundleInfo];
      v42 = +[NSMutableDictionary dictionaryWithDictionary:v41];
      v43 = 0;
      v67 = &off_100162240;
    }
    else
    {
      v44 = [(MSDProgressUpdater *)self bundleInProgress];
      unsigned int v45 = [v44 bundleType];

      if (v45 != 2)
      {
        v39 = 0;
        v43 = 0;
        v42 = 0;
        v67 = 0;
LABEL_30:
        v54 = [v43 objectForKey:@"remote"];
        v55 = (char *)[v54 integerValue];
        v56 = [v39 objectForKey:@"remote"];
        v57 = &v55[(void)[v56 integerValue]];

        v58 = [v43 objectForKey:@"local"];
        v59 = (char *)[v58 integerValue];
        v60 = [v39 objectForKey:@"local"];
        v61 = &v59[(void)[v60 integerValue]];

        v62 = +[NSNumber numberWithInteger:v57];
        id v4 = v71;
        [v71 setObject:v62 forKey:@"remote"];

        v63 = +[NSNumber numberWithInteger:v61];
        [v71 setObject:v63 forKey:@"local"];

        id v5 = v74;
        if (v42)
        {
          [v42 removeObjectForKey:@"ManifestVersion"];
          [v74 setObject:v42 forKey:@"ContentDetails"];
        }
        v3 = v73;
        if ([v73 criticalUpdatePrioritized]) {
          v64 = &off_100162240;
        }
        else {
          v64 = &off_1001622A0;
        }
        [v74 setObject:v64 forKey:@"ComponentsType"];
        [v74 setObject:v67 forKey:@"Status"];
        [v74 setObject:v71 forKey:@"TotalBytesDownloaded"];
        id v7 = v69;
        [v69 setObject:v74 forKey:@"MSDDemoContentInProgress"];

        goto LABEL_36;
      }
      v46 = [(MSDProgressUpdater *)self installingBundle];
      v47 = [v46 contentProgress];
      [v5 setObject:v47 forKey:@"InstallingProgress"];

      v48 = [(MSDProgressUpdater *)self installingBundle];
      v49 = [v48 downloadedContentSource];
      v43 = +[NSDictionary dictionaryWithDictionary:v49];

      v50 = [(MSDProgressUpdater *)self backgroundBundle];

      if (v50)
      {
        v51 = [(MSDProgressUpdater *)self backgroundBundle];
        v52 = [v51 downloadedContentSource];
        v39 = +[NSDictionary dictionaryWithDictionary:v52];

        v53 = &off_100162258;
      }
      else
      {
        v39 = +[NSDictionary dictionaryWithObjectsAndKeys:@"local", &off_1001622A0, @"remote", 0];
        v53 = &off_100162270;
      }
      v67 = v53;
      v40 = [(MSDProgressUpdater *)self installingBundle];
      v41 = [v40 bundleInfo];
      v42 = +[NSMutableDictionary dictionaryWithDictionary:v41];
    }

    goto LABEL_30;
  }
LABEL_36:

  return v7;
}

- (int64_t)getInternalStatus
{
  return [(MSDProgressUpdater *)self currentStage];
}

- (id)getContentUpdateType
{
  v3 = [(MSDProgressUpdater *)self installedBundle];

  if (!v3) {
    return @"ContentUpdateTypeFreshInstall";
  }
  id v4 = [(MSDProgressUpdater *)self installedBundle];
  unsigned int v5 = [v4 preInstalledContent];

  if (v5) {
    return @"ContentUpdateTypeFreshInstallFactory";
  }
  else {
    return @"ContentUpdateTypeIncrementalUpdate";
  }
}

- (void)demoUpdateFailed:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDTargetDevice sharedInstance];
  unsigned __int8 v5 = [v4 isOfflineMode];

  if ((v5 & 1) == 0)
  {
    id v6 = objc_alloc_init(MSDReportErrorRequest);
    [(MSDReportErrorRequest *)v6 setError:v3];
    id v7 = +[MSDServerRequestHandler sharedInstance];
    int v8 = [v7 handleRequestSync:v6];

    BOOL v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v8 error];
      int v11 = 136315394;
      unsigned int v12 = "-[MSDProgressUpdater demoUpdateFailed:]";
      __int16 v13 = 2114;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: sent error status to hub; error=%{public}@",
        (uint8_t *)&v11,
        0x16u);
    }
  }
}

- (void)demoUpdateCompleted:(id)a3
{
  id v7 = a3;
  id v3 = +[MSDTargetDevice sharedInstance];
  if (([v3 isOfflineMode] & 1) == 0)
  {
    id v4 = objc_alloc_init(MSDReportDoneRequest);
    [(MSDReportDoneRequest *)v4 setRequestStr:v7];
    unsigned __int8 v5 = [v3 getSavedError];
    [(MSDReportDoneRequest *)v4 setError:v5];

    [(MSDServerRequest *)v4 setCompletion:&stru_1001535E8];
    id v6 = +[MSDServerRequestHandler sharedInstance];
    [v6 handleRequestAsync:v4];
  }
}

- (MSDBundleProgressTracker)backgroundBundle
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBackgroundBundle:(id)a3
{
}

- (MSDBundleProgressTracker)installedBundle
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInstalledBundle:(id)a3
{
}

- (MSDBundleProgressTracker)installingBundle
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInstallingBundle:(id)a3
{
}

- (MSDBundleProgressTracker)bundleInProgress
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBundleInProgress:(id)a3
{
}

- (int)currentStage
{
  return self->_currentStage;
}

- (void)setCurrentStage:(int)a3
{
  self->_currentStage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleInProgress, 0);
  objc_storeStrong((id *)&self->_installingBundle, 0);
  objc_storeStrong((id *)&self->_installedBundle, 0);

  objc_storeStrong((id *)&self->_backgroundBundle, 0);
}

@end