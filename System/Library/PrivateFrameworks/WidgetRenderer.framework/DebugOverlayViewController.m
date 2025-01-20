@interface DebugOverlayViewController
- (BOOL)_canShowWhileLocked;
- (_TtC14WidgetRenderer26DebugOverlayViewController)init;
- (_TtC14WidgetRenderer26DebugOverlayViewController)initWithCoder:(id)a3;
- (_TtC14WidgetRenderer26DebugOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_didExitAlwaysOn;
- (void)_willEnterAlwaysOn;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DebugOverlayViewController

- (_TtC14WidgetRenderer26DebugOverlayViewController)init
{
  return (_TtC14WidgetRenderer26DebugOverlayViewController *)sub_2618D2E20();
}

- (_TtC14WidgetRenderer26DebugOverlayViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_validationState) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_debugText);
  void *v4 = 0;
  v4[1] = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_animationsPaused) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_isSnapshotting) = 0;
  id v5 = a3;

  result = (_TtC14WidgetRenderer26DebugOverlayViewController *)sub_2618FBA30();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3 = self;
  id v4 = [(DebugOverlayViewController *)v3 view];
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v4, sel_setNeedsLayout);
  }
  else
  {
    __break(1u);
  }
}

- (void)loadView
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_willEnterAlwaysOn
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_debugView);
  v2[OBJC_IVAR____TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView_inAlwaysOnDisplay] = 1;
  objc_msgSend(v2, sel_setNeedsLayout);
}

- (void)_didExitAlwaysOn
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_debugView);
  v2[OBJC_IVAR____TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView_inAlwaysOnDisplay] = 0;
  objc_msgSend(v2, sel_setNeedsLayout);
}

- (_TtC14WidgetRenderer26DebugOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC14WidgetRenderer26DebugOverlayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_debugView));

  swift_bridgeObjectRelease();
}

@end