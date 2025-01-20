@interface GradientView
+ (Class)layerClass;
- (_TtC23ShelfKitCollectionViews12GradientView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews12GradientView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation GradientView

+ (Class)layerClass
{
  sub_2E66C(0, &qword_476760);

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_129DEC((uint64_t)a3);
}

- (_TtC23ShelfKitCollectionViews12GradientView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews12GradientView_kind) = 0;
  v7 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews12GradientView_gradient);
  _OWORD *v7 = 0u;
  v7[1] = 0u;
  v7[2] = 0u;
  v7[3] = 0u;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews12GradientView_cornerRadius) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews12GradientView_cornerStyle) = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for GradientView();
  return -[GradientView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews12GradientView)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews12GradientView *)GradientView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews12GradientView_gradient;
  sub_EB49C(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews12GradientView_gradient), *((void *)v2 + 1), *((void *)v2 + 2), *((void *)v2 + 3), *((void *)v2 + 4), *((void *)v2 + 5), *((void *)v2 + 6), *((void **)v2 + 7));
}

@end