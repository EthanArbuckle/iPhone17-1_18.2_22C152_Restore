@interface CRLWPKnobPositioning_i
- (BOOL)shouldCreateKnobsForSelection:(id)a3 inStorage:(id)a4;
- (CGPoint)centerOfSelectionHeadPinIn:(id)a3;
- (CGPoint)centerOfSelectionTailPinIn:(id)a3;
- (CGPoint)knobCenterForSelection:(id)a3 knob:(id)a4;
- (_TtC8Freeform22CRLWPKnobPositioning_i)init;
- (_TtC8Freeform22CRLWPKnobPositioning_i)initWithLayout:(id)a3;
- (double)knobRadius;
@end

@implementation CRLWPKnobPositioning_i

- (double)knobRadius
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLWPKnobPositioning_i_knobRadius);
}

- (BOOL)shouldCreateKnobsForSelection:(id)a3 inStorage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100BE5E90(v6);

  return v9 & 1;
}

- (_TtC8Freeform22CRLWPKnobPositioning_i)initWithLayout:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLWPKnobPositioning_i_knobRadius) = (Class)0x402E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLWPKnobPositioning_i_layout) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLWPKnobPositioning_i();
  id v4 = a3;
  return [(CRLWPKnobPositioning_i *)&v6 init];
}

- (CGPoint)knobCenterForSelection:(id)a3 knob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100BE52BC(v6, v7);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)centerOfSelectionHeadPinIn:(id)a3
{
  type metadata accessor for CRLTextRange();
  id v4 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = qword_10166EE60;
  id v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (id)qword_10171A478;
  swift_bridgeObjectRetain();
  sub_100BE5818((uint64_t)v6, v4, v10);

  swift_bridgeObjectRelease_n();
  double v8 = v10[0];
  double v9 = v10[1];
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)centerOfSelectionTailPinIn:(id)a3
{
  type metadata accessor for CRLTextRange();
  id v4 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = qword_10166EE60;
  id v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (id)qword_10171A478;
  swift_bridgeObjectRetain();
  sub_100BE5B08((uint64_t)v6, v4, v10);

  swift_bridgeObjectRelease_n();
  double v8 = v10[0];
  double v9 = v10[1];
  result.y = v9;
  result.x = v8;
  return result;
}

- (_TtC8Freeform22CRLWPKnobPositioning_i)init
{
  CGPoint result = (_TtC8Freeform22CRLWPKnobPositioning_i *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end