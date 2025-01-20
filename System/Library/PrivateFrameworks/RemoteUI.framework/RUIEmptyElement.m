@interface RUIEmptyElement
- (_TtC8RemoteUI15RUIEmptyElement)init;
- (_TtC8RemoteUI15RUIEmptyElement)initWithAttributes:(id)a3 parent:(id)a4;
- (id)view;
@end

@implementation RUIEmptyElement

- (id)view
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR____TtC8RemoteUI15RUIEmptyElement__view));
}

- (_TtC8RemoteUI15RUIEmptyElement)initWithAttributes:(id)a3 parent:(id)a4
{
  if (a3) {
    uint64_t v5 = sub_214602E08();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = a4;
  return (_TtC8RemoteUI15RUIEmptyElement *)sub_2145CB3E4(v5, a4);
}

- (_TtC8RemoteUI15RUIEmptyElement)init
{
  uint64_t v3 = OBJC_IVAR____TtC8RemoteUI15RUIEmptyElement__view;
  id v4 = objc_allocWithZone(MEMORY[0x263F82E00]);
  uint64_t v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for RUIEmptyElement();
  return [(RUIElement *)&v7 init];
}

- (void).cxx_destruct
{
}

@end