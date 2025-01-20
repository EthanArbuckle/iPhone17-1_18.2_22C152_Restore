@interface DebugLifecycleMetricsHelper
- (void)trackImpressionWithStartDate:(id)a3 endDate:(id)a4;
@end

@implementation DebugLifecycleMetricsHelper

- (void)trackImpressionWithStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v4 = sub_1BFA16988();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  v10 = (char *)&v12 - v9;
  sub_1BFA16968();
  sub_1BFA16968();
  v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v8, v4);
  v11(v10, v4);
}

@end