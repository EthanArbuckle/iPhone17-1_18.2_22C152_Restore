uint64_t start(int a1, char **a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  NSString *v9;
  objc_class *v10;
  NSString *v11;
  uint64_t v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = VUISignpostLogObject();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.Main", "", buf, 2u);
  }

  v5 = VUISignpostLogObject();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.FirstTab", "", v14, 2u);
  }

  v6 = +[VUITVAppLauncher sharedInstance];
  [v6 preWarm:0];

  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = UIApplicationMain(a1, a2, v11, v9);

  return v12;
}

void sub_100006CBC(id a1)
{
  qword_10001E510 = [[ATAPPTController alloc] _init];

  _objc_release_x1();
}

id sub_1000070E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setContentOffset:0 animated:[*(double *)(a1 + 40) doubleValue] [*(double *)(a1 + 48) doubleValue]];
}

void sub_1000071F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100007208(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id result = [*(id *)(a1 + 32) hasPrefix:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

BOOL sub_1000074A0(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  return +[ATAPPTUtilities selectTabWithTitle:VUITabBarItemIdentifierKeyWatchNow inTabBarController:a3];
}

BOOL sub_1000074BC(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  return +[ATAPPTUtilities selectTabWithTitle:VUITabBarItemIdentifierKeyLibrary inTabBarController:a3];
}

BOOL sub_1000074D8(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  return +[ATAPPTUtilities selectTabWithTitle:VUITabBarItemIdentifierKeySearch inTabBarController:a3];
}

BOOL sub_1000074F4(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyPPTStack;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:v5 inTabBarController:v7];
  +[ATAPPTUtilities waitForTabWithTitleToLoad:v5 inTabBarController:v7 totalChildren:1];
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:v6 testOptions:0 scrollAxis:2 tabBarController:v7 scrollViewBlock:0];

  return v8;
}

BOOL sub_100007598(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyPPTStack;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:v5 inTabBarController:v7];
  +[ATAPPTUtilities waitForTabWithTitleToLoad:v5 inTabBarController:v7 totalChildren:1];
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:v6 testOptions:0 scrollAxis:1 tabBarController:v7 scrollViewBlock:&stru_100018928];

  return v8;
}

UIScrollView *__cdecl sub_100007640(id a1, UIViewController *a2)
{
  return (UIScrollView *)+[ATAPPTUtilities findScrollViewByIndexInStackCollectionView:a2 index:1];
}

BOOL sub_100007654(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyLibrary;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:v5 inTabBarController:v7];
  +[ATAPPTUtilities waitForTabWithTitleToLoad:v5 inTabBarController:v7 totalChildren:1];
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:v6 testOptions:0 scrollAxis:2 tabBarController:v7 scrollViewBlock:&stru_100018968];

  return v8;
}

UIScrollView *__cdecl sub_1000076FC(id a1, UIViewController *a2)
{
  v2 = a2;
  +[ATAPPTUtilities resetNumScrollViewFound];
  v3 = [(UIViewController *)v2 view];

  v4 = +[ATAPPTUtilities findScrollViewInView:v3 desiredScrollViewClass:objc_opt_class() numScrollViewsToSkip:0];

  return (UIScrollView *)v4;
}

BOOL sub_100007790(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyLibrary;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:v5 inTabBarController:v7];
  +[ATAPPTUtilities waitForTabWithTitleToLoad:v5 inTabBarController:v7 totalChildren:1];
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:v6 testOptions:0 scrollAxis:2 tabBarController:v7 scrollViewBlock:&stru_1000189A8];

  return v8;
}

UIScrollView *__cdecl sub_100007838(id a1, UIViewController *a2)
{
  v2 = a2;
  +[ATAPPTUtilities resetNumScrollViewFound];
  v3 = [(UIViewController *)v2 childViewControllers];

  v4 = [v3 firstObject];

  uint64_t v5 = [v4 viewControllers];
  v6 = [v5 firstObject];

  v7 = [v6 view];
  BOOL v8 = +[ATAPPTUtilities findScrollViewInView:v7 desiredScrollViewClass:objc_opt_class() numScrollViewsToSkip:0];

  return (UIScrollView *)v8;
}

BOOL sub_100007918(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyLibrary;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:v5 inTabBarController:v7];
  +[ATAPPTUtilities waitForTabWithTitleToLoad:v5 inTabBarController:v7 totalChildren:1];
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:v6 testOptions:0 scrollAxis:2 tabBarController:v7 scrollViewBlock:&stru_1000189E8];

  return v8;
}

UIScrollView *__cdecl sub_1000079C0(id a1, UIViewController *a2)
{
  v2 = a2;
  +[ATAPPTUtilities resetNumScrollViewFound];
  v3 = [(UIViewController *)v2 childViewControllers];

  v4 = [v3 firstObject];

  uint64_t v5 = [v4 viewControllers];
  v6 = [v5 lastObject];

  v7 = [v6 view];
  BOOL v8 = +[ATAPPTUtilities findScrollViewInView:v7 desiredScrollViewClass:objc_opt_class() numScrollViewsToSkip:0];

  return (UIScrollView *)v8;
}

BOOL sub_100007AA0(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyPPTStack;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:v5 inTabBarController:v7];
  +[ATAPPTUtilities resetNumScrollViewFound];
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:v6 testOptions:0 scrollAxis:1 tabBarController:v7 scrollViewBlock:&stru_100018A28];

  return v8;
}

UIScrollView *__cdecl sub_100007B3C(id a1, UIViewController *a2)
{
  return (UIScrollView *)+[ATAPPTUtilities findScrollViewByIndexInStackCollectionView:a2 index:2];
}

BOOL sub_100007B50(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = VUITabBarItemIdentifierKeyPPTStack;
  +[ATAPPTUtilities selectTabWithTitle:VUITabBarItemIdentifierKeyPPTStack inTabBarController:v6];
  +[ATAPPTUtilities waitForTabWithTitleToLoad:v8 inTabBarController:v6 totalChildren:1];
  [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
  v9 = +[UIDevice currentDevice];
  id v10 = [v9 userInterfaceIdiom];

  if (!v10)
  {
    [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
    [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
  }
  BOOL v11 = +[ATAPPTUtilities performScrollViewTest:v7 testOptions:0 scrollAxis:1 tabBarController:v6 scrollViewBlock:&stru_100018A48];

  return v11;
}

UIScrollView *__cdecl sub_100007C40(id a1, UIViewController *a2)
{
  return (UIScrollView *)+[ATAPPTUtilities findScrollViewByIndexInStackCollectionView:a2 index:3];
}

BOOL sub_100007C54(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = VUITabBarItemIdentifierKeyPPTStack;
  +[ATAPPTUtilities selectTabWithTitle:VUITabBarItemIdentifierKeyPPTStack inTabBarController:v6];
  +[ATAPPTUtilities waitForTabWithTitleToLoad:v8 inTabBarController:v6 totalChildren:1];
  [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
  [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
  v9 = +[UIDevice currentDevice];
  id v10 = [v9 userInterfaceIdiom];

  if (!v10)
  {
    [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
    [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
  }
  BOOL v11 = +[ATAPPTUtilities performScrollViewTest:v7 testOptions:0 scrollAxis:1 tabBarController:v6 scrollViewBlock:&stru_100018A90];

  return v11;
}

UIScrollView *__cdecl sub_100007D50(id a1, UIViewController *a2)
{
  return (UIScrollView *)+[ATAPPTUtilities findScrollViewByIndexInStackCollectionView:a2 index:5];
}

BOOL sub_100007D64(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyPPTSports;
  id v6 = a4;
  id v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:v5 inTabBarController:v7];
  +[ATAPPTUtilities waitForTabWithTitleToLoad:v5 inTabBarController:v7 totalChildren:1];
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:v6 testOptions:0 scrollAxis:2 tabBarController:v7 scrollViewBlock:0];

  return v8;
}

BOOL sub_100007E08(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyPPTShowProduct;
  id v6 = a4;
  id v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:v5 inTabBarController:v7];
  +[ATAPPTUtilities waitForTabWithTitleToLoad:v5 inTabBarController:v7 totalChildren:1];
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:v6 testOptions:0 scrollAxis:2 tabBarController:v7 scrollViewBlock:0];

  return v8;
}

void sub_100008078(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_10000808C(id *a1)
{
  if (([a1[4] hasPrefix:@"Scroll"] & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008278;
    block[3] = &unk_100018AF8;
    id v10 = a1[5];
    id v11 = a1[4];
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008284;
  v5[3] = &unk_100018B70;
  objc_copyWeak(&v8, a1 + 7);
  id v6 = a1[4];
  id v7 = a1[5];
  [a1[6] setApplicationLoadCompletion:v5];
  os_unfair_lock_lock((os_unfair_lock_t)a1[6] + 3);
  v2 = (os_unfair_lock_s *)a1[6];
  int os_unfair_lock_opaque_low = LOBYTE(v2[2]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(v2 + 3);
  if (!os_unfair_lock_opaque_low) {
    usleep(0x7A120u);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000086B0;
  v4[3] = &unk_100018B98;
  v4[4] = a1[6];
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v4);

  objc_destroyWeak(&v8);
}

void sub_100008260(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_100008278(uint64_t a1)
{
  return _[*(id *)(a1 + 32) startedTest:*(void *)(a1 + 40)];
}

void sub_100008284(id *a1)
{
  v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = [WeakRetained workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008370;
  block[3] = &unk_100018B70;
  objc_copyWeak(&v8, v2);
  id v6 = a1[4];
  id v7 = a1[5];
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
}

void sub_100008370(id *a1)
{
  v2 = +[ATAPPTUtilities prepareForPPT];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1000085B0;
  v20 = sub_1000085DC;
  id v21 = 0;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = [WeakRetained testsManifest];
  uint64_t v5 = [v4 allKeys];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000085E4;
  v12[3] = &unk_100018B20;
  id v13 = a1[4];
  v14 = &v16;
  objc_copyWeak(&v15, a1 + 6);
  [v5 enumerateObjectsUsingBlock:v12];
  uint64_t v6 = v17[5];
  if (v6) {
    char v7 = (*(uint64_t (**)(uint64_t, id, void *, id))(v6 + 16))(v6, a1[5], v2, a1[4]);
  }
  else {
    char v7 = 0;
  }
  if (([a1[4] hasPrefix:@"Scroll"] & 1) == 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000868C;
    v8[3] = &unk_100018B48;
    char v11 = v7;
    id v9 = a1[5];
    id v10 = a1[4];
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v8);
  }
  objc_destroyWeak(&v15);

  _Block_object_dispose(&v16, 8);
}

void sub_100008584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  objc_destroyWeak(v23);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

id sub_1000085B0(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1000085DC(uint64_t a1)
{
}

void sub_1000085E4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    char v7 = [WeakRetained testsManifest];
    uint64_t v8 = [v7 objectForKeyedSubscript:v11];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

id sub_10000868C(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 finishedTest:v4];
  }
  else {
    return _[v3 failedTest:v4];
  }
}

void sub_1000086B0(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) applicationLoadCompletion];
  if (v2)
  {
    [*(id *)(a1 + 32) setApplicationLoadCompletion:0];
    v2[2]();
  }
}

void sub_10000897C(id a1)
{
  qword_10001E520 = (uint64_t)os_log_create("com.apple.tv", "ATAPPTUtilities");

  _objc_release_x1();
}

void sub_100008A14(id a1)
{
  id v1 = objc_alloc_init((Class)NSOperationQueue);
  int v2 = (void *)qword_10001E530;
  qword_10001E530 = (uint64_t)v1;

  [(id)qword_10001E530 setMaxConcurrentOperationCount:1];
  v3 = (void *)qword_10001E530;

  _[v3 setQualityOfService:17];
}

void sub_100008ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008F10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008F20(uint64_t a1)
{
}

void sub_100008F28(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 48) _topViewControllerInTabBarController:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)objc_opt_class() topMostController];
    _objc_release_x1();
  }
}

uint64_t sub_100008FB8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  else {
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 56) _findScrollViewInViewController:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }

  return _objc_release_x1();
}

void sub_100009034(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 64);
  uint64_t v4 = *(unsigned int *)(a1 + 68);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009104;
  v6[3] = &unk_100018CB8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v2 _performScrollTest:v5 iterations:10 delta:v3 length:v4 scrollAxis:v1 extraResultsBlock:&stru_100018C90 completionBlock:v6];
}

NSDictionary *__cdecl sub_1000090F8(id a1)
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

intptr_t sub_100009104(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_10000910C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_10001E548;
  uint64_t v7 = qword_10001E548;
  if (!qword_10001E548)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000B6B8;
    v3[3] = &unk_100018D08;
    v3[4] = &v4;
    sub_10000B6B8((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1000091D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000091F0(void *a1)
{
  if (a1[6] == 1
    && ([*(id *)(*(void *)(a1[5] + 8) + 40) _contentScrollsAlongXAxis] & 1) == 0)
  {
    [*(id *)(*(void *)(a1[5] + 8) + 40) _setContentScrollsAlongXAxis:1];
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  uint64_t v2 = (void *)qword_10001E558;
  uint64_t v9 = qword_10001E558;
  if (!qword_10001E558)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000B880;
    v5[3] = &unk_100018D08;
    void v5[4] = &v6;
    sub_10000B880((uint64_t)v5);
    uint64_t v2 = (void *)v7[3];
  }
  uint64_t v3 = v2;
  _Block_object_dispose(&v6, 8);
  id v4 = [[v3 alloc] initWithTestName:a1[4] scrollView:*(void *)(*(void *)(a1[5] + 8) + 40) completionHandler:0];
  [sub_10000910C() runTestWithParameters:v4];
}

void sub_100009310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009438(uint64_t a1)
{
  uint64_t v2 = +[UIWindow keyWindow];
  uint64_t v3 = [v2 rootViewController];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) navigationController];
  id v6 = [v7 popToRootViewControllerAnimated:0];
}

void sub_100009910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100009934(uint64_t a1)
{
  [*(id *)(a1 + 32) tabBarItems];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v23;
    uint64_t v6 = VUITabBarItemKeyIdentifier;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v22 + 1) + 8 * i) vui_stringForKey:v6];
        if ([v8 isEqualToString:*(void *)(a1 + 40)])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

          goto LABEL_11;
        }
        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      }
      id v4 = [v2 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  int v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v10 = +[ATAPPTUtilities testLog];
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v12;
      __int16 v28 = 2048;
      uint64_t v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found '%@' at index %lu", buf, 0x16u);
    }

    [*(id *)(a1 + 32) setSelectedIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    v14 = [*(id *)(a1 + 32) viewControllers];
    id v11 = [v14 objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];

    id v15 = [*(id *)(a1 + 32) delegate];
    [v15 tabBarController:*(void *)(a1 + 32) didSelectViewController:v11];
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_100011C20(a1, v11, v16, v17, v18, v19, v20, v21);
  }
}

intptr_t sub_100009CA4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

int64_t sub_10000A0D8(id a1, id a2, id a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v6 = v5;
    [v4 frame];
    double v8 = v7;
    [v6 frame];
    double v10 = v9;

    if (v8 > v10) {
      int64_t v11 = 1;
    }
    else {
      int64_t v11 = -1;
    }
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

BOOL +[ATAPPTUtilities _blockExecutionInTabBarController:documentRef:totalChildren:](id a1, SEL a2, id a3, id a4, unint64_t a5)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v29 = v7;
  [v7 tabBarItems];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  double v10 = (char *)[v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v10)
  {
    int64_t v11 = 0;
    uint64_t v12 = *(void *)v39;
    uint64_t v13 = VUITabBarItemKeyIdentifier;
    while (2)
    {
      v14 = 0;
      v30 = &v10[(void)v11];
      do
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = [v38 vui_stringForKey:v13];
        unsigned __int8 v16 = [v15 isEqualToString:v8];

        if (v16)
        {
          v30 = &v14[(void)v11];
          goto LABEL_12;
        }
        ++v14;
      }
      while (v10 != v14);
      double v10 = (char *)[v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
      int64_t v11 = v30;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    v30 = 0;
  }
LABEL_12:

  uint64_t v17 = [v29 viewControllers];
  __int16 v28 = (char *)[v17 count];

  if (v30 < v28)
  {
    uint64_t v18 = [v29 viewControllers];
    v26 = [v18 objectAtIndex:v30];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v26;
    }
    else {
      id v19 = 0;
    }
    uint64_t v20 = [v19 viewControllers];
    if ((unint64_t)[v20 count] >= a5)
    {
LABEL_20:
    }
    else
    {
      int v21 = 11;
      while (1)
      {

        if (!--v21) {
          break;
        }
        usleep(0xC350u);
        uint64_t v20 = [v19 viewControllers];
        if ((unint64_t)[v20 count] >= a5) {
          goto LABEL_20;
        }
      }
    }
    long long v22 = [v19 viewControllers];
    long long v23 = [v22 lastObject];

    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    while (1)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000A510;
      block[3] = &unk_100018DC0;
      v33 = &v34;
      id v24 = v23;
      id v32 = v24;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
      if (!*((unsigned char *)v35 + 24)) {
        break;
      }
      usleep(0xC350u);
    }
    _Block_object_dispose(&v34, 8);
  }
  return v30 < v28;
}

void sub_10000A4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000A510(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) vui_ppt_isLoading];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10000A980(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [v4 text];
  id v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  return v6;
}

id sub_10000AF5C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) sendActionsForControlEvents:64];
}

uint64_t sub_10000B148(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [v3 textLabels];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        id v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v8) text];
          unsigned __int8 v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

          if (v10)
          {
            uint64_t v11 = 1;
            goto LABEL_13;
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 0;
LABEL_13:
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id sub_10000B37C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 performSelector:"textContentView"];
  }
  else
  {
    id v4 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 performSelector:"text"];
  }
  else
  {
    id v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

id sub_10000B53C(uint64_t a1, void *a2)
{
  id v3 = [a2 currentTitle];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

Class sub_10000B6B8(uint64_t a1)
{
  sub_10000B710();
  Class result = objc_getClass("RPTTestRunner");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100011C90();
  }
  qword_10001E548 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000B710()
{
  v1[0] = 0;
  if (!qword_10001E550)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_10000B80C;
    v1[4] = &unk_100018E48;
    v1[5] = v1;
    long long v2 = off_100018E30;
    uint64_t v3 = 0;
    qword_10001E550 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_10001E550)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_10000B80C()
{
  uint64_t result = _sl_dlopen();
  qword_10001E550 = result;
  return result;
}

Class sub_10000B880(uint64_t a1)
{
  sub_10000B710();
  Class result = objc_getClass("RPTScrollViewTestParameters");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100011CB8();
  }
  qword_10001E558 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000B8D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_10000B8F8()
{
  return sub_10000B944(25705, 0xE200000000000000);
}

uint64_t sub_10000B904()
{
  return sub_10000B944(0x6E20797469746E45, 0xEB00000000656D61);
}

uint64_t sub_10000B924()
{
  return sub_10000B944(0x7420797469746E45, 0xEB00000000657079);
}

uint64_t sub_10000B944(uint64_t a1, uint64_t a2)
{
  v25[0] = a1;
  v25[1] = a2;
  uint64_t v2 = type metadata accessor for InputConnectionBehavior();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  id v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000E858(&qword_10001E3D0);
  __chkstk_darwin(v7 - 8, v8);
  unsigned __int8 v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000E858(&qword_10001E3D8);
  __chkstk_darwin(v11 - 8, v12);
  long long v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000E858(&qword_10001E3E0);
  __chkstk_darwin(v15 - 8, v16);
  uint64_t v18 = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for LocalizedStringResource();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19, v21);
  sub_10000E858(&qword_10001E3E8);
  LocalizedStringResource.init(stringLiteral:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v18, 1, 1, v19);
  uint64_t v22 = type metadata accessor for String.IntentInputOptions();
  v25[2] = 0;
  v25[3] = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v14, 1, 1, v22);
  uint64_t v23 = type metadata accessor for IntentDialog();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v10, 1, 1, v23);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, enum case for InputConnectionBehavior.default(_:), v2);
  return IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10000BC58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v49 = a7;
  uint64_t v50 = a8;
  uint64_t v47 = a5;
  uint64_t v48 = a6;
  uint64_t v45 = a3;
  uint64_t v46 = a4;
  uint64_t v44 = a2;
  uint64_t v51 = a1;
  uint64_t v62 = type metadata accessor for InputConnectionBehavior();
  uint64_t v8 = *(void *)(v62 - 8);
  __chkstk_darwin(v62, v9);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000E858(&qword_10001E3D0);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10000E858(&qword_10001E3D8);
  __chkstk_darwin(v16 - 8, v17);
  uint64_t v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10000E858(&qword_10001E3E0);
  __chkstk_darwin(v20 - 8, v21);
  uint64_t v23 = (char *)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for LocalizedStringResource();
  uint64_t v42 = v24;
  uint64_t v43 = *(void *)(v24 - 8);
  uint64_t v25 = v43;
  __chkstk_darwin(v24, v26);
  sub_10000E858(&qword_10001E3E8);
  LocalizedStringResource.init(stringLiteral:)();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  uint64_t v61 = v25 + 56;
  v27(v23, 1, 1, v24);
  __int16 v28 = v27;
  uint64_t v59 = type metadata accessor for String.IntentInputOptions();
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  uint64_t v29 = *(void *)(v59 - 8);
  v58 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56);
  uint64_t v60 = v29 + 56;
  v58(v19, 1, 1, v59);
  uint64_t v56 = type metadata accessor for IntentDialog();
  uint64_t v30 = *(void *)(v56 - 8);
  v55 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56);
  uint64_t v57 = v30 + 56;
  v55(v15, 1, 1, v56);
  unsigned int v54 = enum case for InputConnectionBehavior.default(_:);
  v31 = *(void (**)(void))(v8 + 104);
  uint64_t v52 = v8 + 104;
  v53 = (void (*)(char *, void, uint64_t))v31;
  long long v41 = v11;
  uint64_t v32 = v62;
  v31(v11);
  v33 = v19;
  uint64_t v34 = IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
  swift_retain();
  LocalizedStringResource.init(stringLiteral:)();
  uint64_t v35 = v42;
  v28(v23, 1, 1, v42);
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  v58(v33, 1, 1, v59);
  uint64_t v36 = v15;
  v55(v15, 1, 1, v56);
  char v37 = v41;
  v53(v41, v54, v32);
  IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
  swift_retain();
  LocalizedStringResource.init(stringLiteral:)();
  v28(v23, 1, 1, v35);
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  v58(v33, 1, 1, v59);
  v55(v36, 1, 1, v56);
  v53(v37, v54, v62);
  IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
  uint64_t v63 = v44;
  uint64_t v64 = v45;
  swift_retain();
  swift_retain();
  swift_retain();
  IntentParameter.wrappedValue.setter();
  swift_release();
  swift_release();
  uint64_t v63 = v46;
  uint64_t v64 = v47;
  swift_retain();
  swift_retain();
  swift_retain();
  IntentParameter.wrappedValue.setter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v63 = v48;
  uint64_t v64 = v49;
  swift_retain();
  swift_retain();
  swift_retain();
  IntentParameter.wrappedValue.setter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v38 = type metadata accessor for IntentMediaItem();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v38 - 8) + 8))(v50, v38);
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v51, v35);
  swift_release();
  swift_release();
  swift_release();
  return v34;
}

uint64_t sub_10000C2CC()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10000C300()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10000C334()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10000C368()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource();
  sub_10000EEF0(v0, qword_10001EA30);
  sub_10000E89C(v0, (uint64_t)qword_10001EA30);
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10000C3CC()
{
  return sub_10000C5A4(&qword_10001E560, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001EA30);
}

uint64_t sub_10000C404@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C638(&qword_10001E560, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001EA30, a1);
}

uint64_t sub_10000C43C(uint64_t a1)
{
  return sub_10000C720(a1, &qword_10001E560, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001EA30);
}

uint64_t (*sub_10000C474())()
{
  if (qword_10001E560 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for LocalizedStringResource();
  sub_10000E89C(v0, (uint64_t)qword_10001EA30);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_10000C508()
{
  uint64_t v0 = type metadata accessor for IntentDescription();
  sub_10000EEF0(v0, qword_10001EA48);
  sub_10000E89C(v0, (uint64_t)qword_10001EA48);
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_10000C56C()
{
  return sub_10000C5A4(&qword_10001E568, (uint64_t (*)(void))&type metadata accessor for IntentDescription, (uint64_t)qword_10001EA48);
}

uint64_t sub_10000C5A4(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = a2(0);

  return sub_10000E89C(v5, a3);
}

uint64_t sub_10000C600@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C638(&qword_10001E568, (uint64_t (*)(void))&type metadata accessor for IntentDescription, (uint64_t)qword_10001EA48, a1);
}

uint64_t sub_10000C638@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_10000E89C(v7, a3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t sub_10000C6E8(uint64_t a1)
{
  return sub_10000C720(a1, &qword_10001E568, (uint64_t (*)(void))&type metadata accessor for IntentDescription, (uint64_t)qword_10001EA48);
}

uint64_t sub_10000C720(uint64_t a1, void *a2, uint64_t (*a3)(void), uint64_t a4)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v7 = a3(0);
  uint64_t v8 = sub_10000E89C(v7, a4);
  swift_beginAccess();
  uint64_t v9 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v8, a1, v7);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v7);
}

uint64_t (*sub_10000C80C())()
{
  if (qword_10001E568 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for IntentDescription();
  sub_10000E89C(v0, (uint64_t)qword_10001EA48);
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_10000C8A4()
{
  HIBYTE(qword_10001EA68) = -18;
}

uint64_t *sub_10000C8D4()
{
  if (qword_10001E570 != -1) {
    swift_once();
  }
  return &qword_10001EA60;
}

uint64_t sub_10000C920()
{
  if (qword_10001E570 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = qword_10001EA60;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_10000C9A4(uint64_t a1, uint64_t a2)
{
  if (qword_10001E570 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_10001EA60 = a1;
  qword_10001EA68 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_10000CA30())()
{
  if (qword_10001E570 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_10000CAB8()
{
  IntentParameter.wrappedValue.getter();
  return v1;
}

uint64_t (*sub_10000CAEC(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10000CB48;
}

uint64_t sub_10000CB4C()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_10000CB70()
{
  IntentParameter.wrappedValue.getter();
  return v1;
}

uint64_t (*sub_10000CBA4(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10000CB48;
}

uint64_t sub_10000CC00()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_10000CC24()
{
  IntentParameter.wrappedValue.getter();
  return v1;
}

uint64_t (*sub_10000CC58(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10000CB48;
}

void sub_10000CCB4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_10000CD00()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_10000CD24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[29] = a2;
  v4[30] = a4;
  v4[28] = a1;
  uint64_t v5 = type metadata accessor for Logger();
  v4[31] = v5;
  v4[32] = *(void *)(v5 - 8);
  v4[33] = swift_task_alloc();
  v4[34] = swift_task_alloc();
  v4[35] = swift_task_alloc();
  sub_10000E858(&qword_10001E3F8);
  v4[36] = swift_task_alloc();
  v4[37] = swift_task_alloc();
  return _swift_task_switch(sub_10000CE44, 0, 0);
}

uint64_t sub_10000CE44()
{
  uint64_t v42 = v0;
  if (TVAppFeature.isEnabled.getter())
  {
    _StringGuts.grow(_:)(47);
    swift_bridgeObjectRelease();
    uint64_t v40 = 0xD000000000000014;
    unint64_t v41 = 0x8000000100016D70;
    IntentParameter.wrappedValue.getter();
    uint64_t v1 = v0[22];
    if (v1) {
      uint64_t v2 = v0[21];
    }
    else {
      uint64_t v2 = 0x656E696665646E75;
    }
    if (v1) {
      unint64_t v3 = v0[22];
    }
    else {
      unint64_t v3 = 0xE900000000000064;
    }
    unint64_t v4 = v3;
    String.append(_:)(*(Swift::String *)&v2);
    swift_bridgeObjectRelease();
    v5._countAndFlagsBits = 0xD000000000000017;
    v5._object = (void *)0x8000000100016D90;
    String.append(_:)(v5);
    IntentParameter.wrappedValue.getter();
    uint64_t v6 = v0[24];
    if (v6) {
      uint64_t v7 = v0[23];
    }
    else {
      uint64_t v7 = 0x656E696665646E75;
    }
    if (v6) {
      unint64_t v8 = v0[24];
    }
    else {
      unint64_t v8 = 0xE900000000000064;
    }
    unint64_t v9 = v8;
    String.append(_:)(*(Swift::String *)&v7);
    swift_bridgeObjectRelease();
    v10._countAndFlagsBits = v40;
    uint64_t v11 = (void *)v41;
    uint64_t v40 = 0xD00000000000002ALL;
    unint64_t v41 = 0x8000000100016DB0;
    v10._object = v11;
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    v0[38] = 0xD00000000000002ALL;
    v0[39] = 0x8000000100016DB0;
    URL.init(string:)();
    if (qword_10001E570 != -1) {
      swift_once();
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    Logger.init(subsystem:category:)();
    swift_bridgeObjectRetain_n();
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    BOOL v14 = os_log_type_enabled(v12, v13);
    uint64_t v15 = v0[35];
    uint64_t v16 = v0[31];
    uint64_t v17 = v0[32];
    if (v14)
    {
      uint64_t v39 = v0[35];
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      v0[27] = sub_10000DCF4(0xD00000000000002ALL, 0x8000000100016DB0, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Deep linking to %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
      v19(v39, v16);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
      v19(v15, v16);
    }
    v0[40] = v19;
    id v28 = [self defaultWorkspace];
    v0[41] = v28;
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = v0[36];
      sub_10000E8D4(v0[37], v30);
      uint64_t v31 = type metadata accessor for URL();
      uint64_t v32 = *(void *)(v31 - 8);
      int v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31);
      uint64_t v35 = 0;
      if (v33 != 1)
      {
        uint64_t v36 = v0[36];
        URL._bridgeToObjectiveC()(v34);
        uint64_t v35 = v37;
        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v36, v31);
      }
      v0[42] = v35;
      v0[2] = v0;
      v0[7] = v0 + 25;
      v0[3] = sub_10000D4B4;
      uint64_t v38 = swift_continuation_init();
      v0[10] = _NSConcreteStackBlock;
      v0[11] = 0x40000000;
      v0[12] = sub_10000D924;
      v0[13] = &unk_100018E68;
      v0[14] = v38;
      [v29 openURL:v35 configuration:0 completionHandler:v0 + 10];
      id v28 = v0 + 2;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_await(v28);
  }
  else
  {
    if (qword_10001E570 != -1) {
      swift_once();
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    Logger.init(subsystem:category:)();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Feature flag disabled", v22, 2u);
      swift_slowDealloc();
    }
    uint64_t v23 = v0[34];
    uint64_t v24 = v0[31];
    uint64_t v25 = v0[32];

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
    static IntentResult.result<>()();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v26 = (uint64_t (*)(void))v0[1];
    return v26();
  }
}

uint64_t sub_10000D4B4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 344) = v1;
  if (v1)
  {
    uint64_t v2 = sub_10000D68C;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_10000D5CC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000D5CC()
{
  uint64_t v1 = *(void **)(v0 + 336);

  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + 296);
  static IntentResult.result<>()();
  sub_10000E93C(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10000D68C()
{
  uint64_t v18 = v0;
  uint64_t v1 = (void *)v0[42];
  uint64_t v2 = (void *)v0[41];
  swift_willThrow();

  swift_bridgeObjectRetain();
  Logger.init(subsystem:category:)();
  swift_bridgeObjectRetain();
  unint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = v0[39];
    uint64_t v6 = v0[38];
    uint64_t v15 = v0[33];
    uint64_t v16 = (void (*)(uint64_t, uint64_t))v0[40];
    uint64_t v14 = v0[31];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[26] = sub_10000DCF4(v6, v5, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Unable to deep link to %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();

    v16(v15, v14);
  }
  else
  {
    unint64_t v8 = (void (*)(uint64_t, uint64_t))v0[40];
    uint64_t v9 = v0[33];
    uint64_t v10 = v0[31];
    swift_bridgeObjectRelease_n();
    swift_errorRelease();

    v8(v9, v10);
  }
  uint64_t v11 = v0[37];
  static IntentResult.result<>()();
  sub_10000E93C(v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_10000D924(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_10000E858(&qword_10001E440);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2) {
      uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v10 = v8;
    sub_10000EE88((uint64_t)&v10, *(void *)(*(void *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_10000DA14@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001E560 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource();
  uint64_t v3 = sub_10000E89C(v2, (uint64_t)qword_10001EA30);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000DAE8(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = v1[2];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10000DB98;
  return sub_10000CD24(a1, v4, v6, v5);
}

uint64_t sub_10000DB98()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000DC8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000E34C();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_10000DCB8(uint64_t a1)
{
  unint64_t v2 = sub_10000EAD0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10000DCF4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000DDC8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000EE28((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000EE28((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000EDD8((uint64_t)v12);
  return v7;
}

uint64_t sub_10000DDC8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000DF84(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10000DF84(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000E01C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000E1FC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000E1FC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000E01C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10000E194(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000E194(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000E858(&qword_10001E430);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000E1FC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000E858(&qword_10001E430);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000E34C()
{
  uint64_t v46 = type metadata accessor for InputConnectionBehavior();
  uint64_t v0 = *(void *)(v46 - 8);
  __chkstk_darwin(v46, v1);
  uint64_t v44 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000E858(&qword_10001E3D0);
  __chkstk_darwin(v3 - 8, v4);
  unint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000E858(&qword_10001E3D8);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000E858(&qword_10001E3E0);
  __chkstk_darwin(v11 - 8, v12);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for LocalizedStringResource();
  uint64_t v38 = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  sub_10000E858(&qword_10001E3E8);
  LocalizedStringResource.init(stringLiteral:)();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  uint64_t v35 = v16 + 56;
  uint64_t v36 = v18;
  v18(v14, 1, 1, v15);
  uint64_t v19 = type metadata accessor for String.IntentInputOptions();
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v34 = v20 + 56;
  uint64_t v32 = v19;
  v45(v10, 1, 1, v19);
  uint64_t v42 = type metadata accessor for IntentDialog();
  uint64_t v21 = *(void *)(v42 - 8);
  unint64_t v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  uint64_t v43 = v21 + 56;
  uint64_t v22 = v6;
  v41(v6, 1, 1, v42);
  unsigned int v40 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v31 = *(void (**)(char *))(v0 + 104);
  uint64_t v39 = v0 + 104;
  uint64_t v23 = v46;
  v31(v44);
  uint64_t v24 = v22;
  uint64_t v37 = IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
  LocalizedStringResource.init(stringLiteral:)();
  uint64_t v25 = v36;
  v36(v14, 1, 1, v38);
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  v45(v10, 1, 1, v19);
  uint64_t v26 = v24;
  v41(v24, 1, 1, v42);
  uint64_t v27 = v44;
  uint64_t v28 = v23;
  uint64_t v29 = v31;
  ((void (*)(char *, void, uint64_t))v31)(v44, v40, v28);
  uint64_t v33 = IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
  LocalizedStringResource.init(stringLiteral:)();
  v25(v14, 1, 1, v38);
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  v45(v10, 1, 1, v32);
  v41(v26, 1, 1, v42);
  ((void (*)(char *, void, uint64_t))v29)(v27, v40, v46);
  IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
  return v37;
}

uint64_t sub_10000E858(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000E89C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000E8D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E858(&qword_10001E3F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E93C(uint64_t a1)
{
  uint64_t v2 = sub_10000E858(&qword_10001E3F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000E9A0()
{
  unint64_t result = qword_10001E400;
  if (!qword_10001E400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E400);
  }
  return result;
}

unint64_t sub_10000E9F8()
{
  unint64_t result = qword_10001E408;
  if (!qword_10001E408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E408);
  }
  return result;
}

uint64_t sub_10000EA4C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000EA80()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000EAD0()
{
  unint64_t result = qword_10001E410;
  if (!qword_10001E410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E410);
  }
  return result;
}

uint64_t destroy for PurchaseIntent()
{
  swift_release();
  swift_release();

  return swift_release();
}

void *_s7AppleTV14PurchaseIntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PurchaseIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for PurchaseIntent(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PurchaseIntent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseIntent(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PurchaseIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PurchaseIntent()
{
  return &type metadata for PurchaseIntent;
}

unint64_t sub_10000ED34()
{
  unint64_t result = qword_10001E420;
  if (!qword_10001E420)
  {
    sub_10000ED90(&qword_10001E428);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E420);
  }
  return result;
}

uint64_t sub_10000ED90(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000EDD8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000EE28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000EE88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E858(&qword_10001E438);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10000EEF0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000EF58()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource();
  sub_10000EEF0(v0, qword_10001EA70);
  sub_10000E89C(v0, (uint64_t)qword_10001EA70);
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10000EFBC()
{
  return sub_10000C5A4(&qword_10001E700, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001EA70);
}

uint64_t sub_10000EFF4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C638(&qword_10001E700, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001EA70, a1);
}

uint64_t sub_10000F02C(uint64_t a1)
{
  return sub_10000C720(a1, &qword_10001E700, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001EA70);
}

uint64_t (*sub_10000F064())()
{
  if (qword_10001E700 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for LocalizedStringResource();
  sub_10000E89C(v0, (uint64_t)qword_10001EA70);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_10000F0F8()
{
  uint64_t v0 = type metadata accessor for IntentDescription();
  sub_10000EEF0(v0, qword_10001EA88);
  sub_10000E89C(v0, (uint64_t)qword_10001EA88);
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_10000F15C()
{
  return sub_10000C5A4(&qword_10001E708, (uint64_t (*)(void))&type metadata accessor for IntentDescription, (uint64_t)qword_10001EA88);
}

uint64_t sub_10000F194@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C638(&qword_10001E708, (uint64_t (*)(void))&type metadata accessor for IntentDescription, (uint64_t)qword_10001EA88, a1);
}

uint64_t sub_10000F1CC(uint64_t a1)
{
  return sub_10000C720(a1, &qword_10001E708, (uint64_t (*)(void))&type metadata accessor for IntentDescription, (uint64_t)qword_10001EA88);
}

uint64_t (*sub_10000F204())()
{
  if (qword_10001E708 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for IntentDescription();
  sub_10000E89C(v0, (uint64_t)qword_10001EA88);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_10000F298()
{
  return sub_10000F734(25705, 0xE200000000000000);
}

uint64_t sub_10000F2A4()
{
  return sub_10000F734(0xD00000000000001CLL, 0x80000001000170B0);
}

void sub_10000F2C0()
{
  HIBYTE(qword_10001EAA8) = -18;
}

uint64_t *sub_10000F2F0()
{
  if (qword_10001E710 != -1) {
    swift_once();
  }
  return &qword_10001EAA0;
}

uint64_t sub_10000F33C()
{
  if (qword_10001E710 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = qword_10001EAA0;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_10000F3C0(uint64_t a1, uint64_t a2)
{
  if (qword_10001E710 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_10001EAA0 = a1;
  qword_10001EAA8 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_10000F44C())()
{
  if (qword_10001E710 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_10000F4D4(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = type metadata accessor for Logger();
  void v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_10000F594, 0, 0);
}

uint64_t sub_10000F594()
{
  if ((TVAppFeature.isEnabled.getter() & 1) == 0)
  {
    if (qword_10001E710 != -1) {
      swift_once();
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    Logger.init(subsystem:category:)();
    uint64_t v1 = Logger.logObject.getter();
    os_log_type_t v2 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Feature flag disabled", v3, 2u);
      swift_slowDealloc();
    }
    uint64_t v5 = v0[7];
    uint64_t v4 = v0[8];
    uint64_t v6 = v0[6];

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  }
  static IntentResult.result<>()();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_10000F734(uint64_t a1, uint64_t a2)
{
  v25[0] = a1;
  v25[1] = a2;
  uint64_t v2 = type metadata accessor for InputConnectionBehavior();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000E858(&qword_10001E3D0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000E858(&qword_10001E3D8);
  __chkstk_darwin(v11 - 8, v12);
  uint64_t v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000E858(&qword_10001E3E0);
  __chkstk_darwin(v15 - 8, v16);
  uint64_t v18 = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for LocalizedStringResource();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19, v21);
  sub_10000E858(&qword_10001E3E8);
  LocalizedStringResource.init(stringLiteral:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v18, 1, 1, v19);
  uint64_t v22 = type metadata accessor for String.IntentInputOptions();
  v25[2] = 0;
  v25[3] = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v14, 1, 1, v22);
  uint64_t v23 = type metadata accessor for IntentDialog();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v10, 1, 1, v23);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, enum case for InputConnectionBehavior.default(_:), v2);
  return IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10000FA4C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001E700 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource();
  uint64_t v3 = sub_10000E89C(v2, (uint64_t)qword_10001EA70);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000FB0C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10000DB98;
  return sub_10000F4D4(a1);
}

uint64_t sub_10000FBA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000FC08();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000FBCC(uint64_t a1)
{
  unint64_t v2 = sub_100010154();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10000FC08()
{
  uint64_t v33 = type metadata accessor for InputConnectionBehavior();
  uint64_t v0 = *(void *)(v33 - 8);
  __chkstk_darwin(v33, v1);
  uint64_t v3 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000E858(&qword_10001E3D0);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000E858(&qword_10001E3D8);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000E858(&qword_10001E3E0);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for LocalizedStringResource();
  uint64_t v37 = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  uint64_t v38 = sub_10000E858(&qword_10001E3E8);
  LocalizedStringResource.init(stringLiteral:)();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  uint64_t v36 = v17 + 56;
  uint64_t v39 = v19;
  v19(v15, 1, 1, v16);
  uint64_t v20 = type metadata accessor for String.IntentInputOptions();
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  uint64_t v35 = v21 + 56;
  v34(v11, 1, 1, v20);
  uint64_t v22 = type metadata accessor for IntentDialog();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v32 = v23 + 56;
  v27[0] = v7;
  v31(v7, 1, 1, v22);
  unsigned int v29 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v24 = *(void (**)(void))(v0 + 104);
  v27[1] = v0 + 104;
  uint64_t v28 = (void (*)(char *, void, uint64_t))v24;
  uint64_t v25 = v33;
  v24(v3);
  uint64_t v30 = IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
  LocalizedStringResource.init(stringLiteral:)();
  v39(v15, 1, 1, v37);
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  v34(v11, 1, 1, v20);
  v31((char *)v27[0], 1, 1, v22);
  v28(v3, v29, v25);
  IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
  return v30;
}

unint64_t sub_100010024()
{
  unint64_t result = qword_10001E450;
  if (!qword_10001E450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E450);
  }
  return result;
}

unint64_t sub_10001007C()
{
  unint64_t result = qword_10001E458;
  if (!qword_10001E458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E458);
  }
  return result;
}

uint64_t sub_1000100D0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100010104()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100010154()
{
  unint64_t result = qword_10001E460;
  if (!qword_10001E460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E460);
  }
  return result;
}

uint64_t destroy for DownloadIntent()
{
  swift_release();

  return swift_release();
}

void *_s7AppleTV14DownloadIntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for DownloadIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for DownloadIntent(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for DownloadIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DownloadIntent(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DownloadIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DownloadIntent()
{
  return &type metadata for DownloadIntent;
}

uint64_t sub_100010364()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

id sub_100010374()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_10001E8A8 = (uint64_t)result;
  return result;
}

uint64_t sub_1000103C8(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EAB0);
}

uint64_t sub_1000103F0()
{
  return sub_1000118E0(&qword_10001E8B0, (uint64_t)qword_10001EAB0);
}

uint64_t sub_100010414@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E8B0, (uint64_t)qword_10001EAB0, a1);
}

uint64_t sub_100010438(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EAC8);
}

uint64_t sub_100010464()
{
  return sub_1000118E0(&qword_10001E8B8, (uint64_t)qword_10001EAC8);
}

uint64_t sub_100010488@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E8B8, (uint64_t)qword_10001EAC8, a1);
}

uint64_t sub_1000104AC(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EAE0);
}

uint64_t sub_1000104D0()
{
  return sub_1000118E0(&qword_10001E8C0, (uint64_t)qword_10001EAE0);
}

uint64_t sub_1000104F4@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E8C0, (uint64_t)qword_10001EAE0, a1);
}

uint64_t sub_100010518(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EAF8);
}

uint64_t sub_10001053C()
{
  return sub_1000118E0(&qword_10001E8C8, (uint64_t)qword_10001EAF8);
}

uint64_t sub_100010560@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E8C8, (uint64_t)qword_10001EAF8, a1);
}

uint64_t sub_100010584(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EB10);
}

uint64_t sub_1000105A8()
{
  return sub_1000118E0(&qword_10001E8D0, (uint64_t)qword_10001EB10);
}

uint64_t sub_1000105CC@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E8D0, (uint64_t)qword_10001EB10, a1);
}

uint64_t sub_1000105F0(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EB28);
}

uint64_t sub_100010610()
{
  return sub_1000118E0(&qword_10001E8D8, (uint64_t)qword_10001EB28);
}

uint64_t sub_100010634@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E8D8, (uint64_t)qword_10001EB28, a1);
}

uint64_t sub_100010658(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EB40);
}

uint64_t sub_100010684()
{
  return sub_1000118E0(&qword_10001E8E0, (uint64_t)qword_10001EB40);
}

uint64_t sub_1000106A8@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E8E0, (uint64_t)qword_10001EB40, a1);
}

uint64_t sub_1000106CC(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EB58);
}

uint64_t sub_1000106F4()
{
  return sub_1000118E0(&qword_10001E8E8, (uint64_t)qword_10001EB58);
}

uint64_t sub_100010718@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E8E8, (uint64_t)qword_10001EB58, a1);
}

uint64_t sub_10001073C(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EB70);
}

uint64_t sub_100010760()
{
  return sub_1000118E0(&qword_10001E8F0, (uint64_t)qword_10001EB70);
}

uint64_t sub_100010784@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E8F0, (uint64_t)qword_10001EB70, a1);
}

uint64_t sub_1000107A8(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EB88);
}

uint64_t sub_1000107C0()
{
  return sub_1000118E0(&qword_10001E8F8, (uint64_t)qword_10001EB88);
}

uint64_t sub_1000107E4@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E8F8, (uint64_t)qword_10001EB88, a1);
}

uint64_t sub_100010808(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EBA0);
}

uint64_t sub_100010834()
{
  return sub_1000118E0(&qword_10001E900, (uint64_t)qword_10001EBA0);
}

uint64_t sub_100010858@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E900, (uint64_t)qword_10001EBA0, a1);
}

uint64_t sub_10001087C(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EBB8);
}

uint64_t sub_1000108A0()
{
  return sub_1000118E0(&qword_10001E908, (uint64_t)qword_10001EBB8);
}

uint64_t sub_1000108C4@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E908, (uint64_t)qword_10001EBB8, a1);
}

uint64_t sub_1000108E8(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EBD0);
}

uint64_t sub_10001090C()
{
  return sub_1000118E0(&qword_10001E910, (uint64_t)qword_10001EBD0);
}

uint64_t sub_100010930@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E910, (uint64_t)qword_10001EBD0, a1);
}

uint64_t sub_100010954(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EBE8);
}

uint64_t sub_100010980()
{
  return sub_1000118E0(&qword_10001E918, (uint64_t)qword_10001EBE8);
}

uint64_t sub_1000109A4@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E918, (uint64_t)qword_10001EBE8, a1);
}

uint64_t sub_1000109C8(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EC00);
}

uint64_t sub_1000109EC()
{
  return sub_1000118E0(&qword_10001E920, (uint64_t)qword_10001EC00);
}

uint64_t sub_100010A10@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E920, (uint64_t)qword_10001EC00, a1);
}

uint64_t sub_100010A34(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EC18);
}

uint64_t sub_100010A58()
{
  return sub_1000118E0(&qword_10001E928, (uint64_t)qword_10001EC18);
}

uint64_t sub_100010A7C@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E928, (uint64_t)qword_10001EC18, a1);
}

uint64_t sub_100010AA0(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EC30);
}

uint64_t sub_100010AC4()
{
  return sub_1000118E0(&qword_10001E930, (uint64_t)qword_10001EC30);
}

uint64_t sub_100010AE8@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E930, (uint64_t)qword_10001EC30, a1);
}

uint64_t sub_100010B0C(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EC48);
}

uint64_t sub_100010B30()
{
  return sub_1000118E0(&qword_10001E938, (uint64_t)qword_10001EC48);
}

uint64_t sub_100010B54@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E938, (uint64_t)qword_10001EC48, a1);
}

uint64_t sub_100010B78(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EC60);
}

uint64_t sub_100010BA4()
{
  return sub_1000118E0(&qword_10001E940, (uint64_t)qword_10001EC60);
}

uint64_t sub_100010BC8@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E940, (uint64_t)qword_10001EC60, a1);
}

uint64_t sub_100010BEC(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EC78);
}

uint64_t sub_100010C10()
{
  return sub_1000118E0(&qword_10001E948, (uint64_t)qword_10001EC78);
}

uint64_t sub_100010C34@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E948, (uint64_t)qword_10001EC78, a1);
}

uint64_t sub_100010C58(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EC90);
}

uint64_t sub_100010C84()
{
  return sub_1000118E0(&qword_10001E950, (uint64_t)qword_10001EC90);
}

uint64_t sub_100010CA8@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E950, (uint64_t)qword_10001EC90, a1);
}

uint64_t sub_100010CCC(uint64_t a1)
{
  return sub_100011818(a1, qword_10001ECA8);
}

uint64_t sub_100010CF0()
{
  return sub_1000118E0(&qword_10001E958, (uint64_t)qword_10001ECA8);
}

uint64_t sub_100010D14@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E958, (uint64_t)qword_10001ECA8, a1);
}

uint64_t sub_100010D38(uint64_t a1)
{
  return sub_100011818(a1, qword_10001ECC0);
}

uint64_t sub_100010D5C()
{
  return sub_1000118E0(&qword_10001E960, (uint64_t)qword_10001ECC0);
}

uint64_t sub_100010D80@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E960, (uint64_t)qword_10001ECC0, a1);
}

uint64_t sub_100010DA4(uint64_t a1)
{
  return sub_100011818(a1, qword_10001ECD8);
}

uint64_t sub_100010DC8()
{
  return sub_1000118E0(&qword_10001E968, (uint64_t)qword_10001ECD8);
}

uint64_t sub_100010DEC@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E968, (uint64_t)qword_10001ECD8, a1);
}

uint64_t sub_100010E10(uint64_t a1)
{
  return sub_100011818(a1, qword_10001ECF0);
}

uint64_t sub_100010E34()
{
  return sub_1000118E0(&qword_10001E970, (uint64_t)qword_10001ECF0);
}

uint64_t sub_100010E58@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E970, (uint64_t)qword_10001ECF0, a1);
}

uint64_t sub_100010E7C(uint64_t a1)
{
  return sub_100011818(a1, qword_10001ED08);
}

uint64_t sub_100010EA8()
{
  return sub_1000118E0(&qword_10001E978, (uint64_t)qword_10001ED08);
}

uint64_t sub_100010ECC@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E978, (uint64_t)qword_10001ED08, a1);
}

uint64_t sub_100010EF0(uint64_t a1)
{
  return sub_100011818(a1, qword_10001ED20);
}

uint64_t sub_100010F14()
{
  return sub_1000118E0(&qword_10001E980, (uint64_t)qword_10001ED20);
}

uint64_t sub_100010F38@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E980, (uint64_t)qword_10001ED20, a1);
}

uint64_t sub_100010F5C(uint64_t a1)
{
  return sub_100011818(a1, qword_10001ED38);
}

uint64_t sub_100010F80()
{
  return sub_1000118E0(&qword_10001E988, (uint64_t)qword_10001ED38);
}

uint64_t sub_100010FA4@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E988, (uint64_t)qword_10001ED38, a1);
}

uint64_t sub_100010FC8(uint64_t a1)
{
  return sub_100011818(a1, qword_10001ED50);
}

uint64_t sub_100010FEC()
{
  return sub_1000118E0(&qword_10001E990, (uint64_t)qword_10001ED50);
}

uint64_t sub_100011010@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E990, (uint64_t)qword_10001ED50, a1);
}

uint64_t sub_100011034(uint64_t a1)
{
  return sub_100011818(a1, qword_10001ED68);
}

uint64_t sub_100011058()
{
  return sub_1000118E0(&qword_10001E998, (uint64_t)qword_10001ED68);
}

uint64_t sub_10001107C@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E998, (uint64_t)qword_10001ED68, a1);
}

uint64_t sub_1000110A0(uint64_t a1)
{
  return sub_100011818(a1, qword_10001ED80);
}

uint64_t sub_1000110C4()
{
  return sub_1000118E0(&qword_10001E9A0, (uint64_t)qword_10001ED80);
}

uint64_t sub_1000110E8@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E9A0, (uint64_t)qword_10001ED80, a1);
}

uint64_t sub_10001110C(uint64_t a1)
{
  return sub_100011818(a1, qword_10001ED98);
}

uint64_t sub_100011138()
{
  return sub_1000118E0(&qword_10001E9A8, (uint64_t)qword_10001ED98);
}

uint64_t sub_10001115C@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E9A8, (uint64_t)qword_10001ED98, a1);
}

uint64_t sub_100011180(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EDB0);
}

uint64_t sub_1000111A4()
{
  return sub_1000118E0(&qword_10001E9B0, (uint64_t)qword_10001EDB0);
}

uint64_t sub_1000111C8@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E9B0, (uint64_t)qword_10001EDB0, a1);
}

uint64_t sub_1000111EC(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EDC8);
}

uint64_t sub_100011210()
{
  return sub_1000118E0(&qword_10001E9B8, (uint64_t)qword_10001EDC8);
}

uint64_t sub_100011234@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E9B8, (uint64_t)qword_10001EDC8, a1);
}

uint64_t sub_100011258(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EDE0);
}

uint64_t sub_10001127C()
{
  return sub_1000118E0(&qword_10001E9C0, (uint64_t)qword_10001EDE0);
}

uint64_t sub_1000112A0@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E9C0, (uint64_t)qword_10001EDE0, a1);
}

uint64_t sub_1000112C4(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EDF8);
}

uint64_t sub_1000112E8()
{
  return sub_1000118E0(&qword_10001E9C8, (uint64_t)qword_10001EDF8);
}

uint64_t sub_10001130C@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E9C8, (uint64_t)qword_10001EDF8, a1);
}

uint64_t sub_100011330(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EE10);
}

uint64_t sub_100011354()
{
  return sub_1000118E0(&qword_10001E9D0, (uint64_t)qword_10001EE10);
}

uint64_t sub_100011378@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E9D0, (uint64_t)qword_10001EE10, a1);
}

uint64_t sub_10001139C(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EE28);
}

uint64_t sub_1000113C0()
{
  return sub_1000118E0(&qword_10001E9D8, (uint64_t)qword_10001EE28);
}

uint64_t sub_1000113E4@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E9D8, (uint64_t)qword_10001EE28, a1);
}

uint64_t sub_100011408(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EE40);
}

uint64_t sub_10001142C()
{
  return sub_1000118E0(&qword_10001E9E0, (uint64_t)qword_10001EE40);
}

uint64_t sub_100011450@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E9E0, (uint64_t)qword_10001EE40, a1);
}

uint64_t sub_100011474(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EE58);
}

uint64_t sub_1000114A0()
{
  return sub_1000118E0(&qword_10001E9E8, (uint64_t)qword_10001EE58);
}

uint64_t sub_1000114C4@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E9E8, (uint64_t)qword_10001EE58, a1);
}

uint64_t sub_1000114E8(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EE70);
}

uint64_t sub_10001150C()
{
  return sub_1000118E0(&qword_10001E9F0, (uint64_t)qword_10001EE70);
}

uint64_t sub_100011530@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E9F0, (uint64_t)qword_10001EE70, a1);
}

uint64_t sub_100011554(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EE88);
}

uint64_t sub_100011580()
{
  return sub_1000118E0(&qword_10001E9F8, (uint64_t)qword_10001EE88);
}

uint64_t sub_1000115A4@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001E9F8, (uint64_t)qword_10001EE88, a1);
}

uint64_t sub_1000115C8(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EEA0);
}

uint64_t sub_1000115EC()
{
  return sub_1000118E0(&qword_10001EA00, (uint64_t)qword_10001EEA0);
}

uint64_t sub_100011610@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001EA00, (uint64_t)qword_10001EEA0, a1);
}

uint64_t sub_100011634(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EEB8);
}

uint64_t sub_100011658()
{
  return sub_1000118E0(&qword_10001EA08, (uint64_t)qword_10001EEB8);
}

uint64_t sub_10001167C@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001EA08, (uint64_t)qword_10001EEB8, a1);
}

uint64_t sub_1000116A0(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EED0);
}

uint64_t sub_1000116CC()
{
  return sub_1000118E0(&qword_10001EA10, (uint64_t)qword_10001EED0);
}

uint64_t sub_1000116F0@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001EA10, (uint64_t)qword_10001EED0, a1);
}

uint64_t sub_100011714(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EEE8);
}

uint64_t sub_100011738()
{
  return sub_1000118E0(&qword_10001EA18, (uint64_t)qword_10001EEE8);
}

uint64_t sub_10001175C@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001EA18, (uint64_t)qword_10001EEE8, a1);
}

uint64_t sub_100011780(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EF00);
}

uint64_t sub_1000117A4()
{
  return sub_1000118E0(&qword_10001EA20, (uint64_t)qword_10001EF00);
}

uint64_t sub_1000117C8@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001EA20, (uint64_t)qword_10001EF00, a1);
}

uint64_t sub_1000117EC(uint64_t a1)
{
  return sub_100011818(a1, qword_10001EF18);
}

uint64_t sub_100011818(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for ImageResource();
  sub_10000EEF0(v3, a2);
  sub_10000E89C(v3, (uint64_t)a2);
  if (qword_10001E8A0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_10001E8A8;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000118BC()
{
  return sub_1000118E0(&qword_10001EA28, (uint64_t)qword_10001EF18);
}

uint64_t sub_1000118E0(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for ImageResource();

  return sub_10000E89C(v3, a2);
}

uint64_t sub_100011934@<X0>(uint64_t a1@<X8>)
{
  return sub_100011958(&qword_10001EA28, (uint64_t)qword_10001EF18, a1);
}

uint64_t sub_100011958@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for ImageResource();
  uint64_t v6 = sub_10000E89C(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100011A14(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Already have a previous AR completion handler for %@.  Calling it now", (uint8_t *)&v2, 0xCu);
}

void sub_100011A8C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Already have a previous completion handler for %@.  Calling it now", (uint8_t *)&v2, 0xCu);
}

void sub_100011B04(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out waiting for background URL session events to complete.", v1, 2u);
}

void sub_100011B48(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011BB4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011C20(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011C90()
{
  uint64_t v0 = abort_report_np();
  sub_100011CB8(v0);
}

void sub_100011CB8()
{
}

uint64_t static AppIntent.openAppWhenRun.getter()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t static AppIntent.description.getter()
{
  return static AppIntent.description.getter();
}

uint64_t static AppIntent.isDiscoverable.getter()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t static AppIntent.parameterSummary.getter()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t static AppIntent.authenticationPolicy.getter()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t static IntentResult.result<>()()
{
  return static IntentResult.result<>()();
}

uint64_t type metadata accessor for IntentMediaItem()
{
  return type metadata accessor for IntentMediaItem();
}

uint64_t IntentParameter.wrappedValue.modify()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t IntentParameter.wrappedValue.getter()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t IntentParameter.wrappedValue.setter()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t IntentParameter.projectedValue.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentDescription.init(stringLiteral:)()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t type metadata accessor for IntentDescription()
{
  return type metadata accessor for IntentDescription();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t type metadata accessor for ImageResource()
{
  return type metadata accessor for ImageResource();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t TVAppFeature.isEnabled.getter()
{
  return TVAppFeature.isEnabled.getter();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for String.IntentInputOptions()
{
  return type metadata accessor for String.IntentInputOptions();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t VUIDefaultLogObject()
{
  return _VUIDefaultLogObject();
}

uint64_t VUISignpostLogObject()
{
  return _VUISignpostLogObject();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend__blockExecutionInTabBarController_documentRef_totalChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_blockExecutionInTabBarController:documentRef:totalChildren:");
}

id objc_msgSend__canHandleTest_(void *a1, const char *a2, ...)
{
  return [a1 _canHandleTest:];
}

id objc_msgSend__contentScrollsAlongXAxis(void *a1, const char *a2, ...)
{
  return _[a1 _contentScrollsAlongXAxis];
}

id objc_msgSend__downloadSessionDidFinishEventsForBackgroundURLSession_(void *a1, const char *a2, ...)
{
  return [a1 _downloadSessionDidFinishEventsForBackgroundURLSession:];
}

id objc_msgSend__findCollectionViewInView_(void *a1, const char *a2, ...)
{
  return [a1 _findCollectionViewInView:];
}

id objc_msgSend__findLabelInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findLabelInView:");
}

id objc_msgSend__findLabelWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findLabelWithTitle:inView:");
}

id objc_msgSend__findScrollViewInViewController_(void *a1, const char *a2, ...)
{
  return [a1 _findScrollViewInViewController:];
}

id objc_msgSend__findShelfViewControllerInViewController_withShelfRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findShelfViewControllerInViewController:withShelfRow:");
}

id objc_msgSend__findShelfViewControllerInViewController_withTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findShelfViewControllerInViewController:withTitle:");
}

id objc_msgSend__findTVButtonWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findTVButtonWithTitle:inView:");
}

id objc_msgSend__findUIButtonWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findUIButtonWithTitle:inView:");
}

id objc_msgSend__findVUIRoundButtonWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findVUIRoundButtonWithTitle:inView:");
}

id objc_msgSend__findViewOfType_inView_withFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findViewOfType:inView:withFilter:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__performScrollTest_iterations_delta_length_scrollAxis_extraResultsBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:");
}

id objc_msgSend__registerTests(void *a1, const char *a2, ...)
{
  return _[a1 _registerTests];
}

id objc_msgSend__scrollHalfTheScreenHeightIn_(void *a1, const char *a2, ...)
{
  return [a1 _scrollHalfTheScreenHeightIn:];
}

id objc_msgSend__selectButtonWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectButtonWithTitle:inView:");
}

id objc_msgSend__setContentScrollsAlongXAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContentScrollsAlongXAxis:");
}

id objc_msgSend__sourceApplication(void *a1, const char *a2, ...)
{
  return _[a1 _sourceApplication];
}

id objc_msgSend__topViewControllerInTabBarController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_topViewControllerInTabBarController:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _[a1 activityType];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addObserverForName:object:queue:usingBlock:];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_applicationDidFinishLaunchingWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 applicationDidFinishLaunchingWithOptions:];
}

id objc_msgSend_applicationLoadCompletion(void *a1, const char *a2, ...)
{
  return _[a1 applicationLoadCompletion];
}

id objc_msgSend_applicationWillFinishLaunchingWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 applicationWillFinishLaunchingWithOptions:];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_canHandleTest_(void *a1, const char *a2, ...)
{
  return [a1 canHandleTest:];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return [a1 cancelPreviousPerformRequestsWithTarget:selector:object:];
}

id objc_msgSend_cellForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 cellForItemAtIndexPath:];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 childViewControllers];
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return _[a1 cleanUp];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 conformsToProtocol:];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _[a1 contentOffset];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentTitle(void *a1, const char *a2, ...)
{
  return _[a1 currentTitle];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_findScrollViewInView_desiredScrollViewClass_(void *a1, const char *a2, ...)
{
  return [a1 findScrollViewInView:desiredScrollViewClass:];
}

id objc_msgSend_findScrollViewInView_desiredScrollViewClass_numScrollViewsToSkip_(void *a1, const char *a2, ...)
{
  return [a1 findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_handleEventsForARQLBackgroundURLSessionCompletionHandler(void *a1, const char *a2, ...)
{
  return _[a1 handleEventsForARQLBackgroundURLSessionCompletionHandler];
}

id objc_msgSend_handleEventsForBackgroundURLSessionCompletionHandler(void *a1, const char *a2, ...)
{
  return _[a1 handleEventsForBackgroundURLSessionCompletionHandler];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForItem:inSection:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithTestName_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithTestName:scrollView:completionHandler:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isRecapAvailable];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _[a1 keyWindow];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return [a1 numberOfItemsInSection:];
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return _[a1 numberOfSections];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_openURL_options_(void *a1, const char *a2, ...)
{
  return [a1 openURL:options:];
}

id objc_msgSend_overrideOrientation(void *a1, const char *a2, ...)
{
  return _[a1 overrideOrientation];
}

id objc_msgSend_overridesOrientationLock(void *a1, const char *a2, ...)
{
  return _[a1 overridesOrientationLock];
}

id objc_msgSend_performScrollViewTest_testOptions_scrollAxis_tabBarController_scrollViewBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:];
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:];
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:afterDelay:];
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return [a1 popToRootViewControllerAnimated:];
}

id objc_msgSend_preWarm_(void *a1, const char *a2, ...)
{
  return [a1 preWarm:];
}

id objc_msgSend_prepareForPPT(void *a1, const char *a2, ...)
{
  return _[a1 prepareForPPT];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:format:];
}

id objc_msgSend_referrerURL(void *a1, const char *a2, ...)
{
  return _[a1 referrerURL];
}

id objc_msgSend_registerBgUrlSessionNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerBgUrlSessionNotifications];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_resetNumScrollViewFound(void *a1, const char *a2, ...)
{
  return _[a1 resetNumScrollViewFound];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_runTest_app_(void *a1, const char *a2, ...)
{
  return [a1 runTest:app:];
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return [a1 runTestWithParameters:];
}

id objc_msgSend_selectTabWithTitle_inTabBarController_(void *a1, const char *a2, ...)
{
  return [a1 selectTabWithTitle:inTabBarController:];
}

id objc_msgSend_selectedViewController(void *a1, const char *a2, ...)
{
  return _[a1 selectedViewController];
}

id objc_msgSend_setApplicationLoadCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setApplicationLoadCompletion:];
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return [a1 setContentOffset:animated:];
}

id objc_msgSend_setHandleEventsForARQLBackgroundURLSessionCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setHandleEventsForARQLBackgroundURLSessionCompletionHandler:];
}

id objc_msgSend_setHandleEventsForBackgroundURLSessionCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setHandleEventsForBackgroundURLSessionCompletionHandler:];
}

id objc_msgSend_setMainWindow_(void *a1, const char *a2, ...)
{
  return [a1 setMainWindow:];
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return [a1 setMaxConcurrentOperationCount:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setSelectedIndex_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedIndex:];
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return [a1 setWindow:];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingComparator:];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_tabBarController_didSelectViewController_(void *a1, const char *a2, ...)
{
  return [a1 tabBarController:didSelectViewController:];
}

id objc_msgSend_tabBarItems(void *a1, const char *a2, ...)
{
  return _[a1 tabBarItems];
}

id objc_msgSend_templateViewController(void *a1, const char *a2, ...)
{
  return _[a1 templateViewController];
}

id objc_msgSend_testLog(void *a1, const char *a2, ...)
{
  return _[a1 testLog];
}

id objc_msgSend_testOperationQueue(void *a1, const char *a2, ...)
{
  return _[a1 testOperationQueue];
}

id objc_msgSend_testsManifest(void *a1, const char *a2, ...)
{
  return _[a1 testsManifest];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textLabels(void *a1, const char *a2, ...)
{
  return _[a1 textLabels];
}

id objc_msgSend_topMostController(void *a1, const char *a2, ...)
{
  return _[a1 topMostController];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 valueForKeyPath:];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return _[a1 visibleCells];
}

id objc_msgSend_vui_ppt_isLoading(void *a1, const char *a2, ...)
{
  return [a1 vui_ppt_isLoading];
}

id objc_msgSend_vui_stringForKey_(void *a1, const char *a2, ...)
{
  return [a1 vui_stringForKey:];
}

id objc_msgSend_waitForTabWithTitleToLoad_inTabBarController_totalChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForTabWithTitleToLoad:inTabBarController:totalChildren:");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _[a1 webpageURL];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return _[a1 workQueue];
}