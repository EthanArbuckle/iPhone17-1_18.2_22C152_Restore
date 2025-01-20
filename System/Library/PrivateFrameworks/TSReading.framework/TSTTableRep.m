@interface TSTTableRep
+ (Class)tableRepDelegateClass;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)ratingsDragCellID;
- (BOOL)canDrawInBackgroundDuringScroll;
- (BOOL)canDrawInParallel;
- (BOOL)canDrawTilingLayerInBackground:(id)a3;
- (BOOL)handlesEditMenu;
- (BOOL)isDraggable;
- (BOOL)isFullyVisibleWithBorder:(int)a3;
- (BOOL)isZoomToEditOperationInProgress;
- (BOOL)mustDrawOnMainThreadForInteractiveCanvas;
- (BOOL)shouldCommitPendingTextEdit;
- (BOOL)shouldRestartTextEditing;
- (CALayer)layerForRep;
- (CGAffineTransform)transformFromCanvas;
- (CGAffineTransform)transformToCanvas;
- (CGPath)newPathForSearchReference:(id)a3;
- (CGPath)p_newPathForSearchReference:(id)a3;
- (CGRect)boundsForCellSelection:(id)a3;
- (CGRect)boundsForResizeGuideUI;
- (CGRect)canvasBoundsForCellRange:(id)a3;
- (CGRect)canvasVisibleRect;
- (CGRect)deviceBoundsForCellRange:(id)a3;
- (CGRect)layerFrameInScaledCanvas;
- (CGRect)p_alignedLayerFrameForLayoutSpace:(id)a3 transform:(CGAffineTransform *)a4;
- (NSString)description;
- (TSDCanvasView)canvasView;
- (TSDEditorController)editorController;
- (TSTAnimation)currentAnimation;
- (TSTCanvasReferenceController)canvasReferenceController;
- (TSTCellRegion)selectionRegion;
- (TSTEditingState)editingState;
- (TSTMasterLayout)masterLayout;
- (TSTSelectionDragController)cellDragController;
- (TSTTableAnimationController)animationController;
- (TSTTableChromeProvider)tableChrome;
- (TSTTableKnobTrackerVisitorProtocol)visitorKnobTracker;
- (TSTTableModel)tableModel;
- (TSTTableRep)initWithLayout:(id)a3 canvas:(id)a4;
- (TSTTableRepDelegate)delegate;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)additionalLayersOverLayer;
- (id)additionalLayersUnderLayer;
- (id)editorSelection;
- (id)hitRep:(CGPoint)a3;
- (id)hitRepChrome:(CGPoint)a3;
- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5;
- (id)newCommandToApplyGeometry:(id)a3 toInfo:(id)a4;
- (id)overlayLayers;
- (id)p_frozenHeaderOverlayLayers;
- (id)p_tableNameOverlayLayers;
- (id)p_textImageForPath:(CGPath *)a3 shouldPulsate:(BOOL)a4;
- (id)repForDragging;
- (int)tilingMode;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)beginDragInsertFromPalette;
- (void)contentsRectForCellRangeAcrossSpaces:(id)a3 contentsCenterInfo:(id *)a4 canvasFrame:(CGRect *)a5 contentsRect:(CGRect *)a6;
- (void)dealloc;
- (void)dirtyCellRange:(id)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)endDragInsertFromPalette;
- (void)invalidateAnnotationColor;
- (void)invalidateCellRange:(id)a3;
- (void)invalidateCellRange:(id)a3 fittingRange:(id)a4 invalidateSize:(BOOL)a5;
- (void)invalidateComments;
- (void)invalidateFrozenHeaders;
- (void)invalidateSelection;
- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5;
- (void)orientationDidChange:(id)a3;
- (void)p_editingDidEnd;
- (void)p_hideSelectionLayers;
- (void)p_invalidateCellCommentBadges;
- (void)popAnimation;
- (void)pushAnimation:(id)a3;
- (void)recursivelyDrawInContext:(CGContext *)a3;
- (void)screenScaleDidChange;
- (void)setAnimationController:(id)a3;
- (void)setCellDragController:(id)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInCellRange:(id)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setRatingsDragCellID:(id)a3;
- (void)updateChildrenFromLayout;
- (void)updateFromLayout;
- (void)validateFrozenHeaderColumns;
- (void)validateFrozenHeaderCorner;
- (void)validateFrozenHeaderRows;
- (void)validateFrozenHeaderTableBodyMask;
- (void)validateStrokesInEditingSpillingTextRange;
- (void)validateTableName;
- (void)validateVisibleRect;
- (void)viewScaleDidChange;
@end

@implementation TSTTableRep

- (TSTTableModel)tableModel
{
  v2 = [(TSTTableRep *)self tableInfo];

  return [(TSTTableInfo *)v2 tableModel];
}

- (TSTEditingState)editingState
{
  v2 = [(TSTTableRep *)self tableInfo];

  return [(TSTTableInfo *)v2 editingState];
}

- (TSTMasterLayout)masterLayout
{
  v2 = [(TSTTableRep *)self tableInfo];

  return [(TSTTableInfo *)v2 masterLayout];
}

- (TSDCanvasView)canvasView
{
  if (![(TSDCanvas *)self->super.super.mCanvas isCanvasInteractive]) {
    return 0;
  }
  v3 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] layerHost];

  return (TSDCanvasView *)[(TSDCanvasLayerHosting *)v3 canvasView];
}

- (TSDEditorController)editorController
{
  if (![(TSDCanvas *)self->super.super.mCanvas isCanvasInteractive]) {
    return 0;
  }
  v3 = [(TSDRep *)self interactiveCanvasController];

  return [(TSDInteractiveCanvasController *)v3 editorController];
}

- (CGAffineTransform)transformToCanvas
{
  [(TSDRep *)self frameInUnscaledCanvas];

  return CGAffineTransformMakeTranslation(retstr, v4, v5);
}

- (CGAffineTransform)transformFromCanvas
{
  if (self) {
    [(TSTTableRep *)self transformToCanvas];
  }
  else {
    memset(&v5, 0, sizeof(v5));
  }
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGRect)canvasVisibleRect
{
  v2 = [(TSDRep *)self canvas];

  [(TSDCanvas *)v2 visibleUnscaledRectForClippingReps];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CALayer)layerForRep
{
  double v3 = [(TSDRep *)self interactiveCanvasController];

  return (CALayer *)[(TSDInteractiveCanvasController *)v3 layerForRep:self];
}

- (TSTCellRegion)selectionRegion
{
  if ([(TSTMasterLayout *)[(TSTTableRep *)self masterLayout] isDynamicallyChangingSelection])
  {
    double v3 = [(TSTTableRep *)self masterLayout];
    return [(TSTMasterLayout *)v3 dynamicSelectionRegion];
  }
  else
  {
    id v5 = [(TSTTableRep *)self editorSelection];
    return (TSTCellRegion *)[v5 cellRegion];
  }
}

- (id)hitRep:(CGPoint)a3
{
  return 0;
}

- (id)hitRepChrome:(CGPoint)a3
{
  return 0;
}

- (id)repForDragging
{
  if (self->mContainedTextEditingRep) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)TSTTableRep;
  return [(TSDRep *)&v3 repForDragging];
}

- (CGRect)layerFrameInScaledCanvas
{
  mCanvas = self->super.super.mCanvas;
  [(TSDRep *)self frameInUnscaledCanvas];
  -[TSDCanvas convertUnscaledToBoundsRect:](mCanvas, "convertUnscaledToBoundsRect:");
  double v8 = TSDRoundedRectForScale(v4, v5, v6, v7, self->mCurrentScreenScale);
  double v10 = v9;
  double v12 = TSDCeilSize(v11);
  double v14 = v13;
  double v15 = v8;
  double v16 = v10;
  result.size.height = v14;
  result.size.width = v12;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)newCommandToApplyGeometry:(id)a3 toInfo:(id)a4
{
  return 0;
}

- (void)dealloc
{
  self->mHyperlinkField = 0;
  self->mTableChrome = 0;

  self->mReferences = 0;
  mOverlayTableName = self->mOverlayTableName;
  if (mOverlayTableName)
  {
    [(TSDTilingLayer *)mOverlayTableName setDelegate:0];

    self->mOverlayTableName = 0;
  }
  if (self->mOverlayFrozenHeaderColumns)
  {
    [(CALayer *)self->mOverlayFrozenHeaderColumnsMask setDelegate:0];

    self->mOverlayFrozenHeaderColumnsMask = 0;
    [(TSDTilingLayer *)self->mOverlayFrozenHeaderColumns setDelegate:0];

    self->mOverlayFrozenHeaderColumns = 0;
  }
  if (self->mOverlayFrozenHeaderRows)
  {
    [(CALayer *)self->mOverlayFrozenHeaderRowsMask setDelegate:0];

    self->mOverlayFrozenHeaderRowsMask = 0;
    [(TSDTilingLayer *)self->mOverlayFrozenHeaderRows setDelegate:0];

    self->mOverlayFrozenHeaderRows = 0;
  }
  mOverlayFrozenHeaderCorner = self->mOverlayFrozenHeaderCorner;
  if (mOverlayFrozenHeaderCorner)
  {
    [(TSDTilingLayer *)mOverlayFrozenHeaderCorner setDelegate:0];

    self->mOverlayFrozenHeaderCorner = 0;
  }
  if (self->mOverlayFrozenHeaderTableBodyMask)
  {
    [(CALayer *)self->mOverlayFrozenHeaderTableNameMask removeFromSuperlayer];
    [(CALayer *)self->mOverlayFrozenHeaderTableNameMask setDelegate:0];

    self->mOverlayFrozenHeaderTableNameMask = 0;
    [(CALayer *)self->mOverlayFrozenHeaderTableBodyMask removeFromSuperlayer];
    [(CALayer *)self->mOverlayFrozenHeaderTableBodyMask setDelegate:0];

    self->mOverlayFrozenHeaderTableBodyMask = 0;
  }
  [(TSTSelectionDragController *)self->mCellDragController setTableRep:0];
  self->mCellDragController = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSTTableRep;
  [(TSWPTextHostRep *)&v5 dealloc];
}

+ (Class)tableRepDelegateClass
{
  return 0;
}

- (TSTTableRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSTTableRep;
  double v4 = [(TSWPTextHostRep *)&v9 initWithLayout:a3 canvas:a4];
  if (v4)
  {
    id v5 = +[TSTConfiguration sharedTableConfiguration];
    v4->mDragByHandleOnly = [v5 dragByHandleOnly];
    v4->mSelectionUsesBezierPath = [v5 selectionUsesBezierPath];
    v4->mSelectsCellOnInitialTap = [v5 selectsCellOnInitialTap];
    v4->mUsesWholeChromeResizer = [v5 usesWholeChromeResizer];
    unint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "integerForKey:", @"TSTTableRepRatingCellDragging");
    if (v6 <= 1) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    TSTTableRepRatingCellDraggingValue = v7;
    v4->mVisibleFillKnobs = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    v4->mAnimationStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v4;
}

- (BOOL)shouldRestartTextEditing
{
  return 0;
}

- (BOOL)shouldCommitPendingTextEdit
{
  return 0;
}

- (BOOL)handlesEditMenu
{
  int v3 = [(TSTEditingState *)[(TSTTableRep *)self editingState] editingMode];
  if ([(TSDRep *)self isLocked]) {
    return 0;
  }
  if (v3) {
    return 1;
  }
  return self->super.super.mKnobTracker != 0;
}

- (void)updateChildrenFromLayout
{
  v2.receiver = self;
  v2.super_class = (Class)TSTTableRep;
  [(TSWPTextHostRep *)&v2 updateChildrenFromLayout];
}

- (BOOL)isDraggable
{
  if (!objc_msgSend(-[TSDRep info](self, "info"), "isInlineWithText")) {
    return 1;
  }
  int v3 = [(TSTTableRep *)self tableLayout];

  return TSTLayoutIsPartitionAlongTop(v3);
}

- (CGRect)deviceBoundsForCellRange:(id)a3
{
  long long v27 = TSDRectUnit;
  long long v28 = *(_OWORD *)&qword_223839568;
  id v5 = [(TSTTableRep *)self tableLayout];
  TSTLayoutGetViewScale(v5);
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeScale(&v26, v6, v6);
  v29.origin.double x = TSTLayoutGetAlignedStrokeFrameForRange(v5, *(void *)&a3);
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  CGAffineTransform v24 = v26;
  CGRect v25 = CGRectApplyAffineTransform(v29, &v24);
  double CanvasRectForRect = TSTLayoutGetCanvasRectForRect(v5, x, y, width, height);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [(TSTTableRep *)self contentsRectForCellRangeAcrossSpaces:a3 contentsCenterInfo:0 canvasFrame:&v25 contentsRect:&v27];
  memset(&v23, 0, sizeof(v23));
  TSTLayoutGetTransformToDevice(v5, &v23);
  CGAffineTransform v22 = v23;
  v30.origin.double x = CanvasRectForRect;
  v30.origin.double y = v13;
  v30.size.double width = v15;
  v30.size.double height = v17;
  CGRect result = CGRectApplyAffineTransform(v30, &v22);
  if (*(double *)&v27 > 0.0) {
    result.origin.double x = result.origin.x + result.size.width * *(double *)&v27;
  }
  double v18 = 1.0;
  double v19 = *(double *)&v28;
  if (*(double *)&v27 <= 0.0) {
    double v19 = 1.0;
  }
  double v20 = result.size.width * v19;
  if (*((double *)&v27 + 1) > 0.0)
  {
    result.origin.double y = result.origin.y + result.size.height * *((double *)&v27 + 1);
    double v18 = *((double *)&v28 + 1);
  }
  double v21 = result.size.height * v18;
  result.size.double height = v21;
  result.size.double width = v20;
  return result;
}

- (CGRect)canvasBoundsForCellRange:(id)a3
{
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  double v6 = 1.0 / v5;
  [(TSTTableRep *)self deviceBoundsForCellRange:a3];

  double v11 = TSDMultiplyRectScalar(v7, v8, v9, v10, v6);
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)boundsForCellSelection:(id)a3
{
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)[(TSDRep *)self layout] geometry] size];
  if (a3.var1 == 255) {
    uint64_t var1 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t var1 = a3.var1;
  }
  if (a3.var0 == 0xFFFF) {
    uint64_t var0 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t var0 = a3.var0;
  }
  unint64_t v7 = var1 | (var0 << 32);
  CGFloat v8 = [(TSTTableRep *)self tableLayout];

  double FrameForGridRange = TSTLayoutGetFrameForGridRange(v8, v7, v7);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = FrameForGridRange;
  return result;
}

- (void)contentsRectForCellRangeAcrossSpaces:(id)a3 contentsCenterInfo:(id *)a4 canvasFrame:(CGRect *)a5 contentsRect:(CGRect *)a6
{
  __int16 v11 = ~a3.var0.var0;
  double x = a5->origin.x;
  double y = a5->origin.y;
  double width = a5->size.width;
  double height = a5->size.height;
  double v17 = 0.0;
  double v16 = 0.0;
  double v18 = 1.0;
  double v19 = 1.0;
  double v20 = [(TSTTableRep *)self tableLayout];
  Space = (void *)TSTLayoutGetSpace([(TSTTableRep *)self tableLayout]);
  uint64_t FrozenHeaderRowsSpace = TSTLayoutGetFrozenHeaderRowsSpace(v20);
  uint64_t FrozenHeaderColumnsSpace = TSTLayoutGetFrozenHeaderColumnsSpace(v20);
  if (v11)
  {
    if ((*(void *)&a3 & 0xFF0000) != 0xFF0000)
    {
      if (HIWORD(*(unint64_t *)&a3))
      {
        if ((*(void *)&a3 & 0xFFFF00000000) != 0)
        {
          uint64_t v24 = FrozenHeaderColumnsSpace;
          if (FrozenHeaderRowsSpace | FrozenHeaderColumnsSpace)
          {
            [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
            memset(&v64, 0, sizeof(v64));
            CGAffineTransformMakeScale(&v64, v25, v25);
            v65.origin.double x = TSTLayoutGetAlignedMaskRectForSpace(v20, Space);
            CGAffineTransform v63 = v64;
            CGRect v66 = CGRectApplyAffineTransform(v65, &v63);
            CGRect v67 = CGRectIntegral(v66);
            double v59 = v67.origin.x;
            CGFloat v60 = v67.size.width;
            CGFloat v61 = v67.size.height;
            double v62 = v67.origin.y;
            if (!v24 || !TSTLayoutGetFrozenHeaderColumnsFloating(v20) || a4 && a4->var1 <= 0.0)
            {
LABEL_37:
              if (!FrozenHeaderRowsSpace)
              {
LABEL_74:
                a5->origin.double x = x;
                a5->origin.double y = y;
                a5->size.double width = width;
                a5->size.double height = height;
                a6->origin.double x = v17;
                a6->origin.double y = v16;
                a6->size.double width = v18;
                a6->size.double height = v19;
                return;
              }
              goto LABEL_38;
            }
            v68.origin.double x = x;
            v68.origin.double y = y;
            v68.size.double width = width;
            v68.size.double height = height;
            double MinX = CGRectGetMinX(v68);
            v69.origin.double x = v59;
            v69.size.double width = v60;
            v69.size.double height = v61;
            v69.origin.double y = v62;
            if (MinX >= CGRectGetMinX(v69))
            {
LABEL_36:
              double v16 = 0.0;
              goto LABEL_37;
            }
            unint64_t Range = TSTLayoutSpaceGetRange(v24);
            unint64_t v28 = 0;
            uint64_t v29 = 16711680;
            uint64_t v30 = 0xFFFFLL;
            if ((_WORD)Range != 0xFFFF)
            {
              unint64_t v31 = 0;
              if ((Range & 0xFF0000) == 0xFF0000) {
                goto LABEL_31;
              }
              unint64_t v28 = 0;
              uint64_t v29 = 16711680;
              uint64_t v30 = 0xFFFFLL;
              if (HIWORD(Range))
              {
                unint64_t v31 = 0;
                if ((Range & 0xFFFF00000000) != 0)
                {
                  uint64_t v30 = 0;
                  unsigned int v32 = BYTE2(Range) <= a3.var0.var1 ? a3.var0.var1 : BYTE2(Range);
                  uint64_t v33 = (unsigned __int16)Range <= a3.var0.var0 ? a3.var0.var0 : (unsigned __int16)Range;
                  unsigned int v34 = (BYTE4(Range) + BYTE2(Range) - 1) >= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1)
                      ? (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1)
                      : (BYTE4(Range) + BYTE2(Range) - 1);
                  unsigned int v35 = (unsigned __int16)(Range + HIWORD(Range) - 1) >= (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1)
                      ? (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1)
                      : (unsigned __int16)(Range + HIWORD(Range) - 1);
                  uint64_t v29 = 0;
                  unint64_t v28 = 0;
                  unint64_t v31 = 0;
                  if (v33 <= v35 && v32 <= v34)
                  {
                    unint64_t v31 = ((unint64_t)(v35 - v33) << 48) + 0x1000000000000;
                    unint64_t v28 = (unint64_t)(unsigned __int16)(v34 - v32 + 1) << 32;
                    uint64_t v29 = v32 << 16;
                    uint64_t v30 = v33;
                  }
                }
                goto LABEL_31;
              }
            }
            unint64_t v31 = 0;
LABEL_31:
            if (!HIWORD(v31) || (unint64_t v36 = v29 | v31 | v30 | v28, (v36 & 0xFFFF00000000) == 0))
            {
              v74.origin.double x = x;
              v74.origin.double y = y;
              v74.size.double width = width;
              v74.size.double height = height;
              double MaxX = CGRectGetMaxX(v74);
              v75.size.double width = v60;
              v75.origin.double x = v59;
              v75.size.double height = v61;
              v75.origin.double y = v62;
              if (MaxX < CGRectGetMinX(v75)) {
                goto LABEL_77;
              }
              if (a4 && a4->var0)
              {
                double v48 = v59 - x;
                double var2 = a4->var2;
                double v16 = 0.0;
                if (v59 - x <= var2)
                {
                  double v17 = v48 / a4->var1;
                }
                else
                {
                  double var1 = a4->var1;
                  if (width - v48 <= var2 + a4->var3) {
                    double v17 = 1.0 - (width - v48) / var1;
                  }
                  else {
                    double v17 = var2 / var1;
                  }
                }
              }
              else
              {
                double v48 = v59 - x;
                double v17 = (v59 - x) / width;
                double v16 = 0.0;
              }
              double x = v59;
              double v18 = 1.0 - v17;
              double width = width - v48;
              if (!FrozenHeaderRowsSpace) {
                goto LABEL_74;
              }
LABEL_38:
              if (!TSTLayoutGetFrozenHeaderRowsFloating(v20) || a4 && a4->var4 <= 0.0) {
                goto LABEL_74;
              }
              v72.origin.double x = x;
              v72.origin.double y = y;
              v72.size.double width = width;
              v72.size.double height = height;
              double MinY = CGRectGetMinY(v72);
              v73.origin.double x = v59;
              v73.size.double width = v60;
              v73.size.double height = v61;
              v73.origin.double y = v62;
              if (MinY >= CGRectGetMinY(v73)) {
                goto LABEL_73;
              }
              unint64_t v38 = TSTLayoutSpaceGetRange(FrozenHeaderRowsSpace);
              unint64_t v39 = 0;
              uint64_t v40 = 16711680;
              uint64_t v41 = 0xFFFFLL;
              if ((_WORD)v38 != 0xFFFF)
              {
                unint64_t v42 = 0;
                if ((v38 & 0xFF0000) == 0xFF0000) {
                  goto LABEL_68;
                }
                unint64_t v39 = 0;
                uint64_t v40 = 16711680;
                uint64_t v41 = 0xFFFFLL;
                if (HIWORD(v38))
                {
                  unint64_t v42 = 0;
                  if ((v38 & 0xFFFF00000000) != 0)
                  {
                    uint64_t v41 = 0;
                    unsigned int v43 = BYTE2(v38) <= a3.var0.var1 ? a3.var0.var1 : BYTE2(v38);
                    uint64_t v44 = (unsigned __int16)v38 <= a3.var0.var0 ? a3.var0.var0 : (unsigned __int16)v38;
                    unsigned int v45 = (BYTE4(v38) + BYTE2(v38) - 1) >= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1)
                        ? (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1)
                        : (BYTE4(v38) + BYTE2(v38) - 1);
                    unsigned int v46 = (unsigned __int16)(v38 + HIWORD(v38) - 1) >= (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1)
                        ? (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1)
                        : (unsigned __int16)(v38 + HIWORD(v38) - 1);
                    uint64_t v40 = 0;
                    unint64_t v39 = 0;
                    unint64_t v42 = 0;
                    if (v44 <= v46 && v43 <= v45)
                    {
                      unint64_t v42 = ((unint64_t)(v46 - v44) << 48) + 0x1000000000000;
                      unint64_t v39 = (unint64_t)(unsigned __int16)(v45 - v43 + 1) << 32;
                      uint64_t v40 = v43 << 16;
                      uint64_t v41 = v44;
                    }
                  }
                  goto LABEL_68;
                }
              }
              unint64_t v42 = 0;
LABEL_68:
              if (HIWORD(v42))
              {
                unint64_t v51 = v40 | v42 | v41 | v39;
                if ((v51 & 0xFFFF00000000) != 0)
                {
                  if (((v51 ^ *(void *)&a3) & 0xFFFFFFFF00FFFFFFLL) != 0)
                  {
                    v76.origin.double x = x;
                    v76.origin.double y = y;
                    v76.size.double width = width;
                    v76.size.double height = height;
                    double MaxY = CGRectGetMaxY(v76);
                    v77.origin.double x = v59;
                    v77.size.double width = v60;
                    v77.size.double height = v61;
                    v77.origin.double y = v62;
                    if (MaxY < CGRectGetMinY(v77))
                    {
                      double height = v62 - y;
                      double v19 = 1.00000012;
                    }
                  }
LABEL_73:
                  double v16 = 0.0;
                  goto LABEL_74;
                }
              }
              v78.origin.double x = x;
              v78.origin.double y = y;
              v78.size.double width = width;
              v78.size.double height = height;
              double v52 = CGRectGetMaxY(v78);
              v79.origin.double x = v59;
              v79.size.double width = v60;
              v79.size.double height = v61;
              v79.origin.double y = v62;
              if (v52 >= CGRectGetMinY(v79))
              {
                if (a4 && a4->var0)
                {
                  double v54 = v62 - y;
                  double y = v62;
                  double var5 = a4->var5;
                  if (v54 <= var5)
                  {
                    double v16 = v54 / a4->var4;
                  }
                  else
                  {
                    double var4 = a4->var4;
                    if (height - v54 <= var5 + a4->var6) {
                      double v16 = 1.0 - (height - v54) / var4;
                    }
                    else {
                      double v16 = var5 / var4;
                    }
                  }
                }
                else
                {
                  double v54 = v62 - y;
                  double y = v62;
                  double v16 = v54 / height;
                }
                double v19 = 1.0 - v16;
                double height = height - v54;
                goto LABEL_74;
              }
LABEL_77:
              CGSize v53 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
              a5->origin = (CGPoint)*MEMORY[0x263F001A8];
              a5->size = v53;
              a6->origin = (CGPoint)CGRectEmptyUnitSquare;
              a6->size = *(CGSize *)algn_22383BF30;
              return;
            }
            if (((v36 ^ *(void *)&a3) & 0xFFFFFFFF00FFFFFFLL) != 0)
            {
              v70.origin.double x = x;
              v70.origin.double y = y;
              v70.size.double width = width;
              v70.size.double height = height;
              double v57 = CGRectGetMaxX(v70);
              v71.size.double width = v60;
              v71.origin.double x = v59;
              v71.size.double height = v61;
              v71.origin.double y = v62;
              if (v57 < CGRectGetMinX(v71))
              {
                double width = v59 - x;
                double v18 = 1.00000012;
              }
            }
            goto LABEL_36;
          }
        }
      }
    }
  }
}

- (id)editorSelection
{
  return 0;
}

- (void)updateFromLayout
{
  int v3 = [(TSTTableRep *)self tableLayout];
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  CGFloat v5 = v4;
  TSTLayoutSetViewScale(v3, v4);
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  TSTTableRepSetupUserSpaceToDeviceSpaceTransform(self, v5, v6);
  if (TSTLayoutSetTabsVisible((uint64_t)[(TSTTableRep *)self tableLayout], 0)) {
    [(TSDRep *)self invalidateKnobs];
  }
  [(TSTTableRep *)self validateVisibleRect];
  if (!self->super.super.mSelectionHighlightLayerValid) {
    [(TSTTableChromeProvider *)[(TSTTableRep *)self tableChrome] selectionHighlightLayerInvalidateLayout];
  }
  $CA3468F20078D5D2DB35E78E73CA60DA v7 = [(TSTLayout *)[(TSTTableRep *)self tableLayout] editingSpillingTextRange];
  if (v7.var0.var0 != 0xFFFF
    && (*(void *)&v7 & 0xFF0000) != 0xFF0000
    && HIWORD(*(unint64_t *)&v7)
    && (*(void *)&v7 & 0xFFFF00000000) != 0)
  {
    [(TSTTableRep *)self dirtyCellRange:[(TSTLayout *)[(TSTTableRep *)self tableLayout] editingSpillingTextRange]];
  }
  unint64_t Range = TSTMasterLayoutGetRange((uint64_t)[(TSTLayout *)v3 masterLayout]);
  unint64_t v9 = TSTMasterLayoutExpandCellRangeToCoverMergedCells([(TSTTableRep *)self masterLayout], *(void *)&self->mDirtyCellRange);
  BOOL v10 = [(TSTMasterLayout *)[(TSTTableRep *)self masterLayout] emptyFilteredTable];
  uint64_t v11 = v9 & 0xFF0000;
  if (!v10 || (unsigned __int16)v9 == 0xFFFFLL || v11 == 16711680 || !HIWORD(v9) || (v9 & 0xFFFF00000000) == 0)
  {
    unint64_t v12 = 0;
    uint64_t v13 = 16711680;
    uint64_t v14 = 0xFFFFLL;
    if ((unsigned __int16)v9 != 0xFFFFLL)
    {
      unint64_t v15 = 0;
      if (v11 == 16711680) {
        goto LABEL_38;
      }
      unint64_t v12 = 0;
      uint64_t v13 = 16711680;
      uint64_t v14 = 0xFFFFLL;
      if (HIWORD(v9))
      {
        unint64_t v15 = 0;
        if ((v9 & 0xFFFF00000000) == 0) {
          goto LABEL_38;
        }
        unint64_t v12 = 0;
        uint64_t v13 = 16711680;
        uint64_t v14 = 0xFFFFLL;
        if ((_WORD)Range != 0xFFFF)
        {
          unint64_t v15 = 0;
          if ((Range & 0xFF0000) != 0xFF0000)
          {
            unint64_t v12 = 0;
            uint64_t v13 = 16711680;
            uint64_t v14 = 0xFFFFLL;
            if (HIWORD(Range))
            {
              unint64_t v15 = 0;
              if ((Range & 0xFFFF00000000) != 0)
              {
                uint64_t v14 = 0;
                if (BYTE2(v9) <= BYTE2(Range)) {
                  unsigned int v16 = BYTE2(Range);
                }
                else {
                  unsigned int v16 = BYTE2(v9);
                }
                if ((unsigned __int16)v9 <= (unsigned __int16)Range) {
                  uint64_t v17 = (unsigned __int16)Range;
                }
                else {
                  uint64_t v17 = (unsigned __int16)v9;
                }
                if ((BYTE4(v9) + BYTE2(v9) - 1) >= (BYTE4(Range) + BYTE2(Range) - 1)) {
                  unsigned int v18 = (BYTE4(Range) + BYTE2(Range) - 1);
                }
                else {
                  unsigned int v18 = (BYTE4(v9) + BYTE2(v9) - 1);
                }
                unsigned int v19 = (unsigned __int16)(Range + HIWORD(Range) - 1);
                if ((unsigned __int16)(v9 + HIWORD(v9) - 1) < v19) {
                  unsigned int v19 = (unsigned __int16)(v9 + HIWORD(v9) - 1);
                }
                uint64_t v13 = 0;
                unint64_t v12 = 0;
                unint64_t v15 = 0;
                if (v17 <= v19 && v16 <= v18)
                {
                  unint64_t v15 = ((unint64_t)(v19 - v17) << 48) + 0x1000000000000;
                  unint64_t v12 = (unint64_t)(unsigned __int16)(v18 - v16 + 1) << 32;
                  uint64_t v13 = v16 << 16;
                  uint64_t v14 = v17;
                }
              }
              goto LABEL_38;
            }
            goto LABEL_37;
          }
LABEL_38:
          unint64_t Range = v13 | v15 | v14 | v12;
          goto LABEL_39;
        }
      }
    }
LABEL_37:
    unint64_t v15 = 0;
    goto LABEL_38;
  }
LABEL_39:
  self->mDirtyCellunint64_t Range = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  if ((_WORD)Range != 0xFFFF && (Range & 0xFF0000) != 0xFF0000 && HIWORD(Range) && (Range & 0xFFFF00000000) != 0) {
    [(TSTTableRep *)self setNeedsDisplayInCellRange:Range];
  }
  v20.receiver = self;
  v20.super_class = (Class)TSTTableRep;
  [(TSDRep *)&v20 updateFromLayout];
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TSTTableRep;
  [(TSDRep *)&v6 layoutInRootChangedFrom:a3 to:a4 translatedOnly:a5];
  [(TSTTableChromeProvider *)[(TSTTableRep *)self tableChrome] invalidateAllChrome];
}

- (void)validateStrokesInEditingSpillingTextRange
{
  $CA3468F20078D5D2DB35E78E73CA60DA v13 = [(TSTLayout *)[(TSTTableRep *)self tableLayout] editingSpillingTextRange];
  double v4 = [TSTLayoutCellIterator alloc];
  unint64_t v5 = [(TSTTableRep *)self masterLayout];
  uint64_t v14 = [(TSTLayoutCellIterator *)v4 initWithMasterLayout:v5 range:[(TSTLayout *)[(TSTTableRep *)self tableLayout] editingSpillingTextRange] flags:128];
  while (TSTLayoutCellIteratorGetNextCell((uint64_t)v14, v19))
  {
    objc_super v6 = (TSDStroke *)[MEMORY[0x263EFF9D0] null];
    $CA3468F20078D5D2DB35E78E73CA60DA v7 = (TSDStroke *)[MEMORY[0x263EFF9D0] null];
    CGFloat v8 = (TSDStroke *)[MEMORY[0x263EFF9D0] null];
    unint64_t v9 = (TSDStroke *)[MEMORY[0x263EFF9D0] null];
    int v10 = WORD2(v19[0]);
    int v11 = BYTE6(v19[0]);
    id v17 = 0;
    id v18 = 0;
    id v15 = 0;
    id v16 = 0;
    unint64_t v12 = WORD2(v19[0]) | ((unint64_t)BYTE6(v19[0]) << 16) | ((unint64_t)HIBYTE(v19[0]) << 24);
    unint64_t v2 = v12 | v2 & 0xFFFFFFFF00000000;
    TSTMasterLayoutGetStrokesForCellID([(TSTTableRep *)self masterLayout], v2, &v18, &v17, &v16, &v15);
    if (v18 && v10 != v13.var0.var0)
    {
      objc_super v6 = (TSDStroke *)(id)[v18 mutableCopy];
      [(TSDStroke *)v6 setColor:[(TSUColor *)[(TSDStroke *)v6 color] colorWithAlphaComponent:0.100000001]];
      [(TSDStroke *)v6 setDontClearBackground:1];
    }
    if (v16 && v10 != (unsigned __int16)(v13.var0.var0 + v13.var1.var1 - 1))
    {
      $CA3468F20078D5D2DB35E78E73CA60DA v7 = (TSDStroke *)(id)[v16 mutableCopy];
      [(TSDStroke *)v7 setColor:[(TSUColor *)[(TSDStroke *)v7 color] colorWithAlphaComponent:0.100000001]];
      [(TSDStroke *)v7 setDontClearBackground:1];
    }
    if (v17 && v11 != v13.var0.var1)
    {
      CGFloat v8 = (TSDStroke *)(id)[v17 mutableCopy];
      [(TSDStroke *)v8 setColor:[(TSUColor *)[(TSDStroke *)v8 color] colorWithAlphaComponent:0.100000001]];
      [(TSDStroke *)v8 setDontClearBackground:1];
    }
    if (v15 && v11 != (LOBYTE(v13.var1.var0) + v13.var0.var1 - 1))
    {
      unint64_t v9 = (TSDStroke *)(id)[v15 mutableCopy];
      [(TSDStroke *)v9 setColor:[(TSUColor *)[(TSDStroke *)v9 color] colorWithAlphaComponent:0.100000001]];
      [(TSDStroke *)v9 setDontClearBackground:1];
    }
    unint64_t v5 = v12 | v5 & 0xFFFFFFFF00000000;
    TSTMasterLayoutSetStrokesForCellID([(TSTTableRep *)self masterLayout], v5, v6, v7, v9, v8);
  }
  TSTMasterLayoutSetStrokesValidForRange([(TSTTableRep *)self masterLayout], *(void *)&v13);
}

- (void)validateVisibleRect
{
  [(TSTLayout *)[(TSTTableRep *)self tableLayout] validate];
  if ([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive]) {
    [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] animatingViewScale];
  }
  int v3 = [(TSTTableRep *)self tableLayout];
  [(TSTTableRep *)self canvasVisibleRect];
  TSTLayoutSetCanvasVisibleRect((uint64_t)v3, v4, v5, v6, v7);
  [(TSTTableRep *)self p_frozenHeaderOverlayLayers];
  if (self->mOverlayTableName) {
    [(TSTTableRep *)self validateTableName];
  }
  if (self->mOverlayFrozenHeaderCorner) {
    [(TSTTableRep *)self validateFrozenHeaderCorner];
  }
  if (self->mOverlayFrozenHeaderRows) {
    [(TSTTableRep *)self validateFrozenHeaderRows];
  }
  if (self->mOverlayFrozenHeaderColumns) {
    [(TSTTableRep *)self validateFrozenHeaderColumns];
  }
  if (self->mOverlayFrozenHeaderTableBodyMask)
  {
    [(TSTTableRep *)self validateFrozenHeaderTableBodyMask];
  }
}

- (BOOL)isFullyVisibleWithBorder:(int)a3
{
  [(TSTTableRep *)self canvasVisibleRect];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  v23.origin.CGFloat x = TSTLayoutGetCanvasStrokeFrame([(TSTTableRep *)self tableLayout]);
  CGRect v24 = CGRectInset(v23, (double)-a3, (double)-a3);
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  uint64_t v17 = v6;
  uint64_t v18 = v8;
  uint64_t v19 = v10;
  uint64_t v20 = v12;

  return CGRectContainsRect(*(CGRect *)&v17, *(CGRect *)&x);
}

- (void)viewScaleDidChange
{
  TSTLayoutInvalidateLayoutSpaceTableOffsets([(TSTTableRep *)self tableLayout]);
  [(TSTTableChromeProvider *)[(TSTTableRep *)self tableChrome] invalidateAllChrome];
  [(TSTTableChromeProvider *)[(TSTTableRep *)self tableChrome] invalidateAddressBarSelection];
  v3.receiver = self;
  v3.super_class = (Class)TSTTableRep;
  [(TSDRep *)&v3 viewScaleDidChange];
}

- (void)screenScaleDidChange
{
  v2.receiver = self;
  v2.super_class = (Class)TSTTableRep;
  [(TSDRep *)&v2 screenScaleDidChange];
}

- (void)invalidateSelection
{
  [(TSDRep *)self invalidateKnobPositions];
  mKnobTracker = self->super.super.mKnobTracker;
  if (!mKnobTracker || ![(TSDKnobTracker *)mKnobTracker didBegin]) {
    [(TSDRep *)self invalidateKnobs];
  }
  [(TSTTableChromeProvider *)[(TSTTableRep *)self tableChrome] invalidateAddressBarSelection];
  double v4 = [(TSTTableRep *)self tableChrome];

  [(TSTTableChromeProvider *)v4 selectionHighlightLayerInvalidateDisplay];
}

- (void)invalidateCellRange:(id)a3
{
}

- (void)invalidateCellRange:(id)a3 fittingRange:(id)a4 invalidateSize:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = [(TSTTableRep *)self tableLayout];
  TSTLayoutInvalidateCellRangeAndFittingRange(v8);
  [(TSTTableRep *)self dirtyCellRange:a3];
  if (v5)
  {
    [(TSTLayout *)v8 invalidateSize];
    [(TSTTableChromeProvider *)[(TSTTableRep *)self tableChrome] invalidateAllChrome];
  }
  if ([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive])
  {
    [(TSTTableRep *)self invalidateSelection];
  }
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableRep;
  [(TSDRep *)&v3 setNeedsDisplay];
  [(TSDTilingLayer *)self->mOverlayFrozenHeaderRows setNeedsDisplay];
  [(TSDTilingLayer *)self->mOverlayFrozenHeaderColumns setNeedsDisplay];
  [(TSDTilingLayer *)self->mOverlayFrozenHeaderCorner setNeedsDisplay];
  [(TSDTilingLayer *)self->mOverlayTableName setNeedsDisplay];
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    v64.receiver = self;
    v64.super_class = (Class)TSTTableRep;
    -[TSDRep setNeedsDisplayInRect:](&v64, sel_setNeedsDisplayInRect_, x, y, width, height);
    uint64_t v8 = [(TSTTableRep *)self tableLayout];
    uint64_t FrozenHeaderRowsSpace = TSTLayoutGetFrozenHeaderRowsSpace(v8);
    uint64_t FrozenHeaderColumnsSpace = TSTLayoutGetFrozenHeaderColumnsSpace(v8);
    uint64_t FrozenHeaderCornerSpace = TSTLayoutGetFrozenHeaderCornerSpace(v8);
    BOOL v12 = [(TSTLayout *)v8 newCanvasRevealedVertically];
    [(TSTLayout *)v8 setNewCanvasRevealedVertically:0];
    BOOL v13 = [(TSTLayout *)v8 newCanvasRevealedHorizontally];
    [(TSTLayout *)v8 setNewCanvasRevealedHorizontally:0];
    -[TSDRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:", x, y, width, height);
    double v15 = v14;
    double v17 = v16;
    double r1 = v18;
    double v20 = v19;
    -[TSDRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:", x, y, width, height);
    CGFloat v61 = v22;
    CGFloat v62 = v21;
    CGFloat rect2 = v23;
    CGFloat v25 = v24;
    if (!FrozenHeaderRowsSpace) {
      goto LABEL_6;
    }
    if (!self->mOverlayFrozenHeaderRows) {
      goto LABEL_6;
    }
    double Frame = TSTLayoutSpaceGetFrame(FrozenHeaderRowsSpace);
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    [(TSDTilingLayer *)self->mOverlayFrozenHeaderRows frame];
    v73.origin.double y = v61;
    v73.origin.double x = v62;
    v73.size.double width = rect2;
    v73.size.double height = v25;
    if (CGRectIntersectsRect(v65, v73))
    {
      v66.origin.double x = Frame;
      v66.origin.double y = v28;
      v66.size.double width = v30;
      v66.size.double height = v32;
      v74.origin.double x = v15;
      v74.origin.double y = v17;
      v74.size.double width = r1;
      v74.size.double height = v20;
      int v33 = !CGRectIntersectsRect(v66, v74);
    }
    else
    {
LABEL_6:
      int v33 = 0;
    }
    if (FrozenHeaderColumnsSpace && self->mOverlayFrozenHeaderColumns)
    {
      CGFloat v34 = v20;
      double v35 = TSTLayoutSpaceGetFrame(FrozenHeaderColumnsSpace);
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderColumns frame];
      v75.origin.double y = v61;
      v75.origin.double x = v62;
      v75.size.double width = rect2;
      v75.size.double height = v25;
      if (CGRectIntersectsRect(v67, v75))
      {
        v68.origin.double x = v35;
        v68.origin.double y = v37;
        v68.size.double width = v39;
        v68.size.double height = v41;
        v76.origin.double x = v15;
        v76.origin.double y = v17;
        v76.size.double width = r1;
        double v20 = v34;
        v76.size.double height = v34;
        int v42 = !CGRectIntersectsRect(v68, v76);
      }
      else
      {
        int v42 = 0;
        double v20 = v34;
      }
    }
    else
    {
      int v42 = 0;
    }
    if (FrozenHeaderCornerSpace && self->mOverlayFrozenHeaderCorner)
    {
      CGFloat v43 = v20;
      double v44 = TSTLayoutSpaceGetFrame(FrozenHeaderCornerSpace);
      CGFloat v46 = v45;
      CGFloat v48 = v47;
      CGFloat v50 = v49;
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderCorner frame];
      v77.origin.double y = v61;
      v77.origin.double x = v62;
      v77.size.double width = rect2;
      v77.size.double height = v25;
      if (CGRectIntersectsRect(v69, v77))
      {
        v70.origin.double x = v44;
        v70.origin.double y = v46;
        v70.size.double width = v48;
        v70.size.double height = v50;
        v78.origin.double x = v15;
        v78.origin.double y = v17;
        v78.size.double width = r1;
        double v20 = v43;
        v78.size.double height = v43;
        BOOL v51 = CGRectIntersectsRect(v70, v78);
        v33 |= !v51;
        v42 |= !v51;
      }
      else
      {
        double v20 = v43;
      }
    }
    double v52 = -0.0;
    if (v12 | v42) {
      double v53 = v15;
    }
    else {
      double v53 = -0.0;
    }
    if (v12 | v42) {
      double v54 = 0.0;
    }
    else {
      double v54 = v15;
    }
    if (v13 | v33) {
      double v52 = v17;
    }
    double v55 = v20 + v52;
    if (v13 | v33) {
      double v56 = 0.0;
    }
    else {
      double v56 = v17;
    }
    if (FrozenHeaderRowsSpace)
    {
      mOverlayFrozenHeaderRows = self->mOverlayFrozenHeaderRows;
      if (mOverlayFrozenHeaderRows) {
        -[TSDTilingLayer setNeedsDisplayInRect:](mOverlayFrozenHeaderRows, "setNeedsDisplayInRect:", v15, v56, r1, v55);
      }
    }
    if (FrozenHeaderColumnsSpace)
    {
      mOverlayFrozenHeaderColumns = self->mOverlayFrozenHeaderColumns;
      if (mOverlayFrozenHeaderColumns) {
        -[TSDTilingLayer setNeedsDisplayInRect:](mOverlayFrozenHeaderColumns, "setNeedsDisplayInRect:", v54, v17, r1 + v53, v20);
      }
    }
    if (FrozenHeaderCornerSpace)
    {
      mOverlayFrozenHeaderCorner = self->mOverlayFrozenHeaderCorner;
      if (mOverlayFrozenHeaderCorner)
      {
        v71.origin.double x = v15;
        v71.origin.double y = v56;
        v71.size.double width = r1;
        v71.size.double height = v55;
        v79.origin.double x = v54;
        v79.origin.double y = v17;
        v79.size.double width = r1 + v53;
        v79.size.double height = v20;
        CGRect v72 = CGRectUnion(v71, v79);
        -[TSDTilingLayer setNeedsDisplayInRect:](mOverlayFrozenHeaderCorner, "setNeedsDisplayInRect:", v72.origin.x, v72.origin.y, v72.size.width, v72.size.height);
      }
    }
  }
}

- (void)setNeedsDisplayInCellRange:(id)a3
{
  BOOL v5 = [(TSTLayout *)[(TSTTableRep *)self tableLayout] spaceBundle];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__TSTTableRep_setNeedsDisplayInCellRange___block_invoke;
  v6[3] = &unk_2646B3320;
  v6[4] = self;
  v6[5] = a3;
  [(TSTLayoutSpaceBundle *)v5 performActionOnEachLayoutSpace:v6];
}

uint64_t __42__TSTTableRep_setNeedsDisplayInCellRange___block_invoke(uint64_t a1, TSTLayoutSpace *a2)
{
  unint64_t v4 = TSTLayoutSpaceIntersectionCellRange((uint64_t)a2, *(void *)(a1 + 40));
  unint64_t v5 = v4;
  if ((_WORD)v4 != 0xFFFF)
  {
    BOOL v6 = (v4 & 0xFF0000) == 0xFF0000 || HIWORD(v4) == 0;
    if (!v6 && (v4 & 0xFFFF00000000) != 0)
    {
      v44.origin.CGFloat x = TSTLayoutSpaceGetStrokeFrame((uint64_t)a2);
      CGRect v45 = CGRectInset(v44, -1000.0, -1000.0);
      CGFloat x = v45.origin.x;
      CGFloat y = v45.origin.y;
      CGFloat width = v45.size.width;
      CGFloat height = v45.size.height;
      FrameForunint64_t Range = TSTLayoutSpaceGetFrameForRange(a2, v5);
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      unint64_t Range = TSTLayoutSpaceGetRange((uint64_t)a2);
      unint64_t v21 = Range;
      uint64_t v22 = *(void *)(a1 + 40);
      double v23 = -0.0;
      if (BYTE2(v22) == BYTE2(Range)) {
        double v23 = FrameForRange;
      }
      double v24 = v17 + v23;
      if (BYTE2(v22) == BYTE2(Range)) {
        FrameForunint64_t Range = 0.0;
      }
      if ((BYTE4(v22) + BYTE2(v22) - 1) >= (BYTE4(Range)
                                                                                           + BYTE2(Range)
                                                                                           - 1))
      {
        v46.origin.CGFloat x = FrameForRange;
        v46.origin.CGFloat y = v15;
        v46.size.CGFloat width = v24;
        v46.size.CGFloat height = v19;
        double MaxX = CGRectGetMaxX(v46);
        v47.origin.CGFloat x = x;
        v47.origin.CGFloat y = y;
        v47.size.CGFloat width = width;
        v47.size.CGFloat height = height;
        double v24 = MaxX - CGRectGetMinX(v47);
        uint64_t v22 = *(void *)(a1 + 40);
      }
      double v26 = -0.0;
      if ((unsigned __int16)v22 == (unsigned __int16)v21) {
        double v26 = v15;
      }
      double v27 = v19 + v26;
      if ((unsigned __int16)v22 == (unsigned __int16)v21) {
        double v15 = 0.0;
      }
      if ((unsigned __int16)(v22 + HIWORD(v22) - 1) >= (unsigned __int16)(v21 + HIWORD(v21) - 1))
      {
        double v28 = FrameForRange;
        double v29 = v15;
        double v30 = v24;
        double MaxY = CGRectGetMaxY(*(CGRect *)(&v27 - 3));
        v48.origin.CGFloat x = x;
        v48.origin.CGFloat y = y;
        v48.size.CGFloat width = width;
        v48.size.CGFloat height = height;
        double v27 = MaxY - CGRectGetMinY(v48);
      }
      objc_msgSend(*(id *)(a1 + 32), "convertNaturalRectToLayerRelative:", FrameForRange, v15, v24, v27);
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      if ([(TSTLayoutSpace *)a2 isFrozen])
      {
        if ([(TSTLayoutSpace *)a2 isColumns])
        {
          uint64_t v40 = *(void *)(a1 + 32);
          uint64_t v41 = 400;
        }
        else
        {
          BOOL v42 = [(TSTLayoutSpace *)a2 isRows];
          uint64_t v40 = *(void *)(a1 + 32);
          if (v42) {
            uint64_t v41 = 392;
          }
          else {
            uint64_t v41 = 384;
          }
        }
        objc_msgSend(*(id *)(v40 + v41), "setNeedsDisplayInRect:", v33, v35, v37, v39);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "convertNaturalRectFromLayerRelative:", v33, v35, v37, v39);
        rect.origin.CGFloat y = *(CGFloat *)(a1 + 32);
        *(void *)&rect.size.CGFloat width = TSTTableRep;
        -[CGFloat setNeedsDisplayInRect:]((objc_super *)&rect.origin.y, sel_setNeedsDisplayInRect_);
      }
    }
  }
  return 0;
}

- (void)dirtyCellRange:(id)a3
{
  self->mDirtyCellunint64_t Range = ($6C2899CC353BE70625C5C4ACBB5C74E2)TSTCellRangeUnionCellRange(*(void *)&self->mDirtyCellRange, *(void *)&a3);
}

- (void)p_invalidateCellCommentBadges
{
  if (TSTTableNumberOfComments([(TSTTableRep *)self tableModel]))
  {
    [(TSTTableRep *)self setNeedsDisplay];
  }
}

- (void)invalidateAnnotationColor
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableRep;
  [(TSDRep *)&v3 invalidateAnnotationColor];
  [(TSTTableRep *)self p_invalidateCellCommentBadges];
}

- (void)invalidateComments
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableRep;
  [(TSDRep *)&v3 invalidateComments];
  [(TSTTableRep *)self p_invalidateCellCommentBadges];
}

- (void)orientationDidChange:(id)a3
{
  [(TSDCanvas *)[(TSDRep *)self canvas] layoutInvalidated];
  unint64_t v4 = [(TSTTableRep *)self tableChrome];

  [(TSTTableChromeProvider *)v4 invalidateAllChrome];
}

- (TSTAnimation)currentAnimation
{
  return (TSTAnimation *)[(NSMutableArray *)self->mAnimationStack lastObject];
}

- (void)pushAnimation:(id)a3
{
}

- (void)popAnimation
{
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (self->mOverlayTableName == a3)
  {
    TSTTableRepDrawTableName(self, a4, 0);
  }
  else
  {
    if (self->mOverlayFrozenHeaderCorner == a3)
    {
      uint64_t FrozenHeaderCornerSpace = (TSTLayoutSpace *)TSTLayoutGetFrozenHeaderCornerSpace([(TSTTableRep *)self tableLayout]);
    }
    else if (self->mOverlayFrozenHeaderColumns == a3)
    {
      uint64_t FrozenHeaderCornerSpace = (TSTLayoutSpace *)TSTLayoutGetFrozenHeaderColumnsSpace([(TSTTableRep *)self tableLayout]);
    }
    else
    {
      if (self->mOverlayFrozenHeaderRows != a3) {
        return;
      }
      uint64_t FrozenHeaderCornerSpace = (TSTLayoutSpace *)TSTLayoutGetFrozenHeaderRowsSpace([(TSTTableRep *)self tableLayout]);
    }
    TSTTableRepDrawFrozenHeaderRegion(self, FrozenHeaderCornerSpace, (CALayer *)a3, a4);
  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  if ([a4 isEqualToString:@"delegate"]) {
    return 0;
  }
  unint64_t v5 = (void *)MEMORY[0x263EFF9D0];

  return (id)[v5 null];
}

- (id)overlayLayers
{
  return 0;
}

- (id)additionalLayersOverLayer
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF980] array];
  unint64_t v4 = [(TSKHighlightArrayController *)[(TSWPTextHostRep *)self highlightArrayController] layers];
  if ([(NSArray *)v4 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
          objc_msgSend(v9, "setDelegate:", -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
          [v9 setZPosition:0.0];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v6);
    }
    [v3 addObjectsFromArray:v4];
  }
  uint64_t v10 = [(TSKHighlightArrayController *)[(TSWPTextHostRep *)self pulseArrayController] layers];
  if ([(NSArray *)v10 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
          objc_msgSend(v15, "setDelegate:", -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
          [v15 setZPosition:0.0];
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }
    [v3 addObjectsFromArray:v10];
  }
  objc_msgSend(v3, "addObjectsFromArray:", -[TSTTableRep p_tableNameOverlayLayers](self, "p_tableNameOverlayLayers"));
  objc_msgSend(v3, "addObjectsFromArray:", -[TSTTableRep p_frozenHeaderOverlayLayers](self, "p_frozenHeaderOverlayLayers"));
  return v3;
}

- (id)additionalLayersUnderLayer
{
  return 0;
}

- (id)p_tableNameOverlayLayers
{
  objc_super v3 = (void *)[MEMORY[0x263EFF980] array];
  unint64_t v4 = [(TSTTableRep *)self tableLayout];
  if (TSTLayoutGetTableNameVisible((uint64_t)v4)
    && TSTLayoutIsPartitionAlongLeft(v4)
    && ![(TSTLayout *)v4 inPrintPreviewMode])
  {
    if (self->mOverlayTableName) {
      goto LABEL_9;
    }
    uint64_t v7 = objc_alloc_init(TSDTilingLayer);
    self->mOverlayTableName = v7;
    [(TSDTilingLayer *)v7 setName:@"mOverlayTableName"];
    [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
    -[TSDTilingLayer setContentsScale:](self->mOverlayTableName, "setContentsScale:");
    [(TSDTilingLayer *)self->mOverlayTableName setDrawsInBackground:[(TSTTableRep *)self canDrawInBackgroundDuringScroll]];
    [(TSDTilingLayer *)self->mOverlayTableName setDelegate:self];
    [(TSTTableRep *)self invalidateTableName];
    [(TSTTableRep *)self validateTableName];
    if (self->mOverlayTableName) {
LABEL_9:
    }
      objc_msgSend(v3, "addObject:");
  }
  else
  {
    mOverlayTableName = self->mOverlayTableName;
    if (mOverlayTableName)
    {
      [(TSDTilingLayer *)mOverlayTableName setDelegate:0];

      self->mOverlayTableName = 0;
    }
  }
  return v3;
}

- (void)validateTableName
{
  objc_super v3 = [(TSTTableRep *)self tableLayout];
  mOverlayTableName = self->mOverlayTableName;
  [(TSDTilingLayer *)mOverlayTableName bounds];
  rect1[0] = v5;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  TSTLayoutGetFrame(v3);
  double height = v12;
  if (self->mOverlayFrozenHeaderRows) {
    uint64_t FrozenHeaderRowsSpace = (void *)TSTLayoutGetFrozenHeaderRowsSpace(v3);
  }
  else {
    uint64_t FrozenHeaderRowsSpace = (void *)TSTLayoutGetSpace(v3);
  }
  Renderingdouble Frame = TSTLayoutGetRenderingFrame(v3, FrozenHeaderRowsSpace);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  if (v3) {
    [(TSDAbstractLayout *)v3 transform];
  }
  else {
    memset(&v46, 0, sizeof(v46));
  }
  v47.origin.double x = RenderingFrame;
  v47.origin.double y = v17;
  v47.size.double width = v19;
  v47.size.double height = v21;
  CGRect v48 = CGRectApplyAffineTransform(v47, &v46);
  double x = v48.origin.x;
  double y = v48.origin.y;
  double width = v48.size.width;
  if (self->mOverlayFrozenHeaderRows && TSTLayoutGetFrozenHeaderRowsFloating(v3))
  {
    memset(&v45, 0, sizeof(v45));
    TSTLayoutGetFrozenTableNameTransformToLayout(v3, &v45);
    *(CGAffineTransform *)&rect1[1] = v45;
    v49.origin.double x = x;
    v49.origin.double y = y;
    v49.size.double width = width;
    v49.size.double height = height;
    CGRect v50 = CGRectApplyAffineTransform(v49, (CGAffineTransform *)&rect1[1]);
    double x = v50.origin.x;
    double y = v50.origin.y;
    double width = v50.size.width;
    double height = v50.size.height;
  }
  -[TSDCanvas convertUnscaledToBoundsRect:]([(TSDRep *)self canvas], "convertUnscaledToBoundsRect:", x, y, width, height);
  double v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  double v34 = TSDRoundedRectForScale(v26, v28, v30, v32, v33);
  double v36 = v35;
  double v38 = TSDCeilSize(v37);
  -[TSDTilingLayer setFrame:](mOverlayTableName, "setFrame:", v34, v36, v38, v39);
  [(TSDTilingLayer *)mOverlayTableName bounds];
  v52.origin.double x = v40;
  v52.origin.double y = v41;
  v52.size.double width = v42;
  v52.size.double height = v43;
  *(void *)&v51.origin.double x = rect1[0];
  v51.origin.double y = v7;
  v51.size.double width = v9;
  v51.size.double height = v11;
  if (!CGRectEqualToRect(v51, v52)) {
    [(TSTTableRep *)self invalidateTableName];
  }
}

- (id)p_frozenHeaderOverlayLayers
{
  objc_super v3 = (void *)[MEMORY[0x263EFF980] array];
  unint64_t v4 = [(TSTTableRep *)self tableLayout];
  uint64_t FrozenHeaderColumnsSpace = TSTLayoutGetFrozenHeaderColumnsSpace(v4);
  uint64_t FrozenHeaderRowsSpace = TSTLayoutGetFrozenHeaderRowsSpace(v4);
  uint64_t FrozenHeaderCornerSpace = TSTLayoutGetFrozenHeaderCornerSpace(v4);
  if (FrozenHeaderRowsSpace
    && [(TSTTableModel *)[(TSTLayout *)v4 tableModel] numberOfHeaderRows])
  {
    if (!self->mOverlayFrozenHeaderRows)
    {
      double v8 = objc_alloc_init(TSDTilingLayer);
      self->mOverlayFrozenHeaderRows = v8;
      [(TSDTilingLayer *)v8 setDelegate:self];
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderRows setZPosition:0.0];
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderRows setDrawsInBackground:[(TSTTableRep *)self canDrawInBackgroundDuringScroll]];
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderRows setTilingMode:[(TSTTableRep *)self tilingMode]];
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderRows setHidden:1];
      [(TSTTableRep *)self validateFrozenHeaderRows];
      -[TSDTilingLayer setNeedsDisplayInRect:](self->mOverlayFrozenHeaderRows, "setNeedsDisplayInRect:", *MEMORY[0x263F00190], *(double *)(MEMORY[0x263F00190] + 8), *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    }
    int FrozenHeaderRowsFloating = TSTLayoutGetFrozenHeaderRowsFloating(v4);
    mOverlayFrozenHeaderRows = self->mOverlayFrozenHeaderRows;
    if (FrozenHeaderRowsFloating)
    {
      [(TSDTilingLayer *)mOverlayFrozenHeaderRows setHidden:0];
      if (!self->mOverlayFrozenHeaderRowsMask)
      {
        self->mOverlayFrozenHeaderRowsMask = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
        [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
        -[CALayer setContentsScale:](self->mOverlayFrozenHeaderRowsMask, "setContentsScale:");
        [(CALayer *)self->mOverlayFrozenHeaderRowsMask setDelegate:self];
        -[CALayer setBackgroundColor:](self->mOverlayFrozenHeaderRowsMask, "setBackgroundColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "greenColor"), "colorWithAlphaComponent:", 1.0), "CGColor"));
        [(TSDTilingLayer *)self->mOverlayFrozenHeaderRows setMask:self->mOverlayFrozenHeaderRowsMask];
        [(TSTTableRep *)self validateFrozenHeaderRows];
      }
    }
    else
    {
      [(TSDTilingLayer *)mOverlayFrozenHeaderRows setHidden:1];
      [(CALayer *)self->mOverlayFrozenHeaderRowsMask removeFromSuperlayer];
      [(CALayer *)self->mOverlayFrozenHeaderRowsMask setDelegate:0];

      self->mOverlayFrozenHeaderRowsMask = 0;
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderRows setMask:0];
    }
    [v3 addObject:self->mOverlayFrozenHeaderRows];
    if (!FrozenHeaderColumnsSpace) {
      goto LABEL_20;
    }
  }
  else
  {
    CGFloat v11 = self->mOverlayFrozenHeaderRows;
    if (v11)
    {
      [(TSDTilingLayer *)v11 setDelegate:0];

      self->mOverlayFrozenHeaderRows = 0;
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderCorner setDelegate:0];

      self->mOverlayFrozenHeaderCorner = 0;
      [(CALayer *)self->mOverlayFrozenHeaderRowsMask removeFromSuperlayer];
      [(CALayer *)self->mOverlayFrozenHeaderRowsMask setDelegate:0];

      self->mOverlayFrozenHeaderRowsMask = 0;
    }
    if (!FrozenHeaderColumnsSpace) {
      goto LABEL_20;
    }
  }
  if ([(TSTTableModel *)[(TSTLayout *)v4 tableModel] numberOfHeaderColumns])
  {
    if (!self->mOverlayFrozenHeaderColumns)
    {
      double v12 = objc_alloc_init(TSDTilingLayer);
      self->mOverlayFrozenHeaderColumns = v12;
      [(TSDTilingLayer *)v12 setDelegate:self];
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderColumns setZPosition:0.0];
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderColumns setDrawsInBackground:[(TSTTableRep *)self canDrawInBackgroundDuringScroll]];
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderColumns setTilingMode:[(TSTTableRep *)self tilingMode]];
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderColumns setHidden:1];
      [(TSTTableRep *)self validateFrozenHeaderColumns];
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderColumns setNeedsDisplay];
    }
    int FrozenHeaderColumnsFloating = TSTLayoutGetFrozenHeaderColumnsFloating(v4);
    mOverlayFrozenHeaderColumns = self->mOverlayFrozenHeaderColumns;
    if (FrozenHeaderColumnsFloating)
    {
      [(TSDTilingLayer *)mOverlayFrozenHeaderColumns setHidden:0];
      if (!self->mOverlayFrozenHeaderColumnsMask)
      {
        self->mOverlayFrozenHeaderColumnsMask = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
        [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
        -[CALayer setContentsScale:](self->mOverlayFrozenHeaderColumnsMask, "setContentsScale:");
        [(CALayer *)self->mOverlayFrozenHeaderColumnsMask setDelegate:self];
        -[CALayer setBackgroundColor:](self->mOverlayFrozenHeaderColumnsMask, "setBackgroundColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "blueColor"), "colorWithAlphaComponent:", 1.0), "CGColor"));
        [(TSDTilingLayer *)self->mOverlayFrozenHeaderColumns setMask:self->mOverlayFrozenHeaderColumnsMask];
        [(TSTTableRep *)self validateFrozenHeaderColumns];
      }
    }
    else
    {
      [(TSDTilingLayer *)mOverlayFrozenHeaderColumns setHidden:1];
      [(CALayer *)self->mOverlayFrozenHeaderColumnsMask removeFromSuperlayer];
      [(CALayer *)self->mOverlayFrozenHeaderColumnsMask setDelegate:0];

      self->mOverlayFrozenHeaderColumnsMask = 0;
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderColumns setMask:0];
    }
    if (self->mOverlayFrozenHeaderColumns) {
      objc_msgSend(v3, "addObject:");
    }
    goto LABEL_25;
  }
LABEL_20:
  double v15 = self->mOverlayFrozenHeaderColumns;
  if (v15)
  {
    [(TSDTilingLayer *)v15 setDelegate:0];

    self->mOverlayFrozenHeaderColumns = 0;
    [(TSDTilingLayer *)self->mOverlayFrozenHeaderCorner setDelegate:0];

    self->mOverlayFrozenHeaderCorner = 0;
    [(CALayer *)self->mOverlayFrozenHeaderColumnsMask removeFromSuperlayer];
    [(CALayer *)self->mOverlayFrozenHeaderColumnsMask setDelegate:0];

    self->mOverlayFrozenHeaderColumnsMask = 0;
    [(TSDTilingLayer *)self->mOverlayFrozenHeaderColumns setMask:0];
  }
LABEL_25:
  if (FrozenHeaderRowsSpace && (TSTLayoutGetFrozenHeaderRowsFloating(v4) & 1) != 0
    || FrozenHeaderColumnsSpace && TSTLayoutGetFrozenHeaderColumnsFloating(v4))
  {
    double v16 = [(TSTTableRep *)self layerForRep];
    CGFloat v17 = v16;
    if (self->mOverlayFrozenHeaderTableBodyMask)
    {
      if (v16 && [(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive]) {
        [(CALayer *)v17 setMask:self->mOverlayFrozenHeaderTableBodyMask];
      }
    }
    else
    {
      [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
      double v19 = v18;
      double v20 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      self->mOverlayFrozenHeaderTableBodyMask = v20;
      [(CALayer *)v20 setDelegate:self];
      [(CALayer *)self->mOverlayFrozenHeaderTableBodyMask setContentsScale:v19];
      -[CALayer setBackgroundColor:](self->mOverlayFrozenHeaderTableBodyMask, "setBackgroundColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "redColor"), "colorWithAlphaComponent:", 1.0), "CGColor"));
      CGFloat v21 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      self->mOverlayFrozenHeaderTableNameMask = v21;
      [(CALayer *)v21 setDelegate:self];
      [(CALayer *)self->mOverlayFrozenHeaderTableNameMask setContentsScale:v19];
      -[CALayer setBackgroundColor:](self->mOverlayFrozenHeaderTableNameMask, "setBackgroundColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "orangeColor"), "colorWithAlphaComponent:", 1.0), "CGColor"));
      [(CALayer *)self->mOverlayFrozenHeaderTableBodyMask addSublayer:self->mOverlayFrozenHeaderTableNameMask];
      if (v17 && [(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive]) {
        [(CALayer *)v17 setMask:self->mOverlayFrozenHeaderTableBodyMask];
      }
      [(TSTTableRep *)self validateFrozenHeaderTableBodyMask];
    }
  }
  else if (self->mOverlayFrozenHeaderTableBodyMask)
  {
    [(CALayer *)self->mOverlayFrozenHeaderTableNameMask removeFromSuperlayer];
    [(CALayer *)self->mOverlayFrozenHeaderTableNameMask setDelegate:0];

    self->mOverlayFrozenHeaderTableNameMask = 0;
    [(CALayer *)self->mOverlayFrozenHeaderTableBodyMask removeFromSuperlayer];
    [(CALayer *)self->mOverlayFrozenHeaderTableBodyMask setDelegate:0];

    self->mOverlayFrozenHeaderTableBodyMask = 0;
  }
  mOverlayFrozenHeaderCorner = self->mOverlayFrozenHeaderCorner;
  if (FrozenHeaderCornerSpace)
  {
    if (!mOverlayFrozenHeaderCorner)
    {
      long long v23 = objc_alloc_init(TSDTilingLayer);
      self->mOverlayFrozenHeaderCorner = v23;
      [(TSDTilingLayer *)v23 setDelegate:self];
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderCorner setDrawsInBackground:[(TSTTableRep *)self canDrawInBackgroundDuringScroll]];
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderCorner setZPosition:0.0];
      [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
      -[TSDTilingLayer setContentsScale:](self->mOverlayFrozenHeaderCorner, "setContentsScale:");
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderCorner setHidden:1];
      [(TSTTableRep *)self validateFrozenHeaderCorner];
      [(TSDTilingLayer *)self->mOverlayFrozenHeaderCorner setNeedsDisplay];
    }
    BOOL v24 = !TSTLayoutGetFrozenHeaderRowsFloating(v4)
       || (TSTLayoutGetFrozenHeaderColumnsFloating(v4) & 1) == 0;
    [(TSDTilingLayer *)self->mOverlayFrozenHeaderCorner setHidden:v24];
    [v3 addObject:self->mOverlayFrozenHeaderCorner];
  }
  else if (mOverlayFrozenHeaderCorner)
  {
    [(TSDTilingLayer *)mOverlayFrozenHeaderCorner setDelegate:0];

    self->mOverlayFrozenHeaderCorner = 0;
  }
  return v3;
}

- (CGRect)p_alignedLayerFrameForLayoutSpace:(id)a3 transform:(CGAffineTransform *)a4
{
  Renderingdouble Frame = TSTLayoutGetRenderingFrame([(TSTTableRep *)self tableLayout], a3);
  double CanvasRectForLayoutRect = TSTLayoutSpaceGetCanvasRectForLayoutRect((uint64_t)a3, RenderingFrame, v8, v9, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  -[TSDCanvas convertUnscaledToBoundsRect:]([(TSDRep *)self canvas], "convertUnscaledToBoundsRect:", CanvasRectForLayoutRect, v12, v14, v16);
  double v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  TSDRoundedRectForScale(v19, v21, v23, v25, v26);
  double v28 = TSDCeilSize(v27);
  double v30 = v29;
  long long v31 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v48.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v48.c = v31;
  *(_OWORD *)&v48.tdouble x = *(_OWORD *)&a4->tx;
  double v32 = CanvasRectForLayoutRect;
  *(double *)&long long v31 = v13;
  double v33 = v15;
  double v34 = v17;
  CGRect v49 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v31 - 8), &v48);
  -[TSDCanvas convertUnscaledToBoundsRect:]([(TSDRep *)self canvas], "convertUnscaledToBoundsRect:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
  double v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  double v44 = TSDRoundedRectForScale(v36, v38, v40, v42, v43);
  double v46 = v30 + 6.0;
  double v47 = v28 + 6.0;
  result.size.double height = v46;
  result.size.double width = v47;
  result.origin.double y = v45;
  result.origin.double x = v44;
  return result;
}

- (void)validateFrozenHeaderCorner
{
  objc_super v3 = [(TSTTableRep *)self tableLayout];
  mOverlayFrozenHeaderCorner = self->mOverlayFrozenHeaderCorner;
  uint64_t FrozenHeaderCornerSpace = TSTLayoutGetFrozenHeaderCornerSpace(v3);
  if (FrozenHeaderCornerSpace)
  {
    if (mOverlayFrozenHeaderCorner)
    {
      uint64_t v6 = FrozenHeaderCornerSpace;
      Gridunint64_t Range = TSTLayoutSpaceGetGridRange(FrozenHeaderCornerSpace);
      if (GridRange != -1
        && v8 != -1
        && GridRange <= v8
        && HIDWORD(GridRange) != -1
        && v9 != -1
        && HIDWORD(GridRange) <= v9)
      {
        TSTLayoutGetFrozenHeaderCornerTransformToLayout(v3, (uint64_t)v10);
        [(TSTTableRep *)self p_alignedLayerFrameForLayoutSpace:v6 transform:v10];
        -[TSDTilingLayer setFrame:](mOverlayFrozenHeaderCorner, "setFrame:");
      }
    }
  }
}

- (void)validateFrozenHeaderRows
{
  objc_super v3 = [(TSTTableRep *)self tableLayout];
  mOverlayFrozenHeaderRows = self->mOverlayFrozenHeaderRows;
  mOverlayFrozenHeaderRowsMask = self->mOverlayFrozenHeaderRowsMask;
  uint64_t FrozenHeaderRowsSpace = TSTLayoutGetFrozenHeaderRowsSpace(v3);
  if (FrozenHeaderRowsSpace)
  {
    if (mOverlayFrozenHeaderRows)
    {
      CGFloat v7 = (void *)FrozenHeaderRowsSpace;
      Gridunint64_t Range = TSTLayoutSpaceGetGridRange(FrozenHeaderRowsSpace);
      if (GridRange != -1
        && v9 != -1
        && GridRange <= v9
        && HIDWORD(GridRange) != -1
        && v10 != -1
        && HIDWORD(GridRange) <= v10)
      {
        TSTLayoutGetFrozenHeaderRowsTransformToLayout(v3, (uint64_t)v18);
        [(TSTTableRep *)self p_alignedLayerFrameForLayoutSpace:v7 transform:v18];
        -[TSDTilingLayer setFrame:](mOverlayFrozenHeaderRows, "setFrame:");
        if (mOverlayFrozenHeaderRowsMask)
        {
          [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
          double v12 = v11;
          memset(&v17[1], 0, sizeof(CGAffineTransform));
          [v7 transformToDevice];
          v19.origin.double x = TSTLayoutGetAlignedMaskRectForSpace(v3, v7);
          v17[0] = v17[1];
          CGRect v20 = CGRectApplyAffineTransform(v19, v17);
          double v13 = TSDMultiplyRectScalar(v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, 1.0 / v12);
          [(CALayer *)mOverlayFrozenHeaderRowsMask setFrame:TSDRoundedRectForScale(v13, v14, v15, v16, v12)];
        }
      }
    }
  }
}

- (void)validateFrozenHeaderColumns
{
  objc_super v3 = [(TSTTableRep *)self tableLayout];
  mOverlayFrozenHeaderColumns = self->mOverlayFrozenHeaderColumns;
  mOverlayFrozenHeaderColumnsMask = self->mOverlayFrozenHeaderColumnsMask;
  uint64_t FrozenHeaderColumnsSpace = TSTLayoutGetFrozenHeaderColumnsSpace(v3);
  if (FrozenHeaderColumnsSpace)
  {
    if (mOverlayFrozenHeaderColumns)
    {
      CGFloat v7 = (void *)FrozenHeaderColumnsSpace;
      Gridunint64_t Range = TSTLayoutSpaceGetGridRange(FrozenHeaderColumnsSpace);
      if (GridRange != -1
        && v9 != -1
        && GridRange <= v9
        && HIDWORD(GridRange) != -1
        && v10 != -1
        && HIDWORD(GridRange) <= v10)
      {
        TSTLayoutGetFrozenHeaderColumnsTransformToLayout(v3, (uint64_t)v18);
        [(TSTTableRep *)self p_alignedLayerFrameForLayoutSpace:v7 transform:v18];
        -[TSDTilingLayer setFrame:](mOverlayFrozenHeaderColumns, "setFrame:");
        if (mOverlayFrozenHeaderColumnsMask)
        {
          [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
          double v12 = v11;
          memset(&v17[1], 0, sizeof(CGAffineTransform));
          [v7 transformToDevice];
          v19.origin.double x = TSTLayoutGetAlignedMaskRectForSpace(v3, v7);
          v17[0] = v17[1];
          CGRect v20 = CGRectApplyAffineTransform(v19, v17);
          double v13 = TSDMultiplyRectScalar(v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, 1.0 / v12);
          [(CALayer *)mOverlayFrozenHeaderColumnsMask setFrame:TSDRoundedRectForScale(v13, v14, v15, v16, v12)];
        }
      }
    }
  }
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableRep;
  [(TSWPTextHostRep *)&v3 addAdditionalChildLayersToArray:a3];
}

- (void)validateFrozenHeaderTableBodyMask
{
  objc_super v3 = [(TSTTableRep *)self tableLayout];
  uint64_t Space = TSTLayoutGetSpace(v3);
  if (Space && self->mOverlayFrozenHeaderTableBodyMask)
  {
    uint64_t v5 = (void *)Space;
    [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
    double v7 = v6;
    memset(&v34, 0, sizeof(v34));
    [v5 transformToDevice];
    v35.origin.double x = TSTLayoutGetAlignedMaskRectForSpace(v3, v5);
    CGAffineTransform v33 = v34;
    CGRect v36 = CGRectApplyAffineTransform(v35, &v33);
    double v8 = TSDMultiplyRectScalar(v36.origin.x, v36.origin.y, v36.size.width, v36.size.height, 1.0 / v7);
    v37.origin.double x = TSDRoundedRectForScale(v8, v9, v10, v11, v7);
    double x = v37.origin.x;
    double y = v37.origin.y;
    CGRect v38 = CGRectInset(v37, -50.0, -100.0);
    double v14 = v38.origin.x;
    double v15 = v38.origin.y;
    double width = v38.size.width;
    double height = v38.size.height;
    uint64_t FrozenHeaderRowsSpace = TSTLayoutGetFrozenHeaderRowsSpace(v3);
    uint64_t FrozenHeaderColumnsSpace = TSTLayoutGetFrozenHeaderColumnsSpace(v3);
    if (FrozenHeaderColumnsSpace) {
      BOOL v20 = FrozenHeaderRowsSpace == 0;
    }
    else {
      BOOL v20 = 0;
    }
    if (v20) {
      double v21 = v15;
    }
    else {
      double v21 = y;
    }
    if (FrozenHeaderRowsSpace != 0 && FrozenHeaderColumnsSpace == 0) {
      double x = v14;
    }
    else {
      double y = v21;
    }
    -[CALayer setFrame:](self->mOverlayFrozenHeaderTableBodyMask, "setFrame:", x, y, width, height);
    if (TSTLayoutGetTableNameVisible((uint64_t)v3)
      && [(TSTEditingState *)[(TSTTableRep *)self editingState] editingMode] == 7)
    {
      v39.origin.double x = TSTLayoutGetAlignedStrokeFrame(v3);
      v39.size.double height = v22;
      CGAffineTransform v32 = v34;
      v39.origin.double y = 0.0;
      CGRect v40 = CGRectApplyAffineTransform(v39, &v32);
      double v23 = TSDMultiplyRectScalar(v40.origin.x, v40.origin.y, v40.size.width, v40.size.height, 1.0 / v7);
      double v27 = TSDRoundedRectForScale(v23, v24, v25, v26, v7) - x;
      double v31 = v30 - y;
    }
    else
    {
      double v27 = *MEMORY[0x263F001A8];
      double v31 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v28 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v29 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    -[CALayer setFrame:](self->mOverlayFrozenHeaderTableNameMask, "setFrame:", v27, v31, v28, v29);
  }
}

- (void)invalidateFrozenHeaders
{
  objc_super v3 = [(TSTTableRep *)self tableLayout];
  uint64_t FrozenHeaderRowsSpace = TSTLayoutGetFrozenHeaderRowsSpace(v3);
  uint64_t FrozenHeaderColumnsSpace = TSTLayoutGetFrozenHeaderColumnsSpace(v3);
  uint64_t FrozenHeaderCornerSpace = TSTLayoutGetFrozenHeaderCornerSpace(v3);
  if (FrozenHeaderRowsSpace)
  {
    mOverlayFrozenHeaderRows = self->mOverlayFrozenHeaderRows;
    if (mOverlayFrozenHeaderRows) {
      -[TSDTilingLayer setNeedsDisplayInRect:](mOverlayFrozenHeaderRows, "setNeedsDisplayInRect:", *MEMORY[0x263F00190], *(double *)(MEMORY[0x263F00190] + 8), *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    }
  }
  if (FrozenHeaderColumnsSpace)
  {
    mOverlayFrozenHeaderColumns = self->mOverlayFrozenHeaderColumns;
    if (mOverlayFrozenHeaderColumns) {
      -[TSDTilingLayer setNeedsDisplayInRect:](mOverlayFrozenHeaderColumns, "setNeedsDisplayInRect:", *MEMORY[0x263F00190], *(double *)(MEMORY[0x263F00190] + 8), *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    }
  }
  if (FrozenHeaderCornerSpace)
  {
    mOverlayFrozenHeaderCorner = self->mOverlayFrozenHeaderCorner;
    if (mOverlayFrozenHeaderCorner)
    {
      double v10 = *MEMORY[0x263F00190];
      double v11 = *(double *)(MEMORY[0x263F00190] + 8);
      double v12 = *(double *)(MEMORY[0x263F00190] + 16);
      double v13 = *(double *)(MEMORY[0x263F00190] + 24);
      -[TSDTilingLayer setNeedsDisplayInRect:](mOverlayFrozenHeaderCorner, "setNeedsDisplayInRect:", v10, v11, v12, v13);
    }
  }
}

- (BOOL)canDrawTilingLayerInBackground:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSTTableRep;
  BOOL v4 = [(TSDRep *)&v6 canDrawTilingLayerInBackground:a3];
  if (v4) {
    LOBYTE(v4) = ![(TSTTableRep *)self mustDrawOnMainThreadForInteractiveCanvas];
  }
  return v4;
}

- (void)beginDragInsertFromPalette
{
  [(TSTMasterLayout *)[(TSTTableRep *)self masterLayout] beginDynamicMode:[(TSTTableRep *)self tableLayout]];
  objc_super v3 = [(TSTTableRep *)self masterLayout];

  [(TSTMasterLayout *)v3 updateDynamicRepressFrozenHeader:1];
}

- (void)endDragInsertFromPalette
{
  objc_super v2 = [(TSTTableRep *)self masterLayout];

  [(TSTMasterLayout *)v2 endDynamicMode];
}

- (BOOL)canDrawInBackgroundDuringScroll
{
  return ![(TSTTableRep *)self mustDrawOnMainThreadForInteractiveCanvas];
}

- (BOOL)mustDrawOnMainThreadForInteractiveCanvas
{
  objc_super v2 = [(TSTTableRep *)self masterLayout];
  objc_super v3 = [(TSTMasterLayout *)v2 dynamicContentDelegate];
  if ([(TSTMasterLayout *)v2 isDynamicallyResizingTableName]) {
    return 1;
  }
  if (!v3) {
    return 0;
  }

  return [(TSTLayoutDynamicContentProtocol *)v3 dynamicContentMustDrawOnMainThread];
}

- (BOOL)canDrawInParallel
{
  return 1;
}

- (int)tilingMode
{
  return 2;
}

- (void)recursivelyDrawInContext:(CGContext *)a3
{
  TSTMasterLayoutLock((uint64_t)[(TSTTableRep *)self masterLayout]);
  self->mRecursivelyDrawingInContext = 1;
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  CGFloat v6 = v5;
  double v7 = TSDCGContextAssociatedScreenScale((uint64_t)a3);
  TSTTableRepSetupUserSpaceToDeviceSpaceTransform(self, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)TSTTableRep;
  [(TSDRep *)&v8 recursivelyDrawInContext:a3];
  self->mRecursivelyDrawingInContext = 0;
  TSTMasterLayoutUnlock((uint64_t)[(TSTTableRep *)self masterLayout]);
}

- (void)drawInContext:(CGContext *)a3
{
  double v5 = [(TSTTableRep *)self tableLayout];
  mAnimationController = self->mAnimationController;
  if (!mAnimationController
    || [(TSTTableAnimationController *)mAnimationController shouldRenderTableRep])
  {
    if (self->mRecursivelyDrawingInContext || [(TSTLayout *)v5 inPrintPreviewMode])
    {
      mOverlayTableName = self->mOverlayTableName;
      if (mOverlayTableName)
      {
        [(TSDTilingLayer *)mOverlayTableName setDelegate:0];

        self->mOverlayTableName = 0;
      }
      TSTTableRepDrawTableName(self, a3, 0);
    }
    ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(a3);
    CGFloat x = ClipBoundingBox.origin.x;
    CGFloat y = ClipBoundingBox.origin.y;
    CGFloat width = ClipBoundingBox.size.width;
    CGFloat height = ClipBoundingBox.size.height;
    [(TSTTableRep *)self transformFromCanvas];
    CGContextConcatCTM(a3, &v19);
    uint64_t Space = (TSTLayoutSpace *)TSTLayoutGetSpace(v5);
    [(TSTLayoutSpace *)Space lockForRead];
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    TSTTableRepDrawSpaceInContext(self, Space, v21, a3);
    [(TSTLayoutSpace *)Space unlock];
    if (TSTLayoutIsPartitionPaginated(v5))
    {
      RepeatHeaderRowsuint64_t Space = (TSTLayoutSpace *)TSTLayoutGetRepeatHeaderRowsSpace(v5);
      if (RepeatHeaderRowsSpace)
      {
        double v14 = RepeatHeaderRowsSpace;
        [(TSTLayoutSpace *)RepeatHeaderRowsSpace lockForRead];
        v22.origin.CGFloat x = x;
        v22.origin.CGFloat y = y;
        v22.size.CGFloat width = width;
        v22.size.CGFloat height = height;
        TSTTableRepDrawSpaceInContext(self, v14, v22, a3);
        [(TSTLayoutSpace *)v14 unlock];
      }
      RepeatHeaderColumnsuint64_t Space = (TSTLayoutSpace *)TSTLayoutGetRepeatHeaderColumnsSpace(v5);
      if (RepeatHeaderColumnsSpace)
      {
        CGFloat v16 = RepeatHeaderColumnsSpace;
        [(TSTLayoutSpace *)RepeatHeaderColumnsSpace lockForRead];
        v23.origin.CGFloat x = x;
        v23.origin.CGFloat y = y;
        v23.size.CGFloat width = width;
        v23.size.CGFloat height = height;
        TSTTableRepDrawSpaceInContext(self, v16, v23, a3);
        [(TSTLayoutSpace *)v16 unlock];
      }
      RepeatHeaderCorneruint64_t Space = (TSTLayoutSpace *)TSTLayoutGetRepeatHeaderCornerSpace(v5);
      if (RepeatHeaderCornerSpace)
      {
        double v18 = RepeatHeaderCornerSpace;
        [(TSTLayoutSpace *)RepeatHeaderCornerSpace lockForRead];
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        TSTTableRepDrawSpaceInContext(self, v18, v24, a3);
        [(TSTLayoutSpace *)v18 unlock];
      }
    }
  }
}

- (id)p_textImageForPath:(CGPath *)a3 shouldPulsate:(BOOL)a4
{
  BOOL v4 = a4;
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  double v8 = v7;
  [(TSDCanvas *)self->super.super.mCanvas viewScale];
  double v10 = v9;
  double v11 = &kFindSelectionPulseInset;
  if (!v4) {
    double v11 = &kFindSelectionInset;
  }
  double v12 = *(double *)v11;
  BoundingBoCGFloat x = CGPathGetBoundingBox(a3);
  CGFloat y = BoundingBox.origin.y;
  CGFloat x = BoundingBox.origin.x;
  CGFloat height = BoundingBox.size.height;
  CGFloat width = BoundingBox.size.width;
  CGRect v46 = CGRectInset(BoundingBox, -v12, -v12);
  double v13 = v46.origin.y;
  double v14 = v46.size.width;
  double v41 = v46.origin.x;
  double v42 = v46.size.height;
  CGRect v47 = CGRectInset(v46, -6.0, -6.0);
  double v15 = v47.origin.x;
  CGFloat v16 = v47.origin.y;
  CGFloat v17 = v47.size.width;
  CGFloat v18 = v47.size.height;
  CGRect v48 = CGRectIntegral(v47);
  double v39 = v48.origin.y;
  double v40 = v48.origin.x;
  double v38 = v8;
  double v19 = v8 * v10;
  v49.origin.CGFloat x = TSDMultiplyRectScalar(v15, v16, v17, v18, v19);
  CGRect v50 = CGRectIntegral(v49);
  BOOL v20 = TSDBitmapContextCreate(11, v50.size.width);
  if (v20)
  {
    TSDSetCGContextInfo((uint64_t)v20, [(TSDCanvas *)[(TSDRep *)self canvas] isPrinting], [(TSDCanvas *)[(TSDRep *)self canvas] isDrawingIntoPDF], 1, [(TSDCanvas *)[(TSDRep *)self canvas] shouldSuppressBackgrounds], v10);
    CGContextScaleCTM(v20, v19, v19);
    CGContextTranslateCTM(v20, -v40, -v39);
    CGContextSetShouldSmoothFonts(v20, 0);
    CGContextSetShouldAntialias(v20, 1);
    v51.origin.CGFloat x = v41;
    v51.origin.CGFloat y = v13;
    v51.size.CGFloat width = v14;
    v51.size.CGFloat height = v42;
    CGRect v52 = CGRectInset(v51, -2.0, -2.0);
    CGContextClipToRect(v20, v52);
    -[TSWPTextHostRep drawTextBackground:insetRect:pulsating:](self, "drawTextBackground:insetRect:pulsating:", v20, v4, v41, v13, v14, v42);
    v44.CGFloat width = 0.0;
    v44.CGFloat height = -2.0;
    CGContextSetShadow(v20, v44, 2.0);
    uint64_t Space = (TSTLayoutSpace *)TSTLayoutGetSpace([(TSTTableRep *)self tableLayout]);
    uint64_t GridRangeForLayoutRect = TSTLayoutSpaceGetGridRangeForLayoutRect(Space, v41, v13, v14, v42);
    if (GridRangeForLayoutRect == -1
      || v23 == -1
      || GridRangeForLayoutRect > v23)
    {
      unint64_t v28 = v23;
      unint64_t v30 = GridRangeForLayoutRect;
      unint64_t v29 = v23;
    }
    else
    {
      int v24 = v23 - 1;
      unint64_t v25 = (v23 & 0xFFFFFFFF00000000 | (v23 - 1)) - 0x100000000;
      if (HIDWORD(GridRangeForLayoutRect) > HIDWORD(v23))
      {
        int v24 = v23;
        unint64_t v25 = v23;
      }
      if (HIDWORD(v23) == -1) {
        int v26 = v23;
      }
      else {
        int v26 = v24;
      }
      if (HIDWORD(v23) == -1) {
        unint64_t v27 = v23;
      }
      else {
        unint64_t v27 = v25;
      }
      if (HIDWORD(GridRangeForLayoutRect) == -1) {
        unint64_t v28 = v23;
      }
      else {
        unint64_t v28 = v27;
      }
      if (HIDWORD(GridRangeForLayoutRect) == -1) {
        unint64_t v29 = v23;
      }
      else {
        unint64_t v29 = v27;
      }
      if (HIDWORD(GridRangeForLayoutRect) == -1) {
        int v26 = v23;
      }
      unint64_t v30 = GridRangeForLayoutRect;
      LODWORD(v23) = v26;
    }
    if (GridRangeForLayoutRect != -1
      && v23 != -1
      && v23 >= GridRangeForLayoutRect
      && HIDWORD(GridRangeForLayoutRect) != -1)
    {
      unint64_t v31 = HIDWORD(v28);
      if (v31 != -1 && HIDWORD(GridRangeForLayoutRect) <= v31)
      {
        v53.origin.CGFloat y = y;
        v53.origin.CGFloat x = x;
        v53.size.CGFloat height = height;
        v53.size.CGFloat width = width;
        CGContextClipToRect(v20, v53);
        [(TSTTableRep *)self transformFromCanvas];
        CGContextConcatCTM(v20, &transform);
        TSTTableRepPrepareToDrawLayoutSpace(self, Space, v20);
        TSTTableRepDrawCellContent(self, Space, v30, v29, v20);
        if (Space) {
          CGContextRestoreGState(v20);
        }
      }
    }
    Image = CGBitmapContextCreateImage(v20);
    CGContextRelease(v20);
    if (Image)
    {
      BOOL v20 = (CGContext *)(id)[objc_alloc(MEMORY[0x263F7C858]) initWithCGImage:Image scale:0 orientation:v38];
      CGImageRelease(Image);
    }
    else
    {
      return 0;
    }
  }
  return v20;
}

- (CGPath)p_newPathForSearchReference:(id)a3
{
  return 0;
}

- (void)p_hideSelectionLayers
{
  [(CAShapeLayer *)self->mFindSelectionHighlightLayer setHidden:1];
  objc_super v3 = [(TSWPTextHostRep *)self pulseArrayController];

  [(TSKHighlightArrayController *)v3 stop];
}

- (void)p_editingDidEnd
{
  [(CAShapeLayer *)self->mFindSelectionHighlightLayer setHidden:1];
  if ([(TSWPTextHostRep *)self pulseArrayController])
  {
    objc_super v3 = [(TSWPTextHostRep *)self pulseArrayController];
    [(TSKHighlightArrayController *)v3 stop];
  }
}

- (CGPath)newPathForSearchReference:(id)a3
{
  return 0;
}

- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5
{
  return [(TSTTableRep *)self p_textImageForPath:a4 shouldPulsate:a5];
}

- (CGRect)boundsForResizeGuideUI
{
  objc_super v2 = [(TSTTableRep *)self tableLayout];

  Renderingdouble Frame = TSTLayoutGetRenderingFrame(v2, 0);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = RenderingFrame;
  return result;
}

- (NSString)description
{
  double v19 = NSString;
  objc_super v3 = (objc_class *)objc_opt_class();
  CGFloat v18 = NSStringFromClass(v3);
  [(TSDRep *)self info];
  double v4 = (objc_class *)objc_opt_class();
  CGFloat v17 = NSStringFromClass(v4);
  id v5 = [(TSDRep *)self info];
  [(TSDRep *)self layout];
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  double v8 = [(TSDRep *)self layout];
  [(TSTLayout *)[(TSTTableRep *)self tableLayout] layoutHint];
  double v9 = (objc_class *)objc_opt_class();
  double v10 = NSStringFromClass(v9);
  double v11 = [(TSTLayout *)[(TSTTableRep *)self tableLayout] layoutHint];
  $CA3468F20078D5D2DB35E78E73CA60DA v12 = [(TSTLayoutHint *)[(TSTLayout *)[(TSTTableRep *)self tableLayout] layoutHint] cellRange];
  double v13 = NSString;
  uint64_t v14 = [NSString stringWithFormat:@"(%hu, %hu)", v12.var0.var1, v12.var0.var0];
  uint64_t v15 = [v13 stringWithFormat:@"(%@, %@)", v14, objc_msgSend(NSString, "stringWithFormat:", @"%hux%hu", v12.var1.var0, HIWORD(*(unint64_t *)&v12))];
  [(TSDRep *)self frameInUnscaledCanvas];
  return (NSString *)[v19 stringWithFormat:@"<%@ %p info=<%@ %p> layout=<%@ %p> layoutHint=<%@ %p %@> frameInUnscaledCanvas=%@>", v18, self, v17, v5, v7, v8, v10, v11, v15, NSStringFromCGRect(v20)];
}

- (TSTCanvasReferenceController)canvasReferenceController
{
  return self->mCanvasReferenceController;
}

- (TSTTableAnimationController)animationController
{
  return self->mAnimationController;
}

- (void)setAnimationController:(id)a3
{
  self->mAnimationController = (TSTTableAnimationController *)a3;
}

- (TSTTableChromeProvider)tableChrome
{
  return self->mTableChrome;
}

- (TSTTableRepDelegate)delegate
{
  return self->mDelegate;
}

- (TSTSelectionDragController)cellDragController
{
  return self->mCellDragController;
}

- (void)setCellDragController:(id)a3
{
  self->mCellDragController = (TSTSelectionDragController *)a3;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)ratingsDragCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mRatingsDragCellID;
}

- (void)setRatingsDragCellID:(id)a3
{
  self->mRatingsDragCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (TSTTableKnobTrackerVisitorProtocol)visitorKnobTracker
{
  return self->mVisitorKnobTracker;
}

- (BOOL)isZoomToEditOperationInProgress
{
  return self->mIsZoomToEditOperationInProgress;
}

@end