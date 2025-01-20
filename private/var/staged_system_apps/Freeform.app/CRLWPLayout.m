@interface CRLWPLayout
- (BOOL)caresAboutStorageChanges;
- (BOOL)descendersCannotClip;
- (BOOL)isInstructional;
- (BOOL)isLastTarget;
- (BOOL)isOverflowing;
- (BOOL)layoutIsValid;
- (BOOL)markedTextContainsPoint:(CGPoint)a3;
- (BOOL)parentAutosizes;
- (BOOL)shouldInvalidateSizeWhenInvalidateSizeOfReliedOnLayout:(id)a3;
- (BOOL)shouldWrapAroundExternalDrawables;
- (BOOL)textIsVertical;
- (BOOL)wantsLineFragments;
- (CGPoint)anchorPoint;
- (CGPoint)position;
- (CGRect)rectInRootForSelectionPath:(id)a3;
- (CGRect)rectInRootOfAutoZoomContextOfSelectionPath:(id)a3;
- (CGSize)currentSize;
- (CGSize)maxSize;
- (CGSize)minSize;
- (CRLWPOffscreenColumn)nextTargetFirstColumn;
- (CRLWPOffscreenColumn)previousTargetLastColumn;
- (CRLWPTextSource)storage;
- (CRLWrapSegments)interiorWrapSegments;
- (NSArray)dependentLayouts;
- (NSMutableArray)columns;
- (_TtC8Freeform11CRLWPLayout)initWithInfo:(id)a3;
- (double)viewScaleForZoomingToSelectionPath:(id)a3 targetPointSize:(double)a4;
- (id)closestPositionTo:(CGPoint)a3;
- (id)columnMetricsForCharIndex:(int64_t)a3 outRange:(_NSRange *)a4;
- (id)computeLayoutGeometry;
- (id)interiorClippingPath;
- (id)selectionRectsFor:(id)a3;
- (id)textWrapper;
- (int64_t)naturalAlignment;
- (int64_t)naturalDirection;
- (int64_t)verticalAlignment;
- (unint64_t)autosizeFlags;
- (unint64_t)pageCount;
- (unint64_t)pageNumber;
- (void)invalidateSize;
- (void)invalidateTextLayout;
- (void)layoutSearchForSpellingErrorsWithHitBlock:(id)a3 stop:(BOOL *)a4;
- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5 completionBlock:(id)a6;
- (void)setNeedsDisplayInTargetRect:(CGRect)a3;
- (void)validate;
@end

@implementation CRLWPLayout

- (_TtC8Freeform11CRLWPLayout)initWithInfo:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (_TtC8Freeform11CRLWPLayout *)sub_1006F24D4((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (BOOL)parentAutosizes
{
  v2 = self;
  v3 = [(CRLCanvasAbstractLayout *)v2 parent];
  if (!v3) {
    goto LABEL_5;
  }
  v4 = v3;
  v5 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (!v5)
  {

LABEL_5:
    v9.receiver = v2;
    v9.super_class = (Class)type metadata accessor for CRLWPLayout();
    BOOL v7 = [(CRLCanvasLayout *)&v9 parentAutosizes];

    return v7;
  }
  id v6 = [v5 autosizeFlagsFor:v2];

  return v6 != 0;
}

- (void)validate
{
  v2 = self;
  CRLWPLayout.validate()();
}

- (void)invalidateTextLayout
{
  v2 = self;
  if ([(CRLWPLayout *)v2 parentAutosizes]) {
    [(CRLWPLayout *)v2 invalidateSize];
  }
  *((unsigned char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8Freeform11CRLWPLayout_textLayoutIsValid) = 0;
  [(CRLCanvasLayout *)v2 invalidate];
  [(CRLCanvasLayout *)v2 setNeedsDisplay];
}

- (void)invalidateSize
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform11CRLWPLayout_textLayoutIsValid) = 0;
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for CRLWPLayout();
  [(CRLCanvasLayout *)&v2 invalidateSize];
}

- (id)computeLayoutGeometry
{
  objc_super v2 = self;
  CRLWPLayout.computeLayoutGeometry()(v3);
  v5 = v4;

  return v5;
}

- (BOOL)markedTextContainsPoint:(CGPoint)a3
{
  v3 = self;
  char v4 = sub_1006E8B68();

  return v4 & 1;
}

- (id)selectionRectsFor:(id)a3
{
  type metadata accessor for CRLTextRange();
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = qword_10166EE60;
  id v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (id)qword_10171A478;
  swift_bridgeObjectRetain();
  sub_1006E976C((uint64_t)v6, v4, &v10);

  swift_bridgeObjectRelease_n();
  type metadata accessor for CRLTextSelectionRect();
  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (id)closestPositionTo:(CGPoint)a3
{
  uint64_t v3 = qword_10166EE60;
  unint64_t v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  id v5 = (id)qword_10171A478;
  sub_1006EAD90(v4, &v8);

  id v6 = v8;

  return v6;
}

- (BOOL)shouldInvalidateSizeWhenInvalidateSizeOfReliedOnLayout:(id)a3
{
  return 1;
}

- (NSArray)dependentLayouts
{
  objc_super v2 = self;
  uint64_t v3 = CRLWPLayout.dependentLayouts.getter();

  if (v3)
  {
    sub_10050BF48(0, (unint64_t *)&qword_101690720);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5 completionBlock:(id)a6
{
  objc_super v9 = _Block_copy(a5);
  unint64_t v10 = (void (*)(id))_Block_copy(a6);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v9;
  if (v10)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v10;
    unint64_t v10 = (void (*)(id))sub_1005E2108;
  }
  else
  {
    uint64_t v15 = 0;
  }
  v16 = self;
  CRLWPLayout.layoutSearch(for:options:hit:completionBlock:)(v11, v13, a4, (uint64_t)sub_1006F28C4, v14, v10, v15);
  sub_1005174AC((uint64_t)v10);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)layoutSearchForSpellingErrorsWithHitBlock:(id)a3 stop:(BOOL *)a4
{
  id v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = self;
  CRLWPLayout.layoutSearchForSpellingErrors(hit:stop:)((uint64_t)sub_1006F27EC, v7, (uint64_t)a4);

  swift_release();
}

- (CGRect)rectInRootForSelectionPath:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CRLWPLayout.rectInRoot(for:)(v4);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)rectInRootOfAutoZoomContextOfSelectionPath:(id)a3
{
  id v4 = a3;
  id v5 = self;
  double v6 = [(CRLCanvasAbstractLayout *)v5 parent];
  if (!v6) {
    goto LABEL_5;
  }
  double v7 = v6;
  self;
  double v8 = (void *)swift_dynamicCastObjCClass();
  if (!v8)
  {

LABEL_5:
    v25.receiver = v5;
    v25.super_class = (Class)type metadata accessor for CRLWPLayout();
    [(CRLCanvasLayout *)&v25 rectInRootOfAutoZoomContextOfSelectionPath:v4];
    double v10 = v17;
    double v12 = v18;
    double v14 = v19;
    double v16 = v20;

    goto LABEL_6;
  }
  [v8 rectInRootOfAutoZoomContextOfSelectionPath:v4];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

LABEL_6:
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  double v24 = v16;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)viewScaleForZoomingToSelectionPath:(id)a3 targetPointSize:(double)a4
{
  id v6 = a3;
  double v7 = self;
  double v8 = [(CRLCanvasAbstractLayout *)v7 parent];
  if (!v8) {
    goto LABEL_5;
  }
  double v9 = v8;
  self;
  double v10 = (void *)swift_dynamicCastObjCClass();
  if (!v10)
  {

LABEL_5:
    v15.receiver = v7;
    v15.super_class = (Class)type metadata accessor for CRLWPLayout();
    [(CRLCanvasLayout *)&v15 viewScaleForZoomingToSelectionPath:v6 targetPointSize:a4];
    double v12 = v13;

    return v12;
  }
  [v10 viewScaleForZoomingToSelectionPath:v6 targetPointSize:a4];
  double v12 = v11;

  return v12;
}

- (BOOL)isOverflowing
{
  objc_super v2 = self;
  Swift::Bool v3 = CRLWPLayout.isOverflowing()();

  return v3;
}

- (void).cxx_destruct
{
  Swift::Bool v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform11CRLWPLayout_geometryWhenLastInvalidated);
}

- (BOOL)caresAboutStorageChanges
{
  return 0;
}

- (id)textWrapper
{
  objc_super v2 = self;
  Swift::Bool v3 = [(CRLCanvasAbstractLayout *)v2 parent];
  if (v3)
  {
    self;
    id v4 = (void *)swift_dynamicCastObjCClass();
    if (!v4) {

    }
    Swift::Bool v3 = (CRLCanvasAbstractLayout *)[v4 textWrapper];
  }
  else
  {
    id v4 = v2;
  }

  return v3;
}

- (id)columnMetricsForCharIndex:(int64_t)a3 outRange:(_NSRange *)a4
{
  id v4 = self;
  id v5 = [(CRLCanvasAbstractLayout *)v4 parent];
  if (v5)
  {
    id v6 = v5;
    double v7 = (void *)swift_dynamicCastObjCProtocolConditional();

    if (!v7) {
  }
    }
  else
  {

    double v7 = 0;
  }

  return v7;
}

- (NSMutableArray)columns
{
  objc_super v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform11CRLWPLayout__columns);
  swift_beginAccess();
  return (NSMutableArray *)*v2;
}

- (CRLWPOffscreenColumn)previousTargetLastColumn
{
  return (CRLWPOffscreenColumn *)0;
}

- (CRLWPOffscreenColumn)nextTargetFirstColumn
{
  return (CRLWPOffscreenColumn *)0;
}

- (CRLWPTextSource)storage
{
  return (CRLWPTextSource *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                    + OBJC_IVAR____TtC8Freeform11CRLWPLayout_wpStorage));
}

- (BOOL)isLastTarget
{
  return 1;
}

- (BOOL)isInstructional
{
  objc_super v2 = self;
  unsigned __int8 v3 = CRLWPLayout.isInstructional.getter();

  return v3 & 1;
}

- (CGSize)minSize
{
  objc_super v2 = self;
  double v3 = CRLWPLayout.minSize.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)maxSize
{
  objc_super v2 = self;
  double v3 = CRLWPLayout.maxSize.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)currentSize
{
  objc_super v2 = self;
  double v3 = [(CRLCanvasAbstractLayout *)v2 geometry];
  [(CRLCanvasLayoutGeometry *)v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGPoint)position
{
  objc_super v2 = self;
  double v3 = [(CRLCanvasAbstractLayout *)v2 geometry];
  [(CRLCanvasLayoutGeometry *)v3 frame];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)anchorPoint
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (unint64_t)autosizeFlags
{
  return (unint64_t)sub_1006EDC04(self, (uint64_t)a2, (SEL *)&selRef_autosizeFlagsFor_);
}

- (int64_t)verticalAlignment
{
  return (int64_t)sub_1006EDC04(self, (uint64_t)a2, (SEL *)&selRef_verticalAlignmentFor_);
}

- (int64_t)naturalAlignment
{
  double v2 = self;
  double v3 = [(CRLCanvasAbstractLayout *)v2 parent];
  if (!v3)
  {

    return 4;
  }
  double v4 = v3;
  double v5 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (!v5)
  {

    return 4;
  }
  id v6 = [v5 naturalAlignmentFor:v2];

  return (int64_t)v6;
}

- (int64_t)naturalDirection
{
  return 0;
}

- (BOOL)wantsLineFragments
{
  return 1;
}

- (unint64_t)pageNumber
{
  return 0;
}

- (unint64_t)pageCount
{
  return 0;
}

- (BOOL)textIsVertical
{
  return sub_1006EDEDC(self, (uint64_t)a2, (SEL *)&selRef_textLayoutShouldLayoutVertically_);
}

- (BOOL)layoutIsValid
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform11CRLWPLayout_textLayoutIsValid);
}

- (BOOL)shouldWrapAroundExternalDrawables
{
  return sub_1006EDEDC(self, (uint64_t)a2, (SEL *)&selRef_textLayoutShouldWrapAroundExternalDrawables_);
}

- (CRLWrapSegments)interiorWrapSegments
{
  double v2 = self;
  double v3 = [(CRLCanvasAbstractLayout *)v2 parent];
  if (v3)
  {
    double v4 = v3;
    double v5 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v5)
    {
      id v6 = [v5 interiorWrapSegmentsFor:v2];

      goto LABEL_7;
    }
  }
  else
  {
  }
  id v6 = 0;
LABEL_7:

  return (CRLWrapSegments *)v6;
}

- (id)interiorClippingPath
{
  return 0;
}

- (void)setNeedsDisplayInTargetRect:(CGRect)a3
{
}

- (BOOL)descendersCannotClip
{
  return 0;
}

@end