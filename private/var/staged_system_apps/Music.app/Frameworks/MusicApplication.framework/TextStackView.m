@interface TextStackView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplication13TextStackView)initWithCoder:(id)a3;
- (_TtC16MusicApplication13TextStackView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TextStackView

- (void)layoutSubviews
{
  v2 = self;
  TextStackView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  id v6 = [(TextStackView *)v5 traitCollection];
  [v6 displayScale];
  double v8 = v7;

  if (height <= 5.99231045e307) {
    double v9 = height;
  }
  else {
    double v9 = 5.99231045e307;
  }
  sub_3171F8(v12, 0.0, 0.0, width, v9, v8);
  sub_45308((uint64_t)v12);

  double v10 = *(double *)&v12[3];
  double v11 = *(double *)&v12[4];
  result.double height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  v9.is_nil = (char)v6;
  double v7 = v6;
  v9.value.super.isa = (Class)a3;
  TextStackView.traitCollectionDidChange(_:)(v9);
}

- (_TtC16MusicApplication13TextStackView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13TextStackView *)TextStackView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication13TextStackView)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC16MusicApplication13TextStackView *)sub_323AB8((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextStackView_textShadow));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

@end