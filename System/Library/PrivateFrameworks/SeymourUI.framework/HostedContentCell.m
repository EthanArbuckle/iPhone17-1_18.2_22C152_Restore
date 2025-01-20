@interface HostedContentCell
- (_TtC9SeymourUI17HostedContentCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI17HostedContentCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation HostedContentCell

- (_TtC9SeymourUI17HostedContentCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC9SeymourUI17HostedContentCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v8 = (char *)self + OBJC_IVAR____TtC9SeymourUI17HostedContentCell_itemInfo;
  uint64_t v9 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for HostedContentCell();
  return -[HostedContentCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI17HostedContentCell)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC9SeymourUI17HostedContentCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI17HostedContentCell_itemInfo;
  uint64_t v6 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC9SeymourUI17HostedContentCell *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for HostedContentCell();
  v11.receiver = self;
  v11.super_class = v6;
  id v7 = self;
  [(HostedContentCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI17HostedContentCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI17HostedContentCell_delegate);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI17HostedContentCell_itemInfo;

  sub_239C752B4((uint64_t)v3);
}

@end