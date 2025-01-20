@interface CollapsingButton
- (BOOL)isAccessibilityElement;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC5TeaUI16CollapsingButton)init;
- (_TtC5TeaUI16CollapsingButton)initWithCoder:(id)a3;
- (_TtC5TeaUI16CollapsingButton)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation CollapsingButton

- (_TtC5TeaUI16CollapsingButton)init
{
  return (_TtC5TeaUI16CollapsingButton *)CollapsingButton.init()();
}

- (_TtC5TeaUI16CollapsingButton)initWithCoder:(id)a3
{
  id v3 = a3;
  CollapsingButton.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  CollapsingButton.layoutSubviews()();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = CollapsingButton.intrinsicContentSize.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  CGSize v6 = CollapsingButton.sizeThatFits(_:)((CGSize)__PAIR128__(v5, v4));

  double width = v6.width;
  double height = v6.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  unint64_t v5 = self;
  CGSize v10 = CollapsingButton.systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)((CGSize)__PAIR128__(v7, v6), v8, v9);

  double width = v10.width;
  double height = v10.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)didMoveToWindow
{
  v2 = self;
  CollapsingButton.didMoveToWindow()();
}

- (_TtC5TeaUI16CollapsingButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI16CollapsingButton_animationDelegate);
  sub_1B5EEEF24((uint64_t)self + OBJC_IVAR____TtC5TeaUI16CollapsingButton_configuration);

  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI16CollapsingButton_animatedTitleLabel);
}

- (BOOL)isAccessibilityElement
{
  v2 = self;
  unsigned __int8 v3 = CollapsingButton.isAccessibilityElement.getter();

  return v3 & 1;
}

- (unint64_t)accessibilityTraits
{
  v2 = self;
  unint64_t v3 = CollapsingButton.accessibilityTraits.getter();

  return v3;
}

@end