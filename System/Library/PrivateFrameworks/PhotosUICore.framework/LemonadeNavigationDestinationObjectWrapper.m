@interface LemonadeNavigationDestinationObjectWrapper
- (BOOL)isEqual:(id)a3;
- (NSString)itemIdentifier;
- (_TtC12PhotosUICore42LemonadeNavigationDestinationObjectWrapper)init;
- (int64_t)hash;
@end

@implementation LemonadeNavigationDestinationObjectWrapper

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AB23BC4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1AA11ACC8((uint64_t)v8);

  sub_1A9BA860C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  sub_1AB23C76C();
  v3 = self;
  sub_1AA1192CC((uint64_t)v6);
  int64_t v4 = sub_1AB23C7BC();

  return v4;
}

- (NSString)itemIdentifier
{
}

- (_TtC12PhotosUICore42LemonadeNavigationDestinationObjectWrapper)init
{
  result = (_TtC12PhotosUICore42LemonadeNavigationDestinationObjectWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9CF93C4((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore42LemonadeNavigationDestinationObjectWrapper_wrappedValue, type metadata accessor for LemonadeNavigationDestination);
  swift_bridgeObjectRelease();
}

@end