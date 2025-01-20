@interface EnrollmentContainerViewController
- (BOOL)canBecomeFirstResponder;
- (_TtC8PaperKitP33_54D3ACA847AFA52EC5CA5D25834A254533EnrollmentContainerViewController)initWithCoder:(id)a3;
- (_TtC8PaperKitP33_54D3ACA847AFA52EC5CA5D25834A254533EnrollmentContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)toolPickerWillShow:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation EnrollmentContainerViewController

- (_TtC8PaperKitP33_54D3ACA847AFA52EC5CA5D25834A254533EnrollmentContainerViewController)initWithCoder:(id)a3
{
  result = (_TtC8PaperKitP33_54D3ACA847AFA52EC5CA5D25834A254533EnrollmentContainerViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  EnrollmentContainerViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  EnrollmentContainerViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  EnrollmentContainerViewController.viewDidDisappear(_:)(a3);
}

- (void)toolPickerWillShow:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  EnrollmentContainerViewController.toolPickerWillShow(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (_TtC8PaperKitP33_54D3ACA847AFA52EC5CA5D25834A254533EnrollmentContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8PaperKitP33_54D3ACA847AFA52EC5CA5D25834A254533EnrollmentContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKitP33_54D3ACA847AFA52EC5CA5D25834A254533EnrollmentContainerViewController_enrollmentViewController));
}

@end