@interface CRLFreehandDrawingItem
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)isFreehandDrawing;
- (BOOL)isGEnerativePlaygroundImageItem;
- (BOOL)prohibitsClustering;
- (BOOL)requiresAdditionalBoardItemsForCopyImaging;
- (BOOL)shouldBeTreatedAsBoxForConnectionLinesForPerf;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (PKDrawing)cachedPKDrawing;
- (PKRecognitionController)pkRecognitionController;
- (_TtC8Freeform22CRLFreehandDrawingItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 geometry:(id)a5;
- (id)_duplicateEmptyWithNewParentContainerUUID:(id)a3 uuidRemapHelper:(id)a4 error:(id *)a5;
- (void)_willAddNewItemWithItem:(id)a3;
- (void)setCachedPKDrawing:(id)a3;
- (void)setPkRecognitionController:(id)a3;
- (void)setProhibitsClustering:(BOOL)a3;
@end

@implementation CRLFreehandDrawingItem

- (PKRecognitionController)pkRecognitionController
{
  return (PKRecognitionController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                            + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_pkRecognitionController));
}

- (void)setPkRecognitionController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_pkRecognitionController);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_pkRecognitionController) = (Class)a3;
  id v3 = a3;
}

- (PKDrawing)cachedPKDrawing
{
  uint64_t v3 = sub_1005057FC(&qword_1016842F0);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_cachedPKDrawing;
  swift_beginAccess();
  sub_100522E9C((uint64_t)v7, (uint64_t)v6, &qword_1016842F0);
  uint64_t v8 = type metadata accessor for PKDrawing();
  uint64_t v9 = *(void *)(v8 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    Class isa = PKDrawing._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return (PKDrawing *)isa;
}

- (void)setCachedPKDrawing:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_1016842F0);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v9 = self;
    id v10 = a3;
    static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v11 = type metadata accessor for PKDrawing();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for PKDrawing();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
    v13 = self;
  }
  v14 = (char *)self + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_cachedPKDrawing;
  swift_beginAccess();
  sub_1006063BC((uint64_t)v8, (uint64_t)v14, &qword_1016842F0);
  swift_endAccess();
}

- (BOOL)prohibitsClustering
{
  uint64_t v3 = type metadata accessor for CRLFreehandDrawingCRDTData(0);
  __chkstk_darwin(v3, v4);
  uint64_t v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for CRLFreehandItemData(0);
  uint64_t v7 = swift_dynamicCastClassUnconditional() + qword_10171CE48;
  swift_beginAccess();
  sub_1009E24DC(v7, (uint64_t)v6, type metadata accessor for CRLFreehandDrawingCRDTData);
  uint64_t v8 = self;
  sub_1005057FC((uint64_t *)&unk_101689310);
  CRRegister.wrappedValue.getter();
  char v9 = v11[7];
  sub_1009E3168((uint64_t)v6, type metadata accessor for CRLFreehandDrawingCRDTData);

  return v9;
}

- (void)setProhibitsClustering:(BOOL)a3
{
  uint64_t v3 = self;
  sub_1009DF888();
}

- (BOOL)shouldBeTreatedAsBoxForConnectionLinesForPerf
{
  uint64_t v3 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems;
  uint64_t v4 = *(double **)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems);
  uint64_t v5 = self;
  if (!v4)
  {
    sub_100846AB0();
    uint64_t v4 = *(double **)((char *)&self->super.super.super.super.super.isa + v3);
  }
  if (v4) {
    unint64_t v6 = (unint64_t)v4;
  }
  else {
    unint64_t v6 = (unint64_t)_swiftEmptyArrayStorage;
  }
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v7 > 500;
}

- (Class)layoutClass
{
  sub_10050BF48(0, &qword_10168AB90);

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  sub_10050BF48(0, &qword_10168AB88);

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)editorClass
{
  sub_10050BF48(0, &qword_10168AB80);

  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (id)_duplicateEmptyWithNewParentContainerUUID:(id)a3 uuidRemapHelper:(id)a4 error:(id *)a5
{
  uint64_t v8 = sub_1005057FC((uint64_t *)&unk_101674520);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a4;
  uint64_t v15 = self;
  id v16 = sub_1009DFC20((uint64_t)v11, (uint64_t)v14);
  sub_100522F00((uint64_t)v11, (uint64_t *)&unk_101674520);

  return v16;
}

- (void)_willAddNewItemWithItem:(id)a3
{
  type metadata accessor for CRLFreehandDrawingShapeItem();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = a3;
  uint64_t v7 = self;
  if (([v6 isKindOfClass:ObjCClassFromMetadata] & 1) == 0)
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"_willAddNewItem(item:)", 22, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingItem.swift", 93, 2, 90, (uint64_t)"All items inserted into a freehand drawing should be freehand drawing shapes.", 77, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"_willAddNewItem(item:)", 22, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingItem.swift", 93, 2, 90);
  }
}

- (BOOL)isFreehandDrawing
{
  return 1;
}

- (BOOL)requiresAdditionalBoardItemsForCopyImaging
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_pkRecognitionController));
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_cachedPKDrawing, &qword_1016842F0);
}

- (_TtC8Freeform22CRLFreehandDrawingItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 geometry:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = a5;
  return (_TtC8Freeform22CRLFreehandDrawingItem *)sub_1009E1C04((uint64_t)v11, (uint64_t)v10, a5);
}

- (BOOL)isGEnerativePlaygroundImageItem
{
  return 1;
}

@end