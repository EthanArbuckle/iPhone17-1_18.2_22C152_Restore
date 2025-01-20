@interface LibraryPlacesViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (UIMenu)selectionModeMenu;
- (UIMenu)selectionTriggerMenu;
- (_TtC4Maps27LibraryPlacesViewController)initWithCoder:(id)a3;
- (_TtC4Maps27LibraryPlacesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP4Maps21LibraryActionDelegate_)actionDelegate;
- (id)menuProvider;
- (void)addLibraryItem;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)didResignCurrent;
- (void)dismissTapped;
- (void)exitEditingMode;
- (void)keyboardDidAppear;
- (void)keyboardDidDismiss;
- (void)libraryItemsCountManager:(id)a3 didUpdateCounts:(id)a4;
- (void)prepareForNoteEditorPresentationWithCompletion:(id)a3;
- (void)prepareLibrary;
- (void)setActionDelegate:(id)a3;
- (void)setMenuProvider:(id)a3;
- (void)setSelectionModeMenu:(id)a3;
- (void)setSelectionTriggerMenu:(id)a3;
- (void)setupConstraints;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)willBecomeCurrent:(BOOL)a3;
@end

@implementation LibraryPlacesViewController

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
  LibraryPlacesViewController.actionDelegate.setter();
}

- (id)menuProvider
{
  v2 = self;
  v3 = sub_1002F6D98();
  uint64_t v5 = v4;

  v8[4] = v3;
  v8[5] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100254EE0;
  v8[3] = &unk_1012E3888;
  v6 = _Block_copy(v8);
  swift_release();

  return v6;
}

- (void)setMenuProvider:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (id (**)(uint64_t, objc_class *))((char *)self
                                                 + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___menuProvider);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___menuProvider);
  void *v6 = sub_100256430;
  v6[1] = (id (*)(uint64_t, objc_class *))v5;

  sub_10006C5D8(v7);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = *(void **)(*(char **)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController_countsManager)
                + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_observers);
  uint64_t v5 = self;
  [v4 unregisterObserver:v5];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(LibraryPlacesViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController_actionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController_collectionViewManager));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController_countsManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___navBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___navItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___menuButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___addButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___titleLabelButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___dismissButtonIOS));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___doneEditingButton));
  sub_10006C5D8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___menuProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___searchController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___emptyStateView));
  swift_bridgeObjectRelease();
  sub_10006C5D8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController_noteEditorPrePresentationDidFinish));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionModeMenu));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionTriggerMenu);
}

- (void)viewDidLoad
{
  v2 = self;
  LibraryPlacesViewController.viewDidLoad()();
}

- (void)willBecomeCurrent:(BOOL)a3
{
  uint64_t v4 = self;
  LibraryPlacesViewController.willBecomeCurrent(_:)(a3);
}

- (void)didResignCurrent
{
  v2 = self;
  LibraryPlacesViewController.didResignCurrent()();
}

- (void)setupConstraints
{
  v2 = self;
  sub_1002F8694();
}

- (void)prepareLibrary
{
  uint64_t v3 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  uint64_t v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = &protocol witness table for MainActor;
  sub_1002DD440((uint64_t)v5, (uint64_t)&unk_1015DAA28, v9);

  swift_release();
}

- (void)dismissTapped
{
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)exitEditingMode
{
  v2 = self;
  sub_1002F9D70();
}

- (void)addLibraryItem
{
  v2 = self;
  sub_1002FA030();
}

- (UIMenu)selectionModeMenu
{
  v2 = self;
  id v3 = sub_1002FA2C0(&OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionModeMenu, (uint64_t (*)(uint64_t))sub_1002FAAB4);

  return (UIMenu *)v3;
}

- (void)setSelectionModeMenu:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionModeMenu);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionModeMenu) = (Class)a3;
  id v3 = a3;
}

- (UIMenu)selectionTriggerMenu
{
  v2 = self;
  id v3 = sub_1002FA324();

  return (UIMenu *)v3;
}

- (void)setSelectionTriggerMenu:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionTriggerMenu);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController____lazy_storage___selectionTriggerMenu) = (Class)a3;
  id v3 = a3;
}

- (void)keyboardDidAppear
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC4Maps27LibraryPlacesViewController_isKeyboardPresented) = 1;
}

- (void)keyboardDidDismiss
{
  v2 = self;
  sub_1002FB940();
}

- (void)prepareForNoteEditorPresentationWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1002FD5F8((char *)v5, (void (**)(void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC4Maps27LibraryPlacesViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC4Maps27LibraryPlacesViewController *)LibraryPlacesViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC4Maps27LibraryPlacesViewController)initWithCoder:(id)a3
{
  return (_TtC4Maps27LibraryPlacesViewController *)LibraryPlacesViewController.init(coder:)(a3);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LibraryPlacesViewController.updateSearchResults(for:)((UISearchController)v4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char **)((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  LibraryPlacesViewController.collectionView(_:didSelectItemAt:)(v10, v9);

  (*(void (**)(char **, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  _s4Maps27LibraryPlacesViewControllerC010collectionD0_17didDeselectItemAtySo012UICollectionD0C_10Foundation9IndexPathVtF_0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)libraryItemsCountManager:(id)a3 didUpdateCounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  _s4Maps27LibraryPlacesViewControllerC24libraryItemsCountManager_15didUpdateCountsyAA0bghI0C_AA0bgH0CtF_0();
}

@end