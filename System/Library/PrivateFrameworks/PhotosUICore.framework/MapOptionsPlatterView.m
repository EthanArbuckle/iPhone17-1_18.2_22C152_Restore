@interface MapOptionsPlatterView
- (_TtC12PhotosUICore21MapOptionsPlatterView)initWithCoder:(id)a3;
- (_TtC12PhotosUICore21MapOptionsPlatterView)initWithFrame:(CGRect)a3;
@end

@implementation MapOptionsPlatterView

- (_TtC12PhotosUICore21MapOptionsPlatterView)initWithFrame:(CGRect)a3
{
  return (_TtC12PhotosUICore21MapOptionsPlatterView *)MapOptionsPlatterView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12PhotosUICore21MapOptionsPlatterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AA23E820();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore21MapOptionsPlatterView_blurredBackgroundView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore21MapOptionsPlatterView_shadowView);
}

@end