@interface SearchUICalendarStore
+ (id)colorForDefaultCalendarForNewEvents;
+ (id)eventControllerWithIdentifier:(id)a3;
+ (id)sharedCalendarStore;
+ (void)fetchCalendarItemFromEventIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation SearchUICalendarStore

+ (id)sharedCalendarStore
{
  v2 = (void *)sharedCalendarStore_calendarStore;
  if (!sharedCalendarStore_calendarStore)
  {
    if (sharedCalendarStore_onceToken != -1) {
      dispatch_once(&sharedCalendarStore_onceToken, &__block_literal_global_6);
    }
    v2 = (void *)sharedCalendarStore_calendarStore;
  }
  return v2;
}

uint64_t __44__SearchUICalendarStore_sharedCalendarStore__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedCalendarStore_calendarStore;
  sharedCalendarStore_calendarStore = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)fetchCalendarItemFromEventIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = [a3 componentsSeparatedByString:@"."];
  v7 = +[SearchUICalendarStore sharedCalendarStore];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__SearchUICalendarStore_fetchCalendarItemFromEventIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1E6E72B38;
  id v12 = v7;
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = v7;
  [v10 requestFullAccessToEventsWithCompletion:v11];
}

void __80__SearchUICalendarStore_fetchCalendarItemFromEventIdentifier_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) firstObject];
    id v9 = [v7 calendarItemsWithExternalIdentifier:v8];
    id v10 = [v9 firstObject];

    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = 0;
    if (!v5) {
      goto LABEL_8;
    }
  }
  v11 = SearchUIGeneralLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __80__SearchUICalendarStore_fetchCalendarItemFromEventIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v6, v11);
  }

LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)eventControllerWithIdentifier:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"."];
  v4 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
  id v5 = [v4 componentsJoinedByString:@"."];
  v6 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 doubleValue];
  v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  id v8 = +[SearchUICalendarStore sharedCalendarStore];
  id v9 = [v3 firstObject];
  id v10 = [v8 calendarItemsWithExternalIdentifier:v9];
  v11 = [v10 firstObject];

  id v12 = +[SearchUICalendarStore sharedCalendarStore];
  id v13 = [v11 uniqueId];
  id v14 = [v12 eventWithUniqueId:v13 occurrenceDate:v7];

  if (v14) {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F256D0]) initWithEvent:v14];
  }
  else {
    v15 = 0;
  }

  return v15;
}

+ (id)colorForDefaultCalendarForNewEvents
{
  v2 = [a1 sharedCalendarStore];
  v3 = [v2 defaultCalendarForNewEvents];
  v4 = CGColorRetain((CGColorRef)[v3 CGColor]);

  if (v4)
  {
    id v5 = [MEMORY[0x1E4FB1618] colorWithCGColor:v4];
    CGColorRelease(v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __80__SearchUICalendarStore_fetchCalendarItemFromEventIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "SearchUICalendarStore: %@", (uint8_t *)&v2, 0xCu);
}

@end