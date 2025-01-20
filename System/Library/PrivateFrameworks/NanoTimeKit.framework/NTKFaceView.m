@interface NTKFaceView
+ (id)_prewarmSharedData;
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (id)_swatchImageForColorOption:(id)a3 forDevice:(id)a4 color:(id)a5 size:(CGSize)a6;
+ (id)newFaceViewForFace:(id)a3;
+ (id)pigmentFromOption:(id)a3;
+ (int64_t)numberOfDetailModesForFaceStyle:(int64_t)a3;
+ (int64_t)uiSensitivity;
- (BOOL)_allowsEditingSliderEditableColorsForSlot:(id)a3;
- (BOOL)_applyRoundedCornerOverlay;
- (BOOL)_canStartTimeScrubbing;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4;
- (BOOL)_isAnalog;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_legacyShouldSwapGraphicCircularComplicationColors;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_renderSynchronouslyIfNeededInGroup:(id)a3;
- (BOOL)_shouldHideUI;
- (BOOL)_supportsTimeScrubbing;
- (BOOL)_supportsUnadornedSnapshot;
- (BOOL)_useAlternateComplicationColorForGraphicCircularComplication:(id)a3;
- (BOOL)_useAlternateComplicationColorForGraphicCircularComplicationInSlot:(id)a3;
- (BOOL)_useAlternateComplicationColorForGraphicCircularComplicationInView:(id)a3;
- (BOOL)_usesCustomZoom;
- (BOOL)_usesSimplifiedZoom;
- (BOOL)_wantsDimWithDesaturationFilterDuringComplicationEditing;
- (BOOL)_wantsOpportunisticLiveFaceLoading;
- (BOOL)_wantsStatusBarHidden;
- (BOOL)_wantsStatusBarIconShadow;
- (BOOL)_wheelChangedWithEvent:(id)a3;
- (BOOL)allFontsHidden;
- (BOOL)allowsHomeScreenTransition;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)complicationDisplayWrapperView:(id)a3 shouldStartCustomDataAnimationFromEarlierView:(id)a4 laterView:(id)a5 isForward:(BOOL)a6 animationType:(unint64_t)a7;
- (BOOL)complicationIsHiddenAtSlot:(id)a3;
- (BOOL)complicationsShowEditingContent;
- (BOOL)editing;
- (BOOL)isEveryComplicationHidden;
- (BOOL)isFrozen;
- (BOOL)isSlow;
- (BOOL)monochromeRichComplicationsEnabled;
- (BOOL)needsImageQueueDiscardOnRender;
- (BOOL)orbing;
- (BOOL)presentedViewControllerShouldBecomeFirstResponder:(id)a3;
- (BOOL)renderIfNeeded;
- (BOOL)shouldShowUnsnapshotableContent;
- (BOOL)showContentForUnadornedSnapshot;
- (BOOL)showsCanonicalContent;
- (BOOL)showsLockedUI;
- (BOOL)supportsUnadornedSnapshot;
- (BOOL)timeScrubbing;
- (BOOL)zooming;
- (CGAffineTransform)_displayContentTransformForComplicationSlot:(SEL)a3 displayWrapper:(id)a4;
- (CGAffineTransform)_displayEditingTransformForComplicationSlot:(SEL)a3 displayWrapper:(id)a4;
- (CGRect)_faceViewFrameForEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5;
- (CGRect)_frameForComplicationDisplayWrapper:(id)a3 inSlot:(id)a4;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (CGRect)_keylineFrameForCustomEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5;
- (CGRect)_keylineFrameForCustomEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5 selectedSlot:(id)a6;
- (CGRect)_keylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (CGRect)_keylineFrameForEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5 selectedSlot:(id)a6;
- (CGRect)_keylineFrameFromRelativeFrame:(CGRect)a3 forEditingMode:(int64_t)a4 option:(id)a5 slot:(id)a6;
- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (CGRect)keylineFrameForCustomEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5;
- (CGRect)keylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4 selectedSlot:(id)a5;
- (CGSize)_maxSizeForComplicationSlot:(id)a3 layoutOverride:(int64_t)a4;
- (CLKDevice)device;
- (NSDate)currentDisplayDate;
- (NSMutableDictionary)editConfigurations;
- (NSString)clientIdentifier;
- (NSString)resourceDirectory;
- (NSString)selectedComplicationSlot;
- (NTKFaceColorPalette)faceColorPalette;
- (NTKFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKFaceViewComplicationFactory)complicationFactory;
- (NTKFaceViewDelegate)delegate;
- (NTKInterpolatedColorPalette)interpolatedColorPalette;
- (NTKTimeView)timeView;
- (UIColor)alternateComplicationColor;
- (UIColor)complicationBackgroundColor;
- (UIColor)complicationColor;
- (UIColor)interpolatedComplicationColor;
- (UIImageView)switcherSnapshotView;
- (UIView)complicationContainerView;
- (UIView)contentView;
- (UIView)foregroundContainerView;
- (UIView)rootContainerView;
- (UIView)unadornedSnapshotView;
- (double)_alphaForComplicationSlot:(id)a3 inEditOption:(id)a4 ofEditMode:(int64_t)a5;
- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (double)_faceEditingScaleForEditMode:(int64_t)a3 slot:(id)a4;
- (double)_horizontalPaddingForStatusBar;
- (double)_minimumBreathingScaleForComplicationSlot:(id)a3;
- (double)_verticalPaddingForStatusBar;
- (double)alphaForDimmedState;
- (double)editModeTransitionFraction;
- (id)_accessPrewarmedData;
- (id)_additionalPrelaunchApplicationIdentifiers;
- (id)_additonalViewsToApplyDesaturationDuringComplicationEditing;
- (id)_allViewsWithComplicationEditingDesaturationFilter;
- (id)_blurSourceImage;
- (id)_complicationContainerViewForSlot:(id)a3;
- (id)_complicationSlotsHiddenByCurrentConfiguration;
- (id)_complicationSlotsHiddenByEditOption:(id)a3;
- (id)_defaultKeylineViewForComplicationSlot:(id)a3;
- (id)_detachedComplicationDisplays;
- (id)_editModesDisabledByCurrentConfiguration;
- (id)_editModesNotDisabledByCurrentConfiguration;
- (id)_editOptionThatHidesAllComplications;
- (id)_editOptionsThatHideEditModes;
- (id)_keylineViewForComplicationSlot:(id)a3;
- (id)_layoutRuleForComplicationSlot:(id)a3 withOverride:(int64_t)a4 inEditMode:(int64_t)a5;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_overrideColorForStatusBar;
- (id)_swatchColorForColorOption:(id)a3;
- (id)_swatchImageForColorOption:(id)a3 size:(CGSize)a4;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)allVisibleComplicationsForCurrentConfiguration;
- (id)backgroundColorForView:(id)a3;
- (id)closestVisibleComplicationSlotToSlot:(id)a3;
- (id)closestVisibleSlotToSlot:(id)a3 editMode:(int64_t)a4;
- (id)colorForView:(id)a3 accented:(BOOL)a4;
- (id)complicationLayoutforSlot:(id)a3;
- (id)createFaceColorPalette;
- (id)customEditingViewController;
- (id)detachedComplicationDisplayWrapperForSlot:(id)a3;
- (id)filterForView:(id)a3 style:(int64_t)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)filtersForView:(id)a3 style:(int64_t)a4;
- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)interpolatedColorForView:(id)a3;
- (id)layoutRuleForComplicationSlot:(id)a3 inState:(int64_t)a4 layoutOverride:(int64_t)a5;
- (id)newLegacyComplicationViewForSlot:(id)a3 family:(int64_t)a4 complication:(id)a5;
- (id)normalComplicationDisplayWrapperForSlot:(id)a3;
- (id)optionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)swatchImageForColorOption:(id)a3;
- (id)swatchPrimaryColorForColorOption:(id)a3;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (int64_t)_swatchImageContentMode;
- (int64_t)complicationPickerStyleForSlot:(id)a3;
- (int64_t)dataMode;
- (int64_t)detailMode;
- (int64_t)faceStyle;
- (int64_t)fromEditMode;
- (int64_t)legacyComplicationLayoutOverrideForSlot:(id)a3 complication:(id)a4;
- (int64_t)toEditMode;
- (unint64_t)_detentTypeForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (unint64_t)_layoutStyleForSlot:(id)a3;
- (void)_addSaturationFilterToViews:(id)a3;
- (void)_applyEditConfigurationsWithForce:(BOOL)a3;
- (void)_applyFrozen;
- (void)_becameActiveFace;
- (void)_bringForegroundViewsToFront;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8;
- (void)_disableCrown;
- (void)_enableCrown;
- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_finalizeForSnapshotting:(id)a3;
- (void)_getKeylineFrame:(CGRect *)a3 padding:(UIEdgeInsets *)a4 forComplicationSlot:(id)a5 selected:(BOOL)a6;
- (void)_handleLocaleDidChange;
- (void)_layoutComplicationViewForSlot:(id)a3;
- (void)_layoutComplicationViewWithWrapper:(id)a3 forSlot:(id)a4;
- (void)_layoutComplicationViews;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_performPrewarmRoutine:(id)a3;
- (void)_prepareForStatusChange:(BOOL)a3;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_reorderSwitcherSnapshotView;
- (void)_setComplicationAlphaForTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 customEditMode:(int64_t)a6 slot:(id)a7;
- (void)_setComplicationEditingSaturationValue:(float)a3;
- (void)_setTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_setupComplicationViewsIfHidden;
- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_teardownComplicationViewsIfNeeded;
- (void)_updateComplicationMaxSize;
- (void)_updateFaceColorPaletteWithOption:(id)a3 mode:(int64_t)a4;
- (void)_updateMaxSizeForDisplayWrapper:(id)a3 slot:(id)a4;
- (void)_updateSaturationForComplicationEditing;
- (void)_updateStatusIconVisibility;
- (void)_updateTimeOffset;
- (void)applyBreathingFraction:(double)a3 forComplicationSlot:(id)a4;
- (void)changeComplicationsAlpha:(double)a3;
- (void)cleanupAfterEditing;
- (void)cleanupAfterOrb:(BOOL)a3;
- (void)cleanupAfterZoom;
- (void)complicationDisplayWrapperView:(id)a3 updateCustomDataAnimationFromEarlierView:(id)a4 laterView:(id)a5 isForward:(BOOL)a6 animationType:(unint64_t)a7 animationDuration:(double)a8 animationFraction:(float)a9;
- (void)configureComplicationViewDisplayWrapper:(id)a3 forSlot:(id)a4;
- (void)configureForEditMode:(int64_t)a3;
- (void)configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)dealloc;
- (void)disableCrownEventReception;
- (void)enableCrownEventReception;
- (void)endScrubbingAnimated:(BOOL)a3;
- (void)endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)enumerateComplicationDisplayWrappersWithBlock:(id)a3;
- (void)enumerateQuadViewsWithBlock:(id)a3;
- (void)handleUnadornedSnapshotRemoved;
- (void)hideAppropriateComplicationsForCurrentConfigurationInEditMode:(int64_t)a3;
- (void)invalidateComplicationLayout;
- (void)layoutContainerView:(id)a3;
- (void)layoutSubviews;
- (void)loadContentToReplaceUnadornedSnapshot;
- (void)performScrollTestNamed:(id)a3 completion:(id)a4;
- (void)performWristRaiseAnimation;
- (void)populateFaceViewEditOptionsFromFace:(id)a3;
- (void)populateFaceViewEditOptionsFromFace:(id)a3 forced:(BOOL)a4;
- (void)prepareForEditing;
- (void)prepareForOrb;
- (void)prepareForStatusChange:(BOOL)a3;
- (void)prepareToZoom;
- (void)prepareWristRaiseAnimation;
- (void)quadViewWillEnterSubtree:(id)a3;
- (void)quadViewWillLeaveSubtree:(id)a3;
- (void)reconfigureComplicationViews;
- (void)reloadSnapshotContentViews;
- (void)renderIfNeeded;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)setAlternateComplicationColor:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setComplicationBackgroundColor:(id)a3;
- (void)setComplicationColor:(id)a3;
- (void)setComplicationContainerView:(id)a3;
- (void)setComplicationFactory:(id)a3;
- (void)setComplicationHidden:(BOOL)a3 atSlot:(id)a4;
- (void)setComplicationsShowEditingContent:(BOOL)a3;
- (void)setContentView:(id)a3;
- (void)setDataMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDetachedComplicationDisplayWrapper:(id)a3 forSlot:(id)a4;
- (void)setDetailMode:(int64_t)a3;
- (void)setEditConfigurations:(id)a3;
- (void)setEveryComplicationHidden:(BOOL)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setInterpolatedComplicationColor:(id)a3;
- (void)setNeedsRender;
- (void)setNormalComplicationDisplayWrapper:(id)a3 forSlot:(id)a4;
- (void)setOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)setOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5 forceApply:(BOOL)a6;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setResourceDirectory:(id)a3;
- (void)setRootContainerView:(id)a3;
- (void)setSelectedComplicationSlot:(id)a3;
- (void)setShouldShowUnsnapshotableContent:(BOOL)a3;
- (void)setShowContentForUnadornedSnapshot:(BOOL)a3;
- (void)setShowsCanonicalContent:(BOOL)a3;
- (void)setShowsLockedUI:(BOOL)a3;
- (void)setSlow:(BOOL)a3;
- (void)setSwitcherSnapshotView:(id)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTimeView:(id)a3;
- (void)setTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 customEditMode:(int64_t)a6 slot:(id)a7;
- (void)setUnadornedSnapshotView:(id)a3;
- (void)shiftSelectedComplicationSlotIfHidden;
- (void)startScrubbingAnimated:(BOOL)a3;
- (void)startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)updateRichCornerComplicationsInnerColor:(id)a3 outerColor:(id)a4;
- (void)willMoveToWindow:(id)a3;
@end

@implementation NTKFaceView

- (void)updateRichCornerComplicationsInnerColor:(id)a3 outerColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__NTKFaceView_ComplicationColor__updateRichCornerComplicationsInnerColor_outerColor___block_invoke;
  v10[3] = &unk_1E62C5D58;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v10];
}

void __85__NTKFaceView_ComplicationColor__updateRichCornerComplicationsInnerColor_outerColor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v5 display];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  if (([v9 isEqualToString:@"top-left"] & 1) != 0
    || ([v9 isEqualToString:@"top-right"] & 1) != 0
    || ([v9 isEqualToString:@"bottom-left"] & 1) != 0)
  {

LABEL_6:
    [*(id *)(a1 + 32) setComplicationColor:*(void *)(a1 + 40)];
    id v7 = [*(id *)(a1 + 32) complicationColor];
    [*(id *)(a1 + 32) setInterpolatedComplicationColor:v7];

    if (*(void *)(a1 + 48)) {
      objc_msgSend(*(id *)(a1 + 32), "setAlternateComplicationColor:");
    }
    id v6 = [v5 display];
    [v6 updateMonochromeColor];
    goto LABEL_9;
  }
  char v8 = [v9 isEqualToString:@"bottom-right"];

  if (v8) {
    goto LABEL_6;
  }
LABEL_10:
}

+ (id)newFaceViewForFace:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)ViewClassForFace(v3));
  uint64_t v5 = [v3 faceStyle];
  id v6 = [v3 device];
  id v7 = [v3 bundleIdentifier];

  char v8 = (void *)[v4 initWithFaceStyle:v5 forDevice:v6 clientIdentifier:v7];
  return v8;
}

- (NTKFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  [v9 screenBounds];
  v30.receiver = self;
  v30.super_class = (Class)NTKFaceView;
  id v11 = -[NTKFaceView initWithFrame:](&v30, sel_initWithFrame_);
  id v12 = v11;
  if (v11)
  {
    [(NTKFaceView *)v11 setAccessibilityIdentifier:@"Watch Face"];
    v12->_faceStyle = a3;
    objc_storeStrong((id *)&v12->_device, a4);
    uint64_t v13 = [v10 copy];
    clientIdentifier = v12->_clientIdentifier;
    v12->_clientIdentifier = (NSString *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    complicationDisplayWrappers = v12->_complicationDisplayWrappers;
    v12->_complicationDisplayWrappers = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    complicationLayouts = v12->_complicationLayouts;
    v12->_complicationLayouts = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    editConfigurations = v12->_editConfigurations;
    v12->_editConfigurations = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    hiddenComplicationSlots = v12->_hiddenComplicationSlots;
    v12->_hiddenComplicationSlots = v21;

    v12->_complicationEditingSaturationValue = 1.0;
    uint64_t v23 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
    complicationEditingSaturationFilter = v12->_complicationEditingSaturationFilter;
    v12->_complicationEditingSaturationFilter = (CAFilter *)v23;

    [(CAFilter *)v12->_complicationEditingSaturationFilter setName:@"EditingSaturationFilter"];
    uint64_t v25 = [MEMORY[0x1E4FB1618] whiteColor];
    complicationColor = v12->_complicationColor;
    v12->_complicationColor = (UIColor *)v25;

    uint64_t v27 = [MEMORY[0x1E4FB1618] whiteColor];
    interpolatedComplicationColor = v12->_interpolatedComplicationColor;
    v12->_interpolatedComplicationColor = (UIColor *)v27;

    CLKUIDefaultAlternateComplicationColor();
  }

  return 0;
}

- (void)performScrollTestNamed:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"NTKPPTInvalidFace" reason:@"Only Siri face supports scrolling." userInfo:MEMORY[0x1E4F1CC08]];
  [v4 raise];

  uint64_t v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    uint64_t v5 = v6;
  }
}

- (void)_handleLocaleDidChange
{
  if ([(NTKFaceView *)self timeScrubbing])
  {
    [(NTKFaceView *)self endScrubbingAnimated:0];
  }
}

+ (int64_t)uiSensitivity
{
  return 0;
}

- (BOOL)monochromeRichComplicationsEnabled
{
  v2 = [(NTKFaceView *)self device];
  char v3 = NTKMonochromeComplicationsEnabledForDevice();

  return v3;
}

- (BOOL)_shouldHideUI
{
  uint64_t v2 = [(id)objc_opt_class() uiSensitivity];
  char v3 = [MEMORY[0x1E4F19A98] sharedMonitor];
  LOBYTE(v2) = [v3 shouldHideForSensitivity:v2];

  return v2;
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  if (self->_crownAssertionToken) {
    -[NTKCrownAssertionHandler relinquishCrownAssertionForToken:](self->_crownHandler, "relinquishCrownAssertionForToken:");
  }
  v4.receiver = self;
  v4.super_class = (Class)NTKFaceView;
  [(NTKFaceView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKFaceView;
  [(NTKFaceView *)&v12 layoutSubviews];
  [(NTKFaceView *)self bounds];
  double x = v13.origin.x;
  double y = v13.origin.y;
  double width = v13.size.width;
  double height = v13.size.height;
  if (!CGRectIsEmpty(v13)
    && (width != self->_boundsSizeForComputedLayouts.width || height != self->_boundsSizeForComputedLayouts.height))
  {
    [(NSMutableDictionary *)self->_complicationLayouts removeAllObjects];
    [(NTKFaceView *)self _loadLayoutRules];
    [(NTKFaceView *)self _updateComplicationMaxSize];
    [(NTKFaceView *)self _adjustUIForBoundsChange];
    self->_boundsSizeForComputedLayouts.double width = width;
    self->_boundsSizeForComputedLayouts.double height = height;
  }
  foregroundContainerView = self->_foregroundContainerView;
  if (foregroundContainerView)
  {
    [(NTKFaceView *)self bounds];
    -[UIView ntk_setBoundsAndPositionFromFrame:](foregroundContainerView, "ntk_setBoundsAndPositionFromFrame:");
  }
  else
  {
    [(NTKFaceView *)self _layoutComplicationViews];
  }
  [(NTKFaceView *)self _bringForegroundViewsToFront];
  unadornedSnapshotView = self->_unadornedSnapshotView;
  if (unadornedSnapshotView)
  {
    [(CLKDevice *)self->_device screenBounds];
    -[UIView setFrame:](unadornedSnapshotView, "setFrame:");
  }
  sensitiveUIShieldView = self->_sensitiveUIShieldView;
  if (sensitiveUIShieldView)
  {
    -[NTKExtraLargeTimeView setFrame:](sensitiveUIShieldView, "setFrame:", x, y, width, height);
    [(NTKFaceView *)self bringSubviewToFront:self->_sensitiveUIShieldView];
  }
  switcherSnapshotView = self->_switcherSnapshotView;
  [(NTKFaceView *)self bounds];
  -[UIImageView setFrame:](switcherSnapshotView, "setFrame:");
  [(NTKFaceView *)self _reorderSwitcherSnapshotView];
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKFaceView;
  [(NTKFaceView *)&v13 willMoveToWindow:v4];
  uint64_t v5 = [(NTKFaceView *)self window];

  if (!v4 && v5)
  {
    self->_removedFromWindowDuringThisTransaction = 1;
    objc_initWeak(&location, self);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __32__NTKFaceView_willMoveToWindow___block_invoke;
    id v10 = &unk_1E62C0068;
    objc_copyWeak(&v11, &location);
    +[NTKTransactionCommitCoordinator addTransactionCommitHandler:&v7];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  id v6 = [(NTKFaceView *)self window];
  if (!v4 || v6)
  {
  }
  else if (!self->_removedFromWindowDuringThisTransaction)
  {
    [(NTKFaceView *)self setNeedsRender];
    self->_needsImageQueueDiscardOnRender = 1;
  }
}

void __32__NTKFaceView_willMoveToWindow___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[642] = 0;
  }
}

- (void)setShouldShowUnsnapshotableContent:(BOOL)a3
{
  if (self->_shouldShowUnsnapshotableContent != a3)
  {
    self->_shouldShowUnsnapshotableContent = a3;
    if (a3)
    {
      [(NTKFaceView *)self _loadSnapshotContentViews];
      objc_initWeak(&location, self);
      editConfigurations = self->_editConfigurations;
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      uint64_t v8 = __50__NTKFaceView_setShouldShowUnsnapshotableContent___block_invoke;
      id v9 = &unk_1E62C9700;
      objc_copyWeak(&v10, &location);
      [(NSMutableDictionary *)editConfigurations enumerateKeysAndObjectsUsingBlock:&v6];
      [(NTKFaceView *)self _updateTimeOffset];
      [(NTKFaceView *)self _applyFrozen];
      [(NTKFaceView *)self _applySlow];
      [(NTKFaceView *)self _applyDataMode];
      [(NTKFaceView *)self _updateStatusIconVisibility];
      [(NTKFaceView *)self _applyShowsCanonicalContent];
      [(NTKFaceView *)self setNeedsRender];
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained faceViewWillUnloadSnapshotContentViews];

      [(NTKFaceView *)self _unloadSnapshotContentViews];
    }
  }
}

void __50__NTKFaceView_setShouldShowUnsnapshotableContent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)[v5 integerValue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__NTKFaceView_setShouldShowUnsnapshotableContent___block_invoke_2;
  v9[3] = &unk_1E62C96D8;
  objc_copyWeak(v11, (id *)(a1 + 32));
  id v8 = v6;
  id v10 = v8;
  v11[1] = v7;
  [v8 enumerateSlotsWithBlock:v9];

  objc_destroyWeak(v11);
}

void __50__NTKFaceView_setShouldShowUnsnapshotableContent___block_invoke_2(uint64_t a1, void *a2)
{
  char v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [*(id *)(a1 + 32) editOptionForSlot:v4];
  [WeakRetained _updateFaceColorPaletteWithOption:v5 mode:*(void *)(a1 + 48)];
  [WeakRetained _applyOption:v5 forCustomEditMode:*(void *)(a1 + 48) slot:v4];
}

- (void)setDataMode:(int64_t)a3
{
  if (self->_dataMode != a3)
  {
    kdebug_trace();
    self->_dataMode = a3;
    [(NTKFaceView *)self _applyDataMode];
    [(NTKFaceView *)self _updateStatusIconVisibility];
  }
}

- (void)setShowsCanonicalContent:(BOOL)a3
{
  if (self->_showsCanonicalContent != a3)
  {
    self->_showsCanonicalContent = a3;
    [(NTKFaceView *)self _applyShowsCanonicalContent];
  }
}

- (void)setShowContentForUnadornedSnapshot:(BOOL)a3
{
  if (self->_showContentForUnadornedSnapshot != a3)
  {
    self->_showContentForUnadornedSnapshot = a3;
    [(NTKFaceView *)self _applyShowContentForUnadornedSnapshot];
  }
}

- (void)setShowsLockedUI:(BOOL)a3
{
  if (self->_showsLockedUI != a3)
  {
    self->_showsLockedUI = a3;
    [(NTKFaceView *)self _applyShowsLockedUI];
  }
}

- (NSDate)currentDisplayDate
{
  uint64_t v2 = self->_overrideDate;
  if (!v2)
  {
    char v3 = +[NTKTimeOffsetManager sharedManager];
    uint64_t v2 = [v3 faceDisplayTime];
  }

  return v2;
}

- (void)setResourceDirectory:(id)a3
{
  id v7 = a3;
  if (([v7 isEqualToString:self->_resourceDirectory] & 1) == 0)
  {
    id v4 = (void *)[(NSString *)self->_resourceDirectory copy];
    id v5 = (NSString *)[v7 copy];
    resourceDirectordouble y = self->_resourceDirectory;
    self->_resourceDirectordouble y = v5;

    [(NTKFaceView *)self _updateForResourceDirectoryChange:v4];
  }
}

- (id)optionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  editConfigurations = self->_editConfigurations;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  id v9 = [(NSMutableDictionary *)editConfigurations objectForKey:v8];

  id v10 = [v9 editOptionForSlot:v7];

  return v10;
}

- (void)setOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
}

- (void)setOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5 forceApply:(BOOL)a6
{
  BOOL v6 = a6;
  id v18 = a3;
  id v10 = a5;
  [(NTKFaceView *)self _updateFaceColorPaletteWithOption:v18 mode:a4];
  editConfigurations = self->_editConfigurations;
  objc_super v12 = [NSNumber numberWithInteger:a4];
  objc_super v13 = [(NSMutableDictionary *)editConfigurations objectForKey:v12];

  if (!v13)
  {
    objc_super v13 = objc_alloc_init(NTKEditModeConfiguration);
    v14 = self->_editConfigurations;
    v15 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v14 setObject:v13 forKey:v15];
  }
  v16 = [(NTKEditModeConfiguration *)v13 editOptionForSlot:v10];
  if (NTKEqualObjects(v18, v16)) {
    BOOL v17 = !v6;
  }
  else {
    BOOL v17 = 0;
  }
  if (!v17)
  {
    [(NTKEditModeConfiguration *)v13 setEditOption:v18 forSlot:v10];
    if (a4 != 10) {
      [(NTKFaceView *)self hideAppropriateComplicationsForCurrentConfigurationInEditMode:a4];
    }
    [(NTKFaceView *)self _applyOption:v18 forCustomEditMode:a4 slot:v10];
  }
}

- (id)newLegacyComplicationViewForSlot:(id)a3 family:(int64_t)a4 complication:(id)a5
{
  return [(NTKFaceView *)self _newLegacyViewForComplication:a5 family:a4 slot:a3];
}

- (int64_t)legacyComplicationLayoutOverrideForSlot:(id)a3 complication:(id)a4
{
  id v6 = a3;
  int64_t v7 = -[NTKFaceView _legacyLayoutOverrideforComplicationType:slot:](self, "_legacyLayoutOverrideforComplicationType:slot:", [a4 complicationType], v6);

  return v7;
}

- (void)configureComplicationViewDisplayWrapper:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NTKFaceView *)self _updateMaxSizeForDisplayWrapper:v6 slot:v7];
  [v6 setEditing:self->_complicationsShowEditingContent];
  [(NTKFaceView *)self alphaForDimmedState];
  objc_msgSend(v6, "setAlphaForDimmedState:");
  objc_msgSend(v6, "setTextLayoutStyle:", -[NTKFaceView layoutStyleForSlot:](self, "layoutStyleForSlot:", v7));
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__NTKFaceView_configureComplicationViewDisplayWrapper_forSlot___block_invoke;
  v9[3] = &unk_1E62C9728;
  objc_copyWeak(&v11, &location);
  id v8 = v7;
  id v10 = v8;
  [v6 setDisplayConfigurationHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __63__NTKFaceView_configureComplicationViewDisplayWrapper_forSlot___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v6 filterProvider];

    if (!v4)
    {
      id v5 = [WeakRetained _filterProviderForSlot:*(void *)(a1 + 32)];
      [v6 setFilterProvider:v5];
    }
  }
  [WeakRetained configureComplicationView:v6 forSlot:*(void *)(a1 + 32)];
}

- (void)setNormalComplicationDisplayWrapper:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_complicationDisplayWrappers objectForKey:v7];
  id v9 = v8;
  if (v8 != v6)
  {
    if (v8)
    {
      [v8 setNeedsResizeHandler:0];
      [v9 removeFromSuperview];
      [(NSMutableDictionary *)self->_complicationDisplayWrappers removeObjectForKey:v7];
    }
    if (v6)
    {
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __59__NTKFaceView_setNormalComplicationDisplayWrapper_forSlot___block_invoke;
      v12[3] = &unk_1E62C1A18;
      objc_copyWeak(&v14, &location);
      id v10 = v7;
      id v13 = v10;
      [v6 setNeedsResizeHandler:v12];
      id v11 = [(NTKFaceView *)self _complicationContainerViewForSlot:v10];
      [v11 addSubview:v6];

      [(NSMutableDictionary *)self->_complicationDisplayWrappers setObject:v6 forKey:v10];
      [(NTKContainerView *)self->_foregroundContainerView setNeedsLayout];
      [(NTKFaceView *)self _updateMaxSizeForDisplayWrapper:v6 slot:v10];
      [v6 setEditing:self->_complicationsShowEditingContent];
      [(NTKFaceView *)self alphaForDimmedState];
      objc_msgSend(v6, "setAlphaForDimmedState:");
      [v6 setAnimationDelegate:self];
      if (self->_complicationsShowEditingContent) {
        [(NTKFaceView *)self _updateSaturationForComplicationEditing];
      }

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

void __59__NTKFaceView_setNormalComplicationDisplayWrapper_forSlot___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _layoutComplicationViewForSlot:*(void *)(a1 + 32)];
}

- (id)normalComplicationDisplayWrapperForSlot:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_complicationDisplayWrappers objectForKey:a3];
}

- (void)setDetachedComplicationDisplayWrapper:(id)a3 forSlot:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_complicationDisplayWrappers objectForKey:v6];
  id v8 = v10;
  id v9 = (void *)v7;
  if ((id)v7 != v10)
  {
    if (v7)
    {
      [(NSMutableDictionary *)self->_complicationDisplayWrappers removeObjectForKey:v6];
      id v8 = v10;
    }
    if (v8) {
      [(NSMutableDictionary *)self->_complicationDisplayWrappers setObject:v10 forKey:v6];
    }
  }
}

- (id)detachedComplicationDisplayWrapperForSlot:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_complicationDisplayWrappers objectForKey:a3];
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
  [(NTKFaceView *)self _applyFrozen];
}

- (void)setSlow:(BOOL)a3
{
  if (self->_slow != a3)
  {
    self->_slow = a3;
    [(NTKFaceView *)self _applySlow];
  }
}

- (BOOL)renderIfNeeded
{
  if ([(NTKFaceView *)self dataMode] == 2
    || [(NTKFaceView *)self dataMode] == 4
    || (NTKIsScreenOn() & 1) == 0 && (NTKIsDaemonOrFaceSnapshotService() & 1) == 0)
  {
    char v3 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      [(NTKFaceView *)self renderIfNeeded];
    }

    self->_needsRender = 0;
    return 0;
  }
  else
  {
    return [(NTKFaceView *)self _renderSynchronouslyIfNeededInGroup:0];
  }
}

- (void)setNeedsRender
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "%@ setNeedsRender failed. ***** PLEASE FILE A RADAR ON Watch Faces *****", (uint8_t *)&v2, 0xCu);
}

void __29__NTKFaceView_setNeedsRender__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained renderIfNeeded];
  [WeakRetained faceStyle];
  kdebug_trace();
}

- (BOOL)needsImageQueueDiscardOnRender
{
  return self->_needsImageQueueDiscardOnRender;
}

- (void)prepareWristRaiseAnimation
{
  [(NTKExtraLargeTimeView *)self->_sensitiveUIShieldView prepareWristRaiseAnimation];

  [(NTKFaceView *)self _prepareWristRaiseAnimation];
}

- (void)performWristRaiseAnimation
{
  [(NTKExtraLargeTimeView *)self->_sensitiveUIShieldView performWristRaiseAnimation];

  [(NTKFaceView *)self _performWristRaiseAnimation];
}

- (void)setComplicationsShowEditingContent:(BOOL)a3
{
  if (self->_complicationsShowEditingContent != a3)
  {
    self->_complicationsShowEditingContent = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __50__NTKFaceView_setComplicationsShowEditingContent___block_invoke;
    v3[3] = &__block_descriptor_33_e56_v24__0__NSString_8__NTKComplicationDisplayWrapperView_16l;
    BOOL v4 = a3;
    [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v3];
  }
}

uint64_t __50__NTKFaceView_setComplicationsShowEditingContent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setEditing:*(unsigned __int8 *)(a1 + 32)];
}

- (void)prepareForOrb
{
  self->_orbing = 1;
  [(NTKFaceView *)self _prepareForOrb];
}

- (void)cleanupAfterOrb:(BOOL)a3
{
  self->_orbing = 0;
  [(NTKFaceView *)self _cleanupAfterOrb:a3];
}

- (void)prepareForEditing
{
  self->_editing = 1;
  uint64_t v3 = [(NTKFaceView *)self delegate];
  [v3 faceViewWantsUnadornedSnapshotViewRemoved];

  [(NTKFaceView *)self _setupComplicationViewsIfHidden];

  [(NTKFaceView *)self _prepareForEditing];
}

- (void)cleanupAfterEditing
{
  self->_editing = 0;
  self->_toEditMode = 0;
  self->_fromEditMode = 0;
  self->_editModeTransitionFraction = 0.0;
  [(NTKFaceView *)self _teardownComplicationViewsIfNeeded];
  [(NTKFaceView *)self _cleanupAfterEditing];
  id v3 = [(NTKFaceView *)self faceColorPalette];
  [v3 resetColorCache];
}

- (void)populateFaceViewEditOptionsFromFace:(id)a3 forced:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__NTKFaceView_populateFaceViewEditOptionsFromFace_forced___block_invoke;
  v8[3] = &unk_1E62C9798;
  id v9 = v6;
  id v10 = self;
  BOOL v11 = a4;
  id v7 = v6;
  [v7 enumerateCustomEditModesWithBlock:v8];
}

void __58__NTKFaceView_populateFaceViewEditOptionsFromFace_forced___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__NTKFaceView_populateFaceViewEditOptionsFromFace_forced___block_invoke_2;
  v7[3] = &unk_1E62C9770;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  uint64_t v10 = a2;
  char v11 = *(unsigned char *)(a1 + 48);
  [v5 enumerateSlotsForCustomEditMode:a2 withBlock:v7];
}

void __58__NTKFaceView_populateFaceViewEditOptionsFromFace_forced___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) selectedOptionForCustomEditMode:*(void *)(a1 + 48) slot:v3];
  if (v4)
  {
    [*(id *)(a1 + 40) setOption:v4 forCustomEditMode:*(void *)(a1 + 48) slot:v3 forceApply:*(unsigned __int8 *)(a1 + 56)];
  }
  else
  {
    id v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 138543874;
      uint64_t v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      __int16 v12 = 2048;
      id v13 = v3;
      _os_log_error_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_ERROR, "Missing option for face %{public}@, %lu, %lu", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)populateFaceViewEditOptionsFromFace:(id)a3
{
}

- (void)configureForEditMode:(int64_t)a3
{
  [(NTKFaceView *)self _setTransitionFraction:a3 fromEditMode:a3 toEditMode:0.0];

  [(NTKFaceView *)self _configureForEditMode:a3];
}

- (void)configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  -[NTKFaceView _setTransitionFraction:fromEditMode:toEditMode:](self, "_setTransitionFraction:fromEditMode:toEditMode:");

  [(NTKFaceView *)self _configureForTransitionFraction:a4 fromEditMode:a5 toEditMode:a3];
}

- (void)setTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 customEditMode:(int64_t)a6 slot:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = [(NTKFaceView *)self faceColorPalette];

  if (a6 == 10 && v15)
  {
    v16 = [(id)objc_opt_class() pigmentFromOption:v12];
    BOOL v17 = [(NTKFaceView *)self interpolatedColorPalette];
    id v18 = [v17 fromPalette];
    [v18 setPigmentEditOption:v16];

    v19 = [(id)objc_opt_class() pigmentFromOption:v13];
    v20 = [(NTKFaceView *)self interpolatedColorPalette];
    v21 = [v20 toPalette];
    [v21 setPigmentEditOption:v19];

    v22 = [(NTKFaceView *)self interpolatedColorPalette];
    [v22 setTransitionFraction:a3];
  }
  [(NTKFaceView *)self _applyTransitionFraction:v12 fromOption:v13 toOption:a6 forCustomEditMode:v14 slot:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v24 = [WeakRetained faceViewComplicationSlots];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v25 = v24;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        -[NTKFaceView _setComplicationAlphaForTransitionFraction:fromOption:toOption:customEditMode:slot:](self, "_setComplicationAlphaForTransitionFraction:fromOption:toOption:customEditMode:slot:", v12, v13, a6, *(void *)(*((void *)&v30 + 1) + 8 * v29++), a3, (void)v30);
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v27);
  }
}

- (CGRect)keylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4 selectedSlot:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  __int16 v10 = [(NTKFaceView *)self optionForCustomEditMode:a3 slot:v9];
  [(NTKFaceView *)self _keylineFrameForEditMode:a3 option:v10 slot:v9 selectedSlot:v8];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)keylineFrameForCustomEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5
{
  [(NTKFaceView *)self _keylineFrameForEditMode:a3 option:a4 slot:a5 selectedSlot:a5];
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)_keylineFrameForEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5 selectedSlot:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  [(NTKFaceView *)self _relativeKeylineFrameForCustomEditMode:a3 slot:v11];
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  if (CGRectIsNull(v29)) {
    [(NTKFaceView *)self _keylineFrameForCustomEditMode:a3 option:v12 slot:v11 selectedSlot:v10];
  }
  else {
    -[NTKFaceView _keylineFrameFromRelativeFrame:forEditingMode:option:slot:](self, "_keylineFrameFromRelativeFrame:forEditingMode:option:slot:", a3, v12, v11, x, y, width, height);
  }
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;

  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CGRect)_keylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  double v7 = [(NTKFaceView *)self optionForCustomEditMode:a3 slot:v6];
  [(NTKFaceView *)self _keylineFrameForEditMode:a3 option:v7 slot:v6 selectedSlot:v6];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)_keylineFrameForCustomEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5 selectedSlot:(id)a6
{
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (double)_faceEditingScaleForEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  double v7 = [(NTKFaceView *)self optionForCustomEditMode:a3 slot:v6];
  [(NTKFaceView *)self faceViewFrameForEditMode:a3 option:v7 slot:v6];
  double v9 = v8;

  double v10 = [MEMORY[0x1E4F19A30] currentDevice];
  [v10 screenBounds];
  double v12 = v11;

  return v9 / v12;
}

- (CGRect)_keylineFrameFromRelativeFrame:(CGRect)a3 forEditingMode:(int64_t)a4 option:(id)a5 slot:(id)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v13 = (void *)MEMORY[0x1E4F19A30];
  id v14 = a6;
  id v15 = a5;
  double v16 = [v13 currentDevice];
  [v16 screenBounds];
  double v18 = v17;

  [(NTKFaceView *)self faceViewFrameForEditMode:a4 option:v15 slot:v14];
  double v20 = v19;

  double v21 = [(NTKFaceView *)self device];
  CLKPointRoundForDevice();
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  CGAffineTransformMakeScale(&v39, v20 / v18, v20 / v18);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGRect v41 = CGRectApplyAffineTransform(v40, &v39);
  CGRectOffset(v41, v23, v25);
  double v26 = [(NTKFaceView *)self device];
  CLKPixelAlignRectForDevice();
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  double v35 = v28;
  double v36 = v30;
  double v37 = v32;
  double v38 = v34;
  result.size.CGFloat height = v38;
  result.size.CGFloat width = v37;
  result.origin.CGFloat y = v36;
  result.origin.CGFloat x = v35;
  return result;
}

- (BOOL)presentedViewControllerShouldBecomeFirstResponder:(id)a3
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKFaceView *)self delegate];
  BOOL v4 = [v3 faceViewComplicationSlots];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self, "normalComplicationDisplayWrapperForSlot:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        double v11 = [v10 display];
        char v12 = [v11 canBecomeFirstResponder];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)becomeFirstResponder
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKFaceView *)self delegate];
  BOOL v4 = [v3 faceViewComplicationSlots];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self, "normalComplicationDisplayWrapperForSlot:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        double v11 = [v10 display];
        if ([v11 canBecomeFirstResponder]
          && ([v11 becomeFirstResponder] & 1) != 0)
        {

          BOOL v12 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (id)customEditingViewController
{
  return 0;
}

- (void)setSelectedComplicationSlot:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_selectedComplicationSlot] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedComplicationSlot, a3);
    [(NTKFaceView *)self _updateSaturationForComplicationEditing];
    [(NTKFaceView *)self setNeedsLayout];
  }
  [(NTKFaceView *)self shiftSelectedComplicationSlotIfHidden];
}

- (id)closestVisibleSlotToSlot:(id)a3 editMode:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 == 1)
  {
    id v8 = [(NTKFaceView *)self closestVisibleComplicationSlotToSlot:v6];
  }
  else
  {
    id v8 = v6;
  }
  double v9 = v8;

  return v9;
}

- (id)closestVisibleComplicationSlotToSlot:(id)a3
{
  id v4 = a3;
  if (v4 && [(NTKFaceView *)self complicationIsHiddenAtSlot:v4])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [WeakRetained faceViewComplicationSlots];

    uint64_t v7 = [v6 indexOfObject:v4];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v7;
    }
    unint64_t v9 = (v8 + 1) % (unint64_t)[v6 count];
    while (1)
    {
      if (v9 == v8)
      {
        double v11 = 0;
        goto LABEL_12;
      }
      double v10 = [v6 objectAtIndexedSubscript:v9];
      if (![(NTKFaceView *)self complicationIsHiddenAtSlot:v10]) {
        break;
      }
      unint64_t v9 = (v9 + 1) % [v6 count];
    }
    if (v9 == v8)
    {
      double v11 = 0;
      id v4 = v10;
    }
    else
    {
      id v4 = v10;
      double v11 = v4;
    }
LABEL_12:
  }
  else
  {
    id v4 = v4;
    double v11 = v4;
  }

  return v11;
}

- (void)shiftSelectedComplicationSlotIfHidden
{
  id v4 = [(NTKFaceView *)self selectedComplicationSlot];
  if (-[NTKFaceView complicationIsHiddenAtSlot:](self, "complicationIsHiddenAtSlot:"))
  {
    id v3 = [(NTKFaceView *)self closestVisibleComplicationSlotToSlot:v4];
    [(NTKFaceView *)self setSelectedComplicationSlot:v3];
  }
}

- (int64_t)complicationPickerStyleForSlot:(id)a3
{
  id v4 = a3;
  if ([(CLKDevice *)self->_device deviceCategory] != 1
    && ([(NTKFaceView *)self layoutStyleForSlot:v4] == 1
     || [(NTKFaceView *)self layoutStyleForSlot:v4] == 2))
  {
    int64_t v5 = 2;
  }
  else
  {
    int64_t v5 = [(NTKFaceView *)self _complicationPickerStyleForSlot:v4];
  }

  return v5;
}

- (id)layoutRuleForComplicationSlot:(id)a3 inState:(int64_t)a4 layoutOverride:(int64_t)a5
{
  uint64_t v7 = [(NSMutableDictionary *)self->_complicationLayouts objectForKey:a3];
  uint64_t v8 = [v7 layoutRuleForComplicationState:a4 layoutOverride:a5];

  return v8;
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = a3;
  [(NTKFaceView *)self _getKeylineFrame:&v24 padding:0 forComplicationSlot:v6 selected:v4];
  uint64_t v7 = [(NTKFaceView *)self _complicationContainerViewForSlot:v6];
  -[NTKFaceView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v7, v24, v25);
  *(void *)&long long v24 = v8;
  *((void *)&v24 + 1) = v9;
  *(void *)&long long v25 = v10;
  *((void *)&v25 + 1) = v11;

  -[NTKFaceView _keylineFrameFromRelativeFrame:forEditingMode:option:slot:](self, "_keylineFrameFromRelativeFrame:forEditingMode:option:slot:", 1, 0, v6, v24, v25);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)applyBreathingFraction:(double)a3 forComplicationSlot:(id)a4
{
  id v6 = a4;
  [(NTKFaceView *)self _minimumBreathingScaleForComplicationSlot:v6];
  double v8 = NTKScaleForBreathingFraction(a3, v7);
  uint64_t v9 = [(NTKFaceView *)self normalComplicationDisplayWrapperForSlot:v6];
  if (v9)
  {
    memset(&v12, 0, sizeof(v12));
    [(NTKFaceView *)self _displayEditingTransformForComplicationSlot:v6 displayWrapper:v9];
    CGAffineTransform v10 = v12;
    CGAffineTransformScale(&v11, &v10, v8, v8);
    CGAffineTransform v12 = v11;
    [v9 setEditingTransform:&v11];
  }
}

- (void)setSwitcherSnapshotView:(id)a3
{
  int64_t v5 = (UIImageView *)a3;
  switcherSnapshotView = self->_switcherSnapshotView;
  double v7 = v5;
  if (switcherSnapshotView != v5)
  {
    [(UIImageView *)switcherSnapshotView removeFromSuperview];
    objc_storeStrong((id *)&self->_switcherSnapshotView, a3);
    if (self->_switcherSnapshotView) {
      -[NTKFaceView addSubview:](self, "addSubview:");
    }
  }
}

- (BOOL)_isAnalog
{
  return 0;
}

- (void)layoutContainerView:(id)a3
{
  [(NTKFaceView *)self _layoutComplicationViews];
  [(NTKFaceView *)self _layoutForegroundContainerView];
  [(NTKFaceView *)self _bringForegroundViewsToFront];
  if (self->_sensitiveUIShieldView)
  {
    -[NTKFaceView bringSubviewToFront:](self, "bringSubviewToFront:");
  }
}

- (id)complicationLayoutforSlot:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NSMutableDictionary *)self->_complicationLayouts objectForKey:v4];
  if (!v5)
  {
    int64_t v5 = objc_alloc_init(NTKComplicationLayout);
    [(NSMutableDictionary *)self->_complicationLayouts setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)enumerateComplicationDisplayWrappersWithBlock:(id)a3
{
  id v4 = a3;
  complicationDisplayWrappers = self->_complicationDisplayWrappers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__NTKFaceView_enumerateComplicationDisplayWrappersWithBlock___block_invoke;
  v7[3] = &unk_1E62C97C0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)complicationDisplayWrappers enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __61__NTKFaceView_enumerateComplicationDisplayWrappersWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidateComplicationLayout
{
  self->_boundsSizeForComputedLayouts = (CGSize)*MEMORY[0x1E4F1DB30];
  [(NTKFaceView *)self setNeedsLayout];
}

- (void)reconfigureComplicationViews
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__NTKFaceView_reconfigureComplicationViews__block_invoke;
  v2[3] = &unk_1E62C87B0;
  v2[4] = self;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v2];
}

void __43__NTKFaceView_reconfigureComplicationViews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 display];
  [v4 configureComplicationView:v6 forSlot:v5];
}

- (void)reloadSnapshotContentViews
{
  if (self->_shouldShowUnsnapshotableContent)
  {
    [(NTKFaceView *)self setShouldShowUnsnapshotableContent:0];
    [(NTKFaceView *)self setShouldShowUnsnapshotableContent:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained faceViewDidReloadSnapshotContentViews];
  }
}

- (void)_loadSnapshotContentViews
{
  if ([(NTKFaceView *)self _supportsUnadornedSnapshot] && self->_unadornedSnapshotRemoved)
  {
    [(NTKFaceView *)self loadContentToReplaceUnadornedSnapshot];
  }
}

- (BOOL)supportsUnadornedSnapshot
{
  BOOL v3 = [(NTKFaceView *)self _supportsUnadornedSnapshot];
  if (v3) {
    LOBYTE(v3) = !self->_unadornedSnapshotRemoved;
  }
  return v3;
}

- (BOOL)_supportsUnadornedSnapshot
{
  return 0;
}

- (void)_applyEditConfigurationsWithForce:(BOOL)a3
{
  objc_initWeak(&location, self);
  editConfigurations = self->_editConfigurations;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__NTKFaceView__applyEditConfigurationsWithForce___block_invoke;
  v6[3] = &unk_1E62C9810;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  BOOL v8 = a3;
  [(NSMutableDictionary *)editConfigurations enumerateKeysAndObjectsUsingBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__NTKFaceView__applyEditConfigurationsWithForce___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__NTKFaceView__applyEditConfigurationsWithForce___block_invoke_2;
  v9[3] = &unk_1E62C97E8;
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  char v13 = *(unsigned char *)(a1 + 48);
  id v11 = WeakRetained;
  uint64_t v12 = v6;
  id v8 = v5;
  [v8 enumerateSlotsWithBlock:v9];
}

void __49__NTKFaceView__applyEditConfigurationsWithForce___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  BOOL v3 = [*(id *)(a1 + 32) optionForCustomEditMode:*(void *)(a1 + 56) slot:v5];
  id v4 = [*(id *)(a1 + 40) editOptionForSlot:v5];
  if (*(unsigned char *)(a1 + 64) || ([v3 isEqual:v4] & 1) == 0)
  {
    [*(id *)(a1 + 48) _updateFaceColorPaletteWithOption:v4 mode:*(void *)(a1 + 56)];
    [*(id *)(a1 + 48) _applyOption:v4 forCustomEditMode:*(void *)(a1 + 56) slot:v5];
  }
}

- (void)loadContentToReplaceUnadornedSnapshot
{
  [(NTKFaceView *)self _loadContentToReplaceUnadornedSnapshot];
  [(NTKFaceView *)self _updateTimeOffset];
  [(NTKFaceView *)self _applyFrozen];
  [(NTKFaceView *)self _applySlow];
  [(NTKFaceView *)self _applyDataMode];
  [(NTKFaceView *)self _updateStatusIconVisibility];
  [(NTKFaceView *)self _applyEditConfigurationsWithForce:0];

  [(NTKFaceView *)self setNeedsRender];
}

- (void)handleUnadornedSnapshotRemoved
{
  self->_unadornedSnapshotRemoved = 1;
}

- (void)_reorderSwitcherSnapshotView
{
  if (self->_switcherSnapshotView) {
    -[NTKFaceView sendSubviewToBack:](self, "sendSubviewToBack:");
  }
}

- (void)enumerateQuadViewsWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_allSubQuadViews;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(NTKFaceView *)self setNeedsRender];
  BOOL v7 = self->_needsImageQueueDiscardOnRender || v4;
  self->_needsImageQueueDiscardOnRender = v7;
  [(NTKFaceView *)self _renderSynchronouslyIfNeededInGroup:v6];

  uint64_t v8 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    long long v11 = (void *)v10;
    long long v12 = @"NO";
    if (v4) {
      long long v12 = @"YES";
    }
    int v13 = 138412546;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    double v16 = v12;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_INFO, "Render Synchronously - FaceView: %@, DiscardContents: %@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__NTKFaceView__renderSynchronouslyWithImageQueueDiscard_inGroup___block_invoke;
  v8[3] = &unk_1E62C2580;
  BOOL v10 = a3;
  id v9 = v6;
  id v7 = v6;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v8];
}

void __65__NTKFaceView__renderSynchronouslyWithImageQueueDiscard_inGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  BOOL v4 = [v7 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v7 display];
    [v6 renderSynchronouslyWithImageQueueDiscard:*(unsigned __int8 *)(a1 + 40) inGroup:*(void *)(a1 + 32)];
  }
}

- (BOOL)_renderSynchronouslyIfNeededInGroup:(id)a3
{
  id v4 = a3;
  if (self->_needsRender)
  {
    id v5 = [(NTKFaceView *)self window];

    if (v5)
    {
      [(NTKFaceView *)self _renderSynchronouslyWithImageQueueDiscard:self->_needsImageQueueDiscardOnRender inGroup:v4];
      self->_needsImageQueueDiscardOnRender = 0;
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  self->_needsRender = 0;

  return (char)v5;
}

- (void)quadViewWillEnterSubtree:(id)a3
{
}

- (void)quadViewWillLeaveSubtree:(id)a3
{
}

- (id)_blurSourceImage
{
  return 0;
}

- (BOOL)_wantsStatusBarHidden
{
  return 0;
}

- (BOOL)_wantsStatusBarIconShadow
{
  return 0;
}

- (void)_prepareForStatusChange:(BOOL)a3
{
  [(NTKExtraLargeTimeView *)self->_sensitiveUIShieldView setStatusBarVisible:a3 animated:self->_dataMode == 1];
}

- (double)_verticalPaddingForStatusBar
{
  uint64_t v2 = [(CLKDevice *)self->_device sizeClass];
  double result = 2.0;
  if (!v2) {
    return 2.5;
  }
  return result;
}

- (double)_horizontalPaddingForStatusBar
{
  return 0.0;
}

- (id)_overrideColorForStatusBar
{
  return 0;
}

- (BOOL)_supportsTimeScrubbing
{
  return 0;
}

- (BOOL)_canStartTimeScrubbing
{
  return 1;
}

- (BOOL)_wantsOpportunisticLiveFaceLoading
{
  return 0;
}

- (void)_becameActiveFace
{
  if ([(NTKFaceView *)self canBecomeFirstResponder])
  {
    [(NTKFaceView *)self becomeFirstResponder];
  }
}

- (void)prepareToZoom
{
  BOOL v3 = [(NTKFaceView *)self delegate];
  [v3 faceViewWantsUnadornedSnapshotViewRemoved];

  self->_zooming = 1;

  [(NTKFaceView *)self _prepareToZoom];
}

- (void)cleanupAfterZoom
{
  self->_zooming = 0;
  [(NTKFaceView *)self _cleanupAfterZoom];
}

- (BOOL)_applyRoundedCornerOverlay
{
  return 0;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = (NSDate *)a3;
  id v7 = _NTKLoggingObjectForDomain(40, (uint64_t)"NTKLoggingDomainTritium");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(NSDate *)self->_overrideDate description];
    uint64_t v9 = [v8 UTF8String];
    id v10 = [(NSDate *)v6 description];
    int v13 = 136315650;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    uint64_t v16 = [v10 UTF8String];
    __int16 v17 = 1024;
    int v18 = 1;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "setOverrideDate: %s -> %s, shouldApply: %{BOOL}d", (uint8_t *)&v13, 0x1Cu);
  }
  overrideDate = self->_overrideDate;
  self->_overrideDate = v6;
  long long v12 = v6;

  [(NTKTimeView *)self->_timeView setOverrideDate:v12 duration:a4];
  [(NTKExtraLargeTimeView *)self->_sensitiveUIShieldView setOverrideDate:v12 duration:a4];
}

- (void)setTimeOffset:(double)a3
{
}

- (void)setTimeView:(id)a3
{
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(NTKFaceView *)self complicationFactory];
  long long v11 = (void *)[v10 newLegacyViewForComplication:v9 family:a4 slot:v8];

  return v11;
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NTKFaceView *)self complicationFactory];
  if (v7
    && (id v8 = (void *)v7,
        [(NTKFaceView *)self complicationFactory],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    long long v11 = [(NTKFaceView *)self complicationFactory];
    int64_t v12 = [v11 legacyLayoutOverrideforComplicationType:a3 slot:v6];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NTKFaceView *)self complicationFactory];
  [v8 configureComplicationView:v7 forSlot:v6];
}

- (unint64_t)_layoutStyleForSlot:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKFaceView *)self complicationFactory];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(NTKFaceView *)self complicationFactory];
    unint64_t v8 = [v7 layoutStyleForSlot:v4];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  id v17 = a8;
  if (a3) {
    *a3 = 0.0;
  }
  if (a4) {
    *a4 = 0.0;
  }
  if (a5) {
    *a5 = 0.0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a6) {
    *a6 = *(CGPoint *)MEMORY[0x1E4F1DAD8];
  }
  uint64_t v14 = [(NTKFaceView *)self complicationFactory];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    uint64_t v16 = [(NTKFaceView *)self complicationFactory];
    [v16 curvedComplicationCircleRadius:a3 centerAngle:a4 maxAngularWidth:a5 circleCenter:a6 interior:a7 forSlot:v17];
  }
}

- (id)_detachedComplicationDisplays
{
  return 0;
}

- (void)_loadLayoutRules
{
  id v2 = [(NTKFaceView *)self complicationFactory];
  [v2 loadLayoutRules];
}

- (void)_bringForegroundViewsToFront
{
  if (self->_foregroundContainerView)
  {
    id v3 = [(NTKFaceView *)self contentView];
    [v3 bringSubviewToFront:self->_foregroundContainerView];
  }
}

- (BOOL)_needsForegroundContainerView
{
  return 0;
}

- (void)_applyFrozen
{
  id v3 = [(NTKFaceView *)self timeView];
  objc_msgSend(v3, "setFrozen:", -[NTKFaceView isFrozen](self, "isFrozen"));

  sensitiveUIShieldView = self->_sensitiveUIShieldView;
  BOOL v5 = [(NTKFaceView *)self isFrozen];

  [(NTKExtraLargeTimeView *)sensitiveUIShieldView setFrozen:v5];
}

+ (id)_prewarmSharedData
{
  return 0;
}

- (id)_accessPrewarmedData
{
  id v2 = +[NTKFaceViewClassPrewarmCache sharedInstance];
  id v3 = [v2 prewarmDataForClass:objc_opt_class()];

  return v3;
}

- (BOOL)_usesCustomZoom
{
  return 0;
}

- (BOOL)_usesSimplifiedZoom
{
  return 0;
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  double v4 = *MEMORY[0x1E4F1DB20];
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)_keylineFrameForCustomEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5
{
  [(NTKFaceView *)self _keylineFrameForCustomEditMode:a3 option:a4 slot:a5 selectedSlot:a5];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return 1;
}

- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 1) {
    return 0;
  }
  else {
    return 272;
  }
}

- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 400.0;
}

- (unint64_t)_detentTypeForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 2;
}

- (id)_editOptionsThatHideEditModes
{
  id v2 = [(NTKFaceView *)self delegate];
  id v3 = [v2 faceViewEditOptionsThatHideEditModes];

  return v3;
}

- (id)allVisibleComplicationsForCurrentConfiguration
{
  id v2 = [(NTKFaceView *)self delegate];
  id v3 = [v2 faceViewAllVisibleComplicationsForCurrentConfiguration];

  return v3;
}

- (id)_editOptionThatHidesAllComplications
{
  id v2 = [(NTKFaceView *)self delegate];
  id v3 = [v2 faceViewEditOptionThatHidesAllComplications];

  return v3;
}

- (id)_complicationSlotsHiddenByEditOption:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKFaceView *)self _editOptionThatHidesAllComplications];
  int v6 = [v5 isEqual:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v8 = WeakRetained;
  if (v6) {
    [WeakRetained faceViewComplicationSlots];
  }
  else {
  id v9 = [WeakRetained faceViewComplicationSlotsHiddenByEditOption:v4];
  }

  return v9;
}

- (id)_complicationSlotsHiddenByCurrentConfiguration
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = __Block_byref_object_copy__53;
  long long v11 = __Block_byref_object_dispose__53;
  id v12 = [MEMORY[0x1E4F1CA80] set];
  editConfigurations = self->_editConfigurations;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__NTKFaceView__complicationSlotsHiddenByCurrentConfiguration__block_invoke;
  v6[3] = &unk_1E62C9860;
  v6[4] = self;
  void v6[5] = &v7;
  [(NSMutableDictionary *)editConfigurations enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __61__NTKFaceView__complicationSlotsHiddenByCurrentConfiguration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__NTKFaceView__complicationSlotsHiddenByCurrentConfiguration__block_invoke_2;
  v6[3] = &unk_1E62C9838;
  id v7 = v4;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v5 = v4;
  [v5 enumerateSlotsWithBlock:v6];
}

void __61__NTKFaceView__complicationSlotsHiddenByCurrentConfiguration__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) editOptionForSlot:a2];
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v5 = [v3 _complicationSlotsHiddenByEditOption:v6];
  [v4 addObjectsFromArray:v5];
}

- (BOOL)complicationIsHiddenAtSlot:(id)a3
{
  return [(NSMutableSet *)self->_hiddenComplicationSlots containsObject:a3];
}

- (void)setComplicationHidden:(BOOL)a3 atSlot:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  if (-[NTKFaceView complicationIsHiddenAtSlot:](self, "complicationIsHiddenAtSlot:") != v4)
  {
    hiddenComplicationSlots = self->_hiddenComplicationSlots;
    if (v4) {
      [(NSMutableSet *)hiddenComplicationSlots addObject:v8];
    }
    else {
      [(NSMutableSet *)hiddenComplicationSlots removeObject:v8];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained faceViewDidHideOrShowComplicationSlot];
  }
}

- (void)_setupComplicationViewsIfHidden
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained faceViewDidHideOrShowComplicationSlot];
}

- (void)_teardownComplicationViewsIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained faceViewDidHideOrShowComplicationSlot];
}

- (void)_setComplicationAlphaForTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 customEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  char v15 = [(NTKFaceView *)self _complicationSlotsHiddenByEditOption:v12];
  int v16 = [v15 containsObject:v14];

  id v17 = [(NTKFaceView *)self _complicationSlotsHiddenByEditOption:v13];
  int v18 = [v17 containsObject:v14];

  if (v16 != v18)
  {
    if (!self->_editing) {
      a3 = 1.0;
    }
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __98__NTKFaceView__setComplicationAlphaForTransitionFraction_fromOption_toOption_customEditMode_slot___block_invoke;
    v19[3] = &unk_1E62C9888;
    objc_copyWeak(v22, &location);
    id v20 = v12;
    v22[1] = (id)a6;
    id v21 = v13;
    v22[2] = *(id *)&a3;
    [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v19];

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
}

void __98__NTKFaceView__setComplicationAlphaForTransitionFraction_fromOption_toOption_customEditMode_slot___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 6);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _alphaForComplicationSlot:v7 inEditOption:a1[4] ofEditMode:a1[7]];
  [WeakRetained _alphaForComplicationSlot:v7 inEditOption:a1[5] ofEditMode:a1[7]];

  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v6, "setAlpha:");
}

- (BOOL)allFontsHidden
{
  id v2 = [(NTKFaceView *)self _editModesDisabledByCurrentConfiguration];
  char v3 = [v2 containsObject:&unk_1F16E4938];

  return v3;
}

- (id)_editModesNotDisabledByCurrentConfiguration
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)MEMORY[0x1E4F1CA80];
  BOOL v4 = [(NSMutableDictionary *)self->_editConfigurations allKeys];
  id v5 = [v3 setWithArray:v4];

  id v6 = [(NTKFaceView *)self _editModesDisabledByCurrentConfiguration];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
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
        [v5 removeObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_editModesDisabledByCurrentConfiguration
{
  char v3 = [(NTKFaceView *)self _editOptionsThatHideEditModes];
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__53;
  long long v15 = __Block_byref_object_dispose__53;
  id v16 = [MEMORY[0x1E4F1CA80] set];
  editConfigurations = self->_editConfigurations;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__NTKFaceView__editModesDisabledByCurrentConfiguration__block_invoke;
  v8[3] = &unk_1E62C98B0;
  void v8[4] = self;
  id v5 = v3;
  id v9 = v5;
  char v10 = &v11;
  [(NSMutableDictionary *)editConfigurations enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __55__NTKFaceView__editModesDisabledByCurrentConfiguration__block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__NTKFaceView__editModesDisabledByCurrentConfiguration__block_invoke_2;
  v10[3] = &unk_1E62C59C0;
  uint64_t v5 = a1[4];
  id v6 = (void *)a1[5];
  id v11 = v4;
  uint64_t v12 = v5;
  id v7 = v6;
  uint64_t v8 = a1[6];
  id v13 = v7;
  uint64_t v14 = v8;
  id v9 = v4;
  [v9 enumerateSlotsWithBlock:v10];
}

void __55__NTKFaceView__editModesDisabledByCurrentConfiguration__block_invoke_2(uint64_t a1, uint64_t a2)
{
  char v3 = [*(id *)(a1 + 32) editOptionForSlot:a2];
  id v4 = *(void **)(*(void *)(a1 + 40) + 592);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__NTKFaceView__editModesDisabledByCurrentConfiguration__block_invoke_3;
  v6[3] = &unk_1E62C98B0;
  id v7 = *(id *)(a1 + 48);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 56);
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __55__NTKFaceView__editModesDisabledByCurrentConfiguration__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  char v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  int v4 = [v3 containsObject:*(void *)(a1 + 40)];

  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v5];
  }
}

- (void)hideAppropriateComplicationsForCurrentConfigurationInEditMode:(int64_t)a3
{
  objc_initWeak(&location, self);
  int v4 = [(NTKFaceView *)self _complicationSlotsHiddenByCurrentConfiguration];
  uint64_t v5 = [v4 count];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [WeakRetained faceViewComplicationSlots];
  self->_everyComplicationHidden = v5 == [v7 count];

  id v8 = (void *)[(NSMutableSet *)self->_hiddenComplicationSlots copy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__NTKFaceView_hideAppropriateComplicationsForCurrentConfigurationInEditMode___block_invoke;
  v16[3] = &unk_1E62C3800;
  v16[4] = self;
  [v8 enumerateObjectsUsingBlock:v16];

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __77__NTKFaceView_hideAppropriateComplicationsForCurrentConfigurationInEditMode___block_invoke_2;
  id v13 = &unk_1E62C98D8;
  objc_copyWeak(&v15, &location);
  id v9 = v4;
  id v14 = v9;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:&v10];
  [(NTKFaceView *)self shiftSelectedComplicationSlotIfHidden];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

uint64_t __77__NTKFaceView_hideAppropriateComplicationsForCurrentConfigurationInEditMode___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setComplicationHidden:0 atSlot:a2];
}

void __77__NTKFaceView_hideAppropriateComplicationsForCurrentConfigurationInEditMode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v7 = [*(id *)(a1 + 32) containsObject:v9];
  double v8 = 1.0;
  if (v7)
  {
    objc_msgSend(WeakRetained, "setComplicationHidden:atSlot:", 1, v9, 1.0);
    double v8 = 0.0;
  }
  [v5 setAlpha:v8];
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKFaceView *)self complicationFactory];
  if (v5
    && (id v6 = (void *)v5,
        [(NTKFaceView *)self complicationFactory],
        int v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    id v9 = [(NTKFaceView *)self complicationFactory];
    int64_t v10 = [v9 complicationPickerStyleForSlot:v4];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (id)_keylineViewForComplicationSlot:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKFaceView *)self complicationFactory];

  if (!v5
    || ([(NTKFaceView *)self complicationFactory],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 keylineViewForComplicationSlot:v4],
        int v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    int v7 = [(NTKFaceView *)self _defaultKeylineViewForComplicationSlot:v4];
  }

  return v7;
}

- (id)_defaultKeylineViewForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([(NTKFaceView *)self _keylineStyleForComplicationSlot:v4])
  {
    NTKFittedCircleKeylineView();
  }
  else
  {
    [(NTKFaceView *)self _keylineCornerRadiusForComplicationSlot:v4];
    NTKKeylineViewWithContinuousCurveCornerRadius(v5);
  id v6 = };

  return v6;
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  return 0;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return 0;
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  return 0.9;
}

- (void)_finalizeForSnapshotting:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v3 = (void (**)(void))a3;
  id v4 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v7 = 138412290;
    char v8 = v6;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "NTKFaceView(%@) _finalizeForSnapshotting just immediatly call completion", (uint8_t *)&v7, 0xCu);
  }
  if (v3) {
    v3[2](v3);
  }
}

- (void)_performPrewarmRoutine:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (CGRect)_faceViewFrameForEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5
{
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (int64_t)_swatchImageContentMode
{
  return 1;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  if (a4 == 10)
  {
    double v7 = -[NTKFaceView _swatchImageForColorOption:size:](self, "_swatchImageForColorOption:size:", a3, a4, a5, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v5);
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

- (BOOL)_allowsEditingSliderEditableColorsForSlot:(id)a3
{
  return 1;
}

- (id)swatchImageForColorOption:(id)a3
{
  return -[NTKFaceView swatchImageForColorOption:size:](self, "swatchImageForColorOption:size:", a3, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (id)_swatchImageForColorOption:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__53;
  double v22 = __Block_byref_object_dispose__53;
  id v23 = 0;
  if ([v7 conformsToProtocol:&unk_1FCDEF740])
  {
    double v8 = [(NTKFaceView *)self faceColorPalette];

    if (v8)
    {
      uint64_t v9 = [(NTKFaceView *)self faceColorPalette];
      int64_t v10 = [v7 pigmentEditOption];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __47__NTKFaceView__swatchImageForColorOption_size___block_invoke;
      v17[3] = &unk_1E62C9900;
      v17[4] = &v18;
      *(double *)&v17[5] = width;
      *(double *)&v17[6] = height;
      [v9 executeWithOption:v10 block:v17];
    }
  }
  uint64_t v11 = (void *)v19[5];
  if (!v11)
  {
    uint64_t v12 = [(NTKFaceView *)self _swatchColorForColorOption:v7];
    uint64_t v13 = objc_msgSend((id)objc_opt_class(), "_swatchImageForColorOption:forDevice:color:size:", v7, self->_device, v12, width, height);
    id v14 = (void *)v19[5];
    v19[5] = v13;

    uint64_t v11 = (void *)v19[5];
  }
  id v15 = v11;
  _Block_object_dispose(&v18, 8);

  return v15;
}

void __47__NTKFaceView__swatchImageForColorOption_size___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "swatchImageForSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)_swatchImageForColorOption:(id)a3 forDevice:(id)a4 color:(id)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!_swatchImageForColorOption_forDevice_color_size__swatches)
  {
    uint64_t v13 = objc_opt_new();
    id v14 = (void *)_swatchImageForColorOption_forDevice_color_size__swatches;
    _swatchImageForColorOption_forDevice_color_size__swatches = v13;
  }
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  [v12 getRed:&v35 green:&v34 blue:&v33 alpha:&v32];
  id v15 = NSString;
  uint64_t v17 = v34;
  uint64_t v16 = v35;
  uint64_t v19 = v32;
  uint64_t v18 = v33;
  v37.double width = width;
  v37.double height = height;
  uint64_t v20 = NSStringFromCGSize(v37);
  id v21 = [v15 stringWithFormat:@"%f-%f-%f-%f-%@", v16, v17, v18, v19, v20];

  double v22 = [(id)_swatchImageForColorOption_forDevice_color_size__swatches objectForKey:v21];
  if (!v22)
  {
    if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", [v10 swatchStyle]);
      double width = v24;
      double height = v25;
    }
    double v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", width, height);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __63__NTKFaceView__swatchImageForColorOption_forDevice_color_size___block_invoke;
    v28[3] = &unk_1E62C30B0;
    id v29 = v12;
    double v30 = width;
    double v31 = height;
    double v22 = [v26 imageWithActions:v28];
    [(id)_swatchImageForColorOption_forDevice_color_size__swatches setObject:v22 forKey:v21];
  }

  return v22;
}

void __63__NTKFaceView__swatchImageForColorOption_forDevice_color_size___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setFill];
  uint64_t v5 = [v4 format];

  double v6 = MEMORY[0x1C1874A70]([v5 bounds]);
  double v8 = v7;

  uint64_t v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 scale];
  double v11 = -1.0 / v10;

  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v6, v8, (*(double *)(a1 + 40) + v11) * 0.5, 0.0, 6.28318531);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v12 fill];
}

- (id)swatchPrimaryColorForColorOption:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__53;
  uint64_t v16 = __Block_byref_object_dispose__53;
  id v17 = 0;
  if ([v4 conformsToProtocol:&unk_1FCDEF740]
    && ([(NTKFaceView *)self faceColorPalette],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    double v6 = [(NTKFaceView *)self faceColorPalette];
    double v7 = [v4 pigmentEditOption];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __48__NTKFaceView_swatchPrimaryColorForColorOption___block_invoke;
    v11[3] = &unk_1E62C07B0;
    v11[4] = &v12;
    [v6 executeWithOption:v7 block:v11];
  }
  else
  {
    uint64_t v8 = [(NTKFaceView *)self _swatchColorForColorOption:v4];
    double v6 = (void *)v13[5];
    v13[5] = v8;
  }

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __48__NTKFaceView_swatchPrimaryColorForColorOption___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 swatchPrimaryColor];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_swatchColorForColorOption:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1FCDEF740]
    && ([(NTKFaceView *)self faceColorPalette],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__53;
    id v21 = __Block_byref_object_dispose__53;
    id v22 = 0;
    double v6 = [(NTKFaceView *)self faceColorPalette];
    double v7 = [v4 pigmentEditOption];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __42__NTKFaceView__swatchColorForColorOption___block_invoke;
    v16[3] = &unk_1E62C07B0;
    v16[4] = &v17;
    [v6 executeWithOption:v7 block:v16];

    id v8 = (id)v18[5];
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      device = self->_device;
      id v10 = v4;
      double v11 = [(NTKFaceView *)self faceColorPalette];
      uint64_t v12 = [v10 pigmentEditOption];

      uint64_t v13 = (void *)[v11 copyWithOption:v12];
      uint64_t v14 = +[NTKFaceColorScheme colorSchemeForDevice:device withFaceColorPalette:v13 units:1];

      id v8 = [v14 foregroundColor];
    }
    else
    {
      id v8 = [MEMORY[0x1E4FB1618] whiteColor];
    }
  }

  return v8;
}

void __42__NTKFaceView__swatchColorForColorOption___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 swatch];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)prepareForStatusChange:(BOOL)a3
{
  self->_statusIconVisible = a3;
  [(NTKFaceView *)self _updateStatusIconVisibility];
}

- (void)_updateStatusIconVisibility
{
  if (self->_timeScrubbing)
  {
    BOOL wasScrubbingAtStartOfTransition = 0;
    if (!self->_editing) {
      goto LABEL_9;
    }
LABEL_6:
    BOOL v3 = 0;
    goto LABEL_7;
  }
  if (self->_transitioningBetweenLiveAndScrubbing)
  {
    BOOL wasScrubbingAtStartOfTransition = self->_wasScrubbingAtStartOfTransition;
    if (self->_editing) {
      goto LABEL_6;
    }
  }
  else
  {
    BOOL wasScrubbingAtStartOfTransition = 1;
    if (self->_editing) {
      goto LABEL_6;
    }
  }
LABEL_9:
  if (self->_dataMode == 3) {
    BOOL wasScrubbingAtStartOfTransition = 0;
  }
  BOOL v3 = self->_statusIconVisible && wasScrubbingAtStartOfTransition;
LABEL_7:
  [(NTKFaceView *)self _prepareForStatusChange:v3];
}

- (BOOL)complicationDisplayWrapperView:(id)a3 shouldStartCustomDataAnimationFromEarlierView:(id)a4 laterView:(id)a5 isForward:(BOOL)a6 animationType:(unint64_t)a7
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [a3 family];
  char isKindOfClass = 1;
  if ((unint64_t)(v11 - 10) >= 3 && v11 != 8)
  {
    if (v11 == 9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
  }

  return isKindOfClass & 1;
}

- (void)complicationDisplayWrapperView:(id)a3 updateCustomDataAnimationFromEarlierView:(id)a4 laterView:(id)a5 isForward:(BOOL)a6 animationType:(unint64_t)a7 animationDuration:(double)a8 animationFraction:(float)a9
{
  BOOL v12 = a6;
  id v18 = a4;
  id v15 = a5;
  switch([a3 family])
  {
    case 8:
      uint64_t v17 = NTKRichComplicationCornerUtilities;
      goto LABEL_4;
    case 10:
    case 11:
    case 12:
      uint64_t v17 = (__objc2_class *)objc_opt_class();
LABEL_4:
      *(float *)&double v16 = a9;
      [(__objc2_class *)v17 updateCustomDataAnimationFromEarlierView:v18 laterView:v15 isForward:v12 animationType:a7 animationDuration:a8 animationFraction:v16];
      break;
    default:
      break;
  }
}

- (double)alphaForDimmedState
{
  return 0.2;
}

- (BOOL)_legacyShouldSwapGraphicCircularComplicationColors
{
  return 0;
}

- (BOOL)_useAlternateComplicationColorForGraphicCircularComplicationInView:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(NTKFaceView *)self _legacyShouldSwapGraphicCircularComplicationColors];
  if (!v5 || !v6) {
    goto LABEL_11;
  }
  while (![v5 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v3 = [v5 superview];

    id v5 = (id)v3;
    if (!v3) {
      goto LABEL_11;
    }
  }
  id v5 = v5;
  uint64_t v7 = [v5 family];
  uint64_t v8 = v7;
  if (v7 == 12 || v7 == 10)
  {
    id v9 = [v5 complicationSlotIdentifier];
    LOBYTE(v3) = [(NTKFaceView *)self _useAlternateComplicationColorForGraphicCircularComplicationInSlot:v9];
  }
  if (v8 != 10 && v8 != 12) {
LABEL_11:
  }
    LOBYTE(v3) = 0;

  return v3 & 1;
}

- (BOOL)_useAlternateComplicationColorForGraphicCircularComplicationInSlot:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKFaceView *)self delegate];
  BOOL v6 = [v5 faceViewComplicationForSlot:v4];

  LOBYTE(self) = [(NTKFaceView *)self _useAlternateComplicationColorForGraphicCircularComplication:v6];
  return (char)self;
}

- (BOOL)_useAlternateComplicationColorForGraphicCircularComplication:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 complicationType];
  BOOL v5 = 0;
  if (v4 > 37)
  {
    if (v4 != 38)
    {
      if (v4 != 48) {
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_10;
      }
      uint64_t v6 = [v3 complication];
      uint64_t v7 = [(id)v6 bundleIdentifier];

      LOBYTE(v6) = [&unk_1F16EA810 containsObject:v7];
      if ((v6 & 1) == 0) {
        goto LABEL_10;
      }
      BOOL v5 = 0;
    }
  }
  else if (v4 != 1 && v4 != 5)
  {
LABEL_10:
    BOOL v5 = 1;
  }

  return v5;
}

- (void)_updateTimeOffset
{
}

- (void)_setTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  self->_editModeTransitionFraction = a3;
  self->_fromEditMode = a4;
  self->_toEditMode = a5;
  [(NTKFaceView *)self _updateComplicationMaxSize];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__NTKFaceView__setTransitionFraction_fromEditMode_toEditMode___block_invoke;
  v9[3] = &unk_1E62C9928;
  void v9[4] = self;
  void v9[5] = a4;
  v9[6] = a5;
  *(double *)&v9[7] = a3;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v9];
  [(NTKFaceView *)self setNeedsLayout];
  [(NTKContainerView *)self->_foregroundContainerView setNeedsLayout];
}

void __62__NTKFaceView__setTransitionFraction_fromEditMode_toEditMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  double v6 = 0.0;
  if (([*(id *)(a1 + 32) complicationIsHiddenAtSlot:v10] & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 32) optionForCustomEditMode:*(void *)(a1 + 40) slot:v10];
    uint64_t v8 = [*(id *)(a1 + 32) optionForCustomEditMode:*(void *)(a1 + 48) slot:v10];
    [*(id *)(a1 + 32) _alphaForComplicationSlot:v10 inEditOption:v7 ofEditMode:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _alphaForComplicationSlot:v10 inEditOption:v8 ofEditMode:*(void *)(a1 + 48)];
    CLKInterpolateBetweenFloatsClipped();
    double v6 = v9;
  }
  [v5 setAlpha:v6];
}

- (double)_alphaForComplicationSlot:(id)a3 inEditOption:(id)a4 ofEditMode:(int64_t)a5
{
  id v8 = a3;
  double v9 = [(NTKFaceView *)self _complicationSlotsHiddenByEditOption:a4];
  char v10 = [v9 containsObject:v8];

  double v11 = 0.0;
  if ((v10 & 1) == 0)
  {
    if ([(NTKFaceView *)self _fadesComplicationSlot:v8 inEditMode:a5]) {
      double v11 = 0.2;
    }
    else {
      double v11 = 1.0;
    }
  }

  return v11;
}

- (CGRect)_frameForComplicationDisplayWrapper:(id)a3 inSlot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 preferredSize];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [v7 layoutOverride];

  if (self->_editing)
  {
    uint64_t v13 = [(NTKFaceView *)self _layoutRuleForComplicationSlot:v6 withOverride:v12 inEditMode:self->_fromEditMode];
    uint64_t v14 = [(NTKFaceView *)self _layoutRuleForComplicationSlot:v6 withOverride:v12 inEditMode:self->_toEditMode];
    char v15 = [v13 isEqual:v14];
    objc_msgSend(v13, "calculateLayoutFrameForBoundsSize:", v9, v11);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    if ((v15 & 1) == 0)
    {
      objc_msgSend(v14, "calculateLayoutFrameForBoundsSize:", v9, v11);
      CLKInterpolateBetweenRects();
      double v17 = v24;
      double v19 = v25;
      double v21 = v26;
      double v23 = v27;
    }
  }
  else
  {
    uint64_t v13 = [(NTKFaceView *)self layoutRuleForComplicationSlot:v6 inState:0 layoutOverride:v12];
    objc_msgSend(v13, "calculateLayoutFrameForBoundsSize:", v9, v11);
    double v17 = v28;
    double v19 = v29;
    double v21 = v30;
    double v23 = v31;
  }

  double v32 = v17;
  double v33 = v19;
  double v34 = v21;
  double v35 = v23;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (CGAffineTransform)_displayEditingTransformForComplicationSlot:(SEL)a3 displayWrapper:(id)a4
{
  id v8 = a4;
  uint64_t v9 = MEMORY[0x1E4F1DAB8];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v9 + 32);
  uint64_t v11 = [a5 layoutOverride];
  if (self->_editing)
  {
    uint64_t v12 = [(NTKFaceView *)self _layoutRuleForComplicationSlot:v8 withOverride:v11 inEditMode:self->_fromEditMode];
    uint64_t v13 = [(NTKFaceView *)self _layoutRuleForComplicationSlot:v8 withOverride:v11 inEditMode:self->_toEditMode];
    if ([v12 isEqual:v13])
    {
      if (v13)
      {
        [v13 editingTransform];
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v16 = 0u;
      }
      goto LABEL_15;
    }
    if (v12)
    {
      [v12 editingTransform];
      if (!v13)
      {
LABEL_14:
        CLKInterpolateBetweenTransform();
LABEL_15:
        *(_OWORD *)&retstr->a = v16;
        *(_OWORD *)&retstr->c = v17;
        *(_OWORD *)&retstr->tCGFloat x = v18;

        goto LABEL_16;
      }
    }
    else if (!v13)
    {
      goto LABEL_14;
    }
    [v13 editingTransform];
    goto LABEL_14;
  }
  uint64_t v14 = [(NTKFaceView *)self layoutRuleForComplicationSlot:v8 inState:0 layoutOverride:v11];
  uint64_t v12 = v14;
  if (v14)
  {
    [v14 editingTransform];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
  }
  *(_OWORD *)&retstr->a = v16;
  *(_OWORD *)&retstr->c = v17;
  *(_OWORD *)&retstr->tCGFloat x = v18;
LABEL_16:

  return result;
}

- (CGAffineTransform)_displayContentTransformForComplicationSlot:(SEL)a3 displayWrapper:(id)a4
{
  id v8 = a4;
  uint64_t v9 = MEMORY[0x1E4F1DAB8];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v9 + 32);
  uint64_t v11 = [a5 layoutOverride];
  if (self->_editing)
  {
    uint64_t v12 = [(NTKFaceView *)self _layoutRuleForComplicationSlot:v8 withOverride:v11 inEditMode:self->_fromEditMode];
    uint64_t v13 = [(NTKFaceView *)self _layoutRuleForComplicationSlot:v8 withOverride:v11 inEditMode:self->_toEditMode];
    if ([v12 isEqual:v13])
    {
      if (v13)
      {
        [v13 contentTransform];
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v16 = 0u;
      }
      goto LABEL_15;
    }
    if (v12)
    {
      [v12 contentTransform];
      if (!v13)
      {
LABEL_14:
        CLKInterpolateBetweenTransform();
LABEL_15:
        *(_OWORD *)&retstr->a = v16;
        *(_OWORD *)&retstr->c = v17;
        *(_OWORD *)&retstr->tCGFloat x = v18;

        goto LABEL_16;
      }
    }
    else if (!v13)
    {
      goto LABEL_14;
    }
    [v13 contentTransform];
    goto LABEL_14;
  }
  uint64_t v14 = [(NTKFaceView *)self layoutRuleForComplicationSlot:v8 inState:0 layoutOverride:v11];
  uint64_t v12 = v14;
  if (v14)
  {
    [v14 contentTransform];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
  }
  *(_OWORD *)&retstr->a = v16;
  *(_OWORD *)&retstr->c = v17;
  *(_OWORD *)&retstr->tCGFloat x = v18;
LABEL_16:

  return result;
}

- (void)_updateComplicationMaxSize
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__NTKFaceView__updateComplicationMaxSize__block_invoke;
  v3[3] = &unk_1E62C9950;
  objc_copyWeak(&v4, &location);
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __41__NTKFaceView__updateComplicationMaxSize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _updateMaxSizeForDisplayWrapper:v5 slot:v6];
}

- (void)_updateMaxSizeForDisplayWrapper:(id)a3 slot:(id)a4
{
  id v6 = a4;
  id v11 = a3;
  -[NTKFaceView _maxSizeForComplicationSlot:layoutOverride:](self, "_maxSizeForComplicationSlot:layoutOverride:", v6, [v11 layoutOverride]);
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(v11, "setMaxSize:", v8, v10);
}

- (CGSize)_maxSizeForComplicationSlot:(id)a3 layoutOverride:(int64_t)a4
{
  if (self->_editing)
  {
    int64_t fromEditMode = self->_fromEditMode;
    id v7 = a3;
    double v8 = [(NTKFaceView *)self _layoutRuleForComplicationSlot:v7 withOverride:a4 inEditMode:fromEditMode];
    double v9 = [(NTKFaceView *)self _layoutRuleForComplicationSlot:v7 withOverride:a4 inEditMode:self->_toEditMode];

    LOBYTE(v7) = [v8 isEqual:v9];
    [v8 maximumSize];
    double v11 = v10;
    double v13 = v12;
    if ((v7 & 1) == 0)
    {
      [v9 maximumSize];
      CLKInterpolateBetweenSizes();
      double v11 = v14;
      double v13 = v15;
    }
  }
  else
  {
    id v16 = a3;
    double v8 = [(NTKFaceView *)self layoutRuleForComplicationSlot:v16 inState:0 layoutOverride:a4];

    [v8 maximumSize];
    double v11 = v17;
    double v13 = v18;
  }

  double v19 = v11;
  double v20 = v13;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (void)_getKeylineFrame:(CGRect *)a3 padding:(UIEdgeInsets *)a4 forComplicationSlot:(id)a5 selected:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v38 = v10;
  if (v6)
  {
    double v11 = [(NSMutableDictionary *)self->_complicationLayouts objectForKey:v10];
    double v12 = [v11 defaultLayoutRuleForState:3];

    [v12 referenceFrame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [v12 keylinePadding];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
  }
  else
  {
    double v12 = [(NSMutableDictionary *)self->_complicationDisplayWrappers objectForKey:v10];
    double v29 = -[NTKFaceView layoutRuleForComplicationSlot:inState:layoutOverride:](self, "layoutRuleForComplicationSlot:inState:layoutOverride:", v38, 2, [v12 layoutOverride]);
    if ([(NTKFaceView *)self _layoutStyleForSlot:v38] == 1
      || [(NTKFaceView *)self _layoutStyleForSlot:v38] == 2)
    {
      [v29 referenceFrame];
    }
    else
    {
      [v12 preferredSize];
      objc_msgSend(v29, "calculateLayoutFrameForBoundsSize:");
    }
    double v14 = v30;
    double v16 = v31;
    double v18 = v32;
    double v20 = v33;
    [v29 keylinePadding];
    double v22 = v34;
    double v24 = v35;
    double v26 = v36;
    double v28 = v37;
  }
  if (a3)
  {
    a3->origin.CGFloat x = v14 - v24;
    a3->origin.CGFloat y = v16 - v22;
    a3->size.double width = v18 - (-v28 - v24);
    a3->size.double height = v20 - (-v26 - v22);
  }
  if (a4)
  {
    a4->top = v22;
    a4->left = v24;
    a4->bottom = v26;
    a4->right = v28;
  }
}

- (id)_layoutRuleForComplicationSlot:(id)a3 withOverride:(int64_t)a4 inEditMode:(int64_t)a5
{
  id v8 = a3;
  double v9 = v8;
  if (a5)
  {
    if (a5 == 1)
    {
      if ([v8 isEqual:self->_selectedComplicationSlot]) {
        a5 = 3;
      }
      else {
        a5 = 2;
      }
    }
    else
    {
      a5 = 1;
    }
  }
  id v10 = [(NTKFaceView *)self layoutRuleForComplicationSlot:v9 inState:a5 layoutOverride:a4];

  return v10;
}

- (void)_layoutComplicationViews
{
  kdebug_trace();
  objc_initWeak(&location, self);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  id v5 = __39__NTKFaceView__layoutComplicationViews__block_invoke;
  BOOL v6 = &unk_1E62C9950;
  objc_copyWeak(&v7, &location);
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:&v3];
  [(NTKFaceView *)self _didLayoutComplicationViews];
  kdebug_trace();
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __39__NTKFaceView__layoutComplicationViews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _layoutComplicationViewWithWrapper:v5 forSlot:v6];
}

- (void)_layoutComplicationViewForSlot:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKFaceView *)self normalComplicationDisplayWrapperForSlot:v4];
  [(NTKFaceView *)self _layoutComplicationViewWithWrapper:v5 forSlot:v4];
}

- (void)_layoutComplicationViewWithWrapper:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NTKFaceView *)self _frameForComplicationDisplayWrapper:v6 inSlot:v7];
  objc_msgSend(v6, "ntk_setBoundsAndPositionFromFrame:");
  if (self->_editing)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    [(NTKFaceView *)self _displayEditingTransformForComplicationSlot:v7 displayWrapper:v6];
    v12[0] = v13;
    v12[1] = v14;
    v12[2] = v15;
    id v8 = v12;
  }
  else
  {
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v13 = *MEMORY[0x1E4F1DAB8];
    long long v14 = v9;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    id v8 = &v13;
  }
  [v6 setEditingTransform:v8];
  [(NTKFaceView *)self _displayContentTransformForComplicationSlot:v7 displayWrapper:v6];
  [v6 setContentTransform:&v11];
  id v10 = [(NTKFaceView *)self _complicationContainerViewForSlot:v7];
  [v10 bringSubviewToFront:v6];
}

- (id)_complicationContainerViewForSlot:(id)a3
{
  return self->_complicationContainerView;
}

- (BOOL)_wantsDimWithDesaturationFilterDuringComplicationEditing
{
  return 0;
}

- (id)_additonalViewsToApplyDesaturationDuringComplicationEditing
{
  return 0;
}

- (void)startScrubbingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  analyticsTimeTravelSessionStart = self->_analyticsTimeTravelSessionStart;
  self->_analyticsTimeTravelSessionStart = v5;

  [(NTKFaceView *)self startScrubbingAnimated:v3 withCompletion:0];
}

- (void)startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(void))a4;
  if ([(NTKFaceView *)self _supportsTimeScrubbing] && !self->_timeScrubbing)
  {
    self->_transitioningBetweenLiveAndScrubbing = 1;
    self->_BOOL wasScrubbingAtStartOfTransition = 0;
    id v6 = [(NTKFaceView *)self delegate];
    [v6 faceViewWillEnterTimeTravel];

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__NTKFaceView_startScrubbingAnimated_withCompletion___block_invoke;
    v7[3] = &unk_1E62C3398;
    objc_copyWeak(&v9, &location);
    id v8 = v5;
    [(NTKFaceView *)self _startScrubbingAnimated:1 withCompletion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else if (v5)
  {
    v5[2](v5);
  }
}

void __53__NTKFaceView_startScrubbingAnimated_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 674) = 1;
    *((unsigned char *)WeakRetained + 433) = 0;
    uint64_t v4 = +[NTKDate faceDate];
    id v5 = v7[56];
    v7[56] = (id)v4;

    objc_storeStrong(v7 + 55, v7[56]);
    BOOL v3 = v7;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, id *))(v6 + 16))(v6, v3);
    BOOL v3 = v7;
  }
}

- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)endScrubbingAnimated:(BOOL)a3
{
  BOOL v12 = a3;
  v16[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:self->_analyticsTimeTravelSessionStart];
  double v6 = v5;
  id v7 = NTKFaceStyleDescription([(NTKFaceView *)self faceStyle]);
  v15[0] = @"eventName";
  v15[1] = @"face";
  v16[0] = @"sessionduration";
  v16[1] = v7;
  v15[2] = @"value";
  id v8 = [NSNumber numberWithDouble:v6];
  v16[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  AnalyticsSendEvent();

  v13[0] = @"eventName";
  v13[1] = @"face";
  v14[0] = @"maximumoffset";
  v14[1] = v7;
  v13[2] = @"value";
  id v10 = [NSNumber numberWithDouble:self->_analyticsTimeTravelMaximumOffset];
  v14[2] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  AnalyticsSendEvent();

  self->_analyticsTimeTravelMaximumOffset = 0.0;
  [(NTKFaceView *)self endScrubbingAnimated:v12 withCompletion:0];
}

- (void)endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->_transitioningBetweenLiveAndScrubbing)
  {
    if (v6) {
      (*((void (**)(id))v6 + 2))(v6);
    }
  }
  else
  {
    [(NTKFaceView *)self _resetSequencerBoundaries];
    scrubDate = self->_scrubDate;
    self->_scrubDate = 0;

    self->_transitioningBetweenLiveAndScrubbing = 1;
    self->_timeScrubbing = 0;
    self->_BOOL wasScrubbingAtStartOfTransition = 1;
    id v9 = [(NTKFaceView *)self delegate];
    [v9 faceViewWillExitTimeTravel];

    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __51__NTKFaceView_endScrubbingAnimated_withCompletion___block_invoke;
    v11[3] = &unk_1E62C3398;
    objc_copyWeak(&v13, &location);
    id v12 = v7;
    [(NTKFaceView *)self _endScrubbingAnimated:v4 withCompletion:v11];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained faceViewDidScrubToDate:0 forced:1];

    [(NTKFaceView *)self applyRubberBandingFraction:0 forCustomEditMode:0 slot:0.0];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __51__NTKFaceView_endScrubbingAnimated_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 433) = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    double v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    BOOL v3 = v5;
  }
}

- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)_enableCrown
{
  self->_canHandleHardwareEvents = 1;
}

- (void)_disableCrown
{
  self->_canHandleHardwareEvents = 0;
}

- (void)enableCrownEventReception
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int64_t dataMode = self->_dataMode;
  p_super = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  BOOL v5 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (dataMode == 1)
  {
    if (v5)
    {
      int v7 = 138412290;
      id v8 = self;
      _os_log_impl(&dword_1BC5A9000, p_super, OS_LOG_TYPE_DEFAULT, "[CROWN] Face %@ taking crown assertion", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [(NTKCrownAssertionHandler *)self->_crownHandler takeCrownAssertionForToken:self->_crownAssertionToken];
    p_super = &self->_crownAssertionToken->super;
    self->_crownAssertionToken = v6;
  }
  else if (v5)
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl(&dword_1BC5A9000, p_super, OS_LOG_TYPE_DEFAULT, "[CROWN] Face %@ not taking crown assertion in background", (uint8_t *)&v7, 0xCu);
  }
}

- (void)disableCrownEventReception
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_crownAssertionToken)
  {
    BOOL v3 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = self;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Face %@ releasing crown assertion", (uint8_t *)&v5, 0xCu);
    }

    [(NTKCrownAssertionHandler *)self->_crownHandler relinquishCrownAssertionForToken:self->_crownAssertionToken];
    crownAssertionToken = self->_crownAssertionToken;
    self->_crownAssertionToken = 0;
  }
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  return 0;
}

- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4
{
  return 0;
}

- (id)_allViewsWithComplicationEditingDesaturationFilter
{
  if ([(NTKFaceView *)self _wantsDimWithDesaturationFilterDuringComplicationEditing])
  {
    BOOL v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = [(NTKFaceView *)self timeView];

    if (v4)
    {
      int v5 = [(NTKFaceView *)self timeView];
      [v3 addObject:v5];
    }
    complicationDisplayWrappers = self->_complicationDisplayWrappers;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __65__NTKFaceView__allViewsWithComplicationEditingDesaturationFilter__block_invoke;
    v11[3] = &unk_1E62C9118;
    id v7 = v3;
    id v12 = v7;
    [(NSMutableDictionary *)complicationDisplayWrappers enumerateKeysAndObjectsUsingBlock:v11];
    id v8 = [(NTKFaceView *)self _additonalViewsToApplyDesaturationDuringComplicationEditing];
    if (v8) {
      [v7 addObjectsFromArray:v8];
    }
    id v9 = v7;
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

uint64_t __65__NTKFaceView__allViewsWithComplicationEditingDesaturationFilter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)_addSaturationFilterToViews:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v22 = *(void *)v28;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v27 + 1) + 8 * v5);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v7 = [v6 layer];
        id v8 = [v7 filters];

        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v32 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v24;
LABEL_8:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v24 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = [*(id *)(*((void *)&v23 + 1) + 8 * v12) name];
            char v14 = [v13 isEqualToString:@"EditingSaturationFilter"];

            if (v14) {
              break;
            }
            if (v10 == ++v12)
            {
              uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v32 count:16];
              if (v10) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          long long v15 = [v6 layer];
          double v16 = [v15 filters];

          if (v16)
          {
            double v17 = [v6 layer];
            double v18 = [v17 filters];
            id v8 = (void *)[v18 mutableCopy];

            [v8 addObject:self->_complicationEditingSaturationFilter];
          }
          else
          {
            complicationEditingSaturationFilter = self->_complicationEditingSaturationFilter;
            id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&complicationEditingSaturationFilter count:1];
          }
          double v19 = [v6 layer];
          [v19 setFilters:v8];
        }
        ++v5;
      }
      while (v5 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v4);
  }
}

- (void)_updateSaturationForComplicationEditing
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NTKFaceView *)self _allViewsWithComplicationEditingDesaturationFilter];
  [(NTKFaceView *)self _addSaturationFilterToViews:v3];
  uint64_t v4 = [NSString stringWithFormat:@"filters.%@.inputAmount", @"EditingSaturationFilter"];
  uint64_t v5 = [(NTKFaceView *)self selectedComplicationSlot];
  double v16 = (void *)v5;
  if (v5)
  {
    id v6 = [(NTKFaceView *)self normalComplicationDisplayWrapperForSlot:v5];
  }
  else
  {
    id v6 = 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (v12 == v6)
        {
          id v13 = [v6 layer];
          [v13 setValue:&unk_1F16E86B0 forKeyPath:v4];
        }
        else
        {
          id v13 = [v12 layer];
          *(float *)&double v14 = self->_complicationEditingSaturationValue;
          long long v15 = [NSNumber numberWithFloat:v14];
          [v13 setValue:v15 forKeyPath:v4];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)_setComplicationEditingSaturationValue:(float)a3
{
  self->_complicationEditingSaturationValue = a3;
  [(NTKFaceView *)self _updateSaturationForComplicationEditing];
}

+ (int64_t)numberOfDetailModesForFaceStyle:(int64_t)a3
{
  return 0;
}

- (id)_additionalPrelaunchApplicationIdentifiers
{
  return 0;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v6 = a3;
  id v7 = [(NTKFaceView *)self device];
  char v8 = NTKShowGossamerUI(v7);

  if ((v8 & 1) == 0)
  {
    if ([(NTKFaceView *)self _useAlternateComplicationColorForGraphicCircularComplicationInView:v6])
    {
      [(NTKFaceView *)self complicationColor];
      objc_claimAutoreleasedReturnValue();
      [(NTKFaceView *)self alternateComplicationColor];
      objc_claimAutoreleasedReturnValue();
      CLKUIMonochromeFiltersForStyle();
    }
  }
  [(NTKFaceView *)self alternateComplicationColor];
  objc_claimAutoreleasedReturnValue();
  [(NTKFaceView *)self complicationColor];
  objc_claimAutoreleasedReturnValue();
  [(NTKFaceView *)self complicationBackgroundColor];
  objc_claimAutoreleasedReturnValue();
  CLKUIMonochromeFiltersForStyleWithTintedBackground();
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(NTKFaceView *)self device];
  char v7 = NTKShowGossamerUI(v6);

  if ((v7 & 1) == 0)
  {
    if ([(NTKFaceView *)self _useAlternateComplicationColorForGraphicCircularComplicationInView:v5])
    {
      [(NTKFaceView *)self interpolatedComplicationColor];
      objc_claimAutoreleasedReturnValue();
      [(NTKFaceView *)self alternateComplicationColor];
      objc_claimAutoreleasedReturnValue();
      CLKUIMonochromeFiltersForStyle();
    }
  }
  [(NTKFaceView *)self alternateComplicationColor];
  objc_claimAutoreleasedReturnValue();
  [(NTKFaceView *)self interpolatedComplicationColor];
  objc_claimAutoreleasedReturnValue();
  [(NTKFaceView *)self complicationBackgroundColor];
  objc_claimAutoreleasedReturnValue();
  CLKUIMonochromeFiltersForStyleWithTintedBackground();
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = [(NTKFaceView *)self device];
  char v8 = NTKShowGossamerUI(v7);

  if ((v8 & 1) != 0
    || ![(NTKFaceView *)self _useAlternateComplicationColorForGraphicCircularComplicationInView:v6])
  {
    if (v4) {
      goto LABEL_4;
    }
  }
  else if (!v4)
  {
LABEL_4:
    uint64_t v9 = [(NTKFaceView *)self complicationColor];
    goto LABEL_7;
  }
  uint64_t v9 = [(NTKFaceView *)self alternateComplicationColor];
LABEL_7:
  uint64_t v10 = (void *)v9;

  return v10;
}

- (id)interpolatedColorForView:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKFaceView *)self device];
  char v6 = NTKShowGossamerUI(v5);

  if ((v6 & 1) != 0
    || ![(NTKFaceView *)self _useAlternateComplicationColorForGraphicCircularComplicationInView:v4])
  {
    uint64_t v7 = [(NTKFaceView *)self interpolatedComplicationColor];
  }
  else
  {
    uint64_t v7 = [(NTKFaceView *)self alternateComplicationColor];
  }
  char v8 = (void *)v7;

  return v8;
}

- (id)backgroundColorForView:(id)a3
{
  return 0;
}

- (void)changeComplicationsAlpha:(double)a3
{
  id v4 = [(NTKFaceView *)self complicationContainerView];
  [v4 setAlpha:a3];
}

- (id)createFaceColorPalette
{
  id v2 = [(NTKFaceView *)self delegate];
  uint64_t v3 = [v2 faceViewWantsFaceColorPalette];

  return v3;
}

+ (id)pigmentFromOption:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1FCDEF740])
  {
    id v4 = [v3 pigmentEditOption];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_updateFaceColorPaletteWithOption:(id)a3 mode:(int64_t)a4
{
  id v9 = a3;
  char v6 = [(NTKFaceView *)self faceColorPalette];

  if (a4 == 10 && v6)
  {
    uint64_t v7 = [(id)objc_opt_class() pigmentFromOption:v9];
    [(NTKFaceColorPalette *)self->_faceColorPalette setPigmentEditOption:v7];
    interpolatedColorPalette = self->_interpolatedColorPalette;
    if (interpolatedColorPalette)
    {
      [(NTKInterpolatedColorPalette *)interpolatedColorPalette setFromPalette:self->_faceColorPalette];
      [(NTKInterpolatedColorPalette *)self->_interpolatedColorPalette setToPalette:self->_faceColorPalette];
    }
  }
}

- (NTKFaceColorPalette)faceColorPalette
{
  faceColorPalette = self->_faceColorPalette;
  if (!faceColorPalette)
  {
    id v4 = [(NTKFaceView *)self createFaceColorPalette];
    id v5 = self->_faceColorPalette;
    self->_faceColorPalette = v4;

    if (self->_faceColorPalette)
    {
      char v6 = [(NTKFaceView *)self optionForCustomEditMode:10 slot:0];
      if (v6)
      {
        uint64_t v7 = [(id)objc_opt_class() pigmentFromOption:v6];
        [(NTKFaceColorPalette *)self->_faceColorPalette setPigmentEditOption:v7];
      }
      faceColorPalette = self->_faceColorPalette;
    }
    else
    {
      faceColorPalette = 0;
    }
  }

  return faceColorPalette;
}

- (NTKInterpolatedColorPalette)interpolatedColorPalette
{
  if (!self->_interpolatedColorPalette)
  {
    id v3 = [(NTKFaceView *)self faceColorPalette];

    if (v3)
    {
      id v4 = [NTKInterpolatedColorPalette alloc];
      id v5 = [(NTKFaceView *)self faceColorPalette];
      char v6 = [(NTKInterpolatedColorPalette *)v4 initWithColorPalette:v5];
      interpolatedColorPalette = self->_interpolatedColorPalette;
      self->_interpolatedColorPalette = v6;
    }
  }
  char v8 = self->_interpolatedColorPalette;

  return v8;
}

- (BOOL)allowsHomeScreenTransition
{
  return 1;
}

- (UIView)foregroundContainerView
{
  return &self->_foregroundContainerView->super;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)complicationContainerView
{
  return self->_complicationContainerView;
}

- (void)setComplicationContainerView:(id)a3
{
}

- (UIView)rootContainerView
{
  return self->_rootContainerView;
}

- (void)setRootContainerView:(id)a3
{
}

- (UIColor)alternateComplicationColor
{
  return self->_alternateComplicationColor;
}

- (void)setAlternateComplicationColor:(id)a3
{
}

- (UIColor)complicationColor
{
  return self->_complicationColor;
}

- (void)setComplicationColor:(id)a3
{
}

- (UIColor)interpolatedComplicationColor
{
  return self->_interpolatedComplicationColor;
}

- (void)setInterpolatedComplicationColor:(id)a3
{
}

- (UIColor)complicationBackgroundColor
{
  return self->_complicationBackgroundColor;
}

- (void)setComplicationBackgroundColor:(id)a3
{
}

- (int64_t)faceStyle
{
  return self->_faceStyle;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (BOOL)shouldShowUnsnapshotableContent
{
  return self->_shouldShowUnsnapshotableContent;
}

- (int64_t)dataMode
{
  return self->_dataMode;
}

- (BOOL)showsCanonicalContent
{
  return self->_showsCanonicalContent;
}

- (BOOL)showContentForUnadornedSnapshot
{
  return self->_showContentForUnadornedSnapshot;
}

- (BOOL)showsLockedUI
{
  return self->_showsLockedUI;
}

- (NTKFaceViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKFaceViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)unadornedSnapshotView
{
  return self->_unadornedSnapshotView;
}

- (void)setUnadornedSnapshotView:(id)a3
{
}

- (UIImageView)switcherSnapshotView
{
  return self->_switcherSnapshotView;
}

- (BOOL)zooming
{
  return self->_zooming;
}

- (NTKFaceViewComplicationFactory)complicationFactory
{
  return self->_complicationFactory;
}

- (void)setComplicationFactory:(id)a3
{
}

- (NSString)resourceDirectory
{
  return self->_resourceDirectory;
}

- (BOOL)isEveryComplicationHidden
{
  return self->_everyComplicationHidden;
}

- (void)setEveryComplicationHidden:(BOOL)a3
{
  self->_everyComplicationHidden = a3;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (BOOL)isSlow
{
  return self->_slow;
}

- (BOOL)orbing
{
  return self->_orbing;
}

- (BOOL)complicationsShowEditingContent
{
  return self->_complicationsShowEditingContent;
}

- (NSMutableDictionary)editConfigurations
{
  return self->_editConfigurations;
}

- (void)setEditConfigurations:(id)a3
{
}

- (NSString)selectedComplicationSlot
{
  return self->_selectedComplicationSlot;
}

- (BOOL)timeScrubbing
{
  return self->_timeScrubbing;
}

- (int64_t)detailMode
{
  return self->_detailMode;
}

- (void)setDetailMode:(int64_t)a3
{
  self->_detailMode = a3;
}

- (NTKTimeView)timeView
{
  return self->_timeView;
}

- (BOOL)editing
{
  return self->_editing;
}

- (int64_t)fromEditMode
{
  return self->_fromEditMode;
}

- (int64_t)toEditMode
{
  return self->_toEditMode;
}

- (double)editModeTransitionFraction
{
  return self->_editModeTransitionFraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_selectedComplicationSlot, 0);
  objc_storeStrong((id *)&self->_resourceDirectory, 0);
  objc_storeStrong((id *)&self->_complicationFactory, 0);
  objc_storeStrong((id *)&self->_switcherSnapshotView, 0);
  objc_storeStrong((id *)&self->_unadornedSnapshotView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_complicationBackgroundColor, 0);
  objc_storeStrong((id *)&self->_interpolatedComplicationColor, 0);
  objc_storeStrong((id *)&self->_complicationColor, 0);
  objc_storeStrong((id *)&self->_alternateComplicationColor, 0);
  objc_storeStrong((id *)&self->_rootContainerView, 0);
  objc_storeStrong((id *)&self->_complicationContainerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_cornerOverlayView, 0);
  objc_storeStrong((id *)&self->_complicationEditingSaturationFilter, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_foregroundContainerView, 0);
  objc_storeStrong((id *)&self->_hiddenComplicationSlots, 0);
  objc_storeStrong((id *)&self->_editConfigurations, 0);
  objc_storeStrong((id *)&self->_complicationLayouts, 0);
  objc_storeStrong((id *)&self->_complicationDisplayWrappers, 0);
  objc_storeStrong((id *)&self->_crownAssertionToken, 0);
  objc_storeStrong((id *)&self->_crownHandler, 0);
  objc_storeStrong((id *)&self->_allSubQuadViews, 0);
  objc_storeStrong((id *)&self->_interpolatedColorPalette, 0);
  objc_storeStrong((id *)&self->_faceColorPalette, 0);
  objc_storeStrong((id *)&self->_sensitiveUIShieldView, 0);
  objc_storeStrong((id *)&self->_analyticsTimeTravelSessionStart, 0);
  objc_storeStrong((id *)&self->_crownIdleTimer, 0);
  objc_storeStrong((id *)&self->_tomorrowEnd, 0);
  objc_storeStrong((id *)&self->_yesterdayStart, 0);
  objc_storeStrong((id *)&self->_scrubDate, 0);
  objc_storeStrong((id *)&self->_timeTravelEnterDate, 0);
  objc_storeStrong((id *)&self->_fastCrownModeTimeoutTimer, 0);

  objc_storeStrong((id *)&self->_accumulateTimeTravelEntryRotationTimeoutTimer, 0);
}

- (void)renderIfNeeded
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 134218496;
  uint64_t v4 = [a1 dataMode];
  __int16 v5 = 1024;
  int v6 = NTKIsScreenOn();
  __int16 v7 = 1024;
  int v8 = NTKIsDaemonOrFaceSnapshotService();
  _os_log_debug_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_DEBUG, "renderWasIgnored dataMode:%ld NTKIsScreenOn:%d NTKIsDaemonOrFaceSnapshotService:%d)", (uint8_t *)&v3, 0x18u);
}

@end