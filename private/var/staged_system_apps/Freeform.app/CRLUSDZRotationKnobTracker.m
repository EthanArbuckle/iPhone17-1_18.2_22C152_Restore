@interface CRLUSDZRotationKnobTracker
- (BOOL)allowHUDToDisplay;
- (BOOL)operationShouldBeDynamic;
- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3;
- (BOOL)supportsAlignmentGuides;
- (_TtC8Freeform26CRLUSDZRotationKnobTracker)init;
- (_TtC8Freeform26CRLUSDZRotationKnobTracker)initWithRep:(id)a3 knob:(id)a4;
- (void)beginMovingKnob;
- (void)commitChangesForReps:(id)a3;
- (void)endMovingKnob;
- (void)moveKnobToRepPosition:(CGPoint)a3;
@end

@implementation CRLUSDZRotationKnobTracker

- (BOOL)allowHUDToDisplay
{
  return 0;
}

- (void)beginMovingKnob
{
  v2 = self;
  sub_100559D44();
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 1;
}

- (void)commitChangesForReps:(id)a3
{
  sub_10055A764();
  sub_10055A7A4();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  sub_100559FCC();

  swift_bridgeObjectRelease();
}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = self;
  sub_10055A13C(x, y);
}

- (void)endMovingKnob
{
  v2 = self;
  sub_10055A4B4();
}

- (_TtC8Freeform26CRLUSDZRotationKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC8Freeform26CRLUSDZRotationKnobTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8Freeform26CRLUSDZRotationKnobTracker)init
{
  result = (_TtC8Freeform26CRLUSDZRotationKnobTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end