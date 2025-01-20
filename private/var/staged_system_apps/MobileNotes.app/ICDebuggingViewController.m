@interface ICDebuggingViewController
+ (id)createLayout;
+ (void)fileRadar:(id)a3;
+ (void)presentDebugView:(id)a3;
+ (void)setupDebuggingGestureInWindow:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)canShowRecentItems;
- (BOOL)disableSearchResultsAnimation;
- (BOOL)shouldShowRecentItems;
- (NSArray)allSections;
- (NSArray)filteredSections;
- (NSArray)recentItemIdentifiers;
- (NSArray)recentItems;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UISearchController)searchController;
- (id)URLsForTestDataDirectories;
- (id)addRandomNoteToFolder:(id)a3;
- (id)createSnapshot;
- (void)addDivergedAttachment:(id)a3;
- (void)addFolders:(unint64_t)a3 toAccount:(id)a4 maxNotesInFolder:(unint64_t)a5;
- (void)addRecentItemWithIdentifier:(id)a3;
- (void)addSomeFoldersWithRandomNotesToAllModernAccounts:(id)a3;
- (void)addSomeRandomNotes:(id)a3;
- (void)addSomeRandomNotes:(unint64_t)a3 toFolder:(id)a4;
- (void)bluetoothKeyboardHint:(id)a3;
- (void)checkiCloudKeychainSyncStatus:(id)a3;
- (void)clearAnalyticsIdentifiers:(id)a3;
- (void)clearRecentItems;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)confirmDestructiveActionWithTitle:(id)a3 message:(id)a4 buttonText:(id)a5 block:(id)a6;
- (void)crashThisApp:(id)a3;
- (void)createPartiallySupportedSmartFolder:(id)a3;
- (void)deleteAllTags:(id)a3;
- (void)deleteDocCamPDFs:(id)a3;
- (void)deleteEverything:(id)a3;
- (void)deleteMigratedDuplicates:(id)a3;
- (void)deleteSearchIndex:(id)a3;
- (void)deleteServerChangeTokens:(id)a3;
- (void)disableDebuggingSearchAnimation:(id)a3;
- (void)dismiss:(id)a3;
- (void)dumpAnalyticsIdentifiers:(id)a3;
- (void)fakeIncompatibleDevices:(id)a3;
- (void)fixDivergedAttachments:(id)a3;
- (void)generateFallbackImageForSketches:(id)a3;
- (void)generateFallbackPDFForPaperDocuments:(id)a3;
- (void)generateSystemPaperChrome:(id)a3;
- (void)importTestDataFromDirectoryAtURL:(id)a3;
- (void)loadTestData:(id)a3;
- (void)logHashtagsIndexedByOtherApps:(id)a3;
- (void)logSearchIndex:(id)a3;
- (void)migrateAccounts:(id)a3 toMode:(signed __int16)a4;
- (void)migrateLocalAccount:(id)a3;
- (void)migratePrimaryICloudAccount:(id)a3;
- (void)migrateToCustomPasswordMode:(id)a3;
- (void)migrateToDevicePasscodeMode:(id)a3;
- (void)prefetchHashtagsIndexedByOtherApps:(id)a3;
- (void)purgeAllHandwritingSummaries:(id)a3;
- (void)purgeEverything:(id)a3;
- (void)pushEverythingToCloud:(id)a3;
- (void)regenerateAllAttachmentPreviewImages:(id)a3;
- (void)regenerateAllHandwritingSummaries:(id)a3;
- (void)regenerateAllImageClassifications:(id)a3;
- (void)regenerateAllOCR:(id)a3;
- (void)regenerateAnalyticsIdentifiers:(id)a3;
- (void)regenerateStandardizedContentForAllHashtags:(id)a3;
- (void)regenerateSystemPaperThumbnails:(id)a3;
- (void)reindexEverything:(id)a3;
- (void)reloadDataAnimated:(BOOL)a3;
- (void)removeAccountPassword:(id)a3;
- (void)removeWhatsNewVersion:(id)a3;
- (void)resetAutoSortChecklistAlert:(id)a3;
- (void)resetLocalAccountMigration:(id)a3;
- (void)resetLockedNotesMode:(id)a3;
- (void)resetPassword:(id)a3;
- (void)resetPencilUnsupportedAlertState:(id)a3;
- (void)resetRecentlyDeletedWarning:(id)a3;
- (void)resetServerSideUpdateTaskState:(id)a3;
- (void)resetSupportsV1Neo:(id)a3;
- (void)resetUpdateDrawingsAlert:(id)a3;
- (void)resetWelcomeScreenState:(id)a3;
- (void)sendStateOfTheWorld:(id)a3;
- (void)setAllSections:(id)a3;
- (void)setCanShowRecentItems:(BOOL)a3;
- (void)setCloudConfiguration:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setFilteredSections:(id)a3;
- (void)setRecentItemIdentifiers:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setUpDataSource;
- (void)setUpDebuggingItems;
- (void)setUpSearch;
- (void)setWhatsNewToCurrentOS:(id)a3;
- (void)setWhatsNewToIOS9:(id)a3;
- (void)showSimplifiedUITextViewEditor:(id)a3;
- (void)showSimplifiedWebEditor:(id)a3;
- (void)simulateBackgroundSnapshot:(id)a3;
- (void)simulateBackgroundSnapshotExpiration:(id)a3;
- (void)startFresh:(id)a3;
- (void)syncLocalWithCloud:(id)a3;
- (void)testAllowNotificationsWarmingSheet:(id)a3;
- (void)testAppRemoval:(id)a3;
- (void)testNotificationsNotAllowedAlert:(id)a3;
- (void)testTTR:(id)a3;
- (void)toggleDebuggingItemWithDefaultsKey:(id)a3 sender:(id)a4;
- (void)toggleGreyParrotUI:(id)a3;
- (void)toggleNonContiguousLayout:(id)a3;
- (void)toggleSupportsV1Neo:(id)a3;
- (void)triggerCloudOperationEndEventWithNilErrorDomain:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation ICDebuggingViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ICDebuggingViewController;
  [(ICDebuggingViewController *)&v3 viewDidLoad];
  [(ICDebuggingViewController *)self setUpDebuggingItems];
  [(ICDebuggingViewController *)self setUpDataSource];
  [(ICDebuggingViewController *)self setUpSearch];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICDebuggingViewController;
  [(ICDebuggingViewController *)&v5 viewDidAppear:a3];
  v4 = [(ICDebuggingViewController *)self navigationItem];
  [v4 setHidesSearchBarWhenScrolling:1];
}

+ (void)setupDebuggingGestureInWindow:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[ICShowDebugMenuGestureRecognizer alloc] initWithTarget:a1 action:"presentDebugView:"];
  [v4 addGestureRecognizer:v5];
}

+ (void)presentDebugView:(id)a3
{
  id v24 = a3;
  id v4 = [ICDebuggingViewController alloc];
  objc_super v5 = [a1 createLayout];
  v6 = [(ICDebuggingViewController *)v4 initWithCollectionViewLayout:v5];

  id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v6 action:"dismiss:"];
  v8 = [(ICDebuggingViewController *)v6 navigationItem];
  [v8 setLeftBarButtonItem:v7];

  unsigned int v9 = +[UIDevice ic_isVision];
  v10 = @"ant.circle";
  if (v9) {
    v10 = @"ant";
  }
  v11 = v10;
  id v12 = objc_alloc((Class)UIBarButtonItem);
  v13 = +[UIImage systemImageNamed:v11];

  id v14 = [v12 initWithImage:v13 style:0 target:a1 action:"fileRadar:"];
  v15 = [(ICDebuggingViewController *)v6 navigationItem];
  [v15 setRightBarButtonItem:v14];

  v16 = [(ICDebuggingViewController *)v6 navigationItem];
  [v16 setTitle:@"Debugging"];

  v17 = [(ICDebuggingViewController *)v6 ic_embedInNavigationControllerForModalPresentation];
  [v17 setNavigationBarHidden:0];
  objc_opt_class();
  v18 = ICDynamicCast();
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    objc_opt_class();
    objc_opt_class();
    v21 = ICDynamicCast();
    v22 = [v21 view];
    v23 = ICDynamicCast();
    id v20 = [v23 rootViewController];
  }
  [v20 presentViewController:v17 animated:1 completion:0];
}

+ (id)createLayout
{
  id v2 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
  id v3 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSectionProvider:&stru_100628798 configuration:v2];

  return v3;
}

- (void)setUpSearch
{
  id v3 = objc_alloc_init((Class)UISearchController);
  [(ICDebuggingViewController *)self setSearchController:v3];

  id v4 = [(ICDebuggingViewController *)self searchController];
  [v4 setSearchResultsUpdater:self];

  objc_super v5 = [(ICDebuggingViewController *)self searchController];
  [v5 setDelegate:self];

  v6 = [(ICDebuggingViewController *)self searchController];
  id v7 = [v6 searchBar];
  [v7 setAutocapitalizationType:0];

  v8 = [(ICDebuggingViewController *)self searchController];
  [v8 setObscuresBackgroundDuringPresentation:0];

  unsigned int v9 = [(ICDebuggingViewController *)self searchController];
  v10 = [(ICDebuggingViewController *)self navigationItem];
  [v10 setSearchController:v9];

  v11 = [(ICDebuggingViewController *)self navigationItem];
  [v11 setHidesSearchBarWhenScrolling:0];

  [(ICDebuggingViewController *)self setCanShowRecentItems:0];
}

- (void)confirmDestructiveActionWithTitle:(id)a3 message:(id)a4 buttonText:(id)a5 block:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000B75A8;
  v16[3] = &unk_1006264C8;
  id v17 = v10;
  id v13 = v10;
  id v14 = +[UIAlertAction actionWithTitle:v11 style:2 handler:v16];

  [v12 addAction:v14];
  v15 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v12 addAction:v15];

  [(ICDebuggingViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)setUpDataSource
{
  objc_initWeak(&location, self);
  uint64_t v3 = objc_opt_class();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000B7888;
  v18[3] = &unk_1006287C0;
  objc_copyWeak(&v19, &location);
  id v4 = +[UICollectionViewCellRegistration registrationWithCellClass:v3 configurationHandler:v18];
  id v5 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v6 = [(ICDebuggingViewController *)self collectionView];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000B79F8;
  v16[3] = &unk_1006287E8;
  id v7 = v4;
  id v17 = v7;
  id v8 = [v5 initWithCollectionView:v6 cellProvider:v16];
  [(ICDebuggingViewController *)self setDiffableDataSource:v8];

  uint64_t v9 = objc_opt_class();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B7A0C;
  v14[3] = &unk_100628810;
  objc_copyWeak(&v15, &location);
  +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:v9 elementKind:UICollectionElementKindSectionHeader configurationHandler:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B7BE8;
  v12[3] = &unk_100628838;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v10;
  id v11 = [(ICDebuggingViewController *)self diffableDataSource];
  [v11 setSupplementaryViewProvider:v12];

  [(ICDebuggingViewController *)self reloadDataAnimated:0];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)reloadDataAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(ICDebuggingViewController *)self createSnapshot];
  id v5 = [(ICDebuggingViewController *)self diffableDataSource];
  [v5 applySnapshot:v6 animatingDifferences:v3];
}

- (id)createSnapshot
{
  id v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  if ([(ICDebuggingViewController *)self shouldShowRecentItems])
  {
    CFStringRef v12 = @"RECENT";
    id v4 = +[NSArray arrayWithObjects:&v12 count:1];
    [v3 appendSectionsWithIdentifiers:v4];

    id v5 = [(ICDebuggingViewController *)self recentItems];
    id v6 = [v5 ic_map:&stru_100628878];

    [v3 appendItemsWithIdentifiers:v6 intoSectionWithIdentifier:@"RECENT"];
  }
  else
  {
    id v7 = [(ICDebuggingViewController *)self filteredSections];
    id v6 = [v7 ic_map:&stru_1006288B8];

    [v3 appendSectionsWithIdentifiers:v6];
    id v8 = [(ICDebuggingViewController *)self filteredSections];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B7E1C;
    v10[3] = &unk_100628900;
    id v11 = v3;
    [v8 enumerateObjectsUsingBlock:v10];
  }

  return v3;
}

- (void)addRecentItemWithIdentifier:(id)a3
{
  id v8 = a3;
  id v4 = [(ICDebuggingViewController *)self recentItemIdentifiers];
  id v5 = [v4 mutableCopy];

  id v6 = [v5 indexOfObject:v8];
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [v5 removeObjectAtIndex:v6];
  }
  [v5 insertObject:v8 atIndex:0];
  id v7 = [v5 copy];
  [(ICDebuggingViewController *)self setRecentItemIdentifiers:v7];
}

- (void)clearRecentItems
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObjectForKey:@"DebuggingRecentItemIdentifiers"];

  uint64_t v4 = [(ICDebuggingViewController *)self disableSearchResultsAnimation] ^ 1;

  [(ICDebuggingViewController *)self reloadDataAnimated:v4];
}

- (void)setRecentItemIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setObject:v3 forKey:@"DebuggingRecentItemIdentifiers"];
}

- (NSArray)recentItemIdentifiers
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 arrayForKey:@"DebuggingRecentItemIdentifiers"];
  id v4 = v3;
  if (!v3) {
    id v3 = &__NSArray0__struct;
  }
  id v5 = v3;

  return v5;
}

- (NSArray)recentItems
{
  id v3 = [(ICDebuggingViewController *)self allSections];
  id v4 = [v3 ic_flatMap:&stru_100628940];

  id v5 = [v4 ic_map:&stru_100628960];
  id v6 = [(ICDebuggingViewController *)self recentItemIdentifiers];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B81E4;
  v11[3] = &unk_100628988;
  id v12 = v5;
  id v13 = v4;
  id v7 = v4;
  id v8 = v5;
  uint64_t v9 = [v6 ic_compactMap:v11];

  return (NSArray *)v9;
}

- (void)toggleDebuggingItemWithDefaultsKey:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSUserDefaults standardUserDefaults];
  objc_msgSend(v8, "setBool:forKey:", objc_msgSend(v8, "BOOLForKey:", v7) ^ 1, v7);

  objc_opt_class();
  uint64_t v9 = ICDynamicCast();

  id v10 = [v9 item];
  if (v10)
  {
    id v11 = [(ICDebuggingViewController *)self diffableDataSource];
    id v12 = [v11 snapshot];
    id v13 = [v10 identifier];
    id v15 = v13;
    id v14 = +[NSArray arrayWithObjects:&v15 count:1];
    [v12 reconfigureItemsWithIdentifiers:v14];
  }
}

- (void)dismiss:(id)a3
{
  id v3 = [(ICDebuggingViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)disableSearchResultsAnimation
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DebuggingDisableSearchAnimation"];

  return v3;
}

+ (void)fileRadar:(id)a3
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v15 = a4;
  id v6 = a3;
  if ([(ICDebuggingViewController *)self shouldShowRecentItems])
  {
    id v7 = [(ICDebuggingViewController *)self recentItems];
  }
  else
  {
    id v8 = [(ICDebuggingViewController *)self filteredSections];
    uint64_t v9 = [v8 objectAtIndexedSubscript:[v15 section]];
    id v7 = [v9 items];
  }
  id v10 = [v7 objectAtIndexedSubscript:[v15 row]];
  id v11 = [v10 selector];
  id v12 = (void (*)(ICDebuggingViewController *, id, void *))[(ICDebuggingViewController *)self methodForSelector:v11];
  id v13 = [v6 cellForItemAtIndexPath:v15];
  v12(self, v11, v13);
  id v14 = [v10 identifier];
  [(ICDebuggingViewController *)self addRecentItemWithIdentifier:v14];

  [v6 deselectItemAtIndexPath:v15 animated:1];
}

- (void)willPresentSearchController:(id)a3
{
}

- (void)willDismissSearchController:(id)a3
{
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v7 = a3;
  id v4 = [v7 searchBar];
  id v5 = [v4 text];
  if ([v5 length]) {
    id v6 = 0;
  }
  else {
    id v6 = [v7 isActive];
  }
  [(ICDebuggingViewController *)self setCanShowRecentItems:v6];

  [(ICDebuggingViewController *)self reloadDataAnimated:[(ICDebuggingViewController *)self disableSearchResultsAnimation] ^ 1];
}

- (void)setUpDebuggingItems
{
  id v2 = +[ICNoteContext sharedContext];
  unsigned __int8 v3 = [v2 managedObjectContext];
  v160 = +[ICAccount allActiveAccountsInContext:v3];

  v145 = [[ICDebuggingItem alloc] initWithTitle:@"Reset Auto Sort Checklist Alert" selector:"resetAutoSortChecklistAlert:"];
  v181 = v145;
  v182 = [[ICDebuggingItem alloc] initWithTitle:@"Reset Recently Deleted Warning" selector:"resetRecentlyDeletedWarning:"];
  v144 = v182;
  v143 = [[ICDebuggingItem alloc] initWithTitle:@"Reset Update Drawings Alert" selector:"resetUpdateDrawingsAlert:"];
  v183 = v143;
  v184 = [[ICDebuggingItem alloc] initWithTitle:@"Test Allow Notifications Warming Sheet" selector:"testAllowNotificationsWarmingSheet:"];
  v142 = v184;
  v141 = [[ICDebuggingItem alloc] initWithTitle:@"Test Notifications Not Allowed Alert" selector:"testNotificationsNotAllowedAlert:"];
  v185 = v141;
  v186 = [[ICDebuggingItem alloc] initWithTitle:@"Test Notes TTR" selector:"testTTR:"];
  v140 = v186;
  v139 = +[NSArray arrayWithObjects:&v181 count:6];
  v159 = [[ICDebuggingSection alloc] initWithTitle:@"Alerts" items:v139];
  v138 = [[ICDebuggingItem alloc] initWithTitle:@"Dump Identifiers" selector:"dumpAnalyticsIdentifiers:"];
  v175 = v138;
  v176 = [[ICDebuggingItem alloc] initWithTitle:@"Regenerate Identifiers" selector:"regenerateAnalyticsIdentifiers:"];
  v137 = v176;
  v136 = [[ICDebuggingItem alloc] initWithTitle:@"Clear Identifiers" selector:"clearAnalyticsIdentifiers:"];
  v177 = v136;
  v178 = [[ICDebuggingItem alloc] initWithTitle:@"Simulate Background Snapshot" selector:"simulateBackgroundSnapshot:"];
  v135 = v178;
  v134 = [[ICDebuggingItem alloc] initWithTitle:@"Simulate Background Snapshot Expiration" selector:"simulateBackgroundSnapshotExpiration:"];
  v179 = v134;
  v180 = [[ICDebuggingItem alloc] initWithTitle:@"Fire Cloud Error Domain=nil" selector:"triggerCloudOperationEndEventWithNilErrorDomain:"];
  v133 = v180;
  v132 = +[NSArray arrayWithObjects:&v175 count:6];
  v158 = [[ICDebuggingSection alloc] initWithTitle:@"Analytics" items:v132];
  id v4 = [[ICDebuggingItem alloc] initWithTitle:@"Refresh From Cloud" selector:"syncLocalWithCloud:"];
  id v5 = [[ICDebuggingItem alloc] initWithTitle:@"Push Everything to Cloud" selector:"pushEverythingToCloud:"];
  id v6 = [[ICDebuggingItem alloc] initWithTitle:@"Delete Cloud Change Tokens" selector:"deleteServerChangeTokens:"];
  id v7 = [[ICDebuggingItem alloc] initWithTitle:@"Cloud Configuration" selector:"setCloudConfiguration:"];
  [(ICDebuggingItem *)v7 setPresenter:1];
  v131 = v4;
  v174[0] = v4;
  v174[1] = v5;
  v130 = v5;
  v128 = v6;
  v174[2] = v6;
  v174[3] = v7;
  v127 = v7;
  v126 = [[ICDebuggingItem alloc] initWithTitle:@"Reset Server Side Update Task State" selector:"resetServerSideUpdateTaskState:"];
  v174[4] = v126;
  v125 = +[NSArray arrayWithObjects:v174 count:5];
  v157 = [[ICDebuggingSection alloc] initWithTitle:@"Cloud" items:v125];
  id v8 = [[ICDebuggingItem alloc] initWithTitle:@"Delete Data" selector:"purgeEverything:"];
  [(ICDebuggingItem *)v8 setDestructive:1];
  [(ICDebuggingItem *)v8 setPresenter:1];
  [(ICDebuggingItem *)v8 setSubtitle:@"Keep in Cloud"];
  uint64_t v9 = [[ICDebuggingItem alloc] initWithTitle:@"Delete Data" selector:"deleteEverything:"];
  [(ICDebuggingItem *)v9 setDestructive:1];
  [(ICDebuggingItem *)v9 setPresenter:1];
  [(ICDebuggingItem *)v9 setSubtitle:@"Delete From Cloud"];
  id v10 = [[ICDebuggingItem alloc] initWithTitle:@"Load Test Data" selector:"loadTestData:"];
  [(ICDebuggingItem *)v10 setPresenter:1];
  id v11 = [[ICDebuggingItem alloc] initWithTitle:@"Add 1000 Random Notes" selector:"addSomeRandomNotes:"];
  id v12 = [[ICDebuggingItem alloc] initWithTitle:@"Add Folders With Random Notes" selector:"addSomeFoldersWithRandomNotesToAllModernAccounts:"];
  [(ICDebuggingItem *)v12 setSubtitle:@"Adds to all ICAccounts"];
  v124 = v8;
  v173[0] = v8;
  v123 = v9;
  v173[1] = v9;
  v122 = v10;
  v173[2] = v10;
  v121 = v11;
  v173[3] = v11;
  v120 = v12;
  v173[4] = v12;
  v119 = +[NSArray arrayWithObjects:v173 count:5];
  v156 = [[ICDebuggingSection alloc] initWithTitle:@"Data" items:v119];
  id v13 = [[ICDebuggingItem alloc] initWithTitle:@"Disable Search Results Animation" selector:"disableDebuggingSearchAnimation:"];
  [(ICDebuggingItem *)v13 setSelectedDefaultsKey:@"DebuggingDisableSearchAnimation"];
  id v14 = [[ICDebuggingItem alloc] initWithTitle:@"Grey Parrot UI" selector:"toggleGreyParrotUI:"];
  [(ICDebuggingItem *)v14 setSelectedDefaultsKey:@"DebuggingGreyParrotUI"];
  v118 = v13;
  v172[0] = v13;
  v117 = v14;
  v172[1] = v14;
  v116 = +[NSArray arrayWithObjects:v172 count:2];
  v155 = [[ICDebuggingSection alloc] initWithTitle:@"Debugging UI" items:v116];
  id v15 = [[ICDebuggingItem alloc] initWithTitle:@"Migrate Primary iCloud Account" selector:"migratePrimaryICloudAccount:"];
  v16 = [[ICDebuggingItem alloc] initWithTitle:@"Migrate Local Account" selector:"migrateLocalAccount:"];
  id v17 = [[ICDebuggingItem alloc] initWithTitle:@"Delete Migrated Duplicates" selector:"deleteMigratedDuplicates:"];
  v18 = [[ICDebuggingItem alloc] initWithTitle:@"Reset Local Account Migration" selector:"resetLocalAccountMigration:"];
  id v19 = [[ICDebuggingItem alloc] initWithTitle:@"Reset Migration" selector:"startFresh:"];
  id v20 = [[ICDebuggingItem alloc] initWithTitle:@"Reset Pencil Unsupported Alert State" selector:"resetPencilUnsupportedAlertState:"];
  v21 = [[ICDebuggingItem alloc] initWithTitle:@"Simplified UITextView Editor" selector:"showSimplifiedUITextViewEditor:"];
  [(ICDebuggingItem *)v21 setPresenter:1];
  v22 = [[ICDebuggingItem alloc] initWithTitle:@"Simplified WKWebView Editor" selector:"showSimplifiedWebEditor:"];
  [(ICDebuggingItem *)v22 setPresenter:1];
  v114 = v16;
  v115 = v15;
  v171[0] = v15;
  v171[1] = v16;
  v112 = v18;
  v113 = v17;
  v171[2] = v17;
  v171[3] = v18;
  v110 = v20;
  v111 = v19;
  v171[4] = v19;
  v171[5] = v20;
  v108 = v22;
  v109 = v21;
  v171[6] = v21;
  v171[7] = v22;
  v107 = +[NSArray arrayWithObjects:v171 count:8];
  v154 = [[ICDebuggingSection alloc] initWithTitle:@"Legacy" items:v107];
  v23 = [[ICDebuggingItem alloc] initWithTitle:@"Send State of the World" selector:"sendStateOfTheWorld:"];
  [(ICDebuggingItem *)v23 setPresenter:1];
  v106 = v23;
  v170 = v23;
  v105 = +[NSArray arrayWithObjects:&v170 count:1];
  v153 = [[ICDebuggingSection alloc] initWithTitle:@"Logging" items:v105];
  id v24 = [[ICDebuggingItem alloc] initWithTitle:@"Toggle Non-Contiguous Layout" selector:"toggleNonContiguousLayout:"];
  [(ICDebuggingItem *)v24 setPresenter:1];
  v104 = v24;
  v169 = v24;
  v103 = +[NSArray arrayWithObjects:&v169 count:1];
  v152 = [[ICDebuggingSection alloc] initWithTitle:@"Note Editor View" items:v103];
  v25 = [[ICDebuggingItem alloc] initWithTitle:@"Remove Account Passwords" selector:"removeAccountPassword:"];
  v26 = [[ICDebuggingItem alloc] initWithTitle:@"Reset Locked Notes Mode" selector:"resetLockedNotesMode:"];
  unsigned int v27 = [v160 ic_allSatisfy:&stru_1006289C8];
  v28 = @"Enable v1 Neo Support";
  if (v27) {
    v28 = @"Disable v1 Neo Support";
  }
  v29 = v28;
  v30 = [[ICDebuggingItem alloc] initWithTitle:v29 selector:"toggleSupportsV1Neo:"];

  v31 = [[ICDebuggingItem alloc] initWithTitle:@"Reset v1 Neo Support" selector:"resetSupportsV1Neo:"];
  v32 = [[ICDebuggingItem alloc] initWithTitle:@"Migrate to Custom Password Mode" selector:"migrateToCustomPasswordMode:"];
  v33 = [[ICDebuggingItem alloc] initWithTitle:@"Migrate to Device Passcode Mode" selector:"migrateToDevicePasscodeMode:"];
  v34 = [[ICDebuggingItem alloc] initWithTitle:@"Reset Password" selector:"resetPassword:"];
  v35 = [[ICDebuggingItem alloc] initWithTitle:@"Add Diverged Attachment" selector:"addDivergedAttachment:"];
  v36 = [[ICDebuggingItem alloc] initWithTitle:@"Fix Diverged Attachments" selector:"fixDivergedAttachments:"];
  v101 = v26;
  v102 = v25;
  v168[0] = v25;
  v168[1] = v26;
  v99 = v31;
  v100 = v30;
  v168[2] = v30;
  v168[3] = v31;
  v97 = v33;
  v98 = v32;
  v168[4] = v32;
  v168[5] = v33;
  v95 = v35;
  v96 = v34;
  v168[6] = v34;
  v168[7] = v35;
  v93 = [[ICDebuggingItem alloc] initWithTitle:@"Check Keychain Sync" selector:"checkiCloudKeychainSyncStatus:"];
  v94 = v36;
  v168[8] = v36;
  v168[9] = v93;
  v92 = +[NSArray arrayWithObjects:v168 count:10];
  v151 = [[ICDebuggingSection alloc] initWithTitle:@"Password Protected Notes" items:v92];
  v37 = [[ICDebuggingItem alloc] initWithTitle:@"Pre-fetch Other-App-Indexed Hashtags" selector:"prefetchHashtagsIndexedByOtherApps:"];
  v38 = [[ICDebuggingItem alloc] initWithTitle:@"Log Other-App-Indexed Hashtags" selector:"logHashtagsIndexedByOtherApps:"];
  v39 = [[ICDebuggingItem alloc] initWithTitle:@"Delete Search Index" selector:"deleteSearchIndex:"];
  v90 = v38;
  v91 = v37;
  v167[0] = v37;
  v167[1] = v38;
  v88 = [[ICDebuggingItem alloc] initWithTitle:@"Refresh Search Index" selector:"reindexEverything:"];
  v89 = v39;
  v167[2] = v39;
  v167[3] = v88;
  v87 = [[ICDebuggingItem alloc] initWithTitle:@"Log Index" selector:"logSearchIndex:"];
  v167[4] = v87;
  v86 = +[NSArray arrayWithObjects:v167 count:5];
  v150 = [[ICDebuggingSection alloc] initWithTitle:@"Search Index" items:v86];
  v40 = [[ICDebuggingItem alloc] initWithTitle:@"Create partially supported Smart Folder" selector:"createPartiallySupportedSmartFolder:"];
  [(ICDebuggingItem *)v40 setSubtitle:@"Uses Pinned Notes Query"];
  v85 = v40;
  v166 = v40;
  v84 = +[NSArray arrayWithObjects:&v166 count:1];
  v149 = [[ICDebuggingSection alloc] initWithTitle:@"Smart Folders" items:v84];
  v41 = [[ICDebuggingItem alloc] initWithTitle:@"Delete All Tags" selector:"deleteAllTags:"];
  v82 = [[ICDebuggingItem alloc] initWithTitle:@"Regenerate Standardized Contents" selector:"regenerateStandardizedContentForAllHashtags:"];
  v83 = v41;
  v165[0] = v41;
  v165[1] = v82;
  v81 = +[NSArray arrayWithObjects:v165 count:2];
  v148 = [[ICDebuggingSection alloc] initWithTitle:@"Tags" items:v81];
  v147 = [[ICDebuggingItem alloc] initWithTitle:@"Regenerate Attachment Previews" selector:"regenerateAllAttachmentPreviewImages:"];
  v42 = [[ICDebuggingItem alloc] initWithTitle:@"Regenerate OCR" selector:"regenerateAllOCR:"];
  v43 = [[ICDebuggingItem alloc] initWithTitle:@"Regenerate Image Classifications" selector:"regenerateAllImageClassifications:"];
  v44 = [[ICDebuggingItem alloc] initWithTitle:@"Regenerate Handwriting Summaries" selector:"regenerateAllHandwritingSummaries:"];
  v45 = [[ICDebuggingItem alloc] initWithTitle:@"Purge Handwriting Summaries" selector:"purgeAllHandwritingSummaries:"];
  v46 = [[ICDebuggingItem alloc] initWithTitle:@"Regenerate System Paper Thumbnails" selector:"regenerateSystemPaperThumbnails:"];
  v47 = [[ICDebuggingItem alloc] initWithTitle:@"Generate System Paper Chrome" selector:"generateSystemPaperChrome:"];
  [(ICDebuggingItem *)v47 setPresenter:1];
  v48 = [[ICDebuggingItem alloc] initWithTitle:@"Delete Doc Cam PDFs" selector:"deleteDocCamPDFs:"];
  v49 = [[ICDebuggingItem alloc] initWithTitle:@"Generate Fallback Image For Sketches" selector:"generateFallbackImageForSketches:"];
  [(ICDebuggingItem *)v49 setSelectedDefaultsKey:ICGenerateFallbackImageForSketchesDefaultKey];
  v50 = [[ICDebuggingItem alloc] initWithTitle:@"Disable Fallback PDF Generation" selector:"generateFallbackPDFForPaperDocuments:"];
  [(ICDebuggingItem *)v50 setSelectedDefaultsKey:ICDisableFallbackPDFGenerationDefaultKey];
  v164[0] = v147;
  v79 = v43;
  v80 = v42;
  v164[1] = v42;
  v164[2] = v43;
  v77 = v45;
  v78 = v44;
  v164[3] = v44;
  v164[4] = v45;
  v75 = v47;
  v76 = v46;
  v164[5] = v46;
  v164[6] = v47;
  v73 = v49;
  v74 = v48;
  v164[7] = v48;
  v164[8] = v49;
  v72 = v50;
  v164[9] = v50;
  v71 = +[NSArray arrayWithObjects:v164 count:10];
  v51 = [[ICDebuggingSection alloc] initWithTitle:@"Thumbnails, Previews, and OCR" items:v71];
  v52 = [[ICDebuggingItem alloc] initWithTitle:@"Toggle Force Show Bluetooth Keyboard Hint" selector:"bluetoothKeyboardHint:"];
  [(ICDebuggingItem *)v52 setSubtitle:@"After note editor keyboard dismissal"];
  v70 = v52;
  v163 = v52;
  v69 = +[NSArray arrayWithObjects:&v163 count:1];
  v146 = [[ICDebuggingSection alloc] initWithTitle:@"visionOS" items:v69];
  v53 = [[ICDebuggingItem alloc] initWithTitle:@"Reset Welcome Screen State" selector:"resetWelcomeScreenState:"];
  v54 = [[ICDebuggingItem alloc] initWithTitle:@"Remove Version" selector:"removeWhatsNewVersion:"];
  v55 = [[ICDebuggingItem alloc] initWithTitle:@"Set to Current OS" selector:"setWhatsNewToCurrentOS:"];
  v56 = [[ICDebuggingItem alloc] initWithTitle:@"Set to iOS 9" selector:"setWhatsNewToIOS9:"];
  v67 = v54;
  v68 = v53;
  v162[0] = v53;
  v162[1] = v54;
  v66 = v55;
  v162[2] = v55;
  v162[3] = v56;
  v57 = +[NSArray arrayWithObjects:v162 count:4];
  v58 = [[ICDebuggingSection alloc] initWithTitle:@"Welcome and What's New Screen" items:v57];
  v59 = [[ICDebuggingItem alloc] initWithTitle:@"Crash This App" selector:"crashThisApp:"];
  v60 = [[ICDebuggingItem alloc] initWithTitle:@"Run App Removal Service" selector:"testAppRemoval:"];
  [(ICDebuggingItem *)v60 setPresenter:1];
  v161[0] = v59;
  v161[1] = v60;
  v61 = +[NSArray arrayWithObjects:v161 count:2];
  v62 = [[ICDebuggingSection alloc] initWithTitle:@"Danger Zone" items:v61];
  [(ICDebuggingSection *)v62 setDestructive:1];
  v63 = v51;
  v64 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v159, v158, v157, v156, v155, v154, v153, v152, v151, v150, v149, v148, v51, 0);
  if (+[UIDevice ic_isVision]) {
    [v64 addObject:v146];
  }
  [v64 addObject:v58];
  [v64 addObject:v62];
  id v65 = [v64 copy];
  [(ICDebuggingViewController *)self setAllSections:v65];
}

- (NSArray)filteredSections
{
  unsigned __int8 v3 = [(ICDebuggingViewController *)self searchController];
  id v4 = [v3 searchBar];
  id v5 = [v4 text];
  id v6 = [v5 lowercaseString];

  id v7 = [(ICDebuggingViewController *)self searchController];
  if (![v7 isActive])
  {

    goto LABEL_17;
  }
  id v8 = [v6 length];

  if (!v8)
  {
LABEL_17:
    id v21 = [(ICDebuggingViewController *)self allSections];
    goto LABEL_18;
  }
  uint64_t v9 = [(ICDebuggingViewController *)self allSections];
  id v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(ICDebuggingViewController *)self allSections];
  id v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v16 = [v15 title];
        id v17 = [v16 lowercaseString];

        if ([v17 containsString:v6])
        {
          [v10 addObject:v15];
        }
        else
        {
          v18 = [v15 items];
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1000B9CFC;
          v24[3] = &unk_1006289F0;
          id v25 = v6;
          id v19 = [v18 ic_objectsPassingTest:v24];

          if ([v19 count])
          {
            id v20 = [v15 copy];
            [v20 setItems:v19];
            [v10 addObject:v20];
          }
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  id v21 = [v10 copy];
LABEL_18:

  return (NSArray *)v21;
}

- (void)setCanShowRecentItems:(BOOL)a3
{
  if (self->_canShowRecentItems != a3)
  {
    self->_canShowRecentItems = a3;
    [(ICDebuggingViewController *)self reloadDataAnimated:0];
  }
}

- (BOOL)shouldShowRecentItems
{
  if (![(ICDebuggingViewController *)self canShowRecentItems]) {
    return 0;
  }
  unsigned __int8 v3 = [(ICDebuggingViewController *)self recentItems];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)resetAutoSortChecklistAlert:(id)a3
{
  +[ICTextController setChecklistAutoAlertShown:0];

  +[ICTextController setChecklistAutoSortEnabled:0];
}

- (void)resetRecentlyDeletedWarning:(id)a3
{
}

- (void)resetUpdateDrawingsAlert:(id)a3
{
  unsigned __int8 v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObjectForKey:kICDidAlertAboutUpdatingDrawingsFall2021];

  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObjectForKey:kICDidAlertAboutUpdatingDrawingsFall2022];
}

- (void)testAllowNotificationsWarmingSheet:(id)a3
{
  id v3 = +[ICAppDelegate sharedInstance];
  [v3 showAllowNotificationsWarmingSheet:&stru_100628A10];
}

- (void)testNotificationsNotAllowedAlert:(id)a3
{
  id v3 = +[ICAppDelegate sharedInstance];
  id v4 = [v3 viewControllerManagers];
  id v7 = [v4 firstObject];

  id v5 = [v7 folderListViewController];
  id v6 = [v5 collectionView];

  [v6 setShouldShowAllowNotificationsView:1];
}

- (void)testTTR:(id)a3
{
}

- (void)dumpAnalyticsIdentifiers:(id)a3
{
  id v3 = +[ICNAIdentityManager sharedManager];
  [v3 debug_dumpIdentifiers];
}

- (void)regenerateAnalyticsIdentifiers:(id)a3
{
  id v3 = +[ICNAIdentityManager sharedManager];
  [v3 debug_forceRegenerateIdentifiers];
}

- (void)clearAnalyticsIdentifiers:(id)a3
{
  id v3 = +[ICNAIdentityManager sharedManager];
  [v3 debug_clearIdentifiers];
}

- (void)simulateBackgroundSnapshot:(id)a3
{
  id v5 = +[ICNASnapshotBackgroundTask makeTaskRequest];
  id v3 = +[BGTaskScheduler sharedScheduler];
  id v4 = [v5 identifier];
  [v3 _simulateLaunchForTaskWithIdentifier:v4];
}

- (void)simulateBackgroundSnapshotExpiration:(id)a3
{
  id v5 = +[ICNASnapshotBackgroundTask makeTaskRequest];
  id v3 = +[BGTaskScheduler sharedScheduler];
  id v4 = [v5 identifier];
  [v3 _simulateExpirationForTaskWithIdentifier:v4];
}

- (void)triggerCloudOperationEndEventWithNilErrorDomain:(id)a3
{
  id v3 = objc_alloc((Class)ICASAccountData);
  id v4 = [objc_alloc((Class)ICASAccountType) initWithAccountType:1];
  id v5 = [v3 initWithAccountType:v4 accountID:@"Test_Account_ID_For_Nil_Error_Domain"];

  id v6 = objc_alloc((Class)ICASCloudOperationData);
  id v7 = [objc_alloc((Class)ICASOperationType) initWithOperationType:5];
  id v8 = [v6 initWithOperationID:@"Test_Operation_ID_For_Nil_Error_Domain" operationType:v7 operationGroupName:@"Test_Group_Name_For_Nil_Error_Domain"];

  id v9 = [objc_alloc((Class)ICASCloudSyncableData) initWithSyncableDataSummary:&__NSArray0__struct];
  id v10 = +[NSString stringWithFormat:@"%@_%ld", 0, 7];
  id v11 = objc_alloc((Class)ICASFullErrorData);
  id v12 = +[NSNumber numberWithInteger:7];
  id v13 = [v11 initWithFullErrorCode:v12 errorString:v10];

  id v14 = [objc_alloc((Class)ICASErrorStatus) initWithErrorStatus:3];
  id v15 = [objc_alloc((Class)ICASCloudErrorData) initWithErrorStatus:v14];
  v16 = +[ICNAController sharedController];
  uint64_t v17 = objc_opt_class();
  v19[0] = v5;
  v19[1] = v8;
  v19[2] = v9;
  v19[3] = v13;
  v19[4] = v15;
  v18 = +[NSArray arrayWithObjects:v19 count:5];
  [v16 submitEventOfType:v17 pushThenPopDataObjects:v18 subTracker:0];
}

- (void)syncLocalWithCloud:(id)a3
{
  id v3 = +[ICCloudContext sharedContext];
  [v3 syncWithReason:@"DebugMenu-RefreshFromCloud" completionHandler:0];
}

- (void)pushEverythingToCloud:(id)a3
{
}

- (void)deleteServerChangeTokens:(id)a3
{
  id v3 = +[ICCloudContext sharedContext];
  [v3 clearZoneFetchState];

  id v4 = +[ICCloudContext sharedContext];
  [v4 deleteAllServerChangeTokens];
}

- (void)setCloudConfiguration:(id)a3
{
  id v3 = +[UIAlertController alertControllerWithTitle:@"Cloud Configuration" message:@"How often would you like to sync your notes?" preferredStyle:1];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = +[ICCloudConfiguration availableConfigurationURLs];
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v9 = [v8 lastPathComponent];
        id v10 = [v9 stringByDeletingPathExtension];

        id v11 = +[ICCloudConfiguration defaultConfigurationURL];
        unsigned int v12 = [v8 isEqual:v11];

        if (v12)
        {
          uint64_t v13 = +[NSString localizedStringWithFormat:@"✓ %@", v10];

          id v10 = (void *)v13;
        }
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000BA7A4;
        v18[3] = &unk_100626AC0;
        void v18[4] = v8;
        id v14 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v18];
        [v3 addAction:v14];
      }
      id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  id v15 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v3 addAction:v15];

  [(ICDebuggingViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)resetServerSideUpdateTaskState:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  id v5 = [v3 managedObjectContext];

  id v4 = [[ICServerSideUpdateTaskController alloc] initWithWorkerContext:v5];
  [(ICServerSideUpdateTaskController *)v4 resetState];
}

- (void)purgeEverything:(id)a3
{
}

- (void)deleteEverything:(id)a3
{
}

- (void)loadTestData:(id)a3
{
  id v4 = a3;
  id v5 = +[UIAlertController alertControllerWithTitle:@"Load Test Data" message:@"Select a set of test data to load" preferredStyle:0];
  uint64_t v6 = [v5 popoverPresentationController];
  id v15 = v4;
  [v6 setSourceView:v4];

  [(ICDebuggingViewController *)self URLsForTestDataDirectories];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unsigned int v12 = [v11 lastPathComponent];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000BAC78;
        v17[3] = &unk_100626A98;
        v17[4] = self;
        v17[5] = v11;
        uint64_t v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v17];
        [v5 addAction:v13];
      }
      id v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  id v14 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v5 addAction:v14];

  [(ICDebuggingViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (id)URLsForTestDataDirectories
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 resourceURL];
  id v4 = [v3 URLByAppendingPathComponent:@"TestData" isDirectory:1];

  id v5 = +[NSFileManager defaultManager];
  uint64_t v6 = [v5 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:5 errorHandler:0];

  id v7 = [v6 allObjects];

  return v7;
}

- (void)importTestDataFromDirectoryAtURL:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  id v5 = [v4 enumeratorAtURL:v3 includingPropertiesForKeys:0 options:5 errorHandler:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 allObjects];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
        unsigned int v12 = +[ICNoteContext sharedContext];
        id v13 = [v12 importNoteFromFileAtURL:v11];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)addSomeRandomNotes:(unint64_t)a3 toFolder:(id)a4
{
  if (a3)
  {
    unint64_t v5 = a3;
    do
    {
      id v7 = [(ICDebuggingViewController *)self addRandomNoteToFolder:a4];
      --v5;
    }
    while (v5);
  }
  id v8 = +[ICNoteContext sharedContext];
  [v8 save];
}

- (id)addRandomNoteToFolder:(id)a3
{
  id v3 = +[ICNote newEmptyNoteInFolder:a3];
  id v4 = +[NSDate date];
  [v3 setCreationDate:v4];

  unint64_t v5 = +[NSDate date];
  [v3 setModificationDate:v5];

  uint64_t v6 = [v3 textStorage];
  [v6 setWantsUndoCommands:0];

  id v8 = sub_1000BB0A0(v7, 8);
  uint64_t v9 = sub_1000BB0A0((uint64_t)v8, 10);
  id v10 = +[NSString localizedStringWithFormat:@"%@\n%@", v8, v9];

  uint64_t v11 = [v3 textStorage];
  unsigned int v12 = [v3 textStorage];
  [v11 replaceCharactersInRange:0 withString:v10];

  id v13 = [v3 textStorage];
  [v13 setWantsUndoCommands:1];

  [v3 updateChangeCountWithReason:@"Created random note"];

  return v3;
}

- (void)addSomeFoldersWithRandomNotesToAllModernAccounts:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = +[ICNoteContext sharedContext];
  unint64_t v5 = [v4 managedObjectContext];
  uint64_t v6 = +[ICAccount allAccountsInContext:v5];

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(ICDebuggingViewController *)self addFolders:50 toAccount:*(void *)(*((void *)&v12 + 1) + 8 * (void)v10) maxNotesInFolder:100];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  uint64_t v11 = +[ICNoteContext sharedContext];
  [v11 save];
}

- (void)addFolders:(unint64_t)a3 toAccount:(id)a4 maxNotesInFolder:(unint64_t)a5
{
  id v12 = a4;
  if (a3)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = +[NSString localizedStringWithFormat:@"Random Folder %lu", v8];
      id v10 = +[ICFolder newFolderInAccount:v12];
      [v10 setTitle:v9];
      uint64_t v11 = +[NSDate date];
      [v10 setDateForLastTitleModification:v11];

      [(ICDebuggingViewController *)self addSomeRandomNotes:arc4random() % a5 toFolder:v10];
      ++v8;
    }
    while (a3 != v8);
  }
}

- (void)addSomeRandomNotes:(id)a3
{
  id v4 = +[ICNoteContext sharedContext];
  unint64_t v5 = [v4 managedObjectContext];
  id v10 = +[ICAccount localAccountInContext:v5];

  uint64_t v6 = v10;
  if (v10) {
    goto LABEL_3;
  }
  id v7 = +[ICNoteContext sharedContext];
  uint64_t v8 = [v7 managedObjectContext];
  id v11 = +[ICAccount cloudKitAccountInContext:v8];

  uint64_t v6 = v11;
  if (v11)
  {
LABEL_3:
    id v12 = v6;
    uint64_t v9 = [v6 defaultFolder];
    [(ICDebuggingViewController *)self addSomeRandomNotes:1000 toFolder:v9];
  }
}

- (void)disableDebuggingSearchAnimation:(id)a3
{
}

- (void)toggleGreyParrotUI:(id)a3
{
}

- (void)fakeIncompatibleDevices:(id)a3
{
  id v5 = +[ICCompatibilityController sharedController];
  uint64_t v3 = [v5 fakesIncompatibleDevicesForDebugging] ^ 1;
  id v4 = +[ICCompatibilityController sharedController];
  [v4 setFakesIncompatibleDevicesForDebugging:v3];
}

- (void)migratePrimaryICloudAccount:(id)a3
{
  uint64_t v3 = +[ICAccountUtilities sharedInstance];
  id v6 = [v3 primaryICloudACAccount];

  id v4 = [v6 identifier];
  if (v4)
  {
    id v5 = +[ICMigrationController sharedController];
    [v5 startMigrationForICloudAccountID:v4];
  }
}

- (void)migrateLocalAccount:(id)a3
{
  +[ICMigrationController setDidChooseToMigrateLocalAccount:1];
  +[ICMigrationController setDidMigrateLocalAccount:0];

  +[ICMigrationController migrateLocalAccountIfNecessary];
}

- (void)deleteMigratedDuplicates:(id)a3
{
  uint64_t v3 = objc_alloc_init(ICDebugSpinner);
  [(ICDebugSpinner *)v3 show];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BB6F4;
  v5[3] = &unk_100625AF0;
  id v6 = v3;
  id v4 = v3;
  +[ICDebugUtilities deleteMigratedDuplicatesWithCompletionHandler:v5];
}

- (void)resetLocalAccountMigration:(id)a3
{
}

- (void)resetPencilUnsupportedAlertState:(id)a3
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObjectForKey:@"hasShownPencilUnsupportedAlertForHTMLNote"];
}

- (void)showSimplifiedUITextViewEditor:(id)a3
{
  id v7 = objc_alloc_init(ICUITextViewDebuggingViewController);
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:@"Done" style:2 target:v7 action:"dismiss:"];
  id v6 = [(ICUITextViewDebuggingViewController *)v7 navigationItem];
  [v6 setLeftBarButtonItem:v5];

  [(ICDebuggingViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)showSimplifiedWebEditor:(id)a3
{
  id v7 = objc_alloc_init(ICWKWebViewDebuggingViewController);
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:@"Done" style:2 target:v7 action:"dismiss:"];
  id v6 = [(ICWKWebViewDebuggingViewController *)v7 navigationItem];
  [v6 setLeftBarButtonItem:v5];

  [(ICDebuggingViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)startFresh:(id)a3
{
}

- (void)sendStateOfTheWorld:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ICDebugSpinner);
  [(ICDebugSpinner *)v5 show];
  id v6 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BBD1C;
  block[3] = &unk_100625A00;
  id v10 = v5;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(v6, block);
}

- (void)toggleNonContiguousLayout:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  uint64_t v6 = ICViewControllerUseNonContiguousLayoutDefaultKey;
  uint64_t v23 = ICViewControllerUseNonContiguousLayoutDefaultKey;
  id v24 = &__kCFBooleanTrue;
  id v7 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  [v5 registerDefaults:v7];

  uint64_t v8 = +[NSUserDefaults standardUserDefaults];
  unsigned int v9 = [v8 BOOLForKey:v6];

  if (v9) {
    CFStringRef v10 = @"on";
  }
  else {
    CFStringRef v10 = @"off";
  }
  if (v9) {
    CFStringRef v11 = @"off";
  }
  else {
    CFStringRef v11 = @"on";
  }
  id v12 = +[NSString localizedStringWithFormat:@"Non-contiguous layout is %@.", v10];
  long long v13 = +[NSString localizedStringWithFormat:@"Would you like to turn it %@?", v11];
  long long v14 = +[UIAlertController alertControllerWithTitle:v12 message:v13 preferredStyle:0];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000BC398;
  v21[3] = &unk_100628AB0;
  char v22 = v9;
  long long v15 = +[UIAlertAction actionWithTitle:@"Yes" style:0 handler:v21];
  [v14 addAction:v15];

  long long v16 = +[UIAlertAction actionWithTitle:@"No" style:1 handler:0];
  [v14 addAction:v16];

  if (+[UIDevice ic_isVision]) {
    uint64_t v17 = -2;
  }
  else {
    uint64_t v17 = 7;
  }
  [v14 setModalPresentationStyle:v17];
  [(ICDebuggingViewController *)self presentViewController:v14 animated:1 completion:0];
  long long v18 = [v14 popoverPresentationController];
  objc_opt_class();
  long long v19 = ICDynamicCast();

  long long v20 = [v19 viewForFirstBaselineLayout];
  [v18 setSourceView:v20];

  [v18 setPermittedArrowDirections:3];
}

- (void)removeAccountPassword:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];

  id v5 = +[ICAccount allAccountsInContext:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      unsigned int v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [objc_alloc((Class)ICAccountPassphraseManager) initWithAccount:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)];
        [v10 removePassphrase];

        unsigned int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  CFStringRef v11 = +[ICCloudContext sharedContext];
  [v11 syncWithReason:@"DebugMenu-RemoveAccountPassword" completionHandler:&stru_100628AD0];
}

- (void)resetLockedNotesMode:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];
  id v5 = +[ICAccount allAccountsInContext:v4];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v10 setResolvedLockedNotesMode:0];
        +[ICAuthenticationAlert resetPresentationsForAccount:v10];
        CFStringRef v11 = [v10 managedObjectContext];
        [v11 ic_save];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)toggleSupportsV1Neo:(id)a3
{
  id v4 = +[ICNoteContext sharedContext];
  id v5 = [v4 managedObjectContext];
  id v6 = +[ICAccount allActiveAccountsInContext:v5];

  unsigned int v7 = [v6 ic_allSatisfy:&stru_100628AF0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    uint64_t v12 = v7 ^ 1;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v14 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v13) accountDataCreateIfNecessary];
        [v14 setSupportsV1Neo:v12];

        long long v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [(ICDebuggingViewController *)self setUpDebuggingItems];
}

- (void)resetSupportsV1Neo:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];
  id v5 = +[ICAccount allActiveAccountsInContext:v4];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
        uint64_t v12 = +[ICCompatibilityController sharedController];
        [v12 clearCachedDevicesForAccount:v11];

        long long v13 = [v11 accountDataCreateIfNecessary];
        long long v14 = ICKeyPathFromSelector();
        [v13 setPrimitiveValue:0 forKey:v14];

        long long v15 = [v11 accountDataCreateIfNecessary];
        [v15 updateSupportsV1Neo:0];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)migrateToCustomPasswordMode:(id)a3
{
  id v4 = +[ICNoteContext sharedContext];
  id v5 = [v4 managedObjectContext];
  id v6 = +[ICAccount allAccountsInContext:v5];

  [(ICDebuggingViewController *)self migrateAccounts:v6 toMode:1];
}

- (void)migrateToDevicePasscodeMode:(id)a3
{
  id v4 = +[ICNoteContext sharedContext];
  id v5 = [v4 managedObjectContext];
  id v6 = +[ICAccount allAccountsInContext:v5];

  [(ICDebuggingViewController *)self migrateAccounts:v6 toMode:2];
}

- (void)migrateAccounts:(id)a3 toMode:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [v6 firstObject];
  if (v7)
  {
    id v8 = [(ICDebuggingViewController *)self navigationController];
    uint64_t v9 = [v8 view];
    id v10 = [v9 window];

    uint64_t v11 = +[ICAuthenticationPrompt promptForChangingMode:v4 account:v7];
    uint64_t v12 = +[ICAuthentication shared];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000BCD2C;
    v14[3] = &unk_100628B68;
    __int16 v19 = v4;
    id v15 = v7;
    id v16 = v10;
    long long v17 = self;
    id v18 = v6;
    id v13 = v10;
    [v12 authenticateWithPrompt:v11 displayWindow:v13 completionHandler:v14];
  }
}

- (void)resetPassword:(id)a3
{
  uint64_t v4 = +[ICNoteContext sharedContext];
  id v5 = [v4 managedObjectContext];
  id v6 = +[ICAccount allActiveAccountsInContext:v5];
  id v7 = [v6 firstObject];

  id v8 = +[ICAuthenticationPrompt promptForIntent:6 object:v7];
  uint64_t v9 = +[ICAuthentication shared];
  id v10 = [(ICDebuggingViewController *)self view];
  uint64_t v11 = [v10 window];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BD0F8;
  v13[3] = &unk_100628B90;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v9 authenticateWithPrompt:v8 displayWindow:v11 completionHandler:v13];
}

- (void)addDivergedAttachment:(id)a3
{
  id v4 = a3;
  id v5 = +[ICNoteContext sharedContext];
  id v6 = [v5 currentNote];

  if ([v6 isPasswordProtected] && objc_msgSend(v6, "isAuthenticated"))
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_1000BD414;
    v17[4] = sub_1000BD424;
    id v18 = 0;
    id v7 = ICUnlocalizedString();
    id v8 = +[UIAlertController alertControllerWithTitle:v7 message:0 preferredStyle:1];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000BD42C;
    v16[3] = &unk_100628BB8;
    void v16[4] = v17;
    [v8 addTextFieldWithConfigurationHandler:v16];
    uint64_t v9 = ICUnlocalizedString();
    id v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:0];
    [v8 addAction:v10];

    uint64_t v11 = ICUnlocalizedString();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000BD4C0;
    v13[3] = &unk_100628BE0;
    id v14 = v6;
    id v15 = v17;
    id v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v13];
    [v8 addAction:v12];

    [(ICDebuggingViewController *)self presentViewController:v8 animated:1 completion:0];
    _Block_object_dispose(v17, 8);
  }
}

- (void)fixDivergedAttachments:(id)a3
{
  id v4 = a3;
  id v5 = +[ICNoteContext sharedContext];
  id v6 = [v5 currentNote];

  if ([v6 isPasswordProtected] && objc_msgSend(v6, "isAuthenticated"))
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_1000BD414;
    v17[4] = sub_1000BD424;
    id v18 = 0;
    id v7 = ICUnlocalizedString();
    id v8 = +[UIAlertController alertControllerWithTitle:v7 message:0 preferredStyle:1];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000BD928;
    v16[3] = &unk_100628BB8;
    void v16[4] = v17;
    [v8 addTextFieldWithConfigurationHandler:v16];
    uint64_t v9 = ICUnlocalizedString();
    id v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:0];
    [v8 addAction:v10];

    uint64_t v11 = ICUnlocalizedString();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000BD9BC;
    v13[3] = &unk_100628C08;
    id v15 = v17;
    id v14 = v6;
    id v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v13];
    [v8 addAction:v12];

    [(ICDebuggingViewController *)self presentViewController:v8 animated:1 completion:0];
    _Block_object_dispose(v17, 8);
  }
}

- (void)checkiCloudKeychainSyncStatus:(id)a3
{
  id v4 = +[ICNoteContext sharedContext];
  id v5 = [v4 managedObjectContext];

  +[ICAccount allActiveCloudKitAccountsInContext:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned int v11 = +[ICKeychain isSyncAvailableForAccount:v10];
        id v12 = [v10 accountName];
        if (v11) {
          CFStringRef v13 = @"Healthy";
        }
        else {
          CFStringRef v13 = @"Unhealthy";
        }
        +[UIAlertController ic_showAlertWithTitle:v12 message:v13 viewController:self];
      }
      id v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)reindexEverything:(id)a3
{
  id v3 = +[ICReindexer reindexer];
  [v3 reindexAllSearchableItemsWithCompletionHandler:0];
}

- (void)logSearchIndex:(id)a3
{
  id v3 = dispatch_get_global_queue(2, 0);
  dispatch_async(v3, &stru_100628C28);
}

- (void)deleteSearchIndex:(id)a3
{
  id v3 = objc_alloc_init(ICDebugSpinner);
  [(ICDebugSpinner *)v3 show];
  id v4 = +[ICReindexer reindexer];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BDEE4;
  v6[3] = &unk_100628C50;
  id v7 = v3;
  id v5 = v3;
  [v4 deleteAllSearchableItemsWithCompletionHandler:v6];
}

- (void)prefetchHashtagsIndexedByOtherApps:(id)a3
{
  +[ICCrossAppHashtagManager prefetchHashtagDisplayTextsFromOtherApps];
  id v3 = os_log_create("com.apple.notes", "Internal");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1004DA704(v3);
  }
}

- (void)logHashtagsIndexedByOtherApps:(id)a3
{
  id v3 = +[ICCrossAppHashtagManager hashtagDisplayTextsFromOtherApps];
  id v4 = os_log_create("com.apple.notes", "Internal");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1004DA748();
  }
}

- (void)createPartiallySupportedSmartFolder:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];
  id v5 = +[ICAccount defaultAccountInContext:v4];
  +[ICQuery queryForPinnedNotes:1 allowsRecentlyDeleted:0];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000BE0DC;
  v9[3] = &unk_100625A00;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v5;
  id v12 = v4;
  id v6 = v4;
  id v7 = v5;
  id v8 = v10;
  [v6 performBlockAndWait:v9];
}

- (void)deleteAllTags:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BE1F8;
  v6[3] = &unk_100625AF0;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

- (void)regenerateStandardizedContentForAllHashtags:(id)a3
{
  id v4 = +[ICNoteContext sharedContext];
  id v3 = [v4 managedObjectContext];
  +[ICHashtag regenerateStandardizedContentForAllHashtagsInContext:v3 hasChanges:0];
}

- (void)generateFallbackImageForSketches:(id)a3
{
}

- (void)generateFallbackPDFForPaperDocuments:(id)a3
{
}

- (void)regenerateAllAttachmentPreviewImages:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];

  +[ICAttachmentPreviewImage purgeAllAttachmentPreviewImagesInContext:v4];
  id v5 = +[ICAttachmentPreviewGenerator sharedGenerator];
  [v5 generatePreviewsIfNeeded];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BE470;
  v7[3] = &unk_100625AF0;
  id v8 = v4;
  id v6 = v4;
  [v6 performBlockAndWait:v7];
}

- (void)regenerateAllOCR:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];

  +[ICAttachmentPreviewGenerator purgeOCRInContext:v4];
  id v5 = +[ICAttachmentPreviewGenerator sharedGenerator];
  [v5 generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext:v4];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BE550;
  v7[3] = &unk_100625AF0;
  id v8 = v4;
  id v6 = v4;
  [v6 performBlockAndWait:v7];
}

- (void)regenerateAllImageClassifications:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];

  +[ICAttachmentPreviewGenerator purgeImageClassificationsInContext:v4];
  id v5 = +[ICAttachmentPreviewGenerator sharedGenerator];
  [v5 generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext:v4];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BE630;
  v7[3] = &unk_100625AF0;
  id v8 = v4;
  id v6 = v4;
  [v6 performBlockAndWait:v7];
}

- (void)regenerateAllHandwritingSummaries:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 workerManagedObjectContext];

  +[ICAttachment purgeHandwritingSummariesInContext:v4];
  id v5 = +[ICPaperSearchIndexer shared];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BE714;
  v7[3] = &unk_100625AF0;
  id v8 = v4;
  id v6 = v4;
  [v5 updateIndexWithManagedObjectContext:v6 completionHandler:v7];
}

- (void)purgeAllHandwritingSummaries:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 workerManagedObjectContext];

  +[ICAttachment purgeHandwritingSummariesInContext:v4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BE85C;
  v6[3] = &unk_100625AF0;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

- (void)regenerateSystemPaperThumbnails:(id)a3
{
  id v3 = +[ICSystemPaperThumbnailService sharedService];
  [v3 invalidate];

  id v4 = +[ICSystemPaperThumbnailService sharedService];
  [v4 updateIfNeededForNote:0 completion:0];
}

- (void)generateSystemPaperChrome:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_TtC11MobileNotes33ICSystemPaperChromeLayerGenerator);
  id v11 = 0;
  id v6 = [(ICSystemPaperChromeLayerGenerator *)v5 generateChromeThumbnailsWithError:&v11];
  id v7 = v11;
  if (v7)
  {
    id v8 = os_log_create("com.apple.notes", "Thumbnails");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1004DA7BC();
    }
  }
  else
  {
    id v8 = [objc_alloc((Class)UIActivityViewController) initWithActivityItems:v6 applicationActivities:&__NSArray0__struct];
    v12[0] = UIActivityTypeOpenInIBooks;
    v12[1] = ICActivityTypeShareToNote;
    v12[2] = UIActivityTypeSharePlay;
    uint64_t v9 = +[NSArray arrayWithObjects:v12 count:3];
    [v8 setExcludedActivityTypes:v9];

    id v10 = [v8 popoverPresentationController];
    [v10 setSourceView:v4];

    [(ICDebuggingViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (void)deleteDocCamPDFs:(id)a3
{
}

- (void)bluetoothKeyboardHint:(id)a3
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = ICBluetoothKeyboardHintViewControllerForceShowDefaultsKey;
  unsigned int v5 = [v3 BOOLForKey:ICBluetoothKeyboardHintViewControllerForceShowDefaultsKey];

  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 setBool:v5 ^ 1 forKey:v4];
}

- (void)removeWhatsNewVersion:(id)a3
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v3 = +[ICStartupController lastShownStartupDefaultsKey];
  [v4 removeObjectForKey:v3];
}

- (void)setWhatsNewToCurrentOS:(id)a3
{
  id v3 = +[NSProcessInfo processInfo];
  id v4 = v3;
  if (v3) {
    [v3 operatingSystemVersion];
  }

  unsigned int v5 = +[NSNumber numberWithInteger:0];
  v11[0] = v5;
  id v6 = +[NSNumber numberWithInteger:0];
  v11[1] = v6;
  id v7 = +[NSNumber numberWithInteger:0];
  v11[2] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:3];

  uint64_t v9 = +[NSUserDefaults standardUserDefaults];
  id v10 = +[ICStartupController lastShownStartupDefaultsKey];
  [v9 setObject:v8 forKey:v10];
}

- (void)setWhatsNewToIOS9:(id)a3
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v3 = +[ICStartupController lastShownStartupDefaultsKey];
  [v4 setObject:&off_10064B5D8 forKey:v3];
}

- (void)resetWelcomeScreenState:(id)a3
{
}

- (void)crashThisApp:(id)a3
{
}

- (void)testAppRemoval:(id)a3
{
  id v4 = +[UIAlertController alertControllerWithTitle:@"Test Notes App Removal" message:@"This will delete all Notes app data. Local notes will be lost!" preferredStyle:1];
  unsigned int v5 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v4 addAction:v5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BEE70;
  v7[3] = &unk_100626AC0;
  void v7[4] = self;
  id v6 = +[UIAlertAction actionWithTitle:@"Continue" style:0 handler:v7];
  [v4 addAction:v6];

  [(ICDebuggingViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (BOOL)canShowRecentItems
{
  return self->_canShowRecentItems;
}

- (NSArray)allSections
{
  return self->_allSections;
}

- (void)setAllSections:(id)a3
{
}

- (void)setFilteredSections:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_filteredSections, 0);
  objc_storeStrong((id *)&self->_allSections, 0);

  objc_storeStrong((id *)&self->_searchController, 0);
}

@end