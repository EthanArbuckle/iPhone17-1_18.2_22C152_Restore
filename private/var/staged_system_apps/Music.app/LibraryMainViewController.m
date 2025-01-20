@interface LibraryMainViewController
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC5Music25LibraryMainViewController)initWithCoder:(id)a3;
- (_TtC5Music25LibraryMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)presentRazzmatazz:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation LibraryMainViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10050AE9C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_100510850(v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  [(LibraryMainViewController *)&v5 viewDidAppear:v3];
  v4[OBJC_IVAR____TtC5Music25LibraryMainViewController_allowsAnimatedChanges] = 1;
  sub_100510C8C(3u);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  [(LibraryMainViewController *)&v7 viewWillDisappear:v3];
  v4[OBJC_IVAR____TtC5Music25LibraryMainViewController_allowsAnimatedChanges] = 0;
  uint64_t v5 = OBJC_IVAR____TtC5Music25LibraryMainViewController_shouldSkipRecordingPageMetrics;
  char v6 = v4[OBJC_IVAR____TtC5Music25LibraryMainViewController_shouldSkipRecordingPageMetrics];
  v4[OBJC_IVAR____TtC5Music25LibraryMainViewController_shouldSkipRecordingPageMetrics] = 1;
  sub_100510F18(0, 0);
  v4[v5] = v6;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(LibraryMainViewController *)&v5 viewDidDisappear:v3];
  sub_100510710(0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  char v6 = self;
  sub_100510F18(a3, a4);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  int64_t v6 = sub_10051D0D4();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = self;
  int64_t v8 = sub_10051D274(a4);

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  v15 = self;
  v16 = (void *)sub_1005184DC((uint64_t)v14, v11, v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v16;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  v12 = sub_1005187FC((void (*)(unsigned char *, void, uint64_t))v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  LOBYTE(self) = sub_10051D7FC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  if (UICollectionView.isDraggingCell(at:)())
  {

    char v12 = 0;
  }
  else
  {
    unsigned __int8 v13 = [v10 isEditing];

    char v12 = v13 ^ 1;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (uint64_t *)((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_10051DA44(v9);

  (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  unsigned __int8 v9 = [(LibraryMainViewController *)self isEditing];
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unsigned __int8 v13 = (char *)&v17 - v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  uint64_t v15 = self;
  sub_10051E744();

  v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  v16(v13, v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  type metadata accessor for IndexPath();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = sub_10051EAA0(v7);

  swift_bridgeObjectRelease();

  return v10;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_10051F0E4(v9, a5);

  swift_unknownObjectRelease();
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  uint64_t v15 = IndexPath.section.getter();
  if (sub_10051CF68(v15) == 2)
  {
    uint64_t v19 = 0;
    memset(v18, 0, sizeof(v18));
    char v20 = 1;
    id v16 = sub_1001F1FB0((uint64_t)v11, (uint64_t)v18);
  }
  else
  {

    id v16 = 0;
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v16;
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UIContentUnavailableConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_10051AE50();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)presentRazzmatazz:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10051B68C(v4);
}

- (_TtC5Music25LibraryMainViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10051F530();
}

- (_TtC5Music25LibraryMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music25LibraryMainViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___headerRegistration, &qword_1010A45B0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___inlineBubbleTipRegistration, &qword_1010ADB78);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___libraryImportCellRegistration, (uint64_t *)&unk_1010ADB80);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___menuCellRegistration, &qword_1010ADBB0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___recentCellRegistration, (uint64_t *)&unk_1010BA190);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController_prefetchingController));
  swift_release();
  swift_release();
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController_sharedLibrarySelectionObserver, &qword_1010B46B0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController_availableSharedLibrariesObserver, &qword_1010B46B0);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___actionMetricsReportingContext, (uint64_t *)&unk_10109B9A0);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController_downloadSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___accountButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___accountBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___contextBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___contextBarButton));
  sub_10051BEFC(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music25LibraryMainViewController_currentMenu), *(void **)&self->$__lazy_storage_$_collectionView[OBJC_IVAR____TtC5Music25LibraryMainViewController_currentMenu]);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController_recentlyAddedResponse, (uint64_t *)&unk_1010ADAA0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController_libraryImportViewModel, &qword_1010BB850);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController_viewModels, (uint64_t *)&unk_1010ADA90);
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC5Music25LibraryMainViewController_inlineBubbleTipPageFields;
  uint64_t v4 = type metadata accessor for MusicMetrics.PageFields();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___dropIndicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___editDoneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___largeTitleAccessoryView));

  swift_release();
}

@end