@interface UpsellShowGridView
- (_TtC23ShelfKitCollectionViews18UpsellShowGridView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews18UpsellShowGridView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation UpsellShowGridView

- (_TtC23ShelfKitCollectionViews18UpsellShowGridView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C3718();
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v2 = v7.receiver;
  [(UpsellShowGridView *)&v7 layoutSubviews];
  [v2 bounds];
  CGRectGetWidth(v8);
  char v3 = sub_37BF00();
  sub_1C0C38();
  *((unsigned char *)v2 + OBJC_IVAR____TtC23ShelfKitCollectionViews18UpsellShowGridView____lazy_storage___sizeClass) = v3;
  sub_37BF30();
  double v5 = v4;
  sub_37BF30();
  if (v5 != v6) {
    sub_1C0C84();
  }
}

- (_TtC23ShelfKitCollectionViews18UpsellShowGridView)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews18UpsellShowGridView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18UpsellShowGridView_upsellInformation));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18UpsellShowGridView_horizontalStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18UpsellShowGridView____lazy_storage___gradientView));
  char v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews18UpsellShowGridView____lazy_storage___hStackHeightConstraint);
}

@end