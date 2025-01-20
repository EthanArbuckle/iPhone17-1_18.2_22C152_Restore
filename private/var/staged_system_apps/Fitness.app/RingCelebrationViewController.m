@interface RingCelebrationViewController
- (BOOL)prefersStatusBarHidden;
- (_TtC10FitnessApp29RingCelebrationViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp29RingCelebrationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)appWillResignActive:(id)a3;
- (void)beginFadeOut;
- (void)configurePlayer;
- (void)dealloc;
- (void)teardownPlayer;
- (void)textSizeChangedWithNotification:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation RingCelebrationViewController

- (void)dealloc
{
  v2 = self;
  sub_1006C02E4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_player));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_playerLayer));
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_url, (uint64_t *)&unk_10094B790);
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_timeObserverToken, &qword_100955A00);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_subtitleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_bottomLabelConstraint);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1006C0568();
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RingCelebrationViewController();
  v2 = (char *)v6.receiver;
  [(RingCelebrationViewController *)&v6 viewDidLayoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_playerLayer];
  if (v3)
  {
    v4 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_containerView];
    v5 = v3;
    [v4 bounds];
    [v5 setFrame:];

    v2 = v5;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1006C16A0(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RingCelebrationViewController();
  id v4 = v5.receiver;
  [(RingCelebrationViewController *)&v5 viewDidDisappear:v3];
  [v4 teardownPlayer];
}

- (void)textSizeChangedWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_bottomLabelConstraint);
  v9 = self;
  v10 = self;
  id v11 = v8;
  id v12 = [v9 preferredFontForTextStyle:UIFontTextStyleFootnote];
  [v12 _scaledValueForValue:-40.0];
  double v14 = v13;

  [v11 setConstant:v14];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)appWillResignActive:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  [(RingCelebrationViewController *)self dismissViewControllerAnimated:0 completion:0];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)beginFadeOut
{
  v2 = self;
  sub_1006C21F4();
}

- (_TtC10FitnessApp29RingCelebrationViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10FitnessApp29RingCelebrationViewController *)sub_1006C26F4(v5, v7, a4);
}

- (_TtC10FitnessApp29RingCelebrationViewController)initWithCoder:(id)a3
{
  return (_TtC10FitnessApp29RingCelebrationViewController *)sub_1006C2AA0(a3);
}

- (void)configurePlayer
{
  v2 = self;
  sub_1006C2EBC();
}

- (void)teardownPlayer
{
  v2 = self;
  sub_1006C3974();
}

@end