@interface BKUserActivityManager
+ (id)sharedInstance;
- (BOOL)continueActivity:(id)a3 sceneController:(id)a4;
- (BOOL)isInBackground;
- (BOOL)willContinueActivityWithType:(id)a3 sceneController:(id)a4;
- (BUAssertion)holdAtLaunchScreenAssertion;
- (NSUserActivity)currentActivity;
- (id)_persistentIdentifierForOpenBookActivityAsset:(id)a3;
- (id)_persistentIdentifierForPlayAudiobookActivityWithAssetID:(id)a3;
- (id)sceneManager;
- (unint64_t)generation;
- (void)_continueOpenBookActivity:(id)a3 sceneController:(id)a4 location:(id)a5;
- (void)didEnterBackground;
- (void)setCurrentActivity:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setHoldAtLaunchScreenAssertion:(id)a3;
- (void)setIsInBackground:(BOOL)a3;
- (void)startReadingAsset:(id)a3;
- (void)stopReadingCurrentAsset;
- (void)willEnterForeground;
@end

@implementation BKUserActivityManager

- (void)willEnterForeground
{
  self->_isInBackground = 0;
  [(NSUserActivity *)self->_currentActivity becomeCurrent];
}

+ (id)sharedInstance
{
  if (qword_100B4A2F0 != -1) {
    dispatch_once(&qword_100B4A2F0, &stru_100A46840);
  }
  v2 = (void *)qword_100B4A2E8;

  return v2;
}

- (void)startReadingAsset:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_generation + 1;
  self->_generation = v5;
  if ([v4 isValid]
    && ([v4 assetID], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = [v4 assetID];
    v8 = +[BKLibraryManager defaultManager];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000E7738;
    v10[3] = &unk_100A468E0;
    id v11 = v7;
    v12 = self;
    unint64_t v13 = v5;
    id v9 = v7;
    [v8 performBackgroundReadOnlyBlock:v10];
  }
  else
  {
    [(BKUserActivityManager *)self setCurrentActivity:0];
  }
}

- (void)stopReadingCurrentAsset
{
}

- (BOOL)willContinueActivityWithType:(id)a3 sceneController:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = [a4 willContinueActivityWithType:v5 sceneController:a4];
  v11[0] = @"com.apple.iBooks.assetReading";
  v11[1] = CSSearchableItemActionType;
  v7 = +[NSArray arrayWithObjects:v11 count:2];
  v8 = v7;
  BOOL v9 = (v6 & 1) != 0 || v5 && [v7 containsObject:v5];

  return v9;
}

- (id)sceneManager
{
  return +[BKAppDelegate sceneManager];
}

- (BOOL)continueActivity:(id)a3 sceneController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = BCSceneLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [v6 activityType];
    v10 = [v6 userInfo];
    id v11 = [v7 scene];
    v12 = [v11 session];
    unint64_t v13 = [v12 persistentIdentifier];
    *(_DWORD *)buf = 138543874;
    v120 = v9;
    __int16 v121 = 2112;
    v122 = v10;
    __int16 v123 = 2114;
    v124 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "activityManager continueActivity: activityType=%{public}@, userInfo=%@, withSceneID=%{public}@", buf, 0x20u);
  }
  if (v7 && ([v7 continueActivity:v6 sceneController:v7] & 1) != 0) {
    goto LABEL_59;
  }
  v14 = [v6 activityType];
  unsigned int v15 = [v14 isEqualToString:@"com.apple.iBooks.assetReading"];

  if (v15)
  {
    id v16 = [v6 userInfo];
    v17 = [v16 objectForKeyedSubscript:@"assetID"];
LABEL_48:
    id v40 = 0;
    goto LABEL_49;
  }
  v18 = [v6 activityType];
  unsigned int v19 = [v18 isEqualToString:CSSearchableItemActionType];

  if (v19)
  {
    objc_opt_class();
    v20 = [v6 userInfo];
    v21 = [v20 objectForKeyedSubscript:CSSearchableItemActivityIdentifier];
    v22 = BUDynamicCast();

    if (![v22 hasPrefix:@"NSUA:"])
    {
      id v16 = v22;
      id v40 = 0;
      v17 = v16;
LABEL_49:

      goto LABEL_50;
    }
    v96 = self;
    v23 = v22;
    v24 = [v22 substringFromIndex:[@"NSUA:" length]];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    v117[0] = @"com.apple.iBooks.openBook";
    v117[1] = @"com.apple.iBooks.playAudiobook";
    v25 = +[NSArray arrayWithObjects:v117 count:2];
    id v26 = [v25 countByEnumeratingWithState:&v111 objects:v118 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v112;
LABEL_11:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v112 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = [*(id *)(*((void *)&v111 + 1) + 8 * v29) stringByAppendingString:@"."];
        if ([v24 hasPrefix:v30]) {
          break;
        }

        if (v27 == (id)++v29)
        {
          id v27 = [v25 countByEnumeratingWithState:&v111 objects:v118 count:16];
          if (v27) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
      v17 = [v24 substringFromIndex:[v30 length]];

      self = v96;
      id v16 = v23;
      if (v17) {
        goto LABEL_47;
      }
    }
    else
    {
LABEL_17:

      self = v96;
      id v16 = v23;
    }
    v51 = BooksSiriLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_1007EA7F8();
    }

    v17 = 0;
    goto LABEL_47;
  }
  v31 = [v6 activityType];
  unsigned int v32 = [v31 isEqualToString:@"INPlayMediaIntent"];

  if (v32)
  {
    objc_opt_class();
    v33 = [v6 interaction];
    v34 = [v33 intent];
    BUDynamicCast();
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    v35 = [v16 mediaItems];
    v24 = [v35 lastObject];

    v36 = [v24 identifier];
    id v37 = [v36 length];

    if (v37)
    {
      v38 = [v24 identifier];
      v39 = +[NSURL URLWithString:v38];

      v17 = [v39 bu_assetIDFromURL];
    }
    else
    {
      v39 = BCSceneLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_1007EA860(v39, v52, v53, v54, v55, v56, v57, v58);
      }
      v17 = 0;
    }

LABEL_47:
    goto LABEL_48;
  }
  if ([v6 isClassKitDeepLink])
  {
    v41 = BCSceneLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "activityManager handling ClassKit Activity", buf, 2u);
    }

    id v16 = [v6 userInfo];
    if (v16)
    {
      [v6 contextIdentifierPath];
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      v42 = (id)objc_claimAutoreleasedReturnValue();
      id v43 = [v42 countByEnumeratingWithState:&v107 objects:v116 count:16];
      id v95 = v16;
      v97 = self;
      id v94 = v7;
      if (v43)
      {
        id v44 = v43;
        v45 = v42;
        uint64_t v46 = *(void *)v108;
        do
        {
          for (i = 0; i != v44; i = (char *)i + 1)
          {
            if (*(void *)v108 != v46) {
              objc_enumerationMutation(v45);
            }
            v48 = [*(id *)(*((void *)&v107 + 1) + 8 * i) componentsSeparatedByString:@":"];
            v49 = [v48 firstObject];
            if ([v49 isEqualToString:@"bookAssetID"])
            {
              id v50 = [v48 count];

              if ((unint64_t)v50 > 1)
              {
                v17 = [v48 objectAtIndex:1];

                goto LABEL_65;
              }
            }
            else
            {
            }
          }
          id v44 = [v45 countByEnumeratingWithState:&v107 objects:v116 count:16];
        }
        while (v44);
        v17 = 0;
LABEL_65:
        id v16 = v95;
        self = v97;
        v42 = v45;
        id v7 = v94;
      }
      else
      {
        v17 = 0;
      }

      if ([v17 length])
      {
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        obj = v42;
        id v78 = [obj countByEnumeratingWithState:&v103 objects:v115 count:16];
        if (v78)
        {
          id v79 = v78;
          v80 = v42;
          uint64_t v81 = *(void *)v104;
          while (2)
          {
            for (j = 0; j != v79; j = (char *)j + 1)
            {
              if (*(void *)v104 != v81) {
                objc_enumerationMutation(obj);
              }
              v83 = [*(id *)(*((void *)&v103 + 1) + 8 * (void)j) componentsSeparatedByString:@":"];
              v84 = [v83 firstObject];
              if ([v84 isEqualToString:v17])
              {
                id v85 = [v83 count];

                if ((unint64_t)v85 >= 2)
                {
                  v93 = [v83 objectAtIndex:1];
                  if ([v93 length]) {
                    id v40 = [objc_alloc((Class)BKAnchorPathLocation) initWithPath:v93];
                  }
                  else {
                    id v40 = 0;
                  }
                  id v16 = v95;
                  v42 = v80;

                  self = v97;
                  goto LABEL_88;
                }
              }
              else
              {
              }
            }
            id v79 = [obj countByEnumeratingWithState:&v103 objects:v115 count:16];
            if (v79) {
              continue;
            }
            break;
          }
          id v40 = 0;
          id v16 = v95;
          self = v97;
          v42 = v80;
LABEL_88:
          id v7 = v94;
        }
        else
        {
          id v40 = 0;
          self = v97;
        }
      }
      else
      {
        obj = BCSceneLog();
        if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
          sub_1007EA8D0(obj, v86, v87, v88, v89, v90, v91, v92);
        }
        id v40 = 0;
      }
    }
    else
    {
      v42 = BCSceneLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_1007EA898(v42, v71, v72, v73, v74, v75, v76, v77);
      }
      id v40 = 0;
      v17 = 0;
    }

    goto LABEL_49;
  }
  id v40 = 0;
  v17 = 0;
LABEL_50:
  if ([v17 length])
  {
    v59 = BCSceneLog();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v120 = v17;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "Handling incoming assetID to continue user activity: %@", buf, 0xCu);
    }

    v60 = +[BKAppDelegate delegate];
    v61 = [v60 appLaunchCoordinator];

    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472;
    v99[2] = sub_1000E8D6C;
    v99[3] = &unk_100A46930;
    v100 = v17;
    v101 = self;
    id v102 = v40;
    id v62 = v40;
    id v63 = v17;
    [v61 appLaunchCoordinatorOnConditionMask:65 blockID:@"Handle incoming asset continueActivity" performBlock:v99];

    id v64 = v100;
  }
  else
  {
    [(BKUserActivityManager *)self setHoldAtLaunchScreenAssertion:0];

    v65 = [v6 activityType];
    unsigned int v66 = [v65 isEqualToString:NSUserActivityTypeBrowsingWeb];

    if (!v66)
    {
      BOOL v69 = 0;
      goto LABEL_60;
    }
    id v63 = [v6 webpageURL];
    v61 = objc_opt_new();
    v67 = [v6 _sourceApplication];

    if (v67)
    {
      v68 = [v6 _sourceApplication];
      [v61 setObject:v68 forKeyedSubscript:UIApplicationOpenURLOptionsSourceApplicationKey];
    }
    id v62 = +[BKAppDelegate delegate];
    id v64 = [v61 copy];
    [v62 applicationOpenURL:v63 options:v64 sceneController:0];
  }

LABEL_59:
  BOOL v69 = 1;
LABEL_60:

  return v69;
}

- (void)_continueOpenBookActivity:(id)a3 sceneController:(id)a4 location:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[BKAppDelegate delegate];
  v12 = [v11 appLaunchCoordinator];

  unsigned __int8 v13 = [v12 appLaunchCoordinatorHasAppLaunched];
  v24[0] = @"BKBookPresentingUseLargeCoverIfNeeded";
  v24[1] = AEAudiobookOptionsShouldNotAutoplayKey;
  v25[0] = &__kCFBooleanTrue;
  v25[1] = &__kCFBooleanFalse;
  v24[2] = @"BKBookPresentingFromUserActivity";
  v25[2] = &__kCFBooleanTrue;
  v14 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
  id v15 = [v14 mutableCopy];

  id v16 = [(BKUserActivityManager *)self sceneManager];
  v17 = [v16 bookPresenter];

  id v18 = [v9 newShowAssetTransaction];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000E9394;
  v20[3] = &unk_100A46958;
  id v21 = v12;
  v22 = self;
  unsigned __int8 v23 = v13;
  id v19 = v12;
  [v17 showAssetWithTransaction:v18 assetID:v10 location:v8 options:v15 completion:v20];
}

- (void)setCurrentActivity:(id)a3
{
  id v4 = (NSUserActivity *)a3;
  [(NSUserActivity *)self->_currentActivity resignCurrent];
  currentActivity = self->_currentActivity;
  self->_currentActivity = v4;
  id v6 = v4;

  [(NSUserActivity *)self->_currentActivity becomeCurrent];
}

- (void)didEnterBackground
{
  self->_isInBackground = 1;
  [(NSUserActivity *)self->_currentActivity resignCurrent];
}

- (id)_persistentIdentifierForPlayAudiobookActivityWithAssetID:(id)a3
{
  return +[NSString stringWithFormat:@"%@.%@", @"com.apple.iBooks.playAudiobook", a3];
}

- (id)_persistentIdentifierForOpenBookActivityAsset:(id)a3
{
  return +[NSString stringWithFormat:@"%@.%@", @"com.apple.iBooks.openBook", a3];
}

- (BOOL)isInBackground
{
  return self->_isInBackground;
}

- (void)setIsInBackground:(BOOL)a3
{
  self->_isInBackground = a3;
}

- (NSUserActivity)currentActivity
{
  return self->_currentActivity;
}

- (BUAssertion)holdAtLaunchScreenAssertion
{
  return self->_holdAtLaunchScreenAssertion;
}

- (void)setHoldAtLaunchScreenAssertion:(id)a3
{
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdAtLaunchScreenAssertion, 0);

  objc_storeStrong((id *)&self->_currentActivity, 0);
}

@end