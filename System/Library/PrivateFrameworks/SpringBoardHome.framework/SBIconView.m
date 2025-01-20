@interface SBIconView
+ (BOOL)_alwaysShowsAccessoryOfType:(int64_t)a3;
+ (BOOL)_shouldAlwaysHaveContentContainerView;
+ (BOOL)allowsLabelAccessoryView;
+ (BOOL)isIconTapGestureRecognizer:(id)a3;
+ (BOOL)showsPopovers;
+ (BOOL)supportsCursorInteraction;
+ (BOOL)supportsDragInteraction;
+ (BOOL)supportsPreviewInteraction;
+ (BOOL)supportsTapGesture;
+ (CAFrameRateRange)_jitterAnimationFrameRateRange;
+ (CGPoint)defaultIconImageCenterForIconImageSize:(CGSize)a3;
+ (CGSize)defaultIconImageSize;
+ (CGSize)defaultIconViewSize;
+ (CGSize)defaultIconViewSizeForIconImageSize:(CGSize)a3 configurationOptions:(unint64_t)a4;
+ (CGSize)maxLabelSizeForIconImageSize:(CGSize)a3;
+ (CGSize)maxLabelSizeForIconImageSize:(CGSize)a3 contentSizeCategory:(id)a4 options:(unint64_t)a5;
+ (CGSize)maxLabelSizeForListLayout:(id)a3 contentSizeCategory:(id)a4 options:(unint64_t)a5;
+ (CGSize)maxLabelSizeForListLayout:(id)a3 iconImageSize:(CGSize)a4 contentSizeCategory:(id)a5 options:(unint64_t)a6;
+ (Class)_closeBoxClassForType:(int64_t)a3;
+ (Class)contentContainerViewClass;
+ (Class)defaultViewClassForAccessoryType:(int64_t)a3;
+ (Class)defaultViewClassForLabelAccessoryType:(int64_t)a3;
+ (NSString)defaultGridSizeClass;
+ (NSString)defaultIconLocation;
+ (double)_defaultDragInteractionLiftDelay;
+ (double)_labelHeight;
+ (double)defaultIconImageCornerRadius;
+ (double)defaultIconImageScale;
+ (double)defaultMaxLabelHeight;
+ (double)defaultMaxLabelWidthDeltaForContentSizeCategory:(id)a3;
+ (double)iconLiftAlpha;
+ (double)labelAccessoryViewAdditionalRightMarginForType:(int64_t)a3;
+ (double)labelAccessoryViewBaseRightMargin;
+ (double)labelMaximumHeightForContentSizeCategory:(id)a3;
+ (id)_jitterRampDownAnimationWithAnimation:(id)a3;
+ (id)_jitterRotationAnimationWithAmount:(double)a3;
+ (id)_jitterRotationAnimationWithStrength:(double)a3;
+ (id)_jitterXTranslationAnimationWithAmount:(double)a3;
+ (id)_jitterXTranslationAnimationWithStrength:(double)a3;
+ (id)_jitterYTranslationAnimationWithAmount:(double)a3;
+ (id)_jitterYTranslationAnimationWithStrength:(double)a3;
+ (id)applicationIconMultitaskingMenu;
+ (id)applicationIconMultitaskingMenus;
+ (id)applicationIconSplitViewMenu;
+ (id)applicationIconStageManagerMenu;
+ (id)applicationShortcutService;
+ (id)componentBackgroundView;
+ (id)componentBackgroundViewOfType:(int64_t)a3;
+ (id)componentBackgroundViewOfType:(int64_t)a3 compatibleWithTraitCollection:(id)a4 initialWeighting:(double)a5;
+ (id)debugContinuityItem;
+ (id)defaultLegibilitySettings;
+ (id)dragContextForDragItem:(id)a3;
+ (id)draggedItemBundleIdentifiersInDrag:(id)a3;
+ (id)groupNameBaseForComponentBackgroundViewOfType:(int64_t)a3;
+ (id)homeScreenService;
+ (id)labelConfigurationForListLayout:(id)a3 contentSizeCategory:(id)a4 options:(unint64_t)a5;
+ (int64_t)closeBoxTypeForView:(id)a3;
+ (int64_t)defaultWidgetBackgroundRecipe;
+ (unint64_t)defaultImageLoadingBehavior;
+ (unsigned)_jitterAnimationHighFrameRateReason;
+ (void)activateShortcut:(id)a3 withBundleIdentifier:(id)a4 forIconView:(id)a5;
+ (void)configureLabelImageParametersBuilder:(id)a3 forIcon:(id)a4 location:(id)a5;
+ (void)setDebugContinuityItem:(id)a3;
- (APSubjectMonitorSubscription)appPrototectionSubjectMonitorSubscription;
- (BOOL)_contextMenuInteractionShouldAllowDragAfterDismiss:(id)a3;
- (BOOL)_debugContinuity;
- (BOOL)_delegateTapAllowed;
- (BOOL)_dragInteraction:(id)a3 canExcludeCompetingGestureRecognizer:(id)a4;
- (BOOL)_dragInteraction:(id)a3 competingGestureRecognizerShouldDelayLift:(id)a4;
- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4;
- (BOOL)_hasPopover;
- (BOOL)_hideIconLabelForContextMenu;
- (BOOL)_hideIconLabelForCustomIconImageViewController;
- (BOOL)_isCursorInteractionEnabled;
- (BOOL)_isFolderIconFreezingSupported;
- (BOOL)_isForcingIconContentScalingEnabled;
- (BOOL)_isShowingAccessoryView;
- (BOOL)_isShowingCloseBox;
- (BOOL)_selfOrCustomViewCanBecomeFocused;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_shouldEnableGroupBlending;
- (BOOL)_shouldHaveContentContainerView;
- (BOOL)_shouldShowLabel;
- (BOOL)allIconElementsButLabelHidden;
- (BOOL)allowsAccessoryView;
- (BOOL)allowsAdornmentsOverIconImage;
- (BOOL)allowsBlockedForScreenTimeExpiration;
- (BOOL)allowsCloseBox;
- (BOOL)allowsContextMenus;
- (BOOL)allowsCustomIconImageViewController;
- (BOOL)allowsEditingAnimation;
- (BOOL)allowsIconImageView;
- (BOOL)allowsLabelAccessoryView;
- (BOOL)allowsLabelArea;
- (BOOL)allowsPassthroughHitTesting;
- (BOOL)allowsProgressState;
- (BOOL)allowsResizeHandle;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)canBeginDrags;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canReceiveGrabbedIcon:(id)a3;
- (BOOL)canShowAccessoryView;
- (BOOL)canShowCloseBox;
- (BOOL)canShowResizeHandle;
- (BOOL)closeBoxShouldTrack:(id)a3;
- (BOOL)disallowCursorInteraction;
- (BOOL)displaysIconStatusInLabel;
- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)dragsSupportSystemDragsByDefault;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)focusProxyCanBecomeFocused;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)iconImageSizeMatchesBoundsSize;
- (BOOL)isAddedToDrag;
- (BOOL)isAnimatingScrolling;
- (BOOL)isCancelingDrag;
- (BOOL)isContextMenuInteractionActive;
- (BOOL)isCrossfadingImageWithView;
- (BOOL)isCursorActive;
- (BOOL)isCustomIconImageViewHitTestingDisabled;
- (BOOL)isDragLifted;
- (BOOL)isDragging;
- (BOOL)isDropping;
- (BOOL)isEditing;
- (BOOL)isEnabled;
- (BOOL)isFolderIcon;
- (BOOL)isFolderIconFrozen;
- (BOOL)isGrabbed;
- (BOOL)isHighlighted;
- (BOOL)isIconContentScalingEnabled;
- (BOOL)isIconImageViewBorrowed;
- (BOOL)isLabelAccessoryHidden;
- (BOOL)isLabelHidden;
- (BOOL)isOverlapping;
- (BOOL)isPaused;
- (BOOL)isResizing;
- (BOOL)isShowingConfigurationCard;
- (BOOL)isShowingResizeHandle;
- (BOOL)isShowingStackConfigurationCard;
- (BOOL)isTimedOut;
- (BOOL)isTouchDownInIcon;
- (BOOL)lastContextMenuInteractionFailedToLoad;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)refusesRecipientStatus;
- (BOOL)sharesIconTintColorWithSpringBoard;
- (BOOL)shouldActivateApplicationShortcutItem:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)shouldAnimateFrameOfIconImageView;
- (BOOL)shouldPutAccessoryViewInsideImageView;
- (BOOL)shouldShowCloseBox;
- (BOOL)shouldShowLabelAccessoryView;
- (BOOL)shouldShowResizeHandle;
- (BOOL)shouldTapGestureRecognizeAlongsideDragInteractionGestures;
- (BOOL)shouldUpdateFrameOfIconImageView;
- (BOOL)showsDropGlow;
- (BOOL)showsImageAndLabelDuringDrop;
- (BOOL)showsSquareCorners;
- (BOOL)startsDragMoreQuickly;
- (BOOL)supportsConfigurationCard;
- (BOOL)supportsStackConfigurationCard;
- (BOOL)suppressesDefaultEditingAnimation;
- (BOOL)usesSceneUserInterfaceStyleForImage;
- (BOOL)wantsFocusProxyView;
- (BSInvalidatable)homeButtonPressConsumingAssertion;
- (BSInvalidatable)springBoardIconStyleObservation;
- (CGPoint)_centerForAccessoryView;
- (CGPoint)_centerForCloseBox;
- (CGPoint)_centerForResizeHandle;
- (CGPoint)_focusEffectCenter;
- (CGPoint)iconImageCenter;
- (CGRect)_focusEffectBounds;
- (CGRect)_focusEffectBoundsForFocused:(BOOL)a3 withFocusOutset:(double)a4;
- (CGRect)_frameForImageView;
- (CGRect)_frameForLabel;
- (CGRect)_frameForLabelAccessory;
- (CGRect)_frameForLabelAccessoryViewWithLabelFrame:(CGRect)a3 labelImage:(id)a4 labelImageParameters:(id)a5 imageFrame:(CGRect)a6;
- (CGRect)_frameForLabelHighlight;
- (CGRect)_frameForVisibleImage;
- (CGRect)contentBoundingRectForConfigurationInteraction:(id)a3;
- (CGRect)frameForMiniIconAtIndex:(unint64_t)a3;
- (CGRect)iconImageFrame;
- (CGRect)iconImageVisibleFrame;
- (CGRect)visibleImageRelativeFrameForMiniIconAtIndex:(unint64_t)a3;
- (CGSize)accessorySize;
- (CGSize)iconImageVisibleSize;
- (CGSize)iconViewSize;
- (CGSize)iconViewSizeForIconImageSize:(CGSize)a3;
- (CGSize)maxLabelSize;
- (Class)expectedIconImageViewClass;
- (NSArray)applicationShortcutItems;
- (NSArray)effectiveApplicationShortcutItems;
- (NSArray)fetchedApplicationShortcutItems;
- (NSCopying)overrideBadgeNumberOrString;
- (NSDate)lastTouchDownDate;
- (NSString)applicationBundleIdentifierForShortcuts;
- (NSString)backgroundViewGroupNameBase;
- (NSString)description;
- (NSString)location;
- (NSString)representedFolderIconLocation;
- (NSURL)applicationBundleURLForShortcuts;
- (SBFolderIcon)folderIcon;
- (SBFolderIconImageCache)folderIconImageCache;
- (SBHIconGridSizeClassDomain)gridSizeClassDomain;
- (SBHIconImageAppearance)overrideAccessoryIconImageAppearance;
- (SBHIconImageAppearance)overrideIconImageAppearance;
- (SBHIconImageCache)iconImageCache;
- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration;
- (SBHIconImageStyleConfiguration)springBoardIconImageStyleConfiguration;
- (SBHIconResizeHandle)resizeHandle;
- (SBHIconViewConfigurationInteraction)currentConfigurationInteraction;
- (SBHIconViewConfigurationInteraction)currentStackConfigurationInteraction;
- (SBIcon)icon;
- (SBIconApproximateLayoutPosition)approximateLayoutPosition;
- (SBIconContinuityInfo)continuityInfo;
- (SBIconContinuityItem)continuityItem;
- (SBIconImageInfo)iconImageInfo;
- (SBIconLabelView)labelView;
- (SBIconLabelViewFactory)iconLabelViewFactory;
- (SBIconListLayout)listLayout;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconView)initWithConfigurationOptions:(unint64_t)a3;
- (SBIconView)initWithConfigurationOptions:(unint64_t)a3 listLayoutProvider:(id)a4;
- (SBIconView)initWithFrame:(CGRect)a3;
- (SBIconViewActionDelegate)overrideActionDelegate;
- (SBIconViewAssertion)borrowedIconImageViewAssertion;
- (SBIconViewCustomImageViewControlling)customIconImageViewController;
- (SBIconViewCustomImageViewControlling)overrideCustomIconImageViewController;
- (SBIconViewDelegate)delegate;
- (SBIconViewDragDelegate)overrideDraggingDelegate;
- (SBIconViewResizeGestureHandling)resizeGestureHandler;
- (UIColor)accessibilityTintColor;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIDragInteraction)dragInteraction;
- (UIDragSession)liftingDragSession;
- (UIDropInteraction)dropInteraction;
- (UIEdgeInsets)cursorHitTestPadding;
- (UIFont)labelFont;
- (UIImage)iconImageSnapshot;
- (UIImage)overrideImage;
- (UILongPressGestureRecognizer)editingModeGestureRecognizer;
- (UIPointerInteraction)accessoryViewCursorInteraction;
- (UIPointerInteraction)closeBoxCursorInteraction;
- (UIPointerInteraction)iconViewCursorInteraction;
- (UIPointerInteraction)resizeHandleCursorInteraction;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UITraitChangeRegistration)windowSceneUserInterfaceStyleChangeRegistration;
- (UIView)contentContainerView;
- (UIView)focusProxyView;
- (UIView)folderIconBackgroundView;
- (UIView)iconImageSnapshotView;
- (UIView)labelAccessoryView;
- (UIViewPropertyAnimator)accessoryViewAnimator;
- (UIViewPropertyAnimator)closeBoxAnimator;
- (_UILegibilitySettings)legibilitySettings;
- (double)_additionalLiftScale;
- (double)_continuousCornerRadius;
- (double)_labelBaselineOffsetFromImage;
- (double)_labelVerticalOffset;
- (double)baselineOffsetFromBottom;
- (double)dragInteractionLiftDelay;
- (double)editingAnimationStrength;
- (double)effectiveBrightness;
- (double)effectiveIconAccessoryAlpha;
- (double)effectiveIconContentScale;
- (double)effectiveIconImageAlpha;
- (double)effectiveIconLabelAlpha;
- (double)effectiveOverallAlpha;
- (double)iconAccessoryAlpha;
- (double)iconContentScale;
- (double)iconImageAlpha;
- (double)iconImageCornerRadius;
- (double)iconLabelAlpha;
- (double)labelAccessoryTotalWidth;
- (double)lastLineBaseline;
- (double)verticalMarginPercentageForConfigurationInteraction:(id)a3;
- (id)URLsForDropSession:(id)a3;
- (id)_automationID;
- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4;
- (id)_contextMenuInteraction:(id)a3 previewForIconWithConfigurationOptions:(unint64_t)a4 highlighted:(BOOL)a5;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4;
- (id)_folderIconImageView;
- (id)_iconImageView;
- (id)_labelHidingReason;
- (id)_labelImage;
- (id)_labelImageParameters;
- (id)_legibilitySettingsWithParameters:(id)a3;
- (id)_legibilitySettingsWithPrimaryColor:(id)a3;
- (id)_legibilitySettingsWithStyle:(int64_t)a3 primaryColor:(id)a4;
- (id)_makeIconImageView;
- (id)_makeResizeHandle;
- (id)_multitaskingAppShortcutService;
- (id)_pointerStyleForAppIcon;
- (id)_pointerStyleForLibraryAdditionalItemsIndicatorIcon;
- (id)_pointerStyleForWidgetIcon;
- (id)_visiblyActiveDataSource;
- (id)accessoryViewContainerView;
- (id)actionDelegate;
- (id)badgeParallaxSettings;
- (id)badgeString;
- (id)behaviorDelegate;
- (id)borrowIconImageView;
- (id)borrowIconImageViewWithOptions:(unint64_t)a3;
- (id)claimBindingsForDropSession:(id)a3;
- (id)configurationUIDelegate;
- (id)containerViewControllerForConfigurationInteraction:(id)a3;
- (id)containerViewForConfigurationInteraction:(id)a3;
- (id)contentSizeCategory;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)createNewIconLabelViewFactory;
- (id)currentImageView;
- (id)defaultDragPreview;
- (id)defaultDragPreviewWithParameters:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)disableImageUpdatesForReason:(id)a3;
- (id)disallowContextMenusForReason:(id)a3;
- (id)displayedLabelFont;
- (id)dragDelegate;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragItems;
- (id)dragPreviewForItem:(id)a3 session:(id)a4;
- (id)draggingLaunchActions;
- (id)draggingLaunchURL;
- (id)dropDelegate;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)effectiveAccessoryIconImageAppearance;
- (id)effectiveIconImageAppearance;
- (id)effectiveIconImageStyleConfiguration;
- (id)effectiveListLayoutProvider;
- (id)effectiveOverrideAccessoryIconImageAppearance;
- (id)effectiveOverrideIconImageAppearance;
- (id)extendResizingFinish;
- (id)folder;
- (id)gridSizeClass;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)homeScreenContentViewForConfigurationInteraction:(id)a3;
- (id)iconGridSizeClassSizes;
- (id)labelConfiguration;
- (id)labelImageWithParameters:(id)a3;
- (id)markAsDropping;
- (id)matchingIconViewByAddingConfigurationOptions:(unint64_t)a3 removingConfigurationOptions:(unint64_t)a4;
- (id)matchingIconViewWithConfigurationOptions:(unint64_t)a3;
- (id)newCaptureOnlyBackgroundView;
- (id)newComponentBackgroundViewOfType:(int64_t)a3;
- (id)nextLargerGridSizeClassForResize;
- (id)nextSmallerGridSizeClassForResize;
- (id)pauseReasonsDescriptions;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)prepareForIconDrop;
- (id)recentsDocumentExtensionProvider;
- (id)representativeIconViewForModalInteractions;
- (id)reuseDelegate;
- (id)shortcutsDelegate;
- (id)startForbiddingAccessoryUpdatesWithReason:(id)a3 animated:(BOOL)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)supportedIconGridSizeClasses;
- (id)supportedIconGridSizeClassesForResize;
- (id)tintColor;
- (id)traitCollectionForIconImageAppearance;
- (int64_t)_closeBoxType;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)_widgetBackgroundMaterialForDataSource:(id)a3;
- (int64_t)currentAccessoryType;
- (int64_t)currentLabelAccessoryType;
- (int64_t)displayedLabelAccessoryType;
- (int64_t)draggingStartLocation;
- (int64_t)labelStyle;
- (int64_t)orientation;
- (int64_t)progressState;
- (int64_t)userInterfaceStyleForConfigurationInteraction:(id)a3;
- (unint64_t)centerVisibleMiniIconIndex;
- (unint64_t)configurationOptions;
- (unint64_t)contentVisibility;
- (unint64_t)customIconImageViewControllerPresentationMode;
- (unint64_t)customIconImageViewControllerPriority;
- (unint64_t)debugIconIndex;
- (unint64_t)firstVisibleMiniIconIndex;
- (unint64_t)folderBackgroundStyle;
- (unint64_t)imageLoadingBehavior;
- (unint64_t)lastVisibleMiniIconIndex;
- (unint64_t)userVisibilityStatus;
- (unint64_t)visibleMiniIconCount;
- (unint64_t)visibleMiniIconListIndex;
- (void)_accessoryViewTapGestureChanged:(id)a3;
- (void)_acquireHomeButtonPressConsumingAssertionIfNecessary;
- (void)_addDefaultJitterAnimationsAnimated:(BOOL)a3;
- (void)_addJitterAnimated:(BOOL)a3;
- (void)_animateCloseBoxWithAnimation:(int64_t)a3 animationBlock:(id)a4;
- (void)_applyEditingStateAnimated:(BOOL)a3;
- (void)_applyIconAccessoryAlpha:(double)a3;
- (void)_applyIconContentScale:(double)a3;
- (void)_applyIconEditingSettings;
- (void)_applyIconImageAlpha:(double)a3;
- (void)_applyIconLabelAlpha:(double)a3;
- (void)_applyOverallAlpha:(double)a3;
- (void)_backgroundContrastDidChange:(id)a3;
- (void)_boldTextStatusDidChange:(id)a3;
- (void)_checkAndRemoveCloseBoxAfterAnimation;
- (void)_closeBoxTapGestureChanged:(id)a3;
- (void)_configureIconImageView:(id)a3;
- (void)_configureLabelAccessoryViewForType:(int64_t)a3;
- (void)_configureResizeAction:(id)a3 forGridSizeClass:(id)a4 withSelectedGridSizeClass:(id)a5 withIconSupportedGridSizeClasses:(id)a6;
- (void)_configureViewAsFolderIconImageView:(id)a3;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_contextMenuConfigurationDidDismiss:(id)a3;
- (void)_contextMenuConfigurationDidPresent:(id)a3;
- (void)_contextMenuConfigurationWillDismiss:(id)a3;
- (void)_contextMenuConfigurationWillPresent:(id)a3 forInteraction:(id)a4;
- (void)_createAccessoryViewIfNecessary;
- (void)_createCloseBoxIfNecessary;
- (void)_delegateTouchEnded:(BOOL)a3;
- (void)_destroyAccessoryView;
- (void)_destroyAccessoryView:(id)a3;
- (void)_destroyIconImageView;
- (void)_disableContentContainerView;
- (void)_dragInteraction:(id)a3 liftAnimationDidChangeDirection:(int64_t)a4;
- (void)_enableContentContainerView;
- (void)_fetchApplicationShortcutItemsIfAppropriate;
- (void)_handleActivateAppExposeKeyShortcut:(id)a3;
- (void)_handleAddWindowToSetCommand:(id)a3;
- (void)_handleMakeFullscreenKeyShortcut:(id)a3;
- (void)_handleMakeSplitLeftKeyShortcut:(id)a3;
- (void)_handleMakeSplitRightKeyShortcut:(id)a3;
- (void)_handleTap;
- (void)_handleTapWithModifierFlags:(int64_t)a3;
- (void)_initiateResizeToSmallerSize:(BOOL)a3 completionHandler:(id)a4;
- (void)_insertIconImageView:(id)a3;
- (void)_invalidateHomeButtonPressConsumingAssertion;
- (void)_notifyObserversDidDiscardCustomImageViewController:(id)a3;
- (void)_notifyObserversSizeDidChange;
- (void)_rampDownJitterAnimationForKey:(id)a3 rampKey:(id)a4 animated:(BOOL)a5;
- (void)_rampUpJitterAnimation:(id)a3 animationKey:(id)a4 rampKey:(id)a5 animated:(BOOL)a6;
- (void)_refreshAccessoryViewNotification:(id)a3;
- (void)_removeDefaultJitterAnimationsAnimated:(BOOL)a3;
- (void)_removeJitterAnimated:(BOOL)a3;
- (void)_removeUnknownSubviews;
- (void)_setForcingIconContentScalingEnabled:(BOOL)a3;
- (void)_setShowingAccessoryView:(BOOL)a3;
- (void)_setShowingCloseBox:(BOOL)a3;
- (void)_setTemporarySnapshotViewForDragPreview:(id)a3;
- (void)_startTrackingSupportedMultitaskingShortcutActionsIfAppropriateWithOldIcon:(id)a3;
- (void)_toggleContentContainerViewIfNecessary;
- (void)_toggleGroupBlendingIfNecessary;
- (void)_updateAccessoryViewAnimated:(BOOL)a3;
- (void)_updateAfterManualIconImageInfoChangeInvalidatingLayout:(BOOL)a3;
- (void)_updateAllComponentAlphas;
- (void)_updateAllComponentAlphasAnimated:(BOOL)a3;
- (void)_updateBrightness;
- (void)_updateCloseBoxAnimated:(BOOL)a3;
- (void)_updateCloseBoxWithAnimation:(int64_t)a3;
- (void)_updateConfigurationForIconImageView:(id)a3;
- (void)_updateCursorInteractionsEnabled;
- (void)_updateCustomIconImageViewController:(BOOL)a3;
- (void)_updateCustomIconImageViewControllerHitTesting;
- (void)_updateDragInteractionLiftDelay;
- (void)_updateFrameToIconViewSize;
- (void)_updateIconContentScale;
- (void)_updateIconImageAdornmentsAnimated:(BOOL)a3;
- (void)_updateIconImageViewAnimated:(BOOL)a3;
- (void)_updateJitter;
- (void)_updateJitter:(BOOL)a3;
- (void)_updateJitter:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateJitterAnimated:(BOOL)a3;
- (void)_updateLabel;
- (void)_updateLabelAccessoryView;
- (void)_updateLabelAnimated:(BOOL)a3;
- (void)_updateLabelArea;
- (void)_updateLabelAreaAnimated:(BOOL)a3;
- (void)_updateLaunchDisabled;
- (void)_updateProgressAnimated:(BOOL)a3;
- (void)_updateResizeHandleAnimated:(BOOL)a3;
- (void)addGesturesAndInteractionsIfNecessary;
- (void)addObserver:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)cancelDrag;
- (void)cancelDragLift;
- (void)cleanUpAfterDropAnimation;
- (void)cleanupAfterCrossfade;
- (void)cleanupAfterFloatyFolderCrossfade;
- (void)clearIconImageInfo;
- (void)configurationInteractionDidBegin:(id)a3;
- (void)configurationInteractionDidCommit:(id)a3;
- (void)configurationInteractionDidEnd:(id)a3;
- (void)configurationInteractionWillBegin:(id)a3;
- (void)configurationInteractionWillEnd:(id)a3;
- (void)configureCustomIconImageViewController:(id)a3;
- (void)configureForLabelAllowed:(BOOL)a3;
- (void)configureLabelImageParametersBuilder:(id)a3;
- (void)configureMatchingIconView:(id)a3;
- (void)consumeSinglePressUpForButtonKind:(int64_t)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)dismissConfigurationCard;
- (void)dismissConfigurationCardImmediately;
- (void)dismissContextMenuWithCompletion:(id)a3;
- (void)dismissStackConfigurationCard;
- (void)dismissStackConfigurationCardImmediately;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6;
- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)dragSession:(id)a3 didEndWithOperation:(unint64_t)a4;
- (void)dragSession:(id)a3 willEndWithOperation:(unint64_t)a4;
- (void)dragSessionWillBegin:(id)a3;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)earlyTerminateContextMenuDismissAnimation;
- (void)editingModeGestureRecognizerDidFire:(id)a3;
- (void)endForbiddingEditingModeWithReason:(id)a3;
- (void)homeScreenService:(id)a3 homeScreenIconStyleConfigurationDidChange:(id)a4;
- (void)iconAccessoriesDidUpdate:(id)a3;
- (void)iconImageDidUpdate:(id)a3;
- (void)iconInteractedWhenDisabled;
- (void)iconLaunchEnabledDidChange:(id)a3;
- (void)layoutSubviews;
- (void)performAfterContextMenusDismissUsingBlock:(id)a3;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)popConfigurationCard;
- (void)popStackConfigurationCard;
- (void)prepareForReuse;
- (void)prepareToCrossfadeImageWithView:(id)a3 anchorPoint:(CGPoint)a4 options:(unint64_t)a5;
- (void)prepareToCrossfadeImageWithView:(id)a3 options:(unint64_t)a4;
- (void)prepareToCrossfadeWithFloatyFolderView:(id)a3 allowFolderInteraction:(BOOL)a4;
- (void)presentConfigurationCard;
- (void)presentStackConfigurationCard;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)purgeCachedEditingViewData;
- (void)removeAllIconAnimations;
- (void)removeAssertion:(id)a3;
- (void)removeBorrowedIconImageViewAssertion:(id)a3;
- (void)removeDroppingAssertion:(id)a3;
- (void)removeExtendResizeFinishAssertion:(id)a3;
- (void)removeForbidAccessoryUpdatesAssertion:(id)a3;
- (void)removeForbidContextMenusAssertion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resetOverridesOnCustomIconImageViewController:(id)a3;
- (void)resizeGestureRecognizerDidUpdate:(id)a3;
- (void)scrollToFirstGapAnimated:(BOOL)a3;
- (void)scrollToGapOrTopIfFullOfPage:(unint64_t)a3 animated:(BOOL)a4;
- (void)scrollToTopOfFirstPageAnimated:(BOOL)a3;
- (void)scrollToTopOfPage:(unint64_t)a3 animated:(BOOL)a4;
- (void)setAccessibilityTintColor:(id)a3;
- (void)setAccessoryViewAnimator:(id)a3;
- (void)setAddedToDrag:(BOOL)a3;
- (void)setAllIconElementsButLabelHidden:(BOOL)a3;
- (void)setAllowsAccessoryView:(BOOL)a3;
- (void)setAllowsAdornmentsOverIconImage:(BOOL)a3;
- (void)setAllowsAdornmentsOverIconImage:(BOOL)a3 animated:(BOOL)a4;
- (void)setAllowsBlockedForScreenTimeExpiration:(BOOL)a3;
- (void)setAllowsCloseBox:(BOOL)a3;
- (void)setAllowsCloseBox:(BOOL)a3 withAnimation:(int64_t)a4;
- (void)setAllowsEditingAnimation:(BOOL)a3;
- (void)setAllowsIconImageView:(BOOL)a3;
- (void)setAllowsLabelArea:(BOOL)a3;
- (void)setAllowsPassthroughHitTesting:(BOOL)a3;
- (void)setAllowsProgressState:(BOOL)a3;
- (void)setAllowsResizeHandle:(BOOL)a3;
- (void)setAppPrototectionSubjectMonitorSubscription:(id)a3;
- (void)setApplicationShortcutItems:(id)a3;
- (void)setApproximateLayoutPosition:(SBIconApproximateLayoutPosition)a3;
- (void)setBackgroundAndIconGridImageAlpha:(double)a3;
- (void)setBorrowedIconImageViewAssertion:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setBoundsSizeFromIconImageSize:(CGSize)a3;
- (void)setCancelingDrag:(BOOL)a3;
- (void)setCloseBoxAnimator:(id)a3;
- (void)setConfigurationOptions:(unint64_t)a3;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setContinuityInfo:(id)a3;
- (void)setContinuityInfo:(id)a3 animated:(BOOL)a4;
- (void)setCrossfadeCornerRadius:(double)a3;
- (void)setCrossfadeFraction:(double)a3;
- (void)setCrossfadeViewFadeFraction:(double)a3;
- (void)setCurrentConfigurationInteraction:(id)a3;
- (void)setCurrentImageStyleAsOverridesOnCustomIconImageViewController:(id)a3;
- (void)setCurrentStackConfigurationInteraction:(id)a3;
- (void)setCursorHitTestPadding:(UIEdgeInsets)a3;
- (void)setCustomIconImageViewController:(id)a3;
- (void)setCustomIconImageViewController:(id)a3 clearingOwner:(BOOL)a4;
- (void)setCustomIconImageViewControllerPresentationMode:(unint64_t)a3;
- (void)setCustomIconImageViewControllerPriority:(unint64_t)a3;
- (void)setCustomIconImageViewHitTestingDisabled:(BOOL)a3;
- (void)setDebugIconIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisallowCursorInteraction:(BOOL)a3;
- (void)setDisplaysIconStatusInLabel:(BOOL)a3;
- (void)setDragLifted:(BOOL)a3;
- (void)setDragging:(BOOL)a3;
- (void)setDragging:(BOOL)a3 updateImmediately:(BOOL)a4;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditingAnimationStrength:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFetchedApplicationShortcutItems:(id)a3;
- (void)setFloatyFolderCrossfadeFraction:(double)a3;
- (void)setFolderBackgroundStyle:(unint64_t)a3;
- (void)setFolderIcon:(id)a3;
- (void)setFolderIconBackgroundView:(id)a3;
- (void)setFolderIconFrozen:(BOOL)a3;
- (void)setFolderIconImageCache:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGrabbed:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHomeButtonPressConsumingAssertion:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIcon:(id)a3 animated:(BOOL)a4;
- (void)setIconAccessoryAlpha:(double)a3;
- (void)setIconContentScale:(double)a3;
- (void)setIconContentScalingEnabled:(BOOL)a3;
- (void)setIconFadeFraction:(double)a3;
- (void)setIconGridImageAlpha:(double)a3;
- (void)setIconImageAlpha:(double)a3;
- (void)setIconImageAndAccessoryAlpha:(double)a3;
- (void)setIconImageCache:(id)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setIconImageSizeMatchesBoundsSize:(BOOL)a3;
- (void)setIconLabelAlpha:(double)a3;
- (void)setIconLabelViewFactory:(id)a3;
- (void)setImageLoadingBehavior:(unint64_t)a3;
- (void)setLabelAccessoryHidden:(BOOL)a3;
- (void)setLabelFont:(id)a3;
- (void)setLabelHidden:(BOOL)a3;
- (void)setLabelStyle:(int64_t)a3;
- (void)setLastContextMenuInteractionFailedToLoad:(BOOL)a3;
- (void)setLastTouchDownDate:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLiftingDragSession:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4;
- (void)setLocation:(id)a3;
- (void)setLocation:(id)a3 animated:(BOOL)a4;
- (void)setMorphFraction:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOverlapping:(BOOL)a3;
- (void)setOverrideAccessoryIconImageAppearance:(id)a3;
- (void)setOverrideActionDelegate:(id)a3;
- (void)setOverrideBadgeNumberOrString:(id)a3;
- (void)setOverrideBadgeNumberOrString:(id)a3 animated:(BOOL)a4;
- (void)setOverrideCustomIconImageViewController:(id)a3;
- (void)setOverrideDraggingDelegate:(id)a3;
- (void)setOverrideIconImageAppearance:(id)a3;
- (void)setOverrideIconImageStyleConfiguration:(id)a3;
- (void)setOverrideImage:(id)a3;
- (void)setOverrideImageAppearance:(id)a3 onCustomIconImageViewController:(id)a4;
- (void)setOverrideImageStyleConfiguration:(id)a3 onCustomIconImageViewController:(id)a4;
- (void)setPaused:(BOOL)a3;
- (void)setPaused:(BOOL)a3 forReason:(unint64_t)a4;
- (void)setRefusesRecipientStatus:(BOOL)a3;
- (void)setResizeGestureHandler:(id)a3;
- (void)setResizeHandle:(id)a3;
- (void)setResizing:(BOOL)a3;
- (void)setSharesIconTintColorWithSpringBoard:(BOOL)a3;
- (void)setShowsDropGlow:(BOOL)a3 animator:(id)a4;
- (void)setShowsFocusEffect:(BOOL)a3;
- (void)setShowsImageAndLabelDuringDrop:(BOOL)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)setSpringBoardIconImageStyleConfiguration:(id)a3;
- (void)setSpringBoardIconStyleObservation:(id)a3;
- (void)setStartsDragMoreQuickly:(BOOL)a3;
- (void)setSuppressesDefaultEditingAnimation:(BOOL)a3;
- (void)setTouchDownInIcon:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setUserVisibilityStatus:(unint64_t)a3;
- (void)setUsesSceneUserInterfaceStyleForImage:(BOOL)a3;
- (void)setWantsFocusProxyView:(BOOL)a3;
- (void)setWindowSceneUserInterfaceStyleChangeRegistration:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)setupFocusEffectPlatterView;
- (void)startForbiddingEditingModeWithReason:(id)a3;
- (void)stealIconImageView;
- (void)tapGestureDidChange:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateAccessoryViewContainerIfNecessary;
- (void)updateAccessoryViewOverrideIconImageAppearance;
- (void)updateCustomIconImageViewController;
- (void)updateParallaxSettings;
- (void)updateWindowSceneUserInterfaceStyleChangeRegistrationForWindow:(id)a3;
- (void)willMoveToWindow:(id)a3;
- (void)windowSceneUserInterfaceStyleChanged;
@end

@implementation SBIconView

- (void)_updateCloseBoxAnimated:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  [(SBIconView *)self _updateCloseBoxWithAnimation:v3];
}

- (BOOL)allowsLabelAccessoryView
{
  int v3 = [(id)objc_opt_class() allowsLabelAccessoryView];
  if (v3) {
    LOBYTE(v3) = ![(SBIconView *)self isFolderIcon];
  }
  return v3;
}

- (BOOL)isFolderIcon
{
  v2 = [(SBIconView *)self icon];
  char v3 = [v2 isFolderIcon];

  return v3;
}

- (int64_t)currentLabelAccessoryType
{
  if ((*((unsigned char *)self + 547) & 4) != 0 || ![(SBIconView *)self allowsLabelAccessoryView]) {
    return 0;
  }
  int64_t result = [(SBIcon *)self->_icon labelAccessoryType];
  if (result == 4)
  {
    if ([(SBIconView *)self allowsBlockedForScreenTimeExpiration]) {
      return 4;
    }
    else {
      return 0;
    }
  }
  return result;
}

+ (BOOL)allowsLabelAccessoryView
{
  return 1;
}

- (int64_t)currentAccessoryType
{
  if (![(SBIconView *)self allowsAccessoryView]) {
    return 0;
  }
  char v3 = [(SBIconView *)self icon];
  v4 = [(SBIconView *)self location];
  uint64_t v5 = [v3 accessoryTypeForLocation:v4];
  v6 = [(SBIconView *)self overrideBadgeNumberOrString];
  if (v6) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v5;
  }
  if ([(SBIconView *)self _debugContinuity]) {
    unint64_t v8 = 2;
  }
  else {
    unint64_t v8 = v7;
  }
  if (v8 <= 1)
  {
    v9 = [(SBIconView *)self continuityInfo];
    if (v9)
    {

LABEL_13:
      unint64_t v8 = 2;
      goto LABEL_14;
    }
    unint64_t v8 = v7;
    if ([(SBIconView *)self _debugContinuity]) {
      goto LABEL_13;
    }
  }
LABEL_14:
  v10 = [(SBIconView *)self behaviorDelegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v8 = [v10 iconView:self accessoryTypeWithProposedAccessoryType:v8];
  }

  return v8;
}

- (id)behaviorDelegate
{
  id v3 = [(SBIconView *)self delegate];
  v4 = v3;
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 behaviorDelegateForIconView:self];
  }
  return v4;
}

- (SBIconViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBIconViewDelegate *)WeakRetained;
}

- (SBIconImageInfo)iconImageInfo
{
  id v3 = self;
  if ((BYTE5(self[17].size.width) & 8) == 0)
  {
    v4 = [(SBIconImageInfo *)self listLayoutProvider];
    uint64_t v5 = [(SBIconImageInfo *)v3 iconImageCache];
    v6 = [(SBIconImageInfo *)v3 listLayout];
    uint64_t v7 = [(SBIconImageInfo *)v3 gridSizeClass];
    uint64_t v8 = [(SBIconImageInfo *)v3 orientation];
    if (v4
      || !v5
      || v7 != @"SBHIconGridSizeClassDefault"
      && !-[__CFString isEqualToString:](v7, "isEqualToString:"))
    {
      if (v7)
      {
        if (objc_opt_respondsToSelector())
        {
          [v6 iconImageInfoForGridSizeClass:v7 orientation:v8];
LABEL_17:

          return self;
        }
        if (objc_opt_respondsToSelector())
        {
          [v6 iconImageInfoForGridSizeClass:v7];
          goto LABEL_17;
        }
      }
      if (v6)
      {
        v9 = v6;
LABEL_16:
        [v9 iconImageInfo];
        goto LABEL_17;
      }
      if (!v5)
      {
        [(id)objc_opt_class() defaultIconImageSize];
        [(id)objc_opt_class() defaultIconImageScale];
        [(id)objc_opt_class() defaultIconImageCornerRadius];
        goto LABEL_17;
      }
    }
    v9 = v5;
    goto LABEL_16;
  }
  return self;
}

- (id)effectiveListLayoutProvider
{
  v2 = [(SBIconView *)self listLayoutProvider];
  if (!v2)
  {
    v2 = +[SBHDefaultIconListLayoutProvider frameworkFallbackInstance];
  }
  return v2;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (SBIconListLayout)listLayout
{
  id v3 = [(SBIconView *)self location];
  if (v3)
  {
    v4 = [(SBIconView *)self effectiveListLayoutProvider];
    uint64_t v5 = [v4 layoutForIconLocation:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (SBIconListLayout *)v5;
}

- (NSString)location
{
  return self->_iconLocation;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (id)gridSizeClass
{
  v2 = [(SBIconView *)self icon];
  id v3 = [v2 gridSizeClass];
  if (!v3)
  {
    id v3 = [(id)objc_opt_class() defaultGridSizeClass];
  }

  return v3;
}

- (SBIcon)icon
{
  return self->_icon;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)_debugContinuity
{
  if (!os_variant_has_internal_content()) {
    return 0;
  }
  v2 = [(id)objc_opt_class() debugContinuityItem];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)debugContinuityItem
{
  return (id)__debugContinuityItem;
}

- (BOOL)allowsAccessoryView
{
  return (*((unsigned __int8 *)self + 548) >> 5) & 1;
}

- (SBIconContinuityInfo)continuityInfo
{
  return self->_continuityInfo;
}

- (NSCopying)overrideBadgeNumberOrString
{
  return self->_overrideBadgeNumberOrString;
}

+ (NSString)defaultGridSizeClass
{
  return (NSString *)@"SBHIconGridSizeClassDefault";
}

- (void)setUserVisibilityStatus:(unint64_t)a3
{
  unint64_t v3 = *((unsigned __int8 *)self + 551);
  if (((v3 >> 1) & 3) != a3)
  {
    *((unsigned char *)self + 551) = v3 & 0xF9 | (2 * (a3 & 3));
    id v5 = [(SBIconView *)self customIconImageViewController];
    if (objc_opt_respondsToSelector()) {
      [v5 setUserVisibilityStatus:a3];
    }
  }
}

- (SBIconViewCustomImageViewControlling)customIconImageViewController
{
  return self->_customIconImageViewController;
}

- (BOOL)_hideIconLabelForContextMenu
{
  BOOL v3 = [(SBIconView *)self isShowingContextMenu];
  if (v3) {
    LOBYTE(v3) = ![(NSHashTable *)self->_contextMenuInteractionConfigurations isEqualToHashTable:self->_dismissingContextMenuInteractionConfigurations];
  }
  return v3;
}

- (BOOL)isContextMenuInteractionActive
{
  return [(NSHashTable *)self->_contextMenuInteractionConfigurations count] != 0;
}

+ (CGSize)defaultIconImageSize
{
  double v2 = 50.0;
  double v3 = 50.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)defaultIconImageScale
{
  return 2.0;
}

+ (double)defaultIconImageCornerRadius
{
  return 20.0;
}

- (void)setAllowsIconImageView:(BOOL)a3
{
  unsigned int v3 = *((unsigned __int8 *)self + 546);
  if (a3 != v3 >> 7)
  {
    if (a3) {
      char v4 = 0x80;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 546) = v4 & 0x80 | v3 & 0x7F;
    [(SBIconView *)self _updateIconImageViewAnimated:0];
  }
}

+ (CGPoint)defaultIconImageCenterForIconImageSize:(CGSize)a3
{
  UIRectGetCenter();
  result.y = v4;
  result.x = v3;
  return result;
}

- (NSString)backgroundViewGroupNameBase
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_8;
  }
  double v3 = [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController backgroundViewProvider];
  if (!v3 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    id v5 = 0;
    goto LABEL_10;
  }
  int v4 = [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController wantsCaptureOnlyBackgroundView];

  if (!v4)
  {
LABEL_8:
    id v5 = 0;
    goto LABEL_11;
  }
  id v5 = [(id)objc_opt_class() groupNameBaseForComponentBackgroundViewOfType:4];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_11;
  }
  double v3 = [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController visiblyActiveDataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = @"-Files";
LABEL_16:
    uint64_t v8 = [v5 stringByAppendingString:v6];

    id v5 = (void *)v8;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = @"-AppPrediction";
    goto LABEL_16;
  }
LABEL_10:

LABEL_11:
  return (NSString *)v5;
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(SBIconView *)self _updateFrameToIconViewSize];
  }
}

- (void)setDebugIconIndex:(unint64_t)a3
{
  if (self->_debugIconIndex != a3)
  {
    self->_debugIconIndex = a3;
    iconIndexLabel = self->_iconIndexLabel;
    if (iconIndexLabel)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      [(UILabel *)iconIndexLabel setText:v4];
    }
  }
}

- (void)setCursorHitTestPadding:(UIEdgeInsets)a3
{
  self->_cursorHitTestPadding = a3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(SBIconView *)self currentImageView];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [v7 type];

  if (v17 == 11)
  {
    double top = self->_cursorHitTestPadding.top;
    double left = self->_cursorHitTestPadding.left;
    double v10 = v10 + left;
    double v12 = v12 + top;
    double v14 = v14 - (left + self->_cursorHitTestPadding.right);
    double v16 = v16 - (top + self->_cursorHitTestPadding.bottom);
  }
  v23.origin.CGFloat x = v10;
  v23.origin.CGFloat y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  v22.CGFloat x = x;
  v22.CGFloat y = y;
  BOOL v20 = CGRectContainsPoint(v23, v22);

  return v20;
}

- (CGRect)iconImageFrame
{
  double v2 = [(SBIconView *)self currentImageView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  char v4 = *((unsigned char *)self + 544);
  if ((((v4 & 2) == 0) ^ a3))
  {
    [(SBIconView *)self _updateIconImageAdornmentsAnimated:a4];
  }
  else
  {
    if (a3) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 544) = v4 & 0xFD | v5;
    [(SBIconView *)self _applyEditingStateAnimated:a4];
  }
}

- (void)setIcon:(id)a3
{
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (SBIconListLayoutProvider *)a3;
  if (self->_listLayoutProvider != v7)
  {
    objc_storeStrong((id *)&self->_listLayoutProvider, a3);
    double v8 = self->_customIconImageViewController;
    if (v4)
    {
      [(SBIconImageView *)self->_iconImageView willAnimateIconImageInfoChange];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __45__SBIconView_setListLayoutProvider_animated___block_invoke;
      v12[3] = &unk_1E6AAC810;
      v12[4] = self;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __45__SBIconView_setListLayoutProvider_animated___block_invoke_2;
      v11[3] = &unk_1E6AACAB8;
      v11[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v12 animations:v11 completion:0.3];
    }
    else
    {
      [(SBIconView *)self _updateFrameToIconViewSize];
      [(SBIconImageView *)self->_iconImageView iconImageInfoDidChange];
    }
    [(SBIconView *)self _updateLabelAnimated:v4];
    [(SBIconView *)self _destroyAccessoryView];
    [(SBIconView *)self _updateAccessoryViewAnimated:0];
    closeBoCGFloat x = self->_closeBox;
    double v10 = [(SBIconView *)self listLayout];
    [(SBCloseBoxView *)closeBox setListLayout:v10];

    [(SBIconView *)self iconImageInfo];
    -[SBIconViewCustomImageViewControlling setIconImageInfo:](v8, "setIconImageInfo:");
    if (objc_opt_respondsToSelector()) {
      [(SBIconViewCustomImageViewControlling *)v8 setListLayoutProvider:v7];
    }
  }
}

- (void)setListLayoutProvider:(id)a3
{
}

- (void)setContinuityInfo:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (SBIconContinuityInfo *)a3;
  if (self->_continuityInfo != v7)
  {
    double v8 = v7;
    objc_storeStrong((id *)&self->_continuityInfo, a3);
    [(SBIconView *)self _updateAccessoryViewAnimated:v4];
    double v7 = v8;
  }
}

- (void)setContinuityInfo:(id)a3
{
}

- (void)setOverrideIconImageStyleConfiguration:(id)a3
{
  id v8 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    BOOL v4 = (SBHIconImageStyleConfiguration *)[v8 copy];
    overrideIconImageStyleConfiguration = self->_overrideIconImageStyleConfiguration;
    self->_overrideIconImageStyleConfiguration = v4;

    double v6 = [(SBIconView *)self customIconImageViewController];
    if (v6)
    {
      [(SBIconView *)self setOverrideImageStyleConfiguration:v8 onCustomIconImageViewController:v6];
    }
    else
    {
      double v7 = [(SBIconView *)self _iconImageView];
      [v7 effectiveIconImageAppearanceDidChange];
    }
    [(SBIconView *)self updateAccessoryViewOverrideIconImageAppearance];
  }
}

- (void)updateAccessoryViewOverrideIconImageAppearance
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(SBIconView *)self effectiveOverrideAccessoryIconImageAppearance];
    [(SBIconAccessoryView *)self->_accessoryView setOverrideIconImageAppearance:v3];
  }
}

- (id)_folderIconImageView
{
  double v2 = [(SBIconView *)self _iconImageView];
  id v3 = self;
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v2;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)_iconImageView
{
  return self->_iconImageView;
}

- (id)effectiveIconImageAppearance
{
  id v3 = [(SBIconView *)self overrideIconImageAppearance];
  BOOL v4 = [(SBIconView *)self overrideIconImageStyleConfiguration];
  id v5 = [(SBIconView *)self traitCollectionForIconImageAppearance];
  double v6 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:overrideIconImageAppearance:overrideIconImageStyleConfiguration:", v5, v3, v4);

  return v6;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration
{
  return self->_overrideIconImageStyleConfiguration;
}

- (id)traitCollectionForIconImageAppearance
{
  if (![(SBIconView *)self usesSceneUserInterfaceStyleForImage]) {
    goto LABEL_5;
  }
  id v3 = [(SBIconView *)self window];
  BOOL v4 = [v3 windowScene];

  id v5 = [v4 traitCollection];
  double v6 = [(SBIconView *)self springBoardIconImageStyleConfiguration];
  if (v6)
  {
    uint64_t v7 = [v5 userInterfaceStyle];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_traitCollectionWithIconImageStyleConfiguration:userInterfaceStyle:", v6, v7);

    id v5 = (void *)v8;
  }

  if (!v5)
  {
LABEL_5:
    id v5 = [(SBIconView *)self traitCollection];
  }
  return v5;
}

- (BOOL)usesSceneUserInterfaceStyleForImage
{
  return (*((unsigned __int8 *)self + 552) >> 1) & 1;
}

- (UIImage)overrideImage
{
  return self->_overrideImage;
}

- (CGSize)iconViewSize
{
  [(SBIconView *)self iconImageSize];
  -[SBIconView iconViewSizeForIconImageSize:](self, "iconViewSizeForIconImageSize:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setLocation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    double v6 = (NSString *)[v9 copy];
    iconLocation = self->_iconLocation;
    self->_iconLocation = v6;

    [(SBIconView *)self _updateFrameToIconViewSize];
    [(SBIconView *)self _updateIconImageViewAnimated:v4];
    [(SBIconView *)self _updateLabelAnimated:v4];
    [(SBIconView *)self _updateIconImageAdornmentsAnimated:v4];
    uint64_t v8 = [(SBIconView *)self customIconImageViewController];
    [(SBIconView *)self iconImageInfo];
    objc_msgSend(v8, "setIconImageInfo:");
  }
}

- (void)setLocation:(id)a3
{
}

- (void)clearIconImageInfo
{
  if ((*((unsigned char *)self + 549) & 8) != 0)
  {
    *((unsigned char *)self + 549) &= ~8u;
    [(SBIconView *)self _updateAfterManualIconImageInfoChangeInvalidatingLayout:1];
  }
}

- (void)_applyIconImageAlpha:(double)a3
{
  if (![(SBIconView *)self isIconImageViewBorrowed])
  {
    id v5 = [(SBIconView *)self currentImageView];
    [v5 setAlpha:a3];
  }
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)SBIconView;
  [(SBIconView *)&v23 layoutSubviews];
  [(SBIconView *)self bounds];
  -[UIView setBounds:](self->_scalingContainer, "setBounds:");
  scalingContainer = self->_scalingContainer;
  UIRectGetCenter();
  -[UIView setCenter:](scalingContainer, "setCenter:");
  BOOL v4 = [(SBIconView *)self currentImageView];
  [(SBIconView *)self _frameForImageView];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ([(SBIconView *)self shouldUpdateFrameOfIconImageView]) {
    objc_msgSend(v4, "sbf_setBoundsAndPositionFromFrame:", v6, v8, v10, v12);
  }
  crossfadeView = self->_crossfadeView;
  if (crossfadeView) {
    [(SBIconImageCrossfadeView *)crossfadeView layoutIfNeeded];
  }
  [(SBIconView *)self _frameForLabel];
  -[SBIconLabelView setFrame:](self->_labelView, "setFrame:");
  if (self->_labelAccessoryView)
  {
    [(SBIconView *)self _frameForLabelAccessory];
    -[SBIconLabelAccessoryView setFrame:](self->_labelAccessoryView, "setFrame:");
  }
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    [(SBIconView *)self _centerForAccessoryView];
    -[SBIconAccessoryView setCenter:](accessoryView, "setCenter:");
  }
  closeBoCGFloat x = self->_closeBox;
  if (closeBox)
  {
    [(SBIconView *)self _centerForCloseBox];
    -[SBCloseBoxView setCenter:](closeBox, "setCenter:");
  }
  resizeHandle = self->_resizeHandle;
  if (resizeHandle)
  {
    [(SBIconView *)self _centerForResizeHandle];
    -[SBHIconResizeHandle setCenter:](resizeHandle, "setCenter:");
  }
  iconIndexLabel = self->_iconIndexLabel;
  if (iconIndexLabel)
  {
    [(SBIconView *)self iconImageInfo];
    [(UILabel *)iconIndexLabel _setContinuousCornerRadius:v18];
    -[UILabel setFrame:](self->_iconIndexLabel, "setFrame:", v6, v8, v10, v12);
    [(UILabel *)self->_iconIndexLabel setClipsToBounds:1];
    v19 = [(SBIconView *)self contentContainerView];
    [v19 bringSubviewToFront:self->_iconIndexLabel];
  }
  focusEffectPlatterView = self->_focusEffectPlatterView;
  if (focusEffectPlatterView)
  {
    [(SBIconView *)self _focusEffectCenter];
    -[SBIconFocusEffectPlatterView setCenter:](focusEffectPlatterView, "setCenter:");
    v21 = self->_focusEffectPlatterView;
    [(SBIconView *)self _focusEffectBounds];
    -[SBIconFocusEffectPlatterView setBounds:](v21, "setBounds:");
    CGPoint v22 = [(SBIconView *)self contentContainerView];
    [v22 insertSubview:self->_focusEffectPlatterView belowSubview:v4];
  }
}

- (void)_updateFrameToIconViewSize
{
  [(SBIconView *)self iconImageSize];
  double v4 = v3;
  double v6 = v5;
  self->_visibleImageRect.origin.CGFloat x = 0.0;
  self->_visibleImageRect.origin.CGFloat y = 0.0;
  self->_visibleImageRect.size.width = v3;
  self->_visibleImageRect.size.height = v5;
  UIRectGetCenter();
  double v8 = v7;
  double v10 = v9;
  -[SBIconView iconViewSizeForIconImageSize:](self, "iconViewSizeForIconImageSize:", v4, v6);
  if (v11 <= 0.0 || (double v13 = v12, v12 <= 0.0))
  {
    uint64_t v17 = [(SBIconView *)self layer];
    objc_msgSend(v17, "setAnchorPoint:", 0.5, 0.5);
  }
  else
  {
    double v14 = v11;
    double v15 = v8 / v11;
    double v16 = [(SBIconView *)self layer];
    objc_msgSend(v16, "setAnchorPoint:", v15, v10 / v13);

    -[SBIconView setBounds:](self, "setBounds:", 0.0, 0.0, v14, v13);
  }
  if (self->_iconImageView)
  {
    -[SBIconView _updateConfigurationForIconImageView:](self, "_updateConfigurationForIconImageView:");
  }
}

- (CGRect)_frameForImageView
{
  if (self->_iconImageSizeMatchesBoundsSize)
  {
    [(SBIconView *)self bounds];
  }
  else
  {
    [(SBIconView *)self iconImageSize];
    double v4 = v6;
    double v5 = v7;
    double v3 = 0.0;
    double v2 = 0.0;
  }
  result.size.height = v5;
  result.size.width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SBIconView *)self bounds];
  v8.receiver = self;
  v8.super_class = (Class)SBIconView;
  -[SBIconView setBounds:](&v8, sel_setBounds_, x, y, width, height);
  [(SBIconView *)self bounds];
  if ((BSSizeEqualToSize() & 1) == 0) {
    [(SBIconView *)self _notifyObserversSizeDidChange];
  }
}

- (CGRect)_frameForLabel
{
  double v3 = [(SBIconView *)self _labelImage];
  [(SBIconView *)self _frameForImageView];
  CGFloat v41 = v5;
  CGFloat v42 = v4;
  CGFloat v39 = v7;
  CGFloat v40 = v6;
  [(SBIconView *)self _labelBaselineOffsetFromImage];
  [(SBIconView *)self bounds];
  CGFloat v37 = v9;
  CGFloat v38 = v8;
  CGFloat v35 = v11;
  CGFloat v36 = v10;
  [v3 size];
  double v13 = v12;
  double v15 = v14;
  [v3 alignmentRectInsets];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [v3 baselineOffsetFromBottom];
  CGFloat v24 = v13 - (v19 + v23);
  CGFloat v25 = v15 - (v17 + v21);
  v26 = [(SBIconView *)self traitCollection];
  [v26 displayScale];

  v43.origin.double y = v37;
  v43.origin.double x = v38;
  v43.size.double height = v35;
  v43.size.double width = v36;
  CGRectGetWidth(v43);
  v44.origin.double x = v19 + 0.0;
  v44.origin.double y = v17 + 0.0;
  v44.size.double width = v24;
  v44.size.double height = v25;
  CGRectGetWidth(v44);
  v45.origin.double x = v19 + 0.0;
  v45.origin.double y = v17 + 0.0;
  v45.size.double width = v24;
  v45.size.double height = v25;
  CGRectGetMinX(v45);
  UICeilToScale();
  double v28 = v27;
  v46.origin.double y = v41;
  v46.origin.double x = v42;
  v46.size.double height = v39;
  v46.size.double width = v40;
  CGRectGetMaxY(v46);
  UICeilToScale();
  double v30 = v29;

  double v31 = v28;
  double v32 = v30;
  double v33 = v13;
  double v34 = v15;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (BOOL)shouldUpdateFrameOfIconImageView
{
  if ([(SBIconView *)self isIconImageViewBorrowed]) {
    return 0;
  }
  double v4 = [(SBIconView *)self currentImageView];
  char v5 = [v4 isDescendantOfView:self];

  return v5;
}

- (id)currentImageView
{
  crossfadeView = self->_crossfadeView;
  if (crossfadeView) {
    goto LABEL_2;
  }
  if (!self->_customIconImageViewController)
  {
    crossfadeView = self->_iconImageView;
LABEL_2:
    id v3 = crossfadeView;
    goto LABEL_5;
  }
  id v3 = [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController view];
LABEL_5:
  return v3;
}

- (BOOL)isIconImageViewBorrowed
{
  double v2 = [(SBIconView *)self borrowedIconImageViewAssertion];
  BOOL v3 = v2 != 0;

  return v3;
}

- (SBIconViewAssertion)borrowedIconImageViewAssertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_borrowedIconImageViewAssertion);
  return (SBIconViewAssertion *)WeakRetained;
}

- (id)_labelImage
{
  double v2 = [(SBIconLabelView *)self->_labelView image];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (double)_labelBaselineOffsetFromImage
{
  uint64_t v3 = [(SBIconView *)self methodForSelector:sel__labelVerticalOffset];
  if (v3 == +[SBIconView instanceMethodForSelector:sel__labelVerticalOffset])
  {
    double v6 = [(SBIconView *)self labelConfiguration];
    [v6 baselineOffsetFromImage];
    double v8 = v7;

    return v8;
  }
  else
  {
    [(SBIconView *)self _labelVerticalOffset];
    return v4 + 14.0;
  }
}

+ (CGSize)maxLabelSizeForListLayout:(id)a3 iconImageSize:(CGSize)a4 contentSizeCategory:(id)a5 options:(unint64_t)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = [a1 methodForSelector:sel_maxLabelSizeForIconImageSize_];
  if (v13 == +[SBIconView methodForSelector:sel_maxLabelSizeForIconImageSize_])
  {
    double v18 = [a1 labelConfigurationForListLayout:v11 contentSizeCategory:v12 options:a6];
    [v18 extraWidth];
    double v15 = width + v19;
    [v18 height];
    double v17 = v20;
  }
  else
  {
    objc_msgSend(a1, "maxLabelSizeForIconImageSize:", width, height);
    double v15 = v14;
    double v17 = v16;
  }

  double v21 = v15;
  double v22 = v17;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (CGSize)maxLabelSize
{
  uint64_t v3 = [(SBIconView *)self listLayout];
  double v4 = [(SBIconView *)self contentSizeCategory];
  uint64_t v5 = [(SBIconView *)self isLabelTextBold];
  [(SBIconView *)self iconImageInfo];
  double v7 = v6;
  double v9 = v8;
  double v10 = objc_opt_class();
  if (v3) {
    objc_msgSend(v10, "maxLabelSizeForListLayout:iconImageSize:contentSizeCategory:options:", v3, v4, v5, v7, v9);
  }
  else {
    objc_msgSend(v10, "maxLabelSizeForIconImageSize:contentSizeCategory:options:", v4, v5, v7, v9);
  }
  double v13 = v11;
  double v14 = v12;

  double v15 = v13;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (id)labelConfiguration
{
  uint64_t v3 = [(SBIconView *)self listLayout];
  double v4 = [(SBIconView *)self contentSizeCategory];
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "labelConfigurationForListLayout:contentSizeCategory:options:", v3, v4, -[SBIconView isLabelTextBold](self, "isLabelTextBold"));

  return v5;
}

- (id)contentSizeCategory
{
  id v2 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  if (!v2) {
    id v2 = (id)*MEMORY[0x1E4FB27F0];
  }
  return v2;
}

+ (id)labelConfigurationForListLayout:(id)a3 contentSizeCategory:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (objc_opt_respondsToSelector())
  {
    double v10 = [v8 labelVisualConfigurationForContentSizeCategory:v9 options:a5];
  }
  else
  {
    double v10 = objc_alloc_init(SBHIconLabelVisualConfiguration);
    [a1 defaultMaxLabelHeight];
    -[SBHIconLabelVisualConfiguration setHeight:](v10, "setHeight:");
    [a1 defaultMaxLabelWidthDeltaForContentSizeCategory:v9];
    -[SBHIconLabelVisualConfiguration setExtraWidth:](v10, "setExtraWidth:");
  }

  return v10;
}

- (void)setIconImageCache:(id)a3
{
  uint64_t v5 = (SBHIconImageCache *)a3;
  if (self->_iconImageCache != v5)
  {
    objc_storeStrong((id *)&self->_iconImageCache, a3);
    [(SBIconImageView *)self->_iconImageView setIconImageCache:v5];
    [(SBIconView *)self _updateFrameToIconViewSize];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v27 = a3;
  char v4 = [(_UILegibilitySettings *)self->_legibilitySettings isEqual:v27];
  uint64_t v5 = v27;
  if ((v4 & 1) == 0)
  {
    if (v27)
    {
      double v6 = (_UILegibilitySettings *)v27;
    }
    else
    {
      double v6 = [(id)objc_opt_class() defaultLegibilitySettings];
    }
    legibilitySettings = self->_legibilitySettings;
    self->_legibilitySettings = v6;

    [(SBIconView *)self maxLabelSize];
    double v9 = v8;
    double v11 = v10;
    double v12 = objc_opt_class();
    double v13 = [(SBIconView *)self contentSizeCategory];
    [v12 labelMaximumHeightForContentSizeCategory:v13];
    double v15 = v14;

    double v16 = [(SBIconView *)self _screen];

    if (v16)
    {
      if (v11 < v15) {
        double v11 = v15;
      }
      double v17 = [(SBIconView *)self iconLabelViewFactory];
      double v18 = self->_legibilitySettings;
      double v19 = [(SBIconView *)self _screen];
      [v19 scale];
      objc_msgSend(v17, "prewarmForSettings:maxSize:minSize:scale:", v18, v9, v11, 10.0, v11, v20);
    }
    uint64_t v21 = [(_UILegibilitySettings *)self->_legibilitySettings style];
    double v22 = [(SBHomeScreenButton *)self->_closeBox materialView];
    [v22 setLegibilityStyle:v21];

    [(SBHIconResizeHandle *)self->_resizeHandle setDarkStyle:v21 == 2];
    labelAccessoryView = self->_labelAccessoryView;
    CGFloat v24 = self->_legibilitySettings;
    CGFloat v25 = [(SBIconView *)self labelFont];
    [(SBIconLabelAccessoryView *)labelAccessoryView updateWithLegibilitySettings:v24 labelFont:v25];

    if (objc_opt_respondsToSelector()) {
      [(SBIconAccessoryView *)self->_accessoryView setLegibilityStyle:v21];
    }
    [(SBIconView *)self _updateLabel];
    [(SBIconView *)self layoutIfNeeded];
    [(SBIconImageView *)self->_iconImageView iconViewLegibilitySettingsDidChange];
    char v26 = objc_opt_respondsToSelector();
    uint64_t v5 = v27;
    if (v26)
    {
      [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController setLegibilitySettings:self->_legibilitySettings];
      uint64_t v5 = v27;
    }
  }
}

- (void)setFolderIconImageCache:(id)a3
{
  uint64_t v5 = (SBFolderIconImageCache *)a3;
  if (self->_folderIconImageCache != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_folderIconImageCache, a3);
    [(SBIconImageView *)self->_iconImageView iconViewFolderIconImageCacheDidChange];
    uint64_t v5 = v6;
  }
}

- (void)setEditing:(BOOL)a3
{
}

- (BOOL)_shouldEnableGroupBlending
{
  return [(SBIconView *)self labelStyle] == 0;
}

- (int64_t)labelStyle
{
  return (uint64_t)(char)(2 * *((unsigned char *)self + 550)) >> 6;
}

- (void)prepareForReuse
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [(SBIconView *)self dismissConfigurationCardImmediately];
  [(SBIconView *)self dismissStackConfigurationCardImmediately];
  [(SBIconView *)self setIcon:0];
  [(SBIconView *)self setIconContentScalingEnabled:0];
  [(SBIconView *)self setIconContentScale:1.0];
  [(SBIconImageView *)self->_iconImageView prepareForReuse];
  uint64_t v3 = [(SBIconView *)self accessoryViewAnimator];
  char v4 = v3;
  if (v3)
  {
    [v3 stopAnimation:0];
    [v4 finishAnimationAtPosition:0];
    [(SBIconView *)self setAccessoryViewAnimator:0];
  }
  double v29 = v4;
  [(SBIconView *)self setOverrideBadgeNumberOrString:0];
  [(SBIconView *)self _destroyAccessoryView];
  *((unsigned char *)self + 550) &= ~0x10u;
  self->_customIconImageViewControllerPrioritdouble y = 0;
  [(SBIconView *)self setCustomIconImageViewController:0];
  [(SBIconView *)self setConfigurationOptions:[(SBIconView *)self configurationOptions]];
  *((unsigned char *)self + 547) = (*((unsigned char *)self + 547) & 0xFD | (2 * (*((unsigned char *)self + 549) & 1))) ^ 2;
  *((unsigned char *)self + 547) = (*((unsigned char *)self + 547) & 0xFB | (4 * (*((unsigned char *)self + 549) & 1))) ^ 4;
  [(SBIconView *)self _invalidateHomeButtonPressConsumingAssertion];
  *((unsigned char *)self + 545) &= ~0x20u;
  *((unsigned char *)self + 545) &= ~0x40u;
  *((unsigned char *)self + 545) &= ~0x80u;
  *((unsigned char *)self + 546) &= ~1u;
  *((unsigned char *)self + 549) &= ~0x10u;
  *((unsigned char *)self + 549) &= ~0x40u;
  *((unsigned char *)self + 549) &= ~8u;
  *((unsigned char *)self + 548) |= 0x20u;
  *((unsigned char *)self + 548) |= 0x40u;
  *((unsigned char *)self + 550) &= 0x9Fu;
  *((unsigned char *)self + 544) &= 0xF3u;
  objc_storeStrong((id *)&self->_iconLocation, @"SBIconLocationNone");
  *(_WORD *)((char *)self + 549) &= 0xFE7Fu;
  recentsDocumentExtensionProvider = self->_recentsDocumentExtensionProvider;
  self->_recentsDocumentExtensionProvider = 0;

  self->_iconImageSizeMatchesBoundsSize = 0;
  droppingAssertions = self->_droppingAssertions;
  self->_droppingAssertions = 0;

  [(SBIconView *)self _updateBrightness];
  [(SBIconView *)self setIconImageAlpha:1.0];
  [(SBIconView *)self setIconLabelAlpha:1.0];
  [(SBIconView *)self setIconAccessoryAlpha:1.0];
  [(SBIconView *)self setAllIconElementsButLabelHidden:0];
  [(SBIconView *)self setPaused:0 forReason:-1];
  [(SBIconView *)self setEditing:0 animated:0];
  [(SBIconView *)self setAllowsEditingAnimation:1];
  [(SBIconView *)self setSuppressesDefaultEditingAnimation:0];
  [(SBIconView *)self setAllowsCloseBox:1];
  [(SBIconView *)self setAllowsResizeHandle:0];
  [(SBIconView *)self setAllowsAdornmentsOverIconImage:1];
  [(SBIconView *)self setGrabbed:0];
  [(SBIconView *)self setDragging:0];
  [(SBIconView *)self setDragLifted:0];
  [(SBIconView *)self setLiftingDragSession:0];
  [(SBIconView *)self setCancelingDrag:0];
  [(SBIconView *)self setAddedToDrag:0];
  [(SBIconView *)self setShowsImageAndLabelDuringDrop:0];
  [(SBIconView *)self setOverlapping:0];
  -[SBIconView setImageLoadingBehavior:](self, "setImageLoadingBehavior:", [(id)objc_opt_class() defaultImageLoadingBehavior]);
  [(SBIconView *)self setDisplaysIconStatusInLabel:0];
  [(SBIconView *)self setEditingAnimationStrength:1.0];
  [(SBIconView *)self setUserVisibilityStatus:0];
  -[SBIconView setApproximateLayoutPosition:](self, "setApproximateLayoutPosition:", 0, 0);
  [(SBIconView *)self setOverrideIconImageAppearance:0];
  [(SBIconView *)self setOverrideIconImageStyleConfiguration:0];
  [(SBIconView *)self setOverrideImage:0];
  [(SBIconView *)self setUsesSceneUserInterfaceStyleForImage:0];
  [(SBIconView *)self setOverrideAccessoryIconImageAppearance:0];
  [(SBIconView *)self cleanupAfterCrossfade];
  [(UIView *)self->_dropGlow removeFromSuperview];
  dropGlow = self->_dropGlow;
  self->_dropGlow = 0;

  *((unsigned char *)self + 549) &= ~4u;
  [(SBIconFocusEffectPlatterView *)self->_focusEffectPlatterView removeFromSuperview];
  focusEffectPlatterView = self->_focusEffectPlatterView;
  self->_focusEffectPlatterView = 0;

  *((unsigned char *)self + 545) &= ~8u;
  [(UIFocusItem *)self->_focusProxyView removeFromSuperview];
  focusProxyView = self->_focusProxyView;
  self->_focusProxyView = 0;

  *((unsigned char *)self + 551) &= ~8u;
  iconLabelViewFactordouble y = self->_iconLabelViewFactory;
  self->_iconLabelViewFactordouble y = 0;

  [(SBHIconResizeHandle *)self->_resizeHandle removeFromSuperview];
  resizeHandle = self->_resizeHandle;
  self->_resizeHandle = 0;

  [(SBIconView *)self setResizeGestureHandler:0];
  [(SBIconView *)self setAccessibilityIdentifier:0];
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v34[0] = *MEMORY[0x1E4F1DAB8];
  v34[1] = v12;
  v34[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(SBIconView *)self setTransform:v34];
  [(SBIconView *)self setAlpha:1.0];
  [(SBIconView *)self setHidden:0];
  [(SBIconView *)self setBackgroundColor:0];
  double v13 = [(SBIconView *)self layer];
  [v13 setCornerRadius:0.0];

  [(SBIconView *)self removeAllIconAnimations];
  [(SBIconImageView *)self->_iconImageView setProgressState:0 paused:0 percent:0 animated:0.0];
  [(SBIconView *)self setFolderIconFrozen:0];
  [(SBIconView *)self setContinuityInfo:0];
  [(SBIconView *)self setStartsDragMoreQuickly:0];
  [(SBIconView *)self setOverrideDraggingDelegate:0];
  double v14 = [(SBIconView *)self closeBoxAnimator];
  if (v14)
  {
    double v15 = v14;
    objc_msgSend(v14, "stopAnimation:", 0, v14);
    [v15 finishAnimationAtPosition:0];
    [(SBCloseBoxView *)self->_closeBox removeFromSuperview];
    closeBodouble x = self->_closeBox;
    self->_closeBodouble x = 0;

    [(SBIconView *)self setCloseBoxAnimator:0];
  }
  else
  {
    [(SBCloseBoxView *)self->_closeBox removeFromSuperview];
  }
  [(SBIconView *)self _toggleGroupBlendingIfNecessary];
  [(SBIconView *)self _updateFrameToIconViewSize];
  [(SBIconView *)self earlyTerminateContextMenuDismissAnimation];
  [(SBIconView *)self setLastContextMenuInteractionFailedToLoad:0];
  [(SBIconView *)self _removeUnknownSubviews];
  [(NSCountedSet *)self->_forbidEditingModeReasons removeAllObjects];
  [(NSHashTable *)self->_forbidAccessoryUpdatesAssertions removeAllObjects];
  [(SBIconView *)self _applyOverallAlpha:1.0];
  [(SBIconView *)self setAlpha:1.0];
  double v17 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
  [v17 _focusEnvironmentWillDisappear:self];

  double v18 = [(SBIconView *)self behaviorDelegate];
  double v19 = (void *)[(NSHashTable *)self->_observers copy];
  observers = self->_observers;
  self->_observers = 0;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        char v26 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (v26 != v18 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v26 iconViewWasRecycled:self];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v23);
  }

  id v27 = self->_observers;
  self->_observers = 0;

  if (objc_opt_respondsToSelector()) {
    [v18 iconViewWasRecycled:self];
  }
  [(SBIconView *)self setDelegate:0];
  [(SBIconView *)self setOverrideActionDelegate:0];
}

- (void)_updateResizeHandleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBIconView *)self shouldShowResizeHandle];
  BOOL v6 = [(SBIconView *)self isShowingResizeHandle];
  if (!v5 || v6)
  {
    if (v5 || !v6) {
      return;
    }
    id v14 = [(SBIconView *)self resizeHandle];
    [(SBIconView *)self setResizeHandle:0];
    if (v3)
    {
      double v20 = (void *)MEMORY[0x1E4FB1EB0];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __42__SBIconView__updateResizeHandleAnimated___block_invoke_4;
      v23[3] = &unk_1E6AAC810;
      id v24 = v14;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __42__SBIconView__updateResizeHandleAnimated___block_invoke_5;
      v21[3] = &unk_1E6AACAB8;
      id v14 = v24;
      id v22 = v14;
      [v20 animateWithDuration:v23 animations:v21 completion:0.3];
    }
    else
    {
      [v14 removeFromSuperview];
    }
  }
  else
  {
    double v7 = [(SBIconView *)self _makeResizeHandle];
    [(SBIconView *)self setResizeHandle:v7];
    double v8 = [(SBIconView *)self contentContainerView];
    [v8 addSubview:v7];
    [(SBIconView *)self _centerForResizeHandle];
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    double v13 = (void *)MEMORY[0x1E4FB1EB0];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __42__SBIconView__updateResizeHandleAnimated___block_invoke;
    v30[3] = &unk_1E6AAFD70;
    id v14 = v7;
    id v31 = v14;
    uint64_t v32 = v10;
    uint64_t v33 = v12;
    [v13 performWithoutAnimation:v30];
    [(SBIconView *)self effectiveIconAccessoryAlpha];
    double v16 = v15;
    if (v3)
    {
      double v17 = (void *)MEMORY[0x1E4FB1EB0];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __42__SBIconView__updateResizeHandleAnimated___block_invoke_2;
      v28[3] = &unk_1E6AAC810;
      id v18 = v14;
      id v29 = v18;
      [v17 performWithoutAnimation:v28];
      double v19 = (void *)MEMORY[0x1E4FB1EB0];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __42__SBIconView__updateResizeHandleAnimated___block_invoke_3;
      v25[3] = &unk_1E6AAC838;
      id v26 = v18;
      double v27 = v16;
      [v19 animateWithDuration:v25 animations:0.3];
    }
    else
    {
      [v14 setAlpha:v15];
    }
  }
}

- (BOOL)isShowingResizeHandle
{
  return self->_resizeHandle != 0;
}

- (void)setIcon:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (SBIcon *)a3;
  p_icon = &self->_icon;
  icon = self->_icon;
  if (icon != v7)
  {
    uint64_t v11 = v7;
    [(SBIcon *)icon removeObserver:self];
    uint64_t v10 = *p_icon;
    objc_storeStrong((id *)&self->_icon, a3);
    if (*p_icon)
    {
      [(SBIcon *)*p_icon addObserver:self];
      [(SBIconView *)self setPaused:0 forReason:2];
      [(SBIconView *)self _updateIconImageViewAnimated:v4];
      [(SBIconView *)self _updateLabelAreaAnimated:v4];
      [(SBIconView *)self _updateProgressAnimated:v4];
      [(SBIconView *)self _updateCloseBoxAnimated:v4];
      [(SBIconView *)self _updateResizeHandleAnimated:v4];
      [(SBIconView *)self _updateBrightness];
      [(SBIconView *)self _applyEditingStateAnimated:v4];
      [(SBIconView *)self addGesturesAndInteractionsIfNecessary];
      [(SBIconView *)self _updateFrameToIconViewSize];
    }
    else
    {
      [(SBIconView *)self setCustomIconImageViewController:0];
      [(SBIconView *)self setPaused:1 forReason:2];
    }
    [(SBIconView *)self _updateAccessoryViewAnimated:v4];
    [(SBIconView *)self _updateLaunchDisabled];
    [(SBIconView *)self _fetchApplicationShortcutItemsIfAppropriate];
    [(SBIconView *)self _startTrackingSupportedMultitaskingShortcutActionsIfAppropriateWithOldIcon:v10];

    double v7 = v11;
  }
}

- (void)_updateIconImageAdornmentsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  -[SBIconView _updateCloseBoxAnimated:](self, "_updateCloseBoxAnimated:");
  [(SBIconView *)self _updateAccessoryViewAnimated:v3];
  [(SBIconView *)self _updateResizeHandleAnimated:v3];
}

- (void)_updateAccessoryViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(NSHashTable *)self->_forbidAccessoryUpdatesAssertions count])
  {
    BOOL v5 = [(SBIconView *)self accessoryViewAnimator];
    BOOL v6 = v5;
    if (v5)
    {
      if ([v5 state])
      {
        [v6 stopAnimation:0];
        [v6 fractionComplete];
        [v6 finishAnimationAtPosition:v7 <= 0.0];
      }
      [(SBIconView *)self setAccessoryViewAnimator:0];
    }
    if (![(SBIconView *)self shouldShowAccessoryView])
    {
      [(SBIconView *)self _setShowingAccessoryView:0];
      if (v3)
      {
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke_6;
        v31[3] = &unk_1E6AAC810;
        v31[4] = self;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke_7;
        v30[3] = &unk_1E6AACAB8;
        void v30[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v31 animations:v30 completion:0.3];
      }
      else
      {
        [(SBIconView *)self _destroyAccessoryView];
      }
      goto LABEL_42;
    }
    double v8 = [(SBIconView *)self icon];
    uint64_t v9 = v8;
    if (!v3)
    {
      double v17 = (void *)MEMORY[0x1E4FB1EB0];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke_5;
      v32[3] = &unk_1E6AACA90;
      v32[4] = self;
      id v33 = v8;
      [v17 performWithoutAnimation:v32];

LABEL_41:
LABEL_42:

      return;
    }
    id v10 = objc_alloc(MEMORY[0x1E4FB1ED8]);
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1C58]);
    uint64_t v12 = (void *)[v10 initWithDuration:v11 timingParameters:0.3];

    BOOL v13 = [(SBIconView *)self _isShowingAccessoryView];
    uint64_t v14 = objc_msgSend((id)objc_opt_class(), "defaultViewClassForAccessoryType:", -[SBIconView currentAccessoryType](self, "currentAccessoryType"));
    accessoryView = self->_accessoryView;
    if (accessoryView)
    {
      if (v14)
      {
        if ([(SBIconAccessoryView *)accessoryView isMemberOfClass:v14])
        {
          double v16 = 0;
LABEL_20:
          [(SBIconView *)self _createAccessoryViewIfNecessary];
          char v18 = 0;
LABEL_21:
          double v20 = self->_accessoryView;
          [(SBIconAccessoryView *)v20 configureAnimatedForIcon:v9 infoProvider:self animator:v12];
          [(SBIconView *)self _centerForAccessoryView];
          -[SBIconAccessoryView setCenter:](v20, "setCenter:");
          if (objc_opt_respondsToSelector())
          {
            id v21 = [(SBIconView *)self badgeParallaxSettings];
            [(SBIconAccessoryView *)v20 setParallaxSettings:v21];
          }
          if (v18) {
            uint64_t v22 = 0;
          }
          else {
            uint64_t v22 = [(SBIconAccessoryView *)v20 displayingAccessory];
          }
          if ((v22 & 1) == 0 && !v16)
          {
            double v16 = v20;
            uint64_t v23 = self->_accessoryView;
            self->_accessoryView = 0;
          }
          int v24 = !v13;
          if (v22 && v24 && !v16)
          {
            CGAffineTransformMakeScale(&v50, 0.01, 0.01);
            CGFloat v25 = &v50;
            id v26 = v20;
          }
          else
          {
            if ((v22 | v24))
            {
LABEL_36:
              [(SBIconView *)self _setShowingAccessoryView:v22];
              v42[0] = MEMORY[0x1E4F143A8];
              v42[1] = 3221225472;
              v42[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke;
              v42[3] = &unk_1E6AACEF0;
              BOOL v45 = v13;
              char v46 = v22;
              double v28 = v20;
              CGRect v43 = v28;
              id v29 = v16;
              CGRect v44 = v29;
              [v12 addAnimations:v42];
              if (v16)
              {
                if (v22)
                {
                  [(SBIconAccessoryView *)v28 setAlpha:0.0];
                  v39[0] = MEMORY[0x1E4F143A8];
                  v39[1] = 3221225472;
                  v39[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke_2;
                  v39[3] = &unk_1E6AACA90;
                  CGFloat v40 = v29;
                  CGFloat v41 = v28;
                  [v12 addAnimations:v39];
                }
                v37[0] = MEMORY[0x1E4F143A8];
                v37[1] = 3221225472;
                v37[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke_3;
                v37[3] = &unk_1E6AADF00;
                v37[4] = self;
                CGFloat v38 = v29;
                [v12 addCompletion:v37];
              }
              objc_initWeak(location, v12);
              v34[0] = MEMORY[0x1E4F143A8];
              v34[1] = 3221225472;
              v34[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke_4;
              _OWORD v34[3] = &unk_1E6AB2FD0;
              char v36 = v22;
              v34[4] = self;
              objc_copyWeak(&v35, location);
              [v12 addCompletion:v34];
              [(SBIconView *)self setAccessoryViewAnimator:v12];
              [v12 startAnimation];
              objc_destroyWeak(&v35);
              objc_destroyWeak(location);

              goto LABEL_41;
            }
            long long v27 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
            *(_OWORD *)location = *MEMORY[0x1E4F1DAB8];
            long long v48 = v27;
            long long v49 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
            CGFloat v25 = location;
            id v26 = v16;
          }
          [(SBIconAccessoryView *)v26 setTransform:v25];
          goto LABEL_36;
        }
        accessoryView = self->_accessoryView;
      }
      double v16 = accessoryView;
      double v19 = self->_accessoryView;
      self->_accessoryView = 0;

      if (v14) {
        goto LABEL_20;
      }
    }
    else
    {
      double v16 = 0;
      if (v14) {
        goto LABEL_20;
      }
    }
    char v18 = 1;
    goto LABEL_21;
  }
}

- (void)_destroyAccessoryView
{
  if (self->_accessoryView)
  {
    -[SBIconView _destroyAccessoryView:](self, "_destroyAccessoryView:");
    accessoryView = self->_accessoryView;
    self->_accessoryView = 0;
  }
}

- (UIViewPropertyAnimator)accessoryViewAnimator
{
  return self->_accessoryViewAnimator;
}

- (BOOL)canShowAccessoryView
{
  if ([(SBIconView *)self allowsAdornmentsOverIconImage])
  {
    int64_t v3 = [(SBIconView *)self currentAccessoryType];
    BOOL v4 = [(SBIconView *)self behaviorDelegate];
    if (!self->_icon)
    {
      BOOL v5 = 0;
      goto LABEL_12;
    }
    if ([(id)objc_opt_class() _alwaysShowsAccessoryOfType:v3])
    {
LABEL_4:
      BOOL v5 = 1;
LABEL_12:

      return v5;
    }
    if (objc_opt_respondsToSelector())
    {
      char v6 = [v4 iconViewDisplaysBadges:self];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_4;
      }
      char v6 = [v4 iconViewDisplaysAccessories:self];
    }
    BOOL v5 = v6;
    goto LABEL_12;
  }
  return 0;
}

- (BOOL)allowsAdornmentsOverIconImage
{
  return (*((unsigned __int8 *)self + 547) >> 5) & 1;
}

- (void)_setShowingAccessoryView:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 548) = v3 & 0x80 | *((unsigned char *)self + 548) & 0x7F;
}

- (void)setContentVisibility:(unint64_t)a3
{
  unint64_t v3 = *((unsigned __int8 *)self + 551);
  if (((v3 >> 5) & 3) != a3)
  {
    *((unsigned char *)self + 551) = v3 & 0x9F | (32 * (a3 & 3));
    [(SBIconView *)self setPaused:a3 != 0 forReason:16];
    [(SBIconImageView *)self->_iconImageView setContentVisibility:a3];
    id v6 = [(SBIconView *)self customIconImageViewController];
    if (objc_opt_respondsToSelector()) {
      [v6 setContentVisibility:a3];
    }
  }
}

- (void)setPaused:(BOOL)a3 forReason:(unint64_t)a4
{
  unsigned int v5 = *((unsigned __int16 *)self + 272);
  unsigned int v6 = v5 >> 4;
  int v7 = (v5 >> 4) & 0x1F;
  __int16 v8 = v5 & 0xFE0F;
  __int16 v9 = 16 * ((v6 | a4) & 0x1F);
  if (!a3) {
    __int16 v9 = 16 * (v7 & ~(_WORD)a4);
  }
  *((_WORD *)self + 272) = v9 | v8;
  if ((v7 == 0) == ((v9 & 0x1F0) != 0))
  {
    BOOL v10 = (v9 & 0x1F0) != 0;
    [(SBIconView *)self _updateJitter];
    [(SBIconView *)self updateParallaxSettings];
    [(SBIconImageView *)self->_iconImageView setPaused:v10];
  }
  if (objc_opt_respondsToSelector())
  {
    customIconImageViewController = self->_customIconImageViewController;
    unint64_t v12 = ((unint64_t)*((unsigned __int16 *)self + 272) >> 4) & 0x1F;
    [(SBIconViewCustomImageViewControlling *)customIconImageViewController setPauseReasons:v12];
  }
}

- (void)_updateJitter
{
}

- (void)updateParallaxSettings
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(SBIconView *)self badgeParallaxSettings];
    -[SBIconAccessoryView setParallaxSettings:](self->_accessoryView, "setParallaxSettings:");
  }
  else
  {
    if (!self->_closeBox) {
      return;
    }
    id v3 = [(SBIconView *)self badgeParallaxSettings];
  }
  SBFApplyParallaxSettingsToView();
}

- (void)_updateConfigurationForIconImageView:(id)a3
{
  id v7 = a3;
  BOOL v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unsigned int v6 = [v7 backgroundView];
    [(SBIconView *)self _configureViewAsFolderIconImageView:v6];
  }
}

+ (BOOL)_alwaysShowsAccessoryOfType:(int64_t)a3
{
  return a3 == 2;
}

- (void)_updateLaunchDisabled
{
  icon = self->_icon;
  if (icon)
  {
    int v4 = ![(SBIcon *)icon isLaunchEnabled];
    icon = self->_icon;
  }
  else
  {
    int v4 = 0;
  }
  int v5 = [(SBIcon *)icon isLaunchDisabledForObscuredReason];
  unsigned int v6 = *((unsigned __int8 *)self + 545);
  if (v5 == v6 >> 7 || (v5 & *((unsigned char *)self + 546) & 1) != 0)
  {
    int v7 = 1;
    if ((v5 & 1) == 0) {
LABEL_7:
    }
      *((unsigned char *)self + 546) &= ~1u;
  }
  else
  {
    int v7 = 0;
    if (v5) {
      char v9 = 0x80;
    }
    else {
      char v9 = 0;
    }
    *((unsigned char *)self + 545) = v9 & 0x80 | v6 & 0x7F;
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
  }
  unsigned int v8 = *((unsigned __int8 *)self + 545);
  if (v4 != ((v8 >> 6) & 1))
  {
    *((unsigned char *)self + 545) = v8 & 0xBF | ((_BYTE)v4 << 6);
    if (!v4 || ((*((char *)self + 545) < 0) & ~v7) == 0)
    {
      [(SBIconView *)self _updateBrightness];
      [(SBIconView *)self _updateLabel];
    }
  }
}

- (void)_updateIconImageViewAnimated:(BOOL)a3
{
  if (self->_icon)
  {
    BOOL v3 = a3;
    if (![(SBIconView *)self isIconImageViewBorrowed])
    {
      if ([(SBIconView *)self allowsIconImageView])
      {
        [(SBIconView *)self updateCustomIconImageViewController];
        if (!self->_customIconImageViewController)
        {
          if (([(SBIconImageView *)self->_iconImageView isMemberOfClass:[(SBIconView *)self expectedIconImageViewClass]] & 1) == 0)
          {
            [(SBIconView *)self _destroyIconImageView];
            int v5 = [(SBIconView *)self _makeIconImageView];
            iconImageView = self->_iconImageView;
            self->_iconImageView = v5;

            [(SBIconView *)self _updateBrightness];
            [(SBIconView *)self _updateAllComponentAlphas];
            [(SBIconImageView *)self->_iconImageView setPaused:(*((_WORD *)self + 272) & 0x1F0) != 0];
            [(SBIconImageView *)self->_iconImageView setContentVisibility:[(SBIconView *)self contentVisibility]];
          }
          if (([(SBIconImageView *)self->_iconImageView isDescendantOfView:self] & 1) == 0) {
            [(SBIconView *)self _insertIconImageView:self->_iconImageView];
          }
          int v7 = self->_iconImageView;
          icon = self->_icon;
          iconLocation = self->_iconLocation;
          [(SBIconImageView *)v7 setIcon:icon location:iconLocation animated:v3];
        }
      }
      else
      {
        [(SBIconView *)self _destroyIconImageView];
      }
    }
  }
}

- (void)_startTrackingSupportedMultitaskingShortcutActionsIfAppropriateWithOldIcon:(id)a3
{
  id v12 = a3;
  int v5 = [(SBIconView *)self icon];
  int v6 = __sb__runningInSpringBoard();
  char v7 = v6;
  if (v6)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_14;
    }
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v3 userInterfaceIdiom] != 1)
    {
LABEL_13:

      goto LABEL_14;
    }
  }
  int v8 = (__sb__runningInSpringBoard() ^ 1) & __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts;
  if (v7)
  {
    if (!v8) {
      goto LABEL_14;
    }
  }
  else
  {

    if ((v8 & 1) == 0) {
      goto LABEL_14;
    }
  }
  if ([v5 isApplicationIcon])
  {
    char v9 = [v5 applicationBundleID];
    BOOL v10 = [(SBIconView *)self _multitaskingAppShortcutService];
    [v10 startObservingSupportedShortcutsForBundleIdentifier:v9];
  }
  if ([v12 isApplicationIcon])
  {
    BOOL v3 = [v12 applicationBundleID];
    id v11 = [(SBIconView *)self _multitaskingAppShortcutService];
    [v11 stopObservingSupportedShortcutsForBundleIdentifier:v3];

    goto LABEL_13;
  }
LABEL_14:
}

- (void)_fetchApplicationShortcutItemsIfAppropriate
{
  BOOL v3 = [(SBIconView *)self icon];
  if ([v3 isApplicationIcon]
    && (__sb__runningInSpringBoard() & 1) == 0
    && [(id)objc_opt_class() supportsPreviewInteraction])
  {
    int v4 = [v3 applicationBundleID];
    int v5 = [(SBIconView *)self shortcutsDelegate];
    if (objc_opt_respondsToSelector())
    {
      if ([v5 iconViewShouldIncludeUninstallShortcutItem:self]) {
        uint64_t v6 = 16777224;
      }
      else {
        uint64_t v6 = 0x1000000;
      }
    }
    else
    {
      uint64_t v6 = 0x1000000;
    }
    char v7 = [(id)objc_opt_class() applicationShortcutService];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__SBIconView__fetchApplicationShortcutItemsIfAppropriate__block_invoke;
    v8[3] = &unk_1E6AB2F38;
    v8[4] = self;
    id v9 = v3;
    [v7 fetchApplicationShortcutItemsOfTypes:v6 forBundleIdentifier:v4 withCompletionHandler:v8];
  }
  else
  {
    [(SBIconView *)self setFetchedApplicationShortcutItems:0];
  }
}

- (void)setFetchedApplicationShortcutItems:(id)a3
{
}

- (void)setConfigurationOptions:(unint64_t)a3
{
  [(SBIconView *)self setUserInteractionEnabled:(a3 & 4) == 0];
  [(SBIconView *)self setAllowsLabelArea:(a3 & 2) == 0];
  [(SBIconView *)self setAllowsAccessoryView:(a3 & 0x20) == 0];
  [(SBIconView *)self setAllowsPassthroughHitTesting:(a3 >> 3) & 1];
  *((unsigned char *)self + 549) = *((unsigned char *)self + 549) & 0xDF | (2 * a3) & 0x20;
  if (((2 * (_BYTE)a3) & 0x20) != 0)
  {
    if (self->_contextMenuInteraction)
    {
      -[SBIconView removeInteraction:](self, "removeInteraction:");
      contextMenuInteraction = self->_contextMenuInteraction;
      self->_contextMenuInteraction = 0;
    }
  }
  else
  {
    [(SBIconView *)self addGesturesAndInteractionsIfNecessary];
  }
  [(SBIconView *)self setDisallowCursorInteraction:(a3 >> 6) & 1];
  [(SBIconView *)self setAllowsIconImageView:(a3 & 0x80) == 0];
}

- (void)setDisallowCursorInteraction:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 550);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 8;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 550) = v3 & 0xF7 | v4;
    [(SBIconView *)self _updateCursorInteractionsEnabled];
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBIconView;
  -[SBIconView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_);
  [(SBIconView *)self addGesturesAndInteractionsIfNecessary];
  int v5 = [(SBIconView *)self customIconImageViewController];
  if (objc_opt_respondsToSelector()) {
    [v5 setUserInteractionEnabled:v3];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  int v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    objc_super v6 = [(SBIconView *)self reuseDelegate];
    if (objc_opt_respondsToSelector())
    {
      closeBodouble x = self->_closeBox;
      if (closeBox)
      {
        int v8 = [(SBHomeScreenButton *)closeBox backgroundView];
        char v9 = [v6 iconView:self shouldContinueToUseBackgroundViewForComponents:v8];

        if ((v9 & 1) == 0)
        {
          [(SBCloseBoxView *)self->_closeBox removeFromSuperview];
          BOOL v10 = self->_closeBox;
          self->_closeBodouble x = 0;

          [(SBIconView *)self _createCloseBoxIfNecessary];
        }
      }
      id v11 = [(SBIconView *)self _folderIconImageView];
      if ([v11 hasCustomBackgroundView])
      {
        id v12 = [v11 backgroundView];
        char v13 = [v6 iconView:self shouldContinueToUseBackgroundViewForComponents:v12];

        if ((v13 & 1) == 0)
        {
          [(SBIconView *)self _destroyIconImageView];
          [(SBIconView *)self _updateIconImageViewAnimated:0];
        }
      }
    }
    [(SBIconView *)self addGesturesAndInteractionsIfNecessary];

    int v5 = obj;
  }
}

- (void)addGesturesAndInteractionsIfNecessary
{
  uint64_t v23 = [(SBIconView *)self icon];
  int v3 = [(SBIconView *)self isUserInteractionEnabled];
  char v4 = (void *)v23;
  if (v3 && v23)
  {
    if (!self->_dropInteraction)
    {
      int v5 = (UIDropInteraction *)[objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:self];
      dropInteraction = self->_dropInteraction;
      self->_dropInteraction = v5;

      [(SBIconView *)self addInteraction:self->_dropInteraction];
      char v4 = (void *)v23;
    }
    if (!self->_dragInteraction)
    {
      int v7 = [(id)objc_opt_class() supportsDragInteraction];
      char v4 = (void *)v23;
      if (v7)
      {
        int v8 = [(UIDragInteraction *)[SBIconDragInteraction alloc] initWithDelegate:self];
        dragInteraction = self->_dragInteraction;
        self->_dragInteraction = &v8->super;

        [(UIDragInteraction *)self->_dragInteraction _setCancellationTimerEnabled:0];
        [(SBIconView *)self _updateDragInteractionLiftDelay];
        [(SBIconView *)self addInteraction:self->_dragInteraction];
        char v4 = (void *)v23;
      }
    }
    if (!self->_tapGestureRecognizer)
    {
      int v10 = [(id)objc_opt_class() supportsTapGesture];
      char v4 = (void *)v23;
      if (v10)
      {
        id v11 = [[SBIconTapGestureRecognizer alloc] initWithTarget:self action:sel_tapGestureDidChange_];
        tapGestureRecognizer = self->_tapGestureRecognizer;
        self->_tapGestureRecognizer = &v11->super;

        [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
        [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelaysTouchesBegan:0];
        [(UITapGestureRecognizer *)self->_tapGestureRecognizer setAllowedTouchTypes:&unk_1F300F210];
        [(SBIconView *)self addGestureRecognizer:self->_tapGestureRecognizer];
        char v4 = (void *)v23;
      }
    }
    if (!self->_editingModeGestureRecognizer)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v14 = objc_opt_respondsToSelector();

      char v4 = (void *)v23;
      if (v14)
      {
        double v15 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel_editingModeGestureRecognizerDidFire_];
        editingModeGestureRecognizer = self->_editingModeGestureRecognizer;
        self->_editingModeGestureRecognizer = v15;

        [(UILongPressGestureRecognizer *)self->_editingModeGestureRecognizer setMinimumPressDuration:2.0];
        [(UILongPressGestureRecognizer *)self->_editingModeGestureRecognizer setDelegate:self];
        [(UILongPressGestureRecognizer *)self->_editingModeGestureRecognizer _setKeepTouchesOnContinuation:1];
        [(UILongPressGestureRecognizer *)self->_editingModeGestureRecognizer setAllowableMovement:20.0];
        [(SBIconView *)self addGestureRecognizer:self->_editingModeGestureRecognizer];
        char v4 = (void *)v23;
      }
    }
    if (!self->_contextMenuInteraction)
    {
      int v17 = [(id)objc_opt_class() supportsPreviewInteraction];
      char v4 = (void *)v23;
      if (v17)
      {
        if ((*((unsigned char *)self + 549) & 0x20) == 0)
        {
          char v18 = (UIContextMenuInteraction *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
          contextMenuInteraction = self->_contextMenuInteraction;
          self->_contextMenuInteraction = v18;

          [(SBIconView *)self addInteraction:self->_contextMenuInteraction];
          [(UIContextMenuInteraction *)self->_contextMenuInteraction setAllowSimultaneousRecognition:1];
          char v4 = (void *)v23;
        }
      }
    }
    if (!self->_iconViewCursorInteraction)
    {
      int v20 = [(id)objc_opt_class() supportsCursorInteraction];
      char v4 = (void *)v23;
      if (v20)
      {
        id v21 = (UIPointerInteraction *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self];
        iconViewCursorInteraction = self->_iconViewCursorInteraction;
        self->_iconViewCursorInteraction = v21;

        [(UIPointerInteraction *)self->_iconViewCursorInteraction setEnabled:[(SBIconView *)self _isCursorInteractionEnabled]];
        [(SBIconView *)self addInteraction:self->_iconViewCursorInteraction];
        char v4 = (void *)v23;
      }
    }
  }
}

- (id)reuseDelegate
{
  id v3 = [(SBIconView *)self delegate];
  char v4 = v3;
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 reuseDelegateForIconView:self];
  }
  return v4;
}

- (void)setAllowsAccessoryView:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 548);
  if (((((v3 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 32;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 548) = v3 & 0xDF | v4;
    [(SBIconView *)self _updateAccessoryViewAnimated:0];
  }
}

- (void)setAllowsPassthroughHitTesting:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 549) = *((unsigned char *)self + 549) & 0xFD | v3;
}

- (void)setAllowsLabelArea:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 549);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    *((unsigned char *)self + 549) = v3 & 0xFE | a3;
    [(SBIconView *)self iconImageSize];
    -[SBIconView setBoundsSizeFromIconImageSize:](self, "setBoundsSizeFromIconImageSize:");
    [(SBIconView *)self invalidateIntrinsicContentSize];
    [(SBIconView *)self configureForLabelAllowed:v4];
  }
}

- (void)setIconContentScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_iconContentScale = a3;
    [(SBIconView *)self _updateIconContentScale];
  }
}

- (void)setApproximateLayoutPosition:(SBIconApproximateLayoutPosition)a3
{
  unint64_t vertical = a3.vertical;
  unint64_t horizontal = a3.horizontal;
  p_approximateLayoutPosition = &self->_approximateLayoutPosition;
  if (!SBIconApproximateLayoutPositionEqualToApproximateLayoutPosition(self->_approximateLayoutPosition.horizontal, self->_approximateLayoutPosition.vertical, a3.horizontal, a3.vertical))
  {
    p_approximateLayoutPosition->unint64_t horizontal = horizontal;
    p_approximateLayoutPosition->unint64_t vertical = vertical;
    id v7 = [(SBIconView *)self customIconImageViewController];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v7, "setApproximateLayoutPosition:", horizontal, vertical);
    }
  }
}

uint64_t __48__SBIconView__updateAllComponentAlphasAnimated___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [v2 effectiveIconImageAlpha];
  objc_msgSend(v2, "_applyIconImageAlpha:");
  char v3 = *(void **)(a1 + 32);
  [v3 effectiveIconAccessoryAlpha];
  objc_msgSend(v3, "_applyIconAccessoryAlpha:");
  BOOL v4 = *(void **)(a1 + 32);
  [v4 effectiveIconLabelAlpha];
  objc_msgSend(v4, "_applyIconLabelAlpha:");
  int v5 = *(void **)(a1 + 32);
  [v5 effectiveOverallAlpha];
  return objc_msgSend(v5, "_applyOverallAlpha:");
}

- (void)_updateLabelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBIconView *)self _shouldShowLabel])
  {
    int v5 = [(SBIconView *)self _labelImageParameters];
    objc_super v6 = [v5 text];
    BOOL v7 = [v6 length] != 0;
  }
  else
  {
    int v5 = 0;
    BOOL v7 = 0;
  }
  int v8 = self->_labelView;
  char v9 = self->_labelAccessoryView;
  int v10 = v9;
  if (v7)
  {
    double v28 = v9;
    [(SBIconView *)self _updateLabelAccessoryView];
    labelAccessoryView = [(SBIconView *)self _legibilitySettingsWithParameters:v5];
    id v12 = [(SBIconView *)self iconLabelViewFactory];
    char v13 = [(SBIconView *)self contentContainerView];
    labelView = self->_labelView;
    if (labelView)
    {
      int v15 = [v12 canUseIconLabelView:labelView toDisplayLabelWithSettings:labelAccessoryView imageParameters:v5 forIconView:self];
      double v16 = self->_labelView;
      if (v15)
      {
        [(SBIconLabelView *)v16 updateIconLabelWithSettings:labelAccessoryView imageParameters:v5];
LABEL_17:

        int v10 = v28;
        goto LABEL_18;
      }
      if (v16 && !v3) {
        [(SBIconLabelView *)v16 removeFromSuperview];
      }
    }
    long long v27 = v8;
    char v18 = [v12 iconLabelViewWithSettings:labelAccessoryView imageParameters:v5 forIconView:self];
    double v19 = self->_labelView;
    self->_labelView = v18;

    [(SBIconLabelView *)self->_labelView setAccessibilityIdentifier:@"label-view"];
    int v20 = [(SBIconView *)self currentImageView];
    id v21 = self->_labelView;
    if (v20) {
      [v13 insertSubview:v21 belowSubview:v20];
    }
    else {
      [v13 addSubview:v21];
    }

    int v8 = v27;
    goto LABEL_17;
  }
  if (!v3) {
    goto LABEL_19;
  }
  int v17 = self->_labelView;
  self->_labelView = 0;

  labelAccessoryView = self->_labelAccessoryView;
  self->_labelAccessoryView = 0;
LABEL_18:

LABEL_19:
  [(SBIconLabelView *)self->_labelView setHidden:!v7];
  [(SBIconLabelAccessoryView *)self->_labelAccessoryView setHidden:!v7];
  [(SBIconView *)self effectiveIconLabelAlpha];
  if (v3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __35__SBIconView__updateLabelAnimated___block_invoke;
    aBlock[3] = &__block_descriptor_40_e61_v56__0__UIView_8__UIView_16_CGRect__CGPoint_dd__CGSize_dd__24l;
    aBlock[4] = v22;
    uint64_t v23 = (void (**)(void *, SBIconLabelView *, id))_Block_copy(aBlock);
    int v24 = self->_labelView;
    CGFloat v25 = self->_labelAccessoryView;
    id v26 = v24;
    [(SBIconView *)self _frameForLabel];
    v23[2](v23, v8, v26);
    [(SBIconView *)self _frameForLabelAccessory];
    v23[2](v23, (SBIconLabelView *)v10, v25);
  }
  else
  {
    -[SBIconView _applyIconLabelAlpha:](self, "_applyIconLabelAlpha:");
  }
  [(SBIconView *)self setNeedsLayout];
}

- (void)_applyIconLabelAlpha:(double)a3
{
  -[SBIconLabelView setAlpha:](self->_labelView, "setAlpha:");
  labelAccessoryView = self->_labelAccessoryView;
  [(SBIconLabelAccessoryView *)labelAccessoryView setAlpha:a3];
}

- (BOOL)_shouldShowLabel
{
  id v2 = [(SBIconView *)self _labelHidingReason];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)_labelHidingReason
{
  if ((*((unsigned char *)self + 547) & 2) != 0) {
    return @"hideLabel iVar";
  }
  if (![(SBIconView *)self allowsLabelArea]) {
    return @"label area";
  }
  BOOL v3 = [(SBIconView *)self icon];

  if (!v3) {
    return @"icon is nil";
  }
  BOOL v4 = [(SBIconView *)self listLayout];
  int v5 = SBHIconListLayoutShowsLabels(v4);

  if (!v5) {
    return @"list layout";
  }
  objc_super v6 = [(SBIconView *)self behaviorDelegate];
  if (objc_opt_respondsToSelector())
  {
    if ([v6 iconViewDisplaysLabel:self]) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = @"behavior delegate";
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (CGSize)iconViewSizeForIconImageSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  if ([(SBIconView *)self allowsLabelArea])
  {
    [(id)objc_opt_class() _labelHeight];
    double height = height + v5;
  }
  double v6 = width;
  double v7 = height;
  result.double height = v7;
  result.CGFloat width = v6;
  return result;
}

- (BOOL)allowsLabelArea
{
  return *((unsigned char *)self + 549) & 1;
}

+ (double)_labelHeight
{
  if (__sb__runningInSpringBoard())
  {
    BOOL v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v2 = [v3 userInterfaceIdiom] == 1;
  }
  double result = 14.0;
  if (v2) {
    return 17.0;
  }
  return result;
}

- (void)_applyOverallAlpha:(double)a3
{
  id v5 = [(SBIconView *)self contentContainerView];
  BOOL v4 = [v5 layer];
  [v4 setAllowsGroupOpacity:a3 < 1.0];

  [v5 setAlpha:a3];
}

- (UIView)contentContainerView
{
  if (self->_scalingContainer) {
    self = (SBIconView *)self->_scalingContainer;
  }
  return (UIView *)self;
}

- (double)effectiveOverallAlpha
{
  BOOL v3 = [(SBIconView *)self isDropping];
  double result = 1.0;
  if (!v3)
  {
    BOOL v5 = [(SBIconView *)self isGrabbed];
    double result = 0.5;
    if (!v5)
    {
      BOOL v6 = [(SBIconView *)self isDragging];
      double result = 1.0;
      if (v6)
      {
        double v7 = objc_opt_class();
        [v7 iconLiftAlpha];
      }
    }
  }
  return result;
}

- (double)effectiveIconImageAlpha
{
  double iconImageAlpha = self->_iconImageAlpha;
  if ([(SBIconView *)self isDropping] && ![(SBIconView *)self isOverlapping])
  {
    if (self->_showsImageAndLabelDuringDrop) {
      return 1.0;
    }
    else {
      return 0.0;
    }
  }
  else
  {
    if ([(SBIconView *)self isOverlapping])
    {
      BOOL v4 = [(SBIconView *)self icon];
      if ([v4 isFolderIcon])
      {
      }
      else
      {
        customIconImageViewController = self->_customIconImageViewController;

        if (!customIconImageViewController) {
          return 0.5;
        }
      }
    }
    double v5 = 1.0;
    if (![(SBIconView *)self isGrabbed] && ![(SBIconView *)self isDragging])
    {
      if ([(SBIconView *)self allIconElementsButLabelHidden]) {
        return 0.0;
      }
      else {
        return iconImageAlpha;
      }
    }
  }
  return v5;
}

- (double)effectiveIconLabelAlpha
{
  double iconLabelAlpha = self->_iconLabelAlpha;
  double v4 = 0.0;
  if (![(SBIconView *)self _hideIconLabelForCustomIconImageViewController])
  {
    if ([(SBIconView *)self isDropping])
    {
      if (self->_showsImageAndLabelDuringDrop) {
        return 1.0;
      }
      else {
        return 0.0;
      }
    }
    else if (![(SBIconView *)self isOverlapping])
    {
      double v4 = 1.0;
      if (![(SBIconView *)self isGrabbed] && ![(SBIconView *)self isDragging])
      {
        if ([(SBIconView *)self _hideIconLabelForContextMenu]) {
          return 0.0;
        }
        else {
          return iconLabelAlpha;
        }
      }
    }
  }
  return v4;
}

- (BOOL)isDragging
{
  return (*((unsigned __int8 *)self + 548) >> 1) & 1;
}

- (BOOL)isGrabbed
{
  return (*((unsigned __int8 *)self + 545) >> 1) & 1;
}

- (BOOL)isDropping
{
  return [(NSHashTable *)self->_droppingAssertions count] != 0;
}

- (BOOL)isOverlapping
{
  return (*((unsigned __int8 *)self + 545) >> 2) & 1;
}

- (BOOL)_hideIconLabelForCustomIconImageViewController
{
  if (!self->_customIconImageViewController || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  customIconImageViewController = self->_customIconImageViewController;
  return [(SBIconViewCustomImageViewControlling *)customIconImageViewController wantsLabelHidden];
}

- (double)effectiveIconAccessoryAlpha
{
  double iconAccessoryAlpha = self->_iconAccessoryAlpha;
  double v4 = 0.0;
  if (![(SBIconView *)self isDropping])
  {
    double v4 = 1.0;
    if (![(SBIconView *)self isGrabbed] && ![(SBIconView *)self isDragging])
    {
      if ([(SBIconView *)self allIconElementsButLabelHidden]) {
        return 0.0;
      }
      else {
        return iconAccessoryAlpha;
      }
    }
  }
  return v4;
}

- (BOOL)allIconElementsButLabelHidden
{
  return *((unsigned __int8 *)self + 550) >> 7;
}

- (void)_applyIconAccessoryAlpha:(double)a3
{
  -[SBIconAccessoryView setAlpha:](self->_accessoryView, "setAlpha:");
  if ([(SBIconView *)self shouldShowCloseBox]) {
    [(SBCloseBoxView *)self->_closeBox setAlpha:a3];
  }
  if ([(SBIconView *)self shouldShowResizeHandle]) {
    [(SBHIconResizeHandle *)self->_resizeHandle setAlpha:a3];
  }
  iconImageView = self->_iconImageView;
  [(SBIconImageView *)iconImageView setProgressAlpha:a3];
}

- (void)_updateCloseBoxWithAnimation:(int64_t)a3
{
  BOOL v5 = a3 != 2;
  BOOL v6 = [(SBIconView *)self shouldShowCloseBox];
  BOOL v7 = [(SBIconView *)self _isShowingCloseBox];
  if (v6)
  {
    if (v7) {
      BOOL v5 = 0;
    }
    else {
      [(SBIconView *)self _setShowingCloseBox:1];
    }
    int v10 = [(SBIconView *)self contentContainerView];
    id v11 = [(SBIconView *)self closeBoxAnimator];
    id v12 = v11;
    if (v11)
    {
      if (v5) {
        objc_msgSend(v11, "setReversed:", objc_msgSend(v11, "isReversed") ^ 1);
      }
    }
    else
    {
      char v13 = (void *)MEMORY[0x1E4FB1EB0];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __43__SBIconView__updateCloseBoxWithAnimation___block_invoke;
      v29[3] = &unk_1E6AACA90;
      v29[4] = self;
      id v30 = v10;
      [v13 performWithoutAnimation:v29];

      if (v5)
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __43__SBIconView__updateCloseBoxWithAnimation___block_invoke_2;
        v28[3] = &unk_1E6AAC810;
        void v28[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v28];
        char v14 = self->_closeBox;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __43__SBIconView__updateCloseBoxWithAnimation___block_invoke_3;
        aBlock[3] = &unk_1E6AACA90;
        id v26 = v14;
        long long v27 = self;
        int v15 = v14;
        double v16 = _Block_copy(aBlock);
        [(SBIconView *)self _animateCloseBoxWithAnimation:a3 animationBlock:v16];
      }
    }
    [(SBIconView *)self _updateAccessoryViewAnimated:v5];
  }
  else if (v7)
  {
    [(SBIconView *)self _setShowingCloseBox:0];
    if (a3 == 2)
    {
      [(SBCloseBoxView *)self->_closeBox removeFromSuperview];
    }
    else
    {
      *((unsigned char *)self + 544) = *((unsigned char *)self + 544) & 0xF3 | 8;
      int v8 = [(SBIconView *)self closeBoxAnimator];
      char v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "setReversed:", objc_msgSend(v8, "isReversed") ^ 1);
      }
      else
      {
        int v17 = self->_closeBox;
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        uint64_t v22 = __43__SBIconView__updateCloseBoxWithAnimation___block_invoke_4;
        uint64_t v23 = &unk_1E6AAC810;
        int v24 = v17;
        char v18 = v17;
        double v19 = _Block_copy(&v20);
        -[SBIconView _animateCloseBoxWithAnimation:animationBlock:](self, "_animateCloseBoxWithAnimation:animationBlock:", a3, v19, v20, v21, v22, v23);
      }
    }
    [(SBIconView *)self _updateAccessoryViewAnimated:a3 != 2];
  }
}

- (BOOL)_isShowingCloseBox
{
  return (*((unsigned __int8 *)self + 548) >> 4) & 1;
}

- (void)_updateJitter:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (![(SBIconView *)self isEditing]
    || (*((unsigned char *)self + 546) & 8) == 0
    || (*((unsigned char *)self + 545) & 4) != 0
    || [(SBIconView *)self isPaused]
    || [(SBIconView *)self isDragging] && ![(SBIconView *)self isGrabbed]
    || self->_crossfadeView)
  {
    LODWORD(icon) = 0;
  }
  else
  {
    icon = self->_icon;
    if (icon) {
      LODWORD(icon) = ![(SBIconView *)self isResizing];
    }
  }
  if (icon != (*((unsigned char *)self + 546) & 2) >> 1 || v5)
  {
    if (icon) {
      [(SBIconView *)self _addJitterAnimated:v4];
    }
    else {
      [(SBIconView *)self _removeJitterAnimated:v4];
    }
    char v9 = [(SBIconView *)self _iconImageView];
    [v9 setJittering:(*((unsigned __int8 *)self + 546) >> 1) & 1];

    id v10 = [(SBIconView *)self customIconImageViewController];
    if (objc_opt_respondsToSelector()) {
      [v10 setJittering:(*((unsigned __int8 *)self + 546) >> 1) & 1];
    }
  }
}

- (BOOL)shouldShowCloseBox
{
  BOOL v3 = [(SBIconView *)self isEditing];
  if (v3)
  {
    LOBYTE(v3) = [(SBIconView *)self canShowCloseBox];
  }
  return v3;
}

- (BOOL)shouldShowResizeHandle
{
  BOOL v3 = [(SBIconView *)self isEditing];
  if (v3)
  {
    LOBYTE(v3) = [(SBIconView *)self canShowResizeHandle];
  }
  return v3;
}

- (BOOL)isEditing
{
  return (*((unsigned char *)self + 544) & 2) != 0 && [(NSCountedSet *)self->_forbidEditingModeReasons count] == 0;
}

- (void)_updateLabelAreaAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBIconView *)self _updateLabelAccessoryView];
  [(SBIconView *)self _updateLabelAnimated:v3];
}

- (void)_updateLabelAccessoryView
{
  [(SBIconView *)self _configureLabelAccessoryViewForType:[(SBIconView *)self currentLabelAccessoryType]];
  [(SBIconView *)self setNeedsLayout];
}

- (void)_configureLabelAccessoryViewForType:(int64_t)a3
{
  if (self->_displayedLabelAccessoryType != a3)
  {
    self->_displayedLabelAccessoryType = a3;
    id v14 = [(SBIconView *)self reuseDelegate];
    if (self->_labelAccessoryView)
    {
      if (objc_opt_respondsToSelector()) {
        [v14 iconView:self willRemoveIconLabelAccessoryView:self->_labelAccessoryView];
      }
      BOOL v5 = [(SBIconLabelAccessoryView *)self->_labelAccessoryView superview];
      BOOL v6 = [(SBIconView *)self contentContainerView];

      if (v5 == v6) {
        [(SBIconLabelAccessoryView *)self->_labelAccessoryView removeFromSuperview];
      }
      labelAccessoryView = self->_labelAccessoryView;
      self->_labelAccessoryView = 0;
    }
    if (a3)
    {
      if (objc_opt_respondsToSelector())
      {
        int v8 = [v14 iconView:self iconLabelAccessoryViewOfType:a3];
      }
      else
      {
        int v8 = (SBIconLabelAccessoryView *)objc_alloc_init((Class)[(id)objc_opt_class() defaultViewClassForLabelAccessoryType:a3]);
      }
      char v9 = self->_labelAccessoryView;
      self->_labelAccessoryView = v8;

      [(SBIconLabelAccessoryView *)self->_labelAccessoryView setAlpha:1.0];
      id v10 = self->_labelAccessoryView;
      id v11 = [(SBIconView *)self legibilitySettings];
      id v12 = [(SBIconView *)self labelFont];
      [(SBIconLabelAccessoryView *)v10 updateWithLegibilitySettings:v11 labelFont:v12];

      char v13 = [(SBIconView *)self contentContainerView];
      [v13 addSubview:self->_labelAccessoryView];
    }
    [(SBIconView *)self _updateBrightness];
  }
}

- (SBIconLabelViewFactory)iconLabelViewFactory
{
  iconLabelViewFactordouble y = self->_iconLabelViewFactory;
  if (!iconLabelViewFactory)
  {
    BOOL v4 = [(SBIconView *)self createNewIconLabelViewFactory];
    BOOL v5 = self->_iconLabelViewFactory;
    self->_iconLabelViewFactordouble y = v4;

    iconLabelViewFactordouble y = self->_iconLabelViewFactory;
  }
  BOOL v6 = iconLabelViewFactory;
  return v6;
}

- (void)_updateProgressAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  iconImageView = self->_iconImageView;
  int64_t v6 = [(SBIconView *)self progressState];
  BOOL v7 = [(SBIcon *)self->_icon isProgressPaused];
  [(SBIcon *)self->_icon progressPercent];
  -[SBIconImageView setProgressState:paused:percent:animated:](iconImageView, "setProgressState:paused:percent:animated:", v6, v7, v3);
  int v8 = self->_iconImageView;
  double iconAccessoryAlpha = self->_iconAccessoryAlpha;
  [(SBIconImageView *)v8 setProgressAlpha:iconAccessoryAlpha];
}

- (int64_t)progressState
{
  if (![(SBIconView *)self allowsProgressState]) {
    return 0;
  }
  icon = self->_icon;
  return [(SBIcon *)icon progressState];
}

- (BOOL)allowsProgressState
{
  return (*((unsigned __int8 *)self + 548) >> 6) & 1;
}

- (Class)expectedIconImageViewClass
{
  if (self->_icon)
  {
    BOOL v2 = [(SBIcon *)self->_icon iconImageViewClassForLocation:self->_iconLocation];
  }
  else
  {
    self;
    BOOL v2 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  id v8 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    BOOL v4 = (SBHIconImageAppearance *)[v8 copy];
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    int64_t v6 = [(SBIconView *)self customIconImageViewController];
    if (v6)
    {
      [(SBIconView *)self setOverrideImageAppearance:v8 onCustomIconImageViewController:v6];
    }
    else
    {
      BOOL v7 = [(SBIconView *)self _iconImageView];
      [v7 effectiveIconImageAppearanceDidChange];
    }
    [(SBIconView *)self updateAccessoryViewOverrideIconImageAppearance];
  }
}

- (id)createNewIconLabelViewFactory
{
  return +[SBIconLabelViewDefaultFactory sharedInstance];
}

- (id)_legibilitySettingsWithParameters:(id)a3
{
  return self->_legibilitySettings;
}

- (void)_toggleGroupBlendingIfNecessary
{
  id v5 = [(SBIconView *)self contentContainerView];
  BOOL v3 = [(SBIconView *)self _shouldEnableGroupBlending];
  BOOL v4 = [v5 layer];
  [v4 setAllowsGroupBlending:v3];
}

- (void)setUsesSceneUserInterfaceStyleForImage:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 552);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 552) = v3 & 0xFD | v5;
    id v7 = [(SBIconView *)self _iconImageView];
    [v7 updateImageAnimated:1];
    int64_t v6 = [(SBIconView *)self window];
    [(SBIconView *)self updateWindowSceneUserInterfaceStyleChangeRegistrationForWindow:v6];
  }
}

- (void)setSuppressesDefaultEditingAnimation:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 546);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 16;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 546) = v3 & 0xEF | v4;
    [(SBIconView *)self _updateJitter:1 animated:0];
  }
}

- (void)setShowsImageAndLabelDuringDrop:(BOOL)a3
{
  if (self->_showsImageAndLabelDuringDrop != a3)
  {
    self->_showsImageAndLabelDuringDrop = a3;
    [(SBIconView *)self _updateAllComponentAlphas];
  }
}

- (void)setResizeGestureHandler:(id)a3
{
}

- (void)setOverrideImage:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideImage, a3);
    char v5 = [(SBIconView *)self _iconImageView];
    [v5 updateImageAnimated:0];
  }
}

- (void)setOverrideDraggingDelegate:(id)a3
{
}

- (void)setOverrideBadgeNumberOrString:(id)a3 animated:(BOOL)a4
{
  if (self->_overrideBadgeNumberOrString != a3)
  {
    BOOL v4 = a4;
    id v6 = (NSCopying *)[a3 copyWithZone:0];
    overrideBadgeNumberOrString = self->_overrideBadgeNumberOrString;
    self->_overrideBadgeNumberOrString = v6;

    [(SBIconView *)self _updateAccessoryViewAnimated:v4];
  }
}

- (void)setOverrideBadgeNumberOrString:(id)a3
{
}

- (void)setOverrideActionDelegate:(id)a3
{
}

- (void)setOverrideAccessoryIconImageAppearance:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    BOOL v4 = (SBHIconImageAppearance *)[v6 copy];
    overrideAccessoryIconImageAppearance = self->_overrideAccessoryIconImageAppearance;
    self->_overrideAccessoryIconImageAppearance = v4;

    [(SBIconView *)self updateAccessoryViewOverrideIconImageAppearance];
  }
}

- (void)setOverlapping:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 545);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 4;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 545) = v3 & 0xFB | v5;
    [(SBIconView *)self _updateJitter];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
    [(SBIconView *)self transform];
    *((void *)&v8 + 1) = 0x3FF0000000000000;
    *(void *)&long long v7 = 0x3FF0000000000000;
    [(SBIconView *)self _updateAllComponentAlphas];
    [(SBIconView *)self _updateIconImageAdornmentsAnimated:1];
    v6[0] = v7;
    v6[1] = v8;
    v6[2] = v9;
    [(SBIconView *)self setTransform:v6];
  }
}

- (void)setLiftingDragSession:(id)a3
{
}

- (void)setLastContextMenuInteractionFailedToLoad:(BOOL)a3
{
  self->_lastContextMenuInteractionFailedToLoad = a3;
}

- (void)setIconImageAlpha:(double)a3
{
  if (self->_iconImageAlpha != a3)
  {
    self->_double iconImageAlpha = a3;
    [(SBIconView *)self effectiveIconImageAlpha];
    -[SBIconView _applyIconImageAlpha:](self, "_applyIconImageAlpha:");
  }
}

- (void)setGrabbed:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 545);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 545) = v3 & 0xFD | v5;
    [(SBIconView *)self _toggleContentContainerViewIfNecessary];
    [(SBIconView *)self _updateAllComponentAlphas];
    [(SBIconView *)self _updateJitter];
  }
}

- (void)setEditingAnimationStrength:(double)a3
{
  if (self->_editingAnimationStrength != a3)
  {
    self->_editingAnimationStrength = a3;
    if ((*((unsigned char *)self + 546) & 2) != 0)
    {
      [(SBIconView *)self _removeJitterAnimated:0];
      [(SBIconView *)self _addJitterAnimated:0];
    }
  }
}

- (void)setDragging:(BOOL)a3 updateImmediately:(BOOL)a4
{
  char v4 = *((unsigned char *)self + 548);
  if (((((v4 & 2) == 0) ^ a3) & 1) == 0)
  {
    BOOL v5 = a4;
    char v7 = a3 ? 2 : 0;
    *((unsigned char *)self + 548) = v4 & 0xFD | v7;
    [(SBIconView *)self _toggleContentContainerViewIfNecessary];
    [(SBIconView *)self _updateCursorInteractionsEnabled];
    [(SBIconView *)self _updateJitter];
    if (v5)
    {
      [(SBIconView *)self _updateAllComponentAlphas];
    }
  }
}

- (void)setDragging:(BOOL)a3
{
}

- (void)setDragLifted:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 548);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 4;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 548) = v3 & 0xFB | v4;
  }
}

- (void)setCancelingDrag:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 547) = v3 & 0x80 | *((unsigned char *)self + 547) & 0x7F;
}

- (void)setAddedToDrag:(BOOL)a3
{
  *((unsigned char *)self + 548) = *((unsigned char *)self + 548) & 0xFE | a3;
}

- (void)removeAllIconAnimations
{
  *((unsigned char *)self + 546) &= ~2u;
  [(SBIconView *)self _removeAllAnimations:0];
  [(SBIconView *)self _removeAllRetargetableAnimations:1];
}

- (void)earlyTerminateContextMenuDismissAnimation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(NSHashTable *)self->_contextMenuInteractionConfigurations count])
  {
    char v3 = SBLogIconContextMenu();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "earlyTerminateContextMenuDismissAnimation", buf, 2u);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    char v4 = (void *)[(NSHashTable *)self->_contextMenuInteractionConfigurations copy];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          [(SBIconView *)self _contextMenuConfigurationWillDismiss:v9];
          [(SBIconView *)self _contextMenuConfigurationDidDismiss:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v6);
    }

    contextMenuInteractionConfigurations = self->_contextMenuInteractionConfigurations;
    self->_contextMenuInteractionConfigurations = 0;

    id v11 = [(SBIconView *)self shortcutsDelegate];
    if (objc_opt_respondsToSelector()) {
      [v11 iconViewShortcutsPresentationDidCancel:self];
    }
  }
}

- (UIViewPropertyAnimator)closeBoxAnimator
{
  return self->_closeBoxAnimator;
}

- (void)setAccessoryViewAnimator:(id)a3
{
}

- (BOOL)_isShowingAccessoryView
{
  return *((unsigned __int8 *)self + 548) >> 7;
}

- (void)_destroyIconImageView
{
  if (self->_iconImageView)
  {
    if (-[SBIconAccessoryView isDescendantOfView:](self->_accessoryView, "isDescendantOfView:")) {
      [(SBIconAccessoryView *)self->_accessoryView removeFromSuperview];
    }
    id v6 = [(SBIconView *)self reuseDelegate];
    if (self->_iconImageView)
    {
      char v3 = objc_opt_respondsToSelector();
      iconImageView = self->_iconImageView;
      if (v3)
      {
        [v6 iconView:self willRemoveIconImageView:iconImageView];
        iconImageView = self->_iconImageView;
      }
    }
    else
    {
      iconImageView = 0;
    }
    if ([(SBIconImageView *)iconImageView isDescendantOfView:self]) {
      [(SBIconImageView *)self->_iconImageView removeFromSuperview];
    }
    uint64_t v5 = self->_iconImageView;
    self->_iconImageView = 0;
  }
}

- (id)badgeParallaxSettings
{
  if ([(SBIconView *)self isPaused])
  {
    char v3 = 0;
  }
  else
  {
    char v4 = [(SBIconView *)self behaviorDelegate];
    if (objc_opt_respondsToSelector())
    {
      char v3 = [v4 parallaxSettingsForComponentsOfIconView:self];
    }
    else
    {
      char v3 = 0;
    }
  }
  return v3;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"zPosition"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBIconView;
    BOOL v5 = [(SBIconView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

uint64_t __43__SBIconView__updateAccessoryViewAnimated___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _destroyAccessoryView];
}

- (BOOL)isAddedToDrag
{
  return *((unsigned char *)self + 548) & 1;
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (BOOL)_dragInteraction:(id)a3 competingGestureRecognizerShouldDelayLift:(id)a4
{
  id v5 = a4;
  id v6 = [(SBCloseBoxView *)self->_closeBox actionTapGestureRecognizer];
  if (v6 == v5)
  {
    BOOL v8 = 1;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(SBIconAccessoryView *)self->_accessoryView actionTapGestureRecognizer];
    }
    else
    {
      id v7 = 0;
    }
    if (v7 == v5)
    {
      BOOL v8 = 1;
    }
    else
    {
      id v9 = [(SBHIconResizeHandle *)self->_resizeHandle resizingGestureRecognizer];
      BOOL v8 = v9 == v5;
    }
  }

  return v8;
}

+ (BOOL)isIconTapGestureRecognizer:(id)a3
{
  id v3 = a3;
  id v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)matchingIconViewByAddingConfigurationOptions:(unint64_t)a3 removingConfigurationOptions:(unint64_t)a4
{
  unint64_t v5 = ([(SBIconView *)self configurationOptions] | a3) & ~a4;
  return [(SBIconView *)self matchingIconViewWithConfigurationOptions:v5];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v49.receiver = self;
  v49.super_class = (Class)SBIconView;
  -[SBIconView hitTest:withEvent:](&v49, sel_hitTest_withEvent_, v7, x, y);
  BOOL v8 = (SBCloseBoxView *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = [(SBIconView *)self isIconContentScalingEnabled];
  BOOL v10 = v9;
  if (v8) {
    BOOL v11 = !v9;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11) {
    goto LABEL_19;
  }
  if (self->_closeBox && [(SBIconView *)self _isShowingCloseBox])
  {
    if ([(SBIconView *)self isIconContentScalingEnabled])
    {
      long long v12 = [(SBIconView *)self contentContainerView];
      objc_msgSend(v12, "convertPoint:fromView:", self, x, y);
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      [(SBCloseBoxView *)self->_closeBox frame];
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      [(SBIconView *)self iconContentScale];
      CGAffineTransformMakeScale(&v47, v25, v25);
      CGAffineTransformInvert(&v48, &v47);
      v53.origin.double x = v18;
      v53.origin.double y = v20;
      v53.size.CGFloat width = v22;
      v53.size.double height = v24;
      CGRect v54 = CGRectApplyAffineTransform(v53, &v48);
      v51.double x = v14;
      v51.double y = v16;
      if (CGRectContainsPoint(v54, v51))
      {
        id v26 = self->_closeBox;

        BOOL v8 = v26;
      }
    }
    else
    {
      -[SBCloseBoxView convertPoint:fromView:](self->_closeBox, "convertPoint:fromView:", self, x, y);
      if (!-[SBCloseBoxView pointInside:withEvent:](self->_closeBox, "pointInside:withEvent:", v7)) {
        goto LABEL_13;
      }
      long long v12 = v8;
      BOOL v8 = self->_closeBox;
    }
  }
LABEL_13:
  if (!v8)
  {
    if (self->_resizeHandle
      && [(SBIconView *)self isShowingResizeHandle]
      && (-[SBHIconResizeHandle convertPoint:fromView:](self->_resizeHandle, "convertPoint:fromView:", self, x, y),
          -[SBHIconResizeHandle pointInside:withEvent:](self->_resizeHandle, "pointInside:withEvent:", v7)))
    {
      BOOL v8 = self->_resizeHandle;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
LABEL_19:
  if (v8 == (SBCloseBoxView *)self && v10)
  {
    double v28 = [(SBIconView *)self contentContainerView];
    objc_msgSend(v28, "convertPoint:fromView:", self, x, y);
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    [v28 bounds];
    v52.double x = v30;
    v52.double y = v32;
    BOOL v8 = (SBCloseBoxView *)self;
    if (!CGRectContainsPoint(v55, v52))
    {

      BOOL v8 = 0;
    }
  }
  if (!v8)
  {
    if ([(SBIconView *)self allowsPassthroughHitTesting])
    {
      uint64_t v41 = 0;
      CGFloat v42 = &v41;
      uint64_t v43 = 0x3032000000;
      CGRect v44 = __Block_byref_object_copy__16;
      BOOL v45 = __Block_byref_object_dispose__16;
      id v46 = 0;
      id v33 = [(SBIconView *)self subviews];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __32__SBIconView_hitTest_withEvent___block_invoke;
      v36[3] = &unk_1E6AB30E8;
      double v39 = x;
      double v40 = y;
      CGFloat v38 = &v41;
      v36[4] = self;
      id v37 = v7;
      [v33 enumerateObjectsWithOptions:2 usingBlock:v36];

      BOOL v8 = (SBCloseBoxView *)v42[5];
      if (v8) {
        double v34 = v8;
      }

      _Block_object_dispose(&v41, 8);
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isIconContentScalingEnabled
{
  return (*((unsigned char *)self + 547) & 8) != 0
      || [(SBIconView *)self _isForcingIconContentScalingEnabled];
}

- (BOOL)_isForcingIconContentScalingEnabled
{
  return (*((unsigned __int8 *)self + 547) >> 4) & 1;
}

- (unint64_t)configurationOptions
{
  if ([(SBIconView *)self isUserInteractionEnabled]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 4;
  }
  if (![(SBIconView *)self allowsLabelArea]) {
    v3 |= 2uLL;
  }
  BOOL v4 = [(SBIconView *)self allowsPassthroughHitTesting];
  uint64_t v5 = v3 | 8;
  if (!v4) {
    uint64_t v5 = v3;
  }
  unint64_t v6 = v5 | ((unint64_t)*((unsigned __int8 *)self + 549) >> 1) & 0x10;
  if ([(SBIconView *)self allowsAccessoryView]) {
    return v6;
  }
  else {
    return v6 | 0x20;
  }
}

- (BOOL)allowsPassthroughHitTesting
{
  return (*((unsigned __int8 *)self + 549) >> 1) & 1;
}

uint64_t __55__SBIconView_matchingIconViewWithConfigurationOptions___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) configureMatchingIconView:*(void *)(a1 + 40)];
  BOOL v2 = *(void **)(a1 + 40);
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v2 frame];
  return objc_msgSend(v2, "setFrame:", v3, v4);
}

- (void)configureMatchingIconView:(id)a3
{
  id v29 = a3;
  double v4 = [(SBIconView *)self icon];
  uint64_t v5 = [(SBIconImageView *)self->_iconImageView displayedImage];
  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    long long v12 = 0;
  }
  else
  {
    id v7 = [(SBIconImageView *)self->_iconImageView displayedImageAppearance];
    [(SBIconView *)self iconImageInfo];
    long long v12 = -[SBHIconImageCache initWithName:iconImageInfo:]([SBHIconViewNonPoolingImageCache alloc], "initWithName:iconImageInfo:", &stru_1F2FA0300, v8, v9, v10, v11);
    [(SBHIconImageCache *)v12 cacheImage:v5 forIcon:v4 imageAppearance:v7];
  }
  double v13 = [(SBIconView *)self location];
  [v29 setLocation:v13];

  CGFloat v14 = [(SBIconView *)self listLayoutProvider];
  [v29 setListLayoutProvider:v14];

  if (v12)
  {
    [v29 setIconImageCache:v12];
  }
  else
  {
    double v15 = [(SBIconView *)self iconImageCache];
    [v29 setIconImageCache:v15];
  }
  CGFloat v16 = [(SBIconView *)self folderIconImageCache];
  [v29 setFolderIconImageCache:v16];

  [v29 setIconContentScalingEnabled:(*((unsigned __int8 *)self + 547) >> 3) & 1];
  [(SBIconView *)self iconContentScale];
  objc_msgSend(v29, "setIconContentScale:");
  objc_msgSend(v29, "setStartsDragMoreQuickly:", -[SBIconView startsDragMoreQuickly](self, "startsDragMoreQuickly"));
  objc_msgSend(v29, "setFolderBackgroundStyle:", -[SBIconView folderBackgroundStyle](self, "folderBackgroundStyle"));
  objc_msgSend(v29, "setAllowsEditingAnimation:", -[SBIconView allowsEditingAnimation](self, "allowsEditingAnimation"));
  objc_msgSend(v29, "setAllowsCloseBox:", -[SBIconView allowsCloseBox](self, "allowsCloseBox"));
  objc_msgSend(v29, "setAllowsAccessoryView:", -[SBIconView allowsAccessoryView](self, "allowsAccessoryView"));
  objc_msgSend(v29, "setAllowsResizeHandle:", -[SBIconView allowsResizeHandle](self, "allowsResizeHandle"));
  objc_msgSend(v29, "setAllowsAdornmentsOverIconImage:", -[SBIconView allowsAdornmentsOverIconImage](self, "allowsAdornmentsOverIconImage"));
  double v17 = [(SBIconView *)self continuityInfo];
  [v29 setContinuityInfo:v17];

  CGFloat v18 = [(SBIconView *)self legibilitySettings];
  [v29 setLegibilitySettings:v18];

  if ((*((unsigned char *)self + 549) & 8) != 0)
  {
    [(SBIconView *)self iconImageInfo];
    objc_msgSend(v29, "setIconImageInfo:");
  }
  double v19 = [(SBIconView *)self traitCollection];
  CGFloat v20 = objc_msgSend(v19, "sbh_iconImageAppearance");
  if (v20)
  {
    double v21 = [v29 traitOverrides];
    CGFloat v22 = self;
    [v21 setObject:v20 forTrait:v22];

    [v29 setOverrideIconImageAppearance:v20];
  }
  double v23 = [(SBIconView *)self delegate];
  [v29 setDelegate:v23];

  [v29 setIcon:v4];
  CGFloat v24 = [v29 customIconImageViewController];
  if (v24)
  {
    if (objc_opt_respondsToSelector())
    {
      CGFloat v25 = [(SBIconView *)self customIconImageViewController];
      char v26 = objc_opt_respondsToSelector();

      if (v26)
      {
        long long v27 = [(SBIconView *)self customIconImageViewController];
        objc_msgSend(v24, "setImageViewAlignment:", objc_msgSend(v27, "imageViewAlignment"));
      }
    }
  }
  double v28 = [(SBIconView *)self iconImageCache];
  [v29 setIconImageCache:v28];
}

- (void)setStartsDragMoreQuickly:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 547);
  if (((((v3 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 64;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 547) = v3 & 0xBF | v4;
    [(SBIconView *)self _updateDragInteractionLiftDelay];
  }
}

- (void)setIconContentScalingEnabled:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 547);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 8;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 547) = v3 & 0xF7 | v5;
    [(SBIconView *)self _toggleContentContainerViewIfNecessary];
    [(SBIconView *)self _updateIconContentScale];
  }
}

- (void)setAllowsEditingAnimation:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 546);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 8;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 546) = v3 & 0xF7 | v4;
    [(SBIconView *)self _updateJitterAnimated:0];
  }
}

- (void)setAllowsAdornmentsOverIconImage:(BOOL)a3 animated:(BOOL)a4
{
  char v4 = *((unsigned char *)self + 547);
  if (((((v4 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 32;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 547) = v4 & 0xDF | v5;
    [(SBIconView *)self _updateIconImageAdornmentsAnimated:a4];
  }
}

- (void)setAllowsAdornmentsOverIconImage:(BOOL)a3
{
}

- (void)setFolderBackgroundStyle:(unint64_t)a3
{
  id v4 = [(SBIconView *)self _folderIconImageView];
  [v4 setBackgroundStyle:a3];
}

- (unint64_t)folderBackgroundStyle
{
  BOOL v2 = [(SBIconView *)self _folderIconImageView];
  unint64_t v3 = [v2 backgroundStyle];

  return v3;
}

- (BOOL)allowsResizeHandle
{
  return (*((unsigned __int8 *)self + 546) >> 6) & 1;
}

- (BOOL)allowsEditingAnimation
{
  return (*((unsigned __int8 *)self + 546) >> 3) & 1;
}

- (BOOL)allowsCloseBox
{
  return (*((unsigned __int8 *)self + 546) >> 5) & 1;
}

+ (double)labelMaximumHeightForContentSizeCategory:(id)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  long long v10 = *MEMORY[0x1E4FB2848];
  long long v11 = v3;
  id v4 = +[SBIconLabelImageParametersBuilder defaultFontForContentSizeCategory:a3 languageInsets:&v10];
  [v4 ascender];
  double v6 = v5;
  [v4 descender];
  *(float *)&double v7 = v6 + fabs(v7) + fabs(*(double *)&v10) + fabs(*(double *)&v11);
  double v8 = ceilf(*(float *)&v7);

  return v8;
}

- (id)labelImageWithParameters:(id)a3
{
  id v4 = a3;
  double v5 = [(SBIconView *)self reuseDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconView:self labelImageWithParameters:v4];
  }
  else {
  double v6 = +[SBIconLabelImage imageWithParameters:v4];
  }

  return v6;
}

- (id)_labelImageParameters
{
  long long v3 = objc_alloc_init(SBIconLabelImageParametersBuilder);
  [(SBIconView *)self configureLabelImageParametersBuilder:v3];
  id v4 = [(SBIconLabelImageParametersBuilder *)v3 buildParameters];

  return v4;
}

- (void)configureLabelImageParametersBuilder:(id)a3
{
  id v11 = a3;
  id v4 = [(SBIconView *)self icon];
  double v5 = [(SBIconView *)self location];
  [(id)objc_opt_class() configureLabelImageParametersBuilder:v11 forIcon:v4 location:v5];
  [v11 setIconView:self];
  double v6 = [(SBIconView *)self legibilitySettings];
  [v11 setLegibilitySettings:v6];

  objc_msgSend(v11, "setLabelAccessoryType:", -[SBIconView currentLabelAccessoryType](self, "currentLabelAccessoryType"));
  double v7 = [(SBIconView *)self contentSizeCategory];
  [v11 setContentSizeCategory:v7];
  double v8 = [(SBIconView *)self labelFont];
  if (v8) {
    [v11 setFont:v8];
  }
  if ((*((unsigned char *)self + 545) & 0x40) != 0 && (*((char *)self + 545) & 0x80000000) == 0)
  {
    double v9 = [v4 displayNameForObscuredDisabledLaunchForLocation:v5];
    [v11 setOverrideText:v9];
  }
  long long v10 = [(SBIconView *)self iconLabelViewFactory];
  [(id)objc_opt_class() configureLabelImageParametersBuilder:v11];
}

- (UIFont)labelFont
{
  long long v3 = self->_labelFont;
  id v4 = [(SBIconView *)self contentSizeCategory];
  if (!v3)
  {
    double v5 = [(SBIconView *)self listLayout];
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(v5, "labelFontForContentSizeCategory:options:", v4, -[SBIconView isLabelTextBold](self, "isLabelTextBold"));
      long long v3 = (UIFont *)objc_claimAutoreleasedReturnValue();

      if (v3) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    long long v3 = +[SBIconLabelImageParametersBuilder defaultFontForContentSizeCategory:v4 languageInsets:0];
  }
LABEL_7:

  return v3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)displaysIconStatusInLabel
{
  return *((unsigned char *)self + 551) & 1;
}

- (BOOL)shouldShowLabelAccessoryView
{
  return [(SBIconView *)self currentLabelAccessoryType] != 0;
}

+ (void)configureLabelImageParametersBuilder:(id)a3 forIcon:(id)a4 location:(id)a5
{
}

- (void)didMoveToWindow
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)SBIconView;
  [(SBIconView *)&v15 didMoveToWindow];
  long long v3 = [(SBIconView *)self window];

  if ((*((unsigned char *)self + 547) & 1) != 0 && !v3)
  {
    id v4 = [MEMORY[0x1E4F1CAD0] set];
    [(SBIconView *)self touchesCancelled:v4 withEvent:0];

    [(SBIconView *)self setPaused:1 forReason:1];
    goto LABEL_7;
  }
  [(SBIconView *)self setPaused:v3 == 0 forReason:1];
  if (!v3)
  {
LABEL_7:
    [(SBIconView *)self dismissContextMenuWithCompletion:0];
    [(SBIconView *)self dismissConfigurationCardImmediately];
    [(SBIconView *)self dismissStackConfigurationCardImmediately];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v5 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 iconViewDidBecomeWindowless:self];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
    goto LABEL_16;
  }
  if (![(SBIconView *)self usesSceneUserInterfaceStyleForImage]) {
    return;
  }
  double v5 = [(SBIconView *)self _iconImageView];
  [v5 updateImageAnimated:0];
LABEL_16:
}

- (void)dismissContextMenuWithCompletion:(id)a3
{
  long long v10 = (void (**)(void))a3;
  if (![(SBIconView *)self isContextMenuInteractionActive])
  {
    uint64_t v8 = v10;
    if (!v10) {
      goto LABEL_9;
    }
    v10[2](v10);
    goto LABEL_8;
  }
  if (v10)
  {
    performAfterContextMenuBlocks = self->_performAfterContextMenuBlocks;
    double v5 = (void *)[v10 copy];
    uint64_t v6 = _Block_copy(v5);
    [(NSMutableArray *)performAfterContextMenuBlocks addObject:v6];
  }
  BOOL v7 = [(SBIconView *)self isDragging];
  uint64_t v8 = v10;
  if (!v7)
  {
    uint64_t v9 = [(SBIconView *)self contextMenuInteraction];
    [v9 dismissMenu];

LABEL_8:
    uint64_t v8 = v10;
  }
LABEL_9:
}

- (void)_updateLabel
{
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      BOOL v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)setAllowsResizeHandle:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 546);
  if (((((v3 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 64;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 546) = v3 & 0xBF | v4;
    [(SBIconView *)self _updateResizeHandleAnimated:1];
  }
}

- (void)setAllowsCloseBox:(BOOL)a3 withAnimation:(int64_t)a4
{
  char v4 = *((unsigned char *)self + 546);
  if (((((v4 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v7 = 32;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 546) = v4 & 0xDF | v7;
    uint64_t v8 = [(SBIconView *)self window];
    if (!v8
      || (uint64_t v9 = (void *)v8,
          [(SBIconView *)self icon],
          long long v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      a4 = 2;
    }
    [(SBIconView *)self _updateCloseBoxWithAnimation:a4];
  }
}

- (void)setAllowsCloseBox:(BOOL)a3
{
}

- (void)setImageLoadingBehavior:(unint64_t)a3
{
  *((unsigned char *)self + 550) = *((unsigned char *)self + 550) & 0xF9 | (2 * (a3 & 3));
}

- (void)setDisplaysIconStatusInLabel:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 551);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 551) = v3 & 0xFE | a3;
    [(SBIconView *)self _updateLabel];
  }
}

- (BOOL)isShowingConfigurationCard
{
  BOOL v2 = [(SBIconView *)self currentConfigurationInteraction];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)dismissConfigurationCardImmediately
{
  id v2 = [(SBIconView *)self currentConfigurationInteraction];
  [v2 endConfigurationImmediately];
}

- (SBHIconViewConfigurationInteraction)currentConfigurationInteraction
{
  return self->_currentConfigurationInteraction;
}

- (void)dismissStackConfigurationCardImmediately
{
  id v2 = [(SBIconView *)self currentStackConfigurationInteraction];
  [v2 endConfigurationImmediately];
}

- (SBHIconViewConfigurationInteraction)currentStackConfigurationInteraction
{
  return self->_currentStackConfigurationInteraction;
}

- (BOOL)isCursorActive
{
  return [(NSCountedSet *)self->_activePointerRegions count] != 0;
}

- (id)matchingIconViewWithConfigurationOptions:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = [(SBIconView *)self listLayoutProvider];
  char v7 = (void *)[v5 initWithConfigurationOptions:a3 listLayoutProvider:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__SBIconView_matchingIconViewWithConfigurationOptions___block_invoke;
  v13[3] = &unk_1E6AACA90;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  [v8 performWithoutAnimation:v13];
  long long v10 = v14;
  id v11 = v9;

  return v11;
}

- (SBIconView)initWithConfigurationOptions:(unint64_t)a3 listLayoutProvider:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() defaultIconLocation];
  if (v8)
  {
    id v9 = [v7 layoutForIconLocation:v8];
    [v9 iconImageInfo];
    double v13 = v12;
    double v15 = v14;
    if (v9)
    {
      double v16 = v10;
      double v17 = v11;

      int v18 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    [0 iconImageInfo];
    double v13 = v19;
    double v15 = v20;
  }
  [(id)objc_opt_class() defaultIconImageSize];
  double v16 = v21;
  double v17 = v22;
  int v18 = 1;
LABEL_6:
  objc_msgSend((id)objc_opt_class(), "defaultIconViewSizeForIconImageSize:configurationOptions:", a3, v16, v17);
  v49.receiver = self;
  v49.super_class = (Class)SBIconView;
  CGFloat v25 = -[SBIconView initWithFrame:](&v49, sel_initWithFrame_, 0.0, 0.0, v23, v24);
  char v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_listLayoutProvider, a4);
    *((unsigned char *)v26 + 549) = *((unsigned char *)v26 + 549) & 0xDF | (2 * a3) & 0x20;
    *((unsigned char *)v26 + 549) = *((unsigned char *)v26 + 549) & 0xFE | ((a3 & 2) == 0);
    *((unsigned char *)v26 + 549) = *((unsigned char *)v26 + 549) & 0xFD | (a3 >> 2) & 2;
    objc_storeStrong((id *)&v26->_iconLocation, v8);
    v26->_double iconLabelAlpha = 1.0;
    v26->_double iconAccessoryAlpha = 1.0;
    v26->_double iconImageAlpha = 1.0;
    v26->_iconImageInfo.size.CGFloat width = v16;
    v26->_iconImageInfo.size.double height = v17;
    if (v18)
    {
      [(id)objc_opt_class() defaultIconImageScale];
      v26->_iconImageInfo.scale = v27;
      [(id)objc_opt_class() defaultIconImageCornerRadius];
      double v15 = v28;
    }
    else
    {
      v26->_iconImageInfo.scale = v13;
    }
    v26->_iconImageInfo.continuousCornerRadius = v15;
    *((unsigned char *)v26 + 550) = *((unsigned char *)v26 + 550) & 0xF9 | (2
                                                          * ([(id)objc_opt_class() defaultImageLoadingBehavior] & 3));
    *((unsigned char *)v26 + 548) = (*((unsigned char *)v26 + 548) & 0xDF | a3 & 0x20) ^ 0x20;
    v26->_approximateLayoutPosition.unint64_t horizontal = 0;
    v26->_approximateLayoutPosition.unint64_t vertical = 0;
    __asm { FMOV            V0.2D, #-5.0 }
    *(_OWORD *)&v26->_cursorHitTestPadding.double top = _Q0;
    *(_OWORD *)&v26->_cursorHitTestPadding.bottom = _Q0;
    *((unsigned char *)v26 + 546) = (a3 & 0x80 | *((unsigned char *)v26 + 546) & 0x7F) ^ 0x80;
    uint64_t v34 = [(id)objc_opt_class() defaultLegibilitySettings];
    legibilitySettings = v26->_legibilitySettings;
    v26->_legibilitySettings = (_UILegibilitySettings *)v34;

    v26->_displayedLabelAccessoryType = 0;
    v26->_enabled = 1;
    v26->_iconContentScale = 1.0;
    *((unsigned char *)v26 + 548) |= 0x40u;
    *((unsigned char *)v26 + 546) |= 8u;
    v26->_editingAnimationStrength = 1.0;
    *((unsigned char *)v26 + 546) |= 0x20u;
    *((unsigned char *)v26 + 547) |= 0x20u;
    *((_WORD *)v26 + 272) = *((_WORD *)v26 + 272) & 0xFE0F | 0x30;
    [(SBIconView *)v26 setOpaque:0];
    [(SBIconView *)v26 setExclusiveTouch:1];
    v26->_customIconImageViewControllerPrioritdouble y = 0;
    if ([(id)objc_opt_class() _shouldAlwaysHaveContentContainerView])
    {
      id v36 = objc_alloc((Class)[(id)objc_opt_class() contentContainerViewClass]);
      [(SBIconView *)v26 bounds];
      uint64_t v37 = objc_msgSend(v36, "initWithFrame:");
      scalingContainer = v26->_scalingContainer;
      v26->_scalingContainer = (UIView *)v37;

      [(SBIconView *)v26 addSubview:v26->_scalingContainer];
    }
    [(SBIconView *)v26 configureForLabelAllowed:(a3 & 2) == 0];
    if ((a3 & 4) != 0) {
      [(SBIconView *)v26 setUserInteractionEnabled:0];
    }
    else {
      [(SBIconView *)v26 addGesturesAndInteractionsIfNecessary];
    }
    [(SBIconView *)v26 updateParallaxSettings];
    if (__sb__runningInSpringBoard())
    {
      double v39 = +[SBHHomeScreenDomain rootSettings];
      uint64_t v40 = [v39 iconEditingSettings];
      iconEditingSettings = v26->_iconEditingSettings;
      v26->_iconEditingSettings = (SBHIconEditingSettings *)v40;

      [(PTSettings *)v26->_iconEditingSettings addKeyObserver:v26];
      uint64_t v42 = [v39 iconResizingSettings];
      iconResizingSettings = v26->_iconResizingSettings;
      v26->_iconResizingSettings = (SBHIconResizingSettings *)v42;
    }
    [(SBIconView *)v26 _applyIconEditingSettings];
    if ((__sb__runningInSpringBoard() & 1) == 0)
    {
      CGRect v44 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
      BOOL v45 = [v44 addMonitor:v26 subjectMask:1 subscriptionOptions:1];
      objc_storeWeak((id *)&v26->_appPrototectionSubjectMonitorSubscription, v45);
    }
    id v46 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v46 addObserver:v26 selector:sel__backgroundContrastDidChange_ name:*MEMORY[0x1E4FB24A8] object:0];
    [v46 addObserver:v26 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
    [v46 addObserver:v26 selector:sel__boldTextStatusDidChange_ name:*MEMORY[0x1E4FB2420] object:0];
    [v46 addObserver:v26 selector:sel__refreshAccessoryViewNotification_ name:@"SBIconViewRefreshAccessoryViewNotification" object:0];
    CGAffineTransform v47 = +[SBHIconViewContextMenuStateController sharedInstance];
    [v47 registerIconView:v26];
  }
  return v26;
}

+ (unint64_t)defaultImageLoadingBehavior
{
  return 0;
}

- (void)configureForLabelAllowed:(BOOL)a3
{
  BOOL v4 = !a3;
  [(SBIconView *)self setLabelHidden:v4];
  [(SBIconView *)self setLabelAccessoryHidden:v4];
  [(SBIconView *)self _updateFrameToIconViewSize];
}

- (void)setLabelHidden:(BOOL)a3
{
  int v4 = ![(SBIconView *)self allowsLabelArea] || a3;
  char v5 = *((unsigned char *)self + 547);
  if (((v4 ^ ((v5 & 2) == 0)) & 1) == 0)
  {
    if (v4) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 547) = v5 & 0xFD | v6;
    [(SBIconView *)self _updateLabelAnimated:0];
  }
}

- (void)setLabelAccessoryHidden:(BOOL)a3
{
  int v4 = ![(SBIconView *)self allowsLabelArea] || a3;
  char v5 = *((unsigned char *)self + 547);
  if (((v4 ^ ((v5 & 4) == 0)) & 1) == 0)
  {
    if (v4) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 547) = v5 & 0xFB | v6;
    [(SBIconView *)self _updateLabelAreaAnimated:0];
  }
}

- (void)_applyIconEditingSettings
{
  [(SBIconView *)self _updateDragInteractionLiftDelay];
  BOOL v3 = [(SBHIconEditingSettings *)self->_iconEditingSettings showIndexLabels];
  iconIndexLabel = self->_iconIndexLabel;
  if (v3)
  {
    if (!iconIndexLabel)
    {
      char v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      char v6 = self->_iconIndexLabel;
      self->_iconIndexLabel = v5;

      id v7 = self->_iconIndexLabel;
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_debugIconIndex);
      [(UILabel *)v7 setText:v8];

      id v9 = self->_iconIndexLabel;
      double v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:*MEMORY[0x1E4FB0938] weight:24.0 design:*MEMORY[0x1E4FB09D0]];
      [(UILabel *)v9 setFont:v10];

      double v11 = self->_iconIndexLabel;
      double v12 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UILabel *)v11 setTextColor:v12];

      double v13 = self->_iconIndexLabel;
      double v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
      [(UILabel *)v13 setBackgroundColor:v14];

      [(UILabel *)self->_iconIndexLabel setTextAlignment:1];
      double v15 = [(SBIconView *)self contentContainerView];
      [v15 addSubview:self->_iconIndexLabel];

      [(SBIconView *)self setNeedsLayout];
    }
  }
  else if (iconIndexLabel)
  {
    [(UILabel *)iconIndexLabel removeFromSuperview];
    double v16 = self->_iconIndexLabel;
    self->_iconIndexLabel = 0;
  }
}

+ (id)defaultLegibilitySettings
{
  return (id)[MEMORY[0x1E4FB21E0] sharedInstanceForStyle:1];
}

+ (CGSize)defaultIconViewSizeForIconImageSize:(CGSize)a3 configurationOptions:(unint64_t)a4
{
  double height = a3.height;
  CGFloat width = a3.width;
  if ((a4 & 2) == 0)
  {
    [a1 _labelHeight];
    double height = height + v6;
  }
  double v7 = width;
  double v8 = height;
  result.double height = v8;
  result.CGFloat width = v7;
  return result;
}

+ (NSString)defaultIconLocation
{
  return (NSString *)@"SBIconLocationRoot";
}

+ (Class)contentContainerViewClass
{
  return (Class)self;
}

+ (BOOL)_shouldAlwaysHaveContentContainerView
{
  if (_shouldAlwaysHaveContentContainerView_onceToken != -1) {
    dispatch_once(&_shouldAlwaysHaveContentContainerView_onceToken, &__block_literal_global_204);
  }
  return _shouldAlwaysHaveContentContainerView_shouldAlwaysHaveContentContainerView;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB24A8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2420] object:0];
  [(SBIconView *)self setIcon:0];
  [(SBIconView *)self _invalidateHomeButtonPressConsumingAssertion];
  [(PTSettings *)self->_iconEditingSettings removeKeyObserver:self];
  int v4 = +[SBHIconViewContextMenuStateController sharedInstance];
  [v4 unregisterIconView:self];

  [(BSInvalidatable *)self->_springBoardIconStyleObservation invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPrototectionSubjectMonitorSubscription);
  [WeakRetained invalidate];

  v6.receiver = self;
  v6.super_class = (Class)SBIconView;
  [(SBIconView *)&v6 dealloc];
}

- (void)setHomeButtonPressConsumingAssertion:(id)a3
{
}

- (void)_invalidateHomeButtonPressConsumingAssertion
{
  BOOL v3 = [(SBIconView *)self homeButtonPressConsumingAssertion];
  [v3 invalidate];

  [(SBIconView *)self setHomeButtonPressConsumingAssertion:0];
}

- (BSInvalidatable)homeButtonPressConsumingAssertion
{
  return self->_homeButtonPressConsumingAssertion;
}

- (void)_updateCursorInteractionsEnabled
{
  BOOL v3 = [(SBIconView *)self _isCursorInteractionEnabled];
  if (v3 != [(UIPointerInteraction *)self->_iconViewCursorInteraction isEnabled])
  {
    [(UIPointerInteraction *)self->_iconViewCursorInteraction setEnabled:v3];
    [(UIPointerInteraction *)self->_iconViewCursorInteraction invalidate];
  }
  if (v3 != [(UIPointerInteraction *)self->_closeBoxCursorInteraction isEnabled])
  {
    [(UIPointerInteraction *)self->_closeBoxCursorInteraction setEnabled:v3];
    [(UIPointerInteraction *)self->_closeBoxCursorInteraction invalidate];
  }
  if (v3 != [(UIPointerInteraction *)self->_accessoryViewCursorInteraction isEnabled])
  {
    [(UIPointerInteraction *)self->_accessoryViewCursorInteraction setEnabled:v3];
    [(UIPointerInteraction *)self->_accessoryViewCursorInteraction invalidate];
  }
  if (v3 != [(UIPointerInteraction *)self->_resizeHandleCursorInteraction isEnabled])
  {
    [(UIPointerInteraction *)self->_resizeHandleCursorInteraction setEnabled:v3];
    resizeHandleCursorInteraction = self->_resizeHandleCursorInteraction;
    [(UIPointerInteraction *)resizeHandleCursorInteraction invalidate];
  }
}

- (BOOL)_isCursorInteractionEnabled
{
  return ![(SBIconView *)self isDragging]
      && (*((char *)self + 550) & 0x80000000) == 0
      && (*((unsigned char *)self + 550) & 8) == 0;
}

- (void)_applyEditingStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  -[SBIconView _updateCustomIconImageViewController:](self, "_updateCustomIconImageViewController:");
  [(SBIconView *)self _updateAllComponentAlphasAnimated:v3];
  [(SBIconView *)self _updateJitter];
  [(SBIconView *)self _updateIconImageAdornmentsAnimated:v3];
  [(SBIconView *)self _updateDragInteractionLiftDelay];
  [(UIPointerInteraction *)self->_iconViewCursorInteraction invalidate];
  [(UIPointerInteraction *)self->_closeBoxCursorInteraction invalidate];
  [(UIPointerInteraction *)self->_accessoryViewCursorInteraction invalidate];
  [(UIPointerInteraction *)self->_resizeHandleCursorInteraction invalidate];
  if ([(SBIconView *)self isFolderIcon])
  {
    if ([(SBIconView *)self isEditing])
    {
      [(SBIconView *)self scrollToFirstGapAnimated:v3];
    }
    else
    {
      [(SBIconView *)self scrollToTopOfFirstPageAnimated:v3];
    }
  }
}

- (void)_updateAllComponentAlphasAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__SBIconView__updateAllComponentAlphasAnimated___block_invoke;
  aBlock[3] = &unk_1E6AAC810;
  void aBlock[4] = self;
  int v4 = _Block_copy(aBlock);
  char v5 = v4;
  if (v3) {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:0.3];
  }
  else {
    (*((void (**)(void *))v4 + 2))(v4);
  }
}

- (void)_updateDragInteractionLiftDelay
{
  [(SBIconView *)self dragInteractionLiftDelay];
  double v4 = v3;
  id v5 = [(SBIconView *)self dragInteraction];
  [v5 _setLiftDelay:v4];
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (double)dragInteractionLiftDelay
{
  [(id)objc_opt_class() _defaultDragInteractionLiftDelay];
  double v4 = v3;
  if ([(SBIconView *)self isEditing])
  {
    iconEditingSettings = self->_iconEditingSettings;
    if (iconEditingSettings)
    {
      [(SBHIconEditingSettings *)iconEditingSettings editingLiftDelay];
      if (v6 < v4) {
        double v4 = v6;
      }
    }
    else
    {
      double v4 = 0.1;
    }
  }
  BOOL v7 = [(SBIconView *)self startsDragMoreQuickly];
  double result = 0.2;
  if (!v7 || v4 <= 0.2) {
    return v4;
  }
  return result;
}

- (BOOL)startsDragMoreQuickly
{
  return (*((unsigned __int8 *)self + 547) >> 6) & 1;
}

+ (double)_defaultDragInteractionLiftDelay
{
  return 1.4;
}

- (void)_updateCustomIconImageViewController:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(SBIconView *)self customIconImageViewController];
  if (v6)
  {
    BOOL v5 = [(SBIconView *)self isEditing];
    if (objc_opt_respondsToSelector())
    {
      [v6 setEditing:v5 animated:v3];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v6 setEditing:v5];
    }
  }
}

- (void)setAllIconElementsButLabelHidden:(BOOL)a3
{
  unsigned int v3 = *((unsigned __int8 *)self + 550);
  if (a3 != v3 >> 7)
  {
    if (a3) {
      char v5 = 0x80;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 550) = v5 & 0x80 | v3 & 0x7F;
    [(SBIconView *)self _updateAllComponentAlphas];
    [(SBIconView *)self _updateCursorInteractionsEnabled];
  }
}

- (void)_updateAllComponentAlphas
{
}

- (unint64_t)visibleMiniIconListIndex
{
  id v2 = [(SBIconView *)self _folderIconImageView];
  unint64_t v3 = [v2 visibleMiniIconListIndex];

  return v3;
}

- (void)setFolderIconFrozen:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBIconView *)self _isFolderIconFreezingSupported])
  {
    char v5 = *((unsigned char *)self + 548);
    if (((((v5 & 8) == 0) ^ v3) & 1) == 0)
    {
      if (v3) {
        char v6 = 8;
      }
      else {
        char v6 = 0;
      }
      *((unsigned char *)self + 548) = v5 & 0xF7 | v6;
      if (v3)
      {
        BOOL v7 = [(SBIconView *)self reuseDelegate];
        if (objc_opt_respondsToSelector())
        {
          double v8 = [v7 screenSnapshotProviderForComponentsOfIconView:self];
          snapshotProvider = self->_snapshotProvider;
          self->_snapshotProvider = v8;

          if (self->_snapshotProvider)
          {
            double v10 = [(SBIconView *)self _folderIconImageView];
            id v11 = objc_alloc(MEMORY[0x1E4FB1EB0]);
            [v10 frame];
            double v12 = (UIView *)objc_msgSend(v11, "initWithFrame:");
            snapshotContainerView = self->_snapshotContainerView;
            self->_snapshotContainerView = v12;

            [(UIView *)self->_snapshotContainerView setClipsToBounds:1];
            double v14 = self->_snapshotContainerView;
            [(SBIconView *)self iconImageCornerRadius];
            -[UIView _setContinuousCornerRadius:](v14, "_setContinuousCornerRadius:");
            [(SBIconView *)self addSubview:self->_snapshotContainerView];
            double v15 = [(SBIconViewSnapshotProviding *)self->_snapshotProvider snapshotView];
            [(UIView *)self->_snapshotContainerView addSubview:v15];
            [v15 frame];
            double v17 = v16;
            double v19 = v18;
            double v21 = v20;
            double v23 = v22;
            double v24 = [v10 superview];
            CGFloat v25 = [(SBIconView *)self window];
            objc_msgSend(v25, "convertRect:fromWindow:", 0, v17, v19, v21, v23);
            objc_msgSend(v24, "convertRect:fromView:", 0);
            double v27 = v26;
            double v29 = v28;
            double v31 = v30;
            double v33 = v32;

            objc_msgSend(v15, "setFrame:", v27, v29, v31, v33);
          }
        }
      }
      else
      {
        uint64_t v34 = [(SBIconViewSnapshotProviding *)self->_snapshotProvider snapshotView];
        [v34 removeFromSuperview];

        [(SBIconViewSnapshotProviding *)self->_snapshotProvider invalidate];
        BOOL v7 = self->_snapshotProvider;
        self->_snapshotProvider = 0;
      }

      id v35 = [(SBIconView *)self _folderIconImageView];
      [v35 setPageGridHidden:(*((unsigned __int8 *)self + 548) >> 3) & 1];

      id v36 = [(SBIconView *)self folderIconBackgroundView];
      [v36 setHidden:(*((unsigned __int8 *)self + 548) >> 3) & 1];
    }
  }
}

- (BOOL)_isFolderIconFreezingSupported
{
  id v2 = [(SBIconView *)self folderIconBackgroundView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (UIView)folderIconBackgroundView
{
  id v2 = [(SBIconView *)self _folderIconImageView];
  BOOL v3 = [v2 backgroundView];

  return (UIView *)v3;
}

- (unint64_t)contentVisibility
{
  unint64_t v2 = ((unint64_t)*((unsigned __int8 *)self + 551) >> 5) & 3;
  if (!v2) {
    return [(SBIconView *)self isPaused];
  }
  return v2;
}

- (BOOL)isPaused
{
  return (*((_WORD *)self + 272) & 0x1F0) != 0;
}

- (void)iconLaunchEnabledDidChange:(id)a3
{
  double v4 = (SBIcon *)a3;
  BSDispatchQueueAssertMain();
  icon = self->_icon;

  if (icon == v4)
  {
    [(SBIconView *)self _updateBrightness];
    [(SBIconView *)self _updateLaunchDisabled];
  }
}

- (void)_configureIconImageView:(id)a3
{
  id v15 = a3;
  [v15 setShowsSquareCorners:(*((unsigned __int8 *)self + 549) >> 4) & 1];
  [v15 setJittering:(*((unsigned __int8 *)self + 546) >> 1) & 1];
  [v15 setIconView:self];
  double v4 = [(SBIconView *)self iconImageCache];
  [v15 setIconImageCache:v4];

  char v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v7 = v15;
  if (isKindOfClass)
  {
    id v8 = v15;
    id v9 = [(SBIconView *)self reuseDelegate];
    if ([v8 hasCustomBackgroundView]
      && (objc_opt_respondsToSelector() & 1) != 0
      && ([v8 backgroundView],
          double v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v9 iconView:self shouldContinueToUseBackgroundViewForComponents:v10],
          v10,
          v11))
    {
      [(SBIconView *)self _updateConfigurationForIconImageView:v8];
    }
    else
    {
      double v12 = [(SBIconView *)self behaviorDelegate];
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = [v12 iconViewComponentBackgroundViewTypeForIconView:self];
      }
      else {
        uint64_t v13 = 2;
      }
      id v14 = [(SBIconView *)self newComponentBackgroundViewOfType:v13];
      [(SBIconView *)self _configureViewAsFolderIconImageView:v14];
      [v8 setBackgroundView:v14];
    }
    BOOL v7 = v15;
  }
}

- (void)_updateBrightness
{
  [(SBIconView *)self effectiveBrightness];
  double v4 = v3;
  -[SBIconImageView setBrightness:](self->_iconImageView, "setBrightness:");
  [(SBIconAccessoryView *)self->_accessoryView setAccessoryBrightness:v4];
  if (objc_opt_respondsToSelector())
  {
    customIconImageViewController = self->_customIconImageViewController;
    [(SBIconViewCustomImageViewControlling *)customIconImageViewController setBrightness:v4];
  }
}

- (double)effectiveBrightness
{
  if ((*((unsigned char *)self + 545) & 0x40) == 0 || (double result = 0.5, *((char *)self + 545) < 0))
  {
    if ((*((unsigned char *)self + 545) & 0x20) != 0)
    {
      return 0.6;
    }
    else
    {
      BOOL v3 = [(SBIconView *)self isTimedOut];
      double result = 1.0;
      if (v3) {
        return 0.5;
      }
    }
  }
  return result;
}

- (BOOL)isTimedOut
{
  BOOL v3 = [(SBIconView *)self icon];
  if ([v3 isTimedOut]) {
    BOOL v4 = [(SBIconView *)self allowsBlockedForScreenTimeExpiration];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_configureViewAsFolderIconImageView:(id)a3
{
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1E4FB1EB0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SBIconView__configureViewAsFolderIconImageView___block_invoke;
  v7[3] = &unk_1E6AACA90;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 performWithoutAnimation:v7];
}

- (void)iconAccessoriesDidUpdate:(id)a3
{
  id v4 = (SBIcon *)a3;
  BSDispatchQueueAssertMain();
  icon = self->_icon;

  if (icon == v4)
  {
    id v6 = [(SBIconView *)self window];

    [(SBIconView *)self _updateLabelArea];
    if (v6) {
      BOOL v7 = [(SBIcon *)self->_icon shouldAnimateProgress];
    }
    else {
      BOOL v7 = 0;
    }
    [(SBIconView *)self _updateProgressAnimated:v7];
    [(SBIconView *)self _updateIconImageAdornmentsAnimated:v6 != 0];
  }
}

- (void)_updateLabelArea
{
}

- (NSString)representedFolderIconLocation
{
  return (NSString *)@"SBIconLocationFolder";
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

uint64_t __43__SBIconView__updateAccessoryViewAnimated___block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 456);
  CGAffineTransformMakeScale(&v3, 0.01, 0.01);
  return [v1 setTransform:&v3];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconView;
  id v4 = a3;
  [(SBIconView *)&v5 willMoveToWindow:v4];
  -[SBIconView updateWindowSceneUserInterfaceStyleChangeRegistrationForWindow:](self, "updateWindowSceneUserInterfaceStyleChangeRegistrationForWindow:", v4, v5.receiver, v5.super_class);
}

- (void)updateWindowSceneUserInterfaceStyleChangeRegistrationForWindow:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 windowScene];
  objc_super v5 = [(SBIconView *)self windowSceneUserInterfaceStyleChangeRegistration];
  BOOL v6 = [(SBIconView *)self usesSceneUserInterfaceStyleForImage];
  if (!v6 || v5)
  {
    if (v5) {
      char v10 = v6;
    }
    else {
      char v10 = 1;
    }
    if ((v10 & 1) == 0)
    {
      [v4 unregisterForTraitChanges:v5];
      [(SBIconView *)self setWindowSceneUserInterfaceStyleChangeRegistration:0];
    }
  }
  else
  {
    BOOL v7 = self;
    v11[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    id v9 = [v4 registerForTraitChanges:v8 withTarget:self action:sel_windowSceneUserInterfaceStyleChanged];

    [(SBIconView *)self setWindowSceneUserInterfaceStyleChangeRegistration:v9];
  }
}

- (UITraitChangeRegistration)windowSceneUserInterfaceStyleChangeRegistration
{
  return self->_windowSceneUserInterfaceStyleChangeRegistration;
}

- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4
{
  return 1;
}

- (id)newComponentBackgroundViewOfType:(int64_t)a3
{
  objc_super v5 = [(SBIconView *)self reuseDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  BOOL v6 = [v5 iconView:self backgroundViewForComponentsOfType:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [(id)objc_opt_class() groupNameBaseForComponentBackgroundViewOfType:a3];
    [v6 setGroupNameBase:v7];
  }
  if (!v6)
  {
LABEL_5:
    id v8 = objc_opt_class();
    id v9 = [(SBIconView *)self contentContainerView];
    char v10 = [v9 traitCollection];
    BOOL v6 = [v8 componentBackgroundViewOfType:a3 compatibleWithTraitCollection:v10 initialWeighting:1.0];
  }
  return v6;
}

- (NSString)description
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    CGAffineTransform v3 = [(SBIconView *)self descriptionWithMultilinePrefix:@"\t"];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBIconView;
    CGAffineTransform v3 = [(SBIconView *)&v5 description];
  }
  return (NSString *)v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  CGAffineTransform v3 = [(SBIconView *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBIconView *)self icon];
  objc_super v5 = [(SBIconView *)self location];
  BOOL v6 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(SBIconView *)self frame];
  id v7 = (id)objc_msgSend(v6, "appendRect:withName:", @"frame");
  id v8 = (id)[v6 appendObject:v4 withName:@"icon"];
  id v9 = (id)[v6 appendObject:v5 withName:@"location"];
  char v10 = [(SBIconView *)self folder];
  id v11 = (id)[v6 appendObject:v10 withName:@"folder" skipIfNil:1];

  switch([(SBIconView *)self currentAccessoryType])
  {
    case 0:
      goto LABEL_7;
    case 1:
      double v12 = @"badge";
      goto LABEL_6;
    case 2:
      double v12 = @"continuity";
      goto LABEL_6;
    case 3:
      double v12 = @"add";
      goto LABEL_6;
    default:
      double v12 = 0;
LABEL_6:
      id v13 = (id)[v6 appendObject:v12 withName:@"accessoryType"];
LABEL_7:
      switch([(SBIconView *)self currentLabelAccessoryType])
      {
        case 0:
          goto LABEL_14;
        case 1:
          id v14 = @"recently updated";
          goto LABEL_13;
        case 2:
          id v14 = @"beta";
          goto LABEL_13;
        case 3:
          id v14 = @"cloud";
          goto LABEL_13;
        case 4:
          id v14 = @"screen time expiration";
          goto LABEL_13;
        default:
          id v14 = 0;
LABEL_13:
          id v15 = (id)[v6 appendObject:v14 withName:@"labelAccessoryType"];
LABEL_14:
          [(SBIconView *)self iconContentScale];
          double v17 = v16;
          if ((BSFloatIsOne() & 1) == 0) {
            id v18 = (id)[v6 appendFloat:@"iconContentScale" withName:v17];
          }
          [(SBIconView *)self alpha];
          double v20 = v19;
          if ((BSFloatIsOne() & 1) == 0) {
            id v21 = (id)[v6 appendFloat:@"alpha" withName:v20];
          }
          [(SBIconView *)self iconImageAlpha];
          double v23 = v22;
          if ((BSFloatIsOne() & 1) == 0) {
            id v24 = (id)[v6 appendFloat:@"iconImageAlpha" withName:v23];
          }
          [(SBIconView *)self iconAccessoryAlpha];
          double v26 = v25;
          if ((BSFloatIsOne() & 1) == 0) {
            id v27 = (id)[v6 appendFloat:@"iconAccessoryAlpha" withName:v26];
          }
          [(SBIconView *)self iconLabelAlpha];
          double v29 = v28;
          if ((BSFloatIsOne() & 1) == 0) {
            id v30 = (id)[v6 appendFloat:@"iconLabelAlpha" withName:v29];
          }
          id v31 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isHidden](self, "isHidden"), @"isHidden", 1);
          id v32 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView allowsLabelArea](self, "allowsLabelArea"), @"allowsLabelArea", 0);
          id v33 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isLabelHidden](self, "isLabelHidden"), @"isLabelHidden", 1);
          id v34 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isLabelAccessoryHidden](self, "isLabelAccessoryHidden"), @"isLabelAccessoryHidden", 1);
          id v35 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView allIconElementsButLabelHidden](self, "allIconElementsButLabelHidden"), @"allIconElementsButLabelHidden", 1);
          id v36 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isEditing](self, "isEditing"), @"isEditing", 1);
          id v37 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isHighlighted](self, "isHighlighted"), @"isHighlighted", 1);
          id v38 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isGrabbed](self, "isGrabbed"), @"isGrabbed", 1);
          id v39 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isOverlapping](self, "isOverlapping"), @"isOverlapping", 1);
          id v40 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isTouchDownInIcon](self, "isTouchDownInIcon"), @"isTouchDownInIcon", 1);
          id v41 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isDragging](self, "isDragging"), @"isDragging", 1);
          id v42 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isDropping](self, "isDropping"), @"isDropping", 1);
          id v43 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isTimedOut](self, "isTimedOut"), @"isTimedOut", 1);
          id v44 = (id)[v6 appendBool:(*((unsigned __int8 *)self + 545) >> 6) & 1 withName:@"launchDisabled" ifEqualTo:1];
          id v45 = (id)[v6 appendBool:*((unsigned __int8 *)self + 545) >> 7 withName:@"suppressDisabledPresentation" ifEqualTo:1];
          id v46 = (id)[v6 appendBool:*((unsigned char *)self + 546) & 1 withName:@"iconWasTappedWhenDisabled" ifEqualTo:1];
          CGAffineTransform v47 = [(SBIconView *)self continuityInfo];
          id v48 = (id)[v6 appendObject:v47 withName:@"continuityInfo" skipIfNil:1];

          id v49 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isUserInteractionEnabled](self, "isUserInteractionEnabled"), @"isUserInteractionEnabled", 0);
          CGAffineTransform v50 = [(SBIconView *)self pauseReasonsDescriptions];
          CGPoint v51 = [v50 componentsJoinedByString:@","];
          [v6 appendString:v51 withName:@"pauseReasons" skipIfEmpty:1];

          id v52 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isIconImageViewBorrowed](self, "isIconImageViewBorrowed"), @"isIconImageViewBorrowed", 1);
          CGRect v53 = [(SBIconView *)self overrideCustomIconImageViewController];
          id v54 = (id)[v6 appendObject:v53 withName:@"overrideCustomIconImageViewController" skipIfNil:1];

          id v55 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView allowsIconImageView](self, "allowsIconImageView"), @"allowsIconImageView", 0);
          id v56 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isResizing](self, "isResizing"), @"isResizing", 1);
          v57 = [(SBIconView *)self overrideBadgeNumberOrString];
          id v58 = (id)[v6 appendObject:v57 withName:@"overrideBadgeNumberOrString" skipIfNil:1];

          v59 = [(SBIconView *)self overrideIconImageAppearance];
          id v60 = (id)[v6 appendObject:v59 withName:@"overrideIconImageAppearance" skipIfNil:1];

          v61 = [(SBIconView *)self overrideIconImageStyleConfiguration];
          id v62 = (id)[v6 appendObject:v61 withName:@"overrideIconImageStyleConfiguration" skipIfNil:1];

          v63 = [(SBIconView *)self overrideImage];
          id v64 = (id)[v6 appendObject:v63 withName:@"overrideImage" skipIfNil:1];

          return v6;
      }
  }
}

- (BOOL)allowsIconImageView
{
  return *((unsigned __int8 *)self + 546) >> 7;
}

- (void)updateCustomIconImageViewController
{
  uint64_t v3 = [(SBIconView *)self overrideCustomIconImageViewController];
  if (!v3)
  {
    if ([(SBIconView *)self allowsCustomIconImageViewController])
    {
      id v4 = [(SBIconView *)self behaviorDelegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v5 = [v4 customImageViewControllerForIconView:self];
      }
      else
      {
        uint64_t v5 = 0;
      }
      uint64_t v10 = v5;

      uint64_t v3 = v10;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  id v11 = (void *)v3;
  [(SBIconView *)self setCustomIconImageViewController:v3];
  BOOL v6 = [(SBIconView *)self isIconImageViewBorrowed];
  id v7 = v11;
  if (!v6)
  {
    id v8 = [v11 viewIfLoaded];
    id v9 = v8;
    if (v8 && ([v8 isDescendantOfView:self] & 1) == 0) {
      [(SBIconView *)self _insertIconImageView:v9];
    }

    id v7 = v11;
  }
}

- (void)setCustomIconImageViewController:(id)a3 clearingOwner:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = (SBIconViewCustomImageViewControlling *)a3;
  customIconImageViewController = self->_customIconImageViewController;
  if (customIconImageViewController != v7)
  {
    HIDWORD(v31) = v4;
    id v9 = customIconImageViewController;
    BOOL v10 = [(SBIconView *)self isIconImageViewBorrowed];
    if (objc_opt_respondsToSelector()) {
      [(SBIconViewCustomImageViewControlling *)v7 setHost:self];
    }
    if (v7)
    {
      id v11 = [(SBIconViewCustomImageViewControlling *)v7 sbh_pushOwningIconView:self];
      double v12 = v11;
      if (v11)
      {
        if (([v11 isIconImageViewBorrowed] & 1) == 0)
        {
          id v13 = SBLogIcon();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v42 = self;
            __int16 v43 = 2112;
            id v44 = v12;
            _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "Icon view %@ is stealing icon image view controller from %@ without anyone borrowing it", buf, 0x16u);
          }
        }
        LODWORD(v31) = v10;
        id v32 = v5;
        id v14 = objc_msgSend(v12, "borrowedIconImageViewAssertion", v31);
        id v15 = [v14 extraInfo];
        double v16 = [v15 objectForKey:@"options"];
        char v17 = [v16 unsignedIntegerValue];

        if ((v17 & 1) == 0) {
          [v12 setCustomIconImageViewController:0 clearingOwner:0];
        }

        id v5 = v32;
        LOBYTE(v10) = v31;
      }
    }
    if (objc_opt_respondsToSelector()) {
      [(SBIconViewCustomImageViewControlling *)v9 removeCustomImageViewControllerObserver:self];
    }
    if (!v10)
    {
      if (objc_opt_respondsToSelector()) {
        [(SBIconViewCustomImageViewControlling *)v9 setUserVisibilityStatus:1];
      }
      if (objc_opt_respondsToSelector()) {
        [(SBIconViewCustomImageViewControlling *)v9 setContentVisibility:2];
      }
    }
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      id v18 = [(SBIconViewCustomImageViewControlling *)v9 host];

      if (v18 == self) {
        [(SBIconViewCustomImageViewControlling *)v9 setHost:0];
      }
    }
    if (v7 && self->_iconImageView) {
      [(SBIconView *)self _destroyIconImageView];
    }
    double v19 = [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController viewIfLoaded];
    if ([v19 isDescendantOfView:self]) {
      [v19 removeFromSuperview];
    }
    if (v19) {
      char v20 = v10;
    }
    else {
      char v20 = 1;
    }
    if ((v20 & 1) == 0)
    {
      [v19 alpha];
      if (v21 < 1.0) {
        [v19 setAlpha:1.0];
      }
    }
    objc_storeStrong((id *)&self->_customIconImageViewController, v5);
    if (v7) {
      char v22 = v10;
    }
    else {
      char v22 = 1;
    }
    if ((v22 & 1) == 0)
    {
      double v23 = (void *)MEMORY[0x1E4FB1EB0];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __61__SBIconView_setCustomIconImageViewController_clearingOwner___block_invoke;
      v38[3] = &unk_1E6AACA90;
      v38[4] = self;
      id v39 = v7;
      [v23 performWithoutAnimation:v38];
    }
    id v33 = v7;
    [(SBIconView *)self _updateJitter:1];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v24 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v24);
          }
          double v29 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v29 iconView:self didChangeCustomImageViewController:v9];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v26);
    }

    id v7 = v33;
    if (v9 && HIDWORD(v31))
    {
      id v30 = [(SBIconViewCustomImageViewControlling *)v9 sbh_removeOwningIconView:self];
      if (!v30) {
        [(SBIconView *)self _notifyObserversDidDiscardCustomImageViewController:v9];
      }
    }
  }
}

- (void)setCustomIconImageViewController:(id)a3
{
}

- (SBIconViewCustomImageViewControlling)overrideCustomIconImageViewController
{
  return self->_overrideCustomIconImageViewController;
}

- (BOOL)allowsCustomIconImageViewController
{
  unint64_t v2 = [(SBIconView *)self icon];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 isPlaceholder] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (double)iconContentScale
{
  return self->_iconContentScale;
}

- (BOOL)isHighlighted
{
  return (*((unsigned __int8 *)self + 545) >> 5) & 1;
}

- (id)pauseReasonsDescriptions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v4 = ((unint64_t)*((unsigned __int16 *)self + 272) >> 4) & 0x1F;
  if (v4)
  {
    uint64_t v5 = 1;
    do
    {
      if ((v4 & v5) != 0)
      {
        BOOL v6 = @"windowless";
        switch(v5)
        {
          case 1:
            goto LABEL_12;
          case 2:
            BOOL v6 = @"iconless";
            goto LABEL_12;
          case 3:
          case 5:
          case 6:
          case 7:
            break;
          case 4:
            BOOL v6 = @"occluded";
            goto LABEL_12;
          case 8:
            BOOL v6 = @"scrolling";
            goto LABEL_12;
          default:
            if (v5 == 16)
            {
              BOOL v6 = @"content visibility";
            }
            else
            {
              if (v5 != 0x40000000) {
                break;
              }
              BOOL v6 = @"other";
            }
LABEL_12:
            [v3 addObject:v6];
            break;
        }
      }
      v4 &= ~v5;
      v5 *= 2;
    }
    while (v4);
  }
  return v3;
}

- (BOOL)isTouchDownInIcon
{
  return *((unsigned char *)self + 547) & 1;
}

- (BOOL)isLabelHidden
{
  return (*((unsigned __int8 *)self + 547) >> 1) & 1;
}

- (BOOL)isLabelAccessoryHidden
{
  return (*((unsigned __int8 *)self + 547) >> 2) & 1;
}

- (double)iconLabelAlpha
{
  return self->_iconLabelAlpha;
}

- (double)iconImageAlpha
{
  return self->_iconImageAlpha;
}

- (double)iconAccessoryAlpha
{
  return self->_iconAccessoryAlpha;
}

- (id)folder
{
  unint64_t v2 = [(SBIconView *)self folderIcon];
  id v3 = [v2 folder];

  return v3;
}

- (SBFolderIcon)folderIcon
{
  unint64_t v2 = [(SBIconView *)self icon];
  if ([v2 isFolderIcon]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  unint64_t v4 = v3;

  return v4;
}

- (BOOL)_dragInteraction:(id)a3 canExcludeCompetingGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = [(SBIconView *)self tapGestureRecognizer];

  if (v6 == v5) {
    BOOL v7 = ![(SBIconView *)self shouldTapGestureRecognizeAlongsideDragInteractionGestures];
  }
  else {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BOOL)shouldTapGestureRecognizeAlongsideDragInteractionGestures
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBIconView *)self tapGestureRecognizer];

  if (v5 == v4)
  {
    id v9 = [(SBIconView *)self behaviorDelegate];
    if ((objc_opt_respondsToSelector() & 1) != 0 && ([v9 iconShouldAllowTap:self] & 1) == 0)
    {
      id v13 = NSString;
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      id v11 = [v13 stringWithFormat:@"the delegate (%@) said so.", v15];
    }
    else if (!self->_customIconImageViewController {
           || ((objc_opt_respondsToSelector() & 1) == 0
    }
             ? (char v10 = 0)
             : (char v10 = [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController isUserInteractionEnabled] ^ 1), [(SBIconView *)self isEditing]|| (v10 & 1) != 0|| ([(SBIconView *)self effectiveIconImageAlpha], BSFloatIsZero())))
    {
      if (![(SBIconView *)self isResizing])
      {
LABEL_24:
        BOOL v8 = 1;
LABEL_30:

        goto LABEL_31;
      }
      id v11 = @"resizing";
    }
    else
    {
      id v11 = @"we're not editing, the custom view controller's user interaction is enabled, and the effective icon alpha isn't zero.";
    }
    double v16 = SBLogIcon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      double v19 = v11;
      _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "Not allowing tap gesture to begin because %{public}@", buf, 0xCu);
    }

    goto LABEL_29;
  }
  id v6 = [(SBCloseBoxView *)self->_closeBox actionTapGestureRecognizer];

  if (v6 == v4)
  {
    id v9 = [(SBIconView *)self behaviorDelegate];
    if (objc_opt_respondsToSelector() & 1) == 0 || ([v9 iconShouldAllowCloseBoxTap:self]) {
      goto LABEL_24;
    }
    SBLogIcon();
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v12 = "Not allowing close box tap gesture to begin because delegate said so.";
LABEL_34:
      _os_log_impl(&dword_1D7F0A000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
    }
LABEL_29:

    BOOL v8 = 0;
    goto LABEL_30;
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(SBIconAccessoryView *)self->_accessoryView actionTapGestureRecognizer];

    if (v7 == v4)
    {
      id v9 = [(SBIconView *)self behaviorDelegate];
      if (objc_opt_respondsToSelector() & 1) == 0 || ([v9 iconShouldAllowAccessoryTap:self]) {
        goto LABEL_24;
      }
      SBLogIcon();
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        double v12 = "Not allowing accessory view (badge) tap gesture to begin because delegate said so.";
        goto LABEL_34;
      }
      goto LABEL_29;
    }
  }
  BOOL v8 = 1;
LABEL_31:

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(SBIconView *)self tapGestureRecognizer];

  if (v6 != v5) {
    return 1;
  }
  BOOL v8 = [(SBIconView *)self behaviorDelegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v8 iconShouldAllowTap:self] & 1) == 0)
  {
    id v9 = SBLogIcon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v13 = 138543362;
      id v14 = v11;
      _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_DEFAULT, "Not allowing tap gesture to receive touch because the delegate (%{public}@) said so.", (uint8_t *)&v13, 0xCu);
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (BOOL)isResizing
{
  return *((unsigned __int8 *)self + 551) >> 7;
}

+ (id)componentBackgroundViewOfType:(int64_t)a3 compatibleWithTraitCollection:(id)a4 initialWeighting:(double)a5
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = v8;
  if (a3 == 6)
  {
    char v10 = 0;
  }
  else
  {
    if (!v8)
    {
      id v9 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:0];
    }
    if (a3 == 4)
    {
      char v10 = objc_msgSend(MEMORY[0x1E4F743C8], "materialViewWithRecipe:", objc_msgSend(a1, "defaultWidgetBackgroundRecipe"));
    }
    else
    {
      id v11 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:0];
      v19[0] = v11;
      v20[0] = @"folderLight";
      double v12 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
      v19[1] = v12;
      v20[1] = @"folderLight";
      int v13 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
      v19[2] = v13;
      v20[2] = @"folderDark";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

      uint64_t v15 = (void *)MEMORY[0x1E4F743C8];
      double v16 = SBHBundle();
      char v10 = [v15 materialViewWithRecipeNamesByTraitCollection:v14 inBundle:v16 options:0 initialWeighting:0 scaleAdjustment:v9 compatibleWithTraitCollection:a5];
    }
    char v17 = [a1 groupNameBaseForComponentBackgroundViewOfType:a3];
    [v10 setGroupNameBase:v17];
  }
  return v10;
}

+ (id)groupNameBaseForComponentBackgroundViewOfType:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return 0;
  }
  else {
    return off_1E6AB3168[a3];
  }
}

- (void)prepareToCrossfadeImageWithView:(id)a3 options:(unint64_t)a4
{
}

- (void)setCustomIconImageViewControllerPriority:(unint64_t)a3
{
  self->_customIconImageViewControllerPrioritdouble y = a3;
}

- (BOOL)iconImageSizeMatchesBoundsSize
{
  return self->_iconImageSizeMatchesBoundsSize;
}

- (id)_makeIconImageView
{
  id v3 = [(SBIconView *)self reuseDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 imageViewForIconView:self];
  }
  else
  {
    id v4 = objc_alloc_init([(SBIconView *)self expectedIconImageViewClass]);
  }
  id v5 = v4;
  [(SBIconView *)self _configureIconImageView:v4];

  return v5;
}

uint64_t __43__SBIconView__updateAccessoryViewAnimated___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _createAccessoryViewIfNecessary];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "configureForIcon:infoProvider:", *(void *)(a1 + 40));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 456) displayingAccessory];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = (void *)v3[57];
    [v3 _centerForAccessoryView];
    objc_msgSend(v4, "setCenter:");
    id v5 = *(void **)(*(void *)(a1 + 32) + 456);
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v8[0] = *MEMORY[0x1E4F1DAB8];
    v8[1] = v6;
    v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v5 setTransform:v8];
  }
  else
  {
    [v3 _destroyAccessoryView];
  }
  [*(id *)(a1 + 32) _setShowingAccessoryView:v2];
  return [*(id *)(*(void *)(a1 + 32) + 456) layoutIfNeeded];
}

- (void)_createAccessoryViewIfNecessary
{
  id v3 = (objc_class *)objc_msgSend((id)objc_opt_class(), "defaultViewClassForAccessoryType:", -[SBIconView currentAccessoryType](self, "currentAccessoryType"));
  if (([(SBIconAccessoryView *)self->_accessoryView isMemberOfClass:v3] & 1) == 0)
  {
    id v4 = [(SBIconView *)self reuseDelegate];
    [(SBIconView *)self _destroyAccessoryView];
    if (v3)
    {
      if (objc_opt_respondsToSelector())
      {
        id v5 = [v4 iconView:self iconAccessoryViewOfClass:v3];
      }
      else
      {
        id v5 = (SBIconAccessoryView *)objc_alloc_init(v3);
      }
      accessoryView = self->_accessoryView;
      self->_accessoryView = v5;

      if (objc_opt_respondsToSelector()) {
        [(SBIconAccessoryView *)self->_accessoryView setLegibilityStyle:[(_UILegibilitySettings *)self->_legibilitySettings style]];
      }
      BOOL v7 = self->_accessoryView;
      [(SBIconView *)self effectiveBrightness];
      -[SBIconAccessoryView setAccessoryBrightness:](v7, "setAccessoryBrightness:");
      id v8 = self->_accessoryView;
      [(SBIconView *)self effectiveIconAccessoryAlpha];
      -[SBIconAccessoryView setAlpha:](v8, "setAlpha:");
      id v9 = self->_accessoryView;
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v15[0] = *MEMORY[0x1E4F1DAB8];
      v15[1] = v10;
      v15[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(SBIconAccessoryView *)v9 setTransform:v15];
      [(SBIconView *)self updateParallaxSettings];
      if (objc_opt_respondsToSelector())
      {
        id v11 = [(SBIconView *)self listLayout];
        [(SBIconAccessoryView *)self->_accessoryView setListLayout:v11];
        [(SBIconAccessoryView *)self->_accessoryView sizeToFit];
      }
      if (objc_opt_respondsToSelector())
      {
        double v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__accessoryViewTapGestureChanged_];
        [v12 setDelegate:self];
        [(SBIconAccessoryView *)self->_accessoryView addGestureRecognizer:v12];
        [(SBIconAccessoryView *)self->_accessoryView setActionTapGestureRecognizer:v12];
        int v13 = (UIPointerInteraction *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self->_accessoryView];
        accessoryViewCursorInteraction = self->_accessoryViewCursorInteraction;
        self->_accessoryViewCursorInteraction = v13;

        [(SBIconAccessoryView *)self->_accessoryView addInteraction:self->_accessoryViewCursorInteraction];
      }
      [(SBIconView *)self updateAccessoryViewOverrideIconImageAppearance];
    }
  }
  if (self->_accessoryView) {
    [(SBIconView *)self updateAccessoryViewContainerIfNecessary];
  }
}

+ (Class)defaultViewClassForAccessoryType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = self;
  }
  return (Class)v4;
}

- (CGPoint)_centerForAccessoryView
{
  if (self->_accessoryView)
  {
    uint64_t v3 = [(SBIconView *)self currentImageView];
    accessoryView = self->_accessoryView;
    [v3 bounds];
    -[SBIconAccessoryView accessoryCenterForIconBounds:](accessoryView, "accessoryCenterForIconBounds:");
    double v6 = v5;
    double v8 = v7;
    id v9 = [(SBIconView *)self contentContainerView];
    objc_msgSend(v9, "convertPoint:fromView:", v3, v6, v8);
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (void)prepareToCrossfadeImageWithView:(id)a3 anchorPoint:(CGPoint)a4 options:(unint64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  [(SBIconView *)self cleanupAfterCrossfade];
  id v21 = [(SBIconView *)self contentContainerView];
  double v10 = [(SBIconView *)self currentImageView];
  double v11 = [v21 subviews];
  uint64_t v12 = [v11 indexOfObject:v10];

  customIconImageViewController = self->_customIconImageViewController;
  if (!customIconImageViewController) {
    customIconImageViewController = self->_iconImageView;
  }
  id v14 = customIconImageViewController;
  double v15 = self;

  double v16 = (SBIconImageCrossfadeView *)[objc_alloc((Class)v15) initWithSource:v14 crossfadeView:v9];
  crossfadeView = self->_crossfadeView;
  self->_crossfadeView = v16;

  id v18 = self->_crossfadeView;
  [(SBIconView *)self _frameForImageView];
  -[SBIconImageCrossfadeView sbf_setBoundsAndPositionFromFrame:](v18, "sbf_setBoundsAndPositionFromFrame:");
  [(SBIconImageCrossfadeView *)self->_crossfadeView setMasksCorners:a5 & 1];
  [(SBIconImageCrossfadeView *)self->_crossfadeView setPerformsTrueCrossfade:(a5 >> 1) & 1];
  -[SBIconImageCrossfadeView setStretchAnchorPoint:](self->_crossfadeView, "setStretchAnchorPoint:", x, y);
  [(SBIconImageCrossfadeView *)self->_crossfadeView setCrossfadeStyle:(a5 >> 3) & 1];
  [(SBIconView *)self updateAccessoryViewContainerIfNecessary];
  id v19 = [v10 superview];

  uint64_t v20 = v21;
  if (v19 == v21)
  {
    [v10 setHidden:1];
    uint64_t v20 = v21;
  }
  [v20 insertSubview:self->_crossfadeView atIndex:v12];
  [(SBIconView *)self layoutIfNeeded];
  [(SBIconImageCrossfadeView *)self->_crossfadeView prepareGeometry];
  [(SBIconView *)self _updateJitter];
}

- (void)_removeUnknownSubviews
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v3 = [(SBIconView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v22 = 0;
    uint64_t v6 = *(void *)v28;
    double v7 = &OBJC_IVAR___SBHLibraryViewController__externalBackgroundView;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(SBIconLabelView **)(*((void *)&v27 + 1) + 8 * i);
        if (v9 != self->_labelView
          && v9 != (SBIconLabelView *)self->_labelAccessoryView
          && v9 != (SBIconLabelView *)self->_closeBox
          && v9 != *(SBIconLabelView **)((char *)&self->super.super.super.isa + v7[145])
          && v9 != self->_accessoryView
          && v9 != (SBIconLabelView *)self->_scalingContainer
          && v9 != (SBIconLabelView *)self->_dropGlow
          && v9 != (SBIconLabelView *)self->_focusEffectPlatterView
          && v9 != (SBIconLabelView *)self->_crossfadeView)
        {
          double v10 = (objc_class *)objc_opt_class();
          double v11 = NSStringFromClass(v10);
          if ([v11 isEqualToString:@"_UIClickHighlightInteractionEffectAnchorView"])
          {
            id v12 = v22;
            if (!v22) {
              id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            objc_msgSend(v12, "addObject:", v9, v12);
          }

          double v7 = &OBJC_IVAR___SBHLibraryViewController__externalBackgroundView;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v5);
  }
  else
  {
    char v22 = 0;
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v22;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        id v19 = SBLogIcon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          uint64_t v20 = (objc_class *)objc_opt_class();
          id v21 = NSStringFromClass(v20);
          *(_DWORD *)buf = 138543618;
          id v32 = v21;
          __int16 v33 = 2112;
          long long v34 = v18;
          _os_log_fault_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_FAULT, "Unknown subview found in SBIconView when preparing for reuse! (53825790) %{public}@ %@", buf, 0x16u);
        }
        [v18 removeFromSuperview];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v15);
  }
}

- (void)cleanupAfterCrossfade
{
  if (self->_crossfadeView)
  {
    [(SBIconView *)self setCrossfadeFraction:0.0];
    [(SBIconView *)self setCrossfadeCornerRadius:0.0];
    [(SBIconView *)self setMorphFraction:0.0];
    [(SBIconImageCrossfadeView *)self->_crossfadeView cleanup];
    uint64_t v3 = [(SBIconView *)self subviews];
    uint64_t v4 = [v3 indexOfObject:self->_crossfadeView];

    [(SBIconImageCrossfadeView *)self->_crossfadeView removeFromSuperview];
    crossfadeView = self->_crossfadeView;
    self->_crossfadeView = 0;

    [(SBIconView *)self updateAccessoryViewContainerIfNecessary];
    id v7 = [(SBIconView *)self currentImageView];
    [v7 setHidden:0];
    uint64_t v6 = [(SBIconView *)self contentContainerView];
    [v6 insertSubview:v7 atIndex:v4];

    [(SBIconView *)self _updateIconImageAdornmentsAnimated:0];
    [(SBIconView *)self _updateJitter];
  }
}

- (void)setIconLabelAlpha:(double)a3
{
  if (self->_iconLabelAlpha != a3)
  {
    self->_double iconLabelAlpha = a3;
    [(SBIconView *)self effectiveIconLabelAlpha];
    -[SBIconView _applyIconLabelAlpha:](self, "_applyIconLabelAlpha:");
  }
}

- (void)setCrossfadeCornerRadius:(double)a3
{
}

- (void)setMorphFraction:(double)a3
{
  [(SBIconImageCrossfadeView *)self->_crossfadeView setMorphFraction:a3];
  [(SBIconView *)self setNeedsLayout];
  [(SBIconView *)self layoutIfNeeded];
}

- (void)_insertIconImageView:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(SBIconView *)self isIconImageViewBorrowed];
  uint64_t v5 = v9;
  if (v4) {
    goto LABEL_11;
  }
  uint64_t v6 = [(SBIconView *)self contentContainerView];
  id v7 = v6;
  if (self->_labelView || self->_dropGlow)
  {
    id v8 = v9;
  }
  else
  {
    id v8 = v9;
    if (!self->_focusEffectPlatterView)
    {
      [v6 addSubview:v9];
      goto LABEL_6;
    }
  }
  objc_msgSend(v6, "insertSubview:aboveSubview:", v8);
LABEL_6:
  if (self->_closeBox) {
    objc_msgSend(v7, "insertSubview:belowSubview:", v9);
  }
  if (self->_resizeHandle) {
    objc_msgSend(v7, "bringSubviewToFront:");
  }
  [(SBIconView *)self updateAccessoryViewContainerIfNecessary];

  uint64_t v5 = v9;
LABEL_11:
}

- (void)updateAccessoryViewContainerIfNecessary
{
  if (self->_accessoryView)
  {
    id v4 = [(SBIconView *)self accessoryViewContainerView];
    id v3 = [(SBIconAccessoryView *)self->_accessoryView superview];

    if (v3 != v4) {
      [v4 addSubview:self->_accessoryView];
    }
    [v4 bringSubviewToFront:self->_accessoryView];
  }
}

uint64_t __50__SBIconView__configureViewAsFolderIconImageView___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) iconImageSize];
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, v3, v4);
  uint64_t v5 = [*(id *)(a1 + 32) layer];
  [*(id *)(a1 + 40) iconImageCornerRadius];
  objc_msgSend(v5, "setCornerRadius:");

  uint64_t v6 = [*(id *)(a1 + 32) layer];
  [v6 setCornerCurve:*MEMORY[0x1E4F39EA8]];

  id v7 = [*(id *)(a1 + 32) layer];
  [v7 setMasksToBounds:1];

  id v8 = *(void **)(a1 + 32);
  return [v8 layoutIfNeeded];
}

- (double)iconImageCornerRadius
{
  [(SBIconView *)self iconImageInfo];
  return v2;
}

- (id)accessoryViewContainerView
{
  if ([(SBIconView *)self shouldPutAccessoryViewInsideImageView]) {
    [(SBIconView *)self currentImageView];
  }
  else {
  double v3 = [(SBIconView *)self contentContainerView];
  }
  return v3;
}

- (BOOL)shouldPutAccessoryViewInsideImageView
{
  return self->_crossfadeView == 0;
}

- (void)setCrossfadeFraction:(double)a3
{
  -[SBIconImageCrossfadeView setCrossfadeFraction:](self->_crossfadeView, "setCrossfadeFraction:");
  double v5 = 1.0 - a3;
  [(SBIconView *)self setIconAccessoryAlpha:v5];
  [(SBIconView *)self setIconLabelAlpha:v5];
}

- (void)setIconAccessoryAlpha:(double)a3
{
  if (self->_iconAccessoryAlpha != a3)
  {
    self->_double iconAccessoryAlpha = a3;
    [(SBIconView *)self effectiveIconAccessoryAlpha];
    -[SBIconView _applyIconAccessoryAlpha:](self, "_applyIconAccessoryAlpha:");
  }
}

- (void)tapGestureDidChange:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    kdebug_trace();
    -[SBIconView _handleTapWithModifierFlags:](self, "_handleTapWithModifierFlags:", [v4 modifierFlags]);
  }
}

- (void)_handleTapWithModifierFlags:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  double v5 = [(SBIconView *)self actionDelegate];
  uint64_t v6 = [(SBIconView *)self window];
  id v7 = SBLogIcon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    long long v25 = self;
    __int16 v26 = 2048;
    int64_t v27 = a3;
    __int16 v28 = 2048;
    long long v29 = v5;
    __int16 v30 = 2048;
    uint64_t v31 = v6;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "Handle tap: %@, modifiers: %lx, delegate: %p, window: %p", buf, 0x2Au);
  }

  if (v6)
  {
    if (objc_opt_respondsToSelector())
    {
      [v5 iconTapped:self modifierFlags:a3];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v5 iconTapped:self];
    }
    else
    {
      id v8 = [(SBIconView *)self icon];
      int v9 = [v8 isLaunchEnabled];
      double v10 = SBLogIcon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v9;
        _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "delegate does not want to handle tap, going to icon. launch enabled: %{BOOL}u", buf, 8u);
      }

      double v11 = [(SBIconView *)self location];
      id v12 = objc_alloc_init(SBHIconLaunchContext);
      [(SBHIconLaunchContext *)v12 setIconView:self];
      [v8 launchFromLocation:v11 context:v12];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = (void *)[(NSHashTable *)self->_observers copy];
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
          id v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
          if (objc_opt_respondsToSelector()) {
            [v18 iconViewDidHandleTap:self];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBIconView;
  [(SBIconView *)&v7 touchesCancelled:v6 withEvent:a4];
  if ((_touchesContainNonIndirectTouch(v6) & 1) != 0 || ![v6 count])
  {
    *((unsigned char *)self + 547) &= ~1u;
    [(SBIconView *)self _delegateTouchEnded:1];
    if (![(SBIconView *)self isDragging]) {
      [(SBIconView *)self setHighlighted:0];
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 545);
  if (((((v3 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 32;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 545) = v3 & 0xDF | v4;
    [(SBIconView *)self _updateBrightness];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBIconView;
  id v7 = a3;
  [(SBIconView *)&v13 touchesBegan:v7 withEvent:v6];
  int v8 = _touchesContainNonIndirectTouch(v7);

  if (v8)
  {
    *((unsigned char *)self + 547) |= 1u;
    int v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v13.receiver, v13.super_class);
    [(SBIconView *)self setLastTouchDownDate:v9];

    if ((*((unsigned char *)self + 545) & 0x40) != 0 && *((char *)self + 545) < 0) {
      [(SBIconView *)self iconInteractedWhenDisabled];
    }
    double v10 = SBLogIcon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      tapGestureRecognizer = self->_tapGestureRecognizer;
      *(_DWORD *)buf = 138543618;
      id v15 = v6;
      __int16 v16 = 2114;
      uint64_t v17 = tapGestureRecognizer;
      _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "SBIconView touches began with event: %{public}@, tap gesture: %{public}@", buf, 0x16u);
    }

    id v12 = [(SBIconView *)self actionDelegate];
    if (objc_opt_respondsToSelector())
    {
      [v12 iconTouchBegan:self];
    }
    else if ([(SBIconView *)self isEnabled] {
           && [(SBIconView *)self _delegateTapAllowed])
    }
    {
      [(SBIconView *)self setHighlighted:1];
    }
  }
}

- (void)setLastTouchDownDate:(id)a3
{
}

- (void)_delegateTouchEnded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBIconView *)self actionDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 icon:self touchEnded:v3];
  }
}

- (id)actionDelegate
{
  BOOL v3 = [(SBIconView *)self overrideActionDelegate];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(SBIconView *)self delegate];
    id v5 = v6;
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v6 actionDelegateForIconView:self];
    }
  }

  return v5;
}

- (SBIconViewActionDelegate)overrideActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrideActionDelegate);
  return (SBIconViewActionDelegate *)WeakRetained;
}

- (void)setFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SBIconView *)self bounds];
  memset(&v16, 0, sizeof(v16));
  [(SBIconView *)self transform];
  CGAffineTransform t1 = v16;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&t2.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  BOOL v7 = CGAffineTransformEqualToTransform(&t1, &t2);
  if (!v7)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __23__SBIconView_setFrame___block_invoke;
    v13[3] = &unk_1E6AAC810;
    v13[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v13];
  }
  [(SBIconView *)self iconViewSize];
  v12.receiver = self;
  v12.super_class = (Class)SBIconView;
  -[SBIconView setFrame:](&v12, sel_setFrame_, x, y, v8, v9);
  if (!v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    CGAffineTransform v11 = v16;
    v10[2] = __23__SBIconView_setFrame___block_invoke_2;
    v10[3] = &unk_1E6AAFE30;
    v10[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v10];
  }
  [(SBIconView *)self bounds];
  if ((BSSizeEqualToSize() & 1) == 0) {
    [(SBIconView *)self _notifyObserversSizeDidChange];
  }
}

- (void)_notifyObserversSizeDidChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = (void *)[(NSHashTable *)self->_observers copy];
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
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 iconViewSizeDidChange:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 549) = *((unsigned char *)self + 549) & 0xEF | v3;
  -[SBIconImageView setShowsSquareCorners:](self->_iconImageView, "setShowsSquareCorners:");
}

uint64_t __43__SBIconView__updateAccessoryViewAnimated___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 48))
  {
    if (*(unsigned char *)(result + 49)) {
      return result;
    }
    v1 = *(void **)(result + 40);
    CGAffineTransformMakeScale(&v5, 0.01, 0.01);
    double v2 = &v5;
    char v3 = v1;
  }
  else
  {
    if (!*(unsigned char *)(result + 49)) {
      return result;
    }
    char v3 = *(void **)(result + 32);
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v6[0] = *MEMORY[0x1E4F1DAB8];
    v6[1] = v4;
    v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v2 = (CGAffineTransform *)v6;
  }
  return [v3 setTransform:v2];
}

void __43__SBIconView__updateAccessoryViewAnimated___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a1 + 48) == a2) {
    [*(id *)(a1 + 32) _destroyAccessoryView];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [*(id *)(a1 + 32) accessoryViewAnimator];

  if (WeakRetained == v4)
  {
    CGAffineTransform v5 = *(void **)(a1 + 32);
    [v5 setAccessoryViewAnimator:0];
  }
}

- (id)effectiveOverrideIconImageAppearance
{
  char v3 = [(SBIconView *)self overrideIconImageAppearance];
  if (!v3)
  {
    id v4 = [(SBIconView *)self overrideIconImageStyleConfiguration];
    if (v4)
    {
      CGAffineTransform v5 = [(SBIconView *)self traitCollectionForIconImageAppearance];
      char v3 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:overrideIconImageAppearance:overrideIconImageStyleConfiguration:", v5, 0, v4);
    }
    else
    {
      char v3 = 0;
    }
  }
  return v3;
}

- (void)scrollToTopOfFirstPageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBIconView *)self _folderIconImageView];
  [v4 scrollToTopOfFirstPageAnimated:v3];
}

- (id)effectiveOverrideAccessoryIconImageAppearance
{
  BOOL v3 = [(SBIconView *)self overrideAccessoryIconImageAppearance];
  if (!v3)
  {
    BOOL v3 = [(SBIconView *)self overrideIconImageAppearance];
    if (!v3)
    {
      id v4 = [(SBIconView *)self overrideIconImageStyleConfiguration];
      if (v4)
      {
        CGAffineTransform v5 = [(SBIconView *)self icon];
        uint64_t v6 = [(SBIconView *)self traitCollectionForIconImageAppearance];
        uint64_t v7 = [v6 userInterfaceStyle];
        if ([v5 isWidgetIcon]) {
          [v4 widgetAppearanceWithUserInterfaceStyle:v7];
        }
        else {
        BOOL v3 = [v4 iconImageAppearanceWithUserInterfaceStyle:v7];
        }
      }
      else
      {
        BOOL v3 = 0;
      }
    }
  }
  return v3;
}

- (SBHIconImageAppearance)overrideAccessoryIconImageAppearance
{
  return self->_overrideAccessoryIconImageAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideAccessoryIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_windowSceneUserInterfaceStyleChangeRegistration, 0);
  objc_storeStrong((id *)&self->_overrideImage, 0);
  objc_storeStrong((id *)&self->_resizeGestureHandler, 0);
  objc_storeStrong((id *)&self->_springBoardIconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_springBoardIconStyleObservation, 0);
  objc_storeStrong((id *)&self->_resizeHandle, 0);
  objc_destroyWeak((id *)&self->_borrowedIconImageViewAssertion);
  objc_storeStrong((id *)&self->_fetchedApplicationShortcutItems, 0);
  objc_storeStrong((id *)&self->_closeBoxAnimator, 0);
  objc_storeStrong((id *)&self->_currentStackConfigurationInteraction, 0);
  objc_storeStrong((id *)&self->_currentConfigurationInteraction, 0);
  objc_storeStrong((id *)&self->_homeButtonPressConsumingAssertion, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_editingModeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_accessoryViewAnimator, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_liftingDragSession);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_resizeHandleCursorInteraction, 0);
  objc_storeStrong((id *)&self->_accessoryViewCursorInteraction, 0);
  objc_storeStrong((id *)&self->_closeBoxCursorInteraction, 0);
  objc_storeStrong((id *)&self->_iconViewCursorInteraction, 0);
  objc_destroyWeak((id *)&self->_appPrototectionSubjectMonitorSubscription);
  objc_storeStrong((id *)&self->_accessibilityTintColor, 0);
  objc_storeStrong((id *)&self->_folderIconBackgroundView, 0);
  objc_storeStrong((id *)&self->_folderIcon, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_overrideCustomIconImageViewController, 0);
  objc_storeStrong((id *)&self->_customIconImageViewController, 0);
  objc_storeStrong((id *)&self->_continuityInfo, 0);
  objc_storeStrong((id *)&self->_overrideBadgeNumberOrString, 0);
  objc_storeStrong((id *)&self->_lastTouchDownDate, 0);
  objc_storeStrong((id *)&self->_overrideIconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_applicationShortcutItems, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_overrideDraggingDelegate);
  objc_destroyWeak((id *)&self->_overrideActionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resizeGestureContext, 0);
  objc_storeStrong((id *)&self->_iconLabelViewFactory, 0);
  objc_storeStrong((id *)&self->_activePointerRegions, 0);
  objc_storeStrong((id *)&self->_iconContextMenuActivity, 0);
  objc_storeStrong((id *)&self->_dismissingContextMenuInteractionConfigurations, 0);
  objc_storeStrong((id *)&self->_contextMenuInteractionConfigurations, 0);
  objc_storeStrong((id *)&self->_droppingAssertions, 0);
  objc_storeStrong((id *)&self->_droppingURLs, 0);
  objc_storeStrong((id *)&self->_performAfterContextMenuBlocks, 0);
  objc_storeStrong((id *)&self->_recentsDocumentExtensionProvider, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_forbidContextMenusAssertions, 0);
  objc_storeStrong((id *)&self->_forbidAccessoryUpdatesAssertions, 0);
  objc_storeStrong((id *)&self->_forbidEditingModeReasons, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_scalingContainer, 0);
  objc_storeStrong((id *)&self->_snapshotProvider, 0);
  objc_storeStrong((id *)&self->_iconIndexLabel, 0);
  objc_storeStrong((id *)&self->_iconResizingSettings, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
  objc_storeStrong((id *)&self->_focusProxyView, 0);
  objc_storeStrong((id *)&self->_focusEffectPlatterView, 0);
  objc_storeStrong((id *)&self->_dropGlow, 0);
  objc_storeStrong((id *)&self->_labelAccessoryView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_closeBox, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_temporarySnapshotContainerViewForDragPreview, 0);
  objc_storeStrong((id *)&self->_snapshotContainerView, 0);
  objc_storeStrong((id *)&self->_crossfadeView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

- (void)_destroyAccessoryView:(id)a3
{
  id v5 = a3;
  id v4 = [(SBIconView *)self reuseDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 iconView:self willRemoveIconAccessoryView:v5];
  }
  if ([v5 isDescendantOfView:self]) {
    [v5 removeFromSuperview];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBIconView;
  [(SBIconView *)&v9 touchesMoved:v6 withEvent:a4];
  if (_touchesContainNonIndirectTouch(v6))
  {
    uint64_t v7 = [(SBIconView *)self actionDelegate];
    if (objc_opt_respondsToSelector())
    {
      double v8 = [v6 anyObject];
      [v7 icon:self touchMoved:v8];
    }
    else if ([(SBIconView *)self isEnabled] {
           && [(SBIconView *)self _delegateTapAllowed])
    }
    {
      [(SBIconView *)self setHighlighted:[(SBIconView *)self isTouchDownInIcon]];
    }
  }
}

+ (CGSize)defaultIconViewSize
{
  [a1 defaultIconImageSize];
  double v4 = v3;
  double v6 = v5;
  [a1 _labelHeight];
  double v8 = v6 + v7;
  double v9 = v4;
  result.double height = v8;
  result.CGFloat width = v9;
  return result;
}

+ (void)activateShortcut:(id)a3 withBundleIdentifier:(id)a4 forIconView:(id)a5
{
  v77[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = [v7 type];
  int v11 = [v10 isEqualToString:@"com.apple.springboardhome.application-shortcut-item.appStoreLink"];

  if (!v11)
  {
    CGAffineTransform v16 = [v7 type];
    int v17 = [v16 isEqualToString:@"com.apple.springboardhome.application-shortcut-item.share"];

    if (v17)
    {
      uint64_t v18 = [v7 userInfo];
      uint64_t v19 = *MEMORY[0x1E4F3C3A8];
      objc_super v13 = [v18 objectForKey:*MEMORY[0x1E4F3C3A8]];

      if (!v13) {
        goto LABEL_13;
      }
      id v14 = [v9 window];
      id v15 = [MEMORY[0x1E4F1CA60] dictionary];
      [v15 setObject:v13 forKeyedSubscript:v19];
      long long v20 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v21 = [v20 userInterfaceIdiom];

      if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        long long v22 = [v14 screen];
        [v9 frame];
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;
        uint64_t v31 = [v9 superview];
        uint64_t v32 = [v22 coordinateSpace];
        objc_msgSend(v31, "convertRect:toCoordinateSpace:", v32, v24, v26, v28, v30);
        CGFloat v34 = v33;
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        CGFloat v40 = v39;

        v78.origin.double x = v34;
        v78.origin.double y = v36;
        v78.size.CGFloat width = v38;
        v78.size.double height = v40;
        id v41 = NSStringFromCGRect(v78);
        [v15 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F3C3B0]];
      }
      id v42 = (void *)[objc_alloc(MEMORY[0x1E4F3C308]) initWithParameters:v15];
      __int16 v43 = [v14 rootViewController];
      [v43 presentViewController:v42 animated:1 completion:0];
    }
    else
    {
      id v44 = [v7 type];
      int v45 = [v44 isEqualToString:@"com.apple.springboardhome.application-shortcut-item.show-all-windows"];

      if (v45)
      {
        if (activateShortcut_withBundleIdentifier_forIconView__onceToken != -1) {
          dispatch_once(&activateShortcut_withBundleIdentifier_forIconView__onceToken, &__block_literal_global_57);
        }
        [(id)activateShortcut_withBundleIdentifier_forIconView__multiWindowService triggerShowAllWindowsForApplicationBundleIdentifier:v8];
        goto LABEL_13;
      }
      id v46 = [v7 type];
      int v47 = [v46 isEqualToString:@"com.apple.springboardhome.application-shortcut-item.delete-app"];

      if (v47)
      {
        objc_super v13 = [v9 icon];
        [v13 setUninstalled];
        [v13 completeUninstall];
        goto LABEL_12;
      }
      id v48 = [v7 type];
      int v49 = [v48 isEqualToString:@"com.apple.springboardhome.application-shortcut-item.add-to-home-screen"];

      if (v49)
      {
        objc_super v13 = [(id)objc_opt_class() homeScreenService];
        [v13 addApplicationIconToHomeScreenWithBundleIdentifier:v8];
        goto LABEL_12;
      }
      CGAffineTransform v50 = [v7 type];
      int v51 = [v50 isEqualToString:@"com.apple.springboardhome.application-shortcut-item.app-protection"];

      if (v51)
      {
        objc_super v13 = [v9 icon];
        if (![v13 isApplicationIcon]) {
          goto LABEL_12;
        }
        id v14 = v13;
        id v52 = [v7 userInfo];
        CGRect v53 = [v52 objectForKey:kSBHIconAppProtectionFeatureUserInfoKey];
        uint64_t v54 = [v53 unsignedIntegerValue];

        id v55 = [v7 userInfo];
        id v56 = [v55 objectForKey:kSBHIconAppProtectionActionUserInfoKey];
        uint64_t v57 = [v56 unsignedIntegerValue];

        [v14 changeEnablement:v57 ofFeature:v54];
        goto LABEL_11;
      }
      BOOL v58 = [v7 activationMode] == 1;
      objc_super v13 = (void *)[objc_alloc(MEMORY[0x1E4FB17F0]) initWithSBSShortcutItem:v7];
      id v14 = [MEMORY[0x1E4F1CA60] dictionary];
      v76[0] = *MEMORY[0x1E4F625F8];
      v59 = [NSNumber numberWithBool:v58];
      v77[0] = v59;
      v76[1] = *MEMORY[0x1E4F625E0];
      v75 = v13;
      id v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
      uint64_t v61 = *MEMORY[0x1E4F62688];
      v77[1] = v60;
      v77[2] = MEMORY[0x1E4F1CC38];
      uint64_t v62 = *MEMORY[0x1E4F62658];
      v76[2] = v61;
      v76[3] = v62;
      v77[3] = *MEMORY[0x1E4FA7088];
      v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:4];
      [v14 addEntriesFromDictionary:v63];

      id v15 = [v7 targetContentIdentifier];
      id v64 = [v7 targetContentIdentifier];

      if (v64) {
        [v14 setObject:v15 forKey:*MEMORY[0x1E4FB3508]];
      }
      if (SBFIsChamoisExternalDisplayControllerAvailable())
      {
        v65 = [v9 _screen];
        v66 = [v65 displayConfiguration];
        v67 = [v66 deviceName];

        if (v67) {
          [v14 setObject:v67 forKey:*MEMORY[0x1E4FA70E0]];
        }
      }
      id v42 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v14];
      if (activateShortcut_withBundleIdentifier_forIconView__onceToken_70 != -1) {
        dispatch_once(&activateShortcut_withBundleIdentifier_forIconView__onceToken_70, &__block_literal_global_72_2);
      }
      uint64_t v68 = [v7 bundleIdentifierToLaunch];
      v69 = (void *)v68;
      if (v68) {
        v70 = (void *)v68;
      }
      else {
        v70 = v8;
      }
      id v71 = v70;

      v72 = (void *)activateShortcut_withBundleIdentifier_forIconView__openApplicationService;
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke_3;
      v73[3] = &unk_1E6AB2DD8;
      id v74 = v8;
      [v72 openApplication:v71 withOptions:v42 completion:v73];
    }
    goto LABEL_10;
  }
  long long v12 = [v7 userInfo];
  objc_super v13 = [v12 objectForKey:kSBHIconAppStoreURLUserInfoKey];

  if (v13)
  {
    id v14 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v15 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
    [v14 openURL:v15 withOptions:0];
LABEL_10:

LABEL_11:
LABEL_12:
  }
LABEL_13:
}

void __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FA69A0]);
  v1 = (void *)activateShortcut_withBundleIdentifier_forIconView__multiWindowService;
  activateShortcut_withBundleIdentifier_forIconView__multiWindowService = (uint64_t)v0;
}

void __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke_2()
{
  uint64_t v0 = SBSCreateOpenApplicationService();
  v1 = (void *)activateShortcut_withBundleIdentifier_forIconView__openApplicationService;
  activateShortcut_withBundleIdentifier_forIconView__openApplicationService = v0;
}

void __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    double v5 = SBLogIcon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke_3_cold_1(a1, (uint64_t)v4, v5);
    }
  }
}

+ (id)homeScreenService
{
  if (homeScreenService_onceToken_1 != -1) {
    dispatch_once(&homeScreenService_onceToken_1, &__block_literal_global_75_1);
  }
  double v2 = (void *)homeScreenService__homeScreenService_1;
  return v2;
}

void __31__SBIconView_homeScreenService__block_invoke()
{
  if ((__sb__runningInSpringBoard() & 1) == 0)
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4FA6AC8]);
    v1 = (void *)homeScreenService__homeScreenService_1;
    homeScreenService__homeScreenService_1 = (uint64_t)v0;
  }
}

+ (void)setDebugContinuityItem:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&__debugContinuityItem, a3);
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"SBIconViewRefreshAccessoryViewNotification" object:0];
  }
}

+ (id)applicationIconMultitaskingMenus
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      double v3 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 != 1) {
      goto LABEL_3;
    }
  }
  double v6 = [a1 applicationIconMultitaskingMenu];
  id v7 = [a1 applicationIconSplitViewMenu];
  id v8 = [a1 applicationIconStageManagerMenu];
  __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts = 1;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  double v3 = v9;
  if (v6) {
    [v9 addObject:v6];
  }
  if (v7) {
    [v3 addObject:v7];
  }
  if (v8) {
    [v3 addObject:v8];
  }

LABEL_12:
  return v3;
}

+ (id)applicationIconMultitaskingMenu
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      double v2 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    double v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 != 1) {
      goto LABEL_3;
    }
  }
  __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts = 1;
  uint64_t v5 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2AF8] modifierFlags:0x800000 action:sel__handleActivateAppExposeKeyShortcut_];
  double v6 = [v5 _nonRepeatableKeyCommand];
  id v7 = [v6 _allowGlobeModifierKeyCommand];

  id v8 = SBHBundle();
  id v9 = [v8 localizedStringForKey:@"APP_EXPOSE_DISCOVERABILITY" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  [v7 setDiscoverabilityTitle:v9];

  long long v10 = [MEMORY[0x1E4FA6B10] systemKeyCommandOverlayEnvironment];
  [v7 _setEventDeferringEnvironment:v10];

  int v11 = (void *)MEMORY[0x1E4FB1970];
  long long v12 = SBHBundle();
  objc_super v13 = [v12 localizedStringForKey:@"MULTITASKING_MENU_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  v16[0] = v7;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  double v2 = [v11 menuWithTitle:v13 children:v14];

LABEL_6:
  return v2;
}

+ (id)applicationIconSplitViewMenu
{
  v26[3] = *MEMORY[0x1E4F143B8];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      double v2 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    double v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 != 1) {
      goto LABEL_3;
    }
  }
  __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts = 1;
  uint64_t v5 = [MEMORY[0x1E4FA6B10] systemKeyCommandOverlayEnvironment];
  double v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"f" modifierFlags:0x800000 action:sel__handleMakeFullscreenKeyShortcut_];
  id v7 = [v6 _nonRepeatableKeyCommand];
  id v8 = [v7 _allowGlobeModifierKeyCommand];

  id v9 = SBHBundle();
  long long v10 = [v9 localizedStringForKey:@"MAKE_FULLSCREEN_DISCOVERABILITY" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  [v8 setDiscoverabilityTitle:v10];

  [v8 _setEventDeferringEnvironment:v5];
  int v11 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B78] modifierFlags:8650752 action:sel__handleMakeSplitLeftKeyShortcut_];
  long long v12 = [v11 _nonRepeatableKeyCommand];
  objc_super v13 = [v12 _allowGlobeModifierKeyCommand];

  id v14 = SBHBundle();
  id v15 = [v14 localizedStringForKey:@"MAKE_LEFT_SPLIT_DISCOVERABILITY" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  [v13 setDiscoverabilityTitle:v15];

  [v13 _setEventDeferringEnvironment:v5];
  CGAffineTransform v16 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B90] modifierFlags:8650752 action:sel__handleMakeSplitRightKeyShortcut_];
  int v17 = [v16 _nonRepeatableKeyCommand];
  uint64_t v18 = [v17 _allowGlobeModifierKeyCommand];

  uint64_t v19 = SBHBundle();
  long long v20 = [v19 localizedStringForKey:@"MAKE_RIGHT_SPLIT_DISCOVERABILITY" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  [v18 setDiscoverabilityTitle:v20];

  [v18 _setEventDeferringEnvironment:v5];
  uint64_t v21 = (void *)MEMORY[0x1E4FB1970];
  long long v22 = SBHBundle();
  double v23 = [v22 localizedStringForKey:@"SPLIT_VIEW_MENU_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  v26[0] = v8;
  v26[1] = v13;
  v26[2] = v18;
  double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  double v2 = [v21 menuWithTitle:v23 children:v24];

LABEL_6:
  return v2;
}

+ (id)applicationIconStageManagerMenu
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      double v2 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    double v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 != 1) {
      goto LABEL_3;
    }
  }
  __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts = 1;
  uint64_t v5 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B98] modifierFlags:8650752 action:sel__handleAddWindowToSetCommand_];
  double v6 = [v5 _nonRepeatableKeyCommand];
  id v7 = [v6 _allowGlobeModifierKeyCommand];

  id v8 = SBHBundle();
  id v9 = [v8 localizedStringForKey:@"ADD_ANOTHER_WINDOW_DISCOVERABILITY" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  [v7 setDiscoverabilityTitle:v9];

  long long v10 = [MEMORY[0x1E4FA6B10] systemKeyCommandOverlayEnvironment];
  [v7 _setEventDeferringEnvironment:v10];

  int v11 = (void *)MEMORY[0x1E4FB1970];
  long long v12 = SBHBundle();
  objc_super v13 = [v12 localizedStringForKey:@"STAGE_MANAGER_MENU_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  v16[0] = v7;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  double v2 = [v11 menuWithTitle:v13 children:v14];

LABEL_6:
  return v2;
}

- (SBIconView)initWithConfigurationOptions:(unint64_t)a3
{
  return [(SBIconView *)self initWithConfigurationOptions:a3 listLayoutProvider:0];
}

- (SBIconView)initWithFrame:(CGRect)a3
{
  return -[SBIconView initWithConfigurationOptions:listLayoutProvider:](self, "initWithConfigurationOptions:listLayoutProvider:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  char v12 = *((unsigned char *)self + 549);
  if ((v12 & 8) == 0) {
    goto LABEL_4;
  }
  p_iconImageInfo = &self->_iconImageInfo;
  if (SBIconImageInfoEqualToIconImageInfo(v3, v4, v5, v6, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius))
  {
    return;
  }
  char v12 = *((unsigned char *)self + 549);
  if ((v12 & 8) != 0)
  {
    BOOL v14 = !SBIconImageInfoSizeAndScaleEqualToIconImageInfo(v10, v9, v8, v7, p_iconImageInfo->size.width, p_iconImageInfo->size.height, p_iconImageInfo->scale);
    char v12 = *((unsigned char *)self + 549);
  }
  else
  {
LABEL_4:
    BOOL v14 = 1;
  }
  *((unsigned char *)self + 549) = v12 | 8;
  self->_iconImageInfo.size.CGFloat width = v10;
  self->_iconImageInfo.size.double height = v9;
  self->_iconImageInfo.scale = v8;
  self->_iconImageInfo.continuousCornerRadius = v7;
  [(SBIconView *)self _updateAfterManualIconImageInfoChangeInvalidatingLayout:v14];
}

- (void)_updateAfterManualIconImageInfoChangeInvalidatingLayout:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBIconView *)self customIconImageViewController];
  if (v5)
  {
    [(SBIconView *)self iconImageInfo];
    objc_msgSend(v5, "setIconImageInfo:");
  }
  if (v3)
  {
    [(SBIconView *)self invalidateIntrinsicContentSize];
    [(SBIconView *)self _updateFrameToIconViewSize];
    [(SBIconView *)self _updateLabelArea];
  }
}

- (void)setBoundsSizeFromIconImageSize:(CGSize)a3
{
  -[SBIconView iconViewSizeForIconImageSize:](self, "iconViewSizeForIconImageSize:", a3.width, a3.height);
  -[SBIconView setBounds:](self, "setBounds:", 0.0, 0.0, v4, v5);
}

- (void)windowSceneUserInterfaceStyleChanged
{
  id v2 = [(SBIconView *)self _iconImageView];
  [v2 updateImageAnimated:1];
}

- (id)effectiveIconImageStyleConfiguration
{
  BOOL v3 = [(SBIconView *)self overrideIconImageAppearance];
  if (v3)
  {
    id v4 = +[SBHIconImageStyleConfiguration styleConfigurationWithIconImageAppearance:v3];
  }
  else
  {
    double v5 = [(SBIconView *)self overrideIconImageStyleConfiguration];
    double v6 = v5;
    if (v5)
    {
      id v4 = v5;
    }
    else
    {
      double v7 = [(SBIconView *)self traitCollection];
      objc_msgSend(v7, "sbh_iconImageStyleConfiguration");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v4;
}

- (BOOL)isCustomIconImageViewHitTestingDisabled
{
  return (*((unsigned __int8 *)self + 550) >> 4) & 1;
}

- (void)setCustomIconImageViewHitTestingDisabled:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 550);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 16;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 550) = v3 & 0xEF | v4;
    [(SBIconView *)self _updateCustomIconImageViewControllerHitTesting];
  }
}

- (void)_updateCustomIconImageViewControllerHitTesting
{
  id v4 = [(SBIconView *)self customIconImageViewController];
  char v3 = [v4 view];
  objc_msgSend(v3, "bs_setHitTestingDisabled:", -[SBIconView isCustomIconImageViewHitTestingDisabled](self, "isCustomIconImageViewHitTestingDisabled"));
}

- (void)setCustomIconImageViewControllerPresentationMode:(unint64_t)a3
{
  id v4 = [(SBIconView *)self customIconImageViewController];
  if (objc_opt_respondsToSelector()) {
    [v4 setPresentationMode:a3];
  }
}

- (unint64_t)customIconImageViewControllerPresentationMode
{
  id v2 = [(SBIconView *)self customIconImageViewController];
  if (objc_opt_respondsToSelector()) {
    unint64_t v3 = [v2 presentationMode];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)isCancelingDrag
{
  return *((unsigned __int8 *)self + 547) >> 7;
}

- (BOOL)disallowCursorInteraction
{
  return (*((unsigned __int8 *)self + 550) >> 3) & 1;
}

- (BOOL)showsSquareCorners
{
  return (*((unsigned __int8 *)self + 549) >> 4) & 1;
}

- (double)_continuousCornerRadius
{
  if ((*((unsigned char *)self + 549) & 0x10) != 0) {
    return 0.0;
  }
  [(SBIconView *)self iconImageCornerRadius];
  return result;
}

uint64_t __45__SBIconView_setListLayoutProvider_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateFrameToIconViewSize];
  uint64_t result = [*(id *)(a1 + 32) shouldAnimateFrameOfIconImageView];
  if (result)
  {
    [*(id *)(a1 + 32) _frameForImageView];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "sbf_setBoundsAndPositionFromFrame:");
    [*(id *)(*(void *)(a1 + 32) + 424) iconImageInfoDidChange];
    [*(id *)(*(void *)(a1 + 32) + 424) layoutIfNeeded];
    unint64_t v3 = *(void **)(a1 + 32);
    return [v3 layoutIfNeeded];
  }
  return result;
}

uint64_t __45__SBIconView_setListLayoutProvider_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) didAnimateIconImageInfoChange];
}

- (unint64_t)imageLoadingBehavior
{
  return ((unint64_t)*((unsigned __int8 *)self + 550) >> 1) & 3;
}

- (BOOL)allowsContextMenus
{
  return [(NSHashTable *)self->_forbidContextMenusAssertions count] == 0;
}

- (id)disallowContextMenusForReason:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [SBIconViewAssertion alloc];
  char v12 = @"reason";
  v13[0] = v4;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  double v7 = [(SBIconViewAssertion *)v5 initWithAssertionType:3 iconView:self extraInfo:v6];

  forbidContextMenusAssertions = self->_forbidContextMenusAssertions;
  if (!forbidContextMenusAssertions)
  {
    double v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    double v10 = self->_forbidContextMenusAssertions;
    self->_forbidContextMenusAssertions = v9;

    forbidContextMenusAssertions = self->_forbidContextMenusAssertions;
  }
  [(NSHashTable *)forbidContextMenusAssertions addObject:v7];
  if ([(SBIconView *)self isShowingContextMenu]) {
    [(SBIconView *)self dismissContextMenuWithCompletion:0];
  }

  return v7;
}

- (void)removeForbidContextMenusAssertion:(id)a3
{
}

- (void)performAfterContextMenusDismissUsingBlock:(id)a3
{
  double v7 = (void (**)(void))a3;
  if ([(SBIconView *)self isShowingContextMenu])
  {
    performAfterContextMenuBlocks = self->_performAfterContextMenuBlocks;
    double v5 = (void *)[v7 copy];

    double v6 = _Block_copy(v5);
    [(NSMutableArray *)performAfterContextMenuBlocks addObject:v6];

    double v7 = (void (**)(void))v5;
  }
  else
  {
    v7[2]();
  }
}

- (SBIconContinuityItem)continuityItem
{
  if (os_variant_has_internal_content() && [(SBIconView *)self _debugContinuity])
  {
    unint64_t v3 = [(id)objc_opt_class() debugContinuityItem];
  }
  else
  {
    id v4 = [(SBIconView *)self continuityInfo];
    unint64_t v3 = +[SBIconContinuityItem itemForContinuityInfo:v4];
  }
  return (SBIconContinuityItem *)v3;
}

- (UIImage)iconImageSnapshot
{
  return (UIImage *)[(SBIconImageView *)self->_iconImageView snapshot];
}

- (UIView)iconImageSnapshotView
{
  crossfadeView = self->_crossfadeView;
  if (crossfadeView
    || (char v4 = objc_opt_respondsToSelector(), crossfadeView = self->_customIconImageViewController, (v4 & 1) != 0))
  {
    double v5 = [crossfadeView snapshotView];
    goto LABEL_4;
  }
  if (crossfadeView)
  {
    double v7 = [crossfadeView view];
    uint64_t v8 = [v7 snapshotView];
  }
  else
  {
    double v7 = [(SBIconImageView *)self->_iconImageView snapshot];
    if (!v7)
    {
      double v5 = 0;
      goto LABEL_12;
    }
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v7];
  }
  double v5 = (void *)v8;
LABEL_12:

LABEL_4:
  return (UIView *)v5;
}

- (CGPoint)iconImageCenter
{
  id v2 = [(SBIconView *)self currentImageView];
  [v2 center];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGSize)iconImageVisibleSize
{
  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    [(SBIconImageView *)iconImageView visibleBounds];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v8 = [(SBIconView *)self currentImageView];
    [v8 bounds];
    double v5 = v9;
    double v7 = v10;
  }
  [(SBIconView *)self iconContentScale];
  CGFloat v12 = v11;
  if ((BSFloatIsOne() & 1) == 0)
  {
    CGAffineTransformMakeScale(&v16, v12, v12);
    double v13 = v7 * v16.c;
    double v7 = v7 * v16.d + v16.b * v5;
    double v5 = v13 + v16.a * v5;
  }
  double v14 = v5;
  double v15 = v7;
  result.double height = v15;
  result.CGFloat width = v14;
  return result;
}

- (CGRect)iconImageVisibleFrame
{
  [(SBIconView *)self iconImageVisibleSize];
  [(SBIconView *)self iconImageFrame];
  double v3 = [(SBIconView *)self _screen];
  [v3 scale];

  UIRectCenteredIntegralRectScale();
  result.size.double height = v7;
  result.size.CGFloat width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)setIconImageAndAccessoryAlpha:(double)a3
{
  -[SBIconView setIconImageAlpha:](self, "setIconImageAlpha:");
  [(SBIconView *)self setIconAccessoryAlpha:a3];
}

+ (double)iconLiftAlpha
{
  return 1.0;
}

- (void)_setForcingIconContentScalingEnabled:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 547);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 16;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 547) = v3 & 0xEF | v4;
    [(SBIconView *)self _toggleContentContainerViewIfNecessary];
  }
}

- (double)effectiveIconContentScale
{
  if (![(SBIconView *)self isIconContentScalingEnabled]) {
    return 1.0;
  }
  [(SBIconView *)self iconContentScale];
  return result;
}

void __51__SBIconView__shouldAlwaysHaveContentContainerView__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  id v0 = [v1 bundleIdentifier];
  _shouldAlwaysHaveContentContainerView_shouldAlwaysHaveContentContainerView = [v0 isEqualToString:@"com.apple.CarPlayApp"] ^ 1;
}

- (BOOL)_shouldHaveContentContainerView
{
  id v2 = objc_opt_class();
  return [v2 _shouldAlwaysHaveContentContainerView];
}

- (void)_toggleContentContainerViewIfNecessary
{
  BOOL v3 = [(SBIconView *)self _shouldHaveContentContainerView];
  scalingContainer = self->_scalingContainer;
  if (scalingContainer) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !v3;
  }
  if (v5)
  {
    if (scalingContainer) {
      char v6 = v3;
    }
    else {
      char v6 = 1;
    }
    if ((v6 & 1) == 0)
    {
      [(SBIconView *)self _disableContentContainerView];
    }
  }
  else
  {
    [(SBIconView *)self _enableContentContainerView];
  }
}

- (void)_enableContentContainerView
{
  if (!self->_scalingContainer)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __41__SBIconView__enableContentContainerView__block_invoke;
    v4[3] = &unk_1E6AAC810;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
    [(SBIconView *)self iconContentScale];
    -[SBIconView _applyIconContentScale:](self, "_applyIconContentScale:");
    BOOL v3 = [(SBIconView *)self layer];
    [v3 setAllowsGroupBlending:1];

    [(SBIconView *)self _toggleGroupBlendingIfNecessary];
  }
}

uint64_t __41__SBIconView__enableContentContainerView__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)[(id)objc_opt_class() contentContainerViewClass]);
  [*(id *)(a1 + 32) bounds];
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:");
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 568);
  *(void *)(v4 + 568) = v3;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v6 = objc_msgSend(*(id *)(a1 + 32), "subviews", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*(void *)(a1 + 32) + 568) addSubview:*(void *)(*((void *)&v12 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 568)];
}

- (void)_disableContentContainerView
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  scalingContainer = self->_scalingContainer;
  if (scalingContainer)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [(UIView *)scalingContainer subviews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [(SBIconView *)self addSubview:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    [(UIView *)self->_scalingContainer removeFromSuperview];
    uint64_t v9 = self->_scalingContainer;
    self->_scalingContainer = 0;

    [(SBIconView *)self _toggleGroupBlendingIfNecessary];
  }
}

- (void)_updateIconContentScale
{
  double v3 = 1.0;
  double v4 = 1.0;
  if ([(SBIconView *)self isIconContentScalingEnabled])
  {
    [(SBIconView *)self iconContentScale];
    double v4 = v5;
  }
  BOOL v6 = [(SBIconView *)self isDragLifted];
  BOOL v7 = [(SBIconView *)self isShowingContextMenu];
  if (v6 && !v7)
  {
    [(SBIconView *)self _additionalLiftScale];
    double v3 = v8;
  }
  [(SBIconView *)self _applyIconContentScale:v4 * v3];
}

- (void)_applyIconContentScale:(double)a3
{
  if ((BSFloatIsOne() & 1) != 0 || ![(SBIconView *)self isIconContentScalingEnabled])
  {
    scalingContainer = self->_scalingContainer;
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v10.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v10.c = v7;
    *(_OWORD *)&v10.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    BOOL v6 = &v10;
  }
  else
  {
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v10, a3, a3);
    scalingContainer = self->_scalingContainer;
    CGAffineTransform v9 = v10;
    BOOL v6 = &v9;
  }
  -[UIView setTransform:](scalingContainer, "setTransform:", v6, *(_OWORD *)&v9.a, *(_OWORD *)&v9.c, *(_OWORD *)&v9.tx, *(void *)&v10.a, *(void *)&v10.b, *(void *)&v10.c, *(void *)&v10.d, *(void *)&v10.tx, *(void *)&v10.ty);
  [(SBIconView *)self bounds];
  -[UIView setBounds:](self->_scalingContainer, "setBounds:");
  double v8 = self->_scalingContainer;
  UIRectGetCenter();
  -[UIView setCenter:](v8, "setCenter:");
}

- (double)_additionalLiftScale
{
  double v3 = [(SBIconView *)self dragDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v3 additionalDragLiftScaleForIconView:self];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.1;
  }

  return v5;
}

- (BOOL)isDragLifted
{
  return (*((unsigned __int8 *)self + 548) >> 2) & 1;
}

- (void)_acquireHomeButtonPressConsumingAssertionIfNecessary
{
  if ((__sb__runningInSpringBoard() & 1) == 0)
  {
    double v3 = [(SBIconView *)self homeButtonPressConsumingAssertion];

    if (!v3)
    {
      double v4 = [MEMORY[0x1E4FA6AA8] sharedInstance];
      id v5 = [v4 beginConsumingPressesForButtonKind:1 eventConsumer:self priority:0];

      [(SBIconView *)self setHomeButtonPressConsumingAssertion:v5];
    }
  }
}

- (id)_visiblyActiveDataSource
{
  double v3 = [(SBIconView *)self customIconImageViewController];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [v3 visiblyActiveDataSource];
  }
  else
  {
    id v5 = [(SBIconView *)self icon];
    if ([v5 isLeafIcon])
    {
      double v4 = [v5 activeDataSource];
    }
    else
    {
      double v4 = 0;
    }
  }
  return v4;
}

- (id)configurationUIDelegate
{
  id v3 = [(SBIconView *)self delegate];
  double v4 = v3;
  if (objc_opt_respondsToSelector())
  {
    double v4 = [v3 configurationUIDelegateForIconView:self];
  }
  return v4;
}

- (BOOL)supportsConfigurationCard
{
  id v3 = [(SBIconView *)self configurationUIDelegate];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [(SBIconView *)self _visiblyActiveDataSource];
    if (v4) {
      char v5 = [v3 iconView:self supportsConfigurationForDataSource:v4];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)supportsStackConfigurationCard
{
  id v2 = [(SBIconView *)self icon];
  char v3 = [v2 supportsStackConfiguration];

  return v3;
}

- (BOOL)isShowingStackConfigurationCard
{
  id v2 = [(SBIconView *)self currentStackConfigurationInteraction];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)presentConfigurationCard
{
  BOOL v3 = [(SBIconView *)self currentConfigurationInteraction];
  if (!v3)
  {
    double v4 = [(SBIconView *)self configurationUIDelegate];
    if (objc_opt_respondsToSelector())
    {
      char v5 = [(SBIconView *)self _visiblyActiveDataSource];
      if (v5)
      {
        id v7 = [v4 iconView:self configurationInteractionForDataSource:v5];
        [v7 setDelegate:self];
        [(SBIconView *)self setCurrentConfigurationInteraction:v7];
      }
      else
      {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }

    BOOL v3 = v7;
  }
  id v8 = v3;
  [v3 beginConfiguration];
  BOOL v6 = [MEMORY[0x1E4FA5E78] sharedInstance];
  [v6 emitEvent:58];
}

- (void)presentStackConfigurationCard
{
  BOOL v3 = [(SBIconView *)self currentStackConfigurationInteraction];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v6 = v5;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  id v16 = v6;

  id v7 = v16;
  if (!v16)
  {
    id v8 = [(SBIconView *)self currentConfigurationInteraction];

    if (v8)
    {
      id v7 = 0;
    }
    else
    {
      CGAffineTransform v9 = [(SBIconView *)self configurationUIDelegate];
      if (objc_opt_respondsToSelector())
      {
        CGAffineTransform v10 = [v9 stackConfigurationInteractionForIconView:self];
        uint64_t v11 = objc_opt_class();
        id v12 = v10;
        if (v11)
        {
          if (objc_opt_isKindOfClass()) {
            long long v13 = v12;
          }
          else {
            long long v13 = 0;
          }
        }
        else
        {
          long long v13 = 0;
        }
        id v14 = v13;

        id v17 = v14;
        [v17 setDelegate:self];
        [(SBIconView *)self setCurrentStackConfigurationInteraction:v17];
      }
      else
      {
        id v17 = 0;
      }

      id v7 = v17;
    }
  }
  id v18 = v7;
  [v7 beginConfiguration];
  uint64_t v15 = [MEMORY[0x1E4FA5E78] sharedInstance];
  [v15 emitEvent:59];
}

- (void)popStackConfigurationCard
{
  id v2 = [(SBIconView *)self currentStackConfigurationInteraction];
  [v2 popConfiguration];
}

- (void)dismissStackConfigurationCard
{
  id v2 = [(SBIconView *)self currentStackConfigurationInteraction];
  [v2 endConfiguration];
}

- (void)popConfigurationCard
{
  id v2 = [(SBIconView *)self currentConfigurationInteraction];
  [v2 popConfiguration];
}

- (void)dismissConfigurationCard
{
  id v2 = [(SBIconView *)self currentConfigurationInteraction];
  [v2 endConfiguration];
}

- (id)containerViewControllerForConfigurationInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconView *)self configurationUIDelegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [v5 iconView:self containerViewControllerForConfigurationInteraction:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)containerViewForConfigurationInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconView *)self configurationUIDelegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [v5 iconView:self containerViewForConfigurationInteraction:v4];
  }
  else
  {
    id v7 = [(SBIconView *)self containerViewControllerForConfigurationInteraction:v4];

    BOOL v6 = [v7 view];
    id v4 = v7;
  }

  return v6;
}

- (CGRect)contentBoundingRectForConfigurationInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconView *)self configurationUIDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 iconView:self contentBoundingRectForConfigurationInteraction:v4];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    id v14 = [(SBIconView *)self containerViewForConfigurationInteraction:v4];

    [v14 bounds];
    double v7 = v15;
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
    id v4 = v14;
  }

  double v19 = v7;
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  result.size.double height = v22;
  result.size.CGFloat width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (int64_t)userInterfaceStyleForConfigurationInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconView *)self configurationUIDelegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v6 = [v5 iconView:self userInterfaceStyleForConfigurationInteraction:v4];
  }
  else
  {
    double v7 = [(SBIconView *)self traitCollection];
    int64_t v6 = [v7 userInterfaceStyle];
  }
  return v6;
}

- (id)homeScreenContentViewForConfigurationInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconView *)self configurationUIDelegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v6 = [v5 iconView:self homeScreenContentViewForConfigurationInteraction:v4];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)configurationInteractionWillBegin:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SBIconView *)self _updateIconImageAdornmentsAnimated:0];
    [(SBIconView *)self setAllowsEditingAnimation:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SBIconView *)self _updateIconImageAdornmentsAnimated:0];
    [(SBIconView *)self setAllowsEditingAnimation:0];
  }
  id v4 = [(SBIconView *)self configurationUIDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 iconView:self configurationWillBeginWithInteraction:v5];
  }
}

- (void)configurationInteractionDidBegin:(id)a3
{
  id v5 = a3;
  id v4 = [(SBIconView *)self configurationUIDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 iconView:self configurationDidBeginWithInteraction:v5];
  }
}

- (void)configurationInteractionDidCommit:(id)a3
{
  id v5 = a3;
  id v4 = [(SBIconView *)self configurationUIDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 iconView:self configurationDidUpdateWithInteraction:v5];
  }
}

- (void)configurationInteractionWillEnd:(id)a3
{
  id v5 = a3;
  id v4 = [(SBIconView *)self configurationUIDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 iconView:self configurationWillEndWithInteraction:v5];
  }
}

- (void)configurationInteractionDidEnd:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SBIconView *)self setCurrentConfigurationInteraction:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SBIconView *)self setCurrentStackConfigurationInteraction:0];
  }
  [(SBIconView *)self _updateIconImageAdornmentsAnimated:1];
  [(SBIconView *)self setAllowsEditingAnimation:1];
  id v4 = [(SBIconView *)self configurationUIDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 iconView:self configurationDidEndWithInteraction:v5];
  }
}

- (double)verticalMarginPercentageForConfigurationInteraction:(id)a3
{
  id v4 = [(SBIconView *)self configurationUIDelegate];
  double v5 = -1.0;
  if (objc_opt_respondsToSelector())
  {
    [v4 verticalMarginPercentageForConfigurationOfIconView:self];
    double v5 = v6;
  }

  return v5;
}

- (id)newCaptureOnlyBackgroundView
{
  BOOL v3 = [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController backgroundViewProvider];
  id v4 = v3[2]();

  if (objc_opt_respondsToSelector())
  {
    if (objc_opt_respondsToSelector())
    {
      double v5 = [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController backgroundViewConfigurator];
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        double v6 = [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController visiblyActiveDataSource];
        if (v6) {
          ((void (**)(void, void *, void *))v5)[2](v5, v4, v6);
        }
      }
    }
    else
    {
      double v5 = 0;
    }
    [v4 setCaptureOnly:1];
    id v7 = v4;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)representativeIconViewForModalInteractions
{
  unint64_t v3 = [(SBIconView *)self configurationOptions];
  UIAccessibilityIsReduceMotionEnabled();
  id v4 = self;

  double v5 = (void *)[objc_alloc((Class)v4) initWithConfigurationOptions:v3 | 0x14];
  [v5 configureBorrowingIconImageViewFromIconView:self];
  [v5 setEditing:0];
  [v5 setAllowsEditingAnimation:0];
  [(SBIconView *)self iconImageInfo];
  objc_msgSend(v5, "setIconImageInfo:");
  [(SBIconView *)self bounds];
  objc_msgSend(v5, "setFrame:");
  [v5 layoutIfNeeded];
  return v5;
}

- (BOOL)sharesIconTintColorWithSpringBoard
{
  return (*((unsigned __int8 *)self + 551) >> 4) & 1;
}

- (void)setSharesIconTintColorWithSpringBoard:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 551);
  if ((((v3 & 0x10) == 0) ^ a3)) {
    return;
  }
  BOOL v4 = a3;
  if (a3) {
    char v6 = 16;
  }
  else {
    char v6 = 0;
  }
  *((unsigned char *)self + 551) = v3 & 0xEF | v6;
  id v7 = [(SBIconView *)self springBoardIconStyleObservation];
  double v11 = v7;
  if (v4)
  {
    char v8 = __sb__runningInSpringBoard();
    id v7 = v11;
    if ((v8 & 1) == 0)
    {
      double v9 = [(id)objc_opt_class() homeScreenService];
      double v10 = [v9 addHomeScreenIconStyleObserver:self];
      [(SBIconView *)self setSpringBoardIconStyleObservation:v10];

      goto LABEL_10;
    }
  }
  if (v7)
  {
    [v7 invalidate];
    [(SBIconView *)self setSpringBoardIconStyleObservation:0];
LABEL_10:
    id v7 = v11;
  }
}

- (void)homeScreenService:(id)a3 homeScreenIconStyleConfigurationDidChange:(id)a4
{
  double v5 = objc_msgSend(a4, "sbh_iconImageStyleConfiguration", a3);
  id v4 = v5;
  BSDispatchMain();
}

void __74__SBIconView_homeScreenService_homeScreenIconStyleConfigurationDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSpringBoardIconImageStyleConfiguration:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) traitOverrides];
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = self;
  [v4 setObject:v2 forTrait:v3];
}

+ (BOOL)supportsPreviewInteraction
{
  return 1;
}

+ (BOOL)showsPopovers
{
  uint64_t v2 = +[SBHHomeScreenDomain rootSettings];
  char v3 = [v2 showPopOvers];

  return v3;
}

- (BOOL)_hasPopover
{
  if (![(id)objc_opt_class() showsPopovers]) {
    return 0;
  }
  int v3 = (*(unsigned __int16 *)((char *)self + 549) >> 7) & 3;
  if (v3) {
    return v3 == 1;
  }
  double v5 = [(SBIconView *)self applicationBundleIdentifierForShortcuts];
  char v6 = [(SBIconView *)self recentsDocumentExtensionProvider];
  if ([v6 canShowRecentsDocumentExtensionProviderForBundleIdentifier:v5]) {
    __int16 v7 = 128;
  }
  else {
    __int16 v7 = 256;
  }
  *(_WORD *)((char *)self + 549) = *(_WORD *)((char *)self + 549) & 0xFE7F | v7;

  BOOL v4 = (*(_WORD *)((char *)self + 549) & 0x180) == 128;
  return v4;
}

- (id)recentsDocumentExtensionProvider
{
  if ([(id)objc_opt_class() showsPopovers])
  {
    recentsDocumentExtensionProvider = self->_recentsDocumentExtensionProvider;
    if (recentsDocumentExtensionProvider)
    {
      BOOL v4 = recentsDocumentExtensionProvider;
    }
    else
    {
      double v5 = [(SBIconView *)self shortcutsDelegate];
      char v6 = self->_recentsDocumentExtensionProvider;
      if (!v6)
      {
        if (objc_opt_respondsToSelector())
        {
          __int16 v7 = [v5 recentDocumentExtensionProviderForIconView:self];
        }
        else
        {
          __int16 v7 = objc_alloc_init(SBHRecentsDocumentExtensionProvider);
        }
        char v8 = self->_recentsDocumentExtensionProvider;
        self->_recentsDocumentExtensionProvider = v7;

        [(SBHRecentsDocumentExtensionProvider *)self->_recentsDocumentExtensionProvider setUsesIntrinsicContentSizeBasedOnScreenSize:1];
        char v6 = self->_recentsDocumentExtensionProvider;
      }
      BOOL v4 = v6;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (id)shortcutsDelegate
{
  id v3 = [(SBIconView *)self delegate];
  BOOL v4 = v3;
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [v3 shortcutsDelegateForIconView:self];
  }
  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([(id)objc_opt_class() supportsPreviewInteraction]
    && [(SBIconView *)self allowsContextMenus])
  {
    if (objc_opt_respondsToSelector()) {
      -[SBIconViewCustomImageViewControlling willShowContextMenuAtLocation:](self->_customIconImageViewController, "willShowContextMenuAtLocation:", x, y);
    }
    char v8 = [(SBIconView *)self shortcutsDelegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ![v8 iconViewShouldBeginShortcutsPresentation:self])
    {
      double v16 = 0;
    }
    else
    {
      if ([(NSHashTable *)self->_contextMenuInteractionConfigurations count])
      {
        double v9 = SBLogIconContextMenu();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          CGFloat v36 = "-[SBIconView contextMenuInteraction:configurationForMenuAtLocation:]";
          __int16 v37 = 1024;
          int v38 = 2555;
          _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d Warning; there is already a context menu interaction in flight!!!",
            buf,
            0x12u);
        }
      }
      double v10 = -[SBIconViewContextMenuContext initWithIconView:location:]([SBIconViewContextMenuContext alloc], "initWithIconView:location:", self, x, y);
      double v23 = [(SBIconView *)self applicationBundleIdentifierForShortcuts];
      double v22 = [(SBIconView *)self recentsDocumentExtensionProvider];
      BOOL v11 = [(SBIconView *)self _hasPopover];
      double v12 = [(SBIconView *)self effectiveApplicationShortcutItems];
      if ([v12 count]) {
        char v13 = 1;
      }
      else {
        char v13 = v11;
      }

      if (v13)
      {
        id v14 = [(SBIconView *)self applicationBundleURLForShortcuts];
        if (v14) {
          double v15 = (void *)[objc_alloc(MEMORY[0x1E4F4F6D0]) initWithURL:v14];
        }
        else {
          double v15 = 0;
        }
        objc_initWeak((id *)buf, self);
        double v17 = (void *)MEMORY[0x1E4FB1678];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
        v30[3] = &unk_1E6AB2E20;
        objc_copyWeak(&v33, (id *)buf);
        BOOL v34 = v11;
        id v31 = v22;
        id v18 = v23;
        id v32 = v18;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
        v24[3] = &unk_1E6AB2EE8;
        objc_copyWeak(&v29, (id *)buf);
        id v25 = v18;
        double v26 = self;
        id v19 = v14;
        id v27 = v19;
        id v20 = v15;
        id v28 = v20;
        double v16 = [v17 configurationWithIdentifier:v10 previewProvider:v30 actionProvider:v24];

        objc_destroyWeak(&v29);
        objc_destroyWeak(&v33);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        double v16 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:v10 previewProvider:0 actionProvider:&__block_literal_global_280_0];
        [(SBIconView *)self setLastContextMenuInteractionFailedToLoad:1];
      }
      [v16 setPreferredMenuElementOrder:1];
    }
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke()
{
  return 0;
}

id __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained
    && *(unsigned char *)(a1 + 56)
    && ([*(id *)(a1 + 32) recentsDocumentViewControllerForBundleIdentifier:*(void *)(a1 + 40)],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v4 = (void *)v3;
    double v5 = objc_opt_new();
    [v5 setGroupNameBase:@"SBIconView"];
    [v5 setBackgroundScale:0.05];
    [v5 setContentViewController:v4];
    [*(id *)(a1 + 32) setDelegate:v5];
    [WeakRetained setLastContextMenuInteractionFailedToLoad:0];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

id __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v32 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v31 = WeakRetained;
    BOOL v4 = [WeakRetained effectiveApplicationShortcutItems];
    double v35 = [MEMORY[0x1E4F1CA48] array];
    CGFloat v36 = [MEMORY[0x1E4F1CA48] array];
    BOOL v34 = [MEMORY[0x1E4F1CA48] array];
    id v33 = [MEMORY[0x1E4F1CA48] array];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
    aBlock[3] = &unk_1E6AB2EC0;
    id v5 = v4;
    id v51 = v5;
    location = &v57;
    objc_copyWeak(&v57, (id *)(a1 + 64));
    id v52 = *(id *)(a1 + 32);
    id v53 = v31;
    char v6 = *(void **)(a1 + 48);
    uint64_t v54 = *(void *)(a1 + 40);
    id v55 = v6;
    id v56 = *(id *)(a1 + 56);
    id v7 = (void (**)(void *, void *))_Block_copy(aBlock);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v61 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v47 != v9) {
            objc_enumerationMutation(obj);
          }
          BOOL v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          double v12 = v7[2](v7, v11);
          if (v12)
          {
            char v13 = objc_msgSend(v11, "type", location);
            [v12 setAccessibilityIdentifier:v13];

            if (+[SBHIconApplicationShortcutListComposer sbh_isDestructiveShortcutItem:v11])
            {
              id v14 = self;
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass) {
                [v12 setAttributes:2];
              }
            }
            unint64_t v16 = +[SBHIconApplicationShortcutListComposer sbh_shortcutSectionForItem:v11];
            double v17 = v36;
            switch(v16)
            {
              case 0uLL:
                goto LABEL_15;
              case 1uLL:
                double v17 = v34;
                goto LABEL_15;
              case 2uLL:
                double v17 = v33;
                goto LABEL_15;
              case 3uLL:
                double v17 = v35;
LABEL_15:
                [v17 addObject:v12];
                break;
              default:
                break;
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v61 count:16];
      }
      while (v8);
    }

    id v18 = (void *)[v35 mutableCopy];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v59[0] = v36;
    v59[1] = v34;
    v59[2] = v33;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v60 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v19);
          }
          double v23 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v24 = v23;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v58 count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v39;
            do
            {
              for (uint64_t k = 0; k != v25; ++k)
              {
                if (*(void *)v39 != v26) {
                  objc_enumerationMutation(v24);
                }
                objc_msgSend(v18, "addObject:", *(void *)(*((void *)&v38 + 1) + 8 * k), location);
              }
              uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v58 count:16];
            }
            while (v25);
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v60 count:16];
      }
      while (v20);
    }

    id v28 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F2FA0300 children:v18];

    objc_destroyWeak(location);
    id WeakRetained = v31;
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

id __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)[*(id *)(a1 + 32) indexOfObject:v3];
  id v5 = [v3 type];
  if ([v5 isEqualToString:@"com.apple.springboardhome.application-shortcut-item.change-widget-size"])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5;
    aBlock[3] = &unk_1E6AB2E48;
    objc_copyWeak(v85, (id *)(a1 + 80));
    v85[1] = v4;
    id v84 = *(id *)(a1 + 40);
    uint64_t v61 = _Block_copy(aBlock);
    id v7 = [*(id *)(a1 + 48) listLayout];
    uint64_t v8 = SBHIconListLayoutSupportedIconGridSizeClasses(v7);
    uint64_t v9 = [*(id *)(a1 + 48) supportedIconGridSizeClassesForResize];
    v63 = [v8 gridSizeClassSetByIntersectingWithGridSizeClassSet:v9];
    BOOL v58 = [*(id *)(a1 + 48) icon];
    id v60 = [*(id *)(a1 + 48) gridSizeClass];
    if ((unint64_t)[v63 count] < 2)
    {
      double v10 = 0;
LABEL_38:

      objc_destroyWeak(v85);
      goto LABEL_39;
    }
    v59 = [MEMORY[0x1E4FB1830] configurationWithPointSize:19.0];
    id v24 = v9;
    id v57 = v3;
    id v56 = v7;
    uint64_t v25 = [*(id *)(a1 + 48) gridSizeClassDomain];
    uint64_t v26 = @"SBHIconGridSizeClassDefault";
    if ([v63 containsGridSizeClass:v26 inDomain:v25])
    {
      id v27 = [v58 applicationBundleID];
      if (([v58 isWidgetStackIcon] & 1) == 0)
      {
        int v28 = [v58 isWidgetIcon];
        if (v63) {
          int v29 = v28;
        }
        else {
          int v29 = 0;
        }
        if (v29 == 1)
        {
          double v30 = [v58 activeDataSource];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            uint64_t v31 = [v30 containerBundleIdentifier];
          }
          else
          {
            uint64_t v31 = 0;
          }

          id v27 = (void *)v31;
        }
        if (!v27) {
          goto LABEL_27;
        }
        id v32 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"app.grid.2x2.topbackward.filled" withConfiguration:v59];
        id v33 = (void *)MEMORY[0x1E4FB13F0];
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6;
        v81[3] = &unk_1E6AB2E70;
        id v82 = v61;
        BOOL v34 = [v33 actionWithTitle:&stru_1F2FA0300 image:0 identifier:@"com.apple.springboardhome.application-shortcut-item.change-widget-to-app-icon" handler:v81];
        [*(id *)(a1 + 56) _configureResizeAction:v34 forGridSizeClass:v26 withSelectedGridSizeClass:v60 withIconSupportedGridSizeClasses:v24];
        [v34 setImage:v32];
        [v6 addObject:v34];
      }
    }
LABEL_27:
    double v35 = @"SBHIconGridSizeClassSmall";

    if ([v8 containsGridSizeClass:v35 inDomain:v25])
    {
      CGFloat v36 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"widget.small" withConfiguration:v59];
      __int16 v37 = (void *)MEMORY[0x1E4FB13F0];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7;
      v79[3] = &unk_1E6AB2E70;
      id v80 = v61;
      long long v38 = [v37 actionWithTitle:&stru_1F2FA0300 image:0 identifier:@"com.apple.springboardhome.application-shortcut-item.change-widget-size-small" handler:v79];
      [*(id *)(a1 + 56) _configureResizeAction:v38 forGridSizeClass:v35 withSelectedGridSizeClass:v60 withIconSupportedGridSizeClasses:v24];
      [v38 setImage:v36];
      [v6 addObject:v38];
    }
    long long v39 = @"SBHIconGridSizeClassMedium";

    if ([v8 containsGridSizeClass:v39 inDomain:v25])
    {
      long long v40 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"widget.medium" withConfiguration:v59];
      long long v41 = (void *)MEMORY[0x1E4FB13F0];
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8;
      v77[3] = &unk_1E6AB2E70;
      id v78 = v61;
      long long v42 = [v41 actionWithTitle:&stru_1F2FA0300 image:0 identifier:@"com.apple.springboardhome.application-shortcut-item.change-widget-size-medium" handler:v77];
      [*(id *)(a1 + 56) _configureResizeAction:v42 forGridSizeClass:v39 withSelectedGridSizeClass:v60 withIconSupportedGridSizeClasses:v24];
      [v42 setImage:v40];
      [v6 addObject:v42];
    }
    long long v43 = @"SBHIconGridSizeClassLarge";

    if ([v8 containsGridSizeClass:v43 inDomain:v25])
    {
      long long v44 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"widget.large" withConfiguration:v59];
      long long v45 = (void *)MEMORY[0x1E4FB13F0];
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_9;
      v75[3] = &unk_1E6AB2E70;
      id v76 = v61;
      long long v46 = [v45 actionWithTitle:@"L" image:0 identifier:@"com.apple.springboardhome.application-shortcut-item.change-widget-size-large" handler:v75];
      [*(id *)(a1 + 56) _configureResizeAction:v46 forGridSizeClass:v43 withSelectedGridSizeClass:v60 withIconSupportedGridSizeClasses:v24];
      [v46 setImage:v44];
      [v6 addObject:v46];
    }
    long long v47 = @"SBHIconGridSizeClassExtraLarge";

    if ([v8 containsGridSizeClass:v47 inDomain:v25])
    {
      long long v48 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"widget.extralarge" withConfiguration:v59];
      long long v49 = (void *)MEMORY[0x1E4FB13F0];
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_10;
      v73[3] = &unk_1E6AB2E70;
      id v74 = v61;
      CGAffineTransform v50 = [v49 actionWithTitle:@"XL" image:0 identifier:@"com.apple.springboardhome.application-shortcut-item.change-widget-size-extralarge" handler:v73];
      [*(id *)(a1 + 56) _configureResizeAction:v50 forGridSizeClass:v47 withSelectedGridSizeClass:v60 withIconSupportedGridSizeClasses:v24];
      [v50 setImage:v48];
      [v6 addObject:v50];
    }
    id v51 = @"SBHIconGridSizeClassNewsLargeTall";

    uint64_t v9 = v24;
    if ([v8 containsGridSizeClass:v51 inDomain:v25])
    {
      id v52 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"widget.large.portrait" withConfiguration:v59];
      id v53 = (void *)MEMORY[0x1E4FB13F0];
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_11;
      v71[3] = &unk_1E6AB2E70;
      id v72 = v61;
      uint64_t v54 = [v53 actionWithTitle:@"LT" image:0 identifier:@"com.apple.springboardhome.application-shortcut-item.change-widget-size-newsLargeTall" handler:v71];
      uint64_t v9 = v24;
      [*(id *)(a1 + 56) _configureResizeAction:v54 forGridSizeClass:v51 withSelectedGridSizeClass:v60 withIconSupportedGridSizeClasses:v24];
      [v54 setImage:v52];
      [v6 addObject:v54];
    }
    double v10 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F2FA0300 image:0 identifier:@"com.apple.springboardhome.application-shortcut-item.change-widget-size" options:129 children:v6];
    [v10 setPreferredElementSize:0];

    id v7 = v56;
    id v3 = v57;
    goto LABEL_38;
  }
  id v64 = v5;
  uint64_t v11 = *(void *)(a1 + 64);
  id v69 = 0;
  id v70 = 0;
  objc_msgSend(v3, "sb_buildIconImageWithApplicationBundleURL:image:systemImageName:", v11, &v70, &v69);
  id v12 = v70;
  id v62 = v69;
  char v13 = [v3 localizedTitle];
  uint64_t v14 = [*(id *)(a1 + 72) localizedStringForKey:v13 value:0 table:@"InfoPlist"];
  double v15 = (void *)v14;
  if (v14) {
    unint64_t v16 = (void *)v14;
  }
  else {
    unint64_t v16 = v13;
  }
  id v17 = v16;

  id v18 = [v3 localizedSubtitle];
  uint64_t v19 = [*(id *)(a1 + 72) localizedStringForKey:v18 value:0 table:@"InfoPlist"];
  uint64_t v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = (void *)v19;
  }
  else {
    uint64_t v21 = v18;
  }
  id v22 = v21;

  double v23 = (void *)MEMORY[0x1E4FB13F0];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_12;
  v65[3] = &unk_1E6AB2E98;
  objc_copyWeak(v68, (id *)(a1 + 80));
  id v66 = v3;
  v68[1] = v4;
  id v67 = *(id *)(a1 + 40);
  double v10 = [v23 actionWithTitle:v17 image:v12 identifier:0 handler:v65];
  if ([v22 length]) {
    [v10 setDiscoverabilityTitle:v22];
  }

  objc_destroyWeak(v68);
  id v5 = v64;
  id v6 = v12;
LABEL_39:

  return v10;
}

void __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
    [v4 setType:v5];
    if ([WeakRetained shouldActivateApplicationShortcutItem:v4 atIndex:*(void *)(a1 + 48)])objc_msgSend((id)objc_opt_class(), "activateShortcut:withBundleIdentifier:forIconView:", v4, *(void *)(a1 + 32), WeakRetained); {
  }
    }
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    int v4 = [WeakRetained shouldActivateApplicationShortcutItem:*(void *)(a1 + 32) atIndex:*(void *)(a1 + 56)];
    id v3 = v5;
    if (v4)
    {
      [(id)objc_opt_class() activateShortcut:*(void *)(a1 + 32) withBundleIdentifier:*(void *)(a1 + 40) forIconView:v5];
      id v3 = v5;
    }
  }
}

- (void)_configureResizeAction:(id)a3 forGridSizeClass:(id)a4 withSelectedGridSizeClass:(id)a5 withIconSupportedGridSizeClasses:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v11 == v10 || [v11 isEqualToString:v10])
  {
    [v15 setAttributes:8];
    [v15 setState:1];
  }
  char v13 = [(SBIconView *)self gridSizeClassDomain];
  char v14 = [v12 containsGridSizeClass:v10 inDomain:v13];

  if ((v14 & 1) == 0) {
    [v15 setAttributes:1];
  }
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(MEMORY[0x1E4FB2080], "defaultStyle", a3, a4);
  [v5 setHasInteractivePreview:1];
  [v5 setPreferredLayout:1];
  [v5 setPreventPreviewRasterization:1];
  if (![(SBIcon *)self->_icon isWidgetIcon]) {
    [v5 setPreviewOverlapsMenu:1];
  }
  id v6 = [(SBIconView *)self window];
  [v6 safeAreaInsets];
  double v8 = v7;
  double v10 = v9;

  double v11 = 8.0;
  if (v8 < 8.0) {
    double v8 = 8.0;
  }
  if (v10 < 8.0) {
    double v10 = 8.0;
  }
  if (objc_opt_respondsToSelector())
  {
    [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController minimumPreferredEdgeInsetsForContextMenu];
    UIEdgeInsetsMax();
    double v8 = v13;
    double v10 = v14;
    double v11 = v15;
  }
  else
  {
    double v12 = 8.0;
  }
  objc_msgSend(v5, "setPreferredEdgeInsets:", v8, v12, v10, v11);
  unint64_t v16 = [(SBIconView *)self shortcutsDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v17 = [v16 containerViewForPresentingContextMenuForIconView:self];
  }
  else
  {
    id v18 = [(SBIconView *)self window];
    uint64_t v19 = [v18 rootViewController];
    id v17 = [v19 view];
  }
  [v5 setContainerView:v17];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    uint64_t v20 = (void *)MEMORY[0x1E4FB1620];
    uint64_t v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
    id v22 = [v20 colorEffectColor:v21];
    v25[0] = v22;
    double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v5 setPreferredBackgroundEffects:v23];
  }
  if (objc_opt_respondsToSelector()) {
    [v16 iconView:self willUseContextMenuStyle:v5];
  }

  return v5;
}

- (BOOL)_contextMenuInteractionShouldAllowDragAfterDismiss:(id)a3
{
  return 1;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  return [(SBIconView *)self _contextMenuInteraction:a3 previewForIconWithConfigurationOptions:18 highlighted:1];
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  return [(SBIconView *)self _contextMenuInteraction:a3 previewForIconWithConfigurationOptions:6 highlighted:0];
}

- (id)_contextMenuInteraction:(id)a3 previewForIconWithConfigurationOptions:(unint64_t)a4 highlighted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  double v7 = [a3 view];

  if (v7 != self)
  {
    double v8 = SBLogIcon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBIconView _contextMenuInteraction:previewForIconWithConfigurationOptions:highlighted:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
LABEL_4:
    unint64_t v16 = 0;
    goto LABEL_19;
  }
  id v17 = [(SBIconView *)self window];

  if (!v17)
  {
    double v8 = SBLogIcon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBIconView _contextMenuInteraction:previewForIconWithConfigurationOptions:highlighted:](v8, v31, v32, v33, v34, v35, v36, v37);
    }
    goto LABEL_4;
  }
  [(SBIconView *)self setHighlighted:v5];
  double v8 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  id v18 = [MEMORY[0x1E4FB1618] clearColor];
  [v8 setBackgroundColor:v18];

  [(SBIconView *)self iconImageCenter];
  double v20 = v19;
  double v22 = v21;
  double v23 = self;
  id v24 = [(SBIconView *)v23 currentImageView];
  uint64_t v25 = SBLogIcon();
  uint64_t v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      icon = v23->_icon;
      *(_DWORD *)buf = 138412802;
      long long v48 = icon;
      __int16 v49 = 2112;
      CGAffineTransform v50 = v24;
      __int16 v51 = 2112;
      id v52 = v23;
      _os_log_impl(&dword_1D7F0A000, v26, OS_LOG_TYPE_DEFAULT, "Configuring preview for icon '%@' w/ currentImageView '%@' contentContainerView '%@'", buf, 0x20u);
    }

    id v28 = objc_alloc(MEMORY[0x1E4FB1B38]);
    int v29 = [(SBIconView *)v23 contentContainerView];
    double v30 = v29;
    if (v29) {
      [v29 transform];
    }
    else {
      memset(v46, 0, sizeof(v46));
    }
    uint64_t v26 = objc_msgSend(v28, "initWithContainer:center:transform:", v23, v46, v20, v22);

    unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v24 parameters:v8 target:v26];
    objc_msgSend(v16, "set_springboardPlatterStyle:", 1);
  }
  else
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SBIconView _contextMenuInteraction:previewForIconWithConfigurationOptions:highlighted:](v26, v38, v39, v40, v41, v42, v43, v44);
    }
    unint64_t v16 = 0;
  }

LABEL_19:
  return v16;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__SBIconView_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
  aBlock[3] = &unk_1E6AAC810;
  void aBlock[4] = self;
  uint64_t v11 = (void (**)(void))_Block_copy(aBlock);
  [(SBIconView *)self _contextMenuConfigurationWillPresent:v9 forInteraction:v8];
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__SBIconView_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke_2;
    v14[3] = &unk_1E6AB2F10;
    v14[4] = self;
    id v15 = v8;
    unint64_t v16 = v11;
    [v10 addAnimations:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__SBIconView_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke_3;
    v12[3] = &unk_1E6AACA90;
    v12[4] = self;
    id v13 = v9;
    [v10 addCompletion:v12];
  }
  else
  {
    [(SBIconView *)self setHighlighted:0];
    if ([v8 menuAppearance] != 2) {
      v11[2](v11);
    }
    [(SBIconView *)self _contextMenuConfigurationDidPresent:v9];
  }
}

uint64_t __78__SBIconView_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  [v1 effectiveIconLabelAlpha];
  return objc_msgSend(v1, "_applyIconLabelAlpha:");
}

uint64_t __78__SBIconView_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHighlighted:0];
  uint64_t result = [*(id *)(a1 + 40) menuAppearance];
  if (result != 2)
  {
    id v3 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 animateWithDuration:327680 delay:v4 options:0 animations:0.2 completion:0.0];
  }
  return result;
}

uint64_t __78__SBIconView_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _contextMenuConfigurationDidPresent:*(void *)(a1 + 40)];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__SBIconView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  aBlock[3] = &unk_1E6AAC810;
  void aBlock[4] = self;
  uint64_t v11 = (void (**)(void))_Block_copy(aBlock);
  [(SBIconView *)self _contextMenuConfigurationWillDismiss:v9];
  if (v10)
  {
    objc_initWeak(&location, self);
    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"SBIconViewWillAnimateContextMenuNotification" object:self userInfo:0];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __70__SBIconView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_2;
    v16[3] = &unk_1E6AAD4C8;
    id v17 = v11;
    [v10 addAnimations:v16];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __70__SBIconView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_3;
    v13[3] = &unk_1E6AB0610;
    objc_copyWeak(&v15, &location);
    id v14 = v9;
    [v10 addCompletion:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v11[2](v11);
    [(SBIconView *)self _contextMenuConfigurationDidDismiss:v9];
  }
}

uint64_t __70__SBIconView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  [v1 effectiveIconLabelAlpha];
  return objc_msgSend(v1, "_applyIconLabelAlpha:");
}

uint64_t __70__SBIconView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:327680 delay:*(void *)(a1 + 32) options:0 animations:0.2 completion:0.0];
}

void __70__SBIconView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"SBIconViewDidAnimateContextMenuNotification" object:WeakRetained userInfo:0];

    [WeakRetained _contextMenuConfigurationDidDismiss:*(void *)(a1 + 32)];
  }
}

- (void)_contextMenuConfigurationWillPresent:(id)a3 forInteraction:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = SBLogIconContextMenu();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 identifier];
    int v20 = 136315906;
    double v21 = "-[SBIconView _contextMenuConfigurationWillPresent:forInteraction:]";
    __int16 v22 = 1024;
    int v23 = 2997;
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d %@ (%@)", (uint8_t *)&v20, 0x26u);
  }
  [v8 setContextMenuInteraction:v7];

  [(SBIconView *)self _updateAllComponentAlphas];
  contextMenuInteractionConfigurations = self->_contextMenuInteractionConfigurations;
  if (!contextMenuInteractionConfigurations)
  {
    uint64_t v12 = [MEMORY[0x1E4F28D30] hashTableWithOptions:0];
    id v13 = self->_contextMenuInteractionConfigurations;
    self->_contextMenuInteractionConfigurations = v12;

    contextMenuInteractionConfigurations = self->_contextMenuInteractionConfigurations;
  }
  [(NSHashTable *)contextMenuInteractionConfigurations addObject:v6];
  if (!self->_iconContextMenuActivity)
  {
    id v14 = (OS_os_activity *)_os_activity_create(&dword_1D7F0A000, "Icon Context Menu", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    iconContextMenuActivitdouble y = self->_iconContextMenuActivity;
    self->_iconContextMenuActivitdouble y = v14;

    os_activity_scope_enter((os_activity_t)self->_iconContextMenuActivity, &self->_iconContextMenuActivityState);
  }
  [(SBIconView *)self _toggleContentContainerViewIfNecessary];
  if (!self->_performAfterContextMenuBlocks)
  {
    unint64_t v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    performAfterContextMenuBlocks = self->_performAfterContextMenuBlocks;
    self->_performAfterContextMenuBlocks = v16;
  }
  id v18 = [(SBIconView *)self shortcutsDelegate];
  if (objc_opt_respondsToSelector()) {
    [v18 iconViewShortcutsPresentationWillBegin:self];
  }
  [(SBIconView *)self _acquireHomeButtonPressConsumingAssertionIfNecessary];
  double v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v19 postNotificationName:@"SBIconViewWillPresentContextMenuNotification" object:self];

  if (objc_opt_respondsToSelector()) {
    [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController setShowingContextMenu:1];
  }
}

- (void)_contextMenuConfigurationDidPresent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 identifier];
  id v6 = SBLogIconContextMenu();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 identifier];
    int v9 = 136315906;
    id v10 = "-[SBIconView _contextMenuConfigurationDidPresent:]";
    __int16 v11 = 1024;
    int v12 = 3038;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d %@ (%@)", (uint8_t *)&v9, 0x26u);
  }
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"SBIconViewDidPresentContextMenuNotification" object:self];
}

- (void)_contextMenuConfigurationWillDismiss:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 identifier];
  id v6 = SBLogIconContextMenu();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 identifier];
    int v15 = 136315906;
    id v16 = "-[SBIconView _contextMenuConfigurationWillDismiss:]";
    __int16 v17 = 1024;
    int v18 = 3047;
    __int16 v19 = 2112;
    int v20 = v7;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d %@ (%@)", (uint8_t *)&v15, 0x26u);
  }
  dismissingContextMenuInteractionConfigurations = self->_dismissingContextMenuInteractionConfigurations;
  if (!dismissingContextMenuInteractionConfigurations)
  {
    int v9 = [MEMORY[0x1E4F28D30] hashTableWithOptions:5];
    id v10 = self->_dismissingContextMenuInteractionConfigurations;
    self->_dismissingContextMenuInteractionConfigurations = v9;

    dismissingContextMenuInteractionConfigurations = self->_dismissingContextMenuInteractionConfigurations;
  }
  [(NSHashTable *)dismissingContextMenuInteractionConfigurations addObject:v4];
  __int16 v11 = [(SBIconView *)self shortcutsDelegate];
  if (objc_opt_respondsToSelector()) {
    [v11 iconViewShortcutsPresentationWillFinish:self];
  }
  [(SBIconView *)self _invalidateHomeButtonPressConsumingAssertion];
  recentsDocumentExtensionProvider = self->_recentsDocumentExtensionProvider;
  self->_recentsDocumentExtensionProvider = 0;

  __int16 v13 = [v5 contextMenuNotificationUserInfo];
  id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 postNotificationName:@"SBIconViewWillDismissContextMenuNotification" object:self userInfo:v13];

  if (objc_opt_respondsToSelector()) {
    [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController setShowingContextMenu:0];
  }
}

- (void)_contextMenuConfigurationDidDismiss:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 identifier];
  id v6 = SBLogIconContextMenu();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 identifier];
    *(_DWORD *)buf = 136315906;
    uint64_t v32 = "-[SBIconView _contextMenuConfigurationDidDismiss:]";
    __int16 v33 = 1024;
    int v34 = 3077;
    __int16 v35 = 2112;
    uint64_t v36 = v7;
    __int16 v37 = 2112;
    id v38 = v4;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d %@ (%@)", buf, 0x26u);
  }
  id v8 = [(SBIconView *)self shortcutsDelegate];
  if (objc_opt_respondsToSelector()) {
    [v8 iconViewShortcutsPresentationDidFinish:self];
  }
  int v9 = [v5 contextMenuNotificationUserInfo];
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"SBIconViewDidDismissContextMenuNotification" object:self userInfo:v9];

  [(NSHashTable *)self->_contextMenuInteractionConfigurations removeObject:v4];
  [(NSHashTable *)self->_dismissingContextMenuInteractionConfigurations removeObject:v4];
  [(SBIconView *)self _toggleContentContainerViewIfNecessary];
  [(SBIconView *)self _updateAllComponentAlphas];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __50__SBIconView__contextMenuConfigurationDidDismiss___block_invoke;
  v29[3] = &unk_1E6AAC810;
  v29[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v29 animations:0.2];
  if (![(NSHashTable *)self->_contextMenuInteractionConfigurations count])
  {
    __int16 v11 = SBLogIconContextMenu();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [v5 identifier];
      *(_DWORD *)buf = 136315906;
      uint64_t v32 = "-[SBIconView _contextMenuConfigurationDidDismiss:]";
      __int16 v33 = 1024;
      int v34 = 3099;
      __int16 v35 = 2112;
      uint64_t v36 = v12;
      __int16 v37 = 2112;
      id v38 = v4;
      _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "%s:%d %@ (%@) -- Flushing any performAfterContextMenuBlocks; resetting state.",
        buf,
        0x26u);
    }
    uint64_t v13 = [(NSMutableArray *)self->_performAfterContextMenuBlocks copy];
    id v14 = (void *)v13;
    int v15 = (void *)MEMORY[0x1E4F1CBF0];
    if (v13) {
      int v15 = (void *)v13;
    }
    id v16 = v15;

    performAfterContextMenuBlocks = self->_performAfterContextMenuBlocks;
    self->_performAfterContextMenuBlocks = 0;

    contextMenuInteractionConfigurations = self->_contextMenuInteractionConfigurations;
    self->_contextMenuInteractionConfigurations = 0;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = v16;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v25 + 1) + 8 * v23) + 16))(*(void *)(*((void *)&v25 + 1) + 8 * v23));
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v21);
    }

    if (self->_iconContextMenuActivity)
    {
      os_activity_scope_leave(&self->_iconContextMenuActivityState);
      iconContextMenuActivitdouble y = self->_iconContextMenuActivity;
      self->_iconContextMenuActivitdouble y = 0;
    }
  }
}

uint64_t __50__SBIconView__contextMenuConfigurationDidDismiss___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateIconContentScale];
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  [v6 setPreferredCommitStyle:0];
  if ([(id)objc_opt_class() supportsTapGesture])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __95__SBIconView_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v7[3] = &unk_1E6AAC810;
    void v7[4] = self;
    [v6 addCompletion:v7];
  }
}

uint64_t __95__SBIconView_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTap];
}

- (NSURL)applicationBundleURLForShortcuts
{
  id v3 = [(SBIconView *)self icon];
  id v4 = [(SBIconView *)self shortcutsDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v4 applicationBundleURLForShortcutsWithIconView:self],
        (BOOL v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v3 isApplicationIcon] && (objc_msgSend(v3, "isTimedOut") & 1) == 0)
    {
      id v6 = [v3 application];
      BOOL v5 = [v6 bundleURL];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return (NSURL *)v5;
}

- (NSString)applicationBundleIdentifierForShortcuts
{
  id v3 = [(SBIconView *)self applicationBundleURLForShortcuts];

  if (v3)
  {
    id v4 = [(SBIconView *)self icon];
    BOOL v5 = [v4 applicationBundleID];
  }
  else
  {
    BOOL v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)shouldActivateApplicationShortcutItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SBIconView *)self shortcutsDelegate];
  if (objc_opt_respondsToSelector()) {
    char v8 = [v7 iconView:self shouldActivateApplicationShortcutItem:v6 atIndex:a4];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (NSArray)effectiveApplicationShortcutItems
{
  id v3 = [(SBIconView *)self shortcutsDelegate];
  id v4 = [(SBIconView *)self applicationShortcutItems];
  if (!v4)
  {
    id v4 = [(SBIconView *)self fetchedApplicationShortcutItems];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v3 iconView:self applicationShortcutItemsWithProposedItems:v4];

    id v4 = (void *)v5;
  }

  return (NSArray *)v4;
}

+ (id)applicationShortcutService
{
  if (applicationShortcutService_onceToken != -1) {
    dispatch_once(&applicationShortcutService_onceToken, &__block_literal_global_356);
  }
  uint64_t v2 = (void *)applicationShortcutService__applicationShortcutService;
  return v2;
}

void __40__SBIconView_applicationShortcutService__block_invoke()
{
  if ((__sb__runningInSpringBoard() & 1) == 0)
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4FA69D8]);
    id v1 = (void *)applicationShortcutService__applicationShortcutService;
    applicationShortcutService__applicationShortcutService = (uint64_t)v0;
  }
}

void __57__SBIconView__fetchApplicationShortcutItemsIfAppropriate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  BSDispatchMain();
}

void __57__SBIconView__fetchApplicationShortcutItemsIfAppropriate__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) icon];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 48) composedApplicationShortcutItems];
    [v4 setFetchedApplicationShortcutItems:v5];
  }
}

- (id)_multitaskingAppShortcutService
{
  if (_multitaskingAppShortcutService_onceToken != -1) {
    dispatch_once(&_multitaskingAppShortcutService_onceToken, &__block_literal_global_362);
  }
  uint64_t v2 = (void *)_multitaskingAppShortcutService_service;
  return v2;
}

void __45__SBIconView__multitaskingAppShortcutService__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FA6B48]);
  id v1 = (void *)_multitaskingAppShortcutService_service;
  _multitaskingAppShortcutService_service = (uint64_t)v0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2 || __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts != 1) {
      goto LABEL_20;
    }
    goto LABEL_7;
  }
  id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v7 userInterfaceIdiom] != 1)
  {
LABEL_19:

    goto LABEL_20;
  }
  char v8 = __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts;

  if (v8)
  {
LABEL_7:
    id v7 = [(SBIconView *)self icon];
    if ((__sb__runningInSpringBoard() & 1) != 0
      || ![v7 isApplicationIcon]
      || ([(SBIconView *)self _multitaskingAppShortcutService],
          int v9 = objc_claimAutoreleasedReturnValue(),
          [v7 applicationBundleID],
          id v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = SBHMultitaskingApplicationSupportedShortcutActionMaskFromSBSMask([v9 supportedShortcutActionsForBundleIdentifier:v10]),
          v10,
          v9,
          !v11))
    {
      int v12 = [(SBIconView *)self shortcutsDelegate];
      if (objc_opt_respondsToSelector()) {
        uint64_t v11 = [v12 supportedMultitaskingShortcutActionsForIconView:self];
      }
      else {
        uint64_t v11 = 0;
      }
    }
    if (sel__handleMakeFullscreenKeyShortcut_ == a3)
    {
      uint64_t v14 = 1;
    }
    else if (sel__handleMakeSplitLeftKeyShortcut_ == a3)
    {
      uint64_t v14 = 2;
    }
    else if (sel__handleMakeSplitRightKeyShortcut_ == a3)
    {
      uint64_t v14 = 4;
    }
    else if (sel__handleActivateAppExposeKeyShortcut_ == a3)
    {
      uint64_t v14 = 8;
    }
    else
    {
      if (sel__handleAddWindowToSetCommand_ != a3) {
        goto LABEL_19;
      }
      uint64_t v14 = 16;
    }
    unsigned __int8 v13 = (v11 & v14) != 0;

    goto LABEL_27;
  }
LABEL_20:
  v16.receiver = self;
  v16.super_class = (Class)SBIconView;
  unsigned __int8 v13 = [(SBIconView *)&v16 canPerformAction:a3 withSender:v6];
LABEL_27:

  return v13;
}

- (void)_handleMakeFullscreenKeyShortcut:(id)a3
{
  id v6 = [(SBIconView *)self icon];
  if ([v6 isApplicationIcon])
  {
    id v4 = [(SBIconView *)self _multitaskingAppShortcutService];
    id v5 = [v6 applicationBundleID];
    [v4 performMultitaskingShortcutAction:0 forBundleIdentifier:v5];
  }
}

- (void)_handleMakeSplitLeftKeyShortcut:(id)a3
{
  id v6 = [(SBIconView *)self icon];
  if ([v6 isApplicationIcon])
  {
    id v4 = [(SBIconView *)self _multitaskingAppShortcutService];
    id v5 = [v6 applicationBundleID];
    [v4 performMultitaskingShortcutAction:1 forBundleIdentifier:v5];
  }
}

- (void)_handleMakeSplitRightKeyShortcut:(id)a3
{
  id v6 = [(SBIconView *)self icon];
  if ([v6 isApplicationIcon])
  {
    id v4 = [(SBIconView *)self _multitaskingAppShortcutService];
    id v5 = [v6 applicationBundleID];
    [v4 performMultitaskingShortcutAction:2 forBundleIdentifier:v5];
  }
}

- (void)_handleActivateAppExposeKeyShortcut:(id)a3
{
  id v6 = [(SBIconView *)self icon];
  if ([v6 isApplicationIcon])
  {
    id v4 = [(SBIconView *)self _multitaskingAppShortcutService];
    id v5 = [v6 applicationBundleID];
    [v4 performMultitaskingShortcutAction:3 forBundleIdentifier:v5];
  }
}

- (void)_handleAddWindowToSetCommand:(id)a3
{
  id v6 = [(SBIconView *)self icon];
  if ([v6 isApplicationIcon])
  {
    id v4 = [(SBIconView *)self _multitaskingAppShortcutService];
    id v5 = [v6 applicationBundleID];
    [v4 performMultitaskingShortcutAction:4 forBundleIdentifier:v5];
  }
}

+ (double)labelAccessoryViewBaseRightMargin
{
  return 2.0;
}

+ (double)labelAccessoryViewAdditionalRightMarginForType:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5) {
    BOOL v6 = UIContentSizeCategoryCompareToCategory(v5, (UIContentSizeCategory)*MEMORY[0x1E4FB27D0]) != NSOrderedDescending;
  }
  else {
    BOOL v6 = 1;
  }
  double v7 = 0.0;
  if ((unint64_t)(a3 - 1) <= 1)
  {
    uint64_t v8 = __sb__runningInSpringBoard();
    if (v8)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        int v9 = 0;
        int v10 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      a3 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([(id)a3 userInterfaceIdiom])
      {
        int v10 = 0;
        int v9 = 1;
        goto LABEL_16;
      }
    }
    int v9 = v8 ^ 1;
    int v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [(id)v8 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v12 >= *(double *)(MEMORY[0x1E4FA6E50] + 40))
    {
      BOOL v13 = 1;
      if ((v11 & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_18;
    }
    int v10 = v11 ^ 1;
LABEL_16:
    if (__sb__runningInSpringBoard())
    {
      BOOL v13 = SBFEffectiveDeviceClass() == 2;
      if (!v10) {
        goto LABEL_18;
      }
LABEL_23:

      if (v9)
      {
LABEL_19:

        if (!v13)
        {
LABEL_20:
          uint64_t v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
          [v14 scale];
          double v16 = v15;

          if (v16 > 1.0) {
            goto LABEL_29;
          }
          BOOL v17 = !v6;
          double v18 = 2.0;
          goto LABEL_26;
        }
LABEL_25:
        BOOL v17 = !v6;
        double v18 = 2.5;
LABEL_26:
        if (v17) {
          double v7 = 0.0;
        }
        else {
          double v7 = v18;
        }
        goto LABEL_29;
      }
LABEL_24:
      if (!v13) {
        goto LABEL_20;
      }
      goto LABEL_25;
    }
    id v19 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v13 = [v19 userInterfaceIdiom] == 1;

    if (v10) {
      goto LABEL_23;
    }
LABEL_18:
    if (v9) {
      goto LABEL_19;
    }
    goto LABEL_24;
  }
LABEL_29:

  return v7;
}

- (double)labelAccessoryTotalWidth
{
  [(SBIconLabelAccessoryView *)self->_labelAccessoryView intrinsicContentSize];
  double v3 = v2;
  [(id)objc_opt_class() labelAccessoryViewBaseRightMargin];
  return v3 + v4;
}

+ (Class)defaultViewClassForLabelAccessoryType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
  {
    double v4 = 0;
  }
  else
  {
    double v4 = objc_opt_class();
  }
  return (Class)v4;
}

- (double)_labelVerticalOffset
{
  return -1.5;
}

- (CGRect)_frameForVisibleImage
{
  double x = self->_visibleImageRect.origin.x;
  double y = self->_visibleImageRect.origin.y;
  double width = self->_visibleImageRect.size.width;
  double height = self->_visibleImageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_frameForLabelAccessory
{
  uint64_t v3 = [(SBIconLabelView *)self->_labelView image];
  double v4 = [(SBIconLabelView *)self->_labelView imageParameters];
  [(SBIconView *)self _frameForLabel];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SBIconView *)self _frameForImageView];
  -[SBIconView _frameForLabelAccessoryViewWithLabelFrame:labelImage:labelImageParameters:imageFrame:](self, "_frameForLabelAccessoryViewWithLabelFrame:labelImage:labelImageParameters:imageFrame:", v3, v4, v6, v8, v10, v12, v13, v14, v15, v16);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CGRect)_frameForLabelHighlight
{
  uint64_t v3 = [(SBIconView *)self _labelImage];
  double v4 = [v3 parameters];
  [(SBIconView *)self _frameForLabel];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 textInsets];
  double v14 = SBHEdgeInsetsInvert(v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [v3 alignmentRectInsets];
  double v25 = v16 + v6 + v21;
  double v26 = v14 + v8 + v22;
  double v27 = v10 - (v21 + v23) - (v16 + v20);
  double v28 = v12 - (v22 + v24) - (v14 + v18);

  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (CGRect)_frameForLabelAccessoryViewWithLabelFrame:(CGRect)a3 labelImage:(id)a4 labelImageParameters:(id)a5 imageFrame:(CGRect)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v12 = a5;
  id v13 = a4;
  int v14 = [v13 hasBaseline];
  [v13 baselineOffsetFromBottom];
  [v13 alignmentRectInsets];
  double v16 = v15;
  double v18 = v17;
  double v48 = v20;
  double v49 = v19;

  [v12 maxSize];
  double v22 = v21;

  double v52 = x;
  CGFloat v53 = width;
  if (v22 > 0.0)
  {
    v56.origin.CGFloat x = x;
    v56.origin.double y = y;
    v56.size.double width = width;
    v56.size.double height = height;
    CGRectGetWidth(v56);
  }
  double v23 = 0.0;
  labelAccessoryView = self->_labelAccessoryView;
  [(SBIconView *)self bounds];
  -[SBIconLabelAccessoryView sizeThatFits:](labelAccessoryView, "sizeThatFits:", v25, v26);
  double v55 = v27;
  double v54 = v28;
  [(id)objc_opt_class() labelAccessoryViewBaseRightMargin];
  [(id)objc_opt_class() labelAccessoryViewAdditionalRightMarginForType:self->_displayedLabelAccessoryType];
  BOOL v29 = [(SBIconLabelAccessoryView *)self->_labelAccessoryView hasBaseline];
  if (v29)
  {
    [(SBIconLabelAccessoryView *)self->_labelAccessoryView baselineOffsetFromBottom];
    double v23 = v30;
  }
  double v31 = [(SBIconView *)self traitCollection];
  [v31 displayScale];

  if ((*((unsigned char *)self + 547) & 2) != 0)
  {
    [(SBIconView *)self bounds];
    CGRectGetMidX(v57);
    double v37 = v55;
    UICeilToScale();
    double v39 = v38;
    [(SBIconView *)self _labelBaselineOffsetFromImage];
    CGRectGetMaxY(a6);
    double v40 = v54;
    UICeilToScale();
  }
  else
  {
    double v51 = y;
    uint64_t v32 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
    double v33 = v52 + v18;
    double v34 = y + v16;
    double v35 = width - (v18 + v48);
    double v36 = height - (v16 + v49);
    if (v32 == 1) {
      CGRectGetMaxX(*(CGRect *)&v33);
    }
    else {
      CGRectGetMinX(*(CGRect *)&v33);
    }
    double v37 = v55;
    UIFloorToScale();
    double v39 = v42;
    double v40 = v54;
    if ((v14 & v29) != 1)
    {
      UIFloorToScale();
      double v43 = v51 + v44;
      goto LABEL_14;
    }
    SBHAlignSizeInRectUsingBaseline(v55, v54, v23, v52, v51, v53, height);
    UIFloorToScale();
  }
  double v43 = v41;
LABEL_14:
  double v45 = v39;
  double v46 = v37;
  double v47 = v40;
  result.size.double height = v47;
  result.size.double width = v46;
  result.origin.double y = v43;
  result.origin.CGFloat x = v45;
  return result;
}

- (CGPoint)_centerForCloseBox
{
  if (self->_closeBox)
  {
    uint64_t v3 = [(SBIconView *)self currentImageView];
    customIconImageViewController = self->_customIconImageViewController;
    if (!customIconImageViewController) {
      customIconImageViewController = self->_iconImageView;
    }
    id v5 = customIconImageViewController;
    [v5 visibleBounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    int v14 = [(SBIconView *)self contentContainerView];
    objc_msgSend(v14, "convertRect:fromView:", v3, v7, v9, v11, v13);
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    [(SBIconView *)self iconImageInfo];
    double v24 = v23 + (v23 + 2.66666667) * -0.707106781;
    uint64_t v25 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];

    CGFloat v26 = v16;
    CGFloat v27 = v18;
    CGFloat v28 = v20;
    CGFloat v29 = v22;
    if (v25 == 1) {
      double v30 = CGRectGetMaxX(*(CGRect *)&v26) - v24;
    }
    else {
      double v30 = v24 + CGRectGetMinX(*(CGRect *)&v26);
    }
    v35.origin.CGFloat x = v16;
    v35.origin.double y = v18;
    v35.size.double width = v20;
    v35.size.double height = v22;
    double v31 = v24 + CGRectGetMinY(v35);
  }
  else
  {
    double v30 = *MEMORY[0x1E4F1DAD8];
    double v31 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v32 = v30;
  double v33 = v31;
  result.double y = v33;
  result.CGFloat x = v32;
  return result;
}

- (unint64_t)userVisibilityStatus
{
  return ((unint64_t)*((unsigned __int8 *)self + 551) >> 1) & 3;
}

+ (double)defaultMaxLabelWidthDeltaForContentSizeCategory:(id)a3
{
  id v5 = (NSString *)a3;
  double v6 = v5;
  if (v5 && UIContentSizeCategoryIsAccessibilityCategory(v5))
  {
    int v7 = __sb__runningInSpringBoard();
    char v8 = v7;
    if (v7)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        double v9 = 27.5;
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v3 userInterfaceIdiom])
      {
        double v9 = 27.5;
        goto LABEL_23;
      }
    }
    int v16 = __sb__runningInSpringBoard();
    char v17 = v16;
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v4 _referenceBounds];
    }
    BSSizeRoundForScale();
    double v18 = 5.0;
    if (v19 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
      double v18 = 10.0;
    }
    double v9 = v18 * 2.1 + 17.0;
    if (v17) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  int v10 = __sb__runningInSpringBoard();
  char v8 = v10;
  if (!v10)
  {
    uint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    double v9 = 27.0;
    if ([v3 userInterfaceIdiom]) {
      goto LABEL_23;
    }
LABEL_15:
    int v11 = __sb__runningInSpringBoard();
    char v12 = v11;
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v4 _referenceBounds];
    }
    BSSizeRoundForScale();
    double v13 = 5.0;
    if (v14 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
      double v13 = 10.0;
    }
    double v9 = v13 * 2.0 + 17.0;
    if (v12)
    {
LABEL_22:
      if (v8) {
        goto LABEL_24;
      }
LABEL_23:

      goto LABEL_24;
    }
LABEL_21:

    goto LABEL_22;
  }
  if (!SBFEffectiveDeviceClass()) {
    goto LABEL_15;
  }
  double v9 = 27.0;
  if (SBFEffectiveDeviceClass() == 1) {
    goto LABEL_15;
  }
LABEL_24:

  return v9;
}

+ (double)defaultMaxLabelHeight
{
  if (__sb__runningInSpringBoard())
  {
    BOOL v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v2 = [v3 userInterfaceIdiom] == 1;
  }
  double result = 26.0;
  if (v2) {
    return 29.0;
  }
  return result;
}

+ (CGSize)maxLabelSizeForIconImageSize:(CGSize)a3
{
  double width = a3.width;
  id v5 = objc_msgSend((id)*MEMORY[0x1E4FB2608], "preferredContentSizeCategory", a3.width, a3.height);
  [a1 defaultMaxLabelWidthDeltaForContentSizeCategory:v5];
  double v7 = width + v6;
  [a1 defaultMaxLabelHeight];
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

+ (CGSize)maxLabelSizeForIconImageSize:(CGSize)a3 contentSizeCategory:(id)a4 options:(unint64_t)a5
{
  double width = a3.width;
  objc_msgSend(a1, "defaultMaxLabelWidthDeltaForContentSizeCategory:", a4, a5, a3.width, a3.height);
  double v8 = width + v7;
  [a1 defaultMaxLabelHeight];
  double v10 = v9;
  double v11 = v8;
  result.double height = v10;
  result.double width = v11;
  return result;
}

+ (CGSize)maxLabelSizeForListLayout:(id)a3 contentSizeCategory:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  [v9 iconImageInfo];
  objc_msgSend(a1, "maxLabelSizeForListLayout:iconImageSize:contentSizeCategory:options:", v9, v8, a5);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (SBIconLabelView)labelView
{
  return self->_labelView;
}

- (id)displayedLabelFont
{
  BOOL v2 = [(SBIconLabelView *)self->_labelView imageParameters];
  uint64_t v3 = [v2 font];

  return v3;
}

void __35__SBIconView__updateLabelAnimated___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13 = a2;
  id v14 = a3;
  double v15 = v14;
  if (v14 != v13)
  {
    if (v14)
    {
      objc_msgSend(v14, "setFrame:", a4, a5, a6, a7);
      [v15 setAlpha:*(double *)(a1 + 32)];
      [v15 scaleAndBlurForDuration:1 initiallyHidden:0 visibleAlpha:0.3 completion:*(double *)(a1 + 32)];
    }
    else if (v13)
    {
      double v16 = *(double *)(a1 + 32);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __35__SBIconView__updateLabelAnimated___block_invoke_2;
      v17[3] = &unk_1E6AAC810;
      id v18 = v13;
      [v18 scaleAndBlurForDuration:0 initiallyHidden:v17 visibleAlpha:0.3 completion:v16];
    }
  }
}

uint64_t __35__SBIconView__updateLabelAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setLabelStyle:(int64_t)a3
{
  char v3 = *((unsigned char *)self + 550);
  if ((uint64_t)(char)(2 * v3) >> 6 != a3)
  {
    *((unsigned char *)self + 550) = v3 & 0x9F | (32 * (a3 & 3));
    [(SBIconView *)self _toggleGroupBlendingIfNecessary];
    [(SBIconView *)self _updateLabel];
  }
}

- (double)lastLineBaseline
{
  char v3 = [(SBIconLabelView *)self->_labelView image];
  [(SBIconView *)self _frameForLabel];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 baselineOffsetFromBottom];
  double v13 = v12;
  v16.origin.CGFloat x = v5;
  v16.origin.double y = v7;
  v16.size.double width = v9;
  v16.size.double height = v11;
  double v14 = CGRectGetMaxY(v16) - v13;

  return v14;
}

- (double)baselineOffsetFromBottom
{
  [(SBIconView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SBIconView *)self lastLineBaseline];
  double v12 = v11;
  v14.origin.CGFloat x = v4;
  v14.origin.double y = v6;
  v14.size.double width = v8;
  v14.size.double height = v10;
  return CGRectGetMaxY(v14) - v12;
}

- (void)setIconLabelViewFactory:(id)a3
{
  double v5 = (SBIconLabelViewFactory *)a3;
  if (self->_iconLabelViewFactory != v5)
  {
    CGFloat v6 = v5;
    objc_storeStrong((id *)&self->_iconLabelViewFactory, a3);
    [(SBIconView *)self _updateLabel];
    double v5 = v6;
  }
}

- (id)_legibilitySettingsWithPrimaryColor:(id)a3
{
  CGFloat v4 = (objc_class *)MEMORY[0x1E4FB21E0];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(_UILegibilitySettings *)self->_legibilitySettings style];
  CGFloat v8 = [(_UILegibilitySettings *)self->_legibilitySettings secondaryColor];
  double v9 = [(_UILegibilitySettings *)self->_legibilitySettings shadowColor];
  CGFloat v10 = (void *)[v6 initWithStyle:v7 primaryColor:v5 secondaryColor:v8 shadowColor:v9];

  return v10;
}

- (id)_legibilitySettingsWithStyle:(int64_t)a3 primaryColor:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4FB21E0];
  id v7 = a4;
  id v8 = [v6 alloc];
  double v9 = [(_UILegibilitySettings *)self->_legibilitySettings secondaryColor];
  CGFloat v10 = [(_UILegibilitySettings *)self->_legibilitySettings shadowColor];
  double v11 = (void *)[v8 initWithStyle:a3 primaryColor:v7 secondaryColor:v9 shadowColor:v10];

  return v11;
}

- (UIView)labelAccessoryView
{
  return (UIView *)self->_labelAccessoryView;
}

- (void)setOverrideCustomIconImageViewController:(id)a3
{
  id v5 = (SBIconViewCustomImageViewControlling *)a3;
  if (self->_overrideCustomIconImageViewController != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_overrideCustomIconImageViewController, a3);
    [(SBIconView *)self _updateIconImageViewAnimated:0];
    id v5 = v6;
  }
}

- (BOOL)shouldAnimateFrameOfIconImageView
{
  BOOL v3 = [(SBIconView *)self shouldUpdateFrameOfIconImageView];
  if (v3) {
    LOBYTE(v3) = self->_customIconImageViewController == 0;
  }
  return v3;
}

- (id)borrowIconImageView
{
  return [(SBIconView *)self borrowIconImageViewWithOptions:0];
}

- (id)borrowIconImageViewWithOptions:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v6 forKey:@"options"];

  id v7 = [(SBIconView *)self customIconImageViewController];
  if (v7)
  {
    [v5 setObject:v7 forKey:@"viewController"];
    id v8 = [v7 parentViewController];
    if (v8) {
      [v5 setObject:v8 forKey:@"parentViewController"];
    }
  }
  double v9 = [[SBIconViewAssertion alloc] initWithAssertionType:2 iconView:self extraInfo:v5];
  [(SBIconView *)self setBorrowedIconImageViewAssertion:v9];

  return v9;
}

- (void)removeBorrowedIconImageViewAssertion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBIconView *)self borrowedIconImageViewAssertion];

  if (v5 == v4)
  {
    [(SBIconView *)self setBorrowedIconImageViewAssertion:0];
    id v6 = [v4 extraInfo];
    id v7 = [(SBIconView *)self customIconImageViewController];
    id v8 = [(SBIconView *)self currentImageView];
    if (([v8 isDescendantOfView:self] & 1) == 0)
    {
      [v8 removeFromSuperview];
      if (v7)
      {
        double v9 = [v6 objectForKeyedSubscript:@"parentViewController"];
        [v7 parentViewController];
      }
      [(SBIconView *)self _insertIconImageView:v8];
    }
    [(SBIconView *)self _updateIconImageViewAnimated:0];
    if (v7) {
      [(SBIconView *)self configureCustomIconImageViewController:v7];
    }
    [(SBIconView *)self _updateAllComponentAlphas];
    [(SBIconView *)self _updateBrightness];
    [(SBIconView *)self _updateJitter:1];
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v26[0] = *MEMORY[0x1E4F1DAB8];
    v26[1] = v10;
    v26[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v21 = v8;
    [v8 setTransform:v26];
    [(SBIconView *)self setNeedsLayout];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v11 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
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
          CGRect v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v16 iconView:self didChangeCustomImageViewController:0];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v13);
    }

    uint64_t v17 = [v6 objectForKey:@"viewController"];
    id v18 = (void *)v17;
    if (v17)
    {
      if ((void *)v17 != v7)
      {
        double v19 = [(SBIconView *)self customIconImageViewController];

        if (v18 != v19)
        {
          CGFloat v20 = objc_msgSend(v18, "sbh_removeOwningIconView:", self);
          if (!v20) {
            [(SBIconView *)self _notifyObserversDidDiscardCustomImageViewController:v18];
          }
        }
      }
    }
  }
}

- (void)stealIconImageView
{
  [(SBIconImageView *)self->_iconImageView removeFromSuperview];
  iconImageView = self->_iconImageView;
  self->_iconImageView = 0;

  [(SBIconView *)self _updateIconImageViewAnimated:0];
}

- (id)disableImageUpdatesForReason:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController disableImageUpdatesForReason:v4];
  }
  else
  {
    id v6 = [(SBIconView *)self _iconImageView];
    id v5 = [v6 disableImageUpdatesForReason:v4];
  }
  return v5;
}

- (int64_t)_widgetBackgroundMaterialForDataSource:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 19;
  }
  id v6 = objc_opt_class();
  return [v6 defaultWidgetBackgroundRecipe];
}

void __61__SBIconView_setCustomIconImageViewController_clearingOwner___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) configureCustomIconImageViewController:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 40) view];
  [*(id *)(a1 + 32) _insertIconImageView:v2];
  [*(id *)(a1 + 32) _updateAllComponentAlphas];
}

- (void)configureCustomIconImageViewController:(id)a3
{
  id v4 = a3;
  [(SBIconView *)self setCurrentImageStyleAsOverridesOnCustomIconImageViewController:v4];
  id v5 = (void *)*MEMORY[0x1E4FB2608];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__SBIconView_configureCustomIconImageViewController___block_invoke;
  _OWORD v15[3] = &unk_1E6AACA90;
  v15[4] = self;
  id v6 = v4;
  id v16 = v6;
  [v5 _performBlockAfterCATransactionCommits:v15];
  id v7 = [v6 view];
  [(SBIconView *)self _frameForImageView];
  objc_msgSend(v7, "setFrame:");
  [(SBIconView *)self _updateCustomIconImageViewControllerHitTesting];
  [(SBIconView *)self iconImageInfo];
  objc_msgSend(v6, "setIconImageInfo:");
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "setEditing:", -[SBIconView isEditing](self, "isEditing"));
  }
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__SBIconView_configureCustomIconImageViewController___block_invoke_2;
    v12[3] = &unk_1E6AB2F80;
    objc_copyWeak(&v13, &location);
    [v6 setBackgroundViewProvider:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__SBIconView_configureCustomIconImageViewController___block_invoke_3;
    v10[3] = &unk_1E6AB2FA8;
    objc_copyWeak(&v11, &location);
    [v6 setBackgroundViewConfigurator:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "setUserInteractionEnabled:", -[SBIconView isUserInteractionEnabled](self, "isUserInteractionEnabled"));
  }
  if (objc_opt_respondsToSelector()) {
    [v6 setPauseReasons:((unint64_t)*((unsigned __int16 *)self + 272) >> 4) & 0x1F];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 setLegibilitySettings:self->_legibilitySettings];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 addCustomImageViewControllerObserver:self];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 setUserVisibilityStatus:((unint64_t)*((unsigned __int8 *)self + 551) >> 1) & 3];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(SBIconView *)self approximateLayoutPosition];
    objc_msgSend(v6, "setApproximateLayoutPosition:", v8, v9);
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "setContentVisibility:", -[SBIconView contentVisibility](self, "contentVisibility"));
  }
}

uint64_t __53__SBIconView_configureCustomIconImageViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetOverridesOnCustomIconImageViewController:*(void *)(a1 + 40)];
}

id __53__SBIconView_configureCustomIconImageViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)[WeakRetained newComponentBackgroundViewOfType:4];

  return v2;
}

void __53__SBIconView_configureCustomIconImageViewController___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v14 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v14;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v11 = [WeakRetained _widgetBackgroundMaterialForDataSource:v6];

    if (v11 != [v9 recipe]) {
      [v9 setRecipe:v11];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v9 groupNameBase];
      id v13 = [v12 stringByAppendingString:@"-AppPrediction"];

      [v9 setGroupNameBase:v13];
      [v9 setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:1];
    }
  }
}

- (void)setOverrideImageAppearance:(id)a3 onCustomIconImageViewController:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (objc_opt_respondsToSelector())
  {
    [v5 setOverrideIconImageAppearance:v8];
  }
  else
  {
    id v6 = [v5 traitOverrides];
    uint64_t v7 = self;
    if (v8) {
      [v6 setObject:v8 forTrait:v7];
    }
    else {
      [v6 removeTrait:v7];
    }
  }
}

- (void)setOverrideImageStyleConfiguration:(id)a3 onCustomIconImageViewController:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (objc_opt_respondsToSelector())
  {
    [v5 setOverrideIconImageStyleConfiguration:v8];
  }
  else
  {
    id v6 = [v5 traitOverrides];
    uint64_t v7 = self;
    if (v8) {
      [v6 setObject:v8 forTrait:v7];
    }
    else {
      [v6 removeTrait:v7];
    }
  }
}

- (void)setCurrentImageStyleAsOverridesOnCustomIconImageViewController:(id)a3
{
  id v6 = a3;
  id v4 = [(SBIconView *)self effectiveIconImageStyleConfiguration];
  if (v4 && ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0))
  {
    [(SBIconView *)self setOverrideImageStyleConfiguration:v4 onCustomIconImageViewController:v6];
  }
  else
  {
    id v5 = [(SBIconView *)self effectiveIconImageAppearance];
    [(SBIconView *)self setOverrideImageAppearance:v5 onCustomIconImageViewController:v6];
  }
}

- (void)resetOverridesOnCustomIconImageViewController:(id)a3
{
  id v11 = a3;
  id v4 = [(SBIconView *)self overrideIconImageStyleConfiguration];
  id v5 = [(SBIconView *)self overrideIconImageAppearance];
  if (v5)
  {

    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (objc_opt_respondsToSelector())
      {
        [v11 setOverrideIconImageAppearance:v5];
        id v4 = 0;
        goto LABEL_13;
      }
      id v4 = 0;
      goto LABEL_17;
    }
    id v4 = 0;
    goto LABEL_5;
  }
  if (objc_opt_respondsToSelector())
  {
LABEL_5:
    [v11 setOverrideIconImageStyleConfiguration:v4];
    char v6 = 0;
    goto LABEL_6;
  }
  if (v4)
  {
    id v9 = [v11 traitOverrides];
    long long v10 = self;
    [v9 setObject:v4 forTrait:v10];

    char v6 = 1;
  }
  else
  {
    char v6 = 0;
  }
LABEL_6:
  if (objc_opt_respondsToSelector())
  {
    [v11 setOverrideIconImageAppearance:v5];
    goto LABEL_9;
  }
  if (v5)
  {
LABEL_17:
    uint64_t v7 = [v11 traitOverrides];
    id v8 = self;
    [v7 setObject:v5 forTrait:v8];
    goto LABEL_18;
  }
LABEL_9:
  if ((v6 & 1) == 0)
  {
LABEL_13:
    uint64_t v7 = [v11 traitOverrides];
    id v8 = self;
    [v7 removeTrait:v8];
LABEL_18:
  }
}

uint64_t __43__SBIconView__updateAccessoryViewAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

uint64_t __43__SBIconView__updateAccessoryViewAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _destroyAccessoryView:*(void *)(a1 + 40)];
}

- (id)effectiveAccessoryIconImageAppearance
{
  id v3 = [(SBIconView *)self overrideAccessoryIconImageAppearance];
  if (!v3)
  {
    id v3 = [(SBIconView *)self effectiveIconImageAppearance];
  }
  return v3;
}

- (CGSize)accessorySize
{
  id v2 = [(SBIconView *)self listLayout];
  double v3 = SBHIconListLayoutIconAccessorySize(v2);
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (id)badgeString
{
  double v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(SBIconAccessoryView *)self->_accessoryView text];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (void)_accessoryViewTapGestureChanged:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(SBIconView *)self actionDelegate];
    if (objc_opt_respondsToSelector()) {
      [v4 iconAccessoryViewTapped:self];
    }
  }
}

- (id)_automationID
{
  id v2 = [(SBIcon *)self->_icon automationID];
  double v3 = [@"BTN " stringByAppendingString:v2];

  return v3;
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SBIconView *)self bounds];
  CGRect v11 = CGRectInset(v10, -25.0, -25.0);
  CGFloat v6 = x;
  CGFloat v7 = y;
  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

uint64_t __23__SBIconView_setFrame___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __23__SBIconView_setFrame___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

- (void)_notifyObserversDidDiscardCustomImageViewController:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        CGRect v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 iconView:self didDiscardCustomImageViewController:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)tintColor
{
  return 0;
}

+ (CAFrameRateRange)_jitterAnimationFrameRateRange
{
  return CAFrameRateRangeMake(80.0, 120.0, 120.0);
}

+ (unsigned)_jitterAnimationHighFrameRateReason
{
  return 1114146;
}

+ (id)_jitterXTranslationAnimationWithStrength:(double)a3
{
  return (id)[a1 _jitterXTranslationAnimationWithAmount:a3 * 0.4];
}

+ (id)_jitterXTranslationAnimationWithAmount:(double)a3
{
  double v5 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.x"];
  [v5 setDuration:0.134];
  [v5 setBeginTime:(double)arc4random_uniform(0x64u) / 100.0];
  uint64_t v6 = [NSNumber numberWithDouble:a3];
  [v5 setFromValue:v6];

  uint64_t v7 = [NSNumber numberWithDouble:-a3];
  [v5 setToValue:v7];

  LODWORD(v8) = 1052266988;
  LODWORD(v9) = 1059145646;
  LODWORD(v10) = 1.0;
  long long v11 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v8 :0.0 :v9 :v10];
  [v5 setTimingFunction:v11];

  LODWORD(v12) = 2139095040;
  [v5 setRepeatCount:v12];
  [v5 setAutoreverses:1];
  [v5 setRemovedOnCompletion:0];
  [a1 _jitterAnimationFrameRateRange];
  objc_msgSend(v5, "setPreferredFrameRateRange:");
  objc_msgSend(v5, "setHighFrameRateReason:", objc_msgSend(a1, "_jitterAnimationHighFrameRateReason"));
  return v5;
}

+ (id)_jitterYTranslationAnimationWithStrength:(double)a3
{
  return (id)[a1 _jitterYTranslationAnimationWithAmount:a3 * 0.4];
}

+ (id)_jitterYTranslationAnimationWithAmount:(double)a3
{
  double v5 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.y"];
  [v5 setDuration:0.142];
  [v5 setBeginTime:(double)arc4random_uniform(0x64u) / 100.0];
  uint64_t v6 = [NSNumber numberWithDouble:a3];
  [v5 setFromValue:v6];

  uint64_t v7 = [NSNumber numberWithDouble:-a3];
  [v5 setToValue:v7];

  LODWORD(v8) = 1052266988;
  LODWORD(v9) = 1059145646;
  LODWORD(v10) = 1.0;
  long long v11 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v8 :0.0 :v9 :v10];
  [v5 setTimingFunction:v11];

  LODWORD(v12) = 2139095040;
  [v5 setRepeatCount:v12];
  [v5 setAutoreverses:1];
  [v5 setRemovedOnCompletion:0];
  [a1 _jitterAnimationFrameRateRange];
  objc_msgSend(v5, "setPreferredFrameRateRange:");
  objc_msgSend(v5, "setHighFrameRateReason:", objc_msgSend(a1, "_jitterAnimationHighFrameRateReason"));
  return v5;
}

+ (id)_jitterRotationAnimationWithStrength:(double)a3
{
  return (id)[a1 _jitterRotationAnimationWithAmount:a3 * 0.03];
}

+ (id)_jitterRotationAnimationWithAmount:(double)a3
{
  double v5 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation"];
  [v5 setDuration:0.128];
  [v5 setBeginTime:(double)arc4random_uniform(0x64u) / 100.0];
  uint64_t v6 = [NSNumber numberWithDouble:-a3];
  [v5 setFromValue:v6];

  uint64_t v7 = [NSNumber numberWithDouble:a3];
  [v5 setToValue:v7];

  LODWORD(v8) = 1052266988;
  LODWORD(v9) = 1059145646;
  LODWORD(v10) = 1.0;
  long long v11 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v8 :0.0 :v9 :v10];
  [v5 setTimingFunction:v11];

  LODWORD(v12) = 2139095040;
  [v5 setRepeatCount:v12];
  [v5 setAutoreverses:1];
  [v5 setRemovedOnCompletion:0];
  [a1 _jitterAnimationFrameRateRange];
  objc_msgSend(v5, "setPreferredFrameRateRange:");
  objc_msgSend(v5, "setHighFrameRateReason:", objc_msgSend(a1, "_jitterAnimationHighFrameRateReason"));
  return v5;
}

+ (id)_jitterRampDownAnimationWithAnimation:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4F39B48];
  id v4 = [a3 keyPath];
  double v5 = [v3 animationWithKeyPath:v4];

  [v5 setDuration:0.3];
  uint64_t v6 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  [v5 setTimingFunction:v6];

  [v5 setRemovedOnCompletion:1];
  [(id)objc_opt_class() _jitterAnimationFrameRateRange];
  objc_msgSend(v5, "setPreferredFrameRateRange:");
  objc_msgSend(v5, "setHighFrameRateReason:", objc_msgSend((id)objc_opt_class(), "_jitterAnimationHighFrameRateReason"));
  return v5;
}

- (void)_updateJitterAnimated:(BOOL)a3
{
}

- (void)_updateJitter:(BOOL)a3
{
}

- (void)_addJitterAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[SBHHomeScreenDomain rootSettings];
  uint64_t v6 = [v5 iconSettings];
  char v7 = [v6 suppressJitter];

  if ((v7 & 1) == 0)
  {
    *((unsigned char *)self + 546) |= 2u;
    if ([(SBIconView *)self suppressesDefaultEditingAnimation])
    {
      [(SBIconView *)self _removeDefaultJitterAnimationsAnimated:v3];
    }
    else
    {
      id v8 = [(SBIconView *)self _iconImageView];
      if (([(id)objc_opt_class() hasCustomJitter] & 1) == 0 && (*((unsigned char *)self + 546) & 4) == 0) {
        [(SBIconView *)self _addDefaultJitterAnimationsAnimated:v3];
      }
    }
  }
}

- (void)_removeJitterAnimated:(BOOL)a3
{
  *((unsigned char *)self + 546) &= ~2u;
  [(SBIconView *)self _removeDefaultJitterAnimationsAnimated:a3];
}

- (void)_addDefaultJitterAnimationsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  *((unsigned char *)self + 546) |= 4u;
  [(SBIconView *)self editingAnimationStrength];
  double v6 = v5;
  +[SBIconView _jitterXTranslationAnimationWithStrength:](SBIconView, "_jitterXTranslationAnimationWithStrength:");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [(SBIconView *)self _rampUpJitterAnimation:v13 animationKey:@"SBIconXTranslation" rampKey:@"SBIconXTranslationRamp" animated:v3];
  char v7 = +[SBIconView _jitterYTranslationAnimationWithStrength:v6];
  [(SBIconView *)self _rampUpJitterAnimation:v7 animationKey:@"SBIconYTranslation" rampKey:@"SBIconYTranslationRamp" animated:v3];
  id v8 = [(SBIconView *)self gridSizeClass];
  double v9 = [(SBIconView *)self listLayoutProvider];
  double v10 = [(SBIconView *)self location];
  long long v11 = [v9 layoutForIconLocation:v10];

  double v12 = +[SBIconView _jitterRotationAnimationWithStrength:v6 * SBHIconListLayoutEditingAnimationStrengthForGridSizeClass(v11, v8)];
  [(SBIconView *)self _rampUpJitterAnimation:v12 animationKey:@"SBIconRotation" rampKey:@"SBIconRotationRamp" animated:v3];
}

- (void)_removeDefaultJitterAnimationsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  *((unsigned char *)self + 546) &= ~4u;
  [(SBIconView *)self _rampDownJitterAnimationForKey:@"SBIconXTranslation" rampKey:@"SBIconXTranslationRamp" animated:a3];
  [(SBIconView *)self _rampDownJitterAnimationForKey:@"SBIconYTranslation" rampKey:@"SBIconYTranslationRamp" animated:v3];
  [(SBIconView *)self _rampDownJitterAnimationForKey:@"SBIconRotation" rampKey:@"SBIconRotationRamp" animated:v3];
}

- (void)_rampUpJitterAnimation:(id)a3 animationKey:(id)a4 rampKey:(id)a5 animated:(BOOL)a6
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(SBIconView *)self layer];
  [v10 addAnimation:v9 forKey:v8];
}

- (void)_rampDownJitterAnimationForKey:(id)a3 rampKey:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  id v8 = a4;
  id v9 = [(SBIconView *)self layer];
  id v10 = [v9 animationForKey:v12];
  if (v10)
  {
    if (v5)
    {
      long long v11 = +[SBIconView _jitterRampDownAnimationWithAnimation:v10];
      [v9 addAnimation:v11 forKey:v8];
    }
    [v9 removeAnimationForKey:v12];
  }
}

- (BOOL)suppressesDefaultEditingAnimation
{
  return (*((unsigned __int8 *)self + 546) >> 4) & 1;
}

- (BOOL)refusesRecipientStatus
{
  return (*((unsigned __int8 *)self + 545) >> 4) & 1;
}

- (void)setRefusesRecipientStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 545) = *((unsigned char *)self + 545) & 0xEF | v3;
}

- (BOOL)canReceiveGrabbedIcon:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBIconView *)self behaviorDelegate];
  if ((*((unsigned char *)self + 545) & 0x10) != 0
    || ([v4 isFolderIcon] & 1) != 0
    || ([v4 isWidgetStackIcon] & 1) != 0
    || v4 && ![v4 canBeReceivedByIcon]
    || ![(SBIcon *)self->_icon canReceiveGrabbedIcon])
  {
    goto LABEL_16;
  }
  if (v4)
  {
    icon = self->_icon;
    if (icon)
    {
      char v7 = [(SBIcon *)icon gridSizeClass];
      uint64_t v8 = [v4 gridSizeClass];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        id v9 = (void *)v8;
        id v10 = [(SBIcon *)self->_icon gridSizeClass];
        long long v11 = [v4 gridSizeClass];
        int v12 = [v10 isEqualToString:v11];

        if (!v12)
        {
LABEL_16:
          char v14 = 0;
          goto LABEL_17;
        }
      }
    }
  }
  if (v4)
  {
    id v13 = self->_icon;
    if (v13)
    {
      if ([(SBIcon *)v13 isEqual:v4]) {
        goto LABEL_16;
      }
    }
  }
  if (objc_opt_respondsToSelector()) {
    char v14 = [v5 icon:self canReceiveGrabbedIcon:v4];
  }
  else {
    char v14 = 1;
  }
LABEL_17:

  return v14;
}

- (id)markAsDropping
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v3 = [[SBIconViewAssertion alloc] initWithAssertionType:0 iconView:self extraInfo:0];
  droppingAssertions = self->_droppingAssertions;
  if (!droppingAssertions)
  {
    BOOL v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    double v6 = self->_droppingAssertions;
    self->_droppingAssertions = v5;

    droppingAssertions = self->_droppingAssertions;
  }
  [(NSHashTable *)droppingAssertions addObject:v3];
  char v7 = SBLogIcon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 134218242;
    id v10 = self;
    __int16 v11 = 2112;
    int v12 = v3;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, "%p: Adding SBIconView isDropping assertion: %@", (uint8_t *)&v9, 0x16u);
  }

  [(SBIconView *)self _toggleContentContainerViewIfNecessary];
  [(SBIconView *)self _updateAllComponentAlphas];
  return v3;
}

- (void)removeDroppingAssertion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134218242;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "%p: Remove SBIconView isDropping assertion: %@", (uint8_t *)&v7, 0x16u);
  }

  [(NSHashTable *)self->_droppingAssertions removeObject:v4];
  if (![(NSHashTable *)self->_droppingAssertions count])
  {
    droppingAssertions = self->_droppingAssertions;
    self->_droppingAssertions = 0;
  }
  [(SBIconView *)self _toggleContentContainerViewIfNecessary];
  [(SBIconView *)self _updateAllComponentAlphas];
}

- (void)iconInteractedWhenDisabled
{
  *((unsigned char *)self + 546) |= 1u;
  *((unsigned char *)self + 545) &= ~0x80u;
  [(SBIconView *)self _updateBrightness];
  [(SBIconView *)self _updateLabel];
}

- (BOOL)showsDropGlow
{
  return (*((unsigned __int8 *)self + 549) >> 2) & 1;
}

- (void)setShowsDropGlow:(BOOL)a3 animator:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_iconImageView)
  {
    if (v4 && !self->_dropGlow)
    {
      int v7 = [(SBIconView *)self newComponentBackgroundViewOfType:3];
      dropGlow = self->_dropGlow;
      self->_dropGlow = v7;

      [(SBIconView *)self _configureViewAsFolderIconImageView:self->_dropGlow];
      __int16 v9 = self->_dropGlow;
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v26[0] = *MEMORY[0x1E4F1DAB8];
      v26[1] = v10;
      v26[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(UIView *)v9 setTransform:v26];
      [(UIView *)self->_dropGlow setAlpha:0.0];
      uint64_t v11 = [(SBIconView *)self currentImageView];
      int v12 = self->_dropGlow;
      [v11 center];
      -[UIView setCenter:](v12, "setCenter:");
      uint64_t v13 = [(SBIconView *)self contentContainerView];
      [v13 insertSubview:self->_dropGlow belowSubview:v11];
    }
    char v14 = [(SBIconView *)self superview];
    [v14 sendSubviewToBack:self];
  }
  else if (objc_opt_respondsToSelector())
  {
    [(SBIconViewCustomImageViewControlling *)self->_customIconImageViewController setOverlapping:v4];
  }
  double v15 = self->_dropGlow;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __40__SBIconView_setShowsDropGlow_animator___block_invoke;
  v23[3] = &unk_1E6AB1058;
  void v23[4] = self;
  BOOL v25 = v4;
  uint64_t v16 = v15;
  long long v24 = v16;
  [v6 addAnimations:v23];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __40__SBIconView_setShowsDropGlow_animator___block_invoke_2;
  void v19[3] = &unk_1E6AB2FF8;
  BOOL v22 = v4;
  CGFloat v20 = v16;
  double v21 = self;
  uint64_t v17 = v16;
  [v6 addCompletion:v19];
  if (v4) {
    char v18 = 4;
  }
  else {
    char v18 = 0;
  }
  *((unsigned char *)self + 549) = *((unsigned char *)self + 549) & 0xFB | v18;
}

void __40__SBIconView_setShowsDropGlow_animator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOverlapping:*(unsigned __int8 *)(a1 + 48)];
  double v2 = 1.0;
  if (!*(unsigned char *)(a1 + 48)) {
    double v2 = 0.0;
  }
  [*(id *)(a1 + 40) setAlpha:v2];
  char v3 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 48))
  {
    CGAffineTransformMakeScale(&v8, 1.2, 1.2);
  }
  else
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v8.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v8.c = v4;
    *(_OWORD *)&v8.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  [v3 setTransform:&v8];
  BOOL v5 = [*(id *)(a1 + 32) _folderIconImageView];
  id v6 = v5;
  double v7 = 1.2;
  if (!*(unsigned char *)(a1 + 48)) {
    double v7 = 1.0;
  }
  objc_msgSend(v5, "setBackgroundScale:", v7, *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx);
}

void __40__SBIconView_setShowsDropGlow_animator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2 && !*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) removeFromSuperview];
    long long v4 = *(void **)(a1 + 32);
    char v3 = *(void **)(a1 + 40);
    if (v4 == (void *)v3[61])
    {
      v3[61] = 0;

      char v3 = *(void **)(a1 + 40);
    }
    id v5 = [v3 _folderIconImageView];
    [v5 setBackgroundScale:1.0];
  }
}

- (void)setShowsFocusEffect:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = self->_focusEffectPlatterView;
  id v6 = v5;
  if (v3)
  {
    id v7 = objc_alloc(MEMORY[0x1E4FB1ED8]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__SBIconView_setShowsFocusEffect___block_invoke;
    v10[3] = &unk_1E6AB1058;
    uint64_t v11 = v6;
    int v12 = self;
    char v13 = 1;
    CGAffineTransform v8 = (void *)[v7 initWithDuration:2 curve:v10 animations:0.1333];
    [v8 startAnimation];

    char v9 = 8;
  }
  else
  {
    [(SBIconFocusEffectPlatterView *)v5 removeFromSuperview];
    if (v6 == self->_focusEffectPlatterView)
    {
      self->_focusEffectPlatterView = 0;
    }
    char v9 = 0;
  }
  *((unsigned char *)self + 545) = *((unsigned char *)self + 545) & 0xF7 | v9;
}

uint64_t __34__SBIconView_setShowsFocusEffect___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) _focusEffectBoundsForFocused:*(unsigned __int8 *)(a1 + 48) withFocusOutset:5.5];
  objc_msgSend(v2, "setBounds:");
  BOOL v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) _focusEffectCenter];
  objc_msgSend(v3, "setCenter:");
  long long v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) iconImageCornerRadius];
  [v4 _setContinuousCornerRadius:v5 + 5.5];
  id v6 = *(void **)(a1 + 32);
  return [v6 layoutIfNeeded];
}

- (CGRect)_focusEffectBounds
{
  [(SBIconView *)self _focusEffectBoundsForFocused:(*((unsigned __int8 *)self + 545) >> 3) & 1 withFocusOutset:5.5];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGRect)_focusEffectBoundsForFocused:(BOOL)a3 withFocusOutset:(double)a4
{
  BOOL v4 = a3;
  id v6 = [(SBIconView *)self currentImageView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = [(SBIconView *)self customIconImageViewController];
  if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v15 focusEffectBounds];
    double v8 = v16;
    double v10 = v17;
    double v12 = v18;
    double v14 = v19;
  }
  UIRectInsetEdges();
  if (v4)
  {
    double v8 = v20;
    double v10 = v21;
    double v12 = v22;
    double v14 = v23;
  }

  double v24 = v8;
  double v25 = v10;
  double v26 = v12;
  double v27 = v14;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (CGPoint)_focusEffectCenter
{
  double v3 = [(SBIconView *)self customIconImageViewController];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v3 focusEffectCenter];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v8 = [(SBIconView *)self currentImageView];
    [v8 center];
    double v5 = v9;
    double v7 = v10;
  }
  double v11 = v5;
  double v12 = v7;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (void)setIconFadeFraction:(double)a3
{
}

- (void)setCrossfadeViewFadeFraction:(double)a3
{
}

- (BOOL)isCrossfadingImageWithView
{
  return self->_crossfadeView != 0;
}

- (UIColor)accessibilityTintColor
{
  double v3 = self->_accessibilityTintColor;
  if (!v3)
  {
    double v4 = [(SBIconView *)self behaviorDelegate];
    if (objc_opt_respondsToSelector())
    {
      double v3 = [v4 accessibilityTintColorForIconView:self];
    }
    else
    {
      double v3 = 0;
    }
  }
  return v3;
}

+ (id)draggedItemBundleIdentifiersInDrag:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v5 = objc_msgSend(v3, "items", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) localObject];
        double v11 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          double v13 = [v10 uniqueIdentifier];
          if (v13) {
            [v4 addObject:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (int64_t)draggingStartLocation
{
  id v3 = [(SBIconView *)self location];
  if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupFloatingDock", v3))
  {
    int64_t v4 = 6;
  }
  else if ((SBIconLocationGroupContainsLocation(@"SBIconLocationGroupRoot", v3) & 1) != 0 {
         || ([v3 isEqualToString:@"SBIconLocationFolder"] & 1) != 0
  }
         || (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupDock", v3) & 1) != 0)
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"SBIconLocationStackConfiguration"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"SBIconLocationAddWidgetSheet"])
  {
    int64_t v4 = 3;
  }
  else if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupAppLibrary", v3))
  {
    int64_t v4 = 4;
  }
  else if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupTodayView", v3))
  {
    int64_t v4 = 10;
  }
  else
  {
    int64_t v4 = 0;
  }
  double v5 = [(SBIconView *)self dragDelegate];
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [v5 iconView:self draggingStartLocationWithProposedStartLocation:v4];
  }

  return v4;
}

- (id)draggingLaunchActions
{
  id v3 = [(SBIconView *)self dragDelegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v4 = [v3 launchActionsForIconView:self];
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)draggingLaunchURL
{
  id v3 = [(SBIconView *)self dragDelegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v4 = [v3 launchURLForIconView:self];
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)dragPreviewForItem:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  double v9 = [MEMORY[0x1E4FB1618] clearColor];
  [v8 setBackgroundColor:v9];

  double v10 = [(SBIconView *)self dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v10 iconView:self dragPreviewForItem:v6 session:v7 previewParameters:v8];
  }
  else {
  double v11 = [(SBIconView *)self defaultDragPreviewWithParameters:v8];
  }

  return v11;
}

- (id)defaultDragPreview
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  int64_t v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  double v5 = [(SBIconView *)self defaultDragPreviewWithParameters:v3];

  return v5;
}

- (id)defaultDragPreviewWithParameters:(id)a3
{
  id v4 = a3;
  double v5 = [(SBIconView *)self customIconImageViewController];
  [(SBIconView *)self iconImageInfo];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (v5)
  {
    if (objc_opt_respondsToSelector())
    {
      id v12 = [v5 snapshotView];
      [(SBIconView *)self _setTemporarySnapshotViewForDragPreview:v12];
      [v12 _setContinuousCornerRadius:v11];
      [v12 setClipsToBounds:1];
    }
    else
    {
      id v12 = [v5 view];
    }
    if (objc_opt_respondsToSelector())
    {
      [v5 snapshotViewCenter];
      double v22 = v21;
      double v24 = v23;
      double v25 = [v5 view];
      -[SBIconView convertPoint:fromView:](self, "convertPoint:fromView:", v25, v22, v24);
      double v16 = v26;
      double v18 = v27;
    }
    else
    {
      [(SBIconView *)self iconImageCenter];
      double v16 = v28;
      double v18 = v29;
    }
    char v30 = objc_opt_respondsToSelector();
    CGFloat v20 = 1.0;
    if (v30)
    {
      [v5 snapshotViewScaleFactor];
      CGFloat v20 = v31;
    }
    if (objc_opt_respondsToSelector())
    {
      double v32 = [v5 snapshotViewVisiblePath];
    }
    else
    {
      double v32 = 0;
    }
    char v19 = v30 ^ 1;
    if (objc_opt_respondsToSelector()) {
      [v5 willUsePreviewParameters:v4];
    }
    if (v32)
    {
      id v33 = v32;
      double v34 = v33;
      goto LABEL_19;
    }
  }
  else
  {
    id v12 = objc_alloc_init([(SBIconView *)self expectedIconImageViewClass]);
    [(SBIconView *)self _configureIconImageView:v12];
    double v13 = [(SBIconView *)self icon];
    double v14 = [(SBIconView *)self location];
    [v12 setIcon:v13 location:v14 animated:0];

    [(SBIconView *)self iconImageCenter];
    double v16 = v15;
    double v18 = v17;
    char v19 = 1;
    CGFloat v20 = 1.0;
  }
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v7, v9, v11);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  double v34 = 0;
LABEL_19:
  [v4 setVisiblePath:v33];
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeScale(&v41, v20, v20);
  if (v19)
  {
    [(SBIconView *)self effectiveIconContentScale];
    CGAffineTransform v39 = v41;
    CGAffineTransformScale(&v40, &v39, v35, v35);
    CGAffineTransform v41 = v40;
  }
  CGAffineTransform v40 = v41;
  [v12 setTransform:&v40];
  double v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1728]), "initWithContainer:center:", self, v16, v18);
  double v37 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v12 parameters:v4 target:v36];

  return v37;
}

- (id)dragItems
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SBIconView *)self icon];
  id v4 = v3;
  if (!v3 || ([v3 isPlaceholder] & 1) != 0 || -[SBIconView isPaused](self, "isPaused"))
  {
    double v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    double v7 = [(SBIconView *)self dragDelegate];
    if (objc_opt_respondsToSelector())
    {
      double v5 = [v7 dragItemsForIconView:self];
    }
    else
    {
      double v8 = SBHIconDragItemWithIconAndIconView(v4, self, (void *)*MEMORY[0x1E4FA6E60]);
      v9[0] = v8;
      double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    }
  }

  return v5;
}

+ (id)dragContextForDragItem:(id)a3
{
  id v3 = [a3 itemProvider];
  id v4 = [v3 teamData];
  if (v4
    && (double v5 = (void *)MEMORY[0x1E4F28DC0],
        self,
        double v6 = objc_claimAutoreleasedReturnValue(),
        [v5 unarchivedObjectOfClass:v6 fromData:v4 error:0],
        double v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    id v8 = objc_alloc(MEMORY[0x1E4FA6998]);
    double v9 = [v7 uniqueIdentifier];
    double v10 = objc_msgSend(v8, "initWithUniqueIdentifier:withLaunchActions:startLocation:", v9, 0, SBHAppDragLocalContextStartLocationToSBSLocation(objc_msgSend(v7, "startLocation")));

    double v11 = [v7 applicationBundleIdentifier];
    [v10 setApplicationBundleIdentifier:v11];

    id v12 = [v7 launchURL];
    [v10 setLaunchURL:v12];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsDragInteraction
{
  return 1;
}

+ (BOOL)supportsTapGesture
{
  return 1;
}

+ (BOOL)supportsCursorInteraction
{
  return 1;
}

- (void)cleanUpAfterDropAnimation
{
  [(SBIconView *)self setGrabbed:0];
  [(SBIconView *)self setDragging:0 updateImmediately:1];
  [(SBIconView *)self _setTemporarySnapshotViewForDragPreview:0];
  [(SBIconView *)self _updateIconImageViewAnimated:0];
}

- (void)cancelDrag
{
  id v2 = [(SBIconView *)self dragInteraction];
  [v2 _cancelDrag];
}

- (void)cancelDragLift
{
  id v2 = [(SBIconView *)self dragInteraction];
  [v2 _cancelLift];
}

- (BOOL)dragsSupportSystemDragsByDefault
{
  return 1;
}

- (id)dragDelegate
{
  id v3 = [(SBIconView *)self overrideDraggingDelegate];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(SBIconView *)self delegate];
    id v5 = v6;
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v6 draggingDelegateForIconView:self];
    }
  }

  return v5;
}

- (BOOL)canBeginDrags
{
  id v3 = [(SBIconView *)self dragDelegate];
  BOOL v4 = (objc_opt_respondsToSelector() & 1) == 0 || [v3 iconViewCanBeginDrags:self];

  return v4;
}

- (id)supportedIconGridSizeClasses
{
  id v3 = [(SBIconView *)self icon];
  BOOL v4 = [v3 supportedGridSizeClasses];

  id v5 = [(SBIconView *)self behaviorDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 supportedGridSizeClassesForIconView:self];
    uint64_t v7 = [v4 gridSizeClassSetByIntersectingWithGridSizeClassSet:v6];

    BOOL v4 = (void *)v7;
  }

  return v4;
}

- (id)supportedIconGridSizeClassesForResize
{
  id v3 = [(SBIconView *)self icon];
  BOOL v4 = [v3 supportedGridSizeClasses];

  id v5 = [(SBIconView *)self behaviorDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 supportedIconGridSizeClassesForResizeOfIconView:self];
    uint64_t v7 = [v4 gridSizeClassSetByUnioningWithGridSizeClassSet:v6];

    BOOL v4 = (void *)v7;
  }

  return v4;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  id v3 = [(SBIconView *)self behaviorDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 gridSizeClassDomainForIconView:self],
        (BOOL v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v4 = +[SBHIconGridSizeClassDomain globalDomain];
  }

  return (SBHIconGridSizeClassDomain *)v4;
}

- (id)iconGridSizeClassSizes
{
  id v3 = [(SBIconView *)self listLayout];
  BOOL v4 = SBHIconListLayoutIconGridSizeClassSizes(v3, [(SBIconView *)self orientation]);

  return v4;
}

- (void)removeAssertion:(id)a3
{
  id v4 = a3;
  switch([v4 assertionType])
  {
    case 0:
      [(SBIconView *)self removeDroppingAssertion:v4];
      break;
    case 1:
      [(SBIconView *)self removeForbidAccessoryUpdatesAssertion:v4];
      break;
    case 2:
      [(SBIconView *)self removeBorrowedIconImageViewAssertion:v4];
      break;
    case 3:
      [(SBIconView *)self removeForbidContextMenusAssertion:v4];
      break;
    case 4:
      [(SBIconView *)self removeExtendResizeFinishAssertion:v4];
      break;
    default:
      break;
  }
}

- (void)purgeCachedEditingViewData
{
  unsigned int v3 = *((unsigned __int8 *)self + 544);
  int v4 = (v3 >> 2) & 3;
  if (v4)
  {
    if (v4 == 2) {
      *((unsigned char *)self + 544) = v3 & 0xF3 | 4;
    }
  }
  else
  {
    [(SBCloseBoxView *)self->_closeBox removeFromSuperview];
    closeBoCGFloat x = self->_closeBox;
    self->_closeBoCGFloat x = 0;
  }
}

- (id)dropDelegate
{
  id v3 = [(SBIconView *)self delegate];
  int v4 = v3;
  if (objc_opt_respondsToSelector())
  {
    int v4 = [v3 droppingDelegateForIconView:self];
  }
  return v4;
}

- (id)claimBindingsForDropSession:(id)a3
{
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4FB1730] sharedInstance];
  id v6 = [v5 sessionForDropSession:v3];

  id v7 = v3;
  BOOL v8 = [v7 _dataOwner] == 2 || objc_msgSend(v7, "_dataOwner") == 3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__SBIconView_claimBindingsForDropSession___block_invoke;
  aBlock[3] = &unk_1E6AB3020;
  id v16 = v7;
  id v17 = v6;
  id v9 = v4;
  id v18 = v9;
  id v10 = v6;
  id v11 = v7;
  id v12 = (void (**)(void *, BOOL))_Block_copy(aBlock);
  v12[2](v12, v8);
  v12[2](v12, !v8);
  id v13 = v9;

  return v13;
}

void __42__SBIconView_claimBindingsForDropSession___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = [*(id *)(a1 + 32) items];
  uint64_t v31 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v54;
    unint64_t v3 = 0x1E4F22000uLL;
    uint64_t v33 = v2;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v54 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v4;
        id v5 = *(void **)(*((void *)&v53 + 1) + 8 * v4);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v6 = [v5 itemProvider];
        id v7 = [v6 registeredTypeIdentifiers];

        id v36 = v7;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v62 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v50;
          uint64_t v34 = *(void *)v50;
          do
          {
            uint64_t v11 = 0;
            uint64_t v35 = v9;
            do
            {
              if (*(void *)v50 != v10) {
                objc_enumerationMutation(v36);
              }
              uint64_t v12 = *(void *)(*((void *)&v49 + 1) + 8 * v11);
              long long v47 = 0u;
              long long v48 = 0u;
              id v13 = [*(id *)(v2 + 40) info];
              double v14 = v13;
              if (v13)
              {
                [v13 auditToken];
              }
              else
              {
                long long v47 = 0u;
                long long v48 = 0u;
              }

              double v15 = [*(id *)(v3 + 1072) documentProxyForName:0 type:v12 MIMEType:0 isContentManaged:a2 sourceAuditToken:&v47];
              id v46 = 0;
              id v16 = [v15 availableClaimBindingsForMode:2 error:&v46];
              id v17 = v46;
              if (v16)
              {
                id v38 = v17;
                CGAffineTransform v39 = v15;
                CGAffineTransform v40 = v16;
                uint64_t v41 = v11;
                [*(id *)(v2 + 48) addObjectsFromArray:v16];
                long long v44 = 0u;
                long long v45 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                id v18 = *(id *)(v2 + 48);
                uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v61 count:16];
                if (v19)
                {
                  uint64_t v20 = v19;
                  uint64_t v21 = *(void *)v43;
                  do
                  {
                    for (uint64_t i = 0; i != v20; ++i)
                    {
                      if (*(void *)v43 != v21) {
                        objc_enumerationMutation(v18);
                      }
                      double v23 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                      double v24 = SBLogCommon();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                      {
                        double v25 = [v23 bundleRecord];
                        double v26 = [v25 bundleIdentifier];
                        *(_DWORD *)buf = 138412546;
                        BOOL v58 = v26;
                        __int16 v59 = 2112;
                        uint64_t v60 = v12;
                        _os_log_impl(&dword_1D7F0A000, v24, OS_LOG_TYPE_DEFAULT, "Claim: %@ %@", buf, 0x16u);
                      }
                    }
                    uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v61 count:16];
                  }
                  while (v20);
                  uint64_t v2 = v33;
                  uint64_t v10 = v34;
                  unint64_t v3 = 0x1E4F22000;
                  uint64_t v9 = v35;
                }
                double v27 = v38;
                double v15 = v39;
LABEL_26:

                id v16 = v40;
                uint64_t v11 = v41;
                goto LABEL_27;
              }
              double v27 = v17;
              if (v17)
              {
                CGAffineTransform v40 = 0;
                uint64_t v41 = v11;
                id v18 = SBLogCommon();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  BOOL v58 = v27;
                  _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_DEFAULT, "Error looking up LS claim bindings while examining types for drop. Error: %@", buf, 0xCu);
                }
                goto LABEL_26;
              }
LABEL_27:

              ++v11;
            }
            while (v11 != v9);
            uint64_t v28 = [v36 countByEnumeratingWithState:&v49 objects:v62 count:16];
            uint64_t v9 = v28;
          }
          while (v28);
        }

        uint64_t v4 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v31);
  }
}

- (id)URLsForDropSession:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB1730] sharedInstance];
  double v37 = v4;
  long long v44 = [v5 sessionForDropSession:v4];

  id v6 = (void *)MEMORY[0x1E4F223F8];
  id v7 = [(SBIconView *)self icon];
  uint64_t v8 = [v7 applicationBundleID];
  uint64_t v9 = [v6 bundleRecordWithBundleIdentifier:v8 allowPlaceholder:0 error:0];

  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v36 = v9;
  uint64_t v11 = [v9 claimRecords];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v63 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v17 = [v16 URLSchemes];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v68 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v59;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v59 != v20) {
                objc_enumerationMutation(v17);
              }
              [v10 addObject:*(void *)(*((void *)&v58 + 1) + 8 * j)];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v58 objects:v68 count:16];
          }
          while (v19);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v13);
  }

  id v43 = [MEMORY[0x1E4F1CA48] array];
  if ([v10 count])
  {
    double v22 = dispatch_group_create();
    double v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v42 = dispatch_queue_create("com.apple.SpringBoard.SBIconView.URLsForDropSession.serial-queue", v23);

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = [v4 items];
    uint64_t v40 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
    if (v40)
    {
      uint64_t v39 = *(void *)v55;
      double v24 = (void *)*MEMORY[0x1E4F444F8];
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v55 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v41 = v25;
          double v26 = *(void **)(*((void *)&v54 + 1) + 8 * v25);
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          double v27 = [v26 itemProvider];
          uint64_t v28 = [v27 registeredTypeIdentifiers];

          uint64_t v29 = [v28 countByEnumeratingWithState:&v50 objects:v66 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v51;
            do
            {
              for (uint64_t k = 0; k != v30; ++k)
              {
                if (*(void *)v51 != v31) {
                  objc_enumerationMutation(v28);
                }
                uint64_t v33 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(*((void *)&v50 + 1) + 8 * k)];
                if (v33 && [v24 conformsToType:v33])
                {
                  dispatch_group_enter(v22);
                  v45[0] = MEMORY[0x1E4F143A8];
                  v45[1] = 3221225472;
                  v45[2] = __33__SBIconView_URLsForDropSession___block_invoke;
                  v45[3] = &unk_1E6AB3048;
                  id v46 = v10;
                  long long v47 = v42;
                  id v48 = v43;
                  long long v49 = v22;
                  [v44 loadURLForItem:v26 completion:v45];
                }
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v50 objects:v66 count:16];
            }
            while (v30);
          }

          uint64_t v25 = v41 + 1;
        }
        while (v41 + 1 != v40);
        uint64_t v40 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
      }
      while (v40);
    }

    dispatch_time_t v34 = dispatch_time(0, 3000000000);
    dispatch_group_wait(v22, v34);
  }
  return v43;
}

void __33__SBIconView_URLsForDropSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 scheme];
    LODWORD(v5) = [v5 containsObject:v6];

    if (v5)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __33__SBIconView_URLsForDropSession___block_invoke_2;
      _OWORD v8[3] = &unk_1E6AACA90;
      id v7 = *(NSObject **)(a1 + 40);
      id v9 = *(id *)(a1 + 48);
      id v10 = v4;
      dispatch_sync(v7, v8);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __33__SBIconView_URLsForDropSession___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (_os_feature_enabled_impl())
  {
    id v6 = [(SBIconView *)self icon];
    id v7 = [v6 applicationBundleID];
    if ([v7 length] && objc_msgSend(v6, "isLeafIcon"))
    {
      uint64_t v20 = v6;
      [(SBIconView *)self claimBindingsForDropSession:v5];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v8 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = [*(id *)(*((void *)&v21 + 1) + 8 * i) bundleRecord];
            uint64_t v14 = [v13 bundleIdentifier];
            char v15 = [v7 isEqualToString:v14];

            if (v15)
            {
              BOOL v18 = 1;
              id v16 = v8;
              goto LABEL_17;
            }
          }
          uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      id v16 = [(SBIconView *)self URLsForDropSession:v5];
      if ([(NSArray *)v16 count])
      {
        droppingURLs = self->_droppingURLs;
        self->_droppingURLs = v16;
        BOOL v18 = 1;
        id v16 = droppingURLs;
      }
      else
      {
        BOOL v18 = 0;
      }
LABEL_17:
      id v6 = v20;
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:2];
  return v4;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6 = a4;
  [(SBIconView *)self setHighlighted:1];
  id v5 = [(SBIconView *)self dropDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconView:self dropSessionDidEnter:v6];
  }
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v7 = a4;
  [(SBIconView *)self setHighlighted:0];
  droppingURLs = self->_droppingURLs;
  self->_droppingURLs = 0;

  id v6 = [(SBIconView *)self dropDelegate];
  if (objc_opt_respondsToSelector()) {
    [v6 iconView:self dropSessionDidExit:v7];
  }
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(NSArray *)self->_droppingURLs count])
  {
    id v6 = objc_alloc_init(SBHIconLaunchContext);
    id v7 = [MEMORY[0x1E4F1CA80] set];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = self->_droppingURLs;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1A28]) initWithURL:*(void *)(*((void *)&v18 + 1) + 8 * v12)];
          [v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [(SBHIconLaunchContext *)v6 setActions:v7];
    [(SBHIconLaunchContext *)v6 setIconView:self];
    uint64_t v14 = [(SBIconView *)self icon];
    char v15 = [(SBIconView *)self location];
    [v14 launchFromLocation:v15 context:v6];
  }
  else
  {
    id v16 = [MEMORY[0x1E4FB1730] sharedInstance];
    id v6 = [v16 sessionForDropSession:v5];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __42__SBIconView_dropInteraction_performDrop___block_invoke;
    v17[3] = &unk_1E6AB3070;
    void v17[4] = self;
    [(SBHIconLaunchContext *)v6 requestDragContinuationEndpointWithCompletion:v17];
  }
}

void __42__SBIconView_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
    BSDispatchMain();
  }
}

void __42__SBIconView_dropInteraction_performDrop___block_invoke_2(uint64_t a1)
{
  id v6 = objc_alloc_init(SBHIconLaunchContext);
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1A20]) initWithDragContinuationEndpoint:*(void *)(a1 + 32)];
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];
  [(SBHIconLaunchContext *)v6 setActions:v3];

  [(SBHIconLaunchContext *)v6 setIconView:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 40) icon];
  id v5 = [*(id *)(a1 + 40) location];
  [v4 launchFromLocation:v5 context:v6];
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  -[SBIconView setHighlighted:](self, "setHighlighted:", 0, a4);
  droppingURLs = self->_droppingURLs;
  self->_droppingURLs = 0;
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v5 = [(SBIconView *)self icon];
  if ([v5 isLeafIcon])
  {
    id v6 = [(SBIconView *)self _visiblyActiveDataSource];
    if (objc_opt_respondsToSelector()) {
      int64_t v7 = [v6 dataOwnershipRoleAsDragDropTargetForIcon:v5];
    }
    else {
      int64_t v7 = 0;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  if ([(SBIconView *)self canBeginDrags])
  {
    id v5 = [(SBIconView *)self dragItems];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  return [(SBIconView *)self dragPreviewForItem:a4 session:a5];
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(SBIconView *)self setLiftingDragSession:v8];
  uint64_t v9 = [(SBIconView *)self dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v9 iconView:self willAnimateDragLiftWithAnimator:v7 session:v8];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __66__SBIconView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v13[3] = &unk_1E6AAC810;
  void v13[4] = self;
  [v7 addAnimations:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __66__SBIconView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
  v11[3] = &unk_1E6AADF00;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v7 addCompletion:v11];
}

uint64_t __66__SBIconView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isShowingContextMenu] & 1) == 0) {
    [*(id *)(a1 + 32) _setForcingIconContentScalingEnabled:1];
  }
  [*(id *)(a1 + 32) setDragLifted:1];
  [*(id *)(a1 + 32) _updateIconContentScale];
  id v2 = *(void **)(a1 + 32);
  return [v2 _updateAllComponentAlphas];
}

uint64_t __66__SBIconView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) liftingDragSession];
  id v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    if (([*(id *)(a1 + 32) isShowingContextMenu] & 1) == 0) {
      [*(id *)(a1 + 32) _setForcingIconContentScalingEnabled:0];
    }
    [*(id *)(a1 + 32) setLiftingDragSession:0];
    [*(id *)(a1 + 32) setDragLifted:0];
  }
  [*(id *)(a1 + 32) _updateIconContentScale];
  id v4 = *(void **)(a1 + 32);
  return [v4 _updateAllComponentAlphas];
}

- (void)_dragInteraction:(id)a3 liftAnimationDidChangeDirection:(int64_t)a4
{
  BOOL v6 = a4 != 1;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __63__SBIconView__dragInteraction_liftAnimationDidChangeDirection___block_invoke;
  uint64_t v11 = &unk_1E6AAD728;
  id v12 = self;
  BOOL v13 = a4 == 1;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:&v8 animations:0.225];
  -[SBIconView setDragLifted:](self, "setDragLifted:", v6, v8, v9, v10, v11);
  id v7 = [(SBIconView *)self dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 iconView:self dragLiftAnimationDidChangeDirection:a4];
  }
}

uint64_t __63__SBIconView__dragInteraction_liftAnimationDidChangeDirection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDragging:*(unsigned char *)(a1 + 40) == 0 updateImmediately:1];
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  return 0;
}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  return (id)objc_msgSend(a4, "firstObject", a3, a5.x, a5.y);
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  icon = self->_icon;
  if (icon && ![(SBIcon *)icon canBeAddedToMultiItemDrag])
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v10 = [(SBIconView *)self dragDelegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ![v10 iconView:self canAddDragItemsToSession:v8])
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v11 = [(SBIconView *)self dragItems];
    }
  }
  return v11;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  id v13 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = [(SBIconView *)self dragInteraction];

  if (v11 == v10)
  {
    [(SBIconView *)self setAddedToDrag:1];
    id v12 = [(SBIconView *)self dragDelegate];
    if (objc_opt_respondsToSelector()) {
      [v12 iconView:self willAddDragItems:v9 toSession:v13];
    }
  }
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
}

- (void)dragSession:(id)a3 didEndWithOperation:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SBIconView *)self setDragging:0 updateImmediately:1];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 iconViewDidEndDrag:self];
        }
        if (objc_opt_respondsToSelector()) {
          [v12 iconView:self dragSession:v6 didEndWithOperation:a4];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  id v13 = [(SBIconView *)self dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v13 iconView:self didEndDragSession:v6 withOperation:a4];
  }
}

- (void)dragSession:(id)a3 willEndWithOperation:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 iconView:self dragSession:v6 willEndWithOperation:a4];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  id v13 = [(SBIconView *)self dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v13 iconView:self session:v6 willEndWithOperation:a4];
  }
}

- (void)dragSessionWillBegin:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBIconView *)self setDragging:1 updateImmediately:1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 iconViewWillBeginDrag:self];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [(SBIconView *)self dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v11 iconViewWillBeginDrag:self session:v4];
  }
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v28 = a5;
  [(SBIconView *)self setCancelingDrag:1];
  uint64_t v8 = [(SBIconView *)self dragDelegate];
  uint64_t v9 = self;
  uint64_t v10 = v9;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v8 iconViewWillCancelDrag:v9];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v11 = (void *)[(NSHashTable *)v9->_observers copy];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v16 iconView:v9 willCancelDragForItem:v7];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [v10 superview];
  long long v18 = (void *)v17;
  if (v10 && v17)
  {
    uint64_t v19 = [v10 dropContainerView];
    id v20 = objc_alloc(MEMORY[0x1E4FB1728]);
    [v10 center];
    objc_msgSend(v19, "convertPoint:fromView:", v18);
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v29[0] = *MEMORY[0x1E4F1DAB8];
    v29[1] = v21;
    v29[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v22 = objc_msgSend(v20, "initWithContainer:center:transform:", v19, v29);
    uint64_t v23 = v28;
    long long v24 = [v28 retargetedPreviewWithTarget:v22];
    objc_msgSend(v24, "set_springboardPlatterStyle:", 1);
    uint64_t v25 = [(SBIconView *)v9 dragDelegate];

    if (objc_opt_respondsToSelector()) {
      [v25 iconView:v9 willUsePreviewForCancelling:v24 targetIconView:v10];
    }
  }
  else
  {
    uint64_t v19 = [v7 localObject];
    objc_opt_class();
    uint64_t v23 = v28;
    if (objc_opt_isKindOfClass()) {
      [v19 setCancelsViaScaleAndFade:1];
    }
    long long v24 = 0;
    uint64_t v25 = v27;
  }

  return v24;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(SBIconView *)self dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v9 iconView:self item:v7 willAnimateDragCancelWithAnimator:v8];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SBIconView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v10[3] = &unk_1E6AACB50;
  void v10[4] = self;
  [v8 addCompletion:v10];
}

uint64_t __65__SBIconView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCancelingDrag:0];
}

- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4
{
  id v5 = [(SBIconView *)self dragDelegate];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB20B8]);
  if ([(SBIconView *)self dragsSupportSystemDragsByDefault])
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = [v5 dragsSupportSystemDragsForIconView:self];
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  objc_msgSend(v6, "set_supportsSystemDrag:", v7);
  objc_msgSend(v6, "set_confineToLocalDevice:", 1);

  return v6;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconView;
  id v6 = a3;
  [(SBIconView *)&v7 touchesEnded:v6 withEvent:a4];
  LODWORD(a4) = _touchesContainNonIndirectTouch(v6);

  if (a4)
  {
    *((unsigned char *)self + 547) &= ~1u;
    -[SBIconView _delegateTouchEnded:](self, "_delegateTouchEnded:", 0, v7.receiver, v7.super_class);
    [(SBIconView *)self setHighlighted:0];
  }
}

- (void)setTouchDownInIcon:(BOOL)a3
{
  *((unsigned char *)self + 547) = *((unsigned char *)self + 547) & 0xFE | a3;
}

- (void)_handleTap
{
}

- (void)editingModeGestureRecognizerDidFire:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    id v5 = [(SBIconView *)self behaviorDelegate];
    objc_initWeak(&location, self);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __50__SBIconView_editingModeGestureRecognizerDidFire___block_invoke;
    uint64_t v13 = &unk_1E6AB3098;
    id v6 = v5;
    id v14 = v6;
    objc_copyWeak(&v16, &location);
    id v15 = v4;
    objc_super v7 = _Block_copy(&v10);
    if ([(SBIconView *)self isContextMenuInteractionActive])
    {
      [(SBIconView *)self dismissContextMenuWithCompletion:v7];
    }
    else
    {
      id v8 = [(SBIconView *)self window];
      uint64_t v9 = [v8 rootViewController];
      [v9 dismissViewControllerAnimated:1 completion:v7];
    }
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
}

void __50__SBIconView_editingModeGestureRecognizerDidFire___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    id v2 = *(void **)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [v2 iconView:WeakRetained editingModeGestureRecognizerDidFire:*(void *)(a1 + 40)];
  }
}

- (void)consumeSinglePressUpForButtonKind:(int64_t)a3
{
  if (a3 == 1) {
    [(SBIconView *)self dismissContextMenuWithCompletion:0];
  }
}

- (BOOL)closeBoxShouldTrack:(id)a3
{
  id v4 = (SBCloseBoxView *)a3;
  id v5 = [(SBIconView *)self behaviorDelegate];
  closeBoCGFloat x = self->_closeBox;

  if (closeBox == v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v7 = [v5 iconShouldAllowCloseBoxTap:self];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (pressesContainSelect(v6)) {
    [(SBIconView *)self setHighlighted:1];
  }
  id v8 = [v6 objectsPassingTest:&__block_literal_global_2511];

  if ((*((unsigned char *)self + 545) & 0x40) != 0 && *((char *)self + 545) < 0) {
    [(SBIconView *)self iconInteractedWhenDisabled];
  }
  if ([v8 count])
  {
    v9.receiver = self;
    v9.super_class = (Class)SBIconView;
    [(SBIconView *)&v9 pressesBegan:v8 withEvent:v7];
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectsPassingTest:&__block_literal_global_2511];
  if ([v7 count])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconView;
    [(SBIconView *)&v8 pressesChanged:v7 withEvent:v6];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectsPassingTest:&__block_literal_global_2511];
  if ([v7 count])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconView;
    [(SBIconView *)&v8 pressesCancelled:v7 withEvent:v6];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (pressesContainSelect(v6))
  {
    [(SBIconView *)self performTap];
    [(SBIconView *)self setHighlighted:0];
  }
  objc_super v8 = [v6 objectsPassingTest:&__block_literal_global_2511];

  if ([v8 count])
  {
    v9.receiver = self;
    v9.super_class = (Class)SBIconView;
    [(SBIconView *)&v9 pressesEnded:v8 withEvent:v7];
  }
}

- (void)_setTemporarySnapshotViewForDragPreview:(id)a3
{
  id v4 = a3;
  temporarySnapshotContainerViewForDragPreview = self->_temporarySnapshotContainerViewForDragPreview;
  id v10 = v4;
  if (v4)
  {
    if (temporarySnapshotContainerViewForDragPreview)
    {
      id v6 = [(UIView *)temporarySnapshotContainerViewForDragPreview subviews];
      [v6 makeObjectsPerformSelector:sel_removeFromSuperview];
    }
    else
    {
      objc_super v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      objc_super v9 = self->_temporarySnapshotContainerViewForDragPreview;
      self->_temporarySnapshotContainerViewForDragPreview = v8;

      -[UIView setCenter:](self->_temporarySnapshotContainerViewForDragPreview, "setCenter:", -500.0, -500.0);
    }
    [(UIView *)self->_temporarySnapshotContainerViewForDragPreview addSubview:v10];
    [(SBIconView *)self addSubview:self->_temporarySnapshotContainerViewForDragPreview];
  }
  else
  {
    [(UIView *)temporarySnapshotContainerViewForDragPreview removeFromSuperview];
    id v7 = self->_temporarySnapshotContainerViewForDragPreview;
    self->_temporarySnapshotContainerViewForDragPreview = 0;
  }
}

+ (id)componentBackgroundView
{
  return (id)[a1 componentBackgroundViewOfType:0];
}

+ (id)componentBackgroundViewOfType:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:0];
  id v6 = [a1 componentBackgroundViewOfType:a3 compatibleWithTraitCollection:v5 initialWeighting:1.0];

  return v6;
}

+ (int64_t)defaultWidgetBackgroundRecipe
{
  return 3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = (UIPointerInteraction *)a3;
  id v8 = a5;
  if ([(SBIconView *)self _isCursorInteractionEnabled]
    && self->_iconViewCursorInteraction == v7)
  {
    [(SBIconView *)self iconImageFrame];
    double top = self->_cursorHitTestPadding.top;
    double left = self->_cursorHitTestPadding.left;
    double v13 = v12 + left;
    double v15 = v14 + top;
    double v17 = v16 - (left + self->_cursorHitTestPadding.right);
    double v19 = v18 - (top + self->_cursorHitTestPadding.bottom);
    id v20 = (void *)MEMORY[0x1E4FB1AD8];
    long long v21 = [v8 identifier];
    objc_super v9 = objc_msgSend(v20, "regionWithRect:identifier:", v21, v13, v15, v17, v19);
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  if (self->_iconViewCursorInteraction == a3)
  {
    id v6 = [(SBIconView *)self icon];
    int v7 = [v6 isWidgetIcon];

    if (v7)
    {
      id v4 = [(SBIconView *)self _pointerStyleForWidgetIcon];
    }
    else
    {
      iconImageView = self->_iconImageView;
      if (iconImageView && ![(SBIconImageView *)iconImageView hasOpaqueImage])
      {
        id v4 = [(SBIconView *)self _pointerStyleForLibraryAdditionalItemsIndicatorIcon];
      }
      else
      {
        id v4 = [(SBIconView *)self _pointerStyleForAppIcon];
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6 = a4;
  activePointerRegions = self->_activePointerRegions;
  id v10 = v6;
  if (!activePointerRegions)
  {
    id v8 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    objc_super v9 = self->_activePointerRegions;
    self->_activePointerRegions = v8;

    id v6 = v10;
    activePointerRegions = self->_activePointerRegions;
  }
  [(NSCountedSet *)activePointerRegions addObject:v6];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7 = a4;
  id v8 = v7;
  if (a5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __57__SBIconView_pointerInteraction_willExitRegion_animator___block_invoke;
    v9[3] = &unk_1E6AACF80;
    v9[4] = self;
    id v10 = v7;
    [a5 addCompletion:v9];
  }
  else
  {
    [(NSCountedSet *)self->_activePointerRegions removeObject:v7];
  }
}

uint64_t __57__SBIconView_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 784) removeObject:*(void *)(result + 40)];
  }
  return result;
}

- (id)_pointerStyleForAppIcon
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(SBIconView *)self currentImageView];
  id v4 = [v3 window];

  if (v4)
  {
    [(SBIconView *)self iconImageInfo];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    double v12 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v6, v8, v10);
    [v11 setVisiblePath:v12];

    double v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v3 parameters:v11];
    objc_msgSend(v13, "set_springboardPlatterStyle:", 1);
    accessoryView = self->_accessoryView;
    closeBoCGFloat x = self->_closeBox;
    if (accessoryView)
    {
      if (closeBox)
      {
        v26[0] = self->_closeBox;
        v26[1] = accessoryView;
        double v16 = (void *)MEMORY[0x1E4F1C978];
        double v17 = (SBIconAccessoryView **)v26;
        uint64_t v18 = 2;
LABEL_10:
        id v20 = [v16 arrayWithObjects:v17 count:v18];
        [v13 _setAccessoryViews:v20];

        goto LABEL_11;
      }
      uint64_t v25 = self->_accessoryView;
      double v16 = (void *)MEMORY[0x1E4F1C978];
      double v17 = &v25;
    }
    else
    {
      if (!closeBox)
      {
LABEL_11:
        if ([(SBIconView *)self isEditing])
        {
          long long v21 = [MEMORY[0x1E4FB1AC0] effectWithPreview:v13];
          [v21 setPreferredTintMode:0];
          long long v22 = 0;
        }
        else
        {
          long long v21 = [MEMORY[0x1E4FB1AA8] effectWithPreview:v13];
          long long v22 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:cornerRadius:", 0.0, 0.0, v6, v8, v10);
        }
        double v19 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v21 shape:v22];

        goto LABEL_15;
      }
      long long v24 = self->_closeBox;
      double v16 = (void *)MEMORY[0x1E4F1C978];
      double v17 = (SBIconAccessoryView **)&v24;
    }
    uint64_t v18 = 1;
    goto LABEL_10;
  }
  double v19 = 0;
LABEL_15:

  return v19;
}

- (id)_pointerStyleForWidgetIcon
{
  id v2 = [(SBIconView *)self currentImageView];
  if (v2)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v2];
    id v4 = [MEMORY[0x1E4FB1AC0] effectWithPreview:v3];
    [v4 setPrefersShadow:1];
    double v5 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v4 shape:0];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)_pointerStyleForLibraryAdditionalItemsIndicatorIcon
{
  id v2 = [(SBIconView *)self currentImageView];
  if (v2)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v2];
    id v4 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v3];
    double v5 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v4 shape:0];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (BOOL)canShowCloseBox
{
  if ((*((unsigned char *)self + 546) & 0x20) == 0) {
    return 0;
  }
  id v3 = [(SBIconView *)self icon];
  char v4 = [v3 isPlaceholder];

  if ((v4 & 1) != 0
    || [(SBIconView *)self isShowingConfigurationCard]
    || [(SBIconView *)self isShowingStackConfigurationCard]
    || [(SBIconView *)self isOverlapping]
    || ![(SBIconView *)self allowsAdornmentsOverIconImage])
  {
    return 0;
  }
  double v5 = [(SBIconView *)self behaviorDelegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 iconViewDisplaysCloseBox:self];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

+ (Class)_closeBoxClassForType:(int64_t)a3
{
  if ((unint64_t)a3 > 1)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = self;
  }
  return (Class)v4;
}

+ (int64_t)closeBoxTypeForView:(id)a3
{
  id v3 = a3;
  id v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int64_t v6 = 1;
  }
  else
  {
    double v7 = self;
    char v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
    {
      double v9 = SBLogIcon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[SBIconView closeBoxTypeForView:]((uint64_t)v3, v9);
      }
    }
    int64_t v6 = 0;
  }

  return v6;
}

- (int64_t)_closeBoxType
{
  id v3 = [(SBIconView *)self behaviorDelegate];
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [v3 closeBoxTypeForIconView:self];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)_createCloseBoxIfNecessary
{
  id v16 = [(SBIconView *)self icon];
  if (v16)
  {
    int64_t v3 = [(SBIconView *)self _closeBoxType];
    if (!self->_closeBox) {
      goto LABEL_6;
    }
    if (v3 != [(id)objc_opt_class() closeBoxTypeForView:self->_closeBox])
    {
      [(SBCloseBoxView *)self->_closeBox removeFromSuperview];
      closeBoCGFloat x = self->_closeBox;
      self->_closeBoCGFloat x = 0;
    }
    if (!self->_closeBox)
    {
LABEL_6:
      id v5 = objc_alloc((Class)[(id)objc_opt_class() _closeBoxClassForType:v3]);
      id v6 = [(SBIconView *)self newComponentBackgroundViewOfType:1];
      double v7 = (SBCloseBoxView *)objc_msgSend(v5, "initWithFrame:backgroundView:", v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      char v8 = self->_closeBox;
      self->_closeBoCGFloat x = v7;

      [(SBCloseBoxView *)self->_closeBox setDelegate:self];
      double v9 = self->_closeBox;
      double v10 = [(SBIconView *)self listLayout];
      [(SBCloseBoxView *)v9 setListLayout:v10];

      id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__closeBoxTapGestureChanged_];
      [v11 setDelegate:self];
      [(SBCloseBoxView *)self->_closeBox addGestureRecognizer:v11];
      [(SBCloseBoxView *)self->_closeBox setActionTapGestureRecognizer:v11];
      [(SBCloseBoxView *)self->_closeBox sizeToFit];
      double v12 = [(SBHomeScreenButton *)self->_closeBox materialView];
      objc_msgSend(v12, "setLegibilityStyle:", -[_UILegibilitySettings style](self->_legibilitySettings, "style"));

      double v13 = [(SBIconView *)self badgeParallaxSettings];
      SBFApplyParallaxSettingsToView();
      double v14 = (UIPointerInteraction *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self->_closeBox];
      closeBoxCursorInteraction = self->_closeBoxCursorInteraction;
      self->_closeBoxCursorInteraction = v14;

      [(SBCloseBoxView *)self->_closeBox addInteraction:self->_closeBoxCursorInteraction];
    }
  }
}

uint64_t __43__SBIconView__updateCloseBoxWithAnimation___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 464) _removeAllAnimations:0];
  [*(id *)(a1 + 32) _createCloseBoxIfNecessary];
  [*(id *)(a1 + 40) addSubview:*(void *)(*(void *)(a1 + 32) + 464)];
  [*(id *)(a1 + 40) bringSubviewToFront:*(void *)(*(void *)(a1 + 32) + 464)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 464);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v7[0] = *MEMORY[0x1E4F1DAB8];
  v7[1] = v3;
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v7];
  int64_t v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[58];
  [v4 effectiveIconAccessoryAlpha];
  objc_msgSend(v5, "setAlpha:");
  [*(id *)(a1 + 32) setNeedsLayout];
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __43__SBIconView__updateCloseBoxWithAnimation___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 464);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  [v2 setTransform:&v4];
  return [*(id *)(*(void *)(a1 + 32) + 464) setAlpha:0.0];
}

uint64_t __43__SBIconView__updateCloseBoxWithAnimation___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v6];
  CGAffineTransform v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) effectiveIconAccessoryAlpha];
  return objc_msgSend(v4, "setAlpha:");
}

uint64_t __43__SBIconView__updateCloseBoxWithAnimation___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)_animateCloseBoxWithAnimation:(int64_t)a3 animationBlock:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    id v7 = objc_alloc(MEMORY[0x1E4FB1ED8]);
    double v8 = 1.73557;
    double v9 = 0.4;
  }
  else
  {
    if (a3)
    {
LABEL_7:
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
      [(SBIconView *)self _checkAndRemoveCloseBoxAfterAnimation];
      [(SBIconView *)self setCloseBoxAnimator:0];
      goto LABEL_8;
    }
    id v7 = objc_alloc(MEMORY[0x1E4FB1ED8]);
    double v8 = 0.34071;
    double v9 = 0.9;
  }
  double v10 = (void *)[v7 initWithDuration:v6 dampingRatio:v8 animations:v9];
  if (!v10) {
    goto LABEL_7;
  }
  unint64_t v11 = [(SBIconView *)self shouldShowCloseBox];
  objc_initWeak(&location, v10);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  double v14 = __59__SBIconView__animateCloseBoxWithAnimation_animationBlock___block_invoke;
  double v15 = &unk_1E6AB30C0;
  v17[1] = (id)v11;
  id v16 = self;
  objc_copyWeak(v17, &location);
  [v10 addCompletion:&v12];
  -[SBIconView setCloseBoxAnimator:](self, "setCloseBoxAnimator:", v10, v12, v13, v14, v15, v16);
  [v10 startAnimation];
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

LABEL_8:
}

void __59__SBIconView__animateCloseBoxWithAnimation_animationBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 48) == a2) {
    [*(id *)(a1 + 32) _checkAndRemoveCloseBoxAfterAnimation];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [*(id *)(a1 + 32) closeBoxAnimator];

  if (WeakRetained == v4)
  {
    id v5 = *(void **)(a1 + 32);
    [v5 setCloseBoxAnimator:0];
  }
}

- (void)_checkAndRemoveCloseBoxAfterAnimation
{
  if (![(SBIconView *)self _isShowingCloseBox])
  {
    [(SBCloseBoxView *)self->_closeBox removeFromSuperview];
    if ((*((unsigned char *)self + 544) & 0xC) == 4)
    {
      closeBoCGFloat x = self->_closeBox;
      self->_closeBoCGFloat x = 0;
    }
  }
  *((unsigned char *)self + 544) &= 0xF3u;
}

- (void)_setShowingCloseBox:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 548) = *((unsigned char *)self + 548) & 0xEF | v3;
}

- (void)_closeBoxTapGestureChanged:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(SBIconView *)self actionDelegate];
    if (objc_opt_respondsToSelector()) {
      [v4 iconCloseBoxTapped:self];
    }
  }
}

- (BOOL)allowsBlockedForScreenTimeExpiration
{
  return (*((unsigned char *)self + 549) & 0x40) == 0;
}

- (void)setAllowsBlockedForScreenTimeExpiration:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 549);
  if (a3 == (v3 & 0x40) >> 6)
  {
    if (a3) {
      char v5 = 0;
    }
    else {
      char v5 = 64;
    }
    *((unsigned char *)self + 549) = v3 & 0xBF | v5;
    [(SBIconView *)self _updateBrightness];
    [(SBIconView *)self _updateLabelArea];
  }
}

- (BOOL)canShowResizeHandle
{
  if (![(SBIconView *)self allowsResizeHandle]) {
    return 0;
  }
  char v3 = [(SBIconView *)self icon];
  id v4 = [v3 supportedGridSizeClasses];
  if ((unint64_t)[v4 count] < 2
    || [(SBIconView *)self isShowingConfigurationCard]
    || [(SBIconView *)self isShowingStackConfigurationCard]
    || ![(SBIconView *)self allowsAdornmentsOverIconImage])
  {
    BOOL v6 = 0;
  }
  else
  {
    char v5 = [(SBIconView *)self behaviorDelegate];
    BOOL v6 = (objc_opt_respondsToSelector() & 1) == 0
      || [v5 iconViewDisplaysResizeHandle:self];
  }
  return v6;
}

uint64_t __42__SBIconView__updateResizeHandleAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __42__SBIconView__updateResizeHandleAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.75, 0.75);
  return [v2 setTransform:&v4];
}

uint64_t __42__SBIconView__updateResizeHandleAnimated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

uint64_t __42__SBIconView__updateResizeHandleAnimated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.75, 0.75);
  return [v2 setTransform:&v4];
}

uint64_t __42__SBIconView__updateResizeHandleAnimated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (id)_makeResizeHandle
{
  id v3 = [(SBIconView *)self newComponentBackgroundViewOfType:5];
  [(SBIconView *)self iconImageInfo];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  SBIconResizeHandleMetricsForIconResizingSettings(self->_iconResizingSettings, (uint64_t)&v25);
  uint64_t v12 = [(SBIconView *)self behaviorDelegate];
  if (objc_opt_respondsToSelector())
  {
    if (v12)
    {
      [v12 resizeHandleMetricsForIconView:self];
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
    }
    long long v27 = v22;
    long long v28 = v23;
    long long v29 = v24;
    long long v25 = v20;
    long long v26 = v21;
  }
  else if (objc_opt_respondsToSelector())
  {
    [v12 pathLengthForResizeHandleOfIconView:self];
    *((void *)&v25 + 1) = v13;
  }
  double v14 = [SBHIconResizeHandle alloc];
  long long v22 = v27;
  long long v23 = v28;
  long long v24 = v29;
  long long v20 = v25;
  long long v21 = v26;
  double v15 = -[SBHIconResizeHandle initWithMetrics:iconImageInfo:backgroundView:](v14, "initWithMetrics:iconImageInfo:backgroundView:", &v20, v3, v5, v7, v9, v11);
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel_resizeGestureRecognizerDidUpdate_];
  [v16 _setHysteresis:0.0];
  [v16 setDelaysTouchesBegan:0];
  [(SBHIconResizeHandle *)v15 setResizingGestureRecognizer:v16];
  [(SBHIconResizeHandle *)v15 setAccessibilityIdentifier:@"icon-resize-handle"];
  double v17 = (UIPointerInteraction *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v15];
  resizeHandleCursorInteraction = self->_resizeHandleCursorInteraction;
  self->_resizeHandleCursorInteraction = v17;

  [(SBHIconResizeHandle *)v15 addInteraction:self->_resizeHandleCursorInteraction];
  return v15;
}

- (CGPoint)_centerForResizeHandle
{
  id v3 = [(SBIconView *)self resizeHandle];
  [(SBIconView *)self iconImageFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  objc_msgSend(v3, "sizeThatFits:", v8, v10);
  double v13 = v12;
  double v15 = v14 * 0.5;
  uint64_t v16 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  CGFloat v17 = v5;
  CGFloat v18 = v7;
  CGFloat v19 = v9;
  CGFloat v20 = v11;
  if (v16 == 1) {
    double v21 = v15 + CGRectGetMinX(*(CGRect *)&v17);
  }
  else {
    double v21 = CGRectGetMaxX(*(CGRect *)&v17) - v15;
  }
  v26.origin.CGFloat x = v5;
  v26.origin.CGFloat y = v7;
  v26.size.double width = v9;
  v26.size.double height = v11;
  CGFloat v22 = CGRectGetMaxY(v26) + v13 * -0.5;

  double v23 = v21;
  double v24 = v22;
  result.CGFloat y = v24;
  result.CGFloat x = v23;
  return result;
}

- (void)setResizing:(BOOL)a3
{
  unsigned int v3 = *((unsigned __int8 *)self + 551);
  if (a3 != v3 >> 7)
  {
    if (a3) {
      char v4 = 0x80;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 551) = v4 & 0x80 | v3 & 0x7F;
    [(SBIconView *)self _updateJitter];
  }
}

- (id)extendResizingFinish
{
  *((unsigned char *)self + 552) |= 1u;
  id v2 = [[SBIconViewAssertion alloc] initWithAssertionType:4 iconView:self extraInfo:0];
  return v2;
}

- (void)removeExtendResizeFinishAssertion:(id)a3
{
  *((unsigned char *)self + 552) &= ~1u;
  [(SBIconView *)self setResizing:0];
  [(SBIconView *)self setResizeGestureHandler:0];
}

- (void)resizeGestureRecognizerDidUpdate:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat v5 = [(SBIconView *)self resizeHandle];
  uint64_t v6 = [v4 state];
  uint64_t v7 = v6;
  unint64_t v8 = v6 - 3;
  if ((unint64_t)(v6 - 3) >= 3)
  {
    if (v6 != 1) {
      goto LABEL_6;
    }
    uint64_t v9 = 1;
    [(SBIconView *)self setResizing:1];
  }
  else
  {
    uint64_t v9 = 0;
  }
  [v5 setHighlighted:v9];
  [v5 setResizing:v9];
LABEL_6:
  double v10 = [(SBIconView *)self resizeGestureHandler];
  CGFloat v11 = v10;
  if (v10) {
    [v10 iconView:self resizeGestureRecognizerDidUpdate:v4];
  }
  if (v8 <= 2 && (*((unsigned char *)self + 552) & 1) == 0)
  {
    [(SBIconView *)self setResizing:0];
    [(SBIconView *)self setResizeGestureHandler:0];
  }
  if (!v11)
  {
    if (v8 < 3)
    {
      [v5 setHighlighted:0];
      [v5 setResizing:0];
      [(SBIconView *)self setNeedsLayout];
      double v12 = [(SBIconView *)self currentImageView];
      double v13 = (void *)MEMORY[0x1E4FB1EB0];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __47__SBIconView_resizeGestureRecognizerDidUpdate___block_invoke_736;
      v61[3] = &unk_1E6AACA90;
      id v14 = v12;
      id v62 = v14;
      long long v63 = self;
      [v13 animateWithDuration:v61 animations:0.3];
      double v15 = [(SBIconView *)self behaviorDelegate];
      if (objc_opt_respondsToSelector()) {
        [v15 iconViewDidEndTrackingPossibleResize:self context:self->_resizeGestureContext];
      }
      resizeGestureContext = self->_resizeGestureContext;
      self->_resizeGestureContext = 0;

      goto LABEL_16;
    }
    if (v7 == 2)
    {
      CGFloat v20 = [(NSMutableDictionary *)self->_resizeGestureContext objectForKey:@"SBIconViewGestureResizing"];
      char v21 = [v20 BOOLValue];

      if ((v21 & 1) == 0)
      {
        id v14 = [(NSMutableDictionary *)self->_resizeGestureContext objectForKey:@"SBIconViewGestureResizeFinishTime"];
        [v4 locationInView:v5];
        double v30 = v29;
        double v32 = v31;
        if (v14)
        {
          [v14 unsignedLongLongValue];
          mach_continuous_time();
          BSTimeDifferenceFromMachTimeToMachTime();
          if (v33 < 0.2) {
            goto LABEL_16;
          }
          [(NSMutableDictionary *)self->_resizeGestureContext removeObjectForKey:@"SBIconViewGestureResizeFinishTime"];
          dispatch_time_t v34 = self->_resizeGestureContext;
          *(double *)id v67 = v30;
          *(double *)&v67[1] = v32;
          uint64_t v35 = [MEMORY[0x1E4F29238] valueWithBytes:v67 objCType:"{CGPoint=dd}"];
          [(NSMutableDictionary *)v34 setObject:v35 forKey:@"SBIconViewGestureCenterPoint"];
        }
        id v36 = [(NSMutableDictionary *)self->_resizeGestureContext objectForKey:@"SBIconViewGestureHasResized"];
        int v37 = [v36 BOOLValue];

        if (v37) {
          double v38 = 10.0;
        }
        else {
          double v38 = 20.0;
        }
        uint64_t v39 = [(NSMutableDictionary *)self->_resizeGestureContext objectForKey:@"SBIconViewGestureCenterPoint"];
        [v39 CGPointValue];
        double v41 = v40;
        double v43 = v42;

        double v44 = vabdd_f64(v30, v41);
        double v45 = vabdd_f64(v32, v43);
        BOOL v46 = v45 > v38;
        if (v44 > v38) {
          BOOL v46 = 0;
        }
        double v47 = v30 - v41;
        double v48 = v32 - v43;
        if (v45 <= v38 && v44 <= v38)
        {
          if (v37) {
            goto LABEL_16;
          }
          double v56 = v44 / 20.0;
          double v57 = v45 / 20.0;
          if (v47 >= 0.0) {
            double v58 = v56 * 0.1;
          }
          else {
            double v58 = -(v56 * 0.1);
          }
          if (v48 >= 0.0) {
            double v59 = v57 * 0.1;
          }
          else {
            double v59 = -(v57 * 0.1);
          }
          long long v60 = SBLogWidgets();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218752;
            double v70 = v58;
            __int16 v71 = 2048;
            double v72 = v59;
            __int16 v73 = 2048;
            double v74 = v56;
            __int16 v75 = 2048;
            double v76 = v57;
            _os_log_debug_impl(&dword_1D7F0A000, v60, OS_LOG_TYPE_DEBUG, "updating gesture resize scale to %f,%f (progress: %f,%f)", buf, 0x2Au);
          }

          long long v55 = [(SBIconView *)self currentImageView];
          CGAffineTransformMakeScale(&v64, v58 + 1.0, v59 + 1.0);
          [(NSMutableDictionary *)v55 setTransform:&v64];
          [(SBIconView *)self setNeedsLayout];
          [v5 setHighlighted:1];
        }
        else
        {
          BOOL v50 = v44 > v45;
          if (v45 <= v38) {
            BOOL v50 = 1;
          }
          if (v48 >= 0.0) {
            BOOL v46 = 0;
          }
          if (v44 <= v38 || !v50) {
            uint64_t v52 = v46;
          }
          else {
            uint64_t v52 = v47 < 0.0;
          }
          long long v53 = self->_resizeGestureContext;
          uint64_t v54 = MEMORY[0x1E4F1CC38];
          [(NSMutableDictionary *)v53 setObject:MEMORY[0x1E4F1CC38] forKey:@"SBIconViewGestureResizing"];
          [(NSMutableDictionary *)v53 setObject:v54 forKey:@"SBIconViewGestureHasResized"];
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __47__SBIconView_resizeGestureRecognizerDidUpdate___block_invoke;
          v65[3] = &unk_1E6AAC810;
          id v66 = v53;
          long long v55 = v53;
          [(SBIconView *)self _initiateResizeToSmallerSize:v52 completionHandler:v65];
        }
        goto LABEL_16;
      }
    }
    else if (v7 == 1)
    {
      CGFloat v17 = SBLogWidgetResizing();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "starting gesture for resize", buf, 2u);
      }

      [v5 setHighlighted:1];
      [v5 setResizing:1];
      id v14 = [(SBIconView *)self behaviorDelegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v18 = [v14 resizeGestureHandlerForIconView:self];
        if (v18)
        {
          CGFloat v11 = (void *)v18;
          CGFloat v19 = SBLogWidgetResizing();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            double v70 = *(double *)&v11;
            _os_log_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_DEFAULT, "got gesture handler for resize: %@", buf, 0xCu);
          }

          [(SBIconView *)self setResizeGestureHandler:v11];
          [v11 iconView:self resizeGestureRecognizerDidUpdate:v4];
          goto LABEL_17;
        }
      }
      if (objc_opt_respondsToSelector())
      {
        CGFloat v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        double v23 = self->_resizeGestureContext;
        self->_resizeGestureContext = v22;

        double v24 = self->_resizeGestureContext;
        long long v25 = (void *)MEMORY[0x1E4F29238];
        [v5 bounds];
        UIRectGetCenter();
        v68[0] = v26;
        v68[1] = v27;
        long long v28 = [v25 valueWithBytes:v68 objCType:"{CGPoint=dd}"];
        [(NSMutableDictionary *)v24 setObject:v28 forKey:@"SBIconViewGestureCenterPoint"];

        [v14 iconViewDidBeginTrackingPossibleResize:self context:self->_resizeGestureContext];
      }
LABEL_16:
      CGFloat v11 = 0;
LABEL_17:

      goto LABEL_29;
    }
    CGFloat v11 = 0;
  }
LABEL_29:
}

void __47__SBIconView_resizeGestureRecognizerDidUpdate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeObjectForKey:@"SBIconViewGestureResizing"];
  id v2 = *(void **)(a1 + 32);
  unsigned int v3 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
  [v2 setObject:v3 forKey:@"SBIconViewGestureResizeFinishTime"];

  id v4 = SBLogWidgets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CGFloat v5 = 0;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_INFO, "gesture resize animation finished", v5, 2u);
  }
}

uint64_t __47__SBIconView_resizeGestureRecognizerDidUpdate___block_invoke_736(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 40) layoutIfNeeded];
}

- (id)nextSmallerGridSizeClassForResize
{
  long long v3 = [(SBIconView *)self icon];
  id v4 = [(SBIconView *)self supportedIconGridSizeClassesForResize];
  CGFloat v5 = [(SBIconView *)self iconGridSizeClassSizes];
  uint64_t v6 = [v3 gridSizeClass];
  uint64_t v7 = [v5 gridSizeClassSmallerThanGridSizeClass:v6 allowedGridSizeClasses:v4];

  return v7;
}

- (id)nextLargerGridSizeClassForResize
{
  long long v3 = [(SBIconView *)self icon];
  id v4 = [(SBIconView *)self supportedIconGridSizeClassesForResize];
  CGFloat v5 = [(SBIconView *)self iconGridSizeClassSizes];
  uint64_t v6 = [v3 gridSizeClass];
  uint64_t v7 = [v5 gridSizeClassLargerThanGridSizeClass:v6 allowedGridSizeClasses:v4];

  return v7;
}

- (void)_initiateResizeToSmallerSize:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(void))a4;
  if (v4) {
    [(SBIconView *)self nextSmallerGridSizeClassForResize];
  }
  else {
  uint64_t v7 = [(SBIconView *)self nextLargerGridSizeClassForResize];
  }
  if (v7)
  {
    unint64_t v8 = SBLogWidgets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      double v12 = v7;
      _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "initiating gesture resize to grid size %{public}@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v9 = [(SBIconView *)self actionDelegate];
    if (objc_opt_respondsToSelector())
    {
      [v9 iconView:self wantsResizeToGridSizeClass:v7 completionHandler:v6];
    }
    else if (v6)
    {
      double v10 = SBLogWidgets();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        double v12 = v7;
        _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Can't initiate resize to %{public}@ because delegate doesn't implement", (uint8_t *)&v11, 0xCu);
      }

      v6[2](v6);
    }
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

void __32__SBIconView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  objc_msgSend(a2, "convertPoint:fromView:", *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v7 = objc_msgSend(a2, "hitTest:withEvent:", *(void *)(a1 + 40));
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    *a4 = 1;
  }
}

- (BOOL)_delegateTapAllowed
{
  long long v3 = [(SBIconView *)self behaviorDelegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 iconShouldAllowTap:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_iconEditingSettings == a3) {
    [(SBIconView *)self _applyIconEditingSettings];
  }
}

- (void)setAllowsProgressState:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 548);
  if (((((v3 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 64;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 548) = v3 & 0xBF | v5;
    if (a3)
    {
      id v7 = [(SBIconView *)self window];
      if (v7) {
        BOOL v6 = [(SBIcon *)self->_icon shouldAnimateProgress];
      }
      else {
        BOOL v6 = 0;
      }
      [(SBIconView *)self _updateProgressAnimated:v6];
    }
    else
    {
      -[SBIconView _updateProgressAnimated:](self, "_updateProgressAnimated:");
    }
  }
}

- (void)_backgroundContrastDidChange:(id)a3
{
  [(SBIconLabelView *)self->_labelView removeFromSuperview];
  labelView = self->_labelView;
  self->_labelView = 0;

  [(SBIconView *)self _updateLabel];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  [(SBIconView *)self _updateLabelArea];
  [(SBIconView *)self dismissContextMenuWithCompletion:0];
}

- (void)_boldTextStatusDidChange:(id)a3
{
  [(SBIconView *)self _updateLabelArea];
  [(SBIconView *)self _updateAccessoryViewAnimated:0];
}

- (void)_refreshAccessoryViewNotification:(id)a3
{
}

- (BOOL)isFolderIconFrozen
{
  return (*((unsigned __int8 *)self + 548) >> 3) & 1;
}

- (unint64_t)visibleMiniIconCount
{
  id v2 = [(SBIconView *)self _folderIconImageView];
  unint64_t v3 = [v2 visibleMiniIconCount];

  return v3;
}

- (unint64_t)firstVisibleMiniIconIndex
{
  id v2 = [(SBIconView *)self _folderIconImageView];
  unint64_t v3 = [v2 firstVisibleMiniIconIndex];

  return v3;
}

- (unint64_t)centerVisibleMiniIconIndex
{
  id v2 = [(SBIconView *)self _folderIconImageView];
  unint64_t v3 = [v2 centerVisibleMiniIconIndex];

  return v3;
}

- (unint64_t)lastVisibleMiniIconIndex
{
  id v2 = [(SBIconView *)self _folderIconImageView];
  unint64_t v3 = [v2 lastVisibleMiniIconIndex];

  return v3;
}

- (CGRect)frameForMiniIconAtIndex:(unint64_t)a3
{
  char v5 = [(SBIconView *)self _folderIconImageView];
  [v5 frameForMiniIconAtIndex:a3];
  -[SBIconView convertRect:fromView:](self, "convertRect:fromView:", v5);
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
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)visibleImageRelativeFrameForMiniIconAtIndex:(unint64_t)a3
{
  char v5 = [(SBIconView *)self _folderIconImageView];
  [v5 visibleImageRelativeFrameForMiniIconAtIndex:a3];
  CGFloat x = v6;
  CGFloat y = v8;
  CGFloat width = v10;
  CGFloat height = v12;

  [(SBIconView *)self iconContentScale];
  CGFloat v15 = v14;
  if ((BSFloatIsOne() & 1) == 0)
  {
    CGAffineTransformMakeScale(&v20, v15, v15);
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRect v22 = CGRectApplyAffineTransform(v21, &v20);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)scrollToFirstGapAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBIconView *)self _folderIconImageView];
  [v4 scrollToFirstGapAnimated:v3];
}

- (void)scrollToTopOfPage:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SBIconView *)self _folderIconImageView];
  [v6 scrollToTopOfPage:a3 animated:v4];
}

- (void)scrollToGapOrTopIfFullOfPage:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SBIconView *)self _folderIconImageView];
  [v6 scrollToGapOrTopIfFullOfPage:a3 animated:v4];
}

- (BOOL)isAnimatingScrolling
{
  id v2 = [(SBIconView *)self _folderIconImageView];
  char v3 = [v2 isAnimating];

  return v3;
}

- (void)setIconGridImageAlpha:(double)a3
{
  id v4 = [(SBIconView *)self _folderIconImageView];
  [v4 setIconGridImageAlpha:a3];
}

- (void)setBackgroundAndIconGridImageAlpha:(double)a3
{
  id v4 = [(SBIconView *)self _folderIconImageView];
  [v4 setBackgroundAndIconGridImageAlpha:a3];
}

- (id)prepareForIconDrop
{
  return [(SBIconView *)self disableImageUpdatesForReason:@"IconDrop"];
}

- (void)prepareToCrossfadeWithFloatyFolderView:(id)a3 allowFolderInteraction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(SBIconView *)self setAllowsEditingAnimation:0];
  id v7 = [(SBIconView *)self _folderIconImageView];
  [v7 prepareToCrossfadeWithFloatyFolderView:v6 allowFolderInteraction:v4];
}

- (void)setFloatyFolderCrossfadeFraction:(double)a3
{
  char v5 = [(SBIconView *)self _folderIconImageView];
  [v5 setFloatyFolderCrossfadeFraction:a3];

  double v6 = 1.0 - a3;
  [(SBIconView *)self setIconAccessoryAlpha:v6];
  [(SBIconView *)self setIconLabelAlpha:v6];
}

- (void)cleanupAfterFloatyFolderCrossfade
{
  [(SBIconView *)self setAllowsEditingAnimation:1];
  [(SBIconView *)self setFloatyFolderCrossfadeFraction:0.0];
  id v3 = [(SBIconView *)self _folderIconImageView];
  [v3 cleanupAfterFloatyFolderCrossfade];
}

- (id)succinctDescription
{
  id v2 = [(SBIconView *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (void)iconImageDidUpdate:(id)a3
{
  BOOL v4 = (SBIcon *)a3;
  BSDispatchQueueAssertMain();
  icon = self->_icon;

  if (icon == v4)
  {
    [(SBIconView *)self _updateIconImageViewAnimated:0];
    [(SBIconView *)self _updateBrightness];
  }
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  char v5 = (void *)MEMORY[0x1E4F4B7E0];
  id v6 = a3;
  id v7 = [(SBIconView *)self icon];
  double v8 = [v7 applicationBundleID];
  double v9 = [v5 applicationWithBundleIdentifier:v8];
  int v10 = [v6 containsObject:v9];

  if (v10)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SBIconView_appProtectionSubjectsChanged_forSubscription___block_invoke;
    block[3] = &unk_1E6AAC810;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __59__SBIconView_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchApplicationShortcutItemsIfAppropriate];
}

- (void)startForbiddingEditingModeWithReason:(id)a3
{
  id v4 = a3;
  forbidEditingModeReasons = self->_forbidEditingModeReasons;
  id v8 = v4;
  if (!forbidEditingModeReasons)
  {
    id v6 = [MEMORY[0x1E4F28BD0] set];
    id v7 = self->_forbidEditingModeReasons;
    self->_forbidEditingModeReasons = v6;

    id v4 = v8;
    forbidEditingModeReasons = self->_forbidEditingModeReasons;
  }
  [(NSCountedSet *)forbidEditingModeReasons addObject:v4];
  [(SBIconView *)self _applyEditingStateAnimated:1];
}

- (void)endForbiddingEditingModeWithReason:(id)a3
{
  id v4 = a3;
  forbidEditingModeReasons = self->_forbidEditingModeReasons;
  if (forbidEditingModeReasons)
  {
    id v8 = v4;
    int v6 = [(NSCountedSet *)forbidEditingModeReasons containsObject:v4];
    id v4 = v8;
    if (v6)
    {
      [(NSCountedSet *)self->_forbidEditingModeReasons removeObject:v8];
      if (![(NSCountedSet *)self->_forbidEditingModeReasons count])
      {
        id v7 = self->_forbidEditingModeReasons;
        self->_forbidEditingModeReasons = 0;
      }
      [(SBIconView *)self _applyEditingStateAnimated:1];
      id v4 = v8;
    }
  }
}

- (id)startForbiddingAccessoryUpdatesWithReason:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v15[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_forbidAccessoryUpdatesAssertions)
  {
    id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    forbidAccessoryUpdatesAssertions = self->_forbidAccessoryUpdatesAssertions;
    self->_forbidAccessoryUpdatesAssertions = v7;
  }
  double v9 = [SBIconViewAssertion alloc];
  v14[0] = @"reason";
  v14[1] = @"animated";
  v15[0] = v6;
  int v10 = [NSNumber numberWithBool:v4];
  v15[1] = v10;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  double v12 = [(SBIconViewAssertion *)v9 initWithAssertionType:1 iconView:self extraInfo:v11];

  [(NSHashTable *)self->_forbidAccessoryUpdatesAssertions addObject:v12];
  [(SBIconView *)self _updateAccessoryViewAnimated:v4];

  return v12;
}

- (void)removeForbidAccessoryUpdatesAssertion:(id)a3
{
  id v4 = a3;
  char v5 = [v4 extraInfo];
  id v6 = [v5 objectForKey:@"animated"];
  uint64_t v7 = [v6 BOOLValue];

  [(NSHashTable *)self->_forbidAccessoryUpdatesAssertions removeObject:v4];
  if (![(NSHashTable *)self->_forbidAccessoryUpdatesAssertions count])
  {
    forbidAccessoryUpdatesAssertions = self->_forbidAccessoryUpdatesAssertions;
    self->_forbidAccessoryUpdatesAssertions = 0;
  }
  [(SBIconView *)self _updateAccessoryViewAnimated:v7];
}

- (BOOL)_selfOrCustomViewCanBecomeFocused
{
  id v3 = [(SBIconView *)self behaviorDelegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 iconViewCanBecomeFocused:self]) {
    BOOL v4 = ![(NSString *)self->_iconLocation isEqualToString:@"SBIconLocationNone"];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)canBecomeFocused
{
  return !self->_focusProxyView
      && [(SBIconView *)self _selfOrCustomViewCanBecomeFocused];
}

- (BOOL)focusProxyCanBecomeFocused
{
  return self->_focusProxyView
      && [(SBIconView *)self _selfOrCustomViewCanBecomeFocused];
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v17 = a3;
  focusProxyView = self->_focusProxyView;
  if (!focusProxyView) {
    focusProxyView = self;
  }
  id v6 = focusProxyView;
  id v7 = [v17 nextFocusedItem];

  if (v7 == v6)
  {
    double v9 = [(SBIconView *)self behaviorDelegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v9 focusEffectTypeForIconView:self];
      if (v10 == 1)
      {
        [(SBIconView *)self setFocusEffect:0];
        [(SBIconView *)self setupFocusEffectPlatterView];
        [(SBIconView *)self setShowsFocusEffect:1];
      }
      else if (!v10)
      {
        [(SBIconView *)self iconImageInfo];
        double v11 = (void *)MEMORY[0x1E4FB1788];
        CGFloat v15 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v12, v13, v14);
        double v16 = [v11 effectWithPath:v15];

        [v16 setPosition:1];
        [(SBIconView *)self setFocusEffect:v16];
      }
    }
  }
  else
  {
    id v8 = [v17 previouslyFocusedItem];

    if (v8 == v6 && self->_focusEffectPlatterView) {
      [(SBIconView *)self setShowsFocusEffect:0];
    }
  }
}

- (void)setupFocusEffectPlatterView
{
  if (!self->_focusEffectPlatterView)
  {
    id v3 = [SBIconFocusEffectPlatterView alloc];
    [(SBIconView *)self _focusEffectBoundsForFocused:1 withFocusOutset:6.05];
    BOOL v4 = -[SBIconFocusEffectPlatterView initWithFrame:](v3, "initWithFrame:");
    [(SBIconFocusEffectPlatterView *)v4 setAlpha:0.0];
    [(SBIconView *)self _focusEffectCenter];
    -[SBIconFocusEffectPlatterView setCenter:](v4, "setCenter:");
    [(SBIconView *)self iconImageCornerRadius];
    [(SBIconFocusEffectPlatterView *)v4 _setContinuousCornerRadius:v5 + 6.05];
    [(SBIconFocusEffectPlatterView *)v4 layoutIfNeeded];
    id v6 = [(SBIconView *)self contentContainerView];
    id v7 = [(SBIconView *)self currentImageView];
    [v6 insertSubview:v4 belowSubview:v7];

    focusEffectPlatterView = self->_focusEffectPlatterView;
    self->_focusEffectPlatterView = v4;
  }
}

- (BOOL)wantsFocusProxyView
{
  return (*((unsigned __int8 *)self + 551) >> 3) & 1;
}

- (void)setWantsFocusProxyView:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 551);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 8;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 551) = v3 & 0xF7 | v5;
    focusProxyView = self->_focusProxyView;
    if (a3)
    {
      if (focusProxyView) {
        return;
      }
      id v7 = [[SBHFocusProxyView alloc] initWithProxyableView:self];
      id v8 = self->_focusProxyView;
      self->_focusProxyView = (UIFocusItem *)v7;

      uint64_t v10 = [(SBIconView *)self superview];
      [v10 insertSubview:self->_focusProxyView belowSubview:self];
      double v9 = (UIFocusItem *)v10;
    }
    else
    {
      if (!focusProxyView) {
        return;
      }
      [(UIFocusItem *)focusProxyView removeFromSuperview];
      double v9 = self->_focusProxyView;
      self->_focusProxyView = 0;
    }
  }
}

- (BOOL)lastContextMenuInteractionFailedToLoad
{
  return self->_lastContextMenuInteractionFailedToLoad;
}

- (SBIconViewDragDelegate)overrideDraggingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrideDraggingDelegate);
  return (SBIconViewDragDelegate *)WeakRetained;
}

- (NSArray)applicationShortcutItems
{
  return self->_applicationShortcutItems;
}

- (void)setApplicationShortcutItems:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (double)editingAnimationStrength
{
  return self->_editingAnimationStrength;
}

- (UIEdgeInsets)cursorHitTestPadding
{
  double top = self->_cursorHitTestPadding.top;
  double left = self->_cursorHitTestPadding.left;
  double bottom = self->_cursorHitTestPadding.bottom;
  double right = self->_cursorHitTestPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSDate)lastTouchDownDate
{
  return self->_lastTouchDownDate;
}

- (BOOL)showsImageAndLabelDuringDrop
{
  return self->_showsImageAndLabelDuringDrop;
}

- (void)setLabelFont:(id)a3
{
}

- (unint64_t)customIconImageViewControllerPriority
{
  return self->_customIconImageViewControllerPriority;
}

- (void)setFolderIcon:(id)a3
{
}

- (void)setFolderIconBackgroundView:(id)a3
{
}

- (void)setAccessibilityTintColor:(id)a3
{
}

- (unint64_t)debugIconIndex
{
  return self->_debugIconIndex;
}

- (void)setIconImageSizeMatchesBoundsSize:(BOOL)a3
{
  self->_iconImageSizeMatchesBoundsSize = a3;
}

- (SBIconApproximateLayoutPosition)approximateLayoutPosition
{
  p_approximateLayoutPosition = &self->_approximateLayoutPosition;
  unint64_t horizontal = self->_approximateLayoutPosition.horizontal;
  unint64_t vertical = p_approximateLayoutPosition->vertical;
  result.unint64_t vertical = vertical;
  result.unint64_t horizontal = horizontal;
  return result;
}

- (UIView)focusProxyView
{
  return (UIView *)self->_focusProxyView;
}

- (APSubjectMonitorSubscription)appPrototectionSubjectMonitorSubscription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPrototectionSubjectMonitorSubscription);
  return (APSubjectMonitorSubscription *)WeakRetained;
}

- (void)setAppPrototectionSubjectMonitorSubscription:(id)a3
{
}

- (UIPointerInteraction)iconViewCursorInteraction
{
  return self->_iconViewCursorInteraction;
}

- (UIPointerInteraction)closeBoxCursorInteraction
{
  return self->_closeBoxCursorInteraction;
}

- (UIPointerInteraction)accessoryViewCursorInteraction
{
  return self->_accessoryViewCursorInteraction;
}

- (UIPointerInteraction)resizeHandleCursorInteraction
{
  return self->_resizeHandleCursorInteraction;
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (UIDragSession)liftingDragSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_liftingDragSession);
  return (UIDragSession *)WeakRetained;
}

- (int64_t)displayedLabelAccessoryType
{
  return self->_displayedLabelAccessoryType;
}

- (UILongPressGestureRecognizer)editingModeGestureRecognizer
{
  return self->_editingModeGestureRecognizer;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setCurrentConfigurationInteraction:(id)a3
{
}

- (void)setCurrentStackConfigurationInteraction:(id)a3
{
}

- (void)setCloseBoxAnimator:(id)a3
{
}

- (NSArray)fetchedApplicationShortcutItems
{
  return self->_fetchedApplicationShortcutItems;
}

- (void)setBorrowedIconImageViewAssertion:(id)a3
{
}

- (SBHIconResizeHandle)resizeHandle
{
  return self->_resizeHandle;
}

- (void)setResizeHandle:(id)a3
{
}

- (BSInvalidatable)springBoardIconStyleObservation
{
  return self->_springBoardIconStyleObservation;
}

- (void)setSpringBoardIconStyleObservation:(id)a3
{
}

- (SBHIconImageStyleConfiguration)springBoardIconImageStyleConfiguration
{
  return self->_springBoardIconImageStyleConfiguration;
}

- (void)setSpringBoardIconImageStyleConfiguration:(id)a3
{
}

- (SBIconViewResizeGestureHandling)resizeGestureHandler
{
  return self->_resizeGestureHandler;
}

- (void)setWindowSceneUserInterfaceStyleChangeRegistration:(id)a3
{
}

void __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Could not launch application with application shortcut item: %{public}@, error: %{public}@.", (uint8_t *)&v4, 0x16u);
}

- (void)_contextMenuInteraction:(uint64_t)a3 previewForIconWithConfigurationOptions:(uint64_t)a4 highlighted:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_contextMenuInteraction:(uint64_t)a3 previewForIconWithConfigurationOptions:(uint64_t)a4 highlighted:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_contextMenuInteraction:(uint64_t)a3 previewForIconWithConfigurationOptions:(uint64_t)a4 highlighted:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)closeBoxTypeForView:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Bad view passed into closeBoxTypeForView: %@", (uint8_t *)&v2, 0xCu);
}

@end