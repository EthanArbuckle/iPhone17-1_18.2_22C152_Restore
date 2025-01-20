@interface SPPowerAssertion
- (NSString)reason;
- (OS_dispatch_queue)queue;
- (SPPowerAssertion)initWithReason:(id)a3 type:(unint64_t)a4 timeout:(double)a5;
- (double)timeout;
- (id)assertionName;
- (id)assertionType;
- (id)powerAssertionOption;
- (unint64_t)type;
- (unsigned)powerAssertionId;
- (void)_drop;
- (void)dealloc;
- (void)drop;
- (void)hold;
- (void)setPowerAssertionId:(unsigned int)a3;
- (void)setQueue:(id)a3;
- (void)setReason:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SPPowerAssertion

- (SPPowerAssertion)initWithReason:(id)a3 type:(unint64_t)a4 timeout:(double)a5
{
  id v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SPPowerAssertion;
  v10 = [(SPPowerAssertion *)&v19 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_reason, a3);
    v11->_type = a4;
    v11->_timeout = a5;
    v11->_powerAssertionId = 0;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    id v13 = objc_claimAutoreleasedReturnValue();
    v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v16;
  }
  return v11;
}

- (void)hold
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__SPPowerAssertion_hold__block_invoke;
  block[3] = &unk_1E601B790;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __24__SPPowerAssertion_hold__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!*(_DWORD *)(*(void *)(a1 + 32) + 8))
  {
    v2 = (void *)MEMORY[0x1B3EB48A0]();
    CFDictionaryRef v3 = [*(id *)(a1 + 32) powerAssertionOption];
    IOPMAssertionID AssertionID = 0;
    IOReturn v4 = IOPMAssertionCreateWithProperties(v3, &AssertionID);
    if (v4)
    {
      v5 = LogCategory_PowerManagement();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFDictionaryRef v10 = v3;
        __int16 v11 = 1024;
        IOReturn v12 = v4;
        _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "IOPMAssertionCreateWithProperties %@ failed with error: (%d)", buf, 0x12u);
      }
    }
    else
    {
      v6 = LogCategory_PowerManagement();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = [*(id *)(a1 + 32) assertionName];
        __24__SPPowerAssertion_hold__block_invoke_cold_1(v7, (int *)&AssertionID, buf, v6);
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 8) = AssertionID;
    }
  }
}

- (id)powerAssertionOption
{
  CFDictionaryRef v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_timeout >= 1.0) {
    double timeout = self->_timeout;
  }
  else {
    double timeout = 1.0;
  }
  v5 = [(SPPowerAssertion *)self assertionType];
  [v3 setObject:v5 forKeyedSubscript:@"AssertType"];

  v6 = [(SPPowerAssertion *)self assertionName];
  [v3 setObject:v6 forKeyedSubscript:@"AssertName"];

  v7 = [NSNumber numberWithDouble:timeout];
  [v3 setObject:v7 forKeyedSubscript:@"TimeoutSeconds"];

  [v3 setObject:@"TimeoutActionTurnOff" forKeyedSubscript:@"TimeoutAction"];
  [v3 setObject:&unk_1F0B31E88 forKeyedSubscript:@"AssertLevel"];

  return v3;
}

- (id)assertionName
{
  CFDictionaryRef v3 = NSString;
  IOReturn v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = [v4 bundleIdentifier];
  v6 = [v3 stringWithFormat:@"%@-%@-%@", v5, @"SPOwner", self->_reason];

  return v6;
}

- (id)assertionType
{
  if (self->_type == 1) {
    return @"BackgroundTask";
  }
  else {
    return @"RequiresDisplayAudio";
  }
}

- (void)drop
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__SPPowerAssertion_drop__block_invoke;
  block[3] = &unk_1E601B790;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __24__SPPowerAssertion_drop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _drop];
}

- (void)_drop
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  IOPMAssertionID powerAssertionId = self->_powerAssertionId;
  if (powerAssertionId)
  {
    IOReturn v4 = IOPMAssertionRelease(powerAssertionId);
    if (v4)
    {
      IOReturn v5 = v4;
      v6 = LogCategory_PowerManagement();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7[0] = 67109120;
        v7[1] = v5;
        _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "IOPMAssertionRelease failed with error: (%d)", (uint8_t *)v7, 8u);
      }
    }
    else
    {
      self->_IOPMAssertionID powerAssertionId = 0;
    }
  }
}

- (void)dealloc
{
  [(SPPowerAssertion *)self _drop];
  v3.receiver = self;
  v3.super_class = (Class)SPPowerAssertion;
  [(SPPowerAssertion *)&v3 dealloc];
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_double timeout = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unsigned)powerAssertionId
{
  return self->_powerAssertionId;
}

- (void)setPowerAssertionId:(unsigned int)a3
{
  self->_IOPMAssertionID powerAssertionId = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_reason, 0);
}

void __24__SPPowerAssertion_hold__block_invoke_cold_1(void *a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v5 = *a2;
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_1B2FD8000, log, OS_LOG_TYPE_DEBUG, "Successfully created assertion %@ with ID 0x%x", buf, 0x12u);
}

@end