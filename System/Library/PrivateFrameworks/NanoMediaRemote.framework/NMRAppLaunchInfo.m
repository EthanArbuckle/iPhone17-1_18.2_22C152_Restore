@interface NMRAppLaunchInfo
- (BOOL)_shouldLaunchPlaybackAppForRoute:(id)a3;
- (NMRAppLaunchInfo)initWithPlayerResponse:(id)a3;
- (NSString)bundleID;
- (NSURL)URL;
- (id)_launchURLForScheme:(id)a3 requestedPlayerPath:(id)a4;
@end

@implementation NMRAppLaunchInfo

- (NMRAppLaunchInfo)initWithPlayerResponse:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NMRAppLaunchInfo;
  v5 = [(NMRAppLaunchInfo *)&v43 init];
  if (v5)
  {
    v6 = [v4 playerPath];
    char v7 = [v6 isNativeMusicPath];

    if (v7)
    {
      BOOL v8 = 0;
      v9 = @"music";
      v10 = @"com.apple.NanoMusic";
      goto LABEL_20;
    }
    v11 = [v4 playerPath];
    char v12 = [v11 isNativePodcastsPath];

    if (v12)
    {
      BOOL v8 = 0;
      v9 = @"podcasts";
      v10 = @"com.apple.podcasts";
      goto LABEL_20;
    }
    v13 = [v4 playerPath];
    if ([v13 isNativeBooksPath])
    {
      v14 = [v4 playerPath];
      v15 = [v14 route];
      if ([v15 isDeviceRoute])
      {

LABEL_11:
        BOOL v8 = 0;
        v9 = @"ibooks";
        v10 = @"com.apple.NanoBooks";
        goto LABEL_20;
      }
      v16 = [v4 playerPath];
      v17 = [v16 route];
      char v18 = [v17 isPhoneRoute];

      if (v18) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    v19 = [v4 playerPath];
    char v20 = objc_msgSend(v19, "nmr_isSystemWorkoutPath");

    if (v20)
    {
      BOOL v8 = 0;
      v9 = @"SessionTrackerApp";
      v10 = @"com.apple.SessionTrackerApp";
    }
    else
    {
      v21 = [v4 playerPath];
      int v22 = objc_msgSend(v21, "nmr_isSystemMindfulnessPath");

      BOOL v23 = v22 == 0;
      BOOL v8 = v22 == 0;
      if (v22) {
        v10 = @"com.apple.Mind";
      }
      else {
        v10 = 0;
      }
      if (v23) {
        v9 = 0;
      }
      else {
        v9 = @"Mind";
      }
    }
LABEL_20:
    v24 = [v4 playerPath];
    v25 = [v24 route];
    BOOL v26 = [(NMRAppLaunchInfo *)v5 _shouldLaunchPlaybackAppForRoute:v25];

    if (v26) {
      v27 = v9;
    }
    else {
      v27 = 0;
    }
    if (v8 || !v26)
    {
      v28 = [v4 playerPath];
      v29 = [v28 route];
      int v30 = [v29 isDeviceRoute];

      if (v30
        && ([v4 playerPath],
            v31 = objc_claimAutoreleasedReturnValue(),
            [v31 representedBundleID],
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue(),
            v31,
            v10))
      {
        v9 = v27;
      }
      else
      {
        v9 = @"nowplaying";
        v10 = @"com.apple.NanoNowPlaying";
      }
    }
    v32 = [v4 request];
    v33 = [v32 playerPath];

    v34 = [v4 playerPath];
    if (objc_msgSend(v34, "nmr_isSystemPodcastsPath"))
    {
    }
    else
    {
      v35 = [v4 playerPath];
      int v36 = objc_msgSend(v35, "nmr_isSystemBooksPath");

      if (!v36)
      {
LABEL_33:
        bundleID = v5->_bundleID;
        v5->_bundleID = &v10->isa;
        v39 = v10;

        uint64_t v40 = [(NMRAppLaunchInfo *)v5 _launchURLForScheme:v9 requestedPlayerPath:v33];
        URL = v5->_URL;
        v5->_URL = (NSURL *)v40;

        goto LABEL_34;
      }
    }
    uint64_t v37 = [v4 playerPath];

    v33 = (void *)v37;
    goto LABEL_33;
  }
LABEL_34:

  return v5;
}

- (id)_launchURLForScheme:(id)a3 requestedPlayerPath:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x263F08BA0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setScheme:v7];

  [v8 setHost:@"now-playing"];
  v9 = (void *)MEMORY[0x263F08BD0];
  v10 = [v5 route];
  v11 = [v10 designatedGroupLeaderRouteUID];
  char v12 = v11;
  if (!v11)
  {
    char v12 = [v5 deviceUID];
  }
  v13 = [v9 queryItemWithName:@"deviceUID" value:v12];
  v17[0] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [v8 setQueryItems:v14];

  if (!v11) {
  v15 = [v8 URL];
  }

  return v15;
}

- (BOOL)_shouldLaunchPlaybackAppForRoute:(id)a3
{
  id v3 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0 || !NMDeviceIsTinker()) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isDeviceRoute];
  }

  return v4;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end