@interface SearchNoContentView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI19SearchNoContentView)initWithCoder:(id)a3;
- (_TtC8VideosUI19SearchNoContentView)initWithFrame:(CGRect)a3;
@end

@implementation SearchNoContentView

- (_TtC8VideosUI19SearchNoContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI19SearchNoContentView *)sub_1E35E0810();
}

- (_TtC8VideosUI19SearchNoContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E35E1004();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E35E1BDC(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19SearchNoContentView_queryDescriptionBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19SearchNoContentView_searchQueryDescriptionBannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19SearchNoContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19SearchNoContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19SearchNoContentView_messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19SearchNoContentView_attributionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19SearchNoContentView_debugLabel));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end