@interface UITableViewCell
+ (void)_ensureInitializeSystemAppearanceModifications;
+ (void)_initializeForIdiom:(int64_t)a3;
- (BOOL)_accessoryViewsHidden;
- (BOOL)_allowsReorderingWhenNotEditing;
- (BOOL)_appliesMaskingToBackgroundConfiguration;
- (BOOL)_automaticIntrinsicContentSizeInvalidationEnabled;
- (BOOL)_backgroundFillIsCustomized;
- (BOOL)_backgroundIsVerticallyInset;
- (BOOL)_canDrawContent;
- (BOOL)_changesOpaqueStateOfSubviews;
- (BOOL)_drawsSeparatorAtBottomOfSection;
- (BOOL)_drawsSeparatorAtTopOfSection;
- (BOOL)_drawsTopSeparatorDuringReordering;
- (BOOL)_editControlShouldBeOnLeadingSideForStyle:(int64_t)a3;
- (BOOL)_forwardsSystemLayoutFittingSizeToContentView:(id)a3;
- (BOOL)_gestureRecognizerShouldBegin:(id)a3;
- (BOOL)_grabberBeganReorder:(id)a3 touch:(id)a4;
- (BOOL)_hasAccessoryView;
- (BOOL)_hasBeenReused;
- (BOOL)_hasCustomSelectionAction;
- (BOOL)_hasEditingAccessoryView;
- (BOOL)_hidesBottomSeparatorWhenUnselected;
- (BOOL)_highlightsAlongsideDefaultEffect;
- (BOOL)_ignoresMultipleSelectionDuringEditing;
- (BOOL)_insetsBackground;
- (BOOL)_insetsContentViewsToSafeArea;
- (BOOL)_isAnimating;
- (BOOL)_isDeleteAnimationInProgress;
- (BOOL)_isDragging;
- (BOOL)_isDropTarget;
- (BOOL)_isInModalViewController;
- (BOOL)_isMultiselecting;
- (BOOL)_isReorderControlActive;
- (BOOL)_isReorderable;
- (BOOL)_isReordering;
- (BOOL)_isShowingCompactContextMenu;
- (BOOL)_isSwiped;
- (BOOL)_isUsingOldStyleMultiselection;
- (BOOL)_needsHeightCalculation;
- (BOOL)_needsSetup;
- (BOOL)_separatorDrawsInVibrantLightMode;
- (BOOL)_separatorHidden;
- (BOOL)_separatorInsetIsRelativeToCellEdges;
- (BOOL)_shouldApplyReadableWidthInsets;
- (BOOL)_shouldChangeOpaqueStateOfView:(id)a3;
- (BOOL)_shouldForwardMovementToFocusEngine:(int64_t)a3;
- (BOOL)_shouldHaveFullLengthBottomSeparator;
- (BOOL)_shouldHaveFullLengthTopSeparator;
- (BOOL)_shouldHideSeparator;
- (BOOL)_shouldMaskToBoundsWhileAnimating;
- (BOOL)_shouldSaveOpaqueStateForView:(id)a3;
- (BOOL)_shouldUseHighlightedOrSelectedAppearance;
- (BOOL)_showFullLengthTopSeparatorForTopOfSection;
- (BOOL)_showSeparatorAtTopOfSection;
- (BOOL)_skipsLayout;
- (BOOL)_topSeparatorFollowsLayoutMargins;
- (BOOL)_updateExpansionButtonFromType:(int64_t)a3 toType:(int64_t)a4;
- (BOOL)_usesModernAccessoriesLayout;
- (BOOL)_usesRoundedGroups;
- (BOOL)_usingBackgroundConfigurationOrDefaultBackgroundConfiguration;
- (BOOL)_usingBackgroundViewConfiguration;
- (BOOL)automaticallyUpdatesBackgroundConfiguration;
- (BOOL)automaticallyUpdatesContentConfiguration;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)clipsContents;
- (BOOL)drawingEnabled;
- (BOOL)hidesAccessoryWhenEditing;
- (BOOL)isAtLeastHalfSelected;
- (BOOL)isEditing;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (BOOL)shouldIndentWhileEditing;
- (BOOL)showingDeleteConfirmation;
- (BOOL)showsReorderControl;
- (BOOL)userInteractionEnabledWhileDragging;
- (BOOL)wasSwiped;
- (CGFloat)indentationWidth;
- (CGPoint)center;
- (CGRect)_separatorFrame;
- (CGRect)_topSeparatorFrame;
- (CGRect)_updatedContentViewFrameForTargetWidth:(double)a3;
- (CGRect)accessoryRectForBounds:(CGRect)a3;
- (CGRect)backgroundRectForBounds:(CGRect)a3;
- (CGRect)contentRectForBounds:(CGRect)a3;
- (CGRect)contentRectForState:(unint64_t)a3;
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (CGRect)frame;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)reorderRectForBounds:(CGRect)a3;
- (CGRect)textRectForContentRect:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSDirectionalEdgeInsets)_overriddenDefaultContentViewLayoutMargins;
- (NSInteger)indentationLevel;
- (NSLineBreakMode)lineBreakMode;
- (NSString)reuseIdentifier;
- (NSString)text;
- (NSTextAlignment)textAlignment;
- (SEL)_accessoryAction;
- (SEL)accessoryAction;
- (SEL)editAction;
- (SEL)returnAction;
- (UIBackgroundConfiguration)backgroundConfiguration;
- (UIButton)_popupMenuButton;
- (UICellAccessoryManager)_accessoryManager;
- (UICellConfigurationState)_configurationState;
- (UIColor)selectedTextColor;
- (UIColor)textColor;
- (UIEdgeInsets)_adjustedRawLayoutMargins:(UIEdgeInsets)a3 withLeadingLayoutMarginAdjustment:(double)a4;
- (UIEdgeInsets)_backgroundInset;
- (UIEdgeInsets)_backgroundSeparatorInset;
- (UIEdgeInsets)_concreteDefaultLayoutMargins;
- (UIEdgeInsets)_effectiveSafeAreaInsets;
- (UIEdgeInsets)_rawSeparatorInset;
- (UIEdgeInsets)separatorInset;
- (UIFocusContainerGuide)_editingControlsFocusGuide;
- (UIFont)font;
- (UIImage)image;
- (UIImage)selectedImage;
- (UIListContentConfiguration)defaultContentConfiguration;
- (UITableViewCell)init;
- (UITableViewCell)initWithCoder:(NSCoder *)coder;
- (UITableViewCell)initWithFrame:(CGRect)a3;
- (UITableViewCell)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (UITableViewCellAccessoryType)accessoryType;
- (UITableViewCellAccessoryType)editingAccessoryType;
- (UITableViewCellConfigurationUpdateHandler)configurationUpdateHandler;
- (UITableViewCellEditingStyle)editingStyle;
- (UITableViewCellFocusStyle)focusStyle;
- (UITableViewCellSelectionStyle)selectionStyle;
- (UIView)accessoryView;
- (UIView)backgroundView;
- (UIView)contentView;
- (UIView)editingAccessoryView;
- (UIView)multipleSelectionBackgroundView;
- (UIView)selectedBackgroundView;
- (double)_contentConfigurationPrimaryTextInsetFromCellLeadingEdge;
- (double)_contentViewInset:(double)a3 convertedToCellInsetOnEdge:(unint64_t)a4;
- (double)_defaultLeadingMarginWidth;
- (double)_defaultTrailingCellMarginWidth;
- (double)_imageViewExtentFromCellLeadingEdge;
- (double)_indexBarExtentFromEdge;
- (double)_leadingSeparatorInset;
- (double)_marginWidth;
- (double)_minimumCellAccessoryMargin;
- (double)_preferredLeadingSeparatorInsetFromContentView;
- (double)_preferredTrailingSeparatorInsetFromContentView;
- (double)_rightMarginWidth;
- (double)_roundedGroupCornerRadius;
- (double)_separatorHeight;
- (double)_trailingSeparatorInset;
- (double)_verticalPaddingForSeparator;
- (double)selectionFadeDuration;
- (double)textFieldOffset;
- (float)selectionPercent;
- (id)_accessoryTintColor;
- (id)_accessoryView:(BOOL)a3;
- (id)_accessoryViewForType:(int64_t)a3;
- (id)_addSeparatorWithFrame:(CGRect)a3;
- (id)_backgroundView:(BOOL)a3;
- (id)_backgroundViewConfiguration;
- (id)_backgroundViewConfigurationProvider;
- (id)_badge;
- (id)_badge:(BOOL)a3;
- (id)_badgeColor;
- (id)_badgeFont;
- (id)_badgeText;
- (id)_checkmarkImage;
- (id)_checkmarkImageWithTintColor:(id)a3;
- (id)_constants;
- (id)_containerView;
- (id)_contentViewConfiguration;
- (id)_contentViewConfigurationProvider;
- (id)_createDefaultContentView;
- (id)_customAccessoryView:(BOOL)a3;
- (id)_customEditingAccessoryView:(BOOL)a3;
- (id)_defaultAccessoryView;
- (id)_defaultBackgroundConfiguration;
- (id)_defaultFocusEffect;
- (id)_defaultFocusOutline;
- (id)_defaultFont;
- (id)_detailTextLabel;
- (id)_detailTextLabel:(BOOL)a3;
- (id)_disclosureChevronImage;
- (id)_disclosureChevronImageWithBaseColor:(id)a3;
- (id)_dropAnimationContainerView;
- (id)_editControlAccessoryForStyle:(int64_t)a3;
- (id)_editableTextField;
- (id)_editableTextField:(BOOL)a3;
- (id)_editingAccessoryView:(BOOL)a3;
- (id)_editingControlTintColorForStyle:(int64_t)a3;
- (id)_effectivePopupMenuButton;
- (id)_encodableSubviews;
- (id)_existingContentView;
- (id)_existingSystemAccessoryView:(BOOL)a3;
- (id)_existingSystemAccessoryViews;
- (id)_forSpringBoardDefaultSelectedBackgroundView;
- (id)_imageView;
- (id)_imageView:(BOOL)a3;
- (id)_indexPath;
- (id)_leadingAccessoriesForEditing:(BOOL)a3 style:(int64_t)a4;
- (id)_multiselectBackgroundColor;
- (id)_newAccessoryView:(BOOL)a3;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (id)_previewingSegueTemplateStorageForLocation:(CGPoint)a3 inView:(id)a4;
- (id)_reorderControlImage;
- (id)_selectedBackgroundView:(BOOL)a3;
- (id)_separatorEffect;
- (id)_separatorView:(BOOL)a3;
- (id)_stateForUpdatingBackgroundConfigurationWithState:(id)a3;
- (id)_subviewsForFloatingContentView;
- (id)_swipeContainerView;
- (id)_systemBackgroundView;
- (id)_tableView;
- (id)_target;
- (id)_textLabel;
- (id)_textLabel:(BOOL)a3;
- (id)_trailingAccessoriesForType:(int64_t)a3 view:(id)a4 editing:(BOOL)a5 style:(int64_t)a6;
- (id)_visiblePathForBackgroundConfiguration;
- (id)accessoryActionPreviewingSegueTemplateStorage;
- (id)accessoryActionSegueTemplate;
- (id)backgroundColor;
- (id)contentConfiguration;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)editingData:(BOOL)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier;
- (id)layoutManager;
- (id)preferredFocusedView;
- (id)sectionBorderColor;
- (id)selectedOverlayView;
- (id)selectionSegueTemplate;
- (id)selectionTintColor;
- (id)separatorColor;
- (id)target;
- (int)_selectionGrouping;
- (int)sectionLocation;
- (int64_t)_contentViewListStyleFromTableViewStyle:(int64_t)a3;
- (int64_t)_currentAccessoryTypeForEditing:(BOOL)a3;
- (int64_t)_dragState;
- (int64_t)_dropState;
- (int64_t)_focusTouchSensitivityStyle;
- (int64_t)_popoverControllerStyle;
- (int64_t)_preferredHighlightAnimationStyleForInteraction:(id)a3;
- (int64_t)_sanitizedEditingStyleForEditing:(BOOL)a3 style:(int64_t)a4;
- (int64_t)_separatorBackdropOverlayBlendMode;
- (int64_t)_systemDefaultFocusGroupPriority;
- (int64_t)focusItemDeferralMode;
- (int64_t)separatorStyle;
- (int64_t)style;
- (int64_t)tableViewStyle;
- (unint64_t)_maskedCornersForSystemBackgroundView;
- (unint64_t)_viewConfigurationState;
- (unint64_t)currentStateMask;
- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5;
- (void)_animateFloatingSeparatorForInsertion:(BOOL)a3 withRowAnimation:(int64_t)a4;
- (void)_animateInnerShadowForInsertion:(BOOL)a3 withRowAnimation:(int64_t)a4;
- (void)_applyBackgroundViewConfiguration:(id)a3 withState:(id)a4;
- (void)_applyContentViewConfiguration:(id)a3 withState:(id)a4 usingSPI:(BOOL)a5;
- (void)_applyLeadingLayoutMarginAdjustment:(double)a3;
- (void)_applySelectedStateToSeparators:(BOOL)a3;
- (void)_cancelInternalPerformRequests;
- (void)_clearChangeHandlersForOldContentView:(id)a3;
- (void)_clearOpaqueViewState:(id)a3;
- (void)_contentViewLabelTextDidChange:(id)a3;
- (void)_delayedDeselect;
- (void)_deselectAnimationFinished;
- (void)_didTransitionToState:(unint64_t)a3;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_drawSeparatorInRect:(CGRect)a3;
- (void)_encodeBackgroundColorWithCoder:(id)a3;
- (void)_executeConfigurationUpdate;
- (void)_forSpringBoardSetDefaultSelectedBackgroundView:(id)a3;
- (void)_grabberDragged:(id)a3 yDelta:(float)a4;
- (void)_grabberDragged:(id)a3 yDelta:(float)a4 touch:(id)a5;
- (void)_grabberReleased:(id)a3;
- (void)_highlightDidEndForInteraction:(id)a3;
- (void)_highlightForInteraction:(id)a3 fractionComplete:(double)a4 ended:(BOOL)a5;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_layoutFloatingContentView;
- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3;
- (void)_layoutSystemBackgroundView:(BOOL)a3;
- (void)_longPressGestureRecognized:(id)a3;
- (void)_macSidebarDefaultIconSizeChanged;
- (void)_monitoredView:(id)a3 didMoveFromSuperview:(id)a4 toSuperview:(id)a5;
- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5;
- (void)_multiselectColorChanged;
- (void)_notifyIsDisplaying:(BOOL)a3;
- (void)_performAction:(SEL)a3 sender:(id)a4;
- (void)_performConfigurationStateModifications:(id)a3;
- (void)_performConfigurationStateUpdate;
- (void)_performCustomSelectionAction;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_prepareForConfigurationStateUpdate;
- (void)_prepareHighlightForInteraction:(id)a3;
- (void)_prepareToSetDefaultLayoutMargins;
- (void)_releaseDetailTextLabel;
- (void)_releaseTextLabel;
- (void)_removeFloatingSeparator;
- (void)_removeFocusedFloatingContentView;
- (void)_removeFromSuperviewIgnoringFirstResponder:(BOOL)a3;
- (void)_removeInnerShadow;
- (void)_resetBackgroundViewConfiguration;
- (void)_resetBackgroundViewsAndColor;
- (void)_resetContentViews;
- (void)_resetEditControlRotation;
- (void)_resetRawLayoutMargins;
- (void)_resetSelectionTimer;
- (void)_restoreLabelTextAfterSystemTextSizeChangeIfNeeded;
- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3;
- (void)_saveOpaqueViewState:(id)a3;
- (void)_setAccessoryAction:(SEL)a3;
- (void)_setAccessoryManager:(id)a3;
- (void)_setAccessoryTintColor:(id)a3;
- (void)_setAccessoryViewsHidden:(BOOL)a3;
- (void)_setAllowsReorderingWhenNotEditing:(BOOL)a3;
- (void)_setAnimating:(BOOL)a3;
- (void)_setAnimating:(BOOL)a3 clippingAdjacentCells:(BOOL)a4;
- (void)_setAutomaticIntrinsicContentSizeInvalidationEnabled:(BOOL)a3;
- (void)_setBackgroundInset:(UIEdgeInsets)a3;
- (void)_setBackgroundViewConfiguration:(id)a3;
- (void)_setBackgroundViewConfigurationProvider:(id)a3;
- (void)_setBadgeColor:(id)a3;
- (void)_setBadgeFont:(id)a3;
- (void)_setBadgeText:(id)a3;
- (void)_setConstants:(id)a3;
- (void)_setContainerView:(id)a3;
- (void)_setContentClipCorners:(unint64_t)a3 updateCorners:(BOOL)a4;
- (void)_setContentView:(id)a3;
- (void)_setContentViewConfiguration:(id)a3;
- (void)_setContentViewConfigurationProvider:(id)a3;
- (void)_setDefaultBackgroundColor:(id)a3;
- (void)_setDefaultLeadingMarginWidth:(double)a3;
- (void)_setDefaultTrailingCellMarginWidth:(double)a3;
- (void)_setDeleteAnimationInProgress:(BOOL)a3;
- (void)_setDragState:(int64_t)a3;
- (void)_setDrawsSeparatorAtBottomOfSection:(BOOL)a3;
- (void)_setDrawsSeparatorAtTopOfSection:(BOOL)a3;
- (void)_setDrawsTopSeparator:(BOOL)a3;
- (void)_setDrawsTopSeparatorDuringReordering:(BOOL)a3;
- (void)_setDropAnimationContainerView:(id)a3;
- (void)_setDropState:(int64_t)a3;
- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4 cellOrAncestorViewForAnimatedLayout:(id)a5;
- (void)_setEditingControlTintColor:(id)a3 forStyle:(int64_t)a4;
- (void)_setEditingControlsFocusGuide:(id)a3;
- (void)_setFont:(id)a3 layout:(BOOL)a4;
- (void)_setFrame:(CGRect)a3 skipLayout:(BOOL)a4;
- (void)_setHiddenForReuse:(BOOL)a3;
- (void)_setIgnoresMultipleSelectionDuringEditing:(BOOL)a3;
- (void)_setIndentationWidth:(double)a3;
- (void)_setIndexBarExtentFromEdge:(double)a3;
- (void)_setIndexPath:(id)a3;
- (void)_setInsetsContentViewsToSafeArea:(BOOL)a3;
- (void)_setMarginWidth:(double)a3;
- (void)_setMultiselecting:(BOOL)a3;
- (void)_setNeedsAccessoriesUpdate;
- (void)_setNeedsAccessoriesUpdateForced:(BOOL)a3;
- (void)_setNeedsHeightCalculation:(BOOL)a3;
- (void)_setNeedsSeparatorUpdate;
- (void)_setNeedsSetup:(BOOL)a3;
- (void)_setOpaque:(BOOL)a3 forSubview:(id)a4;
- (void)_setOverriddenDefaultContentViewLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)_setPopupMenuButton:(id)a3;
- (void)_setRawLayoutMargins:(UIEdgeInsets)a3;
- (void)_setReorderControlImage:(id)a3;
- (void)_setReordering:(BOOL)a3;
- (void)_setRightMarginWidth:(double)a3;
- (void)_setSectionLocation:(int)a3 animated:(BOOL)a4 forceBackgroundSetup:(BOOL)a5;
- (void)_setSelectionGrouping:(int)a3;
- (void)_setSelectionStyle:(int64_t)a3 selectionTintColor:(id)a4;
- (void)_setSeparatorBackdropOverlayBlendMode:(int64_t)a3;
- (void)_setSeparatorDrawsInVibrantLightMode:(BOOL)a3;
- (void)_setSeparatorDrawsInVibrantLightModeUIAppearance:(id)a3;
- (void)_setSeparatorEffect:(id)a3;
- (void)_setSeparatorHidden:(BOOL)a3;
- (void)_setSeparatorInsetIsRelativeToCellEdges:(BOOL)a3;
- (void)_setShouldHaveFullLengthBottomSeparator:(BOOL)a3;
- (void)_setShouldHaveFullLengthTopSeparator:(BOOL)a3;
- (void)_setShouldIndentWhileEditing:(BOOL)a3;
- (void)_setShowingCompactContextMenu:(BOOL)a3;
- (void)_setShowingDeleteConfirmation:(BOOL)a3;
- (void)_setShowsReorderControl:(BOOL)a3;
- (void)_setSkipsLayout:(BOOL)a3;
- (void)_setSwipeContainerView:(id)a3;
- (void)_setSwiped:(BOOL)a3;
- (void)_setTableView:(id)a3;
- (void)_setTarget:(id)a3;
- (void)_setTopSeparatorFollowsLayoutMargins:(BOOL)a3;
- (void)_setUsesModernAccessoriesLayout:(BOOL)a3;
- (void)_setupChangeHandlersForNewContentView:(id)a3;
- (void)_setupMenuGesture;
- (void)_setupModernAccessoriesLayout;
- (void)_setupSelectedBackgroundView;
- (void)_setupTableViewCellCommon;
- (void)_showMenuFromLongPressGesture;
- (void)_startToEditTextField;
- (void)_syncAccessoryViewsIfNecessary;
- (void)_systemTextSizeChanged;
- (void)_tableViewDidUpdateMarginWidth;
- (void)_toggleExpansionButton;
- (void)_updateAccessories;
- (void)_updateAccessoriesIfNeeded;
- (void)_updateAccessoryMetrics;
- (void)_updateAndCacheBackgroundColorForHighlightIgnoringSelection:(BOOL)a3;
- (void)_updateBackgroundViewConfigurationForState:(id)a3;
- (void)_updateCellForCurrentBackgroundConfiguration;
- (void)_updateCellMaskViewsForView:(id)a3 backdropView:(id)a4;
- (void)_updateConfigurationUsingState:(id)a3;
- (void)_updateConfigurationWithObservationTracking;
- (void)_updateContentClip;
- (void)_updateContentViewConfigurationForState:(id)a3;
- (void)_updateCurrentSystemTypeAccessoryViewsUsingState:(id)a3;
- (void)_updateDefaultAccessoryViewForFocus:(BOOL)a3;
- (void)_updateDefaultBackgroundAppearance;
- (void)_updateDefaultImageSymbolConfiguration;
- (void)_updateDefaultIndentationWidth;
- (void)_updateDefaultLabelsForFocus:(BOOL)a3;
- (void)_updateExpansionButton:(id)a3 forType:(int64_t)a4 animated:(BOOL)a5;
- (void)_updateFloatingContentControlStateAnimated:(BOOL)a3;
- (void)_updateFloatingContentControlStateInContext:(id)a3 withAnimationCoordinator:(id)a4 animated:(BOOL)a5;
- (void)_updateHighlightColors;
- (void)_updateHighlightColorsForAnimationHalfwayPoint;
- (void)_updateHighlightColorsForView:(id)a3 highlighted:(BOOL)a4;
- (void)_updateLeadingLayoutMarginForIndentation;
- (void)_updateModernCellAccessoriesForState:(id)a3 isEditing:(BOOL)a4;
- (void)_updatePopupMenuButtonFromContentView;
- (void)_updateSeparatorContent;
- (void)_updateSeparatorContent:(BOOL)a3;
- (void)_updateSeparatorViewAlpha;
- (void)_updateShowingSelectedBackground;
- (void)_updateSystemTypeAccessoryView:(id)a3 withCellAccessoryType:(int64_t)a4 forState:(id)a5;
- (void)_updateSystemTypeAccessoryView:(id)a3 withTableViewAccessoryType:(int64_t)a4 forState:(id)a5;
- (void)_updateTopSeparatorViewAlpha;
- (void)_updateUserInteractionEnabledForNewDragState:(int64_t)a3;
- (void)_willEnterReusePool;
- (void)_willTransitionToState:(unint64_t)a3;
- (void)_willUpdateFocusInContext:(id)a3;
- (void)bringSubviewToFront:(id)a3;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)dragStateDidChange:(UITableViewCellDragState)dragState;
- (void)editControlWasClicked:(id)a3;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)paste:(id)a3;
- (void)prepareForReuse;
- (void)removeEditingData;
- (void)removeFromSuperview;
- (void)sendSubviewToBack:(id)a3;
- (void)setAccessoryAction:(SEL)accessoryAction;
- (void)setAccessoryActionPreviewingSegueTemplateStorage:(id)a3;
- (void)setAccessoryActionSegueTemplate:(id)a3;
- (void)setAccessoryType:(UITableViewCellAccessoryType)accessoryType;
- (void)setAccessoryView:(UIView *)accessoryView;
- (void)setAutomaticallyUpdatesBackgroundConfiguration:(BOOL)automaticallyUpdatesBackgroundConfiguration;
- (void)setAutomaticallyUpdatesContentConfiguration:(BOOL)automaticallyUpdatesContentConfiguration;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundConfiguration:(UIBackgroundConfiguration *)backgroundConfiguration;
- (void)setBackgroundView:(UIView *)backgroundView;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setConfigurationUpdateHandler:(UITableViewCellConfigurationUpdateHandler)configurationUpdateHandler;
- (void)setContentConfiguration:(id)contentConfiguration;
- (void)setDrawingEnabled:(BOOL)a3;
- (void)setEditAction:(SEL)editAction;
- (void)setEditing:(BOOL)editing;
- (void)setEditing:(BOOL)editing animated:(BOOL)animated;
- (void)setEditingAccessoryType:(UITableViewCellAccessoryType)editingAccessoryType;
- (void)setEditingAccessoryView:(UIView *)editingAccessoryView;
- (void)setEditingStyle:(int64_t)a3;
- (void)setFocusStyle:(UITableViewCellFocusStyle)focusStyle;
- (void)setFont:(UIFont *)font;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)highlighted;
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated;
- (void)setImage:(UIImage *)image;
- (void)setIndentationLevel:(NSInteger)indentationLevel;
- (void)setIndentationWidth:(CGFloat)indentationWidth;
- (void)setLayoutManager:(id)a3;
- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode;
- (void)setMultipleSelectionBackgroundView:(UIView *)multipleSelectionBackgroundView;
- (void)setNeedsUpdateConfiguration;
- (void)setNeedsUpdateConstraints;
- (void)setPlaceHolderValue:(id)a3;
- (void)setReturnAction:(SEL)a3;
- (void)setReuseIdentifier:(id)a3;
- (void)setSectionBorderColor:(id)a3;
- (void)setSectionLocation:(int)a3;
- (void)setSectionLocation:(int)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)selected;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)setSelectedBackgroundView:(UIView *)selectedBackgroundView;
- (void)setSelectedBackgroundView:(id)a3 animated:(BOOL)a4;
- (void)setSelectedImage:(UIImage *)selectedImage;
- (void)setSelectedTextColor:(UIColor *)selectedTextColor;
- (void)setSelectionFadeDuration:(double)a3;
- (void)setSelectionSegueTemplate:(id)a3;
- (void)setSelectionStyle:(UITableViewCellSelectionStyle)selectionStyle;
- (void)setSelectionTintColor:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setSeparatorInset:(UIEdgeInsets)separatorInset;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setShouldIndentWhileEditing:(BOOL)shouldIndentWhileEditing;
- (void)setShowingDeleteConfirmation:(BOOL)a3;
- (void)setShowsReorderControl:(BOOL)showsReorderControl;
- (void)setTableViewStyle:(int64_t)a3;
- (void)setTarget:(id)target;
- (void)setText:(NSString *)text;
- (void)setTextAlignment:(NSTextAlignment)textAlignment;
- (void)setTextColor:(UIColor *)textColor;
- (void)setTextFieldOffset:(double)a3;
- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setUserInteractionEnabledWhileDragging:(BOOL)userInteractionEnabledWhileDragging;
- (void)setWasSwiped:(BOOL)a3;
- (void)showSelectedBackgroundView:(BOOL)a3 animated:(BOOL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation UITableViewCell

+ (void)_initializeForIdiom:(int64_t)a3
{
  if ((dyld_program_sdk_at_least() & 1) == 0 && (id)objc_opt_class() == a1 && (a3 == 8 || a3 == 2))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__UITableViewCell__initializeForIdiom___block_invoke;
    v5[3] = &__block_descriptor_48_e5_v8__0l;
    v5[4] = a3;
    v5[5] = a1;
    +[UIView _performSystemAppearanceModifications:v5];
  }
}

- (void)willMoveToSuperview:(id)a3
{
  p_tableView = &self->_tableView;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_tableView);
  [(UIControl *)self->_accessoryView removeTarget:WeakRetained action:0 forControlEvents:64];
  [(UIControl *)self->_editingAccessoryView removeTarget:WeakRetained action:0 forControlEvents:64];
  v7.receiver = self;
  v7.super_class = (Class)UITableViewCell;
  [(UIView *)&v7 willMoveToSuperview:v5];
}

- (void)didMoveToSuperview
{
  v2 = self;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 2) == 0) {
    objc_storeWeak((id *)&self->_tableView, 0);
  }
  v3 = [(UIView *)v2 superview];

  if (v3)
  {
    v4 = [(UITableViewCell *)v2 _tableView];
    if (v4)
    {
      if ([(UITableViewCell *)v2 _usesModernAccessoriesLayout])
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v16 = v2;
        id v5 = [(UITableViewCell *)v2 _accessoryManager];
        v6 = [v5 configurations];
        objc_super v7 = [v6 allValues];

        uint64_t v18 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v18)
        {
          uint64_t v17 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v7);
              }
              v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              long long v20 = 0u;
              long long v21 = 0u;
              long long v22 = 0u;
              long long v23 = 0u;
              v10 = [v9 trailingAccessories];
              uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
              if (v11)
              {
                uint64_t v12 = v11;
                uint64_t v13 = *(void *)v21;
                do
                {
                  for (uint64_t j = 0; j != v12; ++j)
                  {
                    if (*(void *)v21 != v13) {
                      objc_enumerationMutation(v10);
                    }
                    v15 = [*(id *)(*((void *)&v20 + 1) + 8 * j) view];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      [v15 addTarget:v4 action:sel__accessoryButtonAction_ forControlEvents:64];
                    }
                  }
                  uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
                }
                while (v12);
              }
            }
            uint64_t v18 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
          }
          while (v18);
        }

        v2 = v16;
      }
      else
      {
        [(UIControl *)v2->_accessoryView addTarget:v4 action:sel__accessoryButtonAction_ forControlEvents:64];
        [(UIControl *)v2->_editingAccessoryView addTarget:v4 action:sel__accessoryButtonAction_ forControlEvents:64];
      }
    }
    [(UITableViewCell *)v2 _updateContentClip];
  }
  v19.receiver = v2;
  v19.super_class = (Class)UITableViewCell;
  [(UIView *)&v19 didMoveToSuperview];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITableViewCell;
  [(UIView *)&v10 traitCollectionDidChange:v4];
  if (!_UITraitUsageTrackingEnabled() || (dyld_program_sdk_at_least() & 1) == 0) {
    [(UITableViewCell *)self setNeedsUpdateConfiguration];
  }
  id v5 = [(UIView *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  int IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);
  v8 = [v4 preferredContentSizeCategory];
  int v9 = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (IsAccessibilityCategory != v9)
  {
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
    [(UITableViewCell *)self _updateAccessoryMetrics];
    [(UITableViewCell *)self _setNeedsAccessoriesUpdateForced:1];
  }
  [(UIView *)self traitCollection];
}

- (UICellAccessoryManager)_accessoryManager
{
  return self->_accessoryManager;
}

- (id)_detailTextLabel:(BOOL)a3
{
  detailTextLabel = self->_detailTextLabel;
  if (detailTextLabel) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = !a3;
  }
  if (v4)
  {
    id v5 = detailTextLabel;
  }
  else
  {
    id v5 = [(UITableViewCell *)self _detailTextLabel];
  }
  return v5;
}

- (id)_textLabel:(BOOL)a3
{
  textLabel = self->_textLabel;
  if (textLabel) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = !a3;
  }
  if (v4)
  {
    id v5 = textLabel;
  }
  else
  {
    id v5 = [(UITableViewCell *)self _textLabel];
  }
  return v5;
}

- (id)_imageView:(BOOL)a3
{
  imageView = self->_imageView;
  if (imageView) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = !a3;
  }
  if (v4)
  {
    id v5 = imageView;
  }
  else
  {
    id v5 = [(UITableViewCell *)self _imageView];
  }
  return v5;
}

- (unint64_t)currentStateMask
{
  p_unint64_t tableCellFlags = &self->_tableCellFlags;
  unint64_t tableCellFlags = (unint64_t)self->_tableCellFlags;
  uint64_t v4 = 2 * (tableCellFlags & 1);
  if ((tableCellFlags & 0x100) != 0) {
    uint64_t v4 = ((*(void *)((char *)p_tableCellFlags + 4) & 0x200) == 0) | (unint64_t)v4;
  }
  return v4 & 0xFFFFFFFFBFFFFFFFLL | (((tableCellFlags >> 21) & 1) << 30);
}

- (int64_t)style
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 14) & 0xFFFLL;
}

- (void)_setOverriddenDefaultContentViewLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    contentView = self->_contentView;
    -[UIView _setOverriddenDefaultLayoutMargins:](contentView, "_setOverriddenDefaultLayoutMargins:", top, leading, bottom, trailing);
  }
}

- (id)_badge:(BOOL)a3
{
  id badge = self->_badge;
  if (badge) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = !a3;
  }
  if (v4)
  {
    id v5 = badge;
  }
  else
  {
    id v5 = [(UITableViewCell *)self _badge];
  }
  return v5;
}

- (void)_updateSeparatorContent:(BOOL)a3
{
  if (a3) {
    *(void *)((char *)&self->_tableCellFlags + 4) |= 0x800uLL;
  }
  [(UITableViewCell *)self _updateSeparatorContent];
}

- (void)_setBackgroundViewConfiguration:(id)a3
{
  int v3 = *((_WORD *)&self->_tableCellFlags + 6) & 0xEFFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  __int16 v4 = ((unint64_t)a3 | *((_WORD *)&self->_tableCellFlags + 6) & 0x1000) != 0;
  *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v3);
  *((_WORD *)&self->_tableCellFlags + 6) = v3 | (v4 << 12);
  -[UITableViewCell _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:");
}

uint64_t __53__UITableViewCell__updateDefaultBackgroundAppearance__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundConfiguration:*(void *)(a1 + 40)];
}

uint64_t __48__UITableViewCell__resetBackgroundViewsAndColor__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setBackgroundColor:0];
  *(void *)(*(void *)(a1 + 32) + 412) &= ~0x10000000uLL;
  return result;
}

void __37__UITableViewCell_setTableViewStyle___block_invoke(uint64_t a1)
{
  v2 = *(_WORD **)(a1 + 32);
  __int16 v3 = v2[210];
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  __int16 v4 = objc_msgSend(v2, "_constants", 0);
  id v5 = [*(id *)(a1 + 32) _tableView];
  uint64_t v6 = [v5 _tableStyle];
  objc_super v7 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v8 = [*(id *)(a1 + 32) traitCollection];
  if (v4)
  {
    [v4 defaultCellBackgroundPropertiesForTableViewStyle:v6 state:v7 traitCollection:v8];
  }
  else
  {
    uint64_t v20 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
  }

  [*(id *)(a1 + 32) setBackgroundColor:*((void *)&v12 + 1)];
  int v10 = *(unsigned __int16 *)(*(void *)(a1 + 32) + 420);
  uint64_t v9 = *(void *)(a1 + 32) + 420;
  unsigned int v11 = v10 & 0xFFFFFF7F | (*(unsigned __int8 *)(*(void *)(a1 + 32) + 422) << 16);
  *(_WORD *)uint64_t v9 = v10 & 0xFF7F | v3 & 0x80;
  *(unsigned char *)(v9 + 2) = BYTE2(v11);
  __destructor_8_s8_s16_s24_s80((uint64_t)&v12);
}

- (BOOL)_forwardsSystemLayoutFittingSizeToContentView:(id)a3
{
  if (self->_contentView == a3) {
    return -[UIView _wantsAutolayoutOrIsGuardingForEngineHosting]((uint64_t)a3);
  }
  else {
    return 0;
  }
}

- (UICellConfigurationState)_configurationState
{
  __int16 v3 = [UICellConfigurationState alloc];
  __int16 v4 = [(UIView *)self traitCollection];
  id v5 = [(UIViewConfigurationState *)v3 initWithTraitCollection:v4];

  [(UIViewConfigurationState *)v5 setDisabled:[(UIView *)self isUserInteractionEnabled] ^ 1];
  [(UIViewConfigurationState *)v5 setHighlighted:[(UITableViewCell *)self isHighlighted]];
  [(UIViewConfigurationState *)v5 setSelected:[(UITableViewCell *)self isSelected]];
  [(UIViewConfigurationState *)v5 setFocused:[(UIView *)self isFocused]];
  [(UICellConfigurationState *)v5 setEditing:[(UITableViewCell *)self isEditing]];
  [(UICellConfigurationState *)v5 setSwiped:[(UITableViewCell *)self _isSwiped]];
  [(UICellConfigurationState *)v5 setReordering:[(UITableViewCell *)self _isReordering]];
  if ([(UITableViewCell *)self _isShowingCompactContextMenu]) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 0;
  }
  [(UIViewConfigurationState *)v5 _setContextMenuGroupLocation:v6];
  [(UICellConfigurationState *)v5 _setUsesAnyPlainListStyle:[(UITableViewCell *)self tableViewStyle] == 0];
  int64_t v7 = [(UITableViewCell *)self _dragState];
  if ((unint64_t)(v7 - 1) <= 1) {
    [(UICellConfigurationState *)v5 setCellDragState:v7];
  }
  [(UICellConfigurationState *)v5 setCellDropState:[(UITableViewCell *)self _dropState]];
  return v5;
}

- (BOOL)isEditing
{
  return *((unsigned char *)&self->_tableCellFlags + 1) & 1;
}

- (BOOL)isSelected
{
  return *(unsigned char *)&self->_tableCellFlags >> 7;
}

- (BOOL)isHighlighted
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 10) & 1;
}

- (int64_t)tableViewStyle
{
  return *(void *)((char *)&self->_tableCellFlags + 4) & 0x1FLL;
}

- (BOOL)_isSwiped
{
  return (*((unsigned __int8 *)&self->_tableCellFlags + 1) >> 1) & 1;
}

- (BOOL)_isShowingCompactContextMenu
{
  return (*((unsigned __int8 *)&self->_tableCellFlags + 1) >> 3) & 1;
}

- (int64_t)_dropState
{
  return self->_dropState;
}

- (int64_t)_dragState
{
  return self->_dragState;
}

- (id)_backgroundView:(BOOL)a3
{
  if (a3
    && ![(UITableViewCell *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration])
  {
    [(UITableViewCell *)self _setupBackgroundView];
  }
  backgroundView = self->_backgroundView;
  return backgroundView;
}

- (BOOL)_usingBackgroundConfigurationOrDefaultBackgroundConfiguration
{
  int v3 = dyld_program_sdk_at_least();
  if (v3) {
    LOBYTE(v3) = [(UITableViewCell *)self _usingBackgroundViewConfiguration]
  }
              || (*((_WORD *)&self->_tableCellFlags + 6) & 0x1B80) == 0
              && (*((_WORD *)&self->_tableCellFlags + 6) & 0x400) == 0;
  return v3;
}

- (BOOL)_usingBackgroundViewConfiguration
{
  return self->_systemBackgroundView || self->_backgroundViewConfigurationProvider != 0;
}

- (UIFocusContainerGuide)_editingControlsFocusGuide
{
  return self->_editingControlsFocusGuide;
}

- (void)_updateAccessoryMetrics
{
  int v3 = [(UITableViewCell *)self _accessoryManager];
  if (v3)
  {
    [(UITableViewCell *)self _effectiveSafeAreaInsets];
    objc_msgSend(v3, "setSafeAreaInsets:");
    __int16 v4 = [(UIView *)self traitCollection];
    id v5 = [(UITableViewCell *)self _constants];
    objc_initWeak(&location, self);
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0xFFEFFFFFFFFFFFFFLL;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __42__UITableViewCell__updateAccessoryMetrics__block_invoke;
    v20[3] = &unk_1E53087B8;
    long long v23 = v24;
    id v6 = v4;
    id v21 = v6;
    id v7 = v5;
    id v22 = v7;
    [v3 setStandardLayoutWidthProvider:v20];
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0xFFEFFFFFFFFFFFFFLL;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42__UITableViewCell__updateAccessoryMetrics__block_invoke_2;
    v15[3] = &unk_1E52E4700;
    long long v17 = v19;
    id v8 = v7;
    id v16 = v8;
    objc_copyWeak(&v18, &location);
    [v3 setDisclosureLayoutWidthProvider:v15];
    uint64_t v9 = [v3 leadingLayout];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__UITableViewCell__updateAccessoryMetrics__block_invoke_3;
    v13[3] = &unk_1E52E4688;
    objc_copyWeak(&v14, &location);
    [v9 setSpacingBlock:v13];
    int v10 = [v3 trailingLayout];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__UITableViewCell__updateAccessoryMetrics__block_invoke_4;
    v11[3] = &unk_1E52E4688;
    objc_copyWeak(&v12, &location);
    [v10 setSpacingBlock:v11];
    objc_destroyWeak(&v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v18);

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v24, 8);
    objc_destroyWeak(&location);
  }
}

- (UIEdgeInsets)_effectiveSafeAreaInsets
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  if ([(UITableViewCell *)self _insetsContentViewsToSafeArea])
  {
    id v7 = [(UIView *)self superview];

    if (v7)
    {
      [(UIView *)self safeAreaInsets];
      double v6 = v8;
      double v5 = v9;
      double v4 = v10;
      double v3 = v11;
    }
    else
    {
      id v12 = [(UITableViewCell *)self _tableView];
      [v12 _cellSafeAreaInsets];
      double v6 = UIEdgeInsetsAdd(10, 0.0, 0.0, 0.0, 0.0, v13);
      double v5 = v14;
      double v4 = v15;
      double v3 = v16;
    }
  }
  int v17 = *((_DWORD *)&self->super._viewFlags + 4);
  double indexBarExtentFromEdge = self->_indexBarExtentFromEdge;
  double v19 = fmax(v5, indexBarExtentFromEdge);
  double v20 = fmax(v3, indexBarExtentFromEdge);
  if ((v17 & 0x80000) != 0) {
    double v21 = v3;
  }
  else {
    double v21 = v20;
  }
  if ((*(void *)&v17 & 0x80000) == 0) {
    double v19 = v5;
  }
  double v22 = v6;
  double v23 = v4;
  result.right = v21;
  result.double bottom = v23;
  result.left = v19;
  result.double top = v22;
  return result;
}

- (BOOL)_insetsContentViewsToSafeArea
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 58) & 1;
}

- (void)_updateAccessoriesIfNeeded
{
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x800000000000000) != 0) {
    [(UITableViewCell *)self _updateAccessories];
  }
}

- (void)_updateModernCellAccessoriesForState:(id)a3 isEditing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  double v6 = &_UITableCellAccessoryConfigurationIdentifierEditing;
  BOOL v26 = v4;
  if (!v4) {
    double v6 = &_UITableCellAccessoryConfigurationIdentifierNormal;
  }
  id v7 = (id)*v6;
  double v8 = [(UITableViewCell *)self _accessoryManager];
  double v9 = [v8 configurations];
  long long v25 = v7;
  double v10 = [v9 objectForKeyedSubscript:v7];

  double v11 = [v10 leadingAccessories];
  long long v24 = v10;
  double v22 = [v10 trailingAccessories];
  double v23 = v11;
  id v12 = [v11 arrayByAddingObjectsFromArray:v22];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        int v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v18 = [v17 identifier];
        if (v18 == @"delete")
        {
          int64_t v19 = 2;
        }
        else if (v18 == @"insert")
        {
          int64_t v19 = 3;
        }
        else if (v18 == @"multiselect")
        {
          int64_t v19 = 5;
        }
        else if (v18 == @"checkmark")
        {
          int64_t v19 = 1;
        }
        else if (v18 == @"chevron")
        {
          int64_t v19 = 0;
        }
        else if (v18 == @"reorder")
        {
          int64_t v19 = 4;
        }
        else if (v18 == @"expand")
        {
          int64_t v19 = 6;
        }
        else
        {
          if (v18 != @"info")
          {

            int64_t v19 = [(UITableViewCell *)self _currentAccessoryTypeForEditing:v26];
            goto LABEL_26;
          }
          int64_t v19 = 9;
        }

LABEL_26:
        double v20 = [v17 identifier];

        if (v20 != @"custom")
        {
          double v21 = [v17 view];
          [(UITableViewCell *)self _updateSystemTypeAccessoryView:v21 withCellAccessoryType:v19 forState:v27];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }
}

double __42__UITableViewCell__updateAccessoryMetrics__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  double v8 = [WeakRetained _constants];
  [v8 interspaceBetweenInnerAccessoryIdentifier:v6 outerAccessoryIdentifier:v5 forCell:WeakRetained trailingAccessoryGroup:1];
  double v10 = v9;

  return v10;
}

- (void)_updateSystemTypeAccessoryView:(id)a3 withCellAccessoryType:(int64_t)a4 forState:(id)a5
{
  id v20 = a3;
  id v8 = a5;
  double v9 = [(UIView *)self traitCollection];
  LODWORD(v10) = [v9 _hasSplitViewControllerContextSidebarColumn];

  double v11 = [(UITableViewCell *)self _tableView];
  id v12 = [v11 _accessoryBaseColor];

  if (v12)
  {
    uint64_t v10 = v10;
  }
  else
  {
    constants = self->_constants;
    uint64_t v10 = v10;
    uint64_t v14 = [(UIView *)self traitCollection];
    uint64_t v15 = [(UIView *)self tintColor];
    id v12 = [(UITableConstants *)constants defaultAccessoryTintColorForAccessorySystemType:a4 header:0 sidebarStyle:v10 cellConfigurationState:v8 traitCollection:v14 inheritedTintColor:v15];
  }
  double v16 = self->_constants;
  int v17 = [(UIView *)self traitCollection];
  id v18 = [(UITableConstants *)v16 defaultAccessoryBackgroundColorForAccessorySystemType:a4 header:0 sidebarStyle:v10 cellConfigurationState:v8 traitCollection:v17];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v20 setTintColor:v12];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
LABEL_9:
    [v20 setAccessoryTintColor:v12];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v20;
      [v19 setAccessoryTintColor:v12];
      [v19 setAccessoryBackgroundColor:v18];
      [v19 _updateImageView];
    }
  }
LABEL_10:
}

- (double)_minimumCellAccessoryMargin
{
  return self->_defaultTrailingCellMarginWidth;
}

double __42__UITableViewCell__updateAccessoryMetrics__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (result == -1.79769313e308)
  {
    BOOL v3 = _UITableCellSupportsHorizontalCenteringBehaviorForTraitCollection(*(void **)(a1 + 32));
    uint64_t v4 = 0;
    if (v3) {
      objc_msgSend(*(id *)(a1 + 40), "defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:traitCollection:", 0, *(void *)(a1 + 32), 0.0);
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
    return *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  return result;
}

- (int64_t)_currentAccessoryTypeForEditing:(BOOL)a3
{
  unsigned int tableCellFlags = self->_tableCellFlags;
  if (!a3) {
    return (tableCellFlags >> 15) & 7;
  }
  unsigned int v4 = (tableCellFlags >> 18) & 7;
  if (!v4) {
    return (tableCellFlags >> 15) & 7;
  }
  return v4;
}

- (void)_executeConfigurationUpdate
{
  if (a1)
  {
    v2 = (void *)_UISetCurrentFallbackEnvironment(a1);
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
    id v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, a1, v3);
    }
    [a1 _updateCellForCurrentBackgroundConfiguration];
    memcpy(v7, __src, sizeof(v7));
    id v6 = (char *)GetTraitCollectionTSD() + 16;
    memcpy(__dst, v6, sizeof(__dst));
    memcpy(v6, v7, 0x160uLL);
    -[UIView _recordTraitUsage:insideMethod:withInvalidationAction:](a1, (uint64_t)&__dst[136], [a1 methodForSelector:sel_updateConfigurationUsingState_], sel_setNeedsUpdateConfiguration);
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      [a1 _layoutSystemBackgroundView:1];
    }
    _UIRestorePreviousFallbackEnvironment(v2);
  }
}

- (void)_updateAccessories
{
  v35[2] = *MEMORY[0x1E4F143B8];
  p_unsigned int tableCellFlags = &self->_tableCellFlags;
  *(void *)((char *)&self->_tableCellFlags + 4) &= ~0x800000000000000uLL;
  uint64_t v4 = [(UITableViewCell *)self _accessoryManager];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 configurations];
    objc_msgSend(v6, "objectForKeyedSubscript:");
    id v7 = (UICellAccessoryConfiguration *)objc_claimAutoreleasedReturnValue();

    id v8 = objc_alloc_init(UICellAccessoryConfiguration);
    double v9 = [(UITableViewCell *)self _leadingAccessoriesForEditing:0 style:0];
    [(UICellAccessoryConfiguration *)v8 setLeadingAccessories:v9];

    uint64_t v10 = [(UITableViewCell *)self _trailingAccessoriesForType:((unint64_t)*(_DWORD *)p_tableCellFlags >> 15) & 7 view:self->_customAccessoryView editing:0 style:0];
    [(UICellAccessoryConfiguration *)v8 setTrailingAccessories:v10];

    double v11 = [v5 configurations];
    uint64_t v33 = [v11 objectForKeyedSubscript:0x1ED16D800];

    id v12 = objc_alloc_init(UICellAccessoryConfiguration);
    int v13 = 1;
    uint64_t v14 = [(UITableViewCell *)self _leadingAccessoriesForEditing:1 style:((unint64_t)*(_DWORD *)p_tableCellFlags >> 12) & 7];
    [(UICellAccessoryConfiguration *)v12 setLeadingAccessories:v14];

    uint64_t v15 = [(UITableViewCell *)self _trailingAccessoriesForType:((unint64_t)*(_DWORD *)p_tableCellFlags >> 18) & 7 view:self->_customEditingAccessoryView editing:1 style:((unint64_t)*(_DWORD *)p_tableCellFlags >> 12) & 7];
    [(UICellAccessoryConfiguration *)v12 setTrailingAccessories:v15];

    uint64_t v16 = *(void *)((char *)p_tableCellFlags + 4);
    if ((v16 & 0x1000000000000000) != 0)
    {
      int v20 = *((unsigned __int16 *)p_tableCellFlags + 6) | (*((unsigned __int8 *)p_tableCellFlags + 14) << 16);
    }
    else
    {
      int v17 = v7;
      id v18 = v8;
      id v19 = v18;
      if (v17 == v18)
      {
        int v13 = 0;
      }
      else if (v17 && v18)
      {
        int v13 = ![(UICellAccessoryConfiguration *)v17 isEqual:v18];
      }

      int v20 = *((unsigned __int16 *)p_tableCellFlags + 6) | (*((unsigned __int8 *)p_tableCellFlags + 14) << 16);
      uint64_t v16 = *(void *)((char *)p_tableCellFlags + 4);
    }
    v32 = v7;
    if ((v16 & 0x1000000000000000) != 0)
    {
      if (v13) {
        long long v25 = v8;
      }
      else {
        long long v25 = v7;
      }
    }
    else
    {
      double v21 = v33;
      double v22 = v12;
      double v23 = v22;
      if (v21 == v22)
      {
        int v24 = 0;
LABEL_19:

        if ((v13 | v24) != 1)
        {
LABEL_31:
          long long v31 = [(UITableViewCell *)self configurationState];
          [(UITableViewCell *)self _updateCurrentSystemTypeAccessoryViewsUsingState:v31];

          goto LABEL_32;
        }
        BOOL v26 = v32;
        if (v13) {
          BOOL v26 = v8;
        }
        *(void *)((char *)p_tableCellFlags + 4) &= ~0x1000000000000000uLL;
        id v27 = v26;
        if ((v24 & 1) == 0)
        {
LABEL_30:
          v34[0] = 0x1ED109440;
          v34[1] = 0x1ED16D800;
          v35[0] = v27;
          v35[1] = v21;
          long long v28 = (void *)MEMORY[0x1E4F1C9E8];
          long long v29 = v21;
          long long v30 = [v28 dictionaryWithObjects:v35 forKeys:v34 count:2];

          [v5 setConfigurations:v30];
          goto LABEL_31;
        }
LABEL_29:
        double v21 = v12;
        goto LABEL_30;
      }
      if (v21 && v22)
      {
        int v24 = ![(UICellAccessoryConfiguration *)v21 isEqual:v22];
        goto LABEL_19;
      }

      if (v13) {
        long long v25 = v8;
      }
      else {
        long long v25 = v7;
      }
      int v20 = *((unsigned __int16 *)p_tableCellFlags + 6) | (*((unsigned __int8 *)p_tableCellFlags + 14) << 16);
      uint64_t v16 = *(void *)((char *)p_tableCellFlags + 4);
    }
    *(void *)((char *)p_tableCellFlags + 4) = v16 & 0xEFFFFFFFFFFFFFFFLL;
    *((_WORD *)p_tableCellFlags + 6) = v20;
    *((unsigned char *)p_tableCellFlags + 14) = BYTE2(v20);
    id v27 = v25;
    goto LABEL_29;
  }
LABEL_32:
}

- (id)_leadingAccessoriesForEditing:(BOOL)a3 style:(int64_t)a4
{
  BOOL v5 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  int64_t v8 = [(UITableViewCell *)self _sanitizedEditingStyleForEditing:v5 style:a4];
  if ([(UITableViewCell *)self _editControlShouldBeOnLeadingSideForStyle:v8])
  {
    double v9 = [(UITableViewCell *)self _editControlAccessoryForStyle:v8];
    if (v9) {
      [v7 addObject:v9];
    }
  }
  if (v5 && ![v7 count] && (*(void *)((char *)&self->_tableCellFlags + 4) & 0x20) != 0)
  {
    uint64_t v10 = [(UITableViewCell *)self _constants];
    double v11 = [(UIView *)self traitCollection];
    [v10 defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:0 traitCollection:v11];
    double v13 = v12;

    if (v13 > 0.0)
    {
      uint64_t v14 = +[_UICellSpacingAccessory accessoryWithIdentifier:@"spacing", v13, 1.0 size];
      [v7 addObject:v14];
    }
  }
  return v7;
}

- (id)_trailingAccessoriesForType:(int64_t)a3 view:(id)a4 editing:(BOOL)a5 style:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  double v11 = [MEMORY[0x1E4F1CA48] array];
  double v12 = [(UITableViewCell *)self _badgeText];
  if (![v12 length])
  {

LABEL_14:
    BOOL v16 = 0;
    uint64_t v15 = 0;
    if (v10) {
      goto LABEL_7;
    }
LABEL_15:
    switch(a3)
    {
      case 1:
        goto LABEL_22;
      case 2:
        int v24 = [(UITableViewCell *)self _accessoryViewForType:4];
        long long v25 = +[_UICellViewAccessory accessoryWithIdentifier:@"info" view:v24 options:1];
        [v11 addObject:v25];

        if (v16) {
          [v11 addObject:v15];
        }
LABEL_22:
        int v20 = [(UITableViewCell *)self _accessoryViewForType:1];
        uint64_t v26 = +[_UICellViewAccessory accessoryWithIdentifier:@"chevron" view:v20 options:1 reservedLayoutWidth:1.79769313e308];
        goto LABEL_26;
      case 3:
        int v20 = [(UITableViewCell *)self _accessoryViewForType:3];
        double v21 = @"checkmark";
        goto LABEL_25;
      case 4:
        int v20 = [(UITableViewCell *)self _accessoryViewForType:4];
        double v21 = @"info";
        goto LABEL_25;
      case 5:
      case 6:
        int v20 = [(UITableViewCell *)self _accessoryViewForType:5];
        double v21 = @"expand";
        goto LABEL_25;
      case 7:
      case 8:
        double v22 = [(UITableViewCell *)self _accessoryViewForType:5];
        double v23 = +[_UICellViewAccessory accessoryWithIdentifier:@"expand" view:v22 options:1];
        [v11 addObject:v23];

        if (v16) {
          [v11 addObject:v15];
        }
        int v20 = [(UITableViewCell *)self _accessoryViewForType:1];
        double v21 = @"chevron";
LABEL_25:
        uint64_t v26 = +[_UICellViewAccessory accessoryWithIdentifier:v21 view:v20 options:1];
LABEL_26:
        id v27 = (void *)v26;
        [v11 addObject:v26];

        goto LABEL_27;
      default:
        goto LABEL_28;
    }
  }
  uint64_t v13 = *(void *)((char *)&self->_tableCellFlags + 4);

  if ((v13 & 0x2000000000000000) == 0) {
    goto LABEL_14;
  }
  uint64_t v14 = [(UITableViewCell *)self _badge];
  uint64_t v15 = +[_UICellViewAccessory accessoryWithIdentifier:@"badge" view:v14 options:1];

  BOOL v16 = v15 != 0;
  if (a3 != 2 && v15)
  {
    [v11 addObject:v15];
    BOOL v16 = 1;
  }
  if (!v10) {
    goto LABEL_15;
  }
LABEL_7:
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v18 = 1.79769313e308;
  if ((isKindOfClass & 1) == 0) {
    double v18 = 0.0;
  }
  if (v7) {
    id v19 = @"customEditing";
  }
  else {
    id v19 = @"custom";
  }
  int v20 = +[_UICellViewAccessory accessoryWithIdentifier:v19 view:v10 options:12 reservedLayoutWidth:v18];
  [v11 addObject:v20];
LABEL_27:

LABEL_28:
  int64_t v28 = [(UITableViewCell *)self _sanitizedEditingStyleForEditing:v7 style:a6];
  if (![(UITableViewCell *)self _editControlShouldBeOnLeadingSideForStyle:v28])
  {
    long long v29 = [(UITableViewCell *)self _editControlAccessoryForStyle:v28];
    if (v29) {
      [v11 addObject:v29];
    }
  }
  if ((*((unsigned char *)&self->_tableCellFlags + 2) & 0x20) != 0
    && (*(void *)((char *)&self->_tableCellFlags + 4) & 0x400000000200) != 0x200)
  {
    if (a3 || v10)
    {
      long long v30 = [(UITableViewCell *)self editingData:1];
      long long v31 = [v30 reorderSeparatorView:1];
      v32 = +[_UICellViewAccessory accessoryWithIdentifier:@"reorderSeparator" view:v31 options:1];
      [v11 addObject:v32];
    }
    uint64_t v33 = [(UITableViewCell *)self editingData:1];
    v34 = [v33 reorderControl:1];
    v35 = +[_UICellViewAccessory accessoryWithIdentifier:@"reorder" view:v34 options:1];
    [v11 addObject:v35];
  }
  return v11;
}

- (int64_t)_sanitizedEditingStyleForEditing:(BOOL)a3 style:(int64_t)a4
{
  if (!a3) {
    return 0;
  }
  p_unsigned int tableCellFlags = &self->_tableCellFlags;
  if ((*(_DWORD *)&self->_tableCellFlags & 0x7000) == 0x3000) {
    return 3;
  }
  id v6 = [(UITableViewCell *)self _tableView];
  if (([v6 allowsMultipleSelectionDuringEditing] & 1) == 0)
  {

    return a4;
  }
  __int16 v7 = *((_WORD *)p_tableCellFlags + 6);

  if ((v7 & 4) == 0) {
    return 3;
  }
  return a4;
}

- (BOOL)_editControlShouldBeOnLeadingSideForStyle:(int64_t)a3
{
  return 1;
}

- (id)_editControlAccessoryForStyle:(int64_t)a3
{
  id v6 = 0;
  switch(a3)
  {
    case 0:
      goto LABEL_9;
    case 1:
      id v6 = @"delete";
      goto LABEL_5;
    case 2:
      id v6 = @"insert";
      goto LABEL_5;
    case 3:
      id v6 = @"multiselect";
      goto LABEL_5;
    default:
LABEL_5:
      __int16 v7 = [(UITableViewCell *)self editingData:1];
      int64_t v8 = [v7 editControl:1];
      id v6 = +[_UICellViewAccessory accessoryWithIdentifier:v6 view:v8 options:5 reservedLayoutWidth:0.0];

      if (!v6)
      {
        if (dyld_program_sdk_at_least())
        {
          id v10 = [MEMORY[0x1E4F28B00] currentHandler];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
          double v12 = [WeakRetained description];
          [v10 handleFailureInMethod:a2, self, @"UITableViewCell.m", 8135, @"Invalid editing style detected (%tu). This is likely due to an invalid value being returned from the implementation of -tableView:editingStyleForRowAtIndexPath: of this table view's delegate: %@", a3, v12 object file lineNumber description];
        }
        id v6 = 0;
      }
LABEL_9:
      return v6;
  }
}

- (id)_badgeText
{
  if (![(UITableViewCell *)self _usesModernAccessoriesLayout]
    || (*(void *)((char *)&self->_tableCellFlags + 4) & 0x2000000000000000) != 0)
  {
    uint64_t v4 = [(UITableViewCell *)self _badge];
    BOOL v3 = [v4 text];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (void)_updateCurrentSystemTypeAccessoryViewsUsingState:(id)a3
{
  id v9 = a3;
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x800000000000000) == 0)
  {
    char v4 = 0;
    char v5 = 1;
    do
    {
      char v6 = v5;
      if ([(UITableViewCell *)self _usesModernAccessoriesLayout])
      {
        [(UITableViewCell *)self _updateModernCellAccessoriesForState:v9 isEditing:v4 & 1];
      }
      else
      {
        uint64_t v7 = v4 & 1;
        int64_t v8 = [(UITableViewCell *)self _existingSystemAccessoryView:v7];
        [(UITableViewCell *)self _updateSystemTypeAccessoryView:v8 withTableViewAccessoryType:[(UITableViewCell *)self _currentAccessoryTypeForEditing:v7] forState:v9];
      }
      char v5 = 0;
      char v4 = 1;
    }
    while ((v6 & 1) != 0);
  }
}

- (BOOL)_usesModernAccessoriesLayout
{
  return self->_accessoryManager != 0;
}

- (void)_applyBackgroundViewConfiguration:(id)a3 withState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  systemBackgroundView = self->_systemBackgroundView;
  if (v7)
  {
    if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x8000) != 0 && !self->_backgroundViewConfigurationProvider)
    {
      if (!v8)
      {
        double v11 = [(UITableViewCell *)self configurationState];
        id v9 = [(UITableViewCell *)self _stateForUpdatingBackgroundConfigurationWithState:v11];
      }
      id v23 = [v7 _updatedConfigurationForState:v9];
      if (!v23)
      {
        double v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2, self, @"UITableViewCell.m", 3739, @"Updated configuration was nil for configuration: %@", v7 object file lineNumber description];
      }
    }
    else
    {
      id v23 = v7;
    }
  }
  else
  {
    id v23 = 0;
  }
  objc_msgSend(v23, "__setMaskedCorners:", -[UITableViewCell _maskedCornersForSystemBackgroundView](self, "_maskedCornersForSystemBackgroundView"));
  if (v7)
  {
    if ([(UITableViewCell *)self _appliesMaskingToBackgroundConfiguration])
    {
      if ([(UITableViewCell *)self _usesRoundedGroups])
      {
        [(UITableViewCell *)self _roundedGroupCornerRadius];
        if (v12 > 0.0)
        {
          [(UITableViewCell *)self _roundedGroupCornerRadius];
          objc_msgSend(v23, "_setCornerRadius:");
        }
      }
    }
    if (systemBackgroundView)
    {
      [(_UISystemBackgroundView *)self->_systemBackgroundView setConfiguration:v23];
      [(UIView *)self setNeedsLayout];
    }
    else
    {
      [(UITableViewCell *)self _resetBackgroundViewsAndColor];
      uint64_t v14 = [[_UISystemBackgroundView alloc] initWithConfiguration:v23];
      uint64_t v15 = self->_systemBackgroundView;
      self->_systemBackgroundView = v14;

      uint64_t v16 = [(_UIFloatingContentView *)self->_floatingContentView contentView];
      int v17 = (void *)v16;
      if (v16) {
        double v18 = (UITableViewCell *)v16;
      }
      else {
        double v18 = self;
      }
      id v19 = v18;

      [(UIView *)v19 insertSubview:self->_systemBackgroundView atIndex:0];
      [(UIView *)self setNeedsLayout];
    }
    if ([(UITableViewCell *)self isHighlighted]
      || [(UITableViewCell *)self isSelected]
      || [(UIView *)self isFocused])
    {
      goto LABEL_29;
    }
    int v20 = (_UIBackgroundConfigurationInternal *)[v23 copyWithZone:0];
    lastNormalBackgroundViewConfiguration = self->_lastNormalBackgroundViewConfiguration;
    self->_lastNormalBackgroundViewConfiguration = v20;
  }
  else
  {
    if (!systemBackgroundView)
    {
      [(UITableViewCell *)self _updateContentClip];
      goto LABEL_33;
    }
    [(UIView *)self->_systemBackgroundView removeFromSuperview];
    lastNormalBackgroundViewConfiguration = self->_systemBackgroundView;
    self->_systemBackgroundView = 0;
  }

LABEL_29:
  [(UITableViewCell *)self _updateContentClip];
  if ([(UIView *)self isFocused]
    && +[UIFocusRingManager focusRingAvailable])
  {
    unsigned int v21 = ((*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16) | 0x20000u) >> 16;
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((unsigned char *)&self->_tableCellFlags + 14) = v21;
    [(UIView *)self setNeedsLayout];
  }
LABEL_33:
}

- (void)_setAnimating:(BOOL)a3 clippingAdjacentCells:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(UITableViewCell *)self _shouldMaskToBoundsWhileAnimating];
  BOOL v8 = [(UITableViewCell *)self _usesRoundedGroups];
  uint64_t v9 = 0x100000000;
  if (!v5) {
    uint64_t v9 = 0;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFEFFFFFFFFLL | v9;
  [(UITableViewCell *)self _updateContentClip];
  if (v5)
  {
    if (v8 || !v7 || !v4) {
      return;
    }
    if (self->_clearBlendingView)
    {
      [(UIView *)self bounds];
      -[UIView setFrame:](self->_clearBlendingView, "setFrame:");
    }
    else
    {
      uint64_t v13 = [UIView alloc];
      [(UIView *)self bounds];
      uint64_t v14 = -[UIView initWithFrame:](v13, "initWithFrame:");
      clearBlendingView = self->_clearBlendingView;
      self->_clearBlendingView = v14;

      [(UIView *)self->_clearBlendingView setAutoresizingMask:18];
      uint64_t v16 = [(UIView *)self->_clearBlendingView layer];
      [v16 setMasksToBounds:1];
      [v16 setCompositingFilter:*MEMORY[0x1E4F3A060]];
    }
    int v17 = [(UITableViewCell *)self backgroundColor];
    [(UIView *)self->_clearBlendingView setBackgroundColor:v17];

    double v18 = [(UIView *)self->_clearBlendingView superview];

    if (v18 != self) {
      [(UIView *)self insertSubview:self->_clearBlendingView atIndex:0];
    }
    double v11 = [(UIView *)self layer];
    id v19 = v11;
    BOOL v12 = 0;
  }
  else
  {
    [(UIView *)self->_clearBlendingView removeFromSuperview];
    BOOL v10 = (*(void *)((char *)&self->_tableCellFlags + 4) & 0x38000000000) == 0;
    double v11 = [(UIView *)self layer];
    id v19 = v11;
    BOOL v12 = v10;
  }
  [v11 setAllowsGroupBlending:v12];
}

- (void)_setContentClipCorners:(unint64_t)a3 updateCorners:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = [(UIView *)self layer];
  BOOL v7 = [(UITableViewCell *)self _swipeContainerView];
  BOOL v8 = [v7 layer];

  if (v8)
  {
    [v13 setCornerRadius:0.0];
    [v13 setMasksToBounds:0];
    id v9 = v8;

    BOOL v10 = v9;
  }
  else
  {
    BOOL v10 = v13;
  }
  id v14 = v10;
  if (a3)
  {
    [v10 setMaskedCorners:a3];
    [(UITableViewCell *)self _roundedGroupCornerRadius];
    objc_msgSend(v14, "setCornerRadius:");
    [v14 setMasksToBounds:1];
    [v14 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  }
  else
  {
    if (v4)
    {
      [v10 setMaskedCorners:0];
      [v14 setCornerRadius:0.0];
      BOOL v10 = v14;
    }
    uint64_t v11 = *(void *)((char *)&self->_tableCellFlags + 4);
    if ((v11 & 0x200200000000) != 0)
    {
      BOOL v12 = 1;
    }
    else if ((v11 & 0x100000000) != 0)
    {
      BOOL v12 = [(UITableViewCell *)self _shouldMaskToBoundsWhileAnimating];
      BOOL v10 = v14;
    }
    else
    {
      BOOL v12 = 0;
    }
    [v10 setMasksToBounds:v12];
  }
}

- (void)_setFrame:(CGRect)a3 skipLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v10 = [(UITableViewCell *)self _dropAnimationContainerView];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setFrame:", x, y, width, height);
    double x = *MEMORY[0x1E4F1DAD8];
    double y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  BOOL v12 = [(UITableViewCell *)self _swipeContainerView];
  id v13 = v12;
  if (v12)
  {
    [v12 frame];
    objc_msgSend(v13, "setFrame:");
    double y = 0.0;
  }
  [(UITableViewCell *)self frame];
  double v15 = v14;
  double v17 = v16;
  v21.receiver = self;
  v21.super_class = (Class)UITableViewCell;
  -[UIView setFrame:](&v21, sel_setFrame_, x, y, width, height);
  if (!a4 && (v15 != width || v17 != height))
  {
    *(void *)((char *)&self->_tableCellFlags + 4) |= 0x800uLL;
    double v18 = [(UIView *)self window];
    if (v18)
    {
      id v19 = v18;
      if (self->_contentView || self->_backgroundView)
      {
      }
      else
      {
        int v20 = [(UITableViewCell *)self _selectedBackgroundView:0];

        if (!v20) {
          goto LABEL_13;
        }
      }
      [(UIView *)self setNeedsLayout];
    }
LABEL_13:
    [(UITableViewCell *)self _updateAccessoryMetrics];
  }
}

- (void)_updateContentClip
{
  if (![(UITableViewCell *)self _isReordering]
    || ([(UIView *)self traitCollection],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 userInterfaceIdiom],
        v3,
        v4 != 6))
  {
    if (![(UITableViewCell *)self _usesRoundedGroups]
      || [(UITableViewCell *)self _appliesMaskingToBackgroundConfiguration]
      && [(UITableViewCell *)self _usingBackgroundViewConfiguration])
    {
      if (objc_opt_respondsToSelector())
      {
        constants = self->_constants;
        char v6 = [(UITableViewCell *)self _tableView];
        uint64_t v7 = [(UITableConstants *)constants contentClipCornersForCell:self inTableView:v6];

        BOOL v8 = self;
        uint64_t v9 = v7;
LABEL_14:
        unint64_t v10 = 1;
      }
      else
      {
        unint64_t v10 = ((unint64_t)*((unsigned __int16 *)&self->_tableCellFlags + 6) >> 3) & 1;
        BOOL v8 = self;
        uint64_t v9 = 0;
      }
      [(UITableViewCell *)v8 _setContentClipCorners:v9 updateCorners:v10];
    }
    else
    {
      *((_WORD *)&self->_tableCellFlags + 6) |= 8u;
      switch([(UITableViewCell *)self sectionLocation])
      {
        case 0:
        case 4:
          BOOL v8 = self;
          uint64_t v9 = 15;
          goto LABEL_14;
        case 1:
          BOOL v8 = self;
          uint64_t v9 = 0;
          goto LABEL_14;
        case 2:
          BOOL v8 = self;
          uint64_t v9 = 3;
          goto LABEL_14;
        case 3:
          BOOL v8 = self;
          uint64_t v9 = 12;
          goto LABEL_14;
        default:
          return;
      }
    }
  }
}

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  v32.receiver = self;
  v32.super_class = (Class)UITableViewCell;
  [(UIView *)&v32 _concreteDefaultLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(UIView *)self traitCollection];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 == 6)
  {
    id v13 = [(UITableViewCell *)self _constants];
    [(UITableViewCell *)self frame];
    objc_msgSend(v13, "defaultLayoutMarginsInsideSectionForSize:tableStyle:", *(void *)((char *)&self->_tableCellFlags + 4) & 0x1FLL, v14, v15);
    double v4 = v16;
    double v6 = v17;
    double v8 = v18;
    double v10 = v19;
LABEL_5:

    goto LABEL_6;
  }
  if ([(UITableViewCell *)self _usesRoundedGroups])
  {
    id v13 = [(UITableViewCell *)self _constants];
    int v20 = [(UIView *)self window];
    objc_super v21 = [v20 screen];
    [(UITableViewCell *)self frame];
    objc_msgSend(v13, "defaultTableLayoutMarginsForScreen:size:tableStyle:", v21, 2, v22, v23);
    double v4 = v24;
    double v6 = v25;
    double v8 = v26;
    double v10 = v27;

    goto LABEL_5;
  }
LABEL_6:
  double v28 = v4;
  double v29 = v6;
  double v30 = v8;
  double v31 = v10;
  result.right = v31;
  result.double bottom = v30;
  result.left = v29;
  result.double top = v28;
  return result;
}

- (BOOL)_usesRoundedGroups
{
  if (objc_opt_respondsToSelector())
  {
    constants = self->_constants;
    uint64_t v4 = *(void *)((char *)&self->_tableCellFlags + 4) & 0x1FLL;
    double top = self->_backgroundInset.top;
    double left = self->_backgroundInset.left;
    double bottom = self->_backgroundInset.bottom;
    double right = self->_backgroundInset.right;
    return -[UITableConstants shouldUseRoundedGroupsForTableViewStyle:backgroundInsets:](constants, "shouldUseRoundedGroupsForTableViewStyle:backgroundInsets:", v4, top, left, bottom, right);
  }
  else
  {
    unint64_t v10 = *(void *)((char *)&self->_tableCellFlags + 4) & 0x1FLL;
    BOOL v11 = v10 > 0x10;
    uint64_t v12 = (1 << v10) & 0x10006;
    BOOL v13 = v11 || v12 == 0;
    return !v13 && self->_backgroundInset.left > 0.0 && self->_backgroundInset.right > 0.0;
  }
}

- (id)_constants
{
  constants = self->_constants;
  if (constants)
  {
    double v3 = constants;
  }
  else
  {
    uint64_t v4 = [(UIView *)self traitCollection];
    _UITableConstantsForTraitCollection(v4);
    double v3 = (UITableConstants *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (CGPoint)center
{
  v12.receiver = self;
  v12.super_class = (Class)UITableViewCell;
  [(UIView *)&v12 center];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(UITableViewCell *)self _swipeContainerView];
  double v8 = v7;
  if (v7)
  {
    [v7 center];
    double v6 = v9;
  }

  double v10 = v4;
  double v11 = v6;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGRect)frame
{
  v18.receiver = self;
  v18.super_class = (Class)UITableViewCell;
  [(UIView *)&v18 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(UITableViewCell *)self _swipeContainerView];
  objc_super v12 = v11;
  if (v11)
  {
    [v11 frame];
    double v6 = v13;
  }

  double v14 = v4;
  double v15 = v6;
  double v16 = v8;
  double v17 = v10;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)_swipeContainerView
{
  id v2 = [(UITableViewCell *)self _containerView];
  if (v2)
  {
    double v3 = v2;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = v3;
    }
    else {
      id v2 = 0;
    }
  }
  return v2;
}

- (id)_containerView
{
  id v2 = [(UIView *)self superview];
  if (v2)
  {
    double v3 = v2;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = v3;
    }
    else {
      id v2 = 0;
    }
  }
  return v2;
}

- (BOOL)_isReordering
{
  return (*((unsigned __int8 *)&self->_tableCellFlags + 1) >> 2) & 1;
}

- (id)_dropAnimationContainerView
{
  id v2 = [(UITableViewCell *)self _containerView];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (int)sectionLocation
{
  return *((unsigned char *)&self->_tableCellFlags + 3) & 7;
}

- (BOOL)_appliesMaskingToBackgroundConfiguration
{
  unsigned int tableCellFlags = self->_tableCellFlags;
  if ((tableCellFlags & 0x400) != 0 || (*((_WORD *)&self->_tableCellFlags + 6) & 0x10) != 0) {
    LOBYTE(v3) = 1;
  }
  else {
    return (tableCellFlags >> 11) & 1;
  }
  return v3;
}

- (BOOL)_shouldMaskToBoundsWhileAnimating
{
  id v2 = [(UITableViewCell *)self editingData:0];
  char v3 = [v2 wantsMaskingWhileAnimatingDisabled];

  return v3 ^ 1;
}

- (id)editingData:(BOOL)a3
{
  if (self->_editingData) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    double v6 = [UITableViewCellEditingData alloc];
    int v7 = *(_DWORD *)&self->_tableCellFlags & 0x7000;
    if (v7 == 12288)
    {
      unint64_t v8 = 3;
    }
    else
    {
      char v3 = [(UITableViewCell *)self _tableView];
      if (![v3 allowsMultipleSelectionDuringEditing]
        || (*((_WORD *)&self->_tableCellFlags + 6) & 4) != 0)
      {
        unint64_t v8 = ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 12) & 7;
      }
      else
      {
        unint64_t v8 = 3;
      }
    }
    double v9 = [(UITableViewCellEditingData *)v6 initWithTableViewCell:self editingStyle:v8];
    id editingData = self->_editingData;
    self->_id editingData = v9;

    if (v7 != 12288) {
  }
    }
  id v11 = self->_editingData;
  return v11;
}

- (double)_roundedGroupCornerRadius
{
  char v3 = [(UITableViewCell *)self _tableView];
  double v4 = v3;
  if (!v3 || ([v3 _sectionCornerRadius], v5 == -1.0))
  {
    unint64_t v8 = [(UIView *)self traitCollection];
    [v8 userInterfaceIdiom];

    double v7 = 10.0;
  }
  else
  {
    [v4 _sectionCornerRadius];
    double v7 = v6;
  }

  return v7;
}

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(UIView *)self layoutMargins];
  if (left != v9 || right != v8) {
    [(UITableViewCell *)self _updateAccessoryMetrics];
  }
  v11.receiver = self;
  v11.super_class = (Class)UITableViewCell;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v11, sel__layoutMarginsDidChangeFromOldMargins_, top, left, bottom, right);
}

- (UITableViewCellConfigurationUpdateHandler)configurationUpdateHandler
{
  return self->_configurationUpdateHandler;
}

- (unint64_t)_viewConfigurationState
{
  id v2 = [(UITableViewCell *)self configurationState];
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
    double v6 = contentViewConfigurationProvider[2](contentViewConfigurationProvider, [(UITableViewCell *)self _viewConfigurationState]);
    [(UITableViewCell *)self _setContentViewConfiguration:v6];
LABEL_3:

    id v4 = v11;
    goto LABEL_4;
  }
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x4000) != 0)
  {
    id v11 = v4;
    if (self->_viewForContentConfiguration)
    {
      double v6 = [(UITableViewCell *)self contentConfiguration];
      if (!v6) {
        goto LABEL_3;
      }
      double v7 = self;
      double v8 = v6;
      id v9 = v11;
      uint64_t v10 = 0;
    }
    else
    {
      double v6 = [(UITableViewCell *)self _contentViewConfiguration];
      if (!v6) {
        goto LABEL_3;
      }
      double v7 = self;
      double v8 = v6;
      id v9 = v11;
      uint64_t v10 = 1;
    }
    [(UITableViewCell *)v7 _applyContentViewConfiguration:v8 withState:v9 usingSPI:v10];
    goto LABEL_3;
  }
LABEL_4:
}

- (void)_updateConfigurationUsingState:(id)a3
{
  [(UITableViewCell *)self _updateCurrentSystemTypeAccessoryViewsUsingState:a3];
  if (objc_opt_respondsToSelector())
  {
    contentView = self->_contentView;
    [(UIView *)contentView _defaultListContentConfigurationMayHaveChanged];
  }
}

- (void)_updateCellForCurrentBackgroundConfiguration
{
  if (!dyld_program_sdk_at_least()
    || self->_selectedBackgroundView
    || self->_multipleSelectionBackgroundView)
  {
    return;
  }
  unint64_t v3 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
  id v11 = v3;
  if (v3)
  {
    int v4 = [v3 _hasBackgroundFill];
    if ([(UITableViewCell *)self isHighlighted])
    {
      if (!v4) {
        goto LABEL_13;
      }
    }
    else if (([(UITableViewCell *)self isSelected] & v4 & 1) == 0)
    {
      goto LABEL_13;
    }
    lastNormalBackgroundViewConfiguration = self->_lastNormalBackgroundViewConfiguration;
    double v6 = [(UIView *)self tintColor];
    LOBYTE(lastNormalBackgroundViewConfiguration) = [v11 _backgroundFillIsEqual:lastNormalBackgroundViewConfiguration withTintColor:v6];

    if ((lastNormalBackgroundViewConfiguration & 1) == 0)
    {
      unsigned int v10 = ((*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16) | 0x10000u) >> 16;
      *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
      *((unsigned char *)&self->_tableCellFlags + 14) = v10;
      [(UITableViewCell *)self _applySelectedStateToSeparators:1];
      id v9 = [(UITableViewCell *)self _tableView];
      [v9 _cellDidShowSelectedBackground:self];
      goto LABEL_16;
    }
  }
  else if (![(UITableViewCell *)self isHighlighted])
  {
    [(UITableViewCell *)self isSelected];
  }
LABEL_13:
  int v7 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  if ((v7 & 0x10000) != 0)
  {
    unsigned int v8 = v7 & 0xFFFEFFFF;
    *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4);
    *((_WORD *)&self->_tableCellFlags + 6) = v8;
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v8);
    [(UITableViewCell *)self _applySelectedStateToSeparators:0];
    id v9 = [(UITableViewCell *)self _tableView];
    [v9 _cellDidHideSelectedBackground:self];
LABEL_16:
  }
}

- (id)_contentViewConfiguration
{
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0 && !self->_viewForContentConfiguration)
  {
    id v2 = [(UIView *)self->_contentView configuration];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (void)_setSectionLocation:(int)a3 animated:(BOOL)a4 forceBackgroundSetup:(BOOL)a5
{
  if ((*((unsigned char *)&self->_tableCellFlags + 3) & 7) != a3 || a5)
  {
    BOOL v6 = a4;
    char v7 = a3;
    unint64_t v9 = [(UITableViewCell *)self _maskedCornersForSystemBackgroundView];
    *(_DWORD *)&self->_unsigned int tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xF8FFFFFF | ((v7 & 7) << 24);
    unsigned int v10 = [(UITableViewCell *)self _selectedBackgroundView:0];
    void v15[4] = self;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__UITableViewCell__setSectionLocation_animated_forceBackgroundSetup___block_invoke;
    v16[3] = &unk_1E52E92B0;
    v16[4] = self;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__UITableViewCell__setSectionLocation_animated_forceBackgroundSetup___block_invoke_2;
    v15[3] = &unk_1E52D9F70;
    +[UIView conditionallyAnimate:v6 withAnimation:v16 layout:v15 completion:0];
    [(UITableViewCell *)self _updateContentClip];
    if (v9 != [(UITableViewCell *)self _maskedCornersForSystemBackgroundView])
    {
      id v11 = [(UITableViewCell *)self backgroundConfiguration];
      objc_super v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        id v13 = [(UITableViewCell *)self _backgroundViewConfiguration];
      }
      double v14 = v13;

      [(UITableViewCell *)self _applyBackgroundViewConfiguration:v14 withState:0];
    }
  }
}

- (id)_selectedBackgroundView:(BOOL)a3
{
  if (a3
    && ![(UITableViewCell *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration])
  {
    [(UITableViewCell *)self _setupSelectedBackgroundView];
  }
  int tableCellFlags = (int)self->_tableCellFlags;
  if ((tableCellFlags & 0x100) == 0) {
    goto LABEL_5;
  }
  if ((*(_DWORD *)&self->_tableCellFlags & 0x7000) != 0x3000)
  {
    unint64_t v3 = [(UITableViewCell *)self _tableView];
    if ([v3 allowsMultipleSelectionDuringEditing]
      && (*((_WORD *)&self->_tableCellFlags + 6) & 4) == 0)
    {
      multipleSelectionBackgroundView = self->_multipleSelectionBackgroundView;
      if (!multipleSelectionBackgroundView) {
        multipleSelectionBackgroundView = self->_selectedBackgroundView;
      }
      unsigned int v8 = multipleSelectionBackgroundView;
      goto LABEL_22;
    }
LABEL_5:
    if (*((unsigned char *)&self->_tableCellFlags + 1))
    {
      unsigned int v8 = self->_selectedBackgroundView;
      if ((tableCellFlags & 0x100) == 0) {
        goto LABEL_23;
      }
    }
    else
    {
      BOOL v6 = [(UITableViewCell *)self _tableView];
      if (([v6 allowsMultipleSelection] & 1) == 0
        || (selectedBackgroundView = self->_multipleSelectionBackgroundView) == 0)
      {
        selectedBackgroundView = self->_selectedBackgroundView;
      }
      unsigned int v8 = selectedBackgroundView;

      if ((tableCellFlags & 0x100) == 0) {
        goto LABEL_23;
      }
    }
LABEL_22:

    goto LABEL_23;
  }
  unint64_t v9 = self->_multipleSelectionBackgroundView;
  if (!v9) {
    unint64_t v9 = self->_selectedBackgroundView;
  }
  unsigned int v8 = v9;
LABEL_23:
  return v8;
}

- (unint64_t)_maskedCornersForSystemBackgroundView
{
  int v3 = [(UITableViewCell *)self _selectionGrouping];
  if ([(UITableViewCell *)self _usesRoundedGroups])
  {
    [(UITableViewCell *)self _roundedGroupCornerRadius];
    if (v4 > 0.0) {
      int v3 = [(UITableViewCell *)self sectionLocation];
    }
  }
  if ((v3 - 1) > 2) {
    return 15;
  }
  else {
    return qword_186B9D390[v3 - 1];
  }
}

- (int)_selectionGrouping
{
  return (*(_DWORD *)&self->_tableCellFlags >> 27) & 7;
}

- (UIView)contentView
{
  if (!self->_contentView
    && ![(UITableViewCell *)self drawingEnabled]
    && dyld_program_sdk_at_least())
  {
    int v3 = [(UITableViewCell *)self _createDefaultContentView];
    [(UITableViewCell *)self _setContentView:v3];
  }
  contentView = self->_contentView;
  return contentView;
}

- (CGFloat)indentationWidth
{
  return self->_indentationWidth;
}

- (NSInteger)indentationLevel
{
  return self->_indentationLevel;
}

- (double)_rightMarginWidth
{
  double right = self->_separatorInset.right;
  if (right == -1.0
    && ([(UITableViewCell *)self _preferredTrailingSeparatorInsetFromContentView], double right = v4, v4 == 1.79769313e308)|| right == -1.0)
  {
    double v5 = [(UITableViewCell *)self _tableView];
    BOOL v6 = v5;
    if (v5)
    {
      [v5 _rawSeparatorInset];
      double right = v7;
    }
    else
    {
      double right = -1.0;
    }
  }
  BOOL v8 = [(UITableViewCell *)self _shouldApplyReadableWidthInsets];
  BOOL v9 = v8;
  double indexBarExtentFromEdge = self->_indexBarExtentFromEdge;
  if (right == -1.0)
  {
    if (v8)
    {
      [(UIView *)self directionalLayoutMargins];
      return fmax(indexBarExtentFromEdge, v11);
    }
    return self->_indexBarExtentFromEdge;
  }
  else if (![(UITableViewCell *)self _separatorInsetIsRelativeToCellEdges])
  {
    if (v9)
    {
      [(UIView *)self directionalLayoutMargins];
      return right + fmax(v13, indexBarExtentFromEdge);
    }
    else
    {
      return right + indexBarExtentFromEdge;
    }
  }
  return right;
}

- (double)_marginWidth
{
  int v3 = [(UITableViewCell *)self _tableView];
  double v4 = v3;
  double left = self->_separatorInset.left;
  if (left == -1.0 && v3 != 0)
  {
    [v3 _rawSeparatorInset];
    double left = v7;
  }
  if (left == -1.0)
  {
    double defaultLeadingMarginWidth = self->_defaultLeadingMarginWidth;
    [(UIView *)self directionalLayoutMargins];
    double v10 = fmax(defaultLeadingMarginWidth, v9);
    [v4 _sectionContentInset];
    if (v11 > 0.0)
    {
      [v4 _sectionContentInset];
      double v10 = v10 - v12;
    }
    if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0)
    {
      [(UITableViewCell *)self _preferredLeadingSeparatorInsetFromContentView];
      double left = v24;
      if (v24 == 1.79769313e308)
      {
        [(UITableViewCell *)self _contentConfigurationPrimaryTextInsetFromCellLeadingEdge];
        double left = fmax(v25, v10);
      }
    }
    else
    {
      double v13 = [(UITableViewCell *)self layoutManager];
      int v14 = [v13 shouldIncreaseMarginForImageViewInCell:self];

      if (v14)
      {
        double v15 = [(UIView *)self traitCollection];
        uint64_t v16 = [v15 userInterfaceIdiom];

        if (v16 == 3)
        {
          double v17 = [(UITableViewCell *)self _imageView:0];
          [(UITableViewCell *)self _imageViewExtentFromCellLeadingEdge];
          double v19 = v18;
          int v20 = [v17 image];
          double v21 = 8.0;
          if (!v20) {
            double v21 = 12.0;
          }
          double left = fmax(v19 + v21, v10);
        }
        else
        {
          [(UITableViewCell *)self _imageViewExtentFromCellLeadingEdge];
          double v27 = v26;
          if (v26 != 0.0) {
            goto LABEL_27;
          }
          if (qword_1EB25C790 != -1) {
            dispatch_once(&qword_1EB25C790, &__block_literal_global_6_17);
          }
          if (byte_1EB25C781)
          {
            double v28 = [(UITableViewCell *)self contentView];
            [v28 directionalLayoutMargins];
            double v30 = v29;
          }
          else
          {
LABEL_27:
            double v30 = v27 + 15.0;
          }
          double left = fmax(v30, v10);
        }
      }
      else
      {
        double left = fmax(v10, 15.0);
      }
    }
  }
  else if (![(UITableViewCell *)self _separatorInsetIsRelativeToCellEdges])
  {
    BOOL v22 = [(UITableViewCell *)self _shouldApplyReadableWidthInsets];
    if ((dyld_program_sdk_at_least() & 1) != 0 || v22)
    {
      [(UIView *)self directionalLayoutMargins];
      double left = left + v23;
    }
  }

  return left;
}

- (double)_separatorHeight
{
  int v3 = [(UITableViewCell *)self _tableView];
  char v4 = [v3 _shouldDrawThickSeparators];

  double result = 1.0;
  if ((v4 & 1) == 0)
  {
    [(UIView *)self _currentScreenScale];
    return 1.0 / v6;
  }
  return result;
}

- (id)_tableView
{
  p_tableView = &self->_tableView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  if (!WeakRetained)
  {
    uint64_t v5 = objc_opt_class();
    id WeakRetained = _UIFallbackViewOfClassForReusableView(v5, self);
    if (WeakRetained) {
      objc_storeWeak((id *)p_tableView, WeakRetained);
    }
  }
  id v6 = WeakRetained;

  return v6;
}

- (id)layoutManager
{
  return self->_layoutManager;
}

- (double)_imageViewExtentFromCellLeadingEdge
{
  uint64_t v3 = [(UIImageView *)self->_imageView image];
  double v4 = 0.0;
  if (v3)
  {
    uint64_t v5 = (void *)v3;
    [(UIView *)self->_imageView frame];
    IsEmptdouble y = CGRectIsEmpty(v33);

    if (!IsEmpty)
    {
      int v7 = *((_DWORD *)&self->super._viewFlags + 4);
      [(UIView *)self bounds];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      [(UIView *)self->_imageView bounds];
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->_imageView);
      if ((*(void *)&v7 & 0x80000) != 0) {
        CGFloat v20 = v9;
      }
      else {
        CGFloat v20 = v16;
      }
      if ((*(void *)&v7 & 0x80000) != 0) {
        CGFloat v21 = v11;
      }
      else {
        CGFloat v21 = v17;
      }
      if ((*(void *)&v7 & 0x80000) != 0) {
        CGFloat v22 = v13;
      }
      else {
        CGFloat v22 = v18;
      }
      if ((*(void *)&v7 & 0x80000) != 0) {
        CGFloat v23 = v15;
      }
      else {
        CGFloat v23 = v19;
      }
      if ((*(void *)&v7 & 0x80000) != 0)
      {
        CGFloat v9 = v16;
        CGFloat v11 = v17;
        CGFloat v13 = v18;
        CGFloat v15 = v19;
      }
      v34.origin.double x = v20;
      v34.origin.double y = v21;
      v34.size.double width = v22;
      v34.size.double height = v23;
      double MaxX = CGRectGetMaxX(v34);
      v35.origin.double x = v9;
      v35.origin.double y = v11;
      v35.size.double width = v13;
      v35.size.double height = v15;
      double v4 = MaxX - CGRectGetMinX(v35);
      double v25 = [(UIImageView *)self->_imageView image];
      double v26 = [(UIView *)self traitCollection];
      BOOL ShouldCenterImageHorizontallyForTraitCollection = _UITableCellShouldCenterImageHorizontallyForTraitCollection(v25, v26);

      if (ShouldCenterImageHorizontallyForTraitCollection)
      {
        double v28 = [(UITableViewCell *)self _constants];
        double v29 = [(UIView *)self traitCollection];
        [v28 defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:0 traitCollection:v29];
        double v31 = v30;

        [(UIView *)self->_imageView frame];
        return v4 + (v31 - CGRectGetWidth(v36)) * 0.5;
      }
    }
  }
  return v4;
}

- (BOOL)_shouldApplyReadableWidthInsets
{
  BOOL v3 = [(UIView *)self layoutMarginsFollowReadableWidth];
  if (v3)
  {
    double v4 = [(UITableViewCell *)self _tableView];
    uint64_t v5 = [v4 _scrollView];
    char v6 = [v5 _safeAreaWidthExceedsReadableWidth];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (double)_preferredTrailingSeparatorInsetFromContentView
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1.79769313e308;
  }
  [(UIView *)self->_contentView _preferredTrailingSeparatorInset];
  if (v3 == 1.79769313e308) {
    return 1.79769313e308;
  }
  -[UITableViewCell _contentViewInset:convertedToCellInsetOnEdge:](self, "_contentViewInset:convertedToCellInsetOnEdge:", 8);
  return result;
}

- (BOOL)_separatorInsetIsRelativeToCellEdges
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 53) & 1;
}

- (BOOL)drawingEnabled
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) & 0x3000) == 4096;
}

- (UIBackgroundConfiguration)backgroundConfiguration
{
  id v2 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v3 = v2;
  }
  else {
    double v3 = 0;
  }
  double v4 = v3;

  return v4;
}

- (id)_backgroundViewConfiguration
{
  id v2 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v3 = v2;
  }
  else {
    double v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)_isAnimating
{
  return HIDWORD(*(void *)((char *)&self->_tableCellFlags + 4)) & 1;
}

- (BOOL)_needsSetup
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 29) & 1;
}

- (void)setSectionLocation:(int)a3 animated:(BOOL)a4
{
}

- (BOOL)_needsHeightCalculation
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 47) & 1;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UITableViewCell;
  -[UIView setSemanticContentAttribute:](&v7, sel_setSemanticContentAttribute_);
  [(UIView *)self->_contentView setSemanticContentAttribute:a3];
  uint64_t v5 = [(UITableViewCell *)self _existingSystemAccessoryView:0];
  [v5 setSemanticContentAttribute:a3];

  char v6 = [(UITableViewCell *)self _existingSystemAccessoryView:1];
  [v6 setSemanticContentAttribute:a3];
}

- (id)_existingSystemAccessoryView:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UITableViewCell *)self _usesModernAccessoriesLayout])
  {
    uint64_t v5 = 49;
    if (v3) {
      uint64_t v5 = 60;
    }
    id v6 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___UITableViewCellSelectedBackground__multiselect[v5]));
    if (v6)
    {
      id v7 = 0;
    }
    else
    {
      if (v3) {
        [(UITableViewCell *)self _editingAccessoryView:0];
      }
      else {
      id v7 = [(UITableViewCell *)self _accessoryView:0];
      }
    }
  }
  else
  {
    uint64_t v8 = 51;
    if (v3) {
      uint64_t v8 = 52;
    }
    id v7 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___UITableViewCellSelectedBackground__multiselect[v8]));
  }
  return v7;
}

- (id)_editingAccessoryView:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UITableViewCell *)self _usesModernAccessoriesLayout])
  {
    uint64_t v5 = [(UITableViewCell *)self _accessoryManager];
    id v6 = [v5 configurations];
    id v7 = [v6 objectForKeyedSubscript:0x1ED16D800];

    uint64_t v8 = [v7 trailingAccessories];
    CGFloat v9 = [v8 firstObject];

    double v10 = [v9 view];
  }
  else
  {
    customEditingAccessoryView = self->_customEditingAccessoryView;
    if (!customEditingAccessoryView)
    {
      p_editingAccessoryView = &self->_editingAccessoryView;
      if (!self->_editingAccessoryView)
      {
        unsigned int tableCellFlags = self->_tableCellFlags;
        int v14 = (tableCellFlags >> 18) & 7;
        if (v14 && v3)
        {
          if (((tableCellFlags >> 15) & 7) == v14 && (accessoryView = self->_accessoryView) != 0)
          {
            objc_storeStrong((id *)&self->_editingAccessoryView, accessoryView);
          }
          else
          {
            double v17 = [(UITableViewCell *)self _newAccessoryView:1];
            double v18 = *p_editingAccessoryView;
            *p_editingAccessoryView = v17;

            if (*((unsigned char *)&self->_tableCellFlags + 1)) {
              [(UIView *)self addSubview:*p_editingAccessoryView];
            }
          }
        }
      }
      customEditingAccessoryView = (UIView *)*p_editingAccessoryView;
    }
    double v10 = customEditingAccessoryView;
  }
  return v10;
}

- (id)_accessoryView:(BOOL)a3
{
  if ([(UITableViewCell *)self _usesModernAccessoriesLayout])
  {
    uint64_t v5 = [(UITableViewCell *)self _accessoryManager];
    id v6 = [v5 configurations];
    id v7 = [v6 objectForKeyedSubscript:0x1ED109440];

    uint64_t v8 = [v7 trailingAccessories];
    CGFloat v9 = [v8 firstObject];

    double v10 = [v9 view];

    goto LABEL_9;
  }
  customAccessoryView = (UIControl *)self->_customAccessoryView;
  if (customAccessoryView) {
    goto LABEL_7;
  }
  if (!a3)
  {
    customAccessoryView = self->_accessoryView;
LABEL_7:
    double v12 = customAccessoryView;
    goto LABEL_8;
  }
  double v12 = [(UITableViewCell *)self _defaultAccessoryView];
LABEL_8:
  double v10 = v12;
LABEL_9:
  return v10;
}

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier
{
  return -[UITableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, reuseIdentifier, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

- (UITableViewCell)initWithFrame:(CGRect)a3
{
  return -[UITableViewCell initWithFrame:reuseIdentifier:](self, "initWithFrame:reuseIdentifier:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UITableViewCell *)self _performConfigurationStateUpdate];
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0)
  {
    objc_msgSend(self->_layoutManager, "contentRectForCell:forState:rowWidth:", self, -[UITableViewCell currentStateMask](self, "currentStateMask"), width);
    double v12 = v11;
    -[UIView setFrame:](self->_contentView, "setFrame:");
    [(UITableViewCell *)self _updateLeadingLayoutMarginForIndentation];
    double v15 = 1.79769313e308;
    if (width == 0.0) {
      double v16 = 1.79769313e308;
    }
    else {
      double v16 = v12;
    }
    if (height != 0.0) {
      double v15 = height;
    }
    LODWORD(v13) = 1112014848;
    LODWORD(v14) = 1112014848;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v16, v15, v13, v14);
    double v7 = v17;
    double v19 = v18;
    [(UITableViewCell *)self _verticalPaddingForSeparator];
    double v9 = v19 + v20;
  }
  else
  {
    [self->_layoutManager intrinsicContentSizeForCell:self rowWidth:width];
    double v7 = v6;
    double v9 = v8;
    if (v8 != 0.0 && dyld_program_sdk_at_least())
    {
      [(UITableViewCell *)self _verticalPaddingForSeparator];
      double v9 = v9 - v10;
    }
  }
  double v21 = v7;
  double v22 = v9;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  [(UITableViewCell *)self _performConfigurationStateUpdate];
  objc_msgSend(self->_layoutManager, "contentRectForCell:forState:rowWidth:", self, -[UITableViewCell currentStateMask](self, "currentStateMask"), width);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v15 = v14;
  CGFloat v17 = v16;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  [(UITableViewCell *)self _updateLeadingLayoutMarginForIndentation];
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0
    && [(UIView *)self->_contentView translatesAutoresizingMaskIntoConstraints])
  {
    if (a5 >= 1000.0) {
      double v20 = height;
    }
    else {
      double v20 = 1.79769313e308;
    }
    *(float *)&double v18 = a4;
    *(float *)&double v19 = a5;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v15, v20, v18, v19);
    double v22 = v21;
    double v24 = v23;
    double v25 = self->_contentView;
    if (a4 != 1000.0 && v22 > 2777777.0 || a5 != 1000.0 && v24 > 2777777.0)
    {
      v48 = [MEMORY[0x1E4F28B00] currentHandler];
      v49 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UIContentViewAssertValidFittingSize(UIView * _Nonnull __strong, CGSize, UILayoutPriority, UILayoutPriority)");
      v54.double width = v22;
      v54.double height = v24;
      v50 = NSStringFromCGSize(v54);
      [v48 handleFailureInFunction:v49, @"_UIContentViewShared.h", 66, @"Content view returned an invalid size %@ from -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority: which is not allowed. If you have implemented a custom content view, you need to add constraints inside it so that its size is not ambiguous, or you need to manually compute and return a valid size. Content view: %@", v50, v25 file lineNumber description];
    }
    [(UITableViewCell *)self _verticalPaddingForSeparator];
    double v27 = v24 + v26;
    if (a4 >= 1000.0) {
      double v28 = width;
    }
    else {
      double v28 = v22;
    }
    if (a5 < 1000.0) {
      double height = v27;
    }
  }
  else if ((-[UIView _wantsAutolayoutOrIsGuardingForEngineHosting]((uint64_t)self->_contentView) & 1) != 0 {
         || [(id)objc_opt_class() requiresConstraintBasedLayout])
  }
  {
    if (!_UIEngineHostingViewsShouldGuardWantsAutolayoutFlagPropagation()
      || (-[UIView _usesLayoutEngineHostingConstraints]((uint64_t)self->_contentView) & 1) == 0)
    {
      [(UIView *)self->_contentView _setWantsAutolayout];
    }
    char v53 = 1;
    contentView = self->_contentView;
    v56.origin.double x = v11;
    v56.origin.double y = v13;
    v56.size.double width = v15;
    v56.size.double height = v17;
    double v32 = CGRectGetWidth(v56);
    if (a5 == 50.0 && height == 0.0) {
      CGRect v36 = &v53;
    }
    else {
      CGRect v36 = 0;
    }
    *(float *)&double v33 = a4;
    *(float *)&double v34 = a5;
    -[UIView _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:](contentView, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:", v36, v32, height, v33, v34);
    double v28 = v38;
    if (v37 == 0.0 && v53 == 0)
    {
      -[UITableViewCell sizeThatFits:](self, "sizeThatFits:", width, height);
      double height = v42;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __101__UITableViewCell_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = self;
      if (systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority__once != -1) {
        dispatch_once(&systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority__once, block);
      }
    }
    else
    {
      double v40 = v37;
      [(UITableViewCell *)self _verticalPaddingForSeparator];
      double height = v40 + v41;
    }
  }
  else
  {
    v51.receiver = self;
    v51.super_class = (Class)UITableViewCell;
    *(float *)&double v29 = a4;
    *(float *)&double v30 = a5;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v51, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v29, v30);
    double v28 = v43;
    double height = v44;
    if (v44 != 0.0 && dyld_program_sdk_at_least())
    {
      [(UITableViewCell *)self _verticalPaddingForSeparator];
      double height = height + v45;
    }
  }
  double v46 = v28;
  double v47 = height;
  result.double height = v47;
  result.double width = v46;
  return result;
}

- (double)_verticalPaddingForSeparator
{
  if ((*(unsigned char *)&self->_tableCellFlags & 0xE) == 0) {
    return 0.0;
  }
  [(UITableViewCell *)self _separatorHeight];
  return result;
}

- (void)layoutSubviews
{
  [(UITableViewCell *)self _restoreLabelTextAfterSystemTextSizeChangeIfNeeded];
  [(UITableViewCell *)self _layoutFloatingContentView];
  [(UITableViewCell *)self _performConfigurationStateUpdate];
  [(UITableViewCell *)self _layoutSystemBackgroundView:0];
  if (![(UITableViewCell *)self _skipsLayout]
    && (*(void *)((char *)&self->_tableCellFlags + 4) & 0x40000000000000) == 0)
  {
    [(UITableViewCell *)self _updateAccessoriesIfNeeded];
    [(UITableViewCell *)self _updateLeadingLayoutMarginForIndentation];
    BOOL v3 = [(UITableViewCell *)self layoutManager];
    [v3 layoutSubviewsOfCell:self];
  }
  [(UITableViewCell *)self _updateSeparatorContent];
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCell;
  [(UIView *)&v6 layoutSubviews];
  int v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  if ((v4 & 0x20000) != 0)
  {
    unsigned int v5 = v4 & 0xFFFDFFFF;
    *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4);
    *((_WORD *)&self->_tableCellFlags + 6) = v5;
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v5);
    if ([(UIView *)self isFocused])
    {
      if (+[UIFocusRingManager focusRingAvailable]) {
        +[UIFocusRingManager _updateActiveFocusLayers];
      }
    }
  }
}

- (void)_performConfigurationStateUpdate
{
  int v2 = *((unsigned __int16 *)&self->_tableCellFlags + 6);
  if ((v2 & 0x20) != 0)
  {
    unsigned int v4 = v2 & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4);
    *((_WORD *)&self->_tableCellFlags + 6) = v4;
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v4);
    if (_UIObservationTrackingEnabled())
    {
      [(UITableViewCell *)self _updateConfigurationWithObservationTracking];
    }
    else
    {
      -[UITableViewCell _executeConfigurationUpdate](self);
    }
  }
}

- (void)_updateSeparatorContent
{
  p_unsigned int tableCellFlags = &self->_tableCellFlags;
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x800) == 0) {
    return;
  }
  separatorView = self->_separatorView;
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x3000) == 0x1000
    || (*(_DWORD *)p_tableCellFlags & 0xE) == 0)
  {
    [(UIView *)self->_separatorView removeFromSuperview];
    objc_super v6 = self->_separatorView;
    self->_separatorView = 0;
  }
  else
  {
    [(UITableViewCell *)self _separatorFrame];
    if (separatorView)
    {
      -[UIView setFrame:](self->_separatorView, "setFrame:");
    }
    else
    {
      -[UITableViewCell _addSeparatorWithFrame:](self, "_addSeparatorWithFrame:");
      double v8 = (_UITableViewCellSeparatorView *)objc_claimAutoreleasedReturnValue();
      double v9 = self->_separatorView;
      self->_separatorView = v8;
    }
    [(UITableViewCell *)self _updateSeparatorViewAlpha];
    if ((*(void *)((char *)p_tableCellFlags + 4) & 0x40000000000) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [(UIView *)self->_separatorView setBackgroundColor:self->_separatorColor];
      }
    }
    if ((*((unsigned char *)p_tableCellFlags + 2) & 0x40) != 0
      || [(UITableViewCell *)self _showSeparatorAtTopOfSection])
    {
      topSeparatorView = self->_topSeparatorView;
      [(UITableViewCell *)self _topSeparatorFrame];
      if (topSeparatorView)
      {
        -[UIView setFrame:](self->_topSeparatorView, "setFrame:");
      }
      else
      {
        -[UITableViewCell _addSeparatorWithFrame:](self, "_addSeparatorWithFrame:");
        CGFloat v11 = (_UITableViewCellSeparatorView *)objc_claimAutoreleasedReturnValue();
        double v12 = self->_topSeparatorView;
        self->_topSeparatorView = v11;
      }
      [(UITableViewCell *)self _updateTopSeparatorViewAlpha];
      if ((*(void *)((char *)p_tableCellFlags + 4) & 0x40000000000) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [(UIView *)self->_topSeparatorView setBackgroundColor:self->_separatorColor];
        }
      }
      goto LABEL_23;
    }
  }
  [(UIView *)self->_topSeparatorView removeFromSuperview];
  double v7 = self->_topSeparatorView;
  self->_topSeparatorView = 0;

LABEL_23:
  uint64_t v13 = *(void *)((char *)p_tableCellFlags + 4);
  if ((v13 & 0x3000) == 0x1000)
  {
    [(UIView *)self setNeedsDisplay];
    int v14 = *((unsigned __int16 *)p_tableCellFlags + 6) | (*((unsigned __int8 *)p_tableCellFlags + 14) << 16);
    uint64_t v13 = *(void *)((char *)p_tableCellFlags + 4);
  }
  else
  {
    int v14 = *((unsigned __int16 *)p_tableCellFlags + 6) | (*((unsigned __int8 *)p_tableCellFlags + 14) << 16);
  }
  *(void *)((char *)p_tableCellFlags + 4) = v13 & 0xFFFFFFFFFFFFF7FFLL;
  *((_WORD *)p_tableCellFlags + 6) = v14;
  *((unsigned char *)p_tableCellFlags + 14) = BYTE2(v14);
}

- (void)_updateLeadingLayoutMarginForIndentation
{
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0)
  {
    double extraLeadingLayoutMarginForIndentation = self->_extraLeadingLayoutMarginForIndentation;
    [self->_layoutManager contentIndentationForCell:self];
    self->_double extraLeadingLayoutMarginForIndentation = v4;
    if (v4 - extraLeadingLayoutMarginForIndentation != 0.0)
    {
      [(UITableViewCell *)self _applyLeadingLayoutMarginAdjustment:"_applyLeadingLayoutMarginAdjustment:"];
    }
  }
}

- (BOOL)_skipsLayout
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 52) & 1;
}

- (void)_restoreLabelTextAfterSystemTextSizeChangeIfNeeded
{
  p_unsigned int tableCellFlags = &self->_tableCellFlags;
  uint64_t v4 = *(void *)((char *)&self->_tableCellFlags + 4);
  if ((v4 & 0x4000000000000000) == 0)
  {
    __int16 v5 = *((_WORD *)&self->_tableCellFlags + 6);
    if ((v4 & 0x8000000000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  objc_super v6 = [(UILabel *)self->_textLabel attributedText];

  if (!v6)
  {
    double v7 = objc_getAssociatedObject(self, &unk_1EB25C782);
    double v8 = [(UITableViewCell *)self textLabel];
    [v8 setAttributedText:v7];
  }
  objc_setAssociatedObject(self, &unk_1EB25C782, 0, (void *)1);
  __int16 v5 = *((_WORD *)p_tableCellFlags + 6);
  unint64_t v9 = *(void *)((char *)p_tableCellFlags + 4) & 0xBFFFFFFFFFFFFFFFLL;
  *(void *)((char *)p_tableCellFlags + 4) = v9;
  if ((v9 & 0x8000000000000000) != 0)
  {
LABEL_7:
    double v10 = [(UILabel *)self->_detailTextLabel attributedText];

    if (!v10)
    {
      CGFloat v11 = objc_getAssociatedObject(self, &unk_1EB25C783);
      double v12 = [(UITableViewCell *)self detailTextLabel];
      [v12 setAttributedText:v11];
    }
    objc_setAssociatedObject(self, &unk_1EB25C783, 0, (void *)1);
    __int16 v5 = *((_WORD *)p_tableCellFlags + 6);
    *(void *)((char *)p_tableCellFlags + 4) &= ~0x8000000000000000;
  }
LABEL_10:
  if (v5)
  {
    uint64_t v13 = [(UITextField *)self->_editableTextField attributedText];

    if (!v13)
    {
      int v14 = objc_getAssociatedObject(self, &unk_1EB25C784);
      double v15 = [(UITableViewCell *)self editableTextField];
      [v15 setAttributedText:v14];
    }
    objc_setAssociatedObject(self, &unk_1EB25C784, 0, (void *)1);
    __int16 v17 = *((_WORD *)p_tableCellFlags + 6);
    double v16 = (char *)p_tableCellFlags + 12;
    char v18 = v16[2];
    *(_WORD *)double v16 = v17 & 0xFFFE;
    v16[2] = v18;
  }
}

- (void)_layoutSystemBackgroundView:(BOOL)a3
{
  systemBackgroundView = self->_systemBackgroundView;
  if (systemBackgroundView)
  {
    [(_UISystemBackgroundView *)systemBackgroundView frameInContainerView:self];
    -[_UISystemBackgroundView setFrame:](self->_systemBackgroundView, "setFrame:");
    if (a3
      || +[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      objc_super v6 = self->_systemBackgroundView;
      [(UIView *)v6 layoutIfNeeded];
    }
  }
}

- (void)_layoutFloatingContentView
{
  if (self->_floatingContentView)
  {
    BOOL v3 = [(UITableViewCell *)self layoutManager];
    objc_msgSend(v3, "backgroundEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    -[_UIFloatingContentView setFrame:](self->_floatingContentView, "setFrame:", v5, v7, v9, v11);
    floatingContentView = self->_floatingContentView;
    [(UIView *)floatingContentView layoutIfNeeded];
  }
}

- (void)_updateSeparatorViewAlpha
{
  BOOL v3 = [(UITableViewCell *)self _shouldHideSeparator];
  double v4 = 1.0;
  if (v3) {
    double v4 = 0.0;
  }
  separatorView = self->_separatorView;
  [(UIView *)separatorView setAlpha:v4];
}

- (BOOL)_shouldHideSeparator
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) & 0x100000000000) != 0
      || [(UITableViewCell *)self _hidesBottomSeparatorWhenUnselected];
}

- (BOOL)_hidesBottomSeparatorWhenUnselected
{
  p_unsigned int tableCellFlags = &self->_tableCellFlags;
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x80000000000) != 0) {
    return 1;
  }
  if ((*((unsigned char *)&self->_tableCellFlags + 3) & 7u) - 3 > 1) {
    return 0;
  }
  if ([(UITableViewCell *)self _usesRoundedGroups]) {
    return 1;
  }
  return (*(void *)((char *)p_tableCellFlags + 4) & 0x4000000000) == 0;
}

- (BOOL)_showSeparatorAtTopOfSection
{
  p_unsigned int tableCellFlags = &self->_tableCellFlags;
  int v3 = *((unsigned char *)&self->_tableCellFlags + 3) & 7;
  BOOL v4 = v3 == 4 || v3 == 2;
  if (v4 && ![(UITableViewCell *)self _usesRoundedGroups]) {
    return (*(void *)((char *)p_tableCellFlags + 4) >> 37) & 1;
  }
  else {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (CGRect)_separatorFrame
{
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
  {
    [(UITableViewCell *)self _trailingSeparatorInset];
    double v4 = v6;
    [(UITableViewCell *)self _leadingSeparatorInset];
  }
  else
  {
    [(UITableViewCell *)self _leadingSeparatorInset];
    double v4 = v3;
    [(UITableViewCell *)self _trailingSeparatorInset];
  }
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x400000000) != 0)
  {
    double v4 = 0.0;
    double v7 = 0.0;
  }
  else
  {
    double v7 = v5;
  }
  [(UIView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(UITableViewCell *)self _separatorHeight];
  double v17 = v16;
  v23.origin.double x = v9;
  v23.origin.double y = v11;
  v23.size.double width = v13;
  v23.size.double height = v15;
  CGFloat v18 = CGRectGetHeight(v23) - v17;
  v24.origin.double x = v9;
  v24.origin.double y = v11;
  v24.size.double width = v13;
  v24.size.double height = v15;
  double v19 = CGRectGetWidth(v24) - (v4 + v7);
  double v20 = v4;
  double v21 = v18;
  double v22 = v17;
  result.size.double height = v22;
  result.size.double width = v19;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (double)_trailingSeparatorInset
{
  if (self->_separatorInset.right == -1.0)
  {
    double v3 = [(UIView *)self traitCollection];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 == 6)
    {
      double v5 = [(UITableViewCell *)self _tableView];
      double v6 = v5;
      if (v5)
      {
        [v5 _rawSeparatorInset];
        if (v7 == -1.0)
        {

          return 0.0;
        }
      }
    }
  }
  [(UITableViewCell *)self _rightMarginWidth];
  return result;
}

- (double)_leadingSeparatorInset
{
  if (self->_separatorInset.left == -1.0)
  {
    double v3 = [(UIView *)self traitCollection];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 == 6)
    {
      double v5 = [(UITableViewCell *)self _tableView];
      double v6 = v5;
      if (v5)
      {
        [v5 _rawSeparatorInset];
        if (v7 == -1.0)
        {

          return 0.0;
        }
      }
    }
  }
  [(UITableViewCell *)self _marginWidth];
  return result;
}

- (id)_textLabel
{
  if (!self->_textLabel && (*((_WORD *)&self->_tableCellFlags + 6) & 0x40) == 0)
  {
    double v3 = [self->_layoutManager textLabelForCell:self];
    textLabel = self->_textLabel;
    self->_textLabel = v3;

    double v5 = self->_textLabel;
    if (v5)
    {
      double v6 = [(UIView *)v5 superview];
      double v7 = [(UITableViewCell *)self contentView];

      if (v6 != v7)
      {
        double v8 = [(UITableViewCell *)self contentView];
        [v8 addSubview:self->_textLabel];
      }
    }
  }
  CGFloat v9 = self->_textLabel;
  return v9;
}

- (UITableViewCellAccessoryType)accessoryType
{
  return ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 15) & 7;
}

id __41__UITableViewCell__accessoryViewForType___block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v5 = [WeakRetained _disclosureChevronImageWithBaseColor:v3];

  return v5;
}

- (id)_disclosureChevronImageWithBaseColor:(id)a3
{
  id v4 = a3;
  if ([(UIView *)self isFocused]
    && ([(UITableViewCell *)self _constants],
        double v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) != 0))
  {
    double v7 = [(UITableViewCell *)self _constants];
    double v8 = [(UITableViewCell *)self _tableView];
    CGFloat v9 = [v7 defaultFocusedDisclosureImageForCell:self inTableView:v8];
  }
  else
  {
    double v7 = [(UITableViewCell *)self _constants];
    CGFloat v9 = [v7 defaultDisclosureImageForCell:self withAccessoryBaseColor:v4];
  }

  return v9;
}

- (id)_accessoryViewForType:(int64_t)a3
{
  constants = self->_constants;
  char v6 = [(UIView *)self traitCollection];
  double v7 = [(UITableConstants *)constants defaultListCellAccessoryImageSymbolConfigurationForTraitCollection:v6 accessoryType:a3];

  switch(a3)
  {
    case 1:
      objc_initWeak(&location, self);
      CGFloat v11 = [_UITableCellAccessoryButton alloc];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __41__UITableViewCell__accessoryViewForType___block_invoke_2;
      v22[3] = &unk_1E5308768;
      CGFloat v9 = &v23;
      objc_copyWeak(&v23, &location);
      double v10 = -[_UITableCellAccessoryButton initWithFrame:backgroundImageProvider:accessoryType:](v11, "initWithFrame:backgroundImageProvider:accessoryType:", v22, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(UIButton *)v10 setPreferredSymbolConfiguration:v7 forImageInState:0];
      goto LABEL_6;
    case 4:
      double v10 = +[UIButton buttonWithType:3];
      [(UIButton *)v10 setPreferredSymbolConfiguration:v7 forImageInState:0];
      break;
    case 3:
      objc_initWeak(&location, self);
      double v8 = [_UITableCellAccessoryButton alloc];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __41__UITableViewCell__accessoryViewForType___block_invoke;
      v24[3] = &unk_1E5308768;
      CGFloat v9 = &v25;
      objc_copyWeak(&v25, &location);
      double v10 = -[_UITableCellAccessoryButton initWithFrame:backgroundImageProvider:accessoryType:](v8, "initWithFrame:backgroundImageProvider:accessoryType:", v24, 3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(UIButton *)v10 setPreferredSymbolConfiguration:v7 forImageInState:0];
LABEL_6:
      objc_destroyWeak(v9);
      objc_destroyWeak(&location);
      break;
    default:
      if ((unint64_t)(a3 - 5) > 1)
      {
        if ((unint64_t)(a3 - 7) > 1)
        {
          if (a3 == 2)
          {
            double v14 = [UITableViewCellDetailDisclosureView alloc];
            if (self->_accessoryAction) {
              SEL accessoryAction = self->_accessoryAction;
            }
            else {
              SEL accessoryAction = 0;
            }
            double v10 = [(UITableViewCellDetailDisclosureView *)v14 initWithTarget:self->_target action:accessoryAction cell:self buttonType:4 shouldReverseLayoutDirection:((unint64_t)*((unsigned int *)&self->super._viewFlags + 4) >> 19) & 1];
          }
          else
          {
            double v10 = 0;
          }
        }
        else
        {
          double v12 = [UITableViewCellDetailDisclosureView alloc];
          if (self->_accessoryAction) {
            SEL v13 = self->_accessoryAction;
          }
          else {
            SEL v13 = 0;
          }
          double v10 = [(UITableViewCellDetailDisclosureView *)v12 initWithTarget:self->_target action:v13 cell:self buttonType:123 shouldReverseLayoutDirection:((unint64_t)*((unsigned int *)&self->super._viewFlags + 4) >> 19) & 1];
          double v16 = [(_UITableCellAccessoryButton *)v10 accessoryButton];
          [(UITableViewCell *)self _updateExpansionButton:v16 forType:a3 animated:0];
        }
      }
      else
      {
        double v10 = +[UIButton buttonWithType:123];
        [(UITableViewCell *)self _updateExpansionButton:v10 forType:a3 animated:0];
      }
      break;
  }
  double v17 = [(UITableViewCell *)self _tableView];
  if (v17) {
    [(UIControl *)v10 addTarget:v17 action:sel__accessoryButtonAction_ forControlEvents:64];
  }
  [v10 accessibilitySetIdentification:@"UITableCellViewDisclosure"];
  [(UIButton *)v10 setSemanticContentAttribute:[(UIView *)self semanticContentAttribute]];
  if (objc_opt_respondsToSelector())
  {
    CGFloat v18 = self->_constants;
    double v19 = [(UITableViewCell *)self _tableView];
    double v20 = [(UITableConstants *)v18 defaultAccessoryColorForCell:self inTableView:v19];
    [(UIButton *)v10 setTintColor:v20];
  }
  return v10;
}

- (UITableViewCell)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  __int16 v4 = style;
  char v6 = reuseIdentifier;
  v20.receiver = self;
  v20.super_class = (Class)UITableViewCell;
  double v7 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, 0.0, 0.0, 320.0, 44.0);
  double v8 = v7;
  if (v7)
  {
    [(UITableViewCell *)v7 _setupTableViewCellCommon];
    *(void *)((char *)&v8->_tableCellFlags + 4) = *(void *)((char *)&v8->_tableCellFlags + 4) & 0xFFFFFFFFFC003FFFLL | ((unint64_t)(v4 & 0xFFF) << 14);
    CGFloat v9 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v9, sel__drawContentInRect_selected_);
    CGFloat v11 = (objc_class *)objc_opt_class();
    BOOL v12 = MethodImplementation != class_getMethodImplementation(v11, sel__drawContentInRect_selected_);
    unint64_t v13 = *(void *)((char *)&v8->_tableCellFlags + 4);
    *(void *)((char *)&v8->_tableCellFlags + 4) = v13 & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)v12 << 12);
    double v14 = +[UITableViewCellLayoutManager layoutManagerForTableViewCellStyle:(v13 >> 14) & 0xFFF];
    [(UITableViewCell *)v8 setLayoutManager:v14];

    if ((*(void *)((char *)&v8->_tableCellFlags + 4) & 0x1000) == 0
      && (dyld_program_sdk_at_least() & 1) == 0
      && !v8->_contentView)
    {
      CGFloat v15 = [(UITableViewCell *)v8 _createDefaultContentView];
      [(UITableViewCell *)v8 _setContentView:v15];
    }
    [(UITableViewCell *)v8 _setupModernAccessoriesLayout];
    *(_DWORD *)&v8->_unsigned int tableCellFlags = *(_DWORD *)&v8->_tableCellFlags & 0xFFFFFF81 | 0x32;
    uint64_t v16 = [(NSString *)v6 copy];
    double v17 = v8->_reuseIdentifier;
    v8->_reuseIdentifier = (NSString *)v16;

    v8->_returnAction = 0;
    [(UIView *)v8 setNeedsDisplayOnBoundsChange:1];
    *(void *)((char *)&v8->_tableCellFlags + 4) |= 0x800uLL;
    v8->_textFieldOffset = 114.0;
    deselectTimer = v8->_deselectTimer;
    v8->_deselectTimer = 0;

    *(void *)((char *)&v8->_tableCellFlags + 4) &= 0xFFF8FFFFFFFFFFFFLL;
  }

  return v8;
}

- (BOOL)_canDrawContent
{
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x1000) != 0) {
    return (*(void *)((char *)&self->_tableCellFlags + 4) & 0x2000) == 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCell;
  return [(UIView *)&v3 _canDrawContent];
}

- (void)setLayoutManager:(id)a3
{
  id v5 = a3;
  if (self->_layoutManager != v5)
  {
    id v6 = v5;
    objc_storeStrong(&self->_layoutManager, a3);
    if ([(id)objc_opt_class() requiresLegacyLayout]) {
      [(UITableViewCell *)self _setUsesModernAccessoriesLayout:0];
    }
    else {
      [(UITableViewCell *)self _setupModernAccessoriesLayout];
    }
    id v5 = v6;
  }
}

- (void)_setupModernAccessoriesLayout
{
}

- (void)_setUsesModernAccessoriesLayout:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UITableViewCell *)self _usesModernAccessoriesLayout] != a3)
  {
    if (v3)
    {
      double v7 = [[UICellAccessoryManager alloc] initWithContainerView:self];
      [(UICellAccessoryManager *)v7 setCurrentConfigurationIdentifier:0x1ED109440];
      id v5 = objc_alloc_init(UITableCellAccessoryLayout);
      [(UICellAccessoryManager *)v7 setLeadingLayout:v5];

      id v6 = objc_alloc_init(UITableCellAccessoryLayout);
      [(UICellAccessoryManager *)v7 setTrailingLayout:v6];

      [(UITableViewCell *)self _setAccessoryManager:v7];
    }
    else
    {
      [(UITableViewCell *)self _setAccessoryManager:0];
    }
  }
}

- (void)_setAccessoryManager:(id)a3
{
  id v5 = (UICellAccessoryManager *)a3;
  if (self->_accessoryManager != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_accessoryManager, a3);
    id v5 = v6;
    if (v6)
    {
      [(UITableViewCell *)self _updateAccessoryMetrics];
      [(UITableViewCell *)self _setNeedsAccessoriesUpdate];
      id v5 = v6;
    }
    else
    {
      *(void *)((char *)&self->_tableCellFlags + 4) &= ~0x800000000000000uLL;
    }
  }
}

- (id)_imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0
      || ([self->_layoutManager imageViewForCell:self],
          __int16 v4 = (UIImageView *)objc_claimAutoreleasedReturnValue(),
          id v5 = self->_imageView,
          self->_imageView = v4,
          v5,
          [(UITableViewCell *)self _updateDefaultImageSymbolConfiguration],
          !self->_imageView))
    {
      imageView = 0;
    }
    else
    {
      backgroundView = self->_backgroundView;
      double v7 = [(UITableViewCell *)self contentView];
      double v8 = v7;
      CGFloat v9 = self->_imageView;
      if (backgroundView) {
        [v7 insertSubview:v9 aboveSubview:self->_backgroundView];
      }
      else {
        [v7 addSubview:v9];
      }

      double v10 = [(UITableViewCell *)self _tableView];
      [v10 _tableStyle];

      imageView = self->_imageView;
    }
  }
  return imageView;
}

- (void)_updateDefaultImageSymbolConfiguration
{
  if (self->_imageView)
  {
    constants = self->_constants;
    id v5 = [(UIView *)self traitCollection];
    __int16 v4 = [(UITableConstants *)constants defaultImageSymbolConfigurationForTraitCollection:v5];
    [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v4];
  }
}

- (id)backgroundColor
{
  if (qword_1EB25C798 != -1) {
    dispatch_once(&qword_1EB25C798, &__block_literal_global_1347_1);
  }
  if (byte_1EB25C785)
  {
    v6.receiver = self;
    v6.super_class = (Class)UITableViewCell;
    id v3 = [(UIView *)&v6 backgroundColor];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITableViewCell;
    id v3 = [(UIView *)&v5 backgroundColor];
  }
  return v3;
}

- (void)_setTableView:(id)a3
{
  int v3 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFFFD | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6) & 0xFFFD | (2 * (a3 != 0));
  *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v3);
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (void)_setIndexBarExtentFromEdge:(double)a3
{
  if (self->_indexBarExtentFromEdge != a3)
  {
    self->_double indexBarExtentFromEdge = a3;
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
    [(UITableViewCell *)self _updateAccessoryMetrics];
  }
}

- (void)setTableViewStyle:(int64_t)a3
{
  p_unsigned int tableCellFlags = &self->_tableCellFlags;
  uint64_t v6 = *(void *)((char *)&self->_tableCellFlags + 4) & 0x1FLL;
  int64_t v7 = [(UITableViewCell *)self _contentViewListStyleFromTableViewStyle:v6];
  if (v6 == a3 || a3 && v6)
  {
    int v8 = 0;
  }
  else
  {
    [(UITableViewCell *)self _prepareForConfigurationStateUpdate];
    int v8 = 1;
  }
  [(UITableViewCell *)self _usesRoundedGroups];
  uint64_t v9 = *(void *)((char *)p_tableCellFlags + 4);
  *(void *)((char *)p_tableCellFlags + 4) = v9 & 0xFFFFFFFFFFFFFFE0 | a3 & 0x1F;
  if ((v9 & 0x10000000) == 0
    && ![(UITableViewCell *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__UITableViewCell_setTableViewStyle___block_invoke;
    v12[3] = &unk_1E52D9F70;
    v12[4] = self;
    +[UIView _performSystemAppearanceModifications:v12];
  }
  if (v6 != (*(void *)((char *)p_tableCellFlags + 4) & 0x1FLL)
    || ![(UITableViewCell *)self _usingBackgroundViewConfiguration])
  {
    [(UITableViewCell *)self _updateDefaultBackgroundAppearance];
  }
  int64_t v10 = [(UITableViewCell *)self _contentViewListStyleFromTableViewStyle:a3];
  if (v7 != v10)
  {
    int64_t v11 = v10;
    if (objc_opt_respondsToSelector()) {
      [(UIView *)self->_contentView _containingListStyleUpdated:v11];
    }
  }
  [(UITableViewCell *)self _updateContentClip];
  if (v8) {
    [(UITableViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (int64_t)_contentViewListStyleFromTableViewStyle:(int64_t)a3
{
  int64_t v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 >= 3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v7 = 134217984;
        int64_t v8 = v3;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Unhandled UITableViewStyle (%ld)", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      __int16 v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_contentViewListStyleFromTableViewStyle____s_category)
                        + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v7 = 134217984;
        int64_t v8 = v3;
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Unhandled UITableViewStyle (%ld)", (uint8_t *)&v7, 0xCu);
      }
    }
    return -1;
  }
  return v3;
}

- (void)_setConstants:(id)a3
{
  objc_super v5 = (UITableConstants *)a3;
  if (self->_constants != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_constants, a3);
    [(UITableViewCell *)self _updateContentClip];
    [(UITableViewCell *)self _updateAccessoryMetrics];
    [(UITableViewCell *)self _updateDefaultBackgroundAppearance];
    [(UITableViewCell *)self _updateDefaultIndentationWidth];
    objc_super v5 = v6;
  }
}

- (void)_updateDefaultBackgroundAppearance
{
  if (dyld_program_sdk_at_least())
  {
    p_unsigned int tableCellFlags = &self->_tableCellFlags;
    __int16 v4 = *((_WORD *)&self->_tableCellFlags + 6);
    if ((v4 & 0x1800) == 0)
    {
      if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x780) != 0)
      {
        if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x100) == 0)
        {
          [(UITableViewCell *)self _setupBackgroundView];
          __int16 v4 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFEFF;
          *((_WORD *)&self->_tableCellFlags + 6) = v4;
        }
        if ((v4 & 0x200) == 0)
        {
          [(UITableViewCell *)self _setupSelectedBackgroundView];
          int v5 = *((unsigned __int16 *)&self->_tableCellFlags + 6);
          unsigned int v6 = v5 & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
          *((_WORD *)&self->_tableCellFlags + 6) = v5 & 0xFDFF;
          *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v6);
        }
      }
      else
      {
        int v7 = [(UITableViewCell *)self _defaultBackgroundConfiguration];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __53__UITableViewCell__updateDefaultBackgroundAppearance__block_invoke;
        v12[3] = &unk_1E52D9F98;
        v12[4] = self;
        id v13 = v7;
        id v8 = v7;
        +[UIView _performSystemAppearanceModifications:v12];
        int v10 = *((unsigned __int16 *)p_tableCellFlags + 6);
        uint64_t v9 = (char *)p_tableCellFlags + 12;
        unsigned int v11 = v10 & 0xFFFFEFFF | (v9[2] << 16);
        *(_WORD *)uint64_t v9 = v10 & 0xEFFF;
        v9[2] = BYTE2(v11);
      }
    }
  }
}

- (void)_setupSelectedBackgroundView
{
  if (self->_selectedBackgroundView) {
    goto LABEL_2;
  }
  if ((*(unsigned char *)&self->_tableCellFlags & 0x70) != 0
    && !self->_systemBackgroundView
    && !self->_backgroundViewConfigurationProvider)
  {
    int v5 = [UITableViewCellSelectedBackground alloc];
    unsigned int v6 = [(UITableViewCell *)self layoutManager];
    objc_msgSend(v6, "selectedBackgroundEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
    int v7 = -[UIView initWithFrame:](v5, "initWithFrame:");
    selectedBackgroundView = self->_selectedBackgroundView;
    self->_selectedBackgroundView = v7;

    *(void *)((char *)&self->_tableCellFlags + 4) |= 0x80uLL;
    if (self->_selectedBackgroundView)
    {
LABEL_2:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(UIView *)self->_selectedBackgroundView setSelectionStyle:((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 4) & 7];
        [(UIView *)self->_selectedBackgroundView setSelectionEffects:self->_selectionEffects];
        [(UIView *)self->_selectedBackgroundView setSelectionTintColor:self->_selectionTintColor];
        int64_t v3 = [(UITableViewCell *)self backgroundColor];
        [(UIView *)self->_selectedBackgroundView setNoneStyleBackgroundColor:v3];
      }
      if ([(UIView *)self isOpaque])
      {
        id v10 = [(UITableViewCell *)self backgroundColor];
        [v10 alphaComponent];
        [(UIView *)self->_selectedBackgroundView setOpaque:v4 == 1.0];
      }
      else
      {
        uint64_t v9 = self->_selectedBackgroundView;
        [(UIView *)v9 setOpaque:0];
      }
    }
  }
}

- (BOOL)_insetsBackground
{
  return self->_backgroundInset.left > 0.0 || self->_backgroundInset.right > 0.0;
}

- (UIView)multipleSelectionBackgroundView
{
  return self->_multipleSelectionBackgroundView;
}

- (BOOL)_isUsingOldStyleMultiselection
{
  return (*(_DWORD *)&self->_tableCellFlags & 0x7100) == 0x3100 && self->_multipleSelectionBackgroundView == 0;
}

- (int64_t)separatorStyle
{
  return ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 1) & 7;
}

- (void)_setHiddenForReuse:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UITableViewCell;
  -[UIView _setHiddenForReuse:](&v7, sel__setHiddenForReuse_);
  if (!a3)
  {
    id v5 = [(UIView *)self superview];
    if (v5)
    {
      id v6 = v5;
      do
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(UIView *)self layoutBelowIfNeeded];
          [(UITableViewCell *)self _updateCellMaskViewsForView:self backdropView:v6];
        }
        id v6 = (id)[v6 superview];
      }
      while (v6);
    }
  }
}

- (void)setSectionBorderColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_sectionBorderColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_sectionBorderColor, a3);
    id v5 = v6;
  }
}

- (void)_setSeparatorInsetIsRelativeToCellEdges:(BOOL)a3
{
  uint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x20000000000000) == 0) ^ a3) & 1) == 0)
  {
    int v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    uint64_t v5 = 0x20000000000000;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(void *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFDFFFFFFFFFFFFFLL | v5;
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
  }
}

- (void)_setSeparatorEffect:(id)a3
{
  uint64_t v5 = (UIVisualEffect *)a3;
  p_separatorEffect = &self->_separatorEffect;
  if (self->_separatorEffect != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_separatorEffect, a3);
    [(_UITableViewCellSeparatorView *)self->_separatorView setSeparatorEffect:*p_separatorEffect];
    [(_UITableViewCellSeparatorView *)self->_topSeparatorView setSeparatorEffect:*p_separatorEffect];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(UIView *)self->_separatorView setBackgroundColor:0];
      separatorColor = 0;
    }
    else
    {
      [(UIView *)self->_separatorView setBackgroundColor:self->_separatorColor];
      separatorColor = self->_separatorColor;
    }
    [(UIView *)self->_topSeparatorView setBackgroundColor:separatorColor];
    uint64_t v5 = v8;
  }
}

- (void)_setRawLayoutMargins:(UIEdgeInsets)a3
{
  if (self->_extraLeadingLayoutMarginForIndentation > 0.0) {
    -[UITableViewCell _adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:](self, "_adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:", a3.top, a3.left, a3.bottom, a3.right);
  }
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCell;
  [(UIView *)&v4 _setRawLayoutMargins:sel__setRawLayoutMargins_];
}

- (void)_setInsetsContentViewsToSafeArea:(BOOL)a3
{
  uint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x400000000000000) == 0) ^ a3) & 1) == 0)
  {
    int v5 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    uint64_t v6 = 0x400000000000000;
    if (!a3) {
      uint64_t v6 = 0;
    }
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v5);
    *(void *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFBFFFFFFFFFFFFFFLL | v6;
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
    [(UITableViewCell *)self _updateAccessoryMetrics];
  }
}

- (void)_setDefaultTrailingCellMarginWidth:(double)a3
{
  if (self->_defaultTrailingCellMarginWidth != a3)
  {
    self->_defaultTrailingCellMarginWidth = a3;
    [(UIView *)self setNeedsLayout];
    [(UITableViewCell *)self _updateAccessoryMetrics];
  }
}

- (void)_setDefaultLeadingMarginWidth:(double)a3
{
  if (self->_defaultLeadingMarginWidth != a3)
  {
    self->_double defaultLeadingMarginWidth = a3;
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
  }
}

- (void)_setDefaultBackgroundColor:(id)a3
{
  id v4 = a3;
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x10000000) == 0
    && ![(UITableViewCell *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration])
  {
    id v5 = [(UITableViewCell *)self backgroundColor];
    id v6 = v4;
    objc_super v7 = v6;
    if (v5 == v6)
    {
    }
    else
    {
      if (v6 && v5)
      {
        char v8 = [v5 isEqual:v6];

        if (v8) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __46__UITableViewCell__setDefaultBackgroundColor___block_invoke;
      v9[3] = &unk_1E52D9F98;
      v9[4] = self;
      id v10 = v7;
      +[UIView _performSystemAppearanceModifications:v9];
    }
  }
LABEL_11:
}

- (void)_setBackgroundInset:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  BOOL v8 = [(UITableViewCell *)self _usesRoundedGroups];
  self->_backgroundInset.CGFloat top = top;
  self->_backgroundInset.CGFloat left = left;
  self->_backgroundInset.CGFloat bottom = bottom;
  self->_backgroundInset.CGFloat right = right;
  if (v8 != [(UITableViewCell *)self _usesRoundedGroups])
  {
    [(UITableViewCell *)self _setSectionLocation:*((unsigned char *)&self->_tableCellFlags + 3) & 7 animated:0 forceBackgroundSetup:1];
    [(UIView *)self _updateInferredLayoutMargins];
  }
}

- (void)_setAutomaticIntrinsicContentSizeInvalidationEnabled:(BOOL)a3
{
  unsigned int v3 = (*((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16)) & 0xFFEFFFFF;
  if (a3) {
    int v4 = 0x100000;
  }
  else {
    int v4 = 0;
  }
  *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
  *((unsigned char *)&self->_tableCellFlags + 14) = (v3 | v4) >> 16;
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

- (void)_setAllowsReorderingWhenNotEditing:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (int64_t)_separatorBackdropOverlayBlendMode
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 39) & 7;
}

- (void)_prepareToSetDefaultLayoutMargins
{
  double extraLeadingLayoutMarginForIndentation = self->_extraLeadingLayoutMarginForIndentation;
  self->_double extraLeadingLayoutMarginForIndentation = 0.0;
  if (extraLeadingLayoutMarginForIndentation != 0.0) {
    [(UITableViewCell *)self _applyLeadingLayoutMarginAdjustment:-extraLeadingLayoutMarginForIndentation];
  }
}

- (void)setSelected:(BOOL)selected
{
}

- (void)setHighlighted:(BOOL)highlighted
{
}

- (void)_setDragState:(int64_t)a3
{
  if (self->_dragState != a3)
  {
    self->_dragState = a3;
    -[UITableViewCell _updateUserInteractionEnabledForNewDragState:](self, "_updateUserInteractionEnabledForNewDragState:");
    [(UITableViewCell *)self dragStateDidChange:a3];
  }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  BOOL v4 = animated;
  BOOL v5 = selected;
  if (selected)
  {
    if (![(UIView *)self isUserInteractionEnabled]) {
      return;
    }
    if (self->_deselectTimer)
    {
      self->_lastSelectionTime = 0.0;
      [(UITableViewCell *)self _delayedDeselect];
    }
  }
  if (((*(unsigned char *)&self->_tableCellFlags & 0x80) == 0) == v5)
  {
    [(NSTimer *)self->_deselectTimer invalidate];
    deselectTimer = self->_deselectTimer;
    self->_deselectTimer = 0;

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    if (v5)
    {
      self->_lastSelectionTime = Current;
      if ((*(unsigned char *)&self->_tableCellFlags & 0x70) != 0)
      {
        if (![(UITableViewCell *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration])[(UITableViewCell *)self _setupSelectedBackgroundView]; {
        int v9 = 128;
        }
        goto LABEL_18;
      }
      int v13 = 128;
      goto LABEL_20;
    }
    if (v4 || (double v10 = Current - self->_lastSelectionTime, v10 >= 0.1) || v10 < 0.0)
    {
      int v9 = 0;
      int v13 = 0;
      if ((*(unsigned char *)&self->_tableCellFlags & 0x70) != 0)
      {
LABEL_18:
        [(UITableViewCell *)self _cancelInternalPerformRequests];
        [(UITableViewCell *)self _prepareForConfigurationStateUpdate];
        *(_DWORD *)&self->_unsigned int tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFFFFFF7F | v9;
        [(UITableViewCell *)self setNeedsUpdateConfiguration];
        [(UITableViewCell *)self showSelectedBackgroundView:[(UITableViewCell *)self _shouldUseHighlightedOrSelectedAppearance] animated:v4];
        double v14 = [(UITableViewCell *)self editingData:0];
        CGFloat v15 = [v14 editControl:0];
        [v15 setSelected:v5];

LABEL_21:
        [(UITableViewCell *)self _updateFloatingContentControlStateAnimated:v4];
        if ([(UIView *)self isFocused]
          && +[UIFocusRingManager focusRingAvailable])
        {
          +[UIFocusRingManager _updateActiveFocusLayers];
        }
        return;
      }
LABEL_20:
      [(UITableViewCell *)self _prepareForConfigurationStateUpdate];
      *(_DWORD *)&self->_unsigned int tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFFFFFF7F | v13;
      [(UITableViewCell *)self setNeedsUpdateConfiguration];
      goto LABEL_21;
    }
    unsigned int v11 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__delayedDeselect selector:0 userInfo:0 repeats:0.1 - v10];
    BOOL v12 = self->_deselectTimer;
    self->_deselectTimer = v11;

    id v16 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v16 addTimer:self->_deselectTimer forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
  BOOL v4 = animated;
  BOOL v5 = highlighted;
  if ((!highlighted || [(UIView *)self isUserInteractionEnabled])
    && ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x400) == 0) == v5)
  {
    if ((*(unsigned char *)&self->_tableCellFlags & 0x70) == 0)
    {
      [(UITableViewCell *)self _prepareForConfigurationStateUpdate];
      uint64_t v7 = 1024;
      if (!v5) {
        uint64_t v7 = 0;
      }
      *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFFFFFFFBFFLL | v7;
      [(UITableViewCell *)self setNeedsUpdateConfiguration];
      goto LABEL_17;
    }
    if (v5)
    {
      if (![(UITableViewCell *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration])[(UITableViewCell *)self _setupSelectedBackgroundView]; {
      [(UITableViewCell *)self _cancelInternalPerformRequests];
      }
      [(UITableViewCell *)self _prepareForConfigurationStateUpdate];
      *(void *)((char *)&self->_tableCellFlags + 4) |= 0x400uLL;
      [(UITableViewCell *)self setNeedsUpdateConfiguration];
    }
    else
    {
      [(UITableViewCell *)self _cancelInternalPerformRequests];
      [(UITableViewCell *)self _prepareForConfigurationStateUpdate];
      *(void *)((char *)&self->_tableCellFlags + 4) &= ~0x400uLL;
      [(UITableViewCell *)self setNeedsUpdateConfiguration];
      if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x40000000000000) != 0)
      {
LABEL_16:
        double v10 = [(UITableViewCell *)self editingData:0];
        unsigned int v11 = [v10 editControl:0];
        [v11 setHighlighted:v5];

LABEL_17:
        [(UITableViewCell *)self _updateFloatingContentControlStateAnimated:v4];
        return;
      }
    }
    [(UITableViewCell *)self showSelectedBackgroundView:[(UITableViewCell *)self _shouldUseHighlightedOrSelectedAppearance] animated:v4];
    BOOL v8 = [(UIView *)self traitCollection];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 == 3)
    {
      [(UITableViewCell *)self _updateDefaultLabelsForFocus:v5];
      [(UITableViewCell *)self _updateDefaultAccessoryViewForFocus:v5];
    }
    goto LABEL_16;
  }
}

- (void)setNeedsUpdateConfiguration
{
  if (dyld_program_sdk_at_least())
  {
    *((_WORD *)&self->_tableCellFlags + 6) |= 0x20u;
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      [(UITableViewCell *)self _performConfigurationStateUpdate];
    }
    else
    {
      [(UIView *)self setNeedsLayout];
    }
  }
}

- (void)_prepareForConfigurationStateUpdate
{
  if (((*((unsigned __int16 *)&self->_tableCellFlags + 6) | ((unint64_t)*((unsigned __int8 *)&self->_tableCellFlags
                                                                                + 14) << 16)) & 0x20002000200020) == 0x20)
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __54__UITableViewCell__prepareForConfigurationStateUpdate__block_invoke;
      v3[3] = &unk_1E52D9F70;
      v3[4] = self;
      +[UIView performWithoutAnimation:v3];
    }
  }
}

- (id)_defaultBackgroundConfiguration
{
  if (self->_contentView
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([(UIView *)self->_contentView _containerBackgroundView],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v4 = (void *)v3;
    BOOL v5 = +[UIBackgroundConfiguration clearConfiguration];
    [v5 setCustomView:v4];
  }
  else
  {
    uint64_t v6 = *(void *)((char *)&self->_tableCellFlags + 4) & 0x1FLL;
    if (v6 == 2)
    {
      uint64_t v7 = +[UIBackgroundConfiguration _listInsetGroupedCellConfiguration];
    }
    else
    {
      if (v6) {
        +[UIBackgroundConfiguration listGroupedCellConfiguration];
      }
      else {
      uint64_t v7 = +[UIBackgroundConfiguration listPlainCellConfiguration];
      }
    }
    BOOL v5 = (void *)v7;
  }
  return v5;
}

- (void)_setNeedsSeparatorUpdate
{
  *(void *)((char *)&self->_tableCellFlags + 4) |= 0x800uLL;
  [(UIView *)self setNeedsLayout];
}

- (void)_setSeparatorHidden:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFFFF7FFFFFFFFFFLL | v3;
  [(UITableViewCell *)self _setNeedsSeparatorUpdate];
}

- (void)setSeparatorStyle:(int64_t)a3
{
  unint64_t tableCellFlags = (unint64_t)self->_tableCellFlags;
  if (((tableCellFlags >> 1) & 7) != a3)
  {
    *(_DWORD *)&self->_unint64_t tableCellFlags = tableCellFlags & 0xFFFFFFF1 | (2 * (a3 & 7));
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
  }
}

- (void)_setNeedsAccessoriesUpdate
{
}

- (void)_setNeedsAccessoriesUpdateForced:(BOOL)a3
{
  uint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  if (a3) {
    v3 |= 0x1000000000000000uLL;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = v3 | 0x800000000000000;
  [(UIView *)self setNeedsLayout];
}

- (void)_setNeedsSetup:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
}

- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4 cellOrAncestorViewForAnimatedLayout:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (((((*((unsigned char *)&self->_tableCellFlags + 1) & 1) == 0) ^ v6) & 1) == 0)
  {
    uint64_t v9 = @"normal";
    uint64_t v10 = (*(_DWORD *)&self->_tableCellFlags << 9) & 0x40000000;
    if (v6)
    {
      if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x200) != 0)
      {
        v10 |= 2uLL;
      }
      else
      {
        v10 |= 1uLL;
        unsigned int v11 = @"editing";

        uint64_t v9 = v11;
      }
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76__UITableViewCell__setEditing_animated_cellOrAncestorViewForAnimatedLayout___block_invoke;
    v22[3] = &unk_1E52D9CD0;
    void v22[4] = self;
    v22[5] = v10;
    +[UIView performWithoutAnimation:v22];
    [(UITableViewCell *)self removeEditingData];
    BOOL v12 = [(UITableViewCell *)self _accessoryManager];
    [v12 setCurrentConfigurationIdentifier:v9];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__UITableViewCell__setEditing_animated_cellOrAncestorViewForAnimatedLayout___block_invoke_2;
    aBlock[3] = &unk_1E52DC3D0;
    aBlock[4] = self;
    BOOL v21 = v6;
    id v20 = v8;
    int v13 = _Block_copy(aBlock);
    double v14 = v13;
    if (v5)
    {
      *(void *)((char *)&self->_tableCellFlags + 4) |= 0x200000000uLL;
      [(UITableViewCell *)self _updateContentClip];
      CGFloat v15 = [(UITableViewCell *)self _constants];
      [v15 defaultEditAndUpdateAnimationDuration];
      double v17 = v16;

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __76__UITableViewCell__setEditing_animated_cellOrAncestorViewForAnimatedLayout___block_invoke_3;
      v18[3] = &unk_1E52E0000;
      v18[4] = self;
      v18[5] = v10;
      +[UIView animateWithDuration:4 delay:v14 options:v18 animations:v17 completion:0.0];
    }
    else
    {
      (*((void (**)(void *))v13 + 2))(v13);
      [(UITableViewCell *)self didTransitionToState:v10];
    }
  }
}

- (void)setWasSwiped:(BOOL)a3
{
  uint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x200) == 0) ^ a3) & 1) == 0)
  {
    int v5 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    uint64_t v6 = 512;
    if (!a3) {
      uint64_t v6 = 0;
    }
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v5);
    *(void *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFFFFFFFFDFFLL | v6;
    if ([(UITableViewCell *)self _usesModernAccessoriesLayout])
    {
      [(UITableViewCell *)self _setNeedsAccessoriesUpdate];
    }
  }
}

- (void)setEditingStyle:(int64_t)a3
{
  unint64_t tableCellFlags = (unint64_t)self->_tableCellFlags;
  if (((tableCellFlags >> 12) & 7) != a3)
  {
    *(_DWORD *)&self->_unint64_t tableCellFlags = tableCellFlags & 0xFFFF8FFF | ((a3 & 7) << 12);
    if ((tableCellFlags & 0x100) != 0)
    {
      [(UITableViewCell *)self removeEditingData];
      [(UITableViewCell *)self setEditing:(*(_DWORD *)&self->_tableCellFlags >> 8) & 1 animated:0];
    }
    [(UITableViewCell *)self _setNeedsAccessoriesUpdate];
  }
}

- (void)_setShowsReorderControl:(BOOL)a3
{
  if (((((*((unsigned char *)&self->_tableCellFlags + 2) & 0x20) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    unint64_t v5 = [(UITableViewCell *)self currentStateMask];
    if (v3) {
      int v6 = 0x200000;
    }
    else {
      int v6 = 0;
    }
    uint64_t v7 = 0x40000000;
    if (!v3) {
      uint64_t v7 = 0;
    }
    unint64_t v8 = v5 & 0xFFFFFFFFBFFFFFFFLL | v7;
    *(_DWORD *)&self->_unint64_t tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFFDFFFFF | v6;
    if ([(UITableViewCell *)self _usesModernAccessoriesLayout]) {
      [(UITableViewCell *)self _setNeedsAccessoriesUpdate];
    }
    [(UITableViewCell *)self _willTransitionToState:v8];
    [(UIView *)self setNeedsLayout];
    [(UITableViewCell *)self _didTransitionToState:v8];
  }
}

- (void)_setShowingDeleteConfirmation:(BOOL)a3
{
  *(_DWORD *)&self->_unint64_t tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFFFFFFFE | a3;
}

- (void)_setShouldIndentWhileEditing:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFFFFFFFFDFLL | v3;
  [(UITableViewCell *)self _setNeedsAccessoriesUpdate];
}

- (void)_setMultiselecting:(BOOL)a3
{
  if (!a3 || !self->_multipleSelectionBackgroundView)
  {
    p_unint64_t tableCellFlags = &self->_tableCellFlags;
    *(void *)((char *)&self->_tableCellFlags + 4) &= ~0x40000000uLL;
    goto LABEL_7;
  }
  p_unint64_t tableCellFlags = &self->_tableCellFlags;
  *(void *)((char *)&self->_tableCellFlags + 4) |= 0x40000000uLL;
  p_selectedBackgroundView = &self->_selectedBackgroundView;
  int v6 = [(UIView *)self->_selectedBackgroundView superview];

  if (v6)
  {
LABEL_8:
    [(UIView *)*p_selectedBackgroundView removeFromSuperview];
    [(UITableViewCell *)self showSelectedBackgroundView:(*(_DWORD *)p_tableCellFlags >> 7) & 1 animated:0];
    goto LABEL_9;
  }
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x40000000) == 0)
  {
LABEL_7:
    p_selectedBackgroundView = &self->_multipleSelectionBackgroundView;
    uint64_t v7 = [(UIView *)self->_multipleSelectionBackgroundView superview];

    if (!v7) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_9:
  [(UITableViewCell *)self _setNeedsAccessoriesUpdate];
}

- (void)_removeInnerShadow
{
  [(UIView *)self->_topShadowAnimationView removeFromSuperview];
  topShadowAnimationView = self->_topShadowAnimationView;
  self->_topShadowAnimationView = 0;

  [(UIView *)self->_bottomShadowAnimationView removeFromSuperview];
  bottomShadowAnimationView = self->_bottomShadowAnimationView;
  self->_bottomShadowAnimationView = 0;
}

- (void)_removeFloatingSeparator
{
  [(UIView *)self->_floatingSeparatorView removeFromSuperview];
  floatingSeparatorView = self->_floatingSeparatorView;
  self->_floatingSeparatorView = 0;
}

- (void)_setTopSeparatorFollowsLayoutMargins:(BOOL)a3
{
  uint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x1000000000) == 0) ^ a3) & 1) == 0)
  {
    int v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    uint64_t v5 = 0x1000000000;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(void *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFEFFFFFFFFFLL | v5;
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
  }
}

- (void)_setShouldHaveFullLengthTopSeparator:(BOOL)a3
{
  uint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x800000000) == 0) ^ a3) & 1) == 0)
  {
    int v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    uint64_t v5 = 0x800000000;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(void *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFF7FFFFFFFFLL | v5;
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
  }
}

- (void)_setShouldHaveFullLengthBottomSeparator:(BOOL)a3
{
  uint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x400000000) == 0) ^ a3) & 1) == 0)
  {
    int v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    uint64_t v5 = 0x400000000;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(void *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFFBFFFFFFFFLL | v5;
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
  }
}

- (void)_setDrawsSeparatorAtTopOfSection:(BOOL)a3
{
  uint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x2000000000) == 0) ^ a3) & 1) == 0)
  {
    int v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    uint64_t v5 = 0x2000000000;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(void *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFDFFFFFFFFFLL | v5;
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
  }
}

- (void)_setDrawsSeparatorAtBottomOfSection:(BOOL)a3
{
  uint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x4000000000) == 0) ^ a3) & 1) == 0)
  {
    int v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    uint64_t v5 = 0x4000000000;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(void *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFBFFFFFFFFFLL | v5;
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
  }
}

- (void)_willEnterReusePool
{
}

- (void)_setSwipeContainerView:(id)a3
{
  id v10 = a3;
  id v5 = [(UITableViewCell *)self _swipeContainerView];
  if (v5 != v10)
  {
    id v6 = v10;
    if (v10)
    {
      if (!v5)
      {
        uint64_t v7 = [(UITableViewCell *)self _containerView];

        id v6 = v10;
        if (v7)
        {
          unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v9 = [(UITableViewCell *)self _containerView];
          [v8 handleFailureInMethod:a2, self, @"UITableViewCell.m", 4969, @"UIKit inconsistency: Can't set a swipe container view when a different type of container view is already present: %@", v9 object file lineNumber description];

          id v6 = v10;
        }
      }
    }
    [(UITableViewCell *)self _setContainerView:v6];
    [v5 removeFromSuperview];
  }
}

- (void)setFrame:(CGRect)a3
{
}

- (void)_setNeedsHeightCalculation:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (void)_setIndexPath:(id)a3
{
  id v5 = (NSIndexPath *)a3;
  if (self->_representedIndexPath != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_representedIndexPath, a3);
    id v5 = v6;
  }
}

- (BOOL)_hasBeenReused
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16) >> 18) & 1;
}

- (void)_notifyIsDisplaying:(BOOL)a3
{
  int v3 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  if (((((*(void *)&v3 & 0x80000) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    unsigned int v6 = v3 & 0xFFF7FFFF;
    int v7 = a3 ? 0x80000 : 0;
    *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4);
    *((_WORD *)&self->_tableCellFlags + 6) = v6;
    *((unsigned char *)&self->_tableCellFlags + 14) = (v6 | v7) >> 16;
    if (objc_opt_respondsToSelector())
    {
      contentView = self->_contentView;
      [(UIView *)contentView _containerViewIsHiddenForReuse:!v4];
    }
  }
}

- (id)_createDefaultContentView
{
  if (dyld_program_sdk_at_least())
  {
    [(UIView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    unsigned int v11 = [(UITableViewCell *)self layoutManager];
    objc_msgSend(v11, "contentEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
    double v4 = v12;
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
  }
  double v16 = -[UITableViewCellContentView initWithFrame:]([UITableViewCellContentView alloc], "initWithFrame:", v4, v6, v8, v10);
  return v16;
}

- (void)_setupTableViewCellCommon
{
  v25[1] = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _ensureInitializeSystemAppearanceModifications];
  [(UITableViewCell *)self setSelectionFadeDuration:0.5];
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_separatorInset.CGFloat top = _Q0;
  *(_OWORD *)&self->_separatorInset.CGFloat bottom = _Q0;
  *(void *)((char *)&self->_tableCellFlags + 4) |= 0x800020000000uLL;
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  *(_OWORD *)obuint64_t j = 0u;
  long long v17 = 0u;
  double v8 = [(UITableViewCell *)self _constants];
  uint64_t v9 = *(void *)((char *)&self->_tableCellFlags + 4);
  double v10 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, 4);
  unsigned int v11 = [(UIView *)self traitCollection];
  if (v8)
  {
    [v8 defaultCellBackgroundPropertiesForTableViewStyle:v9 & 0x1F state:v10 traitCollection:v11];
  }
  else
  {
    uint64_t v24 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    *(_OWORD *)obuint64_t j = 0u;
    long long v17 = 0u;
  }

  objc_storeStrong((id *)&self->_selectionTintColor, obj[1]);
  id v12 = (id)v17;
  double v13 = v12;
  if (v12)
  {
    v25[0] = v12;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  }
  else
  {
    double v14 = 0;
  }
  objc_storeStrong((id *)&self->_selectionEffects, v14);
  if (v13) {

  }
  *(_DWORD *)&self->_unint64_t tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xC7FFFFFF | 0x20000000;
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    [(UITableViewCell *)self setClipsToBounds:1];
  }
  if (dyld_program_sdk_at_least()) {
    [(UIView *)self _setHostsLayoutEngine:1];
  }
  -[UIView setEdgesPreservingSuperviewLayoutMargins:](self, "setEdgesPreservingSuperviewLayoutMargins:", 10, obj[0]);
  [(UIView *)self setEdgesInsettingLayoutMarginsFromSafeArea:[(UIView *)self edgesInsettingLayoutMarginsFromSafeArea] & 0xA];
  __int16 v15 = *((_WORD *)&self->_tableCellFlags + 6);
  *(void *)((char *)&self->_tableCellFlags + 4) |= 0x400000000000000uLL;
  *((_WORD *)&self->_tableCellFlags + 6) = v15 | 0xC020;
  [(UITableViewCell *)self _updateDefaultIndentationWidth];

  __destructor_8_s8_s16_s24_s80((uint64_t)obj);
}

- (void)_setIndentationWidth:(double)a3
{
  if (self->_indentationWidth != a3)
  {
    self->_indentationWidth = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_updateDefaultIndentationWidth
{
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x2000) == 0)
  {
    double v3 = [(UITableViewCell *)self _constants];
    [v3 defaultIndentationWidthForSidebarStyle:0];
    double v5 = v4;

    [(UITableViewCell *)self _setIndentationWidth:v5];
  }
}

- (void)setSelectionFadeDuration:(double)a3
{
  self->_selectionFadeDuration = a3;
}

+ (void)_ensureInitializeSystemAppearanceModifications
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__UITableViewCell__ensureInitializeSystemAppearanceModifications__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_ensureInitializeSystemAppearanceModifications_onceToken != -1) {
    dispatch_once(&_ensureInitializeSystemAppearanceModifications_onceToken, block);
  }
}

- (void)setSeparatorColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_separatorColor = &self->_separatorColor;
  if (self->_separatorColor != v5)
  {
    unsigned int v11 = v5;
    objc_storeStrong((id *)&self->_separatorColor, a3);
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
    double v7 = *p_separatorColor;
    double v8 = +[UIColor tableSeparatorDarkColor];
    if ([(UIColor *)v7 isEqual:v8])
    {
    }
    else
    {
      uint64_t v9 = *p_separatorColor;
      double v10 = +[UIColor tableSeparatorLightColor];
      LOBYTE(v9) = [(UIColor *)v9 isEqual:v10];

      double v5 = v11;
      if (v9) {
        goto LABEL_7;
      }
      [(UITableViewCell *)self _setSeparatorDrawsInVibrantLightModeUIAppearance:MEMORY[0x1E4F1CC28]];
    }
    double v5 = v11;
  }
LABEL_7:
}

- (void)_setSeparatorDrawsInVibrantLightModeUIAppearance:(id)a3
{
  uint64_t v4 = [a3 BOOLValue];
  [(UITableViewCell *)self _setSeparatorDrawsInVibrantLightMode:v4];
}

- (id)_addSeparatorWithFrame:(CGRect)a3
{
  uint64_t v4 = -[_UITableViewCellSeparatorView initWithFrame:]([_UITableViewCellSeparatorView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  unint64_t v6 = *(void *)((char *)&self->_tableCellFlags + 4);
  if ((v6 & 0x40000000000) != 0) {
    [(_UITableViewCellSeparatorView *)v4 setDrawsWithVibrantLightMode:1];
  }
  else {
    [(UIView *)v4 _setDrawsAsBackdropOverlayWithBlendMode:(v6 >> 39) & 7];
  }
  [(_UITableViewCellSeparatorView *)v5 setSeparatorEffect:self->_separatorEffect];
  [(UIView *)self addSubview:v5];
  return v5;
}

- (void)_setContentView:(id)a3
{
  double v5 = (UIView *)a3;
  unint64_t v6 = v5;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    id v12 = v5;
    if (contentView)
    {
      -[UITableViewCell _clearChangeHandlersForOldContentView:](self, "_clearChangeHandlersForOldContentView:");
      if (*p_contentView)
      {
        *((void *)&(*p_contentView)->_viewFlags + 1) &= ~0x200uLL;
        uint64_t v9 = *p_contentView;
      }
      else
      {
        uint64_t v9 = 0;
      }
      [(UIView *)v9 removeFromSuperview];
    }
    longPressGesture = self->_longPressGesture;
    self->_longPressGesture = 0;

    objc_storeStrong((id *)&self->_contentView, a3);
    [(UIView *)v12 setSemanticContentAttribute:[(UIView *)self semanticContentAttribute]];
    unint64_t v6 = v12;
    if (v12)
    {
      [(UIView *)self addSubview:v12];
      uint64_t v11 = 512;
      if ((((*(void *)&v12->_viewFlags & 0x20000000000000) == 0) & (*((unsigned __int8 *)&self->_tableCellFlags + 14) >> 4)) == 0) {
        uint64_t v11 = 0;
      }
      *((void *)&v12->_viewFlags + 1) = v11 | *((void *)&v12->_viewFlags + 1) & 0xFFFFFFFFFFFFFDFFLL;
      [(UITableViewCell *)self _setupChangeHandlersForNewContentView:v12];
      [(UITableViewCell *)self _setupMenuGesture];
      unint64_t v6 = v12;
    }
  }
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self->_floatingContentView)
  {
    double v10 = [(UITableViewCell *)self _subviewsForFloatingContentView];
    int v11 = [v10 containsObject:v8];

    if (!v11)
    {
      -[UIView _addSubview:positioned:relativeTo:](&v21, sel__addSubview_positioned_relativeTo_, v8, a4, v9, v20.receiver, v20.super_class, self, UITableViewCell);
      goto LABEL_20;
    }
    if (a4 == -3)
    {
      __int16 v15 = [v9 superview];
      double v16 = [(_UIFloatingContentView *)self->_floatingContentView contentView];

      if (v15 != v16)
      {
        double v14 = [(_UIFloatingContentView *)self->_floatingContentView contentView];
        [v14 insertSubview:v8 atIndex:0];
        goto LABEL_19;
      }
      a4 = -3;
    }
    else if (a4 == -2)
    {
      id v12 = [v9 superview];
      double v13 = [(_UIFloatingContentView *)self->_floatingContentView contentView];

      if (v12 != v13)
      {
        double v14 = [(_UIFloatingContentView *)self->_floatingContentView contentView];
        [v14 addSubview:v8];
LABEL_19:

        goto LABEL_20;
      }
      a4 = -2;
    }
    else if (a4 >= 1)
    {
      long long v17 = [(_UIFloatingContentView *)self->_floatingContentView contentView];
      long long v18 = [v17 subviews];
      unint64_t v19 = [v18 count];

      if (v19 < a4) {
        a4 = v19;
      }
    }
    double v14 = [(_UIFloatingContentView *)self->_floatingContentView contentView];
    [v14 _addSubview:v8 positioned:a4 relativeTo:v9];
    goto LABEL_19;
  }
  -[UIView _addSubview:positioned:relativeTo:](&v20, sel__addSubview_positioned_relativeTo_, v8, a4, v9, self, UITableViewCell, v21.receiver, v21.super_class);
LABEL_20:
}

- (void)_setupMenuGesture
{
  contentView = self->_contentView;
  if (contentView)
  {
    uint64_t v4 = [(UIGestureRecognizer *)self->_longPressGesture view];

    if (contentView != v4)
    {
      double v5 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel__longPressGestureRecognized_];
      longPressGesture = self->_longPressGesture;
      self->_longPressGesture = v5;

      [(UIGestureRecognizer *)self->_longPressGesture setDelegate:self];
      [(UILongPressGestureRecognizer *)self->_longPressGesture setMinimumPressDuration:0.5];
      double v7 = self->_contentView;
      id v8 = self->_longPressGesture;
      [(UIView *)v7 addGestureRecognizer:v8];
    }
  }
}

- (void)_setupChangeHandlersForNewContentView:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke;
    v17[3] = &unk_1E52DC308;
    double v5 = &v18;
    objc_copyWeak(&v18, &location);
    [v4 _setPreferredSeparatorInsetsDidChangeHandler:v17];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_6;
    }
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_2;
    v15[3] = &unk_1E52DC308;
    double v5 = &v16;
    objc_copyWeak(&v16, &location);
    [v4 _setPrimaryTextFrameDidChangeHandler:v15];
  }
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
LABEL_6:
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_3;
    v13[3] = &unk_1E52DC308;
    objc_copyWeak(&v14, &location);
    [v4 _setPopupMenuButtonDidChangeHandler:v13];
    [(UITableViewCell *)self _updatePopupMenuButtonFromContentView];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_4;
    v11[3] = &unk_1E52DC308;
    objc_copyWeak(&v12, &location);
    [v4 _setContainerBackgroundViewDidChangeHandler:v11];
    if ([(UITableViewCell *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration])
    {
      [(UITableViewCell *)self _updateDefaultBackgroundAppearance];
    }
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_5;
    id v9 = &unk_1E52E46B0;
    objc_copyWeak(&v10, &location);
    [v4 _setDefaultListContentConfigurationProvider:&v6];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "_containingListStyleUpdated:", -[UITableViewCell _contentViewListStyleFromTableViewStyle:](self, "_contentViewListStyleFromTableViewStyle:", *(void *)((char *)&self->_tableCellFlags + 4) & 0x1FLL));
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "_containerViewIsHiddenForReuse:", ((*((unsigned __int16 *)&self->_tableCellFlags + 6) | ((unint64_t)*((unsigned __int8 *)&self->_tableCellFlags+ 14) << 16)) & 0x80000) == 0, v6, v7, v8, v9);
  }
}

- (void)_setSeparatorDrawsInVibrantLightMode:(BOOL)a3
{
  p_unint64_t tableCellFlags = &self->_tableCellFlags;
  uint64_t v5 = 0x40000000000;
  if (!a3) {
    uint64_t v5 = 0;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFBFFFFFFFFFFLL | v5;
  separatorView = self->_separatorView;
  if (a3)
  {
    [(UIView *)separatorView _setDrawsAsBackdropOverlayWithBlendMode:0];
    [(_UITableViewCellSeparatorView *)self->_separatorView setDrawsWithVibrantLightMode:1];
    [(UIView *)self->_separatorView setBackgroundColor:0];
    p_topSeparatorView = &self->_topSeparatorView;
    [(UIView *)self->_topSeparatorView _setDrawsAsBackdropOverlayWithBlendMode:0];
    [(_UITableViewCellSeparatorView *)self->_topSeparatorView setDrawsWithVibrantLightMode:1];
    separatorColor = 0;
  }
  else
  {
    -[_UITableViewCellSeparatorView setDrawsWithVibrantLightMode:](separatorView, "setDrawsWithVibrantLightMode:");
    p_topSeparatorView = &self->_topSeparatorView;
    [(_UITableViewCellSeparatorView *)self->_topSeparatorView setDrawsWithVibrantLightMode:0];
    [(UIView *)self->_separatorView _setDrawsAsBackdropOverlayWithBlendMode:(*(void *)((char *)p_tableCellFlags + 4) >> 39) & 7];
    [(UIView *)self->_separatorView setBackgroundColor:self->_separatorColor];
    [(UIView *)self->_topSeparatorView _setDrawsAsBackdropOverlayWithBlendMode:(*(void *)((char *)p_tableCellFlags + 4) >> 39) & 7];
    separatorColor = self->_separatorColor;
  }
  id v9 = *p_topSeparatorView;
  [(UIView *)v9 setBackgroundColor:separatorColor];
}

- (void)setSelectionStyle:(UITableViewCellSelectionStyle)selectionStyle
{
}

uint64_t __52__UITableViewCell__resetBackgroundViewConfiguration__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundConfiguration:0];
  [*(id *)(a1 + 32) _setBackgroundViewConfigurationProvider:0];
  int v2 = *(void **)(a1 + 32);
  return [v2 _setBackgroundViewConfiguration:0];
}

- (void)setBackgroundConfiguration:(UIBackgroundConfiguration *)backgroundConfiguration
{
  int v3 = *((_WORD *)&self->_tableCellFlags + 6) & 0xEFFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  __int16 v4 = ((unint64_t)backgroundConfiguration | *((_WORD *)&self->_tableCellFlags + 6) & 0x1000) != 0;
  *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v3);
  *((_WORD *)&self->_tableCellFlags + 6) = v3 | (v4 << 12);
  -[UITableViewCell _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:");
}

- (void)_setBackgroundViewConfigurationProvider:(id)a3
{
  uint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  int v4 = *((_WORD *)&self->_tableCellFlags + 6) & 0xF7FF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16) | ((((unint64_t)a3 | *((_WORD *)&self->_tableCellFlags + 6) & 0x800) != 0) << 11);
  *((unsigned char *)&self->_tableCellFlags + 14) = *((unsigned char *)&self->_tableCellFlags + 14);
  *((_WORD *)&self->_tableCellFlags + 6) = v4;
  if (self->_backgroundViewConfigurationProvider != a3)
  {
    if (a3)
    {
      *(void *)((char *)&self->_tableCellFlags + 4) = v3;
      *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v4);
      *((_WORD *)&self->_tableCellFlags + 6) = v4 & 0x7FFF;
    }
    id v6 = a3;
    uint64_t v7 = (void *)[v6 copy];
    id backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    self->_id backgroundViewConfigurationProvider = v7;

    [(UITableViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (UIView)accessoryView
{
  return self->_customAccessoryView;
}

- (void)_setDrawsTopSeparator:(BOOL)a3
{
  int tableCellFlags = (int)self->_tableCellFlags;
  if (((((tableCellFlags & 0x400000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v4 = 0x400000;
    }
    else {
      int v4 = 0;
    }
    *(_DWORD *)&self->_int tableCellFlags = tableCellFlags & 0xFFBFFFFF | v4;
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
  }
}

- (id)_detailTextLabel
{
  if (!self->_detailTextLabel && (*((_WORD *)&self->_tableCellFlags + 6) & 0x40) == 0)
  {
    uint64_t v3 = [self->_layoutManager detailTextLabelForCell:self];
    detailTextLabel = self->_detailTextLabel;
    self->_detailTextLabel = v3;

    uint64_t v5 = self->_detailTextLabel;
    if (v5)
    {
      id v6 = [(UIView *)v5 superview];
      uint64_t v7 = [(UITableViewCell *)self contentView];

      if (v6 != v7)
      {
        id v8 = [(UITableViewCell *)self contentView];
        [v8 addSubview:self->_detailTextLabel];
      }
    }
  }
  id v9 = self->_detailTextLabel;
  return v9;
}

- (void)_resetBackgroundViewsAndColor
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__UITableViewCell__resetBackgroundViewsAndColor__block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  +[UIView _performSystemAppearanceModifications:v3];
  [(UITableViewCell *)self setBackgroundView:0];
  [(UITableViewCell *)self setSelectedBackgroundView:0];
  [(UITableViewCell *)self setMultipleSelectionBackgroundView:0];
}

- (void)setBackgroundColor:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  if (v4) {
    [(UITableViewCell *)self _resetBackgroundViewConfiguration];
  }
  int v5 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFF7F | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  __int16 v6 = (v4 | *((_WORD *)&self->_tableCellFlags + 6) & 0x80) != 0;
  *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v5);
  *((_WORD *)&self->_tableCellFlags + 6) = v5 | (v6 << 7);
  if ([(UITableViewCell *)self _changesOpaqueStateOfSubviews])
  {
    v17.receiver = self;
    v17.super_class = (Class)UITableViewCell;
    id v7 = [(UIView *)&v17 backgroundColor];
    id v8 = v7;
    if (v7 == (id)v4)
    {
LABEL_15:

      goto LABEL_16;
    }
    id v9 = (CGColor *)[v7 CGColor];
    CGColorRetain(v9);
    v16.receiver = self;
    v16.super_class = (Class)UITableViewCell;
    [(UIView *)&v16 setBackgroundColor:v4];
    BOOL v10 = [(UITableViewCell *)self _shouldUseHighlightedOrSelectedAppearance];
    BOOL v11 = v10;
    BOOL v12 = !v10;
    [(UIView *)self->_textLabel setOpaque:v12];
    [(UIView *)self->_detailTextLabel setOpaque:v12];
    if (v11)
    {
      double v13 = +[UIColor clearColor];
      [(UIView *)self->_textLabel setBackgroundColor:v13];
    }
    else
    {
      if (CGColorEqualToColor([(UIView *)self->_textLabel _backgroundCGColor], v9))
      {
        [(UIView *)self->_textLabel setBackgroundColor:v4];
      }
      else
      {
        id v14 = +[UIColor clearColor];
        [(UIView *)self->_textLabel setBackgroundColor:v14];
      }
      if (CGColorEqualToColor([(UIView *)self->_detailTextLabel _backgroundCGColor], v9))
      {
        [(UIView *)self->_detailTextLabel setBackgroundColor:v4];
LABEL_14:
        CGColorRelease(v9);
        goto LABEL_15;
      }
    }
    __int16 v15 = +[UIColor clearColor];
    [(UIView *)self->_detailTextLabel setBackgroundColor:v15];

    goto LABEL_14;
  }
  v18.receiver = self;
  v18.super_class = (Class)UITableViewCell;
  [(UIView *)&v18 setBackgroundColor:v4];
LABEL_16:
  *(void *)((char *)&self->_tableCellFlags + 4) |= 0x10000000uLL;
}

- (BOOL)_changesOpaqueStateOfSubviews
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (BOOL)_shouldUseHighlightedOrSelectedAppearance
{
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x400) != 0) {
    LOBYTE(v2) = 1;
  }
  else {
    return ((*(_DWORD *)&self->_tableCellFlags & 0x70) != 0) & (*(_DWORD *)&self->_tableCellFlags >> 7);
  }
  return v2;
}

- (void)_resetBackgroundViewConfiguration
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__UITableViewCell__resetBackgroundViewConfiguration__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:v2];
}

- (void)setSelectedBackgroundView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  id v7 = (UIView *)a3;
  id v8 = v7;
  p_selectedBackgroundView = &self->_selectedBackgroundView;
  if (self->_selectedBackgroundView != v7)
  {
    if (v7) {
      [(UITableViewCell *)self _resetBackgroundViewConfiguration];
    }
    p_int tableCellFlags = &self->_tableCellFlags;
    int v11 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFDFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    __int16 v12 = ((unint64_t)v8 | *((_WORD *)&self->_tableCellFlags + 6) & 0x200) != 0;
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v11);
    *((_WORD *)&self->_tableCellFlags + 6) = v11 | (v12 << 9);
    double v13 = *p_selectedBackgroundView;
    if (v4)
    {
      id v14 = v13;
    }
    else
    {
      [(UIView *)v13 removeFromSuperview];
      id v14 = 0;
    }
    objc_storeStrong((id *)&self->_selectedBackgroundView, v5);
    if (*p_selectedBackgroundView)
    {
      int v15 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
      unint64_t v16 = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFFFFFFFF7FLL;
    }
    else
    {
      if ([(UITableViewCell *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration])
      {
        goto LABEL_12;
      }
      [(UITableViewCell *)self _setupSelectedBackgroundView];
      int v15 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
      unint64_t v16 = *(void *)((char *)&self->_tableCellFlags + 4) | 0x80;
    }
    *(void *)((char *)&self->_tableCellFlags + 4) = v16;
    *((_WORD *)&self->_tableCellFlags + 6) = v15;
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v15);
LABEL_12:
    if (![(UITableViewCell *)self isSelected]) {
      goto LABEL_25;
    }
    int v17 = *(_DWORD *)p_tableCellFlags;
    if ((*(_DWORD *)p_tableCellFlags & 0x100) == 0)
    {
LABEL_14:
      objc_super v18 = [(UITableViewCell *)self _tableView];
      BOOL v20 = ([v18 allowsMultipleSelection] & 1) == 0
         || (multipleSelectionBackgroundView = self->_multipleSelectionBackgroundView) == 0
         || multipleSelectionBackgroundView == *p_selectedBackgroundView;

      if ((v17 & 0x100) != 0) {
      if (!v20)
      }
        goto LABEL_25;
LABEL_35:
      if (!*p_selectedBackgroundView) {
        goto LABEL_38;
      }
      goto LABEL_36;
    }
    if ((*(_DWORD *)p_tableCellFlags & 0x7000) == 0x3000)
    {
      objc_super v21 = self->_multipleSelectionBackgroundView;
      if (!v21) {
        goto LABEL_35;
      }
      if (v21 == *p_selectedBackgroundView)
      {
LABEL_36:
        if (!self->_backgroundView)
        {
          -[UIView addSubview:](self, "addSubview:");
          [(UITableViewCell *)self sendSubviewToBack:*p_selectedBackgroundView];
          if (!v4) {
            goto LABEL_26;
          }
          goto LABEL_41;
        }
        -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:");
LABEL_38:
        if (!v4) {
          goto LABEL_26;
        }
LABEL_41:
        [(UIView *)*p_selectedBackgroundView setAlpha:0.0];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __54__UITableViewCell_setSelectedBackgroundView_animated___block_invoke;
        v26[3] = &unk_1E52D9F98;
        double v27 = v14;
        double v28 = self;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __54__UITableViewCell_setSelectedBackgroundView_animated___block_invoke_2;
        v24[3] = &unk_1E52DC3A0;
        id v25 = v27;
        +[UIView animateWithDuration:0 delay:v26 options:v24 animations:0.35 completion:0.0];

        goto LABEL_26;
      }
      goto LABEL_25;
    }
    int v5 = [(UITableViewCell *)self _tableView];
    if (![v5 allowsMultipleSelectionDuringEditing]
      || (*((_WORD *)&self->_tableCellFlags + 6) & 4) != 0)
    {
      if ((*((unsigned char *)&self->_tableCellFlags + 1) & 1) == 0) {
        goto LABEL_14;
      }
    }
    else
    {
      long long v22 = self->_multipleSelectionBackgroundView;
      if (v22)
      {
        long long v23 = *p_selectedBackgroundView;

        if (v22 == v23) {
          goto LABEL_35;
        }
LABEL_25:
        [(UIView *)*p_selectedBackgroundView removeFromSuperview];
LABEL_26:

        goto LABEL_27;
      }
    }

    goto LABEL_35;
  }
LABEL_27:
}

- (void)setSelectedBackgroundView:(UIView *)selectedBackgroundView
{
}

- (void)setMultipleSelectionBackgroundView:(UIView *)multipleSelectionBackgroundView
{
  uint64_t v3 = multipleSelectionBackgroundView;
  int v5 = multipleSelectionBackgroundView;
  p_multipleSelectionBackgroundView = &self->_multipleSelectionBackgroundView;
  if (self->_multipleSelectionBackgroundView != v5)
  {
    id v14 = v5;
    if (v5)
    {
      [(UITableViewCell *)self _resetBackgroundViewConfiguration];
      int v5 = v14;
    }
    p_int tableCellFlags = &self->_tableCellFlags;
    int v8 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFBFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    __int16 v9 = ((unint64_t)v5 | *((_WORD *)&self->_tableCellFlags + 6) & 0x400) != 0;
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v8);
    *((_WORD *)&self->_tableCellFlags + 6) = v8 | (v9 << 10);
    [(UIView *)*p_multipleSelectionBackgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_multipleSelectionBackgroundView, v3);
    if (![(UITableViewCell *)self isSelected]) {
      goto LABEL_19;
    }
    int v10 = *(_DWORD *)p_tableCellFlags;
    if ((*(_DWORD *)p_tableCellFlags & 0x100) != 0)
    {
      if ((*(_DWORD *)p_tableCellFlags & 0x7000) == 0x3000) {
        goto LABEL_14;
      }
      uint64_t v3 = [(UITableViewCell *)self _tableView];
      if ([v3 allowsMultipleSelectionDuringEditing]
        && (*((_WORD *)&self->_tableCellFlags + 6) & 4) == 0)
      {

        goto LABEL_14;
      }
      if (*((unsigned char *)&self->_tableCellFlags + 1))
      {

        goto LABEL_19;
      }
    }
    int v11 = [(UITableViewCell *)self _tableView];
    int v12 = [v11 allowsMultipleSelection];

    if ((v10 & 0x100) != 0)
    {

      if ((v12 & 1) == 0)
      {
LABEL_19:
        [(UIView *)*p_multipleSelectionBackgroundView removeFromSuperview];
LABEL_20:
        int v5 = v14;
        goto LABEL_21;
      }
    }
    else if (!v12)
    {
      goto LABEL_19;
    }
LABEL_14:
    double v13 = *p_multipleSelectionBackgroundView;
    if (self->_backgroundView)
    {
      -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v13);
    }
    else
    {
      [(UIView *)self addSubview:v13];
      [(UITableViewCell *)self sendSubviewToBack:*p_multipleSelectionBackgroundView];
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (void)setBackgroundView:(UIView *)backgroundView
{
  int v5 = backgroundView;
  __int16 v6 = v5;
  p_backgroundView = &self->_backgroundView;
  if (self->_backgroundView != v5)
  {
    int v11 = v5;
    if (v5)
    {
      [(UITableViewCell *)self _resetBackgroundViewConfiguration];
      __int16 v6 = v11;
    }
    int v8 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFEFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    __int16 v9 = ((unint64_t)v6 | *((_WORD *)&self->_tableCellFlags + 6) & 0x100) != 0;
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v8);
    *((_WORD *)&self->_tableCellFlags + 6) = v8 | (v9 << 8);
    [(UIView *)*p_backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, backgroundView);
    if (*p_backgroundView) {
      [(UIView *)self insertSubview:*p_backgroundView atIndex:0];
    }
    *(void *)((char *)&self->_tableCellFlags + 4) &= ~0x100uLL;
    __int16 v6 = v11;
    if (!*p_backgroundView)
    {
      BOOL v10 = [(UITableViewCell *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration];
      __int16 v6 = v11;
      if (!v10)
      {
        [(UITableViewCell *)self _setupBackgroundView];
        __int16 v6 = v11;
      }
    }
  }
}

- (void)_updateBackgroundViewConfigurationForState:(id)a3
{
  BOOL v4 = [(UITableViewCell *)self _stateForUpdatingBackgroundConfigurationWithState:a3];
  id backgroundViewConfigurationProvider = (void (**)(id, unint64_t))self->_backgroundViewConfigurationProvider;
  if (backgroundViewConfigurationProvider)
  {
    id v7 = v4;
    __int16 v6 = backgroundViewConfigurationProvider[2](backgroundViewConfigurationProvider, [(UITableViewCell *)self _viewConfigurationState]);
LABEL_3:
    [(UITableViewCell *)self _applyBackgroundViewConfiguration:v6 withState:v7];
LABEL_4:

    BOOL v4 = v7;
    goto LABEL_5;
  }
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x8000) != 0)
  {
    id v7 = v4;
    __int16 v6 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
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
  int v5 = v4;
  if ((*(unsigned char *)&self->_tableCellFlags & 0x70) == 0)
  {
    __int16 v6 = (void *)[v4 copy];

    [v6 setHighlighted:0];
    [v6 setSelected:0];
    int v5 = v6;
  }
  id v7 = [(UIView *)self traitCollection];
  if ([v7 userInterfaceIdiom] == 3 && (int v8 = (*(_DWORD *)&self->_tableCellFlags >> 4) & 7, v8 != 1))
  {

    if (v8 != 3)
    {
      BOOL v10 = (void *)[v5 copy];

      [v10 setFocused:0];
      int v5 = v10;
    }
  }
  else
  {
  }
  return v5;
}

- (UIView)selectedBackgroundView
{
  if (![(UITableViewCell *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration])[(UITableViewCell *)self _setupSelectedBackgroundView]; {
  selectedBackgroundView = self->_selectedBackgroundView;
  }
  return selectedBackgroundView;
}

- (void)setSeparatorInset:(UIEdgeInsets)separatorInset
{
  if (separatorInset.left != self->_separatorInset.left
    || separatorInset.top != self->_separatorInset.top
    || separatorInset.right != self->_separatorInset.right
    || separatorInset.bottom != self->_separatorInset.bottom)
  {
    self->_separatorInset = separatorInset;
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
  }
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCell;
  id v4 = (UIView *)a3;
  [(UIView *)&v6 _intrinsicContentSizeInvalidatedForChildView:v4];
  contentView = self->_contentView;

  if (contentView == v4) {
    [(UITableViewCell *)self invalidateIntrinsicContentSize];
  }
}

- (void)invalidateIntrinsicContentSize
{
  uint64_t v3 = [(UITableViewCell *)self _tableView];
  id v4 = v3;
  if (v3)
  {
    [v3 _cellDidInvalidateIntrinsicContentSize:self];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITableViewCell;
    [(UIView *)&v5 invalidateIntrinsicContentSize];
  }
}

- (void)_setAnimating:(BOOL)a3
{
}

- (void)_animateInnerShadowForInsertion:(BOOL)a3 withRowAnimation:(int64_t)a4
{
  if (a4 == 6)
  {
    v82[13] = v13;
    v82[14] = v12;
    v82[15] = v11;
    v82[16] = v10;
    v82[17] = v9;
    v82[18] = v8;
    v82[19] = v7;
    v82[20] = v6;
    v82[31] = v4;
    v82[32] = v5;
    if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x1FLL) == 0)
    {
      BOOL v15 = a3;
      [(UIView *)self->_topShadowAnimationView removeFromSuperview];
      unint64_t v16 = [UIImageView alloc];
      int v17 = +[UIImage kitImageNamed:@"UITableInnerShadowTop.png"];
      objc_super v18 = [(UIImageView *)v16 initWithImage:v17];
      topShadowAnimationView = self->_topShadowAnimationView;
      self->_topShadowAnimationView = v18;

      [(UIView *)self->_bottomShadowAnimationView removeFromSuperview];
      BOOL v20 = [UIImageView alloc];
      objc_super v21 = +[UIImage kitImageNamed:@"UITableInnerShadowBottom.png"];
      long long v22 = [(UIImageView *)v20 initWithImage:v21];
      bottomShadowAnimationView = self->_bottomShadowAnimationView;
      self->_bottomShadowAnimationView = v22;

      uint64_t v24 = [(UITableViewCell *)self layoutManager];
      if ([(UITableViewCell *)self isEditing])
      {
        [v24 backgroundStartingRectForCell:self forNewEditingState:1];
        double v79 = v26;
        double v80 = v25;
        double v28 = v27;
        double v30 = v29;
      }
      else
      {
        double v31 = [(UITableViewCell *)self _tableView];
        objc_msgSend(v24, "backgroundStartingRectForCell:forNewEditingState:", self, objc_msgSend(v31, "_wasEditing"));
        double v79 = v33;
        double v80 = v32;
        double v28 = v34;
        double v30 = v35;
      }
      CGRect v36 = [(UITableViewCell *)self layoutManager];
      if ([(UITableViewCell *)self isEditing])
      {
        [v36 backgroundEndingRectForCell:self forNewEditingState:1];
        double v77 = v38;
        double v78 = v37;
        double v40 = v39;
        double v42 = v41;
      }
      else
      {
        double v43 = [(UITableViewCell *)self _tableView];
        objc_msgSend(v36, "backgroundEndingRectForCell:forNewEditingState:", self, objc_msgSend(v43, "isEditing"));
        double v77 = v45;
        double v78 = v44;
        double v40 = v46;
        double v42 = v47;
      }
      [(UIView *)self->_topShadowAnimationView bounds];
      double v49 = v48;
      double v50 = v28 + v30 * 0.5;
      [(UIView *)self->_topShadowAnimationView bounds];
      double v52 = v51;
      [(UIView *)self->_bottomShadowAnimationView bounds];
      double v54 = v40 + v42 - v53;
      [(UIView *)self->_bottomShadowAnimationView bounds];
      double v56 = v55;
      [(UIView *)self->_bottomShadowAnimationView bounds];
      double v58 = v40 + v42 * 0.5 - v57;
      [(UIView *)self->_bottomShadowAnimationView bounds];
      double v60 = 1.0;
      if (v15) {
        double v61 = v54;
      }
      else {
        double v61 = v58;
      }
      if (v15) {
        double v62 = v56;
      }
      else {
        double v62 = v59;
      }
      double v74 = v61;
      double v75 = v62;
      if (v15) {
        double v56 = v59;
      }
      else {
        double v58 = v54;
      }
      if (v15) {
        double v63 = 1.0;
      }
      else {
        double v63 = 0.0;
      }
      if (v15) {
        double v60 = 0.0;
      }
      double v76 = v60;
      if (v15) {
        double v64 = v49;
      }
      else {
        double v64 = v52;
      }
      double v73 = v64;
      if (v15) {
        double v65 = v28;
      }
      else {
        double v65 = v50;
      }
      if (v15)
      {
        double v49 = v52;
        double v28 = v50;
      }
      BOOL v66 = +[UIView areAnimationsEnabled];
      +[UIView setAnimationsEnabled:0];
      -[UIView setFrame:](self->_topShadowAnimationView, "setFrame:", v80, v28, v79, v49);
      -[UIView setFrame:](self->_bottomShadowAnimationView, "setFrame:", v78, v58, v77, v56);
      [(UIView *)self->_topShadowAnimationView setAlpha:v63];
      [(UIView *)self->_bottomShadowAnimationView setAlpha:v63];
      v67 = [(UIView *)self->_topShadowAnimationView layer];
      [v67 setZPosition:1.0];

      v68 = [(UIView *)self->_bottomShadowAnimationView layer];
      [v68 setZPosition:1.0];

      +[UIView setAnimationsEnabled:v66];
      [(UIView *)self addSubview:self->_topShadowAnimationView];
      [(UIView *)self addSubview:self->_bottomShadowAnimationView];
      v69 = [(UITableViewCell *)self _constants];
      [v69 defaultEditAndUpdateAnimationDuration];
      double v71 = v70;

      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __68__UITableViewCell__animateInnerShadowForInsertion_withRowAnimation___block_invoke;
      v82[3] = &unk_1E52DD590;
      v82[4] = self;
      *(double *)&v82[5] = v80;
      *(double *)&v82[6] = v65;
      *(double *)&v82[7] = v79;
      *(double *)&v82[8] = v73;
      *(double *)&v82[9] = v78;
      *(double *)&v82[10] = v74;
      *(double *)&v82[11] = v77;
      *(double *)&v82[12] = v75;
      +[UIView animateWithDuration:v82 animations:v71];
      double v72 = v71 - v71 * 0.5;
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __68__UITableViewCell__animateInnerShadowForInsertion_withRowAnimation___block_invoke_2;
      v81[3] = &unk_1E52D9CD0;
      if (!v15) {
        double v72 = 0.0;
      }
      v81[4] = self;
      *(double *)&v81[5] = v76;
      +[UIView animateWithDuration:0 delay:v81 options:0 animations:v71 * 0.5 completion:v72];
    }
  }
}

- (void)_animateFloatingSeparatorForInsertion:(BOOL)a3 withRowAnimation:(int64_t)a4
{
  BOOL v5 = a3;
  if ([(UITableViewCell *)self separatorStyle] && (a4 | 2) == 6)
  {
    [(UITableViewCell *)self _separatorFrame];
    double v8 = v7;
    CGFloat v10 = v9;
    double v12 = v11;
    CGFloat v14 = v13;
    [(UIView *)self bounds];
    double v17 = v15 + v16;
    v36.origin.double x = v8;
    v36.origin.double y = v10;
    v36.size.double width = v12;
    v36.size.double height = v14;
    double v18 = v17 - CGRectGetHeight(v36);
    v37.origin.double x = v8;
    v37.origin.double y = v10;
    v37.size.double width = v12;
    v37.size.double height = v14;
    double Height = CGRectGetHeight(v37);
    if (a4 == 6)
    {
      [(UIView *)self bounds];
      double v25 = v24 + v23 * 0.5;
      v39.origin.double x = v8;
      v39.origin.double y = v10;
      v39.size.double width = v12;
      v39.size.double height = v14;
      double v20 = floor(v25 - CGRectGetHeight(v39));
    }
    else
    {
      double v20 = 0.0;
      if (a4 == 4)
      {
        [(UIView *)self bounds];
        double v22 = v21;
        v38.origin.double x = v8;
        v38.origin.double y = v10;
        v38.size.double width = v12;
        v38.size.double height = v14;
        double v20 = v22 - CGRectGetHeight(v38);
      }
    }
    v40.origin.double x = v8;
    v40.origin.double y = v10;
    v40.size.double width = v12;
    v40.size.double height = v14;
    double v26 = CGRectGetHeight(v40);
    if (v5) {
      double v27 = v26;
    }
    else {
      double v27 = Height;
    }
    if (v5) {
      double v28 = v20;
    }
    else {
      double v28 = v18;
    }
    if (v5) {
      double v20 = v18;
    }
    else {
      double Height = v26;
    }
    [(UIView *)self->_floatingSeparatorView removeFromSuperview];
    double v29 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v8, v28, v12, v27);
    floatingSeparatorView = self->_floatingSeparatorView;
    self->_floatingSeparatorView = v29;

    if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x40000000000) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [(UIView *)self->_floatingSeparatorView setBackgroundColor:self->_separatorColor];
      }
    }
    double v31 = [(UIView *)self->_floatingSeparatorView layer];
    [v31 setZPosition:1.0];

    [(UIView *)self addSubview:self->_floatingSeparatorView];
    double v32 = [(UITableViewCell *)self _constants];
    [v32 defaultEditAndUpdateAnimationDuration];
    double v34 = v33;

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __74__UITableViewCell__animateFloatingSeparatorForInsertion_withRowAnimation___block_invoke;
    void v35[3] = &unk_1E52DA520;
    v35[4] = self;
    *(double *)&v35[5] = v8;
    *(double *)&v35[6] = v20;
    *(double *)&v35[7] = v12;
    *(double *)&v35[8] = Height;
    +[UIView animateWithDuration:v35 animations:v34];
  }
}

- (void)_contentViewLabelTextDidChange:(id)a3
{
  uint64_t v4 = (UILabel *)a3;
  if (self->_detailTextLabel == v4 || self->_textLabel == v4)
  {
    double v8 = v4;
    if (v4)
    {
      BOOL v5 = [(UIView *)v4 superview];
      uint64_t v6 = [(UITableViewCell *)self contentView];

      if (v5 != v6)
      {
        double v7 = [(UITableViewCell *)self contentView];
        [v7 addSubview:v8];
      }
    }
    [(UIView *)self setNeedsLayout];
    uint64_t v4 = v8;
  }
}

- (void)setAccessoryType:(UITableViewCellAccessoryType)accessoryType
{
  p_unint64_t tableCellFlags = &self->_tableCellFlags;
  unint64_t tableCellFlags = (unint64_t)self->_tableCellFlags;
  uint64_t v5 = (tableCellFlags >> 15) & 7;
  if (v5 == accessoryType) {
    return;
  }
  *(_DWORD *)p_unint64_t tableCellFlags = tableCellFlags & 0xFFFC7FFF | ((accessoryType & 7) << 15);
  if ([(UITableViewCell *)self _usesModernAccessoriesLayout])
  {
    if (![(UITableViewCell *)self _updateExpansionButtonFromType:v5 toType:accessoryType])
    {
      [(UITableViewCell *)self _setNeedsAccessoriesUpdate];
    }
    return;
  }
  accessoryView = self->_accessoryView;
  if ((*(_DWORD *)p_tableCellFlags & 0x38000) != 0)
  {
    if (accessoryView)
    {
      if ((unint64_t)(accessoryType - 5) > 1 || (v5 - 5) > 1)
      {
        if ((unint64_t)(accessoryType - 7) <= 1 && v5 == 7)
        {
          CGFloat v10 = [(UIControl *)self->_accessoryView accessoryButton];
          [(UITableViewCell *)self _updateExpansionButton:v10 forType:accessoryType animated:(*(void *)((char *)p_tableCellFlags + 4) & 0x20000000) == 0];
        }
        else
        {
          [(UIView *)self->_accessoryView removeFromSuperview];
          double v11 = self->_accessoryView;
          self->_accessoryView = 0;
        }
      }
      else
      {
        -[UITableViewCell _updateExpansionButton:forType:animated:](self, "_updateExpansionButton:forType:animated:");
      }
    }
    [(UITableViewCell *)self _syncAccessoryViewsIfNecessary];
    if (![(UITableViewCell *)self isEditing]) {
      id v12 = [(UITableViewCell *)self _accessoryView:1];
    }
    goto LABEL_24;
  }
  if (accessoryView != self->_editingAccessoryView) {
    goto LABEL_16;
  }
  if (![(UITableViewCell *)self isEditing])
  {
    accessoryView = self->_accessoryView;
LABEL_16:
    [(UIView *)accessoryView removeFromSuperview];
  }
  double v9 = self->_accessoryView;
  self->_accessoryView = 0;

LABEL_24:
  if (![(UITableViewCell *)self isEditing])
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (BOOL)_updateExpansionButtonFromType:(int64_t)a3 toType:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(UITableViewCell *)self _accessoryManager];
  uint64_t v6 = [v5 configurations];
  double v7 = [v6 objectForKeyedSubscript:0x1ED109440];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v8 = [v7 trailingAccessories];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(v8);
      }
      double v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
      CGFloat v14 = [v13 identifier];
      char v15 = [v14 isEqualToString:@"expand"];

      if (v15) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    double v16 = [v13 view];

    if (v16 && (((a4 - 5) | (unint64_t)(a3 - 5)) < 2 || ((a4 - 7) | (unint64_t)(a3 - 7)) <= 1))
    {
      -[UITableViewCell _updateExpansionButton:forType:animated:](self, "_updateExpansionButton:forType:animated:", v16);
      BOOL v17 = 1;
      goto LABEL_15;
    }
  }
  else
  {
LABEL_9:

    double v16 = 0;
  }
  BOOL v17 = 0;
LABEL_15:

  return v17;
}

- (NSString)reuseIdentifier
{
  BOOL v2 = (void *)[(NSString *)self->_reuseIdentifier copy];
  return (NSString *)v2;
}

- (void)setReuseIdentifier:(id)a3
{
  if (self->_reuseIdentifier != a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    reuseIdentifier = self->_reuseIdentifier;
    self->_reuseIdentifier = v4;
  }
}

void __69__UITableViewCell__setSectionLocation_animated_forceBackgroundSetup___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 412) |= 0x800uLL;
  BOOL v2 = [*(id *)(a1 + 32) superview];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    [v3 _updateSeparatorContent];
  }
}

void __69__UITableViewCell__setSectionLocation_animated_forceBackgroundSetup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v9 = a2;
  uint64_t v6 = [v4 _constants];
  [v6 defaultEditAndUpdateAnimationDuration];
  double v8 = v7;

  +[UIView animateWithDuration:0 delay:v9 options:v5 animations:v8 completion:0.0];
}

- (void)_setSelectionStyle:(int64_t)a3 selectionTintColor:(id)a4
{
  double v7 = (UIColor *)a4;
  unint64_t tableCellFlags = (unint64_t)self->_tableCellFlags;
  if (((tableCellFlags >> 4) & 7) != a3 || self->_selectionTintColor != v7)
  {
    double v16 = v7;
    *(_DWORD *)&self->_unint64_t tableCellFlags = tableCellFlags & 0xFFFFFF8F | (16 * (a3 & 7));
    objc_storeStrong((id *)&self->_selectionTintColor, a4);
    selectionEffects = self->_selectionEffects;
    self->_selectionEffects = 0;

    [(UITableViewCell *)self _updateDefaultBackgroundAppearance];
    uint64_t v10 = [(UITableViewCell *)self _selectedBackgroundView:0];
    uint64_t v11 = v10;
    if (!a3)
    {
      if (v10) {
        [v10 removeFromSuperview];
      }
      [(UIView *)self->_backgroundView alpha];
      if (v12 == 0.0) {
        [(UIView *)self->_backgroundView setAlpha:1.0];
      }
      [(UITableViewCell *)self _applySelectedStateToSeparators:0];
    }
    if (![(UITableViewCell *)self isSelected] || v11)
    {
      if (v11)
      {
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "setSelectionStyle:", -[UITableViewCell selectionStyle](self, "selectionStyle"));
        }
        if (objc_opt_respondsToSelector())
        {
          double v13 = [(UITableViewCell *)self selectionTintColor];
          [v11 setSelectionTintColor:v13];
        }
      }
    }
    else
    {
      [(UIView *)self setNeedsDisplay];
    }
    if ([(UITableViewCell *)self isSelected])
    {
      [(UITableViewCell *)self _updateAndCacheBackgroundColorForHighlightIgnoringSelection:0];
      [(UITableViewCell *)self _updateHighlightColors];
      if (!a3)
      {
        selectedOverlayView = self->_selectedOverlayView;
        if (selectedOverlayView)
        {
          [(UIView *)selectedOverlayView removeFromSuperview];
          char v15 = self->_selectedOverlayView;
          self->_selectedOverlayView = 0;
        }
      }
    }

    double v7 = v16;
  }
}

- (void)_updateTopSeparatorViewAlpha
{
  double v2 = 0.0;
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x100000000000) == 0) {
    double v2 = 1.0;
  }
  [(UIView *)self->_topSeparatorView setAlpha:v2];
}

- (void)_applySelectedStateToSeparators:(BOOL)a3
{
  uint64_t v4 = 0x100000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFFFEFFFFFFFFFFFLL | v4;
  [(UITableViewCell *)self _updateSeparatorViewAlpha];
  [(UITableViewCell *)self _updateTopSeparatorViewAlpha];
}

- (void)_setSelectionGrouping:(int)a3
{
  unsigned int tableCellFlags = self->_tableCellFlags;
  if (((tableCellFlags >> 27) & 7) != a3)
  {
    *(_DWORD *)&self->_unsigned int tableCellFlags = tableCellFlags & 0xC7FFFFFF | ((a3 & 7) << 27);
    id v5 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
    if (v5)
    {
      uint64_t v6 = v5;
      [(UITableViewCell *)self _applyBackgroundViewConfiguration:v5 withState:0];
      id v5 = v6;
    }
  }
}

- (void)setEditingAccessoryType:(UITableViewCellAccessoryType)editingAccessoryType
{
  unint64_t tableCellFlags = (unint64_t)self->_tableCellFlags;
  if (((tableCellFlags >> 18) & 7) == editingAccessoryType) {
    return;
  }
  *(_DWORD *)&self->_unint64_t tableCellFlags = tableCellFlags & 0xFFE3FFFF | ((editingAccessoryType & 7) << 18);
  if ([(UITableViewCell *)self _usesModernAccessoriesLayout])
  {
    [(UITableViewCell *)self _setNeedsAccessoriesUpdate];
    return;
  }
  if ((*((unsigned char *)&self->_tableCellFlags + 2) & 0x1C) != 0)
  {
    editingAccessoryView = self->_editingAccessoryView;
    if (editingAccessoryView)
    {
      [(UIView *)editingAccessoryView removeFromSuperview];
      uint64_t v6 = self->_editingAccessoryView;
      self->_editingAccessoryView = 0;
    }
    [(UITableViewCell *)self _syncAccessoryViewsIfNecessary];
    if ([(UITableViewCell *)self isEditing]) {
      id v7 = [(UITableViewCell *)self _editingAccessoryView:1];
    }
    goto LABEL_17;
  }
  double v8 = self->_editingAccessoryView;
  if (self->_accessoryView != v8) {
    goto LABEL_15;
  }
  if (![(UITableViewCell *)self isEditing])
  {
    double v8 = self->_editingAccessoryView;
LABEL_15:
    [(UIView *)v8 removeFromSuperview];
  }
  id v9 = self->_editingAccessoryView;
  self->_editingAccessoryView = 0;

LABEL_17:
  if ([(UITableViewCell *)self isEditing])
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setAccessoryView:(UIView *)accessoryView
{
  id v5 = accessoryView;
  uint64_t v6 = v5;
  p_customAccessoryView = &self->_customAccessoryView;
  if (self->_customAccessoryView != v5)
  {
    uint64_t v10 = v5;
    if ([(UITableViewCell *)self _usesModernAccessoriesLayout])
    {
      objc_storeStrong((id *)&self->_customAccessoryView, accessoryView);
      [(UITableViewCell *)self _setNeedsAccessoriesUpdate];
LABEL_8:
      uint64_t v6 = v10;
      goto LABEL_9;
    }
    [(UIView *)*p_customAccessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_customAccessoryView, accessoryView);
    if (*p_customAccessoryView)
    {
      [(UIView *)self->_accessoryView removeFromSuperview];
      double v8 = self->_accessoryView;
      self->_accessoryView = 0;
    }
    BOOL v9 = [(UITableViewCell *)self isEditing];
    uint64_t v6 = v10;
    if (!v9)
    {
      [(UIView *)self setNeedsLayout];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (CGRect)_topSeparatorFrame
{
  double v3 = 0.0;
  double v4 = 0.0;
  if (![(UITableViewCell *)self _showFullLengthTopSeparatorForTopOfSection])
  {
    int v5 = *((_DWORD *)&self->super._viewFlags + 4);
    if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x1000000000) != 0)
    {
      [(UIView *)self directionalLayoutMargins];
      if ((*(void *)&v5 & 0x80000) != 0) {
        double v3 = v8;
      }
      else {
        double v3 = 0.0;
      }
      if ((*(void *)&v5 & 0x80000) != 0) {
        double v4 = 0.0;
      }
      else {
        double v4 = v8;
      }
    }
    else
    {
      if ((v5 & 0x80000) != 0)
      {
        [(UITableViewCell *)self _trailingSeparatorInset];
        double v4 = v9;
        [(UITableViewCell *)self _leadingSeparatorInset];
      }
      else
      {
        [(UITableViewCell *)self _leadingSeparatorInset];
        double v4 = v6;
        [(UITableViewCell *)self _trailingSeparatorInset];
      }
      double v3 = v7;
    }
  }
  [(UITableViewCell *)self _separatorHeight];
  double v11 = v10;
  [(UIView *)self bounds];
  double v12 = CGRectGetWidth(v16) - (v3 + v4);
  double v13 = 0.0;
  double v14 = v4;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v12;
  result.origin.double y = v13;
  result.origin.double x = v14;
  return result;
}

- (BOOL)_showFullLengthTopSeparatorForTopOfSection
{
  return (~*(void *)((char *)&self->_tableCellFlags + 4) & 0x2800000000) == 0;
}

void __65__UITableViewCell__ensureInitializeSystemAppearanceModifications__block_invoke(uint64_t a1)
{
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    double v2 = +[UIDevice currentDevice];
    uint64_t v3 = [v2 userInterfaceIdiom];

    if (((v3 - 1) & 0xFFFFFFFFFFFFFFFBLL) == 0)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __65__UITableViewCell__ensureInitializeSystemAppearanceModifications__block_invoke_2;
      v4[3] = &__block_descriptor_40_e5_v8__0l;
      v4[4] = *(void *)(a1 + 32);
      +[UIView _performSystemAppearanceModifications:v4];
    }
  }
}

- (id)_indexPath
{
  return self->_representedIndexPath;
}

- (void)_updateConfigurationWithObservationTracking
{
  double v2 = self;
  sub_185A8CD78();
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

void __65__UITableViewCell__ensureInitializeSystemAppearanceModifications__block_invoke_2(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) appearance];
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    uint64_t v3 = +[UIColor tableCellBackgroundColor];
    [v2 setBackgroundColor:v3];
  }
  v15[0] = objc_opt_class();
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  int v5 = *(void **)(a1 + 32);
  double v6 = +[UIColor tableSeparatorLightColor];
  v14[2] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:3];
  double v8 = [v5 appearanceMatchingProperties:v7 whenContainedInInstancesOfClasses:v4];
  [v8 _setSeparatorDrawsInVibrantLightModeUIAppearance:MEMORY[0x1E4F1CC38]];

  double v9 = [*(id *)(a1 + 32) appearanceMatchingProperties:&unk_1ED3F7A78 whenContainedInInstancesOfClasses:v4];
  double v10 = +[UIColor clearColor];
  [v9 setBackgroundColor:v10];

  double v11 = [*(id *)(a1 + 32) appearanceMatchingProperties:&unk_1ED3F7AA0 whenContainedInInstancesOfClasses:v4];
  double v12 = +[UIColor colorWithWhite:1.0 alpha:0.3];
  [v11 setBackgroundColor:v12];
}

void __39__UITableViewCell__initializeForIdiom___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  double v2 = +[UITraitCollection traitCollectionWithUserInterfaceIdiom:*(void *)(a1 + 32)];
  uint64_t v3 = _UITableConstantsForTraitCollection(v2);
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  double v4 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  if (v3)
  {
    objc_msgSend(v3, "defaultCellBackgroundPropertiesForTableViewStyle:state:traitCollection:", 0, v4, v2, (void)v8);
  }
  else
  {
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
  }

  int v5 = *(void **)(a1 + 40);
  v17[0] = _UIAppearanceContainerForUserInterfaceIdiom();
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  double v7 = [v5 appearanceWhenContainedInInstancesOfClasses:v6];
  [v7 setBackgroundColor:*((void *)&v8 + 1)];

  __destructor_8_s8_s16_s24_s80((uint64_t)&v8);
}

- (BOOL)_shouldChangeOpaqueStateOfView:(id)a3
{
  double v4 = (_UITableViewCellSeparatorView *)a3;
  if (![(UITableViewCell *)self _changesOpaqueStateOfSubviews]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (_UITableViewCellSeparatorView *)self->_backgroundView == v4
    || (_UITableViewCellSeparatorView *)self->_selectedBackgroundView == v4
    || (_UITableViewCellSeparatorView *)self->_multipleSelectionBackgroundView == v4
    || self->_separatorView == v4
    || self->_topSeparatorView == v4
    || (floatingContentView = self->_floatingContentView, floatingContentView == (_UIFloatingContentView *)v4))
  {
    BOOL v8 = 0;
  }
  else
  {
    double v6 = [(_UIFloatingContentView *)floatingContentView transformView];
    if (v6 == v4)
    {
      BOOL v8 = 0;
    }
    else
    {
      double v7 = [(_UIFloatingContentView *)self->_floatingContentView highlightView];
      BOOL v8 = v7 != v4;
    }
  }

  return v8;
}

- (int64_t)_popoverControllerStyle
{
  double v2 = [(UITableViewCell *)self _tableView];
  int64_t v3 = [v2 _popoverControllerStyle];

  return v3;
}

- (BOOL)_isInModalViewController
{
  double v2 = [(UITableViewCell *)self _tableView];
  char v3 = [v2 _isInModalViewController];

  return v3;
}

- (id)_checkmarkImage
{
  return [(UITableViewCell *)self _checkmarkImageWithTintColor:0];
}

- (id)_checkmarkImageWithTintColor:(id)a3
{
  id v4 = a3;
  if ([(UIView *)self isFocused]
    && ([(UITableViewCell *)self _constants],
        int v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) != 0))
  {
    double v7 = [(UITableViewCell *)self _constants];
    BOOL v8 = [(UITableViewCell *)self _tableView];
    long long v9 = [v7 defaultFocusedCheckmarkImageForCell:self inTableView:v8];
  }
  else
  {
    double v7 = [(UITableViewCell *)self _constants];
    long long v9 = [v7 defaultCheckmarkImageForCell:self];
  }

  if (v4)
  {
    uint64_t v10 = [v9 imageWithTintColor:v4 renderingMode:1];

    long long v9 = (void *)v10;
  }

  return v9;
}

- (id)_disclosureChevronImage
{
  char v3 = [(UITableViewCell *)self _tableView];
  id v4 = [v3 _accessoryBaseColor];
  int v5 = [(UITableViewCell *)self _disclosureChevronImageWithBaseColor:v4];

  return v5;
}

- (void)setNeedsUpdateConstraints
{
  char v3 = [(UITableViewCell *)self contentView];
  [v3 setNeedsUpdateConstraints];

  [(UIView *)self _setNeedsUpdateConstraints];
  id v4 = [(UIView *)self _layoutEngine];
  if (v4)
  {
  }
  else if ((*(void *)&self->super._viewFlags & 0x8000000000000000) == 0)
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ([(UIView *)self translatesAutoresizingMaskIntoConstraints])
    {
      if (dyld_program_sdk_at_least())
      {
        int v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutConstraints", &setTranslatesAutoresizingMaskIntoConstraints____s_category_0)+ 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          BOOL v8 = self;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Changing the translatesAutoresizingMaskIntoConstraints property of a UITableViewCell that is managed by a UITableView is not supported, and will result in incorrect self-sizing. Cell: %@", buf, 0xCu);
        }
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCell;
  [(UIView *)&v6 setTranslatesAutoresizingMaskIntoConstraints:v3];
}

- (CGRect)_updatedContentViewFrameForTargetWidth:(double)a3
{
  id layoutManager = self->_layoutManager;
  unint64_t v6 = [(UITableViewCell *)self currentStateMask];
  [layoutManager contentRectForCell:self forState:v6 rowWidth:a3];
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

void __101__UITableViewCell_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UITableViewCellExpansionAccessoryIdentifier_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Warning once only: Detected a case where constraints ambiguously suggest a height of zero for a table view cell's content view. We're considering the collapse unintentional and using standard height instead. Cell: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_updateHighlightColorsForView:(id)a3 highlighted:(BOOL)a4
{
  BOOL v5 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_28;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_28;
  }
  p_int tableCellFlags = &self->_tableCellFlags;
  int tableCellFlags = (int)self->_tableCellFlags;
  if ((tableCellFlags & 0x100) != 0)
  {
    if ((*(_DWORD *)&self->_tableCellFlags & 0x7000) == 0x3000) {
      goto LABEL_28;
    }
    int v4 = [(UITableViewCell *)self _tableView];
    if ([v4 allowsMultipleSelectionDuringEditing])
    {
      int v12 = *(_DWORD *)p_tableCellFlags;
      if ((*((_WORD *)&self->_tableCellFlags + 6) & 4) == 0)
      {

        if ((v12 & 0x100) != 0) {
          goto LABEL_28;
        }
LABEL_21:
        if (v5)
        {
          id v13 = a3;
          uint64_t v14 = 1;
        }
        else
        {
          unhighlightedStates = self->_unhighlightedStates;
          if (unhighlightedStates)
          {
            uint64_t v16 = (id)CFDictionaryGetValue(unhighlightedStates, a3);
            if (v16)
            {
              BOOL v17 = v16;
              objc_msgSend(a3, "setHighlighted:", objc_msgSend(v16, "highlighted"));

              goto LABEL_28;
            }
          }
          id v13 = a3;
          uint64_t v14 = 0;
        }
        [v13 setHighlighted:v14];
        goto LABEL_28;
      }
    }
    else
    {
      int v12 = *(_DWORD *)p_tableCellFlags;
    }
    if ((v12 & 0x100) != 0)
    {
LABEL_20:

      goto LABEL_21;
    }
  }
  double v10 = [(UITableViewCell *)self _tableView];
  if (![v10 allowsMultipleSelection])
  {

    if ((tableCellFlags & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  int v11 = *(_DWORD *)p_tableCellFlags;

  if ((tableCellFlags & 0x100) != 0) {
  if ((v11 & 0x100) == 0)
  }
    goto LABEL_21;
LABEL_28:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && self->_selectedBackgroundView != a3)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v18 = objc_msgSend(a3, "subviews", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
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
          [(UITableViewCell *)self _updateHighlightColorsForView:*(void *)(*((void *)&v23 + 1) + 8 * i) highlighted:v5];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v20);
    }
  }
}

- (void)_updateHighlightColorsForAnimationHalfwayPoint
{
  BOOL v3 = [(UITableViewCell *)self _shouldUseHighlightedOrSelectedAppearance];
  [(UITableViewCell *)self _updateHighlightColorsForView:self highlighted:v3];
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x1000) != 0) {
    [(UIView *)self->_selectedOverlayView setSelected:v3];
  }
  if (!v3)
  {
    backgroundView = self->_backgroundView;
    [(UITableViewCell *)self _setOpaque:1 forSubview:backgroundView];
  }
}

- (void)_updateAndCacheBackgroundColorForHighlightIgnoringSelection:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(UITableViewCell *)self _shouldUseHighlightedOrSelectedAppearance]
     || v3)
    && !self->_unhighlightedStates)
  {
    [(UITableViewCell *)self _saveOpaqueViewState:self];
    [(UITableViewCell *)self _setOpaque:0 forSubview:self];
  }
}

- (id)_defaultFont
{
  BOOL v3 = [(UITableViewCell *)self _constants];
  int v4 = objc_msgSend(v3, "defaultTextLabelFontForCellStyle:", -[UITableViewCell _cellStyle](self, "_cellStyle"));

  return v4;
}

- (void)_releaseTextLabel
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UILabel *)self->_textLabel setTableCell:0];
  }
  [(UIView *)self->_textLabel removeFromSuperview];
  textLabel = self->_textLabel;
  self->_textLabel = 0;
}

- (void)_releaseDetailTextLabel
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UILabel *)self->_detailTextLabel setTableCell:0];
  }
  [(UIView *)self->_detailTextLabel removeFromSuperview];
  detailTextLabel = self->_detailTextLabel;
  self->_detailTextLabel = 0;
}

- (id)_editableTextField
{
  editableTextField = self->_editableTextField;
  if (!editableTextField)
  {
    if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0
      || ([self->_layoutManager editableTextFieldForCell:self],
          int v4 = (UITextField *)objc_claimAutoreleasedReturnValue(),
          BOOL v5 = self->_editableTextField,
          self->_editableTextField = v4,
          v5,
          !self->_editableTextField))
    {
      editableTextField = 0;
    }
    else
    {
      uint64_t v6 = [(UITableViewCell *)self contentView];
      [v6 addSubview:self->_editableTextField];

      editableTextField = self->_editableTextField;
    }
  }
  return editableTextField;
}

- (id)_badge
{
  id badge = self->_badge;
  if (!badge)
  {
    int v4 = [self->_layoutManager badgeForCell:self];
    id v5 = self->_badge;
    self->_id badge = v4;

    id badge = self->_badge;
  }
  return badge;
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  int v4 = (UILongPressGestureRecognizer *)a3;
  id v5 = [(UITableViewCell *)self _tableView];
  int v6 = [v5 _shouldShowMenuForCell:self];
  p_int tableCellFlags = &self->_tableCellFlags;
  uint64_t v8 = 0x4000000;
  if (!v6) {
    uint64_t v8 = 0;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFFFBFFFFFFLL | v8;

  longPressGesture = self->_longPressGesture;
  if (longPressGesture == v4) {
    return (*(void *)((char *)p_tableCellFlags + 4) >> 26) & 1;
  }
  else {
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (void)_longPressGestureRecognized:(id)a3
{
  id v4 = a3;
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x4000000) != 0)
  {
    id v6 = v4;
    BOOL v5 = [v4 state] == 1;
    id v4 = v6;
    if (v5)
    {
      [(UITableViewCell *)self _showMenuFromLongPressGesture];
      id v4 = v6;
    }
  }
}

- (void)_showMenuFromLongPressGesture
{
  if (!self->_editMenuInteraction)
  {
    BOOL v3 = [[UIEditMenuInteraction alloc] initWithDelegate:self];
    editMenuInteraction = self->_editMenuInteraction;
    self->_editMenuInteraction = v3;

    [(UIView *)self addInteraction:self->_editMenuInteraction];
  }
  [(UITableViewCell *)self center];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(UIView *)self superview];
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v9, v6, v8);
  double v11 = v10;
  double v13 = v12;

  +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0, v11, v13);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "set_firstResponderTarget:", self);
  [(UIEditMenuInteraction *)self->_editMenuInteraction presentEditMenuWithConfiguration:v14];
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7 = a5;
  if (self->_editMenuInteraction == a3)
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
    double v8 = +[UIMenu menuWithChildren:v7];
  }

  return v8;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  if (self->_editMenuInteraction == a3)
  {
    double v9 = [(UITableViewCell *)self _tableView];
    [v9 _calloutTargetRectForCell:self];
    double v4 = v10;
    double v5 = v11;
    double v6 = v12;
    double v7 = v13;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB20];
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v14 = v4;
  double v15 = v5;
  double v16 = v6;
  double v17 = v7;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  if (self->_editMenuInteraction == a3) {
    -[UITableViewCell setSelected:animated:](self, "setSelected:animated:", 1, 0, a5);
  }
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  double v7 = (UIEditMenuInteraction *)a3;
  if (self->_editMenuInteraction == v7)
  {
    id v8 = a5;
    [(UITableViewCell *)self setSelected:0 animated:0];
    editMenuInteraction = self->_editMenuInteraction;
    self->_editMenuInteraction = 0;

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__UITableViewCell_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke;
    v10[3] = &unk_1E52D9F70;
    double v11 = v7;
    [v8 addCompletion:v10];
  }
}

void __80__UITableViewCell_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 removeInteraction:*(void *)(a1 + 32)];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (!dyld_program_sdk_at_least())
  {
    double v9 = [(UITableViewCell *)self _tableView];
    if (![v9 _canPerformAction:a3 forCell:self sender:v6])
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
    double v9 = [(UITableViewCell *)self _tableView];
    unsigned __int8 v10 = [v9 _canPerformAction:a3 forCell:self sender:v6];
    goto LABEL_13;
  }
  v13.receiver = self;
  v13.super_class = (Class)UITableViewCell;
  unsigned __int8 v11 = [(UIView *)&v13 canPerformAction:a3 withSender:v6];
LABEL_16:

  return v11 & 1;
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

- (void)_resetSelectionTimer
{
  deselectTimer = self->_deselectTimer;
  if (deselectTimer)
  {
    [(NSTimer *)deselectTimer invalidate];
    double v4 = self->_deselectTimer;
    self->_deselectTimer = 0;
  }
  self->_lastSelectionTime = -1.79769313e308;
}

- (void)_setReordering:(BOOL)a3
{
  p_int tableCellFlags = &self->_tableCellFlags;
  if (((((*((unsigned char *)&self->_tableCellFlags + 1) & 4) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    [(UITableViewCell *)self _prepareForConfigurationStateUpdate];
    if (v4) {
      int v6 = 1024;
    }
    else {
      int v6 = 0;
    }
    *(_DWORD *)p_int tableCellFlags = *(_DWORD *)p_tableCellFlags & 0xFFFFFBFF | v6;
    if (!v4 && [(UITableViewCell *)self _usesRoundedGroups])
    {
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
      {
        *((_WORD *)p_tableCellFlags + 6) |= 0x10u;
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __34__UITableViewCell__setReordering___block_invoke;
        v7[3] = &unk_1E52DC3A0;
        v7[4] = self;
        +[UIView _addCompletion:v7];
      }
    }
    [(UITableViewCell *)self setNeedsUpdateConfiguration];
  }
}

uint64_t __34__UITableViewCell__setReordering___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 420;
  int v2 = *(_WORD *)v1 & 0xFFEF | (*(unsigned __int8 *)(*(void *)(a1 + 32) + 422) << 16);
  *(_WORD *)v1 &= ~0x10u;
  *(unsigned char *)(v1 + 2) = BYTE2(v2);
  return [*(id *)(a1 + 32) setNeedsUpdateConfiguration];
}

- (BOOL)_drawsTopSeparatorDuringReordering
{
  return (*((unsigned char *)&self->_tableCellFlags + 2) & 0x80) == 0;
}

- (void)_setDrawsTopSeparatorDuringReordering:(BOOL)a3
{
  if (a3) {
    int v3 = 0;
  }
  else {
    int v3 = 0x800000;
  }
  *(_DWORD *)&self->_int tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFF7FFFFF | v3;
  [(UITableViewCell *)self _updateSeparatorContent];
}

- (void)setAccessoryActionSegueTemplate:(id)a3
{
  id v5 = a3;
  if (self->_accessoryActionSegueTemplate != v5)
  {
    id v6 = v5;
    objc_storeStrong(&self->_accessoryActionSegueTemplate, a3);
    id v5 = v6;
  }
}

- (id)accessoryActionSegueTemplate
{
  return self->_accessoryActionSegueTemplate;
}

- (void)setSelectionSegueTemplate:(id)a3
{
  id v5 = a3;
  if (self->_selectionSegueTemplate != v5)
  {
    id v6 = v5;
    objc_storeStrong(&self->_selectionSegueTemplate, a3);
    id v5 = v6;
  }
}

- (id)selectionSegueTemplate
{
  return self->_selectionSegueTemplate;
}

- (BOOL)_shouldHaveFullLengthBottomSeparator
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 34) & 1;
}

- (BOOL)_shouldHaveFullLengthTopSeparator
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 35) & 1;
}

- (BOOL)_topSeparatorFollowsLayoutMargins
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 36) & 1;
}

- (UIEdgeInsets)_backgroundSeparatorInset
{
  [(UITableViewCell *)self separatorInset];
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x400000000) != 0)
  {
    double v6 = 0.0;
    double v4 = 0.0;
  }
  result.CGFloat right = v6;
  result.CGFloat bottom = v5;
  result.CGFloat left = v4;
  result.CGFloat top = v3;
  return result;
}

- (BOOL)_drawsSeparatorAtTopOfSection
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 37) & 1;
}

- (BOOL)_drawsSeparatorAtBottomOfSection
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 38) & 1;
}

- (UITableViewCell)init
{
  return -[UITableViewCell initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 320.0, 44.0);
}

- (void)sendSubviewToBack:(id)a3
{
  id v4 = a3;
  double v5 = [v4 superview];
  double v6 = [(_UIFloatingContentView *)self->_floatingContentView contentView];

  if (v5 == v6)
  {
    double v7 = [(_UIFloatingContentView *)self->_floatingContentView contentView];
    [v7 sendSubviewToBack:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCell;
    [(UIView *)&v8 sendSubviewToBack:v4];
  }
}

- (void)bringSubviewToFront:(id)a3
{
  id v4 = a3;
  double v5 = [v4 superview];
  double v6 = [(_UIFloatingContentView *)self->_floatingContentView contentView];

  if (v5 == v6)
  {
    double v7 = [(_UIFloatingContentView *)self->_floatingContentView contentView];
    [v7 bringSubviewToFront:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCell;
    [(UIView *)&v8 bringSubviewToFront:v4];
  }
}

- (void)_systemTextSizeChanged
{
  if (!dyld_program_sdk_at_least())
  {
    [(UITableViewCell *)self _releaseTextLabel];
    [(UITableViewCell *)self _releaseDetailTextLabel];
    p_editableTextField = &self->_editableTextField;
    goto LABEL_12;
  }
  textLabel = self->_textLabel;
  if (textLabel && ![(UILabel *)textLabel adjustsFontForContentSizeCategory])
  {
    id v4 = [(UILabel *)self->_textLabel attributedText];
    objc_setAssociatedObject(self, &unk_1EB25C782, v4, (void *)1);

    *(void *)((char *)&self->_tableCellFlags + 4) |= 0x4000000000000000uLL;
    [(UITableViewCell *)self _releaseTextLabel];
  }
  detailTextLabel = self->_detailTextLabel;
  if (detailTextLabel
    && ![(UILabel *)detailTextLabel adjustsFontForContentSizeCategory])
  {
    double v6 = [(UILabel *)self->_detailTextLabel attributedText];
    objc_setAssociatedObject(self, &unk_1EB25C783, v6, (void *)1);

    *(void *)((char *)&self->_tableCellFlags + 4) |= 0x8000000000000000;
    [(UITableViewCell *)self _releaseDetailTextLabel];
  }
  p_editableTextField = &self->_editableTextField;
  editableTextField = self->_editableTextField;
  if (editableTextField
    && ![(UITextField *)editableTextField adjustsFontForContentSizeCategory])
  {
    double v9 = [(UITextField *)*p_editableTextField attributedText];
    objc_setAssociatedObject(self, &unk_1EB25C784, v9, (void *)1);

    *((_WORD *)&self->_tableCellFlags + 6) |= 1u;
LABEL_12:
    [(UITextField *)*p_editableTextField removeFromSuperview];
    unsigned __int8 v10 = *p_editableTextField;
    *p_editableTextField = 0;
  }
  [(UIView *)self setNeedsLayout];
}

- (void)_resetEditControlRotation
{
  id v3 = [(UITableViewCell *)self editingData:0];
  int v2 = [v3 editControl:0];
  [v2 setRotated:0];
}

- (void)setClipsToBounds:(BOOL)a3
{
  uint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x200000000000) == 0) ^ a3) & 1) == 0)
  {
    int v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    uint64_t v5 = 0x200000000000;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(void *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFDFFFFFFFFFFFLL | v5;
    [(UITableViewCell *)self _updateContentClip];
  }
}

- (UITableViewCell)initWithCoder:(NSCoder *)coder
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  int v4 = coder;
  v65.receiver = self;
  v65.super_class = (Class)UITableViewCell;
  uint64_t v5 = [(UIView *)&v65 initWithCoder:v4];
  double v6 = v5;
  if (v5)
  {
    [(UITableViewCell *)v5 _setupTableViewCellCommon];
    uint64_t v7 = [(NSCoder *)v4 decodeObjectForKey:@"UIReuseIdentifier"];
    reuseIdentifier = v6->_reuseIdentifier;
    v6->_reuseIdentifier = (NSString *)v7;

    p_int tableCellFlags = (unsigned int *)&v6->_tableCellFlags;
    if ([(NSCoder *)v4 decodeBoolForKey:@"UIShowsReorderControl"]) {
      int v10 = 0x200000;
    }
    else {
      int v10 = 0;
    }
    unsigned int *p_tableCellFlags = *(_DWORD *)&v6->_tableCellFlags & 0xFFDFFFFF | v10;
    int v11 = [(NSCoder *)v4 decodeIntegerForKey:@"UITableViewCellStyle"];
    *(void *)((char *)&v6->_tableCellFlags + 4) = *(void *)((char *)&v6->_tableCellFlags + 4) & 0xFFFFFFFFFC003FFFLL | ((unint64_t)(v11 & 0xFFF) << 14);
    double v12 = +[UITableViewCellLayoutManager layoutManagerForTableViewCellStyle:((unint64_t)(v11 << 14) >> 14) & 0xFFF];
    [(UITableViewCell *)v6 setLayoutManager:v12];

    v6->_indentationLevel = [(NSCoder *)v4 decodeIntegerForKey:@"UIIndentationLevel"];
    [(UITableViewCell *)v6 _setupModernAccessoriesLayout];
    unsigned int *p_tableCellFlags = *p_tableCellFlags & 0xFFFFFFF1 | 2;
    if ([(NSCoder *)v4 containsValueForKey:@"UISeparatorStyle"]) {
      int v13 = *p_tableCellFlags & 0xFFFFFFF1 | (2
    }
                                            * ([(NSCoder *)v4 decodeIntegerForKey:@"UISeparatorStyle"] & 7));
    else {
      int v13 = *p_tableCellFlags;
    }
    unsigned int *p_tableCellFlags = v13 & 0xFFFFFF8F | 0x30;
    if ([(NSCoder *)v4 containsValueForKey:@"UISelectionStyle"]) {
      unsigned int *p_tableCellFlags = *p_tableCellFlags & 0xFFFFFF8F | (16
    }
                                                          * ([(NSCoder *)v4 decodeIntegerForKey:@"UISelectionStyle"] & 7));
    unsigned int *p_tableCellFlags = *p_tableCellFlags & 0xFFFF8FFF | (([(NSCoder *)v4 decodeIntegerForKey:@"UIEditingStyle"] & 7) << 12);
    unsigned int *p_tableCellFlags = *p_tableCellFlags & 0xFFFC7FFF | (([(NSCoder *)v4 decodeIntegerForKey:@"UIAccessoryType"] & 7) << 15);
    unsigned int *p_tableCellFlags = *p_tableCellFlags & 0xFFE3FFFF | (([(NSCoder *)v4 decodeIntegerForKey:@"UIEditingAccessoryType"] & 7) << 18);
    if ([(NSCoder *)v4 containsValueForKey:@"UIIndentationWidth"])
    {
      [(NSCoder *)v4 decodeFloatForKey:@"UIIndentationWidth"];
      [(UITableViewCell *)v6 setIndentationWidth:v14];
    }
    double v15 = [(NSCoder *)v4 decodeObjectForKey:@"UIContentConfigurationIdentifier"];
    unsigned int v16 = (*((_WORD *)&v6->_tableCellFlags + 6) & 0xFFBF | (*((unsigned __int8 *)&v6->_tableCellFlags + 14) << 16)) >> 16;
    *((_WORD *)&v6->_tableCellFlags + 6) = *((_WORD *)&v6->_tableCellFlags + 6) & 0xFFBF | ((v15 != 0) << 6);
    *((unsigned char *)&v6->_tableCellFlags + 14) = v16;

    uint64_t v17 = [(NSCoder *)v4 decodeObjectForKey:@"UIContentConfigurationView"];
    viewForContentConfiguration = v6->_viewForContentConfiguration;
    v6->_viewForContentConfiguration = (_UIContentViewInternal *)v17;

    uint64_t v19 = [(NSCoder *)v4 decodeObjectForKey:@"UIContentView"];
    contentView = v6->_contentView;
    v6->_contentView = (UIView *)v19;

    if (!v6->_contentView
      || (*((_WORD *)&v6->_tableCellFlags + 6) & 0x40) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v21 = [UITableViewCellContentView alloc];
      [(UIView *)v6->_contentView frame];
      long long v22 = -[UITableViewCellContentView initWithFrame:](v21, "initWithFrame:");
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v23 = [(UIView *)v6->_contentView subviews];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v62 != v26) {
              objc_enumerationMutation(v23);
            }
            [(UIView *)v22 addSubview:*(void *)(*((void *)&v61 + 1) + 8 * i)];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v61 objects:v66 count:16];
        }
        while (v25);
      }

      if (v6->_contentView)
      {
        -[UIView insertSubview:belowSubview:](v6, "insertSubview:belowSubview:", v22);
        uint64_t v28 = v6->_contentView;
      }
      else
      {
        uint64_t v28 = 0;
      }
      [(UIView *)v28 removeFromSuperview];
      double v29 = v6->_contentView;
      v6->_contentView = &v22->super;
    }
    double v30 = [(UITableViewCell *)v6 layoutManager];
    [v30 contentRectForCell:v6 forState:0];
    -[UIView setFrame:](v6->_contentView, "setFrame:");

    [(UITableViewCell *)v6 _setupMenuGesture];
    if ((*((_WORD *)&v6->_tableCellFlags + 6) & 0x40) == 0)
    {
      uint64_t v31 = [(NSCoder *)v4 decodeObjectForKey:@"UITextLabel"];
      textLabel = v6->_textLabel;
      v6->_textLabel = (UILabel *)v31;

      double v33 = [(UILabel *)v6->_textLabel font];
      double v34 = [(UITableViewCell *)v6 _defaultFont];
      char v35 = [v33 isEqual:v34];

      if ((v35 & 1) == 0) {
        *(void *)((char *)&v6->_tableCellFlags + 4) |= 0x40uLL;
      }
      uint64_t v36 = [(NSCoder *)v4 decodeObjectForKey:@"UIDetailTextLabel"];
      detailTextLabel = v6->_detailTextLabel;
      v6->_detailTextLabel = (UILabel *)v36;

      uint64_t v38 = [(NSCoder *)v4 decodeObjectForKey:@"UIImageView"];
      imageView = v6->_imageView;
      v6->_imageView = (UIImageView *)v38;
    }
    uint64_t v40 = [(NSCoder *)v4 decodeObjectForKey:@"UISystemBackgroundView"];
    systemBackgroundView = v6->_systemBackgroundView;
    v6->_systemBackgroundView = (_UISystemBackgroundView *)v40;

    double v42 = v6->_systemBackgroundView;
    if (v42)
    {
      [(UIView *)v6 insertSubview:v42 atIndex:0];
    }
    else
    {
      uint64_t v43 = [(NSCoder *)v4 decodeObjectForKey:@"UIBackgroundView"];
      backgroundView = v6->_backgroundView;
      v6->_backgroundView = (UIView *)v43;

      if (v6->_backgroundView) {
        *(void *)((char *)&v6->_tableCellFlags + 4) &= ~0x100uLL;
      }
      uint64_t v45 = [(NSCoder *)v4 decodeObjectForKey:@"UISelectedBackgroundView"];
      selectedBackgroundView = v6->_selectedBackgroundView;
      v6->_selectedBackgroundView = (UIView *)v45;

      uint64_t v47 = [(NSCoder *)v4 decodeObjectForKey:@"UIMultipleSelectionBackgroundView"];
      multipleSelectionBackgroundView = v6->_multipleSelectionBackgroundView;
      v6->_multipleSelectionBackgroundView = (UIView *)v47;

      if (v6->_selectedBackgroundView) {
        *(void *)((char *)&v6->_tableCellFlags + 4) &= ~0x80uLL;
      }
    }
    uint64_t v49 = [(NSCoder *)v4 decodeObjectForKey:@"UICustomAccessoryView"];
    customAccessoryView = v6->_customAccessoryView;
    v6->_customAccessoryView = (UIView *)v49;

    [(UIView *)v6 setNeedsDisplayOnBoundsChange:1];
    if ([(NSCoder *)v4 decodeBoolForKey:@"UIDidEncodeCompatibilityBackgroundColor"])
    {
      [(UITableViewCell *)v6 setBackgroundColor:0];
      int v51 = *((_WORD *)&v6->_tableCellFlags + 6) & 0xFF7F | (*((unsigned __int8 *)&v6->_tableCellFlags + 14) << 16);
      *((_WORD *)&v6->_tableCellFlags + 6) &= ~0x80u;
      *((unsigned char *)&v6->_tableCellFlags + 14) = BYTE2(v51);
    }
    BOOL v52 = [(NSCoder *)v4 decodeBoolForKey:@"UITableCellBackgroundColorSet"];
    uint64_t v53 = 2048;
    if (v52) {
      uint64_t v53 = 268437504;
    }
    *(void *)((char *)&v6->_tableCellFlags + 4) = *(void *)((char *)&v6->_tableCellFlags + 4) & 0xFFFFFFFFEFFFFFFFLL | v53;
    if ([(NSCoder *)v4 containsValueForKey:@"UISeparatorInset"])
    {
      [(NSCoder *)v4 decodeUIEdgeInsetsForKey:@"UISeparatorInset"];
      v6->_separatorInset.CGFloat top = v54;
      v6->_separatorInset.CGFloat left = v55;
      v6->_separatorInset.CGFloat bottom = v56;
      v6->_separatorInset.CGFloat right = v57;
    }
    *(void *)((char *)&v6->_tableCellFlags + 4) &= 0xFFF8FFFFFFFFFFFFLL;
    if ([(NSCoder *)v4 containsValueForKey:@"UIFocusStyle"]) {
      *(void *)((char *)&v6->_tableCellFlags + 4) = *(void *)((char *)&v6->_tableCellFlags + 4) & 0xFFF8FFFFFFFFFFFFLL | (([(NSCoder *)v4 decodeIntegerForKey:@"UIFocusStyle"] & 7) << 48);
    }
    uint64_t v58 = [(NSCoder *)v4 decodeObjectForKey:@"UIAccessoryActionPreviewingSegueTemplateStorage"];
    accessoryActionPreviewingSegueTemplateStorage = v6->_accessoryActionPreviewingSegueTemplateStorage;
    v6->_accessoryActionPreviewingSegueTemplateStorage = (UIStoryboardPreviewingSegueTemplateStorage *)v58;
  }
  return v6;
}

- (id)_encodableSubviews
{
  if (self->_floatingContentView)
  {
    int v2 = [(_UIFloatingContentView *)self->_floatingContentView contentView];
    uint64_t v3 = [v2 subviews];
  }
  else
  {
    uint64_t v3 = [(UIView *)self subviews];
  }
  return v3;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v7 = a3;
  int v4 = [(UITableViewCell *)self _encodableSubviews];
  [v7 addObjectsFromArray:v4];
  if ([(UITableViewCell *)self _usesModernAccessoriesLayout])
  {
    uint64_t v5 = [(UITableViewCell *)self _existingSystemAccessoryViews];
    [v7 minusSet:v5];
  }
  else
  {
    if (self->_accessoryView) {
      objc_msgSend(v7, "removeObject:");
    }
    if (self->_editingAccessoryView) {
      objc_msgSend(v7, "removeObject:");
    }
  }
  if (self->_systemBackgroundView) {
    objc_msgSend(v7, "removeObject:");
  }
  uint64_t v6 = *(void *)((char *)&self->_tableCellFlags + 4);
  if ((v6 & 0x100) != 0)
  {
    [v7 removeObject:self->_backgroundView];
    uint64_t v6 = *(void *)((char *)&self->_tableCellFlags + 4);
  }
  if ((v6 & 0x80) != 0) {
    [v7 removeObject:self->_selectedBackgroundView];
  }
}

- (void)_encodeBackgroundColorWithCoder:(id)a3
{
  id v9 = a3;
  systemBackgroundView = self->_systemBackgroundView;
  if (systemBackgroundView)
  {
    uint64_t v5 = [(_UISystemBackgroundView *)systemBackgroundView configuration];
    uint64_t v6 = [(UIView *)self tintColor];
    id v7 = [v5 resolvedBackgroundColorForTintColor:v6];

    if (!v7) {
      goto LABEL_7;
    }
    [v9 encodeObject:v7 forKey:@"UIBackgroundColor"];
    [v9 encodeBool:1 forKey:@"UIDidEncodeCompatibilityBackgroundColor"];
  }
  else
  {
    uint64_t v8 = [(UIView *)self _backgroundColor];
    if (!v8) {
      goto LABEL_7;
    }
    id v7 = (void *)v8;
    [v9 encodeObject:v8 forKey:@"UIBackgroundColor"];
  }

LABEL_7:
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)UITableViewCell;
  [(UIView *)&v26 encodeWithCoder:v4];
  reuseIdentifier = self->_reuseIdentifier;
  if (reuseIdentifier) {
    [v4 encodeObject:reuseIdentifier forKey:@"UIReuseIdentifier"];
  }
  p_int tableCellFlags = &self->_tableCellFlags;
  if ((*((unsigned char *)&self->_tableCellFlags + 2) & 0x20) != 0) {
    [v4 encodeBool:1 forKey:@"UIShowsReorderControl"];
  }
  uint64_t v7 = (*((_DWORD *)&self->_tableCellFlags + 1) >> 14) & 0xFFF;
  if (v7) {
    [v4 encodeInteger:v7 forKey:@"UITableViewCellStyle"];
  }
  int64_t indentationLevel = self->_indentationLevel;
  if (indentationLevel) {
    [v4 encodeInteger:indentationLevel forKey:@"UIIndentationLevel"];
  }
  unint64_t v9 = *(_DWORD *)p_tableCellFlags;
  uint64_t v10 = (v9 >> 1) & 7;
  if (v10 != 1)
  {
    [v4 encodeInteger:v10 forKey:@"UISeparatorStyle"];
    LODWORD(v9) = *(_DWORD *)p_tableCellFlags;
  }
  uint64_t v11 = (v9 >> 4) & 7;
  if (v11 != 3)
  {
    [v4 encodeInteger:v11 forKey:@"UISelectionStyle"];
    LODWORD(v9) = *(_DWORD *)p_tableCellFlags;
  }
  uint64_t v12 = (v9 >> 12) & 7;
  if (v12)
  {
    [v4 encodeInteger:v12 forKey:@"UIEditingStyle"];
    LODWORD(v9) = *(_DWORD *)p_tableCellFlags;
  }
  uint64_t v13 = (v9 >> 15) & 7;
  if (v13)
  {
    [v4 encodeInteger:v13 forKey:@"UIAccessoryType"];
    LODWORD(v9) = *(_DWORD *)p_tableCellFlags;
  }
  uint64_t v14 = (v9 >> 18) & 7;
  if (v14) {
    [v4 encodeInteger:v14 forKey:@"UIEditingAccessoryType"];
  }
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x2000) != 0)
  {
    double indentationWidth = self->_indentationWidth;
    *(float *)&double indentationWidth = indentationWidth;
    [v4 encodeFloat:@"UIIndentationWidth" forKey:indentationWidth];
  }
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x100) == 0)
  {
    backgroundView = self->_backgroundView;
    if (backgroundView) {
      [v4 encodeObject:backgroundView forKey:@"UIBackgroundView"];
    }
  }
  customAccessoryView = self->_customAccessoryView;
  if (customAccessoryView) {
    [v4 encodeObject:customAccessoryView forKey:@"UICustomAccessoryView"];
  }
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x80) == 0)
  {
    selectedBackgroundView = self->_selectedBackgroundView;
    if (selectedBackgroundView) {
      [v4 encodeObject:selectedBackgroundView forKey:@"UISelectedBackgroundView"];
    }
  }
  multipleSelectionBackgroundView = self->_multipleSelectionBackgroundView;
  if (multipleSelectionBackgroundView && multipleSelectionBackgroundView != self->_selectedBackgroundView) {
    [v4 encodeObject:multipleSelectionBackgroundView forKey:@"UIMultipleSelectionBackgroundView"];
  }
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x10000000) != 0) {
    [v4 encodeBool:1 forKey:@"UITableCellBackgroundColorSet"];
  }
  if (self->_separatorInset.left != -1.0 || self->_separatorInset.right != -1.0) {
    [v4 encodeUIEdgeInsets:@"UISeparatorInset" forKey:self->_separatorInset.top];
  }
  uint64_t v20 = *((_WORD *)&self->_tableCellFlags + 5) & 7;
  if (v20) {
    [v4 encodeInteger:v20 forKey:@"UIFocusStyle"];
  }
  [v4 encodeObject:self->_systemBackgroundView forKey:@"UISystemBackgroundView"];
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0)
  {
    uint64_t v21 = [(UITableViewCell *)self contentConfiguration];
    if (v21)
    {
      id v22 = v21;
    }
    else
    {
      id v22 = [(UITableViewCell *)self _contentViewConfiguration];
      if (!v22)
      {
        uint64_t v24 = 0;
LABEL_47:
        [v4 encodeObject:v24 forKey:@"UIContentConfigurationIdentifier"];

        goto LABEL_48;
      }
    }
    if (objc_opt_respondsToSelector())
    {
      [v22 _wrappedConfigurationIdentifier];
    }
    else
    {
      long long v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
    uint64_t v24 = };

    goto LABEL_47;
  }
LABEL_48:
  [v4 encodeObject:self->_viewForContentConfiguration forKey:@"UIContentConfigurationView"];
  [v4 encodeObject:self->_contentView forKey:@"UIContentView"];
  [v4 encodeObject:self->_textLabel forKey:@"UITextLabel"];
  [v4 encodeObject:self->_detailTextLabel forKey:@"UIDetailTextLabel"];
  [v4 encodeObject:self->_imageView forKey:@"UIImageView"];
  accessoryActionPreviewingSegueTemplateStorage = self->_accessoryActionPreviewingSegueTemplateStorage;
  if (accessoryActionPreviewingSegueTemplateStorage) {
    [v4 encodeObject:accessoryActionPreviewingSegueTemplateStorage forKey:@"UIAccessoryActionPreviewingSegueTemplateStorage"];
  }
}

- (void)dealloc
{
  uint64_t v3 = (void *)MEMORY[0x18C108260](self, a2);
  id v4 = +[UIAnimator sharedAnimator];
  [v4 removeAnimationsForTarget:self];

  [(UITableViewCell *)self _releaseTextLabel];
  [(UITableViewCell *)self _releaseDetailTextLabel];
  unhighlightedStates = self->_unhighlightedStates;
  if (unhighlightedStates)
  {
    CFRelease(unhighlightedStates);
    self->_unhighlightedStates = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCell;
  [(UIView *)&v6 dealloc];
}

- (void)setDrawingEnabled:(BOOL)a3
{
  unint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  if ((v3 & 0x1000) != 0 && ((v3 >> 13) & 1) == a3)
  {
    int v5 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    uint64_t v6 = 0x2000;
    if (a3) {
      uint64_t v6 = 0;
    }
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v5);
    *(void *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFFFFFFFDFFFLL | v6;
    if (a3)
    {
      if (dyld_program_sdk_at_least()) {
        [(UITableViewCell *)self _setContentView:0];
      }
      else {
        [(UIView *)self->_contentView removeFromSuperview];
      }
    }
    else if (!self->_contentView && (dyld_program_sdk_at_least() & 1) == 0)
    {
      uint64_t v7 = [(UITableViewCell *)self _createDefaultContentView];
      [(UITableViewCell *)self _setContentView:v7];

      [(UITableViewCell *)self _didCreateContentView];
    }
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
    -[UIView _updateNeedsDisplayOnBoundsChange](self);
  }
}

- (void)setText:(NSString *)text
{
  id v4 = text;
  int v5 = v4;
  uint64_t v8 = v4;
  if (v4 && (v6 = [(NSString *)v4 isEqualToString:&stru_1ED0E84C0], int v5 = v8, !v6))
  {
    uint64_t v7 = [(UITableViewCell *)self _textLabel];
    [v7 setText:v8];

    [(UIView *)self setNeedsLayout];
    int v5 = v8;
  }
  else if (self->_textLabel)
  {
    [(UITableViewCell *)self _releaseTextLabel];
    int v5 = v8;
    *(void *)((char *)&self->_tableCellFlags + 4) &= ~0x40uLL;
  }
}

- (NSString)text
{
  int v2 = [(UITableViewCell *)self _textLabel:0];
  unint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (void)_setFont:(id)a3 layout:(BOOL)a4
{
  BOOL v4 = a4;
  *(void *)((char *)&self->_tableCellFlags + 4) |= 0x40uLL;
  id v6 = a3;
  uint64_t v7 = [(UITableViewCell *)self _textLabel];
  [v7 setFont:v6];

  if (v4)
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setFont:(UIFont *)font
{
}

- (UIFont)font
{
  p_int tableCellFlags = &self->_tableCellFlags;
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x40) == 0)
  {
    BOOL v4 = [(UITableViewCell *)self _defaultFont];
    int v5 = [(UITableViewCell *)self _textLabel];
    [v5 setFont:v4];

    *(void *)((char *)p_tableCellFlags + 4) |= 0x40uLL;
  }
  id v6 = [(UITableViewCell *)self _textLabel];
  uint64_t v7 = [v6 font];

  return (UIFont *)v7;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
  id v4 = [(UITableViewCell *)self _textLabel];
  [v4 setTextAlignment:textAlignment];
}

- (NSTextAlignment)textAlignment
{
  int v2 = [(UITableViewCell *)self _textLabel];
  NSTextAlignment v3 = [v2 textAlignment];

  return v3;
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
  int v5 = [(UITableViewCell *)self _textLabel];
  [v5 setLineBreakMode:lineBreakMode];

  [(UIView *)self setNeedsLayout];
}

- (NSLineBreakMode)lineBreakMode
{
  int v2 = [(UITableViewCell *)self _textLabel];
  NSLineBreakMode v3 = [v2 lineBreakMode];

  return v3;
}

- (void)setTextColor:(UIColor *)textColor
{
  id v4 = textColor;
  int v5 = [(UITableViewCell *)self _textLabel];
  [v5 setTextColor:v4];

  [(UIView *)self setNeedsLayout];
}

- (UIColor)textColor
{
  int v2 = [(UITableViewCell *)self _textLabel];
  NSLineBreakMode v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (void)setSelectedTextColor:(UIColor *)selectedTextColor
{
  id v4 = selectedTextColor;
  id v5 = [(UITableViewCell *)self _textLabel];
  [v5 setHighlightedTextColor:v4];
}

- (UIColor)selectedTextColor
{
  int v2 = [(UITableViewCell *)self _textLabel];
  NSLineBreakMode v3 = [v2 highlightedTextColor];

  return (UIColor *)v3;
}

- (void)setImage:(UIImage *)image
{
  id v4 = image;
  id v5 = [(UITableViewCell *)self _imageView];
  [v5 setImage:v4];
}

- (UIImage)image
{
  int v2 = [(UITableViewCell *)self _imageView];
  NSLineBreakMode v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setSelectedImage:(UIImage *)selectedImage
{
  id v4 = selectedImage;
  id v5 = [(UITableViewCell *)self _imageView];
  [v5 setHighlightedImage:v4];
}

- (UIImage)selectedImage
{
  int v2 = [(UITableViewCell *)self _imageView];
  NSLineBreakMode v3 = [v2 highlightedImage];

  return (UIImage *)v3;
}

- (void)_setBadgeText:(id)a3
{
  id v17 = a3;
  if (![(UITableViewCell *)self _usesModernAccessoriesLayout])
  {
    unint64_t v9 = [(UITableViewCell *)self _badge];
    [v9 setText:v17];

    [self->_badge setNeedsDisplay];
    [(UIView *)self setNeedsLayout];
    goto LABEL_16;
  }
  id v4 = [(UITableViewCell *)self _badgeText];
  id v5 = v17;
  id v6 = v4;
  if (v6 == v5)
  {

    goto LABEL_16;
  }
  uint64_t v7 = v6;
  if (!v5 || !v6)
  {

    goto LABEL_10;
  }
  char v8 = [v5 isEqual:v6];

  if ((v8 & 1) == 0)
  {
LABEL_10:
    BOOL v10 = [v5 length] != 0;
    uint64_t v11 = [(UITableViewCell *)self _badgeText];
    char v12 = v10 ^ ([v11 length] == 0);

    int v13 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    uint64_t v14 = *(void *)((char *)&self->_tableCellFlags + 4);
    if (v5)
    {
      *(void *)((char *)&self->_tableCellFlags + 4) = v14 | 0x2000000000000000;
      *((_WORD *)&self->_tableCellFlags + 6) = v13;
      *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v13);
      double v15 = [(UITableViewCell *)self _badge];
      [v15 setText:v5];
    }
    else
    {
      *(void *)((char *)&self->_tableCellFlags + 4) = v14 & 0xDFFFFFFFFFFFFFFFLL;
      *((_WORD *)&self->_tableCellFlags + 6) = v13;
      *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v13);
    }
    if (v12)
    {
      unsigned int v16 = [(UITableViewCell *)self _accessoryManager];
      [v16 setNeedsLayout];
    }
    else
    {
      [(UITableViewCell *)self _setNeedsAccessoriesUpdate];
    }
  }
LABEL_16:
}

- (void)_setBadgeFont:(id)a3
{
  id v4 = a3;
  id v5 = [(UITableViewCell *)self _badge];
  [v5 setFont:v4];

  if ([(UITableViewCell *)self _usesModernAccessoriesLayout])
  {
    id v6 = [(UITableViewCell *)self _accessoryManager];
    [v6 setNeedsLayout];
  }
  else
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (id)_badgeFont
{
  int v2 = [(UITableViewCell *)self _badge];
  NSLineBreakMode v3 = [v2 font];

  return v3;
}

- (void)_setBadgeColor:(id)a3
{
  id v4 = a3;
  id v5 = [(UITableViewCell *)self _badge];
  [v5 setColor:v4];
}

- (id)_badgeColor
{
  int v2 = [(UITableViewCell *)self _badge];
  NSLineBreakMode v3 = [v2 color];

  return v3;
}

- (id)_existingContentView
{
  return self->_contentView;
}

- (void)_clearChangeHandlersForOldContentView:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [v4 _setPreferredSeparatorInsetsDidChangeHandler:0];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v4 _setPrimaryTextFrameDidChangeHandler:0];
  }
  if (objc_opt_respondsToSelector())
  {
    [v4 _setPopupMenuButtonDidChangeHandler:0];
    [(UITableViewCell *)self _setPopupMenuButton:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 _setContainerBackgroundViewDidChangeHandler:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 _setDefaultListContentConfigurationProvider:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 _containingListStyleUpdated:-1];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 _containerViewIsHiddenForReuse:0];
  }
}

void __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSeparatorContent:1];
}

void __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSeparatorContent:1];
}

void __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePopupMenuButtonFromContentView];
}

void __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDefaultBackgroundAppearance];
}

id __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained defaultContentConfiguration];
  NSLineBreakMode v3 = [WeakRetained configurationState];
  id v4 = [v2 updatedConfigurationForState:v3];

  return v4;
}

- (UIListContentConfiguration)defaultContentConfiguration
{
  int v2 = (*((_DWORD *)&self->_tableCellFlags + 1) >> 14) & 0xFFF;
  if ((v2 - 1) >= 2)
  {
    if (v2 == 3)
    {
      NSLineBreakMode v3 = +[UIListContentConfiguration subtitleCellConfiguration];
    }
    else
    {
      if ([(UITableViewCell *)self _usesRoundedGroups]) {
        +[UIListContentConfiguration _defaultInsetGroupedCellConfiguration];
      }
      else {
      NSLineBreakMode v3 = +[UIListContentConfiguration cellConfiguration];
      }
    }
  }
  else
  {
    NSLineBreakMode v3 = +[UIListContentConfiguration valueCellConfiguration];
  }
  return (UIListContentConfiguration *)v3;
}

- (void)setContentConfiguration:(id)contentConfiguration
{
}

- (void)_setContentViewConfiguration:(id)a3
{
}

- (void)_applyContentViewConfiguration:(id)a3 withState:(id)a4 usingSPI:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  int v12 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  if (v9)
  {
    if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x4000) != 0 && !self->_contentViewConfigurationProvider)
    {
      if (!v10)
      {
        uint64_t v11 = [(UITableViewCell *)self configurationState];
      }
      CGRect v37 = v11;
      if (v5)
      {
        unint64_t v20 = [(UITableViewCell *)self _viewConfigurationState];
        uint64_t v21 = [(UIView *)self traitCollection];
        int v13 = [v9 updatedConfigurationForState:v20 traitCollection:v21];
      }
      else
      {
        int v13 = [v9 updatedConfigurationForState:v11];
      }
      if (!v13)
      {
        double v34 = [MEMORY[0x1E4F28B00] currentHandler];
        [v34 handleFailureInMethod:a2, self, @"UITableViewCell.m", 2482, @"Updated configuration was nil for configuration: %@", v9 object file lineNumber description];
      }
      uint64_t v11 = v37;
    }
    else
    {
      int v13 = v9;
    }
    id v36 = v11;
    if ((v12 & 0x40) == 0)
    {
      char v14 = *((unsigned char *)&self->_tableCellFlags + 14);
      *((_WORD *)&self->_tableCellFlags + 6) |= 0x40u;
      *((unsigned char *)&self->_tableCellFlags + 14) = v14;
      [(UITableViewCell *)self _resetContentViews];
      if (!v5)
      {
LABEL_44:
        double v29 = [v13 makeContentView];
        objc_storeStrong((id *)&self->_viewForContentConfiguration, v29);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v31 = [(_UIContentViewInternal *)self->_viewForContentConfiguration _wrappedContentView];

          double v29 = (void *)v31;
        }
        goto LABEL_46;
      }
      goto LABEL_40;
    }
    viewForContentConfiguration = self->_viewForContentConfiguration;
    if (!viewForContentConfiguration) {
      viewForContentConfiguration = self->_contentView;
    }
    id v16 = v13;
    id v17 = viewForContentConfiguration;
    if (objc_opt_respondsToSelector())
    {
      int v18 = [v17 supportsConfiguration:v16];
    }
    else
    {
      char v35 = a2;
      uint64_t v19 = [v17 configuration];

      id v17 = v19;
      if (v17)
      {
        if (objc_opt_respondsToSelector())
        {
          [v17 _wrappedConfigurationIdentifier];
        }
        else
        {
          long long v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
        id v22 = };
      }
      else
      {
        id v22 = 0;
      }

      id v24 = v16;
      if (v24)
      {
        if (objc_opt_respondsToSelector())
        {
          [v24 _wrappedConfigurationIdentifier];
        }
        else
        {
          objc_super v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
        uint64_t v25 = };
      }
      else
      {
        uint64_t v25 = 0;
      }

      int v18 = [v22 isEqualToString:v25];
      a2 = v35;
    }

    char v27 = *((unsigned char *)&self->_tableCellFlags + 14);
    *((_WORD *)&self->_tableCellFlags + 6) |= 0x40u;
    *((unsigned char *)&self->_tableCellFlags + 14) = v27;
    if (!v18)
    {
      if (!v5)
      {
        double v30 = [(_UIContentViewInternal *)self->_viewForContentConfiguration configuration];
        UIContentConfigurationAlertForReplacedContentView(@"cell", self, v30, v16, @"Use separate reuse identifiers for different types of cells to avoid this.");

        [(UITableViewCell *)self _resetContentViews];
        goto LABEL_44;
      }
      [(UITableViewCell *)self _resetContentViews];
LABEL_40:
      double v29 = [v13 createContentView];
LABEL_46:
      if (!v29)
      {
        double v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:a2, self, @"UITableViewCell.m", 2513, @"Content configuration returned a nil content view: %@", v13 object file lineNumber description];
      }
      if (([v29 translatesAutoresizingMaskIntoConstraints] & 1) == 0)
      {
        double v33 = [MEMORY[0x1E4F28B00] currentHandler];
        [v33 handleFailureInMethod:a2, self, @"UITableViewCell.m", 2514, @"The content view returned from the content configuration must have translatesAutoresizingMaskIntoConstraints enabled: %@", v29 object file lineNumber description];
      }
      [(UITableViewCell *)self _setContentView:v29];

      goto LABEL_51;
    }
    if (v5) {
      contentView = self->_contentView;
    }
    else {
      contentView = self->_viewForContentConfiguration;
    }
    [contentView setConfiguration:v16];
    int v13 = v16;
  }
  else
  {
    *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4);
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v12);
    *((_WORD *)&self->_tableCellFlags + 6) = v12 & 0xFFBF;
    if ((v12 & 0x40) == 0) {
      goto LABEL_52;
    }
    id v36 = v10;
    [(UITableViewCell *)self _setContentView:0];
    int v13 = self->_viewForContentConfiguration;
    self->_viewForContentConfiguration = 0;
  }
LABEL_51:

  uint64_t v11 = v36;
LABEL_52:
}

- (id)contentConfiguration
{
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0)
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

- (void)setAutomaticallyUpdatesContentConfiguration:(BOOL)automaticallyUpdatesContentConfiguration
{
  if (automaticallyUpdatesContentConfiguration)
  {
    id contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    id v4 = (char *)&self->_tableCellFlags + 4;
    uint64_t v5 = *(void *)((char *)&self->_tableCellFlags + 4);
    int v6 = *((unsigned __int16 *)&self->_tableCellFlags + 6);
    int v7 = v6 | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    if ((contentViewConfigurationProvider == 0) != ((v6 & 0x4000) == 0)) {
      return;
    }
    if (!contentViewConfigurationProvider)
    {
      *(void *)id v4 = v5;
      *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v7);
      *((_WORD *)&self->_tableCellFlags + 6) = v7 | 0x4000;
      [(UITableViewCell *)self setNeedsUpdateConfiguration];
      return;
    }
  }
  else
  {
    id v4 = (char *)&self->_tableCellFlags + 4;
    uint64_t v5 = *(void *)((char *)&self->_tableCellFlags + 4);
    int v8 = *((unsigned __int16 *)&self->_tableCellFlags + 6);
    int v7 = v8 | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    if ((v8 & 0x4000) == 0) {
      return;
    }
  }
  *(void *)id v4 = v5;
  v4[10] = BYTE2(v7);
  *((_WORD *)v4 + 4) = v7 & 0xBFFF;
}

- (BOOL)automaticallyUpdatesContentConfiguration
{
  return ((unint64_t)*((unsigned __int16 *)&self->_tableCellFlags + 6) >> 14) & 1;
}

- (void)_setContentViewConfigurationProvider:(id)a3
{
  if (self->_contentViewConfigurationProvider != a3)
  {
    if (a3)
    {
      int v4 = *((_WORD *)&self->_tableCellFlags + 6) & 0xBFFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
      *((_WORD *)&self->_tableCellFlags + 6) &= ~0x4000u;
      *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v4);
    }
    uint64_t v5 = (void *)[a3 copy];
    id contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    self->_id contentViewConfigurationProvider = v5;

    [(UITableViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (id)_contentViewConfigurationProvider
{
  int v2 = _Block_copy(self->_contentViewConfigurationProvider);
  return v2;
}

- (void)_resetContentViews
{
  [(UIView *)self->_imageView removeFromSuperview];
  imageView = self->_imageView;
  self->_imageView = 0;

  [(UIView *)self->_textLabel removeFromSuperview];
  textLabel = self->_textLabel;
  self->_textLabel = 0;

  [(UIView *)self->_detailTextLabel removeFromSuperview];
  detailTextLabel = self->_detailTextLabel;
  self->_detailTextLabel = 0;

  [(UITextField *)self->_editableTextField removeFromSuperview];
  editableTextField = self->_editableTextField;
  self->_editableTextField = 0;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

uint64_t __54__UITableViewCell_setSelectedBackgroundView_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  int v2 = *(void **)(*(void *)(a1 + 40) + 568);
  return [v2 setAlpha:1.0];
}

uint64_t __54__UITableViewCell_setSelectedBackgroundView_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (id)_forSpringBoardDefaultSelectedBackgroundView
{
  return self->_selectedBackgroundView;
}

- (void)_forSpringBoardSetDefaultSelectedBackgroundView:(id)a3
{
  id v4 = a3;
  if (v4 && !self->_selectedBackgroundView)
  {
    id v13 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v13;
      int v6 = [v5 effect];
      int v7 = [[UIVisualEffectView alloc] initWithEffect:v6];
      int v8 = [v5 contentView];
      id v9 = [v8 backgroundColor];

      if (v9)
      {
        id v10 = [(UIVisualEffectView *)v7 contentView];
        [v10 setBackgroundColor:v9];
      }
    }
    else
    {
      uint64_t v11 = [UIView alloc];
      int v7 = -[UIView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    int v12 = [v13 backgroundColor];
    [(UIView *)v7 setBackgroundColor:v12];

    [(UITableViewCell *)self setSelectedBackgroundView:v7];
    id v4 = v13;
  }
}

uint64_t __46__UITableViewCell__setDefaultBackgroundColor___block_invoke(uint64_t a1)
{
  int v2 = *(_WORD **)(a1 + 32);
  __int16 v3 = v2[210];
  uint64_t result = [v2 setBackgroundColor:*(void *)(a1 + 40)];
  int v6 = *(unsigned __int16 *)(*(void *)(a1 + 32) + 420);
  uint64_t v5 = *(void *)(a1 + 32) + 420;
  unsigned int v7 = v6 & 0xFFFFFF7F | (*(unsigned __int8 *)(*(void *)(a1 + 32) + 422) << 16);
  *(_WORD *)uint64_t v5 = v6 & 0xFF7F | v3 & 0x80;
  *(unsigned char *)(v5 + 2) = BYTE2(v7);
  return result;
}

- (id)separatorColor
{
  return self->_separatorColor;
}

- (id)sectionBorderColor
{
  return self->_sectionBorderColor;
}

- (void)prepareForReuse
{
  [(UITableViewCell *)self _setDrawsTopSeparator:0];
  [(UIView *)self alpha];
  if (v3 != 1.0) {
    [(UIView *)self setAlpha:1.0];
  }
  [(UITableViewCell *)self _resetSelectionTimer];
  [(UITableViewCell *)self _resetEditControlRotation];
  *(_DWORD *)&self->_tableCellFlags &= ~1u;
  *(void *)((char *)&self->_tableCellFlags + 4) &= ~0x200uLL;
  [(UITableViewCell *)self _setSwiped:0];
  [(UITableViewCell *)self _setSwipeContainerView:0];
  *(_DWORD *)&self->_int tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xC7FFFFFF | 0x20000000;
  unsigned int v4 = ((*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16) | 0x40000u) >> 16;
  *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
  *((unsigned char *)&self->_tableCellFlags + 14) = v4;
  [(UITableViewCell *)self setSelected:0];
  [(UITableViewCell *)self setHighlighted:0];
  [(UITableViewCell *)self _setShowingCompactContextMenu:0];
  [(UITableViewCell *)self _setReordering:0];
  [(UITableViewCell *)self _setDragState:0];
  [(UITableViewCell *)self _setDropState:0];
  [(UITableViewCell *)self setUserInteractionEnabledWhileDragging:0];
  *(void *)((char *)&self->_tableCellFlags + 4) &= 0xFCFFFFFFFFFFFFFFLL;
  [(UIView *)self _removeAllAnimations:1];
  [(UITableViewCell *)self _updateHighlightColors];
  [(UITableViewCell *)self _resetRawLayoutMargins];
  if ([(UIView *)self isHidden]) {
    [(UIView *)self setHidden:0];
  }
  [(UIView *)self->_selectedOverlayView removeFromSuperview];
  selectedOverlayView = self->_selectedOverlayView;
  self->_selectedOverlayView = 0;

  if (![(UITableViewCell *)self _usesModernAccessoriesLayout])
  {
    int v6 = [(UITableViewCell *)self _existingSystemAccessoryView:0];
    [v6 _setHiddenForReuse:1];

    unsigned int v7 = [(UITableViewCell *)self _existingSystemAccessoryView:1];
    [v7 _setHiddenForReuse:1];
  }
  [self->_layoutManager prepareCellForReuse:self];
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFFF7FFF5FFFF7FFLL | 0x800020000800;
  [(UITableViewCell *)self _notifyIsDisplaying:0];
  [(UITableViewCell *)self setNeedsUpdateConfiguration];
  id v8 = [(UIView *)self layer];
  [v8 clearHasBeenCommitted];
}

- (void)_saveOpaqueViewState:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = (UIView *)a3;
  if ([(UITableViewCell *)self _changesOpaqueStateOfSubviews])
  {
    if ([(UITableViewCell *)self _shouldChangeOpaqueStateOfView:v4])
    {
      uint64_t v5 = objc_alloc_init(UITableViewCellUnhighlightedState);
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          && ((*(_DWORD *)&self->_tableCellFlags & 0x7100) != 0x3100 || self->_multipleSelectionBackgroundView))
        {
          [(UITableViewCellUnhighlightedState *)v5 setHighlighted:[(UIView *)v4 isHighlighted]];
        }
      }
      [(UITableViewCellUnhighlightedState *)v5 setOpaque:[(UIView *)v4 isOpaque]];
      int v6 = [(UIView *)v4 backgroundColor];
      [(UITableViewCellUnhighlightedState *)v5 setBackgroundColor:v6];

      unhighlightedStates = self->_unhighlightedStates;
      if (!unhighlightedStates)
      {
        self->_unhighlightedStates = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
        [(UIView *)self _setMonitorsSubtree:1];
        unhighlightedStates = self->_unhighlightedStates;
      }
      CFDictionaryAddValue(unhighlightedStates, v4, v5);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && self->_selectedBackgroundView != v4)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = [(UIView *)v4 subviews];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            [(UITableViewCell *)self _saveOpaqueViewState:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)_clearOpaqueViewState:(id)a3
{
  id v4 = a3;
  unhighlightedStates = self->_unhighlightedStates;
  if (unhighlightedStates)
  {
    kedouble y = v4;
    int v6 = CFDictionaryGetValue(unhighlightedStates, v4);
    unsigned int v7 = v6;
    if (v6)
    {
      objc_msgSend(key, "setOpaque:", objc_msgSend(v6, "opaque"));
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          objc_msgSend(key, "setHighlighted:", objc_msgSend(v7, "highlighted"));
        }
      }
      id v8 = [v7 backgroundColor];
      [key setBackgroundColor:v8];

      CFDictionaryRemoveValue(self->_unhighlightedStates, key);
    }

    id v4 = key;
  }
}

- (id)_multiselectBackgroundColor
{
  double v3 = [(UITableViewCell *)self _constants];
  id v4 = [(UITableViewCell *)self _tableView];
  uint64_t v5 = [v3 defaultMultiSelectBackgroundColorForCell:self inTableView:v4];

  return v5;
}

- (BOOL)_ignoresMultipleSelectionDuringEditing
{
  return ((unint64_t)*((unsigned __int16 *)&self->_tableCellFlags + 6) >> 2) & 1;
}

- (void)_setIgnoresMultipleSelectionDuringEditing:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFFFB | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  if (a3) {
    __int16 v4 = 4;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6) & 0xFFFB | v4;
  *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v3);
}

- (void)_setOpaque:(BOOL)a3 forSubview:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = (UIView *)a4;
  if (![(UITableViewCell *)self _changesOpaqueStateOfSubviews]) {
    goto LABEL_38;
  }
  if (v4)
  {
    unhighlightedStates = self->_unhighlightedStates;
    if (!unhighlightedStates) {
      goto LABEL_38;
    }
    id v8 = CFDictionaryGetValue(unhighlightedStates, v6);
    if (v8 && [(UITableViewCell *)self _shouldChangeOpaqueStateOfView:v6])
    {
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          && ((*(_DWORD *)&self->_tableCellFlags & 0x7100) != 0x3100 || self->_multipleSelectionBackgroundView))
        {
          -[UIView setHighlighted:](v6, "setHighlighted:", [v8 highlighted]);
        }
      }
      -[UIView setOpaque:](v6, "setOpaque:", [v8 opaque]);
      uint64_t v9 = [v8 backgroundColor];
      [(UIView *)v6 setBackgroundColor:v9];
    }
LABEL_27:

    goto LABEL_28;
  }
  if ([(UITableViewCell *)self _shouldChangeOpaqueStateOfView:v6])
  {
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        && ((*(_DWORD *)&self->_tableCellFlags & 0x7100) != 0x3100 || self->_multipleSelectionBackgroundView))
      {
        uint64_t v10 = CFDictionaryGetValue(self->_unhighlightedStates, v6);
        uint64_t v11 = v10;
        if (v10) {
          uint64_t v12 = [v10 highlighted];
        }
        else {
          uint64_t v12 = 0;
        }
        [(UIView *)v6 setHighlighted:v12];
      }
    }
    if ((*(_DWORD *)&self->_tableCellFlags & 0x7100) == 0x3100 && !self->_multipleSelectionBackgroundView)
    {
      if (![(UIView *)v6 isOpaque]) {
        goto LABEL_28;
      }
      uint64_t v13 = [(UITableViewCell *)self _multiselectBackgroundColor];
    }
    else
    {
      [(UIView *)v6 setOpaque:0];
      uint64_t v13 = +[UIColor clearColor];
    }
    id v8 = (void *)v13;
    [(UIView *)v6 setBackgroundColor:v13];
    goto LABEL_27;
  }
LABEL_28:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && self->_selectedBackgroundView != v6)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v14 = [(UIView *)v6 subviews];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [(UITableViewCell *)self _setOpaque:v4 forSubview:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
LABEL_38:
}

- (UITableViewCellSelectionStyle)selectionStyle
{
  return ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 4) & 7;
}

- (void)setSelectionTintColor:(id)a3
{
}

- (id)selectionTintColor
{
  return self->_selectionTintColor;
}

- (BOOL)_hasCustomSelectionAction
{
  int v2 = [(UITableViewCell *)self _effectivePopupMenuButton];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_performCustomSelectionAction
{
  int v2 = [(UITableViewCell *)self _effectivePopupMenuButton];
  if (v2)
  {
    id v3 = v2;
    [v2 performPrimaryAction];
    int v2 = v3;
  }
}

- (void)_setShowingCompactContextMenu:(BOOL)a3
{
  if (((((*((unsigned char *)&self->_tableCellFlags + 1) & 8) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    [(UITableViewCell *)self _prepareForConfigurationStateUpdate];
    if (v3) {
      int v5 = 2048;
    }
    else {
      int v5 = 0;
    }
    *(_DWORD *)&self->_int tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFFFFF7FF | v5;
    [(UITableViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (CGRect)backgroundRectForBounds:(CGRect)a3
{
  BOOL v4 = [(UITableViewCell *)self layoutManager];
  objc_msgSend(v4, "backgroundEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
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

- (CGRect)contentRectForBounds:(CGRect)a3
{
  BOOL v4 = [(UITableViewCell *)self layoutManager];
  objc_msgSend(v4, "contentEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
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

- (CGRect)textRectForContentRect:(CGRect)a3
{
  BOOL v4 = [(UITableViewCell *)self layoutManager];
  [(UIView *)self bounds];
  [v4 textRectForCell:self rowWidth:0 forSizing:CGRectGetWidth(v17)];
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

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  BOOL v4 = [(UITableViewCell *)self layoutManager];
  [v4 standardLayoutImageViewFrameForCell:self forSizing:0];
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

- (CGRect)accessoryRectForBounds:(CGRect)a3
{
  BOOL v4 = [(UITableViewCell *)self layoutManager];
  objc_msgSend(v4, "accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", self, -[UITableViewCell isEditing](self, "isEditing"), *(_DWORD *)&self->_tableCellFlags & 1);
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

- (CGRect)reorderRectForBounds:(CGRect)a3
{
  BOOL v4 = [(UITableViewCell *)self layoutManager];
  objc_msgSend(v4, "reorderControlEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", self, -[UITableViewCell isEditing](self, "isEditing"), *(_DWORD *)&self->_tableCellFlags & 1);
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

- (void)dragStateDidChange:(UITableViewCellDragState)dragState
{
  if (dragState != UITableViewCellDragStateLifting)
  {
    if (dragState == UITableViewCellDragStateDragging)
    {
      constants = self->_constants;
      double v5 = [(UITableViewCell *)self _tableView];
      [(UITableConstants *)constants defaultAlphaForDraggingCell:self inTableView:v5];
      -[UIView setAlpha:](self, "setAlpha:");
    }
    dragState = UITableViewCellDragStateNone;
  }
  [(UITableViewCell *)self _setDragging:dragState];
}

- (void)_updateUserInteractionEnabledForNewDragState:(int64_t)a3
{
  BOOL v5 = [(UITableViewCell *)self userInteractionEnabledWhileDragging];
  BOOL v6 = v5;
  if (a3 == 2)
  {
    if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x300000000000000) == 0)
    {
      BOOL v11 = [(UIView *)self isUserInteractionEnabled];
      uint64_t v12 = 0x100000000000000;
      if (v11) {
        uint64_t v12 = 0x200000000000000;
      }
      *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFCFFFFFFFFFFFFFFLL | v12;
      [(UITableViewCell *)self setUserInteractionEnabled:v6];
    }
  }
  else if (!a3)
  {
    uint64_t v7 = *(void *)((char *)&self->_tableCellFlags + 4);
    BOOL v8 = (v7 & 0x300000000000000) == 0x200000000000000 && !v5;
    BOOL v9 = (v7 & 0x300000000000000) == 0x100000000000000 && v5;
    if (v8 || v9)
    {
      -[UITableViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
      int v10 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
      uint64_t v7 = *(void *)((char *)&self->_tableCellFlags + 4);
    }
    else
    {
      int v10 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    }
    *(void *)((char *)&self->_tableCellFlags + 4) = v7 & 0xFCFFFFFFFFFFFFFFLL;
    *((_WORD *)&self->_tableCellFlags + 6) = v10;
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v10);
  }
}

- (BOOL)_isDragging
{
  return self->_dragState == 1;
}

- (BOOL)_isDropTarget
{
  return self->_dropState == 2;
}

- (void)_setDropState:(int64_t)a3
{
  if (self->_dropState != a3)
  {
    [(UITableViewCell *)self _prepareForConfigurationStateUpdate];
    self->_dropState = a3;
    [(UITableViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)setUserInteractionEnabledWhileDragging:(BOOL)userInteractionEnabledWhileDragging
{
  uint64_t v3 = 0x80000000000000;
  if (!userInteractionEnabledWhileDragging) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)userInteractionEnabledWhileDragging
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 55) & 1;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIView *)self isUserInteractionEnabled];
  if (v5 != v3) {
    [(UITableViewCell *)self _prepareForConfigurationStateUpdate];
  }
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCell;
  [(UIView *)&v6 setUserInteractionEnabled:v3];
  if (v5 != [(UIView *)self isUserInteractionEnabled]) {
    [(UITableViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)_updateShowingSelectedBackground
{
  if (self->_selectedBackgroundView || self->_multipleSelectionBackgroundView)
  {
    BOOL v3 = [(UITableViewCell *)self _shouldUseHighlightedOrSelectedAppearance];
    [(UITableViewCell *)self showSelectedBackgroundView:v3 animated:0];
  }
  else
  {
    [(UITableViewCell *)self _updateCellForCurrentBackgroundConfiguration];
  }
}

- (void)showSelectedBackgroundView:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  p_int tableCellFlags = &self->_tableCellFlags;
  if ((*(_DWORD *)&self->_tableCellFlags & 0x100) != 0)
  {
    if ((*(_DWORD *)&self->_tableCellFlags & 0x7000) == 0x3000)
    {
      BOOL v8 = 1;
    }
    else
    {
      BOOL v9 = [(UITableViewCell *)self _tableView];
      if ([v9 allowsMultipleSelectionDuringEditing]) {
        BOOL v8 = (*((_WORD *)p_tableCellFlags + 6) & 4) == 0;
      }
      else {
        BOOL v8 = 0;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  uint64_t v10 = [(UITableViewCell *)self _selectedBackgroundView:0];
  BOOL v11 = (void *)v10;
  if (v5 && v10)
  {
    if (objc_opt_respondsToSelector())
    {
      [v11 setMultiselect:v8];
      uint64_t v12 = [(UITableViewCell *)self _multiselectBackgroundColor];
      [v11 setMultiselectBackgroundColor:v12];
    }
    [(UIView *)self insertSubview:v11 atIndex:0];
    if (!v8)
    {
      [(UITableViewCell *)self _applySelectedStateToSeparators:1];
      double v13 = [(UITableViewCell *)self _tableView];
      [v13 _cellDidShowSelectedBackground:self];
    }
    if (self->_backgroundView) {
      -[UITableViewCell sendSubviewToBack:](self, "sendSubviewToBack:");
    }
    if ((*(void *)((char *)p_tableCellFlags + 4) & 0x1000) != 0 && !self->_selectedOverlayView)
    {
      double v14 = [UITableViewCellContentMirror alloc];
      [(UIView *)self bounds];
      double v15 = -[UITableViewCellContentMirror initWithFrame:](v14, "initWithFrame:");
      selectedOverlayView = self->_selectedOverlayView;
      self->_selectedOverlayView = v15;

      [(UIView *)self addSubview:self->_selectedOverlayView];
    }
    if (v4) {
      goto LABEL_21;
    }
  }
  else
  {
    [(UITableViewCell *)self _applySelectedStateToSeparators:0];
    long long v22 = [(UITableViewCell *)self _tableView];
    [v22 _cellDidHideSelectedBackground:self];

    if (v4)
    {
LABEL_21:
      [v11 setAlpha:(double)!v5];
      [(UITableViewCell *)self _layoutSystemBackgroundView:1];
      [(UITableViewCell *)self selectionFadeDuration];
      double v18 = v17;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __55__UITableViewCell_showSelectedBackgroundView_animated___block_invoke;
      v26[3] = &unk_1E52DC3D0;
      BOOL v29 = v5;
      id v27 = v11;
      uint64_t v28 = self;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __55__UITableViewCell_showSelectedBackgroundView_animated___block_invoke_2;
      v24[3] = &unk_1E52E0478;
      BOOL v25 = v5;
      void v24[4] = self;
      +[UIView animateWithDuration:0 delay:v26 options:v24 animations:v18 completion:0.0];
      *(void *)((char *)p_tableCellFlags + 4) |= 0x8000000uLL;
      if (v5) {
        [(UITableViewCell *)self _updateAndCacheBackgroundColorForHighlightIgnoringSelection:0];
      }
      [(UITableViewCell *)self selectionFadeDuration];
      double v20 = v19 * 0.5 * UIAnimationDragCoefficient();
      long long v21 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C4B0]];
      [(UITableViewCell *)self performSelector:sel__updateHighlightColorsForAnimationHalfwayPoint withObject:0 afterDelay:v21 inModes:v20];

      goto LABEL_31;
    }
  }
  if (v5)
  {
    [v11 setAlpha:1.0];
    [(UIView *)self->_selectedOverlayView setSelected:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIView *)self->_backgroundView setAlpha:1.0];
    }
    [v11 removeFromSuperview];
    [(UIView *)self->_selectedOverlayView removeFromSuperview];
    long long v23 = self->_selectedOverlayView;
    self->_selectedOverlayView = 0;
  }
  [(UITableViewCell *)self _updateAndCacheBackgroundColorForHighlightIgnoringSelection:0];
  [(UITableViewCell *)self _updateHighlightColors];
LABEL_31:
}

uint64_t __55__UITableViewCell_showSelectedBackgroundView_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 48);
  [*(id *)(a1 + 32) setAlpha:(double)*(unint64_t *)&a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = 0.0;
    if (!*(unsigned char *)(a1 + 48)) {
      double v3 = 1.0;
    }
    [*(id *)(*(void *)(a1 + 40) + 560) setAlpha:v3];
  }
  BOOL v4 = *(void **)(a1 + 40);
  return [v4 _performConfigurationStateUpdate];
}

uint64_t __55__UITableViewCell_showSelectedBackgroundView_animated___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _deselectAnimationFinished];
  }
  return result;
}

- (void)_cancelInternalPerformRequests
{
  double v3 = objc_opt_class();
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel__updateHighlightColorsForAnimationHalfwayPoint object:0];
}

- (void)_performConfigurationStateModifications:(id)a3
{
  double v3 = (unsigned __int16 *)&self->_tableCellFlags + 6;
  int v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
  *((unsigned char *)&self->_tableCellFlags + 14) = (v4 | 0x200000u) >> 16;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  int v5 = *v3;
  unsigned int v6 = (v5 | (*((unsigned __int8 *)v3 + 2) << 16)) & 0xFFDFFFFF;
  unsigned __int16 *v3 = v5;
  *((unsigned char *)v3 + 2) = (v6 | v4 & 0x200000) >> 16;
}

- (void)_deselectAnimationFinished
{
  p_int tableCellFlags = &self->_tableCellFlags;
  *(void *)((char *)&self->_tableCellFlags + 4) &= ~0x8000000uLL;
  if (![(UITableViewCell *)self _shouldUseHighlightedOrSelectedAppearance])
  {
    int v4 = [(UITableViewCell *)self _selectedBackgroundView:0];
    [v4 removeFromSuperview];

    if ((*(void *)((char *)p_tableCellFlags + 4) & 0x1000) != 0)
    {
      [(UIView *)self->_selectedOverlayView removeFromSuperview];
      selectedOverlayView = self->_selectedOverlayView;
      self->_selectedOverlayView = 0;
    }
    [(UITableViewCell *)self _updateHighlightColors];
  }
}

- (void)_delayedDeselect
{
  [(UITableViewCell *)self setSelected:0 animated:0];
  deselectTimer = self->_deselectTimer;
  self->_deselectTimer = 0;
}

- (BOOL)isAtLeastHalfSelected
{
  return *(unsigned char *)&self->_tableCellFlags >> 7;
}

- (float)selectionPercent
{
  float result = 1.0;
  if ((*(unsigned char *)&self->_tableCellFlags & 0x80) == 0) {
    return 0.0;
  }
  return result;
}

- (void)_updateHighlightColors
{
  BOOL v3 = [(UITableViewCell *)self _shouldUseHighlightedOrSelectedAppearance];
  [(UITableViewCell *)self _updateHighlightColorsForView:self highlighted:v3];
  int v4 = [(UITableViewCell *)self _tableView];
  [v4 _tableStyle];

  if (!v3 && self->_unhighlightedStates)
  {
    [(UIView *)self _setMonitorsSubtree:0];
    [(UITableViewCell *)self _setOpaque:1 forSubview:self];
    CFRelease(self->_unhighlightedStates);
    self->_unhighlightedStates = 0;
  }
  [(UIView *)self setNeedsLayout];
}

- (void)_macSidebarDefaultIconSizeChanged
{
  [(UITableViewCell *)self _updateDefaultImageSymbolConfiguration];
  [(UITableViewCell *)self setNeedsUpdateConfiguration];
}

- (BOOL)_backgroundFillIsCustomized
{
  if ((*(unsigned char *)&self->_tableCellFlags & 0x70) == 0) {
    goto LABEL_4;
  }
  int v2 = self;
  selectedBackgroundView = self->_selectedBackgroundView;
  if (selectedBackgroundView)
  {
    if (![(UIView *)selectedBackgroundView isHidden])
    {
      [(UIView *)v2->_selectedBackgroundView alpha];
      LOBYTE(v2) = v8 > 0.0;
      return (char)v2;
    }
    goto LABEL_4;
  }
  if (![(UITableViewCell *)v2 isHighlighted]
    && ![(UITableViewCell *)v2 isSelected]
    && ![(UIView *)v2 isFocused])
  {
LABEL_4:
    LOBYTE(v2) = 0;
    return (char)v2;
  }
  int v4 = [(_UISystemBackgroundView *)v2->_systemBackgroundView configuration];
  int v5 = v4;
  if (v4 && [v4 _hasBackgroundFill])
  {
    lastNormalBackgroundViewConfiguration = v2->_lastNormalBackgroundViewConfiguration;
    uint64_t v7 = [(UIView *)v2 tintColor];
    LODWORD(v2) = [v5 _backgroundFillIsEqual:lastNormalBackgroundViewConfiguration withTintColor:v7] ^ 1;
  }
  else
  {
    LOBYTE(v2) = 0;
  }

  return (char)v2;
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
    double v4 = (char *)&self->_tableCellFlags + 4;
    uint64_t v5 = *(void *)((char *)&self->_tableCellFlags + 4);
    int v6 = *((unsigned __int16 *)&self->_tableCellFlags + 6);
    int v7 = v6 | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    if ((backgroundViewConfigurationProvider == 0) != ((v6 & 0x8000) == 0)) {
      return;
    }
    if (!backgroundViewConfigurationProvider)
    {
      *(void *)double v4 = v5;
      *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v7);
      *((_WORD *)&self->_tableCellFlags + 6) = v7 | 0x8000;
      [(UITableViewCell *)self setNeedsUpdateConfiguration];
      return;
    }
  }
  else
  {
    double v4 = (char *)&self->_tableCellFlags + 4;
    uint64_t v5 = *(void *)((char *)&self->_tableCellFlags + 4);
    int v8 = *((unsigned __int16 *)&self->_tableCellFlags + 6);
    int v7 = v8 | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    if ((v8 & 0x8000) == 0) {
      return;
    }
  }
  *(void *)double v4 = v5;
  v4[10] = BYTE2(v7);
  *((_WORD *)v4 + 4) = v7 & 0x7FFF;
}

- (BOOL)automaticallyUpdatesBackgroundConfiguration
{
  return (unint64_t)*((unsigned __int16 *)&self->_tableCellFlags + 6) >> 15;
}

- (id)_backgroundViewConfigurationProvider
{
  int v2 = _Block_copy(self->_backgroundViewConfigurationProvider);
  return v2;
}

- (void)setConfigurationUpdateHandler:(UITableViewCellConfigurationUpdateHandler)configurationUpdateHandler
{
  if (self->_configurationUpdateHandler != configurationUpdateHandler)
  {
    double v4 = (void *)[configurationUpdateHandler copy];
    id v5 = self->_configurationUpdateHandler;
    self->_configurationUpdateHandler = v4;

    [(UITableViewCell *)self setNeedsUpdateConfiguration];
  }
}

uint64_t __54__UITableViewCell__prepareForConfigurationStateUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performConfigurationStateUpdate];
}

- (void)_updateSystemTypeAccessoryView:(id)a3 withTableViewAccessoryType:(int64_t)a4 forState:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  uint64_t v9 = 0;
  switch(a4)
  {
    case 0:
      goto LABEL_7;
    case 1:
    case 2:
      goto LABEL_6;
    case 3:
      uint64_t v9 = 1;
      goto LABEL_6;
    case 4:
      uint64_t v9 = 9;
      goto LABEL_6;
    case 5:
    case 6:
    case 7:
    case 8:
      uint64_t v9 = 6;
      goto LABEL_6;
    default:
      uint64_t v9 = -1;
LABEL_6:
      [(UITableViewCell *)self _updateSystemTypeAccessoryView:v10 withCellAccessoryType:v9 forState:v8];
LABEL_7:

      return;
  }
}

- (id)selectedOverlayView
{
  return self->_selectedOverlayView;
}

- (UITableViewCellEditingStyle)editingStyle
{
  return ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 12) & 7;
}

- (void)setShowsReorderControl:(BOOL)showsReorderControl
{
  p_int tableCellFlags = &self->_tableCellFlags;
  if (((((*((unsigned char *)&self->_tableCellFlags + 2) & 0x20) == 0) ^ showsReorderControl) & 1) == 0)
  {
    -[UITableViewCell _setShowsReorderControl:](self, "_setShowsReorderControl:");
    if ((*((unsigned char *)p_tableCellFlags + 1) & 1) != 0
      || (*(void *)((char *)p_tableCellFlags + 4) & 0x400000000000) != 0)
    {
      [(UIView *)self setNeedsLayout];
    }
  }
}

- (BOOL)showsReorderControl
{
  return (*((unsigned __int8 *)&self->_tableCellFlags + 2) >> 5) & 1;
}

- (void)setShouldIndentWhileEditing:(BOOL)shouldIndentWhileEditing
{
  p_int tableCellFlags = &self->_tableCellFlags;
  if (((((*(void *)((char *)&self->_tableCellFlags + 4) & 0x20) == 0) ^ shouldIndentWhileEditing) & 1) == 0)
  {
    -[UITableViewCell _setShouldIndentWhileEditing:](self, "_setShouldIndentWhileEditing:");
    if (*((unsigned char *)p_tableCellFlags + 1))
    {
      [(UITableViewCell *)self setEditing:1 animated:0];
      [(UIView *)self setNeedsLayout];
    }
  }
}

- (BOOL)shouldIndentWhileEditing
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 5) & 1;
}

- (void)_syncAccessoryViewsIfNecessary
{
  accessoryView = self->_accessoryView;
  editingAccessoryView = self->_editingAccessoryView;
  if ((((*(_DWORD *)&self->_tableCellFlags >> 15) ^ (*(_DWORD *)&self->_tableCellFlags >> 18)) & 7) != 0)
  {
    if (accessoryView != editingAccessoryView) {
      return;
    }
    if ([(UITableViewCell *)self isEditing])
    {
      id v5 = self->_accessoryView;
      self->_accessoryView = 0;
    }
    else
    {
      id v5 = self->_editingAccessoryView;
      self->_editingAccessoryView = 0;
    }
  }
  else
  {
    if (accessoryView == editingAccessoryView) {
      return;
    }
    if ([(UITableViewCell *)self isEditing])
    {
      [(UIView *)self->_accessoryView removeFromSuperview];
      int v6 = self->_editingAccessoryView;
      id v5 = self->_accessoryView;
      self->_accessoryView = v6;
    }
    else
    {
      [(UIView *)self->_editingAccessoryView removeFromSuperview];
      int v7 = self->_accessoryView;
      id v5 = self->_editingAccessoryView;
      self->_editingAccessoryView = v7;
    }
  }
}

- (void)_setAccessoryTintColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_accessoryTintColor != v5)
  {
    unint64_t v6 = ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 15) & 7;
    int v7 = v5;
    [(UITableViewCell *)self setAccessoryType:0];
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    [(UITableViewCell *)self setAccessoryType:v6];
    id v5 = v7;
  }
}

- (id)_accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (UITableViewCellAccessoryType)editingAccessoryType
{
  return ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 18) & 7;
}

- (void)setEditingAccessoryView:(UIView *)editingAccessoryView
{
  id v5 = editingAccessoryView;
  p_customEditingAccessoryView = &self->_customEditingAccessoryView;
  if (self->_customEditingAccessoryView != v5)
  {
    id v8 = v5;
    if ([(UITableViewCell *)self _usesModernAccessoriesLayout])
    {
      objc_storeStrong((id *)&self->_customEditingAccessoryView, editingAccessoryView);
      [(UITableViewCell *)self _setNeedsAccessoriesUpdate];
LABEL_8:
      id v5 = v8;
      goto LABEL_9;
    }
    [(UIView *)*p_customEditingAccessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_customEditingAccessoryView, editingAccessoryView);
    if (*p_customEditingAccessoryView)
    {
      [(UIView *)self->_editingAccessoryView removeFromSuperview];
      int v7 = self->_editingAccessoryView;
      self->_editingAccessoryView = 0;
    }
    id v5 = v8;
    if (*((unsigned char *)&self->_tableCellFlags + 1))
    {
      [(UIView *)self setNeedsLayout];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (UIView)editingAccessoryView
{
  return self->_customEditingAccessoryView;
}

- (BOOL)hidesAccessoryWhenEditing
{
  return 1;
}

- (void)setIndentationLevel:(NSInteger)indentationLevel
{
  if (self->_indentationLevel != indentationLevel)
  {
    self->_int64_t indentationLevel = indentationLevel;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setIndentationWidth:(CGFloat)indentationWidth
{
  *((_WORD *)&self->_tableCellFlags + 6) |= 0x2000u;
  [(UITableViewCell *)self _setIndentationWidth:indentationWidth];
}

- (BOOL)clipsContents
{
  return 1;
}

- (double)selectionFadeDuration
{
  return self->_selectionFadeDuration;
}

- (void)setEditing:(BOOL)editing
{
}

uint64_t __76__UITableViewCell__setEditing_animated_cellOrAncestorViewForAnimatedLayout___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) willTransitionToState:*(void *)(a1 + 40)];
}

uint64_t __76__UITableViewCell__setEditing_animated_cellOrAncestorViewForAnimatedLayout___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _prepareForConfigurationStateUpdate];
  *(_DWORD *)(*(void *)(a1 + 32) + 408) = *(_DWORD *)(*(void *)(a1 + 32) + 408) & 0xFFFFFEFF | (*(unsigned __int8 *)(a1 + 48) << 8);
  BOOL v2 = *(unsigned char *)(a1 + 48) && ([*(id *)(a1 + 32) wasSwiped] & 1) != 0;
  [*(id *)(a1 + 32) setShowingDeleteConfirmation:v2];
  [*(id *)(a1 + 32) setNeedsUpdateConfiguration];
  BOOL v3 = *(void **)(a1 + 40);
  if (v3 != *(void **)(a1 + 32))
  {
    [*(id *)(a1 + 32) setNeedsLayout];
    BOOL v3 = *(void **)(a1 + 40);
  }
  [v3 setNeedsLayout];
  double v4 = *(void **)(a1 + 40);
  return [v4 layoutBelowIfNeeded];
}

uint64_t __76__UITableViewCell__setEditing_animated_cellOrAncestorViewForAnimatedLayout___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) didTransitionToState:*(void *)(a1 + 40)];
  *(void *)(*(void *)(a1 + 32) + 412) &= ~0x200000000uLL;
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _updateContentClip];
}

- (void)setShowingDeleteConfirmation:(BOOL)a3
{
  int tableCellFlags = (int)self->_tableCellFlags;
  if (((((tableCellFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    if ((tableCellFlags & 0x100) != 0)
    {
      uint64_t v4 = 2;
      if (!a3) {
        uint64_t v4 = 0;
      }
      [(UITableViewCell *)self willTransitionToState:v4 | ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x200) == 0)];
    }
    else
    {
      *(_DWORD *)&self->_int tableCellFlags = tableCellFlags & 0xFFFFFFFE | a3;
      [(UIView *)self setNeedsLayout];
    }
  }
}

- (BOOL)showingDeleteConfirmation
{
  return *(_DWORD *)&self->_tableCellFlags & 1;
}

- (void)_setContainerView:(id)a3
{
  id v20 = a3;
  id v4 = [(UITableViewCell *)self _containerView];
  if (v4 != v20)
  {
    if (v4)
    {
      [(UITableViewCell *)self frame];
      double v6 = v5;
      double v8 = v7;
      [v4 frame];
      double v10 = v9;
      double v12 = v11;
      double v13 = [v4 superview];
      [(UITableViewCell *)self _removeFromSuperviewIgnoringFirstResponder:1];
      [v13 insertSubview:self aboveSubview:v4];
      -[UITableViewCell _setFrame:skipLayout:](self, "_setFrame:skipLayout:", 1, v10, v12, v6, v8);
    }
    if (v20)
    {
      [(UITableViewCell *)self frame];
      double v15 = v14;
      double v17 = v16;
      objc_msgSend(v20, "setFrame:");
      [(UIView *)self _removePropertyAnimationsForLayerKeyPath:@"position"];
      -[UITableViewCell _setFrame:skipLayout:](self, "_setFrame:skipLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v15, v17);
      double v18 = [v20 superview];

      if (!v18)
      {
        double v19 = [(UIView *)self superview];
        [v19 insertSubview:v20 aboveSubview:self];
      }
      [v20 addSubview:self];
    }
  }
}

- (void)_setDropAnimationContainerView:(id)a3
{
  id v10 = a3;
  uint64_t v5 = [(UITableViewCell *)self _containerView];
  if (v5)
  {
    double v6 = (void *)v5;
    double v7 = [(UITableViewCell *)self _containerView];
    double v8 = [(UITableViewCell *)self _dropAnimationContainerView];

    if (v7 != v8)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"UITableViewCell.m" lineNumber:4950 description:@"UIKit inconsistency: Unable to add a drop animation container view while another container view is already present."];
    }
  }
  [(UITableViewCell *)self _setContainerView:v10];
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UITableViewCell *)self _dropAnimationContainerView];
  double v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setCenter:", x, y);
  }
  else
  {
    double v8 = [(UITableViewCell *)self _swipeContainerView];
    double v9 = v8;
    if (v8)
    {
      [v8 center];
      objc_msgSend(v9, "setCenter:");
      [v9 bounds];
      double y = CGRectGetMidY(v11);
    }
    v10.receiver = self;
    v10.super_class = (Class)UITableViewCell;
    -[UIView setCenter:](&v10, sel_setCenter_, x, y);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UITableViewCell;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(UITableViewCell *)self _updateAccessoryMetrics];
  }
}

- (void)_setSkipsLayout:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (void)setTarget:(id)target
{
}

- (id)target
{
  return self->_target;
}

- (void)setEditAction:(SEL)editAction
{
  if (editAction) {
    uint64_t v3 = editAction;
  }
  else {
    uint64_t v3 = 0;
  }
  self->_editAction = v3;
}

- (SEL)editAction
{
  if (self->_editAction) {
    return self->_editAction;
  }
  else {
    return 0;
  }
}

- (void)setAccessoryAction:(SEL)accessoryAction
{
  if (accessoryAction) {
    uint64_t v3 = accessoryAction;
  }
  else {
    uint64_t v3 = 0;
  }
  self->_SEL accessoryAction = v3;
}

- (SEL)accessoryAction
{
  if (self->_accessoryAction) {
    return self->_accessoryAction;
  }
  else {
    return 0;
  }
}

- (void)removeFromSuperview
{
}

- (void)_removeFromSuperviewIgnoringFirstResponder:(BOOL)a3
{
  if (a3 || (*(void *)&self->super._viewFlags & 0x10000) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)UITableViewCell;
    [(UIView *)&v3 removeFromSuperview];
  }
}

- (void)_updateCellMaskViewsForView:(id)a3 backdropView:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 _backdropMaskViewFlags]) {
    [v7 updateMaskViewsForView:v6];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v8 = objc_msgSend(v6, "subviews", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(UITableViewCell *)self _updateCellMaskViewsForView:*(void *)(*((void *)&v13 + 1) + 8 * v12++) backdropView:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_updateFloatingContentControlStateAnimated:(BOOL)a3
{
}

- (void)_updateFloatingContentControlStateInContext:(id)a3 withAnimationCoordinator:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a3;
  id v8 = a4;
  if (self->_floatingContentView)
  {
    if (v14)
    {
      uint64_t v9 = [v14 nextFocusedView];
      BOOL v10 = v9 == self;
    }
    else
    {
      BOOL v10 = [(UIView *)self isFocused];
    }
    if (v10) {
      uint64_t v11 = 8;
    }
    else {
      uint64_t v11 = 0;
    }
    if ([(UITableViewCell *)self isSelected]) {
      v11 |= 4uLL;
    }
    uint64_t v12 = v11 | [(UITableViewCell *)self isHighlighted];
    floatingContentView = self->_floatingContentView;
    if (v8) {
      [(_UIFloatingContentView *)floatingContentView setControlState:v12 withAnimationCoordinator:v8];
    }
    else {
      [(_UIFloatingContentView *)floatingContentView setControlState:v12 animated:v5];
    }
  }
}

- (void)_willTransitionToState:(unint64_t)a3
{
  id v5 = [(UITableViewCell *)self layoutManager];
  [v5 cell:self willTransitionToState:a3];
}

- (void)_didTransitionToState:(unint64_t)a3
{
  id v5 = [(UITableViewCell *)self layoutManager];
  [v5 cell:self didTransitionToState:a3];
}

- (CGRect)contentRectForState:(unint64_t)a3
{
  id v5 = [(UITableViewCell *)self layoutManager];
  [v5 contentRectForCell:self forState:a3];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(UITableViewCell *)self _tableView];

  if (v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)UITableViewCell;
    [(UIResponder *)&v16 touchesBegan:v6 withEvent:v7];
  }
  else
  {
    double v9 = [v7 _firstTouchForView:self];

    if (v9)
    {
      [v9 locationInView:self];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      double v14 = [(UITableViewCell *)self layoutManager];
      objc_msgSend(v14, "backgroundEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
      v17.double x = v11;
      v17.double y = v13;
      BOOL v15 = CGRectContainsPoint(v18, v17);

      if (v15) {
        [(UITableViewCell *)self setSelected:1];
      }
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(UITableViewCell *)self _tableView];

  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)UITableViewCell;
    [(UIResponder *)&v15 touchesMoved:v6 withEvent:v7];
  }
  else
  {
    double v9 = [v7 _firstTouchForView:self];

    if (v9)
    {
      [v9 locationInView:self];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      double v14 = [(UITableViewCell *)self layoutManager];
      objc_msgSend(v14, "backgroundEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
      v16.double x = v11;
      v16.double y = v13;
      [(UITableViewCell *)self setSelected:CGRectContainsPoint(v17, v16)];
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(UITableViewCell *)self _tableView];

  if (v8)
  {
    v10.receiver = self;
    v10.super_class = (Class)UITableViewCell;
    [(UIResponder *)&v10 touchesEnded:v6 withEvent:v7];
  }
  else
  {
    double v9 = [v7 _firstTouchForView:self];

    if (v9) {
      [(UITableViewCell *)self setSelected:0];
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(UITableViewCell *)self _tableView];

  if (v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)UITableViewCell;
    [(UIResponder *)&v9 touchesCancelled:v6 withEvent:v7];
  }
  else
  {
    [(UITableViewCell *)self setSelected:0];
  }
}

- (void)setSectionLocation:(int)a3
{
}

- (BOOL)canBecomeFirstResponder
{
  if (_UIDeviceHasExternalTouchInput()
    || (v5.receiver = self,
        v5.super_class = (Class)UITableViewCell,
        BOOL v3 = [(UIResponder *)&v5 canBecomeFirstResponder]))
  {
    LOBYTE(v3) = ![(UIView *)self isHidden];
  }
  return v3;
}

- (void)_performAction:(SEL)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = [(UITableViewCell *)self _tableView];
  [v7 _performAction:a3 forCell:self sender:v6];
}

- (BOOL)_automaticIntrinsicContentSizeInvalidationEnabled
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16) >> 20) & 1;
}

- (id)_editableTextField:(BOOL)a3
{
  editableTextField = self->_editableTextField;
  if (editableTextField) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = !a3;
  }
  if (v4)
  {
    objc_super v5 = editableTextField;
  }
  else
  {
    objc_super v5 = [(UITableViewCell *)self _editableTextField];
  }
  return v5;
}

- (void)_setReorderControlImage:(id)a3
{
}

- (id)_reorderControlImage
{
  return objc_getAssociatedObject(self, &_UITableViewCellReorderControlImageKey);
}

- (void)_setEditingControlTintColor:(id)a3 forStyle:(int64_t)a4
{
  id v6 = a3;
  if (v6 && !self->__editingControlTintColors)
  {
    id v7 = (NSMutableDictionary *)objc_opt_new();
    editingControlTintColors = self->__editingControlTintColors;
    self->__editingControlTintColors = v7;
  }
  objc_super v9 = [NSNumber numberWithInteger:a4];
  id v10 = [(NSMutableDictionary *)self->__editingControlTintColors objectForKeyedSubscript:v9];
  id v11 = v6;
  double v12 = v11;
  CGFloat v13 = v11;
  id v17 = v11;
  if (v10 == v11) {
    goto LABEL_11;
  }
  if (!v6 || !v10)
  {

    goto LABEL_10;
  }
  char v14 = [v10 isEqual:v11];

  if ((v14 & 1) == 0)
  {
LABEL_10:
    objc_super v15 = self->__editingControlTintColors;
    CGPoint v16 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v15 setObject:v17 forKeyedSubscript:v16];

    CGFloat v13 = [(UITableViewCell *)self editingData:0];
    double v12 = [v13 editControl:0];
    [v12 _updateImageView];
LABEL_11:
  }
}

- (id)_editingControlTintColorForStyle:(int64_t)a3
{
  editingControlTintColors = self->__editingControlTintColors;
  BOOL v4 = [NSNumber numberWithInteger:a3];
  objc_super v5 = [(NSMutableDictionary *)editingControlTintColors objectForKeyedSubscript:v4];

  return v5;
}

- (void)_drawSeparatorInRect:(CGRect)a3
{
  unsigned int v3 = (*(_DWORD *)&self->_tableCellFlags >> 1) & 7;
  if (v3)
  {
    separatorColor = self->_separatorColor;
    [(UITableViewCell *)self _separatorFrame];
    if (v3 <= 2)
    {
      CGFloat v10 = v6;
      CGFloat v11 = v7;
      CGFloat v12 = v8;
      CGFloat v13 = v9;
      [(UIColor *)separatorColor set];
      UIRectFillUsingOperation(1, v10, v11, v12, v13);
    }
    unint64_t tableCellFlags = (unint64_t)self->_tableCellFlags;
    if ((tableCellFlags & 0x400000) != 0)
    {
      uint64_t v15 = (tableCellFlags >> 1) & 7;
      CGPoint v16 = self->_separatorColor;
      [(UITableViewCell *)self _topSeparatorFrame];
      if ((unint64_t)(v15 - 1) <= 1)
      {
        CGFloat v21 = v17;
        CGFloat v22 = v18;
        CGFloat v23 = v19;
        CGFloat v24 = v20;
        [(UIColor *)v16 set];
        UIRectFillUsingOperation(1, v21, v22, v23, v24);
      }
    }
  }
}

uint64_t __74__UITableViewCell__animateFloatingSeparatorForInsertion_withRowAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 664), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __68__UITableViewCell__animateInnerShadowForInsertion_withRowAnimation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 672), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v2 = *(double *)(a1 + 72);
  double v3 = *(double *)(a1 + 80);
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 680);
  double v5 = *(double *)(a1 + 88);
  double v6 = *(double *)(a1 + 96);
  return objc_msgSend(v4, "setFrame:", v2, v3, v5, v6);
}

uint64_t __68__UITableViewCell__animateInnerShadowForInsertion_withRowAnimation___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 672) setAlpha:*(double *)(a1 + 40)];
  double v2 = *(double *)(a1 + 40);
  double v3 = *(void **)(*(void *)(a1 + 32) + 680);
  return [v3 setAlpha:v2];
}

- (BOOL)_isReorderControlActive
{
  double v2 = self;
  double v3 = [(UITableViewCell *)self _tableView];
  LOBYTE(v2) = [v3 _isReorderControlActiveForCell:v2];

  return (char)v2;
}

- (BOOL)_grabberBeganReorder:(id)a3 touch:(id)a4
{
  id v5 = a4;
  double v6 = [(UITableViewCell *)self _tableView];
  LOBYTE(self) = [v6 _beginReorderingForCell:self touch:v5];

  return (char)self;
}

- (void)_grabberDragged:(id)a3 yDelta:(float)a4
{
}

- (void)_grabberDragged:(id)a3 yDelta:(float)a4 touch:(id)a5
{
  id v7 = a5;
  id v8 = [(UITableViewCell *)self _tableView];
  [v8 _draggingReorderingCell:self yDelta:v7 touch:a4];
}

- (void)_grabberReleased:(id)a3
{
  id v4 = [(UITableViewCell *)self _tableView];
  [v4 _endReorderingForCell:self wasCancelled:0 animated:1];
}

- (void)editControlWasClicked:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(_DWORD *)&self->_tableCellFlags & 0x7000) != 0x1000)
  {
    if ([(UITableViewCell *)self editingStyle] != UITableViewCellEditingStyleInsert) {
      goto LABEL_8;
    }
    id v5 = [(UITableViewCell *)self _tableView];
    [v5 _didInsertRowForTableCell:self];
    goto LABEL_6;
  }
  if ([v4 isRotated])
  {
    id v5 = [(UITableViewCell *)self _tableView];
    [v5 _swipeToDeleteCell:self];
LABEL_6:

    goto LABEL_8;
  }
  [(UITableViewCell *)self setShowingDeleteConfirmation:0];
LABEL_8:
}

- (BOOL)_isReorderable
{
  double v2 = self;
  double v3 = [(UITableViewCell *)self _tableView];
  LOBYTE(v2) = [v3 _isCellReorderable:v2];

  return (char)v2;
}

- (void)removeEditingData
{
  id editingData = self->_editingData;
  self->_id editingData = 0;

  [(UITableViewCell *)self _setNeedsAccessoriesUpdate];
}

- (void)_toggleExpansionButton
{
  double v3 = [(UITableViewCell *)self _existingSystemAccessoryView:0];
  unsigned int tableCellFlags = self->_tableCellFlags;
  int v5 = (tableCellFlags >> 15) & 7;
  switch(v5)
  {
    case 7:
      unsigned int v6 = tableCellFlags & 0xFFFC7FFF;
      uint64_t v7 = 8;
      break;
    case 6:
      uint64_t v7 = 5;
      unsigned int v6 = tableCellFlags & 0xFFFC7FFF | 0x28000;
      break;
    case 5:
      unsigned int v6 = tableCellFlags & 0xFFFC7FFF | 0x30000;
      uint64_t v7 = 6;
      break;
    default:
      goto LABEL_8;
  }
  *(_DWORD *)&self->_unsigned int tableCellFlags = v6;
  id v8 = v3;
  [(UITableViewCell *)self _updateExpansionButton:v3 forType:v7 animated:1];
  double v3 = v8;
LABEL_8:
}

- (void)_updateExpansionButton:(id)a3 forType:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  memset(&v17, 0, sizeof(v17));
  if (a4 == 8 || a4 == 6)
  {
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0) {
      CGFloat v9 = -1.57079633;
    }
    else {
      CGFloat v9 = 1.57079633;
    }
    CGAffineTransformMakeRotation(&v17, v9);
  }
  else
  {
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v17.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v17.c = v10;
    *(_OWORD *)&v17.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__UITableViewCell__updateExpansionButton_forType_animated___block_invoke;
  aBlock[3] = &unk_1E52E7948;
  id v11 = v8;
  id v15 = v11;
  CGAffineTransform v16 = v17;
  CGFloat v12 = _Block_copy(aBlock);
  CGFloat v13 = v12;
  if (v5) {
    +[UIView animateWithDuration:v12 animations:0 completion:0.333];
  }
  else {
    (*((void (**)(void *))v12 + 2))(v12);
  }
}

uint64_t __59__UITableViewCell__updateExpansionButton_forType_animated___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return [*(id *)(a1 + 32) setTransform:v3];
}

- (id)_newAccessoryView:(BOOL)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

id __41__UITableViewCell__accessoryViewForType___block_invoke(uint64_t a1, void *a2)
{
  double v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  BOOL v5 = [WeakRetained _checkmarkImageWithTintColor:v3];

  return v5;
}

- (id)_existingSystemAccessoryViews
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  if ([(UITableViewCell *)self _usesModernAccessoriesLayout])
  {
    id v4 = [(UITableViewCell *)self _accessoryManager];
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"custom", @"customEditing", 0);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__UITableViewCell__existingSystemAccessoryViews__block_invoke;
    aBlock[3] = &unk_1E52E4778;
    id v6 = v5;
    id v24 = v6;
    id v25 = v3;
    uint64_t v7 = (void (**)(void *, void *))_Block_copy(aBlock);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v18 = v4;
    id v8 = [v4 configurations];
    CGFloat v9 = [v8 objectEnumerator];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v15 = [v14 leadingAccessories];
          v7[2](v7, v15);

          CGAffineTransform v16 = [v14 trailingAccessories];
          v7[2](v7, v16);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v26 count:16];
      }
      while (v11);
    }
  }
  else
  {
    if (self->_accessoryView) {
      objc_msgSend(v3, "addObject:");
    }
    if (self->_editingAccessoryView) {
      objc_msgSend(v3, "addObject:");
    }
  }
  return v3;
}

void __48__UITableViewCell__existingSystemAccessoryViews__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        CGFloat v9 = *(void **)(a1 + 32);
        uint64_t v10 = [v8 identifier];
        LOBYTE(v9) = [v9 containsObject:v10];

        if ((v9 & 1) == 0)
        {
          uint64_t v11 = *(void **)(a1 + 40);
          uint64_t v12 = [v8 view];
          [v11 addObject:v12];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (id)_defaultAccessoryView
{
  if ([(UITableViewCell *)self _usesModernAccessoriesLayout])
  {
    id v3 = [(UITableViewCell *)self _accessoryView:0];
  }
  else
  {
    p_accessoryView = &self->_accessoryView;
    if (!self->_accessoryView)
    {
      unsigned int tableCellFlags = self->_tableCellFlags;
      int v6 = (tableCellFlags >> 15) & 7;
      if (v6)
      {
        if (v6 == ((tableCellFlags >> 18) & 7) && (editingAccessoryView = self->_editingAccessoryView) != 0)
        {
          objc_storeStrong((id *)&self->_accessoryView, editingAccessoryView);
        }
        else
        {
          id v8 = [(UITableViewCell *)self _newAccessoryView:0];
          CGFloat v9 = *p_accessoryView;
          *p_accessoryView = v8;

          [(UIView *)self addSubview:*p_accessoryView];
        }
      }
    }
    id v3 = *p_accessoryView;
  }
  return v3;
}

- (id)_customAccessoryView:(BOOL)a3
{
  return self->_customAccessoryView;
}

- (id)_customEditingAccessoryView:(BOOL)a3
{
  return self->_customEditingAccessoryView;
}

- (id)_separatorView:(BOOL)a3
{
  if (a3) {
    [(UITableViewCell *)self _updateSeparatorContent:1];
  }
  separatorView = self->_separatorView;
  return separatorView;
}

- (BOOL)_hasAccessoryView
{
  return [(UITableViewCell *)self accessoryType] || self->_customAccessoryView != 0;
}

- (BOOL)_hasEditingAccessoryView
{
  return [(UITableViewCell *)self editingAccessoryType]
      || self->_customEditingAccessoryView != 0;
}

- (BOOL)wasSwiped
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 9) & 1;
}

- (void)_setSwiped:(BOOL)a3
{
  if (((((*((unsigned char *)&self->_tableCellFlags + 1) & 2) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    [(UITableViewCell *)self _prepareForConfigurationStateUpdate];
    if (v3) {
      int v5 = 512;
    }
    else {
      int v5 = 0;
    }
    *(_DWORD *)&self->_unsigned int tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFFFFFDFF | v5;
    [(UITableViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)_setTarget:(id)a3
{
}

- (id)_target
{
  return self->_target;
}

- (void)_setAccessoryAction:(SEL)a3
{
  if (a3) {
    BOOL v3 = a3;
  }
  else {
    BOOL v3 = 0;
  }
  self->_SEL accessoryAction = v3;
}

- (SEL)_accessoryAction
{
  if (self->_accessoryAction) {
    return self->_accessoryAction;
  }
  else {
    return 0;
  }
}

- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self->_unhighlightedStates
    && [(UIView *)self containsView:v8]
    && ![(UIView *)self containsView:v9])
  {
    [(UITableViewCell *)self _clearOpaqueViewState:v10];
  }
}

- (void)_monitoredView:(id)a3 didMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = (UITableViewCell *)a5;
  id v10 = v9;
  while (1)
  {
    BOOL v11 = v10 == self || v10 == 0;
    BOOL v12 = !v11;
    if (v11) {
      break;
    }
    objc_opt_class();
    BOOL v13 = (objc_opt_isKindOfClass() & 1) != 0 || v10 == (UITableViewCell *)self->_selectedBackgroundView;
    long long v14 = [(UIView *)v10 superview];

    id v10 = v14;
    if (v13) {
      goto LABEL_15;
    }
  }
  long long v14 = v10;
LABEL_15:
  if (self->_unhighlightedStates
    && ![(UIView *)self containsView:v8]
    && ((v12 | ![(UIView *)self containsView:v9]) & 1) == 0)
  {
    [(UITableViewCell *)self _saveOpaqueViewState:v15];
    [(UITableViewCell *)self _setOpaque:0 forSubview:v15];
    [(UITableViewCell *)self _updateHighlightColorsForView:v15 highlighted:[(UITableViewCell *)self _shouldUseHighlightedOrSelectedAppearance]];
  }
}

- (void)_startToEditTextField
{
  double v2 = [(UITableViewCell *)self editableTextField];
  if (v2)
  {
    id v3 = v2;
    [v2 becomeFirstResponder];
    double v2 = v3;
  }
}

- (void)_multiselectColorChanged
{
  id v3 = [(UITableViewCell *)self editingData:0];
  double v2 = [v3 editControl:0];
  [v2 _multiselectColorChanged];
}

- (BOOL)_isMultiselecting
{
  p_int tableCellFlags = &self->_tableCellFlags;
  int tableCellFlags = (int)self->_tableCellFlags;
  if ((tableCellFlags & 0x100) == 0)
  {
LABEL_2:
    int v6 = [(UITableViewCell *)self _tableView];
    char v7 = [v6 allowsMultipleSelection];

    if ((tableCellFlags & 0x100) == 0) {
      return v7;
    }
    goto LABEL_11;
  }
  if ((*(_DWORD *)&self->_tableCellFlags & 0x7000) != 0x3000)
  {
    double v2 = [(UITableViewCell *)self _tableView];
    if (![v2 allowsMultipleSelectionDuringEditing]
      || (*((_WORD *)p_tableCellFlags + 6) & 4) != 0)
    {
      if ((*((unsigned char *)p_tableCellFlags + 1) & 1) == 0) {
        goto LABEL_2;
      }
      char v7 = 0;
    }
    else
    {
      char v7 = 1;
    }
LABEL_11:

    return v7;
  }
  return 1;
}

- (BOOL)_shouldSaveOpaqueStateForView:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)&self->_tableCellFlags + 1))
  {
    BOOL v6 = 1;
    id v5 = [(UITableViewCell *)self _existingSystemAccessoryView:1];
    if (v5 != v4) {
      goto LABEL_8;
    }
    int v7 = 0x80000;
    int v8 = 1835008;
LABEL_7:
    BOOL v6 = (*(_DWORD *)&self->_tableCellFlags & v8) != v7;
    id v5 = v4;
    goto LABEL_8;
  }
  id v5 = [(UITableViewCell *)self _existingSystemAccessoryView:0];
  if (v5 == v4)
  {
    int v7 = 0x10000;
    int v8 = 229376;
    goto LABEL_7;
  }
  BOOL v6 = 1;
LABEL_8:

  BOOL v9 = [(UITableViewCell *)self _shouldChangeOpaqueStateOfView:v4] && v6;
  return v9;
}

- (UIEdgeInsets)_adjustedRawLayoutMargins:(UIEdgeInsets)a3 withLeadingLayoutMarginAdjustment:(double)a4
{
  double right = a3.right;
  CGFloat bottom = a3.bottom;
  double left = a3.left;
  CGFloat top = a3.top;
  if ([(UIView *)self _shouldReverseLayoutDirection])
  {
    if (right == -1.79769313e308)
    {
      double v10 = 0.0;
      if (([(UIView *)self edgesInsettingLayoutMarginsFromSafeArea] & 8) != 0)
      {
        [(UIView *)self safeAreaInsets];
        double v10 = v11;
      }
      [(UIView *)self layoutMargins];
      double right = v12 - v10 + a4;
    }
    else
    {
      double right = right + a4;
    }
  }
  else if (left == -1.79769313e308)
  {
    double v13 = 0.0;
    if (([(UIView *)self edgesInsettingLayoutMarginsFromSafeArea] & 2) != 0)
    {
      [(UIView *)self safeAreaInsets];
      double v13 = v14;
    }
    [(UIView *)self layoutMargins];
    double left = v15 - v13 + a4;
  }
  else
  {
    double left = left + a4;
  }
  double v16 = top;
  double v17 = left;
  double v18 = bottom;
  double v19 = right;
  result.double right = v19;
  result.CGFloat bottom = v18;
  result.double left = v17;
  result.CGFloat top = v16;
  return result;
}

- (void)_applyLeadingLayoutMarginAdjustment:(double)a3
{
  [(UIView *)self _rawLayoutMargins];
  -[UITableViewCell _adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:](self, "_adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:");
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCell;
  [(UIView *)&v4 _setRawLayoutMargins:sel__setRawLayoutMargins_];
}

- (void)_resetRawLayoutMargins
{
  if (dyld_program_sdk_at_least())
  {
    self->_double extraLeadingLayoutMarginForIndentation = 0.0;
    v3.receiver = self;
    v3.super_class = (Class)UITableViewCell;
    -[UIView _setRawLayoutMargins:](&v3, sel__setRawLayoutMargins_, -1.79769313e308, -1.79769313e308, -1.79769313e308, -1.79769313e308);
  }
}

- (NSDirectionalEdgeInsets)_overriddenDefaultContentViewLayoutMargins
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (isKindOfClass) {
    [(UIView *)self->_contentView _overriddenDefaultLayoutMargins];
  }
  result.double trailing = v7;
  result.CGFloat bottom = v6;
  result.double leading = v4;
  result.CGFloat top = v5;
  return result;
}

- (double)_contentViewInset:(double)a3 convertedToCellInsetOnEdge:(unint64_t)a4
{
  if (a4 != 2 && a4 != 8)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UITableViewCell.m", 6594, @"Invalid parameter not satisfying: %@", @"edge == NSDirectionalRectEdgeLeading || edge == NSDirectionalRectEdgeTrailing" object file lineNumber description];
  }
  if (a4 == 2) {
    double v9 = 0.0;
  }
  else {
    double v9 = a3;
  }
  if (a4 != 2) {
    a3 = 0.0;
  }
  BOOL v10 = [(UIView *)self _shouldReverseLayoutDirection];
  [(UIView *)self->_contentView bounds];
  if (v10) {
    double v14 = v9;
  }
  else {
    double v14 = a3;
  }
  if (v10) {
    double v15 = a3;
  }
  else {
    double v15 = v9;
  }
  double v16 = v14 + v11;
  double v17 = v12 + 0.0;
  double v18 = v13 - (v14 + v15);
  if (v10) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 8;
  }
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->_contentView, v16, v17, v18);
  CGFloat v24 = v20;
  CGFloat v25 = v21;
  CGFloat v26 = v22;
  CGFloat v27 = v23;
  if (v19 == a4)
  {
    [(UIView *)self bounds];
    double MaxX = CGRectGetMaxX(v31);
    v32.origin.double x = v24;
    v32.origin.double y = v25;
    v32.size.double width = v26;
    v32.size.double height = v27;
    return MaxX - CGRectGetMaxX(v32);
  }
  else
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v20);
    [(UIView *)self bounds];
    return MinX - CGRectGetMinX(v33);
  }
}

- (double)_preferredLeadingSeparatorInsetFromContentView
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1.79769313e308;
  }
  [(UIView *)self->_contentView _preferredLeadingSeparatorInset];
  if (v3 == 1.79769313e308) {
    return 1.79769313e308;
  }
  -[UITableViewCell _contentViewInset:convertedToCellInsetOnEdge:](self, "_contentViewInset:convertedToCellInsetOnEdge:", 2);
  return result;
}

- (double)_contentConfigurationPrimaryTextInsetFromCellLeadingEdge
{
  if (objc_opt_respondsToSelector())
  {
    [(UIView *)self->_contentView _primaryTextLayoutFrame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB20];
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  v31.origin.double x = v4;
  v31.origin.double y = v6;
  v31.size.double width = v8;
  v31.size.double height = v10;
  BOOL IsNull = CGRectIsNull(v31);
  double result = 0.0;
  if (!IsNull)
  {
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->_contentView, v4, v6, v8, v10);
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [(UIView *)self bounds];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    if ([(UIView *)self _shouldReverseLayoutDirection])
    {
      v32.origin.double x = v22;
      v32.origin.double y = v24;
      v32.size.double width = v26;
      v32.size.double height = v28;
      double MaxX = CGRectGetMaxX(v32);
      v33.origin.double x = v14;
      v33.origin.double y = v16;
      v33.size.double width = v18;
      v33.size.double height = v20;
      return MaxX - CGRectGetMaxX(v33);
    }
    else
    {
      v34.origin.double x = v14;
      v34.origin.double y = v16;
      v34.size.double width = v18;
      v34.size.double height = v20;
      double MinX = CGRectGetMinX(v34);
      v35.origin.double x = v22;
      v35.origin.double y = v24;
      v35.size.double width = v26;
      v35.size.double height = v28;
      return MinX - CGRectGetMinX(v35);
    }
  }
  return result;
}

- (void)_setMarginWidth:(double)a3
{
}

- (void)_setRightMarginWidth:(double)a3
{
}

- (double)_defaultLeadingMarginWidth
{
  return self->_defaultLeadingMarginWidth;
}

- (double)_defaultTrailingCellMarginWidth
{
  return self->_defaultTrailingCellMarginWidth;
}

- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(UIView *)self safeAreaInsets];
  if (left != v9 || right != v8)
  {
    [(UITableViewCell *)self _setNeedsSeparatorUpdate];
    [(UITableViewCell *)self _updateAccessoryMetrics];
  }
  v11.receiver = self;
  v11.super_class = (Class)UITableViewCell;
  -[UIView _safeAreaInsetsDidChangeFromOldInsets:](&v11, sel__safeAreaInsetsDidChangeFromOldInsets_, top, left, bottom, right);
}

- (void)_tableViewDidUpdateMarginWidth
{
  if (self->_separatorInset.left == -1.0 || self->_separatorInset.right == -1.0) {
    [(UITableViewCell *)self _updateSeparatorContent:1];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v64.receiver = self;
  v64.super_class = (Class)UITableViewCell;
  double v8 = -[UIView hitTest:withEvent:](&v64, sel_hitTest_withEvent_, v7, x, y);
  BOOL IsAnimating = _UIViewIsAnimating(self);
  if (v8) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = !IsAnimating;
  }
  if (v10) {
    goto LABEL_58;
  }
  if (!dyld_program_sdk_at_least()
    || ![(UITableViewCell *)self _usesModernAccessoriesLayout])
  {
    if ((*((unsigned char *)&self->_tableCellFlags + 2) & 0x20) != 0)
    {
LABEL_58:
      id v21 = v8;
      goto LABEL_59;
    }
    double v30 = [(UITableViewCell *)self _existingSystemAccessoryView:1];
    CGRect v31 = [(UITableViewCell *)self _existingSystemAccessoryView:0];
    [(UIView *)self bounds];
    double MidY = CGRectGetMidY(v66);
    int v33 = *((_DWORD *)&self->super._viewFlags + 4);
    if (v30)
    {
      [v30 frame];
      if ((v33 & 0x80000) == 0)
      {
        BOOL v38 = x >= CGRectGetMinX(*(CGRect *)&v34);
        if (!v31) {
          goto LABEL_30;
        }
        goto LABEL_23;
      }
      BOOL v38 = x <= CGRectGetMaxX(*(CGRect *)&v34);
      if (!v31)
      {
LABEL_30:
        int v40 = 0;
LABEL_32:
        BOOL v39 = 0;
LABEL_33:
        objc_msgSend(v30, "convertPoint:fromView:", self, x, MidY);
        double v42 = v41;
        double v44 = v43;
        objc_msgSend(v31, "convertPoint:fromView:", self, x, MidY);
        double v46 = v45;
        double v48 = v47;
        int tableCellFlags = (int)self->_tableCellFlags;
        if ((tableCellFlags & 0x100) != 0)
        {
          if (v30) {
            BOOL v52 = (tableCellFlags & 0x1C0000) == 0x100000;
          }
          else {
            BOOL v52 = 0;
          }
          char v53 = !v52;
          int v54 = !v52 || v38;
          if (v54 == 1)
          {
            int v51 = v30;
            if ((v53 & 1) == 0) {
              goto LABEL_56;
            }
          }
          else
          {
            CGFloat v55 = objc_msgSend(v30, "hitTest:withEvent:", v7, v42, v44);

            int v51 = v30;
            if (v55) {
              goto LABEL_56;
            }
            int tableCellFlags = (int)self->_tableCellFlags;
          }
        }
        if ((tableCellFlags & 0x100) == 0)
        {
          if ((tableCellFlags & 0x38000) == 0x20000) {
            int v50 = v40;
          }
          else {
            int v50 = 0;
          }
          if ((v50 ^ 1 | v39) == 1)
          {
            int v51 = v31;
            if ((v50 & 1) == 0) {
              goto LABEL_57;
            }
LABEL_56:
            id v21 = v51;

            goto LABEL_59;
          }
          CGFloat v56 = objc_msgSend(v31, "hitTest:withEvent:", v7, v46, v48);

          int v51 = v31;
          if (v56) {
            goto LABEL_56;
          }
        }
LABEL_57:

        goto LABEL_58;
      }
    }
    else
    {
      if (!v31)
      {
        int v40 = 0;
        BOOL v38 = 0;
        goto LABEL_32;
      }
      BOOL v38 = 0;
      if ((v33 & 0x80000) == 0)
      {
LABEL_23:
        [v31 frame];
        BOOL v39 = x >= CGRectGetMinX(v67);
LABEL_29:
        int v40 = 1;
        goto LABEL_33;
      }
    }
    [v31 frame];
    BOOL v39 = x <= CGRectGetMaxX(v68);
    goto LABEL_29;
  }
  objc_super v11 = [(UITableViewCell *)self _accessoryManager];
  double v12 = [v11 currentConfiguration];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__UITableViewCell_hitTest_withEvent___block_invoke;
  aBlock[3] = &unk_1E5308790;
  void aBlock[4] = self;
  id v58 = v11;
  id v60 = v58;
  double v62 = x;
  double v63 = y;
  id v61 = v7;
  double v13 = (void (**)(void *, void *, BOOL, void))_Block_copy(aBlock);
  BOOL v14 = [(UIView *)self _shouldReverseLayoutDirection];
  double v15 = [v12 leadingAccessories];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    unint64_t v17 = 0;
    while (1)
    {
      CGFloat v18 = [v12 leadingAccessories];
      double v19 = [v18 objectAtIndexedSubscript:v17];

      CGFloat v20 = [v12 leadingAccessories];
      v13[2](v13, v19, v17 == [v20 count] - 1, v14 ^ 1);
      id v21 = (id)objc_claimAutoreleasedReturnValue();

      if (v21) {
        break;
      }

      ++v17;
      CGFloat v22 = [v12 leadingAccessories];
      unint64_t v23 = [v22 count];

      if (v17 >= v23) {
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    id v21 = [v12 trailingAccessories];
    uint64_t v24 = [v21 count];

    if (!v24)
    {
LABEL_15:
      char v29 = 1;
      goto LABEL_25;
    }
    unint64_t v25 = 0;
    while (1)
    {
      CGFloat v26 = [v12 trailingAccessories];
      double v19 = [v26 objectAtIndexedSubscript:v25];

      double v27 = [v12 trailingAccessories];
      v13[2](v13, v19, v25 == [v27 count] - 1, v14);
      id v21 = (id)objc_claimAutoreleasedReturnValue();

      if (v21) {
        break;
      }

      ++v25;
      CGFloat v28 = [v12 trailingAccessories];
      id v21 = (id)[v28 count];

      if (v25 >= (unint64_t)v21) {
        goto LABEL_15;
      }
    }
  }

  char v29 = 0;
LABEL_25:

  if (v29) {
    goto LABEL_58;
  }
LABEL_59:

  return v21;
}

id __37__UITableViewCell_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, int a3, int a4)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  double v8 = [v7 view];
  double v9 = *(void **)(a1 + 32);
  id v10 = v8;
  id v11 = v9;
  double v12 = v11;
  BOOL v13 = v10 != 0;
  BOOL v14 = v10;
  if (v10 && v10 != v11)
  {
    BOOL v14 = v10;
    do
    {
      double v15 = v14;
      BOOL v14 = [v14 superview];

      BOOL v13 = v14 != 0;
    }
    while (v14 != v12 && v14);
  }

  if (!os_variant_has_internal_diagnostics())
  {
    if (v13) {
      goto LABEL_8;
    }
    CGFloat v55 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UITableViewCellExpansionAccessoryIdentifier_block_invoke_2___s_category)+ 8);
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    BOOL v52 = v55;
    char v53 = [v10 superview];
    uint64_t v56 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    id v60 = v7;
    __int16 v61 = 2112;
    id v62 = v10;
    __int16 v63 = 2112;
    objc_super v64 = v53;
    __int16 v65 = 2112;
    uint64_t v66 = v56;
    _os_log_impl(&dword_1853B0000, v52, OS_LOG_TYPE_ERROR, "Found an accessory in the current configuration that is not in the correct view hierarchy: %@; view: %@; superview"
      ": %@; configurations: %@",
      buf,
      0x2Au);
    goto LABEL_32;
  }
  if (!v13)
  {
    BOOL v52 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
    {
LABEL_33:

      goto LABEL_34;
    }
    char v53 = [v10 superview];
    uint64_t v54 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    id v60 = v7;
    __int16 v61 = 2112;
    id v62 = v10;
    __int16 v63 = 2112;
    objc_super v64 = v53;
    __int16 v65 = 2112;
    uint64_t v66 = v54;
    _os_log_fault_impl(&dword_1853B0000, v52, OS_LOG_TYPE_FAULT, "Found an accessory in the current configuration that is not in the correct view hierarchy: %@; view: %@; superview"
      ": %@; configurations: %@",
      buf,
      0x2Au);
LABEL_32:

    goto LABEL_33;
  }
LABEL_8:
  uint64_t v16 = *(void **)(a1 + 32);
  [v10 frame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  unint64_t v25 = [v10 superview];
  objc_msgSend(v16, "convertRect:fromView:", v25, v18, v20, v22, v24);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v58 = v32;

  [*(id *)(a1 + 32) bounds];
  CGFloat x = v70.origin.x;
  CGFloat y = v70.origin.y;
  CGFloat width = v70.size.width;
  CGFloat height = v70.size.height;
  CGFloat v37 = CGRectGetHeight(v70);
  if (a3)
  {
    if (a4)
    {
      double v38 = 0.0;
      v71.origin.CGFloat y = 0.0;
      v71.origin.CGFloat x = v27;
      v71.size.CGFloat width = v31;
      v71.size.CGFloat height = v37;
      double v39 = v31 + CGRectGetMinX(v71);
      goto LABEL_14;
    }
    v72.origin.CGFloat x = x;
    v72.origin.CGFloat y = y;
    v72.size.CGFloat width = width;
    v72.size.CGFloat height = height;
    double v40 = CGRectGetWidth(v72);
    v73.origin.CGFloat y = 0.0;
    v73.origin.CGFloat x = v27;
    v73.size.CGFloat width = v31;
    v73.size.CGFloat height = v37;
    double v39 = v31 + v40 - CGRectGetMaxX(v73);
  }
  else
  {
    double v39 = v31;
  }
  double v38 = v27;
LABEL_14:
  uint64_t v41 = 0;
  double v42 = v38;
  CGFloat v43 = v37;
  if (!CGRectContainsPoint(*(CGRect *)(&v39 - 2), *(CGPoint *)(a1 + 56)))
  {
LABEL_34:
    int v51 = 0;
    goto LABEL_35;
  }
  double v44 = *(double *)(a1 + 56);
  double v45 = *(double *)(a1 + 64);
  v74.origin.CGFloat x = v27;
  v74.origin.CGFloat y = v29;
  v74.size.CGFloat width = v31;
  v74.size.CGFloat height = v58;
  v69.CGFloat x = v44;
  v69.CGFloat y = v45;
  if (!CGRectContainsPoint(v74, v69))
  {
    double v46 = v31 + -2.0;
    v75.origin.CGFloat x = v27 + 1.0;
    v75.origin.CGFloat y = v29 + 1.0;
    v75.size.CGFloat width = v46;
    v75.size.CGFloat height = v58 + -2.0;
    double MinX = CGRectGetMinX(v75);
    v76.origin.CGFloat x = v27 + 1.0;
    v76.origin.CGFloat y = v29 + 1.0;
    v76.size.CGFloat width = v46;
    v76.size.CGFloat height = v58 + -2.0;
    double MaxX = CGRectGetMaxX(v76);
    if (v44 < MaxX) {
      double MaxX = v44;
    }
    if (MinX >= MaxX) {
      double v44 = MinX;
    }
    else {
      double v44 = MaxX;
    }
    v77.origin.CGFloat x = v27 + 1.0;
    v77.origin.CGFloat y = v29 + 1.0;
    v77.size.CGFloat width = v46;
    v77.size.CGFloat height = v58 + -2.0;
    double MinY = CGRectGetMinY(v77);
    v78.origin.CGFloat x = v27 + 1.0;
    v78.origin.CGFloat y = v29 + 1.0;
    v78.size.CGFloat width = v46;
    v78.size.CGFloat height = v58 + -2.0;
    double MaxY = CGRectGetMaxY(v78);
    if (v45 < MaxY) {
      double MaxY = v45;
    }
    if (MinY >= MaxY) {
      double v45 = MinY;
    }
    else {
      double v45 = MaxY;
    }
  }
  objc_msgSend(v10, "convertPoint:fromView:", *(void *)(a1 + 32), v44, v45);
  int v51 = objc_msgSend(v10, "hitTest:withEvent:", *(void *)(a1 + 48));
LABEL_35:

  return v51;
}

- (BOOL)_isDeleteAnimationInProgress
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 31) & 1;
}

- (void)_setDeleteAnimationInProgress:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (void)setTextFieldOffset:(double)a3
{
  self->_textFieldOffset = a3;
}

- (double)textFieldOffset
{
  return self->_textFieldOffset;
}

- (void)setPlaceHolderValue:(id)a3
{
  id v4 = a3;
  id v5 = [(UITableViewCell *)self editableTextField];
  [v5 setPlaceholder:v4];
}

- (void)setReturnAction:(SEL)a3
{
  if (a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = 0;
  }
  self->_returnAction = v3;
}

- (SEL)returnAction
{
  if (self->_returnAction) {
    return self->_returnAction;
  }
  else {
    return 0;
  }
}

- (void)_setPopupMenuButton:(id)a3
{
  double v6 = (UIButton *)a3;
  p_popupMenuButton = &self->__popupMenuButton;
  if (self->__popupMenuButton != v6)
  {
    BOOL v14 = v6;
    if (v6)
    {
      double v8 = [(UIButton *)v6 menu];

      if (!v8)
      {
        id v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, self, @"UITableViewCell.m", 7066, @"Popup menu button must be configured with a menu: %@", v14 object file lineNumber description];
      }
      if (![(UIControl *)v14 showsMenuAsPrimaryAction])
      {
        double v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2, self, @"UITableViewCell.m", 7067, @"Popup menu button must have showsMenuAsPrimaryAction enabled: %@", v14 object file lineNumber description];
      }
      if (![(UIButton *)v14 changesSelectionAsPrimaryAction])
      {
        BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2, self, @"UITableViewCell.m", 7068, @"Popup menu button must have changesSelectionAsPrimaryAction enabled: %@", v14 object file lineNumber description];
      }
    }
    [(UIButton *)*p_popupMenuButton _setWantsAccessibilityUnderline:1];
    [(UIView *)*p_popupMenuButton setUserInteractionEnabled:1];
    objc_storeStrong((id *)&self->__popupMenuButton, a3);
    [(UIButton *)*p_popupMenuButton _setWantsAccessibilityUnderline:0];
    double v9 = [(UIView *)self traitCollection];
    uint64_t v10 = [v9 userInterfaceIdiom];

    double v6 = v14;
    if (v10 != 5)
    {
      [(UIView *)v14 setUserInteractionEnabled:0];
      double v6 = v14;
    }
  }
}

- (id)_effectivePopupMenuButton
{
  uint64_t v3 = [(UIView *)self traitCollection];
  if ([v3 userInterfaceIdiom] == 5) {
    popupMenuButton = 0;
  }
  else {
    popupMenuButton = self->__popupMenuButton;
  }
  id v5 = popupMenuButton;

  return v5;
}

- (void)_updatePopupMenuButtonFromContentView
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(UIView *)self->_contentView _popupMenuButton];
    [(UITableViewCell *)self _setPopupMenuButton:v3];
  }
}

- (UIEdgeInsets)separatorInset
{
  [(UITableViewCell *)self _leadingSeparatorInset];
  double v4 = v3;
  [(UITableViewCell *)self _trailingSeparatorInset];
  double v6 = v5;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v4;
  result.double right = v6;
  result.double bottom = v8;
  result.double left = v9;
  result.double top = v7;
  return result;
}

- (UIEdgeInsets)_rawSeparatorInset
{
  double top = self->_separatorInset.top;
  double left = self->_separatorInset.left;
  double bottom = self->_separatorInset.bottom;
  double right = self->_separatorInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)_separatorDrawsInVibrantLightMode
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 42) & 1;
}

- (void)_setSeparatorBackdropOverlayBlendMode:(int64_t)a3
{
  uint64_t v5 = *(void *)((char *)&self->_tableCellFlags + 4);
  *(void *)((char *)&self->_tableCellFlags + 4) = v5 & 0xFFFFFC7FFFFFFFFFLL | ((unint64_t)(a3 & 7) << 39);
  if ((v5 & 0x40000000000) == 0)
  {
    [(_UITableViewCellSeparatorView *)self->_separatorView setDrawsWithVibrantLightMode:0];
    [(_UITableViewCellSeparatorView *)self->_topSeparatorView setDrawsWithVibrantLightMode:0];
    [(UIView *)self->_separatorView _setDrawsAsBackdropOverlayWithBlendMode:a3];
    [(UIView *)self->_separatorView setBackgroundColor:self->_separatorColor];
    [(UIView *)self->_topSeparatorView _setDrawsAsBackdropOverlayWithBlendMode:a3];
    [(UIView *)self->_topSeparatorView setBackgroundColor:self->_separatorColor];
  }
  id v7 = [(UIView *)self layer];
  BOOL v6 = a3 == 0;
  [v7 setAllowsGroupBlending:v6];
  [v7 setAllowsGroupOpacity:v6];
}

- (id)_separatorEffect
{
  return self->_separatorEffect;
}

- (double)_indexBarExtentFromEdge
{
  return self->_indexBarExtentFromEdge;
}

- (UIEdgeInsets)_backgroundInset
{
  double top = self->_backgroundInset.top;
  double left = self->_backgroundInset.left;
  double bottom = self->_backgroundInset.bottom;
  double right = self->_backgroundInset.right;
  BOOL v6 = [(UITableViewCell *)self _tableView];
  [v6 _sectionContentInset];
  double v8 = v7;
  double v10 = v9;

  if (v8 == -1.0) {
    double v11 = 0.0;
  }
  else {
    double v11 = v8;
  }
  if (left == -1.0) {
    double v12 = v11;
  }
  else {
    double v12 = left;
  }
  if (top == -1.0) {
    double v13 = 0.0;
  }
  else {
    double v13 = top;
  }
  if (v10 == -1.0) {
    double v14 = 0.0;
  }
  else {
    double v14 = v10;
  }
  if (right != -1.0) {
    double v14 = right;
  }
  if (bottom == -1.0) {
    double v15 = 0.0;
  }
  else {
    double v15 = bottom;
  }
  result.double right = v14;
  result.double bottom = v15;
  result.double left = v12;
  result.double top = v13;
  return result;
}

- (BOOL)_separatorHidden
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 43) & 1;
}

- (void)_setAccessoryViewsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = 0x8000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)((char *)&self->_tableCellFlags + 4) = *(void *)((char *)&self->_tableCellFlags + 4) & 0xFFF7FFFFFFFFFFFFLL | v4;
  id v6 = [(UITableViewCell *)self editingData:0];
  uint64_t v5 = [v6 editControl:0];
  [v5 setHidden:v3];
}

- (BOOL)_accessoryViewsHidden
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 51) & 1;
}

- (BOOL)_allowsReorderingWhenNotEditing
{
  return (*(void *)((char *)&self->_tableCellFlags + 4) >> 46) & 1;
}

- (id)_previewingSegueTemplateStorageForLocation:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(UITableViewCell *)self _accessoryView:0];
  if (!v8) {
    goto LABEL_5;
  }
  double v9 = [(UITableViewCell *)self accessoryActionPreviewingSegueTemplateStorage];
  if (!v9
    || (objc_msgSend(v8, "convertPoint:fromView:", v7, x, y), (objc_msgSend(v8, "pointInside:forEvent:", 0) & 1) == 0))
  {

LABEL_5:
    double v9 = [(UIView *)self _previewingSegueTemplateStorage];
  }

  return v9;
}

- (id)accessoryActionPreviewingSegueTemplateStorage
{
  return self->_accessoryActionPreviewingSegueTemplateStorage;
}

- (void)setAccessoryActionPreviewingSegueTemplateStorage:(id)a3
{
}

- (UITableViewCellFocusStyle)focusStyle
{
  return *((_WORD *)&self->_tableCellFlags + 5) & 7;
}

- (void)setFocusStyle:(UITableViewCellFocusStyle)focusStyle
{
  unint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  if ((HIWORD(v3) & 7) != focusStyle)
  {
    int v5 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    *(void *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFF8FFFFFFFFFFFFLL | ((unint64_t)(focusStyle & 7) << 48);
    *((_WORD *)&self->_tableCellFlags + 6) = v5;
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v5);
    if (focusStyle)
    {
      if (focusStyle == UITableViewCellFocusStyleCustom)
      {
        [(UITableViewCell *)self _removeFocusedFloatingContentView];
      }
    }
    else if ([(UIView *)self isFocused])
    {
      [(UITableViewCell *)self _ensureFocusedFloatingContentView];
      [(UITableViewCell *)self _updateFloatingContentControlStateAnimated:0];
    }
  }
}

- (id)_subviewsForFloatingContentView
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:7];
  uint64_t v4 = v3;
  if (self->_systemBackgroundView) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_backgroundView) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_selectedBackgroundView) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_multipleSelectionBackgroundView) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_contentView) {
    objc_msgSend(v4, "addObject:");
  }
  int v5 = [(UITableViewCell *)self _existingSystemAccessoryView:0];
  if (v5) {
    [v4 addObject:v5];
  }
  if (self->_customAccessoryView) {
    objc_msgSend(v4, "addObject:");
  }

  return v4;
}

- (void)_removeFocusedFloatingContentView
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  floatingContentView = self->_floatingContentView;
  if (floatingContentView)
  {
    uint64_t v4 = floatingContentView;
    int v5 = self->_floatingContentView;
    self->_floatingContentView = 0;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(_UIFloatingContentView *)v4 contentView];
    id v7 = [v6 subviews];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          [(UIView *)self addSubview:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(UIView *)v4 removeFromSuperview];
  }
}

- (BOOL)canBecomeFocused
{
  unint64_t v3 = [(UIView *)self _focusBehavior];
  if ([v3 preventsCellFocusabilityWhileEditing]
    && [(UITableViewCell *)self isEditing])
  {
    uint64_t v4 = [(UITableViewCell *)self _tableView];
    int v5 = [v4 _scrollView];
    int v6 = [v5 canBecomeFocused];

    if (!v6) {
      return 0;
    }
  }
  else
  {
  }
  uint64_t v8 = [(UITableViewCell *)self _existingContentView];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0 && ([v8 _preventFocus] & 1) != 0)
  {
    char v7 = 0;
  }
  else
  {
    uint64_t v9 = [(UITableViewCell *)self _tableView];
    char v7 = [v9 _canFocusCell:self];
  }
  return v7;
}

- (int64_t)_focusTouchSensitivityStyle
{
  return 3;
}

- (id)preferredFocusedView
{
  if (![(UITableViewCell *)self isEditing]) {
    goto LABEL_17;
  }
  unint64_t v3 = [(UITableViewCell *)self editingData:0];
  uint64_t v4 = [v3 editControl:0];

  int v5 = [(UITableViewCell *)self editingData:0];
  int v6 = [v5 reorderControl:0];

  if (!v4)
  {
    if (!v6) {
      goto LABEL_16;
    }
    char IsFocusedOrFocusable = _UIFocusItemIsFocusedOrFocusable(v6);
    uint64_t v11 = v6;
    if ((IsFocusedOrFocusable & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  int v7 = _UIFocusItemIsFocusedOrFocusable(v4);
  char v8 = v7;
  if (v6)
  {
    int v9 = _UIFocusItemIsFocusedOrFocusable(v6);
    int v10 = v9;
    if ((v8 & 1) == 0)
    {
      uint64_t v11 = v6;
      if (!v9) {
        goto LABEL_16;
      }
LABEL_15:
      id v13 = v11;

      goto LABEL_18;
    }
LABEL_12:
    if (([v4 isFocused] & v10) != 0) {
      uint64_t v11 = v6;
    }
    else {
      uint64_t v11 = v4;
    }
    goto LABEL_15;
  }
  if (v7)
  {
    int v10 = 0;
    goto LABEL_12;
  }
LABEL_16:

LABEL_17:
  v15.receiver = self;
  v15.super_class = (Class)UITableViewCell;
  id v13 = [(UIView *)&v15 preferredFocusedView];
LABEL_18:
  return v13;
}

- (void)_willUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITableViewCell;
  [(UIView *)&v8 _willUpdateFocusInContext:v4];
  int v5 = [v4 previouslyFocusedView];
  if (v5 == self)
  {

LABEL_5:
    [(UITableViewCell *)self _prepareForConfigurationStateUpdate];
    goto LABEL_6;
  }
  int v6 = v5;
  int v7 = [v4 nextFocusedView];

  if (v7 == self) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  int v5 = [v4 previouslyFocusedView];

  if (v5 == self)
  {
    int v6 = [(UITableViewCell *)self _tableView];
    [v6 _cellDidBecomeUnfocused:self];
  }
  int v7 = [v4 nextFocusedView];

  if (v7 == self)
  {
    objc_super v8 = [(UITableViewCell *)self _tableView];
    [v8 _cellDidBecomeFocused:self];
  }
  v12.receiver = self;
  v12.super_class = (Class)UITableViewCell;
  [(UIView *)&v12 _didUpdateFocusInContext:v4];
  int v9 = [v4 previouslyFocusedView];
  if (v9 == self)
  {

LABEL_9:
    [(UITableViewCell *)self setNeedsUpdateConfiguration];
    goto LABEL_10;
  }
  int v10 = v9;
  uint64_t v11 = [v4 nextFocusedView];

  if (v11 == self) {
    goto LABEL_9;
  }
LABEL_10:
}

- (int64_t)_systemDefaultFocusGroupPriority
{
  if ([(UITableViewCell *)self isSelected]) {
    return 2000;
  }
  else {
    return 0;
  }
}

- (void)_updateDefaultLabelsForFocus:(BOOL)a3
{
  BOOL v3 = a3;
  id v39 = [(UITableViewCell *)self _constants];
  int v5 = [(UITableViewCell *)self _tableView];
  if ([v39 supportsUserInterfaceStyles])
  {
    textLabel = self->_textLabel;
    if (v3)
    {
      int v7 = [v39 defaultFocusedTextColorForCell:self inTableView:v5];
      [(UILabel *)textLabel _setFallbackTextColor:v7 forUserInterfaceStyle:1];

      objc_super v8 = self->_textLabel;
      int v9 = [v39 defaultFocusedTextColorForCell:self inTableView:v5];
      [(UILabel *)v8 _setFallbackTextColor:v9 forUserInterfaceStyle:2];

      int v10 = self->_textLabel;
      uint64_t v11 = [v39 defaultFocusedTextColorForCell:self inTableView:v5];
      [(UILabel *)v10 _setFallbackTextColor:v11 forUserInterfaceStyle:1000];

      detailTextLabel = self->_detailTextLabel;
      id v13 = [v39 defaultFocusedDetailTextColorForCell:self inTableView:v5];
      [(UILabel *)detailTextLabel _setFallbackTextColor:v13 forUserInterfaceStyle:1];

      long long v14 = self->_detailTextLabel;
      objc_super v15 = [v39 defaultFocusedDetailTextColorForCell:self inTableView:v5];
      [(UILabel *)v14 _setFallbackTextColor:v15 forUserInterfaceStyle:2];

      uint64_t v16 = self->_detailTextLabel;
      uint64_t v17 = [v39 defaultFocusedDetailTextColorForCell:self inTableView:v5];
      double v18 = v16;
    }
    else
    {
      double v22 = [v39 defaultTextColorForUserInterfaceStyle:1];
      [(UILabel *)textLabel _setFallbackTextColor:v22 forUserInterfaceStyle:1];

      double v23 = self->_textLabel;
      double v24 = [v39 defaultTextColorForUserInterfaceStyle:2];
      [(UILabel *)v23 _setFallbackTextColor:v24 forUserInterfaceStyle:2];

      unint64_t v25 = self->_textLabel;
      double v26 = [v39 defaultTextColorForUserInterfaceStyle:1000];
      [(UILabel *)v25 _setFallbackTextColor:v26 forUserInterfaceStyle:1000];

      double v27 = self->_detailTextLabel;
      double v28 = [v39 defaultDetailTextColorForUserInterfaceStyle:1];
      [(UILabel *)v27 _setFallbackTextColor:v28 forUserInterfaceStyle:1];

      double v29 = self->_detailTextLabel;
      double v30 = [v39 defaultDetailTextColorForUserInterfaceStyle:2];
      [(UILabel *)v29 _setFallbackTextColor:v30 forUserInterfaceStyle:2];

      double v31 = self->_detailTextLabel;
      uint64_t v17 = [v39 defaultDetailTextColorForUserInterfaceStyle:1000];
      double v18 = v31;
    }
    [(UILabel *)v18 _setFallbackTextColor:v17 forUserInterfaceStyle:1000];
  }
  else
  {
    double v19 = [(UIView *)self traitCollection];
    uint64_t v20 = [v19 userInterfaceIdiom];

    if (v20 != 3) {
      goto LABEL_11;
    }
    if (v3)
    {
      double v21 = [v39 defaultFocusedTextColorForCell:self inTableView:v5];
      [(UILabel *)self->_textLabel setTextColor:v21];

      uint64_t v17 = [v39 defaultFocusedDetailTextColorForCell:self inTableView:v5];
      [(UILabel *)self->_detailTextLabel setTextColor:v17];
    }
    else
    {
      uint64_t v17 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
      int64_t v32 = [(UITableViewCell *)self _cellStyle];
      int v33 = [(UIView *)self traitCollection];
      uint64_t v34 = [(UIView *)self _inheritedInteractionTintColor];
      CGRect v35 = [v39 defaultTextColorForCellStyle:v32 traitCollection:v33 tintColor:v34 state:v17];
      [(UILabel *)self->_textLabel setTextColor:v35];

      int64_t v36 = [(UITableViewCell *)self _cellStyle];
      CGFloat v37 = [(UIView *)self traitCollection];
      double v38 = [v39 defaultDetailTextColorForCellStyle:v36 traitCollection:v37 state:v17];
      [(UILabel *)self->_detailTextLabel setTextColor:v38];
    }
  }

LABEL_11:
}

- (void)_updateDefaultAccessoryViewForFocus:(BOOL)a3
{
  [(UITableViewCell *)self _updateAccessoriesIfNeeded];
  BOOL v5 = [(UITableViewCell *)self isEditing];
  if (v5)
  {
    UITableViewCellAccessoryType v6 = [(UITableViewCell *)self editingAccessoryType];
    int v7 = &OBJC_IVAR___UITableViewCell__customEditingAccessoryView;
  }
  else
  {
    UITableViewCellAccessoryType v6 = [(UITableViewCell *)self accessoryType];
    int v7 = &OBJC_IVAR___UITableViewCell__customAccessoryView;
  }
  id v8 = *(id *)((char *)&self->super.super.super.isa + *v7);
  int v9 = v8;
  BOOL v10 = v6 == UITableViewCellAccessoryCheckmark || v6 == UITableViewCellAccessoryDisclosureIndicator;
  if (v10 && !v8)
  {
    uint64_t v11 = [(UITableViewCell *)self _existingSystemAccessoryView:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v12 = v11;
    }
    else {
      objc_super v12 = 0;
    }
    id v13 = v12;
    long long v14 = [(UITableViewCell *)self _constants];
    objc_super v15 = [(UITableViewCell *)self _tableView];
    if (os_variant_has_internal_diagnostics())
    {
      if (!v13)
      {
        double v24 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "expected standard checkmark/chevron accessory view to be a button", buf, 2u);
        }
      }
    }
    else if (!v13)
    {
      unint64_t v25 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateDefaultAccessoryViewForFocus____s_category) + 8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v26 = 0;
        _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "expected standard checkmark/chevron accessory view to be a button", v26, 2u);
      }
    }
    if (v6 == UITableViewCellAccessoryDisclosureIndicator)
    {
      if (!a3)
      {
        uint64_t v17 = [v15 _accessoryBaseColor];
        double v18 = [v14 defaultDisclosureImageForCell:self withAccessoryBaseColor:v17];

LABEL_25:
        [v13 setBackgroundImage:v18 forStates:0];

LABEL_26:
        if (a3)
        {
          if (objc_opt_respondsToSelector())
          {
            constants = self->_constants;
            uint64_t v20 = [(UITableViewCell *)self _tableView];
            uint64_t v21 = [(UITableConstants *)constants defaultFocusedAccessoryColorForCell:self inTableView:v20];
LABEL_31:
            double v23 = (void *)v21;
            [v13 setTintColor:v21];
          }
        }
        else if (objc_opt_respondsToSelector())
        {
          double v22 = self->_constants;
          uint64_t v20 = [(UITableViewCell *)self _tableView];
          uint64_t v21 = [(UITableConstants *)v22 defaultAccessoryColorForCell:self inTableView:v20];
          goto LABEL_31;
        }

        goto LABEL_33;
      }
      uint64_t v16 = [v14 defaultFocusedDisclosureImageForCell:self inTableView:v15];
    }
    else
    {
      if (v6 != UITableViewCellAccessoryCheckmark) {
        goto LABEL_26;
      }
      if (a3) {
        [v14 defaultFocusedCheckmarkImageForCell:self inTableView:v15];
      }
      else {
      uint64_t v16 = [v14 defaultCheckmarkImageForCell:self];
      }
    }
    double v18 = (void *)v16;
    goto LABEL_25;
  }
LABEL_33:
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UITableViewCell;
  [(UIView *)&v12 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  int v7 = [(UIView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 3)
  {
    int v9 = [v6 nextFocusedView];
    BOOL v10 = v9 == self;

    uint64_t v11 = [(UITableViewCell *)self _tableView];
    [v11 _highlightCell:self animated:0 scrollPosition:0 highlight:v10];
  }
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  if (self->_floatingContentView)
  {
    id v4 = [(_UIFloatingContentView *)self->_floatingContentView _preferredConfigurationForFocusAnimation:a3 inContext:a4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UITableViewCell;
    id v4 = [(UIView *)&v6 _preferredConfigurationForFocusAnimation:a3 inContext:a4];
  }
  return v4;
}

- (BOOL)_shouldForwardMovementToFocusEngine:(int64_t)a3
{
  if (a3 == 1) {
    return 0;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCell;
  return -[UIResponder _shouldForwardMovementToFocusEngine:](&v6, sel__shouldForwardMovementToFocusEngine_);
}

- (id)_defaultFocusOutline
{
  systemBackgroundView = self->_systemBackgroundView;
  if (systemBackgroundView)
  {
    uint64_t v4 = [(_UISystemBackgroundView *)systemBackgroundView outlinePathInContainerView:self];
  }
  else
  {
    BOOL v5 = [(UIView *)self layer];
    [v5 cornerRadius];
    uint64_t v6 = [v5 maskedCorners] & 0xF;
    [(UIView *)self bounds];
    uint64_t v4 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v6);
  }
  return v4;
}

- (id)_defaultFocusEffect
{
  if (!self->_systemBackgroundView)
  {
LABEL_8:
    uint64_t v7 = [(UITableViewCell *)self _tableView];
    int v8 = [v7 _effectiveDefaultAllowsFocus];

    if (v8) {
      int v9 = UIFocusHaloEffect;
    }
    else {
      int v9 = _UIFocusSystemHaloEffect;
    }
    uint64_t v3 = [(UITableViewCell *)self _defaultFocusOutline];
    uint64_t v6 = [(__objc2_class *)v9 effectWithPath:v3];
    goto LABEL_12;
  }
  [(UITableViewCell *)self _performConfigurationStateUpdate];
  uint64_t v3 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
  if (([v3 isTintBackgroundColor] & 1) == 0)
  {
    uint64_t v4 = [(UIView *)self traitCollection];
    unint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 > 5
      || ((1 << v5) & 0x23) == 0
      || ![(UITableViewCell *)self _backgroundFillIsCustomized])
    {

      goto LABEL_8;
    }
  }
  uint64_t v6 = 0;
LABEL_12:

  return v6;
}

- (int64_t)focusItemDeferralMode
{
  uint64_t v3 = [(UITableViewCell *)self _tableView];
  int64_t v4 = [v3 _cellFocusItemDeferral:self];

  return v4;
}

- (void)_prepareHighlightForInteraction:(id)a3
{
  p_int tableCellFlags = &self->_tableCellFlags;
  if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x40000000000000) == 0)
  {
    id v5 = a3;
    uint64_t v6 = [(UITableViewCell *)self _tableView];
    [v6 _prepareHighlightForCell:self withInteraction:v5];

    *(void *)((char *)p_tableCellFlags + 4) |= 0x40000000000000uLL;
  }
}

- (int64_t)_preferredHighlightAnimationStyleForInteraction:(id)a3
{
  return 1;
}

- (BOOL)_highlightsAlongsideDefaultEffect
{
  uint64_t v2 = *(void *)((char *)&self->_tableCellFlags + 4) & 0x1FLL;
  return v2 == 16 || (unint64_t)(v2 - 1) < 2;
}

- (void)_highlightForInteraction:(id)a3 fractionComplete:(double)a4 ended:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v5)
  {
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v20.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v20.c = v9;
    *(_OWORD *)&v20.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v10 = 0.0;
  }
  else
  {
    if (![(UITableViewCell *)self isHighlighted]) {
      goto LABEL_10;
    }
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v20.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v20.c = v11;
    *(_OWORD *)&v20.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    if ((*(void *)((char *)&self->_tableCellFlags + 4) & 0x1FLL) == 0) {
      CGAffineTransformMakeScale(&v20, a4 * 0.945 + (1.0 - a4) * 0.99, a4 * 0.945 + (1.0 - a4) * 0.99);
    }
    float v12 = a4;
    double v13 = powf(v12, 3.0);
    double v10 = 1.0 - v13 + v13 * 0.0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__UITableViewCell__highlightForInteraction_fractionComplete_ended___block_invoke;
  v19[3] = &unk_1E52D9F70;
  void v19[4] = self;
  +[UIView performWithoutAnimation:v19];
  CGAffineTransform v18 = v20;
  long long v14 = [(UITableViewCell *)self contentView];
  CGAffineTransform v17 = v18;
  [v14 setTransform:&v17];

  objc_super v15 = [(UITableViewCell *)self selectedBackgroundView];
  [v15 setAlpha:v10];

  uint64_t v16 = [(UITableViewCell *)self backgroundView];
  [v16 setAlpha:1.0 - v10];

  if (v5 && ![(UITableViewCell *)self _hidesBottomSeparatorWhenUnselected])
  {
    [(UIView *)self->_separatorView setAlpha:1.0];
    [(UIView *)self->_topSeparatorView setAlpha:1.0];
  }
LABEL_10:
}

void __67__UITableViewCell__highlightForInteraction_fractionComplete_ended___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) selectedBackgroundView];
  [v1 layoutIfNeeded];
}

- (void)_highlightDidEndForInteraction:(id)a3
{
  uint64_t v3 = *(void *)((char *)&self->_tableCellFlags + 4);
  if ((v3 & 0x40000000000000) != 0)
  {
    int v5 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    *(void *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFBFFFFFFFFFFFFFLL;
    *((_WORD *)&self->_tableCellFlags + 6) = v5;
    *((unsigned char *)&self->_tableCellFlags + 14) = BYTE2(v5);
    id v6 = a3;
    if (![(UITableViewCell *)self isHighlighted])
    {
      uint64_t v7 = [(UITableViewCell *)self selectedBackgroundView];
      id v8 = [v7 superview];

      if (v8) {
        [(UITableViewCell *)self showSelectedBackgroundView:0 animated:0];
      }
    }
    id v9 = [(UITableViewCell *)self _tableView];
    [v9 _highlightDidEndForCell:self withInteraction:v6];
  }
}

double __42__UITableViewCell__updateAccessoryMetrics__block_invoke_2(uint64_t a1)
{
  double result = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (result == -1.79769313e308)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [v3 defaultDisclosureLayoutWidthForView:WeakRetained];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;

    return *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

double __42__UITableViewCell__updateAccessoryMetrics__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  int64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _constants];
  [v8 interspaceBetweenInnerAccessoryIdentifier:v6 outerAccessoryIdentifier:v5 forCell:WeakRetained trailingAccessoryGroup:0];
  double v10 = v9;

  return v10;
}

- (void)_setEditingControlsFocusGuide:(id)a3
{
}

- (UIButton)_popupMenuButton
{
  return self->__popupMenuButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__popupMenuButton, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
  objc_storeStrong(&self->_configurationUpdateHandler, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_editingControlsFocusGuide, 0);
  objc_storeStrong((id *)&self->_clearBlendingView, 0);
  objc_storeStrong((id *)&self->_representedIndexPath, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong((id *)&self->_selectionEffects, 0);
  objc_storeStrong((id *)&self->_selectionTintColor, 0);
  objc_storeStrong((id *)&self->_deselectTimer, 0);
  objc_storeStrong((id *)&self->_editableTextField, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_customEditingAccessoryView, 0);
  objc_storeStrong((id *)&self->_customAccessoryView, 0);
  objc_storeStrong((id *)&self->_editingAccessoryView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_accessoryActionPreviewingSegueTemplateStorage, 0);
  objc_storeStrong(&self->_accessoryActionSegueTemplate, 0);
  objc_storeStrong(&self->_selectionSegueTemplate, 0);
  objc_storeStrong(&self->_badge, 0);
  objc_storeStrong((id *)&self->_bottomShadowAnimationView, 0);
  objc_storeStrong((id *)&self->_topShadowAnimationView, 0);
  objc_storeStrong((id *)&self->_floatingSeparatorView, 0);
  objc_storeStrong((id *)&self->_sectionBorderColor, 0);
  objc_storeStrong((id *)&self->_separatorEffect, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_lastNormalBackgroundViewConfiguration, 0);
  objc_storeStrong(&self->_backgroundViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_systemBackgroundView, 0);
  objc_storeStrong(&self->_contentViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_viewForContentConfiguration, 0);
  objc_storeStrong((id *)&self->_selectedOverlayView, 0);
  objc_storeStrong((id *)&self->_multipleSelectionBackgroundView, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_floatingContentView, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong(&self->_editingData, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong(&self->_layoutManager, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->__editingControlTintColors, 0);
}

@end