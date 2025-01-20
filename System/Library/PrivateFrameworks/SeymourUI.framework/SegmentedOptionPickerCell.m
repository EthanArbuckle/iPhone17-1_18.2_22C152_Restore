@interface SegmentedOptionPickerCell
- (_TtC9SeymourUI25SegmentedOptionPickerCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI25SegmentedOptionPickerCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)segmentedControlTapped:(id)a3;
@end

@implementation SegmentedOptionPickerCell

- (_TtC9SeymourUI25SegmentedOptionPickerCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI25SegmentedOptionPickerCell *)sub_239EE2BF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI25SegmentedOptionPickerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EE411C();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for SegmentedOptionPickerCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(SegmentedOptionPickerCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239EE31A0();
}

- (void)segmentedControlTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_239EE33E4(v4);
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_itemInfo);
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_onElementAppearance));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_onElementDisappearance));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_onImpressionableBoundsChange));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_onVisibleBoundsChange));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_segmentedControl);
}

@end