@interface SectionViewSegmentedView
- (_TtC5TeaUI24SectionViewSegmentedView)initWithCoder:(id)a3;
- (_TtC5TeaUI24SectionViewSegmentedView)initWithFrame:(CGRect)a3;
- (void)doSegmentChange;
- (void)layoutSubviews;
@end

@implementation SectionViewSegmentedView

- (_TtC5TeaUI24SectionViewSegmentedView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI24SectionViewSegmentedView *)sub_1B60A44E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5TeaUI24SectionViewSegmentedView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B60A463C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B60A4700();
}

- (void)doSegmentChange
{
  v2 = self;
  sub_1B60A4930();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI24SectionViewSegmentedView_segmentedControl));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI24SectionViewSegmentedView_onChangeBlock);
  sub_1B5E3799C(v3);
}

@end