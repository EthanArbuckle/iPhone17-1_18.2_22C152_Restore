@interface LyricsSelectionViewController
- (_TtC5Music29LyricsSelectionViewController)initWithCoder:(id)a3;
- (_TtC5Music29LyricsSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)accessibilityCharacterCount;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation LyricsSelectionViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1002DE754();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1002DF3CC(a3);
}

- (_TtC5Music29LyricsSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC5Music29LyricsSelectionViewController *)sub_1002E12D0(v5, v7, a4);
}

- (_TtC5Music29LyricsSelectionViewController)initWithCoder:(id)a3
{
  return (_TtC5Music29LyricsSelectionViewController *)sub_1002E1554(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29LyricsSelectionViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29LyricsSelectionViewController_activityIndicator));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29LyricsSelectionViewController____lazy_storage___collectionView));
  sub_1002E50D8((uint64_t)self + OBJC_IVAR____TtC5Music29LyricsSelectionViewController_pageProperties, (uint64_t (*)(void))type metadata accessor for MetricsPageProperties);
}

- (int64_t)accessibilityCharacterCount
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Music29LyricsSelectionViewController_selectionManager);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 64);
  int64_t result = v3 - v4;
  if (__OFSUB__(v3, v4)) {
    __break(1u);
  }
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1002E4D48(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1002E1A88(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end