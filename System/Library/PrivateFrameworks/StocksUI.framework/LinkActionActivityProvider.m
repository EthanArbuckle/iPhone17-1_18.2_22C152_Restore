@interface LinkActionActivityProvider
- (_TtC8StocksUI26LinkActionActivityProvider)init;
- (id)activityGroupForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
- (id)previewActivityForAction:(id)a3;
@end

@implementation LinkActionActivityProvider

- (_TtC8StocksUI26LinkActionActivityProvider)init
{
  result = (_TtC8StocksUI26LinkActionActivityProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI26LinkActionActivityProvider_handler);
  swift_release();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8StocksUI26LinkActionActivityProvider_watchlistManager;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (id)activityGroupForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  swift_unknownObjectRetain();
  id v12 = a4;
  v13 = self;
  v14 = sub_20A8A286C((uint64_t)a3, a4, x, y, width, height);
  swift_unknownObjectRelease();

  return v14;
}

- (id)previewActivityForAction:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  id v5 = sub_20A8A76EC();
  swift_unknownObjectRelease();

  return v5;
}

@end