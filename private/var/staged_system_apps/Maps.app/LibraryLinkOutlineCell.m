@interface LibraryLinkOutlineCell
- (_TtC4Maps22LibraryLinkOutlineCell)initWithCoder:(id)a3;
- (_TtC4Maps22LibraryLinkOutlineCell)initWithFrame:(CGRect)a3;
- (_TtC4Maps27LibraryLinkOutlineCellModel)cellModel;
- (void)setCellModel:(id)a3;
- (void)updateFromModel;
@end

@implementation LibraryLinkOutlineCell

- (_TtC4Maps27LibraryLinkOutlineCellModel)cellModel
{
  return (_TtC4Maps27LibraryLinkOutlineCellModel *)sub_10011D8BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps22LibraryLinkOutlineCell_cellModel);
}

- (void)setCellModel:(id)a3
{
  v5 = (void **)((char *)&self->super.super + OBJC_IVAR____TtC4Maps22LibraryLinkOutlineCell_cellModel);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_10011DA40();
}

- (_TtC4Maps22LibraryLinkOutlineCell)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps22LibraryLinkOutlineCell *)LibraryLinkOutlineCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps22LibraryLinkOutlineCell)initWithCoder:(id)a3
{
  *(MapsThemeCollectionViewOutlineCell *)((char *)&self->super.super
                                        + OBJC_IVAR____TtC4Maps22LibraryLinkOutlineCell_cellModel) = 0;
  id v4 = a3;

  result = (_TtC4Maps22LibraryLinkOutlineCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)updateFromModel
{
  v2 = self;
  sub_10011DA40();
}

- (void).cxx_destruct
{
}

@end