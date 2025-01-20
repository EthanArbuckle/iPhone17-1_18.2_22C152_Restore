@interface SiriAnalyticsClientRuntimeConnection
- (SiriAnalyticsClientRuntimeConnection)init;
- (SiriAnalyticsClientRuntimeConnection)initWithMachServiceName:(id)a3;
- (void)resetLogicalClockWithCompletion:(id)a3;
- (void)runPipelineWithCompletion:(id)a3;
@end

@implementation SiriAnalyticsClientRuntimeConnection

- (SiriAnalyticsClientRuntimeConnection)initWithMachServiceName:(id)a3
{
  uint64_t v3 = sub_1A2C0D480();
  return (SiriAnalyticsClientRuntimeConnection *)ClientRuntimeConnection.init(machServiceName:)(v3, v4);
}

- (void)resetLogicalClockWithCompletion:(id)a3
{
}

- (void)runPipelineWithCompletion:(id)a3
{
}

- (SiriAnalyticsClientRuntimeConnection)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___SiriAnalyticsClientRuntimeConnection____lazy_storage___underlying);
}

@end