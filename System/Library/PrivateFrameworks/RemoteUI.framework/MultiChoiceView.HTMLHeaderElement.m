@interface MultiChoiceView.HTMLHeaderElement
- (RUIElement)parent;
- (_TtCV8RemoteUI15MultiChoiceView17HTMLHeaderElement)init;
- (_TtCV8RemoteUI15MultiChoiceView17HTMLHeaderElement)initWithAttributes:(id)a3 parent:(id)a4;
- (void)webContainerView:(id)a3 didClickLinkWithURL:(id)a4;
@end

@implementation MultiChoiceView.HTMLHeaderElement

- (RUIElement)parent
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0x60);
  v3 = self;
  v4 = (void *)v2();

  return (RUIElement *)v4;
}

- (void)webContainerView:(id)a3 didClickLinkWithURL:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780DEF0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_214602058();
    uint64_t v10 = sub_2146020B8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_2146020B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  id v12 = a3;
  v13 = self;
  sub_214583D0C((uint64_t)v9);

  sub_2145515B8((uint64_t)v9, &qword_26780DEF0);
}

- (_TtCV8RemoteUI15MultiChoiceView17HTMLHeaderElement)initWithAttributes:(id)a3 parent:(id)a4
{
}

- (_TtCV8RemoteUI15MultiChoiceView17HTMLHeaderElement)init
{
  result = (_TtCV8RemoteUI15MultiChoiceView17HTMLHeaderElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCV8RemoteUI15MultiChoiceView17HTMLHeaderElement_webContainerView));
  swift_unknownObjectWeakDestroy();
}

@end