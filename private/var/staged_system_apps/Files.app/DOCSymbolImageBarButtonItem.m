@interface DOCSymbolImageBarButtonItem
- (BOOL)isEqual:(id)a3;
- (_TtC5Files27DOCSymbolImageBarButtonItem)init;
- (_TtC5Files27DOCSymbolImageBarButtonItem)initWithCoder:(id)a3;
@end

@implementation DOCSymbolImageBarButtonItem

- (_TtC5Files27DOCSymbolImageBarButtonItem)initWithCoder:(id)a3
{
  result = (_TtC5Files27DOCSymbolImageBarButtonItem *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = DOCSymbolImageBarButtonItem.isEqual(_:)((uint64_t)v8);

  sub_10006273C((uint64_t)v8);
  return v6 & 1;
}

- (_TtC5Files27DOCSymbolImageBarButtonItem)init
{
  result = (_TtC5Files27DOCSymbolImageBarButtonItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end