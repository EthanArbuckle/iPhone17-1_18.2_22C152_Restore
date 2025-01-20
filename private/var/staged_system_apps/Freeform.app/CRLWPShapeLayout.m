@interface CRLWPShapeLayout
- (BOOL)alwaysStartsNewTarget;
- (BOOL)autosizes;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)columnsAreLeftToRight;
- (BOOL)descendersCannotClip;
- (BOOL)p_shouldCreateTextLayout;
- (BOOL)resizeMayChangeAspectRatio;
- (BOOL)shrinkTextToFit;
- (BOOL)supportsInstructionalText;
- (BOOL)textLayoutShouldLayoutVertically:(id)a3;
- (BOOL)textLayoutShouldWrapAroundExternalDrawables:(id)a3;
- (CGAffineTransform)autosizedTransform;
- (CGAffineTransform)autosizedTransformForInfoGeometry:(SEL)a3;
- (CGAffineTransform)computeLayoutTransform;
- (CGPoint)autosizePositionOffset;
- (CGPoint)autosizePositionOffsetForFixedWidth:(BOOL)a3 height:(BOOL)a4;
- (CGRect)autosizedFrameFor:(id)a3 textSize:(CGSize)a4;
- (CGRect)nonAutosizedFrameFor:(id)a3;
- (CGRect)p_rectInRootForSelectionPath:(id)a3 useParagraphModeRects:(BOOL)a4;
- (CGRect)rectInRootForSelectionPath:(id)a3;
- (CGRect)rectInRootForZoomingToSelectionPath:(id)a3;
- (CGRect)rectInRootOfAutoZoomContextOfSelectionPath:(id)a3;
- (CRLFill)instructionalTextCharacterFill;
- (CRLWPPadding)layoutMargins;
- (CRLWPShapeLayout)initWithInfo:(id)a3;
- (CRLWrapSegments)interiorWrapSegments;
- (Class)repClassFor:(id)a3;
- (UIEdgeInsets)adjustedInsetsForTarget:(id)a3;
- (_TtC8Freeform11CRLWPLayout)textLayout;
- (_TtC8Freeform14CRLWPShapeItem)wpShapeInfo;
- (double)defaultFontSize;
- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (double)maxAutoGrowBlockHeightFor:(id)a3;
- (double)maxAutoGrowLineWidthFor:(id)a3;
- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 target:(id)a5 outWidth:(double *)a6 outGap:(double *)a7;
- (double)viewScaleForZoomingToSelectionPath:(id)a3 targetPointSize:(double)a4;
- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (id)bidirectionalSizeDependentLayouts;
- (id)captureDynamicInfoGeometryToBeginDynamicOperation;
- (id)childInfosForChildLayouts;
- (id)childSearchTargets;
- (id)commandsToSetFontSizesWithFontRangeToSizeDict:(id)a3 scale:(double)a4;
- (id)dependentLayouts;
- (id)dependentsOf:(id)a3;
- (id)interiorWrapSegmentsFor:(id)a3;
- (id)makeStorageRangeToFontSizeDict;
- (id)pathSource;
- (id)textWrapper;
- (int64_t)naturalAlignmentFor:(id)a3;
- (int64_t)verticalAlignmentFor:(id)a3;
- (unint64_t)autosizeFlagsFor:(id)a3;
- (unint64_t)columnCount;
- (void)createTextLayout;
- (void)createTextLayoutForScribble:(BOOL)a3;
- (void)endDynamicOperation;
- (void)invalidatePath;
- (void)invalidateSize;
- (void)p_invalidateTextLayout;
- (void)processChangedProperty:(unint64_t)a3;
- (void)setGeometry:(id)a3;
- (void)setSupportsInstructionalText:(BOOL)a3;
- (void)t_invalidateTextLayoutAfterPropertyChanged:(unint64_t)a3;
- (void)takeFreeTransformFromTracker:(id)a3;
- (void)takeSizeFromTracker:(id)a3;
- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5;
- (void)updateChildrenFromInfo;
@end

@implementation CRLWPShapeLayout

- (CRLWPShapeLayout)initWithInfo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FDC88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B92E8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FDCA8);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeLayout initWithInfo:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:25 isFatal:0 description:"Info is wrong class for layout."];
  }
  v16.receiver = self;
  v16.super_class = (Class)CRLWPShapeLayout;
  v8 = [(CRLShapeLayout *)&v16 initWithInfo:v4];
  v9 = v8;
  if (v8)
  {
    v10 = [(CRLWPShapeLayout *)v8 wpShapeInfo];
    v11 = [v10 text];

    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FDCC8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B9238();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FDCE8);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeLayout initWithInfo:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeLayout.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 27, 0, "invalid nil value for '%{public}s'", "self.wpShapeInfo.text");
    }
  }

  return v9;
}

- (_TtC8Freeform14CRLWPShapeItem)wpShapeInfo
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasLayout *)self info];
  v5 = sub_1002469D0(v3, v4);

  return (_TtC8Freeform14CRLWPShapeItem *)v5;
}

- (void)setSupportsInstructionalText:(BOOL)a3
{
  BOOL v3 = a3;
  BYTE4(self->super.mDynamicPatternOffsetsBySubpath) = a3;
  v5 = [(CRLWPShapeLayout *)self textLayout];
  v6 = v5;
  if (!v3)
  {
    v8 = [v5 storage];
    id v9 = [v8 length];

    if (v9) {
      return;
    }
    [*(id *)((char *)&self->_storageRangeToFontSizeDict + 3) removeFromParent];
    v7 = *(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3);
    *(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3) = 0;
    goto LABEL_10;
  }

  if (v6)
  {
    v10 = [(CRLWPShapeLayout *)self textLayout];
    [v10 invalidateTextLayout];
    v7 = v10;
LABEL_10:

    return;
  }

  [(CRLWPShapeLayout *)self createTextLayout];
}

- (id)childInfosForChildLayouts
{
  v8.receiver = self;
  v8.super_class = (Class)CRLWPShapeLayout;
  BOOL v3 = [(CRLCanvasLayout *)&v8 childInfosForChildLayouts];
  id v4 = [v3 mutableCopy];

  if ([(CRLWPShapeLayout *)self p_shouldCreateTextLayout]
    && *(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3))
  {
    v5 = [(CRLWPShapeLayout *)self wpShapeInfo];
    v6 = [v5 text];
    [v4 addObject:v6];
  }

  return v4;
}

- (void)updateChildrenFromInfo
{
  [(CRLWPShapeLayout *)self createTextLayout];
  v3.receiver = self;
  v3.super_class = (Class)CRLWPShapeLayout;
  [(CRLCanvasLayout *)&v3 updateChildrenFromInfo];
}

- (void)createTextLayout
{
}

- (void)createTextLayoutForScribble:(BOOL)a3
{
  objc_super v3 = (id *)((char *)&self->_storageRangeToFontSizeDict + 3);
  if (!*(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3))
  {
    BOOL v22 = a3;
    v5 = [(CRLCanvasLayout *)self layoutController];
    id v23 = [v5 canvas];

    v6 = [v23 canvasController];
    v7 = [v6 editorController];
    objc_super v8 = [v7 selectionPath];

    id v9 = [v8 mostSpecificSelectionOfClass:objc_opt_class()];
    v10 = [v8 mostSpecificSelectionOfClass:objc_opt_class()];
    BOOL v11 = 0;
    if (v10 && v9)
    {
      v12 = [v9 boardItems];
      v13 = [(CRLBoardItemLayout *)self boardItem];
      if ([v12 containsObject:v13])
      {
        id v14 = [v8 indexForSelection:v10];
        BOOL v11 = v14 > [v8 indexForSelection:v9];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    v15 = [_TtC8Freeform11CRLWPLayout alloc];
    objc_super v16 = [(CRLWPShapeLayout *)self wpShapeInfo];
    v17 = [v16 text];
    v18 = [(CRLWPLayout *)v15 initWithInfo:v17];

    if (v11
      || [(CRLWPShapeLayout *)self supportsInstructionalText]
      || [(CRLWPShapeLayout *)self autosizeFlagsFor:v18]
      || ([(CRLWPShapeLayout *)self wpShapeInfo],
          v19 = objc_claimAutoreleasedReturnValue(),
          [v19 text],
          v20 = objc_claimAutoreleasedReturnValue(),
          id v21 = [v20 length],
          v20,
          v19,
          v21)
      || v22)
    {
      if (!*v3)
      {
        objc_storeStrong(v3, v18);
        [(CRLCanvasAbstractLayout *)self insertChild:*v3 atIndex:0];
        [(CRLWPShapeLayout *)self p_invalidateTextLayout];
      }
    }
  }
}

- (BOOL)p_shouldCreateTextLayout
{
  if ([(CRLShapeLayout *)self pathIsLineSegment]) {
    return 0;
  }
  id v4 = [(CRLShapeLayout *)self shapeInfo];
  unsigned __int8 v5 = [v4 isFreehandDrawingShape];

  return v5 ^ 1;
}

- (id)dependentLayouts
{
  v11.receiver = self;
  v11.super_class = (Class)CRLWPShapeLayout;
  objc_super v3 = [(CRLCanvasLayout *)&v11 dependentLayouts];
  uint64_t v4 = [(CRLWPShapeLayout *)self textLayout];
  if (v4)
  {
    unsigned __int8 v5 = (void *)v4;
    unsigned __int8 v6 = [(CRLWPShapeLayout *)self autosizes];

    if ((v6 & 1) == 0)
    {
      if (v3)
      {
        id v7 = [v3 mutableCopy];
      }
      else
      {
        id v7 = +[NSMutableArray array];
      }
      objc_super v8 = v7;
      id v9 = [(CRLWPShapeLayout *)self textLayout];
      [v8 addObject:v9];

      objc_super v3 = v8;
    }
  }

  return v3;
}

- (CRLWrapSegments)interiorWrapSegments
{
  objc_super v3 = *(void **)(&self->_supportsInstructionalText + 2);
  if (!v3)
  {
    uint64_t v4 = [(CRLWPShapeLayout *)self wpShapeInfo];
    [v4 textInset];
    double v6 = v5;

    id v7 = [(CRLShapeLayout *)self shapeInfo];
    objc_super v8 = [v7 stroke];

    if (v8 && [v8 shouldRender])
    {
      [v8 width];
      double v6 = v9 * 0.5 + v6;
      id v10 = [v8 join];
    }
    else
    {
      id v10 = 0;
    }
    objc_super v11 = [(CRLWPShapeLayout *)self pathSource];
    v12 = [v11 interiorWrapPathForInset:v10 joinStyle:v6];

    v13 = [[CRLWrapSegments alloc] initWithPath:v12];
    id v14 = *(void **)(&self->_supportsInstructionalText + 2);
    *(void *)(&self->_supportsInstructionalText + 2) = v13;

    objc_super v3 = *(void **)(&self->_supportsInstructionalText + 2);
  }

  return (CRLWrapSegments *)v3;
}

- (id)pathSource
{
  if (*(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3)
    && [(CRLWPShapeLayout *)self autosizes])
  {
    objc_super v3 = [*(id *)((char *)&self->_storageRangeToFontSizeDict + 3) geometry];
    [v3 size];
    double v5 = v4;
    double v7 = v6;

    objc_super v8 = [(CRLShapeLayout *)self shapeInfo];
    double v9 = [v8 stroke];

    if (v9 && [v9 shouldRender])
    {
      [v9 width];
      double v5 = v5 + v10;
      [v9 width];
      double v7 = v7 + v11;
    }
    v12 = [(CRLShapeLayout *)self shapeInfo];
    v13 = [v12 pathSource];
    id v14 = [v13 copy];

    [v14 setNaturalSize:v5, v7];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLWPShapeLayout;
    id v14 = [(CRLShapeLayout *)&v16 pathSource];
  }

  return v14;
}

- (void)processChangedProperty:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLWPShapeLayout;
  -[CRLShapeLayout processChangedProperty:](&v5, "processChangedProperty:");
  if (a3 - 25 <= 1)
  {
    if ([(CRLWPShapeLayout *)self autosizes]) {
      [(CRLWPShapeLayout *)self invalidateSize];
    }
    if (a3 == 26
      && (([(CRLWPShapeLayout *)self p_shouldCreateTextLayout] ^ (*(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3) == 0)) & 1) == 0)
    {
      [(CRLCanvasLayout *)self invalidateChildren];
    }
  }
  [(CRLWPShapeLayout *)self t_invalidateTextLayoutAfterPropertyChanged:a3];
}

- (void)t_invalidateTextLayoutAfterPropertyChanged:(unint64_t)a3
{
  if (a3 - 25 < 7 || a3 == 19 || a3 == 7) {
    [(CRLWPShapeLayout *)self p_invalidateTextLayout];
  }
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  if ([(CRLWPShapeLayout *)self autosizes]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeLayout;
  return [(CRLCanvasLayout *)&v4 canAspectRatioLockBeChangedByUser];
}

- (BOOL)resizeMayChangeAspectRatio
{
  if ([(CRLWPShapeLayout *)self autosizes]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeLayout;
  return [(CRLCanvasLayout *)&v4 resizeMayChangeAspectRatio];
}

- (void)setGeometry:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CRLWPShapeLayout;
  [(CRLShapeLayout *)&v22 setGeometry:a3];
  if (*(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3)
    && [(CRLWPShapeLayout *)self autosizes])
  {
    objc_super v4 = [*(id *)((char *)&self->_storageRangeToFontSizeDict + 3) geometry];
    [v4 size];
    double v6 = v5;
    double v8 = v7;

    [(CRLShapeLayout *)self pathBounds];
    double v10 = v9;
    double v12 = v11;
    double v13 = -v9;
    double v14 = -v11;
    v15 = [(CRLShapeLayout *)self shapeInfo];
    objc_super v16 = [v15 stroke];

    if (v16)
    {
      if ([v16 shouldRender])
      {
        [v16 width];
        double v18 = v17 * 0.5;
        double v13 = v18 - v10;
        double v14 = v18 - v12;
      }
    }
    v19 = [CRLCanvasLayoutGeometry alloc];
    CGAffineTransformMakeTranslation(&v21, v13, v14);
    v20 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v19, "initWithSize:transform:", &v21, v6, v8);
    [*(id *)((char *)&self->_storageRangeToFontSizeDict + 3) setGeometry:v20];
  }
}

- (void)invalidateSize
{
  v5.receiver = self;
  v5.super_class = (Class)CRLWPShapeLayout;
  [(CRLCanvasLayout *)&v5 invalidateSize];
  if (*(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3))
  {
    unint64_t v3 = -[CRLWPShapeLayout autosizeFlagsFor:](self, "autosizeFlagsFor:");
    if (v3) {
      BOOL v4 = (v3 & 0xF) == 15;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4) {
      [(CRLWPShapeLayout *)self invalidatePath];
    }
  }
}

- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRLWPShapeLayout;
  long long v9 = *(_OWORD *)&a4->c;
  v18[0] = *(_OWORD *)&a4->a;
  v18[1] = v9;
  v18[2] = *(_OWORD *)&a4->tx;
  [(CRLShapeLayout *)&v19 transferLayoutGeometryToInfo:v8 withAdditionalTransform:v18 assertIfInDocument:v5];
  double v10 = (objc_class *)objc_opt_class();
  double v11 = sub_10024715C(v10, v8);
  if ([(CRLWPShapeLayout *)self autosizes])
  {
    [(CRLWPShapeLayout *)self autosizePositionOffset];
    double v13 = v12;
    double v14 = [v8 geometry];
    id v15 = [v14 mutableCopy];

    [v15 position];
    [v15 setPosition:sub_100064680(v16, v17, v13)];
    [v11 setGeometry:v15];
  }
}

- (CGAffineTransform)computeLayoutTransform
{
  if ([(CRLWPShapeLayout *)self autosizes])
  {
    memset(&v17, 0, sizeof(v17));
    [(CRLWPShapeLayout *)self autosizedTransform];
    BOOL v5 = [(CRLShapeLayout *)self layoutInfoGeometry];
    [v5 position];
    CGFloat v7 = v6;
    CGFloat v9 = v8;

    memset(&v16, 0, sizeof(v16));
    CGAffineTransformMakeTranslation(&t2, v7, v9);
    CGAffineTransform t1 = v17;
    CGAffineTransformConcat(&v16, &t1, &t2);
    [(CRLShapeLayout *)self pathBounds];
    *(_OWORD *)&retstr->a = 0u;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    CGAffineTransform t1 = v16;
    return CGAffineTransformTranslate(retstr, &t1, v10, v11);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLWPShapeLayout;
    return (CGAffineTransform *)[(CGAffineTransform *)&v13 computeLayoutTransform];
  }
}

- (CGAffineTransform)autosizedTransform
{
  id v5 = [(CRLShapeLayout *)self layoutInfoGeometry];
  [(CRLWPShapeLayout *)self autosizedTransformForInfoGeometry:v5];

  return result;
}

- (CGAffineTransform)autosizedTransformForInfoGeometry:(SEL)a3
{
  id v13 = a4;
  uint64_t v6 = objc_opt_class();
  CGFloat v7 = [(CRLCanvasLayout *)self info];
  double v8 = sub_1002469D0(v6, v7);

  if (v8)
  {
    [(CRLShapeLayout *)self pathBoundsWithoutStroke];
    [v8 autosizedTransformForInfoGeometry:v13 size:v9, v10];
  }
  else
  {
    long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v11;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }

  return result;
}

- (CGPoint)autosizePositionOffset
{
  [(CRLWPShapeLayout *)self autosizePositionOffsetForFixedWidth:1 height:1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)autosizePositionOffsetForFixedWidth:(BOOL)a3 height:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(CRLWPShapeLayout *)self autosizedTransform];
  [(CRLShapeLayout *)self pathBoundsWithoutStroke];
  double v8 = v7;
  double v10 = v9;
  long long v11 = [(CRLShapeLayout *)self layoutInfoGeometry];
  id v12 = [v11 mutableCopy];

  [v12 size];
  double v14 = v13;
  double v16 = v15;
  if (([v12 widthValid] & 1) == 0 && v5)
  {
    [v12 setWidthValid:1];
    double v14 = v8;
  }
  if (([v12 heightValid] & 1) == 0 && v4)
  {
    [v12 setHeightValid:1];
    double v16 = v10;
  }
  [v12 setSize:v14, v16];
  [(CRLWPShapeLayout *)self autosizedTransformForInfoGeometry:v12];
  float64x2_t v17 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, CGPointZero.y), (float64x2_t)0, CGPointZero.x));
  double v18 = sub_100064680(v17.f64[0], v17.f64[1], v17.f64[0]);
  double v20 = v19;

  double v21 = v18;
  double v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (void)invalidatePath
{
  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeLayout;
  [(CRLShapeLayout *)&v4 invalidatePath];
  [(CRLCanvasLayout *)self invalidateChildren];
  double v3 = *(void **)(&self->_supportsInstructionalText + 2);
  *(void *)(&self->_supportsInstructionalText + 2) = 0;
}

- (void)p_invalidateTextLayout
{
}

- (id)bidirectionalSizeDependentLayouts
{
  v9.receiver = self;
  v9.super_class = (Class)CRLWPShapeLayout;
  double v3 = [(CRLCanvasLayout *)&v9 bidirectionalSizeDependentLayouts];
  unint64_t v4 = [(CRLWPShapeLayout *)self autosizeFlagsFor:*(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3)];
  if ((~(_BYTE)v4 & 0xF) != 0 && v4 && *(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3) != 0)
  {
    if ([v3 count])
    {
      uint64_t v10 = *(uint64_t *)((char *)&self->_storageRangeToFontSizeDict + 3);
      uint64_t v6 = +[NSArray arrayWithObjects:&v10 count:1];
      uint64_t v7 = [v6 arrayByAddingObjectsFromArray:v3];

      double v3 = v6;
    }
    else
    {
      uint64_t v11 = *(uint64_t *)((char *)&self->_storageRangeToFontSizeDict + 3);
      uint64_t v7 = +[NSArray arrayWithObjects:&v11 count:1];
    }

    double v3 = (void *)v7;
  }

  return v3;
}

- (id)textWrapper
{
  if ([(CRLWPShapeLayout *)self autosizes])
  {
    double v2 = 0;
  }
  else
  {
    double v2 = +[CRLWPInteriorTextWrapController sharedInteriorTextWrapController];
  }

  return v2;
}

- (CGRect)rectInRootForSelectionPath:(id)a3
{
  [(CRLWPShapeLayout *)self p_rectInRootForSelectionPath:a3 useParagraphModeRects:1];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)rectInRootForZoomingToSelectionPath:(id)a3
{
  [(CRLWPShapeLayout *)self p_rectInRootForSelectionPath:a3 useParagraphModeRects:0];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)rectInRootOfAutoZoomContextOfSelectionPath:(id)a3
{
  double v3 = [(CRLCanvasAbstractLayout *)self geometryInRoot];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)viewScaleForZoomingToSelectionPath:(id)a3 targetPointSize:(double)a4
{
  id v6 = a3;
  double v7 = [v6 mostSpecificSelectionOfClass:objc_opt_class()];

  double v8 = 0.0;
  if (v7)
  {
    double v9 = [(CRLWPShapeLayout *)self makeStorageRangeToFontSizeDict];
    if ([v9 count])
    {
      double v10 = [v9 allValues];
      double v11 = [v10 firstObject];
      [v11 floatValue];
      double v8 = v12;
    }
    else
    {
      [(CRLWPShapeLayout *)self defaultFontSize];
      double v8 = v13;
    }
  }
  if (v8 <= 0.0) {
    double v14 = 0.0;
  }
  else {
    double v14 = a4 / v8;
  }
  double v15 = [(CRLCanvasLayout *)self layoutController];
  double v16 = [v15 canvas];
  [v16 viewScale];
  double v18 = v17;

  if (v18 < v14) {
    double v18 = v14;
  }

  return v18;
}

- (CGRect)p_rectInRootForSelectionPath:(id)a3 useParagraphModeRects:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(CRLCanvasAbstractLayout *)self geometryInRoot];
  [v7 frame];
  CGFloat x = v8;
  CGFloat y = v10;
  CGFloat width = v12;
  CGFloat height = v14;

  double v16 = [(CRLCanvasLayout *)self layoutController];
  double v17 = [v16 canvas];
  double v18 = [v17 canvasController];

  double v19 = [v18 modelsForSelectionPath:v6];
  uint64_t v20 = objc_opt_class();
  double v21 = [(CRLWPShapeLayout *)self textLayout];
  double v22 = [v21 storage];
  id v23 = sub_1002469D0(v20, v22);

  if (v23 && [v19 containsObject:v23])
  {
    v24 = [v6 mostSpecificSelectionOfClass:objc_opt_class()];
    if (v24)
    {
      v25 = [(CRLWPShapeLayout *)self textLayout];
      v26 = [v25 columns];
      +[CRLWPColumn rectForSelection:v24 withColumns:v26 useParagraphModeRects:v4];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;

      v43.origin.CGFloat x = v28;
      v43.origin.CGFloat y = v30;
      v43.size.CGFloat width = v32;
      v43.size.CGFloat height = v34;
      if (CGRectIsNull(v43))
      {
        CGFloat x = CGRectNull.origin.x;
        CGFloat y = CGRectNull.origin.y;
        CGFloat width = CGRectNull.size.width;
        CGFloat height = CGRectNull.size.height;
      }
      else
      {
        -[CRLCanvasAbstractLayout rectInRoot:](self, "rectInRoot:", v28, v30, v32, v34);
        CGFloat x = v35;
        CGFloat y = v36;
        CGFloat width = v37;
        CGFloat height = v38;
      }
    }
  }
  double v39 = x;
  double v40 = y;
  double v41 = width;
  double v42 = height;
  result.size.CGFloat height = v42;
  result.size.CGFloat width = v41;
  result.origin.CGFloat y = v40;
  result.origin.CGFloat x = v39;
  return result;
}

- (id)captureDynamicInfoGeometryToBeginDynamicOperation
{
  if ([(CRLWPShapeLayout *)self autosizes])
  {
    double v3 = [(CRLShapeLayout *)self layoutInfoGeometry];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLWPShapeLayout;
    double v3 = [(CRLShapeLayout *)&v5 captureDynamicInfoGeometryToBeginDynamicOperation];
  }

  return v3;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CRLWPShapeLayout;
  [(CRLShapeLayout *)&v47 takeSizeFromTracker:v4];
  objc_super v5 = [v4 knob];
  char v6 = [v5 tag];

  if (!sub_100289AF0(v6) || ![(CRLWPShapeLayout *)self autosizes]) {
    goto LABEL_49;
  }
  if ([(CRLCanvasLayout *)self isInTopLevelContainerForEditing])
  {
    if (v4)
    {
      [v4 flippedIfNecessaryTransformForLayout:self];
      goto LABEL_9;
    }
  }
  else if (v4)
  {
    [v4 transformForLayout:self];
    goto LABEL_9;
  }
  memset(&v45, 0, sizeof(v45));
LABEL_9:
  CGAffineTransform v46 = v45;
  memset(&v45, 0, sizeof(v45));
  double v7 = [(CRLCanvasLayout *)self originalPureGeometry];
  double v8 = v7;
  if (v7) {
    [v7 transform];
  }
  else {
    memset(v44, 0, sizeof(v44));
  }
  CGAffineTransform v43 = v46;
  sub_10007FC38(&v43, v44, &v45);

  CGAffineTransform v43 = v45;
  double v9 = sub_10007F808(&v43.a);
  if (v9 != 1.0 && fabs(v9 + -1.0) >= 0.000000999999997)
  {
    double v10 = [v4 rep];
    double v11 = [v10 infoForTransforming];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v13 = [(CRLCanvasLayout *)self layoutController];
      double v14 = [v13 canvas];
      double v15 = [v14 canvasController];

      double v16 = [v15 commandController];
      uint64_t v17 = *(void *)(&self->super.mOkayToSetGeometry + 3);
      if (!v17)
      {
        uint64_t v18 = [(CRLWPShapeLayout *)self makeStorageRangeToFontSizeDict];
        double v19 = *(void **)(&self->super.mOkayToSetGeometry + 3);
        *(void *)(&self->super.mOkayToSetGeometry + 3) = v18;

        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FDD08);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010B93F8();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FDD28);
          }
          uint64_t v20 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v20);
          }
          double v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeLayout takeSizeFromTracker:]");
          double v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeLayout.m"];
          +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:497 isFatal:0 description:"Resize tracker should be able to say if it is enqueueing commands in real time."];
        }
        if ((objc_opt_respondsToSelector() & 1) != 0
          && [v4 isEnqueueingCommandsInRealTime])
        {
          if (([v16 isGroupOpen] & 1) == 0)
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014FDD48);
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_1010B9370();
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014FDD68);
            }
            id v23 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_10106590C(v23);
            }
            v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeLayout takeSizeFromTracker:]");
            v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeLayout.m"];
            +[CRLAssertionHandler handleFailureInFunction:v24 file:v25 lineNumber:499 isFatal:0 description:"There should already be a command group open if we are enqueueing in real time."];
          }
        }
        else
        {
          [v16 openGroup];
          [v16 enableProgressiveEnqueuingInCurrentGroup];
          BYTE3(self->super.mDynamicPatternOffsetsBySubpath) = 1;
        }
        v26 = [(CRLCanvasLayout *)self info];
        double v27 = [v26 geometry];
        if ([v27 widthValid]) {
          unsigned __int8 v28 = [v27 heightValid];
        }
        else {
          unsigned __int8 v28 = 0;
        }
        if ([(CRLWPShapeLayout *)self autosizes] && (v28 & 1) == 0)
        {
          double v29 = [v4 rep];
          double v30 = [v29 layout];
          uint64_t v31 = [v30 finalInfoGeometryForResize];

          if (!v31)
          {
            uint64_t v31 = [v4 currentGeometryForLayout:self];
          }
          double v41 = (void *)v31;
          double v32 = [v4 rep];
          id v42 = [v32 newCommandToApplyGeometry:v31 toInfo:v26];

          double v33 = [CRLCanvasCommandSelectionBehavior alloc];
          [v15 canvasEditor];
          v35 = double v34 = v15;
          double v36 = [v34 editorController];
          double v37 = [v36 selectionPath];
          double v38 = [(CRLCanvasCommandSelectionBehavior *)v33 initWithCanvasEditor:v35 type:2 selectionPath:v37 selectionFlags:4];

          double v15 = v34;
          [v16 enqueueCommand:v42 withSelectionBehavior:v38];
        }
        uint64_t v17 = *(void *)(&self->super.mOkayToSetGeometry + 3);
      }
      double v39 = [(CRLWPShapeLayout *)self commandsToSetFontSizesWithFontRangeToSizeDict:v17 scale:v9];
      double v40 = [[_TtC8Freeform15CRLCommandGroup alloc] initWithCommands:v39];
      [v16 enqueueCommand:v40];
    }
  }
LABEL_49:
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CRLWPShapeLayout;
  [(CRLShapeLayout *)&v49 takeFreeTransformFromTracker:v4];
  if ([v4 isResizing])
  {
    if ([(CRLWPShapeLayout *)self autosizes])
    {
      long long v5 = 0uLL;
      memset(&v48[1], 0, sizeof(CGAffineTransform));
      if (v4)
      {
        [v4 resizeTransformForLayout:self];
        long long v5 = 0uLL;
      }
      *(_OWORD *)&v48[0].c = v5;
      *(_OWORD *)&v48[0].tCGFloat x = v5;
      *(_OWORD *)&v48[0].a = v5;
      char v6 = [(CRLCanvasLayout *)self originalPureGeometry];
      double v7 = v6;
      if (v6) {
        [v6 transform];
      }
      else {
        memset(v47, 0, sizeof(v47));
      }
      CGAffineTransform v46 = v48[1];
      sub_10007FC38(&v46, v47, v48);

      CGAffineTransform v46 = v48[0];
      double v9 = sub_10007F808(&v46.a);
      if (v9 != 1.0 && fabs(v9 + -1.0) >= 0.000000999999997)
      {
        double v10 = [(CRLCanvasLayout *)self layoutController];
        double v11 = [v10 canvas];

        double v12 = [v11 repForLayout:self];
        double v13 = [v12 infoForTransforming];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          double v15 = [(CRLCanvasLayout *)self layoutController];
          double v16 = [v15 canvas];
          uint64_t v17 = [v16 canvasController];

          uint64_t v18 = [v17 commandController];
          uint64_t v19 = *(void *)(&self->super.mOkayToSetGeometry + 3);
          if (!v19)
          {
            uint64_t v20 = [(CRLWPShapeLayout *)self makeStorageRangeToFontSizeDict];
            double v21 = *(void **)(&self->super.mOkayToSetGeometry + 3);
            *(void *)(&self->super.mOkayToSetGeometry + 3) = v20;

            CGAffineTransform v45 = v18;
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              +[CRLAssertionHandler _atomicIncrementAssertCount];
              v44 = v17;
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014FDD88);
              }
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                sub_1010B9508();
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014FDDA8);
              }
              double v22 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                sub_10106590C(v22);
              }
              id v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeLayout takeFreeTransformFromTracker:]");
              v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeLayout.m"];
              +[CRLAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:570 isFatal:0 description:"Resize tracker should be able to say if it is enqueueing commands in real time."];

              uint64_t v17 = v44;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0
              && [v4 isEnqueueingCommandsInRealTime])
            {
              if (([v18 isGroupOpen] & 1) == 0)
              {
                +[CRLAssertionHandler _atomicIncrementAssertCount];
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014FDDC8);
                }
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                  sub_1010B9480();
                }
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014FDDE8);
                }
                v25 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                  sub_10106590C(v25);
                }
                v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeLayout takeFreeTransformFromTracker:]");
                double v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeLayout.m"];
                +[CRLAssertionHandler handleFailureInFunction:v26 file:v27 lineNumber:572 isFatal:0 description:"There should already be a command group open if we are enqueueing in real time."];
              }
            }
            else
            {
              [v18 openGroup];
              [v18 enableProgressiveEnqueuingInCurrentGroup];
              BYTE3(self->super.mDynamicPatternOffsetsBySubpath) = 1;
            }
            unsigned __int8 v28 = [(CRLCanvasLayout *)self info];
            double v29 = [v28 geometry];
            if ([v29 widthValid]) {
              unsigned __int8 v30 = [v29 heightValid];
            }
            else {
              unsigned __int8 v30 = 0;
            }
            if ([(CRLWPShapeLayout *)self autosizes] && (v30 & 1) == 0)
            {
              uint64_t v31 = v17;
              double v32 = [v12 layout];
              uint64_t v33 = [v32 finalInfoGeometryForResize];

              if (!v33)
              {
                uint64_t v33 = [v4 currentGeometryForLayout:self];
              }
              id v42 = (void *)v33;
              id v41 = [v12 newCommandToApplyGeometry:v33 toInfo:v28];
              double v34 = [CRLCanvasCommandSelectionBehavior alloc];
              uint64_t v17 = v31;
              [v31 canvasEditor];
              double v35 = v43 = v28;
              double v36 = [v31 editorController];
              double v37 = [v36 selectionPath];
              double v38 = [(CRLCanvasCommandSelectionBehavior *)v34 initWithCanvasEditor:v35 type:2 selectionPath:v37 selectionFlags:4];

              unsigned __int8 v28 = v43;
              uint64_t v18 = v45;
              [v45 enqueueCommand:v41 withSelectionBehavior:v38];
            }
            uint64_t v19 = *(void *)(&self->super.mOkayToSetGeometry + 3);
          }
          double v39 = -[CRLWPShapeLayout commandsToSetFontSizesWithFontRangeToSizeDict:scale:](self, "commandsToSetFontSizesWithFontRangeToSizeDict:scale:", v19, v9, v41);
          double v40 = [[_TtC8Freeform15CRLCommandGroup alloc] initWithCommands:v39];
          [v18 enqueueCommand:v40];
        }
      }
    }
  }
  else
  {
    double v8 = [(CRLWPShapeLayout *)self textLayout];
    [v8 invalidatePosition];
  }
}

- (void)endDynamicOperation
{
  if (BYTE3(self->super.mDynamicPatternOffsetsBySubpath))
  {
    double v3 = [(CRLCanvasLayout *)self layoutController];
    id v4 = [v3 canvas];
    long long v5 = [v4 canvasController];
    char v6 = [v5 commandController];

    [v6 closeGroup];
    BYTE3(self->super.mDynamicPatternOffsetsBySubpath) = 0;
  }
  double v7 = *(void **)(&self->super.mOkayToSetGeometry + 3);
  *(void *)(&self->super.mOkayToSetGeometry + 3) = 0;

  v8.receiver = self;
  v8.super_class = (Class)CRLWPShapeLayout;
  [(CRLShapeLayout *)&v8 endDynamicOperation];
}

- (id)childSearchTargets
{
  double v3 = [(CRLWPShapeLayout *)self textLayout];
  unsigned __int8 v4 = [v3 isInstructional];

  if (v4)
  {
    long long v5 = &__NSArray0__struct;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLWPShapeLayout;
    long long v5 = [(CRLCanvasLayout *)&v7 childSearchTargets];
  }

  return v5;
}

- (_TtC8Freeform11CRLWPLayout)textLayout
{
  return *(_TtC8Freeform11CRLWPLayout **)((char *)&self->_storageRangeToFontSizeDict + 3);
}

- (BOOL)supportsInstructionalText
{
  return BYTE4(self->super.mDynamicPatternOffsetsBySubpath);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->_supportsInstructionalText + 2), 0);
  objc_storeStrong((id *)((char *)&self->_storageRangeToFontSizeDict + 3), 0);

  objc_storeStrong((id *)(&self->super.mOkayToSetGeometry + 3), 0);
}

- (BOOL)autosizes
{
  double v2 = self;
  double v3 = [(CRLWPShapeLayout *)v2 textLayout];
  if (v3)
  {
    unsigned __int8 v4 = v3;
    unint64_t v5 = [(CRLWPShapeLayout *)v2 autosizeFlagsFor:v3];

    return v5 != 0;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)autosizeFlagsFor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  unint64_t v6 = _sSo16CRLWPShapeLayoutC8FreeformE13autosizeFlags3forSo013CRLWPAutoSizeE0VAC11CRLWPLayoutC_tF_0();

  return v6;
}

- (int64_t)verticalAlignmentFor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  int64_t v6 = _sSo16CRLWPShapeLayoutC8FreeformE17verticalAlignment3forSo013CRLWPVerticalE0VAC11CRLWPLayoutC_tF_0();

  return v6;
}

- (CGRect)nonAutosizedFrameFor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  double v6 = CRLWPShapeLayout.nonAutosizedFrame(for:)((uint64_t)v4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)autosizedFrameFor:(id)a3 textSize:(CGSize)a4
{
  id v5 = a3;
  double v6 = self;
  double v7 = _sSo16CRLWPShapeLayoutC8FreeformE14autosizedFrame3for8textSizeSo6CGRectVAC11CRLWPLayoutC_So6CGSizeVtF_0();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (id)dependentsOf:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CRLWPShapeLayout.dependents(of:)(v4);

  sub_10050BF48(0, (unint64_t *)&qword_101690720);
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (Class)repClassFor:(id)a3
{
  sub_10050BF48(0, &qword_101684070);

  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)descendersCannotClip
{
  return 0;
}

- (id)interiorWrapSegmentsFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  NSArray v6 = [(CRLWPShapeLayout *)v5 textLayout];
  if (v6)
  {
    double v7 = v6;
    type metadata accessor for CRLWPLayout();
    id v8 = v4;
    char v9 = static NSObject.== infix(_:_:)();

    double v10 = 0;
    if (v9) {
      double v10 = [(CRLWPShapeLayout *)v5 interiorWrapSegments];
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (double)maxAutoGrowLineWidthFor:(id)a3
{
  return 500.0;
}

- (double)maxAutoGrowBlockHeightFor:(id)a3
{
  return 16000.0;
}

- (int64_t)naturalAlignmentFor:(id)a3
{
  return 4;
}

- (BOOL)textLayoutShouldWrapAroundExternalDrawables:(id)a3
{
  return 1;
}

- (BOOL)textLayoutShouldLayoutVertically:(id)a3
{
  return 0;
}

- (double)defaultFontSize
{
  double v2 = self;
  double v3 = CRLWPShapeLayout.defaultFontSize()();

  return v3;
}

- (id)makeStorageRangeToFontSizeDict
{
  double v2 = self;
  CRLWPShapeLayout.makeStorageRangeToFontSizeDict()();

  sub_10050BF48(0, (unint64_t *)&qword_10167AF10);
  sub_10050BF48(0, (unint64_t *)&qword_101684330);
  sub_100864690();
  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (id)commandsToSetFontSizesWithFontRangeToSizeDict:(id)a3 scale:(double)a4
{
  sub_10050BF48(0, (unint64_t *)&qword_10167AF10);
  sub_10050BF48(0, (unint64_t *)&qword_101684330);
  sub_100864690();
  unint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  double v7 = self;
  sub_100862FDC(v6, a4);

  swift_bridgeObjectRelease();
  type metadata accessor for CRLCommand();
  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (CRLFill)instructionalTextCharacterFill
{
  return (CRLFill *)0;
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  id v4 = self;
  _sSo16CRLWPShapeLayoutC8FreeformE5width14forColumnIndex9bodyWidth12CoreGraphics7CGFloatVSu_AItF_0();
  double v6 = v5;

  return v6;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 target:(id)a5 outWidth:(double *)a6 outGap:(double *)a7
{
  swift_unknownObjectRetain();
  double v12 = self;
  double v13 = sub_100864290(a3, a6, a7, a4);
  swift_unknownObjectRelease();

  return v13;
}

- (UIEdgeInsets)adjustedInsetsForTarget:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  double v5 = _sSo16CRLWPShapeLayoutC8FreeformE14adjustedInsets3forSo06UIEdgeE0VSo17CRLWPLayoutTarget_pSg_tF_0();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  swift_unknownObjectRelease();

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (CRLWPPadding)layoutMargins
{
  id v2 = [objc_allocWithZone((Class)CRLWPPadding) init];

  return (CRLWPPadding *)v2;
}

- (unint64_t)columnCount
{
  return 1;
}

- (BOOL)alwaysStartsNewTarget
{
  return 1;
}

- (BOOL)shrinkTextToFit
{
  id v2 = self;
  char v3 = CRLWPShapeLayout.shrinkTextToFit.getter();

  return v3 & 1;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

@end