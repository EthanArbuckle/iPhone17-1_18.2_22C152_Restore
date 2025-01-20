@interface PXLivePhotoTrimScrubberSpec
- (BOOL)fallbackToKeyTimeTracking;
- (BOOL)fallbackToPlayheadTracking;
- (BOOL)useMiniScrubberHeight;
- (PXLivePhotoTrimScrubberSpec)init;
- (UIColor)disabledOverlayColor;
- (UIColor)filmstripBorderColor;
- (UIEdgeInsets)filmstripViewInsets;
- (double)filmstripCornerRadius;
- (double)handleAnchorX;
- (double)handleHeight;
- (double)handleTouchDistance;
- (double)handleWidth;
- (double)loupeInnerCornerRadius;
- (double)loupeOuterCornerRadius;
- (double)loupeVerticalInset;
- (double)playheadWidth;
- (double)scrubberHeight;
- (void)_updateScrubberHeight;
- (void)setDisabledOverlayColor:(id)a3;
- (void)setFallbackToKeyTimeTracking:(BOOL)a3;
- (void)setFallbackToPlayheadTracking:(BOOL)a3;
- (void)setFilmstripBorderColor:(id)a3;
- (void)setFilmstripCornerRadius:(double)a3;
- (void)setFilmstripViewInsets:(UIEdgeInsets)a3;
- (void)setHandleAnchorX:(double)a3;
- (void)setHandleHeight:(double)a3;
- (void)setHandleTouchDistance:(double)a3;
- (void)setHandleWidth:(double)a3;
- (void)setLoupeInnerCornerRadius:(double)a3;
- (void)setLoupeOuterCornerRadius:(double)a3;
- (void)setLoupeVerticalInset:(double)a3;
- (void)setPlayheadWidth:(double)a3;
- (void)setScrubberHeight:(double)a3;
- (void)setUseMiniScrubberHeight:(BOOL)a3;
@end

@implementation PXLivePhotoTrimScrubberSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledOverlayColor, 0);
  objc_storeStrong((id *)&self->_filmstripBorderColor, 0);
}

- (BOOL)useMiniScrubberHeight
{
  return self->_useMiniScrubberHeight;
}

- (void)setFallbackToPlayheadTracking:(BOOL)a3
{
  self->_fallbackToPlayheadTracking = a3;
}

- (BOOL)fallbackToPlayheadTracking
{
  return self->_fallbackToPlayheadTracking;
}

- (void)setFallbackToKeyTimeTracking:(BOOL)a3
{
  self->_fallbackToKeyTimeTracking = a3;
}

- (BOOL)fallbackToKeyTimeTracking
{
  return self->_fallbackToKeyTimeTracking;
}

- (void)setDisabledOverlayColor:(id)a3
{
}

- (UIColor)disabledOverlayColor
{
  return self->_disabledOverlayColor;
}

- (void)setFilmstripBorderColor:(id)a3
{
}

- (UIColor)filmstripBorderColor
{
  return self->_filmstripBorderColor;
}

- (void)setFilmstripCornerRadius:(double)a3
{
  self->_filmstripCornerRadius = a3;
}

- (double)filmstripCornerRadius
{
  return self->_filmstripCornerRadius;
}

- (void)setPlayheadWidth:(double)a3
{
  self->_playheadWidth = a3;
}

- (double)playheadWidth
{
  return self->_playheadWidth;
}

- (void)setLoupeInnerCornerRadius:(double)a3
{
  self->_loupeInnerCornerRadius = a3;
}

- (double)loupeInnerCornerRadius
{
  return self->_loupeInnerCornerRadius;
}

- (void)setLoupeOuterCornerRadius:(double)a3
{
  self->_loupeOuterCornerRadius = a3;
}

- (double)loupeOuterCornerRadius
{
  return self->_loupeOuterCornerRadius;
}

- (void)setLoupeVerticalInset:(double)a3
{
  self->_loupeVerticalInset = a3;
}

- (double)loupeVerticalInset
{
  return self->_loupeVerticalInset;
}

- (void)setFilmstripViewInsets:(UIEdgeInsets)a3
{
  self->_filmstripViewInsets = a3;
}

- (UIEdgeInsets)filmstripViewInsets
{
  double top = self->_filmstripViewInsets.top;
  double left = self->_filmstripViewInsets.left;
  double bottom = self->_filmstripViewInsets.bottom;
  double right = self->_filmstripViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHandleAnchorX:(double)a3
{
  self->_handleAnchorX = a3;
}

- (double)handleAnchorX
{
  return self->_handleAnchorX;
}

- (void)setHandleHeight:(double)a3
{
  self->_handleHeight = a3;
}

- (double)handleHeight
{
  return self->_handleHeight;
}

- (void)setHandleWidth:(double)a3
{
  self->_handleWidth = a3;
}

- (double)handleWidth
{
  return self->_handleWidth;
}

- (void)setHandleTouchDistance:(double)a3
{
  self->_handleTouchDistance = a3;
}

- (double)handleTouchDistance
{
  return self->_handleTouchDistance;
}

- (void)setScrubberHeight:(double)a3
{
  self->_scrubberHeight = a3;
}

- (double)scrubberHeight
{
  return self->_scrubberHeight;
}

- (void)_updateScrubberHeight
{
  BOOL v3 = [(PXLivePhotoTrimScrubberSpec *)self useMiniScrubberHeight];
  double v4 = 41.0;
  if (v3) {
    double v4 = 26.0;
  }
  self->_scrubberHeight = v4;
  BOOL v5 = [(PXLivePhotoTrimScrubberSpec *)self useMiniScrubberHeight];
  double v6 = 51.0;
  if (v5) {
    double v6 = 36.0;
  }
  self->_handleHeight = v6;
  BOOL v7 = [(PXLivePhotoTrimScrubberSpec *)self useMiniScrubberHeight];
  double v8 = 4.0;
  if (v7) {
    double v8 = 2.0;
  }
  self->_playheadWidth = v8;
}

- (void)setUseMiniScrubberHeight:(BOOL)a3
{
  if (self->_useMiniScrubberHeight != a3)
  {
    self->_useMiniScrubberHeight = a3;
    [(PXLivePhotoTrimScrubberSpec *)self _updateScrubberHeight];
  }
}

- (PXLivePhotoTrimScrubberSpec)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXLivePhotoTrimScrubberSpec;
  v2 = [(PXLivePhotoTrimScrubberSpec *)&v8 init];
  BOOL v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_scrubberHeight = xmmword_1AB359FF0;
    *(_OWORD *)&v2->_handleWidth = xmmword_1AB359FE0;
    *(_OWORD *)&v2->_filmstripViewInsets.double top = xmmword_1AB35A000;
    *(_OWORD *)&v2->_filmstripViewInsets.double bottom = xmmword_1AB35A000;
    *(_OWORD *)&v2->_handleAnchorX = xmmword_1AB35A010;
    *(_OWORD *)&v2->_loupeOuterCornerRadius = xmmword_1AB35A020;
    filmstripBorderColor = v2->_filmstripBorderColor;
    v2->_filmstripCornerRadius = 0.0;
    v2->_filmstripBorderColor = 0;

    uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
    disabledOverlayColor = v3->_disabledOverlayColor;
    v3->_disabledOverlayColor = (UIColor *)v5;

    *(_WORD *)&v3->_fallbackToKeyTimeTracking = 257;
    v3->_playheadWidth = 4.0;
  }
  return v3;
}

@end