@interface TSWPLayout
- (BOOL)allowsLastLineTruncation;
- (BOOL)caresAboutStorageChanges;
- (BOOL)ignoresEquationAlignment;
- (BOOL)invalidateForPageCountChange;
- (BOOL)isLastTarget;
- (BOOL)isLayoutOffscreen;
- (BOOL)layoutIsValid;
- (BOOL)p_parentAutosizes;
- (BOOL)shouldDisplayGuides;
- (BOOL)shouldHyphenate;
- (BOOL)shouldPositionAttachmentsIteratively;
- (BOOL)shouldProvideSizingGuides;
- (BOOL)shouldWrapAroundExternalDrawables;
- (BOOL)textIsVertical;
- (BOOL)textLayoutValid;
- (BOOL)wantsLineFragments;
- (CGPoint)anchorPoint;
- (CGPoint)calculatePointFromSearchReference:(id)a3;
- (CGPoint)capturedInfoPositionForAttachment;
- (CGPoint)position;
- (CGRect)frameForCulling;
- (CGRect)maskRect;
- (CGRect)p_protectedRectWithinLayoutForSelectionRect:(CGRect)a3;
- (CGRect)p_rectForSelection:(id)a3 useParagraphModeRects:(BOOL)a4;
- (CGRect)rectForPresentingAnnotationPopoverForSelection:(id)a3;
- (CGRect)rectForSelection:(id)a3;
- (CGRect)targetRectForCanvasRect:(CGRect)a3;
- (CGSize)currentSize;
- (CGSize)maxSize;
- (CGSize)minSize;
- (Class)repClassOverride;
- (NSMutableArray)columns;
- (TSDBezierPath)interiorClippingPath;
- (TSDCanvas)canvas;
- (TSDHint)nextTargetFirstChildHint;
- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer;
- (TSWPFootnoteMarkProvider)footnoteMarkProvider;
- (TSWPLayout)initWithInfo:(id)a3;
- (TSWPLayout)initWithInfo:(id)a3 frame:(CGRect)a4;
- (TSWPLayoutManager)layoutManager;
- (TSWPOffscreenColumn)nextTargetFirstColumn;
- (TSWPOffscreenColumn)previousTargetLastColumn;
- (const)nextTargetTopicNumbers;
- (const)previousTargetTopicNumbers;
- (double)baselineForCharIndex:(unsigned int)a3;
- (double)maxAnchorY;
- (id)columnMetricsForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4;
- (id)computeLayoutGeometry;
- (id)currentAnchoredDrawableLayouts;
- (id)dependentLayouts;
- (id)layoutForInlineDrawable:(id)a3;
- (id)layoutGeometryFromInfo;
- (id)lineHintsForTarget:(id)a3;
- (id)p_firstAncestorRespondingToSelector:(SEL)a3;
- (id)p_wpLayoutParent;
- (id)reliedOnLayouts;
- (id)styleProvider;
- (id)textColorOverride;
- (id)textWrapper;
- (id)validatedLayoutForAnchoredDrawable:(id)a3;
- (int)naturalDirection;
- (unint64_t)iterativeAttachmentPositioningMaxPassCount;
- (unint64_t)pageCount;
- (unint64_t)pageNumber;
- (unsigned)autosizeFlags;
- (unsigned)lineCount;
- (unsigned)maxLineCount;
- (unsigned)naturalAlignment;
- (unsigned)verticalAlignment;
- (void)addAttachmentLayout:(id)a3;
- (void)dealloc;
- (void)initialLayoutState;
- (void)invalidateForFootnoteNumberingChange;
- (void)invalidateMaxAutoGrowWidth;
- (void)invalidateParentForAutosizing;
- (void)invalidateSize;
- (void)invalidateTextLayout;
- (void)layoutManagerNeedsLayout:(id)a3;
- (void)layoutSearchForAnnotationWithHitBlock:(id)a3;
- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5;
- (void)p_invalidateTextLayout;
- (void)p_validateTextLayout;
- (void)parentDidChange;
- (void)parentWillChangeTo:(id)a3;
- (void)validate;
- (void)wrappableChildInvalidated:(id)a3;
@end

@implementation TSWPLayout

- (TSWPLayout)initWithInfo:(id)a3
{
  return -[TSWPLayout initWithInfo:frame:](self, "initWithInfo:frame:", a3, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
}

- (TSWPLayout)initWithInfo:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)TSWPLayout;
  v8 = [(TSDLayout *)&v11 initWithInfo:a3];
  if (v8)
  {
    v8->_columns = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    if (width > 0.0)
    {
      v9 = -[TSDLayoutGeometry initWithFrame:]([TSDLayoutGeometry alloc], "initWithFrame:", x, y, width, height);
      [(TSDAbstractLayout *)v8 setGeometry:v9];
    }
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPLayout;
  [(TSDLayout *)&v3 dealloc];
}

- (TSWPLayoutManager)layoutManager
{
  result = self->_layoutManager;
  if (!result)
  {
    v4 = [[TSWPLayoutManager alloc] initWithStorage:[(TSDLayout *)self info] owner:self];
    self->_layoutManager = v4;
    [(TSWPLayoutManager *)v4 resetTopicNumbers];
    return self->_layoutManager;
  }
  return result;
}

- (BOOL)textLayoutValid
{
  return self->_textLayoutValid;
}

- (BOOL)caresAboutStorageChanges
{
  return 1;
}

- (void)invalidateSize
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPLayout;
  [(TSDLayout *)&v3 invalidateSize];
  [(TSWPLayout *)self p_invalidateTextLayout];
}

- (id)p_wpLayoutParent
{
  objc_opt_class();
  [(TSDAbstractLayout *)self parent];
  TSUProtocolCast();
  id result = (id)TSUDynamicCast();
  if (!result)
  {
    [(TSDAbstractLayout *)self parent];
    v4 = (void *)TSUProtocolCast();
    return (id)[v4 wpLayoutParentForLayout:self];
  }
  return result;
}

- (BOOL)p_parentAutosizes
{
  id v3 = [(TSWPLayout *)self p_wpLayoutParent];
  if (v3) {
    LOBYTE(v3) = [v3 autosizeFlagsForTextLayout:self] != 0;
  }
  return (char)v3;
}

- (id)dependentLayouts
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)TSWPLayout;
  id v3 = [(TSDLayout *)&v17 dependentLayouts];
  id v4 = [(TSWPLayout *)self p_wpLayoutParent];
  if (v4)
  {
    v5 = v4;
    id v6 = v3 ? (id)[v3 mutableCopy] : (id)objc_msgSend(MEMORY[0x263EFF980], "array");
    id v3 = v6;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v7 = objc_msgSend(v5, "dependentsOfTextLayout:", self, 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [v3 addObject:*(void *)(*((void *)&v13 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v3;
}

- (id)reliedOnLayouts
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return (id)[(TSWPLayout *)self additionalReliedOnLayoutsForTextWrap];
}

- (void)p_validateTextLayout
{
  BOOL v3 = [(TSDLayout *)self layoutState] != 1
    || [(TSDInfo *)[(TSDLayout *)self info] length] != 0;
  if (!self->_textLayoutValid && v3)
  {
    v5 = [(TSWPLayoutManager *)[(TSWPLayout *)self layoutManager] layoutIntoTarget:self withLayoutState:[(TSWPLayout *)self initialLayoutState] outSync:0];
    if (v5) {
      [(TSWPLayoutManager *)[(TSWPLayout *)self layoutManager] destroyLayoutState:v5];
    }
    self->_textLayoutValid = 1;
  }
}

- (void)validate
{
  if ([(TSDAbstractLayout *)self parent])
  {
    if (![(TSWPLayout *)self p_parentAutosizes])
    {
      v15.receiver = self;
      v15.super_class = (Class)TSWPLayout;
      [(TSDLayout *)&v15 validate];
      goto LABEL_14;
    }
    BOOL textLayoutValid = self->_textLayoutValid;
    if (!self->_textLayoutValid)
    {
      id v4 = [(TSWPLayout *)self p_wpLayoutParent];
      char v5 = objc_opt_respondsToSelector();
      double v6 = 10.0;
      double v7 = 10.0;
      if (v5) {
        objc_msgSend(v4, "initialTextSize", 10.0, 10.0);
      }
      objc_msgSend(v4, "autosizedFrameForTextLayout:textSize:", self, v7, v6);
      if (v10 > 0.0)
      {
        v12 = -[TSDLayoutGeometry initWithFrame:]([TSDLayoutGeometry alloc], "initWithFrame:", v8, v9, v10, v11);
        [(TSDAbstractLayout *)self setGeometry:v12];
      }
    }
    [(TSWPLayout *)self p_validateTextLayout];
    v15.receiver = self;
    v15.super_class = (Class)TSWPLayout;
    [(TSDLayout *)&v15 validate];
    uint64_t v13 = [(TSWPLayout *)self autosizeFlags] & 0x20;
    if (!textLayoutValid && v13 != 0)
    {
      self->_BOOL textLayoutValid = 0;
LABEL_14:
      [(TSWPLayout *)self p_validateTextLayout];
    }
  }
}

- (CGPoint)capturedInfoPositionForAttachment
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (id)layoutGeometryFromInfo
{
  return 0;
}

- (id)computeLayoutGeometry
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  double v3 = objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "layoutGeometryProviderForLayout:", self);
  if (!v3 || (id result = (id)[v3 layoutGeometryForLayout:self]) == 0)
  {
    char v5 = (CGFloat *)MEMORY[0x263F001A0];
    double v6 = *MEMORY[0x263F001A0];
    double v7 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A0] + 24);
    id v10 = [(TSWPLayout *)self p_wpLayoutParent];
    if (v10)
    {
      double v11 = v10;
      if ([v10 autosizeFlagsForTextLayout:self])
      {
        CGFloat x = *v5;
        CGFloat y = v5[1];
        CGFloat width = v5[2];
        CGFloat height = v5[3];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        columns = self->_columns;
        uint64_t v17 = [(NSMutableArray *)columns countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v46 != v19) {
                objc_enumerationMutation(columns);
              }
              [*(id *)(*((void *)&v45 + 1) + 8 * i) frameBounds];
              v55.origin.CGFloat x = v21;
              v55.origin.CGFloat y = v22;
              v55.size.CGFloat width = v23;
              v55.size.CGFloat height = v24;
              v51.origin.CGFloat x = x;
              v51.origin.CGFloat y = y;
              v51.size.CGFloat width = width;
              v51.size.CGFloat height = height;
              CGRect v52 = CGRectUnion(v51, v55);
              CGFloat x = v52.origin.x;
              CGFloat y = v52.origin.y;
              CGFloat width = v52.size.width;
              CGFloat height = v52.size.height;
            }
            uint64_t v18 = [(NSMutableArray *)columns countByEnumeratingWithState:&v45 objects:v49 count:16];
          }
          while (v18);
        }
        objc_msgSend(-[TSWPLayout columnMetricsForCharIndex:outRange:](self, "columnMetricsForCharIndex:outRange:", 0x7FFFFFFFFFFFFFFFLL, 0), "adjustedInsets");
        CGFloat v26 = -v25;
        CGFloat v28 = -v27;
        v53.origin.CGFloat x = x;
        v53.origin.CGFloat y = y;
        v53.size.CGFloat width = width;
        v53.size.CGFloat height = height;
        CGRect v54 = CGRectInset(v53, v26, v28);
        objc_msgSend(v11, "autosizedFrameForTextLayout:textSize:", self, v54.size.width, v54.size.height);
      }
      else
      {
        [v11 nonAutosizedFrameForTextLayout:self];
      }
      double v6 = v29;
      double v7 = v30;
      double v8 = v31;
      double v9 = v32;
    }
    else
    {
      objc_opt_class();
      [(TSDAbstractLayout *)self parent];
      v33 = (void *)TSUDynamicCast();
      if (v33)
      {
        v34 = v33;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "info"), "geometry"), "boundsBeforeRotation");
        double v36 = v35;
        double v38 = v37;
        double v8 = v39;
        double v9 = v40;
        objc_msgSend((id)objc_msgSend(v34, "geometry"), "frame");
        double v6 = TSDSubtractPoints(v36, v38, v41);
        double v7 = v42;
      }
      else
      {
        v43 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v44 = [NSString stringWithUTF8String:"-[TSWPLayout computeLayoutGeometry]"];
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayout.mm"), 288, @"TSWPLayout requires a parent");
      }
    }
    return -[TSDLayoutGeometry initWithFrame:]([TSDLayoutGeometry alloc], "initWithFrame:", v6, v7, v8, v9);
  }
  return result;
}

- (void)initialLayoutState
{
  id v3 = [(TSWPLayout *)self p_wpLayoutParent];
  if (objc_opt_respondsToSelector())
  {
    if (objc_opt_respondsToSelector()) {
      [v3 allowsLastLineTruncation:self];
    }
    operator new();
  }
  return 0;
}

- (void)invalidateTextLayout
{
  [(TSWPLayout *)self p_invalidateTextLayout];

  [(TSDLayout *)self invalidate];
}

- (void)invalidateMaxAutoGrowWidth
{
  [(NSMutableArray *)self->_columns removeAllObjects];

  [(TSWPLayout *)self invalidateSize];
}

- (void)p_invalidateTextLayout
{
  id v3 = [(TSWPLayout *)self p_wpLayoutParent];
  self->_BOOL textLayoutValid = 0;
  if (v3)
  {
    id v4 = v3;
    if ([v3 autosizeFlagsForTextLayout:self])
    {
      if (([v4 invalidGeometry] & 1) == 0)
      {
        [v4 invalidateSize];
      }
    }
  }
}

- (void)invalidateForFootnoteNumberingChange
{
  [(NSMutableArray *)self->_columns removeAllObjects];

  [(TSWPLayout *)self invalidateSize];
}

- (BOOL)invalidateForPageCountChange
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  columns = self->_columns;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__TSWPLayout_invalidateForPageCountChange__block_invoke;
  v6[3] = &unk_2646B2798;
  v6[4] = &v7;
  [(NSMutableArray *)columns enumerateObjectsUsingBlock:v6];
  if (*((unsigned char *)v8 + 24))
  {
    [(NSMutableArray *)self->_columns removeAllObjects];
    [(TSWPLayout *)self invalidateSize];
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __42__TSWPLayout_invalidateForPageCountChange__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 layoutResultFlags];
  if ((result & 0x80) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)invalidateParentForAutosizing
{
  id v3 = [(TSWPLayout *)self p_wpLayoutParent];

  [v3 invalidateForAutosizingTextLayout:self];
}

- (double)baselineForCharIndex:(unsigned int)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  columns = self->_columns;
  uint64_t v5 = [(NSMutableArray *)columns countByEnumeratingWithState:&v16 objects:v20 count:16];
  double v6 = 0.0;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(columns);
        }
        char v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v11 = [v10 range];
        if (a3 >= v11 && a3 - v11 < v12)
        {
          [v10 baselineOfLineFragmentAtCharIndex:a3];
          return v14;
        }
      }
      uint64_t v7 = [(NSMutableArray *)columns countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  return v6;
}

- (Class)repClassOverride
{
  Class result = (Class)objc_msgSend(-[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent"), "repClassForTextLayout:", self);
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)TSWPLayout;
    return [(TSDLayout *)&v4 repClassOverride];
  }
  return result;
}

- (BOOL)shouldDisplayGuides
{
  return 0;
}

- (BOOL)shouldProvideSizingGuides
{
  return 0;
}

- (void)parentWillChangeTo:(id)a3
{
  [(TSWPLayoutManager *)self->_layoutManager clearOwner];
  layoutManager = self->_layoutManager;
  if (layoutManager && [(TSWPLayoutManager *)layoutManager dirtyRange] != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_columns removeAllObjects];
  }

  self->_layoutManager = 0;
}

- (void)parentDidChange
{
  if ([(TSDAbstractLayout *)self parent])
  {
    [(TSWPLayout *)self layoutManager];
  }
}

- (void)wrappableChildInvalidated:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPLayout;
  [(TSDLayout *)&v4 invalidate];
  [(TSWPLayout *)self p_invalidateTextLayout];
}

- (CGRect)frameForCulling
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)TSWPLayout;
  [(TSDAbstractLayout *)&v28 frameForCulling];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v11 = [(TSWPLayout *)self columns];
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v15) erasableBounds:0];
        v34.origin.CGFloat x = v16;
        v34.origin.CGFloat y = v17;
        v34.size.CGFloat width = v18;
        v34.size.CGFloat height = v19;
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        CGRect v32 = CGRectUnion(v31, v34);
        CGFloat x = v32.origin.x;
        CGFloat y = v32.origin.y;
        CGFloat width = v32.size.width;
        CGFloat height = v32.size.height;
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v13);
  }
  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGRect)p_protectedRectWithinLayoutForSelectionRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  if (!TSDRectIsFinite(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
    CGFloat y = v8;
    double x = v9 * 0.5;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
  }
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGPoint)calculatePointFromSearchReference:(id)a3
{
  objc_opt_class();
  [a3 selection];
  uint64_t v5 = TSUDynamicCast();
  double v6 = 0.0;
  if (v5)
  {
    double v7 = (void *)v5;
    double v8 = 0.0;
    if ([(NSMutableArray *)self->_columns count])
    {
      double v9 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", [v7 start], 0);
      +[TSWPColumn caretRectForInsertionPoint:v9 withColumns:self->_columns];
      [(TSWPLayout *)self p_protectedRectWithinLayoutForSelectionRect:"p_protectedRectWithinLayoutForSelectionRect:"];
      -[TSDAbstractLayout rectInRoot:](self, "rectInRoot:");
      double v8 = v10;
      double v6 = v11;
    }
  }
  else
  {
    double v8 = 0.0;
  }
  double v12 = v8;
  double v13 = v6;
  result.CGFloat y = v13;
  result.double x = v12;
  return result;
}

- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5
{
  double v9 = [(TSDLayout *)self info];
  uint64_t v10 = [(TSDInfo *)v9 range];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__TSWPLayout_layoutSearchForString_options_hitBlock___block_invoke;
  v14[3] = &unk_2646B27C0;
  v14[4] = self;
  v14[5] = a5;
  double v12 = (void *)-[TSDInfo searchInRange:forString:options:onHit:](v9, "searchInRange:forString:options:onHit:", v10, v11, a3, a4, v14);
  if (v12)
  {
    double v13 = v12;
    if (([v12 isComplete] & 1) == 0)
    {
      do
        [(TSDInfo *)v9 continueSearch:v13];
      while (![v13 isComplete]);
    }
  }
}

uint64_t __53__TSWPLayout_layoutSearchForString_options_hitBlock___block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) calculatePointFromSearchReference:a2];
  objc_msgSend(a2, "setSearchReferencePoint:");
  objc_super v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)layoutSearchForAnnotationWithHitBlock:(id)a3
{
  uint64_t v5 = [(TSDLayout *)self info];
  uint64_t v6 = [(TSDInfo *)v5 range];
  uint64_t v8 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__TSWPLayout_layoutSearchForAnnotationWithHitBlock___block_invoke;
  v10[3] = &unk_2646B27C0;
  v10[4] = self;
  v10[5] = a3;
  -[TSDInfo findCommentsInRange:onHit:](v5, "findCommentsInRange:onHit:", v6, v7, v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__TSWPLayout_layoutSearchForAnnotationWithHitBlock___block_invoke_2;
  v9[3] = &unk_2646B27C0;
  v9[4] = self;
  v9[5] = a3;
  -[TSDInfo findChangesInRange:onHit:](v5, "findChangesInRange:onHit:", v6, v8, v9);
}

uint64_t __52__TSWPLayout_layoutSearchForAnnotationWithHitBlock___block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) calculatePointFromSearchReference:a2];
  objc_msgSend(a2, "setSearchReferencePoint:");
  objc_super v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

uint64_t __52__TSWPLayout_layoutSearchForAnnotationWithHitBlock___block_invoke_2(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) calculatePointFromSearchReference:a2];
  objc_msgSend(a2, "setSearchReferencePoint:");
  objc_super v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (id)columnMetricsForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  if (a4)
  {
    a4->location = [(TSWPStorage *)[(TSWPLayoutManager *)[(TSWPLayout *)self layoutManager] storage] range];
    a4->length = v6;
  }
  [(TSDAbstractLayout *)self parent];

  return (id)TSUProtocolCast();
}

- (TSWPOffscreenColumn)previousTargetLastColumn
{
  return 0;
}

- (const)previousTargetTopicNumbers
{
  return 0;
}

- (const)nextTargetTopicNumbers
{
  return 0;
}

- (TSWPOffscreenColumn)nextTargetFirstColumn
{
  return 0;
}

- (TSDHint)nextTargetFirstChildHint
{
  return 0;
}

- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer
{
  [(TSDAbstractLayout *)self parent];

  return (TSWPFootnoteHeightMeasurer *)TSUProtocolCast();
}

- (TSWPFootnoteMarkProvider)footnoteMarkProvider
{
  [(TSDAbstractLayout *)self parent];

  return (TSWPFootnoteMarkProvider *)TSUProtocolCast();
}

- (BOOL)isLastTarget
{
  return 1;
}

- (CGSize)minSize
{
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = [(TSWPLayout *)self textIsVertical];
  if (v7) {
    double v8 = v6;
  }
  else {
    double v8 = v4;
  }
  if (!v7) {
    double v4 = v6;
  }
  id v9 = [(TSWPLayout *)self p_wpLayoutParent];
  if (v9)
  {
    char v10 = [v9 autosizeFlagsForTextLayout:self];
    if ((v10 & 8) != 0) {
      double v8 = 0.0;
    }
    if ((v10 & 2) != 0) {
      double v4 = 0.0;
    }
  }
  double v11 = v8;
  double v12 = v4;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (CGSize)maxSize
{
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(TSWPLayout *)self p_wpLayoutParent];
  if (!v7)
  {
    double v10 = v4;
    goto LABEL_17;
  }
  double v8 = v7;
  BOOL v9 = [(TSWPLayout *)self textIsVertical];
  if (v9) {
    double v10 = v6;
  }
  else {
    double v10 = v4;
  }
  if (v9) {
    double v6 = v4;
  }
  char v11 = [v8 autosizeFlagsForTextLayout:self];
  if ((v11 & 4) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      double v10 = 4000.0;
      if ((v11 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }
    [v8 maxAutoGrowWidthForTextLayout:self];
    double v10 = v12;
  }
  if ((v11 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  if (objc_opt_respondsToSelector())
  {
    [v8 maxAutoGrowHeightForTextLayout:self];
    double v6 = v13;
  }
  else
  {
    double v6 = 16000.0;
  }
LABEL_17:
  double v14 = v10;
  double v15 = v6;
  result.CGFloat height = v15;
  result.CGFloat width = v14;
  return result;
}

- (CGSize)currentSize
{
  double v2 = [(TSDAbstractLayout *)self geometry];

  [(TSDLayoutGeometry *)v2 size];
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (CGPoint)position
{
  double v2 = [(TSDAbstractLayout *)self geometry];

  [(TSDLayoutGeometry *)v2 frame];
  result.CGFloat y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)anchorPoint
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  result.CGFloat y = v3;
  result.double x = v2;
  return result;
}

- (unsigned)autosizeFlags
{
  id v3 = [(TSWPLayout *)self p_wpLayoutParent];
  if (v3)
  {
    LODWORD(v3) = [v3 autosizeFlagsForTextLayout:self];
  }
  return v3;
}

- (unsigned)verticalAlignment
{
  id v3 = [(TSWPLayout *)self p_wpLayoutParent];
  if (v3)
  {
    LODWORD(v3) = [v3 verticalAlignmentForTextLayout:self];
  }
  return v3;
}

- (unsigned)naturalAlignment
{
  id v3 = [(TSWPLayout *)self p_wpLayoutParent];
  if (!v3) {
    return 4;
  }
  double v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 4;
  }

  return [v4 naturalAlignmentForTextLayout:self];
}

- (int)naturalDirection
{
  return -1;
}

- (BOOL)wantsLineFragments
{
  return 1;
}

- (CGRect)targetRectForCanvasRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(TSDAbstractLayout *)self frameInRoot];
  double v8 = -v7;
  double v10 = -v9;
  CGFloat v11 = x;
  CGFloat v12 = y;
  CGFloat v13 = width;
  CGFloat v14 = height;

  return CGRectOffset(*(CGRect *)&v11, v8, v10);
}

- (TSDCanvas)canvas
{
  id v2 = [(TSDLayout *)self layoutController];

  return (TSDCanvas *)[v2 canvas];
}

- (id)layoutForInlineDrawable:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = [(TSDAbstractLayout *)self children];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      objc_opt_class();
      double v10 = (void *)TSUDynamicCast();
      if (v10)
      {
        CGFloat v11 = v10;
        if ((id)[v10 info] == a3) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    CGFloat v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "layoutClass")), "initWithInfo:", a3);
    if (v11)
    {
      [(TSDAbstractLayout *)self addChild:v11];
    }
  }
  [v11 updateChildrenFromInfo];
  return v11;
}

- (id)validatedLayoutForAnchoredDrawable:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPLayout validatedLayoutForAnchoredDrawable:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayout.mm"), 783, @"Anchored attachments not supported in non-body text.");
  return 0;
}

- (BOOL)shouldPositionAttachmentsIteratively
{
  return 0;
}

- (unint64_t)iterativeAttachmentPositioningMaxPassCount
{
  return 0;
}

- (void)addAttachmentLayout:(id)a3
{
  if ((TSWPLayout *)[a3 parent] != self) {
    [(TSDAbstractLayout *)self addChild:a3];
  }

  [a3 updateChildrenFromInfo];
}

- (id)currentAnchoredDrawableLayouts
{
  return 0;
}

- (double)maxAnchorY
{
  [(TSWPLayout *)self position];
  double v4 = v3;
  [(TSWPLayout *)self maxSize];
  return v4 + v5;
}

- (id)p_firstAncestorRespondingToSelector:(SEL)a3
{
  while (1)
  {
    double v3 = [(TSDAbstractLayout *)self parent];
    if (!v3 || (objc_opt_respondsToSelector() & 1) != 0) {
      break;
    }
    self = v3;
  }
  return v3;
}

- (unint64_t)pageNumber
{
  id v2 = [(TSWPLayout *)self p_firstAncestorRespondingToSelector:sel_pageNumber];
  if (!v2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [v2 pageNumber];
}

- (unint64_t)pageCount
{
  id v2 = [(TSWPLayout *)self p_firstAncestorRespondingToSelector:sel_pageCount];
  if (!v2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [v2 pageCount];
}

- (BOOL)textIsVertical
{
  id v3 = [(TSWPLayout *)self p_wpLayoutParent];
  if (!v3) {
    return 0;
  }
  double v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v4 textLayoutShouldLayoutVertically:self];
}

- (CGRect)maskRect
{
  double v3 = *MEMORY[0x263F001A0];
  double v4 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A0] + 24);
  id v7 = [(TSWPLayout *)self p_wpLayoutParent];
  if (objc_opt_respondsToSelector())
  {
    [v7 maskRectForTextLayout:self];
    double v3 = v8;
    double v4 = v9;
    double v5 = v10;
    double v6 = v11;
  }
  double v12 = v3;
  double v13 = v4;
  double v14 = v5;
  double v15 = v6;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)isLayoutOffscreen
{
  id v2 = [(TSDLayout *)self layoutController];

  return [v2 isLayoutOffscreen];
}

- (BOOL)layoutIsValid
{
  return self->_textLayoutValid;
}

- (BOOL)allowsLastLineTruncation
{
  id v3 = [(TSWPLayout *)self p_wpLayoutParent];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v3 allowsLastLineTruncation:self];
}

- (unsigned)maxLineCount
{
  id v3 = [(TSWPLayout *)self p_wpLayoutParent];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v3 maxLineCountForTextLayout:self];
}

- (BOOL)ignoresEquationAlignment
{
  id v3 = [(TSWPLayout *)self p_wpLayoutParent];
  return (objc_opt_respondsToSelector() & 1) != 0
      && [v3 textLayoutShouldIgnoreEquationAlignment:self] != 0;
}

- (BOOL)shouldHyphenate
{
  char v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "documentRoot"), "shouldHyphenate");
  id v4 = [(TSWPLayout *)self p_wpLayoutParent];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v3;
  }

  return [v4 shouldHyphenateTextLayout:self];
}

- (void)layoutManagerNeedsLayout:(id)a3
{
  if ([(TSWPLayout *)self layoutManager] != a3)
  {
    id v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPLayout layoutManagerNeedsLayout:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayout.mm"), 952, @"bad layout manager");
  }
  [(TSWPLayout *)self invalidateTextLayout];
  if ([(TSWPLayout *)self p_parentAutosizes])
  {
    [(TSWPLayout *)self invalidateSize];
    [(TSWPLayout *)self invalidateParentForAutosizing];
  }
}

- (id)textWrapper
{
  id v2 = [(TSDAbstractLayout *)self parent];
  if (objc_opt_respondsToSelector())
  {
    return (id)[(TSDAbstractLayout *)v2 textWrapperForExteriorWrap];
  }
  else if (objc_opt_respondsToSelector())
  {
    return (id)[(TSDAbstractLayout *)v2 textWrapper];
  }
  else
  {
    return 0;
  }
}

- (id)lineHintsForTarget:(id)a3
{
  if (a3 != self)
  {
    id v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPLayout lineHintsForTarget:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayout.mm"), 987, @"unexpected target");
  }
  [(TSWPLayout *)self p_wpLayoutParent];
  objc_opt_class();
  id result = (id)TSUDynamicCast();
  if (result)
  {
    id v7 = (void *)[result info];
    return (id)[v7 lineHints];
  }
  return result;
}

- (CGRect)rectForSelection:(id)a3
{
  [(TSWPLayout *)self p_rectForSelection:a3 useParagraphModeRects:1];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)rectForPresentingAnnotationPopoverForSelection:(id)a3
{
  [(TSWPLayout *)self p_rectForSelection:a3 useParagraphModeRects:0];

  [(TSWPLayout *)self p_protectedRectWithinLayoutForSelectionRect:"p_protectedRectWithinLayoutForSelectionRect:"];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)p_rectForSelection:(id)a3 useParagraphModeRects:(BOOL)a4
{
  BOOL v4 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TSWPLayout;
  -[TSDLayout rectForSelection:](&v23, sel_rectForSelection_);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  objc_opt_class();
  uint64_t v14 = TSUDynamicCast();
  if (v14)
  {
    +[TSWPColumn rectForSelection:v14 withColumns:[(TSWPLayout *)self columns] useParagraphModeRects:v4];
    double v7 = v15;
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
  }
  double v19 = v7;
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (id)styleProvider
{
  id v3 = [(TSWPLayout *)self p_wpLayoutParent];
  if (!v3
    || (BOOL v4 = v3, (objc_opt_respondsToSelector() & 1) == 0)
    || (id result = (id)[v4 styleProviderForLayout:self]) == 0)
  {
    double v6 = [(TSWPLayoutManager *)[(TSWPLayout *)self layoutManager] storage];
    return +[TSWPStorageStyleProvider styleProviderForStorage:v6];
  }
  return result;
}

- (TSDBezierPath)interiorClippingPath
{
  id v2 = [(TSDAbstractLayout *)self parent];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return (TSDBezierPath *)[(TSDAbstractLayout *)v2 interiorClippingPath];
}

- (unsigned)lineCount
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  columns = self->_columns;
  uint64_t v3 = [(NSMutableArray *)columns countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    LODWORD(v5) = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(columns);
        }
        uint64_t v5 = [*(id *)(*((void *)&v9 + 1) + 8 * i) countLines] + v5;
      }
      uint64_t v4 = [(NSMutableArray *)columns countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return v5;
}

- (id)textColorOverride
{
  if (![(TSDCanvas *)[(TSWPLayout *)self canvas] isPrinting]
    || ![(TSDCanvas *)[(TSWPLayout *)self canvas] shouldSuppressBackgrounds])
  {
    return 0;
  }
  uint64_t v3 = (void *)MEMORY[0x263F7C808];

  return (id)[v3 blackColor];
}

- (BOOL)shouldWrapAroundExternalDrawables
{
  id v3 = [(TSWPLayout *)self p_wpLayoutParent];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v4 textLayoutShouldWrapAroundExternalDrawables:self];
}

- (NSMutableArray)columns
{
  return self->_columns;
}

@end