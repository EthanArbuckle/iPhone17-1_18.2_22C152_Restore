@interface RadialGradientSectionDecorationView
- (_TtC5TeaUI35RadialGradientSectionDecorationView)initWithCoder:(id)a3;
- (_TtC5TeaUI35RadialGradientSectionDecorationView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation RadialGradientSectionDecorationView

- (void)willMoveToSuperview:(id)a3
{
  id v5 = a3;
  v6 = self;
  RadialGradientSectionDecorationView.willMove(toSuperview:)((UIView_optional *)a3);
}

- (void)didMoveToSuperview
{
  v2 = self;
  RadialGradientSectionDecorationView.didMoveToSuperview()();
}

- (_TtC5TeaUI35RadialGradientSectionDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI35RadialGradientSectionDecorationView *)RadialGradientSectionDecorationView.init(frame:)();
}

- (_TtC5TeaUI35RadialGradientSectionDecorationView)initWithCoder:(id)a3
{
  id v3 = a3;
  RadialGradientSectionDecorationView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  RadialGradientSectionDecorationView.layoutSubviews()();
}

- (void)applyLayoutAttributes:(id)a3
{
  v4 = (UICollectionViewLayoutAttributes *)a3;
  id v5 = self;
  RadialGradientSectionDecorationView.apply(_:)(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI35RadialGradientSectionDecorationView_gradientView));
}

@end