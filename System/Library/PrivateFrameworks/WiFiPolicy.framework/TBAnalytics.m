@interface TBAnalytics
+ (void)captureEvent:(id)a3;
@end

@implementation TBAnalytics

uint64_t __28__TBAnalytics_captureEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventDictionary];
}

+ (void)captureEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 eventName];
  v5 = (void *)v4;
  if (v4)
  {
    if (v3)
    {
      id v6 = v3;
      AnalyticsSendEventLazy();
    }
    else
    {
      NSLog(&cfstr_SEventIsNilFor.isa, "+[TBAnalytics captureEvent:]", v4);
    }
  }
  else
  {
    NSLog(&cfstr_SEventNameIsNi.isa, "+[TBAnalytics captureEvent:]");
  }
}

@end