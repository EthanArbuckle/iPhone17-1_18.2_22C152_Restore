@interface FaceTimeApplication
+ (id)allowedNotificationCategories;
- (BOOL)_isBlurUI;
- (BOOL)_isIPad;
- (BOOL)_styleIsActuallyGoingToBlur;
- (BOOL)alwaysShowLocalVideo;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)audioButtonAllowsPhoneCallsAndFaceTimeAudio;
- (BOOL)badgesMissedFaceTimeAudio;
- (BOOL)badgesMissedFaceTimeVideo;
- (BOOL)badgesMissedTelephonyCalls;
- (BOOL)contentViewAnimationsFadeInsteadOfMove;
- (BOOL)contentViewCanRotate;
- (BOOL)hasEnhancedVoicemail;
- (BOOL)headerViewShowsAllRecentCalls;
- (BOOL)shouldUseCompactHorizontalLayout;
- (BOOL)showSplashScreenOnSignin;
- (BOOL)showsFaceTimeAudio;
- (BOOL)showsFaceTimeAudioFavorites;
- (BOOL)showsFaceTimeAudioRecents;
- (BOOL)showsFaceTimeVideo;
- (BOOL)showsFaceTimeVideoFavorites;
- (BOOL)showsFaceTimeVideoRecents;
- (BOOL)showsPhoneDialer;
- (BOOL)showsPhoneVoicemail;
- (BOOL)showsTelephonyCalls;
- (BOOL)showsTelephonyFavorites;
- (BOOL)showsTelephonyRecents;
- (BOOL)showsThirdPartyRecents;
- (BOOL)tabBarCanSlide;
- (BOOL)tabBarFillsScreen;
- (BOOL)usesBlendModes;
- (BOOL)usesUnifiedInterface;
- (UNUserNotificationCenter)notificationCenter;
- (id)_fetchScrollView;
- (id)applicationTintColor;
- (id)callHistoryController;
- (id)recentsController;
- (id)scrollTestsWithCount:(int64_t)a3 forScrollView:(id)a4 name:(id)a5;
- (int)defaultAction;
- (int64_t)backdropStyle;
- (int64_t)headerViewNumberOfCallsToShow;
- (unsigned)contentViewOffscreenEdge;
- (unsigned)userInterfaceStyle;
- (void)_ftFailedTest:(id)a3;
- (void)_ftStartedTest:(id)a3;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)applicationOpenURL:(id)a3;
- (void)handleRecentsDetailsViewURL:(id)a3;
- (void)handleVideoMessagePlaybackURL:(id)a3;
- (void)performScrollTestWithName:(id)a3 options:(id)a4;
- (void)performTestWithName:(id)a3 options:(id)a4;
- (void)setNotificationCenter:(id)a3;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation FaceTimeApplication

- (void)applicationDidFinishLaunching:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FaceTimeApplication;
  [(PhoneApplication *)&v7 applicationDidFinishLaunching:a3];
  v4 = [(PhoneApplication *)self rootViewController];
  [v4 createFaceTimeFirstRunViewIfNeeded];

  +[PHThumperSetupController showThumperAvailableDialogIfNecessary];
  v5 = +[UNUserNotificationCenter currentNotificationCenter];
  [(FaceTimeApplication *)self setNotificationCenter:v5];

  v6 = [(FaceTimeApplication *)self notificationCenter];
  [v6 setDelegate:self];

  +[CNKNameAndPhotoUtilities prewarm];
}

- (BOOL)contentViewAnimationsFadeInsteadOfMove
{
  return 0;
}

- (id)recentsController
{
  recentsController = self->_recentsController;
  if (!recentsController)
  {
    v4 = +[FTApplicationServices sharedInstance];
    v5 = [PHRecentsController alloc];
    v6 = [(FaceTimeApplication *)self callHistoryController];
    objc_super v7 = [v4 callProviderManager];
    v8 = [v4 contactStore];
    v9 = [v4 suggestedContactStore];
    v10 = [v4 metadataCache];
    v11 = [(PHRecentsController *)v5 initWithCallHistoryController:v6 callProviderManager:v7 contactStore:v8 suggestedContactStore:v9 metadataCache:v10];
    v12 = self->_recentsController;
    self->_recentsController = v11;

    recentsController = self->_recentsController;
  }

  return recentsController;
}

- (BOOL)_styleIsActuallyGoingToBlur
{
  if (qword_1000BC260 != -1) {
    dispatch_once(&qword_1000BC260, &stru_1000A2780);
  }
  return byte_1000BC258 && !UIAccessibilityIsReduceMotionEnabled() && !UIAccessibilityIsReduceTransparencyEnabled();
}

- (BOOL)alwaysShowLocalVideo
{
  if ([(FaceTimeApplication *)self tabBarFillsScreen])
  {
    BOOL v3 = [(FaceTimeApplication *)self _isBlurUI];
    if (v3)
    {
      LOBYTE(v3) = [(FaceTimeApplication *)self _styleIsActuallyGoingToBlur];
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)tabBarFillsScreen
{
  v2 = [(PhoneApplication *)self rootViewController];
  BOOL v3 = [v2 traitCollection];

  LOBYTE(v2) = [v3 horizontalSizeClass] == (id)1;
  return (char)v2;
}

- (BOOL)_isBlurUI
{
  return [UIApp userInterfaceStyle] == 1;
}

- (unsigned)userInterfaceStyle
{
  return 1;
}

- (BOOL)usesUnifiedInterface
{
  return 1;
}

- (BOOL)tabBarCanSlide
{
  return 1;
}

- (BOOL)showsThirdPartyRecents
{
  return 0;
}

- (BOOL)showsTelephonyRecents
{
  if ([UIApp isDeviceCapableOfTelephonyCalls]) {
    return 0;
  }

  return +[TUCallCapabilities supportsTelephonyCalls];
}

- (BOOL)showsFaceTimeVideoRecents
{
  return [UIApp isDeviceCapableOfFaceTimeVideo];
}

- (BOOL)showsFaceTimeAudioRecents
{
  return [UIApp isDeviceCapableOfFaceTimeAudio];
}

- (BOOL)shouldUseCompactHorizontalLayout
{
  return ![(FaceTimeApplication *)self tabBarFillsScreen]
      && (id)+[PHUIConfiguration contentViewSizeForFaceTime] != (id)2;
}

- (void)setNotificationCenter:(id)a3
{
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)contentViewCanRotate
{
  return +[PHUIConfiguration canAutoRotateInCallUIForFaceTime];
}

- (id)callHistoryController
{
  return [(PhoneApplication *)self callHistoryControllerWithCoalescingStrategy:2];
}

- (int64_t)backdropStyle
{
  if ([UIApp userInterfaceStyle] == 1) {
    return 2030;
  }
  else {
    return -2;
  }
}

- (id)applicationTintColor
{
  return +[UIColor systemGreenColor];
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v6 = a4;
  objc_super v7 = sub_100012C68();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FaceTime was launched via URL", (uint8_t *)&v13, 2u);
  }

  v8 = [v6 pseudonymForLinkDetailsView];

  if (v8)
  {
    v9 = sub_100012C68();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Showing link detail view for pseudonym %@", (uint8_t *)&v13, 0xCu);
    }

    v10 = [(PhoneApplication *)self rootViewController];
    v11 = [v10 faceTimeContainerViewController];
    [v11 showLinkDetailViewControllerForPseudonym:v8];
  }
  return 1;
}

- (void)handleVideoMessagePlaybackURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 videoMessageUUID];
  id v6 = sub_100012C68();
  objc_super v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Showing video message player for message UUID %@", (uint8_t *)&v9, 0xCu);
    }

    objc_super v7 = [(PhoneApplication *)self rootViewController];
    v8 = [v7 faceTimeContainerViewController];
    [v8 showVideoPlayerForMessageWithUUID:v5];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10006B11C((uint64_t)v4, v7);
  }
}

- (void)handleRecentsDetailsViewURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 recentsUniqueID];
  id v6 = sub_100012C68();
  objc_super v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Showing recents details view for call with uniqueID: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_super v7 = [(PhoneApplication *)self rootViewController];
    v8 = [v7 faceTimeContainerViewController];
    [v8 presentRecentsDetailsViewFor:v5];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10006B194((uint64_t)v4, v7);
  }
}

- (void)applicationOpenURL:(id)a3
{
  id v4 = a3;
  if ([v4 isFaceTimeAppVideoMessagePlaybackURL])
  {
    [(FaceTimeApplication *)self handleVideoMessagePlaybackURL:v4];
  }
  else if ([v4 isFaceTimeRecentsDetailsViewURL])
  {
    [(FaceTimeApplication *)self handleRecentsDetailsViewURL:v4];
  }
}

- (BOOL)_isIPad
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (id)1;

  return v3;
}

- (BOOL)usesBlendModes
{
  if ([UIApp userInterfaceStyle] != 1) {
    return 0;
  }

  return [(FaceTimeApplication *)self _styleIsActuallyGoingToBlur];
}

- (unsigned)contentViewOffscreenEdge
{
  return 2 * ([UIApp userInterfaceLayoutDirection] != 0);
}

- (BOOL)showSplashScreenOnSignin
{
  return 1;
}

- (int)defaultAction
{
  return 1;
}

- (BOOL)showsTelephonyCalls
{
  return 0;
}

- (BOOL)showsFaceTimeAudio
{
  return [UIApp isDeviceCapableOfFaceTimeAudio];
}

- (BOOL)showsFaceTimeVideo
{
  return [UIApp isDeviceCapableOfFaceTimeVideo];
}

- (BOOL)showsTelephonyFavorites
{
  return 0;
}

- (BOOL)showsFaceTimeAudioFavorites
{
  return [UIApp isDeviceCapableOfFaceTimeAudio];
}

- (BOOL)showsFaceTimeVideoFavorites
{
  return [UIApp isDeviceCapableOfFaceTimeVideo];
}

- (BOOL)badgesMissedTelephonyCalls
{
  return 0;
}

- (BOOL)badgesMissedFaceTimeAudio
{
  return [UIApp isDeviceCapableOfFaceTimeAudio];
}

- (BOOL)badgesMissedFaceTimeVideo
{
  return [UIApp isDeviceCapableOfFaceTimeVideo];
}

- (BOOL)showsPhoneDialer
{
  return 0;
}

- (BOOL)showsPhoneVoicemail
{
  return 0;
}

- (BOOL)audioButtonAllowsPhoneCallsAndFaceTimeAudio
{
  return +[TUCallCapabilities supportsPrimaryCalling] ^ 1;
}

- (BOOL)headerViewShowsAllRecentCalls
{
  return 0;
}

- (BOOL)hasEnhancedVoicemail
{
  return 0;
}

- (int64_t)headerViewNumberOfCallsToShow
{
  return 1;
}

+ (id)allowedNotificationCategories
{
  if (qword_1000BC270 != -1) {
    dispatch_once(&qword_1000BC270, &stru_1000A27A0);
  }
  v2 = (void *)qword_1000BC268;

  return v2;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  int v13 = (void (**)(id, uint64_t))a5;
  objc_super v7 = [a4 request];
  v8 = [v7 content];
  int v9 = [v8 categoryIdentifier];

  if ([v9 length])
  {
    v10 = +[FaceTimeApplication allowedNotificationCategories];
    if ([v10 containsObject:v9])
    {

LABEL_6:
      uint64_t v12 = 24;
      goto LABEL_9;
    }
    if ([(FaceTimeApplication *)self applicationState])
    {
      unsigned __int8 v11 = [v9 isEqualToString:@"group-facetime-invite"];

      if (v11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  uint64_t v12 = 0;
LABEL_9:
  v13[2](v13, v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);

  objc_storeStrong((id *)&self->_recentsController, 0);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  return 1;
}

- (void)performTestWithName:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 hasPrefix:@"Scroll"]
    && (([v7 hasSuffix:@"Recents"] & 1) != 0
     || ([v7 hasSuffix:@"RecentsGlitch"] & 1) != 0
     || [v7 hasSuffix:@"RecentsGlitchExtended"]))
  {
    [(FaceTimeApplication *)self performScrollTestWithName:v7 options:v6];
  }
}

- (void)performScrollTestWithName:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 objectForKeyedSubscript:@"offset"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (uint64_t v9 = (uint64_t)[v8 intValue], (v9 - 0x7FFFFFFF) <= 1))
  {
    [(FaceTimeApplication *)self _ftFailedTest:v6];
    v10 = sub_100012C68();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006B2E4((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v9 = 0x7FFFFFFFLL;
  }
  v17 = [v7 objectForKeyedSubscript:@"iterations"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v18 = [v17 intValue];
    if ((v18 - 0x7FFFFFFF) > 1)
    {
      if (v9 == 0x7FFFFFFF) {
        goto LABEL_13;
      }
      id v26 = v18;
      if (([v6 hasSuffix:@"Recents"] & 1) == 0
        && ([v6 hasSuffix:@"RecentsGlitch"] & 1) == 0
        && ![v6 hasSuffix:@"RecentsGlitchExtended"]
        || ([(FaceTimeApplication *)self _fetchScrollView],
            (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        [(FaceTimeApplication *)self _ftFailedTest:v6];
        v19 = sub_100012C68();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10006B278((uint64_t)v6, v19, v34, v35, v36, v37, v38, v39);
        }
        goto LABEL_12;
      }
      v19 = v27;
      v28 = sub_100012C68();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v41 = 138412546;
        id v42 = v6;
        __int16 v43 = 2112;
        id v44 = v7;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Performing scroll test %@ with the following options: %@", (uint8_t *)&v41, 0x16u);
      }

      [(FaceTimeApplication *)self _ftStartedTest:v6];
      v29 = [v7 objectForKey:@"recapBased"];
      if ([v29 BOOLValue])
      {
        unsigned int v30 = +[RPTTestRunner isRecapAvailable];

        if (v30)
        {
          v31 = sub_100012C68();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v41) = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Running recap based scroll view test", (uint8_t *)&v41, 2u);
          }

          v32 = [(FaceTimeApplication *)self scrollTestsWithCount:(int)v26 forScrollView:v19 name:v6];
          id v33 = +[RPTGroupScrollTestParameters newWithTestName:v6 parameters:v32 completionHandler:&stru_1000A28C8];

          +[RPTTestRunner runTestWithParameters:v33];
          goto LABEL_12;
        }
      }
      else
      {
      }
      [v19 _performScrollTest:v6 iterations:v26 delta:v9];
      v40 = sub_100012C68();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        int v41 = 138412290;
        id v42 = v6;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Finished test %@", (uint8_t *)&v41, 0xCu);
      }

      goto LABEL_12;
    }
  }
  [(FaceTimeApplication *)self _ftFailedTest:v6];
  v19 = sub_100012C68();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10006B20C((uint64_t)v17, v19, v20, v21, v22, v23, v24, v25);
  }
LABEL_12:

LABEL_13:
}

- (id)scrollTestsWithCount:(int64_t)a3 forScrollView:(id)a4 name:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  if (a3 >= 2)
  {
    uint64_t v10 = 0;
    do
    {
      id v11 = objc_alloc((Class)RPTScrollViewTestParameters);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10004945C;
      v16[3] = &unk_1000A20B0;
      v16[4] = v10;
      id v12 = [v11 initWithTestName:v8 scrollView:v7 completionHandler:v16];
      [v12 setShouldFlick:0];
      [v9 addObject:v12];

      ++v10;
    }
    while (a3 - 1 != v10);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100049508;
  v15[3] = &unk_1000A20B0;
  v15[4] = a3;
  id v13 = [objc_alloc((Class)RPTScrollViewTestParameters) initWithTestName:v8 scrollView:v7 completionHandler:v15];
  [v9 addObject:v13];

  return v9;
}

- (id)_fetchScrollView
{
  v2 = [(PhoneApplication *)self rootViewController];
  BOOL v3 = [v2 faceTimeContainerViewController];
  id v4 = [v3 collectionView];

  return v4;
}

- (void)_ftFailedTest:(id)a3
{
}

- (void)_ftStartedTest:(id)a3
{
}

@end