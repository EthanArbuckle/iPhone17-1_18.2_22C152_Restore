@interface ContextualActionEventTracker
- (_TtC9ShortcutsP33_F50140E0B90057F770640AD097868D8228ContextualActionEventTracker)init;
- (void)dealloc;
- (void)mousePointerDevicesDidChange:(id)a3;
@end

@implementation ContextualActionEventTracker

- (void)dealloc
{
  v2 = self;
  sub_100088598();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9ShortcutsP33_F50140E0B90057F770640AD097868D8228ContextualActionEventTracker_event));

  swift_unknownObjectRelease();
}

- (void)mousePointerDevicesDidChange:(id)a3
{
  sub_100029C7C(0, &qword_1000F7140);
  sub_10008C710();
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_10008866C(v4);

  swift_bridgeObjectRelease();
}

- (_TtC9ShortcutsP33_F50140E0B90057F770640AD097868D8228ContextualActionEventTracker)init
{
}

@end