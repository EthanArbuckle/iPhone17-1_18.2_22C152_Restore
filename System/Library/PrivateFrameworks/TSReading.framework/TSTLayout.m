@interface TSTLayout
- ($CA3468F20078D5D2DB35E78E73CA60DA)editingSpillingTextRange;
- (BOOL)alwaysStartsNewTarget;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)canRotateChildLayout:(id)a3;
- (BOOL)columnsAreLeftToRight;
- (BOOL)inFindReplaceMode;
- (BOOL)inPrintPreviewMode;
- (BOOL)isBeingManipulated;
- (BOOL)isZoomedEditing;
- (BOOL)layoutDirectionIsLeftToRight;
- (BOOL)newCanvasRevealedHorizontally;
- (BOOL)newCanvasRevealedVertically;
- (BOOL)orderedBefore:(id)a3;
- (BOOL)p_getLayoutDirectionLeftToRight;
- (BOOL)p_layoutWhollyContainsGridRange:(id)a3;
- (BOOL)processChangesFiltering;
- (BOOL)resizeMayChangeAspectRatio;
- (BOOL)shrinkTextToFit;
- (BOOL)supportsRotation;
- (BOOL)textIsVertical;
- (CGPoint)calculatePointFromSearchReference:(id)a3;
- (CGPoint)capturedInfoPositionForAttachment;
- (CGPoint)infoGeometryPositionForCurrentAttachedLayoutGeometry;
- (CGRect)alignmentFrame;
- (CGRect)alignmentFrameForProvidingGuidesInRoot;
- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4;
- (CGRect)computedEditingCellContentFrame;
- (CGRect)maskRectForTextLayout:(id)a3;
- (CGRect)p_computeSpillingTextFrameForLayout:(id)a3 textSize:(CGSize)a4 editingSpillRange:(id *)a5;
- (CGRect)rectForPresentingAnnotationPopoverForSelection:(id)a3;
- (CGRect)rectForSelection:(id)a3;
- (CGSize)adjustedInsets;
- (CGSize)initialTextSize;
- (CGSize)minimumSize;
- (CGSize)p_rangeUpAndLeftOfIntersectionRangeOfGridRange:(id)a3;
- (CGSize)scaleToFit;
- (Class)repClassForTextLayout:(id)a3;
- (TSTEditingState)editingState;
- (TSTLayout)initWithInfo:(id)a3;
- (TSTLayout)initWithInfo:(id)a3 layoutHint:(id)a4;
- (TSTLayoutHint)layoutHint;
- (TSTLayoutSpaceBundle)spaceBundle;
- (TSTMasterLayout)masterLayout;
- (TSTTableModel)tableModel;
- (TSWPLayout)containedTextEditingLayout;
- (TSWPPadding)layoutMargins;
- (UIEdgeInsets)paddingForEditingCell;
- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (double)maxAutoGrowWidthForTextLayout:(id)a3;
- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6;
- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (id)childSearchTargets;
- (id)children;
- (id)computeLayoutGeometry;
- (id)dependentLayouts;
- (id)dependentsOfTextLayout:(id)a3;
- (id)initialInfoGeometry;
- (id)layoutGeometryFromInfo;
- (int)reapCoordinatesChangedMaskForChrome;
- (int)wrapFitType;
- (unint64_t)columnCount;
- (unsigned)autosizeFlagsForTextLayout:(id)a3;
- (unsigned)naturalAlignmentForTextLayout:(id)a3;
- (unsigned)p_defaultAlignmentForTableWritingDirection;
- (unsigned)p_naturalAlignmentForCellID:(id)a3;
- (unsigned)verticalAlignmentForTextLayout:(id)a3;
- (void)bezierPathsForCellRegion:(id)a3 transform:(CGAffineTransform *)a4 viewScale:(double)a5 inset:(double)a6 block:(id)a7;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateForAutosizingTextLayout:(id)a3;
- (void)invalidateSize;
- (void)invalidateTableNameVisibility;
- (void)layoutSearchForAnnotationWithHitBlock:(id)a3;
- (void)layoutSearchForSpellingErrorsWithHitBlock:(id)a3 stop:(BOOL *)a4;
- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5;
- (void)offsetGeometryBy:(CGPoint)a3;
- (void)p_processChange:(id)a3 forChangeSource:(id)a4 actions:(id)a5;
- (void)p_processChangeActions:(id)a3;
- (void)p_updateCachedStyleInformationFromCellID:(id)a3;
- (void)processChanges:(id)a3;
- (void)removeContainedTextEditingLayout;
- (void)setContainedTextEditingLayout:(id)a3;
- (void)setLayoutHint:(id)a3;
- (void)setMasterLayout:(id)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setNewCanvasRevealedHorizontally:(BOOL)a3;
- (void)setNewCanvasRevealedVertically:(BOOL)a3;
- (void)setProcessChangesFiltering:(BOOL)a3;
- (void)setScaleToFit:(CGSize)a3;
- (void)setSpaceBundle:(id)a3;
- (void)storage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6;
- (void)updateChildrenFromInfo;
- (void)validate;
- (void)validateTableNameVisibility;
- (void)willBeAddedToLayoutController:(id)a3;
- (void)willBeRemovedFromLayoutController:(id)a3;
@end

@implementation TSTLayout

- (CGSize)scaleToFit
{
  double width = self->mCached.scaleToFitEnclosingTextColumn.width;
  double height = self->mCached.scaleToFitEnclosingTextColumn.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setScaleToFit:(CGSize)a3
{
  self->mCached.scaleToFitEnclosingTextColumn = a3;
}

- (TSTEditingState)editingState
{
  v2 = [(TSTLayout *)self tableInfo];

  return [(TSTTableInfo *)v2 editingState];
}

- (TSTTableModel)tableModel
{
  v2 = [(TSTLayout *)self tableInfo];

  return [(TSTTableInfo *)v2 tableModel];
}

- (void)setLayoutHint:(id)a3
{
  mLayoutHint = self->mLayoutHint;
  if (mLayoutHint != a3)
  {
    if (mLayoutHint)
    {
      [(TSTLayoutHint *)mLayoutHint setLayout:0];
    }
    v6 = (TSTLayoutHint *)a3;
    self->mLayoutHint = v6;
    [(TSTLayoutHint *)v6 setLayout:self];
  }
}

- (TSTLayout)initWithInfo:(id)a3 layoutHint:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)TSTLayout;
  v6 = -[TSDLayout initWithInfo:](&v16, sel_initWithInfo_);
  if (v6)
  {
    v7 = (void *)[a3 masterLayout];
    *((void *)v6 + 38) = v7;
    id v8 = v7;
    id v9 = a4;
    *((void *)v6 + 39) = v9;
    [v9 setLayout:v6];
    *((void *)v6 + 49) = [[TSTLayoutSpaceBundle alloc] initWithLayout:v6];
    if (v6[385]) {
      v6[385] = 0;
    }
    TSTLayoutSetPartitionRange(v6);
    objc_msgSend((id)objc_msgSend(v6, "spaceBundle"), "invalidateTableOffsets");
    [*((id *)v6 + 38) invalidateTableNameHeight];
    v6[384] = 0;
    *((_OWORD *)v6 + 30) = TSDEdgeInsetsInvalid;
    *((_OWORD *)v6 + 31) = unk_22383BF98;
    *((_DWORD *)v6 + 136) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v6 + 408) = _Q0;
    *(_OWORD *)(v6 + 424) = _Q0;
    *((void *)v6 + 75) = 0xFFFFFFLL;
    v6[390] = objc_msgSend(v6, "p_getLayoutDirectionLeftToRight");
  }
  return (TSTLayout *)v6;
}

- (TSTLayout)initWithInfo:(id)a3
{
  id v5 = (id)objc_msgSend((id)objc_msgSend(a3, "masterLayout"), "newLayoutHint");

  return [(TSTLayout *)self initWithInfo:a3 layoutHint:v5];
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "documentRoot"), "changeNotifier"), "removeObserver:forChangeSource:", self, -[TSTLayout masterLayout](self, "masterLayout"));
  if (self->mContainedTextEditingLayout) {
    [(TSTLayout *)self removeContainedTextEditingLayout];
  }
  [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] invalidateTableOffsets];

  self->mSpaceBundle = 0;
  self->mMasterLayout = 0;
  mLayoutHint = self->mLayoutHint;
  if (mLayoutHint)
  {
    [(TSTLayoutHint *)mLayoutHint setLayout:0];
    v4 = self->mLayoutHint;
  }
  else
  {
    v4 = 0;
  }

  self->mLayoutHint = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSTLayout;
  [(TSWPTextHostLayout *)&v5 dealloc];
}

- (void)willBeAddedToLayoutController:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "canvas"), "canvasController"), "documentRoot"), "changeNotifier");
  mMasterLayout = self->mMasterLayout;

  [(TSTMasterLayout *)mMasterLayout setChangeNotifier:v4];
}

- (void)willBeRemovedFromLayoutController:(id)a3
{
  if (self->mContainedTextEditingLayout) {
    [(TSTLayout *)self removeContainedTextEditingLayout];
  }
  v5.receiver = self;
  v5.super_class = (Class)TSTLayout;
  [(TSDLayout *)&v5 willBeRemovedFromLayoutController:a3];
}

- (void)offsetGeometryBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(TSDLayout *)self layoutState] != 4)
  {
    v6.receiver = self;
    v6.super_class = (Class)TSTLayout;
    -[TSDAbstractLayout offsetGeometryBy:](&v6, sel_offsetGeometryBy_, x, y);
  }
}

- (BOOL)supportsRotation
{
  return 0;
}

- (BOOL)canRotateChildLayout:(id)a3
{
  return 0;
}

- (BOOL)resizeMayChangeAspectRatio
{
  return 1;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (CGSize)minimumSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  uint64_t v4 = [(TSTLayout *)self masterLayout];
  int v5 = [(TSTMasterLayout *)v4 tableRowsBehavior];
  int TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)v4);
  unsigned __int16 TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)v4);
  if (TableNumberOfRows)
  {
    unsigned int v8 = 0;
    unsigned __int16 v9 = 0;
    unsigned __int16 v10 = TableNumberOfRows;
    do
    {
      if (TSTMasterLayoutIsRowHidden(v4, (unsigned __int16)v8))
      {
        --v10;
      }
      else
      {
        if (v5 == 1)
        {
          TSTMasterLayoutFittingHeightOfRow(v4, (unsigned __int16)v8);
          double v3 = v3 + v11;
        }
        double v3 = v3 + TSTMasterLayoutStrokeHeightOfGridRow(v4, v8, 0, 0xFFFFFFFF);
        unsigned __int16 v9 = v8;
      }
      ++v8;
    }
    while (TableNumberOfRows != v8);
  }
  else
  {
    unsigned __int16 v9 = 0;
    unsigned __int16 v10 = 0;
  }
  double v12 = TSTMasterLayoutStrokeHeightOfGridRow(v4, v9 + 1, 0, 0xFFFFFFFF);
  int v13 = TableNumberOfColumns;
  if ((_BYTE)TableNumberOfColumns)
  {
    unsigned int v14 = 0;
    unsigned __int8 v15 = 0;
    do
    {
      if (TSTMasterLayoutIsColumnHidden(v4, v14))
      {
        --TableNumberOfColumns;
      }
      else
      {
        double v2 = v2 + TSTMasterLayoutStrokeWidthOfGridColumn(v4, v14, 0, 0xFFFFFFFF);
        unsigned __int8 v15 = v14;
      }
      ++v14;
    }
    while (v13 != v14);
  }
  else
  {
    unsigned __int8 v15 = 0;
  }
  double v16 = (float)((float)v10 * 8.0);
  if (v5 == 1) {
    double v16 = -0.0;
  }
  CGFloat v17 = v16 + v3 + v12;
  v21.size.double width = v2
                 + TSTMasterLayoutStrokeWidthOfGridColumn(v4, v15 + 1, 0, 0xFFFFFFFF)
                 + (float)((float)TableNumberOfColumns * 8.0);
  v21.origin.double x = *(CGFloat *)MEMORY[0x263F001A8];
  v21.origin.double y = *(CGFloat *)(MEMORY[0x263F001A8] + 8);
  v21.size.double height = v17;
  CGRect v22 = CGRectInset(v21, -1.0, -1.0);
  double width = v22.size.width;
  double height = v22.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)infoGeometryPositionForCurrentAttachedLayoutGeometry
{
  v10.receiver = self;
  v10.super_class = (Class)TSTLayout;
  [(TSDLayout *)&v10 infoGeometryPositionForCurrentAttachedLayoutGeometry];
  double v4 = v3;
  double v6 = v5;
  [[(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] space] tableOffset];
  double v8 = TSDAddPoints(v4, v6, v7);
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)capturedInfoPositionForAttachment
{
  if ([(TSDInfo *)[(TSDLayout *)self info] owningAttachmentNoRecurse])
  {
    [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] frame];
    double x = self->mRenderingFrameForLayoutGeometryFromInfo.origin.x;
    double v6 = TSDSubtractPoints(v3, v4, x);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TSTLayout;
    [(TSDLayout *)&v8 capturedInfoPositionForAttachment];
  }
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (id)layoutGeometryFromInfo
{
  objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "position");
  double v4 = v3;
  double v6 = v5;
  [[(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] space] tableOffset];
  double v8 = v7;
  if ([(TSDInfo *)[(TSDLayout *)self info] owningAttachmentNoRecurse])
  {
    [(TSTLayout *)self capturedInfoPositionForAttachment];
  }
  else
  {
    if (![(TSTMasterLayout *)[(TSTLayout *)self masterLayout] isDynamicallyChangingInfoGeometry])goto LABEL_6; {
    [(TSDInfoGeometry *)[(TSTMasterLayout *)[(TSTLayout *)self masterLayout] dynamicInfoGeometry] position];
    }
  }
  double v4 = v9;
  double v6 = v10;
LABEL_6:
  double RenderingFrame = TSTLayoutGetRenderingFrame(self, 0);
  CGFloat v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = v4 + RenderingFrame;
  double v19 = v6 + v12;
  if (([(TSDInfo *)[(TSDLayout *)self info] isInlineWithText] & 1) == 0)
  {
    double v18 = TSDSubtractPoints(v18, v19, v8);
    double v21 = v20;
    TSTLayoutGetTableNameHeight((uint64_t)self);
    double v19 = v21 + v22;
  }
  self->mRenderingFrameForLayoutGeometryFromInfo.origin.double x = RenderingFrame;
  self->mRenderingFrameForLayoutGeometryFromInfo.origin.double y = v13;
  self->mRenderingFrameForLayoutGeometryFromInfo.size.double width = v15;
  self->mRenderingFrameForLayoutGeometryFromInfo.size.double height = v17;
  v23 = -[TSDLayoutGeometry initWithFrame:]([TSDLayoutGeometry alloc], "initWithFrame:", v18, v19, v15, v17);

  return v23;
}

- (id)computeLayoutGeometry
{
  p_mCached = &self->mCached;
  __asm { FMOV            V0.2D, #1.0 }
  self->mCached.scaleToFitParent = _Q0;
  id v8 = [(TSDLayout *)self layoutGeometryFromProvider];
  if (([(TSDInfo *)[(TSDLayout *)self info] isInlineWithText] & 1) == 0)
  {
    objc_opt_class();
    [(TSDAbstractLayout *)self parent];
    double v9 = (void *)TSUDynamicCast();
    if (v9)
    {
      [v9 maximumFrameSizeForChild:self];
      double v11 = v10;
      double v13 = v12;
      [(TSTLayout *)self alignmentFrame];
      if (v14 > v11) {
        p_mCached->scaleToFitParent.double width = v11 / v14;
      }
      if (v15 <= v13)
      {
        double height = p_mCached->scaleToFitParent.height;
      }
      else
      {
        double height = v13 / v15;
        p_mCached->scaleToFitParent.double height = v13 / v15;
      }
      if (p_mCached->scaleToFitParent.width != 1.0 || height != 1.0)
      {
        [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] invalidateTableOffsets];
        [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] invalidateCoordinates];
        id v8 = [(TSDLayout *)self layoutGeometryFromProvider];
      }
    }
  }
  id v18 = [(TSDLayout *)self i_layoutGeometryProvider];
  if (!v18) {
    return v8;
  }
  double v19 = v18;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v8;
  }

  return (id)[v19 adjustLayoutGeometry:v8 forLayout:self];
}

- (id)initialInfoGeometry
{
  double v2 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", self->super.super.super.mCapturedInfoGeometryPositionForInline.x, self->super.super.super.mCapturedInfoGeometryPositionForInline.y, self->mCapturedStrokeFrameSizeForInline.width, self->mCapturedStrokeFrameSizeForInline.height);

  return v2;
}

- (int)wrapFitType
{
  return 0;
}

- (CGRect)alignmentFrame
{
  int v3 = [(TSDInfo *)[(TSDLayout *)self info] isInlineWithText];
  double v4 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] space];
  if (v3) {
    double StrokeFrame = TSTLayoutSpaceGetStrokeFrame((uint64_t)v4);
  }
  else {
    double StrokeFrame = TSTLayoutSpaceGetFrame((uint64_t)v4);
  }
  CGFloat v9 = StrokeFrame;
  double v10 = v6;
  CGFloat v11 = v7;
  double v12 = v8;
  TSTLayoutGetTableNameHeight((uint64_t)self);
  double v14 = v13;
  double v15 = [(TSDAbstractLayout *)self geometry];
  if (v15) {
    [(TSDLayoutGeometry *)v15 transform];
  }
  else {
    memset(&v16, 0, sizeof(v16));
  }
  v17.size.double height = v14 + v12;
  v17.origin.double y = v10 - v14;
  v17.origin.double x = v9;
  v17.size.double width = v11;
  return CGRectApplyAffineTransform(v17, &v16);
}

- (CGRect)alignmentFrameForProvidingGuidesInRoot
{
  double StrokeFrame = TSTLayoutSpaceGetStrokeFrame((uint64_t)[(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] space]);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v10 = [(TSDAbstractLayout *)self geometry];
  if (v10) {
    [(TSDLayoutGeometry *)v10 transform];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }
  v22.origin.CGFloat x = StrokeFrame;
  v22.origin.CGFloat y = v5;
  v22.size.CGFloat width = v7;
  v22.size.CGFloat height = v9;
  CGRect v23 = CGRectApplyAffineTransform(v22, &v21);
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;
  if ([(TSDAbstractLayout *)self parent])
  {
    double v15 = [(TSDAbstractLayout *)self parent];
    if (v15) {
      [(TSDAbstractLayout *)v15 transformInRoot];
    }
    else {
      memset(&v20, 0, sizeof(v20));
    }
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    CGRect v25 = CGRectApplyAffineTransform(v24, &v20);
    CGFloat x = v25.origin.x;
    CGFloat y = v25.origin.y;
    CGFloat width = v25.size.width;
    CGFloat height = v25.size.height;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (BOOL)inPrintPreviewMode
{
  return 0;
}

- (BOOL)inFindReplaceMode
{
  return 0;
}

- (BOOL)isZoomedEditing
{
  return 0;
}

- (void)validate
{
  [(TSTLayout *)self scaleToFit];
  double v4 = v3;
  double v6 = v5;
  CGFloat v7 = [(TSTTableInfo *)[(TSTLayout *)self tableInfo] partitioner];
  BOOL v8 = [(TSTTablePartitioner *)v7 scaleIsValid];
  double v9 = 1.0;
  double v10 = 1.0;
  if (v8) {
    [(TSTTablePartitioner *)v7 scaleToFit];
  }
  -[TSTLayout setScaleToFit:](self, "setScaleToFit:", v9, v10);
  [(TSTLayout *)self scaleToFit];
  if (v4 != v12 || v6 != v11)
  {
    [(TSTLayoutHint *)[(TSTLayout *)self layoutHint] cellRange];
    TSTLayoutInvalidateCellRangeAndFittingRange(self);
    [(TSTLayout *)self invalidateSize];
    [(TSTLayout *)self setNeedsDisplay];
  }
  self->mLayoutDirectionIsLeftToRight = [(TSTLayout *)self p_getLayoutDirectionLeftToRight];
  double v13 = [(TSTLayout *)self masterLayout];
  [(TSTMasterLayout *)v13 validate];
  [(TSTMasterLayout *)v13 validateLayoutHint:[(TSTLayout *)self layoutHint]];
  TSTLayoutSetPartitionRange(self);
  [(TSTLayout *)self validateTableNameVisibility];
  double v14 = [(TSTLayout *)self masterLayout];
  double v15 = &off_223837000;
  if ((~[(TSTLayoutHint *)[(TSTLayout *)self layoutHint] partitionPosition] & 0xF) != 0)
  {
    if (TSTMasterLayoutGetTableNumberOfHeaderRows((unsigned __int16 *)v14)) {
      uint64_t HeaderRowsRepeat = TSTMasterLayoutGetHeaderRowsRepeat((uint64_t)v14);
    }
    else {
      uint64_t HeaderRowsRepeat = 0;
    }
    if (TSTMasterLayoutGetTableNumberOfHeaderColumns((unsigned __int16 *)v14)) {
      uint64_t HeaderColumnsRepeat = TSTMasterLayoutGetHeaderColumnsRepeat((uint64_t)v14);
    }
    else {
      uint64_t HeaderColumnsRepeat = 0;
    }
    unint64_t RangeForHint = TSTMasterLayoutGetRangeForHint((uint64_t)[(TSTLayout *)self masterLayout], [(TSTLayout *)self layoutHint]);
    unint64_t PartitionHeaderColumnsCellRange = TSTLayoutGetPartitionHeaderColumnsCellRange(self);
    unint64_t PartitionHeaderRowsCellRange = TSTLayoutGetPartitionHeaderRowsCellRange(self);
    unint64_t PartitionHeaderCornerCellRange = TSTLayoutGetPartitionHeaderCornerCellRange(self);
    CGAffineTransform v21 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] space];
    [(TSTLayoutSpace *)v21 setHeaderRowsRepeat:HeaderRowsRepeat];
    [(TSTLayoutSpace *)v21 setHeaderColumnsRepeat:HeaderColumnsRepeat];
    unint64_t v22 = HIWORD(RangeForHint);
    if (HeaderColumnsRepeat)
    {
      if (!v22
        || (RangeForHint & 0xFFFF00000000) == 0
        || !HIWORD(PartitionHeaderColumnsCellRange)
        || (PartitionHeaderColumnsCellRange & 0xFFFF00000000) == 0
        || (unsigned __int16)RangeForHint > (unsigned __int16)PartitionHeaderColumnsCellRange
        || (unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1) < (unsigned __int16)PartitionHeaderColumnsCellRange
        || BYTE2(PartitionHeaderColumnsCellRange) < BYTE2(RangeForHint)
        || (unsigned int v23 = (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1),
            v23 < BYTE2(PartitionHeaderColumnsCellRange))
        || v23 < (BYTE4(PartitionHeaderColumnsCellRange) + BYTE2(PartitionHeaderColumnsCellRange) - 1)
        || (unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1) < (unsigned __int16)(PartitionHeaderColumnsCellRange + HIWORD(PartitionHeaderColumnsCellRange) - 1))
      {
        int v91 = HeaderRowsRepeat;
        if (![(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] repeatHeaderColumnsSpace])
        {
          CGRect v24 = [[TSTLayoutSpace alloc] initWithLayoutSpaceBundle:[(TSTLayout *)self spaceBundle] type:5];
          [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setRepeatHeaderColumnsSpace:v24];
        }
        if (BYTE2(PartitionHeaderColumnsCellRange) == 255) {
          unsigned int v25 = -1;
        }
        else {
          unsigned int v25 = BYTE2(PartitionHeaderColumnsCellRange);
        }
        if (WORD2(PartitionHeaderColumnsCellRange)) {
          uint64_t HeaderRowsRepeat = WORD2(PartitionHeaderColumnsCellRange) + v25 - 1;
        }
        else {
          uint64_t HeaderRowsRepeat = 0xFFFFFFFFLL;
        }
        v26 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] repeatHeaderColumnsSpace];
        if ((unsigned __int16)PartitionHeaderColumnsCellRange == 0xFFFF) {
          uint64_t v27 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v27 = (unsigned __int16)PartitionHeaderColumnsCellRange;
        }
        unint64_t v28 = v25 | ((unint64_t)v27 << 32);
        uint64_t v29 = ((PartitionHeaderColumnsCellRange >> 16) & 0xFFFF00000000) + (v27 << 32) - 0x100000000;
        if (((PartitionHeaderColumnsCellRange >> 16) & 0xFFFF00000000) == 0) {
          uint64_t v29 = 0xFFFFFFFF00000000;
        }
        TSTLayoutSpaceSetGridRange((uint64_t)v26, v28, HeaderRowsRepeat | v29);
        double v15 = &off_223837000;
        LODWORD(HeaderRowsRepeat) = v91;
      }
      if (HeaderRowsRepeat)
      {
LABEL_40:
        if (!v22
          || (RangeForHint & 0xFFFF00000000) == 0
          || !HIWORD(PartitionHeaderRowsCellRange)
          || (PartitionHeaderRowsCellRange & 0xFFFF00000000) == 0
          || (unsigned __int16)RangeForHint > (unsigned __int16)PartitionHeaderRowsCellRange
          || (unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1) < (unsigned __int16)PartitionHeaderRowsCellRange
          || BYTE2(PartitionHeaderRowsCellRange) < BYTE2(RangeForHint)
          || (unsigned int v30 = (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1),
              v30 < BYTE2(PartitionHeaderRowsCellRange))
          || v30 < (BYTE4(PartitionHeaderRowsCellRange) + BYTE2(PartitionHeaderRowsCellRange) - 1)
          || (unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1) < (unsigned __int16)(PartitionHeaderRowsCellRange + HIWORD(PartitionHeaderRowsCellRange) - 1))
        {
          int v31 = HeaderColumnsRepeat;
          if (![(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] repeatHeaderRowsSpace])
          {
            v32 = [[TSTLayoutSpace alloc] initWithLayoutSpaceBundle:[(TSTLayout *)self spaceBundle] type:6];
            [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setRepeatHeaderRowsSpace:v32];
          }
          if (BYTE2(PartitionHeaderRowsCellRange) == 255) {
            unsigned int v33 = -1;
          }
          else {
            unsigned int v33 = BYTE2(PartitionHeaderRowsCellRange);
          }
          if (WORD2(PartitionHeaderRowsCellRange)) {
            uint64_t HeaderColumnsRepeat = WORD2(PartitionHeaderRowsCellRange) + v33 - 1;
          }
          else {
            uint64_t HeaderColumnsRepeat = 0xFFFFFFFFLL;
          }
          v34 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] repeatHeaderRowsSpace];
          if ((unsigned __int16)PartitionHeaderRowsCellRange == 0xFFFF) {
            uint64_t v35 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v35 = (unsigned __int16)PartitionHeaderRowsCellRange;
          }
          unint64_t v36 = v33 | ((unint64_t)v35 << 32);
          uint64_t v37 = ((PartitionHeaderRowsCellRange >> 16) & 0xFFFF00000000) + (v35 << 32) - 0x100000000;
          if (((PartitionHeaderRowsCellRange >> 16) & 0xFFFF00000000) == 0) {
            uint64_t v37 = 0xFFFFFFFF00000000;
          }
          TSTLayoutSpaceSetGridRange((uint64_t)v34, v36, HeaderColumnsRepeat | v37);
          LODWORD(HeaderColumnsRepeat) = v31;
        }
        if (HeaderColumnsRepeat)
        {
          char v93 = HeaderColumnsRepeat;
          if (![(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] repeatHeaderCornerSpace])
          {
            v38 = [[TSTLayoutSpace alloc] initWithLayoutSpaceBundle:[(TSTLayout *)self spaceBundle] type:4];
            [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setRepeatHeaderCornerSpace:v38];
          }
          if (BYTE2(PartitionHeaderCornerCellRange) == 255) {
            unsigned int v39 = -1;
          }
          else {
            unsigned int v39 = BYTE2(PartitionHeaderCornerCellRange);
          }
          if (WORD2(PartitionHeaderCornerCellRange)) {
            uint64_t HeaderColumnsRepeat = WORD2(PartitionHeaderCornerCellRange) + v39 - 1;
          }
          else {
            uint64_t HeaderColumnsRepeat = 0xFFFFFFFFLL;
          }
          v40 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] repeatHeaderCornerSpace];
          if ((unsigned __int16)PartitionHeaderCornerCellRange == 0xFFFF) {
            uint64_t v41 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v41 = (unsigned __int16)PartitionHeaderCornerCellRange;
          }
          unint64_t v42 = v39 | ((unint64_t)v41 << 32);
          uint64_t v43 = ((PartitionHeaderCornerCellRange >> 16) & 0xFFFF00000000) + (v41 << 32) - 0x100000000;
          if (((PartitionHeaderCornerCellRange >> 16) & 0xFFFF00000000) == 0) {
            uint64_t v43 = 0xFFFFFFFF00000000;
          }
          TSTLayoutSpaceSetGridRange((uint64_t)v40, v42, HeaderColumnsRepeat | v43);
          LOBYTE(HeaderColumnsRepeat) = v93;
          goto LABEL_82;
        }
LABEL_81:
        [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setRepeatHeaderCornerSpace:0];
LABEL_82:
        [(TSTLayoutSpace *)v21 viewScale];
        uint64_t v45 = v44;
        long long v112 = 0u;
        long long v113 = 0u;
        long long v111 = 0u;
        if (v21)
        {
          [(TSTLayoutSpace *)v21 transformToCanvas];
          long long v109 = 0u;
          long long v110 = 0u;
          long long v108 = 0u;
          [(TSTLayoutSpace *)v21 transformToDevice];
        }
        else
        {
          long long v109 = 0uLL;
          long long v110 = 0uLL;
          long long v108 = 0uLL;
        }
        v46 = [(TSTLayout *)self spaceBundle];
        uint64_t v95 = MEMORY[0x263EF8330];
        uint64_t v96 = *((void *)v15 + 374);
        v97 = ___ZL28TSTLayoutUpdateRepeatHeadersP9TSTLayout_block_invoke;
        v98 = &__block_descriptor_138_e24_B16__0__TSTLayoutSpace_8l;
        char v106 = HeaderRowsRepeat;
        char v107 = HeaderColumnsRepeat;
        uint64_t v99 = v45;
        long long v100 = v111;
        long long v101 = v112;
        long long v102 = v113;
        long long v103 = v108;
        long long v104 = v109;
        long long v105 = v110;
        [(TSTLayoutSpaceBundle *)v46 performActionOnRepeatLayoutSpaces:&v95];
        goto LABEL_86;
      }
    }
    else
    {
      [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setRepeatHeaderColumnsSpace:0];
      if (HeaderRowsRepeat) {
        goto LABEL_40;
      }
    }
    [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setRepeatHeaderRowsSpace:0];
    goto LABEL_81;
  }
  [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setRepeatHeaderColumnsSpace:0];
  [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setRepeatHeaderRowsSpace:0];
  [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setRepeatHeaderCornerSpace:0];
LABEL_86:
  if (objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "isCanvasInteractive")&& (objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "animatingViewScale") & 1) == 0)
  {
    int v47 = ![(TSTLayout *)self inPrintPreviewMode];
  }
  else
  {
    int v47 = 0;
  }
  unint64_t v48 = TSTLayoutGetPartitionHeaderColumnsCellRange(self);
  unint64_t v49 = TSTLayoutGetPartitionHeaderRowsCellRange(self);
  unint64_t v50 = TSTLayoutGetPartitionHeaderCornerCellRange(self);
  v51 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] space];
  if (v47 && TSTLayoutGetFrozenHeaderColumnsEnabled(self))
  {
    v52 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderColumnsSpace];
    BOOL v53 = v52 == 0;
    if (!v52)
    {
      v54 = [[TSTLayoutSpace alloc] initWithLayoutSpaceBundle:[(TSTLayout *)self spaceBundle] type:2];
      [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setFrozenHeaderColumnsSpace:v54];
    }
    if (BYTE2(v48) == 255) {
      unsigned int v55 = -1;
    }
    else {
      unsigned int v55 = BYTE2(v48);
    }
    if (WORD2(v48)) {
      uint64_t v56 = WORD2(v48) + v55 - 1;
    }
    else {
      uint64_t v56 = 0xFFFFFFFFLL;
    }
    v57 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderColumnsSpace];
    if ((unsigned __int16)v48 == 0xFFFF) {
      uint64_t v58 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v58 = (unsigned __int16)v48;
    }
    unint64_t v59 = v55 | ((unint64_t)v58 << 32);
    uint64_t v60 = ((v48 >> 16) & 0xFFFF00000000) + (v58 << 32) - 0x100000000;
    if (((v48 >> 16) & 0xFFFF00000000) == 0) {
      uint64_t v60 = 0xFFFFFFFF00000000;
    }
    TSTLayoutSpaceSetGridRange((uint64_t)v57, v59, v56 | v60);
    double v15 = &off_223837000;
  }
  else
  {
    v61 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderColumnsSpace];
    BOOL v53 = v61 != 0;
    if (v61)
    {
      Canvasdouble StrokeFrame = TSTLayoutSpaceGetCanvasStrokeFrame((uint64_t)[(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderColumnsSpace]);
      [(TSTLayout *)self setNeedsDisplayInRect:TSTLayoutSpaceGetLayoutRectForCanvasRect((uint64_t)[(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] space], CanvasStrokeFrame, v63, v64, v65)];
      [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setFrozenHeaderColumnsSpace:0];
    }
    if (!v47) {
      goto LABEL_124;
    }
  }
  if (TSTLayoutGetFrozenHeaderRowsEnabled(self))
  {
    if (![(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderRowsSpace])
    {
      v66 = [[TSTLayoutSpace alloc] initWithLayoutSpaceBundle:[(TSTLayout *)self spaceBundle] type:3];
      [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setFrozenHeaderRowsSpace:v66];

      BOOL v53 = 1;
    }
    if (BYTE2(v49) == 255) {
      unsigned int v67 = -1;
    }
    else {
      unsigned int v67 = BYTE2(v49);
    }
    if (WORD2(v49)) {
      uint64_t v68 = WORD2(v49) + v67 - 1;
    }
    else {
      uint64_t v68 = 0xFFFFFFFFLL;
    }
    v69 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderRowsSpace];
    if ((unsigned __int16)v49 == 0xFFFF) {
      uint64_t v70 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v70 = (unsigned __int16)v49;
    }
    unint64_t v71 = v67 | ((unint64_t)v70 << 32);
    uint64_t v72 = ((v49 >> 16) & 0xFFFF00000000) + (v70 << 32) - 0x100000000;
    if (((v49 >> 16) & 0xFFFF00000000) == 0) {
      uint64_t v72 = 0xFFFFFFFF00000000;
    }
    TSTLayoutSpaceSetGridRange((uint64_t)v69, v71, v68 | v72);
    goto LABEL_126;
  }
LABEL_124:
  if ([(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderRowsSpace])
  {
    double v73 = TSTLayoutSpaceGetCanvasStrokeFrame((uint64_t)[(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderRowsSpace]);
    [(TSTLayout *)self setNeedsDisplayInRect:TSTLayoutSpaceGetLayoutRectForCanvasRect((uint64_t)[(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] space], v73, v74, v75, v76)];
    [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setFrozenHeaderRowsSpace:0];
    BOOL v53 = 1;
  }
LABEL_126:
  if ([(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderColumnsSpace]&& [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderRowsSpace])
  {
    if (![(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderCornerSpace])
    {
      BOOL v53 = 1;
      v77 = [[TSTLayoutSpace alloc] initWithLayoutSpaceBundle:[(TSTLayout *)self spaceBundle] type:1];
      [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setFrozenHeaderCornerSpace:v77];
    }
    if (BYTE2(v50) == 255) {
      unsigned int v78 = -1;
    }
    else {
      unsigned int v78 = BYTE2(v50);
    }
    if (WORD2(v50)) {
      uint64_t v79 = WORD2(v50) + v78 - 1;
    }
    else {
      uint64_t v79 = 0xFFFFFFFFLL;
    }
    v80 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderCornerSpace];
    if ((unsigned __int16)v50 == 0xFFFF) {
      uint64_t v81 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v81 = (unsigned __int16)v50;
    }
    unint64_t v82 = v78 | ((unint64_t)v81 << 32);
    uint64_t v83 = ((v50 >> 16) & 0xFFFF00000000) + (v81 << 32) - 0x100000000;
    if (((v50 >> 16) & 0xFFFF00000000) == 0) {
      uint64_t v83 = 0xFFFFFFFF00000000;
    }
    TSTLayoutSpaceSetGridRange((uint64_t)v80, v82, v79 | v83);
  }
  else if ([(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderCornerSpace])
  {
    double v84 = TSTLayoutSpaceGetCanvasStrokeFrame((uint64_t)[(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderCornerSpace]);
    [(TSTLayout *)self setNeedsDisplayInRect:TSTLayoutSpaceGetLayoutRectForCanvasRect((uint64_t)[(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] space], v84, v85, v86, v87)];
    [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] setFrozenHeaderCornerSpace:0];
    BOOL v53 = 1;
  }
  [(TSTLayoutSpace *)v51 viewScale];
  uint64_t v89 = v88;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v111 = 0u;
  if (v51)
  {
    [(TSTLayoutSpace *)v51 transformToCanvas];
    long long v109 = 0u;
    long long v110 = 0u;
    long long v108 = 0u;
    [(TSTLayoutSpace *)v51 transformToDevice];
  }
  else
  {
    long long v109 = 0uLL;
    long long v110 = 0uLL;
    long long v108 = 0uLL;
  }
  v90 = [(TSTLayout *)self spaceBundle];
  uint64_t v95 = MEMORY[0x263EF8330];
  uint64_t v96 = *((void *)v15 + 374);
  v97 = ___ZL28TSTLayoutUpdateFrozenHeadersP9TSTLayout_block_invoke;
  v98 = &__block_descriptor_136_e24_B16__0__TSTLayoutSpace_8l;
  uint64_t v99 = v89;
  long long v100 = v111;
  long long v101 = v112;
  long long v102 = v113;
  long long v103 = v108;
  long long v104 = v109;
  long long v105 = v110;
  [(TSTLayoutSpaceBundle *)v90 performActionOnFrozenLayoutSpaces:&v95];
  if (v53) {
    [(TSTLayout *)self invalidate];
  }
  self->mCoordinatesChangedMaskForChrome |= [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] validateLayoutSpaces];
  v94.receiver = self;
  v94.super_class = (Class)TSTLayout;
  [(TSDLayout *)&v94 validate];
  TSTLayoutUpdateTransformToCanvas(self);
}

- (void)setNeedsDisplay
{
  v2.receiver = self;
  v2.super_class = (Class)TSTLayout;
  [(TSDLayout *)&v2 setNeedsDisplay];
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    v8.receiver = self;
    v8.super_class = (Class)TSTLayout;
    -[TSDLayout setNeedsDisplayInRect:](&v8, sel_setNeedsDisplayInRect_, x, y, width, height);
  }
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)TSTLayout;
  [(TSDDrawableLayout *)&v3 invalidate];
  [(TSTLayoutHint *)[(TSTLayout *)self layoutHint] setIsValid:0];
}

- (void)invalidateSize
{
  v3.receiver = self;
  v3.super_class = (Class)TSTLayout;
  [(TSDLayout *)&v3 invalidateSize];
  [(TSDDrawableLayout *)self invalidateExteriorWrap];
}

- (void)bezierPathsForCellRegion:(id)a3 transform:(CGAffineTransform *)a4 viewScale:(double)a5 inset:(double)a6 block:(id)a7
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  unint64_t v48 = [a3 boundingCellRange];
  int FrozenHeaderColumnsFloating = TSTLayoutGetFrozenHeaderColumnsFloating(self);
  int FrozenHeaderRowsFloating = TSTLayoutGetFrozenHeaderRowsFloating(self);
  char v12 = FrozenHeaderRowsFloating;
  if (FrozenHeaderColumnsFloating)
  {
    unint64_t Range = TSTLayoutSpaceGetRange((uint64_t)[(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderColumnsSpace]);
    unsigned __int16 v14 = Range;
    unint64_t v15 = Range >> 16;
    unint64_t v44 = HIWORD(Range);
    if ((v12 & 1) == 0)
    {
      __int16 v38 = Range;
      unint64_t v39 = Range >> 16;
      LOWORD(v45) = 0;
      LOWORD(v46) = 0;
      LOWORD(v35) = 0;
      LOBYTE(v36) = 0;
      LOBYTE(v42) = -1;
      LOWORD(v43) = 0;
      int v34 = 0xFFFFFF;
      __int16 v37 = -1;
      goto LABEL_35;
    }
  }
  else
  {
    LODWORD(v15) = 255;
    unsigned __int16 v14 = -1;
    if (!FrozenHeaderRowsFloating)
    {
      LOWORD(v45) = 0;
      LOWORD(v46) = 0;
      LOWORD(v35) = 0;
      LOBYTE(v36) = 0;
      LOWORD(v43) = 0;
      LOWORD(v44) = 0;
      int v34 = 0xFFFFFF;
      LODWORD(v39) = 255;
      LOBYTE(v42) = -1;
      __int16 v37 = -1;
      __int16 v38 = -1;
      goto LABEL_35;
    }
    unint64_t v44 = 0;
  }
  unint64_t v16 = TSTLayoutSpaceGetRange((uint64_t)[(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderRowsSpace]);
  unint64_t v36 = v16 >> 24;
  __int16 v37 = v16;
  unint64_t v42 = v16 >> 16;
  unint64_t v43 = HIDWORD(v16);
  unint64_t v46 = HIWORD(v16);
  LODWORD(v39) = v15;
  if (FrozenHeaderColumnsFloating)
  {
    unint64_t v17 = v16;
    unint64_t v18 = TSTLayoutSpaceGetRange((uint64_t)[(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderCornerSpace]);
    unint64_t v45 = HIWORD(v18);
    if (v15 >= 0x10000)
    {
      unint64_t v19 = v14 | (v44 << 48) | ((unint64_t)v15 << 16);
      if (HIWORD(v19))
      {
        if (v45)
        {
          if ((v18 & 0xFFFF00000000) != 0
            && v14 <= (unsigned __int16)v18
            && (unsigned __int16)(v44 + v14 - 1) >= (unsigned __int16)v18
            && BYTE2(v18) >= v15)
          {
            unsigned int v20 = (BYTE4(v19) + v15 - 1);
            if (v20 >= BYTE2(v18) && v20 >= (BYTE4(v18) + BYTE2(v18) - 1))
            {
              if ((unsigned __int16)(v44 + v14 - 1) < (unsigned __int16)(v18 + HIWORD(v18) - 1)) {
                __int16 v21 = 0;
              }
              else {
                __int16 v21 = HIWORD(v18);
              }
              v14 += v21;
              LOWORD(v44) = v44 - v21;
            }
          }
        }
      }
    }
    __int16 v38 = v14;
    int v34 = v18;
    unint64_t v35 = HIDWORD(v18);
    if (v46)
    {
      if ((v17 & 0xFFFF00000000) != 0)
      {
        if (v45)
        {
          if ((v18 & 0xFFFF00000000) != 0
            && (unsigned __int16)v17 <= (unsigned __int16)v18
            && (unsigned __int16)(v17 + v46 - 1) >= (unsigned __int16)v18
            && BYTE2(v17) <= BYTE2(v18))
          {
            unsigned int v22 = (v43 + BYTE2(v17) - 1);
            if (v22 >= BYTE2(v18) && v22 >= (BYTE4(v18) + BYTE2(v18) - 1))
            {
              if ((unsigned __int16)(v17 + v46 - 1) < (unsigned __int16)(v18 + HIWORD(v18) - 1)) {
                __int16 v23 = 0;
              }
              else {
                __int16 v23 = WORD2(v18);
              }
              LOBYTE(v42) = v23 + v42;
              LOWORD(v43) = v43 - v23;
            }
          }
        }
      }
    }
  }
  else
  {
    __int16 v38 = v14;
    LOWORD(v45) = 0;
    int v34 = 0xFFFFFF;
    LOWORD(v35) = 0;
  }
LABEL_35:
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = (id)[TSTLayoutGetVisibleLayoutSpaces(self) reverseObjectEnumerator];
  uint64_t v24 = [obj countByEnumeratingWithState:&v77 objects:v81 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v78;
    v32 = (char *)a7 + 16;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v78 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        int v28 = objc_msgSend(v27, "layoutSpaceType", v32);
        if (TSTLayoutSpaceIntersectsCellRange((BOOL)v27, v48))
        {
          uint64_t v71 = 0;
          uint64_t v72 = &v71;
          uint64_t v73 = 0x3052000000;
          double v74 = __Block_byref_object_copy__73;
          double v75 = __Block_byref_object_dispose__74;
          uint64_t v76 = 0;
          uint64_t v65 = 0;
          v66 = &v65;
          uint64_t v67 = 0x3052000000;
          uint64_t v68 = __Block_byref_object_copy__73;
          v69 = __Block_byref_object_dispose__74;
          uint64_t v70 = 0;
          v49[0] = MEMORY[0x263EF8330];
          v49[1] = 3221225472;
          v49[2] = __70__TSTLayout_bezierPathsForCellRegion_transform_viewScale_inset_block___block_invoke;
          v49[3] = &unk_2646B3B88;
          int v53 = v28;
          __int16 v54 = v38;
          int v55 = v39;
          __int16 v56 = v44;
          __int16 v57 = v37;
          char v58 = v42;
          char v59 = v36;
          __int16 v60 = v43;
          __int16 v61 = v46;
          int v62 = v34;
          __int16 v63 = v35;
          __int16 v64 = v45;
          v49[4] = v27;
          v49[5] = self;
          *(double *)&v49[8] = a5;
          *(double *)&v49[9] = a6;
          long long v29 = *(_OWORD *)&a4->tx;
          long long v30 = *(_OWORD *)&a4->a;
          long long v51 = *(_OWORD *)&a4->c;
          long long v52 = v29;
          long long v50 = v30;
          v49[6] = &v65;
          v49[7] = &v71;
          [a3 enumerateCellRangesUsingBlock:v49];
          int v31 = (void *)v66[5];
          if (v31)
          {
            if (([v31 isEmpty] & 1) == 0) {
              (*((void (**)(id, uint64_t, uint64_t, void *))a7 + 2))(a7, v66[5], v72[5], v27);
            }
          }
          _Block_object_dispose(&v65, 8);
          _Block_object_dispose(&v71, 8);
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v77 objects:v81 count:16];
    }
    while (v24);
  }
}

uint64_t __70__TSTLayout_bezierPathsForCellRegion_transform_viewScale_inset_block___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t result = TSTLayoutSpaceIntersectsCellRange(*(void *)(a1 + 32), a2);
  if (result)
  {
    unint64_t v5 = v2 >> 16;
    uint64_t v6 = WORD2(v2);
    unint64_t v7 = HIWORD(v2);
    switch(*(_DWORD *)(a1 + 128))
    {
      case 0:
        unint64_t v8 = *(void *)(a1 + 132);
        if (*(_WORD *)(a1 + 132) != 0xFFFF)
        {
          BOOL v9 = (v8 & 0xFF0000) == 0xFF0000 || HIWORD(v8) == 0;
          if (!v9 && (v8 & 0xFFFF00000000) != 0)
          {
            uint64_t v49 = 0xFFFFLL;
            BOOL v50 = (~v2 & 0xFF0000) == 0 || (unsigned __int16)v2 == 0xFFFFLL;
            int v51 = !v50;
            unint64_t v52 = 0;
            if (v50)
            {
              unint64_t v54 = 0;
              uint64_t v53 = 16711680;
            }
            else
            {
              uint64_t v53 = 16711680;
              uint64_t v49 = 0xFFFFLL;
              unint64_t v54 = 0;
              if (v7 && (v2 & 0xFFFF00000000) != 0)
              {
                uint64_t v49 = 0;
                unsigned int v55 = BYTE2(v8);
                if (BYTE2(v8) <= BYTE2(v2)) {
                  unsigned int v55 = BYTE2(v2);
                }
                if ((unsigned __int16)*(void *)(a1 + 132) <= (unsigned __int16)v2) {
                  uint64_t v56 = (unsigned __int16)v2;
                }
                else {
                  uint64_t v56 = (unsigned __int16)*(void *)(a1 + 132);
                }
                if ((BYTE4(v8) + BYTE2(v8) - 1) >= (BYTE4(v2) + BYTE2(v2) - 1)) {
                  unsigned int v57 = (BYTE4(v2) + BYTE2(v2) - 1);
                }
                else {
                  unsigned int v57 = (BYTE4(v8) + BYTE2(v8) - 1);
                }
                if ((unsigned __int16)(v8 + HIWORD(v8) - 1) >= (unsigned __int16)(v2 + HIWORD(v2) - 1)) {
                  unsigned int v58 = (unsigned __int16)(v2 + HIWORD(v2) - 1);
                }
                else {
                  unsigned int v58 = (unsigned __int16)(v8 + HIWORD(v8) - 1);
                }
                uint64_t v53 = 0;
                unint64_t v52 = 0;
                unint64_t v54 = 0;
                if (v56 <= v58 && v55 <= v57)
                {
                  unint64_t v54 = ((unint64_t)(v58 - v56) << 48) + 0x1000000000000;
                  unint64_t v52 = (unint64_t)(unsigned __int16)(v57 - v55 + 1) << 32;
                  uint64_t v53 = v55 << 16;
                  uint64_t v49 = v56;
                }
              }
            }
            unint64_t v59 = v53 | v54 | v49 | v52;
            if ((_WORD)v59 != 0xFFFF && (v59 & 0xFF0000) != 0xFF0000 && HIWORD(v59) && (v59 & 0xFFFF00000000) != 0)
            {
              unint64_t v60 = 0;
              if (v51)
              {
                uint64_t v61 = 0;
                if (v7 && (v2 & 0xFFFF00000000) != 0)
                {
                  unsigned int v62 = BYTE2(v8);
                  if (BYTE2(v8) <= BYTE2(v2)) {
                    unsigned int v62 = BYTE2(v2);
                  }
                  unsigned int v63 = (unsigned __int16)*(void *)(a1 + 132);
                  if (v63 <= (unsigned __int16)v2) {
                    unsigned int v63 = (unsigned __int16)v2;
                  }
                  if ((BYTE4(v8) + BYTE2(v8) - 1) >= (BYTE4(v2) + BYTE2(v2) - 1)) {
                    unsigned int v64 = (BYTE4(v2) + BYTE2(v2) - 1);
                  }
                  else {
                    unsigned int v64 = (BYTE4(v8) + BYTE2(v8) - 1);
                  }
                  unsigned int v65 = (unsigned __int16)(v8 + HIWORD(v8) - 1);
                  if (v65 >= (unsigned __int16)(v2 + HIWORD(v2) - 1)) {
                    unsigned int v65 = (unsigned __int16)(v2 + HIWORD(v2) - 1);
                  }
                  BOOL v66 = v62 > v64;
                  if (v62 <= v64) {
                    unint64_t v60 = (((unint64_t)(v64 - v62) << 32) + 0x100000000) & 0xFFFF00000000;
                  }
                  else {
                    unint64_t v60 = 0;
                  }
                  if (v66) {
                    uint64_t v67 = 0;
                  }
                  else {
                    uint64_t v67 = 0x1000000000000;
                  }
                  if (v63 <= v65)
                  {
                    uint64_t v61 = v67;
                  }
                  else
                  {
                    unint64_t v60 = 0;
                    uint64_t v61 = 0;
                  }
                }
              }
              else
              {
                uint64_t v61 = 0;
              }
              unint64_t v80 = (v61 | v60) >> 32;
              LOBYTE(v5) = v80 + BYTE2(v2);
              uint64_t v6 = (unsigned __int16)(WORD2(v2) - v80);
            }
          }
        }
        unint64_t v11 = *(void *)(a1 + 140);
        if (*(_WORD *)(a1 + 140) == 0xFFFF
          || (v11 & 0xFF0000) == 0xFF0000
          || !HIWORD(v11)
          || (v11 & 0xFFFF00000000) == 0)
        {
          goto LABEL_161;
        }
        unint64_t v12 = v2 & 0xFFFF0000FF000000 | (v6 << 32);
        unint64_t v13 = v12 | ((unint64_t)v5 << 16);
        unint64_t v14 = v13 | (unsigned __int16)v2;
        uint64_t v15 = 0xFFFFLL;
        BOOL v16 = (_BYTE)v5 == 0xFF || (unsigned __int16)v2 == 0xFFFFLL;
        BOOL v17 = !v16;
        unint64_t v18 = 0;
        if (v16)
        {
          unint64_t v20 = 0;
          uint64_t v19 = 16711680;
        }
        else
        {
          uint64_t v19 = 16711680;
          uint64_t v15 = 0xFFFFLL;
          if (v6)
          {
            unint64_t v20 = 0;
            if (HIWORD(v14))
            {
              uint64_t v15 = 0;
              unsigned int v21 = BYTE2(v11);
              if (BYTE2(v11) <= v5) {
                unsigned int v21 = v5;
              }
              if ((unsigned __int16)*(void *)(a1 + 140) <= (unsigned __int16)v2) {
                uint64_t v22 = (unsigned __int16)v2;
              }
              else {
                uint64_t v22 = (unsigned __int16)*(void *)(a1 + 140);
              }
              if ((BYTE4(v11) + BYTE2(v11) - 1) >= (BYTE4(v12) + BYTE2(v13) - 1)) {
                unsigned int v23 = (BYTE4(v12) + BYTE2(v13) - 1);
              }
              else {
                unsigned int v23 = (BYTE4(v11) + BYTE2(v11) - 1);
              }
              if ((unsigned __int16)(v11 + HIWORD(v11) - 1) >= (unsigned __int16)(v2 + HIWORD(v2) - 1)) {
                unsigned int v24 = (unsigned __int16)(v2 + HIWORD(v2) - 1);
              }
              else {
                unsigned int v24 = (unsigned __int16)(v11 + HIWORD(v11) - 1);
              }
              uint64_t v19 = 0;
              unint64_t v18 = 0;
              unint64_t v20 = 0;
              if (v22 <= v24 && v21 <= v23)
              {
                unint64_t v20 = ((unint64_t)(v24 - v22) << 48) + 0x1000000000000;
                unint64_t v18 = (unint64_t)(unsigned __int16)(v23 - v21 + 1) << 32;
                uint64_t v19 = v21 << 16;
                uint64_t v15 = v22;
              }
            }
          }
          else
          {
            unint64_t v20 = 0;
          }
        }
        unint64_t v68 = v19 | v20 | v15 | v18;
        if ((_WORD)v68 == 0xFFFF || (v68 & 0xFF0000) == 0xFF0000 || !HIWORD(v68) || (v68 & 0xFFFF00000000) == 0) {
          goto LABEL_161;
        }
        __int16 v69 = 0;
        if (v17 && v6 && HIWORD(v14))
        {
          __int16 v69 = 0;
          unsigned int v70 = v5;
          if (BYTE2(v11) > v5) {
            unsigned int v70 = BYTE2(v11);
          }
          unsigned int v71 = (unsigned __int16)*(void *)(a1 + 140);
          if (v71 <= (unsigned __int16)v2) {
            unsigned int v71 = (unsigned __int16)v2;
          }
          BOOL v72 = (BYTE4(v11) + BYTE2(v11) - 1) >= (BYTE4(v12)
                                                                                                + BYTE2(v13)
                                                                                                - 1);
          unsigned int v73 = (BYTE4(v12) + BYTE2(v13) - 1);
          if (!v72) {
            unsigned int v73 = (BYTE4(v11) + BYTE2(v11) - 1);
          }
          unsigned int v74 = (unsigned __int16)(v11 + HIWORD(v11) - 1);
          if (v74 >= (unsigned __int16)(v2 + HIWORD(v2) - 1)) {
            unsigned int v74 = (unsigned __int16)(v2 + HIWORD(v2) - 1);
          }
          if (v71 <= v74 && v70 <= v73) {
            __int16 v69 = v74 - v71 + 1;
          }
        }
        LOWORD(v43) = v69 + v2;
        unint64_t v7 = (unsigned __int16)(HIWORD(v2) - v69);
        goto LABEL_162;
      case 1:
        unint64_t v25 = 0;
        unint64_t v26 = *(void *)(a1 + 148);
        uint64_t v27 = 16711680;
        uint64_t v28 = 0xFFFFLL;
        if (*(_WORD *)(a1 + 148) == 0xFFFF) {
          goto LABEL_89;
        }
        unint64_t v29 = 0;
        if ((v26 & 0xFF0000) == 0xFF0000) {
          goto LABEL_90;
        }
        unint64_t v25 = 0;
        uint64_t v27 = 16711680;
        uint64_t v28 = 0xFFFFLL;
        if (!HIWORD(v26)) {
          goto LABEL_89;
        }
        unint64_t v29 = 0;
        if ((v26 & 0xFFFF00000000) == 0) {
          goto LABEL_90;
        }
        unint64_t v25 = 0;
        uint64_t v27 = 16711680;
        uint64_t v28 = 0xFFFFLL;
        if ((unsigned __int16)v2 == 0xFFFFLL) {
          goto LABEL_89;
        }
        unint64_t v29 = 0;
        if ((v2 & 0xFF0000) != 0xFF0000)
        {
          unint64_t v25 = 0;
          uint64_t v27 = 16711680;
          uint64_t v28 = 0xFFFFLL;
          if (v7)
          {
            unint64_t v29 = 0;
            if ((v2 & 0xFFFF00000000) != 0)
            {
              uint64_t v28 = 0;
              unsigned int v30 = BYTE2(v26) <= BYTE2(v2) ? BYTE2(v2) : BYTE2(v26);
              uint64_t v31 = (unsigned __int16)*(void *)(a1 + 148) <= (unsigned __int16)v2
                  ? (unsigned __int16)v2
                  : (unsigned __int16)*(void *)(a1 + 148);
              unsigned int v32 = (BYTE4(v26) + BYTE2(v26) - 1) >= (BYTE4(v2) + BYTE2(v2) - 1)
                  ? (BYTE4(v2) + BYTE2(v2) - 1)
                  : (BYTE4(v26) + BYTE2(v26) - 1);
              unsigned int v33 = (unsigned __int16)(v26 + HIWORD(v26) - 1) >= (unsigned __int16)(v2 + HIWORD(v2) - 1)
                  ? (unsigned __int16)(v2 + HIWORD(v2) - 1)
                  : (unsigned __int16)(v26 + HIWORD(v26) - 1);
              uint64_t v27 = 0;
              unint64_t v25 = 0;
              unint64_t v29 = 0;
              if (v31 <= v33 && v30 <= v32)
              {
                unint64_t v29 = ((unint64_t)(v33 - v31) << 48) + 0x1000000000000;
                unint64_t v25 = (unint64_t)(unsigned __int16)(v32 - v30 + 1) << 32;
                uint64_t v27 = v30 << 16;
                uint64_t v28 = v31;
              }
            }
          }
          else
          {
LABEL_89:
            unint64_t v29 = 0;
          }
        }
LABEL_90:
        id v83 = 0;
        unint64_t v44 = *(TSTLayout **)(a1 + 40);
        unint64_t v45 = v27 | v29 | v28 | v25;
        CGFloat v46 = *(double *)(a1 + 64);
        CGFloat v47 = *(double *)(a1 + 72);
        unint64_t v48 = 0;
        goto LABEL_163;
      case 2:
        unint64_t v34 = 0;
        unint64_t v35 = *(void *)(a1 + 132);
        goto LABEL_64;
      case 3:
        unint64_t v34 = 0;
        unint64_t v35 = *(void *)(a1 + 140);
LABEL_64:
        uint64_t v36 = 16711680;
        uint64_t v37 = 0xFFFFLL;
        if ((_WORD)v35 == 0xFFFF) {
          goto LABEL_87;
        }
        unint64_t v38 = 0;
        if ((v35 & 0xFF0000) == 0xFF0000) {
          goto LABEL_88;
        }
        unint64_t v34 = 0;
        uint64_t v36 = 16711680;
        uint64_t v37 = 0xFFFFLL;
        if (!HIWORD(v35)) {
          goto LABEL_87;
        }
        unint64_t v38 = 0;
        if ((v35 & 0xFFFF00000000) == 0) {
          goto LABEL_88;
        }
        unint64_t v34 = 0;
        uint64_t v36 = 16711680;
        uint64_t v37 = 0xFFFFLL;
        if ((unsigned __int16)v2 == 0xFFFFLL) {
          goto LABEL_87;
        }
        unint64_t v38 = 0;
        if ((v2 & 0xFF0000) != 0xFF0000)
        {
          unint64_t v34 = 0;
          uint64_t v36 = 16711680;
          uint64_t v37 = 0xFFFFLL;
          if (v7)
          {
            unint64_t v38 = 0;
            if ((v2 & 0xFFFF00000000) != 0)
            {
              uint64_t v37 = 0;
              unsigned int v39 = BYTE2(v35) <= BYTE2(v2) ? BYTE2(v2) : BYTE2(v35);
              uint64_t v40 = (unsigned __int16)v35 <= (unsigned __int16)v2
                  ? (unsigned __int16)v2
                  : (unsigned __int16)v35;
              unsigned int v41 = (BYTE4(v35) + BYTE2(v35) - 1) >= (BYTE4(v2) + BYTE2(v2) - 1)
                  ? (BYTE4(v2) + BYTE2(v2) - 1)
                  : (BYTE4(v35) + BYTE2(v35) - 1);
              unsigned int v42 = (unsigned __int16)(v35 + HIWORD(v35) - 1) >= (unsigned __int16)(v2 + HIWORD(v2) - 1)
                  ? (unsigned __int16)(v2 + HIWORD(v2) - 1)
                  : (unsigned __int16)(v35 + HIWORD(v35) - 1);
              uint64_t v36 = 0;
              unint64_t v34 = 0;
              unint64_t v38 = 0;
              if (v40 <= v42 && v39 <= v41)
              {
                unint64_t v38 = ((unint64_t)(v42 - v40) << 48) + 0x1000000000000;
                unint64_t v34 = (unint64_t)(unsigned __int16)(v41 - v39 + 1) << 32;
                uint64_t v36 = v39 << 16;
                uint64_t v37 = v40;
              }
            }
          }
          else
          {
LABEL_87:
            unint64_t v38 = 0;
          }
        }
LABEL_88:
        unint64_t v43 = v36 | v38 | v37 | v34;
        unint64_t v5 = v43 >> 16;
        uint64_t v6 = WORD2(v43);
        unint64_t v7 = HIWORD(v38);
        LODWORD(v2) = v43;
LABEL_162:
        id v83 = 0;
        unint64_t v44 = *(TSTLayout **)(a1 + 40);
        unint64_t v45 = (v6 << 32) | (v7 << 48) | v2 & 0xFF000000 | ((unint64_t)v5 << 16) | (unsigned __int16)v43;
        CGFloat v46 = *(double *)(a1 + 64);
        CGFloat v47 = *(double *)(a1 + 72);
        unint64_t v48 = &v83;
LABEL_163:
        AlignedStrokeFramePathForunint64_t Range = TSTLayoutGetAlignedStrokeFramePathForRange(v44, v45, 0, v48, v46, v47);
        long long v76 = *(_OWORD *)(a1 + 96);
        v82[0] = *(_OWORD *)(a1 + 80);
        v82[1] = v76;
        v82[2] = *(_OWORD *)(a1 + 112);
        [(TSDBezierPath *)AlignedStrokeFramePathForRange transformUsingAffineTransform:v82];
        long long v77 = *(_OWORD *)(a1 + 96);
        v81[0] = *(_OWORD *)(a1 + 80);
        v81[1] = v77;
        v81[2] = *(_OWORD *)(a1 + 112);
        uint64_t result = [v83 transformUsingAffineTransform:v81];
        if (AlignedStrokeFramePathForRange)
        {
          uint64_t v78 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t result = *(void *)(v78 + 40);
          if (result)
          {
            uint64_t result = [(id)result uniteWithBezierPath:AlignedStrokeFramePathForRange];
            *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
          }
          else
          {
            *(void *)(v78 + 40) = AlignedStrokeFramePathForRange;
          }
        }
        if (v83)
        {
          uint64_t v79 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t result = *(void *)(v79 + 40);
          if (result)
          {
            uint64_t result = objc_msgSend((id)result, "uniteWithBezierPath:");
            *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
          }
          else
          {
            *(void *)(v79 + 40) = v83;
          }
        }
        break;
      default:
LABEL_161:
        LOWORD(v43) = v2;
        goto LABEL_162;
    }
  }
  return result;
}

- (void)invalidateTableNameVisibility
{
  self->mTableNameVisibilityIsValid = 0;
}

- (void)validateTableNameVisibility
{
  if (!self->mTableNameVisibilityIsValid)
  {
    BOOL mTableNameVisible = self->mTableNameVisible;
    if (TSTMasterLayoutGetTableNameEnabled((uint64_t)[(TSTLayout *)self masterLayout])) {
      BOOL v4 = [(TSTLayoutHint *)[(TSTLayout *)self layoutHint] partitionPosition] & 1;
    }
    else {
      LODWORD(v4) = 0;
    }
    self->BOOL mTableNameVisible = v4;
    if (mTableNameVisible != v4)
    {
      [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] invalidateTableOffsets];
      [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] invalidateCoordinates];
    }
    self->mTableNameVisibilityIsValid = 1;
  }
}

- (BOOL)isBeingManipulated
{
  v4.receiver = self;
  v4.super_class = (Class)TSTLayout;
  return [(TSDLayout *)&v4 isBeingManipulated]
      || [(TSTMasterLayout *)[(TSTLayout *)self masterLayout] inDynamicLayoutMode]
      || [(TSTMasterLayout *)[(TSTLayout *)self masterLayout] dynamicRepResize];
}

- (void)p_updateCachedStyleInformationFromCellID:(id)a3
{
  CellStyleAtCellID = (void *)TSTTableGetCellStyleAtCellID((uint64_t *)[(TSTLayout *)self tableModel], *(_DWORD *)&a3, 0);
  if (CellStyleAtCellID
    || (CellStyleAtCellID = (void *)TSTTableCellStyleForCellWithEmptyStyleAtCellID((uint64_t *)[(TSTLayout *)self tableModel], *(_DWORD *)&a3, 0)) != 0)
  {
    uint64_t v6 = (void *)[CellStyleAtCellID valueForProperty:904];
    if (v6)
    {
      unint64_t v7 = v6;
      if (([v6 isEqual:0] & 1) == 0)
      {
        [v7 topInset];
        CGFloat v9 = v8;
        [v7 leftInset];
        double v11 = v10;
        [v7 bottomInset];
        CGFloat v13 = v12;
        [v7 rightInset];
        self->mCachedPaddingForEditingCell.top = v9;
        self->mCachedPaddingForEditingCell.left = v11;
        self->mCachedPaddingForEditingCell.bottom = v13;
        self->mCachedPaddingForEditingCell.right = v14;
        self->mCachedPaddingForEditingCell.left = TSTMasterLayoutApplyMinimumHorizontalInset(v11);
        self->mCachedPaddingForEditingCell.right = TSTMasterLayoutApplyMinimumHorizontalInset(self->mCachedPaddingForEditingCell.right);
      }
    }
    self->mCachedVerticalAlignmentForEditingCell = 0;
    unsigned int v15 = [CellStyleAtCellID intValueForProperty:903];
    if ((v15 & 0x7FFFFFFF) != 0) {
      self->mCachedVerticalAlignmentForEditingCell = v15;
    }
  }
}

- (id)children
{
  v4.receiver = self;
  v4.super_class = (Class)TSTLayout;
  id result = [(TSDAbstractLayout *)&v4 children];
  if (self->mContainedTextEditingLayout)
  {
    if (result) {
      return (id)objc_msgSend(result, "arrayByAddingObject:");
    }
    else {
      return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:");
    }
  }
  return result;
}

- (void)updateChildrenFromInfo
{
  if (self->mContainedTextEditingLayout)
  {
LABEL_10:
    if (!TSTLayoutExtendedPartitionRangeIntersectsCellRange(self, [(TSTEditingState *)[(TSTLayout *)self editingState] editingCellRange]))[(TSTLayout *)self removeContainedTextEditingLayout]; {
    goto LABEL_12;
    }
  }
  if (!objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration"), "supportsContainedTextEditing")|| -[TSTEditingState editingMode](-[TSTLayout editingState](self, "editingState"), "editingMode") != 6|| -[TSTEditingState editingCellInProxy](-[TSTLayout editingState](self, "editingState"), "editingCellInProxy")|| !TSTLayoutExtendedPartitionRangeIntersectsCellRange(self, -[TSTEditingState editingCellRange](-[TSTLayout editingState](self, "editingState"), "editingCellRange"))|| !objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "isCanvasInteractive")|| !-[TSTMasterLayout containedTextEditor](-[TSTLayout masterLayout](self, "masterLayout"), "containedTextEditor"))
  {
    if (!self->mContainedTextEditingLayout) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  [(TSTLayout *)self setupContainedTextEditingLayout:[(TSTEditingState *)[(TSTLayout *)self editingState] editingCellID]];
LABEL_12:
  mContainedTextEditingLayout = self->mContainedTextEditingLayout;
  if (mContainedTextEditingLayout)
  {
    [(TSWPLayout *)mContainedTextEditingLayout performSelector:a2];
    [(TSTLayout *)self p_updateCachedStyleInformationFromCellID:[(TSTEditingState *)[(TSTLayout *)self editingState] editingCellID]];
  }
LABEL_14:
  v5.receiver = self;
  v5.super_class = (Class)TSTLayout;
  [(TSWPTextHostLayout *)&v5 updateChildrenFromInfo];
}

- (TSWPLayout)containedTextEditingLayout
{
  return self->mContainedTextEditingLayout;
}

- (void)removeContainedTextEditingLayout
{
  self->mCachedPaddingForEditingCell = *(UIEdgeInsets *)TSDEdgeInsetsInvalid;
  self->mCachedVerticalAlignmentForEditingCell = 0;
  CGSize v3 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->mComputedEditingCellContentFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->mComputedEditingCellContentFrame.size = v3;
  if ((TSTLayout *)[(TSDAbstractLayout *)self->mContainedTextEditingLayout parent] == self) {
    [(TSDLayout *)self->mContainedTextEditingLayout setParent:0];
  }
  objc_opt_class();
  [(TSDLayout *)self->mContainedTextEditingLayout info];
  [(id)TSUDynamicCast() removeObserver:self];

  self->mContainedTextEditingLayout = 0;
  [(TSTMasterLayout *)[(TSTLayout *)self masterLayout] removeDynamicLayoutEndIfNecessary:self];
  mEditingSpillingTextunint64_t Range = self->mEditingSpillingTextRange;
  if (self->mEditingSpillingTextRange.origin.row != 0xFFFF
    && (*(void *)&mEditingSpillingTextRange & 0xFF0000) != 0xFF0000
    && HIWORD(*(unint64_t *)&mEditingSpillingTextRange) != 0
    && (*(void *)&mEditingSpillingTextRange & 0xFFFF00000000) != 0)
  {
    unint64_t v7 = +[TSTChangeDescriptor changeDescriptorWithType:strokeRange:](TSTChangeDescriptor, "changeDescriptorWithType:strokeRange:", 27);
    [(TSTMasterLayout *)[(TSTLayout *)self masterLayout] addChangeDescriptor:v7];
    +[TSKBroadcast asyncNotificationWithAccessController:changeNotifier:changeKind:details:changeSource:](TSKBroadcast, "asyncNotificationWithAccessController:changeNotifier:changeKind:details:changeSource:", objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "accessController"), objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "changeNotifier"), 1, v7, -[TSTLayout tableInfo](self, "tableInfo"));
  }
  self->mEditingSpillingTextunint64_t Range = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  self->mSpillingTextSize = (CGSize)*MEMORY[0x263F001B0];
}

- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5
{
}

- (void)layoutSearchForSpellingErrorsWithHitBlock:(id)a3 stop:(BOOL *)a4
{
}

- (void)layoutSearchForAnnotationWithHitBlock:(id)a3
{
}

- (id)childSearchTargets
{
  return 0;
}

- (CGPoint)calculatePointFromSearchReference:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (BOOL)orderedBefore:(id)a3
{
  $CA3468F20078D5D2DB35E78E73CA60DA v4 = [(TSTLayoutHint *)[(TSTLayout *)self layoutHint] cellRange];
  unsigned __int8 var1 = v4.var0.var1;
  unsigned int var0 = v4.var0.var0;
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "layoutHint"), "cellRange");
  BOOL v9 = var0 == (unsigned __int16)v7 && var1 < BYTE2(v7);
  return var0 < (unsigned __int16)v7 || v9;
}

- (CGRect)rectForSelection:(id)a3
{
  objc_opt_class();
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "cellRegion"), "boundingCellRange");
  AlignedStrokeFrameForunint64_t Range = TSTLayoutGetAlignedStrokeFrameForRange(self, v4);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] space];
  CGFloat v13 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderColumnsSpace];
  CGFloat v14 = [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] frozenHeaderRowsSpace];
  double FrozenHeadersTabOffset = TSTLayoutGetFrozenHeadersTabOffset(self);
  double v17 = v16;
  double v18 = FrozenHeadersTabOffset + 0.0;
  if (!TSTLayoutSpaceIntersectsCellRange((BOOL)v13, v4) && TSTLayoutGetFrozenHeaderColumnsEnabled(self)) {
    double v18 = v18 + TSTLayoutSpaceGetHeaderColumnsWidth(v12);
  }
  double v19 = v17 + 0.0;
  if (!TSTLayoutSpaceIntersectsCellRange((BOOL)v14, v4) && TSTLayoutGetFrozenHeaderRowsEnabled(self))
  {
    double v20 = v19 + TSTLayoutSpaceGetHeaderRowsHeight(v12);
    TSTLayoutGetTableNameHeight((uint64_t)self);
    double v19 = v20 + v21;
  }
  double v22 = AlignedStrokeFrameForRange - v18;
  double v23 = v7 - v19;
  double v24 = v9 + v18;
  double v25 = v11 + v19;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (CGRect)rectForPresentingAnnotationPopoverForSelection:(id)a3
{
  objc_opt_class();
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "cellRegion"), "boundingCellRange");

  AlignedStrokeFrameForunint64_t Range = TSTLayoutGetAlignedStrokeFrameForRange(self, v4);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = AlignedStrokeFrameForRange;
  return result;
}

- (CGSize)adjustedInsets
{
  float64x2_t v2 = *(float64x2_t *)&self->mCachedPaddingForEditingCell.top;
  __asm { FMOV            V1.2D, #-1.0 }
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v2, _Q1), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->mCachedPaddingForEditingCell.bottom, _Q1))))) & 1) != 0&& self->mContainedTextEditingLayout)
  {
    double left = self->mCachedPaddingForEditingCell.left;
  }
  else
  {
    [(TSTMasterLayout *)[(TSTLayout *)self masterLayout] paddingForCellID:0];
    v2.f64[0] = v9;
    double left = v10;
  }
  double v11 = v2.f64[0];
  result.double height = v11;
  result.double width = left;
  return result;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  return 1;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  [(TSTLayout *)self adjustedInsets];
  double v9 = 10.0;
  if (a4 <= 10.0) {
    double v9 = a4;
  }
  if (v8 >= (a4 - v9) * 0.5) {
    double v10 = (a4 - v9) * 0.5;
  }
  else {
    double v10 = v8;
  }
  double v11 = a4 + v10 * -2.0;
  if (v11 < v9)
  {
    double v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSTLayout positionForColumnIndex:bodyWidth:outWidth:outGap:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayout.mm"), 4102, @"created an undersized column");
  }
  if (a5) {
    *a5 = v11;
  }
  return v10;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (BOOL)textIsVertical
{
  return 0;
}

- (CGRect)computedEditingCellContentFrame
{
  double v3 = (CGPoint *)MEMORY[0x263F001A8];
  p_mComputedEditingCellContentFrame = &self->mComputedEditingCellContentFrame;
  if (CGRectEqualToRect(*MEMORY[0x263F001A8], self->mComputedEditingCellContentFrame))
  {
    $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v5 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[(TSTEditingState *)[(TSTTableInfo *)[(TSTLayout *)self tableInfo] editingState] editingCellID];
    char v76 = 0;
    uint64_t v6 = v5;
    int v7 = objc_msgSend((id)TSTTableGetCellStyleAtCellID((uint64_t *)-[TSTLayout tableModel](self, "tableModel"), *(_DWORD *)&v5, &v76), "intValueForProperty:", 896);
    self->mContainedTextEditorTextWraps = v7 != 0x80000000 && v7 != 0;
    unsigned int v8 = objc_msgSend(-[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](-[TSTEditingState editingStorage](-[TSTLayout editingState](self, "editingState"), "editingStorage"), "paragraphStyleAtCharIndex:effectiveRange:", 0, 0), "intValueForProperty:", 86);
    self->uint64_t mContainedTextEditorParagraphAlignment = v8;
    if (v8 == 4) {
      self->uint64_t mContainedTextEditorParagraphAlignment = [(TSTLayout *)self p_naturalAlignmentForCellID:*(unsigned int *)&v5];
    }
    $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v74 = v5;
    unint64_t var0 = v5.var0;
    char v75 = 1;
    unint64_t v10 = TSTTableMergeRangeAtCellID((uint64_t)[(TSTLayout *)self tableModel], *(_DWORD *)&v5);
    unint64_t v11 = v10;
    if ((_WORD)v10 == 0xFFFF
      || (v10 & 0xFF0000) == 0xFF0000
      || (unint64_t v12 = HIWORD(v10)) == 0
      || (v10 & 0xFFFF00000000) == 0)
    {
      if (BYTE2(v6) == 255) {
        uint64_t v23 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v23 = BYTE2(v6);
      }
      if (var0 == 0xFFFF) {
        uint64_t v24 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v24 = var0;
      }
      unint64_t v25 = v23 | (v24 << 32);
      double v26 = TSTTableHeightOfRow((uint64_t)[(TSTLayout *)self tableModel], (unsigned __int16)v6, &v75);
      uint64_t v27 = v25;
    }
    else
    {
      $CA3468F20078D5D2DB35E78E73CA60DA v13 = [(TSTLayoutHint *)[(TSTLayout *)self layoutHint] cellRange];
      BOOL v14 = (~*(_DWORD *)&v13.var0 & 0xFF0000) != 0 && v13.var0.var0 != 0xFFFF;
      if (v14)
      {
        unint64_t v15 = 0;
        uint64_t v16 = 16711680;
        uint64_t v17 = 0xFFFFLL;
        unint64_t v18 = 0;
        if (HIWORD(*(unint64_t *)&v13) && (*(void *)&v13 & 0xFFFF00000000) != 0)
        {
          uint64_t v17 = 0;
          unsigned int var1 = v13.var0.var1;
          if (BYTE2(v11) > v13.var0.var1) {
            unsigned int var1 = BYTE2(v11);
          }
          if ((unsigned __int16)v11 <= v13.var0.var0) {
            uint64_t v20 = v13.var0.var0;
          }
          else {
            uint64_t v20 = (unsigned __int16)v11;
          }
          if ((BYTE4(v11) + BYTE2(v11) - 1) >= (LOBYTE(v13.var1.var0)
                                                                                               + v13.var0.var1
                                                                                               - 1))
            unsigned int v21 = (LOBYTE(v13.var1.var0) + v13.var0.var1 - 1);
          else {
            unsigned int v21 = (BYTE4(v11) + BYTE2(v11) - 1);
          }
          if ((unsigned __int16)(v11 + v12 - 1) >= (unsigned __int16)(v13.var0.var0 + v13.var1.var1 - 1)) {
            unsigned int v22 = (unsigned __int16)(v13.var0.var0 + v13.var1.var1 - 1);
          }
          else {
            unsigned int v22 = (unsigned __int16)(v11 + v12 - 1);
          }
          uint64_t v16 = 0;
          unint64_t v15 = 0;
          unint64_t v18 = 0;
          if (v20 <= v22 && var1 <= v21)
          {
            unint64_t v18 = ((unint64_t)(v22 - v20) << 48) + 0x1000000000000;
            unint64_t v15 = (unint64_t)(unsigned __int16)(v21 - var1 + 1) << 32;
            uint64_t v16 = var1 << 16;
            uint64_t v17 = v20;
          }
        }
      }
      else
      {
        unint64_t v15 = 0;
        unint64_t v18 = 0;
        uint64_t v16 = 16711680;
        uint64_t v17 = 0xFFFFLL;
      }
      unint64_t v28 = v16 | v18 | v17 | v15;
      if ((_WORD)v28 != 0xFFFF && (v28 & 0xFF0000) != 0xFF0000 && HIWORD(v28) && (v28 & 0xFFFF00000000) != 0)
      {
        unint64_t v29 = 0;
        if (v14)
        {
          uint64_t v30 = 16711680;
          uint64_t v31 = 0xFFFFLL;
          unint64_t v32 = 0;
          if (HIWORD(*(unint64_t *)&v13) && (*(void *)&v13 & 0xFFFF00000000) != 0)
          {
            uint64_t v31 = 0;
            unsigned int v33 = v13.var0.var1;
            if (BYTE2(v11) > v13.var0.var1) {
              unsigned int v33 = BYTE2(v11);
            }
            if ((unsigned __int16)v11 <= v13.var0.var0) {
              uint64_t v34 = v13.var0.var0;
            }
            else {
              uint64_t v34 = (unsigned __int16)v11;
            }
            if ((BYTE4(v11) + BYTE2(v11) - 1) >= (LOBYTE(v13.var1.var0)
                                                                                                 + v13.var0.var1
                                                                                                 - 1))
              unsigned int v35 = (LOBYTE(v13.var1.var0) + v13.var0.var1 - 1);
            else {
              unsigned int v35 = (BYTE4(v11) + BYTE2(v11) - 1);
            }
            unsigned __int16 v36 = v13.var0.var0 + v13.var1.var1 - 1;
            unsigned int v37 = v36;
            if ((unsigned __int16)(v11 + v12 - 1) < v36) {
              unsigned int v37 = (unsigned __int16)(v11 + v12 - 1);
            }
            uint64_t v30 = 0;
            unint64_t v29 = 0;
            unint64_t v32 = 0;
            if (v34 <= v37 && v33 <= v35)
            {
              unint64_t v32 = ((unint64_t)(v37 - v34) << 48) + 0x1000000000000;
              unint64_t v29 = (unint64_t)(unsigned __int16)(v35 - v33 + 1) << 32;
              uint64_t v30 = v33 << 16;
              uint64_t v31 = v34;
            }
          }
        }
        else
        {
          unint64_t v32 = 0;
          uint64_t v30 = 16711680;
          uint64_t v31 = 0xFFFFLL;
        }
        unint64_t v11 = v30 | v32 | v31 | v29;
      }
      if (BYTE2(v11) == 255) {
        unsigned int v38 = -1;
      }
      else {
        unsigned int v38 = BYTE2(v11);
      }
      uint64_t v39 = WORD2(v11) + v38 - 1;
      if (!WORD2(v11)) {
        uint64_t v39 = 0xFFFFFFFFLL;
      }
      if ((unsigned __int16)v11 == 0xFFFF) {
        uint64_t v40 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v40 = (unsigned __int16)v11;
      }
      unint64_t v25 = v38 | ((unint64_t)v40 << 32);
      uint64_t v41 = ((v11 >> 16) & 0xFFFF00000000) + (v40 << 32) - 0x100000000;
      if (((v11 >> 16) & 0xFFFF00000000) == 0) {
        uint64_t v41 = 0xFFFFFFFF00000000;
      }
      uint64_t v27 = v39 | v41;
      double v26 = TSTTableHeightOfRow((uint64_t)[(TSTLayout *)self tableModel], (unsigned __int16)(v11 + HIWORD(v11) - 1), &v75);
    }
    int v42 = [(TSTMasterLayout *)[(TSTLayout *)self masterLayout] tableRowsBehavior];
    self->mContainedTextEditorSpills = 0;
    if (self->mContainedTextEditorTextWraps)
    {
      if (v42 == 3) {
        self->mContainedTextEditorSpills = v75 ^ 1;
      }
      ArbitraryRectAcrossSpacesForGridunint64_t Range = TSTLayoutGetArbitraryRectAcrossSpacesForGridRange(self, v25, v27, (uint64_t)&__block_literal_global_67);
    }
    else
    {
      self->mContainedTextEditorSpills = 1;
      unint64_t RangeForHint = TSTMasterLayoutGetRangeForHint((uint64_t)[(TSTLayout *)self masterLayout], [(TSTLayout *)self layoutHint]);
      if ((_WORD)v11 == 0xFFFF || (v11 & 0xFF0000) == 0xFF0000 || !HIWORD(v11) || (v11 & 0xFFFF00000000) == 0) {
        unint64_t v11 = v6 | 0x1000100000000;
      }
      uint64_t mContainedTextEditorParagraphAlignment = self->mContainedTextEditorParagraphAlignment;
      if ([(TSTLayout *)self layoutDirectionIsLeftToRight])
      {
        switch((int)mContainedTextEditorParagraphAlignment)
        {
          case 0:
          case 3:
            goto LABEL_84;
          case 1:
            goto LABEL_113;
          case 2:
            goto LABEL_86;
          default:
            goto LABEL_85;
        }
      }
      switch((int)mContainedTextEditorParagraphAlignment)
      {
        case 0:
LABEL_113:
          unint64_t v50 = v11;
          unint64_t v49 = var0;
          goto LABEL_114;
        case 1:
        case 3:
LABEL_84:
          unint64_t v49 = (RangeForHint + ((RangeForHint >> 16) & 0xFF0000) + 16711680) & 0xFF0000 | var0;
          unint64_t v50 = v11;
LABEL_114:
          unint64_t v67 = TSTCellRangeUnionCellID(v50, v49);
          ArbitraryRectAcrossSpacesForGridunint64_t Range = TSTLayoutGetContentFrameForRange(self, v67);
          break;
        case 2:
          goto LABEL_86;
        default:
LABEL_85:
          unsigned int v73 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v51 = [NSString stringWithUTF8String:"-[TSTLayout computedEditingCellContentFrame]"];
          objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", v51, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayout.mm"), 4237, @"Unexpected cell alignment: %d", mContainedTextEditorParagraphAlignment);
LABEL_86:
          unsigned int v52 = *(_DWORD *)&v74 & 0xFF000000;
          LOBYTE(v6) = BYTE2(v6);
          unsigned __int8 v53 = BYTE2(v6);
          if (BYTE2(RangeForHint) != BYTE2(v6))
          {
            int v54 = TSTMasterLayoutPreviousVisibleColumn([(TSTLayout *)self masterLayout], (BYTE2(v6) - 1));
            if (v54 == 255) {
              unsigned __int8 v53 = BYTE2(v6);
            }
            else {
              unsigned __int8 v53 = v54;
            }
          }
          unint64_t v55 = TSTCellRangeUnionCellID(var0 | 0x1000100000000, v52 | (v53 << 16) | var0);
          unsigned int v56 = HIDWORD(RangeForHint) + WORD1(RangeForHint) + 255;
          if (v56 != BYTE2(v6))
          {
            int VisibleColumn = TSTMasterLayoutNextVisibleColumn([(TSTLayout *)self masterLayout], (BYTE2(v6) + 1));
            if (VisibleColumn != 255) {
              LOBYTE(v6) = VisibleColumn;
            }
          }
          unint64_t v58 = TSTCellRangeUnionCellID(v52 | (v6 << 16) | var0 | 0x1000100000000, var0 & 0xFF00FFFF | (v56 << 16));
          unint64_t v59 = v58;
          if ((v11 & 0xFFFF00000000) == 0
            || (!HIWORD(v55)
             || (v55 & 0xFFFF00000000) == 0
             || (unsigned __int16)v11 > (unsigned __int16)v55
             || (unsigned __int16)(v11 + HIWORD(v11) - 1) < (unsigned __int16)v55
             || BYTE2(v55) < BYTE2(v11)
             || (unsigned int v60 = (BYTE4(v11) + BYTE2(v11) - 1), v60 < BYTE2(v55))
             || v60 < (BYTE4(v55) + BYTE2(v55) - 1)
             || (double v61 = 0.0,
                 (unsigned __int16)(v11 + HIWORD(v11) - 1) < (unsigned __int16)(v55 + HIWORD(v55) - 1)))
            && (!HIWORD(v58)
             || (v58 & 0xFFFF00000000) == 0
             || (unsigned __int16)v11 > (unsigned __int16)v58
             || (unsigned __int16)(v11 + HIWORD(v11) - 1) < (unsigned __int16)v58
             || BYTE2(v58) < BYTE2(v11)
             || (unsigned int v62 = (BYTE4(v11) + BYTE2(v11) - 1), v62 < BYTE2(v58))
             || v62 < (BYTE4(v58) + BYTE2(v58) - 1)
             || (double v61 = 0.0,
                 (unsigned __int16)(v11 + HIWORD(v11) - 1) < (unsigned __int16)(v58 + HIWORD(v58) - 1))))
          {
            TSTLayoutGetContentFrameForRange(self, v55);
            double v61 = v63;
            TSTLayoutGetContentFrameForRange(self, v59);
            if (v61 >= v64) {
              double v61 = v64;
            }
          }
          ContentFrameForunint64_t Range = TSTLayoutGetContentFrameForRange(self, v11);
          double v45 = v66 + v61 * 2.0;
          ArbitraryRectAcrossSpacesForGridunint64_t Range = ContentFrameForRange - v61;
          break;
      }
    }
    p_mComputedEditingCellContentFrame->origin.double x = ArbitraryRectAcrossSpacesForGridRange;
    p_mComputedEditingCellContentFrame->origin.double y = v44;
    p_mComputedEditingCellContentFrame->size.double width = v45;
    p_mComputedEditingCellContentFrame->size.double height = v46;
    if (CGRectIsNull(*(CGRect *)&ArbitraryRectAcrossSpacesForGridRange))
    {
      CGSize v68 = (CGSize)v3[1];
      p_mComputedEditingCellContentFrame->origin = *v3;
      p_mComputedEditingCellContentFrame->size = v68;
    }
  }
  double x = p_mComputedEditingCellContentFrame->origin.x;
  double y = p_mComputedEditingCellContentFrame->origin.y;
  double width = p_mComputedEditingCellContentFrame->size.width;
  double height = p_mComputedEditingCellContentFrame->size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unsigned)p_naturalAlignmentForCellID:(id)a3
{
  __int16 v5 = ~a3.var0;
  unsigned int v6 = [(TSTLayout *)self p_defaultAlignmentForTableWritingDirection];
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v7 = a3;
  if (!v5 || (*(void *)&a3.var0 & 0xFF0000) == 0xFF0000)
  {
    unsigned int v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSTLayout p_naturalAlignmentForCellID:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayout.mm"), 4301, @"Contained text editing layout but invalid editing cell ID?");
  }
  if ((*(_DWORD *)&a3 & 0xFFFFFF) == ([(TSTEditingState *)[(TSTLayout *)self editingState] editingCellID] & 0xFFFFFF))int v10 = [(TSWPStorage *)[(TSTEditingState *)[(TSTLayout *)self editingState] editingStorage] writingDirectionForParagraphAtCharIndex:0]; {
  else
  }
    int v10 = [(TSSStyle *)TSTTableGetTextStyleAtCellID((uint64_t *)[(TSTLayout *)self tableModel], *(_DWORD *)&a3, 0) intValueForProperty:44];
  if (v10 != -1) {
    unsigned int v6 = v10 == 1;
  }
  unint64_t v11 = objc_alloc_init(TSTCell);
  if (!TSTCellAtCellID((uint64_t)[(TSTLayout *)self tableModel], *(_DWORD *)&v7, v11) && v11)
  {
    unsigned int v12 = *((unsigned __int8 *)&v11->mPrivate + 1);
    BOOL v13 = v12 > 7;
    int v14 = (1 << v12) & 0xA4;
    BOOL v15 = v13 || v14 == 0;
    if (!v15
      && [(TSSStyle *)TSTTableGetTextStyleAtCellID((uint64_t *)[(TSTLayout *)self tableModel], *(_DWORD *)&v7, 0) intValueForProperty:86] == 4)
    {
      return 1;
    }
  }
  return v6;
}

- (unsigned)naturalAlignmentForTextLayout:(id)a3
{
  if (self->mContainedTextEditingLayout != a3
    || ![(TSWPStorage *)[(TSTEditingState *)[(TSTLayout *)self editingState] editingStorage] canBeStoredInAStringValueCell])
  {
    return 4;
  }
  uint64_t v4 = [(TSTEditingState *)[(TSTLayout *)self editingState] editingCellID];

  return [(TSTLayout *)self p_naturalAlignmentForCellID:v4];
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  if (self->mContainedTextEditorTextWraps) {
    return 1;
  }
  else {
    return 37;
  }
}

- (double)maxAutoGrowWidthForTextLayout:(id)a3
{
  [(TSTLayout *)self computedEditingCellContentFrame];
  return v3;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  if (self->mContainedTextEditingLayout == a3) {
    return self->mCachedVerticalAlignmentForEditingCell;
  }
  else {
    return 0;
  }
}

- (void)invalidateForAutosizingTextLayout:(id)a3
{
  TSTLayoutInvalidateCell(self, [(TSTEditingState *)[(TSTTableInfo *)[(TSTLayout *)self tableInfo] editingState] editingCellID]);
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->mComputedEditingCellContentFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->mComputedEditingCellContentFrame.size = v4;
}

- (CGSize)p_rangeUpAndLeftOfIntersectionRangeOfGridRange:(id)a3
{
  $85CD2974BE96D4886BB301820D1C36C2 var1 = a3.var1;
  $85CD2974BE96D4886BB301820D1C36C2 var0 = a3.var0;
  uint64_t v27 = 0;
  unint64_t v28 = &v27;
  uint64_t v29 = 0x4012000000;
  uint64_t v30 = __Block_byref_object_copy__98;
  uint64_t v31 = __Block_byref_object_dispose__99;
  unint64_t v32 = &unk_22389B221;
  uint64_t v33 = -1;
  uint64_t v34 = -1;
  BOOL v6 = [(TSTMasterLayout *)[(TSTLayout *)self masterLayout] isDynamicallyRepressingFrozenHeaders];
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v7 = [(TSTLayout *)self spaceBundle];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __60__TSTLayout_p_rangeUpAndLeftOfIntersectionRangeOfGridRange___block_invoke;
  v25[3] = &unk_2646B3BB0;
  BOOL v26 = v6;
  v25[5] = var0;
  v25[6] = var1;
  v25[4] = &v27;
  [(TSTLayoutSpaceBundle *)v7 performActionOnEachLayoutSpace:v25];
  uint64_t v8 = v28[6];
  uint64_t v9 = [(TSTLayout *)self masterLayout];
  unint64_t v10 = (((((v8 - (*(void *)&var0 & 0xFFFFFFFF00000000)) & 0xFFFFFFFF00000000) + *(void *)&var0) & 0xFFFFFFFF00000000)
       - 0x100000000) >> 32;
  if (((v8 - (*(void *)&var0 & 0xFFFFFFFF00000000)) & 0xFFFFFFFF00000000) == 0) {
    LODWORD(v10) = -1;
  }
  unsigned int v11 = v8 - 1;
  if (v8 == var0.var0) {
    unsigned int v11 = -1;
  }
  BOOL v13 = v10 < var0.var1 || v10 == -1 || var0.var1 == -1;
  unint64_t v14 = (((unint64_t)(v10 - var0.var1) << 32) + 0x100000000) >> 16;
  if (v13) {
    LODWORD(v14) = 0;
  }
  BOOL v16 = v11 < var0.var0 || v11 == -1 || var0.var0 == -1;
  int v17 = (v11 - LOBYTE(var0.var0) + 1);
  if (v16) {
    int v17 = 0;
  }
  uint64_t v18 = v14 | v17;
  unint64_t v19 = (unint64_t)LOBYTE(var0.var0) << 16;
  if (var0.var0 == -1) {
    unint64_t v19 = 16711680;
  }
  double v20 = TSTMasterLayoutContentSizeForCellRange(v9, v19 & 0xFFFFFFFFFFFF0000 | LOWORD(var0.var1) | (v18 << 32), 1);
  double v22 = v21;
  _Block_object_dispose(&v27, 8);
  double v23 = v20;
  double v24 = v22;
  result.double height = v24;
  result.double width = v23;
  return result;
}

uint64_t __60__TSTLayout_p_rangeUpAndLeftOfIntersectionRangeOfGridRange___block_invoke(uint64_t a1, _DWORD *a2)
{
  if ([a2 isFrozen] && *(unsigned char *)(a1 + 56)) {
    return 0;
  }
  uint64_t result = (uint64_t)TSTLayoutSpaceIntersectsGridRange(a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
  if (result)
  {
    uint64_t v5 = TSTLayoutSpaceIntersectionGridRange(a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    *(void *)(v6 + 48) = v5;
    *(void *)(v6 + 56) = v7;
    return 1;
  }
  return result;
}

- (BOOL)p_layoutWhollyContainsGridRange:(id)a3
{
  $85CD2974BE96D4886BB301820D1C36C2 var1 = a3.var1;
  $85CD2974BE96D4886BB301820D1C36C2 var0 = a3.var0;
  uint64_t v11 = 0;
  unsigned int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  BOOL v6 = [(TSTMasterLayout *)[(TSTLayout *)self masterLayout] isDynamicallyRepressingFrozenHeaders];
  uint64_t v7 = [(TSTLayout *)self spaceBundle];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__TSTLayout_p_layoutWhollyContainsGridRange___block_invoke;
  v9[3] = &unk_2646B3BB0;
  BOOL v10 = v6;
  v9[5] = var0;
  v9[6] = var1;
  v9[4] = &v11;
  [(TSTLayoutSpaceBundle *)v7 performActionOnEachLayoutSpace:v9];
  LOBYTE(var0.var0) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return var0.var0;
}

uint64_t __45__TSTLayout_p_layoutWhollyContainsGridRange___block_invoke(uint64_t a1, _DWORD *a2)
{
  if ([a2 isFrozen] && *(unsigned char *)(a1 + 56)
    || !TSTLayoutSpaceIntersectsGridRange(a2, *(void *)(a1 + 40), *(void *)(a1 + 48)))
  {
    return 0;
  }
  uint64_t v4 = TSTLayoutSpaceIntersectionGridRange(a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
  unsigned int v8 = *(_DWORD *)(a1 + 40);
  unsigned int v7 = *(_DWORD *)(a1 + 44);
  unsigned int v10 = *(_DWORD *)(a1 + 48);
  unsigned int v9 = *(_DWORD *)(a1 + 52);
  BOOL v15 = v4 == -1 || v5 == -1 || v4 > v5 || HIDWORD(v4) == -1 || v6 == -1 || HIDWORD(v4) > v6;
  if (v15 && (v8 == -1 || v10 == -1 || v8 > v10 || v7 == -1 || v9 == -1 || v7 > v9)
    || (uint64_t v16 = 0, v4 == __PAIR64__(v7, v8)) && v5 == v10 && v6 == v9)
  {
    uint64_t v16 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return v16;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  ArbitraryRectAcrossSpacesForGridunint64_t Range = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  int v12 = objc_msgSend((id)TSTTableGetCellStyleAtCellID((uint64_t *)-[TSTLayout tableModel](self, "tableModel"), -[TSTEditingState editingCellID](-[TSTLayout editingState](self, "editingState"), "editingCellID"), 0), "intValueForProperty:", 896);
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v13 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[(TSTEditingState *)[(TSTLayout *)self editingState] editingCellID];
  unint64_t v14 = TSTTableMergeRangeAtCellID((uint64_t)[(TSTLayout *)self tableModel], *(_DWORD *)&v13);
  BOOL v15 = self->mContainedTextEditingLayout != a3 || (unsigned __int16)~v13.var0 == 0;
  if (!v15 && (*(void *)&v13.var0 & 0xFF0000) != 0xFF0000)
  {
    if ((v12 & 0x7FFFFFFF) != 0 && !self->mContainedTextEditorSpills)
    {
      $5CFCD363C99B2F51819B67AD7AD2E060 v24 = ($5CFCD363C99B2F51819B67AD7AD2E060)v14;
      if ((_WORD)v14 == 0xFFFF || (v14 & 0xFF0000) == 0xFF0000 || !HIWORD(v14) || (v14 & 0xFFFF00000000) == 0)
      {
        $5CFCD363C99B2F51819B67AD7AD2E060 v24 = ($5CFCD363C99B2F51819B67AD7AD2E060)v13;
        LODWORD(v25) = 65537;
      }
      else
      {
        unint64_t v25 = HIDWORD(v14);
      }
      if (v24.column == 255) {
        unsigned int column = -1;
      }
      else {
        unsigned int column = v24.column;
      }
      if ((_WORD)v25) {
        uint64_t v27 = (unsigned __int16)v25 + column - 1;
      }
      else {
        uint64_t v27 = 0xFFFFFFFFLL;
      }
      if (v24.row == 0xFFFF) {
        uint64_t row = 0xFFFFFFFFLL;
      }
      else {
        uint64_t row = v24.row;
      }
      unint64_t v29 = column | ((unint64_t)row << 32);
      unint64_t v30 = (((unint64_t)v25 << 16) & 0xFFFF00000000) + (row << 32) - 0x100000000;
      if ((((unint64_t)v25 << 16) & 0xFFFF00000000) == 0) {
        unint64_t v30 = 0xFFFFFFFF00000000;
      }
      uint64_t v31 = v27 | v30;
      [(TSTLayout *)self validate];
      [(TSTLayout *)self computedEditingCellContentFrame];
      double v33 = v32;
      double v35 = v34;
      if (-[TSTLayout p_layoutWhollyContainsGridRange:](self, "p_layoutWhollyContainsGridRange:", v29, v31))
      {
        ArbitraryRectAcrossSpacesForGridunint64_t Range = TSTLayoutGetArbitraryRectAcrossSpacesForGridRange(self, v29, v31, (uint64_t)&__block_literal_global_67);
        double v9 = v36;
        double v10 = v37;
        double v11 = v38;
      }
      else
      {
        -[TSTLayout p_rangeUpAndLeftOfIntersectionRangeOfGridRange:](self, "p_rangeUpAndLeftOfIntersectionRangeOfGridRange:", v29, v31);
        ArbitraryRectAcrossSpacesForGridunint64_t Range = v33 - v39;
        double v9 = v35 - v40;
        double v10 = TSTMasterLayoutContentSizeForCellRange([(TSTLayout *)self masterLayout], *(unsigned int *)&v24 | ((unint64_t)v25 << 32), 1);
        double v11 = v41;
      }
      self->mEditingSpillingTextRange.origin = v24;
      self->mEditingSpillingTextRange.size = ($AD264490EA47AD084B10A83F4B3C584F)v25;
      if (-[TSTLayout p_layoutWhollyContainsGridRange:](self, "p_layoutWhollyContainsGridRange:", v29, v29))
      {
        if ([(TSTLayout *)self layoutDirectionIsLeftToRight]) {
          unint64_t v42 = v29;
        }
        else {
          unint64_t v42 = v27 | (row << 32);
        }
        ArbitraryRectAcrossSpacesForGridunint64_t Range = TSTLayoutGetArbitraryRectAcrossSpacesForGridRange(self, v42, v42, (uint64_t)&__block_literal_global_72);
        double v9 = v43;
      }
    }
    else
    {
      -[TSTLayout p_computeSpillingTextFrameForLayout:textSize:editingSpillRange:](self, "p_computeSpillingTextFrameForLayout:textSize:editingSpillRange:", a3, 0, width, height);
      ArbitraryRectAcrossSpacesForGridunint64_t Range = v20;
      double v9 = v21;
      double v10 = v22;
      double v11 = v23;
    }
  }
  double v16 = ArbitraryRectAcrossSpacesForGridRange;
  double v17 = v9;
  double v18 = v10;
  double v19 = v11;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)p_computeSpillingTextFrameForLayout:(id)a3 textSize:(CGSize)a4 editingSpillRange:(id *)a5
{
  double height = a4.height;
  double width = a4.width;
  [(TSTLayout *)self computedEditingCellContentFrame];
  if (width >= v9)
  {
    [(TSTLayout *)self computedEditingCellContentFrame];
    double width = v10;
  }
  self->mSpillingTextSize.double width = width;
  self->mSpillingTextSize.double height = height;
  BOOL v11 = [(TSTLayout *)self layoutDirectionIsLeftToRight];
  uint64_t RangeForHint = TSTMasterLayoutGetRangeForHint((uint64_t)[(TSTLayout *)self masterLayout], [(TSTLayout *)self layoutHint]);
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v12 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[(TSTEditingState *)[(TSTLayout *)self editingState] editingCellID];
  unsigned int mContainedTextEditorParagraphAlignment = self->mContainedTextEditorParagraphAlignment;
  if (mContainedTextEditorParagraphAlignment - 3 <= 1) {
    unsigned int mContainedTextEditorParagraphAlignment = [(TSTLayout *)self p_naturalAlignmentForCellID:*(unsigned int *)&v12];
  }
  unint64_t v14 = TSTTableMergeRangeAtCellID((uint64_t)[(TSTLayout *)self tableModel], *(_DWORD *)&v12);
  unint64_t v15 = v14;
  if ((_WORD)v14 == 0xFFFF || (v14 & 0xFF0000) == 0xFF0000 || !HIWORD(v14) || (v14 & 0xFFFF00000000) == 0) {
    unint64_t v15 = *(unsigned int *)&v12 | 0x1000100000000;
  }
  ContentFrameForunint64_t Range = TSTLayoutGetContentFrameForRange(self, v15);
  double v20 = ContentFrameForRange;
  double v21 = v17;
  unsigned int v132 = mContainedTextEditorParagraphAlignment;
  BOOL v133 = v11;
  uint64_t v130 = v12;
  double v127 = width;
  if (self->mContainedTextEditorTextWraps)
  {
    double v22 = height + v17;
    double v23 = ContentFrameForRange;
    goto LABEL_20;
  }
  if (mContainedTextEditorParagraphAlignment == 2)
  {
    double v23 = ContentFrameForRange + (width + v18) * 0.5;
    double v20 = ContentFrameForRange + (v18 - width) * 0.5;
LABEL_18:
    double v22 = height + v21;
    goto LABEL_20;
  }
  if (mContainedTextEditorParagraphAlignment == 1)
  {
    double v23 = ContentFrameForRange;
    double v20 = CGRectGetMaxX(*(CGRect *)&ContentFrameForRange) - width;
    goto LABEL_18;
  }
  if (mContainedTextEditorParagraphAlignment)
  {
    uint64_t v5 = [MEMORY[0x263F7C7F0] currentHandler];
    unint64_t v24 = v15;
    uint64_t v25 = [NSString stringWithUTF8String:"-[TSTLayout p_computeSpillingTextFrameForLayout:textSize:editingSpillRange:]"];
    uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayout.mm"];
    uint64_t v27 = v25;
    unint64_t v15 = v24;
    [(id)v5 handleFailureInFunction:v27 file:v26 lineNumber:4601 description:@"Unexpected alignment (natural or justified) when calculating spill frame."];
    double v23 = *MEMORY[0x263F00148];
    double v22 = *(double *)(MEMORY[0x263F00148] + 8);
    double v20 = *MEMORY[0x263F00148];
    double v21 = v22;
  }
  else
  {
    CGAffineTransformMakeTranslation(&v135, width, height);
    double v23 = v135.tx + v21 * v135.c + v135.a * v20;
    double v22 = v135.ty + v21 * v135.d + v135.b * v20;
  }
LABEL_20:
  int var0 = v12.var0;
  unsigned int v29 = *(_DWORD *)&v12 & 0xFF000000;
  unsigned int v30 = HIWORD(*(unsigned int *)&v12);
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v131 = v12;
  int v122 = !v11;
  if (!self->mContainedTextEditorTextWraps && v11)
  {
    int var1 = v12.var1;
    unsigned int v32 = HIWORD(*(unsigned int *)&v12);
    if (v12.var1 > BYTE2(RangeForHint))
    {
      int v33 = v12.var1 << 16;
      LOBYTE(v32) = v12.var1;
      while (1)
      {
        uint64_t v5 = v5 & 0xFFFFFFFF00000000 | v33 | v29 | v12.var0;
        unint64_t v34 = TSTCellRangeUnionCellID(v15, v5);
        v142.origin.double x = TSTLayoutGetContentFrameForRange(self, v34);
        v136.double x = v20;
        v136.double y = v21;
        if (CGRectContainsPoint(v142, v136)) {
          break;
        }
        LOBYTE(v32) = v32 - 1;
        v33 -= 0x10000;
        if (v32 <= BYTE2(RangeForHint))
        {
          LOBYTE(v32) = BYTE2(RangeForHint);
          break;
        }
      }
    }
    unsigned int v35 = HIDWORD(RangeForHint) + WORD1(RangeForHint) + 255;
    if (v12.var1 < (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1))
    {
      int v36 = v12.var1 << 16;
      while (1)
      {
        uint64_t v5 = v5 & 0xFFFFFFFF00000000 | v36 | v29 | var0;
        unint64_t v37 = TSTCellRangeUnionCellID(v15, v5);
        v143.origin.double x = TSTLayoutGetContentFrameForRange(self, v37);
        if (CGRectGetMaxX(v143) >= v23) {
          break;
        }
        ++var1;
        v36 += 0x10000;
        if (var1 == (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1)) {
          goto LABEL_48;
        }
      }
      LOBYTE(v35) = var1;
LABEL_48:
      $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v12 = v131;
      goto LABEL_49;
    }
    goto LABEL_46;
  }
  char v38 = self->mContainedTextEditorTextWraps || v11;
  unsigned int v35 = HIWORD(*(unsigned int *)&v12);
  unsigned int v32 = HIWORD(*(unsigned int *)&v12);
  if ((v38 & 1) == 0)
  {
    unsigned int v32 = HIWORD(*(unsigned int *)&v12);
    if ((BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1) > v12.var1)
    {
      LOBYTE(v32) = v12.var1;
      int v39 = v12.var1 << 16;
      while (1)
      {
        uint64_t v5 = v5 & 0xFFFFFFFF00000000 | v39 | v29 | v12.var0;
        unint64_t v40 = TSTCellRangeUnionCellID(v15, v5);
        v144.origin.double x = TSTLayoutGetContentFrameForRange(self, v40);
        v137.double x = v20;
        v137.double y = v21;
        if (CGRectContainsPoint(v144, v137)) {
          break;
        }
        LOBYTE(v32) = v32 + 1;
        v39 += 0x10000;
        if ((BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1) == v32)
        {
          LOBYTE(v32) = BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1;
          break;
        }
      }
    }
    LOBYTE(v35) = v12.var1;
    if (v12.var1 > BYTE2(RangeForHint))
    {
      int v41 = v12.var1 << 16;
      while (1)
      {
        uint64_t v5 = v5 & 0xFFFFFFFF00000000 | v41 | v29 | var0;
        unint64_t v42 = TSTCellRangeUnionCellID(v15, v5);
        v145.origin.double x = TSTLayoutGetContentFrameForRange(self, v42);
        if (CGRectGetMaxX(v145) >= v23) {
          goto LABEL_48;
        }
        LOBYTE(v35) = v35 - 1;
        v41 -= 0x10000;
        if (v35 <= BYTE2(RangeForHint))
        {
          LOBYTE(v35) = BYTE2(RangeForHint);
          goto LABEL_48;
        }
      }
    }
LABEL_46:
    LOBYTE(v35) = v12.var1;
  }
LABEL_49:
  unint64_t v123 = v15;
  char v124 = v30;
  uint64_t v43 = v29 | (v32 << 16) | var0;
  if ((unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1) <= v12.var0)
  {
    LOWORD(v44) = v12.var0;
  }
  else
  {
    int v44 = var0;
    while (1)
    {
      unint64_t v45 = TSTCellRangeUnionCellID(v43 | 0x1000100000000, (v35 << 16) | v44 | v29);
      v146.origin.double x = TSTLayoutGetContentFrameForRange(self, v45);
      v146.size.double height = ceil(v46);
      if (CGRectGetMaxY(v146) >= v22) {
        break;
      }
      if ((unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1) == (unsigned __int16)++v44)
      {
        LOWORD(v44) = RangeForHint + HIWORD(RangeForHint) - 1;
        break;
      }
    }
    $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v12 = v131;
  }
  if (((unsigned __int16)v29 | (unsigned __int16)var0) == -1 || (v43 & 0xFF0000) == 0xFF0000)
  {
    v128 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v47 = [NSString stringWithUTF8String:"-[TSTLayout p_computeSpillingTextFrameForLayout:textSize:editingSpillRange:]"];
    objc_msgSend(v128, "handleFailureInFunction:file:lineNumber:description:", v47, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayout.mm"), 4660, @"Unable to determine upper left cell ID for spilling text.");
  }
  unsigned __int16 v48 = v12.var0;
  unsigned int v129 = HIBYTE(*(unsigned int *)&v12);
  mEditingSpillingTextunint64_t Range = (unint64_t)self->mEditingSpillingTextRange;
  if (self->mEditingSpillingTextRange.origin.row == 0xFFFF
    || ((mEditingSpillingTextRange & 0xFF0000) != 0xFF0000 ? (BOOL v50 = HIWORD(mEditingSpillingTextRange) == 0) : (BOOL v50 = 1),
        !v50 ? (BOOL v51 = (mEditingSpillingTextRange & 0xFFFF00000000) == 0) : (BOOL v51 = 1),
        v51))
  {
    mEditingSpillingTextunint64_t Range = v130 | 0x1000100000000;
    BOOL v52 = v133;
  }
  else
  {
    BOOL v52 = v133;
  }
  double v53 = TSTLayoutGetContentFrameForRange(self, mEditingSpillingTextRange);
  CGFloat v57 = v53;
  CGFloat v58 = v54;
  CGFloat v59 = v55;
  CGFloat v60 = v56;
  if (v132) {
    BOOL v61 = v52;
  }
  else {
    BOOL v61 = 0;
  }
  if (v61 && v32 > BYTE2(RangeForHint) && v127 > CGRectGetWidth(*(CGRect *)&v53))
  {
    uint64_t v62 = var0 & 0xFF00FFFF | ((v32 - 1) << 16);
    v147.origin.double x = TSTLayoutGetStrokeFrameForRange(self, v62 | 0x1000100000000);
    v138.double x = v20;
    v138.double y = v21;
    BOOL v63 = CGRectContainsPoint(v147, v138);
    BOOL v64 = !v63;
    if (v63) {
      v12.int var0 = v62;
    }
    v131.int var0 = v12.var0;
    if (v63) {
      LOBYTE(v32) = v32 - 1;
    }
    unsigned int v65 = v129;
  }
  else
  {
    char v66 = v133;
    if (v132 == 1) {
      char v66 = 1;
    }
    unsigned int v65 = HIBYTE(*(unsigned int *)&v12);
    if ((v66 & 1) != 0
      || v32 >= (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1)
      || (v148.origin.double x = v57,
          v148.origin.double y = v58,
          v148.size.double width = v59,
          v148.size.double height = v60,
          v127 <= CGRectGetWidth(v148)))
    {
      unsigned int v126 = HIBYTE(*(unsigned int *)&v12);
      goto LABEL_94;
    }
    uint64_t v67 = var0 & 0xFF00FFFF | ((v32 + 1) << 16);
    v149.origin.double x = TSTLayoutGetStrokeFrameForRange(self, v67 | 0x1000100000000);
    v139.double x = v20;
    v139.double y = v21;
    BOOL v68 = CGRectContainsPoint(v149, v139);
    BOOL v64 = !v68;
    if (v68) {
      unsigned __int16 v48 = v67;
    }
    v131.int var0 = v48;
    if (v68) {
      LOBYTE(v32) = v32 + 1;
    }
  }
  if (v64) {
    unsigned int v69 = v65;
  }
  else {
    unsigned int v69 = 0;
  }
  unsigned int v126 = v69;
LABEL_94:
  if (v35 >= (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1)) {
    unsigned int v70 = (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1);
  }
  else {
    unsigned int v70 = v35;
  }
  if ((_WORD)v44 == 0xFFFF) {
    unsigned __int16 v71 = RangeForHint + HIWORD(RangeForHint) - 1;
  }
  else {
    unsigned __int16 v71 = v44;
  }
  unsigned int v72 = v71;
  int v73 = v71 | (v70 << 16) | v29;
  BOOL v74 = v133;
  if (((unsigned __int16)v72 | (unsigned __int16)v29) == -1 || (*(void *)&v73 & 0xFF0000) == 0xFF0000)
  {
    uint64_t v75 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v76 = [NSString stringWithUTF8String:"-[TSTLayout p_computeSpillingTextFrameForLayout:textSize:editingSpillRange:]"];
    uint64_t v77 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayout.mm"];
    uint64_t v78 = (void *)v75;
    uint64_t v79 = v76;
    unsigned int v65 = v129;
    BOOL v74 = v133;
    [v78 handleFailureInFunction:v79 file:v77 lineNumber:4693 description:@"Unable to determine a bottom right corner cell ID for spill text that is being edited"];
  }
  BOOL v80 = v132 != 1 && v74;
  if (v80
    && v35 < (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1)
    && (v150.origin.double x = v57,
        v150.origin.double y = v58,
        v150.size.double width = v59,
        v150.size.double height = v60,
        v127 > CGRectGetWidth(v150)))
  {
    v151.origin.double x = TSTLayoutGetStrokeFrameForRange(self, v72 & 0xFF00FFFF | ((v70 + 1) << 16) | 0x1000100000000);
    v140.double x = v23;
    v140.double y = v22;
    if (CGRectContainsPoint(v151, v140))
    {
      LOBYTE(v70) = v70 + 1;
      unsigned int v65 = 0;
    }
    unsigned __int16 v81 = v131.var0;
  }
  else
  {
    int v82 = v122;
    if (!v132) {
      int v82 = 0;
    }
    if (v82 == 1)
    {
      char v83 = BYTE4(RangeForHint) - 1;
      if (!v74) {
        char v83 = 0;
      }
      unsigned __int16 v81 = v131.var0;
      if (v70 > (v83 + BYTE2(RangeForHint)))
      {
        v152.origin.double x = v57;
        v152.origin.double y = v58;
        v152.size.double width = v59;
        v152.size.double height = v60;
        if (v127 > CGRectGetWidth(v152))
        {
          v153.origin.double x = TSTLayoutGetStrokeFrameForRange(self, v72 & 0xFF00FFFF | ((v70 - 1) << 16) | 0x1000100000000);
          v141.double x = v23;
          v141.double y = v22;
          if (CGRectContainsPoint(v153, v141))
          {
            LOBYTE(v70) = v70 - 1;
            unsigned int v65 = 0;
          }
        }
      }
    }
    else
    {
      unsigned __int16 v81 = v131.var0;
    }
  }
  unint64_t v84 = TSTCellRangeUnionCellID((v32 << 16) | (v126 << 24) | v81 | 0x1000100000000, (v70 << 16) | (v65 << 24) | v72);
  if (v72 > (unsigned __int16)(v123 + HIWORD(v123) - 1)) {
    self->mCachedVerticalAlignmentForEditingCell = 0;
  }
  unint64_t v85 = TSTTableMergeRangeAtCellID((uint64_t)[(TSTLayout *)self tableModel], v130);
  if ((_WORD)v85 == 0xFFFF || (v85 & 0xFF0000) == 0xFF0000 || (unint64_t v86 = HIWORD(v85)) == 0 || (v85 & 0xFFFF00000000) == 0)
  {
    unint64_t v85 = v130 | 0x1000100000000;
    double v87 = a5;
  }
  else
  {
    double v87 = a5;
    if ((_WORD)v84 == 0xFFFF || (v84 & 0xFF0000) == 0xFF0000 || !HIWORD(v84) || (v84 & 0xFFFF00000000) == 0)
    {
      unint64_t v89 = v85 >> 16;
      int v92 = v85 & 0xFF000000;
      unint64_t v88 = HIDWORD(v85);
      LOWORD(v84) = v85;
    }
    else
    {
      unint64_t v88 = HIDWORD(v84);
      if ((unsigned __int16)v84 <= (unsigned __int16)v85
        && (unsigned __int16)(v84 + HIWORD(v84) - 1) >= (unsigned __int16)v85
        && (unint64_t v89 = v84 >> 16, BYTE2(v85) >= BYTE2(v84))
        && (unsigned int v90 = (BYTE4(v84) + BYTE2(v84) - 1), v90 >= BYTE2(v85))
        && v90 >= (BYTE4(v85) + BYTE2(v85) - 1)
        && (unsigned __int16)(v84 + HIWORD(v84) - 1) >= (unsigned __int16)(v85 + HIWORD(v85) - 1))
      {
        int v92 = v84 & 0xFF000000;
        unint64_t v86 = HIWORD(v84);
      }
      else if ((unsigned __int16)v85 <= (unsigned __int16)v84 {
             && (unsigned __int16)(v85 + HIWORD(v85) - 1) >= (unsigned __int16)v84
      }
             && (unint64_t v89 = v85 >> 16, BYTE2(v84) >= BYTE2(v85))
             && (unsigned int v91 = (BYTE4(v85) + BYTE2(v85) - 1), v91 >= BYTE2(v84))
             && v91 >= (BYTE4(v84) + BYTE2(v84) - 1)
             && (unsigned __int16)(v85 + HIWORD(v85) - 1) >= (unsigned __int16)(v84 + HIWORD(v84) - 1))
      {
        int v92 = v85 & 0xFF000000;
        LOWORD(v84) = v85;
        unint64_t v88 = HIDWORD(v85);
      }
      else
      {
        int v92 = 0;
        if (BYTE2(v84) >= BYTE2(v85)) {
          LOWORD(v89) = BYTE2(v85);
        }
        else {
          LOWORD(v89) = BYTE2(v84);
        }
        __int16 v93 = v84;
        if ((unsigned __int16)v84 >= (unsigned __int16)v85) {
          __int16 v93 = v85;
        }
        __int16 v94 = v84 + HIWORD(v84);
        LOWORD(v84) = v93;
        LODWORD(v88) = (v88 + BYTE2(v84) - 1);
        if (v88 <= (BYTE4(v85) + BYTE2(v85) - 1)) {
          LOWORD(v88) = (BYTE4(v85) + BYTE2(v85) - 1);
        }
        unsigned int v95 = (unsigned __int16)(v94 - 1);
        if (v95 <= (unsigned __int16)(v85 + HIWORD(v85) - 1)) {
          LOWORD(v95) = v85 + HIWORD(v85) - 1;
        }
        LOWORD(v88) = v88 - v89 + 1;
        unint64_t v86 = (unsigned __int16)(v95 - v93 + 1);
      }
    }
    unint64_t v84 = ((unint64_t)(unsigned __int16)v88 << 32) | (v86 << 48) | v92 & 0xFF000000 | ((unint64_t)v89 << 16) | (unsigned __int16)v84;
  }
  unint64_t v96 = v84 >> 16;
  unint64_t v97 = HIDWORD(v84);
  if (v132) {
    unsigned __int16 v98 = WORD2(v84);
  }
  else {
    unsigned __int16 v98 = (BYTE4(v85) + BYTE2(v85) - 1) - BYTE2(v84) + 1;
  }
  if (v132 == 1) {
    char v99 = v124;
  }
  else {
    char v99 = BYTE2(v84);
  }
  if (v132 == 1)
  {
    unsigned __int16 v98 = WORD2(v84);
    __int16 v100 = (BYTE4(v85) + BYTE2(v85) - 1) - BYTE2(v84) + 1;
  }
  else
  {
    __int16 v100 = WORD2(v84);
  }
  if (v132) {
    LOWORD(v97) = v100;
  }
  else {
    LOBYTE(v96) = v124;
  }
  if (v74)
  {
    unsigned __int16 v101 = v97;
  }
  else
  {
    LOBYTE(v96) = v99;
    unsigned __int16 v101 = v98;
  }
  unint64_t v102 = v84 & 0xFF00FFFF | (v96 << 16);
  if (v87)
  {
    v87->int var0 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)v102;
    v87->var1.int var0 = v101;
    v87->var1.int var1 = HIWORD(v84);
  }
  double v103 = TSTLayoutGetContentFrameForRange(self, v84 & 0xFFFF000000000000 | ((unint64_t)v101 << 32) | v102);
  CGFloat v105 = v104;
  CGFloat v107 = v106;
  CGFloat v109 = v108;
  AlignedContentFrameForunint64_t Range = TSTLayoutGetAlignedContentFrameForRange(self, v102 | 0x1000100000000);
  CGFloat v114 = v113;
  if (!v74)
  {
    CGFloat v115 = v110;
    CGFloat v116 = v111;
    v154.origin.double x = v103;
    v154.origin.double y = v105;
    v154.size.double width = v107;
    v154.size.double height = v109;
    double MaxX = CGRectGetMaxX(v154);
    v155.origin.double x = AlignedContentFrameForRange;
    v155.origin.double y = v114;
    v155.size.double width = v115;
    v155.size.double height = v116;
    AlignedContentFrameForunint64_t Range = v103 - (MaxX - CGRectGetMaxX(v155));
  }
  self->mEditingSpillingTextRange.origin = ($5CFCD363C99B2F51819B67AD7AD2E060)v102;
  self->mEditingSpillingTextRange.size.numberOfColumns = v101;
  self->mEditingSpillingTextRange.size.numberOfRows = HIWORD(v84);
  double v118 = AlignedContentFrameForRange;
  double v119 = v114;
  double v120 = v107;
  double v121 = v109;
  result.size.double height = v121;
  result.size.double width = v120;
  result.origin.double y = v119;
  result.origin.double x = v118;
  return result;
}

- (id)dependentLayouts
{
  v5.receiver = self;
  v5.super_class = (Class)TSTLayout;
  id v3 = [(TSDLayout *)&v5 dependentLayouts];
  if (self->mContainedTextEditingLayout)
  {
    id v3 = (id)[MEMORY[0x263EFF980] arrayWithArray:v3];
    [v3 addObject:self->mContainedTextEditingLayout];
  }
  return v3;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "array", a3);
}

- (Class)repClassForTextLayout:(id)a3
{
  return 0;
}

- (CGRect)maskRectForTextLayout:(id)a3
{
  double v3 = *MEMORY[0x263F001A0];
  double v4 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A0] + 24);
  if (self->mContainedTextEditingLayout == a3)
  {
    unint64_t v8 = TSTTableMergeRangeAtCellID((uint64_t)[(TSTLayout *)self tableModel], [(TSTTableInfo *)[(TSTLayout *)self tableInfo] editingCellID]);
    unint64_t v9 = v8;
    if ((_WORD)v8 != 0xFFFF)
    {
      BOOL v10 = (v8 & 0xFF0000) == 0xFF0000 || HIWORD(v8) == 0;
      if (!v10 && (v8 & 0xFFFF00000000) != 0)
      {
        if (BYTE2(v8) == 255) {
          unsigned int v12 = -1;
        }
        else {
          unsigned int v12 = BYTE2(v8);
        }
        unsigned int v13 = (unsigned __int16)v8;
        if (WORD2(v8)) {
          uint64_t v14 = WORD2(v8) + v12 - 1;
        }
        else {
          uint64_t v14 = 0xFFFFFFFFLL;
        }
        [(TSTLayout *)self validate];
        unint64_t v15 = v12 | ((unint64_t)v13 << 32);
        unint64_t v16 = ((v9 >> 16) & 0xFFFF00000000) + ((unint64_t)v13 << 32) - 0x100000000;
        if (((v9 >> 16) & 0xFFFF00000000) == 0) {
          unint64_t v16 = 0xFFFFFFFF00000000;
        }
        uint64_t v17 = v14 | v16;
        -[TSTLayout p_rangeUpAndLeftOfIntersectionRangeOfGridRange:](self, "p_rangeUpAndLeftOfIntersectionRangeOfGridRange:", v15, v14 | v16);
        double v19 = v18;
        double v21 = v20;
        if (!-[TSTLayout p_layoutWhollyContainsGridRange:](self, "p_layoutWhollyContainsGridRange:", v15, v17))
        {
          TSTLayoutGetFrameForGridRange(self, v15, v17);
          double v5 = v22;
          double v6 = v23;
          double v3 = v19;
          double v4 = v21;
        }
      }
    }
  }
  double v24 = v3;
  double v25 = v4;
  double v26 = v5;
  double v27 = v6;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (CGSize)initialTextSize
{
  double v2 = 8.0;
  double v3 = 8.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)p_processChange:(id)a3 forChangeSource:(id)a4 actions:(id)a5
{
  int v9 = [a3 kind];
  if (objc_msgSend(a4, "isEqual:", -[TSTLayout tableInfo](self, "tableInfo")) && v9 == 1)
  {
    objc_opt_class();
    [a3 details];
    BOOL v10 = (void *)TSUDynamicCast();
    if (v10) {
      int v11 = [v10 changeDescriptor];
    }
    else {
      int v11 = -1;
    }
    [a3 details];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v12 = 40;
    }
    else {
      int v12 = v11;
    }
    switch(v12)
    {
      case 0:
      case 17:
      case 18:
      case 27:
      case 37:
      case 38:
        [a5 setLayoutInvalidate:1];
        return;
      case 1:
      case 2:
      case 4:
      case 5:
      case 13:
      case 14:
      case 19:
      case 20:
      case 21:
      case 22:
      case 24:
      case 25:
      case 26:
      case 28:
      case 33:
      case 36:
        goto LABEL_10;
      case 3:
      case 23:
        [a5 setLayoutInvalidate:1];
        goto LABEL_11;
      case 8:
      case 9:
      case 10:
      case 34:
      case 35:
        [a5 setLayoutInvalidate:1];
        [a5 setLayoutInvalidateSize:1];
        [a5 setLayoutSpacesInvalidateCoordinates:1];
        [a5 setLayoutInvalidateProvider:1];
        return;
      case 29:
      case 40:
        [a5 setLayoutInvalidateProvider:1];
LABEL_10:
        [a5 setLayoutInvalidate:1];
        [a5 setLayoutInvalidateSize:1];
        goto LABEL_11;
      case 31:
        [a5 setLayoutInvalidate:1];
        [a5 setLayoutInvalidateSize:1];
        [a5 setLayoutInvalidateTableNameVisibility:1];
LABEL_11:
        [a5 setLayoutSpacesInvalidateCoordinates:1];
        [a5 setLayoutSpacesInvalidateTableOffsets:1];
        break;
      default:
        return;
    }
  }
}

- (void)p_processChangeActions:(id)a3
{
  if ([a3 layoutInvalidate]) {
    [(TSTLayout *)self invalidate];
  }
  if ([a3 layoutInvalidateProvider])
  {
    CGSize v5 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    self->mComputedEditingCellContentFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
    self->mComputedEditingCellContentFrame.size = v5;
    double v6 = [(TSTLayout *)self containedTextEditingLayout];
    if (v6) {
      [(TSDLayout *)v6 invalidateFrame];
    }
    [(TSDLayout *)self invalidateChildren];
  }
  if ([a3 layoutInvalidateSize])
  {
    if ([(TSDDrawableInfo *)[(TSTLayout *)self tableInfo] isInlineWithText]) {
      -[TSTTablePartitioner setScaleToFit:]([(TSTTableInfo *)[(TSTLayout *)self tableInfo] partitioner], "setScaleToFit:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    }
    [(TSTLayout *)self invalidateSize];
  }
  if ([a3 layoutSpacesInvalidateCoordinates]) {
    [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] invalidateCoordinates];
  }
  if ([a3 layoutSpacesInvalidateTableOffsets]) {
    [(TSTLayoutSpaceBundle *)[(TSTLayout *)self spaceBundle] invalidateTableOffsets];
  }
  if ([a3 layoutInvalidateTableNameVisibility])
  {
    [(TSTLayout *)self invalidateTableNameVisibility];
  }
}

- (void)processChanges:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TSTLayout;
  -[TSDLayout processChanges:](&v14, sel_processChanges_);
  if ([(TSTTablePartitioner *)[(TSTTableInfo *)[(TSTLayout *)self tableInfo] partitioner] scaledLayout] != self)[[(TSTTablePartitioner *)[(TSTTableInfo *)[(TSTLayout *)self tableInfo] partitioner] scaledLayout] processChanges:a3]; {
  if (!self->mProcessChangesFiltering)
  }
  {
    CGSize v5 = objc_alloc_init(TSTLayoutProcessChangesActions);
    if (a3)
    {
      if ([a3 count])
      {
        long long v12 = 0u;
        long long v13 = 0u;
        long long v10 = 0u;
        long long v11 = 0u;
        uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v11;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v11 != v8) {
                objc_enumerationMutation(a3);
              }
              [(TSTLayout *)self p_processChange:*(void *)(*((void *)&v10 + 1) + 8 * v9++) forChangeSource:[(TSDLayout *)self info] actions:v5];
            }
            while (v7 != v9);
            uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v15 count:16];
          }
          while (v7);
        }
      }
    }
    [(TSTLayout *)self p_processChangeActions:v5];
  }
}

- (int)reapCoordinatesChangedMaskForChrome
{
  int mCoordinatesChangedMaskForChrome = self->mCoordinatesChangedMaskForChrome;
  self->int mCoordinatesChangedMaskForChrome = 0;
  return mCoordinatesChangedMaskForChrome;
}

- (void)storage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6
{
  if ([a3 wpKind] == 5)
  {
    objc_msgSend(+[TSKChangeCollector threadCollector](TSKChangeCollector, "threadCollector"), "registerChange:details:forChangeSource:", 1, +[TSTChangeDescriptor changeDescriptorWithType:cellRegion:](TSTChangeDescriptor, "changeDescriptorWithType:cellRegion:", 33, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", -[TSTTableInfo editingCellID](-[TSTLayout tableInfo](self, "tableInfo"), "editingCellID") | 0x1000100000000)), -[TSTLayout tableInfo](self, "tableInfo"));
    mEditingSpillingTextunint64_t Range = self->mEditingSpillingTextRange;
    if (self->mEditingSpillingTextRange.origin.row == 0xFFFF
      || ((*(void *)&mEditingSpillingTextRange & 0xFF0000) != 0xFF0000
        ? (BOOL v10 = mEditingSpillingTextRange.size.numberOfRows == 0)
        : (BOOL v10 = 1),
          !v10 ? (BOOL v11 = (*(void *)&mEditingSpillingTextRange & 0xFFFF00000000) == 0) : (BOOL v11 = 1),
          v11))
    {
      if (a6) {
        return;
      }
    }
    else
    {
      objc_msgSend(+[TSKChangeCollector threadCollector](TSKChangeCollector, "threadCollector"), "registerChange:details:forChangeSource:", 1, +[TSTChangeDescriptor changeDescriptorWithType:strokeRange:](TSTChangeDescriptor, "changeDescriptorWithType:strokeRange:", 27), -[TSTLayout tableInfo](self, "tableInfo"));
      if (a6) {
        return;
      }
    }
    if (objc_msgSend((id)objc_msgSend(a3, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0), "intValueForProperty:", 86) != self->mContainedTextEditorParagraphAlignment)
    {
      mContainedTextEditingLayout = self->mContainedTextEditingLayout;
      [(TSTLayout *)self invalidateForAutosizingTextLayout:mContainedTextEditingLayout];
    }
  }
}

- (unsigned)p_defaultAlignmentForTableWritingDirection
{
  return ![(TSTLayout *)self p_getLayoutDirectionLeftToRight];
}

- (BOOL)p_getLayoutDirectionLeftToRight
{
  return [(TSSStyle *)[(TSTTableModel *)[(TSTLayout *)self tableModel] tableStyle] intValueForProperty:798] != 1;
}

- (BOOL)newCanvasRevealedHorizontally
{
  return self->mNewCanvasRevealedHorizontally;
}

- (void)setNewCanvasRevealedHorizontally:(BOOL)a3
{
  self->mNewCanvasRevealedHorizontalldouble y = a3;
}

- (BOOL)newCanvasRevealedVertically
{
  return self->mNewCanvasRevealedVertically;
}

- (void)setNewCanvasRevealedVertically:(BOOL)a3
{
  self->mNewCanvasRevealedVerticalldouble y = a3;
}

- (void)setContainedTextEditingLayout:(id)a3
{
}

- (UIEdgeInsets)paddingForEditingCell
{
  double top = self->mCachedPaddingForEditingCell.top;
  double left = self->mCachedPaddingForEditingCell.left;
  double bottom = self->mCachedPaddingForEditingCell.bottom;
  double right = self->mCachedPaddingForEditingCell.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (TSTLayoutSpaceBundle)spaceBundle
{
  return self->mSpaceBundle;
}

- (void)setSpaceBundle:(id)a3
{
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)editingSpillingTextRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mEditingSpillingTextRange;
}

- (BOOL)layoutDirectionIsLeftToRight
{
  return self->mLayoutDirectionIsLeftToRight;
}

- (TSTMasterLayout)masterLayout
{
  return self->mMasterLayout;
}

- (void)setMasterLayout:(id)a3
{
}

- (TSTLayoutHint)layoutHint
{
  return self->mLayoutHint;
}

- (BOOL)processChangesFiltering
{
  return self->mProcessChangesFiltering;
}

- (void)setProcessChangesFiltering:(BOOL)a3
{
  self->mProcessChangesFiltering = a3;
}

@end