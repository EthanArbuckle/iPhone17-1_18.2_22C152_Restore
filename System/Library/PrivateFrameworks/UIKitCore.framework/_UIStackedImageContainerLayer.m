@interface _UIStackedImageContainerLayer
+ (CGSize)_scaledSizeForSize:(CGSize)result focusSizeIncrease:(double)a4 selectionStyle:(int64_t)a5;
+ (id)_layerStackObservingKeys;
- (BOOL)_aspectMatchesLayerStack;
- (BOOL)_configuredForNonOpaqueShadow;
- (BOOL)_isFocused;
- (BOOL)_isFocusedIdle;
- (BOOL)_isFocusedOrFocusedIdle;
- (BOOL)_isHighlighted;
- (BOOL)_isNormal;
- (BOOL)_isSelected;
- (BOOL)_radiosityEnabled;
- (BOOL)isPressed;
- (BOOL)isSelected;
- (CATransform3D)_fixedFrameTransformForDepth:(SEL)a3 fudgeFactor:(double)a4;
- (CATransform3D)_perspectiveTransformForCurrentState;
- (CATransform3D)_rotationTransformForCurrentFocusDirection;
- (CATransform3D)_scaleTransformForCurrentState;
- (CATransform3D)_specularTransformForCurrentState;
- (CGImage)_cgImageForLayeredImage:(id)a3;
- (CGPoint)_layerStackToDisplayScaleFactor;
- (CGPoint)focusDirection;
- (CGRect)_cursorBounds;
- (CGRect)_displayFrameForModelFrame:(CGRect)a3;
- (CGRect)_positionAndSizeForLayerImage:(id)a3;
- (CGSize)_focusCursorInsetSizeForSize:(CGSize)a3;
- (CGSize)_roundedBoundsSize;
- (CGSize)_scaledSizeForCurrentState;
- (UINamedLayerStack)layerStack;
- (_UIStackedImageConfiguration)configuration;
- (_UIStackedImageContainerLayer)init;
- (double)_focusedScaleFactorForCurrentBounds;
- (double)_focusedShadowRadius;
- (double)_getShadowOpacity;
- (double)_idleModeFocusSizeOffset;
- (double)_unfocusedShadowRadius;
- (id)_contentLayers;
- (id)_flatLayer;
- (id)_imageLayersContainer;
- (id)_imageStackContentsGravity;
- (id)_layerBelowTitles;
- (id)_overlayLayer;
- (id)_parallaxLayerDepths;
- (id)_preferredLayoutDelegateForLayer:(id)a3;
- (id)_randomImage;
- (id)_shadowLayer;
- (id)_unmaskedOverlayLayer;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (int64_t)_selectionStyle;
- (unint64_t)_primaryControlStateForState:(unint64_t)a3;
- (unint64_t)controlState;
- (void)_applyFocusDirectionTransform;
- (void)_applyFocusDirectionTransformWithAnimationCoordinator:(id)a3;
- (void)_deselect;
- (void)_layoutRadiosityLayer;
- (void)_removeLayerFromSuperlayer:(id)a3;
- (void)_resetAnimatingToNormalState;
- (void)_setControlState:(unint64_t)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5 completion:(id)a6;
- (void)_setDefaultParallaxLayerDepths;
- (void)_setFlatImage:(id)a3;
- (void)_setFocusDirection:(CGPoint)a3 duration:(double)a4;
- (void)_setIdleModeFocusSizeOffset:(double)a3;
- (void)_setImageStackContentsGravity:(id)a3;
- (void)_setLayerStack:(id)a3;
- (void)_setLayerStackInflated:(BOOL)a3 seed:(unint64_t)a4;
- (void)_setOverlayLayer:(id)a3;
- (void)_setParallaxImages:(id)a3;
- (void)_setParallaxLayerDepths:(id)a3;
- (void)_setSelectionStyle:(int64_t)a3;
- (void)_setUnmaskedOverlayLayer:(id)a3;
- (void)_setupFrontmostTransformLayers;
- (void)_showImageLayers;
- (void)_updateContentProviderLayerFocusDirection;
- (void)_updateCornerRadiusFromConfig;
- (void)_updateFocusKeylineStrokeScale;
- (void)_updateFocusKeylineStrokeTranslation:(CGPoint)a3;
- (void)_updateFullBleedImageLayers;
- (void)_updateImageLayerFilterChains;
- (void)_updateImageLayerFilterValues;
- (void)_updateLayerForSelection;
- (void)_updateLayerForSelectionWithAnimationCoordinator:(id)a3;
- (void)_updateNonOpaqueShadowStateFromLayerStack;
- (void)_updateNormalImageLayers;
- (void)_updateOverlayContainerLayerHierarchy:(BOOL)a3;
- (void)_updateOverlayLayout;
- (void)_updatePerspective;
- (void)_updateRadiosityFromLayerStack;
- (void)_updateRotationAndTranslation:(id)a3;
- (void)_updateShadowBounds;
- (void)_updateShadowPositionWithOffset:(CGPoint)a3;
- (void)_updateShadowWithAnimationCoordinator:(id)a3;
- (void)_updateSingleLayerNoMaskFromLayerStack;
- (void)_updateSpecularLayerContents;
- (void)_updateSpecularLayerContentsRect;
- (void)_wrapLayerInView:(id)a3;
- (void)dealloc;
- (void)layoutSublayers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllAnimations;
- (void)setBounds:(CGRect)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentsScale:(double)a3;
- (void)setControlState:(unint64_t)a3;
- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5;
- (void)setFocusDirection:(CGPoint)a3;
- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4;
- (void)setLayerStack:(id)a3;
- (void)setPressed:(BOOL)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setRasterizationScale:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5;
@end

@implementation _UIStackedImageContainerLayer

- (_UIStackedImageContainerLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStackedImageContainerLayer;
  v2 = [(_UIStackedImageContainerLayer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_UIStackedImageContainerLayer *)v2 setDelegate:v2];
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_configuration)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = [(id)objc_opt_class() _layerStackObservingKeys];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [(_UIStackedImageConfiguration *)self->_configuration removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v7++) context:@"__layerStackObservingContext"];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIStackedImageContainerLayer;
  [(_UIStackedImageContainerLayer *)&v8 dealloc];
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  uint64_t v6 = (_UIStackedImageContainerLayer *)a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (v6 == self && [v7 isEqualToString:@"sublayers"])
  {
    long long v9 = [MEMORY[0x1E4F1CA98] null];
    goto LABEL_10;
  }
  if ((_UIStackedImageContainerLayer *)self->_shadowLayer != v6) {
    goto LABEL_5;
  }
  if (self->_nonOpaqueShadow)
  {
    if (![v8 hasPrefix:@"shadow"]
      || ([MEMORY[0x1E4F39B48] animationWithKeyPath:v8],
          (long long v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_5:
      if (_CASupportsAnimationForKey(v8))
      {
        long long v9 = [MEMORY[0x1E4F39B48] animationWithKeyPath:v8];
        long long v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
        [v9 setTimingFunction:v10];
      }
      else
      {
        long long v9 = 0;
      }
    }
  }
  else
  {
    if (-[_UIStackedImageConfiguration useSeparateUnfocusedShadowImage](self->_configuration, "useSeparateUnfocusedShadowImage")|| ![v8 isEqualToString:@"contentsScale"])
    {
      goto LABEL_5;
    }
    long long v9 = [MEMORY[0x1E4F39B48] animationWithKeyPath:v8];
    [(CALayer *)self->_shadowLayer contentsScale];
    double v14 = v13;
    [(_UIStackedImageContainerLayer *)self contentsScale];
    if (v14 <= v15)
    {
      LODWORD(v15) = 0.75;
      double v16 = 0.0;
      LODWORD(v17) = 0.5;
      LODWORD(v18) = 0.5;
    }
    else
    {
      double v15 = 0.0;
      LODWORD(v16) = 0.75;
      LODWORD(v17) = 0.5;
      LODWORD(v18) = 1.0;
    }
    v19 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v15 :v16 :v17 :v18];
    [v9 setTimingFunction:v19];

    if (!v9) {
      goto LABEL_5;
    }
  }
  [v9 setFillMode:*MEMORY[0x1E4F39F98]];
  if (([(_UIStackedImageContainerLayer *)v6 hasBeenCommitted] & 1) == 0)
  {
    long long v11 = [(_UIStackedImageContainerLayer *)v6 valueForKey:v8];
    [v9 setFromValue:v11];
  }
LABEL_10:

  return v9;
}

- (void)removeAllAnimations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_UIStackedImageContainerLayer;
  [(_UIStackedImageContainerLayer *)&v12 removeAllAnimations];
  [(CALayer *)self->_imageLayersContainer removeAllAnimations];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_imageLayers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "removeAllAnimations", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }

  [(CALayer *)self->_flatLayer removeAllAnimations];
  [(CALayer *)self->_maskLayer removeAllAnimations];
  [(CALayer *)self->_radiosityLayer removeAllAnimations];
  [(CALayer *)self->_selectedPlaceholderLayer removeAllAnimations];
  [(CALayer *)self->_shadowLayer removeAllAnimations];
  [(CALayer *)self->_unfocusedShadowLayer removeAllAnimations];
  [(CALayer *)self->_specularLayer removeAllAnimations];
  [(CALayer *)self->_cursorLayer removeAllAnimations];
  [(CALayer *)self->_cursorLayerContainer removeAllAnimations];
  [(CALayer *)self->_focusKeylineStrokeLayer removeAllAnimations];
  [(CALayer *)self->_overlayLayer removeAllAnimations];
  [(CALayer *)self->_overlayContainerLayer removeAllAnimations];
  [(CALayer *)self->_unmaskedOverlayLayer removeAllAnimations];
  [(CALayer *)self->_unmaskedOverlayContainerLayer removeAllAnimations];
  [(CATransformLayer *)self->_imagePerspectiveTransformLayer removeAllAnimations];
  [(CATransformLayer *)self->_imageRotationTransformLayer removeAllAnimations];
  [(CATransformLayer *)self->_maskPerspectiveTransformLayer removeAllAnimations];
  [(CATransformLayer *)self->_maskRotationTransformLayer removeAllAnimations];
  [(CATransformLayer *)self->_unmaskedOverlayPerspectiveTransformLayer removeAllAnimations];
  [(CATransformLayer *)self->_unmaskedOverlayRotationTransformLayer removeAllAnimations];
  [(CATransformLayer *)self->_cursorRotationTransformLayer removeAllAnimations];
  [(CALayer *)self->_frontmostPerspectiveTransformLayer removeAllAnimations];
  [(CATransformLayer *)self->_frontmostRotationTransformLayer removeAllAnimations];
}

- (void)setContentsScale:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_UIStackedImageContainerLayer;
  -[_UIStackedImageContainerLayer setContentsScale:](&v14, sel_setContentsScale_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(_UIStackedImageContainerLayer *)self _contentLayers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setContentsScale:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  [(_UIStackedImageContainerLayer *)self _updateShadowWithAnimationCoordinator:0];
  [(_UIStackedImageContainerLayer *)self _updateSpecularLayerContents];
}

- (void)setRasterizationScale:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_UIStackedImageContainerLayer;
  -[_UIStackedImageContainerLayer setRasterizationScale:](&v14, sel_setRasterizationScale_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(_UIStackedImageContainerLayer *)self _contentLayers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setRasterizationScale:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  [(CALayer *)self->_shadowLayer setRasterizationScale:a3];
  [(CALayer *)self->_unfocusedShadowLayer setRasterizationScale:a3];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_UIStackedImageContainerLayer *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)_UIStackedImageContainerLayer;
  -[_UIStackedImageContainerLayer setBounds:](&v16, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    if (height <= width) {
      double v13 = width;
    }
    else {
      double v13 = height;
    }
    double v14 = fmax(fmin(v13 / 1920.0, 1.0), 0.0);
    CGFloat v15 = fmax(fmin(v14 * 30.0 + 6.0, 10.0), 0.0);
    self->_translationOffset.double x = v15;
    self->_translationOffset.double y = v15;
    self->_rotationAmount = fmax(fmin(v14 * -0.25 + 0.12, 0.12), 0.025);
    self->_maximumParallaxDepth = fmax(fmin(v14 * 400.0, 60.0), 20.0);
    [(_UIStackedImageContainerLayer *)self _setDefaultParallaxLayerDepths];
    [(_UIStackedImageContainerLayer *)self layoutBelowIfNeeded];
    [(_UIStackedImageContainerLayer *)self _updateNonOpaqueShadowStateFromLayerStack];
  }
}

- (void)layoutSublayers
{
  v50.receiver = self;
  v50.super_class = (Class)_UIStackedImageContainerLayer;
  [(_UIStackedImageContainerLayer *)&v50 layoutSublayers];
  [(_UIStackedImageContainerLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CATransformLayer *)self->_imagePerspectiveTransformLayer bounds];
  double v12 = vabdd_f64(v11, v10);
  [(CATransformLayer *)self->_imagePerspectiveTransformLayer bounds];
  double v14 = vabdd_f64(v13, v8);
  if (v12 < 1.0 && v14 < 1.0)
  {
    if (![(_UIStackedImageContainerLayer *)self _radiosityEnabled]
      || !self->_radiosityNeedsLayout)
    {
      return;
    }
LABEL_28:
    uint64_t v46 = [MEMORY[0x1E4F39CF8] disableActions];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(_UIStackedImageContainerLayer *)self _layoutRadiosityLayer];
    [MEMORY[0x1E4F39CF8] setDisableActions:v46];
    self->_radiosityNeedsLayout = 0;
    return;
  }
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_imageLayersContainer, self, v4, v6, v8, v10);
  NSUInteger v16 = [(NSArray *)self->_imageLayers count];
  double v17 = *MEMORY[0x1E4F1DAD8];
  double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v47 = v6;
  double v49 = v4;
  if (v16)
  {
    unint64_t v19 = 0;
    do
    {
      v20 = -[NSArray objectAtIndexedSubscript:](self->_parallaxImages, "objectAtIndexedSubscript:", v19, *(void *)&v47);
      v21 = [(NSArray *)self->_imageLayers objectAtIndexedSubscript:v19];
      v22 = [v21 delegate];
      v23 = [(_UIStackedImageContainerLayer *)self _preferredLayoutDelegateForLayer:v21];
      [v21 setDelegate:v23];

      [(_UIStackedImageContainerLayer *)self _positionAndSizeForLayerImage:v20];
      double v25 = v24;
      double v27 = v26;
      objc_msgSend(v21, "setBounds:", v17, v18);
      objc_msgSend(v21, "setPosition:", v25, v27);
      [v21 setDelegate:v22];

      ++v19;
    }
    while (v19 < [(NSArray *)self->_imageLayers count]);
  }
  [(UINamedLayerStack *)self->_layerStack size];
  -[_UIStackedImageContainerLayer _displayFrameForModelFrame:](self, "_displayFrameForModelFrame:", v17, v18, v28, v29);
  double x = v51.origin.x;
  double y = v51.origin.y;
  double width = v51.size.width;
  double height = v51.size.height;
  IsEmptdouble y = CGRectIsEmpty(v51);
  if (IsEmpty) {
    double v35 = v49;
  }
  else {
    double v35 = x;
  }
  if (IsEmpty) {
    double v36 = v48;
  }
  else {
    double v36 = y;
  }
  if (IsEmpty) {
    double v37 = v8;
  }
  else {
    double v37 = width;
  }
  if (IsEmpty) {
    double v38 = v10;
  }
  else {
    double v38 = height;
  }
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_flatLayer, self, v35, v36, v37, v38);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_imagePerspectiveTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_imageRotationTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_maskPerspectiveTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_maskRotationTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_unmaskedOverlayPerspectiveTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_unmaskedOverlayRotationTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_cursorRotationTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_cursorLayerContainer, self, v49, v48, v8, v10);
  cursorLayer = self->_cursorLayer;
  v40 = [(_UIStackedImageContainerLayer *)self _preferredLayoutDelegateForLayer:cursorLayer];
  [(CALayer *)cursorLayer setDelegate:v40];

  -[CALayer setPosition:](self->_cursorLayer, "setPosition:", v49 + v8 * 0.5, v48 + v10 * 0.5);
  v41 = self->_cursorLayer;
  [(_UIStackedImageContainerLayer *)self _cursorBounds];
  -[CALayer setBounds:](v41, "setBounds:");
  [(CALayer *)self->_cursorLayer setDelegate:self];
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_maskLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_selectedPlaceholderLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_focusKeylineStrokeLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_specularLayer, self, v49, v48, v8, v10);
  if (!self->_animatingStateChange)
  {
    shadowLayer = self->_shadowLayer;
    v43 = [(_UIStackedImageContainerLayer *)self _preferredLayoutDelegateForLayer:shadowLayer];
    [(CALayer *)shadowLayer setDelegate:v43];

    unfocusedShadowLayer = self->_unfocusedShadowLayer;
    v45 = [(_UIStackedImageContainerLayer *)self _preferredLayoutDelegateForLayer:unfocusedShadowLayer];
    [(CALayer *)unfocusedShadowLayer setDelegate:v45];

    [(_UIStackedImageContainerLayer *)self _updateShadowBounds];
    -[_UIStackedImageContainerLayer _updateShadowPositionWithOffset:](self, "_updateShadowPositionWithOffset:", v17, v18);
    [(_UIStackedImageContainerLayer *)self _updateShadowWithAnimationCoordinator:0];
    [(CALayer *)self->_shadowLayer setDelegate:self];
    [(CALayer *)self->_unfocusedShadowLayer setDelegate:self];
  }
  [(_UIStackedImageContainerLayer *)self _updateOverlayLayout];
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_frontmostPerspectiveTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_frontmostRotationTransformLayer, self, v49, v48, v8, v10);
  if ([(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle]) {
    [(_UIStackedImageContainerLayer *)self _updateLayerForSelection];
  }
  if ([(_UIStackedImageContainerLayer *)self _radiosityEnabled]) {
    goto LABEL_28;
  }
}

- (void)_updateOverlayLayout
{
  [(_UIStackedImageContainerLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle]
    && self->_selectionStyle == 1
    && [(_UIStackedImageConfiguration *)self->_configuration fullBleedCenteredGrowth])
  {
    [(_UIStackedImageContainerLayer *)self _scaledSizeForCurrentState];
    double v8 = v11;
    double v10 = v12;
  }
  if (self->_overlayLayer)
  {
    __53___UIStackedImageContainerLayer__updateOverlayLayout__block_invoke(self->_overlayContainerLayer, self, v4, v6, v8, v10);
    __53___UIStackedImageContainerLayer__updateOverlayLayout__block_invoke(self->_overlayLayer, self, v4, v6, v8, v10);
  }
  if (self->_unmaskedOverlayLayer)
  {
    __53___UIStackedImageContainerLayer__updateOverlayLayout__block_invoke(self->_unmaskedOverlayContainerLayer, self, v4, v6, v8, v10);
    unmaskedOverlayLayer = self->_unmaskedOverlayLayer;
    __53___UIStackedImageContainerLayer__updateOverlayLayout__block_invoke(unmaskedOverlayLayer, self, v4, v6, v8, v10);
  }
}

- (void)_layoutRadiosityLayer
{
  [(_UIStackedImageContainerLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CALayer *)self->_radiosityLayer contents];

  if (!v11)
  {
    double v12 = v8;
    double v13 = v10;
    goto LABEL_8;
  }
  double v12 = v8 * self->_radiosityImageScale.width;
  double v13 = v10 * self->_radiosityImageScale.height;
  [(CALayer *)self->_radiosityLayer bounds];
  if (v12 != v15 || v13 != v14)
  {
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
LABEL_8:
    -[CALayer setBounds:](self->_radiosityLayer, "setBounds:", v4, v6, v12, v13);
    radiosityLayer = self->_radiosityLayer;
    [(_UIStackedImageConfiguration *)self->_configuration radiosityOffset];
    -[CALayer setPosition:](radiosityLayer, "setPosition:", v8 * 0.5, v10 * 0.5 + v18);
  }
}

- (void)_setupFrontmostTransformLayers
{
  [(_UIStackedImageContainerLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (!self->_frontmostPerspectiveTransformLayer)
  {
    double v11 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    frontmostPerspectiveTransformLayer = self->_frontmostPerspectiveTransformLayer;
    self->_frontmostPerspectiveTransformLayer = v11;

    [(CALayer *)self->_frontmostPerspectiveTransformLayer setDelegate:self];
    -[CALayer setFrame:](self->_frontmostPerspectiveTransformLayer, "setFrame:", v4, v6, v8, v10);
    [(CALayer *)self->_frontmostPerspectiveTransformLayer setZPosition:50.0];
    unmaskedOverlayPerspectiveTransformLayer = self->_unmaskedOverlayPerspectiveTransformLayer;
    if (!unmaskedOverlayPerspectiveTransformLayer) {
      unmaskedOverlayPerspectiveTransformLayer = (CATransformLayer *)self->_imageLayersContainer;
    }
    [(_UIStackedImageContainerLayer *)self insertSublayer:self->_frontmostPerspectiveTransformLayer above:unmaskedOverlayPerspectiveTransformLayer];
  }
  if (!self->_frontmostRotationTransformLayer)
  {
    double v14 = (CATransformLayer *)objc_alloc_init(MEMORY[0x1E4F39D10]);
    frontmostRotationTransformLayer = self->_frontmostRotationTransformLayer;
    self->_frontmostRotationTransformLayer = v14;

    [(CATransformLayer *)self->_frontmostRotationTransformLayer setDelegate:self];
    -[CATransformLayer setFrame:](self->_frontmostRotationTransformLayer, "setFrame:", v4, v6, v8, v10);
    NSUInteger v16 = self->_frontmostPerspectiveTransformLayer;
    double v17 = self->_frontmostRotationTransformLayer;
    [(CALayer *)v16 addSublayer:v17];
  }
}

- (CGRect)_cursorBounds
{
  [(_UIStackedImageContainerLayer *)self bounds];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  if (!CGRectIsEmpty(v25))
  {
    if (self->_selectionStyle == 1
      && [(_UIStackedImageConfiguration *)self->_configuration fullBleedCenteredGrowth])
    {
      double scale = self->_scale;
      double v8 = (CGAffineTransform *)v24;
      double v9 = (CGAffineTransform *)v24;
      double v10 = 1.0;
    }
    else
    {
      double v10 = self->_scale;
      double v8 = (CGAffineTransform *)v23;
      double v9 = (CGAffineTransform *)v23;
      double scale = v10;
    }
    CGAffineTransformMakeScale(v9, v10, scale);
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    CGRect v27 = CGRectApplyAffineTransform(v26, v8);
    CGFloat v11 = v27.origin.x;
    CGFloat v12 = v27.origin.y;
    CGFloat v13 = v27.size.width;
    CGFloat v14 = v27.size.height;
    [(_UIStackedImageConfiguration *)self->_configuration focusCursorBorderWidth];
    CGFloat v16 = v15 * -2.0;
    [(_UIStackedImageConfiguration *)self->_configuration focusCursorBorderWidth];
    CGFloat v18 = v17 * -2.0;
    v28.origin.CGFloat x = v11;
    v28.origin.CGFloat y = v12;
    v28.size.CGFloat width = v13;
    v28.size.CGFloat height = v14;
    CGRect v29 = CGRectInset(v28, v16, v18);
    CGFloat x = v29.origin.x;
    CGFloat y = v29.origin.y;
    CGFloat width = v29.size.width;
    CGFloat height = v29.size.height;
  }
  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (id)_preferredLayoutDelegateForLayer:(id)a3
{
  id v4 = a3;
  double v5 = [v4 delegate];
  double v6 = v5;
  if (!v5 || v5 == self)
  {
    layoutDelegate = self->_layoutDelegate;
    if (layoutDelegate)
    {
      double v8 = layoutDelegate;

      double v6 = v8;
    }
    else
    {
      double v9 = [_UIStackedImageLayerDelegate alloc];
      double v10 = -[UIView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      CGFloat v11 = self->_layoutDelegate;
      self->_layoutDelegate = v10;

      CGFloat v12 = self->_layoutDelegate;
      double v6 = v12;
      if (!v12)
      {
        double v6 = [v4 delegate];
      }
    }
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  CGFloat v11 = v10;
  if (a6 != @"__layerStackObservingContext")
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIStackedImageContainerLayer;
    [(_UIStackedImageContainerLayer *)&v14 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
    goto LABEL_18;
  }
  if ([v10 isEqualToString:@"cornerRadius"])
  {
    [(_UIStackedImageContainerLayer *)self _updateCornerRadiusFromConfig];
LABEL_5:
    [(_UIStackedImageContainerLayer *)self _updateLayerForSelection];
    goto LABEL_18;
  }
  if (![v11 isEqualToString:@"radiosityStrength"])
  {
    if ([v11 isEqualToString:@"placeholderImage"])
    {
      [(_UIStackedImageContainerLayer *)self _setFlatImage:[(UINamedLayerStack *)self->_layerStack flattenedImage]];
      goto LABEL_18;
    }
    if ([v11 isEqualToString:@"allowsNonOpaqueShadow"])
    {
      [(_UIStackedImageContainerLayer *)self _updateNonOpaqueShadowStateFromLayerStack];
      goto LABEL_18;
    }
    if (([v11 isEqualToString:@"boostBrightness"] & 1) != 0
      || [v11 isEqualToString:@"hueShift"])
    {
      [(_UIStackedImageContainerLayer *)self _updateSingleLayerNoMaskFromLayerStack];
      goto LABEL_18;
    }
    if (![v11 isEqualToString:@"focusCursorEnabled"]) {
      goto LABEL_18;
    }
    goto LABEL_5;
  }
  if ([(_UIStackedImageContainerLayer *)self _radiosityEnabled] && !self->_radiosityLayer) {
    [(_UIStackedImageContainerLayer *)self _updateRadiosityFromLayerStack];
  }
  radiosityLayer = self->_radiosityLayer;
  [(_UIStackedImageConfiguration *)self->_configuration radiosityStrength];
  *(float *)&double v13 = v13;
  [(CALayer *)radiosityLayer setOpacity:v13];
LABEL_18:
}

+ (id)_layerStackObservingKeys
{
  if (_MergedGlobals_21_6 != -1) {
    dispatch_once(&_MergedGlobals_21_6, &__block_literal_global_184_1);
  }
  v2 = (void *)qword_1EB25E860;
  return v2;
}

- (void)_updateCornerRadiusFromConfig
{
  if ([(_UIStackedImageConfiguration *)self->_configuration flatImageContainsCornerRadius])
  {
    [(_UIStackedImageConfiguration *)self->_configuration cornerRadius];
    double v4 = v3;
LABEL_5:
    if (self->_flatImage)
    {
      p_flatLayer = &self->_flatLayer;
      double v8 = 0.0;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    [(_UIStackedImageConfiguration *)self->_configuration cornerRadius];
    double v4 = v9;
    goto LABEL_8;
  }
  int v5 = [(UINamedLayerStack *)self->_layerStack flatImageContainsCornerRadius];
  [(_UIStackedImageConfiguration *)self->_configuration cornerRadius];
  double v4 = v6;
  if (v5) {
    goto LABEL_5;
  }
LABEL_8:
  [(_UIStackedImageConfiguration *)self->_configuration isContinuousCornerRadiusEnabled];
  p_flatLayer = &self->_flatLayer;
  _setCornerCurveOnLayer(v10 != 0.0, self->_flatLayer);
  double v8 = v4;
LABEL_9:
  [(CALayer *)*p_flatLayer setCornerRadius:v8];
  [(_UIStackedImageConfiguration *)self->_configuration isContinuousCornerRadiusEnabled];
  _setCornerCurveOnLayer(v11 != 0.0, self->_maskLayer);
  [(CALayer *)self->_maskLayer setCornerRadius:v4];
  [(_UIStackedImageConfiguration *)self->_configuration isContinuousCornerRadiusEnabled];
  _setCornerCurveOnLayer(v12 != 0.0, self->_cursorLayer);
  cursorLayer = self->_cursorLayer;
  [(_UIStackedImageConfiguration *)self->_configuration focusCursorBorderWidth];
  double v15 = v4 + v14 + v14;
  [(CALayer *)cursorLayer setCornerRadius:v15];
}

- (void)setConfiguration:(id)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_configuration = &self->_configuration;
  if (![(_UIStackedImageConfiguration *)self->_configuration isEqual:v5])
  {
    [(_UIStackedImageContainerLayer *)self bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    if (*p_configuration)
    {
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      double v15 = [(id)objc_opt_class() _layerStackObservingKeys];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v101 objects:v106 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v102;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v102 != v18) {
              objc_enumerationMutation(v15);
            }
            [(_UIStackedImageConfiguration *)*p_configuration removeObserver:self forKeyPath:*(void *)(*((void *)&v101 + 1) + 8 * i) context:@"__layerStackObservingContext"];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v101 objects:v106 count:16];
        }
        while (v17);
      }
    }
    objc_storeStrong((id *)&self->_configuration, a3);
    if (*p_configuration)
    {
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      double v20 = [(id)objc_opt_class() _layerStackObservingKeys];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v97 objects:v105 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v98;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v98 != v23) {
              objc_enumerationMutation(v20);
            }
            [(_UIStackedImageConfiguration *)*p_configuration addObserver:self forKeyPath:*(void *)(*((void *)&v97 + 1) + 8 * j) options:1 context:@"__layerStackObservingContext"];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v97 objects:v105 count:16];
        }
        while (v22);
      }
    }
    if (!self->_flatLayer)
    {
      unsigned int v96 = [MEMORY[0x1E4F39CF8] disableActions];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      self->_idleModeFocusSizeOffset = 20.0;
      self->_double scale = 1.0;
      [(_UIStackedImageContainerLayer *)self setAllowsGroupOpacity:0];
      [(_UIStackedImageContainerLayer *)self setAllowsEdgeAntialiasing:0];
      CGRect v25 = +[UIScreen mainScreen];
      CGRect v26 = [v25 traitCollection];
      uint64_t v27 = [v26 userInterfaceStyle];

      uint64_t v94 = v27;
      if (v27 == 1000) {
        +[UIColor colorWithWhite:1.0 alpha:0.3];
      }
      else {
      CGRect v28 = +[UIColor blackColor];
      }
      CGRect v29 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      unfocusedShadowLayer = self->_unfocusedShadowLayer;
      self->_unfocusedShadowLayer = v29;

      [(CALayer *)self->_unfocusedShadowLayer setDelegate:self];
      -[CALayer setAnchorPoint:](self->_unfocusedShadowLayer, "setAnchorPoint:", 0.5, 0.5);
      [(CALayer *)self->_unfocusedShadowLayer setZPosition:-52.0];
      -[CALayer setFrame:](self->_unfocusedShadowLayer, "setFrame:", v8, v10, v12, v14);
      [(CALayer *)self->_unfocusedShadowLayer setAllowsGroupOpacity:0];
      [(CALayer *)self->_unfocusedShadowLayer setAllowsEdgeAntialiasing:0];
      v31 = self->_unfocusedShadowLayer;
      id v32 = v28;
      -[CALayer setShadowColor:](v31, "setShadowColor:", [v32 CGColor]);
      [(_UIStackedImageContainerLayer *)self addSublayer:self->_unfocusedShadowLayer];
      v33 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      shadowLayer = self->_shadowLayer;
      self->_shadowLayer = v33;

      [(CALayer *)self->_shadowLayer setDelegate:self];
      -[CALayer setAnchorPoint:](self->_shadowLayer, "setAnchorPoint:", 0.5, 0.5);
      [(CALayer *)self->_shadowLayer setZPosition:-51.0];
      -[CALayer setFrame:](self->_shadowLayer, "setFrame:", v8, v10, v12, v14);
      [(CALayer *)self->_shadowLayer setAllowsGroupOpacity:0];
      [(CALayer *)self->_shadowLayer setAllowsEdgeAntialiasing:0];
      double v35 = self->_shadowLayer;
      id v36 = v32;
      -[CALayer setShadowColor:](v35, "setShadowColor:", [v36 CGColor]);
      [(_UIStackedImageContainerLayer *)self addSublayer:self->_shadowLayer];

      double v37 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      cursorLayerContainer = self->_cursorLayerContainer;
      self->_cursorLayerContainer = v37;

      [(CALayer *)self->_cursorLayerContainer setDelegate:self];
      -[CALayer setFrame:](self->_cursorLayerContainer, "setFrame:", v8, v10, v12, v14);
      [(_UIStackedImageContainerLayer *)self addSublayer:self->_cursorLayerContainer];
      v39 = (CATransformLayer *)objc_alloc_init(MEMORY[0x1E4F39D10]);
      cursorRotationTransformLayer = self->_cursorRotationTransformLayer;
      self->_cursorRotationTransformLayer = v39;

      [(CATransformLayer *)self->_cursorRotationTransformLayer setDelegate:self];
      -[CATransformLayer setFrame:](self->_cursorRotationTransformLayer, "setFrame:", v8, v10, v12, v14);
      [(CALayer *)self->_cursorLayerContainer addSublayer:self->_cursorRotationTransformLayer];
      v41 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      cursorLayer = self->_cursorLayer;
      self->_cursorLayer = v41;

      [(CALayer *)self->_cursorLayer setDelegate:self];
      -[CALayer setAnchorPoint:](self->_cursorLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setFrame:](self->_cursorLayer, "setFrame:", v8, v10, v12, v14);
      [(CALayer *)self->_cursorLayer setAllowsGroupOpacity:0];
      [(CALayer *)self->_cursorLayer setAllowsEdgeAntialiasing:0];
      v43 = self->_cursorLayer;
      id v44 = +[UIColor whiteColor];
      -[CALayer setBorderColor:](v43, "setBorderColor:", [v44 CGColor]);

      v45 = self->_cursorLayer;
      id v46 = +[UIColor colorWithWhite:0.0 alpha:0.3];
      -[CALayer setBackgroundColor:](v45, "setBackgroundColor:", [v46 CGColor]);

      double v47 = self->_cursorLayer;
      [(_UIStackedImageConfiguration *)*p_configuration focusCursorBorderWidth];
      -[CALayer setBorderWidth:](v47, "setBorderWidth:");
      [(CALayer *)self->_cursorLayer setHidden:1];
      [(CATransformLayer *)self->_cursorRotationTransformLayer addSublayer:self->_cursorLayer];
      uint64_t v48 = *MEMORY[0x1E4F3A3E0];
      [(_UIStackedImageContainerLayer *)self _setImageStackContentsGravity:*MEMORY[0x1E4F3A3E0]];
      double v49 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      flatLayer = self->_flatLayer;
      self->_flatLayer = v49;

      -[CALayer setAnchorPoint:](self->_flatLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setFrame:](self->_flatLayer, "setFrame:", v8, v10, v12, v14);
      [(CALayer *)self->_flatLayer setMasksToBounds:1];
      [(CALayer *)self->_flatLayer setContentsGravity:v48];
      [(CALayer *)self->_flatLayer setAllowsGroupOpacity:0];
      [(CALayer *)self->_flatLayer setAllowsEdgeAntialiasing:0];
      CGRect v51 = self->_flatLayer;
      v52 = [(_UIStackedImageConfiguration *)*p_configuration placeholderImage];
      if (v52)
      {
        uint64_t v53 = 0;
        unint64_t v54 = 0x1E4F39000;
      }
      else
      {
        if (qword_1EB25E8A0 != -1) {
          dispatch_once(&qword_1EB25E8A0, &__block_literal_global_510_1);
        }
        unint64_t v54 = 0x1E4F39000uLL;
        uint64_t v53 = qword_1EB25E898;
      }
      -[CALayer setBackgroundColor:](v51, "setBackgroundColor:", v53, v94);

      v55 = self->_flatLayer;
      id v56 = [(_UIStackedImageConfiguration *)*p_configuration placeholderImage];
      -[CALayer setContents:](v55, "setContents:", [v56 CGImage]);

      [(_UIStackedImageContainerLayer *)self addSublayer:self->_flatLayer];
      v57 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      imageLayersContainer = self->_imageLayersContainer;
      self->_imageLayersContainer = v57;

      -[CALayer setAnchorPoint:](self->_imageLayersContainer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setFrame:](self->_imageLayersContainer, "setFrame:", v8, v10, v12, v14);
      [(CALayer *)self->_imageLayersContainer setAllowsGroupOpacity:0];
      [(CALayer *)self->_imageLayersContainer setAllowsEdgeAntialiasing:0];
      [(CALayer *)self->_imageLayersContainer setHidden:1];
      [(_UIStackedImageContainerLayer *)self addSublayer:self->_imageLayersContainer];
      v59 = (CATransformLayer *)objc_alloc_init(*(Class *)(v54 + 3344));
      imagePerspectiveTransformLayer = self->_imagePerspectiveTransformLayer;
      self->_imagePerspectiveTransformLayer = v59;

      [(CATransformLayer *)self->_imagePerspectiveTransformLayer setDelegate:self];
      -[CATransformLayer setAnchorPoint:](self->_imagePerspectiveTransformLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CATransformLayer setFrame:](self->_imagePerspectiveTransformLayer, "setFrame:", v8, v10, v12, v14);
      [(CALayer *)self->_imageLayersContainer addSublayer:self->_imagePerspectiveTransformLayer];
      v61 = (CATransformLayer *)objc_alloc_init(*(Class *)(v54 + 3344));
      imageRotationTransformLayer = self->_imageRotationTransformLayer;
      self->_imageRotationTransformLayer = v61;

      [(CATransformLayer *)self->_imageRotationTransformLayer setDelegate:self];
      -[CATransformLayer setAnchorPoint:](self->_imageRotationTransformLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CATransformLayer setFrame:](self->_imageRotationTransformLayer, "setFrame:", v8, v10, v12, v14);
      [(CATransformLayer *)self->_imagePerspectiveTransformLayer addSublayer:self->_imageRotationTransformLayer];
      v63 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      selectedPlaceholderLayer = self->_selectedPlaceholderLayer;
      self->_selectedPlaceholderLayer = v63;

      [(CALayer *)self->_selectedPlaceholderLayer setDelegate:self];
      -[CALayer setAnchorPoint:](self->_selectedPlaceholderLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setFrame:](self->_selectedPlaceholderLayer, "setFrame:", v8, v10, v12, v14);
      [(CALayer *)self->_selectedPlaceholderLayer setAllowsGroupOpacity:0];
      [(CALayer *)self->_selectedPlaceholderLayer setContentsGravity:v48];
      v65 = self->_selectedPlaceholderLayer;
      v66 = [(_UIStackedImageConfiguration *)*p_configuration placeholderImage];
      if (v66)
      {
        uint64_t v67 = 0;
      }
      else
      {
        if (qword_1EB25E8A0 != -1) {
          dispatch_once(&qword_1EB25E8A0, &__block_literal_global_510_1);
        }
        uint64_t v67 = qword_1EB25E898;
      }
      [(CALayer *)v65 setBackgroundColor:v67];

      v68 = self->_selectedPlaceholderLayer;
      id v69 = [(_UIStackedImageConfiguration *)*p_configuration placeholderImage];
      -[CALayer setContents:](v68, "setContents:", [v69 CGImage]);

      v70 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      maskLayer = self->_maskLayer;
      self->_maskLayer = v70;

      [(CALayer *)self->_maskLayer setDelegate:self];
      -[CALayer setAnchorPoint:](self->_maskLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setFrame:](self->_maskLayer, "setFrame:", v8, v10, v12, v14);
      v72 = self->_maskLayer;
      id v73 = +[UIColor colorWithWhite:0.0 alpha:1.0];
      -[CALayer setBackgroundColor:](v72, "setBackgroundColor:", [v73 CGColor]);

      [(CALayer *)self->_maskLayer setAllowsGroupOpacity:0];
      [(CALayer *)self->_maskLayer setAllowsEdgeAntialiasing:1];
      v74 = (CATransformLayer *)objc_alloc_init(*(Class *)(v54 + 3344));
      maskPerspectiveTransformLayer = self->_maskPerspectiveTransformLayer;
      self->_maskPerspectiveTransformLayer = v74;

      [(CATransformLayer *)self->_maskPerspectiveTransformLayer setDelegate:self];
      -[CATransformLayer setAnchorPoint:](self->_maskPerspectiveTransformLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CATransformLayer setFrame:](self->_maskPerspectiveTransformLayer, "setFrame:", v8, v10, v12, v14);
      [(CALayer *)self->_imageLayersContainer setMask:self->_maskPerspectiveTransformLayer];
      v76 = (CATransformLayer *)objc_alloc_init(*(Class *)(v54 + 3344));
      maskRotationTransformLayer = self->_maskRotationTransformLayer;
      self->_maskRotationTransformLayer = v76;

      [(CATransformLayer *)self->_maskRotationTransformLayer setDelegate:self];
      -[CATransformLayer setAnchorPoint:](self->_maskRotationTransformLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CATransformLayer setFrame:](self->_maskRotationTransformLayer, "setFrame:", v8, v10, v12, v14);
      [(CATransformLayer *)self->_maskPerspectiveTransformLayer addSublayer:self->_maskRotationTransformLayer];
      [(CATransformLayer *)self->_maskRotationTransformLayer addSublayer:self->_maskLayer];
      if (v95 == 1000)
      {
        [(_UIStackedImageContainerLayer *)self _setupFrontmostTransformLayers];
        v78 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
        focusKeylineStrokeLayer = self->_focusKeylineStrokeLayer;
        self->_focusKeylineStrokeLayer = v78;

        -[CALayer setAnchorPoint:](self->_focusKeylineStrokeLayer, "setAnchorPoint:", 0.5, 0.5);
        -[CALayer setFrame:](self->_focusKeylineStrokeLayer, "setFrame:", v8, v10, v12, v14);
        v80 = self->_focusKeylineStrokeLayer;
        id v81 = +[UIColor colorWithWhite:1.0 alpha:1.0];
        -[CALayer setBorderColor:](v80, "setBorderColor:", [v81 CGColor]);

        [(CALayer *)self->_focusKeylineStrokeLayer setBorderWidth:2.0];
        [(CALayer *)self->_focusKeylineStrokeLayer setAllowsGroupOpacity:0];
        [(CALayer *)self->_focusKeylineStrokeLayer setHidden:1];
        [(CALayer *)self->_focusKeylineStrokeLayer setDelegate:self];
        [(CATransformLayer *)self->_frontmostRotationTransformLayer addSublayer:self->_focusKeylineStrokeLayer];
      }
      v82 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      specularLayer = self->_specularLayer;
      self->_specularLayer = v82;

      [(CALayer *)self->_specularLayer setDelegate:self];
      -[CALayer setAnchorPoint:](self->_specularLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setFrame:](self->_specularLayer, "setFrame:", v8, v10, v12, v14);
      [(CALayer *)self->_specularLayer setAllowsGroupOpacity:0];
      [(CALayer *)self->_specularLayer setAllowsEdgeAntialiasing:0];
      [(_UIStackedImageContainerLayer *)self _updateSpecularLayerContents];
      [(CALayer *)self->_specularLayer setOpacity:0.0];
      [(CATransformLayer *)self->_imageRotationTransformLayer addSublayer:self->_specularLayer];
      v84 = [(_UIStackedImageContainerLayer *)self delegate];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v85 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
        animationView = self->_animationView;
        self->_animationView = v85;

        [v84 addSubview:self->_animationView];
      }
      else
      {
        v87 = [(_UIStackedImageContainerLayer *)self superlayer];
        v88 = [v87 delegate];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v90 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
          v91 = self->_animationView;
          self->_animationView = v90;

          v92 = [(_UIStackedImageContainerLayer *)self superlayer];
          v93 = [v92 delegate];
          [v93 addSubview:self->_animationView];
        }
      }
      [(_UIStackedImageContainerLayer *)self contentsScale];
      -[_UIStackedImageContainerLayer setContentsScale:](self, "setContentsScale:");
      [(_UIStackedImageContainerLayer *)self rasterizationScale];
      -[_UIStackedImageContainerLayer setRasterizationScale:](self, "setRasterizationScale:");
      v108.origin.CGFloat x = v8;
      v108.origin.CGFloat y = v10;
      v108.size.CGFloat width = v12;
      v108.size.CGFloat height = v14;
      if (!CGRectIsEmpty(v108)) {
        [(_UIStackedImageContainerLayer *)self _updateLayerForSelection];
      }
      [MEMORY[0x1E4F39CF8] setDisableActions:v96];
    }
    [(_UIStackedImageContainerLayer *)self _updateCornerRadiusFromConfig];
    [(_UIStackedImageContainerLayer *)self _updateSingleLayerNoMaskFromLayerStack];
  }
}

- (void)setLayerStack:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 size];
  double v7 = v6;
  double v8 = v5;
  if (fabs(v6) == INFINITY || fabs(v5) == INFINITY)
  {
    double v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayeredImage", &setLayerStack____s_category) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134218240;
      double v13 = v7;
      __int16 v14 = 2048;
      double v15 = v8;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Image has an invalid size. (w: %g, h: %g)", (uint8_t *)&v12, 0x16u);
    }
    double v9 = self;
    id v10 = 0;
  }
  else
  {
    double v9 = self;
    id v10 = v4;
  }
  [(_UIStackedImageContainerLayer *)v9 _setLayerStack:v10];
}

- (void)_setLayerStack:(id)a3
{
  p_layerStack = &self->_layerStack;
  id v12 = a3;
  if ((-[UINamedLayerStack isEqual:](*p_layerStack, "isEqual:") & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F39CF8] disableActions];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    if (self->_animatingToNormalState) {
      [(_UIStackedImageContainerLayer *)self _resetAnimatingToNormalState];
    }
    objc_storeStrong((id *)&self->_layerStack, a3);
    if (objc_opt_respondsToSelector()) {
      char v7 = objc_opt_respondsToSelector();
    }
    else {
      char v7 = 0;
    }
    self->_layerStackSupportsInflation = v7 & 1;
    double v8 = [(UINamedLayerStack *)*p_layerStack layers];
    double v9 = [v8 firstObject];
    id v10 = [v9 imageObj];
    self->_layerStackInflated = v10 != 0;

    -[_UIStackedImageContainerLayer _setFlatImage:](self, "_setFlatImage:", [v12 flattenedImage]);
    double v11 = [v12 layers];
    [(_UIStackedImageContainerLayer *)self _setParallaxImages:v11];

    if (self->_layerStackSupportsInflation
      && !self->_layerStackInflated
      && ![(_UIStackedImageContainerLayer *)self _isNormal]
      && !self->_deferredInflationPending)
    {
      [(_UIStackedImageContainerLayer *)self _setLayerStackInflated:1 seed:self->_layerStackInflationSeed];
    }
    [(_UIStackedImageContainerLayer *)self _updateSingleLayerNoMaskFromLayerStack];
    [(_UIStackedImageContainerLayer *)self _updateNonOpaqueShadowStateFromLayerStack];
    [(_UIStackedImageContainerLayer *)self _updateRadiosityFromLayerStack];
    [(_UIStackedImageContainerLayer *)self _updateCornerRadiusFromConfig];
    [(_UIStackedImageContainerLayer *)self setNeedsLayout];
    [MEMORY[0x1E4F39CF8] setDisableActions:v6];
  }
}

- (BOOL)_aspectMatchesLayerStack
{
  layerStack = self->_layerStack;
  if (layerStack)
  {
    [(UINamedLayerStack *)layerStack size];
    double v5 = v4;
    double v7 = v6;
    [(_UIStackedImageContainerLayer *)self bounds];
    LOBYTE(layerStack) = 0;
    if (v7 > 0.0 && v9 > 0.0) {
      LOBYTE(layerStack) = vabdd_f64(v5 / v7, v8 / v9) <= 0.01;
    }
  }
  return (char)layerStack;
}

- (void)_updateSingleLayerNoMaskFromLayerStack
{
  if ([(_UIStackedImageConfiguration *)self->_configuration disableMask])
  {
    if (self->_singleLayerNoMask) {
      return;
    }
    self->_singleLayerNoMask = 1;
    goto LABEL_4;
  }
  if (self->_selectionStyle)
  {
    if (!self->_singleLayerNoMask) {
      return;
    }
    self->_singleLayerNoMask = 0;
    goto LABEL_8;
  }
  double v5 = [(UINamedLayerStack *)self->_layerStack layers];
  if ((unint64_t)[v5 count] <= 1
    && ([(_UIStackedImageConfiguration *)self->_configuration cornerRadius], v6 == 0.0)
    && ![(_UIStackedImageConfiguration *)self->_configuration boostBrightness])
  {
    BOOL v7 = ![(_UIStackedImageConfiguration *)self->_configuration hueShift];
  }
  else
  {
    BOOL v7 = 0;
  }

  if (self->_singleLayerNoMask != v7)
  {
    self->_singleLayerNoMask = v7;
    if (v7)
    {
LABEL_4:
      [(CATransformLayer *)self->_maskPerspectiveTransformLayer setHidden:1];
      maskPerspectiveTransformLayer = 0;
LABEL_9:
      imageLayersContainer = self->_imageLayersContainer;
      [(CALayer *)imageLayersContainer setMask:maskPerspectiveTransformLayer];
      return;
    }
LABEL_8:
    [(CATransformLayer *)self->_maskPerspectiveTransformLayer setHidden:0];
    maskPerspectiveTransformLayer = self->_maskPerspectiveTransformLayer;
    goto LABEL_9;
  }
}

- (BOOL)_configuredForNonOpaqueShadow
{
  return self->_nonOpaqueShadow;
}

- (void)_updateNonOpaqueShadowStateFromLayerStack
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if ([(_UIStackedImageConfiguration *)self->_configuration allowsNonOpaqueShadow])
  {
    double v3 = [(UINamedLayerStack *)self->_layerStack layers];
    uint64_t v4 = [v3 count];

    if (v4 == 1)
    {
      if ([(_UIStackedImageContainerLayer *)self _aspectMatchesLayerStack])
      {
        double v5 = (CGImage *)[(UINamedLayerStack *)self->_layerStack flattenedImage];
        double v6 = v5;
        if (!v5) {
          goto LABEL_13;
        }
        CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(v5);
        if (AlphaInfo - 1 <= 3)
        {
          CGImageAlphaInfo v8 = AlphaInfo;
          memset(&srcARGB, 0, sizeof(srcARGB));
          memset(&destA, 0, sizeof(destA));
          memset(&destR, 0, sizeof(destR));
          memset(&destG, 0, sizeof(destG));
          memset(&destB, 0, sizeof(destB));
          CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(v6);
          int BitsPerComponent = CGImageGetBitsPerComponent(v6);
          size_t BitsPerPixel = CGImageGetBitsPerPixel(v6);
          size_t Width = CGImageGetWidth(v6);
          size_t Height = CGImageGetHeight(v6);
          v41[0] = BitsPerComponent;
          v41[1] = BitsPerPixel;
          CGColorSpaceRef ColorSpace = CGImageGetColorSpace(v6);
          CGBitmapInfo v43 = BitmapInfo;
          int v44 = 0;
          Decode = CGImageGetDecode(v6);
          uint64_t RenderingIntent = CGImageGetRenderingIntent(v6);
          uint64_t v14 = MEMORY[0x18C1096B0](&srcARGB, v41, 0, v6, 0);
          LODWORD(v6) = 0;
          if (v14
            || (LODWORD(v6) = 0, MEMORY[0x18C1096A0](&destA, Height, Width, BitsPerPixel, 0))
            || (LODWORD(v6) = 0, MEMORY[0x18C1096A0](&destR, Height, Width, BitsPerPixel, 0))
            || (LODWORD(v6) = 0, MEMORY[0x18C1096A0](&destG, Height, Width, BitsPerPixel, 0))
            || (LODWORD(v6) = 0, MEMORY[0x18C1096A0](&destB, Height, Width, BitsPerPixel, 0)))
          {
LABEL_11:
            free(srcARGB.data);
            free(destA.data);
            free(destR.data);
            free(destG.data);
            free(destB.data);
            goto LABEL_13;
          }
          unsigned int v26 = v8 & 0xFFFFFFFD;
          if ((BitmapInfo & 0x100) != 0)
          {
            if (v26 == 1)
            {
              p_vImage_Buffer destR = &destR;
              p_vImage_Buffer destG = &destG;
              p_vImage_Buffer destB = &destB;
              p_vImage_Buffer destA = &destA;
            }
            else
            {
              p_vImage_Buffer destR = &destA;
              p_vImage_Buffer destG = &destR;
              p_vImage_Buffer destB = &destG;
              p_vImage_Buffer destA = &destB;
            }
            LODWORD(v6) = 0;
            if (vImageConvert_ARGBFFFFtoPlanarF(&srcARGB, p_destR, p_destG, p_destB, p_destA, 0)) {
              goto LABEL_11;
            }
            vImage_Error v31 = vImageHistogramCalculation_PlanarF(&destA, histogram, 0x100u, 0.0, 1.0, 0);
          }
          else
          {
            if (v26 == 1)
            {
              uint64_t v27 = &destR;
              CGRect v28 = &destG;
              CGRect v29 = &destB;
              v30 = &destA;
            }
            else
            {
              uint64_t v27 = &destA;
              CGRect v28 = &destR;
              CGRect v29 = &destG;
              v30 = &destB;
            }
            LODWORD(v6) = 0;
            if (vImageConvert_ARGB8888toPlanar8(&srcARGB, v27, v28, v29, v30, 0)) {
              goto LABEL_11;
            }
            vImage_Error v31 = vImageHistogramCalculation_Planar8(&destA, histogram, 0);
          }
          LODWORD(v6) = 0;
          if (!v31)
          {
            uint64_t v36 = 0;
            do
            {
              vImagePixelCount v37 = histogram[v36];
              LODWORD(v6) = v37 != 0;
              if (v37) {
                break;
              }
            }
            while (v36++ != 254);
          }
          goto LABEL_11;
        }
      }
    }
  }
  LODWORD(v6) = 0;
LABEL_13:
  if (self->_nonOpaqueShadow != v6)
  {
    self->_nonOpaqueShadow = (char)v6;
    if (v6)
    {
      double v15 = [(NSArray *)self->_imageLayers firstObject];
      [(CALayer *)self->_shadowLayer setHidden:1];
      [(CALayer *)self->_unfocusedShadowLayer setHidden:1];
      [(CALayer *)self->_imageLayersContainer setMask:0];
      uint64_t v16 = [v15 contents];
      [(CALayer *)self->_maskLayer setContents:v16];

      uint64_t v17 = [v15 contentsGravity];
      [(CALayer *)self->_maskLayer setContentsGravity:v17];

      [(CALayer *)self->_maskLayer setBackgroundColor:0];
      maskLayer = self->_maskLayer;
      long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      long long v56 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      long long v57 = v19;
      long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      long long v58 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      long long v59 = v20;
      long long v21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)histogram = *MEMORY[0x1E4F39B10];
      long long v53 = v21;
      long long v22 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      long long v54 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      long long v55 = v22;
      [(CALayer *)maskLayer setTransform:histogram];
      [(CALayer *)self->_specularLayer setMask:self->_maskPerspectiveTransformLayer];
      [(CALayer *)self->_flatLayer setMasksToBounds:0];
    }
    else
    {
      [(CALayer *)self->_shadowLayer setHidden:0];
      [(CALayer *)self->_unfocusedShadowLayer setHidden:0];
      [(CALayer *)self->_imageLayersContainer setMask:self->_maskPerspectiveTransformLayer];
      [(CALayer *)self->_specularLayer setMask:0];
      [(CALayer *)self->_maskLayer setContents:0];
      id v23 = +[UIColor colorWithWhite:0.0 alpha:1.0];
      -[CALayer setBackgroundColor:](self->_maskLayer, "setBackgroundColor:", [v23 CGColor]);

      double v24 = self->_maskLayer;
      [(_UIStackedImageContainerLayer *)self _scaleTransformForCurrentState];
      [(CALayer *)v24 setTransform:v40];
      [(CALayer *)self->_flatLayer setShadowOpacity:0.0];
      [(CALayer *)self->_flatLayer setMasksToBounds:1];
    }
    specularLayer = self->_specularLayer;
    [(_UIStackedImageContainerLayer *)self _specularTransformForCurrentState];
    [(CALayer *)specularLayer setTransform:v39];
    [(_UIStackedImageContainerLayer *)self _updateShadowWithAnimationCoordinator:0];
  }
}

- (void)_updateRadiosityFromLayerStack
{
  BOOL v3 = [(_UIStackedImageContainerLayer *)self _radiosityEnabled];
  radiosityLayer = self->_radiosityLayer;
  if (v3)
  {
    if (!radiosityLayer)
    {
      double v5 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      double v6 = self->_radiosityLayer;
      self->_radiosityLayer = v5;

      -[CALayer setAnchorPoint:](self->_radiosityLayer, "setAnchorPoint:", 0.5, 0.5);
      [(CALayer *)self->_radiosityLayer setZPosition:-50.0];
      BOOL v7 = self->_radiosityLayer;
      [(_UIStackedImageContainerLayer *)self bounds];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      [(_UIStackedImageConfiguration *)self->_configuration radiosityOffset];
      CGFloat v17 = v16;
      v34.origin.CGFloat x = v9;
      v34.origin.CGFloat y = v11;
      v34.size.double width = v13;
      v34.size.CGFloat height = v15;
      CGRect v35 = CGRectOffset(v34, 0.0, v17);
      -[CALayer setFrame:](v7, "setFrame:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
      [(CALayer *)self->_radiosityLayer setAllowsGroupOpacity:0];
      [(CALayer *)self->_radiosityLayer setAllowsEdgeAntialiasing:0];
      uint64_t v18 = self->_radiosityLayer;
      [(_UIStackedImageConfiguration *)self->_configuration radiosityStrength];
      *(float *)&double v19 = v19;
      [(CALayer *)v18 setOpacity:v19];
      [(CALayer *)self->_radiosityLayer setDelegate:self];
      long long v20 = self->_radiosityLayer;
      [(_UIStackedImageContainerLayer *)self contentsScale];
      -[CALayer setContentsScale:](v20, "setContentsScale:");
      long long v21 = self->_radiosityLayer;
      [(_UIStackedImageContainerLayer *)self contentsScale];
      -[CALayer setRasterizationScale:](v21, "setRasterizationScale:");
      [(_UIStackedImageContainerLayer *)self insertSublayer:self->_radiosityLayer above:self->_shadowLayer];
    }
  }
  else
  {
    [(CALayer *)radiosityLayer removeFromSuperlayer];
    long long v22 = self->_radiosityLayer;
    self->_radiosityLayer = 0;
  }
  if ([(_UIStackedImageContainerLayer *)self _radiosityEnabled]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    p_radiosityImageScale = &self->_radiosityImageScale;
    self->_radiosityImageScale = (CGSize)*MEMORY[0x1E4F1DB30];
    double v24 = [(UINamedLayerStack *)self->_layerStack radiosityImage];
    [(CALayer *)self->_radiosityLayer setContents:v24];

    if (objc_opt_respondsToSelector())
    {
      [(UINamedLayerStack *)self->_layerStack radiosityImageScale];
      p_radiosityImageScale->double width = width;
      self->_radiosityImageScale.CGFloat height = v26;
    }
    else
    {
      double width = p_radiosityImageScale->width;
    }
    if (width == 0.0 || self->_radiosityImageScale.height == 0.0) {
      CGSize *p_radiosityImageScale = (CGSize)xmmword_186B9E650;
    }
    [(_UIStackedImageContainerLayer *)self _layoutRadiosityLayer];
  }
  else
  {
    uint64_t v27 = [(CALayer *)self->_radiosityLayer contents];

    if (v27)
    {
      [(CALayer *)self->_radiosityLayer setContents:0];
      self->_radiosityImageScale = (CGSize)*MEMORY[0x1E4F1DB30];
    }
  }
  if ([(_UIStackedImageContainerLayer *)self _radiosityEnabled])
  {
    CGRect v28 = [(CALayer *)self->_radiosityLayer contents];
    if (v28)
    {
    }
    else if ([(UINamedLayerStack *)self->_layerStack flattenedImage])
    {
      double Current = CFAbsoluteTimeGetCurrent();
      self->_radiosityRequestTime = Current;
      v30 = +[_UIRadiosityImageGenerator sharedInstance];
      uint64_t v31 = [(UINamedLayerStack *)self->_layerStack flattenedImage];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __63___UIStackedImageContainerLayer__updateRadiosityFromLayerStack__block_invoke;
      v32[3] = &unk_1E5310738;
      *(double *)&v32[5] = Current;
      v32[4] = self;
      [v30 imageWithImage:v31 completionHandler:v32];
    }
  }
}

- (void)setControlState:(unint64_t)a3
{
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
}

- (void)_setControlState:(unint64_t)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  v61[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  unint64_t v12 = [(_UIStackedImageContainerLayer *)self _primaryControlStateForState:a3];
  if (self->_controlState == a3) {
    goto LABEL_57;
  }
  uint64_t v13 = v12;
  BOOL v14 = [(_UIStackedImageContainerLayer *)self _isHighlighted];
  unint64_t controlState = self->_controlState;
  unint64_t v16 = a3 & 0x10008;
  if ((a3 & 0x10008) == 0) {
    a3 &= ~1uLL;
  }
  if (v14 || v13 == 1)
  {
    id v53 = v11;
    self->_unint64_t controlState = a3;
    BOOL v17 = [(_UIStackedImageContainerLayer *)self _isHighlighted];
    [(_UIStackedImageContainerLayer *)self bounds];
    if (CGRectIsEmpty(v62))
    {
      self->_double scale = 1.0;
    }
    else
    {
      [(_UIStackedImageContainerLayer *)self _roundedBoundsSize];
      double v22 = v21;
      double v24 = v23;
      [(_UIStackedImageConfiguration *)self->_configuration scaleSizeIncrease];
      objc_msgSend((id)objc_opt_class(), "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", self->_selectionStyle, v22, v24, v25);
      -[_UIStackedImageContainerLayer _focusCursorInsetSizeForSize:](self, "_focusCursorInsetSizeForSize:");
      double v27 = v26 / v22;
      double v29 = v28 / v24;
      if (v27 < v29) {
        double v27 = v29;
      }
      self->_double scale = v27;
      if (v17)
      {
        [(_UIStackedImageConfiguration *)self->_configuration pressedScaleAdjustment];
        v30 = objc_opt_class();
        [(_UIStackedImageContainerLayer *)self _roundedBoundsSize];
        objc_msgSend(v30, "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", self->_selectionStyle);
        -[_UIStackedImageContainerLayer _focusCursorInsetSizeForSize:](self, "_focusCursorInsetSizeForSize:");
        double v32 = v31 / v22;
        double v34 = v33 / v24;
        if (v32 < v34) {
          double v32 = v34;
        }
        self->_double scale = v32;
        if (self->_selectionStyle == 1
          && ![(_UIStackedImageConfiguration *)self->_configuration fullBleedCenteredGrowth])
        {
          [(_UIStackedImageConfiguration *)self->_configuration fullBleedOffset];
          self->_double scale = v35 * -0.25 / v24 + 1.0;
        }
      }
      else if (!v13)
      {
        self->_double scale = 1.0;
      }
    }
    self->_focusDirection = (CGPoint)*MEMORY[0x1E4F1DAD8];
    [MEMORY[0x1E4F39CF8] begin];
    int v44 = (void *)MEMORY[0x1E4F39CF8];
    configuration = self->_configuration;
    if (v17) {
      [(_UIStackedImageConfiguration *)configuration pressedDuration];
    }
    else {
      [(_UIStackedImageConfiguration *)configuration unpressedDuration];
    }
    objc_msgSend(v44, "setAnimationDuration:");
    id v46 = (void *)MEMORY[0x1E4F39CF8];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke;
    v59[3] = &unk_1E52DA040;
    id v60 = v11;
    [v46 setCompletionBlock:v59];
    if ((v16 != 0) == ((controlState & 0x10008) != 0)) {
      [(_UIStackedImageContainerLayer *)self _applyFocusDirectionTransform];
    }
    else {
      [(_UIStackedImageContainerLayer *)self _updateLayerForSelection];
    }
    [MEMORY[0x1E4F39CF8] commit];

    goto LABEL_56;
  }
  if (v13 > 7)
  {
    if (v13 != 0x10000 && v13 != 8) {
      goto LABEL_57;
    }
LABEL_14:
    id v53 = v11;
    if (!v10)
    {
      BOOL v47 = [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle];
      if (!v13 && v47 && v7)
      {
        double v48 = CACurrentMediaTime() - self->_selectionStartTime;
        [(_UIStackedImageConfiguration *)self->_configuration minimumFocusDuration];
        if (v48 < v49)
        {
          [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__deselect object:0];
          [(_UIStackedImageConfiguration *)self->_configuration minimumFocusDuration];
          double v51 = v50;
          v61[0] = *MEMORY[0x1E4F1C4B0];
          v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
          [(_UIStackedImageContainerLayer *)self performSelector:sel__deselect withObject:0 afterDelay:v52 inModes:v51 - v48];

LABEL_56:
          id v11 = v53;
          goto LABEL_57;
        }
      }
      else if (v13 == 0x10000 || v13 == 8)
      {
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__deselect object:0];
      }
    }
    self->_unint64_t controlState = a3;
    if ([(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle])
    {
      [(_UIStackedImageContainerLayer *)self _showImageLayers];
      [(_UIStackedImageContainerLayer *)self _focusedScaleFactorForCurrentBounds];
      uint64_t v18 = &OBJC_IVAR____UIStackedImageContainerLayer__selectionStartTime;
      self->_double scale = v19;
      double v20 = CACurrentMediaTime();
    }
    else
    {
      BOOL v36 = [(_UIStackedImageContainerLayer *)self _isSelected];
      double v20 = 1.13;
      if (!v36) {
        double v20 = 1.0;
      }
      uint64_t v18 = &OBJC_IVAR____UIStackedImageContainerLayer__scale;
    }
    *(double *)((char *)&self->super.super.isa + *v18) = v20;
    self->_animatingStateChange = 1;
    if (!v13) {
      self->_animatingToNormalState = 1;
    }
    uint64_t v37 = [MEMORY[0x1E4F39CF8] disableActions];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(_UIStackedImageContainerLayer *)self _updateImageLayerFilterChains];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke_2;
    aBlock[3] = &unk_1E52D9F70;
    aBlock[4] = self;
    double v38 = _Block_copy(aBlock);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke_3;
    v57[3] = &unk_1E52D9F70;
    v57[4] = self;
    v39 = _Block_copy(v57);
    if ([(_UIStackedImageContainerLayer *)self _isNormal]) {
      v40 = v38;
    }
    else {
      v40 = v39;
    }
    v41 = (void (**)(void))_Block_copy(v40);
    [MEMORY[0x1E4F39CF8] setDisableActions:!v7];
    if (v10 != 0 && v7)
    {
      objc_initWeak(&location, v10);
      layerStackInflationSeed = (void *)self->_layerStackInflationSeed;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke_4;
      v54[3] = &unk_1E5310760;
      v54[4] = self;
      v55[1] = layerStackInflationSeed;
      objc_copyWeak(v55, &location);
      CGBitmapInfo v43 = (void (**)(void))_Block_copy(v54);
      if (+[UIView areAnimationsEnabled])
      {
        [v10 addCoordinatedAnimations:v43 completion:v41];
      }
      else
      {
        v43[2](v43);
        v41[2](v41);
      }

      objc_destroyWeak(v55);
      objc_destroyWeak(&location);
    }
    else
    {
      if (self->_layerStackSupportsInflation) {
        [(_UIStackedImageContainerLayer *)self _setLayerStackInflated:1 seed:self->_layerStackInflationSeed];
      }
      [MEMORY[0x1E4F39CF8] setCompletionBlock:v41];
      [(_UIStackedImageContainerLayer *)self _updateLayerForSelection];
    }
    [MEMORY[0x1E4F39CF8] setDisableActions:v37];

    goto LABEL_56;
  }
  if (!v13) {
    goto LABEL_14;
  }
  if (v13 == 4)
  {
    self->_unint64_t controlState = a3;
    [(_UIStackedImageContainerLayer *)self _showImageLayers];
    [(_UIStackedImageContainerLayer *)self _updateLayerForSelection];
  }
LABEL_57:
}

- (BOOL)isPressed
{
  return [(_UIStackedImageContainerLayer *)self controlState] & 1;
}

- (void)setPressed:(BOOL)a3
{
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (BOOL)isSelected
{
  return ([(_UIStackedImageContainerLayer *)self controlState] >> 3) & 1;
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
  unint64_t controlState = self->_controlState;
  if (a3)
  {
    uint64_t v6 = 8;
  }
  else
  {
    uint64_t v6 = 0;
    controlState &= ~0x10000uLL;
    self->_unint64_t controlState = controlState;
  }
  [(_UIStackedImageContainerLayer *)self setControlState:controlState & 0xFFFFFFFFFFFFFFF7 | v6 animated:a4 focusAnimationCoordinator:a5];
}

- (void)setFocusDirection:(CGPoint)a3
{
}

- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4
{
}

+ (CGSize)_scaledSizeForSize:(CGSize)result focusSizeIncrease:(double)a4 selectionStyle:(int64_t)a5
{
  if (a4 != 0.0)
  {
    if (a5 == 1)
    {
      result.CGFloat height = result.height + a4;
    }
    else
    {
      double v5 = fabs(result.width);
      BOOL v6 = fabs(result.height) < 2.22044605e-16 || v5 < 2.22044605e-16;
      double v7 = result.width / result.height;
      if (v6) {
        double v7 = 1.0;
      }
      if (result.width <= result.height)
      {
        result.CGFloat height = result.height + a4;
        result.double width = ceil(result.height * v7);
      }
      else
      {
        result.double width = result.width + a4;
        result.CGFloat height = ceil(result.width / v7);
      }
    }
  }
  return result;
}

- (CGSize)_focusCursorInsetSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_UIStackedImageConfiguration *)self->_configuration focusCursorBorderWidth];
  double v7 = v6;
  if ([(_UIStackedImageConfiguration *)self->_configuration focusCursorEnabled])
  {
    double v8 = fabs(width);
    if (fabs(height) < 2.22044605e-16 || v8 < 2.22044605e-16)
    {
      double width = *MEMORY[0x1E4F1DB30];
      double height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    else
    {
      double v10 = fmin(v7 * 4.0, fmin(width, height));
      if (width <= height)
      {
        double v12 = height * v10 / width;
        double width = width - v10;
        double height = height - v12;
      }
      else
      {
        double v11 = width * v10 / height;
        double height = height - v10;
        double width = width - v11;
      }
    }
  }
  double v13 = width;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)_scaledSizeForCurrentState
{
  [(_UIStackedImageConfiguration *)self->_configuration scaleSizeIncrease];
  double v4 = v3;
  BOOL v5 = [(_UIStackedImageContainerLayer *)self _isFocusedIdle];
  double v6 = 0.0;
  if (v5) {
    [(_UIStackedImageContainerLayer *)self _idleModeFocusSizeOffset];
  }
  double v7 = v4 + v6;
  [(_UIStackedImageContainerLayer *)self _roundedBoundsSize];
  objc_msgSend((id)objc_opt_class(), "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", self->_selectionStyle, v8, v9, v7);
  -[_UIStackedImageContainerLayer _focusCursorInsetSizeForSize:](self, "_focusCursorInsetSizeForSize:");
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)_roundedBoundsSize
{
  [(_UIStackedImageContainerLayer *)self bounds];
  double v3 = round(v2);
  double v5 = round(v4);
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (id)_imageLayersContainer
{
  return self->_imageLayersContainer;
}

- (id)_layerBelowTitles
{
  radiosityLayer = self->_radiosityLayer;
  if (!radiosityLayer) {
    radiosityLayer = self->_shadowLayer;
  }
  return radiosityLayer;
}

- (id)_flatLayer
{
  return self->_flatLayer;
}

- (id)_shadowLayer
{
  return self->_shadowLayer;
}

- (int64_t)_selectionStyle
{
  return self->_selectionStyle;
}

- (void)_setSelectionStyle:(int64_t)a3
{
  self->_selectionStyle = a3;
  if (a3 == 1)
  {
    -[_UIStackedImageConfiguration setTranslationOffset:](self->_configuration, "setTranslationOffset:", 10.0, 0.0);
    [(_UIStackedImageConfiguration *)self->_configuration setRotationAmount:0.0];
    [(_UIStackedImageConfiguration *)self->_configuration setSpecularOpacity:0.0];
    [(_UIStackedImageConfiguration *)self->_configuration setBoostBrightness:0];
    [(_UIStackedImageConfiguration *)self->_configuration setRadiosityStrength:0.0];
    [(_UIStackedImageConfiguration *)self->_configuration setScaleSizeIncrease:0.0];
    [(_UIStackedImageContainerLayer *)self setNeedsLayout];
  }
}

- (id)_imageStackContentsGravity
{
  return self->_imageStackContentsGravity;
}

- (void)_setImageStackContentsGravity:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_imageStackContentsGravitCGFloat y = &self->_imageStackContentsGravity;
  if (([(NSString *)self->_imageStackContentsGravity isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_imageStackContentsGravity, a3);
    [(CALayer *)self->_flatLayer setContentsGravity:*p_imageStackContentsGravity];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v7 = self->_imageLayers;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setContentsGravity:", *p_imageStackContentsGravity, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (id)_overlayLayer
{
  return self->_overlayLayer;
}

- (void)_setOverlayLayer:(id)a3
{
  p_overlayLayer = &self->_overlayLayer;
  double v19 = (CALayer *)a3;
  if (*p_overlayLayer != v19)
  {
    -[_UIStackedImageContainerLayer _removeLayerFromSuperlayer:](self, "_removeLayerFromSuperlayer:");
    [(_UIStackedImageContainerLayer *)self _removeLayerFromSuperlayer:self->_overlayContainerLayer];
    overlayContainerLayer = self->_overlayContainerLayer;
    self->_overlayContainerLayer = 0;

    objc_storeStrong((id *)&self->_overlayLayer, a3);
    if (*p_overlayLayer)
    {
      double v7 = [(CALayer *)*p_overlayLayer delegate];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v7 removeFromSuperview];
      }
      uint64_t v8 = *p_overlayLayer;
      [(_UIStackedImageContainerLayer *)self bounds];
      -[CALayer setFrame:](v8, "setFrame:");
      uint64_t v9 = [MEMORY[0x1E4F39CF8] disableActions];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      uint64_t v10 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      uint64_t v11 = self->_overlayContainerLayer;
      self->_overlayContainerLayer = v10;

      long long v12 = self->_overlayContainerLayer;
      [(_UIStackedImageContainerLayer *)self bounds];
      -[CALayer setFrame:](v12, "setFrame:");
      [(CALayer *)self->_overlayContainerLayer addSublayer:*p_overlayLayer];
      [(CALayer *)self->_overlayContainerLayer setZPosition:0.01];
      [(CALayer *)self->_overlayContainerLayer setDelegate:self];
      if (self->_animatingToNormalState
        || [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle]
        || [(_UIStackedImageContainerLayer *)self _isSelected])
      {
        [(CATransformLayer *)self->_imageRotationTransformLayer insertSublayer:self->_overlayContainerLayer below:self->_specularLayer];
      }
      else
      {
        [(CALayer *)self->_flatLayer addSublayer:self->_overlayContainerLayer];
      }
      long long v13 = CALayerGetDelegate();
      int IsKindOfUIView = _IsKindOfUIView((uint64_t)v13);

      if (IsKindOfUIView)
      {
        long long v15 = CALayerGetDelegate();
        int v16 = _IsKindOfUIView((uint64_t)v15);

        if (v16)
        {
          [(_UIStackedImageContainerLayer *)self _wrapLayerInView:self->_flatLayer];
          [(_UIStackedImageContainerLayer *)self _wrapLayerInView:self->_imageLayersContainer];
          [(_UIStackedImageContainerLayer *)self _wrapLayerInView:self->_imagePerspectiveTransformLayer];
          [(_UIStackedImageContainerLayer *)self _wrapLayerInView:self->_imageRotationTransformLayer];
          [(_UIStackedImageContainerLayer *)self _wrapLayerInView:self->_overlayContainerLayer];
          uint64_t v17 = CALayerGetDelegate();
          if (_IsKindOfUIView((uint64_t)v17)) {
            id v18 = v17;
          }
          else {
            id v18 = 0;
          }

          [v18 setAutoresizingMask:18];
          [v18 setTranslatesAutoresizingMaskIntoConstraints:1];
        }
      }
      if ([(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle]
        || [(_UIStackedImageContainerLayer *)self _isSelected])
      {
        [(_UIStackedImageContainerLayer *)self _applyFocusDirectionTransformWithAnimationCoordinator:0];
      }
      [MEMORY[0x1E4F39CF8] setDisableActions:v9];
    }
  }
}

- (id)_unmaskedOverlayLayer
{
  return self->_unmaskedOverlayLayer;
}

- (void)_setUnmaskedOverlayLayer:(id)a3
{
  p_unmaskedOverlayLayer = &self->_unmaskedOverlayLayer;
  double v26 = (CALayer *)a3;
  if (*p_unmaskedOverlayLayer != v26)
  {
    -[_UIStackedImageContainerLayer _removeLayerFromSuperlayer:](self, "_removeLayerFromSuperlayer:");
    [(_UIStackedImageContainerLayer *)self _removeLayerFromSuperlayer:self->_unmaskedOverlayContainerLayer];
    unmaskedOverlayContainerLayer = self->_unmaskedOverlayContainerLayer;
    self->_unmaskedOverlayContainerLayer = 0;

    [(_UIStackedImageContainerLayer *)self _removeLayerFromSuperlayer:self->_unmaskedOverlayRotationTransformLayer];
    unmaskedOverlayRotationTransformLayer = self->_unmaskedOverlayRotationTransformLayer;
    self->_unmaskedOverlayRotationTransformLayer = 0;

    [(_UIStackedImageContainerLayer *)self _removeLayerFromSuperlayer:self->_unmaskedOverlayPerspectiveTransformLayer];
    unmaskedOverlayPerspectiveTransformLayer = self->_unmaskedOverlayPerspectiveTransformLayer;
    self->_unmaskedOverlayPerspectiveTransformLayer = 0;

    objc_storeStrong((id *)&self->_unmaskedOverlayLayer, a3);
    if (*p_unmaskedOverlayLayer)
    {
      uint64_t v9 = [(CALayer *)*p_unmaskedOverlayLayer delegate];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v11 = [(CALayer *)*p_unmaskedOverlayLayer delegate];
        [v11 removeFromSuperview];
      }
      long long v12 = *p_unmaskedOverlayLayer;
      [(_UIStackedImageContainerLayer *)self bounds];
      -[CALayer setFrame:](v12, "setFrame:");
      uint64_t v13 = [MEMORY[0x1E4F39CF8] disableActions];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      long long v14 = (CATransformLayer *)objc_alloc_init(MEMORY[0x1E4F39D10]);
      long long v15 = self->_unmaskedOverlayPerspectiveTransformLayer;
      self->_unmaskedOverlayPerspectiveTransformLayer = v14;

      [(CATransformLayer *)self->_unmaskedOverlayPerspectiveTransformLayer setDelegate:self];
      -[CATransformLayer setAnchorPoint:](self->_unmaskedOverlayPerspectiveTransformLayer, "setAnchorPoint:", 0.5, 0.5);
      int v16 = self->_unmaskedOverlayPerspectiveTransformLayer;
      [(_UIStackedImageContainerLayer *)self bounds];
      -[CATransformLayer setFrame:](v16, "setFrame:");
      [(_UIStackedImageContainerLayer *)self insertSublayer:self->_unmaskedOverlayPerspectiveTransformLayer above:self->_imageLayersContainer];
      uint64_t v17 = (CATransformLayer *)objc_alloc_init(MEMORY[0x1E4F39D10]);
      id v18 = self->_unmaskedOverlayRotationTransformLayer;
      self->_unmaskedOverlayRotationTransformLayer = v17;

      [(CATransformLayer *)self->_unmaskedOverlayRotationTransformLayer setDelegate:self];
      -[CATransformLayer setAnchorPoint:](self->_unmaskedOverlayRotationTransformLayer, "setAnchorPoint:", 0.5, 0.5);
      double v19 = self->_unmaskedOverlayRotationTransformLayer;
      [(_UIStackedImageContainerLayer *)self bounds];
      -[CATransformLayer setFrame:](v19, "setFrame:");
      [(CATransformLayer *)self->_unmaskedOverlayPerspectiveTransformLayer addSublayer:self->_unmaskedOverlayRotationTransformLayer];
      double v20 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      double v21 = self->_unmaskedOverlayContainerLayer;
      self->_unmaskedOverlayContainerLayer = v20;

      double v22 = self->_unmaskedOverlayContainerLayer;
      [(_UIStackedImageContainerLayer *)self bounds];
      -[CALayer setFrame:](v22, "setFrame:");
      [(CALayer *)self->_unmaskedOverlayContainerLayer setZPosition:0.011];
      [(CALayer *)self->_unmaskedOverlayContainerLayer setDelegate:self];
      [(CATransformLayer *)self->_unmaskedOverlayRotationTransformLayer addSublayer:self->_unmaskedOverlayContainerLayer];
      [(CALayer *)self->_unmaskedOverlayContainerLayer addSublayer:*p_unmaskedOverlayLayer];
      double v23 = CALayerGetDelegate();
      LODWORD(v22) = _IsKindOfUIView((uint64_t)v23);

      if (v22)
      {
        double v24 = CALayerGetDelegate();
        int IsKindOfUIView = _IsKindOfUIView((uint64_t)v24);

        if (IsKindOfUIView)
        {
          [(_UIStackedImageContainerLayer *)self _wrapLayerInView:self->_unmaskedOverlayPerspectiveTransformLayer];
          [(_UIStackedImageContainerLayer *)self _wrapLayerInView:self->_unmaskedOverlayRotationTransformLayer];
          [(_UIStackedImageContainerLayer *)self _wrapLayerInView:self->_unmaskedOverlayContainerLayer];
        }
      }
      if ([(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle]
        || [(_UIStackedImageContainerLayer *)self _isSelected])
      {
        [(_UIStackedImageContainerLayer *)self _applyFocusDirectionTransformWithAnimationCoordinator:0];
      }
      [MEMORY[0x1E4F39CF8] setDisableActions:v13];
    }
  }
}

- (void)_removeLayerFromSuperlayer:(id)a3
{
  id v4 = a3;
  double v3 = CALayerGetDelegate();
  if (_IsKindOfUIView((uint64_t)v3))
  {
    if (v3)
    {
      [v3 removeFromSuperview];

      goto LABEL_6;
    }
  }
  else
  {
  }
  [v4 removeFromSuperlayer];
LABEL_6:
}

- (void)_wrapLayerInView:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [v5 delegate];
  if ((_IsKindOfUIView((uint64_t)v6) & 1) == 0)
  {
    double v7 = [v5 superlayer];
    uint64_t v8 = CALayerGetDelegate();
    if ((_IsKindOfUIView((uint64_t)v8) & 1) == 0)
    {
      double v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:self file:@"_UIStackedImageContainerLayer.m" lineNumber:1960 description:@"called _wrapLayerInView: on a layer whose superlayer is not in a view"];
    }
    double v25 = v7;
    uint64_t v9 = [v7 sublayers];
    uint64_t v10 = [v9 indexOfObject:v5];

    id v11 = [(UIView *)[_UIStackedImageLayerWrappingView alloc] _initWithLayer:v5];
    [v11 setActionDelegate:v6];
    double v24 = v8;
    [v8 insertSubview:v11 atIndex:v10];
    long long v12 = [v5 sublayers];
    uint64_t v13 = (void *)[v12 copy];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          double v20 = [v19 delegate];
          int IsKindOfUIView = _IsKindOfUIView((uint64_t)v20);

          if (IsKindOfUIView)
          {
            [v19 removeFromSuperlayer];
            double v22 = CALayerGetDelegate();
            objc_msgSend(v11, "insertSubview:atIndex:", v22, objc_msgSend(v14, "indexOfObject:", v19));
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }
  }
}

- (id)_parallaxLayerDepths
{
  return self->_parallaxLayerDepths;
}

- (void)_setParallaxLayerDepths:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_parallaxLayerDepths, "isEqualToArray:"))
  {
    id v4 = (NSArray *)[v6 copy];
    parallaxLayerDepths = self->_parallaxLayerDepths;
    self->_parallaxLayerDepths = v4;

    [(_UIStackedImageContainerLayer *)self _applyFocusDirectionTransform];
  }
}

- (void)_setDefaultParallaxLayerDepths
{
  double maximumParallaxDepth = self->_maximumParallaxDepth;
  NSUInteger v4 = [(NSArray *)self->_parallaxImages count];
  if (v4 < 2)
  {
    id v12 = &unk_1ED3F19C0;
  }
  else
  {
    NSUInteger v5 = v4;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
    unint64_t v7 = 0;
    double v8 = maximumParallaxDepth / (double)(v5 - 1);
    do
    {
      uint64_t v9 = [NSNumber numberWithDouble:v8 * (double)v7];
      [v6 addObject:v9];

      ++v7;
    }
    while (v5 != v7);
    id v12 = (id)[v6 copy];
  }
  uint64_t v10 = (NSArray *)[v12 copy];
  parallaxLayerDepths = self->_parallaxLayerDepths;
  self->_parallaxLayerDepths = v10;
}

- (CGImage)_cgImageForLayeredImage:(id)a3
{
  id v3 = [a3 imageObj];
  NSUInteger v4 = (CGImage *)[v3 CGImage];

  return v4;
}

- (void)_setLayerStackInflated:(BOOL)a3 seed:(unint64_t)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (self->_layerStackSupportsInflation)
  {
    if (a3) {
      self->_deferredInflationPending = 0;
    }
    if (self->_layerStackInflationSeed == a4 && self->_layerStackInflated != a3)
    {
      self->_layerStackInflated = a3;
      layerStack = self->_layerStack;
      if (a3) {
        [(UINamedLayerStack *)layerStack _inflateLayerStack];
      }
      else {
        [(UINamedLayerStack *)layerStack _deflateLayerStack];
      }
      unint64_t v7 = [(UINamedLayerStack *)self->_layerStack layers];
      double v8 = (NSArray *)[v7 copy];
      parallaxImages = self->_parallaxImages;
      self->_parallaxImages = v8;

      NSUInteger v10 = [(NSArray *)self->_parallaxImages count];
      if (v10 != [(NSArray *)self->_imageLayers count])
      {
        BOOL v36 = [MEMORY[0x1E4F28B00] currentHandler];
        [v36 handleFailureInMethod:a2 object:self file:@"_UIStackedImageContainerLayer.m" lineNumber:2066 description:@"The number of stack layers changed after inflation / deflation. Please keep the layer count the same and use NULL images for deflated layers"];
      }
      unsigned int v37 = [MEMORY[0x1E4F39CF8] disableActions];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      obuint64_t j = self->_parallaxImages;
      uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = 0;
        uint64_t v14 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v41 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0
              && ([v16 contentProvider], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              id v18 = (void *)v17;
              double v19 = [(NSArray *)self->_imageLayers objectAtIndexedSubscript:v13 + i];
              double v20 = [v19 sublayers];
              [v20 makeObjectsPerformSelector:sel_removeFromSuperlayer];

              double v21 = [v18 contentLayer];
              if (v21)
              {
                [v19 bounds];
                CGFloat v23 = v22;
                CGFloat v25 = v24;
                CGFloat v27 = v26;
                CGFloat v29 = v28;
                objc_msgSend(v21, "setBounds:");
                v46.origin.CGFloat x = v23;
                v46.origin.CGFloat y = v25;
                v46.size.double width = v27;
                v46.size.double height = v29;
                double MidX = CGRectGetMidX(v46);
                v47.origin.CGFloat x = v23;
                v47.origin.CGFloat y = v25;
                v47.size.double width = v27;
                v47.size.double height = v29;
                objc_msgSend(v21, "setPosition:", MidX, CGRectGetMidY(v47));
                [v19 addSublayer:v21];
              }
            }
            else
            {
              uint64_t v31 = [(_UIStackedImageContainerLayer *)self _cgImageForLayeredImage:v16];
              id v18 = [(NSArray *)self->_imageLayers objectAtIndexedSubscript:v13 + i];
              [v18 setContents:v31];
            }
          }
          uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
          v13 += i;
        }
        while (v12);
      }

      if (!a3)
      {
        double v32 = [(NSArray *)self->_imageLayers firstObject];
        double v33 = [v32 contents];

        if (!v33)
        {
          double v34 = [(CALayer *)self->_flatLayer contents];
          double v35 = [(NSArray *)self->_imageLayers firstObject];
          [v35 setContents:v34];
        }
      }
      [MEMORY[0x1E4F39CF8] setDisableActions:v37];
    }
  }
}

- (id)_contentLayers
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  NSUInteger v4 = v3;
  if (self->_flatLayer) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_radiosityLayer) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_selectedPlaceholderLayer) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_specularLayer) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_imageLayers) {
    objc_msgSend(v4, "addObjectsFromArray:");
  }
  NSUInteger v5 = (void *)[v4 copy];

  return v5;
}

- (void)_updateSpecularLayerContents
{
  [(_UIStackedImageContainerLayer *)self contentsScale];
  if (v3 >= 2.0)
  {
    if (qword_1EB25E880 == -1)
    {
      NSUInteger v4 = &qword_1EB25E878;
      goto LABEL_6;
    }
    NSUInteger v4 = &qword_1EB25E878;
    unint64_t v7 = &qword_1EB25E880;
    double v8 = &__block_literal_global_236_1;
  }
  else
  {
    if (qword_1EB25E870 == -1)
    {
      NSUInteger v4 = &qword_1EB25E868;
      goto LABEL_6;
    }
    NSUInteger v4 = &qword_1EB25E868;
    unint64_t v7 = &qword_1EB25E870;
    double v8 = &__block_literal_global_226;
  }
  dispatch_once(v7, v8);
LABEL_6:
  specularLayer = self->_specularLayer;
  uint64_t v6 = *v4;
  [(CALayer *)specularLayer setContents:v6];
}

- (double)_focusedScaleFactorForCurrentBounds
{
  [(_UIStackedImageContainerLayer *)self bounds];
  IsEmptCGFloat y = CGRectIsEmpty(v12);
  double result = 1.0;
  if (!IsEmpty)
  {
    [(_UIStackedImageContainerLayer *)self _roundedBoundsSize];
    double v6 = v5;
    double v8 = v7;
    [(_UIStackedImageContainerLayer *)self _scaledSizeForCurrentState];
    double result = v9 / v6;
    double v11 = v10 / v8;
    if (result < v11) {
      return v11;
    }
  }
  return result;
}

- (BOOL)_radiosityEnabled
{
  [(_UIStackedImageConfiguration *)self->_configuration radiosityStrength];
  return fabs(v2) >= 2.22044605e-16;
}

- (CGPoint)_layerStackToDisplayScaleFactor
{
  [(UINamedLayerStack *)self->_layerStack size];
  double v4 = v3;
  double v6 = v5;
  [(_UIStackedImageContainerLayer *)self _roundedBoundsSize];
  BOOL v9 = v4 == 0.0 || v7 == 0.0;
  double v10 = v4 / v7;
  if (v9) {
    double v10 = 1.0;
  }
  BOOL v11 = v6 == 0.0 || v8 == 0.0;
  double v12 = v6 / v8;
  if (v11) {
    double v12 = 1.0;
  }
  result.CGFloat y = v12;
  result.CGFloat x = v10;
  return result;
}

- (CGRect)_displayFrameForModelFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_UIStackedImageContainerLayer *)self _layerStackToDisplayScaleFactor];
  double v8 = width / v7;
  double v9 = floor(x / v7);
  double v10 = floor(v8);
  double v12 = floor(height / v11);
  double v13 = floor(y / v11);
  result.size.double height = v12;
  result.size.double width = v10;
  result.origin.double y = v13;
  result.origin.double x = v9;
  return result;
}

- (CGRect)_positionAndSizeForLayerImage:(id)a3
{
  [a3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = v8 * 0.5;
  double v13 = v10 * 0.5;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v15 = [(_UIStackedImageContainerLayer *)self _imageStackContentsGravity];
  char v16 = [v15 isEqualToString:*MEMORY[0x1E4F3A3E0]];

  if (has_internal_diagnostics)
  {
    if ((v16 & 1) == 0)
    {
      double v35 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v35, OS_LOG_TYPE_FAULT, "_UIStackedImageContainerLayer: only ResizeAspectFill is supported for image stacks", buf, 2u);
      }
    }
  }
  else if ((v16 & 1) == 0)
  {
    BOOL v36 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_positionAndSizeForLayerImage____s_category) + 8);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned int v37 = 0;
      _os_log_impl(&dword_1853B0000, v36, OS_LOG_TYPE_ERROR, "_UIStackedImageContainerLayer: only ResizeAspectFill is supported for image stacks", v37, 2u);
    }
  }
  double v17 = v5 + v12;
  double v18 = v7 + v13;
  double v19 = floor(v9);
  double v20 = floor(v11);
  [(UINamedLayerStack *)self->_layerStack size];
  double v22 = v21;
  double v24 = v23;
  [(_UIStackedImageContainerLayer *)self bounds];
  if (v22 > 0.0 && v24 > 0.0 && v25 > 0.0 && v26 > 0.0)
  {
    double v27 = v22 / v25;
    double v28 = v24 / v26;
    BOOL v29 = v22 / v25 < v24 / v26;
    if (v22 / v25 >= v24 / v26) {
      double v30 = v24 / v26;
    }
    else {
      double v30 = v22 / v25;
    }
    double v17 = v17 / v30;
    double v18 = v18 / v30;
    double v19 = v19 / v30;
    double v20 = v20 / v30;
    if (v29) {
      double v18 = v18 + round((v24 / v28 - v24 / v27) * 0.5);
    }
    else {
      double v17 = v17 + round((v22 / v27 - v22 / v28) * 0.5);
    }
  }
  double v31 = v17;
  double v32 = v18;
  double v33 = v19;
  double v34 = v20;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (void)_applyFocusDirectionTransform
{
}

- (void)_applyFocusDirectionTransformWithAnimationCoordinator:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle];
  BOOL v6 = [(_UIStackedImageContainerLayer *)self _isSelected];
  BOOL v7 = [(_UIStackedImageContainerLayer *)self _isHighlighted];
  memset(&v57, 0, sizeof(v57));
  [(_UIStackedImageContainerLayer *)self _scaleTransformForCurrentState];
  if (self->_nonOpaqueShadow)
  {
    specularLayer = self->_specularLayer;
    CATransform3D v56 = v57;
    double v9 = &v56;
LABEL_3:
    [(CALayer *)specularLayer setTransform:v9];
    goto LABEL_11;
  }
  maskLayer = self->_maskLayer;
  CATransform3D v56 = v57;
  [(CALayer *)maskLayer setTransform:&v56];
  if (self->_selectionStyle == 1
    && [(_UIStackedImageConfiguration *)self->_configuration fullBleedCenteredGrowth])
  {
    if (v7)
    {
      CGFloat v11 = 1.0 - (self->_scale + -1.0);
      CATransform3DMakeScale(&v55, v11, v11, 1.0);
      overlayContainerLayer = self->_overlayContainerLayer;
      CATransform3D v54 = v55;
      [(CALayer *)overlayContainerLayer setTransform:&v54];
      CATransform3DMakeScale(&v53, v11, v11, 1.0);
      specularLayer = self->_unmaskedOverlayContainerLayer;
      CATransform3D v52 = v53;
      double v9 = &v52;
      goto LABEL_3;
    }
    if ([(_UIStackedImageContainerLayer *)self _isFocusedIdle])
    {
      [(_UIStackedImageContainerLayer *)self _idleModeFocusSizeOffset];
      double v14 = v13;
      [(_UIStackedImageContainerLayer *)self bounds];
      CGFloat v16 = v14 / v15 + 1.0;
      CATransform3DMakeScale(&v51, 1.0, v16, 1.0);
      double v17 = self->_overlayContainerLayer;
      CATransform3D v50 = v51;
      [(CALayer *)v17 setTransform:&v50];
      CATransform3DMakeScale(&v49, 1.0, v16, 1.0);
      specularLayer = self->_unmaskedOverlayContainerLayer;
      CATransform3D v48 = v49;
      double v9 = &v48;
      goto LABEL_3;
    }
    double v18 = self->_overlayContainerLayer;
    long long v36 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v44 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v35 = v44;
    long long v45 = v36;
    long long v34 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v46 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v33 = v46;
    long long v47 = v34;
    long long v32 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v41[0] = *MEMORY[0x1E4F39B10];
    long long v31 = v41[0];
    v41[1] = v32;
    long long v30 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v42 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v29 = v42;
    long long v43 = v30;
    [(CALayer *)v18 setTransform:v41];
    unmaskedOverlayContainerLayer = self->_unmaskedOverlayContainerLayer;
    v40[4] = v35;
    v40[5] = v36;
    v40[6] = v33;
    v40[7] = v34;
    v40[0] = v31;
    v40[1] = v32;
    v40[2] = v29;
    v40[3] = v30;
    [(CALayer *)unmaskedOverlayContainerLayer setTransform:v40];
    [(_UIStackedImageContainerLayer *)self _updateOverlayLayout];
  }
LABEL_11:
  if (![(CALayer *)self->_selectedPlaceholderLayer isHidden])
  {
    CATransform3D v56 = v57;
    if (self->_selectionStyle == 1
      && [(_UIStackedImageConfiguration *)self->_configuration fullBleedCenteredGrowth]
      && (v5 || v6 || v7))
    {
      CATransform3DMakeScale(&v56, self->_scale, self->_scale, 1.0);
    }
    selectedPlaceholderLayer = self->_selectedPlaceholderLayer;
    CATransform3D v39 = v56;
    [(CALayer *)selectedPlaceholderLayer setTransform:&v39];
  }
  if ([(_UIStackedImageConfiguration *)self->_configuration focusCursorEnabled])
  {
    cursorLayer = self->_cursorLayer;
    [(_UIStackedImageContainerLayer *)self _cursorBounds];
    -[CALayer setBounds:](cursorLayer, "setBounds:");
  }
  [(_UIStackedImageContainerLayer *)self _updatePerspective];
  [(_UIStackedImageContainerLayer *)self _updateRotationAndTranslation:v4];
  [(_UIStackedImageContainerLayer *)self _updateFocusKeylineStrokeScale];
  if (v5 || v7 || v6)
  {
    if (self->_selectionStyle == 1
      && [(_UIStackedImageConfiguration *)self->_configuration fullBleedCenteredGrowth])
    {
      radiosityLayer = self->_radiosityLayer;
      CATransform3DMakeScale(&v38, 1.0, self->_scale, 1.0);
      double v23 = &v38;
    }
    else
    {
      radiosityLayer = self->_radiosityLayer;
      CATransform3DMakeScale(&v37, self->_scale, self->_scale, 1.0);
      double v23 = &v37;
    }
    double v24 = radiosityLayer;
  }
  else
  {
    double v24 = self->_radiosityLayer;
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v56.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v56.m33 = v25;
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v56.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v56.m43 = v26;
    long long v27 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v56.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v56.m13 = v27;
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v56.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v56.m23 = v28;
    double v23 = &v56;
  }
  [(CALayer *)v24 setTransform:v23];
  [(_UIStackedImageContainerLayer *)self _updateFullBleedImageLayers];
  [(_UIStackedImageContainerLayer *)self _updateNormalImageLayers];
  [(_UIStackedImageContainerLayer *)self _updateContentProviderLayerFocusDirection];
  [(_UIStackedImageContainerLayer *)self _updateShadowWithAnimationCoordinator:v4];
  [(_UIStackedImageContainerLayer *)self _updateImageLayerFilterValues];
}

- (void)_updateOverlayContainerLayerHierarchy:(BOOL)a3
{
  if (!self->_overlayContainerLayer) {
    return;
  }
  BOOL v4 = a3;
  BOOL v5 = CALayerGetDelegate();
  int IsKindOfUIView = _IsKindOfUIView((uint64_t)v5);

  if (v4)
  {
    if (IsKindOfUIView)
    {
      BOOL v7 = CALayerGetDelegate();
      int v8 = _IsKindOfUIView((uint64_t)v7);

      if (v8)
      {
        double v9 = [(CATransformLayer *)self->_imageRotationTransformLayer sublayers];
        uint64_t v10 = [v9 indexOfObject:self->_specularLayer];

        CALayerGetDelegate();
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        CGFloat v11 = CALayerGetDelegate();
        [v19 insertSubview:v11 atIndex:v10];
LABEL_10:

        return;
      }
    }
    imageRotationTransformLayer = self->_imageRotationTransformLayer;
    overlayContainerLayer = self->_overlayContainerLayer;
    specularLayer = self->_specularLayer;
    [(CATransformLayer *)imageRotationTransformLayer insertSublayer:overlayContainerLayer below:specularLayer];
  }
  else
  {
    if (IsKindOfUIView)
    {
      double v12 = CALayerGetDelegate();
      int v13 = _IsKindOfUIView((uint64_t)v12);

      if (v13)
      {
        CALayerGetDelegate();
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        CGFloat v11 = CALayerGetDelegate();
        [v19 addSubview:v11];
        goto LABEL_10;
      }
    }
    flatLayer = self->_flatLayer;
    double v18 = self->_overlayContainerLayer;
    [(CALayer *)flatLayer addSublayer:v18];
  }
}

- (void)_showImageLayers
{
  uint64_t v3 = [MEMORY[0x1E4F39CF8] disableActions];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(CALayer *)self->_flatLayer setHidden:1];
  [(CALayer *)self->_imageLayersContainer setHidden:0];
  if (![(NSArray *)self->_parallaxImages count]) {
    [(CATransformLayer *)self->_imageRotationTransformLayer insertSublayer:self->_selectedPlaceholderLayer below:self->_specularLayer];
  }
  [(_UIStackedImageContainerLayer *)self _updateOverlayContainerLayerHierarchy:1];
  BOOL v4 = (void *)MEMORY[0x1E4F39CF8];
  [v4 setDisableActions:v3];
}

- (void)_deselect
{
}

- (double)_idleModeFocusSizeOffset
{
  return self->_idleModeFocusSizeOffset;
}

- (BOOL)_isFocused
{
  return [(_UIStackedImageContainerLayer *)self _primaryControlStateForState:self->_controlState] == 8;
}

- (BOOL)_isFocusedIdle
{
  return [(_UIStackedImageContainerLayer *)self _primaryControlStateForState:self->_controlState] == 0x10000;
}

- (BOOL)_isFocusedOrFocusedIdle
{
  if ([(_UIStackedImageContainerLayer *)self _isFocusedIdle]) {
    return 1;
  }
  return [(_UIStackedImageContainerLayer *)self _isFocused];
}

- (BOOL)_isHighlighted
{
  return [(_UIStackedImageContainerLayer *)self _primaryControlStateForState:self->_controlState] == 1;
}

- (BOOL)_isNormal
{
  return [(_UIStackedImageContainerLayer *)self _primaryControlStateForState:self->_controlState] == 0;
}

- (BOOL)_isSelected
{
  return [(_UIStackedImageContainerLayer *)self _primaryControlStateForState:self->_controlState] == 4;
}

- (unint64_t)_primaryControlStateForState:(unint64_t)a3
{
  unint64_t v3 = 0x10000;
  unint64_t v4 = a3 & 4;
  if ((a3 & 8) != 0) {
    unint64_t v4 = 8;
  }
  if ((a3 & 0x10000) == 0) {
    unint64_t v3 = v4;
  }
  if (a3) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void)_resetAnimatingToNormalState
{
  self->_animatingToNormalState = 0;
  if ([(_UIStackedImageContainerLayer *)self _isNormal])
  {
    uint64_t v3 = [MEMORY[0x1E4F39CF8] disableActions];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(CALayer *)self->_flatLayer setHidden:0];
    [(CALayer *)self->_imageLayersContainer setHidden:1];
    [(CALayer *)self->_selectedPlaceholderLayer removeFromSuperlayer];
    [(_UIStackedImageContainerLayer *)self _updateOverlayContainerLayerHierarchy:0];
    [(CALayer *)self->_shadowLayer removeAllAnimations];
    [(CALayer *)self->_shadowLayer clearHasBeenCommitted];
    [(CALayer *)self->_unfocusedShadowLayer removeAllAnimations];
    [(CALayer *)self->_unfocusedShadowLayer clearHasBeenCommitted];
    [(CALayer *)self->_radiosityLayer removeAllAnimations];
    [(CALayer *)self->_radiosityLayer clearHasBeenCommitted];
    [(CALayer *)self->_overlayContainerLayer removeAllAnimations];
    [(CALayer *)self->_overlayContainerLayer clearHasBeenCommitted];
    [(CALayer *)self->_unmaskedOverlayContainerLayer removeAllAnimations];
    [(CALayer *)self->_unmaskedOverlayContainerLayer clearHasBeenCommitted];
    [(_UIStackedImageContainerLayer *)self _applyFocusDirectionTransform];
    [(_UIStackedImageContainerLayer *)self _setLayerStackInflated:0 seed:self->_layerStackInflationSeed++];
    unint64_t v4 = (void *)MEMORY[0x1E4F39CF8];
    [v4 setDisableActions:v3];
  }
}

- (void)_setFlatImage:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  p_flatImage = &self->_flatImage;
  if (self->_flatImage != v5
    || !v5
    && ([(CALayer *)self->_flatLayer contents],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [(_UIStackedImageConfiguration *)self->_configuration placeholderImage],
        id v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 CGImage],
        v11,
        v10,
        v10 != (void *)v12))
  {
    objc_storeStrong(&self->_flatImage, a3);
    int v8 = [(CALayer *)self->_flatLayer contents];
    if (*p_flatImage)
    {
      id v9 = *p_flatImage;
    }
    else
    {
      id v13 = [(_UIStackedImageConfiguration *)self->_configuration placeholderImage];
      id v9 = (id)[v13 CGImage];
    }
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    long long v27 = __47___UIStackedImageContainerLayer__setFlatImage___block_invoke;
    long long v28 = &unk_1E52D9F98;
    long long v29 = self;
    id v14 = v9;
    id v30 = v14;
    double v15 = (void (**)(void))_Block_copy(&v25);
    if (v8)
    {
      id v16 = [(_UIStackedImageConfiguration *)self->_configuration placeholderImage];
      if (v8 == (void *)[v16 CGImage])
      {
        id v17 = *p_flatImage;

        if (v14 == v17)
        {
          if (+[UIView areAnimationsEnabled])
          {
            double v18 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
            id v19 = [v18 currentMode];
            char v20 = [v19 isEqualToString:@"UITrackingRunLoopMode"];

            if ((v20 & 1) == 0)
            {
              [MEMORY[0x1E4F39CF8] animationDuration];
              double v23 = v22;
              uint64_t v24 = [MEMORY[0x1E4F39CF8] disableActions];
              [MEMORY[0x1E4F39CF8] setDisableActions:0];
              [MEMORY[0x1E4F39CF8] setAnimationDuration:0.35];
              v15[2](v15);
              [MEMORY[0x1E4F39CF8] setDisableActions:v24];
              [MEMORY[0x1E4F39CF8] setAnimationDuration:v23];
              goto LABEL_15;
            }
          }
        }
      }
      else
      {
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F39CF8], "disableActions", v25, v26, v27, v28, v29);
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v15[2](v15);
    [MEMORY[0x1E4F39CF8] setDisableActions:v21];
LABEL_15:
  }
}

- (void)_setIdleModeFocusSizeOffset:(double)a3
{
  if (self->_idleModeFocusSizeOffset != a3) {
    self->_idleModeFocusSizeOffset = a3;
  }
}

- (id)_randomImage
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (qword_1EB25E890 != -1) {
    dispatch_once(&qword_1EB25E890, &__block_literal_global_243_1);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F29238];
  [(UINamedLayerStack *)self->_layerStack size];
  unint64_t v4 = objc_msgSend(v3, "valueWithCGSize:");
  id v5 = [(id)qword_1EB25E888 objectForKey:v4];
  if (!v5)
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(UINamedLayerStack *)self->_layerStack size];
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = [MEMORY[0x1E4F1E040] filterWithName:@"CIRandomGenerator"];
    id v13 = [v12 outputImage];

    char v20 = @"inputRectangle";
    id v14 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:v9 W:v11];
    v21[0] = v14;
    double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v16 = [v13 imageByApplyingFilter:@"CICrop" withInputParameters:v15];

    id v17 = [[UIImage alloc] initWithCIImage:v16];
    _UIGraphicsBeginImageContextWithOptions(0, 0, v9, v11, 1.0);
    -[UIImage drawInRect:blendMode:alpha:](v17, "drawInRect:blendMode:alpha:", 0, v6, v7, v9, v11, 0.25);
    double v18 = _UIGraphicsGetImageFromCurrentImageContext(0);

    UIGraphicsEndImageContext();
    id v5 = objc_alloc_init(_UIStackedImageSimpleImage);
    [(_UIStackedImageSimpleImage *)v5 setName:@"noise"];
    -[_UIStackedImageSimpleImage setFrame:](v5, "setFrame:", v6, v7, v9, v11);
    [(_UIStackedImageSimpleImage *)v5 setOpacity:1.0];
    [(_UIStackedImageSimpleImage *)v5 setBlendMode:0];
    [(_UIStackedImageSimpleImage *)v5 setImageObj:v18];
    [(id)qword_1EB25E888 setObject:v5 forKey:v4];
  }
  return v5;
}

- (void)_setParallaxImages:(id)a3
{
  id v4 = a3;
  if (![(NSArray *)self->_parallaxImages isEqualToArray:v4])
  {
    unint64_t v5 = [(_UIStackedImageConfiguration *)self->_configuration maximumParallaxImages];
    if ([v4 count] > v5)
    {
      NSLog(&cfstr_ImageStacksWit.isa, v5);
      uint64_t v6 = objc_msgSend(v4, "subarrayWithRange:", 0, v5);

      id v4 = (id)v6;
    }
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v7 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      int v35 = _UIInternalPreference_ForceMaxParallaxLayers;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ForceMaxParallaxLayers)
      {
        while (v7 >= v35)
        {
          _UIInternalPreferenceSync(v7, &_UIInternalPreference_ForceMaxParallaxLayers, @"ForceMaxParallaxLayers", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          int v35 = _UIInternalPreference_ForceMaxParallaxLayers;
          if (v7 == _UIInternalPreference_ForceMaxParallaxLayers) {
            goto LABEL_7;
          }
        }
        if (byte_1E8FD5654) {
          BOOL v36 = v4 == 0;
        }
        else {
          BOOL v36 = 1;
        }
        if (!v36)
        {
          CATransform3D v37 = (void *)[v4 mutableCopy];
          CATransform3D v38 = v37;
          while ([v37 count] < v5)
          {
            CATransform3D v39 = [(_UIStackedImageContainerLayer *)self _randomImage];
            [v38 addObject:v39];

            CATransform3D v37 = v38;
          }

          id v4 = v38;
        }
      }
    }
LABEL_7:
    [(NSArray *)self->_imageLayers makeObjectsPerformSelector:sel_setContents_ withObject:0];
    [(NSArray *)self->_imageLayers makeObjectsPerformSelector:sel_removeFromSuperlayer];
    double v8 = (NSArray *)[v4 copy];
    parallaxImages = self->_parallaxImages;
    self->_parallaxImages = v8;

    double v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_parallaxImages, "count"));
    if ([(NSArray *)self->_parallaxImages count])
    {
      unint64_t v11 = 0;
      do
      {
        uint64_t v12 = [(NSArray *)self->_parallaxImages objectAtIndex:v11];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __52___UIStackedImageContainerLayer__setParallaxImages___block_invoke;
        aBlock[3] = &unk_1E5310788;
        aBlock[4] = self;
        id v13 = v12;
        id v41 = v13;
        unint64_t v42 = v11;
        id v14 = (void (**)(void *, id, unint64_t))_Block_copy(aBlock);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ([v13 contentProvider], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v16 = (void *)v15;
          id v17 = v10;
          id v18 = objc_alloc_init(MEMORY[0x1E4F39D10]);
          v14[2](v14, v18, v11);
          id v19 = [v16 contentLayer];
          if (v19)
          {
            [v18 bounds];
            CGFloat v21 = v20;
            CGFloat v23 = v22;
            CGFloat v25 = v24;
            CGFloat v27 = v26;
            objc_msgSend(v19, "setBounds:");
            v43.origin.double x = v21;
            v43.origin.double y = v23;
            v43.size.double width = v25;
            v43.size.double height = v27;
            double MidX = CGRectGetMidX(v43);
            v44.origin.double x = v21;
            v44.origin.double y = v23;
            v44.size.double width = v25;
            v44.size.double height = v27;
            objc_msgSend(v19, "setPosition:", MidX, CGRectGetMidY(v44));
            [v18 addSublayer:v19];
          }

          double v10 = v17;
        }
        else
        {
          id v18 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
          v14[2](v14, v18, v11);
          objc_msgSend(v18, "setContents:", -[_UIStackedImageContainerLayer _cgImageForLayeredImage:](self, "_cgImageForLayeredImage:", v13));
        }
        [(CATransformLayer *)self->_imageRotationTransformLayer insertSublayer:v18 below:self->_specularLayer];
        [v10 addObject:v18];

        ++v11;
      }
      while (v11 < [(NSArray *)self->_parallaxImages count]);
    }
    long long v29 = (NSArray *)[v10 copy];
    imageLayers = self->_imageLayers;
    self->_imageLayers = v29;

    if (self->_layerStackSupportsInflation)
    {
      long long v31 = [(NSArray *)self->_imageLayers firstObject];
      long long v32 = [v31 contents];

      if (!v32)
      {
        long long v33 = [(CALayer *)self->_flatLayer contents];
        long long v34 = [(NSArray *)self->_imageLayers firstObject];
        [v34 setContents:v33];
      }
    }
    if ([(NSArray *)self->_parallaxImages count]) {
      [(CALayer *)self->_selectedPlaceholderLayer removeFromSuperlayer];
    }
    else {
      [(CATransformLayer *)self->_imageRotationTransformLayer insertSublayer:self->_selectedPlaceholderLayer below:self->_specularLayer];
    }
    [(_UIStackedImageContainerLayer *)self _setDefaultParallaxLayerDepths];
    [(_UIStackedImageContainerLayer *)self _updateImageLayerFilterChains];
    [(_UIStackedImageContainerLayer *)self _applyFocusDirectionTransform];
  }
}

- (void)_setFocusDirection:(CGPoint)a3 duration:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  if (![(_UIStackedImageContainerLayer *)self _isNormal])
  {
    double v8 = fmax(fmin(x, 1.0), -1.0);
    double v9 = fmax(fmin(y, 1.0), -1.0);
    if ((vabdd_f64(self->_focusDirection.x, v8) > 0.00000011920929
       || vabdd_f64(self->_focusDirection.y, v9) > 0.00000011920929)
      && ![(_UIStackedImageContainerLayer *)self _isHighlighted])
    {
      self->_focusDirection.double x = v8;
      self->_focusDirection.double y = v9;
      [MEMORY[0x1E4F39CF8] animationDuration];
      double v11 = v10;
      [MEMORY[0x1E4F39CF8] setAnimationDuration:a4];
      [(_UIStackedImageContainerLayer *)self _updateRotationAndTranslation:0];
      uint64_t v12 = (void *)MEMORY[0x1E4F39CF8];
      [v12 setAnimationDuration:v11];
    }
  }
}

- (CATransform3D)_scaleTransformForCurrentState
{
  BOOL v5 = [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle];
  BOOL v6 = [(_UIStackedImageContainerLayer *)self _isSelected];
  CGRect result = (CATransform3D *)[(_UIStackedImageContainerLayer *)self _isHighlighted];
  double v8 = (long long *)MEMORY[0x1E4F39B10];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&retstr->m31 = v10;
  *(_OWORD *)&retstr->m33 = v9;
  long long v12 = v8[6];
  long long v11 = v8[7];
  *(_OWORD *)&retstr->m41 = v12;
  *(_OWORD *)&retstr->m43 = v11;
  long long v14 = *v8;
  long long v13 = v8[1];
  *(_OWORD *)&retstr->m11 = *v8;
  *(_OWORD *)&retstr->m13 = v13;
  long long v16 = v8[2];
  long long v15 = v8[3];
  *(_OWORD *)&retstr->m21 = v16;
  *(_OWORD *)&retstr->m23 = v15;
  if (v5)
  {
    if (self->_selectionStyle == 1)
    {
      long long v36 = v16;
      long long v38 = v15;
      long long v32 = v14;
      long long v34 = v13;
      long long v28 = v12;
      long long v30 = v11;
      long long v24 = v10;
      long long v26 = v9;
      CGRect result = (CATransform3D *)[(_UIStackedImageConfiguration *)self->_configuration fullBleedCenteredGrowth];
      if (!result) {
        return result;
      }
      double scale = self->_scale;
      *(_OWORD *)&v40.m31 = v24;
      *(_OWORD *)&v40.m33 = v26;
      *(_OWORD *)&v40.m41 = v28;
      *(_OWORD *)&v40.m43 = v30;
      *(_OWORD *)&v40.m11 = v32;
      *(_OWORD *)&v40.m13 = v34;
      *(_OWORD *)&v40.m21 = v36;
      *(_OWORD *)&v40.m23 = v38;
      double v18 = 1.0;
      CGFloat v19 = 1.0;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if ((v6 | result) != 1) {
    return result;
  }
  if (self->_selectionStyle != 1)
  {
LABEL_9:
    double v18 = self->_scale;
    *(_OWORD *)&v40.m31 = v10;
    *(_OWORD *)&v40.m33 = v9;
    *(_OWORD *)&v40.m41 = v12;
    *(_OWORD *)&v40.m43 = v11;
    *(_OWORD *)&v40.m11 = v14;
    *(_OWORD *)&v40.m13 = v13;
    *(_OWORD *)&v40.m21 = v16;
    *(_OWORD *)&v40.m23 = v15;
LABEL_10:
    CGFloat v19 = 1.0;
    double scale = v18;
    goto LABEL_11;
  }
  long long v37 = v16;
  long long v39 = v15;
  long long v33 = v14;
  long long v35 = v13;
  long long v29 = v12;
  long long v31 = v11;
  long long v25 = v10;
  long long v27 = v9;
  if (![(_UIStackedImageConfiguration *)self->_configuration fullBleedCenteredGrowth])
  {
    double v18 = self->_scale;
    *(_OWORD *)&v40.m31 = v25;
    *(_OWORD *)&v40.m33 = v27;
    *(_OWORD *)&v40.m41 = v29;
    *(_OWORD *)&v40.m43 = v31;
    *(_OWORD *)&v40.m11 = v33;
    *(_OWORD *)&v40.m13 = v35;
    *(_OWORD *)&v40.m21 = v37;
    *(_OWORD *)&v40.m23 = v39;
    goto LABEL_10;
  }
  double scale = self->_scale;
  CGFloat v19 = 1.0;
  double v18 = 1.0 - (scale + -1.0);
  *(_OWORD *)&v40.m31 = v25;
  *(_OWORD *)&v40.m33 = v27;
  *(_OWORD *)&v40.m41 = v29;
  *(_OWORD *)&v40.m43 = v31;
  *(_OWORD *)&v40.m11 = v33;
  *(_OWORD *)&v40.m13 = v35;
  *(_OWORD *)&v40.m21 = v37;
  *(_OWORD *)&v40.m23 = v39;
LABEL_11:
  CGRect result = CATransform3DScale(&v41, &v40, v18, scale, v19);
  long long v20 = *(_OWORD *)&v41.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v41.m31;
  *(_OWORD *)&retstr->m33 = v20;
  long long v21 = *(_OWORD *)&v41.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v41.m41;
  *(_OWORD *)&retstr->m43 = v21;
  long long v22 = *(_OWORD *)&v41.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v41.m11;
  *(_OWORD *)&retstr->m13 = v22;
  long long v23 = *(_OWORD *)&v41.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v41.m21;
  *(_OWORD *)&retstr->m23 = v23;
  return result;
}

- (CATransform3D)_rotationTransformForCurrentFocusDirection
{
  BOOL v5 = [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle];
  CGRect result = (CATransform3D *)[(_UIStackedImageConfiguration *)self->_configuration rotationAmount];
  double rotationAmount = v7;
  if (!self->_selectionStyle)
  {
    CGRect result = (CATransform3D *)[(_UIStackedImageConfiguration *)self->_configuration adjustMotionForSize];
    if (result) {
      double rotationAmount = self->_rotationAmount;
    }
  }
  long long v9 = (long long *)MEMORY[0x1E4F39B10];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&retstr->m31 = v10;
  *(_OWORD *)&retstr->m33 = v11;
  long long v12 = v9[6];
  long long v13 = v9[7];
  *(_OWORD *)&retstr->m41 = v12;
  *(_OWORD *)&retstr->m43 = v13;
  long long v14 = *v9;
  long long v15 = v9[1];
  *(_OWORD *)&retstr->m11 = *v9;
  *(_OWORD *)&retstr->m13 = v15;
  long long v16 = v9[2];
  long long v17 = v9[3];
  *(_OWORD *)&retstr->m21 = v16;
  *(_OWORD *)&retstr->m23 = v17;
  if (v5 && self->_selectionStyle != 1)
  {
    p_focusDirection = &self->_focusDirection;
    CGFloat v19 = -(p_focusDirection->x * rotationAmount);
    *(_OWORD *)&v33.m31 = v10;
    *(_OWORD *)&v33.m33 = v11;
    *(_OWORD *)&v33.m41 = v12;
    *(_OWORD *)&v33.m43 = v13;
    *(_OWORD *)&v33.m11 = v14;
    *(_OWORD *)&v33.m13 = v15;
    *(_OWORD *)&v33.m21 = v16;
    *(_OWORD *)&v33.m23 = v17;
    CATransform3DRotate(&v34, &v33, v19, 0.0, 1.0, 0.0);
    long long v20 = *(_OWORD *)&v34.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v34.m31;
    *(_OWORD *)&retstr->m33 = v20;
    long long v21 = *(_OWORD *)&v34.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v34.m41;
    *(_OWORD *)&retstr->m43 = v21;
    long long v22 = *(_OWORD *)&v34.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v34.m11;
    *(_OWORD *)&retstr->m13 = v22;
    long long v23 = *(_OWORD *)&v34.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v34.m21;
    *(_OWORD *)&retstr->m23 = v23;
    CGFloat v24 = rotationAmount * p_focusDirection->y;
    long long v25 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&v33.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&v33.m33 = v25;
    long long v26 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&v33.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&v33.m43 = v26;
    long long v27 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&v33.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&v33.m13 = v27;
    long long v28 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&v33.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&v33.m23 = v28;
    CGRect result = CATransform3DRotate(&v34, &v33, v24, 1.0, 0.0, 0.0);
    long long v29 = *(_OWORD *)&v34.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v34.m31;
    *(_OWORD *)&retstr->m33 = v29;
    long long v30 = *(_OWORD *)&v34.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v34.m41;
    *(_OWORD *)&retstr->m43 = v30;
    long long v31 = *(_OWORD *)&v34.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v34.m11;
    *(_OWORD *)&retstr->m13 = v31;
    long long v32 = *(_OWORD *)&v34.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v34.m21;
    *(_OWORD *)&retstr->m23 = v32;
  }
  return result;
}

- (CATransform3D)_perspectiveTransformForCurrentState
{
  BOOL v5 = [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle];
  BOOL v6 = [(_UIStackedImageContainerLayer *)self _isSelected];
  CGRect result = (CATransform3D *)[(_UIStackedImageContainerLayer *)self _isHighlighted];
  double v8 = (_OWORD *)MEMORY[0x1E4F39B10];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&retstr->m33 = v9;
  long long v10 = v8[7];
  *(_OWORD *)&retstr->m41 = v8[6];
  *(_OWORD *)&retstr->m43 = v10;
  long long v11 = v8[1];
  *(_OWORD *)&retstr->m11 = *v8;
  *(_OWORD *)&retstr->m13 = v11;
  long long v12 = v8[3];
  *(_OWORD *)&retstr->m21 = v8[2];
  *(_OWORD *)&retstr->m23 = v12;
  if ((v5 || (v6 | result) == 1) && self->_selectionStyle != 1)
  {
    CGRect result = (CATransform3D *)[(_UIStackedImageConfiguration *)self->_configuration zDepth];
    retstr->m34 = -1.0 / v13;
  }
  return result;
}

- (void)_updatePerspective
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  [(_UIStackedImageContainerLayer *)self _perspectiveTransformForCurrentState];
  v7[4] = v12;
  v7[5] = v13;
  v7[6] = v14;
  v7[7] = v15;
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  v7[3] = v11;
  [(CATransformLayer *)self->_imagePerspectiveTransformLayer setTransform:v7];
  v6[4] = v12;
  v6[5] = v13;
  v6[6] = v14;
  v6[7] = v15;
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  v6[3] = v11;
  [(CATransformLayer *)self->_maskPerspectiveTransformLayer setTransform:v6];
  v5[4] = v12;
  v5[5] = v13;
  v5[6] = v14;
  v5[7] = v15;
  v5[0] = v8;
  v5[1] = v9;
  v5[2] = v10;
  v5[3] = v11;
  [(CATransformLayer *)self->_unmaskedOverlayPerspectiveTransformLayer setTransform:v5];
  v4[4] = v12;
  v4[5] = v13;
  v4[6] = v14;
  v4[7] = v15;
  v4[0] = v8;
  v4[1] = v9;
  v4[2] = v10;
  v4[3] = v11;
  [(CALayer *)self->_frontmostPerspectiveTransformLayer setSublayerTransform:v4];
  if ([(_UIStackedImageConfiguration *)self->_configuration focusCursorEnabled])
  {
    v3[4] = v12;
    v3[5] = v13;
    v3[6] = v14;
    v3[7] = v15;
    v3[0] = v8;
    v3[1] = v9;
    v3[2] = v10;
    v3[3] = v11;
    [(CALayer *)self->_cursorLayerContainer setSublayerTransform:v3];
  }
}

- (void)_updateRotationAndTranslation:(id)a3
{
  id v4 = a3;
  [(_UIStackedImageContainerLayer *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  BOOL v13 = [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle];
  BOOL v14 = [(_UIStackedImageContainerLayer *)self _isSelected];
  BOOL v15 = [(_UIStackedImageContainerLayer *)self _isHighlighted];
  [(_UIStackedImageConfiguration *)self->_configuration translationOffset];
  CGFloat x = v16;
  double y = v18;
  if (!self->_selectionStyle
    && [(_UIStackedImageConfiguration *)self->_configuration adjustMotionForSize])
  {
    CGFloat x = self->_translationOffset.x;
    double y = self->_translationOffset.y;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  [(_UIStackedImageContainerLayer *)self _rotationTransformForCurrentFocusDirection];
  v44[4] = v49;
  v44[5] = v50;
  v44[6] = v51;
  v44[7] = v52;
  v44[0] = v45;
  v44[1] = v46;
  v44[2] = v47;
  v44[3] = v48;
  [(CATransformLayer *)self->_imageRotationTransformLayer setTransform:v44];
  v43[4] = v49;
  v43[5] = v50;
  v43[6] = v51;
  v43[7] = v52;
  v43[0] = v45;
  v43[1] = v46;
  v43[2] = v47;
  v43[3] = v48;
  [(CATransformLayer *)self->_maskRotationTransformLayer setTransform:v43];
  v42[4] = v49;
  v42[5] = v50;
  v42[6] = v51;
  v42[7] = v52;
  v42[0] = v45;
  v42[1] = v46;
  v42[2] = v47;
  v42[3] = v48;
  [(CATransformLayer *)self->_unmaskedOverlayRotationTransformLayer setTransform:v42];
  v41[4] = v49;
  v41[5] = v50;
  v41[6] = v51;
  v41[7] = v52;
  v41[0] = v45;
  v41[1] = v46;
  _OWORD v41[2] = v47;
  v41[3] = v48;
  [(CATransformLayer *)self->_frontmostRotationTransformLayer setTransform:v41];
  if ([(_UIStackedImageConfiguration *)self->_configuration focusCursorEnabled])
  {
    v40[4] = v49;
    v40[5] = v50;
    v40[6] = v51;
    v40[7] = v52;
    v40[0] = v45;
    v40[1] = v46;
    v40[2] = v47;
    v40[3] = v48;
    [(CATransformLayer *)self->_cursorRotationTransformLayer setTransform:v40];
  }
  [(CALayer *)self->_imageLayersContainer bounds];
  double v19 = CGRectGetWidth(v53) * 0.5;
  [(CALayer *)self->_imageLayersContainer bounds];
  double v20 = CGRectGetHeight(v54) * 0.5;
  v55.origin.CGFloat x = v6;
  v55.origin.double y = v8;
  v55.size.double width = v10;
  v55.size.double height = v12;
  double v21 = CGRectGetWidth(v55) * 0.5;
  v56.origin.CGFloat x = v6;
  v56.origin.double y = v8;
  v56.size.double width = v10;
  v56.size.double height = v12;
  CGFloat v22 = CGRectGetHeight(v56) * 0.5;
  [(_UIStackedImageConfiguration *)self->_configuration radiosityOffset];
  double v24 = v22 + v23;
  if (v13)
  {
    double v25 = v38;
    double v26 = y;
    double v27 = v38 * self->_focusDirection.x;
    double v20 = v20 + y * self->_focusDirection.y;
    if (self->_selectionStyle == 1
      && ![(_UIStackedImageConfiguration *)self->_configuration fullBleedCenteredGrowth])
    {
      [(_UIStackedImageConfiguration *)self->_configuration fullBleedOffset];
      double v20 = v20 + v28;
    }
    double v19 = v19 + v27;
    double v29 = v38 * self->_focusDirection.x * 1.5;
    double v21 = v21 + v29;
    double v30 = y * self->_focusDirection.y * 1.5;
    double v24 = v24 + v30;
  }
  else
  {
    double v29 = *MEMORY[0x1E4F1DAD8];
    double v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v25 = v38;
    double v26 = y;
  }
  if ((v14 || v15)
    && self->_selectionStyle == 1
    && ![(_UIStackedImageConfiguration *)self->_configuration fullBleedCenteredGrowth])
  {
    [(_UIStackedImageConfiguration *)self->_configuration fullBleedOffset];
    double v20 = v20 + v31;
  }
  -[_UIStackedImageContainerLayer _updateFocusKeylineStrokeTranslation:](self, "_updateFocusKeylineStrokeTranslation:", v25, v26);
  [MEMORY[0x1E4F39CF8] animationDuration];
  double v33 = v32;
  if ([(_UIStackedImageContainerLayer *)self _isNormal])
  {
    [(_UIStackedImageConfiguration *)self->_configuration repositionUnselectionDuration];
    if (v4)
    {
      [v4 _unfocusingRepositionAnimationDuration];
    }
    else
    {
      double v36 = v34;
      +[UIView inheritedAnimationDuration];
      if (v37 <= 0.0)
      {
LABEL_22:
        [MEMORY[0x1E4F39CF8] setAnimationDuration:v36];
        goto LABEL_23;
      }
      +[UIView inheritedAnimationDuration];
    }
    double v36 = v35;
    goto LABEL_22;
  }
LABEL_23:
  -[CALayer setPosition:](self->_flatLayer, "setPosition:", v19, v20);
  -[CALayer setPosition:](self->_imageLayersContainer, "setPosition:", v19, v20);
  -[CALayer setPosition:](self->_unmaskedOverlayContainerLayer, "setPosition:", v19, v20);
  -[CALayer setPosition:](self->_cursorLayer, "setPosition:", v19, v20);
  -[_UIStackedImageContainerLayer _updateShadowPositionWithOffset:](self, "_updateShadowPositionWithOffset:", v29, v30);
  -[CALayer setPosition:](self->_radiosityLayer, "setPosition:", v21, v24);
  if ([(_UIStackedImageContainerLayer *)self _isNormal]) {
    [MEMORY[0x1E4F39CF8] setAnimationDuration:v33];
  }
  [(_UIStackedImageContainerLayer *)self _updateFullBleedImageLayers];
  [(_UIStackedImageContainerLayer *)self _updateSpecularLayerContentsRect];
  [(_UIStackedImageContainerLayer *)self _updateContentProviderLayerFocusDirection];
  [(_UIStackedImageContainerLayer *)self _updateImageLayerFilterValues];
}

- (void)_updateFocusKeylineStrokeTranslation:(CGPoint)a3
{
  if (self->_focusKeylineStrokeLayer)
  {
    double y = a3.y;
    double x = a3.x;
    [(_UIStackedImageContainerLayer *)self bounds];
    CGFloat v6 = v16.origin.x;
    CGFloat v7 = v16.origin.y;
    CGFloat width = v16.size.width;
    CGFloat height = v16.size.height;
    CGFloat v10 = CGRectGetWidth(v16) * 0.5;
    v17.origin.double x = v6;
    v17.origin.double y = v7;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    CGFloat v11 = CGRectGetHeight(v17) * 0.5;
    double v12 = v10 + x * self->_focusDirection.x;
    double v13 = v11 + y * self->_focusDirection.y;
    focusKeylineStrokeLayer = self->_focusKeylineStrokeLayer;
    -[CALayer setPosition:](focusKeylineStrokeLayer, "setPosition:", v12, v13);
  }
}

- (void)_updateFocusKeylineStrokeScale
{
  if (self->_focusKeylineStrokeLayer)
  {
    memset(&v5, 0, sizeof(v5));
    CATransform3DMakeScale(&v5, self->_scale, self->_scale, 1.0);
    focusKeylineStrokeLayer = self->_focusKeylineStrokeLayer;
    CATransform3D v4 = v5;
    [(CALayer *)focusKeylineStrokeLayer setTransform:&v4];
    [(CALayer *)self->_focusKeylineStrokeLayer setBorderWidth:2.0 / self->_scale];
  }
}

- (CATransform3D)_fixedFrameTransformForDepth:(SEL)a3 fudgeFactor:(double)a4
{
  [(_UIStackedImageConfiguration *)self->_configuration zDepth];
  double v10 = (1.0 - a4 / v9) * a5;
  CATransform3DMakeTranslation(&a, 0.0, 0.0, a4);
  CATransform3DMakeScale(&v12, self->_scale * v10, self->_scale * v10, 1.0);
  return CATransform3DConcat(retstr, &a, &v12);
}

- (void)_updateNormalImageLayers
{
  if (self->_selectionStyle != 1)
  {
    HIDWORD(v65) = [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle];
    BOOL v66 = [(_UIStackedImageContainerLayer *)self _isSelected];
    LODWORD(v65) = [(_UIStackedImageContainerLayer *)self _isHighlighted];
    memset(&v74, 0, sizeof(v74));
    [(_UIStackedImageContainerLayer *)self _scaleTransformForCurrentState];
    NSUInteger v3 = [(NSArray *)self->_imageLayers count];
    if (v3)
    {
      NSUInteger v4 = v3;
      uint64_t v5 = 0;
      CGFloat v6 = sel_fixedFrame;
      CGFloat v7 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
      NSUInteger v64 = v3;
      do
      {
        CGFloat v8 = -[NSArray objectAtIndex:](self->_imageLayers, "objectAtIndex:", v5, v64);
        double v9 = [*(id *)((char *)&self->super.super.isa + v7[328]) objectAtIndexedSubscript:v5];
        if (objc_opt_respondsToSelector())
        {
          int v10 = [v9 fixedFrame];
          if (v65) {
            goto LABEL_9;
          }
        }
        else
        {
          int v10 = 0;
          if (v65)
          {
LABEL_9:
            double v13 = v6;
            BOOL v14 = [(NSArray *)self->_parallaxLayerDepths objectAtIndex:v5];
            [v14 doubleValue];
            double v16 = v15;

            memset(&v73, 0, sizeof(v73));
            if (v10)
            {
              [(_UIStackedImageContainerLayer *)self _fixedFrameTransformForDepth:v16 fudgeFactor:1.035];
            }
            else
            {
              CATransform3DMakeTranslation(&a, 0.0, 0.0, v16);
              CATransform3D b = v74;
              CATransform3DConcat(&v72, &a, &b);
              CATransform3D v73 = v72;
            }
            [v8 position];
            double v24 = v23;
            double v26 = v25;
            double v27 = [(NSArray *)self->_imageLayers firstObject];
            [v27 position];
            CGFloat v29 = v28 - v24;
            CGFloat v31 = v30 - v26;
            CATransform3DMakeTranslation(&v69, v29, v31, 0.0);
            CATransform3D b = v73;
            CATransform3DConcat(&v72, &b, &v69);
            CATransform3D v73 = v72;
            CATransform3D b = v72;
            CATransform3DTranslate(&v72, &b, -v29, -v31, 0.0);
            CATransform3D v73 = v72;
            double v32 = [(CATransformLayer *)self->_imagePerspectiveTransformLayer animationForKey:@"transform"];
            if (v32
              && [MEMORY[0x1E4F39CF8] disableActions]
              && ([v8 hasBeenCommitted] & 1) == 0)
            {
              double v33 = [(_UIStackedImageContainerLayer *)self actionForLayer:v8 forKey:@"transform"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v32 beginTime];
                objc_msgSend(v33, "setBeginTime:");
                [v32 duration];
                objc_msgSend(v33, "setDuration:");
                CATransform3D v72 = v73;
                double v34 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v72];
                [v33 setToValue:v34];

                NSUInteger v4 = v64;
                [v8 addAnimation:v33 forKey:@"transform"];
              }
            }
            CATransform3D v72 = v73;
            [v8 setTransform:&v72];

            CGFloat v6 = v13;
            CGFloat v7 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
            goto LABEL_23;
          }
        }
        if (v66)
        {
          *(_OWORD *)&v73.m31 = *(_OWORD *)&v74.m31;
          *(_OWORD *)&v73.m33 = *(_OWORD *)&v74.m33;
          *(_OWORD *)&v73.m41 = *(_OWORD *)&v74.m41;
          *(_OWORD *)&v73.m43 = *(_OWORD *)&v74.m43;
          *(_OWORD *)&v73.m11 = *(_OWORD *)&v74.m11;
          *(_OWORD *)&v73.m13 = *(_OWORD *)&v74.m13;
          long long v11 = *(_OWORD *)&v74.m21;
          long long v12 = *(_OWORD *)&v74.m23;
        }
        else
        {
          long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
          *(_OWORD *)&v73.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
          *(_OWORD *)&v73.m33 = v17;
          long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
          *(_OWORD *)&v73.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
          *(_OWORD *)&v73.m43 = v18;
          long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
          *(_OWORD *)&v73.m11 = *MEMORY[0x1E4F39B10];
          *(_OWORD *)&v73.m13 = v19;
          long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
          long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
        }
        *(_OWORD *)&v73.m21 = v11;
        *(_OWORD *)&v73.m23 = v12;
        if (v10)
        {
          double v20 = [(NSArray *)self->_parallaxLayerDepths objectAtIndex:v5];
          [v20 doubleValue];
          CGFloat v22 = v21;

          CATransform3D v72 = v73;
          CATransform3DTranslate(&v73, &v72, 0.0, 0.0, v22);
        }
        CATransform3D v72 = v73;
        [v8 setTransform:&v72];
LABEL_23:

        ++v5;
      }
      while (v4 != v5);
    }
    if (self->_overlayLayer)
    {
      BOOL v35 = [(_UIStackedImageConfiguration *)self->_configuration overlayFixedFrame];
      double v36 = [(NSArray *)self->_parallaxLayerDepths lastObject];
      [v36 doubleValue];
      double v38 = v37;
      [(_UIStackedImageConfiguration *)self->_configuration overlayDepth];
      double v40 = v38 + v39;

      memset(&v73, 0, sizeof(v73));
      if ((HIDWORD(v65) | v65) == 1)
      {
        if (v35)
        {
          [(_UIStackedImageContainerLayer *)self _fixedFrameTransformForDepth:v40 fudgeFactor:1.015];
        }
        else
        {
          CATransform3DMakeTranslation(&v68, 0.0, 0.0, v40);
          CATransform3D v72 = v74;
          CATransform3DConcat(&v73, &v68, &v72);
        }
      }
      else if (v66)
      {
        CATransform3D v73 = v74;
      }
      else
      {
        long long v41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
        long long v42 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
        *(_OWORD *)&v73.m31 = v41;
        *(_OWORD *)&v73.m33 = v42;
        long long v43 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
        long long v44 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
        *(_OWORD *)&v73.m41 = v43;
        *(_OWORD *)&v73.m43 = v44;
        long long v45 = *MEMORY[0x1E4F39B10];
        long long v46 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
        *(_OWORD *)&v73.m11 = *MEMORY[0x1E4F39B10];
        *(_OWORD *)&v73.m13 = v46;
        long long v47 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
        long long v48 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
        *(_OWORD *)&v73.m21 = v47;
        *(_OWORD *)&v73.m23 = v48;
        if (v35)
        {
          *(_OWORD *)&v72.m31 = v41;
          *(_OWORD *)&v72.m33 = v42;
          *(_OWORD *)&v72.m41 = v43;
          *(_OWORD *)&v72.m43 = v44;
          *(_OWORD *)&v72.m11 = v45;
          *(_OWORD *)&v72.m13 = v46;
          *(_OWORD *)&v72.m21 = v47;
          *(_OWORD *)&v72.m23 = v48;
          CATransform3DTranslate(&v73, &v72, 0.0, 0.0, v40);
        }
      }
      overlayContainerLayer = self->_overlayContainerLayer;
      CATransform3D v72 = v73;
      [(CALayer *)overlayContainerLayer setTransform:&v72];
    }
    if (self->_unmaskedOverlayLayer)
    {
      int v50 = HIDWORD(v65) | v65 | v66;
      if (v50 == 1)
      {
        *(_OWORD *)&v73.m31 = *(_OWORD *)&v74.m31;
        *(_OWORD *)&v73.m33 = *(_OWORD *)&v74.m33;
        *(_OWORD *)&v73.m41 = *(_OWORD *)&v74.m41;
        *(_OWORD *)&v73.m43 = *(_OWORD *)&v74.m43;
        *(_OWORD *)&v73.m11 = *(_OWORD *)&v74.m11;
        *(_OWORD *)&v73.m13 = *(_OWORD *)&v74.m13;
        long long v51 = *(_OWORD *)&v74.m21;
        long long v52 = *(_OWORD *)&v74.m23;
      }
      else
      {
        long long v53 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
        *(_OWORD *)&v73.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
        *(_OWORD *)&v73.m33 = v53;
        long long v54 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
        *(_OWORD *)&v73.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
        *(_OWORD *)&v73.m43 = v54;
        long long v55 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
        *(_OWORD *)&v73.m11 = *MEMORY[0x1E4F39B10];
        *(_OWORD *)&v73.m13 = v55;
        long long v51 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
        long long v52 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      }
      *(_OWORD *)&v73.m21 = v51;
      *(_OWORD *)&v73.m23 = v52;
      CGRect v56 = [(NSArray *)self->_parallaxLayerDepths lastObject];
      [v56 doubleValue];
      double v58 = v57;

      if ([(NSArray *)self->_imageLayers count] == 1)
      {
        double v59 = self->_maximumParallaxDepth * 0.5;
      }
      else
      {
        [(_UIStackedImageConfiguration *)self->_configuration overlayDepth];
        double v59 = v58 + v60;
      }
      CATransform3DMakeTranslation(&v67, 0.0, 0.0, v59);
      CATransform3D v72 = v73;
      CATransform3DConcat(&v73, &v67, &v72);
      if (v50)
      {
        [(_UIStackedImageConfiguration *)self->_configuration unmaskedOverlayScaleFactor];
        if (fabs(v61 + -1.0) >= 2.22044605e-16)
        {
          [(_UIStackedImageConfiguration *)self->_configuration unmaskedOverlayScaleFactor];
          CATransform3D b = v73;
          CATransform3DScale(&v72, &b, v62, v62, 1.0);
          CATransform3D v73 = v72;
        }
      }
      unmaskedOverlayContainerLayer = self->_unmaskedOverlayContainerLayer;
      CATransform3D v72 = v73;
      [(CALayer *)unmaskedOverlayContainerLayer setTransform:&v72];
    }
  }
}

- (void)_updateFullBleedImageLayers
{
  if (self->_selectionStyle == 1)
  {
    BOOL v3 = [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle];
    BOOL v52 = [(_UIStackedImageContainerLayer *)self _isSelected];
    BOOL v53 = [(_UIStackedImageContainerLayer *)self _isHighlighted];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    [(_UIStackedImageContainerLayer *)self _scaleTransformForCurrentState];
    unint64_t v4 = [(NSArray *)self->_imageLayers count];
    unint64_t v5 = v4 - 1;
    uint64_t v6 = v4 - 1 <= 1 ? 1 : v4 - 1;
    if (v4)
    {
      unint64_t v7 = v4;
      unint64_t v8 = 0;
      double v9 = 0.064 / (double)(unint64_t)v6;
      int v10 = v3 || v53;
      double v51 = 20.0 / (double)v4;
      long long v11 = (_OWORD *)MEMORY[0x1E4F39B10];
      double v50 = 10.0 / (double)v4;
      do
      {
        long long v12 = -[NSArray objectAtIndex:](self->_imageLayers, "objectAtIndex:", v8, *(void *)&v50);
        double v13 = v12;
        if (v10)
        {
          double v14 = v9 * (double)v8 + 1.031;
          [v12 position];
          double v16 = v15;
          double v18 = v17;
          long long v19 = [(NSArray *)self->_imageLayers firstObject];
          [v19 position];
          double v21 = v20;
          double v23 = v22;
          if (v53)
          {
            BOOL v24 = [(_UIStackedImageConfiguration *)self->_configuration fullBleedCenteredGrowth];
            double scale = self->_scale;
            double v26 = v14 * scale;
            double v27 = v14 * (1.0 - (scale + -1.0));
            if (v24) {
              double v14 = v27;
            }
            else {
              double v14 = v26;
            }
          }
          [(CALayer *)self->_imageLayersContainer bounds];
          double v29 = v28;
          long long v30 = v11[5];
          *(_OWORD *)&v56.m31 = v11[4];
          *(_OWORD *)&v56.m33 = v30;
          long long v31 = v11[7];
          *(_OWORD *)&v56.m41 = v11[6];
          *(_OWORD *)&v56.m43 = v31;
          long long v32 = v11[1];
          *(_OWORD *)&v56.m11 = *v11;
          *(_OWORD *)&v56.m13 = v32;
          long long v33 = v11[3];
          *(_OWORD *)&v56.m21 = v11[2];
          *(_OWORD *)&v56.m23 = v33;
          double v34 = [(NSArray *)self->_parallaxImages objectAtIndex:v8];
          if ((objc_opt_respondsToSelector() & 1) == 0 || ([v34 fixedFrame] & 1) == 0)
          {
            double v35 = v21 - v16;
            double v36 = v23 - v18;
            BOOL v37 = [(_UIStackedImageConfiguration *)self->_configuration fullBleedCenteredGrowth];
            double v38 = v29 * 0.61 + v29 * -0.5;
            if (v37) {
              double v38 = -0.0;
            }
            CGFloat v39 = v36 + v38;
            double v40 = (double)(v8 + 1);
            double v41 = v51 * v40 * self->_focusDirection.x;
            double v42 = v50 * v40 * self->_focusDirection.y;
            CATransform3DMakeTranslation(&v56, v35, v39, 0.0);
            CATransform3D v54 = v56;
            CATransform3DScale(&v55, &v54, v14, v14, 1.0);
            CATransform3D v56 = v55;
            CATransform3D v54 = v55;
            CATransform3DTranslate(&v55, &v54, v41 - v35, v42 - v39, 0.0);
            CATransform3D v56 = v55;
            [v13 setTransform:&v55];
          }
        }
        else
        {
          if (v52)
          {
            *(_OWORD *)&v56.m31 = v61;
            *(_OWORD *)&v56.m33 = v62;
            *(_OWORD *)&v56.m41 = v63;
            *(_OWORD *)&v56.m43 = v64;
            *(_OWORD *)&v56.m11 = v57;
            *(_OWORD *)&v56.m13 = v58;
            long long v43 = v59;
            long long v44 = v60;
          }
          else
          {
            long long v45 = v11[5];
            *(_OWORD *)&v56.m31 = v11[4];
            *(_OWORD *)&v56.m33 = v45;
            long long v46 = v11[7];
            *(_OWORD *)&v56.m41 = v11[6];
            *(_OWORD *)&v56.m43 = v46;
            long long v47 = v11[1];
            *(_OWORD *)&v56.m11 = *v11;
            *(_OWORD *)&v56.m13 = v47;
            long long v43 = v11[2];
            long long v44 = v11[3];
          }
          *(_OWORD *)&v56.m21 = v43;
          *(_OWORD *)&v56.m23 = v44;
          *(_OWORD *)&v55.m31 = *(_OWORD *)&v56.m31;
          *(_OWORD *)&v55.m33 = *(_OWORD *)&v56.m33;
          *(_OWORD *)&v55.m41 = *(_OWORD *)&v56.m41;
          *(_OWORD *)&v55.m43 = *(_OWORD *)&v56.m43;
          *(_OWORD *)&v55.m11 = *(_OWORD *)&v56.m11;
          *(_OWORD *)&v55.m13 = *(_OWORD *)&v56.m13;
          *(_OWORD *)&v55.m21 = v43;
          *(_OWORD *)&v55.m23 = v44;
          [v12 setTransform:&v55];
          if (v5 == v8 && self->_overlayLayer)
          {
            overlayContainerLayer = self->_overlayContainerLayer;
            CATransform3D v55 = v56;
            [(CALayer *)overlayContainerLayer setTransform:&v55];
          }
          if (v5 == v8 && self->_unmaskedOverlayLayer)
          {
            unmaskedOverlayContainerLayer = self->_unmaskedOverlayContainerLayer;
            CATransform3D v55 = v56;
            [(CALayer *)unmaskedOverlayContainerLayer setTransform:&v55];
          }
        }

        ++v8;
      }
      while (v7 != v8);
    }
  }
}

- (void)_updateSpecularLayerContentsRect
{
  BOOL v3 = [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle];
  [(_UIStackedImageContainerLayer *)self bounds];
  if (v3)
  {
    CGFloat v8 = v4;
    CGFloat v9 = v5;
    CGFloat v10 = v6;
    CGFloat v11 = v7;
    if (v6 >= v7) {
      double v12 = v6;
    }
    else {
      double v12 = v7;
    }
    double v13 = v12 * 1.75;
    double v27 = v6 / (v12 * 1.75);
    double x = self->_focusDirection.x;
    double v15 = v7 / (v12 * 1.75);
    [(_UIStackedImageConfiguration *)self->_configuration specularHighlightHorizontalPositionSensitivity];
    double v17 = v16 * x;
    v29.origin.double x = v8;
    v29.origin.double y = v9;
    v29.size.CGFloat width = v10;
    v29.size.CGFloat height = v11;
    double v18 = v17 * CGRectGetWidth(v29);
    double y = self->_focusDirection.y;
    [(_UIStackedImageConfiguration *)self->_configuration specularHighlightVerticalPositionSensitivity];
    double v21 = v20 * y;
    v30.origin.double x = v8;
    v30.origin.double y = v9;
    v30.size.CGFloat width = v10;
    v30.size.CGFloat height = v11;
    double v22 = v21 * CGRectGetHeight(v30);
    [(_UIStackedImageConfiguration *)self->_configuration specularHighlightVerticalPosition];
    double scale = self->_scale;
    double v25 = v13 * v23 - v22;
    if (scale < 1.3) {
      double scale = 1.3;
    }
    specularLayer = self->_specularLayer;
    -[CALayer setContentsRect:](specularLayer, "setContentsRect:", 0.5 - v18 / scale / v13 - v27 * 0.5, v25 / scale / v13 + 0.5 - v15 * 0.5, v27, v15);
  }
}

- (void)_updateContentProviderLayerFocusDirection
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_imageLayers count])
  {
    unint64_t v3 = 0;
    double v4 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
    do
    {
      double v5 = [(NSArray *)self->_imageLayers objectAtIndex:v3];
      double v6 = [*(id *)((char *)&self->super.super.isa + v4[329]) layers];
      double v7 = [v6 objectAtIndex:v3];

      if (objc_opt_respondsToSelector())
      {
        CGFloat v8 = [v7 contentProvider];

        if (v8)
        {
          double v16 = v7;
          double v17 = v5;
          unint64_t v18 = v3;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          CGFloat v9 = [v5 sublayers];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v21;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v21 != v12) {
                  objc_enumerationMutation(v9);
                }
                double v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
                CGPoint focusDirection = self->_focusDirection;
                double v15 = [MEMORY[0x1E4F29238] valueWithBytes:&focusDirection objCType:"{CGPoint=dd}"];
                [v14 setValue:v15 forKey:@"focusDirection"];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
            }
            while (v11);
          }

          double v7 = v16;
          double v5 = v17;
          unint64_t v3 = v18;
          double v4 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
        }
      }

      ++v3;
    }
    while (v3 < [(NSArray *)self->_imageLayers count]);
  }
}

- (void)_updateImageLayerFilterChains
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(_UIStackedImageConfiguration *)self->_configuration boostBrightness]
    && [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle])
  {
    unint64_t v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A000]];
    [v3 setValue:&unk_1ED3F2958 forKey:@"inputAmount"];
    [v3 setName:@"brightness"];
    [v5 addObject:v3];
  }
  if ([(_UIStackedImageConfiguration *)self->_configuration hueShift]
    && [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle])
  {
    double v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A020]];
    [v4 setValue:&unk_1ED3F2958 forKey:@"inputAngle"];
    [v4 setName:@"hue"];
    [v5 addObject:v4];
  }
  [(CALayer *)self->_imageLayersContainer setFilters:v5];
}

- (void)_updateImageLayerFilterValues
{
  BOOL v3 = [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle];
  if ([(_UIStackedImageConfiguration *)self->_configuration boostBrightness]) {
    BOOL v4 = !v3;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    double v5 = self->_focusDirection.y * 0.05;
    if (fabs(v5) < 0.01) {
      double v5 = 0.0;
    }
    imageLayersContainer = self->_imageLayersContainer;
    double v7 = [NSNumber numberWithDouble:v5];
    [(CALayer *)imageLayersContainer setValue:v7 forKeyPath:@"filters.brightness.inputAmount"];
  }
  if ([(_UIStackedImageConfiguration *)self->_configuration hueShift] && v3)
  {
    double v8 = self->_focusDirection.x * -0.15;
    if (fabs(v8) < 0.01) {
      double v8 = 0.0;
    }
    CGFloat v9 = self->_imageLayersContainer;
    id v10 = [NSNumber numberWithDouble:v8];
    [(CALayer *)v9 setValue:v10 forKeyPath:@"filters.hue.inputAngle"];
  }
}

- (void)_updateLayerForSelection
{
}

- (CATransform3D)_specularTransformForCurrentState
{
  double v5 = (_OWORD *)MEMORY[0x1E4F39B10];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&retstr->m33 = v6;
  long long v7 = v5[7];
  *(_OWORD *)&retstr->m41 = v5[6];
  *(_OWORD *)&retstr->m43 = v7;
  long long v8 = v5[1];
  *(_OWORD *)&retstr->m11 = *v5;
  *(_OWORD *)&retstr->m13 = v8;
  long long v9 = v5[3];
  *(_OWORD *)&retstr->m21 = v5[2];
  *(_OWORD *)&retstr->m23 = v9;
  if ([(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle]
    || (CGRect result = (CATransform3D *)[(_UIStackedImageContainerLayer *)self _isHighlighted], result))
  {
    double v11 = 0.0;
    if (!self->_nonOpaqueShadow && !self->_singleLayerNoMask) {
      double v11 = self->_maximumParallaxDepth * 1.3;
    }
    [(_UIStackedImageContainerLayer *)self _scaleTransformForCurrentState];
    CGRect result = CATransform3DTranslate(&v17, &v16, 0.0, 0.0, v11);
    long long v12 = *(_OWORD *)&v17.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v17.m31;
    *(_OWORD *)&retstr->m33 = v12;
    long long v13 = *(_OWORD *)&v17.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v17.m41;
    *(_OWORD *)&retstr->m43 = v13;
    long long v14 = *(_OWORD *)&v17.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v17.m11;
    *(_OWORD *)&retstr->m13 = v14;
    long long v15 = *(_OWORD *)&v17.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v17.m21;
    *(_OWORD *)&retstr->m23 = v15;
  }
  return result;
}

- (void)_updateLayerForSelectionWithAnimationCoordinator:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F39CF8];
  id v5 = a3;
  [v4 animationDuration];
  double v7 = v6;
  BOOL v8 = [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle];
  configuration = self->_configuration;
  if (v8) {
    [(_UIStackedImageConfiguration *)configuration layerSelectionDuration];
  }
  else {
    [(_UIStackedImageConfiguration *)configuration layerUnselectionDuration];
  }
  double v11 = v10;
  if (v5 || (+[UIView inheritedAnimationDuration], v12 > 0.0))
  {
    +[UIView inheritedAnimationDuration];
    double v11 = v13;
  }
  [MEMORY[0x1E4F39CF8] setAnimationDuration:v11];
  self->_selectionDuration = v11;
  if ([(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle])
  {
    [(_UIStackedImageContainerLayer *)self _focusedScaleFactorForCurrentBounds];
    self->_double scale = v14;
    self->_CGPoint focusDirection = (CGPoint)*MEMORY[0x1E4F1DAD8];
    specularLayer = self->_specularLayer;
    [(_UIStackedImageConfiguration *)self->_configuration specularOpacity];
    *(float *)&double v16 = v16;
    [(CALayer *)specularLayer setOpacity:v16];
    CATransform3D v17 = self->_specularLayer;
    [(_UIStackedImageContainerLayer *)self _specularTransformForCurrentState];
    unint64_t v18 = (long long *)&v41;
    long long v19 = v17;
  }
  else
  {
    BOOL v20 = [(_UIStackedImageContainerLayer *)self _isSelected];
    double v21 = 1.13;
    if (!v20) {
      double v21 = 1.0;
    }
    self->_double scale = v21;
    self->_CGPoint focusDirection = (CGPoint)*MEMORY[0x1E4F1DAD8];
    [(CALayer *)self->_specularLayer setOpacity:0.0];
    long long v19 = self->_specularLayer;
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v37 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v38 = v22;
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v39 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v40 = v23;
    long long v24 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v33 = *MEMORY[0x1E4F39B10];
    long long v34 = v24;
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v35 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v36 = v25;
    unint64_t v18 = &v33;
  }
  -[CALayer setTransform:](v19, "setTransform:", v18, v33, v34, v35, v36, v37, v38, v39, v40);
  [(_UIStackedImageContainerLayer *)self _applyFocusDirectionTransformWithAnimationCoordinator:v5];

  [MEMORY[0x1E4F39CF8] setAnimationDuration:v7];
  if (self->_cursorLayer)
  {
    [MEMORY[0x1E4F39CF8] animationDuration];
    double v27 = v26;
    [MEMORY[0x1E4F39CF8] setAnimationDuration:0.0];
    if ([(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle]) {
      uint64_t v28 = [(_UIStackedImageConfiguration *)self->_configuration focusCursorEnabled] ^ 1;
    }
    else {
      uint64_t v28 = 1;
    }
    [(CALayer *)self->_cursorLayer setHidden:v28];
    [MEMORY[0x1E4F39CF8] setAnimationDuration:v27];
  }
  if (self->_focusKeylineStrokeLayer)
  {
    [MEMORY[0x1E4F39CF8] animationDuration];
    double v30 = v29;
    [MEMORY[0x1E4F39CF8] setAnimationDuration:0.0];
    focusKeylineStrokeLayer = self->_focusKeylineStrokeLayer;
    if ([(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle]) {
      uint64_t v32 = 0;
    }
    else {
      uint64_t v32 = [(_UIStackedImageConfiguration *)self->_configuration focusCursorEnabled] ^ 1;
    }
    [(CALayer *)focusKeylineStrokeLayer setHidden:v32];
    [MEMORY[0x1E4F39CF8] setAnimationDuration:v30];
  }
}

- (double)_focusedShadowRadius
{
  int64_t selectionStyle = self->_selectionStyle;
  if ((unint64_t)(selectionStyle - 1) >= 2)
  {
    if (selectionStyle)
    {
      long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"_UIStackedImageContainerLayer.m" lineNumber:3544 description:@"unknown selection style"];

      return 0.0;
    }
    else
    {
      BOOL v6 = [(_UIStackedImageContainerLayer *)self _isHighlighted];
      configuration = self->_configuration;
      if (v6)
      {
        [(_UIStackedImageConfiguration *)configuration defaultHighlightedShadowRadius];
      }
      else
      {
        [(_UIStackedImageConfiguration *)configuration defaultFocusedShadowRadius];
      }
    }
  }
  else
  {
    BOOL v4 = self->_configuration;
    [(_UIStackedImageConfiguration *)v4 fullBleedFocusedShadowRadius];
  }
  return result;
}

- (double)_unfocusedShadowRadius
{
  int64_t selectionStyle = self->_selectionStyle;
  if (selectionStyle == 2)
  {
LABEL_4:
    configuration = self->_configuration;
    [(_UIStackedImageConfiguration *)configuration defaultUnfocusedShadowRadius];
    return result;
  }
  if (selectionStyle != 1)
  {
    if (selectionStyle)
    {
      BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"_UIStackedImageContainerLayer.m" lineNumber:3564 description:@"unknown selection style"];

      return 0.0;
    }
    goto LABEL_4;
  }
  BOOL v6 = self->_configuration;
  [(_UIStackedImageConfiguration *)v6 fullBleedUnfocusedShadowRadius];
  return result;
}

- (double)_getShadowOpacity
{
  if ([(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle]
    || [(_UIStackedImageContainerLayer *)self _isHighlighted])
  {
    int64_t selectionStyle = self->_selectionStyle;
    if ((unint64_t)(selectionStyle - 1) < 2)
    {
      [(_UIStackedImageConfiguration *)self->_configuration fullBleedFocusedShadowOpacity];
      double v6 = v5;
      goto LABEL_5;
    }
    if (!selectionStyle)
    {
      [(_UIStackedImageConfiguration *)self->_configuration defaultFocusedShadowOpacity];
      double v6 = v8;
      if ([(_UIStackedImageContainerLayer *)self _isHighlighted])
      {
        [(_UIStackedImageConfiguration *)self->_configuration defaultHighlightedShadowOpacity];
        double v6 = v9;
LABEL_7:
        if ([(_UIStackedImageConfiguration *)self->_configuration focusCursorEnabled])
        {
          [(_UIStackedImageConfiguration *)self->_configuration focusCursorShadowOpacityAdjustment];
          return v6 + v7;
        }
        return v6;
      }
LABEL_5:
      if ([(_UIStackedImageContainerLayer *)self _isFocusedIdle]) {
        double v6 = v6 + 0.1;
      }
      goto LABEL_7;
    }
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    CATransform3D v17 = v16;
    SEL v18 = a2;
    long long v19 = self;
    uint64_t v20 = 3600;
    goto LABEL_25;
  }
  double v10 = +[UIScreen mainScreen];
  double v11 = [v10 traitCollection];
  uint64_t v12 = [v11 userInterfaceStyle];

  int64_t v13 = self->_selectionStyle;
  if (v13 == 2)
  {
LABEL_15:
    double v6 = 0.0;
    if (v12 != 1000)
    {
      configuration = self->_configuration;
      [(_UIStackedImageConfiguration *)configuration defaultUnfocusedShadowOpacity];
      return result;
    }
    return v6;
  }
  if (v13 != 1)
  {
    if (v13)
    {
      double v16 = [MEMORY[0x1E4F28B00] currentHandler];
      CATransform3D v17 = v16;
      SEL v18 = a2;
      long long v19 = self;
      uint64_t v20 = 3621;
LABEL_25:
      [v16 handleFailureInMethod:v18 object:v19 file:@"_UIStackedImageContainerLayer.m" lineNumber:v20 description:@"unknown selection style"];

      return 0.0;
    }
    goto LABEL_15;
  }
  double v6 = 0.0;
  if (v12 == 1000) {
    return v6;
  }
  double v21 = self->_configuration;
  [(_UIStackedImageConfiguration *)v21 fullBleedUnfocusedShadowOpacity];
  return result;
}

- (void)_updateShadowBounds
{
  if (self->_nonOpaqueShadow) {
    return;
  }
  BOOL v3 = [(_UIStackedImageContainerLayer *)self _isHighlighted]
    || [(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle];
  BOOL v4 = [(_UIStackedImageConfiguration *)self->_configuration useSeparateUnfocusedShadowImage];
  [(_UIStackedImageContainerLayer *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  if (v4 && !v3)
  {
    [(_UIStackedImageContainerLayer *)self _unfocusedShadowRadius];
    double v14 = v13 + v13;
    CGFloat v15 = -(v13 + v13);
    v86.origin.double x = v6;
    v86.origin.double y = v8;
    v86.size.CGFloat width = v10;
    v86.size.CGFloat height = v12;
    CGRect v87 = CGRectInset(v86, v15, v15);
    double v16 = v87.size.width + -4.0;
    double v17 = v87.size.height + -2.0;
    if ((self->_selectionStyle | 2) == 2 && [(_UIStackedImageContainerLayer *)self _isSelected])
    {
      double v16 = v16 * 1.13;
      double v17 = v17 * 1.13;
    }
    double v18 = *MEMORY[0x1E4F1DAD8];
    double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    BOOL v20 = [(_UIStackedImageContainerLayer *)self isSelected];
    configuration = self->_configuration;
    if (v20) {
      [(_UIStackedImageConfiguration *)configuration defaultSelectedShadowVerticalOffset];
    }
    else {
      [(_UIStackedImageConfiguration *)configuration defaultUnfocusedShadowVerticalOffset];
    }
    double v51 = v22;
    long long v52 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v85.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v85.m33 = v52;
    long long v81 = *(_OWORD *)&v85.m31;
    long long v82 = v52;
    long long v53 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v85.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v85.m43 = v53;
    long long v78 = *(_OWORD *)&v85.m41;
    long long v79 = v53;
    long long v54 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v80 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v85.m11 = v80;
    *(_OWORD *)&v85.m13 = v54;
    long long v76 = v54;
    long long v77 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v75 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v85.m21 = v77;
    *(_OWORD *)&v85.m23 = v75;
    *(_OWORD *)&v84.m31 = *(_OWORD *)&v85.m31;
    *(_OWORD *)&v84.m33 = v52;
    *(_OWORD *)&v84.m41 = *(_OWORD *)&v85.m41;
    *(_OWORD *)&v84.m43 = v53;
    *(_OWORD *)&v84.m11 = v80;
    *(_OWORD *)&v84.m13 = v54;
    *(_OWORD *)&v84.m21 = v77;
    *(_OWORD *)&v84.m23 = v75;
    CATransform3DTranslate(&v85, &v84, 0.0, v22, 0.0);
    unfocusedShadowLayer = self->_unfocusedShadowLayer;
    CATransform3D v84 = v85;
    [(CALayer *)unfocusedShadowLayer setTransform:&v84];
    -[CALayer setBounds:](self->_unfocusedShadowLayer, "setBounds:", v18, v19, v16, v17);
    *(_OWORD *)&v84.m31 = v81;
    *(_OWORD *)&v84.m33 = v82;
    *(_OWORD *)&v84.m41 = v78;
    *(_OWORD *)&v84.m43 = v79;
    *(_OWORD *)&v84.m11 = v80;
    *(_OWORD *)&v84.m13 = v76;
    *(_OWORD *)&v84.m21 = v77;
    *(_OWORD *)&v84.m23 = v75;
    [(_UIStackedImageConfiguration *)self->_configuration defaultFocusedShadowVerticalOffset];
    *(_OWORD *)&v83.m31 = v81;
    *(_OWORD *)&v83.m33 = v82;
    *(_OWORD *)&v83.m41 = v78;
    *(_OWORD *)&v83.m43 = v79;
    *(_OWORD *)&v83.m11 = v80;
    *(_OWORD *)&v83.m13 = v76;
    *(_OWORD *)&v83.m21 = v77;
    *(_OWORD *)&v83.m23 = v75;
    CATransform3DTranslate(&v84, &v83, 0.0, (v51 + v56) * 0.5, 0.0);
    shadowLayer = self->_shadowLayer;
    CATransform3D v83 = v84;
    [(CALayer *)shadowLayer setTransform:&v83];
    [(_UIStackedImageContainerLayer *)self _focusedShadowRadius];
    CGFloat v59 = (v58 + v58 - v14) * -0.5;
    v91.origin.double x = v18;
    v91.origin.double y = v19;
    v91.size.CGFloat width = v16;
    v91.size.CGFloat height = v17;
    CGRect v92 = CGRectInset(v91, v59, v59);
    -[CALayer setBounds:](self->_shadowLayer, "setBounds:", v92.origin.x, v92.origin.y, v92.size.width, v92.size.height);
    return;
  }
  if ([(_UIStackedImageContainerLayer *)self _isHighlighted])
  {
    [(_UIStackedImageContainerLayer *)self _focusedShadowRadius];
    double v24 = v23;
    [(_UIStackedImageContainerLayer *)self bounds];
    double scale = self->_scale;
    CGFloat v27 = v26 * scale;
    CGFloat v29 = v28 * scale;
    [(_UIStackedImageContainerLayer *)self bounds];
    v88.origin.double x = round(v31 + (v30 - v27) * 0.5);
    v88.origin.double y = round(v33 + (v32 - v29) * 0.5);
    v88.size.CGFloat width = v27;
    v88.size.CGFloat height = v29;
    CGRect v89 = CGRectInset(v88, v24 * -2.0, v24 * -2.0);
    double v34 = v89.size.width + -8.0;
    double v35 = -4.0;
  }
  else
  {
    if (![(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle])
    {
      [(_UIStackedImageContainerLayer *)self _unfocusedShadowRadius];
      CGFloat v61 = v60 * -2.0;
      v93.origin.double x = v6;
      v93.origin.double y = v8;
      v93.size.CGFloat width = v10;
      v93.size.CGFloat height = v12;
      CGRect v94 = CGRectInset(v93, v61, v61);
      double v34 = v94.size.width + -4.0;
      double v47 = v94.size.height + -2.0;
      if ((self->_selectionStyle | 2) == 2 && [(_UIStackedImageContainerLayer *)self _isSelected])
      {
        double v34 = v34 * 1.13;
        double v47 = v47 * 1.13;
      }
      goto LABEL_17;
    }
    [(_UIStackedImageContainerLayer *)self _focusedShadowRadius];
    double v37 = v36;
    [(_UIStackedImageContainerLayer *)self _scaledSizeForCurrentState];
    double v39 = v38;
    double v41 = v40;
    [(_UIStackedImageContainerLayer *)self bounds];
    v90.origin.double x = round(v43 + (v42 - v39) * 0.5);
    v90.origin.double y = round(v45 + (v44 - v41) * 0.5);
    v90.size.CGFloat width = v39;
    v90.size.CGFloat height = v41;
    CGRect v89 = CGRectInset(v90, v37 * -2.0, v37 * -2.0);
    double v34 = v46 + -12.0;
    double v35 = -6.0;
  }
  double v47 = v89.size.height + v35;
LABEL_17:
  double v48 = *MEMORY[0x1E4F1DAD8];
  double v49 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if ([(_UIStackedImageContainerLayer *)self _isHighlighted])
  {
    [(_UIStackedImageConfiguration *)self->_configuration defaultHighlightedShadowVerticalOffset];
  }
  else if ([(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle])
  {
    [(_UIStackedImageConfiguration *)self->_configuration defaultFocusedShadowVerticalOffset];
  }
  else
  {
    BOOL v62 = [(_UIStackedImageContainerLayer *)self isSelected];
    long long v63 = self->_configuration;
    if (v62) {
      [(_UIStackedImageConfiguration *)v63 defaultSelectedShadowVerticalOffset];
    }
    else {
      [(_UIStackedImageConfiguration *)v63 defaultUnfocusedShadowVerticalOffset];
    }
  }
  long long v64 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v85.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v85.m33 = v64;
  long long v65 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v85.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v85.m43 = v65;
  long long v66 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v85.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v85.m13 = v66;
  long long v67 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v85.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v85.m23 = v67;
  *(_OWORD *)&v84.m31 = *(_OWORD *)&v85.m31;
  *(_OWORD *)&v84.m33 = v64;
  *(_OWORD *)&v84.m41 = *(_OWORD *)&v85.m41;
  *(_OWORD *)&v84.m43 = v65;
  *(_OWORD *)&v84.m11 = *(_OWORD *)&v85.m11;
  *(_OWORD *)&v84.m13 = v66;
  *(_OWORD *)&v84.m21 = *(_OWORD *)&v85.m21;
  *(_OWORD *)&v84.m23 = v67;
  CATransform3DTranslate(&v85, &v84, 0.0, v50, 0.0);
  CATransform3D v68 = self->_shadowLayer;
  CATransform3D v84 = v85;
  [(CALayer *)v68 setTransform:&v84];
  -[CALayer setBounds:](self->_shadowLayer, "setBounds:", v48, v49, v34, v47);
  [(_UIStackedImageContainerLayer *)self contentsScale];
  double v70 = v69;
  if (![(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle]
    && ![(_UIStackedImageContainerLayer *)self _isHighlighted])
  {
    [(_UIStackedImageContainerLayer *)self _focusedShadowRadius];
    double v72 = v71;
    [(_UIStackedImageContainerLayer *)self _unfocusedShadowRadius];
    if (v73 > 0.0) {
      double v70 = v70 * (v72 / v73);
    }
  }
  [(CALayer *)self->_shadowLayer contentsScale];
  if (v70 != v74) {
    [(CALayer *)self->_shadowLayer setContentsScale:v70];
  }
}

- (void)_updateShadowPositionWithOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(_UIStackedImageContainerLayer *)self bounds];
  CGFloat v6 = v15.origin.x;
  CGFloat v7 = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  CGFloat v10 = CGRectGetWidth(v15) * 0.5;
  v16.origin.double x = v6;
  v16.origin.double y = v7;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v11 = x + v10;
  double v12 = y + CGRectGetHeight(v16) * 0.5;
  -[CALayer setPosition:](self->_shadowLayer, "setPosition:", v11, v12);
  unfocusedShadowLayer = self->_unfocusedShadowLayer;
  -[CALayer setPosition:](unfocusedShadowLayer, "setPosition:", v11, v12);
}

- (void)_updateShadowWithAnimationCoordinator:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_nonOpaqueShadow)
  {
    id v47 = v4;
    if ([(_UIStackedImageContainerLayer *)self _isHighlighted])
    {
      [(_UIStackedImageContainerLayer *)self _focusedShadowRadius];
      double v7 = v6;
      [(_UIStackedImageConfiguration *)self->_configuration defaultHighlightedShadowVerticalOffset];
    }
    else if ([(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle])
    {
      [(_UIStackedImageContainerLayer *)self _focusedShadowRadius];
      double v7 = v33;
      [(_UIStackedImageConfiguration *)self->_configuration defaultFocusedShadowVerticalOffset];
    }
    else if ([(_UIStackedImageContainerLayer *)self isSelected])
    {
      [(_UIStackedImageContainerLayer *)self _focusedShadowRadius];
      double v7 = v34;
      [(_UIStackedImageConfiguration *)self->_configuration defaultSelectedShadowVerticalOffset];
    }
    else
    {
      [(_UIStackedImageContainerLayer *)self _unfocusedShadowRadius];
      double v7 = v35;
      [(_UIStackedImageConfiguration *)self->_configuration defaultUnfocusedShadowVerticalOffset];
    }
    double v36 = v8;
    [(_UIStackedImageContainerLayer *)self _getShadowOpacity];
    double v38 = v37;
    double v39 = [(NSArray *)self->_imageLayers firstObject];
    [v39 setShadowRadius:v7];
    objc_msgSend(v39, "setShadowOffset:", 0.0, v36);
    *(float *)&double v38 = v38;
    LODWORD(v40) = LODWORD(v38);
    [v39 setShadowOpacity:v40];
    double v23 = self->_flatLayer;

    [(CALayer *)v23 setShadowRadius:v7];
    -[CALayer setShadowOffset:](v23, "setShadowOffset:", 0.0, v36);
    LODWORD(v41) = LODWORD(v38);
    [(CALayer *)v23 setShadowOpacity:v41];
LABEL_24:

    double v5 = v47;
    goto LABEL_25;
  }
  if (self->_shadowLayer)
  {
    id v47 = v4;
    [(_UIStackedImageContainerLayer *)self bounds];
    IsEmptdouble y = CGRectIsEmpty(v49);
    double v5 = v47;
    if (!IsEmpty)
    {
      CGFloat v10 = +[UIScreen mainScreen];
      double v11 = [v10 traitCollection];
      uint64_t v12 = [v11 userInterfaceStyle];

      [MEMORY[0x1E4F39CF8] begin];
      [(_UIStackedImageContainerLayer *)self _focusedShadowRadius];
      double v14 = v13;
      if (v12 == 1000) {
        double v15 = 1.0;
      }
      else {
        double v15 = 0.0;
      }
      if (v12 == 1000) {
        double v16 = 0.3;
      }
      else {
        double v16 = 1.0;
      }
      [(_UIStackedImageContainerLayer *)self contentsScale];
      double v18 = v17;
      [(_UIStackedImageConfiguration *)self->_configuration cornerRadius];
      double v19 = v14 * v18;
      double v21 = v18 * v20;
      [(_UIStackedImageConfiguration *)self->_configuration isContinuousCornerRadiusEnabled];
      CachedShadowContents(v22 != 0.0, v19, v21, v15, v16);
      double v23 = (CALayer *)objc_claimAutoreleasedReturnValue();
      double v24 = [(CALayer *)self->_shadowLayer contents];

      if (v24 != v23)
      {
        [(CALayer *)self->_shadowLayer setContents:v23];
        -[CALayer setContentsCenter:](self->_shadowLayer, "setContentsCenter:", 0.5, 0.5, 0.0, 0.0);
      }
      [(_UIStackedImageContainerLayer *)self _unfocusedShadowRadius];
      double v26 = v18 * v25;
      [(_UIStackedImageConfiguration *)self->_configuration isContinuousCornerRadiusEnabled];
      double v28 = CachedShadowContents(v27 != 0.0, v26, v21, v15, v16);
      CGFloat v29 = [(CALayer *)self->_unfocusedShadowLayer contents];

      if (v29 != v28)
      {
        [(CALayer *)self->_unfocusedShadowLayer setContents:v28];
        -[CALayer setContentsCenter:](self->_unfocusedShadowLayer, "setContentsCenter:", 0.5, 0.5, 0.0, 0.0);
      }
      [(_UIStackedImageContainerLayer *)self _updateShadowBounds];
      double v30 = (void *)MEMORY[0x1E4F39CF8];
      double v31 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
      [v30 setAnimationTimingFunction:v31];

      if ([(_UIStackedImageContainerLayer *)self _isHighlighted]) {
        char v32 = 0;
      }
      else {
        char v32 = ![(_UIStackedImageContainerLayer *)self _isFocusedOrFocusedIdle];
      }
      BOOL v42 = [(_UIStackedImageConfiguration *)self->_configuration useSeparateUnfocusedShadowImage];
      shadowLayer = self->_shadowLayer;
      if (v42 && (v32 & 1) != 0)
      {
        [(CALayer *)self->_shadowLayer setOpacity:0.0];
        unfocusedShadowLayer = self->_unfocusedShadowLayer;
        [(_UIStackedImageContainerLayer *)self _getShadowOpacity];
        *(float *)&double v45 = v45;
      }
      else
      {
        [(_UIStackedImageContainerLayer *)self _getShadowOpacity];
        *(float *)&double v46 = v46;
        [(CALayer *)shadowLayer setOpacity:v46];
        unfocusedShadowLayer = self->_unfocusedShadowLayer;
        double v45 = 0.0;
      }
      [(CALayer *)unfocusedShadowLayer setOpacity:v45];
      [MEMORY[0x1E4F39CF8] commit];

      goto LABEL_24;
    }
  }
LABEL_25:
}

- (_UIStackedImageConfiguration)configuration
{
  return self->_configuration;
}

- (UINamedLayerStack)layerStack
{
  return self->_layerStack;
}

- (unint64_t)controlState
{
  return self->_controlState;
}

- (CGPoint)focusDirection
{
  double x = self->_focusDirection.x;
  double y = self->_focusDirection.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerStack, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_layoutDelegate, 0);
  objc_storeStrong((id *)&self->_frontmostRotationTransformLayer, 0);
  objc_storeStrong((id *)&self->_frontmostPerspectiveTransformLayer, 0);
  objc_storeStrong((id *)&self->_cursorRotationTransformLayer, 0);
  objc_storeStrong((id *)&self->_unmaskedOverlayRotationTransformLayer, 0);
  objc_storeStrong((id *)&self->_unmaskedOverlayPerspectiveTransformLayer, 0);
  objc_storeStrong((id *)&self->_maskRotationTransformLayer, 0);
  objc_storeStrong((id *)&self->_maskPerspectiveTransformLayer, 0);
  objc_storeStrong((id *)&self->_imageRotationTransformLayer, 0);
  objc_storeStrong((id *)&self->_imagePerspectiveTransformLayer, 0);
  objc_storeStrong((id *)&self->_unmaskedOverlayContainerLayer, 0);
  objc_storeStrong((id *)&self->_unmaskedOverlayLayer, 0);
  objc_storeStrong((id *)&self->_overlayContainerLayer, 0);
  objc_storeStrong((id *)&self->_overlayLayer, 0);
  objc_storeStrong((id *)&self->_focusKeylineStrokeLayer, 0);
  objc_storeStrong((id *)&self->_cursorLayerContainer, 0);
  objc_storeStrong((id *)&self->_cursorLayer, 0);
  objc_storeStrong((id *)&self->_specularLayer, 0);
  objc_storeStrong((id *)&self->_unfocusedShadowLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_selectedPlaceholderLayer, 0);
  objc_storeStrong((id *)&self->_radiosityLayer, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_flatLayer, 0);
  objc_storeStrong((id *)&self->_imageLayers, 0);
  objc_storeStrong((id *)&self->_imageLayersContainer, 0);
  objc_storeStrong((id *)&self->_parallaxLayerDepths, 0);
  objc_storeStrong((id *)&self->_parallaxImages, 0);
  objc_storeStrong(&self->_flatImage, 0);
  objc_storeStrong((id *)&self->_imageStackContentsGravity, 0);
}

@end