@interface CRLiOSPencilMediator
- (BOOL)prefersPencilOnlyDrawing;
- (BOOL)shouldAllowNativeHoverPreviewAtUnscaledPoint:(CGPoint)a3;
- (BOOL)shouldAllowPencilKitHoverPreviewAtUnscaledPoint:(CGPoint)a3;
- (_TtC8Freeform20CRLiOSPencilMediator)init;
- (_TtC8Freeform20CRLiOSPencilMediator)initWithInteractiveCanvasController:(id)a3;
- (unint64_t)pencilBehaviorOutsideModesAtUnscaledPoint:(CGPoint)a3;
- (unint64_t)pencilModeToBeginFromToolbarItem;
- (void)dealloc;
- (void)fingerUsedForFreehandDrawingMode;
- (void)indirectTouchUsedForFreehandDrawingMode;
- (void)markPencilUsedForMode:(unint64_t)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCurrentPencilModeType:(unint64_t)a3;
- (void)setNextPencilModeType:(unint64_t)a3;
- (void)teardown;
@end

@implementation CRLiOSPencilMediator

- (_TtC8Freeform20CRLiOSPencilMediator)initWithInteractiveCanvasController:(id)a3
{
  return (_TtC8Freeform20CRLiOSPencilMediator *)CRLiOSPencilMediator.init(interactiveCanvasController:)(a3);
}

- (_TtC8Freeform20CRLiOSPencilMediator)init
{
}

- (void)teardown
{
  v2 = self;
  CRLiOSPencilMediator.teardown()();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  char v4 = *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLiOSPencilMediator_wasTeardownCalled);
  v5 = self;
  if ((v4 & 1) == 0)
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSPencilMediator.swift", 91, 2, 54, (uint64_t)"Must call teardown() before CRLiOSPencilMediator is deinitialized.", 66, 2u, (uint64_t)_swiftEmptyArrayStorage);
    LOBYTE(v8) = 2;
    v6 = "Must call teardown() before CRLiOSPencilMediator is deinitialized.";
    uint64_t v7 = 66;
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSPencilMediator.swift", 91, 2, 54);
  }
  v9.receiver = v5;
  v9.super_class = ObjectType;
  [(CRLiOSPencilMediator *)&v9 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();

  swift_bridgeObjectRelease();
}

- (BOOL)prefersPencilOnlyDrawing
{
  v2 = self;

  return [v2 prefersPencilOnlyDrawing];
}

- (void)setCurrentPencilModeType:(unint64_t)a3
{
  char v4 = self;
  CRLiOSPencilMediator.setCurrentPencilModeType(_:)(a3);
}

- (void)setNextPencilModeType:(unint64_t)a3
{
  char v4 = self;
  if (a3)
  {
    sub_100742780(a3);
  }
  else
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"setNextPencilModeType(_:)", 25, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSPencilMediator.swift", 91, 2, 113, (uint64_t)"Should not call setNextPencilModeType() with modeType none.", 59, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"setNextPencilModeType(_:)", 25, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSPencilMediator.swift", 91, 2, 113);
  }
}

- (void)markPencilUsedForMode:(unint64_t)a3
{
  char v4 = self;
  CRLiOSPencilMediator.markPencilUsed(for:)(a3);
}

- (void)fingerUsedForFreehandDrawingMode
{
  v2 = self;
  CRLiOSPencilMediator.fingerUsedForFreehandDrawingMode()();
}

- (void)indirectTouchUsedForFreehandDrawingMode
{
  v2 = self;
  CRLiOSPencilMediator.indirectTouchUsedForFreehandDrawingMode()();
}

- (unint64_t)pencilModeToBeginFromToolbarItem
{
  v2 = self;
  unint64_t v3 = CRLiOSPencilMediator.pencilModeToBeginFromToolbarItem.getter();

  return v3;
}

- (unint64_t)pencilBehaviorOutsideModesAtUnscaledPoint:(CGPoint)a3
{
  unint64_t v3 = self;
  CRLiOSPencilMediator.pencilBehaviorOutsideModes(at:)();
  unint64_t v5 = v4;

  return v5;
}

- (BOOL)shouldAllowPencilKitHoverPreviewAtUnscaledPoint:(CGPoint)a3
{
  unint64_t v3 = self;
  BOOL v4 = CRLiOSPencilMediator.shouldAllowPencilKitHoverPreview(at:)();

  return v4;
}

- (BOOL)shouldAllowNativeHoverPreviewAtUnscaledPoint:(CGPoint)a3
{
  unint64_t v3 = self;
  sub_100743404();
  uint64_t v5 = v4;

  return (unint64_t)(v5 - 1) < 2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_100744078();
  v15 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

LABEL_8:
  CRLiOSPencilMediator.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10052E2B0((uint64_t)v18);
}

@end