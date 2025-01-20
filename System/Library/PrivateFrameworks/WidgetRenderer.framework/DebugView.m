@interface DebugView
- (_TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView)init;
- (_TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView)initWithCoder:(id)a3;
- (void)layoutSubviews;
@end

@implementation DebugView

- (void)layoutSubviews
{
  v2 = self;
  sub_2618D3130();
}

- (_TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView)init
{
  return (_TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView *)sub_2618D3DD4();
}

- (_TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView)initWithCoder:(id)a3
{
  return (_TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView *)sub_2618D3EAC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView_debugTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView_animationsPausedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView_isSnapshottingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView_inAlwaysOnDisplayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView_validationView));

  swift_bridgeObjectRelease();
}

@end