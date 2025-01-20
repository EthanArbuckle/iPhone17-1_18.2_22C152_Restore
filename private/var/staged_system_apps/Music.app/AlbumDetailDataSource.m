@interface AlbumDetailDataSource
- (BOOL)collectionView:(void *)a3 shouldHighlightItemAtIndexPath:;
- (_TtC5Music21AlbumDetailDataSource)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation AlbumDetailDataSource

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_asyncSetupTask))
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
  v5.super_class = (Class)type metadata accessor for AlbumDetailDataSource(0);
  [(AlbumDetailDataSource *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___headerRegistration, &qword_1010A9CC0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___bannerRegistration, &qword_1010A9CB8);
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___trackCellRegistration, &qword_1010A9C28);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___noContentCellRegistration, (uint64_t *)&unk_1010A9C10);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___detailCellRegistration, &qword_1010A9BE8);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___showCompleteAlbumCellRegistration, &qword_10109C878);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___storeNavigationCellRegistration, &qword_10109C878);
  v3 = (char *)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_symphonyRelatedContentSpacingCellRegistration;
  uint64_t v4 = sub_100063814((uint64_t *)&unk_1010BB620);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1000637B8((uint64_t)self+ OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___symphonyRelatedContentCellRegistration, (uint64_t *)&unk_1010BB630);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_wrappedViewController, (uint64_t *)&unk_1010A97F0);
  swift_bridgeObjectRelease();
  sub_100460780(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___dragDropController));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_prominentItemIndexPath, (uint64_t *)&unk_10109B9F0);
  sub_10045C010(*(unint64_t *)((char *)&self->super.isa
                                    + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_presentedLoadingState));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_artwork, (uint64_t *)&unk_10109EF90);
  sub_100460780(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___relatedContentProvider));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___openInClassicalBarButtonItem));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_album, (uint64_t *)&unk_10109C800);
  objc_super v5 = (char *)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_source;
  uint64_t v6 = type metadata accessor for MusicPropertySource();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_100456DC8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_loadingSource, type metadata accessor for AlbumDetailDataSource.LoadingSource);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_scope, &qword_1010B4800);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_sourceURL, (uint64_t *)&unk_10109BF50);
  swift_release();
  swift_release();
  sub_10045C5EC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_autoupdatingResponse));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_tracks, (uint64_t *)&unk_1010A1D90);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_prominentTrackSource, (uint64_t *)&unk_10109C760);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_catalogAlbum, (uint64_t *)&unk_10109C800);

  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_10045C7F8(a4);

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
  v12 = (void *)sub_1004227A4((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (BOOL)collectionView:(void *)a3 shouldHighlightItemAtIndexPath:
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a1;
  uint64_t v11 = IndexPath.section.getter();
  uint64_t v12 = sub_100429C60(2u);
  char v14 = v13;

  BOOL v16 = (v14 & 1) == 0 && v11 == v12;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v16;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_100423A64(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  type metadata accessor for IndexPath();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  id v9 = self;
  id v10 = (void *)sub_10045CAC8(v7);
  swift_bridgeObjectRelease();

  return v10;
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
  char v14 = self;
  sub_10045D37C(v13, (uint64_t)v11);

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
  char v14 = self;
  sub_10045D50C((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004262EC(v4);
}

- (_TtC5Music21AlbumDetailDataSource)init
{
  result = (_TtC5Music21AlbumDetailDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end