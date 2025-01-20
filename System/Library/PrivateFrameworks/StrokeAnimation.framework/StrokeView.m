@interface StrokeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SAStrokeAnimatingDelegate)interactionDelegate;
- (_TtC15StrokeAnimation10StrokeView)initWith:(id)a3 frame:(CGRect)a4;
- (_TtC15StrokeAnimation10StrokeView)initWithCoder:(id)a3;
- (_TtC15StrokeAnimation10StrokeView)initWithFrame:(CGRect)a3;
- (void)_didTapView:(id)a3;
- (void)endAnimation;
- (void)layoutSubviews;
- (void)setInteractionDelegate:(id)a3;
- (void)startAnimationRepeating:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithData:(id)a3;
@end

@implementation StrokeView

- (_TtC15StrokeAnimation10StrokeView)initWith:(id)a3 frame:(CGRect)a4
{
  id v4 = a3;
  return (_TtC15StrokeAnimation10StrokeView *)StrokeView.init(with:frame:)();
}

- (_TtC15StrokeAnimation10StrokeView)initWithFrame:(CGRect)a3
{
  return (_TtC15StrokeAnimation10StrokeView *)StrokeView.init(frame:)();
}

- (_TtC15StrokeAnimation10StrokeView)initWithCoder:(id)a3
{
  id v3 = a3;
  StrokeView.init(coder:)();
}

- (void)_didTapView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_237D714EC(v4);
}

- (void)layoutSubviews
{
  v2 = self;
  StrokeView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  id v4 = self;
  CGSize v6 = StrokeView.sizeThatFits(_:)((CGSize)__PAIR128__(v5, *(unint64_t *)&width));

  double v7 = v6.width;
  double height = v6.height;
  result.double height = height;
  result.CGFloat width = v7;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  CGSize v6 = self;
  v9.is_nil = (char)v6;
  double v7 = v6;
  v9.value.super.isa = (Class)a3;
  StrokeView.traitCollectionDidChange(_:)(v9);
}

- (void).cxx_destruct
{
  sub_237D738A0((uint64_t)self + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationDelegate);
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeContourLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)updateWithData:(id)a3
{
  id v4 = (objc_class *)a3;
  v5._underlyingObject = (SAStrokeDataInternal *)self;
  underlyingObject = v5._underlyingObject;
  v5.super.isa = v4;
  StrokeView.update(with:)(v5);
}

- (SAStrokeAnimatingDelegate)interactionDelegate
{
}

- (void)setInteractionDelegate:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  StrokeView.interactionDelegate.setter();
}

- (void)startAnimationRepeating:(BOOL)a3
{
  id v3 = self;
  StrokeView.startAnimationRepeating(_:)(0);
}

- (void)endAnimation
{
  v2 = self;
  StrokeView.endAnimation()();
}

@end