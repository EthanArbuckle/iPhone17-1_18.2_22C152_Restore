@interface LoadDetailViewController
- (_TtC10FitnessApp24LoadDetailViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp24LoadDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapOnInfoButton:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation LoadDetailViewController

- (_TtC10FitnessApp24LoadDetailViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp24LoadDetailViewController_subView) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC10FitnessApp24LoadDetailViewController____lazy_storage___loadDetailView;
  uint64_t DetailsView = type metadata accessor for LoadDetailsView();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(DetailsView - 8) + 56))(v5, 1, 1, DetailsView);
  id v7 = a3;

  result = (_TtC10FitnessApp24LoadDetailViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LoadDetailViewController();
  id v4 = v8.receiver;
  [(LoadDetailViewController *)&v8 viewWillAppear:v3];
  id v5 = [v4 navigationController];
  if (v5)
  {
    v6 = v5;
    self;
    id v7 = (void *)swift_dynamicCastObjCClass();
    if (!v7) {

    }
    [v7 detachPalette];
  }
  else
  {
    id v7 = v4;
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1004ADF3C();
}

- (void)didTapOnInfoButton:(id)a3
{
  uint64_t InfoPaneDetailView = type metadata accessor for TrainingLoadInfoPaneDetailView();
  __chkstk_darwin(InfoPaneDetailView - 8);
  id v7 = (uint64_t *)((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  v10 = (char *)&v14 - v9;
  *id v7 = swift_getKeyPath();
  sub_1000AFA94(&qword_10094DFC8);
  swift_storeEnumTagMultiPayload();
  sub_1004AFB88((uint64_t)v7, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for TrainingLoadInfoPaneDetailView);
  objc_allocWithZone((Class)sub_1000AFA94(&qword_10095E6F0));
  id v11 = a3;
  v12 = self;
  v13 = (void *)UIHostingController.init(rootView:)();
  [v13 setModalPresentationStyle:1];
  [(LoadDetailViewController *)v12 presentViewController:v13 animated:1 completion:0];
}

- (_TtC10FitnessApp24LoadDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp24LoadDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24LoadDetailViewController_context));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24LoadDetailViewController_subView));
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24LoadDetailViewController____lazy_storage___loadDetailView, &qword_10095E6E8);
}

@end