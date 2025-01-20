@interface ContentUnavailableCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI22ContentUnavailableCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI22ContentUnavailableCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation ContentUnavailableCell

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI22ContentUnavailableCell_contentUnavailableView);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI22ContentUnavailableCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI22ContentUnavailableCell *)sub_239EB4BC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI22ContentUnavailableCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EB59D0();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for ContentUnavailableCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(ContentUnavailableCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI22ContentUnavailableCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
  objc_msgSend(*(id *)((char *)&v7->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI22ContentUnavailableCell_contentUnavailableView), sel_smu_updateWithType_text_secondaryText_image_buttonTitle_buttonPrimaryAction_, 0, 0, 0, 0, 0, 0);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(ContentUnavailableCell *)v9 contentView];
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

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22ContentUnavailableCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22ContentUnavailableCell_itemInfo);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI22ContentUnavailableCell_contentUnavailableView);
}

@end