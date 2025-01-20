@interface CRLiOSDocumentModeHandwriting
- (BOOL)allowGestureInRestrictedGestureMode:(id)a3;
- (BOOL)allowedToEnterQuickSelectModeForCanvasViewController:(id)a3;
- (BOOL)handleTapOnCanvasBackgroundAtUnscaledPoint:(CGPoint)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAllowTextGesturesInRestrictedGestureMode;
- (BOOL)shouldSuppressKeyboard;
- (BOOL)wantsCanvasInRestrictedGestureMode;
- (BOOL)wantsDoneButtonInCompact;
- (BOOL)wantsToEndForDragAndDropInteractions;
- (BOOL)wantsToEndForNonPopoverPresentations;
- (CRLiOSToolTrayProviding)toolTray;
- (_TtC8Freeform29CRLiOSDocumentModeHandwriting)initWithBoardViewController:(id)a3;
- (unint64_t)hash;
- (unint64_t)pencilModeType;
- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5;
- (void)modeDidBeginFromMode:(id)a3 forced:(BOOL)a4;
- (void)modeWillBeginFromMode:(id)a3 forced:(BOOL)a4;
- (void)modeWillEndForMode:(id)a3 forced:(BOOL)a4;
- (void)performBlockIgnoringSelectionChangesToExitHandwritingMode:(id)a3;
- (void)willSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5;
@end

@implementation CRLiOSDocumentModeHandwriting

- (_TtC8Freeform29CRLiOSDocumentModeHandwriting)initWithBoardViewController:(id)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_currentlyChangingModes) = 0;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_stayInHandwritingModeForSelectionChange) = 0;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_endModeCheckQueuedAfterTextGestures) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_subscriptions) = (Class)&_swiftEmptySetSingleton;
  id v4 = a3;

  result = (_TtC8Freeform29CRLiOSDocumentModeHandwriting *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = CRLiOSDocumentModeHandwriting.isEqual(_:)((uint64_t)v8);

  sub_10052E2B0((uint64_t)v8);
  return v6;
}

- (unint64_t)hash
{
  return 23;
}

- (unint64_t)pencilModeType
{
  return 2;
}

- (CRLiOSToolTrayProviding)toolTray
{
  v2 = self;
  v3 = CRLiOSDocumentModeHandwriting.toolTray.getter();

  return (CRLiOSToolTrayProviding *)v3;
}

- (BOOL)wantsDoneButtonInCompact
{
  return 1;
}

- (void)modeWillBeginFromMode:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (objc_class *)a3;
  v7 = self;
  char v8 = (char)v7;
  v10 = v7;
  v9.super.isa = v6;
  v9._boardViewController = (_TtC8Freeform25CRLiOSBoardViewController *)v4;
  CRLiOSDocumentModeHandwriting.modeWillBegin(from:forced:)(v9, v8);
}

- (void)modeDidBeginFromMode:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLiOSDocumentModeHandwriting();
  id v6 = a3;
  id v7 = v8.receiver;
  [(CRLiOSDocumentMode *)&v8 modeDidBeginFromMode:v6 forced:v4];
  sub_1005584CC();
}

- (void)modeWillEndForMode:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_subscriptions);
  swift_beginAccess();
  void *v7 = &_swiftEmptySetSingleton;
  id v8 = a3;
  CRLiOSDocumentMode v9 = self;
  swift_bridgeObjectRelease();
  v10 = [(CRLiOSDocumentMode *)v9 boardViewController];
  if (v10)
  {
    v11 = v10;
    id v12 = sub_100E3C594();

    [v12 removeModeObserver:v9];
    v13.receiver = v9;
    v13.super_class = (Class)type metadata accessor for CRLiOSDocumentModeHandwriting();
    [(CRLiOSDocumentMode *)&v13 modeWillEndForMode:v8 forced:v4];
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)wantsCanvasInRestrictedGestureMode
{
  return 1;
}

- (BOOL)shouldAllowTextGesturesInRestrictedGestureMode
{
  return 1;
}

- (BOOL)wantsToEndForNonPopoverPresentations
{
  return 1;
}

- (BOOL)wantsToEndForDragAndDropInteractions
{
  return 1;
}

- (BOOL)shouldSuppressKeyboard
{
  if ((*((unsigned char *)&self->super.super.isa
        + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_currentlyChangingModes) & 1) != 0)
    return 1;
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  v5 = self;
  unsigned __int8 v6 = [Strong textGesturesInFlight];

  return v6;
}

- (BOOL)allowGestureInRestrictedGestureMode:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = CRLiOSDocumentModeHandwriting.restrictedGestureModeShouldAllowGesture(_:)((UIGestureRecognizer)v4);

  return self & 1;
}

- (BOOL)allowedToEnterQuickSelectModeForCanvasViewController:(id)a3
{
  return 0;
}

- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_currentlyChangingModes) = 0;
}

- (void)willSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_currentlyChangingModes) = 1;
}

- (void)performBlockIgnoringSelectionChangesToExitHandwritingMode:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_stayInHandwritingModeForSelectionChange;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_stayInHandwritingModeForSelectionChange) = 1;
  unsigned __int8 v6 = (void (*)(void *))v4[2];
  id v7 = self;
  v6(v4);
  *((unsigned char *)&self->super.super.isa + v5) = 0;
  _Block_release(v4);
}

- (BOOL)handleTapOnCanvasBackgroundAtUnscaledPoint:(CGPoint)a3
{
  v3 = self;
  id v4 = [(CRLiOSDocumentMode *)v3 boardViewController];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = sub_100E3C594();

    [v6 resetToDefaultModeAnimated:1];
    LOBYTE(v4) = 0;
  }
  else
  {
    __break(1u);
  }
  return (char)v4;
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();

  swift_bridgeObjectRelease();
}

@end