@interface UISegmentedControl
+ (BOOL)_selectFocusedSegmentAfterFocusUpdateForTraitCollection:(id)a3;
+ (BOOL)_supportsInvalidatingFocusCache;
+ (BOOL)_updateDynamicShadowView:(id)a3 withAnimationDelegate:(id)a4 useDynamicShadow:(BOOL)a5 animated:(BOOL)a6;
+ (BOOL)_useShadowForSelectedTintColor:(id)a3 traitCollection:(id)a4;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (CATransform3D)_hiddenSelectionTransformForTraitCollection:(SEL)a3;
+ (CATransform3D)_highlightSelectionTransformForTraitCollection:(SEL)a3;
+ (CGColor)_backgroundPrimaryColorSelected:(BOOL)a3 highlighted:(BOOL)a4 traitCollection:(id)a5 tintColor:(id)a6;
+ (CGColor)_dividerPrimaryColorBackground:(BOOL)a3 traitCollection:(id)a4 tintColor:(id)a5;
+ (CGRect)_selectionFrameForBounds:(CGRect)a3 size:(int)a4 traitCollection:(id)a5 accessibilityView:(BOOL)a6;
+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4;
+ (double)_defaultHeight;
+ (double)_defaultHeightForTraitCollection:(id)a3 size:(int)a4;
+ (double)_effectiveCornerRadiusForTraitCollection:(id)a3 size:(int)a4 selected:(BOOL)a5;
+ (double)_lineWidthForTraitCollection:(id)a3 size:(int)a4;
+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4;
+ (double)_sectionIndicatorOverflowForTraitCollection:(id)a3 size:(int)a4;
+ (double)_selectionOffsetAdjustmentForSegment:(id)a3;
+ (double)defaultHeight;
+ (double)defaultHeightForStyle:(int64_t)a3;
+ (double)defaultHeightForStyle:(int64_t)a3 size:(int)a4;
+ (id)_fontForTraitCollection:(id)a3 size:(int)a4 selected:(BOOL)a5;
+ (id)_highlightPinchAnimationForKey:(id)a3 fromValue:(id)a4 toValue:(id)a5;
+ (id)_modernBackgroundSelected:(BOOL)a3 shadow:(int64_t)a4 maximumSize:(CGSize)a5 highlighted:(BOOL)a6 traitCollection:(id)a7 tintColor:(id)a8 size:(int)a9;
+ (id)_modernDividerImageBackground:(BOOL)a3 traitCollection:(id)a4 tintColor:(id)a5 size:(int)a6;
+ (id)_selectionFadeAnimationForKey:(id)a3 fromValue:(id)a4 toValue:(id)a5;
+ (id)_selectionOpacityAnimationFromValue:(float)a3 toValue:(float)a4;
+ (id)_selectionPopAnimationForKey:(id)a3 fromValue:(id)a4 toValue:(id)a5;
+ (void)_registerStyleProvider:(id)a3 forIdiom:(int64_t)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)_alwaysEmitValueChanged;
- (BOOL)_animateHighlightingSelectionByDefault;
- (BOOL)_animatingOutDynamicShadow;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_disableSlidingControl;
- (BOOL)_focusSystem:(id)a3 containsChildOfHostEnvironment:(id)a4;
- (BOOL)_hasEnabledSegment;
- (BOOL)_shouldConsumeEventWithPresses:(id)a3;
- (BOOL)_shouldSelectSegmentAtIndex:(int64_t)a3;
- (BOOL)_useDynamicShadow;
- (BOOL)_usesNewAnimations;
- (BOOL)adjustsForContentSizeCategory;
- (BOOL)apportionsSegmentWidthsByContent;
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasBackdropView;
- (BOOL)isEnabledForSegmentAtIndex:(NSUInteger)segment;
- (BOOL)isMomentary;
- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldTrack;
- (BOOL)transparentBackground;
- (BOOL)useBlockyMagnificationInClassic;
- (CGFloat)widthForSegmentAtIndex:(NSUInteger)segment;
- (CGRect)bounds;
- (CGRect)frame;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)contentOffsetForSegmentAtIndex:(NSUInteger)segment;
- (NSDictionary)titleTextAttributesForState:(UIControlState)state;
- (NSInteger)segmentIndexForActionIdentifier:(UIActionIdentifier)actionIdentifier;
- (NSInteger)selectedSegmentIndex;
- (NSString)titleForSegmentAtIndex:(NSUInteger)segment;
- (NSUInteger)numberOfSegments;
- (UIAction)actionForSegmentAtIndex:(NSUInteger)segment;
- (UIColor)selectedSegmentTintColor;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImage)backgroundImageForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;
- (UIImage)dividerImageForLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState barMetrics:(UIBarMetrics)barMetrics;
- (UIImage)imageForSegmentAtIndex:(NSUInteger)segment;
- (UILongPressGestureRecognizer)axLongPressGestureRecognizer;
- (UIOffset)contentPositionAdjustmentForSegmentType:(UISegmentedControlSegment)leftCenterRightOrAlone barMetrics:(UIBarMetrics)barMetrics;
- (UISegmentedControl)initWithCoder:(NSCoder *)coder;
- (UISegmentedControl)initWithFrame:(CGRect)a3 withStyle:(int64_t)a4 withItems:(id)a5;
- (UISegmentedControl)initWithFrame:(CGRect)frame;
- (UISegmentedControl)initWithFrame:(CGRect)frame actions:(NSArray *)actions;
- (UISegmentedControl)initWithItems:(NSArray *)items;
- (UISegmentedControlStyle)segmentedControlStyle;
- (UIView)removedSegment;
- (_UIHostedFocusSystem)_internalFocusSystem;
- (double)_backgroundVerticalPositionAdjustmentForBarMetrics:(int64_t)a3;
- (double)_barHeight;
- (double)_interSegmentSpacing;
- (float)widthForSegment:(unint64_t)a3;
- (id)__selectedSegmentVisualEffect;
- (id)_accessibilitySegmentItemAtIndex:(unint64_t)a3;
- (id)_attributedTitleForSegmentAtIndex:(unint64_t)a3;
- (id)_backgroundTintColor;
- (id)_badgeValueForSegmentAtIndex:(unint64_t)a3;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_createAndAddSegmentAtIndex:(int)a3 position:(unsigned int)a4 withInfo:(id)a5;
- (id)_createInfoViewForSegmentAtIndex:(unint64_t)a3 item:(id)a4;
- (id)_createSegmentAtIndex:(int)a3 position:(unsigned int)a4 withInfo:(id)a5;
- (id)_defaultFocusEffect;
- (id)_feedbackGenerator;
- (id)_focusSystem:(id)a3 focusItemsInRect:(CGRect)a4;
- (id)_pointerEffectWithPreview:(void *)a3 forSegment:(uint64_t)a4 selected:;
- (id)_preferredFocusEnvironmentsForFocusSystem:(id)a3;
- (id)_segmentAtIndex:(int)a3;
- (id)_selectedSegmentVibrancyEffect;
- (id)_tintColorArchivingKey;
- (id)_uiktest_labelsWithState:(unint64_t)a3;
- (id)_uiktest_segmentAtIndex:(unint64_t)a3;
- (id)_viewForLoweringBaselineLayoutAttribute:(int)a3;
- (id)_viewToAddFocusLayer;
- (id)focusItemsInRect:(CGRect)a3;
- (id)infoViewForSegment:(int64_t)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)viewForLastBaselineLayout;
- (int)_closestSegmentIndexAtPoint:(CGPoint)a3;
- (int)controlSize;
- (int64_t)_segmentIndexToHighlight:(BOOL *)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)barStyle;
- (int64_t)segmentControlStyle;
- (unint64_t)_controlEventsForActionTriggered;
- (void)__initWithFrameCommonOperations;
- (void)_animateContentChangeWithAnimations:(id)a3 completion:(id)a4;
- (void)_axLongPressHandler:(id)a3;
- (void)_cancelDelayedFocusAction;
- (void)_clearSelectedSegment;
- (void)_commonSegmentedControlInit;
- (void)_diagnoseFocusabilityForReport:(id)a3;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_emitValueChanged;
- (void)_focusSystem:(id)a3 didFinishUpdatingFocusInContext:(id)a4;
- (void)_highlightSegment:(int64_t)a3;
- (void)_insertHighlightView;
- (void)_insertSegment:(int)a3 withInfo:(id)a4 animated:(BOOL)a5;
- (void)_insertSegmentWithAttributedTitle:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)_insertSelectionViewForSegment:(id)a3;
- (void)_installVisualStyleDefaults;
- (void)_resetForAppearanceChange;
- (void)_selectFocusedSegment;
- (void)_sendDelayedFocusActionIfNecessary;
- (void)_sendValueChanged;
- (void)_setAction:(id)a3 forSegmentAtIndex:(unint64_t)a4;
- (void)_setAlwaysEmitValueChanged:(BOOL)a3;
- (void)_setAnimatingOutDynamicShdaow:(BOOL)a3;
- (void)_setAppearanceIsTiled:(BOOL)a3 leftCapWidth:(unint64_t)a4 rightCapWidth:(unint64_t)a5;
- (void)_setAttributedTitle:(id)a3 forSegmentAtIndex:(unint64_t)a4;
- (void)_setAutosizeText:(BOOL)a3;
- (void)_setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5;
- (void)_setBackgroundTintColor:(id)a3;
- (void)_setBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4;
- (void)_setBadgeValue:(id)a3 forSegmentAtIndex:(unint64_t)a4;
- (void)_setControlSize:(int)a3 andInvalidate:(BOOL)a4;
- (void)_setDividerImage:(id)a3 forLeftSegmentState:(unint64_t)a4 rightSegmentState:(unint64_t)a5 barMetrics:(int64_t)a6;
- (void)_setEnabled:(BOOL)a3 forcePropagateToSegments:(BOOL)a4;
- (void)_setHighlightedSegmentHighlighted:(BOOL)a3;
- (void)_setHoverOnSegment:(int64_t)a3 hovered:(BOOL)a4;
- (void)_setInterSegmentSpacing:(double)a3;
- (void)_setNeedsAppearanceUpdate;
- (void)_setNeedsBackgroundAndContentViewUpdate;
- (void)_setSegmentedControlAppearance:(id *)a3;
- (void)_setSelected:(BOOL)a3 forSegmentAtIndex:(int)a4 forceInfoDisplay:(BOOL)a5;
- (void)_setSelected:(BOOL)a3 highlighted:(BOOL)a4 forSegmentAtIndex:(int)a5 forceInfoDisplay:(BOOL)a6;
- (void)_setSelectedSegmentIndex:(int64_t)a3 notify:(BOOL)a4;
- (void)_setSelectedSegmentIndex:(int64_t)a3 notify:(BOOL)a4 animate:(BOOL)a5;
- (void)_setSelectedSegmentVibrancyEffect:(id)a3;
- (void)_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)_tapSegmentAtPoint:(CGPoint)a3 touchDown:(BOOL)a4;
- (void)_updateAxLongPressGestureRecognizer;
- (void)_updateDividerImageForSegmentAtIndex:(unint64_t)a3;
- (void)_updateDynamicShadow:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateHighlightToPosition:(CGPoint)a3 bounds:(CGRect)a4 highlight:(BOOL)a5;
- (void)_updateSelectionIndicator;
- (void)_updateSelectionToSegment:(id)a3 highlight:(BOOL)a4 shouldAnimate:(BOOL)a5 sameSegment:(BOOL)a6;
- (void)addSegmentWithTitle:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)hoverOffSegment:(int64_t)a3;
- (void)hoverOnSegment:(int64_t)a3;
- (void)insertSegment:(unint64_t)a3 withImage:(id)a4 animated:(BOOL)a5;
- (void)insertSegment:(unint64_t)a3 withTitle:(id)a4 animated:(BOOL)a5;
- (void)insertSegmentWithAction:(UIAction *)action atIndex:(NSUInteger)segment animated:(BOOL)animated;
- (void)insertSegmentWithImage:(UIImage *)image atIndex:(NSUInteger)segment animated:(BOOL)animated;
- (void)insertSegmentWithTitle:(NSString *)title atIndex:(NSUInteger)segment animated:(BOOL)animated;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)removeAllSegments;
- (void)removeSegmentAtIndex:(NSUInteger)segment animated:(BOOL)animated;
- (void)selectSegment:(int)a3;
- (void)setAction:(UIAction *)action forSegmentAtIndex:(NSUInteger)segment;
- (void)setAdjustsForContentSizeCategory:(BOOL)a3;
- (void)setAlpha:(double)a3;
- (void)setAlwaysNotifiesDelegateOfSegmentClicks:(BOOL)a3;
- (void)setApportionsSegmentWidthsByContent:(BOOL)apportionsSegmentWidthsByContent;
- (void)setAxLongPressGestureRecognizer:(id)a3;
- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;
- (void)setBarStyle:(int64_t)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentOffset:(CGSize)offset forSegmentAtIndex:(NSUInteger)segment;
- (void)setContentPositionAdjustment:(UIOffset)adjustment forSegmentType:(UISegmentedControlSegment)leftCenterRightOrAlone barMetrics:(UIBarMetrics)barMetrics;
- (void)setControlSize:(int)a3;
- (void)setDividerImage:(UIImage *)dividerImage forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState barMetrics:(UIBarMetrics)barMetrics;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)enabled forSegmentAtIndex:(NSUInteger)segment;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(UIImage *)image forSegmentAtIndex:(NSUInteger)segment;
- (void)setImagePadding:(CGSize)a3 forSegment:(unint64_t)a4;
- (void)setMomentary:(BOOL)momentary;
- (void)setRemovedSegment:(id)a3;
- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex;
- (void)setSelectedSegmentTintColor:(UIColor *)selectedSegmentTintColor;
- (void)setSpringLoaded:(BOOL)a3;
- (void)setTitle:(NSString *)title forSegmentAtIndex:(NSUInteger)segment;
- (void)setTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state;
- (void)setTransparentBackground:(BOOL)a3;
- (void)setWidth:(CGFloat)width forSegmentAtIndex:(NSUInteger)segment;
- (void)setWidth:(float)a3 forSegment:(unint64_t)a4;
- (void)sizeToFit;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UISegmentedControl

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

uint64_t __55__UISegmentedControl__insertSegment_withInfo_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)traitCollectionDidChange:(id)a3
{
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UISegmentedControl;
  [(UIView *)&v21 traitCollectionDidChange:v4];
  uint64_t v5 = [v4 userInterfaceIdiom];
  v6 = [(UIView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v5 != v7)
  {
    v8 = [(UIView *)self traitCollection];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 != -1 && [v4 userInterfaceIdiom] != -1) {
      [(UISegmentedControl *)self _installVisualStyleDefaults];
    }
  }
  v10 = [(UIView *)self traitCollection];
  int v11 = [v10 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v11) {
    [(UISegmentedControl *)self _setNeedsBackgroundAndContentViewUpdate];
  }
  v12 = [(UIView *)self traitCollection];
  if (v12)
  {
    if (v4)
    {
      uint64_t v13 = v12[13];
      uint64_t v14 = v4[13];

      if (v13 == v14) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    [(UISegmentedControl *)self _updateAxLongPressGestureRecognizer];
  }
LABEL_13:
  v15 = [(UIView *)self traitCollection];
  if (v15)
  {
    if (v4)
    {
      uint64_t v16 = v15[15];
      uint64_t v17 = v4[15];

      if (v16 == v17) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    [(UISegmentedControl *)self _setNeedsAppearanceUpdate];
  }
LABEL_19:
  if ((*((unsigned char *)&self->_segmentedControlFlags + 2) & 8) != 0)
  {
    v18 = objc_opt_class();
    v19 = [(UIView *)self traitCollection];
    v20 = UISegmentedControlStyleProviderForIdiom(v18, [v19 userInterfaceIdiom]);

    [v20 updateSegmentedControl:self fromTraitCollection:v4];
  }
}

- (void)setAlpha:(double)a3
{
  BOOL v5 = [(UIControl *)self isEnabled];
  double v6 = 0.5;
  if (a3 < 0.5 || v5) {
    double v6 = a3;
  }
  v8.receiver = self;
  v8.super_class = (Class)UISegmentedControl;
  [(UIView *)&v8 setAlpha:v6];
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  [(UISegmentedControl *)self frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ((*((unsigned char *)&self->_segmentedControlFlags + 1) & 8) != 0) {
    [(UISegmentedControl *)self _resetForAppearanceChange];
  }
  uint64_t v12 = [(NSMutableArray *)self->_segments count];
  uint64_t v13 = [self->_appearanceStorage anyDividerImageForMini:0];
  uint64_t v14 = v13;
  if (!v13)
  {
    v26 = [(UIView *)self traitCollection];
    +[UISegmentedControl _dividerWidthForTraitCollection:v26 size:[(UISegmentedControl *)self controlSize]];
    double v16 = v27;

    if (v12) {
      goto LABEL_5;
    }
LABEL_15:
    double v28 = *MEMORY[0x1E4F1DB30];
    goto LABEL_19;
  }
  [v13 size];
  double v16 = v15;
  if (!v12) {
    goto LABEL_15;
  }
LABEL_5:
  if ((*((unsigned char *)&self->_segmentedControlFlags + 1) & 2) != 0)
  {
    uint64_t v29 = 0;
    double v25 = 0.0;
    do
    {
      v30 = [(NSMutableArray *)self->_segments objectAtIndex:v29];
      [v30 _idealWidth];
      double v25 = v25 + v31;

      ++v29;
    }
    while (v12 != v29);
  }
  else
  {
    uint64_t v17 = 0;
    int v18 = 0;
    double v19 = 0.0;
    double v20 = 0.0;
    do
    {
      objc_super v21 = [(NSMutableArray *)self->_segments objectAtIndex:v17];
      v22 = v21;
      double v23 = v21[70];
      if (v23 == 0.0)
      {
        [v21 _idealWidth];
        if (v20 < v24) {
          double v20 = v24;
        }
      }
      else
      {
        double v19 = v19 + v23;
        ++v18;
      }

      ++v17;
    }
    while (v12 != v17);
    double v25 = v19 + v20 * (double)(unint64_t)(v12 - v18);
  }
  double v28 = v16 * (double)(unint64_t)(v12 - 1) + v25;
LABEL_19:
  [(UISegmentedControl *)self _barHeight];
  double v33 = v32;
  -[UISegmentedControl setFrame:](self, "setFrame:", v5, v7, v9, v11);

  double v34 = v28;
  double v35 = v33;
  result.height = v35;
  result.width = v34;
  return result;
}

+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double v5 = UISegmentedControlStyleProviderForIdiom(a1, [a3 userInterfaceIdiom]);
  [v5 cornerRadiusForControlSize:v4];
  double v7 = v6;

  return v7;
}

+ (double)_defaultHeightForTraitCollection:(id)a3 size:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  double v7 = UISegmentedControlStyleProviderForIdiom(a1, [v6 userInterfaceIdiom]);
  [v7 defaultHeightForControlSize:v4 traitCollection:v6];
  double v9 = v8;

  return v9;
}

+ (id)_fontForTraitCollection:(id)a3 size:(int)a4 selected:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (qword_1EB25E598 != -1) {
    dispatch_once(&qword_1EB25E598, &__block_literal_global_758);
  }
  BOOL v9 = [v8 legibilityWeight] == 1;
  double v10 = UISegmentedControlStyleProviderForIdiom(a1, [v8 userInterfaceIdiom]);
  double v11 = [[_UISegmentedControlFontCacheKey alloc] initWithStyleProvider:v10 size:v6 selected:v5 bold:v9];
  uint64_t v12 = [(id)qword_1EB25E590 objectForKey:v11];
  if (!v12)
  {
    uint64_t v12 = [v10 fontForControlSize:v6 selected:v5];
    [(id)qword_1EB25E590 setObject:v12 forKey:v11];
  }

  return v12;
}

+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = UISegmentedControlStyleProviderForIdiom(a1, [a3 userInterfaceIdiom]);
  [v5 selectionIndicatorInsetForControlSize:v4];
  double v7 = v6;

  return v7;
}

- (BOOL)transparentBackground
{
  return *((unsigned char *)&self->_segmentedControlFlags + 1) & 1;
}

+ (id)_modernDividerImageBackground:(BOOL)a3 traitCollection:(id)a4 tintColor:(id)a5 size:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  if (qword_1EB25E588 != -1) {
    dispatch_once(&qword_1EB25E588, &__block_literal_global_755);
  }
  uint64_t v12 = (CGColor *)[a1 _dividerPrimaryColorBackground:v8 traitCollection:v10 tintColor:v11];
  uint64_t v13 = [_UISegmentedControlCacheKey alloc];
  [v10 displayScale];
  uint64_t v14 = -[_UISegmentedControlCacheKey initWithSize:scale:primaryColor:background:](v13, "initWithSize:scale:primaryColor:background:", v6, v12, v8);
  double v15 = [(id)qword_1EB25E580 objectForKey:v14];
  if (!v15)
  {
    [a1 _dividerWidthForTraitCollection:v10 size:v6];
    double v17 = v16;
    int v18 = UISegmentedControlStyleProviderForIdiom(a1, [v10 userInterfaceIdiom]);
    double v19 = v18;
    if (v17 >= 0.0001)
    {
      if ([v18 useSelectionIndicatorStyling])
      {
        if (v6 == 1) {
          double v20 = 5.0;
        }
        else {
          double v20 = 7.0;
        }
        double v21 = v20 + v20 + v17 + 1.0;
        [v10 displayScale];
        _UIGraphicsBeginImageContextWithOptions(0, 0, v17, v21, v22);
        ContextStack = GetContextStack(0);
        if (*(int *)ContextStack < 1) {
          double v24 = 0;
        }
        else {
          double v24 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
        }
        double v28 = v17 * 0.5;
        CGContextSetFillColorWithColor(v24, v12);
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        if (v8)
        {
          UIRectFillUsingOperation(1, 0.0, 0.0, v17, v21);
        }
        else
        {
          double v31 = v17;
          double v32 = v20 + v20 + v17 + 1.0;
          CGRect v37 = CGRectInset(*(CGRect *)&v29, 0.0, v20);
          double v33 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height, v28);
          [v33 fill];
        }
        double v34 = _UIGraphicsGetImageFromCurrentImageContext(0);
        UIGraphicsEndImageContext();
        objc_msgSend(v34, "resizableImageWithCapInsets:", v20 + v28, 0.0, v20 + v28, 0.0);
        double v15 = (UIImage *)objc_claimAutoreleasedReturnValue();

        if (!v15) {
          goto LABEL_21;
        }
      }
      else
      {
        _UIGraphicsBeginImageContextWithOptions(0, 0, v17, 1.0, 0.0);
        double v25 = +[UIColor blackColor];
        [v25 set];

        UIRectFillUsingOperation(1, 0.0, 0.0, v17, 1.0);
        v26 = _UIGraphicsGetImageFromCurrentImageContext(0);
        UIGraphicsEndImageContext();
        double v27 = [v26 imageWithRenderingMode:2];

        double v15 = [(UIImage *)[_UISegmentedControlDividerImage alloc] _initWithOtherImage:v27];
        if (!v15) {
          goto LABEL_21;
        }
      }
    }
    else
    {
      double v15 = objc_alloc_init(UIImage);
      if (!v15) {
        goto LABEL_21;
      }
    }
    [(id)qword_1EB25E580 setObject:v15 forKey:v14];
LABEL_21:
  }
  return v15;
}

+ (CGColor)_dividerPrimaryColorBackground:(BOOL)a3 traitCollection:(id)a4 tintColor:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = UISegmentedControlStyleProviderForIdiom(a1, [v8 userInterfaceIdiom]);
  if ([v10 useSelectionIndicatorStyling])
  {
    if (v6)
    {
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = +[UIColor tertiarySystemFillColor];
      }
    }
    else
    {
      id v11 = +[UIColor systemFillColor];
    }
    uint64_t v13 = v11;
    id v14 = [v11 resolvedColorWithTraitCollection:v8];
    uint64_t v12 = (CGColor *)[v14 CGColor];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)_backgroundTintColor
{
  return self->_backgroundTintColor;
}

+ (double)_lineWidthForTraitCollection:(id)a3 size:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = UISegmentedControlStyleProviderForIdiom(a1, [a3 userInterfaceIdiom]);
  [v5 dividerWidthForControlSize:v4];
  double v7 = v6;

  return v7;
}

- (double)_barHeight
{
  if ((*((unsigned char *)&self->_segmentedControlFlags + 1) & 0x40) != 0)
  {
    double v7 = [(UISegmentedControl *)self titleTextAttributesForState:0];
    id v8 = [v7 objectForKey:*(void *)off_1E52D2040];
    id v9 = v8;
    if (v8)
    {
      id v5 = v8;
    }
    else
    {
      id v10 = objc_opt_class();
      id v11 = [(UIView *)self traitCollection];
      objc_msgSend(v10, "_fontForTraitCollection:size:selected:", v11, -[UISegmentedControl controlSize](self, "controlSize"), 0);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    [v5 lineHeight];
    UICeilToViewScale(self);
  }
  else
  {
    v3 = objc_opt_class();
    id appearanceStorage = self->_appearanceStorage;
    id v5 = [(UIView *)self traitCollection];
    double v6 = segmentBarHeight(v3, appearanceStorage, (uint64_t)v5, *(_DWORD *)&self->_segmentedControlFlags & 3);
  }
  double v12 = v6;

  return v12;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UISegmentedControl *)self frame];
  BOOL v10 = height == v9 && width == v8;
  v12.receiver = self;
  v12.super_class = (Class)UISegmentedControl;
  -[UIView setFrame:](&v12, sel_setFrame_, x, y, width, height);
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
  if ((*(unsigned char *)&segmentedControlFlags & 0x40) == 0) {
    self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFFFDF);
  }
  if (!v10) {
    [(UIView *)self setNeedsLayout];
  }
}

- (CGRect)frame
{
  if ((~*(_DWORD *)&self->_segmentedControlFlags & 0x820) == 0) {
    [(UISegmentedControl *)self _resetForAppearanceChange];
  }
  v7.receiver = self;
  v7.super_class = (Class)UISegmentedControl;
  [(UIView *)&v7 frame];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (int64_t)_segmentIndexToHighlight:(BOOL *)a3
{
  if ([(UISegmentedControl *)self _disableSlidingControl])
  {
    *a3 = 0;
    return -1;
  }
  else if (((*((unsigned char *)&self->_segmentedControlFlags + 1) & 0x10) != 0 {
          || [(UISegmentedControl *)self _animateHighlightingSelectionByDefault])&& (int64_t result = self->_highlightedSegment, (result & 0x8000000000000000) == 0))
  }
  {
    *a3 = 1;
  }
  else
  {
    uint64_t selectedSegment = self->_selectedSegment;
    *a3 = 0;
    if (selectedSegment < 0) {
      return -1;
    }
    else {
      return selectedSegment;
    }
  }
  return result;
}

- (BOOL)_disableSlidingControl
{
  if ([(UISegmentedControl *)self isMomentary] || _AXSReduceMotionEnabled()) {
    return 1;
  }
  double v4 = [self->_appearanceStorage backgroundImageForState:0 isMini:0 withFallback:1];
  BOOL v3 = v4 != 0;

  return v3;
}

- (BOOL)isMomentary
{
  return (*(unsigned char *)&self->_segmentedControlFlags >> 3) & 1;
}

- (void)_updateSelectionToSegment:(id)a3 highlight:(BOOL)a4 shouldAnimate:(BOOL)a5 sameSegment:(BOOL)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  double v9 = a3;
  long long v189 = 0u;
  long long v188 = 0u;
  long long v187 = 0u;
  long long v186 = 0u;
  long long v185 = 0u;
  long long v184 = 0u;
  long long v183 = 0u;
  long long v182 = 0u;
  p_selectionImageView = &self->_selectionImageView;
  id v11 = [(UIView *)self->_selectionImageView layer];
  objc_super v12 = [v11 presentationLayer];
  uint64_t v13 = [(UIView *)self->_selectionImageView layer];
  id v14 = v13;
  if (v12)
  {
    double v15 = [v13 presentationLayer];
    double v16 = v15;
    if (v15)
    {
      [v15 transform];
    }
    else
    {
      long long v189 = 0u;
      long long v188 = 0u;
      long long v187 = 0u;
      long long v186 = 0u;
      long long v185 = 0u;
      long long v184 = 0u;
      long long v183 = 0u;
      long long v182 = 0u;
    }
  }
  else if (v13)
  {
    [v13 transform];
  }
  else
  {
    long long v189 = 0u;
    long long v188 = 0u;
    long long v187 = 0u;
    long long v186 = 0u;
    long long v185 = 0u;
    long long v184 = 0u;
    long long v183 = 0u;
    long long v182 = 0u;
  }

  double v17 = [(UIView *)*p_selectionImageView layer];
  int v18 = [v17 presentationLayer];
  double v19 = [(UIView *)*p_selectionImageView layer];
  double v20 = v19;
  if (v18)
  {
    double v21 = [v19 presentationLayer];
    [v21 position];
    uint64_t v23 = v22;
    uint64_t v25 = v24;
  }
  else
  {
    [v19 position];
    uint64_t v23 = v26;
    uint64_t v25 = v27;
  }

  double v28 = [(UIView *)*p_selectionImageView layer];
  uint64_t v29 = [v28 presentationLayer];
  uint64_t v30 = [(UIView *)*p_selectionImageView layer];
  double v31 = v30;
  if (v29)
  {
    double v32 = [v30 presentationLayer];
    [v32 bounds];
    uint64_t v155 = v34;
    uint64_t v156 = v33;
    uint64_t v153 = v36;
    uint64_t v154 = v35;
  }
  else
  {
    [v30 bounds];
    uint64_t v155 = v38;
    uint64_t v156 = v37;
    uint64_t v153 = v40;
    uint64_t v154 = v39;
  }

  v41 = -[UIView _backing_outermostLayer](v9);
  [v41 position];
  double v43 = v42;
  double v45 = v44;

  v46 = objc_opt_class();
  v47 = -[UIView _backing_outermostLayer](v9);
  [v47 bounds];
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  uint64_t v56 = [(UISegmentedControl *)self controlSize];
  v57 = [(UIView *)self traitCollection];
  objc_msgSend(v46, "_selectionFrameForBounds:size:traitCollection:accessibilityView:", v56, v57, 0, v49, v51, v53, v55);
  double v59 = v58;
  double v61 = v60;

  v62 = (double *)MEMORY[0x1E4F1DAD8];
  v63 = self;
  backdropView = v63->_backdropView;
  if (backdropView)
  {
    if ((*((unsigned char *)&v63->_segmentedControlFlags + 3) & 4) != 0) {
      [(UIView *)backdropView contentView];
    }
    else {
    v65 = [(UIView *)v63 viewWithTag:-2031];
    }
  }
  else
  {
    v65 = v63;
  }
  v66 = v65;
  double v67 = *v62;
  double v68 = v62[1];

  v69 = [(UIView *)v66 viewWithTag:-2030];

  if ([(UISegmentedControl *)v63 _animateHighlightingSelectionByDefault])
  {
    if (v7 && a6
      || (-[UISegmentedControl _updateHighlightToPosition:bounds:highlight:](v63, "_updateHighlightToPosition:bounds:highlight:", v7, v43, v45, v67, v68, v59, v61), v7))
    {
      if ([v9 isHighlighted])
      {
        [(UIView *)v63->_highlightImageView center];
        double v71 = v70;
        double v73 = v72;
        [(UIView *)*p_selectionImageView center];
        BOOL v76 = v73 == v75 && v71 == v74;
      }
      else
      {
        BOOL v76 = 1;
      }
      [(UIImageView *)v63->_highlightImageView setHidden:v76];
      goto LABEL_77;
    }
    v77 = [(UIView *)*p_selectionImageView layer];
    [(UIView *)v77 position];
    if (v79 != v43 || v78 != v45)
    {
      highlightImageView = v63->_highlightImageView;

      if (!highlightImageView) {
        goto LABEL_43;
      }
      v152 = *p_selectionImageView;
      objc_storeStrong((id *)p_selectionImageView, v63->_highlightImageView);
      [(UIImageView *)*p_selectionImageView setHidden:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v81 = [(UIView *)v63->_selectionIndicatorView contentView];
        [v81 addSubview:*p_selectionImageView];
      }
      v82 = v63->_highlightImageView;
      v63->_highlightImageView = 0;

      v83 = [(UIView *)*p_selectionImageView layer];
      v84 = [v83 animationKeys];
      int v85 = [v84 containsObject:@"HighlightScaleUp"];

      if (v85)
      {
        memset(&v181, 0, sizeof(v181));
        v86 = [(UIView *)*p_selectionImageView layer];
        v87 = [v86 presentationLayer];
        v88 = v87;
        if (v87) {
          [v87 transform];
        }
        else {
          memset(&v181, 0, sizeof(v181));
        }

        CATransform3D v180 = v181;
        v89 = [v69 layer];
        CATransform3D v179 = v180;
        [v89 setTransform:&v179];

        v151 = [v69 layer];
        v90 = objc_opt_class();
        CATransform3D v178 = v181;
        v91 = [MEMORY[0x1E4F29238] valueWithBytes:&v178 objCType:"{CATransform3D=dddddddddddddddd}"];
        long long v92 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
        v177[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
        v177[5] = v92;
        long long v93 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
        v177[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
        v177[7] = v93;
        long long v94 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
        v177[0] = *MEMORY[0x1E4F39B10];
        v177[1] = v94;
        long long v95 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
        v177[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
        v177[3] = v95;
        v96 = [MEMORY[0x1E4F29238] valueWithBytes:v177 objCType:"{CATransform3D=dddddddddddddddd}"];
        v97 = [v90 _highlightPinchAnimationForKey:@"transform" fromValue:v91 toValue:v96];
        [v151 addAnimation:v97 forKey:@"ShadowScale"];
      }
      [MEMORY[0x1E4F39CF8] begin];
      v98 = (void *)MEMORY[0x1E4F39CF8];
      v175[0] = MEMORY[0x1E4F143A8];
      v175[1] = 3221225472;
      v175[2] = __84__UISegmentedControl__updateSelectionToSegment_highlight_shouldAnimate_sameSegment___block_invoke;
      v175[3] = &unk_1E52D9F70;
      v176 = v152;
      v77 = v152;
      [v98 setCompletionBlock:v175];
      v99 = [(id)objc_opt_class() _selectionFadeAnimationForKey:@"opacity" fromValue:&unk_1ED3F3C90 toValue:&unk_1ED3F3CA8];
      v100 = [(UIView *)v77 layer];
      [v100 addAnimation:v99 forKey:@"SelectionFadeOut"];

      v101 = [(UIView *)v77 layer];
      [v101 setOpacity:0.0];

      [MEMORY[0x1E4F39CF8] commit];
    }
  }
LABEL_43:
  memset(&v181, 0, sizeof(v181));
  if (v9)
  {
    if (!v7)
    {
      long long v106 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      *(_OWORD *)&v181.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      *(_OWORD *)&v181.m33 = v106;
      long long v107 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      *(_OWORD *)&v181.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      *(_OWORD *)&v181.m43 = v107;
      long long v108 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)&v181.m11 = *MEMORY[0x1E4F39B10];
      *(_OWORD *)&v181.m13 = v108;
      long long v109 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      long long v110 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      goto LABEL_57;
    }
    v102 = objc_opt_class();
    v103 = [(UIView *)v63 traitCollection];
    if (v102) {
      [v102 _highlightSelectionTransformForTraitCollection:v103];
    }
    else {
      memset(&v181, 0, sizeof(v181));
    }

LABEL_56:
    [(id)objc_opt_class() _selectionOffsetAdjustmentForSegment:v9];
    CATransform3D v173 = v181;
    CATransform3DTranslate(&b, &v173, v111, 0.0, 0.0);
    *(_OWORD *)&v181.m31 = *(_OWORD *)&b.m31;
    *(_OWORD *)&v181.m33 = *(_OWORD *)&b.m33;
    *(_OWORD *)&v181.m41 = *(_OWORD *)&b.m41;
    *(_OWORD *)&v181.m43 = *(_OWORD *)&b.m43;
    *(_OWORD *)&v181.m11 = *(_OWORD *)&b.m11;
    *(_OWORD *)&v181.m13 = *(_OWORD *)&b.m13;
    long long v109 = *(_OWORD *)&b.m21;
    long long v110 = *(_OWORD *)&b.m23;
LABEL_57:
    *(_OWORD *)&v181.m21 = v109;
    *(_OWORD *)&v181.m23 = v110;
    if (!v6) {
      goto LABEL_75;
    }
    goto LABEL_58;
  }
  v104 = objc_opt_class();
  v105 = [(UIView *)v63 traitCollection];
  if (v104) {
    [v104 _hiddenSelectionTransformForTraitCollection:v105];
  }
  else {
    memset(&v181, 0, sizeof(v181));
  }

  if (v7) {
    goto LABEL_56;
  }
  if (!v6) {
    goto LABEL_75;
  }
LABEL_58:
  v112 = [(UIView *)*p_selectionImageView layer];
  v113 = v112;
  if (v112) {
    [v112 transform];
  }
  else {
    memset(&a, 0, sizeof(a));
  }
  CATransform3D b = v181;
  if (!CATransform3DEqualToTransform(&a, &b)) {
    goto LABEL_68;
  }
  if (a6)
  {
LABEL_74:

    goto LABEL_75;
  }
  v114 = [(UIView *)*p_selectionImageView layer];
  [v114 position];
  if (v116 != v43 || v115 != v45)
  {

LABEL_68:
LABEL_69:
    v119 = [(UIView *)*p_selectionImageView layer];
    v120 = objc_opt_class();
    v171[4] = v186;
    v171[5] = v187;
    v171[6] = v188;
    v171[7] = v189;
    v171[0] = v182;
    v171[1] = v183;
    v171[2] = v184;
    v171[3] = v185;
    v121 = [MEMORY[0x1E4F29238] valueWithBytes:v171 objCType:"{CATransform3D=dddddddddddddddd}"];
    CATransform3D v170 = v181;
    v122 = [MEMORY[0x1E4F29238] valueWithBytes:&v170 objCType:"{CATransform3D=dddddddddddddddd}"];
    v123 = [v120 _selectionPopAnimationForKey:@"transform" fromValue:v121 toValue:v122];
    [v119 addAnimation:v123 forKey:@"SelectionScale"];

    v124 = objc_opt_class();
    v169[0] = v23;
    v169[1] = v25;
    v125 = [MEMORY[0x1E4F29238] valueWithBytes:v169 objCType:"{CGPoint=dd}"];
    *(double *)v168 = v43;
    *(double *)&v168[1] = v45;
    v126 = [MEMORY[0x1E4F29238] valueWithBytes:v168 objCType:"{CGPoint=dd}"];
    v113 = [v124 _selectionPopAnimationForKey:@"position" fromValue:v125 toValue:v126];

    if (!a6 && [v9 isHovered])
    {
      *(_DWORD *)&v63->_segmentedControlFlags |= 0x20000u;
      v127 = [(UIControl *)v63 pointerInteraction];
      [v127 invalidate];

      [v113 setDelegate:v63];
      [v9 setAnimatingSelectionIndicator:1];
    }
    v128 = [(UIView *)*p_selectionImageView layer];
    [v128 addAnimation:v113 forKey:@"SelectionPosition"];

    v129 = [(UIView *)*p_selectionImageView layer];
    v130 = objc_opt_class();
    v167[0] = v156;
    v167[1] = v155;
    v167[2] = v154;
    v167[3] = v153;
    v131 = [MEMORY[0x1E4F29238] valueWithBytes:v167 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    *(double *)v166 = v67;
    *(double *)&v166[1] = v68;
    *(double *)&v166[2] = v59;
    *(double *)&v166[3] = v61;
    v132 = [MEMORY[0x1E4F29238] valueWithBytes:v166 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    v133 = [v130 _selectionPopAnimationForKey:@"bounds" fromValue:v131 toValue:v132];
    [v129 addAnimation:v133 forKey:@"SelectionBounds"];

    if (v69)
    {
      v134 = [v69 layer];
      v135 = objc_opt_class();
      v165[4] = v186;
      v165[5] = v187;
      v165[6] = v188;
      v165[7] = v189;
      v165[0] = v182;
      v165[1] = v183;
      v165[2] = v184;
      v165[3] = v185;
      v136 = [MEMORY[0x1E4F29238] valueWithBytes:v165 objCType:"{CATransform3D=dddddddddddddddd}"];
      CATransform3D v164 = v181;
      v137 = [MEMORY[0x1E4F29238] valueWithBytes:&v164 objCType:"{CATransform3D=dddddddddddddddd}"];
      v138 = [v135 _selectionPopAnimationForKey:@"transform" fromValue:v136 toValue:v137];
      [v134 addAnimation:v138 forKey:@"SelectionScale"];

      v139 = [v69 layer];
      [v139 addAnimation:v113 forKey:@"SelectionPosition"];

      v140 = [v69 layer];
      v141 = objc_opt_class();
      v163[0] = v156;
      v163[1] = v155;
      v163[2] = v154;
      v163[3] = v153;
      v142 = [MEMORY[0x1E4F29238] valueWithBytes:v163 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      *(double *)v162 = v67;
      *(double *)&v162[1] = v68;
      *(double *)&v162[2] = v59;
      *(double *)&v162[3] = v61;
      v143 = [MEMORY[0x1E4F29238] valueWithBytes:v162 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      v144 = [v141 _selectionPopAnimationForKey:@"bounds" fromValue:v142 toValue:v143];
      [v140 addAnimation:v144 forKey:@"SelectionBounds"];
    }
    goto LABEL_74;
  }
  v117 = [(UIView *)*p_selectionImageView layer];
  [v117 bounds];
  v191.origin.double x = v67;
  v191.origin.double y = v68;
  v191.size.double width = v59;
  v191.size.double height = v61;
  BOOL v118 = CGRectEqualToRect(v190, v191);

  if (!v118) {
    goto LABEL_69;
  }
LABEL_75:
  v145 = [(UIView *)*p_selectionImageView layer];
  objc_msgSend(v145, "setPosition:", v43, v45);

  v146 = [(UIView *)*p_selectionImageView layer];
  objc_msgSend(v146, "setBounds:", v67, v68, v59, v61);

  CATransform3D v161 = v181;
  v147 = [(UIView *)*p_selectionImageView layer];
  CATransform3D v160 = v161;
  [v147 setTransform:&v160];

  if (v69)
  {
    v148 = [v69 layer];
    objc_msgSend(v148, "setPosition:", v43, v45);

    v149 = [v69 layer];
    objc_msgSend(v149, "setBounds:", v67, v68, v59, v61);

    CATransform3D v159 = v181;
    v150 = [v69 layer];
    CATransform3D v158 = v159;
    [v150 setTransform:&v158];
  }
LABEL_77:
}

- (BOOL)_animateHighlightingSelectionByDefault
{
  if ((*((unsigned char *)&self->_segmentedControlFlags + 2) & 0x10) == 0) {
    return 0;
  }
  double v4 = objc_opt_class();
  double v5 = [(UIView *)self traitCollection];
  BOOL v6 = UISegmentedControlStyleProviderForIdiom(v4, [v5 userInterfaceIdiom]);

  LOBYTE(v5) = [v6 animateHighlightingSelectionByDefault];
  return (char)v5;
}

- (void)layoutSubviews
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  v2 = self;
  backdropView = v2->_backdropView;
  if (backdropView)
  {
    if ((*((unsigned char *)&v2->_segmentedControlFlags + 3) & 4) != 0) {
      [(UIView *)backdropView contentView];
    }
    else {
    double v4 = [(UIView *)v2 viewWithTag:-2031];
    }
  }
  else
  {
    double v4 = v2;
  }
  double v5 = v4;

  if ((*((unsigned char *)&v2->_segmentedControlFlags + 1) & 8) != 0) {
    [(UISegmentedControl *)v2 _resetForAppearanceChange];
  }
  [(UISegmentedControl *)v2 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [v2->_appearanceStorage anyDividerImageForMini:0];
  double v15 = v14;
  if (v14)
  {
    [v14 size];
    double innerSegmentSpacing = v16;
  }
  else
  {
    if ((*((unsigned char *)&v2->_segmentedControlFlags + 1) & 0x20) != 0)
    {
      double innerSegmentSpacing = v2->_innerSegmentSpacing;
    }
    else
    {
      int v18 = objc_opt_class();
      double v19 = [(UIView *)v2 traitCollection];
      objc_msgSend(v18, "_dividerWidthForTraitCollection:size:", v19, -[UISegmentedControl controlSize](v2, "controlSize"));
      double innerSegmentSpacing = v20;
    }
    double v16 = 0.0;
  }
  double v113 = v16;
  uint64_t v21 = [(NSMutableArray *)v2->_segments count];
  uint64_t v22 = v2->_segments;
  if ((*((_DWORD *)&v2->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    uint64_t v23 = [(NSMutableArray *)v2->_segments reverseObjectEnumerator];
    uint64_t v24 = [v23 allObjects];

    uint64_t v22 = (NSMutableArray *)v24;
  }
  double v111 = v9;
  v123[0] = MEMORY[0x1E4F143A8];
  v123[1] = 3221225472;
  v123[2] = __36__UISegmentedControl_layoutSubviews__block_invoke;
  v123[3] = &__block_descriptor_40_e26_v32__0__UISegment_8Q16_B24l;
  v123[4] = v21;
  [(NSMutableArray *)v22 enumerateObjectsUsingBlock:v123];
  uint64_t v25 = (double *)malloc_type_malloc(8 * v21, 0x100004000313F17uLL);
  double v26 = (double)v21;
  rect[0] = v21 - 1;
  double v27 = v11 - innerSegmentSpacing * (double)(v21 - 1);
  if (v21 < 1)
  {
    double v29 = 0.0;
  }
  else
  {
    uint64_t v28 = 0;
    double v29 = 0.0;
    do
    {
      uint64_t v30 = [(NSMutableArray *)v22 objectAtIndex:v28];
      double v31 = v30;
      double v32 = v30[70];
      if (v32 <= 0.0)
      {
        [v30 _idealWidth];
        double v29 = v29 + v32;
      }
      else
      {
        double v27 = v27 - v32;
        double v26 = v26 + -1.0;
      }
      v25[v28] = v32;

      ++v28;
    }
    while (v21 != v28);
  }
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = v2->_segmentedControlFlags;
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = [(UIView *)v2 traitCollection];
  uint64_t v36 = UISegmentedControlStyleProviderForIdiom(v34, [v35 userInterfaceIdiom]);
  int v115 = [v36 useSelectionIndicatorStyling];

  v114 = v2;
  if (v21 < 1)
  {
    id v112 = 0;
  }
  else
  {
    uint64_t v37 = 0;
    double v38 = v27 / v29;
    double v39 = 0.0;
    double v40 = v27 / v26;
    do
    {
      v41 = [(NSMutableArray *)v22 objectAtIndex:v37];
      if (v41[70] == 0.0)
      {
        if ((*(_WORD *)&segmentedControlFlags & 0x200) != 0)
        {
          double v44 = v38 * v25[v37];
          double v45 = floor(v44);
          double v43 = ceil(v113 + v44);
          if (v37 < rect[0]) {
            double v43 = v45;
          }
        }
        else
        {
          double v42 = floor(v40 + v39);
          double v43 = ceil(v40 + v39);
          if (v37 < rect[0]) {
            double v43 = v42;
          }
          double v39 = v40 - v43;
        }
        v25[v37] = v43;
      }

      ++v37;
    }
    while (v21 != v37);
    long long v110 = v15;
    uint64_t v46 = 0;
    id v112 = 0;
    double v47 = 1.0;
    do
    {
      double v48 = [(NSMutableArray *)v22 objectAtIndex:v46];
      double v49 = v48;
      double v50 = floor(v7 + v25[v46]);
      if (v21 - 1 == v46) {
        unsigned int v51 = 2;
      }
      else {
        unsigned int v51 = 1;
      }
      if (!v46) {
        unsigned int v51 = 0;
      }
      if (v21 == 1) {
        uint64_t v52 = 3;
      }
      else {
        uint64_t v52 = v51;
      }
      [v48 setSegmentPosition:v52];
      objc_msgSend(v49, "setFrame:", v7, v111, v50 - v7, v13);
      id v53 = v49[64];
      if (v53)
      {
        [(UIView *)v5 insertSubview:v53 atIndex:v46];
        [v49 frame];
        objc_msgSend(v53, "setFrame:");
      }
      BOOL v54 = (*(_DWORD *)&v2->_segmentedControlFlags & 0x4080) != 0
         && (*(_DWORD *)&v2->_segmentedControlFlags & 0x1000) == 0;
      if (v54)
      {
        double v55 = [v49 label];
        uint64_t v56 = v55;
        if (v55
          && ([v55 setAssociatedLabel:0],
              [v49 _positionInfo],
              [v56 _actualScaleFactor],
              double v58 = v57,
              [v56 transform],
              double v59 = v58 * v122,
              v58 * v122 < v47))
        {
          id v60 = v56;

          id v112 = v60;
        }
        else
        {
          double v59 = v47;
        }

        double v47 = v59;
      }
      if (v53) {
        double v61 = (id *)v53;
      }
      else {
        double v61 = v49;
      }
      v62 = v61;
      v63 = [v62 viewWithTag:-1030];
      [v63 frame];
      objc_msgSend(v63, "setFrame:");
      if (v115)
      {
        uint64_t v64 = v46 + 1;
      }
      else
      {
        int64_t selectedSegment = v2->_selectedSegment;
        uint64_t v64 = v46 + 1;
        if (v46 != selectedSegment && v64 != selectedSegment) {
          [(UIView *)v5 sendSubviewToBack:v49];
        }
      }
      [v49 setShowDivider:v46 < rect[0]];
      double v7 = innerSegmentSpacing + v50;

      uint64_t v46 = v64;
      BOOL v54 = v64 == v21;
      v2 = v114;
    }
    while (!v54);
    if (v47 < 1.0)
    {
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __36__UISegmentedControl_layoutSubviews__block_invoke_2;
      v120[3] = &unk_1E52EAF90;
      id v112 = v112;
      id v121 = v112;
      [(NSMutableArray *)v22 enumerateObjectsUsingBlock:v120];
    }
    double v15 = v110;
  }
  free(v25);
  if ((v2->_selectedSegment & 0x8000000000000000) == 0 && (*((unsigned char *)&v2->_segmentedControlFlags + 2) & 4) == 0)
  {
    double v67 = -[NSMutableArray objectAtIndex:](v22, "objectAtIndex:");
    [(UIView *)v5 bringSubviewToFront:v67];
  }
  if (v115)
  {
    if ((*(_DWORD *)&v2->_segmentedControlFlags & 0x40010) != 0x10) {
      goto LABEL_89;
    }
  }
  else
  {
    uint64_t v68 = v2->_selectedSegment;
    if (v68 >= 1)
    {
      v69 = [(NSMutableArray *)v22 objectAtIndex:v68 - 1];
      [(UIView *)v5 bringSubviewToFront:v69];
    }
    if ((*(_DWORD *)&v2->_segmentedControlFlags & 0x40010) != 0x10) {
      goto LABEL_87;
    }
  }
  if ((v2->_highlightedSegment & 0x8000000000000000) == 0)
  {
    double v70 = -[NSMutableArray objectAtIndex:](v22, "objectAtIndex:");
    [(UIView *)v5 bringSubviewToFront:v70];
  }
  if ((v115 & 1) == 0)
  {
    uint64_t highlightedSegment = v2->_highlightedSegment;
    if (highlightedSegment >= 1)
    {
      double v72 = [(NSMutableArray *)v22 objectAtIndex:highlightedSegment - 1];
      [(UIView *)v5 bringSubviewToFront:v72];
    }
LABEL_87:
    if (v2->_removedSegment) {
      -[UIView sendSubviewToBack:](v5, "sendSubviewToBack:");
    }
  }
LABEL_89:
  long long v118 = 0u;
  long long v119 = 0u;
  *(_OWORD *)&rect[3] = 0u;
  long long v117 = 0u;
  double v73 = v22;
  uint64_t v74 = [(NSMutableArray *)v73 countByEnumeratingWithState:&rect[3] objects:v124 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v117;
    do
    {
      for (uint64_t i = 0; i != v75; ++i)
      {
        if (*(void *)v117 != v76) {
          objc_enumerationMutation(v73);
        }
        double v78 = *(void **)(rect[4] + 8 * i);
        double v79 = [v78 badgeView];
        v80 = v79;
        if (v79)
        {
          v81 = [v79 superview];

          if (!v81) {
            [(UIView *)v5 addSubview:v80];
          }
          [v78 frame];
          CGFloat v83 = v82;
          *(double *)rect = v82;
          CGFloat v85 = v84;
          CGFloat v87 = v86;
          CGFloat v89 = v88;
          [v80 frame];
          CGFloat v91 = v90;
          CGFloat v93 = v92;
          double v95 = v94;
          double v97 = v96;
          v126.origin.double x = v83;
          v126.origin.double y = v85;
          v126.size.double width = v87;
          v126.size.double height = v89;
          double MaxX = CGRectGetMaxX(v126);
          v127.origin.double x = v91;
          v127.origin.double y = v93;
          v127.size.double width = v95;
          v127.size.double height = v97;
          CGFloat v99 = ceil(MaxX - CGRectGetWidth(v127) * 0.5 + -6.0);
          *(void *)&v128.origin.double x = rect[0];
          v128.origin.double y = v85;
          v128.size.double width = v87;
          v128.size.double height = v89;
          double MinY = CGRectGetMinY(v128);
          v129.origin.double x = v99;
          v129.origin.double y = v93;
          v129.size.double width = v95;
          v129.size.double height = v97;
          objc_msgSend(v80, "setFrame:", v99, ceil(MinY - CGRectGetHeight(v129) * 0.5 + 6.0), v95, v97);
          [(UIView *)v5 bringSubviewToFront:v80];
        }
      }
      uint64_t v75 = [(NSMutableArray *)v73 countByEnumeratingWithState:&rect[3] objects:v124 count:16];
    }
    while (v75);
  }

  if (v114->_focusedSegment) {
    -[UIView bringSubviewToFront:](v5, "bringSubviewToFront:");
  }
  v101 = v114->_backdropView;
  if (v101)
  {
    if ((*((unsigned char *)&v114->_segmentedControlFlags + 3) & 4) == 0)
    {
      v102 = [(UIView *)v114 viewWithTag:-2031];
      [(UIView *)v114 sendSubviewToBack:v102];

      v101 = v114->_backdropView;
    }
    [(UIView *)v114 sendSubviewToBack:v101];
  }
  if (v115)
  {
    v103 = objc_opt_class();
    v104 = [(UIView *)v114 traitCollection];
    objc_msgSend(v103, "_cornerRadiusForTraitCollection:size:", v104, -[UISegmentedControl controlSize](v114, "controlSize"));
    -[UIView _setCornerRadius:](v5, "_setCornerRadius:");

    [(UISegmentedControl *)v114 _updateSelectionIndicator];
    selectionIndicatorView = v114->_selectionIndicatorView;
    if (selectionIndicatorView)
    {
      int64_t hoveredSegment = v114->_hoveredSegment;
      if (hoveredSegment == -1 || (int64_t v107 = v114->_selectedSegment, v107 == -1) || v107 == hoveredSegment)
      {
        [(UIView *)v5 insertSubview:selectionIndicatorView atIndex:[(NSMutableArray *)v114->_segments count]];
      }
      else
      {
        long long v108 = -[NSMutableArray objectAtIndexedSubscript:](v114->_segments, "objectAtIndexedSubscript:");
        [(UIView *)v5 insertSubview:selectionIndicatorView below:v108];
      }
      long long v109 = [(UIView *)v5 viewWithTag:-2030];
      if (v109) {
        [(UIView *)v5 insertSubview:v109 belowSubview:v114->_selectionIndicatorView];
      }
    }
  }
  rect[1] = v114;
  rect[2] = UISegmentedControl;
  objc_msgSendSuper2((objc_super *)&rect[1], sel_layoutSubviews);
}

- (CGRect)bounds
{
  if ((~*(_DWORD *)&self->_segmentedControlFlags & 0x820) == 0) {
    [(UISegmentedControl *)self _resetForAppearanceChange];
  }
  v7.receiver = self;
  v7.super_class = (Class)UISegmentedControl;
  [(UIView *)&v7 bounds];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (int)controlSize
{
  return *(_DWORD *)&self->_segmentedControlFlags & 3;
}

- (void)_updateSelectionIndicator
{
  double v3 = objc_opt_class();
  double v4 = [(UIView *)self traitCollection];
  double v5 = UISegmentedControlStyleProviderForIdiom(v3, [v4 userInterfaceIdiom]);

  if ([v5 useSelectionIndicatorStyling])
  {
    unsigned __int8 v55 = 0;
    int64_t v6 = [(UISegmentedControl *)self _segmentIndexToHighlight:&v55];
    uint64_t v7 = 0;
    if (+[UIView areAnimationsEnabled])
    {
      double v8 = [(UIView *)self window];
      if (v8) {
        uint64_t v7 = [v5 animateSlidingSelectionByDefault];
      }
      else {
        uint64_t v7 = 0;
      }
    }
    int64_t selectionIndicatorSegment = self->_selectionIndicatorSegment;
    self->_int64_t selectionIndicatorSegment = v6;
    if (v6 == -1)
    {
      double v11 = 0;
    }
    else
    {
      double v10 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:v6];
      double v11 = v10;
      if (v10)
      {
        [v10 size];
        if (v12 > 0.0)
        {
          [v11 size];
          if (v13 > 0.0
            && (v6 != selectionIndicatorSegment
             || ![v11 isHovered]
             || [v11 isAnimatingSelectionIndicator]))
          {
            if (self->_selectionIndicatorView)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ([v5 useGeneratedImages])
                {
                  id v14 = objc_opt_class();
                  [(UIView *)self->_selectionImageView bounds];
                  double v16 = v15;
                  double v18 = v17;
                  double v19 = [(UIView *)self traitCollection];
                  double v20 = [(UISegmentedControl *)self selectedSegmentTintColor];
                  uint64_t v21 = objc_msgSend(v14, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 1, 0, v19, v20, *(_DWORD *)&self->_segmentedControlFlags & 3, v16, v18);
                }
                else
                {
                  uint64_t v21 = 0;
                }
                [(UIImageView *)self->_selectionImageView setImage:v21];
                uint64_t v36 = self;
                backdropView = v36->_backdropView;
                if (backdropView)
                {
                  if ((*((unsigned char *)&v36->_segmentedControlFlags + 3) & 4) != 0) {
                    [(UIView *)backdropView contentView];
                  }
                  else {
                  double v38 = [(UIView *)v36 viewWithTag:-2031];
                  }
                }
                else
                {
                  double v38 = v36;
                }
                v41 = v38;

                double v42 = [(UIView *)v41 viewWithTag:-2030];

                if (v42)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v52 = objc_opt_class();
                    [v42 bounds];
                    double v44 = v43;
                    double v46 = v45;
                    [(UIView *)v36 traitCollection];
                    v47 = BOOL v54 = v21;
                    double v48 = [(UISegmentedControl *)v36 selectedSegmentTintColor];
                    double v49 = objc_msgSend(v52, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 2, 0, v47, v48, *(_DWORD *)&v36->_segmentedControlFlags & 3, v44, v46);

                    uint64_t v21 = v54;
                    [v42 setImage:v49];
                  }
                }
              }
              else
              {
                BOOL v30 = [(UISegmentedControl *)self transparentBackground];
                BOOL v31 = [(UISegmentedControl *)self _useDynamicShadow];
                uint64_t v21 = [(UIView *)self traitCollection];
                double v32 = [(UISegmentedControl *)self selectedSegmentTintColor];
                BOOL v51 = v30;
                id v53 = v32;
                if ([v5 useGeneratedImages])
                {
                  double v50 = objc_opt_class();
                  [(UIView *)self->_selectionImageView bounds];
                  uint64_t v35 = objc_msgSend(v50, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, v30 | v31, 0, v21, v32, *(_DWORD *)&self->_segmentedControlFlags & 3, v33, v34);
                }
                else
                {
                  uint64_t v35 = 0;
                }
                [(UIImageView *)self->_selectionImageView setImage:v35];
                if (v31)
                {
                  if (!v51
                    && [(id)objc_opt_class() _useShadowForSelectedTintColor:v32 traitCollection:v21])
                  {
                    [(UISegmentedControl *)self _updateDynamicShadow:1 animated:0];
                  }
                }
                else
                {
                  [(UIView *)self->_selectionImageView layer];
                  v40 = double v39 = v21;
                  [v40 setShadowOpacity:0.0];

                  uint64_t v21 = v39;
                  double v32 = v53;
                }
              }
            }
            else
            {
              [(UISegmentedControl *)self _insertSelectionViewForSegment:v11];
              uint64_t v7 = 0;
            }
            [(UISegmentedControl *)self _updateSelectionToSegment:v11 highlight:v55 shouldAnimate:v7 sameSegment:v6 == selectionIndicatorSegment];
LABEL_28:

            goto LABEL_29;
          }
        }
      }
    }
    [(UIView *)self->_highlightIndicatorView removeFromSuperview];
    highlightIndicatorView = self->_highlightIndicatorView;
    self->_highlightIndicatorView = 0;

    [(UIView *)self->_selectionIndicatorView removeFromSuperview];
    selectionIndicatorView = self->_selectionIndicatorView;
    self->_selectionIndicatorView = 0;

    selectionImageView = self->_selectionImageView;
    self->_selectionImageView = 0;

    uint64_t v25 = self;
    double v26 = v25->_backdropView;
    if (v26)
    {
      if ((*((unsigned char *)&v25->_segmentedControlFlags + 3) & 4) != 0) {
        [(UIView *)v26 contentView];
      }
      else {
      double v27 = [(UIView *)v25 viewWithTag:-2031];
      }
    }
    else
    {
      double v27 = v25;
    }
    uint64_t v28 = v27;

    double v29 = [(UIView *)v28 viewWithTag:-2030];

    if (v29) {
      [v29 removeFromSuperview];
    }

    goto LABEL_28;
  }
LABEL_29:
}

+ (CGRect)_selectionFrameForBounds:(CGRect)a3 size:(int)a4 traitCollection:(id)a5 accessibilityView:(BOOL)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!a6)
  {
    [a1 _sectionIndicatorOverflowForTraitCollection:a5 size:*(void *)&a4];
    CGFloat v11 = -v10;
    v20.origin.double x = x;
    v20.origin.double y = y;
    v20.size.double width = width;
    v20.size.double height = height;
    CGRect v21 = CGRectInset(v20, v11, v11);
    double v12 = v21.origin.x;
    double v13 = v21.origin.y;
    double v14 = v21.size.width;
    double v15 = v21.size.height;
    if (!CGRectIsNull(v21))
    {
      double x = v12;
      double y = v13;
      double width = v14;
      double height = v15;
    }
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

+ (id)_modernBackgroundSelected:(BOOL)a3 shadow:(int64_t)a4 maximumSize:(CGSize)a5 highlighted:(BOOL)a6 traitCollection:(id)a7 tintColor:(id)a8 size:(int)a9
{
  uint64_t v9 = *(void *)&a9;
  BOOL v11 = a6;
  double height = a5.height;
  double width = a5.width;
  BOOL v15 = a3;
  id v17 = a7;
  id v18 = a8;
  if (qword_1EB25E578 != -1) {
    dispatch_once(&qword_1EB25E578, &__block_literal_global_751);
  }
  double v19 = (CGColor *)[a1 _backgroundPrimaryColorSelected:v15 highlighted:v11 traitCollection:v17 tintColor:v18];
  CGRect v20 = UISegmentedControlStyleProviderForIdiom(a1, [v17 userInterfaceIdiom]);
  double v78 = v18;
  int v21 = [v20 useSelectionIndicatorStyling];
  [a1 _cornerRadiusForTraitCollection:v17 size:v9];
  double v23 = v22;
  [a1 _sectionIndicatorInsetForTraitCollection:v17 size:v9];
  double v25 = v24;
  [a1 _sectionIndicatorOverflowForTraitCollection:v17 size:v9];
  double v27 = v25 + v26;
  [a1 _effectiveCornerRadiusForTraitCollection:v17 size:v9 selected:v15];
  double v29 = v28;
  int v30 = [v20 usesContinuousCurveCorners];
  double v31 = ceil(v29 * 1.528665);
  if (!v30) {
    double v31 = v29;
  }
  double v32 = 0.0;
  if ((v15 || v11) & v21) {
    double v32 = v27;
  }
  double v33 = v32 + v31;
  double v34 = 2.0;
  if (!(v21 ^ 1 | v15)) {
    double v34 = 1.0;
  }
  double v35 = ceil(v29) + v32;
  double v36 = width * v34 * 0.5;
  if (v33 < v36) {
    double v36 = v33;
  }
  if (v35 >= v36) {
    double v37 = v35;
  }
  else {
    double v37 = v36;
  }
  if (v33 >= height * 0.5) {
    double v33 = height * 0.5;
  }
  if (v35 >= v33) {
    double v38 = v35;
  }
  else {
    double v38 = v33;
  }
  if ((unint64_t)a4 < 3 && v15) {
    int64_t v39 = a4 + 1;
  }
  else {
    int64_t v39 = 0;
  }
  int64_t v40 = a4;
  v41 = [_UISegmentedControlCacheKey alloc];
  [v17 displayScale];
  double v43 = -[_UISegmentedControlCacheKey initWithCornerRadius:capSize:scale:state:primaryColor:](v41, "initWithCornerRadius:capSize:scale:state:primaryColor:", v39, v19, v23, v37, v38, v42);
  double v44 = [(id)qword_1EB25E570 objectForKey:v43];
  if (!v44)
  {
    BOOL v77 = v15;
    BOOL v76 = v11;
    int64_t v45 = v40;
    double v46 = v37 + v37 + 1.0;
    double v47 = v38 + v38 + 1.0;
    [v17 displayScale];
    _UIGraphicsBeginImageContextWithOptions(0, 0, v46, v47, v48);
    int v49 = [v20 useSelectionIndicatorStyling];
    char v50 = v49;
    BOOL v51 = v20;
    if (v49)
    {
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1) {
        id v53 = 0;
      }
      else {
        id v53 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      }
      double v61 = &qword_1EB25E000;
      CGContextSetFillColorWithColor(v53, v19);
      double v65 = 0.0;
      if (v15)
      {
        if (v45 != 1 && CGColorGetAlpha(v19) >= 1.0)
        {
          id v66 = +[UIColor _controlShadowColor];
          double v67 = (CGColor *)[v66 CGColor];

          uint64_t v68 = GetContextStack(0);
          if (*(int *)v68 < 1) {
            v69 = 0;
          }
          else {
            v69 = (CGContext *)v68[3 * (*(_DWORD *)v68 - 1) + 1];
          }
          v80.double width = 0.0;
          v80.double height = 2.5;
          CGContextSetShadowWithColor(v69, v80, 6.0, v67);
        }
        v82.origin.double x = 0.0;
        v82.origin.double y = 0.0;
        v82.size.double width = v37 + v37 + 1.0;
        v82.size.double height = v38 + v38 + 1.0;
        *(CGRect *)(&v65 - 1) = CGRectInset(v82, v27, v27);
        double v46 = v71;
        double v47 = v72;
      }
      else
      {
        double v70 = 0.0;
      }
      v63 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v70, v65, v46, v47, v29);
      [v63 fill];
      if (v45 == 2 && v77) {
        [v63 fillWithBlendMode:16 alpha:1.0];
      }
      goto LABEL_46;
    }
    [a1 _lineWidthForTraitCollection:v17 size:v9];
    double v55 = v54;
    uint64_t v56 = +[UIColor blackColor];
    [v56 set];

    if (v15)
    {
      double v57 = 0.0;
      double v58 = 0.0;
    }
    else
    {
      v81.origin.double x = 0.0;
      v81.origin.double y = 0.0;
      v81.size.double width = v37 + v37 + 1.0;
      v81.size.double height = v38 + v38 + 1.0;
      *(CGRect *)&double v58 = CGRectInset(v81, v55 * 0.5, v55 * 0.5);
      double v46 = v59;
      double v47 = v60;
      double v23 = v23 - v55 * 0.5;
    }
    double v61 = &qword_1EB25E000;
    v62 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v58, v57, v46, v47, v23);
    v63 = v62;
    if (!v77)
    {
      [v62 setLineWidth:v55];
      [v63 stroke];
      if (!v76)
      {
LABEL_46:

        double v73 = _UIGraphicsGetImageFromCurrentImageContext(0);
        UIGraphicsEndImageContext();
        double v44 = objc_msgSend(v73, "resizableImageWithCapInsets:", v38, v37, v38, v37);

        if ((v50 & 1) == 0)
        {
          uint64_t v74 = [v44 imageWithRenderingMode:2];

          double v44 = (void *)v74;
        }
        CGRect v20 = v51;
        if (v44) {
          [(id)v61[174] setObject:v44 forKey:v43];
        }
        goto LABEL_50;
      }
      uint64_t v64 = +[UIColor colorWithWhite:0.0 alpha:0.15];
      [v64 set];
    }
    [v63 fill];
    goto LABEL_46;
  }
LABEL_50:

  return v44;
}

+ (double)_sectionIndicatorOverflowForTraitCollection:(id)a3 size:(int)a4
{
  double v4 = UISegmentedControlStyleProviderForIdiom(a1, [a3 userInterfaceIdiom]);
  if ([v4 useTVStyleFocusSelection]) {
    double v5 = 0.0;
  }
  else {
    double v5 = 3.0;
  }

  return v5;
}

+ (CGColor)_backgroundPrimaryColorSelected:(BOOL)a3 highlighted:(BOOL)a4 traitCollection:(id)a5 tintColor:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v9 = a5;
  id v10 = a6;
  BOOL v11 = v10;
  if (!v8)
  {
    if (v7)
    {
      id v12 = +[UIColor _controlHighlightColor];
      goto LABEL_8;
    }
    if (!v10)
    {
      id v12 = +[UIColor tertiarySystemFillColor];
      goto LABEL_8;
    }
LABEL_7:
    id v12 = v10;
    goto LABEL_8;
  }
  if (v10) {
    goto LABEL_7;
  }
  id v12 = +[UIColor _controlForegroundColor];
LABEL_8:
  double v13 = v12;
  id v14 = [v12 resolvedColorWithTraitCollection:v9];
  BOOL v15 = (CGColor *)[v14 CGColor];

  return v15;
}

- (UIColor)selectedSegmentTintColor
{
  return self->_selectedSegmentTintColor;
}

- (void)setTitle:(NSString *)title forSegmentAtIndex:(NSUInteger)segment
{
  int64_t v6 = title;
  BOOL v7 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:segment];
  BOOL v8 = [v7 objectValue];
  id v9 = v6;
  BOOL v11 = v9;
  if (v8 == v9)
  {

    goto LABEL_11;
  }
  if (v9 && v8)
  {
    char v10 = [(NSString *)v8 isEqual:v9];

    if (v10) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  [v7 setObjectValue:v11];
  if ((*(unsigned char *)&self->_segmentedControlFlags & 0x20) != 0) {
    [(UISegmentedControl *)self sizeToFit];
  }
  [(UIView *)self invalidateIntrinsicContentSize];
LABEL_11:
}

- (void)_insertSelectionViewForSegment:(id)a3
{
  id v52 = a3;
  double v4 = objc_opt_class();
  double v5 = [(UIView *)self traitCollection];
  int64_t v6 = UISegmentedControlStyleProviderForIdiom(v4, [v5 userInterfaceIdiom]);

  BOOL v7 = objc_opt_class();
  [v52 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [(UISegmentedControl *)self controlSize];
  id v17 = [(UIView *)self traitCollection];
  objc_msgSend(v7, "_selectionFrameForBounds:size:traitCollection:accessibilityView:", v16, v17, 1, v9, v11, v13, v15);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  if (self->_selectedSegmentVisualEffect)
  {
    double v26 = [[UIVisualEffectView alloc] initWithEffect:self->_selectedSegmentVisualEffect];
    selectionIndicatorView = self->_selectionIndicatorView;
    self->_selectionIndicatorView = &v26->super;

    [(UISegmentedControl *)self bounds];
    -[UIView setFrame:](self->_selectionIndicatorView, "setFrame:");
    [(UIView *)self->_selectionIndicatorView setAutoresizingMask:18];
    if ([v6 useGeneratedImages])
    {
      double v28 = objc_opt_class();
      double v29 = [(UIView *)self traitCollection];
      int v30 = [(UISegmentedControl *)self selectedSegmentTintColor];
      double v31 = objc_msgSend(v28, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 1, 0, v29, v30, *(_DWORD *)&self->_segmentedControlFlags & 3, v23, v25);
    }
    else
    {
      double v31 = 0;
    }
    double v36 = [[UIImageView alloc] initWithImage:v31];
    selectionImageView = self->_selectionImageView;
    self->_selectionImageView = v36;

    -[UIImageView setFrame:](self->_selectionImageView, "setFrame:", v19, v21, v23, v25);
    [v52 center];
    -[UIImageView setCenter:](self->_selectionImageView, "setCenter:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v38 = [(UIView *)self->_selectionIndicatorView contentView];
      [v38 addSubview:self->_selectionImageView];
    }
    else
    {
      [(UIView *)self->_selectionIndicatorView setMaskView:self->_selectionImageView];
    }
    if (![v6 hasShadowWithSelectedSegmentEffect]
      || ![v6 useGeneratedImages])
    {
      goto LABEL_26;
    }
    double v34 = [v6 createSelectedSegmentEffectShadowView];
    if (!v34)
    {
      int64_t v39 = objc_opt_class();
      int64_t v40 = [(UIView *)self traitCollection];
      v41 = [(UISegmentedControl *)self selectedSegmentTintColor];
      double v42 = objc_msgSend(v39, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 2, 0, v40, v41, *(_DWORD *)&self->_segmentedControlFlags & 3, v23, v25);

      double v34 = [[UIImageView alloc] initWithImage:v31];
    }
    [(UIView *)v34 setTag:-2030];
    [(UIView *)v34 setAutoresizingMask:18];
    -[UIImageView setFrame:](v34, "setFrame:", v19, v21, v23, v25);
    double v43 = self;
    backdropView = v43->_backdropView;
    if (backdropView)
    {
      if ((*((unsigned char *)&v43->_segmentedControlFlags + 3) & 4) != 0) {
        [(UIView *)backdropView contentView];
      }
      else {
      int64_t v45 = [(UIView *)v43 viewWithTag:-2031];
      }
    }
    else
    {
      int64_t v45 = v43;
    }
    double v35 = v45;

    [v35 addSubview:v34];
  }
  else
  {
    BOOL v32 = [(UISegmentedControl *)self transparentBackground];
    BOOL v33 = [(UISegmentedControl *)self _useDynamicShadow];
    double v31 = [(UIView *)self traitCollection];
    double v34 = [(UISegmentedControl *)self selectedSegmentTintColor];
    if ([v6 useGeneratedImages])
    {
      double v35 = objc_msgSend((id)objc_opt_class(), "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, v32 | v33, 0, v31, v34, *(_DWORD *)&self->_segmentedControlFlags & 3, v23, v25);
    }
    else
    {
      double v35 = 0;
    }
    double v46 = [[UIImageView alloc] initWithImage:v35];
    double v47 = self->_selectionImageView;
    self->_selectionImageView = v46;

    -[UIImageView setFrame:](self->_selectionImageView, "setFrame:", v19, v21, v23, v25);
    objc_storeStrong((id *)&self->_selectionIndicatorView, self->_selectionImageView);
    if (!v32
      && [(id)objc_opt_class() _useShadowForSelectedTintColor:v34 traitCollection:v31])
    {
      [(UISegmentedControl *)self _updateDynamicShadow:1 animated:0];
    }
  }

LABEL_26:
  double v48 = self;
  int v49 = v48->_backdropView;
  if (v49)
  {
    if ((*((unsigned char *)&v48->_segmentedControlFlags + 3) & 4) != 0) {
      [(UIView *)v49 contentView];
    }
    else {
    char v50 = [(UIView *)v48 viewWithTag:-2031];
    }
  }
  else
  {
    char v50 = v48;
  }
  BOOL v51 = v50;

  [(UIView *)v51 insertSubview:v48->_selectionIndicatorView atIndex:[(NSMutableArray *)v48->_segments count]];
}

- (BOOL)_useDynamicShadow
{
  return (*(_DWORD *)&self->_segmentedControlFlags & 0x58000) != 0;
}

+ (BOOL)_useShadowForSelectedTintColor:(id)a3 traitCollection:(id)a4
{
  return CGColorGetAlpha((CGColorRef)[a1 _backgroundPrimaryColorSelected:1 highlighted:0 traitCollection:a4 tintColor:a3]) >= 1.0;
}

uint64_t __36__UISegmentedControl_layoutSubviews__block_invoke(uint64_t a1, void *a2, int a3)
{
  int v3 = *(_DWORD *)(a1 + 32);
  if (v3 - 1 == a3) {
    unsigned int v4 = 2;
  }
  else {
    unsigned int v4 = 1;
  }
  if (!a3) {
    unsigned int v4 = 0;
  }
  if (v3 == 1) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = v4;
  }
  return [a2 setSegmentPosition:v5];
}

- (void)setEnabled:(BOOL)enabled forSegmentAtIndex:(NSUInteger)segment
{
  BOOL v5 = enabled;
  id v9 = [(NSMutableArray *)self->_segments objectAtIndex:segment];
  int v7 = [v9 isEnabled];
  [v9 setEnabled:v5];
  if (v7 != v5)
  {
    double v8 = [self->_appearanceStorage anyDividerImage];

    if (v8) {
      [(UISegmentedControl *)self _updateDividerImageForSegmentAtIndex:segment];
    }
  }
  if (!v5 && self->_selectedSegment == segment) {
    [(UISegmentedControl *)self setSelectedSegmentIndex:-1];
  }
}

- (void)insertSegmentWithTitle:(NSString *)title atIndex:(NSUInteger)segment animated:(BOOL)animated
{
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex
{
}

- (void)_setSelectedSegmentIndex:(int64_t)a3 notify:(BOOL)a4
{
}

- (void)setTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[UISegmentedControl _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", attributes);
  if (state == 4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    int64_t v6 = self->_segments;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "updateMasking", (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  id appearanceStorage = self->_appearanceStorage;
  if (v6)
  {
    if (!appearanceStorage)
    {
      uint64_t v8 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
      id v9 = self->_appearanceStorage;
      self->_id appearanceStorage = v8;
    }
  }
  else if (!appearanceStorage)
  {
    return;
  }
  uint64_t v11 = objc_msgSend(v6, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");

  uint64_t v10 = [self->_appearanceStorage textAttributesForState:a4];
  if (v11 | v10 && ([(id)v11 isEqualToDictionary:v10] & 1) == 0)
  {
    [self->_appearanceStorage setTextAttributes:v11 forState:a4];
    [(UISegmentedControl *)self _setNeedsAppearanceUpdate];
  }
}

- (void)_setNeedsAppearanceUpdate
{
  *(_DWORD *)&self->_segmentedControlFlags |= 0x800u;
  [(UIView *)self setNeedsLayout];
}

- (void)_setInterSegmentSpacing:(double)a3
{
  self->_double innerSegmentSpacing = a3;
  *(_DWORD *)&self->_segmentedControlFlags |= 0x2000u;
}

- (void)setWidth:(CGFloat)width forSegmentAtIndex:(NSUInteger)segment
{
  id v6 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:segment];
  if (v6[70] != width)
  {
    uint64_t v7 = v6;
    v6[70] = width;
    if ((*(unsigned char *)&self->_segmentedControlFlags & 0x20) != 0) {
      [(UISegmentedControl *)self sizeToFit];
    }
    [(UIView *)self setNeedsLayout];
    [(UIView *)self invalidateIntrinsicContentSize];
    id v6 = v7;
  }
}

- (UISegmentedControl)initWithFrame:(CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)UISegmentedControl;
  int v3 = -[UIControl initWithFrame:](&v6, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  unsigned int v4 = v3;
  if (v3) {
    [(UISegmentedControl *)v3 __initWithFrameCommonOperations];
  }
  return v4;
}

- (UISegmentedControl)initWithItems:(NSArray *)items
{
  unsigned int v4 = items;
  if (dyld_program_sdk_at_least())
  {
    v16.receiver = self;
    v16.super_class = (Class)UISegmentedControl;
    BOOL v5 = -[UIControl initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UISegmentedControl *)v5 __initWithFrameCommonOperations];
    if (!v5) {
      goto LABEL_17;
    }
  }
  else
  {
    BOOL v5 = -[UISegmentedControl initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    if (!v5) {
      goto LABEL_17;
    }
  }
  v5->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&v5->_segmentedControlFlags & 0xFFFFFFDC | 0x20);
  int v6 = [(NSArray *)v4 count];
  int v7 = v6;
  if (v6 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = (v6 - 1);
    uint64_t v10 = v6;
    do
    {
      if (v9 == v8) {
        unsigned int v11 = 2;
      }
      else {
        unsigned int v11 = 1;
      }
      if (!v8) {
        unsigned int v11 = 0;
      }
      if (v7 == 1) {
        uint64_t v12 = 3;
      }
      else {
        uint64_t v12 = v11;
      }
      long long v13 = [(NSArray *)v4 objectAtIndex:v8];
      id v14 = [(UISegmentedControl *)v5 _createAndAddSegmentAtIndex:v8 position:v12 withInfo:v13];

      ++v8;
    }
    while (v10 != v8);
  }
  [(UISegmentedControl *)v5 sizeToFit];
LABEL_17:

  return v5;
}

uint64_t __55__UISegmentedControl__insertSegment_withInfo_animated___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_createAndAddSegmentAtIndex:position:withInfo:");
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 504);
  if (v4 >= *(int *)(a1 + 48))
  {
    [(id)v3 selectSegment:(v4 + 1)];
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if ((*(unsigned char *)(v3 + 608) & 0x20) != 0)
  {
    [(id)v3 sizeToFit];
    uint64_t v3 = *(void *)(a1 + 32);
  }
  [(id)v3 invalidateIntrinsicContentSize];
  BOOL v5 = *(void **)(a1 + 32);
  return [v5 setNeedsLayout];
}

- (id)_createAndAddSegmentAtIndex:(int)a3 position:(unsigned int)a4 withInfo:(id)a5
{
  int v7 = [(UISegmentedControl *)self _createSegmentAtIndex:*(void *)&a3 position:*(void *)&a4 withInfo:a5];
  int v8 = [(NSMutableArray *)self->_segments count];
  if (v8 >= a3) {
    int v9 = a3;
  }
  else {
    int v9 = v8;
  }
  uint64_t v10 = v9;
  [(NSMutableArray *)self->_segments insertObject:v7 atIndex:v9];
  unsigned int v11 = self;
  backdropView = v11->_backdropView;
  if (backdropView)
  {
    if ((*((unsigned char *)&v11->_segmentedControlFlags + 3) & 4) != 0) {
      [(UIView *)backdropView contentView];
    }
    else {
    long long v13 = [(UIView *)v11 viewWithTag:-2031];
    }
  }
  else
  {
    long long v13 = v11;
  }
  id v14 = v13;

  [(UIView *)v14 insertSubview:v7 atIndex:v10];
  [v7 _finishInitialSegmentSetup];
  [(UIView *)v11 setNeedsLayout];
  return v7;
}

- (id)_createSegmentAtIndex:(int)a3 position:(unsigned int)a4 withInfo:(id)a5
{
  id v7 = a5;
  double v22 = v7;
  if ((*((unsigned char *)&self->_segmentedControlFlags + 2) & 0x40) != 0)
  {
    double v20 = [(UISegmentedControl *)self _createInfoViewForSegmentAtIndex:a3 item:v7];
  }
  else
  {
    double v20 = 0;
  }
  double v19 = [UISegment alloc];
  uint64_t v8 = *(_DWORD *)&self->_segmentedControlFlags & 3;
  int64_t barStyle = self->_barStyle;
  uint64_t v10 = [(UIView *)self tintColor];
  id appearanceStorage = self->_appearanceStorage;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
  int v13 = (*(unsigned int *)&segmentedControlFlags >> 7) & 1;
  int v14 = (*(unsigned int *)&segmentedControlFlags >> 14) & 1;
  double v15 = [(UIView *)self traitCollection];
  BYTE1(v18) = v14;
  LOBYTE(v18) = v13;
  objc_super v16 = -[UISegment initWithInfo:size:barStyle:tintColor:appearanceStorage:position:autosizeText:adjustsForContentSizeCategory:customInfoView:traitCollection:](v19, "initWithInfo:size:barStyle:tintColor:appearanceStorage:position:autosizeText:adjustsForContentSizeCategory:customInfoView:traitCollection:", v22, v8, barStyle, v10, appearanceStorage, a4, v18, v20, v15);

  [(UISegment *)v16 setMomentary:(*(_DWORD *)&self->_segmentedControlFlags >> 3) & 1];
  return v16;
}

- (void)__initWithFrameCommonOperations
{
  [(UISegmentedControl *)self _commonSegmentedControlInit];
  [(UISegmentedControl *)self _installVisualStyleDefaults];
  uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  segments = self->_segments;
  self->_segments = v3;

  BOOL v5 = objc_opt_class();
  int v6 = [(UIView *)self traitCollection];
  UISegmentedControlStyleProviderForIdiom(v5, [v6 userInterfaceIdiom]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if ([v7 useTVStyleFocusSelection]) {
    +[UIView _performSystemAppearanceModifications:&__block_literal_global_153];
  }
}

- (void)_installVisualStyleDefaults
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(UIView *)self traitCollection];
  BOOL v5 = UISegmentedControlStyleProviderForIdiom(v3, [v4 userInterfaceIdiom]);

  int v6 = [v5 hasTransparentBackgroundByDefault];
  char v7 = v6;
  if (v6) {
    [(UISegmentedControl *)self setTransparentBackground:1];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v5 apportionsSegmentWidthsByContentByDefault])
  {
    [(UISegmentedControl *)self setApportionsSegmentWidthsByContent:1];
  }
  uint64_t v8 = [v5 defaultBackgroundTintColor];
  if (v8 && !self->_backgroundTintColor) {
    [(UISegmentedControl *)self _setBackgroundTintColor:v8];
  }
  if ([v5 supportsDynamicTypeByDefault]) {
    [(UISegmentedControl *)self setAdjustsForContentSizeCategory:1];
  }
  [v5 defaultInterSegmentSpacing];
  if (v9 != 0.0) {
    -[UISegmentedControl _setInterSegmentSpacing:](self, "_setInterSegmentSpacing:");
  }
  uint64_t v10 = [v5 selectedSegmentDefaultVibrancyEffect];
  double v58 = [v5 selectedSegmentDefaultBlurEffect];
  if ((*((unsigned char *)&self->_segmentedControlFlags + 2) & 0x20) == 0)
  {
    if (v10) {
      unsigned int v11 = v10;
    }
    else {
      unsigned int v11 = v58;
    }
    id v12 = v11;
    int v13 = self->_selectedSegmentVisualEffect;
    int v14 = (UIVisualEffect *)v12;
    double v15 = v14;
    if (v13 != v14)
    {
      if (v14 && v13)
      {
        char v16 = [(UIVisualEffect *)v13 isEqual:v14];

        if (v16) {
          goto LABEL_42;
        }
      }
      else
      {
      }
      id v17 = v8;
      objc_storeStrong((id *)&self->_selectedSegmentVisualEffect, v11);
      selectionIndicatorView = self->_selectionIndicatorView;
      if (selectionIndicatorView)
      {
        [(UIView *)selectionIndicatorView removeFromSuperview];
        double v19 = self->_selectionIndicatorView;
        self->_selectionIndicatorView = 0;

        selectionImageView = self->_selectionImageView;
        self->_selectionImageView = 0;

        double v21 = self;
        backdropView = v21->_backdropView;
        if (backdropView)
        {
          if ((*((unsigned char *)&self->_segmentedControlFlags + 3) & 4) != 0) {
            [(UIView *)backdropView contentView];
          }
          else {
          double v23 = [(UIView *)v21 viewWithTag:-2031];
          }
        }
        else
        {
          double v23 = v21;
        }
        double v24 = v23;

        double v25 = [(UIView *)v24 viewWithTag:-2030];

        if (v25) {
          [v25 removeFromSuperview];
        }
      }
      double v26 = v10;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      double v27 = self->_segments;
      uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v67 objects:v73 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v68 != v30) {
              objc_enumerationMutation(v27);
            }
            [*(id *)(*((void *)&v67 + 1) + 8 * i) _removeSelectionIndicator];
          }
          uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v67 objects:v73 count:16];
        }
        while (v29);
      }

      [(UISegmentedControl *)self _setNeedsBackgroundAndContentViewUpdate];
      uint64_t v8 = v17;
      uint64_t v10 = v26;
      goto LABEL_42;
    }

LABEL_42:
  }
  if ((v7 & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    BOOL v32 = 0;
  }
  else
  {
    BOOL v32 = [v5 backgroundBlurEffect];
  }
  BOOL v33 = [v5 createBackdropView];
  p_backdropView = &self->_backdropView;
  double v35 = self->_backdropView;
  self->_backdropView = v33;

  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
  self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFDFFFFFF | ((self->_backdropView != 0) << 25));
  if (self->_backdropView)
  {
    double v55 = v32;
    uint64_t v56 = v10;
    double v57 = v8;
    double v37 = [UIView alloc];
    [(UISegmentedControl *)self bounds];
    double v38 = -[UIView initWithFrame:](v37, "initWithFrame:");
    [(UIView *)v38 setTag:-2031];
    [(UIView *)v38 setAutoresizingMask:18];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    int64_t v39 = [(UIView *)self subviews];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v64;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v64 != v42) {
            objc_enumerationMutation(v39);
          }
          [(UIView *)v38 addSubview:*(void *)(*((void *)&v63 + 1) + 8 * j)];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v63 objects:v72 count:16];
      }
      while (v41);
    }

    [(UIView *)v38 setClipsToBounds:[(UIView *)self clipsToBounds]];
    [(UIView *)self _cornerRadius];
    -[UIVisualEffectView _setCornerRadius:](v38, "_setCornerRadius:");
    [(UIView *)self insertSubview:v38 atIndex:0];
    [(UISegmentedControl *)self bounds];
    -[UIView setFrame:](*p_backdropView, "setFrame:");
    [(UIView *)*p_backdropView setAutoresizingMask:18];
    [(UIView *)self insertSubview:*p_backdropView atIndex:0];
    [(UIView *)self setClipsToBounds:0];
    [(UIView *)self _setCornerRadius:0.0];
  }
  else
  {
    if (!v32) {
      goto LABEL_66;
    }
    uint64_t v56 = v10;
    double v57 = v8;
    self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags | 0x6000000);
    [(UISegmentedControl *)self setTransparentBackground:1];
    double v55 = v32;
    double v38 = [[UIVisualEffectView alloc] initWithEffect:v32];
    objc_storeStrong((id *)&self->_backdropView, v38);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    double v44 = [(UIView *)self subviews];
    uint64_t v45 = [v44 countByEnumeratingWithState:&v59 objects:v71 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v60;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v60 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = *(void *)(*((void *)&v59 + 1) + 8 * k);
          char v50 = [(UIVisualEffectView *)v38 contentView];
          [v50 addSubview:v49];
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v59 objects:v71 count:16];
      }
      while (v46);
    }

    [(UISegmentedControl *)self bounds];
    -[UIView setFrame:](*p_backdropView, "setFrame:");
    [(UIView *)*p_backdropView setAutoresizingMask:18];
    [(UIView *)self insertSubview:*p_backdropView atIndex:0];
  }
  BOOL v32 = v55;

  uint64_t v10 = v56;
  uint64_t v8 = v57;
LABEL_66:
  if (objc_opt_respondsToSelector()) {
    int v51 = 0x80000;
  }
  else {
    int v51 = 0;
  }
  self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFF7FFFF | v51);
  if (objc_opt_respondsToSelector()) {
    int v52 = 0x100000;
  }
  else {
    int v52 = 0;
  }
  self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFEFFFFF | v52);
  if (objc_opt_respondsToSelector()) {
    int v53 = 0x1000000;
  }
  else {
    int v53 = 0;
  }
  self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFEFFFFFF | v53);
  if (objc_opt_respondsToSelector()) {
    int v54 = 0x800000;
  }
  else {
    int v54 = 0;
  }
  self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFF7FFFFF | v54);
}

- (void)_commonSegmentedControlInit
{
  [(UIView *)self setOpaque:0];
  self->_uint64_t highlightedSegment = -1;
  self->_int64_t selectedSegment = -1;
  self->_int64_t hoveredSegment = -1;
  uint64_t v3 = [(UIControl *)self pointerInteraction];
  [v3 setEnabled:1];

  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(UIView *)self traitCollection];
  UISegmentedControlStyleProviderForIdiom(v4, [v5 userInterfaceIdiom]);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  self->_enabledAlphCATransform3D a = 1.0;
  if ([v16 useSelectionIndicatorStyling])
  {
    [(UIView *)self setClipsToBounds:1];
    int v6 = objc_opt_class();
    char v7 = [(UIView *)self traitCollection];
    objc_msgSend(v6, "_cornerRadiusForTraitCollection:size:", v7, -[UISegmentedControl controlSize](self, "controlSize"));
    -[UIView _setCornerRadius:](self, "_setCornerRadius:");
  }
  else
  {
    [(UIView *)self setClipsToBounds:0];
  }
  uint64_t v8 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel__axLongPressHandler_];
  [(UISegmentedControl *)self setAxLongPressGestureRecognizer:v8];

  double v9 = [(UISegmentedControl *)self axLongPressGestureRecognizer];
  [v9 setMinimumPressDuration:0.15];

  uint64_t v10 = [(UISegmentedControl *)self axLongPressGestureRecognizer];
  [v10 setAllowableMovement:50.0];

  [(UISegmentedControl *)self _updateAxLongPressGestureRecognizer];
  if ([v16 useTVStyleFocusSelection])
  {
    unsigned int v11 = [(UIView *)self layer];
    [v11 setCornerRadius:4.5];

    id v12 = [(UIView *)self layer];
    [v12 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  }
  int v13 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v13, sel__createInfoViewForSegmentAtIndex_item_);
  double v15 = (objc_class *)objc_opt_class();
  self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFBFFFFF | ((MethodImplementation != class_getMethodImplementation(v15, sel__createInfoViewForSegmentAtIndex_item_)) << 22));
}

- (UILongPressGestureRecognizer)axLongPressGestureRecognizer
{
  return self->_axLongPressGestureRecognizer;
}

- (void)setAxLongPressGestureRecognizer:(id)a3
{
}

- (void)_updateAxLongPressGestureRecognizer
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(UIView *)self traitCollection];
  UISegmentedControlStyleProviderForIdiom(v3, [v4 userInterfaceIdiom]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v5 = [(id)UIApp preferredContentSizeCategory];
  if (!UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v5)
    || (*((unsigned char *)&self->_segmentedControlFlags + 1) & 0x40) != 0)
  {
  }
  else
  {
    int v6 = [v8 supportsAXPopover];

    if (v6)
    {
      char v7 = [(UISegmentedControl *)self axLongPressGestureRecognizer];
      [(UIView *)self addGestureRecognizer:v7];
      goto LABEL_7;
    }
  }
  char v7 = [(UISegmentedControl *)self axLongPressGestureRecognizer];
  [(UIView *)self removeGestureRecognizer:v7];
LABEL_7:
}

- (void)sizeToFit
{
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
  if ((*(unsigned char *)&segmentedControlFlags & 0x40) == 0)
  {
    self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags | 0x40);
    v4.receiver = self;
    v4.super_class = (Class)UISegmentedControl;
    [(UIView *)&v4 sizeToFit];
    *(_DWORD *)&self->_segmentedControlFlags &= ~0x40u;
  }
}

- (BOOL)hasBackdropView
{
  return (*((unsigned __int8 *)&self->_segmentedControlFlags + 3) >> 1) & 1;
}

+ (CATransform3D)_hiddenSelectionTransformForTraitCollection:(SEL)a3
{
  UISegmentedControlStyleProviderForIdiom(a2, [a4 userInterfaceIdiom]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 segmentHidingFinalScaleFactor];
  CATransform3DMakeScale(retstr, v5, v5, 1.0);

  return result;
}

- (void)_updateDividerImageForSegmentAtIndex:(unint64_t)a3
{
  if (a3)
  {
    id v11 = [(NSMutableArray *)self->_segments objectAtIndex:a3 - 1];
  }
  else
  {
    id v11 = 0;
  }
  CGFloat v5 = [(NSMutableArray *)self->_segments objectAtIndex:a3];
  if ([(NSMutableArray *)self->_segments count] - 1 <= a3)
  {
    int v6 = 0;
  }
  else
  {
    int v6 = [(NSMutableArray *)self->_segments objectAtIndex:a3 + 1];
  }
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = v11;
  }
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0) {
    id v8 = v11;
  }
  else {
    id v8 = v6;
  }
  id v9 = v7;
  id v10 = v8;
  if (v10) {
    [v5 updateDividerViewForChangedSegment:v10];
  }
  [v5 updateDividerViewForChangedSegment:v5];
  [v9 setSelectionIndicatorDragged:(*(_DWORD *)&self->_segmentedControlFlags >> 12) & 1];
  [v9 updateDividerViewForChangedSegment:v5];
}

- (void)_setSelectedSegmentIndex:(int64_t)a3 notify:(BOOL)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if ([(NSMutableArray *)self->_segments count] > a3
    && [(UISegmentedControl *)self _shouldSelectSegmentAtIndex:a3])
  {
    [(UISegmentedControl *)self willChangeValueForKey:@"selectedSegmentIndex"];
    if (self->_selectedSegment == a3)
    {
      if ((*(unsigned char *)&self->_segmentedControlFlags & 4) != 0 && v6) {
        [(UISegmentedControl *)self _emitValueChanged];
      }
    }
    else
    {
      id v9 = objc_opt_class();
      id v10 = [(UIView *)self traitCollection];
      id v11 = UISegmentedControlStyleProviderForIdiom(v9, [v10 userInterfaceIdiom]);

      [MEMORY[0x1E4F39CF8] begin];
      unint64_t selectedSegment = self->_selectedSegment;
      if ((selectedSegment & 0x8000000000000000) != 0
        || selectedSegment >= [(NSMutableArray *)self->_segments count])
      {
        int v13 = 0;
      }
      else
      {
        int v13 = [(NSMutableArray *)self->_segments objectAtIndex:self->_selectedSegment];
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__UISegmentedControl__setSelectedSegmentIndex_notify_animate___block_invoke;
      aBlock[3] = &unk_1E52E7F00;
      id v14 = v13;
      id v26 = v14;
      double v27 = self;
      BOOL v30 = v5;
      int64_t v29 = a3;
      id v15 = v11;
      id v28 = v15;
      id v16 = _Block_copy(aBlock);
      id v17 = v16;
      if (v5)
      {
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        double v22 = __62__UISegmentedControl__setSelectedSegmentIndex_notify_animate___block_invoke_2;
        double v23 = &unk_1E52DC3A0;
        id v24 = v14;
        +[UIView animateWithDuration:327685 delay:v17 options:&v20 animations:0.2 completion:0.0];
        uint64_t v18 = v24;
      }
      else
      {
        (*((void (**)(void *))v16 + 2))(v16);
        [v14 setWasSelected:0];
        uint64_t v18 = [(UIControl *)self pointerInteraction];
        [v18 invalidate];
      }

      [MEMORY[0x1E4F39CF8] commit];
      if (v6 && ((*(unsigned char *)&self->_segmentedControlFlags & 8) == 0 || self->_selectedSegment != -1)) {
        [(UISegmentedControl *)self _emitValueChanged];
      }
      if (objc_msgSend(v15, "useSelectionIndicatorStyling", v20, v21, v22, v23)
        && ![(UISegmentedControl *)self _disableSlidingControl])
      {
        [(UIView *)self setNeedsLayout];
      }
      if ((*(unsigned char *)&self->_segmentedControlFlags & 8) == 0)
      {
        double v19 = [(UISegmentedControl *)self _internalFocusSystem];
        [v19 setNeedsFocusUpdate];
      }
    }
    [(UISegmentedControl *)self didChangeValueForKey:@"selectedSegmentIndex"];
  }
}

void __62__UISegmentedControl__setSelectedSegmentIndex_notify_animate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setWasSelected:1];
  uint64_t v2 = *(void *)(a1 + 40);
  unint64_t v3 = *(void *)(v2 + 504);
  if ((v3 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = [*(id *)(v2 + 496) count];
    uint64_t v2 = *(void *)(a1 + 40);
    if (v3 < v4)
    {
      [(id)v2 _setSelected:0 forSegmentAtIndex:*(unsigned int *)(v2 + 504) forceInfoDisplay:*(unsigned __int8 *)(a1 + 64)];
      uint64_t v2 = *(void *)(a1 + 40);
    }
  }
  *(void *)(v2 + 504) = *(void *)(a1 + 56);
  if ((*(void *)(*(void *)(a1 + 40) + 504) & 0x8000000000000000) == 0)
  {
    int v5 = [*(id *)(a1 + 48) useSelectionIndicatorStyling];
    uint64_t v6 = *(void *)(a1 + 40);
    if (v5 && (*(unsigned char *)(v6 + 610) & 4) == 0)
    {
      id v7 = [*(id *)(v6 + 496) objectAtIndex:*(void *)(v6 + 504)];
      [(id)v6 bringSubviewToFront:v7];

      uint64_t v6 = *(void *)(a1 + 40);
    }
    [(id)v6 _setSelected:1 forSegmentAtIndex:*(unsigned int *)(v6 + 504) forceInfoDisplay:*(unsigned __int8 *)(a1 + 64)];
    if (([*(id *)(a1 + 48) useSelectionIndicatorStyling] & 1) == 0)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(v8 + 504);
      if (v9 >= 1)
      {
        id v10 = [*(id *)(v8 + 496) objectAtIndex:v9 - 1];
        [*(id *)(a1 + 40) bringSubviewToFront:v10];
      }
    }
  }
}

- (BOOL)_shouldSelectSegmentAtIndex:(int64_t)a3
{
  return 1;
}

- (void)_setSelected:(BOOL)a3 forSegmentAtIndex:(int)a4 forceInfoDisplay:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v8 = a4;
  id v9 = [(NSMutableArray *)self->_segments objectAtIndex:a4];
  [v9 setSelectionIndicatorDragged:(*(_DWORD *)&self->_segmentedControlFlags >> 12) & 1];
  [v9 setSelected:v6];
  [(UISegmentedControl *)self _updateDividerImageForSegmentAtIndex:v8];
  if (v5) {
    [v9 _forceInfoDisplay];
  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UISegmentedControl;
  [(UIControl *)&v10 _didMoveFromWindow:a3 toWindow:v6];
  if (v6)
  {
    id v7 = [(UIView *)self layer];
    uint64_t v8 = [v6 screen];
    [v8 scale];
    objc_msgSend(v7, "setRasterizationScale:");

    id v9 = [(UISegmentedControl *)self _internalFocusSystem];
  }
}

- (_UIHostedFocusSystem)_internalFocusSystem
{
  unint64_t v3 = [(UIView *)self _focusSystem];

  if (v3)
  {
    internalFocusSystem = self->_internalFocusSystem;
    if (!internalFocusSystem)
    {
      BOOL v5 = [[_UIHostedFocusSystem alloc] _initWithHostEnvironment:self];
      id v6 = self->_internalFocusSystem;
      self->_internalFocusSystem = v5;

      [(_UIHostedFocusSystem *)self->_internalFocusSystem setDelegate:self];
      [(UIFocusSystem *)self->_internalFocusSystem _setEnabled:[(UIView *)self isFocused]];
      [(UIFocusSystem *)self->_internalFocusSystem setNeedsFocusUpdate];
      internalFocusSystem = self->_internalFocusSystem;
    }
    id v7 = internalFocusSystem;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)_resetForAppearanceChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)&self->_segmentedControlFlags &= ~0x800u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v3 = self->_segments;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "updateForAppearance:", self->_appearanceStorage, (void)v9);
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  if ([(NSMutableArray *)self->_segments count])
  {
    unint64_t v8 = 0;
    do
      -[UISegmentedControl _updateDividerImageForSegmentAtIndex:](self, "_updateDividerImageForSegmentAtIndex:", v8++, (void)v9);
    while ([(NSMutableArray *)self->_segments count] > v8);
  }
  if ((*(_DWORD *)&self->_segmentedControlFlags & 0x60) == 0x20) {
    [(UISegmentedControl *)self sizeToFit];
  }
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (NSUInteger)numberOfSegments
{
  return [(NSMutableArray *)self->_segments count];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UISegmentedControl *)self bounds];
  BOOL v10 = height == v9 && width == v8;
  v12.receiver = self;
  v12.super_class = (Class)UISegmentedControl;
  -[UIView setBounds:](&v12, sel_setBounds_, x, y, width, height);
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
  if ((*(unsigned char *)&segmentedControlFlags & 0x40) == 0) {
    self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFFFDF);
  }
  if (!v10)
  {
    [(UIView *)self setNeedsLayout];
    [(UIView *)self layoutBelowIfNeeded];
  }
}

void __60__UISegmentedControl__fontForTraitCollection_size_selected___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)qword_1EB25E590;
  qword_1EB25E590 = (uint64_t)v0;
}

void __110__UISegmentedControl__modernBackgroundSelected_shadow_maximumSize_highlighted_traitCollection_tintColor_size___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)qword_1EB25E570;
  qword_1EB25E570 = (uint64_t)v0;
}

- (void)_setAlwaysEmitValueChanged:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFFFFB | v3);
}

void __83__UISegmentedControl__modernDividerImageBackground_traitCollection_tintColor_size___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)qword_1EB25E580;
  qword_1EB25E580 = (uint64_t)v0;
}

- (void)setTransparentBackground:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_segmentedControlFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v3 = 256;
    }
    else {
      int v3 = 0;
    }
    self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFFEFF | v3);
    [(UISegmentedControl *)self _setNeedsAppearanceUpdate];
  }
}

- (void)_insertSegment:(int)a3 withInfo:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  int v9 = [(NSMutableArray *)self->_segments count];
  int v10 = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__UISegmentedControl__insertSegment_withInfo_animated___block_invoke;
  aBlock[3] = &unk_1E52DA070;
  void aBlock[4] = self;
  if (v9 >= a3) {
    int v11 = a3;
  }
  else {
    int v11 = v9;
  }
  int v35 = v11;
  int v36 = v9;
  id v12 = v8;
  id v34 = v12;
  int v13 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v14 = v13;
  if (v5)
  {
    v13[2](v13);
    id v15 = [(NSMutableArray *)self->_segments objectAtIndex:v11];
    [v15 animateAdd:1];
    BOOL v16 = __OFSUB__(v11, 1);
    uint64_t v17 = (v11 - 1);
    if ((int)v17 < 0 == v16)
    {
      [v15 frame];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      id v24 = [(NSMutableArray *)self->_segments objectAtIndex:v17];
      [v24 frame];
      double v27 = v25 + v26;

      objc_msgSend(v15, "setFrame:", v27, v19, v21, v23);
    }
    if (v10 > a3) {
      [v15 setShowDivider:1];
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __55__UISegmentedControl__insertSegment_withInfo_animated___block_invoke_2;
    v31[3] = &unk_1E52D9F98;
    v31[4] = self;
    id v32 = v15;
    id v28 = v15;
    +[UIView animateWithDuration:0 delay:v31 options:0 animations:0.25 completion:0.0];
  }
  else
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __55__UISegmentedControl__insertSegment_withInfo_animated___block_invoke_3;
    v29[3] = &unk_1E52DA040;
    BOOL v30 = v13;
    +[UIView performWithoutAnimation:v29];
    id v28 = v30;
  }
}

- (void)setApportionsSegmentWidthsByContent:(BOOL)apportionsSegmentWidthsByContent
{
  if (apportionsSegmentWidthsByContent) {
    int v4 = 512;
  }
  else {
    int v4 = 0;
  }
  self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFFDFF | v4);
  [(UIView *)self setNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)_setSelectedSegmentVibrancyEffect:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  *(_DWORD *)&self->_segmentedControlFlags |= 0x200000u;
  uint64_t v6 = self->_selectedSegmentVisualEffect;
  id v7 = (UIVisualEffect *)v5;
  id v8 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    if (v7 && v6)
    {
      char v9 = [(UIVisualEffect *)v6 isEqual:v7];

      if (v9) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_selectedSegmentVisualEffect, a3);
    selectionIndicatorView = self->_selectionIndicatorView;
    if (selectionIndicatorView)
    {
      [(UIView *)selectionIndicatorView removeFromSuperview];
      int v11 = self->_selectionIndicatorView;
      self->_selectionIndicatorView = 0;

      selectionImageView = self->_selectionImageView;
      self->_selectionImageView = 0;

      int v13 = self;
      backdropView = v13->_backdropView;
      if (backdropView)
      {
        if ((*((unsigned char *)&self->_segmentedControlFlags + 3) & 4) != 0) {
          [(UIView *)backdropView contentView];
        }
        else {
        id v15 = [(UIView *)v13 viewWithTag:-2031];
        }
      }
      else
      {
        id v15 = v13;
      }
      BOOL v16 = v15;

      uint64_t v17 = [(UIView *)v16 viewWithTag:-2030];

      if (v17) {
        [v17 removeFromSuperview];
      }
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v18 = self->_segments;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "_removeSelectionIndicator", (void)v23);
        }
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v20);
    }

    [(UISegmentedControl *)self _setNeedsBackgroundAndContentViewUpdate];
  }
LABEL_26:
}

- (void)setSelectedSegmentTintColor:(UIColor *)selectedSegmentTintColor
{
  id v5 = selectedSegmentTintColor;
  uint64_t v6 = self->_selectedSegmentTintColor;
  id v7 = v5;
  char v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(UIColor *)v6 isEqual:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_selectedSegmentTintColor, selectedSegmentTintColor);
    [(UISegmentedControl *)self _setNeedsBackgroundAndContentViewUpdate];
  }
LABEL_9:
}

- (void)_setNeedsBackgroundAndContentViewUpdate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v3 = self->_segments;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setNeedsBackgroundAndContentViewUpdate", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(UIView *)self setNeedsLayout];
}

- (void)_updateDynamicShadow:(BOOL)a3 animated:(BOOL)a4
{
  if ([(id)objc_opt_class() _updateDynamicShadowView:self->_selectionIndicatorView withAnimationDelegate:self useDynamicShadow:a3 animated:a4])*(_DWORD *)&self->_segmentedControlFlags |= 0x10000u; {
}
  }

+ (BOOL)_updateDynamicShadowView:(id)a3 withAnimationDelegate:(id)a4 useDynamicShadow:(BOOL)a5 animated:(BOOL)a6
{
  LODWORD(v6) = a6;
  BOOL v7 = a5;
  v71[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v9) {
    char v11 = v6;
  }
  else {
    char v11 = 1;
  }
  if (!v7)
  {
    if (v11)
    {
      if (!v9) {
        goto LABEL_22;
      }
    }
    else
    {
      int v36 = [v9 layer];
      [v36 shadowOpacity];
      float v38 = v37;

      if (v38 == 0.0) {
        goto LABEL_22;
      }
    }
    int64_t v39 = +[UIColor _controlShadowColor];
    [v39 alphaComponent];
    double v41 = v40;

    uint64_t v42 = (double *)MEMORY[0x1E4F1DB30];
    if (v6)
    {
      double v43 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"shadowOpacity"];
      [v43 setDuration:0.41];
      uint64_t v44 = *MEMORY[0x1E4F3A490];
      uint64_t v45 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v43 setTimingFunction:v45];

      uint64_t v46 = [NSNumber numberWithDouble:v41];
      [v43 setToValue:v46];

      uint64_t v47 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"shadowRadius"];
      [v47 setDuration:0.41];
      double v48 = [MEMORY[0x1E4F39C10] functionWithName:v44];
      [v47 setTimingFunction:v48];

      [v47 setToValue:&unk_1ED3F1BE8];
      uint64_t v49 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"shadowOffset"];
      [v49 setDuration:0.41];
      char v50 = [MEMORY[0x1E4F39C10] functionWithName:v44];
      [v49 setTimingFunction:v50];

      int v51 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 0.0, 2.5);
      [v49 setToValue:v51];

      int v52 = [v9 layer];
      int v53 = [v52 presentationLayer];
      [v53 shadowOpacity];
      float v55 = v54;

      if (v55 == 0.0)
      {
        [v43 setFromValue:&unk_1ED3F1BC8];
        [v47 setFromValue:&unk_1ED3F1BD8];
        uint64_t v56 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", *v42, v42[1]);
        [v49 setFromValue:v56];
      }
      double v57 = [MEMORY[0x1E4F39B38] animation];
      [v57 setDuration:0.41];
      v70[0] = v43;
      v70[1] = v47;
      v70[2] = v49;
      double v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
      [v57 setAnimations:v58];

      [v57 setDelegate:v10];
      long long v59 = [v9 layer];
      [v59 addAnimation:v57 forKey:@"ShadowAnimation"];
    }
    long long v61 = [v9 layer];
    float v60 = v41;
    *(float *)&double v62 = v60;
    [v61 setShadowOpacity:v62];

    long long v63 = [v9 layer];
    [v63 setShadowRadius:3.0];

    double v64 = *v42;
    double v65 = v42[1];
    long long v66 = [v9 layer];
    objc_msgSend(v66, "setShadowOffset:", v64, v65);
    goto LABEL_25;
  }
  if (v11)
  {
    if (!v9) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }
  id v12 = [v9 layer];
  [v12 shadowOpacity];
  float v14 = v13;

  if (v14 == 0.0)
  {
LABEL_12:
    if (v6)
    {
      id v15 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"shadowOpacity"];
      [v15 setDuration:0.41];
      uint64_t v16 = *MEMORY[0x1E4F3A490];
      uint64_t v17 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v15 setTimingFunction:v17];

      [v15 setToValue:&unk_1ED3F1BC8];
      double v18 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"shadowRadius"];
      [v18 setDuration:0.41];
      uint64_t v19 = [MEMORY[0x1E4F39C10] functionWithName:v16];
      [v18 setTimingFunction:v19];

      [v18 setToValue:&unk_1ED3F1BD8];
      uint64_t v20 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"shadowOffset"];
      [v20 setDuration:0.41];
      uint64_t v21 = [MEMORY[0x1E4F39C10] functionWithName:v16];
      [v20 setTimingFunction:v21];

      double v22 = *MEMORY[0x1E4F1DB30];
      double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      long long v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", *MEMORY[0x1E4F1DB30], v23);
      [v20 setToValue:v24];

      long long v25 = [v9 layer];
      long long v26 = [v25 presentationLayer];
      [v26 shadowOpacity];
      float v28 = v27;

      if (v28 == 0.0)
      {
        int64_t v29 = NSNumber;
        BOOL v30 = +[UIColor _controlShadowColor];
        [v30 alphaComponent];
        double v31 = objc_msgSend(v29, "numberWithDouble:");
        [v15 setFromValue:v31];

        [v18 setFromValue:&unk_1ED3F1BE8];
        id v32 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 0.0, 2.5);
        [v20 setFromValue:v32];
      }
      BOOL v33 = [MEMORY[0x1E4F39B38] animation];
      v71[0] = v15;
      v71[1] = v18;
      v71[2] = v20;
      id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:3];
      [v33 setAnimations:v34];

      int v35 = [v9 layer];
      [v35 addAnimation:v33 forKey:@"ShadowAnimation"];
    }
    else
    {
      double v22 = *MEMORY[0x1E4F1DB30];
      double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    long long v67 = [v9 layer];
    LODWORD(v68) = 1025758986;
    [v67 setShadowOpacity:v68];

    uint64_t v6 = [v9 layer];
    [(id)v6 setShadowRadius:2.30769231];

    long long v66 = [v9 layer];
    objc_msgSend(v66, "setShadowOffset:", v22, v23);
    LOBYTE(v6) = 0;
LABEL_25:

    goto LABEL_26;
  }
LABEL_22:
  LOBYTE(v6) = 0;
LABEL_26:

  return v6;
}

- (id)_viewForLoweringBaselineLayoutAttribute:(int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)UISegmentedControl;
  uint64_t v4 = [(UIView *)&v17 _viewForLoweringBaselineLayoutAttribute:*(void *)&a3];
  uint64_t v5 = v4;
  if (v4 && [v4 translatesAutoresizingMaskIntoConstraints])
  {
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = self->_segments;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          char v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "viewForLastBaselineLayout", (void)v13);
          [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

+ (void)_registerStyleProvider:(id)a3 forIdiom:(int64_t)a4
{
  id v9 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v5 = (void *)_MergedGlobals_55_0;
    if (!_MergedGlobals_55_0)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v7 = (void *)_MergedGlobals_55_0;
      _MergedGlobals_55_0 = v6;

      uint64_t v5 = (void *)_MergedGlobals_55_0;
    }
    uint64_t v8 = [NSNumber numberWithInteger:a4];
    [v5 setObject:v9 forKey:v8];
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"selectedSegmentIndex"])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___UISegmentedControl;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (double)_defaultHeight
{
  int v3 = +[UITraitCollection _fallbackTraitCollection]();
  [a1 _defaultHeightForTraitCollection:v3 size:0];
  double v5 = v4;

  return v5;
}

+ (double)defaultHeightForStyle:(int64_t)a3 size:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = +[UITraitCollection _fallbackTraitCollection]();
  [a1 _defaultHeightForTraitCollection:v6 size:v4];
  double v8 = v7;

  return v8;
}

+ (double)defaultHeightForStyle:(int64_t)a3
{
  uint64_t v4 = +[UITraitCollection _fallbackTraitCollection]();
  [a1 _defaultHeightForTraitCollection:v4 size:0];
  double v6 = v5;

  return v6;
}

- (BOOL)apportionsSegmentWidthsByContent
{
  return (*((unsigned __int8 *)&self->_segmentedControlFlags + 1) >> 1) & 1;
}

void __53__UISegmentedControl___initWithFrameCommonOperations__block_invoke()
{
  id v0 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:1];
  id v5 = +[UIView appearanceForTraitCollection:v0];

  v1 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  uint64_t v2 = +[UIView appearanceForTraitCollection:v1];

  int v3 = +[UIColor colorWithWhite:0.0 alpha:0.1];
  [v5 setBackgroundColor:v3];

  uint64_t v4 = +[UIColor colorWithWhite:1.0 alpha:0.05];
  [v2 setBackgroundColor:v4];
}

- (UISegmentedControl)initWithFrame:(CGRect)frame actions:(NSArray *)actions
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  id v9 = actions;
  id v10 = -[UISegmentedControl initWithFrame:](self, "initWithFrame:", x, y, width, height);
  if (v10)
  {
    char v11 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v9];
    int v12 = [v11 count];
    int v13 = v12;
    if (v12 >= 1)
    {
      uint64_t v14 = 0;
      uint64_t v15 = (v12 - 1);
      uint64_t v16 = v12;
      do
      {
        if (v15 == v14) {
          unsigned int v17 = 2;
        }
        else {
          unsigned int v17 = 1;
        }
        if (!v14) {
          unsigned int v17 = 0;
        }
        if (v13 == 1) {
          uint64_t v18 = 3;
        }
        else {
          uint64_t v18 = v17;
        }
        uint64_t v19 = [v11 objectAtIndexedSubscript:v14];
        id v20 = [(UISegmentedControl *)v10 _createAndAddSegmentAtIndex:v14 position:v18 withInfo:v19];

        ++v14;
      }
      while (v16 != v14);
    }
  }
  return v10;
}

- (id)_tintColorArchivingKey
{
  return @"UISegmentedControlTintColor";
}

- (UISegmentedControl)initWithCoder:(NSCoder *)coder
{
  uint64_t v4 = coder;
  v20.receiver = self;
  v20.super_class = (Class)UISegmentedControl;
  id v5 = [(UIControl *)&v20 initWithCoder:v4];
  double v6 = v5;
  if (v5)
  {
    [(UISegmentedControl *)v5 _commonSegmentedControlInit];
    if ([(NSCoder *)v4 decodeBoolForKey:@"UIMomentary"]) {
      int v7 = 8;
    }
    else {
      int v7 = 0;
    }
    v6->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&v6->_segmentedControlFlags & 0xFFFFFFF7 | v7);
    if ([(NSCoder *)v4 decodeBoolForKey:@"UISegmentedControlAlwaysEmitValueChanged"]) {
      int v8 = 4;
    }
    else {
      int v8 = 0;
    }
    v6->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&v6->_segmentedControlFlags & 0xFFFFFFFB | v8);
    if ([(NSCoder *)v4 decodeBoolForKey:@"UIUseProportionalWidthSegments"]) {
      int v9 = 512;
    }
    else {
      int v9 = 0;
    }
    v6->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&v6->_segmentedControlFlags & 0xFFFFFDFF | v9);
    id v10 = [(NSCoder *)v4 decodeObjectForKey:@"UISegments"];
    char v11 = (void *)[v10 mutableCopy];
    id v12 = v11;
    if (!v11) {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    objc_storeStrong((id *)&v6->_segments, v12);
    if (!v11) {

    }
    if ([(NSCoder *)v4 decodeBoolForKey:@"UIAutosizeToFitSegments"]) {
      int v13 = 32;
    }
    else {
      int v13 = 0;
    }
    v6->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&v6->_segmentedControlFlags & 0xFFFFFFDF | v13);
    [(UISegmentedControl *)v6 setControlSize:[(NSCoder *)v4 decodeIntegerForKey:@"UISegmentedControlSize"]];
    unint64_t v14 = [(NSCoder *)v4 decodeIntegerForKey:@"UISelectedSegmentIndex"];
    if ((v14 & 0x8000000000000000) != 0 || (uint64_t v15 = v14, v14 >= [(NSMutableArray *)v6->_segments count])) {
      uint64_t v15 = -1;
    }
    [(UISegmentedControl *)v6 _setSelectedSegmentIndex:v15 notify:0 animate:0];
    [(UISegmentedControl *)v6 _setEnabled:[(UIControl *)v6 isEnabled] forcePropagateToSegments:1];
    if ([(NSCoder *)v4 containsValueForKey:@"UISpringLoaded"]) {
      [(UISegmentedControl *)v6 setSpringLoaded:[(NSCoder *)v4 decodeBoolForKey:@"UISpringLoaded"]];
    }
    uint64_t v16 = [(NSCoder *)v4 decodeObjectForKey:@"UISegmentedControlSelectedSegmentTintColor"];
    [(UISegmentedControl *)v6 setSelectedSegmentTintColor:v16];

    unsigned int v17 = [(NSCoder *)v4 decodeObjectForKey:@"UISegmentedControlSelectedSegmentVibrancyEffect"];
    [(UISegmentedControl *)v6 _setSelectedSegmentVibrancyEffect:v17];

    uint64_t v18 = [(NSCoder *)v4 decodeObjectForKey:@"UISegmentedControlBackgroundTintColor"];
    [(UISegmentedControl *)v6 _setBackgroundTintColor:v18];

    [(UISegmentedControl *)v6 _installVisualStyleDefaults];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UISegmentedControl;
  [(UIControl *)&v13 encodeWithCoder:v4];
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
  if ((*(unsigned char *)&segmentedControlFlags & 8) != 0)
  {
    [v4 encodeBool:1 forKey:@"UIMomentary"];
    $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
  }
  if ((*(unsigned char *)&segmentedControlFlags & 4) != 0) {
    [v4 encodeBool:1 forKey:@"UISegmentedControlAlwaysEmitValueChanged"];
  }
  if ([(NSMutableArray *)self->_segments count]) {
    [v4 encodeObject:self->_segments forKey:@"UISegments"];
  }
  $05538722D7BB7C1D427C07F59A9C38BA v6 = self->_segmentedControlFlags;
  if ((*(unsigned char *)&v6 & 3) != 0)
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    $05538722D7BB7C1D427C07F59A9C38BA v6 = self->_segmentedControlFlags;
  }
  if ((*(unsigned char *)&v6 & 0x20) != 0)
  {
    [v4 encodeBool:1 forKey:@"UIAutosizeToFitSegments"];
    $05538722D7BB7C1D427C07F59A9C38BA v6 = self->_segmentedControlFlags;
  }
  if ((*(_WORD *)&v6 & 0x200) != 0) {
    [v4 encodeBool:1 forKey:@"UIUseProportionalWidthSegments"];
  }
  [v4 encodeInteger:self->_selectedSegment forKey:@"UISelectedSegmentIndex"];
  if ([(UISegmentedControl *)self isSpringLoaded]) {
    [v4 encodeBool:1 forKey:@"UISpringLoaded"];
  }
  int v7 = [(UISegmentedControl *)self selectedSegmentTintColor];

  if (v7)
  {
    int v8 = [(UISegmentedControl *)self selectedSegmentTintColor];
    [v4 encodeObject:v8 forKey:@"UISegmentedControlSelectedSegmentTintColor"];
  }
  int v9 = [(UISegmentedControl *)self _selectedSegmentVibrancyEffect];

  if (v9)
  {
    id v10 = [(UISegmentedControl *)self _selectedSegmentVibrancyEffect];
    [v4 encodeObject:v10 forKey:@"UISegmentedControlSelectedSegmentVibrancyEffect"];
  }
  char v11 = [(UISegmentedControl *)self _backgroundTintColor];

  if (v11)
  {
    id v12 = [(UISegmentedControl *)self _backgroundTintColor];
    [v4 encodeObject:v12 forKey:@"UISegmentedControlBackgroundTintColor"];
  }
}

- (void)dealloc
{
  [(UISegmentedControl *)self removeAllSegments];
  v3.receiver = self;
  v3.super_class = (Class)UISegmentedControl;
  [(UIView *)&v3 dealloc];
}

- (void)_setSegmentedControlAppearance:(id *)a3
{
  id appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    $05538722D7BB7C1D427C07F59A9C38BA v6 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
    id v7 = self->_appearanceStorage;
    self->_id appearanceStorage = v6;

    id appearanceStorage = self->_appearanceStorage;
  }
  [appearanceStorage setDetail:a3];
  [(UISegmentedControl *)self _setNeedsAppearanceUpdate];
}

- (void)_setAppearanceIsTiled:(BOOL)a3 leftCapWidth:(unint64_t)a4 rightCapWidth:(unint64_t)a5
{
  BOOL v7 = a3;
  id appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    id v10 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
    id v11 = self->_appearanceStorage;
    self->_id appearanceStorage = v10;

    id appearanceStorage = self->_appearanceStorage;
  }
  [appearanceStorage setIsTiled:v7 leftCapWidth:a4 rightCapWidth:a5];
  [(UISegmentedControl *)self _setNeedsAppearanceUpdate];
}

- (UISegmentedControlStyle)segmentedControlStyle
{
  return 5;
}

- (void)_setControlSize:(int)a3 andInvalidate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
  self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFFFFC | a3 & 3);
  if ((*(unsigned char *)&segmentedControlFlags & 0x20) != 0)
  {
    [(UISegmentedControl *)self sizeToFit];
  }
  else
  {
    [(UISegmentedControl *)self frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(UISegmentedControl *)self _barHeight];
    -[UISegmentedControl setFrame:](self, "setFrame:", v9, v11, v13, v14);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_segments;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "setControlSize:", v5, (void)v20);
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }

  if (v4)
  {
    [(UIView *)self setNeedsLayout];
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setControlSize:(int)a3
{
  if ((*(_DWORD *)&self->_segmentedControlFlags & 3) != a3) {
    -[UISegmentedControl _setControlSize:andInvalidate:](self, "_setControlSize:andInvalidate:");
  }
}

- (int64_t)segmentControlStyle
{
  return 0;
}

- (void)setMomentary:(BOOL)momentary
{
  if (((((*(_DWORD *)&self->_segmentedControlFlags & 8) == 0) ^ momentary) & 1) == 0)
  {
    if (momentary) {
      int v3 = 8;
    }
    else {
      int v3 = 0;
    }
    self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFFFF7 | v3);
    segments = self->_segments;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __35__UISegmentedControl_setMomentary___block_invoke;
    v5[3] = &__block_descriptor_33_e15_v32__0_8Q16_B24l;
    BOOL v6 = momentary;
    [(NSMutableArray *)segments enumerateObjectsUsingBlock:v5];
  }
}

uint64_t __35__UISegmentedControl_setMomentary___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMomentary:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_setAutosizeText:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((((*(_DWORD *)&self->_segmentedControlFlags & 0x80) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v4 = 128;
    }
    else {
      int v4 = 0;
    }
    self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFFF7F | v4);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = self->_segments;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "setAutosizeText:", (*(_DWORD *)&self->_segmentedControlFlags >> 7) & 1, (void)v10);
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)setBarStyle:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_barStyle != a3)
  {
    self->_int64_t barStyle = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    int v4 = self->_segments;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setBarStyle:", self->_barStyle, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (void)setAdjustsForContentSizeCategory:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((((*(_DWORD *)&self->_segmentedControlFlags & 0x4000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v4 = 0x4000;
    }
    else {
      int v4 = 0;
    }
    self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFBFFF | v4);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = self->_segments;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "setAdjustsForContentSizeCategory:", (*(_DWORD *)&self->_segmentedControlFlags >> 14) & 1, (void)v10);
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(UIView *)self setNeedsLayout];
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UISegmentedControl *)self _setNeedsAppearanceUpdate];
    [(UISegmentedControl *)self _updateAxLongPressGestureRecognizer];
  }
}

- (BOOL)adjustsForContentSizeCategory
{
  return (*((unsigned __int8 *)&self->_segmentedControlFlags + 1) >> 6) & 1;
}

- (void)_setAnimatingOutDynamicShdaow:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFEFFFF | v3);
}

- (BOOL)_animatingOutDynamicShadow
{
  return *((unsigned char *)&self->_segmentedControlFlags + 2) & 1;
}

- (BOOL)_usesNewAnimations
{
  return 0;
}

- (void)insertSegmentWithImage:(UIImage *)image atIndex:(NSUInteger)segment animated:(BOOL)animated
{
}

- (void)insertSegmentWithAction:(UIAction *)action atIndex:(NSUInteger)segment animated:(BOOL)animated
{
  BOOL v5 = animated;
  long long v11 = action;
  uint64_t v8 = [(UIAction *)v11 identifier];
  NSUInteger v9 = [(UISegmentedControl *)self segmentIndexForActionIdentifier:v8];

  if (v9 == segment)
  {
    [(UISegmentedControl *)self _setAction:v11 forSegmentAtIndex:segment];
  }
  else
  {
    [(UISegmentedControl *)self _insertSegment:segment withInfo:v11 animated:v5];

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v9 <= segment) {
        NSUInteger v10 = v9;
      }
      else {
        NSUInteger v10 = v9 + 1;
      }
      [(UISegmentedControl *)self removeSegmentAtIndex:v10 animated:v5];
    }
  }
}

- (void)_insertSegmentWithAttributedTitle:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
}

- (id)_accessibilitySegmentItemAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_segments count] <= a3)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = [(NSMutableArray *)self->_segments objectAtIndex:a3];
  }
  return v5;
}

- (void)removeSegmentAtIndex:(NSUInteger)segment animated:(BOOL)animated
{
  BOOL v4 = animated;
  if (segment < (int)[(NSMutableArray *)self->_segments count])
  {
    uint64_t v7 = [(NSMutableArray *)self->_segments count] - 1;
    uint64_t v8 = [(NSMutableArray *)self->_segments objectAtIndex:segment];
    if (self->_selectedSegment == segment) {
      [(UISegmentedControl *)self setSelectedSegmentIndex:-1];
    }
    if (!v4) {
      [v8 removeFromSuperview];
    }
    [(NSMutableArray *)self->_segments removeObjectAtIndex:segment];
    NSUInteger selectedSegment = self->_selectedSegment;
    if (selectedSegment > segment) {
      [(UISegmentedControl *)self setSelectedSegmentIndex:selectedSegment - 1];
    }
    if ((*(unsigned char *)&self->_segmentedControlFlags & 0x20) != 0) {
      [(UISegmentedControl *)self sizeToFit];
    }
    [(UIView *)self setNeedsLayout];
    [(UIView *)self invalidateIntrinsicContentSize];
    if (v4)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __52__UISegmentedControl_removeSegmentAtIndex_animated___block_invoke;
      v13[3] = &unk_1E52DE950;
      v13[4] = self;
      BOOL v16 = segment == 0;
      id v14 = v8;
      NSUInteger v15 = segment;
      BOOL v17 = v7 == segment;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __52__UISegmentedControl_removeSegmentAtIndex_animated___block_invoke_2;
      v11[3] = &unk_1E52DC3A0;
      id v10 = v14;
      id v12 = v10;
      +[UIView animateWithDuration:0 delay:v13 options:v11 animations:0.25 completion:0.0];
      if (!segment || v7 == segment) {
        [(UIView *)self sendSubviewToBack:v10];
      }
    }
    [(UISegmentedControl *)self setRemovedSegment:0];
  }
}

void __52__UISegmentedControl_removeSegmentAtIndex_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(a1 + 40) frame];
  double v6 = v4;
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v7 = *(void **)(a1 + 40);
    [v7 animateRemoveForWidth:v4 * -0.5 + 5.0];
  }
  else
  {
    double v8 = v2;
    double v9 = v3;
    double v10 = v5;
    id v14 = [*(id *)(*(void *)(a1 + 32) + 496) objectAtIndex:*(void *)(a1 + 48) - 1];
    [v14 frame];
    double v13 = v11 + v12 + v6 * -0.5 - v8;
    if (!*(unsigned char *)(a1 + 57))
    {
      objc_msgSend(*(id *)(a1 + 40), "setFrame:", v8 + v13, v9, v6, v10);
      double v13 = 0.0;
    }
    [*(id *)(a1 + 40) animateRemoveForWidth:v13];
  }
}

uint64_t __52__UISegmentedControl_removeSegmentAtIndex_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)removeAllSegments
{
  self->_NSUInteger selectedSegment = -1;
  self->_uint64_t highlightedSegment = -1;
  self->_int64_t hoveredSegment = -1;
  [(NSMutableArray *)self->_segments makeObjectsPerformSelector:sel_removeFromSuperview];
  segments = self->_segments;
  [(NSMutableArray *)segments removeAllObjects];
}

- (NSString)titleForSegmentAtIndex:(NSUInteger)segment
{
  double v3 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:segment];
  double v4 = [v3 objectValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 string];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v6 = v4;
    }
    else {
      double v6 = 0;
    }
    id v5 = v6;
  }
  uint64_t v7 = v5;

  return (NSString *)v7;
}

- (void)_setAction:(id)a3 forSegmentAtIndex:(unint64_t)a4
{
  id v16 = a3;
  double v6 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a4];
  [v6 setAction:v16];
  uint64_t v7 = [v16 image];
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v16 title];
  }
  double v9 = v8;

  id v10 = [v6 objectValue];
  id v11 = v9;
  double v12 = v11;
  if (v10 == v11)
  {

    goto LABEL_17;
  }
  if (v11 && v10)
  {
    char v13 = [v10 isEqual:v11];

    if (v13) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  id v14 = [v16 image];
  if (v14)
  {
    [v6 setObjectValue:v14];
  }
  else
  {
    NSUInteger v15 = [v16 title];
    [v6 setObjectValue:v15];
  }
  if ((*(unsigned char *)&self->_segmentedControlFlags & 0x20) != 0) {
    [(UISegmentedControl *)self sizeToFit];
  }
  [(UIView *)self invalidateIntrinsicContentSize];
LABEL_17:
}

- (void)setAction:(UIAction *)action forSegmentAtIndex:(NSUInteger)segment
{
  id v11 = action;
  uint64_t v7 = [(UIAction *)v11 identifier];
  NSInteger v8 = [(UISegmentedControl *)self segmentIndexForActionIdentifier:v7];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v8 != segment)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UISegmentedControl.m", 4181, @"Attempting to set the action of segment at index %lu with an action whose identifier is the same as the segment at index %lu (action=%@). Identifiers are required to be unique.", segment, v8, v11 object file lineNumber description];
  }
  [(UISegmentedControl *)self _setAction:v11 forSegmentAtIndex:segment];
}

- (UIAction)actionForSegmentAtIndex:(NSUInteger)segment
{
  if ([(NSMutableArray *)self->_segments count] <= segment)
  {
    double v6 = 0;
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:segment];
    double v6 = [v5 action];
  }
  return (UIAction *)v6;
}

- (NSInteger)segmentIndexForActionIdentifier:(UIActionIdentifier)actionIdentifier
{
  double v4 = actionIdentifier;
  uint64_t v5 = [(NSMutableArray *)self->_segments count];
  if (v5 < 1)
  {
LABEL_6:
    NSInteger v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v6 = v5;
    NSInteger v7 = 0;
    while (1)
    {
      NSInteger v8 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:v7];
      double v9 = [v8 action];

      if (v9)
      {
        id v10 = [v9 identifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11) {
          break;
        }
      }
      if (v6 == ++v7) {
        goto LABEL_6;
      }
    }
  }

  return v7;
}

- (void)_setAttributedTitle:(id)a3 forSegmentAtIndex:(unint64_t)a4
{
  id v6 = a3;
  NSInteger v7 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a4];
  id v8 = [v7 objectValue];
  id v9 = v6;
  id v11 = v9;
  if (v8 == v9)
  {

    goto LABEL_11;
  }
  if (v9 && v8)
  {
    char v10 = [v8 isEqual:v9];

    if (v10) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  [v7 setObjectValue:v11];
  if ((*(unsigned char *)&self->_segmentedControlFlags & 0x20) != 0) {
    [(UISegmentedControl *)self sizeToFit];
  }
  [(UIView *)self invalidateIntrinsicContentSize];
LABEL_11:
}

- (id)_attributedTitleForSegmentAtIndex:(unint64_t)a3
{
  double v3 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a3];
  double v4 = [v3 objectValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)setImage:(UIImage *)image forSegmentAtIndex:(NSUInteger)segment
{
  id v6 = image;
  NSInteger v7 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:segment];
  id v8 = [v7 objectValue];
  id v9 = v6;
  id v11 = v9;
  if (v8 == v9)
  {

    goto LABEL_11;
  }
  if (v9 && v8)
  {
    BOOL v10 = [(UIImage *)v8 isEqual:v9];

    if (v10) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  [v7 setObjectValue:v11];
  if ((*(unsigned char *)&self->_segmentedControlFlags & 0x20) != 0) {
    [(UISegmentedControl *)self sizeToFit];
  }
  [(UIView *)self invalidateIntrinsicContentSize];
LABEL_11:
}

- (UIImage)imageForSegmentAtIndex:(NSUInteger)segment
{
  double v3 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:segment];
  double v4 = [v3 objectValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (CGFloat)widthForSegmentAtIndex:(NSUInteger)segment
{
  double v3 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:segment];
  double v4 = v3[70];

  return v4;
}

- (void)setContentOffset:(CGSize)offset forSegmentAtIndex:(NSUInteger)segment
{
  double height = offset.height;
  double width = offset.width;
  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:");
  id v8 = (double *)objc_claimAutoreleasedReturnValue();
  if (width != v8[71] || height != v8[72])
  {
    id v11 = v8;
    BOOL v10 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:segment];
    objc_msgSend(v10, "setContentOffset:", width, height);

    if ((*(unsigned char *)&self->_segmentedControlFlags & 0x20) != 0) {
      [(UISegmentedControl *)self sizeToFit];
    }
    [(UIView *)self invalidateIntrinsicContentSize];
    id v8 = v11;
  }
}

- (CGSize)contentOffsetForSegmentAtIndex:(NSUInteger)segment
{
  double v3 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:segment];
  double v4 = v3[71];
  double v5 = v3[72];

  double v6 = v4;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (BOOL)isEnabledForSegmentAtIndex:(NSUInteger)segment
{
  double v3 = [(NSMutableArray *)self->_segments objectAtIndex:segment];
  char v4 = [v3 isEnabled];

  return v4;
}

- (NSInteger)selectedSegmentIndex
{
  return self->_selectedSegment;
}

uint64_t __62__UISegmentedControl__setSelectedSegmentIndex_notify_animate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWasSelected:0];
}

- (void)_emitValueChanged
{
  double v3 = objc_opt_class();
  char v4 = [(UIView *)self traitCollection];
  double v5 = UISegmentedControlStyleProviderForIdiom(v3, [v4 userInterfaceIdiom]);

  if ([v5 useSelectionIndicatorStyling])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__UISegmentedControl__emitValueChanged__block_invoke;
    v6[3] = &unk_1E52D9F70;
    v6[4] = self;
    [(id)UIApp _performBlockAfterCATransactionCommits:v6];
  }
  else
  {
    [(UISegmentedControl *)self _sendValueChanged];
  }
}

uint64_t __39__UISegmentedControl__emitValueChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendValueChanged];
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (void)_sendValueChanged
{
  unint64_t selectedSegment = self->_selectedSegment;
  if ((selectedSegment & 0x8000000000000000) == 0
    && selectedSegment < [(NSMutableArray *)self->_segments count])
  {
    char v4 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:self->_selectedSegment];
    double v5 = [v4 action];

    if (v5) {
      [(UIControl *)self sendAction:v5];
    }
  }
  [(UIControl *)self sendActionsForControlEvents:4096];
}

- (void)_animateContentChangeWithAnimations:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[UIView _animateWithDuration:4 delay:self options:v7 factory:v6 animations:1.06 / UIAnimationDragCoefficient() completion:0.0];
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  char v4 = [MEMORY[0x1E4F39C90] animationWithKeyPath:a4];
  [v4 setMass:0.6];
  [v4 setStiffness:350.0];
  [v4 setDamping:23.0];
  [v4 setVelocity:0.0];
  float v5 = UIAnimationDragCoefficient();
  [v4 speed];
  *(float *)&double v7 = v6 / v5;
  [v4 setSpeed:v7];
  return v4;
}

- (void)_setSelected:(BOOL)a3 highlighted:(BOOL)a4 forSegmentAtIndex:(int)a5 forceInfoDisplay:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v10 = a5;
  id v11 = [(NSMutableArray *)self->_segments objectAtIndex:a5];
  [v11 setSelectionIndicatorDragged:(*(_DWORD *)&self->_segmentedControlFlags >> 12) & 1];
  [v11 setSelected:v8 highlighted:v7];
  [(UISegmentedControl *)self _updateDividerImageForSegmentAtIndex:v10];
  if (v6) {
    [v11 _forceInfoDisplay];
  }
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (id)viewForLastBaselineLayout
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x800) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)UISegmentedControl;
    double v3 = [(UIView *)&v5 viewForLastBaselineLayout];
  }
  else
  {
    double v2 = [(NSMutableArray *)self->_segments lastObject];
    double v3 = [v2 viewForLastBaselineLayout];
  }
  return v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(NSMutableArray *)self->_segments lastObject];
  if (v6)
  {
    [(UISegmentedControl *)self alignmentRectInsets];
    double v8 = v7;
    double v10 = v9;
    objc_msgSend(v6, "_baselineOffsetsAtSize:", width, height + v7 + v9);
    double v12 = v11 - v8;
    double v14 = v13 - v10;
  }
  else
  {
    double v12 = 2.22507386e-308;
    double v14 = 2.22507386e-308;
  }

  double v15 = v12;
  double v16 = v14;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  id appearanceStorage = self->_appearanceStorage;
  BOOL v4 = self->_barStyle == 2 && (*(_DWORD *)&self->_segmentedControlFlags & 3) == 1;
  objc_super v5 = [appearanceStorage backgroundImageForState:0 isMini:v4 withFallback:1];
  BOOL v6 = v5;
  if (v5)
  {
    [v5 alignmentRectInsets];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v15 = objc_opt_class();
    double v16 = [(UIView *)self traitCollection];
    BOOL v17 = UISegmentedControlStyleProviderForIdiom(v15, [v16 userInterfaceIdiom]);

    if (self->_barStyle > 2uLL)
    {
      v40.receiver = self;
      v40.super_class = (Class)UISegmentedControl;
      [(UIView *)&v40 alignmentRectInsets];
      double v8 = v32;
      double v10 = v33;
      double v12 = v34;
      double v14 = v35;
    }
    else
    {
      uint64_t v18 = [(UISegmentedControl *)self controlSize];
      [(UISegmentedControl *)self bounds];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      float v27 = [(UIView *)self traitCollection];
      objc_msgSend(v17, "alignmentInsetsForControlSize:bounds:traitCollection:", v18, v27, v20, v22, v24, v26);
      double v8 = v28;
      double v10 = v29;
      double v12 = v30;
      double v14 = v31;
    }
  }

  double v36 = v8;
  double v37 = v10;
  double v38 = v12;
  double v39 = v14;
  result.right = v39;
  result.bottom = v38;
  result.left = v37;
  result.top = v36;
  return result;
}

+ (CATransform3D)_highlightSelectionTransformForTraitCollection:(SEL)a3
{
  UISegmentedControlStyleProviderForIdiom(a2, [a4 userInterfaceIdiom]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 segmentSelectionScaleFactor];
  CATransform3DMakeScale(retstr, v5, v5, 1.0);

  return result;
}

+ (id)_selectionPopAnimationForKey:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F39C90];
  id v8 = a5;
  id v9 = a4;
  double v10 = [v7 animationWithKeyPath:a3];
  [v10 setMass:1.0];
  [v10 setStiffness:503.551245];
  [v10 setDamping:44.8798951];
  [v10 setDuration:0.411544483];
  *(float *)&double v11 = 1.0 / UIAnimationDragCoefficient();
  [v10 setSpeed:v11];
  [v10 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v10 setFromValue:v9];

  [v10 setToValue:v8];
  return v10;
}

+ (id)_selectionOpacityAnimationFromValue:(float)a3 toValue:(float)a4
{
  BOOL v6 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
  [v6 setMass:1.0];
  [v6 setStiffness:2741.55678];
  [v6 setDamping:209.43951];
  [v6 setDuration:0.176376207];
  *(float *)&double v7 = 1.0 / UIAnimationDragCoefficient();
  [v6 setSpeed:v7];
  if (a4 == 0.0) {
    [v6 setBeginTime:CACurrentMediaTime() + 0.1];
  }
  [v6 setFillMode:*MEMORY[0x1E4F39FA0]];
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [v6 setFromValue:v9];

  *(float *)&double v10 = a4;
  double v11 = [NSNumber numberWithFloat:v10];
  [v6 setToValue:v11];

  return v6;
}

+ (id)_highlightPinchAnimationForKey:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  double v7 = (void *)MEMORY[0x1E4F39B48];
  id v8 = a5;
  id v9 = a4;
  double v10 = [v7 animationWithKeyPath:a3];
  [v10 setDuration:0.5];
  double v11 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  [v10 setTimingFunction:v11];

  [v10 setFromValue:v9];
  [v10 setToValue:v8];

  return v10;
}

+ (id)_selectionFadeAnimationForKey:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  double v7 = (void *)MEMORY[0x1E4F39C90];
  id v8 = a5;
  id v9 = a4;
  double v10 = [v7 animationWithKeyPath:a3];
  [v10 setMass:0.2];
  [v10 setStiffness:100.0];
  [v10 setDamping:10.0];
  [v10 setDuration:0.5];
  double v11 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v10 setTimingFunction:v11];

  [v10 setFillMode:*MEMORY[0x1E4F39F98]];
  [v10 setFromValue:v9];

  [v10 setToValue:v8];
  return v10;
}

+ (double)_selectionOffsetAdjustmentForSegment:(id)a3
{
  id v4 = a3;
  if (![v4 segmentPosition]
    || (double v5 = 0.0, [v4 segmentPosition] == 2))
  {
    BOOL v6 = [v4 traitCollection];
    objc_msgSend(a1, "_sectionIndicatorOverflowForTraitCollection:size:", v6, objc_msgSend(v4, "controlSize"));
    double v8 = v7 + v7;

    id v9 = [v4 traitCollection];
    double v10 = UISegmentedControlStyleProviderForIdiom(a1, [v9 userInterfaceIdiom]);

    [v10 segmentSelectionScaleFactor];
    double v12 = (1.0 - v11) * 0.5;
    [v4 frame];
    double v14 = v12 * (v8 + v13);
    [v4 frame];
    double v5 = v14 - v12 * (v8 + v15);
    int v16 = [v4 segmentPosition];
    double v17 = 0.0;
    if (!v16) {
      double v17 = -v5;
    }
    if (v16 != 2) {
      double v5 = v17;
    }
  }
  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
  if (isKindOfClass)
  {
    self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFEFFFF);
    if (!v4) {
      return;
    }
    [(UISegmentedControl *)self _updateSelectionIndicator];
    if (self->_selectedSegment == -1) {
      return;
    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v15 _updateSelectionIndicator];
  }
  else
  {
    self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFDFFFF);
    id v9 = [(UIControl *)self pointerInteraction];
    [v9 invalidate];

    unint64_t selectedSegment = self->_selectedSegment;
    if ((selectedSegment & 0x8000000000000000) != 0
      || selectedSegment >= [(NSMutableArray *)self->_segments count])
    {
      return;
    }
    id v15 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:self->_selectedSegment];
    if ([v15 isAnimatingSelectionIndicator]
      && [v15 isHovered])
    {
      [(UIView *)self->_selectionIndicatorView removeFromSuperview];
      selectionIndicatorView = self->_selectionIndicatorView;
      self->_selectionIndicatorView = 0;

      selectionImageView = self->_selectionImageView;
      self->_selectionImageView = 0;

      double v13 = [(UIView *)self viewWithTag:-2030];
      double v14 = v13;
      if (v13) {
        [v13 removeFromSuperview];
      }
    }
    [v15 setAnimatingSelectionIndicator:0];
  }
}

uint64_t __84__UISegmentedControl__updateSelectionToSegment_highlight_shouldAnimate_sameSegment___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_updateHighlightToPosition:(CGPoint)a3 bounds:(CGRect)a4 highlight:(BOOL)a5
{
  BOOL v5 = a5;
  if (a5)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    double v11 = a3.y;
    double v12 = a3.x;
    highlightImageView = self->_highlightImageView;
    if (!highlightImageView)
    {
      double v14 = [UIImageView alloc];
      [(UIView *)self->_selectionImageView frame];
      id v15 = -[UIImageView initWithFrame:](v14, "initWithFrame:");
      int v16 = self->_highlightImageView;
      self->_highlightImageView = v15;

      double v17 = [(UIImageView *)self->_selectionImageView image];
      [(UIImageView *)self->_highlightImageView setImage:v17];

      [(UISegmentedControl *)self _insertHighlightView];
      highlightImageView = self->_highlightImageView;
    }
    -[UIImageView setCenter:](highlightImageView, "setCenter:", v12, v11);
    -[UIImageView setBounds:](self->_highlightImageView, "setBounds:", x, y, width, height);
  }
  uint64_t v18 = self->_highlightImageView;
  if (v18)
  {
    double v19 = [(UIView *)v18 layer];
    double v20 = [v19 animationKeys];
    char v21 = [v20 containsObject:@"HighlightScaleUp"];

    if ((v21 & 1) == 0)
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      double v22 = [(UIView *)self->_highlightImageView layer];
      double v23 = v22;
      if (v22)
      {
        [v22 transform];
      }
      else
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
      }

      memset(&v39, 0, sizeof(v39));
      if (v5)
      {
        CATransform3DMakeScale(&v39, 0.98, 0.98, 1.0);
        double v24 = @"HighlightScaleDown";
      }
      else
      {
        long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
        *(_OWORD *)&v39.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
        *(_OWORD *)&v39.m33 = v25;
        long long v26 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
        *(_OWORD *)&v39.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
        *(_OWORD *)&v39.m43 = v26;
        long long v27 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
        *(_OWORD *)&v39.m11 = *MEMORY[0x1E4F39B10];
        *(_OWORD *)&v39.m13 = v27;
        long long v28 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
        *(_OWORD *)&v39.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
        *(_OWORD *)&v39.m23 = v28;
        double v24 = @"HighlightScaleUp";
      }
      double v29 = [(UIView *)self->_highlightImageView layer];
      double v30 = objc_opt_class();
      v38[4] = v44;
      v38[5] = v45;
      v38[6] = v46;
      v38[7] = v47;
      v38[0] = v40;
      v38[1] = v41;
      v38[2] = v42;
      v38[3] = v43;
      double v31 = [MEMORY[0x1E4F29238] valueWithBytes:v38 objCType:"{CATransform3D=dddddddddddddddd}"];
      CATransform3D v37 = v39;
      double v32 = [MEMORY[0x1E4F29238] valueWithBytes:&v37 objCType:"{CATransform3D=dddddddddddddddd}"];
      double v33 = [v30 _highlightPinchAnimationForKey:@"transform" fromValue:v31 toValue:v32];
      [v29 addAnimation:v33 forKey:v24];

      CATransform3D v36 = v39;
      double v34 = [(UIView *)self->_highlightImageView layer];
      CATransform3D v35 = v36;
      [v34 setTransform:&v35];
    }
  }
}

- (void)_insertHighlightView
{
  double v3 = objc_opt_class();
  BOOL v4 = [(UIView *)self traitCollection];
  UISegmentedControlStyleProviderForIdiom(v3, [v4 userInterfaceIdiom]);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    double v7 = 0;
    goto LABEL_10;
  }
  BOOL v5 = [v20 highlightedSegmentDefaultVibrancyEffect];
  if (!v5)
  {
    double v7 = 0;
    goto LABEL_10;
  }
  selectedSegmentVisualEffect = self->_selectedSegmentVisualEffect;
  double v7 = v5;
  double v8 = selectedSegmentVisualEffect;
  if (v7 == v8)
  {

    goto LABEL_10;
  }
  id v9 = v8;
  if (v8)
  {
    char v10 = [(UIVisualEffect *)v7 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_18;
    }
LABEL_10:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
    p_selectionIndicatorView = (id *)&self->_selectionIndicatorView;
    goto LABEL_12;
  }

LABEL_18:
  p_selectionIndicatorView = (id *)&self->_highlightIndicatorView;
  highlightIndicatorView = self->_highlightIndicatorView;
  if (highlightIndicatorView) {
    goto LABEL_13;
  }
  double v14 = [[UIVisualEffectView alloc] initWithEffect:v7];
  id v15 = *p_selectionIndicatorView;
  id *p_selectionIndicatorView = v14;

  [(UISegmentedControl *)self bounds];
  objc_msgSend(*p_selectionIndicatorView, "setFrame:");
  [*p_selectionIndicatorView setAutoresizingMask:18];
  int v16 = self;
  backdropView = v16->_backdropView;
  if (backdropView)
  {
    if ((*((unsigned char *)&v16->_segmentedControlFlags + 3) & 4) != 0) {
      [(UIView *)backdropView contentView];
    }
    else {
    uint64_t v18 = [(UIView *)v16 viewWithTag:-2031];
    }
  }
  else
  {
    uint64_t v18 = v16;
  }
  double v19 = v18;

  [(UIView *)v19 addSubview:*p_selectionIndicatorView];
LABEL_12:
  highlightIndicatorView = (UIView *)*p_selectionIndicatorView;
LABEL_13:
  double v13 = [(UIView *)highlightIndicatorView contentView];
  [v13 addSubview:self->_highlightImageView];

LABEL_14:
}

void __36__UISegmentedControl_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = [a2 label];
  if (v3 && v3 != *(void **)(a1 + 32))
  {
    id v4 = v3;
    objc_msgSend(v3, "setAssociatedLabel:");
    double v3 = v4;
  }
}

- (BOOL)shouldTrack
{
  return (*(unsigned char *)&self->_segmentedControlFlags & 8) == 0;
}

- (void)_setHighlightedSegmentHighlighted:(BOOL)a3
{
  unint64_t highlightedSegment = self->_highlightedSegment;
  if ((highlightedSegment & 0x8000000000000000) == 0)
  {
    BOOL v5 = a3;
    if (highlightedSegment < [(NSMutableArray *)self->_segments count])
    {
      id v6 = [(NSMutableArray *)self->_segments objectAtIndex:self->_highlightedSegment];
      [v6 setSelectionIndicatorDragged:(*(_DWORD *)&self->_segmentedControlFlags >> 12) & 1];
      [v6 setHighlighted:v5];
      [(UISegmentedControl *)self _updateDividerImageForSegmentAtIndex:self->_highlightedSegment];
    }
  }
  [(UISegmentedControl *)self _updateSelectionIndicator];
}

- (void)_highlightSegment:(int64_t)a3
{
  int64_t highlightedSegment = self->_highlightedSegment;
  if (highlightedSegment != a3)
  {
    if (highlightedSegment != -1) {
      [(UISegmentedControl *)self _setHighlightedSegmentHighlighted:0];
    }
    $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
    if ((*(unsigned char *)&segmentedControlFlags & 0x10) != 0 && self->_highlightedSegment != -1) {
      self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xF7FFFFFF | ((self->_selectedSegment != a3) << 27));
    }
    self->_int64_t highlightedSegment = a3;
    if (a3 != -1) {
      [(UISegmentedControl *)self _setHighlightedSegmentHighlighted:1];
    }
    [(UISegmentedControl *)self _updateSelectionIndicator];
  }
}

- (void)_setHoverOnSegment:(int64_t)a3 hovered:(BOOL)a4
{
  if ((a3 & 0x8000000000000000) == 0)
  {
    BOOL v6 = a4;
    if ([(NSMutableArray *)self->_segments count] > (unint64_t)a3)
    {
      double v7 = [(NSMutableArray *)self->_segments objectAtIndex:a3];
      [v7 setHovered:v6];
      [(UISegmentedControl *)self _updateDividerImageForSegmentAtIndex:a3];
    }
  }
  if (self->_selectedSegment == a3)
  {
    [(UISegmentedControl *)self _updateSelectionIndicator];
  }
}

- (void)hoverOffSegment:(int64_t)a3
{
}

- (void)hoverOnSegment:(int64_t)a3
{
}

- (id)_feedbackGenerator
{
  if ((*((unsigned char *)&self->_segmentedControlFlags + 2) & 0x80) != 0)
  {
    double v2 = objc_getAssociatedObject(self, sel__feedbackGenerator);
    if (!v2)
    {
      id v4 = objc_opt_class();
      BOOL v5 = [(UIView *)self traitCollection];
      BOOL v6 = UISegmentedControlStyleProviderForIdiom(v4, [v5 userInterfaceIdiom]);

      double v2 = [v6 feedbackGeneratorForSegmentedControl:self];
      objc_setAssociatedObject(self, sel__feedbackGenerator, v2, (void *)1);
    }
  }
  else
  {
    double v2 = 0;
  }
  return v2;
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v7 = objc_opt_class();
  double v8 = [(UIView *)self traitCollection];
  id v9 = UISegmentedControlStyleProviderForIdiom(v7, [v8 userInterfaceIdiom]);

  [v9 mostlyInsideMargin];
  double v11 = v10;
  [(UISegmentedControl *)self bounds];
  CGRect v15 = CGRectInset(v14, -v11, -v11);
  v13.CGFloat x = x;
  v13.CGFloat y = y;
  LOBYTE(self) = CGRectContainsPoint(v15, v13);

  return (char)self;
}

- (id)_segmentAtIndex:(int)a3
{
  if (a3 < 0)
  {
    BOOL v6 = 0;
  }
  else
  {
    if ([(NSMutableArray *)self->_segments count] <= (unint64_t)a3)
    {
      BOOL v6 = 0;
    }
    else
    {
      BOOL v6 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a3];
    }
  }
  return v6;
}

- (int)_closestSegmentIndexAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v6 = [(NSMutableArray *)self->_segments count];
  if (!v6) {
    return -1;
  }
  uint64_t v7 = 0;
  int v8 = -1;
  float v9 = 1000000.0;
  while (1)
  {
    double v10 = [(NSMutableArray *)self->_segments objectAtIndex:v7];
    [v10 frame];
    v18.CGFloat x = x;
    v18.CGFloat y = y;
    if (CGRectContainsPoint(v19, v18)) {
      break;
    }
    [v10 frame];
    UIDistanceBetweenPointAndRect(x, y, v11, v12, v13, v14);
    float v16 = v15;
    if (v9 > v16)
    {
      float v9 = v16;
      int v8 = v7;
    }

    if (v6 == ++v7) {
      return v8;
    }
  }

  return v7;
}

- (void)_tapSegmentAtPoint:(CGPoint)a3 touchDown:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v6 = -[UISegmentedControl _closestSegmentIndexAtPoint:](self, "_closestSegmentIndexAtPoint:", a3.x, a3.y);
  if ((v6 & 0x80000000) == 0)
  {
    uint64_t v7 = v6;
    int v8 = [(NSMutableArray *)self->_segments objectAtIndex:v6];
    int v9 = [v8 isUserInteractionEnabled];

    $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
    if (v9)
    {
      if ((*(unsigned char *)&segmentedControlFlags & 0x10) != 0)
      {
        CGFloat v11 = objc_opt_class();
        CGFloat v12 = [(UIView *)self traitCollection];
        UISegmentedControlStyleProviderForIdiom(v11, [v12 userInterfaceIdiom]);
        id v16 = (id)objc_claimAutoreleasedReturnValue();

        if ([v16 animateSlidingSelectionByDefault])
        {
          if (![(UISegmentedControl *)self _disableSlidingControl] && v4)
          {
            self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFEFFF | ((self->_selectedSegment == v7) << 12));
            if (self->_hoveredSegment != -1)
            {
              CGFloat v13 = [(UIControl *)self pointerInteraction];
              [v13 invalidate];

              [(UISegmentedControl *)self _setHoverOnSegment:self->_selectedSegment hovered:0];
            }
          }
        }
        int64_t highlightedSegment = self->_highlightedSegment;
        if (highlightedSegment == v7)
        {
          [(UISegmentedControl *)self _setHighlightedSegmentHighlighted:1];
        }
        else
        {
          if (self->_hoveredSegment == highlightedSegment)
          {
            double v15 = [(UIControl *)self pointerInteraction];
            [v15 invalidate];
          }
          [(UISegmentedControl *)self _highlightSegment:v7];
        }
      }
      else
      {
        self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFEFFF);
        [(UISegmentedControl *)self _setSelectedSegmentIndex:v7 notify:1 animate:1];
        if ((*(unsigned char *)&self->_segmentedControlFlags & 8) != 0)
        {
          [(UISegmentedControl *)self performSelector:sel__clearSelectedSegment withObject:0 afterDelay:0.2];
        }
      }
    }
    else
    {
      self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFEFEF);
    }
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v23 = a4;
  BOOL v5 = objc_opt_class();
  unsigned int v6 = [(UIView *)self traitCollection];
  uint64_t v7 = UISegmentedControlStyleProviderForIdiom(v5, [v6 userInterfaceIdiom]);

  if (([v7 useTVStyleFocusSelection] & 1) == 0)
  {
    id v8 = v23;
    if ([v8 _buttonMask])
    {
      char v9 = [v8 _buttonMask];

      if ((v9 & 1) == 0) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    [(UIView *)self layoutIfNeeded];
    double v10 = [v8 _firstTouchForView:self];
    [v10 locationInView:self];
    double v12 = v11;
    double v14 = v13;
    if (![v7 limitInternalLayoutAndInteractionToDefaultHeight]
      || (uint64_t v15 = [(UISegmentedControl *)self controlSize],
          [(UIView *)self traitCollection],
          id v16 = objc_claimAutoreleasedReturnValue(),
          [v7 defaultHeightForControlSize:v15 traitCollection:v16],
          double v18 = v17,
          v16,
          v14 <= v18))
    {
      BOOL v19 = [(UISegmentedControl *)self shouldTrack];
      $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
      if (v19) {
        int v21 = 16;
      }
      else {
        int v21 = 0;
      }
      self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFFFEF | v21);
      if ((*(_DWORD *)&segmentedControlFlags & 0x1000000) != 0)
      {
        [v7 setActiveSegmentControl:self];
        [v7 touchesBegan];
        [v7 setActiveSegmentControl:0];
      }
      else
      {
        double v22 = [(UISegmentedControl *)self _feedbackGenerator];
        [v22 pressedDown];
      }
      *(_DWORD *)&self->_segmentedControlFlags &= ~0x8000000u;
      -[UISegmentedControl _tapSegmentAtPoint:touchDown:](self, "_tapSegmentAtPoint:touchDown:", 1, v12, v14);
    }
  }
LABEL_16:
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v13 = a4;
  BOOL v5 = objc_opt_class();
  unsigned int v6 = [(UIView *)self traitCollection];
  uint64_t v7 = UISegmentedControlStyleProviderForIdiom(v5, [v6 userInterfaceIdiom]);

  if (([v7 useTVStyleFocusSelection] & 1) == 0 && (*(unsigned char *)&self->_segmentedControlFlags & 0x10) != 0)
  {
    id v8 = [v13 _firstTouchForView:self];
    [v8 locationInView:self];
    double v11 = v9;
    double v12 = v10;
    if ((*((unsigned char *)&self->_segmentedControlFlags + 1) & 0x10) != 0
      || -[UISegmentedControl pointMostlyInside:withEvent:](self, "pointMostlyInside:withEvent:", v13, v9, v10))
    {
      -[UISegmentedControl _tapSegmentAtPoint:touchDown:](self, "_tapSegmentAtPoint:touchDown:", 0, v11, v12);
    }
    else
    {
      [(UISegmentedControl *)self _setHighlightedSegmentHighlighted:0];
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v12 = a4;
  BOOL v5 = objc_opt_class();
  unsigned int v6 = [(UIView *)self traitCollection];
  uint64_t v7 = UISegmentedControlStyleProviderForIdiom(v5, [v6 userInterfaceIdiom]);

  if (([v7 useTVStyleFocusSelection] & 1) == 0)
  {
    $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
    if ((*(unsigned char *)&segmentedControlFlags & 0x10) != 0)
    {
      self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFEFEF);
      double v9 = [v12 _firstTouchForView:self];
      [v9 locationInView:self];
      if ((*(_WORD *)&segmentedControlFlags & 0x1000) != 0
        || -[UISegmentedControl pointMostlyInside:withEvent:](self, "pointMostlyInside:withEvent:", v12))
      {
        [(UISegmentedControl *)self _setSelectedSegmentIndex:self->_highlightedSegment notify:1 animate:1];
      }
      $05538722D7BB7C1D427C07F59A9C38BA v10 = self->_segmentedControlFlags;
      if ((*(_DWORD *)&v10 & 0x1000000) != 0)
      {
        [v7 setActiveSegmentControl:self];
        [v7 touchesEnded];
        [v7 setActiveSegmentControl:0];
      }
      else if ((*(_DWORD *)&v10 & 0x8000000) != 0)
      {
        double v11 = [(UISegmentedControl *)self _feedbackGenerator];
        [v11 pressedUp];

        *(_DWORD *)&self->_segmentedControlFlags &= ~0x8000000u;
      }
      [(UISegmentedControl *)self _highlightSegment:-1];
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  BOOL v5 = objc_opt_class();
  unsigned int v6 = [(UIView *)self traitCollection];
  UISegmentedControlStyleProviderForIdiom(v5, [v6 userInterfaceIdiom]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (([v8 useTVStyleFocusSelection] & 1) == 0)
  {
    $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = self->_segmentedControlFlags;
    if ((*(unsigned char *)&segmentedControlFlags & 0x10) != 0)
    {
      self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFEFEF);
      [(UISegmentedControl *)self _highlightSegment:-1];
    }
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UISegmentedControl *)self _shouldConsumeEventWithPresses:v6])
  {
    [(UISegment *)self->_focusedSegment _setHighlighted:1 animated:1];
    [(UISegmentedControl *)self _selectFocusedSegment];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UISegmentedControl;
    [(UIResponder *)&v8 pressesBegan:v6 withEvent:v7];
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(UISegmentedControl *)self _shouldConsumeEventWithPresses:v6])
  {
    v8.receiver = self;
    v8.super_class = (Class)UISegmentedControl;
    [(UIResponder *)&v8 pressesChanged:v6 withEvent:v7];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UISegmentedControl *)self _shouldConsumeEventWithPresses:v6])
  {
    [(UISegment *)self->_focusedSegment _setHighlighted:0 animated:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UISegmentedControl;
    [(UIResponder *)&v8 pressesCancelled:v6 withEvent:v7];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UISegmentedControl *)self _shouldConsumeEventWithPresses:v6])
  {
    [(UISegmentedControl *)self setSelectedSegment:[(NSMutableArray *)self->_segments indexOfObject:self->_focusedSegment]];
    [(UISegment *)self->_focusedSegment _setHighlighted:0 animated:1];
    if ((*(unsigned char *)&self->_segmentedControlFlags & 8) != 0) {
      [(UISegmentedControl *)self performSelector:sel__clearSelectedSegment withObject:0 afterDelay:0.2];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UISegmentedControl;
    [(UIResponder *)&v8 pressesEnded:v6 withEvent:v7];
  }
}

- (BOOL)_shouldConsumeEventWithPresses:(id)a3
{
  int v4 = _UIPressesContainsPressType(a3, 4);
  if (v4)
  {
    focusedSegment = self->_focusedSegment;
    LOBYTE(v4) = [(UIView *)focusedSegment isEnabled];
  }
  return v4;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = objc_opt_class();
  $05538722D7BB7C1D427C07F59A9C38BA v10 = [(UIView *)self traitCollection];
  double v11 = UISegmentedControlStyleProviderForIdiom(v9, [v10 userInterfaceIdiom]);

  if ([v11 useSelectionIndicatorStyling])
  {
    if ((*(_DWORD *)&self->_segmentedControlFlags & 0x21000) != 0)
    {
      id v12 = v8;
      goto LABEL_9;
    }
    [v7 location];
    unsigned int v13 = -[UISegmentedControl _closestSegmentIndexAtPoint:](self, "_closestSegmentIndexAtPoint:");
    if ((v13 & 0x80000000) == 0)
    {
      uint64_t v14 = v13;
      uint64_t v15 = [(NSMutableArray *)self->_segments objectAtIndex:v13];
      if ([v15 isUserInteractionEnabled])
      {
        [v15 frame];
        CGRect v24 = CGRectInset(v23, -1.0, 0.0);
        double x = v24.origin.x;
        double y = v24.origin.y;
        double width = v24.size.width;
        double height = v24.size.height;
        id v20 = [[_UISegmentedControlSegmentHoverIdentifier alloc] initWithIndex:v14 selected:self->_selectedSegment == v14];
        +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v20, x, y, width, height);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

- (id)_pointerEffectWithPreview:(void *)a3 forSegment:(uint64_t)a4 selected:
{
  id v7 = a3;
  if (a1)
  {
    id v8 = a2;
    double v9 = objc_opt_class();
    $05538722D7BB7C1D427C07F59A9C38BA v10 = [a1 traitCollection];
    double v11 = UISegmentedControlStyleProviderForIdiom(v9, [v10 userInterfaceIdiom]);

    if (objc_opt_respondsToSelector()) {
      id v12 = (void *)[v11 pointerEffectClassForSegment:v7 selected:a4];
    }
    else {
      id v12 = objc_opt_class();
    }
    unsigned int v13 = [v12 effectWithPreview:v8];
  }
  else
  {
    unsigned int v13 = 0;
  }

  return v13;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  id v6 = [v5 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [v5 identifier];
    uint64_t v9 = [v8 index];
    if (v9 < 0)
    {
      float v54 = 0;
    }
    else
    {
      uint64_t v10 = v9;
      double v11 = [(NSMutableArray *)self->_segments objectAtIndex:v9];
      BOOL v12 = self->_selectedSegment == v10;
      unsigned int v13 = objc_opt_class();
      uint64_t v14 = [(UIView *)self traitCollection];
      objc_msgSend(v13, "_effectiveCornerRadiusForTraitCollection:size:selected:", v14, -[UISegmentedControl controlSize](self, "controlSize"), v12);
      double v16 = v15;

      double v17 = objc_opt_class();
      double v18 = [(UIView *)self traitCollection];
      objc_msgSend(v17, "_sectionIndicatorInsetForTraitCollection:size:", v18, -[UISegmentedControl controlSize](self, "controlSize"));
      CGFloat v20 = v19;

      [v11 bounds];
      double x = v21;
      CGFloat y = v22;
      double width = v23;
      CGFloat height = v24;
      if ((*((unsigned char *)&self->_segmentedControlFlags + 1) & 0x20) != 0)
      {
        CGRect v74 = CGRectInset(*(CGRect *)&v21, self->_innerSegmentSpacing * -0.5, 0.0);
        double x = v74.origin.x;
        CGFloat y = v74.origin.y;
        double width = v74.size.width;
        CGFloat height = v74.size.height;
      }
      if (v10 == self->_selectedSegment)
      {
        v75.origin.double x = x;
        v75.origin.CGFloat y = y;
        v75.size.double width = width;
        v75.size.CGFloat height = height;
        CGRect v76 = CGRectInset(v75, v20, v20);
        double v29 = v76.origin.x;
        double v30 = v76.origin.y;
        double v31 = v76.size.width;
        double v32 = v76.size.height;
        double v33 = [(UIView *)self superview];
        if ([(UITargetedPreview *)v33 clipsToBounds])
        {
          uint64_t v34 = [(UITargetedPreview *)v33 superview];

          double v33 = (UITargetedPreview *)v34;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v35 = [(UITargetedPreview *)v33 superview];

          double v33 = (UITargetedPreview *)v35;
        }
        [v11 frame];
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v33, v37 + v36 * 0.5, v39 + v38 * 0.5);
        long long v42 = -[UIPreviewTarget initWithContainer:center:]([UIPreviewTarget alloc], "initWithContainer:center:", v33, v40, v41);
        long long v43 = objc_opt_new();
        long long v44 = [[UITargetedPreview alloc] initWithView:v11 parameters:v43 target:v42];
        long long v45 = -[UISegmentedControl _pointerEffectWithPreview:forSegment:selected:](self, v44, v11, 1);
        objc_msgSend(v11, "convertRect:toView:", v33, v29, v30, v31, v32);
        double v47 = v46;
        double v49 = v48;
        double v51 = v50;
        double v53 = v52;
      }
      else
      {
        float v55 = objc_opt_class();
        uint64_t v56 = [(UIView *)self traitCollection];
        objc_msgSend(v55, "_dividerWidthForTraitCollection:size:", v56, -[UISegmentedControl controlSize](self, "controlSize"));
        double v58 = v57;

        int v59 = [v11 segmentPosition];
        if (v59 == 3)
        {
          double v62 = v20;
        }
        else
        {
          double v60 = v20 - v58;
          if (v59 == 2)
          {
            double x = x - v58;
            double width = width - v60;
            double v62 = 0.0;
          }
          else
          {
            double v61 = width - v60;
            if (v59)
            {
              double v62 = -v58;
            }
            else
            {
              double x = v20 + x;
              double width = v61;
              double v62 = 0.0;
            }
          }
        }
        v77.origin.double x = x;
        v77.origin.CGFloat y = y;
        v77.size.double width = width;
        v77.size.CGFloat height = height;
        CGRect v78 = CGRectInset(v77, v62, v20);
        double v63 = v78.origin.x;
        double v64 = v78.origin.y;
        double v65 = v78.size.width;
        double v66 = v78.size.height;
        double v33 = [[UITargetedPreview alloc] initWithView:v11];
        long long v45 = -[UISegmentedControl _pointerEffectWithPreview:forSegment:selected:](self, v33, v11, 0);
        objc_msgSend(v11, "convertRect:toView:", self, v63, v64, v65, v66);
        double v47 = v67;
        double v49 = v68;
        double v51 = v69;
        double v53 = v70;
      }

      double v71 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v47, v49, v51, v53, v16);
      float v54 = +[UIPointerStyle styleWithEffect:v45 shape:v71];
    }
  }
  else
  {
    float v54 = +[UIPointerStyle hiddenPointerStyle];
  }

  return v54;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke;
  v23[3] = &unk_1E52D9F70;
  v23[4] = self;
  [v8 addAnimations:v23];
  if (![(UISegmentedControl *)self transparentBackground])
  {
    uint64_t v9 = [(UISegmentedControl *)self _selectedSegmentVibrancyEffect];
    if (v9)
    {
    }
    else
    {
      uint64_t v10 = objc_opt_class();
      double v11 = [(UISegmentedControl *)self selectedSegmentTintColor];
      BOOL v12 = [(UIView *)self traitCollection];
      LODWORD(v10) = [v10 _useShadowForSelectedTintColor:v11 traitCollection:v12];

      if (v10)
      {
        if (self->_selectedSegment != -1)
        {
          unsigned int v13 = -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:");
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke_2;
          v21[3] = &unk_1E52D9F70;
          id v22 = v13;
          id v14 = v13;
          [v8 addAnimations:v21];
        }
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke_3;
        v20[3] = &unk_1E52D9F70;
        v20[4] = self;
        [v8 addAnimations:v20];
      }
    }
  }
  double v15 = [v7 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v17 = [v7 identifier];
    int64_t v18 = [v17 index];
    self->_int64_t hoveredSegment = v18;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke_4;
    v19[3] = &unk_1E52D9CD0;
    v19[4] = self;
    v19[5] = v18;
    [v8 addAnimations:v19];
  }
}

uint64_t __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 608) |= 0x8000u;
  return result;
}

uint64_t __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateDynamicShadow:1 animated:1];
  double v2 = *(void **)(a1 + 32);
  return [v2 _updateSelectionIndicator];
}

uint64_t __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDynamicShadow:1 animated:1];
}

uint64_t __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) hoverOnSegment:*(void *)(a1 + 40)];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke;
  v23[3] = &unk_1E52D9F70;
  v23[4] = self;
  [v8 addAnimations:v23];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_2;
  aBlock[3] = &unk_1E52D9F98;
  void aBlock[4] = self;
  id v9 = v8;
  id v22 = v9;
  uint64_t v10 = (void (**)(void))_Block_copy(aBlock);
  double v11 = [v7 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unsigned int v13 = [v7 identifier];
    uint64_t v14 = [v13 index];
    uint64_t v15 = v14;
    if (self->_hoveredSegment == v14) {
      self->_int64_t hoveredSegment = -1;
    }
    if (v14 == self->_selectedSegment)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_5;
      v20[3] = &unk_1E52D9F70;
      v20[4] = self;
      [v9 addAnimations:v20];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_6;
      v17[3] = &unk_1E52EAFB8;
      v17[4] = self;
      uint64_t v19 = v15;
      int64_t v18 = v10;
      [v9 addCompletion:v17];
    }
    else
    {
      if ((*((unsigned char *)&self->_segmentedControlFlags + 2) & 4) == 0) {
        v10[2](v10);
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_7;
      v16[3] = &unk_1E52D9CD0;
      v16[4] = self;
      v16[5] = v15;
      [v9 addAnimations:v16];
    }
  }
  else
  {
    v10[2](v10);
  }
}

uint64_t __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 608) &= ~0x8000u;
  return result;
}

void __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) transparentBackground] & 1) == 0)
  {
    double v2 = [*(id *)(a1 + 32) _selectedSegmentVibrancyEffect];
    if (v2)
    {
    }
    else
    {
      uint64_t v3 = objc_opt_class();
      int v4 = [*(id *)(a1 + 32) selectedSegmentTintColor];
      id v5 = [*(id *)(a1 + 32) traitCollection];
      LODWORD(v3) = [v3 _useShadowForSelectedTintColor:v4 traitCollection:v5];

      if (v3)
      {
        uint64_t v6 = *(void *)(a1 + 32);
        if (*(void *)(v6 + 504) != -1)
        {
          id v7 = objc_msgSend(*(id *)(v6 + 496), "objectAtIndexedSubscript:");
          id v8 = *(void **)(a1 + 40);
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_3;
          v12[3] = &unk_1E52D9F70;
          id v13 = v7;
          id v9 = v7;
          [v8 addAnimations:v12];

          uint64_t v6 = *(void *)(a1 + 32);
        }
        uint64_t v10 = *(void **)(a1 + 40);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_4;
        v11[3] = &unk_1E52D9F70;
        void v11[4] = v6;
        [v10 addAnimations:v11];
      }
    }
  }
}

uint64_t __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateDynamicShadow:0 animated:1];
  double v2 = *(void **)(a1 + 32);
  return [v2 _updateSelectionIndicator];
}

uint64_t __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDynamicShadow:0 animated:1];
}

uint64_t __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_5(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 608) |= 0x40000u;
  return result;
}

uint64_t __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_6(void *a1, int a2)
{
  *(_DWORD *)(a1[4] + 608) &= ~0x40000u;
  uint64_t result = a1[4];
  if (a2 && *(void *)(result + 528) != a1[6])
  {
    objc_msgSend((id)result, "hoverOffSegment:");
    uint64_t result = a1[4];
  }
  if ((*(unsigned char *)(result + 609) & 0x80) == 0)
  {
    int v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

uint64_t __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) hoverOffSegment:*(void *)(a1 + 40)];
}

- (BOOL)useBlockyMagnificationInClassic
{
  return 0;
}

- (void)_setEnabled:(BOOL)a3 forcePropagateToSegments:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(UIControl *)self isEnabled];
  BOOL v8 = v7;
  if (!v5 && v7)
  {
    [(UIView *)self alpha];
    self->_enabledAlphCATransform3D a = v9;
  }
  v26.receiver = self;
  v26.super_class = (Class)UISegmentedControl;
  [(UIControl *)&v26 setEnabled:v5];
  BOOL v10 = v8 ^ v5;
  if (v8 != v5 || v4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v11 = self->_segments;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (v5) {
            uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "isEnabled", (void)v22);
          }
          else {
            uint64_t v17 = 1;
          }
          objc_msgSend(v16, "_setEnabledAppearance:", v17, (void)v22);
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v13);
    }

    int64_t v18 = [(UIView *)self layer];
    [v18 setShouldRasterize:v5 ^ 1];
  }
  if (v10)
  {
    if (v5)
    {
      enabledAlphCATransform3D a = self->_enabledAlpha;
    }
    else
    {
      [(UIView *)self alpha];
      double v21 = v20;
      enabledAlphCATransform3D a = 0.5;
      if (v21 <= 0.5) {
        return;
      }
    }
    -[UISegmentedControl setAlpha:](self, "setAlpha:", enabledAlpha, (void)v22);
  }
}

- (void)setEnabled:(BOOL)a3
{
}

- (BOOL)_alwaysEmitValueChanged
{
  return (*(unsigned char *)&self->_segmentedControlFlags >> 2) & 1;
}

- (id)_selectedSegmentVibrancyEffect
{
  if ((*((unsigned char *)&self->_segmentedControlFlags + 2) & 0x20) != 0) {
    double v2 = self->_selectedSegmentVisualEffect;
  }
  else {
    double v2 = 0;
  }
  return v2;
}

- (id)__selectedSegmentVisualEffect
{
  return self->_selectedSegmentVisualEffect;
}

- (void)_setBackgroundTintColor:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self->_backgroundTintColor;
  BOOL v7 = (UIColor *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(UIColor *)v6 isEqual:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_backgroundTintColor, a3);
    [(UISegmentedControl *)self _setNeedsBackgroundAndContentViewUpdate];
  }
LABEL_9:
}

- (double)_interSegmentSpacing
{
  return self->_innerSegmentSpacing;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 view];
  if (v5 != self
    && [v4 _isGestureType:0]
    && [v4 numberOfTouchesRequired] == 1)
  {
    uint64_t v6 = [v4 numberOfTapsRequired];

    if (v6 == 1) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if (![v4 _isGestureType:8]
    || (unint64_t)[v4 minimumNumberOfTouches] > 1)
  {
    goto LABEL_13;
  }
  if ((*(unsigned char *)&self->_segmentedControlFlags & 0x10) != 0)
  {
LABEL_15:
    BOOL v9 = 0;
    goto LABEL_14;
  }
  if ([(UISegmentedControl *)self shouldTrack]
    && ([v4 locationInView:self], -[UIView pointInside:withEvent:](self, "pointInside:withEvent:", 0)))
  {
    [v4 translationInView:self];
    BOOL v9 = fabs(v7) <= fabs(v8);
  }
  else
  {
LABEL_13:
    BOOL v9 = 1;
  }
LABEL_14:

  return v9;
}

- (void)_axLongPressHandler:(id)a3
{
  id v12 = a3;
  id v4 = [(id)UIApp preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    uint64_t v6 = [(UISegmentedControl *)self axLongPressGestureRecognizer];
    int v7 = [v12 isEqual:v6];

    if (v7)
    {
      double v8 = [(UISegmentedControl *)self axLongPressGestureRecognizer];
      uint64_t v9 = [v8 state];

      if (v9 == 1)
      {
        BOOL v10 = [[UIAccessibilityLargeTextSegmentedViewController alloc] initWithSegmentedControl:self segments:self->_segments delegate:self];
        double v11 = [(UIView *)self _viewControllerForAncestor];
        [v11 presentViewController:v10 animated:1 completion:0];
      }
    }
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (BOOL)canBecomeFocused
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(UIView *)self traitCollection];
  id v5 = UISegmentedControlStyleProviderForIdiom(v3, [v4 userInterfaceIdiom]);

  v8.receiver = self;
  v8.super_class = (Class)UISegmentedControl;
  if ([(UIControl *)&v8 canBecomeFocused]
    && [(UISegmentedControl *)self _hasEnabledSegment])
  {
    if ([v5 useTVStyleFocusSelection]) {
      BOOL v6 = ![(UIView *)self isFocused];
    }
    else {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_viewToAddFocusLayer
{
  if (!self->_focusedSegment)
  {
    if (self->_selectedSegment < 0
      || (-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:"),
          id v5 = (UISegment *)objc_claimAutoreleasedReturnValue(),
          BOOL v6 = self->_focusedSegment,
          self->_focusedSegment = v5,
          v6,
          !self->_focusedSegment))
    {
      if ([(NSMutableArray *)self->_segments count])
      {
        int v7 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:0];
        focusedSegment = self->_focusedSegment;
        self->_focusedSegment = v7;
      }
    }
  }
  uint64_t v3 = self->_focusedSegment;
  return v3;
}

- (id)_defaultFocusEffect
{
  return 0;
}

- (void)_diagnoseFocusabilityForReport:(id)a3
{
  id v5 = a3;
  if (![(UISegmentedControl *)self _hasEnabledSegment])
  {
    id v4 = +[_UIDebugIssue issueWithDescription:@"This segmented control does not have any enabled segments. Segmented controls must have at least one enabled segment in order to be focusable."];
    [v5 addIssue:v4];
  }
}

- (BOOL)_hasEnabledSegment
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v2 = self->_segments;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isEnabled", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_selectFocusedSegment
{
  uint64_t v3 = self->_focusedSegment;
  uint64_t v4 = v3;
  if (v3)
  {
    long long v7 = v3;
    BOOL v5 = [(UISegment *)v3 isSelected];
    uint64_t v4 = v7;
    if (!v5)
    {
      [(UISegmentedControl *)self _cancelDelayedFocusAction];
      uint64_t v6 = [(NSMutableArray *)self->_segments indexOfObject:v7];
      uint64_t v4 = v7;
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(UISegmentedControl *)self _setSelectedSegmentIndex:v6 notify:1 animate:1];
        uint64_t v4 = v7;
      }
    }
  }
}

+ (BOOL)_selectFocusedSegmentAfterFocusUpdateForTraitCollection:(id)a3
{
  uint64_t v3 = UISegmentedControlStyleProviderForIdiom(a1, [a3 userInterfaceIdiom]);
  char v4 = [v3 useTVStyleFocusSelection];

  return v4;
}

- (void)_sendDelayedFocusActionIfNecessary
{
  uint64_t v3 = [(UIView *)self traitCollection];
  BOOL v4 = +[UISegmentedControl _selectFocusedSegmentAfterFocusUpdateForTraitCollection:v3];

  if (v4)
  {
    [(UISegmentedControl *)self _cancelDelayedFocusAction];
    [(UISegmentedControl *)self performSelector:sel__selectFocusedSegment withObject:0 afterDelay:0.31];
  }
}

- (void)_cancelDelayedFocusAction
{
  uint64_t v3 = objc_opt_class();
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel__selectFocusedSegment object:0];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UISegmentedControl;
  [(UIView *)&v6 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  BOOL v5 = [(UISegmentedControl *)self _internalFocusSystem];
  objc_msgSend(v5, "_setEnabled:", -[UIView isFocused](self, "isFocused"));
  [v5 setNeedsFocusUpdate];
}

- (id)focusItemsInRect:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UISegmentedControl;
  BOOL v4 = -[UIView focusItemsInRect:](&v8, sel_focusItemsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__UISegmentedControl_focusItemsInRect___block_invoke;
  v7[3] = &unk_1E52EAFE0;
  v7[4] = self;
  BOOL v5 = objc_msgSend(v4, "bs_filter:", v7);

  return v5;
}

uint64_t __39__UISegmentedControl_focusItemsInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) containsObject:a2] ^ 1;
}

- (BOOL)_focusSystem:(id)a3 containsChildOfHostEnvironment:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_preferredFocusEnvironmentsForFocusSystem:(id)a3
{
  int64_t selectedSegment = self->_selectedSegment;
  segments = self->_segments;
  if (selectedSegment < 0)
  {
    long long v7 = segments;
  }
  else
  {
    objc_super v6 = -[NSMutableArray objectAtIndexedSubscript:](segments, "objectAtIndexedSubscript:");
    long long v7 = (NSMutableArray *)[(NSMutableArray *)self->_segments mutableCopy];
    [(NSMutableArray *)v7 removeObject:v6];
    [(NSMutableArray *)v7 insertObject:v6 atIndex:0];
  }
  return v7;
}

- (id)_focusSystem:(id)a3 focusItemsInRect:(CGRect)a4
{
  return self->_segments;
}

- (void)_focusSystem:(id)a3 didFinishUpdatingFocusInContext:(id)a4
{
  objc_msgSend(a4, "nextFocusedItem", a3);
  BOOL v5 = (UISegment *)objc_claimAutoreleasedReturnValue();
  focusedSegment = self->_focusedSegment;
  self->_focusedSegment = v5;

  [(UIView *)self setNeedsLayout];
  [(UISegmentedControl *)self _sendDelayedFocusActionIfNecessary];
}

- (void)_setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  id v8 = a3;
  id appearanceStorage = self->_appearanceStorage;
  id v13 = v8;
  if (v8)
  {
    if (!appearanceStorage)
    {
      long long v10 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
      id v11 = self->_appearanceStorage;
      self->_id appearanceStorage = v10;

      id appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  [appearanceStorage backgroundImageForState:a4 isMini:a5 == 1];
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = v13;
  if (v12 != v13)
  {
    [self->_appearanceStorage setBackgroundImage:v13 forState:a4 isMini:a5 == 1];
    [(UISegmentedControl *)self _setNeedsAppearanceUpdate];
    id v8 = v13;
  }
LABEL_7:
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
  id v8 = backgroundImage;
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    long long v9 = v8;
    [(UISegmentedControl *)self _setBackgroundImage:v8 forState:state barMetrics:barMetrics];
  }
  else
  {
    if (setBackgroundImage_forState_barMetrics__didWarn) {
      goto LABEL_6;
    }
    setBackgroundImage_forState_barMetrics__didWarn = 1;
    long long v9 = v8;
    NSLog(&cfstr_SCustomization.isa, "UISegmentedControl", @"background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
  id v8 = v9;
LABEL_6:
}

- (UIImage)backgroundImageForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    id v4 = [self->_appearanceStorage backgroundImageForState:state isMini:barMetrics == UIBarMetricsCompact];
  }
  else
  {
    if ((backgroundImageForState_barMetrics__didWarn & 1) == 0)
    {
      backgroundImageForState_barMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, state, "UISegmentedControl", @"background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    id v4 = 0;
  }
  return (UIImage *)v4;
}

- (void)_setDividerImage:(id)a3 forLeftSegmentState:(unint64_t)a4 rightSegmentState:(unint64_t)a5 barMetrics:(int64_t)a6
{
  id v10 = a3;
  id appearanceStorage = self->_appearanceStorage;
  id v15 = v10;
  if (v10)
  {
    if (!appearanceStorage)
    {
      id v12 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
      id v13 = self->_appearanceStorage;
      self->_id appearanceStorage = v12;

      id appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  [appearanceStorage dividerImageForLeftSegmentState:a4 rightSegmentState:a5 isMini:a6 == 1];
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v10 = v15;
  if (v14 != v15)
  {
    [self->_appearanceStorage setDividerImage:v15 forLeftSegmentState:a4 rightSegmentState:a5 isMini:a6 == 1];
    [(UISegmentedControl *)self _setNeedsAppearanceUpdate];
    id v10 = v15;
  }
LABEL_7:
}

- (void)setDividerImage:(UIImage *)dividerImage forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState barMetrics:(UIBarMetrics)barMetrics
{
  id v10 = dividerImage;
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    id v11 = v10;
    [(UISegmentedControl *)self _setDividerImage:v10 forLeftSegmentState:leftState rightSegmentState:rightState barMetrics:barMetrics];
  }
  else
  {
    if (setDividerImage_forLeftSegmentState_rightSegmentState_barMetrics__didWarn) {
      goto LABEL_6;
    }
    setDividerImage_forLeftSegmentState_rightSegmentState_barMetrics__didWarn = 1;
    id v11 = v10;
    NSLog(&cfstr_SCustomization.isa, "UISegmentedControl", @"divider image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
  id v10 = v11;
LABEL_6:
}

- (UIImage)dividerImageForLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState barMetrics:(UIBarMetrics)barMetrics
{
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    BOOL v5 = [self->_appearanceStorage dividerImageForLeftSegmentState:leftState rightSegmentState:rightState isMini:barMetrics == UIBarMetricsCompact];
  }
  else
  {
    if ((dividerImageForLeftSegmentState_rightSegmentState_barMetrics__didWarn & 1) == 0)
    {
      dividerImageForLeftSegmentState_rightSegmentState_barMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, leftState, rightState, "UISegmentedControl", @"divider image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    BOOL v5 = 0;
  }
  return (UIImage *)v5;
}

- (NSDictionary)titleTextAttributesForState:(UIControlState)state
{
  return (NSDictionary *)[self->_appearanceStorage textAttributesForState:state];
}

- (void)_setBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  id appearanceStorage = self->_appearanceStorage;
  if (a3 != 0.0 || appearanceStorage != 0)
  {
    if (!appearanceStorage)
    {
      long long v9 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
      id v10 = self->_appearanceStorage;
      self->_id appearanceStorage = v9;

      id appearanceStorage = self->_appearanceStorage;
    }
    [appearanceStorage backgroundPositionAdjustmentForBarMetrics:a4];
    if (v11 != a3)
    {
      [self->_appearanceStorage setBackgroundPositionAdjustment:a4 forBarMetrics:a3];
      id v12 = [(UIView *)self superview];
      [v12 setNeedsLayout];
    }
  }
}

- (double)_backgroundVerticalPositionAdjustmentForBarMetrics:(int64_t)a3
{
  [self->_appearanceStorage backgroundPositionAdjustmentForBarMetrics:a3];
  return result;
}

- (void)setContentPositionAdjustment:(UIOffset)adjustment forSegmentType:(UISegmentedControlSegment)leftCenterRightOrAlone barMetrics:(UIBarMetrics)barMetrics
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(barMetrics - 101) <= 1)
  {
    if ((setContentPositionAdjustment_forSegmentType_barMetrics__didWarn & 1) == 0)
    {
      setContentPositionAdjustment_forSegmentType_barMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, leftCenterRightOrAlone, adjustment.horizontal, adjustment.vertical, "UISegmentedControl", @"segment content position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return;
  }
  double vertical = adjustment.vertical;
  double horizontal = adjustment.horizontal;
  id appearanceStorage = self->_appearanceStorage;
  if (appearanceStorage) {
    goto LABEL_8;
  }
  if (adjustment.horizontal != 0.0 || adjustment.vertical != 0.0)
  {
    double v11 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
    id v12 = self->_appearanceStorage;
    self->_id appearanceStorage = v11;

    id appearanceStorage = self->_appearanceStorage;
LABEL_8:
    id v13 = [appearanceStorage contentPositionOffsetForSegment:leftCenterRightOrAlone inMiniBar:barMetrics == UIBarMetricsCompact noFallback:1];
    id v14 = v13;
    if (v13)
    {
      [v13 UIOffsetValue];
    }
    else
    {
      double v15 = 0.0;
      double v16 = 0.0;
    }
    if (horizontal == v15 && vertical == v16)
    {
LABEL_29:

      return;
    }
    objc_super v26 = v14;
    id v18 = self->_appearanceStorage;
    *(double *)double v31 = horizontal;
    *(double *)&v31[1] = vertical;
    uint64_t v19 = [MEMORY[0x1E4F29238] valueWithBytes:v31 objCType:"{UIOffset=dd}"];
    [v18 setContentPositionOffset:v19 forSegment:leftCenterRightOrAlone inMiniBar:barMetrics == UIBarMetricsCompact];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v20 = self->_segments;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (!v21) {
      goto LABEL_28;
    }
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
LABEL_17:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v28 != v23) {
        objc_enumerationMutation(v20);
      }
      uint64_t v25 = *(void *)(*((void *)&v27 + 1) + 8 * v24);
      if (*(void *)(v25 + 544))
      {
        if (leftCenterRightOrAlone == UISegmentedControlSegmentAny) {
          goto LABEL_25;
        }
      }
      else
      {
        objc_storeStrong((id *)(v25 + 544), self->_appearanceStorage);
        if (leftCenterRightOrAlone == UISegmentedControlSegmentAny) {
          goto LABEL_25;
        }
      }
      if ((((unint64_t)*(unsigned int *)(v25 + 624) >> 6) & 7) + 1 == leftCenterRightOrAlone)
      {
LABEL_25:
        [(id)v25 _positionInfoWithoutAnimation];
        [(id)v25 _invalidateInfoConstraints];
      }
      if (v22 == ++v24)
      {
        uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (!v22)
        {
LABEL_28:

          id v14 = v26;
          goto LABEL_29;
        }
        goto LABEL_17;
      }
    }
  }
}

- (UIOffset)contentPositionAdjustmentForSegmentType:(UISegmentedControlSegment)leftCenterRightOrAlone barMetrics:(UIBarMetrics)barMetrics
{
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    objc_super v6 = [self->_appearanceStorage contentPositionOffsetForSegment:leftCenterRightOrAlone inMiniBar:barMetrics == UIBarMetricsCompact];
    long long v7 = v6;
    if (v6)
    {
      [v6 UIOffsetValue];
      double v4 = v8;
      double v5 = v9;
    }
    else
    {
      double v4 = 0.0;
      double v5 = 0.0;
    }
  }
  else
  {
    double v4 = 0.0;
    if ((contentPositionAdjustmentForSegmentType_barMetrics__didWarn & 1) == 0)
    {
      contentPositionAdjustmentForSegmentType_barMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, leftCenterRightOrAlone, "UISegmentedControl", @"segment content position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    double v5 = 0.0;
  }
  double v10 = v4;
  double v11 = v5;
  result.double vertical = v11;
  result.double horizontal = v10;
  return result;
}

- (id)_badgeValueForSegmentAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSMutableArray *)self->_segments objectAtIndex:a3];
  double v4 = [v3 badgeValue];

  return v4;
}

- (void)_setBadgeValue:(id)a3 forSegmentAtIndex:(unint64_t)a4
{
  segments = self->_segments;
  id v7 = a3;
  id v8 = [(NSMutableArray *)segments objectAtIndex:a4];
  [v8 setBadgeValue:v7];

  [(UIView *)self setNeedsLayout];
}

+ (double)_effectiveCornerRadiusForTraitCollection:(id)a3 size:(int)a4 selected:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  [a1 _cornerRadiusForTraitCollection:v8 size:v6];
  double v10 = v9;
  if (v5)
  {
    [a1 _sectionIndicatorInsetForTraitCollection:v8 size:v6];
    double v12 = v11;
    id v13 = UISegmentedControlStyleProviderForIdiom(a1, [v8 userInterfaceIdiom]);
    int v14 = [v13 useSelectionIndicatorStyling];
    double v15 = 0.0;
    if (v14) {
      double v15 = v12;
    }
    double v10 = v10 - v15;
  }
  return v10;
}

- (id)_createInfoViewForSegmentAtIndex:(unint64_t)a3 item:(id)a4
{
  return 0;
}

uint64_t __55__UISegmentedControl__insertSegment_withInfo_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  double v2 = *(void **)(a1 + 40);
  return [v2 animateAdd:0];
}

- (void)_clearSelectedSegment
{
  if ((*(unsigned char *)&self->_segmentedControlFlags & 8) != 0) {
    [(UISegmentedControl *)self selectSegment:0xFFFFFFFFLL];
  }
}

- (id)_uiktest_labelsWithState:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_segments;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "_segmentState", (void)v15) == a3)
        {
          double v12 = [v11 _segmentLabel];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];

  return v13;
}

- (id)_uiktest_segmentAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_segments objectAtIndex:a3];
}

- (void)setSpringLoaded:(BOOL)a3
{
}

UISpringLoadedInteraction *__38__UISegmentedControl_setSpringLoaded___block_invoke()
{
  id v0 = [UISpringLoadedInteraction alloc];
  v1 = objc_opt_new();
  double v2 = objc_opt_new();
  uint64_t v3 = [(UISpringLoadedInteraction *)v0 initWithInteractionBehavior:v1 interactionEffect:v2 activationHandler:&__block_literal_global_767];

  return v3;
}

void __38__UISegmentedControl_setSpringLoaded___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v9 = [a2 view];
  [v4 locationInView:v9];
  double v6 = v5;
  double v8 = v7;

  objc_msgSend(v9, "_tapSegmentAtPoint:touchDown:", 0, v6, v8);
}

- (UIView)removedSegment
{
  return self->_removedSegment;
}

- (void)setRemovedSegment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_internalFocusSystem, 0);
  objc_storeStrong((id *)&self->_selectedSegmentVisualEffect, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);
  objc_storeStrong((id *)&self->_selectedSegmentTintColor, 0);
  objc_storeStrong(&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_focusedSegment, 0);
  objc_storeStrong((id *)&self->_removedSegment, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_highlightImageView, 0);
  objc_storeStrong((id *)&self->_highlightIndicatorView, 0);
  objc_storeStrong((id *)&self->_selectionImageView, 0);
  objc_storeStrong((id *)&self->_selectionIndicatorView, 0);
}

- (id)infoViewForSegment:(int64_t)a3
{
  uint64_t v3 = [(NSMutableArray *)self->_segments objectAtIndex:a3];
  id v4 = v3[63];

  return v4;
}

+ (double)defaultHeight
{
  return 44.0;
}

- (UISegmentedControl)initWithFrame:(CGRect)a3 withStyle:(int64_t)a4 withItems:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  double v11 = -[UISegmentedControl initWithFrame:](self, "initWithFrame:", x, y, width, height);
  if (v11)
  {
    int v12 = [v10 count];
    int v13 = v12;
    if (v12 >= 1)
    {
      uint64_t v14 = 0;
      uint64_t v15 = (v12 - 1);
      uint64_t v16 = v12;
      do
      {
        if (v15 == v14) {
          unsigned int v17 = 2;
        }
        else {
          unsigned int v17 = 1;
        }
        if (!v14) {
          unsigned int v17 = 0;
        }
        if (v13 == 1) {
          uint64_t v18 = 3;
        }
        else {
          uint64_t v18 = v17;
        }
        uint64_t v19 = [v10 objectAtIndex:v14];
        id v20 = [(UISegmentedControl *)v11 _createAndAddSegmentAtIndex:v14 position:v18 withInfo:v19];

        ++v14;
      }
      while (v16 != v14);
    }
  }

  return v11;
}

- (void)setAlwaysNotifiesDelegateOfSegmentClicks:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFFFFB | v3);
}

- (void)setImagePadding:(CGSize)a3 forSegment:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = [(NSMutableArray *)self->_segments objectAtIndex:a4];
  objc_msgSend(v7, "setContentOffset:", width, height);

  if ((*(unsigned char *)&self->_segmentedControlFlags & 0x20) != 0) {
    [(UISegmentedControl *)self sizeToFit];
  }
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)selectSegment:(int)a3
{
}

- (void)addSegmentWithTitle:(id)a3
{
  id v4 = a3;
  [(UISegmentedControl *)self insertSegmentWithTitle:v4 atIndex:[(UISegmentedControl *)self numberOfSegments] animated:0];
}

- (void)insertSegment:(unint64_t)a3 withTitle:(id)a4 animated:(BOOL)a5
{
}

- (void)insertSegment:(unint64_t)a3 withImage:(id)a4 animated:(BOOL)a5
{
}

- (void)setWidth:(float)a3 forSegment:(unint64_t)a4
{
}

- (float)widthForSegment:(unint64_t)a3
{
  [(UISegmentedControl *)self widthForSegmentAtIndex:a3];
  return v3;
}

@end