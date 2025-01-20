@interface CRLFreehandDrawingShapeItem
+ (id)crlaxDescriptionFor:(id)a3;
- (BOOL)canSnapToShape;
- (BOOL)excludedFromMultiselectResizeInfo;
- (BOOL)hasSnappedToShape;
- (BOOL)isAllowedInFreehandDrawings;
- (BOOL)isFreehandDrawingShape;
- (BOOL)shouldForceStrokesToPencilKit;
- (CRLBezierPath)maskPath;
- (CRLCanvasInfoGeometry)geometry;
- (CRLPKStrokePathCompactData)pencilKitStrokePathCompactData;
- (CRLPathSource)pathSource;
- (CRLStroke)stroke;
- (NSArray)pencilKitStrokes;
- (NSArray)pencilKitStrokesInParentSpace;
- (NSArray)pencilKitStrokesInRootSpace;
- (NSString)localizedName;
- (_TtC8Freeform27CRLFreehandDrawingShapeItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 geometry:(id)a5 pathSource:(id)a6 fill:(id)a7 stroke:(id)a8 headLineEnd:(id)a9 tailLineEnd:(id)a10 pencilKitStrokePathCompactData:(id)a11 maskPath:(id)a12;
- (id)commandsToUpdateModelToMatch:(id)a3;
- (int64_t)snappedShapeType;
- (void)setGeometry:(id)a3;
- (void)setMaskPath:(id)a3;
- (void)setPathSource:(id)a3;
- (void)setPencilKitStrokePathCompactData:(id)a3;
- (void)setSnappedShapeType:(int64_t)a3;
- (void)setStroke:(id)a3;
@end

@implementation CRLFreehandDrawingShapeItem

- (BOOL)isAllowedInFreehandDrawings
{
  return 1;
}

- (BOOL)excludedFromMultiselectResizeInfo
{
  return 1;
}

- (BOOL)shouldForceStrokesToPencilKit
{
  return 1;
}

- (BOOL)isFreehandDrawingShape
{
  v2 = self;
  sub_100CEF904();

  return 1;
}

- (NSString)localizedName
{
  v2 = self;
  sub_100CEFAE4();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSArray)pencilKitStrokes
{
  return (NSArray *)sub_100CF2884(self, (uint64_t)a2, sub_100CF2164);
}

- (NSArray)pencilKitStrokesInParentSpace
{
  v2 = self;
  uint64_t v3 = sub_100CFA714();
  swift_bridgeObjectRetain();

  if (v3)
  {
    type metadata accessor for PKStroke();
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (NSArray)pencilKitStrokesInRootSpace
{
  return (NSArray *)sub_100CF2884(self, (uint64_t)a2, (uint64_t (*)(void))sub_100CF28FC);
}

- (CRLCanvasInfoGeometry)geometry
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&self->super.super.super.super.super.isa
                                                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                         + 288);
  uint64_t v3 = self;
  uint64_t v4 = swift_retain();
  v5 = (void *)v2(v4);

  swift_release();

  return (CRLCanvasInfoGeometry *)v5;
}

- (void)setGeometry:(id)a3
{
  id v8 = a3;
  uint64_t v4 = self;
  sub_10088AA40(v8);
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong
    && (v6 = Strong, char v7 = (*(uint64_t (**)(void))((swift_isaMask & *Strong) + 0x2F0))(),
                     v6,
                     (v7 & 1) != 0))
  {
  }
  else
  {
    *(Class *)((char *)&v4->super.super.super.super.super.isa
             + OBJC_IVAR____TtC8Freeform27CRLFreehandDrawingShapeItem_cachedPencilKitStrokesInParentSpace) = 0;

    swift_bridgeObjectRelease();
  }
}

- (CRLStroke)stroke
{
  v2 = self;
  uint64_t v3 = (void *)sub_100CF2FD8();

  return (CRLStroke *)v3;
}

- (void)setStroke:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_100CFA3E8(a3);
}

- (CRLPathSource)pathSource
{
  uint64_t v3 = **(void **)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  result = (CRLPathSource *)swift_conformsToProtocol2();
  if (result)
  {
    v5 = *(uint64_t (**)(uint64_t))(v3 + 704);
    id v6 = self;
    uint64_t v7 = swift_retain();
    id v8 = (void *)v5(v7);

    swift_release();
    return (CRLPathSource *)v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setPathSource:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_100CFA4C8(v5);
}

- (CRLPKStrokePathCompactData)pencilKitStrokePathCompactData
{
  v2 = self;
  uint64_t v3 = (void *)sub_100CF3390();

  return (CRLPKStrokePathCompactData *)v3;
}

- (void)setPencilKitStrokePathCompactData:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100CF369C(a3);
}

- (CRLBezierPath)maskPath
{
  v2 = self;
  id v3 = sub_100CF3D0C();

  return (CRLBezierPath *)v3;
}

- (void)setMaskPath:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100CF4044(a3);
}

- (BOOL)canSnapToShape
{
  v2 = self;
  BOOL v3 = sub_100CF46D4();

  return v3;
}

- (BOOL)hasSnappedToShape
{
  uint64_t v3 = type metadata accessor for CRLShapeItemParentAffinity(0);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1005057FC(&qword_1016892B0);
  __chkstk_darwin(v8, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  if (*(_UNKNOWN ****)v12 != &off_101676660) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v12 + *(void *)(*(void *)v12 + 632);
  swift_beginAccess();
  sub_100522E9C(v13, (uint64_t)v11, &qword_1016892B0);
  v14 = self;
  sub_1005057FC(&qword_101686808);
  CRRegister.wrappedValue.getter();
  sub_100522F00((uint64_t)v11, &qword_1016892B0);
  int v15 = v7[*(int *)(v4 + 36) + 8];
  sub_100CFA604((uint64_t)v7, type metadata accessor for CRLShapeItemParentAffinity);

  return v15 != 255;
}

- (int64_t)snappedShapeType
{
  v2 = self;
  int64_t v3 = sub_100CF4A94();

  return v3;
}

- (void)setSnappedShapeType:(int64_t)a3
{
  uint64_t v4 = self;
  sub_100CF4C98(a3);
}

- (id)commandsToUpdateModelToMatch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_100CF4F14((uint64_t)v4);

  return v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform27CRLFreehandDrawingShapeItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 geometry:(id)a5 pathSource:(id)a6 fill:(id)a7 stroke:(id)a8 headLineEnd:(id)a9 tailLineEnd:(id)a10 pencilKitStrokePathCompactData:(id)a11 maskPath:(id)a12
{
  v31[0] = a8;
  v31[1] = self;
  uint64_t v16 = type metadata accessor for UUID();
  __chkstk_darwin(v16 - 8, v17);
  v19 = (char *)v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v20 = a3;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = v31[0];
  id v25 = v31[0];
  id v26 = a9;
  id v27 = a10;
  id v28 = a11;
  id v29 = a12;
  return (_TtC8Freeform27CRLFreehandDrawingShapeItem *)sub_100CF58F4((uint64_t)v20, (uint64_t)v19, v21, v22, a7, v24, a9, a10, a11, a12);
}

+ (id)crlaxDescriptionFor:(id)a3
{
  type metadata accessor for CRLFreehandDrawingShapeItem();
  sub_100CFA664(&qword_101699E00, (void (*)(uint64_t))type metadata accessor for CRLFreehandDrawingShapeItem);
  uint64_t v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = _swiftEmptyDictionarySingleton;
  sub_100CEEDA4(v3, (uint64_t *)&v9);
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_100CEF0AC(v4, (uint64_t *)&v9);
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_10058FEB0(v5);
  swift_bridgeObjectRelease();
  sub_1009D7100((uint64_t)v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v7;
}

@end