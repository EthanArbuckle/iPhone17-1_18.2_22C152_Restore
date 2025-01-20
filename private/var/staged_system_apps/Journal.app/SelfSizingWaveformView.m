@interface SelfSizingWaveformView
- (_TtC7Journal22SelfSizingWaveformView)initWithCoder:(id)a3;
- (_TtC7Journal22SelfSizingWaveformView)initWithFrame:(CGRect)a3;
@end

@implementation SelfSizingWaveformView

- (_TtC7Journal22SelfSizingWaveformView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7Journal22SelfSizingWaveformView_waveformContainerView);
  v9 = (objc_class *)type metadata accessor for SelfSizingWaveformView();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[SelfSizingWaveformView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC7Journal22SelfSizingWaveformView)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7Journal22SelfSizingWaveformView_waveformContainerView);
  v6 = (objc_class *)type metadata accessor for SelfSizingWaveformView();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(SelfSizingWaveformView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal22SelfSizingWaveformView_waveformContainerView));
}

@end