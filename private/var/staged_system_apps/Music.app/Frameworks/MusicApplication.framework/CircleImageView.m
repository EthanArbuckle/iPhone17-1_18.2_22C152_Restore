@interface CircleImageView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplication15CircleImageView)initWithCoder:(id)a3;
- (_TtC16MusicApplication15CircleImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CircleImageView

- (_TtC16MusicApplication15CircleImageView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication15CircleImageView *)CircleImageView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication15CircleImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16MusicApplication15CircleImageViewC5coderACSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  v2 = self;
  CircleImageView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = CircleImageView.sizeThatFits(_:)(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15CircleImageView_ownerArtworkCatalog));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15CircleImageView_artworkContainerView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15CircleImageView_textStackView));

  swift_release();
}

@end