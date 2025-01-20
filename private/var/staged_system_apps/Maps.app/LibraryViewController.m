@interface LibraryViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (_TtC4Maps21LibraryViewController)initWithCoder:(id)a3;
- (_TtC4Maps21LibraryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP4Maps21LibraryActionDelegate_)actionDelegate;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)prepareForNoteEditorPresentationWithCompletion:(id)a3;
- (void)presentGuidesView;
- (void)presentPinsView;
- (void)presentPlacesView;
- (void)presentSavedRouteList;
- (void)setActionDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation LibraryViewController

- (_TtP4Maps21LibraryActionDelegate_)actionDelegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps21LibraryActionDelegate_ *)Strong;
}

- (void)setActionDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  LibraryViewController.actionDelegate.setter();
}

- (void)viewDidLoad
{
  v2 = self;
  LibraryViewController.viewDidLoad()();
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)prepareForNoteEditorPresentationWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void (*)(void *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);
}

- (_TtC4Maps21LibraryViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC4Maps21LibraryViewController *)LibraryViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC4Maps21LibraryViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps21LibraryViewController____lazy_storage___collectionView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps21LibraryViewController_collectionViewManager) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(LibraryViewController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps21LibraryViewController_actionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps21LibraryViewController____lazy_storage___collectionView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps21LibraryViewController_collectionViewManager);
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
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
  LibraryViewController.collectionView(_:didSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)presentPinsView
{
}

- (void)presentSavedRouteList
{
  v3 = self;
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7[4] = sub_1002EE48C;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_1002EE148;
  v7[3] = &unk_1012E3388;
  uint64_t v5 = _Block_copy(v7);
  uint64_t v6 = self;
  swift_release();
  [v3 fetchSavedRoutesWithType:1 completion:v5];
  _Block_release(v5);
}

- (void)presentPlacesView
{
}

- (void)presentGuidesView
{
}

@end