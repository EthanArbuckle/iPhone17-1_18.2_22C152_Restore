@interface SFCapsuleNavigationBar
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)_hidesTitle;
- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4;
- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (BOOL)_scribbleInteractionIsEnabled:(id)a3;
- (BOOL)_shouldCenterButtonsBetweenEdgeAndTitle:(id)a3;
- (BOOL)_shouldCenterLabels;
- (BOOL)_shouldHideButtons;
- (BOOL)_shouldHideButtonsForMinimized:(BOOL)a3;
- (BOOL)_showsReaderAvailabilityText;
- (BOOL)_showsSearchIconInTitleContainer;
- (BOOL)_showsTranslationAvailabilityText;
- (BOOL)_transitionFromButtons:(id)a3 toButtons:(id)a4 withConstraintsToDeactivate:(id)a5;
- (BOOL)isMinimized;
- (BOOL)isSelected;
- (BOOL)showingTransientLabel;
- (CGAffineTransform)keyContentTransform;
- (CGAffineTransform)microphoneContentTransform;
- (CGPoint)_minimumEdgeMargin;
- (CGPoint)_titleToEdgeMargin;
- (CGRect)keyContentRect;
- (CGRect)urlOutlineFrameRelativeToView:(id)a3;
- (CGSize)urlSize;
- (NSArray)leadingButtons;
- (NSArray)popoverPassthroughViews;
- (NSArray)trailingButtons;
- (NSNumber)microphoneContentOriginX;
- (PKScribbleInteraction)scribbleInteraction;
- (SFCapsuleContentViewSizeUpdating)sizeUpdater;
- (SFCapsuleNavigationBar)initWithCoder:(id)a3;
- (SFCapsuleNavigationBar)initWithFrame:(CGRect)a3;
- (SFCapsuleNavigationBar)initWithFrame:(CGRect)a3 layoutStyle:(int64_t)a4;
- (SFNavigationBarItem)item;
- (UITextField)textField;
- (UIView)unclippedContainer;
- (_SFBarTheme)theme;
- (_SFNavigationBarDelegateCommon)delegate;
- (_SFPopoverSourceInfo)URLOutlinePopoverSourceInfo;
- (_SFPopoverSourceInfo)formatMenuButtonPopoverSourceInfo;
- (double)_interButtonSpacing;
- (double)_titleToButtonSpacing;
- (double)keyContentBaselineBottomInset;
- (double)keyContentCapHeightTopInset;
- (double)minimizationPercent;
- (double)nonKeyContentAlpha;
- (id)_horizontalAlignmentConstraintForLabel:(id)a3;
- (id)_labelTextStyle;
- (id)availabilityDisplayController:(id)a3 determineBestLabelsForPresentation:(id)a4;
- (id)buttonPointerStyleProvider;
- (id)highlightObserver;
- (id)initForSizingWithFrame:(CGRect)a3;
- (id)initForSizingWithFrame:(CGRect)a3 layoutStyle:(int64_t)a4;
- (id)popoverSourceInfoForBarItem:(int64_t)a3;
- (int64_t)layoutStyle;
- (void)_createLeadingButtonConstraints;
- (void)_createTrailingButtonConstraints;
- (void)_initializeLayoutInfo:(id)a3 forPrimaryLabel:(BOOL)a4 addingConstraints:(id)a5;
- (void)_invalidateHeight;
- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4;
- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
- (void)_setHidesTitle:(BOOL)a3;
- (void)_updateButtonAlphaForMinimizedPercent:(double)a3;
- (void)_updateButtonsTransform;
- (void)_updateLabelContents;
- (void)_updateLabelTypesAnimated:(BOOL)a3;
- (void)_updatePageFormatButtonForNavigationBarItem:(id)a3 shouldResetDiscovery:(BOOL)a4;
- (void)_updatePlaceholderText;
- (void)_updateProgressViewFillColor;
- (void)_updateSecurityAnnotation;
- (void)_updateShowsPrivateAnnotation;
- (void)_updateShowsProgressView;
- (void)_updateTitleContainerAlpha;
- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6 afterImageDisappearsBlock:(id)a7 afterDestinationLayerBouncesBlock:(id)a8;
- (void)availabilityDisplayController:(id)a3 didUpdateWithState:(int64_t)a4;
- (void)didCompleteBarRegistrationWithToken:(id)a3;
- (void)layoutSubviews;
- (void)navigationBarItemDidUpdateContentOptions:(id)a3 resetDisplay:(BOOL)a4;
- (void)navigationBarItemDidUpdateFluidProgressController:(id)a3;
- (void)navigationBarItemDidUpdateFormatButtonSelected:(id)a3;
- (void)navigationBarItemDidUpdateHasHiddenElements:(id)a3;
- (void)navigationBarItemDidUpdateMediaStateIcon:(id)a3;
- (void)navigationBarItemDidUpdateNeedsExtensionBadge:(id)a3;
- (void)navigationBarItemDidUpdateOverlayNarrowConfiguration:(id)a3;
- (void)navigationBarItemDidUpdateSecurityAnnotation:(id)a3;
- (void)navigationBarItemDidUpdateShowsExtensionsAvailability:(id)a3;
- (void)navigationBarItemDidUpdateShowsLockIcon:(id)a3;
- (void)navigationBarItemDidUpdateShowsSearchIndicator:(id)a3;
- (void)navigationBarItemDidUpdateShowsSiriReaderPlayingIcon:(id)a3;
- (void)navigationBarItemDidUpdateShowsStopReloadButtons:(id)a3;
- (void)navigationBarItemDidUpdateShowsTranslationIcon:(id)a3;
- (void)navigationBarItemDidUpdateStopReloadButtonShowsStop:(id)a3;
- (void)navigationBarItemDidUpdateText:(id)a3;
- (void)prepareForReuse;
- (void)prepareForSizingNavigationBar:(id)a3;
- (void)setButtonPointerStyleProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlightObserver:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsMinimized:(BOOL)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setKeyContentTransform:(CGAffineTransform *)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setLeadingButtons:(id)a3;
- (void)setMicrophoneContentTransform:(CGAffineTransform *)a3;
- (void)setMinimizationPercent:(double)a3;
- (void)setMinimized:(BOOL)a3;
- (void)setNonKeyContentAlpha:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSizeUpdater:(id)a3;
- (void)setTheme:(id)a3;
- (void)setTrailingButtons:(id)a3;
- (void)setUnclippedContainer:(id)a3;
- (void)updateAccessibilityIdentifier;
- (void)updateConstraints;
- (void)willChangeToMinimized:(BOOL)a3 coordinator:(id)a4;
@end

@implementation SFCapsuleNavigationBar

- (void)setUnclippedContainer:(id)a3
{
}

- (void)setSelected:(BOOL)a3
{
  if (self->_isSelected != a3)
  {
    self->_isSelected = a3;
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_leadingButtonConstraints];
    leadingButtonConstraints = self->_leadingButtonConstraints;
    self->_leadingButtonConstraints = 0;

    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_trailingButtonConstraints];
    trailingButtonConstraints = self->_trailingButtonConstraints;
    self->_trailingButtonConstraints = 0;

    [(SFCapsuleNavigationBar *)self setNeedsUpdateConstraints];
    [(SFCapsuleNavigationBar *)self setNeedsLayout];
  }
}

- (void)setMinimized:(BOOL)a3
{
  if (self->_isMinimized != a3)
  {
    self->_isMinimized = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained navigationBarMinimizationChanged];

    [(SFCapsuleNavigationBar *)self _updateLabelTypesAnimated:1];
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_leadingButtonConstraints];
    leadingButtonConstraints = self->_leadingButtonConstraints;
    self->_leadingButtonConstraints = 0;

    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_trailingButtonConstraints];
    trailingButtonConstraints = self->_trailingButtonConstraints;
    self->_trailingButtonConstraints = 0;

    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_textVerticalAlignmentConstraints];
    textVerticalAlignmentConstraints = self->_textVerticalAlignmentConstraints;
    self->_textVerticalAlignmentConstraints = 0;

    [(SFCapsuleNavigationBar *)self setNeedsUpdateConstraints];
    [(SFCapsuleNavigationBar *)self setNeedsLayout];
    [(SFCapsuleNavigationBar *)self _updateShowsProgressView];
    v16 = self->_theme;
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      v9 = v16;
      v10 = v9;
      if (a3) {
        [(_SFBarTheme *)v9 tabTitleTheme];
      }
      else {
      v11 = [(_SFBarTheme *)v9 titleTheme];
      }
      [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setTheme:v11];

      v12 = [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer theme];
      v13 = [v12 placeholderTextColor];
      [(UIView *)self->_searchIndicatorView setTintColor:v13];
    }
    [(SFCapsuleNavigationBar *)self _updateLabelContents];
    [(SFCapsuleNavigationBar *)self _updateButtonsTransform];
    v14 = [(SFCapsuleNavigationBarLabelLayoutInfo *)self->_titleLabelLayoutInfo constraintForHorizontalAlignment];
    [v14 setActive:0];

    [(SFCapsuleNavigationBarLabelLayoutInfo *)self->_titleLabelLayoutInfo setConstraintForHorizontalAlignment:0];
    v15 = [(SFCapsuleNavigationBarLabelLayoutInfo *)self->_availabilityLabelLayoutInfo constraintForHorizontalAlignment];
    [v15 setActive:0];

    [(SFCapsuleNavigationBarLabelLayoutInfo *)self->_availabilityLabelLayoutInfo setConstraintForHorizontalAlignment:0];
    [(SFCapsuleNavigationBar *)self _updateShowsPrivateAnnotation];
  }
}

- (void)setMinimizationPercent:(double)a3
{
  if (self->_minimizationPercent != a3)
  {
    self->_minimizationPercent = a3;
    -[SFCapsuleNavigationBar _updateButtonAlphaForMinimizedPercent:](self, "_updateButtonAlphaForMinimizedPercent:");
  }
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (BOOL)_transitionFromButtons:(id)a3 toButtons:(id)a4 withConstraintsToDeactivate:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [v8 isEqualToArray:v9];
  char v12 = v11;
  if ((v11 & 1) == 0)
  {
    id v29 = v10;
    char v30 = v11;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "removeFromSuperview", v29);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v15);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v9;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      uint64_t v22 = *MEMORY[0x1E4FB27B8];
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          v24 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          objc_msgSend(v24, "setMaximumContentSizeCategory:", v22, v29);
          LODWORD(v25) = 1132920832;
          [v24 setContentHuggingPriority:0 forAxis:v25];
          LODWORD(v26) = 1145077760;
          [v24 setContentCompressionResistancePriority:0 forAxis:v26];
          [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
          [(SFCapsuleNavigationBar *)self addSubview:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v20);
    }

    id v10 = v29;
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v29];
    [(SFCapsuleNavigationBar *)self setNeedsUpdateConstraints];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sizeUpdater);
    [WeakRetained invalidateHeightForCapsuleContentView:self];

    char v12 = v30;
  }

  return v12 ^ 1;
}

- (void)_updateButtonAlphaForMinimizedPercent:(double)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v4 = _SFInterpolate((double)([(SFCapsuleNavigationBar *)self _shouldHideButtonsForMinimized:0] ^ 1), (double)([(SFCapsuleNavigationBar *)self _shouldHideButtonsForMinimized:1] ^ 1), a3)* self->_nonKeyContentAlpha;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_leadingButtons;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v9++) setAlpha:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = self->_trailingButtons;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "setAlpha:", v4, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)_shouldHideButtonsForMinimized:(BOOL)a3
{
  return !self->_isSelected || a3;
}

- (id)buttonPointerStyleProvider
{
  return self->_buttonPointerStyleProvider;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (BOOL)isMinimized
{
  return self->_isMinimized;
}

- (SFCapsuleNavigationBar)initWithFrame:(CGRect)a3 layoutStyle:(int64_t)a4
{
  v58[2] = *MEMORY[0x1E4F143B8];
  v55.receiver = self;
  v55.super_class = (Class)SFCapsuleNavigationBar;
  v5 = -[SFCapsuleNavigationBar initWithFrame:](&v55, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v6 = v5;
  if (v5)
  {
    [(SFCapsuleNavigationBar *)v5 setInsetsLayoutMarginsFromSafeArea:0];
    v6->_layoutStyle = a4;
    uint64_t v7 = [_SFFluidProgressView alloc];
    [(SFCapsuleNavigationBar *)v6 bounds];
    uint64_t v8 = -[_SFFluidProgressView initWithFrame:](v7, "initWithFrame:");
    progressView = v6->_progressView;
    v6->_progressView = (_SFFluidProgressView *)v8;

    [(_SFFluidProgressView *)v6->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_SFFluidProgressView *)v6->_progressView setDelegate:v6];
    id v10 = [(_SFFluidProgressView *)v6->_progressView layer];
    [v10 setZPosition:1.0];

    [(SFCapsuleNavigationBar *)v6 addSubview:v6->_progressView];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28DC8], "safari_constraintsMatchingFrameOfView:withFrameOfView:", v6->_progressView, v6);
    progressViewConstraints = v6->_progressViewConstraints;
    v6->_progressViewConstraints = (NSArray *)v11;

    [MEMORY[0x1E4F28DC8] activateConstraints:v6->_progressViewConstraints];
    uint64_t v13 = [[SFUnifiedTabBarItemTitleContainerView alloc] initWithAlignment:1];
    titleContainer = v6->_titleContainer;
    v6->_titleContainer = v13;

    [(SFUnifiedTabBarItemTitleContainerView *)v6->_titleContainer setTitleToSearchIconSpacing:0.0];
    [(SFUnifiedTabBarItemTitleContainerView *)v6->_titleContainer setCollapsed:0];
    [(SFUnifiedTabBarItemTitleContainerView *)v6->_titleContainer setUsesInsetFromLayoutMargins:0];
    [(SFUnifiedTabBarItemTitleContainerView *)v6->_titleContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFUnifiedTabBarItemTitleContainerView *)v6->_titleContainer setTitleTextStyle:*MEMORY[0x1E4FB28C8]];
    [(SFUnifiedTabBarItemTitleContainerView *)v6->_titleContainer setAnimateLockViewPosition:1];
    [(SFUnifiedTabBarItemTitleContainerView *)v6->_titleContainer setAccessibilityIdentifier:@"TabBarItemTitle"];
    LODWORD(v15) = 1131413504;
    [(SFUnifiedTabBarItemTitleContainerView *)v6->_titleContainer setContentHuggingPriority:0 forAxis:v15];
    LODWORD(v16) = 1144586240;
    [(SFUnifiedTabBarItemTitleContainerView *)v6->_titleContainer setContentCompressionResistancePriority:0 forAxis:v16];
    LODWORD(v17) = 1131413504;
    [(SFUnifiedTabBarItemTitleContainerView *)v6->_titleContainer setContentHuggingPriority:1 forAxis:v17];
    LODWORD(v18) = 1144586240;
    [(SFUnifiedTabBarItemTitleContainerView *)v6->_titleContainer setContentCompressionResistancePriority:1 forAxis:v18];
    [(SFCapsuleNavigationBar *)v6 addSubview:v6->_titleContainer];
    long long v19 = [[SFCapsuleNavigationBarLabelLayoutInfo alloc] initWithView:v6->_titleContainer];
    titleLabelLayoutInfo = v6->_titleLabelLayoutInfo;
    v6->_titleLabelLayoutInfo = v19;

    long long v21 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    textVerticalAlignmentGuide = v6->_textVerticalAlignmentGuide;
    v6->_textVerticalAlignmentGuide = v21;

    [(UILayoutGuide *)v6->_textVerticalAlignmentGuide setIdentifier:@"SFCapsuleTextVerticalAlignmentGuide"];
    [(SFCapsuleNavigationBar *)v6 addLayoutGuide:v6->_textVerticalAlignmentGuide];
    v53 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [(UILayoutGuide *)v6->_textVerticalAlignmentGuide widthAnchor];
    v24 = [v23 constraintEqualToConstant:0.0];
    LODWORD(v25) = 1130758144;
    double v26 = objc_msgSend(v24, "sf_withPriority:", v25);
    v58[0] = v26;
    v27 = [(UILayoutGuide *)v6->_textVerticalAlignmentGuide heightAnchor];
    v28 = [v27 constraintEqualToConstant:0.0];
    LODWORD(v29) = 1130758144;
    char v30 = objc_msgSend(v28, "sf_withPriority:", v29);
    v58[1] = v30;
    long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
    [v53 activateConstraints:v31];

    v50 = (void *)MEMORY[0x1E4F28DC8];
    v54 = [(SFUnifiedTabBarItemTitleContainerView *)v6->_titleContainer leadingAnchor];
    v52 = [(UILayoutGuide *)v6->_textVerticalAlignmentGuide leadingAnchor];
    v51 = [v54 constraintGreaterThanOrEqualToAnchor:v52];
    v57[0] = v51;
    long long v32 = [(SFUnifiedTabBarItemTitleContainerView *)v6->_titleContainer trailingAnchor];
    long long v33 = [(UILayoutGuide *)v6->_textVerticalAlignmentGuide trailingAnchor];
    long long v34 = [v32 constraintLessThanOrEqualToAnchor:v33];
    v57[1] = v34;
    long long v35 = [(UILayoutGuide *)v6->_textVerticalAlignmentGuide centerXAnchor];
    long long v36 = [(SFCapsuleNavigationBar *)v6 centerXAnchor];
    long long v37 = [v35 constraintEqualToAnchor:v36];
    LODWORD(v38) = 1132134400;
    v39 = objc_msgSend(v37, "sf_withPriority:", v38);
    v57[2] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:3];
    [v50 activateConstraints:v40];

    uint64_t v41 = (PKScribbleInteraction *)objc_alloc_init(MEMORY[0x1E4F38E40]);
    scribbleInteraction = v6->_scribbleInteraction;
    v6->_scribbleInteraction = v41;

    [(PKScribbleInteraction *)v6->_scribbleInteraction setDelegate:v6];
    [(SFCapsuleNavigationBar *)v6 addInteraction:v6->_scribbleInteraction];
    v6->_nonKeyContentAlpha = 1.0;
    v43 = [MEMORY[0x1E4F1CA48] array];
    [(SFCapsuleNavigationBar *)v6 _initializeLayoutInfo:v6->_titleLabelLayoutInfo forPrimaryLabel:1 addingConstraints:v43];
    [MEMORY[0x1E4F28DC8] activateConstraints:v43];
    uint64_t v44 = [objc_alloc(MEMORY[0x1E4F98A60]) initWithPresenter:v6];
    availabilityDisplayController = v6->_availabilityDisplayController;
    v6->_availabilityDisplayController = (WBSContentAvailabilityDisplayController *)v44;

    uint64_t v56 = objc_opt_class();
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
    id v47 = (id)[(SFCapsuleNavigationBar *)v6 registerForTraitChanges:v46 withTarget:v6 action:sel__invalidateHeight];

    v48 = v6;
  }

  return v6;
}

- (void)_updateSecurityAnnotation
{
  v3 = [(SFCapsuleNavigationBar *)self _labelTextStyle];
  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setTitleTextStyle:v3];

  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setHasFocusedSensitiveInputField:[(SFNavigationBarItem *)self->_item hasFocusedSensitiveFieldOnCurrentPage]];
  int64_t v4 = [(SFNavigationBarItem *)self->_item securityAnnotation];
  titleContainer = self->_titleContainer;

  [(SFUnifiedTabBarItemTitleContainerView *)titleContainer setSecurityAnnotation:v4];
}

- (id)_labelTextStyle
{
  if (self->_isMinimized) {
    v2 = (id *)MEMORY[0x1E4FB28D8];
  }
  else {
    v2 = (id *)MEMORY[0x1E4FB28C8];
  }
  return *v2;
}

- (UIView)unclippedContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unclippedContainer);

  return (UIView *)WeakRetained;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

void __58__SFCapsuleNavigationBar__createTrailingButtonConstraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v24 = v5;
  uint64_t v7 = [v5 centerYAnchor];
  uint64_t v8 = [*(id *)(a1 + 40) centerYAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];
  [v6 addObject:v9];

  if (!*(unsigned char *)(a1 + 72))
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v24 topAnchor];
    uint64_t v12 = [*(id *)(a1 + 40) topAnchor];
    uint64_t v13 = [v11 constraintGreaterThanOrEqualToAnchor:v12 constant:*(double *)(a1 + 56)];
    [v10 addObject:v13];

    uint64_t v14 = *(void **)(a1 + 32);
    double v15 = [v24 bottomAnchor];
    double v16 = [*(id *)(a1 + 40) bottomAnchor];
    double v17 = [v15 constraintLessThanOrEqualToAnchor:v16 constant:-*(double *)(a1 + 56)];
    [v14 addObject:v17];
  }
  double v18 = v24;
  if (a3)
  {
    long long v19 = *(void **)(a1 + 32);
    long long v20 = [*(id *)(*(void *)(a1 + 40) + 688) objectAtIndexedSubscript:a3 - 1];
    long long v21 = [v20 leadingAnchor];
    long long v22 = [v24 trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:*(double *)(a1 + 64)];
    [v19 addObject:v23];

    double v18 = v24;
  }
}

- (void)_initializeLayoutInfo:(id)a3 forPrimaryLabel:(BOOL)a4 addingConstraints:(id)a5
{
  id v29 = a3;
  id v8 = a5;
  if (!a4)
  {
    uint64_t v9 = [v29 view];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setAdjustsFontForContentSizeCategory:1];
    [v9 setAccessibilityIdentifier:@"TabBarItemSubtitle"];
    [v9 setFadeOutEdge:1];
    LODWORD(v10) = 1131413504;
    [v9 setContentHuggingPriority:0 forAxis:v10];
    LODWORD(v11) = 1144586240;
    [v9 setContentCompressionResistancePriority:0 forAxis:v11];
    [(SFCapsuleNavigationBar *)self addSubview:v9];
  }
  uint64_t v12 = [v29 view];
  uint64_t v13 = [v12 topAnchor];
  uint64_t v14 = [(UILayoutGuide *)self->_textVerticalAlignmentGuide topAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  [v8 addObject:v15];

  double v16 = [v12 bottomAnchor];
  double v17 = [(UILayoutGuide *)self->_textVerticalAlignmentGuide bottomAnchor];
  double v18 = [v16 constraintEqualToAnchor:v17];
  [v8 addObject:v18];

  long long v19 = [(SFCapsuleNavigationBar *)self _horizontalAlignmentConstraintForLabel:v12];
  [v29 setConstraintForHorizontalAlignment:v19];

  long long v20 = [v29 constraintForHorizontalAlignment];
  [v8 addObject:v20];

  if ([(NSArray *)self->_leadingButtons count])
  {
    long long v21 = [v12 leadingAnchor];
    long long v22 = [(NSArray *)self->_leadingButtons lastObject];
    v23 = [v22 trailingAnchor];
    id v24 = [v21 constraintGreaterThanOrEqualToAnchor:v23];
    [v8 addObject:v24];
  }
  if ([(NSArray *)self->_trailingButtons count])
  {
    double v25 = [v12 trailingAnchor];
    double v26 = [(NSArray *)self->_trailingButtons firstObject];
    v27 = [v26 leadingAnchor];
    v28 = [v25 constraintLessThanOrEqualToAnchor:v27];
    [v8 addObject:v28];
  }
}

- (void)updateConstraints
{
  v27.receiver = self;
  v27.super_class = (Class)SFCapsuleNavigationBar;
  [(SFCapsuleNavigationBar *)&v27 updateConstraints];
  v3 = [(SFCapsuleNavigationBar *)self layoutMarginsGuide];
  if (!self->_leadingButtonConstraints) {
    [(SFCapsuleNavigationBar *)self _createLeadingButtonConstraints];
  }
  if (!self->_trailingButtonConstraints) {
    [(SFCapsuleNavigationBar *)self _createTrailingButtonConstraints];
  }
  if (!self->_textVerticalAlignmentConstraints)
  {
    [(SFCapsuleNavigationBar *)self _titleToEdgeMargin];
    double v5 = v4;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = [(UILayoutGuide *)self->_textVerticalAlignmentGuide centerYAnchor];
    id v8 = [v3 centerYAnchor];
    uint64_t v9 = [v7 constraintEqualToAnchor:v8];
    [v6 addObject:v9];

    BOOL v10 = [(SFCapsuleNavigationBar *)self _shouldCenterLabels];
    textVerticalAlignmentGuide = self->_textVerticalAlignmentGuide;
    if (v10)
    {
      uint64_t v12 = [(UILayoutGuide *)textVerticalAlignmentGuide centerXAnchor];
      [(SFCapsuleNavigationBar *)self centerXAnchor];
    }
    else
    {
      uint64_t v12 = [(UILayoutGuide *)textVerticalAlignmentGuide leadingAnchor];
      [(SFCapsuleNavigationBar *)self leadingAnchor];
    uint64_t v13 = };
    uint64_t v14 = [v12 constraintEqualToAnchor:v13];
    LODWORD(v15) = 1112276992;
    double v16 = objc_msgSend(v14, "sf_withPriority:", v15);
    [v6 addObject:v16];

    double v17 = [(UILayoutGuide *)self->_textVerticalAlignmentGuide topAnchor];
    double v18 = [(SFCapsuleNavigationBar *)self topAnchor];
    long long v19 = [v17 constraintGreaterThanOrEqualToAnchor:v18 constant:v5];
    [v6 addObject:v19];

    long long v20 = [(UILayoutGuide *)self->_textVerticalAlignmentGuide bottomAnchor];
    long long v21 = [(SFCapsuleNavigationBar *)self bottomAnchor];
    long long v22 = [v20 constraintLessThanOrEqualToAnchor:v21 constant:-v5];
    [v6 addObject:v22];

    v23 = (NSArray *)[v6 copy];
    textVerticalAlignmentConstraints = self->_textVerticalAlignmentConstraints;
    self->_textVerticalAlignmentConstraints = v23;

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_textVerticalAlignmentConstraints];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__SFCapsuleNavigationBar_updateConstraints__block_invoke;
  aBlock[3] = &unk_1E54E99C0;
  aBlock[4] = self;
  double v25 = (void (**)(void *, SFCapsuleNavigationBarLabelLayoutInfo *))_Block_copy(aBlock);
  v25[2](v25, self->_titleLabelLayoutInfo);
  if (self->_availabilityLabelLayoutInfo) {
    ((void (*)(void (**)(void *, SFCapsuleNavigationBarLabelLayoutInfo *)))v25[2])(v25);
  }
  [(SFCapsuleNavigationBar *)self updateAccessibilityIdentifier];
}

- (CGPoint)_titleToEdgeMargin
{
  v3 = [(SFCapsuleNavigationBar *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];

  double v5 = 8.0;
  double v6 = 12.0;
  if (UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E4FB27B0]) == NSOrderedAscending)
  {
    int64_t layoutStyle = self->_layoutStyle;
    double v6 = 18.0;
    if (layoutStyle != 2)
    {
      if (layoutStyle == 1) {
        double v5 = 4.0;
      }
      else {
        double v5 = 10.0;
      }
    }
  }

  double v7 = v6;
  double v8 = v5;
  result.y = v8;
  result.x = v7;
  return result;
}

void __43__SFCapsuleNavigationBar_updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 constraintForHorizontalAlignment];

  if (!v3)
  {
    double v4 = *(void **)(a1 + 32);
    double v5 = [v8 view];
    double v6 = [v4 _horizontalAlignmentConstraintForLabel:v5];
    [v8 setConstraintForHorizontalAlignment:v6];

    double v7 = [v8 constraintForHorizontalAlignment];
    [v7 setActive:1];
  }
}

- (void)updateAccessibilityIdentifier
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL isSelected = self->_isSelected;
  double v7 = @"isSelected";
  if (isSelected) {
    double v4 = @"true";
  }
  else {
    double v4 = @"false";
  }
  v8[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  double v6 = WBSMakeAccessibilityIdentifier();
  [(SFCapsuleNavigationBar *)self setAccessibilityIdentifier:v6];
}

void __57__SFCapsuleNavigationBar__createLeadingButtonConstraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = *(void **)(a1 + 32);
  id v23 = v5;
  double v7 = [v5 centerYAnchor];
  id v8 = [*(id *)(a1 + 40) centerYAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];
  [v6 addObject:v9];

  if (!*(unsigned char *)(a1 + 72))
  {
    if (!a3 && *(unsigned char *)(a1 + 73)) {
      goto LABEL_8;
    }
    BOOL v10 = *(void **)(a1 + 32);
    double v11 = [v23 topAnchor];
    uint64_t v12 = [*(id *)(a1 + 40) topAnchor];
    uint64_t v13 = [v11 constraintGreaterThanOrEqualToAnchor:v12 constant:*(double *)(a1 + 56)];
    [v10 addObject:v13];

    uint64_t v14 = *(void **)(a1 + 32);
    double v15 = [v23 bottomAnchor];
    double v16 = [*(id *)(a1 + 40) bottomAnchor];
    double v17 = [v15 constraintLessThanOrEqualToAnchor:v16 constant:-*(double *)(a1 + 56)];
    [v14 addObject:v17];

    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    double v18 = *(void **)(a1 + 32);
    long long v19 = [v23 leadingAnchor];
    long long v20 = [*(id *)(*(void *)(a1 + 40) + 480) objectAtIndexedSubscript:a3 - 1];
    long long v21 = [v20 trailingAnchor];
    long long v22 = [v19 constraintEqualToAnchor:v21 constant:*(double *)(a1 + 64)];
    [v18 addObject:v22];
  }
LABEL_8:
}

- (void)_createTrailingButtonConstraints
{
  BOOL v3 = [(SFCapsuleNavigationBar *)self _shouldHideButtons];
  double v4 = [MEMORY[0x1E4F1CA48] array];
  if (v3 || ![(NSArray *)self->_trailingButtons count])
  {
    id v5 = [(SFCapsuleNavigationBar *)self trailingAnchor];
    double v6 = [(UILayoutGuide *)self->_textVerticalAlignmentGuide trailingAnchor];
    [(SFCapsuleNavigationBar *)self _titleToEdgeMargin];
    double v7 = objc_msgSend(v5, "constraintGreaterThanOrEqualToAnchor:constant:", v6);
    [v4 addObject:v7];
  }
  if ([(NSArray *)self->_trailingButtons count])
  {
    [(SFCapsuleNavigationBar *)self _minimumEdgeMargin];
    double v9 = v8;
    uint64_t v11 = v10;
    [(SFCapsuleNavigationBar *)self _interButtonSpacing];
    double v13 = 0.7;
    if (!self->_isMinimized) {
      double v13 = 1.0;
    }
    double v14 = v12 * v13;
    trailingButtons = self->_trailingButtons;
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = __58__SFCapsuleNavigationBar__createTrailingButtonConstraints__block_invoke;
    v43 = &unk_1E54E9A10;
    id v16 = v4;
    id v44 = v16;
    v45 = self;
    BOOL v49 = v3;
    double v46 = v9;
    uint64_t v47 = v11;
    double v48 = v14;
    [(NSArray *)trailingButtons enumerateObjectsUsingBlock:&v40];
    double v17 = [(NSArray *)self->_trailingButtons firstObject];
    double v18 = [v17 trailingAnchor];
    long long v19 = [(SFCapsuleNavigationBar *)self trailingAnchor];
    long long v20 = [v18 constraintLessThanOrEqualToAnchor:v19 constant:-v9];
    [v16 addObject:v20];

    long long v21 = [(SFCapsuleNavigationBar *)self trailingAnchor];
    long long v22 = [v17 centerXAnchor];
    double v23 = 18.0;
    if (self->_layoutStyle == 1) {
      double v23 = 22.0;
    }
    id v24 = [v21 constraintEqualToAnchor:v22 constant:v23];
    LODWORD(v25) = 1131413504;
    double v26 = objc_msgSend(v24, "sf_withPriority:", v25);
    [v16 addObject:v26];

    if (!v3)
    {
      objc_super v27 = [(UILayoutGuide *)self->_textVerticalAlignmentGuide trailingAnchor];
      v28 = [(NSArray *)self->_trailingButtons lastObject];
      if ([(SFCapsuleNavigationBar *)self _shouldCenterButtonsBetweenEdgeAndTitle:self->_trailingButtons])
      {
        id v29 = [v28 centerXAnchor];
        char v30 = [v29 constraintGreaterThanOrEqualToAnchor:v27];
        LODWORD(v31) = 1131413504;
        long long v32 = objc_msgSend(v30, "sf_withPriority:", v31);
        [v16 addObject:v32];

        long long v33 = [v28 leadingAnchor];
        long long v34 = v33;
        long long v35 = v27;
        double v36 = v9;
      }
      else
      {
        long long v34 = [v28 leadingAnchor];
        [(SFCapsuleNavigationBar *)self _titleToButtonSpacing];
        long long v33 = v34;
        long long v35 = v27;
      }
      long long v37 = [v33 constraintGreaterThanOrEqualToAnchor:v35 constant:v36];
      [v16 addObject:v37];
    }
  }
  double v38 = (NSArray *)[v4 copy];
  trailingButtonConstraints = self->_trailingButtonConstraints;
  self->_trailingButtonConstraints = v38;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_trailingButtonConstraints];
}

- (BOOL)_shouldHideButtons
{
  return [(SFCapsuleNavigationBar *)self _shouldHideButtonsForMinimized:self->_isMinimized];
}

- (void)_createLeadingButtonConstraints
{
  BOOL v3 = [(SFCapsuleNavigationBar *)self _shouldHideButtons];
  double v4 = [MEMORY[0x1E4F1CA48] array];
  if (v3 || ![(NSArray *)self->_leadingButtons count])
  {
    id v5 = [(UILayoutGuide *)self->_textVerticalAlignmentGuide leadingAnchor];
    double v6 = [(SFCapsuleNavigationBar *)self leadingAnchor];
    [(SFCapsuleNavigationBar *)self _titleToEdgeMargin];
    double v7 = objc_msgSend(v5, "constraintGreaterThanOrEqualToAnchor:constant:", v6);
    [v4 addObject:v7];
  }
  if ([(NSArray *)self->_leadingButtons count])
  {
    [(SFCapsuleNavigationBar *)self _minimumEdgeMargin];
    double v9 = v8;
    uint64_t v11 = v10;
    [(SFCapsuleNavigationBar *)self _interButtonSpacing];
    double v13 = 0.7;
    if (!self->_isMinimized) {
      double v13 = 1.0;
    }
    double v14 = v12 * v13;
    double v15 = [(NSArray *)self->_leadingButtons firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    leadingButtons = self->_leadingButtons;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __57__SFCapsuleNavigationBar__createLeadingButtonConstraints__block_invoke;
    v43[3] = &unk_1E54E99E8;
    id v18 = v4;
    id v44 = v18;
    v45 = self;
    BOOL v42 = v3;
    BOOL v49 = v3;
    char v50 = isKindOfClass & 1;
    double v46 = v9;
    uint64_t v47 = v11;
    double v48 = v14;
    [(NSArray *)leadingButtons enumerateObjectsUsingBlock:v43];
    long long v19 = [v15 centerXAnchor];
    long long v20 = [(SFCapsuleNavigationBar *)self leadingAnchor];
    double v21 = 0.0;
    double v22 = 0.0;
    if ((isKindOfClass & 1) == 0)
    {
      double v22 = 18.0;
      if (self->_layoutStyle == 1) {
        double v22 = 22.0;
      }
      double v21 = v9;
    }
    double v23 = [v19 constraintEqualToAnchor:v20 constant:v22];
    LODWORD(v24) = 1131413504;
    double v25 = objc_msgSend(v23, "sf_withPriority:", v24);
    [v18 addObject:v25];

    double v26 = [v15 leadingAnchor];
    objc_super v27 = [(SFCapsuleNavigationBar *)self leadingAnchor];
    v28 = [v26 constraintGreaterThanOrEqualToAnchor:v27 constant:v21];
    [v18 addObject:v28];

    if (isKindOfClass)
    {
      id v29 = [v15 topAnchor];
      char v30 = [(SFCapsuleNavigationBar *)self topAnchor];
      double v31 = [v29 constraintEqualToAnchor:v30];
      [v18 addObject:v31];

      long long v32 = [v15 bottomAnchor];
      long long v33 = [(SFCapsuleNavigationBar *)self bottomAnchor];
      long long v34 = [v32 constraintEqualToAnchor:v33];
      [v18 addObject:v34];
    }
    if (!v42)
    {
      long long v35 = [(NSArray *)self->_leadingButtons lastObject];
      double v36 = [(UILayoutGuide *)self->_textVerticalAlignmentGuide leadingAnchor];
      long long v37 = [v35 trailingAnchor];
      double v38 = 2.0;
      if ((isKindOfClass & 1) == 0) {
        double v38 = v9;
      }
      v39 = [v36 constraintGreaterThanOrEqualToAnchor:v37 constant:v38];
      [v18 addObject:v39];
    }
  }
  uint64_t v40 = (NSArray *)[v4 copy];
  leadingButtonConstraints = self->_leadingButtonConstraints;
  self->_leadingButtonConstraints = v40;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_leadingButtonConstraints];
}

- (CGPoint)_minimumEdgeMargin
{
  int64_t layoutStyle = self->_layoutStyle;
  double v3 = 13.0;
  if (layoutStyle == 2) {
    double v4 = 9.0;
  }
  else {
    double v4 = 13.0;
  }
  if (layoutStyle == 2) {
    double v5 = 5.0;
  }
  else {
    double v5 = 11.5;
  }
  double v6 = [(SFCapsuleNavigationBar *)self traitCollection];
  double v7 = [v6 preferredContentSizeCategory];

  if (UIContentSizeCategoryCompareToCategory(v7, (UIContentSizeCategory)*MEMORY[0x1E4FB27B0]) == NSOrderedAscending) {
    double v3 = v5;
  }
  else {
    double v4 = 12.0;
  }

  double v8 = v4;
  double v9 = v3;
  result.y = v9;
  result.x = v8;
  return result;
}

- (double)_interButtonSpacing
{
  v2 = [(SFCapsuleNavigationBar *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];

  if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB27B0]) == NSOrderedAscending) {
    double v4 = 24.0;
  }
  else {
    double v4 = 22.0;
  }

  return v4;
}

- (void)navigationBarItemDidUpdateShowsExtensionsAvailability:(id)a3
{
  id v4 = a3;
  [(SFCapsuleNavigationBar *)self _updateLabelTypesAnimated:1];
  [(SFCapsuleNavigationBar *)self _updatePageFormatButtonForNavigationBarItem:v4 shouldResetDiscovery:0];
}

- (void)prepareForSizingNavigationBar:(id)a3
{
  id v4 = [a3 item];
  [(SFCapsuleNavigationBar *)self setItem:v4];

  [(SFCapsuleNavigationBar *)self _updateLabelTypesAnimated:0];
}

- (SFNavigationBarItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  double v5 = (SFNavigationBarItem *)a3;
  p_item = &self->_item;
  item = self->_item;
  id v16 = v5;
  if (item != v5)
  {
    [(SFNavigationBarItem *)item removeObserver:self];
    double v8 = [(SFNavigationBarItem *)*p_item fluidProgressController];
    [v8 unregisterObserver:self->_progressView];

    objc_storeStrong((id *)&self->_item, a3);
    [(SFNavigationBarItem *)*p_item addObserver:self];
    progressView = self->_progressView;
    uint64_t v10 = [(SFNavigationBarItem *)*p_item fluidProgressStateSource];
    uint64_t v11 = [v10 progressState];
    [(_SFFluidProgressView *)progressView setProgressToCurrentPositionForState:v11];

    double v12 = [(SFNavigationBarItem *)*p_item fluidProgressController];
    [v12 registerObserver:self->_progressView];

    double v13 = [(SFNavigationBarItem *)v16 text];
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setTitle:v13];

    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setShowsSearchIcon:[(SFCapsuleNavigationBar *)self _showsSearchIconInTitleContainer]];
    [(SFCapsuleNavigationBar *)self setLeadingButtons:self->_externalLeadingButtons];
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setShowsLockIcon:[(SFNavigationBarItem *)v16 showsLockIcon]];
    [(SFCapsuleNavigationBar *)self _updateSecurityAnnotation];
    [(WBSContentAvailabilityDisplayController *)self->_availabilityDisplayController resetDisplay];
    [(SFCapsuleNavigationBar *)self _updateLabelTypesAnimated:0];
    [(SFCapsuleNavigationBar *)self _updatePageFormatButtonForNavigationBarItem:v16 shouldResetDiscovery:0];
    [(SFCapsuleNavigationBar *)self _updateTitleContainerAlpha];
    [(SFCapsuleNavigationBar *)self _updateShowsProgressView];
    [(_SFBarRegistrationToken *)self->_registration updateBarAnimated:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sizeUpdater);
    [WeakRetained invalidateHeightForCapsuleContentView:self];

    [(SFCapsuleNavigationBar *)self navigationBarItemDidUpdateShowsExtensionsAvailability:v16];
    double v15 = [(SFNavigationBarItem *)*p_item overlayNarrowConfiguration];

    if (v15) {
      [(SFCapsuleNavigationBar *)self navigationBarItemDidUpdateOverlayNarrowConfiguration:*p_item];
    }
  }
}

- (void)setTrailingButtons:(id)a3
{
  id v7 = a3;
  if (-[SFCapsuleNavigationBar _transitionFromButtons:toButtons:withConstraintsToDeactivate:](self, "_transitionFromButtons:toButtons:withConstraintsToDeactivate:", self->_trailingButtons))
  {
    id v4 = (NSArray *)[v7 copy];
    trailingButtons = self->_trailingButtons;
    self->_trailingButtons = v4;

    trailingButtonConstraints = self->_trailingButtonConstraints;
    self->_trailingButtonConstraints = 0;

    [(SFCapsuleNavigationBar *)self _updateButtonsTransform];
  }
}

- (void)setLeadingButtons:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1E4F1CBF0];
  id v21 = v4;
  if (v4) {
    double v5 = v4;
  }
  double v6 = v5;
  if (-[SFNavigationBarItem showsSearchIndicator](self->_item, "showsSearchIndicator") && ![v21 count])
  {
    searchIndicatorView = self->_searchIndicatorView;
    if (!searchIndicatorView)
    {
      double v12 = (void *)MEMORY[0x1E4FB1830];
      double v13 = [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer titleTextStyle];
      double v14 = [v12 configurationWithTextStyle:v13 scale:2];

      double v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"magnifyingglass" withConfiguration:v14];
      id v16 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v15];
      double v17 = self->_searchIndicatorView;
      self->_searchIndicatorView = v16;

      id v18 = [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer theme];
      long long v19 = [v18 placeholderTextColor];
      [(UIView *)self->_searchIndicatorView setTintColor:v19];

      searchIndicatorView = self->_searchIndicatorView;
    }
    uint64_t v20 = [(UIView *)v6 arrayByAddingObject:searchIndicatorView];
    id v7 = v6;
    double v6 = (UIView *)v20;
  }
  else
  {
    id v7 = self->_searchIndicatorView;
    self->_searchIndicatorView = 0;
  }

  if ([(SFCapsuleNavigationBar *)self _transitionFromButtons:self->_leadingButtons toButtons:v6 withConstraintsToDeactivate:self->_leadingButtonConstraints])
  {
    double v8 = (NSArray *)[v21 copy];
    externalLeadingButtons = self->_externalLeadingButtons;
    self->_externalLeadingButtons = v8;

    objc_storeStrong((id *)&self->_leadingButtons, v6);
    leadingButtonConstraints = self->_leadingButtonConstraints;
    self->_leadingButtonConstraints = 0;

    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setShowsSearchIcon:[(SFCapsuleNavigationBar *)self _showsSearchIconInTitleContainer]];
    [(SFCapsuleNavigationBar *)self _updateButtonsTransform];
  }
}

- (BOOL)_showsSearchIconInTitleContainer
{
  NSUInteger v3 = [(NSArray *)self->_externalLeadingButtons count];
  if (v3)
  {
    item = self->_item;
    LOBYTE(v3) = [(SFNavigationBarItem *)item showsSearchIndicator];
  }
  return v3;
}

- (void)_updateButtonsTransform
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  memset(&v26, 0, sizeof(v26));
  if (self->_isMinimized)
  {
    CGAffineTransformMakeScale(&v26, 0.7, 0.7);
  }
  else
  {
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v26.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v26.c = v3;
    *(_OWORD *)&v26.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = self->_leadingButtons;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
        CGAffineTransform v21 = v26;
        [v9 setTransform:&v21];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v6);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_trailingButtons;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
        CGAffineTransform v16 = v26;
        [v15 setTransform:&v16];
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v12);
  }
}

- (void)_updatePageFormatButtonForNavigationBarItem:(id)a3 shouldResetDiscovery:(BOOL)a4
{
  BOOL v4 = a4;
  id v30 = a3;
  uint64_t v6 = [(_SFBarRegistrationToken *)self->_registration pageFormatItemState];
  unint64_t v7 = v6;
  if (v4)
  {
    unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFEFLL;
  }
  else if (!v30)
  {
    unint64_t v13 = v6 | 0x10;
    goto LABEL_40;
  }
  unint64_t v8 = [(_SFBarTheme *)self->_theme tintStyle];
  if (v8 && (unint64_t v9 = v8, _SFIsPrivateTintStyle(v8)))
  {
    int v10 = _SFIsDarkTintStyle(v9);
    uint64_t v11 = 1024;
    if (v10) {
      uint64_t v11 = 0;
    }
    uint64_t v25 = v11;
  }
  else
  {
    uint64_t v25 = 0;
  }
  uint64_t v12 = v30;
  if ((v7 & 0x10) != 0)
  {
    unint64_t v27 = 0;
    uint64_t v28 = 0;
  }
  else
  {
    if ([(WBSContentAvailabilityDisplayController *)self->_availabilityDisplayController isDisplaying])
    {
      if (([(WBSContentAvailabilityDisplayController *)self->_availabilityDisplayController currentOptions] & 0x20) != 0)
      {
        unint64_t v27 = 0;
        uint64_t v28 = 1;
      }
      else
      {
        unint64_t v27 = ((unint64_t)[(WBSContentAvailabilityDisplayController *)self->_availabilityDisplayController currentOptions] >> 4) & 4;
        uint64_t v28 = 0;
      }
    }
    else
    {
      unint64_t v27 = 0;
      uint64_t v28 = 0;
    }
    uint64_t v12 = v30;
  }
  unint64_t v29 = v7 & 0xFFFFFFFFFFFF8090;
  if (objc_msgSend(v12, "showsSiriReaderPlayingIcon", v25)) {
    uint64_t v14 = 2048;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = ([v30 contentOptions] & 0x1F) != 0;
  char v16 = [v30 contentOptions];
  if ([v30 readerButtonSelected]) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 0;
  }
  if ([v30 showsTranslationIcon]) {
    uint64_t v18 = 8;
  }
  else {
    uint64_t v18 = 0;
  }
  if ([v30 menuButtonSelected]) {
    uint64_t v19 = 32;
  }
  else {
    uint64_t v19 = 0;
  }
  if ([v30 extensionsAreActive]) {
    uint64_t v20 = 256;
  }
  else {
    uint64_t v20 = 0;
  }
  if ([v30 needsExtensionBadge]) {
    uint64_t v21 = 512;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = [v30 mediaStateIcon] != 0;
  int v23 = [v30 hasHiddenElements];
  uint64_t v24 = 0x4000;
  if (!v23) {
    uint64_t v24 = 0;
  }
  unint64_t v13 = (v26 | v28 | v27 | v14 | v29) & 0xFFFFFFFFFFFFEFFFLL | (v15 << 13) | ((unint64_t)(v16 & 1) << 12) | v17 | v18 | v19 | v20 | v21 | (v22 << 6) | v24;
LABEL_40:
  [(_SFBarRegistrationToken *)self->_registration setPageFormatItemState:v13];
}

- (void)_updateLabelTypesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizeUpdater);
  uint64_t v6 = WeakRetained;
  BOOL v7 = 0;
  if (v3 && WeakRetained) {
    BOOL v7 = !self->_isForSizing;
  }
  unint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v9 = self->_availabilityLabelLayoutInfo;
  if ([(WBSContentAvailabilityDisplayController *)self->_availabilityDisplayController isDisplaying])
  {
    int v10 = objc_alloc_init(SFURLLabel);
    uint64_t v11 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v12 = [(SFCapsuleNavigationBar *)self _labelTextStyle];
    unint64_t v13 = [v11 preferredFontForTextStyle:v12];
    [(SFURLLabel *)v10 setFont:v13];

    uint64_t v14 = [(WBSContentAvailabilityDisplayController *)self->_availabilityDisplayController currentLabel];
    [(SFURLLabel *)v10 setText:v14];

    uint64_t v15 = [MEMORY[0x1E4FB1618] labelColor];
    [(SFURLLabel *)v10 setTextColor:v15];

    char v16 = [[SFCapsuleNavigationBarLabelLayoutInfo alloc] initWithView:v10];
    [(SFCapsuleNavigationBar *)self _initializeLayoutInfo:v16 forPrimaryLabel:0 addingConstraints:v8];
  }
  else
  {
    char v16 = 0;
  }
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_availabilityLabelLayoutInfo, v16);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke;
    aBlock[3] = &unk_1E54E9A60;
    aBlock[4] = self;
    uint64_t v17 = v16;
    id v44 = v17;
    uint64_t v18 = _Block_copy(aBlock);
    char v19 = !v7;
    if (!v17) {
      char v19 = 1;
    }
    if ((v19 & 1) == 0)
    {
      [MEMORY[0x1E4F28DC8] activateConstraints:v8];
      [v8 removeAllObjects];
      [(SFCapsuleNavigationBar *)self _updateLabelContentsAtIndexes:0];
      uint64_t v20 = (void *)MEMORY[0x1E4FB1EB0];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke_2;
      v40[3] = &unk_1E54E9A88;
      v40[4] = self;
      uint64_t v41 = v17;
      id v42 = v18;
      [v20 performWithoutAnimation:v40];
    }
    unint64_t v29 = v18;
    uint64_t v21 = [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer titleTextStyle];
    [(SFCapsuleNavigationBar *)self _updateLabelContents];
    id v30 = (void *)v21;
    if (v7)
    {
      uint64_t v22 = [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer titleTextStyle];
      char v23 = WBSIsEqual();

      [MEMORY[0x1E4F28DC8] activateConstraints:v8];
      if ((v23 & 1) == 0)
      {
        [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer beginTitleTextStyleAnimation];
        char v24 = 1;
LABEL_17:
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke_3;
        v36[3] = &unk_1E54E9AB0;
        uint64_t v25 = v9;
        char v39 = v24;
        long long v37 = v25;
        double v38 = self;
        uint64_t v26 = _Block_copy(v36);
        unint64_t v27 = v26;
        if (v6)
        {
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke_4;
          v31[3] = &unk_1E54E9AD8;
          long long v32 = v25;
          long long v33 = v17;
          uint64_t v28 = v29;
          long long v34 = self;
          id v35 = v29;
          [v6 invalidateHeightForCapsuleContentView:self animated:v7 animations:v31 completion:v27];
        }
        else
        {
          (*((void (**)(void *))v26 + 2))(v26);
          uint64_t v28 = v29;
        }

        goto LABEL_21;
      }
    }
    else
    {
      [MEMORY[0x1E4F28DC8] activateConstraints:v8];
    }
    char v24 = 0;
    goto LABEL_17;
  }
LABEL_21:
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleNavigationBar;
  [(SFCapsuleNavigationBar *)&v3 layoutSubviews];
  if (!self->_deferButtonAlphaUpdatesDuringLayout) {
    [(SFCapsuleNavigationBar *)self _updateButtonAlphaForMinimizedPercent:self->_minimizationPercent];
  }
  [(SFCapsuleNavigationBar *)self _updateShowsProgressView];
  [(SFCapsuleNavigationBar *)self _updatePlaceholderText];
}

- (void)_updateShowsProgressView
{
  BOOL v3 = !self->_isSelected
    || ![(_SFFluidProgressView *)self->_progressView isShowingProgress]
    || self->_minimizationPercent > 0.0;
  progressView = self->_progressView;

  [(_SFFluidProgressView *)progressView setHidden:v3];
}

- (void)_updatePlaceholderText
{
  v15[1] = *MEMORY[0x1E4F143B8];
  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer bounds];
  CGFloat Width = CGRectGetWidth(v16);
  if (Width != self->_lastTitleContainerWidth)
  {
    uint64_t v5 = _WBSLocalizedString();
    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v14 = *MEMORY[0x1E4FB06F8];
    BOOL v7 = [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer placeholderFont];
    unint64_t v8 = v7;
    if (!v7)
    {
      unint64_t v9 = (void *)MEMORY[0x1E4FB08E0];
      v2 = [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer titleTextStyle];
      unint64_t v8 = [v9 preferredFontForTextStyle:v2];
    }
    v15[0] = v8;
    int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v11 = (void *)[v6 initWithString:v5 attributes:v10];

    if (!v7)
    {
    }
    objc_msgSend(v11, "boundingRectWithSize:options:context:", 1, 0, 1.79769313e308, 1.79769313e308);
    if (v12 <= Width)
    {
      [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setPlaceholder:v5];
    }
    else
    {
      unint64_t v13 = _WBSLocalizedString();
      [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setPlaceholder:v13];
    }
    self->_lastTitleContainerCGFloat Width = Width;
  }
}

- (void)_updateTitleContainerAlpha
{
  double v3 = 0.0;
  if (!self->_availabilityLabelLayoutInfo) {
    double v3 = (double)([(SFCapsuleNavigationBar *)self _hidesTitle] ^ 1);
  }
  titleContainer = self->_titleContainer;

  [(SFUnifiedTabBarItemTitleContainerView *)titleContainer setAlpha:v3];
}

- (id)_horizontalAlignmentConstraintForLabel:(id)a3
{
  id v4 = a3;
  if ([(SFCapsuleNavigationBar *)self _shouldCenterLabels])
  {
    uint64_t v5 = [v4 centerXAnchor];

    [(SFCapsuleNavigationBar *)self centerXAnchor];
  }
  else
  {
    uint64_t v5 = [v4 leadingAnchor];

    [(UILayoutGuide *)self->_textVerticalAlignmentGuide leadingAnchor];
  id v6 = };
  BOOL v7 = [v5 constraintEqualToAnchor:v6];
  LODWORD(v8) = 1112014848;
  unint64_t v9 = objc_msgSend(v7, "sf_withPriority:", v8);

  return v9;
}

- (BOOL)_shouldCenterLabels
{
  double v3 = [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer title];
  uint64_t v4 = [v3 length];

  BOOL v5 = !self->_isMinimized && v4 == 0;
  return !v5;
}

- (BOOL)_hidesTitle
{
  return self->_hidesTitle;
}

- (BOOL)_shouldCenterButtonsBetweenEdgeAndTitle:(id)a3
{
  if ((unint64_t)[a3 count] > 1) {
    return 0;
  }
  BOOL v5 = [(SFCapsuleNavigationBar *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];

  BOOL v4 = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E4FB27C0]) == NSOrderedAscending;
  return v4;
}

- (double)_titleToButtonSpacing
{
  v2 = [(SFCapsuleNavigationBar *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];

  if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB27C0]) == NSOrderedAscending) {
    double v4 = 20.0;
  }
  else {
    double v4 = 10.0;
  }

  return v4;
}

- (void)prepareForReuse
{
}

- (void)setSizeUpdater:(id)a3
{
}

- (void)setButtonPointerStyleProvider:(id)a3
{
}

- (void)setTheme:(id)a3
{
  id v8 = a3;
  BOOL v5 = self->_theme;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_theme, a3);
    if (objc_opt_respondsToSelector())
    {
      id v6 = [v8 titleTheme];
      [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setTheme:v6];
    }
    BOOL v7 = [(SFCapsuleNavigationBar *)self traitOverrides];
    objc_msgSend(v7, "setNSIntegerValue:forTrait:", objc_msgSend(v8, "tintStyle"), objc_opt_class());

    [(SFCapsuleNavigationBar *)self _updateShowsPrivateAnnotation];
    [(SFCapsuleNavigationBar *)self _updateProgressViewFillColor];
    [(SFCapsuleNavigationBar *)self _updatePageFormatButtonForNavigationBarItem:self->_item shouldResetDiscovery:0];
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_int64_t layoutStyle = a3;
    [(SFCapsuleNavigationBar *)self _invalidateHeight];
  }
}

- (void)setHighlightObserver:(id)a3
{
}

- (void)_updateShowsPrivateAnnotation
{
  if (self->_isMinimized) {
    uint64_t v3 = _SFIsPrivateTintStyle([(_SFBarTheme *)self->_theme tintStyle]);
  }
  else {
    uint64_t v3 = 0;
  }
  titleContainer = self->_titleContainer;

  [(SFUnifiedTabBarItemTitleContainerView *)titleContainer setShowsPrivateAnnotation:v3];
}

- (void)_updateProgressViewFillColor
{
  BOOL isMinimized = self->_isMinimized;
  theme = self->_theme;
  if (isMinimized) {
    [(_SFBarTheme *)theme controlsTintColor];
  }
  else {
  BOOL v5 = [(_SFBarTheme *)theme platterProgressBarTintColor];
  }
  [(_SFFluidProgressView *)self->_progressView setProgressBarFillColor:v5];

  id v6 = self->_theme;
  if (v6 && !self->_isMinimized && _SFIsPrivateTintStyle([(_SFBarTheme *)v6 tintStyle]))
  {
    id v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0C8]];
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
    id v9 = 0;
  }
  id v8 = [(_SFFluidProgressView *)self->_progressView layer];
  [v8 setCompositingFilter:v9];

  if (v7)
  {
  }
}

- (SFCapsuleNavigationBar)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = +[SFFeatureManager sharedFeatureManager];
  id v9 = -[SFCapsuleNavigationBar initWithFrame:layoutStyle:](self, "initWithFrame:layoutStyle:", [v8 preferredCapsuleLayoutStyle], x, y, width, height);

  return v9;
}

- (id)initForSizingWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = +[SFFeatureManager sharedFeatureManager];
  id v9 = -[SFCapsuleNavigationBar initForSizingWithFrame:layoutStyle:](self, "initForSizingWithFrame:layoutStyle:", [v8 preferredCapsuleLayoutStyle], x, y, width, height);

  return v9;
}

- (id)initForSizingWithFrame:(CGRect)a3 layoutStyle:(int64_t)a4
{
  double v4 = -[SFCapsuleNavigationBar initWithFrame:layoutStyle:](self, "initWithFrame:layoutStyle:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v5 = v4;
  if (v4)
  {
    v4->_isForSizing = 1;
    id v6 = v4;
  }

  return v5;
}

- (void)setIsMinimized:(BOOL)a3
{
  self->_BOOL isMinimized = a3;
}

- (PKScribbleInteraction)scribbleInteraction
{
  return self->_scribbleInteraction;
}

- (void)setDelegate:(id)a3
{
}

- (void)didCompleteBarRegistrationWithToken:(id)a3
{
}

- (SFCapsuleNavigationBar)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFCapsuleNavigationBar;
  return [(SFCapsuleNavigationBar *)&v4 initWithCoder:a3];
}

- (void)willChangeToMinimized:(BOOL)a3 coordinator:(id)a4
{
  if (a3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 0.67;
  }
  self->_deferButtonAlphaUpdatesDuringLayout = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__SFCapsuleNavigationBar_willChangeToMinimized_coordinator___block_invoke;
  v11[3] = &unk_1E54E9A38;
  v11[4] = self;
  BOOL v12 = a3;
  id v6 = a4;
  [v6 addKeyframeWithRelativeStartTime:v11 relativeDuration:v5 animations:0.33];
  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer beginTitleTextStyleAnimation];
  int v7 = [(SFCapsuleNavigationBarLabelLayoutInfo *)self->_availabilityLabelLayoutInfo view];
  [v7 beginTextSizeAnimation];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SFCapsuleNavigationBar_willChangeToMinimized_coordinator___block_invoke_2;
  v9[3] = &unk_1E54E9A60;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [v6 addCompletion:v9];
}

uint64_t __60__SFCapsuleNavigationBar_willChangeToMinimized_coordinator___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  uint64_t result = [*(id *)(a1 + 32) _updateButtonAlphaForMinimizedPercent:(double)*(unint64_t *)&a2];
  *(unsigned char *)(*(void *)(a1 + 32) + 561) = 0;
  return result;
}

uint64_t __60__SFCapsuleNavigationBar_willChangeToMinimized_coordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) endTitleTextStyleAnimation];
  v2 = *(void **)(a1 + 40);

  return [v2 endTextSizeAnimation];
}

- (void)_invalidateHeight
{
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_leadingButtonConstraints];
  leadingButtonConstraints = self->_leadingButtonConstraints;
  self->_leadingButtonConstraints = 0;

  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_trailingButtonConstraints];
  trailingButtonConstraints = self->_trailingButtonConstraints;
  self->_trailingButtonConstraints = 0;

  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_textVerticalAlignmentConstraints];
  textVerticalAlignmentConstraints = self->_textVerticalAlignmentConstraints;
  self->_textVerticalAlignmentConstraints = 0;

  id v6 = [(SFCapsuleNavigationBarLabelLayoutInfo *)self->_titleLabelLayoutInfo constraintForHorizontalAlignment];
  [v6 setActive:0];

  [(SFCapsuleNavigationBarLabelLayoutInfo *)self->_titleLabelLayoutInfo setConstraintForHorizontalAlignment:0];
  int v7 = [(SFCapsuleNavigationBarLabelLayoutInfo *)self->_availabilityLabelLayoutInfo constraintForHorizontalAlignment];
  [v7 setActive:0];

  [(SFCapsuleNavigationBarLabelLayoutInfo *)self->_availabilityLabelLayoutInfo setConstraintForHorizontalAlignment:0];
  [(SFCapsuleNavigationBar *)self setNeedsUpdateConstraints];
  [(SFCapsuleNavigationBar *)self setNeedsLayout];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizeUpdater);
  [WeakRetained invalidateHeightForCapsuleContentView:self];

  registration = self->_registration;

  [(_SFBarRegistrationToken *)registration updateBarAnimated:0];
}

- (void)setHighlighted:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFCapsuleNavigationBar;
  [(SFCapsuleNavigationBar *)&v5 setHighlighted:a3];
  highlightObserver = (void (**)(void))self->_highlightObserver;
  if (highlightObserver) {
    highlightObserver[2]();
  }
}

- (CGRect)keyContentRect
{
  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer titleRect];
  double v4 = v3;
  double v6 = v5;
  [(UIView *)self->_titleContainer ss_untransformedFrame];
  double v8 = v4 + v7;
  double v10 = v6 + v9;
  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer urlSize];
  double v12 = v11;
  double v14 = v13;
  double v15 = v8;
  double v16 = v10;
  result.size.double height = v14;
  result.size.double width = v12;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (void)setKeyContentTransform:(CGAffineTransform *)a3
{
  p_keyContentTransform = &self->_keyContentTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_keyContentTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_keyContentTransform.a;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)&self->_keyContentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_keyContentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_keyContentTransform->tdouble x = v9;
    *(_OWORD *)&p_keyContentTransform->a = v8;
    long long v10 = *(_OWORD *)&a3->c;
    v11[0] = *(_OWORD *)&a3->a;
    v11[1] = v10;
    v11[2] = *(_OWORD *)&a3->tx;
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setTransform:v11];
  }
}

- (void)setNonKeyContentAlpha:(double)a3
{
  if (self->_nonKeyContentAlpha != a3)
  {
    self->_nonKeyContentAlpha = a3;
    [(SFCapsuleNavigationBar *)self _updateButtonAlphaForMinimizedPercent:self->_minimizationPercent];
  }
}

- (double)keyContentBaselineBottomInset
{
  titleContainer = self->_titleContainer;
  [(SFUnifiedTabBarItemTitleContainerView *)titleContainer urlSize];

  [(SFUnifiedTabBarItemTitleContainerView *)titleContainer urlBaselineToBottomBoundsDistanceForHeight:v3];
  return result;
}

- (double)keyContentCapHeightTopInset
{
  titleContainer = self->_titleContainer;
  [(SFUnifiedTabBarItemTitleContainerView *)titleContainer urlSize];

  [(SFUnifiedTabBarItemTitleContainerView *)titleContainer urlCapHeightToTopBoundsDistanceForHeight:v3];
  return result;
}

- (NSNumber)microphoneContentOriginX
{
  double v3 = [(_SFBarRegistrationToken *)self->_registration microphoneButton];
  double v4 = [v3 imageView];

  if ([v4 isDescendantOfView:self])
  {
    double v5 = NSNumber;
    [v4 frame];
    -[SFCapsuleNavigationBar convertRect:fromView:](self, "convertRect:fromView:", v4);
    long long v6 = [v5 numberWithDouble:CGRectGetMinX(v9)];
  }
  else
  {
    long long v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setMicrophoneContentTransform:(CGAffineTransform *)a3
{
  p_microphoneContentTransform = &self->_microphoneContentTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_microphoneContentTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_microphoneContentTransform.a;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)&self->_microphoneContentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_microphoneContentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_microphoneContentTransform->tdouble x = v9;
    *(_OWORD *)&p_microphoneContentTransform->a = v8;
    long long v10 = *(_OWORD *)&a3->c;
    long long v13 = *(_OWORD *)&a3->a;
    long long v14 = v10;
    long long v15 = *(_OWORD *)&a3->tx;
    double v11 = [(_SFBarRegistrationToken *)self->_registration microphoneButton];
    v12[0] = v13;
    v12[1] = v14;
    v12[2] = v15;
    [v11 setTransform:v12];
  }
}

- (CGSize)urlSize
{
  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer urlSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (NSArray)leadingButtons
{
  return self->_externalLeadingButtons;
}

uint64_t __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) _hidesTitle] ^ 1;
  if (*(void *)(a1 + 40)) {
    unsigned int v2 = 0;
  }
  double v3 = *(void **)(*(void *)(a1 + 32) + 456);

  return [v3 setAlpha:(double)v2];
}

uint64_t __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  unsigned int v2 = [*(id *)(a1 + 40) view];
  [v2 setAlpha:0.0];

  double v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

void __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke_3(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  if (*(unsigned char *)(a1 + 48))
  {
    double v3 = *(void **)(*(void *)(a1 + 40) + 456);
    [v3 endTitleTextStyleAnimation];
  }
}

uint64_t __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke_4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  double v3 = [*(id *)(a1 + 40) view];
  [v3 setAlpha:1.0];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  double v4 = *(void **)(a1 + 48);

  return [v4 layoutIfNeeded];
}

- (void)_updateLabelContents
{
}

- (BOOL)_showsReaderAvailabilityText
{
  return [(SFNavigationBarItem *)self->_item showsReaderAvailabilityTextForStyle:1];
}

- (BOOL)_showsTranslationAvailabilityText
{
  return [(SFNavigationBarItem *)self->_item showsTranslationAvailabilityTextForStyle:1];
}

- (void)_setHidesTitle:(BOOL)a3
{
  if (self->_hidesTitle != a3)
  {
    self->_hidesTitle = a3;
    [(SFCapsuleNavigationBar *)self _updateTitleContainerAlpha];
  }
}

- (void)navigationBarItemDidUpdateText:(id)a3
{
  id v4 = [a3 text];
  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setTitle:v4];
}

- (void)navigationBarItemDidUpdateShowsSearchIndicator:(id)a3
{
  BOOL v4 = [(SFCapsuleNavigationBar *)self _showsSearchIconInTitleContainer];
  titleContainer = self->_titleContainer;

  [(SFUnifiedTabBarItemTitleContainerView *)titleContainer setShowsSearchIcon:v4];
}

- (void)navigationBarItemDidUpdateShowsLockIcon:(id)a3
{
  uint64_t v4 = [a3 showsLockIcon];
  titleContainer = self->_titleContainer;

  [(SFUnifiedTabBarItemTitleContainerView *)titleContainer setShowsLockIcon:v4];
}

- (void)navigationBarItemDidUpdateSecurityAnnotation:(id)a3
{
  [(SFCapsuleNavigationBar *)self _updateLabelTypesAnimated:1];

  [(SFCapsuleNavigationBar *)self _updateSecurityAnnotation];
}

- (void)navigationBarItemDidUpdateContentOptions:(id)a3 resetDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    [(WBSContentAvailabilityDisplayController *)self->_availabilityDisplayController resetDisplay];
  }
  -[WBSContentAvailabilityDisplayController updateToContentOptions:](self->_availabilityDisplayController, "updateToContentOptions:", [v6 contentOptions]);
}

- (void)navigationBarItemDidUpdateNeedsExtensionBadge:(id)a3
{
}

- (void)navigationBarItemDidUpdateMediaStateIcon:(id)a3
{
  id v4 = a3;
  [(SFCapsuleNavigationBar *)self _updateLabelTypesAnimated:1];
  [(SFCapsuleNavigationBar *)self _updateLabelContents];
  [(SFCapsuleNavigationBar *)self _updatePageFormatButtonForNavigationBarItem:v4 shouldResetDiscovery:0];
}

- (void)navigationBarItemDidUpdateShowsStopReloadButtons:(id)a3
{
  [(SFCapsuleNavigationBar *)self setNeedsLayout];
  registration = self->_registration;

  [(_SFBarRegistrationToken *)registration updateBarAnimated:1];
}

- (void)navigationBarItemDidUpdateStopReloadButtonShowsStop:(id)a3
{
}

- (void)navigationBarItemDidUpdateFormatButtonSelected:(id)a3
{
}

- (void)navigationBarItemDidUpdateShowsTranslationIcon:(id)a3
{
}

- (void)navigationBarItemDidUpdateShowsSiriReaderPlayingIcon:(id)a3
{
}

- (void)navigationBarItemDidUpdateHasHiddenElements:(id)a3
{
}

- (void)navigationBarItemDidUpdateOverlayNarrowConfiguration:(id)a3
{
  uint64_t v4 = [a3 overlayNarrowConfiguration];
  overlayView = self->_overlayView;
  id v15 = (id)v4;
  if (v4)
  {
    if (!overlayView) {
      goto LABEL_5;
    }
    id v6 = [(SFURLFieldOverlayView *)overlayView configuration];
    long long v7 = [v6 identifier];
    long long v8 = [v15 identifier];
    int v9 = [v7 isEqualToString:v8];

    overlayView = self->_overlayView;
    if (v9)
    {
      [(SFURLFieldOverlayView *)overlayView setConfiguration:v15];
    }
    else
    {
LABEL_5:
      [(SFURLFieldOverlayView *)overlayView dismissAndRemove];
      long long v10 = [SFURLFieldOverlayView alloc];
      [(SFCapsuleNavigationBar *)self bounds];
      double v11 = -[SFURLFieldOverlayView initWithFrame:configuration:](v10, "initWithFrame:configuration:", v15);
      double v12 = self->_overlayView;
      self->_overlayView = v11;

      [(SFURLFieldOverlayView *)self->_overlayView setAutoresizingMask:18];
      [(SFURLFieldOverlayView *)self->_overlayView _setContinuousCornerRadius:12.0];
      [(SFCapsuleNavigationBar *)self addSubview:self->_overlayView];
      long long v13 = [(SFURLFieldOverlayView *)self->_overlayView layer];
      [v13 setZPosition:1.79769313e308];

      [(SFURLFieldOverlayView *)self->_overlayView present];
    }
  }
  else
  {
    [(SFURLFieldOverlayView *)overlayView dismissAndRemove];
    long long v14 = self->_overlayView;
    self->_overlayView = 0;
  }
}

- (void)navigationBarItemDidUpdateFluidProgressController:(id)a3
{
  id v4 = [a3 fluidProgressController];
  [v4 registerObserver:self->_progressView];
}

- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6 afterImageDisappearsBlock:(id)a7 afterDestinationLayerBouncesBlock:(id)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v27 = a5;
  uint64_t v17 = (void (**)(void))a7;
  uint64_t v18 = (void (**)(void))a8;
  if (a6 == 11) {
    int64_t v19 = 5;
  }
  else {
    int64_t v19 = a6;
  }
  uint64_t v20 = [(_SFBarRegistrationToken *)self->_registration viewForBarItem:v19];
  uint64_t v21 = v20;
  if (v20)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4FB1EB0];
    [v20 bounds];
    objc_msgSend(v22, "_sf_animateLinkImage:withAnimation:fromRect:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", a3, 1, v27, v21, v17, v18, x, y, width, height, v23, v24, v25, v26);
  }
  else
  {
    if (v17) {
      v17[2](v17);
    }
    if (v18) {
      v18[2](v18);
    }
  }
}

- (id)popoverSourceInfoForBarItem:(int64_t)a3
{
  return (id)[(_SFBarRegistrationToken *)self->_registration popoverSourceInfoForItem:a3];
}

- (UITextField)textField
{
  return 0;
}

- (NSArray)popoverPassthroughViews
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (CGRect)urlOutlineFrameRelativeToView:(id)a3
{
  id v4 = a3;
  [(SFCapsuleNavigationBar *)self bounds];
  -[SFCapsuleNavigationBar convertRect:toView:](self, "convertRect:toView:", v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (_SFPopoverSourceInfo)formatMenuButtonPopoverSourceInfo
{
  return (_SFPopoverSourceInfo *)[(SFCapsuleNavigationBar *)self popoverSourceInfoForBarItem:13];
}

- (_SFPopoverSourceInfo)URLOutlinePopoverSourceInfo
{
  return 0;
}

- (BOOL)_scribbleInteractionIsEnabled:(id)a3
{
  return !self->_isMinimized;
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  id v4 = -[SFCapsuleNavigationBar hitTest:withEvent:](self, "hitTest:withEvent:", 0, a4.x, a4.y);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
}

- (void)availabilityDisplayController:(id)a3 didUpdateWithState:(int64_t)a4
{
  id v6 = a3;
  [(SFCapsuleNavigationBar *)self _updateLabelTypesAnimated:1];
  int v7 = [v6 isDisplaying];

  if (v7) {
    item = self->_item;
  }
  else {
    item = 0;
  }

  [(SFCapsuleNavigationBar *)self _updatePageFormatButtonForNavigationBarItem:item shouldResetDiscovery:a4 == 0];
}

- (id)availabilityDisplayController:(id)a3 determineBestLabelsForPresentation:(id)a4
{
  id v5 = a4;
  id v6 = self->_availabilityLabelLayoutInfo;
  int v7 = objc_alloc_init(SFURLLabel);
  double v8 = (void *)MEMORY[0x1E4FB08E0];
  double v9 = [(SFCapsuleNavigationBar *)self _labelTextStyle];
  double v10 = [v8 preferredFontForTextStyle:v9];
  [(SFURLLabel *)v7 setFont:v10];

  double v11 = [MEMORY[0x1E4FB1618] labelColor];
  [(SFURLLabel *)v7 setTextColor:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91__SFCapsuleNavigationBar_availabilityDisplayController_determineBestLabelsForPresentation___block_invoke;
  v28[3] = &unk_1E54E9B00;
  double v13 = v7;
  unint64_t v29 = v13;
  id v30 = self;
  double v26 = v6;
  id v27 = v12;
  double v31 = v26;
  [v12 setHandler:v28];
  double v14 = [[SFCapsuleNavigationBarLabelLayoutInfo alloc] initWithView:v13];
  availabilityLabelLayoutInfo = self->_availabilityLabelLayoutInfo;
  self->_availabilityLabelLayoutInfo = v14;

  double v16 = [MEMORY[0x1E4F1CA48] array];
  [(SFCapsuleNavigationBar *)self _initializeLayoutInfo:self->_availabilityLabelLayoutInfo forPrimaryLabel:0 addingConstraints:v16];
  [MEMORY[0x1E4F28DC8] activateConstraints:v16];
  uint64_t v17 = [v5 count];
  uint64_t v18 = v17 - 1;
  if (v17 == 1)
  {
LABEL_9:
    uint64_t v20 = [v5 lastObject];
  }
  else
  {
    uint64_t v19 = 0;
    while (1)
    {
      uint64_t v20 = [v5 objectAtIndexedSubscript:v19];
      uint64_t v21 = [v20 count];
      if (!v21) {
        break;
      }
      uint64_t v22 = v21;
      uint64_t v23 = 0;
      while (1)
      {
        double v24 = [v20 textForOptionsAtIndex:v23];
        [(SFURLLabel *)v13 setText:v24];

        [(SFCapsuleNavigationBar *)self setNeedsLayout];
        [(SFCapsuleNavigationBar *)self layoutIfNeeded];
        if ([(SFURLLabel *)v13 needsMasking]) {
          break;
        }
        if (v22 == ++v23) {
          goto LABEL_10;
        }
      }

      if (++v19 == v18) {
        goto LABEL_9;
      }
    }
  }
LABEL_10:

  return v20;
}

void __91__SFCapsuleNavigationBar_availabilityDisplayController_determineBestLabelsForPresentation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  unsigned int v2 = *(void **)(a1 + 48);
  double v3 = (id *)(*(void *)(a1 + 40) + 600);

  objc_storeStrong(v3, v2);
}

- (id)highlightObserver
{
  return self->_highlightObserver;
}

- (CGAffineTransform)keyContentTransform
{
  long long v3 = *(_OWORD *)&self[15].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[15].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[15].tx;
  return self;
}

- (CGAffineTransform)microphoneContentTransform
{
  long long v3 = *(_OWORD *)&self[16].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[16].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[16].tx;
  return self;
}

- (double)minimizationPercent
{
  return self->_minimizationPercent;
}

- (double)nonKeyContentAlpha
{
  return self->_nonKeyContentAlpha;
}

- (_SFBarTheme)theme
{
  return self->_theme;
}

- (SFCapsuleContentViewSizeUpdating)sizeUpdater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizeUpdater);

  return (SFCapsuleContentViewSizeUpdating *)WeakRetained;
}

- (NSArray)trailingButtons
{
  return self->_trailingButtons;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (BOOL)showingTransientLabel
{
  return self->_showingTransientLabel;
}

- (_SFNavigationBarDelegateCommon)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFNavigationBarDelegateCommon *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scribbleInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingButtons, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_sizeUpdater);
  objc_destroyWeak((id *)&self->_unclippedContainer);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong(&self->_highlightObserver, 0);
  objc_storeStrong(&self->_buttonPointerStyleProvider, 0);
  objc_storeStrong((id *)&self->_availabilityDisplayController, 0);
  objc_storeStrong((id *)&self->_availabilityLabelLayoutInfo, 0);
  objc_storeStrong((id *)&self->_titleLabelLayoutInfo, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_progressViewConstraints, 0);
  objc_storeStrong((id *)&self->_debugObservation, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_textVerticalAlignmentGuide, 0);
  objc_storeStrong((id *)&self->_textVerticalAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_buttonSpacingGuides, 0);
  objc_storeStrong((id *)&self->_trailingButtonConstraints, 0);
  objc_storeStrong((id *)&self->_leadingButtonConstraints, 0);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_searchIndicatorView, 0);
  objc_storeStrong((id *)&self->_leadingButtons, 0);
  objc_storeStrong((id *)&self->_externalLeadingButtons, 0);
  objc_storeStrong((id *)&self->_buttons, 0);

  objc_storeStrong((id *)&self->_titleContainer, 0);
}

@end