@interface ThirdPartyMediaColorEffectView
- (_TtC7Journal30ThirdPartyMediaColorEffectView)initWithCoder:(id)a3;
- (_TtC7Journal30ThirdPartyMediaColorEffectView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ThirdPartyMediaColorEffectView

- (_TtC7Journal30ThirdPartyMediaColorEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal30ThirdPartyMediaColorEffectView *)sub_100087A04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal30ThirdPartyMediaColorEffectView)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100088430();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30ThirdPartyMediaColorEffectView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30ThirdPartyMediaColorEffectView_fillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30ThirdPartyMediaColorEffectView_overlayView));
  v3 = (char *)self + OBJC_IVAR____TtC7Journal30ThirdPartyMediaColorEffectView__fillColor;
  uint64_t v4 = sub_100010218(&qword_1007FBC08);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC7Journal30ThirdPartyMediaColorEffectView__colorVariant;
  uint64_t v6 = sub_100010218(&qword_1007FBC00);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end