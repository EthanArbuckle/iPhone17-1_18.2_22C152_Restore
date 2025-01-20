@interface ShelfBackgroundFillView
- (_TtC23ShelfKitCollectionViews23ShelfBackgroundFillView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews23ShelfBackgroundFillView)initWithFrame:(CGRect)a3;
@end

@implementation ShelfBackgroundFillView

- (_TtC23ShelfKitCollectionViews23ShelfBackgroundFillView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradientView) = 0;
  v7 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient);
  _OWORD *v7 = 0u;
  v7[1] = 0u;
  v7[2] = 0u;
  v7[3] = 0u;
  v8 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_background;
  *(_DWORD *)v8 = 0;
  *((_WORD *)v8 + 2) = 256;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ShelfBackgroundFillView();
  return -[ShelfBackgroundFillView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews23ShelfBackgroundFillView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradientView) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_background;
  *(_DWORD *)v5 = 0;
  *((_WORD *)v5 + 2) = 256;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ShelfBackgroundFillView();
  return [(ShelfBackgroundFillView *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradientView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient);
  uint64_t v4 = *(void *)&self->gradientView[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient];
  uint64_t v5 = *(void *)&self->gradient[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient];
  uint64_t v6 = *(void *)&self->gradient[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient + 8];
  uint64_t v7 = *(void *)&self->gradient[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient + 16];
  uint64_t v8 = *(void *)&self->gradient[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient + 24];
  uint64_t v9 = *(void *)&self->gradient[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient + 32];
  objc_super v10 = *(void **)&self->gradient[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient + 40];

  sub_EB49C(v3, v4, v5, v6, v7, v8, v9, v10);
}

@end