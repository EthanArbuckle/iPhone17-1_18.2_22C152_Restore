@interface FilterHeaderCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI16FilterHeaderCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI16FilterHeaderCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)tappedFilterButton:(id)a3;
- (void)textSizeChanged:(id)a3;
- (void)tintColorDidChange;
@end

@implementation FilterHeaderCell

- (_TtC9SeymourUI16FilterHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI16FilterHeaderCell *)sub_23A1D2DA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI16FilterHeaderCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A1D4BB8();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FilterHeaderCell();
  v2 = (char *)v5.receiver;
  [(FilterHeaderCell *)&v5 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_filterButton];
  id v4 = objc_msgSend(v3, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v4, sel_setCornerRadius_, CGRectGetHeight(v6) * 0.5);
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  objc_super v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  CGRect v6 = (objc_class *)type metadata accessor for FilterHeaderCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(FilterHeaderCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(FilterHeaderCell *)v9 contentView];
  *(float *)&double v11 = a4;
  *(float *)&double v12 = a5;
  objc_msgSend(v10, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_23A1D3B80();
}

- (void)tappedFilterButton:(id)a3
{
  uint64_t v5 = type metadata accessor for ShelfItemAction();
  __n128 v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_delegate, v6);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = swift_storeEnumTagMultiPayload();
    MEMORY[0x270FA5388](v11);
    *(&v14 - 4) = 0;
    *((unsigned char *)&v14 - 24) = 1;
    *(&v14 - 2) = (uint64_t)v8;
    *(&v14 - 1) = v10;
    id v12 = a3;
    double v13 = self;
    sub_239C831A4(v13, sub_239C75058, &v14 - 6, v10);
    swift_unknownObjectRelease();
    sub_239C74FFC((uint64_t)v8);
  }
}

- (void)textSizeChanged:(id)a3
{
  uint64_t v4 = sub_23A7F5F48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F5F18();
  uint64_t v8 = self;
  sub_23A1D3F44();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_delegate);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_itemInfo, &qword_268A0E7E0);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_localizer, &qword_268A16CF8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_filterButton));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_titleLabelTrailingToFilterButtonLeadingConstraint);
}

@end