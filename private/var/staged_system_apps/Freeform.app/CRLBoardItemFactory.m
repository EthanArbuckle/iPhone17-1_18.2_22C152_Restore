@interface CRLBoardItemFactory
- (NSUUID)rootContainerUUID;
- (_TtC8Freeform17CRLBoardDataStore)store;
- (_TtC8Freeform19CRLBoardItemFactory)init;
- (_TtP8Freeform14CRLAssetOwning_)assetOwner;
- (id)blockToRunCommandToPostProcessWithNewBoardItem:(id)a3 shapeType:(int64_t)a4 infosToConnect:(id)a5 commandController:(id)a6;
- (id)makeDuplicateOfBoardItem:(id)a3;
- (id)makeDuplicateOfBoardItems:(id)a3;
- (id)makeDuplicateOfBoardItems:(id)a3 UUIDRemappingBlock:(id)a4;
- (id)makeFileItemWithFileData:(id)a3 posterImageData:(id)a4 title:(id)a5 geometry:(id)a6;
- (id)makeFreehandDrawingItemWithGeometry:(id)a3;
- (id)makeGroupItemWithGeometry:(id)a3;
- (id)makeImageItemWithGeometry:(id)a3 imageData:(id)a4 thumbnailData:(id)a5;
- (id)makeMovieItemWithGeometry:(id)a3 movieData:(id)a4 posterImageData:(id)a5 posterTime:(double)a6;
- (id)makeShapeItemForDiagramWithConnectingTo:(id)a3 with:(id)a4 shapeType:(int64_t)a5;
- (id)makeShapeItemForFreehandDrawingWithPathSource:(id)a3 position:(CGPoint)a4 stroke:(id)a5 fill:(id)a6 pencilKitStrokePathCompactData:(id)a7 maskPath:(id)a8;
- (id)makeShapeItemForShapeLibrarySwatchWithShapeType:(int64_t)a3 pathSource:(id)a4 position:(CGPoint)a5 angleInDegrees:(double)a6;
- (id)makeShapeItemWithShapeType:(int64_t)a3;
- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4;
- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4 position:(CGPoint)a5;
- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4 preservePathSourceSize:(BOOL)a5 position:(CGPoint)a6;
- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4 preservePathSourceSize:(BOOL)a5 position:(CGPoint)a6 angleInDegrees:(double)a7;
- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4 preservePathSourceSize:(BOOL)a5 position:(CGPoint)a6 angleInDegrees:(double)a7 stroke:(id)a8 fill:(id)a9 headLineEnd:(id)a10 tailLineEnd:(id)a11;
- (id)makeShapeItemsForFreehandDrawingWithPKStroke:(id)a3 adjustedBaseWidth:(double)a4;
- (id)makeShapeItemsForFreehandDrawingWithPKStroke:(id)a3 unadjustedPencilKitBaseWidth:(double)a4;
- (id)makeStickyNoteItem;
- (id)makeStickyNoteItemWithAttributedString:(id)a3;
- (id)makeTextBoxItemWithStorage:(id)a3;
- (id)makeTextboxItemWithAttributedString:(id)a3;
- (id)makeTextboxItemWithPosition:(CGPoint)a3 string:(id)a4;
- (id)makeTextboxItemWithString:(id)a3;
- (id)makeURLItemWithGeometry:(id)a3 metadataAsset:(id)a4 url:(id)a5;
@end

@implementation CRLBoardItemFactory

- (_TtC8Freeform17CRLBoardDataStore)store
{
  return (_TtC8Freeform17CRLBoardDataStore *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.isa
                                                                                                + OBJC_IVAR____TtC8Freeform19CRLBoardItemFactory_board)
                                                                                     + OBJC_IVAR____TtC8Freeform8CRLBoard_store));
}

- (NSUUID)rootContainerUUID
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(char **)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLBoardItemFactory_board)
                + OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer);
  v9 = *(void (**)(uint64_t))(**(void **)&v8[OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData] + 256);
  v10 = self;
  v11 = v8;
  uint64_t v12 = swift_retain();
  v9(v12);

  swift_release();
  v13.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return (NSUUID *)v13.super.isa;
}

- (_TtP8Freeform14CRLAssetOwning_)assetOwner
{
  return (_TtP8Freeform14CRLAssetOwning_ *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC8Freeform19CRLBoardItemFactory_board));
}

- (id)makeGroupItemWithGeometry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_100F3E34C(v4);

  return v6;
}

- (id)makeFreehandDrawingItemWithGeometry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_100F3FDCC(v4);

  return v6;
}

- (id)makeImageItemWithGeometry:(id)a3 imageData:(id)a4 thumbnailData:(id)a5
{
  uint64_t v9 = sub_1005057FC((uint64_t *)&unk_10167D2B0);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for CRLAssetData();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = a3;
  id v19 = a4;
  v20 = self;
  id v21 = a5;
  sub_100F3FFF0((uint64_t)v19, (uint64_t)v17);
  if (v21)
  {
    id v22 = v21;
    sub_100F3FFF0((uint64_t)v22, (uint64_t)v12);

    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v23 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, v23, 1, v13);
  id v24 = sub_100F4026C(v18, (uint64_t)v17, (uint64_t)v12);
  sub_100522F00((uint64_t)v12, (uint64_t *)&unk_10167D2B0);
  sub_100F47390((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for CRLAssetData);

  return v24;
}

- (id)makeMovieItemWithGeometry:(id)a3 movieData:(id)a4 posterImageData:(id)a5 posterTime:(double)a6
{
  uint64_t v11 = sub_1005057FC((uint64_t *)&unk_10167D2B0);
  __chkstk_darwin(v11 - 8, v12);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for CRLAssetData();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  id v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v20 = a3;
  id v21 = a4;
  id v22 = self;
  id v23 = a5;
  sub_100F3FFF0((uint64_t)v21, (uint64_t)v19);
  if (v23)
  {
    id v24 = v23;
    sub_100F3FFF0((uint64_t)v24, (uint64_t)v14);

    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, v25, 1, v15);
  id v26 = sub_100F40818(v20, (uint64_t)v19, (uint64_t)v14, a6);
  sub_100522F00((uint64_t)v14, (uint64_t *)&unk_10167D2B0);
  sub_100F47390((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for CRLAssetData);

  return v26;
}

- (id)makeShapeItemWithShapeType:(int64_t)a3
{
  uint64_t v5 = sub_1005057FC((uint64_t *)&unk_101674610);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CRLWPStorageCRDTData(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_1005C6DF0((uint64_t)v14);
  sub_10051B3EC((uint64_t)v14, (uint64_t)v13, &qword_10168D670);
  uint64_t v10 = self;
  id v11 = sub_100F40DC0(a3, 0, 0, 0, 0, 0, 1, 0, 1, (void *)1, (void *)1, (void *)1, (void *)1, 0, v8, v13, 0, 0, 0);
  sub_100522F00((uint64_t)v8, (uint64_t *)&unk_101674610);

  return v11;
}

- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4
{
  uint64_t v7 = sub_1005057FC((uint64_t *)&unk_101674610);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for CRLWPStorageCRDTData(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  sub_1005C6DF0((uint64_t)v17);
  sub_10051B3EC((uint64_t)v17, (uint64_t)v16, &qword_10168D670);
  id v12 = a4;
  uint64_t v13 = self;
  id v14 = sub_100F40DC0(a3, 0, (uint64_t)a4, 0, 0, 0, 1, 0, 1, (void *)1, (void *)1, (void *)1, (void *)1, 0, v10, v16, 0, 0, 0);
  sub_100522F00((uint64_t)v10, (uint64_t *)&unk_101674610);

  return v14;
}

- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4 position:(CGPoint)a5
{
  uint64_t v5 = *(void *)&a5.y;
  uint64_t v6 = *(void *)&a5.x;
  uint64_t v10 = sub_1005057FC((uint64_t *)&unk_101674610);
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v13 = (char *)&v20[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for CRLWPStorageCRDTData(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  sub_1005C6DF0((uint64_t)v21);
  sub_10051B3EC((uint64_t)v21, (uint64_t)v20, &qword_10168D670);
  id v15 = a4;
  uint64_t v16 = self;
  id v17 = sub_100F40DC0(a3, 0, (uint64_t)a4, 0, v6, v5, 0, 0, 1, (void *)1, (void *)1, (void *)1, (void *)1, 0, v13, v20, 0, 0, 0);
  sub_100522F00((uint64_t)v13, (uint64_t *)&unk_101674610);

  return v17;
}

- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4 preservePathSourceSize:(BOOL)a5 position:(CGPoint)a6
{
  uint64_t v6 = *(void *)&a6.y;
  uint64_t v7 = *(void *)&a6.x;
  BOOL v21 = a5;
  uint64_t v11 = sub_1005057FC((uint64_t *)&unk_101674610);
  __chkstk_darwin(v11 - 8, v12);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for CRLWPStorageCRDTData(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  sub_1005C6DF0((uint64_t)v23);
  sub_10051B3EC((uint64_t)v23, (uint64_t)v22, &qword_10168D670);
  id v16 = a4;
  id v17 = self;
  id v18 = sub_100F40DC0(a3, 0, (uint64_t)a4, v21, v7, v6, 0, 0, 1, (void *)1, (void *)1, (void *)1, (void *)1, 0, v14, v22, 0, 0, 0);
  sub_100522F00((uint64_t)v14, (uint64_t *)&unk_101674610);

  return v18;
}

- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4 preservePathSourceSize:(BOOL)a5 position:(CGPoint)a6 angleInDegrees:(double)a7
{
  uint64_t v8 = *(void *)&a6.y;
  uint64_t v9 = *(void *)&a6.x;
  BOOL v23 = a5;
  uint64_t v22 = a3;
  uint64_t v12 = sub_1005057FC((uint64_t *)&unk_101674610);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for CRLWPStorageCRDTData(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  sub_1005C6DF0((uint64_t)v25);
  sub_10051B3EC((uint64_t)v25, (uint64_t)v24, &qword_10168D670);
  id v17 = a4;
  id v18 = self;
  id v19 = sub_100F40DC0(v22, 0, (uint64_t)a4, v23, v9, v8, 0, *(uint64_t *)&a7, 0, (void *)1, (void *)1, (void *)1, (void *)1, 0, v15, v24, 0, 0, 0);
  sub_100522F00((uint64_t)v15, (uint64_t *)&unk_101674610);

  return v19;
}

- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4 preservePathSourceSize:(BOOL)a5 position:(CGPoint)a6 angleInDegrees:(double)a7 stroke:(id)a8 fill:(id)a9 headLineEnd:(id)a10 tailLineEnd:(id)a11
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  BOOL v37 = a5;
  uint64_t v36 = a3;
  v34 = self;
  uint64_t v18 = sub_1005057FC((uint64_t *)&unk_101674610);
  __chkstk_darwin(v18 - 8, v19);
  uint64_t v21 = (char *)&v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = *(void *)&y;
  uint64_t v33 = *(void *)&x;
  uint64_t v35 = *(void *)&a7;
  uint64_t v22 = type metadata accessor for CRLWPStorageCRDTData(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  sub_1005C6DF0((uint64_t)v39);
  sub_10051B3EC((uint64_t)v39, (uint64_t)v38, &qword_10168D670);
  id v31 = a4;
  id v30 = a8;
  id v29 = a9;
  id v23 = a10;
  id v24 = a11;
  uint64_t v25 = v34;
  id v26 = sub_100F40DC0(v36, 0, (uint64_t)a4, v37, v33, v32, 0, v35, 0, a8, a9, a10, a11, 0, v21, v38, 0, 0, 0);
  sub_100522F00((uint64_t)v21, (uint64_t *)&unk_101674610);

  return v26;
}

- (id)makeShapeItemForShapeLibrarySwatchWithShapeType:(int64_t)a3 pathSource:(id)a4 position:(CGPoint)a5 angleInDegrees:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  id v11 = a4;
  uint64_t v12 = self;
  id v13 = sub_100F432B0(a3, (uint64_t)v11, x, y, a6);

  return v13;
}

- (id)makeShapeItemForFreehandDrawingWithPathSource:(id)a3 position:(CGPoint)a4 stroke:(id)a5 fill:(id)a6 pencilKitStrokePathCompactData:(id)a7 maskPath:(id)a8
{
  double y = a4.y;
  double x = a4.x;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = self;
  id v21 = sub_100F4370C((uint64_t)v15, a5, a6, a7, a8, x, y);

  return v21;
}

- (id)makeShapeItemsForFreehandDrawingWithPKStroke:(id)a3 adjustedBaseWidth:(double)a4
{
  return sub_100F43A38(self, a4, (uint64_t)a2, a3, (SEL *)&selRef_freehandDrawingShapeItemsFromPKStroke_adjustedBaseWidth_boardItemFactory_);
}

- (id)makeShapeItemsForFreehandDrawingWithPKStroke:(id)a3 unadjustedPencilKitBaseWidth:(double)a4
{
  return sub_100F43A38(self, a4, (uint64_t)a2, a3, (SEL *)&selRef_freehandDrawingShapeItemsFromPKStroke_unadjustedPencilKitBaseWidth_boardItemFactory_);
}

- (id)makeShapeItemForDiagramWithConnectingTo:(id)a3 with:(id)a4 shapeType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = sub_100F3F60C(v8, v9, a5);

  return v11;
}

- (id)blockToRunCommandToPostProcessWithNewBoardItem:(id)a3 shapeType:(int64_t)a4 infosToConnect:(id)a5 commandController:(id)a6
{
  type metadata accessor for CRLBoardItem(0);
  unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v11 = sub_100F47148(a4);
  id v12 = a3;
  id v13 = a6;
  uint64_t v14 = self;
  if (v11 && (type metadata accessor for CRLConnectionLineItem(), (uint64_t v15 = swift_dynamicCastClass()) != 0))
  {
    uint64_t v16 = v15;
    if (v10 >> 62)
    {
      id v24 = v12;
      swift_bridgeObjectRetain();
      uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v25 > 0) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v17 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v18 = v12;
      if (v17 > 0)
      {
LABEL_5:
        id v19 = (void *)swift_allocObject();
        v19[2] = v13;
        v19[3] = v16;
        v19[4] = v10;

        uint64_t v20 = sub_100F471C8;
        goto LABEL_8;
      }
    }

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  id v19 = 0;
  uint64_t v20 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:);
LABEL_8:
  id v21 = v20;

  v26[4] = v21;
  v26[5] = v19;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = *(void *)"";
  v26[2] = sub_100679958;
  v26[3] = &unk_101533FB8;
  uint64_t v22 = _Block_copy(v26);
  swift_release();

  return v22;
}

- (id)makeTextboxItemWithString:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = self;
  uint64_t v5 = (void *)sub_100F3D7EC();

  swift_bridgeObjectRelease();

  return v5;
}

- (id)makeTextboxItemWithPosition:(CGPoint)a3 string:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = self;
  id v8 = (void *)sub_100F442A4(x, y);

  swift_bridgeObjectRelease();

  return v8;
}

- (id)makeTextboxItemWithAttributedString:(id)a3
{
  id v4 = (char *)a3;
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_100F3E9C8(v4);

  return v6;
}

- (id)makeTextBoxItemWithStorage:(id)a3
{
  uint64_t v5 = type metadata accessor for CRLWPShapeItemCRDTData(0);
  __chkstk_darwin(v5, v6);
  id v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for CRLWPStorageCRDTData(0);
  __n128 v12 = __chkstk_darwin(v9 - 8, v10);
  uint64_t v14 = &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = *(void *)((char *)a3 + OBJC_IVAR____TtC8Freeform12CRLWPStorage_shapeItemData);
  if (v15)
  {
    (*(void (**)(__n128))(*(void *)v15 + 760))(v12);
    sub_100F472F0((uint64_t)&v8[*(int *)(v5 + 20)], (uint64_t)v14, type metadata accessor for CRLWPStorageCRDTData);
    id v16 = a3;
    uint64_t v17 = self;
    sub_100F47390((uint64_t)v8, type metadata accessor for CRLWPShapeItemCRDTData);
    sub_1005C6DF0((uint64_t)v19);
    sub_10051B3EC((uint64_t)v19, (uint64_t)v20, &qword_10168D670);
    id v18 = (void *)sub_100F3DD74((uint64_t)v14, v20);
    sub_100F47390((uint64_t)v14, type metadata accessor for CRLWPStorageCRDTData);

    return v18;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)makeStickyNoteItem
{
  id v3 = objc_allocWithZone((Class)NSAttributedString);
  id v4 = self;
  id v5 = [v3 init];
  uint64_t v7 = sub_100F3EB94((uint64_t)v5, v6);

  return v7;
}

- (id)makeStickyNoteItemWithAttributedString:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v7 = sub_100F3EB94((uint64_t)v4, v6);

  return v7;
}

- (id)makeFileItemWithFileData:(id)a3 posterImageData:(id)a4 title:(id)a5 geometry:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  __n128 v12 = self;
  uint64_t v13 = (void *)sub_100F46CF4((uint64_t)v9, (uint64_t)v10, v11);

  return v13;
}

- (id)makeURLItemWithGeometry:(id)a3 metadataAsset:(id)a4 url:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  __n128 v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  id v16 = sub_100F4491C(v13, (uint64_t)a4, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);

  return v16;
}

- (id)makeDuplicateOfBoardItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = (void *)sub_100F3DF34(v4);

  return v6;
}

- (id)makeDuplicateOfBoardItems:(id)a3
{
  type metadata accessor for CRLBoardItem(0);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = self;
  unint64_t v6 = sub_100F44C54(v4, 0, 0);

  swift_bridgeObjectRelease();
  if (v6)
  {
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

- (id)makeDuplicateOfBoardItems:(id)a3 UUIDRemappingBlock:(id)a4
{
  id v5 = (void (*)(id))_Block_copy(a4);
  type metadata accessor for CRLBoardItem(0);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    id v5 = (void (*)(id))sub_100895C4C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = self;
  unint64_t v9 = sub_100F44C54(v6, v5, v7);
  sub_1005174AC((uint64_t)v5);

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v10.super.isa = 0;
  }

  return v10.super.isa;
}

- (_TtC8Freeform19CRLBoardItemFactory)init
{
  id result = (_TtC8Freeform19CRLBoardItemFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100F47390((uint64_t)self + OBJC_IVAR____TtC8Freeform19CRLBoardItemFactory_insertStyleSettings, type metadata accessor for CRLBoardInsertStyleData);
}

@end