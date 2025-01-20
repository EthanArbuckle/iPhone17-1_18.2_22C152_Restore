void sub_3C14(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;

  v3 = [a2 firstObject];
  if (v3)
  {
    v4 = objc_alloc((Class)REElementOpenAction);
    v5 = +[NSURL URLWithString:@"ActivityMonitorApp://"];
    v6 = [v4 initWithURL:v5 applicationID:@"com.apple.ActivityMonitorApp"];

    v7 = REDemoDateForIdentifier();
    v8 = REAbsoluteRelevanceProviderForDate();
    v9 = objc_alloc((Class)REElement);
    v10 = [v3 content];
    v16 = v8;
    v11 = +[NSArray arrayWithObjects:&v16 count:1];
    v12 = [v9 initWithIdentifier:@"rings" content:v10 action:v6 relevanceProviders:v11];

    v13 = *(void *)(a1 + 32);
    v15 = v12;
    v14 = +[NSArray arrayWithObjects:&v15 count:1];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id _CoachingProgressUpdatesEnabled()
{
  id v0 = objc_alloc((Class)NSUserDefaults);
  id v1 = [v0 initWithSuiteName:kHKNanolifestylePreferencesDomain];
  v2 = [v1 valueForKey:@"EnableProgressUpdates"];
  if (v2) {
    id v3 = [v1 BOOLForKey:@"EnableProgressUpdates"];
  }
  else {
    id v3 = &dword_0 + 1;
  }

  return v3;
}

void sub_4808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t sub_4848(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4858(uint64_t a1)
{
}

void sub_4860(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentCalendar];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = objc_alloc((Class)NSSet);
  id v10 = [*(id *)(a1 + 32) historicalSummariesByIndex];
  v6 = [v10 allValues];
  id v7 = [v5 initWithArray:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_4BB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_4BE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _significantTimeChangeOccurred];
}

void sub_4C20(uint64_t a1)
{
  _HKInitializeLogging();
  uint64_t v2 = (void *)HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    v4 = +[NSUserDefaults standardUserDefaults];
    id v5 = [v4 persistentDomainForName:kHKNanolifestylePreferencesDomain];
    int v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[Supergreen] Coaching preferences changed: %@", (uint8_t *)&v11, 0xCu);
  }
  id v6 = _CoachingProgressUpdatesEnabled();
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained setProgressUpdatesEnabled:v6];

  id v9 = objc_loadWeakRetained(v7);
  id v10 = [v9 delegate];
  [v10 invalidateElements];
}

void sub_4F34(uint64_t a1)
{
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEBUG)) {
    sub_7C90();
  }
  uint64_t v2 = [*(id *)(a1 + 32) _createWalkSuggestionElement];
  _HKInitializeLogging();
  uint64_t v3 = HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEBUG)) {
    sub_7C18((uint64_t)v2, v3);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2)
  {
    id v6 = v2;
    id v5 = +[NSArray arrayWithObjects:&v6 count:1];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, &__NSArray0__struct);
  }
}

id sub_511C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateCachedTypicalDayValues");
}

id sub_5904(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateCachedTypicalDayValues");
}

void sub_5AC8(uint64_t a1)
{
  _HKInitializeLogging();
  uint64_t v2 = HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "[Supergreen] Calling into typical day model to cache values.", buf, 2u);
  }
  uint64_t v3 = [*(id *)(a1 + 32) typicalDayModel];
  unsigned __int8 v4 = [v3 willCompleteMoveGoalWithBufferPercentage:0.15];

  id v5 = [*(id *)(a1 + 32) typicalDayModel];
  id v6 = [*(id *)(a1 + 32) settingsController];
  unsigned __int8 v7 = [v5 shouldSuggestWalkWithActivitySettingsController:v6];

  uint64_t v8 = [*(id *)(a1 + 32) typicalDayModel];
  id v9 = [*(id *)(a1 + 32) settingsController];
  [v8 briskWalkTimeToCompleteMoveGoalWithAcitivitySettingsController:v9];
  uint64_t v11 = v10;

  v12 = [*(id *)(a1 + 32) serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5C58;
  block[3] = &unk_C450;
  block[4] = *(void *)(a1 + 32);
  unsigned __int8 v14 = v4;
  unsigned __int8 v15 = v7;
  block[5] = v11;
  dispatch_async(v12, block);
}

id sub_5C58(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 48) == [*(id *)(a1 + 32) willCompleteGoal]
    && *(unsigned __int8 *)(a1 + 49) == [*(id *)(a1 + 32) shouldSuggestWalk]
    && ([*(id *)(a1 + 32) suggestedWalkTime], v2 == *(double *)(a1 + 40)))
  {
    _HKInitializeLogging();
    uint64_t v3 = HKLogCoaching;
    if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[Supergreen] Values for willCompleteGoal, shouldSuggestWalk, and suggestedWalkTime are unchanged; not refreshing elements",
        (uint8_t *)v11,
        2u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setWillCompleteGoal:*(unsigned __int8 *)(a1 + 48)];
    [*(id *)(a1 + 32) setShouldSuggestWalk:*(unsigned __int8 *)(a1 + 49)];
    [*(id *)(a1 + 32) setSuggestedWalkTime:*(double *)(a1 + 40)];
    _HKInitializeLogging();
    unsigned __int8 v4 = (void *)HKLogCoaching;
    if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = v4;
      LODWORD(v5) = [v5 willCompleteGoal];
      unsigned int v7 = [*(id *)(a1 + 32) shouldSuggestWalk];
      [*(id *)(a1 + 32) suggestedWalkTime];
      v11[0] = 67109632;
      v11[1] = v5;
      __int16 v12 = 1024;
      unsigned int v13 = v7;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[Supergreen] New cached values: willCompleteGoal = %{BOOL}d, shouldSuggestWalk = %{BOOL}d, suggestedWalkTime = %lf.", (uint8_t *)v11, 0x18u);
    }
    id v9 = [*(id *)(a1 + 32) delegate];
    [v9 invalidateElements];
  }
  return [*(id *)(a1 + 32) setIsUpdatingTypicalDayCachedValues:0];
}

void sub_5E9C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isRebuildingTypicalDayModel])
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEBUG)) {
      sub_7D6C();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setIsRebuildingTypicalDayModel:1];
    double v2 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5F74;
    block[3] = &unk_C428;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v2, block);
  }
}

void sub_5F74(uint64_t a1)
{
  _HKInitializeLogging();
  double v2 = HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "[Supergreen] Rebuilding the typical day model.", buf, 2u);
  }
  uint64_t v3 = [*(id *)(a1 + 32) typicalDayModel];
  unsigned __int8 v4 = [*(id *)(a1 + 32) _typicalDayDateInterval];
  [v3 rebuildWithInterval:v4];

  id v5 = [*(id *)(a1 + 32) serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6088;
  block[3] = &unk_C428;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v5, block);
}

id sub_6088(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsRebuildingTypicalDayModel:0];
  double v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_queue_updateCachedTypicalDayValues");
}

void sub_6568(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) typicalDayModel];
  [v2 handleUpdatedCurrentActivitySummary:*(void *)(a1 + 40)];
}

void sub_6918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_693C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v9)
    {
      uint64_t v11 = *(void *)(a1 + 40) - 1;
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_ERROR)) {
        sub_7DE0();
      }
      __int16 v12 = [WeakRetained healthStore];
      [v12 stopQuery:v7];

      [WeakRetained _queryActivitySummaryHistoryWithRemainingRetries:v11];
    }
    else if (v8)
    {
      _HKInitializeLogging();
      unsigned int v13 = (void *)HKLogCoaching;
      if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = v13;
        *(_DWORD *)buf = 134217984;
        id v19 = [v8 count];
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "[Supergreen] Historical activity summary query found %lu summaries.", buf, 0xCu);
      }
      uint64_t v15 = [WeakRetained serialQueue];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_6B30;
      v16[3] = &unk_C478;
      v16[4] = WeakRetained;
      id v17 = v8;
      dispatch_async(v15, v16);
    }
  }
}

id sub_6B30(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[NSSet setWithArray:*(void *)(a1 + 40)];
  objc_msgSend(v2, "_queue_handleNewActivitySummaries:", v3);

  unsigned __int8 v4 = *(void **)(a1 + 32);

  return [v4 _rebuildTypicalDayModel];
}

void sub_6D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_6D3C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v9)
    {
      uint64_t v12 = *(void *)(a1 + 40) - 1;
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_ERROR)) {
        sub_7E88();
      }
      unsigned int v13 = [v11 healthStore];
      [v13 stopQuery:v7];

      [v11 _startCurrentActivitySummaryQueryWithRemainingRetries:v12];
    }
    else if (v8)
    {
      __int16 v14 = [WeakRetained serialQueue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_6E9C;
      v15[3] = &unk_C478;
      v15[4] = v11;
      id v16 = v8;
      dispatch_async(v14, v15);
    }
  }
}

id sub_6E9C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleUpdatedCurrentActivitySummary:", *(void *)(a1 + 40));
}

void sub_6F48(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) healthStore];
  [v2 executeQuery:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) queries];
  uint64_t v3 = [v4 setByAddingObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setQueries:v3];
}

void sub_704C(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "queries", 0);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v6);
        id v8 = [*(id *)(a1 + 32) healthStore];
        [v8 stopQuery:v7];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  id v9 = +[NSSet set];
  [*(id *)(a1 + 32) setQueries:v9];
}

void sub_73F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_7438(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id NLActivityUpNextRelevanceEngineDemoDateFormatter()
{
  if (qword_112C8 != -1) {
    dispatch_once(&qword_112C8, &stru_C520);
  }
  id v0 = (void *)qword_112C0;

  return v0;
}

void sub_74AC(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_112C0;
  qword_112C0 = (uint64_t)v1;

  id v3 = (void *)qword_112C0;

  [v3 setDateFormat:@"HH:mm"];
}

id NLActivityUpNextRelevanceEngineContent(unint64_t a1)
{
  id v2 = objc_alloc_init((Class)REContent);
  id v3 = +[UIImageSymbolConfiguration configurationWithPointSize:30.55];
  uint64_t v4 = +[UIImage _systemImageNamed:@"figure.walk.circle" withConfiguration:v3];
  [v2 setOverrideBodyImage:v4];

  uint64_t v5 = +[NSDate date];
  id v6 = +[NSCalendar currentCalendar];
  uint64_t v7 = [v6 dateByAddingUnit:64 value:a1 toDate:v5 options:0];
  id v8 = +[CLKRelativeDateTextProvider textProviderWithDate:v7 style:0 units:64];
  [v8 setOverrideDate:v5];
  if (a1 <= 0x12 && ((1 << a1) & 0x40900) != 0)
  {
    uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v10 = v9;
    CFStringRef v11 = @"UP_NEXT_ACTIVITY_DESCRIPTION_AN";
  }
  else
  {
    uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v10 = v9;
    CFStringRef v11 = @"UP_NEXT_ACTIVITY_DESCRIPTION";
  }
  long long v12 = [v9 localizedStringForKey:v11 value:&stru_C820 table:@"Localizable"];

  long long v13 = +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v12, v8);
  [v2 setDescription1TextProvider:v13];

  __int16 v14 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v15 = [v14 localizedStringForKey:@"UP_NEXT_ACTIVITY_HEADER" value:&stru_C820 table:@"Localizable"];
  id v16 = +[CLKSimpleTextProvider textProviderWithText:v15];
  [v2 setHeaderTextProvider:v16];

  id v17 = +[ARUIMetricColors energyColors];
  v18 = [v17 nonGradientTextColor];
  [v2 setTintColor:v18];

  return v2;
}

id _NLActivityUpNextRelevanceEngineSampleFeature()
{
  if (qword_112D8 != -1) {
    dispatch_once(&qword_112D8, &stru_C540);
  }
  id v0 = (void *)qword_112D0;

  return v0;
}

void sub_7804(id a1)
{
  qword_112D0 = +[REFeature featureWithName:@"SamplePosition" featureType:2];

  _objc_release_x1();
}

id NLActivityUpNextRelevanceEngineSampleRelevanceProviderForPosition(double a1)
{
  id v2 = _NLActivityUpNextRelevanceEngineSampleFeature();
  id v3 = +[REFeatureValue featureValueWithDouble:a1];
  uint64_t v4 = +[RERelevanceProvider customRelevanceProviderForFeature:v2 withValue:v3];

  return v4;
}

void sub_7B04()
{
  sub_7414();
  sub_73F8(&dword_0, v0, v1, "[Supergreen] Pause requested.", v2, v3, v4, v5, v6);
}

void sub_7B38()
{
  sub_7414();
  sub_73F8(&dword_0, v0, v1, "[Supergreen] Resume requested.", v2, v3, v4, v5, v6);
}

void sub_7B6C()
{
  sub_7414();
  sub_73F8(&dword_0, v0, v1, "[Supergreen] A walk suggestion is not appropriate, not returning any elements.", v2, v3, v4, v5, v6);
}

void sub_7BA0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[Supergreen] Elements requested (section = %@).", (uint8_t *)&v2, 0xCu);
}

void sub_7C18(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[Supergreen] Returning element %@", (uint8_t *)&v2, 0xCu);
}

void sub_7C90()
{
  sub_7414();
  sub_73F8(&dword_0, v0, v1, "[Supergreen] A walk suggestion is appropriate for this interval.", v2, v3, v4, v5, v6);
}

void sub_7CC4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 currentSummary];
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "[Supergreen] Creating element! Current summary = %@", (uint8_t *)&v5, 0xCu);
}

void sub_7D6C()
{
  sub_7414();
  sub_73F8(&dword_0, v0, v1, "[Supergreen] Typical day model is already being rebuilt, not rebuilding.", v2, v3, v4, v5, v6);
}

void sub_7DA0()
{
  sub_7414();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "[Supergreen] No more retries allowed, not retrying historical activity summary query.", v1, 2u);
}

void sub_7DE0()
{
  sub_7420();
  sub_7438(&dword_0, v0, v1, "[Supergreen] Historical activity summary query encountered error %@, remaining retires %lu.");
}

void sub_7E48()
{
  sub_7414();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "[Supergreen] No more retries allowed, not retrying current activity summary query.", v1, 2u);
}

void sub_7E88()
{
  sub_7420();
  sub_7438(&dword_0, v0, v1, "[Supergreen] Current activity summary query encountered error %@, remaining retires %lu.");
}

uint64_t REAbsoluteRelevanceProviderForDate()
{
  return _REAbsoluteRelevanceProviderForDate();
}

uint64_t REDemoDateForIdentifier()
{
  return _REDemoDateForIdentifier();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return _dispatch_queue_attr_make_with_overcommit();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

BOOL notify_is_valid_token(int val)
{
  return _notify_is_valid_token(val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_resume(int token)
{
  return _notify_resume(token);
}

uint32_t notify_suspend(int token)
{
  return _notify_suspend(token);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__activitySummaryIndex(void *a1, const char *a2, ...)
{
  return [a1 _activitySummaryIndex];
}

id objc_msgSend__activitySummaryPredicateForTypicalDateInterval(void *a1, const char *a2, ...)
{
  return [a1 _activitySummaryPredicateForTypicalDateInterval];
}

id objc_msgSend__addNotificationObservers(void *a1, const char *a2, ...)
{
  return [a1 _addNotificationObservers];
}

id objc_msgSend__createWalkSuggestionElement(void *a1, const char *a2, ...)
{
  return [a1 _createWalkSuggestionElement];
}

id objc_msgSend__queryActivitySummaryHistory(void *a1, const char *a2, ...)
{
  return [a1 _queryActivitySummaryHistory];
}

id objc_msgSend__rebuildTypicalDayModel(void *a1, const char *a2, ...)
{
  return [a1 _rebuildTypicalDayModel];
}

id objc_msgSend__removeNotificationObservers(void *a1, const char *a2, ...)
{
  return [a1 _removeNotificationObservers];
}

id objc_msgSend__shouldShowWalkSuggestion(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowWalkSuggestion];
}

id objc_msgSend__significantTimeChangeOccurred(void *a1, const char *a2, ...)
{
  return [a1 _significantTimeChangeOccurred];
}

id objc_msgSend__startCurrentActivitySummaryQuery(void *a1, const char *a2, ...)
{
  return [a1 _startCurrentActivitySummaryQuery];
}

id objc_msgSend__stopQueries(void *a1, const char *a2, ...)
{
  return [a1 _stopQueries];
}

id objc_msgSend__typicalDayDateInterval(void *a1, const char *a2, ...)
{
  return [a1 _typicalDayDateInterval];
}

id objc_msgSend__walkSuggestionDurationInMinutes(void *a1, const char *a2, ...)
{
  return [a1 _walkSuggestionDurationInMinutes];
}

id objc_msgSend__wristOffDate(void *a1, const char *a2, ...)
{
  return [a1 _wristOffDate];
}

id objc_msgSend_activeEnergyBurned(void *a1, const char *a2, ...)
{
  return [a1 activeEnergyBurned];
}

id objc_msgSend_activeEnergyBurnedGoal(void *a1, const char *a2, ...)
{
  return [a1 activeEnergyBurnedGoal];
}

id objc_msgSend_activityMoveMode(void *a1, const char *a2, ...)
{
  return [a1 activityMoveMode];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDate(void *a1, const char *a2, ...)
{
  return [a1 currentDate];
}

id objc_msgSend_currentPeriodOfDay(void *a1, const char *a2, ...)
{
  return [a1 currentPeriodOfDay];
}

id objc_msgSend_currentSummary(void *a1, const char *a2, ...)
{
  return [a1 currentSummary];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_energyColors(void *a1, const char *a2, ...)
{
  return [a1 energyColors];
}

id objc_msgSend_experienceType(void *a1, const char *a2, ...)
{
  return [a1 experienceType];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return [a1 healthStore];
}

id objc_msgSend_historicalSummariesByIndex(void *a1, const char *a2, ...)
{
  return [a1 historicalSummariesByIndex];
}

id objc_msgSend_intervalForCurrentPeriodOfDay(void *a1, const char *a2, ...)
{
  return [a1 intervalForCurrentPeriodOfDay];
}

id objc_msgSend_invalidateElements(void *a1, const char *a2, ...)
{
  return [a1 invalidateElements];
}

id objc_msgSend_isRebuildingTypicalDayModel(void *a1, const char *a2, ...)
{
  return [a1 isRebuildingTypicalDayModel];
}

id objc_msgSend_isUpdatingTypicalDayCachedValues(void *a1, const char *a2, ...)
{
  return [a1 isUpdatingTypicalDayCachedValues];
}

id objc_msgSend_kilocalorieUnit(void *a1, const char *a2, ...)
{
  return [a1 kilocalorieUnit];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nonGradientTextColor(void *a1, const char *a2, ...)
{
  return [a1 nonGradientTextColor];
}

id objc_msgSend_queries(void *a1, const char *a2, ...)
{
  return [a1 queries];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_settingsController(void *a1, const char *a2, ...)
{
  return [a1 settingsController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldSuggestWalk(void *a1, const char *a2, ...)
{
  return [a1 shouldSuggestWalk];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_suggestedWalkTime(void *a1, const char *a2, ...)
{
  return [a1 suggestedWalkTime];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_typicalDayModel(void *a1, const char *a2, ...)
{
  return [a1 typicalDayModel];
}

id objc_msgSend_willCompleteGoal(void *a1, const char *a2, ...)
{
  return [a1 willCompleteGoal];
}

id objc_msgSend_willCompleteMoveGoalWithBufferPercentage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willCompleteMoveGoalWithBufferPercentage:");
}