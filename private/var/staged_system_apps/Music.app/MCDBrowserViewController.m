@interface MCDBrowserViewController
- (BOOL)_isNowPlayingAvailable;
- (BOOL)_limitedUIEnabled;
- (BOOL)deviceAcknowledgementRequired;
- (BOOL)hasNowPlayingViewControllerBeenPushed;
- (MCDBrowserViewController)init;
- (NSArray)tabIdentifiers;
- (id)_createViewControllerForIdentifier:(id)a3;
- (id)currentNowPlayingViewControllerInStack;
- (id)nowPlayingButtonView;
- (void)MCD_popNowPlayingViewControllerAnimated:(BOOL)a3;
- (void)MCD_pushNowPlayingViewControllerAnimated:(BOOL)a3;
- (void)MCD_pushNowPlayingViewControllerAnimated:(BOOL)a3 fromViewController:(id)a4;
- (void)_beginObservingPrivacyInfo;
- (void)_endObservingPrivacyInfoIfNeeded;
- (void)_limitedUIChanged:(id)a3;
- (void)_mediaLibraryDidChange:(id)a3;
- (void)_nowPlayingButtonTouchUpInside:(id)a3;
- (void)_nowPlayingDidChangeNotification:(id)a3;
- (void)_reloadTabsViewControllers;
- (void)_removeDetailViews;
- (void)_setAppropriateViewControllers;
- (void)_updateNowPlayingVisibility;
- (void)dealloc;
- (void)pushNowPlaying:(BOOL)a3;
- (void)pushSharePlayTogetherSettings;
- (void)refreshNavigationPath;
- (void)reloadTabsContent;
- (void)setTabIdentifiers:(id)a3;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MCDBrowserViewController

- (BOOL)deviceAcknowledgementRequired
{
  v2 = +[ICPrivacyInfo sharedPrivacyInfo];
  unsigned __int8 v3 = [v2 privacyAcknowledgementRequiredForMusic];

  return v3;
}

- (void)_setAppropriateViewControllers
{
  if ([(MCDBrowserViewController *)self deviceAcknowledgementRequired])
  {
    unsigned __int8 v3 = +[NSBundle mainBundle];
    v4 = [v3 localizedStringForKey:@"Privacy Information" value:&stru_101023248 table:0];
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"When you’re not driving, open Music on your iPhone and review the privacy information.", &stru_101023248, 0 value table];
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Dismiss" value:&stru_101023248 table:0];
    v9 = +[CarPlayInformationView noContentWithTitle:v4 subtitle:v6 buttonText:v8 buttonAction:&stru_100FC4038];

    v10 = sub_1000ADCDC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Showing message about content restriction that should be resolved on device", v13, 2u);
    }

    id v11 = objc_alloc_init((Class)UIViewController);
    [v11 setView:v9];
    id v15 = v11;
    v12 = +[NSArray arrayWithObjects:&v15 count:1];
    [(MCDBrowserViewController *)self setViewControllers:v12 animated:0];

    [(MCDBrowserViewController *)self setNavigationBarHidden:1];
    [(MCDBrowserViewController *)self _beginObservingPrivacyInfo];
  }
  else
  {
    [(MCDBrowserViewController *)self _endObservingPrivacyInfoIfNeeded];
    tabBarController = self->_tabBarController;
    v9 = +[NSArray arrayWithObjects:&tabBarController count:1];
    [(MCDBrowserViewController *)self setViewControllers:v9 animated:0];
  }
}

- (MCDBrowserViewController)init
{
  v14.receiver = self;
  v14.super_class = (Class)MCDBrowserViewController;
  v2 = [(MCDBrowserViewController *)&v14 initWithNibName:0 bundle:0];
  if (v2)
  {
    unsigned __int8 v3 = (CARSessionStatus *)[objc_alloc((Class)CARSessionStatus) initAndWaitUntilSessionUpdated];
    carSessionStatus = v2->_carSessionStatus;
    v2->_carSessionStatus = v3;

    [(MCDBrowserViewController *)v2 setNavigationBarHidden:0];
    [(MCDBrowserViewController *)v2 setDelegate:v2];
    tabIdentifiers = v2->_tabIdentifiers;
    v2->_tabIdentifiers = (NSArray *)&__NSArray0__struct;

    uint64_t v6 = objc_opt_new();
    tabBarController = v2->_tabBarController;
    v2->_tabBarController = (MCDTabBarController *)v6;

    [(MCDTabBarController *)v2->_tabBarController setDelegate:v2];
    [(MCDBrowserViewController *)v2 _setAppropriateViewControllers];
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_mediaLibraryDidChange:" name:MPMediaLibraryDidChangeNotification object:0];
    [v8 addObserver:v2 selector:"_limitedUIChanged:" name:CARSessionLimitUserInterfacesChangedNotification object:0];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    v9 = (void *)qword_1010D6FD8;
    uint64_t v23 = qword_1010D6FD8;
    if (!qword_1010D6FD8)
    {
      id v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      v17 = sub_1000B09A0;
      v18 = &unk_100FC34A0;
      v19 = &v20;
      v10 = (void *)sub_10002A070();
      id v11 = dlsym(v10, "MCDContentItemsChangedNotification");
      *(void *)(v19[1] + 24) = v11;
      qword_1010D6FD8 = *(void *)(v19[1] + 24);
      v9 = (void *)v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v9)
    {
      v13 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v20, 8);
      _Unwind_Resume(v13);
    }
    [v8 addObserver:v2 selector:"_nowPlayingDidChangeNotification:" name:*v9 object:0];
    MRMediaRemoteRegisterForNowPlayingNotifications();
  }
  return v2;
}

- (void)dealloc
{
  [(MCDTabBarController *)self->_tabBarController setDelegate:0];
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  MRMediaRemoteUnregisterForNowPlayingNotifications();
  v4.receiver = self;
  v4.super_class = (Class)MCDBrowserViewController;
  [(MCDBrowserViewController *)&v4 dealloc];
}

- (void)_nowPlayingDidChangeNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AE110;
  block[3] = &unk_100FC3900;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCDBrowserViewController;
  [(MCDBrowserViewController *)&v4 viewDidAppear:a3];
  self->_viewHasAppeared = 1;
  [(MCDBrowserViewController *)self _updateNowPlayingVisibility];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MCDBrowserViewController;
  [(MCDBrowserViewController *)&v3 viewDidLoad];
  [(MCDBrowserViewController *)self pushNowPlaying:0];
}

- (id)_createViewControllerForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MCDBrowserViewController *)self _limitedUIEnabled];
  uint64_t v6 = sub_1000AE684();
  unsigned int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    v8 = +[MusicCarPlayApplicationCapabilitiesController sharedController];
    if (![v8 allowsRadioContent])
    {
      objc_super v14 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v9 = +[ICUserIdentityStore defaultIdentityStore];
    v10 = +[ICUserIdentity activeAccount];
    id v11 = [v9 DSIDForUserIdentity:v10 outError:0];
    id v12 = [v11 unsignedLongLongValue];

    if (v12)
    {
      v13 = +[NSBundle mainBundle];
      v8 = [v13 localizedStringForKey:@"Radio" value:&stru_101023248 table:0];

      objc_super v14 = [[MCDRadioMusicKitTableViewController alloc] initWithLimitedUI:v5];
      [(MCDRadioMusicKitTableViewController *)v14 setPlayActivityFeatureName:@"radio"];
      [(MCDRadioMusicKitTableViewController *)v14 setTitle:v8];
      id v15 = objc_alloc((Class)UITabBarItem);
      uint64_t v16 = +[UIImage tabRadio];
LABEL_14:
      uint64_t v23 = (void *)v16;
      id v24 = v15;
      goto LABEL_15;
    }
  }
  else
  {
    v17 = sub_1000AE78C();
    unsigned int v18 = [v4 isEqualToString:v17];

    if (v18)
    {
      v19 = +[NSBundle mainBundle];
      v8 = [v19 localizedStringForKey:@"Library" value:&stru_101023248 table:0];

      objc_super v14 = [[MCDBrowserTableViewController alloc] initWithLimitedUI:v5];
      [(MCDRadioMusicKitTableViewController *)v14 setTitle:v8];
      id v15 = objc_alloc((Class)UITabBarItem);
      uint64_t v16 = +[UIImage tabLibrary];
      goto LABEL_14;
    }
    uint64_t v20 = sub_1000AE894();
    unsigned int v21 = [v4 isEqualToString:v20];

    if (v21)
    {
      uint64_t v22 = +[NSBundle mainBundle];
      v8 = [v22 localizedStringForKey:@"Home" value:&stru_101023248 table:0];

      uint64_t v23 = +[UIImage tabHome];
      objc_super v14 = [[MCDForYouTableViewController alloc] initWithLimitedUI:v5];
      [(MCDRadioMusicKitTableViewController *)v14 setTitle:v8];
      id v24 = objc_alloc((Class)UITabBarItem);
LABEL_15:
      id v30 = [v24 initWithTitle:v8 image:v23 tag:0];
LABEL_16:
      v31 = v30;
      [(MCDRadioMusicKitTableViewController *)v14 setTabBarItem:v30];

      goto LABEL_17;
    }
    v25 = sub_1000AE99C();
    unsigned int v26 = [v4 isEqualToString:v25];

    if (v26)
    {
      v27 = +[NSBundle mainBundle];
      v8 = [v27 localizedStringForKey:@"Browse" value:&stru_101023248 table:0];

      if (_os_feature_enabled_impl())
      {
        v28 = +[NSBundle mainBundle];
        uint64_t v29 = [v28 localizedStringForKey:@"New" value:&stru_101023248 table:0];

        v8 = (void *)v29;
      }
      objc_super v14 = [[MCDBrowseTableViewController alloc] initWithLimitedUI:v5];
      [(MCDRadioMusicKitTableViewController *)v14 setTitle:v8];
      id v15 = objc_alloc((Class)UITabBarItem);
      uint64_t v16 = +[UIImage tabBrowse];
      goto LABEL_14;
    }
    v33 = sub_1000AEAA4();
    unsigned int v34 = [v4 isEqualToString:v33];

    if (v34)
    {
      v35 = +[NSBundle mainBundle];
      v8 = [v35 localizedStringForKey:@"Playlists" value:&stru_101023248 table:0];

      objc_super v14 = [[MCDPlaylistsViewController alloc] initWithIdentifier:v4 limitedUI:v5 showLocalContent:0];
      [(MCDRadioMusicKitTableViewController *)v14 setTitle:v8];
      id v36 = objc_alloc((Class)UITabBarItem);
      uint64_t v23 = +[UIImage playlistPlaceholder];
      id v30 = [v36 initWithTitle:v8 image:v23 selectedImage:0];
      goto LABEL_16;
    }
  }
  objc_super v14 = 0;
LABEL_18:

  return v14;
}

- (void)pushNowPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(MCDBrowserViewController *)self deviceAcknowledgementRequired])
  {
    BOOL v5 = [(MCDBrowserViewController *)self visibleViewController];
    sub_1000AEC98();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if ([(MCDBrowserViewController *)self _isNowPlayingAvailable])
      {
        id v8 = [(MCDBrowserViewController *)self currentNowPlayingViewControllerInStack];
        if (v8) {
          id v7 = [(MCDBrowserViewController *)self popToViewController:v8 animated:v3];
        }
        else {
          [(MCDBrowserViewController *)self MCD_pushNowPlayingViewControllerAnimated:v3];
        }
      }
      else
      {
        self->_shouldPushToNowPlayingOnceNowPlayingHasLoaded = 1;
      }
    }
  }
}

- (void)pushSharePlayTogetherSettings
{
  if (![(MCDBrowserViewController *)self deviceAcknowledgementRequired])
  {
    BOOL v3 = +[UIApplication sharePlayTogetherObjCViewModel];
    if (v3)
    {
      id v9 = v3;
      id v4 = [(MCDBrowserViewController *)self viewControllers];
      BOOL v5 = [v4 lastObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v7 = [(MCDBrowserViewController *)self viewControllers];
        id v8 = [v7 lastObject];

        [(MCDSharePlayTogetherSessionViewController *)v8 dismissQRCode];
      }
      else
      {
        id v8 = [[_TtC5Music41MCDSharePlayTogetherSessionViewController alloc] initWithViewModel:v9];
        [(MCDBrowserViewController *)self pushViewController:v8 animated:1];
      }

      BOOL v3 = v9;
    }
  }
}

- (void)refreshNavigationPath
{
  if ([(MCDBrowserViewController *)self isViewLoaded])
  {
    BOOL v3 = [(MCDBrowserViewController *)self viewControllers];
    unint64_t v4 = 0;
    if ([v3 count])
    {
      while (1)
      {
        BOOL v5 = [v3 objectAtIndexedSubscript:v4];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v6 = v5;
          uint64_t v7 = [v6 tableView];
          [(id)v7 reloadData];

          LOBYTE(v7) = [v6 hasRowsToDisplay];
          if ((v7 & 1) == 0) {
            break;
          }
        }
        ++v4;

        if (v4 >= (unint64_t)[v3 count]) {
          goto LABEL_8;
        }
      }
    }
LABEL_8:
    if (v4) {
      unint64_t v8 = v4 - 1;
    }
    else {
      unint64_t v8 = 0;
    }
    id v9 = [v3 objectAtIndexedSubscript:v8];
    v10 = [(MCDBrowserViewController *)self topViewController];

    if (v9 != v10) {
      id v11 = [(MCDBrowserViewController *)self popToViewController:v9 animated:1];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = [(MCDTabBarController *)self->_tabBarController viewControllers];
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v17 isViewLoaded])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unsigned int v18 = [v17 tableView];
              [v18 reloadData];
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }
}

- (void)_mediaLibraryDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AF148;
  block[3] = &unk_100FC3900;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v5 title];
  [v6 setTitle:v7];

  id v9 = +[NSUserDefaults standardUserDefaults];
  unint64_t v8 = [v5 musicTabIdentifier];

  [v9 setObject:v8 forKey:@"carLastSelectedTabIdentifier"];
}

- (BOOL)_isNowPlayingAvailable
{
  v2 = +[MusicCarPlayManager sharedManager];
  BOOL v3 = [v2 nowPlayingContentManager];
  unint64_t v4 = [v3 currentPlayingSong];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_updateNowPlayingVisibility
{
  if ([(MCDBrowserViewController *)self _isNowPlayingAvailable])
  {
    BOOL viewHasAppeared = self->_viewHasAppeared;
    tabBarController = self->_tabBarController;
    BOOL v5 = [(MCDBrowserViewController *)self nowPlayingButtonView];
    [(MCDTabBarController *)tabBarController _setAccessoryView:v5];

    if (viewHasAppeared)
    {
      if (self->_shouldPushToNowPlayingOnceNowPlayingHasLoaded)
      {
        self->_shouldPushToNowPlayingOnceNowPlayingHasLoaded = 0;
        [(MCDBrowserViewController *)self pushNowPlaying:1];
      }
      return;
    }
  }
  else
  {
    id v6 = self->_tabBarController;
    uint64_t v7 = [(MCDBrowserViewController *)self nowPlayingButtonView];
    [(MCDTabBarController *)v6 _setAccessoryView:v7];
  }

  [(MCDBrowserViewController *)self MCD_popNowPlayingViewControllerAnimated:1];
}

- (id)nowPlayingButtonView
{
  nowPlayingButtonView = self->_nowPlayingButtonView;
  if (!nowPlayingButtonView)
  {
    id v4 = objc_alloc((Class)CPUINowPlayingButtonWrapperView);
    BOOL v5 = [(MCDTabBarController *)self->_tabBarController tabBar];
    [v5 bounds];
    double Height = CGRectGetHeight(v20);
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v7 = (id *)qword_1010D7010;
    uint64_t v18 = qword_1010D7010;
    if (!qword_1010D7010)
    {
      unint64_t v8 = (void *)sub_10002A070();
      v16[3] = (uint64_t)dlsym(v8, "MCDMusicBundleIdentifier");
      qword_1010D7010 = v16[3];
      uint64_t v7 = (id *)v16[3];
    }
    _Block_object_dispose(&v15, 8);
    if (!v7)
    {
      id v14 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v15, 8);
      _Unwind_Resume(v14);
    }
    id v9 = *v7;
    v10 = [v4 initWithFrame:v9 bundleIdentifier:0.0, 0.0, 0.0, Height];
    id v11 = self->_nowPlayingButtonView;
    self->_nowPlayingButtonView = v10;

    id v12 = [(CPUINowPlayingButtonWrapperView *)self->_nowPlayingButtonView nowPlayingButton];
    [v12 addTarget:self action:"_nowPlayingButtonTouchUpInside:" forControlEvents:64];

    nowPlayingButtonView = self->_nowPlayingButtonView;
  }

  return nowPlayingButtonView;
}

- (BOOL)hasNowPlayingViewControllerBeenPushed
{
  v2 = [(MCDBrowserViewController *)self currentNowPlayingViewControllerInStack];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)currentNowPlayingViewControllerInStack
{
  BOOL v3 = [(MCDBrowserViewController *)self visibleViewController];
  sub_1000AEC98();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(MCDBrowserViewController *)self visibleViewController];
  }
  else
  {
    if ([(MCDBrowserViewController *)self _isNowPlayingAvailable])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v6 = [(MCDBrowserViewController *)self viewControllers];
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v14;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            sub_1000AEC98();
            if (objc_opt_isKindOfClass())
            {
              id v5 = v11;

              goto LABEL_15;
            }
          }
          id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
    }
    id v5 = 0;
  }
LABEL_15:

  return v5;
}

- (void)MCD_pushNowPlayingViewControllerAnimated:(BOOL)a3 fromViewController:(id)a4
{
  id v7 = (MCDBrowserViewController *)a4;
  if (![(MCDBrowserViewController *)self hasNowPlayingViewControllerBeenPushed])
  {
    id v5 = +[MCDMusicNowPlayingViewController musicNowPlayingViewController];
    if (v7) {
      id v6 = v7;
    }
    else {
      id v6 = self;
    }
    [v5 setPlayActivityFeatureNameSourceViewController:v6];
    [(MCDBrowserViewController *)self pushViewController:v5 animated:1];
  }
}

- (void)MCD_pushNowPlayingViewControllerAnimated:(BOOL)a3
{
}

- (void)MCD_popNowPlayingViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MCDBrowserViewController *)self visibleViewController];
  sub_1000AEC98();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = sub_1000ADCDC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dismissing Now Playing view", v10, 2u);
    }

    if (v3)
    {
      id v8 = +[UIApplication sharedApplication];
      if ([v8 userInterfaceLayoutDirection]) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = 2;
      }
      [(MCDBrowserViewController *)self dismissViewControllerWithTransition:v9 completion:0];
    }
    else
    {
      [(MCDBrowserViewController *)self dismissViewControllerAnimated:0 completion:0];
    }
  }
}

- (void)_nowPlayingButtonTouchUpInside:(id)a3
{
  id v4 = sub_1000ADCDC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pushing to Now Playing from button touch up inside", v5, 2u);
  }

  [(MCDBrowserViewController *)self MCD_pushNowPlayingViewControllerAnimated:1 fromViewController:self];
}

- (void)setTabIdentifiers:(id)a3
{
  id v4 = a3;
  if (qword_1010D6FC0 != -1) {
    dispatch_once(&qword_1010D6FC0, &stru_100FC4078);
  }
  id v5 = +[MusicCarPlayApplicationCapabilitiesController sharedController];
  self->_subscriptionState = (int64_t)[v5 userSubscriptionState];

  if (self->_subscriptionState >= 2uLL) {
    id v6 = (NSArray *)v4;
  }
  else {
    id v6 = (NSArray *)&off_101027640;
  }
  tabIdentifiers = self->_tabIdentifiers;
  self->_tabIdentifiers = v6;

  id v8 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = self->_tabIdentifiers;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [qword_1010D6FB0 objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * i) v20];
        if (v14) {
          [v8 addObject:v14];
        }
      }
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  if (![v8 count])
  {
    long long v15 = (void *)qword_1010D6FB8;
    long long v16 = +[NSNumber numberWithInteger:self->_subscriptionState];
    uint64_t v17 = [v15 objectForKeyedSubscript:v16];
    [v8 addObjectsFromArray:v17];
  }
  uint64_t v18 = (NSArray *)[v8 copy];
  tabVCIdentifiers = self->_tabVCIdentifiers;
  self->_tabVCIdentifiers = v18;

  [(MCDBrowserViewController *)self _reloadTabsViewControllers];
}

- (void)reloadTabsContent
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(MCDTabBarController *)self->_tabBarController viewControllers];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 isViewLoaded])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v8 = [v7 tableView];
            [v8 reloadData];
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_reloadTabsViewControllers
{
  long long v21 = +[NSMutableArray array];
  long long v20 = [(MCDTabBarController *)self->_tabBarController viewControllers];
  id v3 = +[MPMediaLibrary defaultMediaLibrary];
  self->_libraryHasSongs = [v3 hasSongs];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = self;
  obj = self->_tabVCIdentifiers;
  id v4 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v8 = v20;
        id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v23;
LABEL_8:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
            long long v14 = [0 musicTabIdentifier];
            unsigned __int8 v15 = [v14 isEqualToString:v7];

            if (v15) {
              break;
            }
            if (v10 == (id)++v12)
            {
              id v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v10) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          id v16 = v13;
          [v21 addObject:v16];

          if (!v16) {
            goto LABEL_17;
          }
          [v16 setMusicTabIdentifier:v7];
LABEL_18:
          [v21 addObject:v16];

          continue;
        }
LABEL_14:

LABEL_17:
        id v16 = [(MCDBrowserViewController *)v18 _createViewControllerForIdentifier:v7];
        [v16 setMusicTabIdentifier:v7];
        if (v16) {
          goto LABEL_18;
        }
      }
      id v5 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  [(MCDTabBarController *)v18->_tabBarController setViewControllers:v21];
  [(MCDTabBarController *)v18->_tabBarController setCustomizableViewControllers:0];
  [(MCDBrowserViewController *)v18 refreshNavigationPath];
}

- (BOOL)_limitedUIEnabled
{
  v2 = [(CARSessionStatus *)self->_carSessionStatus currentSession];
  id v3 = [v2 limitUserInterfaces];
  if ([v3 BOOLValue])
  {
    id v4 = [v2 configuration];
    unint64_t v5 = ((unint64_t)[v4 limitableUserInterfaces] >> 3) & 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_limitedUIChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B03A0;
  block[3] = &unk_100FC3900;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_removeDetailViews
{
  v2 = [(MCDBrowserViewController *)self viewControllers];
  id v3 = [v2 mutableCopy];
}

- (void)_beginObservingPrivacyInfo
{
  if (!self->_privacyObservationToken)
  {
    id v3 = +[ICPrivacyInfo sharedPrivacyInfo];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B069C;
    v6[3] = &unk_100FC40A0;
    v6[4] = self;
    id v4 = [v3 beginObservingPrivacyAcknowledgementForIdentifier:ICPrivacyIdentifierMusic handler:v6];
    id privacyObservationToken = self->_privacyObservationToken;
    self->_id privacyObservationToken = v4;
  }
}

- (void)_endObservingPrivacyInfoIfNeeded
{
  if (self->_privacyObservationToken)
  {
    id v3 = +[ICPrivacyInfo sharedPrivacyInfo];
    [v3 endObservingPrivacyAcknowledgementForIdentifier:ICPrivacyIdentifierMusic withToken:self->_privacyObservationToken];

    id privacyObservationToken = self->_privacyObservationToken;
    self->_id privacyObservationToken = 0;
  }
}

- (NSArray)tabIdentifiers
{
  return self->_tabIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabIdentifiers, 0);
  objc_storeStrong(&self->_privacyObservationToken, 0);
  objc_storeStrong((id *)&self->_tabVCIdentifiers, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_nowPlayingButtonView, 0);

  objc_storeStrong((id *)&self->_tabBarController, 0);
}

@end