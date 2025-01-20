@interface PXStoryViewModeFocusedClipsViewTransition
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadiusForClipWithInfo:(id *)a3 proposedCornerRadius:(id)a4 inViewMode:(int64_t)a5 layout:(id)a6;
- ($B0175D27BC26B8A5DA33FAD13D27C2F3)contentsTransformOverrideForClipWithInfo:(SEL)a3 proposedOverride:(id *)a4 inViewMode:(id *)a5 layout:(int64_t)a6;
- (CGRect)frameForClipWithInfo:(id *)a3 proposedFrame:(CGRect)a4 inViewMode:(int64_t)a5 layout:(id)a6;
- (NSIndexSet)focusedClipIdentifiers;
- (PXStoryViewModeFocusedClipsViewTransition)initWithSourceViewMode:(int64_t)a3 sourceSnapshot:(id)a4 destinationViewMode:(int64_t)a5 destinationSnapshot:(id)a6 assetReference:(id)a7;
- (PXStoryViewModeFocusedClipsViewTransition)initWithSourceViewMode:(int64_t)a3 sourceSnapshot:(id)a4 destinationViewMode:(int64_t)a5 destinationSnapshot:(id)a6 assetReference:(id)a7 focusedClipIdentifiers:(id)a8 trackingClipIdentifier:(int64_t)a9;
- (double)zPositionForClipWithInfo:(id *)a3 proposedZPosition:(double)a4 inViewMode:(int64_t)a5 layout:(id)a6;
- (int64_t)trackingClipIdentifier;
@end

@implementation PXStoryViewModeFocusedClipsViewTransition

- (void).cxx_destruct
{
}

- (int64_t)trackingClipIdentifier
{
  return self->_trackingClipIdentifier;
}

- (NSIndexSet)focusedClipIdentifiers
{
  return self->_focusedClipIdentifiers;
}

- (double)zPositionForClipWithInfo:(id *)a3 proposedZPosition:(double)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
  if ([(PXStoryViewModeFocusedClipsViewTransition *)self trackingClipIdentifier] == a3->var0) {
    return a4 + a4;
  }
  BOOL v9 = -[NSIndexSet containsIndex:](self->_focusedClipIdentifiers, "containsIndex:");
  double result = a4 * 0.5;
  if (v9) {
    return a4;
  }
  return result;
}

- ($B0175D27BC26B8A5DA33FAD13D27C2F3)contentsTransformOverrideForClipWithInfo:(SEL)a3 proposedOverride:(id *)a4 inViewMode:(id *)a5 layout:(int64_t)a6
{
  long long v9 = *(_OWORD *)&a5->var1.origin.y;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
  *(_OWORD *)&retstr->var1.origin.y = v9;
  retstr->var1.size.height = a5->var1.size.height;
  double result = [(PXStoryViewModeTransition *)self regionOfInterest];
  if (result)
  {
    v11 = result;
    BOOL v12 = [(NSIndexSet *)self->_focusedClipIdentifiers containsIndex:a4->var0];

    if (v12)
    {
      [(PXStoryViewModeTransition *)self sourceViewMode];
      [(PXStoryViewModeTransition *)self destinationViewMode];
      [(PXStoryViewModeTransition *)self fractionCompleted];
      PXFloatSaturate();
    }
  }
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadiusForClipWithInfo:(id *)a3 proposedCornerRadius:(id)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
  uint64_t v6 = *(void *)&a4.var0.var0.var0;
  BOOL v8 = -[NSIndexSet containsIndex:](self->_focusedClipIdentifiers, "containsIndex:", a3->var0, *(void *)&a4.var0.var0.var0, *(void *)&a4.var0.var1[2], a5, a6);
  if (v8)
  {
    if ([(PXStoryViewModeTransition *)self sourceViewMode] != v6)
    {
      v10 = [(PXStoryViewModeTransition *)self regionOfInterest];

      if (v10)
      {
        v11 = [(PXStoryViewModeTransition *)self regionOfInterest];
        BOOL v12 = [v11 imageViewSpec];
        [v12 cornerRadius];
      }
    }
    if ([(PXStoryViewModeTransition *)self destinationViewMode] != v6)
    {
      v13 = [(PXStoryViewModeTransition *)self regionOfInterest];

      if (v13)
      {
        v14 = [(PXStoryViewModeTransition *)self regionOfInterest];
        v15 = [v14 imageViewSpec];
        [v15 cornerRadius];
      }
    }
    [(PXStoryViewModeTransition *)self fractionCompleted];
    PXFloatSaturate();
  }
  *(void *)&result.var0.var1[2] = v9;
  *(void *)&result.var0.var0.var0 = v8;
  return result;
}

- (CGRect)frameForClipWithInfo:(id *)a3 proposedFrame:(CGRect)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a6;
  unint64_t var1 = a3->var1;
  v14 = [(PXStoryViewModeTransition *)self regionOfInterest];
  v15 = [v12 rootLayout];
  v16 = [v15 coordinateSpace];

  if (var1 <= 5 && ((0x32u >> var1) & 1) != 0 && v14 != 0 && v16 != 0)
  {
    v20 = [(PXStoryViewModeFocusedClipsViewTransition *)self focusedClipIdentifiers];
    int v21 = [v20 containsIndex:a3->var0];

    if (v21)
    {
      [v14 rectInCoordinateSpace:v16];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      v30 = [v12 rootLayout];
      objc_msgSend(v12, "convertRect:fromLayout:", v30, v23, v25, v27, v29);

      [(PXStoryViewModeTransition *)self sourceViewMode];
      [(PXStoryViewModeTransition *)self destinationViewMode];
      [(PXStoryViewModeTransition *)self fractionCompleted];
      PXRectByLinearlyInterpolatingRects();
    }
  }

  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (PXStoryViewModeFocusedClipsViewTransition)initWithSourceViewMode:(int64_t)a3 sourceSnapshot:(id)a4 destinationViewMode:(int64_t)a5 destinationSnapshot:(id)a6 assetReference:(id)a7 focusedClipIdentifiers:(id)a8 trackingClipIdentifier:(int64_t)a9
{
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)PXStoryViewModeFocusedClipsViewTransition;
  v17 = [(PXStoryViewModeTransition *)&v20 initWithSourceViewMode:a3 sourceSnapshot:a4 destinationViewMode:a5 destinationSnapshot:a6 assetReference:a7];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_focusedClipIdentifiers, a8);
    v18->_trackingClipIdentifier = a9;
  }

  return v18;
}

- (PXStoryViewModeFocusedClipsViewTransition)initWithSourceViewMode:(int64_t)a3 sourceSnapshot:(id)a4 destinationViewMode:(int64_t)a5 destinationSnapshot:(id)a6 assetReference:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryViewModeTransition.m", 265, @"%s is not available as initializer", "-[PXStoryViewModeFocusedClipsViewTransition initWithSourceViewMode:sourceSnapshot:destinationViewMode:destinationSnapshot:assetReference:]");

  abort();
}

@end