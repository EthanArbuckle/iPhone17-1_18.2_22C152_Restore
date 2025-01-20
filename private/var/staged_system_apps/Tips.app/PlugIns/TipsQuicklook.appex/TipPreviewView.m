@interface TipPreviewView
- (_TtC13TipsQuicklook14TipPreviewView)initWithCoder:(id)a3;
- (_TtC13TipsQuicklook14TipPreviewView)initWithFrame:(CGRect)a3;
@end

@implementation TipPreviewView

- (_TtC13TipsQuicklook14TipPreviewView)initWithFrame:(CGRect)a3
{
  return (_TtC13TipsQuicklook14TipPreviewView *)TipPreviewView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13TipsQuicklook14TipPreviewView)initWithCoder:(id)a3
{
  return (_TtC13TipsQuicklook14TipPreviewView *)TipPreviewView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler);

  sub_100003B14(v3);
}

@end