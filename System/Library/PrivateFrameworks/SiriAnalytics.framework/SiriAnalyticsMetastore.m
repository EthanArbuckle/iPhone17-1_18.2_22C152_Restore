@interface SiriAnalyticsMetastore
- (SiriAnalyticsMetastore)init;
- (id)createTagWithShim:(id)a3 onClock:(id)a4;
- (id)sensitiveConditionsWithBootSessionUUIDs:(id)a3;
- (void)bootstrap;
- (void)checkpoint;
- (void)cleanupAbandonedClocksWithActiveClockIdentifier:(id)a3;
- (void)createClock:(id)a3 rootClockIdentifier:(id)a4 startedOn:(unint64_t)a5;
- (void)dealloc;
- (void)endClock:(id)a3 endedOn:(unint64_t)a4 endedReason:(unint64_t)a5;
- (void)prune;
- (void)pulseClock:(id)a3 lastEventOn:(unint64_t)a4;
@end

@implementation SiriAnalyticsMetastore

- (SiriAnalyticsMetastore)init
{
  return (SiriAnalyticsMetastore *)Metastore.init()();
}

- (void)bootstrap
{
  v2 = self;
  sub_1A2B6896C();
}

- (void)prune
{
  v2 = self;
  sub_1A2B68D1C();
}

- (void)checkpoint
{
  v2 = self;
  sub_1A2B69028();
}

- (void)dealloc
{
  v2 = self;
  Metastore.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___SiriAnalyticsMetastore_storageURL;
  uint64_t v3 = sub_1A2C0CCF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)createClock:(id)a3 rootClockIdentifier:(id)a4 startedOn:(unint64_t)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1A2C0CE20();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2C0CE00();
  if (a4)
  {
    sub_1A2C0CE00();
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v9, v14, 1, v10);
  v15 = self;
  Metastore.createClock(_:rootClockIdentifier:startedOn:)();

  sub_1A2B653F8((uint64_t)v9, &qword_1EB555500);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)endClock:(id)a3 endedOn:(unint64_t)a4 endedReason:(unint64_t)a5
{
  uint64_t v8 = sub_1A2C0CE20();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2C0CE00();
  uint64_t v12 = self;
  Metastore.endClock(_:endedOn:endedReason:)(v11, a4, a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)pulseClock:(id)a3 lastEventOn:(unint64_t)a4
{
  uint64_t v6 = sub_1A2C0CE20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2C0CE00();
  uint64_t v10 = self;
  Metastore.pulseClock(_:lastEventOn:)(v9, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)cleanupAbandonedClocksWithActiveClockIdentifier:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A2C0CE00();
    uint64_t v8 = sub_1A2C0CE20();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = sub_1A2C0CE20();
    uint64_t v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  uint64_t v10 = self;
  Metastore.cleanupAbandonedClocks(activeClockIdentifier:)();

  sub_1A2B653F8((uint64_t)v7, &qword_1EB555500);
}

- (id)sensitiveConditionsWithBootSessionUUIDs:(id)a3
{
  sub_1A2C0CE20();
  uint64_t v4 = sub_1A2C0D5E0();
  uint64_t v5 = self;
  uint64_t v6 = (void *)Metastore.sensitiveConditionsByBootSessionUUIDAsNSDictionary(bootSessionUUIDs:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (id)createTagWithShim:(id)a3 onClock:(id)a4
{
  uint64_t v6 = sub_1A2C0CE20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2C0CE00();
  id v13 = a3;
  uint64_t v14 = self;
  Metastore.createTag(shim:onClock:)();

  v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  uint64_t v16 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v6) != 1)
  {
    uint64_t v16 = (void *)sub_1A2C0CDE0();
    v15(v12, v6);
  }
  return v16;
}

@end