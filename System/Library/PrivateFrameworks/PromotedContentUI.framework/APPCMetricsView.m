@interface APPCMetricsView
- (APPCDiagnosticMetricsHelping)diagnosticMetricHelper;
- (APPCMetricsInteractionPresentationDelegate)interactionPresentationDelegate;
- (APPCMetricsView)initWithCoder:(id)a3;
- (APPCMetricsView)initWithFrame:(CGRect)a3;
- (APPCMetricsViewReadyDelegate)readyDelegate;
- (APPCPromotedContentInfo)promotedContentInfo;
- (APPrivacyMarker)privacyMarkerView;
- (BOOL)ready;
- (BOOL)safeCollapseAndReturnError:(id *)a3;
- (BOOL)safeExpandAndReturnError:(id *)a3;
- (CGRect)frame;
- (CGRect)privacyMarkerFrame;
- (UIEdgeInsets)metricsViewEdgeInsets;
- (void)appBackgrounded:(id)a3;
- (void)appForegrounded:(id)a3;
- (void)appWillResignActive:(id)a3;
- (void)applicationWillTerminate;
- (void)collapse;
- (void)dealloc;
- (void)didBecomeVisible;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)expand;
- (void)registerHandlerForAllMetricsWithClosure:(id)a3;
- (void)removeHandler;
- (void)setFrame:(CGRect)a3;
- (void)setInteractionPresentationDelegate:(id)a3;
- (void)setPromotedContentInfo:(id)a3;
- (void)setReady:(BOOL)a3;
- (void)setReadyDelegate:(id)a3;
- (void)unloadAdViewIfRequired;
- (void)willEnterforeground;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation APPCMetricsView

- (void)unloadAdViewIfRequired
{
  v2 = self;
  sub_1B5D0B094();
}

- (void)willEnterforeground
{
  v2 = self;
  sub_1B5D0B370();
}

- (void)appWillResignActive:(id)a3
{
}

- (void)appBackgrounded:(id)a3
{
}

- (void)appForegrounded:(id)a3
{
}

- (void)applicationWillTerminate
{
  v2 = self;
  sub_1B5D0BA88();
}

- (APPCMetricsInteractionPresentationDelegate)interactionPresentationDelegate
{
  return (APPCMetricsInteractionPresentationDelegate *)sub_1B5D16C34((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCMetricsView_interactionPresentationDelegate);
}

- (void)setInteractionPresentationDelegate:(id)a3
{
  v4 = (char *)self + OBJC_IVAR___APPCMetricsView_interactionPresentationDelegate;
  swift_beginAccess();
  uint64_t v5 = swift_unknownObjectWeakAssign();
  uint64_t v6 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0x408))(v5);
  if (v6)
  {
    v7 = (void *)v6;
    MEMORY[0x1BA9AC660](v4);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

- (BOOL)ready
{
  v2 = (BOOL *)self + OBJC_IVAR___APPCMetricsView_ready;
  swift_beginAccess();
  return *v2;
}

- (void)setReady:(BOOL)a3
{
  uint64_t v5 = (BOOL *)self + OBJC_IVAR___APPCMetricsView_ready;
  swift_beginAccess();
  *uint64_t v5 = a3;
  uint64_t v6 = self;
  sub_1B5D1665C();
}

- (APPrivacyMarker)privacyMarkerView
{
  uint64_t v2 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0x408))();
  if (v2)
  {
    v3 = (void *)v2;
    id v4 = *(id *)(v2 + OBJC_IVAR___APPCPromotedContentView_privacyMarkerView);
  }
  else
  {
    id v4 = 0;
  }
  return (APPrivacyMarker *)v4;
}

- (CGRect)privacyMarkerFrame
{
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0x408))();
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = *(void **)(v3 + OBJC_IVAR___APPCPromotedContentView_privacyMarkerView);
    uint64_t v6 = self;
    id v7 = v5;

    objc_msgSend(v7, sel_frame);
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v13 = 0.0;
    double v15 = 0.0;
    double v9 = 0.0;
    double v11 = 0.0;
  }
  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (APPCMetricsViewReadyDelegate)readyDelegate
{
  return (APPCMetricsViewReadyDelegate *)sub_1B5D16C34((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCMetricsView_readyDelegate);
}

- (void)setReadyDelegate:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1B5D1F158();

  swift_unknownObjectRelease();
}

- (APPCDiagnosticMetricsHelping)diagnosticMetricHelper
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___APPCMetricsView_promotedContent), sel_diagnosticMetricHelper);
  return (APPCDiagnosticMetricsHelping *)v2;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MetricsView();
  [(APPCMetricsView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MetricsView();
  id v7 = v10.receiver;
  -[APPCMetricsView setFrame:](&v10, sel_setFrame_, x, y, width, height);
  sub_1B5D02FF0();
  id v8 = objc_msgSend(v7, sel_superview, v10.receiver, v10.super_class);

  if (v8 || (id v9 = objc_msgSend(v7, sel_window), v9, v9)) {
    sub_1B5D15630(0, 0);
  }
}

- (APPCPromotedContentInfo)promotedContentInfo
{
  double v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___APPCMetricsView_promotedContentInfo);
  swift_beginAccess();
  return (APPCPromotedContentInfo *)*v2;
}

- (void)setPromotedContentInfo:(id)a3
{
  double v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___APPCMetricsView_promotedContentInfo);
  swift_beginAccess();
  double v5 = *v4;
  APPCMetricsView *v4 = a3;
  id v6 = a3;
}

- (UIEdgeInsets)metricsViewEdgeInsets
{
  double v3 = (void *)MEMORY[0x1E4FBC8C8];
  double v4 = (APPCMetricsView *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0x408))();
  if (v4)
  {
    double v5 = v4;
    id v6 = *(double (**)(void))((*v3 & (uint64_t)v4->super.super.super.isa) + 0x270);
    id v7 = self;
    double v8 = v6();
    double v10 = v9;
    uint64_t v12 = v11;
    double v14 = v13;
  }
  else
  {
    uint64_t v15 = qword_1EB848928;
    double v5 = self;
    if (v15 != -1) {
      swift_once();
    }
    double v10 = *((double *)&xmmword_1EB84B9F0 + 1);
    double v8 = *(double *)&xmmword_1EB84B9F0;
    uint64_t v12 = qword_1EB84BA00;
    double v14 = unk_1EB84BA08;
  }

  double v16 = v8;
  double v17 = v10;
  double v18 = *(double *)&v12;
  double v19 = v14;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (APPCMetricsView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s17PromotedContentUI11MetricsViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  double v2 = self;
  MetricsView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectWeakDestroy();
  sub_1B5CF6804((uint64_t)self + OBJC_IVAR___APPCMetricsView_interactionPresentationDelegate);
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B5CF6804((uint64_t)self + OBJC_IVAR___APPCMetricsView_readyDelegate);
  swift_bridgeObjectRelease();
}

- (void)expand
{
  double v2 = self;
  sub_1B5D17CCC();
}

- (BOOL)safeExpandAndReturnError:(id *)a3
{
  id v3 = self;
  sub_1B5D17CCC();

  return 1;
}

- (BOOL)safeCollapseAndReturnError:(id *)a3
{
  return 1;
}

- (void)willMoveToSuperview:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1B5D1876C(a3);
}

- (void)didMoveToSuperview
{
  double v2 = self;
  sub_1B5D18E54("MetricsView super view changed, the superview is %{private}s. PC Identifier: %{private}s", (SEL *)&selRef_didMoveToSuperview, (SEL *)&selRef_superview);
}

- (void)didMoveToWindow
{
  double v2 = self;
  sub_1B5D18E54("MetricsView is being moved to a new window, the superview is %{private}s. PC Identifier: %{private}s", (SEL *)&selRef_didMoveToWindow, (SEL *)&selRef_window);
}

- (void)didBecomeVisible
{
  double v2 = self;
  sub_1B5D1A5DC();
}

- (APPCMetricsView)initWithFrame:(CGRect)a3
{
  UIEdgeInsets result = (APPCMetricsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)registerHandlerForAllMetricsWithClosure:(id)a3
{
  double v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  MetricsView.registerHandlerForAllMetrics(closure:)((uint64_t)sub_1B5D1FD58, v5);

  swift_release();
}

- (void)removeHandler
{
  double v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___APPCMetricsView_promotedContent);
  id v3 = self;
  id v4 = objc_msgSend(v2, sel_metricsHelper);
  uint64_t v5 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (v5) {
    objc_msgSend(v5, sel_removeHandler);
  }

  swift_unknownObjectRelease();
}

- (void)collapse
{
  double v2 = self;
  MetricsView.collapse()();
}

@end