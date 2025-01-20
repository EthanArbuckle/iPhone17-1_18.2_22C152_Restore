@interface APPCLifecycleMetricsHelper
- (APPCLifecycleMetricsHelper)init;
- (void)contentLoadFailure;
- (void)discarded;
- (void)manuallyDiscardWithReason:(int64_t)a3;
- (void)missedOpportunity;
- (void)trackImpressionWithStartDate:(id)a3 endDate:(id)a4;
@end

@implementation APPCLifecycleMetricsHelper

- (void)missedOpportunity
{
  v2 = self;
  sub_1B5C7B4C4();
}

- (void)discarded
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR___APPCLifecycleMetricsHelper_wasOnScreen) == 1) {
    objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___APPCLifecycleMetricsHelper_metricsHelper), sel_notConsumedWithCode_placeholder_, 8001, *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___APPCLifecycleMetricsHelper_placeholder));
  }
}

- (void)manuallyDiscardWithReason:(int64_t)a3
{
  v4 = self;
  sub_1B5C7B6F0((id)a3);
}

- (void)contentLoadFailure
{
  v2 = self;
  sub_1B5C7B840();
}

- (void)trackImpressionWithStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v5 = sub_1B5CB3090();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  v11 = (char *)&v15 - v10;
  sub_1B5CB3060();
  sub_1B5CB3060();
  v12 = self;
  sub_1B5CB3610();
  sub_1B5C076A8();
  v13 = (void *)sub_1B5CB3700();
  sub_1B5CB3210();

  v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  v14(v11, v5);
}

- (APPCLifecycleMetricsHelper)init
{
  result = (APPCLifecycleMetricsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end