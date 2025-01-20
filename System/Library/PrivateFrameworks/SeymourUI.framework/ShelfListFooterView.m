@interface ShelfListFooterView
- (_TtC9SeymourUI19ShelfListFooterView)initWithCoder:(id)a3;
- (_TtC9SeymourUI19ShelfListFooterView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)prepareForReuse;
@end

@implementation ShelfListFooterView

- (_TtC9SeymourUI19ShelfListFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19ShelfListFooterView *)sub_23A5F4C0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19ShelfListFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A5F5F1C();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShelfListFooterView();
  v2 = (char *)v3.receiver;
  [(ShelfListFooterView *)&v3 prepareForReuse];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9SeymourUI19ShelfListFooterView_label], sel_setText_, 0, v3.receiver, v3.super_class);
}

- (void)applyLayoutAttributes:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0F400);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for ShelfListFooterView();
  v15.receiver = self;
  v15.super_class = v8;
  id v9 = a3;
  v10 = self;
  [(ShelfListFooterView *)&v15 applyLayoutAttributes:v9];
  id v11 = objc_msgSend(v9, sel_indexPath);
  sub_23A7F6AA8();

  uint64_t v12 = sub_23A7F6B08();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 0, 1, v12);
  uint64_t v13 = (uint64_t)v10 + OBJC_IVAR____TtC9SeymourUI19ShelfListFooterView_indexPath;
  swift_beginAccess();
  sub_239C24600((uint64_t)v7, v13);
  swift_endAccess();
}

- (void).cxx_destruct
{
  sub_239C9D7E8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI19ShelfListFooterView_indexPath);
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI19ShelfListFooterView_delegate);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19ShelfListFooterView_label);
}

@end