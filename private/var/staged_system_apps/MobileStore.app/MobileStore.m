uint64_t start(int a1, char **a2)
{
  void *v4;

  +[SUUIApplicationController prepareForLaunch];
  UIApplicationMain(a1, a2, @"MSApplication", @"MSApplicationDelegate");
  return 0;
}

void sub_100004EF4(id a1)
{
  id v3 = +[SUUIClientContext amsBag];
  id v1 = [objc_alloc((Class)AMSSharedStoreReview) initWithBag:v3];
  v2 = (void *)qword_100015E38;
  qword_100015E38 = (uint64_t)v1;
}

void sub_100005150(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10000548C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = +[SSLogConfig sharedConfig];
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (a2)
  {
    if (v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      *(_DWORD *)v14 = 138543362;
      *(void *)&v14[4] = objc_opt_class();
      id v11 = *(id *)&v14[4];
      LODWORD(v13) = 12;
      goto LABEL_11;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!v8) {
    goto LABEL_13;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(_DWORD *)v14 = 138543618;
  *(void *)&v14[4] = objc_opt_class();
  *(_WORD *)&v14[12] = 2114;
  *(void *)&v14[14] = v5;
  id v11 = *(id *)&v14[4];
  LODWORD(v13) = 22;
LABEL_11:
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v14, v13, *(_OWORD *)v14);
    free(v12);
    SSFileLog();
    goto LABEL_13;
  }
LABEL_14:
}

id sub_100006614(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 localizedStringForKey:a2 inTable:SUUILocalizedStringTableTabBar];
  }
  else {
  id v3 = +[SUUIClientContext localizedStringForKey:a2 inBundles:0 inTable:SUUILocalizedStringTableTabBar];
  }

  return v3;
}

UIColor *sub_100006678()
{
  return +[UIColor systemBlueColor];
}

void sub_100006984(id a1)
{
  qword_100015E08 = objc_alloc_init(MSQuickActionController);

  _objc_release_x1();
}

void sub_100006C8C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) type];
  id v3 = [v2 lowercaseString];

  v4 = [*(id *)(a1 + 40) tabBarController];
  id v5 = v4;
  if (v4)
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = sub_100007070;
    v35 = sub_100007080;
    id v36 = [v4 selectedViewController];
    v6 = [@"com.apple.MobileStore.search" lowercaseString];
    unsigned int v7 = [v3 isEqualToString:v6];

    if (v7)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100007088;
      v28[3] = &unk_100010498;
      int v8 = &v29;
      id v29 = *(id *)(a1 + 40);
      id v30 = v5;
      v9 = objc_retainBlock(v28);
      v10 = v30;
    }
    else
    {
      v12 = [@"com.apple.MobileStore.redeem" lowercaseString];
      unsigned int v13 = [v3 isEqualToString:v12];

      if (v13)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10000721C;
        v26[3] = &unk_1000104C0;
        int v8 = (id *)v27;
        v27[0] = *(id *)(a1 + 40);
        v27[1] = &v31;
        v9 = objc_retainBlock(v26);
LABEL_9:

        if (v9)
        {
          v14 = [(id)v32[5] presentedViewController];

          if (v14) {
            [(id)v32[5] dismissViewControllerAnimated:0 completion:v9];
          }
          else {
            ((void (*)(void *))v9[2])(v9);
          }
        }
        goto LABEL_18;
      }
      v15 = [@"com.apple.MobileStore.viewdownloads" lowercaseString];
      unsigned int v16 = [v3 isEqualToString:v15];

      if (v16)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000072E4;
        v23[3] = &unk_100010498;
        int v8 = &v24;
        id v24 = *(id *)(a1 + 40);
        id v25 = v5;
        v9 = objc_retainBlock(v23);
        v10 = v25;
      }
      else
      {
        v17 = [@"com.apple.MobileStore.purchased" lowercaseString];
        unsigned int v18 = [v3 isEqualToString:v17];

        if (!v18)
        {
          v9 = 0;
LABEL_18:
          uint64_t v19 = *(void *)(a1 + 48);
          if (v19) {
            (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, 1);
          }

          _Block_object_dispose(&v31, 8);
          goto LABEL_21;
        }
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1000074E8;
        v20[3] = &unk_100010498;
        int v8 = &v21;
        id v21 = *(id *)(a1 + 40);
        id v22 = v5;
        v9 = objc_retainBlock(v20);
        v10 = v22;
      }
    }

    goto LABEL_9;
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
  }
LABEL_21:
}

void sub_100007058(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007070(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007080(uint64_t a1)
{
}

void sub_100007088(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) selectTabWithIdentifier:@"search"];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007130;
  block[3] = &unk_100010470;
  id v4 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100007130(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) selectedNavigationController];
  id v3 = [v2 viewControllers];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 2)
  {
    id v5 = [*(id *)(a1 + 32) selectedNavigationController];
    id v6 = [v5 popToRootViewControllerAnimated:0];
  }
  unsigned int v7 = [*(id *)(a1 + 32) selectedNavigationController];
  int v8 = [v7 viewControllers];
  id v9 = [v8 firstObject];

  [v9 _setMakeSearchBarFirstResponderOnLoad:1];
  [v9 _setSelectSearchBarContentOnBecomingFirstResponder:1];
  [v9 _reloadNavigationBarController];
}

void sub_10000721C(uint64_t a1)
{
  id v2 = +[SSAccountStore defaultStore];
  id v5 = [v2 activeAccount];

  if (([v5 isManagedAppleID] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) clientContext];
    id v4 = [objc_alloc((Class)SUUIRedeemViewController) initWithRedeemCategory:0];
    [v4 setClientContext:v3];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) presentViewController:v4 animated:0 completion:0];
  }
}

void sub_1000072E4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) selectTabWithIdentifier:@"downloads"];
  id v3 = [*(id *)(a1 + 40) moreNavigationController];
  id v4 = [*(id *)(a1 + 40) allViewControllers];
  id v5 = [v4 indexOfObject:v2];

  id v6 = [*(id *)(a1 + 40) allViewControllers];
  id v7 = [v6 indexOfObject:v3];

  if (v5 > v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100007408;
    v8[3] = &unk_100010498;
    id v9 = v3;
    id v10 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }
}

void sub_100007408(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v7;
    id v3 = [v2 moreViewControllers];
    id v4 = [v3 indexOfObject:*(void *)(a1 + 40)];

    id v5 = [v2 table];
    id v6 = +[NSIndexPath indexPathForRow:v4 inSection:0];
    [v2 tableView:v5 didSelectRowAtIndexPath:v6];
  }
}

void sub_1000074E8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) selectTabWithIdentifier:@"purchased"];
  id v3 = [*(id *)(a1 + 40) moreNavigationController];
  id v4 = [*(id *)(a1 + 40) allViewControllers];
  id v5 = [v4 indexOfObject:v2];

  id v6 = [*(id *)(a1 + 40) allViewControllers];
  id v7 = [v6 indexOfObject:v3];

  if (v5 > v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000760C;
    v8[3] = &unk_100010498;
    id v9 = v3;
    id v10 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }
}

void sub_10000760C(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v7;
    id v3 = [v2 moreViewControllers];
    id v4 = [v3 indexOfObject:*(void *)(a1 + 40)];

    id v5 = [v2 table];
    id v6 = +[NSIndexPath indexPathForRow:v4 inSection:0];
    [v2 tableView:v5 didSelectRowAtIndexPath:v6];
  }
}

void sub_1000078F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

uint64_t sub_100007AE8()
{
  if (qword_100015E20 != -1) {
    dispatch_once(&qword_100015E20, &stru_100010508);
  }
  return qword_100015E18;
}

void sub_100007B2C(id a1)
{
  qword_100015E18 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AppleAccountUI.framework/AppleAccountUI", 1);
}

uint64_t sub_100007B58()
{
  if (qword_100015E30 != -1) {
    dispatch_once(&qword_100015E30, &stru_100010528);
  }
  return qword_100015E28;
}

void sub_100007B9C(id a1)
{
  qword_100015E28 = (uint64_t)dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 1);
}

id sub_100007BC8(NSString *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = NSClassFromString(a1);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

void *sub_100007C0C(char *__symbol, void *__handle)
{
  if (__handle) {
    return dlsym(__handle, __symbol);
  }
  else {
    return 0;
  }
}

void sub_100007F5C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 tabIdentifier];
  [v2 addObject:v3];
}

void sub_10000840C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) tabBarItems];
  id v3 = [v2 indexOfObjectPassingTest:&stru_100010590];

  if ((((v3 == (id)0x7FFFFFFFFFFFFFFFLL) ^ [*(id *)(a1 + 32) _showsDownloadsTabForDownloadManager:*(void *)(a1 + 40)]) & 1) == 0)
  {
    id v11 = [*(id *)(*(void *)(a1 + 32) + 8) rootViewController];
    id v4 = *(void **)(a1 + 32);
    id v5 = [v11 view];
    [v5 bounds];
    id v7 = [v4 _tabBarStyleWithWidth:v6];

    int v8 = *(void **)(a1 + 32);
    id v9 = (void *)v8[1];
    id v10 = [v8 _newTabBarItemsWithStyle:v7];
    [v9 updateTabBarWithItems:v10 animated:1];
  }
}

BOOL sub_10000850C(id a1, SUUITabBarItem *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(SUUITabBarItem *)a2 tabIdentifier];
  unsigned __int8 v5 = [v4 isEqualToString:@"downloads"];

  return v5;
}

void sub_100008958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008978(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showExternalURL:*(void *)(a1 + 32)];
}

void sub_100008E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008E54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[MSQuickActionController processShortcutItem:*(void *)(a1 + 32) applicationController:WeakRetained completionHandler:*(void *)(a1 + 40)];
}

void sub_100008F50(uint64_t a1, char a2)
{
  dispatch_time_t v4 = dispatch_time(0, 250000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009010;
  v8[3] = &unk_100010608;
  id v5 = *(id *)(a1 + 32);
  char v12 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v8);
}

id sub_100009010(uint64_t a1)
{
  if ([*(id *)(a1 + 32) applicationState])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 56))
    {
      *(unsigned char *)(v2 + 64) = 0;
    }
    else
    {
      *(unsigned char *)(v2 + 64) = 1;
      [*(id *)(*(void *)(a1 + 40) + 8) suspendApplicationWithOptions:0];
      id v3 = [*(id *)(*(void *)(a1 + 40) + 8) clientContext];
      [v3 setPurchaseReferrerURL:0];

      uint64_t v4 = *(void *)(a1 + 40);
      id v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = 0;
    }
  }
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);

  return [v6 endBackgroundTask:v7];
}

void sub_100009124(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 56);
  if (!v2)
  {
    uint64_t v4 = +[UIApplication sharedApplication];
    [v4 setNetworkActivityIndicatorVisible:1];

    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void *)(v1 + 56);
  }
  *(void *)(v1 + 56) = v2 + 1;
}

void sub_1000091F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 56);
  if (v2 < 2)
  {
    if (v2 == 1)
    {
      dispatch_time_t v4 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000092AC;
      block[3] = &unk_100010470;
      void block[4] = *(void *)(a1 + 32);
      dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    *(void *)(v1 + 56) = v2 - 1;
  }
}

void sub_1000092AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 56);
  if (v2 < 2)
  {
    if (v2 == 1)
    {
      *(void *)(v1 + 56) = 0;
      id v3 = +[UIApplication sharedApplication];
      [v3 setNetworkActivityIndicatorVisible:0];
    }
  }
  else
  {
    *(void *)(v1 + 56) = v2 - 1;
  }
}

void sub_100009484(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 72) windowScene];
  +[SKStoreReviewController requestReviewInScene:v1];
}

NSString *__cdecl sub_10000994C(id a1, NSString *a2)
{
  uint64_t v2 = a2;
  id v3 = +[NSBundle mainBundle];
  dispatch_time_t v4 = [v3 localizedStringForKey:v2 value:&stru_1000107F8 table:SUUILocalizedStringTableTabBar];

  return (NSString *)v4;
}

uint64_t sub_1000099D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 tabIdentifier];
  id v8 = [v5 indexOfObject:v7];

  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v6 tabIdentifier];

  id v11 = [v9 indexOfObject:v10];
  if ((uint64_t)v8 < (uint64_t)v11) {
    return -1;
  }
  else {
    return (uint64_t)v8 > (uint64_t)v11;
  }
}

void sub_100009B54(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[1] showExternalURL:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void sub_100009CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009D0C(uint64_t a1, void *a2, void *a3)
{
  id v29 = a2;
  id v28 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    from = (id *)(a1 + 32);
    v26 = WeakRetained;
    v27 = [v29 objectForKey:SUUIConfigurationKeyTabs];
    id v30 = [v29 objectForKey:SUUIConfigurationKeyStopPages];
    int has_internal_content = os_variant_has_internal_content();
    uint64_t v6 = 2;
    if (!v28 && v27)
    {
      uint64_t v7 = [v27 objectForKeyedSubscript:@"standard"];
      id v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [v27 objectForKeyedSubscript:@"compact"];
      }
      uint64_t v10 = v9;

      int v11 = _os_feature_enabled_impl();
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v12 = v10;
      char v13 = 0;
      char v14 = 0;
      id v15 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v35;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v12);
            }
            unsigned int v18 = [*(id *)(*((void *)&v34 + 1) + 8 * i) objectForKeyedSubscript:@"id"];
            if ([v18 isEqualToString:@"tv"])
            {
              if (v11)
              {
                if (has_internal_content && (_os_feature_enabled_impl() & 1) != 0)
                {
                  BOOL v19 = 1;
                }
                else if (_os_feature_enabled_impl())
                {
                  id v22 = [v30 objectForKeyedSubscript:@"tv"];
                  BOOL v19 = v22 != 0;
                }
                else
                {
                  BOOL v19 = 0;
                }
                char v14 = !v19;
              }
              else
              {
                char v14 = 1;
              }
            }
            else
            {
              unsigned int v20 = [v18 isEqualToString:@"movies"];
              if (v20) {
                char v13 = 1;
              }
              if ((v20 & v11) == 1)
              {
                if (has_internal_content && (_os_feature_enabled_impl() & 1) != 0)
                {
                  BOOL v21 = 1;
                }
                else if (_os_feature_enabled_impl())
                {
                  v23 = [v30 objectForKeyedSubscript:@"movies"];
                  BOOL v21 = v23 != 0;
                }
                else
                {
                  BOOL v21 = 0;
                }
                char v13 = !v21;
              }
            }
          }
          id v15 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v15);
      }

      if (v13) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = 2;
      }
      if ((v13 & 1 & v14) != 0) {
        uint64_t v6 = 0;
      }
    }
    id v24 = [v26[1] rootViewController];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10000A110;
    v32[3] = &unk_100010708;
    objc_copyWeak(&v33, from);
    +[MSOnboardingUtil presentIfNeededFromViewController:v24 mediaTypes:v6 completion:v32];

    objc_destroyWeak(&v33);
    id WeakRetained = v26;
  }
}

void sub_10000A0F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A110(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_time_t v4 = WeakRetained;
  if (a2)
  {
    id v5 = (void *)WeakRetained[4];
    uint64_t v10 = v4;
    if (v5)
    {
      [v5 checkForNotifications];
      dispatch_time_t v4 = v10;
    }
    uint64_t v6 = v4[10];
    if (v6)
    {
      (*(void (**)(void))(v6 + 16))();
      uint64_t v7 = (void *)v10[10];
      v10[10] = 0;

      dispatch_time_t v4 = v10;
    }
    id WeakRetained = (void *)v4[11];
    if (WeakRetained)
    {
      ((void (*)(void))WeakRetained[2])();
      id v8 = (void *)v10[11];
      v10[11] = 0;

      dispatch_time_t v4 = v10;
    }
  }

  return _objc_release_x1(WeakRetained, v4);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t SSDialogGetDaemonDialogState()
{
  return _SSDialogGetDaemonDialogState();
}

uint64_t SSFileLog()
{
  return _SSFileLog();
}

uint64_t SUUIBundle()
{
  return _SUUIBundle();
}

uint64_t SUUIUserInterfaceIdiom()
{
  return _SUUIUserInterfaceIdiom();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return [a1 OSLogObject];
}

id objc_msgSend__downloadManager(void *a1, const char *a2, ...)
{
  return [a1 _downloadManager];
}

id objc_msgSend__hasDisplayedFamilySetup(void *a1, const char *a2, ...)
{
  return [a1 _hasDisplayedFamilySetup];
}

id objc_msgSend__imageThatSuppressesAccessibilityHairlineThickening(void *a1, const char *a2, ...)
{
  return [a1 _imageThatSuppressesAccessibilityHairlineThickening];
}

id objc_msgSend__reloadNavigationBarController(void *a1, const char *a2, ...)
{
  return [a1 _reloadNavigationBarController];
}

id objc_msgSend__requestAuthorization(void *a1, const char *a2, ...)
{
  return [a1 _requestAuthorization];
}

id objc_msgSend__shortcutItems(void *a1, const char *a2, ...)
{
  return [a1 _shortcutItems];
}

id objc_msgSend__storeReview(void *a1, const char *a2, ...)
{
  return [a1 _storeReview];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return [a1 activeAccount];
}

id objc_msgSend_allViewControllers(void *a1, const char *a2, ...)
{
  return [a1 allViewControllers];
}

id objc_msgSend_amsBag(void *a1, const char *a2, ...)
{
  return [a1 amsBag];
}

id objc_msgSend_applicationDidForeground(void *a1, const char *a2, ...)
{
  return [a1 applicationDidForeground];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buyParameters(void *a1, const char *a2, ...)
{
  return [a1 buyParameters];
}

id objc_msgSend_checkForNotifications(void *a1, const char *a2, ...)
{
  return [a1 checkForNotifications];
}

id objc_msgSend_clientContext(void *a1, const char *a2, ...)
{
  return [a1 clientContext];
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return [a1 clientInterface];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return [a1 currentNotificationCenter];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_didAttemptPromptReview(void *a1, const char *a2, ...)
{
  return [a1 didAttemptPromptReview];
}

id objc_msgSend_downloads(void *a1, const char *a2, ...)
{
  return [a1 downloads];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_isAnimated(void *a1, const char *a2, ...)
{
  return [a1 isAnimated];
}

id objc_msgSend_isManagedAppleID(void *a1, const char *a2, ...)
{
  return [a1 isManagedAppleID];
}

id objc_msgSend_launchedToTest(void *a1, const char *a2, ...)
{
  return [a1 launchedToTest];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_moreNavigationController(void *a1, const char *a2, ...)
{
  return [a1 moreNavigationController];
}

id objc_msgSend_moreViewControllers(void *a1, const char *a2, ...)
{
  return [a1 moreViewControllers];
}

id objc_msgSend_newDownloadManagerOptions(void *a1, const char *a2, ...)
{
  return [a1 newDownloadManagerOptions];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_prepareForLaunch(void *a1, const char *a2, ...)
{
  return [a1 prepareForLaunch];
}

id objc_msgSend_presentOnboardingIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 presentOnboardingIfNeeded];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_purchaseManager(void *a1, const char *a2, ...)
{
  return [a1 purchaseManager];
}

id objc_msgSend_queueSessionManager(void *a1, const char *a2, ...)
{
  return [a1 queueSessionManager];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_selectedImage(void *a1, const char *a2, ...)
{
  return [a1 selectedImage];
}

id objc_msgSend_selectedNavigationController(void *a1, const char *a2, ...)
{
  return [a1 selectedNavigationController];
}

id objc_msgSend_selectedViewController(void *a1, const char *a2, ...)
{
  return [a1 selectedViewController];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedConfig];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldAttemptPromptReview(void *a1, const char *a2, ...)
{
  return [a1 shouldAttemptPromptReview];
}

id objc_msgSend_shouldLog(void *a1, const char *a2, ...)
{
  return [a1 shouldLog];
}

id objc_msgSend_shouldLogToDisk(void *a1, const char *a2, ...)
{
  return [a1 shouldLogToDisk];
}

id objc_msgSend_shouldMakeUIForDefaultPNG(void *a1, const char *a2, ...)
{
  return [a1 shouldMakeUIForDefaultPNG];
}

id objc_msgSend_shouldShowOnboarding(void *a1, const char *a2, ...)
{
  return [a1 shouldShowOnboarding];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_tabBarController(void *a1, const char *a2, ...)
{
  return [a1 tabBarController];
}

id objc_msgSend_tabBarItems(void *a1, const char *a2, ...)
{
  return [a1 tabBarItems];
}

id objc_msgSend_tabIdentifier(void *a1, const char *a2, ...)
{
  return [a1 tabIdentifier];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_underlyingTabBarItem(void *a1, const char *a2, ...)
{
  return [a1 underlyingTabBarItem];
}

id objc_msgSend_updateShortcutItems(void *a1, const char *a2, ...)
{
  return [a1 updateShortcutItems];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllerFactory(void *a1, const char *a2, ...)
{
  return [a1 viewControllerFactory];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}