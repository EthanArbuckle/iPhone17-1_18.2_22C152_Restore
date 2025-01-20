@interface TabChangeDelegate
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (_TtC8AppStore17TabChangeDelegate)init;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
@end

@implementation TabChangeDelegate

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1003D955C(v6, (uint64_t)v7);

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1003D9C9C(v6);
}

- (_TtC8AppStore17TabChangeDelegate)init
{
  result = (_TtC8AppStore17TabChangeDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end