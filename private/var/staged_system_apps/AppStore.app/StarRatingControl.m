@interface StarRatingControl
- (BOOL)isAccessibilityElement;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityCustomActions;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC8AppStore17StarRatingControl)initWithCoder:(id)a3;
- (_TtC8AppStore17StarRatingControl)initWithFrame:(CGRect)a3;
- (uint64_t)beginTrackingWithTouch:(void *)a3 withEvent:(void *)a4;
- (void)accessibilitySetStarRatingFive;
- (void)accessibilitySetStarRatingFour;
- (void)accessibilitySetStarRatingOne;
- (void)accessibilitySetStarRatingThree;
- (void)accessibilitySetStarRatingTwo;
- (void)accessibilitySetStarRatingZero;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)setAccessibilityCustomActions:(id)a3;
- (void)setAccessibilityHint:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityValue:(id)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation StarRatingControl

- (_TtC8AppStore17StarRatingControl)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore17StarRatingControl_rating) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore17StarRatingControl_lastSentRating) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8AppStore17StarRatingControl_touchOutsideMargin);
  _OWORD *v4 = xmmword_1007DE830;
  v4[1] = xmmword_1007DE830;
  id v5 = a3;

  result = (_TtC8AppStore17StarRatingControl *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  id v4 = [(StarRatingControl *)v3 traitCollection];
  double v5 = sub_1005E0D84();
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  sub_1005DF318(x, y, width, height);
}

- (uint64_t)beginTrackingWithTouch:(void *)a3 withEvent:(void *)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = a1;
  [v6 locationInView:v8];
  sub_1005DFE60(v9);
  uint64_t v10 = *(void *)&v8[OBJC_IVAR____TtC8AppStore17StarRatingControl_rating];
  *(void *)&v8[OBJC_IVAR____TtC8AppStore17StarRatingControl_rating] = v11;
  if (v10 != v11) {
    [v8 setNeedsDisplay];
  }

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = self;
  sub_1005E100C(a3);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore17StarRatingControl_lastSentRating);
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore17StarRatingControl_rating);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore17StarRatingControl_rating) = v3;
  if (v4 != v3) {
    [(StarRatingControl *)self setNeedsDisplay];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StarRatingControl();
  id v2 = v3.receiver;
  [(StarRatingControl *)&v3 tintColorDidChange];
  [v2 setNeedsDisplay];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v7 = *(double *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC8AppStore17StarRatingControl_touchOutsideMargin);
  double v8 = *(double *)&self->rating[OBJC_IVAR____TtC8AppStore17StarRatingControl_touchOutsideMargin];
  double v9 = *(double *)&self->lastSentRating[OBJC_IVAR____TtC8AppStore17StarRatingControl_touchOutsideMargin];
  double v10 = *(double *)&self->touchOutsideMargin[OBJC_IVAR____TtC8AppStore17StarRatingControl_touchOutsideMargin];
  id v11 = a4;
  v12 = self;
  [(StarRatingControl *)v12 bounds];
  v20.origin.CGFloat x = v13 - v8;
  v20.origin.CGFloat y = v14 - v7;
  v20.size.CGFloat width = v8 + v10 + v15;
  v20.size.CGFloat height = v7 + v9 + v16;
  v19.CGFloat x = x;
  v19.CGFloat y = y;
  BOOL v17 = CGRectContainsPoint(v20, v19);

  return v17;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StarRatingControl();
  [(StarRatingControl *)&v4 setIsAccessibilityElement:v3];
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1005E00E0(self, (uint64_t)a2, 0xD00000000000001FLL, (void *)0x8000000100823860);
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1005E00E0(self, (uint64_t)a2, 0xD00000000000001ELL, (void *)0x8000000100823840);
}

- (void)setAccessibilityHint:(id)a3
{
}

- (NSString)accessibilityValue
{
  Swift::Int v2 = *(Swift::Int *)((char *)self + OBJC_IVAR____TtC8AppStore17StarRatingControl_rating);
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    BOOL v3 = self;
    v4._object = (void *)0x8000000100823820;
    v4._countAndFlagsBits = 0xD00000000000001ALL;
    v5._countAndFlagsBits = 0;
    v5._object = (void *)0xE000000000000000;
    localizedStringWithCount(_:count:comment:)(v4, v2, v5);

    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    return (NSString *)v6;
  }
  return self;
}

- (void)setAccessibilityValue:(id)a3
{
}

- (NSArray)accessibilityCustomActions
{
  Swift::Int v2 = self;
  unint64_t v3 = sub_1005E0328();

  if (v3)
  {
    sub_100084CF0(0, (unint64_t *)&unk_1009A0360);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  isa = a3;
  if (a3)
  {
    sub_100084CF0(0, (unint64_t *)&unk_1009A0360);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    Swift::String v5 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for StarRatingControl();
  [(StarRatingControl *)&v7 setAccessibilityCustomActions:isa];
}

- (void)accessibilitySetStarRatingZero
{
  Swift::Int v2 = self;
  sub_1005E0660(0);
}

- (void)accessibilitySetStarRatingOne
{
  Swift::Int v2 = self;
  sub_1005E0660(1);
}

- (void)accessibilitySetStarRatingTwo
{
  Swift::Int v2 = self;
  sub_1005E0660(2);
}

- (void)accessibilitySetStarRatingThree
{
  Swift::Int v2 = self;
  sub_1005E0660(3);
}

- (void)accessibilitySetStarRatingFour
{
  Swift::Int v2 = self;
  sub_1005E0660(4);
}

- (void)accessibilitySetStarRatingFive
{
  Swift::Int v2 = self;
  sub_1005E0660(5);
}

- (_TtC8AppStore17StarRatingControl)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8AppStore17StarRatingControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end