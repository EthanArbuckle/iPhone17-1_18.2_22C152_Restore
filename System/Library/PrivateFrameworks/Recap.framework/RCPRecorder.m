@interface RCPRecorder
+ (BOOL)shouldRecordSenderProperties;
+ (id)sharedRecorder;
+ (void)registerEventStreamRecorder:(id)a3;
+ (void)unregisterEventStreamRecorder:(id)a3;
- (BOOL)shouldRecordInitialPointerLocation;
- (BOOL)shouldRecordSenderProperties;
- (RCPEventAction)pointerLocationAction;
- (__IOHIDEvent)_initialLocationEvent;
- (__IOHIDEvent)_newLocationEventFromNormalPoint:(CGPoint)a3;
- (void)_registerIOHIDClient;
- (void)_unregisterIOHIDClient;
- (void)setPointerLocationAction:(id)a3;
- (void)setShouldRecordInitialPointerLocation:(BOOL)a3;
- (void)setShouldRecordSenderProperties:(BOOL)a3;
@end

@implementation RCPRecorder

+ (id)sharedRecorder
{
  if (sharedRecorder_onceToken != -1) {
    dispatch_once(&sharedRecorder_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedRecorder__sharedRecorder;
  return v2;
}

void __29__RCPRecorder_sharedRecorder__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedRecorder__sharedRecorder;
  sharedRecorder__sharedRecorder = v0;

  v2 = (void *)MEMORY[0x1E4F1CA80];
  v3 = (id)sharedRecorder__sharedRecorder;
  uint64_t v4 = [v2 set];
  id v5 = (id)v3[2];
  v3[2] = v4;
}

+ (BOOL)shouldRecordSenderProperties
{
  v2 = [a1 sharedRecorder];
  char v3 = [v2 shouldRecordSenderProperties];

  return v3;
}

+ (void)registerEventStreamRecorder:(id)a3
{
  id v3 = a3;
  id v5 = +[RCPRecorder sharedRecorder];
  [v5[2] addObject:v3];
  uint64_t v4 = [v3 config];

  LOBYTE(v3) = [v4 ignoreSenderProperties];
  if ((v3 & 1) == 0) {
    [v5 setShouldRecordSenderProperties:1];
  }
  [v5 _registerIOHIDClient];
}

+ (void)unregisterEventStreamRecorder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[RCPRecorder sharedRecorder];
  [v4[2] removeObject:v3];
  if (![v4[2] count]) {
    [v4 _unregisterIOHIDClient];
  }
  [v4 setShouldRecordSenderProperties:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "config", (void)v12);
        char v11 = [v10 ignoreSenderProperties];

        if ((v11 & 1) == 0)
        {
          [v4 setShouldRecordSenderProperties:1];
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (__IOHIDEvent)_newLocationEventFromNormalPoint:(CGPoint)a3
{
  id v3 = (__IOHIDEvent *)IOHIDEventCreate();
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  return v3;
}

- (__IOHIDEvent)_initialLocationEvent
{
  id v3 = [MEMORY[0x1E4F4F350] sharedInstance];
  [v3 normalizedGlobalPointerPosition];
  double v5 = v4;
  double v7 = v6;

  return -[RCPRecorder _newLocationEventFromNormalPoint:](self, "_newLocationEventFromNormalPoint:", v5, v7);
}

- (void)_registerIOHIDClient
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!self->_ioRunLoop)
  {
    id v3 = objc_opt_new();
    double v4 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v25 = self;
    obj = self->_activeRecorders;
    uint64_t v23 = [(NSMutableSet *)obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v23)
    {
      uint64_t v22 = *(void *)v41;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v41 != v22)
          {
            uint64_t v6 = v5;
            objc_enumerationMutation(obj);
            uint64_t v5 = v6;
          }
          uint64_t v24 = v5;
          double v7 = *(void **)(*((void *)&v40 + 1) + 8 * v5);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v8 = [v7 config];
          v9 = [v8 deviceUsagePageArray];

          uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v46 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v37 != v11) {
                  objc_enumerationMutation(v9);
                }
                long long v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                if ([v13 unsignedIntValue] == 1) {
                  self->_shouldRecordInitialPointerLocation = 1;
                }
                v44 = @"DeviceUsagePage";
                v45 = v13;
                long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
                [v4 addObject:v14];

                long long v15 = [v13 stringValue];
                [v3 addObject:v15];
              }
              uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v46 count:16];
            }
            while (v10);
          }

          uint64_t v5 = v24 + 1;
        }
        while (v24 + 1 != v23);
        uint64_t v23 = [(NSMutableSet *)obj countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v23);
    }

    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    uint64_t v17 = (void *)MEMORY[0x1E4F29060];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __35__RCPRecorder__registerIOHIDClient__block_invoke;
    v26[3] = &unk_1E5D77348;
    v31 = &v32;
    v18 = v16;
    v27 = v18;
    id v19 = v3;
    id v28 = v19;
    id v20 = v4;
    id v29 = v20;
    v30 = v25;
    [v17 detachNewThreadWithBlock:v26];
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    v25->_ioRunLoop = (__CFRunLoop *)v33[3];

    _Block_object_dispose(&v32, 8);
  }
}

void __35__RCPRecorder__registerIOHIDClient__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = CFRunLoopGetCurrent();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  RCPSetNonDecayingThreadPriority(63);
  v2 = (const void *)IOHIDEventSystemClientCreate();
  CFRunLoopGetCurrent();
  IOHIDEventSystemClientScheduleWithRunLoop();
  if (_CLTLogLevel >= 3)
  {
    id v3 = NSString;
    double v4 = [*(id *)(a1 + 40) componentsJoinedByString:@", "];
    id v5 = [v3 stringWithFormat:@"Recording usage pages (-d): %@\n", v4];
    uint64_t v6 = (const char *)[v5 UTF8String];
    double v7 = (FILE **)MEMORY[0x1E4F143D8];
    fputs(v6, (FILE *)*MEMORY[0x1E4F143D8]);

    fflush(*v7);
    if (_CLTLogLevel >= 5)
    {
      id v8 = [NSString stringWithFormat:@"Actual filter array: %@\n", *(void *)(a1 + 48)];
      fputs((const char *)[v8 UTF8String], *v7);

      fflush(*v7);
    }
  }
  IOHIDEventSystemClientSetMatchingMultiple();
  IOHIDEventSystemClientRegisterEventCallback();
  CFRunLoopRun();
  IOHIDEventSystemClientUnregisterEventCallback();
  CFRunLoopGetCurrent();
  IOHIDEventSystemClientUnscheduleWithRunLoop();
  CFRelease(v2);
}

- (void)_unregisterIOHIDClient
{
  self->_ioRunLoop = 0;
}

- (BOOL)shouldRecordSenderProperties
{
  return self->_shouldRecordSenderProperties;
}

- (void)setShouldRecordSenderProperties:(BOOL)a3
{
  self->_shouldRecordSenderProperties = a3;
}

- (BOOL)shouldRecordInitialPointerLocation
{
  return self->_shouldRecordInitialPointerLocation;
}

- (void)setShouldRecordInitialPointerLocation:(BOOL)a3
{
  self->_shouldRecordInitialPointerLocation = a3;
}

- (RCPEventAction)pointerLocationAction
{
  return (RCPEventAction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPointerLocationAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerLocationAction, 0);
  objc_storeStrong((id *)&self->_activeRecorders, 0);
}

@end