@interface MultiChoiceView.Section
- (RUIElement)parent;
- (_TtCV8RemoteUI15MultiChoiceView7Section)init;
- (_TtCV8RemoteUI15MultiChoiceView7Section)initWithAttributes:(id)a3 parent:(id)a4;
- (id)staticFunctions;
@end

@implementation MultiChoiceView.Section

- (RUIElement)parent
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0x60);
  v3 = self;
  v4 = (void *)v2();

  return (RUIElement *)v4;
}

- (id)staticFunctions
{
  sub_2145840B0();
  sub_214586198(0, &qword_26780E028);
  v2 = (void *)sub_214603048();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtCV8RemoteUI15MultiChoiceView7Section)initWithAttributes:(id)a3 parent:(id)a4
{
}

- (_TtCV8RemoteUI15MultiChoiceView7Section)init
{
  result = (_TtCV8RemoteUI15MultiChoiceView7Section *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end