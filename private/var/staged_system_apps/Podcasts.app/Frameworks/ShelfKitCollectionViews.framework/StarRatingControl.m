@interface StarRatingControl
- (BOOL)isAccessibilityElement;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityCustomActions;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC23ShelfKitCollectionViews17StarRatingControl)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews17StarRatingControl)initWithFrame:(CGRect)a3;
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
@end

@implementation StarRatingControl

- (_TtC23ShelfKitCollectionViews17StarRatingControl)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_starCount) = (Class)(&dword_4 + 1);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_hasRTLTransformSet) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_rating) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_lastSentRating) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews17StarRatingControl *)sub_385890();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_18D754();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[StarRatingControl sizeThatFits:](self, "sizeThatFits:", 0.0, 0.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  sub_18BFE4(x, y, width, height);
}

- (uint64_t)beginTrackingWithTouch:(void *)a3 withEvent:(void *)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = a1;
  [v6 locationInView:v8];
  sub_18C6D8(v9);
  uint64_t v10 = *(void *)&v8[OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_rating];
  *(void *)&v8[OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_rating] = v11;
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
  sub_18D858(a3);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_18D8FC();
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
  return (NSString *)sub_18C898(self, (uint64_t)a2, 0xD00000000000001FLL, (void *)0x80000000003AFB80);
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_18C898(self, (uint64_t)a2, 0xD00000000000001ELL, (void *)0x80000000003AFB60);
}

- (void)setAccessibilityHint:(id)a3
{
}

- (NSString)accessibilityValue
{
  sub_18D9A0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_rating));
  if (v2)
  {
    NSString v3 = sub_384380();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setAccessibilityValue:(id)a3
{
}

- (NSArray)accessibilityCustomActions
{
  uint64_t v2 = self;
  unint64_t v3 = sub_18CAF4();

  if (v3)
  {
    sub_2E66C(0, &qword_4792B0);
    v4.super.isa = sub_3845E0().super.isa;
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
    sub_2E66C(0, &qword_4792B0);
    sub_3845F0();
    double v5 = self;
    isa = sub_3845E0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for StarRatingControl();
  [(StarRatingControl *)&v7 setAccessibilityCustomActions:isa];
}

- (void)accessibilitySetStarRatingZero
{
  uint64_t v2 = self;
  sub_18CF2C(0);
}

- (void)accessibilitySetStarRatingOne
{
  uint64_t v2 = self;
  sub_18CF2C(1);
}

- (void)accessibilitySetStarRatingTwo
{
  uint64_t v2 = self;
  sub_18CF2C(2);
}

- (void)accessibilitySetStarRatingThree
{
  uint64_t v2 = self;
  sub_18CF2C(3);
}

- (void)accessibilitySetStarRatingFour
{
  uint64_t v2 = self;
  sub_18CF2C(4);
}

- (void)accessibilitySetStarRatingFive
{
  uint64_t v2 = self;
  sub_18CF2C(5);
}

- (_TtC23ShelfKitCollectionViews17StarRatingControl)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC23ShelfKitCollectionViews17StarRatingControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end