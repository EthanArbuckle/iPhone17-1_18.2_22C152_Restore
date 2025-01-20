@interface WFDispatchSourceTimer
- (BOOL)hasFired;
- (BOOL)isCancelled;
- (BOOL)preventSuspension;
- (OS_dispatch_source)source;
- (RBSAssertion)assertion;
- (WFDispatchSourceTimer)initWithInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (WFDispatchSourceTimer)initWithInterval:(double)a3 repeatInterval:(double)a4 queue:(id)a5 handler:(id)a6;
- (WFDispatchSourceTimer)initWithInterval:(double)a3 repeatIntervalInt:(unint64_t)a4 queue:(id)a5 handler:(id)a6;
- (void)cancel;
- (void)dealloc;
- (void)setAssertion:(id)a3;
- (void)setHasFired:(BOOL)a3;
- (void)setPreventSuspension:(BOOL)a3;
- (void)start;
@end

@implementation WFDispatchSourceTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)setAssertion:(id)a3
{
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void)setHasFired:(BOOL)a3
{
  self->_hasFired = a3;
}

- (BOOL)hasFired
{
  return self->_hasFired;
}

- (void)setPreventSuspension:(BOOL)a3
{
  self->_preventSuspension = a3;
}

- (BOOL)preventSuspension
{
  return self->_preventSuspension;
}

- (void)cancel
{
  dispatch_source_cancel((dispatch_source_t)self->_source);
  v3 = [(WFDispatchSourceTimer *)self assertion];
  [v3 invalidate];

  assertion = self->_assertion;
  self->_assertion = 0;
}

- (void)start
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_resume((dispatch_object_t)self->_source);
  if ([(WFDispatchSourceTimer *)self preventSuspension])
  {
    v3 = [(WFDispatchSourceTimer *)self assertion];

    if (!v3)
    {
      v4 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[WFDispatchSourceTimer start]";
        _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_INFO, "%s Client wants to prevent suspension, so we're taking out a RunningBoard assertion...", buf, 0xCu);
      }

      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2050000000;
      v5 = (void *)getRBSAssertionClass_softClass;
      uint64_t v23 = getRBSAssertionClass_softClass;
      if (!getRBSAssertionClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getRBSAssertionClass_block_invoke;
        v26 = &unk_1E6079C28;
        v27 = &v20;
        __getRBSAssertionClass_block_invoke((uint64_t)buf);
        v5 = (void *)v21[3];
      }
      v6 = v5;
      _Block_object_dispose(&v20, 8);
      id v7 = [v6 alloc];
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2050000000;
      v8 = (void *)getRBSTargetClass_softClass;
      uint64_t v23 = getRBSTargetClass_softClass;
      if (!getRBSTargetClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getRBSTargetClass_block_invoke;
        v26 = &unk_1E6079C28;
        v27 = &v20;
        __getRBSTargetClass_block_invoke((uint64_t)buf);
        v8 = (void *)v21[3];
      }
      id v9 = v8;
      _Block_object_dispose(&v20, 8);
      v10 = [v9 currentProcess];
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2050000000;
      v11 = (void *)getRBSDomainAttributeClass_softClass;
      uint64_t v23 = getRBSDomainAttributeClass_softClass;
      if (!getRBSDomainAttributeClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getRBSDomainAttributeClass_block_invoke;
        v26 = &unk_1E6079C28;
        v27 = &v20;
        __getRBSDomainAttributeClass_block_invoke((uint64_t)buf);
        v11 = (void *)v21[3];
      }
      id v12 = v11;
      _Block_object_dispose(&v20, 8);
      uint64_t v13 = [v12 attributeWithDomain:@"com.apple.shortcuts" name:@"RunningBackground"];
      uint64_t v24 = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      v15 = (void *)[v7 initWithExplanation:@"An assertion-requiring timer is ticking" target:v10 attributes:v14];

      id v19 = 0;
      LOBYTE(v13) = [v15 acquireWithError:&v19];
      id v16 = v19;
      if (v13)
      {
        v17 = v15;
        assertion = self->_assertion;
        self->_assertion = v17;
      }
      else
      {
        assertion = getWFVoiceShortcutClientLogObject();
        if (os_log_type_enabled(assertion, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[WFDispatchSourceTimer start]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v16;
          _os_log_impl(&dword_1B3C5C000, assertion, OS_LOG_TYPE_FAULT, "%s Unable to acquire assertion for timer: %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

- (BOOL)isCancelled
{
  v2 = [(WFDispatchSourceTimer *)self source];
  BOOL v3 = dispatch_source_testcancel(v2) != 0;

  return v3;
}

- (void)dealloc
{
  [(WFDispatchSourceTimer *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)WFDispatchSourceTimer;
  [(WFDispatchSourceTimer *)&v3 dealloc];
}

- (WFDispatchSourceTimer)initWithInterval:(double)a3 repeatIntervalInt:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
  v11 = a5;
  id v12 = a6;
  if (!v12)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFDispatchSourceTimer.m", 40, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)WFDispatchSourceTimer;
  uint64_t v13 = [(WFDispatchSourceTimer *)&v26 init];
  if (v13)
  {
    dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v11);
    source = v13->_source;
    v13->_source = (OS_dispatch_source *)v14;

    v13->_hasFired = 0;
    id v16 = v13->_source;
    dispatch_time_t v17 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v16, v17, a4, 0x2FAF080uLL);
    v18 = v13->_source;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __74__WFDispatchSourceTimer_initWithInterval_repeatIntervalInt_queue_handler___block_invoke;
    handler[3] = &unk_1E6078CC0;
    id v19 = v13;
    uint64_t v24 = v19;
    id v25 = v12;
    dispatch_source_set_event_handler(v18, handler);
    uint64_t v20 = v19;
  }
  return v13;
}

uint64_t __74__WFDispatchSourceTimer_initWithInterval_repeatIntervalInt_queue_handler___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    objc_super v3 = [*(id *)(a1 + 32) assertion];
    [v3 invalidate];

    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;

    [*(id *)(a1 + 32) setHasFired:1];
    v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v6();
  }
  return result;
}

- (WFDispatchSourceTimer)initWithInterval:(double)a3 repeatInterval:(double)a4 queue:(id)a5 handler:(id)a6
{
  return [(WFDispatchSourceTimer *)self initWithInterval:(unint64_t)(a4 * 1000000000.0) repeatIntervalInt:a5 queue:a6 handler:a3];
}

- (WFDispatchSourceTimer)initWithInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  return [(WFDispatchSourceTimer *)self initWithInterval:-1 repeatIntervalInt:a4 queue:a5 handler:a3];
}

@end