@interface ShelfTitleView
- (_TtC9SeymourUI14ShelfTitleView)initWithCoder:(id)a3;
- (_TtC9SeymourUI14ShelfTitleView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)prepareForReuse;
- (void)tappedTitleButton:(id)a3;
@end

@implementation ShelfTitleView

- (_TtC9SeymourUI14ShelfTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI14ShelfTitleView *)sub_239F67268(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_239F681F0();
}

- (void)applyLayoutAttributes:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0F400);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for ShelfTitleView(0);
  v15.receiver = self;
  v15.super_class = v8;
  id v9 = a3;
  v10 = self;
  [(ShelfTitleView *)&v15 applyLayoutAttributes:v9];
  id v11 = objc_msgSend(v9, sel_indexPath);
  sub_23A7F6AA8();

  uint64_t v12 = sub_23A7F6B08();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 0, 1, v12);
  uint64_t v13 = (uint64_t)v10 + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_indexPath;
  swift_beginAccess();
  sub_239C24600((uint64_t)v7, v13);
  swift_endAccess();
}

- (void)tappedTitleButton:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_23A8009F8();
  swift_unknownObjectRelease();
  sub_239F68468();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC9SeymourUI14ShelfTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239F69A24();
}

- (void).cxx_destruct
{
  sub_239C9D7E8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_indexPath);
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_titleButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_239F6A338((uint64_t)self + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_layout);
  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_titleTopConstraint);
}

@end