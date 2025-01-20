UIColor *__cdecl sub_100004650(id a1, UITraitCollection *a2)
{
  void *v2;
  uint64_t vars8;

  if ((id)[(UITraitCollection *)a2 userInterfaceStyle] == (id)2) {
    +[UIColor systemWhiteColor];
  }
  else {
  v2 = +[UIColor systemBlackColor];
  }
  return (UIColor *)v2;
}

void sub_100004F94(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 152));
  _Unwind_Resume(a1);
}

void sub_100005018(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setUpDismissalTimer];
}

void sub_100005058(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setUpDismissalTimer];
}

void sub_100005098(id a1)
{
  uint64_t v1 = sharingHUDLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "viewDidDisappearHandler", v2, 2u);
  }
}

void sub_100005100(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = [WeakRetained bannerButtonDidTap];

  if (v5) {
    v5[2](v5, [*(id *)(a1 + 32) type]);
  }
  id v4 = objc_loadWeakRetained(v2);
  [v4 dismissBanner];
}

void sub_10000519C(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = sharingHUDLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "bannerDidDisappearHandler reason: %@", buf, 0xCu);
  }

  if ([v3 containsString:@"dismissOverlays"]
    && ([a1[4] bannerDismissed] & 1) == 0)
  {
    v9 = [a1[4] bannerPresentable];
    v10 = [v9 model];
    id v11 = [v10 type];

    v12 = sharingHUDLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = +[SFHUDBannerModel descriptionForType:v11];
      *(_DWORD *)buf = 138412290;
      id v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Banner of type %@ not dismissed yet.", buf, 0xCu);
    }
    dispatch_time_t v14 = dispatch_time(0, 100000000);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100005440;
    v15[3] = &unk_100014488;
    v16[1] = v11;
    objc_copyWeak(v16, a1 + 6);
    dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v15);
    objc_destroyWeak(v16);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    [WeakRetained setBannerPresentable:0];

    id v6 = objc_loadWeakRetained(a1 + 6);
    v7 = [v6 bannerDidDismissHandler];

    v8 = sharingHUDLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "calling bannerDidDismissHandler", buf, 2u);
    }

    if (v7) {
      ((void (**)(void, id))v7)[2](v7, [a1[5] type]);
    }
  }
}

void sub_100005440(uint64_t a1)
{
  v2 = sharingHUDLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = +[SFHUDBannerModel descriptionForType:*(void *)(a1 + 40)];
    *(_DWORD *)buf = 138412290;
    dispatch_time_t v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "re-posting banner of type %@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained bannerSource];
  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = [v6 bannerPresentable];
  id v8 = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = [v8 bannerUserInfo];
  id v12 = 0;
  [v5 postPresentable:v7 options:1 userInfo:v9 error:&v12];
  id v10 = v12;

  if (v10)
  {
    id v11 = sharingHUDLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000BBEC(a1);
    }
  }
}

id sub_1000059C8(uint64_t a1)
{
  v2 = sharingHUDLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Dismissal timer fired. Dismissing banner", v4, 2u);
  }

  return [*(id *)(a1 + 32) dismissBanner];
}

void sub_100005BD4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id createNewHUDTransaction()
{
  v0 = (void *)os_transaction_create();
  return v0;
}

void sub_100006754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak((id *)(v26 - 120));
  objc_destroyWeak((id *)(v26 - 112));
  _Unwind_Resume(a1);
}

void sub_1000067E4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained bannerDismissedWithType:a2];
}

void sub_100006834(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained bannerButtonTappedWithType:a2];
}

void sub_100006884(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006940;
  v5[3] = &unk_100014460;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_100006940(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained displayBannerWithModel:*(void *)(a1 + 32)];
}

void sub_100006990(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006A20;
  block[3] = &unk_1000143F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_100006A20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updatePairedUnlockBannerToUnlocked];
}

void sub_100006A60(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006AF0;
  block[3] = &unk_1000143F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_100006AF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissBanner];
}

void sub_100006B30(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v2 = [WeakRetained[14] screenOn];
  id v3 = b332_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "no";
    if (v2) {
      id v4 = "yes";
    }
    int v6 = 136315138;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "screenOnChangedHandler - %s", (uint8_t *)&v6, 0xCu);
  }

  if ((v2 & 1) == 0)
  {
    id v5 = WeakRetained[2];
    WeakRetained[2] = 0;

    [WeakRetained releaseHUDTransaction];
  }
}

void sub_100006C24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = b332_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FBSInterfaceOrientationChangeHandler", buf, 2u);
  }

  id v5 = v3;
  int v6 = v5;
  if (v5)
  {
    *(void *)(*(void *)(a1 + 32) + 72) = [v5 orientation];
    [v6 duration];
    *(void *)(*(void *)(a1 + 32) + 88) = v7;
    *(void *)(*(void *)(a1 + 32) + 80) = [v6 rotationDirection];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006D40;
    block[3] = &unk_1000144D8;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100006D40(uint64_t a1)
{
  unsigned int v2 = b332_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 72);
    int v10 = 134217984;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "set orientation (%li)...", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  if (v5)
  {
    [v5 _setRotatableViewOrientation:*(void *)(v4 + 72) duration:0 force:*(double *)(v4 + 88)];
    int v6 = b332_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(*(void *)(a1 + 32) + 16) interfaceOrientation];
      int v10 = 134217984;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "orientation (%li)...", (uint8_t *)&v10, 0xCu);
    }

    id v8 = b332_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(*(void *)(a1 + 32) + 16) _windowInterfaceOrientation];
      int v10 = 134217984;
      id v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "window orientation (%li)...", (uint8_t *)&v10, 0xCu);
    }
  }
}

void sub_100007014(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000708C;
  block[3] = &unk_1000144D8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000708C(uint64_t a1)
{
  return [*(id *)(a1 + 32) activate];
}

void sub_100007514(id a1)
{
  uint64_t v1 = b332_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "showChargingStatus - present completion.", v2, 2u);
  }
}

void sub_100008120(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  unsigned int v2 = b332_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    id v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "releaseHUDTransaction - Released %p", (uint8_t *)&v3, 0xCu);
  }
}

void sub_100008494(id a1)
{
}

Class sub_100008950()
{
  if (qword_10001D0B0 != -1) {
    dispatch_once(&qword_10001D0B0, &stru_1000145D0);
  }
  Class result = objc_getClass("PNPPairingViewController");
  qword_10001D0A8 = (uint64_t)result;
  off_10001CCA8 = (uint64_t (*)())sub_1000089B4;
  return result;
}

id sub_1000089B4()
{
  return (id)qword_10001D0A8;
}

void sub_1000089C0(id a1)
{
  qword_10001D0B8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PencilPairingUI.framework/PencilPairingUI", 2);
}

Class sub_1000089EC()
{
  if (qword_10001D0B0 != -1) {
    dispatch_once(&qword_10001D0B0, &stru_1000145D0);
  }
  Class result = objc_getClass("PNPDeviceState");
  qword_10001D0C0 = (uint64_t)result;
  off_10001CCB0 = (uint64_t (*)())sub_100008A50;
  return result;
}

id sub_100008A50()
{
  return (id)qword_10001D0C0;
}

Class sub_100008A5C()
{
  if (qword_10001D0B0 != -1) {
    dispatch_once(&qword_10001D0B0, &stru_1000145D0);
  }
  Class result = objc_getClass("PNPLockScreenViewController");
  qword_10001D0C8 = (uint64_t)result;
  off_10001CCB8 = (uint64_t (*)())sub_100008AC0;
  return result;
}

id sub_100008AC0()
{
  return (id)qword_10001D0C8;
}

Class sub_100008ACC()
{
  if (qword_10001D0B0 != -1) {
    dispatch_once(&qword_10001D0B0, &stru_1000145D0);
  }
  Class result = objc_getClass("PNPAirplaneModeViewController");
  qword_10001D0D0 = (uint64_t)result;
  off_10001CCC0 = (uint64_t (*)())sub_100008B30;
  return result;
}

id sub_100008B30()
{
  return (id)qword_10001D0D0;
}

Class sub_10000B15C()
{
  if (qword_10001D0E0 != -1) {
    dispatch_once(&qword_10001D0E0, &stru_1000145F0);
  }
  Class result = objc_getClass("PLPillContentItem");
  qword_10001D0D8 = (uint64_t)result;
  off_10001CEA8 = (uint64_t (*)())sub_10000B1C0;
  return result;
}

id sub_10000B1C0()
{
  return (id)qword_10001D0D8;
}

void sub_10000B1CC(id a1)
{
  qword_10001D0E8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PlatterKit.framework/PlatterKit", 2);
}

Class sub_10000B1F8()
{
  if (qword_10001D0E0 != -1) {
    dispatch_once(&qword_10001D0E0, &stru_1000145F0);
  }
  Class result = objc_getClass("PLPillView");
  qword_10001D0F0 = (uint64_t)result;
  off_10001CEB0 = (uint64_t (*)())sub_10000B25C;
  return result;
}

id sub_10000B25C()
{
  return (id)qword_10001D0F0;
}

int main(int argc, const char **argv, const char **envp)
{
  id v5 = sharingHUDLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SharingHUDService - main", (uint8_t *)v17, 2u);
  }

  id v7 = sharingHUDLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SharingHUDService - entered @autoreleasepool", (uint8_t *)v17, 2u);
  }

  _set_user_dir_suffix();
  SetAppFixedPriority();
  uint64_t v8 = createNewHUDTransaction();
  id v9 = (void *)gInitialTransaction;
  gInitialTransaction = v8;

  int v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  id v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v14 = UIApplicationMain(argc, (char **)argv, v11, v13);

  v15 = sharingHUDLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109120;
    v17[1] = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SharingHUDService - UIApplicationMain exited: %i", (uint8_t *)v17, 8u);
  }

  return v14;
}

void sub_10000B53C(id a1)
{
  id v1 = sharingHUDLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Connection invalidated", v2, 2u);
  }
}

void sub_10000B5A4(id a1)
{
  id v1 = sharingHUDLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v2, 2u);
  }
}

void sub_10000B668(id a1, NSError *a2)
{
  unsigned int v2 = sharingHUDLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10000BD6C(v2);
  }
}

void sub_10000B7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B7BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B7CC(uint64_t a1)
{
}

void sub_10000B7D4(uint64_t a1, void *a2)
{
}

void sub_10000BAF8(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 type];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Invalid banner type %ld", (uint8_t *)&v3, 0xCu);
}

void sub_10000BB84(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not post banner of type %@: %@", buf, 0x16u);
}

void sub_10000BBEC(uint64_t a1)
{
  id v1 = +[SFHUDBannerModel descriptionForType:*(void *)(a1 + 40)];
  sub_100005BBC();
  sub_100005BD4((void *)&_mh_execute_header, v2, v3, "Could not post banner of type %@: %@", v4, v5, v6, v7, v8);
}

void sub_10000BC8C(uint64_t a1)
{
  id v1 = +[SFHUDBannerModel descriptionForType:a1];
  sub_100005BBC();
  sub_100005BD4((void *)&_mh_execute_header, v2, v3, "Could not dismiss banner of type %@: %@", v4, v5, v6, v7, v8);
}

void sub_10000BD28(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not create dismissal timer", v1, 2u);
}

void sub_10000BD6C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not retrieve remote object", v1, 2u);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBUIIsSystemApertureEnabled()
{
  return _SBUIIsSystemApertureEnabled();
}

uint64_t SetAppFixedPriority()
{
  return _SetAppFixedPriority();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t b332_log()
{
  return _b332_log();
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

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t paired_unlock_log()
{
  return _paired_unlock_log();
}

uint64_t sharingHUDLog()
{
  return _sharingHUDLog();
}

id objc_msgSend__supportsPencil(void *a1, const char *a2, ...)
{
  return [a1 _supportsPencil];
}

id objc_msgSend__tightBoundingBoxLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 _tightBoundingBoxLayoutGuide];
}

id objc_msgSend__windowInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 _windowInterfaceOrientation];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_bannerButton(void *a1, const char *a2, ...)
{
  return [a1 bannerButton];
}

id objc_msgSend_bannerButtonDidTap(void *a1, const char *a2, ...)
{
  return [a1 bannerButtonDidTap];
}

id objc_msgSend_bannerDidDisappearHandler(void *a1, const char *a2, ...)
{
  return [a1 bannerDidDisappearHandler];
}

id objc_msgSend_bannerDidDismissHandler(void *a1, const char *a2, ...)
{
  return [a1 bannerDidDismissHandler];
}

id objc_msgSend_bannerDismissed(void *a1, const char *a2, ...)
{
  return [a1 bannerDismissed];
}

id objc_msgSend_bannerPresentable(void *a1, const char *a2, ...)
{
  return [a1 bannerPresentable];
}

id objc_msgSend_bannerRequestHandler(void *a1, const char *a2, ...)
{
  return [a1 bannerRequestHandler];
}

id objc_msgSend_bannerSource(void *a1, const char *a2, ...)
{
  return [a1 bannerSource];
}

id objc_msgSend_bannerUserInfo(void *a1, const char *a2, ...)
{
  return [a1 bannerUserInfo];
}

id objc_msgSend_bannerViewController(void *a1, const char *a2, ...)
{
  return [a1 bannerViewController];
}

id objc_msgSend_batteryLevelUnknown(void *a1, const char *a2, ...)
{
  return [a1 batteryLevelUnknown];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buttonTapped(void *a1, const char *a2, ...)
{
  return [a1 buttonTapped];
}

id objc_msgSend_buttonView(void *a1, const char *a2, ...)
{
  return [a1 buttonView];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_contentSizeProvidingView(void *a1, const char *a2, ...)
{
  return [a1 contentSizeProvidingView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentBannerRequest(void *a1, const char *a2, ...)
{
  return [a1 currentBannerRequest];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 currentTraitCollection];
}

id objc_msgSend_deviceSpecificViewController(void *a1, const char *a2, ...)
{
  return [a1 deviceSpecificViewController];
}

id objc_msgSend_dismissBTPrompt(void *a1, const char *a2, ...)
{
  return [a1 dismissBTPrompt];
}

id objc_msgSend_dismissBanner(void *a1, const char *a2, ...)
{
  return [a1 dismissBanner];
}

id objc_msgSend_dismissBannerHandler(void *a1, const char *a2, ...)
{
  return [a1 dismissBannerHandler];
}

id objc_msgSend_dismissPill(void *a1, const char *a2, ...)
{
  return [a1 dismissPill];
}

id objc_msgSend_dismissalTimer(void *a1, const char *a2, ...)
{
  return [a1 dismissalTimer];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_enableBluetoothTapped(void *a1, const char *a2, ...)
{
  return [a1 enableBluetoothTapped];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return [a1 iconView];
}

id objc_msgSend_imageContentMode(void *a1, const char *a2, ...)
{
  return [a1 imageContentMode];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leadingImage(void *a1, const char *a2, ...)
{
  return [a1 leadingImage];
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 loadViewIfNeeded];
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

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_needsButton(void *a1, const char *a2, ...)
{
  return [a1 needsButton];
}

id objc_msgSend_needsLockButton(void *a1, const char *a2, ...)
{
  return [a1 needsLockButton];
}

id objc_msgSend_needsUpdate(void *a1, const char *a2, ...)
{
  return [a1 needsUpdate];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return [a1 orientation];
}

id objc_msgSend_pairTapped(void *a1, const char *a2, ...)
{
  return [a1 pairTapped];
}

id objc_msgSend_pairingFailed(void *a1, const char *a2, ...)
{
  return [a1 pairingFailed];
}

id objc_msgSend_pairingStarted(void *a1, const char *a2, ...)
{
  return [a1 pairingStarted];
}

id objc_msgSend_pairingSucceededSubsequently(void *a1, const char *a2, ...)
{
  return [a1 pairingSucceededSubsequently];
}

id objc_msgSend_pendingOperation(void *a1, const char *a2, ...)
{
  return [a1 pendingOperation];
}

id objc_msgSend_pillView(void *a1, const char *a2, ...)
{
  return [a1 pillView];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_releaseHUDTransaction(void *a1, const char *a2, ...)
{
  return [a1 releaseHUDTransaction];
}

id objc_msgSend_remoteObject(void *a1, const char *a2, ...)
{
  return [a1 remoteObject];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requestIdentifier];
}

id objc_msgSend_resignKeyWindow(void *a1, const char *a2, ...)
{
  return [a1 resignKeyWindow];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_rotationDirection(void *a1, const char *a2, ...)
{
  return [a1 rotationDirection];
}

id objc_msgSend_screenOn(void *a1, const char *a2, ...)
{
  return [a1 screenOn];
}

id objc_msgSend_secondarySystemFillColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemFillColor];
}

id objc_msgSend_setUpDismissalTimer(void *a1, const char *a2, ...)
{
  return [a1 setUpDismissalTimer];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_setupWindowWithNewRoot(void *a1, const char *a2, ...)
{
  return [a1 setupWindowWithNewRoot];
}

id objc_msgSend_shadowOutsets(void *a1, const char *a2, ...)
{
  return [a1 shadowOutsets];
}

id objc_msgSend_showChargingStatus(void *a1, const char *a2, ...)
{
  return [a1 showChargingStatus];
}

id objc_msgSend_showGenericBatteryUI(void *a1, const char *a2, ...)
{
  return [a1 showGenericBatteryUI];
}

id objc_msgSend_showPairConsentPrompt(void *a1, const char *a2, ...)
{
  return [a1 showPairConsentPrompt];
}

id objc_msgSend_showPairingPrompt(void *a1, const char *a2, ...)
{
  return [a1 showPairingPrompt];
}

id objc_msgSend_showPairingStarted(void *a1, const char *a2, ...)
{
  return [a1 showPairingStarted];
}

id objc_msgSend_showUnlockPrompt(void *a1, const char *a2, ...)
{
  return [a1 showUnlockPrompt];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_subtitleAlignment(void *a1, const char *a2, ...)
{
  return [a1 subtitleAlignment];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlackColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_trailingButton(void *a1, const char *a2, ...)
{
  return [a1 trailingButton];
}

id objc_msgSend_trailingJindoButton(void *a1, const char *a2, ...)
{
  return [a1 trailingJindoButton];
}

id objc_msgSend_trailingPillButton(void *a1, const char *a2, ...)
{
  return [a1 trailingPillButton];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_updatePairedUnlockBannerToUnlocked(void *a1, const char *a2, ...)
{
  return [a1 updatePairedUnlockBannerToUnlocked];
}

id objc_msgSend_updatePairedUnlockHandler(void *a1, const char *a2, ...)
{
  return [a1 updatePairedUnlockHandler];
}

id objc_msgSend_updateUI(void *a1, const char *a2, ...)
{
  return [a1 updateUI];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewDidAppearHandler(void *a1, const char *a2, ...)
{
  return [a1 viewDidAppearHandler];
}

id objc_msgSend_viewDidDisappearHandler(void *a1, const char *a2, ...)
{
  return [a1 viewDidDisappearHandler];
}

id objc_msgSend_watchName(void *a1, const char *a2, ...)
{
  return [a1 watchName];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}