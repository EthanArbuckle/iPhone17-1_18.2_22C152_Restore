@interface BundleSearchResultContentView
- (_TtC8AppStore29BundleSearchResultContentView)initWithCoder:(id)a3;
- (_TtC8AppStore29BundleSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BundleSearchResultContentView

- (_TtC8AppStore29BundleSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29BundleSearchResultContentView *)sub_1003094DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29BundleSearchResultContentView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore29BundleSearchResultContentView_lockupView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v8 = OBJC_IVAR____TtC8AppStore29BundleSearchResultContentView_bundleView;
  [objc_allocWithZone((Class)type metadata accessor for BundleView()) initWithFrame:0.0, 0.0, 0.0, 0.0];

  result = (_TtC8AppStore29BundleSearchResultContentView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10030973C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29BundleSearchResultContentView_lockupView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore29BundleSearchResultContentView_bundleView);
}

@end