@interface PPCalendarInternPool
- (PPCalendarInternPool)init;
- (id)internedCalendarWithEKCalendar:(id)a3;
- (void)clearPool;
@end

@implementation PPCalendarInternPool

- (void).cxx_destruct
{
}

- (id)internedCalendarWithEKCalendar:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__569;
  v16 = __Block_byref_object_dispose__570;
  id v17 = 0;
  poolLock = self->_poolLock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PPCalendarInternPool_internedCalendarWithEKCalendar___block_invoke;
  v9[3] = &unk_1E550DF90;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [(_PASLock *)poolLock runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__PPCalendarInternPool_internedCalendarWithEKCalendar___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) calendarIdentifier];
  v5 = (void *)v4;
  id v6 = @"unknown-calendar";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = v6;

  v8 = [*(id *)(a1 + 32) source];
  uint64_t v9 = [v8 sourceIdentifier];
  id v10 = (void *)v9;
  v11 = @"unknown-source";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  uint64_t v12 = v11;

  v13 = [(__CFString *)v12 stringByAppendingString:@":"];

  uint64_t v14 = [v13 stringByAppendingString:v7];

  uint64_t v15 = [v3 objectForKeyedSubscript:v14];
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v18 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v18, kCGRenderingIntentDefault, (CGColorRef)[*(id *)(a1 + 32) CGColor], 0);
    CGColorSpaceRelease(v18);
    uint64_t v20 = [*(id *)(a1 + 32) title];
    v21 = (void *)v20;
    v22 = &stru_1EDA56F70;
    if (v20) {
      v22 = (__CFString *)v20;
    }
    v23 = v22;

    v24 = [[PPCalendar alloc] initWithCalendarIdentifier:v7 title:v23 color:CopyByMatchingToColorSpace];
    uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
    v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

    CGColorRelease(CopyByMatchingToColorSpace);
    if ((unint64_t)[v3 count] > 0xFF)
    {
      v27 = pp_events_log_handle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        int v28 = 134217984;
        uint64_t v29 = 256;
        _os_log_debug_impl(&dword_18CAA6000, v27, OS_LOG_TYPE_DEBUG, "Interned PPCalendars reached max count: %tu", (uint8_t *)&v28, 0xCu);
      }
    }
    else
    {
      [v3 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:v14];
    }
  }
}

- (void)clearPool
{
}

uint64_t __33__PPCalendarInternPool_clearPool__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (PPCalendarInternPool)init
{
  v8.receiver = self;
  v8.super_class = (Class)PPCalendarInternPool;
  v2 = [(PPCalendarInternPool *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    poolLock = v2->_poolLock;
    v2->_poolLock = (_PASLock *)v5;
  }
  return v2;
}

@end