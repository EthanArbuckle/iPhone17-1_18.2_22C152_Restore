@interface Choice
- (RUIElement)parent;
- (_TtC8RemoteUI6Choice)init;
- (_TtC8RemoteUI6Choice)initWithAttributes:(id)a3 parent:(id)a4;
- (id)staticValues;
- (void)pageDidChange;
- (void)startActivityIndicator;
- (void)stopActivityIndicator;
- (void)tappedWithSender:(id)a3;
@end

@implementation Choice

- (RUIElement)parent
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0x178);
  v3 = self;
  v4 = (void *)v2();

  return (RUIElement *)v4;
}

- (void)startActivityIndicator
{
  v2 = self;
  sub_214593424();
}

- (void)stopActivityIndicator
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8RemoteUI6Choice_activityIndicatorCount);
  BOOL v3 = __OFSUB__(v2, 1);
  uint64_t v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8RemoteUI6Choice_activityIndicatorCount) = (Class)(v4 & ~(v4 >> 63));
    if (v4 <= 0)
    {
      v5 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0x118);
      v6 = self;
      v7 = (void (*)(void))v5();
      v7();

      swift_release();
    }
  }
}

- (void)pageDidChange
{
  uint64_t v2 = self;
  sub_2145935E0();
}

- (void)tappedWithSender:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_214603398();
    v5 = (_TtC8RemoteUI6Choice *)swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = (void (*)(_TtC8RemoteUI6Choice *))(*(uint64_t (**)(_TtC8RemoteUI6Choice *))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0xE8))(v5);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    v6(self);
    sub_21458CF28(v7);
  }

  sub_2145515B8((uint64_t)v8, &qword_26780D848);
}

- (id)staticValues
{
  if (sub_214594C40())
  {
    sub_214596574();
    uint64_t v2 = (void *)sub_214603048();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (_TtC8RemoteUI6Choice)initWithAttributes:(id)a3 parent:(id)a4
{
  id v4 = a4;
  result = (_TtC8RemoteUI6Choice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8RemoteUI6Choice)init
{
  result = (_TtC8RemoteUI6Choice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21458CF28(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8RemoteUI6Choice_action));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
}

@end