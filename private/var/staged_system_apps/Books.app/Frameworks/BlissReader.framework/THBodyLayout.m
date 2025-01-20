@interface THBodyLayout
- (BOOL)allowsDescendersToClip;
- (BOOL)isLastTarget;
- (BOOL)isLayoutOffscreen;
- (BOOL)layoutIsValid;
- (BOOL)needsInflation;
- (BOOL)shouldPositionAttachmentsIteratively;
- (BOOL)siblingTargetIsManipulatingDrawable:(id)a3;
- (BOOL)textIsVertical;
- (BOOL)usesInflation;
- (BOOL)wantsLineFragments;
- (CGPoint)anchorPoint;
- (CGPoint)anchoredAttachmentPositionFromLayoutPosition:(CGPoint)a3;
- (CGPoint)calculatePointFromSearchReference:(id)a3;
- (CGPoint)capturedInfoPositionForAttachment;
- (CGPoint)layoutPositionFromAnchoredAttachmentPosition:(CGPoint)a3;
- (CGPoint)pageOriginOfCharacterIndex:(unint64_t)a3;
- (CGPoint)position;
- (CGRect)rectForSelection:(id)a3;
- (CGRect)targetRectForCanvasRect:(CGRect)a3;
- (CGSize)currentSize;
- (CGSize)maxSize;
- (CGSize)maximumFrameSizeForChild:(id)a3;
- (CGSize)minSize;
- (NSMutableArray)anchoredDrawablesForRelayout;
- (NSMutableArray)columns;
- (THBodyLayout)initWithInfo:(id)a3;
- (THPageController)pageController;
- (TSDCanvas)canvas;
- (TSDHint)nextTargetFirstChildHint;
- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer;
- (TSWPFootnoteMarkProvider)footnoteMarkProvider;
- (TSWPOffscreenColumn)nextTargetFirstColumn;
- (TSWPOffscreenColumn)previousTargetLastColumn;
- (_NSRange)columnRange;
- (const)nextTargetTopicNumbers;
- (const)previousTargetTopicNumbers;
- (double)maxAnchorY;
- (id)columnMetricsForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4;
- (id)computeLayoutGeometry;
- (id)currentAnchoredDrawableLayouts;
- (id)currentInlineDrawableLayouts;
- (id)firstTarget;
- (id)lastTarget;
- (id)layoutForInlineDrawable:(id)a3;
- (id)nextTargetFromLayout:(id)a3 column:(id)a4;
- (id)nonEmptyColumns;
- (id)p_attachedLayoutsInLayout:(id)a3 anchored:(BOOL)a4;
- (id)p_layoutForDrawable:(id)a3 inContainingLayout:(id)a4;
- (id)previousTargetFromLayout:(id)a3 column:(id)a4;
- (id)validatedLayoutForAnchoredDrawable:(id)a3;
- (int)naturalDirection;
- (unint64_t)bodyIndexInPageLayout;
- (unint64_t)firstCharacterIndexOverlappingPageRect:(CGRect)a3;
- (unint64_t)iterativeAttachmentPositioningMaxPassCount;
- (unint64_t)pageCount;
- (unint64_t)pageNumber;
- (unsigned)autosizeFlags;
- (unsigned)naturalAlignment;
- (unsigned)verticalAlignment;
- (void)addAttachmentLayout:(id)a3;
- (void)createColumns;
- (void)dealloc;
- (void)invalidateSize;
- (void)killColumns;
- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5;
- (void)p_killDrawableLayouts:(id)a3;
- (void)processWidowAndInflation;
- (void)replaceChild:(id)a3 with:(id)a4;
- (void)setAnchoredDrawablesForRelayout:(id)a3;
- (void)setNeedsDisplayInTargetRect:(CGRect)a3;
- (void)validate;
- (void)willBeAddedToLayoutController:(id)a3;
@end

@implementation THBodyLayout

- (THBodyLayout)initWithInfo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THBodyLayout;
  v3 = [(THBodyLayout *)&v5 initWithInfo:a3];
  if (v3) {
    v3->mAttachedDrawableLayouts = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  return v3;
}

- (void)dealloc
{
  self->mAttachedDrawableLayouts = 0;
  self->mColumns = 0;

  self->_anchoredDrawablesForRelayout = 0;
  v3.receiver = self;
  v3.super_class = (Class)THBodyLayout;
  [(THBodyLayout *)&v3 dealloc];
}

- (void)willBeAddedToLayoutController:(id)a3
{
  id v4 = [self info:a3 bodyStorage];
  if ([(THPageController *)[(THBodyLayout *)self pageController] needsAnnotationSourceForLayout:self])
  {
    id v5 = [[[THBodyLayout sectionLayout](self, "sectionLayout") info] contentNode];
    [v4 updateAnnotationSourceWithContentNode:v5];
  }
}

- (BOOL)allowsDescendersToClip
{
  v2 = [(THBodyLayout *)self pageController];

  return [(THPageController *)v2 allowsDescendersToClip];
}

- (CGRect)rectForSelection:(id)a3
{
  id v4 = [(THBodyLayout *)self columns];

  +[TSWPColumn rectForSelection:a3 withColumns:v4];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)needsInflation
{
  return [(THBodyLayout *)self columns] == 0;
}

- (void)p_killDrawableLayouts:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(a3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([v8 isBeingManipulated] & 1) == 0) {
          [v8 removeFromParent];
        }
      }
      id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)createColumns
{
  if (!self->mColumns) {
    self->mColumns = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
}

- (void)killColumns
{
  self->mColumns = 0;
  [(THBodyLayout *)self p_killDrawableLayouts:[(THBodyLayout *)self currentInlineDrawableLayouts]];
  id v3 = [(THBodyLayout *)self currentAnchoredDrawableLayouts];

  [(THBodyLayout *)self p_killDrawableLayouts:v3];
}

- (void)processWidowAndInflation
{
  id v3 = [(NSMutableArray *)[(THBodyLayout *)self columns] lastObject];
  if (v3)
  {
    id v4 = v3;
    id v5 = (char *)[v3 range];
    double v7 = &v5[v6];
    double v8 = [[-[THBodyLayout pageController](self, "pageController") i_pageHintForPageIndex:[-[THBodyLayout parent](self, "parent") relativePageIndex]] lastHintForBodyIndex:[-[THBodyLayout bodyIndexInPageLayout](self, "bodyIndexInPageLayout")]];
    long long v9 = (char *)(v8[5] + v8[4]);
    if (v9 != v7)
    {
      id v10 = [[self info] bodyStorage];
      long long v11 = (char *)[v4 range];
      if (v9 <= &v11[v12]) {
        v13 = &v11[v12];
      }
      else {
        v13 = v9;
      }
      if (v9 >= &v11[v12]) {
        v14 = &v11[v12];
      }
      else {
        v14 = v9;
      }
      [v4 trimToCharIndex:v9 inTarget:self removeAutoNumberFootnoteCount:[v10 autoNumberFootnoteCountForRange:v14, v13 - v14]];
      [(THBodyLayout *)self setNeedsDisplay];
    }
  }
  else
  {
    [(THBodyLayout *)self invalidate];
  }
}

- (unint64_t)bodyIndexInPageLayout
{
  id v3 = objc_msgSend(objc_msgSend(-[THBodyLayout parent](self, "parent"), "info"), "modelBodyInfos");
  id v4 = [(THBodyLayout *)self info];

  return (unint64_t)[v3 indexOfObject:v4];
}

- (unint64_t)firstCharacterIndexOverlappingPageRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [self parent].bodyRectForChildLayout(self);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGRect v13 = CGRectIntersection(v12, v14);
  if (CGRectIsNull(v13)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  TSDSubtractPoints();
  __int16 v11 = 0;
  return (unint64_t)+[TSWPColumn charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:](TSWPColumn, "charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:", [(THBodyLayout *)self columns], 0, 0, (char *)&v11 + 1, &v11, v9, v10);
}

- (_NSRange)columnRange
{
  id v2 = NSInvalidRange[0];
  id v3 = NSInvalidRange[1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(THBodyLayout *)self columns];
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id location = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v8) range];
        v11.id location = (NSUInteger)location;
        v11.NSUInteger length = length;
        if (v2 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v20.id location = (NSUInteger)v2;
          v20.NSUInteger length = (NSUInteger)v3;
          NSRange v12 = NSUnionRange(v20, v11);
          NSUInteger length = v12.length;
          id location = (id)v12.location;
        }
        id v2 = location;
        id v3 = (id)length;
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  NSUInteger v13 = (NSUInteger)v2;
  NSUInteger v14 = (NSUInteger)v3;
  result.NSUInteger length = v14;
  result.id location = v13;
  return result;
}

- (CGPoint)pageOriginOfCharacterIndex:(unint64_t)a3
{
  [(THBodyLayout *)self rectForSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3, 1)];
  [self.parent bodyRectForChildLayout:self];

  TSDAddPoints();
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (CGSize)maximumFrameSizeForChild:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "info"), "owningAttachment");
  if (v5 && ([v5 isAnchored] & 1) == 0 && -[THBodyLayout columns](self, "columns"))
  {
    [(-[NSMutableArray objectAtIndex:](-[THBodyLayout columns](self, "columns"), "objectAtIndex:", 0)) frameBounds];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)THBodyLayout;
    [(THBodyLayout *)&v10 maximumFrameSizeForChild:a3];
  }
  result.CGFloat height = v9;
  result.CGFloat width = v7;
  return result;
}

- (id)computeLayoutGeometry
{
  [(-[THBodyLayout parent](self, "parent")) bodyRectForChildLayout:self];
  id v6 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v2, v3, v4, v5];

  return v6;
}

- (CGPoint)capturedInfoPositionForAttachment
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)usesInflation
{
  return 1;
}

- (void)validate
{
  v3.receiver = self;
  v3.super_class = (Class)THBodyLayout;
  [(THBodyLayout *)&v3 validate];
  if ([(THBodyLayout *)self usesInflation])
  {
    if ([(THBodyLayout *)self needsInflation])
    {
      [(THBodyLayout *)self createColumns];
      [(THPageController *)[(THBodyLayout *)self pageController] i_inflateColumnsInBodyLayout:self];
    }
    if ([(THBodyLayout *)self needsInflation]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBodyLayout validate]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBodyLayout.mm") lineNumber:269 description:@"still need inflation after validation"];
    }
  }
}

- (void)invalidateSize
{
  v13.receiver = self;
  v13.super_class = (Class)THBodyLayout;
  [(THBodyLayout *)&v13 invalidateSize];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  id v3 = [(THBodyLayout *)self currentAnchoredDrawableLayouts];
  double v4 = (char *)[v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    double v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        double v8 = (void *)TSUDynamicCast();
        if (v8) {
          [v8 invalidateExteriorWrap];
        }
        ++v7;
      }
      while (v5 != v7);
      double v5 = (char *)[v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)columnMetricsForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  id v4 = [(THBodyLayout *)self info];

  return [v4 columnStyle];
}

- (BOOL)layoutIsValid
{
  return [(NSMutableArray *)self->mColumns count] != 0;
}

- (TSWPOffscreenColumn)previousTargetLastColumn
{
  id v3 = [(THBodyLayout *)self pageController];
  id v4 = [self parent].relativePageIndex;

  return (TSWPOffscreenColumn *)[(THPageController *)v3 i_columnPriorToPageIndex:v4];
}

- (TSWPOffscreenColumn)nextTargetFirstColumn
{
  id v3 = [(THBodyLayout *)self pageController];
  id v4 = [self parent].relativePageIndex;

  return (TSWPOffscreenColumn *)[(THPageController *)v3 i_columnAfterPageIndex:v4];
}

- (TSDHint)nextTargetFirstChildHint
{
  id v3 = [(THBodyLayout *)self pageController];
  id v4 = [[self parent] relativePageIndex];

  return (TSDHint *)[(THPageController *)v3 i_firstChildHintAfterPageIndex:v4];
}

- (const)previousTargetTopicNumbers
{
  id v3 = [(THBodyLayout *)self pageController];
  id v4 = [self parent].relativePageIndex;

  return [(THPageController *)v3 i_topicHintsPriorToPageIndex:v4];
}

- (const)nextTargetTopicNumbers
{
  id v3 = [(THBodyLayout *)self pageController];
  id v4 = [self parent].relativePageIndex;

  return [(THPageController *)v3 i_topicHintsAfterPageIndex:v4];
}

- (BOOL)isLastTarget
{
  return 0;
}

- (CGSize)minSize
{
  id v2 = [[self info] geometry];

  [v2 size];
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (CGSize)maxSize
{
  unsigned __int8 v3 = [(THBodyLayout *)self autosizeFlags];
  [self parent].bodyRectForChildLayout:self;
  double v6 = 100000.0;
  if (v3) {
    double v7 = 100000.0;
  }
  else {
    double v7 = v5;
  }
  if ((v3 & 4) == 0) {
    double v6 = v4;
  }
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

- (CGSize)currentSize
{
  if (objc_msgSend(-[THBodyLayout info](self, "info"), "autosizes"))
  {
    [(THBodyLayout *)self maxSize];
  }
  else
  {
    id v5 = [(THBodyLayout *)self geometry];
    [v5 size];
  }
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (CGPoint)position
{
  double y = CGPointZero.y;
  CGPoint v9 = CGPointZero;
  id v2 = [(THBodyLayout *)self geometry];
  if (v2)
  {
    [v2 transform];
    float64x2_t v3 = v10;
    float64x2_t v4 = v11;
    float64x2_t v5 = v12;
  }
  else
  {
    float64x2_t v5 = 0uLL;
    float64x2_t v3 = 0uLL;
    float64x2_t v4 = 0uLL;
  }
  float64x2_t v6 = vaddq_f64(v5, vmlaq_n_f64(vmulq_n_f64(v4, y), v3, v9.x));
  double v7 = v6.f64[1];
  result.double x = v6.f64[0];
  result.double y = v7;
  return result;
}

- (CGPoint)anchorPoint
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unsigned)autosizeFlags
{
  return 0;
}

- (unsigned)verticalAlignment
{
  return 0;
}

- (unsigned)naturalAlignment
{
  return 0;
}

- (BOOL)wantsLineFragments
{
  return 1;
}

- (int)naturalDirection
{
  return 0;
}

- (void)setNeedsDisplayInTargetRect:(CGRect)a3
{
}

- (CGRect)targetRectForCanvasRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(THBodyLayout *)self frameInRoot];
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
  id v2 = [(THBodyLayout *)self layoutController];

  return (TSDCanvas *)[v2 canvas];
}

- (void)replaceChild:(id)a3 with:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THBodyLayout;
  -[THBodyLayout replaceChild:with:](&v8, "replaceChild:with:");
  unsigned int v7 = [(NSMutableSet *)self->mAttachedDrawableLayouts containsObject:a3];
  if (a3 != a4)
  {
    if (v7) {
      [(NSMutableSet *)self->mAttachedDrawableLayouts removeObject:a3];
    }
  }
}

- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer
{
  return 0;
}

- (TSWPFootnoteMarkProvider)footnoteMarkProvider
{
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
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBodyLayout addAttachmentLayout:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBodyLayout.mm") lineNumber:453 description:@"invalid nil value for '%s'", "layout"];
  }
  if ([a3 parent] != self) {
    [(THBodyLayout *)self addChild:a3];
  }

  [a3 updateChildrenFromInfo];
}

- (id)p_layoutForDrawable:(id)a3 inContainingLayout:(id)a4
{
  id v7 = objc_msgSend(objc_msgSend(a4, "layoutController"), "layoutForInfo:childOfLayout:", a3, a4);
  if (!v7)
  {
    id v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "layoutClass")), "initWithInfo:", a3);
    if (v7)
    {
      [(NSMutableSet *)self->mAttachedDrawableLayouts addObject:v7];
      [a4 addAttachmentLayout:v7];
    }
  }
  return v7;
}

- (id)layoutForInlineDrawable:(id)a3
{
  return [(THBodyLayout *)self p_layoutForDrawable:a3 inContainingLayout:self];
}

- (id)validatedLayoutForAnchoredDrawable:(id)a3
{
  id v4 = [(THBodyLayout *)self p_layoutForDrawable:a3 inContainingLayout:[(THBodyLayout *)self parent]];
  [self layoutController].validateLayoutWithDependencies:v4;
  return v4;
}

- (id)p_attachedLayoutsInLayout:(id)a3 anchored:(BOOL)a4
{
  int v4 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [a3 children];
  id v7 = (char *)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v7) {
    return 0;
  }
  objc_super v8 = v7;
  double v9 = 0;
  uint64_t v10 = *(void *)v18;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v6);
      }
      objc_opt_class();
      CGFloat v12 = (void *)TSUDynamicCast();
      if (v12)
      {
        CGFloat v13 = v12;
        id v14 = objc_msgSend(objc_msgSend(v12, "info"), "owningAttachment");
        if (v14)
        {
          long long v15 = v14;
          if ([v14 isDrawable])
          {
            if ([v15 isAnchored] == v4
              && [(NSMutableSet *)self->mAttachedDrawableLayouts containsObject:v13])
            {
              if (v9) {
                [(NSMutableArray *)v9 addObject:v13];
              }
              else {
                double v9 = +[NSMutableArray arrayWithObject:v13];
              }
            }
          }
        }
      }
    }
    objc_super v8 = (char *)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v8);
  return v9;
}

- (id)currentInlineDrawableLayouts
{
  return [(THBodyLayout *)self p_attachedLayoutsInLayout:self anchored:0];
}

- (id)currentAnchoredDrawableLayouts
{
  id v3 = [(THBodyLayout *)self parent];

  return [(THBodyLayout *)self p_attachedLayoutsInLayout:v3 anchored:1];
}

- (double)maxAnchorY
{
  [(THBodyLayout *)self position];
  double v4 = v3;
  [(THBodyLayout *)self maxSize];
  return v4 + v5;
}

- (BOOL)isLayoutOffscreen
{
  id v2 = [(THBodyLayout *)self layoutController];

  return [v2 isLayoutOffscreen];
}

- (CGPoint)layoutPositionFromAnchoredAttachmentPosition:(CGPoint)a3
{
  if (self)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    [(THBodyLayout *)self transform];
    a3.CGFloat y = y;
    a3.CGFloat x = x;
    float64x2_t v4 = v10;
    float64x2_t v3 = v11;
    float64x2_t v5 = v12;
  }
  else
  {
    float64x2_t v5 = 0uLL;
    float64x2_t v4 = 0uLL;
    float64x2_t v3 = 0uLL;
  }
  float64x2_t v6 = vaddq_f64(v5, vmlaq_n_f64(vmulq_n_f64(v3, a3.y), v4, a3.x));
  double v7 = v6.f64[1];
  result.CGFloat x = v6.f64[0];
  result.CGFloat y = v7;
  return result;
}

- (CGPoint)anchoredAttachmentPositionFromLayoutPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self) {
    [(THBodyLayout *)self transform];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CGAffineTransformInvert(&v9, &v8);
  float64x2_t v4 = vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, y), *(float64x2_t *)&v9.a, x));
  double v5 = v4.f64[1];
  result.double x = v4.f64[0];
  result.double y = v5;
  return result;
}

- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5
{
  if ([(NSMutableArray *)[(THBodyLayout *)self columns] count])
  {
    id v9 = [(NSMutableArray *)[(THBodyLayout *)self columns] objectAtIndex:0];
    id v10 = [(NSMutableArray *)[(THBodyLayout *)self columns] lastObject];
    id v11 = [v9 range];
    NSUInteger v13 = v12;
    v21.id location = (NSUInteger)[v10 range];
    v21.NSUInteger length = v14;
    v20.id location = (NSUInteger)v11;
    v20.NSUInteger length = v13;
    NSRange v15 = NSUnionRange(v20, v21);
    long long v16 = (char *)objc_msgSend(objc_msgSend(-[THBodyLayout info](self, "info"), "bodyStorage"), "length")
        - v15.location
        - v15.length;
    if ((char *)[a3 length] - 1 < v16) {
      long long v16 = (char *)[a3 length] - 1;
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_461BC;
    v19[3] = &unk_4579B0;
    v19[4] = self;
    v19[5] = a5;
    id v17 = objc_msgSend(objc_msgSend(-[THBodyLayout info](self, "info"), "bodyStorage"), "searchInRange:forString:options:onHit:", v15.location, &v16[v15.length], a3, a4, v19);
    if (v17)
    {
      long long v18 = v17;
      if (([v17 isComplete] & 1) == 0)
      {
        do
          objc_msgSend(objc_msgSend(-[THBodyLayout info](self, "info"), "bodyStorage"), "continueSearch:", v18);
        while (![v18 isComplete]);
      }
    }
  }
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
    if ([(NSMutableArray *)[(THBodyLayout *)self columns] count])
    {
      id v9 = [objc_alloc((Class)TSWPSelection) initWithRange:[v7 start] 0];
      +[TSWPColumn rectForSelection:v9 withColumns:[(THBodyLayout *)self columns]];
      -[THBodyLayout rectInRoot:](self, "rectInRoot:");
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
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (BOOL)siblingTargetIsManipulatingDrawable:(id)a3
{
  return 0;
}

- (THPageController)pageController
{
  id v2 = [(THBodyLayout *)self parent];

  return (THPageController *)[v2 pageController];
}

- (unint64_t)pageNumber
{
  id v2 = [(THBodyLayout *)self parent];

  return (unint64_t)[v2 relativePageIndex];
}

- (unint64_t)pageCount
{
  id v2 = [(THBodyLayout *)self pageController];

  return (unint64_t)[(THPageController *)v2 pageCount];
}

- (BOOL)textIsVertical
{
  return 0;
}

- (NSMutableArray)anchoredDrawablesForRelayout
{
  return self->_anchoredDrawablesForRelayout;
}

- (void)setAnchoredDrawablesForRelayout:(id)a3
{
}

- (NSMutableArray)columns
{
  return self->mColumns;
}

- (id)nonEmptyColumns
{
  id v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  float64x2_t v4 = [(THBodyLayout *)self columns];
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v9 range];
        if (v10) {
          [v3 addObject:v9];
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)nextTargetFromLayout:(id)a3 column:(id)a4
{
  id v5 = [[-[THBodyLayout nonEmptyColumns](self, "nonEmptyColumns", a3) tsu_objectAfterObjectIdenticalTo:a4]];
  if (v5)
  {
    id v6 = [[THGuidedPanColumnTarget alloc] initWithLayout:self column:v5];
    return v6;
  }
  else
  {
    id v8 = [(THBodyLayout *)self parent];
    return [v8 nextTargetFromLayout:self column:0];
  }
}

- (id)firstTarget
{
  id result = [[self nonEmptyColumns] count];
  if (result)
  {
    float64x2_t v4 = [[THGuidedPanColumnTarget alloc] initWithLayout:column:[THBodyLayout nonEmptyColumns](self, "nonEmptyColumns") firstObject];
    return v4;
  }
  return result;
}

- (id)previousTargetFromLayout:(id)a3 column:(id)a4
{
  id v5 = [[self nonEmptyColumns] tsu_objectBeforeObjectIdenticalTo:a4];
  if (v5)
  {
    id v6 = [[THGuidedPanColumnTarget alloc] initWithLayout:self column:v5];
    return v6;
  }
  else
  {
    id v8 = [(THBodyLayout *)self parent];
    return [v8 previousTargetFromLayout:self column:0];
  }
}

- (id)lastTarget
{
  id result = [[self nonEmptyColumns] count];
  if (result)
  {
    float64x2_t v4 = -[THGuidedPanColumnTarget initWithLayout:column:]([THGuidedPanColumnTarget alloc], "initWithLayout:column:", self, [THBodyLayout nonEmptyColumns](self, "nonEmptyColumns")[@"lastObject"]);
    return v4;
  }
  return result;
}

@end