@interface ColorSectionDecorationView
- (_TtC5TeaUI26ColorSectionDecorationView)initWithCoder:(id)a3;
- (_TtC5TeaUI26ColorSectionDecorationView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)didMoveToSuperview;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation ColorSectionDecorationView

- (void)willMoveToSuperview:(id)a3
{
  id v5 = a3;
  v6 = self;
  ColorSectionDecorationView.willMove(toSuperview:)((UIView_optional *)a3);
}

- (void)didMoveToSuperview
{
  v2 = self;
  ColorSectionDecorationView.didMoveToSuperview()();
}

- (void)applyLayoutAttributes:(id)a3
{
  v4 = (UICollectionViewLayoutAttributes *)a3;
  id v5 = self;
  ColorSectionDecorationView.apply(_:)(v4);
}

- (_TtC5TeaUI26ColorSectionDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI26ColorSectionDecorationView *)ColorSectionDecorationView.init(frame:)();
}

- (_TtC5TeaUI26ColorSectionDecorationView)initWithCoder:(id)a3
{
  return (_TtC5TeaUI26ColorSectionDecorationView *)ColorSectionDecorationView.init(coder:)(a3);
}

@end