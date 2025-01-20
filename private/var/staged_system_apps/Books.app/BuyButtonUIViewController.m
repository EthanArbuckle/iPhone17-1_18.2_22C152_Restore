@interface BuyButtonUIViewController
- (_TtC5Books25BuyButtonUIViewController)initWithCoder:(id)a3;
- (_TtC5Books25BuyButtonUIViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_buyButtonPressed:(id)a3;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation BuyButtonUIViewController

- (_TtC5Books25BuyButtonUIViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC5Books25BuyButtonUIViewController_eventHandler;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books25BuyButtonUIViewController_cancellables) = (Class)&_swiftEmptySetSingleton;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books25BuyButtonUIViewController_buttonEnabled) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Books25BuyButtonUIViewController_radialProgressThickness) = (Class)0x4000000000000000;
  id v5 = a3;

  result = (_TtC5Books25BuyButtonUIViewController *)sub_1007FF260();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for BuyButtonUIView());
  v4 = self;
  id v5 = [v3 initWithFrame:0.0, 0.0, 0.0, 0.0];
  [(BuyButtonUIViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1004EBDB8();
}

- (_TtC5Books25BuyButtonUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Books25BuyButtonUIViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_10005AFE8((uint64_t)self + OBJC_IVAR____TtC5Books25BuyButtonUIViewController_eventHandler, &qword_100B26C28);

  swift_bridgeObjectRelease();
}

- (void)_buyButtonPressed:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1004EDCE0();

  sub_10005AFE8((uint64_t)v6, (uint64_t *)&unk_100B269C0);
}

@end