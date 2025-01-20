@interface FavoritesCardListController
- (_TtC17SequoiaTranslator27FavoritesCardListController)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator27FavoritesCardListController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FavoritesCardListController

- (_TtC17SequoiaTranslator27FavoritesCardListController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator27FavoritesCardListController_collectionView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator27FavoritesCardListController_dataSource) = 0;
  id v4 = a3;

  result = (_TtC17SequoiaTranslator27FavoritesCardListController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FavoritesCardListController();
  v2 = v5.receiver;
  [(FavoritesCardListController *)&v5 viewDidLoad];
  sub_1000E3280();
  (*(void (**)(uint64_t, uint64_t))((swift_isaMask & *v2) + 0xF8))(v3, v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FavoritesCardListController();
  uint64_t v4 = v5.receiver;
  [(FavoritesCardListController *)&v5 viewWillAppear:v3];
  (*(void (**)(void))((swift_isaMask & *v4) + 0x100))(0);
}

- (_TtC17SequoiaTranslator27FavoritesCardListController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17SequoiaTranslator27FavoritesCardListController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27FavoritesCardListController_collectionView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator27FavoritesCardListController_dataSource);
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = *(void (**)(uint64_t))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x100);
  id v5 = a3;
  v6 = self;
  v4(1);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v12 = sub_100007620((uint64_t *)&unk_1002F4B60);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  v15 = &v26[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v13);
  v17 = &v26[-v16];
  id v18 = a3;
  swift_unknownObjectRetain();
  v19 = self;
  id v20 = a5;
  id v21 = a7;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (v20)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v22 = type metadata accessor for IndexPath();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v17, 0, 1, v22);
  }
  else
  {
    uint64_t v23 = type metadata accessor for IndexPath();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v17, 1, 1, v23);
  }
  if (v21)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v24 = type metadata accessor for IndexPath();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v15, 0, 1, v24);
  }
  else
  {
    uint64_t v25 = type metadata accessor for IndexPath();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v15, 1, 1, v25);
  }
  sub_1000E6844((uint64_t)v26, (uint64_t)v17, a6);

  sub_10000B070((uint64_t)v15, (uint64_t *)&unk_1002F4B60);
  sub_10000B070((uint64_t)v17, (uint64_t *)&unk_1002F4B60);
  sub_10000AB68((uint64_t)v26);
}

@end