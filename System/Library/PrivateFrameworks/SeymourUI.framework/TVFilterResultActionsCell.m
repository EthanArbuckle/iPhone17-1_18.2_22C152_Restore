@interface TVFilterResultActionsCell
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI25TVFilterResultActionsCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI25TVFilterResultActionsCell)initWithFrame:(CGRect)a3;
- (void)clearButtonTapped;
- (void)prepareForReuse;
- (void)sortButtonTapped;
@end

@implementation TVFilterResultActionsCell

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_sortButton);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI25TVFilterResultActionsCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI25TVFilterResultActionsCell *)sub_239C73D00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI25TVFilterResultActionsCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239C75068();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVFilterResultActionsCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(TVFilterResultActionsCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void)clearButtonTapped
{
  uint64_t v3 = type metadata accessor for ShelfItemAction();
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_delegate);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = swift_storeEnumTagMultiPayload();
    MEMORY[0x270FA5388](v8);
    *(&v10 - 4) = 0;
    *((unsigned char *)&v10 - 24) = 1;
    *(&v10 - 2) = (uint64_t)v5;
    *(&v10 - 1) = v7;
    uint64_t v9 = self;
    sub_239C831A4();
    swift_unknownObjectRelease();
    sub_239C74FFC((uint64_t)v5);
  }
}

- (void)sortButtonTapped
{
  v2 = self;
  sub_239C74904();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_sortButton));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_bottomFocusGuide);
}

@end