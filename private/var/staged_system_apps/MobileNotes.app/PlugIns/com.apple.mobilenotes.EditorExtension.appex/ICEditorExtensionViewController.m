@interface ICEditorExtensionViewController
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (ICEditorExtensionViewController)initWithCoder:(id)a3;
- (ICEditorExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)addUserActivityData:(id)a3;
- (void)checkInWithReply:(id)a3;
- (void)dealloc;
- (void)motionBegan:(int64_t)a3 withEvent:(id)a4;
- (void)motionCancelled:(int64_t)a3 withEvent:(id)a4;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)noteEditorRequestsDismissal:(id)a3 cancelled:(BOOL)a4;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ICEditorExtensionViewController

- (ICEditorExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10000D1D0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (ICEditorExtensionViewController *)sub_100003D60(v5, v7, a4);
}

- (ICEditorExtensionViewController)initWithCoder:(id)a3
{
  return (ICEditorExtensionViewController *)sub_100003F4C(a3);
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICEditorExtensionViewController_analyticsController);
  v3 = self;
  [v2 appSessionDidTerminate];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for EditorExtensionViewController();
  [(ICEditorExtensionViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICEditorExtensionViewController_analyticsController));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100004224();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100005524();
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_1000057BC(a3);
}

- (void)motionBegan:(int64_t)a3 withEvent:(id)a4
{
  id v5 = a4;
  uint64_t v6 = self;
  sub_10000BB44();
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v5 = a4;
  uint64_t v6 = self;
  sub_10000BC10();
}

- (void)motionCancelled:(int64_t)a3 withEvent:(id)a4
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator) = 0;
  _objc_release_x1();
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICEditorExtensionViewController_noteEditor);
  if (v3)
  {
    objc_super v4 = self;
    id v5 = (ICEditorExtensionViewController *)a3;
    uint64_t v6 = v4;
    uint64_t v7 = (ICEditorExtensionViewController *)[v3 note];
    if (v7)
    {
      id v8 = v7;
      unsigned __int8 v9 = [(ICEditorExtensionViewController *)v7 isEmpty];

      id v5 = v6;
      uint64_t v6 = v8;
    }
    else
    {
      unsigned __int8 v9 = 1;
    }

    LOBYTE(self) = v9;
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  objc_super v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICEditorExtensionViewController_noteEditor);
  if (v4) {
    [v4 cancelFromSystemPaperCard:self];
  }
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100009B00(v4);

  return 1;
}

- (void)checkInWithReply:(id)a3
{
  id v4 = _Block_copy(a3);
  id v5 = (void (*)(void *))v4[2];
  uint64_t v6 = self;
  v5(v4);
  _Block_release(v4);
}

- (void)addUserActivityData:(id)a3
{
  id v4 = a3;
  id v8 = self;
  uint64_t v5 = sub_10000D0D0();
  unint64_t v7 = v6;

  sub_10000A524(v5, v7);
  sub_10000C330(v5, v7);
}

- (void)noteEditorRequestsDismissal:(id)a3 cancelled:(BOOL)a4
{
  id v6 = a3;
  unint64_t v7 = self;
  sub_10000C23C(a4);
}

@end