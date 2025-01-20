@interface LocationPickerTitleCell
- (_TtC7Journal23LocationPickerTitleCell)initWithCoder:(id)a3;
- (_TtC7Journal23LocationPickerTitleCell)initWithFrame:(CGRect)a3;
- (void)tapSegmentedControl;
@end

@implementation LocationPickerTitleCell

- (_TtC7Journal23LocationPickerTitleCell)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal23LocationPickerTitleCell *)sub_10024C03C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal23LocationPickerTitleCell)initWithCoder:(id)a3
{
  return (_TtC7Journal23LocationPickerTitleCell *)sub_10024C260(a3);
}

- (void)tapSegmentedControl
{
  v2 = self;
  sub_10024CD94();
}

- (void).cxx_destruct
{
  sub_10001ABB8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC7Journal23LocationPickerTitleCell_locationOptionChanged));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal23LocationPickerTitleCell_segmentedControl));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal23LocationPickerTitleCell_titleLabel);
}

@end