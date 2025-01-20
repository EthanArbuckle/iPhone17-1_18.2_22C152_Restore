@interface VideoControlBackdrop
- (_TtC23ShelfKitCollectionViews20VideoControlBackdrop)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews20VideoControlBackdrop)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VideoControlBackdrop

- (_TtC23ShelfKitCollectionViews20VideoControlBackdrop)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews20VideoControlBackdrop *)sub_CE47C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews20VideoControlBackdrop)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews20VideoControlBackdrop_primaryBackgroundView) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews20VideoControlBackdrop *)sub_385890();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_CE618();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20VideoControlBackdrop_primaryBackgroundView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews20VideoControlBackdrop_contentView);
}

@end