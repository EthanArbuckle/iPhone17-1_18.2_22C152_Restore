@interface SectionSelectorView
- (CGSize)intrinsicContentSize;
- (_TtC5TeaUI19SectionSelectorView)initWithCoder:(id)a3;
- (_TtC5TeaUI19SectionSelectorView)initWithFrame:(CGRect)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)layoutSubviews;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation SectionSelectorView

- (_TtC5TeaUI19SectionSelectorView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI19SectionSelectorView *)sub_1B5EE55E8();
}

- (_TtC5TeaUI19SectionSelectorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5EE5B0C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B5EE5CEC();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_1B5EE4F18();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void).cxx_destruct
{
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI19SectionSelectorView_delegate);
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI19SectionSelectorView_dataSource);

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI19SectionSelectorView_unselectedButtonFont));
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI19SectionSelectorView_selectedButtonFont);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  v8 = self;
  sub_1B5EE652C((uint64_t)v8, &a5->x);
}

- (void)accessibilityIncrement
{
  v2 = self;
  sub_1B5EE680C();
}

- (void)accessibilityDecrement
{
  v2 = self;
  sub_1B5EE6950();
}

@end