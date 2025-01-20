@interface BundleSearchResultCollectionViewCell
- (_TtC8AppStore36BundleSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore36BundleSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BundleSearchResultCollectionViewCell

- (_TtC8AppStore36BundleSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36BundleSearchResultCollectionViewCell *)sub_10049708C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36BundleSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore36BundleSearchResultCollectionViewCell_lockupView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v8 = OBJC_IVAR____TtC8AppStore36BundleSearchResultCollectionViewCell_bundleView;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)type metadata accessor for BundleView()) initWithFrame:0.0, 0.0, 0.0, 0.0];

  result = (_TtC8AppStore36BundleSearchResultCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BundleSearchResultCollectionViewCell();
  id v2 = v6.receiver;
  id v3 = [(BundleSearchResultCollectionViewCell *)&v6 prepareForReuse];
  sub_100122EC8((uint64_t)v3, v4, v5);
  sub_10027B4BC();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_1004973A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36BundleSearchResultCollectionViewCell_lockupView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore36BundleSearchResultCollectionViewCell_bundleView);
}

@end