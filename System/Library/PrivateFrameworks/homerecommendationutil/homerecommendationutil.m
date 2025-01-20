uint64_t start(int a1, const char **a2)
{
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HomeRecommendationUtilDriver *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;

  v4 = objc_opt_new();
  if (a1 < 1)
  {
    v29 = 0;
    v32 = 0;
    v6 = 0;
    v35 = 0;
    v30 = 0;
    v31 = 0;
    v33 = 0;
    v34 = 0;
LABEL_29:
    v16 = (void *)v34;
    v17 = (void *)v33;
    v19 = (void *)v30;
    v18 = (void *)v31;
    v20 = [[HomeRecommendationUtilDriver alloc] initWithArgs:v4 homeID:v34 templateName:v33 serviceID:v31 accessoryID:v30];
    v9 = v20;
    if (v35) {
      [(HomeRecommendationUtilDriver *)v20 setAutoCommit:1];
    }
    v21 = v28;
    v22 = (void *)v29;
    v23 = v32;
    if (v32) {
      [v9 setExtraOptions:v32];
    }
    if (v29) {
      [v9 setRecommendationID:v29];
    }
    if ([v6 isEqualToString:@"lights"])
    {
      v24 = +[HFAccessoryTypeGroup lightAccessoryTypeGroup];
    }
    else if ([v6 isEqualToString:@"water"])
    {
      v24 = +[HFAccessoryTypeGroup waterAccessoryTypeGroup];
    }
    else if ([v6 isEqualToString:@"media"])
    {
      v24 = +[HFAccessoryTypeGroup mediaAccessoryTypeGroup];
    }
    else if ([v6 isEqualToString:@"security"])
    {
      v24 = +[HFAccessoryTypeGroup securityAccessoryTypeGroup];
    }
    else if ([v6 isEqualToString:@"climate"])
    {
      v24 = +[HFAccessoryTypeGroup climateAccessoryTypeGroup];
    }
    else
    {
      if (![v6 isEqualToString:@"energy"])
      {
LABEL_49:
        [v9 start];
        goto LABEL_50;
      }
      v24 = +[HFAccessoryTypeGroup energyAccessoryTypeGroup];
    }
    v25 = (void *)v24;
    [v9 setTypeGroup:v24];

    v23 = v32;
    goto LABEL_49;
  }
  v5 = 0;
  v34 = 0;
  v33 = 0;
  v30 = 0;
  v31 = 0;
  v35 = 0;
  v6 = 0;
  v32 = 0;
  v29 = 0;
  v7 = 8 * a1;
  v27 = (a1 - 1);
  while (1)
  {
    v8 = v6;
    v9 = +[NSString stringWithUTF8String:a2[v5 / 8]];
    [v4 addObject:v9];
    v10 = [v9 length];
    if ((unint64_t)v10 >= 2) {
      v11 = 2;
    }
    else {
      v11 = (uint64_t)v10;
    }
    v12 = [v9 substringToIndex:v11];
    v13 = [v12 isEqualToString:@"--"];

    if (!v13) {
      goto LABEL_9;
    }
    if ([v9 isEqualToString:@"--auto-commit"])
    {
      v35 = 1;
LABEL_9:
      v6 = v8;
      goto LABEL_26;
    }
    v6 = v8;
    if (8 * v27 == v5) {
      break;
    }
    if ([v9 isEqualToString:@"--home"])
    {
      +[NSString stringWithUTF8String:a2[v5 / 8 + 1]];
      v34 = v14 = (void *)v34;
LABEL_25:

      goto LABEL_26;
    }
    if ([v9 isEqualToString:@"--template"])
    {
      +[NSString stringWithUTF8String:a2[v5 / 8 + 1]];
      v33 = v14 = (void *)v33;
      goto LABEL_25;
    }
    if ([v9 isEqualToString:@"--service"])
    {
      +[NSString stringWithUTF8String:a2[v5 / 8 + 1]];
      v31 = v14 = (void *)v31;
      goto LABEL_25;
    }
    if ([v9 isEqualToString:@"--accessory"])
    {
      +[NSString stringWithUTF8String:a2[v5 / 8 + 1]];
      v30 = v14 = (void *)v30;
      goto LABEL_25;
    }
    if ([v9 isEqualToString:@"--recommendation"])
    {
      +[NSString stringWithUTF8String:a2[v5 / 8 + 1]];
      v29 = v14 = (void *)v29;
      goto LABEL_25;
    }
    if ([v9 isEqualToString:@"--options"])
    {
      v14 = +[NSString stringWithUTF8String:a2[v5 / 8 + 1]];
      v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 integerValue]);

      v32 = (void *)v15;
      v6 = v8;
      goto LABEL_25;
    }
    if ([v9 isEqualToString:@"--typeGroup"])
    {
      +[NSString stringWithUTF8String:a2[v5 / 8 + 1]];
      v6 = v14 = v8;
      goto LABEL_25;
    }
LABEL_26:

    v5 += 8;
    if (v7 == v5) {
      goto LABEL_29;
    }
  }
  printf("Incorrect usage: %s %s [parameter value]\n", *a2, a2[v27]);
  v21 = v28;
  v22 = (void *)v29;
  v16 = (void *)v34;
  v23 = v32;
  v17 = (void *)v33;
  v19 = (void *)v30;
  v18 = (void *)v31;
LABEL_50:

  return 0;
}

void sub_100003740(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) dispatchGroup];
  dispatch_group_leave(v1);
}

id sub_100003954(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) home];
  NSLog(@"Selected home: %@", v2);

  v3 = [*(id *)(a1 + 32) serviceID];

  if (!v3) {
    goto LABEL_3;
  }
  v4 = [*(id *)(a1 + 32) home];
  v5 = [v4 accessories];
  v6 = objc_msgSend(v5, "na_flatMap:", &stru_100008288);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100003CB0;
  v26[3] = &unk_1000082B0;
  v26[4] = *(void *)(a1 + 32);
  v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", v26);
  [*(id *)(a1 + 32) setService:v7];

  v8 = [*(id *)(a1 + 32) service];

  if (!v8)
  {
    uint64_t v22 = 2;
  }
  else
  {
LABEL_3:
    v9 = [*(id *)(a1 + 32) accessoryID];

    if (!v9) {
      goto LABEL_5;
    }
    v10 = [*(id *)(a1 + 32) home];
    id v11 = objc_alloc((Class)NSUUID);
    v12 = [*(id *)(a1 + 32) accessoryID];
    id v13 = [v11 initWithUUIDString:v12];
    v14 = objc_msgSend(v10, "hf_accessoryWithIdentifier:", v13);
    [*(id *)(a1 + 32) setAccessory:v14];

    v15 = [*(id *)(a1 + 32) accessory];

    if (!v15)
    {
      uint64_t v22 = 3;
    }
    else
    {
LABEL_5:
      v16 = [*(id *)(a1 + 32) templateName];

      if (!v16) {
        goto LABEL_7;
      }
      v17 = +[HRETemplateRecommendationGenerator allAvailableTemplates];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100003D24;
      v25[3] = &unk_1000082D8;
      v25[4] = *(void *)(a1 + 32);
      v18 = objc_msgSend(v17, "na_firstObjectPassingTest:", v25);
      [*(id *)(a1 + 32) setTemplate:v18];

      v19 = [*(id *)(a1 + 32) template];

      if (v19)
      {
LABEL_7:
        id v20 = objc_alloc_init((Class)HRERecommendationEngine);
        [*(id *)(a1 + 32) setRecommendationEngine:v20];

        v21 = [*(id *)(a1 + 32) loadRecommendations];
        goto LABEL_12;
      }
      uint64_t v22 = 1;
    }
  }
  v23 = +[NSError errorWithDomain:@"HomeRecommendationUtilDriver" code:v22 userInfo:0];
  v21 = +[NAFuture futureWithError:v23];

LABEL_12:

  return v21;
}

NSArray *__cdecl sub_100003CA8(id a1, HMAccessory *a2)
{
  return [(HMAccessory *)a2 services];
}

id sub_100003CB0(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  v4 = [v3 UUIDString];
  v5 = [*(id *)(a1 + 32) serviceID];
  id v6 = [v4 isEqualToString:v5];

  return v6;
}

id sub_100003D24(uint64_t a1, void *a2)
{
  v3 = [a2 title];
  v4 = [v3 lowercaseString];
  v5 = [*(id *)(a1 + 32) templateName];
  id v6 = [v5 lowercaseString];
  id v7 = [v4 isEqualToString:v6];

  return v7;
}

id sub_100003DB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(@"%@", @"===============================");
  if (v3)
  {
    id v4 = v3;
    v5 = [*(id *)(a1 + 32) recommendationID];

    if (v5)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100003F64;
      v12[3] = &unk_100008328;
      v12[4] = *(void *)(a1 + 32);
      uint64_t v6 = objc_msgSend(v4, "na_filter:", v12);

      id v4 = (id)v6;
    }
    id v7 = [v4 debugDescription];
    NSLog(@"Recommendations: %@", v7);

    if ([*(id *)(a1 + 32) autoCommit])
    {
      NSLog(@"%@", @"===============================");
      NSLog(@"Auto-committing first recommendation...");
      v8 = *(void **)(a1 + 32);
      v9 = [v4 firstObject];
      v10 = [v8 commit:v9];

      goto LABEL_9;
    }
  }
  else
  {
    NSLog(@"No recommendations available");
  }
  NSLog(@"%@", @"===============================");
  v10 = +[NAFuture futureWithNoResult];
LABEL_9:

  return v10;
}

id sub_100003F64(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) recommendationID];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_100003FC8(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  [*(id *)(a1 + 32) logError:a3];
  if ([*(id *)(a1 + 32) autoCommit])
  {
    objc_opt_class();
    id v5 = v8;
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    if (v7) {
      NSLog(@"Committed recommendation: %@", v7);
    }
    NSLog(@"%@", @"===============================");
    NSLog(@"%@", @"===============================");
  }
}

NAFuture *__cdecl sub_1000043B0(id a1, NSSet *a2)
{
  v2 = [(NSSet *)a2 allObjects];
  id v3 = +[NAFuture futureWithResult:v2];

  return (NAFuture *)v3;
}

NAFuture *__cdecl sub_100004528(id a1, NSError *a2)
{
  CFStringRef v7 = @"error";
  id v8 = a2;
  v2 = a2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v4 = +[NSError errorWithDomain:@"HomeRecommendationUtilDriver" code:4 userInfo:v3];
  id v5 = +[NAFuture futureWithError:v4];

  return (NAFuture *)v5;
}

id sub_1000048B4(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = [*(id *)(a1 + 32) homeID];
  id v6 = [v4 isEqualToString:v5];

  return v6;
}

id sub_100004928(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  id v4 = [*(id *)(a1 + 32) homeID];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_10000498C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) homeFuture];
  v2 = [*(id *)(a1 + 32) home];
  [v3 finishWithResult:v2];
}

void NSLog(NSString *format, ...)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

int printf(const char *a1, ...)
{
  return _printf(a1);
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_accessories(void *a1, const char *a2, ...)
{
  return [a1 accessories];
}

id objc_msgSend_accessory(void *a1, const char *a2, ...)
{
  return [a1 accessory];
}

id objc_msgSend_accessoryID(void *a1, const char *a2, ...)
{
  return [a1 accessoryID];
}

id objc_msgSend_allAvailableTemplates(void *a1, const char *a2, ...)
{
  return [a1 allAvailableTemplates];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_autoCommit(void *a1, const char *a2, ...)
{
  return [a1 autoCommit];
}

id objc_msgSend_climateAccessoryTypeGroup(void *a1, const char *a2, ...)
{
  return [a1 climateAccessoryTypeGroup];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commitItem(void *a1, const char *a2, ...)
{
  return [a1 commitItem];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_dispatchGroup(void *a1, const char *a2, ...)
{
  return [a1 dispatchGroup];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_energyAccessoryTypeGroup(void *a1, const char *a2, ...)
{
  return [a1 energyAccessoryTypeGroup];
}

id objc_msgSend_extraOptions(void *a1, const char *a2, ...)
{
  return [a1 extraOptions];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_futureWithNoResult(void *a1, const char *a2, ...)
{
  return [a1 futureWithNoResult];
}

id objc_msgSend_home(void *a1, const char *a2, ...)
{
  return [a1 home];
}

id objc_msgSend_homeFuture(void *a1, const char *a2, ...)
{
  return [a1 homeFuture];
}

id objc_msgSend_homeID(void *a1, const char *a2, ...)
{
  return [a1 homeID];
}

id objc_msgSend_homeManager(void *a1, const char *a2, ...)
{
  return [a1 homeManager];
}

id objc_msgSend_homes(void *a1, const char *a2, ...)
{
  return [a1 homes];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lightAccessoryTypeGroup(void *a1, const char *a2, ...)
{
  return [a1 lightAccessoryTypeGroup];
}

id objc_msgSend_loadRecommendations(void *a1, const char *a2, ...)
{
  return [a1 loadRecommendations];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return [a1 mainThreadScheduler];
}

id objc_msgSend_mediaAccessoryTypeGroup(void *a1, const char *a2, ...)
{
  return [a1 mediaAccessoryTypeGroup];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_recommendationEngine(void *a1, const char *a2, ...)
{
  return [a1 recommendationEngine];
}

id objc_msgSend_recommendationID(void *a1, const char *a2, ...)
{
  return [a1 recommendationID];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_securityAccessoryTypeGroup(void *a1, const char *a2, ...)
{
  return [a1 securityAccessoryTypeGroup];
}

id objc_msgSend_selectedActionSetBuilder(void *a1, const char *a2, ...)
{
  return [a1 selectedActionSetBuilder];
}

id objc_msgSend_selectedTriggerBuilder(void *a1, const char *a2, ...)
{
  return [a1 selectedTriggerBuilder];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceID(void *a1, const char *a2, ...)
{
  return [a1 serviceID];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_template(void *a1, const char *a2, ...)
{
  return [a1 template];
}

id objc_msgSend_templateName(void *a1, const char *a2, ...)
{
  return [a1 templateName];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_typeGroup(void *a1, const char *a2, ...)
{
  return [a1 typeGroup];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_waterAccessoryTypeGroup(void *a1, const char *a2, ...)
{
  return [a1 waterAccessoryTypeGroup];
}