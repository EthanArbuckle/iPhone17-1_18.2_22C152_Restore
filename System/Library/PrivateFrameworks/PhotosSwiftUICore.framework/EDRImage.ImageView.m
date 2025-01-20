@interface EDRImage.ImageView
- (_TtCV17PhotosSwiftUICore8EDRImage9ImageView)initWithCoder:(id)a3;
- (_TtCV17PhotosSwiftUICore8EDRImage9ImageView)initWithFrame:(CGRect)a3;
- (_TtCV17PhotosSwiftUICore8EDRImage9ImageView)initWithImage:(id)a3;
- (_TtCV17PhotosSwiftUICore8EDRImage9ImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)layoutSubviews;
@end

@implementation EDRImage.ImageView

- (void)layoutSubviews
{
  v2 = self;
  sub_259BC4DAC();
}

- (_TtCV17PhotosSwiftUICore8EDRImage9ImageView)initWithImage:(id)a3
{
  id v4 = a3;
  return (_TtCV17PhotosSwiftUICore8EDRImage9ImageView *)sub_259BC4E68(a3);
}

- (_TtCV17PhotosSwiftUICore8EDRImage9ImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  return (_TtCV17PhotosSwiftUICore8EDRImage9ImageView *)sub_259BC4F24(a3, a4);
}

- (_TtCV17PhotosSwiftUICore8EDRImage9ImageView)initWithFrame:(CGRect)a3
{
  return (_TtCV17PhotosSwiftUICore8EDRImage9ImageView *)sub_259BC5004(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV17PhotosSwiftUICore8EDRImage9ImageView)initWithCoder:(id)a3
{
  return (_TtCV17PhotosSwiftUICore8EDRImage9ImageView *)sub_259BC50C8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCV17PhotosSwiftUICore8EDRImage9ImageView_edrGainView));

  swift_bridgeObjectRelease();
}

@end