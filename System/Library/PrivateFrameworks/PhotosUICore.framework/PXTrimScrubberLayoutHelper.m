@interface PXTrimScrubberLayoutHelper
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeForOffsetInScrubberSpace:(SEL)a3;
- (BOOL)needsUpdate;
- (CGRect)durationInsetFilmstripFrame;
- (CGRect)filmstripFrame;
- (CGRect)filmstripFrameInScrubberSpace;
- (CGRect)viewportFrame;
- (CGRect)visibleFrameInFilmstripSpace;
- (PXTrimScrubberLayoutHelper)init;
- (UIEdgeInsets)horizontalTimelineInset;
- (double)filmstripScale;
- (double)offsetInScrubberSpaceForTime:(id *)a3;
- (double)offsetInScrubberSpaceForTime:(id *)a3 fallbackAnchor:(double)a4;
- (double)offsetInViewportSpaceForTime:(id *)a3;
- (double)offsetInViewportSpaceForTime:(id *)a3 fallbackAnchor:(double)a4;
- (double)pivotAnchor;
- (void)_updateIfNeeded;
- (void)setDuration:(id *)a3;
- (void)setFilmstripFrame:(CGRect)a3;
- (void)setFilmstripFrameInScrubberSpace:(CGRect)a3;
- (void)setFilmstripScale:(double)a3;
- (void)setHorizontalTimelineInset:(UIEdgeInsets)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setPivotAnchor:(double)a3;
- (void)setViewportFrame:(CGRect)a3;
- (void)setVisibleFrameInFilmstripSpace:(CGRect)a3;
@end

@implementation PXTrimScrubberLayoutHelper

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setHorizontalTimelineInset:(UIEdgeInsets)a3
{
  self->_horizontalTimelineInset = a3;
}

- (UIEdgeInsets)horizontalTimelineInset
{
  double top = self->_horizontalTimelineInset.top;
  double left = self->_horizontalTimelineInset.left;
  double bottom = self->_horizontalTimelineInset.bottom;
  double right = self->_horizontalTimelineInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setVisibleFrameInFilmstripSpace:(CGRect)a3
{
  self->_visibleFrameInFilmstripSpace = a3;
}

- (void)setFilmstripFrameInScrubberSpace:(CGRect)a3
{
  self->_filmstripFrameInScrubberSpace = a3;
}

- (void)setFilmstripFrame:(CGRect)a3
{
  self->_filmstripFrame = a3;
}

- (double)pivotAnchor
{
  return self->_pivotAnchor;
}

- (double)filmstripScale
{
  return self->_filmstripScale;
}

- (CGRect)viewportFrame
{
  double x = self->_viewportFrame.origin.x;
  double y = self->_viewportFrame.origin.y;
  double width = self->_viewportFrame.size.width;
  double height = self->_viewportFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (CGRect)durationInsetFilmstripFrame
{
  [(PXTrimScrubberLayoutHelper *)self horizontalTimelineInset];
  double v4 = v3;
  double v6 = v5;
  [(PXTrimScrubberLayoutHelper *)self filmstripFrame];
  double v9 = v4 + v8;
  double v11 = v10 + 0.0;
  double v13 = v12 - (v4 + v6);
  result.size.double height = v7;
  result.size.double width = v13;
  result.origin.double y = v11;
  result.origin.double x = v9;
  return result;
}

- (void)_updateIfNeeded
{
  if ([(PXTrimScrubberLayoutHelper *)self needsUpdate])
  {
    [(PXTrimScrubberLayoutHelper *)self setNeedsUpdate:0];
    [(PXTrimScrubberLayoutHelper *)self viewportFrame];
    CGRectGetWidth(v3);
    [(PXTrimScrubberLayoutHelper *)self filmstripScale];
    [(PXTrimScrubberLayoutHelper *)self pivotAnchor];
    PXMapValueFromRangeToNewRange();
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeForOffsetInScrubberSpace:(SEL)a3
{
  double v7 = (CMTime *)MEMORY[0x1E4F1FA48];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  CGRect result = [(PXTrimScrubberLayoutHelper *)self duration];
  if ((v28 & 0x1D) == 1)
  {
    [(PXTrimScrubberLayoutHelper *)self duration];
    CMTime time2 = *v7;
    CGRect result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &time2);
    if ((int)result >= 1)
    {
      [(PXTrimScrubberLayoutHelper *)self viewportFrame];
      double v9 = a4 - CGRectGetMinX(v29);
      [(PXTrimScrubberLayoutHelper *)self durationInsetFilmstripFrame];
      CGFloat x = v30.origin.x;
      CGFloat y = v30.origin.y;
      CGFloat width = v30.size.width;
      CGFloat height = v30.size.height;
      if (v9 <= CGRectGetMinX(v30))
      {
        *(_OWORD *)&retstr->var0 = *(_OWORD *)&v7->value;
        CMTimeEpoch epoch = v7->epoch;
      }
      else
      {
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        if (v9 >= CGRectGetMaxX(v31))
        {
          CGRect result = [(PXTrimScrubberLayoutHelper *)self duration];
          *(_OWORD *)&retstr->var0 = *(_OWORD *)&time2.value;
          CMTimeEpoch epoch = time2.epoch;
        }
        else
        {
          v32.origin.CGFloat x = x;
          v32.origin.CGFloat y = y;
          v32.size.CGFloat width = width;
          v32.size.CGFloat height = height;
          double v14 = v9 - CGRectGetMinX(v32);
          v33.origin.CGFloat x = x;
          v33.origin.CGFloat y = y;
          v33.size.CGFloat width = width;
          v33.size.CGFloat height = height;
          double v15 = v14 / CGRectGetWidth(v33);
          [(PXTrimScrubberLayoutHelper *)self duration];
          Float64 v16 = v15 * CMTimeGetSeconds(&time);
          [(PXTrimScrubberLayoutHelper *)self duration];
          CMTimeMakeWithSeconds(&time2, v16, preferredTimescale);
          *(CMTime *)retstr = time2;
          memset(&time2, 0, sizeof(time2));
          [(PXTrimScrubberLayoutHelper *)self duration];
          CMTimeMake(&rhs, 1, 60);
          CMTimeSubtract(&v23, &lhs, &rhs);
          CMTime v20 = *v7;
          CMTimeMaximum(&time2, &v20, &v23);
          CMTime v19 = *v7;
          $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *retstr;
          CMTimeMaximum(&v20, &v19, (CMTime *)&v18);
          *(CMTime *)retstr = v20;
          CMTime v19 = time2;
          $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *retstr;
          CGRect result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMinimum(&v20, &v19, (CMTime *)&v18);
          *(_OWORD *)&retstr->var0 = *(_OWORD *)&v20.value;
          CMTimeEpoch epoch = v20.epoch;
        }
      }
      retstr->var3 = epoch;
    }
  }
  return result;
}

- (double)offsetInViewportSpaceForTime:(id *)a3 fallbackAnchor:(double)a4
{
  if ((a3->var2 & 0x1D) == 1)
  {
    [(PXTrimScrubberLayoutHelper *)self duration];
    if ((v12 & 0x1D) == 1)
    {
      [(PXTrimScrubberLayoutHelper *)self duration];
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        CMTime time2 = (CMTime)*a3;
        CMTimeGetSeconds(&time2);
        [(PXTrimScrubberLayoutHelper *)self duration];
        CMTimeGetSeconds(&time);
        PXClamp();
      }
    }
  }
  [(PXTrimScrubberLayoutHelper *)self durationInsetFilmstripFrame];
  double v7 = a4 * CGRectGetWidth(v13);
  [(PXTrimScrubberLayoutHelper *)self durationInsetFilmstripFrame];
  return v7 + CGRectGetMinX(v14);
}

- (double)offsetInViewportSpaceForTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(PXTrimScrubberLayoutHelper *)self offsetInViewportSpaceForTime:&v4 fallbackAnchor:0.0];
  return result;
}

- (double)offsetInScrubberSpaceForTime:(id *)a3 fallbackAnchor:(double)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  [(PXTrimScrubberLayoutHelper *)self offsetInViewportSpaceForTime:&v8 fallbackAnchor:a4];
  double v6 = v5;
  [(PXTrimScrubberLayoutHelper *)self viewportFrame];
  return v6 + CGRectGetMinX(v9);
}

- (double)offsetInScrubberSpaceForTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(PXTrimScrubberLayoutHelper *)self offsetInScrubberSpaceForTime:&v4 fallbackAnchor:0.0];
  return result;
}

- (CGRect)visibleFrameInFilmstripSpace
{
  [(PXTrimScrubberLayoutHelper *)self _updateIfNeeded];
  double x = self->_visibleFrameInFilmstripSpace.origin.x;
  double y = self->_visibleFrameInFilmstripSpace.origin.y;
  double width = self->_visibleFrameInFilmstripSpace.size.width;
  double height = self->_visibleFrameInFilmstripSpace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)filmstripFrameInScrubberSpace
{
  [(PXTrimScrubberLayoutHelper *)self _updateIfNeeded];
  double x = self->_filmstripFrameInScrubberSpace.origin.x;
  double y = self->_filmstripFrameInScrubberSpace.origin.y;
  double width = self->_filmstripFrameInScrubberSpace.size.width;
  double height = self->_filmstripFrameInScrubberSpace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)filmstripFrame
{
  [(PXTrimScrubberLayoutHelper *)self _updateIfNeeded];
  double x = self->_filmstripFrame.origin.x;
  double y = self->_filmstripFrame.origin.y;
  double width = self->_filmstripFrame.size.width;
  double height = self->_filmstripFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPivotAnchor:(double)a3
{
  if (self->_pivotAnchor != a3)
  {
    self->_pivotAnchor = a3;
    [(PXTrimScrubberLayoutHelper *)self setNeedsUpdate:1];
  }
}

- (void)setFilmstripScale:(double)a3
{
  if (self->_filmstripScale != a3)
  {
    self->_filmstripScale = a3;
    [(PXTrimScrubberLayoutHelper *)self setNeedsUpdate:1];
  }
}

- (void)setViewportFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_viewportFrame, a3))
  {
    self->_viewportFrame.origin.CGFloat x = x;
    self->_viewportFrame.origin.CGFloat y = y;
    self->_viewportFrame.size.CGFloat width = width;
    self->_viewportFrame.size.CGFloat height = height;
    [(PXTrimScrubberLayoutHelper *)self setNeedsUpdate:1];
  }
}

- (void)setDuration:(id *)a3
{
  if ((a3->var2 & 0x1D) == 1)
  {
    CMTime time1 = (CMTime)self->_duration;
    CMTime v6 = *(CMTime *)a3;
    if (CMTimeCompare(&time1, &v6))
    {
      CMTime time1 = (CMTime)*a3;
      CMTime v6 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if ((CMTimeCompare(&time1, &v6) & 0x80000000) == 0)
      {
        long long v5 = *(_OWORD *)&a3->var0;
        self->_duration.CMTimeEpoch epoch = a3->var3;
        *(_OWORD *)&self->_duration.value = v5;
        [(PXTrimScrubberLayoutHelper *)self setNeedsUpdate:1];
      }
    }
  }
}

- (PXTrimScrubberLayoutHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXTrimScrubberLayoutHelper;
  CGRect result = [(PXTrimScrubberLayoutHelper *)&v6 init];
  if (result)
  {
    long long v3 = *MEMORY[0x1E4F1FA48];
    result->_duration.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    CGPoint v4 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    result->_viewportFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    result->_viewportFrame.size = v5;
    *(_OWORD *)&result->_filmstripScale = xmmword_1AB2F4880;
    *(_OWORD *)&result->_duration.value = v3;
    result->_filmstripFrame.origin = v4;
    result->_filmstripFrame.size = v5;
  }
  return result;
}

@end