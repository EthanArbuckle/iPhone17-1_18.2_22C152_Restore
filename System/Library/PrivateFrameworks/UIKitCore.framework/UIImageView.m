@interface UIImageView
- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)_animatesContents;
- (BOOL)_canDrawContent;
- (BOOL)_displayImageAsLayered:(id)a3;
- (BOOL)_getDrawModeCompositeOperation:(int *)a3 whiteComponent:(double *)a4 drawingAlpha:(double *)a5;
- (BOOL)_getDrawModeCompositeOperation:(int *)a3 whiteComponent:(double *)a4 drawingAlpha:(double *)a5 forDrawMode:(unsigned int)a6;
- (BOOL)_guardAgainstDegenerateBaselineCalculation;
- (BOOL)_hasBaseline;
- (BOOL)_hasContentGravity;
- (BOOL)_hasInstalledContentsAnimation;
- (BOOL)_hasNonDefaultSymbolAnimatorState;
- (BOOL)_hasReasonToUseRBSymbolLayerForImage:(id)a3;
- (BOOL)_imageSupportsMaterials:(id)a3 symbolConfiguration:(id)a4;
- (BOOL)_isHasBaselinePropertyChangeable;
- (BOOL)_layoutShouldFlipHorizontalOrientations;
- (BOOL)_masksTemplateImages;
- (BOOL)_needsBoldEffectForImage:(id)a3 symbolConfiguration:(id)a4;
- (BOOL)_needsBoldEffectForImage:(id)a3 symbolConfiguration:(id)a4 withBaseColor:(id)a5 withEffects:(id)a6;
- (BOOL)_needsImageEffectsForImage:(id)a3;
- (BOOL)_needsImageEffectsForImage:(id)a3 symbolConfiguration:(id)a4;
- (BOOL)_overrideTintColorAutomaticallyOverridesTintColor;
- (BOOL)_recomputePretilingState;
- (BOOL)_resolveImagesWithPreviouslyDisplayedImage:(id)a3;
- (BOOL)_setImageViewContents:(id)a3;
- (BOOL)_setImageViewContentsForAnimatedImage:(id)a3;
- (BOOL)_setImageViewContentsForCIImageBackedImage:(id)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_shouldInvalidateBaselineConstraintsForSize:(CGSize)a3 oldSize:(CGSize)a4;
- (BOOL)_shouldTreatImageAsTemplate:(id)a3;
- (BOOL)_shouldTreatImageAsTemplate:(id)a3 symbolConfiguration:(id)a4;
- (BOOL)_supportsContents;
- (BOOL)_suppressPixelAlignment;
- (BOOL)_usesRenderBoxToRenderImage:(id)a3 withLayout:(id)a4;
- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory;
- (BOOL)adjustsImageWhenAncestorFocused;
- (BOOL)isAccessibilityElementByDefault;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isHighlighted;
- (BOOL)isTransparentFocusItem;
- (BOOL)masksFocusEffectToContents;
- (BOOL)scalesLargeContentImage;
- (BOOL)useBlockyMagnificationInClassic;
- (CGImage)imageRef;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (Class)_intelligenceBaseClass;
- (NSArray)animationImages;
- (NSArray)highlightedAnimationImages;
- (NSInteger)animationRepeatCount;
- (NSString)description;
- (NSTimeInterval)animationDuration;
- (RBSymbolLayer)_rbSymbolLayer;
- (UIEdgeInsets)_additionalAlignmentRectInsetsForRenderingSource:(id)a3;
- (UIEdgeInsets)_edgeInsetsForEffects;
- (UIEdgeInsets)_edgeInsetsForEffectsForImage:(id)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImage)highlightedImage;
- (UIImage)image;
- (UIImageDynamicRange)imageDynamicRange;
- (UIImageDynamicRange)preferredImageDynamicRange;
- (UIImageSymbolConfiguration)_overridingSymbolConfiguration;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (UIImageView)initWithCoder:(id)a3;
- (UIImageView)initWithFrame:(CGRect)a3;
- (UIImageView)initWithImage:(UIImage *)image;
- (UIImageView)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage;
- (UILayoutGuide)focusedFrameGuide;
- (UILayoutGuide)imageContentGuide;
- (UIView)_placeholderView;
- (UIView)_symbolContentTransitionContainerView;
- (UIView)overlayContentView;
- (_UIImageLoader)_imageLoader;
- (_UIImageSymbolVariant)_preferredSymbolVariant;
- (_UIStackedImageContainerView)_layeredImageContainer;
- (double)_baselineOffsetFromBottom;
- (double)_firstBaselineOffsetFromTop;
- (double)_layeredImageCornerRadius;
- (double)_maximumEDRForDynamicRange:(int64_t)a3;
- (double)_scaleFactorForImage;
- (double)preferredContentScaleFactor;
- (id)_activeImage;
- (id)_adaptiveImageForImage:(id)a3 assignedImage:(id)a4 currentImage:(id)a5 hasAdapted:(BOOL *)a6;
- (id)_applyImageEffectsToCIImage:(id)a3 multiplyColor:(id)a4;
- (id)_baseMultiplyColorWithImage:(id)a3 symbolConfiguration:(id)a4;
- (id)_baseMultiplyColorWithImage:(id)a3 symbolConfiguration:(id)a4 shouldResolveDynamicColors:(BOOL)a5;
- (id)_cachedPretiledImageForImage:(id)a3;
- (id)_checkHighlightedImageForAdaptation:(id)a3 hadAdapted:(BOOL *)a4;
- (id)_checkImageForAdaptation:(id)a3 hasAdapted:(BOOL *)a4;
- (id)_colorByApplyingDrawMode:(unsigned int)a3 toColor:(id)a4;
- (id)_colorByApplyingDrawModeToColor:(id)a3;
- (id)_currentAnimationKeyframeImage;
- (id)_currentHighlightedImage;
- (id)_currentImage;
- (id)_decompressingImageForType:(unint64_t)a3;
- (id)_effectiveContentEffectsWithImage:(id)a3 symbolConfiguration:(id)a4;
- (id)_effectiveImageViewTraitCollectionForResolvingImages;
- (id)_effectiveSymbolContentTransitionContainerView;
- (id)_existingOverlayView;
- (id)_imageContentGuideAllowingCreation:(BOOL)a3;
- (id)_initialValueForKey:(id)a3;
- (id)_layoutForImage:(id)a3 inSize:(CGSize)a4;
- (id)_layoutForImage:(id)a3 inSize:(CGSize)a4 cachePerSize:(BOOL)a5 forBaselineOffset:(BOOL)a6;
- (id)_materialForImage:(id)a3 symbolConfiguration:(id)a4;
- (id)_renditionForSource:(id)a3 size:(CGSize)a4 symbolConfiguration:(id)a5 withRenditionResult:(id)a6;
- (id)_resolvedImageFromImage:(id)a3;
- (id)_resolvedImageFromImage:(void *)a3 withImageViewTrait:;
- (id)_symbolConfigurationForImage:(id)a3;
- (id)largeContentImage;
- (id)midlineGuide;
- (int64_t)_defaultRenderingMode;
- (int64_t)_effectiveRenderingModeForSource:(id)a3 symbolConfiguration:(id)a4;
- (int64_t)_preferredVibrancy;
- (unint64_t)defaultAccessibilityTraits;
- (unsigned)drawMode;
- (void)_addSymbolEffect:(id)a3;
- (void)_addSymbolEffect:(id)a3 animated:(BOOL)a4;
- (void)_ancestorWillUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)_applyEffectsFromLayout:(id)a3;
- (void)_applyImageLayout:(id)a3 toLayer:(id)a4;
- (void)_applySettingsForLegibilityStyle:(int64_t)a3;
- (void)_baselineOffsetParametersDidChangeHasBaselinePropertyChanged:(BOOL)a3;
- (void)_cleanUpForStopAnimating;
- (void)_clearPretiledImageCacheForImage:(id)a3;
- (void)_decodeQ_imageLoader:(id)a3 decodeImage:(id)a4 layout:(id)a5;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_didStopBeingDisplayedInPointerContentEffect;
- (void)_generateDeferredAnimations:(id)a3;
- (void)_imageContentParametersDidChange;
- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4;
- (void)_invalidateImageLayouts;
- (void)_invalidateResolvedImages;
- (void)_invalidateTemplateSettings;
- (void)_kickoffQ_beginLoadingWithImageLoader:(id)a3;
- (void)_loadImage:(id)a3 delegate:(id)a4;
- (void)_loadImageWithURL:(id)a3;
- (void)_mainQ_beginLoadingIfApplicable;
- (void)_mainQ_imageLoader:(id)a3 finishedOrSkippedDecodingImage:(id)a4 layout:(id)a5;
- (void)_mainQ_imageLoader:(id)a3 finishedWithImage:(id)a4 error:(id)a5;
- (void)_mainQ_resetForLoader:(id)a3 delegate:(id)a4;
- (void)_removeAllSymbolEffects;
- (void)_removeAllSymbolEffectsAnimated:(BOOL)a3;
- (void)_removeLayerAnimations;
- (void)_removeSymbolEffect:(id)a3;
- (void)_removeSymbolEffect:(id)a3 animated:(BOOL)a4;
- (void)_renderDrawModeEffectInRect:(CGRect)a3;
- (void)_setAnimatesContents:(BOOL)a3;
- (void)_setDecompressingImage:(id)a3 forType:(unint64_t)a4;
- (void)_setDefaultRenderingMode:(int64_t)a3;
- (void)_setGuardAgainstDegenerateBaselineCalculation:(BOOL)a3;
- (void)_setImage:(id)a3 invalidatingPendingSymbolTransitions:(BOOL)a4;
- (void)_setLayerAllowsEdgeAntialiasing:(BOOL)a3;
- (void)_setLayeredImageContainer:(id)a3;
- (void)_setLayeredImageCornerRadius:(double)a3;
- (void)_setMasksTemplateImages:(BOOL)a3;
- (void)_setNeedsUpdateState;
- (void)_setOverlayContentView:(id)a3;
- (void)_setOverridingSymbolConfiguration:(id)a3;
- (void)_setPlaceholderView:(id)a3;
- (void)_setPreferredSymbolVariant:(id)a3;
- (void)_setPreferredVibrancy:(int64_t)a3;
- (void)_setRBSymbolLayer:(id)a3;
- (void)_setSymbolContentTransitionContainerView:(id)a3;
- (void)_setSymbolImage:(id)a3 withSymbolTransition:(id)a4;
- (void)_setViewGeometry:(CGRect)a3 forMetric:(int)a4;
- (void)_setupRBSymbolLayerWithSymbolImageLayout:(id)a3;
- (void)_setupSymbolLayerForCurrentSymbolImageLayout:(id)a3;
- (void)_stopLoading;
- (void)_teardownLayeredImage;
- (void)_teardownRBSymbolLayerIfNeeded;
- (void)_templateSettingsDidChange;
- (void)_updateHDRFlags:(BOOL)a3;
- (void)_updateImageViewForOldImage:(id)a3 newImage:(id)a4;
- (void)_updateLayeredImageIsFocusedWithFocusedView:(id)a3 focusAnimationCoordinator:(id)a4;
- (void)_updateMasking;
- (void)_updatePretiledImageCacheForImage:(id)a3;
- (void)_updateRBSymbolLayerPositionIfNeededForContentTransitionPendingLayoutPass;
- (void)_updateResolvedImages;
- (void)_updateState;
- (void)_updateStateIfRBSymbolLayerNoLongerNeeded;
- (void)_updateVisibilityAndFrameOfPlaceholderView;
- (void)_willBeginBeingDisplayedInPointerContentEffect;
- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect;
- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options;
- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated;
- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated completion:(UISymbolEffectCompletion)completionHandler;
- (void)animationPresetManager:(id)a3 didActivateEffect:(id)a4 options:(id)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)animationPresetManager:(id)a3 didDiscardPendingContentTransition:(id)a4;
- (void)animationPresetManager:(id)a3 didRemoveEffect:(id)a4 options:(id)a5 animated:(BOOL)a6 completion:(id)a7 wasActive:(BOOL)a8;
- (void)animationPresetManager:(id)a3 didSetHiddenness:(BOOL)a4 usingEffect:(id)a5 options:(id)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)animationPresetManager:(id)a3 didSetScale:(int)a4 usingEffect:(id)a5 options:(id)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)removeAllSymbolEffects;
- (void)removeAllSymbolEffectsWithOptions:(NSSymbolEffectOptions *)options;
- (void)removeAllSymbolEffectsWithOptions:(NSSymbolEffectOptions *)options animated:(BOOL)animated;
- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect;
- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options;
- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated;
- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated completion:(UISymbolEffectCompletion)completionHandler;
- (void)setAdjustsImageSizeForAccessibilityContentSizeCategory:(BOOL)a3;
- (void)setAdjustsImageWhenAncestorFocused:(BOOL)adjustsImageWhenAncestorFocused;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimationDuration:(NSTimeInterval)animationDuration;
- (void)setAnimationImages:(NSArray *)animationImages;
- (void)setAnimationRepeatCount:(NSInteger)animationRepeatCount;
- (void)setBackgroundColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCGImageRef:(CGImage *)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setContentScaleFactor:(double)a3;
- (void)setDrawMode:(unsigned int)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHighlighted:(BOOL)highlighted;
- (void)setHighlightedAnimationImages:(NSArray *)highlightedAnimationImages;
- (void)setHighlightedImage:(UIImage *)highlightedImage;
- (void)setImage:(UIImage *)image;
- (void)setMasksFocusEffectToContents:(BOOL)masksFocusEffectToContents;
- (void)setPreferredImageDynamicRange:(UIImageDynamicRange)preferredImageDynamicRange;
- (void)setPreferredSymbolConfiguration:(UIImageSymbolConfiguration *)preferredSymbolConfiguration;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition;
- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition options:(NSSymbolEffectOptions *)options;
- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition options:(NSSymbolEffectOptions *)options completion:(UISymbolEffectCompletion)completionHandler;
- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UIImageView

- (BOOL)_shouldInvalidateBaselineConstraintsForSize:(CGSize)a3 oldSize:(CGSize)a4
{
  return 0;
}

- (BOOL)_canDrawContent
{
  unsigned int imageViewFlags = self->_imageViewFlags;
  if ((imageViewFlags & 1) == 0)
  {
    v4 = self;
    if ((unint64_t)[(UIView *)v4 contentMode] >= UIViewContentModeCenter)
    {
LABEL_18:

      __int16 v12 = (__int16)self->_imageViewFlags;
LABEL_19:
      int v15 = 1;
LABEL_20:
      unsigned int imageViewFlags = v15 | v12 & 0xFFFC;
      *(_WORD *)&self->_unsigned int imageViewFlags = imageViewFlags;
      return (imageViewFlags >> 1) & 1;
    }
    v5 = [(UIImageView *)v4 _currentImage];
    if ([(UIImageView *)v4 isHighlighted])
    {
      if (!v5) {
        goto LABEL_13;
      }
      id v6 = v5;
      v7 = [v6 CIImage];

      if (!v7)
      {

        goto LABEL_13;
      }
      int v8 = [v6 _representsCIImageWhichSupportsIOSurfaceRendering];

      if (v8)
      {
LABEL_13:
        v13 = [(UIImageView *)v4 _currentHighlightedImage];
        id v9 = v13;
        if (v13)
        {
          v14 = [v13 CIImage];

          if (!v14 || [v9 _representsCIImageWhichSupportsIOSurfaceRendering]) {
            goto LABEL_16;
          }
        }

        __int16 v12 = (__int16)self->_imageViewFlags;
        if (!v9) {
          goto LABEL_19;
        }
LABEL_23:
        int v15 = 3;
        goto LABEL_20;
      }
    }
    else
    {
      if (!v5) {
        goto LABEL_17;
      }
      id v9 = v5;
      v10 = [v9 CIImage];

      if (!v10)
      {
LABEL_16:

        goto LABEL_17;
      }
      char v11 = [v9 _representsCIImageWhichSupportsIOSurfaceRendering];

      if (v11)
      {
LABEL_17:

        goto LABEL_18;
      }
    }

    __int16 v12 = (__int16)self->_imageViewFlags;
    goto LABEL_23;
  }
  return (imageViewFlags >> 1) & 1;
}

- (BOOL)_overrideTintColorAutomaticallyOverridesTintColor
{
  return 0;
}

- (id)_resolvedImageFromImage:(void *)a3 withImageViewTrait:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    id v7 = v5;
    id v8 = a3;
    if ([v7 _isSymbolImage]) {
      [a1 _symbolConfigurationForImage:v7];
    }
    else {
    id v9 = [v7 configuration];
    }
    id v10 = v8;
    char v11 = [v9 _effectiveTraitCollectionForImageLookup];
    __int16 v12 = v10;
    if (v11)
    {
      __int16 v12 = -[UITraitCollection _traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection:](v10, (uint64_t)v11);
    }
    v13 = [v9 configurationWithTraitCollection:v12];

    id v14 = v7;
    int v15 = (void *)_UISetCurrentFallbackEnvironment(a1);
    v16 = [a1 _preferredSymbolVariant];

    if (v16)
    {
      v17 = [a1 _preferredSymbolVariant];
      uint64_t v18 = [v14 _imageByApplyingSymbolVariant:v17];

      id v14 = (id)v18;
    }
    a1 = [v14 imageWithConfiguration:v13];

    _UIRestorePreviousFallbackEnvironment(v15);
  }

  return a1;
}

- (BOOL)_shouldTreatImageAsTemplate:(id)a3
{
  id v4 = a3;
  id v5 = [(UIImageView *)self _symbolConfigurationForImage:v4];
  LOBYTE(self) = [(UIImageView *)self _shouldTreatImageAsTemplate:v4 symbolConfiguration:v5];

  return (char)self;
}

- (id)_baseMultiplyColorWithImage:(id)a3 symbolConfiguration:(id)a4 shouldResolveDynamicColors:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if ([(UIImageView *)self _shouldTreatImageAsTemplate:a3 symbolConfiguration:v8])
  {
    if ([v8 _hasSpecifiedPaletteColors])
    {
      id v9 = [v8 _paletteColorsWithEffect:self shouldResolveDynamicColors:v5];
      id v10 = [v9 firstObject];
    }
    else if ([v8 _hasSpecifiedHierarchicalColors])
    {
      id v10 = [v8 _hierarchicalColorForLayerLevel:0 effect:self shouldResolveDynamicColors:v5];
    }
    else
    {
      id v10 = [(UIView *)self tintColor];
      if (v5)
      {
        __int16 v12 = [(UIView *)self traitCollection];
        uint64_t v13 = [v10 resolvedColorWithTraitCollection:v12];

        id v10 = (void *)v13;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldTreatImageAsTemplate:(id)a3 symbolConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[UIImageView _effectiveRenderingModeForSource:symbolConfiguration:](self, "_effectiveRenderingModeForSource:symbolConfiguration:", v6, v7) != 2|| [v7 _hasSpecifiedHierarchicalColors]&& (objc_msgSend(v6, "_isHierarchicalColorSymbolImage") & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else if ([v7 _hasSpecifiedPaletteColors])
  {
    id v9 = [v7 _colors];
    if ((unint64_t)[v9 count] < 2) {
      LOBYTE(v8) = 1;
    }
    else {
      int v8 = [v6 _isPaletteColorSymbolImage] ^ 1;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (UIEdgeInsets)_additionalAlignmentRectInsetsForRenderingSource:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [(UIImageView *)self _edgeInsetsForEffectsForImage:v4];
    double v5 = v9;
    double v6 = v10;
    double v7 = v11;
    double v8 = v12;
  }

  double v13 = v5;
  double v14 = v6;
  double v15 = v7;
  double v16 = v8;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)_edgeInsetsForEffectsForImage:(id)a3
{
  id v4 = a3;
  double v5 = [(UIImageView *)self _symbolConfigurationForImage:v4];
  if ([(UIImageView *)self _needsBoldEffectForImage:v4 symbolConfiguration:v5])
  {
    double v6 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:@"_UIKitBoldTintStyle"];
  }
  else
  {
    double v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [v4 scale];
  double v8 = v7;
  double v9 = [(UIView *)self traitCollection];
  +[UIImage _edgeInsetsForStylePresetNames:v6 scale:v9 traitCollection:v8];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (int64_t)_effectiveRenderingModeForSource:(id)a3 symbolConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [v6 renderingMode];
  if (!v8)
  {
    int64_t v8 = [(UIImageView *)self _defaultRenderingMode];
    if (!v8) {
      int64_t v8 = [v6 _effectiveRenderingModeWithSymbolConfiguration:v7];
    }
  }

  return v8;
}

- (int64_t)_defaultRenderingMode
{
  return [(_UIImageViewStorage *)self->_storage defaultRenderingMode];
}

- (id)_symbolConfigurationForImage:(id)a3
{
  id v4 = a3;
  double v5 = +[UIImageSymbolConfiguration unspecifiedConfiguration];
  uint64_t v6 = [v4 _automaticSymbolConfiguration];
  id v7 = (void *)v6;
  if (v6) {
    int64_t v8 = (void *)v6;
  }
  else {
    int64_t v8 = v5;
  }
  id v9 = v8;

  uint64_t v10 = [(UIImageView *)self preferredSymbolConfiguration];
  double v11 = (void *)v10;
  if (v10) {
    double v12 = (void *)v10;
  }
  else {
    double v12 = v5;
  }
  id v13 = v12;

  uint64_t v14 = [(UIImageView *)self _overridingSymbolConfiguration];
  double v15 = (void *)v14;
  if (v14) {
    double v16 = (void *)v14;
  }
  else {
    double v16 = v5;
  }
  id v17 = v16;

  double v18 = [v9 configurationByApplyingConfiguration:v13];
  double v19 = [v4 symbolConfiguration];

  double v20 = [v18 configurationByApplyingConfiguration:v19];

  double v21 = [v20 configurationByApplyingConfiguration:v17];

  v22 = -[UIImageView _effectiveImageViewTraitCollectionForResolvingImages](self);
  v23 = [v22 imageConfiguration];
  v24 = [v21 configurationByApplyingConfiguration:v23];

  return v24;
}

- (id)_effectiveImageViewTraitCollectionForResolvingImages
{
  id v1 = a1;
  if (a1)
  {
    v2 = [a1 traitCollection];
    if (!v2)
    {
      if (dyld_program_sdk_at_least())
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"BUG IN CLIENT: UIImageView trait collection unexpectedly found nil. Did you override traitCollection to return nil? That's illegal. imageView = %@", v1 format];
        v2 = 0;
      }
      else
      {
        v3 = +[UIScreen mainScreen];
        v2 = [v3 traitCollection];
      }
    }
    objc_msgSend(v2, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", objc_msgSend(v1, "effectiveUserInterfaceLayoutDirection"), 0x1ED3F5A60);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (UIImageSymbolConfiguration)_overridingSymbolConfiguration
{
  return [(_UIImageViewStorage *)self->_storage overridingSymbolConfiguration];
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return [(_UIImageViewStorage *)self->_storage preferredSymbolConfiguration];
}

- (_UIImageSymbolVariant)_preferredSymbolVariant
{
  return [(_UIImageViewStorage *)self->_storage preferredSymbolVariant];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([(UIImageView *)self _animatesContents]
    && ([v4 isEqualToString:@"contents"] & 1) != 0
    || ([v4 isEqualToString:@"contentsTransform"] & 1) != 0
    || (self, dyld_program_sdk_at_least())
    && ([v4 isEqualToString:@"contentsMaximumDesiredEDR"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIImageView;
    BOOL v5 = [(UIView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (BOOL)_animatesContents
{
  return self->__animatesContents;
}

uint64_t __52__UIImageView__updateImageViewForOldImage_newImage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState];
}

uint64_t __120__UIImageView_UIAccessibilityContentSizeCategoryImageAdjusting__setAdjustsImageSizeForAccessibilityContentSizeCategory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sizeToFit];
}

- (void)setBounds:(CGRect)a3
{
}

- (void)setCenter:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIImageView;
  -[UIView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  [(UIImageView *)self _updateRBSymbolLayerPositionIfNeededForContentTransitionPendingLayoutPass];
}

- (void)_applyEffectsFromLayout:(id)a3
{
  id v15 = a3;
  objc_super v4 = [v15 contentEffects];
  [(UIView *)self mt_setContentEffects:v4];
  BOOL v5 = [v15 contentsMultiplyColor];
  uint64_t v6 = [(UIView *)self _overrideTintColor];
  objc_super v7 = v6;
  if (v6)
  {
    id v8 = v6;

    BOOL v5 = v8;
  }
  uint64_t v9 = [v15 contentDrawMode];
  if (v9)
  {
    uint64_t v10 = v9;
    if (!v5)
    {
      BOOL v5 = +[UIColor clearColor];
    }
    uint64_t v11 = [(UIImageView *)self _colorByApplyingDrawMode:v10 toColor:v5];

    BOOL v5 = (void *)v11;
  }
  double v12 = [(UIView *)self layer];
  if (v5 && ![(UIImageView *)self isAnimating])
  {
    uint64_t v13 = [v5 CGColor];
    uint64_t v14 = (void *)MEMORY[0x1E4F3A420];
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = (void *)MEMORY[0x1E4F3A428];
  }
  [v12 setContentsMultiplyColor:v13];
  [v12 setContentsSwizzle:*v14];
}

- (void)_updateHDRFlags:(BOOL)a3
{
  BOOL v3 = a3;
  self;
  if (dyld_program_sdk_at_least())
  {
    if (v3) {
      UIImageDynamicRange v5 = [(UIImageView *)self imageDynamicRange];
    }
    else {
      UIImageDynamicRange v5 = UIImageDynamicRangeStandard;
    }
    uint64_t v6 = [(UIView *)self layer];
    [v6 setWantsExtendedDynamicRangeContent:v5 != UIImageDynamicRangeStandard];

    [(UIImageView *)self _maximumEDRForDynamicRange:v5];
    double v8 = v7;
    id v9 = [(UIView *)self layer];
    [v9 setContentsMaximumDesiredEDR:v8];
  }
}

- (double)_maximumEDRForDynamicRange:(int64_t)a3
{
  if (a3 == 2)
  {
    double v8 = [(UIImageView *)self _currentImage];
    id v9 = [v8 content];
    [v9 imageMaximumHeadroom];
    double v7 = v10;

    double result = 8.0;
  }
  else
  {
    double result = 1.0;
    if (a3 != 1) {
      return result;
    }
    objc_super v4 = [(UIImageView *)self _currentImage];
    UIImageDynamicRange v5 = [v4 content];
    [v5 imageMaximumHeadroom];
    double v7 = v6;

    double result = 2.0;
  }
  if (v7 <= result) {
    return v7;
  }
  return result;
}

- (void)_updateState
{
  *(_WORD *)&self->_imageViewFlags &= ~4u;
  if ((*(void *)&self->super._viewFlags & 0x1000) != 0) {
    return;
  }
  if ([(UIImageView *)self _canDrawContent])
  {
    [(UIView *)self setNeedsDisplay];
    uint64_t v3 = 0;
LABEL_4:
    [(UIImageView *)self _updateHDRFlags:v3];
    return;
  }
  [(UIImageView *)self _invalidateImageLayouts];
  id v18 = [(UIImageView *)self _currentImage];
  if ([(UIImageView *)self isHighlighted])
  {
    objc_super v4 = [(UIImageView *)self _currentHighlightedImage];
  }
  else
  {
    objc_super v4 = 0;
  }
  if ([(UIImageView *)self isHighlighted] && ([(UIImageView *)self isAnimating] || !v4))
  {
    UIImageDynamicRange v5 = [(UIImageView *)self highlightedAnimationImages];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      double v7 = [(UIImageView *)self highlightedAnimationImages];
LABEL_19:
      double v10 = v7;
      uint64_t v11 = [v7 objectAtIndex:0];
      _setContentStretchForImage(self, v11);

      goto LABEL_20;
    }
  }
  if ([(UIImageView *)self isAnimating] || !v18)
  {
    double v8 = [(UIImageView *)self animationImages];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      double v7 = [(UIImageView *)self animationImages];
      goto LABEL_19;
    }
  }
LABEL_20:
  if (![(UIImageView *)self isAnimating])
  {
    if ([(UIImageView *)self isHighlighted])
    {
      if (v4) {
        double v12 = v4;
      }
      else {
        double v12 = v18;
      }
      id v13 = v12;
      BOOL v14 = [(UIImageView *)self _setImageViewContents:v13];
      if (v14) {
        uint64_t v3 = [v13 isHighDynamicRange];
      }
      else {
        uint64_t v3 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
      uint64_t v3 = 0;
    }
    BOOL v15 = [(UIImageView *)self _displayImageAsLayered:v18];
    char v16 = v15;
    if (v14 || v15)
    {
      if (!v15) {
        goto LABEL_39;
      }
      [(UIImageView *)self _configureForLayeredImage:v18];
    }
    else
    {
      [(UIImageView *)self _setImageViewContents:v18];
      uint64_t v3 = [v18 isHighDynamicRange];
    }
    BOOL v14 = 1;
LABEL_39:
    id v17 = [(UIImageView *)self _layeredImageContainer];
    if (!v17) {
      char v16 = 1;
    }

    if (v16)
    {

      if (!v14) {
        return;
      }
    }
    else
    {
      [(UIImageView *)self _teardownLayeredImage];

      if (!v14) {
        return;
      }
    }
    goto LABEL_4;
  }
}

- (id)_activeImage
{
  if (![(UIImageView *)self isHighlighted]
    || ([(UIImageView *)self _currentHighlightedImage],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v3 = [(UIImageView *)self _currentImage];
  }
  return v3;
}

- (BOOL)isHighlighted
{
  return [(_UIImageViewStorage *)self->_storage isHighlighted];
}

- (BOOL)_hasInstalledContentsAnimation
{
  uint64_t v3 = [(UIView *)self layer];
  objc_super v4 = [v3 animationForKey:@"contents"];

  UIImageDynamicRange v5 = [v4 delegate];
  BOOL v6 = 0;
  if (v4 && v5) {
    BOOL v6 = v5 == self->_storage;
  }

  return v6;
}

- (_UIStackedImageContainerView)_layeredImageContainer
{
  return (_UIStackedImageContainerView *)objc_getAssociatedObject(self, &layeredImageContainerKey);
}

- (void)_setLayerAllowsEdgeAntialiasing:(BOOL)a3
{
  BOOL v3 = a3;
  UIImageDynamicRange v5 = [(UIView *)self layer];
  int v6 = [v5 allowsEdgeAntialiasing] ^ ((*(_WORD *)&self->_imageViewFlags & 0x80) == 0);

  __int16 imageViewFlags = (__int16)self->_imageViewFlags;
  if (!v6) {
    imageViewFlags |= 0x100u;
  }
  if (v3) {
    __int16 v8 = 128;
  }
  else {
    __int16 v8 = 0;
  }
  *(_WORD *)&self->___int16 imageViewFlags = imageViewFlags & 0xFF7F | v8;
  if ((imageViewFlags & 0x100) == 0)
  {
    id v9 = [(UIView *)self layer];
    [v9 setAllowsEdgeAntialiasing:v3];
  }
}

- (BOOL)_displayImageAsLayered:(id)a3
{
  return 0;
}

- (BOOL)_setImageViewContents:(id)a3
{
  id v4 = a3;
  UIImageDynamicRange v5 = [(UIView *)self layer];
  [v5 removeAnimationForKey:@"UIImageAnimationContents"];
  [v5 removeAnimationForKey:@"UIImageAnimationContentsTransform"];
  [v5 removeAnimationForKey:@"UIImageAnimationContentsMultiplyColor"];
  [v5 setContentsAlignsToPixels:0];
  [(UIImageView *)self _setLayerAllowsEdgeAntialiasing:0];
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      v31 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v31, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
  }
  else if (!self)
  {
    v32 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setImageViewContents____s_category) + 8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", v33, 2u);
    }
  }
  int v6 = +[UITraitCollection _currentTraitCollectionIfExists]();
  double v7 = [(UIView *)self traitCollection];
  +[UITraitCollection setCurrentTraitCollection:v7];

  __int16 v8 = (void *)_UISetCurrentFallbackEnvironment(self);
  [v4 size];
  if (v4 && v9 > 0.0)
  {
    double v11 = v10;
    BOOL v12 = v10 > 0.0;
    if ([(UIView *)self contentMode] >= UIViewContentModeCenter)
    {
      if (v11 > 0.0)
      {
        BOOL v13 = 0;
        goto LABEL_15;
      }
LABEL_28:
      [v5 setContents:0];
      goto LABEL_31;
    }
  }
  else
  {
    if ([(UIView *)self contentMode] > UIViewContentModeRedraw) {
      goto LABEL_28;
    }
    BOOL v12 = 0;
  }
  [(UIView *)self bounds];
  BOOL v16 = v15 > 0.0 && v14 > 0.0;
  BOOL v13 = v12 && !v16;
  if (!v12 || !v16)
  {
    [v5 setContents:0];
    goto LABEL_30;
  }
LABEL_15:
  if ([v4 _representsCIImageWhichSupportsIOSurfaceRendering]
    && [(UIImageView *)self _setImageViewContentsForCIImageBackedImage:v4])
  {
LABEL_30:
    if (v13) {
      goto LABEL_34;
    }
LABEL_31:
    [(UIImageView *)self _teardownRBSymbolLayerIfNeeded];
    goto LABEL_34;
  }
  [v4 duration];
  if (v17 > 0.0)
  {
    id v18 = [v4 images];

    if (v18)
    {
      if (![(UIImageView *)self _setImageViewContentsForAnimatedImage:v4])
      {
        double v19 = [v4 images];
        uint64_t v20 = [v19 firstObject];
        double v21 = (void *)v20;
        if (v20) {
          v22 = (void *)v20;
        }
        else {
          v22 = v4;
        }
        id v23 = v22;

        id v4 = v23;
        goto LABEL_24;
      }
      goto LABEL_30;
    }
  }
LABEL_24:
  v24 = [(UIImageView *)self _cachedPretiledImageForImage:v4];
  v25 = v24;
  if (v24)
  {
    id v26 = v24;

    id v4 = v26;
  }
  [(UIView *)self bounds];
  v29 = -[UIImageView _layoutForImage:inSize:](self, "_layoutForImage:inSize:", v4, v27, v28);
  if ([v29 hasContents])
  {
    [(UIImageView *)self _applyImageLayout:v29 toLayer:v5];
    _setContentStretchForImage(self, v4);
  }
  else
  {
    [v5 setContents:0];
    [(UIImageView *)self _teardownRBSymbolLayerIfNeeded];
  }

LABEL_34:
  _UIRestorePreviousFallbackEnvironment(v8);
  +[UITraitCollection setCurrentTraitCollection:v6];

  return 1;
}

- (double)preferredContentScaleFactor
{
  v2 = [(UIView *)self traitCollection];
  [v2 displayScale];
  double v4 = v3;

  return v4;
}

- (void)_updateResolvedImages
{
  id v3 = [(UIImageView *)self _activeImage];
  [(UIImageView *)self _resolveImagesWithPreviouslyDisplayedImage:v3];
}

- (UIEdgeInsets)alignmentRectInsets
{
  id v3 = [(UIImageView *)self _activeImage];
  [(UIView *)self bounds];
  int v6 = -[UIImageView _layoutForImage:inSize:cachePerSize:forBaselineOffset:](self, "_layoutForImage:inSize:cachePerSize:forBaselineOffset:", v3, 0, 1, v4, v5);

  [v6 alignmentRectInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)_invalidateImageLayouts
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (pthread_main_np() != 1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v20 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        goto LABEL_24;
      }
      v24 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v24);
      id v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v32 = v22;
      __int16 v33 = 2112;
      v34 = v23;
      _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "-[%@ %@] must be called on the main queue", buf, 0x16u);
    }
    else
    {
      double v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_invalidateImageLayouts___s_category) + 8);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_2;
      }
      uint64_t v20 = v19;
      double v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      id v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v32 = v22;
      __int16 v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "-[%@ %@] must be called on the main queue", buf, 0x16u);
    }

LABEL_24:
  }
LABEL_2:
  double v4 = [(_UIImageViewStorage *)self->_storage layouts];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [(UIImageView *)self _baselineOffsetFromBottom];
    self->_previousBaselineOffsetFromBottom = v6;
    [(UIImageView *)self _firstBaselineOffsetFromTop];
    self->_previousFirstBaselineOffsetFromTop = v7;
  }
  double v8 = [(_UIImageViewStorage *)self->_storage imageBeingSetByLoader];
  if (v8)
  {
    double v9 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v25 = self;
    double v10 = [(_UIImageViewStorage *)self->_storage layouts];
    objc_opt_class();
    objc_opt_class();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) == 0 || v16 != v8)
          {
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            double v18 = [v16 objectAtIndexedSubscript:0];

            if (v18 != v8) {
              continue;
            }
          }
          double v17 = [v11 objectForKey:v16];
          [v9 setObject:v17 forKey:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v13);
    }

    [(_UIImageViewStorage *)v25->_storage setLayouts:v9];
  }
  else
  {
    double v9 = [(_UIImageViewStorage *)self->_storage layouts];
    [v9 removeAllObjects];
  }
}

- (id)_layoutForImage:(id)a3 inSize:(CGSize)a4 cachePerSize:(BOOL)a5 forBaselineOffset:(BOOL)a6
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (pthread_main_np() == 1) {
    goto LABEL_2;
  }
  if (os_variant_has_internal_diagnostics())
  {
    v22 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    long long v26 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v26);
    v25 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    long long v29 = v24;
    __int16 v30 = 2112;
    v31 = v25;
    _os_log_fault_impl(&dword_1853B0000, v22, OS_LOG_TYPE_FAULT, "-[%@ %@] must be called on the main queue", buf, 0x16u);
  }
  else
  {
    double v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_layoutForImage_inSize_cachePerSize_forBaselineOffset____s_category)+ 8);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_2;
    }
    v22 = v21;
    id v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    long long v29 = v24;
    __int16 v30 = 2112;
    v31 = v25;
    _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "-[%@ %@] must be called on the main queue", buf, 0x16u);
  }

LABEL_17:
LABEL_2:
  if (a5)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", width, height, v12);
    v27[1] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  }
  else
  {
    id v14 = v12;
  }
  double v15 = [(_UIImageViewStorage *)self->_storage layouts];
  double v16 = [v15 objectForKey:v14];

  if (!v16)
  {
    double v16 = +[_UIImageContentLayout layoutForSource:inTarget:withSize:](_UIImageContentLayout, "layoutForSource:inTarget:withSize:", v12, self, width, height);
    double v17 = [(_UIImageViewStorage *)self->_storage layouts];

    if (!v17)
    {
      double v18 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      [(_UIImageViewStorage *)self->_storage setLayouts:v18];
    }
    double v19 = [(_UIImageViewStorage *)self->_storage layouts];
    [v19 setObject:v16 forKey:v14];

    if (!a6) {
      [(UIImageView *)self _baselineOffsetParametersDidChangeHasBaselinePropertyChanged:0];
    }
  }

  return v16;
}

- (void)_baselineOffsetParametersDidChangeHasBaselinePropertyChanged:(BOOL)a3
{
  if ((*(void *)&self->super._viewFlags & 0x400000000000000) != 0)
  {
    BOOL v3 = a3;
    id v10 = [(UIView *)self _layoutEngine];
    if (v10)
    {
      if (v3)
      {
        uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v5 postNotificationName:@"_UIViewHasBaselinePropertyChanged" object:self];
      }
      [(UIImageView *)self _baselineOffsetFromBottom];
      double v7 = v6;
      [(UIImageView *)self _firstBaselineOffsetFromTop];
      double v9 = v8;
      if (self->_previousBaselineOffsetFromBottom != v7 || self->_previousFirstBaselineOffsetFromTop != v8)
      {
        [(UIView *)self _invalidateBaselineConstraints];
        self->_previousBaselineOffsetFromBottom = v7;
        self->_previousFirstBaselineOffsetFromTop = v9;
      }
    }
  }
}

- (BOOL)_layoutShouldFlipHorizontalOrientations
{
  return 0;
}

- (BOOL)_supportsContents
{
  return 1;
}

- (void)layoutSubviews
{
  BOOL v3 = [(UIImageView *)self _decompressingImageForType:0];
  if (v3)
  {
    [(UIImageView *)self setImage:v3];
    [(UIImageView *)self _setDecompressingImage:0 forType:0];
  }
  double v4 = [(UIImageView *)self _decompressingImageForType:1];
  if (v4)
  {
    [(UIImageView *)self setHighlightedImage:v4];
    [(UIImageView *)self _setDecompressingImage:0 forType:1];
  }
  [(UIImageView *)self _updateVisibilityAndFrameOfPlaceholderView];
  uint64_t v5 = [(UIImageView *)self _layeredImageContainer];
  [(UIView *)self bounds];
  objc_msgSend(v5, "setFrame:");

  v6.receiver = self;
  v6.super_class = (Class)UIImageView;
  [(UIView *)&v6 layoutSubviews];
}

- (id)_decompressingImageForType:(unint64_t)a3
{
  if (a3) {
    BOOL v3 = &unk_1EB25E681;
  }
  else {
    BOOL v3 = &_MergedGlobals_69_0;
  }
  return objc_getAssociatedObject(self, v3);
}

- (void)_updateVisibilityAndFrameOfPlaceholderView
{
  id v4 = [(_UIImageViewStorage *)self->_storage placeholderView];
  if (v4)
  {
    BOOL v3 = [(UIImageView *)self _currentImage];
    [v4 setHidden:v3 != 0];

    [(UIView *)self bounds];
    objc_msgSend(v4, "setFrame:");
  }
}

- (void)setFrame:(CGRect)a3
{
}

- (void)setImage:(UIImage *)image
{
}

- (void)_setImage:(id)a3 invalidatingPendingSymbolTransitions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!self || (*(void *)&self->super._viewFlags & 0x1000) == 0)
  {
    id v13 = v6;
    if (v4) {
      [(_UIImageViewSymbolAnimationPresetManager *)self->_animationPresetManager discardPendingSymbolContentTransitions];
    }
    double v7 = [(UIImageView *)self _activeImage];
    double v8 = [(_UIImageViewStorage *)self->_storage image];
    id v9 = v13;
    id v10 = v8;
    if (v10 != v9)
    {
      id v11 = v10;
      if (v9 && v10)
      {
        char v12 = [v9 isEqual:v10];

        if (v12) {
          goto LABEL_14;
        }
      }
      else
      {
      }
      [(_UIImageViewStorage *)self->_storage setImage:v9];
      *(_WORD *)&self->_imageViewFlags &= ~1u;
      [(UIImageView *)self _invalidateResolvedImages];
      if (![(UIImageView *)self _resolveImagesWithPreviouslyDisplayedImage:v7])[(UIImageView *)self _updateImageViewForOldImage:v7 newImage:v9]; {
      goto LABEL_14;
      }
    }

LABEL_14:
    id v6 = v13;
  }
}

- (void)_invalidateResolvedImages
{
  [(_UIImageViewStorage *)self->_storage setResolvedImage:0];
  [(_UIImageViewStorage *)self->_storage setResolvedHighlightedImage:0];
  lastResolvedImageViewTraitCollection = self->_lastResolvedImageViewTraitCollection;
  self->_lastResolvedImageViewTraitCollection = 0;

  BOOL v4 = [(_UIImageViewStorage *)self->_storage image];
  uint64_t v5 = [v4 content];
  char v6 = [v5 isCIImage];

  if ((v6 & 1) == 0)
  {
    storage = self->_storage;
    [(_UIImageViewStorage *)storage setCIRenderer:0];
  }
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  BOOL v4 = [(UIImageView *)self animationImages];
  uint64_t v5 = [(UIImageView *)self highlightedAnimationImages];
  char v6 = [(UIImageView *)self _currentImage];
  double v7 = [(UIImageView *)self _currentHighlightedImage];
  uint64_t v8 = [v4 count];
  id v9 = v4;
  if (v8 || (v10 = [v5 count], id v9 = v5, v10))
  {
    id v11 = [v9 objectAtIndex:0];
    if (v11)
    {
LABEL_4:
      double v12 = _UIAccessibilityContentSizeCategorySizeForImage(v11, self);
      double v14 = v13;
      [(UIImageView *)self _edgeInsetsForEffects];
      double v17 = v16 + v12 + v15;
      double v20 = v19 + v14 + v18;
      goto LABEL_11;
    }
  }
  else
  {
    double v21 = v6;
    if (v6 || (double v21 = v7) != 0)
    {
      id v11 = v21;
      goto LABEL_4;
    }
  }
  v22 = [(UIImageView *)self _placeholderView];
  double v17 = *MEMORY[0x1E4F1DB30];
  if (v22)
  {
    id v23 = v22;
    objc_msgSend(v22, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v17 = v24;
    double v20 = v25;

    id v11 = 0;
  }
  else
  {
    id v11 = 0;
    double v20 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
LABEL_11:

  double v26 = v17;
  double v27 = v20;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (void)_setViewGeometry:(CGRect)a3 forMetric:(int)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  if (a4 == 1)
  {
    uint64_t v32 = self;
    double v14 = &selRef_setBounds_;
    double v15 = &v32;
    goto LABEL_5;
  }
  if (!a4)
  {
    __int16 v33 = self;
    double v14 = &selRef_setFrame_;
    double v15 = &v33;
LABEL_5:
    v15[1] = (UIImageView *)UIImageView;
    objc_msgSendSuper2((objc_super *)v15, *v14, x, y, width, height, v32);
  }
  [(UIImageView *)self _updateRBSymbolLayerPositionIfNeededForContentTransitionPendingLayoutPass];
  double v16 = [(UIImageView *)self _currentImage];
  double v17 = [(UIImageView *)self _currentHighlightedImage];
  if (width != v11 || height != v13)
  {
    if ([(UIImageView *)self _canDrawContent])
    {
LABEL_9:
      [(UIImageView *)self _updateState];
LABEL_14:
      [(UIImageView *)self _imageContentParametersDidChange];
      goto LABEL_15;
    }
    double v18 = [v16 content];
    if ([v18 canScaleImageToTargetResolution])
    {
    }
    else
    {
      double v19 = [v17 content];
      int v20 = [v19 canScaleImageToTargetResolution];

      if (!v20)
      {
        v22 = [v16 content];
        if ([v22 isCGImage])
        {
        }
        else
        {
          id v23 = [v17 content];
          int v24 = [v23 isCGImage];

          if (!v24) {
            goto LABEL_9;
          }
        }
        BOOL v25 = [(UIImageView *)self _recomputePretilingState];
        BOOL v26 = v25;
        if (v25) {
          [(UIImageView *)self _updateState];
        }
        double v27 = [(UIView *)self layer];
        long long v28 = [v27 contentsScaling];
        BOOL v29 = v28 != (void *)*MEMORY[0x1E4F39E30];

        [(UIView *)self bounds];
        if (((v29 ^ objc_msgSend(v16, "_isTiledWhenStretchedToSize:", v30, v31)) & 1) == 0) {
          _setContentStretchForImage(self, v16);
        }
        if (v26) {
          goto LABEL_14;
        }
        goto LABEL_9;
      }
    }
    BOOL v21 = [(UIImageView *)self _animatesContents];
    [(UIImageView *)self _setAnimatesContents:1];
    [(UIImageView *)self _updateState];
    [(UIImageView *)self _setAnimatesContents:v21];
    goto LABEL_14;
  }
LABEL_15:
}

- (void)_updateRBSymbolLayerPositionIfNeededForContentTransitionPendingLayoutPass
{
  if ([(_UIImageViewSymbolAnimationPresetManager *)self->_animationPresetManager hasPendingContentTransition])
  {
    id v11 = [(UIImageView *)self _effectiveSymbolContentTransitionContainerView];
    animationPresetManager = self->_animationPresetManager;
    BOOL v4 = [(UIImageView *)self image];
    uint64_t v5 = [(_UIImageViewSymbolAnimationPresetManager *)animationPresetManager pendingSymbolContentTransitionForSettingSymbolImage:v4];

    if (v11)
    {
      if (v5)
      {
        if ([v5 isPendingLayoutPass])
        {
          [v5 initialSymbolAbsoluteRect];
          if (!CGRectIsNull(v13))
          {
            [MEMORY[0x1E4F39CF8] setDisableActions:1];
            [v5 initialSymbolAbsoluteRect];
            -[UIView convertRect:fromView:](self, "convertRect:fromView:", v11);
            double v7 = v6;
            double v9 = v8;
            double v10 = [(UIImageView *)self _rbSymbolLayer];
            objc_msgSend(v10, "setPosition:", v7, v9);

            [MEMORY[0x1E4F39CF8] setDisableActions:0];
          }
        }
      }
    }
  }
}

- (NSArray)animationImages
{
  v2 = [(_UIImageViewStorage *)self->_storage animationImages];
  BOOL v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (BOOL)_resolveImagesWithPreviouslyDisplayedImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIImageViewStorage *)self->_storage animationImages];
  if (!v5)
  {
    double v6 = [(_UIImageViewStorage *)self->_storage highlightedAnimationImages];

    if (v6) {
      goto LABEL_6;
    }
    double v7 = -[UIImageView _effectiveImageViewTraitCollectionForResolvingImages](self);
    if (-[UITraitCollection _isEqualToTraitCollectionForResolvingImage:]((uint64_t)v7, (uint64_t)self->_lastResolvedImageViewTraitCollection))
    {

      goto LABEL_6;
    }
    objc_storeStrong((id *)&self->_lastResolvedImageViewTraitCollection, v7);
    id v11 = [(UIImageView *)self highlightedImage];
    if (!v11)
    {
      id v8 = 0;
      int v18 = 0;
      goto LABEL_22;
    }
    double v12 = -[UIImageView _resolvedImageFromImage:withImageViewTrait:](self, v11, v7);
    if (!v12) {
      goto LABEL_20;
    }
    CGRect v13 = [(_UIImageViewStorage *)self->_storage resolvedHighlightedImage];
    id v14 = v12;
    id v15 = v13;
    if (v14 == v15)
    {
    }
    else
    {
      double v16 = v15;
      if (v15)
      {
        char v17 = [v14 isEqual:v15];

        if (v17) {
          goto LABEL_20;
        }
      }
      else
      {
      }
      [(_UIImageViewStorage *)self->_storage setResolvedHighlightedImage:v14];
      if ([(UIImageView *)self isHighlighted])
      {
        id v8 = v14;
        int v18 = 1;
LABEL_21:

LABEL_22:
        double v19 = [(UIImageView *)self image];
        if (!v19)
        {

          if (!v18) {
            goto LABEL_7;
          }
LABEL_37:
          [(UIImageView *)self _updateImageViewForOldImage:v4 newImage:v8];
          BOOL v9 = 1;
          goto LABEL_8;
        }
        int v20 = v19;
        BOOL v21 = -[UIImageView _resolvedImageFromImage:withImageViewTrait:](self, v19, v7);
        if (v21)
        {
          long long v28 = v11;
          v22 = [(_UIImageViewStorage *)self->_storage resolvedImage];
          id v23 = v21;
          id v24 = v22;
          if (v23 == v24)
          {

            id v11 = v28;
          }
          else
          {
            BOOL v25 = v24;
            if (v24)
            {
              char v27 = [v23 isEqual:v24];

              id v11 = v28;
              if (v27) {
                goto LABEL_36;
              }
            }
            else
            {

              id v11 = v28;
            }
            [(_UIImageViewStorage *)self->_storage setResolvedImage:v23];
            if (v18)
            {
              LOBYTE(v18) = 1;
              goto LABEL_36;
            }
            id v26 = v23;
            id v23 = v8;
            LOBYTE(v18) = 1;
            id v8 = v26;
          }
        }
LABEL_36:

        if ((v18 & 1) == 0) {
          goto LABEL_7;
        }
        goto LABEL_37;
      }
    }
LABEL_20:
    id v8 = 0;
    int v18 = 0;
    goto LABEL_21;
  }

LABEL_6:
  id v8 = 0;
LABEL_7:
  BOOL v9 = 0;
LABEL_8:

  return v9;
}

- (id)_currentHighlightedImage
{
  BOOL v3 = [(_UIImageViewStorage *)self->_storage resolvedHighlightedImage];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_UIImageViewStorage *)self->_storage highlightedImage];
  }
  double v6 = v5;

  return v6;
}

- (NSArray)highlightedAnimationImages
{
  v2 = [(_UIImageViewStorage *)self->_storage highlightedAnimationImages];
  BOOL v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v8 = a3;
  id v4 = [(UIView *)self traitCollection];
  [(UIImageView *)self _updateResolvedImages];
  if (![(UIImageView *)self adjustsImageSizeForAccessibilityContentSizeCategory])
  {
LABEL_6:
    id v5 = v8;
    if (!v8 || !v4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  id v5 = v8;
  if (!v4) {
    goto LABEL_10;
  }
  if (!v8 || v4[13] != v8[13])
  {
    [(UIView *)self invalidateIntrinsicContentSize];
    goto LABEL_6;
  }
LABEL_8:
  if (v4[15] != v5[15])
  {
    *(_WORD *)&self->_imageViewFlags |= 0x10u;
    [(UIView *)self invalidateIntrinsicContentSize];
  }
LABEL_10:
  uint64_t v6 = [v4 _userInterfaceRenderingMode];
  if (v6 != [v8 _userInterfaceRenderingMode]
    || (uint64_t v7 = [v4 _vibrancy], v7 != objc_msgSend(v8, "_vibrancy")))
  {
    [(UIImageView *)self _updateState];
  }
}

- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory
{
  return [(_UIImageViewStorage *)self->_storage adjustsImageSizeForAccessibilityContentSizeCategory];
}

- (UIEdgeInsets)_edgeInsetsForEffects
{
  if ((*(_WORD *)&self->_imageViewFlags & 0x10) != 0)
  {
    p_cachedEdgeInsetsForEffects = &self->_cachedEdgeInsetsForEffects;
    *(_OWORD *)&self->_cachedEdgeInsetsForEffects.double top = 0u;
    *(_OWORD *)&self->_cachedEdgeInsetsForEffects.double bottom = 0u;
    id v4 = [(UIImageView *)self _activeImage];
    if (v4)
    {
      [(UIImageView *)self _edgeInsetsForEffectsForImage:v4];
      p_cachedEdgeInsetsForEffects->double top = v5;
      p_cachedEdgeInsetsForEffects->double left = v6;
      p_cachedEdgeInsetsForEffects->double bottom = v7;
      p_cachedEdgeInsetsForEffects->double right = v8;
    }
    *(_WORD *)&self->_imageViewFlags &= ~0x10u;
  }
  double top = self->_cachedEdgeInsetsForEffects.top;
  double left = self->_cachedEdgeInsetsForEffects.left;
  double bottom = self->_cachedEdgeInsetsForEffects.bottom;
  double right = self->_cachedEdgeInsetsForEffects.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_applyImageLayout:(id)a3 toLayer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = [(UIImageView *)self image];
  BOOL v9 = [(UIImageView *)self _usesRenderBoxToRenderImage:v8 withLayout:v6];

  if (v9)
  {
    [v7 setContents:0];
    double v10 = [(UIImageView *)self _rbSymbolLayer];
    if (!v10)
    {
      double v10 = [MEMORY[0x1E4F96018] layer];
      double v11 = *MEMORY[0x1E4F1DAD8];
      double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      objc_msgSend(v10, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], v12);
      CGRect v13 = [(UIView *)self layer];
      [v13 addSublayer:v10];

      id v14 = objc_opt_new();
      objc_msgSend(v14, "setAnchorPoint:", v11, v12);
      [v10 setAnimator:v14];
      [(UIImageView *)self _setRBSymbolLayer:v10];
    }
    animationPresetManager = self->_animationPresetManager;
    double v16 = [(UIImageView *)self image];
    char v17 = [(_UIImageViewSymbolAnimationPresetManager *)animationPresetManager pendingSymbolContentTransitionForSettingSymbolImage:v16];

    if (v17)
    {
      if (([v17 isPendingLayoutPass] & 1) == 0)
      {
        int v18 = [v17 sourceSymbolImage];
        [(UIView *)self bounds];
        BOOL v21 = -[UIImageView _layoutForImage:inSize:](self, "_layoutForImage:inSize:", v18, v19, v20);
        [(UIImageView *)self _setupRBSymbolLayerWithSymbolImageLayout:v21];
        [v17 setPendingLayoutPass:1];
        v22 = [(UIImageView *)self _effectiveSymbolContentTransitionContainerView];
        if (v22)
        {
          [(UIView *)self bounds];
          -[UIView convertRect:toView:](self, "convertRect:toView:", v22);
          objc_msgSend(v17, "setInitialSymbolAbsoluteRect:");
        }
        id v23 = (void *)UIApp;
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __41__UIImageView__applyImageLayout_toLayer___block_invoke;
        v33[3] = &unk_1E52DD450;
        id v34 = v17;
        uint64_t v35 = self;
        id v36 = v18;
        id v37 = v10;
        id v24 = v18;
        [v23 _performBlockAfterCATransactionCommits:v33];
      }
    }
    else
    {
      [(UIImageView *)self _setupSymbolLayerForCurrentSymbolImageLayout:v6];
    }
  }
  else
  {
    [(UIImageView *)self _teardownRBSymbolLayerIfNeeded];
    BOOL v25 = [v6 contents];
    [v7 setContents:v25];

    [(UIImageView *)self _applyEffectsFromLayout:v6];
    if (v6)
    {
      [v6 contentsTransform];
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v30 = 0u;
    }
    v29[0] = v30;
    v29[1] = v31;
    v29[2] = v32;
    [v7 setContentsTransform:v29];
    [v6 contentsScaleFactor];
    -[UIImageView setContentScaleFactor:](self, "setContentScaleFactor:");
    if (qword_1EB25E698 != -1) {
      dispatch_once(&qword_1EB25E698, &__block_literal_global_655);
    }
    if (byte_1EB25E682 == 1)
    {
      __int16 imageViewFlags = (__int16)self->_imageViewFlags;
      double v10 = [(UIImageView *)self image];
      uint64_t v27 = [v10 isSymbolImage];
      if ((imageViewFlags & 0x20) != 0)
      {
        if (v27) {
          __int16 v28 = 64;
        }
        else {
          __int16 v28 = 0;
        }
        *(_WORD *)&self->___int16 imageViewFlags = *(_WORD *)&self->_imageViewFlags & 0xFFBF | v28;
      }
      else
      {
        [v7 setContentsAlignsToPixels:v27];
      }
    }
    else
    {
      double v10 = [(UIImageView *)self image];
      -[UIImageView _setLayerAllowsEdgeAntialiasing:](self, "_setLayerAllowsEdgeAntialiasing:", [v10 isSymbolImage]);
    }
  }
}

- (id)_currentImage
{
  BOOL v3 = [(_UIImageViewStorage *)self->_storage resolvedImage];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_UIImageViewStorage *)self->_storage image];
  }
  id v6 = v5;

  return v6;
}

- (UIImage)image
{
  return [(_UIImageViewStorage *)self->_storage image];
}

- (void)setContentScaleFactor:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIImageView;
  -[UIView setContentScaleFactor:](&v6, sel_setContentScaleFactor_);
  id v5 = [(UIImageView *)self _layeredImageContainer];
  [v5 setContentScaleFactor:a3];
}

- (void)_teardownRBSymbolLayerIfNeeded
{
  BOOL v3 = [(UIImageView *)self _rbSymbolLayer];
  if (v3)
  {
    id v6 = v3;
    [v3 removeFromSuperlayer];
    [v6 setAnimator:0];
    [(UIImageView *)self _setRBSymbolLayer:0];
    animationPresetManager = self->_animationPresetManager;
    id v5 = [MEMORY[0x1E4F41A50] options];
    [(_UIImageViewSymbolAnimationPresetManager *)animationPresetManager removeAllSymbolEffectsWithOptions:v5 animated:0];

    [(_UIImageViewSymbolAnimationPresetManager *)self->_animationPresetManager discardPendingSymbolContentTransitions];
    BOOL v3 = v6;
  }
}

- (RBSymbolLayer)_rbSymbolLayer
{
  return (RBSymbolLayer *)objc_getAssociatedObject(self, &renderBoxSymbolLayerKey);
}

- (id)_renditionForSource:(id)a3 size:(CGSize)a4 symbolConfiguration:(id)a5 withRenditionResult:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  v66[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  CGRect v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v17 = +[_UIImageContentRendition renditionWithResult:]((uint64_t)_UIImageContentRendition, v13);
    goto LABEL_42;
  }
  id v14 = v11;
  uint64_t v15 = [v14 _colorForFlattening];
  id v63 = v12;
  if (!v15
    && ![(UIImageView *)self _needsImageEffectsForImage:v14 symbolConfiguration:v12])
  {
    long long v31 = 0;
    long long v32 = 0;
    __int16 v33 = 0;
    +[_UIImageContentRendition renditionWithResult:color:effects:drawMode:]((uint64_t)_UIImageContentRendition, v13, 0, 0, 0);
LABEL_38:
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  double v16 = v13;
  uint64_t v17 = [(UIImageView *)self _baseMultiplyColorWithImage:v14 symbolConfiguration:v12];
  int v18 = [(UIImageView *)self _effectiveContentEffectsWithImage:v14 symbolConfiguration:v12];
  double v19 = v14;
  BOOL v20 = [(UIImageView *)self _needsBoldEffectForImage:v14 symbolConfiguration:v12 withBaseColor:v17 withEffects:v18];
  uint64_t v21 = [(UIImageView *)self drawMode];
  uint64_t v22 = [v12 traitCollection];
  BOOL v55 = v20;
  v60 = v18;
  v62 = (void *)v22;
  if (v20)
  {
    uint64_t v23 = v22;
    id v52 = v11;
    v59 = (void *)v15;
    v66[0] = @"_UIKitBoldTintStyle";
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
    id v24 = [(id)v17 resolvedColorWithTraitCollection:v23];
    BOOL v25 = [v19 _primitiveImageAsset];
    objc_msgSend(v25, "_cachedRenditionWithSize:tintColor:traitCollection:bold:drawMode:", v24, v23, 1, v21, width, height);
    uint64_t v17 = v26 = (void *)v17;

    id v14 = v19;
    if (v17)
    {
      v57 = v26;

      uint64_t v27 = 0;
      id v28 = 0;
      unsigned int v58 = 0;
      id v61 = 0;
      id v29 = 0;
      int v30 = 0;
      id v11 = v52;
      CGRect v13 = v16;
      long long v31 = 0;
LABEL_32:

      v47 = v60;
      goto LABEL_35;
    }
    unsigned int v58 = v21;
    CGRect v13 = v16;
    -[_UIImageContentRenditionResult CGImageProvider](v16);
    id v34 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    uint64_t v35 = +[UIImage imageWithCGImage:v34[2]()];
    v56 = v24;
    id v29 = [v35 _imageWithStylePresets:v54 tintColor:v24 traitCollection:v23];

    uint64_t v15 = 0;
    id v11 = v52;
    int v18 = v60;
  }
  else
  {
    id v14 = v19;
    unsigned int v58 = v21;
    v56 = 0;
    id v29 = 0;
    CGRect v13 = v16;
  }
  if ([v18 count])
  {
    id v61 = v18;
    uint64_t v36 = 0;
  }
  else
  {
    id v61 = 0;
    uint64_t v36 = v58;
    unsigned int v58 = 0;
  }
  v59 = (void *)v15;
  v57 = (void *)v17;
  if (!(v17 | v15)) {
    goto LABEL_23;
  }
  if ([(UIImageView *)self _shouldTreatImageAsTemplate:v14 symbolConfiguration:v63])
  {
    if (v17) {
      id v37 = (void *)v17;
    }
    else {
      id v37 = (void *)v15;
    }
  }
  else
  {
    id v37 = (void *)v15;
    if (!v15) {
      goto LABEL_21;
    }
  }
  uint64_t v15 = v37;
LABEL_21:
  v38 = [(id)v15 resolvedColorWithTraitCollection:v62];

  if (v38)
  {
    long long v31 = [(UIImageView *)self _colorByApplyingDrawMode:v36 toColor:v38];
    unsigned int v53 = 0;
LABEL_27:

    goto LABEL_29;
  }
LABEL_23:
  if (v36)
  {
    unsigned int v53 = v36;
    if (!v29)
    {
      -[_UIImageContentRenditionResult CGImageProvider](v13);
      v39 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
      id v29 = +[UIImage imageWithCGImage:v39[2]()];
    }
    id v40 = v29;
    v41 = (CGImage *)[v40 CGImage];
    [v40 scale];
    double v43 = v42;
    double v44 = (double)CGImageGetWidth(v41) / v42;
    double v45 = (double)CGImageGetHeight(v41) / v43;
    v38 = +[UIGraphicsImageRendererFormat preferredFormat];
    [v38 setScale:v43];
    v46 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v38, v44, v45);
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __80__UIImageView__renditionForSource_size_symbolConfiguration_withRenditionResult___block_invoke;
    v65[3] = &unk_1E52ECBC8;
    *(double *)&v65[5] = v44;
    *(double *)&v65[6] = v45;
    v65[7] = v41;
    v65[4] = self;
    id v29 = [(UIGraphicsImageRenderer *)v46 imageWithActions:v65];

    long long v31 = 0;
    goto LABEL_27;
  }
  long long v31 = 0;
  unsigned int v53 = 0;
LABEL_29:
  uint64_t v27 = v56;
  v47 = v60;
  if (v29)
  {
    id v28 = v29;
    CGImageRef v48 = CGImageRetain((CGImageRef)[v28 CGImage]);
    CFTypeRef v49 = CFAutorelease(v48);
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __80__UIImageView__renditionForSource_size_symbolConfiguration_withRenditionResult___block_invoke_2;
    v64[3] = &__block_descriptor_40_e15___CGImage__8__0l;
    v64[4] = v49;
    v50 = -[_UIImageContentRenditionResult resultWithCGImageProvider:]((uint64_t)v13, v64);

    +[_UIImageContentRendition renditionWithResult:color:effects:]((uint64_t)_UIImageContentRendition, v50, v31, v61);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      [v14 imageAsset];
      v54 = int v30 = 1;
      objc_msgSend(v54, "_cacheRendition:forSize:tintColor:traitCollection:bold:drawMode:", v29, v56, v62, 1, v53, width, height);
      uint64_t v17 = 0;
      CGRect v13 = v50;
      uint64_t v27 = v56;
      goto LABEL_32;
    }
    uint64_t v17 = 0;
    int v30 = 1;
    CGRect v13 = v50;
    uint64_t v27 = v56;
  }
  else
  {
    id v28 = 0;
    uint64_t v17 = 0;
    int v30 = 1;
  }
LABEL_35:

  if (!v30)
  {
    __int16 v33 = v59;
    long long v32 = v61;
    goto LABEL_41;
  }
  __int16 v33 = v59;
  long long v32 = v61;
  if (!v29)
  {
    +[_UIImageContentRendition renditionWithResult:color:effects:drawMode:]((uint64_t)_UIImageContentRendition, v13, v31, v61, v58);
    goto LABEL_38;
  }
LABEL_39:
  id v29 = v29;
  uint64_t v17 = (uint64_t)v29;
LABEL_41:

  id v12 = v63;
LABEL_42:

  return (id)v17;
}

- (BOOL)_usesRenderBoxToRenderImage:(id)a3 withLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isSymbolImage]
    && [(UIImageView *)self _hasReasonToUseRBSymbolLayerForImage:v6])
  {
    CGFloat v8 = [v7 rbSymbolConfiguration];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_needsImageEffectsForImage:(id)a3 symbolConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIImageView *)self drawMode])
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v9 = [(UIImageView *)self _baseMultiplyColorWithImage:v6 symbolConfiguration:v7];
    if (v9)
    {
      BOOL v8 = 1;
    }
    else
    {
      double v10 = [(UIImageView *)self _effectiveContentEffectsWithImage:v6 symbolConfiguration:v7];
      BOOL v8 = [v10 count] != 0;
    }
  }

  return v8;
}

- (BOOL)_needsBoldEffectForImage:(id)a3 symbolConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(UIImageView *)self _baseMultiplyColorWithImage:v7 symbolConfiguration:v6];
  BOOL v9 = [(UIImageView *)self _effectiveContentEffectsWithImage:v7 symbolConfiguration:v6];
  LOBYTE(self) = [(UIImageView *)self _needsBoldEffectForImage:v7 symbolConfiguration:v6 withBaseColor:v8 withEffects:v9];

  return (char)self;
}

- (id)_baseMultiplyColorWithImage:(id)a3 symbolConfiguration:(id)a4
{
  return [(UIImageView *)self _baseMultiplyColorWithImage:a3 symbolConfiguration:a4 shouldResolveDynamicColors:1];
}

- (id)_effectiveContentEffectsWithImage:(id)a3 symbolConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(UIView *)self traitCollection];
  if ([v8 _userInterfaceRenderingMode] != 2 || (*((unsigned char *)&self->super._viewFlags + 24) & 0x20) == 0)
  {
    BOOL v9 = 0;
LABEL_4:

    goto LABEL_5;
  }
  BOOL v11 = [(UIImageView *)self _imageSupportsMaterials:v6 symbolConfiguration:v7];

  if (v11)
  {
    BOOL v8 = [(UIImageView *)self _materialForImage:v6 symbolConfiguration:v7];
    BOOL v9 = [v8 contentEffects];
    goto LABEL_4;
  }
  BOOL v9 = 0;
LABEL_5:

  return v9;
}

- (BOOL)_needsBoldEffectForImage:(id)a3 symbolConfiguration:(id)a4 withBaseColor:(id)a5 withEffects:(id)a6
{
  id v9 = a3;
  uint64_t v10 = [a6 count];
  BOOL v11 = [(UIView *)self traitCollection];
  uint64_t v12 = [v11 legibilityWeight];

  if (v12 == 1)
  {
    unsigned int v13 = (a5 != 0) & ~[v9 _suppressesAccessibilityHairlineThickening];
    if (v10) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v13;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unsigned)drawMode
{
  return [(_UIImageViewStorage *)self->_storage drawMode];
}

- (UIImage)highlightedImage
{
  return [(_UIImageViewStorage *)self->_storage highlightedImage];
}

- (void)_setAnimatesContents:(BOOL)a3
{
  self->__animatesContents = a3;
}

- (UIView)_placeholderView
{
  return [(_UIImageViewStorage *)self->_storage placeholderView];
}

- (id)_resolvedImageFromImage:(id)a3
{
  id v4 = a3;
  id v5 = [(UIImageView *)self image];

  if (v5 == v4)
  {
    id v7 = [(UIImageView *)self _currentImage];
  }
  else
  {
    id v6 = -[UIImageView _effectiveImageViewTraitCollectionForResolvingImages](self);
    id v7 = -[UIImageView _resolvedImageFromImage:withImageViewTrait:](self, v4, v6);
  }
  return v7;
}

- (void)setContentMode:(int64_t)a3
{
  UIViewContentMode v5 = [(UIView *)self contentMode];
  v6.receiver = self;
  v6.super_class = (Class)UIImageView;
  [(UIView *)&v6 setContentMode:a3];
  if (v5 != a3)
  {
    *(_WORD *)&self->_imageViewFlags &= ~1u;
    [(UIImageView *)self _imageContentParametersDidChange];
    [(UIImageView *)self _baselineOffsetParametersDidChangeHasBaselinePropertyChanged:0];
    [(UIImageView *)self _updateState];
  }
}

- (BOOL)_hasReasonToUseRBSymbolLayerForImage:(id)a3
{
  id v4 = a3;
  UIViewContentMode v5 = [(UIImageView *)self _rbSymbolLayer];
  objc_super v6 = [v5 animator];
  BOOL v7 = ([v6 isAnimating] & 1) != 0
    || [(_UIImageViewSymbolAnimationPresetManager *)self->_animationPresetManager hasPendingAnimationsForImage:v4]|| [(UIImageView *)self _hasNonDefaultSymbolAnimatorState];

  return v7;
}

- (BOOL)_hasNonDefaultSymbolAnimatorState
{
  v2 = [(UIImageView *)self _rbSymbolLayer];
  BOOL v3 = [v2 animator];

  if (v3) {
    BOOL v4 = ([v3 isHidden] & 1) != 0 || objc_msgSend(v3, "scaleLevel") != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (UIImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIImageView;
  BOOL v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    _UIImageViewCommonInit(v3);
    [(UIView *)v4 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)setHidden:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIImageView;
  -[UIView setHidden:](&v5, sel_setHidden_);
  if (!a3) {
    [(UIImageView *)self _mainQ_beginLoadingIfApplicable];
  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIImageView;
  -[UIView _didMoveFromWindow:toWindow:](&v8, sel__didMoveFromWindow_toWindow_, a3);
  if (a4)
  {
    [(UIImageView *)self _mainQ_beginLoadingIfApplicable];
    if (dyld_program_sdk_at_least()) {
      [(UIImageView *)self _updateResolvedImages];
    }
    if ((*(_WORD *)&self->_imageViewFlags & 8) != 0
      || ([(UIImageView *)self _activeImage],
          objc_super v6 = objc_claimAutoreleasedReturnValue(),
          BOOL v7 = [(UIImageView *)self _shouldTreatImageAsTemplate:v6],
          v6,
          v7))
    {
      [(UIImageView *)self _templateSettingsDidChange];
    }
  }
}

- (void)_mainQ_beginLoadingIfApplicable
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least())
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
LABEL_4:
    BOOL v3 = [(_UIImageViewStorage *)self->_storage imageLoader];
    if (v3)
    {
      if (![(_UIImageViewStorage *)self->_storage isStartingLoad])
      {
        BOOL v4 = [(UIView *)self window];
        if (v4)
        {
          BOOL v5 = [(UIView *)self isHidden];

          if (!v5)
          {
            [(_UIImageViewStorage *)self->_storage setStartingLoad:1];
            objc_super v6 = [(_UIImageViewStorage *)self->_storage loadingDelegate];
            if (objc_opt_respondsToSelector()) {
              int v7 = [v6 _imageViewShouldBeginLoading:self];
            }
            else {
              int v7 = 1;
            }
            if ([(_UIImageViewStorage *)self->_storage isStoppingLoad] || !v7)
            {
              [(UIImageView *)self _mainQ_resetForLoader:0 delegate:0];
            }
            else
            {
              [(_UIImageViewStorage *)self->_storage setEnqueueingLoad:1];
              objc_super v8 = _UIImageLoadingLog();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218240;
                double v16 = self;
                __int16 v17 = 2048;
                int v18 = v3;
                _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_INFO, "Image view %p is loading from loader=%p", buf, 0x16u);
              }

              objc_initWeak((id *)buf, self);
              id v9 = [(_UIImageViewStorage *)self->_storage imageLoader];
              objc_initWeak(&location, v9);

              if (qword_1EB25E6A8 != -1) {
                dispatch_once(&qword_1EB25E6A8, &__block_literal_global_668);
              }
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __46__UIImageView__mainQ_beginLoadingIfApplicable__block_invoke;
              block[3] = &unk_1E52DA7A0;
              uint64_t v10 = (id)qword_1EB25E6A0;
              objc_copyWeak(&v12, (id *)buf);
              objc_copyWeak(&v13, &location);
              dispatch_async(v10, block);

              objc_destroyWeak(&v13);
              objc_destroyWeak(&v12);
              objc_destroyWeak(&location);
              objc_destroyWeak((id *)buf);
            }
          }
        }
      }
    }
    goto LABEL_20;
  }
  if (pthread_main_np() == 1) {
    goto LABEL_4;
  }
  BOOL v3 = _UIImageLoadingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    double v16 = self;
    _os_log_error_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Image view %p is being used from a non-main thread. It is illegal to use UIView on a background thread.", buf, 0xCu);
  }
LABEL_20:
}

- (void)setPreferredSymbolConfiguration:(UIImageSymbolConfiguration *)preferredSymbolConfiguration
{
  BOOL v4 = preferredSymbolConfiguration;
  BOOL v5 = [(_UIImageViewStorage *)self->_storage preferredSymbolConfiguration];
  objc_super v6 = v4;
  uint64_t v10 = v6;
  if (v5 == v6)
  {

    id v9 = v10;
LABEL_9:

    objc_super v8 = v10;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(UIImageSymbolConfiguration *)v5 isEqual:v6];

  objc_super v8 = v10;
  if (!v7)
  {
LABEL_8:
    id v9 = [(UIImageView *)self _activeImage];
    [(_UIImageViewStorage *)self->_storage setPreferredSymbolConfiguration:v10];
    [(UIImageView *)self _invalidateResolvedImages];
    [(UIImageView *)self _resolveImagesWithPreviouslyDisplayedImage:v9];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setDrawMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(_UIImageViewStorage *)self->_storage drawMode] != a3)
  {
    [(_UIImageViewStorage *)self->_storage setDrawMode:v3];
    [(UIImageView *)self _updateState];
  }
}

- (id)_checkImageForAdaptation:(id)a3 hasAdapted:(BOOL *)a4
{
  id v6 = a3;
  BOOL v7 = [(UIImageView *)self image];
  objc_super v8 = [(UIImageView *)self _currentImage];
  id v9 = [(UIImageView *)self _adaptiveImageForImage:v6 assignedImage:v7 currentImage:v8 hasAdapted:a4];

  return v9;
}

- (id)_adaptiveImageForImage:(id)a3 assignedImage:(id)a4 currentImage:(id)a5 hasAdapted:(BOOL *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6) {
    *a6 = 0;
  }
  id v12 = v9;
  if (v12)
  {
    int v13 = [v10 isEqual:v12];
    id v14 = v12;
    if (v11)
    {
      id v14 = v12;
      if (v13)
      {
        id v14 = v12;
        if (([v11 isEqual:v12] & 1) == 0)
        {
          id v14 = v11;

          if (a6) {
            *a6 = 1;
          }
        }
      }
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)setAnimationImages:(NSArray *)animationImages
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v4 = animationImages;
  if ([(UIImageView *)self isAnimating]) {
    [(UIImageView *)self stopAnimating];
  }
  BOOL v5 = [(_UIImageViewStorage *)self->_storage animationImages];
  id v6 = v4;
  BOOL v7 = v6;
  if (v5 == v6)
  {

    goto LABEL_25;
  }
  if (v6 && v5)
  {
    char v8 = [(NSArray *)v5 isEqual:v6];

    if (v8) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  id v9 = [(_UIImageViewStorage *)self->_storage animationImages];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        [(UIImageView *)self _clearPretiledImageCacheForImage:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v7;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        -[UIImageView _updatePretiledImageCacheForImage:](self, "_updatePretiledImageCacheForImage:", *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v16);
  }

  uint64_t v19 = (void *)[(NSArray *)v14 copy];
  [(_UIImageViewStorage *)self->_storage setAnimationImages:v19];

  [(UIView *)self invalidateIntrinsicContentSize];
LABEL_25:
  [(UIImageView *)self _updateState];
  BOOL v20 = [(UIImageView *)self _currentImage];
  if (!v20)
  {
    if (![(NSArray *)v7 count]) {
      goto LABEL_29;
    }
    BOOL v20 = [(NSArray *)v7 objectAtIndex:0];
    [v20 scale];
    -[UIImageView setContentScaleFactor:](self, "setContentScaleFactor:");
  }

LABEL_29:
  uint64_t v21 = [(UIImageView *)self _currentImage];
  if (v21)
  {
    [(UIView *)self setOpaque:0];
  }
  else
  {
    uint64_t v22 = [(UIImageView *)self animationImages];
    if (v22)
    {
      [(UIView *)self setOpaque:0];
    }
    else
    {
      uint64_t v23 = [(UIImageView *)self _currentHighlightedImage];
      if (v23)
      {
        [(UIView *)self setOpaque:0];
      }
      else
      {
        id v24 = [(UIImageView *)self highlightedAnimationImages];
        [(UIView *)self setOpaque:v24 == 0];
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->super._layerRetained
    && [(UIImageView *)self _hasInstalledContentsAnimation])
  {
    [(UIImageView *)self _removeLayerAnimations];
  }
  uint64_t v3 = [(_UIImageViewStorage *)self->_storage image];
  [(UIImageView *)self _clearPretiledImageCacheForImage:v3];

  BOOL v4 = [(_UIImageViewStorage *)self->_storage highlightedImage];
  [(UIImageView *)self _clearPretiledImageCacheForImage:v4];

  BOOL v5 = [(_UIImageViewStorage *)self->_storage resolvedImage];
  [(UIImageView *)self _clearPretiledImageCacheForImage:v5];

  id v6 = [(_UIImageViewStorage *)self->_storage resolvedHighlightedImage];
  [(UIImageView *)self _clearPretiledImageCacheForImage:v6];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v7 = [(_UIImageViewStorage *)self->_storage animationImages];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        [(UIImageView *)self _clearPretiledImageCacheForImage:*(void *)(*((void *)&v22 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = [(_UIImageViewStorage *)self->_storage highlightedAnimationImages];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [(UIImageView *)self _clearPretiledImageCacheForImage:*(void *)(*((void *)&v18 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  v17.receiver = self;
  v17.super_class = (Class)UIImageView;
  [(UIView *)&v17 dealloc];
}

- (void)_templateSettingsDidChange
{
  *(_WORD *)&self->_imageViewFlags &= ~8u;
}

- (BOOL)_recomputePretilingState
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIImageView *)self _currentImage];
  BOOL v4 = [(UIImageView *)self _currentHighlightedImage];
  if ([(UIImageView *)self isAnimating]) {
    goto LABEL_8;
  }
  BOOL v5 = [v3 images];
  if (v5 && ![(UIImageView *)self isHighlighted])
  {

    goto LABEL_8;
  }
  uint64_t v6 = [v4 images];
  if (v6)
  {
    BOOL v7 = (void *)v6;
    BOOL v8 = [(UIImageView *)self isHighlighted];

    if (!v8) {
      goto LABEL_10;
    }
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_25;
  }

LABEL_10:
  [(UIImageView *)self _updatePretiledImageCacheForImage:v3];
  [(UIImageView *)self _updatePretiledImageCacheForImage:v4];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [(UIImageView *)self animationImages];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        [(UIImageView *)self _updatePretiledImageCacheForImage:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v12);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v15 = [(UIImageView *)self highlightedAnimationImages];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        [(UIImageView *)self _updatePretiledImageCacheForImage:*(void *)(*((void *)&v21 + 1) + 8 * j)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }

  BOOL v9 = 1;
LABEL_25:

  return v9;
}

- (void)_updateImageViewForOldImage:(id)a3 newImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(UIView *)self traitCollection];
  uint64_t v9 = [v8 legibilityWeight];

  if (v9 != 1
    || [v6 _suppressesAccessibilityHairlineThickening]
    && ([v7 _suppressesAccessibilityHairlineThickening] & 1) != 0)
  {
    BOOL v10 = 0;
    goto LABEL_8;
  }
  if (!v6 && v7)
  {
LABEL_7:
    BOOL v10 = 1;
    goto LABEL_8;
  }
  if (v6) {
    BOOL v42 = v7 == 0;
  }
  else {
    BOOL v42 = 0;
  }
  BOOL v10 = v42;
  if (v6 && v7)
  {
    uint64_t v43 = [v6 renderingMode];
    uint64_t v44 = [v7 renderingMode];
    if (v43 == 1 && v44 != 1) {
      goto LABEL_7;
    }
    BOOL v10 = v43 != 1 && v44 == 1;
  }
LABEL_8:
  [v7 alignmentRectInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [v6 alignmentRectInsets];
  BOOL v22 = 1;
  if (v14 == v23 && v12 == v19 && v18 == v21 && v16 == v20)
  {
    long long v24 = [v6 configuration];
    long long v25 = [v24 traitCollection];
    uint64_t v26 = [v25 layoutDirection];
    long long v27 = [v7 configuration];
    long long v28 = [v27 traitCollection];
    BOOL v22 = v26 != [v28 layoutDirection];
  }
  if (v10)
  {
    *(_WORD *)&self->_imageViewFlags |= 0x10u;
LABEL_15:
    [(UIView *)self invalidateIntrinsicContentSize];
    goto LABEL_16;
  }
  [v7 size];
  double v33 = v32;
  double v35 = v34;
  [v6 size];
  if (v33 != v37 || v35 != v36) {
    goto LABEL_15;
  }
  uint64_t v38 = [v7 imageOrientation];
  if (v38 != [v6 imageOrientation] || v22) {
    goto LABEL_15;
  }
LABEL_16:
  if (v22)
  {
    BOOL v29 = [(UIView *)self _wantsAutolayout];
    long long v30 = [(UIView *)self superview];
    uint64_t v31 = v30;
    if (v29) {
      [v30 setNeedsLayout];
    }
    else {
      [v30 _alignmentRectInsetsHaveChangedForChildImageView:self];
    }
  }
  [(UIImageView *)self _clearPretiledImageCacheForImage:v6];
  [(UIImageView *)self _updatePretiledImageCacheForImage:v7];
  if ([(UIImageView *)self _animatesContents])
  {
    [(UIImageView *)self _updateState];
  }
  else
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __52__UIImageView__updateImageViewForOldImage_newImage___block_invoke;
    v48[3] = &unk_1E52D9F70;
    v48[4] = self;
    +[UIView performWithoutAnimation:v48];
  }
  [(UIImageView *)self _updateVisibilityAndFrameOfPlaceholderView];
  [(UIImageView *)self _updateTemplateProperties];
  id v40 = [(UIImageView *)self _currentImage];
  if (v40)
  {
    [(UIView *)self setOpaque:0];
  }
  else
  {
    v41 = [(UIImageView *)self animationImages];
    if (v41)
    {
      [(UIView *)self setOpaque:0];
    }
    else
    {
      v46 = [(UIImageView *)self _currentHighlightedImage];
      if (v46)
      {
        [(UIView *)self setOpaque:0];
      }
      else
      {
        v47 = [(UIImageView *)self highlightedAnimationImages];
        [(UIView *)self setOpaque:v47 == 0];
      }
    }
  }
  [(UIImageView *)self _imageContentParametersDidChange];
  -[UIImageView _baselineOffsetParametersDidChangeHasBaselinePropertyChanged:](self, "_baselineOffsetParametersDidChangeHasBaselinePropertyChanged:", [v6 _hasBaseline] ^ objc_msgSend(v7, "_hasBaseline"));
}

- (void)_imageContentParametersDidChange
{
  uint64_t v3 = [(UIImageView *)self _imageContentGuideAllowingCreation:0];
  if (v3)
  {
    id v65 = v3;
    BOOL v4 = [(UIImageView *)self _currentImage];
    BOOL v5 = v4;
    if (!v4)
    {
      BOOL v5 = [(UIImageView *)self _currentHighlightedImage];
    }
    [(UIView *)self bounds];
    BOOL v8 = -[UIImageView _layoutForImage:inSize:](self, "_layoutForImage:inSize:", v5, v6, v7);
    [v8 contentInsets];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    if (!v4) {
    [(UIImageView *)self alignmentRectInsets];
    }
    double v18 = v10 - v17;
    double v20 = v12 - v19;
    double v22 = v14 - v21;
    double v24 = v16 - v23;
    uint64_t v25 = [(UIView *)self superview];
    uint64_t v26 = (void *)v25;
    if (v25 && (*(void *)(v25 + 96) & 0x1000000000000000) != 0)
    {
      double v63 = v22;
      long long v27 = [v65 _systemConstraints];
      long long v28 = [v27 objectAtIndexedSubscript:0];
      [v28 constant];
      double v62 = v29;
      long long v30 = [v65 _systemConstraints];
      uint64_t v31 = [v30 objectAtIndexedSubscript:1];
      [v31 constant];
      double v33 = v32;
      double v34 = [v65 _systemConstraints];
      double v35 = [v34 objectAtIndexedSubscript:2];
      [v35 constant];
      double v60 = v36;
      double v37 = [v65 _systemConstraints];
      uint64_t v38 = [v37 objectAtIndexedSubscript:3];
      [v38 constant];
      double v64 = v39;

      id v40 = [(UIView *)self _layoutEngine];
      self;
      [(UIView *)self bounds];
      double v42 = v41;
      double v61 = v43;
      [(UIView *)self _currentScreenScale];
      double v45 = 1.0 / v44;
      v46 = [(UIView *)self nsli_boundsWidthVariable];
      [v40 valueForVariable:v46];
      double v48 = v47;

      if ((round(vabdd_f64(v33, v20) - v45) == 0.0 || round(vabdd_f64(v64, v24) - v45) == 0.0)
        && round(vabdd_f64(v48 / 360.0, v42) - v45) == 0.0)
      {
        double v24 = v64;
        double v20 = v33;
      }
      double v22 = v63;
      CFTypeRef v49 = [(UIView *)self nsli_boundsHeightVariable];
      [v40 valueForVariable:v49];
      double v51 = v50;

      if ((round(vabdd_f64(v62, v18) - v45) == 0.0 || round(vabdd_f64(v60, v63) - v45) == 0.0)
        && round(vabdd_f64(v51 / 360.0, v61) - v45) == 0.0)
      {
        double v24 = v64;
        double v20 = v33;
      }
    }
    id v52 = [v65 _systemConstraints];
    unsigned int v53 = [v52 objectAtIndexedSubscript:0];

    [v53 setConstant:v18];
    v54 = [v65 _systemConstraints];
    BOOL v55 = [v54 objectAtIndexedSubscript:1];

    [v55 setConstant:v20];
    v56 = [v65 _systemConstraints];
    v57 = [v56 objectAtIndexedSubscript:2];

    [v57 setConstant:v22];
    unsigned int v58 = [v65 _systemConstraints];
    v59 = [v58 objectAtIndexedSubscript:3];

    [v59 setConstant:v24];
    uint64_t v3 = v65;
  }
}

- (id)_imageContentGuideAllowingCreation:(BOOL)a3
{
  BOOL v3 = a3;
  v19[4] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(_UIImageViewStorage *)self->_storage imageContentGuide];

  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    double v7 = objc_alloc_init(UILayoutGuide);
    [(UILayoutGuide *)v7 _setAllowsNegativeDimensions:1];
    [(UIView *)self addLayoutGuide:v7];
    [(UILayoutGuide *)v7 _setLockedToOwningView:1];
    [(UILayoutGuide *)v7 setIdentifier:@"UIImageViewImageContentGuide"];
    [(_UIImageViewStorage *)self->_storage setImageContentGuide:v7];
    BOOL v8 = (void *)MEMORY[0x1E4F5B268];
    double v9 = self;
    double v10 = [v8 constraintWithItem:v7 attribute:3 relatedBy:0 toItem:v9 attribute:3];
    double v11 = [MEMORY[0x1E4F5B268] constraintWithItem:v7 attribute:1 relatedBy:0 toItem:v9 attribute:1];
    double v12 = [MEMORY[0x1E4F5B268] constraintWithItem:v9 attribute:4 relatedBy:0 toItem:v7 attribute:4];
    double v13 = [MEMORY[0x1E4F5B268] constraintWithItem:v9 attribute:2 relatedBy:0 toItem:v7 attribute:2];
    [v10 setIdentifier:@"UIImageView-imageContentGuide-top-constraint"];
    [v11 setIdentifier:@"UIImageView-imageContentGuide-left-constraint"];
    [v12 setIdentifier:@"UIImageView-imageContentGuide-bottom-constraint"];
    [v13 setIdentifier:@"UIImageView-imageContentGuide-right-constraint"];
    v19[0] = v10;
    v19[1] = v11;
    v19[2] = v12;
    v19[3] = v13;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
    [(UILayoutGuide *)v7 _setSystemConstraints:v14];

    [(UIImageView *)v9 _imageContentParametersDidChange];
    double v15 = (void *)MEMORY[0x1E4F5B268];
    double v16 = [(UILayoutGuide *)v7 _systemConstraints];
    [v15 activateConstraints:v16];
  }
  double v17 = [(_UIImageViewStorage *)self->_storage imageContentGuide];
  return v17;
}

- (void)_updatePretiledImageCacheForImage:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && [v4 _isResizable] && (objc_msgSend(v5, "_representsLayeredImage") & 1) == 0)
  {
    [(UIView *)self bounds];
    double v7 = v6;
    double v9 = v8;
    id v10 = v5;
    if (qword_1EB264FF8 != -1) {
      dispatch_once(&qword_1EB264FF8, &__block_literal_global_46_5);
    }
    if (!_MergedGlobals_1323
      || (id v11 = v10, ![v11 CGImage])
      || !objc_msgSend(v11, "_isTiledWhenStretchedToSize:", v7, v9)
      || ([v11 size], v13 = v12, double v15 = v14, objc_msgSend(v11, "capInsets"), v19 == 0.0)
      && v16 == 0.0
      && v18 == 0.0
      && v17 == 0.0
      && ((unint64_t)v13 & ((unint64_t)v13 - 1)) == 0
      && ((unint64_t)v15 & ((unint64_t)v15 - 1)) == 0
      || ([v11 capInsets], (int)(v7 * v9 / ((v13 - v20 - v21) * (v15 - v22 - v23))) <= 255))
    {

LABEL_17:
      [(UIImageView *)self _clearPretiledImageCacheForImage:v10];
      goto LABEL_18;
    }
    double v24 = pretiledSizeForImage(v11, v7);
    double v26 = v25;

    if (v24 <= v13 && v26 <= v15) {
      goto LABEL_17;
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v27 = objc_msgSend(v11, "images", 0);
    uint64_t v28 = [v27 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v52 != v30) {
            objc_enumerationMutation(v27);
          }
          [(UIImageView *)self _updatePretiledImageCacheForImage:*(void *)(*((void *)&v51 + 1) + 8 * i)];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v29);
    }

    [(UIView *)self bounds];
    double v33 = pretiledSizeForImage(v11, v32);
    double v35 = v34;
    double v36 = +[_UIImageViewPretiledImageCacheKey cacheKeyWithOriginalImage:pretiledSize:](_UIImageViewPretiledImageCacheKey, "cacheKeyWithOriginalImage:pretiledSize:", v11);
    double v37 = objc_getAssociatedObject(self, v11);
    if (v37
      || ([(id)qword_1EB264FE8 objectForKey:v36],
          (double v37 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v38 = [v37 pretiledImage];
      [v38 size];
      double v40 = v39;
      double v42 = v41;

      if ((v33 < v40 || v35 <= v42) && (v33 <= v40 || v35 < v42)) {
        goto LABEL_43;
      }
      [(UIImageView *)self _clearPretiledImageCacheForImage:v11];
    }
    id v43 = v11;
    double v44 = v43;
    if (v33 == 0.0 || v35 == 0.0)
    {
    }
    else
    {
      double v45 = [v43 imageRendererFormat];
      [v45 setOpaque:0];
      v46 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v45, v33, v35);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __pretiledImageForImage_block_invoke;
      v55[3] = &unk_1E52ECB28;
      id v56 = v44;
      double v57 = v33;
      double v58 = v35;
      id v47 = v44;
      double v48 = [(UIGraphicsImageRenderer *)v46 imageWithActions:v55];
      [v47 capInsets];
      CFTypeRef v49 = objc_msgSend(v48, "resizableImageWithCapInsets:");
      double v50 = objc_msgSend(v49, "imageWithRenderingMode:", objc_msgSend(v47, "renderingMode"));

      if (v50)
      {
        if (qword_1EB264FF0 != -1) {
          dispatch_once(&qword_1EB264FF0, &__block_literal_global_656);
        }
        double v37 = +[_UIImageViewPretiledImageWrapper cacheValueWithPretiledImage:v50 cacheKey:v36];
        [(id)qword_1EB264FE8 setObject:v37 forKey:v36];

        goto LABEL_43;
      }
    }
    double v37 = 0;
LABEL_43:
    objc_setAssociatedObject(self, v11, v37, (void *)1);
  }
LABEL_18:
}

- (id)_cachedPretiledImageForImage:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && [v4 _isResizable])
  {
    double v6 = objc_getAssociatedObject(self, v5);
    double v7 = [v6 pretiledImage];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (void)_clearPretiledImageCacheForImage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (qword_1EB264FF8 == -1)
  {
    if (!v4) {
      goto LABEL_13;
    }
  }
  else
  {
    dispatch_once(&qword_1EB264FF8, &__block_literal_global_46_5);
    if (!v5) {
      goto LABEL_13;
    }
  }
  if (_MergedGlobals_1323 && [v5 _isResizable])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v6 = objc_msgSend(v5, "images", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [(UIImageView *)self _clearPretiledImageCacheForImage:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    objc_getAssociatedObject(self, v5);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, v5, 0, (void *)1);
  }
LABEL_13:
}

- (void)_updateMasking
{
  if ([(UIImageView *)self _masksTemplateImages])
  {
    id v11 = [(UIView *)self layer];
    BOOL v3 = [v11 compositingFilter];
    id v4 = v3;
    BOOL v5 = (void *)MEMORY[0x1E4F3A370];
    if (v3)
    {
      double v6 = [v3 type];
      int v7 = [v6 isEqualToString:*v5];
    }
    else
    {
      int v7 = 0;
    }
    uint64_t v8 = [(UIImageView *)self _activeImage];
    BOOL v9 = [(UIImageView *)self _shouldTreatImageAsTemplate:v8];

    if ((v7 & 1) != 0 || !v9)
    {
      if (((v7 ^ 1 | v9) & 1) == 0) {
        [v11 setCompositingFilter:0];
      }
    }
    else
    {
      id v10 = [MEMORY[0x1E4F39BC0] filterWithType:*v5];
      [v11 setCompositingFilter:v10];
    }
  }
}

- (BOOL)_masksTemplateImages
{
  return [(_UIImageViewStorage *)self->_storage masksTemplateImages];
}

- (void)setHighlightedAnimationImages:(NSArray *)highlightedAnimationImages
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = highlightedAnimationImages;
  if ([(UIImageView *)self isHighlighted] && [(UIImageView *)self isAnimating]) {
    [(UIImageView *)self stopAnimating];
  }
  BOOL v5 = [(_UIImageViewStorage *)self->_storage highlightedAnimationImages];
  double v6 = v4;
  int v7 = v6;
  if (v5 == v6)
  {

    goto LABEL_27;
  }
  if (v6 && v5)
  {
    char v8 = [(NSArray *)v5 isEqual:v6];

    if (v8) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  BOOL v9 = [(_UIImageViewStorage *)self->_storage highlightedAnimationImages];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        [(UIImageView *)self _clearPretiledImageCacheForImage:*(void *)(*((void *)&v32 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v11);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v14 = v7;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        -[UIImageView _updatePretiledImageCacheForImage:](self, "_updatePretiledImageCacheForImage:", *(void *)(*((void *)&v28 + 1) + 8 * j), (void)v28);
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v16);
  }

  double v19 = (void *)[(NSArray *)v14 copy];
  [(_UIImageViewStorage *)self->_storage setHighlightedAnimationImages:v19];

  double v20 = [(_UIImageViewStorage *)self->_storage animationImages];
  uint64_t v21 = [v20 count];

  if (!v21) {
    [(UIView *)self invalidateIntrinsicContentSize];
  }
LABEL_27:
  if ([(UIImageView *)self isHighlighted]) {
    [(UIImageView *)self _updateState];
  }
  double v22 = [(UIImageView *)self _currentImage];
  if (!v22)
  {
    double v22 = [(_UIImageViewStorage *)self->_storage animationImages];
    if (![v22 count])
    {
      uint64_t v23 = [(NSArray *)v7 count];

      if (!v23) {
        goto LABEL_34;
      }
      double v22 = [(NSArray *)v7 objectAtIndex:0];
      [v22 scale];
      -[UIImageView setContentScaleFactor:](self, "setContentScaleFactor:");
    }
  }

LABEL_34:
  double v24 = [(UIImageView *)self _currentImage];
  if (v24)
  {
    [(UIView *)self setOpaque:0];
  }
  else
  {
    double v25 = [(UIImageView *)self animationImages];
    if (v25)
    {
      [(UIView *)self setOpaque:0];
    }
    else
    {
      double v26 = [(UIImageView *)self _currentHighlightedImage];
      if (v26)
      {
        [(UIView *)self setOpaque:0];
      }
      else
      {
        long long v27 = [(UIImageView *)self highlightedAnimationImages];
        [(UIView *)self setOpaque:v27 == 0];
      }
    }
  }
}

- (void)setAnimationRepeatCount:(NSInteger)animationRepeatCount
{
  if ([(UIImageView *)self isAnimating]) {
    [(UIImageView *)self stopAnimating];
  }
  storage = self->_storage;
  [(_UIImageViewStorage *)storage setAnimationRepeatCount:animationRepeatCount];
}

- (void)setAnimationDuration:(NSTimeInterval)animationDuration
{
  if ([(UIImageView *)self isAnimating]) {
    [(UIImageView *)self stopAnimating];
  }
  storage = self->_storage;
  [(_UIImageViewStorage *)storage setAnimationDuration:animationDuration];
}

- (void)startAnimating
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([(UIImageView *)self isAnimating]) {
    return;
  }
  BOOL v3 = [(UIImageView *)self isHighlighted];
  storage = self->_storage;
  if (!v3) {
    goto LABEL_6;
  }
  BOOL v5 = [(_UIImageViewStorage *)storage highlightedAnimationImages];
  if (!v5)
  {
    double v6 = [(UIImageView *)self _currentHighlightedImage];

    if (v6) {
      return;
    }
    storage = self->_storage;
LABEL_6:
    BOOL v5 = [(_UIImageViewStorage *)storage animationImages];
    if (!v5) {
      return;
    }
  }
  uint64_t v7 = [v5 count];
  if ([(_UIImageViewStorage *)self->_storage animationRepeatCount] < 1) {
    float v8 = 2147500000.0;
  }
  else {
    float v8 = (float)[(_UIImageViewStorage *)self->_storage animationRepeatCount];
  }
  [(_UIImageViewStorage *)self->_storage animationDuration];
  if (v9 == 0.0)
  {
    double v11 = (double)v7 / 30.0;
  }
  else
  {
    [(_UIImageViewStorage *)self->_storage animationDuration];
    double v11 = v10;
  }
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(id *)(*((void *)&v32 + 1) + 8 * i);
        double v19 = -[UIImageView _cachedPretiledImageForImage:](self, "_cachedPretiledImageForImage:", v18, (void)v32);
        double v20 = v19;
        if (v19)
        {
          id v21 = v19;

          id v18 = v21;
        }
        id v22 = v18;
        objc_msgSend(v12, "addObject:", objc_msgSend(v22, "CGImage"));
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v15);
  }

  id v23 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  [v23 setKeyPath:@"contents"];
  [v23 setValues:v12];
  uint64_t v24 = *MEMORY[0x1E4F39D78];
  [v23 setCalculationMode:*MEMORY[0x1E4F39D78]];
  *(float *)&double v25 = v8;
  [v23 setRepeatCount:v25];
  [v23 setDuration:v11];
  [v23 setDelegate:self->_storage];
  uint64_t v26 = *MEMORY[0x1E4F39FA8];
  [v23 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v23 setRemovedOnCompletion:0];
  long long v27 = [(UIView *)self layer];
  [v27 addAnimation:v23 forKey:@"contents"];
  id v28 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  [v28 setKeyPath:@"contentsMultiplyColor"];
  id v29 = +[UIColor whiteColor];
  uint64_t v36 = [v29 CGColor];
  long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  [v28 setValues:v30];

  [v28 setCalculationMode:v24];
  *(float *)&double v31 = v8;
  [v28 setRepeatCount:v31];
  [v28 setDuration:v11];
  [v28 setFillMode:v26];
  [v28 setRemovedOnCompletion:0];
  [v27 addAnimation:v28 forKey:@"contentsMultiplyColor"];
  [v27 setContentsSwizzle:*MEMORY[0x1E4F3A428]];
}

- (double)_baselineOffsetFromBottom
{
  BOOL v3 = [(UIImageView *)self _currentImage];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIImageView *)self _currentHighlightedImage];
  }
  double v6 = v5;

  if ([v6 hasBaseline])
  {
    [(UIView *)self bounds];
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    double width = v21.size.width;
    double height = v21.size.height;
    CGFloat v11 = CGRectGetWidth(v21);
    uint64_t v12 = (double *)MEMORY[0x1E4F5B220];
    if ((v11 <= *MEMORY[0x1E4F5B220]
       || (v22.origin.CGFloat x = x,
           v22.origin.CGFloat y = y,
           v22.size.double width = width,
           v22.size.double height = height,
           CGRectGetHeight(v22) <= *v12))
      && (*(_WORD *)&self->_imageViewFlags & 0x200) != 0)
    {
      double previousBaselineOffsetFromBottom = self->_previousBaselineOffsetFromBottom;
    }
    else
    {
      id v13 = -[UIImageView _layoutForImage:inSize:cachePerSize:forBaselineOffset:](self, "_layoutForImage:inSize:cachePerSize:forBaselineOffset:", v6, 0, 1, width, height);
      [v13 baselineOffsetFromBottom];
      double v15 = v14;
      [(UIImageView *)self alignmentRectInsets];
      double previousBaselineOffsetFromBottom = v15 - v16;
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)UIImageView;
    [(UIView *)&v20 _baselineOffsetFromBottom];
    double previousBaselineOffsetFromBottom = v18;
  }

  return previousBaselineOffsetFromBottom;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(UIImageView *)self _currentImage];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(UIImageView *)self _currentHighlightedImage];
  }
  double v9 = v8;

  if ([v9 hasBaseline])
  {
    -[UIImageView _layoutForImage:inSize:cachePerSize:forBaselineOffset:](self, "_layoutForImage:inSize:cachePerSize:forBaselineOffset:", v9, 1, 1, width, height);
    double v10 = (double *)objc_claimAutoreleasedReturnValue();
    [(UIImageView *)self alignmentRectInsets];
    double v13 = v12;
    if (v10) {
      double v14 = v10[9];
    }
    else {
      double v14 = 0.0;
    }
    double v15 = v14 - v11;
    [v10 baselineOffsetFromBottom];
    double v17 = v16 - v13;
  }
  else
  {
    double v15 = 2.22507386e-308;
    double v17 = 2.22507386e-308;
  }

  double v18 = v15;
  double v19 = v17;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (UIImageView)initWithCoder:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)UIImageView;
  id v5 = [(UIView *)&v61 initWithCoder:v4];
  double v6 = v5;
  if (v5)
  {
    _UIImageViewCommonInit(v5);
    uint64_t v7 = [v4 decodeObjectForKey:@"UIImage"];
    if (v7)
    {
      id v8 = [(UIView *)v6 layer];
      [v8 contentsCenter];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;

      _setContentStretchForImage(v6, v7);
      double v17 = [(UIView *)v6 layer];
      [v17 contentsCenter];
      v63.origin.CGFloat x = v18;
      v63.origin.CGFloat y = v19;
      v63.size.double width = v20;
      v63.size.double height = v21;
      v62.origin.CGFloat x = v10;
      v62.origin.CGFloat y = v12;
      v62.size.double width = v14;
      v62.size.double height = v16;
      BOOL v22 = CGRectEqualToRect(v62, v63);

      if (!v22)
      {
        id v23 = [(UIView *)v6 layer];
        objc_msgSend(v23, "setContentsCenter:", v10, v12, v14, v16);
      }
    }
    uint64_t v24 = [v4 decodeObjectForKey:@"UIHighlightedImage"];
    double v25 = [v4 decodeObjectForKey:@"UIAnimationImages"];
    uint64_t v26 = [v4 decodeObjectForKey:@"UIHighlightedAnimationImages"];
    [v4 decodeDoubleForKey:@"UIAnimationDuration"];
    double v28 = v27;
    uint64_t v59 = [v4 decodeIntegerForKey:@"UIAnimationRepeatCount"];
    uint64_t v29 = [v4 decodeBoolForKey:@"UIHighlighted"];
    uint64_t v30 = [v4 decodeBoolForKey:@"UIAdjustsImageSizeForAccessibilityContentSizeCategory"];
    uint64_t v31 = [v4 decodeObjectForKey:@"UIPreferredSymbolConfiguration"];
    [(_UIImageViewStorage *)v6->_storage setImage:v7];
    uint64_t v60 = (void *)v24;
    [(_UIImageViewStorage *)v6->_storage setHighlightedImage:v24];
    long long v32 = (void *)[v25 copy];
    [(_UIImageViewStorage *)v6->_storage setAnimationImages:v32];

    long long v33 = (void *)[v26 copy];
    [(_UIImageViewStorage *)v6->_storage setHighlightedAnimationImages:v33];

    [(_UIImageViewStorage *)v6->_storage setAnimationDuration:v28];
    [(_UIImageViewStorage *)v6->_storage setAnimationRepeatCount:v59];
    [(_UIImageViewStorage *)v6->_storage setHighlighted:v29];
    [(_UIImageViewStorage *)v6->_storage setAdjustsImageSizeForAccessibilityContentSizeCategory:v30];
    long long v34 = (void *)v31;
    [(_UIImageViewStorage *)v6->_storage setPreferredSymbolConfiguration:v31];
    if (!v7) {
      goto LABEL_23;
    }
    id v35 = v7;
    uint64_t v36 = [v35 CIImage];

    if (v36)
    {
      int v37 = [v35 _representsCIImageWhichSupportsIOSurfaceRendering];

      if (!v37)
      {
LABEL_22:
        [v35 scale];
        -[UIImageView setContentScaleFactor:](v6, "setContentScaleFactor:");
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
    }
    if (dyld_program_sdk_at_least())
    {
      [(UIView *)v6 bounds];
      double v40 = -[UIImageView _layoutForImage:inSize:](v6, "_layoutForImage:inSize:", v35, v38, v39);
      if ([v40 hasContents])
      {
        double v41 = [v40 contents];

        uint64_t v42 = (uint64_t)v41;
        if (v41)
        {
LABEL_16:
          id v43 = [(UIView *)v6 layer];
          [v43 setContents:v42];

          -[UIImageView _updateHDRFlags:](v6, "_updateHDRFlags:", [v35 isHighDynamicRange]);
          if ([v35 _isResizable])
          {
            [v35 _contentStretchInPixels];
            double v45 = v44;
            double v47 = v46;
            double v49 = v48;
            double v51 = v50;
            [v35 _sizeInPixels];
            double v53 = v52;
            double v55 = v54;
            [(UIView *)v6 bounds];
            -[UIView _setContentStretchInPixels:forContentSize:shouldTile:](v6, "_setContentStretchInPixels:forContentSize:shouldTile:", objc_msgSend(v35, "_isTiledWhenStretchedToSize:", v56, v57), v45, v47, v49, v51, v53, v55);
          }
          if (dyld_program_sdk_at_least()
            && [(UIImageView *)v6 _shouldTreatImageAsTemplate:v35])
          {
            [(UIImageView *)v6 _invalidateTemplateSettings];
          }

          goto LABEL_22;
        }
      }
      else
      {
      }
    }
    uint64_t v42 = [v35 CGImage];
    double v41 = 0;
    goto LABEL_16;
  }
LABEL_24:

  return v6;
}

- (id)_layoutForImage:(id)a3 inSize:(CGSize)a4
{
  return -[UIImageView _layoutForImage:inSize:cachePerSize:forBaselineOffset:](self, "_layoutForImage:inSize:cachePerSize:forBaselineOffset:", a3, 0, 0, a4.width, a4.height);
}

- (void)setAdjustsImageSizeForAccessibilityContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIImageViewStorage *)self->_storage adjustsImageSizeForAccessibilityContentSizeCategory] != a3)
  {
    [(_UIImageViewStorage *)self->_storage setAdjustsImageSizeForAccessibilityContentSizeCategory:v3];
    [(UIView *)self invalidateIntrinsicContentSize];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __120__UIImageView_UIAccessibilityContentSizeCategoryImageAdjusting__setAdjustsImageSizeForAccessibilityContentSizeCategory___block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    +[UIView performWithoutAnimation:v5];
  }
}

- (void)_invalidateTemplateSettings
{
  *(_WORD *)&self->_imageViewFlags |= 8u;
}

- (void)_setDefaultRenderingMode:(int64_t)a3
{
  if ([(_UIImageViewStorage *)self->_storage defaultRenderingMode] != a3)
  {
    [(_UIImageViewStorage *)self->_storage setDefaultRenderingMode:a3];
    [(UIImageView *)self _templateSettingsDidChange];
  }
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)UIImageView;
  [(UIView *)&v4 tintColorDidChange];
  BOOL v3 = [(UIImageView *)self _activeImage];
  if ([(UIImageView *)self _shouldTreatImageAsTemplate:v3]
    || [v3 isSymbolImage])
  {
    [(UIImageView *)self _updateState];
  }
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIImageView;
    [(UIView *)&v7 setTranslatesAutoresizingMaskIntoConstraints:1];
  }
  else
  {
    objc_super v4 = [(UIImageView *)self _currentImage];
    if (v4)
    {
      BOOL v5 = [(UIView *)self translatesAutoresizingMaskIntoConstraints];
    }
    else
    {
      double v6 = [(UIImageView *)self _currentHighlightedImage];
      if (v6) {
        BOOL v5 = [(UIView *)self translatesAutoresizingMaskIntoConstraints];
      }
      else {
        BOOL v5 = 0;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)UIImageView;
    [(UIView *)&v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (v5) {
      [(UIView *)self invalidateIntrinsicContentSize];
    }
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  UISemanticContentAttribute v5 = [(UIView *)self semanticContentAttribute];
  v8.receiver = self;
  v8.super_class = (Class)UIImageView;
  [(UIView *)&v8 setSemanticContentAttribute:a3];
  if (v5 != a3)
  {
    double v6 = [(UIImageView *)self image];
    int v7 = [v6 flipsForRightToLeftLayoutDirection];

    if (v7) {
      [(UIImageView *)self _invalidateImageLayouts];
    }
    else {
      [(UIImageView *)self _updateResolvedImages];
    }
    [(UIView *)self setNeedsDisplay];
  }
}

- (BOOL)_isHasBaselinePropertyChangeable
{
  return 1;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (![(UIImageView *)self isAnimating])
  {
    id v5 = v4;
    if (!CGColorEqualToColor((CGColorRef)[v5 CGColor], -[UIView _backgroundCGColor](self, "_backgroundCGColor")))
    {
      v8.receiver = self;
      v8.super_class = (Class)UIImageView;
      [(UIView *)&v8 setBackgroundColor:v5];
      double v6 = [(UIImageView *)self _currentImage];
      if (v6)
      {

LABEL_5:
        [(UIImageView *)self _updateState];
        goto LABEL_6;
      }
      if ([(UIImageView *)self isHighlighted])
      {
        int v7 = [(UIImageView *)self _currentHighlightedImage];

        if (v7) {
          goto LABEL_5;
        }
      }
    }
  }
LABEL_6:
}

- (void)_setGuardAgainstDegenerateBaselineCalculation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 imageViewFlags = *(_WORD *)&self->_imageViewFlags & 0xFDFF | v3;
}

- (double)_firstBaselineOffsetFromTop
{
  __int16 v3 = [(UIImageView *)self _currentImage];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIImageView *)self _currentHighlightedImage];
  }
  double v6 = v5;

  if ([v6 hasBaseline])
  {
    [(UIView *)self bounds];
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    double width = v21.size.width;
    double height = v21.size.height;
    CGFloat v11 = CGRectGetWidth(v21);
    double v12 = (double *)MEMORY[0x1E4F5B220];
    if (v11 <= *MEMORY[0x1E4F5B220]
      && (v22.origin.CGFloat x = x,
          v22.origin.CGFloat y = y,
          v22.size.double width = width,
          v22.size.double height = height,
          CGRectGetHeight(v22) <= *v12)
      && (*(_WORD *)&self->_imageViewFlags & 0x200) != 0)
    {
      double previousFirstBaselineOffsetFromTop = self->_previousFirstBaselineOffsetFromTop;
    }
    else
    {
      uint64_t v13 = -[UIImageView _layoutForImage:inSize:cachePerSize:forBaselineOffset:](self, "_layoutForImage:inSize:cachePerSize:forBaselineOffset:", v6, 0, 1, width, height);
      double v14 = (void *)v13;
      if (v13) {
        double v15 = *(double *)(v13 + 72);
      }
      else {
        double v15 = 0.0;
      }
      [(UIImageView *)self alignmentRectInsets];
      double previousFirstBaselineOffsetFromTop = v15 - v16;
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)UIImageView;
    [(UIView *)&v20 _firstBaselineOffsetFromTop];
    double previousFirstBaselineOffsetFromTop = v18;
  }

  return previousFirstBaselineOffsetFromTop;
}

- (id)_colorByApplyingDrawMode:(unsigned int)a3 toColor:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v29 = 0;
  double v27 = 0.0;
  double v28 = 0.0;
  int v7 = v6;
  if ([(UIImageView *)self _getDrawModeCompositeOperation:&v29 whiteComponent:&v28 drawingAlpha:&v27 forDrawMode:v4])
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (!self)
      {
        double v18 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
        }
      }
    }
    else if (!self)
    {
      CGFloat v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25E688) + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
    objc_super v8 = +[UITraitCollection _currentTraitCollectionIfExists]();
    double v9 = [(UIView *)self traitCollection];
    +[UITraitCollection setCurrentTraitCollection:v9];

    double v10 = (void *)_UISetCurrentFallbackEnvironment(self);
    double v25 = 0.0;
    *(double *)buf = 0.0;
    double v23 = 0.0;
    double v24 = 0.0;
    [v6 getRed:buf green:&v25 blue:&v24 alpha:&v23];
    _UIRestorePreviousFallbackEnvironment(v10);
    +[UITraitCollection setCurrentTraitCollection:v8];
    if (v29 == 8)
    {
      double v11 = 1.0 - v27;
      double v12 = v23 * (1.0 - v27);
      int v7 = v6;
      if (v12 <= 0.0)
      {
LABEL_13:

        goto LABEL_14;
      }
      double v13 = v11 * (v23 * *(double *)buf) / v12;
      double v14 = v11 * (v23 * v25) / v12;
      double v15 = v11 * (v23 * v24) / v12;
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        if (v29 != 5)
        {
          objc_super v20 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)uint64_t v30 = 67109120;
            int v31 = v29;
            _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "Unexpected CG blend mode: %d", v30, 8u);
          }
        }
      }
      else if (v29 != 5)
      {
        CGRect v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25E690) + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v30 = 67109120;
          int v31 = v29;
          _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Unexpected CG blend mode: %d", v30, 8u);
        }
      }
      int v7 = v6;
      if (v23 <= 0.0) {
        goto LABEL_13;
      }
      double v16 = v23 * (v28 * v27);
      double v13 = v16 + (1.0 - v27) * (v23 * *(double *)buf) / v23;
      double v14 = v16 + (1.0 - v27) * (v23 * v25) / v23;
      double v15 = v16 + (1.0 - v27) * (v23 * v24) / v23;
    }
    int v7 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v13, v14, v15);

    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

- (BOOL)_getDrawModeCompositeOperation:(int *)a3 whiteComponent:(double *)a4 drawingAlpha:(double *)a5 forDrawMode:(unsigned int)a6
{
  switch(a6)
  {
    case 1u:
      double v9 = +[UIColor lightGrayColor];
      int v10 = 8;
      double v11 = 0.5;
      goto LABEL_7;
    case 3u:
      double v9 = +[UIColor blackColor];
      int v10 = 5;
      double v11 = 0.3;
      goto LABEL_7;
    case 2u:
      double v9 = +[UIColor blackColor];
      int v10 = 5;
      double v11 = 0.466666667;
LABEL_7:
      [v9 getWhite:a4 alpha:0];

      *a5 = v11;
      *a3 = v10;
      return 1;
  }
  return 0;
}

- (BOOL)_hasBaseline
{
  __int16 v3 = [(UIImageView *)self _currentImage];
  uint64_t v4 = v3;
  if (v3)
  {
    char v5 = [v3 hasBaseline];
  }
  else
  {
    id v6 = [(UIImageView *)self _currentHighlightedImage];
    char v5 = [v6 hasBaseline];
  }
  return v5;
}

- (void)_setOverridingSymbolConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIImageViewStorage *)self->_storage overridingSymbolConfiguration];
  id v6 = v4;
  id v10 = v6;
  if (v5 == v6)
  {

    double v9 = v10;
LABEL_9:

    objc_super v8 = v10;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [v5 isEqual:v6];

  objc_super v8 = v10;
  if ((v7 & 1) == 0)
  {
LABEL_8:
    double v9 = [(UIImageView *)self _activeImage];
    [(_UIImageViewStorage *)self->_storage setOverridingSymbolConfiguration:v10];
    [(UIImageView *)self _invalidateResolvedImages];
    [(UIImageView *)self _resolveImagesWithPreviouslyDisplayedImage:v9];
    goto LABEL_9;
  }
LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedFrameGuide, 0);
  objc_storeStrong((id *)&self->_animationPresetManager, 0);
  objc_storeStrong((id *)&self->_lastResolvedImageViewTraitCollection, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)setHighlightedImage:(UIImage *)highlightedImage
{
  id v4 = highlightedImage;
  id v5 = [(_UIImageViewStorage *)self->_storage resolvedHighlightedImage];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(_UIImageViewStorage *)self->_storage highlightedImage];
  }
  objc_super v8 = v7;

  double v9 = [(_UIImageViewStorage *)self->_storage highlightedImage];
  double v16 = v4;
  id v10 = v9;
  if (v10 == v16)
  {
  }
  else
  {
    if (v16 && v10)
    {
      BOOL v11 = [(UIImage *)v16 isEqual:v10];

      if (v11) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    double v12 = [(_UIImageViewStorage *)self->_storage highlightedImage];

    if (v12)
    {
      double v13 = [(_UIImageViewStorage *)self->_storage highlightedImage];
      [(UIImageView *)self _clearPretiledImageCacheForImage:v13];
    }
    double v14 = [(_UIImageViewStorage *)self->_storage resolvedHighlightedImage];
    [(UIImageView *)self _clearPretiledImageCacheForImage:v14];

    [(UIImageView *)self _updatePretiledImageCacheForImage:v16];
    [(_UIImageViewStorage *)self->_storage setHighlightedImage:v16];
    [(_UIImageViewStorage *)self->_storage setResolvedHighlightedImage:0];
    *(_WORD *)&self->_imageViewFlags &= ~1u;
  }
LABEL_14:
  if ([(UIImageView *)self isHighlighted])
  {
    double v15 = [(UIImageView *)self _currentImage];

    if (!v15) {
      [(UIImageView *)self _updateImageViewForOldImage:v8 newImage:v16];
    }
  }
}

- (void)stopAnimating
{
  if ([(UIImageView *)self isAnimating])
  {
    __int16 v3 = [(UIView *)self layer];
    [v3 removeAnimationForKey:@"contents"];

    if (![(_UIImageViewStorage *)self->_storage animationRepeatCount])
    {
      [(UIImageView *)self _cleanUpForStopAnimating];
    }
  }
}

- (id)_currentAnimationKeyframeImage
{
  __int16 v3 = [(UIView *)self layer];
  id v4 = [v3 animationForKey:@"contents"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(UIView *)self layer],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 presentationLayer],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 contents],
        v6,
        v5,
        v7))
  {
    objc_super v8 = [v4 values];
    uint64_t v9 = [v8 indexOfObject:v7];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = 0;
    }
    else
    {
      unint64_t v11 = v9;
      if ([(UIImageView *)self isHighlighted])
      {
        double v12 = [(UIImageView *)self highlightedAnimationImages];
      }
      else
      {
        double v12 = 0;
      }
      if (![v12 count])
      {
        uint64_t v13 = [(UIImageView *)self animationImages];

        double v12 = (void *)v13;
      }
      if (v11 >= [v12 count])
      {
        id v10 = 0;
      }
      else
      {
        id v10 = [v12 objectAtIndex:v11];
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_cleanUpForStopAnimating
{
  [(UIImageView *)self _removeLayerAnimations];
  [(UIImageView *)self _updateState];
}

- (void)_removeLayerAnimations
{
  id v2 = [(UIView *)self layer];
  [v2 removeAnimationForKey:@"contents"];
  [v2 removeAnimationForKey:@"contentsMultiplyColor"];
}

- (UIImageView)initWithImage:(UIImage *)image
{
  id v4 = image;
  id v5 = v4;
  double v7 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v4 && ![(UIImage *)v4 _isDecompressing])
  {
    [(UIImage *)v5 size];
    double v7 = v8;
    double v6 = v9;
  }
  v13.receiver = self;
  v13.super_class = (Class)UIImageView;
  id v10 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, 0.0, 0.0, v7, v6);
  unint64_t v11 = v10;
  if (v10)
  {
    _UIImageViewCommonInit(v10);
    [(UIView *)v11 setUserInteractionEnabled:0];
    if ([(UIImage *)v5 _isDecompressing])
    {
      [(UIImageView *)v11 _setDecompressingImage:v5 forType:0];
      [(UIView *)v11 setNeedsLayout];
    }
    else
    {
      [(UIImageView *)v11 setImage:v5];
    }
  }

  return v11;
}

- (void)setHighlighted:(BOOL)highlighted
{
  BOOL v3 = highlighted;
  if ([(_UIImageViewStorage *)self->_storage isHighlighted] != highlighted)
  {
    [(_UIImageViewStorage *)self->_storage setHighlighted:v3];
    *(_WORD *)&self->_imageViewFlags &= ~1u;
    id v5 = [(UIImageView *)self _currentImage];
    BOOL v6 = [(UIImageView *)self _displayImageAsLayered:v5];

    if (v6)
    {
      id v7 = [(UIImageView *)self _layeredImageContainer];
      [v7 setPressed:v3];
    }
    else
    {
      if ([(UIImageView *)self isAnimating]) {
        [(UIImageView *)self stopAnimating];
      }
      [(UIImageView *)self _updateState];
      [(UIImageView *)self _updateTemplateProperties];
    }
  }
}

- (void)setPreferredImageDynamicRange:(UIImageDynamicRange)preferredImageDynamicRange
{
  __int16 v3 = preferredImageDynamicRange;
  if ([(UIImageView *)self preferredImageDynamicRange] != preferredImageDynamicRange)
  {
    uint64_t v5 = [(UIView *)self _deferredAnimationForKey:@"imageDynamicRange" ignoringKeyFrames:1];
    *(_WORD *)&self->___int16 imageViewFlags = *(_WORD *)&self->_imageViewFlags & 0xF3FF | ((v3 << 10) + 1024) & 0xC00;
    id v7 = (id)v5;
    if (v5)
    {
      BOOL v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[UIImageView imageDynamicRange](self, "imageDynamicRange"));
      [v7 addAnimationFrameForValue:v6];
    }
    else
    {
      [(UIImageView *)self _updateState];
    }
  }
}

- (UIImageDynamicRange)preferredImageDynamicRange
{
  return (((unint64_t)*(_WORD *)&self->_imageViewFlags >> 10) & 3) - 1;
}

- (Class)_intelligenceBaseClass
{
  sub_1853B985C(0, &qword_1E8FB7900);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id v10 = self;
  UIImageView._intelligenceCollectContent(in:collector:)((uint64_t)v9, x, y, width, height);
}

- (BOOL)isAccessibilityElementByDefault
{
  return 0;
}

- (unint64_t)defaultAccessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)UIImageView;
  return [&v3 defaultAccessibilityTraits] | 4;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 1;
}

- (void)_applySettingsForLegibilityStyle:(int64_t)a3
{
  id v4 = +[_UILegibilitySettings sharedInstanceForStyle:a3];
  if (v4) {
    uint64_t v5 = [v4 shadowCompositingFilterName];
  }
  else {
    uint64_t v5 = *MEMORY[0x1E4F3A2B8];
  }
  [(CALayer *)[(UIView *)self layer] setCompositingFilter:v5];
  BOOL v6 = [(UIView *)self layer];
  [(CALayer *)v6 setAllowsGroupBlending:0];
}

- (id)largeContentImage
{
  objc_super v3 = [(UIView *)self _largeContentStoredProperties];
  int v4 = [v3 didSetLargeContentImage];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIImageView;
    uint64_t v5 = [(UIView *)&v7 largeContentImage];
  }
  else
  {
    uint64_t v5 = [(UIImageView *)self image];
  }
  return v5;
}

- (BOOL)scalesLargeContentImage
{
  objc_super v3 = [(UIView *)self _largeContentStoredProperties];
  int v4 = [v3 didSetScalesLargeContentImage];

  if (!v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIImageView;
  return [(UIView *)&v6 scalesLargeContentImage];
}

- (void)_willBeginBeingDisplayedInPointerContentEffect
{
  v5.receiver = self;
  v5.super_class = (Class)UIImageView;
  [(UIView *)&v5 _willBeginBeingDisplayedInPointerContentEffect];
  objc_super v3 = [(UIImageView *)self image];
  int v4 = [v3 isSymbolImage];

  if (v4) {
    [(UIImageView *)self _setSuppressPixelAlignment:1];
  }
}

- (void)_didStopBeingDisplayedInPointerContentEffect
{
  v5.receiver = self;
  v5.super_class = (Class)UIImageView;
  [(UIView *)&v5 _didStopBeingDisplayedInPointerContentEffect];
  objc_super v3 = [(UIImageView *)self image];
  int v4 = [v3 isSymbolImage];

  if (v4) {
    [(UIImageView *)self _setSuppressPixelAlignment:0];
  }
}

- (NSString)description
{
  v34.receiver = self;
  v34.super_class = (Class)UIImageView;
  objc_super v3 = [(UIView *)&v34 description];
  int v4 = (void *)[v3 mutableCopy];

  objc_super v5 = objc_opt_new();
  objc_super v6 = [(UIImageView *)self _currentImage];
  objc_super v7 = _UIImageName(v6);
  double v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  id v10 = [v6 content];
  unint64_t v11 = [v10 typeName];
  if (v7)
  {
    double v12 = [NSString stringWithFormat:@"\"%@\"", v7];
  }
  else
  {
    double v12 = @"anonymous";
  }
  [v6 size];
  uint64_t v14 = v13;
  [v6 size];
  uint64_t v16 = v15;
  double v17 = [v6 content];
  [v17 scale];
  objc_msgSend(v5, "appendFormat:", @"; image = <%@:%p %@ %@; (%0.0f %0.0f)@%0.f",
    v9,
    v6,
    v11,
    v12,
    v14,
    v16,
    v18);

  if (v7) {
  CGFloat v19 = [v6 content];
  }
  [v19 vectorScale];
  double v21 = v20;
  CGRect v22 = [v6 content];
  [v22 scale];
  double v24 = v23;

  if (v21 != v24)
  {
    double v25 = [v6 content];
    [v25 vectorScale];
    objc_msgSend(v5, "appendFormat:", @"{%0.0f}", v26);
  }
  double v27 = [v6 content];
  if ([v27 isVectorGlyph])
  {
    double v28 = [v6 content];
    [v28 variableValue];
    double v30 = v29;

    if (v30 == INFINITY) {
      goto LABEL_12;
    }
    double v27 = [v6 content];
    [v27 variableValue];
    [v5 appendFormat:@", value=%0.0f", v31];
  }

LABEL_12:
  [v5 appendString:@">; layer ="];
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"; layer =",
    v5,
    0,
    0,
    [v4 length]);
  uint64_t v32 = (void *)[v4 copy];

  return (NSString *)v32;
}

void __41__UIImageView__applyImageLayout_toLayer___block_invoke(uint64_t a1)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  int v4 = (void *)v2[59];
  objc_super v5 = [v2 image];
  objc_super v6 = [v4 pendingSymbolContentTransitionForSettingSymbolImage:v5];

  if (v3 == v6)
  {
    objc_super v7 = [*(id *)(a1 + 40) _currentImage];
    double v8 = [*(id *)(a1 + 32) symbolContentTransition];
    id v9 = [*(id *)(a1 + 32) options];
    id v10 = [*(id *)(a1 + 32) completionHandler];
    objc_initWeak(&location, *(id *)(a1 + 40));
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    double v24 = __41__UIImageView__applyImageLayout_toLayer___block_invoke_2;
    double v25 = &unk_1E530F9C8;
    objc_copyWeak(&v28, &location);
    id v12 = v8;
    id v26 = v12;
    id v13 = v10;
    id v27 = v13;
    uint64_t v14 = objc_msgSend(v12, "ui_animationConfigurationFromSymbolImage:toSymbolImage:options:completion:", v11, v7, v9, &v22);
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 472), "activatePendingSymbolContentTransition:", *(void *)(a1 + 32), v22, v23, v24, v25);
    uint64_t v15 = [*(id *)(a1 + 56) animator];
    uint64_t v16 = [v14 animation];
    double v17 = [v14 options];
    [v15 addAnimation:v16 options:v17];

    uint64_t v18 = *(void **)(a1 + 40);
    [v18 bounds];
    double v21 = objc_msgSend(v18, "_layoutForImage:inSize:", v7, v19, v20);
    [*(id *)(a1 + 40) _setupSymbolLayerForCurrentSymbolImageLayout:v21];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

void __41__UIImageView__applyImageLayout_toLayer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_super v6 = WeakRetained;
    [WeakRetained[59] activeSymbolContentTransitionDidComplete:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 40))
    {
      id v5 = +[UISymbolEffectCompletionContext _new];
      [v5 setFinished:a2];
      [v5 setSender:v6];
      [v5 setContentTransition:*(void *)(a1 + 32)];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    [v6 _updateStateIfRBSymbolLayerNoLongerNeeded];
    WeakRetained = v6;
  }
}

- (void)_setupSymbolLayerForCurrentSymbolImageLayout:(id)a3
{
  animationPresetManager = self->_animationPresetManager;
  id v5 = a3;
  [(_UIImageViewSymbolAnimationPresetManager *)animationPresetManager discardPendingSymbolContentTransitions];
  [(UIImageView *)self _setupRBSymbolLayerWithSymbolImageLayout:v5];

  objc_super v6 = self->_animationPresetManager;
  [(_UIImageViewSymbolAnimationPresetManager *)v6 activatePendingSymbolEffects];
}

- (void)_setupRBSymbolLayerWithSymbolImageLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(UIImageView *)self _rbSymbolLayer];
  objc_super v6 = v5;
  if (v5)
  {
    objc_super v7 = [v5 animator];

    if (v7)
    {
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      [v4 contentsSize];
      double v9 = v8;
      double v11 = v10;
      [(UIView *)self bounds];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      objc_msgSend(v6, "setBounds:");
      double v20 = *MEMORY[0x1E4F1DAD8];
      double v21 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      objc_msgSend(v6, "setPosition:", *MEMORY[0x1E4F1DAD8], v21);
      [v4 contentsScaleFactor];
      objc_msgSend(v6, "setContentsScale:");
      [v4 contentsScaleFactor];
      objc_msgSend(v6, "setRasterizationScale:");
      [MEMORY[0x1E4F39CF8] setDisableActions:0];
      uint64_t v22 = [v4 rbSymbolConfiguration];
      uint64_t v23 = v22;
      if (v22)
      {
        double v57 = v21;
        double v54 = v20;
        double v24 = (void (**)(id, void *))*(id *)(v22 + 24);
        double v25 = [v4 contentsMultiplyColor];
        id v26 = v24[2](v24, v25);
        [v6 setStyleResolver:v26];

        id WeakRetained = objc_loadWeakRetained((id *)(v23 + 16));
        id v28 = [v6 animator];
        [v28 setGlyph:WeakRetained];

        uint64_t v29 = *(unsigned int *)(v23 + 8);
        double v30 = [v6 animator];
        [v30 setRenderingMode:v29];

        double v31 = v9;
        double v32 = *(double *)(v23 + 32);
        long long v33 = [v6 animator];
        [v33 setVariableValue:v32];

        uint64_t v34 = [v4 symbolLayerNeedsHorizontalFlip];
        id v35 = [v6 animator];
        [v35 setFlipsRightToLeft:v34];

        uint64_t v36 = MEMORY[0x1E4F1DAB8];
        CGFloat v37 = *MEMORY[0x1E4F1DAB8];
        long long v55 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 24);
        CGFloat v38 = *(double *)(MEMORY[0x1E4F1DAB8] + 40);
        LayerContentModeTransform([(UIView *)self contentMode], (uint64_t)&t2, v13, v15, v17, v19, v31, v11);
        t1.CGFloat a = v37;
        *(_OWORD *)&t1.b = *(_OWORD *)(v36 + 8);
        *(_OWORD *)&t1.double d = v55;
        t1.tdouble y = v38;
        CGAffineTransformConcat(&v61, &t1, &t2);
        long long v62 = *(_OWORD *)&v61.b;
        long long v39 = *(_OWORD *)&v61.d;
        CGFloat a = v61.a;
        tdouble y = v61.ty;
        if (v4)
        {
          long long v56 = *(_OWORD *)&v61.d;
          [v4 symbolLayerPositionTransform];
          long long v39 = v56;
        }
        else
        {
          memset(&v58, 0, sizeof(v58));
        }
        t1.CGFloat a = a;
        *(_OWORD *)&t1.b = v62;
        *(_OWORD *)&t1.double d = v39;
        t1.tdouble y = ty;
        CGAffineTransformConcat(&v61, &t1, &v58);
        double v42 = v61.a;
        double d = v61.d;
        tdouble x = v61.tx;
        double v45 = v61.ty;
        double v46 = [v6 animator];
        objc_msgSend(v46, "setTransform:", v42, d, tx, v45);

        double v47 = [(UIImageView *)self _effectiveSymbolContentTransitionContainerView];
        if (v47)
        {
          -[UIView convertPoint:toView:](self, "convertPoint:toView:", v47, v54, v57);
          double v49 = v48;
          double v51 = v50;
          double v52 = [v6 animator];
          objc_msgSend(v52, "setPosition:", v49, v51);

          double v53 = [v6 animator];
          objc_msgSend(v53, "setPresentationPosition:", v49, v51);
        }
      }
    }
  }
}

- (BOOL)_setImageViewContentsForAnimatedImage:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat v38 = [(UIView *)self layer];
  [(UIView *)self bounds];
  long long v39 = v4;
  id v5 = [v4 images];
  objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  double v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v44 = (id)*MEMORY[0x1E4F3A428];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v45 = *(void *)v53;
    double v40 = (void *)*MEMORY[0x1E4F3A420];
    double v9 = 0.0;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v53 != v45) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v52 + 1) + 8 * v10);
        id v12 = [MEMORY[0x1E4F1CA98] null];

        if (v11 != v12)
        {
          double v13 = [(UIImageView *)self _cachedPretiledImageForImage:v11];
          double v14 = v13;
          if (v13)
          {
            id v15 = v13;

            id v11 = v15;
          }
          [(UIView *)self bounds];
          +[_UIImageContentLayout layoutForSource:inTarget:withSize:](_UIImageContentLayout, "layoutForSource:inTarget:withSize:", v11, self, v16, v17);
          double v18 = objc_claimAutoreleasedReturnValue();
          double v19 = v18;
          if (v18)
          {
            -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)v18);
            if (v19[1]) {
              uint64_t v20 = v19[4];
            }
            else {
              uint64_t v20 = 0;
            }
            double v21 = v6;
            [v6 addObject:v20];
            uint64_t v22 = (void *)MEMORY[0x1E4F29238];
            [v19 contentsTransform];
          }
          else
          {
            double v21 = v6;
            [v6 addObject:0];
            uint64_t v22 = (void *)MEMORY[0x1E4F29238];
            memset(v51, 0, sizeof(v51));
          }
          uint64_t v23 = [v22 valueWithCGAffineTransform:v51];
          [v43 addObject:v23];

          double v24 = +[UIColor whiteColor];
          double v25 = [v19 contentsMultiplyColor];

          if (v25)
          {
            id v26 = [v19 contentsMultiplyColor];

            double v24 = v44;
            id v44 = v40;
          }
          else
          {
            id v26 = +[UIColor whiteColor];
          }

          id v27 = v26;
          objc_msgSend(v42, "addObject:", objc_msgSend(v27, "CGColor"));

          if (v9 == 0.0)
          {
            [v19 contentsScaleFactor];
            double v9 = v28;
          }

          objc_super v6 = v21;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v29 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
      uint64_t v8 = v29;
    }
    while (v29);
  }

  uint64_t v30 = [v6 count];
  if (v30)
  {
    [v39 duration];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__UIImageView__setImageViewContentsForAnimatedImage___block_invoke;
    aBlock[3] = &unk_1E530F9F0;
    aBlock[5] = v31;
    aBlock[4] = v38;
    double v32 = (void (**)(void *, __CFString *, __CFString *, void *))_Block_copy(aBlock);
    v32[2](v32, @"UIImageAnimationContents", @"contents", v6);
    v32[2](v32, @"UIImageAnimationContentsTransform", @"contentsTransform", v43);
    v32[2](v32, @"UIImageAnimationContentsMultiplyColor", @"contentsMultiplyColor", v42);
    long long v33 = v6;
    uint64_t v34 = [v6 firstObject];
    [v38 setContents:v34];

    id v35 = [v43 firstObject];
    uint64_t v36 = v35;
    if (v35)
    {
      [v35 CGAffineTransformValue];
    }
    else
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
    }
    v46[0] = v47;
    v46[1] = v48;
    v46[2] = v49;
    [v38 setContentsTransform:v46];

    objc_msgSend(v38, "setContentsMultiplyColor:", objc_msgSend(v42, "firstObject"));
    [v38 setContentsSwizzle:v44];
    _setContentStretchForImage(self, v39);

    objc_super v6 = v33;
  }

  return v30 != 0;
}

void __53__UIImageView__setImageViewContentsForAnimatedImage___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7 = (void *)MEMORY[0x1E4F39BD8];
  id v8 = a4;
  id v9 = a2;
  id v11 = [v7 animationWithKeyPath:a3];
  [v11 setValues:v8];

  [v11 setCalculationMode:*MEMORY[0x1E4F39D78]];
  LODWORD(v10) = 2139095039;
  [v11 setRepeatCount:v10];
  [v11 setDuration:*(double *)(a1 + 40)];
  [v11 setRemovedOnCompletion:0];
  [*(id *)(a1 + 32) addAnimation:v11 forKey:v9];
}

uint64_t __80__UIImageView__renditionForSource_size_symbolConfiguration_withRenditionResult___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (CGContext *)[a2 CGContext];
  CGContextSetBlendMode(v3, kCGBlendModeCopy);
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(v3, 1.0, -1.0);
  v9.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v9.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  v9.size.double width = *(CGFloat *)(a1 + 40);
  v9.size.double height = *(CGFloat *)(a1 + 48);
  CGContextDrawImage(v3, v9, *(CGImageRef *)(a1 + 56));
  id v4 = *(void **)(a1 + 32);
  double v5 = *(double *)(a1 + 40);
  double v6 = *(double *)(a1 + 48);
  return objc_msgSend(v4, "_renderDrawModeEffectInRect:", 0.0, 0.0, v5, v6);
}

uint64_t __80__UIImageView__renditionForSource_size_symbolConfiguration_withRenditionResult___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (void)_setNeedsUpdateState
{
  __int16 imageViewFlags = (__int16)self->_imageViewFlags;
  if ((imageViewFlags & 4) == 0)
  {
    *(_WORD *)&self->___int16 imageViewFlags = imageViewFlags | 4;
    objc_initWeak(&location, self);
    objc_super v3 = (void *)UIApp;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __35__UIImageView__setNeedsUpdateState__block_invoke;
    v4[3] = &unk_1E52DC308;
    objc_copyWeak(&v5, &location);
    [v3 _performBlockAfterCATransactionCommits:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __35__UIImageView__setNeedsUpdateState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[240] &= ~4u;
    id v2 = WeakRetained;
    [WeakRetained _updateState];
    id WeakRetained = v2;
  }
}

- (UIImageView)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
  double v6 = image;
  uint64_t v7 = highlightedImage;
  if (v6 && ![(UIImage *)v6 _isDecompressing])
  {
    double v10 = v6;
    goto LABEL_7;
  }
  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v7 && ![(UIImage *)v7 _isDecompressing])
  {
    double v10 = v7;
LABEL_7:
    [(UIImage *)v10 size];
    double v8 = v11;
    double v9 = v12;
  }
  v16.receiver = self;
  v16.super_class = (Class)UIImageView;
  double v13 = -[UIView initWithFrame:](&v16, sel_initWithFrame_, 0.0, 0.0, v8, v9);
  double v14 = v13;
  if (v13)
  {
    _UIImageViewCommonInit(v13);
    [(UIView *)v14 setUserInteractionEnabled:0];
    if ([(UIImage *)v6 _isDecompressing] || [(UIImage *)v7 _isDecompressing])
    {
      [(UIImageView *)v14 _setDecompressingImage:v6 forType:0];
      [(UIImageView *)v14 _setDecompressingImage:v7 forType:1];
      [(UIView *)v14 setNeedsLayout];
    }
    else
    {
      [(UIImageView *)v14 setImage:v6];
      [(UIImageView *)v14 setHighlightedImage:v7];
    }
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIImageView;
  [(UIView *)&v14 encodeWithCoder:v4];
  id v5 = [(UIImageView *)self image];
  if (v5) {
    [v4 encodeObject:v5 forKey:@"UIImage"];
  }
  double v6 = [(UIImageView *)self highlightedImage];
  if (v6) {
    [v4 encodeObject:v6 forKey:@"UIHighlightedImage"];
  }
  uint64_t v7 = [(_UIImageViewStorage *)self->_storage animationImages];

  if (v7)
  {
    double v8 = [(_UIImageViewStorage *)self->_storage animationImages];
    [v4 encodeObject:v8 forKey:@"UIAnimationImages"];
  }
  double v9 = [(_UIImageViewStorage *)self->_storage highlightedAnimationImages];

  if (v9)
  {
    double v10 = [(_UIImageViewStorage *)self->_storage highlightedAnimationImages];
    [v4 encodeObject:v10 forKey:@"UIHighlightedAnimationImages"];
  }
  [(_UIImageViewStorage *)self->_storage animationDuration];
  if (v11 != 0.0)
  {
    [(_UIImageViewStorage *)self->_storage animationDuration];
    objc_msgSend(v4, "encodeDouble:forKey:", @"UIAnimationDuration");
  }
  if ([(_UIImageViewStorage *)self->_storage animationRepeatCount]) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[_UIImageViewStorage animationRepeatCount](self->_storage, "animationRepeatCount"), @"UIAnimationRepeatCount");
  }
  if ([(_UIImageViewStorage *)self->_storage isHighlighted]) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"UIHighlighted", (double)-[_UIImageViewStorage isHighlighted](self->_storage, "isHighlighted"));
  }
  if ([(_UIImageViewStorage *)self->_storage adjustsImageSizeForAccessibilityContentSizeCategory])
  {
    objc_msgSend(v4, "encodeBool:forKey:", -[_UIImageViewStorage adjustsImageSizeForAccessibilityContentSizeCategory](self->_storage, "adjustsImageSizeForAccessibilityContentSizeCategory"), @"UIAdjustsImageSizeForAccessibilityContentSizeCategory");
  }
  double v12 = [(_UIImageViewStorage *)self->_storage preferredSymbolConfiguration];

  if (v12)
  {
    double v13 = [(_UIImageViewStorage *)self->_storage preferredSymbolConfiguration];
    [v4 encodeObject:v13 forKey:@"UIPreferredSymbolConfiguration"];
  }
}

- (BOOL)isTransparentFocusItem
{
  objc_super v3 = [(UIView *)self _focusBehavior];
  int v4 = [v3 supportsViewTransparency];

  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIImageView;
    if ([(UIView *)&v10 isTransparentFocusItem])
    {
      return 1;
    }
    else
    {
      double v6 = [(UIImageView *)self image];
      if (v6)
      {
        uint64_t v7 = [(UIImageView *)self image];
        char v5 = [v7 _probeIsSeeThrough];
      }
      else
      {
        char v5 = 1;
      }
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIImageView;
    return [(UIView *)&v9 isTransparentFocusItem];
  }
  return v5;
}

- (BOOL)_hasContentGravity
{
  return 1;
}

- (UILayoutGuide)imageContentGuide
{
  return (UILayoutGuide *)[(UIImageView *)self _imageContentGuideAllowingCreation:1];
}

- (id)midlineGuide
{
  return [(UIImageView *)self _imageContentGuideAllowingCreation:1];
}

- (BOOL)_suppressPixelAlignment
{
  return 1;
}

- (BOOL)_guardAgainstDegenerateBaselineCalculation
{
  return (*(_WORD *)&self->_imageViewFlags >> 9) & 1;
}

- (void)_setPreferredSymbolVariant:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIImageViewStorage *)self->_storage preferredSymbolVariant];
  id v6 = v4;
  id v10 = v6;
  if (v5 == v6)
  {

    objc_super v9 = v10;
LABEL_9:

    double v8 = v10;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [v5 isEqual:v6];

  double v8 = v10;
  if ((v7 & 1) == 0)
  {
LABEL_8:
    objc_super v9 = [(UIImageView *)self _activeImage];
    [(_UIImageViewStorage *)self->_storage setPreferredSymbolVariant:v10];
    [(UIImageView *)self _invalidateResolvedImages];
    [(UIImageView *)self _resolveImagesWithPreviouslyDisplayedImage:v9];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(UIImageView *)self _activeImage];
  id v13 = (id)v8;
  if (v8)
  {
    [(UIView *)self bounds];
    objc_msgSend(v13, "drawInRect:blendMode:alpha:", 17);
    uint64_t v8 = (uint64_t)v13;
  }
  if ([(UIImageView *)self _needsImageEffectsForImage:v8])
  {
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      id v10 = 0;
    }
    else {
      id v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    CGContextGetCompositeOperation();
    CGContextGetAlpha();
    CGFloat v12 = v11;
    -[UIImageView _renderDrawModeEffectInRect:](self, "_renderDrawModeEffectInRect:", x, y, width, height);
    CGContextSetCompositeOperation();
    CGContextSetAlpha(v10, v12);
  }
}

- (NSTimeInterval)animationDuration
{
  [(_UIImageViewStorage *)self->_storage animationDuration];
  return result;
}

- (NSInteger)animationRepeatCount
{
  return [(_UIImageViewStorage *)self->_storage animationRepeatCount];
}

- (id)_initialValueForKey:(id)a3
{
  id v4 = a3;
  if ([@"imageDynamicRange" isEqualToString:v4])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[UIImageView imageDynamicRange](self, "imageDynamicRange"));
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIImageView;
    uint64_t v5 = [(UIView *)&v8 _initialValueForKey:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

- (void)_generateDeferredAnimations:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIImageView;
  [(UIView *)&v14 _generateDeferredAnimations:v4];
  self;
  if (dyld_program_sdk_at_least())
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:@"imageDynamicRange"];
    id v6 = v5;
    if (v5)
    {
      char v7 = [v5 animationFrames];
      uint64_t v8 = [v7 count];

      objc_super v9 = [(UIView *)self layer];
      [v9 setWantsExtendedDynamicRangeContent:1];

      if (v8 >= 1)
      {
        uint64_t v10 = 0;
        uint64_t v11 = MEMORY[0x1E4F143A8];
        do
        {
          v13[0] = v11;
          v13[1] = 3221225472;
          v13[2] = __43__UIImageView__generateDeferredAnimations___block_invoke;
          v13[3] = &unk_1E52DD7D0;
          v13[4] = self;
          [v6 animateFrameAtIndex:v10++ animations:v13];
        }
        while (v8 != v10);
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __43__UIImageView__generateDeferredAnimations___block_invoke_2;
      v12[3] = &unk_1E52DC3A0;
      v12[4] = self;
      +[UIView _addCompletion:v12];
    }
  }
}

void __43__UIImageView__generateDeferredAnimations___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 value];
  uint64_t v4 = [v3 integerValue];

  [*(id *)(a1 + 32) _maximumEDRForDynamicRange:v4];
  double v6 = v5;
  id v7 = [*(id *)(a1 + 32) layer];
  [v7 setContentsMaximumDesiredEDR:v6];
}

uint64_t __43__UIImageView__generateDeferredAnimations___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHDRFlags:1];
}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect
{
  uint64_t v4 = (void *)MEMORY[0x1E4F41A50];
  double v5 = symbolEffect;
  id v6 = [v4 options];
  [(UIImageView *)self addSymbolEffect:v5 options:v6];
}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options
{
}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated
{
}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated completion:(UISymbolEffectCompletion)completionHandler
{
  BOOL v7 = animated;
  double v25 = symbolEffect;
  uint64_t v11 = options;
  CGFloat v12 = completionHandler;
  if (![(NSSymbolEffect *)v25 ui_isSupportedByImageView])
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"UIImageView.m" lineNumber:2590 description:@"Unsupported symbol effect added to UIImageView."];
  }
  if (v25)
  {
    objc_super v14 = self;
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(UIImageView *)self image], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_super v16 = (void *)v15;
      double v17 = [(UIImageView *)self image];
      char v18 = [v17 isSymbolImage];

      if (v18)
      {
        uint64_t v19 = [(NSSymbolEffect *)v25 copy];

        uint64_t v20 = [(NSSymbolEffectOptions *)v11 copy];
        uint64_t v11 = (NSSymbolEffectOptions *)v20;
        if (!v20)
        {
          uint64_t v11 = [MEMORY[0x1E4F41A50] options];
        }
        double v21 = [(UIImageView *)self _rbSymbolLayer];

        animationPresetManager = self->_animationPresetManager;
        if (v21)
        {
          [(_UIImageViewSymbolAnimationPresetManager *)animationPresetManager addActiveSymbolEffect:v19 options:v11 animated:v7 completion:v12];
        }
        else
        {
          [(_UIImageViewSymbolAnimationPresetManager *)animationPresetManager addPendingSymbolEffect:v19 options:v11 animated:v7 completion:v12];
          [(UIImageView *)self _updateState];
        }
        double v25 = (NSSymbolEffect *)v19;
        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  if (v12)
  {
    id v23 = +[UISymbolEffectCompletionContext _new];
    [v23 setFinished:0];
    [v23 setSender:self];
    double v24 = (void *)[(NSSymbolEffect *)v25 copy];
    [v23 setEffect:v24];

    v12[2](v12, v23);
  }
LABEL_14:
}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect
{
  uint64_t v4 = (void *)MEMORY[0x1E4F41A50];
  double v5 = symbolEffect;
  id v6 = [v4 options];
  [(UIImageView *)self removeSymbolEffectOfType:v5 options:v6];
}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options
{
}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated
{
}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated completion:(UISymbolEffectCompletion)completionHandler
{
  BOOL v7 = animated;
  uint64_t v11 = symbolEffect;
  CGFloat v12 = options;
  UISymbolEffectCompletion v13 = completionHandler;
  if (![(NSSymbolEffect *)v11 ui_isSupportedByImageView])
  {
    objc_super v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"UIImageView.m" lineNumber:2648 description:@"Unsupported symbol effect removed from UIImageView."];
  }
  if (v11)
  {
    uint64_t v15 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      char v18 = (NSSymbolEffect *)[(NSSymbolEffect *)v11 copy];

      uint64_t v17 = [(NSSymbolEffectOptions *)v12 copy];
      if (!v17)
      {
        uint64_t v17 = [MEMORY[0x1E4F41A50] options];
      }
      [(_UIImageViewSymbolAnimationPresetManager *)self->_animationPresetManager removeSymbolEffectsOfType:v18 options:v17 animated:v7 completion:v13];
      CGFloat v12 = (NSSymbolEffectOptions *)v17;
    }
    else
    {
      char v18 = v11;
    }
  }
  else
  {
    char v18 = 0;
  }
}

- (void)removeAllSymbolEffects
{
  id v3 = [MEMORY[0x1E4F41A50] options];
  [(UIImageView *)self removeAllSymbolEffectsWithOptions:v3];
}

- (void)removeAllSymbolEffectsWithOptions:(NSSymbolEffectOptions *)options
{
}

- (void)removeAllSymbolEffectsWithOptions:(NSSymbolEffectOptions *)options animated:(BOOL)animated
{
}

- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition
{
  id v6 = (void *)MEMORY[0x1E4F41A50];
  BOOL v7 = transition;
  uint64_t v8 = symbolImage;
  id v9 = [v6 options];
  [(UIImageView *)self setSymbolImage:v8 withContentTransition:v7 options:v9];
}

- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition options:(NSSymbolEffectOptions *)options
{
}

- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition options:(NSSymbolEffectOptions *)options completion:(UISymbolEffectCompletion)completionHandler
{
  uint64_t v30 = symbolImage;
  uint64_t v11 = transition;
  CGFloat v12 = options;
  UISymbolEffectCompletion v13 = completionHandler;
  if (![(NSSymbolContentTransition *)v11 ui_isSupportedByImageView])
  {
    objc_super v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"UIImageView.m" lineNumber:2695 description:@"Unsupported symbol content transition added to UIImageView."];
  }
  if (!v11) {
    goto LABEL_16;
  }
  uint64_t v15 = self;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v16 = [(UIImageView *)self image];
  if (!v16) {
    goto LABEL_15;
  }
  uint64_t v17 = (void *)v16;
  char v18 = [(UIImageView *)self image];
  int v19 = [v18 isSymbolImage];
  if (!v30 || !v19 || ![(UIImage *)v30 isSymbolImage])
  {
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  uint64_t v20 = [(UIImageView *)self image];
  double v21 = v30;
  uint64_t v22 = v21;
  if (v20 == v21)
  {

    goto LABEL_14;
  }
  if (!v20)
  {

LABEL_23:
    id v26 = (NSSymbolContentTransition *)[(NSSymbolContentTransition *)v11 copy];

    uint64_t v27 = [(NSSymbolEffectOptions *)v12 copy];
    if (!v27)
    {
      uint64_t v27 = [MEMORY[0x1E4F41A50] options];
    }
    animationPresetManager = self->_animationPresetManager;
    uint64_t v29 = [(UIImageView *)self _currentImage];
    [(_UIImageViewSymbolAnimationPresetManager *)animationPresetManager addPendingSymbolContentTransition:v26 fromSymbolImage:v29 toSymbolImage:v22 options:v27 completion:v13];

    [(UIImageView *)self _setImage:v22 invalidatingPendingSymbolTransitions:0];
    CGFloat v12 = (NSSymbolEffectOptions *)v27;
    goto LABEL_19;
  }
  BOOL v23 = [(UIImage *)v20 isEqual:v21];

  if (!v23) {
    goto LABEL_23;
  }
LABEL_16:
  [(UIImageView *)self setImage:v30];
  if (v13)
  {
    id v24 = +[UISymbolEffectCompletionContext _new];
    [v24 setFinished:0];
    [v24 setSender:self];
    double v25 = (void *)[(NSSymbolContentTransition *)v11 copy];
    [v24 setContentTransition:v25];

    v13[2](v13, v24);
  }
  id v26 = v11;
LABEL_19:
}

- (void)_addSymbolEffect:(id)a3
{
}

- (void)_addSymbolEffect:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [a3 _nsSymbolEffectRepresentation];
  id v6 = [MEMORY[0x1E4F41A50] options];
  [(UIImageView *)self addSymbolEffect:v7 options:v6 animated:v4];
}

- (void)_removeSymbolEffect:(id)a3
{
}

- (void)_removeSymbolEffect:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [a3 _nsSymbolEffectRepresentation];
  id v6 = [MEMORY[0x1E4F41A50] options];
  [(UIImageView *)self removeSymbolEffectOfType:v7 options:v6 animated:v4];
}

- (void)_removeAllSymbolEffects
{
}

- (void)_removeAllSymbolEffectsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F41A50] options];
  [(UIImageView *)self removeAllSymbolEffectsWithOptions:v5 animated:v3];
}

- (void)_setSymbolImage:(id)a3 withSymbolTransition:(id)a4
{
  id v6 = a3;
  id v7 = [a4 _nsSymbolContentTransitionRepresentation];
  [(UIImageView *)self setSymbolImage:v6 withContentTransition:v7];
}

- (void)animationPresetManager:(id)a3 didActivateEffect:(id)a4 options:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = [(UIImageView *)self _rbSymbolLayer];
  uint64_t v16 = [v15 animator];
  objc_initWeak(&location, self);
  uint64_t v24 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v27, &location);
  id v17 = v12;
  id v25 = v17;
  id v18 = v14;
  id v26 = v18;
  int v19 = [(UIImageView *)self _activeImage];
  uint64_t v20 = [v19 configuration];
  double v21 = objc_msgSend(v17, "ui_animationConfigurationWithOptions:completion:configuration:", v13, &v24, v20);

  uint64_t v22 = [v21 animation];
  BOOL v23 = [v21 options];
  [v16 addAnimation:v22 options:v23];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __84__UIImageView_animationPresetManager_didActivateEffect_options_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained[59] activeSymbolEffectDidComplete:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 40))
    {
      id v5 = +[UISymbolEffectCompletionContext _new];
      [v5 setFinished:a2];
      [v5 setSender:v6];
      [v5 setEffect:*(void *)(a1 + 32)];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    [v6 _updateStateIfRBSymbolLayerNoLongerNeeded];
    id WeakRetained = v6;
  }
}

- (void)animationPresetManager:(id)a3 didRemoveEffect:(id)a4 options:(id)a5 animated:(BOOL)a6 completion:(id)a7 wasActive:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  id v26 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = (void (**)(id, id))a7;
  if (v8)
  {
    id v17 = [(UIImageView *)self _rbSymbolLayer];
    id v18 = [v17 animator];
    int v19 = [(UIImageView *)self _activeImage];
    uint64_t v20 = [v19 configuration];
    id v25 = v15;
    objc_msgSend(v14, "ui_animationConfigurationWithOptions:completion:configuration:", v15, 0, v20);
    v22 = BOOL v21 = v10;
    uint64_t v23 = [v22 animation];

    if (v21) {
      [v18 cancelAnimation:v23];
    }
    else {
      [v18 removeAnimation:v23];
    }

    id v15 = v25;
  }
  if (v16)
  {
    id v24 = +[UISymbolEffectCompletionContext _new];
    [v24 setFinished:0];
    [v24 setSender:self];
    [v24 setEffect:v14];
    v16[2](v16, v24);
  }
}

- (void)animationPresetManager:(id)a3 didSetScale:(int)a4 usingEffect:(id)a5 options:(id)a6 animated:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  uint64_t v12 = *(void *)&a4;
  id v27 = a3;
  id v28 = a5;
  id v14 = a6;
  id v15 = a8;
  uint64_t v16 = [(UIImageView *)self _rbSymbolLayer];
  id v17 = [v16 animator];
  int v18 = [v17 scaleLevel];
  if (v18 == v12)
  {
    int v24 = 1;
  }
  else
  {
    if (v9)
    {
      id v26 = v14;
      objc_initWeak(&location, self);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __90__UIImageView_animationPresetManager_didSetScale_usingEffect_options_animated_completion___block_invoke;
      _OWORD v29[3] = &unk_1E530F9C8;
      objc_copyWeak(&v32, &location);
      id v30 = v28;
      id v31 = v15;
      int v19 = [(UIImageView *)self _activeImage];
      uint64_t v20 = [v19 configuration];
      BOOL v21 = objc_msgSend(v30, "ui_animationConfigurationWithOptions:completion:configuration:", v26, v29, v20);

      uint64_t v22 = [v21 animation];
      uint64_t v23 = [v21 options];
      [v17 addAnimation:v22 options:v23];

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
      id v14 = v26;
    }
    [v17 setScaleLevel:v12];
    int v24 = !v9;
  }
  if (v15 && v24)
  {
    id v25 = +[UISymbolEffectCompletionContext _new];
    [v25 setFinished:v18 != v12];
    [v25 setSender:self];
    [v25 setEffect:v28];
    (*((void (**)(id, id))v15 + 2))(v15, v25);
  }
  [(UIImageView *)self _updateStateIfRBSymbolLayerNoLongerNeeded];
}

void __90__UIImageView_animationPresetManager_didSetScale_usingEffect_options_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained[59] activeSymbolEffectDidComplete:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 40))
    {
      id v5 = +[UISymbolEffectCompletionContext _new];
      [v5 setFinished:a2];
      [v5 setSender:v6];
      [v5 setEffect:*(void *)(a1 + 32)];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    [v6 _updateStateIfRBSymbolLayerNoLongerNeeded];
    id WeakRetained = v6;
  }
}

- (void)animationPresetManager:(id)a3 didSetHiddenness:(BOOL)a4 usingEffect:(id)a5 options:(id)a6 animated:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v12 = a4;
  id v29 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = [(UIImageView *)self _rbSymbolLayer];
  int v18 = [v17 animator];
  uint64_t v19 = [v18 isHidden] ^ v12;
  if (v19 != 1)
  {
    int v25 = 1;
    if (!v16) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (v9)
  {
    id v28 = v15;
    if (v12) {
      int v20 = 9;
    }
    else {
      int v20 = 5;
    }
    unint64_t v27 = __PAIR64__(v20, v9);
    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __95__UIImageView_animationPresetManager_didSetHiddenness_usingEffect_options_animated_completion___block_invoke;
    v30[3] = &unk_1E530F9C8;
    objc_copyWeak(&v33, &location);
    id v31 = v14;
    id v32 = v16;
    BOOL v21 = [(UIImageView *)self _activeImage];
    uint64_t v22 = [v21 configuration];
    uint64_t v23 = objc_msgSend(v31, "ui_animationConfigurationWithOptions:completion:configuration:", v28, v30, v22);

    int v24 = [v23 options];
    [v18 addAnimation:HIDWORD(v27) options:v24];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    id v15 = v28;
    BOOL v9 = v27;
  }
  objc_msgSend(v18, "setHidden:", v12, v27);
  int v25 = !v9;
  if (v16)
  {
LABEL_10:
    if (v25)
    {
      id v26 = +[UISymbolEffectCompletionContext _new];
      [v26 setFinished:v19];
      [v26 setSender:self];
      [v26 setEffect:v14];
      (*((void (**)(id, id))v16 + 2))(v16, v26);
    }
  }
LABEL_12:
  [(UIImageView *)self _updateStateIfRBSymbolLayerNoLongerNeeded];
}

void __95__UIImageView_animationPresetManager_didSetHiddenness_usingEffect_options_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained[59] activeSymbolEffectDidComplete:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 40))
    {
      id v5 = +[UISymbolEffectCompletionContext _new];
      [v5 setFinished:a2];
      [v5 setSender:v6];
      [v5 setEffect:*(void *)(a1 + 32)];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    [v6 _updateStateIfRBSymbolLayerNoLongerNeeded];
    id WeakRetained = v6;
  }
}

- (void)animationPresetManager:(id)a3 didDiscardPendingContentTransition:(id)a4
{
  id v8 = a4;
  id v5 = [v8 completionHandler];
  if (v5)
  {
    id v6 = +[UISymbolEffectCompletionContext _new];
    [v6 setFinished:0];
    [v6 setSender:self];
    id v7 = [v8 symbolContentTransition];
    [v6 setContentTransition:v7];

    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (UIImageDynamicRange)imageDynamicRange
{
  UIImageDynamicRange v3 = [(UIImageView *)self preferredImageDynamicRange];
  if (v3 == UIImageDynamicRangeUnspecified)
  {
    BOOL v4 = [(UIView *)self traitCollection];
    UIImageDynamicRange v3 = [v4 imageDynamicRange];
  }
  if (v3 == UIImageDynamicRangeUnspecified) {
    return 0;
  }
  else {
    return v3;
  }
}

- (void)_setMasksTemplateImages:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIImageViewStorage *)self->_storage masksTemplateImages] != a3)
  {
    [(_UIImageViewStorage *)self->_storage setMasksTemplateImages:v3];
    if (v3)
    {
      [(UIImageView *)self _updateMasking];
    }
    else
    {
      id v5 = [(UIView *)self layer];
      [v5 setCompositingFilter:0];
    }
  }
}

- (id)_colorByApplyingDrawModeToColor:(id)a3
{
  id v4 = a3;
  id v5 = [(UIImageView *)self _colorByApplyingDrawMode:[(UIImageView *)self drawMode] toColor:v4];

  return v5;
}

- (BOOL)_needsImageEffectsForImage:(id)a3
{
  id v4 = a3;
  id v5 = [(UIImageView *)self _symbolConfigurationForImage:v4];
  LOBYTE(self) = [(UIImageView *)self _needsImageEffectsForImage:v4 symbolConfiguration:v5];

  return (char)self;
}

- (BOOL)_getDrawModeCompositeOperation:(int *)a3 whiteComponent:(double *)a4 drawingAlpha:(double *)a5
{
  uint64_t v9 = [(UIImageView *)self drawMode];
  return [(UIImageView *)self _getDrawModeCompositeOperation:a3 whiteComponent:a4 drawingAlpha:a5 forDrawMode:v9];
}

- (void)_renderDrawModeEffectInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  int v13 = 0;
  alphCGFloat a = 0.0;
  double v12 = 0.0;
  if ([(UIImageView *)self _getDrawModeCompositeOperation:&v13 whiteComponent:&v12 drawingAlpha:&alpha])
  {
    BOOL v10 = +[UIColor colorWithWhite:v12 alpha:1.0];
    [v10 set];

    CGContextSetAlpha(v9, alpha);
    CGContextSetCompositeOperation();
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    CGContextFillRect(v9, v14);
  }
}

- (void)setCGImageRef:(CGImage *)a3
{
  id v4 = [(UIView *)self layer];
  [v4 setContents:a3];
}

- (CGImage)imageRef
{
  id v2 = [(UIView *)self layer];
  BOOL v3 = (CGImage *)[v2 contents];

  return v3;
}

- (void)setAnimating:(BOOL)a3
{
  if (a3) {
    [(UIImageView *)self startAnimating];
  }
  else {
    [(UIImageView *)self stopAnimating];
  }
}

- (void)_setDecompressingImage:(id)a3 forType:(unint64_t)a4
{
  if (a4) {
    id v4 = &unk_1EB25E681;
  }
  else {
    id v4 = &_MergedGlobals_69_0;
  }
  objc_setAssociatedObject(self, v4, a3, (void *)1);
}

- (id)_checkHighlightedImageForAdaptation:(id)a3 hadAdapted:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [(UIImageView *)self highlightedImage];
  id v8 = [(UIImageView *)self _currentHighlightedImage];
  uint64_t v9 = [(UIImageView *)self _adaptiveImageForImage:v6 assignedImage:v7 currentImage:v8 hasAdapted:a4];

  return v9;
}

- (BOOL)_imageSupportsMaterials:(id)a3 symbolConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isSymbolImage]
    && ([v7 _suppressesMaterialRendering] & 1) == 0
    && [(UIImageView *)self _effectiveRenderingModeForSource:v6 symbolConfiguration:v7] == 2)
  {
    if ([v7 _hasSpecifiedPaletteColors])
    {
      id v8 = [v7 _colors];
      if ((unint64_t)[v8 count] < 2) {
        int v9 = 1;
      }
      else {
        int v9 = [v6 _isPaletteColorSymbolImage] ^ 1;
      }
    }
    else
    {
      int v9 = 1;
    }
  }
  else
  {
    int v9 = 0;
  }
  BOOL v10 = [v7 traitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11 == 6) {
    LOBYTE(v12) = v9;
  }
  else {
    LOBYTE(v12) = 0;
  }
  if (v11 != 6 && v9)
  {
    if ([v7 _hasSpecifiedHierarchicalColors]) {
      int v12 = [v6 _isHierarchicalColorSymbolImage] ^ 1;
    }
    else {
      LOBYTE(v12) = 1;
    }
  }

  return v12;
}

- (id)_materialForImage:(id)a3 symbolConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIView *)self traitCollection];
  int v9 = [(UIImageView *)self _baseMultiplyColorWithImage:v7 symbolConfiguration:v6 shouldResolveDynamicColors:0];

  if ([v9 _isDynamic])
  {
    BOOL v10 = [v9 _resolvedMaterialWithTraitCollection:v8];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_teardownLayeredImage
{
  [(UIImageView *)self _updateLayeredImageIsFocusedWithFocusedView:0 focusAnimationCoordinator:0];
  [(UIView *)self _setTracksFocusedAncestors:0];
  id v4 = [(UIImageView *)self _existingOverlayView];
  if (v4)
  {
    BOOL v3 = [(UIImageView *)self _layeredImageContainer];
    [v3 setOverlayView:0];

    [(UIView *)self addSubview:v4];
  }
}

- (void)_ancestorWillUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 nextFocusedView];
  [(UIImageView *)self _updateLayeredImageIsFocusedWithFocusedView:v8 focusAnimationCoordinator:v6];

  v9.receiver = self;
  v9.super_class = (Class)UIImageView;
  [(UIView *)&v9 _ancestorWillUpdateFocusInContext:v7 withAnimationCoordinator:v6];
}

- (void)_setLayeredImageContainer:(id)a3
{
}

- (double)_layeredImageCornerRadius
{
  id v2 = [(UIImageView *)self _layeredImageContainer];
  BOOL v3 = [v2 config];
  [v3 cornerRadius];
  double v5 = v4;

  return v5;
}

- (id)_existingOverlayView
{
  return objc_getAssociatedObject(self, &overlayViewKey);
}

- (void)_setOverlayContentView:(id)a3
{
  id v6 = a3;
  objc_setAssociatedObject(self, &overlayViewKey, v6, (void *)1);
  double v4 = [(UIImageView *)self _layeredImageContainer];
  if (v4)
  {
    double v5 = [(UIImageView *)self _layeredImageContainer];
    [v5 setOverlayView:v6];
  }
  else
  {
    [(UIView *)self addSubview:v6];
  }
}

- (UIView)overlayContentView
{
  BOOL v3 = [(UIImageView *)self _existingOverlayView];
  if (!v3)
  {
    double v4 = [_UIImageViewOverlayView alloc];
    [(UIView *)self bounds];
    BOOL v3 = -[UIView initWithFrame:](v4, "initWithFrame:");
    [(_UIImageViewOverlayView *)v3 setClipsToBounds:1];
    [(UIView *)v3 setAutoresizingMask:18];
    [(UIImageView *)self _setOverlayContentView:v3];
  }
  return (UIView *)v3;
}

- (void)_setLayeredImageCornerRadius:(double)a3
{
  id v5 = [(UIImageView *)self _layeredImageContainer];
  double v4 = [v5 config];
  [v4 setCornerRadius:a3];
}

- (void)_updateLayeredImageIsFocusedWithFocusedView:(id)a3 focusAnimationCoordinator:(id)a4
{
  id v7 = a4;
  if (a3) {
    a3 = (id)[(UIView *)self isDescendantOfView:a3];
  }
  id v6 = [(UIImageView *)self _layeredImageContainer];
  [v6 setStackFocused:a3 withFocusAnimationCoordinator:v7];
}

- (void)_setRBSymbolLayer:(id)a3
{
}

- (void)_updateStateIfRBSymbolLayerNoLongerNeeded
{
  uint64_t v3 = [(UIImageView *)self _rbSymbolLayer];
  if (v3)
  {
    double v4 = (void *)v3;
    id v5 = [(UIImageView *)self image];
    BOOL v6 = [(UIImageView *)self _hasReasonToUseRBSymbolLayerForImage:v5];

    if (!v6)
    {
      [(UIImageView *)self _setNeedsUpdateState];
    }
  }
}

- (void)_setSymbolContentTransitionContainerView:(id)a3
{
  id v4 = +[_UIWeakReference weakReferenceWrappingObject:a3];
  objc_setAssociatedObject(self, &_UIImageViewSymbolContentTransitionContainerViewKey, v4, (void *)1);
}

- (UIView)_symbolContentTransitionContainerView
{
  id v2 = objc_getAssociatedObject(self, &_UIImageViewSymbolContentTransitionContainerViewKey);
  uint64_t v3 = [v2 object];

  return (UIView *)v3;
}

- (id)_effectiveSymbolContentTransitionContainerView
{
  uint64_t v3 = [(UIImageView *)self _symbolContentTransitionContainerView];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIView *)self superview];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)_applyImageEffectsToCIImage:(id)a3 multiplyColor:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1E008]) initWithColor:v7];
    objc_super v9 = (void *)v8;
    if (v8)
    {
      BOOL v10 = (void *)MEMORY[0x1E4F1E040];
      uint64_t v44 = *MEMORY[0x1E4F1E448];
      v45[0] = v8;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      int v12 = [v10 filterWithName:@"CIConstantColorGenerator" withInputParameters:v11];
      int v13 = [v12 outputImage];

      uint64_t v42 = *MEMORY[0x1E4F1E418];
      id v43 = v6;
      CGRect v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      uint64_t v15 = [v13 imageByApplyingFilter:@"CISourceInCompositing" withInputParameters:v14];

      id v6 = (id)v15;
    }
  }
  int v33 = 0;
  double v31 = 0.0;
  double v32 = 0.0;
  if ([(UIImageView *)self _getDrawModeCompositeOperation:&v33 whiteComponent:&v32 drawingAlpha:&v31])
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1E008]);
    id v17 = +[UIColor colorWithWhite:v32 alpha:v31];
    int v18 = (void *)[v16 initWithColor:v17];

    if (v18)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F1E040];
      uint64_t v40 = *MEMORY[0x1E4F1E448];
      double v41 = v18;
      int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      BOOL v21 = [v19 filterWithName:@"CIConstantColorGenerator" withInputParameters:v20];
      uint64_t v22 = [v21 outputImage];

      if (v33 == 8)
      {
        uint64_t v38 = *MEMORY[0x1E4F1E418];
        long long v39 = v22;
        uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        int v24 = @"CISourceOutCompositing";
        int v25 = v6;
      }
      else
      {
        if (os_variant_has_internal_diagnostics())
        {
          if (v33 != 5)
          {
            id v28 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              int v37 = v33;
              _os_log_fault_impl(&dword_1853B0000, v28, OS_LOG_TYPE_FAULT, "Unexpected CG blend mode: %d", buf, 8u);
            }
          }
        }
        else if (v33 != 5)
        {
          id v29 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_applyImageEffectsToCIImage_multiplyColor____s_category)+ 8);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            int v37 = v33;
            _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "Unexpected CG blend mode: %d", buf, 8u);
          }
        }
        uint64_t v34 = *MEMORY[0x1E4F1E418];
        id v35 = v6;
        uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        int v24 = @"CISourceAtopCompositing";
        int v25 = v22;
      }
      uint64_t v26 = [v25 imageByApplyingFilter:v24 withInputParameters:v23];

      id v6 = (id)v26;
    }
  }
  return v6;
}

- (BOOL)_setImageViewContentsForCIImageBackedImage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 content];
  int v6 = [v5 canRenderCIImage];
  if (!v6) {
    goto LABEL_25;
  }
  self;
  BOOL v7 = dyld_program_sdk_at_least()
    && [v5 isHDR]
    && (unint64_t)([(UIImageView *)self imageDynamicRange] - 1) < 2;
  uint64_t v8 = [(_UIImageViewStorage *)self->_storage CIRenderer];
  if (!v8)
  {
    uint64_t v8 = objc_opt_new();
    [(_UIImageViewStorage *)self->_storage setCIRenderer:v8];
    if (v7) {
      goto LABEL_8;
    }
LABEL_10:
    int v9 = 0;
    goto LABEL_11;
  }
  if (!v7) {
    goto LABEL_10;
  }
LABEL_8:
  int v9 = [v5 isHDR];
LABEL_11:
  if ([(UIImageView *)self _needsImageEffectsForImage:v4])
  {
    BOOL v10 = [(UIImageView *)self _baseMultiplyColorWithImage:v4 symbolConfiguration:0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__UIImageView__setImageViewContentsForCIImageBackedImage___block_invoke;
    aBlock[3] = &unk_1E530FA18;
    aBlock[4] = self;
    id v28 = v10;
    id v11 = v10;
    int v12 = _Block_copy(aBlock);
  }
  else
  {
    int v12 = 0;
  }
  -[_UIImageCIImageRenderer renderContent:usingHDR:withEffects:]((uint64_t)v8, v5, v9, v12);
  id v13 = v8;
  CGRect v14 = v13;
  if (v13 && (*((unsigned char *)v13 + 32) & 1) != 0) {
    uint64_t v15 = (void *)*((void *)v13 + 1);
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = [(UIView *)self layer];
  id v17 = [v16 contents];
  if (v15 == v17) {
    [v16 reloadValueForKeyPath:@"contents"];
  }
  else {
    [v16 setContents:v15];
  }
  [(UIView *)self bounds];
  int v20 = -[UIImageView _layoutForImage:inSize:](self, "_layoutForImage:inSize:", v4, v18, v19);
  BOOL v21 = v20;
  if (v20)
  {
    [v20 contentsTransform];
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
  }
  v23[0] = v24;
  v23[1] = v25;
  v23[2] = v26;
  [v16 setContentsTransform:v23];

LABEL_25:
  return v6;
}

uint64_t __58__UIImageView__setImageViewContentsForCIImageBackedImage___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _applyImageEffectsToCIImage:a2 multiplyColor:*(void *)(a1 + 40)];
}

- (void)_setPlaceholderView:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIImageViewStorage *)self->_storage placeholderView];
  int v6 = v5;
  if (v5 != v4)
  {
    BOOL v7 = [v5 superview];

    if (v7 == self) {
      [v6 removeFromSuperview];
    }
    [(_UIImageViewStorage *)self->_storage setPlaceholderView:v4];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__UIImageView__setPlaceholderView___block_invoke;
    v8[3] = &unk_1E52D9F70;
    v8[4] = self;
    +[UIView performWithoutAnimation:v8];
    [(UIView *)self addSubview:v4];
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

uint64_t __35__UIImageView__setPlaceholderView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVisibilityAndFrameOfPlaceholderView];
}

- (_UIImageLoader)_imageLoader
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  storage = self->_storage;
  return [(_UIImageViewStorage *)storage imageLoader];
}

- (void)_loadImageWithURL:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [MEMORY[0x1E4F18DA8] requestWithURL:v4];

  int v6 = [MEMORY[0x1E4F18DC0] sharedSession];
  id v7 = +[_UIImageLoader _imageLoaderWithURLRequest:v5 session:v6];

  [(UIImageView *)self _loadImage:v7 delegate:0];
}

- (void)_loadImage:(id)a3 delegate:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v8 = [(_UIImageViewStorage *)self->_storage imageLoader];
  if (v8)
  {
    [(_UIImageViewStorage *)self->_storage setStoppingLoad:1];
    int v9 = [(_UIImageViewStorage *)self->_storage loadingDelegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v9 _imageView:self shouldCancelPreviousImageLoader:v8])
    {
      [v8 _cancel];
    }
  }
  [(UIImageView *)self _mainQ_resetForLoader:v6 delegate:v7];
  BOOL v10 = _UIImageLoadingLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 134218240;
    int v12 = self;
    __int16 v13 = 2048;
    id v14 = v6;
    _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_INFO, "Image view %p will load from loader=%p", (uint8_t *)&v11, 0x16u);
  }

  [(UIImageView *)self _mainQ_beginLoadingIfApplicable];
}

void __46__UIImageView__mainQ_beginLoadingIfApplicable__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    objc_msgSend(WeakRetained, "_kickoffQ_beginLoadingWithImageLoader:", v2);
  }
}

- (void)_kickoffQ_beginLoadingWithImageLoader:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIImageViewStorage *)self->_storage imageLoader];
  if (v5 == v4)
  {
    objc_initWeak(&location, self);
    uint64_t v6 = MEMORY[0x1E4F14428];
    id v7 = MEMORY[0x1E4F14428];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__UIImageView__kickoffQ_beginLoadingWithImageLoader___block_invoke;
    v8[3] = &unk_1E52D9960;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [v9 _loadImageWithCompletionQueue:v6 handler:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __53__UIImageView__kickoffQ_beginLoadingWithImageLoader___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 _image];
  id v4 = [*(id *)(a1 + 32) _error];
  objc_msgSend(WeakRetained, "_mainQ_imageLoader:finishedWithImage:error:", v2, v3, v4);
}

- (void)_mainQ_imageLoader:(id)a3 finishedWithImage:(id)a4 error:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v11 = [(_UIImageViewStorage *)self->_storage imageLoader];
  if (v11 == v8)
  {
    id v29 = [(_UIImageViewStorage *)self->_storage loadingDelegate];
    if (v9)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v12 = [v29 _imageView:self didLoadImage:v9];

        id v9 = (id)v12;
      }
      os_variant_has_internal_diagnostics();
      id v28 = +[UITraitCollection _currentTraitCollectionIfExists]();
      __int16 v13 = [(UIView *)self traitCollection];
      +[UITraitCollection setCurrentTraitCollection:v13];

      id v14 = (void *)_UISetCurrentFallbackEnvironment(self);
      [(UIView *)self bounds];
      -[UIImageView _layoutForImage:inSize:](self, "_layoutForImage:inSize:", v9, v15, v16);
      id v17 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      _UIRestorePreviousFallbackEnvironment(v14);
      +[UITraitCollection setCurrentTraitCollection:v28];
      objc_initWeak((id *)location, self);
      objc_initWeak(&from, v8);
      if (v17 && (v17[8] & 1) != 0)
      {
        uint64_t v23 = decodeQueue();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __58__UIImageView__mainQ_imageLoader_finishedWithImage_error___block_invoke;
        block[3] = &unk_1E530FA40;
        double v18 = &v38;
        objc_copyWeak(&v38, (id *)location);
        double v19 = &v39;
        objc_copyWeak(&v39, &from);
        int v20 = &v36;
        BOOL v21 = (id *)&v37;
        id v36 = v9;
        int v37 = v17;
        unint64_t v27 = v17;
        long long v24 = block;
      }
      else
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __58__UIImageView__mainQ_imageLoader_finishedWithImage_error___block_invoke_2;
        v30[3] = &unk_1E530FA40;
        double v18 = &v33;
        objc_copyWeak(&v33, (id *)location);
        double v19 = &v34;
        objc_copyWeak(&v34, &from);
        int v20 = &v31;
        BOOL v21 = (id *)&v32;
        id v31 = v9;
        double v32 = v17;
        uint64_t v22 = v17;
        uint64_t v23 = MEMORY[0x1E4F14428];
        long long v24 = v30;
      }
      dispatch_async(v23, v24);

      objc_destroyWeak(v19);
      objc_destroyWeak(v18);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {
      if ([(_UIImageViewStorage *)self->_storage isStoppingLoad])
      {
        long long v25 = _UIImageLoadingLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          long long v26 = [v10 domain];
          *(_DWORD *)id location = 134218754;
          *(void *)&location[4] = self;
          __int16 v42 = 2048;
          id v43 = v8;
          __int16 v44 = 2114;
          uint64_t v45 = v26;
          __int16 v46 = 2048;
          uint64_t v47 = [v10 code];
          _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_INFO, "Image view %p stopped loading with error: loader=%p domain=%{public}@ code=%ld", location, 0x2Au);
        }
        if (objc_opt_respondsToSelector()) {
          [v29 _imageView:self stoppedLoadingWithError:v10];
        }
        [(UIImageView *)self _mainQ_resetForLoader:0 delegate:0];
      }
      id v9 = 0;
    }
  }
}

void __58__UIImageView__mainQ_imageLoader_finishedWithImage_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v2) {
    objc_msgSend(WeakRetained, "_decodeQ_imageLoader:decodeImage:layout:", v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

void __58__UIImageView__mainQ_imageLoader_finishedWithImage_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v2) {
    objc_msgSend(WeakRetained, "_mainQ_imageLoader:finishedOrSkippedDecodingImage:layout:", v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

- (void)_decodeQ_imageLoader:(id)a3 decodeImage:(id)a4 layout:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = decodeQueue();
  dispatch_assert_queue_V2(v11);

  id v12 = [(_UIImageViewStorage *)self->_storage imageLoader];
  if (v12 == v8)
  {
    __int16 v13 = v10;
    id v14 = v13;
    if (!v13
      || (-[_UIImageContentLayout _materializeRenditionContents]((uint64_t)v13), (v14[8] & 1) == 0)
      || !*((void *)v14 + 4))
    {
      double v15 = _UIImageLoadingLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        BOOL v21 = v14;
        __int16 v22 = 2048;
        id v23 = v8;
        _os_log_error_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Could not generate CGImage contents from layout %p (loader=%p)", buf, 0x16u);
      }
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __55__UIImageView__decodeQ_imageLoader_decodeImage_layout___block_invoke;
    v16[3] = &unk_1E52DD450;
    v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    double v19 = v14;
    dispatch_async(MEMORY[0x1E4F14428], v16);
  }
}

uint64_t __55__UIImageView__decodeQ_imageLoader_decodeImage_layout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQ_imageLoader:finishedOrSkippedDecodingImage:layout:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_mainQ_imageLoader:(id)a3 finishedOrSkippedDecodingImage:(id)a4 layout:(id)a5
{
  id v9 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v8 = [(_UIImageViewStorage *)self->_storage imageLoader];

  if (v8 == v7)
  {
    [(_UIImageViewStorage *)self->_storage setImageBeingSetByLoader:v9];
    [(UIImageView *)self setImage:v9];
    [(_UIImageViewStorage *)self->_storage setImageBeingSetByLoader:0];
    [(UIImageView *)self _mainQ_resetForLoader:0 delegate:0];
  }
}

- (void)_stopLoading
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v3 = [(_UIImageViewStorage *)self->_storage imageLoader];
  if (v3)
  {
    [(_UIImageViewStorage *)self->_storage setStoppingLoad:1];
    if (![(_UIImageViewStorage *)self->_storage isStartingLoad]
      || [(_UIImageViewStorage *)self->_storage isEnqueueingLoad])
    {
      id v4 = _UIImageLoadingLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v6 = 134218240;
        id v7 = self;
        __int16 v8 = 2048;
        id v9 = v3;
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_INFO, "Image view %p stopping loader=%p", (uint8_t *)&v6, 0x16u);
      }

      id v5 = [(_UIImageViewStorage *)self->_storage loadingDelegate];
      if (objc_opt_respondsToSelector()) {
        [v5 _imageView:self stoppedLoadingWithError:0];
      }
      [(UIImageView *)self _mainQ_resetForLoader:0 delegate:0];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [v5 _imageView:self shouldCancelPreviousImageLoader:v3])
      {
        [v3 _cancel];
      }
    }
  }
}

- (void)_mainQ_resetForLoader:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(_UIImageViewStorage *)self->_storage setImageLoader:v7];

  [(_UIImageViewStorage *)self->_storage setLoadingDelegate:v6];
  [(_UIImageViewStorage *)self->_storage setStartingLoad:0];
  [(_UIImageViewStorage *)self->_storage setEnqueueingLoad:0];
  storage = self->_storage;
  [(_UIImageViewStorage *)storage setStoppingLoad:0];
}

- (int64_t)_preferredVibrancy
{
  return self->_preferredVibrancy;
}

- (void)_setPreferredVibrancy:(int64_t)a3
{
  self->_preferredVibrancCGFloat y = a3;
}

- (BOOL)adjustsImageWhenAncestorFocused
{
  return self->_adjustsImageWhenAncestorFocused;
}

- (void)setAdjustsImageWhenAncestorFocused:(BOOL)adjustsImageWhenAncestorFocused
{
  self->_adjustsImageWhenAncestorFocusedouble d = adjustsImageWhenAncestorFocused;
}

- (UILayoutGuide)focusedFrameGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 496, 1);
}

- (BOOL)masksFocusEffectToContents
{
  return self->_masksFocusEffectToContents;
}

- (void)setMasksFocusEffectToContents:(BOOL)masksFocusEffectToContents
{
  self->_masksFocusEffectToContents = masksFocusEffectToContents;
}

- (BOOL)useBlockyMagnificationInClassic
{
  return 0;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIImageView;
  id v4 = a3;
  [(UIResponder *)&v7 encodeRestorableStateWithCoder:v4];
  id v5 = [(UIView *)self layer];
  [v5 anchorPoint];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"kViewAnchorKey");

  [(UIView *)self bounds];
  objc_msgSend(v4, "encodeCGRect:forKey:", @"kViewBoundsKey");
  [(UIView *)self center];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"kViewCenterKey");
  [(UIView *)self transform];
  [v4 encodeCGAffineTransform:&v6 forKey:@"kViewTransformKey"];
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIImageView;
  [(UIResponder *)&v14 decodeRestorableStateWithCoder:v4];
  if ([v4 containsValueForKey:@"kViewAnchorKey"])
  {
    [v4 decodeCGPointForKey:@"kViewAnchorKey"];
    double v6 = v5;
    double v8 = v7;
    id v9 = [(UIView *)self layer];
    objc_msgSend(v9, "setAnchorPoint:", v6, v8);
  }
  if ([v4 containsValueForKey:@"kViewBoundsKey"])
  {
    [v4 decodeCGRectForKey:@"kViewBoundsKey"];
    -[UIImageView setBounds:](self, "setBounds:");
  }
  if ([v4 containsValueForKey:@"kViewCenterKey"])
  {
    [v4 decodeCGPointForKey:@"kViewCenterKey"];
    -[UIImageView setCenter:](self, "setCenter:");
  }
  if ([v4 containsValueForKey:@"kViewTransformKey"])
  {
    if (v4)
    {
      [v4 decodeCGAffineTransformForKey:@"kViewTransformKey"];
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v11 = 0u;
    }
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    [(UIView *)self setTransform:v10];
  }
}

- (double)_scaleFactorForImage
{
  id v2 = [(UIView *)self traitCollection];
  double v3 = _UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection(v2);

  return v3;
}

void __60__UIImageView_Pretiling___updatePretiledImageCacheForImage___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  id v1 = (void *)qword_1EB264FE8;
  qword_1EB264FE8 = v0;
}

@end