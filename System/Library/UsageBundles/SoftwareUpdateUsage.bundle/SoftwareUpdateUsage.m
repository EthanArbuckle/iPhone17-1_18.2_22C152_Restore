void sub_24AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_24D4(uint64_t a1)
{
}

void sub_24DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = a3;
  id v4 = objc_alloc((Class)SUAnalyticsEvent);
  id v5 = [v4 initWithEventName:kSUAnalyticsUsageEventName];
  [v5 setEventPayloadEntry:kSUAnalyticsUserInteractionType stringValue:kSUUpdateDeletedFromUI];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) submitSUAnalyticsEvent:v5];
  v6 = [*(id *)(a1 + 32) view];
  [v6 setUserInteractionEnabled:1];

  v7 = +[PSNavBarSpinnerManager sharedSpinnerManager];
  [v7 stopAnimatingForIdentifier:@"softwareUpdateDeletion"];

  if (!v15) {
    goto LABEL_4;
  }
  v8 = [v15 domain];
  if ([v8 isEqualToString:SUErrorDomain])
  {
    v9 = (char *)[v15 code];

    id v10 = v15;
    if (v9 == (unsigned char *)&dword_0 + 3)
    {
LABEL_4:
      v11 = +[ICQUsageStorageMonitor sharedMonitor];
      [v11 clearUsageDataCache];

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + OBJC_IVAR___PSViewController__parentController));
      [WeakRetained reloadSpecifiers];

      v13 = [*(id *)(a1 + 32) navigationController];
      id v14 = [v13 popViewControllerAnimated:1];

      goto LABEL_7;
    }
  }
  else
  {

    id v10 = v15;
  }
  NSLog(@"Error deleting update: %@", v10);
LABEL_7:
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
}

void sub_27EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2804(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2814(uint64_t a1)
{
}

void sub_281C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [v6 descriptor];
  id v8 = [v6 totalSpaceConsumed];

  if (v8)
  {
    id v9 = objc_alloc_init((Class)PSUsageBundleApp);
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 8);
    *(void *)(v10 + 8) = v9;

    v12 = *(void **)(*(void *)(a1 + 32) + 8);
    v13 = [v7 humanReadableUpdateName];
    [v12 setName:v13];

    *(float *)&double v14 = (float)(unint64_t)v8;
    [*(id *)(*(void *)(a1 + 32) + 8) setTotalSize:v14];
    [*(id *)(*(void *)(a1 + 32) + 8) setBundleIdentifier:@"com.apple.Preferences"];
    if ([v5 type] == (char *)&dword_0 + 1) {
      [*(id *)(*(void *)(a1 + 32) + 8) setDeletionRestricted:1];
    }
    id v15 = [v7 humanReadableUpdateName];
    v16 = +[PSUsageBundleCategory categoryNamed:v15 withIdentifier:@"com.apple.softwareupdate" forUsageBundleApp:*(void *)(*(void *)(a1 + 32) + 8)];

    v17 = *(void **)(*(void *)(a1 + 32) + 8);
    v22 = v16;
    v18 = +[NSArray arrayWithObjects:&v22 count:1];
    [v17 setCategories:v18];

    id v19 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", *(void *)(*(void *)(a1 + 32) + 8), 0);
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  [*(id *)(a1 + 48) invalidate];
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_clearUsageDataCache(void *a1, const char *a2, ...)
{
  return [a1 clearUsageDataCache];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_humanReadableUpdateName(void *a1, const char *a2, ...)
{
  return [a1 humanReadableUpdateName];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isDeletionRestricted(void *a1, const char *a2, ...)
{
  return [a1 isDeletionRestricted];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_sharedSpinnerManager(void *a1, const char *a2, ...)
{
  return [a1 sharedSpinnerManager];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_totalSize(void *a1, const char *a2, ...)
{
  return [a1 totalSize];
}

id objc_msgSend_totalSpaceConsumed(void *a1, const char *a2, ...)
{
  return [a1 totalSpaceConsumed];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_usageDetailHeaderHeight(void *a1, const char *a2, ...)
{
  return [a1 usageDetailHeaderHeight];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}