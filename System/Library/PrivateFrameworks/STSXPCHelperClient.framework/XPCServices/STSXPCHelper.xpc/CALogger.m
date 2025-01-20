@interface CALogger
+ (void)postCAEventFor:(id)a3 eventInput:(id)a4;
@end

@implementation CALogger

+ (void)postCAEventFor:(id)a3 eventInput:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    id v11 = v5;
    id v12 = v6;
    AnalyticsSendEventLazy();
  }
  else
  {
    sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[CALogger postCAEventFor:eventInput:]", 24, @"Nothing to post...", v7, v8, v9, v10);
  }
}

@end