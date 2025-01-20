@interface MTShowSettingsViewController
+ (id)footerText;
- (BOOL)descriptionViewIsExpanded;
- (BOOL)isSerialPodcast;
- (MTDefaultsChangeNotifier)defaultsNotifier;
- (MTOptionSetting)episodesToKeepSetting;
- (MTOptionSetting)hidesPlayedEpisodes;
- (MTOptionSetting)removePlayedDownloadsSetting;
- (MTOptionSetting)showTypeSetting;
- (MTRadioGroupDescription)showTypeRadioGroup;
- (MTSetting)downloadSetting;
- (MTSetting)notificationsSetting;
- (MTSetting)subscribedSetting;
- (MTSettingsGroup)autoDownloadsSettingsGroup;
- (MTSettingsGroup)downloadsSettingsGroup;
- (MTSettingsGroup)episodeDisplayGroup;
- (MTSettingsGroup)episodeOrderSettingsGroup;
- (MTSettingsGroup)showSettingsGroup;
- (MTShowSettingsViewController)init;
- (MTShowSettingsViewController)initWithPodcastUuid:(id)a3;
- (MTShowSettingsViewController)initWithPodcastUuid:(id)a3 delegate:(id)a4;
- (MTShowSettingsViewControllerDelegate)delegate;
- (NSString)uuid;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)autoDownloadFooterTextWithGlobalLimit;
- (id)deletePlayedText:(int64_t)a3;
- (id)headerForOnThisDevice;
- (id)metricDataSource;
- (id)metricsName;
- (id)optionsForDeletePlayedEpisodes;
- (id)optionsForHidesPlayedEpisodes;
- (id)optionsForLimitSetting;
- (id)optionsForLimitWithGlobalDefault;
- (id)settingsForDownloadsGroup;
- (id)settingsForEpisodesGroup;
- (id)settingsForShowGroup;
- (id)stringForGlobalDefaultLimit;
- (id)subscribeFooterText:(BOOL)a3;
- (void)dealloc;
- (void)podcastInfoViewDidExpand:(id)a3;
- (void)podcastInfoViewWasTapped:(id)a3;
- (void)refreshSettings;
- (void)setAutoDownloadsSettingsGroup:(id)a3;
- (void)setDefaultsNotifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionViewIsExpanded:(BOOL)a3;
- (void)setDownloadSetting:(id)a3;
- (void)setDownloadsSettingsGroup:(id)a3;
- (void)setEpisodeDisplayGroup:(id)a3;
- (void)setEpisodeOrderSettingsGroup:(id)a3;
- (void)setEpisodesToKeepSetting:(id)a3;
- (void)setHidesPlayedEpisodes:(id)a3;
- (void)setIsSerialPodcast:(BOOL)a3;
- (void)setNotificationsSetting:(id)a3;
- (void)setRemovePlayedDownloadsSetting:(id)a3;
- (void)setShowSettingsGroup:(id)a3;
- (void)setShowTypeRadioGroup:(id)a3;
- (void)setShowTypeSetting:(id)a3;
- (void)setSubscribedSetting:(id)a3;
- (void)setUuid:(id)a3;
- (void)setupView;
- (void)syncControllerOperationCompleted:(id)a3;
- (void)updateEpisodeLimit:(int64_t)a3;
- (void)updateEpisodeOrderSetting:(unint64_t)a3;
- (void)updateHidePlayedEpisodes:(int)a3;
- (void)updateNotificationSettingsToMatchSubscription:(BOOL)a3;
- (void)updateNotifications:(BOOL)a3;
- (void)updateRemovePlayedDownloads:(int64_t)a3;
- (void)updateSettings:(BOOL)a3;
- (void)updateSubscription:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTShowSettingsViewController

- (MTShowSettingsViewController)init
{
  +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", @"MTWrongInitializer", @"Use -[self init]", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (MTShowSettingsViewController)initWithPodcastUuid:(id)a3
{
  return [(MTShowSettingsViewController *)self initWithPodcastUuid:a3 delegate:0];
}

- (MTShowSettingsViewController)initWithPodcastUuid:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MTShowSettingsViewController;
  v9 = [(MTGenericSettingsViewController *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = +[MTDB sharedInstance];
    v12 = [v11 mainOrPrivateContext];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10007CB3C;
    v15[3] = &unk_10054D9B0;
    id v16 = v12;
    v17 = v10;
    id v13 = v12;
    [v13 performBlockAndWait:v15];
  }
  return v10;
}

- (void)dealloc
{
  v3 = [(MTShowSettingsViewController *)self defaultsNotifier];
  [v3 stop];

  [(MTShowSettingsViewController *)self setDefaultsNotifier:0];
  v4.receiver = self;
  v4.super_class = (Class)MTShowSettingsViewController;
  [(MTGenericSettingsViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MTShowSettingsViewController;
  [(MTGenericSettingsViewController *)&v3 viewDidLoad];
  [(MTShowSettingsViewController *)self setupView];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MTShowSettingsViewController;
  id v7 = a4;
  -[MTShowSettingsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007CD40;
  v8[3] = &unk_10054E878;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&stru_10054E8B8];
}

- (void)setupView
{
  [(MTShowSettingsViewController *)self addPodcastInfoViewHeader];
  objc_super v3 = [(MTShowSettingsViewController *)self tableView];
  [v3 setContentInset:-0.5, 0.0, 0.0, 0.0];

  objc_initWeak(&location, self);
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = sub_100056EA0;
  v86 = sub_100057228;
  id v87 = 0;
  objc_super v4 = +[MTDB sharedInstance];
  v5 = [v4 mainOrPrivateContext];

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_10007DA4C;
  v78[3] = &unk_10054DA00;
  id v79 = v5;
  v80 = self;
  v81 = &v82;
  id v65 = v79;
  [v79 performBlockAndWait:v78];
  [(MTShowSettingsViewController *)self setTitle:v83[5]];
  v92[0] = kMTPodcastDeletePlayedEpisodesDefaultKey;
  v92[1] = kMTPodcastAutoDownloadStateDefaultKey;
  v92[2] = kMTPodcastEpisodeLimitDefaultKey;
  v92[3] = MTPodcastHidesPlayedEpisodesAppWideUserDefaultsKey;
  v6 = +[NSArray arrayWithObjects:v92 count:4];
  v68 = +[NSSet setWithArray:v6];

  id v7 = [MTDefaultsChangeNotifier alloc];
  id v8 = +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults];
  objc_super v9 = [(MTDefaultsChangeNotifier *)v7 initWithProperties:v68 defaults:v8];
  [(MTShowSettingsViewController *)self setDefaultsNotifier:v9];

  v10 = [(MTShowSettingsViewController *)self defaultsNotifier];
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_10007DAD8;
  v76[3] = &unk_10054E908;
  objc_copyWeak(&v77, &location);
  [v10 addCallback:v76];

  v11 = [(MTShowSettingsViewController *)self defaultsNotifier];
  [v11 start];

  v69 = objc_alloc_init(MTSettingsController);
  v67 = objc_opt_new();
  v66 = objc_opt_new();
  v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"Following" value:&stru_10056A8A0 table:0];
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_10007DBA8;
  v75[3] = &unk_10054D710;
  v75[4] = self;
  v14 = +[MTSetting switchSettingWithTitle:v13 initialValue:0 identifier:@"subscription" changeHandler:v75];
  [(MTShowSettingsViewController *)self setSubscribedSetting:v14];

  v15 = +[NSBundle mainBundle];
  id v16 = [v15 localizedStringForKey:@"ACCOUNT_NOTIFICATIONS_TITLE" value:&stru_10056A8A0 table:0];
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_10007DBB4;
  v74[3] = &unk_10054D710;
  v74[4] = self;
  v17 = +[MTSetting switchSettingWithTitle:v16 initialValue:1 identifier:@"notifications" changeHandler:v74];
  [(MTShowSettingsViewController *)self setNotificationsSetting:v17];

  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_10007DBC0;
  v73[3] = &unk_10054E930;
  v73[4] = self;
  objc_super v18 = +[MTRadioGroupDescription radioGroupWithInitialValue:0 changeHandler:v73];
  id v19 = objc_alloc_init((Class)NSMutableArray);
  if ([(MTShowSettingsViewController *)self isSerialPodcast])
  {
    v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"SHOW_TYPE_SERIAL" value:&stru_10056A8A0 table:0];
    v22 = +[MTSetting radioOptionWithTitle:v21 radioGroup:v18 value:2 identifier:@"showTypeSerial"];

    [v19 addObject:v22];
  }
  v23 = +[NSBundle mainBundle];
  v24 = [v23 localizedStringForKey:@"SHOW_TYPE_EPISODIC" value:&stru_10056A8A0 table:0];
  v25 = +[MTSetting radioOptionWithTitle:v24 radioGroup:v18 value:1 identifier:@"showTypeEpisodic"];

  v26 = +[NSBundle mainBundle];
  v27 = [v26 localizedStringForKey:@"SHOW_TYPE_OLDEST_TO_NEWEST" value:&stru_10056A8A0 table:0];
  v28 = +[MTSetting radioOptionWithTitle:v27 radioGroup:v18 value:4 identifier:@"showTypeOldestToNewest"];

  v91[0] = v28;
  v91[1] = v25;
  v29 = +[NSArray arrayWithObjects:v91 count:2];
  [v19 addObjectsFromArray:v29];

  [(MTShowSettingsViewController *)self setShowTypeRadioGroup:v18];
  v30 = +[NSBundle mainBundle];
  v31 = [v30 localizedStringForKey:@"Episode Order" value:&stru_10056A8A0 table:0];
  v32 = +[MTSettingsGroup groupWithTitle:v31 footerText:0 settings:v19];
  [(MTShowSettingsViewController *)self setEpisodeOrderSettingsGroup:v32];

  v33 = +[NSBundle mainBundle];
  v34 = [v33 localizedStringForKey:@"SHOW_SETTINGS_HIDE_PLAYED_EPISODES_TITLE" value:&stru_10056A8A0 table:0];
  v35 = +[NSBundle mainBundle];
  v36 = [v35 localizedStringForKey:@"SHOW_SETTINGS_HIDE_PLAYED_EPISODES_TITLE" value:&stru_10056A8A0 table:0];
  v37 = +[MTShowSettingsViewController footerText];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10007DBCC;
  v72[3] = &unk_10054E930;
  v72[4] = self;
  v38 = +[MTSetting optionSettingWithTitle:v34 headerTitle:v36 footerText:v37 initialValue:0 optionDescription:0 identifier:@"hide-played-episodes" changeHandler:v72];
  [(MTShowSettingsViewController *)self setHidesPlayedEpisodes:v38];

  v39 = +[NSBundle mainBundle];
  v40 = [v39 localizedStringForKey:@"SHOW_SETTINGS_EPISODE_DISPLAY_TITLE" value:&stru_10056A8A0 table:0];
  v41 = +[MTShowSettingsViewController footerText];
  v42 = [(MTShowSettingsViewController *)self hidesPlayedEpisodes];
  v90 = v42;
  v43 = +[NSArray arrayWithObjects:&v90 count:1];
  v44 = +[MTSettingsGroup groupWithTitle:v40 footerText:v41 settings:v43];
  [(MTShowSettingsViewController *)self setEpisodeDisplayGroup:v44];

  v45 = +[NSBundle mainBundle];
  v46 = [v45 localizedStringForKey:@"REMOVE_PLAYED_DOWNLOADS" value:&stru_10056A8A0 table:0];
  v47 = +[NSBundle mainBundle];
  v48 = [v47 localizedStringForKey:@"REMOVE_PLAYED_DOWNLOADS" value:&stru_10056A8A0 table:0];
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_10007DBD8;
  v71[3] = &unk_10054E930;
  v71[4] = self;
  v49 = +[MTSetting optionSettingWithTitle:v46 headerTitle:v48 footerText:0 initialValue:0 optionDescription:0 identifier:@"remove-played-downlaods" changeHandler:v71];
  [(MTShowSettingsViewController *)self setRemovePlayedDownloadsSetting:v49];

  v50 = +[NSBundle mainBundle];
  v51 = [v50 localizedStringForKey:@"AUTOMATICALLY_DOWNLOAD" value:&stru_10056A8A0 table:0];
  v52 = +[NSBundle mainBundle];
  v53 = [v52 localizedStringForKey:@"LIMIT_EPISODES_NAVBAR" value:&stru_10056A8A0 table:0];
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_10007DBE4;
  v70[3] = &unk_10054E930;
  v70[4] = self;
  v54 = +[MTSetting optionSettingWithTitle:v51 headerTitle:v53 footerText:0 initialValue:0 optionDescription:0 identifier:@"limit-unplayed" changeHandler:v70];
  [(MTShowSettingsViewController *)self setEpisodesToKeepSetting:v54];

  v55 = [(MTShowSettingsViewController *)self settingsForDownloadsGroup];
  v56 = +[MTSettingsGroup groupWithTitle:0 footerText:0 settings:v55];
  [(MTShowSettingsViewController *)self setDownloadsSettingsGroup:v56];

  v57 = +[NSBundle mainBundle];
  v58 = [v57 localizedStringForKey:@"Downloads" value:&stru_10056A8A0 table:0];
  uint64_t v59 = [(MTShowSettingsViewController *)self episodesToKeepSetting];
  uint64_t v89 = v59;
  v60 = +[NSArray arrayWithObjects:&v89 count:1];
  v61 = +[MTSettingsGroup groupWithTitle:v58 footerText:0 settings:v60];
  [(MTShowSettingsViewController *)self setAutoDownloadsSettingsGroup:v61];

  [(MTSettingsController *)v69 setGroups:v67];
  [(MTSettingsController *)v69 setOrder:v66];
  [(MTGenericSettingsViewController *)self setSettingsController:v69];
  [(MTShowSettingsViewController *)self refreshSettings];
  v62 = [(MTShowSettingsViewController *)self subscribedSetting];
  v63 = [v62 value];
  LOBYTE(v59) = [v63 BOOLValue];

  if ((v59 & 1) == 0)
  {
    [(MTShowSettingsViewController *)self updateNotificationSettingsToMatchSubscription:0];
    v64 = [(MTShowSettingsViewController *)self tableView];
    [v64 reloadData];
  }
  objc_destroyWeak(&v77);

  _Block_object_dispose(&v82, 8);
  objc_destroyWeak(&location);
}

- (id)settingsForShowGroup
{
  objc_super v3 = [(MTShowSettingsViewController *)self subscribedSetting];
  v7[0] = v3;
  objc_super v4 = [(MTShowSettingsViewController *)self notificationsSetting];
  v7[1] = v4;
  v5 = +[NSArray arrayWithObjects:v7 count:2];

  return v5;
}

- (id)settingsForEpisodesGroup
{
  id v2 = [(MTShowSettingsViewController *)self showTypeSetting];
  v5 = v2;
  objc_super v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)settingsForDownloadsGroup
{
  id v2 = [(MTShowSettingsViewController *)self removePlayedDownloadsSetting];
  v5 = v2;
  objc_super v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (void)refreshSettings
{
  objc_super v3 = +[MTDB sharedInstance];
  objc_super v4 = [v3 mainOrPrivateContext];

  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  char v61 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  char v51 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  int v45 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10007E2A4;
  v31[3] = &unk_10054E958;
  id v5 = v4;
  id v32 = v5;
  v33 = self;
  v34 = &v66;
  v35 = &v62;
  v36 = v60;
  v37 = &v56;
  v38 = &v52;
  v39 = v50;
  v40 = &v46;
  v41 = &v42;
  [v5 performBlockAndWait:v31];
  v6 = +[NSNumber numberWithBool:*((unsigned __int8 *)v67 + 24)];
  id v7 = [(MTShowSettingsViewController *)self subscribedSetting];
  [v7 setValue:v6];

  id v8 = +[NSNumber numberWithLongLong:v53[3]];
  objc_super v9 = [(MTShowSettingsViewController *)self episodesToKeepSetting];
  [v9 setValue:v8];

  v10 = [(MTShowSettingsViewController *)self optionsForLimitWithGlobalDefault];
  v11 = [(MTShowSettingsViewController *)self episodesToKeepSetting];
  [v11 setOptions:v10];

  v12 = +[NSNumber numberWithBool:*((unsigned __int8 *)v63 + 24)];
  id v13 = [(MTShowSettingsViewController *)self notificationsSetting];
  [v13 setValue:v12];

  v14 = +[NSNumber numberWithInt:*((unsigned int *)v43 + 6)];
  v15 = [(MTShowSettingsViewController *)self hidesPlayedEpisodes];
  [v15 setValue:v14];

  id v16 = [(MTShowSettingsViewController *)self optionsForHidesPlayedEpisodes];
  v17 = [(MTShowSettingsViewController *)self hidesPlayedEpisodes];
  [v17 setOptions:v16];

  objc_super v18 = +[NSNumber numberWithLongLong:v57[3]];
  id v19 = [(MTShowSettingsViewController *)self removePlayedDownloadsSetting];
  [v19 setValue:v18];

  v20 = [(MTShowSettingsViewController *)self optionsForDeletePlayedEpisodes];
  v21 = [(MTShowSettingsViewController *)self removePlayedDownloadsSetting];
  [v21 setOptions:v20];

  v22 = [(MTShowSettingsViewController *)self deletePlayedText:v57[3]];
  v23 = [&stru_10056A8A0 stringByAppendingString:v22];

  v24 = +[MTSettingsGroup footerAttributedString:v23];
  v25 = [(MTShowSettingsViewController *)self downloadsSettingsGroup];
  [v25 setGroupFooter:v24];

  v26 = [(MTShowSettingsViewController *)self autoDownloadFooterTextWithGlobalLimit];
  v27 = [(MTShowSettingsViewController *)self autoDownloadsSettingsGroup];
  [v27 setGroupFooter:v26];

  uint64_t v28 = v47[3];
  v29 = [(MTShowSettingsViewController *)self showTypeRadioGroup];
  [v29 setValue:v28];

  [(MTShowSettingsViewController *)self updateSettings:*((unsigned __int8 *)v67 + 24)];
  v30 = [(MTShowSettingsViewController *)self tableView];
  [v30 reloadData];

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(v60, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);
}

- (void)updateSettings:(BOOL)a3
{
  BOOL v3 = a3;
  id v16 = (id)objc_opt_new();
  id v5 = objc_opt_new();
  v6 = [(MTShowSettingsViewController *)self subscribeFooterText:v3];
  id v7 = [(MTShowSettingsViewController *)self settingsForShowGroup];
  id v8 = +[MTSettingsGroup groupWithTitle:0 footerText:v6 settings:v7];
  [(MTShowSettingsViewController *)self setShowSettingsGroup:v8];

  objc_super v9 = [(MTShowSettingsViewController *)self showSettingsGroup];
  [v16 setObject:v9 forKey:@"showSettings"];

  [v5 addObject:@"showSettings"];
  if (v3)
  {
    v10 = [(MTShowSettingsViewController *)self episodeOrderSettingsGroup];
    [v16 setObject:v10 forKey:@"episodeOrderSettings"];

    [v5 addObject:@"episodeOrderSettings"];
    v11 = [(MTShowSettingsViewController *)self episodeDisplayGroup];
    [v16 setObject:v11 forKey:@"episodeDisplayGroup"];

    [v5 addObject:@"episodeDisplayGroup"];
    v12 = [(MTShowSettingsViewController *)self autoDownloadsSettingsGroup];
    [v16 setObject:v12 forKey:@"autoDownloadsSettings"];

    [v5 addObject:@"autoDownloadsSettings"];
    id v13 = [(MTShowSettingsViewController *)self downloadsSettingsGroup];
    [v16 setObject:v13 forKey:@"downloadsSettings"];

    [v5 addObject:@"downloadsSettings"];
  }
  v14 = [(MTGenericSettingsViewController *)self settingsController];
  [v14 setGroups:v16];

  v15 = [(MTGenericSettingsViewController *)self settingsController];
  [v15 setOrder:v5];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *(double *)&qword_1005F4290;
}

- (id)headerForOnThisDevice
{
  id v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3)
  {
    objc_super v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"LOCAL_DEVICE_SETTINGS_iPad" value:&stru_10056A8A0 table:0];
  }
  else
  {
    v6 = +[UIDevice currentDevice];
    objc_super v4 = [v6 model];

    id v7 = [v4 rangeOfString:@"iPhone"];
    id v8 = +[NSBundle mainBundle];
    objc_super v9 = v8;
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
      CFStringRef v10 = @"LOCAL_DEVICE_SETTINGS_iPod";
    }
    else {
      CFStringRef v10 = @"LOCAL_DEVICE_SETTINGS_iPhone";
    }
    id v5 = [v8 localizedStringForKey:v10 value:&stru_10056A8A0 table:0];
  }

  return v5;
}

- (id)subscribeFooterText:(BOOL)a3
{
  if (a3)
  {
    id v3 = [objc_alloc((Class)NSAttributedString) initWithString:&stru_10056A8A0 attributes:0];
  }
  else
  {
    objc_super v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"SETTINGS_FOOTER_UNFOLLOW" value:&stru_10056A8A0 table:0];

    id v3 = +[MTSettingsGroup footerAttributedString:v5];
  }

  return v3;
}

- (id)optionsForLimitWithGlobalDefault
{
  v29 = [(MTShowSettingsViewController *)self stringForGlobalDefaultLimit];
  v30[0] = v29;
  uint64_t v28 = +[NSBundle mainBundle];
  v27 = [v28 localizedStringForKey:@"Off" value:&stru_10056A8A0 table:0];
  v30[1] = v27;
  v26 = +[NSBundle mainBundle];
  v25 = [v26 localizedStringForKey:@"Latest Episode" value:&stru_10056A8A0 table:0];
  v30[2] = v25;
  v24 = +[NSBundle mainBundle];
  v23 = [v24 localizedStringForKey:@"2 Latest Episodes" value:&stru_10056A8A0 table:0];
  v30[3] = v23;
  v22 = +[NSBundle mainBundle];
  v21 = [v22 localizedStringForKey:@"3 Latest Episodes" value:&stru_10056A8A0 table:0];
  v30[4] = v21;
  v20 = +[NSBundle mainBundle];
  id v19 = [v20 localizedStringForKey:@"5 Latest Episodes" value:&stru_10056A8A0 table:0];
  v30[5] = v19;
  objc_super v18 = +[NSBundle mainBundle];
  v17 = [v18 localizedStringForKey:@"10 Latest Episodes" value:&stru_10056A8A0 table:0];
  v30[6] = v17;
  id v16 = +[NSBundle mainBundle];
  id v2 = [v16 localizedStringForKey:@"Last 24 Hours" value:&stru_10056A8A0 table:0];
  v30[7] = v2;
  id v3 = +[NSBundle mainBundle];
  objc_super v4 = [v3 localizedStringForKey:@"Last 7 Days" value:&stru_10056A8A0 table:0];
  v30[8] = v4;
  id v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Last 14 Days" value:&stru_10056A8A0 table:0];
  v30[9] = v6;
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"Last 30 Days" value:&stru_10056A8A0 table:0];
  v30[10] = v8;
  objc_super v9 = +[NSBundle mainBundle];
  CFStringRef v10 = [v9 localizedStringForKey:@"All New Episodes" value:&stru_10056A8A0 table:0];
  v30[11] = v10;
  v11 = +[NSArray arrayWithObjects:v30 count:12];

  v12 = +[NSOrderedSet orderedSetWithArray:&off_10057AD68];
  id v13 = [v11 mutableCopy];
  v14 = +[MTOptionsDescription optionsWithLongTitles:v11 shortTitles:v13 valueList:v12 footerTextCallback:0 headerTextCallback:&stru_10054E998];

  return v14;
}

- (id)stringForGlobalDefaultLimit
{
  id v2 = +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults];
  id v3 = (const mach_header_64 *)[v2 episodeLimitForKey:kMTPodcastEpisodeLimitDefaultKey];

  switch((unint64_t)v3)
  {
    case 0uLL:
      CFStringRef v4 = @"All New Episodes";
      break;
    case 1uLL:
      CFStringRef v4 = @"Latest Episode";
      break;
    case 2uLL:
      CFStringRef v4 = @"2 Latest Episodes";
      break;
    case 3uLL:
      CFStringRef v4 = @"3 Latest Episodes";
      break;
    case 4uLL:
      CFStringRef v4 = @"5 Latest Episodes";
      break;
    case 5uLL:
      CFStringRef v4 = @"10 Latest Episodes";
      break;
    case 6uLL:
      CFStringRef v4 = @"Last 24 Hours";
      break;
    case 7uLL:
      CFStringRef v4 = @"Last 7 Days";
      break;
    case 8uLL:
      CFStringRef v4 = @"Last 14 Days";
      break;
    case 9uLL:
      CFStringRef v4 = @"Last 30 Days";
      break;
    default:
      CFStringRef v5 = @"Default";
      if (v3 != (const mach_header_64 *)((char *)&_mh_execute_header.magic + 1)) {
        CFStringRef v5 = @"fell through";
      }
      if (v3 == &_mh_execute_header) {
        CFStringRef v4 = @"Off";
      }
      else {
        CFStringRef v4 = v5;
      }
      break;
  }
  v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"Default (%@)" value:&stru_10056A8A0 table:0];
  id v8 = +[NSBundle mainBundle];
  objc_super v9 = [v8 localizedStringForKey:v4 value:&stru_10056A8A0 table:0];
  CFStringRef v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);

  return v10;
}

- (id)optionsForLimitSetting
{
  uint64_t v48 = +[NSBundle mainBundle];
  uint64_t v46 = [v48 localizedStringForKey:@"Off" value:&stru_10056A8A0 table:0];
  v53[0] = v46;
  uint64_t v44 = +[NSBundle mainBundle];
  uint64_t v42 = [v44 localizedStringForKey:@"1 Most Recent" value:&stru_10056A8A0 table:0];
  v53[1] = v42;
  v40 = +[NSBundle mainBundle];
  v38 = [v40 localizedStringForKey:@"2 Most Recent" value:&stru_10056A8A0 table:0];
  v53[2] = v38;
  v36 = +[NSBundle mainBundle];
  v34 = [v36 localizedStringForKey:@"3 Most Recent" value:&stru_10056A8A0 table:0];
  v53[3] = v34;
  id v32 = +[NSBundle mainBundle];
  v30 = [v32 localizedStringForKey:@"5 Most Recent" value:&stru_10056A8A0 table:0];
  v53[4] = v30;
  uint64_t v28 = +[NSBundle mainBundle];
  v27 = [v28 localizedStringForKey:@"10 Most Recent" value:&stru_10056A8A0 table:0];
  v53[5] = v27;
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"1 Day" value:&stru_10056A8A0 table:0];
  v53[6] = v3;
  CFStringRef v4 = +[NSBundle mainBundle];
  CFStringRef v5 = [v4 localizedStringForKey:@"1 Week" value:&stru_10056A8A0 table:0];
  v53[7] = v5;
  v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"2 Weeks" value:&stru_10056A8A0 table:0];
  v53[8] = v7;
  id v8 = +[NSBundle mainBundle];
  objc_super v9 = [v8 localizedStringForKey:@"1 Month" value:&stru_10056A8A0 table:0];
  v53[9] = v9;
  v50 = +[NSArray arrayWithObjects:v53 count:10];

  uint64_t v49 = +[NSBundle mainBundle];
  v47 = [v49 localizedStringForKey:@"Off" value:&stru_10056A8A0 table:0];
  v52[0] = v47;
  int v45 = +[NSBundle mainBundle];
  v43 = [v45 localizedStringForKey:@"1 Next" value:&stru_10056A8A0 table:0];
  v52[1] = v43;
  v41 = +[NSBundle mainBundle];
  v39 = [v41 localizedStringForKey:@"2 Next" value:&stru_10056A8A0 table:0];
  v52[2] = v39;
  v37 = +[NSBundle mainBundle];
  v35 = [v37 localizedStringForKey:@"3 Next" value:&stru_10056A8A0 table:0];
  v52[3] = v35;
  v33 = +[NSBundle mainBundle];
  v31 = [v33 localizedStringForKey:@"5 Next" value:&stru_10056A8A0 table:0];
  v52[4] = v31;
  v29 = +[NSBundle mainBundle];
  CFStringRef v10 = [v29 localizedStringForKey:@"10 Next" value:&stru_10056A8A0 table:0];
  v52[5] = v10;
  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"1 Day" value:&stru_10056A8A0 table:0];
  v52[6] = v12;
  id v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"1 Week" value:&stru_10056A8A0 table:0];
  v52[7] = v14;
  v15 = +[NSBundle mainBundle];
  id v16 = [v15 localizedStringForKey:@"2 Weeks" value:&stru_10056A8A0 table:0];
  v52[8] = v16;
  v17 = +[NSBundle mainBundle];
  objc_super v18 = [v17 localizedStringForKey:@"1 Month" value:&stru_10056A8A0 table:0];
  v52[9] = v18;
  uint64_t v19 = +[NSArray arrayWithObjects:v52 count:10];

  v20 = (void *)v19;
  if (self->_isSerialPodcast) {
    v21 = (void *)v19;
  }
  else {
    v21 = v50;
  }
  id v22 = v21;
  id v23 = [v22 mutableCopy];
  v24 = +[NSOrderedSet orderedSetWithArray:&off_10057AD80];
  v25 = +[MTOptionsDescription optionsWithLongTitles:v22 shortTitles:v23 valueList:v24 footerTextCallback:0 headerTextCallback:&stru_10054E9B8];

  return v25;
}

- (id)optionsForDeletePlayedEpisodes
{
  v21[0] = @"PLACEHOLDER";
  id v3 = +[NSBundle mainBundle];
  CFStringRef v4 = [v3 localizedStringForKey:@"On" value:&stru_10056A8A0 table:0];
  v21[1] = v4;
  CFStringRef v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Off" value:&stru_10056A8A0 table:0];
  v21[2] = v6;
  id v7 = +[NSArray arrayWithObjects:v21 count:3];
  id v8 = [v7 mutableCopy];

  id v9 = [v8 mutableCopy];
  CFStringRef v10 = +[NSOrderedSet orderedSetWithArray:&off_10057AD98];
  v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", +[MTPodcast deletePlayedEpisodesDefaultValue]);
  id v12 = [v10 indexOfObject:v11];

  id v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"Default (%@)" value:&stru_10056A8A0 table:0];
  v15 = [v8 objectAtIndex:v12];
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);
  [v8 setObject:v16 atIndexedSubscript:0];

  v17 = [v8 objectAtIndex:v12];
  [v9 setObject:v17 atIndexedSubscript:0];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007F704;
  v20[3] = &unk_10054E9E0;
  v20[4] = self;
  objc_super v18 = +[MTOptionsDescription optionsWithLongTitles:v8 shortTitles:v9 valueList:v10 footerTextCallback:v20 headerTextCallback:0];

  return v18;
}

- (id)deletePlayedText:(int64_t)a3
{
  id v3 = (id)a3;
  if (a3 == 0xFFFFFFFFLL) {
    id v3 = +[MTPodcast deletePlayedEpisodesDefaultValue];
  }
  CFStringRef v4 = +[NSBundle mainBundle];
  CFStringRef v5 = v4;
  if (v3 == (id)1) {
    CFStringRef v6 = @"DELETE_PLAYED_FOOTER_ON";
  }
  else {
    CFStringRef v6 = @"DELETE_PLAYED_FOOTER_OFF";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_10056A8A0 table:0];

  return v7;
}

- (id)autoDownloadFooterTextWithGlobalLimit
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"CHANGE_FOR_ALL" value:&stru_10056A8A0 table:0];

  CFStringRef v4 = +[NSBundle mainBundle];
  CFStringRef v5 = [v4 localizedStringForKey:@"AUTODOWNLOAD_FOOTER_MACOS" value:&stru_10056A8A0 table:0];

  CFStringRef v6 = +[NSString stringWithValidatedFormat:v5, @"%@", 0, v3 validFormatSpecifiers error];
  id v7 = [v6 rangeOfString:v3];
  uint64_t v9 = v8;
  CFStringRef v10 = +[NSURL URLWithString:UIApplicationOpenSettingsURLString];
  v11 = +[MTSettingsGroup footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:](MTSettingsGroup, "footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:", v6, NSLinkAttributeName, v10, v7, v9);

  return v11;
}

- (id)optionsForHidesPlayedEpisodes
{
  v20[0] = @"PLACEHOLDER";
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Off" value:&stru_10056A8A0 table:0];
  v20[1] = v3;
  CFStringRef v4 = +[NSBundle mainBundle];
  CFStringRef v5 = [v4 localizedStringForKey:@"On" value:&stru_10056A8A0 table:0];
  v20[2] = v5;
  CFStringRef v6 = +[NSArray arrayWithObjects:v20 count:3];
  id v7 = [v6 mutableCopy];

  id v8 = [v7 mutableCopy];
  uint64_t v9 = +[NSOrderedSet orderedSetWithArray:&off_10057ADB0];
  if (MTPodcastHidesPlayedEpisodesAppWideSetting()) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  v11 = +[NSNumber numberWithInt:v10];
  id v12 = [v9 indexOfObject:v11];

  id v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"Default (%@)" value:&stru_10056A8A0 table:0];
  v15 = [v7 objectAtIndex:v12];
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);
  [v7 setObject:v16 atIndexedSubscript:0];

  v17 = [v7 objectAtIndex:v12];
  [v8 setObject:v17 atIndexedSubscript:0];

  objc_super v18 = +[MTOptionsDescription optionsWithLongTitles:v7 shortTitles:v8 valueList:v9 footerTextCallback:0 headerTextCallback:0];

  return v18;
}

- (void)updateEpisodeLimit:(int64_t)a3
{
  CFStringRef v5 = +[MTDB sharedInstance];
  CFStringRef v6 = [v5 mainOrPrivateContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007FCC0;
  v9[3] = &unk_10054D8F0;
  id v10 = v6;
  v11 = self;
  int64_t v12 = a3;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v9];
  id v8 = [(MTShowSettingsViewController *)self delegate];
  [v8 showSettings:self changedEpisodeLimit:a3];

  [(MTShowSettingsViewController *)self refreshSettings];
}

- (void)updateRemovePlayedDownloads:(int64_t)a3
{
  CFStringRef v5 = [(MTShowSettingsViewController *)self uuid];
  +[MTPodcast setRemovePlayedDownloadsSetting:a3 forPodcastUuid:v5];

  CFStringRef v6 = [(MTShowSettingsViewController *)self delegate];
  [v6 showSettings:self changedRemovePlayedDownloads:a3];

  [(MTShowSettingsViewController *)self refreshSettings];
}

- (void)updateSubscription:(BOOL)a3
{
  BOOL v3 = a3;
  CFStringRef v5 = +[PodcastsStateCoordinator shared];
  CFStringRef v6 = [(MTShowSettingsViewController *)self uuid];
  if (v3)
  {
    [v5 enableSubscriptionOnPodcastUUID:v6 from:3];

    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = sub_100056EA0;
    v20 = sub_100057228;
    id v21 = 0;
    id v7 = +[MTDB sharedInstance];
    id v8 = [v7 mainOrPrivateContext];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10007FFA8;
    v12[3] = &unk_10054DA00;
    id v9 = v8;
    id v13 = v9;
    v14 = self;
    v15 = &v16;
    [v9 performBlockAndWait:v12];
    id v10 = +[MTStoreReportingController sharedInstance];
    [v10 reportWithType:4 userInfo:v17[5] location:@"psst" reason:0];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    [v5 disableSubscriptionOnPodcastUUID:v6 from:3];
  }
  v11 = [(MTShowSettingsViewController *)self delegate];
  [v11 showSettings:self changedSubscribed:v3];

  [(MTShowSettingsViewController *)self updateNotificationSettingsToMatchSubscription:v3];
  [(MTShowSettingsViewController *)self refreshSettings];
}

- (void)updateNotificationSettingsToMatchSubscription:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTShowSettingsViewController *)self notificationsSetting];
  [v4 setEnabled:v3];
}

- (void)updateNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  CFStringRef v5 = +[MTDB sharedInstance];
  CFStringRef v6 = [v5 mainOrPrivateContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100080178;
  v9[3] = &unk_10054EA08;
  id v10 = v6;
  v11 = self;
  BOOL v12 = v3;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v9];
  id v8 = [(MTShowSettingsViewController *)self delegate];
  [v8 showSettings:self changedNotifications:v3];

  [(MTShowSettingsViewController *)self refreshSettings];
}

- (void)updateEpisodeOrderSetting:(unint64_t)a3
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  CFStringRef v5 = +[MTDB sharedInstance];
  CFStringRef v6 = [v5 mainOrPrivateContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100080358;
  v9[3] = &unk_10054EA30;
  id v7 = v6;
  id v10 = v7;
  v11 = self;
  BOOL v12 = &v19;
  id v13 = &v15;
  unint64_t v14 = a3;
  [v7 performBlockAndWait:v9];
  id v8 = [(MTShowSettingsViewController *)self delegate];
  [v8 showSettings:self changedShowType:v20[3]];

  if (*((unsigned char *)v16 + 24)) {
    [(MTShowSettingsViewController *)self refreshSettings];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)updateHidePlayedEpisodes:(int)a3
{
  CFStringRef v5 = +[MTDB sharedInstance];
  CFStringRef v6 = [v5 mainOrPrivateContext];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000805A0;
  v8[3] = &unk_10054EA58;
  id v9 = v6;
  id v10 = self;
  int v11 = a3;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v8];
}

- (id)metricsName
{
  return @"PodcastSettings";
}

- (id)metricDataSource
{
  BOOL v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainOrPrivateContext];

  CFStringRef v5 = [(MTShowSettingsViewController *)self uuid];
  CFStringRef v6 = [v4 podcastForUuid:v5];

  return v6;
}

- (void)podcastInfoViewDidExpand:(id)a3
{
  id v4 = a3;
  id v7 = [(MTShowSettingsViewController *)self tableView];
  [v4 frame];
  double v6 = v5;

  [v7 _tableHeaderHeightDidChangeToHeight:v6];
}

- (void)podcastInfoViewWasTapped:(id)a3
{
}

+ (id)footerText
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"SETTINGS_APP" value:&stru_10056A8A0 table:0];

  id v4 = +[NSBundle mainBundle];
  double v5 = [v4 localizedStringForKey:@"SHOW_SETTINGS_EPISODE_DISPLAY_FOOTER" value:&stru_10056A8A0 table:0];

  double v6 = +[NSString stringWithValidatedFormat:v5, @"%@", 0, v3 validFormatSpecifiers error];
  id v7 = [v6 rangeOfString:v3];
  uint64_t v9 = v8;
  id v10 = +[NSURL URLWithString:UIApplicationOpenSettingsURLString];
  int v11 = +[MTSettingsGroup footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:](MTSettingsGroup, "footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:", v6, NSLinkAttributeName, v10, v7, v9);

  return v11;
}

- (void)syncControllerOperationCompleted:(id)a3
{
  [(MTShowSettingsViewController *)self refreshSettings];
  id v4 = [(MTShowSettingsViewController *)self tableView];
  [v4 reloadData];
}

- (MTShowSettingsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTShowSettingsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)descriptionViewIsExpanded
{
  return self->_descriptionViewIsExpanded;
}

- (void)setDescriptionViewIsExpanded:(BOOL)a3
{
  self->_descriptionViewIsExpanded = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)isSerialPodcast
{
  return self->_isSerialPodcast;
}

- (void)setIsSerialPodcast:(BOOL)a3
{
  self->_isSerialPodcast = a3;
}

- (MTSettingsGroup)showSettingsGroup
{
  return self->_showSettingsGroup;
}

- (void)setShowSettingsGroup:(id)a3
{
}

- (MTSetting)subscribedSetting
{
  return self->_subscribedSetting;
}

- (void)setSubscribedSetting:(id)a3
{
}

- (MTSetting)notificationsSetting
{
  return self->_notificationsSetting;
}

- (void)setNotificationsSetting:(id)a3
{
}

- (MTSettingsGroup)episodeOrderSettingsGroup
{
  return self->_episodeOrderSettingsGroup;
}

- (void)setEpisodeOrderSettingsGroup:(id)a3
{
}

- (MTOptionSetting)showTypeSetting
{
  return self->_showTypeSetting;
}

- (void)setShowTypeSetting:(id)a3
{
}

- (MTRadioGroupDescription)showTypeRadioGroup
{
  return self->_showTypeRadioGroup;
}

- (void)setShowTypeRadioGroup:(id)a3
{
}

- (MTSettingsGroup)episodeDisplayGroup
{
  return self->_episodeDisplayGroup;
}

- (void)setEpisodeDisplayGroup:(id)a3
{
}

- (MTOptionSetting)hidesPlayedEpisodes
{
  return self->_hidesPlayedEpisodes;
}

- (void)setHidesPlayedEpisodes:(id)a3
{
}

- (MTSettingsGroup)downloadsSettingsGroup
{
  return self->_downloadsSettingsGroup;
}

- (void)setDownloadsSettingsGroup:(id)a3
{
}

- (MTSettingsGroup)autoDownloadsSettingsGroup
{
  return self->_autoDownloadsSettingsGroup;
}

- (void)setAutoDownloadsSettingsGroup:(id)a3
{
}

- (MTSetting)downloadSetting
{
  return self->_downloadSetting;
}

- (void)setDownloadSetting:(id)a3
{
}

- (MTOptionSetting)removePlayedDownloadsSetting
{
  return self->_removePlayedDownloadsSetting;
}

- (void)setRemovePlayedDownloadsSetting:(id)a3
{
}

- (MTOptionSetting)episodesToKeepSetting
{
  return self->_episodesToKeepSetting;
}

- (void)setEpisodesToKeepSetting:(id)a3
{
}

- (MTDefaultsChangeNotifier)defaultsNotifier
{
  return self->_defaultsNotifier;
}

- (void)setDefaultsNotifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsNotifier, 0);
  objc_storeStrong((id *)&self->_episodesToKeepSetting, 0);
  objc_storeStrong((id *)&self->_removePlayedDownloadsSetting, 0);
  objc_storeStrong((id *)&self->_downloadSetting, 0);
  objc_storeStrong((id *)&self->_autoDownloadsSettingsGroup, 0);
  objc_storeStrong((id *)&self->_downloadsSettingsGroup, 0);
  objc_storeStrong((id *)&self->_hidesPlayedEpisodes, 0);
  objc_storeStrong((id *)&self->_episodeDisplayGroup, 0);
  objc_storeStrong((id *)&self->_showTypeRadioGroup, 0);
  objc_storeStrong((id *)&self->_showTypeSetting, 0);
  objc_storeStrong((id *)&self->_episodeOrderSettingsGroup, 0);
  objc_storeStrong((id *)&self->_notificationsSetting, 0);
  objc_storeStrong((id *)&self->_subscribedSetting, 0);
  objc_storeStrong((id *)&self->_showSettingsGroup, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end