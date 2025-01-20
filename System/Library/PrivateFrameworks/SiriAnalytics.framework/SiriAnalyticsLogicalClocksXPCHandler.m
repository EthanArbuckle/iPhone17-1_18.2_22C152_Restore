@interface SiriAnalyticsLogicalClocksXPCHandler
- (SiriAnalyticsLogicalClocksXPCHandler)init;
- (SiriAnalyticsLogicalClocksXPCHandler)initWithMetastore:(id)a3 queue:(id)a4;
- (void)allWithCompletion:(id)a3;
@end

@implementation SiriAnalyticsLogicalClocksXPCHandler

- (SiriAnalyticsLogicalClocksXPCHandler)initWithMetastore:(id)a3 queue:(id)a4
{
  return (SiriAnalyticsLogicalClocksXPCHandler *)LogicalClocksXPCHandler.init(metastore:queue:)((uint64_t)a3, (uint64_t)a4);
}

- (void)allWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_1A2B8EF8C();

  swift_release();
}

- (SiriAnalyticsLogicalClocksXPCHandler)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriAnalyticsLogicalClocksXPCHandler_queue);
}

@end