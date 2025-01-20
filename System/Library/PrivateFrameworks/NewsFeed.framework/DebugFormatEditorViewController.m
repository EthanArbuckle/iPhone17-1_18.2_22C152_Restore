@interface DebugFormatEditorViewController
- (_TtC8NewsFeed31DebugFormatEditorViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed31DebugFormatEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)doAccessibilityWithSender:(id)a3;
- (void)doBreakpointNext;
- (void)doBreakpointStepIn;
- (void)doBreakpointStepOut;
- (void)doBreakpointStepOver;
- (void)doDevicesWithSender:(id)a3;
- (void)doInterfaceLayoutDirection;
- (void)doLightDarkMode;
- (void)doOptions;
- (void)doReload;
- (void)doResetZoom;
- (void)doRotateDevice;
- (void)doSnapshotWithSender:(id)a3;
- (void)doStartStopDebugger;
- (void)doToggleConsoleDisplay;
- (void)doToggleSidebar;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatEditorViewController

- (_TtC8NewsFeed31DebugFormatEditorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0C799F0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0C68324();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1C0C6DDEC(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1C0C6DF64();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1C0C6E9C8();
}

- (void)viewLayoutMarginsDidChange
{
  v2 = self;
  sub_1C0C702B0();
}

- (_TtC8NewsFeed31DebugFormatEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed31DebugFormatEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_delegate);
  swift_release();
  swift_release();
  memcpy(v3, (char *)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_packages, sizeof(v3));
  sub_1C09C51F8((uint64_t)v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_canvasViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_rulerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_snapshotCanvasView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___zoomBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___rotateDeviceCanvasBarButtonItem));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___editorPathView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___debuggerRunBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___debuggerNextBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___debuggerStepInBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___debuggerStepOverBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___debuggerStepOutBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___snapshotBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___sourceMetricsBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_sourceViewController));
}

- (void)doToggleSidebar
{
  v2 = self;
  sub_1C0C757E4();
}

- (void)doLightDarkMode
{
  v2 = self;
  sub_1C0C75998();
}

- (void)doInterfaceLayoutDirection
{
  v2 = self;
  sub_1C0C75A7C();
}

- (void)doDevicesWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C0C75B60((uint64_t)v4);
}

- (void)doAccessibilityWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C0C75D60((uint64_t)v4);
}

- (void)doOptions
{
  v2 = self;
  sub_1C0C72860();
}

- (void)doResetZoom
{
  swift_getObjectType();
  id v3 = self;
  sub_1C151932C();
  sub_1BFC39268(0, (unint64_t *)&qword_1EB87A1B0);
  id v4 = (void *)sub_1C151F56C();
  sub_1C151901C();

  swift_release();
  swift_release();
}

- (void)doReload
{
  swift_getObjectType();
  id v3 = self;
  sub_1C151932C();
  sub_1BFC39268(0, (unint64_t *)&qword_1EB87A1B0);
  id v4 = (void *)sub_1C151F56C();
  sub_1C151901C();

  swift_release();
  swift_release();
}

- (void)doSnapshotWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C0C76234(v4);
}

- (void)doToggleConsoleDisplay
{
  v2 = self;
  sub_1C0C76508();
}

- (void)doRotateDevice
{
  v2 = self;
  sub_1C0C76614();
}

- (void)doStartStopDebugger
{
  v2 = self;
  sub_1C0C76758();
}

- (void)doBreakpointNext
{
  v2 = self;
  sub_1C0C76A70(0);
}

- (void)doBreakpointStepOver
{
  v2 = self;
  sub_1C0C76C80((void (*)(uint64_t))sub_1C10172E4);
}

- (void)doBreakpointStepIn
{
  v2 = self;
  sub_1C0C76A70(1);
}

- (void)doBreakpointStepOut
{
  v2 = self;
  sub_1C0C76C80((void (*)(uint64_t))sub_1C10172EC);
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_contentView));
}

- (void)scrollViewDidZoom:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C0C78C38(v4);
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_1C0C7B430(v8, a5);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C0C78150(v4);
}

@end