@interface LabelRender
- (CGRect)accessibilityFrameForLabelContainer;
- (NSString)speakableString;
- (_TtC7Measure11LabelRender)init;
- (_TtC7Measure19TouchableSpriteNode)labelNode;
- (int64_t)state;
- (void)selectAnimationComplete;
- (void)setLabelNode:(id)a3;
- (void)setSpeakableString:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation LabelRender

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_state);
}

- (void)setState:(int64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_state);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_state) = (Class)a3;
  if (v3 != a3)
  {
    v5 = self;
    sub_1000C51D0(a3);
  }
}

- (NSString)speakableString
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setSpeakableString:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Measure11LabelRender_speakableString);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (_TtC7Measure19TouchableSpriteNode)labelNode
{
  return (_TtC7Measure19TouchableSpriteNode *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR____TtC7Measure11LabelRender_labelNode));
}

- (void)setLabelNode:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_labelNode);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_labelNode) = (Class)a3;
  id v3 = a3;
}

- (_TtC7Measure11LabelRender)init
{
  result = (_TtC7Measure11LabelRender *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001FE1C((uint64_t)self + OBJC_IVAR____TtC7Measure11LabelRender_delegate);
  sub_100028914(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_labelSizeAdjustment));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  id v3 = *(void **)&self->labelType[OBJC_IVAR____TtC7Measure11LabelRender_attributedText];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_1000DB3D4((uint64_t)self + OBJC_IVAR____TtC7Measure11LabelRender_snapTimestamp);
  swift_bridgeObjectRelease();
  sub_1000DB3D4((uint64_t)self + OBJC_IVAR____TtC7Measure11LabelRender_occlusionResetTime);

  swift_release();
}

- (void)selectAnimationComplete
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_selectionState) = 2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_desiredAlpha) = 0;
}

- (CGRect)accessibilityFrameForLabelContainer
{
  double v2 = *(double *)&self->rectangleLabelData[OBJC_IVAR____TtC7Measure11LabelRender_currentProperties + 15];
  double v3 = *(double *)&self->labelSizeAdjustment[OBJC_IVAR____TtC7Measure11LabelRender_currentProperties + 1];
  double v4 = *(double *)&self->delegate[OBJC_IVAR____TtC7Measure11LabelRender_currentProperties + 8] - v2 * 0.5;
  double v5 = *(double *)&self->labelType[OBJC_IVAR____TtC7Measure11LabelRender_currentProperties] - v3 * 0.5;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

@end