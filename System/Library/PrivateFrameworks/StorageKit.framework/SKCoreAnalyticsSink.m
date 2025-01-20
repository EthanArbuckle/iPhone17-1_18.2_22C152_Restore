@interface SKCoreAnalyticsSink
- (_TtC10StorageKit19SKCoreAnalyticsSink)init;
- (void)sendEventWithName:(id)a3 eventPayloadBuilder:(id)a4;
@end

@implementation SKCoreAnalyticsSink

- (void)sendEventWithName:(id)a3 eventPayloadBuilder:(id)a4
{
  v5 = _Block_copy(a4);
  sub_23F4390E0();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  v7 = self;
  v8 = (void *)sub_23F4390D0();
  v10[4] = sub_23F438F7C;
  v10[5] = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_23F438648;
  v10[3] = &block_descriptor_14;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC10StorageKit19SKCoreAnalyticsSink)init
{
  return (_TtC10StorageKit19SKCoreAnalyticsSink *)sub_23F438BF4(self, (uint64_t)a2, type metadata accessor for SKCoreAnalyticsSink);
}

@end