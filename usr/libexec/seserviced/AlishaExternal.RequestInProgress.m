@interface AlishaExternal.RequestInProgress
- (NSData)keyIdentifier;
- (_TtCC10seserviced14AlishaExternal17RequestInProgress)init;
- (unsigned)functionIdentifier;
@end

@implementation AlishaExternal.RequestInProgress

- (NSData)keyIdentifier
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC10seserviced14AlishaExternal17RequestInProgress_keyIdentifier);
  unint64_t v3 = *(void *)&self->keyIdentifier[OBJC_IVAR____TtCC10seserviced14AlishaExternal17RequestInProgress_keyIdentifier];
  sub_10006D0EC(v2, v3);
  v4.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10006D144(v2, v3);

  return (NSData *)v4.super.isa;
}

- (unsigned)functionIdentifier
{
  return *(_WORD *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC10seserviced14AlishaExternal17RequestInProgress_functionIdentifier);
}

- (_TtCC10seserviced14AlishaExternal17RequestInProgress)init
{
  result = (_TtCC10seserviced14AlishaExternal17RequestInProgress *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end