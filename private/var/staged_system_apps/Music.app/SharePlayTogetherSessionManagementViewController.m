@interface SharePlayTogetherSessionManagementViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (_TtC5Music48SharePlayTogetherSessionManagementViewController)initWithCoder:(id)a3;
- (_TtC5Music48SharePlayTogetherSessionManagementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)collectionView:(void *)a3 shouldSelectItemAtIndexPath:;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SharePlayTogetherSessionManagementViewController

- (_TtC5Music48SharePlayTogetherSessionManagementViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006F40C0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1006DF8C0();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_1006E42E0(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SharePlayTogetherSessionManagementViewController(0);
  v4 = v5.receiver;
  [(SharePlayTogetherSessionManagementViewController *)&v5 viewDidAppear:v3];
  v4[OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_viewDidAppearOnce] = 1;
  sub_1006E47A0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1006E4538();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SharePlayTogetherSessionManagementViewController(0);
  v4 = (char *)v7.receiver;
  [(SharePlayTogetherSessionManagementViewController *)&v7 viewWillDisappear:v3];
  objc_super v5 = *(void (**)(uint64_t))&v4[OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_onDismiss];
  if (v5)
  {
    uint64_t v6 = swift_retain();
    v5(v6);
    sub_10006ADFC((uint64_t)v5);
  }
}

- (_TtC5Music48SharePlayTogetherSessionManagementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music48SharePlayTogetherSessionManagementViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_session));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_onDismiss));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_dataSource));
  swift_bridgeObjectRelease();
  sub_1000637B8((uint64_t)self+ OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_lastPendingParticipantScrolledTo, (uint64_t *)&unk_1010B6FE0);
  swift_release();
  swift_release();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_sessionAssertion);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = [(SharePlayTogetherSessionManagementViewController *)v11 traitCollection];
  id v13 = [v12 userInterfaceIdiom];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13 == (id)3;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1006E649C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (uint64_t)collectionView:(void *)a3 shouldSelectItemAtIndexPath:
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a1;
  sub_1006F4208();
  LOBYTE(a1) = v11;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a1 & 1;
}

@end