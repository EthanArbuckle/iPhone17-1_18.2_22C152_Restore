@interface ContainerDetail.ViewController
- (_TtCV5Music15ContainerDetail14ViewController)initWithCoder:(id)a3;
- (_TtCV5Music15ContainerDetail14ViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation ContainerDetail.ViewController

- (_TtCV5Music15ContainerDetail14ViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006454E4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100638C0C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100639748(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100639988(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100639B64(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ContainerDetail.ViewController(0);
  v4 = (char *)v8.receiver;
  [(ContainerDetail.ViewController *)&v8 viewDidDisappear:v3];
  v5 = &v4[OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController_dataSource];
  swift_beginAccess();
  uint64_t v6 = *((void *)v5 + 1);
  uint64_t ObjectType = swift_getObjectType();
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v6 + 176))(ObjectType, v6))
  {
    dispatch thunk of RelatedContentProvider.onDisappear()();
    swift_release();
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ContainerDetail.ViewController(0);
  id v4 = a3;
  id v5 = v6.receiver;
  [(ContainerDetail.ViewController *)&v6 willMoveToParentViewController:v4];
  sub_10063AB78();
  sub_1004CB70C();
  swift_release();
}

- (int64_t)preferredStatusBarStyle
{
  v2 = self;
  int64_t v3 = *(void *)(sub_10063AB78() + OBJC_IVAR____TtC5Music17HeaderCoordinator_preferredStatusBarStyle);

  swift_release();
  return v3;
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UIContentUnavailableConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  objc_super v8 = self;
  sub_10063A4F0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtCV5Music15ContainerDetail14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtCV5Music15ContainerDetail14ViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController_loadingTimer));
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController_artwork, (uint64_t *)&unk_10109EF90);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController____lazy_storage___backdropContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController_backdropView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController_floatingArtworkContainer));
  swift_release();
  int64_t v3 = (char *)self + OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController_relatedContentState;
  uint64_t v4 = type metadata accessor for RelatedContentProvider.State();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController_relatedContentStateSubscription, &qword_1010B46B0);
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController____lazy_storage___pageProperties, &qword_1010B4668);
  sub_100460780(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController____lazy_storage___popoverProvider));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController____lazy_storage___collectionViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController____lazy_storage___collectionView));
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController____lazy_storage___contextualActionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV5Music15ContainerDetail14ViewController____lazy_storage___contextualActionsBarButtonItem));

  swift_release();
}

@end