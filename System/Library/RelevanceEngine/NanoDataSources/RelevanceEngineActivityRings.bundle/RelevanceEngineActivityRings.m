void sub_3C00(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v2 = REUISampleRelevanceProviderForSamplePosition();
  v3 = objc_alloc_init((Class)HKActivitySummary);
  v4 = +[HKUnit kilocalorieUnit];
  v5 = +[HKQuantity quantityWithUnit:v4 doubleValue:500.0];
  [v3 setActiveEnergyBurnedGoal:v5];

  v6 = [v3 activeEnergyBurnedGoal];
  [v3 setActiveEnergyBurned:v6];

  v7 = +[HKUnit minuteUnit];
  v8 = +[HKQuantity quantityWithUnit:v7 doubleValue:30.0];
  [v3 setAppleExerciseTimeGoal:v8];

  v9 = [v3 appleExerciseTimeGoal];
  [v3 setAppleExerciseTime:v9];

  v10 = +[HKUnit countUnit];
  v11 = +[HKQuantity quantityWithUnit:v10 doubleValue:12.0];
  [v3 setAppleStandHoursGoal:v11];

  v12 = [v3 appleStandHoursGoal];
  [v3 setAppleStandHours:v12];

  v13 = RingsElementWithActivitySummary(v3, v2);
  v14 = *(void *)(a1 + 32);
  v16 = v13;
  v15 = +[NSArray arrayWithObjects:&v16 count:1];
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
}

CFStringRef NLActivityRingsBundleIdentifier()
{
  return @"com.apple.ActivityMonitorApp";
}

CFStringRef NLActivityRingsElementIdentifier()
{
  return @"com.apple.Activity.Rings";
}

id _FormattingManager()
{
  if (qword_C760 != -1) {
    dispatch_once(&qword_C760, &stru_8320);
  }
  v0 = (void *)qword_C758;

  return v0;
}

void sub_3E80(id a1)
{
  id v4 = +[HKHealthStore fiui_sharedHealthStoreForCarousel];
  id v1 = [objc_alloc((Class)FIUIUnitManager) initWithHealthStore:v4];
  id v2 = [objc_alloc((Class)FIUIFormattingManager) initWithUnitManager:v1];
  v3 = (void *)qword_C758;
  qword_C758 = (uint64_t)v2;
}

id RingsElementWithActivitySummary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v113 = v3;
  if (FIActivitySummaryHasNonZeroMoveGoal())
  {
    id v112 = objc_alloc_init((Class)REContent);
    [v112 setStyle:3];
    id v110 = v4;
    if ([v3 activityMoveMode] == (char *)&dword_0 + 2)
    {
      v5 = +[HKUnit minuteUnit];
    }
    else
    {
      v8 = _FormattingManager();
      v9 = [v8 unitManager];
      v5 = [v9 userActiveEnergyBurnedUnit];
    }
    v10 = FIMoveQuantityForActivitySummary();
    v11 = FIMoveGoalQuantityForActivitySummary();
    v108 = v10;
    [v10 doubleValueForUnit:v5];
    double v13 = v12;
    v107 = v11;
    [v11 doubleValueForUnit:v5];
    double v104 = v14;
    v15 = +[NSNumber numberWithDouble:v13];
    v16 = +[HKUnit minuteUnit];
    LODWORD(v11) = [v5 isEqual:v16];

    v109 = v5;
    if (v11)
    {
      v17 = FIUIBundle();
      CFStringRef v18 = @"Localizable-tinker";
      uint64_t v19 = [v17 localizedStringForKey:@"ACTIVITY_MOVE_VALUE_MIN_UNIT_FORMAT" value:&stru_84F0 table:@"Localizable-tinker"];

      v20 = FIUIBundle();
      v21 = v20;
      CFStringRef v22 = @"ACTIVITY_MOVE_VALUE_MIN_UNIT";
    }
    else
    {
      v23 = +[HKUnit jouleUnitWithMetricPrefix:9];
      unsigned int v24 = [v5 isEqual:v23];

      if (!v24)
      {
        v28 = +[HKUnit largeCalorieUnit];
        unsigned int v29 = [v5 isEqual:v28];

        v30 = FIUIBundle();
        v27 = [v30 localizedStringForKey:@"ACTIVITY_MOVE_VALUE_KCAL_UNIT_FORMAT" value:&stru_84F0 table:@"Localizable"];

        v20 = FIUIBundle();
        v21 = v20;
        if (v29) {
          CFStringRef v22 = @"ACTIVITY_MOVE_VALUE_CAL_UNIT";
        }
        else {
          CFStringRef v22 = @"ACTIVITY_MOVE_VALUE_KCAL_UNIT";
        }
        CFStringRef v26 = @"Localizable";
        goto LABEL_17;
      }
      v25 = FIUIBundle();
      CFStringRef v18 = @"Localizable";
      uint64_t v19 = [v25 localizedStringForKey:@"ACTIVITY_MOVE_VALUE_KJ_UNIT_FORMAT" value:&stru_84F0 table:@"Localizable"];

      v20 = FIUIBundle();
      v21 = v20;
      CFStringRef v22 = @"ACTIVITY_MOVE_VALUE_KJ_UNIT";
    }
    CFStringRef v26 = v18;
    v27 = (void *)v19;
LABEL_17:
    v31 = [v20 localizedStringForKey:v22 value:&stru_84F0 table:v26];
    v32 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v31, [v15 integerValue]);

    uint64_t v33 = +[FIUIFormattingManager stringWithNumber:v15 decimalPrecision:1];
    uint64_t v34 = [v32 localizedLowercaseString];

    id v35 = [v27 rangeOfString:@"<value>"];
    v105 = v27;
    v106 = v15;
    v102 = (void *)v34;
    v103 = (void *)v33;
    if (v35 <= [v27 rangeOfString:@"<unit>"]) {
      +[NSString stringWithFormat:@"%@ %@", v33, v34];
    }
    else {
    v101 = +[NSString stringWithFormat:@"%@ %@", v34, v33];
    }
    v36 = +[CLKSimpleTextProvider textProviderWithText:v101];
    [v36 setUseLowercaseSmallCaps:1];
    v100 = v36;
    [v112 setHeaderTextProvider:v36];
    [v112 setHeaderFontStyle:0];
    v37 = [v3 appleExerciseTime];
    v38 = +[HKUnit minuteUnit];
    [v37 doubleValueForUnit:v38];
    double v40 = v39;

    v41 = [v3 appleExerciseTimeGoal];
    v42 = +[HKUnit minuteUnit];
    [v41 doubleValueForUnit:v42];
    double v44 = v43;

    v45 = +[NSNumber numberWithDouble:v40];
    v46 = FIUIBundle();
    v47 = [v46 localizedStringForKey:@"ACTIVITY_EXERCISE_VALUE_UNIT_FORMAT" value:&stru_84F0 table:@"Localizable"];

    uint64_t v48 = +[FIUIFormattingManager stringWithNumber:v45 decimalPrecision:1];
    v49 = FIUIBundle();
    v50 = [v49 localizedStringForKey:@"ACTIVITY_EXERCISE_VALUE_UNIT" value:&stru_84F0 table:@"Localizable"];
    v99 = v45;
    v51 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v50, [v45 integerValue]);

    uint64_t v52 = [v51 localizedLowercaseString];

    id v53 = [v47 rangeOfString:@"<value>"];
    v98 = v47;
    v96 = (void *)v52;
    if (v53 <= [v47 rangeOfString:@"<unit>"]) {
      +[NSString stringWithFormat:@"%@ %@", v48, v52];
    }
    else {
    v95 = +[NSString stringWithFormat:@"%@ %@", v52, v48];
    }
    v54 = +[CLKSimpleTextProvider textProviderWithText:v95];
    [v54 setUseLowercaseSmallCaps:1];
    v94 = v54;
    [v112 setDescription1TextProvider:v54];
    [v112 setDescription1FontStyle:0];
    v55 = [v3 appleStandHours];
    v56 = +[HKUnit countUnit];
    [v55 doubleValueForUnit:v56];
    double v58 = v57;

    v59 = [v3 appleStandHoursGoal];
    v60 = +[HKUnit countUnit];
    [v59 doubleValueForUnit:v60];
    double v62 = v61;

    v63 = +[NSNumber numberWithDouble:v58];
    v64 = FIUIBundle();
    v65 = [v64 localizedStringForKey:@"ACTIVITY_STAND_VALUE_UNIT_FORMAT" value:&stru_84F0 table:@"Localizable"];

    v111 = +[FIUIFormattingManager stringWithNumber:v63 decimalPrecision:1];
    v66 = FIUIBundle();
    v67 = [v66 localizedStringForKey:@"ACTIVITY_STAND_VALUE_UNIT" value:&stru_84F0 table:@"Localizable"];
    v93 = v63;
    v68 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v67, [v63 integerValue]);

    uint64_t v69 = [v68 localizedLowercaseString];

    id v70 = [v65 rangeOfString:@"<value>"];
    v92 = v65;
    v97 = (void *)v48;
    v91 = (void *)v69;
    if (v70 <= [v65 rangeOfString:@"<unit>"]) {
      +[NSString stringWithFormat:@"%@ %@", v111, v69];
    }
    else {
    v90 = +[NSString stringWithFormat:@"%@ %@", v69, v111];
    }
    v71 = +[CLKSimpleTextProvider textProviderWithText:v90];
    [v71 setUseLowercaseSmallCaps:1];
    [v112 setDescription2TextProvider:v71];
    [v112 setDescription2FontStyle:0];
    v88 = +[ARUIRingGroupController ringGroupControllerConfiguredForWatchWithRingType:3 withIcon:0];
    v89 = +[CLKUIMetalResourceManager sharedCommandQueue];
    id v87 = [objc_alloc((Class)ARUIRingsViewRenderer) initWithMaximumRingCount:3 commandQueue:v89];
    id v72 = [objc_alloc((Class)ARUIRingsView) initWithRingGroupController:v88 renderer:v87];
    double v73 = sub_4A3C();
    sub_4A3C();
    double v75 = v74;
    sub_4A3C();
    double v77 = v76;
    v78 = +[UIColor colorWithWhite:0.45 alpha:0.15];
    v79 = +[ARUIRingsImageFactory renderRingsWithBackgroundColor:v78 usingRingsView:v72 forMovePercentage:v13 / v104 exercisePercentage:v40 / v44 standPercentage:v58 / v62 withDiameter:v73 thickness:v75 interspacing:v77];

    [v112 setOverrideBodyImage:v79];
    id v80 = objc_alloc_init((Class)CLKImageProvider);
    [v80 setForegroundAccentImage:v79];
    [v80 setForegroundAccentImageTinted:1];
    [v112 setBodyImageProvider:v80];
    id v81 = objc_alloc((Class)REElementOpenAction);
    v82 = +[NSURL URLWithString:@"ActivityMonitorApp://"];
    id v83 = [v81 initWithURL:v82 applicationID:@"com.apple.ActivityMonitorApp"];

    id v84 = objc_alloc((Class)REElement);
    id v4 = v110;
    id v115 = v110;
    v85 = +[NSArray arrayWithObjects:&v115 count:1];
    id v7 = [v84 initWithIdentifier:@"com.apple.Activity.Rings" content:v112 action:v83 relevanceProviders:v85 privacyBehavior:1];

    goto LABEL_27;
  }
  _HKInitializeLogging();
  v6 = HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[Supergreen-Rings] Activity is not configured by user--returning nil element", buf, 2u);
  }
  id v7 = 0;
LABEL_27:

  return v7;
}

double sub_4A3C()
{
  if (qword_C780 != -1) {
    dispatch_once(&qword_C780, &stru_8340);
  }
  return *(double *)&qword_C768;
}

void sub_4A90(id a1)
{
  qword_C768 = 0x404AA66666666666;
  qword_C770 = 0x4016000000000000;
  qword_C778 = 0x4004000000000000;
}

void sub_4E7C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  NLActivityRingsElementIdentifier();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 hasElementWithId:v3 inSectionWithIdentifier:REDefaultSectionIdentifier];
}

void sub_4EEC(uint64_t a1)
{
  _HKInitializeLogging();
  id v2 = (void *)HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      CFStringRef v3 = @"Reloading";
    }
    else {
      CFStringRef v3 = @"Adding";
    }
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = [v4 currentSummary];
    *(_DWORD *)buf = 138412546;
    CFStringRef v14 = v3;
    __int16 v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[Supergreen-Rings] %@ element with current summary = %@", buf, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) currentSummary];
  v8 = [*(id *)(a1 + 32) downtimeRelevanceProvider];
  v9 = RingsElementWithActivitySummary(v7, v8);

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 40) reloadElement:v9];
  }
  else if (v9)
  {
    v10 = *(void **)(a1 + 40);
    double v12 = v9;
    v11 = +[NSArray arrayWithObjects:&v12 count:1];
    [v10 addElements:v11 toSectionWithIdentifier:REDefaultSectionIdentifier];
  }
}

void sub_5378(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentSummary];

  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_5458;
    v5[3] = &unk_83B8;
    CFStringRef v3 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void sub_5458(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentSummary];
  CFStringRef v3 = [*(id *)(a1 + 32) downtimeRelevanceProvider];
  id v4 = RingsElementWithActivitySummary(v2, v3);

  _HKInitializeLogging();
  v5 = HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[Supergreen-Rings] Returning element %@", buf, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v4)
  {
    v8 = v4;
    id v7 = +[NSArray arrayWithObjects:&v8 count:1];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, &__NSArray0__struct);
  }
}

void sub_5724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5748(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v9)
    {
      uint64_t v12 = *(void *)(a1 + 40) - 1;
      _HKInitializeLogging();
      double v13 = HKLogCoaching;
      if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_ERROR)) {
        sub_5DC8((uint64_t)v9, v12, v13);
      }
      CFStringRef v14 = [v11 healthStore];
      [v14 stopQuery:v7];

      [v11 _startCurrentActivitySummaryQueryWithRemainingRetries:v12];
    }
    else if (v8)
    {
      __int16 v15 = WeakRetained[2];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_58A0;
      v16[3] = &unk_83E0;
      v16[4] = WeakRetained;
      id v17 = v8;
      dispatch_async(v15, v16);
    }
  }
}

void sub_58A0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentSummary];
  if (!v2) {
    goto LABEL_3;
  }
  CFStringRef v3 = (void *)v2;
  id v4 = [*(id *)(a1 + 32) currentSummary];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = _FormattingManager();
  id v7 = [v6 unitManager];
  id v8 = [v7 userActiveEnergyBurnedUnit];
  LODWORD(v5) = [v4 isNoticeablyDifferentFromActivitySummary:v5 comparingGoalTypes:0 userActiveEnergyBurnedUnit:v8];

  if (v5)
  {
LABEL_3:
    [*(id *)(a1 + 32) setCurrentSummary:*(void *)(a1 + 40)];
    id v9 = *(void **)(a1 + 32);
    [v9 _generateRingsElement];
  }
}

void sub_5A28(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) healthStore];
  [v2 executeQuery:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) queries];
  CFStringRef v3 = [v4 setByAddingObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setQueries:v3];
}

void sub_5B2C(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "queries", 0);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v6);
        id v8 = [*(id *)(a1 + 32) healthStore];
        [v8 stopQuery:v7];

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  id v9 = +[NSSet set];
  [*(id *)(a1 + 32) setQueries:v9];
}

void sub_5D84(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[Supergreen-Rings] No more retries allowed, not retrying current activity summary query.", v1, 2u);
}

void sub_5DC8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[Supergreen-Rings] Current activity summary query encountered error %@, remaining retries %lu.", (uint8_t *)&v3, 0x16u);
}

uint64_t FIActivitySummaryHasNonZeroMoveGoal()
{
  return _FIActivitySummaryHasNonZeroMoveGoal();
}

uint64_t FIMoveGoalQuantityForActivitySummary()
{
  return _FIMoveGoalQuantityForActivitySummary();
}

uint64_t FIMoveQuantityForActivitySummary()
{
  return _FIMoveQuantityForActivitySummary();
}

uint64_t FIUIBundle()
{
  return _FIUIBundle();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return _HKCreateSerialDispatchQueue();
}

uint64_t REUISampleRelevanceProviderForSamplePosition()
{
  return _REUISampleRelevanceProviderForSamplePosition();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_msgSend__startCurrentActivitySummaryQuery(void *a1, const char *a2, ...)
{
  return [a1 _startCurrentActivitySummaryQuery];
}

id objc_msgSend__stopQueries(void *a1, const char *a2, ...)
{
  return [a1 _stopQueries];
}

id objc_msgSend_activeEnergyBurnedGoal(void *a1, const char *a2, ...)
{
  return [a1 activeEnergyBurnedGoal];
}

id objc_msgSend_activityMoveMode(void *a1, const char *a2, ...)
{
  return [a1 activityMoveMode];
}

id objc_msgSend_appleExerciseTime(void *a1, const char *a2, ...)
{
  return [a1 appleExerciseTime];
}

id objc_msgSend_appleExerciseTimeGoal(void *a1, const char *a2, ...)
{
  return [a1 appleExerciseTimeGoal];
}

id objc_msgSend_appleStandHours(void *a1, const char *a2, ...)
{
  return [a1 appleStandHours];
}

id objc_msgSend_appleStandHoursGoal(void *a1, const char *a2, ...)
{
  return [a1 appleStandHoursGoal];
}

id objc_msgSend_countUnit(void *a1, const char *a2, ...)
{
  return [a1 countUnit];
}

id objc_msgSend_currentSummary(void *a1, const char *a2, ...)
{
  return [a1 currentSummary];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_downtimeRelevanceProvider(void *a1, const char *a2, ...)
{
  return [a1 downtimeRelevanceProvider];
}

id objc_msgSend_elementOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 elementOperationQueue];
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return [a1 healthStore];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidateElements(void *a1, const char *a2, ...)
{
  return [a1 invalidateElements];
}

id objc_msgSend_kilocalorieUnit(void *a1, const char *a2, ...)
{
  return [a1 kilocalorieUnit];
}

id objc_msgSend_largeCalorieUnit(void *a1, const char *a2, ...)
{
  return [a1 largeCalorieUnit];
}

id objc_msgSend_localizedLowercaseString(void *a1, const char *a2, ...)
{
  return [a1 localizedLowercaseString];
}

id objc_msgSend_minuteUnit(void *a1, const char *a2, ...)
{
  return [a1 minuteUnit];
}

id objc_msgSend_queries(void *a1, const char *a2, ...)
{
  return [a1 queries];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 sharedCommandQueue];
}

id objc_msgSend_unitManager(void *a1, const char *a2, ...)
{
  return [a1 unitManager];
}

id objc_msgSend_userActiveEnergyBurnedUnit(void *a1, const char *a2, ...)
{
  return [a1 userActiveEnergyBurnedUnit];
}