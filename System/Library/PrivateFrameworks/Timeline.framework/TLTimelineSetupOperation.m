@interface TLTimelineSetupOperation
+ (unint64_t)relativePriority;
- (NSError)setupError;
- (TLTimeline)timeline;
- (TLTimelineSetupOperation)initWithIdentifiable:(id)a3;
- (TLTimelineSetupOperation)initWithIdentifiable:(id)a3 timeout:(double)a4 entryLimit:(unint64_t)a5;
- (double)timeout;
- (unint64_t)entryLimit;
- (void)main;
- (void)setSetupError:(id)a3;
- (void)setTimeline:(id)a3;
@end

@implementation TLTimelineSetupOperation

+ (unint64_t)relativePriority
{
  return 100;
}

- (TLTimelineSetupOperation)initWithIdentifiable:(id)a3
{
  return [(TLTimelineSetupOperation *)self initWithIdentifiable:a3 timeout:20 entryLimit:60.0];
}

- (TLTimelineSetupOperation)initWithIdentifiable:(id)a3 timeout:(double)a4 entryLimit:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TLTimelineSetupOperation;
  result = [(TLTimelineOperation *)&v9 initWithIdentifiable:a3];
  if (result)
  {
    unint64_t v8 = a5 - 1;
    if (!a5) {
      unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    result->_entryLimit = v8;
    result->_timeout = a4;
  }
  return result;
}

- (void)main
{
  [(TLTimelineSetupOperation *)self timeout];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  unint64_t v5 = [(TLTimelineSetupOperation *)self entryLimit];
  v6 = dispatch_group_create();
  v7 = [(TLOperation *)self dataSource];
  unint64_t v8 = [(TLTimelineOperation *)self identifiable];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  id v41 = 0;
  if (objc_opt_respondsToSelector())
  {
    dispatch_group_enter(v6);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __32__TLTimelineSetupOperation_main__block_invoke;
    v32[3] = &unk_264477FB8;
    v32[4] = self;
    v34 = &v36;
    v35 = &v42;
    objc_super v9 = v6;
    v33 = v9;
    objc_msgSend(v7, "tl_getCurrentTimelineEntryForIdentifiable:withHandler:", v8, v32);

    dispatch_group_wait(v9, v4);
    v10 = self;
    objc_sync_enter(v10);
    if (*((unsigned char *)v43 + 24))
    {
      objc_sync_exit(v10);

      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 0;
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__0;
      v26 = __Block_byref_object_dispose__0;
      id v27 = 0;
      v11 = objc_msgSend((id)v37[5], "tl_entryDate");
      if (v11 && v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        dispatch_group_enter(v9);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __32__TLTimelineSetupOperation_main__block_invoke_2;
        v18[3] = &unk_264477F90;
        v18[4] = v10;
        v20 = &v28;
        v21 = &v22;
        v19 = v9;
        objc_msgSend(v7, "tl_getTimelineEntriesForIdentifiable:afterDate:limit:withHandler:", v8, v11, v5, v18);
      }
      else
      {
        *((unsigned char *)v29 + 24) = 1;
      }
      dispatch_group_wait(v9, v4);
      v13 = v10;
      objc_sync_enter(v13);
      if (*((unsigned char *)v29 + 24))
      {
        objc_sync_exit(v13);

        v14 = [TLTimeline alloc];
        v15 = [(TLTimeline *)v14 initWithEntry:v37[5]];
        [(TLTimeline *)v15 extendTimelineFromDate:v11 withEntries:v23[5]];
        [(TLTimelineSetupOperation *)v13 setTimeline:v15];
        [(TLTimelineSetupOperation *)v13 setSetupError:0];
      }
      else
      {
        v17 = [MEMORY[0x263F087E8] errorWithDomain:@"TLTimelineOperationDomain" code:803 userInfo:&unk_26CE8DE00];
        [(TLTimelineSetupOperation *)v13 setSetupError:v17];

        objc_sync_exit(v13);
        v15 = (TLTimeline *)v13;
      }

      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v28, 8);
    }
    else
    {
      v16 = [MEMORY[0x263F087E8] errorWithDomain:@"TLTimelineOperationDomain" code:802 userInfo:&unk_26CE8DDD8];
      [(TLTimelineSetupOperation *)v10 setSetupError:v16];

      objc_sync_exit(v10);
    }
  }
  else
  {
    v12 = [MEMORY[0x263F087E8] errorWithDomain:@"TLTimelineOperationDomain" code:500 userInfo:&unk_26CE8DDB0];
    [(TLTimelineSetupOperation *)self setSetupError:v12];
  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
}

void __32__TLTimelineSetupOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __32__TLTimelineSetupOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  objc_sync_exit(v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (double)timeout
{
  return self->_timeout;
}

- (unint64_t)entryLimit
{
  return self->_entryLimit;
}

- (TLTimeline)timeline
{
  return (TLTimeline *)objc_getProperty(self, a2, 296, 1);
}

- (void)setTimeline:(id)a3
{
}

- (NSError)setupError
{
  return (NSError *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSetupError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupError, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
}

@end