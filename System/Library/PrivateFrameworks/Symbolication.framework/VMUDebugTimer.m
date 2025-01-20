@interface VMUDebugTimer
+ (id)sharedTimer;
+ (id)sharedTimerIfCreated;
- (OS_os_log)logHandle;
- (VMUDebugTimer)init;
- (unint64_t)signpostID;
- (void)endEvent:(const char *)a3;
- (void)startWithCategory:(const char *)a3 message:(const char *)a4;
- (void)startWithMessage:(const char *)a3;
- (void)stop;
@end

@implementation VMUDebugTimer

+ (id)sharedTimerIfCreated
{
  return (id)sharedTimer;
}

+ (id)sharedTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__VMUDebugTimer_sharedTimer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedTimer_onceToken != -1) {
    dispatch_once(&sharedTimer_onceToken, block);
  }
  v2 = (void *)sharedTimer;

  return v2;
}

void __28__VMUDebugTimer_sharedTimer__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedTimer;
  sharedTimer = (uint64_t)v1;
}

- (VMUDebugTimer)init
{
  v8.receiver = self;
  v8.super_class = (Class)VMUDebugTimer;
  v2 = [(VMUDebugTimer *)&v8 init];
  if (v2)
  {
    v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    programStartTime = v2->_programStartTime;
    v2->_programStartTime = v3;

    os_log_t v5 = os_log_create("com.apple.Symbolication", "Memory Scanning");
    logHandle = v2->_logHandle;
    v2->_logHandle = (OS_os_log *)v5;

    kVMUPrintArchivingTiming = 1;
  }
  return v2;
}

- (void)startWithMessage:(const char *)a3
{
  self->_signpostID = 0;
}

- (void)startWithCategory:(const char *)a3 message:(const char *)a4
{
  if (*(_OWORD *)&self->_eventStartTime != 0) {
    [(VMUDebugTimer *)self endEvent:a3];
  }
  if (a3)
  {
    if (*a3) {
      [NSString stringWithFormat:@"%s - %s", a3, a4];
    }
    else {
    v7 = [NSString stringWithUTF8String:a4];
    }
    eventMessage = self->_eventMessage;
    self->_eventMessage = v7;

    v12 = [NSString stringWithUTF8String:a3];
    categoryMessage = self->_categoryMessage;
    self->_categoryMessage = v12;
  }
  else
  {
    objc_super v8 = [NSString stringWithUTF8String:a4];
    v9 = self->_eventMessage;
    self->_eventMessage = v8;

    categoryMessage = self->_categoryMessage;
    self->_categoryMessage = 0;
  }

  fprintf((FILE *)*MEMORY[0x1E4F143C8], "TIMING:  %s\n", [(NSString *)self->_eventMessage UTF8String]);
  v13 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  eventStartTime = self->_eventStartTime;
  self->_eventStartTime = v13;

  self->_signpostID = os_signpost_id_generate((os_log_t)self->_logHandle);
}

- (void)endEvent:(const char *)a3
{
  eventStartTime = self->_eventStartTime;
  if (eventStartTime && self->_eventMessage)
  {
    if (self->_signpostID)
    {
      if (a3)
      {
        [NSString stringWithUTF8String:];
        os_log_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        os_log_t v5 = &stru_1EFE27F38;
      }
    }
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    v7 = (FILE *)*MEMORY[0x1E4F143C8];
    [v6 timeIntervalSinceDate:self->_programStartTime];
    double v9 = v8;
    [v6 timeIntervalSinceDate:self->_eventStartTime];
    fprintf(v7, "TIMING (%.02f elapsed):  %.02f seconds for %s\n\n", v9, v10, [(NSString *)self->_eventMessage UTF8String]);

    eventStartTime = self->_eventStartTime;
  }
  self->_eventStartTime = 0;

  eventMessage = self->_eventMessage;
  self->_eventMessage = 0;

  self->_signpostID = 0;
}

- (void)stop
{
  categoryMessage = self->_categoryMessage;
  if (categoryMessage) {
    uint64_t v4 = [(NSString *)categoryMessage UTF8String];
  }
  else {
    uint64_t v4 = 0;
  }
  [(VMUDebugTimer *)self endEvent:v4];
  os_log_t v5 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  programStartTime = self->_programStartTime;
  self->_programStartTime = v5;
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_categoryMessage, 0);
  objc_storeStrong((id *)&self->_eventMessage, 0);
  objc_storeStrong((id *)&self->_eventStartTime, 0);

  objc_storeStrong((id *)&self->_programStartTime, 0);
}

@end