@interface _UIButtonBarButton
- (BOOL)_acceptsInauthenticTouches;
- (BOOL)backButtonMaskEnabled;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isBackButton;
- (BOOL)isBreadcrumb;
- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)updatePresentedMenuFrom:(id)a3;
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (CGRect)_buttonBarHitRect;
- (CGSize)backgroundSize;
- (CGSize)imageViewSize;
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)heightMinimizingConstraint;
- (NSLayoutConstraint)widthMinimizingConstraint;
- (UIEdgeInsets)alignmentRectInsets;
- (_UIBarButtonItemData)appearanceData;
- (_UIButtonBarButton)init;
- (_UIButtonBarButton)initWithCoder:(id)a3;
- (_UIButtonBarButton)initWithFrame:(CGRect)a3;
- (_UIButtonBarButton)initWithVisualProvider:(id)a3;
- (_UIButtonBarButtonVisualProvider)visualProvider;
- (_UISelectionInteraction)_selectionInteraction;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)_preferredSender;
- (id)_targetedPreviewForInteraction:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)focusEffect;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)preferredMenuElementOrder;
- (unint64_t)_controlEventsForActionTriggered;
- (void)_accessibilitySettingsChanged:(id)a3;
- (void)_applyDeferredSymbolEffects;
- (void)_configureFromBarItem:(id)a3 appearanceDelegate:(id)a4 isBackButton:(BOOL)a5 useBreadcrumbStyle:(BOOL)a6;
- (void)_is_setNeedsLayout;
- (void)_selectionInteractionDidBeginHinting:(id)a3;
- (void)_selectionInteractionDidCancelHinting:(id)a3;
- (void)_selectionInteractionDidSelect:(id)a3;
- (void)_setHasActiveMenuPresentation:(BOOL)a3;
- (void)_setTouchHasHighlighted:(BOOL)a3;
- (void)addSymbolEffect:(id)a3 options:(id)a4 animated:(BOOL)a5;
- (void)applyContentTransition:(id)a3 options:(id)a4;
- (void)configureBackButtonFromBarItem:(id)a3 withAppearanceDelegate:(id)a4;
- (void)configureBreadcrumbBackButtonFromBarItem:(id)a3 withAppearanceDelegate:(id)a4;
- (void)configureFromBarItem:(id)a3 withAppearanceDelegate:(id)a4;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)pasteTouchDown;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)removeAllSymbolEffectsWithOptions:(id)a3 animated:(BOOL)a4;
- (void)removeSymbolEffectOfType:(id)a3 options:(id)a4 animated:(BOOL)a5;
- (void)setAppearanceData:(id)a3;
- (void)setBackButtonMaskEnabled:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setNeedsAppearanceUpdate;
- (void)setPreferredMenuElementOrder:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSpringLoaded:(BOOL)a3;
- (void)set_selectionInteraction:(id)a3;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIButtonBarButton

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (-[UIView _willForceLayoutForBoundsChangeToNewBounds:]((BOOL)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height)&& (*(void *)&self->super.super._viewFlags & 0x200000000000000) != 0)
  {
    self->_autolayoutIsCleanForBoundsChange = 1;
    v9.receiver = self;
    v9.super_class = (Class)_UIButtonBarButton;
    -[UIView setBounds:](&v9, sel_setBounds_, x, y, width, height);
    if (!self->_autolayoutIsCleanForBoundsChange)
    {
      v8.receiver = self;
      v8.super_class = (Class)_UIButtonBarButton;
      [(UIView *)&v8 _is_setNeedsLayout];
      [(UIView *)self layoutIfNeeded];
      self->_autolayoutIsCleanForBoundsChange = 1;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIButtonBarButton;
    -[UIView setBounds:](&v9, sel_setBounds_, x, y, width, height);
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  [(_UIButtonBarButtonVisualProvider *)self->_visualProvider buttonAlignmentRectInsets:self];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (NSLayoutConstraint)widthMinimizingConstraint
{
  widthMinimizingConstraint = self->_widthMinimizingConstraint;
  if (!widthMinimizingConstraint)
  {
    double v4 = [(UIView *)self widthAnchor];
    double v5 = [v4 constraintEqualToConstant:0.0];
    v6 = self->_widthMinimizingConstraint;
    self->_widthMinimizingConstraint = v5;

    [(NSLayoutConstraint *)self->_widthMinimizingConstraint setIdentifier:@"_UIButtonBarButton.widthMinimizingConstraint"];
    LODWORD(v7) = 1132068864;
    [(NSLayoutConstraint *)self->_widthMinimizingConstraint setPriority:v7];
    widthMinimizingConstraint = self->_widthMinimizingConstraint;
  }
  return widthMinimizingConstraint;
}

- (CGSize)intrinsicContentSize
{
  [(_UIButtonBarButtonVisualProvider *)self->_visualProvider buttonIntrinsicContentSize:self];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_is_setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)_UIButtonBarButton;
  [(UIView *)&v3 _is_setNeedsLayout];
  self->_autolayoutIsCleanForBoundsChange = 0;
}

- (BOOL)isBackButton
{
  return self->_backButton;
}

- (void)setPreferredMenuElementOrder:(int64_t)a3
{
  self->_preferredMenuElementOrder = a3;
}

- (void)setSpringLoaded:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = self->_visualProvider;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38___UIButtonBarButton_setSpringLoaded___block_invoke;
  v7[3] = &unk_1E52DDA58;
  objc_super v8 = v5;
  v6 = v5;
  -[UIView _setSpringLoaded:interactionInitializer:](self, v3, v7);
}

- (_UIBarButtonItemData)appearanceData
{
  return self->_appearanceData;
}

- (void)_configureFromBarItem:(id)a3 appearanceDelegate:(id)a4 isBackButton:(BOOL)a5 useBreadcrumbStyle:(BOOL)a6
{
  id v16 = a3;
  id v10 = a4;
  self->_backButton = a5;
  self->_breadcrumb = a5 && a6;
  if ([v16 isSystemItem])
  {
    uint64_t v11 = [v16 systemItem];
    BOOL v13 = v11 == 1 || v11 == 24;
    self->_acceptsInauthenticTouches = v13;
  }
  else
  {
    self->_acceptsInauthenticTouches = 0;
  }
  [(_UIButtonBarButtonVisualProvider *)self->_visualProvider configureButton:self withAppearanceDelegate:v10 fromBarItem:v16];
  [(_UIButtonBarButtonVisualProvider *)self->_visualProvider updateButton:self toUseButtonShapes:_AXSButtonShapesEnabled() != 0];
  -[_UIButtonBarButton setEnabled:](self, "setEnabled:", [v16 isEnabled]);
  -[_UIButtonBarButton setSelected:](self, "setSelected:", [v16 isSelected]);
  if ((char *)[v16 action] == sel_assistantPaste_forEvent_)
  {
    [(UIControl *)self addTarget:self action:sel_pasteTouchDown forControlEvents:1];
    v14 = [MEMORY[0x1E4F1C9C8] now];
    appearanceDate = self->_appearanceDate;
    self->_appearanceDate = v14;
  }
  [(_UIButtonBarButton *)self _applyDeferredSymbolEffects];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v4 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider buttonEnabledState:self forRequestedState:a3];
  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBarButton;
  [(UIControl *)&v5 setEnabled:v4];
  [(_UIButtonBarButtonVisualProvider *)self->_visualProvider updateButton:self forEnabledState:[(UIControl *)self isEnabled]];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v4 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider buttonSelectionState:self forRequestedState:a3];
  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBarButton;
  [(UIControl *)&v5 setSelected:v4];
  [(_UIButtonBarButtonVisualProvider *)self->_visualProvider updateButton:self forSelectedState:[(UIControl *)self isSelected]];
}

- (void)_applyDeferredSymbolEffects
{
  BOOL v3 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider symbolImageView];
  BOOL v4 = v3;
  if (v3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49___UIButtonBarButton__applyDeferredSymbolEffects__block_invoke;
    aBlock[3] = &unk_1E52DDAA0;
    id v8 = v3;
    objc_super v5 = _Block_copy(aBlock);
  }
  else
  {
    objc_super v5 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualProvider->_barButtonItem);
  [WeakRetained _applyDeferredSymbolEffects:v5];
}

- (BOOL)isBreadcrumb
{
  return self->_breadcrumb;
}

- (void)setAppearanceData:(id)a3
{
  id v5 = a3;
  v6 = self->_appearanceData;
  double v7 = (_UIBarButtonItemData *)v5;
  objc_super v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(_UIBarAppearanceData *)v6 isEqual:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_appearanceData, a3);
    [(_UIButtonBarButton *)self setNeedsAppearanceUpdate];
  }
LABEL_9:
}

- (void)configureFromBarItem:(id)a3 withAppearanceDelegate:(id)a4
{
  p_barButtonItem = &self->_visualProvider->_barButtonItem;
  id v7 = a4;
  id v8 = a3;
  objc_storeWeak((id *)p_barButtonItem, v8);
  [(_UIButtonBarButton *)self _configureFromBarItem:v8 appearanceDelegate:v7 isBackButton:0 useBreadcrumbStyle:0];
}

- (_UIButtonBarButtonVisualProvider)visualProvider
{
  return self->_visualProvider;
}

- (void)setNeedsAppearanceUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualProvider->_barButtonItem);

  if (WeakRetained)
  {
    [(_UIButtonBarButtonVisualProvider *)self->_visualProvider updateButton:self appearance:self->_appearanceData];
    [(UIView *)self setNeedsLayout];
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      [(UIView *)self layoutIfNeeded];
    }
  }
}

- (_UIButtonBarButton)initWithVisualProvider:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIButtonBarButton;
  id v5 = -[UIControl initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    visualProvider = v5->_visualProvider;
    v5->_visualProvider = (_UIButtonBarButtonVisualProvider *)v6;

    v5->_visualProvider->_button = v5;
    id v8 = objc_opt_new();
    [v8 setDelegate:v5];
    [(UIView *)v5 addInteraction:v8];
    [(_UIButtonBarButton *)v5 set_selectionInteraction:v8];
    objc_super v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v5 selector:sel__accessibilitySettingsChanged_ name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];
  }
  return v5;
}

- (void)set_selectionInteraction:(id)a3
{
}

- (void)willMoveToSuperview:(id)a3
{
  visualProvider = self->_visualProvider;
  id v5 = a3;
  [(_UIButtonBarButtonVisualProvider *)visualProvider buttonWillMoveToSuperview:v5];
  v6.receiver = self;
  v6.super_class = (Class)_UIButtonBarButton;
  [(UIView *)&v6 willMoveToSuperview:v5];
}

- (void)willMoveToWindow:(id)a3
{
  visualProvider = self->_visualProvider;
  id v5 = a3;
  [(_UIButtonBarButtonVisualProvider *)visualProvider buttonWillMoveToWindow:v5];
  v6.receiver = self;
  v6.super_class = (Class)_UIButtonBarButton;
  [(UIView *)&v6 willMoveToWindow:v5];
}

- (void)configureBackButtonFromBarItem:(id)a3 withAppearanceDelegate:(id)a4
{
  visualProvider = self->_visualProvider;
  id v8 = a4;
  id obj = a3;
  if (![(_UIButtonBarButtonVisualProvider *)visualProvider supportsBackButtons])
  {
    objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIButtonBarButton.m", 475, @"Attempt to create a back-button styled bar button from a visual style that does not support back buttons (button=%p, visual style=%@)", self, self->_visualProvider object file lineNumber description];
  }
  objc_storeWeak((id *)&self->_visualProvider->_barButtonItem, obj);
  [(_UIButtonBarButton *)self _configureFromBarItem:obj appearanceDelegate:v8 isBackButton:1 useBreadcrumbStyle:0];
}

- (void)layoutSubviews
{
  BOOL v3 = +[UIView areAnimationsEnabled];
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    +[UIView setAnimationsEnabled:0];
  }
  visualProvider = self->_visualProvider;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36___UIButtonBarButton_layoutSubviews__block_invoke;
  v5[3] = &unk_1E52D9F70;
  v5[4] = self;
  [(_UIButtonBarButtonVisualProvider *)visualProvider buttonLayoutSubviews:self baseImplementation:v5];
  +[UIView setAnimationsEnabled:v3];
}

- (BOOL)updatePresentedMenuFrom:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider canUpdateMenuInPlace];
  if (v5)
  {
    objc_super v6 = [(UIControl *)self contextMenuInteraction];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_visualProvider->_barButtonItem);
    id v8 = [WeakRetained menu];
    _UIControlMenuUpdateVisibleMenu(v6, v4, v8);

    [(_UIButtonBarButtonVisualProvider *)self->_visualProvider updateMenu];
  }

  return v5;
}

- (NSLayoutConstraint)heightMinimizingConstraint
{
  heightMinimizingConstraint = self->_heightMinimizingConstraint;
  if (!heightMinimizingConstraint)
  {
    id v4 = [(UIView *)self heightAnchor];
    BOOL v5 = [v4 constraintEqualToConstant:0.0];
    objc_super v6 = self->_heightMinimizingConstraint;
    self->_heightMinimizingConstraint = v5;

    [(NSLayoutConstraint *)self->_heightMinimizingConstraint setIdentifier:@"_UIButtonBarButton.heightMinimizingConstraint"];
    LODWORD(v7) = 1132068864;
    [(NSLayoutConstraint *)self->_heightMinimizingConstraint setPriority:v7];
    heightMinimizingConstraint = self->_heightMinimizingConstraint;
  }
  return heightMinimizingConstraint;
}

- (void)dealloc
{
  self->_visualProvider->_button = 0;
  objc_storeWeak((id *)&self->_visualProvider->_barButtonItem, 0);
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIButtonBarButton;
  [(UIView *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectionInteraction, 0);
  objc_storeStrong((id *)&self->_appearanceData, 0);
  objc_storeStrong((id *)&self->_appearanceDate, 0);
  objc_storeStrong((id *)&self->_heightMinimizingConstraint, 0);
  objc_storeStrong((id *)&self->_widthMinimizingConstraint, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
}

- (_UIButtonBarButton)init
{
  return 0;
}

- (_UIButtonBarButton)initWithFrame:(CGRect)a3
{
  return 0;
}

- (_UIButtonBarButton)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v4 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider buttonHighlitedState:self forRequestedState:a3];
  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBarButton;
  [(UIControl *)&v5 setHighlighted:v4];
  [(_UIButtonBarButtonVisualProvider *)self->_visualProvider updateButton:self forHighlightedState:[(UIControl *)self isHighlighted]];
}

- (void)_setHasActiveMenuPresentation:(BOOL)a3
{
  BOOL v4 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider buttonHeldState:self forRequestedState:a3];
  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBarButton;
  [(UIControl *)&v5 _setHasActiveMenuPresentation:v4];
  [(_UIButtonBarButtonVisualProvider *)self->_visualProvider updateButton:self forHeldState:[(UIControl *)self _hasActiveMenuPresentation]];
}

- (void)_setTouchHasHighlighted:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBarButton;
  -[UIControl _setTouchHasHighlighted:](&v5, sel__setTouchHasHighlighted_);
  if (!a3) {
    [(_UIButtonBarButtonVisualProvider *)self->_visualProvider resetButtonHasHighlighted];
  }
}

- (BOOL)backButtonMaskEnabled
{
  return [(_UIButtonBarButtonVisualProvider *)self->_visualProvider backButtonMaskEnabled];
}

- (void)setBackButtonMaskEnabled:(BOOL)a3
{
}

- (void)configureBreadcrumbBackButtonFromBarItem:(id)a3 withAppearanceDelegate:(id)a4
{
  visualProvider = self->_visualProvider;
  id v8 = a4;
  id obj = a3;
  if (![(_UIButtonBarButtonVisualProvider *)visualProvider supportsBackButtons])
  {
    objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIButtonBarButton.m", 482, @"Attempt to create a back-button styled bar button from a visual style that does not support back buttons (button=%p, visual style=%@)", self, self->_visualProvider object file lineNumber description];
  }
  objc_storeWeak((id *)&self->_visualProvider->_barButtonItem, obj);
  [(_UIButtonBarButton *)self _configureFromBarItem:obj appearanceDelegate:v8 isBackButton:1 useBreadcrumbStyle:1];
}

- (BOOL)_acceptsInauthenticTouches
{
  return self->_acceptsInauthenticTouches;
}

- (void)pasteTouchDown
{
}

- (CGSize)backgroundSize
{
  [(_UIButtonBarButtonVisualProvider *)self->_visualProvider buttonBackgroundSize:self];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)imageViewSize
{
  [(_UIButtonBarButtonVisualProvider *)self->_visualProvider buttonImageViewSize:self];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  objc_super v5 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider buttonContextMenuInteractionConfiguration];
  objc_msgSend(v5, "setPreferredMenuElementOrder:", -[_UIButtonBarButton preferredMenuElementOrder](self, "preferredMenuElementOrder"));
  if (dyld_program_sdk_at_least())
  {
    objc_super v6 = [(UIView *)self nextResponder];
    double v7 = _UITreeFindFirstAncestorMatchingCondition(v6, sel_nextResponder, &__block_literal_global_161);

    id v8 = [v7 topViewController];
    [v5 setFirstResponderTarget:v8];
  }
  return v5;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  objc_super v5 = [(UIView *)self window];

  if (v5)
  {
    objc_super v6 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider buttonContextMenuTargetedPreview];
  }
  else
  {
    objc_super v6 = 0;
  }
  return v6;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  objc_super v5 = [(UIView *)self window];

  if (v5)
  {
    objc_super v6 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider buttonContextMenuTargetedPreview];
  }
  else
  {
    objc_super v6 = 0;
  }
  return v6;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  visualProvider = self->_visualProvider;
  v8.receiver = self;
  v8.super_class = (Class)_UIButtonBarButton;
  objc_super v5 = [(UIControl *)&v8 _contextMenuInteraction:a3 styleForMenuWithConfiguration:a4];
  objc_super v6 = [(_UIButtonBarButtonVisualProvider *)visualProvider buttonContextMenuStyleFromDefaultStyle:v5];

  return v6;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  [(_UIButtonBarButtonVisualProvider *)self->_visualProvider menuAnchorPoint];
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (void)addSymbolEffect:(id)a3 options:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  objc_super v9 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider symbolImageView];
  id v10 = v9;
  if (v9) {
    [v9 addSymbolEffect:v11 options:v8 animated:v5];
  }
}

- (void)removeSymbolEffectOfType:(id)a3 options:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  objc_super v9 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider symbolImageView];
  id v10 = v9;
  if (v9) {
    [v9 removeSymbolEffectOfType:v11 options:v8 animated:v5];
  }
}

- (void)removeAllSymbolEffectsWithOptions:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  objc_super v6 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider symbolImageView];
  double v7 = v6;
  if (v6) {
    [v6 removeAllSymbolEffectsWithOptions:v8 animated:v4];
  }
}

- (void)applyContentTransition:(id)a3 options:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  double v7 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider symbolImageView];
  visualProvider = self->_visualProvider;
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&visualProvider->_barButtonItem);
    id v10 = [WeakRetained image];
    [v7 setSymbolImage:v10 withContentTransition:v11 options:v6];

    [(_UIButtonBarButtonVisualProvider *)self->_visualProvider updateImage];
  }
  else
  {
    [(_UIButtonBarButtonVisualProvider *)visualProvider reload];
  }
}

- (id)_preferredSender
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualProvider->_barButtonItem);
  return WeakRetained;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  [(_UIButtonBarButton *)self _buttonBarHitRect];
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  if (isKindOfClass)
  {
    objc_msgSend(v6, "createRegionFromRect:targetView:identifier:selected:", self, @"com.apple.UIKit._UIButtonBarButton", -[UIControl isSelected](self, "isSelected"), v8, v9, v10, v11);
  }
  else
  {
    id v16 = [v6 view];
    -[UIView convertRect:toView:](self, "convertRect:toView:", v16, v12, v13, v14, v15);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v18, v20, v22, v24);
  v25 = };

  return v25;
}

- (id)_targetedPreviewForInteraction:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIButtonBarButtonVisualProvider *)self->_visualProvider pointerPreviewParameters];
  [(_UIButtonBarButtonVisualProvider *)self->_visualProvider pointerPreviewCenter];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(UIView *)self superview];
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v10, v7, v9);
  double v12 = v11;
  double v14 = v13;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v4, "createPreviewTargetForView:center:", self, v12, v14);
    double v15 = (UIPreviewTarget *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = [UIPreviewTarget alloc];
    double v17 = [(UIView *)self superview];
    double v15 = -[UIPreviewTarget initWithContainer:center:](v16, "initWithContainer:center:", v17, v12, v14);
  }
  double v18 = [[UITargetedPreview alloc] initWithView:self parameters:v5 target:v15];

  return v18;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  BOOL v5 = -[_UIButtonBarButton _targetedPreviewForInteraction:](self, "_targetedPreviewForInteraction:", a3, a4);
  visualProvider = self->_visualProvider;
  double v7 = [v5 target];
  double v8 = [v7 container];
  double v9 = [(_UIButtonBarButtonVisualProvider *)visualProvider pointerShapeInContainer:v8];

  if ([(_UIButtonBarButtonVisualProvider *)self->_visualProvider shouldLift])
  {
    double v10 = +[UIColor clearColor];
    double v11 = [v5 parameters];
    [v11 setBackgroundColor:v10];

    double v12 = off_1E52D43F0;
  }
  else
  {
    double v12 = off_1E52D43D8;
  }
  double v13 = [(__objc2_class *)*v12 effectWithPreview:v5];
  double v14 = +[UIPointerStyle styleWithEffect:v13 shape:v9];
  if ([(_UIButtonBarButtonVisualProvider *)self->_visualProvider shouldSuppressPointerSpecularFilter])
  {
    objc_msgSend(v14, "setOptions:", objc_msgSend(v14, "options") | 0x1000);
  }

  return v14;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
}

- (CGRect)_buttonBarHitRect
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIView *)self hitTestInsets];
  double v12 = v6 + v11;
  double v15 = v8 - (v13 + v14);
  double v17 = v10 - (v11 + v16);
  double v18 = v4 + v13;
  double v19 = v12;
  double v20 = v15;
  result.size.double height = v17;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(_UIButtonBarButton *)self _buttonBarHitRect];
  CGRect v11 = CGRectInset(v10, -15.0, -15.0);
  CGFloat v6 = x;
  CGFloat v7 = y;
  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

- (void)_accessibilitySettingsChanged:(id)a3
{
  visualProvider = self->_visualProvider;
  BOOL v5 = _AXSButtonShapesEnabled() != 0;
  [(_UIButtonBarButtonVisualProvider *)visualProvider updateButton:self toUseButtonShapes:v5];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 view];
  BOOL v6 = v5 == self
    || ![v4 _isGestureType:0]
    || [v4 numberOfTouchesRequired] != 1
    || [v4 numberOfTapsRequired] != 1;

  return v6;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIButtonBarButton;
  [(UIView *)&v12 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  CGFloat v7 = [v6 nextFocusedView];
  if (v7 == self)
  {

LABEL_5:
    visualProvider = self->_visualProvider;
    CGRect v11 = [v6 nextFocusedView];
    [(_UIButtonBarButtonVisualProvider *)visualProvider updateButton:self forFocusedState:v11 == self];

    goto LABEL_6;
  }
  double v8 = v7;
  double v9 = [v6 previouslyFocusedView];

  if (v9 == self) {
    goto LABEL_5;
  }
LABEL_6:
}

- (id)focusEffect
{
  return [(_UIButtonBarButtonVisualProvider *)self->_visualProvider focusEffect];
}

- (void)_selectionInteractionDidBeginHinting:(id)a3
{
  BOOL v5 = self;
  double v3 = [(UIView *)v5 _focusBehavior];
  char v4 = [v3 buttonSelectionMode];

  if ((v4 & 2) != 0 && [(UIControl *)v5 isEnabled]) {
    [(_UIButtonBarButton *)v5 setHighlighted:1];
  }
}

- (void)_selectionInteractionDidCancelHinting:(id)a3
{
  BOOL v5 = self;
  double v3 = [(UIView *)v5 _focusBehavior];
  char v4 = [v3 buttonSelectionMode];

  if ((v4 & 2) != 0 && [(UIControl *)v5 isHighlighted])
  {
    [(_UIButtonBarButton *)v5 setHighlighted:0];
    [(_UIButtonBarButton *)v5 _setTouchHasHighlighted:0];
  }
}

- (void)_selectionInteractionDidSelect:(id)a3
{
  double v3 = self;
  char v4 = [(UIView *)v3 _focusBehavior];
  char v5 = [v4 buttonSelectionMode];

  if ((v5 & 2) != 0 && [(UIControl *)v3 isHighlighted])
  {
    [(_UIButtonBarButton *)v3 setHighlighted:0];
    [(_UIButtonBarButton *)v3 _setTouchHasHighlighted:0];
  }

  id v6 = [(UIView *)v3 _focusBehavior];
  char v7 = [v6 buttonSelectionMode];

  if (v7)
  {
    [(UIControl *)v3 sendActionsForControlEvents:1];
    uint64_t v8 = 64;
  }
  else
  {
    uint64_t v8 = 0x2000;
  }
  [(UIControl *)v3 sendActionsForControlEvents:v8];
}

- (int64_t)preferredMenuElementOrder
{
  return self->_preferredMenuElementOrder;
}

- (_UISelectionInteraction)_selectionInteraction
{
  return self->__selectionInteraction;
}

@end