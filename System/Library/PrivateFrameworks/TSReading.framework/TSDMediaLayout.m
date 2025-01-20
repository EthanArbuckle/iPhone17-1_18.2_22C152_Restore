@interface TSDMediaLayout
- (BOOL)isStrokeBeingManipulated;
- (BOOL)shouldRenderFrameStroke;
- (BOOL)supportsRotation;
- (CGRect)alignmentFrame;
- (CGRect)alignmentFrameInRoot;
- (CGRect)boundsForStandardKnobs;
- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3;
- (TSDMediaLayout)initWithInfo:(id)a3;
- (id)mediaInfo;
- (id)stroke;
- (void)dynamicStrokeWidthChangeDidBegin;
- (void)dynamicStrokeWidthChangeDidEnd;
- (void)dynamicStrokeWidthUpdateToValue:(double)a3;
- (void)invalidateAlignmentFrame;
- (void)processChangedProperty:(int)a3;
- (void)setBoundsForStandardKnobs:(CGRect)a3;
- (void)setGeometry:(id)a3;
- (void)setShouldRenderFrameStroke:(BOOL)a3;
@end

@implementation TSDMediaLayout

- (CGRect)boundsForStandardKnobs
{
  double x = self->mBoundsForStandardKnobs.origin.x;
  double y = self->mBoundsForStandardKnobs.origin.y;
  double width = self->mBoundsForStandardKnobs.size.width;
  double height = self->mBoundsForStandardKnobs.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundsForStandardKnobs:(CGRect)a3
{
  self->mBoundsForStandardKnobs = a3;
}

- (BOOL)shouldRenderFrameStroke
{
  return self->mShouldRenderFrameStroke;
}

- (void)setShouldRenderFrameStroke:(BOOL)a3
{
  self->mShouldRenderFrameStroke = a3;
}

- (BOOL)supportsRotation
{
  return 0;
}

- (void)processChangedProperty:(int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSDMediaLayout;
  -[TSDDrawableLayout processChangedProperty:](&v7, sel_processChangedProperty_);
  if (a3 == 517)
  {
    [(TSDLayout *)self invalidateFrame];
    [(TSDMediaLayout *)self invalidateAlignmentFrame];
    if (([(TSDInfo *)[(TSDLayout *)self info] isInlineWithText] & 1) != 0
      || [(TSDInfo *)[(TSDLayout *)self info] isAnchoredToText])
    {
      v5 = [(TSDAbstractLayout *)self parent];
      if (v5)
      {
        v6 = v5;
        while ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v6 = [(TSDAbstractLayout *)v6 parent];
          if (!v6) {
            return;
          }
        }
        [(TSDAbstractLayout *)v6 wrappableChildInvalidated:self];
      }
    }
  }
}

- (TSDMediaLayout)initWithInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDMediaLayout;
  CGRect result = [(TSDLayout *)&v4 initWithInfo:a3];
  if (result) {
    *(unsigned char *)&result->mMediaInvalidFlags |= 1u;
  }
  return result;
}

- (id)mediaInfo
{
  objc_opt_class();
  [(TSDLayout *)self info];

  return (id)TSUDynamicCast();
}

- (BOOL)isStrokeBeingManipulated
{
  return self->mDynamicStroke != 0;
}

- (id)stroke
{
  if (self->mDynamicStroke) {
    return self->mDynamicStroke;
  }
  id v3 = [(TSDMediaLayout *)self mediaInfo];

  return (id)[v3 stroke];
}

- (void)dynamicStrokeWidthChangeDidBegin
{
  self->mDynamicStroke = (TSDMutableStroke *)objc_msgSend((id)objc_msgSend(-[TSDMediaLayout mediaInfo](self, "mediaInfo"), "stroke"), "mutableCopy");
}

- (void)dynamicStrokeWidthUpdateToValue:(double)a3
{
  BOOL v5 = [(TSDStroke *)self->mDynamicStroke isFrame];
  mDynamicStroke = self->mDynamicStroke;
  if (v5) {
    [(TSDMutableStroke *)mDynamicStroke setAssetScale:a3];
  }
  else {
    [(TSDMutableStroke *)mDynamicStroke setWidth:a3];
  }
  [(TSDMediaLayout *)self processChangedProperty:517];
  objc_super v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "repForLayout:", self);

  [v7 processChangedProperty:517];
}

- (void)dynamicStrokeWidthChangeDidEnd
{
  self->mDynamicStroke = 0;
}

- (void)setGeometry:(id)a3
{
  if ((*(unsigned char *)&self->mMediaInvalidFlags & 1) == 0)
  {
    BOOL v5 = [(TSDAbstractLayout *)self geometry];
    if (v5
      && (v6 = v5, ![(TSDLayoutGeometry *)v5 differsInMoreThanTranslationFrom:a3]))
    {
      if (a3)
      {
        [a3 transform];
        double v8 = *((double *)&v16 + 1);
        double v7 = *(double *)&v16;
        double v10 = *((double *)&v17 + 1);
        double v9 = *(double *)&v17;
        double v11 = *((double *)&v18 + 1);
        double v12 = *(double *)&v18;
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v16 = 0u;
        double v11 = 0.0;
        double v10 = 0.0;
        double v8 = 0.0;
        double v12 = 0.0;
        double v9 = 0.0;
        double v7 = 0.0;
      }
      [(TSDLayoutGeometry *)v6 transform];
      if ((*(unsigned char *)&self->mMediaInvalidFlags & 1) == 0)
      {
        double v13 = TSDSubtractPoints(v12 + *(double *)(MEMORY[0x263F00148] + 8) * v9 + v7 * *MEMORY[0x263F00148], v11 + *(double *)(MEMORY[0x263F00148] + 8) * v10 + v8 * *MEMORY[0x263F00148], vaddq_f64((float64x2_t)v15[3], vmlaq_n_f64(vmulq_n_f64((float64x2_t)v15[2], *(double *)(MEMORY[0x263F00148] + 8)), (float64x2_t)v15[1], *MEMORY[0x263F00148])).f64[0]);
        self->mCachedAlignmentFrame.origin.double x = TSDAddPoints(self->mCachedAlignmentFrame.origin.x, self->mCachedAlignmentFrame.origin.y, v13);
        self->mCachedAlignmentFrame.origin.double y = v14;
      }
    }
    else
    {
      [(TSDMediaLayout *)self invalidateAlignmentFrame];
    }
  }
  v15[0].receiver = self;
  v15[0].super_class = (Class)TSDMediaLayout;
  [(objc_super *)v15 setGeometry:a3];
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDMediaLayout computeAlignmentFrameInRoot:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaLayout.m"), 177, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSDMediaLayout computeAlignmentFrameInRoot:]"), 0 reason userInfo]);
}

- (CGRect)alignmentFrame
{
  if (*(unsigned char *)&self->mMediaInvalidFlags)
  {
    p_mCachedAlignmentFrame = &self->mCachedAlignmentFrame;
    [(TSDMediaLayout *)self computeAlignmentFrameInRoot:0];
    p_mCachedAlignmentFrame->origin.double x = v4;
    p_mCachedAlignmentFrame->origin.double y = v5;
    p_mCachedAlignmentFrame->size.double width = v6;
    p_mCachedAlignmentFrame->size.double height = v7;
    *(unsigned char *)&self->mMediaInvalidFlags &= ~1u;
  }
  double x = self->mCachedAlignmentFrame.origin.x;
  double y = self->mCachedAlignmentFrame.origin.y;
  double width = self->mCachedAlignmentFrame.size.width;
  double height = self->mCachedAlignmentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  if (![(TSDAbstractLayout *)self parent]
    || (id v3 = [(TSDAbstractLayout *)self parent],
        v3 == (TSDAbstractLayout *)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "rootLayout")))
  {
    [(TSDMediaLayout *)self alignmentFrame];
  }
  else
  {
    [(TSDMediaLayout *)self computeAlignmentFrameInRoot:1];
  }
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)invalidateAlignmentFrame
{
  *(unsigned char *)&self->mMediaInvalidFlags |= 1u;
  [(TSDDrawableLayout *)self invalidateExteriorWrap];
}

@end