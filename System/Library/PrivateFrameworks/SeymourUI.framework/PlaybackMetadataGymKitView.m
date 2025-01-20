@interface PlaybackMetadataGymKitView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI26PlaybackMetadataGymKitView)initWithCoder:(id)a3;
- (_TtC9SeymourUI26PlaybackMetadataGymKitView)initWithFrame:(CGRect)a3;
- (id)viewForBaselineLayout;
- (void)layoutSubviews;
@end

@implementation PlaybackMetadataGymKitView

- (id)viewForBaselineLayout
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC9SeymourUI26PlaybackMetadataGymKitView_titleLabel));
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI26PlaybackMetadataGymKitView_imageView);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v5 = v4;
  v6 = *(Class *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI26PlaybackMetadataGymKitView_titleLabel);
  objc_msgSend(v6, sel_intrinsicContentSize);
  double v8 = v5 + v7;
  objc_msgSend(v6, sel_intrinsicContentSize);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtC9SeymourUI26PlaybackMetadataGymKitView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI26PlaybackMetadataGymKitView *)sub_23A1D8CF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI26PlaybackMetadataGymKitView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A1D99D8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A1D9414();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26PlaybackMetadataGymKitView_gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26PlaybackMetadataGymKitView_imageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26PlaybackMetadataGymKitView_titleLabel);
}

@end