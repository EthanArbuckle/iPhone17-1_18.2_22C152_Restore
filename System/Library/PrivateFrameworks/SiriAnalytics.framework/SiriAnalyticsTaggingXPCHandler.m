@interface SiriAnalyticsTaggingXPCHandler
- (SiriAnalyticsTaggingXPCHandler)init;
- (SiriAnalyticsTaggingXPCHandler)initWithMetastore:(id)a3;
- (id)all;
@end

@implementation SiriAnalyticsTaggingXPCHandler

- (SiriAnalyticsTaggingXPCHandler)initWithMetastore:(id)a3
{
  return (SiriAnalyticsTaggingXPCHandler *)TaggingXPCHandler.init(metastore:)((uint64_t)a3);
}

- (id)all
{
  v2 = self;
  uint64_t v3 = sub_1A2BC2904();

  if (v3)
  {
    sub_1A2C0CE20();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9597040);
    sub_1A2BA8018();
    v4 = (void *)sub_1A2C0D3F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (SiriAnalyticsTaggingXPCHandler)init
{
}

- (void).cxx_destruct
{
}

@end