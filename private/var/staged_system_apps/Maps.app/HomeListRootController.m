@interface HomeListRootController
- (BOOL)active;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (NSArray)keyCommands;
- (SuggestionsItemSource)suggestionsItemSource;
- (UICollectionViewDataSource)dataSource;
- (UICollectionViewLayout)collectionViewLayout;
- (_TtC4Maps22HomeListRootController)init;
- (_TtC4Maps22HomeListRootController)initWithConfiguration:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)newTraits;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dragAndDropItem:(id)a3 didResolveMapItem:(id)a4;
- (void)dragAndDropPreviewDidUpdate:(id)a3;
- (void)handleKeyCommand:(id)a3;
- (void)resetScrollOffset;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActive:(BOOL)a3;
- (void)setKeyCommands:(id)a3;
- (void)setNeedsUpdate;
@end

@implementation HomeListRootController

- (UICollectionViewLayout)collectionViewLayout
{
  v2 = self;
  id v3 = sub_10003BC78();

  return (UICollectionViewLayout *)v3;
}

- (UICollectionViewDataSource)dataSource
{
  v2 = self;
  id v3 = sub_1000806A8();

  return (UICollectionViewDataSource *)v3;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  v15 = self;
  v16 = (void *)sub_1000F4F34((uint64_t)v14, v11, v13, (uint64_t)v10);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v16;
}

- (SuggestionsItemSource)suggestionsItemSource
{
  v2 = self;
  id v3 = sub_1000F2C80();
  id v4 = [v3 suggestionsItemSource];

  return (SuggestionsItemSource *)v4;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  sub_1000830D4((uint64_t)v12, (uint64_t)v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  swift_unknownObjectRetain();
  id v12 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  id v13 = (void *)sub_10008D7AC((uint64_t)v11, (uint64_t)v10, (uint64_t)v15);

  sub_1000FF22C((uint64_t)v15);
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (id)newTraits
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = (void *)Strong;
    v5 = self;
    id v6 = [v4 newTraits];

    swift_unknownObjectRelease();
    return v6;
  }
  else
  {
    id v8 = objc_allocWithZone((Class)GEOMapServiceTraits);
    uint64_t v9 = self;
    id result = [v8 init];
    if (result)
    {
      id v10 = result;

      return v10;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

- (void)setNeedsUpdate
{
  v2 = self;
  sub_1000FF33C(&qword_1015D7420);
  sub_1001010F8(&qword_1015D7428, &qword_1015D7420);
  Subject<>.send()();
}

- (void)setActive:(BOOL)a3
{
  uint64_t v3 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_isActive);
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_isActive) = a3;
  id v4 = self;
  sub_10008B0BC(v3);
}

- (void)resetScrollOffset
{
  v2 = self;
  sub_100069168();
}

- (_TtC4Maps22HomeListRootController)initWithConfiguration:(id)a3
{
  return (_TtC4Maps22HomeListRootController *)sub_100075370((void (**)(char *, uint64_t, uint64_t))a3);
}

- (NSArray)keyCommands
{
  sub_100100830(0, &qword_1015D48A0);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setKeyCommands:(id)a3
{
  sub_100100830(0, &qword_1015D48A0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_keyCommands) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (BOOL)active
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_isActive);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    id v6 = self;
  }
  char v7 = sub_10025FD98((uint64_t)v9);

  sub_1000FF2E0((uint64_t)v9, (uint64_t *)&unk_1015CD260);
  return v7 & 1;
}

- (void)handleKeyCommand:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10025E0E4(v4);
}

- (_TtC4Maps22HomeListRootController)init
{
  id result = (_TtC4Maps22HomeListRootController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000FA538(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_rootSnapshot));
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps22HomeListRootController____lazy_storage___suggestionsDataProvider));

  sub_10010B3BC(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC4Maps22HomeListRootController____lazy_storage___homeResultDataProvider));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps22HomeListRootController____lazy_storage___compositionalLayout));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps22HomeListRootController____lazy_storage___diffableDataSource));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC4Maps22HomeListRootController_proactiveTraySignposter;
  uint64_t v4 = type metadata accessor for OSSignposter();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v11 = Strong;
    if ([Strong respondsToSelector:"scrollViewWillEndDragging:withVelocity:targetContentOffset:"])
    {
      id v12 = a3;
      id v13 = self;
      [v11 scrollViewWillEndDragging:v12 withVelocity:a5 targetContentOffset:x, y];
    }
    swift_unknownObjectRelease();
  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_10025E744(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_collectionView_shouldHighlightItemAtIndexPath_);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_10025E744(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_collectionView_shouldSelectItemAtIndexPath_);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_10025E858((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  swift_unknownObjectRetain();
  uint64_t v12 = self;
  sub_10025FF28(v11);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_100100830(0, &qword_1015D7388);
  v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v13.super.isa;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_10025EF5C(v6, a4);

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  sub_100260210();

  swift_unknownObjectRelease();
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = objc_allocWithZone((Class)UIDragPreviewParameters);
  id v11 = a3;
  uint64_t v12 = self;
  id v13 = [v10 init];
  id result = [v11 theme];
  if (result)
  {
    id v15 = result;
    id v16 = [result controlBackgroundColor];

    [v13 setBackgroundColor:v16];
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)dragAndDropItem:(id)a3 didResolveMapItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10025F168();
}

- (void)dragAndDropPreviewDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10025F168();
}

@end