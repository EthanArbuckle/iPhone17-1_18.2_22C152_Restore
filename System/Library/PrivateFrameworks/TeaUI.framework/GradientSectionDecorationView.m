@interface GradientSectionDecorationView
- (_TtC5TeaUI29GradientSectionDecorationView)initWithCoder:(id)a3;
- (_TtC5TeaUI29GradientSectionDecorationView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation GradientSectionDecorationView

- (void)willMoveToSuperview:(id)a3
{
  id v5 = a3;
  v6 = self;
  GradientSectionDecorationView.willMove(toSuperview:)((UIView_optional *)a3);
}

- (void)didMoveToSuperview
{
  v2 = self;
  GradientSectionDecorationView.didMoveToSuperview()();
}

- (_TtC5TeaUI29GradientSectionDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI29GradientSectionDecorationView *)GradientSectionDecorationView.init(frame:)();
}

- (_TtC5TeaUI29GradientSectionDecorationView)initWithCoder:(id)a3
{
  id v3 = a3;
  GradientSectionDecorationView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  GradientSectionDecorationView.layoutSubviews()();
}

- (void)applyLayoutAttributes:(id)a3
{
  v4 = (UICollectionViewLayoutAttributes *)a3;
  id v5 = self;
  GradientSectionDecorationView.apply(_:)(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI29GradientSectionDecorationView_gradientView));
}

@end