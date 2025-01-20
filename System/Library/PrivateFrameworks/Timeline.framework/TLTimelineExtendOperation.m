@interface TLTimelineExtendOperation
+ (unint64_t)relativePriority;
- (NSArray)timelineEntries;
- (NSDate)afterDate;
- (NSError)extendError;
- (TLTimelineExtendOperation)initWithIdentifiable:(id)a3 afterDate:(id)a4 timeout:(double)a5 entryLimit:(unint64_t)a6;
- (double)timeout;
- (unint64_t)limit;
- (void)main;
- (void)setExtendError:(id)a3;
- (void)setTimelineEntries:(id)a3;
@end

@implementation TLTimelineExtendOperation

+ (unint64_t)relativePriority
{
  return 50;
}

- (TLTimelineExtendOperation)initWithIdentifiable:(id)a3 afterDate:(id)a4 timeout:(double)a5 entryLimit:(unint64_t)a6
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TLTimelineExtendOperation;
  v11 = [(TLTimelineOperation *)&v17 initWithIdentifiable:a3];
  v12 = v11;
  if (v11)
  {
    v11->_timeout = a5;
    unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (a6) {
      unint64_t v13 = a6;
    }
    v11->_limit = v13;
    uint64_t v14 = [v10 copy];
    afterDate = v12->_afterDate;
    v12->_afterDate = (NSDate *)v14;
  }
  return v12;
}

- (void)main
{
  v3 = [(TLTimelineExtendOperation *)self afterDate];
  if (v3)
  {
    v4 = [(TLTimelineOperation *)self identifiable];
    v5 = [(TLOperation *)self dataSource];
    unint64_t v6 = [(TLTimelineExtendOperation *)self limit];
    [(TLTimelineExtendOperation *)self timeout];
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    v9 = dispatch_group_create();
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v16 = 0;
    objc_super v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    id v21 = (id)MEMORY[0x263EFFA68];
    if (objc_opt_respondsToSelector())
    {
      dispatch_group_enter(v9);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __33__TLTimelineExtendOperation_main__block_invoke;
      v12[3] = &unk_264477F90;
      v12[4] = self;
      uint64_t v14 = &v22;
      v15 = &v16;
      unint64_t v13 = v9;
      objc_msgSend(v5, "tl_getTimelineEntriesForIdentifiable:afterDate:limit:withHandler:", v4, v3, v6, v12);
    }
    dispatch_group_wait(v9, v8);
    id v10 = self;
    objc_sync_enter(v10);
    if (*((unsigned char *)v23 + 24))
    {
      objc_sync_exit(v10);

      [(TLTimelineExtendOperation *)v10 setTimelineEntries:v17[5]];
    }
    else
    {
      v11 = [MEMORY[0x263F087E8] errorWithDomain:@"TLTimelineOperationDomain" code:803 userInfo:&unk_26CE8DD88];
      [(TLTimelineExtendOperation *)v10 setExtendError:v11];

      objc_sync_exit(v10);
    }
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v4 = [MEMORY[0x263F087E8] errorWithDomain:@"TLTimelineOperationDomain" code:300 userInfo:&unk_26CE8DD60];
    [(TLTimelineExtendOperation *)self setExtendError:v4];
  }
}

void __33__TLTimelineExtendOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v7 = a2;
  objc_sync_enter(v4);
  v5 = (void *)MEMORY[0x263EFFA68];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (v7) {
    unint64_t v6 = v7;
  }
  else {
    unint64_t v6 = v5;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v6);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (NSDate)afterDate
{
  return self->_afterDate;
}

- (double)timeout
{
  return self->_timeout;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSArray)timelineEntries
{
  return (NSArray *)objc_getProperty(self, a2, 304, 1);
}

- (void)setTimelineEntries:(id)a3
{
}

- (NSError)extendError
{
  return (NSError *)objc_getProperty(self, a2, 312, 1);
}

- (void)setExtendError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendError, 0);
  objc_storeStrong((id *)&self->_timelineEntries, 0);
  objc_storeStrong((id *)&self->_afterDate, 0);
}

@end