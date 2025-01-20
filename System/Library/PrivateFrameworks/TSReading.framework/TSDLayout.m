@interface TSDLayout
+ (id)descendentWrappablesOfLayout:(id)a3;
- (BOOL)allowsConnections;
- (BOOL)attachmentLayoutDisplacedByDropCap;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)canFlip;
- (BOOL)dependentsRelyOnSize;
- (BOOL)hasFinishedIterativePositioning;
- (BOOL)i_useBaseCapturedAlignmentFrameOriginForInline;
- (BOOL)invalidGeometry;
- (BOOL)isBeingManipulated;
- (BOOL)isBeingTransformed;
- (BOOL)isInGroup;
- (BOOL)isInTopLevelContainerForEditing;
- (BOOL)isStrokeBeingManipulated;
- (BOOL)orderedBefore:(id)a3;
- (BOOL)resizeMayChangeAspectRatio;
- (BOOL)shouldBeDisplayedInShowMode;
- (BOOL)shouldDisplayGuides;
- (BOOL)shouldProvideGuidesDuringExclusiveAlignmentOperation;
- (BOOL)shouldProvideSizingGuides;
- (BOOL)shouldValidate;
- (BOOL)wantsRoundedInlinePosition;
- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3;
- (CGAffineTransform)originalPureTransformInRoot;
- (CGAffineTransform)originalTransformForProvidingGuides;
- (CGAffineTransform)originalTransformInRoot;
- (CGAffineTransform)pureTransformInRoot;
- (CGPoint)alignmentFrameOriginForFixingInterimPosition;
- (CGPoint)capturedInfoPositionForAttachment;
- (CGPoint)centerForConnecting;
- (CGPoint)centerForRotation;
- (CGPoint)infoGeometryPositionForCurrentAttachedLayoutGeometry;
- (CGRect)boundsForStandardKnobs;
- (CGRect)i_takeDirtyRect;
- (CGRect)initialBoundsForStandardKnobs;
- (CGRect)rectForPresentingAnnotationPopoverForSelection:(id)a3;
- (CGRect)rectForSelection:(id)a3;
- (CGSize)maximumFrameSizeForChild:(id)a3;
- (CGSize)maximumSizeForChildLayout:(id)a3;
- (CGSize)minimumSize;
- (Class)repClassOverride;
- (NSSet)connectedLayouts;
- (TSDInfo)info;
- (TSDLayout)initWithInfo:(id)a3;
- (TSDLayoutGeometry)dynamicGeometry;
- (TSDLayoutGeometry)originalGeometry;
- (double)inlineCenteredAlignmentOffset;
- (double)inlineVerticalOffset;
- (double)scaleForInlineClampingUnrotatedSize:(CGSize)a3 withGeometry:(id)a4;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)additionalGuides;
- (id)additionalLayoutsForRepCreation;
- (id)childSearchTargets;
- (id)computeInfoGeometryDuringResize;
- (id)computeInfoGeometryFromLayoutGeometry:(id)a3;
- (id)computeLayoutGeometry;
- (id)dependentLayouts;
- (id)i_layoutGeometryProvider;
- (id)i_wrapPath;
- (id)initialInfoGeometry;
- (id)inspectorGeometry;
- (id)iterativePositioningState;
- (id)layoutController;
- (id)layoutGeometryFromInfo;
- (id)layoutGeometryFromProvider;
- (id)originalPureGeometry;
- (id)pureGeometry;
- (id)pureGeometryInRoot;
- (id)reliedOnLayouts;
- (id)rootLayout;
- (id)searchTarget;
- (id)stroke;
- (int)layoutState;
- (void)addConnectedLayout:(id)a3;
- (void)beginDrag;
- (void)beginDynamicOperation;
- (void)beginResize;
- (void)beginRotate;
- (void)dealloc;
- (void)dragBy:(CGPoint)a3;
- (void)dragByUnscaled:(CGPoint)a3;
- (void)endDynamicOperation;
- (void)finishIterativePositioning;
- (void)i_accumulateLayoutsIntoSet:(id)a3;
- (void)i_setBaseCapturedAlignmentFrameOriginForInline;
- (void)invalidate;
- (void)invalidateChildren;
- (void)invalidateFrame;
- (void)invalidatePosition;
- (void)invalidateSize;
- (void)layoutSearchForAnnotationWithHitBlock:(id)a3;
- (void)p_invalidateConnectedLayouts;
- (void)p_recursiveInvalidate;
- (void)p_registerWithLayoutController:(id)a3;
- (void)p_unregisterWithLayoutController:(id)a3;
- (void)processChangedProperty:(int)a3;
- (void)processChanges:(id)a3;
- (void)removeConnectedLayout:(id)a3;
- (void)setAdjustedInterimPositionX:(double)a3;
- (void)setAdjustedInterimPositionY:(double)a3;
- (void)setDynamicGeometry:(id)a3;
- (void)setIterativePositioningState:(id)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setParent:(id)a3;
- (void)unregisterFromLayoutController;
- (void)validate;
- (void)validateFromLastInterimPosition;
@end

@implementation TSDLayout

- (id)layoutController
{
  id v2 = [(TSDLayout *)self rootLayout];

  return (id)[v2 layoutController];
}

- (id)rootLayout
{
  objc_opt_class();
  [(TSDAbstractLayout *)self root];

  return (id)TSUDynamicCast();
}

- (void)setAdjustedInterimPositionX:(double)a3
{
  if (objc_msgSend((id)-[TSDInfo owningAttachmentNoRecurse](-[TSDLayout info](self, "info"), "owningAttachmentNoRecurse"), "isAnchored"))
  {
    if (objc_opt_respondsToSelector())
    {
      v5 = (void *)[(TSDLayout *)self performSelector:sel_stroke];
      if (!v5)
      {
        double v6 = 0.0;
LABEL_8:
        a3 = a3 - v6;
        goto LABEL_9;
      }
    }
    else
    {
      [(TSDLayout *)self info];
      double v6 = 0.0;
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_8;
      }
      v5 = (void *)[(TSDInfo *)[(TSDLayout *)self info] performSelector:sel_stroke];
      if (!v5) {
        goto LABEL_8;
      }
    }
    [v5 outsets];
    double v6 = v7;
    goto LABEL_8;
  }
LABEL_9:
  if ([(TSDLayout *)self wantsRoundedInlinePosition])
  {
    TSURound();
    a3 = v8;
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDLayout;
  [(TSDAbstractLayout *)&v9 setInterimPositionX:a3];
}

- (void)setAdjustedInterimPositionY:(double)a3
{
  if (objc_msgSend((id)-[TSDInfo owningAttachmentNoRecurse](-[TSDLayout info](self, "info"), "owningAttachmentNoRecurse"), "isAnchored"))
  {
    if (objc_opt_respondsToSelector())
    {
      v5 = (void *)[(TSDLayout *)self performSelector:sel_stroke];
      if (!v5)
      {
        double v6 = 0.0;
LABEL_8:
        a3 = a3 - v6;
        goto LABEL_9;
      }
    }
    else
    {
      [(TSDLayout *)self info];
      double v6 = 0.0;
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_8;
      }
      v5 = (void *)[(TSDInfo *)[(TSDLayout *)self info] performSelector:sel_stroke];
      if (!v5) {
        goto LABEL_8;
      }
    }
    [v5 outsets];
    double v6 = v7;
    goto LABEL_8;
  }
LABEL_9:
  if ([(TSDLayout *)self wantsRoundedInlinePosition])
  {
    TSURound();
    a3 = v8;
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDLayout;
  [(TSDAbstractLayout *)&v9 setInterimPositionY:a3];
}

- (BOOL)wantsRoundedInlinePosition
{
  return 1;
}

- (TSDInfo)info
{
  return self->mInfo;
}

- (TSDLayout)initWithInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDLayout;
  v4 = [(TSDAbstractLayout *)&v6 init];
  if (v4)
  {
    v4->mInfo = (TSDInfo *)a3;
    *(unsigned char *)&v4->mInvalidFlags |= 3u;
  }
  return v4;
}

- (CGPoint)alignmentFrameOriginForFixingInterimPosition
{
  if (self->mLayoutState == 2)
  {
    double x = self->mBaseAlignmentFrameOriginForFixingInterimPosition.x;
    double y = self->mBaseAlignmentFrameOriginForFixingInterimPosition.y;
  }
  else if ([(TSDLayout *)self i_useBaseCapturedAlignmentFrameOriginForInline])
  {
    double v5 = TSDSubtractPoints(self->mCapturedAlignmentFrameOriginForInline.x, self->mCapturedAlignmentFrameOriginForInline.y, self->mBaseCapturedAlignmentFrameOriginForInline.x);
    v9.receiver = self;
    v9.super_class = (Class)TSDLayout;
    [(TSDAbstractLayout *)&v9 alignmentFrameOriginForFixingInterimPosition];
    double x = TSDSubtractPoints(v6, v7, v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TSDLayout;
    [(TSDAbstractLayout *)&v8 alignmentFrameOriginForFixingInterimPosition];
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)i_useBaseCapturedAlignmentFrameOriginForInline
{
  return (self->mLayoutState - 3) < 2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDLayout;
  [(TSDAbstractLayout *)&v3 dealloc];
}

- (TSDLayoutGeometry)dynamicGeometry
{
  if (self->mBaseGeometry) {
    return [(TSDAbstractLayout *)self geometry];
  }
  else {
    return 0;
  }
}

- (void)setDynamicGeometry:(id)a3
{
  if (!self->mBaseGeometry)
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDLayout setDynamicGeometry:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayout.m"), 126, @"setting dynamic geometry when not in dynamic operation");
  }
  [(TSDAbstractLayout *)self setGeometry:a3];
  double v7 = objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas");

  [v7 layoutInvalidated];
}

- (BOOL)shouldValidate
{
  return 1;
}

- (void)finishIterativePositioning
{
  self->mHasFinishedIterativePositioning = 1;
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "invalidateLayout:", self);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(TSDLayout *)self dependentLayouts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(TSDLayout *)self p_invalidateConnectedLayouts];
}

- (void)invalidatePosition
{
  *(unsigned char *)&self->mInvalidFlags |= 1u;
  self->mHasFinishedIterativePositioning = 0;
  [(TSDLayout *)self invalidate];
}

- (void)invalidateSize
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(unsigned char *)&self->mInvalidFlags |= 2u;
  [(TSDLayout *)self invalidate];
  if ([(TSDLayout *)self dependentsRelyOnSize])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = [(TSDLayout *)self dependentLayouts];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidateFrame];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (BOOL)dependentsRelyOnSize
{
  return 0;
}

- (void)invalidateFrame
{
  [(TSDLayout *)self invalidateSize];

  [(TSDLayout *)self invalidatePosition];
}

- (void)invalidateChildren
{
  id v3 = [(TSDLayout *)self layoutController];

  [v3 invalidateChildrenOfLayout:self];
}

- (void)unregisterFromLayoutController
{
  if ([(TSDLayout *)self layoutController])
  {
    id v3 = [(TSDLayout *)self layoutController];
    [(TSDLayout *)self p_unregisterWithLayoutController:v3];
  }
}

- (void)setParent:(id)a3
{
  if ([(TSDAbstractLayout *)self parent] != a3)
  {
    [(TSDLayout *)self parentWillChangeTo:a3];
    uint64_t v5 = [(TSDAbstractLayout *)self root];
    uint64_t v6 = [a3 root];
    if (v5 == (TSDAbstractLayout *)v6)
    {
      v9.receiver = self;
      v9.super_class = (Class)TSDLayout;
      [(TSDAbstractLayout *)&v9 setParent:a3];
    }
    else
    {
      id v7 = [(TSDLayout *)self layoutController];
      if (v7) {
        [(TSDLayout *)self p_unregisterWithLayoutController:v7];
      }
      v9.receiver = self;
      v9.super_class = (Class)TSDLayout;
      [(TSDAbstractLayout *)&v9 setParent:a3];
      id v8 = [(TSDLayout *)self layoutController];
      if (v8)
      {
        [(TSDLayout *)self p_registerWithLayoutController:v8];
        [(TSDLayout *)self p_recursiveInvalidate];
      }
    }
    [(TSDLayout *)self parentDidChange];
    if (v6) {
      [(TSDLayout *)self p_invalidateConnectedLayouts];
    }
  }
}

- (BOOL)invalidGeometry
{
  return (*(unsigned char *)&self->mInvalidFlags & 3) != 0;
}

- (void)validate
{
  if ([(TSDLayout *)self invalidGeometry])
  {
    [(TSDLayout *)self capturedInfoPositionForAttachment];
    self->mCapturedInfoGeometryPositionForInline.double x = v3;
    self->mCapturedInfoGeometryPositionForInline.double y = v4;
    [(TSDAbstractLayout *)self setGeometry:[(TSDLayout *)self computeLayoutGeometry]];
    [(TSDAbstractLayout *)self alignmentFrame];
    self->mCapturedAlignmentFrameOriginForInline.double x = v5;
    self->mCapturedAlignmentFrameOriginForInline.double y = v6;
    *(unsigned char *)&self->mInvalidFlags &= 0xFCu;
  }
}

- (CGPoint)capturedInfoPositionForAttachment
{
  id v2 = (void *)[(TSDInfo *)[(TSDLayout *)self info] geometry];

  [v2 position];
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (id)i_layoutGeometryProvider
{
  id v3 = [(TSDLayout *)self layoutController];

  return (id)[v3 layoutGeometryProviderForLayout:self];
}

- (id)layoutGeometryFromProvider
{
  id v3 = [(TSDLayout *)self i_layoutGeometryProvider];
  if (!v3 || (id result = (id)[v3 layoutGeometryForLayout:self]) == 0)
  {
    return [(TSDLayout *)self layoutGeometryFromInfo];
  }
  return result;
}

- (id)layoutGeometryFromInfo
{
  if (!self->mInfo)
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDLayout layoutGeometryFromInfo]"];
    [v3 handleFailureInFunction:v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayout.m"), 345, @"Layouts must either override computeLayoutGeometry, or have a non-nil info to query for geometry" file lineNumber description];
  }
  CGFloat v5 = [[TSDLayoutGeometry alloc] initWithInfoGeometry:[(TSDInfo *)[(TSDLayout *)self info] geometry]];

  return v5;
}

- (id)computeInfoGeometryFromLayoutGeometry:(id)a3
{
  if (a3) {
    [a3 fullTransform];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  return +[TSDInfoGeometry geometryFromFullTransform:v4];
}

- (void)processChanges:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(a3);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        [v9 details];
        long long v10 = (void *)TSUDynamicCast();
        if (v10)
        {
          long long v11 = (void *)[v10 changedProperties];
          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __28__TSDLayout_processChanges___block_invoke;
          v12[3] = &unk_2646B0F30;
          v12[4] = self;
          [v11 enumeratePropertiesUsingBlock:v12];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

uint64_t __28__TSDLayout_processChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processChangedProperty:a2];
}

- (Class)repClassOverride
{
  return (Class)[(TSDInfo *)self->mInfo repClass];
}

- (CGPoint)infoGeometryPositionForCurrentAttachedLayoutGeometry
{
  if (![(TSDInfo *)[(TSDLayout *)self info] owningAttachment])
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDLayout infoGeometryPositionForCurrentAttachedLayoutGeometry]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayout.m"), 376, @"don't use unless the object is attached");
  }
  double x = self->mCapturedAlignmentFrameOriginForInline.x;
  double v6 = self->mCapturedInfoGeometryPositionForInline.x;
  double y = self->mCapturedInfoGeometryPositionForInline.y;
  [(TSDAbstractLayout *)self alignmentFrame];
  double v9 = v8;
  double v11 = v10;
  double v12 = TSDSubtractPoints(v6, y, x);

  double v13 = TSDAddPoints(v9, v11, v12);
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (BOOL)shouldBeDisplayedInShowMode
{
  return 1;
}

- (BOOL)isInGroup
{
  id v2 = [(TSDAbstractLayout *)self parent];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  do
  {
    char v4 = [(TSDAbstractLayout *)v3 isMemberOfClass:objc_opt_class()];
    if (v4) {
      break;
    }
    id v3 = [(TSDAbstractLayout *)v3 parent];
  }
  while (v3);
  return v4;
}

- (BOOL)isInTopLevelContainerForEditing
{
  id v3 = objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController");
  char v4 = [(TSDAbstractLayout *)self parent];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v3, "topLevelContainerRepForEditing"), "layout");
  BOOL result = 1;
  if (v4 && v4 != (TSDAbstractLayout *)v5)
  {
    do
    {
      char v7 = [(TSDAbstractLayout *)v4 isMemberOfClass:objc_opt_class()];
      if (v7) {
        break;
      }
      uint64_t v8 = [(TSDAbstractLayout *)v4 parent];
      if (!v8) {
        break;
      }
      char v4 = (TSDAbstractLayout *)v8;
    }
    while (v8 != v5);
    return v7 ^ 1;
  }
  return result;
}

- (id)stroke
{
  return 0;
}

- (BOOL)isStrokeBeingManipulated
{
  return 0;
}

- (void)i_setBaseCapturedAlignmentFrameOriginForInline
{
  if ([(TSDInfo *)[(TSDLayout *)self info] owningAttachment]) {
    self->mBaseCapturedAlignmentFrameOriginForInline = self->mCapturedAlignmentFrameOriginForInline;
  }
}

- (void)beginDynamicOperation
{
  p_mInitialBoundsForStandardKnobs = &self->mInitialBoundsForStandardKnobs;
  [(TSDLayout *)self boundsForStandardKnobs];
  p_mInitialBoundsForStandardKnobs->origin.double x = v4;
  p_mInitialBoundsForStandardKnobs->origin.double y = v5;
  p_mInitialBoundsForStandardKnobs->size.width = v6;
  p_mInitialBoundsForStandardKnobs->size.height = v7;
  mBaseGeometrdouble y = self->mBaseGeometry;
  if (mBaseGeometry)
  {
    double v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDLayout beginDynamicOperation]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayout.m"), 503, @"beginning dynamic operation when there is already a base geometry");
    mBaseGeometrdouble y = self->mBaseGeometry;
  }

  self->mBaseGeometrdouble y = (TSDLayoutGeometry *)[(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] copy];
  self->mLayoutState = 1;
}

- (void)endDynamicOperation
{
  if (self->mLayoutState == 2) {
    [(TSDLayout *)self invalidateFrame];
  }
  mBaseGeometrdouble y = self->mBaseGeometry;
  if (mBaseGeometry)
  {

    self->mBaseGeometrdouble y = 0;
  }
  self->mLayoutState = 0;
}

- (BOOL)isBeingTransformed
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController");
  uint64_t v4 = [v3 dynamicOperationController];
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    CGFloat v5 = objc_msgSend((id)objc_msgSend(v3, "dynamicOperationController", 0), "currentlyTransformingReps");
    uint64_t v4 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if ((TSDLayout *)[*(id *)(*((void *)&v10 + 1) + 8 * i) layout] == self)
          {
            LOBYTE(v4) = 1;
            return v4;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        LOBYTE(v4) = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  return v4;
}

- (void)beginDrag
{
  p_mBaseAlignmentFrameOriginForFixingInterimPosition = &self->mBaseAlignmentFrameOriginForFixingInterimPosition;
  [(TSDLayout *)self alignmentFrameOriginForFixingInterimPosition];
  p_mBaseAlignmentFrameOriginForFixingInterimPosition->double x = v4;
  p_mBaseAlignmentFrameOriginForFixingInterimPosition->double y = v5;
  self->mLayoutState = 2;
}

- (void)dragByUnscaled:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(TSDAbstractLayout *)self parent])
  {
    uint64_t v6 = [(TSDAbstractLayout *)self parent];
    if (v6) {
      [(TSDAbstractLayout *)v6 transformInRoot];
    }
    else {
      memset(&v8, 0, sizeof(v8));
    }
    CGAffineTransformInvert(&v9, &v8);
    double x = TSDDeltaApplyAffineTransform((float64x2_t *)&v9, x, y);
    double y = v7;
  }
  -[TSDLayout dragBy:](self, "dragBy:", x, y, *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx);
}

- (void)dragBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    if (!self->mBaseGeometry)
    {
      double v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSDLayout dragBy:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayout.m"), 571, @"invalid nil value for '%s'", "mBaseGeometry");
    }
    -[TSDLayout setDynamicGeometry:](self, "setDynamicGeometry:", -[TSDLayoutGeometry geometryByTranslatingBy:]([(TSDAbstractLayout *)self geometry], "geometryByTranslatingBy:", x, y));
    [(TSDLayout *)self p_invalidateConnectedLayouts];
    CGAffineTransform v9 = objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas");
    [v9 layoutInvalidated];
  }
}

- (CGAffineTransform)originalTransformInRoot
{
  uint64_t v4 = MEMORY[0x263F000D0];
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v4 + 32);
  if (self)
  {
    uint64_t v6 = self;
    do
    {
      objc_opt_class();
      double v7 = (void *)TSUDynamicCast();
      if ([v7 originalGeometry])
      {
        uint64_t v8 = (void *)[v7 originalGeometry];
        if (!v8) {
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t v8 = (void *)[(CGAffineTransform *)v6 geometry];
        if (!v8)
        {
LABEL_7:
          long long v13 = 0u;
          long long v14 = 0u;
          long long v12 = 0u;
          goto LABEL_8;
        }
      }
      long long v9 = *(_OWORD *)&retstr->c;
      v11[0] = *(_OWORD *)&retstr->a;
      v11[1] = v9;
      v11[2] = *(_OWORD *)&retstr->tx;
      [v8 transformByConcatenatingTransformTo:v11];
LABEL_8:
      long long v10 = v13;
      *(_OWORD *)&retstr->a = v12;
      *(_OWORD *)&retstr->c = v10;
      *(_OWORD *)&retstr->tdouble x = v14;
      self = (CGAffineTransform *)[(CGAffineTransform *)v6 parent];
      uint64_t v6 = self;
    }
    while (self);
  }
  return self;
}

- (CGAffineTransform)originalTransformForProvidingGuides
{
  if (self) {
    return (CGAffineTransform *)[(CGAffineTransform *)self originalTransformInRoot];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  double v7 = (void *)[(TSDInfo *)[(TSDLayout *)self info] geometry];
  BOOL result = (CGAffineTransform *)[v7 heightValid];
  if (result
    && (BOOL result = (CGAffineTransform *)[v7 widthValid], result)
    && (BOOL result = (CGAffineTransform *)[v7 size], v9 != 0.0)
    && (BOOL result = (CGAffineTransform *)[v7 size], v10 != 0.0))
  {
    memset(&v21, 0, sizeof(v21));
    id v12 = [(TSDLayout *)self originalPureGeometry];
    if (v12) {
      [v12 fullTransform];
    }
    else {
      memset(&v19, 0, sizeof(v19));
    }
    CGAffineTransformInvert(&t1, &v19);
    long long v13 = (void *)[(TSDInfo *)[(TSDLayout *)self info] geometry];
    if (v13) {
      [v13 fullTransform];
    }
    else {
      memset(&t2, 0, sizeof(t2));
    }
    CGAffineTransformConcat(&v21, &t1, &t2);
    CGAffineTransform v15 = v21;
    CGAffineTransformInvert(&v16, &v15);
    long long v14 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v15.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v15.c = v14;
    *(_OWORD *)&v15.tdouble x = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v17, &v16, &v15);
    CGAffineTransform v15 = v21;
    return CGAffineTransformConcat(retstr, &v17, &v15);
  }
  else
  {
    long long v11 = *(_OWORD *)&a4->c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
    *(_OWORD *)&retstr->c = v11;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&a4->tx;
  }
  return result;
}

- (BOOL)shouldProvideGuidesDuringExclusiveAlignmentOperation
{
  return 0;
}

- (void)beginRotate
{
  self->mLayoutState = 3;
}

- (BOOL)resizeMayChangeAspectRatio
{
  objc_opt_class();
  [(TSDLayout *)self info];
  id v3 = (void *)TSUDynamicCast();
  if (v3) {
    return [v3 aspectRatioLocked] ^ 1;
  }
  else {
    return 1;
  }
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return [(id)TSUDynamicCast() isLocked] ^ 1;
}

- (void)beginResize
{
  self->mLayoutState = 4;
}

- (CGSize)minimumSize
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)maximumSizeForChildLayout:(id)a3
{
  double v3 = INFINITY;
  double v4 = INFINITY;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)isBeingManipulated
{
  return self->mLayoutState != 0;
}

- (CGRect)initialBoundsForStandardKnobs
{
  double x = self->mInitialBoundsForStandardKnobs.origin.x;
  double y = self->mInitialBoundsForStandardKnobs.origin.y;
  double width = self->mInitialBoundsForStandardKnobs.size.width;
  double height = self->mInitialBoundsForStandardKnobs.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)initialInfoGeometry
{
  double v2 = [(TSDLayout *)self info];

  return (id)[(TSDInfo *)v2 geometry];
}

- (id)originalPureGeometry
{
  [(TSDLayout *)self initialBoundsForStandardKnobs];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  memset(&v17, 0, sizeof(v17));
  long long v11 = [(TSDLayout *)self originalGeometry];
  if (v11) {
    [(TSDLayoutGeometry *)v11 transform];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  CGAffineTransformMakeTranslation(&t1, v4, v6);
  CGAffineTransform v14 = v17;
  CGAffineTransformConcat(&v16, &t1, &v14);
  CGAffineTransform v17 = v16;
  id v12 = [TSDLayoutGeometry alloc];
  CGAffineTransform v16 = v17;
  return -[TSDLayoutGeometry initWithSize:transform:](v12, "initWithSize:transform:", &v16, v8, v10);
}

- (id)pureGeometry
{
  [(TSDLayout *)self boundsForStandardKnobs];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  memset(&v17, 0, sizeof(v17));
  long long v11 = [(TSDAbstractLayout *)self geometry];
  if (v11) {
    [(TSDLayoutGeometry *)v11 transform];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  CGAffineTransformMakeTranslation(&t1, v4, v6);
  CGAffineTransform v14 = v17;
  CGAffineTransformConcat(&v16, &t1, &v14);
  CGAffineTransform v17 = v16;
  id v12 = [TSDLayoutGeometry alloc];
  CGAffineTransform v16 = v17;
  return -[TSDLayoutGeometry initWithSize:transform:](v12, "initWithSize:transform:", &v16, v8, v10);
}

- (id)pureGeometryInRoot
{
  id v3 = [(TSDLayout *)self pureGeometry];

  return [(TSDAbstractLayout *)self geometryInRoot:v3];
}

- (id)inspectorGeometry
{
  id v3 = [(TSDLayout *)self pureGeometry];
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v13 = *MEMORY[0x263F000D0];
  long long v14 = v4;
  long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  double v5 = [(TSDAbstractLayout *)self parent];
  if (v5)
  {
    CGFloat v6 = v5;
    do
    {
      if ([(TSDAbstractLayout *)v6 isRootLayoutForInspectorGeometry]) {
        break;
      }
      double v7 = [(TSDAbstractLayout *)v6 geometry];
      if (v7)
      {
        v9[0] = v13;
        v9[1] = v14;
        v9[2] = v15;
        [(TSDLayoutGeometry *)v7 transformByConcatenatingTransformTo:v9];
      }
      else
      {
        long long v11 = 0u;
        long long v12 = 0u;
        long long v10 = 0u;
      }
      long long v13 = v10;
      long long v14 = v11;
      long long v15 = v12;
      CGFloat v6 = [(TSDAbstractLayout *)v6 parent];
    }
    while (v6);
  }
  long long v10 = v13;
  long long v11 = v14;
  long long v12 = v15;
  return (id)[v3 geometryByTransformingBy:&v10];
}

- (CGAffineTransform)pureTransformInRoot
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  id v5 = [(TSDLayout *)self pureGeometry];
  if (v5)
  {
    [v5 transform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  CGRect result = [(TSDAbstractLayout *)self parent];
  if (result)
  {
    double v7 = result;
    do
    {
      double v8 = (void *)[(CGAffineTransform *)v7 geometry];
      if (v8)
      {
        long long v9 = *(_OWORD *)&retstr->c;
        v11[0] = *(_OWORD *)&retstr->a;
        v11[1] = v9;
        v11[2] = *(_OWORD *)&retstr->tx;
        [v8 transformByConcatenatingTransformTo:v11];
      }
      else
      {
        long long v13 = 0u;
        long long v14 = 0u;
        long long v12 = 0u;
      }
      long long v10 = v13;
      *(_OWORD *)&retstr->a = v12;
      *(_OWORD *)&retstr->c = v10;
      *(_OWORD *)&retstr->tdouble x = v14;
      CGRect result = (CGAffineTransform *)[(CGAffineTransform *)v7 parent];
      double v7 = result;
    }
    while (result);
  }
  return result;
}

- (CGAffineTransform)originalPureTransformInRoot
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  id v5 = [(TSDLayout *)self originalPureGeometry];
  if (v5)
  {
    [v5 transform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  CGRect result = [(TSDAbstractLayout *)self parent];
  if (result)
  {
    double v7 = result;
    do
    {
      double v8 = (void *)[(CGAffineTransform *)v7 geometry];
      if (v8)
      {
        long long v9 = *(_OWORD *)&retstr->c;
        v11[0] = *(_OWORD *)&retstr->a;
        v11[1] = v9;
        v11[2] = *(_OWORD *)&retstr->tx;
        [v8 transformByConcatenatingTransformTo:v11];
      }
      else
      {
        long long v13 = 0u;
        long long v14 = 0u;
        long long v12 = 0u;
      }
      long long v10 = v13;
      *(_OWORD *)&retstr->a = v12;
      *(_OWORD *)&retstr->c = v10;
      *(_OWORD *)&retstr->tdouble x = v14;
      CGRect result = (CGAffineTransform *)[(CGAffineTransform *)v7 parent];
      double v7 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)canFlip
{
  return 0;
}

- (void)validateFromLastInterimPosition
{
  objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "validateLayoutWithDependencies:", self);
  if ([(TSDInfo *)[(TSDLayout *)self info] owningAttachment])
  {
    [(TSDAbstractLayout *)self fixTransformFromLastInterimPosition];
  }
}

- (CGRect)boundsForStandardKnobs
{
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];

  double v2 = TSDRectWithSize();
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGPoint)centerForRotation
{
  [(TSDLayout *)self boundsForStandardKnobs];

  double v6 = TSDCenterOfRect(v2, v3, v4, v5);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)centerForConnecting
{
  [(TSDLayout *)self centerForRotation];
  double v11 = v4;
  double v12 = v3;
  CGFloat v5 = [(TSDAbstractLayout *)self geometry];
  if (v5)
  {
    [(TSDLayoutGeometry *)v5 transform];
    float64x2_t v6 = v13;
    float64x2_t v7 = v14;
    float64x2_t v8 = v15;
  }
  else
  {
    float64x2_t v8 = 0uLL;
    float64x2_t v6 = 0uLL;
    float64x2_t v7 = 0uLL;
  }
  float64x2_t v9 = vaddq_f64(v8, vmlaq_n_f64(vmulq_n_f64(v7, v11), v6, v12));
  double v10 = v9.f64[1];
  result.double x = v9.f64[0];
  result.double y = v10;
  return result;
}

- (id)computeInfoGeometryDuringResize
{
  return 0;
}

- (id)computeLayoutGeometry
{
  id v3 = [(TSDLayout *)self layoutGeometryFromProvider];
  objc_opt_class();
  [(TSDAbstractLayout *)self parent];
  if (TSUDynamicCast() && [(TSDLayout *)self layoutState] != 4)
  {
    if ([(TSDLayout *)self layoutState] == 3)
    {
      double v4 = [TSDLayoutGeometry alloc];
      objc_msgSend(-[TSDLayout originalPureGeometry](self, "originalPureGeometry"), "size");
      double v6 = v5;
      double v8 = v7;
      if (v3)
      {
        [v3 transform];
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v21 = 0u;
      }
      float64x2_t v15 = &v21;
      CGAffineTransform v16 = v4;
    }
    else
    {
      [v3 size];
      -[TSDLayout scaleForInlineClampingUnrotatedSize:withGeometry:](self, "scaleForInlineClampingUnrotatedSize:withGeometry:", v3);
      double v10 = v9;
      [v3 size];
      double v6 = TSDMultiplySizeScalar(v11, v12, v10);
      double v8 = v13;
      float64x2_t v14 = [TSDLayoutGeometry alloc];
      if (v3)
      {
        [v3 transform];
      }
      else
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v18 = 0u;
      }
      float64x2_t v15 = &v18;
      CGAffineTransform v16 = v14;
    }
    return -[TSDLayoutGeometry initWithSize:transform:](v16, "initWithSize:transform:", v15, v6, v8, v18, v19, v20, v21, v22, v23);
  }
  return v3;
}

- (double)scaleForInlineClampingUnrotatedSize:(CGSize)a3 withGeometry:(id)a4
{
  objc_opt_class();
  [(TSDAbstractLayout *)self parent];
  double v6 = (void *)TSUDynamicCast();
  double v7 = 1.0;
  if (v6)
  {
    [v6 maximumFrameSizeForChild:self];
    double v9 = v8;
    double v11 = v10;
    double v12 = TSDRectWithSize();
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    if (a4) {
      [a4 transform];
    }
    else {
      memset(v24, 0, sizeof(v24));
    }
    long double v19 = TSDTransformAngle((double *)v24);
    CGAffineTransformMakeRotation(&v25, v19 * 0.0174532925);
    v26.origin.double x = v12;
    v26.origin.double y = v14;
    v26.size.double width = v16;
    v26.size.double height = v18;
    CGRect v27 = CGRectApplyAffineTransform(v26, &v25);
    if (v27.size.width > v9 || v27.size.height > v11)
    {
      float v21 = 1.0;
      float v22 = 1.0;
      if (v27.size.width > v9) {
        float v22 = v9 / v27.size.width;
      }
      if (v27.size.height > v11) {
        float v21 = v11 / v27.size.height;
      }
      return fminf(v22, v21);
    }
  }
  return v7;
}

- (void)processChangedProperty:(int)a3
{
  if (a3 == 513)
  {
    [(TSDLayout *)self invalidatePosition];
  }
  else if (a3 == 512)
  {
    [(TSDLayout *)self invalidateFrame];
  }
}

- (id)searchTarget
{
  return 0;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  return 0;
}

- (id)dependentLayouts
{
  id v3 = [(TSDAbstractLayout *)self parent];

  return [(TSDAbstractLayout *)v3 additionalDependenciesForChildLayout:self];
}

- (id)reliedOnLayouts
{
  return 0;
}

- (id)additionalLayoutsForRepCreation
{
  return (id)[MEMORY[0x263EFF8C0] array];
}

- (CGSize)maximumFrameSizeForChild:(id)a3
{
  double v3 = 1.79769313e308;
  double v4 = 1.79769313e308;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (BOOL)orderedBefore:(id)a3
{
  return 0;
}

- (BOOL)shouldDisplayGuides
{
  return 1;
}

- (BOOL)shouldProvideSizingGuides
{
  if (self) {
    [(TSDAbstractLayout *)self transform];
  }
  else {
    memset(v3, 0, sizeof(v3));
  }
  return TSDIsTransformAxisAlignedWithThreshold((double *)v3, 0.002);
}

- (id)additionalGuides
{
  return 0;
}

- (double)inlineVerticalOffset
{
  return 0.0;
}

- (double)inlineCenteredAlignmentOffset
{
  return 0.0;
}

- (void)setNeedsDisplay
{
  CGSize v2 = *(CGSize *)(MEMORY[0x263F00190] + 16);
  self->mDirtyRect.origin = (CGPoint)*MEMORY[0x263F00190];
  self->mDirtyRect.size = v2;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  self->mDirtyRect = CGRectUnion(self->mDirtyRect, a3);
}

- (BOOL)attachmentLayoutDisplacedByDropCap
{
  return 1;
}

- (void)i_accumulateLayoutsIntoSet:(id)a3
{
  [a3 addObject:self];
  double v6 = [(TSDAbstractLayout *)self children];

  [(NSArray *)v6 makeObjectsPerformSelector:a2 withObject:a3];
}

- (CGRect)i_takeDirtyRect
{
  double x = self->mDirtyRect.origin.x;
  double y = self->mDirtyRect.origin.y;
  double width = self->mDirtyRect.size.width;
  double height = self->mDirtyRect.size.height;
  CGSize v6 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  self->mDirtyRect.origin = (CGPoint)*MEMORY[0x263F001A0];
  self->mDirtyRect.size = v6;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)i_wrapPath
{
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
  double v2 = TSDRectWithSize();

  return +[TSDBezierPath bezierPathWithRect:v2];
}

- (void)p_registerWithLayoutController:(id)a3
{
  objc_msgSend(a3, "i_registerLayout:", self);
  CGSize v6 = [(TSDAbstractLayout *)self children];

  [(NSArray *)v6 makeObjectsPerformSelector:a2 withObject:a3];
}

- (void)p_unregisterWithLayoutController:(id)a3
{
  objc_msgSend(a3, "i_unregisterLayout:", self);
  CGSize v6 = [(TSDAbstractLayout *)self children];

  [(NSArray *)v6 makeObjectsPerformSelector:a2 withObject:a3];
}

- (void)p_recursiveInvalidate
{
  [(TSDLayout *)self invalidate];
  double v4 = [(TSDAbstractLayout *)self children];

  [(NSArray *)v4 makeObjectsPerformSelector:a2];
}

- (void)layoutSearchForAnnotationWithHitBlock:(id)a3
{
  objc_opt_class();
  [(TSDLayout *)self info];
  double v5 = (void *)TSUDynamicCast();
  if ([v5 comment])
  {
    CGSize v6 = +[TSDCanvasSearchReference searchReferenceWithDrawableInfo:v5];
    -[TSDCanvasSearchReference setAnnotation:](v6, "setAnnotation:", [v5 comment]);
    [(TSDLayout *)self calculatePointFromSearchReference:v6];
    -[TSDCanvasSearchReference setSearchReferencePoint:](v6, "setSearchReferencePoint:");
    double v7 = (void (*)(id, TSDCanvasSearchReference *))*((void *)a3 + 2);
    v7(a3, v6);
  }
}

- (id)childSearchTargets
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v2 = [(TSDAbstractLayout *)self children];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  double v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v2);
      }
      double v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
      if (!objc_msgSend((id)objc_msgSend(v8, "info"), "owningAttachment")
        || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "info"), "owningAttachment"), "isSearchable"))
      {
        if (!v5) {
          double v5 = (void *)[MEMORY[0x263EFF980] array];
        }
        [v5 addObject:v8];
      }
    }
    uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

- (CGRect)rectForSelection:(id)a3
{
  [(TSDAbstractLayout *)self frame];
  double v5 = 0.0;
  double v6 = 0.0;
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)rectForPresentingAnnotationPopoverForSelection:(id)a3
{
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];

  double v3 = TSDRectWithSize();
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)allowsConnections
{
  return 0;
}

- (void)addConnectedLayout:(id)a3
{
  mConnectedLayouts = self->mConnectedLayouts;
  if (!mConnectedLayouts)
  {
    mConnectedLayouts = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    self->mConnectedLayouts = mConnectedLayouts;
  }

  [(NSMutableSet *)mConnectedLayouts addObject:a3];
}

- (void)removeConnectedLayout:(id)a3
{
}

- (void)p_invalidateConnectedLayouts
{
  mConnectedLayouts = self->mConnectedLayouts;
  if (mConnectedLayouts && [(NSMutableSet *)mConnectedLayouts count])
  {
    id v4 = (id)[(NSMutableSet *)self->mConnectedLayouts copy];
    [v4 makeObjectsPerformSelector:sel_connectedLayoutInvalidated_ withObject:self];
  }
}

- (TSDLayoutGeometry)originalGeometry
{
  return self->mBaseGeometry;
}

- (int)layoutState
{
  return self->mLayoutState;
}

- (NSSet)connectedLayouts
{
  return &self->mConnectedLayouts->super;
}

- (id)iterativePositioningState
{
  return self->mIterativePositioningState;
}

- (void)setIterativePositioningState:(id)a3
{
}

- (BOOL)hasFinishedIterativePositioning
{
  return self->mHasFinishedIterativePositioning;
}

+ (id)descendentWrappablesOfLayout:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "children"), "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = objc_msgSend(a3, "children", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        long long v11 = (void *)TSUProtocolCast();
        if (v11 && ![v11 wrapContainerMode])
        {
          objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend(v10, "descendentWrappables"));
        }
        else if ([v10 conformsToProtocol:&unk_26D78D8A8])
        {
          [v4 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  return v4;
}

@end