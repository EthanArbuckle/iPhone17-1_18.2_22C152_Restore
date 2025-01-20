@interface MultiDeviceTesterViewController
- (_TtC5Music31MultiDeviceTesterViewController)initWithCoder:(id)a3;
- (_TtC5Music31MultiDeviceTesterViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MultiDeviceTesterViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10023BA8C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10023D1D0(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MultiDeviceTesterViewController();
  id v4 = v5.receiver;
  [(MultiDeviceTesterViewController *)&v5 viewDidDisappear:v3];
  static LifecyclePatrol.isEnabled = 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10023D4BC((uint64_t)a3);
}

- (_TtC5Music31MultiDeviceTesterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC5Music31MultiDeviceTesterViewController *)sub_10023E1B8(v5, v7, a4);
}

- (_TtC5Music31MultiDeviceTesterViewController)initWithCoder:(id)a3
{
  return (_TtC5Music31MultiDeviceTesterViewController *)sub_10023F5D4(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music31MultiDeviceTesterViewController_scrollView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music31MultiDeviceTesterViewController_stackView);
}

@end