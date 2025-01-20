uint64_t start(int a1, char **a2)
{
  void *v4;

  UIApplicationMain(a1, a2, @"MTAAppController", @"MTAAppController");
  return 0;
}

void sub_100004E7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C82C;
  v6[3] = &unk_1000A14C0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

BOOL sub_1000050C8(id a1, UIApplicationShortcutItem *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v4 = [(UIApplicationShortcutItem *)a2 type];
  uint64_t v8 = kStartTimerActionID;
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

BOOL sub_1000051E4(id a1, UIApplicationShortcutItem *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v4 = [(UIApplicationShortcutItem *)a2 type];
  uint64_t v8 = kStopTimerActionID;
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

id sub_1000055E0(uint64_t a1)
{
  v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ preparing tab bar controller", (uint8_t *)&v5, 0xCu);
  }

  id result = [*(id *)(*(void *)(a1 + 32) + 16) setRootViewController:*(void *)(*(void *)(a1 + 32) + 24)];
  if (*(unsigned char *)(a1 + 40)) {
    return [*(id *)(a1 + 32) restoreLastSelectedTabIndex];
  }
  return result;
}

void sub_100006988(uint64_t a1)
{
  v1 = (uint64_t *)(a1 + 32);
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = MTLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *v1;
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ no current event", buf, 0xCu);
    }

    id v2 = +[MTAStateStoreEvent blankEvent];
  }
  id v11 = 0;
  int v5 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v11];
  id v6 = v11;
  id v7 = MTLogForCategory();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006CD64(v1, (uint64_t)v6, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *v1;
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronized state store successfully", buf, 0xCu);
    }

    v10 = +[NSUserDefaults standardUserDefaults];
    [v10 setObject:v5 forKey:@"kMTAStateStoreLatestEvent"];

    uint64_t v8 = +[NSUserDefaults standardUserDefaults];
    [v8 synchronize];
  }
}

void sub_100007530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C6B8(id a1)
{
  +[MTAlarmManager warmUp];
  +[MTTimerManager warmUp];
  +[MTSessionManager warmUp];
  id v1 = +[MTPairedDeviceListener sharedListener];
}

uint64_t sub_10000C704(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10000C71C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_10000C734(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadUI:*(void *)(a1 + 40)];
}

Class sub_10000C7B4(uint64_t a1)
{
  sub_10000C9C4();
  Class result = objc_getClass("HKHealthStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10006C980();
  }
  qword_1000C7B70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000C80C(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

id sub_10000C820(uint64_t a1)
{
  return [*(id *)(a1 + 32) _numberOfItemsDidChangeAnimated:0];
}

id sub_10000C82C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) eventType];
  switch((unint64_t)result)
  {
    case 1uLL:
      uint64_t v3 = *(void **)(a1 + 40);
      id result = _[v3 restoreAddNewAlarm];
      break;
    case 2uLL:
      uint64_t v4 = *(void **)(a1 + 40);
      id result = [v4 restoreAlarmEditWithEvent:];
      break;
    case 3uLL:
      int v5 = *(void **)(a1 + 40);
      id result = _[v5 restoreWorldClockAdd];
      break;
    case 4uLL:
      goto LABEL_12;
    case 5uLL:
      uint64_t v8 = *(void **)(a1 + 40);
      id result = _[v8 restoreWorldClockEdit];
      break;
    case 7uLL:
      [*(id *)(a1 + 40) restoreAlarmTabEditMode];
LABEL_12:
      id v6 = *(void **)(a1 + 40);
      id result = [v6 restoreWorldClockTabWithEvent:];
      break;
    case 8uLL:
      id v7 = *(void **)(a1 + 40);
      id result = _[v7 restoreSleepEdit];
      break;
    default:
      return result;
  }
  return result;
}

id sub_10000C948(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);

  return [v2 synchronize];
}

void sub_10000C988(id a1)
{
  qword_1000C7D18 = objc_alloc_init(MTAStateStore);

  _objc_release_x1();
}

uint64_t sub_10000C9C4()
{
  v2[0] = 0;
  if (!qword_1000C7B78)
  {
    v2[1] = _NSConcreteStackBlock;
    v2[2] = (void *)3221225472;
    v2[3] = sub_10001CDD4;
    v2[4] = &unk_1000A1850;
    v2[5] = v2;
    long long v3 = off_1000A1838;
    uint64_t v4 = 0;
    qword_1000C7B78 = _sl_dlopen();
  }
  uint64_t v0 = qword_1000C7B78;
  if (!qword_1000C7B78) {
    sub_10006C9FC(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t type metadata accessor for SiriTipsController()
{
  return self;
}

void sub_10000CB50(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "WorldClock activity resignCurrent %@", (uint8_t *)&v3, 0xCu);
}

id sub_10000E650(id a1, WorldClockCity *a2)
{
  return [(WorldClockCity *)a2 name];
}

int64_t sub_10000E8C0(id a1, NSIndexPath *a2, NSIndexPath *a3)
{
  return [(NSIndexPath *)a2 compare:a3];
}

void sub_10000E8C8(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsUpdateConstraints];

  id v3 = [*(id *)(a1 + 32) collectionViewController];
  [v3 scrollToPageContainingIndexPath:*(void *)(a1 + 40) animated:0];
}

id sub_10000E940(uint64_t a1)
{
  return [*(id *)(a1 + 32) flashScrollIndicators];
}

void sub_10000EA70(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

id sub_10000F1A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishAddViewControllerDismissal:1];
}

id sub_100013AB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateViewControllersWithTraitCollection:*(void *)(a1 + 40)];
}

void sub_100013B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100013BB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showSleepView];
}

void sub_100014E28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100014E44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showAddView];
}

void sub_100015150(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10001516C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEditing:1 animated:0];
}

void sub_100015318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100015334(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) alarmViewController];
  [v1 setEditing:1];
}

void sub_10001537C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEditing:1 animated:1];
}

int64_t sub_100015BCC(id a1, MTATone *a2, MTATone *a3)
{
  uint64_t v4 = a2;
  int v5 = a3;
  if ([(MTATone *)v4 isDefaultTone])
  {
    int64_t v6 = -1;
  }
  else if ([(MTATone *)v5 isDefaultTone])
  {
    int64_t v6 = 1;
  }
  else
  {
    id v7 = [(MTATone *)v4 name];
    uint64_t v8 = [(MTATone *)v5 name];
    int64_t v6 = (int64_t)[v7 localizedStandardCompare:v8];
  }
  return v6;
}

void sub_100015CCC(id a1)
{
  qword_1000C7B60 = objc_opt_new();

  _objc_release_x1();
}

void sub_100015EBC(uint64_t a1, uint64_t a2)
{
  if (a2 == 5 || !a2)
  {
    block[5] = v2;
    block[6] = v3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015F44;
    block[3] = &unk_1000A1428;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_100015F44(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlert:0];
}

id sub_100016B8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    uint64_t v4 = +[NAFuture futureWithResult:v3];
  }
  else
  {
    int v5 = MTLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006C6DC(v5);
    }

    int64_t v6 = [v3 timerByUpdatingWithState:1];
    id v7 = [*(id *)(a1 + 32) timerManager];
    uint64_t v4 = [v7 updateTimer:v6];
  }

  return v4;
}

void sub_100016C60(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found current timer: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 32) setTimer:v3];
  int v5 = *(void **)(*(void *)(a1 + 32) + 8);
  [v3 duration];
  [v5 setCountDownDuration:];
  [*(id *)(a1 + 32) reloadTimerUI];
  [*(id *)(a1 + 32) updateSelectedSoundUI];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

id sub_10001703C(uint64_t a1, void *a2)
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000171AC;
  v10[3] = &unk_1000A1608;
  v10[4] = *(void *)(a1 + 32);
  id v3 = [a2 na_firstObjectPassingTest:v10];
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 state])
    {
      int v5 = +[NAFuture futureWithResult:v4];
      goto LABEL_9;
    }
    int v7 = MTLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006C6DC(v7);
    }

    uint64_t v6 = [v4 timerByUpdatingWithState:1];
    id v8 = [*(id *)(a1 + 32) timerManager];
    int v5 = [v8 updateTimer:v6];
  }
  else
  {
    uint64_t v6 = +[NSError na_genericError];
    int v5 = +[NAFuture futureWithError:v6];
  }

LABEL_9:

  return v5;
}

id sub_1000171AC(uint64_t a1, void *a2)
{
  id v3 = [a2 timerID];
  uint64_t v4 = [*(id *)(a1 + 32) timer];
  int v5 = [v4 timerID];
  id v6 = [v3 isEqual:v5];

  return v6;
}

void sub_100017220(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Found current timer: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [*(id *)(a1 + 32) setTimer:v3];
  [*(id *)(a1 + 32) setupTimerUI:v3];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

uint64_t sub_100017318(uint64_t a1)
{
  uint64_t v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10006C720(a1, v2);
  }

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 didCancelTimerWithSender:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100017590(uint64_t a1, void *a2)
{
  if ([a2 state] == (id)1)
  {
    +[MTTimerManager defaultDuration];
    double v4 = v3;
    [*(id *)(*(void *)(a1 + 32) + 8) countDownDuration];
    if (v4 != v5)
    {
      [*(id *)(*(void *)(a1 + 32) + 8) countDownDuration];
      +[MTTimerManager setDefaultDuration:](MTTimerManager, "setDefaultDuration:");
      uint64_t v6 = [*(id *)(a1 + 32) timer];

      if (v6)
      {
        int v7 = [*(id *)(a1 + 32) timer];
        id v8 = [v7 mutableCopy];

        [*(id *)(*(void *)(a1 + 32) + 8) countDownDuration];
        [v8 setDuration:];
        __int16 v9 = [*(id *)(a1 + 32) timerManager];
        id v10 = [v9 updateTimer:v8];
        id v11 = +[NAScheduler mtMainThreadScheduler];
        v12 = [v10 reschedule:v11];

        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100017738;
        v15[3] = &unk_1000A1680;
        v15[4] = *(void *)(a1 + 32);
        id v16 = v8;
        id v13 = v8;
        id v14 = [v12 addSuccessBlock:v15];
      }
    }
  }
}

id sub_100017738(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTimer:*(void *)(a1 + 40)];
}

id sub_100018770(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

void sub_100018A94(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) view];
  [v5 setFrame:v1, v2, v3, v4];
}

BOOL sub_100018BE4(id a1, UIApplicationShortcutItem *a2, unint64_t a3, BOOL *a4)
{
  double v4 = [(UIApplicationShortcutItem *)a2 type];
  v8[0] = kStartTimerActionID;
  v8[1] = kStopTimerActionID;
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

id sub_100018FF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) pauseResumeTimer:0];
}

void sub_1000192B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000192DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v3 = MTLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer started. Preparing UI for running timer.", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 32) setTimer:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) prepareUIForState:3];
    +[MTAnalytics incrementEventCount:kMTCATimerStarts];
  }
}

void sub_10001960C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100019640(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v6 = WeakRetained;
  if (WeakRetained && [WeakRetained shouldHandleTimerReload])
  {
    int v7 = MTLogForCategory();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v8) {
        sub_10006C84C(a1, (uint64_t)v4, v7);
      }
    }
    else
    {
      if (v8) {
        sub_10006C79C(a1, v7);
      }

      [*(id *)(a1 + 32) setTimer:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) prepareUIForState:3];
    }
  }
}

void sub_100019904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019930(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  double v3 = WeakRetained;
  if (WeakRetained && [WeakRetained shouldHandleTimerReload])
  {
    id v4 = MTLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = a1[4];
      int v15 = 138543362;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer stopped. Preparing UI for stopped timer.", (uint8_t *)&v15, 0xCu);
    }

    [a1[4] stopUpdatingTimerUI];
    [*((id *)a1[4] + 1) setTimerControlState:0];
    uint64_t v6 = a1[4];
    int v7 = (void *)v6[1];
    BOOL v8 = [v6 timer];
    [v8 duration];
    double v10 = v9;
    id v11 = [a1[5] title];
    [v7 setRemainingTime:1 duration:v11 state:1 title:0.0 forceRefresh:v10];

    char v12 = MTUIIsPhoneIdiom();
    id v13 = 0;
    if ((v12 & 1) == 0) {
      id v13 = a1[5];
    }
    [a1[4] setTimer:v13];
  }
  id v14 = [a1[4] delegate];
  [v14 didCancelTimerWithSender:a1[4]];

  +[MTAnalytics incrementEventCount:kMTCATimerCancels];
}

void sub_100019D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019D9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v3 = WeakRetained;
  if (WeakRetained && [WeakRetained shouldHandleTimerReload])
  {
    id v4 = MTLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer paused. Preparing UI for stopped timer.", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) setTimer:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) prepareUIForState:*(void *)(a1 + 56)];
    uint64_t v6 = &kMTCATimerPauses;
    if (*(void *)(a1 + 56) != 2) {
      uint64_t v6 = &kMTCATimerResumes;
    }
    +[MTAnalytics incrementEventCount:*v6];
  }
}

void sub_100019EB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer update failed with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

id sub_10001A6E0(uint64_t a1)
{
  [*(id *)(a1 + 32) setTimer:*(void *)(a1 + 40)];
  double v2 = *(void **)(a1 + 32);

  return [v2 updateSelectedSoundUI];
}

id sub_10001A9F4(uint64_t a1)
{
  double v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) title];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ timer label updated to: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 32) setTimer:*(void *)(a1 + 40)];
}

void sub_10001C794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001CDD4()
{
  uint64_t result = _sl_dlopen();
  qword_1000C7B78 = result;
  return result;
}

void *sub_10001CE48(uint64_t a1)
{
  double v2 = (void *)sub_10000C9C4();
  uint64_t result = dlsym(v2, "HKFeatureIdentifierSleepCoaching");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000C7B80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_10001CE98(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_1000C7B90)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_10001CFC4;
    v3[4] = &unk_1000A1850;
    v3[5] = v3;
    long long v4 = off_1000A1870;
    uint64_t v5 = 0;
    qword_1000C7B90 = _sl_dlopen();
  }
  if (!qword_1000C7B90) {
    sub_10006CA7C(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("HKSHQuickScheduleManagementViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10006CAFC();
  }
  qword_1000C7B88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10001CFC4()
{
  uint64_t result = _sl_dlopen();
  qword_1000C7B90 = result;
  return result;
}

id sub_10001D9D8(uint64_t a1, void *a2)
{
  return _[a2 handleUserPreferencesChanged];
}

id sub_10001DB18(uint64_t a1)
{
  double v2 = [*(id *)(*(void *)(a1 + 32) + 24) view];
  uint64_t v3 = [v2 window];
  long long v4 = [v3 rootViewController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001DC48;
  v6[3] = &unk_1000A1428;
  void v6[4] = *(void *)(a1 + 32);
  [v4 dismissViewControllerAnimated:0 completion:v6];

  if ([*(id *)(a1 + 40) isEqualToString:@"default"]) {
    return [*(id *)(a1 + 32) _handleDefaultSpecifierForSection:*(void *)(a1 + 48)];
  }
  if ([*(id *)(a1 + 40) isEqualToString:@"edit"]) {
    return [*(id *)(a1 + 32) _handleEditSpecifierForSection:*(void *)(a1 + 48)];
  }
  id result = [*(id *)(a1 + 40) isEqualToString:@"add"];
  if (result) {
    return [*(id *)(a1 + 32) _handleAddSpecifierForSection:*(void *)(a1 + 48)];
  }
  return result;
}

id sub_10001DC48(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) prepareStateForUrlLaunch];
}

uint64_t sub_10001E248(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedTest:*(void *)(*(void *)(a1 + 32) + 88)];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 88);
    uint64_t v5 = *(void *)(a1 + 48);
    return (uint64_t)[v3 teardownForTest:v4 options:v5];
  }
  return result;
}

void sub_10001EB88(id a1)
{
  double v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  double v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  __int16 v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  double v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  uint64_t v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v3, v5, v7, v9, v11, 0);
  id v13 = (void *)qword_1000C7BA8;
  qword_1000C7BA8 = v12;
}

void sub_10001F234(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(a1 + 32);
  double v2 = *(id **)(a1 + 32);
  uint64_t v4 = [v2[3] worldClockViewController];
  [v2 _selectViewController:v4];

  uint64_t v5 = +[WorldClockManager sharedManager];
  uint64_t v7 = *(void *)(a1 + 40);
  int v6 = (uint64_t *)(a1 + 40);
  __int16 v8 = [v5 citiesMatchingName:v7];
  id v9 = [v8 firstObject];

  if (v9)
  {
    double v10 = [*(id *)(*v3 + 24) worldClockViewController];
    if ([v10 conformsToProtocol:&OBJC_PROTOCOL___MTAUpdateClockViewControllerDelegate])
    {
      unsigned int v11 = [v10 isViewLoaded];
      uint64_t v12 = MTLogForCategory();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          uint64_t v14 = *v3;
          uint64_t v15 = *v6;
          int v18 = 138543874;
          uint64_t v19 = v14;
          __int16 v20 = 2114;
          uint64_t v21 = v15;
          __int16 v22 = 2114;
          v23 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: view controller is loaded, adding city name: %{public}@ to controller: %{public}@", (uint8_t *)&v18, 0x20u);
        }

        [v10 addCityWithoutUserInteraction:v9];
      }
      else
      {
        if (v13)
        {
          uint64_t v16 = *v3;
          uint64_t v17 = *v6;
          int v18 = 138543874;
          uint64_t v19 = v16;
          __int16 v20 = 2114;
          uint64_t v21 = v17;
          __int16 v22 = 2114;
          v23 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: defer adding city name: %{public}@ to controller: %{public}@", (uint8_t *)&v18, 0x20u);
        }

        [v10 setDeferAddedCity:v9];
      }
    }
  }
  else
  {
    double v10 = MTLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006CBF0();
    }
  }
}

void sub_10001F584(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(a1 + 32);
  double v2 = *(id **)(a1 + 32);
  uint64_t v4 = [v2[3] worldClockViewController];
  [v2 _selectViewController:v4];

  uint64_t v5 = +[WorldClockManager sharedManager];
  uint64_t v7 = *(void *)(a1 + 40);
  int v6 = (uint64_t *)(a1 + 40);
  __int16 v8 = [v5 citiesMatchingName:v7];
  id v9 = [v8 firstObject];

  if (v9)
  {
    double v10 = [*(id *)(*v3 + 24) worldClockViewController];
    if ([v10 conformsToProtocol:&OBJC_PROTOCOL___MTAUpdateClockViewControllerDelegate])
    {
      unsigned int v11 = [v10 isViewLoaded];
      uint64_t v12 = MTLogForCategory();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          uint64_t v14 = *v3;
          uint64_t v15 = *v6;
          int v18 = 138543874;
          uint64_t v19 = v14;
          __int16 v20 = 2114;
          uint64_t v21 = v15;
          __int16 v22 = 2114;
          v23 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: view controller is loaded, removing city name: %{public}@ from controller: %{public}@", (uint8_t *)&v18, 0x20u);
        }

        [v10 removeCityWithoutUserInteraction:v9];
      }
      else
      {
        if (v13)
        {
          uint64_t v16 = *v3;
          uint64_t v17 = *v6;
          int v18 = 138543874;
          uint64_t v19 = v16;
          __int16 v20 = 2114;
          uint64_t v21 = v17;
          __int16 v22 = 2114;
          v23 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: defer removing city name: %{public}@ from controller: %{public}@", (uint8_t *)&v18, 0x20u);
        }

        [v10 setDeferRemovedCity:v9];
      }
    }
  }
  else
  {
    double v10 = MTLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006CBF0();
    }
  }
}

void sub_10001FCB0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id sub_100020520(uint64_t a1, void *a2, BOOL *a3)
{
  if (a2)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    int v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [a2 persistentID]);
    [v5 addObject:v6];
  }
  id result = [*(id *)(a1 + 32) count];
  *a3 = (unint64_t)result > 1;
  return result;
}

UIImage *sub_1000215B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1000C7BC0 != -1) {
    dispatch_once(&qword_1000C7BC0, &stru_1000A1988);
  }
  MTUIMainScreenScale();
  if ((int)v4 == 1)
  {
    uint64_t v5 = &stru_1000A2560;
  }
  else
  {
    uint64_t v5 = +[NSString stringWithFormat:@"@%dx%@", (int)v4, v3];
  }
  int v6 = +[NSString stringWithFormat:@"%d%@.png", a1, v5];
  uint64_t v7 = [(id)qword_1000C7BB0 objectForKeyedSubscript:v6];
  if (v7)
  {
    __int16 v8 = v7;
  }
  else
  {
    id v9 = [(id)qword_1000C7BB8 stringByAppendingPathComponent:v6];
    +[MTACircleButton buttonWidthForSize:a1];
    double width = v33.width;
    v33.height = v33.width;
    UIGraphicsBeginImageContextWithOptions(v33, 0, 0.0);
    v34.origin.x = 0.0;
    v34.origin.y = 0.0;
    v34.size.double width = width;
    v34.size.height = width;
    double MidX = CGRectGetMidX(v34);
    v35.origin.x = 0.0;
    v35.origin.y = 0.0;
    v35.size.double width = width;
    v35.size.height = width;
    double MidY = CGRectGetMidY(v35);
    id v13 = objc_alloc_init((Class)UIBezierPath);
    v36.origin.x = 0.0;
    v36.origin.y = 0.0;
    v36.size.double width = width;
    v36.size.height = width;
    [v13 moveToPoint:CGRectGetMidX(v36), 0.0];
    [v13 addArcWithCenter:CGPointMake(MidX, MidY) radius:width * 0.5 startAngle:4.71238898 endAngle:10.9955743 clockwise:1];
    uint64_t v14 = +[UIColor whiteColor];
    [v14 setFill];

    [v13 fill];
    uint64_t v15 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(id)qword_1000C7BB0 setObject:v15 forKeyedSubscript:v6];
    uint64_t v16 = dispatch_get_global_queue(-2, 0);
    block = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_100021A08;
    v29 = &unk_1000A14C0;
    uint64_t v17 = v15;
    v30 = v17;
    id v31 = v9;
    id v18 = v9;
    dispatch_async(v16, &block);

    uint64_t v19 = UIImagePNGRepresentation(v17);
    if (MTUIIsPadIdiom()) {
      CFStringRef v20 = @"~ipad";
    }
    else {
      CFStringRef v20 = @"~iphone";
    }
    uint64_t v21 = [(__CFString *)v5 stringByAppendingString:v20];

    __int16 v22 = NSTemporaryDirectory();
    v23 = +[NSString stringWithFormat:@"circle_%d%@.png", a1, v21, block, v27, v28, v29];
    v24 = [v22 stringByAppendingPathComponent:v23];
    [v19 writeToFile:v24 atomically:1];

    __int16 v8 = v17;
    uint64_t v5 = (__CFString *)v21;
  }

  return v8;
}

void sub_100021928(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableDictionary);
  double v2 = (void *)qword_1000C7BB0;
  qword_1000C7BB0 = (uint64_t)v1;

  id v9 = [UIApp userCachesDirectory];
  id v3 = +[NSBundle mainBundle];
  double v4 = [v3 bundleIdentifier];
  uint64_t v5 = [v9 stringByAppendingPathComponent:v4];
  int v6 = [v5 stringByAppendingPathComponent:@"Circles"];
  id v7 = [v6 copy];
  __int16 v8 = (void *)qword_1000C7BB8;
  qword_1000C7BB8 = (uint64_t)v7;
}

void sub_100021A08(uint64_t a1)
{
  double v2 = +[NSFileManager defaultManager];
  [v2 _web_createDirectoryAtPathWithIntermediateDirectories:qword_1000C7BB8 attributes:0];

  UIImagePNGRepresentation(*(UIImage **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 writeToFile:*(void *)(a1 + 40) atomically:1];
}

id sub_100024450(double a1)
{
  if (qword_1000C7CE8 != -1) {
    dispatch_once(&qword_1000C7CE8, &stru_1000A19D8);
  }
  double v2 = (void *)qword_1000C7BD0[5 * (int)sub_1000267AC(a1)];

  return [v2 size];
}

id sub_100024934(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  double v2 = *(void **)(a1 + 40);

  return [v2 layoutIfNeeded];
}

id sub_100024974(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

id sub_100024D14(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  double v2 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 40) frame];

  return [v2 setFrame:];
}

id sub_100024D68(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t sub_100024DB0(double a1)
{
  sub_100024450(a1);

  return UIRectCenteredIntegralRect();
}

void sub_100025238(float64x2_t *a1, unint64_t a2, void *a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  *(double *)&long long v77 = a4;
  v90.f64[0] = a4;
  v90.f64[1] = a5;
  CGFloat v91 = a6;
  CGFloat v92 = a7;
  id v12 = a3;
  id v13 = v12;
  if (!a2) {
    goto LABEL_37;
  }
  uint64_t v61 = (uint64_t)&v61;
  size_t v14 = 32 * a2;
  __chkstk_darwin(v12);
  uint64_t v15 = (float64x2_t *)(&v61 - 4 * a2);
  *(void *)&long long v76 = v79;
  *(void *)&v74.f64[0] = a1[1].f64;
  int v16 = 1;
  uint64_t v75 = 3221225472;
  v70 = a1;
  size_t v64 = 32 * a2;
  v71 = v15;
  do
  {
    LODWORD(v73.f64[0]) = v16;
    memcpy(v15, a1, v14);
    uint64_t v17 = 0;
    do
    {
      id v18 = [v13 objectAtIndexedSubscript:v17];
      BOOL v19 = [v18 iconPlacement] == (id)2;

      if (!v19)
      {
        CFStringRef v20 = [v13 objectAtIndexedSubscript:v17];
        [v20 hotspotOffsetForPlacement:1];
        double v22 = v21;
        v23 = [v13 objectAtIndexedSubscript:v17];
        [v23 hotspotOffsetForPlacement:2];
        double v25 = v24;

        v26 = &v70[2 * v17];
        double v27 = v26->f64[0];
        long long v93 = *(long long *)((char *)v26 + 8);
        *(void *)&v95.origin.y = v93;
        float64_t v94 = v26[1].f64[1];
        v95.size.double width = v26[1].f64[0];
        v95.size.height = v26[1].f64[1];
        v95.origin.x = v27;
        double MaxX = CGRectGetMaxX(v95);
        *(void *)&v96.origin.x = v77;
        v96.origin.y = a5;
        v96.size.double width = a6;
        v96.size.height = a7;
        CGFloat v29 = CGRectGetMaxX(v96);
        double v30 = v22 - v25;
        uint64_t v86 = 0;
        v87 = (double *)&v86;
        uint64_t v88 = 0x2020000000;
        uint64_t v89 = 0;
        uint64_t v82 = 0;
        v83 = (double *)&v82;
        uint64_t v84 = 0x2020000000;
        uint64_t v85 = 0;
        if (MaxX > v29) {
          goto LABEL_11;
        }
        v78[0] = _NSConcreteStackBlock;
        v78[1] = v75;
        v79[0] = sub_100026C34;
        v79[1] = &unk_1000A1A00;
        v79[4] = v70;
        v79[5] = v17;
        *(double *)&v79[6] = v30 + v27;
        long long v80 = v93;
        float64_t v81 = v94;
        v79[2] = &v86;
        v79[3] = &v82;
        id v31 = objc_retainBlock(v78);
        uint64_t v32 = 0;
        float64_t v33 = v74.f64[0];
        do
        {
          if (v17 != v32) {
            ((void (*)(void *, double, double, double, double))v31[2])(v31, *(double *)(*(void *)&v33 - 16), *(double *)(*(void *)&v33 - 8), **(double **)&v33, *(double *)(*(void *)&v33 + 8));
          }
          ++v32;
          *(void *)&v33 += 32;
        }
        while (a2 != v32);

        if (v83[3] < v87[3])
        {
LABEL_11:
          CGRect v34 = [v13 objectAtIndexedSubscript:v17];
          [v34 setIconPlacement:2];

          CGRect v35 = &v71[2 * v17];
          v35->f64[0] = v30 + v35->f64[0];
          sub_100026CB0(v35, &v90);
        }
        _Block_object_dispose(&v82, 8);
        _Block_object_dispose(&v86, 8);
      }
      ++v17;
    }
    while (v17 != a2);
    a1 = v70;
    uint64_t v15 = v71;
    size_t v14 = v64;
    CGRect v36 = memcpy(v70, v71, v64);
    int v16 = 0;
  }
  while ((LOBYTE(v73.f64[0]) & 1) != 0);
  __chkstk_darwin(v36);
  v37 = &v61 - 2 * a2;
  v66 = v37;
  v38 = a1;
  unint64_t v39 = a2;
  do
  {
    float64x2_t v40 = *v38;
    v38 += 2;
    *(float64x2_t *)v37 = v40;
    v37 += 2;
    --v39;
  }
  while (v39);
  v41 = a1;
  unint64_t v42 = a2;
  do
  {
    sub_100026CB0(v41, &v90);
    v41 += 2;
    --v42;
  }
  while (v42);
  unsigned int v67 = 0;
  v43 = v71;
  v63 = v71 + 2;
  v62 = v70 + 2;
  float64x2_t v74 = (float64x2_t)vdupq_n_s64(0x3FAEB851EB851EB8uLL);
  float64x2_t v73 = (float64x2_t)vdupq_n_s64(0xBFAEB851EB851EB8);
  float64x2_t v65 = (float64x2_t)vdupq_n_s64(0xBF9EB851EB851EB8);
  do
  {
    memcpy(v43, v70, v64);
    uint64_t v44 = 0;
    LODWORD(v75) = 0;
    v69 = v62;
    v68 = v63;
    while (1)
    {
      uint64_t v45 = v44 + 1;
      uint64_t v72 = v44 + 1;
      if (v44 + 1 < a2)
      {
        v46 = v69;
        v47 = v68;
        v48 = &v43[2 * v44];
        v49 = &v70[2 * v44];
        do
        {
          sub_100026CB0(v48, &v90);
          v50 = [v13 objectAtIndexedSubscript:v44];
          v51 = [v13 objectAtIndexedSubscript:v45];
          [v50 sizeForIntersectionWithCityView:v51 atOrigin:v46->f64[0] selfOrigin:v46->f64[1] v49->f64[0] v49->f64[1]];
          long long v76 = v52;
          long long v77 = v53;

          if (*(double *)&v76 != 0.0 || *(double *)&v77 != 0.0)
          {
            v54.i64[0] = v77;
            float v55 = *(double *)v54.i64 * *(double *)v54.i64 + *(double *)&v76 * *(double *)&v76;
            v54.i64[1] = v76;
            float64x2_t v56 = (float64x2_t)vextq_s8(v54, v54, 8uLL);
            float64x2_t v57 = vaddq_f64(v56, (float64x2_t)vandq_s8((int8x16_t)vdupq_lane_s64(COERCE__INT64(sqrtf(v55)), 0), (int8x16_t)vcgtq_f64((float64x2_t)v54, v56)));
            float64x2_t v58 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(vsubq_f64(*v49, *v46)), (int8x16_t)vnegq_f64(v57), (int8x16_t)v57);
            float64x2_t *v48 = vmlaq_f64(*v48, v74, v58);
            float64x2_t *v47 = vmlaq_f64(*v47, v73, v58);
            LODWORD(v75) = 1;
          }
          ++v45;
          v47 += 2;
          v46 += 2;
        }
        while (a2 != v45);
      }
      if (v67 > 9) {
        break;
      }
      float64x2_t v59 = vsubq_f64(v70[2 * v44], *(float64x2_t *)&v66[2 * v44]);
      if (v59.f64[0] == 0.0 && v59.f64[1] == 0.0) {
        break;
      }
      v60 = &v71[2 * v44];
      float64x2_t *v60 = vmlaq_f64(*v60, v65, v59);
      sub_100026CB0(v60, &v90);
      v43 = v71;
      if (v72 == a2) {
        goto LABEL_36;
      }
      LODWORD(v75) = 1;
LABEL_34:
      v68 += 2;
      v69 += 2;
      uint64_t v44 = v72;
    }
    sub_100026CB0(&v71[2 * v44], &v90);
    if (v72 != a2)
    {
      v43 = v71;
      goto LABEL_34;
    }
    v43 = v71;
    if ((v75 & 1) == 0) {
      break;
    }
LABEL_36:
    memcpy(v70, v43, v64);
    ++v67;
  }
  while (v67 != 30);
LABEL_37:
}

void sub_1000259EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 288), 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

id sub_100025A1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFrame: *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64)];
}

id sub_100026368(uint64_t a1)
{
  int v1 = __chkstk_darwin(a1);
  double v3 = v2;
  double v5 = v4;
  long double v7 = v6;
  long double v8 = sin((v6 + 284.0) * 0.98630137 * 0.0174532925) * 23.45;
  double v9 = (modf(v7, __y) * 24.0 + -12.0) * 15.0;
  double v20 = v8;
  double v10 = tan(v8 * 0.0174532925);
  unsigned int v11 = v22;
  for (uint64_t i = -180; i != 181; ++i)
  {
    double v13 = (double)i;
    double v14 = 90.0;
    if (v10 != 0.0)
    {
      long double v15 = cos((v9 + v13) * 0.0174532925);
      double v14 = atan(-v15 / v10) * 57.2957795;
    }
    *(v11 - 1) = v14;
    *unsigned int v11 = v13;
    v11 += 2;
  }
  int v16 = +[UIBezierPath bezierPath];
  if (v20 <= 0.0) {
    double v17 = 0.0;
  }
  else {
    double v17 = v3;
  }
  if ((v1 & 1) == 0) {
    sub_10002663C(__y[1], v22[0], v5);
  }
  [v16 moveToPoint:];
  uint64_t v18 = 0x1FFFFFFFFFFFFD2ELL;
  do
  {
    [v16 addLineToPoint:sub_10002663C(v22[v18 + 721], v22[v18 + 722], v5)];
    v18 += 2;
  }
  while (v18 * 8);
  if (v1)
  {
    [v16 addLineToPoint:v5, v17];
    [v16 addLineToPoint:0.0, v17];
  }

  return v16;
}

double sub_10002663C(double a1, double a2, double a3)
{
  sub_100024DB0(a3);
  return *((double *)sub_1000266F0(a3) + 2) + v6 + (a2 + 180.0) * v5 / 360.0;
}

uint64_t *sub_1000266F0(double a1)
{
  if (qword_1000C7CE8 != -1) {
    dispatch_once(&qword_1000C7CE8, &stru_1000A19D8);
  }
  double v2 = &qword_1000C7BD0[5 * (int)sub_1000267AC(a1)];
  double v3 = (void **)(v2 + 1);
  if (!v2[1])
  {
    double v4 = +[UIColor mtui_worldClockMapLandColor];
    uint64_t v5 = [(id)*v2 _flatImageWithColor:v4];
    double v6 = *v3;
    *double v3 = (void *)v5;
  }
  return v2;
}

uint64_t sub_1000267AC(double a1)
{
  if (qword_1000C7CE8 != -1) {
    dispatch_once(&qword_1000C7CE8, &stru_1000A19D8);
  }
  uint64_t v2 = 0;
  uint64_t v3 = 0xFFFFFFFFLL;
  double v4 = (id *)&qword_1000C7BD0;
  double v5 = 1.79769313e308;
  do
  {
    [*v4 size];
    double v7 = vabdd_f64(a1, v6);
    if (v3 == -1 || (v3 & 0x80000000) == 0 && v7 < v5)
    {
      double v5 = v7;
      uint64_t v3 = v2;
    }
    ++v2;
    v4 += 5;
  }
  while (v2 != 7);
  return v3;
}

void sub_100026858(id a1)
{
  +[UIImage imageNamed:@"map_portrait"];
  id v27 = 0;
  uint64_t v28 = 0;
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  long long v29 = xmmword_1000826C0;
  +[UIImage imageNamed:@"map_landscape", sub_100026B18((uint64_t)qword_1000C7BD0, (uint64_t)&v26).n128_f64[0]];
  id v23 = 0;
  uint64_t v24 = 0;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  long long v25 = xmmword_1000826D0;
  id v18 = +[UIImage imageNamed:@"map_landscape_large", sub_100026B18((uint64_t)&unk_1000C7BF8, (uint64_t)&v22).n128_f64[0]];
  id v19 = 0;
  long long v20 = xmmword_1000826E0;
  uint64_t v21 = 0x4000000000000000;
  +[UIImage imageNamed:@"map_portrait_medium", sub_100026B18((uint64_t)&unk_1000C7C20, (uint64_t)&v18).n128_f64[0]];
  id v15 = 0;
  uint64_t v16 = 0;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  long long v17 = xmmword_1000826F0;
  +[UIImage imageNamed:@"map_landscape_medium", sub_100026B18((uint64_t)&unk_1000C7C48, (uint64_t)&v14).n128_f64[0]];
  id v11 = 0;
  uint64_t v12 = 0;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  long long v13 = xmmword_100082700;
  +[UIImage imageNamed:@"map_landscape_medium_wide", sub_100026B18((uint64_t)&unk_1000C7C70, (uint64_t)&v10).n128_f64[0]];
  id v7 = 0;
  uint64_t v8 = 0;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  long long v9 = xmmword_100082710;
  id v1 = +[UIImage imageNamed:@"map_mac", sub_100026B18((uint64_t)&unk_1000C7C98, (uint64_t)&v6).n128_f64[0]];
  id v2 = 0;
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 0x4000000000000000;
  sub_100026B18((uint64_t)&unk_1000C7CC0, (uint64_t)&v1);
}

void sub_100026A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_100026B10()
{
}

__n128 sub_100026B18(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)a1, *(id *)a2);
  objc_storeStrong((id *)(a1 + 8), *(id *)(a2 + 8));
  __n128 result = *(__n128 *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)(a1 + 16) = result;
  return result;
}

double sub_100026B60(void *a1)
{
  id v1 = a1;
  id v2 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  uint64_t v3 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v3];

  uint64_t v4 = [v2 components:128 fromDate:qword_1000C7BC8 toDate:v1 options:0];

  double v5 = (double)(uint64_t)[v4 second] / 86400.0 + 1.0;
  return v5;
}

double sub_100026C34(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v8 = a2;
  uint64_t v10 = *(void *)(a1 + 48) + 32 * *(void *)(a1 + 56);
  double result = *(double *)v10;
  if (*(double *)v10 >= v8)
  {
    if (*(double *)v10 <= v8) {
      return result;
    }
    CGRect v17 = CGRectIntersection(*(CGRect *)(a1 + 64), *(CGRect *)&v8);
    uint64_t v15 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v12 = *(void *)(v10 + 8);
    uint64_t v13 = *(void *)(v10 + 16);
    uint64_t v14 = *(void *)(v10 + 24);
    CGRect v17 = CGRectIntersection(*(CGRect *)&result, *(CGRect *)&v8);
    uint64_t v15 = *(void *)(a1 + 32);
  }
  uint64_t v16 = *(void *)(v15 + 8);
  double result = *(double *)(v16 + 24) + v17.size.width * v17.size.height;
  *(double *)(v16 + 24) = result;
  return result;
}

void sub_100026CB0(float64x2_t *a1, float64x2_t *a2)
{
  if (!CGRectContainsRect(*(CGRect *)a2->f64, *(CGRect *)a1->f64))
  {
    *(int8x16_t *)a1 = vbslq_s8((int8x16_t)vcgtq_f64(*a1, *a2), *(int8x16_t *)a1, *(int8x16_t *)a2);
    double v4 = CGRectGetMaxX(*(CGRect *)a2->f64) - a1[1].f64[0];
    if (v4 >= a1->f64[0]) {
      double v4 = a1->f64[0];
    }
    a1->f64[0] = v4;
    double v5 = CGRectGetMaxY(*(CGRect *)a2->f64) - a1[1].f64[1];
    if (v5 >= a1->f64[1]) {
      double v5 = a1->f64[1];
    }
    a1->f64[1] = v5;
  }
}

id sub_100028748(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) countDownView];
  uint64_t v3 = v2;
  double v4 = 0.0;
  if (!*(unsigned char *)(a1 + 48)) {
    double v4 = 1.0;
  }
  [v2 setAlpha:v4];

  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);

  return [v5 updateLabelColorForState:v6];
}

void sub_100028E48(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = +[MTAStateStore shared];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) alarmIDString];
    double v4 = +[MTAStateStoreEvent eventWithType:2 identifier:v3];
    [v5 pushEvent:v4];
  }
  else
  {
    uint64_t v3 = +[MTAStateStoreEvent eventWithType:1];
    [v5 pushEvent:v3];
  }
}

void sub_100029000(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100029024(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained dataSource];
  unsigned int v3 = [v2 hasSleepAlarmMatchingAlarmIDString:*(void *)(a1 + 32)];

  if (v3)
  {
    [WeakRetained showSleepView:0];
  }
  else
  {
    double v4 = [WeakRetained dataSource];
    id v5 = [v4 rowForAlarmWithID:*(void *)(a1 + 32)];

    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = [WeakRetained dataSource];
      id v7 = [v6 alarmAtRow:v5];

      [WeakRetained showAddViewForAlarm:v7];
    }
  }
}

void sub_1000291B8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 setUserInteractionEnabled:1];
}

void sub_1000292E8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 setUserInteractionEnabled:1];
}

id sub_1000294C8(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadUI:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return _[v2 reloadWidgetTimeline];
}

id sub_1000296A0(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadUI:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return _[v2 reloadWidgetTimeline];
}

id sub_100029878(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadUI:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return _[v2 reloadWidgetTimeline];
}

void sub_1000299B8(uint64_t a1)
{
  uint64_t v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading widget timeline from app", (uint8_t *)&v6, 0xCu);
  }

  double v4 = +[MTWidgetUtilities reloadAlarmWidgetTimeline];
  if (v4)
  {
    id v5 = MTLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006CC60(a1, (uint64_t)v4, v5);
    }
  }
}

void sub_100029CE8(id a1)
{
  qword_1000C7CF8 = +[MTAlarm alarmWithHour:7 minute:30];

  _objc_release_x1();
}

void sub_100029FF8(id a1)
{
  id v2 = +[MTAStateStore shared];
  id v1 = +[MTAStateStoreEvent eventWithType:8];
  [v2 pushEvent:v1];
}

id sub_10002A180(uint64_t a1)
{
  return _[*(id *)(a1 + 32) reloadSleepSection];
}

id sub_10002A338(uint64_t a1)
{
  return _[*(id *)(a1 + 32) reloadSleepSection];
}

void sub_10002A4A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10002A4C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained tableView];
  [v2 reloadData];

  [WeakRetained _scrollToAlarm:*(void *)(a1 + 32)];
}

void sub_10002A618(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10002A638(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _scrollToAlarm:*(void *)(a1 + 32)];
}

void sub_10002AA70(uint64_t a1)
{
  uint64_t v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = [*(id *)(a1 + 32) isEnabled];
    *(_DWORD *)buf = 67109120;
    unsigned int v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Refreshing UI for cell (enabled: %d)", buf, 8u);
  }

  block = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  long long v9 = sub_10002ABC8;
  uint64_t v10 = &unk_1000A14C0;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v6.i64[0];
  int8x16_t v11 = vextq_s8(v6, v6, 8uLL);
  dispatch_after(0, (dispatch_queue_t)&_dispatch_main_q, &block);
  id v5 = &kMTCAClockAlarmActivations;
  if (!*(unsigned char *)(a1 + 48)) {
    id v5 = &kMTCAClockAlarmDeactivations;
  }
  +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", *v5, *(_OWORD *)&v6, block, v8, v9, v10);
}

void sub_10002ABC8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataSource];
  id v3 = [v2 rowForAlarm:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) tableView];
  id v5 = +[NSIndexPath indexPathForRow:v3 inSection:3];
  id v6 = [v4 cellForRowAtIndexPath:v5];

  [v6 refreshUI:*(void *)(a1 + 40) animated:1];
}

void sub_10002CCF0(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)GEOAlmanac);
  id v3 = [*(id *)(a1 + 32) city];
  id v4 = [v3 alCity];
  [v4 latitude];
  double v6 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) city];
  uint64_t v8 = [v7 alCity];
  [v8 longitude];
  double v10 = v9;

  int8x16_t v11 = +[NSDate date];
  [v11 timeIntervalSinceReferenceDate];
  [v2 calculateAstronomicalTimeForLocation:v6 time:v10 altitudeInDegrees:GEOAlmanacAltitudeSunset];

  float64_t v33 = [v2 sunrise];
  id v31 = [v2 sunset];
  unsigned int v13 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v32 = [v13 localizedStringForKey:@"SUNRISE_FORMAT" value:&stru_1000A2560 table:@"Localizable"];

  uint64_t v14 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v15 = [v14 localizedStringForKey:@"SUNRISE" value:&stru_1000A2560 table:@"Localizable"];
  uint64_t v16 = [*(id *)(a1 + 32) timeFormatter];
  CGRect v17 = [v16 stringFromDate:v33];
  id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v15, v17);

  id v19 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v20 = [v19 localizedStringForKey:@"SUNSET_FORMAT" value:&stru_1000A2560 table:@"Localizable"];

  uint64_t v21 = +[NSBundle bundleForClass:objc_opt_class()];
  id v22 = [v21 localizedStringForKey:@"SUNSET" value:&stru_1000A2560 table:@"Localizable"];
  id v23 = [*(id *)(a1 + 32) timeFormatter];
  uint64_t v24 = [v23 stringFromDate:v31];
  long long v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v22, v24);

  uint64_t v26 = [*(id *)(a1 + 32) city];
  id v27 = [v26 alCityId];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D0B8;
  block[3] = &unk_1000A1BA0;
  block[4] = *(void *)(a1 + 32);
  id v35 = v27;
  id v36 = v18;
  id v37 = v25;
  id v28 = v25;
  id v29 = v18;
  id v30 = v27;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10002D0B8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) city];
  id v3 = [v2 alCityId];
  unsigned int v4 = [v3 isEqualToNumber:*(void *)(a1 + 40)];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    double v6 = [*(id *)(a1 + 32) sunriseLabel];
    [v6 setText:v5];

    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = [*(id *)(a1 + 32) sunsetLabel];
    [v8 setText:v7];

    float v9 = *(void **)(a1 + 32);
    [v9 setNeedsLayout];
  }
}

uint64_t sub_10002E82C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 setEditing:0 animated:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    unsigned int v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

id sub_10002FA7C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  unsigned int v4 = [v2 collectionView];
  uint64_t v5 = [v4 indexPathForCell:v3];

  return v5;
}

void sub_100031330(id a1)
{
  qword_1000C7D08 = +[UIFont systemFontOfSize:44.0 weight:UIFontWeightLight];

  _objc_release_x1();
}

id sub_1000315E0(uint64_t a1, void *a2)
{
  return [a2 reloadState];
}

id sub_100031ABC(id a1, WorldClockCity *a2)
{
  return [(WorldClockCity *)a2 name];
}

void sub_100031F34(id a1)
{
  id v2 = +[MTAStateStore shared];
  id v1 = +[MTAStateStoreEvent eventWithType:3];
  [v2 pushEvent:v1];
}

uint64_t sub_100034BC4(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 1;
  return result;
}

id sub_100034CC8(double a1)
{
  UIGraphicsBeginImageContextWithOptions(*(CGSize *)&a1, 0, 0.0);
  id v3 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, a1, a1);
  unsigned int v4 = +[UIColor mtui_backgroundColor];
  [v4 setFill];

  [v3 fill];
  uint64_t v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v5;
}

void sub_1000351B4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsUpdateConstraints];

  [*(id *)(a1 + 32) updateTimeViewFont];
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  unsigned int v4 = [*(id *)(a1 + 32) pageControl];
  [v4 setAlpha:v3];

  uint64_t v5 = [*(id *)(a1 + 32) lapTableController];
  id v9 = [v5 tableView];

  double v6 = [*(id *)(a1 + 32) view];
  [v6 safeAreaInsets];
  double v8 = v7;

  [v9 setContentInset:0.0, 0.0, v8, 0.0];
  [v9 setScrollIndicatorInsets:0.0, 0.0, v8, 0.0];
}

void sub_100035D6C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory();
  double v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006CDE0();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ migration completed without error", (uint8_t *)&v8, 0xCu);
    }

    double v6 = [*(id *)(a1 + 32) migrator];
    [v6 eraseLocalDefaults];
  }

  [*(id *)(a1 + 32) reloadStopwatchesWithCompletion:0];
}

void sub_100035F7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = MTLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006CE4C();
    }
  }
  else
  {
    double v10 = [v5 firstObject];
    if (v10) {
      goto LABEL_9;
    }
  }
  int v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v12 = 138543362;
    uint64_t v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@ couldn't fetch stopwatch, have to create one", (uint8_t *)&v12, 0xCu);
  }

  double v10 = objc_opt_new();
LABEL_9:
  [*(id *)(a1 + 32) setupViewModelWithStopwatch:v10];
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(void))(v11 + 16))();
  }
}

BOOL sub_100038808(id a1, UIApplicationShortcutItem *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(UIApplicationShortcutItem *)a2 type];
  v8[0] = @"com.apple.mobiletimer.start-stopwatch";
  v8[1] = @"com.apple.mobiletimer.stop-stopwatch";
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

id sub_100038B50(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[8];
  if (v3 == 3)
  {
    [v2 resumeLapTimer];
  }
  else if (v3 == 1)
  {
    [v2 startLapTimer];
  }
  id v4 = *(void **)(a1 + 32);

  return [v4 setMode:2];
}

void *sub_100038C20(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[8] == 2) {
    return [result pauseLapTimer];
  }
  return result;
}

void *sub_100038CAC(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[8] == 2) {
    return [result lapLapTimer];
  }
  return result;
}

void *sub_100038D38(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[8] != 1)
  {
    [result resetLapTimer];
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 setMode:1];
  }
  return result;
}

void sub_10003C280(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recentView];
  [v2 setEditing:*(unsigned __int8 *)(a1 + 40)];
}

id sub_10003DABC(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  [v2 setAlpha:v3];
  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:v4];
  if (*(unsigned char *)(a1 + 40)) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:v5];
  unsigned __int8 v6 = *(void **)(*(void *)(a1 + 32) + 24);
  if (*(unsigned char *)(a1 + 40)) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }

  return [v6 setAlpha:v7];
}

id sub_1000456C8()
{
  uint64_t v0 = +[UIApplication sharedApplication];
  id v1 = [v0 preferredContentSizeCategory];

  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v1, UIContentSizeCategoryAccessibilityMedium) == NSOrderedDescending)
  {
    id v2 = UIContentSizeCategoryAccessibilityMedium;

    id v1 = v2;
  }
  double v3 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v1];
  double v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v3];

  return v4;
}

uint64_t sub_100046DF0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100047314(uint64_t a1)
{
  id v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v11 = 138543362;
    uint64_t v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer updated", (uint8_t *)&v11, 0xCu);
  }

  double v4 = *(void **)(a1 + 40);
  [*(id *)(a1 + 48) remainingTime];
  double v6 = v5;
  [*(id *)(a1 + 48) duration];
  double v8 = v7;
  id v9 = [*(id *)(a1 + 48) state];
  if ([*(id *)(a1 + 48) isCurrentTimer])
  {
    [v4 setRemainingTime:v9 duration:0 state:1 title:v6 forceRefresh:v8];
  }
  else
  {
    double v10 = [*(id *)(a1 + 48) title];
    [v4 setRemainingTime:v9 duration:v10 state:1 title:v6 forceRefresh:v8];
  }
}

void sub_10004768C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = MTLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8) {
      sub_10006D1C8();
    }
  }
  else if (v8)
  {
    sub_10006D128(a1);
  }

  if (*(void *)(a1 + 48)) {
    [*(id *)(a1 + 32) dismissAddEditViewController:];
  }
  [*(id *)(a1 + 32) setEditing:0];
  [*(id *)(a1 + 32) _reloadUI:0];
}

id sub_1000477B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) showAddView];
}

void sub_100048440(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100048460(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100048B18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) timerCellView];
  [v2 setEditing:*(unsigned __int8 *)(a1 + 40)];
}

void sub_100049550(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  unsigned __int8 v3 = [v2 mtui_isRTL];

  double v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v4 pages];
    id v6 = (char *)[v5 count];
    double v7 = &v6[~(unint64_t)[*(id *)(a1 + 32) currentPage]];
  }
  else
  {
    double v7 = (char *)[v4 currentPage];
  }
  double v8 = (double)(unint64_t)v7;
  id v9 = [*(id *)(a1 + 32) scrollView];
  [v9 bounds];
  double v11 = v10 * v8;

  id v12 = [*(id *)(a1 + 32) scrollView];
  [v12 setContentOffset:v11, 0.0];
}

void sub_10004EACC(id a1)
{
  qword_1000C7D28 = objc_opt_new();

  _objc_release_x1();
}

id sub_10004F6E8()
{
  if (qword_1000C7D40 != -1) {
    dispatch_once(&qword_1000C7D40, &stru_1000A1F70);
  }
  uint64_t v0 = (void *)qword_1000C7D38;

  return v0;
}

void sub_10004F73C(id a1)
{
  v6.double width = 10.0;
  v6.height = 10.0;
  UIGraphicsBeginImageContextWithOptions(v6, 0, 0.0);
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 10.0, 10.0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = +[UIColor systemOrangeColor];
  [v1 setFill];

  [v4 fill];
  uint64_t v2 = UIGraphicsGetImageFromCurrentImageContext();
  unsigned __int8 v3 = (void *)qword_1000C7D38;
  qword_1000C7D38 = v2;

  UIGraphicsEndImageContext();
}

void sub_100050F88(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dismissAddViewController:*(void *)(a1 + 32)];
}

int64_t sub_1000515F4(id a1, ALCity *a2, ALCity *a3)
{
  id v4 = a3;
  id v5 = [(ALCity *)a2 name];
  CGSize v6 = [(ALCity *)v4 name];

  id v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return (int64_t)v7;
}

int64_t sub_100051E3C(id a1, ALCity *a2, ALCity *a3)
{
  id v4 = a3;
  id v5 = [(ALCity *)a2 name];
  CGSize v6 = [(ALCity *)v4 name];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

id sub_10005297C(uint64_t a1)
{
  [*(id *)(a1 + 32) addClockViewController:0 addCity:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 finishAddViewControllerDismissal:0];
}

id sub_1000529C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) scrollToCityAtIndex:*(void *)(a1 + 40) animated:1];
}

void sub_100053B24(uint64_t a1)
{
  switch(*(void *)(a1 + 40))
  {
    case 0:
    case 4:
      NSLog(@"Unexpected timer state %ld", *(void *)(a1 + 40));
      break;
    case 1:
      [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:1.0];
      [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:0.0];
      [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:0.0];
      id v2 = *(void **)(*(void *)(a1 + 32) + 40);
      [v2 setAlpha:0.0];
      break;
    case 2:
      unsigned __int8 v3 = *(void **)(*(void *)(a1 + 32) + 40);
      uint64_t v4 = +[UIColor mtui_quaternaryColor];
      goto LABEL_8;
    case 3:
      [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:0.0];
      [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:1.0];
      [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:1.0];
      unsigned __int8 v3 = *(void **)(*(void *)(a1 + 32) + 40);
      uint64_t v4 = +[UIColor mtui_secondaryTextColor];
LABEL_8:
      id v5 = (id)v4;
      [v3 setComponentColor:v4];

      break;
    default:
      return;
  }
}

void sub_100054D70(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 reloadData];
}

id sub_100054E88(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadUI:0];
}

id sub_100055468(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadUI:*(void *)(a1 + 40)];
}

id sub_100055B14(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isViewLoaded];
  if (result)
  {
    unsigned __int8 v3 = *(void **)(a1 + 32);
    return [v3 showAddViewForTimer:0];
  }
  return result;
}

void sub_100055C78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100055C94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained showAddTimerViewWithTimer:*(void *)(a1 + 32)];
}

id sub_100056328(id *a1)
{
  uint64_t v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    uint64_t v4 = [a1[5] timerID];
    int v6 = 138543618;
    id v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer started: %@", (uint8_t *)&v6, 0x16u);
  }
  +[MTAnalytics incrementEventCount:kMTCATimerStarts];
  [a1[6] dismissAddViewController:a1[6]];
  return [a1[4] reloadState];
}

id sub_100057690(uint64_t a1)
{
  uint64_t v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) timerID];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer started: %@", (uint8_t *)&v6, 0x16u);
  }
  +[MTAnalytics incrementEventCount:kMTCATimerStarts];
  return [*(id *)(a1 + 32) reloadState];
}

id sub_100057990(uint64_t a1)
{
  uint64_t v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer stopped. Preparing UI for stopped timer.", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) reloadState];
  return +[MTAnalytics incrementEventCount:kMTCATimerCancels];
}

id sub_100057BF0(uint64_t a1)
{
  uint64_t v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer paused.  timer.", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 32) reloadState];
  id v4 = [*(id *)(a1 + 40) state];
  int v5 = &kMTCATimerPauses;
  if (v4 != (id)2) {
    int v5 = &kMTCATimerResumes;
  }
  return +[MTAnalytics incrementEventCount:*v5];
}

void sub_1000582B4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = MTLogForCategory();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006D378(a1);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [*(id *)(a1 + 40) timerID];
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@ started timer: %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

id sub_100058BAC(uint64_t a1)
{
  uint64_t v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer stopped. Preparing UI for stopped timer.", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) stopUpdatingTimerUI];
  id v4 = [*(id *)(a1 + 40) controlsView];
  [v4 setTimerControlState:0];

  [*(id *)(a1 + 32) updateStateAndReloadData];
  return +[MTAnalytics incrementEventCount:kMTCATimerCancels];
}

id sub_100058EE8(uint64_t a1)
{
  uint64_t v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer paused. Preparing UI for stopped timer.", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) prepareUIForState:*(void *)(a1 + 40) forceRefresh:0];
  id v4 = &kMTCATimerPauses;
  if (*(void *)(a1 + 40) != 2) {
    id v4 = &kMTCATimerResumes;
  }
  return +[MTAnalytics incrementEventCount:*v4];
}

void sub_100058FCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer update failed with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100059CD8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_10005AC7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_10005AC88(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

id sub_10005AC90(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id sub_10005BFCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadUI:*(void *)(a1 + 40)];
}

void sub_10005C278(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionViewLayout];
  [v1 invalidateLayout];
}

void sub_10005C788(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10005C7A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained showAddAlarmViewPopUpWithAlarm:*(void *)(a1 + 32)];
}

id sub_10005CF40(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _addOrEditControllerDidDismissCommitChanges:0];
}

id sub_10005D0F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadUI:0];
}

id sub_10005D100(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _addOrEditControllerDidDismissCommitChanges:0];
}

id sub_10005D19C(uint64_t a1)
{
  [*(id *)(a1 + 32) setEditing:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return _[v2 _addOrEditControllerDidDismissCommitChanges:0];
}

id sub_10005D35C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadUI:*(void *)(a1 + 40)];
}

id sub_10005D3F0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _addOrEditControllerDidDismissCommitChanges:0];
}

id sub_10005D54C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadUI:0];
}

id sub_10005DAF8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _addOrEditControllerDidDismissCommitChanges:0];
}

id sub_10005DCE8(uint64_t a1)
{
  uint64_t v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = [*(id *)(a1 + 32) isEnabled];
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Refreshing UI for cell (enabled: %d)", (uint8_t *)v6, 8u);
  }

  [*(id *)(a1 + 40) refreshUI:*(void *)(a1 + 32) animated:1];
  id v4 = &kMTCAClockAlarmActivations;
  if (!*(unsigned char *)(a1 + 48)) {
    id v4 = &kMTCAClockAlarmDeactivations;
  }
  return +[MTAnalytics incrementEventCount:*v4];
}

uint64_t sub_10005E020()
{
  return 0;
}

uint64_t sub_10005E02C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10005E05C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_10005E094())()
{
  return nullsub_11;
}

uint64_t sub_10005E0B8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10005E0E8(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_10005E120())()
{
  return nullsub_11;
}

uint64_t sub_10005E140()
{
  id v0 = [self mainBundle];
  v4._countAndFlagsBits = 0xD000000000000044;
  v4._object = (void *)0x8000000100095BC0;
  v1._object = (void *)0x8000000100095B90;
  v1._countAndFlagsBits = 0xD000000000000023;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  sub_10005E20C();
  return Text.init<A>(_:)();
}

unint64_t sub_10005E20C()
{
  unint64_t result = qword_1000C77F0;
  if (!qword_1000C77F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C77F0);
  }
  return result;
}

uint64_t sub_10005E260()
{
  uint64_t v1 = sub_10005EB9C(&qword_1000C77F8);
  __chkstk_darwin(v1 - 8);
  v83 = (char *)&v66 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10005EB9C(&qword_1000C7800);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  float64x2_t v73 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v78 = (char *)&v66 - v6;
  uint64_t v7 = sub_10005EB9C(&qword_1000C7808);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v84 = v7;
  uint64_t v85 = v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v67 = (uint64_t)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v74 = (uint64_t)&v66 - v12;
  __chkstk_darwin(v11);
  uint64_t v81 = (uint64_t)&v66 - v13;
  uint64_t v82 = type metadata accessor for AttributedString();
  uint64_t v87 = *(void *)(v82 - 8);
  uint64_t v14 = __chkstk_darwin(v82);
  long long v76 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v86 = (char *)&v66 - v16;
  uint64_t v17 = *v0;
  uint64_t v18 = v0[1];
  sub_10005EB9C(&qword_1000C7810);
  uint64_t v19 = swift_allocObject();
  long long v80 = xmmword_100082BA0;
  *(_OWORD *)(v19 + 16) = xmmword_100082BA0;
  *(void *)(v19 + 56) = &type metadata for String;
  unint64_t v20 = sub_10005EBE0();
  *(void *)(v19 + 64) = v20;
  *(void *)(v19 + 32) = v17;
  *(void *)(v19 + 40) = v18;
  swift_bridgeObjectRetain();
  uint64_t v21 = String.init(format:_:)();
  uint64_t v23 = v22;
  uint64_t v24 = v0[2];
  uint64_t v25 = v0[3];
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = v80;
  *(void *)(v26 + 56) = &type metadata for String;
  *(void *)(v26 + 64) = v20;
  *(void *)(v26 + 32) = v24;
  *(void *)(v26 + 40) = v25;
  swift_bridgeObjectRetain();
  uint64_t v27 = String.init(format:_:)();
  uint64_t v29 = v28;
  id v30 = [self mainBundle];
  v91._countAndFlagsBits = 0xD00000000000004BLL;
  v91._object = (void *)0x8000000100095C40;
  v31._object = (void *)0x8000000100095C10;
  v31._countAndFlagsBits = 0xD000000000000025;
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v31, (Swift::String_optional)0, (NSBundle)v30, v32, v91);

  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_100082BB0;
  *(void *)(v33 + 56) = &type metadata for String;
  *(void *)(v33 + 64) = v20;
  *(void *)(v33 + 32) = v21;
  *(void *)(v33 + 40) = v23;
  *(void *)(v33 + 96) = &type metadata for String;
  *(void *)(v33 + 104) = v20;
  uint64_t v72 = v27;
  *(void *)(v33 + 72) = v27;
  *(void *)(v33 + 80) = v29;
  uint64_t v75 = v23;
  swift_bridgeObjectRetain();
  uint64_t v77 = v29;
  swift_bridgeObjectRetain();
  String.init(format:_:)();
  swift_bridgeObjectRelease();
  CGRect v34 = v86;
  AttributedString.init(stringLiteral:)();
  uint64_t v35 = v87;
  uint64_t v37 = v87 + 16;
  id v36 = *(void (**)(char *, char *, uint64_t))(v87 + 16);
  v38 = v76;
  unint64_t v39 = v34;
  uint64_t v40 = v82;
  v36(v76, v39, v82);
  uint64_t v88 = v21;
  uint64_t v89 = v23;
  uint64_t v41 = type metadata accessor for Locale();
  uint64_t v42 = *(void *)(v41 - 8);
  v43 = v83;
  v71 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56);
  uint64_t v70 = v42 + 56;
  v71(v83, 1, 1, v41);
  uint64_t v44 = sub_100063778(&qword_1000C7820, (void (*)(uint64_t))&type metadata accessor for AttributedString);
  unint64_t v45 = sub_10005E20C();
  uint64_t v46 = (uint64_t)v78;
  uint64_t v47 = (uint64_t)v43;
  uint64_t v69 = v44;
  unint64_t v68 = v45;
  v48 = v38;
  AttributedStringProtocol.range<A>(of:options:locale:)();
  sub_100064420(v47, &qword_1000C77F8);
  v49 = *(void (**)(char *, uint64_t))(v35 + 8);
  uint64_t v87 = v35 + 8;
  v49(v38, v40);
  swift_bridgeObjectRelease();
  v50 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v85 + 48);
  v85 += 48;
  int v51 = v50(v46, 1, v84);
  v79 = v36;
  *(void *)&long long v80 = v37;
  if (v51 == 1)
  {
    swift_bridgeObjectRelease();
    sub_100064420(v46, &qword_1000C7800);
    uint64_t v52 = v40;
    long long v53 = v86;
  }
  else
  {
    sub_10005EC34(v46, v81);
    v36(v38, v86, v40);
    uint64_t v88 = v72;
    uint64_t v89 = v77;
    uint64_t v54 = (uint64_t)v83;
    v71(v83, 1, 1, v41);
    uint64_t v55 = (uint64_t)v73;
    AttributedStringProtocol.range<A>(of:options:locale:)();
    sub_100064420(v54, &qword_1000C77F8);
    v49(v38, v40);
    swift_bridgeObjectRelease();
    if (v50(v55, 1, v84) == 1)
    {
      uint64_t v52 = v40;
      sub_100064420(v81, &qword_1000C7808);
      sub_100064420(v55, &qword_1000C7800);
      long long v53 = v86;
    }
    else
    {
      sub_10005EC34(v55, v74);
      uint64_t v56 = v67;
      sub_10005EC9C(v81, v67);
      uint64_t KeyPath = swift_getKeyPath();
      __chkstk_darwin(KeyPath);
      swift_getKeyPath();
      uint64_t v90 = static Color.primary.getter();
      sub_100065334(&qword_1000C7830, &qword_1000C7808);
      float64x2_t v58 = v49;
      float64x2_t v59 = (void (*)(uint64_t *, void))AttributedString.subscript.modify();
      sub_10005EDF0();
      AttributedSubstring.subscript.setter();
      v59(&v88, 0);
      v49 = v58;
      sub_100064420(v56, &qword_1000C7808);
      uint64_t v60 = v74;
      sub_10005EC9C(v74, v56);
      uint64_t v61 = swift_getKeyPath();
      __chkstk_darwin(v61);
      swift_getKeyPath();
      uint64_t v90 = static Color.primary.getter();
      v62 = v86;
      v63 = (void (*)(uint64_t *, void))AttributedString.subscript.modify();
      AttributedSubstring.subscript.setter();
      v48 = v38;
      v63(&v88, 0);
      uint64_t v52 = v82;
      sub_100064420(v56, &qword_1000C7808);
      sub_100064420(v60, &qword_1000C7808);
      sub_100064420(v81, &qword_1000C7808);
      long long v53 = v62;
    }
  }
  v79(v48, v53, v52);
  uint64_t v64 = Text.init(_:)();
  v49(v53, v52);
  return v64;
}

uint64_t sub_10005EB9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10005EBE0()
{
  unint64_t result = qword_1000C7818;
  if (!qword_1000C7818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C7818);
  }
  return result;
}

uint64_t sub_10005EC34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005EB9C(&qword_1000C7808);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005EC9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005EB9C(&qword_1000C7808);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005ED04()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t sub_10005ED60()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

void sub_10005EDA8()
{
}

void sub_10005EDD0()
{
}

unint64_t sub_10005EDF0()
{
  unint64_t result = qword_1000C7828;
  if (!qword_1000C7828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C7828);
  }
  return result;
}

uint64_t sub_10005EE44()
{
  return 8;
}

uint64_t sub_10005EE50()
{
  return swift_release();
}

uint64_t sub_10005EE58(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_10005EE64(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_10005EE70(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10005EEB8()
{
  uint64_t v0 = type metadata accessor for SetTimerWithLabelWithSiriTip();
  uint64_t v1 = sub_100063778(&qword_1000C7838, (void (*)(uint64_t))type metadata accessor for SetTimerWithLabelWithSiriTip);

  return SiriKitIntentTip.siriIcon.getter(v0, v1);
}

uint64_t type metadata accessor for SetTimerWithLabelWithSiriTip()
{
  uint64_t result = qword_1000C8060;
  if (!qword_1000C8060) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10005EF78()
{
  return Tips.Event.init<>(id:)();
}

uint64_t sub_10005EF94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SetTimerWithLabelWithSiriTip() + 24);
  uint64_t v4 = sub_10005EB9C(&qword_1000C7840);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_10005F010()
{
  uint64_t v1 = sub_10005EB9C(&qword_1000C7840);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005EB9C(&qword_1000C7848);
  type metadata accessor for Tips.Rule();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100082BB0;
  uint64_t v5 = type metadata accessor for SetTimerWithLabelWithSiriTip();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + *(int *)(v5 + 24), v1);
  type metadata accessor for Tips.EmptyDonation();
  sub_100063778(&qword_1000C7850, (void (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation);
  sub_100063778(&qword_1000C7858, (void (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation);
  Tips.Rule.init<A>(_:_:)();
  sub_100063778(&qword_1000C7838, (void (*)(uint64_t))type metadata accessor for SetTimerWithLabelWithSiriTip);
  SiriKitIntentTip.siriDidExecuteIntent.getter();
  Tips.Rule.init<A>(_:_:)();
  static Tips.RuleBuilder.buildExpression(_:)();
  swift_bridgeObjectRelease();
  uint64_t v6 = static Tips.RuleBuilder.buildPartialBlock(first:)();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10005F2C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v1 = type metadata accessor for PredicateExpressions.ComparisonOperator();
  uint64_t v31 = *(void *)(v1 - 8);
  uint64_t v32 = v1;
  __chkstk_darwin(v1);
  id v30 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10005EB9C(&qword_1000C7A38);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  uint64_t v35 = v4;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10005EB9C(&qword_1000C7A40);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10005EB9C(&qword_1000C7A48);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005EB9C(&qword_1000C7A50);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v28 = v15;
  uint64_t v29 = v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100065334(&qword_1000C7A58, &qword_1000C7A40);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_getKeyPath();
  sub_100065334(&qword_1000C7A60, &qword_1000C7A48);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v36 = 1;
  static PredicateExpressions.build_Arg<A>(_:)();
  unint64_t v20 = v30;
  uint64_t v19 = v31;
  uint64_t v21 = v32;
  (*(void (**)(char *, void, uint64_t))(v31 + 104))(v30, enum case for PredicateExpressions.ComparisonOperator.greaterThanOrEqual(_:), v32);
  uint64_t v22 = sub_10005EB9C(&qword_1000C7AA8);
  uint64_t v23 = v33;
  v33[3] = v22;
  v23[4] = sub_100065378(&qword_1000C7AB0, &qword_1000C7AA8);
  sub_100064A0C(v23);
  sub_100065334(&qword_1000C7A98, &qword_1000C7A50);
  sub_100065334(&qword_1000C7AA0, &qword_1000C7A38);
  uint64_t v24 = v28;
  uint64_t v25 = v34;
  static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v21);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v18, v24);
}

uint64_t sub_10005F7D0@<X0>(uint64_t *a1@<X8>)
{
  sub_10005EB9C(&qword_1000C7840);
  uint64_t result = Tips.Event.donations.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10005F808@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(*(void *)result + 16);
  return result;
}

uint64_t sub_10005F818@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v1 = sub_10005EB9C(&qword_1000C7A38);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v25 = v1;
  uint64_t v26 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10005EB9C(&qword_1000C7A40);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10005EB9C(&qword_1000C7A48);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10005EB9C(&qword_1000C7A50);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v22 = v13;
  uint64_t v23 = v14;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100065334(&qword_1000C7A58, &qword_1000C7A40);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_getKeyPath();
  sub_100065334(&qword_1000C7A60, &qword_1000C7A48);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v27 = 0;
  static PredicateExpressions.build_Arg<A>(_:)();
  uint64_t v17 = sub_10005EB9C(&qword_1000C7A68);
  uint64_t v18 = v24;
  v24[3] = v17;
  v18[4] = sub_100065378(&qword_1000C7A70, &qword_1000C7A68);
  sub_100064A0C(v18);
  sub_100065334(&qword_1000C7A98, &qword_1000C7A50);
  sub_100065334(&qword_1000C7AA0, &qword_1000C7A38);
  uint64_t v19 = v22;
  uint64_t v20 = v25;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v16, v19);
}

uint64_t sub_10005FC58()
{
  uint64_t v0 = sub_10005EB9C(&qword_1000C7860);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Tips.MaxDisplayCount();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10005EB9C(&qword_1000C7868);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Tips.MaxDisplayCount.init(_:)();
  static Tips.OptionsBuilder.buildExpression<A>(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v15 = v4;
  uint64_t v16 = &protocol witness table for Tips.MaxDisplayCount;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  static Tips.OptionsBuilder.buildPartialBlock<A>(first:)();
  uint64_t v15 = v8;
  uint64_t v16 = (void *)OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v13 = static Tips.OptionsBuilder.buildFinalResult<A>(_:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v13;
}

uint64_t sub_10005FEF4@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  type metadata accessor for SetTimerWithLabelWithSiriTip();
  return Tips.Event.init<>(id:)();
}

uint64_t sub_10005FF4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  type metadata accessor for SetTimerWithLabelWithSiriTip();
  return Tips.Event.init<>(id:)();
}

uint64_t sub_10005FFA0@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  return Tips.Event.init<>(id:)();
}

uint64_t sub_10005FFE8()
{
  return sub_10005E140();
}

uint64_t sub_100060010(uint64_t a1)
{
  uint64_t v2 = sub_100063778(&qword_1000C7838, (void (*)(uint64_t))type metadata accessor for SetTimerWithLabelWithSiriTip);

  return SiriKitIntentTip.siriIcon.getter(a1, v2);
}

uint64_t sub_100060080(uint64_t a1)
{
  uint64_t v3 = sub_10005EB9C(&qword_1000C7840);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005EB9C(&qword_1000C7848);
  type metadata accessor for Tips.Rule();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100082BB0;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v1 + *(int *)(a1 + 24), v3);
  type metadata accessor for Tips.EmptyDonation();
  sub_100063778(&qword_1000C7850, (void (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation);
  sub_100063778(&qword_1000C7858, (void (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation);
  Tips.Rule.init<A>(_:_:)();
  sub_100063778(&qword_1000C7838, (void (*)(uint64_t))type metadata accessor for SetTimerWithLabelWithSiriTip);
  SiriKitIntentTip.siriDidExecuteIntent.getter();
  Tips.Rule.init<A>(_:_:)();
  static Tips.RuleBuilder.buildExpression(_:)();
  swift_bridgeObjectRelease();
  uint64_t v7 = static Tips.RuleBuilder.buildPartialBlock(first:)();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10006032C@<X0>(uint64_t *a1@<X8>)
{
  sub_100063778(&qword_1000C78A8, (void (*)(uint64_t))type metadata accessor for SetTimerWithLabelWithSiriTip);
  uint64_t result = Tip.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10006039C(uint64_t a1)
{
  return a1;
}

void sub_1000603D0(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
}

uint64_t sub_1000603DC()
{
  return Tip.title.getter();
}

uint64_t sub_100060410@<X0>(uint64_t *a1@<X8>)
{
  sub_1000637D0();
  uint64_t result = Tip.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id sub_100060450(uint64_t a1, void *a2)
{
  id v5 = [objc_allocWithZone(v2) init];
  CreateTimerIntent.duration.setter();
  [v5 setType:a1];
  [v5 setLabel:a2];
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 _setLaunchId:v6];

  return v5;
}

id sub_100060518()
{
  id v1 = [objc_allocWithZone(v0) init];
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setLabel:v2];

  NSString v3 = String._bridgeToObjectiveC()();
  [v1 _setLaunchId:v3];

  return v1;
}

uint64_t variable initialization expression of SiriTipsController.delegate()
{
  return 0;
}

uint64_t sub_100060634()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1000606E8(uint64_t a1)
{
  NSString v3 = (void *)(v1 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate);
  swift_beginAccess();
  *NSString v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_10006073C())()
{
  return j__swift_endAccess;
}

id SiriTipsController.__deallocating_deinit()
{
  (*(void (**)(void))((swift_isaMask & *v0) + 0xD8))();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriTipsController();
  return [super dealloc];
}

void sub_1000608F0()
{
  uint64_t v1 = sub_10005EB9C(&qword_1000C7890);
  __chkstk_darwin(v1 - 8);
  NSString v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void **)((char *)v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView);
  if (v4)
  {
    id v5 = *(uint64_t (**)(void))((swift_isaMask & *v0) + 0x70);
    id v12 = v4;
    NSString v6 = (void *)v5();
    if (v6)
    {
      [v6 tipViewControllerDidBecomeAvailableWithSiriTipsController:v0 tipView:v12];
      swift_unknownObjectRelease();
    }
    uint64_t v7 = v12;
  }
  else
  {
    uint64_t v8 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 1, 1, v8);
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = v0;
    uint64_t v10 = v0;
    *(void *)((char *)v10 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_checkForSiriTipsTask) = sub_100062ACC((uint64_t)v3, (uint64_t)&unk_1000C78A0, (uint64_t)v9);
    swift_release();
  }
}

uint64_t sub_100060A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[10] = a4;
  sub_10005EB9C(&qword_1000C7890);
  v4[11] = swift_task_alloc();
  sub_10005EB9C(&qword_1000C7990);
  v4[12] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for SetTimerWithLabelWithSiriTip();
  v4[13] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[14] = v6;
  v4[15] = *(void *)(v6 + 64);
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  v4[18] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Tips.ConfigurationOption.AnalyticsEngine();
  v4[19] = v7;
  v4[20] = *(void *)(v7 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Tips.ConfigurationOption.DatastoreLocation();
  v4[22] = v8;
  v4[23] = *(void *)(v8 - 8);
  v4[24] = swift_task_alloc();
  return _swift_task_switch(sub_100060C98, 0, 0);
}

uint64_t sub_100060C98()
{
  sub_10005EB9C(&qword_1000C7998);
  type metadata accessor for Tips.ConfigurationOption();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100082BB0;
  static Tips.ConfigurationOption.DatastoreLocation.tipsGroupContainer.getter();
  uint64_t v2 = v0[23];
  uint64_t v1 = v0[24];
  uint64_t v4 = v0[21];
  uint64_t v3 = v0[22];
  uint64_t v5 = v0[20];
  uint64_t v43 = v0[19];
  static Tips.ConfigurationOption.datastoreLocation(_:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  static Tips.ConfigurationOption.AnalyticsEngine.coreAnalytics.getter();
  static Tips.ConfigurationOption.analyticsEngine(_:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v43);
  static Tips.configure(_:)();
  swift_bridgeObjectRelease();
  id v6 = [self sharedPreferences];
  id v7 = [v6 languageCode];

  if (!v7)
  {
    if (qword_1000C7D50 != -1) {
      swift_once();
    }
    uint64_t v34 = type metadata accessor for Logger();
    sub_100063608(v34, (uint64_t)qword_1000C83C8);
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v35, v36)) {
      goto LABEL_20;
    }
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v37 = 0;
    v38 = "Not able to get the current Siri locale setting. Returning";
    goto LABEL_19;
  }
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  id v11 = [self sharedInstance];
  if (!v11)
  {
    __break(1u);
    return static SiriKitIntentTip.create(with:)(v11, v12);
  }
  uint64_t v13 = v11;
  NSString v14 = String._bridgeToObjectiveC()();
  NSString v15 = String._bridgeToObjectiveC()();
  id v16 = [self mainBundle];
  v0[2] = v8;
  v0[3] = v10;
  v0[4] = 45;
  v0[5] = 0xE100000000000000;
  v0[6] = 95;
  v0[7] = 0xE100000000000000;
  unint64_t v42 = sub_10005E20C();
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  swift_bridgeObjectRelease();
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v18 = [v13 localizedStringForKey:v14 table:v15 bundle:v16 languageCode:v17];

  if (v18)
  {
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v21 = v20;

    uint64_t v22 = HIBYTE(v21) & 0xF;
    if ((v21 & 0x2000000000000000) == 0) {
      uint64_t v22 = v19 & 0xFFFFFFFFFFFFLL;
    }
    if (v22)
    {
      id v23 = objc_allocWithZone((Class)INSpeakableString);
      swift_bridgeObjectRetain();
      NSString v24 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v25 = [v23 initWithSpokenPhrase:v24];

      id v26 = [objc_allocWithZone((Class)type metadata accessor for CreateTimerIntent()) init];
      v0[25] = v26;
      id v27 = v26;
      CreateTimerIntent.duration.setter();
      [v27 setType:1];
      [v27 setLabel:v25];
      NSString v28 = String._bridgeToObjectiveC()();
      [v27 _setLaunchId:v28];

      id v29 = [objc_allocWithZone((Class)type metadata accessor for SearchTimerIntent()) init];
      v0[26] = v29;
      id v30 = v29;
      NSString v31 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v30 setLabel:v31];

      NSString v32 = String._bridgeToObjectiveC()();
      [v30 _setLaunchId:v32];

      uint64_t v33 = (void *)swift_task_alloc();
      v0[27] = v33;
      sub_1000643CC();
      *uint64_t v33 = v0;
      v33[1] = sub_1000613BC;
      id v11 = v0 + 8;
      id v12 = v30;
      return static SiriKitIntentTip.create(with:)(v11, v12);
    }
    swift_bridgeObjectRelease();
  }
  if (qword_1000C7D50 != -1) {
    swift_once();
  }
  uint64_t v39 = type metadata accessor for Logger();
  sub_100063608(v39, (uint64_t)qword_1000C83C8);
  uint64_t v35 = Logger.logObject.getter();
  os_log_type_t v36 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v37 = 0;
    v38 = "Not able to get the timer label in Siri locale. Returning";
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v35, v36, v38, v37, 2u);
    swift_slowDealloc();
  }
LABEL_20:

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v40 = (uint64_t (*)(void))v0[1];
  return v40();
}

uint64_t sub_1000613BC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000614B8, 0, 0);
}

uint64_t sub_1000614B8()
{
  uint64_t v1 = v0[9];
  v0[28] = v0[8];
  v0[29] = v1;
  if (v1)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = String.count.getter();
    swift_bridgeObjectRelease();
    if (v2 > 0)
    {
      uint64_t v3 = (void *)swift_task_alloc();
      v0[30] = v3;
      sub_100063778(&qword_1000C7838, (void (*)(uint64_t))type metadata accessor for SetTimerWithLabelWithSiriTip);
      *uint64_t v3 = v0;
      v3[1] = sub_100061734;
      uint64_t v4 = v0[25];
      uint64_t v5 = v0[12];
      return static SiriKitIntentTip.create(with:)(v5, v4);
    }
    swift_bridgeObjectRelease();
  }
  if (qword_1000C7D50 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100063608(v6, (uint64_t)qword_1000C83C8);
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = (void *)v0[25];
  id v11 = v0[26];
  if (v9)
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Not able to create HowMuchTimeLeft Tip or its example utterance is empty. Returning", v12, 2u);
    swift_slowDealloc();
    uint64_t v13 = v7;
  }
  else
  {
    uint64_t v13 = v0[25];
    uint64_t v10 = (void *)v0[26];
    id v11 = v7;
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  NSString v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_100061734()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100061830, 0, 0);
}

uint64_t sub_100061830()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[12];
  int v3 = (*(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 48))(v2, 1, v0[13]);
  uint64_t v4 = v0[29];
  if (v3 == 1)
  {
    swift_bridgeObjectRelease();
    sub_100064420(v2, &qword_1000C7990);
    if (qword_1000C7D50 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_100063608(v5, (uint64_t)qword_1000C83C8);
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.debug.getter();
    BOOL v8 = os_log_type_enabled(v6, v7);
    BOOL v9 = (void *)v0[25];
    uint64_t v10 = (void *)v0[26];
    if (v8)
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Not able to create SetTimerWithLabel Tip. Returning", v11, 2u);
      swift_slowDealloc();
    }
    else
    {
    }
  }
  else
  {
    uint64_t v12 = v0[28];
    uint64_t v34 = (void *)v0[26];
    uint64_t v35 = (void *)v0[25];
    uint64_t v14 = v0[17];
    uint64_t v13 = v0[18];
    uint64_t v15 = v0[16];
    uint64_t v16 = v0[11];
    uint64_t v36 = v16;
    NSString v32 = (void *)v0[10];
    uint64_t v33 = v0[15];
    sub_10006447C(v2, v13);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v13 + 16) = v12;
    *(void *)(v13 + 24) = v4;
    uint64_t v30 = v14;
    sub_1000644E0(v13, v14);
    uint64_t v17 = type metadata accessor for TaskPriority();
    NSString v31 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
    v31(v16, 1, 1, v17);
    uint64_t v18 = v14;
    uint64_t v19 = v15;
    sub_1000644E0(v18, v15);
    unint64_t v20 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    unint64_t v21 = (v33 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = 0;
    *(void *)(v22 + 24) = 0;
    sub_10006447C(v19, v22 + v20);
    *(void *)(v22 + v21) = v32;
    id v23 = (void *)(v22 + ((v21 + 15) & 0xFFFFFFFFFFFFFFF8));
    void *v23 = v12;
    v23[1] = v4;
    NSString v24 = v32;
    *(void *)&v24[OBJC_IVAR____TtC11MobileTimer18SiriTipsController_updateTipStatusTask] = sub_100062ACC(v36, (uint64_t)&unk_1000C79B0, v22);
    swift_release();
    v31(v36, 1, 1, v17);
    sub_1000644E0(v30, v19);
    type metadata accessor for MainActor();
    id v25 = v24;
    uint64_t v26 = static MainActor.shared.getter();
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v26;
    *(void *)(v27 + 24) = &protocol witness table for MainActor;
    sub_10006447C(v19, v27 + v20);
    *(void *)(v27 + v21) = v25;
    sub_100062ACC(v36, (uint64_t)&unk_1000C79C0, v27);

    swift_release();
    sub_1000649B0(v30);
    sub_1000649B0(v13);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  NSString v28 = (uint64_t (*)(void))v0[1];
  return v28();
}

uint64_t sub_100061C44()
{
  uint64_t v2 = *(void *)(v0 + 32);
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = sub_100061CD8;
  return sub_100060A9C((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_100061CD8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100061DCC()
{
  if (qword_1000C7D50 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return sub_100063608(v0, (uint64_t)qword_1000C83C8);
}

uint64_t sub_100061E30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[12] = a6;
  v7[13] = a7;
  v7[10] = a4;
  v7[11] = a5;
  uint64_t v8 = type metadata accessor for SetTimerWithLabelWithSiriTip();
  v7[14] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[15] = v9;
  v7[16] = *(void *)(v9 + 64);
  v7[17] = swift_task_alloc();
  sub_10005EB9C(&qword_1000C7890);
  v7[18] = swift_task_alloc();
  v7[19] = swift_task_alloc();
  v7[20] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Tips.Status();
  v7[21] = v10;
  v7[22] = *(void *)(v10 - 8);
  v7[23] = swift_task_alloc();
  sub_10005EB9C(&qword_1000C79C8);
  v7[24] = swift_task_alloc();
  uint64_t v11 = sub_10005EB9C(&qword_1000C79D0);
  v7[25] = v11;
  v7[26] = *(void *)(v11 - 8);
  v7[27] = swift_task_alloc();
  uint64_t v12 = sub_10005EB9C(&qword_1000C79D8);
  v7[28] = v12;
  v7[29] = *(void *)(v12 - 8);
  v7[30] = swift_task_alloc();
  return _swift_task_switch(sub_100062094, 0, 0);
}

uint64_t sub_100062094()
{
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v3 = *(void *)(v0 + 200);
  sub_100063778(&qword_1000C78A8, (void (*)(uint64_t))type metadata accessor for SetTimerWithLabelWithSiriTip);
  Tip.statusUpdates.getter();
  AsyncStream.makeAsyncIterator()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  *(_DWORD *)(v0 + 256) = enum case for Tips.Status.invalidated(_:);
  *(_DWORD *)(v0 + 260) = enum case for Tips.Status.pending(_:);
  *(_DWORD *)(v0 + 264) = enum case for Tips.Status.available(_:);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000621FC;
  uint64_t v5 = *(void *)(v0 + 224);
  uint64_t v6 = *(void *)(v0 + 192);
  return AsyncStream.Iterator.next(isolation:)(v6, 0, 0, v5);
}

uint64_t sub_1000621FC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000622F8, 0, 0);
}

uint64_t sub_1000622F8()
{
  uint64_t v2 = v0 + 176;
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v5 = (void *)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 168);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v4) == 1)
  {
    uint64_t v2 = v0 + 232;
    uint64_t v6 = (void *)(v0 + 240);
    uint64_t v5 = (void *)(v0 + 224);
LABEL_5:
    (*(void (**)(void, void))(*(void *)v2 + 8))(*v6, *v5);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
  uint64_t v6 = (void *)(v0 + 184);
  uint64_t v7 = *(void *)(v0 + 184);
  int v8 = *(_DWORD *)(v0 + 256);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v7, v3, v4);
  int v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 88))(v7, v4);
  if (v9 == v8)
  {
    uint64_t v11 = *(void *)(v0 + 232);
    uint64_t v10 = *(void *)(v0 + 240);
    uint64_t v12 = *(void *)(v0 + 224);
    uint64_t v13 = *(void *)(v0 + 144);
    uint64_t v14 = *(void **)(v0 + 88);
    uint64_t v15 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
    type metadata accessor for MainActor();
    id v16 = v14;
    uint64_t v17 = static MainActor.shared.getter();
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = v17;
    v18[3] = &protocol witness table for MainActor;
    v18[4] = v16;
    sub_100062C78(v13, (uint64_t)&unk_1000C79E8, (uint64_t)v18);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    goto LABEL_5;
  }
  if (v9 == *(_DWORD *)(v0 + 260))
  {
    uint64_t v21 = *(void *)(v0 + 160);
    uint64_t v22 = *(void **)(v0 + 88);
    uint64_t v23 = type metadata accessor for TaskPriority();
    uint64_t v24 = *(void *)(v23 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56))(v21, 1, 1, v23);
    type metadata accessor for MainActor();
    id v25 = v22;
    uint64_t v26 = static MainActor.shared.getter();
    uint64_t v27 = (void *)swift_allocObject();
    v27[2] = v26;
    v27[3] = &protocol witness table for MainActor;
    v27[4] = v25;
    int v28 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v21, 1, v23);
    uint64_t v29 = *(void *)(v0 + 160);
    if (v28 == 1)
    {
      sub_100064420(*(void *)(v0 + 160), &qword_1000C7890);
      if (v26)
      {
LABEL_11:
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v30 = dispatch thunk of Actor.unownedExecutor.getter();
        uint64_t v32 = v31;
        swift_unknownObjectRelease();
        goto LABEL_18;
      }
    }
    else
    {
      TaskPriority.rawValue.getter();
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v29, v23);
      if (v27[2]) {
        goto LABEL_11;
      }
    }
    uint64_t v30 = 0;
    uint64_t v32 = 0;
LABEL_18:
    uint64_t v51 = swift_allocObject();
    *(void *)(v51 + 16) = &unk_1000C7A10;
    *(void *)(v51 + 24) = v27;
    sub_10005EB9C(&qword_1000C7A28);
    if (v32 | v30)
    {
      *(void *)(v0 + 48) = 0;
      *(void *)(v0 + 56) = 0;
      *(void *)(v0 + 64) = v30;
      *(void *)(v0 + 72) = v32;
    }
LABEL_26:
    swift_task_create();
    swift_release();
    goto LABEL_27;
  }
  if (v9 == *(_DWORD *)(v0 + 264))
  {
    uint64_t v33 = *(void *)(v0 + 152);
    uint64_t v34 = *(void *)(v0 + 136);
    uint64_t v56 = *(void *)(v0 + 128);
    uint64_t v57 = v33;
    uint64_t v35 = *(void *)(v0 + 120);
    uint64_t v36 = *(void *)(v0 + 104);
    uint64_t v58 = *(void *)(v0 + 96);
    uint64_t v37 = *(void *)(v0 + 80);
    v38 = *(void **)(v0 + 88);
    uint64_t v39 = type metadata accessor for TaskPriority();
    uint64_t v40 = *(void *)(v39 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 56))(v33, 1, 1, v39);
    sub_1000644E0(v37, v34);
    type metadata accessor for MainActor();
    id v41 = v38;
    swift_bridgeObjectRetain();
    uint64_t v42 = static MainActor.shared.getter();
    unint64_t v43 = (*(unsigned __int8 *)(v35 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
    uint64_t v44 = (void *)swift_allocObject();
    v44[2] = v42;
    v44[3] = &protocol witness table for MainActor;
    v44[4] = v41;
    sub_10006447C(v34, (uint64_t)v44 + v43);
    unint64_t v45 = (void *)((char *)v44 + ((v56 + v43 + 7) & 0xFFFFFFFFFFFFFFF8));
    *unint64_t v45 = v58;
    v45[1] = v36;
    int v46 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v57, 1, v39);
    uint64_t v47 = *(void *)(v0 + 152);
    if (v46 == 1)
    {
      sub_100064420(*(void *)(v0 + 152), &qword_1000C7890);
      if (v44[2])
      {
LABEL_15:
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v48 = dispatch thunk of Actor.unownedExecutor.getter();
        uint64_t v50 = v49;
        swift_unknownObjectRelease();
        goto LABEL_24;
      }
    }
    else
    {
      TaskPriority.rawValue.getter();
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v47, v39);
      if (v44[2]) {
        goto LABEL_15;
      }
    }
    uint64_t v48 = 0;
    uint64_t v50 = 0;
LABEL_24:
    uint64_t v52 = swift_allocObject();
    *(void *)(v52 + 16) = &unk_1000C79F8;
    *(void *)(v52 + 24) = v44;
    if (v50 | v48)
    {
      *(void *)(v0 + 16) = 0;
      *(void *)(v0 + 24) = 0;
      *(void *)(v0 + 32) = v48;
      *(void *)(v0 + 40) = v50;
    }
    goto LABEL_26;
  }
  (*(void (**)(void, void))(*(void *)v2 + 8))(*v6, *v5);
LABEL_27:
  long long v53 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v53;
  *long long v53 = v0;
  v53[1] = sub_1000621FC;
  uint64_t v54 = *(void *)(v0 + 224);
  uint64_t v55 = *(void *)(v0 + 192);
  return AsyncStream.Iterator.next(isolation:)(v55, 0, 0, v54);
}

uint64_t sub_100062A34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  type metadata accessor for MainActor();
  v4[4] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100065430, v6, v5);
}

uint64_t sub_100062ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100064420(a1, &qword_1000C7890);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100062C78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100064420(a1, &qword_1000C7890);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_10005EB9C(&qword_1000C7A28);
  return swift_task_create();
}

uint64_t sub_100062E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[6] = a6;
  v7[7] = a7;
  v7[4] = a4;
  v7[5] = a5;
  type metadata accessor for MainActor();
  v7[8] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100062EC8, v9, v8);
}

uint64_t sub_100062EC8()
{
  uint64_t v1 = v0[4];
  swift_release();
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView);
  if (v2)
  {
    uint64_t v3 = *(uint64_t (**)(void))((swift_isaMask & *(void *)v0[4]) + 0x70);
    id v4 = v2;
    uint64_t v5 = (void *)v3();
    if (v5)
    {
      [v5 tipViewControllerDidBecomeAvailableWithSiriTipsController:v0[4] tipView:v4];
      swift_unknownObjectRelease();
    }
    uint64_t v7 = v0[6];
    uint64_t v6 = v0[7];
    type metadata accessor for SetTimerWithLabelWithSiriTip();
    sub_100063778(&qword_1000C7838, (void (*)(uint64_t))type metadata accessor for SetTimerWithLabelWithSiriTip);
    uint64_t v8 = (void (*)(void))SiriKitIntentTip.notifySiriTipOnDisplay.getter();
    v8();
    swift_release();
    v0[2] = v7;
    v0[3] = v6;
    sub_1000643CC();
    uint64_t v9 = (void (*)(void))SiriKitIntentTip.notifySiriTipOnDisplay.getter();
    v9();
    swift_release();
  }
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100063050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  type metadata accessor for MainActor();
  v4[4] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000630E8, v6, v5);
}

uint64_t sub_1000630E8()
{
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = swift_release();
  uint64_t v3 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x70))(v2);
  id v4 = v3;
  if (v3)
  {
    [v3 tipViewControllerWasInvalidatedWithSiriTipsController:*(void *)(v0 + 24)];
    swift_unknownObjectRelease();
  }
  **(unsigned char **)(v0 + 16) = v4 == 0;
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1000631B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[7] = a4;
  v5[8] = a5;
  type metadata accessor for MainActor();
  v5[9] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100063248, v7, v6);
}

uint64_t sub_100063248()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[7];
  swift_release();
  v0[5] = type metadata accessor for SetTimerWithLabelWithSiriTip();
  v0[6] = sub_100063778(&qword_1000C78A8, (void (*)(uint64_t))type metadata accessor for SetTimerWithLabelWithSiriTip);
  uint64_t v3 = sub_100064A0C(v0 + 2);
  sub_1000644E0(v2, (uint64_t)v3);
  objc_allocWithZone((Class)type metadata accessor for TipUIView());
  uint64_t v4 = TipUIView.init(_:arrowEdge:actionHandler:)();
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView);
  *(void *)(v1 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView) = v4;

  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

void sub_1000633A4()
{
  uint64_t v1 = OBJC_IVAR____TtC11MobileTimer18SiriTipsController_updateTipStatusTask;
  if (*(void *)(v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_updateTipStatusTask))
  {
    swift_retain();
    Task.cancel()();
    swift_release();
  }
  *(void *)(v0 + v1) = 0;
  swift_release();
  uint64_t v2 = OBJC_IVAR____TtC11MobileTimer18SiriTipsController_checkForSiriTipsTask;
  if (*(void *)(v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_checkForSiriTipsTask))
  {
    swift_retain();
    Task.cancel()();
    swift_release();
  }
  *(void *)(v0 + v2) = 0;
  swift_release();
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView);
  *(void *)(v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView) = 0;
}

id SiriTipsController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id SiriTipsController.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11MobileTimer18SiriTipsController_checkForSiriTipsTask] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11MobileTimer18SiriTipsController_updateTipStatusTask] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriTipsController();
  return [super init];
}

void *sub_100063568()
{
  return &unk_1000A21C0;
}

unint64_t sub_100063574()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_100063590()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000640A4(v0, qword_1000C83C8);
  sub_100063608(v0, (uint64_t)qword_1000C83C8);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100063608(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100063640@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000C7D50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = sub_100063608(v2, (uint64_t)qword_1000C83C8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000636E8()
{
  return sub_100063778(&qword_1000C78A8, (void (*)(uint64_t))type metadata accessor for SetTimerWithLabelWithSiriTip);
}

uint64_t sub_100063730()
{
  return sub_100063778(&qword_1000C78B0, (void (*)(uint64_t))type metadata accessor for SetTimerWithLabelWithSiriTip);
}

uint64_t sub_100063778(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_1000637C0()
{
  return &protocol witness table for String;
}

unint64_t sub_1000637D0()
{
  unint64_t result = qword_1000C78B8;
  if (!qword_1000C78B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C78B8);
  }
  return result;
}

unint64_t sub_100063828()
{
  unint64_t result = qword_1000C78C0;
  if (!qword_1000C78C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C78C0);
  }
  return result;
}

uint64_t *sub_10006387C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_10005EB9C(&qword_1000C7840);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  return a1;
}

uint64_t sub_100063960(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_10005EB9C(&qword_1000C7840);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_1000639E4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_10005EB9C(&qword_1000C7840);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  return a1;
}

void *sub_100063A78(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10005EB9C(&qword_1000C7840);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_100063B38(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_10005EB9C(&qword_1000C7840);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_100063BB8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_10005EB9C(&qword_1000C7840);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_100063C58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100063C6C);
}

uint64_t sub_100063C6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_10005EB9C(&qword_1000C7840);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100063D20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100063D34);
}

uint64_t sub_100063D34(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10005EB9C(&qword_1000C7840);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100063DE0()
{
  sub_100063E78();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100063E78()
{
  if (!qword_1000C7920)
  {
    type metadata accessor for Tips.EmptyDonation();
    sub_100063778(&qword_1000C7850, (void (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation);
    sub_100063778(&qword_1000C7858, (void (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation);
    unint64_t v0 = type metadata accessor for Tips.Event();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000C7920);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for HowMuchTimeLeftOnLabeledTimer(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HowMuchTimeLeftOnLabeledTimer()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for HowMuchTimeLeftOnLabeledTimer(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for HowMuchTimeLeftOnLabeledTimer(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for HowMuchTimeLeftOnLabeledTimer(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HowMuchTimeLeftOnLabeledTimer(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HowMuchTimeLeftOnLabeledTimer(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HowMuchTimeLeftOnLabeledTimer()
{
  return &type metadata for HowMuchTimeLeftOnLabeledTimer;
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

uint64_t *sub_1000640A4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100064108(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unint64_t v4 = v2;
  v4[1] = sub_1000641E4;
  return v6(a1);
}

uint64_t sub_1000641E4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000642DC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100064314(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10006541C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000C7980 + dword_1000C7980);
  return v6(a1, v4);
}

unint64_t sub_1000643CC()
{
  unint64_t result = qword_1000C79A0;
  if (!qword_1000C79A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000C79A0);
  }
  return result;
}

uint64_t sub_100064420(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10005EB9C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10006447C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SetTimerWithLabelWithSiriTip();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000644E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SetTimerWithLabelWithSiriTip();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100064544()
{
  uint64_t v1 = (int *)(type metadata accessor for SetTimerWithLabelWithSiriTip() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[8];
  uint64_t v7 = sub_10005EB9C(&qword_1000C7840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, ((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v4);
}

uint64_t sub_10006467C()
{
  uint64_t v2 = *(void *)(type metadata accessor for SetTimerWithLabelWithSiriTip() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v0 + v4);
  uint64_t v6 = v0 + v3;
  uint64_t v7 = (uint64_t *)(v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  void *v10 = v1;
  v10[1] = sub_10006541C;
  return sub_100061E30((uint64_t)v10, v11, v12, v6, v5, v8, v9);
}

uint64_t sub_100064798()
{
  uint64_t v1 = (int *)(type metadata accessor for SetTimerWithLabelWithSiriTip() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[8];
  uint64_t v7 = sub_10005EB9C(&qword_1000C7840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v5 + 8, v4);
}

uint64_t sub_1000648B4()
{
  uint64_t v2 = *(void *)(type metadata accessor for SetTimerWithLabelWithSiriTip() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = v0 + v3;
  uint64_t v5 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_10006541C;
  return sub_1000631B0((uint64_t)v6, v7, v8, v4, v5);
}

uint64_t sub_1000649B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SetTimerWithLabelWithSiriTip();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_100064A0C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100064A74(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10006541C;
  return sub_100063050(a1, v5, v6, v4);
}

uint64_t sub_100064B14()
{
  uint64_t v1 = (int *)(type metadata accessor for SetTimerWithLabelWithSiriTip() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[8];
  uint64_t v7 = sub_10005EB9C(&qword_1000C7840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_100064C3C()
{
  uint64_t v2 = *(void *)(type metadata accessor for SetTimerWithLabelWithSiriTip() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = (uint64_t *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_10006541C;
  return sub_100062E2C((uint64_t)v9, v10, v11, v4, v5, v7, v8);
}

uint64_t sub_100064D54()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100064D94(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10006541C;
  return sub_100062A34(a1, v5, v6, v4);
}

uint64_t sub_100064E34(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *unint64_t v3 = v2;
  v3[1] = sub_100064F14;
  return v5(v2 + 32);
}

uint64_t sub_100064F14()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  unint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_100065028(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10006541C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000C7A18 + dword_1000C7A18);
  return v6(a1, v4);
}

uint64_t sub_1000650E0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100061CD8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000C7A18 + dword_1000C7A18);
  return v6(a1, v4);
}

uint64_t sub_100065198()
{
  return sub_100063778(&qword_1000C7850, (void (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation);
}

uint64_t sub_1000651E0()
{
  return sub_100063778(&qword_1000C7858, (void (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation);
}

unint64_t sub_100065228()
{
  unint64_t result = qword_1000C7A78;
  if (!qword_1000C7A78)
  {
    sub_10005EE70(&qword_1000C7A50);
    sub_10006529C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C7A78);
  }
  return result;
}

unint64_t sub_10006529C()
{
  unint64_t result = qword_1000C7A80;
  if (!qword_1000C7A80)
  {
    sub_10005EE70(&qword_1000C7A48);
    sub_100065334(&qword_1000C7A88, &qword_1000C7A40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C7A80);
  }
  return result;
}

uint64_t sub_100065334(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10005EE70(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100065378(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10005EE70(a2);
    sub_100065228();
    sub_100065334(&qword_1000C7A90, &qword_1000C7A38);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100065408()
{
}

uint64_t sub_100065434()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

id sub_100065444()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_1000C8088 = (uint64_t)result;
  return result;
}

uint64_t sub_100065498()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_1000640A4(v0, qword_1000C83E0);
  sub_100063608(v0, (uint64_t)qword_1000C83E0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100065544()
{
  return sub_10006C50C(&qword_1000C8090, (uint64_t (*)(void))&type metadata accessor for ColorResource, (uint64_t)qword_1000C83E0);
}

uint64_t sub_10006557C@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8090, (uint64_t (*)(void))&type metadata accessor for ColorResource, (uint64_t)qword_1000C83E0, a1);
}

uint64_t sub_1000655B4()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_1000640A4(v0, qword_1000C83F8);
  sub_100063608(v0, (uint64_t)qword_1000C83F8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_10006565C()
{
  return sub_10006C50C(&qword_1000C8098, (uint64_t (*)(void))&type metadata accessor for ColorResource, (uint64_t)qword_1000C83F8);
}

uint64_t sub_100065694@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8098, (uint64_t (*)(void))&type metadata accessor for ColorResource, (uint64_t)qword_1000C83F8, a1);
}

uint64_t sub_1000656CC()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_1000640A4(v0, qword_1000C8410);
  sub_100063608(v0, (uint64_t)qword_1000C8410);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100065774()
{
  return sub_10006C50C(&qword_1000C80A0, (uint64_t (*)(void))&type metadata accessor for ColorResource, (uint64_t)qword_1000C8410);
}

uint64_t sub_1000657AC@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C80A0, (uint64_t (*)(void))&type metadata accessor for ColorResource, (uint64_t)qword_1000C8410, a1);
}

uint64_t sub_1000657E4()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_1000640A4(v0, qword_1000C8428);
  sub_100063608(v0, (uint64_t)qword_1000C8428);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_10006588C()
{
  return sub_10006C50C(&qword_1000C80A8, (uint64_t (*)(void))&type metadata accessor for ColorResource, (uint64_t)qword_1000C8428);
}

uint64_t sub_1000658C4@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C80A8, (uint64_t (*)(void))&type metadata accessor for ColorResource, (uint64_t)qword_1000C8428, a1);
}

uint64_t sub_1000658FC()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8440);
  sub_100063608(v0, (uint64_t)qword_1000C8440);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000659A4()
{
  return sub_10006C50C(&qword_1000C80B0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8440);
}

uint64_t sub_1000659DC@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C80B0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8440, a1);
}

uint64_t sub_100065A14()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8458);
  sub_100063608(v0, (uint64_t)qword_1000C8458);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100065AC0()
{
  return sub_10006C50C(&qword_1000C80B8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8458);
}

uint64_t sub_100065AF8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C80B8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8458, a1);
}

uint64_t sub_100065B30()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8470);
  sub_100063608(v0, (uint64_t)qword_1000C8470);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100065BD8()
{
  return sub_10006C50C(&qword_1000C80C0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8470);
}

uint64_t sub_100065C10@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C80C0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8470, a1);
}

uint64_t sub_100065C48()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8488);
  sub_100063608(v0, (uint64_t)qword_1000C8488);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100065CF0()
{
  return sub_10006C50C(&qword_1000C80C8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8488);
}

uint64_t sub_100065D28@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C80C8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8488, a1);
}

uint64_t sub_100065D60()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C84A0);
  sub_100063608(v0, (uint64_t)qword_1000C84A0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100065E08()
{
  return sub_10006C50C(&qword_1000C80D0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C84A0);
}

uint64_t sub_100065E40@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C80D0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C84A0, a1);
}

uint64_t sub_100065E78()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C84B8);
  sub_100063608(v0, (uint64_t)qword_1000C84B8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100065F20()
{
  return sub_10006C50C(&qword_1000C80D8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C84B8);
}

uint64_t sub_100065F58@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C80D8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C84B8, a1);
}

uint64_t sub_100065F90()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C84D0);
  sub_100063608(v0, (uint64_t)qword_1000C84D0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100066038()
{
  return sub_10006C50C(&qword_1000C80E0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C84D0);
}

uint64_t sub_100066070@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C80E0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C84D0, a1);
}

uint64_t sub_1000660A8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C84E8);
  sub_100063608(v0, (uint64_t)qword_1000C84E8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100066150()
{
  return sub_10006C50C(&qword_1000C80E8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C84E8);
}

uint64_t sub_100066188@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C80E8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C84E8, a1);
}

uint64_t sub_1000661C0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8500);
  sub_100063608(v0, (uint64_t)qword_1000C8500);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100066268()
{
  return sub_10006C50C(&qword_1000C80F0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8500);
}

uint64_t sub_1000662A0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C80F0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8500, a1);
}

uint64_t sub_1000662D8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8518);
  sub_100063608(v0, (uint64_t)qword_1000C8518);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100066380()
{
  return sub_10006C50C(&qword_1000C80F8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8518);
}

uint64_t sub_1000663B8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C80F8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8518, a1);
}

uint64_t sub_1000663F0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8530);
  sub_100063608(v0, (uint64_t)qword_1000C8530);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100066498()
{
  return sub_10006C50C(&qword_1000C8100, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8530);
}

uint64_t sub_1000664D0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8100, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8530, a1);
}

uint64_t sub_100066508()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8548);
  sub_100063608(v0, (uint64_t)qword_1000C8548);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000665B0()
{
  return sub_10006C50C(&qword_1000C8108, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8548);
}

uint64_t sub_1000665E8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8108, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8548, a1);
}

uint64_t sub_100066620()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8560);
  sub_100063608(v0, (uint64_t)qword_1000C8560);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000666C8()
{
  return sub_10006C50C(&qword_1000C8110, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8560);
}

uint64_t sub_100066700@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8110, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8560, a1);
}

uint64_t sub_100066738()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8578);
  sub_100063608(v0, (uint64_t)qword_1000C8578);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000667E0()
{
  return sub_10006C50C(&qword_1000C8118, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8578);
}

uint64_t sub_100066818@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8118, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8578, a1);
}

uint64_t sub_100066850()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8590);
  sub_100063608(v0, (uint64_t)qword_1000C8590);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000668F8()
{
  return sub_10006C50C(&qword_1000C8120, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8590);
}

uint64_t sub_100066930@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8120, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8590, a1);
}

uint64_t sub_100066968()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C85A8);
  sub_100063608(v0, (uint64_t)qword_1000C85A8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100066A10()
{
  return sub_10006C50C(&qword_1000C8128, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C85A8);
}

uint64_t sub_100066A48@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8128, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C85A8, a1);
}

uint64_t sub_100066A80()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C85C0);
  sub_100063608(v0, (uint64_t)qword_1000C85C0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100066B28()
{
  return sub_10006C50C(&qword_1000C8130, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C85C0);
}

uint64_t sub_100066B60@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8130, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C85C0, a1);
}

uint64_t sub_100066B98()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C85D8);
  sub_100063608(v0, (uint64_t)qword_1000C85D8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100066C40()
{
  return sub_10006C50C(&qword_1000C8138, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C85D8);
}

uint64_t sub_100066C78@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8138, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C85D8, a1);
}

uint64_t sub_100066CB0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C85F0);
  sub_100063608(v0, (uint64_t)qword_1000C85F0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100066D58()
{
  return sub_10006C50C(&qword_1000C8140, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C85F0);
}

uint64_t sub_100066D90@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8140, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C85F0, a1);
}

uint64_t sub_100066DC8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8608);
  sub_100063608(v0, (uint64_t)qword_1000C8608);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100066E70()
{
  return sub_10006C50C(&qword_1000C8148, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8608);
}

uint64_t sub_100066EA8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8148, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8608, a1);
}

uint64_t sub_100066EE0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8620);
  sub_100063608(v0, (uint64_t)qword_1000C8620);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100066F88()
{
  return sub_10006C50C(&qword_1000C8150, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8620);
}

uint64_t sub_100066FC0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8150, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8620, a1);
}

uint64_t sub_100066FF8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8638);
  sub_100063608(v0, (uint64_t)qword_1000C8638);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000670A0()
{
  return sub_10006C50C(&qword_1000C8158, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8638);
}

uint64_t sub_1000670D8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8158, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8638, a1);
}

uint64_t sub_100067110()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8650);
  sub_100063608(v0, (uint64_t)qword_1000C8650);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000671B8()
{
  return sub_10006C50C(&qword_1000C8160, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8650);
}

uint64_t sub_1000671F0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8160, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8650, a1);
}

uint64_t sub_100067228()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8668);
  sub_100063608(v0, (uint64_t)qword_1000C8668);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000672D0()
{
  return sub_10006C50C(&qword_1000C8168, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8668);
}

uint64_t sub_100067308@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8168, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8668, a1);
}

uint64_t sub_100067340()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8680);
  sub_100063608(v0, (uint64_t)qword_1000C8680);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000673E8()
{
  return sub_10006C50C(&qword_1000C8170, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8680);
}

uint64_t sub_100067420@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8170, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8680, a1);
}

uint64_t sub_100067458()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8698);
  sub_100063608(v0, (uint64_t)qword_1000C8698);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100067500()
{
  return sub_10006C50C(&qword_1000C8178, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8698);
}

uint64_t sub_100067538@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8178, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8698, a1);
}

uint64_t sub_100067570()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C86B0);
  sub_100063608(v0, (uint64_t)qword_1000C86B0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100067618()
{
  return sub_10006C50C(&qword_1000C8180, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C86B0);
}

uint64_t sub_100067650@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8180, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C86B0, a1);
}

uint64_t sub_100067688()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C86C8);
  sub_100063608(v0, (uint64_t)qword_1000C86C8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100067730()
{
  return sub_10006C50C(&qword_1000C8188, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C86C8);
}

uint64_t sub_100067768@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8188, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C86C8, a1);
}

uint64_t sub_1000677A0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C86E0);
  sub_100063608(v0, (uint64_t)qword_1000C86E0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100067848()
{
  return sub_10006C50C(&qword_1000C8190, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C86E0);
}

uint64_t sub_100067880@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8190, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C86E0, a1);
}

uint64_t sub_1000678B8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C86F8);
  sub_100063608(v0, (uint64_t)qword_1000C86F8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100067960()
{
  return sub_10006C50C(&qword_1000C8198, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C86F8);
}

uint64_t sub_100067998@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8198, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C86F8, a1);
}

uint64_t sub_1000679D0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8710);
  sub_100063608(v0, (uint64_t)qword_1000C8710);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100067A78()
{
  return sub_10006C50C(&qword_1000C81A0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8710);
}

uint64_t sub_100067AB0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C81A0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8710, a1);
}

uint64_t sub_100067AE8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8728);
  sub_100063608(v0, (uint64_t)qword_1000C8728);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100067B90()
{
  return sub_10006C50C(&qword_1000C81A8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8728);
}

uint64_t sub_100067BC8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C81A8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8728, a1);
}

uint64_t sub_100067C00()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8740);
  sub_100063608(v0, (uint64_t)qword_1000C8740);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100067CA8()
{
  return sub_10006C50C(&qword_1000C81B0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8740);
}

uint64_t sub_100067CE0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C81B0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8740, a1);
}

uint64_t sub_100067D18()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8758);
  sub_100063608(v0, (uint64_t)qword_1000C8758);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100067DC0()
{
  return sub_10006C50C(&qword_1000C81B8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8758);
}

uint64_t sub_100067DF8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C81B8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8758, a1);
}

uint64_t sub_100067E30()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8770);
  sub_100063608(v0, (uint64_t)qword_1000C8770);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100067ED8()
{
  return sub_10006C50C(&qword_1000C81C0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8770);
}

uint64_t sub_100067F10@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C81C0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8770, a1);
}

uint64_t sub_100067F48()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8788);
  sub_100063608(v0, (uint64_t)qword_1000C8788);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100067FF0()
{
  return sub_10006C50C(&qword_1000C81C8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8788);
}

uint64_t sub_100068028@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C81C8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8788, a1);
}

uint64_t sub_100068060()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C87A0);
  sub_100063608(v0, (uint64_t)qword_1000C87A0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100068108()
{
  return sub_10006C50C(&qword_1000C81D0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C87A0);
}

uint64_t sub_100068140@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C81D0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C87A0, a1);
}

uint64_t sub_100068178()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C87B8);
  sub_100063608(v0, (uint64_t)qword_1000C87B8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100068220()
{
  return sub_10006C50C(&qword_1000C81D8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C87B8);
}

uint64_t sub_100068258@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C81D8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C87B8, a1);
}

uint64_t sub_100068290()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C87D0);
  sub_100063608(v0, (uint64_t)qword_1000C87D0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100068338()
{
  return sub_10006C50C(&qword_1000C81E0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C87D0);
}

uint64_t sub_100068370@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C81E0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C87D0, a1);
}

uint64_t sub_1000683A8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C87E8);
  sub_100063608(v0, (uint64_t)qword_1000C87E8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100068450()
{
  return sub_10006C50C(&qword_1000C81E8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C87E8);
}

uint64_t sub_100068488@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C81E8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C87E8, a1);
}

uint64_t sub_1000684C0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8800);
  sub_100063608(v0, (uint64_t)qword_1000C8800);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100068568()
{
  return sub_10006C50C(&qword_1000C81F0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8800);
}

uint64_t sub_1000685A0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C81F0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8800, a1);
}

uint64_t sub_1000685D8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8818);
  sub_100063608(v0, (uint64_t)qword_1000C8818);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100068680()
{
  return sub_10006C50C(&qword_1000C81F8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8818);
}

uint64_t sub_1000686B8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C81F8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8818, a1);
}

uint64_t sub_1000686F0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8830);
  sub_100063608(v0, (uint64_t)qword_1000C8830);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100068798()
{
  return sub_10006C50C(&qword_1000C8200, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8830);
}

uint64_t sub_1000687D0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8200, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8830, a1);
}

uint64_t sub_100068808()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8848);
  sub_100063608(v0, (uint64_t)qword_1000C8848);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000688B0()
{
  return sub_10006C50C(&qword_1000C8208, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8848);
}

uint64_t sub_1000688E8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8208, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8848, a1);
}

uint64_t sub_100068920()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8860);
  sub_100063608(v0, (uint64_t)qword_1000C8860);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000689C8()
{
  return sub_10006C50C(&qword_1000C8210, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8860);
}

uint64_t sub_100068A00@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8210, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8860, a1);
}

uint64_t sub_100068A38()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8878);
  sub_100063608(v0, (uint64_t)qword_1000C8878);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100068AE0()
{
  return sub_10006C50C(&qword_1000C8218, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8878);
}

uint64_t sub_100068B18@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8218, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8878, a1);
}

uint64_t sub_100068B50()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8890);
  sub_100063608(v0, (uint64_t)qword_1000C8890);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100068BF8()
{
  return sub_10006C50C(&qword_1000C8220, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8890);
}

uint64_t sub_100068C30@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8220, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8890, a1);
}

uint64_t sub_100068C68()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C88A8);
  sub_100063608(v0, (uint64_t)qword_1000C88A8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100068D10()
{
  return sub_10006C50C(&qword_1000C8228, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C88A8);
}

uint64_t sub_100068D48@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8228, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C88A8, a1);
}

uint64_t sub_100068D80()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C88C0);
  sub_100063608(v0, (uint64_t)qword_1000C88C0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100068E28()
{
  return sub_10006C50C(&qword_1000C8230, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C88C0);
}

uint64_t sub_100068E60@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8230, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C88C0, a1);
}

uint64_t sub_100068E98()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C88D8);
  sub_100063608(v0, (uint64_t)qword_1000C88D8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100068F40()
{
  return sub_10006C50C(&qword_1000C8238, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C88D8);
}

uint64_t sub_100068F78@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8238, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C88D8, a1);
}

uint64_t sub_100068FB0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C88F0);
  sub_100063608(v0, (uint64_t)qword_1000C88F0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100069058()
{
  return sub_10006C50C(&qword_1000C8240, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C88F0);
}

uint64_t sub_100069090@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8240, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C88F0, a1);
}

uint64_t sub_1000690C8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8908);
  sub_100063608(v0, (uint64_t)qword_1000C8908);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100069170()
{
  return sub_10006C50C(&qword_1000C8248, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8908);
}

uint64_t sub_1000691A8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8248, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8908, a1);
}

uint64_t sub_1000691E0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8920);
  sub_100063608(v0, (uint64_t)qword_1000C8920);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100069288()
{
  return sub_10006C50C(&qword_1000C8250, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8920);
}

uint64_t sub_1000692C0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8250, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8920, a1);
}

uint64_t sub_1000692F8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8938);
  sub_100063608(v0, (uint64_t)qword_1000C8938);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000693A0()
{
  return sub_10006C50C(&qword_1000C8258, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8938);
}

uint64_t sub_1000693D8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8258, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8938, a1);
}

uint64_t sub_100069410()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8950);
  sub_100063608(v0, (uint64_t)qword_1000C8950);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000694B8()
{
  return sub_10006C50C(&qword_1000C8260, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8950);
}

uint64_t sub_1000694F0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8260, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8950, a1);
}

uint64_t sub_100069528()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8968);
  sub_100063608(v0, (uint64_t)qword_1000C8968);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000695D0()
{
  return sub_10006C50C(&qword_1000C8268, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8968);
}

uint64_t sub_100069608@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8268, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8968, a1);
}

uint64_t sub_100069640()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8980);
  sub_100063608(v0, (uint64_t)qword_1000C8980);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000696E8()
{
  return sub_10006C50C(&qword_1000C8270, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8980);
}

uint64_t sub_100069720@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8270, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8980, a1);
}

uint64_t sub_100069758()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8998);
  sub_100063608(v0, (uint64_t)qword_1000C8998);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100069800()
{
  return sub_10006C50C(&qword_1000C8278, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8998);
}

uint64_t sub_100069838@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8278, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8998, a1);
}

uint64_t sub_100069870()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C89B0);
  sub_100063608(v0, (uint64_t)qword_1000C89B0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100069918()
{
  return sub_10006C50C(&qword_1000C8280, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C89B0);
}

uint64_t sub_100069950@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8280, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C89B0, a1);
}

uint64_t sub_100069988()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C89C8);
  sub_100063608(v0, (uint64_t)qword_1000C89C8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100069A30()
{
  return sub_10006C50C(&qword_1000C8288, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C89C8);
}

uint64_t sub_100069A68@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8288, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C89C8, a1);
}

uint64_t sub_100069AA0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C89E0);
  sub_100063608(v0, (uint64_t)qword_1000C89E0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100069B48()
{
  return sub_10006C50C(&qword_1000C8290, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C89E0);
}

uint64_t sub_100069B80@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8290, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C89E0, a1);
}

uint64_t sub_100069BB8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C89F8);
  sub_100063608(v0, (uint64_t)qword_1000C89F8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100069C60()
{
  return sub_10006C50C(&qword_1000C8298, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C89F8);
}

uint64_t sub_100069C98@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8298, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C89F8, a1);
}

uint64_t sub_100069CD0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8A10);
  sub_100063608(v0, (uint64_t)qword_1000C8A10);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100069D78()
{
  return sub_10006C50C(&qword_1000C82A0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8A10);
}

uint64_t sub_100069DB0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C82A0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8A10, a1);
}

uint64_t sub_100069DE8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8A28);
  sub_100063608(v0, (uint64_t)qword_1000C8A28);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100069E90()
{
  return sub_10006C50C(&qword_1000C82A8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8A28);
}

uint64_t sub_100069EC8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C82A8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8A28, a1);
}

uint64_t sub_100069F00()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8A40);
  sub_100063608(v0, (uint64_t)qword_1000C8A40);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100069FA8()
{
  return sub_10006C50C(&qword_1000C82B0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8A40);
}

uint64_t sub_100069FE0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C82B0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8A40, a1);
}

uint64_t sub_10006A018()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8A58);
  sub_100063608(v0, (uint64_t)qword_1000C8A58);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006A0C0()
{
  return sub_10006C50C(&qword_1000C82B8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8A58);
}

uint64_t sub_10006A0F8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C82B8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8A58, a1);
}

uint64_t sub_10006A130()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8A70);
  sub_100063608(v0, (uint64_t)qword_1000C8A70);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006A1D8()
{
  return sub_10006C50C(&qword_1000C82C0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8A70);
}

uint64_t sub_10006A210@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C82C0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8A70, a1);
}

uint64_t sub_10006A248()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8A88);
  sub_100063608(v0, (uint64_t)qword_1000C8A88);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006A2F0()
{
  return sub_10006C50C(&qword_1000C82C8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8A88);
}

uint64_t sub_10006A328@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C82C8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8A88, a1);
}

uint64_t sub_10006A360()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8AA0);
  sub_100063608(v0, (uint64_t)qword_1000C8AA0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006A408()
{
  return sub_10006C50C(&qword_1000C82D0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8AA0);
}

uint64_t sub_10006A440@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C82D0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8AA0, a1);
}

uint64_t sub_10006A478()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8AB8);
  sub_100063608(v0, (uint64_t)qword_1000C8AB8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006A520()
{
  return sub_10006C50C(&qword_1000C82D8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8AB8);
}

uint64_t sub_10006A558@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C82D8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8AB8, a1);
}

uint64_t sub_10006A590()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8AD0);
  sub_100063608(v0, (uint64_t)qword_1000C8AD0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006A638()
{
  return sub_10006C50C(&qword_1000C82E0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8AD0);
}

uint64_t sub_10006A670@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C82E0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8AD0, a1);
}

uint64_t sub_10006A6A8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8AE8);
  sub_100063608(v0, (uint64_t)qword_1000C8AE8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006A750()
{
  return sub_10006C50C(&qword_1000C82E8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8AE8);
}

uint64_t sub_10006A788@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C82E8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8AE8, a1);
}

uint64_t sub_10006A7C0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8B00);
  sub_100063608(v0, (uint64_t)qword_1000C8B00);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006A868()
{
  return sub_10006C50C(&qword_1000C82F0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B00);
}

uint64_t sub_10006A8A0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C82F0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B00, a1);
}

uint64_t sub_10006A8D8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8B18);
  sub_100063608(v0, (uint64_t)qword_1000C8B18);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006A980()
{
  return sub_10006C50C(&qword_1000C82F8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B18);
}

uint64_t sub_10006A9B8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C82F8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B18, a1);
}

uint64_t sub_10006A9F0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8B30);
  sub_100063608(v0, (uint64_t)qword_1000C8B30);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006AA98()
{
  return sub_10006C50C(&qword_1000C8300, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B30);
}

uint64_t sub_10006AAD0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8300, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B30, a1);
}

uint64_t sub_10006AB08()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8B48);
  sub_100063608(v0, (uint64_t)qword_1000C8B48);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006ABB0()
{
  return sub_10006C50C(&qword_1000C8308, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B48);
}

uint64_t sub_10006ABE8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8308, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B48, a1);
}

uint64_t sub_10006AC20()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8B60);
  sub_100063608(v0, (uint64_t)qword_1000C8B60);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006ACC8()
{
  return sub_10006C50C(&qword_1000C8310, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B60);
}

uint64_t sub_10006AD00@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8310, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B60, a1);
}

uint64_t sub_10006AD38()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8B78);
  sub_100063608(v0, (uint64_t)qword_1000C8B78);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006ADE0()
{
  return sub_10006C50C(&qword_1000C8318, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B78);
}

uint64_t sub_10006AE18@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8318, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B78, a1);
}

uint64_t sub_10006AE50()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8B90);
  sub_100063608(v0, (uint64_t)qword_1000C8B90);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006AEF8()
{
  return sub_10006C50C(&qword_1000C8320, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B90);
}

uint64_t sub_10006AF30@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8320, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8B90, a1);
}

uint64_t sub_10006AF68()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8BA8);
  sub_100063608(v0, (uint64_t)qword_1000C8BA8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006B010()
{
  return sub_10006C50C(&qword_1000C8328, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8BA8);
}

uint64_t sub_10006B048@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8328, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8BA8, a1);
}

uint64_t sub_10006B080()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8BC0);
  sub_100063608(v0, (uint64_t)qword_1000C8BC0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006B128()
{
  return sub_10006C50C(&qword_1000C8330, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8BC0);
}

uint64_t sub_10006B160@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8330, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8BC0, a1);
}

uint64_t sub_10006B198()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8BD8);
  sub_100063608(v0, (uint64_t)qword_1000C8BD8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006B240()
{
  return sub_10006C50C(&qword_1000C8338, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8BD8);
}

uint64_t sub_10006B278@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8338, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8BD8, a1);
}

uint64_t sub_10006B2B0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8BF0);
  sub_100063608(v0, (uint64_t)qword_1000C8BF0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006B358()
{
  return sub_10006C50C(&qword_1000C8340, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8BF0);
}

uint64_t sub_10006B390@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8340, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8BF0, a1);
}

uint64_t sub_10006B3C8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8C08);
  sub_100063608(v0, (uint64_t)qword_1000C8C08);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006B470()
{
  return sub_10006C50C(&qword_1000C8348, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C08);
}

uint64_t sub_10006B4A8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8348, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C08, a1);
}

uint64_t sub_10006B4E0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8C20);
  sub_100063608(v0, (uint64_t)qword_1000C8C20);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006B588()
{
  return sub_10006C50C(&qword_1000C8350, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C20);
}

uint64_t sub_10006B5C0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8350, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C20, a1);
}

uint64_t sub_10006B5F8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8C38);
  sub_100063608(v0, (uint64_t)qword_1000C8C38);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006B6A0()
{
  return sub_10006C50C(&qword_1000C8358, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C38);
}

uint64_t sub_10006B6D8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8358, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C38, a1);
}

uint64_t sub_10006B710()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8C50);
  sub_100063608(v0, (uint64_t)qword_1000C8C50);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006B7B8()
{
  return sub_10006C50C(&qword_1000C8360, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C50);
}

uint64_t sub_10006B7F0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8360, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C50, a1);
}

uint64_t sub_10006B828()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8C68);
  sub_100063608(v0, (uint64_t)qword_1000C8C68);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006B8D0()
{
  return sub_10006C50C(&qword_1000C8368, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C68);
}

uint64_t sub_10006B908@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8368, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C68, a1);
}

uint64_t sub_10006B940()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8C80);
  sub_100063608(v0, (uint64_t)qword_1000C8C80);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006B9E8()
{
  return sub_10006C50C(&qword_1000C8370, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C80);
}

uint64_t sub_10006BA20@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8370, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C80, a1);
}

uint64_t sub_10006BA58()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8C98);
  sub_100063608(v0, (uint64_t)qword_1000C8C98);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006BB00()
{
  return sub_10006C50C(&qword_1000C8378, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C98);
}

uint64_t sub_10006BB38@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8378, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8C98, a1);
}

uint64_t sub_10006BB70()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8CB0);
  sub_100063608(v0, (uint64_t)qword_1000C8CB0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006BC18()
{
  return sub_10006C50C(&qword_1000C8380, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8CB0);
}

uint64_t sub_10006BC50@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8380, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8CB0, a1);
}

uint64_t sub_10006BC88()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8CC8);
  sub_100063608(v0, (uint64_t)qword_1000C8CC8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006BD30()
{
  return sub_10006C50C(&qword_1000C8388, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8CC8);
}

uint64_t sub_10006BD68@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8388, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8CC8, a1);
}

uint64_t sub_10006BDA0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8CE0);
  sub_100063608(v0, (uint64_t)qword_1000C8CE0);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006BE48()
{
  return sub_10006C50C(&qword_1000C8390, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8CE0);
}

uint64_t sub_10006BE80@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8390, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8CE0, a1);
}

uint64_t sub_10006BEB8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8CF8);
  sub_100063608(v0, (uint64_t)qword_1000C8CF8);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006BF60()
{
  return sub_10006C50C(&qword_1000C8398, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8CF8);
}

uint64_t sub_10006BF98@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C8398, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8CF8, a1);
}

uint64_t sub_10006BFD0()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8D10);
  sub_100063608(v0, (uint64_t)qword_1000C8D10);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006C078()
{
  return sub_10006C50C(&qword_1000C83A0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8D10);
}

uint64_t sub_10006C0B0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C83A0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8D10, a1);
}

uint64_t sub_10006C0E8()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8D28);
  sub_100063608(v0, (uint64_t)qword_1000C8D28);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006C190()
{
  return sub_10006C50C(&qword_1000C83A8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8D28);
}

uint64_t sub_10006C1C8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C83A8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8D28, a1);
}

uint64_t sub_10006C200()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8D40);
  sub_100063608(v0, (uint64_t)qword_1000C8D40);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006C2A8()
{
  return sub_10006C50C(&qword_1000C83B0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8D40);
}

uint64_t sub_10006C2E0@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C83B0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8D40, a1);
}

uint64_t sub_10006C318()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8D58);
  sub_100063608(v0, (uint64_t)qword_1000C8D58);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006C3C0()
{
  return sub_10006C50C(&qword_1000C83B8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8D58);
}

uint64_t sub_10006C3F8@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C83B8, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8D58, a1);
}

uint64_t sub_10006C430()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_1000640A4(v0, qword_1000C8D70);
  sub_100063608(v0, (uint64_t)qword_1000C8D70);
  if (qword_1000C8080 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000C8088;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10006C4D4()
{
  return sub_10006C50C(&qword_1000C83C0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8D70);
}

uint64_t sub_10006C50C(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = a2(0);

  return sub_100063608(v5, a3);
}

uint64_t sub_10006C568@<X0>(uint64_t a1@<X8>)
{
  return sub_10006C5A0(&qword_1000C83C0, (uint64_t (*)(void))&type metadata accessor for ImageResource, (uint64_t)qword_1000C8D70, a1);
}

uint64_t sub_10006C5A0@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100063608(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_10006C664(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@ missing alarm identifier", (uint8_t *)&v2, 0xCu);
}

void sub_10006C6DC(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timer state unknown", v1, 2u);
}

void sub_10006C720(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@ Current timer not found!", (uint8_t *)&v3, 0xCu);
}

void sub_10006C79C(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) timerID];
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@ started timer: %{public}@", (uint8_t *)&v5, 0x16u);
}

void sub_10006C84C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) timerID];
  int v7 = 138543874;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@ starting timer: %{public}@ completed with error: %{public}@", (uint8_t *)&v7, 0x20u);
}

void sub_10006C908()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"HKFeatureIdentifier getHKFeatureIdentifierSleepCoaching(void)"];
  [v0 handleFailureInFunction:v1 file:@"MTASleepCoordinator.m" lineNumber:41 description:@"%s" dlerror()];

  __break(1u);
}

void sub_10006C980()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"Class getHKHealthStoreClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"MTASleepCoordinator.m" lineNumber:40 description:@"Unable to find class %s" arguments:@"HKHealthStore"];

  __break(1u);
}

void sub_10006C9FC(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *HealthKitLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"MTASleepCoordinator.m" lineNumber:37 description:@"%s" *a1];

  __break(1u);
}

void sub_10006CA7C(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *SleepHealthUILibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"MTASleepCoordinator.m" lineNumber:36 description:@"%s" *a1];

  __break(1u);
}

void sub_10006CAFC()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"Class getHKSHQuickScheduleManagementViewControllerClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"MTASleepCoordinator.m" lineNumber:39 description:@"Unable to find class %s" @"HKSHQuickScheduleManagementViewController"];

  __break(1u);
}

void sub_10006CB78(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_10001FCB0((void *)&_mh_execute_header, a2, a3, "%{public}@ didFailToContinueUserActivityWithType, error: %{public}@ ", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10006CBF0()
{
  sub_10001FCD0();
  sub_10001FCB0((void *)&_mh_execute_header, v0, v1, "%{public}@: Could not query city name: %{public}@ from app support");
}

void sub_10006CC60(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to reload alarm widget timeline, error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_10006CCEC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_10001FCB0((void *)&_mh_execute_header, a2, a3, "%{public}@ error decoding latest event: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10006CD64(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_10001FCB0((void *)&_mh_execute_header, a2, a3, "%{public}@ error encoding: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10006CDE0()
{
  sub_10003A230();
  sub_10001FCB0((void *)&_mh_execute_header, v0, v1, "%{public}@ migration encountered error: %{public}@");
}

void sub_10006CE4C()
{
  sub_10003A230();
  sub_10001FCB0((void *)&_mh_execute_header, v0, v1, "%{public}@ error fetching stopwatches: %{public}@");
}

void sub_10006CEB8()
{
  sub_100048480();
  [v1 row];
  sub_100048428();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Unable to get recent timer duration at index: %{public}ld. Current total is %{public}ld", v2, 0x16u);
}

void sub_10006CF40()
{
  sub_100048480();
  [v0 row];
  sub_100048428();
  sub_100048440((void *)&_mh_execute_header, v1, v2, "Index: %{public}ld exceeds number of recent timer durations: %{public}ld", v3, v4, v5, v6, v7);
}

void sub_10006CFB8(void *a1)
{
  [a1 row];
  sub_100048460((void *)&_mh_execute_header, v1, v2, "No active timer at row %{public}ld", v3, v4, v5, v6, 0);
}

void sub_10006D034()
{
  sub_100048480();
  [v0 row];
  sub_100048428();
  sub_100048440((void *)&_mh_execute_header, v1, v2, "Index: %{public}ld exceeds number of active of timers: %{public}ld", v3, v4, v5, v6, v7);
}

void sub_10006D0AC(void *a1)
{
  [a1 row];
  sub_100048460((void *)&_mh_execute_header, v1, v2, "No recent timer duration at row %{public}ld", v3, v4, v5, v6, 0);
}

void sub_10006D128(uint64_t a1)
{
  uint8_t v7 = [*(id *)(a1 + 40) timerID];
  sub_100048440((void *)&_mh_execute_header, v1, v2, "%{public}@ started timer: %{public}@", v3, v4, v5, v6, 2u);
}

void sub_10006D1C8()
{
  sub_100048480();
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = [*(id *)(v2 + 40) timerID];
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@ starting timer: %{public}@ completed with error: %{public}@", (uint8_t *)&v5, 0x20u);
}

void sub_10006D280()
{
  sub_100059CF4();
  sub_100059CD8((void *)&_mh_execute_header, v0, v1, "Invalid MTATimerListSection: %ld", v2, v3, v4, v5, v6);
}

void sub_10006D2E8(void *a1)
{
  uint64_t v1 = [a1 dataSource];
  [v1 numberOfActiveTimers];
  sub_100059CF4();
  sub_100059CC8();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0xCu);
}

void sub_10006D378(uint64_t a1)
{
  uint8_t v6 = [*(id *)(a1 + 40) timerID];
  sub_100059CC8();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x20u);
}

void sub_10006D42C()
{
  sub_100059CF4();
  sub_100059CD8((void *)&_mh_execute_header, v0, v1, "%{public}@ unable to fetch active timer, aborting", v2, v3, v4, v5, v6);
}

void sub_10006D494(uint64_t a1, void *a2)
{
  [a2 state];
  sub_100059CC8();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

void sub_10006D52C(uint64_t a1, NSObject *a2, double a3)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@ Passing in invalid duration to picker: %f", (uint8_t *)&v3, 0x16u);
}

uint64_t AttributeScopes.SwiftUIAttributes.foregroundColor.getter()
{
  return AttributeScopes.SwiftUIAttributes.foregroundColor.getter();
}

uint64_t AttributedString.init(stringLiteral:)()
{
  return AttributedString.init(stringLiteral:)();
}

uint64_t type metadata accessor for AttributedString()
{
  return type metadata accessor for AttributedString();
}

uint64_t AttributedString.subscript.modify()
{
  return AttributedString.subscript.modify();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t AttributedSubstring.subscript.setter()
{
  return AttributedSubstring.subscript.setter();
}

uint64_t static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
}

uint64_t static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)()
{
  return static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
}

uint64_t static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)()
{
  return static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)();
}

uint64_t type metadata accessor for PredicateExpressions.ComparisonOperator()
{
  return type metadata accessor for PredicateExpressions.ComparisonOperator();
}

uint64_t static PredicateExpressions.build_Arg<A>(_:)()
{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t AttributedStringProtocol.range<A>(of:options:locale:)()
{
  return AttributedStringProtocol.range<A>(of:options:locale:)();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t SiriKitIntentTip.siriDidExecuteIntent.getter()
{
  return SiriKitIntentTip.siriDidExecuteIntent.getter();
}

uint64_t SiriKitIntentTip.notifySiriTipOnDisplay.getter()
{
  return SiriKitIntentTip.notifySiriTipOnDisplay.getter();
}

uint64_t ColorResource.init(name:bundle:)()
{
  return ColorResource.init(name:bundle:)();
}

uint64_t type metadata accessor for ColorResource()
{
  return type metadata accessor for ColorResource();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t type metadata accessor for ImageResource()
{
  return type metadata accessor for ImageResource();
}

uint64_t CreateTimerIntent.duration.setter()
{
  return CreateTimerIntent.duration.setter();
}

uint64_t type metadata accessor for CreateTimerIntent()
{
  return type metadata accessor for CreateTimerIntent();
}

uint64_t type metadata accessor for SearchTimerIntent()
{
  return type metadata accessor for SearchTimerIntent();
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

uint64_t Tip.statusUpdates.getter()
{
  return Tip.statusUpdates.getter();
}

uint64_t Tip.id.getter()
{
  return Tip.id.getter();
}

uint64_t Tip.image.getter()
{
  return Tip.image.getter();
}

uint64_t Tip.rules.getter()
{
  return Tip.rules.getter();
}

uint64_t Tip.title.getter()
{
  return Tip.title.getter();
}

uint64_t Tip.actions.getter()
{
  return Tip.actions.getter();
}

uint64_t Tip.message.getter()
{
  return Tip.message.getter();
}

uint64_t Tip.options.getter()
{
  return Tip.options.getter();
}

uint64_t type metadata accessor for TipUIView()
{
  return type metadata accessor for TipUIView();
}

uint64_t TipUIView.init(_:arrowEdge:actionHandler:)()
{
  return TipUIView.init(_:arrowEdge:actionHandler:)();
}

uint64_t static Tips.RuleBuilder.buildExpression(_:)()
{
  return static Tips.RuleBuilder.buildExpression(_:)();
}

uint64_t static Tips.RuleBuilder.buildPartialBlock(first:)()
{
  return static Tips.RuleBuilder.buildPartialBlock(first:)();
}

uint64_t type metadata accessor for Tips.EmptyDonation()
{
  return type metadata accessor for Tips.EmptyDonation();
}

uint64_t static Tips.OptionsBuilder.buildExpression<A>(_:)()
{
  return static Tips.OptionsBuilder.buildExpression<A>(_:)();
}

uint64_t static Tips.OptionsBuilder.buildFinalResult<A>(_:)()
{
  return static Tips.OptionsBuilder.buildFinalResult<A>(_:)();
}

uint64_t static Tips.OptionsBuilder.buildPartialBlock<A>(first:)()
{
  return static Tips.OptionsBuilder.buildPartialBlock<A>(first:)();
}

uint64_t type metadata accessor for Tips.MaxDisplayCount()
{
  return type metadata accessor for Tips.MaxDisplayCount();
}

uint64_t Tips.MaxDisplayCount.init(_:)()
{
  return Tips.MaxDisplayCount.init(_:)();
}

uint64_t static Tips.ConfigurationOption.AnalyticsEngine.coreAnalytics.getter()
{
  return static Tips.ConfigurationOption.AnalyticsEngine.coreAnalytics.getter();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.AnalyticsEngine()
{
  return type metadata accessor for Tips.ConfigurationOption.AnalyticsEngine();
}

uint64_t static Tips.ConfigurationOption.analyticsEngine(_:)()
{
  return static Tips.ConfigurationOption.analyticsEngine(_:)();
}

uint64_t static Tips.ConfigurationOption.DatastoreLocation.tipsGroupContainer.getter()
{
  return static Tips.ConfigurationOption.DatastoreLocation.tipsGroupContainer.getter();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.DatastoreLocation()
{
  return type metadata accessor for Tips.ConfigurationOption.DatastoreLocation();
}

uint64_t static Tips.ConfigurationOption.datastoreLocation(_:)()
{
  return static Tips.ConfigurationOption.datastoreLocation(_:)();
}

uint64_t type metadata accessor for Tips.ConfigurationOption()
{
  return type metadata accessor for Tips.ConfigurationOption();
}

uint64_t type metadata accessor for Tips.Rule()
{
  return type metadata accessor for Tips.Rule();
}

uint64_t Tips.Rule.init<A>(_:_:)()
{
  return Tips.Rule.init<A>(_:_:)();
}

uint64_t Tips.Event.init<>(id:)()
{
  return Tips.Event.init<>(id:)();
}

uint64_t Tips.Event.donations.getter()
{
  return Tips.Event.donations.getter();
}

uint64_t type metadata accessor for Tips.Event()
{
  return type metadata accessor for Tips.Event();
}

uint64_t type metadata accessor for Tips.Status()
{
  return type metadata accessor for Tips.Status();
}

uint64_t static Tips.configure(_:)()
{
  return static Tips.configure(_:)();
}

uint64_t Text.init(_:)()
{
  return Text.init(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return _CGPathCreateWithRoundedRect(rect, cornerWidth, cornerHeight, transform);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

uint64_t CTFontCreateCopyOfSystemUIFontWithGrade()
{
  return _CTFontCreateCopyOfSystemUIFontWithGrade();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return _CTFontCreateUIFontForLanguage(uiType, size, language);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return _CTFontCreateWithFontDescriptor(descriptor, size, matrix);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithFeature(CTFontDescriptorRef original, CFNumberRef featureTypeIdentifier, CFNumberRef featureSelectorIdentifier)
{
  return _CTFontDescriptorCreateCopyWithFeature(original, featureTypeIdentifier, featureSelectorIdentifier);
}

uint64_t CTFontDescriptorCreateForUIType()
{
  return _CTFontDescriptorCreateForUIType();
}

uint64_t DateMaskToString()
{
  return _DateMaskToString();
}

uint64_t DetailDateMaskToString()
{
  return _DetailDateMaskToString();
}

uint64_t FormatTime()
{
  return _FormatTime();
}

uint64_t MTCurrentDateProvider()
{
  return _MTCurrentDateProvider();
}

uint64_t MTIdiomIpad()
{
  return _MTIdiomIpad();
}

uint64_t MTLogForCategory()
{
  return _MTLogForCategory();
}

uint64_t MTShouldAllowToneStore()
{
  return _MTShouldAllowToneStore();
}

uint64_t MTShouldHandleForBedtime()
{
  return _MTShouldHandleForBedtime();
}

uint64_t MTShouldHandleForEucalyptus()
{
  return _MTShouldHandleForEucalyptus();
}

uint64_t MTUIIsLargeText()
{
  return _MTUIIsLargeText();
}

uint64_t MTUIIsPadIdiom()
{
  return _MTUIIsPadIdiom();
}

uint64_t MTUIIsPhoneIdiom()
{
  return _MTUIIsPhoneIdiom();
}

uint64_t MTUIIsVeryWidePhoneSize()
{
  return _MTUIIsVeryWidePhoneSize();
}

uint64_t MTUILocationCoordinate2DMake()
{
  return _MTUILocationCoordinate2DMake();
}

uint64_t MTUIMainScreenScale()
{
  return _MTUIMainScreenScale();
}

uint64_t MTUIRoundToPixel()
{
  return _MTUIRoundToPixel();
}

uint64_t MTUIShouldUseLargePadLayout()
{
  return _MTUIShouldUseLargePadLayout();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t ResetTimeFormatter()
{
  return _ResetTimeFormatter();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UICeilToViewScale()
{
  return _UICeilToViewScale();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

uint64_t UIFloorToViewScale()
{
  return _UIFloorToViewScale();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t UIRectCenteredIntegralRect()
{
  return _UIRectCenteredIntegralRect();
}

uint64_t UIRectCenteredYInRect()
{
  return _UIRectCenteredYInRect();
}

uint64_t UIRoundToViewScale()
{
  return _UIRoundToViewScale();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

long double atan(long double __x)
{
  return _atan(__x);
}

long double cos(long double __x)
{
  return _cos(__x);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

long double modf(long double __x, long double *__y)
{
  return _modf(__x, __y);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

long double sin(long double __x)
{
  return _sin(__x);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

long double tan(long double __x)
{
  return _tan(__x);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return _[a1 CGPath];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return _[a1 URLContexts];
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return [a1 URLForResource:withExtension:];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__accessibilitySetInterfaceStyleIntent_(void *a1, const char *a2, ...)
{
  return [a1 _accessibilitySetInterfaceStyleIntent:];
}

id objc_msgSend__addAlarm_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAlarm:withCompletionBlock:");
}

id objc_msgSend__addAutolayoutConstraintsForNoResultsFoundLabel(void *a1, const char *a2, ...)
{
  return _[a1 _addAutolayoutConstraintsForNoResultsFoundLabel];
}

id objc_msgSend__addLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addLayoutGuide:");
}

id objc_msgSend__calculateVerticalMultiplierForKeyboard(void *a1, const char *a2, ...)
{
  return _[a1 _calculateVerticalMultiplierForKeyboard];
}

id objc_msgSend__changeButtonWidth(void *a1, const char *a2, ...)
{
  return _[a1 _changeButtonWidth];
}

id objc_msgSend__clearButton(void *a1, const char *a2, ...)
{
  return _[a1 _clearButton];
}

id objc_msgSend__clockLabelTextFont(void *a1, const char *a2, ...)
{
  return _[a1 _clockLabelTextFont];
}

id objc_msgSend__commonInitialization(void *a1, const char *a2, ...)
{
  return _[a1 _commonInitialization];
}

id objc_msgSend__configureAndAddButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAndAddButton:");
}

id objc_msgSend__dateUnderSelectionBar(void *a1, const char *a2, ...)
{
  return _[a1 _dateUnderSelectionBar];
}

id objc_msgSend__defaultTraitCollection(void *a1, const char *a2, ...)
{
  return _[a1 _defaultTraitCollection];
}

id objc_msgSend__enumerateItemsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateItemsUsingBlock:");
}

id objc_msgSend__fadeLabelForComponent_toText_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fadeLabelForComponent:toText:animated:");
}

id objc_msgSend__firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _[a1 _firstBaselineOffsetFromTop];
}

id objc_msgSend__flatImageWithColor_(void *a1, const char *a2, ...)
{
  return [a1 _flatImageWithColor:];
}

id objc_msgSend__handleAddSpecifierForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAddSpecifierForSection:");
}

id objc_msgSend__handleDefaultSpecifierForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDefaultSpecifierForSection:");
}

id objc_msgSend__handleEditSpecifierForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleEditSpecifierForSection:");
}

id objc_msgSend__handleNumberOfItemsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _handleNumberOfItemsDidChange];
}

id objc_msgSend__hoursStringForHour_(void *a1, const char *a2, ...)
{
  return [a1 _hoursStringForHour:];
}

id objc_msgSend__initWithAlertType_tableViewStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithAlertType:tableViewStyle:");
}

id objc_msgSend__interactiveInsetGroupedHeaderConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _interactiveInsetGroupedHeaderConfiguration];
}

id objc_msgSend__isAlarmsSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isAlarmsSection:");
}

id objc_msgSend__isWakeAlarmSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isWakeAlarmSection:");
}

id objc_msgSend__labelForComponent_createIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_labelForComponent:createIfNecessary:");
}

id objc_msgSend__lastLineBaseline(void *a1, const char *a2, ...)
{
  return _[a1 _lastLineBaseline];
}

id objc_msgSend__layoutNoItemsLabel(void *a1, const char *a2, ...)
{
  return _[a1 _layoutNoItemsLabel];
}

id objc_msgSend__legacy_sizeWithFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_legacy_sizeWithFont:");
}

id objc_msgSend__lightSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 _lightSystemFontOfSize:];
}

id objc_msgSend__makeNewComponentLabel(void *a1, const char *a2, ...)
{
  return _[a1 _makeNewComponentLabel];
}

id objc_msgSend__marginWidth(void *a1, const char *a2, ...)
{
  return _[a1 _marginWidth];
}

id objc_msgSend__minutesCircleCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_minutesCircleCenter:");
}

id objc_msgSend__minutesStringForMinutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_minutesStringForMinutes:");
}

id objc_msgSend__naui_beginDebuggingAutolayout(void *a1, const char *a2, ...)
{
  return [_naui_beginDebuggingAutolayout];
}

id objc_msgSend__numberOfItemsDidChangeAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_numberOfItemsDidChangeAnimated:");
}

id objc_msgSend__performScrollTest_iterations_delta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performScrollTest:iterations:delta:");
}

id objc_msgSend__performWithoutDeferringTransitions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performWithoutDeferringTransitions:");
}

id objc_msgSend__positionLabel_forComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_positionLabel:forComponent:");
}

id objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFontForTextStyle:maximumContentSizeCategory:");
}

id objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:");
}

id objc_msgSend__presentAddEditForTimer_isNewTimer_(void *a1, const char *a2, ...)
{
  return [a1 _presentAddEditForTimer:isNewTimer:];
}

id objc_msgSend__reloadData_(void *a1, const char *a2, ...)
{
  return [a1 _reloadData:];
}

id objc_msgSend__reloadDataIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _reloadDataIfNecessary];
}

id objc_msgSend__reloadNoResultsFoundLabelForKeyboardNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadNoResultsFoundLabelForKeyboardNotification:");
}

id objc_msgSend__reloadUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadUI:");
}

id objc_msgSend__removeAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAlarm:");
}

id objc_msgSend__removeAlarm_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAlarm:withCompletionBlock:");
}

id objc_msgSend__removeAutolayoutConstraintsForNoResultsFoundLabel(void *a1, const char *a2, ...)
{
  return _[a1 _removeAutolayoutConstraintsForNoResultsFoundLabel];
}

id objc_msgSend__removeTimer_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeTimer:withCompletionBlock:");
}

id objc_msgSend__restoreIdleTimer(void *a1, const char *a2, ...)
{
  return _[a1 _restoreIdleTimer];
}

id objc_msgSend__runResizeTest(void *a1, const char *a2, ...)
{
  return _[a1 _runResizeTest];
}

id objc_msgSend__runRotationTest(void *a1, const char *a2, ...)
{
  return _[a1 _runRotationTest];
}

id objc_msgSend__runScrollTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runScrollTest:");
}

id objc_msgSend__runSelectTest_(void *a1, const char *a2, ...)
{
  return [a1 _runSelectTest:];
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return [a1 _scaledValueForValue:];
}

id objc_msgSend__scrollToAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollToAlarm:");
}

id objc_msgSend__secondsStringForSeconds_(void *a1, const char *a2, ...)
{
  return [a1 _secondsStringForSeconds:];
}

id objc_msgSend__selectViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectViewController:");
}

id objc_msgSend__separatorFrame(void *a1, const char *a2, ...)
{
  return _[a1 _separatorFrame];
}

id objc_msgSend__setBackdropStyle_(void *a1, const char *a2, ...)
{
  return [a1 _setBackdropStyle:];
}

id objc_msgSend__setBottomPadding_(void *a1, const char *a2, ...)
{
  return [a1 _setBottomPadding:];
}

id objc_msgSend__setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 _setCornerRadius:];
}

id objc_msgSend__setDisplaysCellContentStringsOnTapAndHold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDisplaysCellContentStringsOnTapAndHold:");
}

id objc_msgSend__setFirstLineBaselineFrameOriginY_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFirstLineBaselineFrameOriginY:");
}

id objc_msgSend__setForcesClearButtonHighContrastAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setForcesClearButtonHighContrastAppearance:");
}

id objc_msgSend__setLabel_forComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLabel:forComponent:");
}

id objc_msgSend__setMarginWidth_(void *a1, const char *a2, ...)
{
  return [a1 _setMarginWidth:];
}

id objc_msgSend__setObservableScrollView_forEdges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setObservableScrollView:forEdges:");
}

id objc_msgSend__setOrderingDirectionMappings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOrderingDirectionMappings:");
}

id objc_msgSend__setOrderingProperties_(void *a1, const char *a2, ...)
{
  return [a1 _setOrderingProperties:];
}

id objc_msgSend__setSelected_(void *a1, const char *a2, ...)
{
  return [a1 _setSelected:];
}

id objc_msgSend__setSelectionBarIgnoresInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSelectionBarIgnoresInset:");
}

id objc_msgSend__setTopPadding_(void *a1, const char *a2, ...)
{
  return [_a1 _setTopPadding:];
}

id objc_msgSend__setTouchInsets_(void *a1, const char *a2, ...)
{
  return [a1 _setTouchInsets:];
}

id objc_msgSend__shouldStackViews(void *a1, const char *a2, ...)
{
  return _[a1 _shouldStackViews];
}

id objc_msgSend__shouldUseRegularLayout(void *a1, const char *a2, ...)
{
  return _[a1 _shouldUseRegularLayout];
}

id objc_msgSend__showNoResultsFound_(void *a1, const char *a2, ...)
{
  return [a1 _showNoResultsFound:];
}

id objc_msgSend__showSelectedIndicator_changeSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showSelectedIndicator:changeSelection:");
}

id objc_msgSend__spinMainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 _spinMainRunLoop];
}

id objc_msgSend__titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 _titleLabel];
}

id objc_msgSend__updateAlarm_reload_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAlarm:reload:withCompletionBlock:");
}

id objc_msgSend__updateAlarm_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAlarm:withCompletionBlock:");
}

id objc_msgSend__updateCurrentLapCell(void *a1, const char *a2, ...)
{
  return _[a1 _updateCurrentLapCell];
}

id objc_msgSend__updateLabels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLabels:");
}

id objc_msgSend__updateLapExtrema(void *a1, const char *a2, ...)
{
  return _[a1 _updateLapExtrema];
}

id objc_msgSend__viewAvailabelWidth(void *a1, const char *a2, ...)
{
  return _[a1 _viewAvailabelWidth];
}

id objc_msgSend__web_createDirectoryAtPathWithIntermediateDirectories_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:");
}

id objc_msgSend_accessibilitySizeLayoutConstraints(void *a1, const char *a2, ...)
{
  return _[a1 accessibilitySizeLayoutConstraints];
}

id objc_msgSend_accessoryType(void *a1, const char *a2, ...)
{
  return _[a1 accessoryType];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:style:handler:];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints:];
}

id objc_msgSend_activateNextKeyField(void *a1, const char *a2, ...)
{
  return _[a1 activateNextKeyField];
}

id objc_msgSend_activatePreviousKeyField(void *a1, const char *a2, ...)
{
  return _[a1 activatePreviousKeyField];
}

id objc_msgSend_activeTimerAtRow_(void *a1, const char *a2, ...)
{
  return [a1 activeTimerAtRow:];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _[a1 activityType];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return [a1 addAction:];
}

id objc_msgSend_addAlarm_(void *a1, const char *a2, ...)
{
  return [a1 addAlarm:];
}

id objc_msgSend_addArcWithCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return [a1 addArcWithCenter:radius:startAngle:endAngle:clockwise:];
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return [a1 addAttribute:value:range:];
}

id objc_msgSend_addButton(void *a1, const char *a2, ...)
{
  return _[a1 addButton];
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 addChildViewController:];
}

id objc_msgSend_addCity_(void *a1, const char *a2, ...)
{
  return [a1 addCity:];
}

id objc_msgSend_addCity_animated_(void *a1, const char *a2, ...)
{
  return [a1 addCity:animated:];
}

id objc_msgSend_addCityWithoutUserInteraction_(void *a1, const char *a2, ...)
{
  return [a1 addCityWithoutUserInteraction];
}

id objc_msgSend_addClockViewController_addCity_(void *a1, const char *a2, ...)
{
  return [a1 addClockViewController:addCity:];
}

id objc_msgSend_addCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 addCompletionBlock:];
}

id objc_msgSend_addConstraints_(void *a1, const char *a2, ...)
{
  return [a1 addConstraints:];
}

id objc_msgSend_addDefaultSongsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 addDefaultSongsIfNeeded];
}

id objc_msgSend_addEditAlarmController(void *a1, const char *a2, ...)
{
  return _[a1 addEditAlarmController];
}

id objc_msgSend_addEditTimerController(void *a1, const char *a2, ...)
{
  return _[a1 addEditTimerController];
}

id objc_msgSend_addFailureBlock_(void *a1, const char *a2, ...)
{
  return [a1 addFailureBlock:];
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 addGestureRecognizer:];
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return [a1 addIndex:];
}

id objc_msgSend_addLap_(void *a1, const char *a2, ...)
{
  return [a1 addLap:];
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return [a1 addLayoutGuide:];
}

id objc_msgSend_addLineToPoint_(void *a1, const char *a2, ...)
{
  return [a1 addLineToPoint:];
}

id objc_msgSend_addMediaItems_(void *a1, const char *a2, ...)
{
  return [a1 addMediaItems:];
}

id objc_msgSend_addNewTimerWithDuration_title_sound_(void *a1, const char *a2, ...)
{
  return [a1 addNewTimerWithDuration:title:sound:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addObserver_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forBundleIdentifier:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return [a1 addSublayer:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return [a1 addSuccessBlock:];
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forControlEvents:];
}

id objc_msgSend_addTimer_(void *a1, const char *a2, ...)
{
  return [a1 addTimer:];
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return [a1 addTimer:forMode:];
}

id objc_msgSend_addTimer_reload_(void *a1, const char *a2, ...)
{
  return [a1 addTimer:reload:];
}

id objc_msgSend_addViewController(void *a1, const char *a2, ...)
{
  return _[a1 addViewController];
}

id objc_msgSend_adjustClearButtonInset(void *a1, const char *a2, ...)
{
  return _[a1 adjustClearButtonInset];
}

id objc_msgSend_adjustedContentInset(void *a1, const char *a2, ...)
{
  return _[a1 adjustedContentInset];
}

id objc_msgSend_adjustsFontSizeToFitWidth(void *a1, const char *a2, ...)
{
  return _[a1 adjustsFontSizeToFitWidth];
}

id objc_msgSend_alCity(void *a1, const char *a2, ...)
{
  return _[a1 alCity];
}

id objc_msgSend_alCityId(void *a1, const char *a2, ...)
{
  return _[a1 alCityId];
}

id objc_msgSend_alarm(void *a1, const char *a2, ...)
{
  return _[a1 alarm];
}

id objc_msgSend_alarmAtRow_(void *a1, const char *a2, ...)
{
  return [a1 alarmAtRow:];
}

id objc_msgSend_alarmComponents(void *a1, const char *a2, ...)
{
  return _[a1 alarmComponents];
}

id objc_msgSend_alarmEditController_didAddAlarm_(void *a1, const char *a2, ...)
{
  return [a1 alarmEditController:didAddAlarm:];
}

id objc_msgSend_alarmEditController_didDeleteAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmEditController:didDeleteAlarm:");
}

id objc_msgSend_alarmEditController_didEditAlarm_(void *a1, const char *a2, ...)
{
  return [a1 alarmEditController:didEditAlarm:];
}

id objc_msgSend_alarmEditControllerDidCancel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmEditControllerDidCancel:");
}

id objc_msgSend_alarmEditSettingController_didEditAlarm_(void *a1, const char *a2, ...)
{
  return [a1 alarmEditSettingController:didEditAlarm:];
}

id objc_msgSend_alarmEditViewController(void *a1, const char *a2, ...)
{
  return _[a1 alarmEditViewController];
}

id objc_msgSend_alarmID(void *a1, const char *a2, ...)
{
  return _[a1 alarmID];
}

id objc_msgSend_alarmIDString(void *a1, const char *a2, ...)
{
  return _[a1 alarmIDString];
}

id objc_msgSend_alarmTableViewController(void *a1, const char *a2, ...)
{
  return _[a1 alarmTableViewController];
}

id objc_msgSend_alarmViewController(void *a1, const char *a2, ...)
{
  return _[a1 alarmViewController];
}

id objc_msgSend_alarmWithHour_minute_(void *a1, const char *a2, ...)
{
  return [a1 alarmWithHour:minute:];
}

id objc_msgSend_alarmsCollectionViewController(void *a1, const char *a2, ...)
{
  return _[a1 alarmsCollectionViewController];
}

id objc_msgSend_alert(void *a1, const char *a2, ...)
{
  return _[a1 alert];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 alertControllerWithTitle:message:preferredStyle:];
}

id objc_msgSend_alertType(void *a1, const char *a2, ...)
{
  return _[a1 alertType];
}

id objc_msgSend_alertWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 alertWithConfiguration:];
}

id objc_msgSend_allCities(void *a1, const char *a2, ...)
{
  return _[a1 allCities];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allowsSnooze(void *a1, const char *a2, ...)
{
  return _[a1 allowsSnooze];
}

id objc_msgSend_analogClock(void *a1, const char *a2, ...)
{
  return _[a1 analogClock];
}

id objc_msgSend_analogClockWithStyle_(void *a1, const char *a2, ...)
{
  return [a1 analogClockWithStyle:];
}

id objc_msgSend_analogStopwatch(void *a1, const char *a2, ...)
{
  return _[a1 analogStopwatch];
}

id objc_msgSend_analogStopwatchContainer(void *a1, const char *a2, ...)
{
  return _[a1 analogStopwatchContainer];
}

id objc_msgSend_anchorStyle(void *a1, const char *a2, ...)
{
  return _[a1 anchorStyle];
}

id objc_msgSend_angle(void *a1, const char *a2, ...)
{
  return _[a1 angle];
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateAlongsideTransition:completion:];
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:];
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animationDuration(void *a1, const char *a2, ...)
{
  return _[a1 animationDuration];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return _[a1 appearance];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 appendAttributedString:];
}

id objc_msgSend_applyBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 applyBackgroundColor:];
}

id objc_msgSend_applyStyle(void *a1, const char *a2, ...)
{
  return _[a1 applyStyle];
}

id objc_msgSend_applyTransform_(void *a1, const char *a2, ...)
{
  return [a1 applyTransform];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [a1 archivedDataWithRootObject:requiringSecureCoding:error:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_attributedStringWithAttachment_(void *a1, const char *a2, ...)
{
  return [a1 attributedStringWithAttachment:];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return _[a1 autoupdatingCurrentLocale];
}

id objc_msgSend_barWidthForStyle_(void *a1, const char *a2, ...)
{
  return [a1 barWidthForStyle:];
}

id objc_msgSend_becomeCurrent(void *a1, const char *a2, ...)
{
  return _[a1 becomeCurrent];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_beep(void *a1, const char *a2, ...)
{
  return _[a1 beep];
}

id objc_msgSend_beginAnimations_(void *a1, const char *a2, ...)
{
  return [a1 beginAnimations:];
}

id objc_msgSend_beginAnimations_context_(void *a1, const char *a2, ...)
{
  return [a1 beginAnimations:context:];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_beginningOfDocument(void *a1, const char *a2, ...)
{
  return _[a1 beginningOfDocument];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return _[a1 bezierPath];
}

id objc_msgSend_bezierPathWithArcCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:];
}

id objc_msgSend_bezierPathWithOvalInRect_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithOvalInRect:];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_blankEvent(void *a1, const char *a2, ...)
{
  return _[a1 blankEvent];
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return _[a1 blueColor];
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 boldSystemFontOfSize:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bottomKeylineView(void *a1, const char *a2, ...)
{
  return _[a1 bottomKeylineView];
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return [a1 boundingRectWithSize:options:attributes:context:];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return [a1 bringSubviewToFront:];
}

id objc_msgSend_buildTableRowsWithStyle_(void *a1, const char *a2, ...)
{
  return [a1 buildTableRowsWithStyle:];
}

id objc_msgSend_buildVolumeSlider(void *a1, const char *a2, ...)
{
  return _[a1 buildVolumeSlider];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithIdentifier:];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithPath:];
}

id objc_msgSend_buttonCircleSize(void *a1, const char *a2, ...)
{
  return _[a1 buttonCircleSize];
}

id objc_msgSend_buttonWidthForSize_(void *a1, const char *a2, ...)
{
  return [a1 buttonWidthForSize:];
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return [a1 buttonWithType:];
}

id objc_msgSend_bypass(void *a1, const char *a2, ...)
{
  return _[a1 bypass];
}

id objc_msgSend_bypassReloadAlarm_(void *a1, const char *a2, ...)
{
  return [a1 bypassReloadAlarm:];
}

id objc_msgSend_calculateAstronomicalTimeForLocation_time_altitudeInDegrees_(void *a1, const char *a2, ...)
{
  return [a1 calculateAstronomicalTimeForLocation:time:altitudeInDegrees:];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return _[a1 calendar];
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 calendarWithIdentifier:];
}

id objc_msgSend_canAddCity(void *a1, const char *a2, ...)
{
  return _[a1 canAddCity];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return _[a1 cancelButton];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return [a1 cancelPreviousPerformRequestsWithTarget:nil selector:nil object:nil];
}

id objc_msgSend_cancelScheduledUserPreferencesCommit(void *a1, const char *a2, ...)
{
  return _[a1 cancelScheduledUserPreferencesCommit];
}

id objc_msgSend_cancelTerminatorUpdate(void *a1, const char *a2, ...)
{
  return _[a1 cancelTerminatorUpdate];
}

id objc_msgSend_cancelTimer_(void *a1, const char *a2, ...)
{
  return [a1 cancelTimer:];
}

id objc_msgSend_cancelTimerForCell_(void *a1, const char *a2, ...)
{
  return [a1 cancelTimerForCell:];
}

id objc_msgSend_cancelTrackingWithEvent_(void *a1, const char *a2, ...)
{
  return [a1 cancelTrackingWithEvent:];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return _[a1 capHeight];
}

id objc_msgSend_captureSnapshotOfView_withSnapshotType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "captureSnapshotOfView:withSnapshotType:");
}

id objc_msgSend_cellDidEditAlarmVolume_(void *a1, const char *a2, ...)
{
  return [a1 cellDidEditAlarmVolume:];
}

id objc_msgSend_cellForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 cellForItemAtIndexPath:];
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 cellForRowAtIndexPath:];
}

id objc_msgSend_cellHeight(void *a1, const char *a2, ...)
{
  return _[a1 cellHeight];
}

id objc_msgSend_cellStyle(void *a1, const char *a2, ...)
{
  return _[a1 cellStyle];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_centerNoResultsFoundLabelConstraints(void *a1, const char *a2, ...)
{
  return _[a1 centerNoResultsFoundLabelConstraints];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_changeButton(void *a1, const char *a2, ...)
{
  return _[a1 changeButton];
}

id objc_msgSend_changeButtonPressed(void *a1, const char *a2, ...)
{
  return _[a1 changeButtonPressed];
}

id objc_msgSend_charactersIgnoringModifiers(void *a1, const char *a2, ...)
{
  return _[a1 charactersIgnoringModifiers];
}

id objc_msgSend_checkForSiriTips(void *a1, const char *a2, ...)
{
  return _[a1 checkForSiriTips];
}

id objc_msgSend_checkIfCitiesModified(void *a1, const char *a2, ...)
{
  return _[a1 checkIfCitiesModified];
}

id objc_msgSend_circleShape(void *a1, const char *a2, ...)
{
  return _[a1 circleShape];
}

id objc_msgSend_circleView(void *a1, const char *a2, ...)
{
  return _[a1 circleView];
}

id objc_msgSend_cities(void *a1, const char *a2, ...)
{
  return _[a1 cities];
}

id objc_msgSend_citiesMatchingName_(void *a1, const char *a2, ...)
{
  return [a1 citiesMatchingName:];
}

id objc_msgSend_city(void *a1, const char *a2, ...)
{
  return _[a1 city];
}

id objc_msgSend_cityNameLabel(void *a1, const char *a2, ...)
{
  return _[a1 cityNameLabel];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return _[a1 clear];
}

id objc_msgSend_clearAllLaps(void *a1, const char *a2, ...)
{
  return _[a1 clearAllLaps];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clockLabelBaselineToTopConstraint(void *a1, const char *a2, ...)
{
  return _[a1 clockLabelBaselineToTopConstraint];
}

id objc_msgSend_clockLabelDetailLabelSpaceConstraint(void *a1, const char *a2, ...)
{
  return _[a1 clockLabelDetailLabelSpaceConstraint];
}

id objc_msgSend_clockLabelHeightConstraint(void *a1, const char *a2, ...)
{
  return _[a1 clockLabelHeightConstraint];
}

id objc_msgSend_closestCityToLocation_matchingTimeZone_(void *a1, const char *a2, ...)
{
  return [a1 closestCityToLocation:matchingTimeZone:];
}

id objc_msgSend_collectionBottomConstraint(void *a1, const char *a2, ...)
{
  return _[a1 collectionBottomConstraint];
}

id objc_msgSend_collectionController(void *a1, const char *a2, ...)
{
  return _[a1 collectionController];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_collectionView_didRemoveCity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:didRemoveCity:");
}

id objc_msgSend_collectionViewController(void *a1, const char *a2, ...)
{
  return _[a1 collectionViewController];
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return _[a1 collectionViewLayout];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _[a1 color];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return [a1 colorWithAlphaComponent:];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithRed:green:blue:alpha:];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithWhite:alpha:];
}

id objc_msgSend_columnAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 columnAtIndex:];
}

id objc_msgSend_columnsPerPage(void *a1, const char *a2, ...)
{
  return _[a1 columnsPerPage];
}

id objc_msgSend_commitAnimations(void *a1, const char *a2, ...)
{
  return _[a1 commitAnimations];
}

id objc_msgSend_commitUserPreferences(void *a1, const char *a2, ...)
{
  return _[a1 commitUserPreferences];
}

id objc_msgSend_commonInit(void *a1, const char *a2, ...)
{
  return _[a1 commonInit];
}

id objc_msgSend_compactSizeFont(void *a1, const char *a2, ...)
{
  return _[a1 compactSizeFont];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_component_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 component:fromDate:];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 components:fromDate:];
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationWithPointSize_weight_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithPointSize:];
}

id objc_msgSend_configurationWithWeight_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithWeight:];
}

id objc_msgSend_configureBackground(void *a1, const char *a2, ...)
{
  return _[a1 configureBackground];
}

id objc_msgSend_configureSetupButtonWithTitle_action_(void *a1, const char *a2, ...)
{
  return [a1 configureSetupButtonWithTitle:action:];
}

id objc_msgSend_configureTimeLabel(void *a1, const char *a2, ...)
{
  return _[a1 configureTimeLabel];
}

id objc_msgSend_configureWithOpaqueBackground(void *a1, const char *a2, ...)
{
  return _[a1 configureWithOpaqueBackground];
}

id objc_msgSend_configureWithTransparentBackground(void *a1, const char *a2, ...)
{
  return _[a1 configureWithTransparentBackground];
}

id objc_msgSend_confirmPickingSound(void *a1, const char *a2, ...)
{
  return _[a1 confirmPickingSound];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 conformsToProtocol:];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:constant:];
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:multiplier:];
}

id objc_msgSend_constraintEqualToAnchor_multiplier_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:multiplier:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToConstant:];
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintGreaterThanOrEqualToAnchor];
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintGreaterThanOrEqualToAnchor:constant:];
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintLessThanOrEqualToAnchor:];
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintLessThanOrEqualToAnchor:];
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return _[a1 constraints];
}

id objc_msgSend_containerGridViewWithArrangedSubviewRows_(void *a1, const char *a2, ...)
{
  return [a1 containerGridViewWithArrangedSubviewRows:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return _[a1 contentInset];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _[a1 contentOffset];
}

id objc_msgSend_contentScrollView(void *a1, const char *a2, ...)
{
  return _[a1 contentScrollView];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_controlButton(void *a1, const char *a2, ...)
{
  return _[a1 controlButton];
}

id objc_msgSend_controlButtonAttributesForView_buttonCircleSize_(void *a1, const char *a2, ...)
{
  return [a1 controlButtonAttributesForView:buttonCircleSize:];
}

id objc_msgSend_controlsView(void *a1, const char *a2, ...)
{
  return _[a1 controlsView];
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return [a1 convertPoint:toView:];
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:fromView:];
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

id objc_msgSend_countDownDuration(void *a1, const char *a2, ...)
{
  return _[a1 countDownDuration];
}

id objc_msgSend_countDownLabel(void *a1, const char *a2, ...)
{
  return _[a1 countDownLabel];
}

id objc_msgSend_countDownView(void *a1, const char *a2, ...)
{
  return _[a1 countDownView];
}

id objc_msgSend_currentAlarmEditController(void *a1, const char *a2, ...)
{
  return _[a1 currentAlarmEditController];
}

id objc_msgSend_currentCollation(void *a1, const char *a2, ...)
{
  return _[a1 currentCollation];
}

id objc_msgSend_currentConstraints(void *a1, const char *a2, ...)
{
  return _[a1 currentConstraints];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentInterval(void *a1, const char *a2, ...)
{
  return _[a1 currentInterval];
}

id objc_msgSend_currentLapCell(void *a1, const char *a2, ...)
{
  return _[a1 currentLapCell];
}

id objc_msgSend_currentLapTime(void *a1, const char *a2, ...)
{
  return _[a1 currentLapTime];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentPage(void *a1, const char *a2, ...)
{
  return _[a1 currentPage];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentSoundToneName(void *a1, const char *a2, ...)
{
  return _[a1 currentSoundToneName];
}

id objc_msgSend_currentTitle(void *a1, const char *a2, ...)
{
  return _[a1 currentTitle];
}

id objc_msgSend_currentTone(void *a1, const char *a2, ...)
{
  return _[a1 currentTone];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingTimeInterval:];
}

id objc_msgSend_dateComponents(void *a1, const char *a2, ...)
{
  return _[a1 dateComponents];
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return [a1 dateFromComponents:];
}

id objc_msgSend_dateLabel(void *a1, const char *a2, ...)
{
  return _[a1 dateLabel];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_dayAndTimeZoneOffsetStringFromDate_withTimeZoneOffset_timeZoneAbbreviation_spaceBeforeTimeDesignator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dayAndTimeZoneOffsetStringFromDate:withTimeZoneOffset:timeZoneAbbreviation:spaceBeforeTimeDesignator:");
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 deactivateConstraints:];
}

id objc_msgSend_deadZone(void *a1, const char *a2, ...)
{
  return _[a1 deadZone];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 decimalDigitCharacterSet];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClass:forKey:];
}

id objc_msgSend_decrementValue(void *a1, const char *a2, ...)
{
  return _[a1 decrementValue];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultCitiesShownInWorldClock(void *a1, const char *a2, ...)
{
  return _[a1 defaultCitiesShownInWorldClock];
}

id objc_msgSend_defaultDuration(void *a1, const char *a2, ...)
{
  return _[a1 defaultDuration];
}

id objc_msgSend_defaultEditLabel(void *a1, const char *a2, ...)
{
  return _[a1 defaultEditLabel];
}

id objc_msgSend_defaultHeight(void *a1, const char *a2, ...)
{
  return _[a1 defaultHeight];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultShortcutItem(void *a1, const char *a2, ...)
{
  return _[a1 defaultShortcutItem];
}

id objc_msgSend_defaultSizeForCurrentOrientation(void *a1, const char *a2, ...)
{
  return _[a1 defaultSizeForCurrentOrientation];
}

id objc_msgSend_defaultSoundForCategory_(void *a1, const char *a2, ...)
{
  return [a1 defaultSoundForCategory:];
}

id objc_msgSend_defaultToneIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 defaultToneIdentifier];
}

id objc_msgSend_defaultToneIdentifierForAlertType_(void *a1, const char *a2, ...)
{
  return [a1 defaultToneIdentifierForAlertType:];
}

id objc_msgSend_defaultVibrationIdentifierForAlertType_topic_(void *a1, const char *a2, ...)
{
  return [a1 defaultVibrationIdentifierForAlertType:topic:];
}

id objc_msgSend_defaultViewStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultViewStyle];
}

id objc_msgSend_deferAddedCity(void *a1, const char *a2, ...)
{
  return _[a1 deferAddedCity];
}

id objc_msgSend_deferRemovedCity(void *a1, const char *a2, ...)
{
  return _[a1 deferRemovedCity];
}

id objc_msgSend_deferredAddingAlarm(void *a1, const char *a2, ...)
{
  return _[a1 deferredAddingAlarm];
}

id objc_msgSend_deferredAddingTimer(void *a1, const char *a2, ...)
{
  return _[a1 deferredAddingTimer];
}

id objc_msgSend_deferredEditingAction(void *a1, const char *a2, ...)
{
  return _[a1 deferredEditingAction];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteButton(void *a1, const char *a2, ...)
{
  return _[a1 deleteButton];
}

id objc_msgSend_deleteCell_(void *a1, const char *a2, ...)
{
  return [a1 deleteCell:];
}

id objc_msgSend_deleteItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return [a1 deleteItemsAtIndexPaths:];
}

id objc_msgSend_deleteRecent_(void *a1, const char *a2, ...)
{
  return [a1 deleteRecent:];
}

id objc_msgSend_deleteRecentTimerForCell_(void *a1, const char *a2, ...)
{
  return [a1 deleteRecentTimerForCell:];
}

id objc_msgSend_deleteRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return [a1 deleteRowsAtIndexPaths:withRowAnimation:];
}

id objc_msgSend_deleteSections_(void *a1, const char *a2, ...)
{
  return [a1 deleteSections:];
}

id objc_msgSend_deleteSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return [a1 deleteSections:withRowAnimation:];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithIdentifier:];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithIdentifier:forIndexPath:];
}

id objc_msgSend_dequeueReusableCellWithReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithReuseIdentifier:forIndexPath:];
}

id objc_msgSend_dequeueReusableHeaderFooterViewWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableHeaderFooterViewWithIdentifier:];
}

id objc_msgSend_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptorByDisallowingSmallSizes(void *a1, const char *a2, ...)
{
  return _[a1 descriptorByDisallowingSmallSizes];
}

id objc_msgSend_descriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 descriptorWithTextStyle:];
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return [a1 deselectRowAtIndexPath:animated:];
}

id objc_msgSend_desiredContentSize(void *a1, const char *a2, ...)
{
  return _[a1 desiredContentSize];
}

id objc_msgSend_detailLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailLabel];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_detailedDescription(void *a1, const char *a2, ...)
{
  return _[a1 detailedDescription];
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfURL:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didCancelTimerWithSender_(void *a1, const char *a2, ...)
{
  return [a1 didCancelTimerWithSender:];
}

id objc_msgSend_didCompleteSleepOnboarding(void *a1, const char *a2, ...)
{
  return _[a1 didCompleteSleepOnboarding];
}

id objc_msgSend_didDismissViewController(void *a1, const char *a2, ...)
{
  return _[a1 didDismissViewController];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 didMoveToParentViewController:];
}

id objc_msgSend_didReceiveStartTimerShortcutAction(void *a1, const char *a2, ...)
{
  return _[a1 didReceiveStartTimerShortcutAction];
}

id objc_msgSend_didSelectPresetWithDuration_(void *a1, const char *a2, ...)
{
  return [a1 didSelectPresetWithDuration:];
}

id objc_msgSend_didSelectRecentDuration_(void *a1, const char *a2, ...)
{
  return [a1 didSelectRecentDuration:];
}

id objc_msgSend_didSendPauseAction(void *a1, const char *a2, ...)
{
  return _[a1 didSendPauseAction];
}

id objc_msgSend_didSendPauseAction_(void *a1, const char *a2, ...)
{
  return [a1 didSendPauseAction:];
}

id objc_msgSend_didSendResumeAction(void *a1, const char *a2, ...)
{
  return _[a1 didSendResumeAction];
}

id objc_msgSend_didSendResumeAction_(void *a1, const char *a2, ...)
{
  return [a1 didSendResumeAction:];
}

id objc_msgSend_didStartTimerWithDuration_title_sound_sender_(void *a1, const char *a2, ...)
{
  return [a1 didStartTimerWithDuration:title:sound:sender:];
}

id objc_msgSend_didUpdateWithLabel_sender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateWithLabel:sender:");
}

id objc_msgSend_digitalClockLabel(void *a1, const char *a2, ...)
{
  return _[a1 digitalClockLabel];
}

id objc_msgSend_digitalStopwatchContainer(void *a1, const char *a2, ...)
{
  return _[a1 digitalStopwatchContainer];
}

id objc_msgSend_dismissAddEditViewController_(void *a1, const char *a2, ...)
{
  return [a1 dismissAddEditViewController:];
}

id objc_msgSend_dismissAddViewController_(void *a1, const char *a2, ...)
{
  return [a1 dismissAddViewController:];
}

id objc_msgSend_dismissSoundPicker(void *a1, const char *a2, ...)
{
  return _[a1 dismissSoundPicker];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerAnimated:completion:];
}

id objc_msgSend_displayNameIncludingCountry_(void *a1, const char *a2, ...)
{
  return [a1 displayNameIncludingCountry:];
}

id objc_msgSend_displayNameIncludingCountry_withFormat_(void *a1, const char *a2, ...)
{
  return [a1 displayNameIncludingCountry:withFormat:];
}

id objc_msgSend_displayTitle(void *a1, const char *a2, ...)
{
  return _[a1 displayTitle];
}

id objc_msgSend_displaysTime(void *a1, const char *a2, ...)
{
  return _[a1 displaysTime];
}

id objc_msgSend_dotImageFrameForPlacement_(void *a1, const char *a2, ...)
{
  return [a1 dotImageFrameForPlacement:];
}

id objc_msgSend_dotImageView(void *a1, const char *a2, ...)
{
  return _[a1 dotImageView];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_drawAtPoint_withAttributes_(void *a1, const char *a2, ...)
{
  return [a1 drawAtPoint:withAttributes:];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_durationFormatter(void *a1, const char *a2, ...)
{
  return _[a1 durationFormatter];
}

id objc_msgSend_durationLabel(void *a1, const char *a2, ...)
{
  return _[a1 durationLabel];
}

id objc_msgSend_durationStringFromInterval_(void *a1, const char *a2, ...)
{
  return [a1 durationStringFromInterval:];
}

id objc_msgSend_editButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 editButtonItem];
}

id objc_msgSend_editLabelCell(void *a1, const char *a2, ...)
{
  return _[a1 editLabelCell];
}

id objc_msgSend_edited(void *a1, const char *a2, ...)
{
  return _[a1 edited];
}

id objc_msgSend_editedAlarm(void *a1, const char *a2, ...)
{
  return _[a1 editedAlarm];
}

id objc_msgSend_editingPopoverSourceRect(void *a1, const char *a2, ...)
{
  return _[a1 editingPopoverSourceRect];
}

id objc_msgSend_editingRectForBounds_(void *a1, const char *a2, ...)
{
  return [a1 editingRectForBounds:];
}

id objc_msgSend_effectiveLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return [a1 effectiveLayoutSizeFittingSize:];
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTime];
}

id objc_msgSend_enableSwitch(void *a1, const char *a2, ...)
{
  return _[a1 enableSwitch];
}

id objc_msgSend_enabledSwitch(void *a1, const char *a2, ...)
{
  return _[a1 enabledSwitch];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endAlertingSession(void *a1, const char *a2, ...)
{
  return _[a1 endAlertingSession];
}

id objc_msgSend_endAnimations(void *a1, const char *a2, ...)
{
  return _[a1 endAnimations];
}

id objc_msgSend_endDisplayUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endDisplayUpdates];
}

id objc_msgSend_endEditing(void *a1, const char *a2, ...)
{
  return _[a1 endEditing];
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return [a1 endEditing:];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_ensureLapFormatter(void *a1, const char *a2, ...)
{
  return _[a1 ensureLapFormatter];
}

id objc_msgSend_eraseLocalDefaults(void *a1, const char *a2, ...)
{
  return _[a1 eraseLocalDefaults];
}

id objc_msgSend_estimatedCellHeightForTimerWithTitle_(void *a1, const char *a2, ...)
{
  return [a1 estimatedCellHeightForTimerWithTitle:];
}

id objc_msgSend_estimatedCountdownViewHeight(void *a1, const char *a2, ...)
{
  return _[a1 estimatedCountdownViewHeight];
}

id objc_msgSend_estimatedElementSpacing(void *a1, const char *a2, ...)
{
  return _[a1 estimatedElementSpacing];
}

id objc_msgSend_estimatedHeightForTimerWithTitle_(void *a1, const char *a2, ...)
{
  return [a1 estimatedHeightForTimerWithTitle:];
}

id objc_msgSend_estimatedNonCountdownElementHeight(void *a1, const char *a2, ...)
{
  return _[a1 estimatedNonCountdownElementHeight];
}

id objc_msgSend_estimatedNonCountdownElementHeightWithSpacing(void *a1, const char *a2, ...)
{
  return _[a1 estimatedNonCountdownElementHeightWithSpacing];
}

id objc_msgSend_estimatedSplitLayoutForWindowWidth_(void *a1, const char *a2, ...)
{
  return [a1 estimatedSplitLayoutForWindowWidth:];
}

id objc_msgSend_estimatedTimePickerHeight(void *a1, const char *a2, ...)
{
  return _[a1 estimatedTimePickerHeight];
}

id objc_msgSend_estimatedTonePickerHeight(void *a1, const char *a2, ...)
{
  return _[a1 estimatedTonePickerHeight];
}

id objc_msgSend_estimatedViewHeight(void *a1, const char *a2, ...)
{
  return _[a1 estimatedViewHeight];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return _[a1 eventType];
}

id objc_msgSend_eventWithType_(void *a1, const char *a2, ...)
{
  return [a1 eventWithType:];
}

id objc_msgSend_eventWithType_identifier_(void *a1, const char *a2, ...)
{
  return [a1 eventWithType:identifier:];
}

id objc_msgSend_eventWithType_indexPath_(void *a1, const char *a2, ...)
{
  return [a1 eventWithType:indexPath:];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_featureStore(void *a1, const char *a2, ...)
{
  return _[a1 featureStore];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return _[a1 fill];
}

id objc_msgSend_finishAddViewControllerDismissal_(void *a1, const char *a2, ...)
{
  return [a1 finishAddViewControllerDismissal:];
}

id objc_msgSend_finishedTest_(void *a1, const char *a2, ...)
{
  return [a1 finishedTest:];
}

id objc_msgSend_finishedTest_extraResults_(void *a1, const char *a2, ...)
{
  return [a1 finishedTest:extraResults:];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstRectForRange_(void *a1, const char *a2, ...)
{
  return [a1 firstRectForRange:];
}

id objc_msgSend_firstWeekday(void *a1, const char *a2, ...)
{
  return _[a1 firstWeekday];
}

id objc_msgSend_flashScrollIndicators(void *a1, const char *a2, ...)
{
  return _[a1 flashScrollIndicators];
}

id objc_msgSend_flatMap_(void *a1, const char *a2, ...)
{
  return [a1 flatMap:];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_focusHeading(void *a1, const char *a2, ...)
{
  return _[a1 focusHeading];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontWithFamilyName_traits_size_(void *a1, const char *a2, ...)
{
  return [a1 fontWithFamilyName:traits:size:];
}

id objc_msgSend_formatter(void *a1, const char *a2, ...)
{
  return _[a1 formatter];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_futureWithError_(void *a1, const char *a2, ...)
{
  return [a1 futureWithError:];
}

id objc_msgSend_futureWithResult_(void *a1, const char *a2, ...)
{
  return [a1 futureWithResult:];
}

id objc_msgSend_getCurrentDuration(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentDuration];
}

id objc_msgSend_getCurrentLabel(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentLabel];
}

id objc_msgSend_getLatestDuration(void *a1, const char *a2, ...)
{
  return _[a1 getLatestDuration];
}

id objc_msgSend_getRecentDurations(void *a1, const char *a2, ...)
{
  return _[a1 getRecentDurations];
}

id objc_msgSend_getStopwatch(void *a1, const char *a2, ...)
{
  return _[a1 getStopwatch];
}

id objc_msgSend_getStopwatches(void *a1, const char *a2, ...)
{
  return _[a1 getStopwatches];
}

id objc_msgSend_grayButtonConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 grayButtonConfiguration];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return _[a1 grayColor];
}

id objc_msgSend_greyOutExpectedTime(void *a1, const char *a2, ...)
{
  return _[a1 greyOutExpectedTime];
}

id objc_msgSend_gridView(void *a1, const char *a2, ...)
{
  return _[a1 gridView];
}

id objc_msgSend_groupedHeaderConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 groupedHeaderConfiguration];
}

id objc_msgSend_handleContentSizeChange(void *a1, const char *a2, ...)
{
  return _[a1 handleContentSizeChange];
}

id objc_msgSend_handleContentSizeTransitionFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleContentSizeTransitionFrom:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [a1 handleFailureInFunction:file:lineNumber:description:];
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleLapStopwatchShortcutAction(void *a1, const char *a2, ...)
{
  return _[a1 handleLapStopwatchShortcutAction];
}

id objc_msgSend_handleLocaleChange(void *a1, const char *a2, ...)
{
  return _[a1 handleLocaleChange];
}

id objc_msgSend_handleResetStopwatchShortcutAction(void *a1, const char *a2, ...)
{
  return _[a1 handleResetStopwatchShortcutAction];
}

id objc_msgSend_handleStartStopwatchShortcutAction(void *a1, const char *a2, ...)
{
  return _[a1 handleStartStopwatchShortcutAction];
}

id objc_msgSend_handleStopStopwatchShortcutAction(void *a1, const char *a2, ...)
{
  return _[a1 handleStopStopwatchShortcutAction];
}

id objc_msgSend_hasDefaultTitle(void *a1, const char *a2, ...)
{
  return _[a1 hasDefaultTitle];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasSleepAlarmMatchingAlarmIDString_(void *a1, const char *a2, ...)
{
  return [a1 hasSleepAlarmMatchingAlarmIDString:];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return [a1 hasSuffix:];
}

id objc_msgSend_hasTail(void *a1, const char *a2, ...)
{
  return _[a1 hasTail];
}

id objc_msgSend_headerTitle(void *a1, const char *a2, ...)
{
  return _[a1 headerTitle];
}

id objc_msgSend_healthAppInstallationDidChange(void *a1, const char *a2, ...)
{
  return _[a1 healthAppInstallationDidChange];
}

id objc_msgSend_healthAppNotInstalled(void *a1, const char *a2, ...)
{
  return _[a1 healthAppNotInstalled];
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return _[a1 healthStore];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_hideExpectedTime(void *a1, const char *a2, ...)
{
  return _[a1 hideExpectedTime];
}

id objc_msgSend_highlightLayer(void *a1, const char *a2, ...)
{
  return _[a1 highlightLayer];
}

id objc_msgSend_highlightedBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 highlightedBackgroundColor];
}

id objc_msgSend_highlightedShade(void *a1, const char *a2, ...)
{
  return _[a1 highlightedShade];
}

id objc_msgSend_horizontalMapHeightConstraint(void *a1, const char *a2, ...)
{
  return _[a1 horizontalMapHeightConstraint];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 horizontalSizeClass];
}

id objc_msgSend_hotspotOffset(void *a1, const char *a2, ...)
{
  return _[a1 hotspotOffset];
}

id objc_msgSend_hotspotOffsetForPlacement_(void *a1, const char *a2, ...)
{
  return [a1 hotspotOffsetForPlacement:];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _[a1 hour];
}

id objc_msgSend_hourHighlightFrame(void *a1, const char *a2, ...)
{
  return _[a1 hourHighlightFrame];
}

id objc_msgSend_hoverStyle(void *a1, const char *a2, ...)
{
  return _[a1 hoverStyle];
}

id objc_msgSend_iPadSingleCellNewTimerConstraints(void *a1, const char *a2, ...)
{
  return _[a1 iPadSingleCellNewTimerConstraints];
}

id objc_msgSend_iconPlacement(void *a1, const char *a2, ...)
{
  return _[a1 iconPlacement];
}

id objc_msgSend_iconWithSystemImageName_(void *a1, const char *a2, ...)
{
  return [a1 iconWithSystemImageName:];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageForState_(void *a1, const char *a2, ...)
{
  return [a1 imageForState:];
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return [a1 imageNamed:];
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return [a1 imageWithRenderingMode:];
}

id objc_msgSend_incrementEventCount_(void *a1, const char *a2, ...)
{
  return [a1 incrementEventCount:];
}

id objc_msgSend_incrementValue(void *a1, const char *a2, ...)
{
  return _[a1 incrementValue];
}

id objc_msgSend_indexGreaterThanOrEqualToIndex_(void *a1, const char *a2, ...)
{
  return [a1 indexGreaterThanOrEqualToIndex:];
}

id objc_msgSend_indexLessThanIndex_(void *a1, const char *a2, ...)
{
  return [a1 indexLessThanIndex:];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObjectPassingTest:];
}

id objc_msgSend_indexPath(void *a1, const char *a2, ...)
{
  return _[a1 indexPath];
}

id objc_msgSend_indexPathForCell_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForCell:];
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForItem:inSection:];
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForRow:inSection:];
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return _[a1 indexPathForSelectedRow];
}

id objc_msgSend_indexPathsForVisibleItems(void *a1, const char *a2, ...)
{
  return _[a1 indexPathsForVisibleItems];
}

id objc_msgSend_indexPathsForVisibleRows(void *a1, const char *a2, ...)
{
  return _[a1 indexPathsForVisibleRows];
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return [a1 indexSetWithIndex:];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initWithALCity_(void *a1, const char *a2, ...)
{
  return [a1 initWithALCity:];
}

id objc_msgSend_initWithAlarm_isNewAlarm_(void *a1, const char *a2, ...)
{
  return [a1 initWithAlarm:isNewAlarm:];
}

id objc_msgSend_initWithAlarm_setting_delegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithAlarm:setting:delegate:];
}

id objc_msgSend_initWithAlarmManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithAlarmManager:];
}

id objc_msgSend_initWithAlarmManager_alarmDataSource_timerManager_timerDataSource_(void *a1, const char *a2, ...)
{
  return [a1 initWithAlarmManager:alarmManager alarmDataSource:alarmDataSource timerManager:timerManager timerDataSource:timerDataSource];
}

id objc_msgSend_initWithAlarmManager_dataSource_(void *a1, const char *a2, ...)
{
  return [a1 initWithAlarmManager:dataSource:];
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithBarButtonSystemItem:target:action:];
}

id objc_msgSend_initWithBarColor_backgroundBarColor_barWidth_(void *a1, const char *a2, ...)
{
  return [a1 initWithBarColor:backgroundBarColor:barWidth:];
}

id objc_msgSend_initWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return [a1 initWithCGImage:scale:orientation:];
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithCalendarIdentifier:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithCity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCity:];
}

id objc_msgSend_initWithCollectionViewLayout_(void *a1, const char *a2, ...)
{
  return [a1 initWithCollectionViewLayout:];
}

id objc_msgSend_initWithDataSource_timerManager_delegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataSource:timerManager:delegate:];
}

id objc_msgSend_initWithDefaults_manager_(void *a1, const char *a2, ...)
{
  return [a1 initWithDefaults:manager:];
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:];
}

id objc_msgSend_initWithDelegate_currentTitle_isEmpty_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:currentTitle:isEmpty:];
}

id objc_msgSend_initWithDelegate_style_timerControlState_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:style:timerControlState:];
}

id objc_msgSend_initWithFeatureIdentifier_sleepStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeatureIdentifier:sleepStore:];
}

id objc_msgSend_initWithFireDate_interval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 initWithFireDate:interval:target:selector:userInfo:repeats:];
}

id objc_msgSend_initWithFont_textColor_glyphName_style_(void *a1, const char *a2, ...)
{
  return [a1 initWithFont:textColor:glyphName:style:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:style:];
}

id objc_msgSend_initWithFrame_title_style_includeBackdrop_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:title:style:includeBackdrop:];
}

id objc_msgSend_initWithHealthStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithHealthStore:];
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:];
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:];
}

id objc_msgSend_initWithItems_presetsDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithItems:presetsDelegate:];
}

id objc_msgSend_initWithLatitude_longitude_(void *a1, const char *a2, ...)
{
  return [a1 initWithLatitude:longitude:];
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:];
}

id objc_msgSend_initWithPersistentID_(void *a1, const char *a2, ...)
{
  return [a1 initWithPersistentID:];
}

id objc_msgSend_initWithPicker_timeView_expectedTimeView_countdownView_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPicker:timeView:expectedTimeView:countdownView:reuseIdentifier:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithRootViewController:];
}

id objc_msgSend_initWithSleepStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithSleepStore:];
}

id objc_msgSend_initWithState_duration_(void *a1, const char *a2, ...)
{
  return [a1 initWithState:duration:];
}

id objc_msgSend_initWithStopwatch_manager_delegate_dateProvider_registerForNotifications_broadcastUpdates_(void *a1, const char *a2, ...)
{
  return [a1 initWithStopwatch:manager:delegate:dateProvider:registerForNotifications:broadcastUpdates:];
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:attributes:];
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyle:];
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyle:reuseIdentifier:];
}

id objc_msgSend_initWithTarget_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:];
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:action:];
}

id objc_msgSend_initWithTestName_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestName:scrollView:completionHandler:");
}

id objc_msgSend_initWithTestName_window_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithTestName:window:completionHandler:];
}

id objc_msgSend_initWithTimer_timerManager_dataSource_delegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithTimer:timerManager:dataSource:delegate:];
}

id objc_msgSend_initWithTimerManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithTimerManager:];
}

id objc_msgSend_initWithTimerManager_dataSource_(void *a1, const char *a2, ...)
{
  return [a1 initWithTimerManager:dataSource:];
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:style:target:action:];
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:];
}

id objc_msgSend_initWithType_localizedTitle_localizedSubtitle_icon_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:localizedTitle:localizedSubtitle:icon:userInfo:];
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 initWithWindowScene:];
}

id objc_msgSend_insertItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return [a1 insertItemsAtIndexPaths:];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertObject:atIndex:];
}

id objc_msgSend_insertRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return [a1 insertRowsAtIndexPaths:withRowAnimation:];
}

id objc_msgSend_insertSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return [a1 insertSections:withRowAnimation:];
}

id objc_msgSend_insertSubview_aboveSubview_(void *a1, const char *a2, ...)
{
  return [a1 insertSubview:aboveSubview:];
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertSubview:atIndex:];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return [a1 integerForKey:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return _[a1 intent];
}

id objc_msgSend_interaction(void *a1, const char *a2, ...)
{
  return _[a1 interaction];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_internalSetBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 internalSetBackgroundColor:];
}

id objc_msgSend_interruptAudio(void *a1, const char *a2, ...)
{
  return _[a1 interruptAudio];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateDisplayLink(void *a1, const char *a2, ...)
{
  return _[a1 invalidateDisplayLink];
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return _[a1 invalidateLayout];
}

id objc_msgSend_invalidateViewControllersWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 invalidateViewControllersWithTraitCollection:];
}

id objc_msgSend_isCurrentOnboardingVersionCompletedWithError_(void *a1, const char *a2, ...)
{
  return [a1 isCurrentOnboardingVersionCompletedWithError:];
}

id objc_msgSend_isCurrentTimer(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentTimer];
}

id objc_msgSend_isDefaultTone(void *a1, const char *a2, ...)
{
  return _[a1 isDefaultTone];
}

id objc_msgSend_isEdited(void *a1, const char *a2, ...)
{
  return _[a1 isEdited];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _[a1 isEditing];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToSet:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 isFirstResponder];
}

id objc_msgSend_isFocused(void *a1, const char *a2, ...)
{
  return _[a1 isFocused];
}

id objc_msgSend_isHealthAppNotInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isHealthAppNotInstalled];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return _[a1 isHighlighted];
}

id objc_msgSend_isIpadAddSheet(void *a1, const char *a2, ...)
{
  return _[a1 isIpadAddSheet];
}

id objc_msgSend_isLandscape(void *a1, const char *a2, ...)
{
  return _[a1 isLandscape];
}

id objc_msgSend_isMovingFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 isMovingFromParentViewController];
}

id objc_msgSend_isNewAlarm(void *a1, const char *a2, ...)
{
  return _[a1 isNewAlarm];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return _[a1 isOn];
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isRecapAvailable];
}

id objc_msgSend_isRunningInThirdSplitView(void *a1, const char *a2, ...)
{
  return _[a1 isRunningInThirdSplitView];
}

id objc_msgSend_isRunningPPTTest(void *a1, const char *a2, ...)
{
  return _[a1 isRunningPPTTest];
}

id objc_msgSend_isRunningTimer(void *a1, const char *a2, ...)
{
  return _[a1 isRunningTimer];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _[a1 isSelected];
}

id objc_msgSend_isSilent(void *a1, const char *a2, ...)
{
  return _[a1 isSilent];
}

id objc_msgSend_isSleepAlarm(void *a1, const char *a2, ...)
{
  return _[a1 isSleepAlarm];
}

id objc_msgSend_isStarted(void *a1, const char *a2, ...)
{
  return _[a1 isStarted];
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return _[a1 isSuspended];
}

id objc_msgSend_isUserInteractionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isUserInteractionEnabled];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_itemWithNumber_unit_duration_identifier_(void *a1, const char *a2, ...)
{
  return [a1 itemWithNumber:unit:duration:identifier:];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_itemsTableRowHeight(void *a1, const char *a2, ...)
{
  return _[a1 itemsTableRowHeight];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _[a1 keyWindow];
}

id objc_msgSend_keyboardFrame(void *a1, const char *a2, ...)
{
  return _[a1 keyboardFrame];
}

id objc_msgSend_keywords(void *a1, const char *a2, ...)
{
  return _[a1 keywords];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labelBaseFontForCellStyle_(void *a1, const char *a2, ...)
{
  return [a1 labelBaseFontForCellStyle:];
}

id objc_msgSend_labelFont(void *a1, const char *a2, ...)
{
  return _[a1 labelFont];
}

id objc_msgSend_labelViews(void *a1, const char *a2, ...)
{
  return _[a1 labelViews];
}

id objc_msgSend_lapButtonOccludingView(void *a1, const char *a2, ...)
{
  return _[a1 lapButtonOccludingView];
}

id objc_msgSend_lapButtonTopConstraint(void *a1, const char *a2, ...)
{
  return _[a1 lapButtonTopConstraint];
}

id objc_msgSend_lapButtonWidthConstraint(void *a1, const char *a2, ...)
{
  return _[a1 lapButtonWidthConstraint];
}

id objc_msgSend_lapControlButton(void *a1, const char *a2, ...)
{
  return _[a1 lapControlButton];
}

id objc_msgSend_lapCount(void *a1, const char *a2, ...)
{
  return _[a1 lapCount];
}

id objc_msgSend_lapExtrema(void *a1, const char *a2, ...)
{
  return _[a1 lapExtrema];
}

id objc_msgSend_lapLabel(void *a1, const char *a2, ...)
{
  return _[a1 lapLabel];
}

id objc_msgSend_lapLabelBaselineTopOffset_bottomOffset_forCellStyle_(void *a1, const char *a2, ...)
{
  return [a1 lapLabelBaselineTopOffset:bottomOffset:forCellStyle:];
}

id objc_msgSend_lapLabelDefaultBaselineTopOffset(void *a1, const char *a2, ...)
{
  return _[a1 lapLabelDefaultBaselineTopOffset];
}

id objc_msgSend_lapLabelTextForNumber_(void *a1, const char *a2, ...)
{
  return [a1 lapLabelTextForNumber:];
}

id objc_msgSend_lapLapTimer(void *a1, const char *a2, ...)
{
  return _[a1 lapLapTimer];
}

id objc_msgSend_lapLapTimerUI(void *a1, const char *a2, ...)
{
  return _[a1 lapLapTimerUI];
}

id objc_msgSend_lapNumberLabel(void *a1, const char *a2, ...)
{
  return _[a1 lapNumberLabel];
}

id objc_msgSend_lapNumberLabelBaselineBottomOffsetConstraint(void *a1, const char *a2, ...)
{
  return _[a1 lapNumberLabelBaselineBottomOffsetConstraint];
}

id objc_msgSend_lapNumberLabelBaselineTopOffsetConstraint(void *a1, const char *a2, ...)
{
  return _[a1 lapNumberLabelBaselineTopOffsetConstraint];
}

id objc_msgSend_lapSecondsHand(void *a1, const char *a2, ...)
{
  return _[a1 lapSecondsHand];
}

id objc_msgSend_lapStyle(void *a1, const char *a2, ...)
{
  return _[a1 lapStyle];
}

id objc_msgSend_lapTableController(void *a1, const char *a2, ...)
{
  return _[a1 lapTableController];
}

id objc_msgSend_lapTimes(void *a1, const char *a2, ...)
{
  return _[a1 lapTimes];
}

id objc_msgSend_laps(void *a1, const char *a2, ...)
{
  return _[a1 laps];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastBaselineAnchor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_latestLayoutSize(void *a1, const char *a2, ...)
{
  return _[a1 latestLayoutSize];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return _[a1 latitude];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return _[a1 layoutFrame];
}

id objc_msgSend_layoutGuides(void *a1, const char *a2, ...)
{
  return _[a1 layoutGuides];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 layoutMargins];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _[a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leftAnchor];
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 leftBarButtonItem];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return _[a1 lineHeight];
}

id objc_msgSend_loadAvailableTones(void *a1, const char *a2, ...)
{
  return _[a1 loadAvailableTones];
}

id objc_msgSend_loadCities(void *a1, const char *a2, ...)
{
  return _[a1 loadCities];
}

id objc_msgSend_loadUserPreferences(void *a1, const char *a2, ...)
{
  return _[a1 loadUserPreferences];
}

id objc_msgSend_localSetup(void *a1, const char *a2, ...)
{
  return _[a1 localSetup];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return _[a1 locale];
}

id objc_msgSend_localizedCaseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return [a1 localizedCaseInsensitiveCompare:];
}

id objc_msgSend_localizedStandardCompare_(void *a1, const char *a2, ...)
{
  return [a1 localizedStandardCompare:];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringFromNumber_numberStyle_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringFromNumber:numberStyle:];
}

id objc_msgSend_localizedTimeStringFromDate_forTimeZone_timeDesignator_(void *a1, const char *a2, ...)
{
  return [a1 localizedTimeStringFromDate:forTimeZone:timeDesignator:];
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return [a1 locationInView:];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return _[a1 longitude];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainDescription(void *a1, const char *a2, ...)
{
  return _[a1 mainDescription];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return _[a1 mainThreadScheduler];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return [a1 makeObjectsPerformSelector:];
}

id objc_msgSend_mapHeight(void *a1, const char *a2, ...)
{
  return _[a1 mapHeight];
}

id objc_msgSend_mapHeightForWidth_(void *a1, const char *a2, ...)
{
  return [a1 mapHeightForWidth:];
}

id objc_msgSend_mapView(void *a1, const char *a2, ...)
{
  return _[a1 mapView];
}

id objc_msgSend_maskForRow_(void *a1, const char *a2, ...)
{
  return [a1 maskForRow:];
}

id objc_msgSend_maxWidthForDateStringWithFont_(void *a1, const char *a2, ...)
{
  return [a1 maxWidthForDateStringWithFont:];
}

id objc_msgSend_mediaItemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 mediaItemIdentifier];
}

id objc_msgSend_migrateLegacyStopwatch(void *a1, const char *a2, ...)
{
  return _[a1 migrateLegacyStopwatch];
}

id objc_msgSend_migrator(void *a1, const char *a2, ...)
{
  return _[a1 migrator];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return _[a1 minute];
}

id objc_msgSend_minuteHighlightFrame(void *a1, const char *a2, ...)
{
  return _[a1 minuteHighlightFrame];
}

id objc_msgSend_minutesHand(void *a1, const char *a2, ...)
{
  return _[a1 minutesHand];
}

id objc_msgSend_mockItems(void *a1, const char *a2, ...)
{
  return _[a1 mockItems];
}

id objc_msgSend_modifierFlags(void *a1, const char *a2, ...)
{
  return _[a1 modifierFlags];
}

id objc_msgSend_moveCityFromIndex_toIndex_(void *a1, const char *a2, ...)
{
  return [a1 moveCityFromIndex:toIndex:];
}

id objc_msgSend_moveToPoint_(void *a1, const char *a2, ...)
{
  return [a1 moveToPoint:];
}

id objc_msgSend_moveViewFrameToVerticalPosition_(void *a1, const char *a2, ...)
{
  return [a1 moveViewFrameToVerticalPosition:];
}

id objc_msgSend_mtClockAppSection(void *a1, const char *a2, ...)
{
  return _[a1 mtClockAppSection];
}

id objc_msgSend_mtDecimalStyleNumberFormatter(void *a1, const char *a2, ...)
{
  return _[a1 mtDecimalStyleNumberFormatter];
}

id objc_msgSend_mtMainThreadScheduler(void *a1, const char *a2, ...)
{
  return _[a1 mtMainThreadScheduler];
}

id objc_msgSend_mtUserActivityWithActivityType_title_(void *a1, const char *a2, ...)
{
  return [a1 mtUserActivityWithActivityType:title:];
}

id objc_msgSend_mt_sleepMetaDataForUpcomingAlarmInCalendar_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_sleepMetaDataForUpcomingAlarmInCalendar:error:");
}

id objc_msgSend_mtui_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_backgroundColor];
}

id objc_msgSend_mtui_buttonBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_buttonBackgroundColor];
}

id objc_msgSend_mtui_cellHighlightColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_cellHighlightColor];
}

id objc_msgSend_mtui_cellSeparatorColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_cellSeparatorColor];
}

id objc_msgSend_mtui_defaultTimeDesignatorFont(void *a1, const char *a2, ...)
{
  return [a1 mtui_defaultTimeDesignatorFont];
}

id objc_msgSend_mtui_deleteButtonImage(void *a1, const char *a2, ...)
{
  return [a1 mtui_deleteButtonImage];
}

id objc_msgSend_mtui_disabledButtonTintColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_disabledButtonTintColor];
}

id objc_msgSend_mtui_disabledStartButtonTintColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_disabledStartButtonTintColor];
}

id objc_msgSend_mtui_disabledTextColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_disabledTextColor];
}

id objc_msgSend_mtui_fontByAddingTimeFontAttributes(void *a1, const char *a2, ...)
{
  return [a1 mtui_fontByAddingTimeFontAttributes];
}

id objc_msgSend_mtui_foregroundColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_foregroundColor];
}

id objc_msgSend_mtui_imageWithSymbolName_pointSize_color_(void *a1, const char *a2, ...)
{
  return [a1 mtui_imageWithSymbolName:pointSize:color:];
}

id objc_msgSend_mtui_imageWithSymbolName_scale_textStyle_andTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_imageWithSymbolName:scale:textStyle:andTintColor:");
}

id objc_msgSend_mtui_imageWithTintColor_(void *a1, const char *a2, ...)
{
  return [a1 mtui_imageWithTintColor:];
}

id objc_msgSend_mtui_isRTL(void *a1, const char *a2, ...)
{
  return [a1 mtui_isRTL];
}

id objc_msgSend_mtui_lapResetButtonTintColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_lapResetButtonTintColor];
}

id objc_msgSend_mtui_pauseButtonTextColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_pauseButtonTextColor];
}

id objc_msgSend_mtui_pauseButtonTintColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_pauseButtonTintColor];
}

id objc_msgSend_mtui_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_primaryColor];
}

id objc_msgSend_mtui_primaryTextColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_primaryTextColor];
}

id objc_msgSend_mtui_quaternaryColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_quaternaryColor];
}

id objc_msgSend_mtui_secondaryTextColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_secondaryTextColor];
}

id objc_msgSend_mtui_startResumeButtonTextColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_startResumeButtonTextColor];
}

id objc_msgSend_mtui_startResumeButtonTintColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_startResumeButtonTintColor];
}

id objc_msgSend_mtui_stopButtonTextColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_stopButtonTextColor];
}

id objc_msgSend_mtui_stopButtonTintColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_stopButtonTintColor];
}

id objc_msgSend_mtui_stopwatchMajorTickMarkColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_stopwatchMajorTickMarkColor];
}

id objc_msgSend_mtui_stopwatchMinorTickMarkColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_stopwatchMinorTickMarkColor];
}

id objc_msgSend_mtui_switchTintColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_switchTintColor];
}

id objc_msgSend_mtui_tertiaryColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_tertiaryColor];
}

id objc_msgSend_mtui_thinTimeFont(void *a1, const char *a2, ...)
{
  return [a1 mtui_thinTimeFont];
}

id objc_msgSend_mtui_thinTimeFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 mtui_thinTimeFontOfSize:];
}

id objc_msgSend_mtui_tintColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_tintColor];
}

id objc_msgSend_mtui_worldClockMapLandColor(void *a1, const char *a2, ...)
{
  return [a1 mtui_worldClockMapLandColor];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_na_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 na_firstObjectPassingTest:];
}

id objc_msgSend_na_genericError(void *a1, const char *a2, ...)
{
  return [a1 na_genericError];
}

id objc_msgSend_na_map_(void *a1, const char *a2, ...)
{
  return [a1 na_map:];
}

id objc_msgSend_na_safeAddObject_(void *a1, const char *a2, ...)
{
  return [a1 na_safeAddObject:];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameForToneIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 nameForToneIdentifier:];
}

id objc_msgSend_nameLabel(void *a1, const char *a2, ...)
{
  return _[a1 nameLabel];
}

id objc_msgSend_nameOfVibrationWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 nameOfVibrationWithIdentifier:];
}

id objc_msgSend_naui_setDynamicFontTextStyleDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 naui_setDynamicFontTextStyleDescriptor:];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationControllerForHorizontalSizeClass_verticalSizeClass_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationControllerForHorizontalSizeClass:verticalSizeClass:atIndex:");
}

id objc_msgSend_navigationControllerForTab_(void *a1, const char *a2, ...)
{
  return [a1 navigationControllerForTab:];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_needsMigration(void *a1, const char *a2, ...)
{
  return _[a1 needsMigration];
}

id objc_msgSend_nextFocusedView(void *a1, const char *a2, ...)
{
  return _[a1 nextFocusedView];
}

id objc_msgSend_noItemsText(void *a1, const char *a2, ...)
{
  return _[a1 noItemsText];
}

id objc_msgSend_noItemsView(void *a1, const char *a2, ...)
{
  return _[a1 noItemsView];
}

id objc_msgSend_noResultsFoundLabel(void *a1, const char *a2, ...)
{
  return _[a1 noResultsFoundLabel];
}

id objc_msgSend_normalBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 normalBackgroundColor];
}

id objc_msgSend_normalShade(void *a1, const char *a2, ...)
{
  return _[a1 normalShade];
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return _[a1 number];
}

id objc_msgSend_numberFormatter(void *a1, const char *a2, ...)
{
  return _[a1 numberFormatter];
}

id objc_msgSend_numberLabel(void *a1, const char *a2, ...)
{
  return _[a1 numberLabel];
}

id objc_msgSend_numberOfActiveTimers(void *a1, const char *a2, ...)
{
  return _[a1 numberOfActiveTimers];
}

id objc_msgSend_numberOfAlarms(void *a1, const char *a2, ...)
{
  return _[a1 numberOfAlarms];
}

id objc_msgSend_numberOfItems(void *a1, const char *a2, ...)
{
  return _[a1 numberOfItems];
}

id objc_msgSend_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return [a1 numberOfItemsInSection:];
}

id objc_msgSend_numberOfItemsIncludingSleep(void *a1, const char *a2, ...)
{
  return _[a1 numberOfItemsIncludingSleep];
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return _[a1 numberOfSections];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return _[a1 orientation];
}

id objc_msgSend_originalAlarm(void *a1, const char *a2, ...)
{
  return _[a1 originalAlarm];
}

id objc_msgSend_pageControl(void *a1, const char *a2, ...)
{
  return _[a1 pageControl];
}

id objc_msgSend_pages(void *a1, const char *a2, ...)
{
  return _[a1 pages];
}

id objc_msgSend_pagingViewController(void *a1, const char *a2, ...)
{
  return _[a1 pagingViewController];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _[a1 pause];
}

id objc_msgSend_pauseLapTimer(void *a1, const char *a2, ...)
{
  return _[a1 pauseLapTimer];
}

id objc_msgSend_pauseLapTimerUI(void *a1, const char *a2, ...)
{
  return _[a1 pauseLapTimerUI];
}

id objc_msgSend_pauseResumeButton(void *a1, const char *a2, ...)
{
  return _[a1 pauseResumeButton];
}

id objc_msgSend_pauseResumeTimer_(void *a1, const char *a2, ...)
{
  return [a1 pauseResumeTimer:];
}

id objc_msgSend_pauseResumeTimerForCell_(void *a1, const char *a2, ...)
{
  return [a1 pauseResumeTimerForCell:];
}

id objc_msgSend_performActionForIntent_(void *a1, const char *a2, ...)
{
  return [a1 performActionForIntent:];
}

id objc_msgSend_performActionForShortcutItem_(void *a1, const char *a2, ...)
{
  return [a1 performActionForShortcutItem:];
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:];
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:afterDelay:];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _[a1 persistentID];
}

id objc_msgSend_pickerView_didChangeSelectedDuration_(void *a1, const char *a2, ...)
{
  return [a1 pickerView:didChangeSelectedDuration:];
}

id objc_msgSend_pickerView_rowHeightForComponent_(void *a1, const char *a2, ...)
{
  return [a1 pickerView:rowHeightForComponent:];
}

id objc_msgSend_pickerView_widthForComponent_(void *a1, const char *a2, ...)
{
  return [a1 pickerView:widthForComponent:];
}

id objc_msgSend_pillButtonWithTitle_(void *a1, const char *a2, ...)
{
  return [a1 pillButtonWithTitle:];
}

id objc_msgSend_playWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 playWithCompletionHandler:];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_popTimerViewController(void *a1, const char *a2, ...)
{
  return _[a1 popTimerViewController];
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return [a1 popViewControllerAnimated:];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 popoverPresentationController];
}

id objc_msgSend_populateShortcutItems(void *a1, const char *a2, ...)
{
  return _[a1 populateShortcutItems];
}

id objc_msgSend_populateTabIndexes(void *a1, const char *a2, ...)
{
  return _[a1 populateTabIndexes];
}

id objc_msgSend_positionFromPosition_offset_(void *a1, const char *a2, ...)
{
  return [a1 positionFromPosition:offset:];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSize];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontForTextStyle:];
}

id objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontForTextStyle:];
}

id objc_msgSend_preferredHeight(void *a1, const char *a2, ...)
{
  return _[a1 preferredHeight];
}

id objc_msgSend_prepareStateForUrlLaunch(void *a1, const char *a2, ...)
{
  return _[a1 prepareStateForUrlLaunch];
}

id objc_msgSend_prepareTabBarControllerRestoreIndex_(void *a1, const char *a2, ...)
{
  return [a1 prepareTabBarControllerRestoreIndex];
}

id objc_msgSend_prepareUIForState_(void *a1, const char *a2, ...)
{
  return [a1 prepareUIForState:];
}

id objc_msgSend_prepareUIForState_forceRefresh_(void *a1, const char *a2, ...)
{
  return [a1 prepareUIForState:forceRefresh:];
}

id objc_msgSend_prepareUIForState_inCell_forceRefresh_(void *a1, const char *a2, ...)
{
  return [a1 prepareUIForState:inCell:forceRefresh:];
}

id objc_msgSend_prepopulateSuggestions(void *a1, const char *a2, ...)
{
  return _[a1 prepopulateSuggestions];
}

id objc_msgSend_presentSleepAlert_(void *a1, const char *a2, ...)
{
  return [a1 presentSleepAlert:];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:animated:completion:];
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _[a1 presentationController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingViewController];
}

id objc_msgSend_presetFlowLayout(void *a1, const char *a2, ...)
{
  return _[a1 presetFlowLayout];
}

id objc_msgSend_presetView(void *a1, const char *a2, ...)
{
  return _[a1 presetView];
}

id objc_msgSend_presetsController(void *a1, const char *a2, ...)
{
  return _[a1 presetsController];
}

id objc_msgSend_pressesBegan_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 pressesBegan:withEvent:];
}

id objc_msgSend_previewAudioVolume(void *a1, const char *a2, ...)
{
  return _[a1 previewAudioVolume];
}

id objc_msgSend_previousLapsTotalInterval(void *a1, const char *a2, ...)
{
  return _[a1 previousLapsTotalInterval];
}

id objc_msgSend_previouslyFocusedView(void *a1, const char *a2, ...)
{
  return _[a1 previouslyFocusedView];
}

id objc_msgSend_processCountdownState_previousState_remainingTime_duration_forceRefresh_(void *a1, const char *a2, ...)
{
  return [a1 processCountdownState:previousState:remainingTime:duration:forceRefresh:];
}

id objc_msgSend_prominentInsetGroupedHeaderConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 prominentInsetGroupedHeaderConfiguration];
}

id objc_msgSend_pushEvent_(void *a1, const char *a2, ...)
{
  return [a1 pushEvent:];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return [a1 pushViewController:animated:];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_recentView(void *a1, const char *a2, ...)
{
  return _[a1 recentView];
}

id objc_msgSend_recognizer(void *a1, const char *a2, ...)
{
  return _[a1 recognizer];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_refreshUI_animated_(void *a1, const char *a2, ...)
{
  return [a1 refreshUI:animated:];
}

id objc_msgSend_refreshWithSleepMetadata_(void *a1, const char *a2, ...)
{
  return [a1 refreshWithSleepMetadata:];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forCellReuseIdentifier:];
}

id objc_msgSend_registerClass_forCellWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forCellWithReuseIdentifier:];
}

id objc_msgSend_registerClass_forHeaderFooterViewReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forHeaderFooterViewReuseIdentifier:];
}

id objc_msgSend_registerClass_forSupplementaryViewOfKind_withReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forSupplementaryViewOfKind:withReuseIdentifier:];
}

id objc_msgSend_registerClock_(void *a1, const char *a2, ...)
{
  return [a1 registerClock];
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return [a1 registerObserver:];
}

id objc_msgSend_regularLayoutConstraints(void *a1, const char *a2, ...)
{
  return _[a1 regularLayoutConstraints];
}

id objc_msgSend_reloadAlarmWidgetTimeline(void *a1, const char *a2, ...)
{
  return _[a1 reloadAlarmWidgetTimeline];
}

id objc_msgSend_reloadAlarms(void *a1, const char *a2, ...)
{
  return _[a1 reloadAlarms];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_reloadDataFuture(void *a1, const char *a2, ...)
{
  return _[a1 reloadDataFuture];
}

id objc_msgSend_reloadSections(void *a1, const char *a2, ...)
{
  return _[a1 reloadSections];
}

id objc_msgSend_reloadSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return [a1 reloadSections:withRowAnimation:];
}

id objc_msgSend_reloadState(void *a1, const char *a2, ...)
{
  return _[a1 reloadState];
}

id objc_msgSend_reloadState_(void *a1, const char *a2, ...)
{
  return [a1 reloadState:];
}

id objc_msgSend_reloadStopwatchesWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 reloadStopwatchesWithCompletion:];
}

id objc_msgSend_reloadTimerDurations(void *a1, const char *a2, ...)
{
  return _[a1 reloadTimerDurations];
}

id objc_msgSend_reloadTimerState(void *a1, const char *a2, ...)
{
  return _[a1 reloadTimerState];
}

id objc_msgSend_reloadTimerUI(void *a1, const char *a2, ...)
{
  return _[a1 reloadTimerUI];
}

id objc_msgSend_reloadTimers(void *a1, const char *a2, ...)
{
  return _[a1 reloadTimers];
}

id objc_msgSend_remainingTime(void *a1, const char *a2, ...)
{
  return _[a1 remainingTime];
}

id objc_msgSend_removeAlarm_(void *a1, const char *a2, ...)
{
  return [a1 removeAlarm:];
}

id objc_msgSend_removeAlarmAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 removeAlarmAtIndexPath:];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeCity_(void *a1, const char *a2, ...)
{
  return [a1 removeCity:];
}

id objc_msgSend_removeCityAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeCityAtIndex:];
}

id objc_msgSend_removeCityAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 removeCityAtIndexPath:];
}

id objc_msgSend_removeCityWithoutUserInteraction_(void *a1, const char *a2, ...)
{
  return [a1 removeCityWithoutUserInteraction];
}

id objc_msgSend_removeConstraints_(void *a1, const char *a2, ...)
{
  return [a1 removeConstraints:];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeLayoutGuide_(void *a1, const char *a2, ...)
{
  return [a1 removeLayoutGuide];
}

id objc_msgSend_removeNotificationObserver(void *a1, const char *a2, ...)
{
  return _[a1 removeNotificationObserver];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeRecentDuration_(void *a1, const char *a2, ...)
{
  return [a1 removeRecentDuration:];
}

id objc_msgSend_removeTimer_(void *a1, const char *a2, ...)
{
  return [a1 removeTimer:];
}

id objc_msgSend_renderViewModel(void *a1, const char *a2, ...)
{
  return _[a1 renderViewModel];
}

id objc_msgSend_repeatLabel(void *a1, const char *a2, ...)
{
  return _[a1 repeatLabel];
}

id objc_msgSend_repeatSchedule(void *a1, const char *a2, ...)
{
  return _[a1 repeatSchedule];
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return [a1 replaceObjectAtIndex:withObject:];
}

id objc_msgSend_reschedule_(void *a1, const char *a2, ...)
{
  return [a1 reschedule:];
}

id objc_msgSend_resetLapTimer(void *a1, const char *a2, ...)
{
  return _[a1 resetLapTimer];
}

id objc_msgSend_resetLapTimerUI(void *a1, const char *a2, ...)
{
  return _[a1 resetLapTimerUI];
}

id objc_msgSend_resetLayout(void *a1, const char *a2, ...)
{
  return _[a1 resetLayout];
}

id objc_msgSend_resignCurrent(void *a1, const char *a2, ...)
{
  return _[a1 resignCurrent];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_resizeCityViews(void *a1, const char *a2, ...)
{
  return _[a1 resizeCityViews];
}

id objc_msgSend_resourceSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 resourceSpecifier];
}

id objc_msgSend_restoreAlarmTabEditMode(void *a1, const char *a2, ...)
{
  return _[a1 restoreAlarmTabEditMode];
}

id objc_msgSend_restoreIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 restoreIndexPath:];
}

id objc_msgSend_restoreLastEventWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 restoreLastEventWithCompletion:];
}

id objc_msgSend_restoreLastSelectedTabIndex(void *a1, const char *a2, ...)
{
  return _[a1 restoreLastSelectedTabIndex];
}

id objc_msgSend_restoreState(void *a1, const char *a2, ...)
{
  return _[a1 restoreState];
}

id objc_msgSend_restoreWithUserActivity_(void *a1, const char *a2, ...)
{
  return [a1 restoreWithUserActivity:];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumeLapTimer(void *a1, const char *a2, ...)
{
  return _[a1 resumeLapTimer];
}

id objc_msgSend_resumeLapTimerUI(void *a1, const char *a2, ...)
{
  return _[a1 resumeLapTimerUI];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 rightAnchor];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 rightBarButtonItem];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_rootViewControllerForTab_(void *a1, const char *a2, ...)
{
  return [a1 rootViewControllerForTab:];
}

id objc_msgSend_rotateIfNeeded_(void *a1, const char *a2, ...)
{
  return [a1 rotateIfNeeded:];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_rowForAlarm_(void *a1, const char *a2, ...)
{
  return [a1 rowForAlarm:];
}

id objc_msgSend_rowForAlarmWithID_(void *a1, const char *a2, ...)
{
  return [a1 rowForAlarmWithID:];
}

id objc_msgSend_rowForTimer_(void *a1, const char *a2, ...)
{
  return [a1 rowForTimer:];
}

id objc_msgSend_rowHeight(void *a1, const char *a2, ...)
{
  return _[a1 rowHeight];
}

id objc_msgSend_rowHeightWithCurrentAccessibilityConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 rowHeightWithCurrentAccessibilityConfiguration];
}

id objc_msgSend_rowsPerPage(void *a1, const char *a2, ...)
{
  return _[a1 rowsPerPage];
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return [a1 runTestWithParameters:];
}

id objc_msgSend_runUntilDate_(void *a1, const char *a2, ...)
{
  return [a1 runUntilDate:];
}

id objc_msgSend_runningTotal(void *a1, const char *a2, ...)
{
  return _[a1 runningTotal];
}

id objc_msgSend_runningTotalForLap_(void *a1, const char *a2, ...)
{
  return [a1 runningTotalForLap:];
}

id objc_msgSend_runningTotalLabel(void *a1, const char *a2, ...)
{
  return _[a1 runningTotalLabel];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaLayoutGuide];
}

id objc_msgSend_saveAlarmOnlyIfEdited_(void *a1, const char *a2, ...)
{
  return [a1 saveAlarmOnlyIfEdited:];
}

id objc_msgSend_saveCities(void *a1, const char *a2, ...)
{
  return _[a1 saveCities];
}

id objc_msgSend_saveLastIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 saveLastIndexPath];
}

id objc_msgSend_saveState(void *a1, const char *a2, ...)
{
  return _[a1 saveState];
}

id objc_msgSend_scene_continueUserActivity_(void *a1, const char *a2, ...)
{
  return [a1 scene:continueUserActivity:];
}

id objc_msgSend_scene_didFailToContinueUserActivityWithType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene:didFailToContinueUserActivityWithType:error:");
}

id objc_msgSend_scene_openURL_sourceApplication_(void *a1, const char *a2, ...)
{
  return [a1 scene:openURL:sourceApplication:];
}

id objc_msgSend_scene_openURLContexts_(void *a1, const char *a2, ...)
{
  return [a1 scene:openURLContexts:];
}

id objc_msgSend_scene_willContinueUserActivityWithType_(void *a1, const char *a2, ...)
{
  return [a1 scene:willContinueUserActivityWithType:];
}

id objc_msgSend_sceneDidBecomeActive_(void *a1, const char *a2, ...)
{
  return [a1 sceneDidBecomeActive:];
}

id objc_msgSend_sceneDidEnterBackground_(void *a1, const char *a2, ...)
{
  return [a1 sceneDidEnterBackground:];
}

id objc_msgSend_sceneWillEnterForeground_(void *a1, const char *a2, ...)
{
  return [a1 sceneWillEnterForeground:];
}

id objc_msgSend_sceneWillResignActive_(void *a1, const char *a2, ...)
{
  return [a1 sceneWillResignActive:];
}

id objc_msgSend_scheduleTerminatorUpdate(void *a1, const char *a2, ...)
{
  return _[a1 scheduleTerminatorUpdate];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_scrollDirection(void *a1, const char *a2, ...)
{
  return _[a1 scrollDirection];
}

id objc_msgSend_scrollToCityAtIndex_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToCityAtIndex:animated:");
}

id objc_msgSend_scrollToItemAtIndexPath_atScrollPosition_animated_(void *a1, const char *a2, ...)
{
  return [a1 scrollToItemAtIndexPath:atScrollPosition:animated:];
}

id objc_msgSend_scrollToPageContainingIndexPath_animated_(void *a1, const char *a2, ...)
{
  return [a1 scrollToPageContainingIndexPath:animated:];
}

id objc_msgSend_scrollToRowAtIndexPath_atScrollPosition_animated_(void *a1, const char *a2, ...)
{
  return [a1 scrollToRowAtIndexPath:atScrollPosition:animated:];
}

id objc_msgSend_scrollToSavedPoint(void *a1, const char *a2, ...)
{
  return _[a1 scrollToSavedPoint];
}

id objc_msgSend_scrollToTop(void *a1, const char *a2, ...)
{
  return _[a1 scrollToTop];
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _[a1 scrollView];
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return _[a1 searchBar];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _[a1 second];
}

id objc_msgSend_secondHighlightFrame(void *a1, const char *a2, ...)
{
  return _[a1 secondHighlightFrame];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_secondaryLabelFont(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelFont];
}

id objc_msgSend_secondsFromGMTForDate_(void *a1, const char *a2, ...)
{
  return [a1 secondsFromGMTForDate:];
}

id objc_msgSend_secondsHand(void *a1, const char *a2, ...)
{
  return _[a1 secondsHand];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sectionFooterHeight(void *a1, const char *a2, ...)
{
  return _[a1 sectionFooterHeight];
}

id objc_msgSend_sectionForObject_collationStringSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionForObject:collationStringSelector:");
}

id objc_msgSend_sectionForSectionIndexTitleAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 sectionForSectionIndexTitleAtIndex:];
}

id objc_msgSend_sectionHeaderConfigurationWithTitle_isRTL_(void *a1, const char *a2, ...)
{
  return [a1 sectionHeaderConfigurationWithTitle:isRTL:];
}

id objc_msgSend_sectionHeaderHeight(void *a1, const char *a2, ...)
{
  return _[a1 sectionHeaderHeight];
}

id objc_msgSend_sectionIndexTitles(void *a1, const char *a2, ...)
{
  return _[a1 sectionIndexTitles];
}

id objc_msgSend_sectionTitles(void *a1, const char *a2, ...)
{
  return _[a1 sectionTitles];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return _[a1 sections];
}

id objc_msgSend_selectRow_inComponent_animated_(void *a1, const char *a2, ...)
{
  return [a1 selectRow:inComponent:animated:];
}

id objc_msgSend_selectedDuration(void *a1, const char *a2, ...)
{
  return _[a1 selectedDuration];
}

id objc_msgSend_selectedField(void *a1, const char *a2, ...)
{
  return _[a1 selectedField];
}

id objc_msgSend_selectedIndex(void *a1, const char *a2, ...)
{
  return _[a1 selectedIndex];
}

id objc_msgSend_selectedRowInComponent_(void *a1, const char *a2, ...)
{
  return [a1 selectedRowInComponent:];
}

id objc_msgSend_selectedToneIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 selectedToneIdentifier];
}

id objc_msgSend_selectedViewController(void *a1, const char *a2, ...)
{
  return _[a1 selectedViewController];
}

id objc_msgSend_separatorInset(void *a1, const char *a2, ...)
{
  return _[a1 separatorInset];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityIdentifier:];
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryType:];
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryView:];
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return [a1 setAction:];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:];
}

id objc_msgSend_setAddEditAlarmController_(void *a1, const char *a2, ...)
{
  return [a1 setAddEditAlarmController:];
}

id objc_msgSend_setAddEditTimerController_(void *a1, const char *a2, ...)
{
  return [a1 setAddEditTimerController:];
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsFontForContentSizeCategory:];
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsFontSizeToFitWidth:];
}

id objc_msgSend_setAdjustsImageWhenHighlighted_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsImageWhenHighlighted:];
}

id objc_msgSend_setAlarm_(void *a1, const char *a2, ...)
{
  return [a1 setAlarm:];
}

id objc_msgSend_setAlarmEditViewController_(void *a1, const char *a2, ...)
{
  return [a1 setAlarmEditViewController:];
}

id objc_msgSend_setAlarmEnabled_forCell_(void *a1, const char *a2, ...)
{
  return [a1 setAlarmEnabled:forCell:];
}

id objc_msgSend_setAlarmManager_(void *a1, const char *a2, ...)
{
  return [a1 setAlarmManager:];
}

id objc_msgSend_setAlarmVolume_(void *a1, const char *a2, ...)
{
  return [a1 setAlarmVolume:];
}

id objc_msgSend_setAlarmsLoadedAction_(void *a1, const char *a2, ...)
{
  return [a1 setAlarmsLoadedAction:];
}

id objc_msgSend_setAlert_(void *a1, const char *a2, ...)
{
  return [a1 setAlert:];
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setAlignment:];
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedUnits:];
}

id objc_msgSend_setAllowsSelection_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsSelection:];
}

id objc_msgSend_setAllowsSelectionDuringEditing_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsSelectionDuringEditing:];
}

id objc_msgSend_setAllowsSnooze_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsSnooze:];
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setAlpha:];
}

id objc_msgSend_setAlwaysBounceVertical_(void *a1, const char *a2, ...)
{
  return [a1 setAlwaysBounceVertical:];
}

id objc_msgSend_setAnalogClock_(void *a1, const char *a2, ...)
{
  return [a1 setAnalogClock:];
}

id objc_msgSend_setAnalogStopwatch_(void *a1, const char *a2, ...)
{
  return [a1 setAnalogStopwatch];
}

id objc_msgSend_setAnalogStopwatchContainer_(void *a1, const char *a2, ...)
{
  return [a1 setAnalogStopwatchContainer:];
}

id objc_msgSend_setAnchorStyle_(void *a1, const char *a2, ...)
{
  return [a1 setAnchorStyle:];
}

id objc_msgSend_setAngle_(void *a1, const char *a2, ...)
{
  return [a1 setAngle:];
}

id objc_msgSend_setAnimationBeginsFromCurrentState_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationBeginsFromCurrentState:];
}

id objc_msgSend_setAnimationCurve_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationCurve:];
}

id objc_msgSend_setAnimationDuration_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationDuration:];
}

id objc_msgSend_setAnimationRemainingTime_totalTime_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationRemainingTime:totalTime:];
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedText:];
}

id objc_msgSend_setAudioVolume_(void *a1, const char *a2, ...)
{
  return [a1 setAudioVolume:];
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return [a1 setAutocapitalizationType:];
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return [a1 setAutocorrectionType:];
}

id objc_msgSend_setAutomaticallyAdjustsScrollViewInsets_(void *a1, const char *a2, ...)
{
  return [a1 setAutomaticallyAdjustsScrollViewInsets:];
}

id objc_msgSend_setAutoresizesSubviews_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizesSubviews:];
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizingMask:];
}

id objc_msgSend_setBackButtonTitle_(void *a1, const char *a2, ...)
{
  return [a1 setBackButtonTitle:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBackgroundImage_forBarPosition_barMetrics_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundImage:forBarPosition:barMetrics:];
}

id objc_msgSend_setBackgroundImage_forState_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundImage:forState:];
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundView:];
}

id objc_msgSend_setBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setBarButtonItem:];
}

id objc_msgSend_setBarStyle_(void *a1, const char *a2, ...)
{
  return [a1 setBarStyle:];
}

id objc_msgSend_setBaseForegroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBaseForegroundColor:];
}

id objc_msgSend_setBaselineAdjustment_(void *a1, const char *a2, ...)
{
  return [a1 setBaselineAdjustment:];
}

id objc_msgSend_setBaselineRelativeLayoutMarginsForArrangement_(void *a1, const char *a2, ...)
{
  return [a1 setBaselineRelativeLayoutMarginsForArrangement:];
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return [a1 setBorderColor:];
}

id objc_msgSend_setBorderStyle_(void *a1, const char *a2, ...)
{
  return [a1 setBorderStyle:];
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return [a1 setBorderWidth:];
}

id objc_msgSend_setBottomKeylineView_(void *a1, const char *a2, ...)
{
  return [a1 setBottomKeylineView:];
}

id objc_msgSend_setButtonCircleSize_(void *a1, const char *a2, ...)
{
  return [a1 setButtonCircleSize:];
}

id objc_msgSend_setButtonSize_(void *a1, const char *a2, ...)
{
  return [a1 setButtonSize:];
}

id objc_msgSend_setByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 setByAddingObjectsFromArray:];
}

id objc_msgSend_setBypassReloadDate_(void *a1, const char *a2, ...)
{
  return [a1 setBypassReloadDate:];
}

id objc_msgSend_setCalendar_(void *a1, const char *a2, ...)
{
  return [a1 setCalendar:];
}

id objc_msgSend_setCellLayoutMarginsFollowReadableWidth_(void *a1, const char *a2, ...)
{
  return [a1 setCellLayoutMarginsFollowReadableWidth:];
}

id objc_msgSend_setCellStyle_(void *a1, const char *a2, ...)
{
  return [a1 setCellStyle:];
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return [a1 setCenter:];
}

id objc_msgSend_setCenterNoResultsFoundLabelConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setCenterNoResultsFoundLabelConstraints:];
}

id objc_msgSend_setChangeButton_(void *a1, const char *a2, ...)
{
  return [a1 setChangeButton:];
}

id objc_msgSend_setCircleView_(void *a1, const char *a2, ...)
{
  return [a1 setCircleView:];
}

id objc_msgSend_setCities_(void *a1, const char *a2, ...)
{
  return [a1 setCities:];
}

id objc_msgSend_setCity_(void *a1, const char *a2, ...)
{
  return [a1 setCity:];
}

id objc_msgSend_setCityNameLabel_(void *a1, const char *a2, ...)
{
  return [a1 setCityNameLabel:];
}

id objc_msgSend_setClassicTones_(void *a1, const char *a2, ...)
{
  return [a1 setClassicTones:];
}

id objc_msgSend_setClearButtonMode_(void *a1, const char *a2, ...)
{
  return [a1 setClearButtonMode:];
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setClipsToBounds:];
}

id objc_msgSend_setClockLabelBaselineToTopConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setClockLabelBaselineToTopConstraint:];
}

id objc_msgSend_setClockLabelDetailLabelSpaceConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setClockLabelDetailLabelSpaceConstraint:];
}

id objc_msgSend_setClockLabelHeightConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setClockLabelHeightConstraint:];
}

id objc_msgSend_setCollectionBottomConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setCollectionBottomConstraint:];
}

id objc_msgSend_setCollectionViewController_(void *a1, const char *a2, ...)
{
  return [a1 setCollectionViewController:];
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return [a1 setColor:];
}

id objc_msgSend_setColumnSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setColumnSpacing:];
}

id objc_msgSend_setColumnsPerPage_(void *a1, const char *a2, ...)
{
  return [a1 setColumnsPerPage:];
}

id objc_msgSend_setComponentColor_(void *a1, const char *a2, ...)
{
  return [a1 setComponentColor:];
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setConfiguration:];
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return [a1 setConstant:];
}

id objc_msgSend_setConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setConstraints:];
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return [a1 setContentCompressionResistancePriority:forAxis:];
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setContentConfiguration:];
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return [a1 setContentHuggingPriority:forAxis:];
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return [a1 setContentInset:];
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return [a1 setContentOffset:];
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return [a1 setContentOffset:animated:];
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setContentSize:];
}

id objc_msgSend_setContentString_(void *a1, const char *a2, ...)
{
  return [a1 setContentString:];
}

id objc_msgSend_setControlButton_(void *a1, const char *a2, ...)
{
  return [a1 setControlButton:];
}

id objc_msgSend_setControlsView_(void *a1, const char *a2, ...)
{
  return [a1 setControlsView:];
}

id objc_msgSend_setControlsViewDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setControlsViewDelegate:];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCornerStyle_(void *a1, const char *a2, ...)
{
  return [a1 setCornerStyle:];
}

id objc_msgSend_setCountDownDuration_(void *a1, const char *a2, ...)
{
  return [a1 setCountDownDuration:];
}

id objc_msgSend_setCountDownLabel_(void *a1, const char *a2, ...)
{
  return [a1 setCountDownLabel:];
}

id objc_msgSend_setCountDownView_(void *a1, const char *a2, ...)
{
  return [a1 setCountDownView:];
}

id objc_msgSend_setCurrentInterval_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentInterval:];
}

id objc_msgSend_setCurrentLabel_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentLabel:];
}

id objc_msgSend_setCurrentLapCell_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentLapCell:];
}

id objc_msgSend_setCurrentLapTime_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentLapTime:];
}

id objc_msgSend_setCurrentPage_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentPage:];
}

id objc_msgSend_setCurrentPage_animated_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentPage:animated:];
}

id objc_msgSend_setCurrentTitle_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentTitle:];
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return [a1 setDataSource:];
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return [a1 setDate:];
}

id objc_msgSend_setDatePickerMode_(void *a1, const char *a2, ...)
{
  return [a1 setDatePickerMode:];
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return [a1 setDateStyle:];
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return [a1 setDay:];
}

id objc_msgSend_setDeadZone_(void *a1, const char *a2, ...)
{
  return [a1 setDeadZone:];
}

id objc_msgSend_setDefaultDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultDuration:];
}

id objc_msgSend_setDefaultSound_forCategory_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultSound:forCategory:];
}

id objc_msgSend_setDefaultTone_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultTone:];
}

id objc_msgSend_setDefaultToneIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultToneIdentifier:];
}

id objc_msgSend_setDefaultVibrationIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultVibrationIdentifier:];
}

id objc_msgSend_setDeferAddedCity_(void *a1, const char *a2, ...)
{
  return [a1 setDeferAddedCity:];
}

id objc_msgSend_setDeferRemovedCity_(void *a1, const char *a2, ...)
{
  return [a1 setDeferRemovedCity:];
}

id objc_msgSend_setDeferredAddingAlarm_(void *a1, const char *a2, ...)
{
  return [a1 setDeferredAddingAlarm:];
}

id objc_msgSend_setDeferredAddingTimer_(void *a1, const char *a2, ...)
{
  return [a1 setDeferredAddingTimer:];
}

id objc_msgSend_setDeferredEditingAction_(void *a1, const char *a2, ...)
{
  return [a1 setDeferredEditingAction:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDelegate_duration_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:duration:];
}

id objc_msgSend_setDelegateClass_(void *a1, const char *a2, ...)
{
  return [a1 setDelegateClass:];
}

id objc_msgSend_setDeleteButton_(void *a1, const char *a2, ...)
{
  return [a1 setDeleteButton:];
}

id objc_msgSend_setDigitalStopwatchContainer_(void *a1, const char *a2, ...)
{
  return [a1 setDigitalStopwatchContainer:];
}

id objc_msgSend_setDirectionalLayoutMargins_(void *a1, const char *a2, ...)
{
  return [a1 setDirectionalLayoutMargins:];
}

id objc_msgSend_setDisplayAdjustedElapsedTime_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayAdjustedElapsedTime:];
}

id objc_msgSend_setDotImageView_(void *a1, const char *a2, ...)
{
  return [a1 setDotImageView:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setDurationFormatter_(void *a1, const char *a2, ...)
{
  return [a1 setDurationFormatter:];
}

id objc_msgSend_setDurationLabel_(void *a1, const char *a2, ...)
{
  return [a1 setDurationLabel:];
}

id objc_msgSend_setDurationTime_title_(void *a1, const char *a2, ...)
{
  return [a1 setDurationTime:title:];
}

id objc_msgSend_setDurationWithInterval_(void *a1, const char *a2, ...)
{
  return [a1 setDurationWithInterval:];
}

id objc_msgSend_setEdgesForExtendedLayout_(void *a1, const char *a2, ...)
{
  return [a1 setEdgesForExtendedLayout:];
}

id objc_msgSend_setEdited_(void *a1, const char *a2, ...)
{
  return [a1 setEdited:];
}

id objc_msgSend_setEditedAlarm_(void *a1, const char *a2, ...)
{
  return [a1 setEditedAlarm:];
}

id objc_msgSend_setEditing_(void *a1, const char *a2, ...)
{
  return [a1 setEditing:];
}

id objc_msgSend_setEditing_animated_(void *a1, const char *a2, ...)
{
  return [a1 setEditing:animated:];
}

id objc_msgSend_setEditingAccessoryType_(void *a1, const char *a2, ...)
{
  return [a1 setEditingAccessoryType:];
}

id objc_msgSend_setElapsedTime_(void *a1, const char *a2, ...)
{
  return [a1 setElapsedTime:];
}

id objc_msgSend_setEnableSwitch_(void *a1, const char *a2, ...)
{
  return [a1 setEnableSwitch:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setEnabledSwitch_(void *a1, const char *a2, ...)
{
  return [a1 setEnabledSwitch:];
}

id objc_msgSend_setEnablesReturnKeyAutomatically_(void *a1, const char *a2, ...)
{
  return [a1 setEnablesReturnKeyAutomatically:];
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return [a1 setEstimatedRowHeight:];
}

id objc_msgSend_setEventType_(void *a1, const char *a2, ...)
{
  return [a1 setEventType:];
}

id objc_msgSend_setFeatureStore_(void *a1, const char *a2, ...)
{
  return [a1 setFeatureStore:];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setForPreview_(void *a1, const char *a2, ...)
{
  return [a1 setForPreview:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setHasTail_(void *a1, const char *a2, ...)
{
  return [a1 setHasTail:];
}

id objc_msgSend_setHeaderTitle_(void *a1, const char *a2, ...)
{
  return [a1 setHeaderTitle:];
}

id objc_msgSend_setHealthQueue_(void *a1, const char *a2, ...)
{
  return [a1 setHealthQueue:];
}

id objc_msgSend_setHealthStore_(void *a1, const char *a2, ...)
{
  return [a1 setHealthStore:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return [a1 setHighlighted:];
}

id objc_msgSend_setHighlightedBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setHighlightedBackgroundColor:];
}

id objc_msgSend_setHorizontalAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setHorizontalAlignment:];
}

id objc_msgSend_setHorizontalMapHeightConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setHorizontalMapHeightConstraint:];
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return [a1 setHour:];
}

id objc_msgSend_setHour_minute_(void *a1, const char *a2, ...)
{
  return [a1 setHour:minute:];
}

id objc_msgSend_setHourHighlightFrame_(void *a1, const char *a2, ...)
{
  return [a1 setHourHighlightFrame:];
}

id objc_msgSend_setHourMidX_(void *a1, const char *a2, ...)
{
  return [a1 setHourMidX:];
}

id objc_msgSend_setHoverStyle_(void *a1, const char *a2, ...)
{
  return [a1 setHoverStyle:];
}

id objc_msgSend_setIconPlacement_(void *a1, const char *a2, ...)
{
  return [a1 setIconPlacement:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setIdleTimerDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setIdleTimerDisabled:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return [a1 setImage:forState:];
}

id objc_msgSend_setIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 setIndexPath:];
}

id objc_msgSend_setIndicatorStyle_(void *a1, const char *a2, ...)
{
  return [a1 setIndicatorStyle:];
}

id objc_msgSend_setInstallsStandardGestureForInteractiveMovement_(void *a1, const char *a2, ...)
{
  return [a1 setInstallsStandardGestureForInteractiveMovement:];
}

id objc_msgSend_setIsRunningPPTTest_(void *a1, const char *a2, ...)
{
  return [a1 setIsRunningPPTTest:];
}

id objc_msgSend_setIsSleepAlarm_(void *a1, const char *a2, ...)
{
  return [a1 setIsSleepAlarm:];
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return [a1 setItems:];
}

id objc_msgSend_setKeyboardAppearance_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardAppearance:];
}

id objc_msgSend_setKeyboardDismissMode_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardDismissMode:];
}

id objc_msgSend_setKeyboardFrame_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardFrame:];
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardType:];
}

id objc_msgSend_setKeywords_(void *a1, const char *a2, ...)
{
  return [a1 setKeywords:];
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return [a1 setLabel:];
}

id objc_msgSend_setLap_(void *a1, const char *a2, ...)
{
  return [a1 setLap];
}

id objc_msgSend_setLapButtonOccludingView_(void *a1, const char *a2, ...)
{
  return [a1 setLapButtonOccludingView:];
}

id objc_msgSend_setLapButtonTopConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setLapButtonTopConstraint:];
}

id objc_msgSend_setLapButtonWidthConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setLapButtonWidthConstraint:];
}

id objc_msgSend_setLapLabel_(void *a1, const char *a2, ...)
{
  return [a1 setLapLabel:];
}

id objc_msgSend_setLapNumberLabel_(void *a1, const char *a2, ...)
{
  return [a1 setLapNumberLabel:];
}

id objc_msgSend_setLapNumberLabelBaselineBottomOffsetConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setLapNumberLabelBaselineBottomOffsetConstraint:];
}

id objc_msgSend_setLapNumberLabelBaselineTopOffsetConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setLapNumberLabelBaselineTopOffsetConstraint:];
}

id objc_msgSend_setLapSecondsHand_(void *a1, const char *a2, ...)
{
  return [a1 setLapSecondsHand:];
}

id objc_msgSend_setLapStyle_(void *a1, const char *a2, ...)
{
  return [a1 setLapStyle:];
}

id objc_msgSend_setLapTableController_(void *a1, const char *a2, ...)
{
  return [a1 setLapTableController:];
}

id objc_msgSend_setLapTimes_(void *a1, const char *a2, ...)
{
  return [a1 setLapTimes:];
}

id objc_msgSend_setLaps_(void *a1, const char *a2, ...)
{
  return [a1 setLaps:];
}

id objc_msgSend_setLargeTitleDisplayMode_(void *a1, const char *a2, ...)
{
  return [a1 setLargeTitleDisplayMode:];
}

id objc_msgSend_setLatestLayoutSize_(void *a1, const char *a2, ...)
{
  return [a1 setLatestLayoutSize:];
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutMargins:];
}

id objc_msgSend_setLayoutMarginsFollowReadableWidth_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutMarginsFollowReadableWidth:];
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setLeftBarButtonItem:];
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return [a1 setLength:];
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return [a1 setLineBreakMode:];
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return [a1 setLineWidth:];
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return [a1 setLocale:];
}

id objc_msgSend_setMapView_(void *a1, const char *a2, ...)
{
  return [a1 setMapView:];
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setMasksToBounds:];
}

id objc_msgSend_setMaximumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumContentSizeCategory:];
}

id objc_msgSend_setMaximumValueImage_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumValueImage:];
}

id objc_msgSend_setMediaAtTop_(void *a1, const char *a2, ...)
{
  return [a1 setMediaAtTop:];
}

id objc_msgSend_setMigrator_(void *a1, const char *a2, ...)
{
  return [a1 setMigrator:];
}

id objc_msgSend_setMinimumFontSize_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumFontSize:];
}

id objc_msgSend_setMinimumInteritemSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumInteritemSpacing:];
}

id objc_msgSend_setMinimumLineSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumLineSpacing:];
}

id objc_msgSend_setMinimumScaleFactor_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumScaleFactor:];
}

id objc_msgSend_setMinimumValueImage_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumValueImage:];
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return [a1 setMinute:];
}

id objc_msgSend_setMinuteHighlightFrame_(void *a1, const char *a2, ...)
{
  return [a1 setMinuteHighlightFrame:];
}

id objc_msgSend_setMinuteMidX_(void *a1, const char *a2, ...)
{
  return [a1 setMinuteMidX:];
}

id objc_msgSend_setMinutesHand_(void *a1, const char *a2, ...)
{
  return [a1 setMinutesHand];
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setModalPresentationStyle:];
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return [a1 setMode:];
}

id objc_msgSend_setModernTones_(void *a1, const char *a2, ...)
{
  return [a1 setModernTones:];
}

id objc_msgSend_setMonth_(void *a1, const char *a2, ...)
{
  return [a1 setMonth:];
}

id objc_msgSend_setNameLabel_(void *a1, const char *a2, ...)
{
  return [a1 setNameLabel:];
}

id objc_msgSend_setNavigationBarHidden_(void *a1, const char *a2, ...)
{
  return [a1 setNavigationBarHidden:];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsStatusBarAppearanceUpdate];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setNoItemsView_(void *a1, const char *a2, ...)
{
  return [a1 setNoItemsView:];
}

id objc_msgSend_setNoResultsFoundLabel_(void *a1, const char *a2, ...)
{
  return [a1 setNoResultsFoundLabel:];
}

id objc_msgSend_setNoneString_(void *a1, const char *a2, ...)
{
  return [a1 setNoneString:];
}

id objc_msgSend_setNormalBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setNormalBackgroundColor:];
}

id objc_msgSend_setNumber_(void *a1, const char *a2, ...)
{
  return [a1 setNumber:];
}

id objc_msgSend_setNumberFormatter_(void *a1, const char *a2, ...)
{
  return [a1 setNumberFormatter:];
}

id objc_msgSend_setNumberLabel_(void *a1, const char *a2, ...)
{
  return [a1 setNumberLabel:];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfLines:];
}

id objc_msgSend_setNumberOfPages_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfPages:];
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return [a1 setNumberStyle:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOn_(void *a1, const char *a2, ...)
{
  return [a1 setOn:];
}

id objc_msgSend_setOn_animated_(void *a1, const char *a2, ...)
{
  return [a1 setOn:animated:];
}

id objc_msgSend_setOnTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setOnTintColor:];
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return [a1 setOpaque:];
}

id objc_msgSend_setOverrideTraitCollection_forChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideTraitCollection:forChildViewController:];
}

id objc_msgSend_setPageControl_(void *a1, const char *a2, ...)
{
  return [a1 setPageControl:];
}

id objc_msgSend_setPages_(void *a1, const char *a2, ...)
{
  return [a1 setPages:];
}

id objc_msgSend_setPagingEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setPagingEnabled:];
}

id objc_msgSend_setPagingViewController_(void *a1, const char *a2, ...)
{
  return [a1 setPagingViewController:];
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return [a1 setPath:];
}

id objc_msgSend_setPauseResumeButton_(void *a1, const char *a2, ...)
{
  return [a1 setPauseResumeButton:];
}

id objc_msgSend_setPermittedArrowDirections_(void *a1, const char *a2, ...)
{
  return [a1 setPermittedArrowDirections:];
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return [a1 setPlaceholder:];
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredContentSize:];
}

id objc_msgSend_setPreferredDatePickerStyle_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredDatePickerStyle:];
}

id objc_msgSend_setPreferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredStyle:];
}

id objc_msgSend_setPrefersLargeTitles_(void *a1, const char *a2, ...)
{
  return [a1 setPrefersLargeTitles:];
}

id objc_msgSend_setPreservesSuperviewLayoutMargins_(void *a1, const char *a2, ...)
{
  return [a1 setPreservesSuperviewLayoutMargins:];
}

id objc_msgSend_setPresetItem_(void *a1, const char *a2, ...)
{
  return [a1 setPresetItem:];
}

id objc_msgSend_setPresetView_(void *a1, const char *a2, ...)
{
  return [a1 setPresetView:];
}

id objc_msgSend_setPresetsController_(void *a1, const char *a2, ...)
{
  return [a1 setPresetsController:];
}

id objc_msgSend_setPresetsDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setPresetsDelegate:];
}

id objc_msgSend_setPreviousLapsTotalInterval_(void *a1, const char *a2, ...)
{
  return [a1 setPreviousLapsTotalInterval:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setPrompt_(void *a1, const char *a2, ...)
{
  return [a1 setPrompt:];
}

id objc_msgSend_setRecentView_(void *a1, const char *a2, ...)
{
  return [a1 setRecentView:];
}

id objc_msgSend_setRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 setRecognizer:];
}

id objc_msgSend_setReloadDataFuture_(void *a1, const char *a2, ...)
{
  return [a1 setReloadDataFuture:];
}

id objc_msgSend_setRemainingTime_duration_state_title_forceRefresh_(void *a1, const char *a2, ...)
{
  return [a1 setRemainingTime:duration:state:title:forceRefresh:];
}

id objc_msgSend_setRepeatLabel_(void *a1, const char *a2, ...)
{
  return [a1 setRepeatLabel:];
}

id objc_msgSend_setRepeatSchedule_(void *a1, const char *a2, ...)
{
  return [a1 setRepeatSchedule:];
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return [a1 setReturnKeyType:];
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setRightBarButtonItem:];
}

id objc_msgSend_setRole_(void *a1, const char *a2, ...)
{
  return [a1 setRole:];
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRootViewController:];
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return [a1 setRowHeight:];
}

id objc_msgSend_setRowsPerPage_(void *a1, const char *a2, ...)
{
  return [a1 setRowsPerPage:];
}

id objc_msgSend_setRunMode_(void *a1, const char *a2, ...)
{
  return [a1 setRunMode:];
}

id objc_msgSend_setRunningTotal_(void *a1, const char *a2, ...)
{
  return [a1 setRunningTotal:];
}

id objc_msgSend_setRunningTotalLabel_(void *a1, const char *a2, ...)
{
  return [a1 setRunningTotalLabel:];
}

id objc_msgSend_setScrollDirection_(void *a1, const char *a2, ...)
{
  return [a1 setScrollDirection:];
}

id objc_msgSend_setScrollEdgeAppearance_(void *a1, const char *a2, ...)
{
  return [a1 setScrollEdgeAppearance:];
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setScrollEnabled:];
}

id objc_msgSend_setScrollIndicatorInsets_(void *a1, const char *a2, ...)
{
  return [a1 setScrollIndicatorInsets:];
}

id objc_msgSend_setScrollView_(void *a1, const char *a2, ...)
{
  return [a1 setScrollView:];
}

id objc_msgSend_setSearchBarStyle_(void *a1, const char *a2, ...)
{
  return [a1 setSearchBarStyle:];
}

id objc_msgSend_setSecond_(void *a1, const char *a2, ...)
{
  return [a1 setSecond:];
}

id objc_msgSend_setSecondHighlightFrame_(void *a1, const char *a2, ...)
{
  return [a1 setSecondHighlightFrame:];
}

id objc_msgSend_setSecondMidX_(void *a1, const char *a2, ...)
{
  return [a1 setSecondMidX:];
}

id objc_msgSend_setSecondsHand_(void *a1, const char *a2, ...)
{
  return [a1 setSecondsHand:];
}

id objc_msgSend_setSectionIndexBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setSectionIndexBackgroundColor:];
}

id objc_msgSend_setSectionIndexColor_(void *a1, const char *a2, ...)
{
  return [a1 setSectionIndexColor:];
}

id objc_msgSend_setSections_(void *a1, const char *a2, ...)
{
  return [a1 setSections:];
}

id objc_msgSend_setSelectedBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedBackgroundColor:];
}

id objc_msgSend_setSelectedField_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedField:];
}

id objc_msgSend_setSelectedIndex_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedIndex:];
}

id objc_msgSend_setSelectedMediaIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedMediaIdentifier:];
}

id objc_msgSend_setSelectedToneIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedToneIdentifier:];
}

id objc_msgSend_setSelectedVibrationIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedVibrationIdentifier:];
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return [a1 setSelectionStyle:];
}

id objc_msgSend_setSeparatorColor_(void *a1, const char *a2, ...)
{
  return [a1 setSeparatorColor:];
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return [a1 setSeparatorInset:];
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return [a1 setSeparatorStyle:];
}

id objc_msgSend_setSetupButton_(void *a1, const char *a2, ...)
{
  return [a1 setSetupButton:];
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return [a1 setShadowColor:];
}

id objc_msgSend_setShape_(void *a1, const char *a2, ...)
{
  return [a1 setShape:];
}

id objc_msgSend_setShortcutItems_(void *a1, const char *a2, ...)
{
  return [a1 setShortcutItems:];
}

id objc_msgSend_setShouldEnableStartButton_(void *a1, const char *a2, ...)
{
  return [a1 setShouldEnableStartButton:];
}

id objc_msgSend_setShouldHandleTimerReload_(void *a1, const char *a2, ...)
{
  return [a1 setShouldHandleTimerReload:];
}

id objc_msgSend_setShouldRepeat_(void *a1, const char *a2, ...)
{
  return [a1 setShouldRepeat:];
}

id objc_msgSend_setShowsCurrentLap_(void *a1, const char *a2, ...)
{
  return [a1 setShowsCurrentLap:];
}

id objc_msgSend_setShowsEditButtonInNavigationBar_(void *a1, const char *a2, ...)
{
  return [a1 setShowsEditButtonInNavigationBar:];
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return [a1 setShowsHorizontalScrollIndicator:];
}

id objc_msgSend_setShowsMedia_(void *a1, const char *a2, ...)
{
  return [a1 setShowsMedia:];
}

id objc_msgSend_setShowsNone_(void *a1, const char *a2, ...)
{
  return [a1 setShowsNone:];
}

id objc_msgSend_setShowsReorderControl_(void *a1, const char *a2, ...)
{
  return [a1 setShowsReorderControl:];
}

id objc_msgSend_setShowsToneStore_(void *a1, const char *a2, ...)
{
  return [a1 setShowsToneStore:];
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return [a1 setShowsVerticalScrollIndicator:];
}

id objc_msgSend_setShowsVibrations_(void *a1, const char *a2, ...)
{
  return [a1 setShowsVibrations:];
}

id objc_msgSend_setSiriTipView_(void *a1, const char *a2, ...)
{
  return [a1 setSiriTipView:];
}

id objc_msgSend_setSiriTipsController_(void *a1, const char *a2, ...)
{
  return [a1 setSiriTipsController:];
}

id objc_msgSend_setSleepCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 setSleepCoordinator:];
}

id objc_msgSend_setSleepDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setSleepDelegate:];
}

id objc_msgSend_setSleepSchedule_(void *a1, const char *a2, ...)
{
  return [a1 setSleepSchedule:];
}

id objc_msgSend_setSleepStore_(void *a1, const char *a2, ...)
{
  return [a1 setSleepStore:];
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return [a1 setSound:];
}

id objc_msgSend_setSoundLabel_(void *a1, const char *a2, ...)
{
  return [a1 setSoundLabel:];
}

id objc_msgSend_setSourceRect_(void *a1, const char *a2, ...)
{
  return [a1 setSourceRect:];
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return [a1 setSourceView:];
}

id objc_msgSend_setSplitLabel_(void *a1, const char *a2, ...)
{
  return [a1 setSplitLabel:];
}

id objc_msgSend_setStartButtonOccludingView_(void *a1, const char *a2, ...)
{
  return [a1 setStartButtonOccludingView:];
}

id objc_msgSend_setStartButtonTopConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setStartButtonTopConstraint:];
}

id objc_msgSend_setStartButtonWidthConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setStartButtonWidthConstraint:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setState_animate_(void *a1, const char *a2, ...)
{
  return [a1 setState:animate:];
}

id objc_msgSend_setState_animated_(void *a1, const char *a2, ...)
{
  return [a1 setState:animated:];
}

id objc_msgSend_setStateNeedsReset_(void *a1, const char *a2, ...)
{
  return [a1 setStateNeedsReset:];
}

id objc_msgSend_setStopButton_(void *a1, const char *a2, ...)
{
  return [a1 setStopButton:];
}

id objc_msgSend_setStopwatchController_(void *a1, const char *a2, ...)
{
  return [a1 setStopwatchController:];
}

id objc_msgSend_setStopwatchManager_(void *a1, const char *a2, ...)
{
  return [a1 setStopwatchManager:];
}

id objc_msgSend_setStroke(void *a1, const char *a2, ...)
{
  return _[a1 setStroke];
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:];
}

id objc_msgSend_setStyle_forceRefresh_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:forceRefresh:];
}

id objc_msgSend_setStyleProvider_(void *a1, const char *a2, ...)
{
  return [a1 setStyleProvider:];
}

id objc_msgSend_setSunriseLabel_(void *a1, const char *a2, ...)
{
  return [a1 setSunriseLabel:];
}

id objc_msgSend_setSunsetLabel_(void *a1, const char *a2, ...)
{
  return [a1 setSunsetLabel:];
}

id objc_msgSend_setTableHeaderView_(void *a1, const char *a2, ...)
{
  return [a1 setTableHeaderView:];
}

id objc_msgSend_setTableRows_(void *a1, const char *a2, ...)
{
  return [a1 setTableRows:];
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return [a1 setTableView:];
}

id objc_msgSend_setTableWidthConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTableWidthConstraint:];
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return [a1 setTag:];
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return [a1 setTarget:];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setTextAlignment:];
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return [a1 setTextColor:];
}

id objc_msgSend_setTextContentType_(void *a1, const char *a2, ...)
{
  return [a1 setTextContentType:];
}

id objc_msgSend_setTextLabel_(void *a1, const char *a2, ...)
{
  return [a1 setTextLabel:];
}

id objc_msgSend_setTextfield_(void *a1, const char *a2, ...)
{
  return [a1 setTextfield:];
}

id objc_msgSend_setTextfieldTrailConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTextfieldTrailConstraint:];
}

id objc_msgSend_setTime_(void *a1, const char *a2, ...)
{
  return [a1 setTime:];
}

id objc_msgSend_setTimeDesignatorFont_(void *a1, const char *a2, ...)
{
  return [a1 setTimeDesignatorFont:];
}

id objc_msgSend_setTimeFormatter_(void *a1, const char *a2, ...)
{
  return [a1 setTimeFormatter:];
}

id objc_msgSend_setTimeLabel_(void *a1, const char *a2, ...)
{
  return [a1 setTimeLabel:];
}

id objc_msgSend_setTimeLabelText_(void *a1, const char *a2, ...)
{
  return [a1 setTimeLabelText:];
}

id objc_msgSend_setTimeLabelWidth_(void *a1, const char *a2, ...)
{
  return [a1 setTimeLabelWidth:];
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return [a1 setTimeStyle:];
}

id objc_msgSend_setTimeView_(void *a1, const char *a2, ...)
{
  return [a1 setTimeView:];
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return [a1 setTimeZone:];
}

id objc_msgSend_setTimeZoneOffsetLabel_(void *a1, const char *a2, ...)
{
  return [a1 setTimeZoneOffsetLabel:];
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return [a1 setTimer:];
}

id objc_msgSend_setTimerCellView_(void *a1, const char *a2, ...)
{
  return [a1 setTimerCellView:];
}

id objc_msgSend_setTimerControlState_(void *a1, const char *a2, ...)
{
  return [a1 setTimerControlState:];
}

id objc_msgSend_setTimerControlsView_(void *a1, const char *a2, ...)
{
  return [a1 setTimerControlsView:];
}

id objc_msgSend_setTimerCountdownWidthConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTimerCountdownWidthConstraint:];
}

id objc_msgSend_setTimerLabel_(void *a1, const char *a2, ...)
{
  return [a1 setTimerLabel:];
}

id objc_msgSend_setTimerManager_(void *a1, const char *a2, ...)
{
  return [a1 setTimerManager:];
}

id objc_msgSend_setTimerToEdit_(void *a1, const char *a2, ...)
{
  return [a1 setTimerToEdit:];
}

id objc_msgSend_setTimerToneName_(void *a1, const char *a2, ...)
{
  return [a1 setTimerToneName:];
}

id objc_msgSend_setTimerViewStyle(void *a1, const char *a2, ...)
{
  return _[a1 setTimerViewStyle];
}

id objc_msgSend_setTimerViewStyleForceRefresh_(void *a1, const char *a2, ...)
{
  return [a1 setTimerViewStyleForceRefresh:];
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setTintColor:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:forState:];
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitleColor:forState:];
}

id objc_msgSend_setTitleFormatter_(void *a1, const char *a2, ...)
{
  return [a1 setTitleFormatter:];
}

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return [a1 setTitleLabel:];
}

id objc_msgSend_setTitleView_(void *a1, const char *a2, ...)
{
  return [a1 setTitleView:];
}

id objc_msgSend_setToneIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setToneIdentifier:];
}

id objc_msgSend_setToneName_(void *a1, const char *a2, ...)
{
  return [a1 setToneName:];
}

id objc_msgSend_setTopKeylineView_(void *a1, const char *a2, ...)
{
  return [a1 setTopKeylineView:];
}

id objc_msgSend_setTotalLabel_(void *a1, const char *a2, ...)
{
  return [a1 setTotalLabel:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setTranslucent_(void *a1, const char *a2, ...)
{
  return [a1 setTranslucent:];
}

id objc_msgSend_setUnderEditing_(void *a1, const char *a2, ...)
{
  return [a1 setUnderEditing:];
}

id objc_msgSend_setUnit_(void *a1, const char *a2, ...)
{
  return [a1 setUnit:];
}

id objc_msgSend_setUnitLabel_(void *a1, const char *a2, ...)
{
  return [a1 setUnitLabel:];
}

id objc_msgSend_setUnitsStyle_(void *a1, const char *a2, ...)
{
  return [a1 setUnitsStyle:];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setUserInteractionEnabled:];
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return [a1 setValue:];
}

id objc_msgSend_setVerticalAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setVerticalAlignment:];
}

id objc_msgSend_setVerticalMapHeightConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setVerticalMapHeightConstraint:];
}

id objc_msgSend_setVibrantOptions_(void *a1, const char *a2, ...)
{
  return [a1 setVibrantOptions:];
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return [a1 setView:];
}

id objc_msgSend_setViewControllers_animated_(void *a1, const char *a2, ...)
{
  return [a1 setViewControllers:animated:];
}

id objc_msgSend_setViewLoadedAction_(void *a1, const char *a2, ...)
{
  return [a1 setViewLoadedAction:];
}

id objc_msgSend_setViewModel_(void *a1, const char *a2, ...)
{
  return [a1 setViewModel:];
}

id objc_msgSend_setVolumeSlider_(void *a1, const char *a2, ...)
{
  return [a1 setVolumeSlider:];
}

id objc_msgSend_setWidth_(void *a1, const char *a2, ...)
{
  return [a1 setWidth:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setWorldClockView_(void *a1, const char *a2, ...)
{
  return [a1 setWorldClockView:];
}

id objc_msgSend_setYear_(void *a1, const char *a2, ...)
{
  return [a1 setYear:];
}

id objc_msgSend_setZeroFormattingBehavior_(void *a1, const char *a2, ...)
{
  return [a1 setZeroFormattingBehavior:];
}

id objc_msgSend_setupButton(void *a1, const char *a2, ...)
{
  return _[a1 setupButton];
}

id objc_msgSend_setupCell(void *a1, const char *a2, ...)
{
  return _[a1 setupCell];
}

id objc_msgSend_setupChangeButton(void *a1, const char *a2, ...)
{
  return _[a1 setupChangeButton];
}

id objc_msgSend_setupCircleView(void *a1, const char *a2, ...)
{
  return _[a1 setupCircleView];
}

id objc_msgSend_setupCollectionControllerWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setupCollectionControllerWithDelegate:];
}

id objc_msgSend_setupCollectionViewConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setupCollectionViewConstraints];
}

id objc_msgSend_setupCompactNewTimerConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setupCompactNewTimerConstraints];
}

id objc_msgSend_setupConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setupConstraints];
}

id objc_msgSend_setupControlButton(void *a1, const char *a2, ...)
{
  return _[a1 setupControlButton];
}

id objc_msgSend_setupControlsView(void *a1, const char *a2, ...)
{
  return _[a1 setupControlsView];
}

id objc_msgSend_setupCountdownLabel(void *a1, const char *a2, ...)
{
  return _[a1 setupCountdownLabel];
}

id objc_msgSend_setupCountdownView(void *a1, const char *a2, ...)
{
  return _[a1 setupCountdownView];
}

id objc_msgSend_setupDateFormatters(void *a1, const char *a2, ...)
{
  return _[a1 setupDateFormatters];
}

id objc_msgSend_setupDurationLabel(void *a1, const char *a2, ...)
{
  return _[a1 setupDurationLabel];
}

id objc_msgSend_setupEdgeAppearance(void *a1, const char *a2, ...)
{
  return _[a1 setupEdgeAppearance];
}

id objc_msgSend_setupForTest_options_(void *a1, const char *a2, ...)
{
  return [a1 setupForTest:options:];
}

id objc_msgSend_setupHeaderTitle(void *a1, const char *a2, ...)
{
  return _[a1 setupHeaderTitle];
}

id objc_msgSend_setupLabel(void *a1, const char *a2, ...)
{
  return _[a1 setupLabel];
}

id objc_msgSend_setupLayoutConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setupLayoutConstraints];
}

id objc_msgSend_setupLayoutForTimerControlState_(void *a1, const char *a2, ...)
{
  return [a1 setupLayoutForTimerControlState:];
}

id objc_msgSend_setupMultipleTimerConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setupMultipleTimerConstraints];
}

id objc_msgSend_setupNavigationButtons(void *a1, const char *a2, ...)
{
  return _[a1 setupNavigationButtons];
}

id objc_msgSend_setupNumberLabel(void *a1, const char *a2, ...)
{
  return _[a1 setupNumberLabel];
}

id objc_msgSend_setupPresetView(void *a1, const char *a2, ...)
{
  return _[a1 setupPresetView];
}

id objc_msgSend_setupSharedLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 setupSharedLayoutConstraint];
}

id objc_msgSend_setupSingleTimerConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setupSingleTimerConstraints];
}

id objc_msgSend_setupTextField(void *a1, const char *a2, ...)
{
  return _[a1 setupTextField];
}

id objc_msgSend_setupTimeView(void *a1, const char *a2, ...)
{
  return _[a1 setupTimeView];
}

id objc_msgSend_setupTimerNameLabelForTimerStyle_withFontStyle_(void *a1, const char *a2, ...)
{
  return [a1 setupTimerNameLabelForTimerStyle:withFontStyle:];
}

id objc_msgSend_setupTimerUI_(void *a1, const char *a2, ...)
{
  return [a1 setupTimerUI:];
}

id objc_msgSend_setupUnitLabel(void *a1, const char *a2, ...)
{
  return _[a1 setupUnitLabel];
}

id objc_msgSend_setupViewModelWithStopwatch_(void *a1, const char *a2, ...)
{
  return [a1 setupViewModelWithStopwatch:];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return _[a1 sharedBehavior];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedListener(void *a1, const char *a2, ...)
{
  return _[a1 sharedListener];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedToneManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedToneManager];
}

id objc_msgSend_sharedVibrationManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedVibrationManager];
}

id objc_msgSend_sharedWorkspaceObserver(void *a1, const char *a2, ...)
{
  return _[a1 sharedWorkspaceObserver];
}

id objc_msgSend_shortcutItem(void *a1, const char *a2, ...)
{
  return _[a1 shortcutItem];
}

id objc_msgSend_shortcutItemForCurrentState(void *a1, const char *a2, ...)
{
  return _[a1 shortcutItemForCurrentState];
}

id objc_msgSend_shortcutItems(void *a1, const char *a2, ...)
{
  return _[a1 shortcutItems];
}

id objc_msgSend_shouldHandleTimerReload(void *a1, const char *a2, ...)
{
  return _[a1 shouldHandleTimerReload];
}

id objc_msgSend_shouldMakeUIForDefaultPNG(void *a1, const char *a2, ...)
{
  return _[a1 shouldMakeUIForDefaultPNG];
}

id objc_msgSend_shouldProcessUpdate(void *a1, const char *a2, ...)
{
  return _[a1 shouldProcessUpdate];
}

id objc_msgSend_shouldSetupConstraintsAtLayout(void *a1, const char *a2, ...)
{
  return _[a1 shouldSetupConstraintsAtLayout];
}

id objc_msgSend_shouldShowAddView(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowAddView];
}

id objc_msgSend_shouldToggleEditView(void *a1, const char *a2, ...)
{
  return _[a1 shouldToggleEditView];
}

id objc_msgSend_shouldUseCompactLayoutForSizeClass_windowWidth_(void *a1, const char *a2, ...)
{
  return [a1 shouldUseCompactLayoutForSizeClass:windowWidth:];
}

id objc_msgSend_shouldUseRegularLayout(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseRegularLayout];
}

id objc_msgSend_showAddAlarmViewPopUpWithAlarm_(void *a1, const char *a2, ...)
{
  return [a1 showAddAlarmViewPopUpWithAlarm:];
}

id objc_msgSend_showAddTimerViewWithTimer_(void *a1, const char *a2, ...)
{
  return [a1 showAddTimerViewWithTimer:];
}

id objc_msgSend_showAddView(void *a1, const char *a2, ...)
{
  return _[a1 showAddView];
}

id objc_msgSend_showAddViewForAlarm_(void *a1, const char *a2, ...)
{
  return [a1 showAddViewForAlarm:];
}

id objc_msgSend_showAddViewForAlarmWithID_(void *a1, const char *a2, ...)
{
  return [a1 showAddViewForAlarmWithID];
}

id objc_msgSend_showAddViewForTimer_(void *a1, const char *a2, ...)
{
  return [a1 showAddViewForTimer:];
}

id objc_msgSend_showEditViewForRow_(void *a1, const char *a2, ...)
{
  return [a1 showEditViewForRow:];
}

id objc_msgSend_showExpectedTimeWithRemainingTime_(void *a1, const char *a2, ...)
{
  return [a1 showExpectedTimeWithRemainingTime:];
}

id objc_msgSend_showSleepView(void *a1, const char *a2, ...)
{
  return _[a1 showSleepView];
}

id objc_msgSend_showSleepView_(void *a1, const char *a2, ...)
{
  return [a1 showSleepView:];
}

id objc_msgSend_showSoundPicker_(void *a1, const char *a2, ...)
{
  return [a1 showSoundPicker:];
}

id objc_msgSend_showSubseconds(void *a1, const char *a2, ...)
{
  return _[a1 showSubseconds];
}

id objc_msgSend_showingClearButton(void *a1, const char *a2, ...)
{
  return _[a1 showingClearButton];
}

id objc_msgSend_showsCurrentLap(void *a1, const char *a2, ...)
{
  return _[a1 showsCurrentLap];
}

id objc_msgSend_showsReorderControl(void *a1, const char *a2, ...)
{
  return _[a1 showsReorderControl];
}

id objc_msgSend_singleTimerCell(void *a1, const char *a2, ...)
{
  return _[a1 singleTimerCell];
}

id objc_msgSend_singleTimerSectionSize(void *a1, const char *a2, ...)
{
  return _[a1 singleTimerSectionSize];
}

id objc_msgSend_singleTimerVC(void *a1, const char *a2, ...)
{
  return _[a1 singleTimerVC];
}

id objc_msgSend_siriTipsController(void *a1, const char *a2, ...)
{
  return _[a1 siriTipsController];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeForIntersectionWithCityView_atOrigin_selfOrigin_(void *a1, const char *a2, ...)
{
  return [a1 sizeForIntersectionWithCityView:atOrigin:selfOrigin:];
}

id objc_msgSend_sizeForStyle_(void *a1, const char *a2, ...)
{
  return [a1 sizeForStyle:];
}

id objc_msgSend_sizeLabelToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeLabelToFit];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return [a1 sizeThatFits:];
}

id objc_msgSend_sizeThatFits_siriTipView_(void *a1, const char *a2, ...)
{
  return [a1 sizeThatFits:siriTipView:];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sizeWithAttributes_(void *a1, const char *a2, ...)
{
  return [a1 sizeWithAttributes:];
}

id objc_msgSend_sleepAlarm(void *a1, const char *a2, ...)
{
  return _[a1 sleepAlarm];
}

id objc_msgSend_sleepCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 sleepCoordinator];
}

id objc_msgSend_sleepEditController(void *a1, const char *a2, ...)
{
  return _[a1 sleepEditController];
}

id objc_msgSend_sleepMetadata(void *a1, const char *a2, ...)
{
  return _[a1 sleepMetadata];
}

id objc_msgSend_sleepSchedule(void *a1, const char *a2, ...)
{
  return _[a1 sleepSchedule];
}

id objc_msgSend_sleepScheduleModelDidChange(void *a1, const char *a2, ...)
{
  return _[a1 sleepScheduleModelDidChange];
}

id objc_msgSend_sleepStore(void *a1, const char *a2, ...)
{
  return _[a1 sleepStore];
}

id objc_msgSend_songSoundWithIdentifier_vibrationIdentifier_volume_(void *a1, const char *a2, ...)
{
  return [a1 songSoundWithIdentifier:vibrationIdentifier:volume:];
}

id objc_msgSend_songsQuery(void *a1, const char *a2, ...)
{
  return _[a1 songsQuery];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorWithKey:ascending:];
}

id objc_msgSend_sortedArrayFromArray_collationStringSelector_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayFromArray:collationStringSelector:];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingComparator:];
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingDescriptors:];
}

id objc_msgSend_sound(void *a1, const char *a2, ...)
{
  return _[a1 sound];
}

id objc_msgSend_soundByUpdatingVibrationIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 soundByUpdatingVibrationIdentifier:];
}

id objc_msgSend_soundLabel(void *a1, const char *a2, ...)
{
  return _[a1 soundLabel];
}

id objc_msgSend_soundType(void *a1, const char *a2, ...)
{
  return _[a1 soundType];
}

id objc_msgSend_soundVolume(void *a1, const char *a2, ...)
{
  return _[a1 soundVolume];
}

id objc_msgSend_sourceApplication(void *a1, const char *a2, ...)
{
  return _[a1 sourceApplication];
}

id objc_msgSend_splitLabel(void *a1, const char *a2, ...)
{
  return _[a1 splitLabel];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 startButtonItem];
}

id objc_msgSend_startButtonOccludingView(void *a1, const char *a2, ...)
{
  return _[a1 startButtonOccludingView];
}

id objc_msgSend_startButtonTopConstraint(void *a1, const char *a2, ...)
{
  return _[a1 startButtonTopConstraint];
}

id objc_msgSend_startButtonWidthConstraint(void *a1, const char *a2, ...)
{
  return _[a1 startButtonWidthConstraint];
}

id objc_msgSend_startDisplayUpdates(void *a1, const char *a2, ...)
{
  return _[a1 startDisplayUpdates];
}

id objc_msgSend_startEditing(void *a1, const char *a2, ...)
{
  return _[a1 startEditing];
}

id objc_msgSend_startEditingSetting_(void *a1, const char *a2, ...)
{
  return [a1 startEditingSetting:];
}

id objc_msgSend_startLapTimer(void *a1, const char *a2, ...)
{
  return _[a1 startLapTimer];
}

id objc_msgSend_startRecentTimerForCell_(void *a1, const char *a2, ...)
{
  return [a1 startRecentTimerForCell:];
}

id objc_msgSend_startStopButton(void *a1, const char *a2, ...)
{
  return _[a1 startStopButton];
}

id objc_msgSend_startStopwatchShortcutItemForMode_(void *a1, const char *a2, ...)
{
  return [a1 startStopwatchShortcutItemForMode:];
}

id objc_msgSend_startTimer_(void *a1, const char *a2, ...)
{
  return [a1 startTimer:];
}

id objc_msgSend_startTimerForCell_withDuration_(void *a1, const char *a2, ...)
{
  return [a1 startTimerForCell:withDuration:];
}

id objc_msgSend_startTimerShortcutItem(void *a1, const char *a2, ...)
{
  return _[a1 startTimerShortcutItem];
}

id objc_msgSend_startUpdates(void *a1, const char *a2, ...)
{
  return _[a1 startUpdates];
}

id objc_msgSend_startUpdatingSingleTimerUI(void *a1, const char *a2, ...)
{
  return _[a1 startUpdatingSingleTimerUI];
}

id objc_msgSend_startUpdatingTime(void *a1, const char *a2, ...)
{
  return _[a1 startUpdatingTime];
}

id objc_msgSend_startUpdatingTimerUI(void *a1, const char *a2, ...)
{
  return _[a1 startUpdatingTimerUI];
}

id objc_msgSend_started(void *a1, const char *a2, ...)
{
  return _[a1 started];
}

id objc_msgSend_startedTest_(void *a1, const char *a2, ...)
{
  return [a1 startedTest:];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateNeedsReset(void *a1, const char *a2, ...)
{
  return _[a1 stateNeedsReset];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopButton(void *a1, const char *a2, ...)
{
  return _[a1 stopButton];
}

id objc_msgSend_stopPreviewingTone(void *a1, const char *a2, ...)
{
  return _[a1 stopPreviewingTone];
}

id objc_msgSend_stopStopwatchShortcutItem(void *a1, const char *a2, ...)
{
  return _[a1 stopStopwatchShortcutItem];
}

id objc_msgSend_stopTimerShortcutItem(void *a1, const char *a2, ...)
{
  return _[a1 stopTimerShortcutItem];
}

id objc_msgSend_stopUpdates(void *a1, const char *a2, ...)
{
  return _[a1 stopUpdates];
}

id objc_msgSend_stopUpdatingTime(void *a1, const char *a2, ...)
{
  return _[a1 stopUpdatingTime];
}

id objc_msgSend_stopUpdatingTimerUI(void *a1, const char *a2, ...)
{
  return _[a1 stopUpdatingTimerUI];
}

id objc_msgSend_stopwatchController(void *a1, const char *a2, ...)
{
  return _[a1 stopwatchController];
}

id objc_msgSend_stopwatchManager(void *a1, const char *a2, ...)
{
  return _[a1 stopwatchManager];
}

id objc_msgSend_stopwatchPagingViewController_didPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopwatchPagingViewController:didPage:");
}

id objc_msgSend_stopwatchViewController(void *a1, const char *a2, ...)
{
  return _[a1 stopwatchViewController];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return [a1 stringFromNumber:];
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 stringFromTimeInterval:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_stroke(void *a1, const char *a2, ...)
{
  return _[a1 stroke];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_styleSpecificConstraints(void *a1, const char *a2, ...)
{
  return _[a1 styleSpecificConstraints];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_sunrise(void *a1, const char *a2, ...)
{
  return _[a1 sunrise];
}

id objc_msgSend_sunriseLabel(void *a1, const char *a2, ...)
{
  return _[a1 sunriseLabel];
}

id objc_msgSend_sunset(void *a1, const char *a2, ...)
{
  return _[a1 sunset];
}

id objc_msgSend_sunsetLabel(void *a1, const char *a2, ...)
{
  return _[a1 sunsetLabel];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:weight:];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGreenColor];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return [a1 systemImageNamed:];
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 systemImageNamed:withConfiguration:];
}

id objc_msgSend_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return _[a1 systemOrangeColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 systemTimeZone];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _[a1 systemWhiteColor];
}

id objc_msgSend_tabBar(void *a1, const char *a2, ...)
{
  return _[a1 tabBar];
}

id objc_msgSend_tabBarController(void *a1, const char *a2, ...)
{
  return _[a1 tabBarController];
}

id objc_msgSend_tabBarItem(void *a1, const char *a2, ...)
{
  return _[a1 tabBarItem];
}

id objc_msgSend_tabIndexForAppSection_(void *a1, const char *a2, ...)
{
  return [a1 tabIndexForAppSection:];
}

id objc_msgSend_tableCellClass(void *a1, const char *a2, ...)
{
  return _[a1 tableCellClass];
}

id objc_msgSend_tableHeaderView(void *a1, const char *a2, ...)
{
  return _[a1 tableHeaderView];
}

id objc_msgSend_tableRows(void *a1, const char *a2, ...)
{
  return _[a1 tableRows];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_tableWidthConstraint(void *a1, const char *a2, ...)
{
  return _[a1 tableWidthConstraint];
}

id objc_msgSend_teardownForTest_options_(void *a1, const char *a2, ...)
{
  return [a1 teardownForTest:options:];
}

id objc_msgSend_terminatorUpdateInterval(void *a1, const char *a2, ...)
{
  return _[a1 terminatorUpdateInterval];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return _[a1 textField];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return _[a1 textProperties];
}

id objc_msgSend_textRangeFromPosition_toPosition_(void *a1, const char *a2, ...)
{
  return [a1 textRangeFromPosition:toPosition:];
}

id objc_msgSend_textStyleForCellStyle_(void *a1, const char *a2, ...)
{
  return [a1 textStyleForCellStyle:];
}

id objc_msgSend_textfield(void *a1, const char *a2, ...)
{
  return _[a1 textfield];
}

id objc_msgSend_textfieldTrailConstraint(void *a1, const char *a2, ...)
{
  return _[a1 textfieldTrailConstraint];
}

id objc_msgSend_thinG2MonospacedDigitFontWithSize_(void *a1, const char *a2, ...)
{
  return [a1 thinG2MonospacedDigitFontWithSize:];
}

id objc_msgSend_tickWithTimer_(void *a1, const char *a2, ...)
{
  return [a1 tickWithTimer:];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return _[a1 time];
}

id objc_msgSend_timeDesignatorAppearsBeforeTime(void *a1, const char *a2, ...)
{
  return _[a1 timeDesignatorAppearsBeforeTime];
}

id objc_msgSend_timeFormatter(void *a1, const char *a2, ...)
{
  return _[a1 timeFormatter];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeLabel(void *a1, const char *a2, ...)
{
  return _[a1 timeLabel];
}

id objc_msgSend_timePickerCellForTableView_(void *a1, const char *a2, ...)
{
  return [a1 timePickerCellForTableView:];
}

id objc_msgSend_timePickerDidSelectDuration_(void *a1, const char *a2, ...)
{
  return [a1 timePickerDidSelectDuration:];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return _[a1 timeView];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return _[a1 timeZone];
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return [a1 timeZoneForSecondsFromGMT:];
}

id objc_msgSend_timeZoneOffsetLabel(void *a1, const char *a2, ...)
{
  return _[a1 timeZoneOffsetLabel];
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return [a1 timeZoneWithName:];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_timerAddEditController(void *a1, const char *a2, ...)
{
  return _[a1 timerAddEditController];
}

id objc_msgSend_timerAddEditControllerDidCancel_reload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerAddEditControllerDidCancel:reload:");
}

id objc_msgSend_timerByUpdatingWithState_(void *a1, const char *a2, ...)
{
  return [a1 timerByUpdatingWithState:];
}

id objc_msgSend_timerCellView(void *a1, const char *a2, ...)
{
  return _[a1 timerCellView];
}

id objc_msgSend_timerControlCell(void *a1, const char *a2, ...)
{
  return _[a1 timerControlCell];
}

id objc_msgSend_timerControlState(void *a1, const char *a2, ...)
{
  return _[a1 timerControlState];
}

id objc_msgSend_timerControlsView(void *a1, const char *a2, ...)
{
  return _[a1 timerControlsView];
}

id objc_msgSend_timerCountdownWidthConstraint(void *a1, const char *a2, ...)
{
  return _[a1 timerCountdownWidthConstraint];
}

id objc_msgSend_timerID(void *a1, const char *a2, ...)
{
  return _[a1 timerID];
}

id objc_msgSend_timerIDString(void *a1, const char *a2, ...)
{
  return _[a1 timerIDString];
}

id objc_msgSend_timerLabel(void *a1, const char *a2, ...)
{
  return _[a1 timerLabel];
}

id objc_msgSend_timerManager(void *a1, const char *a2, ...)
{
  return _[a1 timerManager];
}

id objc_msgSend_timerTick_(void *a1, const char *a2, ...)
{
  return [a1 timerTick:];
}

id objc_msgSend_timerToEdit(void *a1, const char *a2, ...)
{
  return _[a1 timerToEdit];
}

id objc_msgSend_timerViewController(void *a1, const char *a2, ...)
{
  return _[a1 timerViewController];
}

id objc_msgSend_timerViewStyle(void *a1, const char *a2, ...)
{
  return _[a1 timerViewStyle];
}

id objc_msgSend_timerWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 timerWithIdentifier:];
}

id objc_msgSend_timers(void *a1, const char *a2, ...)
{
  return _[a1 timers];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleForTimer_(void *a1, const char *a2, ...)
{
  return [a1 titleForTimer:];
}

id objc_msgSend_titleFormatter(void *a1, const char *a2, ...)
{
  return _[a1 titleFormatter];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_toneIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 toneIdentifier];
}

id objc_msgSend_toneName(void *a1, const char *a2, ...)
{
  return _[a1 toneName];
}

id objc_msgSend_tonePickerCellForTableView_(void *a1, const char *a2, ...)
{
  return [a1 tonePickerCellForTableView:];
}

id objc_msgSend_tonePickerViewController(void *a1, const char *a2, ...)
{
  return _[a1 tonePickerViewController];
}

id objc_msgSend_toneSoundWithIdentifier_vibrationIdentifer_volume_(void *a1, const char *a2, ...)
{
  return [a1 toneSoundWithIdentifier:vibrationIdentifer:volume:];
}

id objc_msgSend_toneWithIdentifierIsValid_(void *a1, const char *a2, ...)
{
  return [a1 toneWithIdentifierIsValid:];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_topKeylineView(void *a1, const char *a2, ...)
{
  return _[a1 topKeylineView];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _[a1 topic];
}

id objc_msgSend_totalLabel(void *a1, const char *a2, ...)
{
  return _[a1 totalLabel];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithPreferredContentSizeCategory:];
}

id objc_msgSend_traitCollectionWithUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithUserInterfaceStyle:];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return [a1 unarchivedObjectOfClass:fromData:error:];
}

id objc_msgSend_underEditing(void *a1, const char *a2, ...)
{
  return _[a1 underEditing];
}

id objc_msgSend_unit(void *a1, const char *a2, ...)
{
  return _[a1 unit];
}

id objc_msgSend_unitLabel(void *a1, const char *a2, ...)
{
  return _[a1 unitLabel];
}

id objc_msgSend_unregisterObserver_(void *a1, const char *a2, ...)
{
  return [a1 unregisterObserver:];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_updateAddButton(void *a1, const char *a2, ...)
{
  return _[a1 updateAddButton];
}

id objc_msgSend_updateAlarm_(void *a1, const char *a2, ...)
{
  return [a1 updateAlarm:];
}

id objc_msgSend_updateCityNameAndTime(void *a1, const char *a2, ...)
{
  return _[a1 updateCityNameAndTime];
}

id objc_msgSend_updateClocksForSize_transitionCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 updateClocksForSize:transitionCoordinator:];
}

id objc_msgSend_updateCollectionViewLayout(void *a1, const char *a2, ...)
{
  return _[a1 updateCollectionViewLayout];
}

id objc_msgSend_updateControlButtonWithState_(void *a1, const char *a2, ...)
{
  return [a1 updateControlButtonWithState:];
}

id objc_msgSend_updateDelegate_(void *a1, const char *a2, ...)
{
  return [a1 updateDelegate:];
}

id objc_msgSend_updateDetails(void *a1, const char *a2, ...)
{
  return _[a1 updateDetails];
}

id objc_msgSend_updateDuration_(void *a1, const char *a2, ...)
{
  return [a1 updateDuration:];
}

id objc_msgSend_updateHighlightPath(void *a1, const char *a2, ...)
{
  return _[a1 updateHighlightPath];
}

id objc_msgSend_updateLabelAdjustFontSize(void *a1, const char *a2, ...)
{
  return _[a1 updateLabelAdjustFontSize];
}

id objc_msgSend_updateLabelColorForState_(void *a1, const char *a2, ...)
{
  return [a1 updateLabelColorForState:];
}

id objc_msgSend_updateNewYearsDay(void *a1, const char *a2, ...)
{
  return _[a1 updateNewYearsDay];
}

id objc_msgSend_updatePauseResumeButtonWithState_(void *a1, const char *a2, ...)
{
  return [a1 updatePauseResumeButtonWithState:];
}

id objc_msgSend_updateSelectedSoundCell_(void *a1, const char *a2, ...)
{
  return [a1 updateSelectedSoundCell:];
}

id objc_msgSend_updateSelectedSoundUI(void *a1, const char *a2, ...)
{
  return _[a1 updateSelectedSoundUI];
}

id objc_msgSend_updateSelectedTone(void *a1, const char *a2, ...)
{
  return _[a1 updateSelectedTone];
}

id objc_msgSend_updateSelectedToneForCell_(void *a1, const char *a2, ...)
{
  return [a1 updateSelectedToneForCell:];
}

id objc_msgSend_updateShortcutItemForCurrentState(void *a1, const char *a2, ...)
{
  return _[a1 updateShortcutItemForCurrentState];
}

id objc_msgSend_updateShouldStackViewInCell_(void *a1, const char *a2, ...)
{
  return [a1 updateShouldStackViewInCell:];
}

id objc_msgSend_updateStateAndReloadData(void *a1, const char *a2, ...)
{
  return _[a1 updateStateAndReloadData];
}

id objc_msgSend_updateStopwatch_(void *a1, const char *a2, ...)
{
  return [a1 updateStopwatch:];
}

id objc_msgSend_updateSunriseAndSunsetLabel(void *a1, const char *a2, ...)
{
  return _[a1 updateSunriseAndSunsetLabel];
}

id objc_msgSend_updateTerminator(void *a1, const char *a2, ...)
{
  return _[a1 updateTerminator];
}

id objc_msgSend_updateTime(void *a1, const char *a2, ...)
{
  return _[a1 updateTime];
}

id objc_msgSend_updateTimeAnimated_(void *a1, const char *a2, ...)
{
  return [a1 updateTimeAnimated:];
}

id objc_msgSend_updateTimeViewFont(void *a1, const char *a2, ...)
{
  return _[a1 updateTimeViewFont];
}

id objc_msgSend_updateTimer_(void *a1, const char *a2, ...)
{
  return [a1 updateTimer:];
}

id objc_msgSend_updateTimer_reload_(void *a1, const char *a2, ...)
{
  return [a1 updateTimer:reload:];
}

id objc_msgSend_updateTimerAppShortcuts(void *a1, const char *a2, ...)
{
  return _[a1 updateTimerAppShortcuts];
}

id objc_msgSend_updateWithDisplayLink(void *a1, const char *a2, ...)
{
  return _[a1 updateWithDisplayLink];
}

id objc_msgSend_updateWithDuration_(void *a1, const char *a2, ...)
{
  return [a1 updateWithDuration:];
}

id objc_msgSend_updateWithLatestDuration_(void *a1, const char *a2, ...)
{
  return [a1 updateWithLatestDuration:];
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return _[a1 userActivities];
}

id objc_msgSend_userActivity(void *a1, const char *a2, ...)
{
  return _[a1 userActivity];
}

id objc_msgSend_userCachesDirectory(void *a1, const char *a2, ...)
{
  return _[a1 userCachesDirectory];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return [a1 valueForProperty:];
}

id objc_msgSend_verticalMapHeightConstraint(void *a1, const char *a2, ...)
{
  return _[a1 verticalMapHeightConstraint];
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 verticalSizeClass];
}

id objc_msgSend_vibrationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 vibrationIdentifier];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_viewModel(void *a1, const char *a2, ...)
{
  return _[a1 viewModel];
}

id objc_msgSend_viewWillTransitionToSize_withTransitionCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 viewWillTransitionToSize:withTransitionCoordinator:];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return _[a1 visibleCells];
}

id objc_msgSend_visibleViewHeight(void *a1, const char *a2, ...)
{
  return _[a1 visibleViewHeight];
}

id objc_msgSend_volumeSlider(void *a1, const char *a2, ...)
{
  return _[a1 volumeSlider];
}

id objc_msgSend_warmUp(void *a1, const char *a2, ...)
{
  return _[a1 warmUp];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return _[a1 width];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 willMoveToParentViewController:];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_windowScene_performActionForShortcutItem_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 windowScene:performActionForShortcutItem:completionHandler:];
}

id objc_msgSend_windowSceneWillConnect_(void *a1, const char *a2, ...)
{
  return [a1 windowSceneWillConnect:];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return _[a1 windows];
}

id objc_msgSend_worldClockPadController(void *a1, const char *a2, ...)
{
  return _[a1 worldClockPadController];
}

id objc_msgSend_worldClockTableViewController(void *a1, const char *a2, ...)
{
  return _[a1 worldClockTableViewController];
}

id objc_msgSend_worldClockView(void *a1, const char *a2, ...)
{
  return _[a1 worldClockView];
}

id objc_msgSend_worldClockViewController(void *a1, const char *a2, ...)
{
  return _[a1 worldClockViewController];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:atomically:];
}