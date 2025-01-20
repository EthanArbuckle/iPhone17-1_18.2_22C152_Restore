@interface CanvasViewSelectionInteractionDelegate
- (BOOL)selectionInteraction:(id)a3 canPerformAction:(SEL)a4 withSender:(id)a5 inAttachment:(id)a6;
- (BOOL)selectionInteraction:(id)a3 didLongPressElement:(id)a4 withGesture:(id)a5 inAttachment:(id)a6;
- (BOOL)selectionInteraction:(id)a3 handleLassoSelection:(id)a4 strokes:(id)a5 inAttachment:(id)a6;
- (BOOL)selectionInteraction:(id)a3 handleTapOnCanvasAtLocation:(CGPoint)a4 inAttachment:(id)a5;
- (BOOL)selectionInteraction:(id)a3 selectionContainsPoint:(CGPoint)a4 inAttachment:(id)a5;
- (BOOL)selectionInteractionShouldBegin:(id)a3 atPoint:(CGPoint)a4 forEvent:(id)a5 orGestureRecognizer:(id)a6;
- (BOOL)selectionInteractionShouldForwardToElements:(id)a3 atPoint:(CGPoint)a4 forEvent:(id)a5;
- (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate)init;
- (const)selectionInteraction:(id)a3 pathForElement:(id)a4 inAttachment:(id)a5;
- (id)selectionInteraction:(id)a3 contextMenuInteraction:(id)a4 configurationForElement:(id)a5 inAttachment:(id)a6;
- (id)selectionInteraction:(id)a3 contextMenuInteraction:(id)a4 previewForHighlightingMenuWithConfiguration:(id)a5 forElement:(id)a6 inAttachment:(id)a7;
- (id)selectionInteraction:(id)a3 didDuplicateElements:(id)a4 inAttachment:(id)a5;
- (id)selectionInteraction:(id)a3 elementsForSpaceInsertedAtPoint:(CGPoint)a4 inAttachment:(id)a5;
- (id)selectionInteraction:(id)a3 elementsInAttachment:(id)a4;
- (id)selectionInteraction:(id)a3 pasteboardRepresentationsForElements:(id)a4 strokes:(id)a5 inAttachment:(id)a6;
- (id)selectionInteraction:(id)a3 requestElementsInPath:(id)a4 inAttachment:(id)a5;
- (id)selectionInteraction:(id)a3 requestElementsInRect:(CGRect)a4 inAttachment:(id)a5;
- (id)selectionInteraction:(id)a3 selectedElementsInAttachment:(id)a4;
- (void)selectionInteraction:(id)a3 clearSelectionInAttachment:(id)a4;
- (void)selectionInteraction:(id)a3 contextMenuInteraction:(id)a4 willDisplayMenuForConfiguration:(id)a5 animator:(id)a6 forElement:(id)a7 inAttachment:(id)a8;
- (void)selectionInteraction:(id)a3 contextMenuInteraction:(id)a4 willEndForConfiguration:(id)a5 animator:(id)a6 forElement:(id)a7 inAttachment:(id)a8;
- (void)selectionInteraction:(id)a3 didClearSelectionForElements:(id)a4 inAttachment:(id)a5;
- (void)selectionInteraction:(id)a3 didDeleteElements:(id)a4 inAttachment:(id)a5;
- (void)selectionInteraction:(id)a3 didDragElements:(id)a4 withTransform:(CGAffineTransform *)a5 inAttachment:(id)a6;
- (void)selectionInteraction:(id)a3 didDropItemProvider:(id)a4 inAttachment:(id)a5 withCompletion:(id)a6;
- (void)selectionInteraction:(id)a3 didEndDraggingElements:(id)a4 inAttachment:(id)a5;
- (void)selectionInteraction:(id)a3 didEndInsertSpaceInAttachment:(id)a4;
- (void)selectionInteraction:(id)a3 didSelectElements:(id)a4 inAttachment:(id)a5;
- (void)selectionInteraction:(id)a3 didSelectStrokes:(id)a4 selectionType:(int64_t)a5 inAttachment:(id)a6;
- (void)selectionInteraction:(id)a3 didTapElement:(id)a4 withGesture:(id)a5 inAttachment:(id)a6;
- (void)selectionInteraction:(id)a3 dragInteractionWillBeginForElements:(id)a4 inAttachment:(id)a5;
- (void)selectionInteraction:(id)a3 dragInteractionWillEndForElements:(id)a4 withOperation:(unint64_t)a5 inAttachment:(id)a6;
- (void)selectionInteraction:(id)a3 handleDeleteForTextStrokes:(id)a4 inAttachment:(id)a5;
- (void)selectionInteraction:(id)a3 handleDeleteForTextStrokes:(id)a4 nonTextStrokes:(id)a5 inAttachment:(id)a6;
- (void)selectionInteraction:(id)a3 handleGenerationToolForSelectedStrokes:(id)a4 inBounds:(CGRect)a5 inAttachment:(id)a6;
- (void)selectionInteraction:(id)a3 insertSpaceDidMove:(double)a4 inAttachment:(id)a5;
- (void)selectionInteraction:(id)a3 renderPreviewForElements:(id)a4 inContext:(CGContext *)a5 withConfig:(id)a6 inAttachment:(id)a7 withCompletion:(id)a8;
- (void)selectionInteraction:(id)a3 replaceStrokes:(id)a4 withString:(id)a5 proofreadingItem:(id)a6 inBounds:(CGRect)a7 inAttachment:(id)a8;
- (void)selectionInteraction:(id)a3 willBeginInsertSpaceInAttachment:(id)a4;
- (void)selectionInteractionDidPaste:(id)a3 atPoint:(CGPoint)a4 inAttachment:(id)a5;
@end

@implementation CanvasViewSelectionInteractionDelegate

- (BOOL)selectionInteraction:(id)a3 handleLassoSelection:(id)a4 strokes:(id)a5 inAttachment:(id)a6
{
  type metadata accessor for UUID();
  _s9Coherence9CRKeyPathVACSQAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = self;
  LOBYTE(a4) = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:handleLassoSelection:strokes:inAttachment:)(a4, v10);

  swift_bridgeObjectRelease();
  return a4 & 1;
}

- (BOOL)selectionInteractionShouldBegin:(id)a3 atPoint:(CGPoint)a4 forEvent:(id)a5 orGestureRecognizer:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  CanvasViewSelectionInteractionDelegate.selectionInteractionShouldBegin(_:at:for:orGestureRecognizer:)(v11, (unint64_t)a5, (unint64_t)a6, x, y);
  LOBYTE(a6) = v15;

  return a6 & 1;
}

- (BOOL)selectionInteractionShouldForwardToElements:(id)a3 atPoint:(CGPoint)a4 forEvent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  id v11 = self;
  LOBYTE(a5) = CanvasViewSelectionInteractionDelegate.selectionInteractionShouldForwardToElements(_:at:for:)(v9, a5, x, y);

  return a5 & 1;
}

- (id)selectionInteraction:(id)a3 requestElementsInRect:(CGRect)a4 inAttachment:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  id v13 = self;
  uint64_t v14 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:requestElementsIn:inAttachment:)(x, y, width, height);

  if (v14)
  {
    v15.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v15.super.isa = 0;
  }
  return v15.super.isa;
}

- (id)selectionInteraction:(id)a3 requestElementsInPath:(id)a4 inAttachment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  uint64_t v12 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:requestElementsIn:inAttachment:)(v9);

  if (v12)
  {
    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v13.super.isa = 0;
  }
  return v13.super.isa;
}

- (const)selectionInteraction:(id)a3 pathForElement:(id)a4 inAttachment:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a5;
  id v9 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  NSArray v15 = &type metadata for PencilAndPaperFeatureFlags;
  unint64_t v16 = lazy protocol witness table accessor for type PencilAndPaperFeatureFlags and conformance PencilAndPaperFeatureFlags();
  v14[0] = 0;
  LOBYTE(a5) = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  if ((a5 & 1) != 0
    || (id v10 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)CanvasViewSelectionInteractionDelegate.view(for:)((uint64_t)v17)) == 0)
  {
    v19.origin.CGFloat x = 0.0;
    v19.origin.CGFloat y = 0.0;
    v19.size.CGFloat width = 0.0;
    v19.size.CGFloat height = 0.0;
    CGPathRef v12 = CGPathCreateWithRect(v19, 0);
  }
  else
  {
    id v11 = v10;
    CGPathRef v12 = (CGPathRef)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)v10->super.isa) + 0x1D8))();

    id v8 = v9;
    id v9 = v11;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return v12;
}

- (void)selectionInteraction:(id)a3 didSelectElements:(id)a4 inAttachment:(id)a5
{
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a5;
  id v11 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didSelectElements:inAttachment:)(v9, v8);

  swift_bridgeObjectRelease();
}

- (void)selectionInteraction:(id)a3 didDragElements:(id)a4 withTransform:(CGAffineTransform *)a5 inAttachment:(id)a6
{
  long long v9 = *(_OWORD *)&a5->c;
  v14[0] = *(_OWORD *)&a5->a;
  v14[1] = v9;
  v14[2] = *(_OWORD *)&a5->tx;
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = a6;
  NSArray v13 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didDragElements:with:inAttachment:)(v10, (CGFloat *)v14);

  swift_bridgeObjectRelease();
}

- (void)selectionInteraction:(id)a3 didEndDraggingElements:(id)a4 inAttachment:(id)a5
{
}

- (void)selectionInteraction:(id)a3 willBeginInsertSpaceInAttachment:(id)a4
{
  id v7 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit38CanvasViewSelectionInteractionDelegate_containerView, a2);
  if (v7)
  {
    uint64_t v8 = v7;
    long long v9 = (void *)MEMORY[0x263F8EED0];
    uint64_t v10 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v7)
                                                                                        + 0x88))();
    id v11 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a3;
    id v12 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a4;
    NSArray v13 = self;

    if (v10)
    {
      (*(void (**)(void))((*v9 & (uint64_t)v10->super.isa) + 0x5A0))();

      id v11 = v12;
      id v12 = v13;
      NSArray v13 = v10;
    }
  }
}

- (void)selectionInteraction:(id)a3 insertSpaceDidMove:(double)a4 inAttachment:(id)a5
{
  long long v9 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit38CanvasViewSelectionInteractionDelegate_containerView, a2);
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = (void *)MEMORY[0x263F8EED0];
    id v12 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v9)
                                                                                        + 0x88))();
    NSArray v13 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a3;
    uint64_t v14 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a5;
    NSArray v15 = self;

    if (v12)
    {
      (*(void (**)(double))((*v11 & (uint64_t)v12->super.isa) + 0x5A8))(a4);

      NSArray v13 = v14;
      uint64_t v14 = v15;
      NSArray v15 = v12;
    }
  }
}

- (void)selectionInteraction:(id)a3 didEndInsertSpaceInAttachment:(id)a4
{
  id v7 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit38CanvasViewSelectionInteractionDelegate_containerView, a2);
  if (v7)
  {
    uint64_t v8 = v7;
    long long v9 = (void *)MEMORY[0x263F8EED0];
    uint64_t v10 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v7)
                                                                                        + 0x88))();
    id v11 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a3;
    id v12 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a4;
    NSArray v13 = self;

    if (v10)
    {
      (*(void (**)(void))((*v9 & (uint64_t)v10->super.isa) + 0x5B0))(0);

      id v11 = v12;
      id v12 = v13;
      NSArray v13 = v10;
    }
  }
}

- (void)selectionInteraction:(id)a3 didClearSelectionForElements:(id)a4 inAttachment:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  long long v9 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didClearSelectionForElements:inAttachment:)();
}

- (void)selectionInteraction:(id)a3 clearSelectionInAttachment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:clearSelectionInAttachment:)();
}

- (BOOL)selectionInteraction:(id)a3 canPerformAction:(SEL)a4 withSender:(id)a5 inAttachment:(id)a6
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a6;
  uint64_t v10 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  char v11 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:canPerformAction:withSender:inAttachment:)();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  return v11 & 1;
}

- (id)selectionInteraction:(id)a3 pasteboardRepresentationsForElements:(id)a4 strokes:(id)a5 inAttachment:(id)a6
{
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for UUID();
  _s9Coherence9CRKeyPathVACSQAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = a6;
  uint64_t v13 = self;
  uint64_t v14 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:pasteboardRepresentationsForElements:strokes:inAttachment:)(v9, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
    v15.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v15.super.isa = 0;
  }
  return v15.super.isa;
}

- (void)selectionInteractionDidPaste:(id)a3 atPoint:(CGPoint)a4 inAttachment:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  id v11 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteractionDidPaste(_:at:in:)(x, y);
}

- (void)selectionInteraction:(id)a3 didDeleteElements:(id)a4 inAttachment:(id)a5
{
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = (char *)self + OBJC_IVAR____TtC8PaperKit38CanvasViewSelectionInteractionDelegate_containerView;
  uint64_t v10 = MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit38CanvasViewSelectionInteractionDelegate_containerView);
  if (v10)
  {
    uint64_t v11 = *((void *)v9 + 1);
    id v19 = (id)v10;
    uint64_t ObjectType = swift_getObjectType();
    id v13 = a3;
    id v14 = a5;
    NSArray v15 = self;
    uint64_t v16 = specialized _arrayForceCast<A, B>(_:)(v8);
    uint64_t v17 = specialized Set.init<A>(_:)(v16);
    swift_bridgeObjectRelease();
    uint64_t v18 = specialized Set.init<A>(_:)(MEMORY[0x263F8EE78]);
    (*(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(v11 + 88))(v17, v18, 6, 0, ObjectType, v11);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (id)selectionInteraction:(id)a3 didDuplicateElements:(id)a4 inAttachment:(id)a5
{
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = self;
  uint64_t v12 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didDuplicateElements:inAttachment:)(v8);

  swift_bridgeObjectRelease();
  if (v12)
  {
    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v13.super.isa = 0;
  }
  return v13.super.isa;
}

- (id)selectionInteraction:(id)a3 elementsForSpaceInsertedAtPoint:(CGPoint)a4 inAttachment:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = self;
  uint64_t v12 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:elementsForSpaceInsertedAt:inAttachment:)(x, y);

  if (v12)
  {
    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v13.super.isa = 0;
  }
  return v13.super.isa;
}

- (BOOL)selectionInteraction:(id)a3 selectionContainsPoint:(CGPoint)a4 inAttachment:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = self;
  char v12 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:selectionContains:inAttachment:)(x, y);

  return v12 & 1;
}

- (id)selectionInteraction:(id)a3 elementsInAttachment:(id)a4
{
  return @objc CanvasViewSelectionInteractionDelegate.selectionInteraction(_:elementsInAttachment:)(self, (uint64_t)a2, a3, a4, (uint64_t (*)(void))specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:elementsInAttachment:));
}

- (id)selectionInteraction:(id)a3 selectedElementsInAttachment:(id)a4
{
  return @objc CanvasViewSelectionInteractionDelegate.selectionInteraction(_:elementsInAttachment:)(self, (uint64_t)a2, a3, a4, (uint64_t (*)(void))specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:selectedElementsInAttachment:));
}

- (void)selectionInteraction:(id)a3 didSelectStrokes:(id)a4 selectionType:(int64_t)a5 inAttachment:(id)a6
{
  type metadata accessor for PKStroke();
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = a6;
  NSArray v13 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didSelect:selectionType:inAttachment:)(v10, a5);

  swift_bridgeObjectRelease();
}

- (void)selectionInteraction:(id)a3 renderPreviewForElements:(id)a4 inContext:(CGContext *)a5 withConfig:(id)a6 inAttachment:(id)a7 withCompletion:(id)a8
{
  NSArray v13 = _Block_copy(a8);
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  id v16 = a3;
  uint64_t v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v20 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:renderPreviewForElements:in:with:inAttachment:withCompletion:)(v14, v17, v18, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (), v15);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)selectionInteraction:(id)a3 dragInteractionWillBeginForElements:(id)a4 inAttachment:(id)a5
{
}

- (void)selectionInteraction:(id)a3 dragInteractionWillEndForElements:(id)a4 withOperation:(unint64_t)a5 inAttachment:(id)a6
{
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = a6;
  NSArray v13 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:dragInteractionWillEndForElements:with:inAttachment:)(v10, a5);

  swift_bridgeObjectRelease();
}

- (void)selectionInteraction:(id)a3 didDropItemProvider:(id)a4 inAttachment:(id)a5 withCompletion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didDrop:inAttachment:withCompletion:)(a4, (uint64_t)v14, (void (**)(void, void))v10);
  _Block_release(v10);
  _Block_release(v10);
}

- (void)selectionInteraction:(id)a3 didTapElement:(id)a4 withGesture:(id)a5 inAttachment:(id)a6
{
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = a5;
  id v11 = a6;
  id v12 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didTapElement:withGesture:inAttachment:)((uint64_t)v13, v10);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

- (BOOL)selectionInteraction:(id)a3 didLongPressElement:(id)a4 withGesture:(id)a5 inAttachment:(id)a6
{
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = a5;
  id v11 = a6;
  id v12 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  char v13 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didLongPressElement:withGesture:inAttachment:)((uint64_t)v15, v10);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v13 & 1;
}

- (id)selectionInteraction:(id)a3 contextMenuInteraction:(id)a4 configurationForElement:(id)a5 inAttachment:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  swift_unknownObjectRetain();
  id v11 = a6;
  id v12 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  id v13 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:contextMenuInteraction:configurationForElement:inAttachment:)((uint64_t)v10, (uint64_t)v15);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v13;
}

- (id)selectionInteraction:(id)a3 contextMenuInteraction:(id)a4 previewForHighlightingMenuWithConfiguration:(id)a5 forElement:(id)a6 inAttachment:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  swift_unknownObjectRetain();
  id v14 = a7;
  uint64_t v15 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  id v16 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:contextMenuInteraction:previewForHighlightingMenuWith:forElement:inAttachment:)((uint64_t)v12, (uint64_t)v13, (uint64_t)v18);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return v16;
}

- (void)selectionInteraction:(id)a3 contextMenuInteraction:(id)a4 willDisplayMenuForConfiguration:(id)a5 animator:(id)a6 forElement:(id)a7 inAttachment:(id)a8
{
}

- (void)selectionInteraction:(id)a3 contextMenuInteraction:(id)a4 willEndForConfiguration:(id)a5 animator:(id)a6 forElement:(id)a7 inAttachment:(id)a8
{
}

- (void)selectionInteraction:(id)a3 handleDeleteForTextStrokes:(id)a4 inAttachment:(id)a5
{
  type metadata accessor for PKStroke();
  uint64_t v8 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a5;
  id v11 = self;
  v12._rawValue = v8;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:handleDeleteForTextStrokes:inAttachment:)(v12);

  swift_bridgeObjectRelease();
}

- (void)selectionInteraction:(id)a3 handleDeleteForTextStrokes:(id)a4 nonTextStrokes:(id)a5 inAttachment:(id)a6
{
  type metadata accessor for PKStroke();
  id v9 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = a6;
  id v13 = self;
  v14._rawValue = v9;
  v15._rawValue = v10;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:handleDeleteForTextStrokes:nonTextStrokes:inAttachment:)(v14, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)selectionInteraction:(id)a3 handleGenerationToolForSelectedStrokes:(id)a4 inBounds:(CGRect)a5 inAttachment:(id)a6
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PKStroke();
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  type metadata accessor for MainActor();
  Swift::OpaquePointer v14 = self;
  id v15 = a3;
  id v16 = a6;
  swift_bridgeObjectRetain();
  uint64_t v17 = static MainActor.shared.getter();
  id v18 = (void *)swift_allocObject();
  uint64_t v19 = MEMORY[0x263F8F500];
  v18[2] = v17;
  v18[3] = v19;
  v18[4] = v14;
  v18[5] = v12;
  _sScTss5NeverORs_rlE8detached8priority9operationScTyxABGScPSg_xyYaYAcntFZyt_Tgm5((uint64_t)v11, (uint64_t)&async function pointer to partial apply for closure #1 in CanvasViewSelectionInteractionDelegate.selectionInteraction(_:handleGenerationToolForSelectedStrokes:inBounds:inAttachment:), (uint64_t)v18);
  swift_release();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v11, &demangling cache variable for type metadata for TaskPriority?);

  swift_bridgeObjectRelease();
}

- (void)selectionInteraction:(id)a3 replaceStrokes:(id)a4 withString:(id)a5 proofreadingItem:(id)a6 inBounds:(CGRect)a7 inAttachment:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  type metadata accessor for PKStroke();
  uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  id v20 = a3;
  id v21 = a6;
  id v22 = a8;
  v23 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:replace:with:proofreadingItem:in:in:)(v16, v17, v19, a6, v22, x, y, width, height);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)selectionInteraction:(id)a3 handleTapOnCanvasAtLocation:(CGPoint)a4 inAttachment:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  id v11 = self;
  char v12 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:handleTapOnCanvasAtLocation:inAttachment:)(x, y);

  return v12 & 1;
}

- (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate)init
{
  result = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end