@interface SKAnalyticsHub
+ (void)addSink:(id)a3;
+ (void)sendEventWithName:(id)a3 eventPayloadBuilder:(id)a4;
- (_TtC10StorageKit14SKAnalyticsHub)init;
@end

@implementation SKAnalyticsHub

+ (void)addSink:(id)a3
{
  uint64_t v3 = qword_26AC21EC0;
  swift_unknownObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v4 = swift_unknownObjectRetain();
  MEMORY[0x2455CA850](v4);
  if (*(void *)((qword_26AC21EB8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((qword_26AC21EB8 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    sub_23F439110();
  sub_23F439120();
  sub_23F439100();
  swift_endAccess();
  swift_unknownObjectRelease();
}

+ (void)sendEventWithName:(id)a3 eventPayloadBuilder:(id)a4
{
  uint64_t v4 = _Block_copy(a4);
  uint64_t v5 = sub_23F4390E0();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  _s10StorageKit14SKAnalyticsHubC9sendEvent4name19eventPayloadBuilderySS_SDySSSo8NSObjectCGSgyctFZ_0(v5, v7, (uint64_t)sub_23F438F24, v8);
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC10StorageKit14SKAnalyticsHub)init
{
  return (_TtC10StorageKit14SKAnalyticsHub *)sub_23F438BF4(self, (uint64_t)a2, type metadata accessor for SKAnalyticsHub);
}

@end