@interface AmbientMatchUIView
- (CGSize)intrinsicContentSize;
- (_TtC11ShazamKitUI18AmbientMatchUIView)initWithCoder:(id)a3;
- (_TtC11ShazamKitUI18AmbientMatchUIView)initWithFrame:(CGRect)a3;
@end

@implementation AmbientMatchUIView

- (_TtC11ShazamKitUI18AmbientMatchUIView)initWithFrame:(CGRect)a3
{
  sub_236CF5580(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC11ShazamKitUI18AmbientMatchUIView)initWithCoder:(id)a3
{
  sub_236CF6E10(a3);
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(AmbientMatchUIView *)v2 superview];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
    double v6 = 0.0;
  }
  id v9 = sub_236CF5404();
  objc_msgSend(v9, sel_setConstant_, v8 + -98.0);

  double v10 = v6;
  double v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamLogoImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_trackDetailsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_appleMusicButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_placeholderArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtImageViewCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtContainerViewHeightConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___placeholderViewCenterYConstraint);
}

@end