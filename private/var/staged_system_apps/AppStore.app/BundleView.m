@interface BundleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore10BundleView)initWithCoder:(id)a3;
- (_TtC8AppStore10BundleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BundleView

- (_TtC8AppStore10BundleView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore10BundleView *)sub_10027BA60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore10BundleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10027CEE4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10027C000();
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BundleView();
  id v4 = a3;
  v5 = (char *)v9.receiver;
  [(BundleView *)&v9 traitCollectionDidChange:v4];
  v6 = *(void **)&v5[OBJC_IVAR____TtC8AppStore10BundleView_titleLabel];
  id v7 = [v5 traitCollection];
  char v8 = UITraitCollection.prefersAccessibilityLayouts.getter();

  [v6 setNumberOfLines:(v8 & 1) == 0];
  [v5 setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = type metadata accessor for Artwork.Style();
  uint64_t v6 = *(void *)(v5 - 8);
  __n128 v7 = __chkstk_darwin(v5);
  objc_super v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t, __n128))(v6 + 16))(v9, (char *)self + OBJC_IVAR____TtC8AppStore10BundleView_iconStyle, v5, v7);
  v10 = self;
  double v11 = sub_10027C89C((uint64_t)v9, v10);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  double v12 = width;
  double v13 = v11;
  result.height = v13;
  result.CGFloat width = v12;
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore10BundleView_iconStyle;
  uint64_t v4 = type metadata accessor for Artwork.Style();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = (char *)self + OBJC_IVAR____TtC8AppStore10BundleView_itemReusePool;
  uint64_t v6 = sub_100082C28(&qword_10098BB98);
  __n128 v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end