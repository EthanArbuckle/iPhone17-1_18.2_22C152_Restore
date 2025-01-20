@interface PXStoryClipLayout
+ (BOOL)shouldContinueKenBurnsAnimationFromPreviousPresentedContentSize:(CGSize)a3 toCurrentContentSize:(CGSize)a4;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)autoplayTimeRange;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)clipTimeRange;
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius;
- ($738B17BD11CC339B30296C0EA03CEC2B)contentSpriteEntity;
- ($810C7C628FE0F9AC50A6216490AB88B8)contentsRectOverride;
- ($810C7C628FE0F9AC50A6216490AB88B8)preferredPresentedContentsRect;
- ($810C7C628FE0F9AC50A6216490AB88B8)presentedContentsRect;
- ($810C7C628FE0F9AC50A6216490AB88B8)presentedKenBurnsAnimationCurrentRect;
- ($AFFB3261E48324223FE33B3CF9FC7872)contentEdgeInsets;
- (BOOL)_isDisplayingContentOfAsset:(id)a3;
- (BOOL)_isDisplayingTextResourceType:(int64_t)a3;
- (BOOL)canAspectFitContent;
- (BOOL)canShowColorNormalizedContent;
- (BOOL)canShowDynamicContent;
- (BOOL)canShowHUD;
- (BOOL)canShowTextLegibilityEffect;
- (BOOL)contentPrefersPresentationTypeView;
- (BOOL)disableClippingAnimation;
- (BOOL)isDisplayingSubtitle;
- (BOOL)isDisplayingTitle;
- (BOOL)isPlayheadInAudioTimeRange;
- (BOOL)isPlayheadInVideoTimeRange;
- (BOOL)isReadyForAutoplay;
- (BOOL)isSegmentVisible;
- (BOOL)shouldApplyCleanApertureCropToStillImagesInLayout:(id)a3;
- (BOOL)shouldAspectFitContent;
- (BOOL)shouldAutoplay;
- (BOOL)shouldObserveInternationalStyleTitlePreferences;
- (BOOL)useContentBoundsForContentEdgeInsets;
- (BOOL)useLowMemoryDecodeInLayout:(id)a3;
- (BOOL)wantsHUD;
- (BOOL)wasPlayheadMovedManually;
- (CGAffineTransform)contentsRectTransform;
- (CGRect)_denormalizeRect:(CGRect)a3 coordinateSystem:(int64_t)a4;
- (CGRect)_normalizeRect:(CGRect)a3 coordinateSystem:(int64_t)a4;
- (CGRect)_referenceRectForNormalizedCoordinateSystem:(int64_t)a3;
- (CGRect)contentBounds;
- (CGRect)contentSpriteNormalizedFrameOverride;
- (CGRect)manualContentsRect;
- (CGRect)primaryDividerBounds;
- (CGRect)secondaryDividerBounds;
- (CGRect)textResourceSpriteFrame;
- (CGSize)attributedStringBoundingSizeForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (CGSize)displayedTimelineOriginalSize;
- (CGSize)presentedKenBurnsAnimationContentSize;
- (CGSize)primaryDividerScale;
- (CGSize)secondaryDividerScale;
- (CGSize)textResourceContentSize;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSIndexSet)segmentIdentifiers;
- (NSProgress)textFrameProgress;
- (NSString)description;
- (NSTimer)HUDTimer;
- (PXDisplayAsset)displayAsset;
- (PXGColorGradingEffect)colorGradingEffect;
- (PXGCombinedEffect)combinedEffect;
- (PXGDisplayAssetAdjustment)inactiveImageFilterAdjustment;
- (PXGDisplayAssetVideoPresentationController)videoPresentationController;
- (PXGLayout)timelineLayout;
- (PXGRegionMaskEffect)bottomEdgeMaskEffect;
- (PXGRegionMaskEffect)leftEdgeClippingMaskEffect;
- (PXGRegionMaskEffect)leftEdgeMaskEffect;
- (PXGRegionMaskEffect)rightEdgeClippingMaskEffect;
- (PXGRegionMaskEffect)rightEdgeMaskEffect;
- (PXGRegionMaskEffect)topEdgeMaskEffect;
- (PXGTextLegibilityEffect)textLegibilityEffect;
- (PXStoryAnimationController)animationController;
- (PXStoryClip)clip;
- (PXStoryClipLayout)init;
- (PXStoryColorNormalizationAdjustment)colorNormalizationAdjustment;
- (PXStoryColorNormalizationEffect)colorNormalizationEffect;
- (PXStoryHUDViewConfiguration)HUDConfiguration;
- (PXStoryModel)model;
- (PXStoryRectAnimation)kenBurnsAnimation;
- (PXStoryResource)resource;
- (PXStorySmartGradientAdjustment)smartGradientAdjustment;
- (PXStoryStyleDescriptor)overrideStyleInfo;
- (PXStoryTextResourceInfo)currentTextResourceInfo;
- (PXStoryTextResourceInfo)relativeTextResourceInfo;
- (PXStoryTiltedEdgeInsetsAnimation)clippingAnimation;
- (UIEdgeInsets)clippingInsets;
- (UIEdgeInsets)paddingForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (double)manualContentsRectAmount;
- (double)primaryDividerAlpha;
- (double)relativeZPositionAboveLegibilityGradients;
- (double)secondaryDividerAlpha;
- (float)contentAlpha;
- (float)contentScale;
- (float)currentAudioVolume;
- (id)_effectWithClass:(Class)a3 reusableInstance:(id)a4;
- (id)_maskEffectForEdge:(unsigned int)a3 tiltedInset:(id)a4 bounds:(CGRect)a5 reusableInstance:(id)a6;
- (id)_textForHUD;
- (id)adjustmentForDisplayAsset:(id)a3 spriteIndex:(unsigned int)a4 inLayout:(id)a5;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axSpriteIndexes;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4;
- (id)drawingContextForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)itemPlacementSourceIdentifier;
- (id)musicDuckingToken;
- (id)spriteReferenceForContentSprite;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)_effectiveColorGradeKind;
- (int64_t)colorGradeKind;
- (int64_t)contentSpriteNormalizedFrameOverrideCoordinateSystem;
- (int64_t)customColorGradeKind;
- (int64_t)offsetFromCurrentSegment;
- (int64_t)stringDrawingOptionsForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (unint64_t)_titleKind;
- (unint64_t)assetPresentationStyles;
- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3;
- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3;
- (unint64_t)presentationIntentForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4;
- (unsigned)textResourceContentVersion;
- (void)_invalidateAnimations;
- (void)_invalidateAssetPresentationStyles;
- (void)_invalidateColorGradeKind;
- (void)_invalidateColorGradingEffect;
- (void)_invalidateColorNormalizationEffect;
- (void)_invalidateCombinedEffect;
- (void)_invalidateContent;
- (void)_invalidateContentMode;
- (void)_invalidateContentStyle;
- (void)_invalidateContentVersion;
- (void)_invalidateDisplayAsset;
- (void)_invalidateEdgeMaskEffects;
- (void)_invalidateHUD;
- (void)_invalidateInactiveImageFilterAdjustment;
- (void)_invalidateIsSegmentVisible;
- (void)_invalidateModelPresentedTextProperties;
- (void)_invalidateMusicDucking;
- (void)_invalidateOffsetFromCurrentSegment;
- (void)_invalidatePlayheadState;
- (void)_invalidateResource;
- (void)_invalidateSegmentIdentifiers;
- (void)_invalidateShouldAutoplay;
- (void)_invalidateSmartGradientAdjustment;
- (void)_invalidateTextLegibilityEffect;
- (void)_invalidateTextResourceSpriteFrame;
- (void)_invalidateVideoPresentationController;
- (void)_invalidateVideoPresentationControllerState;
- (void)_invalidateWantsHUD;
- (void)_updateAnimations;
- (void)_updateAssetPresentationStyles;
- (void)_updateColorGradeKind;
- (void)_updateColorGradingEffect;
- (void)_updateColorNormalizationEffect;
- (void)_updateCombinedEffect;
- (void)_updateContent;
- (void)_updateContentMode;
- (void)_updateContentStyle;
- (void)_updateDisplayAsset;
- (void)_updateEdgeMaskEffects;
- (void)_updateHUD;
- (void)_updateInactiveImageFilterAdjustment;
- (void)_updateIsSegmentVisible;
- (void)_updateModelPresentedTextProperties;
- (void)_updateMusicDucking;
- (void)_updateOffsetFromCurrentSegment;
- (void)_updatePlayheadState;
- (void)_updateResource;
- (void)_updateSegmentIdentifiers;
- (void)_updateShouldAutoplay;
- (void)_updateSmartGradientAdjustment;
- (void)_updateTextLegibilityEffect;
- (void)_updateTextResourceSpriteFrame;
- (void)_updateVideoPresentationController;
- (void)_updateVideoPresentationControllerState;
- (void)_updateWantsHUD;
- (void)_validateVideoPlaybackState;
- (void)alphaDidChange;
- (void)contentSizeDidChange;
- (void)dealloc;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)entityManagerDidChange;
- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4;
- (void)internationalStyleTitlePreferencesDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)setAssetPresentationStyles:(unint64_t)a3;
- (void)setAutoplayTimeRange:(id *)a3;
- (void)setBottomEdgeMaskEffect:(id)a3;
- (void)setCanAspectFitContent:(BOOL)a3;
- (void)setCanShowColorNormalizedContent:(BOOL)a3;
- (void)setCanShowDynamicContent:(BOOL)a3;
- (void)setCanShowHUD:(BOOL)a3;
- (void)setCanShowTextLegibilityEffect:(BOOL)a3;
- (void)setClip:(id)a3;
- (void)setClipTimeRange:(id *)a3;
- (void)setClippingAnimation:(id)a3;
- (void)setClippingInsets:(UIEdgeInsets)a3;
- (void)setColorGradeKind:(int64_t)a3;
- (void)setColorGradingEffect:(id)a3;
- (void)setColorNormalizationAdjustment:(id)a3;
- (void)setColorNormalizationEffect:(id)a3;
- (void)setCombinedEffect:(id)a3;
- (void)setContentAlpha:(float)a3;
- (void)setContentBounds:(CGRect)a3;
- (void)setContentEdgeInsets:(id *)a3;
- (void)setContentPrefersPresentationTypeView:(BOOL)a3;
- (void)setContentScale:(float)a3;
- (void)setContentSpriteNormalizedFrameOverride:(CGRect)a3 coordinateSystem:(int64_t)a4;
- (void)setContentsRectOverride:(id *)a3;
- (void)setContentsRectTransform:(CGAffineTransform *)a3;
- (void)setCornerRadius:(id)a3;
- (void)setCurrentTextResourceInfo:(id)a3;
- (void)setCustomColorGradeKind:(int64_t)a3;
- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4;
- (void)setDisableClippingAnimation:(BOOL)a3;
- (void)setDisplayAsset:(id)a3;
- (void)setDisplayedTimelineOriginalSize:(CGSize)a3;
- (void)setHUDTimer:(id)a3;
- (void)setInactiveImageFilterAdjustment:(id)a3;
- (void)setIsPlayheadInVideoTimeRange:(BOOL)a3 isPlayheadInAudioTimeRange:(BOOL)a4 wasPlayheadMovedManually:(BOOL)a5 currentAudioVolume:(float)a6;
- (void)setIsReadyForAutoplay:(BOOL)a3;
- (void)setIsSegmentVisible:(BOOL)a3;
- (void)setKenBurnsAnimation:(id)a3;
- (void)setLeftEdgeClippingMaskEffect:(id)a3;
- (void)setLeftEdgeMaskEffect:(id)a3;
- (void)setManualContentsRect:(CGRect)a3;
- (void)setManualContentsRectAmount:(double)a3;
- (void)setModel:(id)a3;
- (void)setMusicDuckingToken:(id)a3;
- (void)setOffsetFromCurrentSegment:(int64_t)a3;
- (void)setOverrideStyleInfo:(id)a3;
- (void)setPreferredPresentedContentsRect:(id *)a3;
- (void)setPresentedContentsRect:(id *)a3;
- (void)setPresentedKenBurnsAnimationContentSize:(CGSize)a3;
- (void)setPresentedKenBurnsAnimationCurrentRect:(id *)a3;
- (void)setPrimaryDividerAlpha:(double)a3;
- (void)setPrimaryDividerBounds:(CGRect)a3;
- (void)setPrimaryDividerScale:(CGSize)a3;
- (void)setRelativeTextResourceInfo:(id)a3;
- (void)setRelativeZPositionAboveLegibilityGradients:(double)a3;
- (void)setResource:(id)a3;
- (void)setRightEdgeClippingMaskEffect:(id)a3;
- (void)setRightEdgeMaskEffect:(id)a3;
- (void)setSecondaryDividerAlpha:(double)a3;
- (void)setSecondaryDividerBounds:(CGRect)a3;
- (void)setSecondaryDividerScale:(CGSize)a3;
- (void)setSegmentIdentifiers:(id)a3;
- (void)setShouldAspectFitContent:(BOOL)a3;
- (void)setShouldAutoplay:(BOOL)a3;
- (void)setShouldObserveInternationalStyleTitlePreferences:(BOOL)a3;
- (void)setSmartGradientAdjustment:(id)a3;
- (void)setTextFrameProgress:(id)a3;
- (void)setTextLegibilityEffect:(id)a3;
- (void)setTextResourceContentSize:(CGSize)a3;
- (void)setTextResourceContentVersion:(unsigned __int8)a3;
- (void)setTextResourceSpriteFrame:(CGRect)a3;
- (void)setTimelineLayout:(id)a3;
- (void)setTopEdgeMaskEffect:(id)a3;
- (void)setUseContentBoundsForContentEdgeInsets:(BOOL)a3;
- (void)setVideoPresentationController:(id)a3;
- (void)setWantsHUD:(BOOL)a3;
- (void)update;
- (void)willUpdate;
@end

@implementation PXStoryClipLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFrameProgress, 0);
  objc_storeStrong((id *)&self->_relativeTextResourceInfo, 0);
  objc_storeStrong((id *)&self->_currentTextResourceInfo, 0);
  objc_storeStrong((id *)&self->_HUDTimer, 0);
  objc_storeStrong((id *)&self->_kenBurnsAnimation, 0);
  objc_storeStrong((id *)&self->_clippingAnimation, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
  objc_storeStrong(&self->_musicDuckingToken, 0);
  objc_storeStrong((id *)&self->_segmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_inactiveImageFilterAdjustment, 0);
  objc_storeStrong((id *)&self->_smartGradientAdjustment, 0);
  objc_storeStrong((id *)&self->_combinedEffect, 0);
  objc_storeStrong((id *)&self->_rightEdgeClippingMaskEffect, 0);
  objc_storeStrong((id *)&self->_leftEdgeClippingMaskEffect, 0);
  objc_storeStrong((id *)&self->_rightEdgeMaskEffect, 0);
  objc_storeStrong((id *)&self->_bottomEdgeMaskEffect, 0);
  objc_storeStrong((id *)&self->_leftEdgeMaskEffect, 0);
  objc_storeStrong((id *)&self->_topEdgeMaskEffect, 0);
  objc_storeStrong((id *)&self->_colorNormalizationAdjustment, 0);
  objc_storeStrong((id *)&self->_textLegibilityEffect, 0);
  objc_storeStrong((id *)&self->_colorNormalizationEffect, 0);
  objc_storeStrong((id *)&self->_colorGradingEffect, 0);
  objc_storeStrong((id *)&self->_videoPresentationController, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_destroyWeak((id *)&self->_timelineLayout);
  objc_storeStrong((id *)&self->_overrideStyleInfo, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_clip, 0);
  objc_storeStrong((id *)&self->_HUDConfiguration, 0);
}

- (NSProgress)textFrameProgress
{
  return self->_textFrameProgress;
}

- (void)setTextResourceContentVersion:(unsigned __int8)a3
{
  self->_textResourceContentVersion = a3;
}

- (unsigned)textResourceContentVersion
{
  return self->_textResourceContentVersion;
}

- (void)setTextResourceContentSize:(CGSize)a3
{
  self->_textResourceContentSize = a3;
}

- (CGSize)textResourceContentSize
{
  double width = self->_textResourceContentSize.width;
  double height = self->_textResourceContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)textResourceSpriteFrame
{
  double x = self->_textResourceSpriteFrame.origin.x;
  double y = self->_textResourceSpriteFrame.origin.y;
  double width = self->_textResourceSpriteFrame.size.width;
  double height = self->_textResourceSpriteFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRelativeTextResourceInfo:(id)a3
{
}

- (PXStoryTextResourceInfo)relativeTextResourceInfo
{
  return self->_relativeTextResourceInfo;
}

- (PXStoryTextResourceInfo)currentTextResourceInfo
{
  return self->_currentTextResourceInfo;
}

- (BOOL)shouldObserveInternationalStyleTitlePreferences
{
  return self->_shouldObserveInternationalStyleTitlePreferences;
}

- (BOOL)shouldAspectFitContent
{
  return self->_shouldAspectFitContent;
}

- (NSTimer)HUDTimer
{
  return self->_HUDTimer;
}

- (BOOL)wantsHUD
{
  return self->_wantsHUD;
}

- (PXStoryRectAnimation)kenBurnsAnimation
{
  return self->_kenBurnsAnimation;
}

- (PXStoryTiltedEdgeInsetsAnimation)clippingAnimation
{
  return self->_clippingAnimation;
}

- (BOOL)isReadyForAutoplay
{
  return self->_isReadyForAutoplay;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)autoplayTimeRange
{
  long long v3 = *(_OWORD *)&self[39].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[38].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[39].var0.var3;
  return self;
}

- (BOOL)shouldAutoplay
{
  return self->_shouldAutoplay;
}

- (int64_t)contentSpriteNormalizedFrameOverrideCoordinateSystem
{
  return self->_contentSpriteNormalizedFrameOverrideCoordinateSystem;
}

- (CGRect)contentSpriteNormalizedFrameOverride
{
  double x = self->_contentSpriteNormalizedFrameOverride.origin.x;
  double y = self->_contentSpriteNormalizedFrameOverride.origin.y;
  double width = self->_contentSpriteNormalizedFrameOverride.size.width;
  double height = self->_contentSpriteNormalizedFrameOverride.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)contentsRectOverride
{
  long long v3 = *(_OWORD *)&self[38].var0.a;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[37].var0.tx;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tdouble x = *(_OWORD *)&self[38].var0.c;
  return self;
}

- (void)setPresentedContentsRect:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.c;
  long long v3 = *(_OWORD *)&a3->var0.tx;
  *(_OWORD *)&self->_presentedContentsRect.t.a = *(_OWORD *)&a3->var0.a;
  *(_OWORD *)&self->_presentedContentsRect.t.c = v4;
  *(_OWORD *)&self->_presentedContentsRect.t.tdouble x = v3;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)presentedContentsRect
{
  long long v3 = *(_OWORD *)&self[37].var0.a;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[36].var0.tx;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tdouble x = *(_OWORD *)&self[37].var0.c;
  return self;
}

- (void)setPreferredPresentedContentsRect:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.c;
  long long v3 = *(_OWORD *)&a3->var0.tx;
  *(_OWORD *)&self->_preferredPresentedContentsRect.t.a = *(_OWORD *)&a3->var0.a;
  *(_OWORD *)&self->_preferredPresentedContentsRect.t.c = v4;
  *(_OWORD *)&self->_preferredPresentedContentsRect.t.tdouble x = v3;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)preferredPresentedContentsRect
{
  long long v3 = *(_OWORD *)&self[36].var0.a;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[35].var0.tx;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tdouble x = *(_OWORD *)&self[36].var0.c;
  return self;
}

- (void)setPresentedKenBurnsAnimationCurrentRect:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.c;
  long long v3 = *(_OWORD *)&a3->var0.tx;
  *(_OWORD *)&self->_presentedKenBurnsAnimationCurrentRect.t.a = *(_OWORD *)&a3->var0.a;
  *(_OWORD *)&self->_presentedKenBurnsAnimationCurrentRect.t.c = v4;
  *(_OWORD *)&self->_presentedKenBurnsAnimationCurrentRect.t.tdouble x = v3;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)presentedKenBurnsAnimationCurrentRect
{
  long long v3 = *(_OWORD *)&self[35].var0.a;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[34].var0.tx;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tdouble x = *(_OWORD *)&self[35].var0.c;
  return self;
}

- (void)setPresentedKenBurnsAnimationContentSize:(CGSize)a3
{
  self->_presentedKenBurnsAnimationContentSize = a3;
}

- (CGSize)presentedKenBurnsAnimationContentSize
{
  double width = self->_presentedKenBurnsAnimationContentSize.width;
  double height = self->_presentedKenBurnsAnimationContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (void)setMusicDuckingToken:(id)a3
{
}

- (id)musicDuckingToken
{
  return self->_musicDuckingToken;
}

- (float)currentAudioVolume
{
  return self->_currentAudioVolume;
}

- (BOOL)wasPlayheadMovedManually
{
  return self->_wasPlayheadMovedManually;
}

- (BOOL)isPlayheadInAudioTimeRange
{
  return self->_isPlayheadInAudioTimeRange;
}

- (BOOL)isPlayheadInVideoTimeRange
{
  return self->_isPlayheadInVideoTimeRange;
}

- (int64_t)offsetFromCurrentSegment
{
  return self->_offsetFromCurrentSegment;
}

- (BOOL)isSegmentVisible
{
  return self->_isSegmentVisible;
}

- (NSIndexSet)segmentIdentifiers
{
  return self->_segmentIdentifiers;
}

- (void)setInactiveImageFilterAdjustment:(id)a3
{
}

- (PXGDisplayAssetAdjustment)inactiveImageFilterAdjustment
{
  return self->_inactiveImageFilterAdjustment;
}

- (void)setSmartGradientAdjustment:(id)a3
{
}

- (PXStorySmartGradientAdjustment)smartGradientAdjustment
{
  return self->_smartGradientAdjustment;
}

- (PXGCombinedEffect)combinedEffect
{
  return self->_combinedEffect;
}

- (PXGRegionMaskEffect)rightEdgeClippingMaskEffect
{
  return self->_rightEdgeClippingMaskEffect;
}

- (PXGRegionMaskEffect)leftEdgeClippingMaskEffect
{
  return self->_leftEdgeClippingMaskEffect;
}

- (PXGRegionMaskEffect)rightEdgeMaskEffect
{
  return self->_rightEdgeMaskEffect;
}

- (PXGRegionMaskEffect)bottomEdgeMaskEffect
{
  return self->_bottomEdgeMaskEffect;
}

- (PXGRegionMaskEffect)leftEdgeMaskEffect
{
  return self->_leftEdgeMaskEffect;
}

- (PXGRegionMaskEffect)topEdgeMaskEffect
{
  return self->_topEdgeMaskEffect;
}

- (void)setColorNormalizationAdjustment:(id)a3
{
}

- (PXStoryColorNormalizationAdjustment)colorNormalizationAdjustment
{
  return self->_colorNormalizationAdjustment;
}

- (PXGTextLegibilityEffect)textLegibilityEffect
{
  return self->_textLegibilityEffect;
}

- (PXStoryColorNormalizationEffect)colorNormalizationEffect
{
  return self->_colorNormalizationEffect;
}

- (PXGColorGradingEffect)colorGradingEffect
{
  return self->_colorGradingEffect;
}

- (int64_t)colorGradeKind
{
  return self->_colorGradeKind;
}

- (PXGDisplayAssetVideoPresentationController)videoPresentationController
{
  return self->_videoPresentationController;
}

- (unint64_t)assetPresentationStyles
{
  return self->_assetPresentationStyles;
}

- (PXStoryResource)resource
{
  return self->_resource;
}

- (void)setContentPrefersPresentationTypeView:(BOOL)a3
{
  self->_contentPrefersPresentationTypeView = a3;
}

- (BOOL)contentPrefersPresentationTypeView
{
  return self->_contentPrefersPresentationTypeView;
}

- (CGSize)displayedTimelineOriginalSize
{
  double width = self->_displayedTimelineOriginalSize.width;
  double height = self->_displayedTimelineOriginalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)secondaryDividerAlpha
{
  return self->_secondaryDividerAlpha;
}

- (CGSize)secondaryDividerScale
{
  double width = self->_secondaryDividerScale.width;
  double height = self->_secondaryDividerScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)secondaryDividerBounds
{
  double x = self->_secondaryDividerBounds.origin.x;
  double y = self->_secondaryDividerBounds.origin.y;
  double width = self->_secondaryDividerBounds.size.width;
  double height = self->_secondaryDividerBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)primaryDividerAlpha
{
  return self->_primaryDividerAlpha;
}

- (CGSize)primaryDividerScale
{
  double width = self->_primaryDividerScale.width;
  double height = self->_primaryDividerScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)primaryDividerBounds
{
  double x = self->_primaryDividerBounds.origin.x;
  double y = self->_primaryDividerBounds.origin.y;
  double width = self->_primaryDividerBounds.size.width;
  double height = self->_primaryDividerBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- ($AFFB3261E48324223FE33B3CF9FC7872)contentEdgeInsets
{
  long long v3 = *(_OWORD *)&self[20].var1.var1;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[20].var0.var2;
  *(_OWORD *)&retstr->var2.var0 = v3;
  long long v4 = *(_OWORD *)&self[20].var2.var2;
  *(_OWORD *)&retstr->var2.var2 = *(_OWORD *)&self[20].var2.var0;
  *(_OWORD *)&retstr->var3.var1 = v4;
  long long v5 = *(_OWORD *)&self[20].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[19].var3.var1;
  *(_OWORD *)&retstr->var0.var2 = v5;
  return self;
}

- (float)contentScale
{
  return self->_contentScale;
}

- (CGAffineTransform)contentsRectTransform
{
  long long v3 = *(_OWORD *)&self[34].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[33].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[34].c;
  return self;
}

- (BOOL)useContentBoundsForContentEdgeInsets
{
  return self->_useContentBoundsForContentEdgeInsets;
}

- (CGRect)contentBounds
{
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)contentAlpha
{
  return self->_contentAlpha;
}

- (double)relativeZPositionAboveLegibilityGradients
{
  return self->_relativeZPositionAboveLegibilityGradients;
}

- (BOOL)disableClippingAnimation
{
  return self->_disableClippingAnimation;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (CGRect)manualContentsRect
{
  double x = self->_manualContentsRect.origin.x;
  double y = self->_manualContentsRect.origin.y;
  double width = self->_manualContentsRect.size.width;
  double height = self->_manualContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)manualContentsRectAmount
{
  return self->_manualContentsRectAmount;
}

- (int64_t)customColorGradeKind
{
  return self->_customColorGradeKind;
}

- (BOOL)canAspectFitContent
{
  return self->_canAspectFitContent;
}

- (BOOL)canShowHUD
{
  return self->_canShowHUD;
}

- (BOOL)canShowTextLegibilityEffect
{
  return self->_canShowTextLegibilityEffect;
}

- (BOOL)canShowColorNormalizedContent
{
  return self->_canShowColorNormalizedContent;
}

- (BOOL)canShowDynamicContent
{
  return self->_canShowDynamicContent;
}

- (UIEdgeInsets)clippingInsets
{
  double top = self->_clippingInsets.top;
  double left = self->_clippingInsets.left;
  double bottom = self->_clippingInsets.bottom;
  double right = self->_clippingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTimelineLayout:(id)a3
{
}

- (PXGLayout)timelineLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timelineLayout);
  return (PXGLayout *)WeakRetained;
}

- (PXStoryStyleDescriptor)overrideStyleInfo
{
  return self->_overrideStyleInfo;
}

- (PXStoryModel)model
{
  return self->_model;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)clipTimeRange
{
  long long v3 = *(_OWORD *)&self[33].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[32].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[33].var0.var3;
  return self;
}

- (PXStoryClip)clip
{
  return self->_clip;
}

- (void)internationalStyleTitlePreferencesDidChange
{
  if (self->_resourceKind != 3) {
    PXAssertGetLog();
  }
  [(PXStoryClipLayout *)self _invalidateContentVersion];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v14 = a3;
  if ((void *)ModelObservationContext == a5)
  {
    if ((a4 & 0x400000000) != 0 || (a4 & 0x1001000000000000) != 0 && self->_resourceKind == 3) {
      [(PXStoryClipLayout *)self _invalidateContent];
    }
    if ((a4 & 0x10000000) != 0) {
      [(PXStoryClipLayout *)self _invalidateVideoPresentationControllerState];
    }
    if ((a4 & 0x4000080000000) != 0) {
      [(PXStoryClipLayout *)self _invalidateShouldAutoplay];
    }
    if ((a4 & 0x1000000000) != 0) {
      [(PXStoryClipLayout *)self _invalidateContentMode];
    }
    if (a4)
    {
      v9 = [(PXStoryClipLayout *)self model];
      int v10 = [v9 isExporting];

      if (v10) {
        [(PXStoryClipLayout *)self _invalidateVideoPresentationControllerState];
      }
    }
    if ((a4 & 0x20) != 0) {
      [(PXStoryClipLayout *)self _invalidateOffsetFromCurrentSegment];
    }
    if ((a4 & 0x840000000) != 0) {
      [(PXStoryClipLayout *)self _invalidatePlayheadState];
    }
    if ((a4 & 0x200) != 0)
    {
      [(PXStoryClipLayout *)self _invalidateColorGradeKind];
      if (self->_resourceKind == 3) {
        [(PXStoryClipLayout *)self _invalidateContentVersion];
      }
    }
    if ((a4 & 0x10000) != 0) {
      [(PXStoryClipLayout *)self _invalidateSmartGradientAdjustment];
    }
    if ((a4 & 0x10) != 0)
    {
      [(PXStoryClipLayout *)self _invalidateSegmentIdentifiers];
      [(PXStoryClipLayout *)self _invalidateOffsetFromCurrentSegment];
      v11 = [(PXStoryClipLayout *)self currentTextResourceInfo];
      uint64_t v12 = [v11 type];

      if (v12 == 1) {
        [(PXStoryClipLayout *)self _invalidateTextResourceSpriteFrame];
      }
    }
    if ((a4 & 0x40) != 0) {
      [(PXStoryClipLayout *)self _invalidateIsSegmentVisible];
    }
    if ((a4 & 0x1800000) != 0) {
      [(PXStoryClipLayout *)self _invalidateWantsHUD];
    }
    if ((a4 & 0x40) != 0)
    {
      [(PXStoryClipLayout *)self _invalidateHUD];
      if ((a4 & 0x80000000000000) == 0)
      {
LABEL_38:
        if ((a4 & 0x200000000000000) == 0) {
          goto LABEL_39;
        }
        goto LABEL_45;
      }
    }
    else if ((a4 & 0x80000000000000) == 0)
    {
      goto LABEL_38;
    }
    [(PXStoryClipLayout *)self _invalidateTextResourceSpriteFrame];
    [(PXStoryClipLayout *)self _invalidateContent];
    if ((a4 & 0x200000000000000) == 0)
    {
LABEL_39:
      if ((a4 & 0x40000000000000) == 0) {
        goto LABEL_49;
      }
LABEL_46:
      [(PXStoryClipLayout *)self _invalidateInactiveImageFilterAdjustment];
      [(PXStoryClipLayout *)self _invalidateContentVersion];
      goto LABEL_49;
    }
LABEL_45:
    [(PXStoryClipLayout *)self _invalidatePlayheadState];
    if ((a4 & 0x40000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_46;
  }
  if ((void *)ClippingAnimationObservationContext == a5)
  {
    if ((a4 & 4) != 0) {
      [(PXStoryClipLayout *)self _invalidateEdgeMaskEffects];
    }
  }
  else if ((void *)KenBurnsAnimationObservationContext == a5)
  {
    if ((a4 & 4) != 0) {
      [(PXStoryClipLayout *)self _invalidateContentStyle];
    }
  }
  else
  {
    if ((void *)FocusHintTranslationAnimatorObservationContext != a5)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2915 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((a4 & 2) != 0) {
      [(PXStoryClipLayout *)self _invalidateContent];
    }
  }
LABEL_49:
}

- (id)itemPlacementSourceIdentifier
{
  v2 = [(PXStoryClipLayout *)self model];
  long long v3 = [v2 uniqueIdentifier];

  return v3;
}

- (void)setDisplayedTimelineOriginalSize:(CGSize)a3
{
  if (a3.width != self->_displayedTimelineOriginalSize.width
    || a3.height != self->_displayedTimelineOriginalSize.height)
  {
    self->_displayedTimelineOriginalSize = a3;
    [(PXStoryClipLayout *)self _invalidateTextResourceSpriteFrame];
  }
}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = *((_OWORD *)off_1E5DAB038 + 1);
  long long v27 = *(_OWORD *)off_1E5DAB038;
  long long v28 = v8;
  long long v29 = *((_OWORD *)off_1E5DAB038 + 2);
  double v9 = *MEMORY[0x1E4F1DB20];
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (!v6) {
    goto LABEL_9;
  }
  v13 = [v6 displayedAsset];
  BOOL v14 = [(PXStoryClipLayout *)self _isDisplayingContentOfAsset:v13];

  if (!v14)
  {
    if ([(PXStoryClipLayout *)self isDisplayingTitle])
    {
      [v6 normalizedTitleRect];
LABEL_8:
      double v9 = v21;
      double v10 = v22;
      double v11 = v23;
      double v12 = v24;
      uint64_t v20 = 1;
      goto LABEL_10;
    }
    if ([(PXStoryClipLayout *)self isDisplayingSubtitle])
    {
      [v6 normalizedSubtitleRect];
      goto LABEL_8;
    }
LABEL_9:
    uint64_t v20 = 0;
    goto LABEL_10;
  }
  [v6 displayedAssetContentsRect];
  v15 = [(PXStoryClipLayout *)self itemPlacementSourceIdentifier];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __67__PXStoryClipLayout_setDetailedPlacementOverride_forItemReference___block_invoke;
  v26[3] = &unk_1E5DC4D90;
  v26[4] = self;
  [v6 adjustPreferredPlacementInSourceWithIdentifier:v15 configuration:v26];

  [v6 normalizedDisplayedAssetRect];
  double v9 = v16;
  double v10 = v17;
  double v11 = v18;
  double v12 = v19;
  uint64_t v20 = 2;
LABEL_10:
  v25[0] = v27;
  v25[1] = v28;
  v25[2] = v29;
  [(PXStoryClipLayout *)self setContentsRectOverride:v25];
  -[PXStoryClipLayout setContentSpriteNormalizedFrameOverride:coordinateSystem:](self, "setContentSpriteNormalizedFrameOverride:coordinateSystem:", v20, v9, v10, v11, v12);
}

void __67__PXStoryClipLayout_setDetailedPlacementOverride_forItemReference___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 preferredPresentedContentsRect];
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
  }
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  [v3 setDisplayedAssetContentsRect:v5];
}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PXStoryClipLayout_getDetailedPresentedPlacement_forItemReference___block_invoke;
  aBlock[3] = &unk_1E5DBA1E8;
  aBlock[4] = self;
  long long v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  long long v7 = [v5 displayedAsset];
  BOOL v8 = [(PXStoryClipLayout *)self _isDisplayingContentOfAsset:v7];

  if (v8)
  {
    [(PXStoryClipLayout *)self presentedContentsRect];
    *(_OWORD *)double v10 = *(_OWORD *)&v10[7];
    *(_OWORD *)&v10[2] = *(_OWORD *)&v10[9];
    *(_OWORD *)&v10[4] = *(_OWORD *)&v10[11];
    [v5 setDisplayedAssetContentsRect:v10];
    double v9 = [(PXStoryClipLayout *)self itemPlacementSourceIdentifier];
    [v5 registerSourceIdentifier:v9];

    v6[2](v6, 2);
    objc_msgSend(v5, "setNormalizedDisplayedAssetRect:");
  }
  else if ([(PXStoryClipLayout *)self isDisplayingTitle])
  {
    v6[2](v6, 1);
    objc_msgSend(v5, "setNormalizedTitleRect:");
  }
  else if ([(PXStoryClipLayout *)self isDisplayingSubtitle])
  {
    v6[2](v6, 1);
    objc_msgSend(v5, "setNormalizedSubtitleRect:");
  }
}

double __68__PXStoryClipLayout_getDetailedPresentedPlacement_forItemReference___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  double v9 = (double *)&v8;
  uint64_t v10 = 0x4010000000;
  double v11 = &unk_1AB5D584F;
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v12 = *MEMORY[0x1E4F1DB20];
  long long v13 = v2;
  id v3 = *(unsigned int **)(a1 + 32);
  uint64_t v4 = v3[219] | 0x100000000;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PXStoryClipLayout_getDetailedPresentedPlacement_forItemReference___block_invoke_2;
  v7[3] = &unk_1E5DAE918;
  v7[4] = v3;
  v7[5] = &v8;
  v7[6] = a2;
  [v3 enumerateSpritesInRange:v4 usingBlock:v7];
  double v5 = v9[4];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __68__PXStoryClipLayout_getDetailedPresentedPlacement_forItemReference___block_invoke_2()
{
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  return 0;
}

- (id)axSpriteIndexes
{
  id v3 = [(PXStoryClipLayout *)self model];
  if ([v3 viewMode] == 3)
  {
    int64_t resourceKind = self->_resourceKind;
    if (resourceKind == 3)
    {

LABEL_6:
      id v5 = (id)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:self->_contentSpriteIndex];
      goto LABEL_8;
    }

    if (resourceKind == 1) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28D60]);
LABEL_8:
  return v5;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_diagnosticHUDSpriteIndex != a3)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2752 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v8 = v7;
  double v9 = [(PXStoryClipLayout *)self HUDConfiguration];
  uint64_t v10 = [(PXStoryClipLayout *)self _textForHUD];
  [v9 setText:v10];

  return v9;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_diagnosticHUDSpriteIndex != a3)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2742 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v8 = v7;
  double v9 = objc_opt_class();

  return (Class)v9;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_contentSpriteIndex == a3)
  {
    uint64_t v8 = [(PXStoryClipLayout *)self resource];
    double v9 = objc_msgSend(v8, "px_storyResourceColor");
  }
  else
  {
    if (self->_primaryDividerSpriteIndex != a3 && self->_secondaryDividerSpriteIndex != a3)
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2732 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    double v9 = [MEMORY[0x1E4FB1618] blackColor];
  }

  return v9;
}

- (CGSize)attributedStringBoundingSizeForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = (PXStoryClipLayout *)a4;
  if (self->_contentSpriteIndex != a3)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2716 description:@"Invalid index!"];
  }
  if (v7 != self)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2717 description:@"Invalid layout!"];
  }
  uint64_t v8 = [(PXStoryClipLayout *)self currentTextResourceInfo];
  double v9 = [v8 drawingContext];
  [v9 totalBounds];
  double v11 = v10;
  double v13 = v12;

  double v14 = ceil(v11);
  double v15 = ceil(v13);
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (id)drawingContextForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = (PXStoryClipLayout *)a4;
  if (self->_contentSpriteIndex != a3)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2710 description:@"Invalid index!"];
  }
  if (v7 != self)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2711 description:@"Invalid layout!"];
  }
  uint64_t v8 = [(PXStoryClipLayout *)self currentTextResourceInfo];
  double v9 = [v8 drawingContext];

  return v9;
}

- (UIEdgeInsets)paddingForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = (PXStoryClipLayout *)a4;
  if (self->_contentSpriteIndex != a3)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2703 description:@"Invalid index!"];
  }
  if (v7 != self)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2704 description:@"Invalid layout!"];
  }
  uint64_t v8 = [(PXStoryClipLayout *)self currentTextResourceInfo];
  [v8 boundingRectPadding];

  PXEdgeInsetsMake();
}

- (int64_t)stringDrawingOptionsForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = (PXStoryClipLayout *)a4;
  if (self->_contentSpriteIndex != a3)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2697 description:@"Invalid index!"];
  }
  if (v7 != self)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2698 description:@"Invalid layout!"];
  }
  uint64_t v8 = [(PXStoryClipLayout *)self currentTextResourceInfo];
  int64_t v9 = [v8 drawingOptions];

  return v9;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = (PXStoryClipLayout *)a4;
  if (self->_contentSpriteIndex != a3)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2691 description:@"Invalid index!"];
  }
  if (v7 != self)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2692 description:@"Invalid layout!"];
  }
  uint64_t v8 = [(PXStoryClipLayout *)self currentTextResourceInfo];
  int64_t v9 = [v8 verticalAlignment];

  return v9;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = (PXStoryClipLayout *)a4;
  if (self->_contentSpriteIndex != a3)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2685 description:@"Invalid index!"];
  }
  if (v7 != self)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXStoryClipLayout.m" lineNumber:2686 description:@"Invalid layout!"];
  }
  uint64_t v8 = [(PXStoryClipLayout *)self currentTextResourceInfo];
  int64_t v9 = [v8 attributedString];

  return v9;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4 = [(PXStoryClipLayout *)self attributedStringForSpriteAtIndex:*(void *)&a3 inLayout:a4];
  id v5 = [v4 string];
  long long v6 = v5;
  if (!v5) {
    id v5 = &stru_1F00B0030;
  }
  id v7 = v5;

  return v7;
}

- (BOOL)shouldApplyCleanApertureCropToStillImagesInLayout:(id)a3
{
  id v3 = [(PXStoryClipLayout *)self model];
  uint64_t v4 = [v3 configuration];
  unint64_t v5 = ((unint64_t)[v4 options] >> 1) & 1;

  return v5;
}

- (BOOL)useLowMemoryDecodeInLayout:(id)a3
{
  id v3 = [(PXStoryClipLayout *)self model];
  uint64_t v4 = [v3 configuration];
  char v5 = [v4 useLowMemoryMode];

  return v5;
}

- (unint64_t)presentationIntentForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  uint64_t v4 = [(PXStoryClipLayout *)self model];
  if ([v4 isInline]) {
    unint64_t v5 = 5;
  }
  else {
    unint64_t v5 = 4;
  }

  return v5;
}

- (id)adjustmentForDisplayAsset:(id)a3 spriteIndex:(unsigned int)a4 inLayout:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self->_resourceKind == 5)
  {
    uint64_t v10 = [(PXStoryClipLayout *)self smartGradientAdjustment];
LABEL_8:
    double v13 = (void *)v10;
    goto LABEL_9;
  }
  if (self->_inactiveContentSpriteIndex == a4)
  {
    double v11 = [(PXStoryClipLayout *)self inactiveImageFilterAdjustment];

    if (v11)
    {
      uint64_t v10 = [(PXStoryClipLayout *)self inactiveImageFilterAdjustment];
      goto LABEL_8;
    }
  }
  double v12 = [(PXStoryClipLayout *)self colorNormalizationAdjustment];

  if (v12)
  {
    uint64_t v10 = [(PXStoryClipLayout *)self colorNormalizationAdjustment];
    goto LABEL_8;
  }
  double v13 = 0;
LABEL_9:

  return v13;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return self->_resourceKind != 5;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = [(PXStoryClipLayout *)self displayAsset];
  v6[1] = [(PXStoryClipLayout *)self displayAsset];
  [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultFromArray();
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  if (![(PXStoryClipLayout *)self canShowHUD] || self->_resourceKind != 1)
  {
    double v13 = 0;
    goto LABEL_58;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v7 = [(PXStoryClipLayout *)self model];
  id v8 = [(PXStoryClipLayout *)self displayAsset];
  if (a3 == 18)
  {
    [(PXGLayout *)self referenceSize];
    double v14 = [v7 timeline];
    [v14 originalSize];

    PXSizeDescription();
  }
  if (a3 == 19)
  {
    if ([(PXStoryClipLayout *)self isSegmentVisible]) {
      id v9 = @"Y";
    }
    else {
      id v9 = @"N";
    }
    [v6 appendFormat:@"Segment Visible: %@\n", v9];
    BOOL v10 = [(PXStoryClipLayout *)self shouldAutoplay];
    double v11 = @"⏸";
    if (v10) {
      double v11 = @"✅";
    }
    [v6 appendFormat:@"Autoplay: %@\n", v11];
    [(PXStoryClipLayout *)self autoplayTimeRange];
    double v12 = PXStoryTimeRangeDescription((uint64_t)v110);
    [v6 appendFormat:@"Time Range: %@\n", v12];

    [v8 playbackStyle];
    PXDisplayAssetPlaybackStyleDescription();
  }
  double v15 = [(PXStoryClipLayout *)self clip];
  objc_msgSend(v6, "appendFormat:", @"Clip ID: %li\n", objc_msgSend(v15, "identifier"));

  double v16 = [(PXStoryClipLayout *)self segmentIdentifiers];
  double v17 = objc_msgSend(v16, "px_shortDescription");
  [v6 appendFormat:@"Segment ID: %@\n", v17];

  if ([(PXStoryClipLayout *)self isSegmentVisible]) {
    double v18 = @"Y";
  }
  else {
    double v18 = @"N";
  }
  [v6 appendFormat:@"Segment Visible: %@\n", v18];
  [(PXStoryClipLayout *)self colorGradeKind];
  double v19 = PFStoryColorGradeKindToString();
  [v6 appendFormat:@"Color Grade Kind: %@\n", v19];

  if ([(PXStoryClipLayout *)self customColorGradeKind])
  {
    [(PXStoryClipLayout *)self customColorGradeKind];
    uint64_t v20 = PFStoryColorGradeKindToString();
    [v6 appendFormat:@"Custom Color Grade Kind: %@\n", v20];
  }
  double v21 = [(PXStoryClipLayout *)self colorNormalizationAdjustment];

  if (v21)
  {
    double v22 = [(PXStoryClipLayout *)self colorNormalizationAdjustment];
    double v23 = [v22 adjustmentSummary];
    [v6 appendFormat:@"Color Normalization Adjustment: %@\n", v23];

    double v24 = +[PXStorySettings sharedInstance];
    LODWORD(v23) = [v24 debugShowColorNormalizationValues];

    if (!v23) {
      goto LABEL_26;
    }
    v25 = [(PXStoryClipLayout *)self colorNormalizationAdjustment];
    uint64_t v26 = [v25 adjustmentDetails];
LABEL_24:
    v30 = (void *)v26;
    [v6 appendFormat:@"%@\n", v26];

    goto LABEL_25;
  }
  long long v27 = [(PXStoryClipLayout *)self colorNormalizationEffect];
  long long v28 = [v27 effectSummary];
  [v6 appendFormat:@"Color Normalization Effect: %@\n", v28];

  v25 = +[PXStorySettings sharedInstance];
  if ([v25 debugShowColorNormalizationValues])
  {
    long long v29 = [(PXStoryClipLayout *)self colorNormalizationEffect];

    if (!v29) {
      goto LABEL_26;
    }
    v25 = [(PXStoryClipLayout *)self colorNormalizationEffect];
    uint64_t v26 = [v25 effectDetails];
    goto LABEL_24;
  }
LABEL_25:

LABEL_26:
  [(PXStoryClipLayout *)self clipTimeRange];
  CMTime v109 = v108;
  v31 = PXStoryTimeDescription(&v109);
  [v6 appendFormat:@"Clip duration: %@\n", v31];

  v32 = [(PXStoryClipLayout *)self clip];
  v33 = v32;
  if (v32) {
    [v32 info];
  }
  else {
    bzero(v99, 0x300uLL);
  }
  v107[4] = v104;
  v107[5] = v105;
  v107[6] = v106;
  v107[0] = v100;
  v107[1] = v101;
  v107[2] = v102;
  v107[3] = v103;
  v34 = PXStoryDurationInfoDescription(v107);
  [v6 appendFormat:@"AEDL duration: %@\n", v34];

  v35 = [(PXStoryClipLayout *)self videoPresentationController];
  if (v35)
  {
    v72 = v8;
    v73 = v7;
    v36 = +[PXStorySettings sharedInstance];
    int v71 = [v36 debugShowVideoPlaybackDetails];

    v37 = [(PXStoryClipLayout *)self clip];
    PXStoryClipVideoSegmentTimeRange(v37, v98);
    v38 = PXStoryTimeRangeDescription((uint64_t)v98);
    [v6 appendFormat:@"Video Range: %@\n", v38];

    v39 = [(PXStoryClipLayout *)self clip];
    [(PXStoryClipLayout *)self clipTimeRange];
    PXStoryClipSegmentPlaybackTimeRangeIncludingJLCuts(v39, v91, 1u, &v92);
    int v40 = HIDWORD(v92);
    uint64_t v41 = v93;
    uint64_t v42 = v94;
    int v43 = v95;
    int v44 = v96;
    uint64_t v45 = v97;

    if ((v40 & 1) != 0 && (v44 & 1) != 0 && !v45 && (v42 & 0x8000000000000000) == 0)
    {
      uint64_t v83 = v92;
      int v84 = DWORD2(v92);
      int v85 = v40;
      uint64_t v86 = v41;
      uint64_t v87 = v42;
      int v88 = v43;
      int v89 = v44;
      uint64_t v90 = 0;
      v46 = PXStoryTimeRangeDescription((uint64_t)&v83);
      [v6 appendFormat:@"Playback Range: %@\n", v46];
    }
    id v8 = v72;
    id v7 = v73;
    if (v71)
    {
      [v35 actualTime];
      v47 = PXStoryTimeDescription(&v82);
      [v6 appendFormat:@"Current time: %@\n", v47];

      int v48 = [v35 isReadyForImmediatePlayback];
      v49 = @"NO";
      if (v48) {
        v49 = @"YES";
      }
      [v6 appendFormat:@"prerolled: %@\n", v49];
      uint64_t v50 = [v35 desiredPlayState];
      v51 = @"▶︎";
      if (!v50) {
        v51 = @"❚❚";
      }
      [v6 appendFormat:@"desired: %@\n", v51];
      uint64_t v52 = [v35 actualPlayState];
      if ((unint64_t)(v52 - 1) > 3) {
        v53 = @"?";
      }
      else {
        v53 = off_1E5DAE938[v52 - 1];
      }
      [v6 appendFormat:@"actual: %@\n", v53];
    }
    v54 = +[PXStorySettings sharedInstance];
    int v55 = [v54 debugShowAudioPlaybackDetails];

    v56 = [(PXStoryClipLayout *)self clip];
    if (v56)
    {
      v57 = v56;
      [v56 info];
      unint64_t v58 = v75;
      unint64_t v59 = v76;
      uint64_t v60 = v78;
      uint64_t v61 = v79;
      uint64_t v62 = v80;
      uint64_t v63 = v81;
      double v64 = v77;

      if (v75 > 3)
      {
        v65 = @"??";
        goto LABEL_49;
      }
    }
    else
    {
      bzero(v74, 0x300uLL);
      unint64_t v58 = 0;
      unint64_t v59 = 0;
      double v64 = 0.0;
      uint64_t v60 = 0;
      uint64_t v61 = 0;
      uint64_t v62 = 0;
      uint64_t v63 = 0;
    }
    v65 = off_1E5DC5230[v58];
LABEL_49:
    v66 = v65;
    if (v59 > 0xA) {
      v67 = @"?";
    }
    else {
      v67 = off_1E5DC5250[v59];
    }
    v68 = v67;
    [v6 appendFormat:@"Audio: %@ (%@)\n", v66, v68];

    if (v58 > 1) {
      int v69 = v55;
    }
    else {
      int v69 = 0;
    }
    if (v69 == 1)
    {
      objc_msgSend(v6, "appendFormat:", @"Volume: %0.2f\n", *(void *)&v64);
      objc_msgSend(v6, "appendFormat:", @"J&L Cuts: %0.2f/%0.2f\n", v60, v61);
      objc_msgSend(v6, "appendFormat:", @"Fade in/out: %0.2f/%0.2f\n", v62, v63);
    }
  }
  double v13 = (void *)[v6 copy];

LABEL_58:
  return v13;
}

- (void)_validateVideoPlaybackState
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  long long v2 = [(PXStoryClipLayout *)self videoPresentationController];
  if ([v2 desiredPlayState] == 1 && objc_msgSend(v2, "actualPlayState") != 2) {
    PXAssertGetLog();
  }
}

- (CGRect)_referenceRectForNormalizedCoordinateSystem:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      uint64_t v3 = [(PXStoryClipLayout *)self timelineLayout];
      if (v3)
      {
        [v3 contentSize];
        PXRectWithOriginAndSize();
      }
      PXAssertGetLog();
    case 1:
      [(PXGLayout *)self contentSize];
      PXRectWithOriginAndSize();
    case 0:
      PXAssertGetLog();
  }
  double v4 = *MEMORY[0x1E4F1DB20];
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)_denormalizeRect:(CGRect)a3 coordinateSystem:(int64_t)a4
{
  [(PXStoryClipLayout *)self _referenceRectForNormalizedCoordinateSystem:a4];
  if (!CGRectIsNull(v8)) {
    PXRectDenormalize();
  }
  double v4 = *MEMORY[0x1E4F1DB20];
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)_normalizeRect:(CGRect)a3 coordinateSystem:(int64_t)a4
{
  [(PXStoryClipLayout *)self _referenceRectForNormalizedCoordinateSystem:a4];
  if (!CGRectIsNull(v8)) {
    PXRectNormalize();
  }
  double v4 = *MEMORY[0x1E4F1DB20];
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (id)_textForHUD
{
  if ([(PXStoryClipLayout *)self wantsHUD])
  {
    uint64_t v3 = [(PXStoryClipLayout *)self model];
    double v4 = -[PXStoryClipLayout diagnosticTextForHUDType:displaySize:](self, "diagnosticTextForHUDType:displaySize:", [v3 diagnosticHUDType], 1920.0, 1080.0);
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (PXStoryHUDViewConfiguration)HUDConfiguration
{
  HUDConfiguration = self->_HUDConfiguration;
  if (!HUDConfiguration)
  {
    double v4 = objc_alloc_init(PXStoryHUDViewConfiguration);
    double v5 = self->_HUDConfiguration;
    self->_HUDConfiguration = v4;

    -[PXStoryHUDViewConfiguration setTextRelativePosition:](self->_HUDConfiguration, "setTextRelativePosition:", 0.5, 0.5);
    double v6 = [MEMORY[0x1E4FB1618] orangeColor];
    [(PXStoryHUDViewConfiguration *)self->_HUDConfiguration setTintColor:v6];

    HUDConfiguration = self->_HUDConfiguration;
  }
  return HUDConfiguration;
}

- (unint64_t)_titleKind
{
  uint64_t v3 = [(PXStoryClipLayout *)self model];
  if ([v3 thumbnailStyle] == 2)
  {
    unint64_t v4 = 32;
  }
  else if ([v3 thumbnailStyle] == 3 || objc_msgSend(v3, "thumbnailStyle") == 4)
  {
    unint64_t v4 = 64;
  }
  else if ([v3 thumbnailStyle] == 5)
  {
    unint64_t v4 = 16;
  }
  else if ([v3 thumbnailStyle] == 1)
  {
    [(PXGLayout *)self referenceSize];
    double v8 = v6 / v7;
    id v9 = +[PXStorySettings sharedInstance];
    [v9 feedCardWideLandscapeAspectRatio];
    double v11 = v10 + -0.001;

    if (v8 <= v11) {
      unint64_t v4 = 4;
    }
    else {
      unint64_t v4 = 8;
    }
  }
  else if ([v3 viewMode] == 5 || objc_msgSend(v3, "options") == 1)
  {
    [(PXGLayout *)self referenceSize];
    if (v12 == v13) {
      unint64_t v4 = 256;
    }
    else {
      unint64_t v4 = 128;
    }
    if ([v3 prefersExportLayoutMatchesPlayback]) {
      unint64_t v4 = 512;
    }
  }
  else
  {
    double v14 = [v3 configuration];
    int v15 = [v14 isPresentedForAirPlay];

    if (v15) {
      unint64_t v4 = 1024;
    }
    else {
      unint64_t v4 = 1;
    }
  }

  return v4;
}

- (void)_updateHUD
{
  diagnosticHUDSpriteIndedouble x = self->_diagnosticHUDSpriteIndex;
  if (diagnosticHUDSpriteIndex != -1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __31__PXStoryClipLayout__updateHUD__block_invoke;
    v3[3] = &unk_1E5DBA978;
    v3[4] = self;
    [(PXGLayout *)self modifySpritesInRange:diagnosticHUDSpriteIndex | 0x100000000 state:v3];
  }
}

uint64_t __31__PXStoryClipLayout__updateHUD__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float *a4, uint64_t a5)
{
  uint64_t result = [*(id *)(a1 + 32) wantsHUD];
  float v9 = 0.0;
  if (result)
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "alpha", 0.0);
    float v9 = v10;
  }
  *a4 = v9;
  *(_WORD *)(a5 + 32) = *(unsigned __int8 *)(*(void *)(a1 + 32) + 912);
  return result;
}

- (void)_invalidateHUD
{
  ++self->_HUDContentVersion;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x1000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x1000) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateHUD]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 2400, @"invalidating %lu after it already has been updated", 4096);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4096;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateWantsHUD
{
  id v5 = [(PXStoryClipLayout *)self model];
  if ([(PXStoryClipLayout *)self canShowHUD]
    && [v5 isHUDVisible]
    && self->_resourceKind == 1)
  {
    unint64_t v3 = [v5 diagnosticHUDType];
    if (v3 <= 0x13) {
      uint64_t v4 = (0xC4000u >> v3) & 1;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(PXStoryClipLayout *)self setWantsHUD:v4];
}

- (void)_invalidateWantsHUD
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x800) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateWantsHUD]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 2378, @"invalidating %lu after it already has been updated", 2048);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2048;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)setSecondaryDividerAlpha:(double)a3
{
}

- (void)setPrimaryDividerAlpha:(double)a3
{
}

- (void)setSecondaryDividerScale:(CGSize)a3
{
}

- (void)setPrimaryDividerScale:(CGSize)a3
{
}

- (void)setSecondaryDividerBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_secondaryDividerBounds = &self->_secondaryDividerBounds;
  if (!CGRectEqualToRect(self->_secondaryDividerBounds, a3))
  {
    p_secondaryDividerBounds->origin.CGFloat x = x;
    p_secondaryDividerBounds->origin.CGFloat y = y;
    p_secondaryDividerBounds->size.CGFloat width = width;
    p_secondaryDividerBounds->size.CGFloat height = height;
    [(PXStoryClipLayout *)self _invalidateContent];
  }
}

- (void)setPrimaryDividerBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_primaryDividerBounds = &self->_primaryDividerBounds;
  if (!CGRectEqualToRect(self->_primaryDividerBounds, a3))
  {
    p_primaryDividerBounds->origin.CGFloat x = x;
    p_primaryDividerBounds->origin.CGFloat y = y;
    p_primaryDividerBounds->size.CGFloat width = width;
    p_primaryDividerBounds->size.CGFloat height = height;
    [(PXStoryClipLayout *)self _invalidateContent];
  }
}

- (void)setContentEdgeInsets:(id *)a3
{
  if (self->_contentEdgeInsets.top.preRotationInset != a3->var0.var0
    || self->_contentEdgeInsets.top.rotationAngle != a3->var0.var1
    || self->_contentEdgeInsets.top.postRotationInset != a3->var0.var2)
  {
    goto LABEL_34;
  }
  BOOL v5 = self->_contentEdgeInsets.left.preRotationInset == a3->var1.var0
    && self->_contentEdgeInsets.left.rotationAngle == a3->var1.var1;
  BOOL v6 = v5 && self->_contentEdgeInsets.left.postRotationInset == a3->var1.var2;
  BOOL v7 = v6 && self->_contentEdgeInsets.bottom.preRotationInset == a3->var2.var0;
  BOOL v8 = v7 && self->_contentEdgeInsets.bottom.rotationAngle == a3->var2.var1;
  BOOL v9 = v8 && self->_contentEdgeInsets.bottom.postRotationInset == a3->var2.var2;
  BOOL v10 = v9 && self->_contentEdgeInsets.right.preRotationInset == a3->var3.var0;
  BOOL v11 = v10 && self->_contentEdgeInsets.right.rotationAngle == a3->var3.var1;
  if (!v11 || self->_contentEdgeInsets.right.postRotationInset != a3->var3.var2)
  {
LABEL_34:
    long long v13 = *(_OWORD *)&a3->var0.var2;
    *(_OWORD *)&self->_contentEdgeInsets.top.preRotationInset = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&self->_contentEdgeInsets.top.postRotationInset = v13;
    long long v14 = *(_OWORD *)&a3->var1.var1;
    long long v15 = *(_OWORD *)&a3->var2.var0;
    long long v16 = *(_OWORD *)&a3->var3.var1;
    *(_OWORD *)&self->_contentEdgeInsets.bottom.postRotationInset = *(_OWORD *)&a3->var2.var2;
    *(_OWORD *)&self->_contentEdgeInsets.right.rotationAngle = v16;
    *(_OWORD *)&self->_contentEdgeInsets.left.rotationAngle = v14;
    *(_OWORD *)&self->_contentEdgeInsets.bottom.preRotationInset = v15;
    [(PXStoryClipLayout *)self _invalidateEdgeMaskEffects];
  }
}

- (void)setContentScale:(float)a3
{
}

- (void)setContentsRectTransform:(CGAffineTransform *)a3
{
  p_contentsRectTransform = &self->_contentsRectTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_contentsRectTransform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->_contentsRectTransform.a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tCGFloat x = *(_OWORD *)&self->_contentsRectTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_contentsRectTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_contentsRectTransform->tCGFloat x = v9;
    *(_OWORD *)&p_contentsRectTransform->a = v8;
    [(PXStoryClipLayout *)self _invalidateContentStyle];
  }
}

- (void)_updateContentStyle
{
  unint64_t v3 = [(PXStoryClipLayout *)self kenBurnsAnimation];
  [(PXStoryClipLayout *)self cornerRadius];
  uint64_t v4 = [(PXStoryClipLayout *)self clip];
  BOOL v5 = (void *)v4;
  long long v8 = *((_OWORD *)off_1E5DAB040 + 1);
  long long v9 = *(_OWORD *)off_1E5DAB040;
  long long v7 = *((_OWORD *)off_1E5DAB040 + 2);
  if (v3)
  {
    objc_msgSend(v3, "currentRect", v7, v8, v9);
  }
  else if (v4 && self->_resourceKind == 1)
  {
    if ([(PXStoryClipLayout *)self disableClippingAnimation])
    {
      long long v6 = [v5 resource];
      objc_msgSend(v6, "px_storyResourceDisplayAsset");
      objc_claimAutoreleasedReturnValue();

      [(PXGLayout *)self referenceSize];
      PXSizeGetAspectRatio();
    }
    [v5 info];
  }
  [(PXStoryClipLayout *)self manualContentsRect];
  PXStoryRectFromCGRect();
}

uint64_t __40__PXStoryClipLayout__updateContentStyle__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)a3)
  {
    *(_OWORD *)(*(void *)(a3 + 24) + 36) = *(_OWORD *)(result + 88);
    [*(id *)(result + 32) contentScale];
    *(_DWORD *)(*(void *)(a3 + 24) + 60) = v4;
    PXGSpriteStyleSetPXStoryContentsRect();
  }
  return result;
}

void __40__PXStoryClipLayout__updateContentStyle__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 combinedEffect];
  LODWORD(v3) = [v7 effectId];
  id v5 = v4;
  uint64_t v6 = [v5 mutableEffectIds];

  *(_DWORD *)(v6 + 4 * *(unsigned int *)(a1 + 40)) = v3;
}

- (void)_invalidateContentStyle
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x400;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x400) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateContentStyle]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 2256, @"invalidating %lu after it already has been updated", 1024);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1024;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContentMode
{
  if ([(PXStoryClipLayout *)self isSegmentVisible])
  {
    id v4 = [(PXStoryClipLayout *)self model];
    if ([v4 shouldAspectFitCurrentSegment]) {
      BOOL v3 = [(PXStoryClipLayout *)self canAspectFitContent];
    }
    else {
      BOOL v3 = 0;
    }
    [(PXStoryClipLayout *)self setShouldAspectFitContent:v3];
  }
  else
  {
    [(PXStoryClipLayout *)self setShouldAspectFitContent:0];
  }
}

- (void)_invalidateContentMode
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x200000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x200000) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateContentMode]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 2248, @"invalidating %lu after it already has been updated", 0x200000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x200000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateAnimations
{
  BOOL v3 = [(PXStoryClipLayout *)self clip];
  id v4 = [(PXStoryClipLayout *)self animationController];
  id v5 = +[PXStorySettings sharedInstance];
  if (self->_resourceKind == 1)
  {
    int v6 = [(PXStoryClipLayout *)self canShowDynamicContent];
    if (v6)
    {
      BOOL v7 = [(PXStoryClipLayout *)self isSegmentVisible];
      LOBYTE(v6) = 0;
      if (v7)
      {
        if (v3)
        {
          int v6 = [v5 wantsAnimations];
          if (v6)
          {
            if (!v4) {
              PXAssertGetLog();
            }
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__PXStoryClipLayout__updateAnimations__block_invoke;
  v10[3] = &unk_1E5DAE8C8;
  char v13 = v6;
  v10[4] = self;
  id v11 = v3;
  id v12 = v5;
  id v8 = v5;
  id v9 = v3;
  [v4 performChanges:v10];
}

void __38__PXStoryClipLayout__updateAnimations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) kenBurnsAnimation];
  [v3 checkInAnimation:v4];

  id v5 = [*(id *)(a1 + 32) clippingAnimation];
  [v3 checkInAnimation:v5];

  if (*(unsigned char *)(a1 + 56))
  {
    memset(__src, 0, 512);
    int v6 = *(void **)(a1 + 40);
    if (v6) {
      [v6 info];
    }
    else {
      bzero(__src, 0x300uLL);
    }
    id v9 = [*(id *)(a1 + 32) model];
    CGAffineTransform v10 = [v9 configuration];
    uint64_t v11 = [v10 movementAnimationCurve];

    if (v11 == 5)
    {
      [*(id *)(a1 + 48) movementAnimationLinearFraction];
      uint64_t v13 = v12;
    }
    else
    {
      uint64_t v13 = 0;
    }
    long long v55 = 0uLL;
    uint64_t v56 = 0;
    long long v38 = __src[42];
    long long v39 = __src[43];
    *(void *)&long long v40 = *(void *)&__src[44];
    +[PXStoryTransitionFactory visibleOrderOutDurationForTransitionInfo:&v38];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__PXStoryClipLayout__updateAnimations__block_invoke_2;
    aBlock[3] = &unk_1E5DAE850;
    long long v53 = v55;
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v54 = v56;
    aBlock[4] = v14;
    long long v15 = _Block_copy(aBlock);
    BOOL v7 = 0;
    if (([*(id *)(a1 + 32) disableClippingAnimation] & 1) == 0)
    {
      long long v16 = ClippingAnimationIdentifierForClip(*(void **)(a1 + 40));
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __38__PXStoryClipLayout__updateAnimations__block_invoke_3;
      v46[3] = &unk_1E5DAE878;
      memcpy(v49, __src, sizeof(v49));
      id v47 = *(id *)(a1 + 40);
      id v48 = v15;
      uint64_t v50 = v11;
      uint64_t v51 = v13;
      BOOL v7 = [v3 checkOutAnimationWithIdentifier:v16 creationBlock:v46];
    }
    uint64_t v45 = *((void *)&__src[41] + 1);
    long long v43 = *(_OWORD *)((char *)&__src[39] + 8);
    long long v44 = *(_OWORD *)((char *)&__src[40] + 8);
    long long v38 = *(_OWORD *)((char *)&__src[34] + 8);
    long long v39 = *(_OWORD *)((char *)&__src[35] + 8);
    long long v40 = *(_OWORD *)((char *)&__src[36] + 8);
    long long v41 = *(_OWORD *)((char *)&__src[37] + 8);
    long long v42 = *(_OWORD *)((char *)&__src[38] + 8);
    double v17 = KenBurnsAnimationIdentifierForClip(*(void **)(a1 + 40));
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    long long v31 = v42;
    long long v32 = v43;
    long long v33 = v44;
    long long v27 = v38;
    long long v28 = v39;
    long long v29 = v40;
    double v22 = __38__PXStoryClipLayout__updateAnimations__block_invoke_4;
    double v23 = &unk_1E5DAE8A0;
    double v18 = *(void **)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v34 = v45;
    long long v30 = v41;
    id v25 = v18;
    memcpy(v35, __src, sizeof(v35));
    id v26 = v15;
    uint64_t v36 = v11;
    uint64_t v37 = v13;
    id v19 = v15;
    id v8 = [v3 checkOutAnimationWithIdentifier:v17 creationBlock:&v20];
  }
  else
  {
    BOOL v7 = 0;
    id v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setClippingAnimation:", v7, v20, v21, v22, v23, v24);
  [*(id *)(a1 + 32) setKenBurnsAnimation:v8];
}

void __38__PXStoryClipLayout__updateAnimations__block_invoke_2(uint64_t a1@<X0>, CMTime *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  CMTime lhs = *a2;
  CMTime rhs = *(CMTime *)(a1 + 40);
  CMTimeAdd((CMTime *)a4, &lhs, &rhs);
  if (![*(id *)(a1 + 32) offsetFromCurrentSegment] && a3)
  {
    BOOL v7 = [*(id *)(a1 + 32) model];
    id v8 = v7;
    if (v7) {
      [v7 timeLeftInCurrentSegment];
    }
    else {
      memset(&v9, 0, sizeof(v9));
    }
    CMTime lhs = *(CMTime *)a4;
    CMTime rhs = v9;
    CMTimeAdd(&v10, &lhs, &rhs);
    *(CMTime *)a4 = v10;
  }
}

PXStoryTiltedEdgeInsetsAnimation *__38__PXStoryClipLayout__updateAnimations__block_invoke_3(uint64_t a1)
{
  void (*v15)(void *__return_ptr);
  PXStoryTiltedEdgeInsetsAnimation *v16;
  _OWORD v18[6];
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  void v25[3];
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  uint64_t v45;
  uint64_t vars8;

  long long v2 = *(_OWORD *)(a1 + 560);
  long long v3 = *(_OWORD *)(a1 + 576);
  long long v4 = *(_OWORD *)(a1 + 528);
  long long v42 = *(_OWORD *)(a1 + 544);
  long long v43 = v2;
  long long v44 = v3;
  long long v5 = *(_OWORD *)(a1 + 496);
  long long v6 = *(_OWORD *)(a1 + 512);
  long long v7 = *(_OWORD *)(a1 + 464);
  long long v38 = *(_OWORD *)(a1 + 480);
  long long v39 = v5;
  long long v40 = v6;
  long long v41 = v4;
  long long v8 = *(_OWORD *)(a1 + 432);
  long long v9 = *(_OWORD *)(a1 + 400);
  uint64_t v34 = *(_OWORD *)(a1 + 416);
  v35 = v8;
  long long v10 = *(_OWORD *)(a1 + 432);
  long long v11 = *(_OWORD *)(a1 + 464);
  uint64_t v36 = *(_OWORD *)(a1 + 448);
  uint64_t v37 = v11;
  long long v12 = *(_OWORD *)(a1 + 400);
  long long v32 = *(_OWORD *)(a1 + 384);
  long long v33 = v12;
  long long v28 = v34;
  long long v29 = v10;
  long long v30 = v36;
  long long v31 = v7;
  uint64_t v45 = *(void *)(a1 + 592);
  id v26 = v32;
  long long v27 = v9;
  uint64_t v13 = [PXStoryTiltedEdgeInsetsAnimation alloc];
  uint64_t v14 = ClippingAnimationIdentifierForClip(*(void **)(a1 + 32));
  long long v15 = *(void (**)(void *__return_ptr))(*(void *)(a1 + 40) + 16);
  id v19 = v44;
  *(void *)&uint64_t v20 = v45;
  v15(v25);
  uint64_t v21 = v28;
  double v22 = v29;
  double v23 = v30;
  uint64_t v24 = v31;
  id v19 = v26;
  uint64_t v20 = v27;
  v18[2] = v40;
  v18[3] = v41;
  v18[4] = v42;
  v18[5] = v43;
  v18[0] = v38;
  v18[1] = v39;
  long long v16 = -[PXStoryTiltedEdgeInsetsAnimation initWithIdentifier:sourceEdgeInsets:targetEdgeInsets:duration:curveInfo:](v13, "initWithIdentifier:sourceEdgeInsets:targetEdgeInsets:duration:curveInfo:", v14, &v19, v18, v25, *(void *)(a1 + 816), *(void *)(a1 + 824));

  return v16;
}

void __38__PXStoryClipLayout__updateAnimations__block_invoke_4(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) model];
  if ([v2 isPerformingViewControllerTransition])
  {
  }
  else
  {
    uint64_t v3 = objc_opt_class();
    [*(id *)(a1 + 32) presentedKenBurnsAnimationContentSize];
    double v5 = v4;
    double v7 = v6;
    [*(id *)(a1 + 32) contentSize];
    LOBYTE(v3) = objc_msgSend((id)v3, "shouldContinueKenBurnsAnimationFromPreviousPresentedContentSize:toCurrentContentSize:", v5, v7, v8, v9);

    if ((v3 & 1) == 0) {
      goto LABEL_6;
    }
  }
  long long v10 = *(void **)(a1 + 32);
  if (v10) {
    [v10 presentedKenBurnsAnimationCurrentRect];
  }
LABEL_6:
  PXStoryRectIsNull();
}

- (void)_invalidateAnimations
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x80;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x80) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateAnimations]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 2156, @"invalidating %lu after it already has been updated", 128);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 128;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updatePlayheadState
{
}

- (void)_invalidatePlayheadState
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x100000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x100000) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidatePlayheadState]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 2075, @"invalidating %lu after it already has been updated", 0x100000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x100000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateOffsetFromCurrentSegment
{
  uint64_t v3 = [(PXStoryClipLayout *)self model];
  id v8 = [v3 timeline];

  double v4 = [(PXStoryClipLayout *)self model];
  uint64_t v5 = objc_msgSend(v8, "indexOfSegmentWithIdentifier:", objc_msgSend(v4, "currentSegmentIdentifier"));

  double v6 = [(PXStoryClipLayout *)self segmentIdentifiers];
  uint64_t v7 = objc_msgSend(v8, "indexOfSegmentWithIdentifier:", objc_msgSend(v6, "firstIndex"));

  [(PXStoryClipLayout *)self setOffsetFromCurrentSegment:v7 - v5];
}

- (void)_invalidateOffsetFromCurrentSegment
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x800000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x800000) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateOffsetFromCurrentSegment]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 2064, @"invalidating %lu after it already has been updated", 0x800000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x800000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateIsSegmentVisible
{
  id v5 = [(PXStoryClipLayout *)self model];
  uint64_t v3 = [v5 visibleSegmentIdentifiers];
  double v4 = [(PXStoryClipLayout *)self segmentIdentifiers];
  -[PXStoryClipLayout setIsSegmentVisible:](self, "setIsSegmentVisible:", objc_msgSend(v3, "px_intersectsWithIndexSet:", v4));
}

- (void)_invalidateIsSegmentVisible
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x40;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateIsSegmentVisible]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 2056, @"invalidating %lu after it already has been updated", 64);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 64;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateSegmentIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  double v4 = [(PXStoryClipLayout *)self model];
  id v5 = [v4 timeline];
  [(PXStoryClipLayout *)self clipTimeRange];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PXStoryClipLayout__updateSegmentIdentifiers__block_invoke;
  v7[3] = &unk_1E5DAE828;
  id v8 = v3;
  id v6 = v3;
  [v5 enumerateSegmentsInTimeRange:v9 usingBlock:v7];

  [(PXStoryClipLayout *)self setSegmentIdentifiers:v6];
}

uint64_t __46__PXStoryClipLayout__updateSegmentIdentifiers__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a2 >= 1)
  {
    uint64_t v14 = v7;
    uint64_t v15 = v6;
    uint64_t v16 = v5;
    uint64_t v17 = v4;
    uint64_t v18 = v8;
    uint64_t v19 = v9;
    uint64_t v11 = a2;
    uint64_t v12 = result;
    do
    {
      uint64_t v13 = *a4;
      a4 += 25;
      uint64_t result = objc_msgSend(*(id *)(v12 + 32), "addIndex:", v13, v14, v15, v16, v17, v18, v19);
      --v11;
    }
    while (v11);
  }
  return result;
}

- (void)_invalidateSegmentIdentifiers
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateSegmentIdentifiers]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 2042, @"invalidating %lu after it already has been updated", 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 32;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContent
{
  [(PXGLayout *)self contentSize];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = [(PXGLayout *)self localNumberOfSprites];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__PXStoryClipLayout__updateContent__block_invoke;
  v9[3] = &unk_1E5DAE800;
  v9[4] = self;
  v9[5] = v5;
  v9[6] = v7;
  v9[7] = a2;
  [(PXGLayout *)self modifySpritesInRange:v8 << 32 fullState:v9];
  [(PXStoryClipLayout *)self _invalidateContentStyle];
  [(PXStoryClipLayout *)self _invalidateHUD];
}

void __35__PXStoryClipLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  __src[97] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(v5 + 32), "contentBounds", v2);
  CGFloat x = v221.origin.x;
  CGFloat y = v221.origin.y;
  CGFloat width = v221.size.width;
  CGFloat height = v221.size.height;
  if (CGRectIsNull(v221)) {
    PXRectWithOriginAndSize();
  }
  [*(id *)(v6 + 32) alpha];
  double v12 = v11;
  [*(id *)(v6 + 32) contentAlpha];
  double v14 = v12 * v13;
  [*(id *)(v6 + 32) displayScale];
  *(float *)&double v15 = v15;
  float v201 = *(float *)&v15;
  [*(id *)(v6 + 32) referenceDepth];
  double v205 = v16;
  uint64_t v17 = [*(id *)(v6 + 32) model];
  int v18 = [v17 isExporting];

  uint64_t v19 = [*(id *)(v6 + 32) clip];
  uint64_t v20 = v19;
  int v193 = v18;
  if (v19)
  {
    [v19 info];
    float64x2_t v21 = v219;
  }
  else
  {
    bzero(v218, 0x300uLL);
    float64x2_t v21 = 0uLL;
  }
  float v22 = v14;
  float v196 = v22;
  float32x2_t spid = vmul_n_f32(vcvt_f32_f64(v21), v201);

  double v23 = [*(id *)(v6 + 32) model];
  int v200 = 16 * ([v23 viewMode] == 1);
  char v24 = *((unsigned char *)off_1E5DAAF90 + 70);
  v197 = [v23 timeline];
  char v25 = 0;
  uint64_t v26 = 0;
  long long v27 = *(void **)(v6 + 32);
  double v28 = 0.0;
  float v198 = 0.0;
  CGFloat v204 = height;
  CGFloat v199 = x;
  CGFloat v194 = y;
  CGFloat v195 = width;
  double v210 = height;
  double v209 = width;
  double v29 = y;
  double v30 = x;
  switch(v27[112])
  {
    case 1:
      long long v31 = [v27 clip];
      long long v32 = v31;
      memset(__dst, 0, 512);
      if (v31) {
        [v31 info];
      }
      else {
        bzero(__dst, 0x300uLL);
      }
      if (([v23 isPerformingViewControllerTransition] & 1) != 0
        || *(unsigned char *)(*(void *)(v6 + 32) + 913))
      {
        uint64_t v80 = objc_msgSend(v197, "clipWithIdentifier:", objc_msgSend(v32, "identifier"));
        uint64_t v81 = v80;
        if (v80)
        {
          [v80 info];
          memcpy(__dst, __src, sizeof(__dst));
        }
      }
      memcpy(__src, __dst, 0x300uLL);
      PXStoryMediaSizeForDisplayAssetClipInfo((uint64_t)__src);
    case 2:
      goto LABEL_44;
    case 3:
      [v27 textResourceSpriteFrame];
      double v30 = v38;
      double v29 = v39;
      double v209 = v40;
      double v210 = v41;
      [*(id *)(v6 + 32) relativeZPositionAboveLegibilityGradients];
      double v42 = 0.4;
      if (v43 >= 0.4)
      {
        [*(id *)(v6 + 32) relativeZPositionAboveLegibilityGradients];
        double v42 = v44;
      }
      *(double *)&long long v45 = v209;
      *((double *)&v45 + 1) = v210;
      *(_OWORD *)spida = v45;
      [*(id *)(v6 + 32) referenceSize];
      double v47 = v46;
      double v49 = v48;
      [*(id *)(v6 + 32) displayedTimelineOriginalSize];
      double v51 = v50;
      double v53 = v52;
      if ([v23 thumbnailStyle] == 2
        || [v23 thumbnailStyle] == 3
        || [v23 thumbnailStyle] == 4)
      {
        float64x2_t v54 = *(float64x2_t *)spida;
      }
      else
      {
        float64x2_t v54 = *(float64x2_t *)spida;
        if (v47 < v51)
        {
          double v30 = v30 * (v47 / v51);
          double v29 = v29 * (v49 / v53);
          double v209 = v209 * (v47 / v51);
          double v210 = v210 * (v49 / v53);
        }
      }
      float32x2_t v55 = vcvt_f32_f64(v54);
      uint64_t v56 = [*(id *)(v6 + 32) currentTextResourceInfo];
      if ([v56 layoutScheme] == 1)
      {
        v57 = [v23 layoutSpec];
        [v57 distanceBetweenChapterTitleBaselineAndBottomWithChrome];
        double v59 = v58;
        [v57 distanceBetweenChapterTitleBaselineAndBottomWithoutChrome];
        if (v59 != v60)
        {
          double v61 = *(double *)(v6 + 48);
          [v57 distanceBetweenChapterTitleBaselineAndBottomWithChrome];
          double v63 = v61 - v62;
          v222.origin.CGFloat x = v30;
          v222.origin.CGFloat y = v29;
          v222.size.CGFloat width = v209;
          v222.size.CGFloat height = v210;
          double MaxY = CGRectGetMaxY(v222);
          [v56 boundingRectPadding];
          double v66 = MaxY - v65;
          [v23 chromeVisibilityFraction];
          double v29 = v29 - v67 * fmax(v66 - v63, 0.0);
        }
      }
      CGFloat x = v199;
      float32x2_t spid = vmul_n_f32(v55, v201);
      int v68 = [*(id *)(v6 + 32) shouldAspectFitContent];
      [v23 titleOpacity];
      double v70 = 0.0;
      if (!v68) {
        double v70 = v196;
      }
      double v28 = v42 * -v205;
      float v71 = v69 * v70;
      float v196 = v71;

      char v24 = 3;
      uint64_t v26 = 257;
      char v25 = 3;
      CGFloat y = v194;
      goto LABEL_44;
    case 4:
      long long v33 = [v27 resource];
      uint64_t v34 = objc_msgSend(v33, "px_storyResourceColorType");
      if (v34 == 1)
      {
        CGFloat v36 = height;
        double v35 = v205 * -0.0;
      }
      else
      {
        double v35 = 0.0;
        CGFloat v36 = v204;
        if (!v34)
        {
          uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
          [v37 handleFailureInMethod:*(void *)(v6 + 56) object:*(void *)(v6 + 32) file:@"PXStoryClipLayout.m" lineNumber:1909 description:@"Code which should be unreachable has been reached"];

          abort();
        }
      }

      uint64_t v26 = 0;
      char v25 = 5;
      __asm { FMOV            V0.2S, #1.0 }
      float32x2_t spid = _D0;
      double v210 = v36;
      double v209 = width;
      double v29 = y;
      double v30 = x;
      double v28 = v35;
      goto LABEL_44;
    case 5:
      v72 = [v27 clip];
      v73 = v72;
      if (v72)
      {
        [v72 info];
        float64x2_t v74 = v216;
      }
      else
      {
        bzero(v215, 0x300uLL);
        float64x2_t v74 = 0uLL;
      }
      float64x2_t v211 = v74;

      CMTime v82 = [*(id *)(v6 + 32) clip];
      uint64_t v83 = v82;
      if (!v82)
      {
        bzero(v214, 0x300uLL);
        goto LABEL_41;
      }
      [v82 info];
      if ((v214[32] & 1) == 0)
      {
LABEL_41:

        goto LABEL_42;
      }
      char v84 = [*(id *)(v6 + 32) shouldAspectFitContent];

      if ((v84 & 1) == 0)
      {
        v200 |= [*(id *)(v6 + 32) isSegmentVisible];
        float v196 = 0.0;
      }
LABEL_42:
      uint64_t v26 = 0;
      double v28 = v205 * -0.1;
      float32x2_t spid = vcvt_f32_f64(v211);
      char v25 = 2;
      float v85 = v205 * -0.19;
      float v198 = v85;
LABEL_43:
      double v210 = height;
      double v209 = width;
      double v29 = y;
      double v30 = x;
LABEL_44:
      *(double *)(*(void *)(v6 + 32) + 904) = 1.0;
      [*(id *)(v6 + 32) contentSpriteNormalizedFrameOverride];
      CGFloat v86 = v223.origin.y;
      double v202 = v28;
      if (!CGRectIsNull(v223))
      {
        double v189 = *MEMORY[0x1E4F1DB20];
        double v190 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v191 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v192 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        uint64_t v87 = [*(id *)(v6 + 32) contentSpriteNormalizedFrameOverrideCoordinateSystem];
        CGFloat v188 = v86;
        if (v87 == 2)
        {
          uint64_t v90 = [*(id *)(v6 + 32) timelineLayout];
          if (v90)
          {
            [v90 contentSize];
            PXRectWithOriginAndSize();
          }
          PXAssertGetLog();
        }
        CGFloat v88 = v195;
        CGFloat v89 = v204;
        if (v87 != 1)
        {
          if (!v87) {
            PXAssertGetLog();
          }
          CGFloat x = v189;
          CGFloat y = v190;
          CGFloat v88 = v191;
          CGFloat v89 = v192;
        }
        v224.origin.CGFloat x = x;
        v224.origin.CGFloat y = y;
        v224.size.CGFloat width = v88;
        v224.size.CGFloat height = v89;
        if (!CGRectIsNull(v224)) {
          PXRectDenormalize();
        }
      }
      uint64_t v91 = *(void *)(v6 + 32);
      uint64_t v92 = *(unsigned int *)(v91 + 876);
      if (v92 == -1)
      {
        double v109 = v205;
        float v108 = v198;
      }
      else
      {
        uint64_t v93 = v4[2] + 32 * v92;
        float v94 = v202;
        v225.origin.CGFloat x = v30;
        v225.origin.CGFloat y = v29;
        v225.size.CGFloat width = v209;
        v225.size.CGFloat height = v210;
        CGFloat MidX = CGRectGetMidX(v225);
        v226.origin.CGFloat x = v30;
        v226.origin.CGFloat y = v29;
        v226.size.CGFloat width = v209;
        v226.size.CGFloat height = v210;
        CGFloat MidY = CGRectGetMidY(v226);
        v227.origin.CGFloat x = v30;
        v227.origin.CGFloat y = v29;
        v227.size.CGFloat width = v209;
        v227.size.CGFloat height = v210;
        CGFloat v203 = CGRectGetWidth(v227);
        v228.origin.CGFloat x = v30;
        v228.origin.CGFloat y = v29;
        v228.size.CGFloat width = v209;
        v228.size.CGFloat height = v210;
        CGFloat v97 = CGRectGetHeight(v228);
        v98.f64[0] = v203;
        v98.f64[1] = v97;
        *(CGFloat *)uint64_t v93 = MidX;
        *(CGFloat *)(v93 + 8) = MidY;
        *(double *)(v93 + 16) = v94;
        *(float32x2_t *)(v93 + 24) = vcvt_f32_f64(v98);
        uint64_t v99 = v4[4];
        *(unsigned char *)(v99 + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 876) + 1) = v25;
        *(float32x2_t *)(v99 + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 876) + 8) = spid;
        uint64_t v100 = v4[4];
        *(_WORD *)(v100 + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 876) + 32) = *(unsigned __int8 *)(*(void *)(v6 + 32) + 892);
        *(void *)(v100 + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 876) + 24) = v26;
        *(unsigned char *)(v100 + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 876) + 34) = v200;
        long long v101 = (_OWORD *)(v4[3] + 160 * *(unsigned int *)(*(void *)(v6 + 32) + 876));
        long long v102 = *((_OWORD *)off_1E5DAAF90 + 1);
        *long long v101 = *(_OWORD *)off_1E5DAAF90;
        v101[1] = v102;
        long long v103 = *((_OWORD *)off_1E5DAAF90 + 5);
        v101[4] = *((_OWORD *)off_1E5DAAF90 + 4);
        v101[5] = v103;
        long long v104 = *((_OWORD *)off_1E5DAAF90 + 3);
        v101[2] = *((_OWORD *)off_1E5DAAF90 + 2);
        v101[3] = v104;
        long long v105 = *((_OWORD *)off_1E5DAAF90 + 9);
        v101[8] = *((_OWORD *)off_1E5DAAF90 + 8);
        v101[9] = v105;
        long long v106 = *((_OWORD *)off_1E5DAAF90 + 7);
        v101[6] = *((_OWORD *)off_1E5DAAF90 + 6);
        v101[7] = v106;
        uint64_t v107 = v4[3];
        *(float *)(v107 + 160 * *(unsigned int *)(*(void *)(v6 + 32) + 876)) = v196;
        float v108 = v198;
        *(float *)(v107 + 160 * *(unsigned int *)(*(void *)(v6 + 32) + 876) + 52) = v198;
        *(unsigned char *)(v107 + 160 * *(unsigned int *)(*(void *)(v6 + 32) + 876) + 70) = v24;
        uint64_t v91 = *(void *)(v6 + 32);
        double v109 = v205;
      }
      unsigned int v110 = *(_DWORD *)(v91 + 872);
      if (v110 != -1)
      {
        if (*(void *)(v91 + 896) == 1)
        {
          v111 = [v23 configuration];
          int v112 = [v111 allowInactiveAppearance];

          if (!v112) {
            char v25 = 0;
          }
          unsigned int v110 = *(_DWORD *)(*(void *)(v6 + 32) + 872);
        }
        else
        {
          char v25 = 0;
        }
        uint64_t v113 = v4[2] + 32 * v110;
        v229.origin.CGFloat x = v30;
        v229.origin.CGFloat y = v29;
        v229.size.CGFloat width = v209;
        v229.size.CGFloat height = v210;
        CGFloat v115 = CGRectGetMidX(v229);
        v230.origin.CGFloat x = v30;
        v230.origin.CGFloat y = v29;
        v230.size.CGFloat width = v209;
        v230.size.CGFloat height = v210;
        CGFloat v116 = CGRectGetMidY(v230);
        v231.origin.CGFloat x = v30;
        v231.origin.CGFloat y = v29;
        v231.size.CGFloat width = v209;
        v231.size.CGFloat height = v210;
        CGFloat v206 = CGRectGetWidth(v231);
        v232.origin.CGFloat x = v30;
        v232.origin.CGFloat y = v29;
        v232.size.CGFloat width = v209;
        v232.size.CGFloat height = v210;
        CGFloat v117 = CGRectGetHeight(v232);
        v118.f64[0] = v206;
        v118.f64[1] = v117;
        *(CGFloat *)uint64_t v113 = v115;
        *(CGFloat *)(v113 + 8) = v116;
        float v114 = v109 * -0.25;
        *(double *)(v113 + 16) = v114;
        *(float32x2_t *)(v113 + 24) = vcvt_f32_f64(v118);
        uint64_t v119 = v4[4];
        *(unsigned char *)(v119 + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 872) + 1) = v25;
        *(float32x2_t *)(v119 + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 872) + 8) = spid;
        uint64_t v120 = v4[4];
        *(_WORD *)(v120 + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 872) + 32) = *(unsigned __int8 *)(*(void *)(v6 + 32) + 892);
        *(unsigned char *)(v120 + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 872) + 34) = v200;
        v121 = (_OWORD *)(v4[3] + 160 * *(unsigned int *)(*(void *)(v6 + 32) + 872));
        long long v122 = *((_OWORD *)off_1E5DAAF90 + 7);
        v121[6] = *((_OWORD *)off_1E5DAAF90 + 6);
        v121[7] = v122;
        long long v123 = *((_OWORD *)off_1E5DAAF90 + 9);
        v121[8] = *((_OWORD *)off_1E5DAAF90 + 8);
        v121[9] = v123;
        long long v124 = *((_OWORD *)off_1E5DAAF90 + 3);
        v121[2] = *((_OWORD *)off_1E5DAAF90 + 2);
        v121[3] = v124;
        long long v125 = *((_OWORD *)off_1E5DAAF90 + 5);
        v121[4] = *((_OWORD *)off_1E5DAAF90 + 4);
        v121[5] = v125;
        long long v126 = *((_OWORD *)off_1E5DAAF90 + 1);
        _OWORD *v121 = *(_OWORD *)off_1E5DAAF90;
        v121[1] = v126;
        [v23 inactiveImageFilterIntensity];
        *(float *)&double v127 = v127;
        uint64_t v128 = v4[3];
        *(_DWORD *)(v128 + 160 * *(unsigned int *)(*(void *)(v6 + 32) + 872)) = LODWORD(v127);
        *(float *)(v128 + 160 * *(unsigned int *)(*(void *)(v6 + 32) + 872) + 52) = v108;
        *(unsigned char *)(v128 + 160 * *(unsigned int *)(*(void *)(v6 + 32) + 872) + 70) = v24;
        uint64_t v91 = *(void *)(v6 + 32);
      }
      uint64_t v129 = *(unsigned int *)(v91 + 880);
      if (v129 != -1)
      {
        uint64_t v130 = v4[2] + 32 * v129;
        v233.origin.CGFloat x = v199;
        v233.origin.CGFloat y = v194;
        v233.size.CGFloat width = v195;
        v233.size.CGFloat height = v204;
        CGFloat v132 = CGRectGetMidX(v233);
        v234.origin.CGFloat x = v199;
        v234.origin.CGFloat y = v194;
        v234.size.CGFloat width = v195;
        v234.size.CGFloat height = v204;
        CGFloat v133 = CGRectGetMidY(v234);
        v235.origin.CGFloat x = v199;
        v235.origin.CGFloat y = v194;
        v235.size.CGFloat width = v195;
        v235.size.CGFloat height = v204;
        CGFloat v212 = CGRectGetWidth(v235);
        v236.origin.CGFloat x = v199;
        v236.origin.CGFloat y = v194;
        v236.size.CGFloat width = v195;
        v236.size.CGFloat height = v204;
        CGFloat v134 = CGRectGetHeight(v236);
        v135.f64[0] = v212;
        v135.f64[1] = v134;
        *(CGFloat *)uint64_t v130 = v132;
        *(CGFloat *)(v130 + 8) = v133;
        float v131 = v109 * -0.9;
        *(double *)(v130 + 16) = v131;
        *(float32x2_t *)(v130 + 24) = vcvt_f32_f64(v135);
        v136 = (_OWORD *)(v4[3] + 160 * *(unsigned int *)(*(void *)(v6 + 32) + 880));
        long long v137 = *((_OWORD *)off_1E5DAAF90 + 1);
        _OWORD *v136 = *(_OWORD *)off_1E5DAAF90;
        v136[1] = v137;
        long long v138 = *((_OWORD *)off_1E5DAAF90 + 5);
        v136[4] = *((_OWORD *)off_1E5DAAF90 + 4);
        v136[5] = v138;
        long long v139 = *((_OWORD *)off_1E5DAAF90 + 3);
        v136[2] = *((_OWORD *)off_1E5DAAF90 + 2);
        v136[3] = v139;
        long long v140 = *((_OWORD *)off_1E5DAAF90 + 9);
        v136[8] = *((_OWORD *)off_1E5DAAF90 + 8);
        v136[9] = v140;
        long long v141 = *((_OWORD *)off_1E5DAAF90 + 7);
        v136[6] = *((_OWORD *)off_1E5DAAF90 + 6);
        v136[7] = v141;
        if (v193) {
          char v142 = 0;
        }
        else {
          char v142 = 10;
        }
        uint64_t v143 = v4[4];
        *(unsigned char *)(v143 + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 880) + 1) = v142;
        *(unsigned char *)(v143 + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 880)) = 1;
        *(_WORD *)(v143 + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 880) + 32) = *(unsigned __int8 *)(*(void *)(v6 + 32) + 912);
        uint64_t v91 = *(void *)(v6 + 32);
      }
      objc_msgSend((id)v91, "primaryDividerBounds", *(void *)&v188);
      v148 = *(_DWORD **)(v6 + 32);
      unsigned int v149 = v148[221];
      if (v149 != -1)
      {
        CGFloat v150 = v144;
        CGFloat v151 = v145;
        CGFloat v152 = v146;
        CGFloat v153 = v147;
        __asm { FMOV            V0.2S, #1.0 }
        *(void *)(v4[4] + 40 * v149 + 8) = _D0;
        *(unsigned char *)(v4[4] + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 884) + 1) = 5;
        v155 = (_OWORD *)(v4[3] + 160 * *(unsigned int *)(*(void *)(v6 + 32) + 884));
        long long v156 = *((_OWORD *)off_1E5DAAF90 + 7);
        v155[6] = *((_OWORD *)off_1E5DAAF90 + 6);
        v155[7] = v156;
        long long v157 = *((_OWORD *)off_1E5DAAF90 + 9);
        v155[8] = *((_OWORD *)off_1E5DAAF90 + 8);
        v155[9] = v157;
        long long v158 = *((_OWORD *)off_1E5DAAF90 + 3);
        v155[2] = *((_OWORD *)off_1E5DAAF90 + 2);
        v155[3] = v158;
        long long v159 = *((_OWORD *)off_1E5DAAF90 + 5);
        v155[4] = *((_OWORD *)off_1E5DAAF90 + 4);
        v155[5] = v159;
        long long v160 = *((_OWORD *)off_1E5DAAF90 + 1);
        _OWORD *v155 = *(_OWORD *)off_1E5DAAF90;
        v155[1] = v160;
        CGFloat v161 = v150;
        *(CGFloat *)&long long v160 = v151;
        BOOL IsNull = CGRectIsNull(*(CGRect *)(&v146 - 2));
        float v163 = 0.0;
        if (!IsNull)
        {
          uint64_t v164 = v4[2] + 32 * *(unsigned int *)(*(void *)(v6 + 32) + 884);
          v237.origin.CGFloat x = v150;
          v237.origin.CGFloat y = v151;
          v237.size.CGFloat width = v152;
          v237.size.CGFloat height = v153;
          CGFloat v166 = CGRectGetMidX(v237);
          v238.origin.CGFloat x = v150;
          v238.origin.CGFloat y = v151;
          v238.size.CGFloat width = v152;
          v238.size.CGFloat height = v153;
          CGFloat v167 = CGRectGetMidY(v238);
          v239.origin.CGFloat x = v150;
          v239.origin.CGFloat y = v151;
          v239.size.CGFloat width = v152;
          v239.size.CGFloat height = v153;
          CGFloat v213 = CGRectGetWidth(v239);
          v240.origin.CGFloat x = v150;
          v240.origin.CGFloat y = v151;
          v240.size.CGFloat width = v152;
          v240.size.CGFloat height = v153;
          CGFloat v168 = CGRectGetHeight(v240);
          v169.f64[0] = v213;
          v169.f64[1] = v168;
          *(CGFloat *)uint64_t v164 = v166;
          *(CGFloat *)(v164 + 8) = v167;
          float v165 = v109 * -0.3;
          *(double *)(v164 + 16) = v165;
          *(float32x2_t *)(v164 + 24) = vcvt_f32_f64(v169);
          [*(id *)(v6 + 32) primaryDividerAlpha];
          float v163 = v170;
        }
        *(float *)(v4[3] + 160 * *(unsigned int *)(*(void *)(v6 + 32) + 884)) = v163;
        v148 = *(_DWORD **)(v6 + 32);
      }
      [v148 secondaryDividerBounds];
      unsigned int v175 = *(_DWORD *)(*(void *)(v6 + 32) + 888);
      if (v175 != -1)
      {
        CGFloat v176 = v171;
        CGFloat v177 = v172;
        CGFloat v178 = v173;
        CGFloat v179 = v174;
        __asm { FMOV            V0.2S, #1.0 }
        *(void *)(v4[4] + 40 * v175 + 8) = _D0;
        *(unsigned char *)(v4[4] + 40 * *(unsigned int *)(*(void *)(v6 + 32) + 888) + 1) = 5;
        v181 = (_OWORD *)(v4[3] + 160 * *(unsigned int *)(*(void *)(v6 + 32) + 888));
        long long v182 = *((_OWORD *)off_1E5DAAF90 + 7);
        v181[6] = *((_OWORD *)off_1E5DAAF90 + 6);
        v181[7] = v182;
        long long v183 = *((_OWORD *)off_1E5DAAF90 + 9);
        v181[8] = *((_OWORD *)off_1E5DAAF90 + 8);
        v181[9] = v183;
        long long v184 = *((_OWORD *)off_1E5DAAF90 + 3);
        v181[2] = *((_OWORD *)off_1E5DAAF90 + 2);
        v181[3] = v184;
        long long v185 = *((_OWORD *)off_1E5DAAF90 + 5);
        v181[4] = *((_OWORD *)off_1E5DAAF90 + 4);
        v181[5] = v185;
        long long v186 = *((_OWORD *)off_1E5DAAF90 + 1);
        _OWORD *v181 = *(_OWORD *)off_1E5DAAF90;
        v181[1] = v186;
        CGFloat v187 = v176;
        *(CGFloat *)&long long v186 = v177;
        if (!CGRectIsNull(*(CGRect *)(&v173 - 2)))
        {
          objc_msgSend(*(id *)(v6 + 32), "secondaryDividerScale", 0.0);
          v241.origin.CGFloat x = v176;
          v241.origin.CGFloat y = v177;
          v241.size.CGFloat width = v178;
          v241.size.CGFloat height = v179;
          CGRectGetWidth(v241);
          v242.origin.CGFloat x = v176;
          v242.origin.CGFloat y = v177;
          v242.size.CGFloat width = v178;
          v242.size.CGFloat height = v179;
          CGRectGetHeight(v242);
          PXRectWithSizeAlignedToRectEdges();
        }
        *(_DWORD *)(v4[3] + 160 * *(unsigned int *)(*(void *)(v6 + 32) + 888)) = 0;
      }

      return;
    default:
      goto LABEL_43;
  }
}

- (void)_updateModelPresentedTextProperties
{
  id v3 = [(PXStoryClipLayout *)self model];
  if (([v3 isExporting] & 1) == 0 && (objc_msgSend(v3, "isAsync") & 1) == 0)
  {
    uint64_t v4 = [(PXStoryClipLayout *)self currentTextResourceInfo];
    uint64_t v5 = v4;
    if (self->_resourceKind == 3 && (![v4 type] || objc_msgSend(v5, "type") == 1))
    {
      [v5 boundingRectPadding];
      PXEdgeInsetsMakeAll();
    }
  }
}

void __56__PXStoryClipLayout__updateModelPresentedTextProperties__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) type];
  if (v3 == 1)
  {
    [v4 setPresentedSubtitleFrame:*(void *)(a1 + 40)];
  }
  else if (!v3)
  {
    [v4 setPresentedTitleFrame:*(void *)(a1 + 40)];
  }
  objc_msgSend(v4, "setTitleAlignment:", objc_msgSend(*(id *)(a1 + 32), "textAlignment"));
}

- (void)_invalidateModelPresentedTextProperties
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x2000000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x2000000) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateModelPresentedTextProperties]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1778, @"invalidating %lu after it already has been updated", 0x2000000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x2000000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateTextResourceSpriteFrame
{
  if (self->_resourceKind == 3)
  {
    id v4 = [(PXStoryClipLayout *)self currentTextResourceInfo];
    [(PXStoryClipLayout *)self setCurrentTextResourceInfo:v4];
    uint64_t v5 = [(PXStoryClipLayout *)self model];
    uint64_t v6 = [v5 timeline];
    [(PXGLayout *)self contentSize];
    [(PXStoryClipLayout *)self contentBounds];
    double x = v98.origin.x;
    double y = v98.origin.y;
    double width = v98.size.width;
    double height = v98.size.height;
    if (CGRectIsNull(v98)) {
      PXRectWithOriginAndSize();
    }
    v96[0] = 0;
    v96[1] = v96;
    v96[2] = 0x3032000000;
    v96[3] = __Block_byref_object_copy__2650;
    v96[4] = __Block_byref_object_dispose__2651;
    id v97 = 0;
    v93[0] = 0;
    v93[1] = v93;
    v93[2] = 0x4010000000;
    v93[3] = &unk_1AB5D584F;
    long long v94 = 0u;
    long long v95 = 0u;
    uint64_t v87 = 0;
    CGFloat v88 = &v87;
    uint64_t v89 = 0x3032000000;
    uint64_t v90 = __Block_byref_object_copy__2650;
    uint64_t v91 = __Block_byref_object_dispose__2651;
    id v92 = 0;
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x2020000000;
    char v86 = 0;
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x2020000000;
    char v84 = 0;
    [(PXStoryClipLayout *)self clipTimeRange];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke;
    v72[3] = &unk_1E5DAE788;
    unint64_t v76 = v93;
    id v11 = v6;
    id v73 = v11;
    float64x2_t v74 = self;
    float v77 = v96;
    uint64_t v78 = v85;
    SEL v81 = a2;
    uint64_t v79 = v83;
    id v12 = v4;
    id v75 = v12;
    uint64_t v80 = &v87;
    objc_msgSend(v11, "enumerateClipsInTimeRange:rect:usingBlock:", v82, v72, x, y, width, height);
    [(PXGLayout *)self referenceSize];
    double v14 = v13;
    double v16 = v15;
    [(PXStoryClipLayout *)self displayedTimelineOriginalSize];
    double v18 = v17;
    double v20 = v19;
    uint64_t v21 = [v5 thumbnailStyle];
    if (v14 >= v18) {
      double v22 = v16;
    }
    else {
      double v22 = v20;
    }
    if (v14 >= v18) {
      double v23 = v14;
    }
    else {
      double v23 = v18;
    }
    if ((unint64_t)(v21 - 5) < 0xFFFFFFFFFFFFFFFDLL)
    {
      double height = v22;
      double width = v23;
    }
    char v24 = (void *)v88[5];
    char v25 = [(PXStoryClipLayout *)self relativeTextResourceInfo];
    char v26 = [v24 isEqual:v25];

    [(PXStoryClipLayout *)self textResourceContentSize];
    if (v27 == width)
    {
      [(PXStoryClipLayout *)self textResourceContentSize];
      if (v28 == height)
      {
        char v29 = [(PXStoryClipLayout *)self textResourceContentVersion] == self->_contentVersion
            ? v26
            : 0;
        if (v29) {
          goto LABEL_35;
        }
      }
    }
    double v30 = [v5 titleCategory];
    unint64_t v31 = [(PXStoryClipLayout *)self _titleKind];
    long long v32 = [v5 extendedTraitCollection];
    long long v33 = [v32 snapshot];

    uint64_t v34 = [v5 layoutSpec];
    if ([v12 layoutScheme] == 1)
    {
      [v34 distanceBetweenChapterTitleBaselineAndBottomWithoutChrome];
    }
    else
    {
      if (v31 != 8 && v31 != 4)
      {
        double v36 = 0.0;
        if (v31 == 1)
        {
          [v34 scrubberVerticalPadding];
          double v38 = v37;
          [v34 scrubberCurrentAssetSize];
          double v36 = v38 + v39;
        }
        goto LABEL_26;
      }
      [v34 bottomTitleContentOffset];
    }
    double v36 = v35;
LABEL_26:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_2;
    aBlock[3] = &unk_1E5DAE7B0;
    id v60 = v12;
    double v66 = x;
    double v67 = y;
    double v68 = width;
    double v69 = height;
    id v40 = v30;
    id v61 = v40;
    double v63 = v96;
    unint64_t v70 = v31;
    double v64 = v93;
    double v65 = &v87;
    id v41 = v33;
    id v62 = v41;
    double v71 = v36;
    double v42 = (void (**)(void))_Block_copy(aBlock);
    [(PXStoryClipLayout *)self textResourceSpriteFrame];
    IsEmptdouble y = CGRectIsEmpty(v99);
    if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1 && IsEmpty)
    {
      long long v45 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
      double v46 = [v5 storyQueue];
      double v51 = v34;
      id v52 = v12;
      id v47 = v11;
      if (_updateTextResourceSpriteFrame_onceToken != -1) {
        dispatch_once(&_updateTextResourceSpriteFrame_onceToken, &__block_literal_global_2654);
      }
      objc_initWeak(&location, self);
      double v48 = _updateTextResourceSpriteFrame_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_4;
      block[3] = &unk_1E5DD2078;
      id v49 = v45;
      id v54 = v49;
      id v55 = v46;
      uint64_t v56 = v42;
      id v50 = v46;
      objc_copyWeak(&v57, &location);
      dispatch_async(v48, block);
      objc_destroyWeak(&v57);

      objc_destroyWeak(&location);
      id v11 = v47;
      id v12 = v52;
    }
    else
    {
      v42[2](v42);
      -[PXStoryClipLayout setTextResourceSpriteFrame:](self, "setTextResourceSpriteFrame:");
      id v49 = 0;
    }
    -[PXStoryClipLayout setTextFrameProgress:](self, "setTextFrameProgress:", v49, v51, v52);
    -[PXStoryClipLayout setTextResourceContentSize:](self, "setTextResourceContentSize:", width, height);
    [(PXStoryClipLayout *)self setTextResourceContentVersion:self->_contentVersion];
    [(PXStoryClipLayout *)self setRelativeTextResourceInfo:v88[5]];

LABEL_35:
    _Block_object_dispose(v83, 8);
    _Block_object_dispose(v85, 8);
    _Block_object_dispose(&v87, 8);

    _Block_object_dispose(v93, 8);
    _Block_object_dispose(v96, 8);
  }
}

void __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unsigned char *a6)
{
  if (a2 >= 1)
  {
    uint64_t v8 = a2;
    do
    {
      uint64_t v10 = a5[1];
      if (v10 == 3)
      {
        id v11 = [*(id *)(a1 + 32) clipWithIdentifier:*a5];
        id v12 = [v11 resource];
        double v13 = objc_msgSend(v12, "px_storyResourceTextResourceInfo");

        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v13 type] == 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v13 type] == 1;
        if ([*(id *)(a1 + 48) type] == 1 && !objc_msgSend(v13, "type")) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v13);
        }
      }
      else if (v10 == 1)
      {
        PXRectWithOriginAndSize();
      }
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      if (v14)
      {
        LOBYTE(v14) = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        if ((_BYTE)v14) {
          LOBYTE(v14) = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) != 0;
        }
      }
      *a6 = v14;
      a5 += 96;
      --v8;
    }
    while (v8);
  }
  *a6 = 1;
}

uint64_t __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_2(uint64_t a1)
{
  double v2 = +[PXStorySettings sharedInstance];
  int v3 = [v2 simulateSlowTextLayout];

  if (v3) {
    [MEMORY[0x1E4F29060] sleepForTimeInterval:1.0];
  }
  id v4 = *(double **)(*(void *)(a1 + 64) + 8);
  return objc_msgSend(*(id *)(a1 + 32), "attributedStringFrameInRect:titleCategory:displayAsset:currentAssetCropRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:", *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(void *)(a1 + 112), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(void *)(a1 + 48), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), v4[4], v4[5], v4[6], v4[7], *(void *)(a1 + 120));
}

void __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    double v2 = (*(double (**)(void))(*(void *)(a1 + 48) + 16))();
    id v4 = v3;
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_5;
    v10[3] = &unk_1E5DAE7D8;
    uint64_t v9 = *(NSObject **)(a1 + 40);
    id v11 = *(id *)(a1 + 32);
    objc_copyWeak(v12, (id *)(a1 + 56));
    v12[1] = *(id *)&v2;
    v12[2] = v4;
    v12[3] = v6;
    v12[4] = v8;
    dispatch_async(v9, v10);
    objc_destroyWeak(v12);
  }
}

void __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_5(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    double v2 = *(double *)(a1 + 48);
    double v3 = *(double *)(a1 + 56);
    double v4 = *(double *)(a1 + 64);
    double v5 = *(double *)(a1 + 72);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setTextResourceSpriteFrame:", v2, v3, v4, v5);
  }
}

void __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_3()
{
  double v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("PXStoryClipLayout.TextSpriteFrame", v0);
  double v2 = (void *)_updateTextResourceSpriteFrame_workQueue;
  _updateTextResourceSpriteFrame_workQueue = (uint64_t)v1;
}

- (void)_invalidateTextResourceSpriteFrame
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x1000000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x1000000) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateTextResourceSpriteFrame]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1653, @"invalidating %lu after it already has been updated", 0x1000000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x1000000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)setUseContentBoundsForContentEdgeInsets:(BOOL)a3
{
  if (self->_useContentBoundsForContentEdgeInsets != a3)
  {
    self->_useContentBoundsForContentEdgeInsets = a3;
    [(PXStoryClipLayout *)self _invalidateEdgeMaskEffects];
  }
}

- (void)setContentBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentBounds = &self->_contentBounds;
  if (!CGRectEqualToRect(self->_contentBounds, a3))
  {
    p_contentBounds->origin.CGFloat x = x;
    p_contentBounds->origin.CGFloat y = y;
    p_contentBounds->size.CGFloat width = width;
    p_contentBounds->size.CGFloat height = height;
    [(PXStoryClipLayout *)self _invalidateTextResourceSpriteFrame];
    [(PXStoryClipLayout *)self _invalidateContent];
  }
}

- (void)_invalidateContent
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1632, @"invalidating %lu after it already has been updated", 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 16;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_invalidateContentVersion
{
  ++self->_contentVersion;
  [(PXStoryClipLayout *)self _invalidateTextResourceSpriteFrame];
  [(PXStoryClipLayout *)self _invalidateContent];
}

- (void)_updateCombinedEffect
{
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__PXStoryClipLayout__updateCombinedEffect__block_invoke;
  aBlock[3] = &unk_1E5DAE760;
  id v4 = v3;
  id v17 = v4;
  double v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v6 = [(PXStoryClipLayout *)self colorNormalizationEffect];
  v5[2](v5, v6);

  uint64_t v7 = [(PXStoryClipLayout *)self colorGradingEffect];
  v5[2](v5, v7);

  uint64_t v8 = [(PXStoryClipLayout *)self textLegibilityEffect];
  v5[2](v5, v8);

  uint64_t v9 = [(PXStoryClipLayout *)self topEdgeMaskEffect];
  v5[2](v5, v9);

  uint64_t v10 = [(PXStoryClipLayout *)self leftEdgeMaskEffect];
  v5[2](v5, v10);

  id v11 = [(PXStoryClipLayout *)self bottomEdgeMaskEffect];
  v5[2](v5, v11);

  id v12 = [(PXStoryClipLayout *)self rightEdgeMaskEffect];
  v5[2](v5, v12);

  double v13 = [(PXStoryClipLayout *)self leftEdgeClippingMaskEffect];
  v5[2](v5, v13);

  uint64_t v14 = [(PXStoryClipLayout *)self rightEdgeClippingMaskEffect];
  v5[2](v5, v14);

  if ([v4 count]) {
    double v15 = (void *)[objc_alloc((Class)off_1E5DA6718) initWithEffects:v4];
  }
  else {
    double v15 = 0;
  }
  [(PXStoryClipLayout *)self setCombinedEffect:v15];
}

uint64_t __42__PXStoryClipLayout__updateCombinedEffect__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (void)_invalidateCombinedEffect
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x200;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x200) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateCombinedEffect]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1596, @"invalidating %lu after it already has been updated", 512);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 512;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (id)_maskEffectForEdge:(unsigned int)a3 tiltedInset:(id)a4 bounds:(CGRect)a5 reusableInstance:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  uint64_t v13 = *(void *)&a3;
  id v15 = a6;
  double v16 = [(PXStoryClipLayout *)self _effectWithClass:objc_opt_class() reusableInstance:v15];

  if (var0 == 0.0 && var1 == 0.0 && var2 == 0.0) {
    id v17 = 0;
  }
  else {
    id v17 = objc_msgSend(objc_alloc((Class)off_1E5DA7500), "initWithEdge:tiltedInset:rect:", v13, var0, var1, var2, x, y, width, height);
  }
  [v16 setRegion:v17];

  return v16;
}

- (void)_updateEdgeMaskEffects
{
  if (!self->_isFeedThumbnail)
  {
    double v3 = [(PXStoryClipLayout *)self clippingAnimation];
    [(PXStoryClipLayout *)self contentEdgeInsets];
    uint64_t v4 = 0;
    if (INFINITY == 0.0)
    {
      if (v3)
      {
        [v3 currentEdgeInsets];
        uint64_t v4 = v5;
      }
      else
      {
        uint64_t v4 = 0;
      }
    }
    [(PXStoryClipLayout *)self manualContentsRectAmount];
    PXFloatByLinearlyInterpolatingFloats();
  }
}

- (void)_invalidateEdgeMaskEffects
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x100;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x100) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateEdgeMaskEffects]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1555, @"invalidating %lu after it already has been updated", 256);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 256;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateShouldAutoplay
{
  double v3 = [(PXStoryClipLayout *)self model];
  -[PXStoryClipLayout setShouldAutoplay:](self, "setShouldAutoplay:", [v3 shouldAutoplayThumbnail]);
  if (v3)
  {
    [v3 thumbnailAutoplayTimeRange];
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    long long v5 = 0u;
  }
  v4[0] = v5;
  v4[1] = v6;
  v4[2] = v7;
  [(PXStoryClipLayout *)self setAutoplayTimeRange:v4];
}

- (void)_invalidateShouldAutoplay
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x40000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40000) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateShouldAutoplay]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1545, @"invalidating %lu after it already has been updated", 0x40000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x40000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateDisplayAsset
{
  if ((self->_resourceKind | 4) == 5)
  {
    double v3 = [(PXStoryClipLayout *)self resource];
    objc_msgSend(v3, "px_storyResourceDisplayAsset");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  [(PXStoryClipLayout *)self setDisplayAsset:v4];
}

- (void)_invalidateDisplayAsset
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20000) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateDisplayAsset]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1531, @"invalidating %lu after it already has been updated", 0x20000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x20000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateColorGradingEffect
{
  int64_t v3 = [(PXStoryClipLayout *)self _effectiveColorGradeKind];
  id v4 = [(PXStoryClipLayout *)self model];
  long long v5 = [v4 colorGradingRepository];
  id v12 = [v5 colorLookupCubeForColorGradeKind:v3];

  uint64_t v6 = objc_opt_class();
  long long v7 = [(PXStoryClipLayout *)self colorGradingEffect];
  uint64_t v8 = [(PXStoryClipLayout *)self _effectWithClass:v6 reusableInstance:v7];

  id v9 = [v8 colorLookupCube];
  if (v12 == v9) {
    char v10 = 1;
  }
  else {
    char v10 = [v12 isEqual:v9];
  }

  [v8 setColorLookupCube:v12];
  id v11 = [(PXStoryClipLayout *)self colorGradingEffect];

  if (v8 == v11)
  {
    if ((v10 & 1) == 0) {
      [(PXStoryClipLayout *)self _invalidateCombinedEffect];
    }
  }
  else
  {
    [(PXStoryClipLayout *)self setColorGradingEffect:v8];
  }
}

- (int64_t)_effectiveColorGradeKind
{
  if ([(PXStoryClipLayout *)self customColorGradeKind]) {
    int64_t v3 = [(PXStoryClipLayout *)self customColorGradeKind];
  }
  else {
    int64_t v3 = [(PXStoryClipLayout *)self colorGradeKind];
  }
  int64_t v4 = v3;
  long long v5 = +[PXStorySettings sharedInstance];
  int v6 = [v5 disableColorGrading];

  if (v6) {
    return 1;
  }
  else {
    return v4;
  }
}

- (void)_invalidateColorGradingEffect
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      int v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateColorGradingEffect]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1503, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateSmartGradientAdjustment
{
  int64_t v3 = [(PXStoryClipLayout *)self model];
  unint64_t v4 = [v3 viewMode];

  [(PXGLayout *)self contentSize];
  if (v4 <= 5 && ((1 << v4) & 0x32) != 0 && self->_resourceKind == 5) {
    PXSizeIsEmpty();
  }
  [(PXStoryClipLayout *)self setSmartGradientAdjustment:0];
}

- (void)_invalidateSmartGradientAdjustment
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x80000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x80000) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      int v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateSmartGradientAdjustment]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1461, @"invalidating %lu after it already has been updated", 0x80000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x80000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateInactiveImageFilterAdjustment
{
  int64_t v3 = [(PXStoryClipLayout *)self model];
  if ([v3 shouldUseInactiveImageFilter] && self->_resourceKind == 1)
  {
    unint64_t v4 = [(PXStoryClipLayout *)self model];
    if ([v4 viewMode] == 1)
    {
      [(PXGLayout *)self contentSize];
      PXSizeIsEmpty();
    }
  }
  [(PXStoryClipLayout *)self setInactiveImageFilterAdjustment:0];
  if (self->_inactiveContentSpriteIndex != -1)
  {
    long long v5 = [(PXStoryClipLayout *)self model];
    [v5 inactiveImageFilterIntensity];
    uint64_t v7 = v6;

    uint64_t v8 = self->_inactiveContentSpriteIndex | 0x200000000;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PXStoryClipLayout__updateInactiveImageFilterAdjustment__block_invoke;
    v9[3] = &unk_1E5DAE738;
    v9[4] = self;
    char v10 = 0;
    v9[5] = v7;
    [(PXGLayout *)self modifySpritesInRange:v8 state:v9];
  }
}

void __57__PXStoryClipLayout__updateInactiveImageFilterAdjustment__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) alpha];
    double v7 = v6;
    [*(id *)(a1 + 32) contentAlpha];
    float v9 = *(double *)(a1 + 40) * (v7 * v8);
  }
  else
  {
    float v9 = 0.0;
  }
  *(float *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 872)) = v9;
  PXFloatApproximatelyEqualToFloat();
}

- (void)_invalidateInactiveImageFilterAdjustment
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x4000000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x4000000) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateInactiveImageFilterAdjustment]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1428, @"invalidating %lu after it already has been updated", 0x4000000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x4000000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateTextLegibilityEffect
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(PXStoryClipLayout *)self textLegibilityEffect];
  long long v5 = [(PXStoryClipLayout *)self _effectWithClass:v3 reusableInstance:v4];

  double v6 = [(PXStoryClipLayout *)self clip];
  double v7 = v6;
  if (v6)
  {
    [v6 info];
    int v8 = (v11[32] >> 3) & 1;
  }
  else
  {
    bzero(v11, 0x300uLL);
    int v8 = 0;
  }

  BOOL v9 = [(PXStoryClipLayout *)self canShowTextLegibilityEffect];
  double v10 = 0.0;
  if ((v9 & v8) != 0) {
    double v10 = 1.0;
  }
  [v5 setAlpha:v10];
  [(PXStoryClipLayout *)self setTextLegibilityEffect:v5];
}

- (void)_invalidateTextLegibilityEffect
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x10000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10000) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateTextLegibilityEffect]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1417, @"invalidating %lu after it already has been updated", 0x10000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x10000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateColorNormalizationEffect
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = +[PXStorySettings sharedInstance];
  if ((self->_resourceKind | 4) == 5
    && [(PXStoryClipLayout *)self canShowColorNormalizedContent])
  {
    unint64_t v5 = [v4 colorNormalizationMode];
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ([(PXStoryClipLayout *)self _effectiveColorGradeKind] == 1
    && ![v4 enableColorNormalizationWithoutColorGrade])
  {
    unint64_t v5 = 0;
  }
  if (![v4 colorNormalizationTechnique])
  {
    if (v5)
    {
      if (v5 != 2)
      {
        if (v5 != 4)
        {
          [v4 setColorNormalizationMode:2];
          [v4 save];
          long long v45 = [MEMORY[0x1E4F28B00] currentHandler];
          if (v5 > 4) {
            double v46 = @"??";
          }
          else {
            double v46 = off_1E5DB42E8[v5];
          }
          id v47 = v46;
          [v45 handleFailureInMethod:a2, self, @"PXStoryClipLayout.m", 1358, @"%@ is not supported with PXStoryNormalizationTechniqueFragmentShaderLUT, resetting.", v47 object file lineNumber description];

          abort();
        }
        double v7 = +[PXStoryColorNormalizationAdjustment dummyNormalization];
        goto LABEL_27;
      }
      double v10 = [(PXStoryClipLayout *)self clip];
      double v7 = [v10 colorNormalization];

      if (v7)
      {
LABEL_27:
        uint64_t v24 = objc_opt_class();
        char v25 = [(PXStoryClipLayout *)self colorNormalizationEffect];
        char v26 = [(PXStoryClipLayout *)self _effectWithClass:v24 reusableInstance:v25];

        double v27 = [v26 assetNormalization];
        if (v7 == v27) {
          int v28 = 0;
        }
        else {
          int v28 = [v7 isEqual:v27] ^ 1;
        }

        [v26 setAssetNormalization:v7];
        [v4 colorNormalizationIntensity];
        objc_msgSend(v26, "setIntensity:");

        double v6 = 0;
        goto LABEL_42;
      }
      id v11 = [(PXStoryClipLayout *)self displayAsset];
      id v12 = [v11 uuid];
      double v19 = PXStoryErrorCreateWithCodeDebugFormat(23, @"Missing color normalization data for asset %@", v13, v14, v15, v16, v17, v18, (uint64_t)v12);

      double v20 = PLStoryGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = PXStoryErrorDetailsDescription(v19);
        *(_DWORD *)buf = 138543362;
        id v49 = v21;
        _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "PXStoryClipLayout error: %{public}@", buf, 0xCu);
      }
      if ([v4 reportColorNormalizationErrors])
      {
        double v22 = [(PXStoryClipLayout *)self model];
        double v23 = [v22 errorReporter];
        [v23 setError:v19 forComponent:@"ColorNormalization"];
      }
    }
    double v7 = 0;
    goto LABEL_27;
  }
  if (!v5)
  {
    double v6 = 0;
    goto LABEL_39;
  }
  if (v5 != 4)
  {
    int v8 = [(PXStoryClipLayout *)self clip];
    BOOL v9 = [v8 colorNormalization];

    if (v9)
    {
      if (v5 != 3)
      {
        double v6 = [[PXStoryColorNormalizationAdjustment alloc] initWithNormalization:v9];
LABEL_38:

        goto LABEL_39;
      }
    }
    else
    {
      char v29 = [(PXStoryClipLayout *)self displayAsset];
      double v30 = [v29 uuid];
      double v37 = PXStoryErrorCreateWithCodeDebugFormat(23, @"Missing color normalization data for asset %@", v31, v32, v33, v34, v35, v36, (uint64_t)v30);

      double v38 = PLStoryGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        double v39 = PXStoryErrorDetailsDescription(v37);
        *(_DWORD *)buf = 138543362;
        id v49 = v39;
        _os_log_impl(&dword_1A9AE7000, v38, OS_LOG_TYPE_ERROR, "PXStoryClipLayout error: %{public}@", buf, 0xCu);
      }
      if ([v4 reportColorNormalizationErrors])
      {
        id v40 = [(PXStoryClipLayout *)self model];
        id v41 = [v40 errorReporter];
        [v41 setError:v37 forComponent:@"ColorNormalization"];
      }
      if (v5 == 2)
      {
        double v6 = 0;
        goto LABEL_38;
      }
    }
    double v42 = [(PXStoryClipLayout *)self displayAsset];
    double v6 = +[PXStoryColorNormalizationAdjustment autoAdjustmentForAsset:v42];

    goto LABEL_38;
  }
  double v6 = +[PXStoryColorNormalizationAdjustment dummyAdjustment];
LABEL_39:
  if ([v4 colorNormalizationUseColorCube]) {
    [(PXStoryColorNormalizationAdjustment *)v6 setUseColorCube:1];
  }
  [v4 colorNormalizationIntensity];
  [(PXStoryColorNormalizationAdjustment *)v6 setIntensity:v43];
  int v28 = 0;
  char v26 = 0;
LABEL_42:
  double v44 = [(PXStoryClipLayout *)self colorNormalizationEffect];

  if (v26 == v44)
  {
    if (v28) {
      [(PXStoryClipLayout *)self _invalidateCombinedEffect];
    }
  }
  else
  {
    [(PXStoryClipLayout *)self setColorNormalizationEffect:v26];
  }
  [(PXStoryClipLayout *)self setColorNormalizationAdjustment:v6];
}

- (void)_invalidateColorNormalizationEffect
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x8000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x8000) != 0)
    {
      unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateColorNormalizationEffect]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1312, @"invalidating %lu after it already has been updated", 0x8000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x8000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateColorGradeKind
{
  int64_t resourceKind = self->_resourceKind;
  if ((unint64_t)(resourceKind - 2) < 3)
  {
    uint64_t v4 = 1;
    goto LABEL_14;
  }
  if (resourceKind != 5 && resourceKind != 1)
  {
    uint64_t v4 = 0;
    goto LABEL_14;
  }
  double v6 = [(PXStoryClipLayout *)self overrideStyleInfo];
  double v7 = v6;
  if (!v6)
  {
    int v8 = [(PXStoryClipLayout *)self model];
    uint64_t v4 = [v8 colorGradeKind];
    goto LABEL_12;
  }
  uint64_t v4 = [v6 customColorGradeKind];
  if (!v4)
  {
    int v8 = [v7 originalColorGradeCategory];
    BOOL v9 = [(PXStoryClipLayout *)self model];
    double v10 = [v9 colorGradingRepository];
    uint64_t v4 = [v10 colorGradeKindForColorGradeCategory:v8];

LABEL_12:
  }

LABEL_14:
  [(PXStoryClipLayout *)self setColorGradeKind:v4];
}

- (void)_invalidateColorGradeKind
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateColorGradeKind]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1279, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateMusicDucking
{
  uint64_t v3 = [(PXStoryClipLayout *)self model];
  int v4 = [v3 isExporting];
  int v5 = [v3 isAsync];
  double v6 = [(PXStoryClipLayout *)self clip];
  if (v6)
  {
    double v7 = v6;
    [v6 info];

    if (((v4 | v5) & 1) == 0 && v19 == 3)
    {
      BOOL v8 = [(PXStoryClipLayout *)self isPlayheadInAudioTimeRange];
      uint64_t v12 = 0;
      uint64_t v13 = &v12;
      uint64_t v14 = 0x3032000000;
      uint64_t v15 = __Block_byref_object_copy__2650;
      uint64_t v16 = __Block_byref_object_dispose__2651;
      id v17 = [(PXStoryClipLayout *)self musicDuckingToken];
      uint64_t v9 = v13[5];
      if (v8)
      {
        if (!v9)
        {
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __40__PXStoryClipLayout__updateMusicDucking__block_invoke;
          v11[3] = &unk_1E5DCEE38;
          v11[4] = self;
          [v3 performChanges:v11];
        }
      }
      else if (v9)
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __40__PXStoryClipLayout__updateMusicDucking__block_invoke_2;
        v10[3] = &unk_1E5DBA900;
        void v10[4] = self;
        void v10[5] = &v12;
        [v3 performChanges:v10];
      }
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    bzero(v18, 0x300uLL);
  }
}

void __40__PXStoryClipLayout__updateMusicDucking__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 beginMusicDucking];
  [*(id *)(a1 + 32) setMusicDuckingToken:v3];
}

uint64_t __40__PXStoryClipLayout__updateMusicDucking__block_invoke_2(uint64_t a1, void *a2)
{
  [a2 endMusicDuckingWithToken:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  id v3 = *(void **)(a1 + 32);
  return [v3 setMusicDuckingToken:0];
}

- (void)_invalidateMusicDucking
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x400000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x400000) != 0)
    {
      int v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateMusicDucking]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1252, @"invalidating %lu after it already has been updated", 0x400000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x400000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateVideoPresentationControllerState
{
  int v4 = [(PXStoryClipLayout *)self model];
  if (v4)
  {
    int v5 = [(PXStoryClipLayout *)self videoPresentationController];

    if (v5)
    {
      long long v29 = 0uLL;
      uint64_t v30 = 0;
      double v6 = [(PXStoryClipLayout *)self videoPresentationController];
      double v7 = v6;
      if (v6)
      {
        [v6 actualTime];
      }
      else
      {
        long long v29 = 0uLL;
        uint64_t v30 = 0;
      }

      if ([v4 isExporting])
      {
        BOOL v8 = [(PXStoryClipLayout *)self videoPresentationController];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __60__PXStoryClipLayout__updateVideoPresentationControllerState__block_invoke;
        v24[3] = &unk_1E5DAE6E8;
        v24[4] = self;
        id v25 = v4;
        SEL v26 = a2;
        long long v27 = v29;
        uint64_t v28 = v30;
        [v8 performChanges:v24];
      }
      else
      {
        BOOL v9 = ([v4 isActuallyPlaying] & 1) != 0
          || [(PXStoryClipLayout *)self shouldAutoplay];
        BOOL v10 = [(PXStoryClipLayout *)self isSegmentVisible];
        BOOL v11 = [(PXStoryClipLayout *)self isPlayheadInAudioTimeRange];
        uint64_t v12 = [v4 log];
        uint64_t v13 = [v4 logContext];
        uint64_t v14 = [(PXStoryClipLayout *)self videoPresentationController];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __60__PXStoryClipLayout__updateVideoPresentationControllerState__block_invoke_274;
        v16[3] = &unk_1E5DAE710;
        BOOL v21 = v10;
        BOOL v22 = v11;
        BOOL v23 = v9;
        v16[4] = self;
        id v17 = v12;
        uint64_t v18 = v13;
        long long v19 = v29;
        uint64_t v20 = v30;
        id v15 = v12;
        [v14 performChanges:v16];
      }
    }
  }
}

void __60__PXStoryClipLayout__updateVideoPresentationControllerState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) clip];
  memset(&v41, 0, sizeof(v41));
  int v5 = *(void **)(a1 + 32);
  if (v5) {
    [v5 clipTimeRange];
  }
  CMTimeRange time1 = v41;
  PXStoryClipSegmentPlaybackTimeRangeIncludingJLCuts(v4, (long long *)&time1.start.value, 0, &v35);
  CMTimeFlags flags = HIDWORD(v35);
  CMTimeEpoch epoch = v36;
  CMTimeValue v8 = v37;
  CMTimeScale v9 = v38;
  CMTimeFlags v10 = v39;
  CMTimeEpoch v11 = v40;
  [v3 setDesiredPlayState:0];
  if ([*(id *)(a1 + 32) isSegmentVisible])
  {
    memset(&lhs, 0, sizeof(lhs));
    uint64_t v12 = *(void **)(a1 + 40);
    if (v12)
    {
      [v12 nominalPlaybackTime];
    }
    else
    {
      long long v33 = 0uLL;
      CMTimeEpoch v34 = 0;
    }
    uint64_t v30 = v4;
    CMTime time = v41.start;
    *(_OWORD *)&time1.start.CMTimeValue value = v33;
    time1.start.CMTimeEpoch epoch = v34;
    CMTimeSubtract(&lhs, &time1.start, &time);
    CMTimeValue value = v35;
    CMTimeScale timescale = DWORD2(v35);
    if ((flags & 1) == 0 || (v10 & 1) == 0 || v11 || v8 < 0)
    {
      id v29 = v3;
      CMTimeScale v17 = v9;
      int v18 = flags & 1;
      memset(&time, 0, sizeof(time));
      long long v19 = [*(id *)(a1 + 32) videoPresentationController];
      uint64_t v20 = v19;
      if (v19) {
        [v19 videoDuration];
      }
      else {
        memset(&time, 0, sizeof(time));
      }

      CMTimeScale v9 = v17;
      if (time.flags)
      {
        CMTime rhs = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        CMTime time2 = time;
        CMTimeRangeMake(&time1, &rhs, &time2);
        CMTimeValue value = time1.start.value;
        CMTimeFlags flags = time1.start.flags;
        CMTimeScale timescale = time1.start.timescale;
        CMTimeEpoch epoch = time1.start.epoch;
        CMTimeValue v8 = time1.duration.value;
        CMTimeScale v9 = time1.duration.timescale;
        CMTimeFlags v10 = time1.duration.flags;
        CMTimeEpoch v11 = time1.duration.epoch;
        int v18 = time1.start.flags & 1;
      }
      id v3 = v29;
      if (!v18) {
        goto LABEL_36;
      }
    }
    else
    {
      CMTimeEpoch v11 = 0;
    }
    if ((v10 & 1) == 0
      || v11
      || v8 < 0
      || (CMTime time = lhs,
          rhs.CMTimeValue value = value,
          rhs.CMTimeScale timescale = timescale,
          rhs.CMTimeFlags flags = flags,
          rhs.CMTimeEpoch epoch = epoch,
          CMTimeAdd(&time1.start, &time, &rhs),
          CMTime lhs = time1.start,
          (~v10 & 5) == 0))
    {
LABEL_36:
      BOOL v21 = +[PXStoryExportManager frequentSignpostLog];
      os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v21, *(const void **)(a1 + 32));
      BOOL v23 = v21;
      uint64_t v24 = v23;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        time1.start = lhs;
        Float64 Seconds = CMTimeGetSeconds(&time1.start);
        uint64_t v26 = *(void *)(a1 + 40);
        LODWORD(time1.start.value) = 134218240;
        *(Float64 *)((char *)&time1.start.value + 4) = Seconds;
        LOWORD(time1.start.flags) = 2048;
        *(void *)((char *)&time1.start.flags + 2) = v26;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "StoryExportRequestSeekVideo", "Seeking video to %f with model %p", (uint8_t *)&time1, 0x16u);
      }

      if ((lhs.flags & 1) == 0) {
        PXAssertGetLog();
      }
      time1.start = lhs;
      [v3 synchronouslySeekToDesiredTime:&time1 updatePixelBufferSource:1];
      long long v27 = v24;
      uint64_t v28 = v27;
      int v4 = v30;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        LOWORD(time1.start.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v28, OS_SIGNPOST_INTERVAL_END, v22, "StoryExportRequestSeekVideo", "", (uint8_t *)&time1, 2u);
      }

      goto LABEL_45;
    }
    if (v30)
    {
      [v30 info];
      if (v32 == 5)
      {
        CMTime rhs = lhs;
        time1.start.CMTimeValue value = value;
        time1.start.CMTimeScale timescale = timescale;
        time1.start.CMTimeFlags flags = flags;
        time1.start.CMTimeEpoch epoch = epoch;
        time1.duration.CMTimeValue value = v8;
        time1.duration.CMTimeScale timescale = v9;
        time1.duration.CMTimeFlags flags = v10;
        time1.duration.CMTimeEpoch epoch = 0;
        CMTimeFoldIntoRange(&time, &rhs, &time1);
LABEL_35:
        CMTime lhs = time;
        goto LABEL_36;
      }
    }
    else
    {
      bzero(v31, 0x300uLL);
    }
    CMTime rhs = lhs;
    time1.start.CMTimeValue value = value;
    time1.start.CMTimeScale timescale = timescale;
    time1.start.CMTimeFlags flags = flags;
    time1.start.CMTimeEpoch epoch = epoch;
    time1.duration.CMTimeValue value = v8;
    time1.duration.CMTimeScale timescale = v9;
    time1.duration.CMTimeFlags flags = v10;
    time1.duration.CMTimeEpoch epoch = 0;
    CMTimeClampToRange(&time, &rhs, &time1);
    goto LABEL_35;
  }
  if (flags)
  {
    CMTimeValue value = v35;
    CMTimeScale timescale = DWORD2(v35);
  }
  else
  {
    CMTimeValue value = *MEMORY[0x1E4F1FA48];
    CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 12);
    CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 8);
    CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  }
  CMTimeValue v14 = *(void *)(a1 + 56);
  uint64_t v13 = a1 + 56;
  CMTimeValue v46 = v14;
  CMTimeFlags v15 = *(_DWORD *)(v13 + 12);
  CMTimeScale v47 = *(_DWORD *)(v13 + 8);
  CMTimeEpoch v16 = *(void *)(v13 + 16);
  if ((flags & 0x1F) != 3 && (v15 & 0x1F) != 3) {
    goto LABEL_48;
  }
  memset(&time1, 0, 24);
  lhs.CMTimeValue value = value;
  lhs.CMTimeScale timescale = timescale;
  lhs.CMTimeFlags flags = flags;
  lhs.CMTimeEpoch epoch = epoch;
  rhs.CMTimeValue value = *(void *)v13;
  rhs.CMTimeScale timescale = *(_DWORD *)(v13 + 8);
  rhs.CMTimeFlags flags = v15;
  rhs.CMTimeEpoch epoch = v16;
  CMTimeSubtract(&time, &lhs, &rhs);
  CMTimeAbsoluteValue(&time1.start, &time);
  CMTimeMake(&time2, 1, 1000000000);
  CMTime lhs = time1.start;
  if (CMTimeCompare(&lhs, &time2) > 0)
  {
LABEL_48:
    time1.start.CMTimeValue value = value;
    time1.start.CMTimeScale timescale = timescale;
    time1.start.CMTimeFlags flags = flags;
    time1.start.CMTimeEpoch epoch = epoch;
    lhs.CMTimeValue value = v46;
    lhs.CMTimeScale timescale = v47;
    lhs.CMTimeFlags flags = v15;
    lhs.CMTimeEpoch epoch = v16;
    if (CMTimeCompare(&time1.start, &lhs))
    {
      time1.start.CMTimeValue value = value;
      time1.start.CMTimeScale timescale = timescale;
      time1.start.CMTimeFlags flags = flags;
      time1.start.CMTimeEpoch epoch = epoch;
      [v3 synchronouslySeekToDesiredTime:&time1 updatePixelBufferSource:1];
    }
  }
LABEL_45:
}

void __60__PXStoryClipLayout__updateVideoPresentationControllerState__block_invoke_274(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 desiredPlayState];
  if (*(unsigned char *)(a1 + 80))
  {
    int v5 = [*(id *)(a1 + 32) wasPlayheadMovedManually];
    if (*(unsigned char *)(a1 + 80)) {
      goto LABEL_6;
    }
  }
  else
  {
    int v5 = 0;
  }
  if (!*(unsigned char *)(a1 + 81))
  {
    [v3 setDesiredPlayState:0];
    CMTimeFlags v11 = 1;
    goto LABEL_12;
  }
LABEL_6:
  if (*(unsigned char *)(a1 + 82))
  {
    if ([v3 desiredPlayState] != 1)
    {
      double v6 = +[PXStorySettings sharedInstance];
      int v7 = [v6 detectVideoLags];

      if (v7)
      {
        objc_initWeak(location, *(id *)(a1 + 32));
        dispatch_time_t v8 = dispatch_time(0, 300000000);
        CMTimeScale v9 = [*(id *)(a1 + 32) model];
        CMTimeFlags v10 = [v9 storyQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __60__PXStoryClipLayout__updateVideoPresentationControllerState__block_invoke_2;
        block[3] = &unk_1E5DD32D0;
        objc_copyWeak(&v37, location);
        dispatch_after(v8, v10, block);

        objc_destroyWeak(&v37);
        objc_destroyWeak(location);
      }
    }
  }
  [v3 setDesiredPlayState:*(unsigned __int8 *)(a1 + 82)];
  CMTimeFlags v11 = 0;
LABEL_12:
  if ([v3 desiredPlayState] != (v4 != 0))
  {
    uint64_t v12 = *(id *)(a1 + 40);
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, *(const void **)(a1 + 32));
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        CMTimeFlags v15 = *(void **)(a1 + 48);
        CMTimeEpoch v16 = (void *)[v3 desiredPlayState];
        LODWORD(location[0]) = 134218240;
        *(id *)((char *)location + 4) = v15;
        WORD2(location[1]) = 2050;
        *(id *)((char *)&location[1] + 6) = v16;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_EVENT, v14, "PXStoryClipLayoutChangedVideoDesiredPlayState", "Context=%{signpost.telemetry:string2}lu desiredPlayState=%{signpost.description:attribute, public}ld", (uint8_t *)location, 0x16u);
      }
    }
  }
  if ((v5 | v11) == 1)
  {
    CMTimeScale v17 = [*(id *)(a1 + 32) clip];
    long long v49 = 0u;
    memset(location, 0, sizeof(location));
    int v18 = *(void **)(a1 + 32);
    if (v18) {
      [v18 clipTimeRange];
    }
    *(_OWORD *)CMTimeRange time1 = *(_OWORD *)location;
    *(_OWORD *)&time1[16] = *(_OWORD *)&location[2];
    long long v47 = v49;
    PXStoryClipSegmentPlaybackTimeRangeIncludingJLCuts(v17, (long long *)time1, v11, &v32);
    CMTimeFlags flags = v32.flags;
    CMTimeEpoch epoch = v32.epoch;
    BOOL v21 = (CMTime *)MEMORY[0x1E4F1FA48];
    if ((v32.flags & 1) == 0 || (v34 & 1) == 0 || v35 || v33 < 0)
    {
      CMTimeValue value = *MEMORY[0x1E4F1FA48];
      CMTimeFlags v22 = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 12);
      CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 8);
      CMTimeEpoch v31 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    }
    else
    {
      CMTimeValue value = v32.value;
      CMTimeScale timescale = v32.timescale;
      CMTimeEpoch v31 = v32.epoch;
      CMTimeFlags v22 = v32.flags;
    }
    CMTimeValue v42 = *(void *)(a1 + 56);
    CMTimeFlags v23 = *(_DWORD *)(a1 + 68);
    CMTimeScale v43 = *(_DWORD *)(a1 + 64);
    CMTimeEpoch v24 = *(void *)(a1 + 72);
    if ((v32.flags & 0x1F) != 3 && (v23 & 0x1F) != 3) {
      goto LABEL_38;
    }
    memset(time1, 0, 24);
    rhs.CMTimeEpoch epoch = v24;
    CMTime lhs = v32;
    rhs.CMTimeValue value = *(void *)(a1 + 56);
    rhs.CMTimeScale timescale = *(_DWORD *)(a1 + 64);
    rhs.CMTimeFlags flags = v23;
    CMTimeSubtract(&time, &lhs, &rhs);
    CMTimeAbsoluteValue((CMTime *)time1, &time);
    CMTimeMake(&time2, 1, 1000000000);
    CMTime lhs = *(CMTime *)time1;
    if (CMTimeCompare(&lhs, &time2) > 0)
    {
LABEL_38:
      *(void *)CMTimeRange time1 = v32.value;
      *(_DWORD *)&time1[8] = v32.timescale;
      *(_DWORD *)&time1[12] = flags;
      *(void *)&time1[16] = epoch;
      lhs.CMTimeValue value = v42;
      lhs.CMTimeScale timescale = v43;
      lhs.CMTimeFlags flags = v23;
      lhs.CMTimeEpoch epoch = v24;
      if (CMTimeCompare((CMTime *)time1, &lhs))
      {
        id v25 = *(id *)(a1 + 40);
        os_signpost_id_t v26 = os_signpost_id_make_with_pointer(v25, *(const void **)(a1 + 32));
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v27 = v26;
          if (os_signpost_enabled(v25))
          {
            uint64_t v28 = *(void *)(a1 + 48);
            CFAllocatorRef v29 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            *(void *)CMTimeRange time1 = value;
            *(_DWORD *)&time1[8] = timescale;
            *(_DWORD *)&time1[12] = v22;
            *(void *)&time1[16] = v31;
            uint64_t v30 = (__CFString *)CMTimeCopyDescription(v29, (CMTime *)time1);
            *(_DWORD *)CMTimeRange time1 = 134218242;
            *(void *)&time1[4] = v28;
            *(_WORD *)&time1[12] = 2114;
            *(void *)&time1[14] = v30;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v25, OS_SIGNPOST_EVENT, v27, "PXStoryClipLayoutChangedVideoDesiredTime", "Context=%{signpost.telemetry:string2}lu desiredTime=%{signpost.description:attribute, public}@", time1, 0x16u);
          }
        }

        *(void *)CMTimeRange time1 = value;
        *(_DWORD *)&time1[8] = timescale;
        *(_DWORD *)&time1[12] = v22;
        *(void *)&time1[16] = v31;
        CMTime time = *v21;
        CMTime lhs = time;
        [v3 setDesiredTime:time1 toleranceBefore:&time toleranceAfter:&lhs];
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "currentAudioVolume", v31);
  objc_msgSend(v3, "setVolume:withFade:", 0);
}

void __60__PXStoryClipLayout__updateVideoPresentationControllerState__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _validateVideoPlaybackState];
}

- (void)_invalidateVideoPresentationControllerState
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      int v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateVideoPresentationControllerState]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1137, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateVideoPresentationController
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryClipLayout *)self videoPresentationController];
  uint64_t v4 = [(PXStoryClipLayout *)self resource];
  if (([(PXStoryClipLayout *)self assetPresentationStyles] & 2) != 0 && v4)
  {
    objc_msgSend(v4, "px_storyResourceDisplayAsset");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    double v6 = [(PXStoryClipLayout *)self model];
    double v68 = v6;
    if (v3)
    {
      id v7 = [(PXGDisplayAssetVideoPresentationController *)v3 displayAsset];
      dispatch_time_t v8 = v7;
      if (v7 == v5)
      {
      }
      else
      {
        char v9 = [v7 isEqual:v5];

        if ((v9 & 1) == 0)
        {

          goto LABEL_11;
        }
      }
      id v11 = [(PXGDisplayAssetVideoPresentationController *)v3 videoSessionManager];
      id v12 = [v6 videoSessionManager];
      if (v11 == v12)
      {
      }
      else
      {
        os_signpost_id_t v13 = v12;
        char v14 = [v11 isEqual:v12];

        if ((v14 & 1) == 0) {
          goto LABEL_11;
        }
      }
      CMTimeFlags v10 = v3;
LABEL_53:

      goto LABEL_54;
    }
LABEL_11:
    int v66 = [v6 isExporting];
    if (v66) {
      CMTimeFlags v15 = 0;
    }
    else {
      CMTimeFlags v15 = [v6 isAsync] ^ 1;
    }
    BOOL v16 = [(PXStoryClipLayout *)self isReadyForAutoplay];
    CMTimeScale v17 = +[PXStorySettings sharedInstance];
    int v18 = [(PXStoryClipLayout *)self clip];
    long long v19 = v18;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v88 = 0u;
    memset(v87, 0, sizeof(v87));
    double v64 = v4;
    if (v18) {
      [v18 info];
    }
    else {
      bzero(v87, 0x300uLL);
    }
    long long v85 = 0u;
    long long v86 = 0u;
    long long v84 = 0u;
    [(PXStoryClipLayout *)self clipTimeRange];
    unint64_t v20 = v111;
    char v21 = *((void *)&v88 + 1) == 5 || v16;
    double v65 = v19;
    double v67 = v5;
    if (v21)
    {
      char v58 = 1;
    }
    else
    {
      CMTimeFlags v22 = [(PXStoryClipLayout *)self segmentIdentifiers];
      CMTimeFlags v23 = [v6 timeline];
      char v58 = objc_msgSend(v22, "containsIndex:", objc_msgSend(v23, "firstSegmentIdentifier"));

      long long v19 = v65;
    }
    int v24 = [v17 wantsAudioFromVideo];
    unsigned int v25 = v15 & !v16;
    if (v20 < 2) {
      unsigned int v25 = 0;
    }
    if (v24) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = 0;
    }
    PXStoryClipVideoSegmentTimeRange(v19, &v81);
    *(_OWORD *)buf = v84;
    *(_OWORD *)&buf[16] = v85;
    long long v113 = v86;
    PXStoryClipSegmentPlaybackTimeRangeIncludingJLCuts(v19, (long long *)buf, v15, &v78);
    os_signpost_id_t v27 = objc_alloc_init(PXVideoSessionManagerDisplayAssetOptions);
    [(PXVideoSessionManagerDisplayAssetOptions *)v27 setIsAudioAllowed:v26];
    if ([(PXStoryClipLayout *)self shouldAutoplay])
    {
      long long v28 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      *(_OWORD *)buf = *MEMORY[0x1E4F1FA20];
      *(_OWORD *)&buf[16] = v28;
      long long v113 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
      [(PXVideoSessionManagerDisplayAssetOptions *)v27 addContentDeliveryStrategyWithDeliveryQuality:3 segmentTimeRange:buf streamingAllowed:1];
      uint64_t v29 = 0;
    }
    else
    {
      if ([v6 isInline]) {
        uint64_t v29 = 5;
      }
      else {
        uint64_t v29 = 4;
      }
      if (v66)
      {
        uint64_t v30 = [v17 exportVideoQuality];
        *(_OWORD *)buf = v81;
        *(_OWORD *)&buf[16] = v82;
        long long v113 = v83;
        [(PXVideoSessionManagerDisplayAssetOptions *)v27 addContentDeliveryStrategyWithDeliveryQuality:v30 segmentTimeRange:buf streamingAllowed:0];
        long long v59 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
        *(_OWORD *)buf = *MEMORY[0x1E4F1FA20];
        long long v55 = *(_OWORD *)buf;
        *(_OWORD *)&buf[16] = v59;
        long long v113 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
        long long v53 = v113;
        [(PXVideoSessionManagerDisplayAssetOptions *)v27 addContentDeliveryStrategyWithDeliveryQuality:v30 segmentTimeRange:buf streamingAllowed:1];
        *(_OWORD *)buf = v55;
        *(_OWORD *)&buf[16] = v59;
        long long v113 = v53;
        CMTimeEpoch v31 = v27;
        uint64_t v32 = v30;
      }
      else
      {
        if (*((void *)&v88 + 1) == 3)
        {
          uint64_t v33 = [v17 livePhotoLocalVideoQuality];
          *(_OWORD *)buf = v81;
          *(_OWORD *)&buf[16] = v82;
          long long v113 = v83;
          [(PXVideoSessionManagerDisplayAssetOptions *)v27 addContentDeliveryStrategyWithDeliveryQuality:v33 segmentTimeRange:buf streamingAllowed:0 networkAccessAllowed:0];
        }
        *(_OWORD *)buf = v81;
        *(_OWORD *)&buf[16] = v82;
        long long v113 = v83;
        [(PXVideoSessionManagerDisplayAssetOptions *)v27 addContentDeliveryStrategyWithDeliveryQuality:2 segmentTimeRange:buf streamingAllowed:0 networkAccessAllowed:0];
        uint64_t v34 = [v17 videoQuality];
        *(_OWORD *)buf = v81;
        *(_OWORD *)&buf[16] = v82;
        long long v113 = v83;
        [(PXVideoSessionManagerDisplayAssetOptions *)v27 addContentDeliveryStrategyWithDeliveryQuality:v34 segmentTimeRange:buf streamingAllowed:0];
        long long v60 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
        *(_OWORD *)buf = *MEMORY[0x1E4F1FA20];
        long long v56 = *(_OWORD *)buf;
        *(_OWORD *)&buf[16] = v60;
        long long v113 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
        long long v54 = v113;
        [(PXVideoSessionManagerDisplayAssetOptions *)v27 addContentDeliveryStrategyWithDeliveryQuality:3 segmentTimeRange:buf streamingAllowed:1];
        *(_OWORD *)buf = v56;
        *(_OWORD *)&buf[16] = v60;
        long long v113 = v54;
        CMTimeEpoch v31 = v27;
        uint64_t v32 = 3;
      }
      [(PXVideoSessionManagerDisplayAssetOptions *)v31 addContentDeliveryStrategyWithDeliveryQuality:v32 segmentTimeRange:buf streamingAllowed:0];
    }
    -[PXVideoSessionManagerDisplayAssetOptions setShouldStabilizeLivePhotosIfPossible:](v27, "setShouldStabilizeLivePhotosIfPossible:", [v17 videoInlineStabilization]);
    if (*((void *)&v88 + 1) == 3 && v16)
    {
      [(PXVideoSessionManagerDisplayAssetOptions *)v27 setShouldCrossfadeLivePhotosWhenLooping:1];
      [(PXStoryClipLayout *)self autoplayTimeRange];
      v77[0] = v77[3];
      v77[1] = v77[4];
      v77[2] = v77[5];
      [(PXVideoSessionManagerDisplayAssetOptions *)v27 setLivePhotoLoopTimeRange:v77];
      long long v36 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      long long v78 = *MEMORY[0x1E4F1FA20];
      long long v79 = v36;
      long long v80 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    }
    id v37 = [(PXStoryClipLayout *)self model];
    uint64_t v38 = [v37 audioSession];

    double v63 = v17;
    char v62 = v26;
    id v61 = (void *)v38;
    if (v38)
    {
      CMTimeFlags v39 = (void *)[objc_alloc(MEMORY[0x1E4F8EBC8]) initWithAudioSession:v38];
      [(PXVideoSessionManagerDisplayAssetOptions *)v27 setAudioSession:v39];
    }
    else
    {
      [(PXVideoSessionManagerDisplayAssetOptions *)v27 setAudioSession:0];
    }
    CMTimeEpoch v40 = [(PXStoryClipLayout *)self model];
    CMTimeRange v41 = [v40 configuration];

    [v41 videoPlaybackRate];
    uint64_t v43 = v42;
    double v44 = [PXGDisplayAssetVideoPresentationController alloc];
    long long v45 = [(PXGLayout *)self layoutQueue];
    CMTimeValue v46 = [v68 videoSessionManager];
    CMTimeFlags v10 = [(PXGDisplayAssetVideoPresentationController *)v44 initWithDisplayAsset:v67 accessQueue:v45 videoSessionManager:v46 options:v27 loadingPriority:v29];

    long long v47 = [v68 log];
    [(PXGDisplayAssetVideoPresentationController *)v10 setLog:v47];

    double v48 = [v68 log];
    os_signpost_id_t v49 = os_signpost_id_make_with_pointer(v48, self);
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v50 = v49;
      if (os_signpost_enabled(v48))
      {
        uint64_t v57 = [v68 logContext];
        uint64_t v51 = [(PXGDisplayAssetVideoPresentationController *)v10 logContext];
        id v52 = [v67 uuid];
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = v57;
        *(_WORD *)&buf[12] = 2050;
        *(void *)&buf[14] = v51;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v52;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v48, OS_SIGNPOST_EVENT, v50, "PXStoryClipLayoutCreatedVideoPresentationController", "Context=%{signpost.telemetry:string2}lu videoPresentationControllerContext=%{public}llu, asset.uuid=%{public}@", buf, 0x20u);
      }
    }

    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __55__PXStoryClipLayout__updateVideoPresentationController__block_invoke;
    v69[3] = &unk_1E5DAE6C0;
    v69[4] = self;
    char v74 = v66;
    v69[5] = v43;
    char v75 = v62;
    int v70 = 0;
    char v76 = v58;
    long long v71 = v78;
    long long v72 = v79;
    long long v73 = v80;
    [(PXGDisplayAssetVideoPresentationController *)v10 performChanges:v69];

    uint64_t v4 = v64;
    id v5 = v67;
    goto LABEL_53;
  }

  CMTimeFlags v10 = 0;
LABEL_54:
  [(PXStoryClipLayout *)self setVideoPresentationController:v10];
}

void __55__PXStoryClipLayout__updateVideoPresentationController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setShouldDisplayPreviousNonNullPixelBuffer:1];
  [v3 setIsCrossfadingFromStillToVideoEnabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 913)];
  [v3 setIsCleanApertureCompensationEnabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 913)];
  [v3 setShouldDisableAutomaticPixelBufferUpdates:*(unsigned __int8 *)(a1 + 100)];
  uint64_t v4 = [*(id *)(a1 + 32) clip];
  if (v4) {
    [v4 info];
  }
  else {
    bzero(v5, 0x300uLL);
  }
  [*(id *)(a1 + 32) displayScale];
  PXSizeScale();
}

- (void)_invalidateVideoPresentationController
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x4000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x4000) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateVideoPresentationController]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 1032, @"invalidating %lu after it already has been updated", 0x4000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x4000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateAssetPresentationStyles
{
  id v3 = [(PXStoryClipLayout *)self resource];
  uint64_t v4 = objc_msgSend(v3, "px_storyResourceKind");

  if (v4 == 5) {
    goto LABEL_9;
  }
  if (v4 != 1)
  {
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  id v5 = [(PXStoryClipLayout *)self clip];
  if (!v5)
  {
    bzero(&v13, 0x300uLL);
    goto LABEL_9;
  }
  double v6 = v5;
  [v5 info];

  if (v14 - 3 >= 3)
  {
    if (v14 > 2) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v7 = 1;
    goto LABEL_10;
  }
  dispatch_time_t v8 = [(PXStoryClipLayout *)self model];
  char v9 = [v8 configuration];
  char v10 = [v9 disableVideoPlayback];

  if (v10) {
    goto LABEL_9;
  }
  id v11 = [(PXStoryClipLayout *)self model];
  char v12 = [v11 isExporting];

  if (v12)
  {
    uint64_t v7 = 2;
  }
  else if ([(PXStoryClipLayout *)self canShowDynamicContent])
  {
    uint64_t v7 = 3;
  }
  else if ([(PXStoryClipLayout *)self isReadyForAutoplay])
  {
    uint64_t v7 = 3;
  }
  else
  {
    uint64_t v7 = 1;
  }
LABEL_10:
  [(PXStoryClipLayout *)self setAssetPresentationStyles:v7];
}

- (void)_invalidateAssetPresentationStyles
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x2000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x2000) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateAssetPresentationStyles]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 983, @"invalidating %lu after it already has been updated", 0x2000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 0x2000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateResource
{
  id v4 = [(PXStoryClipLayout *)self clip];
  id v3 = [v4 resource];
  [(PXStoryClipLayout *)self setResource:v3];
}

- (void)_invalidateResource
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipLayout _invalidateResource]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryClipLayout.m", 975, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryClipLayout;
  [(PXGLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryClipLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryClipLayout.m", 971, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      CMTimeEpoch v31 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v32 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v31 handleFailureInFunction:v32, @"PXStoryClipLayout.m", 883, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryClipLayout *)self _updateResource];
      if (!p_updateFlags->isPerformingUpdate)
      {
        long long v85 = [MEMORY[0x1E4F28B00] currentHandler];
        long long v86 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
        [v85 handleFailureInFunction:v86, @"PXStoryClipLayout.m", 887, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryClipLayout *)self _updateColorGradeKind];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v34 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v33 handleFailureInFunction:v34, @"PXStoryClipLayout.m", 890, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXStoryClipLayout *)self _updateColorGradingEffect];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v36 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v35 handleFailureInFunction:v36, @"PXStoryClipLayout.m", 893, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20000uLL;
    if ((v7 & 0x20000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFDFFFFLL;
      [(PXStoryClipLayout *)self _updateDisplayAsset];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      id v37 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v38 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v37 handleFailureInFunction:v38, @"PXStoryClipLayout.m", 896, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x40000uLL;
    if ((v8 & 0x40000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFBFFFFLL;
      [(PXStoryClipLayout *)self _updateShouldAutoplay];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      CMTimeFlags v39 = [MEMORY[0x1E4F28B00] currentHandler];
      CMTimeEpoch v40 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v39 handleFailureInFunction:v40, @"PXStoryClipLayout.m", 899, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x2000uLL;
    if ((v9 & 0x2000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFDFFFLL;
      [(PXStoryClipLayout *)self _updateAssetPresentationStyles];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      CMTimeRange v41 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v42 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v41 handleFailureInFunction:v42, @"PXStoryClipLayout.m", 902, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v10 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x4000uLL;
    if ((v10 & 0x4000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v10 & 0xFFFFFFFFFFFFBFFFLL;
      [(PXStoryClipLayout *)self _updateVideoPresentationController];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v43 = [MEMORY[0x1E4F28B00] currentHandler];
      double v44 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v43 handleFailureInFunction:v44, @"PXStoryClipLayout.m", 905, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v11 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v11 & 0x20) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v11 & 0xFFFFFFFFFFFFFFDFLL;
      [(PXStoryClipLayout *)self _updateSegmentIdentifiers];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      long long v45 = [MEMORY[0x1E4F28B00] currentHandler];
      CMTimeValue v46 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v45 handleFailureInFunction:v46, @"PXStoryClipLayout.m", 908, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v12 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x40uLL;
    if ((v12 & 0x40) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v12 & 0xFFFFFFFFFFFFFFBFLL;
      [(PXStoryClipLayout *)self _updateIsSegmentVisible];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      long long v47 = [MEMORY[0x1E4F28B00] currentHandler];
      double v48 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v47 handleFailureInFunction:v48, @"PXStoryClipLayout.m", 911, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v13 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x800000uLL;
    if ((v13 & 0x800000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v13 & 0xFFFFFFFFFF7FFFFFLL;
      [(PXStoryClipLayout *)self _updateOffsetFromCurrentSegment];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      os_signpost_id_t v49 = [MEMORY[0x1E4F28B00] currentHandler];
      os_signpost_id_t v50 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v49 handleFailureInFunction:v50, @"PXStoryClipLayout.m", 914, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v14 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x100000uLL;
    if ((v14 & 0x100000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v14 & 0xFFFFFFFFFFEFFFFFLL;
      [(PXStoryClipLayout *)self _updatePlayheadState];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v51 = [MEMORY[0x1E4F28B00] currentHandler];
      id v52 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v51 handleFailureInFunction:v52, @"PXStoryClipLayout.m", 917, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v15 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v15 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v15 & 0xFFFFFFFFFFFFFFF7;
      [(PXStoryClipLayout *)self _updateVideoPresentationControllerState];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      long long v53 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v54 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v53 handleFailureInFunction:v54, @"PXStoryClipLayout.m", 920, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v16 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x400000uLL;
    if ((v16 & 0x400000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v16 & 0xFFFFFFFFFFBFFFFFLL;
      [(PXStoryClipLayout *)self _updateMusicDucking];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      long long v55 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v56 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v55 handleFailureInFunction:v56, @"PXStoryClipLayout.m", 923, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v17 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x200000uLL;
    if ((v17 & 0x200000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v17 & 0xFFFFFFFFFFDFFFFFLL;
      [(PXStoryClipLayout *)self _updateContentMode];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v57 = [MEMORY[0x1E4F28B00] currentHandler];
      char v58 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v57 handleFailureInFunction:v58, @"PXStoryClipLayout.m", 926, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v18 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x1000000uLL;
    if ((v18 & 0x1000000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v18 & 0xFFFFFFFFFEFFFFFFLL;
      [(PXStoryClipLayout *)self _updateTextResourceSpriteFrame];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      long long v59 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v60 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v59 handleFailureInFunction:v60, @"PXStoryClipLayout.m", 929, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v19 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x2000000uLL;
    if ((v19 & 0x2000000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v19 & 0xFFFFFFFFFDFFFFFFLL;
      [(PXStoryClipLayout *)self _updateModelPresentedTextProperties];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      id v61 = [MEMORY[0x1E4F28B00] currentHandler];
      char v62 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v61 handleFailureInFunction:v62, @"PXStoryClipLayout.m", 932, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v20 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v20 & 0x10) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v20 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXStoryClipLayout *)self _updateContent];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v63 = [MEMORY[0x1E4F28B00] currentHandler];
      double v64 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v63 handleFailureInFunction:v64, @"PXStoryClipLayout.m", 935, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v21 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x80uLL;
    if ((v21 & 0x80) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v21 & 0xFFFFFFFFFFFFFF7FLL;
      [(PXStoryClipLayout *)self _updateAnimations];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v65 = [MEMORY[0x1E4F28B00] currentHandler];
      int v66 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v65 handleFailureInFunction:v66, @"PXStoryClipLayout.m", 938, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v22 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x100uLL;
    if ((v22 & 0x100) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v22 & 0xFFFFFFFFFFFFFEFFLL;
      [(PXStoryClipLayout *)self _updateEdgeMaskEffects];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v67 = [MEMORY[0x1E4F28B00] currentHandler];
      double v68 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v67 handleFailureInFunction:v68, @"PXStoryClipLayout.m", 941, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v23 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x8000uLL;
    if ((v23 & 0x8000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v23 & 0xFFFFFFFFFFFF7FFFLL;
      [(PXStoryClipLayout *)self _updateColorNormalizationEffect];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v69 = [MEMORY[0x1E4F28B00] currentHandler];
      int v70 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v69 handleFailureInFunction:v70, @"PXStoryClipLayout.m", 944, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v24 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10000uLL;
    if ((v24 & 0x10000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v24 & 0xFFFFFFFFFFFEFFFFLL;
      [(PXStoryClipLayout *)self _updateTextLegibilityEffect];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      long long v71 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v72 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v71 handleFailureInFunction:v72, @"PXStoryClipLayout.m", 947, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v25 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x200uLL;
    if ((v25 & 0x200) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v25 & 0xFFFFFFFFFFFFFDFFLL;
      [(PXStoryClipLayout *)self _updateCombinedEffect];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      long long v73 = [MEMORY[0x1E4F28B00] currentHandler];
      char v74 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v73 handleFailureInFunction:v74, @"PXStoryClipLayout.m", 950, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v26 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x400uLL;
    if ((v26 & 0x400) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v26 & 0xFFFFFFFFFFFFFBFFLL;
      [(PXStoryClipLayout *)self _updateContentStyle];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      char v75 = [MEMORY[0x1E4F28B00] currentHandler];
      char v76 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v75 handleFailureInFunction:v76, @"PXStoryClipLayout.m", 953, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v27 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x800uLL;
    if ((v27 & 0x800) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v27 & 0xFFFFFFFFFFFFF7FFLL;
      [(PXStoryClipLayout *)self _updateWantsHUD];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      float v77 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v78 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v77 handleFailureInFunction:v78, @"PXStoryClipLayout.m", 956, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v28 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x1000uLL;
    if ((v28 & 0x1000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v28 & 0xFFFFFFFFFFFFEFFFLL;
      [(PXStoryClipLayout *)self _updateHUD];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      long long v79 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v80 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v79 handleFailureInFunction:v80, @"PXStoryClipLayout.m", 959, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v29 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x80000uLL;
    if ((v29 & 0x80000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v29 & 0xFFFFFFFFFFF7FFFFLL;
      [(PXStoryClipLayout *)self _updateSmartGradientAdjustment];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      long long v81 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v82 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      [v81 handleFailureInFunction:v82, @"PXStoryClipLayout.m", 962, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v30 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x4000000uLL;
    if ((v30 & 0x4000000) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v30 & 0xFFFFFFFFFBFFFFFFLL;
      [(PXStoryClipLayout *)self _updateInactiveImageFilterAdjustment];
      unint64_t v30 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v30)
    {
      long long v83 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v84 = [NSString stringWithUTF8String:"-[PXStoryClipLayout update]"];
      objc_msgSend(v83, "handleFailureInFunction:file:lineNumber:description:", v84, @"PXStoryClipLayout.m", 965, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v87.receiver = self;
  v87.super_class = (Class)PXStoryClipLayout;
  [(PXGLayout *)&v87 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryClipLayout;
  [(PXGLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryClipLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryClipLayout.m", 879, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (BOOL)_isDisplayingTextResourceType:(int64_t)a3
{
  if (self->_resourceKind != 3) {
    return 0;
  }
  id v4 = [(PXStoryClipLayout *)self currentTextResourceInfo];
  BOOL v5 = [v4 type] == a3;

  return v5;
}

- (BOOL)isDisplayingSubtitle
{
  return [(PXStoryClipLayout *)self _isDisplayingTextResourceType:1];
}

- (BOOL)isDisplayingTitle
{
  return [(PXStoryClipLayout *)self _isDisplayingTextResourceType:0];
}

- (BOOL)_isDisplayingContentOfAsset:(id)a3
{
  if (self->_resourceKind != 1) {
    return 0;
  }
  id v4 = a3;
  BOOL v5 = [(PXStoryClipLayout *)self displayAsset];
  char v6 = [v5 isEqual:v4];

  return v6;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)contentSpriteEntity
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)[(PXGLayout *)self entityForSpriteAtIndex:self->_contentSpriteIndex];
}

- (id)spriteReferenceForContentSprite
{
  return [(PXGLayout *)self spriteReferenceForSpriteIndex:self->_contentSpriteIndex];
}

- (id)_effectWithClass:(Class)a3 reusableInstance:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(PXGLayout *)self entityManager];
  if (v6)
  {
    unint64_t v8 = [v6 entityManager];
    BOOL v9 = v8 != v7;
  }
  else
  {
    BOOL v9 = 1;
  }
  unint64_t v10 = v6;
  if (v9)
  {
    unint64_t v10 = v6;
    if (v7)
    {
      unint64_t v10 = (void *)[[a3 alloc] initWithEntityManager:v7];
    }
  }

  return v10;
}

- (void)setVideoPresentationController:(id)a3
{
  BOOL v5 = (PXGDisplayAssetVideoPresentationController *)a3;
  id v6 = self->_videoPresentationController;
  if (v6 == v5)
  {
  }
  else
  {
    unint64_t v7 = v6;
    char v8 = [(PXGDisplayAssetVideoPresentationController *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      BOOL v9 = self->_videoPresentationController;
      objc_storeStrong((id *)&self->_videoPresentationController, a3);
      [(PXStoryClipLayout *)self _invalidateVideoPresentationControllerState];
      [(PXStoryClipLayout *)self _invalidatePlayheadState];
      unint64_t v10 = [(PXStoryClipLayout *)self model];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__PXStoryClipLayout_setVideoPresentationController___block_invoke;
      v12[3] = &unk_1E5DC3540;
      unint64_t v13 = v9;
      unint64_t v14 = v5;
      unint64_t v11 = v9;
      [v10 performChanges:v12];
    }
  }
}

void __52__PXStoryClipLayout_setVideoPresentationController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3, "removeVideoPresentationController:");
    id v3 = v4;
  }
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v4, "addVideoPresentationController:");
    id v3 = v4;
  }
}

- (void)setAssetPresentationStyles:(unint64_t)a3
{
  if (self->_assetPresentationStyles != a3)
  {
    self->_assetPresentationStyles = a3;
    [(PXStoryClipLayout *)self _invalidateContentVersion];
    [(PXStoryClipLayout *)self _invalidateVideoPresentationController];
  }
}

- (void)referenceDepthDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  [(PXGLayout *)&v3 referenceDepthDidChange];
  [(PXStoryClipLayout *)self _invalidateContent];
}

- (void)contentSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  [(PXGLayout *)&v3 contentSizeDidChange];
  [(PXStoryClipLayout *)self _invalidateContentStyle];
  [(PXStoryClipLayout *)self _invalidateEdgeMaskEffects];
}

- (void)alphaDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  [(PXGLayout *)&v3 alphaDidChange];
  [(PXStoryClipLayout *)self _invalidateContent];
  [(PXStoryClipLayout *)self _invalidateHUD];
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  [(PXGLayout *)&v3 displayScaleDidChange];
  [(PXStoryClipLayout *)self _invalidateContent];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXGLayout *)self referenceSize];
  -[PXGLayout setContentSize:](self, "setContentSize:");
  [(PXStoryClipLayout *)self _invalidateTextResourceSpriteFrame];
  [(PXStoryClipLayout *)self _invalidateContent];
}

- (void)entityManagerDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  [(PXGLayout *)&v3 entityManagerDidChange];
  [(PXStoryClipLayout *)self _invalidateColorGradingEffect];
  [(PXStoryClipLayout *)self _invalidateColorNormalizationEffect];
  [(PXStoryClipLayout *)self _invalidateTextLegibilityEffect];
  [(PXStoryClipLayout *)self _invalidateEdgeMaskEffects];
}

- (void)setTextFrameProgress:(id)a3
{
  BOOL v5 = (NSProgress *)a3;
  p_textFrameProgress = &self->_textFrameProgress;
  if (*p_textFrameProgress != v5)
  {
    unint64_t v7 = v5;
    [(NSProgress *)*p_textFrameProgress cancel];
    objc_storeStrong((id *)p_textFrameProgress, a3);
    BOOL v5 = v7;
  }
}

- (void)setTextResourceSpriteFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_textResourceSpriteFrame = &self->_textResourceSpriteFrame;
  if (!CGRectEqualToRect(a3, self->_textResourceSpriteFrame))
  {
    p_textResourceSpriteFrame->origin.CGFloat x = x;
    p_textResourceSpriteFrame->origin.CGFloat y = y;
    p_textResourceSpriteFrame->size.CGFloat width = width;
    p_textResourceSpriteFrame->size.CGFloat height = height;
    [(PXStoryClipLayout *)self _invalidateModelPresentedTextProperties];
    [(PXStoryClipLayout *)self _invalidateContent];
  }
}

- (void)setShouldObserveInternationalStyleTitlePreferences:(BOOL)a3
{
  if (self->_shouldObserveInternationalStyleTitlePreferences != a3)
  {
    self->_shouldObserveInternationalStyleTitlePreferences = a3;
    if (a3) {
      PXStoryTitleInternationalStyleRegisterPreferencesObserver(self);
    }
    else {
      PXStoryTitleInternationalStyleUnregisterPreferencesObserver(self);
    }
  }
}

- (void)setCurrentTextResourceInfo:(id)a3
{
  unint64_t v7 = (PXStoryTextResourceInfo *)a3;
  BOOL v5 = self->_currentTextResourceInfo;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryTextResourceInfo *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_currentTextResourceInfo, a3);
      [(PXStoryClipLayout *)self setShouldObserveInternationalStyleTitlePreferences:v7 != 0];
    }
  }
}

- (void)setRelativeZPositionAboveLegibilityGradients:(double)a3
{
  if (self->_relativeZPositionAboveLegibilityGradients != a3)
  {
    self->_relativeZPositionAboveLegibilityGradients = a3;
    [(PXStoryClipLayout *)self _invalidateContent];
  }
}

- (void)setKenBurnsAnimation:(id)a3
{
  char v8 = (PXStoryRectAnimation *)a3;
  p_kenBurnsAnimation = &self->_kenBurnsAnimation;
  BOOL v6 = self->_kenBurnsAnimation;
  if (v6 == v8)
  {
  }
  else
  {
    char v7 = [(PXStoryRectAnimation *)v8 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [(PXStoryRectAnimation *)*p_kenBurnsAnimation unregisterChangeObserver:self context:KenBurnsAnimationObservationContext];
      objc_storeStrong((id *)&self->_kenBurnsAnimation, a3);
      [(PXStoryRectAnimation *)*p_kenBurnsAnimation registerChangeObserver:self context:KenBurnsAnimationObservationContext];
      [(PXStoryClipLayout *)self _invalidateContentStyle];
    }
  }
}

- (void)setDisableClippingAnimation:(BOOL)a3
{
  if (self->_disableClippingAnimation != a3)
  {
    self->_disableClippingAnimation = a3;
    [(PXStoryClipLayout *)self _invalidateAnimations];
    [(PXStoryClipLayout *)self _invalidateContentStyle];
  }
}

- (void)setClippingAnimation:(id)a3
{
  char v8 = (PXStoryTiltedEdgeInsetsAnimation *)a3;
  p_clippingAnimation = &self->_clippingAnimation;
  BOOL v6 = self->_clippingAnimation;
  if (v6 == v8)
  {
  }
  else
  {
    char v7 = [(PXStoryTiltedEdgeInsetsAnimation *)v8 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [(PXStoryTiltedEdgeInsetsAnimation *)*p_clippingAnimation unregisterChangeObserver:self context:ClippingAnimationObservationContext];
      objc_storeStrong((id *)&self->_clippingAnimation, a3);
      [(PXStoryTiltedEdgeInsetsAnimation *)*p_clippingAnimation registerChangeObserver:self context:ClippingAnimationObservationContext];
      [(PXStoryClipLayout *)self _invalidateEdgeMaskEffects];
    }
  }
}

- (void)setIsReadyForAutoplay:(BOOL)a3
{
  if (self->_isReadyForAutoplay != a3)
  {
    self->_isReadyForAutoplaCGFloat y = a3;
    [(PXStoryClipLayout *)self _invalidateAssetPresentationStyles];
    [(PXStoryClipLayout *)self _invalidateVideoPresentationController];
  }
}

- (void)setAutoplayTimeRange:(id *)a3
{
  p_autoplayTimeRange = &self->_autoplayTimeRange;
  long long v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range1.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range1.start.CMTimeEpoch epoch = v6;
  *(_OWORD *)&range1.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  long long v7 = *(_OWORD *)&self->_autoplayTimeRange.start.epoch;
  *(_OWORD *)&v10.start.CMTimeValue value = *(_OWORD *)&self->_autoplayTimeRange.start.value;
  *(_OWORD *)&v10.start.CMTimeEpoch epoch = v7;
  *(_OWORD *)&v10.duration.CMTimeScale timescale = *(_OWORD *)&self->_autoplayTimeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->var0.var0;
    long long v9 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&p_autoplayTimeRange->start.CMTimeEpoch epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&p_autoplayTimeRange->duration.CMTimeScale timescale = v9;
    *(_OWORD *)&p_autoplayTimeRange->start.CMTimeValue value = v8;
    [(PXStoryClipLayout *)self _invalidateVideoPresentationControllerState];
  }
}

- (void)setShouldAutoplay:(BOOL)a3
{
  if (self->_shouldAutoplay != a3)
  {
    self->_shouldAutoplaCGFloat y = a3;
    if (a3) {
      [(PXStoryClipLayout *)self setIsReadyForAutoplay:1];
    }
    [(PXStoryClipLayout *)self _invalidateVideoPresentationControllerState];
  }
}

- (void)setContentSpriteNormalizedFrameOverride:(CGRect)a3 coordinateSystem:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentSpriteNormalizedFrameOverride = &self->_contentSpriteNormalizedFrameOverride;
  if (!CGRectEqualToRect(a3, self->_contentSpriteNormalizedFrameOverride)
    || self->_contentSpriteNormalizedFrameOverrideCoordinateSystem != a4)
  {
    p_contentSpriteNormalizedFrameOverride->origin.CGFloat x = x;
    p_contentSpriteNormalizedFrameOverride->origin.CGFloat y = y;
    p_contentSpriteNormalizedFrameOverride->size.CGFloat width = width;
    p_contentSpriteNormalizedFrameOverride->size.CGFloat height = height;
    self->_contentSpriteNormalizedFrameOverrideCoordinateSystem = a4;
    [(PXStoryClipLayout *)self _invalidateContent];
  }
}

- (void)setContentsRectOverride:(id *)a3
{
}

- (void)setDisplayAsset:(id)a3
{
  BOOL v5 = (PXDisplayAsset *)a3;
  displayAsset = self->_displayAsset;
  if (displayAsset != v5)
  {
    long long v9 = v5;
    if (v5 && displayAsset)
    {
      long long v7 = displayAsset;
      uint64_t v8 = [(PXDisplayAsset *)v9 isContentEqualTo:v7];
      if (!v8) {
        uint64_t v8 = [(PXDisplayAsset *)v7 isContentEqualTo:v9];
      }

      objc_storeStrong((id *)&self->_displayAsset, a3);
      [(PXStoryClipLayout *)self setIsReadyForAutoplay:0];
      if (v8 != 2) {
        [(PXStoryClipLayout *)self _invalidateColorNormalizationEffect];
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_displayAsset, a3);
      [(PXStoryClipLayout *)self setIsReadyForAutoplay:0];
    }
    [(PXStoryClipLayout *)self _invalidateContent];
    BOOL v5 = v9;
  }
}

- (void)setIsPlayheadInVideoTimeRange:(BOOL)a3 isPlayheadInAudioTimeRange:(BOOL)a4 wasPlayheadMovedManually:(BOOL)a5 currentAudioVolume:(float)a6
{
  int v8 = a4;
  int v9 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int isPlayheadInVideoTimeRange = self->_isPlayheadInVideoTimeRange;
  if (isPlayheadInVideoTimeRange != a3) {
    self->_int isPlayheadInVideoTimeRange = a3;
  }
  int isPlayheadInAudioTimeRange = self->_isPlayheadInAudioTimeRange;
  if (isPlayheadInAudioTimeRange != a4)
  {
    self->_int isPlayheadInAudioTimeRange = a4;
    unint64_t v13 = [(PXStoryClipLayout *)self model];
    unint64_t v14 = [v13 log];

    unint64_t v15 = v14;
    os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, self);
    os_signpost_id_t v17 = v16;
    if (v8)
    {
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        unint64_t v26 = [(PXStoryClipLayout *)self model];
        uint64_t v24 = [v26 logContext];
        unint64_t v18 = [(PXStoryClipLayout *)self clip];
        unint64_t v25 = v18;
        if (v18)
        {
          [v18 info];
          [(PXStoryClipLayout *)self model];
        }
        else
        {
          bzero(v27, 0x300uLL);
          [(PXStoryClipLayout *)self model];
        unint64_t v20 = };
        unint64_t v21 = [v20 timeline];
        *(_DWORD *)buf = 134218498;
        uint64_t v29 = v24;
        __int16 v30 = 2050;
        uint64_t v31 = v23;
        __int16 v32 = 2114;
        uint64_t v33 = v21;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PXStoryClipLayoutPlayheadInAudioTimeRange", "Context=%{signpost.telemetry:string2}lu clipIdentifier=%{signpost.description:attribute, public}ld timeline=%{signpost.description:attribute, public}@", buf, 0x20u);
      }
    }
    else if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      unint64_t v19 = [(PXStoryClipLayout *)self model];
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = [v19 logContext];
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_END, v17, "PXStoryClipLayoutPlayheadInAudioTimeRange", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }
  }
  if (self->_currentAudioVolume != a6)
  {
    self->_currentAudioVolume = a6;
    self->_wasPlayheadMovedManuallCGFloat y = a5;
    [(PXStoryClipLayout *)self _invalidateVideoPresentationControllerState];
LABEL_17:
    [(PXStoryClipLayout *)self _invalidateMusicDucking];
    return;
  }
  self->_wasPlayheadMovedManuallCGFloat y = a5;
  if (isPlayheadInVideoTimeRange != v9 || isPlayheadInAudioTimeRange != v8)
  {
    [(PXStoryClipLayout *)self _invalidateVideoPresentationControllerState];
    if (isPlayheadInAudioTimeRange != v8) {
      goto LABEL_17;
    }
  }
}

- (void)setShouldAspectFitContent:(BOOL)a3
{
  if (self->_shouldAspectFitContent != a3)
  {
    self->_shouldAspectFitContent = a3;
    [(PXStoryClipLayout *)self _invalidateContent];
    [(PXStoryClipLayout *)self _invalidateContentStyle];
    if ([(PXStoryClipLayout *)self isSegmentVisible])
    {
      id v4 = [(PXGLayout *)self createAnimation];
      [v4 setDuration:0.2];
    }
  }
}

- (void)setOffsetFromCurrentSegment:(int64_t)a3
{
  if (self->_offsetFromCurrentSegment != a3)
  {
    self->_offsetFromCurrentSegment = a3;
    [(PXStoryClipLayout *)self _invalidatePlayheadState];
  }
}

- (void)setIsSegmentVisible:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_isSegmentVisible != a3)
  {
    BOOL v3 = a3;
    self->_isSegmentVisible = a3;
    if (self->_isFeedThumbnail)
    {
LABEL_15:
      [(PXStoryClipLayout *)self _invalidateVideoPresentationControllerState];
      [(PXStoryClipLayout *)self _invalidateAnimations];
      [(PXStoryClipLayout *)self _invalidateHUD];
      [(PXStoryClipLayout *)self _invalidateContentMode];
      [(PXStoryClipLayout *)self _invalidateContentStyle];
      return;
    }
    BOOL v5 = [(PXStoryClipLayout *)self model];
    long long v6 = [v5 log];

    long long v7 = v6;
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
    os_signpost_id_t v9 = v8;
    if (v3)
    {
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7)) {
        goto LABEL_14;
      }
      CMTimeRange v10 = [(PXStoryClipLayout *)self model];
      uint64_t v11 = [v10 logContext];
      unint64_t v12 = [(PXStoryClipLayout *)self clip];
      unint64_t v13 = v12;
      if (v12)
      {
        [v12 info];
        uint64_t v14 = v17[0];
      }
      else
      {
        bzero(v17, 0x300uLL);
        uint64_t v14 = 0;
      }
      unint64_t v15 = [(PXStoryClipLayout *)self model];
      os_signpost_id_t v16 = [v15 timeline];
      *(_DWORD *)buf = 134218498;
      uint64_t v19 = v11;
      __int16 v20 = 2050;
      uint64_t v21 = v14;
      __int16 v22 = 2114;
      uint64_t v23 = v16;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PXStoryClipLayoutIsSegmentVisible", "Context=%{signpost.telemetry:string2}lu clipIdentifier=%{signpost.description:attribute, public}ld timeline=%{signpost.description:attribute, public}@", buf, 0x20u);
    }
    else
    {
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7)) {
        goto LABEL_14;
      }
      CMTimeRange v10 = [(PXStoryClipLayout *)self model];
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = [v10 logContext];
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v9, "PXStoryClipLayoutIsSegmentVisible", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }

LABEL_14:
    goto LABEL_15;
  }
}

- (void)setHUDTimer:(id)a3
{
  BOOL v5 = (NSTimer *)a3;
  p_HUDTimer = &self->_HUDTimer;
  if (*p_HUDTimer != v5)
  {
    long long v7 = v5;
    [(NSTimer *)*p_HUDTimer invalidate];
    objc_storeStrong((id *)p_HUDTimer, a3);
    BOOL v5 = v7;
  }
}

- (void)setWantsHUD:(BOOL)a3
{
  if (self->_wantsHUD != a3)
  {
    self->_wantsHUD = a3;
    [(PXStoryClipLayout *)self _invalidateHUD];
    if (self->_wantsHUD)
    {
      objc_msgSend(MEMORY[0x1E4F1CB00], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__invalidateHUD, 0, 1, 1.0);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      [(PXStoryClipLayout *)self setHUDTimer:v4];
    }
    else
    {
      [(PXStoryClipLayout *)self setHUDTimer:0];
    }
  }
}

- (void)setSegmentIdentifiers:(id)a3
{
  os_signpost_id_t v8 = (NSIndexSet *)a3;
  id v4 = self->_segmentIdentifiers;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSIndexSet *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      long long v6 = (NSIndexSet *)[(NSIndexSet *)v8 copy];
      segmentIdentifiers = self->_segmentIdentifiers;
      self->_segmentIdentifiers = v6;

      [(PXStoryClipLayout *)self _invalidateIsSegmentVisible];
      [(PXStoryClipLayout *)self _invalidateHUD];
      [(PXStoryClipLayout *)self _invalidateOffsetFromCurrentSegment];
    }
  }
}

- (void)setCombinedEffect:(id)a3
{
  long long v7 = (PXGCombinedEffect *)a3;
  char v5 = self->_combinedEffect;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXGCombinedEffect *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_combinedEffect, a3);
      [(PXStoryClipLayout *)self _invalidateContentStyle];
    }
  }
}

- (void)setRightEdgeClippingMaskEffect:(id)a3
{
  long long v7 = (PXGRegionMaskEffect *)a3;
  char v5 = self->_rightEdgeClippingMaskEffect;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXGRegionMaskEffect *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_rightEdgeClippingMaskEffect, a3);
      [(PXStoryClipLayout *)self _invalidateCombinedEffect];
    }
  }
}

- (void)setLeftEdgeClippingMaskEffect:(id)a3
{
  long long v7 = (PXGRegionMaskEffect *)a3;
  char v5 = self->_leftEdgeClippingMaskEffect;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXGRegionMaskEffect *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_leftEdgeClippingMaskEffect, a3);
      [(PXStoryClipLayout *)self _invalidateCombinedEffect];
    }
  }
}

- (void)setRightEdgeMaskEffect:(id)a3
{
  long long v7 = (PXGRegionMaskEffect *)a3;
  char v5 = self->_rightEdgeMaskEffect;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXGRegionMaskEffect *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_rightEdgeMaskEffect, a3);
      [(PXStoryClipLayout *)self _invalidateCombinedEffect];
    }
  }
}

- (void)setBottomEdgeMaskEffect:(id)a3
{
  long long v7 = (PXGRegionMaskEffect *)a3;
  char v5 = self->_bottomEdgeMaskEffect;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXGRegionMaskEffect *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_bottomEdgeMaskEffect, a3);
      [(PXStoryClipLayout *)self _invalidateCombinedEffect];
    }
  }
}

- (void)setLeftEdgeMaskEffect:(id)a3
{
  long long v7 = (PXGRegionMaskEffect *)a3;
  char v5 = self->_leftEdgeMaskEffect;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXGRegionMaskEffect *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_leftEdgeMaskEffect, a3);
      [(PXStoryClipLayout *)self _invalidateCombinedEffect];
    }
  }
}

- (void)setTopEdgeMaskEffect:(id)a3
{
  long long v7 = (PXGRegionMaskEffect *)a3;
  char v5 = self->_topEdgeMaskEffect;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXGRegionMaskEffect *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_topEdgeMaskEffect, a3);
      [(PXStoryClipLayout *)self _invalidateCombinedEffect];
    }
  }
}

- (void)setTextLegibilityEffect:(id)a3
{
  long long v7 = (PXGTextLegibilityEffect *)a3;
  char v5 = self->_textLegibilityEffect;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXGTextLegibilityEffect *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_textLegibilityEffect, a3);
      [(PXStoryClipLayout *)self _invalidateCombinedEffect];
    }
  }
}

- (void)setColorNormalizationEffect:(id)a3
{
  long long v7 = (PXStoryColorNormalizationEffect *)a3;
  char v5 = self->_colorNormalizationEffect;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXGColorGradingEffect *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_colorNormalizationEffect, a3);
      [(PXStoryClipLayout *)self _invalidateCombinedEffect];
    }
  }
}

- (void)setColorGradingEffect:(id)a3
{
  long long v7 = (PXGColorGradingEffect *)a3;
  char v5 = self->_colorGradingEffect;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXGColorGradingEffect *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_colorGradingEffect, a3);
      [(PXStoryClipLayout *)self _invalidateCombinedEffect];
      [(PXStoryClipLayout *)self _invalidateColorNormalizationEffect];
    }
  }
}

- (void)setCustomColorGradeKind:(int64_t)a3
{
  if (self->_customColorGradeKind != a3)
  {
    self->_customColorGradeKind = a3;
    [(PXStoryClipLayout *)self _invalidateColorGradingEffect];
    [(PXStoryClipLayout *)self _invalidateColorNormalizationEffect];
  }
}

- (void)setColorGradeKind:(int64_t)a3
{
  if (self->_colorGradeKind != a3)
  {
    self->_colorGradeKind = a3;
    [(PXStoryClipLayout *)self _invalidateColorGradingEffect];
  }
}

- (void)setResource:(id)a3
{
  CMTimeRange v10 = (PXStoryResource *)a3;
  p_resource = &self->_resource;
  BOOL v6 = self->_resource;
  if (v6 == v10)
  {
  }
  else
  {
    char v7 = [(PXStoryResource *)v10 isEqual:v6];

    os_signpost_id_t v8 = v10;
    if (v7) {
      goto LABEL_8;
    }
    objc_storeStrong((id *)&self->_resource, a3);
    self->_int64_t resourceKind = [(PXStoryResource *)*p_resource px_storyResourceKind];
    [(PXStoryClipLayout *)self _invalidateInactiveImageFilterAdjustment];
    [(PXStoryClipLayout *)self _invalidateDisplayAsset];
    [(PXStoryClipLayout *)self _invalidateAssetPresentationStyles];
    [(PXStoryClipLayout *)self _invalidateVideoPresentationController];
    [(PXStoryClipLayout *)self _invalidateContentVersion];
    [(PXStoryClipLayout *)self _invalidateWantsHUD];
    if (self->_resourceKind == 3)
    {
      os_signpost_id_t v9 = [(PXStoryResource *)*p_resource px_storyResourceTextResourceInfo];
      [(PXStoryClipLayout *)self setCurrentTextResourceInfo:v9];
    }
    else
    {
      [(PXStoryClipLayout *)self setCurrentTextResourceInfo:0];
    }
  }
  os_signpost_id_t v8 = v10;
LABEL_8:
}

- (void)setContentAlpha:(float)a3
{
}

uint64_t __37__PXStoryClipLayout_setContentAlpha___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 932) = *(_DWORD *)(a1 + 40);
  [*(id *)(a1 + 32) _invalidateContent];
  double v2 = *(void **)(a1 + 32);
  return [v2 _invalidateInactiveImageFilterAdjustment];
}

- (void)setManualContentsRectAmount:(double)a3
{
  if (self->_manualContentsRectAmount != a3)
  {
    self->_manualContentsRectAmount = a3;
    [(PXStoryClipLayout *)self _invalidateEdgeMaskEffects];
    [(PXStoryClipLayout *)self _invalidateContentStyle];
  }
}

- (void)setManualContentsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_manualContentsRect = &self->_manualContentsRect;
  if (!CGRectEqualToRect(self->_manualContentsRect, a3))
  {
    p_manualContentsRect->origin.CGFloat x = x;
    p_manualContentsRect->origin.CGFloat y = y;
    p_manualContentsRect->size.CGFloat width = width;
    p_manualContentsRect->size.CGFloat height = height;
    [(PXStoryClipLayout *)self _invalidateEdgeMaskEffects];
    [(PXStoryClipLayout *)self _invalidateContentStyle];
  }
}

- (void)setCornerRadius:(id)a3
{
  if (v3 != self->_cornerRadius.var0.var0.topLeft
    || v4 != self->_cornerRadius.var0.var0.topRight
    || v5 != self->_cornerRadius.var0.var0.bottomLeft
    || v6 != self->_cornerRadius.var0.var0.bottomRight)
  {
    self->_cornerRadius.var0.var0.topLeft = v3;
    self->_cornerRadius.var0.var0.topRight = v4;
    self->_cornerRadius.var0.var0.bottomLeft = v5;
    self->_cornerRadius.var0.var0.bottomRight = v6;
    [(PXStoryClipLayout *)self _invalidateContentStyle];
  }
}

- (void)setCanAspectFitContent:(BOOL)a3
{
  if (self->_canAspectFitContent != a3)
  {
    self->_canAspectFitContent = a3;
    [(PXStoryClipLayout *)self _invalidateContentMode];
  }
}

- (void)setCanShowHUD:(BOOL)a3
{
  if (self->_canShowHUD != a3)
  {
    self->_canShowHUD = a3;
    [(PXStoryClipLayout *)self _invalidateWantsHUD];
  }
}

- (void)setCanShowTextLegibilityEffect:(BOOL)a3
{
  if (self->_canShowTextLegibilityEffect != a3)
  {
    self->_canShowTextLegibilityEffect = a3;
    [(PXStoryClipLayout *)self _invalidateTextLegibilityEffect];
  }
}

- (void)setCanShowColorNormalizedContent:(BOOL)a3
{
  if (self->_canShowColorNormalizedContent != a3)
  {
    self->_canShowColorNormalizedContent = a3;
    [(PXStoryClipLayout *)self _invalidateColorNormalizationEffect];
  }
}

- (void)setCanShowDynamicContent:(BOOL)a3
{
  if (self->_canShowDynamicContent != a3)
  {
    self->_canShowDynamicContent = a3;
    [(PXStoryClipLayout *)self _invalidateAssetPresentationStyles];
    [(PXStoryClipLayout *)self _invalidateAnimations];
  }
}

- (void)setClippingInsets:(UIEdgeInsets)a3
{
}

- (void)setClipTimeRange:(id *)a3
{
  p_clipTimeRange = &self->_clipTimeRange;
  long long v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range1.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range1.start.CMTimeEpoch epoch = v6;
  *(_OWORD *)&range1.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  long long v7 = *(_OWORD *)&self->_clipTimeRange.start.epoch;
  *(_OWORD *)&v10.start.CMTimeValue value = *(_OWORD *)&self->_clipTimeRange.start.value;
  *(_OWORD *)&v10.start.CMTimeEpoch epoch = v7;
  *(_OWORD *)&v10.duration.CMTimeScale timescale = *(_OWORD *)&self->_clipTimeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->var0.var0;
    long long v9 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&p_clipTimeRange->start.CMTimeEpoch epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&p_clipTimeRange->duration.CMTimeScale timescale = v9;
    *(_OWORD *)&p_clipTimeRange->start.CMTimeValue value = v8;
    [(PXStoryClipLayout *)self _invalidatePlayheadState];
    [(PXStoryClipLayout *)self _invalidateVideoPresentationControllerState];
    [(PXStoryClipLayout *)self _invalidateSegmentIdentifiers];
  }
}

- (void)setOverrideStyleInfo:(id)a3
{
  long long v7 = (PXStoryStyleDescriptor *)a3;
  float v5 = self->_overrideStyleInfo;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryStyleDescriptor *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_overrideStyleInfo, a3);
      [(PXStoryClipLayout *)self _invalidateColorGradeKind];
    }
  }
}

- (void)setModel:(id)a3
{
  float v5 = (PXStoryModel *)a3;
  p_model = &self->_model;
  model = self->_model;
  if (model != v5)
  {
    long long v9 = v5;
    [(PXStoryModel *)model unregisterChangeObserver:self context:ModelObservationContext];
    objc_storeStrong((id *)&self->_model, a3);
    [(PXStoryModel *)*p_model registerChangeObserver:self context:ModelObservationContext];
    BOOL v8 = [(PXStoryModel *)*p_model viewMode] == 3
      && ([(PXStoryModel *)*p_model thumbnailStyle] == 1
       || [(PXStoryModel *)*p_model thumbnailStyle] == 5);
    self->_isFeedThumbnail = v8;
    [(PXStoryClipLayout *)self _invalidateColorGradeKind];
    [(PXStoryClipLayout *)self _invalidateVideoPresentationController];
    [(PXStoryClipLayout *)self _invalidateVideoPresentationControllerState];
    [(PXStoryClipLayout *)self _invalidateSegmentIdentifiers];
    [(PXStoryClipLayout *)self _invalidateIsSegmentVisible];
    [(PXStoryClipLayout *)self _invalidateWantsHUD];
    [(PXStoryClipLayout *)self _invalidateHUD];
    [(PXStoryClipLayout *)self _invalidateShouldAutoplay];
    [(PXStoryClipLayout *)self _invalidateInactiveImageFilterAdjustment];
    float v5 = v9;
  }
}

- (void)setClip:(id)a3
{
  float v5 = (PXStoryClip *)a3;
  p_clip = &self->_clip;
  clip = self->_clip;
  if (clip != v5)
  {
    BOOL v8 = clip;
    objc_storeStrong((id *)&self->_clip, a3);
    if (([(PXStoryClip *)*p_clip isVisuallyEqualToClip:v8] & 1) == 0)
    {
      [(PXStoryClipLayout *)self _invalidateResource];
      [(PXStoryClipLayout *)self _invalidateAssetPresentationStyles];
      [(PXStoryClipLayout *)self _invalidateAnimations];
      [(PXStoryClipLayout *)self _invalidateHUD];
      [(PXStoryClipLayout *)self _invalidateColorGradeKind];
      [(PXStoryClipLayout *)self _invalidateColorNormalizationEffect];
      [(PXStoryClipLayout *)self _invalidateTextLegibilityEffect];
      [(PXStoryClipLayout *)self _invalidateSmartGradientAdjustment];
      [(PXStoryClipLayout *)self _invalidateInactiveImageFilterAdjustment];
      if (v8)
      {
        [(PXStoryClip *)v8 info];
        unsigned int v9 = v13;
      }
      else
      {
        bzero(v12, 0x300uLL);
        unsigned int v9 = 0;
      }
      if (*p_clip)
      {
        [(PXStoryClip *)*p_clip info];
        int v10 = v11[8];
      }
      else
      {
        bzero(v11, 0x300uLL);
        int v10 = 0;
      }
      if (((v10 ^ v9) & 0xDLL) != 0) {
        [(PXStoryClipLayout *)self _invalidateContent];
      }
    }
  }
}

- (PXStoryAnimationController)animationController
{
  double v2 = [(PXStoryClipLayout *)self model];
  float v3 = [v2 animationController];

  return (PXStoryAnimationController *)v3;
}

- (NSString)description
{
  float v3 = NSString;
  float v4 = (objc_class *)objc_opt_class();
  float v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; clipIdentifier:%ld>",
    v5,
    self,
  char v6 = [(PXStoryClip *)self->_clip identifier]);

  return (NSString *)v6;
}

- (void)dealloc
{
  [(NSTimer *)self->_HUDTimer invalidate];
  [(NSProgress *)self->_textFrameProgress cancel];
  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  [(PXGLayout *)&v3 dealloc];
}

- (PXStoryClipLayout)init
{
  v20.receiver = self;
  v20.super_class = (Class)PXStoryClipLayout;
  double v2 = [(PXGLayout *)&v20 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_contentAlpha = 1.0;
    float v4 = (CGPoint *)MEMORY[0x1E4F1DB20];
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v2->_contentBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v2->_contentBounds.size = v5;
    v2->_useContentBoundsForContentEdgeInsets = 1;
    *(_OWORD *)&v2->_contentEdgeInsets.top.preRotationInset = PXStoryTiltedEdgeInsetsNull;
    *(_OWORD *)&v2->_contentEdgeInsets.top.postRotationInset = unk_1AB35B808;
    *(_OWORD *)&v2->_contentEdgeInsets.bottom.postRotationInset = xmmword_1AB35B838;
    *(_OWORD *)&v2->_contentEdgeInsets.right.rotationAngle = unk_1AB35B848;
    *(_OWORD *)&v2->_contentEdgeInsets.left.rotationAngle = xmmword_1AB35B818;
    *(_OWORD *)&v2->_contentEdgeInsets.bottom.preRotationInset = unk_1AB35B828;
    v2->_manualContentsRectAmount = 0.0;
    CGSize v6 = (CGSize)*((_OWORD *)off_1E5DAB010 + 1);
    v2->_manualContentsRect.origin = *(CGPoint *)off_1E5DAB010;
    v2->_manualContentsRect.size = v6;
    uint64_t v7 = MEMORY[0x1E4F1DAB8];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v2->_contentsRectTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v2->_contentsRectTransform.c = v8;
    *(_OWORD *)&v2->_contentsRectTransform.tCGFloat x = *(_OWORD *)(v7 + 32);
    v2->_contentScale = 1.0;
    long long v9 = *(_OWORD *)off_1E5DAB038;
    long long v10 = *((_OWORD *)off_1E5DAB038 + 1);
    *(_OWORD *)&v2->_contentsRectOverride.t.a = *(_OWORD *)off_1E5DAB038;
    *(_OWORD *)&v2->_contentsRectOverride.t.c = v10;
    long long v11 = *((_OWORD *)off_1E5DAB038 + 2);
    *(_OWORD *)&v2->_contentsRectOverride.t.tCGFloat x = v11;
    CGSize v12 = (CGSize)v4[1];
    v2->_contentSpriteNormalizedFrameOverride.origin = *v4;
    v2->_contentSpriteNormalizedFrameOverride.size = v12;
    *(_OWORD *)&v2->_presentedKenBurnsAnimationCurrentRect.t.a = v9;
    *(_OWORD *)&v2->_presentedKenBurnsAnimationCurrentRect.t.c = v10;
    *(_OWORD *)&v2->_presentedKenBurnsAnimationCurrentRect.t.tCGFloat x = v11;
    v2->_canShowColorNormalizedContent = 1;
    v2->_canShowTextLegibilityEffect = 1;
    CGSize v13 = (CGSize)v4[1];
    v2->_primaryDividerBounds.origin = *v4;
    v2->_primaryDividerBounds.size = v13;
    CGSize v14 = (CGSize)v4[1];
    v2->_secondaryDividerBounds.origin = *v4;
    v2->_secondaryDividerBounds.size = v14;
    v2->_offsetFromCurrentSegment = 0x7FFFFFFFFFFFFFFFLL;
    *(_OWORD *)&v2->_autoplayTimeRange.start.CMTimeValue value = 0u;
    *(_OWORD *)&v2->_autoplayTimeRange.start.CMTimeEpoch epoch = 0u;
    *(_OWORD *)&v2->_autoplayTimeRange.duration.CMTimeScale timescale = 0u;
    v2->_inactiveContentSpriteIndeCGFloat x = 0;
    v2->_contentSpriteIndeCGFloat x = 1;
    v2->_primaryDividerSpriteIndeCGFloat x = 2;
    v2->_secondaryDividerSpriteIndeCGFloat x = 3;
    unint64_t v15 = +[PXStorySettings sharedInstance];
    int v16 = [v15 isHUDEnabled];

    if (v16) {
      int v17 = 4;
    }
    else {
      int v17 = -1;
    }
    if (v16) {
      uint64_t v18 = 5;
    }
    else {
      uint64_t v18 = 4;
    }
    v3->_diagnosticHUDSpriteIndeCGFloat x = v17;
    [(PXGLayout *)v3 addSpriteCount:v18 withInitialState:0];
    [(PXStoryClipLayout *)v3 _invalidateContent];
    [(PXGLayout *)v3 setContentSource:v3];
  }
  return v3;
}

+ (BOOL)shouldContinueKenBurnsAnimationFromPreviousPresentedContentSize:(CGSize)a3 toCurrentContentSize:(CGSize)a4
{
  float v4 = +[PXStorySettings sharedInstance];
  if ([v4 allowsContinuousKenBurnsAnimations]) {
    PXSizeGetAspectRatioWithDefault();
  }

  return 0;
}

@end