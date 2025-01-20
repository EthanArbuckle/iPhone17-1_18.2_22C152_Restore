@interface PopoverTipViewController
- (BOOL)messageViewController:(id)a3 shouldEnqueueMetricsForDialogResult:(id)a4;
- (_TtC8ShelfKit24PopoverTipViewController)initWithCoder:(id)a3;
- (_TtC8ShelfKit24PopoverTipViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8ShelfKit24PopoverTipViewController)initWithRequest:(id)a3;
- (_TtC8ShelfKit24PopoverTipViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PopoverTipViewController

- (_TtC8ShelfKit24PopoverTipViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s8ShelfKit24PopoverTipViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  PopoverTipViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  PopoverTipViewController.viewDidDisappear(_:)(a3);
}

- (_TtC8ShelfKit24PopoverTipViewController)initWithRequest:(id)a3
{
  id v3 = a3;
  result = (_TtC8ShelfKit24PopoverTipViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8ShelfKit24PopoverTipViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = a5;
  result = (_TtC8ShelfKit24PopoverTipViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8ShelfKit24PopoverTipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8ShelfKit24PopoverTipViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_250FC((uint64_t)&self->AMSUIBubbleTipViewController_opaque[OBJC_IVAR____TtC8ShelfKit24PopoverTipViewController_clickLocation], &qword_4AB730);
  sub_250FC((uint64_t)&self->AMSUIBubbleTipViewController_opaque[OBJC_IVAR____TtC8ShelfKit24PopoverTipViewController_impressionMetrics], (uint64_t *)&unk_4B9870);
  sub_3D4C4(*(void *)&self->AMSUIBubbleTipViewController_opaque[OBJC_IVAR____TtC8ShelfKit24PopoverTipViewController_onAppear]);
  uint64_t v3 = *(void *)&self->AMSUIBubbleTipViewController_opaque[OBJC_IVAR____TtC8ShelfKit24PopoverTipViewController_onDisappear];

  sub_3D4C4(v3);
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  PopoverTipViewController.messageViewController(_:didSelectActionWith:)(v6, v7);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_2CFC0C((uint64_t)a4);
}

- (BOOL)messageViewController:(id)a3 shouldEnqueueMetricsForDialogResult:(id)a4
{
  return 0;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

@end