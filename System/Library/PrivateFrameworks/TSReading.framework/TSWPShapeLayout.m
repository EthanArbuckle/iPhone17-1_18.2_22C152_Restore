@interface TSWPShapeLayout
- (BOOL)allowsLastLineTruncation:(id)a3;
- (BOOL)alwaysStartsNewTarget;
- (BOOL)autosizes;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)columnsAreLeftToRight;
- (BOOL)isInvisibleAutosizingShape;
- (BOOL)resizeMayChangeAspectRatio;
- (BOOL)shrinkTextToFit;
- (BOOL)supportsRotation;
- (BOOL)textLayoutShouldLayoutVertically:(id)a3;
- (BOOL)textLayoutShouldWrapAroundExternalDrawables:(id)a3;
- (CGAffineTransform)autosizedTransform;
- (CGAffineTransform)autosizedTransformForInfoGeometry:(SEL)a3;
- (CGAffineTransform)computeLayoutTransform;
- (CGPoint)autosizePositionOffset;
- (CGPoint)autosizePositionOffsetForFixedWidth:(BOOL)a3 height:(BOOL)a4;
- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4;
- (CGRect)nonAutosizedFrameForTextLayout:(id)a3;
- (CGSize)adjustedInsets;
- (Class)repClassForTextLayout:(id)a3;
- (TSWPLayout)containedLayout;
- (TSWPPadding)layoutMargins;
- (TSWPShapeLayout)initWithInfo:(id)a3;
- (TSWPShapeLayoutDelegate)delegate;
- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6;
- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (id)childSearchTargets;
- (id)children;
- (id)dependentLayouts;
- (id)dependentsOfTextLayout:(id)a3;
- (id)instructionalStorageForContainedStorage:(id)a3 storageKind:(int)a4;
- (id)interiorWrapPath;
- (id)interiorWrapPolygon;
- (id)pathSource;
- (id)textWrapper;
- (unint64_t)columnCount;
- (unsigned)autosizeFlagsForTextLayout:(id)a3;
- (unsigned)cropLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128];
- (unsigned)maxLineCountForTextLayout:(id)a3;
- (unsigned)verticalAlignmentForTextLayout:(id)a3;
- (void)addChild:(id)a3;
- (void)createContainedLayoutForEditing;
- (void)createContainedLayoutForInstructionalText;
- (void)dealloc;
- (void)destroyContainedLayoutForInstructionalText;
- (void)insertChild:(id)a3 above:(id)a4;
- (void)insertChild:(id)a3 atIndex:(unint64_t)a4;
- (void)insertChild:(id)a3 below:(id)a4;
- (void)invalidateForAutosizingTextLayout:(id)a3;
- (void)invalidatePath;
- (void)invalidateSize;
- (void)processChangedProperty:(int)a3;
- (void)replaceChild:(id)a3 with:(id)a4;
- (void)setChildren:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGeometry:(id)a3;
- (void)storage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6;
- (void)updateChildrenFromInfo;
- (void)willBeAddedToLayoutController:(id)a3;
- (void)willBeRemovedFromLayoutController:(id)a3;
@end

@implementation TSWPShapeLayout

- (TSWPShapeLayout)initWithInfo:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPShapeLayout initWithInfo:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 48, @"info is wrong class for layout");
  }
  v12.receiver = self;
  v12.super_class = (Class)TSWPShapeLayout;
  v7 = [(TSDShapeLayout *)&v12 initWithInfo:a3];
  v8 = v7;
  if (v7 && ![(TSDInfo *)[(TSDLayout *)v7 info] containedStorage])
  {
    v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPShapeLayout initWithInfo:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 51, @"invalid nil value for '%s'", "self.info.containedStorage");
  }
  return v8;
}

- (void)dealloc
{
  if (self->_observingStorage)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPShapeLayout dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 59, @"should have unregistered ourselves before dealloc");
  }
  [(TSDLayout *)self->_containedLayout setParent:0];

  self->_containedLayout = 0;
  self->_cachedInteriorWrapPolygon = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeLayout;
  [(TSDShapeLayout *)&v5 dealloc];
}

- (void)willBeAddedToLayoutController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPShapeLayout;
  [(TSDLayout *)&v6 willBeAddedToLayoutController:a3];
  if (!self->_observingStorage
    || (uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPShapeLayout willBeAddedToLayoutController:]"], objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 73, @"already observing the storage"), !self->_observingStorage))
  {
    objc_msgSend((id)-[TSDInfo containedStorage](-[TSDLayout info](self, "info"), "containedStorage"), "addObserver:", self);
    self->_observingStorage = 1;
  }
}

- (void)willBeRemovedFromLayoutController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPShapeLayout;
  [(TSDLayout *)&v6 willBeRemovedFromLayoutController:a3];
  if (self->_observingStorage
    || (uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPShapeLayout willBeRemovedFromLayoutController:]"], objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 86, @"not observing the storage"), self->_observingStorage))
  {
    objc_msgSend((id)-[TSDInfo containedStorage](-[TSDLayout info](self, "info"), "containedStorage"), "removeObserver:", self);
    self->_observingStorage = 0;
  }
}

- (id)children
{
  v3[1] = *MEMORY[0x263EF8340];
  if (!self->_containedLayout) {
    return 0;
  }
  v3[0] = self->_containedLayout;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

- (void)setChildren:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPShapeLayout setChildren:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:102 description:@"not supported"];
}

- (void)addChild:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPShapeLayout addChild:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:107 description:@"not supported"];
}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPShapeLayout insertChild:atIndex:]"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:112 description:@"not supported"];
}

- (void)insertChild:(id)a3 below:(id)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPShapeLayout insertChild:below:]"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:117 description:@"not supported"];
}

- (void)insertChild:(id)a3 above:(id)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPShapeLayout insertChild:above:]"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:122 description:@"not supported"];
}

- (void)replaceChild:(id)a3 with:(id)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPShapeLayout replaceChild:with:]"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:127 description:@"not supported"];
}

- (void)invalidateSize
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeLayout;
  [(TSDLayout *)&v5 invalidateSize];
  unsigned int v3 = [(TSWPShapeLayout *)self autosizeFlagsForTextLayout:self->_containedLayout];
  if ((~v3 & 0xF) != 0)
  {
    unsigned int v4 = v3;
    [(TSWPLayout *)self->_containedLayout invalidateSize];
    if (v4) {
      [(TSWPShapeLayout *)self invalidatePath];
    }
  }
}

- (void)invalidatePath
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPShapeLayout;
  [(TSDShapeLayout *)&v3 invalidatePath];

  self->_cachedInteriorWrapPolygon = 0;
}

- (void)destroyContainedLayoutForInstructionalText
{
  if (([(TSDInfo *)[(TSDLayout *)self info] displaysInstructionalText] & 1) == 0)
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPShapeLayout destroyContainedLayoutForInstructionalText]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 162, @"trying to destroy layout for instructional text when it is not present");
  }
  if ([(TSDInfo *)[(TSDLayout *)self info] displaysInstructionalText])
  {
    objc_super v5 = [(TSDLayout *)self->_containedLayout info];
    if (v5 != (TSDInfo *)[(TSDInfo *)[(TSDLayout *)self info] containedStorage])
    {
      [(TSDLayout *)self->_containedLayout setParent:0];

      self->_containedLayout = 0;
    }
  }
}

- (void)createContainedLayoutForInstructionalText
{
  objc_super v3 = (void *)[(TSDInfo *)[(TSDLayout *)self info] containedStorage];
  if ([(TSDInfo *)[(TSDLayout *)self info] displaysInstructionalText]
    && ![v3 length])
  {
    containedLayout = self->_containedLayout;
    if ((!containedLayout || [(TSDLayout *)containedLayout info] == v3)
      && (!objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas")
       || objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "shouldShowInstructionalText")))
    {
      [(TSDDrawableLayout *)self invalidate];
      [(TSDLayout *)self->_containedLayout setParent:0];

      self->_containedLayout = 0;
      uint64_t v5 = [v3 wpKind] == 5 ? 5 : 3;
      id v6 = [(TSWPShapeLayout *)self instructionalStorageForContainedStorage:v3 storageKind:v5];
      objc_msgSend(v6, "setParentInfo:", objc_msgSend(v3, "parentInfo"));
      v7 = (void *)[(TSDInfo *)[(TSDLayout *)self info] geometry];
      id v8 = objc_alloc((Class)[v3 layoutClass]);
      [v7 size];
      v9 = (TSWPLayout *)[v8 initWithInfo:v6 frame:TSDRectWithSize()];
      self->_containedLayout = v9;
      [(TSDLayout *)v9 setParent:self];
      if ([(TSWPShapeLayout *)self autosizes])
      {
        uint64_t v10 = self->_containedLayout;
        [(TSWPShapeLayout *)self invalidateForAutosizingTextLayout:v10];
      }
    }
  }
  else
  {
    [(TSWPShapeLayout *)self createContainedLayoutForEditing];
  }
}

- (id)instructionalStorageForContainedStorage:(id)a3 storageKind:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v7 = [TSWPStorage alloc];
  uint64_t v8 = [a3 context];
  uint64_t v9 = [(TSDInfo *)[(TSDLayout *)self info] instructionalText];
  uint64_t v10 = [a3 stylesheet];
  uint64_t v11 = [a3 paragraphStyleAtParIndex:0 effectiveRange:0];
  uint64_t v12 = [a3 listStyleAtCharIndex:0 effectiveRange:0];
  LODWORD(v15) = [a3 writingDirectionForParagraphAtCharIndex:0];
  v13 = [(TSWPStorage *)v7 initWithContext:v8 string:v9 kind:v4 stylesheet:v10 paragraphStyle:v11 listStyle:v12 section:0 columnStyle:0 paragraphDirection:v15];

  return v13;
}

- (BOOL)isInvisibleAutosizingShape
{
  uint64_t v3 = [(TSDInfo *)[(TSDLayout *)[(TSWPShapeLayout *)self containedLayout] info] length];
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeLayout;
  BOOL result = [(TSDShapeLayout *)&v5 isInvisibleAutosizingShape];
  if (v3) {
    return 0;
  }
  return result;
}

- (id)childSearchTargets
{
  uint64_t v3 = [(TSDLayout *)self->_containedLayout info];
  if (v3 != (TSDInfo *)[(TSDInfo *)[(TSDLayout *)self info] containedStorage]) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeLayout;
  return [(TSDLayout *)&v5 childSearchTargets];
}

- (void)storage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6
{
  delegate = self->_delegate;
  if (!delegate
    || -[TSWPShapeLayoutDelegate shapeLayoutShouldUpdateInstructionalText:](delegate, "shapeLayoutShouldUpdateInstructionalText:", self, a4.location, a4.length, a5, *(void *)&a6))
  {
    if ([(TSDInfo *)[(TSDLayout *)self info] displaysInstructionalText])[(TSWPShapeLayout *)self destroyContainedLayoutForInstructionalText]; {
    [(TSWPShapeLayout *)self createContainedLayoutForInstructionalText];
    }
  }
  uint64_t v8 = self->_delegate;

  [(TSWPShapeLayoutDelegate *)v8 shapeLayoutDidChangeContainedStorage:self];
}

- (void)createContainedLayoutForEditing
{
  uint64_t v3 = (void *)[(TSDInfo *)[(TSDLayout *)self info] containedStorage];
  containedLayout = self->_containedLayout;
  if (!containedLayout || [(TSDLayout *)containedLayout info] != v3)
  {
    [(TSDDrawableLayout *)self invalidate];
    [(TSDLayout *)self->_containedLayout setParent:0];

    self->_containedLayout = 0;
    id v5 = objc_alloc((Class)[v3 layoutClass]);
    [(TSWPShapeLayout *)self nonAutosizedFrameForTextLayout:self->_containedLayout];
    id v6 = (TSWPLayout *)objc_msgSend(v5, "initWithInfo:frame:", v3);
    self->_containedLayout = v6;
    [(TSDLayout *)v6 setParent:self];
    if ([(TSWPShapeLayout *)self autosizes])
    {
      v7 = self->_containedLayout;
      [(TSWPShapeLayout *)self invalidateForAutosizingTextLayout:v7];
    }
  }
}

- (void)updateChildrenFromInfo
{
  containedLayout = self->_containedLayout;
  if (!containedLayout)
  {
    [(TSWPShapeLayout *)self createContainedLayoutForInstructionalText];
    containedLayout = self->_containedLayout;
  }

  [(TSDLayout *)containedLayout updateChildrenFromInfo];
}

- (id)interiorWrapPolygon
{
  id result = self->_cachedInteriorWrapPolygon;
  if (!result)
  {
    id v4 = [(TSWPShapeLayout *)self interiorWrapPath];
    if ([(TSDInfo *)[(TSDLayout *)self info] textIsVertical])
    {
      [(TSDShapeLayout *)self pathBoundsWithoutStroke];
      memset(&v10, 0, sizeof(v10));
      CGAffineTransformMakeTranslation(&v10, 0.0, v5);
      CGAffineTransform v8 = v10;
      CGAffineTransformRotate(&v9, &v8, -1.57079633);
      CGAffineTransform v10 = v9;
      CGAffineTransform v7 = v9;
      [v4 transformUsingAffineTransform:&v7];
    }
    id v6 = [[TSDWrapPolygon alloc] initWithPath:v4];
    self->_cachedInteriorWrapPolygon = v6;
    [(TSDWrapPolygon *)v6 setIntersectsSelf:0];
    return self->_cachedInteriorWrapPolygon;
  }
  return result;
}

- (id)interiorWrapPath
{
  uint64_t v3 = objc_msgSend(-[TSWPShapeLayout pathSource](self, "pathSource"), "interiorWrapPath");
  objc_opt_class();
  objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "style");
  objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "valueForProperty:", 146), "leftInset");
  double v5 = v4;
  id v6 = objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "stroke");
  CGAffineTransform v7 = v6;
  if (v6 && [v6 shouldRender])
  {
    [v7 width];
    double v5 = v5 + v8 * 0.5;
  }
  if (v5 <= 0.0)
  {
    return +[TSDBezierPath outsideEdgeOfBezierPath:v3];
  }
  else
  {
    uint64_t v9 = (int)[v7 join];
    return (id)[v3 bezierPathByOffsettingPath:v9 joinStyle:-v5 withThreshold:1.0];
  }
}

- (id)textWrapper
{
  if ([(TSWPShapeLayout *)self autosizes]
    || (objc_msgSend(-[TSWPShapeLayout pathSource](self, "pathSource"), "isRectangular") & 1) != 0)
  {
    return 0;
  }

  return +[TSWPInteriorTextWrapController sharedInteriorTextWrapController];
}

- (unsigned)cropLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128]
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = [(TSWPShapeLayout *)self interiorWrapPolygon];

  return +[TSWPTextWrapper splitLine:lineSegmentRects:polygon:type:skipHint:](TSWPTextWrapper, "splitLine:lineSegmentRects:polygon:type:skipHint:", a4, v9, 0, 0, x, y, width, height);
}

- (BOOL)autosizes
{
  return [(TSWPShapeLayout *)self autosizeFlagsForTextLayout:self->_containedLayout] != 0;
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  id v4 = [(TSDShapeLayout *)self layoutInfoGeometry];
  int v5 = [(TSDInfo *)[(TSDLayout *)self info] textIsVertical];
  int v6 = [v4 heightValid];
  if (v5) {
    int v7 = 4;
  }
  else {
    int v7 = 1;
  }
  if (v5) {
    int v8 = 1;
  }
  else {
    int v8 = 4;
  }
  if (v6) {
    int v9 = 0;
  }
  else {
    int v9 = v7;
  }
  if ([v4 widthValid]) {
    int v10 = 0;
  }
  else {
    int v10 = v8;
  }
  return v10 | v9;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  objc_opt_class();
  objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "style");
  id v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    LODWORD(v4) = [v4 intValueForProperty:149];
  }
  return v4;
}

- (void)invalidateForAutosizingTextLayout:(id)a3
{
  if (![(TSWPShapeLayout *)self autosizes])
  {
    id v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPShapeLayout invalidateForAutosizingTextLayout:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 437, @"should call only when autosizing");
  }
  [(TSDShapeLayout *)self invalidateFrame];

  [(TSWPShapeLayout *)self invalidatePath];
}

- (CGRect)nonAutosizedFrameForTextLayout:(id)a3
{
  id v4 = objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo", a3), "stroke");
  if (![v4 shouldRender]) {
    id v4 = 0;
  }
  unsigned int v5 = [(TSWPShapeLayout *)self autosizeFlagsForTextLayout:self->_containedLayout];
  objc_msgSend(-[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"), "size");
  double v6 = TSDRectWithSize();
  double v8 = v7;
  double width = v9;
  double height = v11;
  if (!v5 && ![(TSDLayout *)self invalidGeometry])
  {
    [(TSDShapeLayout *)self boundsForStandardKnobs];
    double v6 = TSDRectWithSize();
    double v8 = v13;
    double width = v14;
    double height = v15;
  }
  [(TSDShapeLayout *)self pathBounds];
  double x = TSDSubtractPoints(v6, v8, v16);
  CGFloat y = v18;
  if (v4 && objc_msgSend(-[TSWPShapeLayout pathSource](self, "pathSource"), "isRectangular"))
  {
    [v4 width];
    double v21 = ceil(v20 * 0.5);
    CGFloat v22 = fmin(v21, width * 0.5);
    CGFloat v23 = fmin(v21, height * 0.5);
    v28.origin.double x = x;
    v28.origin.CGFloat y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    CGRect v29 = CGRectInset(v28, v22, v23);
    double x = v29.origin.x;
    CGFloat y = v29.origin.y;
    double width = v29.size.width;
    double height = v29.size.height;
  }
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.CGFloat y = v25;
  result.origin.double x = v24;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  if (![(TSWPShapeLayout *)self autosizes])
  {
    unsigned int v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPShapeLayout autosizedFrameForTextLayout:textSize:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 478, @"should call only when autosizing");
  }
  double v7 = objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "stroke");
  if (v7)
  {
    double v8 = v7;
    if ([v7 shouldRender]) {
      [v8 width];
    }
  }
  id v9 = [(TSDShapeLayout *)self layoutInfoGeometry];
  [v9 size];
  [v9 size];
  [v9 widthValid];
  [v9 heightValid];

  double v10 = TSDRectWithSize();
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.CGFloat y = v11;
  result.origin.double x = v10;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  v5[1] = *MEMORY[0x263EF8340];
  if (![(TSWPShapeLayout *)self autosizes]) {
    return 0;
  }
  v5[0] = self;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
}

- (Class)repClassForTextLayout:(id)a3
{
  return 0;
}

- (BOOL)textLayoutShouldWrapAroundExternalDrawables:(id)a3
{
  return 1;
}

- (BOOL)textLayoutShouldLayoutVertically:(id)a3
{
  uint64_t v3 = [(TSDLayout *)self info];

  return [(TSDInfo *)v3 textIsVertical];
}

- (BOOL)allowsLastLineTruncation:(id)a3
{
  uint64_t v3 = [(TSDLayout *)self info];

  return [(TSDInfo *)v3 allowsLastLineTruncation];
}

- (unsigned)maxLineCountForTextLayout:(id)a3
{
  uint64_t v3 = [(TSDLayout *)self info];

  return [(TSDInfo *)v3 maxLineCount];
}

- (BOOL)supportsRotation
{
  if (![[(TSDAbstractLayout *)self parent] canRotateChildLayout:self])
  {
    [(TSDAbstractLayout *)self parent];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeLayout;
  return [(TSDShapeLayout *)&v4 supportsRotation];
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  if ([(TSWPShapeLayout *)self autosizes]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeLayout;
  return [(TSDLayout *)&v4 canAspectRatioLockBeChangedByUser];
}

- (BOOL)resizeMayChangeAspectRatio
{
  if ([(TSWPShapeLayout *)self autosizes]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeLayout;
  return [(TSDLayout *)&v4 resizeMayChangeAspectRatio];
}

- (id)dependentLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPShapeLayout;
  id v3 = [(TSDLayout *)&v6 dependentLayouts];
  if (self->_containedLayout && ![(TSWPShapeLayout *)self autosizes])
  {
    if (v3) {
      id v4 = (id)[v3 mutableCopy];
    }
    else {
      id v4 = (id)[MEMORY[0x263EFF980] array];
    }
    id v3 = v4;
    [v4 addObject:self->_containedLayout];
  }
  return v3;
}

- (CGAffineTransform)computeLayoutTransform
{
  if ([(TSWPShapeLayout *)self autosizes])
  {
    memset(&v15, 0, sizeof(v15));
    if (self) {
      [(TSWPShapeLayout *)self autosizedTransform];
    }
    objc_msgSend(-[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"), "position");
    memset(&v14, 0, sizeof(v14));
    CGAffineTransform t1 = v15;
    CGAffineTransformMakeTranslation(&t2, v5, v6);
    CGAffineTransformConcat(&v14, &t1, &t2);
    [(TSDShapeLayout *)self pathBounds];
    *(_OWORD *)&retstr->a = 0u;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    CGAffineTransform v11 = v14;
    return CGAffineTransformTranslate(retstr, &v11, v7, v8);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TSWPShapeLayout;
    return (CGAffineTransform *)[(CGAffineTransform *)&v10 computeLayoutTransform];
  }
}

- (CGAffineTransform)autosizedTransform
{
  CGRect result = [(TSDShapeLayout *)self layoutInfoGeometry];
  if (self)
  {
    return [(TSWPShapeLayout *)self autosizedTransformForInfoGeometry:result];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (CGAffineTransform)autosizedTransformForInfoGeometry:(SEL)a3
{
  CGFloat v7 = [(TSDLayout *)self info];
  CGRect result = (CGAffineTransform *)[(TSDShapeLayout *)self pathBoundsWithoutStroke];
  if (v7)
  {
    return (CGAffineTransform *)-[TSDInfo autosizedTransformForInfoGeometry:size:](v7, "autosizedTransformForInfoGeometry:size:", a4, v9, v10);
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (CGPoint)autosizePositionOffset
{
  [(TSWPShapeLayout *)self autosizePositionOffsetForFixedWidth:1 height:1];
  result.CGFloat y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)autosizePositionOffsetForFixedWidth:(BOOL)a3 height:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  float64x2_t v24 = 0u;
  float64x2_t v25 = 0u;
  float64x2_t v23 = 0u;
  if (self) {
    [(TSWPShapeLayout *)self autosizedTransform];
  }
  [(TSDShapeLayout *)self pathBoundsWithoutStroke];
  double v8 = v7;
  double v10 = v9;
  CGAffineTransform v11 = objc_msgSend(-[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"), "mutableCopy");
  [v11 size];
  double v13 = v12;
  double v15 = v14;
  if (([v11 widthValid] & 1) == 0 && v5)
  {
    [v11 setWidthValid:1];
    double v13 = v8;
  }
  if (([v11 heightValid] & 1) == 0 && v4)
  {
    [v11 setHeightValid:1];
    double v15 = v10;
  }
  objc_msgSend(v11, "setSize:", v13, v15);
  float64x2_t v21 = 0u;
  float64x2_t v22 = 0u;
  float64x2_t v20 = 0u;
  if (self) {
    -[TSWPShapeLayout autosizedTransformForInfoGeometry:](self, "autosizedTransformForInfoGeometry:", v11, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  }

  double v16 = *(double *)(MEMORY[0x263F00148] + 8);
  float64x2_t v17 = vaddq_f64(v25, vmlaq_n_f64(vmulq_n_f64(v24, v16), v23, *MEMORY[0x263F00148]));
  double v18 = TSDSubtractPoints(v17.f64[0], v17.f64[1], vaddq_f64(v22, vmlaq_n_f64(vmulq_n_f64(v21, v16), v20, *MEMORY[0x263F00148])).f64[0]);
  result.CGFloat y = v19;
  result.double x = v18;
  return result;
}

- (id)pathSource
{
  if (self->_containedLayout && [(TSWPShapeLayout *)self autosizes])
  {
    [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self->_containedLayout geometry] size];
    double v4 = v3;
    double v6 = v5;
    double v7 = objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "stroke");
    if (v7)
    {
      double v8 = v7;
      if ([v7 shouldRender])
      {
        [v8 width];
        double v4 = v4 + v9;
        [v8 width];
        double v6 = v6 + v10;
      }
    }
    CGAffineTransform v11 = objc_msgSend((id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource"), "copy");
    objc_msgSend(v11, "setNaturalSize:", v4, v6);
    return v11;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TSWPShapeLayout;
    return [(TSDShapeLayout *)&v13 pathSource];
  }
}

- (void)processChangedProperty:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeLayout;
  -[TSDShapeLayout processChangedProperty:](&v5, sel_processChangedProperty_);
  if (a3 == 517)
  {
LABEL_4:

    self->_cachedInteriorWrapPolygon = 0;
    [(TSWPLayout *)self->_containedLayout invalidateSize];
    return;
  }
  if (a3 != 153)
  {
    if (a3 != 146) {
      return;
    }
    goto LABEL_4;
  }
  [(TSWPLayoutManager *)[(TSWPLayout *)self->_containedLayout layoutManager] clearTypesetterCache];
  [(TSWPLayout *)self->_containedLayout invalidateTextLayout];

  self->_cachedInteriorWrapPolygon = 0;
}

- (void)setGeometry:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)TSWPShapeLayout;
  [(TSDShapeLayout *)&v21 setGeometry:a3];
  if (self->_containedLayout && [(TSWPShapeLayout *)self autosizes])
  {
    [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self->_containedLayout geometry] size];
    double v5 = v4;
    double v7 = v6;
    [(TSDShapeLayout *)self pathBounds];
    double v9 = v8;
    double v11 = v10;
    double v12 = -v8;
    double v13 = -v10;
    double v14 = objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "stroke");
    if (v14)
    {
      double v15 = v14;
      if ([v14 shouldRender])
      {
        [v15 width];
        double v17 = v16 * 0.5;
        double v12 = v17 - v9;
        double v13 = v17 - v11;
      }
    }
    double v18 = [TSDLayoutGeometry alloc];
    CGAffineTransformMakeTranslation(&v20, v12, v13);
    double v19 = -[TSDLayoutGeometry initWithSize:transform:](v18, "initWithSize:transform:", &v20, v5, v7);
    [(TSDAbstractLayout *)self->_containedLayout setGeometry:v19];
  }
}

- (CGSize)adjustedInsets
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v4 = (void *)[(TSDInfo *)[(TSDLayout *)self info] padding];
  if (v4)
  {
    double v5 = v4;
    [v4 leftInset];
    double v2 = v6;
    [v5 topInset];
    double v3 = v7;
  }
  double v8 = v2;
  double v9 = v3;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  double v2 = (void *)[(TSDInfo *)[(TSDLayout *)self info] columns];
  if (!v2) {
    return 1;
  }

  return [v2 columnCount];
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  double v6 = (void *)[(TSDInfo *)[(TSDLayout *)self info] columns];
  if (!v6) {
    return 0.0;
  }

  [v6 widthForColumnIndex:a3 bodyWidth:a4];
  return result;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  double v6 = (void *)[(TSDInfo *)[(TSDLayout *)self info] columns];
  if (!v6) {
    return 0.0;
  }

  [v6 gapForColumnIndex:a3 bodyWidth:a4];
  return result;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  double v11 = (void *)[(TSDInfo *)[(TSDLayout *)self info] columns];
  double v12 = (void *)[(TSDInfo *)[(TSDLayout *)self info] padding];
  if (v12)
  {
    [v12 leftInset];
    double v14 = v13;
    if (v11)
    {
LABEL_3:
      objc_msgSend(v11, "positionForColumnIndex:bodyWidth:outWidth:outGap:", a3, a5, a6, fmax(a4 + v14 * -2.0, 0.0));
      return v14 + v15;
    }
  }
  else
  {
    double v14 = 0.0;
    if (v11) {
      goto LABEL_3;
    }
  }
  if (a5) {
    *a5 = a4 + v14 * -2.0;
  }
  if (a6) {
    *a6 = 0.0;
  }
  return v14;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  double v2 = [(TSDLayout *)self info];

  return [(TSDInfo *)v2 shrinkTextToFit];
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (TSWPLayout)containedLayout
{
  return self->_containedLayout;
}

- (TSWPShapeLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSWPShapeLayoutDelegate *)a3;
}

@end