@interface IconGridView
- (_TtC8AppStore12IconGridView)initWithCoder:(id)a3;
- (_TtC8AppStore12IconGridView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation IconGridView

- (_TtC8AppStore12IconGridView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006F54DC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006F48BC();
}

- (_TtC8AppStore12IconGridView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore12IconGridView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore12IconGridView_viewPool;
  uint64_t v4 = sub_100082C28(&qword_100988DE0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_release();
}

@end