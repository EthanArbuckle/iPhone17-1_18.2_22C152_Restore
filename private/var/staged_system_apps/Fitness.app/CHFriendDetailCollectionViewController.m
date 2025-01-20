@interface CHFriendDetailCollectionViewController
- (BOOL)_isDataHidden;
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (BOOL)_shouldShowCompetitionAcceptAction;
- (BOOL)_shouldShowCompetitionRequestAction;
- (BOOL)_shouldShowCompetitionRulesAction;
- (BOOL)_shouldShowExerciseAndStandCells;
- (BOOL)_shouldShowMuteAction;
- (BOOL)_shouldShowStepsAndDistanceCells;
- (BOOL)_shouldShowWhileDataIsHiddenForSection:(int64_t)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (CGSize)_sizeForGoalCell:(id)a3 withPreferredWidth:(double)a4 availableWidth:(double)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CHFriendDetailCollectionViewController)init;
- (CHFriendDetailCollectionViewController)initWithFriendListManager:(id)a3 friendManager:(id)a4 friend:(id)a5 snapshot:(id)a6 snapshotDate:(id)a7 achievementsDataProvider:(id)a8 workoutDataProvider:(id)a9 workoutFormattingManager:(id)a10 formattingManager:(id)a11 badgeImageFactory:(id)a12 healthStore:(id)a13 fitnessAppContext:(id)a14;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)_fontForSectionHeaderType:(int64_t)a3;
- (id)_transformFriendAchievementsToACHAchievements;
- (id)_workoutsForFriend:(id)a3 snapshot:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_dismissContactInfo;
- (void)_friendDataWasUpdated:(id)a3;
- (void)_infoButtonTapped:(id)a3;
- (void)_logMessageComposeResult:(int64_t)a3 messageComposeViewController:(id)a4;
- (void)_populateAchievements;
- (void)_reloadData;
- (void)_sendMessageButtonTapped:(id)a3;
- (void)_setupCellSizes;
- (void)_setupCells;
- (void)_setupNumberOfItemsInSection;
- (void)_showShareOptions:(id)a3;
- (void)_updateSharingTextForMe;
- (void)achievementsView:(id)a3 didTapAchievement:(id)a4 cell:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)dealloc;
- (void)friendDetailActionListView:(id)a3 didSelectActionType:(int64_t)a4;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4;
@end

@implementation CHFriendDetailCollectionViewController

- (CHFriendDetailCollectionViewController)initWithFriendListManager:(id)a3 friendManager:(id)a4 friend:(id)a5 snapshot:(id)a6 snapshotDate:(id)a7 achievementsDataProvider:(id)a8 workoutDataProvider:(id)a9 workoutFormattingManager:(id)a10 formattingManager:(id)a11 badgeImageFactory:(id)a12 healthStore:(id)a13 fitnessAppContext:(id)a14
{
  id v56 = a3;
  id v55 = a4;
  id v54 = a5;
  id v44 = a6;
  id v19 = a6;
  id v20 = a8;
  id v53 = v19;
  id v21 = a7;
  id v52 = v20;
  id v51 = a9;
  id v50 = a10;
  v22 = v21;
  id v49 = a11;
  id v48 = a12;
  id v23 = a13;
  id v47 = a14;
  v58.receiver = self;
  v58.super_class = (Class)CHFriendDetailCollectionViewController;
  v24 = [(CHFriendDetailCollectionViewController *)&v58 init];
  v25 = v24;
  if (v24)
  {
    id v46 = v23;
    objc_storeStrong((id *)&v24->_friendListManager, a3);
    objc_storeStrong((id *)&v25->_friendManager, a4);
    p_friend = (id *)&v25->_friend;
    objc_storeStrong((id *)&v25->_friend, a5);
    objc_storeStrong((id *)&v25->_formattingManager, a11);
    objc_storeStrong((id *)&v25->_workoutFormattingManager, a10);
    objc_storeStrong((id *)&v25->_imageFactory, a12);
    objc_storeStrong((id *)&v25->_achievementsDataProvider, v20);
    p_activitySnapshot = (id *)&v25->_activitySnapshot;
    objc_storeStrong((id *)&v25->_activitySnapshot, v44);
    v28 = v22;
    if (!v22)
    {
      v28 = +[NSDate date];
    }
    objc_storeStrong((id *)&v25->_snapshotDate, v28);
    if (!v22) {

    }
    [*p_activitySnapshot snapshotIndex];
    uint64_t v29 = sub_1000F9780();
    snapshotDateComponents = v25->_snapshotDateComponents;
    v25->_snapshotDateComponents = (NSDateComponents *)v29;

    v25->_isMe = [*p_friend isMe];
    [(CHFriendDetailCollectionViewController *)v25 _populateAchievements];
    uint64_t v31 = [(CHFriendDetailCollectionViewController *)v25 _workoutsForFriend:*p_friend snapshot:*p_activitySnapshot];
    todaysFriendWorkouts = v25->_todaysFriendWorkouts;
    v25->_todaysFriendWorkouts = (NSArray *)v31;

    v25->_dataIsHidden = [(CHFriendDetailCollectionViewController *)v25 _isDataHidden];
    objc_storeStrong((id *)&v25->_workoutDataProvider, a9);
    v25->_pairedWatchSupportsCompetitions = FIDeviceMeetsMinimumOSVersionGlory();
    v33 = (_HKWheelchairUseCharacteristicCache *)[objc_alloc((Class)_HKWheelchairUseCharacteristicCache) initWithHealthStore:v46];
    wheelchairUseCharacteristicCache = v25->_wheelchairUseCharacteristicCache;
    v25->_wheelchairUseCharacteristicCache = v33;

    [(_HKWheelchairUseCharacteristicCache *)v25->_wheelchairUseCharacteristicCache addObserver:v25];
    v25->_iAmWheelchairUser = [(_HKWheelchairUseCharacteristicCache *)v25->_wheelchairUseCharacteristicCache isWheelchairUser];
    v25->_experienceType = FIExperienceTypeWithHealthStore();
    objc_storeStrong((id *)&v25->_fitnessAppContext, a14);
    v35 = (ACHAchievementLocalizationProvider *)objc_alloc_init((Class)ACHAchievementLocalizationProvider);
    achievementLocProvider = v25->_achievementLocProvider;
    v25->_achievementLocProvider = v35;

    v37 = [(FIUIFormattingManager *)v25->_formattingManager unitManager];
    v38 = v37;
    if (v37)
    {
      if ([v37 conformsToProtocol:&OBJC_PROTOCOL___ACHUnitManager])
      {
        [(ACHAchievementLocalizationProvider *)v25->_achievementLocProvider setAchUnitManager:v38];
      }
      else
      {
        ASLoggingInitialize();
        v39 = ASLogDefault;
        if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "FIUIUnitManager failed to conform to the ACHUnitManager protocol, template's canonical unit will be utilized", buf, 2u);
        }
      }
    }
    v40 = [*p_friend displayName];
    [(ACHAchievementLocalizationProvider *)v25->_achievementLocProvider setName:v40];

    if (v25->_isMe)
    {
      [(ACHAchievementLocalizationProvider *)v25->_achievementLocProvider setWheelchairUser:v25->_iAmWheelchairUser];
    }
    else
    {
      v41 = [*p_friend currentSnapshot];
      -[ACHAchievementLocalizationProvider setWheelchairUser:](v25->_achievementLocProvider, "setWheelchairUser:", [v41 wheelchairUse] == (id)2);
    }
    id v23 = v46;
  }
  return v25;
}

- (CHFriendDetailCollectionViewController)init
{
  return 0;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)CHFriendDetailCollectionViewController;
  [(CHFriendDetailCollectionViewController *)&v31 viewDidLoad];
  if (self->_isMe)
  {
    v3 = +[NSBundle mainBundle];
    v4 = [v3 localizedStringForKey:@"ME" value:&stru_1008D8AB8 table:@"Localizable"];
    v5 = +[NSString stringWithFormat:@"•%@", v4];
  }
  else
  {
    v5 = [(ASFriend *)self->_friend displayName];
  }
  v6 = [(CHFriendDetailCollectionViewController *)self navigationItem];
  [v6 setTitle:v5];

  v7 = [(CHFriendDetailCollectionViewController *)self navigationItem];
  [v7 setLargeTitleDisplayMode:2];

  [(CHFriendDetailCollectionViewController *)self setTitle:v5];
  if (self->_isMe)
  {
    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:9 target:self action:"_showShareOptions:"];
    v9 = [(CHFriendDetailCollectionViewController *)self navigationItem];
    [v9 setRightBarButtonItem:v8];

    objc_initWeak(&location, self);
    v10 = (const char *)kASGatewayStatusChangedNotificationKey;
    id v11 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100169298;
    handler[3] = &unk_1008ACE80;
    objc_copyWeak(&v29, &location);
    notify_register_dispatch(v10, &self->_activitySharingGatewayStatusChangedToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    ASLoggingInitialize();
    v12 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Registered a callback for Watch pairing changed notifications", buf, 2u);
    }
    [(CHFriendDetailCollectionViewController *)self _updateSharingTextForMe];
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    if ((id)+[CNContactStore authorizationStatusForEntityType:0] == (id)3)
    {
      v13 = +[UIButton buttonWithType:4];
      [v13 addTarget:self action:"_infoButtonTapped:" forControlEvents:64];
      id v14 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v13];
      [v8 addObject:v14];
    }
    if (+[MFMessageComposeViewController canSendText])
    {
      v15 = +[UIImage systemImageNamed:@"message"];
      id v16 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v15 style:0 target:self action:"_sendMessageButtonTapped:"];
      [v8 addObject:v16];
    }
    v17 = [(CHFriendDetailCollectionViewController *)self navigationItem];
    [v17 setRightBarButtonItems:v8];

    v18 = [(ASFriend *)self->_friend as_detailedSharingDurationString];
    sharingInfoText = self->_sharingInfoText;
    self->_sharingInfoText = v18;
  }
  id v20 = +[NSNotificationCenter defaultCenter];
  [v20 addObserver:self selector:"_friendDataWasUpdated:" name:kASFriendListChangedNotificationKey object:0];
  [(CHFriendDetailCollectionViewController *)self _setupNumberOfItemsInSection];
  [(CHFriendDetailCollectionViewController *)self _setupCells];
  [(CHFriendDetailCollectionViewController *)self _setupCellSizes];
  id v21 = (UICollectionViewFlowLayout *)objc_alloc_init((Class)UICollectionViewFlowLayout);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v21;

  [(UICollectionViewFlowLayout *)self->_collectionViewLayout setMinimumLineSpacing:0.0];
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout setMinimumInteritemSpacing:0.0];
  id v23 = [objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height collectionViewLayout:self->_collectionViewLayout];
  collectionView = self->_collectionView;
  self->_collectionView = v23;

  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  v25 = +[UIColor systemBackgroundColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v25];

  [(UICollectionView *)self->_collectionView setAllowsSelection:1];
  [(UICollectionView *)self->_collectionView setAlwaysBounceVertical:1];
  v26 = [(CHFriendDetailCollectionViewController *)self view];
  [v26 addSubview:self->_collectionView];

  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Cell"];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CHFriendDetailCollectionViewController;
  [(CHFriendDetailCollectionViewController *)&v4 viewWillLayoutSubviews];
  v3 = [(CHFriendDetailCollectionViewController *)self view];
  [v3 bounds];
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  notify_cancel(self->_activitySharingGatewayStatusChangedToken);
  v4.receiver = self;
  v4.super_class = (Class)CHFriendDetailCollectionViewController;
  [(CHFriendDetailCollectionViewController *)&v4 dealloc];
}

- (void)_updateSharingTextForMe
{
  if (FIDeviceMeetsMinimumOSVersionDaytona())
  {
    v3 = [(CHFriendManager *)self->_friendManager activitySharingClient];
    objc_super v4 = +[NSNumber numberWithLongLong:[(_HKFitnessFriendActivitySnapshot *)self->_activitySnapshot snapshotIndex]];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10016954C;
    v8[3] = &unk_1008ABE08;
    v8[4] = self;
    [v3 areMultipleDevicesSharingDataForSnapshotIndex:v4 completion:v8];
  }
  else
  {
    id v7 = +[NSBundle mainBundle];
    v5 = [v7 localizedStringForKey:@"SHARING_UPGRADE_CURRENT_WATCH" value:&stru_1008D8AB8 table:@"Localizable"];
    sharingInfoText = self->_sharingInfoText;
    self->_sharingInfoText = v5;
  }
}

- (BOOL)_isDataHidden
{
  v3 = self->_friend;
  objc_super v4 = [(_HKFitnessFriendActivitySnapshot *)self->_activitySnapshot endDate];
  snapshotDate = v4;
  if (!v4) {
    snapshotDate = self->_snapshotDate;
  }
  BOOL v6 = ([(ASFriend *)v3 isActivityDataVisibleToMeForDate:snapshotDate] & 1) == 0&& !self->_isMe;

  return v6;
}

- (void)_populateAchievements
{
  if (self->_isMe) {
    [(AAUIAchievementsDataProvider *)self->_achievementsDataProvider achievementsForDateComponents:self->_snapshotDateComponents];
  }
  else {
  v3 = [(CHFriendDetailCollectionViewController *)self _transformFriendAchievementsToACHAchievements];
  }
  todaysAchievements = self->_todaysAchievements;
  self->_todaysAchievements = v3;

  v5 = [(NSSet *)self->_todaysAchievements allObjects];
  id v6 = [v5 mutableCopy];

  AAUISortAchievementsByMostRecentEarnedDate();
  [(CHHorizontalScrollingAchievementsView *)self->_achievementsCell setAchievements:v6];
}

- (id)_transformFriendAchievementsToACHAchievements
{
  v3 = [(ASFriend *)self->_friend friendAchievements];
  v26 = self;
  objc_super v4 = +[NSNumber numberWithLongLong:[(_HKFitnessFriendActivitySnapshot *)self->_activitySnapshot snapshotIndex]];
  v5 = [v3 objectForKeyedSubscript:v4];

  if ([v5 count])
  {
    id v6 = +[NSSet set];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v25 = v5;
    id obj = v5;
    id v7 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (!v7) {
      goto LABEL_18;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v12 = [v11 templateUniqueName];
        int v13 = ASIsCompetitionVictoryTemplate();

        if (v13)
        {
          id v14 = ASEphemeralCompetitionVictoryAchievementForFriendAchievement();
          if (!v14) {
            goto LABEL_16;
          }
        }
        else
        {
          achievementsDataProvider = v26->_achievementsDataProvider;
          id v16 = [v11 templateUniqueName];
          id v14 = [(AAUIAchievementsDataProvider *)achievementsDataProvider achievementForTemplateUniqueName:v16];

          if (!v14) {
            goto LABEL_16;
          }
        }
        v17 = [v6 hk_map:&stru_1008AE040];
        v18 = [v14 template];
        id v19 = [v18 uniqueName];
        unsigned __int8 v20 = [v17 containsObject:v19];

        if (v20)
        {
          ASLoggingInitialize();
          id v21 = ASLogAchievements;
          if (os_log_type_enabled(ASLogAchievements, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Dropping duplicate achievement: %@", buf, 0xCu);
          }
        }
        else
        {
          v22 = ASEphemeralEarnedAchievementForFriendAchievement();
          uint64_t v23 = [v6 setByAddingObject:v22];

          id v6 = (id)v23;
        }

LABEL_16:
      }
      id v8 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (!v8)
      {
LABEL_18:

        v5 = v25;
        goto LABEL_20;
      }
    }
  }
  id v6 = objc_alloc_init((Class)NSSet);
LABEL_20:

  return v6;
}

- (void)_setupCells
{
  if (!self->_threeRingCell)
  {
    v3 = -[CHFriendDetailThreeRingCell initWithFrame:]([CHFriendDetailThreeRingCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    threeRingCell = self->_threeRingCell;
    self->_threeRingCell = v3;
  }
  v188 = self;
  v180 = [(_HKFitnessFriendActivitySnapshot *)self->_activitySnapshot activitySummary];
  if (self->_dataIsHidden)
  {
    [(CHFriendDetailThreeRingCell *)self->_threeRingCell setHidden:1];
    goto LABEL_11;
  }
  activitySnapshot = self->_activitySnapshot;
  if (activitySnapshot)
  {
    unsigned int v6 = [(_HKFitnessFriendActivitySnapshot *)activitySnapshot hasCarriedForwardGoals];
    id v7 = self->_threeRingCell;
    if (v6)
    {
      [(CHFriendDetailThreeRingCell *)v7 setActivitySummary:0 animated:1];
      -[CHFriendDetailThreeRingCell setIsStandalonePhoneFitnessMode:](self->_threeRingCell, "setIsStandalonePhoneFitnessMode:", [v180 _isStandalonePhoneSummary]);
      goto LABEL_11;
    }
    id v8 = v180;
  }
  else
  {
    id v7 = self->_threeRingCell;
    id v8 = 0;
  }
  [(CHFriendDetailThreeRingCell *)v7 setActivitySummary:v8 animated:1];
LABEL_11:
  if (!self->_dateCell)
  {
    uint64_t v9 = -[CHFriendDetailDateCell initWithFrame:]([CHFriendDetailDateCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    dateCell = self->_dateCell;
    self->_dateCell = v9;
  }
  uint64_t v11 = [(ASFriend *)self->_friend as_simpleHiddenFromString];
  v184 = (void *)v11;
  v12 = self;
  int v13 = self->_dateCell;
  if (!v188->_dataIsHidden || v11 == 0)
  {
    v15 = +[FIUIDateFormattingUtilities stringWithDayNameAndShortMonthFromDate:v188->_snapshotDate];
    [(CHFriendDetailDateCell *)v13 setText:v15];

    v12 = v188;
  }
  else
  {
    -[CHFriendDetailDateCell setText:](v188->_dateCell, "setText:");
  }
  competitionScoreCell = v12->_competitionScoreCell;
  if (!competitionScoreCell)
  {
    v17 = -[CHFriendDetailCompetitionScoreCell initWithFrame:]([CHFriendDetailCompetitionScoreCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v18 = v12->_competitionScoreCell;
    v12->_competitionScoreCell = v17;

    competitionScoreCell = v12->_competitionScoreCell;
  }
  id v19 = v12->_friend;
  unsigned __int8 v20 = [(ASFriend *)v19 currentCompetition];
  [(CHFriendDetailCompetitionScoreCell *)competitionScoreCell setFriend:v19 competition:v20];

  if (!v188->_competitionGraphCell)
  {
    id v21 = -[CHFriendDetailCompetitionGraphCell initWithFrame:]([CHFriendDetailCompetitionGraphCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    competitionGraphCell = v188->_competitionGraphCell;
    v188->_competitionGraphCell = v21;
  }
  uint64_t v23 = [(ASFriend *)v188->_friend currentCompetition];
  [(CHFriendDetailCompetitionGraphCell *)v188->_competitionGraphCell setCompetition:v23];

  competitionTotalWinsCell = v188->_competitionTotalWinsCell;
  if (!competitionTotalWinsCell)
  {
    v25 = -[CHFriendDetailCompetitionTotalWinsCell initWithFrame:]([CHFriendDetailCompetitionTotalWinsCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v26 = v188->_competitionTotalWinsCell;
    v188->_competitionTotalWinsCell = v25;

    competitionTotalWinsCell = v188->_competitionTotalWinsCell;
  }
  v27 = v188->_friend;
  long long v28 = [(ASFriend *)v27 currentCompetition];
  [(CHFriendDetailCompetitionTotalWinsCell *)competitionTotalWinsCell setFriend:v27 competition:v28];

  moveCell = v188->_moveCell;
  if (!moveCell)
  {
    long long v30 = -[CHFriendDetailGoalCell initWithFrame:]([CHFriendDetailGoalCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    long long v31 = v188->_moveCell;
    v188->_moveCell = v30;

    moveCell = v188->_moveCell;
  }
  v32 = +[ARUIMetricColors energyColors];
  v33 = [v32 nonGradientTextColor];
  [(CHFriendDetailGoalCell *)moveCell setKeyColor:v33];

  v34 = v188->_moveCell;
  v35 = +[NSBundle mainBundle];
  v36 = [v35 localizedStringForKey:@"MOVE" value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHFriendDetailGoalCell *)v34 setTitle:v36];

  if ([(_HKFitnessFriendActivitySnapshot *)v188->_activitySnapshot isAmm])
  {
    v37 = v188->_moveCell;
    [(_HKFitnessFriendActivitySnapshot *)v188->_activitySnapshot mmv];
    v38 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(_HKFitnessFriendActivitySnapshot *)v188->_activitySnapshot mmg];
    v39 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v40 = +[NSBundle mainBundle];
    v41 = [v40 localizedStringForKey:@"MIN" value:&stru_1008D8AB8 table:@"Localizable"];
    [(CHFriendDetailGoalCell *)v37 setCurrentValue:v38 goalValue:v39 unitString:v41];

    v42 = v188;
  }
  else
  {
    formattingManager = v188->_formattingManager;
    [(_HKFitnessFriendActivitySnapshot *)v188->_activitySnapshot energyBurned];
    -[FIUIFormattingManager energyBurnedInUserUnitForCalories:](formattingManager, "energyBurnedInUserUnitForCalories:");
    v38 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v44 = v188->_formattingManager;
    [(_HKFitnessFriendActivitySnapshot *)v188->_activitySnapshot energyBurnedGoal];
    -[FIUIFormattingManager energyBurnedInUserUnitForCalories:](v44, "energyBurnedInUserUnitForCalories:");
    v39 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v45 = [(FIUIFormattingManager *)v188->_formattingManager localizedShortActiveEnergyUnitString];
    v40 = [v45 localizedUppercaseString];

    v42 = v188;
    [(CHFriendDetailGoalCell *)v188->_moveCell setCurrentValue:v38 goalValue:v39 unitString:v40];
  }

  exerciseCell = v42->_exerciseCell;
  if (!exerciseCell)
  {
    id v47 = -[CHFriendDetailGoalCell initWithFrame:]([CHFriendDetailGoalCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v48 = v42->_exerciseCell;
    v42->_exerciseCell = v47;

    exerciseCell = v42->_exerciseCell;
  }
  id v49 = +[ARUIMetricColors briskColors];
  id v50 = [v49 nonGradientTextColor];
  [(CHFriendDetailGoalCell *)exerciseCell setKeyColor:v50];

  id v51 = v188->_exerciseCell;
  id v52 = +[NSBundle mainBundle];
  id v53 = [v52 localizedStringForKey:@"EXERCISE" value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHFriendDetailGoalCell *)v51 setTitle:v53];

  id v54 = v188->_exerciseCell;
  [(_HKFitnessFriendActivitySnapshot *)v188->_activitySnapshot briskMinutes];
  id v55 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(_HKFitnessFriendActivitySnapshot *)v188->_activitySnapshot briskMinutesGoal];
  id v56 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v57 = +[NSBundle mainBundle];
  objc_super v58 = [v57 localizedStringForKey:@"MIN" value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHFriendDetailGoalCell *)v54 setCurrentValue:v55 goalValue:v56 unitString:v58];

  if (v188->_isMe)
  {
    uint64_t iAmWheelchairUser = v188->_iAmWheelchairUser;
  }
  else
  {
    [(_HKFitnessFriendActivitySnapshot *)v188->_activitySnapshot wheelchairUse];
    uint64_t iAmWheelchairUser = FIUIIsWheelchairUserForWheelchairUse();
  }
  v60 = @"_WHEELCHAIR";
  if (!iAmWheelchairUser) {
    v60 = &stru_1008D8AB8;
  }
  v185 = v60;
  standCell = v188->_standCell;
  if (!standCell)
  {
    v62 = -[CHFriendDetailGoalCell initWithFrame:]([CHFriendDetailGoalCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v63 = v188->_standCell;
    v188->_standCell = v62;

    standCell = v188->_standCell;
  }
  v64 = +[ARUIMetricColors sedentaryColors];
  v65 = [v64 nonGradientTextColor];
  [(CHFriendDetailGoalCell *)standCell setKeyColor:v65];

  v66 = v188->_standCell;
  v67 = +[NSBundle mainBundle];
  v68 = [@"STAND" stringByAppendingString:v185];
  v69 = [v67 localizedStringForKey:v68 value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHFriendDetailGoalCell *)v66 setTitle:v69];

  v70 = v188->_standCell;
  [(_HKFitnessFriendActivitySnapshot *)v188->_activitySnapshot activeHours];
  v71 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(_HKFitnessFriendActivitySnapshot *)v188->_activitySnapshot activeHoursGoal];
  v72 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v73 = +[NSBundle mainBundle];
  v74 = [v73 localizedStringForKey:@"HRS" value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHFriendDetailGoalCell *)v70 setCurrentValue:v71 goalValue:v72 unitString:v74];

  stepCell = v188->_stepCell;
  if (!stepCell)
  {
    v76 = -[CHFriendDetailGoalCell initWithFrame:]([CHFriendDetailGoalCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v77 = v188->_stepCell;
    v188->_stepCell = v76;

    stepCell = v188->_stepCell;
  }
  v78 = +[UIColor lightGrayColor];
  [(CHFriendDetailGoalCell *)stepCell setKeyColor:v78];

  v79 = v188->_stepCell;
  v80 = +[NSBundle mainBundle];
  v81 = [@"STEPS_LABEL" stringByAppendingString:v185];
  v82 = [v80 localizedStringForKey:v81 value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHFriendDetailGoalCell *)v79 setTitle:v82];

  v83 = v188->_stepCell;
  v84 = v188->_activitySnapshot;
  if (iAmWheelchairUser) {
    [(_HKFitnessFriendActivitySnapshot *)v84 pushCount];
  }
  else {
    [(_HKFitnessFriendActivitySnapshot *)v84 stepCount];
  }
  v85 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(CHFriendDetailGoalCell *)v83 setCurrentValue:v85];

  distanceCell = v188->_distanceCell;
  if (!distanceCell)
  {
    v87 = -[CHFriendDetailGoalCell initWithFrame:]([CHFriendDetailGoalCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v88 = v188->_distanceCell;
    v188->_distanceCell = v87;

    distanceCell = v188->_distanceCell;
  }
  v89 = +[UIColor lightGrayColor];
  [(CHFriendDetailGoalCell *)distanceCell setKeyColor:v89];

  v90 = v188->_distanceCell;
  v91 = +[NSBundle mainBundle];
  v92 = [v91 localizedStringForKey:@"DISTANCE_LABEL" value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHFriendDetailGoalCell *)v90 setTitle:v92];

  v93 = [(FIUIFormattingManager *)v188->_formattingManager unitManager];
  [(_HKFitnessFriendActivitySnapshot *)v188->_activitySnapshot walkingAndRunningDistance];
  [v93 distanceInUserDistanceUnitForDistanceInMeters:1 distanceType:];
  v183 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  v94 = [(FIUIFormattingManager *)v188->_formattingManager localizedShortUnitStringForDistanceType:1];
  v182 = [v94 localizedUppercaseString];

  [(CHFriendDetailGoalCell *)v188->_distanceCell setCurrentValue:v183 unitString:v182];
  [(CHFriendDetailGoalCell *)v188->_distanceCell setHidden:iAmWheelchairUser];
  v95 = v188;
  v96 = v188->_todaysFriendWorkouts;
  v97 = v96;
  if (v188->_isMe)
  {
    long long v198 = 0u;
    long long v199 = 0u;
    long long v197 = 0u;
    long long v196 = 0u;
    v98 = v96;
    id v99 = [(NSArray *)v98 countByEnumeratingWithState:&v196 objects:v214 count:16];
    if (v99)
    {
      uint64_t v100 = *(void *)v197;
      do
      {
        for (i = 0; i != v99; i = (char *)i + 1)
        {
          if (*(void *)v197 != v100) {
            objc_enumerationMutation(v98);
          }
          v102 = *(void **)(*((void *)&v196 + 1) + 8 * i);
          workoutDataProvider = v188->_workoutDataProvider;
          v104 = [v102 UUID];
          [v102 setIsWatchWorkout:[workoutDataProvider isWatchWorkout:v104]];
        }
        id v99 = [(NSArray *)v98 countByEnumeratingWithState:&v196 objects:v214 count:16];
      }
      while (v99);
    }

    v95 = v188;
  }
  objc_initWeak(&location, v95);
  v105 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](v97, "count")];
  workoutCellsArradouble y = v188->_workoutCellsArray;
  v188->_workoutCellsArradouble y = v105;

  long long v193 = 0u;
  long long v194 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  id obj = v97;
  id v107 = [(NSArray *)obj countByEnumeratingWithState:&v191 objects:v213 count:16];
  if (v107)
  {
    uint64_t v108 = *(void *)v192;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    do
    {
      for (j = 0; j != v107; j = (char *)j + 1)
      {
        if (*(void *)v192 != v108) {
          objc_enumerationMutation(obj);
        }
        v113 = [*(id *)(*((void *)&v191 + 1) + 8 * (void)j) hkWorkoutFromFriendWorkout];
        v114 = -[CHWorkoutCellImageLabelView initWithFrame:]([CHWorkoutCellImageLabelView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
        fitnessAppContext = v188->_fitnessAppContext;
        workoutFormattingManager = v188->_workoutFormattingManager;
        v189[0] = _NSConcreteStackBlock;
        v189[1] = 3221225472;
        v189[2] = sub_10016B3B4;
        v189[3] = &unk_1008AB8D8;
        objc_copyWeak(&v190, &location);
        [(CHWorkoutCellImageLabelView *)v114 setWorkout:v113 fitnessAppContext:fitnessAppContext formattingManager:workoutFormattingManager achievementCount:0 completion:v189];
        [(CHWorkoutCellImageLabelView *)v114 setShowsSeparator:1];
        [(NSMutableArray *)v188->_workoutCellsArray addObject:v114];
        objc_destroyWeak(&v190);
      }
      id v107 = [(NSArray *)obj countByEnumeratingWithState:&v191 objects:v213 count:16];
    }
    while (v107);
  }

  v117 = [(NSMutableArray *)v188->_workoutCellsArray lastObject];
  [v117 setShowsSeparator:0];

  v118 = [CHHorizontalScrollingAchievementsView alloc];
  double v119 = CGRectZero.origin.y;
  double v120 = CGRectZero.size.width;
  double v121 = CGRectZero.size.height;
  v122 = -[CHHorizontalScrollingAchievementsView initWithFrame:badgeImageFactory:locProvider:](v118, "initWithFrame:badgeImageFactory:locProvider:", v188->_imageFactory, v188->_achievementLocProvider, CGRectZero.origin.x, v119, v120, v121);
  achievementsCell = v188->_achievementsCell;
  v188->_achievementsCell = v122;

  [(CHHorizontalScrollingAchievementsView *)v188->_achievementsCell setDelegate:v188];
  -[CHHorizontalScrollingAchievementsView setScrollViewContentInset:](v188->_achievementsCell, "setScrollViewContentInset:", 0.0, 16.0, 0.0, 16.0);
  v124 = [(NSSet *)v188->_todaysAchievements allObjects];
  [(CHHorizontalScrollingAchievementsView *)v188->_achievementsCell setAchievements:v124];

  v125 = v188;
  id v126 = objc_alloc_init((Class)NSMutableAttributedString);
  if (v188->_sharingInfoText)
  {
    id v127 = objc_alloc((Class)NSAttributedString);
    sharingInfoText = v188->_sharingInfoText;
    v211[0] = NSFontAttributeName;
    v129 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    v212[0] = v129;
    v211[1] = NSForegroundColorAttributeName;
    v130 = +[UIColor secondaryLabelColor];
    v212[1] = v130;
    v131 = +[NSDictionary dictionaryWithObjects:v212 forKeys:v211 count:2];
    id v132 = [v127 initWithString:sharingInfoText attributes:v131];
    [v126 appendAttributedString:v132];

    v125 = v188;
  }
  if (([(ASFriend *)v125->_friend hasPendingCompetitionRequestFromMe] & 1) != 0|| [(ASFriend *)v125->_friend isCompetitionActive])
  {
    v133 = [(ASFriend *)v125->_friend as_competitionStatusBreadcrumbStringForExperienceType:v125->_experienceType];
    v134 = +[NSString stringWithFormat:@"\n%@", v133];
    id v135 = objc_alloc((Class)NSAttributedString);
    v209[0] = NSFontAttributeName;
    v136 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    v210[0] = v136;
    v209[1] = NSForegroundColorAttributeName;
    v137 = +[UIColor as_darkCompetitionGold];
    v210[1] = v137;
    v138 = +[NSDictionary dictionaryWithObjects:v210 forKeys:v209 count:2];
    id v139 = [v135 initWithString:v134 attributes:v138];
    [v126 appendAttributedString:v139];

    v125 = v188;
  }
  id v140 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, v119, v120, v121];
  p_sharingInfoSizingLabel = (id *)&v125->_sharingInfoSizingLabel;
  id v142 = *p_sharingInfoSizingLabel;
  id *p_sharingInfoSizingLabel = v140;

  [*p_sharingInfoSizingLabel setAttributedText:v126];
  p_isa = (id *)&v188->super.super.super.isa;
  [(UILabel *)v188->_sharingInfoSizingLabel setNumberOfLines:0];
  id v144 = objc_alloc_init((Class)NSMutableArray);
  id v145 = objc_alloc_init((Class)NSMutableArray);
  if ([(CHFriendDetailCollectionViewController *)v188 _shouldShowCompetitionRequestAction])
  {
    v146 = +[NSBundle mainBundle];
    v147 = [v146 localizedStringForKey:@"COMPETITION_SEND_ACTION_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
    v148 = [(ASFriend *)v188->_friend displayName];
    v149 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v147, v148);

    [v144 addObject:&off_1008DE868];
    [v145 addObject:v149];
  }
  else if ([(CHFriendDetailCollectionViewController *)v188 _shouldShowCompetitionAcceptAction])
  {
    v150 = +[NSBundle mainBundle];
    v149 = [v150 localizedStringForKey:@"COMPETITION_ACCEPT_ACTION_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];

    [v144 addObject:&off_1008DE880];
    [v145 addObject:v149];
  }
  else
  {
    if (![(CHFriendDetailCollectionViewController *)v188 _shouldShowCompetitionRulesAction])goto LABEL_74; {
    v149 = [(ASFriend *)v188->_friend as_competitionLearnMoreDetailActionForExperienceType:v188->_experienceType];
    }
    [v144 addObject:&off_1008DE898];
    [v145 addObject:v149];
  }

  p_isa = (id *)&v188->super.super.super.isa;
LABEL_74:
  if ([p_isa _shouldShowMuteAction])
  {
    if ([p_isa[4] isMuted])
    {
      v151 = ActivitySharingBundle();
      [v151 localizedStringForKey:@"UNMUTE_NOTIFICATIONS" value:&stru_1008D8AB8 table:@"Localizable"];
    }
    else
    {
      v151 = ActivitySharingBundle();
      [v151 localizedStringForKey:@"MUTE_NOTIFICATIONS" value:&stru_1008D8AB8 table:@"Localizable"];
    v152 = };

    [v144 addObject:&off_1008DE8B0];
    [v145 addObject:v152];

    p_isa = (id *)&v188->super.super.super.isa;
  }
  if ([p_isa[4] canSeeMyActivityData])
  {
    v153 = ActivitySharingBundle();
    [v153 localizedStringForKey:@"HIDE_MY_ACTIVITY" value:&stru_1008D8AB8 table:@"Localizable"];
  }
  else
  {
    v153 = ActivitySharingBundle();
    [v153 localizedStringForKey:@"SHOW_MY_ACTIVITY" value:&stru_1008D8AB8 table:@"Localizable"];
  v186 = };

  [v144 addObject:&off_1008DE8C8];
  [v145 addObject:v186];
  v154 = ActivitySharingBundle();
  v181 = [v154 localizedStringForKey:@"REMOVE_FRIEND" value:&stru_1008D8AB8 table:@"Localizable"];

  [v144 addObject:&off_1008DE8E0];
  [v145 addObject:v181];
  v155 = -[CHFriendDetailActionListView initWithFrame:]([CHFriendDetailActionListView alloc], "initWithFrame:", CGRectZero.origin.x, v119, v120, v121);
  actionListCell = v188->_actionListCell;
  v188->_actionListCell = v155;

  [(CHFriendDetailActionListView *)v188->_actionListCell setDelegate:v188];
  [(CHFriendDetailActionListView *)v188->_actionListCell configureWithActionTypes:v144 labelTexts:v145 footerText:v126];
  v157 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:10];
  itemsArradouble y = v188->_itemsArray;
  v188->_itemsArradouble y = v157;

  v159 = v188->_itemsArray;
  v160 = v188->_dateCell;
  v208[0] = v188->_threeRingCell;
  v208[1] = v160;
  v161 = +[NSArray arrayWithObjects:v208 count:2];
  [(NSMutableArray *)v159 addObject:v161];

  v162 = v188->_itemsArray;
  v207 = v188->_competitionScoreCell;
  v163 = +[NSArray arrayWithObjects:&v207 count:1];
  [(NSMutableArray *)v162 addObject:v163];

  v164 = v188->_itemsArray;
  v206 = v188->_competitionGraphCell;
  v165 = +[NSArray arrayWithObjects:&v206 count:1];
  [(NSMutableArray *)v164 addObject:v165];

  v166 = v188->_itemsArray;
  v205 = v188->_competitionTotalWinsCell;
  v167 = +[NSArray arrayWithObjects:&v205 count:1];
  [(NSMutableArray *)v166 addObject:v167];

  v168 = v188->_itemsArray;
  v204 = v188->_moveCell;
  v169 = +[NSArray arrayWithObjects:&v204 count:1];
  [(NSMutableArray *)v168 addObject:v169];

  v170 = v188->_itemsArray;
  v171 = v188->_standCell;
  v203[0] = v188->_exerciseCell;
  v203[1] = v171;
  v172 = +[NSArray arrayWithObjects:v203 count:2];
  [(NSMutableArray *)v170 addObject:v172];

  v173 = v188->_itemsArray;
  v174 = v188->_distanceCell;
  v202[0] = v188->_stepCell;
  v202[1] = v174;
  v175 = +[NSArray arrayWithObjects:v202 count:2];
  [(NSMutableArray *)v173 addObject:v175];

  [(NSMutableArray *)v188->_itemsArray addObject:v188->_workoutCellsArray];
  v176 = v188->_itemsArray;
  v201 = v188->_achievementsCell;
  v177 = +[NSArray arrayWithObjects:&v201 count:1];
  [(NSMutableArray *)v176 addObject:v177];

  v178 = v188->_itemsArray;
  v200 = v188->_actionListCell;
  v179 = +[NSArray arrayWithObjects:&v200 count:1];
  [(NSMutableArray *)v178 addObject:v179];

  objc_destroyWeak(&location);
}

- (void)_setupNumberOfItemsInSection
{
  v3 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:10];
  numItemsInSectionArradouble y = self->_numItemsInSectionArray;
  self->_numItemsInSectionArradouble y = v3;

  [(NSMutableArray *)self->_numItemsInSectionArray addObject:&off_1008DE8F8];
  unsigned int v5 = [(ASFriend *)self->_friend isCompetitionActive];
  unsigned int v6 = self->_numItemsInSectionArray;
  id v7 = +[NSNumber numberWithUnsignedInteger:v5];
  [(NSMutableArray *)v6 addObject:v7];

  unsigned int v8 = [(ASFriend *)self->_friend isCompetitionActive];
  uint64_t v9 = self->_numItemsInSectionArray;
  v10 = +[NSNumber numberWithUnsignedInteger:v8];
  [(NSMutableArray *)v9 addObject:v10];

  if ([(ASFriend *)self->_friend isCompetitionActive]) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = [(ASFriend *)self->_friend hasCompetitionHistory];
  }
  v12 = self->_numItemsInSectionArray;
  int v13 = +[NSNumber numberWithUnsignedInteger:v11];
  [(NSMutableArray *)v12 addObject:v13];

  [(NSMutableArray *)self->_numItemsInSectionArray addObject:&off_1008DE910];
  if ([(CHFriendDetailCollectionViewController *)self _shouldShowExerciseAndStandCells])
  {
    uint64_t v14 = 2;
  }
  else
  {
    uint64_t v14 = 0;
  }
  v15 = self->_numItemsInSectionArray;
  id v16 = +[NSNumber numberWithInteger:v14];
  [(NSMutableArray *)v15 addObject:v16];

  if ([(CHFriendDetailCollectionViewController *)self _shouldShowStepsAndDistanceCells])
  {
    uint64_t v17 = 2;
  }
  else
  {
    uint64_t v17 = 0;
  }
  v18 = self->_numItemsInSectionArray;
  id v19 = +[NSNumber numberWithInteger:v17];
  [(NSMutableArray *)v18 addObject:v19];

  unsigned __int8 v20 = self->_numItemsInSectionArray;
  id v21 = +[NSNumber numberWithUnsignedInteger:[(NSArray *)self->_todaysFriendWorkouts count]];
  [(NSMutableArray *)v20 addObject:v21];

  BOOL v22 = [(NSSet *)self->_todaysAchievements count] != 0;
  uint64_t v23 = self->_numItemsInSectionArray;
  v24 = +[NSNumber numberWithInteger:v22];
  [(NSMutableArray *)v23 addObject:v24];

  BOOL v25 = !self->_isMe;
  v26 = self->_numItemsInSectionArray;
  id v27 = +[NSNumber numberWithInteger:v25];
  [(NSMutableArray *)v26 addObject:v27];
}

- (void)_setupCellSizes
{
  v3 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:10];
  sizesArradouble y = self->_sizesArray;
  self->_sizesArradouble y = v3;

  unsigned int v5 = [(CHFriendDetailCollectionViewController *)self view];
  [v5 bounds];
  double v7 = v6;

  unsigned int v8 = [(CHFriendDetailCollectionViewController *)self view];
  UIFloorToViewScale();
  double v10 = v9;

  [(CHFriendDetailThreeRingCell *)self->_threeRingCell preferredWidth];
  double v12 = v11;
  [(CHFriendDetailThreeRingCell *)self->_threeRingCell preferredHeight];
  double v14 = v13;
  uint64_t v15 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v12, v13);
  [(CHFriendDetailThreeRingCell *)self->_threeRingCell preferredWidth];
  uint64_t v17 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7 - v16, v14);
  v18 = self->_sizesArray;
  v90 = (void *)v17;
  v91 = (void *)v15;
  v105[0] = v15;
  v105[1] = v17;
  id v19 = +[NSArray arrayWithObjects:v105 count:2];
  [(NSMutableArray *)v18 addObject:v19];

  [(CHFriendDetailCompetitionScoreCell *)self->_competitionScoreCell preferredHeightForFriend:self->_friend];
  uint64_t v21 = +[NSValue valueWithSize:](NSValue, "valueWithSize:", v7 - (16.0 + 16.0), v20);
  BOOL v22 = self->_sizesArray;
  v89 = (void *)v21;
  uint64_t v104 = v21;
  uint64_t v23 = +[NSArray arrayWithObjects:&v104 count:1];
  [(NSMutableArray *)v22 addObject:v23];

  [(CHFriendDetailCompetitionGraphCell *)self->_competitionGraphCell preferredHeight];
  uint64_t v25 = +[NSValue valueWithSize:](NSValue, "valueWithSize:", v7 - (16.0 + 16.0), v24);
  v26 = self->_sizesArray;
  v88 = (void *)v25;
  uint64_t v103 = v25;
  id v27 = +[NSArray arrayWithObjects:&v103 count:1];
  [(NSMutableArray *)v26 addObject:v27];

  [(CHFriendDetailCompetitionTotalWinsCell *)self->_competitionTotalWinsCell preferredHeightForFriend:self->_friend];
  uint64_t v29 = +[NSValue valueWithSize:](NSValue, "valueWithSize:", v7 - (16.0 + 16.0), v28);
  long long v30 = self->_sizesArray;
  v87 = (void *)v29;
  uint64_t v102 = v29;
  long long v31 = +[NSArray arrayWithObjects:&v102 count:1];
  [(NSMutableArray *)v30 addObject:v31];

  +[CHFriendDetailGoalCell preferredHeight];
  uint64_t v33 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7 - (16.0 + 16.0), v32);
  v34 = self->_sizesArray;
  v86 = (void *)v33;
  uint64_t v101 = v33;
  v35 = +[NSArray arrayWithObjects:&v101 count:1];
  [(NSMutableArray *)v34 addObject:v35];

  [(CHFriendDetailCollectionViewController *)self _sizeForGoalCell:self->_exerciseCell withPreferredWidth:v10 availableWidth:v7 - (16.0 + 16.0)];
  double v37 = v36;
  double v39 = v38;
  uint64_t v40 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:");
  uint64_t v41 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v37, v39);
  v42 = self->_sizesArray;
  v84 = (void *)v41;
  v85 = (void *)v40;
  v100[0] = v40;
  v100[1] = v41;
  v43 = +[NSArray arrayWithObjects:v100 count:2];
  [(NSMutableArray *)v42 addObject:v43];

  [(CHFriendDetailCollectionViewController *)self _sizeForGoalCell:self->_stepCell withPreferredWidth:v10 availableWidth:v7 - (16.0 + 16.0)];
  double v45 = v44;
  double v47 = v46;
  [(CHFriendDetailCollectionViewController *)self _sizeForGoalCell:self->_distanceCell withPreferredWidth:v10 availableWidth:v7 - (16.0 + 16.0)];
  double v49 = v48;
  double v51 = v50;
  uint64_t v52 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v45, v47);
  uint64_t v53 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v49, v51);
  id v54 = self->_sizesArray;
  v82 = (void *)v53;
  v83 = (void *)v52;
  v99[0] = v52;
  v99[1] = v53;
  id v55 = +[NSArray arrayWithObjects:v99 count:2];
  [(NSMutableArray *)v54 addObject:v55];

  id v56 = [(NSMutableArray *)self->_workoutCellsArray copy];
  id v57 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v56 count]];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v58 = v56;
  id v59 = [v58 countByEnumeratingWithState:&v92 objects:v98 count:16];
  if (v59)
  {
    id v60 = v59;
    uint64_t v61 = *(void *)v93;
    do
    {
      v62 = 0;
      do
      {
        if (*(void *)v93 != v61) {
          objc_enumerationMutation(v58);
        }
        [*(id *)(*((void *)&v92 + 1) + 8 * (void)v62) preferredHeightForWidth:v7 - (16.0 + 16.0)];
        v64 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7 - (16.0 + 16.0), v63);
        [v57 addObject:v64];

        v62 = (char *)v62 + 1;
      }
      while (v60 != v62);
      id v60 = [v58 countByEnumeratingWithState:&v92 objects:v98 count:16];
    }
    while (v60);
  }

  [(NSMutableArray *)self->_sizesArray addObject:v57];
  v65 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7, 70.0);
  v66 = self->_sizesArray;
  v97 = v65;
  v67 = +[NSArray arrayWithObjects:&v97 count:1];
  [(NSMutableArray *)v66 addObject:v67];

  v68 = [(UILabel *)self->_sharingInfoSizingLabel text];

  if (v68)
  {
    v69 = [(CHFriendDetailCollectionViewController *)self view];
    [v69 valueForSmallWidth:32.0 mediumWidth:40.0 largeWidth:40.0];
    double v71 = v70;

    -[UILabel sizeThatFits:](self->_sharingInfoSizingLabel, "sizeThatFits:", v7 - v71 * 2.0, 1.79769313e308);
    double v73 = v72;
    v74 = [(UILabel *)self->_sharingInfoSizingLabel font];
    [v74 _scaledValueForValue:12.0];
    double v76 = v75;

    double v77 = v73 + v76 * 2.0;
  }
  else
  {
    double v77 = 0.0;
  }
  +[CHFriendDetailActionCell preferredCellHeight];
  v79 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7, v77 + v78 * (double)[(CHFriendDetailActionListView *)self->_actionListCell actionCount] + 35.0);
  v80 = self->_sizesArray;
  v96 = v79;
  v81 = +[NSArray arrayWithObjects:&v96 count:1];
  [(NSMutableArray *)v80 addObject:v81];
}

- (CGSize)_sizeForGoalCell:(id)a3 withPreferredWidth:(double)a4 availableWidth:(double)a5
{
  id v7 = a3;
  [v7 sizeThatFits:a5, 1.79769313e308];
  if (v8 <= a4) {
    a5 = a4;
  }
  double v9 = objc_opt_class();

  [v9 preferredHeight];
  double v11 = v10;
  double v12 = a5;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (id)_fontForSectionHeaderType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) < 9 || a3 == 0)
  {
    v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  }
  else if (a3 == 1)
  {
    double v6 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    id v7 = [v6 fontDescriptorWithSymbolicTraits:0x8000];

    v3 = +[UIFont fontWithDescriptor:v7 size:0.0];
  }

  return v3;
}

- (void)_reloadData
{
  [(CHFriendDetailCollectionViewController *)self _setupNumberOfItemsInSection];
  [(CHFriendDetailCollectionViewController *)self _setupCells];
  [(CHFriendDetailCollectionViewController *)self _setupCellSizes];
  collectionView = self->_collectionView;

  [(UICollectionView *)collectionView reloadData];
}

- (void)_infoButtonTapped:(id)a3
{
  objc_super v4 = [(ASFriend *)self->_friend contact];
  unsigned int v5 = [v4 linkedContactStoreIdentifier];

  if (v5)
  {
    id v6 = objc_alloc_init((Class)CNContactStore);
    id v7 = [(ASFriend *)self->_friend contact];
    double v8 = [v7 linkedContactStoreIdentifier];
    double v9 = +[CNContactViewController descriptorForRequiredKeys];
    v21[2] = v9;
    double v10 = +[NSArray arrayWithObjects:v21 count:3];
    double v11 = [v6 unifiedContactWithIdentifier:v8 keysToFetch:v10 error:0];

    double v12 = +[CNContactViewController viewControllerForContact:v11];
  }
  else
  {
    double v13 = [(ASFriend *)self->_friend contact];
    id v6 = [v13 primaryDestinationForMessaging];

    double v14 = +[CNContact contactWithDisplayName:0 emailOrPhoneNumber:v6];
    double v12 = +[CNContactViewController viewControllerForUnknownContact:v14];
  }
  [v12 setDelegate:self];
  id v15 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_dismissContactInfo"];
  double v16 = [v12 navigationItem];
  [v16 setLeftBarButtonItem:v15];

  uint64_t v17 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v12];
  contactNavigationController = self->_contactNavigationController;
  self->_contactNavigationController = v17;

  id v19 = +[UIColor systemBlueColor];
  double v20 = [(UINavigationController *)self->_contactNavigationController view];
  [v20 setTintColor:v19];

  [(CHFriendDetailCollectionViewController *)self presentViewController:self->_contactNavigationController animated:1 completion:0];
}

- (void)_dismissContactInfo
{
}

- (void)_sendMessageButtonTapped:(id)a3
{
  ASLoggingInitialize();
  objc_super v4 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Send Message tapped on the phone. Launching to messages app.", v8, 2u);
  }
  unsigned int v5 = [(ASFriend *)self->_friend contact];
  id v6 = [v5 primaryDestinationForMessaging];

  if (v6)
  {
    double v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    ASLaunchToMessagesWithRecipients();
  }
}

- (void)_showShareOptions:(id)a3
{
  objc_super v4 = [(_HKFitnessFriendActivitySnapshot *)self->_activitySnapshot activitySummary];
  sub_1000FC8E4(v4, self->_snapshotDate, self->_iAmWheelchairUser);
  unsigned int v5 = (UIImage *)objc_claimAutoreleasedReturnValue();

  sub_1000FCBC0(self->_snapshotDate);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  sharingImage = self->_sharingImage;
  self->_sharingImage = v5;
  double v8 = v5;

  sharingText = self->_sharingText;
  self->_sharingText = v6;
  double v10 = v6;

  id v11 = objc_alloc((Class)UIActivityViewController);
  v15[0] = v8;
  v15[1] = v10;
  v15[2] = self;
  double v12 = +[NSArray arrayWithObjects:v15 count:3];

  id v13 = [v11 initWithActivityItems:v12 applicationActivities:0];
  double v14 = sub_1000FCD04();
  [v13 setExcludedActivityTypes:v14];

  [(CHFriendDetailCollectionViewController *)self presentViewController:v13 animated:1 completion:0];
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1008D8AB8;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  if (self->_sharingImage && self->_sharingText)
  {
    id v4 = objc_alloc_init((Class)LPLinkMetadata);
    [v4 setSummary:self->_sharingText];
    id v5 = objc_alloc((Class)LPImage);
    id v6 = UIImagePNGRepresentation(self->_sharingImage);
    id v7 = [v5 initWithData:v6 MIMEType:@"image/png"];
    [v4 setImage:v7];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 10;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  activitySnapshot = self->_activitySnapshot;
  BOOL dataIsHidden = self->_dataIsHidden;
  double v8 = [(NSMutableArray *)self->_numItemsInSectionArray objectAtIndexedSubscript:a4];
  id v9 = [v8 integerValue];

  BOOL v10 = dataIsHidden || activitySnapshot == 0;
  if (v10
    && ![(CHFriendDetailCollectionViewController *)self _shouldShowWhileDataIsHiddenForSection:a4])
  {
    return 0;
  }
  return (int64_t)v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:v6];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v8 = [v7 contentView];
  id v9 = [v8 subviews];

  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) removeFromSuperview];
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  double v14 = -[NSMutableArray objectAtIndexedSubscript:](self->_itemsArray, "objectAtIndexedSubscript:", [v6 section]);
  id v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  [v7 bounds];
  [v15 setFrame:];
  double v16 = [v7 contentView];
  [v16 addSubview:v15];

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (![a4 isEqualToString:UICollectionElementKindSectionHeader])
  {
    id v10 = [v8 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer" forIndexPath:v9];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    double v28 = [v10 subviews];
    id v29 = [v28 countByEnumeratingWithState:&v70 objects:v78 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v71;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v71 != v31) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v70 + 1) + 8 * i) removeFromSuperview];
        }
        id v30 = [v28 countByEnumeratingWithState:&v70 objects:v78 count:16];
      }
      while (v30);
    }

    uint64_t v33 = [(CHFriendDetailCollectionViewController *)self collectionView:v8 numberOfItemsInSection:8];
    uint64_t v34 = [(CHFriendDetailCollectionViewController *)self collectionView:v8 numberOfItemsInSection:7];
    if ([v9 section] == (id)8
      || v33 <= 0 && ([v9 section] == (id)7 || v34 <= 0 && objc_msgSend(v9, "section") == (id)6)
      || [v9 section] == (id)9)
    {
      double v35 = 0.0;
    }
    else
    {
      double v35 = 16.0;
    }
    id v49 = objc_alloc((Class)UIView);
    [v10 bounds];
    CGFloat v50 = CGRectGetWidth(v89) - v35;
    [v10 bounds];
    id v17 = [v49 initWithFrame:v35, 0.0, v50, CGRectGetHeight(v90)];
    double v51 = +[UIColor separatorColor];
    [v17 setBackgroundColor:v51];

    BOOL v52 = v34 > 0 && v33 < 1;
    BOOL v53 = v34 > 0 || v33 > 0;
    if ((v33 < 1 || [v9 section] != (id)8)
      && (!v52 || [v9 section] != (id)7)
      && (v53 || [v9 section] != (id)6)
      && [v9 section] != (id)9
      && ([v9 section] != (id)1
       || ([(ASFriend *)self->_friend isCompetitionActive] & 1) == 0))
    {
      [v10 addSubview:v17];
    }
    goto LABEL_58;
  }
  id v10 = [v8 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:v9];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v11 = [v10 contentView];
  uint64_t v12 = [v11 subviews];

  id v13 = [v12 countByEnumeratingWithState:&v74 objects:v79 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v75;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v75 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v74 + 1) + 8 * (void)j) removeFromSuperview];
      }
      id v14 = [v12 countByEnumeratingWithState:&v74 objects:v79 count:16];
    }
    while (v14);
  }

  if ([v9 section] == (id)7)
  {
    id v17 = objc_alloc_init((Class)UILabel);
    long long v18 = +[NSBundle mainBundle];
    long long v19 = [v18 localizedStringForKey:@"WORKOUTS" value:&stru_1008D8AB8 table:@"Localizable"];
    [v17 setText:v19];

    long long v20 = +[UIColor secondaryLabelColor];
    [v17 setTextColor:v20];

    long long v21 = [(CHFriendDetailCollectionViewController *)self _fontForSectionHeaderType:7];
    [v17 setFont:v21];

    [v17 sizeToFit];
    [v10 bounds];
    double MaxY = CGRectGetMaxY(v81);
    [v17 bounds];
    double v23 = MaxY - CGRectGetHeight(v82);
    double v24 = [v17 font];
    [v24 descender];
    double v26 = v23 - v25;
    [v8 bounds];
    CGFloat v27 = CGRectGetWidth(v83) - 16.0 - 16.0;
    [v17 bounds];
    [v17 setFrame:CGRectMake(16.0, v26, v27, CGRectGetHeight(v84))];

LABEL_57:
    v68 = [v10 contentView];
    [v68 addSubview:v17];

LABEL_58:
    goto LABEL_59;
  }
  if ([v9 section] == (id)8)
  {
    id v17 = objc_alloc_init((Class)UILabel);
    double v36 = +[NSBundle mainBundle];
    double v37 = [v36 localizedStringForKey:@"AWARDS" value:&stru_1008D8AB8 table:@"Localizable"];
    [v17 setText:v37];

    double v38 = +[UIColor labelColor];
    [v17 setTextColor:v38];

    double v39 = [(CHFriendDetailCollectionViewController *)self _fontForSectionHeaderType:8];
    [v17 setFont:v39];

    [v17 sizeToFit];
    [v10 bounds];
    CGRectGetHeight(v85);
    [v17 bounds];
    CGRectGetHeight(v86);
    uint64_t v40 = [(CHFriendDetailCollectionViewController *)self view];
    UIRoundToViewScale();
    double v42 = v41;

    [v8 bounds];
    CGFloat v43 = CGRectGetWidth(v87) - 16.0 - 16.0;
    [v17 bounds];
    [v17 setFrame:CGRectMake(16.0, v42, v43, CGRectGetHeight(v88))];
    goto LABEL_57;
  }
  if ([v9 section] != (id)4)
  {
    if ([v9 section] == (id)1)
    {
      id v17 = objc_alloc_init((Class)UILabel);
      id v54 = +[NSBundle mainBundle];
      id v55 = [v54 localizedStringForKey:@"COMPETITION_SCORE_HEADER" value:&stru_1008D8AB8 table:@"Localizable"];
      [v17 setText:v55];

      id v56 = +[UIColor secondaryLabelColor];
      [v17 setTextColor:v56];

      double v47 = self;
      uint64_t v48 = 1;
    }
    else
    {
      if ([v9 section] != (id)3) {
        goto LABEL_59;
      }
      id v17 = objc_alloc_init((Class)UILabel);
      unsigned int v57 = [(ASFriend *)self->_friend isCompetitionActive];
      id v58 = +[NSBundle mainBundle];
      id v59 = v58;
      if (v57) {
        CFStringRef v60 = @"COMPETITION_TOTAL_WINS_HEADER_ACTIVE";
      }
      else {
        CFStringRef v60 = @"COMPETITION_TOTAL_WINS_HEADER_INACTIVE";
      }
      uint64_t v61 = [v58 localizedStringForKey:v60 value:&stru_1008D8AB8 table:@"Localizable"];
      [v17 setText:v61];

      v62 = +[UIColor secondaryLabelColor];
      [v17 setTextColor:v62];

      double v47 = self;
      uint64_t v48 = 3;
    }
    goto LABEL_56;
  }
  if (([(ASFriend *)self->_friend isCompetitionActive] & 1) != 0
    || [(ASFriend *)self->_friend hasCompetitionHistory])
  {
    id v17 = objc_alloc_init((Class)UILabel);
    double v44 = +[NSBundle mainBundle];
    double v45 = [v44 localizedStringForKey:@"FRIEND_DETAIL_ACTIVITY_HEADER" value:&stru_1008D8AB8 table:@"Localizable"];
    [v17 setText:v45];

    double v46 = +[UIColor secondaryLabelColor];
    [v17 setTextColor:v46];

    double v47 = self;
    uint64_t v48 = 4;
LABEL_56:
    double v63 = [(CHFriendDetailCollectionViewController *)v47 _fontForSectionHeaderType:v48];
    [v17 setFont:v63];

    [v17 sizeToFit];
    v64 = [v17 font];
    [v64 _scaledValueForValue:30.0];
    double v66 = v65;

    [v8 bounds];
    CGFloat v67 = CGRectGetWidth(v91) + 16.0 * -2.0;
    [v17 bounds];
    [v17 setFrame:CGRectMake(16.0, 0.0, v67, CGRectGetHeight(v92))];
    [v17 _setFirstLineBaselineFrameOriginY:v66];
    goto LABEL_57;
  }
LABEL_59:

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return [a4 section] == 7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v11 = a4;
  BOOL v5 = [v11 section] == (id)7;
  id v6 = v11;
  if (v5)
  {
    id v7 = -[NSArray objectAtIndexedSubscript:](self->_todaysFriendWorkouts, "objectAtIndexedSubscript:", [v11 row]);
    id v8 = [v7 hkWorkoutFromFriendWorkout];
    id v9 = [(CHFitnessAppContext *)self->_fitnessAppContext seymourCatalogItemDataProvider];
    unsigned int v10 = [v9 isSeymourWorkout:v8];

    if (v10) {
      [(CHFitnessAppContext *)self->_fitnessAppContext navigateToWorkout:v8];
    }

    id v6 = v11;
  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    if (self->_dataIsHidden)
    {
LABEL_7:
      CGFloat bottom = 30.0;
      CGFloat top = 0.0;
      CGFloat left = 0.0;
      CGFloat right = 0.0;
      goto LABEL_9;
    }
LABEL_8:
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
    goto LABEL_9;
  }
  if (a5 == 9) {
    goto LABEL_8;
  }
  if (a5 == 8 && [(NSSet *)self->_todaysAchievements count]) {
    goto LABEL_7;
  }
  CGFloat left = 16.0;
  CGFloat top = 0.0;
  CGFloat bottom = 0.0;
  CGFloat right = 16.0;
LABEL_9:

  double v14 = top;
  double v15 = left;
  double v16 = bottom;
  double v17 = right;
  result.CGFloat right = v17;
  result.CGFloat bottom = v16;
  result.CGFloat left = v15;
  result.CGFloat top = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  sizesArradouble y = self->_sizesArray;
  id v6 = a5;
  id v7 = -[NSMutableArray objectAtIndexedSubscript:](sizesArray, "objectAtIndexedSubscript:", [v6 section]);
  id v8 = [v6 row];

  id v9 = [v7 objectAtIndexedSubscript:v8];

  [v9 CGSizeValue];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = [(CHFriendDetailCollectionViewController *)self _fontForSectionHeaderType:a5];
  if (!self->_dataIsHidden
    || (CGFloat height = 0.0,
        [(CHFriendDetailCollectionViewController *)self _shouldShowWhileDataIsHiddenForSection:a5]))
  {
    double v10 = 24.0;
    switch(a5)
    {
      case 1:
        double v10 = 30.0;
        if ([(ASFriend *)self->_friend isCompetitionActive]) {
          goto LABEL_13;
        }
        goto LABEL_15;
      case 3:
        double v10 = 30.0;
        if (([(ASFriend *)self->_friend isCompetitionActive] & 1) == 0
          && ([(ASFriend *)self->_friend hasCompetitionHistory] & 1) == 0)
        {
          goto LABEL_15;
        }
        goto LABEL_13;
      case 4:
        goto LABEL_13;
      case 7:
        double v10 = 28.0;
        if (![(NSArray *)self->_todaysFriendWorkouts count]) {
          goto LABEL_15;
        }
        goto LABEL_13;
      case 8:
        if (![(NSSet *)self->_todaysAchievements count]) {
          goto LABEL_15;
        }
        double v10 = 44.0;
LABEL_13:
        [v8 _scaledValueForValue:v10];
        CGFloat height = v11;
        break;
      default:
LABEL_15:
        CGFloat width = CGSizeZero.width;
        CGFloat height = CGSizeZero.height;
        goto LABEL_16;
    }
  }
  [v7 bounds];
  CGFloat width = CGRectGetWidth(v16);
LABEL_16:

  double v13 = width;
  double v14 = height;
  result.CGFloat height = v14;
  result.CGFloat width = v13;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v6 = a3;
  int64_t v7 = a5 + 1;
  do
  {
    int64_t v8 = v7;
    id v9 = [v6 numberOfSections];
    if (v8 >= (uint64_t)v9) {
      break;
    }
    uint64_t v10 = (uint64_t)[v6 numberOfItemsInSection:v8];
    int64_t v7 = v8 + 1;
  }
  while (v10 < 1);
  if (a5 == 2
    || (uint64_t v11 = (uint64_t)[v6 numberOfItemsInSection:a5], v8 >= (uint64_t)v9)
    || a5 < 1
    || v11 < 1)
  {
    p_CGFloat height = &CGSizeZero.height;
    CGFloat width = CGSizeZero.width;
  }
  else
  {
    [v6 bounds];
    CGFloat width = CGRectGetWidth(v18);
    if (qword_10096B648 != -1) {
      dispatch_once(&qword_10096B648, &stru_1008AE190);
    }
    p_CGFloat height = (CGFloat *)&qword_10096B640;
  }
  CGFloat v14 = *p_height;

  double v15 = width;
  double v16 = v14;
  result.CGFloat height = v16;
  result.CGFloat width = v15;
  return result;
}

- (id)_workoutsForFriend:(id)a3 snapshot:(id)a4
{
  id v5 = a4;
  id v6 = [a3 friendWorkouts];
  id v7 = [v5 snapshotIndex];

  int64_t v8 = +[NSNumber numberWithLongLong:v7];
  id v9 = [v6 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 allObjects];
  uint64_t v11 = [v10 sortedArrayUsingComparator:&stru_1008AE080];

  return v11;
}

- (void)_friendDataWasUpdated:(id)a3
{
  id v4 = a3;
  if (self->_isMe)
  {
    id v5 = [(ASFriendListSectionManager *)self->_friendListManager me];
    id v6 = self->_friend;
    self->_friend = v5;
  }
  else
  {
    id v6 = [(ASFriend *)self->_friend UUID];
    id v7 = [(ASFriendListSectionManager *)self->_friendListManager friendWithUUID:v6];
    int64_t v8 = self->_friend;
    self->_friend = v7;

    id v9 = [(ASFriend *)self->_friend as_detailedSharingDurationString];
    sharingInfoText = self->_sharingInfoText;
    self->_sharingInfoText = v9;

    uint64_t v11 = [(ASFriend *)self->_friend displayName];
    double v12 = [(CHFriendDetailCollectionViewController *)self navigationItem];
    [v12 setTitle:v11];

    double v13 = [(ASFriend *)self->_friend displayName];
    [(CHFriendDetailCollectionViewController *)self setTitle:v13];
  }
  CGFloat v14 = self->_friend;
  double v15 = +[NSNumber numberWithLongLong:[(_HKFitnessFriendActivitySnapshot *)self->_activitySnapshot snapshotIndex]];
  double v16 = [(ASFriend *)v14 snapshotWithGoalsCarriedForwardForSnapshotIndex:v15];
  activitySnapshot = self->_activitySnapshot;
  self->_activitySnapshot = v16;

  CGRect v18 = [(CHFriendDetailCollectionViewController *)self _workoutsForFriend:self->_friend snapshot:self->_activitySnapshot];
  todaysFriendWorkouts = self->_todaysFriendWorkouts;
  self->_todaysFriendWorkouts = v18;

  if (self->_isMe)
  {
    if (self->_todaysAchievements)
    {
      long long v20 = [(ASFriend *)self->_friend friendAchievements];
      id v21 = [v20 mutableCopy];

      todaysAchievements = self->_todaysAchievements;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10016D978;
      v30[3] = &unk_1008AE0A8;
      v30[4] = self;
      double v23 = [(NSSet *)todaysAchievements hk_map:v30];
      double v24 = +[NSNumber numberWithLongLong:[(_HKFitnessFriendActivitySnapshot *)self->_activitySnapshot snapshotIndex]];
      [v21 setObject:v23 forKeyedSubscript:v24];

      [(ASFriend *)self->_friend setFriendAchievements:v21];
    }
  }
  else
  {
    double v25 = [(ASFriend *)self->_friend friendAchievements];
    double v26 = +[NSNumber numberWithLongLong:[(_HKFitnessFriendActivitySnapshot *)self->_activitySnapshot snapshotIndex]];
    CGFloat v27 = [v25 objectForKeyedSubscript:v26];
    double v28 = (NSSet *)[v27 mutableCopy];
    id v29 = self->_todaysAchievements;
    self->_todaysAchievements = v28;

    self->_BOOL dataIsHidden = [(CHFriendDetailCollectionViewController *)self _isDataHidden];
  }
  [(CHFriendDetailCollectionViewController *)self _populateAchievements];
  [(CHFriendDetailCollectionViewController *)self _reloadData];
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v5 = a3;
  id v6 = [(CHFriendDetailCollectionViewController *)self navigationController];
  id v7 = [v6 topViewController];

  if (v7 == v5)
  {
    id v9 = [(CHFriendDetailCollectionViewController *)self navigationController];
    id v8 = [v9 popViewControllerAnimated:1];
  }
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  [v6 dismissViewControllerAnimated:1 completion:0];
  [(CHFriendDetailCollectionViewController *)self _logMessageComposeResult:a4 messageComposeViewController:v6];

  -[CHFriendInboxTableViewController addFriendViewControllerDidDismiss:]_0();
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v10 = self->_achievementTransitionAnimator;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  v3 = [(CHFriendDetailCollectionViewController *)self navigationController];
  id v4 = [v3 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)achievementsView:(id)a3 didTapAchievement:(id)a4 cell:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CHFriendDetailCollectionViewController *)self navigationController];
  [v9 setDelegate:self];

  uint64_t v10 = sub_1000F95AC(v8, self->_snapshotDateComponents);

  uint64_t v11 = [[CHAchievementDetailViewController alloc] initWithAchievement:v10 locProvider:self->_achievementLocProvider formatsForFriend:!self->_isMe forDayView:0 forModalPresentation:0 shouldShowCelebration:0];
  double v12 = [v7 contentView];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  id v21 = objc_alloc((Class)AAUIAchievementDetailTransitionAnimator);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10016DFC0;
  v31[3] = &unk_1008ABA78;
  id v32 = v7;
  double v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  double v28 = sub_10016DFCC;
  id v29 = &unk_1008ABA78;
  id v30 = v32;
  id v22 = v32;
  double v23 = [AAUIAchievementDetailTransitionAnimator initWithPresentingViewController:self detailViewController:v11 shouldPlayFlipInAnimation:1 initialBadgeFrame:v22 conversionView:v31 didStartAnimationBlock:&v26 didFinishAnimationBlock:v14, v16, v18, v20];
  achievementTransitionAnimator = self->_achievementTransitionAnimator;
  self->_achievementTransitionAnimator = v23;

  double v25 = [(CHFriendDetailCollectionViewController *)self navigationController];
  [v25 pushViewController:v11 animated:1];
}

- (void)friendDetailActionListView:(id)a3 didSelectActionType:(int64_t)a4
{
  id v75 = a3;
  id v6 = self->_friend;
  id v7 = [(ASFriend *)v6 displayName];
  id v8 = +[NSString stringWithString:v7];

  switch(a4)
  {
    case 0:
      unsigned int v9 = [(ASFriend *)v6 isMuted];
      ASLoggingInitialize();
      uint64_t v10 = (void *)ASLogDefault;
      if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = v10;
        double v12 = [(ASFriend *)v6 UUID];
        uint64_t v13 = v9 ^ 1;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)CGRect v92 = v9 ^ 1;
        *(_WORD *)&v92[4] = 2114;
        *(void *)&v92[6] = v12;
        *(_WORD *)&v92[14] = 2112;
        *(void *)&v92[16] = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting mute status to %d for friend: %{public}@ - %@", buf, 0x1Cu);
      }
      else
      {
        uint64_t v13 = v9 ^ 1;
      }
      friendManager = self->_friendManager;
      v88[0] = _NSConcreteStackBlock;
      v88[1] = 3221225472;
      v88[2] = sub_10016ECCC;
      v88[3] = &unk_1008AE0F8;
      char v90 = v9;
      id v89 = v8;
      [(CHFriendManager *)friendManager setMuteEnabled:v13 forFriend:v6 completion:v88];

      goto LABEL_23;
    case 1:
      id v28 = [(ASFriend *)v6 isMyActivityDataCurrentlyHidden];
      v87[0] = _NSConcreteStackBlock;
      v87[1] = 3221225472;
      v87[2] = sub_10016EFF4;
      v87[3] = &unk_1008AE120;
      v87[4] = self;
      id v29 = objc_retainBlock(v87);
      if (v28) {
        goto LABEL_9;
      }
      if ([(ASFriend *)v6 isCompetitionActive])
      {
        unsigned int v57 = ActivitySharingBundle();
        id v58 = [v57 localizedStringForKey:@"COMPETITION_IN_PROGRESS_HIDING_NOT_ALLOWED" value:&stru_1008D8AB8 table:@"Localizable"];
        id v59 = [(ASFriend *)self->_friend displayName];
        CFStringRef v60 = [(ASFriend *)self->_friend displayName];
        uint64_t v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v58, v59, v60);

        ((void (*)(void *, void *))v29[2])(v29, v34);
      }
      else if ([(ASFriend *)self->_friend hasPendingCompetitionRequestFromMe])
      {
        CGFloat v67 = ActivitySharingBundle();
        v68 = [v67 localizedStringForKey:@"COMPETITION_SENT_HIDING_NOT_ALLOWED" value:&stru_1008D8AB8 table:@"Localizable"];
        v69 = [(ASFriend *)self->_friend displayName];
        long long v70 = [(ASFriend *)self->_friend displayName];
        uint64_t v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v68, v69, v70);

        ((void (*)(void *, void *))v29[2])(v29, v34);
      }
      else
      {
LABEL_9:
        ASLoggingInitialize();
        id v30 = (void *)ASLogDefault;
        if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = v30;
          id v32 = [(ASFriend *)v6 UUID];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)CGRect v92 = v28;
          *(_WORD *)&v92[4] = 2114;
          *(void *)&v92[6] = v32;
          *(_WORD *)&v92[14] = 2112;
          *(void *)&v92[16] = v6;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Setting hiding status to %d for friend: %{public}@ - %@", buf, 0x1Cu);
        }
        uint64_t v33 = self->_friendManager;
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472;
        v84[2] = sub_10016F1A4;
        v84[3] = &unk_1008AE0F8;
        char v86 = v28 ^ 1;
        id v85 = v8;
        [(CHFriendManager *)v33 setActivityDataVisible:v28 toFriend:v6 completion:v84];
        uint64_t v34 = v85;
      }

LABEL_23:
      return;
    case 2:
      objc_initWeak(&location, self);
      ASLoggingInitialize();
      double v14 = ASLogDefault;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        double v15 = [(ASFriend *)self->_friend UUID];
        double v16 = self->_friend;
        *(_DWORD *)buf = 138543618;
        *(void *)CGRect v92 = v15;
        *(_WORD *)&v92[8] = 2112;
        *(void *)&v92[10] = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing friend: %{public}@ - %@", buf, 0x16u);
      }
      double v17 = ActivitySharingBundle();
      double v18 = [v17 localizedStringForKey:@"REMOVE_FRIEND" value:&stru_1008D8AB8 table:@"Localizable"];
      double v19 = ActivitySharingBundle();
      double v20 = [v19 localizedStringForKey:@"REMOVE_FRIEND_CONFIRM" value:&stru_1008D8AB8 table:@"Localizable"];
      id v21 = +[UIAlertController alertControllerWithTitle:v18 message:v20 preferredStyle:1];

      id v22 = ActivitySharingBundle();
      double v23 = [v22 localizedStringForKey:@"REMOVE_FRIEND_CANCEL" value:&stru_1008D8AB8 table:@"Localizable"];
      double v24 = +[UIAlertAction actionWithTitle:v23 style:1 handler:0];
      [v21 addAction:v24];

      double v25 = ActivitySharingBundle();
      double v26 = [v25 localizedStringForKey:@"REMOVE_FRIEND_YES" value:&stru_1008D8AB8 table:@"Localizable"];
      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472;
      v80[2] = sub_10016F4C0;
      v80[3] = &unk_1008AE148;
      v80[4] = self;
      id v81 = v8;
      objc_copyWeak(&v82, &location);
      uint64_t v27 = +[UIAlertAction actionWithTitle:v26 style:2 handler:v80];
      [v21 addAction:v27];

      [(CHFriendDetailCollectionViewController *)self presentViewController:v21 animated:1 completion:0];
      objc_destroyWeak(&v82);

      objc_destroyWeak(&location);
      goto LABEL_23;
    case 3:
      BOOL v35 = !self->_pairedWatchSupportsCompetitions;
      long long v74 = [(ASFriend *)self->_friend as_competitionSendConfirmationTitle];
      if (v35)
      {
        uint64_t v61 = +[NSBundle mainBundle];
        v62 = [v61 localizedStringForKey:@"COMPETITION_SEND_UPGRADE_WATCH" value:&stru_1008D8AB8 table:@"Localizable"];

        double v63 = +[UIAlertController alertControllerWithTitle:v74 message:v62 preferredStyle:1];
        v64 = +[NSBundle mainBundle];
        double v65 = [v64 localizedStringForKey:@"OK" value:&stru_1008D8AB8 table:@"Localizable"];
        double v66 = +[UIAlertAction actionWithTitle:v65 style:0 handler:0];
        [v63 addAction:v66];

        [(CHFriendDetailCollectionViewController *)self presentViewController:v63 animated:1 completion:0];
      }
      else
      {
        long long v73 = [(ASFriend *)self->_friend as_competitionSendConfirmationMessageForExperienceType:self->_experienceType];
        double v36 = +[NSBundle mainBundle];
        double v37 = [v36 localizedStringForKey:v73 value:&stru_1008D8AB8 table:@"Localizable"];
        double v38 = [(ASFriend *)self->_friend displayName];
        long long v72 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v37, v38);

        double v39 = +[NSBundle mainBundle];
        uint64_t v40 = [v39 localizedStringForKey:@"SHARING_CANCEL" value:&stru_1008D8AB8 table:@"Localizable"];
        long long v71 = +[UIAlertAction actionWithTitle:v40 style:1 handler:0];

        double v41 = ActivitySharingBundle();
        double v42 = [v41 localizedStringForKey:@"COMPETITION_SEND_CONFIRMATION_SEND_ACTION" value:&stru_1008D8AB8 table:@"Localizable"];
        CGFloat v43 = [(ASFriend *)self->_friend displayName];
        double v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v42, v43);
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        v77[2] = sub_10016F870;
        v77[3] = &unk_1008AE170;
        v77[4] = self;
        id v78 = v8;
        id v79 = v74;
        id v45 = v74;
        double v46 = +[UIAlertAction actionWithTitle:v44 style:0 handler:v77];

        double v47 = [(ASFriend *)self->_friend as_competitionLearnMorePopupAction];
        v76[0] = _NSConcreteStackBlock;
        v76[1] = 3221225472;
        v76[2] = sub_100170144;
        v76[3] = &unk_1008ACB30;
        v76[4] = self;
        uint64_t v48 = +[UIAlertAction actionWithTitle:v47 style:0 handler:v76];

        id v49 = +[UIAlertController alertControllerWithTitle:v45 message:v72 preferredStyle:1];
        [v49 addAction:v71];
        [v49 addAction:v46];
        [v49 addAction:v48];
        [v49 setPreferredAction:v46];
        [(CHFriendDetailCollectionViewController *)self presentViewController:v49 animated:1 completion:0];
      }
      goto LABEL_23;
    case 4:
      sub_10014B014(self, self->_friend, self->_friendManager, self->_experienceType);
      goto LABEL_23;
    case 5:
      CGFloat v50 = [(ASFriend *)self->_friend as_competitionLearnMoreTitleForExperienceType:self->_experienceType];
      double v51 = [(ASFriend *)self->_friend as_competitionLearnMoreFullDescriptionForExperienceType:self->_experienceType];
      BOOL v52 = +[UIAlertController alertControllerWithTitle:v50 message:v51 preferredStyle:1];
      BOOL v53 = +[NSBundle mainBundle];
      id v54 = [v53 localizedStringForKey:@"OK" value:&stru_1008D8AB8 table:@"Localizable"];
      id v55 = +[UIAlertAction actionWithTitle:v54 style:0 handler:0];
      [v52 addAction:v55];

      [(CHFriendDetailCollectionViewController *)self presentViewController:v52 animated:1 completion:0];
      goto LABEL_23;
    default:
      goto LABEL_23;
  }
}

- (BOOL)_shouldShowExerciseAndStandCells
{
  v2 = [(_HKFitnessFriendActivitySnapshot *)self->_activitySnapshot activitySummary];
  char v3 = [v2 _isStandalonePhoneSummary] ^ 1;

  return v3;
}

- (BOOL)_shouldShowStepsAndDistanceCells
{
  char v3 = [(_HKFitnessFriendActivitySnapshot *)self->_activitySnapshot activitySummary];
  unsigned __int8 v4 = [v3 _isStandalonePhoneSummary];

  if (self->_isMe)
  {
    char iAmWheelchairUser = self->_iAmWheelchairUser;
  }
  else
  {
    [(_HKFitnessFriendActivitySnapshot *)self->_activitySnapshot wheelchairUse];
    char iAmWheelchairUser = FIUIIsWheelchairUserForWheelchairUse();
  }
  return v4 & iAmWheelchairUser ^ 1;
}

- (BOOL)_shouldShowMuteAction
{
  return !self->_isMe && !self->_dataIsHidden;
}

- (BOOL)_shouldShowCompetitionRequestAction
{
  if (self->_isMe) {
    return 0;
  }
  if (self->_dataIsHidden) {
    return 0;
  }
  char v3 = [(ASFriend *)self->_friend contact];
  unsigned __int8 v4 = [v3 relationship];
  unsigned int v5 = [v4 supportsCompetitions];

  if (!v5 || ![(ASFriend *)self->_friend supportsCompetitions]) {
    return 0;
  }
  id v6 = self->_friend;

  return [(ASFriend *)v6 isEligibleToReceiveCompetitionRequest];
}

- (BOOL)_shouldShowCompetitionAcceptAction
{
  if (self->_isMe || self->_dataIsHidden) {
    return 0;
  }
  else {
    return [(ASFriend *)self->_friend isAwaitingCompetitionResponseFromMe];
  }
}

- (BOOL)_shouldShowCompetitionRulesAction
{
  if (self->_isMe || self->_dataIsHidden) {
    return 0;
  }
  if ([(ASFriend *)self->_friend isCompetitionActive]) {
    return 1;
  }
  unsigned __int8 v4 = self->_friend;

  return [(ASFriend *)v4 hasPendingCompetitionRequestFromMe];
}

- (BOOL)_shouldShowWhileDataIsHiddenForSection:(int64_t)a3
{
  return (unint64_t)a3 < 3 || a3 > 8;
}

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  self->_char iAmWheelchairUser = a4;
  [(CHFriendDetailCollectionViewController *)self _reloadData];
}

- (void)_logMessageComposeResult:(int64_t)a3 messageComposeViewController:(id)a4
{
  if (a3 == 1)
  {
    unsigned int v5 = [a4 recipients];
    [v5 count];

    FIActivityAnalyticsSubmission();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);
  objc_storeStrong((id *)&self->_imageFactory, 0);
  objc_storeStrong((id *)&self->_achievementLocProvider, 0);
  objc_storeStrong((id *)&self->_achievementTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_sharingText, 0);
  objc_storeStrong((id *)&self->_sharingImage, 0);
  objc_storeStrong((id *)&self->_sharingInfoText, 0);
  objc_storeStrong((id *)&self->_numItemsInSectionArray, 0);
  objc_storeStrong((id *)&self->_sizesArray, 0);
  objc_storeStrong((id *)&self->_itemsArray, 0);
  objc_storeStrong((id *)&self->_sharingInfoSizingLabel, 0);
  objc_storeStrong((id *)&self->_actionListCell, 0);
  objc_storeStrong((id *)&self->_achievementsCell, 0);
  objc_storeStrong((id *)&self->_workoutCellsArray, 0);
  objc_storeStrong((id *)&self->_competitionTotalWinsCell, 0);
  objc_storeStrong((id *)&self->_competitionGraphCell, 0);
  objc_storeStrong((id *)&self->_competitionScoreCell, 0);
  objc_storeStrong((id *)&self->_distanceCell, 0);
  objc_storeStrong((id *)&self->_stepCell, 0);
  objc_storeStrong((id *)&self->_standCell, 0);
  objc_storeStrong((id *)&self->_exerciseCell, 0);
  objc_storeStrong((id *)&self->_moveCell, 0);
  objc_storeStrong((id *)&self->_dateCell, 0);
  objc_storeStrong((id *)&self->_threeRingCell, 0);
  objc_storeStrong((id *)&self->_achievementsDataProvider, 0);
  objc_storeStrong((id *)&self->_friendManager, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_workoutFormattingManager, 0);
  objc_storeStrong((id *)&self->_workoutDataProvider, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_todaysAchievements, 0);
  objc_storeStrong((id *)&self->_todaysFriendWorkouts, 0);
  objc_storeStrong((id *)&self->_activitySnapshot, 0);
  objc_storeStrong((id *)&self->_snapshotDateComponents, 0);
  objc_storeStrong((id *)&self->_snapshotDate, 0);
  objc_storeStrong((id *)&self->_friend, 0);
  objc_storeStrong((id *)&self->_contactNavigationController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
}

@end