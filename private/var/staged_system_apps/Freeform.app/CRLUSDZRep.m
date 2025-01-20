@interface CRLUSDZRep
- (BOOL)canBeOccluded;
- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4;
- (BOOL)crlaxShouldSetAccessibilityFrameWithFrameInUnscaledCanvasForMarqueeSelecting;
- (BOOL)directlyManagesContentPlatformView;
- (BOOL)directlyManagesVisibilityOfKnob:(id)a3;
- (BOOL)forcesPlacementOnTop;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)isAccessibilityElement;
- (BOOL)manuallyControlsMiniFormatter;
- (BOOL)occludesSelectedRep;
- (BOOL)replacingInterfaceAllowsMultipleSelection;
- (BOOL)shouldShowKnobs;
- (BOOL)shouldShowMediaReplaceUI;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)shouldSuppressSelectionHighlightDuringMultiselection;
- (BOOL)wantsContentPlatformViewEventHandling;
- (BOOL)wantsToHandleDoubleTapsWhenLocked;
- (BOOL)wantsToHandleTapsWhenLocked;
- (CGRect)frameInUnscaledCanvasForMarqueeSelecting;
- (NSArray)additionalRenderablesOverRenderable;
- (NSArray)overlayRenderables;
- (NSString)crlaxLabel;
- (NSString)debugDescription;
- (UIView)contentPlatformView;
- (_TtC8Freeform10CRLUSDZRep)initWithLayout:(id)a3 canvas:(id)a4;
- (_TtC8Freeform11CRLUSDZItem)usdzItem;
- (_TtC8Freeform13CRLUSDZLayout)usdzLayout;
- (id)dynamicResizeDidBegin;
- (id)newTrackerForKnob:(id)a3;
- (id)resizedGeometryForTransform:(CGAffineTransform *)a3;
- (int64_t)preferredReplacingInterfaceKind;
- (int64_t)supportedMediaTypes;
- (uint64_t)canvasWillScroll:(void *)a1;
- (void)addKnobsToArray:(id)a3;
- (void)applicationDidEnterBackground;
- (void)becameNotSelected;
- (void)becameSelected;
- (void)didEndZooming;
- (void)didExitPreviewMode;
- (void)didUpdateRenderable:(id)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)dynamicDragDidBegin;
- (void)dynamicDragDidEnd;
- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3;
- (void)dynamicOperationDidEnd;
- (void)dynamicResizeDidEndWithTracker:(id)a3;
- (void)dynamicRotateDidBegin;
- (void)dynamicRotateDidEndWithTracker:(id)a3;
- (void)dynamicallyRotatingWithTracker:(id)a3;
- (void)enterPreviewMode;
- (void)handleFadeInForZoom;
- (void)handleFadeOutForZoom;
- (void)handleSpinnerTapWithSender:(id)a3;
- (void)hideMiniFormatterIfNecessary;
- (void)interruptRendering;
- (void)prepareForPencilKitSnapshotting;
- (void)processChangedProperty:(unint64_t)a3;
- (void)resumeRendering;
- (void)selectionPathDidChangeWithNotification:(id)a3;
- (void)updateRenderableGeometryFromLayout:(id)a3;
- (void)viewScaleDidChange;
- (void)willBeRemoved;
- (void)willBeginZooming;
@end

@implementation CRLUSDZRep

- (_TtC8Freeform10CRLUSDZRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (_TtC8Freeform10CRLUSDZRep *)sub_100B52080(v5, a4);
}

- (BOOL)forcesPlacementOnTop
{
  return 1;
}

- (BOOL)shouldShowKnobs
{
  if ((*((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_hideKnobsDueToBoundsUpdate) & 1) != 0
    || *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_isZooming) == 1)
  {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
  return [(CRLCanvasRep *)&v3 shouldShowKnobs];
}

- (void)dynamicRotateDidBegin
{
  v2 = self;
  sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"dynamicRotateDidBegin()", 23, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZRep.swift", 81, 2, 1460, (uint64_t)"Unexpected call to dynamicRotateDidBegin.", 41, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"dynamicRotateDidBegin()", 23, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZRep.swift", 81, 2, 1460);
}

- (void)dynamicallyRotatingWithTracker:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"dynamicallyRotating(with:)", 26, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZRep.swift", 81, 2, 1464, (uint64_t)"Unexpected call to dynamicallyRotating.", 39, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"dynamicallyRotating(with:)", 26, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZRep.swift", 81, 2, 1464);
}

- (void)dynamicRotateDidEndWithTracker:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"dynamicRotateDidEnd(with:)", 26, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZRep.swift", 81, 2, 1468, (uint64_t)"Unexpected call to dynamicRotateDidEnd.", 39, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"dynamicRotateDidEnd(with:)", 26, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZRep.swift", 81, 2, 1468);
}

- (BOOL)manuallyControlsMiniFormatter
{
  uint64_t v2 = *(void *)(*(char **)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_knobController)
                 + OBJC_IVAR____TtC8Freeform21CRLUSDZKnobController_playPauseKnob);
  if (v2 && (*(unsigned char *)(v2 + OBJC_IVAR____TtC8Freeform20CRLUSDZPlayPauseKnob_isPlaying) & 1) != 0)
  {
    objc_super v3 = self;
    char v4 = sub_100B67994();
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_100B60A28((uint64_t)v4);

  return self & 1;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  id v4 = self;
  char v5 = sub_100B7057C();

  return v5 & 1;
}

- (void)hideMiniFormatterIfNecessary
{
  uint64_t v2 = self;
  sub_100B60D3C();
}

- (void)interruptRendering
{
  uint64_t v2 = self;
  sub_100B60F10();
}

- (void)resumeRendering
{
  uint64_t v2 = self;
  sub_100B6128C();
}

- (void)applicationDidEnterBackground
{
  uint64_t v2 = self;
  sub_100B5F7B0(0);
  sub_100DE1C38(1);
}

- (BOOL)wantsContentPlatformViewEventHandling
{
  return 0;
}

- (BOOL)occludesSelectedRep
{
  uint64_t v2 = self;
  sub_100B61BD0();
  char v4 = v3;

  return v4 & 1;
}

- (BOOL)canBeOccluded
{
  return 0;
}

- (BOOL)shouldShowSelectionHighlight
{
  return 0;
}

- (BOOL)shouldSuppressSelectionHighlightDuringMultiselection
{
  uint64_t v2 = self;
  char v3 = sub_100B61F48();

  return v3 & 1;
}

- (UIView)contentPlatformView
{
  uint64_t v2 = self;
  id v3 = sub_100B620A4();

  return (UIView *)v3;
}

- (void)handleSpinnerTapWithSender:(id)a3
{
  if (a3)
  {
    id v3 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_100522F00((uint64_t)v4, &qword_101672BF0);
}

- (void)handleFadeOutForZoom
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_isZooming) = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
  id v2 = v3.receiver;
  [(CRLCanvasRep *)&v3 handleFadeOutForZoom];
  sub_100B62C78();
}

- (void)handleFadeInForZoom
{
  id v2 = self;
  sub_100B62AD8();
}

- (void)viewScaleDidChange
{
}

- (BOOL)directlyManagesContentPlatformView
{
  int v2 = *((unsigned __int8 *)&self->super.mCanvas + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_renderingState) >> 6;
  if (v2 == 2) {
    return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_isInteractive);
  }
  if (v2 == 1) {
    return ((*(unsigned char **)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_renderingState))[48] & 0x20) == 0;
  }
  return 0;
}

- (NSArray)additionalRenderablesOverRenderable
{
  int v2 = self;
  sub_100B62F70();

  sub_10050BF48(0, (unint64_t *)&qword_101682130);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void)processChangedProperty:(unint64_t)a3
{
  char v4 = self;
  sub_100B63088(a3);
}

- (void)updateRenderableGeometryFromLayout:(id)a3
{
  id v5 = a3;
  char v4 = self;
  sub_100B632C0((uint64_t)v5);
}

- (NSArray)overlayRenderables
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
  id v2 = v6.receiver;
  NSArray v3 = [(CRLCanvasRep *)&v6 overlayRenderables];
  sub_10050BF48(0, (unint64_t *)&qword_101682130);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (id)resizedGeometryForTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v3;
  v8[2] = *(_OWORD *)&a3->tx;
  NSArray v4 = self;
  sub_100B63BBC((CGFloat *)v8);
  objc_super v6 = v5;

  return v6;
}

- (CGRect)frameInUnscaledCanvasForMarqueeSelecting
{
  id v2 = self;
  [(CRLCanvasRep *)v2 boundsForStandardKnobs];
  -[CRLCanvasRep convertNaturalRectToUnscaledCanvas:](v2, "convertNaturalRectToUnscaledCanvas:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)becameSelected
{
  id v2 = self;
  sub_100B63E38();
}

- (void)becameNotSelected
{
  id v2 = self;
  sub_100B64294();
}

- (void)prepareForPencilKitSnapshotting
{
  id v2 = self;
  sub_100B647AC();
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v7 = self;
  unsigned __int8 v8 = sub_100B64D00(a4, x, y);

  return v8 & 1;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return 1;
}

- (void)didUpdateRenderable:(id)a3
{
  id v5 = a3;
  double v4 = self;
  sub_100B65010((uint64_t)v5);
}

- (void)dynamicDragDidBegin
{
}

- (void)dynamicDragDidEnd
{
}

- (id)dynamicResizeDidBegin
{
  id v2 = self;
  id v3 = sub_100B65B44();

  return v3;
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_100B65C64((uint64_t)a3);
}

- (void)willBeginZooming
{
  id v2 = self;
  sub_100B65EB8();
}

- (void)didEndZooming
{
  id v2 = self;
  sub_100B65FAC();
}

- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
  id v4 = v5.receiver;
  [(CRLCanvasRep *)&v5 dynamicOperationDidBeginWithRealTimeCommands:v3];
  sub_100B55410();
}

- (void)dynamicOperationDidEnd
{
}

- (uint64_t)canvasWillScroll:(void *)a1
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  id v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a1;
  sub_100B55410();

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

- (_TtC8Freeform11CRLUSDZItem)usdzItem
{
  return (_TtC8Freeform11CRLUSDZItem *)sub_100B662AC(self, (uint64_t)a2, (SEL *)&selRef_info, (void (*)(void))type metadata accessor for CRLUSDZItem);
}

- (_TtC8Freeform13CRLUSDZLayout)usdzLayout
{
  return (_TtC8Freeform13CRLUSDZLayout *)sub_100B662AC(self, (uint64_t)a2, (SEL *)&selRef_layout, (void (*)(void))type metadata accessor for CRLUSDZLayout);
}

- (void)willBeRemoved
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
  id v2 = v3.receiver;
  [(CRLCanvasRep *)&v3 willBeRemoved];
  sub_100B66924();
  sub_100B674E4();
  sub_100B676C4();
}

- (void)selectionPathDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  if ([(CRLCanvasRep *)v5 isLocked]) {
    [(CRLCanvasRep *)v5 invalidateKnobs];
  }
}

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v5 = a3;
  id v4 = self;
  sub_100B67B70(v5);
}

- (void).cxx_destruct
{
  sub_100B6DB90((uint64_t)self + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_posterLoadingState, type metadata accessor for CRLUSDZRep.PosterLoadingState);
  sub_100B6DB90((uint64_t)self + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_assetLoadingState, type metadata accessor for CRLUSDZRep.AssetLoadingState);
  sub_100B6BEFC(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_renderingState), *((unsigned char *)&self->super.mCanvas + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_renderingState));

  objc_super v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep____lazy_storage___spinnerView);
}

- (void)addKnobsToArray:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100B68FD0(v4);
}

- (id)newTrackerForKnob:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform10CRLUSDZRep_knobController);
  id v5 = a3;
  id v6 = self;
  id v7 = sub_100B6FE0C((uint64_t)v5, v6, v4);
  if (!v7)
  {
    v10.receiver = v6;
    v10.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
    id v7 = [(CRLCanvasRep *)&v10 newTrackerForKnob:v5];
  }
  unsigned __int8 v8 = v7;

  return v8;
}

- (NSString)crlaxLabel
{
  id v2 = self;
  sub_100B6B95C();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)crlaxShouldSetAccessibilityFrameWithFrameInUnscaledCanvasForMarqueeSelecting
{
  return 1;
}

- (int64_t)supportedMediaTypes
{
  return 2;
}

- (int64_t)preferredReplacingInterfaceKind
{
  return 1;
}

- (BOOL)replacingInterfaceAllowsMultipleSelection
{
  return 0;
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 1;
}

- (NSString)debugDescription
{
  id v2 = self;
  sub_100B6EE80();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)enterPreviewMode
{
  id v2 = self;
  sub_100FA4FF8(sub_100FA60A4);
}

- (void)didExitPreviewMode
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for CRLUSDZRep(0);
  [(CRLCanvasRep *)&v2 didExitPreviewMode];
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 1;
}

@end