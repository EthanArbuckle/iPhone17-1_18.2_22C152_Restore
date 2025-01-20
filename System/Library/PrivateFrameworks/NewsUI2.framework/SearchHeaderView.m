@interface SearchHeaderView
- (_TtC7NewsUI216SearchHeaderView)initWithCoder:(id)a3;
- (_TtC7NewsUI216SearchHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation SearchHeaderView

- (_TtC7NewsUI216SearchHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI216SearchHeaderView *)sub_1DF7C624C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI216SearchHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI216SearchHeaderView_titleLabel;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC7NewsUI216SearchHeaderView_bottomMarginView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);

  result = (_TtC7NewsUI216SearchHeaderView *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI216SearchHeaderView_bottomMarginView);
}

@end