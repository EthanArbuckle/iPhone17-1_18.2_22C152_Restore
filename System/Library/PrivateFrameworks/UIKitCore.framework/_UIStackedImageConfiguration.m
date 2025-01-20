@interface _UIStackedImageConfiguration
+ (id)newAppIconConfiguration;
+ (id)newStandardConfiguration;
- (BOOL)adjustMotionForSize;
- (BOOL)allowsNonOpaqueShadow;
- (BOOL)boostBrightness;
- (BOOL)disableMask;
- (BOOL)flatImageContainsCornerRadius;
- (BOOL)focusCursorEnabled;
- (BOOL)fullBleedCenteredGrowth;
- (BOOL)hueShift;
- (BOOL)isEqual:(id)a3;
- (BOOL)overlayFixedFrame;
- (BOOL)useSeparateUnfocusedShadowImage;
- (CGPoint)translationOffset;
- (UIImage)placeholderImage;
- (_UIFocusAnimationConfiguration)focusAnimationConfiguration;
- (_UIStackedImageConfiguration)init;
- (double)cornerRadius;
- (double)defaultFocusedShadowOpacity;
- (double)defaultFocusedShadowRadius;
- (double)defaultFocusedShadowVerticalOffset;
- (double)defaultHighlightedShadowOpacity;
- (double)defaultHighlightedShadowRadius;
- (double)defaultHighlightedShadowVerticalOffset;
- (double)defaultSelectedShadowVerticalOffset;
- (double)defaultUnfocusedShadowOpacity;
- (double)defaultUnfocusedShadowRadius;
- (double)defaultUnfocusedShadowVerticalOffset;
- (double)focusCursorBorderWidth;
- (double)focusCursorShadowOpacityAdjustment;
- (double)fullBleedFocusedShadowOpacity;
- (double)fullBleedFocusedShadowRadius;
- (double)fullBleedOffset;
- (double)fullBleedUnfocusedShadowOpacity;
- (double)fullBleedUnfocusedShadowRadius;
- (double)isContinuousCornerRadiusEnabled;
- (double)layerSelectionDuration;
- (double)layerUnselectionDuration;
- (double)maximumParallaxDepth;
- (double)minimumFocusDuration;
- (double)overlayDepth;
- (double)pressedDuration;
- (double)pressedScaleAdjustment;
- (double)radiosityOffset;
- (double)radiosityStrength;
- (double)repositionUnselectionDuration;
- (double)rotationAmount;
- (double)scaleSizeIncrease;
- (double)shadowSelectionDuration;
- (double)shadowUnselectionDuration;
- (double)specularHighlightHorizontalPositionSensitivity;
- (double)specularHighlightVerticalPosition;
- (double)specularHighlightVerticalPositionSensitivity;
- (double)specularOpacity;
- (double)unmaskedOverlayScaleFactor;
- (double)unpressedDuration;
- (double)zDepth;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maximumParallaxImages;
- (void)_highContrastFocusIndicatorChanged:(id)a3;
- (void)dealloc;
- (void)setAdjustMotionForSize:(BOOL)a3;
- (void)setAllowsNonOpaqueShadow:(BOOL)a3;
- (void)setBoostBrightness:(BOOL)a3;
- (void)setContinuousCornerRadiusEnabled:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDefaultFocusedShadowOpacity:(double)a3;
- (void)setDefaultFocusedShadowRadius:(double)a3;
- (void)setDefaultFocusedShadowVerticalOffset:(double)a3;
- (void)setDefaultHighlightedShadowOpacity:(double)a3;
- (void)setDefaultHighlightedShadowRadius:(double)a3;
- (void)setDefaultHighlightedShadowVerticalOffset:(double)a3;
- (void)setDefaultSelectedShadowVerticalOffset:(double)a3;
- (void)setDefaultUnfocusedShadowOpacity:(double)a3;
- (void)setDefaultUnfocusedShadowRadius:(double)a3;
- (void)setDefaultUnfocusedShadowVerticalOffset:(double)a3;
- (void)setDisableMask:(BOOL)a3;
- (void)setFlatImageContainsCornerRadius:(BOOL)a3;
- (void)setFocusCursorBorderWidth:(double)a3;
- (void)setFocusCursorEnabled:(BOOL)a3;
- (void)setFocusCursorShadowOpacityAdjustment:(double)a3;
- (void)setFullBleedCenteredGrowth:(BOOL)a3;
- (void)setFullBleedFocusedShadowOpacity:(double)a3;
- (void)setFullBleedFocusedShadowRadius:(double)a3;
- (void)setFullBleedOffset:(double)a3;
- (void)setFullBleedUnfocusedShadowOpacity:(double)a3;
- (void)setFullBleedUnfocusedShadowRadius:(double)a3;
- (void)setHueShift:(BOOL)a3;
- (void)setLayerSelectionDuration:(double)a3;
- (void)setLayerUnselectionDuration:(double)a3;
- (void)setMaximumParallaxDepth:(double)a3;
- (void)setMaximumParallaxImages:(unint64_t)a3;
- (void)setMinimumFocusDuration:(double)a3;
- (void)setOverlayDepth:(double)a3;
- (void)setOverlayFixedFrame:(BOOL)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPressedDuration:(double)a3;
- (void)setPressedScaleAdjustment:(double)a3;
- (void)setRadiosityOffset:(double)a3;
- (void)setRadiosityStrength:(double)a3;
- (void)setRepositionUnselectionDuration:(double)a3;
- (void)setRotationAmount:(double)a3;
- (void)setScaleSizeIncrease:(double)a3;
- (void)setShadowSelectionDuration:(double)a3;
- (void)setShadowUnselectionDuration:(double)a3;
- (void)setSpecularHighlightHorizontalPositionSensitivity:(double)a3;
- (void)setSpecularHighlightVerticalPosition:(double)a3;
- (void)setSpecularHighlightVerticalPositionSensitivity:(double)a3;
- (void)setSpecularOpacity:(double)a3;
- (void)setTranslationOffset:(CGPoint)a3;
- (void)setUnmaskedOverlayScaleFactor:(double)a3;
- (void)setUnpressedDuration:(double)a3;
- (void)setUseSeparateUnfocusedShadowImage:(BOOL)a3;
- (void)setZDepth:(double)a3;
@end

@implementation _UIStackedImageConfiguration

+ (id)newStandardConfiguration
{
  v2 = objc_alloc_init(_UIStackedImageConfiguration);
  [(_UIStackedImageConfiguration *)v2 setMaximumParallaxImages:5];
  [(_UIStackedImageConfiguration *)v2 setMaximumParallaxDepth:60.0];
  [(_UIStackedImageConfiguration *)v2 setOverlayDepth:1.0];
  [(_UIStackedImageConfiguration *)v2 setOverlayFixedFrame:0];
  [(_UIStackedImageConfiguration *)v2 setZDepth:900.0];
  [(_UIStackedImageConfiguration *)v2 setAdjustMotionForSize:1];
  [(_UIStackedImageConfiguration *)v2 setRotationAmount:0.08];
  [(_UIStackedImageConfiguration *)v2 setScaleSizeIncrease:70.0];
  [(_UIStackedImageConfiguration *)v2 setPressedScaleAdjustment:0.5];
  -[_UIStackedImageConfiguration setTranslationOffset:](v2, "setTranslationOffset:", 12.0, 12.0);
  [(_UIStackedImageConfiguration *)v2 setUnmaskedOverlayScaleFactor:1.0];
  [(_UIStackedImageConfiguration *)v2 setCornerRadius:0.0];
  [(_UIStackedImageConfiguration *)v2 setContinuousCornerRadiusEnabled:0.0];
  [(_UIStackedImageConfiguration *)v2 setFlatImageContainsCornerRadius:0];
  [(_UIStackedImageConfiguration *)v2 setSpecularHighlightVerticalPosition:0.4];
  [(_UIStackedImageConfiguration *)v2 setSpecularHighlightHorizontalPositionSensitivity:1.3];
  [(_UIStackedImageConfiguration *)v2 setSpecularHighlightVerticalPositionSensitivity:1.3];
  [(_UIStackedImageConfiguration *)v2 setSpecularOpacity:0.2];
  [(_UIStackedImageConfiguration *)v2 setDefaultFocusedShadowOpacity:0.5];
  [(_UIStackedImageConfiguration *)v2 setDefaultHighlightedShadowOpacity:0.5];
  [(_UIStackedImageConfiguration *)v2 setDefaultUnfocusedShadowOpacity:0.2];
  [(_UIStackedImageConfiguration *)v2 setFullBleedFocusedShadowOpacity:0.55];
  [(_UIStackedImageConfiguration *)v2 setFullBleedUnfocusedShadowOpacity:0.15];
  [(_UIStackedImageConfiguration *)v2 setFocusCursorShadowOpacityAdjustment:0.2];
  [(_UIStackedImageConfiguration *)v2 setDefaultFocusedShadowRadius:35.0];
  [(_UIStackedImageConfiguration *)v2 setDefaultHighlightedShadowRadius:20.0];
  [(_UIStackedImageConfiguration *)v2 setDefaultUnfocusedShadowRadius:5.0];
  [(_UIStackedImageConfiguration *)v2 setFullBleedFocusedShadowRadius:35.0];
  [(_UIStackedImageConfiguration *)v2 setFullBleedUnfocusedShadowRadius:5.0];
  [(_UIStackedImageConfiguration *)v2 setDefaultFocusedShadowVerticalOffset:50.0];
  [(_UIStackedImageConfiguration *)v2 setDefaultHighlightedShadowVerticalOffset:22.0];
  [(_UIStackedImageConfiguration *)v2 setDefaultUnfocusedShadowVerticalOffset:6.0];
  [(_UIStackedImageConfiguration *)v2 setDefaultSelectedShadowVerticalOffset:6.0];
  [(_UIStackedImageConfiguration *)v2 setUseSeparateUnfocusedShadowImage:1];
  [(_UIStackedImageConfiguration *)v2 setPlaceholderImage:0];
  [(_UIStackedImageConfiguration *)v2 setAllowsNonOpaqueShadow:0];
  [(_UIStackedImageConfiguration *)v2 setBoostBrightness:1];
  [(_UIStackedImageConfiguration *)v2 setHueShift:0];
  [(_UIStackedImageConfiguration *)v2 setDisableMask:0];
  [(_UIStackedImageConfiguration *)v2 setFocusCursorEnabled:_AXSHighContrastFocusIndicatorsEnabled() != 0];
  [(_UIStackedImageConfiguration *)v2 setFocusCursorBorderWidth:8.0];
  [(_UIStackedImageConfiguration *)v2 setRadiosityOffset:10.0];
  [(_UIStackedImageConfiguration *)v2 setRadiosityStrength:0.0];
  v3 = +[_UIFocusAnimationConfiguration configurationWithStyle:0];
  [v3 focusingBaseDuration];
  -[_UIStackedImageConfiguration setShadowSelectionDuration:](v2, "setShadowSelectionDuration:");
  [v3 focusingBaseDuration];
  -[_UIStackedImageConfiguration setLayerSelectionDuration:](v2, "setLayerSelectionDuration:");
  [v3 unfocusingBaseDuration];
  -[_UIStackedImageConfiguration setShadowUnselectionDuration:](v2, "setShadowUnselectionDuration:");
  [v3 unfocusingBaseDuration];
  -[_UIStackedImageConfiguration setLayerUnselectionDuration:](v2, "setLayerUnselectionDuration:");
  [v3 minimumFocusDuration];
  -[_UIStackedImageConfiguration setMinimumFocusDuration:](v2, "setMinimumFocusDuration:");
  [v3 unfocusingRepositionBaseDuration];
  -[_UIStackedImageConfiguration setRepositionUnselectionDuration:](v2, "setRepositionUnselectionDuration:");
  [(_UIStackedImageConfiguration *)v2 layerSelectionDuration];
  -[_UIStackedImageConfiguration setPressedDuration:](v2, "setPressedDuration:");
  [(_UIStackedImageConfiguration *)v2 setUnpressedDuration:0.25];
  [(_UIStackedImageConfiguration *)v2 setFullBleedCenteredGrowth:0];
  [(_UIStackedImageConfiguration *)v2 setFullBleedOffset:30.0];

  return v2;
}

+ (id)newAppIconConfiguration
{
  id v2 = +[_UIStackedImageConfiguration newStandardConfiguration];
  [v2 setCornerRadius:30.0];
  [v2 setContinuousCornerRadiusEnabled:1.0];
  [v2 setSpecularHighlightVerticalPosition:0.5];
  [v2 setSpecularHighlightVerticalPositionSensitivity:2.5];
  [v2 setHueShift:1];
  [v2 setAdjustMotionForSize:0];
  [v2 setUnmaskedOverlayScaleFactor:0.9];
  [v2 setDefaultUnfocusedShadowRadius:12.0];
  [v2 setDefaultUnfocusedShadowOpacity:0.4];
  [v2 setDefaultUnfocusedShadowVerticalOffset:4.0];
  [v2 setDefaultFocusedShadowRadius:35.0];
  [v2 setDefaultFocusedShadowOpacity:0.3];
  [v2 setDefaultFocusedShadowVerticalOffset:50.0];
  [v2 setDefaultHighlightedShadowRadius:20.0];
  [v2 setDefaultHighlightedShadowOpacity:0.4];
  [v2 setDefaultHighlightedShadowVerticalOffset:20.0];
  [v2 setDefaultSelectedShadowVerticalOffset:4.0];
  return v2;
}

- (_UIStackedImageConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStackedImageConfiguration;
  id v2 = [(_UIStackedImageConfiguration *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__highContrastFocusIndicatorChanged_ name:@"UIAccessibilityHighContrastFocusIndicatorChangedNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityHighContrastFocusIndicatorChangedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIStackedImageConfiguration;
  [(_UIStackedImageConfiguration *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init(_UIStackedImageConfiguration);
  [(_UIStackedImageConfiguration *)v4 setMaximumParallaxImages:[(_UIStackedImageConfiguration *)self maximumParallaxImages]];
  [(_UIStackedImageConfiguration *)self maximumParallaxDepth];
  -[_UIStackedImageConfiguration setMaximumParallaxDepth:](v4, "setMaximumParallaxDepth:");
  [(_UIStackedImageConfiguration *)self overlayDepth];
  -[_UIStackedImageConfiguration setOverlayDepth:](v4, "setOverlayDepth:");
  [(_UIStackedImageConfiguration *)v4 setOverlayFixedFrame:[(_UIStackedImageConfiguration *)self overlayFixedFrame]];
  [(_UIStackedImageConfiguration *)self zDepth];
  -[_UIStackedImageConfiguration setZDepth:](v4, "setZDepth:");
  [(_UIStackedImageConfiguration *)v4 setAdjustMotionForSize:[(_UIStackedImageConfiguration *)self adjustMotionForSize]];
  [(_UIStackedImageConfiguration *)self rotationAmount];
  -[_UIStackedImageConfiguration setRotationAmount:](v4, "setRotationAmount:");
  [(_UIStackedImageConfiguration *)self scaleSizeIncrease];
  -[_UIStackedImageConfiguration setScaleSizeIncrease:](v4, "setScaleSizeIncrease:");
  [(_UIStackedImageConfiguration *)self pressedScaleAdjustment];
  -[_UIStackedImageConfiguration setPressedScaleAdjustment:](v4, "setPressedScaleAdjustment:");
  [(_UIStackedImageConfiguration *)self translationOffset];
  -[_UIStackedImageConfiguration setTranslationOffset:](v4, "setTranslationOffset:");
  [(_UIStackedImageConfiguration *)self unmaskedOverlayScaleFactor];
  -[_UIStackedImageConfiguration setUnmaskedOverlayScaleFactor:](v4, "setUnmaskedOverlayScaleFactor:");
  [(_UIStackedImageConfiguration *)self cornerRadius];
  -[_UIStackedImageConfiguration setCornerRadius:](v4, "setCornerRadius:");
  [(_UIStackedImageConfiguration *)self isContinuousCornerRadiusEnabled];
  -[_UIStackedImageConfiguration setContinuousCornerRadiusEnabled:](v4, "setContinuousCornerRadiusEnabled:");
  [(_UIStackedImageConfiguration *)v4 setFlatImageContainsCornerRadius:[(_UIStackedImageConfiguration *)self flatImageContainsCornerRadius]];
  [(_UIStackedImageConfiguration *)self specularHighlightVerticalPosition];
  -[_UIStackedImageConfiguration setSpecularHighlightVerticalPosition:](v4, "setSpecularHighlightVerticalPosition:");
  [(_UIStackedImageConfiguration *)self specularHighlightHorizontalPositionSensitivity];
  -[_UIStackedImageConfiguration setSpecularHighlightHorizontalPositionSensitivity:](v4, "setSpecularHighlightHorizontalPositionSensitivity:");
  [(_UIStackedImageConfiguration *)self specularHighlightVerticalPositionSensitivity];
  -[_UIStackedImageConfiguration setSpecularHighlightVerticalPositionSensitivity:](v4, "setSpecularHighlightVerticalPositionSensitivity:");
  [(_UIStackedImageConfiguration *)self specularOpacity];
  -[_UIStackedImageConfiguration setSpecularOpacity:](v4, "setSpecularOpacity:");
  [(_UIStackedImageConfiguration *)self defaultFocusedShadowOpacity];
  -[_UIStackedImageConfiguration setDefaultFocusedShadowOpacity:](v4, "setDefaultFocusedShadowOpacity:");
  [(_UIStackedImageConfiguration *)self defaultHighlightedShadowOpacity];
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowOpacity:](v4, "setDefaultHighlightedShadowOpacity:");
  [(_UIStackedImageConfiguration *)self defaultUnfocusedShadowOpacity];
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowOpacity:](v4, "setDefaultUnfocusedShadowOpacity:");
  [(_UIStackedImageConfiguration *)self fullBleedFocusedShadowOpacity];
  -[_UIStackedImageConfiguration setFullBleedFocusedShadowOpacity:](v4, "setFullBleedFocusedShadowOpacity:");
  [(_UIStackedImageConfiguration *)self fullBleedUnfocusedShadowOpacity];
  -[_UIStackedImageConfiguration setFullBleedUnfocusedShadowOpacity:](v4, "setFullBleedUnfocusedShadowOpacity:");
  [(_UIStackedImageConfiguration *)self focusCursorShadowOpacityAdjustment];
  -[_UIStackedImageConfiguration setFocusCursorShadowOpacityAdjustment:](v4, "setFocusCursorShadowOpacityAdjustment:");
  [(_UIStackedImageConfiguration *)self defaultFocusedShadowRadius];
  -[_UIStackedImageConfiguration setDefaultFocusedShadowRadius:](v4, "setDefaultFocusedShadowRadius:");
  [(_UIStackedImageConfiguration *)self defaultHighlightedShadowRadius];
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowRadius:](v4, "setDefaultHighlightedShadowRadius:");
  [(_UIStackedImageConfiguration *)self defaultUnfocusedShadowRadius];
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowRadius:](v4, "setDefaultUnfocusedShadowRadius:");
  [(_UIStackedImageConfiguration *)self fullBleedFocusedShadowRadius];
  -[_UIStackedImageConfiguration setFullBleedFocusedShadowRadius:](v4, "setFullBleedFocusedShadowRadius:");
  [(_UIStackedImageConfiguration *)self fullBleedUnfocusedShadowRadius];
  -[_UIStackedImageConfiguration setFullBleedUnfocusedShadowRadius:](v4, "setFullBleedUnfocusedShadowRadius:");
  [(_UIStackedImageConfiguration *)self defaultFocusedShadowVerticalOffset];
  -[_UIStackedImageConfiguration setDefaultFocusedShadowVerticalOffset:](v4, "setDefaultFocusedShadowVerticalOffset:");
  [(_UIStackedImageConfiguration *)self defaultHighlightedShadowVerticalOffset];
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowVerticalOffset:](v4, "setDefaultHighlightedShadowVerticalOffset:");
  [(_UIStackedImageConfiguration *)self defaultUnfocusedShadowVerticalOffset];
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowVerticalOffset:](v4, "setDefaultUnfocusedShadowVerticalOffset:");
  [(_UIStackedImageConfiguration *)self defaultSelectedShadowVerticalOffset];
  -[_UIStackedImageConfiguration setDefaultSelectedShadowVerticalOffset:](v4, "setDefaultSelectedShadowVerticalOffset:");
  [(_UIStackedImageConfiguration *)v4 setUseSeparateUnfocusedShadowImage:[(_UIStackedImageConfiguration *)self useSeparateUnfocusedShadowImage]];
  objc_super v5 = [(_UIStackedImageConfiguration *)self placeholderImage];
  [(_UIStackedImageConfiguration *)v4 setPlaceholderImage:v5];

  [(_UIStackedImageConfiguration *)v4 setAllowsNonOpaqueShadow:[(_UIStackedImageConfiguration *)self allowsNonOpaqueShadow]];
  [(_UIStackedImageConfiguration *)v4 setBoostBrightness:[(_UIStackedImageConfiguration *)self boostBrightness]];
  [(_UIStackedImageConfiguration *)v4 setHueShift:[(_UIStackedImageConfiguration *)self hueShift]];
  [(_UIStackedImageConfiguration *)v4 setDisableMask:[(_UIStackedImageConfiguration *)self disableMask]];
  [(_UIStackedImageConfiguration *)v4 setFocusCursorEnabled:[(_UIStackedImageConfiguration *)self focusCursorEnabled]];
  [(_UIStackedImageConfiguration *)self focusCursorBorderWidth];
  -[_UIStackedImageConfiguration setFocusCursorBorderWidth:](v4, "setFocusCursorBorderWidth:");
  [(_UIStackedImageConfiguration *)self radiosityOffset];
  -[_UIStackedImageConfiguration setRadiosityOffset:](v4, "setRadiosityOffset:");
  [(_UIStackedImageConfiguration *)self radiosityStrength];
  -[_UIStackedImageConfiguration setRadiosityStrength:](v4, "setRadiosityStrength:");
  [(_UIStackedImageConfiguration *)self shadowSelectionDuration];
  -[_UIStackedImageConfiguration setShadowSelectionDuration:](v4, "setShadowSelectionDuration:");
  [(_UIStackedImageConfiguration *)self shadowUnselectionDuration];
  -[_UIStackedImageConfiguration setShadowUnselectionDuration:](v4, "setShadowUnselectionDuration:");
  [(_UIStackedImageConfiguration *)self repositionUnselectionDuration];
  -[_UIStackedImageConfiguration setRepositionUnselectionDuration:](v4, "setRepositionUnselectionDuration:");
  [(_UIStackedImageConfiguration *)self layerSelectionDuration];
  -[_UIStackedImageConfiguration setLayerSelectionDuration:](v4, "setLayerSelectionDuration:");
  [(_UIStackedImageConfiguration *)self layerUnselectionDuration];
  -[_UIStackedImageConfiguration setLayerUnselectionDuration:](v4, "setLayerUnselectionDuration:");
  [(_UIStackedImageConfiguration *)self minimumFocusDuration];
  -[_UIStackedImageConfiguration setMinimumFocusDuration:](v4, "setMinimumFocusDuration:");
  [(_UIStackedImageConfiguration *)self pressedDuration];
  -[_UIStackedImageConfiguration setPressedDuration:](v4, "setPressedDuration:");
  [(_UIStackedImageConfiguration *)self unpressedDuration];
  -[_UIStackedImageConfiguration setUnpressedDuration:](v4, "setUnpressedDuration:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v32 = 0;
    goto LABEL_40;
  }
  id v5 = v4;
  uint64_t v6 = [v5 maximumParallaxImages];
  if (v6 == [(_UIStackedImageConfiguration *)self maximumParallaxImages])
  {
    [v5 maximumParallaxDepth];
    double v8 = v7;
    [(_UIStackedImageConfiguration *)self maximumParallaxDepth];
    if (vabdd_f64(v8, v9) < 0.00000011920929)
    {
      [v5 overlayDepth];
      double v11 = v10;
      [(_UIStackedImageConfiguration *)self overlayDepth];
      if (vabdd_f64(v11, v12) < 0.00000011920929)
      {
        int v13 = [v5 overlayFixedFrame];
        if (v13 == [(_UIStackedImageConfiguration *)self overlayFixedFrame])
        {
          [v5 zDepth];
          double v15 = v14;
          [(_UIStackedImageConfiguration *)self zDepth];
          if (vabdd_f64(v15, v16) < 0.00000011920929)
          {
            int v17 = [v5 adjustMotionForSize];
            if (v17 == [(_UIStackedImageConfiguration *)self adjustMotionForSize])
            {
              [v5 rotationAmount];
              double v19 = v18;
              [(_UIStackedImageConfiguration *)self rotationAmount];
              if (vabdd_f64(v19, v20) < 0.00000011920929)
              {
                [v5 scaleSizeIncrease];
                double v22 = v21;
                [(_UIStackedImageConfiguration *)self scaleSizeIncrease];
                if (vabdd_f64(v22, v23) < 0.00000011920929)
                {
                  [v5 pressedScaleAdjustment];
                  double v25 = v24;
                  [(_UIStackedImageConfiguration *)self pressedScaleAdjustment];
                  if (vabdd_f64(v25, v26) < 0.00000011920929)
                  {
                    [v5 translationOffset];
                    double v28 = v27;
                    double v30 = v29;
                    [(_UIStackedImageConfiguration *)self translationOffset];
                    BOOL v32 = 0;
                    if (v28 != v33 || v30 != v31) {
                      goto LABEL_38;
                    }
                    [v5 unmaskedOverlayScaleFactor];
                    double v35 = v34;
                    [(_UIStackedImageConfiguration *)self unmaskedOverlayScaleFactor];
                    if (vabdd_f64(v35, v36) < 0.00000011920929)
                    {
                      [v5 cornerRadius];
                      double v38 = v37;
                      [(_UIStackedImageConfiguration *)self cornerRadius];
                      if (vabdd_f64(v38, v39) < 0.00000011920929)
                      {
                        [v5 isContinuousCornerRadiusEnabled];
                        double v41 = v40;
                        [(_UIStackedImageConfiguration *)self isContinuousCornerRadiusEnabled];
                        if (v41 == v42)
                        {
                          int v43 = [v5 flatImageContainsCornerRadius];
                          if (v43 == [(_UIStackedImageConfiguration *)self flatImageContainsCornerRadius])
                          {
                            [v5 specularHighlightVerticalPosition];
                            double v45 = v44;
                            [(_UIStackedImageConfiguration *)self specularHighlightVerticalPosition];
                            if (vabdd_f64(v45, v46) < 0.00000011920929)
                            {
                              [v5 specularHighlightHorizontalPositionSensitivity];
                              double v48 = v47;
                              [(_UIStackedImageConfiguration *)self specularHighlightHorizontalPositionSensitivity];
                              if (vabdd_f64(v48, v49) < 0.00000011920929)
                              {
                                [v5 specularHighlightVerticalPositionSensitivity];
                                double v51 = v50;
                                [(_UIStackedImageConfiguration *)self specularHighlightVerticalPositionSensitivity];
                                if (vabdd_f64(v51, v52) < 0.00000011920929)
                                {
                                  [v5 specularOpacity];
                                  double v54 = v53;
                                  [(_UIStackedImageConfiguration *)self specularOpacity];
                                  if (vabdd_f64(v54, v55) < 0.00000011920929)
                                  {
                                    [v5 defaultFocusedShadowOpacity];
                                    double v57 = v56;
                                    [(_UIStackedImageConfiguration *)self defaultFocusedShadowOpacity];
                                    if (vabdd_f64(v57, v58) < 0.00000011920929)
                                    {
                                      [v5 defaultHighlightedShadowOpacity];
                                      double v60 = v59;
                                      [(_UIStackedImageConfiguration *)self defaultHighlightedShadowOpacity];
                                      if (vabdd_f64(v60, v61) < 0.00000011920929)
                                      {
                                        [v5 defaultUnfocusedShadowOpacity];
                                        double v63 = v62;
                                        [(_UIStackedImageConfiguration *)self defaultUnfocusedShadowOpacity];
                                        if (vabdd_f64(v63, v64) < 0.00000011920929)
                                        {
                                          [v5 fullBleedFocusedShadowOpacity];
                                          double v66 = v65;
                                          [(_UIStackedImageConfiguration *)self fullBleedFocusedShadowOpacity];
                                          if (vabdd_f64(v66, v67) < 0.00000011920929)
                                          {
                                            [v5 fullBleedUnfocusedShadowOpacity];
                                            double v69 = v68;
                                            [(_UIStackedImageConfiguration *)self fullBleedUnfocusedShadowOpacity];
                                            if (vabdd_f64(v69, v70) < 0.00000011920929)
                                            {
                                              [v5 focusCursorShadowOpacityAdjustment];
                                              double v72 = v71;
                                              [(_UIStackedImageConfiguration *)self focusCursorShadowOpacityAdjustment];
                                              if (vabdd_f64(v72, v73) < 0.00000011920929)
                                              {
                                                [v5 defaultFocusedShadowRadius];
                                                double v75 = v74;
                                                [(_UIStackedImageConfiguration *)self defaultFocusedShadowRadius];
                                                if (vabdd_f64(v75, v76) < 0.00000011920929)
                                                {
                                                  [v5 defaultHighlightedShadowRadius];
                                                  double v78 = v77;
                                                  [(_UIStackedImageConfiguration *)self defaultHighlightedShadowRadius];
                                                  if (vabdd_f64(v78, v79) < 0.00000011920929)
                                                  {
                                                    [v5 defaultUnfocusedShadowRadius];
                                                    double v81 = v80;
                                                    [(_UIStackedImageConfiguration *)self defaultUnfocusedShadowRadius];
                                                    if (vabdd_f64(v81, v82) < 0.00000011920929)
                                                    {
                                                      [v5 fullBleedFocusedShadowRadius];
                                                      double v84 = v83;
                                                      [(_UIStackedImageConfiguration *)self fullBleedFocusedShadowRadius];
                                                      if (vabdd_f64(v84, v85) < 0.00000011920929)
                                                      {
                                                        [v5 fullBleedUnfocusedShadowRadius];
                                                        double v87 = v86;
                                                        [(_UIStackedImageConfiguration *)self fullBleedUnfocusedShadowRadius];
                                                        if (vabdd_f64(v87, v88) < 0.00000011920929)
                                                        {
                                                          [v5 defaultFocusedShadowVerticalOffset];
                                                          double v90 = v89;
                                                          [(_UIStackedImageConfiguration *)self defaultFocusedShadowVerticalOffset];
                                                          if (vabdd_f64(v90, v91) < 0.00000011920929)
                                                          {
                                                            [v5 defaultHighlightedShadowVerticalOffset];
                                                            double v93 = v92;
                                                            [(_UIStackedImageConfiguration *)self defaultHighlightedShadowVerticalOffset];
                                                            if (vabdd_f64(v93, v94) < 0.00000011920929)
                                                            {
                                                              [v5 defaultUnfocusedShadowVerticalOffset];
                                                              double v96 = v95;
                                                              [(_UIStackedImageConfiguration *)self defaultUnfocusedShadowVerticalOffset];
                                                              if (vabdd_f64(v96, v97) < 0.00000011920929)
                                                              {
                                                                [v5 defaultSelectedShadowVerticalOffset];
                                                                double v99 = v98;
                                                                [(_UIStackedImageConfiguration *)self defaultSelectedShadowVerticalOffset];
                                                                if (vabdd_f64(v99, v100) < 0.00000011920929)
                                                                {
                                                                  int v101 = [v5 useSeparateUnfocusedShadowImage];
                                                                  if (v101 == [(_UIStackedImageConfiguration *)self useSeparateUnfocusedShadowImage])
                                                                  {
                                                                    v103 = [v5 placeholderImage];
                                                                    v104 = [(_UIStackedImageConfiguration *)self placeholderImage];
                                                                    if (![v103 isEqual:v104])goto LABEL_58; {
                                                                    int v105 = [v5 allowsNonOpaqueShadow];
                                                                    }
                                                                    if (v105 != [(_UIStackedImageConfiguration *)self allowsNonOpaqueShadow])goto LABEL_58; {
                                                                    int v106 = [v5 boostBrightness];
                                                                    }
                                                                    if (v106 != [(_UIStackedImageConfiguration *)self boostBrightness])goto LABEL_58; {
                                                                    int v107 = [v5 hueShift];
                                                                    }
                                                                    if (v107 != [(_UIStackedImageConfiguration *)self hueShift])goto LABEL_58; {
                                                                    int v108 = [v5 disableMask];
                                                                    }
                                                                    if (v108 != [(_UIStackedImageConfiguration *)self disableMask])goto LABEL_58; {
                                                                    int v109 = [v5 focusCursorEnabled];
                                                                    }
                                                                    if (v109 != [(_UIStackedImageConfiguration *)self focusCursorEnabled])goto LABEL_58; {
                                                                    [v5 focusCursorBorderWidth];
                                                                    }
                                                                    double v111 = v110;
                                                                    [(_UIStackedImageConfiguration *)self focusCursorBorderWidth];
                                                                    if (vabdd_f64(v111, v112) >= 0.00000011920929) {
                                                                      goto LABEL_58;
                                                                    }
                                                                    [v5 radiosityOffset];
                                                                    double v114 = v113;
                                                                    [(_UIStackedImageConfiguration *)self radiosityOffset];
                                                                    if (vabdd_f64(v114, v115) >= 0.00000011920929) {
                                                                      goto LABEL_58;
                                                                    }
                                                                    [v5 radiosityStrength];
                                                                    double v117 = v116;
                                                                    [(_UIStackedImageConfiguration *)self radiosityStrength];
                                                                    if (vabdd_f64(v117, v118) >= 0.00000011920929) {
                                                                      goto LABEL_58;
                                                                    }
                                                                    [v5 shadowSelectionDuration];
                                                                    double v120 = v119;
                                                                    [(_UIStackedImageConfiguration *)self shadowSelectionDuration];
                                                                    if (vabdd_f64(v120, v121) >= 0.00000011920929) {
                                                                      goto LABEL_58;
                                                                    }
                                                                    [v5 shadowUnselectionDuration];
                                                                    double v123 = v122;
                                                                    [(_UIStackedImageConfiguration *)self shadowUnselectionDuration];
                                                                    if (vabdd_f64(v123, v124) >= 0.00000011920929) {
                                                                      goto LABEL_58;
                                                                    }
                                                                    [v5 repositionUnselectionDuration];
                                                                    double v126 = v125;
                                                                    [(_UIStackedImageConfiguration *)self repositionUnselectionDuration];
                                                                    if (vabdd_f64(v126, v127) >= 0.00000011920929) {
                                                                      goto LABEL_58;
                                                                    }
                                                                    [v5 layerSelectionDuration];
                                                                    double v129 = v128;
                                                                    [(_UIStackedImageConfiguration *)self layerSelectionDuration];
                                                                    if (vabdd_f64(v129, v130) >= 0.00000011920929) {
                                                                      goto LABEL_58;
                                                                    }
                                                                    [v5 layerUnselectionDuration];
                                                                    double v132 = v131;
                                                                    [(_UIStackedImageConfiguration *)self layerUnselectionDuration];
                                                                    if (vabdd_f64(v132, v133) >= 0.00000011920929) {
                                                                      goto LABEL_58;
                                                                    }
                                                                    [v5 minimumFocusDuration];
                                                                    double v135 = v134;
                                                                    [(_UIStackedImageConfiguration *)self minimumFocusDuration];
                                                                    if (vabdd_f64(v135, v136) < 0.00000011920929
                                                                      && ([v5 pressedDuration],
                                                                          double v138 = v137,
                                                                          [(_UIStackedImageConfiguration *)self pressedDuration], vabdd_f64(v138, v139) < 0.00000011920929))
                                                                    {
                                                                      [v5 unpressedDuration];
                                                                      double v141 = v140;
                                                                      [(_UIStackedImageConfiguration *)self unpressedDuration];
                                                                      BOOL v143 = vabdd_f64(v141, v142) < 0.00000011920929;
                                                                    }
                                                                    else
                                                                    {
LABEL_58:
                                                                      BOOL v143 = 0;
                                                                    }

                                                                    BOOL v32 = v143;
                                                                    goto LABEL_38;
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  BOOL v32 = 0;
LABEL_38:

LABEL_40:
  return v32;
}

- (_UIFocusAnimationConfiguration)focusAnimationConfiguration
{
  v3 = +[_UIFocusAnimationConfiguration configurationWithStyle:0];
  [(_UIStackedImageConfiguration *)self layerSelectionDuration];
  objc_msgSend(v3, "setFocusingBaseDuration:");
  [(_UIStackedImageConfiguration *)self layerUnselectionDuration];
  objc_msgSend(v3, "setUnfocusingBaseDuration:");
  [(_UIStackedImageConfiguration *)self repositionUnselectionDuration];
  objc_msgSend(v3, "setUnfocusingRepositionBaseDuration:");
  [(_UIStackedImageConfiguration *)self minimumFocusDuration];
  objc_msgSend(v3, "setMinimumFocusDuration:");
  return (_UIFocusAnimationConfiguration *)v3;
}

- (void)_highContrastFocusIndicatorChanged:(id)a3
{
  BOOL v4 = _AXSHighContrastFocusIndicatorsEnabled() != 0;
  [(_UIStackedImageConfiguration *)self setFocusCursorEnabled:v4];
}

- (unint64_t)maximumParallaxImages
{
  return self->_maximumParallaxImages;
}

- (void)setMaximumParallaxImages:(unint64_t)a3
{
  self->_maximumParallaxImages = a3;
}

- (double)maximumParallaxDepth
{
  return self->_maximumParallaxDepth;
}

- (void)setMaximumParallaxDepth:(double)a3
{
  self->_maximumParallaxDepth = a3;
}

- (double)overlayDepth
{
  return self->_overlayDepth;
}

- (void)setOverlayDepth:(double)a3
{
  self->_overlayDepth = a3;
}

- (BOOL)overlayFixedFrame
{
  return self->_overlayFixedFrame;
}

- (void)setOverlayFixedFrame:(BOOL)a3
{
  self->_overlayFixedFrame = a3;
}

- (double)zDepth
{
  return self->_zDepth;
}

- (void)setZDepth:(double)a3
{
  self->_zDepth = a3;
}

- (BOOL)adjustMotionForSize
{
  return self->_adjustMotionForSize;
}

- (void)setAdjustMotionForSize:(BOOL)a3
{
  self->_adjustMotionForSize = a3;
}

- (double)rotationAmount
{
  return self->_rotationAmount;
}

- (void)setRotationAmount:(double)a3
{
  self->_rotationAmount = a3;
}

- (double)scaleSizeIncrease
{
  return self->_scaleSizeIncrease;
}

- (void)setScaleSizeIncrease:(double)a3
{
  self->_scaleSizeIncrease = a3;
}

- (double)pressedScaleAdjustment
{
  return self->_pressedScaleAdjustment;
}

- (void)setPressedScaleAdjustment:(double)a3
{
  self->_pressedScaleAdjustment = a3;
}

- (CGPoint)translationOffset
{
  double x = self->_translationOffset.x;
  double y = self->_translationOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTranslationOffset:(CGPoint)a3
{
  self->_translationOffset = a3;
}

- (double)unmaskedOverlayScaleFactor
{
  return self->_unmaskedOverlayScaleFactor;
}

- (void)setUnmaskedOverlayScaleFactor:(double)a3
{
  self->_unmaskedOverlayScaleFactor = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)isContinuousCornerRadiusEnabled
{
  return self->_continuousCornerRadiusEnabled;
}

- (void)setContinuousCornerRadiusEnabled:(double)a3
{
  self->_continuousCornerRadiusEnabled = a3;
}

- (BOOL)flatImageContainsCornerRadius
{
  return self->_flatImageContainsCornerRadius;
}

- (void)setFlatImageContainsCornerRadius:(BOOL)a3
{
  self->_flatImageContainsCornerRadius = a3;
}

- (double)specularHighlightHorizontalPositionSensitivity
{
  return self->_specularHighlightHorizontalPositionSensitivity;
}

- (void)setSpecularHighlightHorizontalPositionSensitivity:(double)a3
{
  self->_specularHighlightHorizontalPositionSensitivitdouble y = a3;
}

- (double)specularHighlightVerticalPosition
{
  return self->_specularHighlightVerticalPosition;
}

- (void)setSpecularHighlightVerticalPosition:(double)a3
{
  self->_specularHighlightVerticalPosition = a3;
}

- (double)specularHighlightVerticalPositionSensitivity
{
  return self->_specularHighlightVerticalPositionSensitivity;
}

- (void)setSpecularHighlightVerticalPositionSensitivity:(double)a3
{
  self->_specularHighlightVerticalPositionSensitivitdouble y = a3;
}

- (double)specularOpacity
{
  return self->_specularOpacity;
}

- (void)setSpecularOpacity:(double)a3
{
  self->_specularOpacitdouble y = a3;
}

- (double)defaultFocusedShadowOpacity
{
  return self->_defaultFocusedShadowOpacity;
}

- (void)setDefaultFocusedShadowOpacity:(double)a3
{
  self->_defaultFocusedShadowOpacitdouble y = a3;
}

- (double)defaultHighlightedShadowOpacity
{
  return self->_defaultHighlightedShadowOpacity;
}

- (void)setDefaultHighlightedShadowOpacity:(double)a3
{
  self->_defaultHighlightedShadowOpacitdouble y = a3;
}

- (double)defaultUnfocusedShadowOpacity
{
  return self->_defaultUnfocusedShadowOpacity;
}

- (void)setDefaultUnfocusedShadowOpacity:(double)a3
{
  self->_defaultUnfocusedShadowOpacitdouble y = a3;
}

- (double)fullBleedFocusedShadowOpacity
{
  return self->_fullBleedFocusedShadowOpacity;
}

- (void)setFullBleedFocusedShadowOpacity:(double)a3
{
  self->_fullBleedFocusedShadowOpacitdouble y = a3;
}

- (double)fullBleedUnfocusedShadowOpacity
{
  return self->_fullBleedUnfocusedShadowOpacity;
}

- (void)setFullBleedUnfocusedShadowOpacity:(double)a3
{
  self->_fullBleedUnfocusedShadowOpacitdouble y = a3;
}

- (double)focusCursorShadowOpacityAdjustment
{
  return self->_focusCursorShadowOpacityAdjustment;
}

- (void)setFocusCursorShadowOpacityAdjustment:(double)a3
{
  self->_focusCursorShadowOpacityAdjustment = a3;
}

- (double)defaultFocusedShadowRadius
{
  return self->_defaultFocusedShadowRadius;
}

- (void)setDefaultFocusedShadowRadius:(double)a3
{
  self->_defaultFocusedShadowRadius = a3;
}

- (double)defaultHighlightedShadowRadius
{
  return self->_defaultHighlightedShadowRadius;
}

- (void)setDefaultHighlightedShadowRadius:(double)a3
{
  self->_defaultHighlightedShadowRadius = a3;
}

- (double)defaultUnfocusedShadowRadius
{
  return self->_defaultUnfocusedShadowRadius;
}

- (void)setDefaultUnfocusedShadowRadius:(double)a3
{
  self->_defaultUnfocusedShadowRadius = a3;
}

- (double)fullBleedFocusedShadowRadius
{
  return self->_fullBleedFocusedShadowRadius;
}

- (void)setFullBleedFocusedShadowRadius:(double)a3
{
  self->_fullBleedFocusedShadowRadius = a3;
}

- (double)fullBleedUnfocusedShadowRadius
{
  return self->_fullBleedUnfocusedShadowRadius;
}

- (void)setFullBleedUnfocusedShadowRadius:(double)a3
{
  self->_fullBleedUnfocusedShadowRadius = a3;
}

- (double)defaultFocusedShadowVerticalOffset
{
  return self->_defaultFocusedShadowVerticalOffset;
}

- (void)setDefaultFocusedShadowVerticalOffset:(double)a3
{
  self->_defaultFocusedShadowVerticalOffset = a3;
}

- (double)defaultHighlightedShadowVerticalOffset
{
  return self->_defaultHighlightedShadowVerticalOffset;
}

- (void)setDefaultHighlightedShadowVerticalOffset:(double)a3
{
  self->_defaultHighlightedShadowVerticalOffset = a3;
}

- (double)defaultUnfocusedShadowVerticalOffset
{
  return self->_defaultUnfocusedShadowVerticalOffset;
}

- (void)setDefaultUnfocusedShadowVerticalOffset:(double)a3
{
  self->_defaultUnfocusedShadowVerticalOffset = a3;
}

- (double)defaultSelectedShadowVerticalOffset
{
  return self->_defaultSelectedShadowVerticalOffset;
}

- (void)setDefaultSelectedShadowVerticalOffset:(double)a3
{
  self->_defaultSelectedShadowVerticalOffset = a3;
}

- (BOOL)useSeparateUnfocusedShadowImage
{
  return self->_useSeparateUnfocusedShadowImage;
}

- (void)setUseSeparateUnfocusedShadowImage:(BOOL)a3
{
  self->_useSeparateUnfocusedShadowImage = a3;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
}

- (BOOL)allowsNonOpaqueShadow
{
  return self->_allowsNonOpaqueShadow;
}

- (void)setAllowsNonOpaqueShadow:(BOOL)a3
{
  self->_allowsNonOpaqueShadow = a3;
}

- (BOOL)boostBrightness
{
  return self->_boostBrightness;
}

- (void)setBoostBrightness:(BOOL)a3
{
  self->_boostBrightness = a3;
}

- (BOOL)hueShift
{
  return self->_hueShift;
}

- (void)setHueShift:(BOOL)a3
{
  self->_hueShift = a3;
}

- (BOOL)disableMask
{
  return self->_disableMask;
}

- (void)setDisableMask:(BOOL)a3
{
  self->_disableMask = a3;
}

- (BOOL)focusCursorEnabled
{
  return self->_focusCursorEnabled;
}

- (void)setFocusCursorEnabled:(BOOL)a3
{
  self->_focusCursorEnabled = a3;
}

- (double)focusCursorBorderWidth
{
  return self->_focusCursorBorderWidth;
}

- (void)setFocusCursorBorderWidth:(double)a3
{
  self->_focusCursorBorderWidth = a3;
}

- (double)radiosityOffset
{
  return self->_radiosityOffset;
}

- (void)setRadiosityOffset:(double)a3
{
  self->_radiosityOffset = a3;
}

- (double)radiosityStrength
{
  return self->_radiosityStrength;
}

- (void)setRadiosityStrength:(double)a3
{
  self->_radiosityStrength = a3;
}

- (double)shadowSelectionDuration
{
  return self->_shadowSelectionDuration;
}

- (void)setShadowSelectionDuration:(double)a3
{
  self->_shadowSelectionDuration = a3;
}

- (double)shadowUnselectionDuration
{
  return self->_shadowUnselectionDuration;
}

- (void)setShadowUnselectionDuration:(double)a3
{
  self->_shadowUnselectionDuration = a3;
}

- (double)repositionUnselectionDuration
{
  return self->_repositionUnselectionDuration;
}

- (void)setRepositionUnselectionDuration:(double)a3
{
  self->_repositionUnselectionDuration = a3;
}

- (double)layerSelectionDuration
{
  return self->_layerSelectionDuration;
}

- (void)setLayerSelectionDuration:(double)a3
{
  self->_layerSelectionDuration = a3;
}

- (double)layerUnselectionDuration
{
  return self->_layerUnselectionDuration;
}

- (void)setLayerUnselectionDuration:(double)a3
{
  self->_layerUnselectionDuration = a3;
}

- (double)minimumFocusDuration
{
  return self->_minimumFocusDuration;
}

- (void)setMinimumFocusDuration:(double)a3
{
  self->_minimumFocusDuration = a3;
}

- (double)pressedDuration
{
  return self->_pressedDuration;
}

- (void)setPressedDuration:(double)a3
{
  self->_pressedDuration = a3;
}

- (double)unpressedDuration
{
  return self->_unpressedDuration;
}

- (void)setUnpressedDuration:(double)a3
{
  self->_unpressedDuration = a3;
}

- (BOOL)fullBleedCenteredGrowth
{
  return self->_fullBleedCenteredGrowth;
}

- (void)setFullBleedCenteredGrowth:(BOOL)a3
{
  self->_fullBleedCenteredGrowth = a3;
}

- (double)fullBleedOffset
{
  return self->_fullBleedOffset;
}

- (void)setFullBleedOffset:(double)a3
{
  self->_fullBleedOffset = a3;
}

- (void).cxx_destruct
{
}

@end