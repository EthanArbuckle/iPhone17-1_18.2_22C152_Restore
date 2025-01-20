uint64_t sub_100002250(uint64_t a1)
{
  uint64_t vars8;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _UIApplicationIsAccountBased();

  return kdebug_trace();
}

id sub_1000022A0(uint64_t a1)
{
  [*(id *)(a1 + 32) checkInLaunchTasksIfNecessary];
  [*(id *)(a1 + 32) displayContactIfNecessary];
  [*(id *)(a1 + 32) performMigrationOfFacebookContactsToLocalStoreIfNecessary];
  [*(id *)(a1 + 32) createShowMeCardApplicationShortcutIfNecessary];
  v2 = *(void **)(a1 + 32);

  return [v2 executeAllDelayedActions];
}

void sub_100002504(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contactStoreDataSource];
  [v1 setShouldRevalidateFilterOnStoreChange:0];
}

uint64_t start(int a1, char **a2)
{
  +[CNApplication prewarmResourcesForLaunch];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, @"CNApplication", v6);

  return v7;
}

void sub_100002CDC(id a1)
{
  id v1 = [(id)qword_100025B68 currentSnapshot];
  v2 = (void *)qword_100025B68;
  v3 = +[CNContactListViewController descriptorForRequiredKeysForPreferredForNameMeContact];
  uint64_t v7 = v3;
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  id v5 = [v2 preferredForNameMeContactWithKeysToFetch:v4];

  v6 = (void *)qword_100025B68;
  qword_100025B68 = 0;
}

void sub_100002E5C(uint64_t a1)
{
  kdebug_trace();
  id v2 = [*(id *)(a1 + 32) newContactStoreDataSourceForSplitViewController];
  v3 = (void *)qword_100025B68;
  qword_100025B68 = (uint64_t)v2;

  id v4 = +[CNContactNavigationController newContactFormatter];
  [(id)qword_100025B68 setContactFormatter:v4];

  id v5 = [(id)qword_100025B68 store];
  id v6 = +[CNContactStoreFilter contactStoreFilterFromPreferencesWithContactStore:v5];

  if (v6) {
    [(id)qword_100025B68 setFilter:v6];
  }
  kdebug_trace();
}

id sub_100004A60(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setNeedsUpdateOfMultitaskingDragExclusionRects];
}

uint64_t sub_100004A68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004A7C(id a1)
{
  qword_100025B88 = (uint64_t)os_log_create("com.apple.contactsui", "scene");

  _objc_release_x1();
}

void sub_100004E30(id a1)
{
  qword_100025B50 = (uint64_t)os_log_create("com.apple.contactsui", "ContactsURLParser");

  _objc_release_x1();
}

void sub_10000542C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id sub_100005A70(uint64_t a1)
{
  [*(id *)(a1 + 32) willStartTest];
  id v2 = *(void **)(a1 + 32);

  return [v2 startSearchQuery];
}

void sub_100005BA0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allSearchQueries];
  v3 = [v2 objectAtIndex:[*(id *)(a1 + 32) currentQueryIndex]];

  uint64_t v4 = +[NSString stringWithFormat:@"search for \"%@\"", v3];
  double Current = CFAbsoluteTimeGetCurrent();
  [*(id *)(a1 + 32) lastSearchBeginTime];
  uint64_t v7 = +[NSNumber numberWithDouble:Current - v6];
  v8 = [*(id *)(a1 + 32) extraResults];
  [v8 setValue:v7 forKey:v4];

  v9 = (char *)[*(id *)(a1 + 32) currentQueryIndex];
  v10 = [*(id *)(a1 + 32) allSearchQueries];
  v11 = (char *)[v10 count] - 1;

  if (v9 >= v11)
  {
    v12 = (void *)UIApp;
    v13 = [*(id *)(a1 + 32) testOptions];
    v14 = [v13 objectForKeyedSubscript:@"testName"];
    v15 = [*(id *)(a1 + 32) extraResults];
    [v12 finishedTest:v14 extraResults:v15];

    v16 = [*(id *)(a1 + 32) contactNavigationController];
    v17 = [v16 contactListViewController];
    [v17 cancelSearch:0];
  }
  else
  {
    [*(id *)(a1 + 32) setCurrentQueryIndex:[*(id *)(a1 + 32) currentQueryIndex] + 1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005DC0;
    block[3] = &unk_10001C488;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_100005DC0(uint64_t a1)
{
  return [*(id *)(a1 + 32) startSearchQuery];
}

void sub_100005F38(id a1)
{
  qword_100025B60 = (uint64_t)os_log_create("com.apple.contactsui", "app");

  _objc_release_x1();
}

BOOL sub_100006078(id a1, UIScene *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  uint64_t v4 = v3;
  if ([(UIScene *)v4 _isKeyWindowScene]) {
    BOOL v5 = [(UIScene *)v4 activationState] == UISceneActivationStateForegroundActive;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

id sub_100006324(uint64_t a1)
{
  [*(id *)(a1 + 32) willStartTest];
  id v2 = *(void **)(a1 + 32);

  return [v2 performTest];
}

void sub_100006514(uint64_t a1)
{
  id v2 = (void *)UIApp;
  v3 = [*(id *)(a1 + 32) testOptions];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"testName"];
  [v2 finishedSubTest:@"Create New Contact" forTest:v4];

  BOOL v5 = [*(id *)(a1 + 32) contactSplitViewController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000065FC;
  v6[3] = &unk_10001C488;
  v6[4] = *(void *)(a1 + 32);
  [v5 dismissViewControllerAnimated:1 completion:v6];
}

id sub_1000065FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:"performTest" withObject:0 afterDelay:1.0];
}

void sub_1000068F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100006920(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didShow:v3];
}

void sub_10000697C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactNavigationController];
  [v2 showCardForContact:*(void *)(a1 + 40) animated:0];

  if ([*(id *)(a1 + 32) isIPad])
  {
    id v3 = [*(id *)(a1 + 32) contactSplitViewController];
    id v4 = [v3 presentedContactViewController];

    [*(id *)(a1 + 32) editAndScrollContactViewController:v4];
  }
}

void sub_100006D00(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contentViewController];
  id v3 = [v2 contactView];

  [*(id *)(a1 + 40) performScrollTestWithScrollView:v3 completionBlock:0];
}

void sub_100007054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10000707C(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didShow:v3];
}

void sub_1000070D8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactNavigationController];
  [v2 showCardForContact:*(void *)(a1 + 40) animated:0];

  if ([*(id *)(a1 + 32) isIPad])
  {
    id v3 = [*(id *)(a1 + 32) contactSplitViewController];
    id v4 = [v3 presentedContactViewController];

    [*(id *)(a1 + 32) scrollContactViewController:v4];
  }
}

id sub_10000745C(uint64_t a1)
{
  return [*(id *)(a1 + 32) performScrollTestWithScrollView:*(void *)(a1 + 40) completionBlock:0];
}

id sub_100007614(uint64_t a1)
{
  [*(id *)(a1 + 32) willStartTest];
  id v2 = *(void **)(a1 + 32);

  return [v2 startSearchQuery];
}

void sub_100007760(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allSearchQueries];
  id v3 = [v2 objectAtIndex:[*(id *)(a1 + 32) currentQueryIndex]];

  id v4 = +[NSString stringWithFormat:@"search for \"%@\"", v3];
  double Current = CFAbsoluteTimeGetCurrent();
  [*(id *)(a1 + 32) lastSearchBeginTime];
  uint64_t v7 = +[NSNumber numberWithDouble:Current - v6];
  v8 = [*(id *)(a1 + 32) extraResults];
  [v8 setValue:v7 forKey:v4];

  kdebug_trace();
  v9 = (char *)[*(id *)(a1 + 32) currentQueryIndex];
  v10 = [*(id *)(a1 + 32) allSearchQueries];
  v11 = (char *)[v10 count] - 1;

  if (v9 >= v11)
  {
    v12 = (void *)UIApp;
    v13 = [*(id *)(a1 + 32) testOptions];
    v14 = [v13 objectForKeyedSubscript:@"testName"];
    v15 = [*(id *)(a1 + 32) extraResults];
    [v12 finishedTest:v14 extraResults:v15];

    v16 = [*(id *)(a1 + 32) contactNavigationController];
    v17 = [v16 contactListViewController];
    [v17 cancelSearch:0];
  }
  else
  {
    [*(id *)(a1 + 32) setCurrentQueryIndex:[*(id *)(a1 + 32) currentQueryIndex] + 1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000799C;
    block[3] = &unk_10001C488;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_10000799C(uint64_t a1)
{
  return [*(id *)(a1 + 32) startSearchQuery];
}

void sub_1000083EC(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) contactNavigationController];
  id v2 = [*(id *)(a1 + 32) displayedContact];
  LOBYTE(v3) = 0;
  [v4 showCardForContact:v2 resetFilter:0 resetSearch:0 fallbackToFirstContact:1 scrollToContact:1 animated:0 dismissingPresentedController:v3];
}

void sub_1000085C0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 potentiallyPresentedDetailViewController];
  [v2 showDetailViewController:v3 sender:*(void *)(a1 + 40)];
}

NSArray *__cdecl sub_1000086C4(id a1, UIViewController *a2)
{
  uint64_t v7 = a2;
  id v2 = a2;
  id v3 = +[NSArray arrayWithObjects:&v7 count:1];
  id v4 = [(UIViewController *)v2 childViewControllers];

  BOOL v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v5;
}

BOOL sub_10000878C(id a1, UIViewController *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_1000087D8(id a1, CNContactContentViewController *a2)
{
  id v2 = a2;
  if ([(CNContactContentViewController *)v2 isEditing])
  {
    [(CNContactContentViewController *)v2 clearMapsDataIfEdited];
    [(CNContactContentViewController *)v2 saveChanges];
  }
}

uint64_t sub_100009948(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100009960(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100009C14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100009D7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) performTest];
}

void sub_100009E8C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contentViewController];
  id v3 = [v2 contactView];

  [*(id *)(a1 + 40) performScrollTestWithScrollView:v3 completionBlock:0];
}

void sub_10000A000(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000A0AC;
  v4[3] = &unk_10001C538;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);
}

id sub_10000A0AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) performScrollTestWithScrollView:*(void *)(a1 + 40) completionBlock:0];
}

void sub_10000A6C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000A6EC(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didShow:v3];
}

id sub_10000A93C(uint64_t a1)
{
  kdebug_trace();
  dispatch_time_t v2 = (void *)UIApp;
  id v3 = [*(id *)(a1 + 32) testOptions];
  id v4 = [v3 objectForKeyedSubscript:@"testName"];
  [v2 finishedSubTest:@"Open Contact" forTest:v4];

  id v5 = *(void **)(a1 + 32);

  return [v5 performSelector:"showContactsListForIPhone"];
}

void sub_10000AAB0(uint64_t a1)
{
  kdebug_trace();
  dispatch_time_t v2 = (void *)UIApp;
  id v3 = [*(id *)(a1 + 32) testOptions];
  id v4 = [v3 objectForKeyedSubscript:@"testName"];
  [v2 finishedSubTest:@"Open Contact" forTest:v4];

  LODWORD(v2) = [*(id *)(a1 + 32) nextContactIndex];
  if ((int)v2 >= (int)[*(id *)(a1 + 32) maxContactIndex]
    || (signed int v5 = [*(id *)(a1 + 32) nextContactIndex],
        [*(id *)(a1 + 40) contacts],
        double v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        v6,
        (unint64_t)v7 <= v5))
  {
    v9 = (void *)UIApp;
    id v11 = [*(id *)(a1 + 32) testOptions];
    v10 = [v11 objectForKeyedSubscript:@"testName"];
    [v9 finishedTest:v10];
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    [v8 performSelector:"showNextContact" withObject:0 afterDelay:0.5];
  }
}

void sub_10000AD3C(uint64_t a1)
{
  dispatch_time_t v2 = (void *)UIApp;
  id v3 = [*(id *)(a1 + 32) testOptions];
  id v4 = [v3 objectForKeyedSubscript:@"testName"];
  signed int v5 = +[NSArray arrayWithObject:@"time"];
  [v2 startedSubTest:@"Open Contact" forTest:v4 withMetrics:v5];

  kdebug_trace();
  if ([*(id *)(a1 + 32) isIPad]) {
    +[CATransaction setFrameStallSkipRequest:1];
  }
  double v6 = [*(id *)(a1 + 32) contactNavigationController];
  [v6 showCardForContact:*(void *)(a1 + 40) animated:1];

  [*(id *)(a1 + 32) setNextContactIndex:[*(id *)(a1 + 32) nextContactIndex] + 1];
  if ([*(id *)(a1 + 32) isIPad])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AEBC;
    block[3] = &unk_10001C488;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_10000AEBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:"iterateContact"];
}

void sub_10000AFDC(uint64_t a1)
{
  id v1 = (void *)UIApp;
  id v3 = [*(id *)(a1 + 32) testOptions];
  dispatch_time_t v2 = [v3 objectForKeyedSubscript:@"testName"];
  [v1 finishedSubTest:@"Close Contact" forTest:v2];
}

id sub_10000B0D4(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 activityRestorer];
  signed int v5 = [v4 restorableActivityTypes];
  double v6 = [v3 activityType];

  id v7 = [v5 containsObject:v6];
  return v7;
}

void sub_10000B28C(id a1)
{
  id v1 = +[CNUIDataCollector sharedCollector];
  [v1 logPresentation];
}

void sub_10000B3B0(id a1, id a2)
{
}

void sub_10000BC48(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) splitViewController];
  [v1 createNewContact];
}

void sub_10000BD64(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) splitViewController];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  if (v2) {
    [v3 showEditingCardForContact:v4];
  }
  else {
    [v3 showCardForContact:v4 fallbackToFirstContact:0];
  }
}

void sub_10000C224(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) splitViewController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48) completion:0];
}

void sub_10000C6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10000C6E0(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didShow:v3];
}

void sub_10000C73C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactNavigationController];
  [v2 showCardForContact:*(void *)(a1 + 40) animated:0];

  if ([*(id *)(a1 + 32) isIPad])
  {
    id v3 = [*(id *)(a1 + 32) contactSplitViewController];
    id v4 = [v3 presentedContactViewController];

    [*(id *)(a1 + 32) editAndScrollContactViewController:v4];
  }
}

void sub_10000CAC0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contentViewController];
  id v3 = [v2 contactHeaderView];

  if (objc_opt_respondsToSelector()) {
    [v3 editButtonPressed];
  }
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CBB4;
  v7[3] = &unk_10001C538;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v7);
}

void sub_10000CBB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) photoView];
  id v3 = [v2 photoPicker];
  id v4 = [v3 collectionView];

  [*(id *)(a1 + 40) performScrollTestWithScrollView:v4 completionBlock:0];
}

void sub_10000CF6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10000CF94(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didShow:v3];
}

id sub_10000CFF0(uint64_t a1)
{
  [*(id *)(a1 + 32) willStartTest];
  id v2 = *(void **)(a1 + 32);

  return [v2 startSearchQuery];
}

id sub_10000D220(uint64_t a1)
{
  id v2 = (void *)UIApp;
  id v3 = [*(id *)(a1 + 32) testOptions];
  id v4 = [v3 objectForKeyedSubscript:@"testName"];
  [v2 finishedSubTest:@"Open Contact" forTest:v4];

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 performSelector:"showPseudoContactsListForIPhone"];
}

id sub_10000D378(uint64_t a1)
{
  id v2 = (void *)UIApp;
  id v3 = [*(id *)(a1 + 32) testOptions];
  id v4 = [v3 objectForKeyedSubscript:@"testName"];
  [v2 finishedSubTest:@"Open Contact" forTest:v4];

  LODWORD(v2) = [*(id *)(a1 + 32) nextContactIndex];
  if ((int)v2 >= (int)[*(id *)(a1 + 32) maxContactIndex]
    || (signed int v5 = [*(id *)(a1 + 32) nextContactIndex],
        [*(id *)(a1 + 40) contacts],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        v6,
        (unint64_t)v7 <= v5))
  {
    uint64_t v9 = (void *)UIApp;
    v10 = [*(id *)(a1 + 32) testOptions];
    id v11 = [v10 objectForKeyedSubscript:@"testName"];
    [v9 finishedTest:v11];

    v12 = *(void **)(a1 + 32);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000D514;
    v14[3] = &unk_10001C488;
    v14[4] = v12;
    return [v12 showContactListWithCompletionBlock:v14];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    return [v8 performSelector:"showNextContact" withObject:0 afterDelay:0.5];
  }
}

void sub_10000D514(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactNavigationController];
  id v1 = [v2 contactListViewController];
  [v1 cancelSearch:0];
}

void sub_10000D68C(uint64_t a1)
{
  id v2 = (void *)UIApp;
  id v3 = [*(id *)(a1 + 32) testOptions];
  id v4 = [v3 objectForKeyedSubscript:@"testName"];
  signed int v5 = +[NSArray arrayWithObject:@"time"];
  [v2 startedSubTest:@"Open Contact" forTest:v4 withMetrics:v5];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000D824;
  v8[3] = &unk_10001C488;
  v8[4] = *(void *)(a1 + 32);
  [UIApp installCACommitCompletionBlock:v8];
  id v6 = [*(id *)(a1 + 32) contactNavigationController];
  [v6 showCardForContact:*(void *)(a1 + 40) animated:1];

  [*(id *)(a1 + 32) setNextContactIndex:[*(id *)(a1 + 32) nextContactIndex] + 1];
  if ([*(id *)(a1 + 32) isIPad])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000D8A4;
    v7[3] = &unk_10001C488;
    void v7[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

void sub_10000D824(uint64_t a1)
{
  id v1 = (void *)UIApp;
  id v3 = [*(id *)(a1 + 32) testOptions];
  id v2 = [v3 objectForKeyedSubscript:@"testName"];
  [v1 finishedSubTest:@"Open Contact" forTest:v2];
}

id sub_10000D8A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:"iterateContact"];
}

void sub_10000D9C4(uint64_t a1)
{
  id v1 = (void *)UIApp;
  id v3 = [*(id *)(a1 + 32) testOptions];
  id v2 = [v3 objectForKeyedSubscript:@"testName"];
  [v1 finishedSubTest:@"Close Contact" forTest:v2];
}

void sub_10000DB2C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DBA4;
  block[3] = &unk_10001C488;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000DBA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) showNextContact];
}

id sub_10000DE5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) startSearchQueryWithOptions:*(void *)(a1 + 40)];
}

void sub_10000DF30(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactNavigationController];
  id v3 = [v2 contactListViewController];
  id v4 = [v3 searchResultsController];
  signed int v5 = [v4 collectionView];

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E030;
  v8[3] = &unk_10001C538;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v7 = v5;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);
}

id sub_10000E030(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000E0A4;
  v4[3] = &unk_10001C488;
  v4[4] = v2;
  return [v2 performScrollTestWithScrollView:v1 completionBlock:v4];
}

void sub_10000E0A4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactNavigationController];
  uint64_t v1 = [v2 contactListViewController];
  [v1 cancelSearch:0];
}

void sub_10000E274(id a1)
{
  qword_100025B90 = objc_alloc_init(ContactsTestingManager);

  _objc_release_x1();
}

void sub_10000E658(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iteration];
  if (v2 >= [*(id *)(a1 + 32) maxIterations])
  {
    id v9 = (void *)UIApp;
    id v11 = [*(id *)(a1 + 32) testOptions];
    v10 = [v11 objectForKeyedSubscript:@"testName"];
    [v9 finishedTest:v10];
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) contactNavigationController];
    id v4 = [v3 dataSource];
    signed int v5 = [v4 contacts];
    dispatch_time_t v6 = [v5 objectAtIndexedSubscript:[*(id *)(a1 + 32) iteration]];

    id v7 = [*(id *)(a1 + 32) contactNavigationController];
    [v7 showCardForContact:v6 animated:0];

    [*(id *)(a1 + 32) setIteration:*(char *)[*(id *)(a1 + 32) iteration] + 1];
    dispatch_time_t v8 = dispatch_time(0, 800000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E810;
    block[3] = &unk_10001C488;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_10000E810(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactSplitViewController];
  id v3 = [v2 presentedContactViewController];

  [*(id *)(a1 + 32) measureEditingTransitionOnController:v3];
}

id sub_10000E9A4(uint64_t a1)
{
  id v2 = (void *)UIApp;
  id v3 = [*(id *)(a1 + 32) testOptions];
  id v4 = [v3 objectForKeyedSubscript:@"testName"];
  [v2 finishedSubTest:@"Edit Contact Transition" forTest:v4];

  signed int v5 = *(void **)(a1 + 32);

  return [v5 performSelector:"showNextContact" withObject:0 afterDelay:1.0];
}

id sub_10000EBEC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000EC5C;
  v3[3] = &unk_10001C488;
  v3[4] = v1;
  return [v1 startSearchQueryWithCompletionBlock:v3];
}

void sub_10000EC5C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactNavigationController];
  id v3 = [v2 contactListViewController];
  id v4 = [v3 searchResultsController];
  signed int v5 = [v4 collectionView];

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000ED5C;
  v8[3] = &unk_10001C538;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v7 = v5;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);
}

id sub_10000ED5C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000EDD0;
  v4[3] = &unk_10001C488;
  v4[4] = v2;
  return [v2 performScrollTestWithScrollView:v1 completionBlock:v4];
}

void sub_10000EDD0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactNavigationController];
  uint64_t v1 = [v2 contactListViewController];
  [v1 cancelSearch:0];
}

void sub_10000EFF8(void *a1, NSObject *a2)
{
  id v4 = [a1 scheme];
  int v5 = 138412546;
  dispatch_time_t v6 = v4;
  __int16 v7 = 2112;
  dispatch_time_t v8 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error: Unexpected scheme '%@' sent in URL %@.", (uint8_t *)&v5, 0x16u);
}

void sub_10000F0A8()
{
  sub_100005414();
  sub_10000542C((void *)&_mh_execute_header, v0, v1, "Unknown reference '%@' sent in URL %@.");
}

void sub_10000F110()
{
  sub_100005414();
  sub_10000542C((void *)&_mh_execute_header, v0, v1, "Unknown type '%@' sent in URL %@.");
}

void sub_10000F178(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "During -[AppDelegate application:willFinishLaunchingWithOptions:], the value for UIApplicationLaunchOptionsSearchResultIdentifierKey was expected to be an NSString representating a contact's identifier, but instead it is %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000F1F0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error in Recap Test: Recap is not available", v1, 2u);
}

void sub_10000F234(void *a1, NSObject *a2)
{
  id v4 = [a1 coordinateSpace];
  [v4 bounds];
  int v5 = NSStringFromCGRect(v10);
  int v6 = 138412546;
  __int16 v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "scene:%@ willConnectToSession: with bounds: %@", (uint8_t *)&v6, 0x16u);
}

void sub_10000F2F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "received unknown shortcut item type: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000F370(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "error fetching contact with identifier %@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10000F3F8(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "error fetching contact with legacy identifier %d: %@", (uint8_t *)v3, 0x12u);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

uint64_t CNContactsUIBundle()
{
  return _CNContactsUIBundle();
}

uint64_t CNUILogTesting()
{
  return _CNUILogTesting();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t _UIApplicationIsAccountBased()
{
  return __UIApplicationIsAccountBased();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return _sel_isEqual(lhs, rhs);
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return [a1 URLContexts];
}

id objc_msgSend__isCollapsed(void *a1, const char *a2, ...)
{
  return [a1 _isCollapsed];
}

id objc_msgSend__isKeyWindowScene(void *a1, const char *a2, ...)
{
  return [a1 _isKeyWindowScene];
}

id objc_msgSend__launchTestName(void *a1, const char *a2, ...)
{
  return [a1 _launchTestName];
}

id objc_msgSend_accountsAndGroupsViewController(void *a1, const char *a2, ...)
{
  return [a1 accountsAndGroupsViewController];
}

id objc_msgSend_actionFound(void *a1, const char *a2, ...)
{
  return [a1 actionFound];
}

id objc_msgSend_actionsDelayedUntilSceneInitialization(void *a1, const char *a2, ...)
{
  return [a1 actionsDelayedUntilSceneInitialization];
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return [a1 activationState];
}

id objc_msgSend_activityRestorer(void *a1, const char *a2, ...)
{
  return [a1 activityRestorer];
}

id objc_msgSend_activityRestorerDelegate(void *a1, const char *a2, ...)
{
  return [a1 activityRestorerDelegate];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allSearchQueries(void *a1, const char *a2, ...)
{
  return [a1 allSearchQueries];
}

id objc_msgSend_animate(void *a1, const char *a2, ...)
{
  return [a1 animate];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return [a1 application];
}

id objc_msgSend_areAllLaunchTasksComplete(void *a1, const char *a2, ...)
{
  return [a1 areAllLaunchTasksComplete];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backgroundScheduler(void *a1, const char *a2, ...)
{
  return [a1 backgroundScheduler];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_cancelSearch(void *a1, const char *a2, ...)
{
  return [a1 cancelSearch];
}

id objc_msgSend_capabilitiesManager(void *a1, const char *a2, ...)
{
  return [a1 capabilitiesManager];
}

id objc_msgSend_checkInLaunchTasksIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 checkInLaunchTasksIfNecessary];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_clearMapsDataIfEdited(void *a1, const char *a2, ...)
{
  return [a1 clearMapsDataIfEdited];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return [a1 collectionView];
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return [a1 connectedScenes];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return [a1 contact];
}

id objc_msgSend_contactContainer(void *a1, const char *a2, ...)
{
  return [a1 contactContainer];
}

id objc_msgSend_contactFormatter(void *a1, const char *a2, ...)
{
  return [a1 contactFormatter];
}

id objc_msgSend_contactHeaderView(void *a1, const char *a2, ...)
{
  return [a1 contactHeaderView];
}

id objc_msgSend_contactListViewController(void *a1, const char *a2, ...)
{
  return [a1 contactListViewController];
}

id objc_msgSend_contactNavigationController(void *a1, const char *a2, ...)
{
  return [a1 contactNavigationController];
}

id objc_msgSend_contactSplitViewController(void *a1, const char *a2, ...)
{
  return [a1 contactSplitViewController];
}

id objc_msgSend_contactStoreDataSource(void *a1, const char *a2, ...)
{
  return [a1 contactStoreDataSource];
}

id objc_msgSend_contactStyleDefaultBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 contactStyleDefaultBackgroundColor];
}

id objc_msgSend_contactView(void *a1, const char *a2, ...)
{
  return [a1 contactView];
}

id objc_msgSend_contactViewIsCovered(void *a1, const char *a2, ...)
{
  return [a1 contactViewIsCovered];
}

id objc_msgSend_contacts(void *a1, const char *a2, ...)
{
  return [a1 contacts];
}

id objc_msgSend_contactsApplicationTintColor(void *a1, const char *a2, ...)
{
  return [a1 contactsApplicationTintColor];
}

id objc_msgSend_contactsList(void *a1, const char *a2, ...)
{
  return [a1 contactsList];
}

id objc_msgSend_contactsSplitViewController(void *a1, const char *a2, ...)
{
  return [a1 contactsSplitViewController];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return [a1 contentViewController];
}

id objc_msgSend_coordinateSpace(void *a1, const char *a2, ...)
{
  return [a1 coordinateSpace];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createNewContact(void *a1, const char *a2, ...)
{
  return [a1 createNewContact];
}

id objc_msgSend_createShowMeCardApplicationShortcutIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 createShowMeCardApplicationShortcutIfNecessary];
}

id objc_msgSend_createUserActivity(void *a1, const char *a2, ...)
{
  return [a1 createUserActivity];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentEnvironment(void *a1, const char *a2, ...)
{
  return [a1 currentEnvironment];
}

id objc_msgSend_currentQueryIndex(void *a1, const char *a2, ...)
{
  return [a1 currentQueryIndex];
}

id objc_msgSend_currentSnapshot(void *a1, const char *a2, ...)
{
  return [a1 currentSnapshot];
}

id objc_msgSend_currentTest(void *a1, const char *a2, ...)
{
  return [a1 currentTest];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_defaultCapabilitiesManager(void *a1, const char *a2, ...)
{
  return [a1 defaultCapabilitiesManager];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultSchedulerProvider(void *a1, const char *a2, ...)
{
  return [a1 defaultSchedulerProvider];
}

id objc_msgSend_defaultTestingManager(void *a1, const char *a2, ...)
{
  return [a1 defaultTestingManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeys];
}

id objc_msgSend_descriptorForRequiredKeysForPreferredForNameMeContact(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeysForPreferredForNameMeContact];
}

id objc_msgSend_detailViewController(void *a1, const char *a2, ...)
{
  return [a1 detailViewController];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didExecuteSceneInitializationTasks(void *a1, const char *a2, ...)
{
  return [a1 didExecuteSceneInitializationTasks];
}

id objc_msgSend_didShow(void *a1, const char *a2, ...)
{
  return [a1 didShow];
}

id objc_msgSend_disableCompatiblityWorkaround(void *a1, const char *a2, ...)
{
  return [a1 disableCompatiblityWorkaround];
}

id objc_msgSend_displayContactIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 displayContactIfNecessary];
}

id objc_msgSend_displayMode(void *a1, const char *a2, ...)
{
  return [a1 displayMode];
}

id objc_msgSend_displayedContact(void *a1, const char *a2, ...)
{
  return [a1 displayedContact];
}

id objc_msgSend_editButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 editButtonPressed];
}

id objc_msgSend_extraResults(void *a1, const char *a2, ...)
{
  return [a1 extraResults];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_groupsPanelIsHidden(void *a1, const char *a2, ...)
{
  return [a1 groupsPanelIsHidden];
}

id objc_msgSend_hasForceTouchCapability(void *a1, const char *a2, ...)
{
  return [a1 hasForceTouchCapability];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 horizontalSizeClass];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_identifierFound(void *a1, const char *a2, ...)
{
  return [a1 identifierFound];
}

id objc_msgSend_indexPathsForSelectedItems(void *a1, const char *a2, ...)
{
  return [a1 indexPathsForSelectedItems];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isCollapsed(void *a1, const char *a2, ...)
{
  return [a1 isCollapsed];
}

id objc_msgSend_isDisplayingAddNewContactViewController(void *a1, const char *a2, ...)
{
  return [a1 isDisplayingAddNewContactViewController];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isIPad(void *a1, const char *a2, ...)
{
  return [a1 isIPad];
}

id objc_msgSend_isRecap(void *a1, const char *a2, ...)
{
  return [a1 isRecap];
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return [a1 isRecapAvailable];
}

id objc_msgSend_isSearching(void *a1, const char *a2, ...)
{
  return [a1 isSearching];
}

id objc_msgSend_isSetupFinished(void *a1, const char *a2, ...)
{
  return [a1 isSetupFinished];
}

id objc_msgSend_isShowingGroups(void *a1, const char *a2, ...)
{
  return [a1 isShowingGroups];
}

id objc_msgSend_isShowingListView(void *a1, const char *a2, ...)
{
  return [a1 isShowingListView];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_iteration(void *a1, const char *a2, ...)
{
  return [a1 iteration];
}

id objc_msgSend_iterations(void *a1, const char *a2, ...)
{
  return [a1 iterations];
}

id objc_msgSend_lastSearchBeginTime(void *a1, const char *a2, ...)
{
  return [a1 lastSearchBeginTime];
}

id objc_msgSend_launchCheckinRegistrar(void *a1, const char *a2, ...)
{
  return [a1 launchCheckinRegistrar];
}

id objc_msgSend_legacyIdentifierFound(void *a1, const char *a2, ...)
{
  return [a1 legacyIdentifierFound];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_logPresentation(void *a1, const char *a2, ...)
{
  return [a1 logPresentation];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainSceneDelegate(void *a1, const char *a2, ...)
{
  return [a1 mainSceneDelegate];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_maxContactIndex(void *a1, const char *a2, ...)
{
  return [a1 maxContactIndex];
}

id objc_msgSend_maxIterations(void *a1, const char *a2, ...)
{
  return [a1 maxIterations];
}

id objc_msgSend_multitaskingDragExclusionRects(void *a1, const char *a2, ...)
{
  return [a1 multitaskingDragExclusionRects];
}

id objc_msgSend_navControllerDelegate(void *a1, const char *a2, ...)
{
  return [a1 navControllerDelegate];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationControllerForPPT(void *a1, const char *a2, ...)
{
  return [a1 navigationControllerForPPT];
}

id objc_msgSend_newContactFormatter(void *a1, const char *a2, ...)
{
  return [a1 newContactFormatter];
}

id objc_msgSend_newContactStoreDataSourceForSplitViewController(void *a1, const char *a2, ...)
{
  return [a1 newContactStoreDataSourceForSplitViewController];
}

id objc_msgSend_nextContactIndex(void *a1, const char *a2, ...)
{
  return [a1 nextContactIndex];
}

id objc_msgSend_performMigrationOfFacebookContactsToLocalStoreIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 performMigrationOfFacebookContactsToLocalStoreIfNecessary];
}

id objc_msgSend_photoPicker(void *a1, const char *a2, ...)
{
  return [a1 photoPicker];
}

id objc_msgSend_photoView(void *a1, const char *a2, ...)
{
  return [a1 photoView];
}

id objc_msgSend_potentiallyPresentedDetailViewController(void *a1, const char *a2, ...)
{
  return [a1 potentiallyPresentedDetailViewController];
}

id objc_msgSend_preferredForNameMeContact(void *a1, const char *a2, ...)
{
  return [a1 preferredForNameMeContact];
}

id objc_msgSend_preferredForNameMeContactIdentifier(void *a1, const char *a2, ...)
{
  return [a1 preferredForNameMeContactIdentifier];
}

id objc_msgSend_prepareForNextTest(void *a1, const char *a2, ...)
{
  return [a1 prepareForNextTest];
}

id objc_msgSend_presentedContactViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedContactViewController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_prewarmContactStoreDataSourceBlock(void *a1, const char *a2, ...)
{
  return [a1 prewarmContactStoreDataSourceBlock];
}

id objc_msgSend_prewarmContactStoreDataSourceSnapshotBlock(void *a1, const char *a2, ...)
{
  return [a1 prewarmContactStoreDataSourceSnapshotBlock];
}

id objc_msgSend_prewarmResourcesForLaunch(void *a1, const char *a2, ...)
{
  return [a1 prewarmResourcesForLaunch];
}

id objc_msgSend_prewarmedContactStoreDataSource(void *a1, const char *a2, ...)
{
  return [a1 prewarmedContactStoreDataSource];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_queryString(void *a1, const char *a2, ...)
{
  return [a1 queryString];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeContactViewController(void *a1, const char *a2, ...)
{
  return [a1 removeContactViewController];
}

id objc_msgSend_resetDelegate(void *a1, const char *a2, ...)
{
  return [a1 resetDelegate];
}

id objc_msgSend_resourcesPrewarmingQueue(void *a1, const char *a2, ...)
{
  return [a1 resourcesPrewarmingQueue];
}

id objc_msgSend_restorableActivityTypes(void *a1, const char *a2, ...)
{
  return [a1 restorableActivityTypes];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_saveChanges(void *a1, const char *a2, ...)
{
  return [a1 saveChanges];
}

id objc_msgSend_saveModelChangesToContact(void *a1, const char *a2, ...)
{
  return [a1 saveModelChangesToContact];
}

id objc_msgSend_sceneWindow(void *a1, const char *a2, ...)
{
  return [a1 sceneWindow];
}

id objc_msgSend_schedulerProvider(void *a1, const char *a2, ...)
{
  return [a1 schedulerProvider];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_searchResultIdentifier(void *a1, const char *a2, ...)
{
  return [a1 searchResultIdentifier];
}

id objc_msgSend_searchResultsController(void *a1, const char *a2, ...)
{
  return [a1 searchResultsController];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_selectedIndexPath(void *a1, const char *a2, ...)
{
  return [a1 selectedIndexPath];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_setupColumns(void *a1, const char *a2, ...)
{
  return [a1 setupColumns];
}

id objc_msgSend_setupContainerController(void *a1, const char *a2, ...)
{
  return [a1 setupContainerController];
}

id objc_msgSend_setupGroupsNavigationController(void *a1, const char *a2, ...)
{
  return [a1 setupGroupsNavigationController];
}

id objc_msgSend_setupKeyCommands(void *a1, const char *a2, ...)
{
  return [a1 setupKeyCommands];
}

id objc_msgSend_setupNavigationController(void *a1, const char *a2, ...)
{
  return [a1 setupNavigationController];
}

id objc_msgSend_setupPrimaryColumnViewController(void *a1, const char *a2, ...)
{
  return [a1 setupPrimaryColumnViewController];
}

id objc_msgSend_setupSplitViewControllerProperties(void *a1, const char *a2, ...)
{
  return [a1 setupSplitViewControllerProperties];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedCollector(void *a1, const char *a2, ...)
{
  return [a1 sharedCollector];
}

id objc_msgSend_shortcutItem(void *a1, const char *a2, ...)
{
  return [a1 shortcutItem];
}

id objc_msgSend_shouldDisplayListHeaderView(void *a1, const char *a2, ...)
{
  return [a1 shouldDisplayListHeaderView];
}

id objc_msgSend_shouldMakeUIForDefaultPNG(void *a1, const char *a2, ...)
{
  return [a1 shouldMakeUIForDefaultPNG];
}

id objc_msgSend_shouldShowAccountsAndGroups(void *a1, const char *a2, ...)
{
  return [a1 shouldShowAccountsAndGroups];
}

id objc_msgSend_shouldShowOnboarding(void *a1, const char *a2, ...)
{
  return [a1 shouldShowOnboarding];
}

id objc_msgSend_showContactList(void *a1, const char *a2, ...)
{
  return [a1 showContactList];
}

id objc_msgSend_showMeCardShortcutItem(void *a1, const char *a2, ...)
{
  return [a1 showMeCardShortcutItem];
}

id objc_msgSend_showMeContact(void *a1, const char *a2, ...)
{
  return [a1 showMeContact];
}

id objc_msgSend_showNewContact(void *a1, const char *a2, ...)
{
  return [a1 showNewContact];
}

id objc_msgSend_showNextContact(void *a1, const char *a2, ...)
{
  return [a1 showNextContact];
}

id objc_msgSend_splitViewController(void *a1, const char *a2, ...)
{
  return [a1 splitViewController];
}

id objc_msgSend_splitViewControllerIsDisplayingList(void *a1, const char *a2, ...)
{
  return [a1 splitViewControllerIsDisplayingList];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_stateRestorationActivity(void *a1, const char *a2, ...)
{
  return [a1 stateRestorationActivity];
}

id objc_msgSend_statusBar(void *a1, const char *a2, ...)
{
  return [a1 statusBar];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_suggestionsEnabled(void *a1, const char *a2, ...)
{
  return [a1 suggestionsEnabled];
}

id objc_msgSend_testOptions(void *a1, const char *a2, ...)
{
  return [a1 testOptions];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_totalIterations(void *a1, const char *a2, ...)
{
  return [a1 totalIterations];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transitionCoordinator(void *a1, const char *a2, ...)
{
  return [a1 transitionCoordinator];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return [a1 userActivities];
}

id objc_msgSend_userActivity(void *a1, const char *a2, ...)
{
  return [a1 userActivity];
}

id objc_msgSend_userActivityRepresentingCurrentlyDisplayedContact(void *a1, const char *a2, ...)
{
  return [a1 userActivityRepresentingCurrentlyDisplayedContact];
}

id objc_msgSend_userActivityRepresentingGroupsView(void *a1, const char *a2, ...)
{
  return [a1 userActivityRepresentingGroupsView];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_vCardImportController(void *a1, const char *a2, ...)
{
  return [a1 vCardImportController];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewingContactActivityForRestoration(void *a1, const char *a2, ...)
{
  return [a1 viewingContactActivityForRestoration];
}

id objc_msgSend_visibleViewController(void *a1, const char *a2, ...)
{
  return [a1 visibleViewController];
}

id objc_msgSend_willShow(void *a1, const char *a2, ...)
{
  return [a1 willShow];
}

id objc_msgSend_willStartTest(void *a1, const char *a2, ...)
{
  return [a1 willStartTest];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}