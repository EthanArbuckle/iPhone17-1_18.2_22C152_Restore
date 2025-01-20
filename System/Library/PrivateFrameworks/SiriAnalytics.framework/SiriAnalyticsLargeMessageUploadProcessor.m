@interface SiriAnalyticsLargeMessageUploadProcessor
- (SiriAnalyticsLargeMessageUploadProcessor)init;
- (SiriAnalyticsLargeMessageUploadProcessor)initWithMetastore:(id)a3;
- (id)processWithUploadEvent:(id)a3 requestIdentifier:(id)a4;
@end

@implementation SiriAnalyticsLargeMessageUploadProcessor

- (SiriAnalyticsLargeMessageUploadProcessor)initWithMetastore:(id)a3
{
  return (SiriAnalyticsLargeMessageUploadProcessor *)LargeMessageUploadProcessor.init(metastore:)(a3);
}

- (id)processWithUploadEvent:(id)a3 requestIdentifier:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1A2C0CE00();
    uint64_t v10 = sub_1A2C0CE20();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = sub_1A2C0CE20();
    uint64_t v11 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v9, v11, 1, v10);
  id v12 = a3;
  v13 = self;
  sub_1A2B845EC();
  v15 = v14;

  sub_1A2B653F8((uint64_t)v9, &qword_1EB555500);
  return v15;
}

- (SiriAnalyticsLargeMessageUploadProcessor)init
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriAnalyticsLargeMessageUploadProcessor_tagExpander);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end