@interface TVOptionsShelfActionView
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI24TVOptionsShelfActionView)initWithCoder:(id)a3;
- (_TtC9SeymourUI24TVOptionsShelfActionView)initWithFrame:(CGRect)a3;
@end

@implementation TVOptionsShelfActionView

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI24TVOptionsShelfActionView_button);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI24TVOptionsShelfActionView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI24TVOptionsShelfActionView *)sub_23A29FC6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI24TVOptionsShelfActionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A2A0488();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24TVOptionsShelfActionView_containerGuide));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI24TVOptionsShelfActionView_button);
}

@end