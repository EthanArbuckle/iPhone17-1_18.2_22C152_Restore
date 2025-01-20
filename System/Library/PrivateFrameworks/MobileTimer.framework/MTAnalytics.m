@interface MTAnalytics
+ (void)incrementEventCount:(id)a3;
+ (void)sendCriticalEvent:(id)a3;
+ (void)submitEvent:(id)a3 eventParameters:(id)a4;
@end

@implementation MTAnalytics

+ (void)submitEvent:(id)a3 eventParameters:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __43__MTAnalytics_submitEvent_eventParameters___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)incrementEventCount:(id)a3
{
}

+ (void)sendCriticalEvent:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length] && (unint64_t)objc_msgSend(v4, "length") <= 0x1F3)
  {
    v6 = @"MTCriticalEventMessage";
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [a1 submitEvent:@"com.apple.MobileTimer.critical" eventParameters:v5];
  }
}

@end