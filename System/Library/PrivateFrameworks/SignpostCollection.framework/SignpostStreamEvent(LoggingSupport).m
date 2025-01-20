@interface SignpostStreamEvent(LoggingSupport)
- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:serialNumber:shouldCollectFrameInfo:timeoutInSec:timeoutHandlingQueue:timeoutHandlingBlock:;
@end

@implementation SignpostStreamEvent(LoggingSupport)

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:serialNumber:shouldCollectFrameInfo:timeoutInSec:timeoutHandlingQueue:timeoutHandlingBlock:
{
  id v16 = a4;
  v17 = a9;
  id v18 = a10;
  v31.receiver = a1;
  v31.super_class = (Class)&off_26CECE1C0;
  id v19 = objc_msgSendSuper2(&v31, sel_initWithOSLogEventProxy_timebaseRatio_shouldCompose_, v16, a5, a2);
  v20 = v19;
  if (v19)
  {
    [v19 setSerialNumber:a6];
    if (a8)
    {
      if (![v20 eventType])
      {
        dispatch_source_t v21 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v17);
        [v20 setTimeoutSource:v21];

        v22 = [v20 timeoutSource];
        dispatch_time_t v23 = dispatch_time(0, 1000000000 * a8);
        dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0);

        objc_initWeak(&location, v20);
        v24 = [v20 timeoutSource];
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __182__SignpostStreamEvent_LoggingSupport__initWithOSLogEventProxy_timebaseRatio_shouldCompose_serialNumber_shouldCollectFrameInfo_timeoutInSec_timeoutHandlingQueue_timeoutHandlingBlock___block_invoke;
        handler[3] = &unk_2644880A8;
        id v28 = v18;
        objc_copyWeak(&v29, &location);
        dispatch_source_set_event_handler(v24, handler);

        v25 = [v20 timeoutSource];
        dispatch_resume(v25);

        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
      }
    }
  }

  return v20;
}

@end