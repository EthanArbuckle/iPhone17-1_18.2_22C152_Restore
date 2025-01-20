@interface TUIKeyplaneView
+ (CGSize)keyplaneSizeForLayout:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5;
+ (Class)selectorViewClassForKey:(id)a3;
+ (id)dynamicKeyboardForName:(id)a3 size:(CGSize)a4 isLandscape:(BOOL)a5;
+ (id)keyplaneViewForKeyboard:(id)a3 size:(CGSize)a4 isLandscape:(BOOL)a5;
+ (id)keyplaneViewForKeyboard:(id)a3 size:(CGSize)a4 isLandscape:(BOOL)a5 displayKeyplane:(unint64_t)a6;
+ (id)keyplaneViewForLayout:(id)a3 size:(CGSize)a4 isLandscape:(BOOL)a5;
+ (id)updateDynamicKeyboard:(id)a3 usingSize:(CGSize)a4 isLandscape:(BOOL)a5;
+ (id)updateDynamicKeyplane:(id)a3 usingSize:(CGSize)a4 isLandscape:(BOOL)a5;
- (BOOL)_shouldAllowKey:(id)a3;
- (BOOL)_shouldUseUnifiedKeyView:(id)a3;
- (BOOL)_userInteractionStateDeterminesLayerHitTestState;
- (BOOL)allowsPaddles;
- (BOOL)dismissingKeyboardMenu;
- (BOOL)isCurrentlySplit;
- (BOOL)isFloating;
- (BOOL)isInSplitTransition;
- (BOOL)isSplit;
- (BOOL)layoutReadyForTreeUpdate;
- (BOOL)movingFromFloating;
- (BOOL)movingToFloating;
- (BOOL)supportsSplit;
- (CGRect)updateFrameForKey:(id)a3;
- (CGSize)idealKeySizeforLayoutType:(int64_t)a3;
- (CGSize)leftSplitSize;
- (CGSize)preferredFloatingSize;
- (CGSize)preferredSize;
- (CGSize)rightSplitSize;
- (CGSize)sizeFromScreenTraitsAndClass;
- (CGSize)splitSizeForRightSide:(BOOL)a3;
- (CGSize)unsplitSize;
- (Class)preferredKeyViewClass;
- (NSLayoutConstraint)bottomRowSizingConstraint;
- (NSLayoutConstraint)bottomSpacing;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)horizontalBiasButtonConstraint;
- (NSLayoutConstraint)keySizeSpacer;
- (NSLayoutConstraint)leadingSpacing;
- (NSLayoutConstraint)leftSplitWidth;
- (NSLayoutConstraint)preferredWidthConstraint;
- (NSLayoutConstraint)rightSplitWidth;
- (NSLayoutConstraint)scalingConstraint;
- (NSLayoutConstraint)sizeRatioConstraint;
- (NSLayoutConstraint)splitSpacing;
- (NSLayoutConstraint)topSpacing;
- (NSLayoutConstraint)trailingSpacing;
- (NSLayoutConstraint)trailingTieConstraint;
- (NSMutableArray)activeVariantViews;
- (NSMutableDictionary)delayedDeactivationKeys;
- (NSMutableDictionary)keyRowViews;
- (NSMutableDictionary)splitTransitionLayoutGuides;
- (NSMutableDictionary)storedKeyViews;
- (NSMutableDictionary)storedVariantViews;
- (NSString)description;
- (NSString)displayedType;
- (NSString)keyLayout;
- (TUIKey)activeKey;
- (TUIKeyplane)currentKeyplane;
- (TUIKeyplaneView)initWithFrame:(CGRect)a3 keyplane:(id)a4;
- (UIButton)biasEscapeButton;
- (UIEdgeInsets)keycapInsets;
- (UIEdgeInsets)keyplaneInsets;
- (UIEdgeInsets)rowInsets;
- (UIEdgeInsets)standardKeyInsets;
- (UIKBRenderConfig)renderConfig;
- (UIKBRenderFactory)factory;
- (UIKBRenderingContext)renderingContext;
- (UIKBScreenTraits)screenTraits;
- (UIKBTree)keyplane;
- (UILayoutGuide)bottomRowSizingGuide;
- (UILayoutGuide)keySizeReferenceGuide;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (UIView)keyboardContentView;
- (double)fullHeightForDockedKeyboard;
- (double)maximumWidth;
- (double)previousWidth;
- (double)rowsVerticalSpacing;
- (double)startingWidthConstant;
- (double)transitionProgress;
- (id)cacheIdentifierForKey:(id)a3 withState:(int)a4;
- (id)cachedVariantViewForTree:(id)a3;
- (id)cachedVariantViewForTree:(id)a3 state:(int)a4;
- (id)hitTestVariantKeyAtPoint:(CGPoint)a3;
- (id)keyViewForKey:(id)a3;
- (id)keyViewForTree:(id)a3;
- (id)keyplaneFromTree:(id)a3 size:(CGSize)a4 controlKeyType:(int64_t)a5;
- (id)keyplaneRenderConfig;
- (id)renderConfigForCurrentTraitCollection;
- (id)variantViewForKey:(id)a3 cacheID:(id)a4;
- (id)viewForBaseKey:(id)a3;
- (int)stateForKey:(id)a3;
- (int64_t)currentHandBias;
- (int64_t)floatingControlKeyType;
- (int64_t)fullControlKeyType;
- (int64_t)keyLayoutStyle;
- (void)_generateFactoryIfNeeded;
- (void)_generateRenderingContextIfNeeded;
- (void)_regenerateFactoryPreservingUpdates:(BOOL)a3;
- (void)_updateRenderingContext;
- (void)addKeyToDelayedDeactivationSet:(id)a3;
- (void)changingSelectedVariantForKey:(id)a3 atPoint:(CGPoint)a4;
- (void)changingSelectedVariantForKey:(id)a3 atPoint:(CGPoint)a4 isDragging:(BOOL)a5;
- (void)compareKeyplane:(id)a3 toKeyplane:(id)a4;
- (void)createContentViewsIfNeeded;
- (void)createSplitLayoutIfNeeded;
- (void)deactivateAdaptiveKey:(id)a3;
- (void)deactivateKey:(id)a3 previousState:(int)a4;
- (void)deactivateKeys;
- (void)didTapBiasEscapeButton;
- (void)dimKeys:(id)a3;
- (void)finalLayoutForSplit:(BOOL)a3;
- (void)finishSplitTransition;
- (void)finishedSelectingVariantForKey:(id)a3 atPoint:(CGPoint)a4;
- (void)generateFactoryForKeyplane:(id)a3 landscape:(BOOL)a4;
- (void)layoutKeysInRows:(id)a3;
- (void)layoutRows:(unint64_t)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)prepareForSplitTransition;
- (void)presentSelectorView:(id)a3 fromBaseKey:(id)a4;
- (void)removeFromSuperview;
- (void)removeKeyFromDelayedDeactivationSet:(id)a3;
- (void)resetLayoutAndApplyKeyplane:(id)a3;
- (void)setActiveKey:(id)a3;
- (void)setActiveVariantViews:(id)a3;
- (void)setAllowsPaddles:(BOOL)a3;
- (void)setBiasEscapeButton:(id)a3;
- (void)setBottomRowSizingConstraint:(id)a3;
- (void)setBottomRowSizingGuide:(id)a3;
- (void)setBottomSpacing:(id)a3;
- (void)setCurrentHandBias:(int64_t)a3;
- (void)setCurrentKeyplane:(id)a3;
- (void)setDelayedDeactivationKeys:(id)a3;
- (void)setDismissingKeyboardMenu:(BOOL)a3;
- (void)setDisplayedType:(id)a3;
- (void)setFactory:(id)a3;
- (void)setFloatingControlKeyType:(int64_t)a3;
- (void)setFullControlKeyType:(int64_t)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setHorizontalBiasButtonConstraint:(id)a3;
- (void)setIsCurrentlySplit:(BOOL)a3;
- (void)setIsFloating:(BOOL)a3;
- (void)setIsInSplitTransition:(BOOL)a3;
- (void)setKeyLayout:(id)a3;
- (void)setKeyRowViews:(id)a3;
- (void)setKeySizeReferenceGuide:(id)a3;
- (void)setKeySizeSpacer:(id)a3;
- (void)setKeyboardBias:(int64_t)a3;
- (void)setKeyboardContentView:(id)a3;
- (void)setKeyplane:(id)a3;
- (void)setKeyplaneForAutomation:(id)a3;
- (void)setLayoutReadyForTreeUpdate:(BOOL)a3;
- (void)setLeadingSpacing:(id)a3;
- (void)setLeftSplitWidth:(id)a3;
- (void)setMaximumWidth:(double)a3;
- (void)setMovingFromFloating:(BOOL)a3;
- (void)setMovingToFloating:(BOOL)a3;
- (void)setOverrideScreenTraits:(id)a3;
- (void)setPinchGestureRecognizer:(id)a3;
- (void)setPreferredFloatingSize:(CGSize)a3;
- (void)setPreferredSize:(CGSize)a3;
- (void)setPreferredWidthConstraint:(id)a3;
- (void)setPreviousWidth:(double)a3;
- (void)setRenderConfig:(id)a3;
- (void)setRenderingContext:(id)a3;
- (void)setRightSplitWidth:(id)a3;
- (void)setScalingConstraint:(id)a3;
- (void)setScreenTraits:(id)a3;
- (void)setSizeRatioConstraint:(id)a3;
- (void)setSplitSpacing:(id)a3;
- (void)setSplitTransitionLayoutGuides:(id)a3;
- (void)setStandardKeyInsets:(UIEdgeInsets)a3;
- (void)setStartingWidthConstant:(double)a3;
- (void)setState:(int)a3 forKey:(id)a4;
- (void)setStoredKeyViews:(id)a3;
- (void)setStoredVariantViews:(id)a3;
- (void)setTopSpacing:(id)a3;
- (void)setTrailingSpacing:(id)a3;
- (void)setTrailingTieConstraint:(id)a3;
- (void)setTransitionProgress:(double)a3;
- (void)setUnsplitSize:(CGSize)a3;
- (void)tappedToDismissSelector;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionToKeyplane:(id)a3;
- (void)transitionWillFinishWithProgress:(double)a3 completion:(id)a4;
- (void)updateAllTrees;
- (void)updateBiasEscapeButtonVisbility:(BOOL)a3;
- (void)updateBottomRowSizingGuide;
- (void)updateKeyplaneSpacing;
- (void)updateKeysForFloating:(BOOL)a3;
- (void)updateKeysForRow:(unint64_t)a3 withKeys:(id)a4;
- (void)updateRowsForKeyplane:(id)a3;
- (void)updateSplitProgress:(double)a3;
- (void)updateToSize:(CGSize)a3;
- (void)updateToSpecifiedSize:(CGSize)a3;
- (void)updateTreeForAutomation;
- (void)updateVariantSelectorFramesForKey:(id)a3;
@end

@implementation TUIKeyplaneView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeKey, 0);
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_splitTransitionLayoutGuides, 0);
  objc_storeStrong((id *)&self->_delayedDeactivationKeys, 0);
  objc_storeStrong((id *)&self->_keyRowViews, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_renderingContext, 0);
  objc_storeStrong((id *)&self->_horizontalBiasButtonConstraint, 0);
  objc_storeStrong((id *)&self->_biasEscapeButton, 0);
  objc_storeStrong((id *)&self->_keyLayout, 0);
  objc_storeStrong((id *)&self->_displayedType, 0);
  objc_storeStrong((id *)&self->_bottomRowSizingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomRowSizingGuide, 0);
  objc_storeStrong((id *)&self->_keySizeReferenceGuide, 0);
  objc_storeStrong((id *)&self->_keyboardContentView, 0);
  objc_storeStrong((id *)&self->_rightSplitWidth, 0);
  objc_storeStrong((id *)&self->_leftSplitWidth, 0);
  objc_storeStrong((id *)&self->_keySizeSpacer, 0);
  objc_storeStrong((id *)&self->_splitSpacing, 0);
  objc_storeStrong((id *)&self->_bottomSpacing, 0);
  objc_storeStrong((id *)&self->_trailingSpacing, 0);
  objc_storeStrong((id *)&self->_leadingSpacing, 0);
  objc_storeStrong((id *)&self->_topSpacing, 0);
  objc_storeStrong((id *)&self->_scalingConstraint, 0);
  objc_storeStrong((id *)&self->_trailingTieConstraint, 0);
  objc_storeStrong((id *)&self->_preferredWidthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_sizeRatioConstraint, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_activeVariantViews, 0);
  objc_storeStrong((id *)&self->_storedVariantViews, 0);
  objc_storeStrong((id *)&self->_storedKeyViews, 0);
  objc_storeStrong((id *)&self->_currentKeyplane, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
}

- (void)setActiveKey:(id)a3
{
}

- (TUIKey)activeKey
{
  return self->_activeKey;
}

- (void)setScreenTraits:(id)a3
{
}

- (UIKBScreenTraits)screenTraits
{
  return self->_screenTraits;
}

- (void)setSplitTransitionLayoutGuides:(id)a3
{
}

- (NSMutableDictionary)splitTransitionLayoutGuides
{
  return self->_splitTransitionLayoutGuides;
}

- (void)setDelayedDeactivationKeys:(id)a3
{
}

- (NSMutableDictionary)delayedDeactivationKeys
{
  return self->_delayedDeactivationKeys;
}

- (void)setKeyRowViews:(id)a3
{
}

- (NSMutableDictionary)keyRowViews
{
  return self->_keyRowViews;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (UIKBRenderingContext)renderingContext
{
  return self->_renderingContext;
}

- (void)setFloatingControlKeyType:(int64_t)a3
{
  self->_floatingControlKeyType = a3;
}

- (int64_t)floatingControlKeyType
{
  return self->_floatingControlKeyType;
}

- (void)setFullControlKeyType:(int64_t)a3
{
  self->_fullControlKeyType = a3;
}

- (int64_t)fullControlKeyType
{
  return self->_fullControlKeyType;
}

- (void)setTransitionProgress:(double)a3
{
  self->_transitionProgress = a3;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (void)setIsInSplitTransition:(BOOL)a3
{
  self->_isInSplitTransition = a3;
}

- (BOOL)isInSplitTransition
{
  return self->_isInSplitTransition;
}

- (void)setIsCurrentlySplit:(BOOL)a3
{
  self->_isCurrentlySplit = a3;
}

- (BOOL)isCurrentlySplit
{
  return self->_isCurrentlySplit;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (void)setMovingToFloating:(BOOL)a3
{
  self->_movingToFloating = a3;
}

- (BOOL)movingToFloating
{
  return self->_movingToFloating;
}

- (void)setMovingFromFloating:(BOOL)a3
{
  self->_movingFromFloating = a3;
}

- (BOOL)movingFromFloating
{
  return self->_movingFromFloating;
}

- (void)setAllowsPaddles:(BOOL)a3
{
  self->_allowsPaddles = a3;
}

- (BOOL)allowsPaddles
{
  return self->_allowsPaddles;
}

- (void)setHorizontalBiasButtonConstraint:(id)a3
{
}

- (NSLayoutConstraint)horizontalBiasButtonConstraint
{
  return self->_horizontalBiasButtonConstraint;
}

- (void)setBiasEscapeButton:(id)a3
{
}

- (UIButton)biasEscapeButton
{
  return self->_biasEscapeButton;
}

- (void)setCurrentHandBias:(int64_t)a3
{
  self->_currentHandBias = a3;
}

- (void)setUnsplitSize:(CGSize)a3
{
  self->_unsplitSize = a3;
}

- (CGSize)unsplitSize
{
  double width = self->_unsplitSize.width;
  double height = self->_unsplitSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredFloatingSize:(CGSize)a3
{
  self->_preferredFloatingSize = a3;
}

- (CGSize)preferredFloatingSize
{
  double width = self->_preferredFloatingSize.width;
  double height = self->_preferredFloatingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousWidth:(double)a3
{
  self->_previousWidth = a3;
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setMaximumWidth:(double)a3
{
  self->_maximumWidth = a3;
}

- (double)maximumWidth
{
  return self->_maximumWidth;
}

- (void)setStartingWidthConstant:(double)a3
{
  self->_startingWidthConstant = a3;
}

- (double)startingWidthConstant
{
  return self->_startingWidthConstant;
}

- (void)setKeyLayout:(id)a3
{
}

- (NSString)keyLayout
{
  return self->_keyLayout;
}

- (void)setDisplayedType:(id)a3
{
}

- (NSString)displayedType
{
  return self->_displayedType;
}

- (void)setStandardKeyInsets:(UIEdgeInsets)a3
{
  self->_standardKeyInsets = a3;
}

- (UIEdgeInsets)standardKeyInsets
{
  double top = self->_standardKeyInsets.top;
  double left = self->_standardKeyInsets.left;
  double bottom = self->_standardKeyInsets.bottom;
  double right = self->_standardKeyInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBottomRowSizingConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomRowSizingConstraint
{
  return self->_bottomRowSizingConstraint;
}

- (void)setBottomRowSizingGuide:(id)a3
{
}

- (UILayoutGuide)bottomRowSizingGuide
{
  return self->_bottomRowSizingGuide;
}

- (void)setKeySizeReferenceGuide:(id)a3
{
}

- (UILayoutGuide)keySizeReferenceGuide
{
  return self->_keySizeReferenceGuide;
}

- (void)setKeyboardContentView:(id)a3
{
}

- (UIView)keyboardContentView
{
  return self->_keyboardContentView;
}

- (void)setRightSplitWidth:(id)a3
{
}

- (NSLayoutConstraint)rightSplitWidth
{
  return self->_rightSplitWidth;
}

- (void)setLeftSplitWidth:(id)a3
{
}

- (NSLayoutConstraint)leftSplitWidth
{
  return self->_leftSplitWidth;
}

- (void)setKeySizeSpacer:(id)a3
{
}

- (NSLayoutConstraint)keySizeSpacer
{
  return self->_keySizeSpacer;
}

- (void)setSplitSpacing:(id)a3
{
}

- (NSLayoutConstraint)splitSpacing
{
  return self->_splitSpacing;
}

- (void)setBottomSpacing:(id)a3
{
}

- (NSLayoutConstraint)bottomSpacing
{
  return self->_bottomSpacing;
}

- (void)setTrailingSpacing:(id)a3
{
}

- (NSLayoutConstraint)trailingSpacing
{
  return self->_trailingSpacing;
}

- (void)setLeadingSpacing:(id)a3
{
}

- (NSLayoutConstraint)leadingSpacing
{
  return self->_leadingSpacing;
}

- (void)setTopSpacing:(id)a3
{
}

- (NSLayoutConstraint)topSpacing
{
  return self->_topSpacing;
}

- (void)setScalingConstraint:(id)a3
{
}

- (NSLayoutConstraint)scalingConstraint
{
  return self->_scalingConstraint;
}

- (void)setTrailingTieConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingTieConstraint
{
  return self->_trailingTieConstraint;
}

- (void)setPreferredWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)preferredWidthConstraint
{
  return self->_preferredWidthConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setSizeRatioConstraint:(id)a3
{
}

- (NSLayoutConstraint)sizeRatioConstraint
{
  return self->_sizeRatioConstraint;
}

- (void)setPinchGestureRecognizer:(id)a3
{
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setDismissingKeyboardMenu:(BOOL)a3
{
  self->_dismissingKeyboardMenu = a3;
}

- (BOOL)dismissingKeyboardMenu
{
  return self->_dismissingKeyboardMenu;
}

- (void)setLayoutReadyForTreeUpdate:(BOOL)a3
{
  self->_layoutReadyForTreeUpdate = a3;
}

- (BOOL)layoutReadyForTreeUpdate
{
  return self->_layoutReadyForTreeUpdate;
}

- (void)setActiveVariantViews:(id)a3
{
}

- (NSMutableArray)activeVariantViews
{
  return self->_activeVariantViews;
}

- (void)setStoredVariantViews:(id)a3
{
}

- (NSMutableDictionary)storedVariantViews
{
  return self->_storedVariantViews;
}

- (void)setStoredKeyViews:(id)a3
{
}

- (NSMutableDictionary)storedKeyViews
{
  return self->_storedKeyViews;
}

- (void)setCurrentKeyplane:(id)a3
{
}

- (TUIKeyplane)currentKeyplane
{
  return self->_currentKeyplane;
}

- (void)setFactory:(id)a3
{
}

- (UIKBTree)keyplane
{
  return self->_keyplane;
}

- (Class)preferredKeyViewClass
{
  v2 = [(TUIKeyplaneView *)self currentKeyplane];
  [v2 effectsType];

  v3 = objc_opt_class();
  return (Class)v3;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TUIKeyplaneView *)self keyplane];
  v6 = [v5 name];
  if ([(TUIKeyplaneView *)self isFloating]) {
    [(TUIKeyplaneView *)self preferredFloatingSize];
  }
  else {
    [(TUIKeyplaneView *)self preferredSize];
  }
  v9 = NSStringFromCGSize(*(CGSize *)&v7);
  v10 = [(TUIKeyplaneView *)self currentKeyplane];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p> name = %@; preferredSize = %@; currentKeyplane = %@",
    v4,
    self,
    v6,
    v9,
  v11 = v10);

  return (NSString *)v11;
}

- (void)updateToSize:(CGSize)a3
{
  double width = a3.width;
  if (a3.width >= 280.0)
  {
    double height = a3.height;
    if (a3.height >= 140.0)
    {
      v6 = [(TUIKeyplaneView *)self factory];
      [v6 scale];
      double v8 = v7;

      if (v8 > 0.0)
      {
        v9 = [(TUIKeyplaneView *)self factory];
        [v9 scale];
        double v11 = ceil(height * v10);
        v12 = [(TUIKeyplaneView *)self factory];
        [v12 scale];
        double height = v11 / v13;

        v14 = [(TUIKeyplaneView *)self factory];
        [v14 scale];
        double v16 = ceil(width * v15);
        v17 = [(TUIKeyplaneView *)self factory];
        [v17 scale];
        double width = v16 / v18;
      }
      BOOL v19 = [(TUIKeyplaneView *)self isFloating];
      v20 = [(TUIKeyplaneView *)self sizeRatioConstraint];
      [v20 setActive:0];

      v21 = [(TUIKeyplaneView *)self heightConstraint];
      v22 = v21;
      if (v19)
      {
        [v21 setActive:0];

        v23 = [(TUIKeyplaneView *)self preferredWidthConstraint];
        [v23 setActive:0];

        v24 = [(TUIKeyplaneView *)self keyboardContentView];
        v25 = [v24 heightAnchor];
        v26 = [(TUIKeyplaneView *)self keyboardContentView];
        v27 = [v26 widthAnchor];
        v28 = [v25 constraintEqualToAnchor:v27 multiplier:ceil(height) / width];
        [(TUIKeyplaneView *)self setSizeRatioConstraint:v28];

        v29 = [(TUIKeyplaneView *)self sizeRatioConstraint];
        [v29 setActive:1];

        v30 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v30 bounds];
        [(TUIKeyplaneView *)self setMaximumWidth:v31];
      }
      else
      {

        if (!v22)
        {
          v32 = [(TUIKeyplaneView *)self keyboardContentView];
          v33 = [v32 heightAnchor];
          v34 = [v33 constraintEqualToConstant:height];
          [(TUIKeyplaneView *)self setHeightConstraint:v34];
        }
        v35 = [(TUIKeyplaneView *)self preferredWidthConstraint];

        if (!v35)
        {
          v36 = [(TUIKeyplaneView *)self keyboardContentView];
          v37 = [v36 widthAnchor];
          v38 = [v37 constraintEqualToConstant:width];
          [(TUIKeyplaneView *)self setPreferredWidthConstraint:v38];

          v39 = [(TUIKeyplaneView *)self preferredWidthConstraint];
          LODWORD(v40) = 1144750080;
          [v39 setPriority:v40];
        }
        v41 = [(TUIKeyplaneView *)self heightConstraint];
        [v41 setActive:1];

        v30 = [(TUIKeyplaneView *)self preferredWidthConstraint];
        [v30 setActive:1];
      }

      [(TUIKeyplaneView *)self preferredSize];
      if (v42 != height)
      {
        v43 = [(TUIKeyplaneView *)self heightConstraint];
        [v43 setConstant:height];
      }
      [(TUIKeyplaneView *)self preferredSize];
      if (v44 != width)
      {
        v45 = [(TUIKeyplaneView *)self preferredWidthConstraint];
        [v45 setConstant:width];
      }
      [(TUIKeyplaneView *)self preferredSize];
      double v47 = v46;
      double v49 = v48;
      -[TUIKeyplaneView setPreferredSize:](self, "setPreferredSize:", width, height);
      [(TUIKeyplaneView *)self setLayoutReadyForTreeUpdate:1];
      if (v47 != width || v49 != height) {
        [(TUIKeyplaneView *)self invalidateIntrinsicContentSize];
      }
      [(TUIKeyplaneView *)self updateAllTrees];
    }
  }
}

- (double)fullHeightForDockedKeyboard
{
  [(TUIKeyplaneView *)self unsplitSize];
  double v4 = v3;
  [(TUIKeyplaneView *)self preferredSize];
  if (v4 < v5)
  {
    [(TUIKeyplaneView *)self sizeFromScreenTraitsAndClass];
    -[TUIKeyplaneView setUnsplitSize:](self, "setUnsplitSize:");
  }
  [(TUIKeyplaneView *)self unsplitSize];
  return v6;
}

- (UIEdgeInsets)rowInsets
{
  v2 = [(TUIKeyplaneView *)self currentKeyplane];
  uint64_t v3 = [v2 effectsType];

  double v4 = 0.0;
  double v5 = 24.0;
  if (v3 != 1) {
    double v5 = 0.0;
  }
  double v6 = 0.0;
  double v7 = v5;
  result.double right = v7;
  result.double bottom = v6;
  result.double left = v5;
  result.double top = v4;
  return result;
}

- (double)rowsVerticalSpacing
{
  v2 = [(TUIKeyplaneView *)self currentKeyplane];
  uint64_t v3 = [v2 effectsType];

  double result = 0.0;
  if (v3 == 1) {
    return 12.0;
  }
  return result;
}

- (CGSize)idealKeySizeforLayoutType:(int64_t)a3
{
  double v4 = [(TUIKeyplaneView *)self currentKeyplane];
  uint64_t v5 = [v4 effectsType];

  double v6 = 60.0;
  double v7 = 102.0;
  if (a3 != 7) {
    double v7 = 60.0;
  }
  if (v5 != 1)
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (CGSize)sizeFromScreenTraitsAndClass
{
  uint64_t v3 = [(TUIKeyplaneView *)self screenTraits];
  double v4 = [(TUIKeyplaneView *)self keyplane];
  uint64_t v5 = [v4 layoutName];
  double v6 = [(TUIKeyplaneView *)self currentKeyplane];
  +[TUIKeyplane sizeFromScreenTraits:layout:layoutClass:](TUIKeyplane, "sizeFromScreenTraits:layout:layoutClass:", v3, v5, [v6 layoutClass]);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)splitSizeForRightSide:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    double v5 = 280.0;
  }
  else {
    double v5 = 266.0;
  }
  double v6 = [(TUIKeyplaneView *)self currentKeyplane];

  if (v6)
  {
    double v7 = [(TUIKeyplaneView *)self currentKeyplane];
    [v7 finalSplitSizeForRightSide:v3];
    double v5 = v8;

    double v9 = [(TUIKeyplaneView *)self currentKeyplane];
    [v9 finalHeightForSplitKeyboard];
    double v11 = v10;
  }
  else
  {
    double v11 = 205.0;
  }
  double v12 = [MEMORY[0x1E4FB1920] sharedPreferencesController];
  double v13 = [v12 preferencesActions];
  [v13 rivenSizeFactor:v5];
  double v15 = v14;
  double v16 = [MEMORY[0x1E4FB1920] sharedPreferencesController];
  v17 = [v16 preferencesActions];
  [v17 rivenSizeFactor:v11];
  double v19 = v18;

  double v20 = v15;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (CGSize)rightSplitSize
{
  [(TUIKeyplaneView *)self splitSizeForRightSide:1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)leftSplitSize
{
  [(TUIKeyplaneView *)self splitSizeForRightSide:0];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)finalLayoutForSplit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(TUIKeyplaneView *)self isCurrentlySplit] != a3) {
    [(TUIKeyplaneView *)self setIsCurrentlySplit:v3];
  }
  [(TUIKeyplaneView *)self _regenerateFactoryPreservingUpdates:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v5 = [(TUIKeyplaneView *)self keyRowViews];
  double v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * i) toggleConstraintsForSplit:v3];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v8);
  }

  if (v3)
  {
    [(TUIKeyplaneView *)self leftSplitSize];
    double v12 = v11;
    [(TUIKeyplaneView *)self rightSplitSize];
    double v14 = vabdd_f64(v12, v13) + 20.0;
    double v15 = [(TUIKeyplaneView *)self keySizeSpacer];
    [v15 setConstant:v14];

    double v16 = [(TUIKeyplaneView *)self splitSpacing];
    [v16 setActive:0];

    [(TUIKeyplaneView *)self leftSplitSize];
    double v18 = v17;
    double v19 = [(TUIKeyplaneView *)self leftSplitWidth];
    [v19 setConstant:v18];

    [(TUIKeyplaneView *)self rightSplitSize];
    double v21 = v20;
    v22 = [(TUIKeyplaneView *)self rightSplitWidth];
    [v22 setConstant:v21];

    v23 = [(TUIKeyplaneView *)self leftSplitWidth];
    [v23 setActive:1];

    v24 = [(TUIKeyplaneView *)self rightSplitWidth];
    [v24 setActive:1];

    [(TUIKeyplaneView *)self leftSplitSize];
  }
  else
  {
    v26 = [(TUIKeyplaneView *)self keySizeSpacer];
    [v26 setConstant:0.0];

    v27 = [(TUIKeyplaneView *)self splitSpacing];
    [v27 setActive:1];

    v28 = [(TUIKeyplaneView *)self leftSplitWidth];
    [v28 setActive:0];

    v29 = [(TUIKeyplaneView *)self rightSplitWidth];
    [v29 setActive:0];

    [(TUIKeyplaneView *)self sizeFromScreenTraitsAndClass];
    -[TUIKeyplaneView setUnsplitSize:](self, "setUnsplitSize:");
    [(TUIKeyplaneView *)self unsplitSize];
  }
  double v30 = v25;
  double v31 = [(TUIKeyplaneView *)self heightConstraint];
  [v31 setConstant:v30];
}

- (void)finishSplitTransition
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(TUIKeyplaneView *)self unsplitSize];
  double v4 = v3;
  double v6 = v5;
  [(TUIKeyplaneView *)self transitionProgress];
  if (v7 == 1.0)
  {
    [(TUIKeyplaneView *)self preferredSize];
    double v4 = v8;
    [(TUIKeyplaneView *)self leftSplitSize];
    double v6 = v9;
  }
  [(TUIKeyplaneView *)self setIsInSplitTransition:0];
  double v10 = [(TUIKeyplaneView *)self bottomSpacing];
  [v10 setActive:1];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v11 = [(TUIKeyplaneView *)self keyRowViews];
  double v12 = [v11 allValues];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v17 updateKeysForTransition:0];
        if ([(TUIKeyplaneView *)self isCurrentlySplit]) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = 2;
        }
        double v19 = [(TUIKeyplaneView *)self factory];
        [v17 updateKeysInRowWithStyle:v18 factory:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  -[TUIKeyplaneView updateToSize:](self, "updateToSize:", v4, v6);
}

- (void)transitionWillFinishWithProgress:(double)a3 completion:(id)a4
{
  id v6 = a4;
  [(TUIKeyplaneView *)self transitionProgress];
  double v8 = vabdd_f64(a3, v7) / 3.0;
  [(TUIKeyplaneView *)self finalLayoutForSplit:a3 != 0.0];
  [(TUIKeyplaneView *)self setTransitionProgress:a3];
  double v9 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__TUIKeyplaneView_transitionWillFinishWithProgress_completion___block_invoke;
  v13[3] = &unk_1E55941A8;
  v13[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__TUIKeyplaneView_transitionWillFinishWithProgress_completion___block_invoke_2;
  v11[3] = &unk_1E5594288;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 animateWithDuration:4 delay:v13 options:v11 animations:v8 completion:0.0];
}

uint64_t __63__TUIKeyplaneView_transitionWillFinishWithProgress_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __63__TUIKeyplaneView_transitionWillFinishWithProgress_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) updateAllTrees];
  [*(id *)(a1 + 32) setLayoutReadyForTreeUpdate:1];
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)updateSplitProgress:(double)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (a3 == 0.0 || a3 == 1.0)
  {
    [(TUIKeyplaneView *)self setLayoutReadyForTreeUpdate:[(TUIKeyplaneView *)self isInSplitTransition] ^ 1];
    [(TUIKeyplaneView *)self setIsInSplitTransition:1];
    if (a3 == 0.0)
    {
      [(TUIKeyplaneView *)self transitionProgress];
      if (v6 > 0.0)
      {
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        double v7 = [(TUIKeyplaneView *)self keyRowViews];
        double v8 = [v7 allValues];

        uint64_t v9 = [v8 countByEnumeratingWithState:&v65 objects:v70 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v66;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v66 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v65 + 1) + 8 * i) toggleConstraintsForSplit:0];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v65 objects:v70 count:16];
          }
          while (v10);
        }

        uint64_t v13 = [(TUIKeyplaneView *)self keySizeSpacer];
        [v13 setConstant:0.0];

        uint64_t v14 = [(TUIKeyplaneView *)self splitSpacing];
        [v14 setActive:1];

        uint64_t v15 = [(TUIKeyplaneView *)self leftSplitWidth];
        [v15 setActive:0];

        double v16 = [(TUIKeyplaneView *)self rightSplitWidth];
        [v16 setActive:0];

        double v17 = (void *)MEMORY[0x1E4FB1EB0];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __39__TUIKeyplaneView_updateSplitProgress___block_invoke;
        v64[3] = &unk_1E55941A8;
        v64[4] = self;
        uint64_t v18 = &__block_literal_global_106;
        double v19 = v64;
        goto LABEL_26;
      }
    }
  }
  else
  {
    [(TUIKeyplaneView *)self setIsInSplitTransition:1];
    [(TUIKeyplaneView *)self setLayoutReadyForTreeUpdate:0];
    [(TUIKeyplaneView *)self transitionProgress];
    if (v20 == 0.0 || ([(TUIKeyplaneView *)self transitionProgress], v21 == 1.0))
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v22 = [(TUIKeyplaneView *)self keyRowViews];
      long long v23 = [v22 allValues];

      uint64_t v24 = [v23 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v61;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v61 != v26) {
              objc_enumerationMutation(v23);
            }
            [*(id *)(*((void *)&v60 + 1) + 8 * j) toggleConstraintsForSplit:1];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v60 objects:v69 count:16];
        }
        while (v25);
      }

      v28 = [(TUIKeyplaneView *)self splitSpacing];
      [v28 setActive:0];

      v29 = [(TUIKeyplaneView *)self leftSplitWidth];
      [v29 setActive:1];

      double v30 = [(TUIKeyplaneView *)self rightSplitWidth];
      [v30 setActive:1];

      double v17 = (void *)MEMORY[0x1E4FB1EB0];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __39__TUIKeyplaneView_updateSplitProgress___block_invoke_3;
      v59[3] = &unk_1E55941A8;
      v59[4] = self;
      uint64_t v18 = &__block_literal_global_108;
      double v19 = v59;
LABEL_26:
      [v17 animateWithDuration:v19 animations:v18 completion:0.1];
    }
  }
  double v31 = 0.0;
  if (a3 >= 0.0) {
    double v31 = a3;
  }
  if (a3 <= 1.0) {
    double v32 = v31;
  }
  else {
    double v32 = 1.0;
  }
  [(TUIKeyplaneView *)self unsplitSize];
  double v34 = v33;
  [(TUIKeyplaneView *)self leftSplitSize];
  double v36 = v35;
  [(TUIKeyplaneView *)self rightSplitSize];
  double v38 = v34 - (v36 + v37);
  [(TUIKeyplaneView *)self leftSplitSize];
  double v40 = v39 + v38 * 0.5 * (1.0 - v32);
  v41 = [(TUIKeyplaneView *)self leftSplitWidth];
  [v41 setConstant:v40];

  [(TUIKeyplaneView *)self rightSplitSize];
  double v43 = v42 + v38 * 0.5 * (1.0 - v32);
  double v44 = [(TUIKeyplaneView *)self rightSplitWidth];
  [v44 setConstant:v43];

  [(TUIKeyplaneView *)self leftSplitSize];
  double v46 = v45;
  [(TUIKeyplaneView *)self rightSplitSize];
  double v48 = vabdd_f64(v46, v47) + 20.0;
  if (v32 * v38 <= v48) {
    double v49 = v32 * v38;
  }
  else {
    double v49 = v48;
  }
  v50 = [(TUIKeyplaneView *)self keySizeSpacer];
  [v50 setConstant:v49];

  [(TUIKeyplaneView *)self unsplitSize];
  double v52 = v51;
  [(TUIKeyplaneView *)self leftSplitSize];
  double v54 = v32 * (v52 - v53);
  [(TUIKeyplaneView *)self unsplitSize];
  double v56 = v55 - v54;
  v57 = [(TUIKeyplaneView *)self heightConstraint];
  [v57 setConstant:v56];

  if (v32 > 0.6)
  {
    if ([(TUIKeyplaneView *)self isCurrentlySplit]) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  if (v32 < 0.6 && [(TUIKeyplaneView *)self isCurrentlySplit])
  {
LABEL_40:
    [(TUIKeyplaneView *)self setIsCurrentlySplit:v32 > 0.6];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __39__TUIKeyplaneView_updateSplitProgress___block_invoke_5;
    v58[3] = &unk_1E55941A8;
    v58[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v58 animations:0 completion:0.1];
  }
LABEL_41:
  [(TUIKeyplaneView *)self setTransitionProgress:v32];
}

uint64_t __39__TUIKeyplaneView_updateSplitProgress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __39__TUIKeyplaneView_updateSplitProgress___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __39__TUIKeyplaneView_updateSplitProgress___block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v2 = objc_msgSend(*(id *)(a1 + 32), "keyRowViews", 0);
  double v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if ([*(id *)(a1 + 32) isCurrentlySplit]) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = 2;
        }
        [v8 updateKeysInRowWithStyle:v9 factory:0];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)prepareForSplitTransition
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (![(TUIKeyplaneView *)self isInSplitTransition])
  {
    [(TUIKeyplaneView *)self deactivateKeys];
    [(TUIKeyplaneView *)self createSplitLayoutIfNeeded];
    [(TUIKeyplaneView *)self sizeFromScreenTraitsAndClass];
    -[TUIKeyplaneView setUnsplitSize:](self, "setUnsplitSize:");
    [(TUIKeyplaneView *)self unsplitSize];
    double v4 = v3;
    [(TUIKeyplaneView *)self leftSplitSize];
    double v6 = v5;
    [(TUIKeyplaneView *)self rightSplitSize];
    double v8 = (v4 - (v6 + v7)) * 0.5;
    BOOL v9 = [(TUIKeyplaneView *)self isCurrentlySplit];
    [(TUIKeyplaneView *)self leftSplitSize];
    if (v9) {
      double v11 = -0.0;
    }
    else {
      double v11 = v8;
    }
    double v12 = v10 + v11;
    BOOL v13 = [(TUIKeyplaneView *)self isCurrentlySplit];
    [(TUIKeyplaneView *)self rightSplitSize];
    if (v13) {
      double v15 = -0.0;
    }
    else {
      double v15 = v8;
    }
    double v16 = v14 + v15;
    double v17 = [(TUIKeyplaneView *)self leftSplitWidth];
    [v17 setConstant:v12];

    uint64_t v18 = [(TUIKeyplaneView *)self rightSplitWidth];
    [v18 setConstant:v16];

    [(TUIKeyplaneView *)self leftSplitSize];
    double v20 = v19;
    [(TUIKeyplaneView *)self rightSplitSize];
    double v22 = vabdd_f64(v20, v21) + 20.0;
    [(TUIKeyplaneView *)self transitionProgress];
    double v24 = v23 * v22;
    uint64_t v25 = [(TUIKeyplaneView *)self keySizeSpacer];
    [v25 setConstant:v24];

    uint64_t v26 = [(TUIKeyplaneView *)self keySizeSpacer];
    LODWORD(v27) = 1148829696;
    [v26 setPriority:v27];

    [(TUIKeyplaneView *)self _regenerateFactoryPreservingUpdates:0];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v28 = [(TUIKeyplaneView *)self keyRowViews];
    v29 = [v28 allValues];

    uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v43 != v32) {
            objc_enumerationMutation(v29);
          }
          double v34 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          int64_t v35 = [(TUIKeyplaneView *)self keyLayoutStyle];
          double v36 = [(TUIKeyplaneView *)self factory];
          [v34 updateKeysInRowWithStyle:v35 factory:v36];

          [v34 updateKeysForTransition:1];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v31);
    }

    double v37 = [(TUIKeyplaneView *)self bottomSpacing];
    [v37 setActive:0];

    double v38 = [(TUIKeyplaneView *)self splitSpacing];
    [v38 setActive:0];

    double v39 = [(TUIKeyplaneView *)self keySizeSpacer];
    [v39 setActive:1];

    double v40 = [(TUIKeyplaneView *)self leftSplitWidth];
    [v40 setActive:1];

    v41 = [(TUIKeyplaneView *)self rightSplitWidth];
    [v41 setActive:1];

    [(TUIKeyplaneView *)self setIsInSplitTransition:1];
  }
}

- (void)createSplitLayoutIfNeeded
{
  void v64[5] = *MEMORY[0x1E4F143B8];
  if ([(TUIKeyplaneView *)self supportsSplit])
  {
    [(TUIKeyplaneView *)self sizeFromScreenTraitsAndClass];
    -[TUIKeyplaneView setUnsplitSize:](self, "setUnsplitSize:");
    uint64_t v3 = [(TUIKeyplaneView *)self leftSplitWidth];
    if (v3)
    {
      double v4 = (void *)v3;
      uint64_t v5 = [(TUIKeyplaneView *)self rightSplitWidth];
      if (v5)
      {
        double v6 = (void *)v5;
        double v7 = [(TUIKeyplaneView *)self splitTransitionLayoutGuides];
        uint64_t v8 = [v7 count];

        if (v8) {
          return;
        }
      }
      else
      {
      }
    }
    BOOL v9 = [(TUIKeyplaneView *)self splitTransitionLayoutGuides];

    if (!v9)
    {
      double v10 = [MEMORY[0x1E4F1CA60] dictionary];
      [(TUIKeyplaneView *)self setSplitTransitionLayoutGuides:v10];
    }
    double v11 = [(TUIKeyplaneView *)self splitTransitionLayoutGuides];
    id v12 = [v11 objectForKey:@"TUIKBSplitGuide_Middle"];

    BOOL v13 = v12 == 0;
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4FB1940]);
      [v12 setIdentifier:@"TUIKBSplitGuide_Middle"];
      double v14 = [(TUIKeyplaneView *)self splitTransitionLayoutGuides];
      [v14 setObject:v12 forKey:@"TUIKBSplitGuide_Middle"];
    }
    [(TUIKeyplaneView *)self addLayoutGuide:v12];
    double v15 = [(TUIKeyplaneView *)self splitTransitionLayoutGuides];
    id v16 = [v15 objectForKey:@"TUIKBSplitGuide_Left"];

    if (!v16)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4FB1940]);
      [v16 setIdentifier:@"TUIKBSplitGuide_Left"];
      double v17 = [(TUIKeyplaneView *)self splitTransitionLayoutGuides];
      [v17 setObject:v16 forKey:@"TUIKBSplitGuide_Left"];

      BOOL v13 = 1;
    }
    [(TUIKeyplaneView *)self addLayoutGuide:v16];
    uint64_t v18 = [(TUIKeyplaneView *)self splitTransitionLayoutGuides];
    id v19 = [v18 objectForKey:@"TUIKBSplitGuide_Right"];

    if (!v19)
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4FB1940]);
      [v19 setIdentifier:@"TUIKBSplitGuide_Right"];
      double v20 = [(TUIKeyplaneView *)self splitTransitionLayoutGuides];
      [v20 setObject:v19 forKey:@"TUIKBSplitGuide_Right"];

      BOOL v13 = 1;
    }
    [(TUIKeyplaneView *)self addLayoutGuide:v19];
    double v21 = [(TUIKeyplaneView *)self splitTransitionLayoutGuides];
    id v22 = [v21 objectForKey:@"TUIKBSplitGuide_Padding"];

    if (!v22)
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4FB1940]);
      [v22 setIdentifier:@"TUIKBSplitGuide_Padding"];
      double v23 = [(TUIKeyplaneView *)self splitTransitionLayoutGuides];
      [v23 setObject:v22 forKey:@"TUIKBSplitGuide_Padding"];
    }
    [(TUIKeyplaneView *)self addLayoutGuide:v22];
    if (v13)
    {
      double v56 = (void *)MEMORY[0x1E4F28DC8];
      long long v62 = [v16 leftAnchor];
      long long v61 = [(TUIKeyplaneView *)self leftAnchor];
      long long v60 = [v62 constraintEqualToAnchor:v61];
      v64[0] = v60;
      v59 = [v12 leftAnchor];
      v58 = [v16 rightAnchor];
      v57 = [v59 constraintEqualToAnchor:v58];
      v64[1] = v57;
      double v55 = [v22 leftAnchor];
      double v54 = [v19 leftAnchor];
      double v53 = [v55 constraintEqualToAnchor:v54];
      v64[2] = v53;
      double v52 = [v12 rightAnchor];
      double v24 = [v22 rightAnchor];
      uint64_t v25 = [v52 constraintEqualToAnchor:v24 constant:0.0];
      v64[3] = v25;
      [(TUIKeyplaneView *)self rightAnchor];
      uint64_t v26 = v63 = v12;
      double v27 = [v19 rightAnchor];
      v28 = [v26 constraintEqualToAnchor:v27];
      v64[4] = v28;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:5];
      [v56 activateConstraints:v29];

      id v12 = v63;
    }
    [(TUIKeyplaneView *)self unsplitSize];
    double v31 = v30;
    [(TUIKeyplaneView *)self leftSplitSize];
    double v33 = v32;
    [(TUIKeyplaneView *)self rightSplitSize];
    double v35 = (v31 - (v33 + v34)) * 0.5;
    BOOL v36 = [(TUIKeyplaneView *)self isCurrentlySplit];
    [(TUIKeyplaneView *)self leftSplitSize];
    if (v36) {
      double v38 = -0.0;
    }
    else {
      double v38 = v35;
    }
    double v39 = v37 + v38;
    BOOL v40 = [(TUIKeyplaneView *)self isCurrentlySplit];
    [(TUIKeyplaneView *)self rightSplitSize];
    if (v40) {
      double v42 = -0.0;
    }
    else {
      double v42 = v35;
    }
    double v43 = v41 + v42;
    long long v44 = [v22 widthAnchor];
    long long v45 = [v44 constraintEqualToConstant:0.0];
    [(TUIKeyplaneView *)self setKeySizeSpacer:v45];

    double v46 = [v12 widthAnchor];
    uint64_t v47 = [v46 constraintEqualToConstant:0.0];
    [(TUIKeyplaneView *)self setSplitSpacing:v47];

    double v48 = [v16 widthAnchor];
    double v49 = [v48 constraintEqualToConstant:v39];
    [(TUIKeyplaneView *)self setLeftSplitWidth:v49];

    v50 = [v19 widthAnchor];
    double v51 = [v50 constraintEqualToConstant:v43];
    [(TUIKeyplaneView *)self setRightSplitWidth:v51];
  }
}

- (BOOL)isSplit
{
  BOOL v3 = [(TUIKeyplaneView *)self supportsSplit];
  if (v3)
  {
    BOOL v3 = [(TUIKeyplaneView *)self isCurrentlySplit];
    if (v3) {
      LOBYTE(v3) = ![(TUIKeyplaneView *)self isInSplitTransition];
    }
  }
  return v3;
}

- (BOOL)supportsSplit
{
  double v2 = [(TUIKeyplaneView *)self currentKeyplane];
  BOOL v3 = [v2 layoutClass] == 2;

  return v3;
}

- (CGRect)updateFrameForKey:(id)a3
{
  id v4 = a3;
  [v4 paddedFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  BOOL v13 = [(TUIKeyplaneView *)self viewForKey:v4];
  double v14 = v13;
  if (v13)
  {
    [v13 frame];
    CGFloat v15 = *MEMORY[0x1E4F1DB28];
    CGFloat v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v80.origin.x = *(CGFloat *)MEMORY[0x1E4F1DB28];
    v80.origin.y = v16;
    v80.size.double width = v17;
    v80.size.double height = v18;
    if (!CGRectEqualToRect(v76, v80))
    {
      id v19 = [(TUIKeyplaneView *)self keyRowViews];
      double v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "rowNumber"));
      double v21 = [v19 objectForKey:v20];

      [v14 frame];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v30 = [v14 superview];

      if (v30 == v21)
      {
        [v14 frame];
        -[TUIKeyplaneView convertRect:fromView:](self, "convertRect:fromView:", v21);
        double v23 = v31;
        double v25 = v32;
        double v27 = v33;
        double v29 = v34;
      }
      [(TUIKeyplaneView *)self keycapInsets];
      double v74 = v25;
      double v75 = v23;
      double v72 = v29;
      double v73 = v27;
      double v70 = v36;
      double v71 = v35;
      double v68 = v38;
      double v69 = v37;
      UIRectInset();
      double v6 = v40;
      double v8 = v41;
      double v10 = v39;
      double v12 = v42;
      if (v42 <= 0.0 || v39 <= 0.0) {
        goto LABEL_29;
      }
      if ([v14 layoutShape] != 2)
      {
        objc_msgSend(v4, "setFrame:", v75, v74, v73, v72);
        objc_msgSend(v4, "setPaddedFrame:", v6, v8, v10, v12);
LABEL_28:
        objc_msgSend(v14, "setDrawFrame:", v6, v8, v10, v12);
        [v14 setNeedsDisplay];
        [v14 prepareForDisplay];
LABEL_29:

        goto LABEL_30;
      }
      [v4 paddedFrame];
      v81.origin.x = v15;
      v81.origin.y = v16;
      v81.size.double width = v17;
      v81.size.double height = v18;
      if (CGRectEqualToRect(v77, v81) || ([v4 frame], double v44 = v43, objc_msgSend(v14, "frame"), v44 != v45))
      {
        objc_msgSend(v4, "setFrame:", v75, v74, v73, v72);
        objc_msgSend(v4, "setPaddedFrame:", v6, v8, v10, v12);
      }
      double v46 = [(TUIKeyplaneView *)self currentKeyplane];
      uint64_t v47 = [v4 name];
      double v48 = [v46 keysForName:v47];

      if ((unint64_t)[v48 count] < 2)
      {
LABEL_27:

        goto LABEL_28;
      }
      double v49 = [v48 firstObject];
      v50 = [v48 lastObject];
      char v51 = [v4 isEqual:v49];
      double v52 = v50;
      if ((v51 & 1) == 0 && (v53 = [v4 isEqual:v50], double v52 = v49, !v53)
        || ([(TUIKeyplaneView *)self viewForKey:v52], (uint64_t v54 = objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_26:

        goto LABEL_27;
      }
      long long v67 = (void *)v54;
      double v55 = objc_msgSend(v14, "shapeWhenMergedWithKey:insets:", v71, v70, v69, v68);
      char v56 = [v55 isEmpty];
      v57 = [(TUIKeyplaneView *)self currentKeyplane];
      int v58 = [v57 isGridLayout];
      int v59 = v58;
      if (v56)
      {
        if (v58)
        {
          v78.origin.x = v6;
          v78.origin.y = v8;
          v78.size.double width = v10;
          v78.size.double height = v12;
          BOOL IsEmpty = CGRectIsEmpty(v78);

          long long v61 = v55;
          long long v62 = v67;
          if (!IsEmpty)
          {
            objc_msgSend(v49, "setFrame:", v75, v74, v73, v72);
            objc_msgSend(v49, "setPaddedFrame:", v6, v8, v10, v12);
            objc_msgSend(v50, "setFrame:", v75, v74, v73, v72);
            objc_msgSend(v50, "setPaddedFrame:", v6, v8, v10, v12);
          }
          goto LABEL_25;
        }

        long long v61 = v55;
      }
      else
      {

        long long v61 = v55;
        if (v59)
        {
          [v55 frame];
          objc_msgSend(v49, "setFrame:");
          [v55 paddedFrame];
          objc_msgSend(v49, "setPaddedFrame:");
          [v55 frame];
          objc_msgSend(v50, "setFrame:");
          [v55 paddedFrame];
          objc_msgSend(v50, "setPaddedFrame:");
        }
        else
        {
          [v49 setShape:v55];
          [v50 setShape:v55];
        }
      }
      long long v62 = v67;
LABEL_25:

      goto LABEL_26;
    }
  }
LABEL_30:

  double v63 = v6;
  double v64 = v8;
  double v65 = v10;
  double v66 = v12;
  result.size.double height = v66;
  result.size.double width = v65;
  result.origin.y = v64;
  result.origin.x = v63;
  return result;
}

- (UIEdgeInsets)keyplaneInsets
{
  uint64_t v3 = MEMORY[0x1E4FB2848];
  double v4 = *MEMORY[0x1E4FB2848];
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  double v7 = [(TUIKeyplaneView *)self currentKeyplane];
  uint64_t v8 = [v7 effectsType];

  if (v8 == 1)
  {
    double v9 = *(double *)(v3 + 8);
  }
  else
  {
    [(TUIKeyplaneView *)self keycapInsets];
    double v9 = v14;
    CGFloat v15 = [(TUIKeyplaneView *)self screenTraits];
    int v16 = [v15 isKeyboardMinorEdgeWidth];

    if (v16) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 4;
    }
    [MEMORY[0x1E4FB1900] deviceSpecificPaddingForInterfaceOrientation:v17 inputMode:0];
    double v19 = v18;
    double v20 = [(TUIKeyplaneView *)self currentKeyplane];
    uint64_t v21 = [v20 layoutClass];

    switch(v21)
    {
      case 1:
        [(TUIKeyplaneView *)self preferredSize];
        if (v22 <= 400.0)
        {
          int v24 = 0;
        }
        else
        {
          double v23 = [(TUIKeyplaneView *)self screenTraits];
          int v24 = [v23 isKeyboardMinorEdgeWidth];
        }
        double v33 = 10.0;
        if (v19 >= 10.0)
        {
          if (!v16) {
            double v33 = 16.0;
          }
          if (v24) {
            double v6 = 12.0;
          }
          else {
            double v6 = v33;
          }
        }
        else
        {
          if (v24) {
            double v34 = 2.0;
          }
          else {
            double v34 = 1.0;
          }
          [(TUIKeyplaneView *)self keycapInsets];
          double v6 = v34 - v35;
          if ([(TUIKeyplaneView *)self currentHandBias]) {
            char v36 = v16;
          }
          else {
            char v36 = 0;
          }
          if ((v36 & 1) == 0)
          {
            if (v16) {
              double v5 = 0.0;
            }
            else {
              double v5 = 68.0;
            }
            [(TUIKeyplaneView *)self keycapInsets];
            double v9 = v5 + v37;
          }
        }
        double v38 = 5.0;
        if (v24) {
          double v38 = 0.0;
        }
        if (v16) {
          double v4 = 7.0;
        }
        else {
          double v4 = v38;
        }
        if ([(TUIKeyplaneView *)self currentHandBias]) {
          int v39 = v16;
        }
        else {
          int v39 = 0;
        }
        if (v39 == 1)
        {
          [(TUIKeyplaneView *)self preferredSize];
          if (v40 <= 0.0)
          {
            [(TUIKeyplaneView *)self bounds];
            double v41 = v47;
          }
          else
          {
            [(TUIKeyplaneView *)self preferredSize];
          }
          double v42 = v41 - *MEMORY[0x1E4FB3380];
          if ([(TUIKeyplaneView *)self currentHandBias] == 2)
          {
            [(TUIKeyplaneView *)self keycapInsets];
            double v9 = v48;
          }
          else if ([(TUIKeyplaneView *)self currentHandBias] == 1)
          {
            double v9 = v42;
            double v42 = 0.0;
          }
          else
          {
            double v42 = v5;
          }
        }
        else
        {
          double v42 = v5;
        }
        if ([(TUIKeyplaneView *)self isFloating])
        {
          double v4 = v4 + 3.0;
          double v9 = v9 * 0.5;
          [(TUIKeyplaneView *)self keycapInsets];
          double v50 = v49 * 0.5;
          char v51 = [(TUIKeyplaneView *)self trailingTieConstraint];
          [v51 setConstant:v50];
        }
        double v5 = v42;
        break;
      case 2:
        if (v19 + -3.0 >= 0.0) {
          double v6 = v19 + -3.0;
        }
        else {
          double v6 = 0.0;
        }
        if (v16) {
          double v4 = 7.0;
        }
        else {
          double v4 = 10.0;
        }
        [(TUIKeyplaneView *)self keycapInsets];
        double v31 = v30;
        double v32 = [(TUIKeyplaneView *)self trailingTieConstraint];
        [v32 setConstant:v31];

        double v5 = v31 * 0.5;
        double v9 = v5;
        break;
      case 3:
        if (v19 + -3.0 >= 0.0) {
          double v6 = v19 + -3.0;
        }
        else {
          double v6 = 0.0;
        }
        if (v16) {
          double v4 = 7.0;
        }
        else {
          double v4 = 10.0;
        }
        [(TUIKeyplaneView *)self keycapInsets];
        double v9 = v9 + v25 * 0.5;
        [(TUIKeyplaneView *)self keycapInsets];
        double v5 = v5 + v26 * 0.5;
        break;
      case 4:
        if (v16) {
          double v4 = 5.0;
        }
        else {
          double v4 = 7.0;
        }
        double v6 = v19 - v4;
        if (v19 - v4 < 0.0)
        {
          double v27 = v6 * 0.5;
          double v28 = [(TUIKeyplaneView *)self screenTraits];
          int v29 = [v28 isKeyboardMinorEdgeWidth];

          if (v29) {
            double v6 = v27 + 0.5;
          }
          else {
            double v6 = v27 + -0.5;
          }
        }
        [(TUIKeyplaneView *)self keycapInsets];
        double v9 = v43 * 0.5;
        [(TUIKeyplaneView *)self keycapInsets];
        double v45 = v44 * 0.5;
        double v46 = [(TUIKeyplaneView *)self trailingTieConstraint];
        [v46 setConstant:v45];

        break;
      default:
        break;
    }
  }
  double v10 = v4;
  double v11 = v9;
  double v12 = v6;
  double v13 = v5;
  result.double right = v13;
  result.double bottom = v12;
  result.double left = v11;
  result.double top = v10;
  return result;
}

- (UIEdgeInsets)keycapInsets
{
  [(TUIKeyplaneView *)self standardKeyInsets];
  if (v6 == *(double *)(MEMORY[0x1E4FB2848] + 8)
    && v3 == *MEMORY[0x1E4FB2848]
    && v5 == *(double *)(MEMORY[0x1E4FB2848] + 24)
    && v4 == *(double *)(MEMORY[0x1E4FB2848] + 16))
  {
    double v10 = [(TUIKeyplaneView *)self factory];
    double v11 = [(TUIKeyplaneView *)self currentKeyplane];
    objc_msgSend(v10, "dynamicInsetsForNumberOfRows:", objc_msgSend(v11, "numberOfRows"));
    -[TUIKeyplaneView setStandardKeyInsets:](self, "setStandardKeyInsets:");
  }
  [(TUIKeyplaneView *)self standardKeyInsets];
  result.double right = v15;
  result.double bottom = v14;
  result.double left = v13;
  result.double top = v12;
  return result;
}

- (void)setOverrideScreenTraits:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v5 = (UIKBScreenTraits *)a3;
  if (self->_screenTraits == v5)
  {
    [(TUIKeyplaneView *)self _generateFactoryIfNeeded];
  }
  else
  {
    objc_storeStrong((id *)&self->_screenTraits, a3);
    factory = self->_factory;
    self->_factory = 0;

    [(TUIKeyplaneView *)self _generateFactoryIfNeeded];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v7 = [(TUIKeyplaneView *)self keyRowViews];
    uint64_t v8 = [v7 allValues];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          int64_t v14 = [(TUIKeyplaneView *)self keyLayoutStyle];
          double v15 = [(TUIKeyplaneView *)self factory];
          [v13 updateKeysInRowWithStyle:v14 factory:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }
  }
  [(TUIKeyplaneView *)self sizeFromScreenTraitsAndClass];
  double v17 = v16;
  double v19 = v18;
  if (![(TUIKeyplaneView *)self isCurrentlySplit]
    && ![(TUIKeyplaneView *)self isInSplitTransition])
  {
    [(TUIKeyplaneView *)self preferredSize];
    if (v17 != v21 || v19 != v20)
    {
      double v22 = [(TUIKeyplaneView *)self screenTraits];
      [v22 keyboardWidth];
      double v24 = v23;

      if (v24 > 0.0) {
        -[TUIKeyplaneView updateToSize:](self, "updateToSize:", v17, v19);
      }
    }
  }
}

- (UIKBRenderFactory)factory
{
  [(TUIKeyplaneView *)self _generateFactoryIfNeeded];
  double v3 = [(TUIKeyplaneView *)self screenTraits];
  if ([v3 isKeyboardMinorEdgeWidth])
  {
    p_factory = &self->_factory;
    [(UIKBRenderFactory *)*p_factory setDynamicFactory:1];
  }
  else
  {
    double v5 = [(TUIKeyplaneView *)self screenTraits];
    BOOL v6 = ([v5 isFloating] & 1) != 0 || -[TUIKeyplaneView currentHandBias](self, "currentHandBias") != 0;
    p_factory = &self->_factory;
    [(UIKBRenderFactory *)*p_factory setDynamicFactory:v6];
  }
  double v7 = *p_factory;
  return v7;
}

- (void)_regenerateFactoryPreservingUpdates:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  factory = self->_factory;
  if (factory && a3)
  {
    uint64_t v5 = [(UIKBRenderFactory *)factory preferStringKeycapOverImage];
    uint64_t v6 = [(UIKBRenderFactory *)self->_factory allowsPaddles];
    [(UIKBRenderFactory *)self->_factory stretchFactor];
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = self->_factory;
    self->_factory = 0;

    [(TUIKeyplaneView *)self _generateFactoryIfNeeded];
    [(UIKBRenderFactory *)self->_factory setPreferStringKeycapOverImage:v5];
    [(UIKBRenderFactory *)self->_factory setAllowsPaddles:v6];
    -[UIKBRenderFactory setStretchFactor:](self->_factory, "setStretchFactor:", v8, v10);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v12 = [(TUIKeyplaneView *)self keyRowViews];
    double v13 = [v12 allValues];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          double v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          int64_t v19 = [(TUIKeyplaneView *)self keyLayoutStyle];
          double v20 = [(TUIKeyplaneView *)self factory];
          [v18 updateKeysInRowWithStyle:v19 factory:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }
  }
  else
  {
    self->_factory = 0;

    [(TUIKeyplaneView *)self _generateFactoryIfNeeded];
  }
}

- (void)_generateFactoryIfNeeded
{
  if (self->_factory) {
    return;
  }
  -[TUIKeyplaneView setStandardKeyInsets:](self, "setStandardKeyInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [(TUIKeyplaneView *)self _generateRenderingContextIfNeeded];
  uint64_t v3 = [(UIKBTree *)self->_keyplane visualStyling];
  BOOL v4 = [(TUIKeyplaneView *)self isCurrentlySplit];
  uint64_t v5 = 128;
  if (!v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v3 & 0xFFFFFFFFFFFFFF3FLL | v5 | 0x40;
  [(UIKBTree *)self->_keyplane setVisualStyling:v6];
  double v7 = [(TUIKeyplaneView *)self renderingContext];
  [v7 setHandBias:0];

  double v8 = (void *)MEMORY[0x1E4FB18A0];
  double v9 = [(TUIKeyplaneView *)self renderingContext];
  double v10 = [v8 factoryForVisualStyle:v6 renderingContext:v9];
  factory = self->_factory;
  self->_factory = v10;

  double v12 = [(TUIKeyplaneView *)self screenTraits];
  double v13 = [v12 screen];
  [v13 scale];
  -[UIKBRenderFactory setScale:](self->_factory, "setScale:");

  uint64_t v14 = UIKeyboardGetCurrentInputMode();
  [(UIKBRenderFactory *)self->_factory setPreferStringKeycapOverImage:UIKeyboardUIPreferStringOverImageForInputMode()];

  -[UIKBRenderFactory setStretchFactor:](self->_factory, "setStretchFactor:", 1.0, 1.0);
  uint64_t v15 = [(TUIKeyplaneView *)self screenTraits];
  [v15 stretchFactor];
  if (v16 == 1.0) {
    goto LABEL_9;
  }
  double v17 = [(TUIKeyplaneView *)self screenTraits];
  [v17 stretchFactor];
  if (v18 <= 0.0)
  {

    goto LABEL_9;
  }
  int64_t v19 = [(TUIKeyplaneView *)self screenTraits];
  char v20 = [v19 isFloating];

  if ((v20 & 1) == 0)
  {
    uint64_t v15 = [(TUIKeyplaneView *)self screenTraits];
    [v15 stretchFactor];
    -[UIKBRenderFactory setStretchFactor:](self->_factory, "setStretchFactor:");
LABEL_9:
  }
  id v21 = [MEMORY[0x1E4FB1920] sharedPreferencesController];
  -[UIKBRenderFactory setAllowsPaddles:](self->_factory, "setAllowsPaddles:", [v21 BOOLForPreferenceKey:*MEMORY[0x1E4FAE780]]);
}

- (void)_generateRenderingContextIfNeeded
{
  if (!self->_renderingContext)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FB18A8];
    BOOL v4 = [(TUIKeyplaneView *)self keyplaneRenderConfig];
    uint64_t v5 = [v3 renderingContextForRenderConfig:v4];
    renderingContext = self->_renderingContext;
    self->_renderingContext = v5;
  }
  [(TUIKeyplaneView *)self _updateRenderingContext];
}

- (void)_updateRenderingContext
{
  uint64_t v3 = [MEMORY[0x1E4FB1900] activeInstance];
  BOOL v4 = [v3 textInputTraits];
  -[UIKBRenderingContext setKeyboardType:](self->_renderingContext, "setKeyboardType:", [v4 keyboardType]);

  id v6 = [(TUIKeyplaneView *)self screenTraits];
  if (v6)
  {
    uint64_t v5 = [(TUIKeyplaneView *)self screenTraits];
    -[UIKBRenderingContext setIsFloating:](self->_renderingContext, "setIsFloating:", [v5 isFloating]);
  }
  else
  {
    [(UIKBRenderingContext *)self->_renderingContext setIsFloating:[(UIKBTree *)self->_keyplane isFloating]];
  }
}

- (void)setRenderingContext:(id)a3
{
  id v8 = a3;
  int v5 = [v8 isFloating];
  int v6 = [(UIKBRenderingContext *)self->_renderingContext isFloating];
  objc_storeStrong((id *)&self->_renderingContext, a3);
  [(TUIKeyplaneView *)self _generateRenderingContextIfNeeded];
  if (v5 == v6 && (factory = self->_factory) != 0) {
    [(UIKBRenderFactory *)factory setRenderingContext:self->_renderingContext];
  }
  else {
    [(TUIKeyplaneView *)self _regenerateFactoryPreservingUpdates:0];
  }
}

- (id)keyplaneRenderConfig
{
  renderConfig = self->_renderConfig;
  if (!renderConfig)
  {
    BOOL v4 = [(TUIKeyplaneView *)self renderConfigForCurrentTraitCollection];
    int v5 = self->_renderConfig;
    self->_renderConfig = v4;

    renderConfig = self->_renderConfig;
  }
  return renderConfig;
}

- (void)setRenderConfig:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  renderConfig = self->_renderConfig;
  if (renderConfig)
  {
    int v6 = [(UIKBRenderConfig *)renderConfig lightKeyboard];
    int v7 = v6 ^ [v4 lightKeyboard] ^ 1;
    if (v4)
    {
LABEL_3:
      id v8 = (UIKBRenderConfig *)v4;
      goto LABEL_6;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
    if (v4) {
      goto LABEL_3;
    }
  }
  id v8 = [(TUIKeyplaneView *)self renderConfigForCurrentTraitCollection];
LABEL_6:
  double v9 = self->_renderConfig;
  self->_renderConfig = v8;

  double v10 = [(UIKBRenderFactory *)self->_factory renderingContext];

  if (v10)
  {
    uint64_t v11 = self->_renderConfig;
    double v12 = [(UIKBRenderFactory *)self->_factory renderingContext];
    [v12 setRenderConfig:v11];
  }
  else
  {
    double v12 = [MEMORY[0x1E4FB18A8] renderingContextForRenderConfig:self->_renderConfig];
    double v13 = [(TUIKeyplaneView *)self screenTraits];
    if (v13)
    {
      uint64_t v14 = [(TUIKeyplaneView *)self screenTraits];
      objc_msgSend(v12, "setIsFloating:", objc_msgSend(v14, "isFloating"));
    }
    else
    {
      objc_msgSend(v12, "setIsFloating:", -[UIKBTree isFloating](self->_keyplane, "isFloating"));
    }

    [(UIKBRenderFactory *)self->_factory setRenderingContext:v12];
  }

  if (v4) {
    char v15 = v7;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0) {
    [(TUIKeyplaneView *)self setNeedsDisplay];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v16 = [(TUIKeyplaneView *)self keyRowViews];
  double v17 = [v16 allValues];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v22 setRenderConfig:self->_renderConfig];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v19);
  }
}

- (id)renderConfigForCurrentTraitCollection
{
  double v2 = [(TUIKeyplaneView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  if (v3 == 2) {
    [MEMORY[0x1E4FB1898] darkConfig];
  }
  else {
  id v4 = [MEMORY[0x1E4FB1898] defaultConfig];
  }
  return v4;
}

- (id)viewForBaseKey:(id)a3
{
  id v4 = [(TUIKeyplaneView *)self cacheIdentifierForKey:a3 withState:2];
  int v5 = [(TUIKeyplaneView *)self storedKeyViews];
  int v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)keyViewForTree:(id)a3
{
  id v4 = a3;
  int v5 = -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v4, [v4 state]);
  int v6 = [(TUIKeyplaneView *)self storedKeyViews];
  int v7 = [v6 objectForKey:v5];

  if ([v4 displayTypeHint] == 10 && !v7)
  {
    uint64_t v8 = [(TUIKeyplaneView *)self cacheIdentifierForKey:v4 withState:4];

    double v9 = [(TUIKeyplaneView *)self storedKeyViews];
    int v7 = [v9 objectForKey:v8];

    int v5 = (void *)v8;
  }

  return v7;
}

- (id)cachedVariantViewForTree:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int v7 = [(TUIKeyplaneView *)self cacheIdentifierForKey:v6 withState:v4];
  uint64_t v8 = [(TUIKeyplaneView *)self storedVariantViews];
  double v9 = [v8 objectForKey:v7];

  if (v9)
  {
    double v10 = [(TUIKeyplaneView *)self factory];
    uint64_t v11 = [(TUIKeyplaneView *)self keyplane];
    double v12 = [v10 traitsForKey:v6 onKeyplane:v11];

    [v9 setRenderTraits:v12];
    double v13 = [(TUIKeyplaneView *)self renderConfig];
    [v9 updateBackgroundMaterialsForRenderConfig:v13];

    [v9 setTouchesForwardingView:self];
  }

  return v9;
}

- (id)cachedVariantViewForTree:(id)a3
{
  return [(TUIKeyplaneView *)self cachedVariantViewForTree:a3 state:16];
}

- (id)variantViewForKey:(id)a3 cacheID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v8 = [v6 backingTree];
    double v9 = [v6 backingTree];
    -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v8, [v9 state]);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v10 = [(TUIKeyplaneView *)self storedVariantViews];
  uint64_t v11 = [v10 objectForKey:v7];

  double v12 = [(TUIKeyplaneView *)self factory];
  double v13 = [v6 backingTree];
  uint64_t v14 = [(TUIKeyplaneView *)self keyplane];
  char v15 = [v12 traitsForKey:v13 onKeyplane:v14];

  if (v11)
  {
    [v11 setRenderTraits:v15];
  }
  else
  {
    uint64_t v11 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "selectorViewClassForKey:", v6)), "initWithKey:renderTraits:", v6, v15);
    double v16 = [(TUIKeyplaneView *)self storedVariantViews];
    [v16 setObject:v11 forKey:v7];
  }
  double v17 = [(TUIKeyplaneView *)self renderConfig];
  [v11 updateBackgroundMaterialsForRenderConfig:v17];

  [v11 setTouchesForwardingView:self];
  return v11;
}

- (BOOL)_shouldAllowKey:(id)a3
{
  id v4 = a3;
  if (![v4 visible]) {
    goto LABEL_6;
  }
  int v5 = [(UIKBTree *)self->_keyplane keys];
  if (![v5 containsObject:v4])
  {
    id v6 = [v4 parentKey];

    if (v6) {
      goto LABEL_5;
    }
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }

LABEL_5:
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (int)stateForKey:(id)a3
{
  return [a3 state];
}

- (void)removeKeyFromDelayedDeactivationSet:(id)a3
{
  id v8 = a3;
  if (v8 && [(NSMutableDictionary *)self->_delayedDeactivationKeys count])
  {
    id v4 = [(TUIKeyplaneView *)self currentKeyplane];
    uint64_t v5 = [v4 effectsType];

    if (v5 == 1) {
      [v8 setSelectedVariantIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    delayedDeactivationKeys = self->_delayedDeactivationKeys;
    BOOL v7 = [v8 name];
    [(NSMutableDictionary *)delayedDeactivationKeys removeObjectForKey:v7];
  }
}

- (void)addKeyToDelayedDeactivationSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 displayTypeHint] == 10)
    {
      id v6 = [(TUIKeyplaneView *)self viewForKey:v5];
      [v6 endingTransitionDuration];
      double v7 = 0.059;
      if (v8 > 0.059)
      {
        [v6 endingTransitionDuration];
        double v7 = v9;
      }
    }
    else
    {
      double v7 = 0.059;
    }
    delayedDeactivationKeys = self->_delayedDeactivationKeys;
    uint64_t v11 = [v5 name];
    [(NSMutableDictionary *)delayedDeactivationKeys setObject:v5 forKey:v11];

    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__TUIKeyplaneView_addKeyToDelayedDeactivationSet___block_invoke;
    v13[3] = &unk_1E55942D8;
    v13[4] = self;
    id v14 = v5;
    dispatch_after(v12, MEMORY[0x1E4F14428], v13);
  }
}

void __50__TUIKeyplaneView_addKeyToDelayedDeactivationSet___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 720);
  uint64_t v3 = [*(id *)(a1 + 40) name];
  id v7 = [v2 objectForKey:v3];

  id v4 = v7;
  if (v7)
  {
    uint64_t v5 = [*(id *)(a1 + 32) currentKeyplane];
    if ([v5 effectsType] == 1
      && [MEMORY[0x1E4FB18E0] isKeyboardProcess]
      && [v7 interactionType] == 14)
    {
      int v6 = [v7 state];

      if (v6 == 8)
      {
        [*(id *)(a1 + 32) removeKeyFromDelayedDeactivationSet:v7];
LABEL_9:
        id v4 = v7;
        goto LABEL_10;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) setState:2 forKey:v7];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)deactivateAdaptiveKey:(id)a3
{
  id v4 = a3;
  [(TUIKeyplaneView *)self setState:2 forKey:v4];
  [(TUIKeyplaneView *)self removeKeyFromDelayedDeactivationSet:v4];
  -[TUIKeyplaneView deactivateKey:previousState:](self, "deactivateKey:previousState:", v4, [v4 state]);
}

- (void)deactivateKeys
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v4 = [(NSMutableDictionary *)self->_delayedDeactivationKeys allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    double v2 = *(void **)v36;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void **)v36 != v2) {
          objc_enumerationMutation(v4);
        }
        [(TUIKeyplaneView *)self setState:2 forKey:*(void *)(*((void *)&v35 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v6);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v8 = [(TUIKeyplaneView *)self storedKeyViews];
  double v9 = [v8 allValues];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        char v15 = [v14 key];
        int v16 = [v15 state];

        if (v16 == 16 || v16 == 4)
        {
          double v2 = [v14 key];
          int v18 = [v2 avoidAutoDeactivation] ^ 1;
        }
        else
        {
          int v18 = 0;
        }
        if (v16 == 16 || v16 == 4) {

        }
        if (v18)
        {
          uint64_t v20 = [v14 key];
          [(TUIKeyplaneView *)self setState:2 forKey:v20];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v11);
  }

  id v21 = [(TUIKeyplaneView *)self activeKey];

  if (v21)
  {
    long long v22 = [(TUIKeyplaneView *)self activeKey];
    long long v23 = [(TUIKeyplaneView *)self activeKey];
    long long v24 = [v23 backingTree];
    long long v25 = [(TUIKeyplaneView *)self cacheIdentifierForKey:v24 withState:16];
    long long v26 = [(TUIKeyplaneView *)self variantViewForKey:v22 cacheID:v25];

    if (v26)
    {
      [v26 bounds];
      if (!CGRectIsEmpty(v42))
      {
        long long v27 = [(TUIKeyplaneView *)self activeKey];
        uint64_t v28 = [v27 backingTree];
        [v28 setSelectedVariantIndex:0x7FFFFFFFFFFFFFFFLL];

        int v29 = [(TUIKeyplaneView *)self activeKey];
        uint64_t v30 = [v29 backingTree];
        [(TUIKeyplaneView *)self setState:2 forKey:v30];
      }
    }
    [(TUIKeyplaneView *)self setActiveKey:0];
  }
}

- (void)dimKeys:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(TUIKeyplaneView *)self storedKeyViews];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) dimKeyUsingOpacities:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)hitTestVariantKeyAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(TUIKeyplaneView *)self activeKey];
  uint64_t v7 = [v6 backingTree];
  int v8 = [v7 state];

  if (v8 == 16)
  {
    uint64_t v9 = [v6 backingTree];
    uint64_t v10 = [(TUIKeyplaneView *)self cachedVariantViewForTree:v9];

    uint64_t v11 = [v10 superview];
    if (v11
      && (long long v12 = (void *)v11, [v10 bounds], IsEmpty = CGRectIsEmpty(v17), v12, !IsEmpty))
    {
      -[TUIKeyplaneView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
      long long v14 = 0;
      if (objc_msgSend(v10, "pointInside:withEvent:", 0))
      {
        long long v14 = [v6 backingTree];
      }
    }
    else
    {
      long long v14 = 0;
    }
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

- (void)finishedSelectingVariantForKey:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v17 = a3;
  if ([v17 interactionType] == 9)
  {
    [(TUIKeyplaneView *)self removeKeyFromDelayedDeactivationSet:v17];
  }
  else
  {
    uint64_t v7 = [(TUIKeyplaneView *)self activeKey];
    int v8 = [v7 backingTree];

    uint64_t v9 = [(TUIKeyplaneView *)self activeKey];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      int v11 = [v8 state];

      if (v11 == 16)
      {
        long long v12 = [(TUIKeyplaneView *)self activeKey];
        long long v13 = [(TUIKeyplaneView *)self cacheIdentifierForKey:v8 withState:16];
        long long v14 = [(TUIKeyplaneView *)self variantViewForKey:v12 cacheID:v13];

        if (v14)
        {
          [v14 bounds];
          if (!CGRectIsEmpty(v19))
          {
            -[TUIKeyplaneView convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
            if (objc_msgSend(v14, "pointInside:withEvent:", 0))
            {
              [v14 finishVariantSelection];
            }
            else
            {
              [v8 setSelectedVariantIndex:0x7FFFFFFFFFFFFFFFLL];
              [(TUIKeyplaneView *)self setState:2 forKey:v8];
            }
          }
        }
      }
    }
    if (([v8 isEqual:v17] & 1) == 0 && objc_msgSend(v8, "state") == 16)
    {
      char v15 = [(TUIKeyplaneView *)self cachedVariantViewForTree:v17];
      uint64_t v16 = v15;
      if (v15)
      {
        [v15 bounds];
        if (!CGRectIsEmpty(v20))
        {
          -[TUIKeyplaneView convertPoint:toView:](self, "convertPoint:toView:", v16, x, y);
          if (objc_msgSend(v16, "pointInside:withEvent:", 0))
          {
            [v16 finishVariantSelection];
          }
          else
          {
            [v17 setSelectedVariantIndex:0x7FFFFFFFFFFFFFFFLL];
            [(TUIKeyplaneView *)self setState:2 forKey:v17];
          }
        }
      }
    }
  }
}

- (void)changingSelectedVariantForKey:(id)a3 atPoint:(CGPoint)a4 isDragging:(BOOL)a5
{
  double y = a4.y;
  double x = a4.x;
  id v29 = a3;
  uint64_t v9 = [(TUIKeyplaneView *)self activeKey];
  uint64_t v10 = [v9 backingTree];

  uint64_t v11 = [(TUIKeyplaneView *)self activeKey];
  if (v11)
  {
    long long v12 = (void *)v11;
    int v13 = [v10 state];

    if (v13 == 16)
    {
      long long v14 = [(TUIKeyplaneView *)self activeKey];
      char v15 = [(TUIKeyplaneView *)self cacheIdentifierForKey:v10 withState:16];
      uint64_t v16 = [(TUIKeyplaneView *)self variantViewForKey:v14 cacheID:v15];

      if (!v16) {
        goto LABEL_11;
      }
      [v16 bounds];
      if (CGRectIsEmpty(v31)) {
        goto LABEL_11;
      }
      -[TUIKeyplaneView convertPoint:toView:](self, "convertPoint:toView:", v16, x, y);
      double v18 = v17;
      double v20 = v19;
      id v21 = [(TUIKeyplaneView *)self currentKeyplane];
      if ([v21 effectsType] == 1 && a5)
      {
      }
      else
      {
        char v22 = objc_msgSend(v16, "pointInside:withEvent:", 0, v18, v20);

        if ((v22 & 1) == 0)
        {
          [v10 setSelectedVariantIndex:0x7FFFFFFFFFFFFFFFLL];
          [(TUIKeyplaneView *)self setState:2 forKey:v10];
          goto LABEL_11;
        }
      }
      objc_msgSend(v16, "updateSelectorForPoint:", v18, v20);
LABEL_11:
    }
  }
  if ([v10 state] == 16 && (objc_msgSend(v10, "isEqual:", v29) & 1) == 0)
  {
    long long v23 = [(TUIKeyplaneView *)self cachedVariantViewForTree:v29];
    long long v24 = v23;
    if (v23)
    {
      [v23 bounds];
      if (!CGRectIsEmpty(v32))
      {
        -[TUIKeyplaneView convertPoint:toView:](self, "convertPoint:toView:", v24, x, y);
        double v26 = v25;
        double v28 = v27;
        if (objc_msgSend(v24, "pointInside:withEvent:", 0))
        {
          objc_msgSend(v24, "updateSelectorForPoint:", v26, v28);
        }
        else
        {
          [v29 setSelectedVariantIndex:0x7FFFFFFFFFFFFFFFLL];
          [(TUIKeyplaneView *)self setState:2 forKey:v29];
        }
      }
    }
  }
}

- (void)changingSelectedVariantForKey:(id)a3 atPoint:(CGPoint)a4
{
}

- (void)tappedToDismissSelector
{
  uint64_t v3 = [(TUIKeyplaneView *)self activeKey];
  id v4 = [v3 backingTree];

  if (![(TUIKeyplaneView *)self dismissingKeyboardMenu]
    && [v4 interactionType] == 9)
  {
    uint64_t v5 = [(TUIKeyplaneView *)self viewForBaseKey:v4];
    uint64_t v6 = [v5 popupMenu];

    if (v6)
    {
      uint64_t v7 = [(TUIKeyplaneView *)self activeKey];
      int v8 = [(TUIKeyplaneView *)self cacheIdentifierForKey:v4 withState:16];
      uint64_t v9 = [(TUIKeyplaneView *)self variantViewForKey:v7 cacheID:v8];

      uint64_t v10 = [(TUIKeyplaneView *)self activeVariantViews];
      [v10 removeObject:v9];

      [(TUIKeyplaneView *)self setDismissingKeyboardMenu:1];
      [(TUIKeyplaneView *)self removeKeyFromDelayedDeactivationSet:v4];
      [(TUIKeyplaneView *)self setState:2 forKey:v4];
      uint64_t v11 = (void *)MEMORY[0x1E4FB1EB0];
      long long v12 = [(TUIKeyplaneView *)self currentKeyplane];
      if ([v12 layoutClass] == 1) {
        double v13 = 0.5;
      }
      else {
        double v13 = 0.1;
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __42__TUIKeyplaneView_tappedToDismissSelector__block_invoke;
      v18[3] = &unk_1E55942D8;
      id v19 = v5;
      id v20 = v9;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __42__TUIKeyplaneView_tappedToDismissSelector__block_invoke_2;
      v15[3] = &unk_1E5594240;
      v15[4] = self;
      id v16 = v19;
      id v17 = v20;
      id v14 = v20;
      [v11 animateWithDuration:50331648 delay:v18 options:v15 animations:v13 completion:0.0];
    }
    else
    {
      [(TUIKeyplaneView *)self setDismissingKeyboardMenu:0];
      [(TUIKeyplaneView *)self setState:2 forKey:v4];
    }
  }
}

uint64_t __42__TUIKeyplaneView_tappedToDismissSelector__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) popupMenu];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) popupMenu];
    [v3 setAlpha:0.0];
  }
  id v4 = *(void **)(a1 + 40);
  return [v4 setAlpha:0.0];
}

uint64_t __42__TUIKeyplaneView_tappedToDismissSelector__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setDismissingKeyboardMenu:0];
  double v2 = [*(id *)(a1 + 40) popupMenu];
  [v2 removeFromSuperview];

  uint64_t v3 = *(void **)(a1 + 48);
  return [v3 removeFromSuperview];
}

- (void)presentSelectorView:(id)a3 fromBaseKey:(id)a4
{
  v53[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v6 && v7)
  {
    id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v47 = [v6 baseKeyLayoutGuide];
    double v45 = [v47 topAnchor];
    double v43 = [v8 topAnchor];
    CGRect v42 = [v45 constraintEqualToAnchor:v43];
    v53[0] = v42;
    uint64_t v41 = [v6 baseKeyLayoutGuide];
    double v40 = [v41 leftAnchor];
    int v39 = [v8 leftAnchor];
    [(TUIKeyplaneView *)self keycapInsets];
    long long v38 = [v40 constraintEqualToAnchor:v39 constant:v9];
    v53[1] = v38;
    uint64_t v10 = [v8 bottomAnchor];
    [v6 baseKeyLayoutGuide];
    uint64_t v11 = v50 = v8;
    long long v12 = [v11 bottomAnchor];
    [(TUIKeyplaneView *)self keycapInsets];
    id v14 = [v10 constraintEqualToAnchor:v12 constant:v13];
    v53[2] = v14;
    char v15 = [v50 rightAnchor];
    id v16 = [v6 baseKeyLayoutGuide];
    id v17 = [v16 rightAnchor];
    [(TUIKeyplaneView *)self keycapInsets];
    id v19 = [v15 constraintEqualToAnchor:v17 constant:v18];
    v53[3] = v19;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];
    id v20 = v37 = self;
    [v49 addObjectsFromArray:v20];

    int v8 = v50;
    id v21 = [v50 popupMenu];

    if (v21)
    {
      [(TUIKeyplaneView *)v37 setDismissingKeyboardMenu:0];
      char v22 = [v50 popupMenu];
      [v22 setAlpha:1.0];
      [v6 setAlpha:1.0];
      [v22 frame];
      if (v23 < 0.0)
      {
        [v22 frame];
        [v22 setFrame:0.0];
      }
      [v6 setPopupDelegate:v37];
      long long v24 = [(TUIKeyplaneView *)v37 window];
      double v25 = [v24 rootViewController];
      double v26 = [v25 view];
      [v26 bringSubviewToFront:v22];

      double v44 = [v6 leadingAnchor];
      double v27 = [v22 leadingAnchor];
      double v48 = [v44 constraintEqualToAnchor:v27];
      v52[0] = v48;
      double v28 = [v6 topAnchor];
      id v29 = [v22 topAnchor];
      double v46 = v28;
      uint64_t v30 = [v28 constraintEqualToAnchor:v29];
      v52[1] = v30;
      CGRect v31 = [v6 trailingAnchor];
      CGRect v32 = [v22 trailingAnchor];
      long long v33 = [v31 constraintEqualToAnchor:v32];
      v52[2] = v33;
      long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
      long long v35 = v49;
      [v49 addObjectsFromArray:v34];

      long long v36 = v44;
      int v8 = v50;
    }
    else
    {
      char v22 = [v6 leadingAnchor];
      long long v36 = [(TUIKeyplaneView *)v37 keyboardContentView];
      double v27 = [v36 leadingAnchor];
      double v48 = [v22 constraintGreaterThanOrEqualToAnchor:v27];
      v51[0] = v48;
      double v46 = [(TUIKeyplaneView *)v37 keyboardContentView];
      id v29 = [v46 trailingAnchor];
      uint64_t v30 = [v6 trailingAnchor];
      CGRect v31 = [v29 constraintGreaterThanOrEqualToAnchor:v30];
      v51[1] = v31;
      CGRect v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
      long long v35 = v49;
      [v49 addObjectsFromArray:v32];
    }

    [MEMORY[0x1E4F28DC8] activateConstraints:v35];
  }
}

- (void)deactivateKey:(id)a3 previousState:(int)a4
{
  -[TUIKeyplaneView viewForKey:](self, "viewForKey:", a3, *(void *)&a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setNeedsDisplay];
}

- (void)setState:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unsigned int v64 = [v6 state];
  [v6 setState:v4];
  double v66 = v6;
  double v65 = -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v6, [v6 state]);
  int v7 = v4 == 16;
  if (v4 > 0x14 || ((1 << v4) & 0x110010) == 0) {
    [(TUIKeyplaneView *)self removeKeyFromDelayedDeactivationSet:v6];
  }
  int v8 = [(TUIKeyplaneView *)self viewForKey:v6];
  if ([v8 layoutShape] == 2)
  {
    double v9 = [(TUIKeyplaneView *)self currentKeyplane];
    uint64_t v10 = [v6 name];
    uint64_t v11 = [v9 keysForName:v10];

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v71 objects:v76 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v72 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          if ([v17 state] != v4) {
            [(TUIKeyplaneView *)self setState:v4 forKey:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v71 objects:v76 count:16];
      }
      while (v14);
    }
  }
  if (v4 == 4 && [v66 interactionType] == 2)
  {
    double v18 = [(TUIKeyplaneView *)self factory];
    int v7 = [v18 allowsPaddles];
  }
  if (v4 == 20) {
    int v19 = 1;
  }
  else {
    int v19 = v7;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v20 = [(TUIKeyplaneView *)self activeVariantViews];
  id v21 = (void *)[v20 copy];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v68 != v24) {
          objc_enumerationMutation(v21);
        }
        double v26 = *(void **)(*((void *)&v67 + 1) + 8 * j);
        double v27 = [v26 associatedTree];
        int v28 = [v27 state];

        if (v19)
        {
          id v29 = [v26 associatedTree];

          if (v29 != v66)
          {
            if (v28 == 16 || v28 == 4)
            {
              CGRect v31 = [v26 associatedTree];
              [v31 setState:2];
            }
            [v26 removeFromSuperview];
            CGRect v32 = [(TUIKeyplaneView *)self activeVariantViews];
            [v32 removeObject:v26];
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v67 objects:v75 count:16];
    }
    while (v23);
  }

  uint64_t v33 = [(TUIKeyplaneView *)self activeKey];
  long long v34 = v63;
  if (v33)
  {
    long long v35 = (void *)v33;
    BOOL v36 = [(TUIKeyplaneView *)self dismissingKeyboardMenu];

    if (!v36 && v64 != v4)
    {
      if ((uint64_t v37 = [v66 selectedVariantIndex], v4 == 16)
        || v37 != 0x7FFFFFFFFFFFFFFFLL
        || (v64 != 1 ? (BOOL v38 = v4 == 2) : (BOOL v38 = 0), v38 || v64 == 4))
      {
        int v53 = [(TUIKeyplaneView *)self activeKey];
        uint64_t v54 = [v53 backingTree];
        double v55 = [(TUIKeyplaneView *)self cachedVariantViewForTree:v54 state:v64];

        char v56 = [v55 superview];

        if (v56) {
          [v55 removeFromSuperview];
        }
        v57 = [(TUIKeyplaneView *)self activeVariantViews];
        [v57 removeObject:v55];

        if (v64) {
          [(TUIKeyplaneView *)self setActiveKey:0];
        }

        if (v19) {
          goto LABEL_48;
        }
LABEL_63:
        if (v63)
        {
          id v52 = v63;
          long long v34 = v52;
        }
        else
        {
          int v58 = +[TUIKey keyFromKBTree:v66];
          int v59 = [(TUIKeyplaneView *)self keyplane];
          [v58 setKeyplane:v59];

          objc_msgSend(v58, "setStyle:", -[TUIKeyplaneView keyLayoutStyle](self, "keyLayoutStyle"));
          id v52 = (id)objc_msgSend(objc_alloc(-[TUIKeyplaneView preferredKeyViewClass](self, "preferredKeyViewClass")), "initWithKey:", v58);
          long long v60 = [(TUIKeyplaneView *)self storedKeyViews];
          [v60 setObject:v52 forKey:v65];

          long long v34 = 0;
        }
        goto LABEL_66;
      }
    }
  }
  if (!v19) {
    goto LABEL_63;
  }
LABEL_48:
  if (!v63)
  {
    long long v34 = [(TUIKeyplaneView *)self viewForBaseKey:v66];
  }
  int v39 = +[TUIKey keyFromKBTree:v66];
  double v40 = [(TUIKeyplaneView *)self keyplane];
  [v39 setKeyplane:v40];

  uint64_t v41 = [(TUIKeyplaneView *)self currentKeyplane];
  CGRect v42 = [(TUIKeyplaneView *)self currentKeyplane];
  objc_msgSend(v39, "setStyle:", objc_msgSend(v41, "keyStyleForLayoutClass:", objc_msgSend(v42, "layoutClass")));

  double v43 = [(TUIKeyplaneView *)self variantViewForKey:v39 cacheID:v65];
  [(TUIKeyplaneView *)self setActiveKey:v39];
  if (v43)
  {
    double v44 = [v43 superview];

    if (!v44)
    {
      [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v45 = [(TUIKeyplaneView *)self window];
      double v46 = [v45 rootViewController];
      double v47 = [v46 view];
      [v47 addSubview:v43];

      double v48 = [v34 popupMenu];

      if (!v48) {
        [v43 updateVariantsIfNeededForKey:v66];
      }
      [(TUIKeyplaneView *)self presentSelectorView:v43 fromBaseKey:v34];
      id v49 = [(TUIKeyplaneView *)self activeVariantViews];

      if (!v49)
      {
        double v50 = [MEMORY[0x1E4F1CA48] array];
        [(TUIKeyplaneView *)self setActiveVariantViews:v50];
      }
      char v51 = [(TUIKeyplaneView *)self activeVariantViews];
      [v51 addObject:v43];

      [v43 layoutIfNeeded];
    }
  }

  id v52 = 0;
LABEL_66:
  [v52 setAlpha:1.0];
  if (v4 != 16)
  {
    long long v61 = [(TUIKeyplaneView *)self keyplaneRenderConfig];
    [v52 setRenderConfig:v61];

    long long v62 = [(TUIKeyplaneView *)self factory];
    [v52 setFactory:v62];
  }
  if (v64 != v4) {
    [(TUIKeyplaneView *)self updateFrameForKey:v66];
  }
  [v52 updateStateFrom:v64 to:v4];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUIKeyplaneView;
  [(TUIKeyplaneView *)&v3 layoutSubviews];
  if ([(TUIKeyplaneView *)self layoutReadyForTreeUpdate]) {
    [(TUIKeyplaneView *)self updateAllTrees];
  }
}

- (void)layoutKeysInRows:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TUIKeyplaneView *)self keyRowViews];
  long long v60 = self;
  if (!v5) {
    goto LABEL_3;
  }
  id v6 = (void *)v5;
  int v7 = [(TUIKeyplaneView *)self keyRowViews];
  unint64_t v8 = [v7 count];
  unint64_t v9 = [v4 count];

  self = v60;
  if (v8 < v9) {
LABEL_3:
  }
    -[TUIKeyplaneView layoutRows:](self, "layoutRows:", [v4 count]);
  uint64_t v10 = [(TUIKeyplaneView *)self currentKeyplane];
  int v11 = [v10 isGridLayout];

  id v12 = v60;
  int v59 = [(TUIKeyplaneView *)v60 keySizeReferenceGuide];
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 count])
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 7;
    if (!v11) {
      uint64_t v16 = 0;
    }
    uint64_t v62 = v16;
    unint64_t v17 = 0x1E4F1C000uLL;
    v57 = v4;
    do
    {
      double v18 = [(TUIKeyplaneView *)v12 keyRowViews];
      int v19 = [NSNumber numberWithUnsignedInteger:v14];
      long long v68 = [v18 objectForKey:v19];

      long long v61 = [v4 objectAtIndex:v14];
      uint64_t v58 = v14;
      if (v14 == [v4 count] - 1)
      {
        uint64_t v20 = v62;
        if (v62 == 7)
        {
          uint64_t v30 = v59;
          id v12 = v60;
        }
        else
        {
          id v21 = [(TUIKeyplaneView *)v60 currentKeyplane];
          uint64_t v22 = [(TUIKeyplaneView *)v60 currentKeyplane];
          int v23 = objc_msgSend(v21, "variantTypeIncludesSpaceBar:", objc_msgSend(v22, "currentVariantType"));

          id v12 = v60;
          if (v23) {
            uint64_t v24 = 1;
          }
          else {
            uint64_t v24 = 2;
          }
          double v25 = [(TUIKeyplaneView *)v60 bottomRowSizingGuide];

          if (!v25)
          {
            id v26 = objc_alloc_init(MEMORY[0x1E4FB1940]);
            [(TUIKeyplaneView *)v60 setBottomRowSizingGuide:v26];

            double v27 = [(TUIKeyplaneView *)v60 keyboardContentView];
            int v28 = [(TUIKeyplaneView *)v60 bottomRowSizingGuide];
            [v27 addLayoutGuide:v28];

            id v12 = v60;
          }
          uint64_t v29 = [(TUIKeyplaneView *)v12 bottomRowSizingGuide];

          [(TUIKeyplaneView *)v12 updateBottomRowSizingGuide];
          uint64_t v30 = (void *)v29;
          uint64_t v20 = v24;
        }
      }
      else
      {
        uint64_t v30 = v59;
        id v12 = v60;
        uint64_t v20 = v62;
      }
      CGRect v31 = v68;
      int v59 = v30;
      uint64_t v62 = v20;
      objc_msgSend(v68, "layoutRowWithKeys:guide:type:", v61);
      unsigned int v64 = v15;
      if (v15)
      {
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        CGRect v32 = [v15 doubleHeightKeysForRow];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v73 objects:v81 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v74 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = [*(id *)(*((void *)&v73 + 1) + 8 * i) bottomAnchor];
              BOOL v38 = [v68 bottomAnchor];
              int v39 = [v37 constraintEqualToAnchor:v38];
              CGRect v80 = v39;
              double v40 = [*(id *)(v17 + 2424) arrayWithObjects:&v80 count:1];
              [v13 addObjectsFromArray:v40];
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v73 objects:v81 count:16];
          }
          while (v34);
        }

        id v12 = v60;
        uint64_t v15 = v64;
        CGRect v31 = v68;
      }
      if (v62 == 7 && [v31 rowHasDoubleHeightKeys])
      {
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        obuint64_t j = [v31 doubleHeightKeysForRow];
        uint64_t v66 = [obj countByEnumeratingWithState:&v69 objects:v79 count:16];
        if (v66)
        {
          uint64_t v65 = *(void *)v70;
          do
          {
            for (uint64_t j = 0; j != v66; ++j)
            {
              if (*(void *)v70 != v65) {
                objc_enumerationMutation(obj);
              }
              CGRect v42 = *(void **)(*((void *)&v69 + 1) + 8 * j);
              double v43 = [v42 topAnchor];
              if (v15)
              {
                double v44 = [v15 topAnchor];
                double v45 = [v43 constraintEqualToAnchor:v44];
                v78[0] = v45;
                double v46 = [v42 bottomAnchor];
                double v47 = [v31 bottomAnchor];
                [v46 constraintEqualToAnchor:v47];
                unint64_t v48 = v17;
                v50 = id v49 = v13;
                v78[1] = v50;
                [*(id *)(v48 + 2424) arrayWithObjects:v78 count:2];
                char v51 = v67 = v43;
                [v49 addObjectsFromArray:v51];

                uint64_t v13 = v49;
                unint64_t v17 = v48;
                CGRect v31 = v68;

                uint64_t v15 = v64;
                [v42 setHidden:1];
              }
              else
              {
                id v52 = [v31 topAnchor];
                [v43 constraintEqualToAnchor:v52];
                v54 = int v53 = v43;
                uint64_t v77 = v54;
                double v55 = [*(id *)(v17 + 2424) arrayWithObjects:&v77 count:1];
                [v13 addObjectsFromArray:v55];
              }
            }
            uint64_t v66 = [obj countByEnumeratingWithState:&v69 objects:v79 count:16];
          }
          while (v66);
        }

        id v56 = v31;
        id v12 = v60;
      }
      else
      {
        id v56 = 0;
      }

      if ([(TUIKeyplaneView *)v12 supportsSplit]) {
        objc_msgSend(v68, "toggleConstraintsForSplit:", -[TUIKeyplaneView isCurrentlySplit](v12, "isCurrentlySplit"));
      }

      id v4 = v57;
      uint64_t v14 = v58 + 1;
      uint64_t v15 = v56;
    }
    while (v58 + 1 < (unint64_t)[v57 count]);
  }
  if ([v13 count]) {
    [MEMORY[0x1E4F28DC8] activateConstraints:v13];
  }
}

- (void)layoutRows:(unint64_t)a3
{
  id v4 = self;
  v116[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(TUIKeyplaneView *)self keySizeReferenceGuide];

  if (v5)
  {
    id v6 = [(TUIKeyplaneView *)v4 keyboardContentView];
    int v7 = [(TUIKeyplaneView *)v4 keySizeReferenceGuide];
    [v6 removeLayoutGuide:v7];

    [(TUIKeyplaneView *)v4 setKeySizeReferenceGuide:0];
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [(TUIKeyplaneView *)v4 setKeySizeReferenceGuide:v8];

  unint64_t v9 = [(TUIKeyplaneView *)v4 keyboardContentView];
  uint64_t v10 = [(TUIKeyplaneView *)v4 keySizeReferenceGuide];
  [v9 addLayoutGuide:v10];

  int v11 = [(TUIKeyplaneView *)v4 keyRowViews];

  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(TUIKeyplaneView *)v4 setKeyRowViews:v12];
  }
  BOOL v95 = [(TUIKeyplaneView *)v4 supportsSplit];
  if (v95)
  {
    uint64_t v13 = [(TUIKeyplaneView *)v4 splitTransitionLayoutGuides];
    uint64_t v14 = [v13 objectForKey:@"TUIKBSplitGuide_Middle"];

    v97 = (void *)v14;
    if (!v14)
    {
      [(TUIKeyplaneView *)v4 createSplitLayoutIfNeeded];
      uint64_t v15 = [(TUIKeyplaneView *)v4 splitTransitionLayoutGuides];
      v97 = [v15 objectForKey:@"TUIKBSplitGuide_Middle"];
    }
    uint64_t v16 = [(TUIKeyplaneView *)v4 isCurrentlySplit] ^ 1;
    unint64_t v17 = [(TUIKeyplaneView *)v4 splitSpacing];
    [v17 setActive:v16];
  }
  else
  {
    v97 = 0;
  }
  double v18 = [(TUIKeyplaneView *)v4 currentKeyplane];
  int v19 = [v18 isGridLayout];
  uint64_t v20 = 7;
  if (!v19) {
    uint64_t v20 = 0;
  }
  uint64_t v105 = v20;

  id v21 = [(TUIKeyplaneView *)v4 currentKeyplane];
  uint64_t v22 = [v21 effectsType];

  v96 = v4;
  if (v22 == 1)
  {
    [(TUIKeyplaneView *)v4 idealKeySizeforLayoutType:v105];
    double v24 = v23;
    double v26 = v25;
    double v27 = (void *)MEMORY[0x1E4F28DC8];
    int v28 = [(TUIKeyplaneView *)v4 keySizeReferenceGuide];
    uint64_t v29 = [v28 widthAnchor];
    uint64_t v30 = [v29 constraintEqualToConstant:v24];
    v116[0] = v30;
    CGRect v31 = [(TUIKeyplaneView *)v4 keySizeReferenceGuide];
    CGRect v32 = [v31 heightAnchor];
    uint64_t v33 = [v32 constraintEqualToConstant:v26];
    v116[1] = v33;
    uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:2];
    [v27 activateConstraints:v34];

    id v4 = v96;
  }
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v36 = v35;
  if (a3)
  {
    uint64_t v37 = 0;
    unint64_t v98 = a3 - 1;
    v99 = v35;
    unint64_t v94 = a3;
    uint64_t v38 = 0;
    while (1)
    {
      int v39 = +[TUIKeyplaneRow emptyRowForKeyplane:v4 rowNumber:v38];
      double v40 = v39;
      BOOL v41 = v105;
      v107 = v37;
      uint64_t v108 = v38;
      if (v105 != 7) {
        break;
      }
      [v39 setEdgeToEdge:1];
      [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v105 = 7;
      CGRect v42 = v97;
      if (v95) {
        goto LABEL_24;
      }
LABEL_28:
      int v59 = [(TUIKeyplaneView *)v4 keyboardContentView];
      [v59 addSubview:v40];

      [(TUIKeyplaneView *)v4 rowsVerticalSpacing];
      double v61 = v60;
      [(TUIKeyplaneView *)v4 rowInsets];
      double v63 = v62;
      double v65 = v64;
      double v67 = v66;
      long long v68 = [v40 topAnchor];
      if (v37)
      {
        long long v69 = [v37 bottomAnchor];
        long long v70 = [v68 constraintEqualToAnchor:v69 constant:v61];
        v111 = v70;
        long long v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
        [v36 addObjectsFromArray:v71];
      }
      else
      {
        long long v69 = [(TUIKeyplaneView *)v4 keyboardContentView];
        long long v70 = [v69 topAnchor];
        long long v71 = [v68 constraintEqualToAnchor:v70];
        v112 = v71;
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
        v73 = long long v72 = v40;
        [v36 addObjectsFromArray:v73];

        double v40 = v72;
      }

      long long v74 = [(TUIKeyplaneView *)v4 currentKeyplane];
      [v74 heightMultiplierForRowNumber:v38];
      double v76 = v75;

      v103 = [v40 leadingAnchor];
      v104 = [(TUIKeyplaneView *)v4 keyboardContentView];
      v102 = [v104 leadingAnchor];
      [v103 constraintEqualToAnchor:v102 constant:v63];
      v101 = uint64_t v77 = v40;
      v110[0] = v101;
      v100 = [(TUIKeyplaneView *)v4 keyboardContentView];
      CGRect v78 = [v100 trailingAnchor];
      v79 = [v40 trailingAnchor];
      CGRect v80 = [v78 constraintEqualToAnchor:v79 constant:v67];
      v110[1] = v80;
      CGRect v81 = [v40 heightAnchor];
      uint64_t v82 = [(TUIKeyplaneView *)v4 keySizeReferenceGuide];
      v83 = [v82 heightAnchor];
      v84 = [v81 constraintEqualToAnchor:v83 multiplier:v76];
      v110[2] = v84;
      v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:3];
      [v99 addObjectsFromArray:v85];

      id v4 = v96;
      BOOL v36 = v99;
      if (v98 == v108)
      {
        v86 = [(TUIKeyplaneView *)v96 keyboardContentView];
        v87 = [v86 bottomAnchor];
        v88 = [v40 bottomAnchor];
        v89 = [v87 constraintEqualToAnchor:v88 constant:v65];
        v109 = v89;
        v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
        [v99 addObjectsFromArray:v90];
      }
      v91 = [(TUIKeyplaneView *)v96 keyRowViews];
      v92 = [NSNumber numberWithUnsignedInteger:v108];
      [v91 setObject:v77 forKey:v92];

      uint64_t v38 = v108 + 1;
      uint64_t v37 = v77;
      if (v94 == v108 + 1)
      {

        goto LABEL_35;
      }
    }
    if (!v105) {
      BOOL v41 = v98 == v38;
    }
    [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
    CGRect v42 = v97;
    uint64_t v105 = v41;
    if (!v95) {
      goto LABEL_28;
    }
    if (v41)
    {
      double v43 = [(TUIKeyplaneView *)v4 splitTransitionLayoutGuides];
      double v44 = [v43 objectForKey:@"TUIKBSplitGuide_Padding"];

      double v45 = [v97 leftAnchor];
      double v46 = [v40 splitLayoutGuide];
      double v47 = [v46 leftAnchor];
      unint64_t v48 = v40;
      v93 = v40;
      if (v44)
      {
        id v49 = [v45 constraintEqualToAnchor:v47];
        v115[0] = v49;
        double v50 = [v44 leftAnchor];
        char v51 = [v48 splitLayoutGuide];
        v106 = [v51 rightAnchor];
        id v52 = objc_msgSend(v50, "constraintEqualToAnchor:");
        v115[1] = v52;
        int v53 = v115;
      }
      else
      {
        id v49 = [v45 constraintEqualToAnchor:v47 constant:0.0];
        v114[0] = v49;
        double v50 = [v97 rightAnchor];
        char v51 = [v48 splitLayoutGuide];
        v106 = [v51 rightAnchor];
        id v52 = objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:constant:", 30.0);
        v114[1] = v52;
        int v53 = v114;
      }
      uint64_t v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
      [v99 addObjectsFromArray:v58];

      uint64_t v105 = 1;
    }
    else
    {
LABEL_24:
      uint64_t v54 = [v40 splitLayoutGuide];
      double v55 = [v54 widthAnchor];
      id v56 = [v42 widthAnchor];
      [v55 constraintEqualToAnchor:v56 multiplier:1.0];
      double v44 = v57 = v36;

      v113[0] = v44;
      double v45 = [v42 leftAnchor];
      v93 = v40;
      double v46 = [v40 splitLayoutGuide];
      double v47 = [v46 leftAnchor];
      id v49 = [v45 constraintGreaterThanOrEqualToAnchor:v47];
      v113[1] = v49;
      double v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:2];
      [v57 addObjectsFromArray:v50];
    }

    BOOL v36 = v99;
    uint64_t v37 = v107;
    uint64_t v38 = v108;
    double v40 = v93;
    goto LABEL_28;
  }
LABEL_35:
  [MEMORY[0x1E4F28DC8] activateConstraints:v36];
}

- (void)updateAllTrees
{
  if (self->_keyplane)
  {
    objc_super v3 = [(TUIKeyplaneView *)self keyRowViews];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      if (![(TUIKeyplaneView *)self layoutReadyForTreeUpdate]
        || [(TUIKeyplaneView *)self isInSplitTransition])
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __33__TUIKeyplaneView_updateAllTrees__block_invoke;
        v27[3] = &unk_1E55941A8;
        v27[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v27];
      }
      uint64_t v5 = [(TUIKeyplaneView *)self keyboardContentView];
      [v5 bounds];
      BOOL IsEmpty = CGRectIsEmpty(v28);

      if (!IsEmpty) {
        -[TUIKeyplaneView setStandardKeyInsets:](self, "setStandardKeyInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
      }
      int v7 = [(UIKBTree *)self->_keyplane keys];
      uint64_t v8 = [v7 count];
      unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FAE360]) initWithCapacity:v8];
      [v9 setUsesTwoHands:0];
      if (v8)
      {
        uint64_t v10 = 0;
        double v11 = *MEMORY[0x1E4F1DB20];
        double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        do
        {
          uint64_t v15 = [v7 objectAtIndex:v10];
          [(TUIKeyplaneView *)self updateFrameForKey:v15];
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          if ([v15 isExemptFromInputManagerLayout])
          {
            objc_msgSend(v9, "addKeyWithString:frame:", &stru_1EDC653C0, v11, v12, v13, v14);
          }
          else
          {
            double v24 = [v15 representedString];
            double v25 = [v24 lowercaseString];
            objc_msgSend(v9, "addKeyWithString:frame:", v25, v17, v19, v21, v23);
          }
          ++v10;
        }
        while (v8 != v10);
      }
      [(TUIKeyplaneView *)self setNeedsLayout];
      double v26 = [MEMORY[0x1E4FB1900] activeInstance];
      [v26 setLayoutForKeyHitTest:v9];
    }
  }
}

uint64_t __33__TUIKeyplaneView_updateAllTrees__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)didTapBiasEscapeButton
{
  int64_t v3 = [(TUIKeyplaneView *)self currentHandBias];
  uint64_t v4 = [MEMORY[0x1E4FB1920] sharedPreferencesController];
  uint64_t v5 = [v4 preferencesActions];
  [v5 setHandBias:0];

  [(TUIKeyplaneView *)self setKeyboardBias:0];
  id v6 = [MEMORY[0x1E4FB1900] activeInstance];
  [v6 updateForHandBiasChange];

  if (v3)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:*MEMORY[0x1E4FB2BE0] object:0 userInfo:0];
  }
}

- (void)updateBottomRowSizingGuide
{
  int64_t v3 = [(TUIKeyplaneView *)self bottomRowSizingGuide];

  if (!v3) {
    return;
  }
  uint64_t v4 = [(TUIKeyplaneView *)self factory];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
  {
    unint64_t v9 = [(TUIKeyplaneView *)self currentKeyplane];
    uint64_t v10 = [v9 layoutClass];

    switch(v10)
    {
      case 1:
        id v6 = [(TUIKeyplaneView *)self factory];
        BOOL v11 = [v6 dynamicFactory] == 0;
        double v12 = 0.1;
        double v13 = 0.125;
        goto LABEL_11;
      case 2:
        id v6 = [(TUIKeyplaneView *)self factory];
        [v6 dynamicFactory];
        double v8 = 1.07;
        goto LABEL_14;
      case 3:
        id v6 = [(TUIKeyplaneView *)self factory];
        BOOL v11 = [v6 dynamicFactory] == 0;
        double v12 = 1.115;
        double v13 = 1.08;
        goto LABEL_11;
      case 4:
        id v6 = [(TUIKeyplaneView *)self factory];
        BOOL v11 = [v6 dynamicFactory] == 0;
        double v12 = 1.07;
        double v13 = 1.04;
LABEL_11:
        if (v11) {
          double v8 = v12;
        }
        else {
          double v8 = v13;
        }
        goto LABEL_14;
      default:
        double v8 = 0.125;
        goto LABEL_15;
    }
  }
  id v6 = [(TUIKeyplaneView *)self factory];
  [v6 dynamicBottomRowMultiplier];
  double v8 = v7;
LABEL_14:

LABEL_15:
  double v14 = [(TUIKeyplaneView *)self bottomRowSizingConstraint];
  [v14 setActive:0];

  uint64_t v15 = [(TUIKeyplaneView *)self currentKeyplane];
  unint64_t v16 = [v15 layoutClass];

  if (v16 - 2 < 3)
  {
    double v17 = [(TUIKeyplaneView *)self bottomRowSizingGuide];
    double v18 = [v17 widthAnchor];
    double v19 = [(TUIKeyplaneView *)self keySizeReferenceGuide];
    uint64_t v20 = [v19 heightAnchor];
LABEL_19:
    double v21 = (void *)v20;
    double v22 = [v18 constraintEqualToAnchor:v20 multiplier:v8];
    [(TUIKeyplaneView *)self setBottomRowSizingConstraint:v22];

    goto LABEL_20;
  }
  if (v16 <= 1)
  {
    double v17 = [(TUIKeyplaneView *)self bottomRowSizingGuide];
    double v18 = [v17 widthAnchor];
    double v19 = [(TUIKeyplaneView *)self keyboardContentView];
    uint64_t v20 = [v19 widthAnchor];
    goto LABEL_19;
  }
LABEL_20:
  id v23 = [(TUIKeyplaneView *)self bottomRowSizingConstraint];
  [v23 setActive:1];
}

- (void)updateBiasEscapeButtonVisbility:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(TUIKeyplaneView *)self currentHandBias];
  if (v3)
  {
    int64_t v6 = v5;
    if (v5)
    {
      double v7 = [(TUIKeyplaneView *)self biasEscapeButton];

      if (!v7)
      {
        double v8 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __51__TUIKeyplaneView_updateBiasEscapeButtonVisbility___block_invoke;
        v42[3] = &unk_1E55941D0;
        v42[4] = self;
        id v39 = [MEMORY[0x1E4FB13F0] actionWithHandler:v42];
        objc_msgSend(v8, "setContentInsets:", 0.0, 15.0, 0.0, 15.0);
        unint64_t v9 = [MEMORY[0x1E4FB1618] whiteColor];
        uint64_t v10 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_9000];

        [v8 setBaseForegroundColor:v10];
        BOOL v11 = [MEMORY[0x1E4FB1830] configurationWithPointSize:6 weight:2 scale:40.0];
        [v8 setPreferredSymbolConfigurationForImage:v11];
        double v12 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v8 primaryAction:v39];
        [(TUIKeyplaneView *)self setBiasEscapeButton:v12];

        double v13 = [(TUIKeyplaneView *)self biasEscapeButton];
        [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

        double v14 = [(TUIKeyplaneView *)self superview];
        uint64_t v15 = [(TUIKeyplaneView *)self biasEscapeButton];
        [v14 addSubview:v15];

        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __51__TUIKeyplaneView_updateBiasEscapeButtonVisbility___block_invoke_3;
        v41[3] = &unk_1E5594218;
        v41[4] = self;
        unint64_t v16 = [(TUIKeyplaneView *)self biasEscapeButton];
        [v16 setConfigurationUpdateHandler:v41];

        double v17 = [(TUIKeyplaneView *)self biasEscapeButton];
        double v18 = [v17 topAnchor];
        double v19 = [(TUIKeyplaneView *)self keyboardContentView];
        uint64_t v20 = [v19 topAnchor];
        double v21 = [v18 constraintEqualToAnchor:v20];
        [v21 setActive:1];

        double v22 = [(TUIKeyplaneView *)self biasEscapeButton];
        id v23 = [v22 bottomAnchor];
        double v24 = [(TUIKeyplaneView *)self keyboardContentView];
        double v25 = [v24 bottomAnchor];
        double v26 = [v23 constraintEqualToAnchor:v25];
        [v26 setActive:1];
      }
      double v27 = [(TUIKeyplaneView *)self biasEscapeButton];
      [v27 setNeedsUpdateConfiguration];

      CGRect v28 = [(TUIKeyplaneView *)self biasEscapeButton];
      [v28 setHidden:0];

      uint64_t v29 = [(TUIKeyplaneView *)self horizontalBiasButtonConstraint];

      if (v6 == 1)
      {
        if (!v29)
        {
          uint64_t v30 = [(TUIKeyplaneView *)self biasEscapeButton];
          CGRect v31 = [v30 leadingAnchor];
          CGRect v32 = [(TUIKeyplaneView *)self leadingAnchor];
          double v33 = 1.0;
          uint64_t v34 = v31;
LABEL_15:
          uint64_t v37 = [v34 constraintEqualToSystemSpacingAfterAnchor:v32 multiplier:v33];
          [(TUIKeyplaneView *)self setHorizontalBiasButtonConstraint:v37];
        }
      }
      else if (!v29)
      {
        uint64_t v30 = [(TUIKeyplaneView *)self trailingAnchor];
        CGRect v31 = [(TUIKeyplaneView *)self biasEscapeButton];
        CGRect v32 = [v31 trailingAnchor];
        double v33 = 1.0;
        uint64_t v34 = v30;
        goto LABEL_15;
      }
      uint64_t v38 = [(TUIKeyplaneView *)self horizontalBiasButtonConstraint];
      [v38 setActive:1];

      return;
    }
  }
  id v35 = [(TUIKeyplaneView *)self horizontalBiasButtonConstraint];

  if (v35)
  {
    BOOL v36 = [(TUIKeyplaneView *)self horizontalBiasButtonConstraint];
    [v36 setActive:0];

    [(TUIKeyplaneView *)self setHorizontalBiasButtonConstraint:0];
  }
  id v40 = [(TUIKeyplaneView *)self biasEscapeButton];
  [v40 setHidden:1];
}

uint64_t __51__TUIKeyplaneView_updateBiasEscapeButtonVisbility___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didTapBiasEscapeButton];
}

void __51__TUIKeyplaneView_updateBiasEscapeButtonVisbility___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = [v3 configuration];
  uint64_t v4 = (void *)MEMORY[0x1E4FB1818];
  int64_t v5 = NSString;
  uint64_t v6 = [*(id *)(a1 + 32) currentHandBias];
  double v7 = @"right";
  if (v6 == 1) {
    double v7 = @"left";
  }
  double v8 = [v5 stringWithFormat:@"chevron.compact.%@", v7];
  unint64_t v9 = [v4 systemImageNamed:v8];

  [v10 setImage:v9];
  [v3 setConfiguration:v10];
}

id __51__TUIKeyplaneView_updateBiasEscapeButtonVisbility___block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1618] colorWithWhite:0.353 alpha:1.0];
  }
  else {
  double v2 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  return v2;
}

- (void)setKeyboardBias:(int64_t)a3
{
  int64_t v5 = [(TUIKeyplaneView *)self currentKeyplane];
  if ([v5 layoutClass] != 1) {
    goto LABEL_9;
  }
  uint64_t v6 = [(TUIKeyplaneView *)self currentKeyplane];
  if ([v6 effectsType] == 1)
  {
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  double v7 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  if ((unint64_t)([v7 interfaceOrientation] - 1) >= 2)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(TUIKeyplaneView *)self isFloating];

  if (!v8)
  {
    if (a3)
    {
      unint64_t v9 = [(TUIKeyplaneView *)self preferredWidthConstraint];
      id v10 = v9;
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v14 = [(TUIKeyplaneView *)self isFloating] ^ 1;
      unint64_t v9 = [(TUIKeyplaneView *)self preferredWidthConstraint];
      id v10 = v9;
      uint64_t v11 = v14;
    }
    [v9 setActive:v11];

    if ([(TUIKeyplaneView *)self currentHandBias] != a3)
    {
      uint64_t v15 = [(TUIKeyplaneView *)self horizontalBiasButtonConstraint];
      [v15 setActive:0];

      [(TUIKeyplaneView *)self setHorizontalBiasButtonConstraint:0];
      [(TUIKeyplaneView *)self setCurrentHandBias:a3];
    }
    [(TUIKeyplaneView *)self updateBiasEscapeButtonVisbility:a3 != 0];
    [(TUIKeyplaneView *)self updateKeyplaneSpacing];
    [(TUIKeyplaneView *)self setLayoutReadyForTreeUpdate:0];
    [(TUIKeyplaneView *)self updateAllTrees];
    return;
  }
LABEL_10:
  [(TUIKeyplaneView *)self setCurrentHandBias:0];
  uint64_t v12 = [(TUIKeyplaneView *)self isFloating] ^ 1;
  double v13 = [(TUIKeyplaneView *)self preferredWidthConstraint];
  [v13 setActive:v12];

  [(TUIKeyplaneView *)self updateBiasEscapeButtonVisbility:0];
  [(TUIKeyplaneView *)self updateKeyplaneSpacing];
}

- (int64_t)currentHandBias
{
  return self->_currentHandBias;
}

- (void)updateKeyplaneSpacing
{
  [(TUIKeyplaneView *)self keyplaneInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(TUIKeyplaneView *)self topSpacing];
  [v11 setConstant:v4];

  uint64_t v12 = [(TUIKeyplaneView *)self leadingSpacing];
  [v12 setConstant:v6];

  double v13 = [(TUIKeyplaneView *)self bottomSpacing];
  [v13 setConstant:v8];

  id v14 = [(TUIKeyplaneView *)self trailingSpacing];
  [v14 setConstant:v10];
}

- (void)updateKeysForFloating:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(TUIKeyplaneView *)self setLayoutReadyForTreeUpdate:0];
  [(TUIKeyplaneView *)self deactivateKeys];
  [(TUIKeyplaneView *)self setIsFloating:v3];
  [(TUIKeyplaneView *)self _regenerateFactoryPreservingUpdates:0];
  if (v3)
  {
    uint64_t v5 = 1;
  }
  else
  {
    double v6 = [(TUIKeyplaneView *)self currentKeyplane];
    uint64_t v7 = [v6 layoutClass];

    if (v7 == 4) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 2;
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v8 = [(TUIKeyplaneView *)self keyRowViews];
  double v9 = [v8 allKeys];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v15 = [(TUIKeyplaneView *)self keyRowViews];
        unint64_t v16 = [v15 objectForKey:v14];

        double v17 = [(TUIKeyplaneView *)self factory];
        [v16 updateKeysInRowWithStyle:v5 factory:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  [(TUIKeyplaneView *)self updateBottomRowSizingGuide];
  [(TUIKeyplaneView *)self updateAllTrees];
  [(TUIKeyplaneView *)self setLayoutReadyForTreeUpdate:1];
}

- (void)transitionToKeyplane:(id)a3
{
  double v9 = (UIKBTree *)a3;
  if (self->_keyplane != v9) {
    objc_storeStrong((id *)&self->_keyplane, a3);
  }
  uint64_t v5 = [(TUIKeyplaneView *)self screenTraits];
  int v6 = [v5 isFloating];
  int v7 = [(TUIKeyplaneView *)self isFloating];

  if (v6 != v7)
  {
    double v8 = [(TUIKeyplaneView *)self screenTraits];
    -[TUIKeyplaneView updateKeysForFloating:](self, "updateKeysForFloating:", [v8 isFloating]);
  }
}

- (void)setKeyplaneForAutomation:(id)a3
{
  id v4 = a3;
  [(TUIKeyplaneView *)self createContentViewsIfNeeded];
  if (self->_keyplane)
  {
    uint64_t v5 = [(TUIKeyplaneView *)self keyRowViews];

    if (!v5)
    {
      keyplane = self->_keyplane;
      self->_keyplane = 0;
    }
  }
  [(TUIKeyplaneView *)self setLayoutReadyForTreeUpdate:0];
  [v4 updateFlickKeycapOnKeys];
  int v7 = self->_keyplane;
  self->_keyplane = (UIKBTree *)v4;
  id v8 = v4;

  id v10 = +[TUIKeyplane keyplaneFromKBTree:self->_keyplane withType:0];

  [(TUIKeyplaneView *)self setCurrentHandBias:0];
  double v9 = [(TUIKeyplaneView *)self currentKeyplane];
  [(TUIKeyplaneView *)self compareKeyplane:v9 toKeyplane:v10];

  [(TUIKeyplaneView *)self updateKeyplaneSpacing];
}

- (void)setKeyplane:(id)a3
{
  uint64_t v38 = (UIKBTree *)a3;
  [(TUIKeyplaneView *)self createContentViewsIfNeeded];
  p_keyplane = &self->_keyplane;
  if (self->_keyplane)
  {
    int v6 = [(TUIKeyplaneView *)self keyRowViews];

    if (!v6)
    {
      int v7 = *p_keyplane;
      *p_keyplane = 0;
    }
  }
  id v8 = [(TUIKeyplaneView *)self renderingContext];
  uint64_t v9 = [v8 keyboardType];

  if (v9 == 126)
  {
    id v10 = [(TUIKeyplaneView *)self factory];
    if ([v10 dynamicFactory])
    {
    }
    else
    {
      uint64_t v11 = [(TUIKeyplaneView *)self screenTraits];
      int v12 = [v11 isFloating];

      if (!v12)
      {
        uint64_t v9 = 126;
        goto LABEL_12;
      }
    }
    double v13 = [(UIKBTree *)v38 name];
    int64_t v14 = +[TUIKeyplane layoutClassFromKeyplaneName:v13];

    if (v14 == 1) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 126;
    }
  }
LABEL_12:
  uint64_t v15 = +[TUIKeyplane keyplaneFromKBTree:v38 withType:v9];
  if (*p_keyplane == v38
    && ([(TUIKeyplaneView *)self currentKeyplane],
        unint64_t v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v15 needsResetFromKeyplane:v16],
        v16,
        !v17))
  {
    BOOL v19 = 1;
  }
  else
  {
    [(TUIKeyplaneView *)self setLayoutReadyForTreeUpdate:0];
    [(UIKBTree *)v38 updateFlickKeycapOnKeys];
    objc_storeStrong((id *)&self->_keyplane, a3);
    long long v18 = [(TUIKeyplaneView *)self currentKeyplane];

    if (v18)
    {
      BOOL v19 = 1;
    }
    else
    {
      long long v20 = [(TUIKeyplaneView *)self screenTraits];
      -[TUIKeyplaneView setIsFloating:](self, "setIsFloating:", [v20 isFloating]);

      BOOL v19 = [(TUIKeyplaneView *)self isFloating];
      -[TUIKeyplaneView setStandardKeyInsets:](self, "setStandardKeyInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    }
    [(TUIKeyplaneView *)self setCurrentHandBias:0];
    long long v21 = [(TUIKeyplaneView *)self currentKeyplane];
    [(TUIKeyplaneView *)self compareKeyplane:v21 toKeyplane:v15];

    if ([(TUIKeyplaneView *)self supportsSplit])
    {
      if (![(TUIKeyplaneView *)self isInSplitTransition])
      {
        -[TUIKeyplaneView setIsCurrentlySplit:](self, "setIsCurrentlySplit:", [MEMORY[0x1E4FB1900] isSplit]);
        if ([(TUIKeyplaneView *)self isCurrentlySplit])
        {
          [(TUIKeyplaneView *)self prepareForSplitTransition];
          [(TUIKeyplaneView *)self updateSplitProgress:1.0];
          [(TUIKeyplaneView *)self finishSplitTransition];
        }
      }
    }
  }
  [(TUIKeyplaneView *)self sizeFromScreenTraitsAndClass];
  double v23 = v22;
  double v25 = v24;
  if (![(TUIKeyplaneView *)self isCurrentlySplit]
    && ![(TUIKeyplaneView *)self isInSplitTransition])
  {
    [(TUIKeyplaneView *)self preferredSize];
    if (v23 != v27 || v25 != v26)
    {
      CGRect v28 = [(TUIKeyplaneView *)self screenTraits];
      [v28 keyboardWidth];
      double v30 = v29;

      if (v30 > 0.0) {
        -[TUIKeyplaneView updateToSize:](self, "updateToSize:", v23, v25);
      }
    }
  }
  CGRect v31 = [(TUIKeyplaneView *)self bottomSpacing];
  [v31 setActive:1];

  CGRect v32 = [(TUIKeyplaneView *)self trailingTieConstraint];
  [v32 setActive:1];

  double v33 = [(TUIKeyplaneView *)self currentKeyplane];
  if ([v33 layoutClass] != 1)
  {

LABEL_33:
    [(TUIKeyplaneView *)self updateKeyplaneSpacing];
    if (!v19) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  uint64_t v34 = [(TUIKeyplaneView *)self screenTraits];
  char v35 = [v34 isFloating];

  if (v35) {
    goto LABEL_33;
  }
  BOOL v36 = [MEMORY[0x1E4FB1920] sharedPreferencesController];
  uint64_t v37 = [v36 preferencesActions];
  -[TUIKeyplaneView setKeyboardBias:](self, "setKeyboardBias:", [v37 handBias]);

  if (v19) {
LABEL_34:
  }
    [(TUIKeyplaneView *)self updateKeysForFloating:[(TUIKeyplaneView *)self isFloating]];
LABEL_35:
}

- (void)updateKeysForRow:(unint64_t)a3 withKeys:(id)a4
{
  id v9 = a4;
  int v6 = [(TUIKeyplaneView *)self keyRowViews];
  int v7 = [NSNumber numberWithUnsignedInteger:a3];
  id v8 = [v6 objectForKey:v7];

  if (v8) {
    [v8 updateKeysInRowWithData:v9];
  }
}

- (void)updateRowsForKeyplane:(id)a3
{
  id v7 = a3;
  if ([v7 numberOfRows])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [v7 orderedKeysByRow];
      int v6 = [v5 objectAtIndexedSubscript:v4];
      [(TUIKeyplaneView *)self updateKeysForRow:v4 withKeys:v6];

      ++v4;
    }
    while (v4 < [v7 numberOfRows]);
  }
  [(TUIKeyplaneView *)self updateAllTrees];
}

- (void)resetLayoutAndApplyKeyplane:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = [(TUIKeyplaneView *)self storedVariantViews];
  int v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v10++) removeFromSuperview];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [(TUIKeyplaneView *)self storedVariantViews];
  [v11 removeAllObjects];

  int v12 = [(TUIKeyplaneView *)self storedKeyViews];
  [v12 removeAllObjects];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v13 = [(TUIKeyplaneView *)self keyRowViews];
  int64_t v14 = [v13 allValues];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v18++) removeFromSuperview];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  BOOL v19 = [(TUIKeyplaneView *)self keyRowViews];
  [v19 removeAllObjects];

  [(TUIKeyplaneView *)self setCurrentKeyplane:v4];
  -[TUIKeyplaneView layoutRows:](self, "layoutRows:", [v4 numberOfRows]);
  long long v20 = [v4 orderedKeysByRow];
  [(TUIKeyplaneView *)self layoutKeysInRows:v20];

  [(TUIKeyplaneView *)self updateAllTrees];
  [(TUIKeyplaneView *)self setLayoutReadyForTreeUpdate:1];
}

- (void)compareKeyplane:(id)a3 toKeyplane:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(TUIKeyplaneView *)self deactivateKeys];
  if (!v6 || [v6 needsResetFromKeyplane:v7])
  {
    if ([(TUIKeyplaneView *)self supportsSplit]
      && ([v6 hasSimilarLayoutToKeyplane:v7] & 1) == 0)
    {
      uint64_t v8 = [(TUIKeyplaneView *)self splitSpacing];
      [v8 setActive:0];

      [(TUIKeyplaneView *)self setSplitSpacing:0];
      uint64_t v9 = [(TUIKeyplaneView *)self rightSplitWidth];
      [v9 setActive:0];

      [(TUIKeyplaneView *)self setRightSplitWidth:0];
      uint64_t v10 = [(TUIKeyplaneView *)self leftSplitWidth];
      [v10 setActive:0];

      [(TUIKeyplaneView *)self setLeftSplitWidth:0];
      uint64_t v11 = [(TUIKeyplaneView *)self keySizeSpacer];
      [v11 setActive:0];

      [(TUIKeyplaneView *)self setKeySizeSpacer:0];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      int v12 = [(TUIKeyplaneView *)self splitTransitionLayoutGuides];
      double v13 = [v12 allValues];

      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v20;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v13);
            }
            [(TUIKeyplaneView *)self removeLayoutGuide:*(void *)(*((void *)&v19 + 1) + 8 * v17++)];
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v15);
      }

      uint64_t v18 = [(TUIKeyplaneView *)self splitTransitionLayoutGuides];
      [v18 removeAllObjects];
    }
    [(TUIKeyplaneView *)self resetLayoutAndApplyKeyplane:v7];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TUIKeyplaneView *)self setLayoutReadyForTreeUpdate:1];
  uint64_t v5 = [v4 userInterfaceStyle];
  id v6 = [(TUIKeyplaneView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    [(TUIKeyplaneView *)self _regenerateFactoryPreservingUpdates:1];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = [(TUIKeyplaneView *)self keyRowViews];
    uint64_t v9 = [v8 allValues];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
          int64_t v15 = [(TUIKeyplaneView *)self keyLayoutStyle];
          uint64_t v16 = [(TUIKeyplaneView *)self factory];
          [v14 updateKeysInRowWithStyle:v15 factory:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }
  }
  uint64_t v17 = [v4 horizontalSizeClass];
  uint64_t v18 = [(TUIKeyplaneView *)self traitCollection];
  uint64_t v19 = [v18 horizontalSizeClass];

  if (v17 == v19)
  {
    [(TUIKeyplaneView *)self updateAllTrees];
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __44__TUIKeyplaneView_traitCollectionDidChange___block_invoke;
    v20[3] = &unk_1E55941A8;
    v20[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v20];
  }
}

uint64_t __44__TUIKeyplaneView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)prepareForDisplay
{
  BOOL v3 = [(TUIKeyplaneView *)self displayedType];
  id v4 = [(UIKBTree *)self->_keyplane unhashedName];
  char v5 = [v3 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    [(TUIKeyplaneView *)self createContentViewsIfNeeded];
  }
}

- (int64_t)keyLayoutStyle
{
  double v2 = [(TUIKeyplaneView *)self currentKeyplane];
  int64_t v3 = [v2 keyLayoutStyle];

  if (v3 == -1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void)createContentViewsIfNeeded
{
  v60[6] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(TUIKeyplaneView *)self keyboardContentView];

  if (!v3)
  {
    id v4 = objc_alloc_init(TUIKeyboardContentView);
    [(TUIKeyplaneView *)self setKeyboardContentView:v4];

    char v5 = [(TUIKeyplaneView *)self keyboardContentView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v6 = [(TUIKeyplaneView *)self keyboardContentView];
    [v6 setUserInteractionEnabled:0];

    uint64_t v7 = [(TUIKeyplaneView *)self keyboardContentView];
    [(TUIKeyplaneView *)self addSubview:v7];

    id v8 = objc_alloc_init(MEMORY[0x1E4FB1940]);
    [v8 setIdentifier:@"TUIKeyplane.leading"];
    [(TUIKeyplaneView *)self addLayoutGuide:v8];
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1940]);
    [v9 setIdentifier:@"TUIKeyplane.trailing"];
    [(TUIKeyplaneView *)self addLayoutGuide:v9];
    uint64_t v10 = [v8 widthAnchor];
    uint64_t v11 = [v10 constraintEqualToConstant:0.0];
    [(TUIKeyplaneView *)self setLeadingSpacing:v11];

    uint64_t v12 = [v9 widthAnchor];
    uint64_t v13 = [v12 constraintEqualToConstant:0.0];
    [(TUIKeyplaneView *)self setTrailingSpacing:v13];

    uint64_t v14 = [(TUIKeyplaneView *)self keyboardContentView];
    int64_t v15 = [v14 topAnchor];
    uint64_t v16 = [(TUIKeyplaneView *)self topAnchor];
    uint64_t v17 = [v15 constraintEqualToAnchor:v16 constant:8.0];
    [(TUIKeyplaneView *)self setTopSpacing:v17];

    uint64_t v18 = [(TUIKeyplaneView *)self bottomAnchor];
    uint64_t v19 = [(TUIKeyplaneView *)self keyboardContentView];
    long long v20 = [v19 bottomAnchor];
    long long v21 = [v18 constraintEqualToAnchor:v20];
    [(TUIKeyplaneView *)self setBottomSpacing:v21];

    long long v22 = [v9 trailingAnchor];
    long long v23 = [(TUIKeyplaneView *)self trailingAnchor];
    long long v24 = [v22 constraintEqualToAnchor:v23 constant:0.0];
    [(TUIKeyplaneView *)self setTrailingTieConstraint:v24];

    v57 = [(TUIKeyplaneView *)self topSpacing];
    v60[0] = v57;
    id v56 = [(TUIKeyplaneView *)self keyboardContentView];
    double v55 = [v56 leadingAnchor];
    uint64_t v54 = [v8 trailingAnchor];
    int v53 = [v55 constraintEqualToAnchor:v54 constant:0.0];
    v60[1] = v53;
    int v59 = v8;
    id v52 = [v8 leadingAnchor];
    long long v25 = [(TUIKeyplaneView *)self leadingAnchor];
    uint64_t v26 = [v52 constraintEqualToAnchor:v25];
    v60[2] = v26;
    uint64_t v58 = v9;
    long long v27 = [v9 leadingAnchor];
    long long v28 = [(TUIKeyplaneView *)self keyboardContentView];
    double v29 = [v28 trailingAnchor];
    double v30 = [v27 constraintEqualToAnchor:v29 constant:0.0];
    v60[3] = v30;
    uint64_t v31 = [(TUIKeyplaneView *)self leadingSpacing];
    v60[4] = v31;
    CGRect v32 = [(TUIKeyplaneView *)self trailingSpacing];
    v60[5] = v32;
    double v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:6];

    [MEMORY[0x1E4F28DC8] activateConstraints:v33];
    uint64_t v34 = [(TUIKeyplaneView *)self screenTraits];
    if (v34)
    {
      char v35 = [(TUIKeyplaneView *)self screenTraits];
      [v35 keyboardScreenReferenceSize];
      double v37 = v36;
      double v39 = v38;
    }
    else
    {
      char v35 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v35 bounds];
      double v37 = v40;
      double v39 = v41;
    }

    CGRect v42 = [(TUIKeyplaneView *)self screenTraits];
    if (v42)
    {
      double v43 = [(TUIKeyplaneView *)self screenTraits];
      uint64_t v44 = [v43 isKeyboardMinorEdgeWidth] ^ 1;
    }
    else
    {
      uint64_t v44 = v37 > v39;
    }

    int64_t v45 = +[TUIKeyplane layoutClassFromScreenDimensions:](TUIKeyplane, "layoutClassFromScreenDimensions:", v37, v39);
    +[TUIKeyplane sizeBasisForLayoutClass:v45];
    double v46 = [(TUIKeyplaneView *)self screenTraits];
    if (v46)
    {
      long long v28 = [(TUIKeyplaneView *)self screenTraits];
      [v28 keyboardWidth];
      double v37 = v47;
    }
    unint64_t v48 = [(TUIKeyplaneView *)self keyplane];
    id v49 = [v48 layoutName];
    +[TUIKeyplane baseHeightForLayout:v49 layoutClass:v45 landscape:v44];
    double v51 = v50;

    if (v46) {
    -[TUIKeyplaneView updateToSize:](self, "updateToSize:", v37, v51);
    }
    [(TUIKeyplaneView *)self setLayoutReadyForTreeUpdate:0];
  }
}

- (void)removeFromSuperview
{
  [(TUIKeyplaneView *)self deactivateKeys];
  int64_t v3 = [(TUIKeyplaneView *)self biasEscapeButton];
  [v3 removeFromSuperview];

  [(TUIKeyplaneView *)self setBiasEscapeButton:0];
  v4.receiver = self;
  v4.super_class = (Class)TUIKeyplaneView;
  [(TUIKeyplaneView *)&v4 removeFromSuperview];
}

- (BOOL)_userInteractionStateDeterminesLayerHitTestState
{
  return 1;
}

- (id)keyplaneFromTree:(id)a3 size:(CGSize)a4 controlKeyType:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = -[TUIKeyplaneView initWithFrame:keyplane:]([TUIKeyplaneView alloc], "initWithFrame:keyplane:", v7, 0.0, 0.0, width, height);

  return v8;
}

- (TUIKeyplaneView)initWithFrame:(CGRect)a3 keyplane:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)TUIKeyplaneView;
  uint64_t v11 = -[TUIKeyplaneView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    storedKeyViews = v11->_storedKeyViews;
    v11->_storedKeyViews = v12;

    uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    storedVariantViews = v11->_storedVariantViews;
    v11->_storedVariantViews = v14;

    uint64_t v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    delayedDeactivationKeys = v11->_delayedDeactivationKeys;
    v11->_delayedDeactivationKeys = v16;

    objc_storeStrong((id *)&v11->_keyplane, a4);
    uint64_t v18 = [MEMORY[0x1E4FB1920] sharedPreferencesController];
    uint64_t v19 = [v18 preferencesActions];
    v11->_currentHandBias = [v19 handBias];

    v11->_isCurrentlySplit = [MEMORY[0x1E4FB1900] isSplit];
    v11->_dismissingKeyboardMenu = 0;
    [(TUIKeyplaneView *)v11 setUserInteractionEnabled:0];
  }

  return v11;
}

+ (Class)selectorViewClassForKey:(id)a3
{
  int64_t v3 = [a3 backingTree];
  [v3 interactionType];

  objc_super v4 = objc_opt_class();
  return (Class)v4;
}

+ (CGSize)keyplaneSizeForLayout:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5
{
  id v6 = a4;
  id v7 = a3;
  [v6 keyboardScreenReferenceSize];
  int64_t v8 = +[TUIKeyplane layoutClassFromScreenDimensions:"layoutClassFromScreenDimensions:"];
  id v9 = MEMORY[0x192FA0710](v7);

  +[TUIKeyplane sizeFromScreenTraits:v6 layout:v9 layoutClass:v8];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)updateTreeForAutomation
{
  if (self->_keyplane)
  {
    int64_t v3 = [(TUIKeyplaneView *)self keyRowViews];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __51__TUIKeyplaneView_Testing__updateTreeForAutomation__block_invoke;
      v10[3] = &unk_1E55941A8;
      v10[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v10];
      char v5 = [(UIKBTree *)self->_keyplane keys];
      uint64_t v6 = [v5 count];
      if (v6)
      {
        uint64_t v7 = v6;
        for (uint64_t i = 0; i != v7; ++i)
        {
          id v9 = [v5 objectAtIndex:i];
          [(TUIKeyplaneView *)self updateFrameForKey:v9];
        }
      }
    }
  }
}

uint64_t __51__TUIKeyplaneView_Testing__updateTreeForAutomation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)generateFactoryForKeyplane:(id)a3 landscape:(BOOL)a4
{
  BOOL v4 = a4;
  id v26 = a3;
  -[TUIKeyplaneView setStandardKeyInsets:](self, "setStandardKeyInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  uint64_t v6 = [v26 name];
  int64_t v7 = +[TUIKeyplane layoutClassFromKeyplaneName:v6];

  if (self->_screenTraits)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    double v10 = (void *)MEMORY[0x1E4FB18B0];
    double v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    double v12 = [v10 traitsWithScreen:v11 orientation:1];
    screenTraits = self->_screenTraits;
    self->_screenTraits = v12;

    if (v7)
    {
LABEL_3:
      if (v7 == 1)
      {
        [(UIKBScreenTraits *)self->_screenTraits keyboardWidth];
        if (v8 <= 375.0) {
          uint64_t v9 = 85;
        }
        else {
          uint64_t v9 = 86;
        }
        if (!v4) {
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v9 = 65;
        if (!v4) {
          goto LABEL_14;
        }
      }
      goto LABEL_13;
    }
  }
  uint64_t v9 = 68;
  if (v4)
  {
LABEL_13:
    double v14 = (void *)MEMORY[0x1E4FB18B0];
    double v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
    uint64_t v16 = [v14 traitsWithScreen:v15 orientation:4];
    uint64_t v17 = self->_screenTraits;
    self->_screenTraits = v16;
  }
LABEL_14:
  unint64_t v18 = v9 | [v26 visualStyling] & 0xFFFFFFFFFFFFFF00;
  [v26 setVisualStyling:v18];
  uint64_t v19 = (void *)MEMORY[0x1E4FB18A8];
  long long v20 = [MEMORY[0x1E4FB1898] defaultConfig];
  objc_super v21 = [v19 renderingContextForRenderConfig:v20];
  renderingContext = self->_renderingContext;
  self->_renderingContext = v21;

  long long v23 = [MEMORY[0x1E4FB18A0] factoryForVisualStyle:v18 renderingContext:self->_renderingContext];
  long long v24 = [(UIKBScreenTraits *)self->_screenTraits screen];
  [v24 scale];
  objc_msgSend(v23, "setScale:");

  objc_msgSend(v23, "setStretchFactor:", 1.0, 1.0);
  [v23 setAllowsPaddles:1];
  [v23 setDynamicFactory:!v4];
  factordouble y = self->_factory;
  self->_factordouble y = (UIKBRenderFactory *)v23;
}

- (void)updateToSpecifiedSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(TUIKeyplaneView *)self sizeRatioConstraint];
  [v6 setActive:0];

  int64_t v7 = [(TUIKeyplaneView *)self heightConstraint];
  [v7 setActive:0];

  double v8 = [(TUIKeyplaneView *)self preferredWidthConstraint];
  [v8 setActive:0];

  uint64_t v9 = [(TUIKeyplaneView *)self keyboardContentView];
  double v10 = [v9 heightAnchor];
  double v11 = [v10 constraintEqualToConstant:height];
  [(TUIKeyplaneView *)self setHeightConstraint:v11];

  double v12 = [(TUIKeyplaneView *)self keyboardContentView];
  double v13 = [v12 widthAnchor];
  double v14 = [v13 constraintEqualToConstant:width];
  [(TUIKeyplaneView *)self setPreferredWidthConstraint:v14];

  double v15 = [(TUIKeyplaneView *)self heightConstraint];
  [v15 setActive:1];

  uint64_t v16 = [(TUIKeyplaneView *)self preferredWidthConstraint];
  [v16 setActive:1];

  -[TUIKeyplaneView setPreferredSize:](self, "setPreferredSize:", width, height);
}

- (void)updateVariantSelectorFramesForKey:(id)a3
{
  id v48 = a3;
  BOOL v4 = -[TUIKeyplaneView viewForBaseKey:](self, "viewForBaseKey:");
  char v5 = [v4 popupMenu];

  if (!v5)
  {
    uint64_t v6 = [(TUIKeyplaneView *)self cacheIdentifierForKey:v48 withState:16];
    [v48 setState:16];
    int64_t v7 = +[TUIKey keyFromKBTree:v48];
    double v8 = [(TUIKeyplaneView *)self keyplane];
    [v7 setKeyplane:v8];

    uint64_t v9 = [(TUIKeyplaneView *)self currentKeyplane];
    double v10 = [(TUIKeyplaneView *)self currentKeyplane];
    objc_msgSend(v7, "setStyle:", objc_msgSend(v9, "keyStyleForLayoutClass:", objc_msgSend(v10, "layoutClass")));

    double v11 = [(TUIKeyplaneView *)self variantViewForKey:v7 cacheID:v6];
    double v12 = v11;
    if (v11)
    {
      double v13 = [v11 superview];

      if (!v13)
      {
        [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
        double v14 = [(TUIKeyplaneView *)self keyboardContentView];
        [v14 addSubview:v12];

        [v12 updateVariantsIfNeededForKey:v48];
        [(TUIKeyplaneView *)self presentSelectorView:v12 fromBaseKey:v4];
        double v15 = [(TUIKeyplaneView *)self keyboardContentView];
        [v15 layoutIfNeeded];
      }
      uint64_t v16 = [v12 cellViewsInSubtreeOrder];
      uint64_t v17 = [v16 count];
      unint64_t v18 = [v48 subtrees];
      uint64_t v19 = [v18 count];

      if (v17 == v19)
      {
        long long v20 = [v48 subtrees];
        uint64_t v21 = [v20 count];

        if (v21)
        {
          unint64_t v22 = 0;
          do
          {
            long long v23 = [v16 objectAtIndex:v22];
            long long v24 = [(TUIKeyplaneView *)self keyboardContentView];
            [v23 frame];
            double v26 = v25;
            double v28 = v27;
            double v30 = v29;
            double v32 = v31;
            double v33 = [v23 superview];
            objc_msgSend(v24, "convertRect:fromView:", v33, v26, v28, v30, v32);
            double v35 = v34;
            double v37 = v36;
            double v39 = v38;
            double v41 = v40;

            CGRect v42 = [v48 subtrees];
            double v43 = [v42 objectAtIndex:v22];
            objc_msgSend(v43, "setFrame:", v35, v37, v39, v41);

            uint64_t v44 = [v48 subtrees];
            int64_t v45 = [v44 objectAtIndex:v22];
            objc_msgSend(v45, "setPaddedFrame:", v35, v37, v39, v41);

            ++v22;
            double v46 = [v48 subtrees];
            unint64_t v47 = [v46 count];
          }
          while (v22 < v47);
        }
      }
      [v12 removeFromSuperview];
    }
  }
}

- (BOOL)_shouldUseUnifiedKeyView:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 displayType] == 8
    || [v3 interactionType] == 9
    || [v3 interactionType] == 15
    || [v3 interactionType] == 13;

  return v4;
}

- (id)cacheIdentifierForKey:(id)a3 withState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int64_t v7 = [v6 name];
  uint64_t v8 = [v6 overrideDisplayString];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    BOOL v10 = [(TUIKeyplaneView *)self _shouldUseUnifiedKeyView:v6];

    if (!v10)
    {
      double v11 = [v6 name];
      double v12 = [v6 overrideDisplayString];
      uint64_t v13 = [v11 stringByAppendingFormat:@"_%@", v12];

      int64_t v7 = (__CFString *)v13;
    }
  }
  if ((v4 & 0xFFFFFFFB) == 0x10)
  {
    uint64_t v14 = [(__CFString *)v7 stringByAppendingFormat:@"_%i", v4];

    int64_t v7 = (__CFString *)v14;
  }
  if ([v6 displayType] == 31)
  {

    int64_t v7 = @"TenKey-AdaptiveKey-Facemark-Voiced";
  }

  return v7;
}

- (id)keyViewForKey:(id)a3
{
  id v4 = a3;
  char v5 = [v4 backingTree];
  id v6 = [v4 backingTree];
  int64_t v7 = -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v5, [v6 state]);

  uint64_t v8 = [(TUIKeyplaneView *)self storedKeyViews];
  uint64_t v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    BOOL v10 = [(TUIKeyplaneView *)self keyplane];
    [v4 setKeyplane:v10];

    objc_msgSend(v4, "setStyle:", -[TUIKeyplaneView keyLayoutStyle](self, "keyLayoutStyle"));
    uint64_t v9 = objc_msgSend(objc_alloc(-[TUIKeyplaneView preferredKeyViewClass](self, "preferredKeyViewClass")), "initWithKey:", v4);
    double v11 = [(TUIKeyplaneView *)self storedKeyViews];
    [v11 setObject:v9 forKey:v7];
  }
  double v12 = [(TUIKeyplaneView *)self factory];
  [v9 setFactory:v12];

  uint64_t v13 = [(TUIKeyplaneView *)self keyplaneRenderConfig];
  [v9 setRenderConfig:v13];

  return v9;
}

+ (id)updateDynamicKeyplane:(id)a3 usingSize:(CGSize)a4 isLandscape:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  if ([v8 type] == 2)
  {
    uint64_t v9 = -[TUIKeyplaneView initWithFrame:keyplane:]([TUIKeyplaneView alloc], "initWithFrame:keyplane:", v8, 0.0, 0.0, width, height);
    [(TUIKeyplaneView *)v9 generateFactoryForKeyplane:v8 landscape:v5];
    [(TUIKeyplaneView *)v9 setKeyplaneForAutomation:v8];
    -[TUIKeyplaneView updateToSpecifiedSize:](v9, "updateToSpecifiedSize:", width, height);
    [(TUIKeyplaneView *)v9 updateTreeForAutomation];
    id v10 = v8;
  }
  else
  {
    uint64_t v9 = [v8 name];
    NSLog(&cfstr_ErrorIsNotAKey.isa, v9);
    id v10 = 0;
  }

  return v10;
}

+ (id)updateDynamicKeyboard:(id)a3 usingSize:(CGSize)a4 isLandscape:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 type] == 2)
  {
    +[TUIKeyplaneView updateDynamicKeyplane:usingSize:isLandscape:](TUIKeyplaneView, "updateDynamicKeyplane:usingSize:isLandscape:", v8, v5, width, height);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ([v8 type] == 1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = [v8 subtrees];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v16 type] == 2)
          {
            if (!v13) {
              uint64_t v13 = -[TUIKeyplaneView initWithFrame:keyplane:]([TUIKeyplaneView alloc], "initWithFrame:keyplane:", v16, 0.0, 0.0, width, height);
            }
            [(TUIKeyplaneView *)v13 generateFactoryForKeyplane:v16 landscape:v5];
            [(TUIKeyplaneView *)v13 setKeyplaneForAutomation:v16];
            -[TUIKeyplaneView updateToSpecifiedSize:](v13, "updateToSpecifiedSize:", width, height);
            [(TUIKeyplaneView *)v13 updateTreeForAutomation];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
    else
    {
      uint64_t v13 = 0;
    }

    id v9 = v8;
  }
  else
  {
    uint64_t v17 = [v8 name];
    NSLog(&cfstr_ErrorIsNotAKey_0.isa, v17);

    id v9 = 0;
  }

  return v9;
}

+ (id)dynamicKeyboardForName:(id)a3 size:(CGSize)a4 isLandscape:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = +[TUIKeyboardLayoutFactory sharedKeyboardFactory];
  id v10 = [NSString stringWithFormat:@"Dynamic-%@", v8];
  uint64_t v11 = [v9 keyboardWithName:v10 inCache:0];

  if (v11 && [v11 type] == 1)
  {
    long long v23 = v11;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = [v11 subtrees];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      double v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v12);
          }
          long long v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v19 type] == 2)
          {
            if (!v16)
            {
              uint64_t v16 = -[TUIKeyplaneView initWithFrame:keyplane:]([TUIKeyplaneView alloc], "initWithFrame:keyplane:", v19, 0.0, 0.0, width, height);
              id v20 = v19;

              double v15 = v20;
            }
            [(TUIKeyplaneView *)v16 generateFactoryForKeyplane:v19 landscape:v5];
            [(TUIKeyplaneView *)v16 setKeyplaneForAutomation:v19];
            -[TUIKeyplaneView updateToSpecifiedSize:](v16, "updateToSpecifiedSize:", width, height);
            [(TUIKeyplaneView *)v16 updateTreeForAutomation];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }
    else
    {
      double v15 = 0;
      uint64_t v16 = 0;
    }

    uint64_t v11 = v23;
    id v21 = v23;
  }
  else
  {
    NSLog(&cfstr_ErrorSpecified.isa, v8);
    id v21 = 0;
  }

  return v21;
}

+ (id)keyplaneViewForLayout:(id)a3 size:(CGSize)a4 isLandscape:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  if ([v8 dynamicLayout])
  {
    if ([v8 type] == 2)
    {
      id v9 = -[TUIKeyplaneView initWithFrame:keyplane:]([TUIKeyplaneView alloc], "initWithFrame:keyplane:", v8, 0.0, 0.0, width, height);
      [(TUIKeyplaneView *)v9 generateFactoryForKeyplane:v8 landscape:v5];
      [(TUIKeyplaneView *)v9 setKeyplaneForAutomation:v8];
      -[TUIKeyplaneView updateToSpecifiedSize:](v9, "updateToSpecifiedSize:", width, height);
      [(TUIKeyplaneView *)v9 updateTreeForAutomation];
      goto LABEL_7;
    }
    id v10 = [v8 name];
    NSLog(&cfstr_ErrorIsNotAKey.isa, v10);
  }
  else
  {
    id v10 = [v8 name];
    NSLog(&cfstr_ErrorIsNotADyn.isa, v10);
  }

  id v9 = 0;
LABEL_7:

  return v9;
}

+ (id)keyplaneViewForKeyboard:(id)a3 size:(CGSize)a4 isLandscape:(BOOL)a5
{
  return (id)objc_msgSend(a1, "keyplaneViewForKeyboard:size:isLandscape:displayKeyplane:", a3, a5, 0, a4.width, a4.height);
}

+ (id)keyplaneViewForKeyboard:(id)a3 size:(CGSize)a4 isLandscape:(BOOL)a5 displayKeyplane:(unint64_t)a6
{
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  uint64_t v11 = +[TUIKeyboardLayoutFactory sharedKeyboardFactory];
  uint64_t v12 = [NSString stringWithFormat:@"Dynamic-%@", v10];
  uint64_t v13 = [v11 keyboardWithName:v12 inCache:0];

  if (v13)
  {
    if ([v13 type] == 2)
    {
      +[TUIKeyplaneView keyplaneViewForLayout:size:isLandscape:](TUIKeyplaneView, "keyplaneViewForLayout:size:isLandscape:", v13, v7, width, height);
      uint64_t v14 = (TUIKeyplaneView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v15 = [v13 subtrees];
      unint64_t v16 = [v15 count] - 1;

      if (v16 < a6)
      {
        uint64_t v17 = [v13 subtrees];
        a6 = [v17 count] - 1;
      }
      unint64_t v18 = [v13 subtrees];
      long long v19 = (void *)[v18 count];

      uint64_t v14 = 0;
      if (v19)
      {
        long long v19 = 0;
        unint64_t v20 = 0;
        do
        {
          id v21 = [v13 subtrees];
          long long v22 = [v21 objectAtIndex:v20];

          if ([v22 type] == 2)
          {
            if (!v14)
            {
              uint64_t v14 = -[TUIKeyplaneView initWithFrame:keyplane:]([TUIKeyplaneView alloc], "initWithFrame:keyplane:", v22, 0.0, 0.0, width, height);
              id v23 = v22;

              long long v19 = v23;
            }
            if (a6 == v20)
            {
              id v24 = v22;

              long long v19 = v24;
            }
            [(TUIKeyplaneView *)v14 generateFactoryForKeyplane:v22 landscape:v7];
            [(TUIKeyplaneView *)v14 setKeyplaneForAutomation:v22];
            -[TUIKeyplaneView updateToSpecifiedSize:](v14, "updateToSpecifiedSize:", width, height);
            [(TUIKeyplaneView *)v14 updateTreeForAutomation];
          }

          ++v20;
          long long v25 = [v13 subtrees];
          unint64_t v26 = [v25 count];
        }
        while (v20 < v26);
      }
      [(TUIKeyplaneView *)v14 setKeyplane:v19];
      [(TUIKeyplaneView *)v14 updateTreeForAutomation];
    }
  }
  else
  {
    NSLog(&cfstr_ErrorSpecified.isa, v10);
    uint64_t v14 = 0;
  }

  return v14;
}

@end