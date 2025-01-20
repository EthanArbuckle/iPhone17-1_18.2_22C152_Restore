@interface ShadowView
- (_TtC23ShelfKitCollectionViews10ShadowView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews10ShadowView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ShadowView

- (void)layoutSubviews
{
  v2 = self;
  sub_100D98();
}

- (_TtC23ShelfKitCollectionViews10ShadowView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_cornerRadius) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_cornerStyle) = 1;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_shadow);
  v9 = (objc_class *)type metadata accessor for ShadowView();
  _OWORD *v8 = 0u;
  v8[1] = 0u;
  v11.receiver = self;
  v11.super_class = v9;
  return -[ShadowView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews10ShadowView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_cornerRadius) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_cornerStyle) = 1;
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_shadow);
  v6 = (objc_class *)type metadata accessor for ShadowView();
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  v8.receiver = self;
  v8.super_class = v6;
  return [(ShadowView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_shadow));
}

@end