@interface PXLivePhotoTrimScrubberSnapStripControllerSpec
- (BOOL)alwaysShowKeyTime;
- (BOOL)livePortraitStyle;
- (BOOL)showDefaultKeyTime;
- (PXLivePhotoTrimScrubberSnapStripControllerSpec)init;
- (UIColor)currentPositionMarkerColor;
- (UIColor)disabledColor;
- (UIColor)originalPositionMarkerColor;
- (UIColor)suggestedMarkerColor;
- (void)setAlwaysShowKeyTime:(BOOL)a3;
- (void)setCurrentPositionMarkerColor:(id)a3;
- (void)setDisabledColor:(id)a3;
- (void)setLivePortraitStyle:(BOOL)a3;
- (void)setOriginalPositionMarkerColor:(id)a3;
- (void)setShowDefaultKeyTime:(BOOL)a3;
- (void)setSuggestedMarkerColor:(id)a3;
@end

@implementation PXLivePhotoTrimScrubberSnapStripControllerSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedMarkerColor, 0);
  objc_storeStrong((id *)&self->_originalPositionMarkerColor, 0);
  objc_storeStrong((id *)&self->_currentPositionMarkerColor, 0);
  objc_storeStrong((id *)&self->_disabledColor, 0);
}

- (void)setLivePortraitStyle:(BOOL)a3
{
  self->_livePortraitStyle = a3;
}

- (BOOL)livePortraitStyle
{
  return self->_livePortraitStyle;
}

- (void)setShowDefaultKeyTime:(BOOL)a3
{
  self->_showDefaultKeyTime = a3;
}

- (BOOL)showDefaultKeyTime
{
  return self->_showDefaultKeyTime;
}

- (void)setAlwaysShowKeyTime:(BOOL)a3
{
  self->_alwaysShowKeyTime = a3;
}

- (BOOL)alwaysShowKeyTime
{
  return self->_alwaysShowKeyTime;
}

- (void)setSuggestedMarkerColor:(id)a3
{
}

- (UIColor)suggestedMarkerColor
{
  return self->_suggestedMarkerColor;
}

- (void)setOriginalPositionMarkerColor:(id)a3
{
}

- (UIColor)originalPositionMarkerColor
{
  return self->_originalPositionMarkerColor;
}

- (void)setCurrentPositionMarkerColor:(id)a3
{
}

- (UIColor)currentPositionMarkerColor
{
  return self->_currentPositionMarkerColor;
}

- (void)setDisabledColor:(id)a3
{
}

- (UIColor)disabledColor
{
  return self->_disabledColor;
}

- (PXLivePhotoTrimScrubberSnapStripControllerSpec)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXLivePhotoTrimScrubberSnapStripControllerSpec;
  v2 = [(PXLivePhotoTrimScrubberSnapStripControllerSpec *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] darkGrayColor];
    disabledColor = v2->_disabledColor;
    v2->_disabledColor = (UIColor *)v3;

    uint64_t v5 = [MEMORY[0x1E4FB1618] lightGrayColor];
    originalPositionMarkerColor = v2->_originalPositionMarkerColor;
    v2->_originalPositionMarkerColor = (UIColor *)v5;

    uint64_t v7 = [MEMORY[0x1E4FB1618] whiteColor];
    currentPositionMarkerColor = v2->_currentPositionMarkerColor;
    v2->_currentPositionMarkerColor = (UIColor *)v7;

    *(_WORD *)&v2->_alwaysShowKeyTime = 257;
  }
  return v2;
}

@end