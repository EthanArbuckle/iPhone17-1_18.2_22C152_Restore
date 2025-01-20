@interface FullScreenMultiPinMapView
- (_TtC7Journal25FullScreenMultiPinMapView)initWithCoder:(id)a3;
- (_TtC7Journal25FullScreenMultiPinMapView)initWithFrame:(CGRect)a3;
- (void)textFieldDidChange:(id)a3;
@end

@implementation FullScreenMultiPinMapView

- (void)textFieldDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100346974(v4);
}

- (_TtC7Journal25FullScreenMultiPinMapView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal25FullScreenMultiPinMapView *)sub_100347AF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal25FullScreenMultiPinMapView)initWithCoder:(id)a3
{
  return (_TtC7Journal25FullScreenMultiPinMapView *)sub_100347D5C(a3);
}

- (void).cxx_destruct
{
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal25FullScreenMultiPinMapView_multiPinMapDelegate);
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal25FullScreenMultiPinMapView_fullScreenAssetViewDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25FullScreenMultiPinMapView_multiPinMapAsset));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25FullScreenMultiPinMapView_cardView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25FullScreenMultiPinMapView_shadowView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25FullScreenMultiPinMapView_captionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25FullScreenMultiPinMapView_placeAddressLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25FullScreenMultiPinMapView_placeInfoLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25FullScreenMultiPinMapView_placeNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25FullScreenMultiPinMapView_editButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25FullScreenMultiPinMapView_blurEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25FullScreenMultiPinMapView_currentSelectedAnnotation));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal25FullScreenMultiPinMapView_saveAction);
}

@end