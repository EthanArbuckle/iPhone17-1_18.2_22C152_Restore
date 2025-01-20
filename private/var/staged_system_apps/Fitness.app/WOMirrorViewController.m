@interface WOMirrorViewController
- (WOMirrorViewController)initWithCoder:(id)a3;
- (WOMirrorViewController)initWithDataLinkMonitor:(id)a3;
- (WOMirrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)showNotification:(id)a3;
- (void)showTimeoutDialogWithDismissCompletion:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WOMirrorViewController

- (WOMirrorViewController)initWithDataLinkMonitor:(id)a3
{
  return (WOMirrorViewController *)sub_1004CA260(a3);
}

- (WOMirrorViewController)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR___WOMirrorViewController_idleTimerToken);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___WOMirrorViewController____lazy_storage___canHostMapView) = 2;
  id v5 = a3;

  result = (WOMirrorViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1004CA4BC();
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1004CA748(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1004CA958(a3);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v6 = (void (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)())sub_1004CD4BC;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_1004CABC0(a3, v6, v7);
  sub_10005E5F8((uint64_t)v6);
}

- (void)showNotification:(id)a3
{
  v4 = *(void **)((char *)a3 + OBJC_IVAR___WOWorkoutNotification_bridgedNotification);
  id v5 = a3;
  v6 = self;
  sub_1004CC160(v4);
}

- (void)showTimeoutDialogWithDismissCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1004CBC08((uint64_t)sub_1001A7D48, v5);

  swift_release();
}

- (WOMirrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (WOMirrorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR___WOMirrorViewController_idleTimerToken;

  sub_100074898((uint64_t)v3);
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return 2;
}

@end