@interface ICSystemPaperWindowSceneDelegate
- (ICNAWindowSceneEventReporter)eventReporter;
- (NSUserActivity)setupUserActivity;
- (id)contentItemForUserActivity:(id)a3;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)eventReporterLostSession:(id)a3;
- (void)ic_sceneDidDisconnect:(id)a3;
- (void)ic_setupWithScene:(id)a3 options:(id)a4;
- (void)notesSceneDidReceiveCreateNewNoteRequest:(id)a3;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setSetupUserActivity:(id)a3;
- (void)setUpResumeEditingSystemPaperArchive:(id)a3 prefersNewNote:(BOOL)a4;
- (void)setupSystemPaperWithWindowScene:(id)a3 options:(id)a4;
@end

@implementation ICSystemPaperWindowSceneDelegate

- (void)ic_setupWithScene:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    v10 = "-[ICSystemPaperWindowSceneDelegate ic_setupWithScene:options:]";
    __int16 v11 = 1024;
    int v12 = 69;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v9, 0x12u);
  }

  [(ICSystemPaperWindowSceneDelegate *)self setupSystemPaperWithWindowScene:v7 options:v6];
}

- (void)ic_sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[ICSystemPaperWindowSceneDelegate ic_sceneDidDisconnect:]";
    __int16 v10 = 1024;
    int v11 = 75;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v8, 0x12u);
  }

  [(ICCommonWindowSceneDelegate *)self sharedDisconnect];
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v4 _unregisterSettingsDiffActionArrayForKey:v7];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  v15 = self;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = +[NSArray arrayWithObjects:&v15 count:1];
  int v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  [v10 _registerSettingsDiffActionArray:v11 forKey:v13];

  v14.receiver = self;
  v14.super_class = (Class)ICSystemPaperWindowSceneDelegate;
  [(ICCommonWindowSceneDelegate *)&v14 scene:v10 willConnectToSession:v9 options:v8];
}

- (id)contentItemForUserActivity:(id)a3
{
  v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:SYNotesUserActivityKeyContentItemData];

  if (v4) {
    id v5 = [objc_alloc((Class)SYContentItem) initWithData:v4 error:0];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[ICSystemPaperWindowSceneDelegate sceneWillResignActive:]";
    __int16 v9 = 1024;
    int v10 = 104;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v6.receiver = self;
  v6.super_class = (Class)ICSystemPaperWindowSceneDelegate;
  [(ICCommonWindowSceneDelegate *)&v6 sceneWillResignActive:v4];
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[ICSystemPaperWindowSceneDelegate scene:continueUserActivity:]";
    __int16 v55 = 1024;
    int v56 = 110;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  if ((ICInternalSettingsIsSystemPaperEnabled() & 1) == 0)
  {
    v20 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not setting up System Paper UI since SystemPaper isn't enabled.", buf, 2u);
    }
    goto LABEL_44;
  }
  if ((+[ICDeviceSupport deviceSupportsSystemPaper] & 1) == 0)
  {
    v51 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_1004DCDA4();
    }

    exit(1);
  }
  uint64_t v9 = [(ICSystemPaperWindowSceneDelegate *)self setupUserActivity];
  if (!v9)
  {
LABEL_14:
    v21 = [(ICCommonWindowSceneDelegate *)self icWindow];
    v20 = [v21 ic_viewControllerManager];

    if (!v20) {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((viewControllerManager) != nil)", "-[ICSystemPaperWindowSceneDelegate scene:continueUserActivity:]", 1, 0, @"Expected non-nil value for '%s'", "viewControllerManager");
    }
    v22 = [v7 activityType];
    unsigned int v23 = [v22 isEqual:SYNotesUserActivityTypeCreateLink];

    if (v23)
    {
      v24 = [v7 userInfo];
      v25 = [v24 objectForKeyedSubscript:SYNotesUserActivityKeyPreferNewDocument];
      unsigned int v26 = [v25 BOOLValue];

      v27 = [(ICSystemPaperWindowSceneDelegate *)self contentItemForUserActivity:v7];
      if (v26) {
        id v28 = [v20 showNewNoteWithApproach:16 sender:self animated:1];
      }
      if (!v27) {
        goto LABEL_43;
      }
      v29 = [v20 noteEditorViewController];

      if (!v29) {
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((viewControllerManager.noteEditorViewController) != nil)", "-[ICSystemPaperWindowSceneDelegate scene:continueUserActivity:]", 1, 0, @"Expected non-nil value for '%s'", "viewControllerManager.noteEditorViewController");
      }
      os_log_t v30 = [v20 noteEditorViewController];
      [v30 addSystemPaperLink:v27 updateFirstResponder:0];
    }
    else
    {
      v31 = [v7 activityType];
      unsigned int v32 = [v31 isEqual:SYNotesUserActivityTypeInsertImage];

      if (v32)
      {
        v33 = [v7 userInfo];
        v34 = [v33 objectForKeyedSubscript:SYNotesUserActivityKeyPreferNewDocument];
        unsigned int v35 = [v34 BOOLValue];

        v36 = [v7 userInfo];
        v27 = [v36 objectForKeyedSubscript:SYNotesUserActivityKeyContentItemData];

        if (v35) {
          id v37 = [v20 showNewNoteWithApproach:20 sender:self animated:1];
        }
        if ([v27 count])
        {
          os_log_t v30 = [v20 noteEditorViewController];
          [v30 addSystemPaperImageData:v27 updateFirstResponder:0];
        }
        else
        {
          os_log_t v30 = os_log_create("com.apple.notes", "SystemPaper");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_1004DCCD8();
          }
        }
      }
      else
      {
        v38 = [v7 activityType];
        unsigned int v39 = [v38 isEqual:SYNotesUserActivityTypeEditNote];

        if (v39)
        {
          v27 = [v20 systemPaperViewController];
          if (!v27) {
            +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((spvc) != nil)", "-[ICSystemPaperWindowSceneDelegate scene:continueUserActivity:]", 1, 0, @"Expected non-nil value for '%s'", "spvc");
          }
          v40 = [v7 userInfo];
          os_log_t v30 = [v40 objectForKeyedSubscript:SYNotesUserActivityInfoKeyNoteID];

          v41 = [v27 currentNote];
          v42 = [v41 identifier];
          unsigned __int8 v43 = [v42 isEqual:v30];

          if ((v43 & 1) == 0)
          {
            v44 = +[ICNoteContext sharedContext];
            v45 = [v44 managedObjectContext];

            v46 = +[ICNote noteWithIdentifier:v30 context:v45];
            if (!v46) {
              +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((resolvedNote) != nil)", "-[ICSystemPaperWindowSceneDelegate scene:continueUserActivity:]", 1, 0, @"Expected non-nil value for '%s'", "resolvedNote");
            }
            v47 = [v20 systemPaperViewController];
            [v47 setCurrentNote:v46];
          }
          v48 = [v20 noteEditorViewController];
          unsigned int v49 = [v48 isFirstResponder];

          if (v49)
          {
            v50 = [v20 noteEditorViewController];
            [v50 startEditing];
          }
        }
        else
        {
          os_log_t v30 = os_log_create("com.apple.notes", "SystemPaper");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_1004DCD0C(v7, v30);
          }
          v27 = v30;
        }
      }
    }

LABEL_43:
LABEL_44:

    goto LABEL_45;
  }
  int v10 = (void *)v9;
  int v11 = [v7 activityType];
  int v12 = [(ICSystemPaperWindowSceneDelegate *)self setupUserActivity];
  v13 = [v12 activityType];
  if (![v11 isEqual:v13])
  {

    goto LABEL_14;
  }
  [v7 userInfo];
  id v14 = v7;
  v16 = id v15 = v6;
  v17 = [(ICSystemPaperWindowSceneDelegate *)self setupUserActivity];
  v18 = [v17 userInfo];
  unsigned int v52 = [v16 isEqual:v18];

  id v6 = v15;
  id v7 = v14;

  if (!v52) {
    goto LABEL_14;
  }
  v19 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not continuing user activity because it has been handled during setup.", buf, 2u);
  }

  [(ICSystemPaperWindowSceneDelegate *)self setSetupUserActivity:0];
LABEL_45:
}

- (void)setUpResumeEditingSystemPaperArchive:(id)a3 prefersNewNote:(BOOL)a4
{
  id v5 = a3;
  unsigned int v6 = +[ICPaperCommonUtilities shouldResumeLastQuickNote];
  if (a4 || !v6)
  {
    [v5 setNoteCreationApproach:16];
  }
  else
  {
    id v7 = +[ICNoteContext sharedContext];
    id v8 = [v7 managedObjectContext];

    uint64_t v9 = +[ICAccount mostRecentSystemPaperNoteInManagedObjectContext:v8];
    int v10 = v9;
    if (v9)
    {
      int v11 = [v9 objectID];
      int v12 = [v11 URIRepresentation];
      [v5 setCurrentObjectIDURL:v12];
    }
    else
    {
      v13 = os_log_create("com.apple.notes", "SystemPaper");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "We didn't want a new system paper note, but none was available to use, so creating a new one instead.", v14, 2u);
      }

      [v5 setNoteCreationApproach:19];
    }
  }
}

- (void)setupSystemPaperWithWindowScene:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v65 = "-[ICSystemPaperWindowSceneDelegate setupSystemPaperWithWindowScene:options:]";
    __int16 v66 = 1024;
    int v67 = 215;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  if (ICInternalSettingsIsSystemPaperEnabled())
  {
    if ((+[ICDeviceSupport deviceSupportsSystemPaper] & 1) == 0)
    {
      v60 = os_log_create("com.apple.notes", "SystemPaper");
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        sub_1004DCDA4();
      }

      exit(1);
    }
    uint64_t v9 = +[ICWindowStateArchive windowStateArchiveWithEmptyState];
    [v9 setSystemPaper:1];
    [v9 setActiveEditorInEditMode:1];
    [v9 setIsAuxiliaryWindow:1];
    int v10 = +[ICAppDelegate sharedInstance];
    int v11 = [v10 lastBackgroundedArchiveState];

    if (v11 && [v11 currentNoteContainerViewMode] != (id)-1) {
      -[NSObject setPreferredNoteContainerViewMode:](v9, "setPreferredNoteContainerViewMode:", [v11 currentNoteContainerViewMode]);
    }
    int v12 = +[ICAppDelegate sharedInstance];
    uint64_t v13 = [v12 mainWindowIdentifier];
    id v14 = (void *)v13;
    id v15 = @"DefaultIdentifier";
    if (v13) {
      id v15 = (__CFString *)v13;
    }
    v16 = v15;

    v17 = [@"QuickNote-" stringByAppendingString:v16];

    [v9 setToolPickerIdentifier:v17];
    v18 = +[ICNoteContext sharedContext];
    v19 = [v18 managedObjectContext];

    v20 = [v7 userActivities];
    v21 = [v20 anyObject];

    v22 = [v21 activityType];
    unsigned int v23 = [v22 isEqual:ICNotesEditNoteUserActivityType];

    v63 = v11;
    if (v23)
    {
      v24 = +[ICNACoreAnalyticsReporter sharedReporter];
      [v24 setNoteViewApproach:ICCoreAnalyticsNoteViewApproachIOSDeeplinkThumbnail];

      v25 = [v21 userInfo];
      unsigned int v26 = [v25 objectForKeyedSubscript:ICUserActivityInfoDictionaryNoteIDKey];

      v27 = +[ICNote noteWithIdentifier:v26 context:v19];
      id v28 = [v27 objectID];
      v29 = [v28 URIRepresentation];
      [v9 setCurrentObjectIDURL:v29];
    }
    else
    {
      os_log_t v30 = [v21 activityType];
      unsigned int v31 = [v30 isEqual:SYNotesUserActivityTypeCreateLink];

      if (v31)
      {
        unsigned int v32 = +[ICNACoreAnalyticsReporter sharedReporter];
        [v32 setNoteViewApproach:ICCoreAnalyticsNoteViewApproachIOSSafariMenuAffordance];

        v33 = [v21 userInfo];
        v34 = [v33 objectForKeyedSubscript:SYNotesUserActivityKeyPreferNewDocument];
        id v35 = [v34 BOOLValue];

        [(ICSystemPaperWindowSceneDelegate *)self setUpResumeEditingSystemPaperArchive:v9 prefersNewNote:v35];
        v36 = [(ICSystemPaperWindowSceneDelegate *)self contentItemForUserActivity:v21];
        [v9 setInitialSystemPaperLink:v36];

LABEL_19:
        unint64_t v43 = (unint64_t)+[UIKeyboard isInHardwareKeyboardMode];
        v44 = [v7 _launchOptionsDictionary];
        v45 = [v44 objectForKeyedSubscript:SBSUISystemNotesWindowSceneConnectionOptionsSceneConnectionSourceKey];

        v62 = v21;
        if ([v45 count])
        {
          if ((unint64_t)[v45 count] >= 2)
          {
            v46 = os_log_create("com.apple.notes", "SystemPaper");
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
              sub_1004DCDD8();
            }
          }
          v61 = v19;
          v47 = self;
          id v48 = v7;
          id v49 = v6;
          v50 = [v45 anyObject];
          unsigned int v51 = [v50 unsignedIntValue];
          unsigned int v52 = os_log_create("com.apple.notes", "SystemPaper");
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            SBSSystemNotesConnectionSourceDescription();
            v53 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v65 = v53;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "Received connection source: %@", buf, 0xCu);
          }
          if (v51 - 3 < 0xFFFFFFFE) {
            unint64_t v43 = v43;
          }
          else {
            unint64_t v43 = 0;
          }

          id v6 = v49;
          id v7 = v48;
          self = v47;
          v19 = v61;
        }
        [v9 setShouldStartEditing:v43];
        [v6 setDelegate:self];
        id v54 = [objc_alloc((Class)ICWindow) initWithWindowScene:v6 behavior:2];
        __int16 v55 = +[NSBundle mainBundle];
        int v56 = [v55 localizedStringForKey:@"System Paper Window" value:&stru_10063F3D8 table:0];
        [v54 setAccessibilityIdentifier:v56];

        v57 = +[UIColor clearColor];
        [v54 setBackgroundColor:v57];

        [v54 setOpaque:0];
        v58 = objc_alloc_init(ICViewControllerManager);
        [(ICViewControllerManager *)v58 setupWithWindow:v54 stateRestoreArchive:v9 completion:0];
        [v54 setViewControllerManager:v58];
        [v54 makeKeyAndVisible];
        [(ICSystemPaperWindowSceneDelegate *)self setSetupUserActivity:v62];
        [(ICCommonWindowSceneDelegate *)self setIcWindow:v54];

        goto LABEL_31;
      }
      id v37 = [v21 activityType];
      unsigned int v38 = [v37 isEqual:SYNotesUserActivityTypeInsertImage];

      if (!v38)
      {
        v59 = +[ICNACoreAnalyticsReporter sharedReporter];
        [v59 setNoteViewApproach:ICCoreAnalyticsNoteViewApproachIOSSystemPaperShortcut];

        [(ICSystemPaperWindowSceneDelegate *)self setUpResumeEditingSystemPaperArchive:v9 prefersNewNote:0];
        goto LABEL_19;
      }
      unsigned int v39 = [v21 userInfo];
      v40 = [v39 objectForKeyedSubscript:SYNotesUserActivityKeyPreferNewDocument];
      id v41 = [v40 BOOLValue];

      v42 = [v21 userInfo];
      unsigned int v26 = [v42 objectForKeyedSubscript:SYNotesUserActivityKeyContentItemData];

      [(ICSystemPaperWindowSceneDelegate *)self setUpResumeEditingSystemPaperArchive:v9 prefersNewNote:v41];
      [v9 setInitialSystemPaperImageData:v26];
    }

    goto LABEL_19;
  }
  uint64_t v9 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not setting up System Paper UI since SystemPaper isn't enabled.", buf, 2u);
  }
LABEL_31:
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[ICSystemPaperWindowSceneDelegate sceneDidBecomeActive:]";
    __int16 v9 = 1024;
    int v10 = 306;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v6.receiver = self;
  v6.super_class = (Class)ICSystemPaperWindowSceneDelegate;
  [(ICCommonWindowSceneDelegate *)&v6 sceneDidBecomeActive:v4];
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v12 = "-[ICSystemPaperWindowSceneDelegate sceneWillEnterForeground:]";
    __int16 v13 = 1024;
    int v14 = 312;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v10.receiver = self;
  v10.super_class = (Class)ICSystemPaperWindowSceneDelegate;
  [(ICCommonWindowSceneDelegate *)&v10 sceneWillEnterForeground:v4];
  objc_opt_class();
  objc_super v6 = ICDynamicCast();

  id v7 = +[ICAppDelegate sharedInstance];
  id v8 = [v7 analyticsController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10012A4D8;
  v9[3] = &unk_100625AF0;
  v9[4] = self;
  [v8 startWindowSceneSessionWithType:1 windowScene:v6 successHandler:v9];
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ICSystemPaperWindowSceneDelegate sceneDidEnterBackground:]";
    __int16 v16 = 1024;
    int v17 = 325;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  objc_super v6 = [(ICCommonWindowSceneDelegate *)self viewControllerManager];
  id v7 = [v6 noteEditorViewController];
  [v7 donateEditingIntentIfNecessary];

  id v8 = [(ICCommonWindowSceneDelegate *)self viewControllerManager];
  __int16 v9 = [v8 noteEditorViewController];
  [v9 setEditing:0 animated:0];

  objc_super v10 = [(ICSystemPaperWindowSceneDelegate *)self eventReporter];
  [v10 submitWindowSceneEvent];

  objc_opt_class();
  int v11 = ICDynamicCast();
  int v12 = +[ICNAController sharedController];
  [v12 endWindowSceneSessionSynchronously:0 forSessionType:1 endReason:6 windowScene:v11];

  v13.receiver = self;
  v13.super_class = (Class)ICSystemPaperWindowSceneDelegate;
  [(ICCommonWindowSceneDelegate *)&v13 sceneDidEnterBackground:v4];
}

- (void)notesSceneDidReceiveCreateNewNoteRequest:(id)a3
{
  id v4 = [(ICCommonWindowSceneDelegate *)self viewControllerManager];
  id v6 = v4;
  if (!v4)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((viewControllerManager) != nil)", "-[ICSystemPaperWindowSceneDelegate notesSceneDidReceiveCreateNewNoteRequest:]", 1, 0, @"Expected non-nil value for '%s'", "viewControllerManager");
    id v4 = 0;
  }
  id v5 = [v4 showNewNoteWithApproach:19 sender:self animated:1];
}

- (ICNAWindowSceneEventReporter)eventReporter
{
  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics])
  {
    id v3 = objc_alloc((Class)ICNAWindowSceneEventReporter);
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = [(ICCommonWindowSceneDelegate *)self icWindow];
    id v7 = [v6 windowScene];
    id v8 = (ICNAWindowSceneEventReporter *)[v3 initWithSubTrackerName:v5 windowScene:v7];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v8;

    objc_super v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"eventReporterLostSession:" name:ICNAEventReporterLostSessionNotification object:self->_eventReporter];
  }
  int v11 = self->_eventReporter;

  return v11;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = ICNAEventReporterLostSessionNotification;
  id v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v10 = a6;
  int v11 = [a4 settings];
  unsigned __int16 v12 = (unsigned __int16)[v11 deactivationReasons];

  [v10 deactivationReasons];
  if ((v12 & 0x1000) != 0)
  {
    if (BSEqualBools()) {
      return;
    }
    objc_super v13 = [(ICCommonWindowSceneDelegate *)self icWindow];
    int v14 = [v13 ic_viewControllerManager];
    id v15 = [v14 noteEditorViewController];
    [v15 setEditing:0 animated:0];

    id v16 = [(ICSystemPaperWindowSceneDelegate *)self eventReporter];
    [v16 submitWindowSceneEvent];
  }
  else
  {
    if (BSEqualBools()) {
      return;
    }
    id v16 = [(ICSystemPaperWindowSceneDelegate *)self eventReporter];
    [v16 startWindowSceneEventDurationTracking];
  }
}

- (NSUserActivity)setupUserActivity
{
  return self->_setupUserActivity;
}

- (void)setSetupUserActivity:(id)a3
{
}

- (void)setEventReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);

  objc_storeStrong((id *)&self->_setupUserActivity, 0);
}

@end