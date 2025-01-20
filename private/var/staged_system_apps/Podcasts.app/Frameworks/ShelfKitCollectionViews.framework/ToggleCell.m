@interface ToggleCell
- (_TtC23ShelfKitCollectionViews10ToggleCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews10ToggleCell)initWithFrame:(CGRect)a3;
- (void)segmentedControlTapped;
@end

@implementation ToggleCell

- (_TtC23ShelfKitCollectionViews10ToggleCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews10ToggleCell *)sub_D4A44(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews10ToggleCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_D5A20();
}

- (void)segmentedControlTapped
{
  v2 = self;
  sub_D4FD0();
}

- (void).cxx_destruct
{
  swift_release();
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews10ToggleCell_item, &qword_474C80);
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews10ToggleCell_segmentedControl);
}

@end