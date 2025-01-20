@interface HomeNotificationViewController
- (HFHomeKitDispatcher)dispatcher;
- (HMCameraProfile)cameraProfile;
- (HMCameraSnapshot)notificationSnapshot;
- (HMHome)home;
- (HMService)affectedService;
- (HomeNotificationTableViewController)contentViewController;
- (HomeNotificationViewController)init;
- (NAUILayoutConstraintSet)staticConstraintSet;
- (NSDictionary)context;
- (NSLayoutConstraint)heightConstraint;
- (NSSet)cameraSignificantEvents;
- (NSSet)faceKnownSignificantEvents;
- (NSSet)faceUnknownSignificantEvents;
- (NSString)notificationRequestIdentifier;
- (NSUUID)cameraClipUUID;
- (NSUUID)cameraNotificationUUID;
- (UNNotification)notification;
- (id)_cameraProfileWithUUID:(id)a3 retryDelay:(double)a4;
- (id)_configureCameraProfileWithUUID:(id)a3;
- (id)_configureCameraSignificantEventsWithUUIDs:(id)a3;
- (id)_configureHomeWithUUID:(id)a3;
- (id)_configureNotificationSnapshot;
- (id)_homeWithUUID:(id)a3;
- (id)_homeWithUUID:(id)a3 retryDelay:(double)a4;
- (void)_clearUpContentViewController;
- (void)_configureWithContextDictionary:(id)a3;
- (void)_setupContentViewController;
- (void)_setupNotificationActions;
- (void)_showErrorText:(id)a3;
- (void)didReceiveNotification:(id)a3;
- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setAffectedService:(id)a3;
- (void)setCameraClipUUID:(id)a3;
- (void)setCameraNotificationUUID:(id)a3;
- (void)setCameraProfile:(id)a3;
- (void)setCameraSignificantEvents:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setContext:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setFaceKnownSignificantEvents:(id)a3;
- (void)setFaceUnknownSignificantEvents:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setHome:(id)a3;
- (void)setNotification:(id)a3;
- (void)setNotificationRequestIdentifier:(id)a3;
- (void)setNotificationSnapshot:(id)a3;
- (void)setStaticConstraintSet:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HomeNotificationViewController

- (HomeNotificationViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)HomeNotificationViewController;
  v2 = [(HomeNotificationViewController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[HFHomeKitDispatcher sharedDispatcher];
    dispatcher = v2->_dispatcher;
    v2->_dispatcher = (HFHomeKitDispatcher *)v3;
  }
  return v2;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HomeNotificationViewController;
  [(HomeNotificationViewController *)&v8 viewDidLoad];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  objc_super v6 = +[UIColor systemBackgroundColor];
  v7 = [(HomeNotificationViewController *)self view];
  [v7 setBackgroundColor:v6];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HomeNotificationViewController;
  [(HomeNotificationViewController *)&v7 viewDidDisappear:a3];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  [(HomeNotificationViewController *)self _clearUpContentViewController];
  [(HomeNotificationViewController *)self setCameraProfile:0];
  [(HomeNotificationViewController *)self setNotificationSnapshot:0];
}

- (void)updateViewConstraints
{
  uint64_t v3 = [(HomeNotificationViewController *)self staticConstraintSet];
  [v3 activateIfNeeded];

  v4.receiver = self;
  v4.super_class = (Class)HomeNotificationViewController;
  [(HomeNotificationViewController *)&v4 updateViewConstraints];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HomeNotificationViewController;
  [(HomeNotificationViewController *)&v8 preferredContentSizeDidChangeForChildContentContainer:a3];
  objc_super v4 = [(HomeNotificationViewController *)self contentViewController];
  [v4 preferredContentSize];
  double v6 = v5;
  objc_super v7 = [(HomeNotificationViewController *)self heightConstraint];
  [v7 setConstant:v6];
}

- (void)didReceiveNotification:(id)a3
{
  objc_super v4 = a3;
  [(HomeNotificationViewController *)self setNotification:v4];
  double v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [v4 request];
    objc_super v7 = [v6 content];
    objc_super v8 = [v7 body];
    *(_DWORD *)buf = 138412546;
    v35 = v4;
    __int16 v36 = 2112;
    v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HomeNotificationViewController didReceiveNotification:%@ (body: %@)", buf, 0x16u);
  }
  v9 = [(HomeNotificationViewController *)self notificationRequestIdentifier];

  if (v9)
  {
    __int16 v10 = [(HomeNotificationViewController *)self cameraNotificationUUID];
    if (!v10) {
      goto LABEL_7;
    }
    __int16 v11 = [(HomeNotificationViewController *)self cameraNotificationUUID];
    v12 = [v4 request];
    v13 = [v12 content];
    v14 = [v13 userInfo];
    v15 = [v14 objectForKeyedSubscript:HMBulletinCameraNotificationIDKey];
    unsigned int v16 = [v11 isEqual:v15];

    if (v16)
    {
      v17 = [(HomeNotificationViewController *)self contentViewController];
      [v17 reloadAfterNotificationUpdate];
    }
    else
    {
LABEL_7:
      v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10000E204(self);
      }
    }
  }
  else
  {
    v18 = [v4 request];
    v19 = [v18 identifier];
    [(HomeNotificationViewController *)self setNotificationRequestIdentifier:v19];

    v20 = [v4 request];
    v21 = [v20 content];
    v17 = [v21 userInfo];

    v22 = HFLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v17;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Notification UserInfo:%@", buf, 0xCu);
    }

    if ((+[HFUtilities isDeviceUnlocked] & 1) != 0
      || ([v17 objectForKeyedSubscript:HMBulletinCameraProfileIDKey],
          v23 = objc_claimAutoreleasedReturnValue(),
          BOOL v24 = v23 == 0,
          v23,
          v24))
    {
      [(HomeNotificationViewController *)self _configureWithContextDictionary:v17];
    }
    else
    {
      id v25 = objc_alloc_init((Class)LAContext);
      id v33 = 0;
      unsigned __int8 v26 = [v25 canEvaluatePolicy:2 error:&v33];
      id v27 = v33;
      if (v26)
      {
        objc_initWeak((id *)buf, self);
        v28 = HULocalizedString();
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1000041A4;
        v30[3] = &unk_100018528;
        objc_copyWeak(&v32, (id *)buf);
        v31 = v17;
        [v25 evaluatePolicy:2 localizedReason:v28 reply:v30];

        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v29 = [(HomeNotificationViewController *)self extensionContext];
        [v29 dismissNotificationContentExtension];
      }
    }
  }
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  double v6 = a3;
  objc_super v7 = (void (**)(id, uint64_t))a4;
  objc_super v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 actionIdentifier];
    *(_DWORD *)buf = 138412546;
    v82 = v6;
    __int16 v83 = 2112;
    v84 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "HomeNotificationViewController didReceiveNotificationResponse:%@ (actionIdentifier: %@)", buf, 0x16u);
  }
  __int16 v10 = [v6 actionIdentifier];
  unsigned int v11 = [v10 isEqualToString:@"HomeNotificationActionAssociatePerson"];

  if (v11)
  {
    v12 = [(HomeNotificationViewController *)self faceUnknownSignificantEvents];
    id v13 = [v12 count];

    if ((unint64_t)v13 >= 2)
    {
      v14 = HFLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [(HomeNotificationViewController *)self faceUnknownSignificantEvents];
        unsigned int v16 = [v15 count];
        *(_DWORD *)buf = 134217984;
        v82 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "HomeNotificationViewController launching Home for %lu unknown persons", buf, 0xCu);
      }
      v17 = [(HomeNotificationViewController *)self home];
      v18 = +[HFURLComponents faceRecognitionSettingsURLForHome:v17];

      v19 = [(HomeNotificationViewController *)self extensionContext];
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_100004BEC;
      v78[3] = &unk_100018550;
      v79 = v18;
      v80 = self;
      id v20 = v18;
      [v19 openURL:v20 completionHandler:v78];

      v7[2](v7, 1);
      v21 = v79;
      goto LABEL_10;
    }
    v70 = v7;
    v28 = [(HomeNotificationViewController *)self faceUnknownSignificantEvents];
    v29 = [v28 anyObject];

    v69 = v29;
    v66 = [v29 uniqueIdentifier];
    uint64_t v30 = HFURLComponentsHome;
    v68 = [(HomeNotificationViewController *)self home];
    v67 = [v68 uniqueIdentifier];
    v31 = [v67 UUIDString];
    id v32 = +[NSURLQueryItem queryItemWithName:v30 value:v31];
    v87[0] = v32;
    uint64_t v33 = HFURLComponentsCameraProfile;
    v34 = [(HomeNotificationViewController *)self cameraProfile];
    v35 = [v34 uniqueIdentifier];
    __int16 v36 = [v35 UUIDString];
    v37 = +[NSURLQueryItem queryItemWithName:v33 value:v36];
    v87[1] = v37;
    v38 = +[NSArray arrayWithObjects:v87 count:2];
    v39 = +[HFURLComponents homeKitObjectURLForDestination:10 secondaryDestination:0 UUID:v66 queryItems:v38];

    v40 = HFLogForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v82 = v39;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "HomeNotificationViewController launching Home for person URL: %@", buf, 0xCu);
    }

    v41 = [(HomeNotificationViewController *)self extensionContext];
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_100004D98;
    v75[3] = &unk_100018550;
    v76 = v39;
    v77 = self;
    v42 = v39;
    [v41 openURL:v42 completionHandler:v75];

    objc_super v7 = v70;
    v70[2](v70, 1);
  }
  else
  {
    v22 = [v6 actionIdentifier];
    unsigned int v23 = [v22 isEqualToString:@"HomeNotificationActionDisassociatePerson"];

    if (v23)
    {
      BOOL v24 = [(HomeNotificationViewController *)self faceKnownSignificantEvents];
      id v25 = [v24 anyObject];

      unsigned __int8 v26 = [(HomeNotificationViewController *)self cameraProfile];
      id v27 = [v26 clipManager];
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_100004F24;
      v71[3] = &unk_1000185A0;
      v72 = v25;
      v73 = self;
      v74 = v7;
      id v20 = v25;
      [v27 handleFaceMisclassificationForSignificantEvent:v20 completion:v71];

      v21 = v72;
LABEL_10:

      goto LABEL_24;
    }
    v43 = [v6 actionIdentifier];
    unsigned int v44 = [v43 isEqualToString:@"provide_cameraRecordingFeedback"];

    if (v44)
    {
      v45 = [v6 notification];
      v46 = [v45 request];
      v47 = [v46 content];
      v48 = [v47 userInfo];
      v49 = [v48 objectForKeyedSubscript:HMUserNotificationContentActionURLKey];

      v50 = [v6 notification];
      v51 = [v50 request];
      v52 = [v51 content];
      v53 = [v52 userInfo];
      v54 = [v53 objectForKeyedSubscript:HMBulletinCameraClipIDKey];

      if (v49 && v54)
      {
        uint64_t v55 = HFNotificationCameraClipKey;
        v56 = +[HFCameraUtilities cameraFeedbackQueryString];
        v57 = +[NSString stringWithFormat:@"&%@=%@%@", v55, v54, v56];
        uint64_t v58 = [v49 stringByAppendingString:v57];

        v59 = +[NSURL URLWithString:v58];
        v60 = HFLogForCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v82 = v59;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Open app for feedback request with URL:%@.", buf, 0xCu);
        }

        v61 = [(HomeNotificationViewController *)self extensionContext];
        [v61 openURL:v59 completionHandler:0];

        v49 = (void *)v58;
      }
      else
      {
        v59 = HFLogForCategory();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v62 = [v6 notification];
          v63 = [v62 request];
          v64 = [v63 content];
          v65 = [v64 userInfo];
          *(_DWORD *)buf = 138412802;
          v82 = v54;
          __int16 v83 = 2112;
          v84 = v49;
          __int16 v85 = 2112;
          v86 = v65;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Received request to display feedback flow with invalid clip/URL string pair (%@/%@) from userInfo:%@", buf, 0x20u);
        }
      }

      v7[2](v7, 1);
    }
    else
    {
      v7[2](v7, 2);
    }
  }
LABEL_24:
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
  id v5 = a3;
  id v6 = [(HomeNotificationViewController *)self dispatcher];
  [v6 setOverrideHome:v5];
}

- (void)_configureWithContextDictionary:(id)a3
{
  id v4 = a3;
  [(HomeNotificationViewController *)self setContext:v4];
  id v5 = objc_alloc((Class)NSUUID);
  id v6 = [v4 objectForKeyedSubscript:HMBulletinContextHomeIDKey];
  id v7 = [v5 initWithUUIDString:v6];

  id v8 = objc_alloc((Class)NSUUID);
  v9 = [v4 objectForKeyedSubscript:HMBulletinCameraProfileIDKey];
  id v10 = [v8 initWithUUIDString:v9];

  id v11 = objc_alloc((Class)NSUUID);
  v12 = [v4 objectForKeyedSubscript:HMBulletinContextServiceIDKey];
  id v13 = [v11 initWithUUIDString:v12];

  v14 = [v4 objectForKeyedSubscript:HMBulletinCameraSignificantEventUUIDsKey];
  v15 = [v14 na_map:&stru_1000185E0];
  unsigned int v16 = +[NSSet setWithArray:v15];

  id v17 = objc_alloc((Class)NSUUID);
  v18 = [v4 objectForKeyedSubscript:HMBulletinCameraNotificationIDKey];
  id v19 = [v17 initWithUUIDString:v18];
  [(HomeNotificationViewController *)self setCameraNotificationUUID:v19];

  id v20 = objc_alloc((Class)NSUUID);
  v21 = [v4 objectForKeyedSubscript:HMBulletinCameraClipIDKey];
  id v22 = [v20 initWithUUIDString:v21];
  [(HomeNotificationViewController *)self setCameraClipUUID:v22];

  unsigned int v23 = [(HomeNotificationViewController *)self _configureHomeWithUUID:v7];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000056C8;
  v29[3] = &unk_100018680;
  id v30 = v4;
  v31 = self;
  id v32 = v13;
  id v33 = v10;
  id v34 = v16;
  id v24 = v16;
  id v25 = v10;
  id v26 = v13;
  id v27 = v4;
  id v28 = [v23 addCompletionBlock:v29];
}

- (id)_configureHomeWithUUID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005C80;
  v8[3] = &unk_1000186F8;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  objc_copyWeak(&v10, &location);
  id v6 = +[NAFuture futureWithBlock:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);

  return v6;
}

- (id)_configureCameraProfileWithUUID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005F70;
  v8[3] = &unk_1000186F8;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  objc_copyWeak(&v10, &location);
  id v6 = +[NAFuture futureWithBlock:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);

  return v6;
}

- (id)_configureCameraSignificantEventsWithUUIDs:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006260;
  v8[3] = &unk_1000186F8;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  objc_copyWeak(&v10, &location);
  id v6 = +[NAFuture futureWithBlock:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);

  return v6;
}

- (id)_configureNotificationSnapshot
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000067D0;
  v5[3] = &unk_1000187C0;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  uint64_t v3 = +[NAFuture futureWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (void)_setupContentViewController
{
  uint64_t v3 = [(HomeNotificationViewController *)self contentViewController];

  if (!v3)
  {
    id v4 = [(HomeNotificationViewController *)self cameraProfile];

    if (!v4)
    {
      id v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10000E648(v8);
      }
      goto LABEL_19;
    }
    id v5 = [(HomeNotificationViewController *)self affectedService];
    id v6 = [v5 serviceType];
    if ([v6 isEqualToString:HMServiceTypeMotionSensor])
    {
      id v7 = [(HomeNotificationViewController *)self cameraNotificationUUID];
      if (v7)
      {
        id v8 = 0;
      }
      else
      {
        id v8 = [(HomeNotificationViewController *)self notificationSnapshot];
      }

      if (v8) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    id v9 = [(HomeNotificationViewController *)self affectedService];
    id v10 = [v9 serviceType];
    if ([v10 isEqualToString:HMServiceTypeMotionSensor])
    {
      id v11 = [(HomeNotificationViewController *)self notification];
      v12 = [v11 request];
      id v13 = [v12 content];
      v14 = [v13 attachments];
      id v15 = [v14 count];

      if (!v15)
      {
        unsigned int v16 = HFLogForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Legacy cameras without an embedded snapshot don't get a long look.", (uint8_t *)buf, 2u);
        }

        id v8 = [(HomeNotificationViewController *)self view];
        [v8 bounds];
        -[HomeNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:", v17, 1.0);
        goto LABEL_19;
      }
    }
    else
    {
    }
    id v8 = 0;
LABEL_18:
    v18 = [HomeNotificationTableViewController alloc];
    id v19 = [(HomeNotificationViewController *)self notification];
    id v20 = [(HomeNotificationViewController *)self home];
    v21 = [(HomeNotificationViewController *)self cameraProfile];
    id v22 = [(HomeNotificationViewController *)self cameraNotificationUUID];
    unsigned int v23 = [(HomeNotificationViewController *)self cameraClipUUID];
    id v24 = [(HomeNotificationTableViewController *)v18 initWithNotification:v19 home:v20 cameraProfile:v21 notificationUUID:v22 clipUUID:v23 snapshot:v8];
    [(HomeNotificationViewController *)self setContentViewController:v24];

    id v25 = [(HomeNotificationViewController *)self contentViewController];
    [(HomeNotificationViewController *)self addChildViewController:v25];

    id v26 = [(HomeNotificationViewController *)self contentViewController];
    id v27 = [v26 view];
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v28 = [(HomeNotificationViewController *)self view];
    v29 = [(HomeNotificationViewController *)self contentViewController];
    id v30 = [v29 view];
    [v28 addSubview:v30];

    objc_initWeak(buf, self);
    id v31 = objc_alloc((Class)NAUILayoutConstraintSet);
    id v32 = [(HomeNotificationViewController *)self view];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100006F54;
    v36[3] = &unk_1000187E8;
    objc_copyWeak(&v37, buf);
    id v33 = [v31 initWithOwningView:v32 constraintBuilder:v36];
    [(HomeNotificationViewController *)self setStaticConstraintSet:v33];

    id v34 = [(HomeNotificationViewController *)self staticConstraintSet];
    [v34 activateIfNeeded];

    v35 = [(HomeNotificationViewController *)self contentViewController];
    [v35 didMoveToParentViewController:self];

    objc_destroyWeak(&v37);
    objc_destroyWeak(buf);
LABEL_19:
  }
}

- (void)_clearUpContentViewController
{
  uint64_t v3 = [(HomeNotificationViewController *)self contentViewController];
  [v3 willMoveToParentViewController:0];

  id v4 = [(HomeNotificationViewController *)self contentViewController];
  id v5 = [v4 view];
  [v5 removeFromSuperview];

  id v6 = [(HomeNotificationViewController *)self contentViewController];
  [v6 removeFromParentViewController];

  [(HomeNotificationViewController *)self setStaticConstraintSet:0];

  [(HomeNotificationViewController *)self setContentViewController:0];
}

- (void)_setupNotificationActions
{
  uint64_t v3 = [(HomeNotificationViewController *)self faceKnownSignificantEvents];
  id v4 = [v3 count];

  id v5 = [(HomeNotificationViewController *)self faceUnknownSignificantEvents];
  id v6 = [v5 count];

  id v7 = [(HomeNotificationViewController *)self home];
  unsigned int v8 = [v7 hf_currentUserIsAdministrator];

  if (v4 != (id)1 && v6 && v8)
  {
    id v9 = HULocalizedString();
    if (_os_feature_enabled_impl())
    {
      id v10 = +[UNNotificationActionIcon iconWithSystemImageName:@"person.crop.circle.badge.plus"];
      id v11 = +[UNNotificationAction actionWithIdentifier:@"HomeNotificationActionAssociatePerson" title:v9 options:0 icon:v10];
    }
    else
    {
      id v11 = +[UNNotificationAction actionWithIdentifier:@"HomeNotificationActionAssociatePerson" title:v9 options:0];
    }
    id v24 = v11;
    id v19 = &v24;
LABEL_19:
    id v20 = +[NSArray arrayWithObjects:v19 count:1];
    v21 = [(HomeNotificationViewController *)self extensionContext];
    [v21 setNotificationActions:v20];

    return;
  }
  if (v4 == (id)1 && v6 == 0) {
    unsigned int v13 = v8;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v13 == 1)
  {
    v14 = [(HomeNotificationViewController *)self faceKnownSignificantEvents];
    id v15 = [v14 anyObject];
    unsigned int v16 = [v15 faceClassification];
    double v17 = [v16 person];
    id v22 = [v17 name];
    id v9 = HULocalizedStringWithFormat();

    if (_os_feature_enabled_impl())
    {
      v18 = +[UNNotificationActionIcon iconWithSystemImageName:@"person.crop.circle.badge.xmark", v22];
      id v11 = +[UNNotificationAction actionWithIdentifier:@"HomeNotificationActionDisassociatePerson" title:v9 options:4 icon:v18];
    }
    else
    {
      id v11 = +[UNNotificationAction actionWithIdentifier:@"HomeNotificationActionDisassociatePerson", v9, 4, v22 title options];
    }
    unsigned int v23 = v11;
    id v19 = &v23;
    goto LABEL_19;
  }
}

- (void)_showErrorText:(id)a3
{
  id v4 = a3;
  id v5 = [(HomeNotificationViewController *)self contentViewController];
  id v6 = [v5 view];
  [v6 setHidden:1];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007728;
  v11[3] = &unk_100018810;
  v11[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007794;
  v8[3] = &unk_100018550;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  +[UIView animateWithDuration:0x10000 delay:v11 options:v8 animations:0.2 completion:0.0];
}

- (id)_homeWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HomeNotificationViewController *)self dispatcher];
  id v6 = [v5 allHomesFuture];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000794C;
  v10[3] = &unk_100018860;
  id v11 = v4;
  id v7 = v4;
  unsigned int v8 = [v6 flatMap:v10];

  return v8;
}

- (id)_homeWithUUID:(id)a3 retryDelay:(double)a4
{
  id v6 = a3;
  id v7 = [(HomeNotificationViewController *)self _homeWithUUID:v6];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007CC8;
  v11[3] = &unk_1000188D8;
  double v13 = a4;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  id v9 = [v7 recover:v11];

  return v9;
}

- (id)_cameraProfileWithUUID:(id)a3 retryDelay:(double)a4
{
  id v6 = a3;
  id v7 = [(HomeNotificationViewController *)self home];
  id v8 = [v7 hf_cameraProfileWithIdentifier:v6];

  id v9 = HFLogForCategory();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(NC) Found camera profile for UUID:%@", buf, 0xCu);
    }

    id v11 = +[NAFuture futureWithResult:v8];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000E774(self);
    }

    id v12 = objc_opt_new();
    double v13 = +[HFHomeKitDispatcher sharedDispatcher];
    v14 = [v13 homeManager];

    id v15 = +[NSDate dateWithTimeIntervalSinceNow:a4];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100008224;
    v20[3] = &unk_1000188B0;
    v20[4] = self;
    id v21 = v6;
    id v16 = v12;
    id v22 = v16;
    id v17 = [v14 _refreshBeforeDate:v15 completionHandler:v20];

    v18 = v22;
    id v11 = v16;
  }

  return v11;
}

- (UNNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)notificationRequestIdentifier
{
  return self->_notificationRequestIdentifier;
}

- (void)setNotificationRequestIdentifier:(id)a3
{
}

- (HFHomeKitDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (HMService)affectedService
{
  return self->_affectedService;
}

- (void)setAffectedService:(id)a3
{
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
}

- (NSSet)cameraSignificantEvents
{
  return self->_cameraSignificantEvents;
}

- (void)setCameraSignificantEvents:(id)a3
{
}

- (HMCameraSnapshot)notificationSnapshot
{
  return self->_notificationSnapshot;
}

- (void)setNotificationSnapshot:(id)a3
{
}

- (NSUUID)cameraNotificationUUID
{
  return self->_cameraNotificationUUID;
}

- (void)setCameraNotificationUUID:(id)a3
{
}

- (NSUUID)cameraClipUUID
{
  return self->_cameraClipUUID;
}

- (void)setCameraClipUUID:(id)a3
{
}

- (NSSet)faceKnownSignificantEvents
{
  return self->_faceKnownSignificantEvents;
}

- (void)setFaceKnownSignificantEvents:(id)a3
{
}

- (NSSet)faceUnknownSignificantEvents
{
  return self->_faceUnknownSignificantEvents;
}

- (void)setFaceUnknownSignificantEvents:(id)a3
{
}

- (HomeNotificationTableViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (NAUILayoutConstraintSet)staticConstraintSet
{
  return self->_staticConstraintSet;
}

- (void)setStaticConstraintSet:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_staticConstraintSet, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_faceUnknownSignificantEvents, 0);
  objc_storeStrong((id *)&self->_faceKnownSignificantEvents, 0);
  objc_storeStrong((id *)&self->_cameraClipUUID, 0);
  objc_storeStrong((id *)&self->_cameraNotificationUUID, 0);
  objc_storeStrong((id *)&self->_notificationSnapshot, 0);
  objc_storeStrong((id *)&self->_cameraSignificantEvents, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_affectedService, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_notificationRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_notification, 0);
}

@end