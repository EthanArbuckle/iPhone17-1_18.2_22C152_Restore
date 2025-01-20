@interface UberBackgroundView
- (_TtC23ShelfKitCollectionViews18UberBackgroundView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews18UberBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation UberBackgroundView

- (_TtC23ShelfKitCollectionViews18UberBackgroundView)initWithFrame:(CGRect)a3
{
  return -[UberBackgroundView initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(UberBackgroundView *)&v3 layoutSubviews];
  [v2 bringSubviewToFront:*(void *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_gradientOverlayView]];
  [v2 bringSubviewToFront:*(void *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_navGradientView]];
}

- (_TtC23ShelfKitCollectionViews18UberBackgroundView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_backgroundImageView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_offset) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_zoomFactor) = (Class)0x3FF0000000000000;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews18UberBackgroundView *)sub_385890();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_gradientOverlayView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_navGradientView);
}

@end