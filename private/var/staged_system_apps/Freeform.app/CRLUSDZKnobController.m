@interface CRLUSDZKnobController
- (_TtC8Freeform21CRLUSDZKnobController)init;
- (void)hideWithImmediately:(BOOL)a3;
@end

@implementation CRLUSDZKnobController

- (void)hideWithImmediately:(BOOL)a3
{
  v4 = self;
  sub_100DE2078(a3);
}

- (_TtC8Freeform21CRLUSDZKnobController)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLUSDZKnobController_visibilityState) = 2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLUSDZKnobController_rotationKnob) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLUSDZKnobController_playPauseKnob) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLUSDZKnobController_currentKnobs) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLUSDZKnobController();
  return [(CRLUSDZKnobController *)&v3 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end