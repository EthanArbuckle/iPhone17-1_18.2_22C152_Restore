@interface EmbeddedGameProcessMonitor
- (_TtC11gamepolicyd26EmbeddedGameProcessMonitor)init;
- (void)dealloc;
- (void)setGameModeWithBundleIdentifier:(id)a3 enabled:(id)a4;
@end

@implementation EmbeddedGameProcessMonitor

- (void)dealloc
{
  v2 = self;
  sub_10001F4D0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_processMonitor));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10002C170((uint64_t)self + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeStatusConfig, (uint64_t (*)(void))&type metadata accessor for GameModeStatus.Config);
  sub_10002C170((uint64_t)self + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_modelManagerGameAssertionStatusConfig, (uint64_t (*)(void))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
  sub_10002C170((uint64_t)self + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_sustainedExecutionStatusConfig, (uint64_t (*)(void))&type metadata accessor for SustainedExecutionStatus.Config);
  sub_10002C170((uint64_t)self + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_dynamicSplitterStatusConfig, (uint64_t (*)(void))&type metadata accessor for DynamicSplitterStatus.Config);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_operationQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_assertionDescriptor));

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_interface);
}

- (void)setGameModeWithBundleIdentifier:(id)a3 enabled:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a4;
  v10 = self;
  sub_10002797C(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (_TtC11gamepolicyd26EmbeddedGameProcessMonitor)init
{
  result = (_TtC11gamepolicyd26EmbeddedGameProcessMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end