@interface CardListController
- (_TtC17SequoiaTranslator18CardListController)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator18CardListController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)deleteCell:(id)a3;
- (void)favorite:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CardListController

- (_TtC17SequoiaTranslator18CardListController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000333E0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10002B5DC();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CardListController();
  id v4 = v7.receiver;
  [(CardListController *)&v7 viewWillAppear:v3];
  id v5 = sub_10002AF9C();
  id v6 = sub_10011445C();

  [v6 resetSwipedItemAnimated:0 completion:0 v7.receiver, v7.super_class];
}

- (void)viewSafeAreaInsetsDidChange
{
  v2 = self;
  sub_10002B7E8();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_10002C034(a3);
}

- (_TtC17SequoiaTranslator18CardListController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17SequoiaTranslator18CardListController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18CardListController_conversation));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18CardListController_dictionaryManager));
  swift_bridgeObjectRelease();
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator18CardListController_currentExpandedIndexPath, (uint64_t *)&unk_1002F4B60);
  sub_100013384((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator18CardListController_newTranslationManager);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18CardListController____lazy_storage___layout));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator18CardListController____lazy_storage___collectionView);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(CardListController *)v5 view];
  if (v6)
  {
    id v7 = v6;
    [v6 endEditing:1];
  }
  else
  {
    __break(1u);
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10002EA9C();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = a3;
  id v7 = self;
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    int64_t v8 = _CocoaArrayWrapper.endIndex.getter();

    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v8 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10002EEE0(v10, (uint64_t)v9);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10002D180((uint64_t)v9, 1);
  id v12 = [(CardListController *)v11 view];
  if (v12)
  {
    v13 = v12;
    [v12 endEditing:1];

    id v14 = sub_10002B338();
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    [v14 scrollToItemAtIndexPath:isa atScrollPosition:4 animated:1];

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    __break(1u);
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100007620((uint64_t *)&unk_1002F4B60);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for IndexPath();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v8, v12, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  id v13 = a3;
  id v14 = self;
  sub_10002DB60((uint64_t)v8, 1);
  sub_10000B070((uint64_t)v8, (uint64_t *)&unk_1002F4B60);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)favorite:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100031C28((uint64_t)v4);
}

- (void)deleteCell:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_100032040((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end