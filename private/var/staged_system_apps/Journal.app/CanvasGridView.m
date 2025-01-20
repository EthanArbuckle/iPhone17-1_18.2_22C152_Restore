@interface CanvasGridView
- (BOOL)accessibilityActivate;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (_TtC7Journal14CanvasGridView)initWithCoder:(id)a3;
- (_TtC7Journal14CanvasGridView)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(void *)a3 dragPreviewParametersForItemAtIndexPath:;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)dealloc;
@end

@implementation CanvasGridView

- (_TtC7Journal14CanvasGridView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal14CanvasGridView *)sub_10037F038(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal14CanvasGridView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003854F0();
}

- (void)dealloc
{
  id v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for CanvasGridView();
  [(CanvasGridView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal14CanvasGridView_audioRecorder, &qword_100804048);
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal14CanvasGridView_waveformProvider, (uint64_t *)&unk_100804050);
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal14CanvasGridView_delegate);
  swift_weakDestroy();
  swift_weakDestroy();

  swift_release();
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal14CanvasGridView_gridDataSource);
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  char v3 = sub_10037F920();

  return v3 & 1;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  swift_unknownObjectRetain();
  v12 = self;
  sub_100385698();

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_10001B284(0, (unint64_t *)&unk_10080A1F8);
  v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v13.super.isa;
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  return [a4 canLoadObjectsOfClass:swift_getObjCClassFromMetadata()] ^ 1;
}

- (id)collectionView:(void *)a3 dragPreviewParametersForItemAtIndexPath:
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a1;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  id v12 = [v9 cellForItemAtIndexPath:isa];

  if (v12)
  {
    type metadata accessor for MosaicCell();
    if (swift_dynamicCastClass()) {
      id v13 = sub_100046F9C();
    }
    else {
      id v13 = 0;
    }

    id v9 = v10;
  }
  else
  {
    id v13 = 0;
    id v12 = v10;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v13;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_100382A80(v6, a4);

  swift_unknownObjectRelease();
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9 = sub_100010218((uint64_t *)&unk_1007FD5D0);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for IndexPath();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for IndexPath();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  swift_unknownObjectRetain();
  uint64_t v15 = self;
  id v16 = sub_100385ABC(v14, a4);

  swift_unknownObjectRelease();
  sub_10001457C((uint64_t)v11, (uint64_t *)&unk_1007FD5D0);

  return v16;
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
  sub_1003831F8(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end