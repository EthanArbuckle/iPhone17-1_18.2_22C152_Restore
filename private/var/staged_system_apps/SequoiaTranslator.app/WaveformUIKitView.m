@interface WaveformUIKitView
- (_TtC17SequoiaTranslator17WaveformUIKitView)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator17WaveformUIKitView)initWithFrame:(CGRect)a3;
- (void)_updateParticles;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation WaveformUIKitView

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WaveformUIKitView();
  id v2 = v3.receiver;
  [(WaveformUIKitView *)&v3 didMoveToWindow];
  sub_10023E7CC();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_10023DDDC();
}

- (void)_updateParticles
{
  id v2 = self;
  sub_10023E948();
}

- (_TtC17SequoiaTranslator17WaveformUIKitView)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator17WaveformUIKitView *)sub_10023EC68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator17WaveformUIKitView)initWithCoder:(id)a3
{
  return (_TtC17SequoiaTranslator17WaveformUIKitView *)sub_10023ED84(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_packageContainerLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_package));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_packageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_particlesLayer));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_displayLink);
}

@end