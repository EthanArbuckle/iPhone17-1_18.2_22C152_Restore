@interface UberBackgroundImageView
- (_TtC23ShelfKitCollectionViews23UberBackgroundImageView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews23UberBackgroundImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation UberBackgroundImageView

- (_TtC23ShelfKitCollectionViews23UberBackgroundImageView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews23UberBackgroundImageView *)sub_1ABC0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews23UberBackgroundImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AC29C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1ABE04();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23UberBackgroundImageView_backgroundImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews23UberBackgroundImageView_image);
}

@end