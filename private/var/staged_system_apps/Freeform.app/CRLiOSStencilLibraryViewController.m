@interface CRLiOSStencilLibraryViewController
- (NSSet)boardItemsToSave;
- (_TtC8Freeform34CRLiOSStencilLibraryViewController)initWithCoder:(id)a3;
- (_TtC8Freeform34CRLiOSStencilLibraryViewController)initWithEditingCoordinator:(id)a3 interactiveCanvasController:(id)a4 boardItemsToSave:(id)a5;
- (_TtC8Freeform34CRLiOSStencilLibraryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissViewController;
- (void)stencilGridViewDidPressCancelButton;
- (void)stencilGridViewWantsToSaveStencilToLibraryWithTitle:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CRLiOSStencilLibraryViewController

- (_TtC8Freeform34CRLiOSStencilLibraryViewController)initWithEditingCoordinator:(id)a3 interactiveCanvasController:(id)a4 boardItemsToSave:(id)a5
{
  type metadata accessor for CRLBoardItem(0);
  sub_100AF5F70((unint64_t *)&qword_101676C20, (void (*)(uint64_t))type metadata accessor for CRLBoardItem);
  uint64_t v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100AF3578(a3, a4, v7);
  return result;
}

- (_TtC8Freeform34CRLiOSStencilLibraryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100AF5FB8();
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLiOSStencilLibraryViewController();
  id v2 = v5.receiver;
  [(CRLiOSStencilLibraryViewController *)&v5 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    if (qword_10166F8E8 != -1) {
      swift_once();
    }
    [v4 setBackgroundColor:qword_101691C08];

    sub_100AF5440();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100AF3F48(a3);
}

- (void)dismissViewController
{
}

- (NSSet)boardItemsToSave
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform34CRLiOSStencilLibraryViewController_stencilDataArchiver))
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    id v2 = self;
    if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter())
    {
      sub_100508DCC((unint64_t)_swiftEmptyArrayStorage);
    }
    else
    {
    }
  }
  type metadata accessor for CRLBoardItem(0);
  sub_100AF5F70((unint64_t *)&qword_101676C20, (void (*)(uint64_t))type metadata accessor for CRLBoardItem);
  v3.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v3.super.isa;
}

- (void)stencilGridViewDidPressCancelButton
{
}

- (void)stencilGridViewWantsToSaveStencilToLibraryWithTitle:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_100AF467C(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform34CRLiOSStencilLibraryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform34CRLiOSStencilLibraryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectUnownedDestroy();
  swift_unknownObjectUnownedDestroy();
  swift_release();
  sub_100AF5C9C((uint64_t)self + OBJC_IVAR____TtC8Freeform34CRLiOSStencilLibraryViewController____lazy_storage___gridView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform34CRLiOSStencilLibraryViewController____lazy_storage___gridViewController));

  swift_release();
}

@end