@interface UICollectionViewCell
+ (BOOL)_isInternalCell;
+ (BOOL)_subclassOverridesContentViewClass;
+ (BOOL)_wantsLegacyMenuGesture;
+ (Class)_contentViewClass;
+ (id)_createDefaultContentViewWithFrame:(CGRect)a3;
- (BOOL)_allowsHorizontalFocusMovement;
- (BOOL)_allowsStateUpdatesWhenEvaluatingBackgroundAppearance;
- (BOOL)_appliesLayoutAttributesMaskingToBackgroundConfiguration;
- (BOOL)_appliesLayoutAttributesMaskingToReusableView;
- (BOOL)_backgroundFillIsCustomized;
- (BOOL)_backgroundIsVerticallyInset;
- (BOOL)_canFocusProgrammatically;
- (BOOL)_canPerformActionForKey:(id)a3;
- (BOOL)_descendantsShouldHighlight;
- (BOOL)_forwardsSystemLayoutFittingSizeToContentView:(id)a3;
- (BOOL)_gestureRecognizerShouldBegin:(id)a3;
- (BOOL)_hasCustomSelectionAction;
- (BOOL)_highlightDescendantsWhenSelected;
- (BOOL)_isDropTarget;
- (BOOL)_isReordering;
- (BOOL)_isSwiped;
- (BOOL)_isUsingOldStyleMultiselection;
- (BOOL)_performActionForKey:(id)a3;
- (BOOL)_removesHighlightedAndSelectedStatesForBackground;
- (BOOL)_shouldForwardMovementToFocusEngine:(int64_t)a3;
- (BOOL)_shouldSaveOpaqueStateForView:(id)a3;
- (BOOL)_usesAnyPlainListStyle;
- (BOOL)_usingBackgroundConfigurationOrDefaultBackgroundConfiguration;
- (BOOL)_usingBackgroundViewConfiguration;
- (BOOL)_usingContentViewConfiguration;
- (BOOL)automaticallyUpdatesBackgroundConfiguration;
- (BOOL)automaticallyUpdatesContentConfiguration;
- (BOOL)canBeEdited;
- (BOOL)canBecomeFocused;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isDragging;
- (BOOL)isEditing;
- (BOOL)isFocused;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (CGSize)_contentTargetSizeForTargetSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5 forUseWithSizeThatFits:(BOOL)a6;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIBackgroundConfiguration)backgroundConfiguration;
- (UIBackgroundConfiguration)defaultBackgroundConfiguration;
- (UIButton)_popupMenuButton;
- (UICellConfigurationState)_configurationState;
- (UICollectionViewCell)initWithCoder:(id)a3;
- (UICollectionViewCell)initWithFrame:(CGRect)a3;
- (UICollectionViewCellConfigurationUpdateHandler)configurationUpdateHandler;
- (UIEdgeInsets)_contentViewInset;
- (UIEditMenuInteraction)_editMenuInteraction;
- (UIView)_existingContentView;
- (UIView)backgroundView;
- (UIView)contentView;
- (UIView)selectedBackgroundView;
- (_UIFloatingContentView)_focusedFloatingContentView;
- (double)_selectionAnimationDuration;
- (id)_backgroundViewConfiguration;
- (id)_backgroundViewConfigurationProvider;
- (id)_bridgedConfigurationState;
- (id)_contentViewConfiguration;
- (id)_contentViewConfigurationProvider;
- (id)_defaultBackgroundConfiguration;
- (id)_defaultBackgroundView;
- (id)_defaultFocusEffect;
- (id)_defaultFocusOutline;
- (id)_defaultSelectedBackgroundView;
- (id)_effectiveDefaultBackgroundConfiguration;
- (id)_effectivePopupMenuButton;
- (id)_encodableSubviews;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (id)_selectionSegueTemplate;
- (id)_stateForUpdatingBackgroundConfigurationWithState:(id)a3;
- (id)_systemBackgroundView;
- (id)_visiblePathForBackgroundConfiguration;
- (id)contentConfiguration;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (int64_t)_contextMenuGroupLocation;
- (int64_t)_dropState;
- (int64_t)_focusStyle;
- (int64_t)_systemDefaultFocusGroupPriority;
- (int64_t)focusItemDeferralMode;
- (unint64_t)_dragAppearance;
- (unint64_t)_effectiveMaskedCornersForSystemBackgroundView;
- (unint64_t)_maskedCornersForSystemBackgroundView;
- (unint64_t)_viewConfigurationState;
- (void)_applyBackgroundViewConfiguration:(id)a3 withState:(id)a4;
- (void)_applyContentViewConfiguration:(id)a3 withState:(id)a4 usingSPI:(BOOL)a5;
- (void)_bridgedUpdateConfigurationUsingState:(void *)a3;
- (void)_clearChangeHandlersForOldContentView:(id)a3;
- (void)_configureFocusedFloatingContentView:(id)a3;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_executeConfigurationUpdate;
- (void)_forcePopulateNormalStateConfiguration;
- (void)_handleMenuGesture:(id)a3;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_layoutContentView;
- (void)_layoutFocusedFloatingContentView;
- (void)_layoutSystemBackgroundView;
- (void)_monitoredView:(id)a3 didMoveFromSuperview:(id)a4 toSuperview:(id)a5;
- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5;
- (void)_notifyIsDisplaying:(BOOL)a3;
- (void)_performAction:(SEL)a3 sender:(id)a4;
- (void)_performConfigurationStateModifications:(id)a3;
- (void)_performConfigurationStateUpdate;
- (void)_performCustomSelectionAction;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_prepareForConfigurationStateUpdate;
- (void)_resetBackgroundViewConfiguration;
- (void)_resetBackgroundViewsAndColor;
- (void)_restoreCurrentDragAppearanceIfNeeded;
- (void)_setAllowsStateUpdatesWhenEvaluatingBackgroundAppearance:(BOOL)a3;
- (void)_setAutomaticIntrinsicContentSizeInvalidationEnabled:(BOOL)a3;
- (void)_setBackgroundViewConfiguration:(id)a3;
- (void)_setBackgroundViewConfigurationProvider:(id)a3;
- (void)_setContentView:(id)a3 addToHierarchy:(BOOL)a4;
- (void)_setContentViewConfiguration:(id)a3;
- (void)_setContentViewConfigurationProvider:(id)a3;
- (void)_setContextMenuGroupLocation:(int64_t)a3;
- (void)_setDragAppearance:(unint64_t)a3;
- (void)_setDropState:(int64_t)a3;
- (void)_setFocusStyle:(int64_t)a3;
- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)_setLayoutAttributes:(id)a3;
- (void)_setOpaque:(BOOL)a3 forSubview:(id)a4;
- (void)_setPopupMenuButton:(id)a3;
- (void)_setReordering:(BOOL)a3;
- (void)_setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)_setSelectionSegueTemplate:(id)a3;
- (void)_setSwiped:(BOOL)a3;
- (void)_setUsesAnyPlainListStyle:(BOOL)a3;
- (void)_setupChangeHandlersForNewContentView:(id)a3;
- (void)_setupHighlightingSupport;
- (void)_teardownHighlightingSupportIfReady;
- (void)_updateBackgroundView;
- (void)_updateBackgroundViewConfigurationForState:(id)a3;
- (void)_updateConfigurationWithObservationTracking;
- (void)_updateContentViewConfigurationForState:(id)a3;
- (void)_updateDefaultBackgroundAppearance;
- (void)_updateFocusedFloatingContentControlStateAnimated:(BOOL)a3;
- (void)_updateFocusedFloatingContentControlStateInContext:(id)a3 withAnimationCoordinator:(id)a4 animated:(BOOL)a5;
- (void)_updateHighlightColorsForAnimationHalfwayPoint;
- (void)_updateHighlightColorsForView:(id)a3 highlight:(BOOL)a4;
- (void)_updatePopupMenuButtonFromContentView;
- (void)_updateUserInterfaceRenderingModeUsingAttributes:(id)a3;
- (void)_willUpdateFocusInContext:(id)a3;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)paste:(id)a3;
- (void)prepareForReuse;
- (void)setAutomaticallyUpdatesBackgroundConfiguration:(BOOL)automaticallyUpdatesBackgroundConfiguration;
- (void)setAutomaticallyUpdatesContentConfiguration:(BOOL)automaticallyUpdatesContentConfiguration;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundConfiguration:(UIBackgroundConfiguration *)backgroundConfiguration;
- (void)setBackgroundView:(UIView *)backgroundView;
- (void)setConfigurationUpdateHandler:(UICollectionViewCellConfigurationUpdateHandler)configurationUpdateHandler;
- (void)setContentConfiguration:(id)contentConfiguration;
- (void)setContentView:(id)a3;
- (void)setDragging:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
- (void)setHighlighted:(BOOL)highlighted;
- (void)setNeedsUpdateConfiguration;
- (void)setSelected:(BOOL)selected;
- (void)setSelectedBackgroundView:(UIView *)selectedBackgroundView;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)set_editMenuInteraction:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UICollectionViewCell

- (UIBackgroundConfiguration)backgroundConfiguration
{
  v2 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (void)setConfigurationUpdateHandler:(UICollectionViewCellConfigurationUpdateHandler)configurationUpdateHandler
{
  if (self->_configurationUpdateHandler != configurationUpdateHandler)
  {
    v4 = (void *)[configurationUpdateHandler copy];
    id v5 = self->_configurationUpdateHandler;
    self->_configurationUpdateHandler = v4;

    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

uint64_t __106__UICollectionViewCell_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _performConfigurationStateUpdate];
  v2 = *(void **)(a1 + 32);
  return [v2 _layoutContentView];
}

uint64_t __37__UICollectionViewCell_sizeThatFits___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performConfigurationStateUpdate];
}

uint64_t __50__UICollectionViewCell_setSelectedBackgroundView___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = 1.0;
  if ((*(_DWORD *)(v2 + 584) & 1) == 0) {
    double v3 = 0.0;
  }
  [*(id *)(v2 + 504) setAlpha:v3];
  [*(id *)(a1 + 32) bounds];
  v4 = *(void **)(*(void *)(a1 + 32) + 504);
  return objc_msgSend(v4, "setFrame:");
}

uint64_t __42__UICollectionViewCell_setBackgroundView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 496);
  return objc_msgSend(v2, "setFrame:");
}

- (void)setBackgroundConfiguration:(UIBackgroundConfiguration *)backgroundConfiguration
{
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
  int v4 = (*(unsigned int *)&collectionCellFlags >> 15) & 1;
  if (backgroundConfiguration) {
    int v4 = 1;
  }
  if (v4) {
    int v5 = 0x8000;
  }
  else {
    int v5 = 0;
  }
  self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(v5 | *(_DWORD *)&collectionCellFlags & 0xFFFF7FFF);
  -[UICollectionViewCell _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:");
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(UICollectionViewCell *)self _resetBackgroundViewConfiguration];
  }
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
  int v6 = (*(unsigned int *)&collectionCellFlags >> 11) & 1;
  if (v4) {
    int v6 = 1;
  }
  if (v6) {
    int v7 = 2048;
  }
  else {
    int v7 = 0;
  }
  self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(v7 | *(_DWORD *)&collectionCellFlags & 0xFFFFF7FF);
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewCell;
  [(UIView *)&v8 setBackgroundColor:v4];
}

uint64_t __58__UICollectionViewCell__updateDefaultBackgroundAppearance__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundConfiguration:*(void *)(a1 + 40)];
}

uint64_t __53__UICollectionViewCell__resetBackgroundViewsAndColor__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:0];
}

uint64_t __57__UICollectionViewCell__resetBackgroundViewConfiguration__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundConfiguration:0];
  [*(id *)(a1 + 32) _setBackgroundViewConfigurationProvider:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _setBackgroundViewConfiguration:0];
}

- (void)_setBackgroundViewConfigurationProvider:(id)a3
{
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
  int v4 = (*(unsigned int *)&collectionCellFlags >> 14) & 1;
  if (a3) {
    int v4 = 1;
  }
  if (v4) {
    int v5 = 0x4000;
  }
  else {
    int v5 = 0;
  }
  unsigned int v6 = v5 | *(_DWORD *)&collectionCellFlags & 0xFFFFBFFF;
  self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)v6;
  if (self->_backgroundViewConfigurationProvider != a3)
  {
    if (a3) {
      self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(v6 & 0xFFFEFFFF);
    }
    id v8 = a3;
    v9 = (void *)[v8 copy];
    id backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    self->_id backgroundViewConfigurationProvider = v9;

    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)_setBackgroundViewConfiguration:(id)a3
{
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
  int v4 = (*(unsigned int *)&collectionCellFlags >> 15) & 1;
  if (a3) {
    int v4 = 1;
  }
  if (v4) {
    int v5 = 0x8000;
  }
  else {
    int v5 = 0;
  }
  self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(v5 | *(_DWORD *)&collectionCellFlags & 0xFFFF7FFF);
  -[UICollectionViewCell _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:");
}

- (BOOL)_forwardsSystemLayoutFittingSizeToContentView:(id)a3
{
  int v4 = (UIView *)a3;
  if (((*((unsigned char *)&self->_collectionCellFlags + 2) & 0x10) != 0 || (dyld_program_sdk_at_least() & 1) == 0)
    && self->_contentView == v4)
  {
    char IsGuardingForEngine = -[UIView _wantsAutolayoutOrIsGuardingForEngineHosting]((uint64_t)v4);
  }
  else
  {
    char IsGuardingForEngine = 0;
  }

  return IsGuardingForEngine;
}

- (UICellConfigurationState)_configurationState
{
  double v3 = [UICellConfigurationState alloc];
  int v4 = [(UIView *)self traitCollection];
  int v5 = [(UIViewConfigurationState *)v3 initWithTraitCollection:v4];

  [(UIViewConfigurationState *)v5 setDisabled:[(UIView *)self isUserInteractionEnabled] ^ 1];
  [(UIViewConfigurationState *)v5 setHighlighted:[(UICollectionViewCell *)self isHighlighted]];
  [(UIViewConfigurationState *)v5 setSelected:[(UICollectionViewCell *)self isSelected]];
  [(UIViewConfigurationState *)v5 setFocused:[(UICollectionViewCell *)self isFocused]];
  [(UICellConfigurationState *)v5 setEditing:[(UICollectionViewCell *)self isEditing]];
  [(UICellConfigurationState *)v5 setSwiped:[(UICollectionViewCell *)self _isSwiped]];
  [(UICellConfigurationState *)v5 setReordering:[(UICollectionViewCell *)self _isReordering]];
  uint64_t v6 = [(UICollectionReusableView *)self _layoutAttributes];
  int v7 = (void *)v6;
  if (v6)
  {
    [(UIViewConfigurationState *)v5 setPinned:(*(unsigned __int16 *)(v6 + 288) >> 11) & 1];
    [(UIViewConfigurationState *)v5 _setContextMenuGroupLocation:[(UICollectionViewCell *)self _contextMenuGroupLocation]];
    [(UICellConfigurationState *)v5 _setUsesAnyPlainListStyle:[(UICollectionViewCell *)self _usesAnyPlainListStyle]];
    BOOL v8 = v7[38] > 1uLL;
  }
  else
  {
    [(UIViewConfigurationState *)v5 setPinned:0];
    [(UIViewConfigurationState *)v5 _setContextMenuGroupLocation:[(UICollectionViewCell *)self _contextMenuGroupLocation]];
    [(UICellConfigurationState *)v5 _setUsesAnyPlainListStyle:[(UICollectionViewCell *)self _usesAnyPlainListStyle]];
    BOOL v8 = 0;
  }
  [(UICellConfigurationState *)v5 _setInMultiSelectGroup:v8];
  unint64_t v9 = self->_dragAppearance - 1;
  if (v9 <= 2) {
    [(UICellConfigurationState *)v5 setCellDragState:qword_186B93F98[v9]];
  }
  [(UICellConfigurationState *)v5 setCellDropState:[(UICollectionViewCell *)self _dropState]];

  return v5;
}

- (BOOL)isSelected
{
  return *(_DWORD *)&self->_collectionCellFlags & 1;
}

- (BOOL)isHighlighted
{
  return (*(unsigned char *)&self->_collectionCellFlags >> 1) & 1;
}

- (BOOL)isFocused
{
  if ((*((unsigned char *)&self->_collectionCellFlags + 3) & 4) != 0) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewCell;
  return [(UIView *)&v3 isFocused];
}

- (BOOL)isEditing
{
  return (*(unsigned char *)&self->_collectionCellFlags >> 2) & 1;
}

- (void)_setLayoutAttributes:(id)a3
{
  int v4 = (id *)a3;
  uint64_t v5 = [(UICollectionReusableView *)self _layoutAttributes];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    int v7 = (*(unsigned __int16 *)(v5 + 288) >> 11) & 1;
    if (v4) {
      goto LABEL_3;
    }
LABEL_31:
    int v8 = 0;
    if (v5) {
      goto LABEL_4;
    }
    goto LABEL_32;
  }
  int v7 = 0;
  if (!v4) {
    goto LABEL_31;
  }
LABEL_3:
  int v8 = (*((unsigned __int16 *)v4 + 144) >> 11) & 1;
  if (v5)
  {
LABEL_4:
    BOOL v9 = *(void *)(v5 + 304) > 1uLL;
    goto LABEL_5;
  }
LABEL_32:
  BOOL v9 = 0;
LABEL_5:
  int v10 = v7 ^ v8;
  if (v4) {
    BOOL v11 = (unint64_t)v4[38] > 1;
  }
  else {
    BOOL v11 = 0;
  }
  int v12 = v10 | v9 ^ v11;
  if (v12 == 1) {
    [(UICollectionViewCell *)self _prepareForConfigurationStateUpdate];
  }
  int64_t v13 = [(UICollectionReusableView *)self _contentViewListStyleFromLayoutAttributes:v6];
  v27.receiver = self;
  v27.super_class = (Class)UICollectionViewCell;
  [(UICollectionReusableView *)&v27 _setLayoutAttributes:v4];
  [(UICollectionViewCell *)self _restoreCurrentDragAppearanceIfNeeded];
  [(UICollectionViewCell *)self _updateUserInterfaceRenderingModeUsingAttributes:v4];
  if (v12) {
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
  uint64_t v14 = -[UICollectionViewLayoutAttributes _existingListAttributes](v4);
  v15 = (void *)v14;
  if (v14)
  {
    unint64_t v16 = *(void *)(v14 + 16);
    BOOL v17 = v16 > 4;
    unsigned int v18 = (0x19u >> v16) & 1;
    if (v17) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = v18;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  [(UICollectionViewCell *)self _setUsesAnyPlainListStyle:v19];
  int64_t v20 = [(UICollectionReusableView *)self _contentViewListStyleFromLayoutAttributes:v4];
  if (v13 == v20)
  {
    if ((*(_DWORD *)&self->_collectionCellFlags & 0x200) != 0) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  int64_t v21 = v20;
  if (objc_opt_respondsToSelector()) {
    [(UIView *)self->_contentView _containingListStyleUpdated:v21];
  }
  lastNormalBackgroundViewConfiguration = self->_lastNormalBackgroundViewConfiguration;
  self->_lastNormalBackgroundViewConfiguration = 0;

  int v23 = *(_DWORD *)&self->_collectionCellFlags | 0x800000;
  self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)v23;
  if ((v23 & 0x200) == 0)
  {
LABEL_22:
    unint64_t v24 = [(UICollectionViewCell *)self _effectiveMaskedCornersForSystemBackgroundView];
    v25 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
    v26 = v25;
    if (v25 && objc_msgSend(v25, "__maskedCorners") != v24) {
      [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
    }
  }
LABEL_26:
  if (dyld_program_sdk_at_least())
  {
    [(UIView *)self->_contentView bounds];
    if (CGRectEqualToRect(v28, *MEMORY[0x1E4F1DB28])) {
      [(UICollectionViewCell *)self _layoutContentView];
    }
  }
}

- (unint64_t)_effectiveMaskedCornersForSystemBackgroundView
{
  uint64_t v3 = [(UICollectionReusableView *)self _layoutAttributes];
  uint64_t v4 = -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)v3);
  uint64_t v5 = (void *)v4;
  if (v4 && (*(unsigned char *)(v4 + 8) & 2) != 0) {
    unint64_t v6 = *(void *)(v4 + 24);
  }
  else {
    unint64_t v6 = [(UICollectionViewCell *)self _maskedCornersForSystemBackgroundView];
  }
  if (v3)
  {
    unint64_t v7 = *(unsigned __int16 *)(v3 + 288);
    if ((v7 & 0x10) != 0) {
      v6 |= (v7 >> 5) & 0xF;
    }
  }

  return v6;
}

- (unint64_t)_maskedCornersForSystemBackgroundView
{
  uint64_t v2 = [(UICollectionReusableView *)self _layoutAttributes];
  if (v2)
  {
    unint64_t v3 = v2[144];
    if ((v3 & 0x10) != 0) {
      unint64_t v4 = (v3 >> 5) & 0xF;
    }
    else {
      unint64_t v4 = 15;
    }
  }
  else
  {
    unint64_t v4 = 15;
  }

  return v4;
}

- (void)_setUsesAnyPlainListStyle:(BOOL)a3
{
  if (((((*((unsigned char *)&self->_collectionCellFlags + 1) & 1) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    [(UICollectionViewCell *)self _prepareForConfigurationStateUpdate];
    if (v3) {
      int v5 = 256;
    }
    else {
      int v5 = 0;
    }
    self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFEFF | v5);
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)_updateUserInterfaceRenderingModeUsingAttributes:(id)a3
{
  unint64_t v6 = (id *)a3;
  unint64_t v4 = -[UICollectionViewLayoutAttributes _existingListAttributes](v6);
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = 0;
  if (v6 && v4[2] == 2)
  {
    if (((_WORD)v6[36] & 1) == 0)
    {
LABEL_5:
      uint64_t v5 = 0;
      goto LABEL_7;
    }
    uint64_t v5 = [(UICollectionReusableView *)self _isStyledAsHeaderOrFooterFromLayoutAttributes:"_isStyledAsHeaderOrFooterFromLayoutAttributes:"] ^ 1;
  }
LABEL_7:
  [(UIView *)self _setOverrideUserInterfaceRenderingMode:v5];
}

- (void)_restoreCurrentDragAppearanceIfNeeded
{
  unint64_t dragAppearance = self->_dragAppearance;
  if (dragAppearance)
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __61__UICollectionViewCell__restoreCurrentDragAppearanceIfNeeded__block_invoke;
      v4[3] = &unk_1E52D9CD0;
      v4[4] = self;
      v4[5] = dragAppearance;
      +[UIView performWithoutAnimation:v4];
    }
    else
    {
      [(UICollectionViewCell *)self _setDragAppearance:dragAppearance];
    }
  }
}

- (BOOL)_usesAnyPlainListStyle
{
  return *((unsigned char *)&self->_collectionCellFlags + 1) & 1;
}

- (BOOL)_isSwiped
{
  return (*(unsigned char *)&self->_collectionCellFlags >> 3) & 1;
}

- (BOOL)_isReordering
{
  return (*(unsigned char *)&self->_collectionCellFlags >> 4) & 1;
}

- (int64_t)_dropState
{
  return self->__dropState;
}

- (int64_t)_contextMenuGroupLocation
{
  return *(_DWORD *)&self->_collectionCellFlags >> 5;
}

- (BOOL)_appliesLayoutAttributesMaskingToReusableView
{
  if ([(UICollectionViewCell *)self _appliesLayoutAttributesMaskingToBackgroundConfiguration])
  {
    return ![(UICollectionViewCell *)self _usingBackgroundViewConfiguration];
  }
  else
  {
    return 1;
  }
}

- (BOOL)_appliesLayoutAttributesMaskingToBackgroundConfiguration
{
  if ((*(_DWORD *)&self->_collectionCellFlags & 0x10) == 0) {
    return (*(_DWORD *)&self->_collectionCellFlags & 0xE0) != 0;
  }
  unint64_t v4 = [(UIView *)self traitCollection];
  BOOL v2 = [v4 userInterfaceIdiom] != 6 || (*(unsigned char *)&self->_collectionCellFlags & 0xE0) != 0;

  return v2;
}

- (void)setNeedsUpdateConfiguration
{
  if (([(id)objc_opt_class() _isInternalCell] & 1) != 0 || dyld_program_sdk_at_least())
  {
    *(_DWORD *)&self->_collectionCellFlags |= 0x200u;
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      [(UICollectionViewCell *)self _performConfigurationStateUpdate];
    }
    else
    {
      [(UIView *)self setNeedsLayout];
    }
  }
}

+ (BOOL)_isInternalCell
{
  return 0;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCell;
  unint64_t v4 = (UIView *)a3;
  [(UIView *)&v6 _intrinsicContentSizeInvalidatedForChildView:v4];
  contentView = self->_contentView;

  if (contentView == v4) {
    [(UICollectionReusableView *)self invalidateIntrinsicContentSize];
  }
}

- (BOOL)_usingBackgroundViewConfiguration
{
  return self->_systemBackgroundView || self->_backgroundViewConfigurationProvider != 0;
}

- (void)_executeConfigurationUpdate
{
  if (a1)
  {
    BOOL v2 = (void *)_UISetCurrentFallbackEnvironment(a1);
    BOOL v3 = [a1 configurationState];
    memset(__src, 0, sizeof(__src));
    _UIBeginTrackingTraitUsage(a1, 0, __src);
    [a1 _updateBackgroundViewConfigurationForState:v3];
    [a1 _updateContentViewConfigurationForState:v3];
    [a1 _updateConfigurationUsingState:v3];
    objc_msgSend(a1, "_updateViewConfigurationsWithState:", objc_msgSend(a1, "_viewConfigurationState"));
    [a1 updateConfigurationUsingState:v3];
    [a1 _bridgedUpdateConfigurationUsingState:v3];
    uint64_t v4 = [a1 configurationUpdateHandler];
    uint64_t v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t, _DWORD *, void *))(v4 + 16))(v4, a1, v3);
    }
    memcpy(v8, __src, sizeof(v8));
    objc_super v6 = (char *)GetTraitCollectionTSD() + 16;
    memcpy(__dst, v6, sizeof(__dst));
    memcpy(v6, v8, 0x160uLL);
    -[UIView _recordTraitUsage:insideMethod:withInvalidationAction:](a1, (uint64_t)&__dst[136], [a1 methodForSelector:sel_updateConfigurationUsingState_], sel_setNeedsUpdateConfiguration);
    double v7 = _UITraitUsageTrackingResultDestroy((uint64_t)__dst);
    a1[146] &= ~0x200000u;
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      [a1 _layoutSystemBackgroundView];
    }
    _UIRestorePreviousFallbackEnvironment(v2);
  }
}

- (UICollectionViewCellConfigurationUpdateHandler)configurationUpdateHandler
{
  return self->_configurationUpdateHandler;
}

- (unint64_t)_viewConfigurationState
{
  BOOL v2 = [(UICollectionViewCell *)self configurationState];
  unint64_t v3 = [v2 _viewConfigurationState];

  return v3;
}

- (void)_updateContentViewConfigurationForState:(id)a3
{
  id v4 = a3;
  contentViewConfigurationProvider = (void (**)(id, unint64_t))self->_contentViewConfigurationProvider;
  if (contentViewConfigurationProvider)
  {
    id v11 = v4;
    objc_super v6 = contentViewConfigurationProvider[2](contentViewConfigurationProvider, [(UICollectionViewCell *)self _viewConfigurationState]);
    [(UICollectionViewCell *)self _setContentViewConfiguration:v6];
LABEL_3:

    id v4 = v11;
    goto LABEL_4;
  }
  if ((*((unsigned char *)&self->_collectionCellFlags + 2) & 2) != 0)
  {
    id v11 = v4;
    if (self->_viewForContentConfiguration)
    {
      objc_super v6 = [(UICollectionViewCell *)self contentConfiguration];
      if (!v6) {
        goto LABEL_3;
      }
      double v7 = self;
      int v8 = v6;
      id v9 = v11;
      uint64_t v10 = 0;
    }
    else
    {
      objc_super v6 = [(UICollectionViewCell *)self _contentViewConfiguration];
      if (!v6) {
        goto LABEL_3;
      }
      double v7 = self;
      int v8 = v6;
      id v9 = v11;
      uint64_t v10 = 1;
    }
    [(UICollectionViewCell *)v7 _applyContentViewConfiguration:v8 withState:v9 usingSPI:v10];
    goto LABEL_3;
  }
LABEL_4:
}

- (void)_updateBackgroundViewConfigurationForState:(id)a3
{
  id v4 = [(UICollectionViewCell *)self _stateForUpdatingBackgroundConfigurationWithState:a3];
  id backgroundViewConfigurationProvider = (void (**)(id, unint64_t))self->_backgroundViewConfigurationProvider;
  if (backgroundViewConfigurationProvider)
  {
    id v7 = v4;
    objc_super v6 = backgroundViewConfigurationProvider[2](backgroundViewConfigurationProvider, [(UICollectionViewCell *)self _viewConfigurationState]);
LABEL_3:
    [(UICollectionViewCell *)self _applyBackgroundViewConfiguration:v6 withState:v7];
LABEL_4:

    id v4 = v7;
    goto LABEL_5;
  }
  if (*((unsigned char *)&self->_collectionCellFlags + 2))
  {
    id v7 = v4;
    objc_super v6 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
LABEL_5:
}

- (id)_stateForUpdatingBackgroundConfigurationWithState:(id)a3
{
  id v4 = a3;
  if ([(UICollectionViewCell *)self _removesHighlightedAndSelectedStatesForBackground])
  {
    uint64_t v5 = (void *)[v4 copy];

    [v5 setHighlighted:0];
    [v5 setSelected:0];
    id v4 = v5;
  }
  return v4;
}

- (id)_bridgedConfigurationState
{
  id v1 = a1;
  id result = objc_msgSend(v1, sel__configurationState);
  if (result)
  {
    unint64_t v3 = result;
    static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(result, (uint64_t)v7);

    id v4 = (void *)v7[0];
    objc_super v6 = (void *)v7[4];
    uint64_t v5 = (void *)sub_1854E88F8();
    swift_bridgeObjectRelease();

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)_applyContentViewConfiguration:(id)a3 withState:(id)a4 usingSPI:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
  if (v9)
  {
    if ((*(_DWORD *)&collectionCellFlags & 0x20000) != 0 && !self->_contentViewConfigurationProvider)
    {
      if (!v10)
      {
        id v11 = [(UICollectionViewCell *)self configurationState];
      }
      v35 = v11;
      if (v5)
      {
        unint64_t v19 = [(UICollectionViewCell *)self _viewConfigurationState];
        int64_t v20 = [(UIView *)self traitCollection];
        int64_t v13 = [v9 updatedConfigurationForState:v19 traitCollection:v20];
      }
      else
      {
        int64_t v13 = [v9 updatedConfigurationForState:v11];
      }
      if (!v13)
      {
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:a2, self, @"UICollectionViewCell.m", 1054, @"Updated configuration was nil for configuration: %@", v9 object file lineNumber description];
      }
      id v11 = v35;
    }
    else
    {
      int64_t v13 = v9;
    }
    id v34 = v11;
    if ((*(_WORD *)&collectionCellFlags & 0x400) == 0)
    {
      *(_DWORD *)&self->_collectionCellFlags |= 0x400u;
      if (!v5)
      {
LABEL_43:
        objc_super v27 = [v13 makeContentView];
        objc_storeStrong((id *)&self->_viewForContentConfiguration, v27);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v29 = [(_UIContentViewInternal *)self->_viewForContentConfiguration _wrappedContentView];

          objc_super v27 = (void *)v29;
        }
        goto LABEL_45;
      }
      goto LABEL_39;
    }
    viewForContentConfiguration = self->_viewForContentConfiguration;
    if (!viewForContentConfiguration) {
      viewForContentConfiguration = self->_contentView;
    }
    id v15 = v13;
    id v16 = viewForContentConfiguration;
    if (objc_opt_respondsToSelector())
    {
      int v17 = [v16 supportsConfiguration:v15];
    }
    else
    {
      v33 = a2;
      unsigned int v18 = [v16 configuration];

      id v16 = v18;
      if (v16)
      {
        if (objc_opt_respondsToSelector())
        {
          [v16 _wrappedConfigurationIdentifier];
        }
        else
        {
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
        int64_t v21 = };
      }
      else
      {
        int64_t v21 = 0;
      }

      id v23 = v15;
      if (v23)
      {
        if (objc_opt_respondsToSelector())
        {
          [v23 _wrappedConfigurationIdentifier];
        }
        else
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
        unint64_t v24 = };
      }
      else
      {
        unint64_t v24 = 0;
      }

      int v17 = [v21 isEqualToString:v24];
      a2 = v33;
    }

    *(_DWORD *)&self->_collectionCellFlags |= 0x400u;
    if (!v17)
    {
      if (!v5)
      {
        CGRect v28 = [(_UIContentViewInternal *)self->_viewForContentConfiguration configuration];
        UIContentConfigurationAlertForReplacedContentView(@"cell", self, v28, v15, @"Use separate registrations or reuse identifiers for different types of cells to avoid this.");

        goto LABEL_43;
      }
LABEL_39:
      objc_super v27 = [v13 createContentView];
LABEL_45:
      if (!v27)
      {
        v30 = [MEMORY[0x1E4F28B00] currentHandler];
        [v30 handleFailureInMethod:a2, self, @"UICollectionViewCell.m", 1084, @"Content configuration returned a nil content view: %@", v13 object file lineNumber description];
      }
      if (([v27 translatesAutoresizingMaskIntoConstraints] & 1) == 0)
      {
        v31 = [MEMORY[0x1E4F28B00] currentHandler];
        [v31 handleFailureInMethod:a2, self, @"UICollectionViewCell.m", 1085, @"The content view returned from the content configuration must have translatesAutoresizingMaskIntoConstraints enabled: %@", v27 object file lineNumber description];
      }
      [(UICollectionViewCell *)self setContentView:v27];

      goto LABEL_50;
    }
    if (v5) {
      contentView = self->_contentView;
    }
    else {
      contentView = self->_viewForContentConfiguration;
    }
    [contentView setConfiguration:v15];
    int64_t v13 = v15;
  }
  else
  {
    self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFFFFFBFF);
    if ((*(_WORD *)&collectionCellFlags & 0x400) == 0) {
      goto LABEL_51;
    }
    id v34 = v10;
    [(UICollectionViewCell *)self setContentView:0];
    int64_t v13 = self->_viewForContentConfiguration;
    self->_viewForContentConfiguration = 0;
  }
LABEL_50:

  id v11 = v34;
LABEL_51:
}

- (BOOL)_removesHighlightedAndSelectedStatesForBackground
{
  return 0;
}

- (id)_contentViewConfiguration
{
  if ((*((unsigned char *)&self->_collectionCellFlags + 1) & 4) != 0 && !self->_viewForContentConfiguration)
  {
    BOOL v2 = [(UIView *)self->_contentView configuration];
  }
  else
  {
    BOOL v2 = 0;
  }
  return v2;
}

- (id)contentConfiguration
{
  if ((*((unsigned char *)&self->_collectionCellFlags + 1) & 4) != 0)
  {
    viewForContentConfiguration = self->_viewForContentConfiguration;
    if (viewForContentConfiguration)
    {
      viewForContentConfiguration = [viewForContentConfiguration configuration];
    }
  }
  else
  {
    viewForContentConfiguration = 0;
  }
  return viewForContentConfiguration;
}

- (UIView)_existingContentView
{
  return self->_contentView;
}

- (void)_bridgedUpdateConfigurationUsingState:(void *)a3
{
  sub_1854E808C(a3, (uint64_t)v5);
  unint64_t v3 = (void *)v5[0];
  id v4 = (id)v5[4];
  swift_bridgeObjectRelease();
}

- (void)_applyBackgroundViewConfiguration:(id)a3 withState:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  id v8 = a4;
  id v9 = v8;
  systemBackgroundView = self->_systemBackgroundView;
  int v11 = systemBackgroundView != 0;
  if (v7)
  {
    if ((*((unsigned char *)&self->_collectionCellFlags + 2) & 1) != 0 && !self->_backgroundViewConfigurationProvider)
    {
      if (!v8)
      {
        v33 = [(UICollectionViewCell *)self configurationState];
        id v9 = [(UICollectionViewCell *)self _stateForUpdatingBackgroundConfigurationWithState:v33];
      }
      id v36 = [(id)v7 _updatedConfigurationForState:v9];
      if (!v36)
      {
        id v34 = [MEMORY[0x1E4F28B00] currentHandler];
        [v34 handleFailureInMethod:a2, self, @"UICollectionViewCell.m", 1987, @"Updated configuration was nil for configuration: %@", v7 object file lineNumber description];
      }
      id v12 = v36;
    }
    else
    {
      id v12 = (id)v7;
    }
    id v35 = v12;
    if (systemBackgroundView)
    {
      int64_t v13 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
      uint64_t v14 = [(UIView *)self tintColor];
      int v11 = [v35 _backgroundFillIsEqual:v13 withTintColor:v14] ^ 1;
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    id v35 = 0;
  }
  objc_msgSend(v35, "__setMaskedCorners:", -[UICollectionViewCell _effectiveMaskedCornersForSystemBackgroundView](self, "_effectiveMaskedCornersForSystemBackgroundView"));
  if (v7)
  {
    if (![(UICollectionViewCell *)self _appliesLayoutAttributesMaskingToBackgroundConfiguration])goto LABEL_19; {
    uint64_t v15 = [(UICollectionReusableView *)self _layoutAttributes];
    }
    id v16 = (void *)v15;
    if (v15)
    {
      if ((*(_WORD *)(v15 + 288) & 0x10) != 0)
      {
        int v17 = [(UICollectionReusableView *)self _layoutAttributes];
        if (v17)
        {
          double v18 = v17[39];

          if (v18 <= 0.0) {
            goto LABEL_19;
          }
          uint64_t v19 = [(UICollectionReusableView *)self _layoutAttributes];
          id v16 = (void *)v19;
          if (v19) {
            double v20 = *(double *)(v19 + 312);
          }
          else {
            double v20 = 0.0;
          }
          [v35 _setCornerRadius:v20];
        }
      }
    }

LABEL_19:
    if (systemBackgroundView)
    {
      [(_UISystemBackgroundView *)self->_systemBackgroundView setConfiguration:v35];
      [(UIView *)self setNeedsLayout];
    }
    else
    {
      [(UICollectionViewCell *)self _resetBackgroundViewsAndColor];
      v22 = [[_UISystemBackgroundView alloc] initWithConfiguration:v35];
      id v23 = self->_systemBackgroundView;
      self->_systemBackgroundView = v22;

      uint64_t v24 = [(_UIFloatingContentView *)self->_focusedFloatingContentView contentView];
      v25 = (void *)v24;
      if (v24) {
        v26 = (UICollectionViewCell *)v24;
      }
      else {
        v26 = self;
      }
      objc_super v27 = v26;

      [(UIView *)v27 insertSubview:self->_systemBackgroundView atIndex:0];
      [(UIView *)self setNeedsLayout];
    }
    if (![(UICollectionViewCell *)self isHighlighted]
      && ![(UICollectionViewCell *)self isSelected]
      && ![(UICollectionViewCell *)self isFocused])
    {
      CGRect v28 = (_UIBackgroundConfigurationInternal *)[v35 copyWithZone:0];
      lastNormalBackgroundViewConfiguration = self->_lastNormalBackgroundViewConfiguration;
      self->_lastNormalBackgroundViewConfiguration = v28;
    }
    goto LABEL_32;
  }
  if (systemBackgroundView)
  {
    [(UIView *)self->_systemBackgroundView removeFromSuperview];
    int64_t v21 = self->_systemBackgroundView;
    self->_systemBackgroundView = 0;
  }
LABEL_32:
  if (v11)
  {
    v30 = [(UICollectionReusableView *)self _collectionView];
    [v30 _cellBackgroundChangedForSelectionOrHighlight:self];
  }
  unint64_t v31 = v7 | (unint64_t)systemBackgroundView;
  v32 = [(UICollectionReusableView *)self _layoutAttributes];
  [(UICollectionReusableView *)self _updateMaskingUsingAttributes:v32];

  if (v31)
  {
    *(_DWORD *)&self->_collectionCellFlags |= 0x1000000u;
    [(UIView *)self setNeedsLayout];
  }
}

- (UIView)contentView
{
  if (!self->_contentView && dyld_program_sdk_at_least())
  {
    unint64_t v3 = objc_opt_class();
    [(UIView *)self bounds];
    id v4 = objc_msgSend(v3, "_createDefaultContentViewWithFrame:");
    [(UICollectionViewCell *)self _setContentView:v4 addToHierarchy:1];
  }
  contentView = self->_contentView;
  return contentView;
}

- (UICollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewCell;
  unint64_t v3 = -[UICollectionReusableView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (!dyld_program_sdk_at_least()
      || [(id)objc_opt_class() _subclassOverridesContentViewClass])
    {
      id v4 = objc_opt_class();
      [(UIView *)v3 bounds];
      BOOL v5 = objc_msgSend(v4, "_createDefaultContentViewWithFrame:");
      [(UICollectionViewCell *)v3 setContentView:v5];
    }
    *(_DWORD *)&v3->_collectionCellFlags |= 0x200u;
    *(_DWORD *)&v3->_collectionCellFlags |= 0x10000u;
    *(_DWORD *)&v3->_collectionCellFlags |= 0x20000u;
  }
  return v3;
}

+ (BOOL)_subclassOverridesContentViewClass
{
  if (qword_1EB2588C0 != -1) {
    dispatch_once(&qword_1EB2588C0, &__block_literal_global_113);
  }
  uint64_t v3 = [a1 methodForSelector:sel__contentViewClass];
  if (v3) {
    BOOL v4 = v3 == qword_1EB2588B8;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (void)setContentView:(id)a3
{
}

+ (id)_createDefaultContentViewWithFrame:(CGRect)a3
{
  uint64_t v3 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_contentViewClass")), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (dyld_program_sdk_at_least()) {
    [v3 _setHostsLayoutEngine:1];
  }
  return v3;
}

- (void)_setAutomaticIntrinsicContentSizeInvalidationEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewCell;
  -[UICollectionReusableView _setAutomaticIntrinsicContentSizeInvalidationEnabled:](&v8, sel__setAutomaticIntrinsicContentSizeInvalidationEnabled_);
  contentView = self->_contentView;
  if (contentView)
  {
    p_viewFlags = &contentView->_viewFlags;
    uint64_t v7 = 512;
    if (!a3 || (*(void *)p_viewFlags & 0x20000000000000) != 0) {
      uint64_t v7 = 0;
    }
    *((void *)p_viewFlags + 1) = v7 | *((void *)p_viewFlags + 1) & 0xFFFFFFFFFFFFFDFFLL;
  }
}

- (void)_setContentView:(id)a3 addToHierarchy:(BOOL)a4
{
  BOOL v4 = a4;
  p_contentView = &self->_contentView;
  double v18 = (UIView *)a3;
  if (*p_contentView != v18)
  {
    if (v4)
    {
      -[UICollectionViewCell _clearChangeHandlersForOldContentView:](self, "_clearChangeHandlersForOldContentView:");
      if (*p_contentView)
      {
        *((void *)&(*p_contentView)->_viewFlags + 1) &= ~0x200uLL;
        objc_super v8 = *p_contentView;
      }
      else
      {
        objc_super v8 = 0;
      }
      [(UIView *)v8 removeFromSuperview];
      menuGesture = self->_menuGesture;
      self->_menuGesture = 0;
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    [(UIView *)v18 setSemanticContentAttribute:[(UIView *)self semanticContentAttribute]];
    if (v18 && v4)
    {
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        [(UIView *)self bounds];
        -[UIView setFrame:](v18, "setFrame:");
        [(UIView *)v18 setAutoresizingMask:18];
      }
      uint64_t v10 = [(_UIFloatingContentView *)self->_focusedFloatingContentView contentView];
      int v11 = (void *)v10;
      if (v10) {
        id v12 = (UICollectionViewCell *)v10;
      }
      else {
        id v12 = self;
      }
      int64_t v13 = v12;

      [(UIView *)v13 addSubview:v18];
      BOOL v14 = (*(void *)&v18->_viewFlags & 0x20000000000000) == 0 && *(_WORD *)&self->super._reusableViewFlags < 0;
      uint64_t v15 = 512;
      if (!v14) {
        uint64_t v15 = 0;
      }
      *((void *)&v18->_viewFlags + 1) = v15 | *((void *)&v18->_viewFlags + 1) & 0xFFFFFFFFFFFFFDFFLL;
      -[UICollectionViewCell _setupChangeHandlersForNewContentView:](self, "_setupChangeHandlersForNewContentView:");
      if ([(id)objc_opt_class() _wantsLegacyMenuGesture])
      {
        id v16 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel__handleMenuGesture_];
        int v17 = self->_menuGesture;
        self->_menuGesture = v16;

        [(UIGestureRecognizer *)self->_menuGesture setDelegate:self];
        [(UILongPressGestureRecognizer *)self->_menuGesture setMinimumPressDuration:0.5];
        [(UIView *)v18 addGestureRecognizer:self->_menuGesture];
      }
    }
  }
}

+ (BOOL)_wantsLegacyMenuGesture
{
  return 1;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewCell;
  -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(UIView *)self->_contentView setSemanticContentAttribute:a3];
}

- (void)_clearChangeHandlersForOldContentView:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [v4 _setPopupMenuButtonDidChangeHandler:0];
    [(UICollectionViewCell *)self _setPopupMenuButton:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 _setContainerBackgroundViewDidChangeHandler:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 _containerViewIsHiddenForReuse:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 _containingListStyleUpdated:-1];
  }
}

- (void)_setupChangeHandlersForNewContentView:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__UICollectionViewCell__setupChangeHandlersForNewContentView___block_invoke;
    v9[3] = &unk_1E52DC308;
    objc_copyWeak(&v10, &location);
    [v4 _setPopupMenuButtonDidChangeHandler:v9];
    [(UICollectionViewCell *)self _updatePopupMenuButtonFromContentView];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__UICollectionViewCell__setupChangeHandlersForNewContentView___block_invoke_2;
    v7[3] = &unk_1E52DC308;
    objc_copyWeak(&v8, &location);
    [v4 _setContainerBackgroundViewDidChangeHandler:v7];
    if ([(UICollectionViewCell *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration])
    {
      [(UICollectionViewCell *)self _updateDefaultBackgroundAppearance];
    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  if (objc_opt_respondsToSelector()) {
    [v4 _containerViewIsHiddenForReuse:(*(_WORD *)&self->super._reusableViewFlags & 0x400) == 0];
  }
  if (objc_opt_respondsToSelector())
  {
    objc_super v5 = [(UICollectionReusableView *)self _layoutAttributes];
    int64_t v6 = [(UICollectionReusableView *)self _contentViewListStyleFromLayoutAttributes:v5];

    [v4 _containingListStyleUpdated:v6];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (((((*(unsigned char *)&self->_collectionCellFlags & 4) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    [(UICollectionViewCell *)self _prepareForConfigurationStateUpdate];
    if (v3) {
      int v5 = 4;
    }
    else {
      int v5 = 0;
    }
    self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFFFB | v5);
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (BOOL)canBeEdited
{
  return dyld_program_sdk_at_least();
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_usingBackgroundConfigurationOrDefaultBackgroundConfiguration
{
  if ([(UICollectionViewCell *)self _usingBackgroundViewConfiguration]) {
    return 1;
  }
  if ((*(_DWORD *)&self->_collectionCellFlags & 0xD800) != 0) {
    return 0;
  }
  return (*(_DWORD *)&self->_collectionCellFlags & 0x2000) == 0;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __106__UICollectionViewCell_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke;
  v62[3] = &unk_1E52D9F70;
  v62[4] = self;
  +[UIView performWithoutAnimation:v62];
  [(UICollectionViewCell *)self _contentViewInset];
  double v11 = v10;
  double v13 = v12;
  double v59 = v14;
  double v16 = v15;
  if ((*((unsigned char *)&self->_collectionCellFlags + 1) & 4) == 0
    || ![(UIView *)self->_contentView translatesAutoresizingMaskIntoConstraints])
  {
    char v26 = dyld_program_sdk_at_least();
    contentView = self;
    if ((v26 & 1) == 0) {
      contentView = (UICollectionViewCell *)self->_contentView;
    }
    CGRect v28 = contentView;
    if (-[UIView _wantsAutolayoutOrIsGuardingForEngineHosting]((uint64_t)v28)) {
      int v29 = 1;
    }
    else {
      int v29 = [(id)objc_opt_class() requiresConstraintBasedLayout];
    }
    if (-[UIView _wantsAutolayoutOrIsGuardingForEngineHosting]((uint64_t)self->_contentView)) {
      int v32 = 1;
    }
    else {
      int v32 = [(id)objc_opt_class() requiresConstraintBasedLayout];
    }
    if (v28 == self && v32)
    {
      if (!v29
        || (CGRect v28 = self,
            [(UIView *)self->_contentView translatesAutoresizingMaskIntoConstraints])&& (![(UIView *)self needsUpdateConstraints]|| (CGRect v28 = self, dyld_program_sdk_at_least())&& (CGRect v28 = self, [(UIView *)self->_contentView _hostsLayoutEngine])))
      {
        int has_internal_diagnostics = os_variant_has_internal_diagnostics();
        BOOL v34 = [(UIView *)self->_contentView translatesAutoresizingMaskIntoConstraints];
        if (has_internal_diagnostics)
        {
          if (!v34)
          {
            v56 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v64 = self;
              _os_log_fault_impl(&dword_1853B0000, v56, OS_LOG_TYPE_FAULT, "contentView of collectionViewCell has translatesAutoresizingMaskIntoConstraints false and is missing constraints to the cell, which will cause substandard performance in cell autosizing. Please leave the contentView's translatesAutoresizingMaskIntoConstraints true or else provide constraints between the contentView and the cell. %@", buf, 0xCu);
            }
          }
        }
        else if (!v34)
        {
          v57 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2588D8) + 8);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v64 = self;
            _os_log_impl(&dword_1853B0000, v57, OS_LOG_TYPE_ERROR, "contentView of collectionViewCell has translatesAutoresizingMaskIntoConstraints false and is missing constraints to the cell, which will cause substandard performance in cell autosizing. Please leave the contentView's translatesAutoresizingMaskIntoConstraints true or else provide constraints between the contentView and the cell. %@", buf, 0xCu);
          }
        }
        if ([(UIView *)self->_contentView translatesAutoresizingMaskIntoConstraints])
        {
          [(UIView *)self->_contentView _setHostsLayoutEngine:1];
        }
        CGRect v28 = self->_contentView;
      }
    }
    else if (!v29)
    {
      goto LABEL_47;
    }
    if (dyld_program_sdk_at_least())
    {
      self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFEFFFFF | ((v28 == (UICollectionViewCell *)self->_contentView) << 20));
      if (!_UIEngineHostingViewsShouldGuardWantsAutolayoutFlagPropagation()
        || (-[UIView _usesLayoutEngineHostingConstraints]((uint64_t)v28) & 1) == 0)
      {
        [(UIView *)v28 _setWantsAutolayout];
      }
      buf[0] = 1;
      if ((dyld_program_sdk_at_least() & 1) == 0
        && (!dyld_program_sdk_at_least() || v13 == 0.0 && v11 == 0.0 && v16 == 0.0 && v59 == 0.0))
      {
        [(UIView *)v28 frame];
        double v37 = CGRectGetWidth(v68);
      }
      else
      {
        double v37 = width;
        if (v28 == (UICollectionViewCell *)self->_contentView)
        {
          *(float *)&double v35 = a4;
          *(float *)&double v36 = a5;
          -[UICollectionViewCell _contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:](self, "_contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:", 0, width, height, v35, v36);
          if (v38 == 0.0 && a5 == 50.0) {
            v40 = buf;
          }
          else {
            v40 = 0;
          }
          -[UIView _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:](v28, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:", v40);
          double v24 = v41 - (-v16 - v13);
          double v25 = v42 - (-v59 - v11);
LABEL_61:
          if (v25 == 0.0 && !buf[0])
          {
            -[UICollectionViewCell sizeThatFits:](self, "sizeThatFits:", width, height);
            double v24 = v49;
            double v25 = v50;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __106__UICollectionViewCell_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke_328;
            block[3] = &unk_1E52D9F70;
            block[4] = self;
            if (qword_1EB2588E0 != -1) {
              dispatch_once(&qword_1EB2588E0, block);
            }
          }
          goto LABEL_65;
        }
      }
      if (a5 == 50.0 && height == 0.0) {
        v46 = buf;
      }
      else {
        v46 = 0;
      }
      *(float *)&double v35 = a4;
      *(float *)&double v36 = a5;
      -[UIView _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:](v28, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:", v46, v37, height, v35, v36);
      double v24 = v47;
      double v25 = v48;
      goto LABEL_61;
    }
LABEL_47:
    v60.receiver = self;
    v60.super_class = (Class)UICollectionViewCell;
    *(float *)&double v30 = a4;
    *(float *)&double v31 = a5;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v60, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v30, v31);
    double v24 = v43;
    double v25 = v44;
LABEL_65:

    goto LABEL_66;
  }
  double v17 = width;
  double v18 = v11;
  double v58 = v17;
  -[UICollectionViewCell _contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:](self, "_contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:", 1);
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  double v20 = v19;
  double v22 = v21;
  id v23 = self->_contentView;
  if (a4 != 1000.0 && v20 > 2777777.0 || a5 != 1000.0 && v22 > 2777777.0)
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    v54 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UIContentViewAssertValidFittingSize(UIView * _Nonnull __strong, CGSize, UILayoutPriority, UILayoutPriority)");
    v66.double width = v20;
    v66.double height = v22;
    v55 = NSStringFromCGSize(v66);
    [v53 handleFailureInFunction:v54, @"_UIContentViewShared.h", 66, @"Content view returned an invalid size %@ from -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority: which is not allowed. If you have implemented a custom content view, you need to add constraints inside it so that its size is not ambiguous, or you need to manually compute and return a valid size. Content view: %@", v55, v23 file lineNumber description];
  }
  if (a4 >= 1000.0) {
    double v24 = v58;
  }
  else {
    double v24 = v20 - (-v16 - v13);
  }
  if (a5 >= 1000.0) {
    double v25 = height;
  }
  else {
    double v25 = v22 - (-v59 - v18);
  }
LABEL_66:
  double v51 = v24;
  double v52 = v25;
  result.double height = v52;
  result.double width = v51;
  return result;
}

- (CGSize)_contentTargetSizeForTargetSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5 forUseWithSizeThatFits:(BOOL)a6
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [(UICollectionViewCell *)self _contentViewInset];
  double v14 = v13;
  double v16 = v15;
  double v17 = width - (v11 + v12);
  double v25 = height;
  double v18 = height - (v13 + v15);
  if (v17 < 0.0)
  {
    double v19 = v11;
    double v17 = 0.0;
    if (a4 >= 1000.0)
    {
      double v20 = v12;
      double v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("CollectionView", &qword_1EB2588C8) + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        double v28 = v19;
        __int16 v29 = 2048;
        double v30 = v20;
        __int16 v31 = 2048;
        double v32 = width;
        __int16 v33 = 2112;
        BOOL v34 = self;
        _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "The cell's content view insets (left: %g, right: %g) exceed the cell's target width of %g with required fitting priority. Cell: %@", buf, 0x2Au);
      }
    }
  }
  if (v18 < 0.0)
  {
    double v18 = 0.0;
    if (a5 >= 1000.0)
    {
      double v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("CollectionView", &qword_1EB2588D0) + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        double v28 = v14;
        __int16 v29 = 2048;
        double v30 = v16;
        __int16 v31 = 2048;
        double v32 = v25;
        __int16 v33 = 2112;
        BOOL v34 = self;
        _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "The cell's content view insets (top: %g, bottom: %g) exceed the cell's target height of %g with required fitting priority. Cell: %@", buf, 0x2Au);
      }
    }
  }
  double v23 = 1.79769313e308;
  if (a5 < 1000.0 && a6) {
    double v24 = 1.79769313e308;
  }
  else {
    double v24 = v18;
  }
  if (a4 >= 1000.0 || !a6) {
    double v23 = v17;
  }
  result.double height = v24;
  result.double width = v23;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewCell;
  [(UIView *)&v5 layoutSubviews];
  [(UICollectionViewCell *)self _performConfigurationStateUpdate];
  [(UICollectionViewCell *)self _layoutSystemBackgroundView];
  [(UICollectionViewCell *)self _layoutFocusedFloatingContentView];
  if (dyld_program_sdk_at_least()) {
    [(UICollectionViewCell *)self _layoutContentView];
  }
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
  if ((*(_DWORD *)&collectionCellFlags & 0x1000000) != 0)
  {
    self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFEFFFFFF);
    id v4 = [(UIView *)self _focusSystemSceneComponent];
    [v4 _requestFocusEffectUpdateToEnvironment:self];
  }
}

- (void)_layoutContentView
{
  if ([(UIView *)self->_contentView translatesAutoresizingMaskIntoConstraints]|| (dyld_program_sdk_at_least() & 1) == 0)
  {
    [(UIView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(UICollectionViewCell *)self _contentViewInset];
    contentView = self->_contentView;
    -[UIView setFrame:](contentView, "setFrame:", v4 + v12, v6 + v11, v8 - (v12 + v14), v10 - (v11 + v13));
  }
}

- (void)_performConfigurationStateUpdate
{
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
  if ((*(_WORD *)&collectionCellFlags & 0x200) != 0)
  {
    self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFFFFFDFF);
    if (_UIObservationTrackingEnabled())
    {
      [(UICollectionViewCell *)self _updateConfigurationWithObservationTracking];
    }
    else
    {
      -[UICollectionViewCell _executeConfigurationUpdate](self);
    }
  }
}

- (UIEdgeInsets)_contentViewInset
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_layoutFocusedFloatingContentView
{
  [(UIView *)self bounds];
  focusedFloatingContentView = self->_focusedFloatingContentView;
  -[_UIFloatingContentView setFrame:](focusedFloatingContentView, "setFrame:");
}

- (void)_layoutSystemBackgroundView
{
  systemBackgroundView = self->_systemBackgroundView;
  if (systemBackgroundView)
  {
    [(_UISystemBackgroundView *)systemBackgroundView frameInContainerView:self];
    -[_UISystemBackgroundView setFrame:](self->_systemBackgroundView, "setFrame:");
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      double v4 = self->_systemBackgroundView;
      [(UIView *)v4 layoutIfNeeded];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __37__UICollectionViewCell_sizeThatFits___block_invoke;
  v22[3] = &unk_1E52D9F70;
  v22[4] = self;
  +[UIView performWithoutAnimation:v22];
  if ((*((unsigned char *)&self->_collectionCellFlags + 1) & 4) != 0)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __37__UICollectionViewCell_sizeThatFits___block_invoke_2;
    v21[3] = &unk_1E52D9F70;
    v21[4] = self;
    +[UIView performWithoutAnimation:v21];
    if (width == 0.0) {
      *(float *)&double v8 = 50.0;
    }
    else {
      *(float *)&double v8 = 1000.0;
    }
    if (height == 0.0) {
      *(float *)&double v9 = 50.0;
    }
    else {
      *(float *)&double v9 = 1000.0;
    }
    -[UICollectionViewCell _contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:](self, "_contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:", 1, width, height, v8, v9);
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
    double v11 = v10;
    double v13 = v12;
    [(UICollectionViewCell *)self _contentViewInset];
    double width = v11 - (-v15 - v16);
    double height = v13 - (-v14 - v17);
  }
  else if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    v20.receiver = self;
    v20.super_class = (Class)UICollectionViewCell;
    -[UIView sizeThatFits:](&v20, sel_sizeThatFits_, width, height);
    double width = v6;
    double height = v7;
  }
  double v18 = width;
  double v19 = height;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (BOOL)_descendantsShouldHighlight
{
  if ((*(unsigned char *)&self->_collectionCellFlags & 2) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(UICollectionViewCell *)self _highlightDescendantsWhenSelected];
    if (v3) {
      LOBYTE(v3) = *(unsigned char *)&self->_collectionCellFlags & 1;
    }
  }
  return v3;
}

- (void)_updateBackgroundView
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__updateHighlightColorsForAnimationHalfwayPoint object:0];
  if ((*(_DWORD *)&self->_collectionCellFlags & 3) != 0) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  BOOL v4 = [(UICollectionViewCell *)self _descendantsShouldHighlight];
  if (v4) {
    [(UICollectionViewCell *)self _setupHighlightingSupport];
  }
  selectedBackgroundView = self->_selectedBackgroundView;
  if (selectedBackgroundView)
  {
    [(UIView *)selectedBackgroundView setAlpha:v3];
    double v6 = [(UICollectionReusableView *)self _collectionView];
    [v6 _cellBackgroundChangedForSelectionOrHighlight:self];
  }
  if (+[UIView _isInAnimationBlock])
  {
    id v10 = +[UIView _currentAnimationAttributes];
    [v10 _delay];
    double v8 = v7;
    [v10 _duration];
    [(UICollectionViewCell *)self performSelector:sel__updateHighlightColorsForAnimationHalfwayPoint withObject:0 afterDelay:(v8 + v9 * 0.5) * UIAnimationDragCoefficient()];
    *(_DWORD *)&self->_collectionCellFlags |= 0x80000u;
  }
  else
  {
    [(UICollectionViewCell *)self _updateHighlightColorsForView:self highlight:v4];
    *(_DWORD *)&self->_collectionCellFlags &= ~0x80000u;
  }
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewCell;
  [(UICollectionReusableView *)&v5 prepareForReuse];
  [(UICollectionViewCell *)self setHighlighted:0];
  [(UICollectionViewCell *)self setSelected:0];
  [(UICollectionViewCell *)self _setContextMenuGroupLocation:0];
  [(UICollectionViewCell *)self _setUsesAnyPlainListStyle:0];
  [(UICollectionViewCell *)self _setSwiped:0];
  [(UICollectionViewCell *)self _setReordering:0];
  [(UICollectionViewCell *)self _setDragAppearance:0];
  [(UICollectionViewCell *)self _setDropState:0];
  if (dyld_program_sdk_at_least())
  {
    [(UIView *)self _removeAllAnimations:1];
  }
  else
  {
    double v3 = [(UIView *)self layer];
    [v3 removeAllAnimations];
  }
  lastNormalBackgroundViewConfiguration = self->_lastNormalBackgroundViewConfiguration;
  self->_lastNormalBackgroundViewConfiguration = 0;

  [(UICollectionViewCell *)self _updateHighlightColorsForView:self highlight:(*(_DWORD *)&self->_collectionCellFlags >> 1) & 1];
  [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
}

- (void)setSelected:(BOOL)selected
{
  BOOL v3 = selected;
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
  if (!selected)
  {
    unsigned int v6 = ((*(_DWORD *)&self->_collectionCellFlags & 3) == 0) ^ ((*(_DWORD *)&self->_collectionCellFlags & 2u) >> 1);
    if ((*(unsigned char *)&collectionCellFlags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  LOBYTE(v6) = (*(_DWORD *)&self->_collectionCellFlags & 3) != 0;
  self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFFFBFFFF);
  if ((*(unsigned char *)&collectionCellFlags & 1) == 0)
  {
LABEL_5:
    [(UICollectionViewCell *)self _prepareForConfigurationStateUpdate];
    self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFFFE | v3 | 0x200000);
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
LABEL_6:
  if ((v6 & 1) == 0) {
    [(UICollectionViewCell *)self _updateBackgroundView];
  }
  [(UICollectionViewCell *)self _updateFocusedFloatingContentControlStateAnimated:+[UIView _isInAnimationBlock]];
  if ([(UICollectionViewCell *)self isFocused]
    && +[UIFocusRingManager focusRingAvailable])
  {
    +[UIFocusRingManager _updateActiveFocusLayers];
  }
}

- (void)_prepareForConfigurationStateUpdate
{
  if ((*(_DWORD *)&self->_collectionCellFlags & 0x2000200) == 0x200)
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __59__UICollectionViewCell__prepareForConfigurationStateUpdate__block_invoke;
      v3[3] = &unk_1E52D9F70;
      v3[4] = self;
      +[UIView performWithoutAnimation:v3];
    }
  }
}

- (void)_updateFocusedFloatingContentControlStateInContext:(id)a3 withAnimationCoordinator:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a3;
  id v8 = a4;
  if ([(UICollectionViewCell *)self _canFocusProgrammatically]) {
    [(UICollectionViewCell *)self _ensureFocusedFloatingContentView];
  }
  if (self->_focusedFloatingContentView)
  {
    if (v14)
    {
      double v9 = [v14 nextFocusedView];
      BOOL v10 = v9 == self;
    }
    else
    {
      BOOL v10 = [(UICollectionViewCell *)self isFocused];
    }
    if (v10) {
      uint64_t v11 = 8;
    }
    else {
      uint64_t v11 = 0;
    }
    if ([(UICollectionViewCell *)self isSelected]) {
      v11 |= 4uLL;
    }
    uint64_t v12 = v11 | [(UICollectionViewCell *)self isHighlighted];
    focusedFloatingContentView = self->_focusedFloatingContentView;
    if (v8) {
      [(_UIFloatingContentView *)focusedFloatingContentView setControlState:v12 withAnimationCoordinator:v8];
    }
    else {
      [(_UIFloatingContentView *)focusedFloatingContentView setControlState:v12 animated:v5];
    }
  }
}

- (void)_updateFocusedFloatingContentControlStateAnimated:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)highlighted
{
  BOOL v3 = highlighted;
  BOOL v5 = [(UICollectionViewCell *)self _highlightDescendantsWhenSelected];
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
  int v7 = *(unsigned char *)&collectionCellFlags & 1;
  if (v3) {
    int v7 = 1;
  }
  BOOL v8 = v7 != ((*(unsigned char *)&collectionCellFlags & 3) != 0);
  if (v5) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = v3 ^ ((*(_DWORD *)&self->_collectionCellFlags & 2u) >> 1);
  }
  if (((((*(_DWORD *)&self->_collectionCellFlags & 2) == 0) ^ v3) & 1) == 0)
  {
    [(UICollectionViewCell *)self _prepareForConfigurationStateUpdate];
    if (v3) {
      int v10 = 2097154;
    }
    else {
      int v10 = 0x200000;
    }
    self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFFFD | v10);
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
  if (v9) {
    [(UICollectionViewCell *)self _updateBackgroundView];
  }
  BOOL v11 = +[UIView _isInAnimationBlock];
  [(UICollectionViewCell *)self _updateFocusedFloatingContentControlStateAnimated:v11];
}

- (BOOL)_highlightDescendantsWhenSelected
{
  return 1;
}

- (BOOL)_canFocusProgrammatically
{
  return 0;
}

- (void)_updateHighlightColorsForView:(id)a3 highlight:(BOOL)a4
{
  if (a4)
  {
    id v6 = a3;
    [(UICollectionViewCell *)self _setupHighlightingSupport];
    [self->_highlightingSupport highlightView:v6];
  }
  else
  {
    [self->_highlightingSupport applyState:1 toView:a3];
  }

  [(UICollectionViewCell *)self _teardownHighlightingSupportIfReady];
}

- (UIView)selectedBackgroundView
{
  return self->_selectedBackgroundView;
}

- (BOOL)_shouldSaveOpaqueStateForView:(id)a3
{
  BOOL v4 = (UIView *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0 && self->_backgroundView != v4 && self->_selectedBackgroundView != v4;

  return v5;
}

- (void)_teardownHighlightingSupportIfReady
{
  if ((*(_DWORD *)&self->_collectionCellFlags & 0x80003) == 0)
  {
    id highlightingSupport = self->_highlightingSupport;
    self->_id highlightingSupport = 0;
  }
}

- (void)_setSwiped:(BOOL)a3
{
  if (((((*(unsigned char *)&self->_collectionCellFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    [(UICollectionViewCell *)self _prepareForConfigurationStateUpdate];
    if (v3) {
      int v5 = 16777224;
    }
    else {
      int v5 = 0x1000000;
    }
    self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFFF7 | v5);
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)_setReordering:(BOOL)a3
{
  if (((((*(unsigned char *)&self->_collectionCellFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    [(UICollectionViewCell *)self _prepareForConfigurationStateUpdate];
    if (v3) {
      int v5 = 16;
    }
    else {
      int v5 = 0;
    }
    self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFFEF | v5);
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)_setDropState:(int64_t)a3
{
  if (self->__dropState != a3)
  {
    [(UICollectionViewCell *)self _prepareForConfigurationStateUpdate];
    self->__dropState = a3;
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)_setDragAppearance:(unint64_t)a3
{
  if (self->_dragAppearance | a3)
  {
    self->_unint64_t dragAppearance = a3;
    [(UICollectionViewLayoutAttributes *)self->super._layoutAttributes alpha];
    double v6 = fmin(v5, 0.5);
    uint64_t v7 = 2;
    if (a3 != 2)
    {
      uint64_t v7 = a3 == 1;
      double v6 = v5;
    }
    BOOL v8 = a3 == 3;
    if (a3 == 3) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v7;
    }
    if (v8) {
      double v10 = v5;
    }
    else {
      double v10 = v6;
    }
    uint64_t v11 = v8;
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled]&& ((v11 | ![(UICollectionReusableView *)self _isHiddenForReordering]) & 1) == 0)
    {
      [(UIView *)self alpha];
      if (v12 > 0.0)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __43__UICollectionViewCell__setDragAppearance___block_invoke;
        v13[3] = &unk_1E52D9F70;
        v13[4] = self;
        +[UIView performWithoutAnimation:v13];
      }
    }
    [(UIView *)self setAlpha:v10];
    [(UICollectionReusableView *)self _setHiddenForReordering:v11];
    [(UICollectionViewCell *)self dragStateDidChange:v9];
  }
}

- (void)_setContextMenuGroupLocation:(int64_t)a3
{
  if (*(_DWORD *)&self->_collectionCellFlags >> 5 != a3)
  {
    char v3 = a3;
    [(UICollectionViewCell *)self _prepareForConfigurationStateUpdate];
    self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFF1F | (32 * (v3 & 7)));
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (BOOL)_isUsingOldStyleMultiselection
{
  return 0;
}

- (void)_setupHighlightingSupport
{
  if (!self->_highlightingSupport)
  {
    char v3 = [[UICellHighlightingSupport alloc] initWithCell:self];
    id highlightingSupport = self->_highlightingSupport;
    self->_id highlightingSupport = v3;

    id v5 = self->_highlightingSupport;
    [v5 cacheState:255 forView:self];
  }
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)_updateDefaultBackgroundAppearance
{
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
  if ((*(_WORD *)&collectionCellFlags & 0xC000) == 0)
  {
    if ((*(_WORD *)&collectionCellFlags & 0x3800) != 0)
    {
      if ((*(_WORD *)&collectionCellFlags & 0x1000) == 0)
      {
        BOOL v4 = [(UICollectionViewCell *)self _defaultBackgroundView];
        [(UICollectionViewCell *)self setBackgroundView:v4];

        $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFEFFF);
        self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = collectionCellFlags;
      }
      if ((*(_WORD *)&collectionCellFlags & 0x2000) == 0)
      {
        id v5 = [(UICollectionViewCell *)self _defaultSelectedBackgroundView];
        [(UICollectionViewCell *)self setSelectedBackgroundView:v5];

        *(_DWORD *)&self->_collectionCellFlags &= ~0x2000u;
      }
    }
    else
    {
      double v6 = [(UICollectionViewCell *)self _effectiveDefaultBackgroundConfiguration];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58__UICollectionViewCell__updateDefaultBackgroundAppearance__block_invoke;
      v8[3] = &unk_1E52D9F98;
      v8[4] = self;
      id v9 = v6;
      id v7 = v6;
      +[UIView _performSystemAppearanceModifications:v8];
      *(_DWORD *)&self->_collectionCellFlags &= ~0x8000u;
    }
  }
}

- (id)_effectiveDefaultBackgroundConfiguration
{
  if (self->_contentView
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([(UIView *)self->_contentView _containerBackgroundView],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v4 = (void *)v3;
    id v5 = +[UIBackgroundConfiguration clearConfiguration];
    [v5 setCustomView:v4];
  }
  else
  {
    id v5 = [(UICollectionViewCell *)self _defaultBackgroundConfiguration];
  }
  return v5;
}

- (id)_defaultBackgroundConfiguration
{
  return 0;
}

- (BOOL)_backgroundIsVerticallyInset
{
  if (self->_selectedBackgroundView)
  {
    LOBYTE(systemBackgroundView) = 0;
  }
  else
  {
    systemBackgroundView = self->_systemBackgroundView;
    if (systemBackgroundView)
    {
      [(_UISystemBackgroundView *)systemBackgroundView effectiveInsetsInContainerView:self];
      LOBYTE(systemBackgroundView) = v5 > 0.0 && v4 > 0.0;
    }
  }
  return (char)systemBackgroundView;
}

- (BOOL)_backgroundFillIsCustomized
{
  double v2 = self;
  selectedBackgroundView = self->_selectedBackgroundView;
  if (!selectedBackgroundView)
  {
    if (![(UICollectionViewCell *)v2 isHighlighted]
      && ![(UICollectionViewCell *)v2 isSelected]
      && ![(UICollectionViewCell *)v2 isFocused])
    {
      goto LABEL_3;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__UICollectionViewCell__backgroundFillIsCustomized__block_invoke;
    v11[3] = &unk_1E52D9F70;
    v11[4] = v2;
    +[UIView performWithoutAnimation:v11];
    double v4 = [(_UISystemBackgroundView *)v2->_systemBackgroundView configuration];
    double v5 = v4;
    if (v4 && [v4 _hasBackgroundFill])
    {
      lastNormalBackgroundViewConfiguration = v2->_lastNormalBackgroundViewConfiguration;
      if (!lastNormalBackgroundViewConfiguration)
      {
        if ((*((unsigned char *)&v2->_collectionCellFlags + 2) & 0xC0) != 0)
        {
          [(UICollectionViewCell *)v2 _forcePopulateNormalStateConfiguration];
          double v10 = [(_UISystemBackgroundView *)v2->_systemBackgroundView configuration];

          if (!v10)
          {
            LOBYTE(v2) = 0;
            double v5 = 0;
            goto LABEL_13;
          }
          if (![v10 _hasBackgroundFill])
          {
            LOBYTE(v2) = 0;
            double v5 = v10;
            goto LABEL_13;
          }
          lastNormalBackgroundViewConfiguration = v2->_lastNormalBackgroundViewConfiguration;
          double v5 = v10;
        }
        else
        {
          lastNormalBackgroundViewConfiguration = 0;
        }
      }
      id v7 = [(UIView *)v2 tintColor];
      LODWORD(v2) = [v5 _backgroundFillIsEqual:lastNormalBackgroundViewConfiguration withTintColor:v7] ^ 1;
    }
    else
    {
      LOBYTE(v2) = 0;
    }
LABEL_13:

    return (char)v2;
  }
  if (![(UIView *)selectedBackgroundView isHidden])
  {
    [(UIView *)v2->_selectedBackgroundView alpha];
    LOBYTE(v2) = v8 > 0.0;
    return (char)v2;
  }
LABEL_3:
  LOBYTE(v2) = 0;
  return (char)v2;
}

- (void)_notifyIsDisplaying:(BOOL)a3
{
  BOOL v3 = a3;
  __int16 reusableViewFlags = (__int16)self->super._reusableViewFlags;
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCell;
  -[UICollectionReusableView _notifyIsDisplaying:](&v6, sel__notifyIsDisplaying_);
  if ((((reusableViewFlags & 0x400) == 0) ^ v3) & 1) == 0 && (objc_opt_respondsToSelector()) {
    [(UIView *)self->_contentView _containerViewIsHiddenForReuse:!v3];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewCell;
  [(UIView *)&v4 traitCollectionDidChange:a3];
  if (!_UITraitUsageTrackingEnabled() || (dyld_program_sdk_at_least() & 1) == 0) {
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)_setFocusStyle:(int64_t)a3
{
  self->_focusStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__popupMenuButton, 0);
  objc_storeStrong((id *)&self->_focusedFloatingContentView, 0);
  objc_storeStrong((id *)&self->__editMenuInteraction, 0);
  objc_storeStrong(&self->_configurationUpdateHandler, 0);
  objc_storeStrong((id *)&self->_lastNormalBackgroundViewConfiguration, 0);
  objc_storeStrong(&self->_backgroundViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_systemBackgroundView, 0);
  objc_storeStrong(&self->_contentViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_viewForContentConfiguration, 0);
  objc_storeStrong(&self->_highlightingSupport, 0);
  objc_storeStrong(&self->_selectionSegueTemplate, 0);
  objc_storeStrong((id *)&self->_menuGesture, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)_resetBackgroundViewsAndColor
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__UICollectionViewCell__resetBackgroundViewsAndColor__block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  +[UIView _performSystemAppearanceModifications:v3];
  [(UICollectionViewCell *)self setBackgroundView:0];
  [(UICollectionViewCell *)self setSelectedBackgroundView:0];
}

- (void)setSelectedBackgroundView:(UIView *)selectedBackgroundView
{
  double v5 = selectedBackgroundView;
  objc_super v6 = v5;
  p_selectedBackgroundView = &self->_selectedBackgroundView;
  if (self->_selectedBackgroundView != v5)
  {
    if (v5) {
      [(UICollectionViewCell *)self _resetBackgroundViewConfiguration];
    }
    $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
    int v9 = (*(unsigned int *)&collectionCellFlags >> 13) & 1;
    if (v6) {
      int v9 = 1;
    }
    if (v9) {
      int v10 = 0x2000;
    }
    else {
      int v10 = 0;
    }
    self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(v10 | *(_DWORD *)&collectionCellFlags & 0xFFFFDFFF);
    [(UIView *)*p_selectedBackgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_selectedBackgroundView, selectedBackgroundView);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__UICollectionViewCell_setSelectedBackgroundView___block_invoke;
    v16[3] = &unk_1E52D9F70;
    v16[4] = self;
    +[UIView performWithoutAnimation:v16];
    [(UIView *)*p_selectedBackgroundView setAutoresizingMask:18];
    uint64_t v11 = [(_UIFloatingContentView *)self->_focusedFloatingContentView contentView];
    double v12 = (void *)v11;
    if (v11) {
      double v13 = (UICollectionViewCell *)v11;
    }
    else {
      double v13 = self;
    }
    id v14 = v13;

    double v15 = *p_selectedBackgroundView;
    if (self->_backgroundView) {
      -[UIView insertSubview:above:](v14, "insertSubview:above:", v15);
    }
    else {
      -[UIView insertSubview:atIndex:](v14, "insertSubview:atIndex:", v15);
    }
  }
}

- (void)setBackgroundView:(UIView *)backgroundView
{
  double v5 = backgroundView;
  objc_super v6 = v5;
  p_backgroundView = &self->_backgroundView;
  if (self->_backgroundView != v5)
  {
    if (v5) {
      [(UICollectionViewCell *)self _resetBackgroundViewConfiguration];
    }
    $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
    int v9 = (*(unsigned int *)&collectionCellFlags >> 12) & 1;
    if (v6) {
      int v9 = 1;
    }
    if (v9) {
      int v10 = 4096;
    }
    else {
      int v10 = 0;
    }
    self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(v10 | *(_DWORD *)&collectionCellFlags & 0xFFFFEFFF);
    [(UIView *)*p_backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, backgroundView);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42__UICollectionViewCell_setBackgroundView___block_invoke;
    v15[3] = &unk_1E52D9F70;
    v15[4] = self;
    +[UIView performWithoutAnimation:v15];
    [(UIView *)*p_backgroundView setAutoresizingMask:18];
    uint64_t v11 = [(_UIFloatingContentView *)self->_focusedFloatingContentView contentView];
    double v12 = (void *)v11;
    if (v11) {
      double v13 = (UICollectionViewCell *)v11;
    }
    else {
      double v13 = self;
    }
    id v14 = v13;

    [(UIView *)v14 insertSubview:v6 atIndex:0];
  }
}

- (void)_resetBackgroundViewConfiguration
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__UICollectionViewCell__resetBackgroundViewConfiguration__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:v2];
}

- (void)setContentConfiguration:(id)contentConfiguration
{
}

- (void)_setAllowsStateUpdatesWhenEvaluatingBackgroundAppearance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFBFFFFF | v3);
}

void __62__UICollectionViewCell__setupChangeHandlersForNewContentView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePopupMenuButtonFromContentView];
}

- (void)_updatePopupMenuButtonFromContentView
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(UIView *)self->_contentView _popupMenuButton];
    [(UICollectionViewCell *)self _setPopupMenuButton:v3];
  }
}

- (void)_setPopupMenuButton:(id)a3
{
  objc_super v6 = (UIButton *)a3;
  p_popupMenuButton = &self->__popupMenuButton;
  if (self->__popupMenuButton != v6)
  {
    id v14 = v6;
    if (v6)
    {
      double v8 = [(UIButton *)v6 menu];

      if (!v8)
      {
        uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, self, @"UICollectionViewCell.m", 1848, @"Popup menu button must be configured with a menu: %@", v14 object file lineNumber description];
      }
      if (![(UIControl *)v14 showsMenuAsPrimaryAction])
      {
        double v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2, self, @"UICollectionViewCell.m", 1849, @"Popup menu button must have showsMenuAsPrimaryAction enabled: %@", v14 object file lineNumber description];
      }
      if (![(UIButton *)v14 changesSelectionAsPrimaryAction])
      {
        double v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2, self, @"UICollectionViewCell.m", 1850, @"Popup menu button must have changesSelectionAsPrimaryAction enabled: %@", v14 object file lineNumber description];
      }
    }
    [(UIButton *)*p_popupMenuButton _setWantsAccessibilityUnderline:1];
    [(UIView *)*p_popupMenuButton setUserInteractionEnabled:1];
    objc_storeStrong((id *)&self->__popupMenuButton, a3);
    [(UIButton *)*p_popupMenuButton _setWantsAccessibilityUnderline:0];
    int v9 = [(UIView *)self traitCollection];
    uint64_t v10 = [v9 userInterfaceIdiom];

    objc_super v6 = v14;
    if (v10 != 5)
    {
      [(UIView *)v14 setUserInteractionEnabled:0];
      objc_super v6 = v14;
    }
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIView *)self isUserInteractionEnabled];
  if (v5 != v3) {
    [(UICollectionViewCell *)self _prepareForConfigurationStateUpdate];
  }
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCell;
  [(UIView *)&v6 setUserInteractionEnabled:v3];
  if (v5 != [(UIView *)self isUserInteractionEnabled]) {
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)setAutomaticallyUpdatesContentConfiguration:(BOOL)automaticallyUpdatesContentConfiguration
{
  if (automaticallyUpdatesContentConfiguration)
  {
    id contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    p_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = &self->_collectionCellFlags;
    $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
    if ((contentViewConfigurationProvider == 0) != ((*(_DWORD *)&collectionCellFlags & 0x20000) == 0)) {
      return;
    }
    if (!contentViewConfigurationProvider)
    {
      *p_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags | 0x20000);
      [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
      return;
    }
  }
  else
  {
    p_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = &self->_collectionCellFlags;
    $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
    if ((*(_DWORD *)&collectionCellFlags & 0x20000) == 0) {
      return;
    }
  }
  *p_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFFFDFFFF);
}

- (UIBackgroundConfiguration)defaultBackgroundConfiguration
{
  return +[UIBackgroundConfiguration clearConfiguration];
}

uint64_t __58__UICollectionViewCell__subclassOverridesContentViewClass__block_invoke()
{
  uint64_t result = +[UICollectionViewCell methodForSelector:sel__contentViewClass];
  qword_1EB2588B8 = result;
  return result;
}

- (void)_setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  if (_UICollectionViewCellContextMenuSuppressesSelectionState())
  {
    if ((*(unsigned char *)&self->_collectionCellFlags & 0xE0) != 0) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v5;
    }
  }
  if (v4)
  {
    [(UICollectionViewCell *)self _selectionAnimationDuration];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__UICollectionViewCell__setSelected_animated___block_invoke;
    v7[3] = &unk_1E52D9FC0;
    void v7[4] = self;
    char v8 = v5;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v7, 0);
  }
  else
  {
    [(UICollectionViewCell *)self setSelected:v5];
  }
}

- (void)_updateConfigurationWithObservationTracking
{
  double v2 = self;
  sub_185A8C7E4();
}

- (UICollectionViewCell)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UICollectionViewCell;
  uint64_t v5 = [(UICollectionReusableView *)&v21 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectForKey:@"UIContentConfigurationIdentifier"];
    v5->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&v5->_collectionCellFlags & 0xFFFFFBFF | ((v6 != 0) << 10));

    uint64_t v7 = [v4 decodeObjectForKey:@"UIContentConfigurationView"];
    viewForContentConfiguration = v5->_viewForContentConfiguration;
    v5->_viewForContentConfiguration = (_UIContentViewInternal *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"UIContentView"];
    contentView = v5->_contentView;
    v5->_contentView = (UIView *)v9;

    if (v5->_contentView)
    {
      -[UIView addSubview:](v5, "addSubview:");
    }
    else if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      uint64_t v11 = objc_opt_class();
      [(UIView *)v5 bounds];
      double v12 = objc_msgSend(v11, "_createDefaultContentViewWithFrame:");
      [(UICollectionViewCell *)v5 setContentView:v12];
    }
    uint64_t v13 = [v4 decodeObjectForKey:@"UISystemBackgroundView"];
    systemBackgroundView = v5->_systemBackgroundView;
    v5->_systemBackgroundView = (_UISystemBackgroundView *)v13;

    double v15 = v5->_systemBackgroundView;
    if (v15)
    {
      [(UIView *)v5 insertSubview:v15 atIndex:0];
    }
    else
    {
      uint64_t v16 = [v4 decodeObjectForKey:@"UIBackgroundView"];
      backgroundView = v5->_backgroundView;
      v5->_backgroundView = (UIView *)v16;

      uint64_t v18 = [v4 decodeObjectForKey:@"UISelectedBackgroundView"];
      selectedBackgroundView = v5->_selectedBackgroundView;
      v5->_selectedBackgroundView = (UIView *)v18;
    }
    *(_DWORD *)&v5->_collectionCellFlags |= 0x30200u;
  }

  return v5;
}

- (BOOL)_usingContentViewConfiguration
{
  return (*((unsigned __int8 *)&self->_collectionCellFlags + 1) >> 2) & 1;
}

- (void)_setContentViewConfiguration:(id)a3
{
}

- (BOOL)automaticallyUpdatesContentConfiguration
{
  return (*((unsigned __int8 *)&self->_collectionCellFlags + 2) >> 1) & 1;
}

- (void)_setContentViewConfigurationProvider:(id)a3
{
  if (self->_contentViewConfigurationProvider != a3)
  {
    if (a3) {
      *(_DWORD *)&self->_collectionCellFlags &= ~0x20000u;
    }
    id v4 = (void *)[a3 copy];
    id contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    self->_id contentViewConfigurationProvider = v4;

    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (id)_contentViewConfigurationProvider
{
  double v2 = _Block_copy(self->_contentViewConfigurationProvider);
  return v2;
}

void __62__UICollectionViewCell__setupChangeHandlersForNewContentView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDefaultBackgroundAppearance];
}

- (id)_encodableSubviews
{
  BOOL v3 = [(_UIFloatingContentView *)self->_focusedFloatingContentView contentView];
  id v4 = [v3 subviews];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(UIView *)self subviews];
  }
  uint64_t v7 = v6;

  return v7;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewCell;
  [(UIView *)&v5 _populateArchivedSubviews:v4];
  if (self->_systemBackgroundView) {
    objc_msgSend(v4, "removeObject:");
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewCell;
  [(UICollectionReusableView *)&v12 encodeWithCoder:v4];
  [v4 encodeObject:self->_systemBackgroundView forKey:@"UISystemBackgroundView"];
  if ((*((unsigned char *)&self->_collectionCellFlags + 1) & 4) != 0)
  {
    objc_super v5 = [(UICollectionViewCell *)self contentConfiguration];
    if (v5)
    {
      id v6 = v5;
    }
    else
    {
      id v6 = [(UICollectionViewCell *)self _contentViewConfiguration];
      if (!v6)
      {
        char v8 = 0;
LABEL_9:
        [v4 encodeObject:v8 forKey:@"UIContentConfigurationIdentifier"];

        goto LABEL_10;
      }
    }
    if (objc_opt_respondsToSelector())
    {
      [v6 _wrappedConfigurationIdentifier];
    }
    else
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
    char v8 = };

    goto LABEL_9;
  }
LABEL_10:
  [v4 encodeObject:self->_viewForContentConfiguration forKey:@"UIContentConfigurationView"];
  contentView = self->_contentView;
  if (contentView) {
    [v4 encodeObject:contentView forKey:@"UIContentView"];
  }
  backgroundView = self->_backgroundView;
  if (backgroundView) {
    [v4 encodeObject:backgroundView forKey:@"UIBackgroundView"];
  }
  selectedBackgroundView = self->_selectedBackgroundView;
  if (selectedBackgroundView) {
    [v4 encodeObject:selectedBackgroundView forKey:@"UISelectedBackgroundView"];
  }
}

- (void)_updateHighlightColorsForAnimationHalfwayPoint
{
  *(_DWORD *)&self->_collectionCellFlags &= ~0x80000u;
  BOOL v3 = [(UICollectionViewCell *)self _descendantsShouldHighlight];
  [(UICollectionViewCell *)self _updateHighlightColorsForView:self highlight:v3];
}

- (void)_setOpaque:(BOOL)a3 forSubview:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = (_UISystemBackgroundView *)a4;
  id highlightingSupport = self->_highlightingSupport;
  if (v4)
  {
    [highlightingSupport applyState:255 toView:v6];
  }
  else
  {
    [highlightingSupport applyState:1 toView:v6];
    [(UIView *)v6 setOpaque:0];
    char v8 = +[UIColor clearColor];
    [(UIView *)v6 setBackgroundColor:v8];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && (_UISystemBackgroundView *)self->_selectedBackgroundView != v6
    && self->_systemBackgroundView != v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = [(UIView *)v6 subviews];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [(UICollectionViewCell *)self _setOpaque:v4 forSubview:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v7 = a5;
  if ([(UIView *)self containsView:a4] && ![(UIView *)self containsView:v7]) {
    [self->_highlightingSupport applyState:255 toView:self];
  }
}

- (void)_monitoredView:(id)a3 didMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  uint64_t v13 = (_UISystemBackgroundView *)a3;
  id v8 = a4;
  uint64_t v9 = (UICollectionViewCell *)a5;
  uint64_t v10 = v9;
  while (v10 != self && v10)
  {
    objc_opt_class();
    BOOL v11 = (objc_opt_isKindOfClass() & 1) != 0
       || (_UISystemBackgroundView *)self->_selectedBackgroundView == v13
       || self->_systemBackgroundView == v13;
    uint64_t v12 = [(UIView *)v10 superview];

    uint64_t v10 = v12;
    if (v11) {
      goto LABEL_14;
    }
  }
  if (![(UIView *)self containsView:v8] && [(UIView *)self containsView:v9])
  {
    [self->_highlightingSupport cacheState:255 forView:v13];
    [(UICollectionViewCell *)self _updateHighlightColorsForView:v13 highlight:(*(_DWORD *)&self->_collectionCellFlags >> 1) & 1];
    [(UICollectionViewCell *)self _setOpaque:0 forSubview:v13];
  }
  uint64_t v12 = v10;
LABEL_14:
}

- (double)_selectionAnimationDuration
{
  return 0.3;
}

uint64_t __46__UICollectionViewCell__setSelected_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelected:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isDragging
{
  return (self->_dragAppearance & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_isDropTarget
{
  return self->__dropState == 2;
}

uint64_t __43__UICollectionViewCell__setDragAppearance___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (unint64_t)_dragAppearance
{
  return self->_dragAppearance;
}

uint64_t __61__UICollectionViewCell__restoreCurrentDragAppearanceIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDragAppearance:*(void *)(a1 + 40)];
}

- (BOOL)_hasCustomSelectionAction
{
  double v2 = [(UICollectionViewCell *)self _effectivePopupMenuButton];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_performCustomSelectionAction
{
  double v2 = [(UICollectionViewCell *)self _effectivePopupMenuButton];
  if (v2)
  {
    id v3 = v2;
    [v2 performPrimaryAction];
    double v2 = v3;
  }
}

- (id)_effectivePopupMenuButton
{
  id v3 = [(UIView *)self traitCollection];
  if ([v3 userInterfaceIdiom] == 5) {
    popupMenuButton = 0;
  }
  else {
    popupMenuButton = self->__popupMenuButton;
  }
  objc_super v5 = popupMenuButton;

  return v5;
}

- (BOOL)_canPerformActionForKey:(id)a3
{
  return 0;
}

- (BOOL)_performActionForKey:(id)a3
{
  return 0;
}

- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    [(UICollectionViewCell *)self _selectionAnimationDuration];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__UICollectionViewCell__setHighlighted_animated___block_invoke;
    v6[3] = &unk_1E52D9FC0;
    v6[4] = self;
    BOOL v7 = a3;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, 0);
  }
  else
  {
    -[UICollectionViewCell setHighlighted:](self, "setHighlighted:");
  }
}

uint64_t __49__UICollectionViewCell__setHighlighted_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_performConfigurationStateModifications:(id)a3
{
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
  self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags | 0x2000000);
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFDFFFFFF | (((*(unsigned int *)&collectionCellFlags >> 25) & 1) << 25));
}

uint64_t __51__UICollectionViewCell__backgroundFillIsCustomized__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performConfigurationStateUpdate];
}

- (void)_forcePopulateNormalStateConfiguration
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__UICollectionViewCell__forcePopulateNormalStateConfiguration__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

uint64_t __62__UICollectionViewCell__forcePopulateNormalStateConfiguration__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 584) &= ~0x800000u;
  int v2 = [*(id *)(a1 + 32) isHighlighted];
  int v3 = [*(id *)(a1 + 32) isSelected];
  [*(id *)(a1 + 32) isFocused];
  if (v3) {
    [*(id *)(a1 + 32) _setSelected:0 animated:0];
  }
  BOOL v4 = *(_DWORD **)(a1 + 32);
  if (!v2)
  {
    v4[146] |= 0x4000000u;
    [*(id *)(a1 + 32) _performConfigurationStateUpdate];
    if (!v3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  [v4 _setHighlighted:0 animated:0];
  *(_DWORD *)(*(void *)(a1 + 32) + 584) |= 0x4000000u;
  [*(id *)(a1 + 32) _performConfigurationStateUpdate];
  [*(id *)(a1 + 32) _setHighlighted:1 animated:0];
  if (v3) {
LABEL_7:
  }
    [*(id *)(a1 + 32) _setSelected:1 animated:0];
LABEL_8:
  *(_DWORD *)(*(void *)(a1 + 32) + 584) &= ~0x4000000u;
  objc_super v5 = *(void **)(a1 + 32);
  return [v5 _performConfigurationStateUpdate];
}

- (BOOL)_allowsStateUpdatesWhenEvaluatingBackgroundAppearance
{
  return (*((unsigned __int8 *)&self->_collectionCellFlags + 2) >> 6) & 1;
}

- (id)_backgroundViewConfiguration
{
  int v2 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v3 = v2;
  }
  else {
    int v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)_visiblePathForBackgroundConfiguration
{
  return [(_UISystemBackgroundView *)self->_systemBackgroundView currentVisiblePathInContainerView:self];
}

- (id)_systemBackgroundView
{
  return self->_systemBackgroundView;
}

- (void)setAutomaticallyUpdatesBackgroundConfiguration:(BOOL)automaticallyUpdatesBackgroundConfiguration
{
  if (automaticallyUpdatesBackgroundConfiguration)
  {
    id backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    p_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = &self->_collectionCellFlags;
    $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
    if ((backgroundViewConfigurationProvider == 0) != ((*(_DWORD *)&collectionCellFlags & 0x10000) == 0)) {
      return;
    }
    if (!backgroundViewConfigurationProvider)
    {
      *p_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags | 0x10000);
      [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
      return;
    }
  }
  else
  {
    p_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = &self->_collectionCellFlags;
    $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
    if ((*(_DWORD *)&collectionCellFlags & 0x10000) == 0) {
      return;
    }
  }
  *p_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFFFEFFFF);
}

- (BOOL)automaticallyUpdatesBackgroundConfiguration
{
  return *((unsigned char *)&self->_collectionCellFlags + 2) & 1;
}

- (id)_backgroundViewConfigurationProvider
{
  int v2 = _Block_copy(self->_backgroundViewConfigurationProvider);
  return v2;
}

- (id)_defaultBackgroundView
{
  return 0;
}

- (id)_defaultSelectedBackgroundView
{
  return 0;
}

uint64_t __59__UICollectionViewCell__prepareForConfigurationStateUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performConfigurationStateUpdate];
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  if (self->_menuGesture != a3) {
    return 1;
  }
  id v4 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._collectionView);
  LOBYTE(v4) = [WeakRetained _shouldShowMenuForCell:v4];

  return (char)v4;
}

- (void)_handleMenuGesture:(id)a3
{
  if ([a3 state] == 1)
  {
    if (!self->__editMenuInteraction)
    {
      id v4 = [[UIEditMenuInteraction alloc] initWithDelegate:self];
      editMenuInteraction = self->__editMenuInteraction;
      self->__editMenuInteraction = v4;

      [(UIView *)self addInteraction:self->__editMenuInteraction];
    }
    [(UIView *)self center];
    double v7 = v6;
    double v9 = v8;
    uint64_t v10 = [(UIView *)self superview];
    -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v10, v7, v9);
    double v12 = v11;
    double v14 = v13;

    +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0, v12, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "set_firstResponderTarget:", self);
    [(UIEditMenuInteraction *)self->__editMenuInteraction presentEditMenuWithConfiguration:v15];
  }
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7 = a5;
  if (self->__editMenuInteraction == a3)
  {
    double v9 = _UIMenuForUIMenuControllerMenuItems();
    if (v9)
    {
      uint64_t v10 = [v7 arrayByAddingObject:v9];

      id v7 = (id)v10;
    }
    double v8 = +[UIMenu menuWithChildren:v7];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  if (self->__editMenuInteraction == a3)
  {
    [(UIView *)self bounds];
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB20];
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  if (self->__editMenuInteraction == a3)
  {
    -[UICollectionViewCell _setSelected:animated:](self, "_setSelected:animated:", 1, 0, a5);
    *(_DWORD *)&self->_collectionCellFlags |= 0x40000u;
  }
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  double v8 = (UIEditMenuInteraction *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->__editMenuInteraction == v8)
  {
    $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
    if ((*(_DWORD *)&collectionCellFlags & 0x40000) != 0)
    {
      [(UICollectionViewCell *)self _setSelected:0 animated:0];
      $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = self->_collectionCellFlags;
    }
    self->_$92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFFFBFFFF);
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._collectionView);
    [WeakRetained _cellMenuDismissed];

    editMenuInteraction = self->__editMenuInteraction;
    self->__editMenuInteraction = 0;

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__UICollectionViewCell_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke;
    v14[3] = &unk_1E52D9F70;
    id v15 = v8;
    [v10 addCompletion:v14];
  }
}

void __85__UICollectionViewCell_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 removeInteraction:*(void *)(a1 + 32)];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (!dyld_program_sdk_at_least())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._collectionView);
    if (![WeakRetained _canPerformAction:a3 forCell:self sender:v6])
    {
      unsigned __int8 v11 = 0;
      goto LABEL_15;
    }
    unsigned __int8 v10 = objc_opt_respondsToSelector();
LABEL_13:
    unsigned __int8 v11 = v10;
LABEL_15:

    goto LABEL_16;
  }
  if (sel_cut_ == a3 || sel_copy_ == a3 || sel_paste_ == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._collectionView);
    unsigned __int8 v10 = [WeakRetained _canPerformAction:a3 forCell:self sender:v6];
    goto LABEL_13;
  }
  v13.receiver = self;
  v13.super_class = (Class)UICollectionViewCell;
  unsigned __int8 v11 = [(UIView *)&v13 canPerformAction:a3 withSender:v6];
LABEL_16:

  return v11 & 1;
}

- (void)_performAction:(SEL)a3 sender:(id)a4
{
  p_collectionView = &self->super._collectionView;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_collectionView);
  [WeakRetained _performAction:a3 forCell:self sender:v7];
}

- (void)cut:(id)a3
{
}

- (void)copy:(id)a3
{
}

- (void)paste:(id)a3
{
}

- (void)_setSelectionSegueTemplate:(id)a3
{
  id v5 = a3;
  if (self->_selectionSegueTemplate != v5)
  {
    id v6 = v5;
    objc_storeStrong(&self->_selectionSegueTemplate, a3);
    id v5 = v6;
  }
}

- (id)_selectionSegueTemplate
{
  id v2 = self->_selectionSegueTemplate;
  return v2;
}

void __106__UICollectionViewCell_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke_328(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_CollectionViewCellContextMenuSuppressesSelectionState_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Warning once only: Detected a case where constraints ambiguously suggest a size of zero for a collection view cell's content view. We're considering the collapse unintentional and using standard size instead. Cell: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __37__UICollectionViewCell_sizeThatFits___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutContentView];
}

- (void)_configureFocusedFloatingContentView:(id)a3
{
  id v3 = a3;
  [v3 setBackgroundColor:0 forState:0];
  [v3 setBackgroundColor:0 forState:8];
  [v3 setBackgroundColor:0 forState:1];
  [v3 setBackgroundColor:0 forState:4];
  [v3 setFocusedSizeIncrease:70.0];
  objc_msgSend(v3, "setContentMotionRotation:translation:", 0.2, 0.2, 12.0, 12.0);
}

- (BOOL)canBecomeFocused
{
  id v3 = [(UICollectionReusableView *)self _layoutAttributes];
  int v4 = [(UICollectionReusableView *)self _isStyledAsHeaderOrFooterFromLayoutAttributes:v3];

  if (v4) {
    int v4 = ![(UICollectionReusableView *)self _isFocusableWhenStyledAsHeader];
  }
  uint64_t v5 = [(UICollectionViewCell *)self _existingContentView];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    if (objc_opt_respondsToSelector()) {
      LODWORD(v5) = [v6 _preventFocus];
    }
    else {
      LODWORD(v5) = 0;
    }
  }
  if ((v4 | v5))
  {
    char v7 = 0;
  }
  else
  {
    double v8 = [(UICollectionReusableView *)self _collectionView];
    char v7 = [v8 _cellCanBecomeFocused:self];
  }
  return v7;
}

- (void)_willUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewCell;
  [(UIView *)&v8 _willUpdateFocusInContext:v4];
  uint64_t v5 = [v4 previouslyFocusedView];
  if (v5 == self)
  {

LABEL_5:
    [(UICollectionViewCell *)self _prepareForConfigurationStateUpdate];
    goto LABEL_6;
  }
  uint64_t v6 = v5;
  char v7 = [v4 nextFocusedView];

  if (v7 == self) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 nextFocusedView];

  if (v6 == self)
  {
    [(UICollectionViewCell *)self _ensureFocusedFloatingContentView];
    if (self->_focusedFloatingContentView)
    {
      char v7 = [(UIView *)self superview];
      [v7 bringSubviewToFront:self];
    }
  }
  objc_super v8 = +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:v5];
  if (!v8)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"UICollectionViewCell.m" lineNumber:3127 description:@"Received call to _didUpdateFocusInContext: outside of a focus update."];
  }
  [(UICollectionViewCell *)self _updateFocusedFloatingContentControlStateInContext:v5 withAnimationCoordinator:v8 animated:1];
  id v9 = [v5 previouslyFocusedView];
  if (v9 == self)
  {
  }
  else
  {
    unsigned __int8 v10 = v9;
    unsigned __int8 v11 = [v5 nextFocusedView];

    if (v11 != self) {
      goto LABEL_11;
    }
  }
  [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
LABEL_11:
  double v12 = [v5 previouslyFocusedView];

  if (v12 == self)
  {
    objc_super v13 = [(UICollectionReusableView *)self _collectionView];
    [v13 _cellDidBecomeUnfocused:self];
  }
  double v14 = [v5 nextFocusedView];

  if (v14 == self)
  {
    id v15 = [(UICollectionReusableView *)self _collectionView];
    [v15 _cellDidBecomeFocused:self];
  }
  v17.receiver = self;
  v17.super_class = (Class)UICollectionViewCell;
  [(UIView *)&v17 _didUpdateFocusInContext:v5];
}

- (int64_t)_systemDefaultFocusGroupPriority
{
  if ([(UICollectionViewCell *)self isSelected]) {
    return 2000;
  }
  else {
    return 0;
  }
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6 = a4;
  [(UICollectionViewCell *)self _ensureFocusedFloatingContentView];
  focusedFloatingContentView = self->_focusedFloatingContentView;
  if (focusedFloatingContentView)
  {
    uint64_t v8 = [(_UIFloatingContentView *)focusedFloatingContentView _preferredConfigurationForFocusAnimation:a3 inContext:v6];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UICollectionViewCell;
    uint64_t v8 = [(UIView *)&v11 _preferredConfigurationForFocusAnimation:a3 inContext:v6];
  }
  id v9 = (void *)v8;

  return v9;
}

- (BOOL)_allowsHorizontalFocusMovement
{
  id v2 = [(UICollectionReusableView *)self _layoutAttributes];
  id v3 = -[UICollectionViewLayoutAttributes _existingListAttributes](v2);
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)_shouldForwardMovementToFocusEngine:(int64_t)a3
{
  BOOL v5 = [(UICollectionViewCell *)self _allowsHorizontalFocusMovement];
  if (a3 != 1 || v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)UICollectionViewCell;
    LOBYTE(v5) = [(UIResponder *)&v7 _shouldForwardMovementToFocusEngine:a3];
  }
  return v5;
}

- (id)_defaultFocusOutline
{
  systemBackgroundView = self->_systemBackgroundView;
  if (systemBackgroundView)
  {
    BOOL v4 = [(_UISystemBackgroundView *)systemBackgroundView outlinePathInContainerView:self];
  }
  else
  {
    BOOL v5 = [(UIView *)self layer];
    [v5 cornerRadius];
    uint64_t v6 = [v5 maskedCorners] & 0xF;
    [(UIView *)self bounds];
    BOOL v4 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v6);
  }
  return v4;
}

- (id)_defaultFocusEffect
{
  if ([(UICollectionViewCell *)self _isSwiped])
  {
    id v3 = 0;
    goto LABEL_15;
  }
  if (!self->_systemBackgroundView) {
    goto LABEL_10;
  }
  [(UICollectionViewCell *)self _performConfigurationStateUpdate];
  BOOL v4 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
  if (([v4 isTintBackgroundColor] & 1) == 0)
  {
    BOOL v5 = [(UIView *)self traitCollection];
    unint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 > 5
      || ((1 << v6) & 0x23) == 0
      || ![(UICollectionViewCell *)self _backgroundFillIsCustomized])
    {

LABEL_10:
      objc_super v7 = [(UICollectionReusableView *)self _collectionView];
      int v8 = [v7 _effectiveDefaultAllowsFocus];

      if (v8) {
        id v9 = UIFocusHaloEffect;
      }
      else {
        id v9 = _UIFocusSystemHaloEffect;
      }
      BOOL v4 = [(UICollectionViewCell *)self _defaultFocusOutline];
      id v3 = [(__objc2_class *)v9 effectWithPath:v4];
      goto LABEL_14;
    }
  }
  id v3 = 0;
LABEL_14:

LABEL_15:
  return v3;
}

- (int64_t)focusItemDeferralMode
{
  id v3 = [(UICollectionReusableView *)self _collectionView];
  int64_t v4 = [v3 _cellFocusItemDeferral:self];

  return v4;
}

- (UIEditMenuInteraction)_editMenuInteraction
{
  return self->__editMenuInteraction;
}

- (void)set_editMenuInteraction:(id)a3
{
}

- (_UIFloatingContentView)_focusedFloatingContentView
{
  return self->_focusedFloatingContentView;
}

- (int64_t)_focusStyle
{
  return self->_focusStyle;
}

- (void)setDragging:(BOOL)a3
{
  self->_dragging = a3;
}

- (UIButton)_popupMenuButton
{
  return self->__popupMenuButton;
}

@end