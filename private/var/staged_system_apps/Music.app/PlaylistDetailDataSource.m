@interface PlaylistDetailDataSource
- (_TtC5Music24PlaylistDetailDataSource)init;
- (id)_collectionView:(id)a3 indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (uint64_t)collectionView:(void *)a3 shouldHighlightItemAtIndexPath:;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)updateSearchResultsForSearchController:(id)a3;
@end

@implementation PlaylistDetailDataSource

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_asyncSetupTask))
  {
    v3 = self;
    swift_retain();
    sub_100063814((uint64_t *)&unk_1010991A0);
    Task.cancel()();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlaylistDetailDataSource(0);
  [(PlaylistDetailDataSource *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___headerRegistration, (uint64_t *)&unk_1010BB7B0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___searchHeaderRegistration, &qword_1010BB790);
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___trackCellRegistration, &qword_1010BB738);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___temporaryTrackCellRegistration, &qword_1010A1CF0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___noContentCellRegistration, (uint64_t *)&unk_1010A9C10);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___emptyTrackCellRegistration, &qword_1010BB698);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___addMusicCellRegistration, &qword_1010BB698);
  v3 = (char *)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_detailCellRegistration;
  uint64_t v4 = sub_100063814(&qword_1010BB800);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___suggestedSongsCellRegistration, &qword_1010BB660);
  objc_super v5 = (char *)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_symphonyRelatedContentSpacingCellRegistration;
  uint64_t v6 = sub_100063814((uint64_t *)&unk_1010BB620);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_1000637B8((uint64_t)self+ OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___symphonyRelatedContentCellRegistration, (uint64_t *)&unk_1010BB630);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_wrappedViewController, (uint64_t *)&unk_1010A97F0);
  swift_bridgeObjectRelease();
  sub_100460780(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___dragDropController));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_prominentItemIndexPath, (uint64_t *)&unk_10109B9F0);
  sub_10045C010(*(unint64_t *)((char *)&self->super.isa
                                    + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_presentedLoadingState));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_artwork, (uint64_t *)&unk_10109EF90);
  sub_100460780(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___relatedContentProvider));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_playlist, &qword_10109EC90);
  v7 = (char *)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_source;
  uint64_t v8 = type metadata accessor for MusicPropertySource();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_sourceURL, (uint64_t *)&unk_10109BF50);
  swift_release();
  sub_10045C5EC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_autoupdatingResponse));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_collaborationDetails, &qword_1010BB388);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___collaborationBarButton));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___collaborationControl));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_collaborationURL, (uint64_t *)&unk_10109BF50);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_catalogPlaylist, &qword_10109EC90);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_catalogEntries, (uint64_t *)&unk_1010B52D0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_largestPrefetchIndexPath, (uint64_t *)&unk_10109B9F0);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_presentingEntries, (uint64_t *)&unk_1010B52D0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_staticEntries, (uint64_t *)&unk_1010B52D0);
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_opportunisticProminentItemIndexPath, (uint64_t *)&unk_10109B9F0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___filterKeyCommand));
  swift_bridgeObjectRelease();
  v9 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___searchController);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_10082FF9C(a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_1007DC2A4((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (uint64_t)collectionView:(void *)a3 shouldHighlightItemAtIndexPath:
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a1;
  LOBYTE(a1) = sub_100830298((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a1 & 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1007DD708(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  type metadata accessor for IndexPath();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  id v9 = self;
  id v10 = sub_10083478C(v7);
  swift_bridgeObjectRelease();

  return v10;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  id v10 = sub_10081C5A4();
  [v10 resignFirstResponder];

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_100834E88(v9, a5);

  swift_unknownObjectRelease();
}

- (id)_collectionView:(id)a3 indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:(id)a4
{
  uint64_t v7 = sub_100063814((uint64_t *)&unk_10109B9F0);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v19 - v11;
  if (a4)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = type metadata accessor for IndexPath();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 0, 1, v13);
  }
  else
  {
    uint64_t v13 = type metadata accessor for IndexPath();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  }
  id v14 = a3;
  v15 = self;
  sub_1007E05F0(v12);

  sub_1000637B8((uint64_t)v9, (uint64_t *)&unk_10109B9F0);
  type metadata accessor for IndexPath();
  uint64_t v16 = *(void *)(v13 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v16 + 48))(v12, 1, v13) != 1)
  {
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(unsigned char *, uint64_t))(v16 + 8))(v12, v13);
  }

  return isa;
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
  sub_100835704(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  sub_100835A58((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  type metadata accessor for IndexPath();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  uint64_t v7 = self;
  sub_1007E0E70(v8, v6);
  swift_bridgeObjectRelease();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_1007E13E4(v5);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1007E1538(v4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  id v14 = self;
  [v7 contentOffset];
  double v9 = v8;
  [v7 adjustedContentInset];
  if (v9 != -v10)
  {
    double y = a5->y;
    [v7 safeAreaInsets];
    if (y < -v12)
    {
      [v7 safeAreaInsets];
      a5->double y = -v13;
    }
  }
}

- (_TtC5Music24PlaylistDetailDataSource)init
{
  result = (_TtC5Music24PlaylistDetailDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end