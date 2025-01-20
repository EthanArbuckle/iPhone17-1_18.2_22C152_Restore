@interface HIMetricsCollectionView
- (CGRect)frame;
- (_TtC5Music23HIMetricsCollectionView)initWithCoder:(id)a3;
- (_TtC5Music23HIMetricsCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)safeAreaInsetsDidChange;
- (void)setFrame:(CGRect)a3;
@end

@implementation HIMetricsCollectionView

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(HIMetricsCollectionView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v21.receiver = self;
  v21.super_class = ObjectType;
  v9 = self;
  [(HIMetricsCollectionView *)&v21 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v20.receiver = v9;
  v20.super_class = ObjectType;
  -[HIMetricsCollectionView setFrame:](&v20, "setFrame:", x, y, width, height);
  v22.origin.double x = v11;
  v22.origin.double y = v13;
  v22.size.double width = v15;
  v22.size.double height = v17;
  double v18 = CGRectGetWidth(v22);
  v19.receiver = v9;
  v19.super_class = ObjectType;
  [(HIMetricsCollectionView *)&v19 frame];
  if (v18 != CGRectGetWidth(v23)) {
    sub_10013D384();
  }
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(HIMetricsCollectionView *)&v3 safeAreaInsetsDidChange];
  sub_10013D384();
}

- (_TtC5Music23HIMetricsCollectionView)initWithCoder:(id)a3
{
  double v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Music23HIMetricsCollectionView_metricsDidUpdate);
  *double v4 = 0;
  v4[1] = 0;
  double v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Music23HIMetricsCollectionView____lazy_storage___artworkMetricsProvider);
  *double v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  CGRect result = (_TtC5Music23HIMetricsCollectionView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC5Music23HIMetricsCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4 = a4;
  CGRect result = (_TtC5Music23HIMetricsCollectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music23HIMetricsCollectionView_metricsDidUpdate));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC5Music23HIMetricsCollectionView____lazy_storage___artworkMetricsProvider);

  sub_10006ADFC(v3);
}

@end