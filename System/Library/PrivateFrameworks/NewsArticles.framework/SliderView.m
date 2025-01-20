@interface SliderView
- (CGPoint)accessibilityActivationPoint;
- (NSString)accessibilityValue;
- (_TtC12NewsArticles10SliderView)initWithCoder:(id)a3;
- (_TtC12NewsArticles10SliderView)initWithFrame:(CGRect)a3;
- (int64_t)semanticContentAttribute;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)layoutSubviews;
- (void)panGestureRecognized:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
@end

@implementation SliderView

- (int64_t)semanticContentAttribute
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SliderView *)&v3 semanticContentAttribute];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v6 = self;
  [(SliderView *)&v9 setSemanticContentAttribute:a3];
  v7 = *(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles10SliderView_stackView);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  objc_msgSend(v7, sel_setSemanticContentAttribute_, -[SliderView semanticContentAttribute](&v8, sel_semanticContentAttribute));
}

- (_TtC12NewsArticles10SliderView)initWithFrame:(CGRect)a3
{
  return (_TtC12NewsArticles10SliderView *)sub_1BF7D8770(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NewsArticles10SliderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF7D9E90();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1BF7D9074();
}

- (NSString)accessibilityValue
{
  sub_1BF7E3EA8();
  v2 = (void *)sub_1BF7E3998();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles10SliderView_elapsedTrack);
  id v3 = self;
  objc_msgSend(v2, sel_accessibilityFrame);
  CGFloat MaxX = CGRectGetMaxX(v9);
  [(SliderView *)v3 accessibilityFrame];
  CGFloat MidY = CGRectGetMidY(v10);

  double v6 = MaxX;
  double v7 = MidY;
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)accessibilityIncrement
{
  v2 = self;
  sub_1BF7D9274();
}

- (void)accessibilityDecrement
{
  v2 = self;
  sub_1BF7D9384();
}

- (void)panGestureRecognized:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BF7D94A0(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles10SliderView____lazy_storage___elapsedTrackWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles10SliderView____lazy_storage___trackHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles10SliderView_feedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles10SliderView____lazy_storage___panRecognizer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles10SliderView_elapsedTrackColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles10SliderView_remainingTrackColor));

  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles10SliderView_valueChangedHandler);
  sub_1BF4C35A0(v3);
}

@end