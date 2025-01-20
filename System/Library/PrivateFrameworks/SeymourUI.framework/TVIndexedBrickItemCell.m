@interface TVIndexedBrickItemCell
- (_TtC9SeymourUI22TVIndexedBrickItemCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI22TVIndexedBrickItemCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation TVIndexedBrickItemCell

- (_TtC9SeymourUI22TVIndexedBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI22TVIndexedBrickItemCell *)sub_23A5428F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI22TVIndexedBrickItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A544580();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVIndexedBrickItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(TVFocusableCollectionViewCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI22TVIndexedBrickItemCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22TVIndexedBrickItemCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22TVIndexedBrickItemCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVIndexedBrickItemCell_tvArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVIndexedBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVIndexedBrickItemCell_subtitleLabel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI22TVIndexedBrickItemCell_indexLabel);
}

@end