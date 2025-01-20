@interface CRLUSDZPlayPauseKnobTracker
- (BOOL)allowHUDToDisplay;
- (_TtC8Freeform27CRLUSDZPlayPauseKnobTracker)init;
- (_TtC8Freeform27CRLUSDZPlayPauseKnobTracker)initWithRep:(id)a3 knob:(id)a4;
- (void)beginMovingKnob;
- (void)endMovingKnob;
@end

@implementation CRLUSDZPlayPauseKnobTracker

- (BOOL)allowHUDToDisplay
{
  return 0;
}

- (void)beginMovingKnob
{
  v2 = self;
  sub_100948698();
}

- (void)endMovingKnob
{
  v2 = self;
  sub_100948778();
}

- (_TtC8Freeform27CRLUSDZPlayPauseKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC8Freeform27CRLUSDZPlayPauseKnobTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8Freeform27CRLUSDZPlayPauseKnobTracker)init
{
  result = (_TtC8Freeform27CRLUSDZPlayPauseKnobTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end