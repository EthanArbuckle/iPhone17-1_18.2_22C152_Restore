@interface SFUnifiedTabBarItemView
- (BOOL)_availabilityButtonsReplaceFormatMenuButton;
- (BOOL)_coalescingAccessoryButtonUpdates;
- (BOOL)_commandPressed;
- (BOOL)_hasRoomForIconAndCloseButton;
- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4;
- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (BOOL)_scribbleInteractionIsEnabled:(id)a3;
- (BOOL)_shouldUseActiveTheme;
- (BOOL)_showsAccessoryButtonOfType:(int64_t)a3;
- (BOOL)_showsCloseButtonOnHover;
- (BOOL)_showsFormatMenuButtonAccessories;
- (BOOL)canBecomeFocused;
- (BOOL)hasFocusedSensitiveInputField;
- (BOOL)hasHiddenElements;
- (BOOL)isActive;
- (BOOL)isUnread;
- (BOOL)menuButtonSelected;
- (BOOL)showsBadgeOnExtensionsButton;
- (BOOL)showsCloseButton;
- (BOOL)showsLockIcon;
- (BOOL)showsPersistentStopReloadButton;
- (BOOL)showsPinnedIndicator;
- (BOOL)showsReaderIcon;
- (BOOL)showsSearchField;
- (BOOL)showsSearchIcon;
- (BOOL)showsSecurityAnnotation;
- (BOOL)showsSiriReaderPlayingIcon;
- (BOOL)showsSquishedAccessoryViews;
- (BOOL)showsStopReloadButton;
- (BOOL)showsTranslationIcon;
- (BOOL)showsVoiceSearchButton;
- (BOOL)stopReloadButtonShowsStop;
- (NSArray)shareParticipants;
- (NSDate)lastReloadDate;
- (NSString)textWhenExpanded;
- (NSString)title;
- (NSString)titleTextStyle;
- (NSString)titleWhenActive;
- (SFMenuConfiguring)formatMenuButtonConfigurator;
- (SFURLFieldOverlayConfiguration)overlayConfiguration;
- (SFURLFieldOverlayConfiguration)overlayNarrowConfiguration;
- (SFUnifiedTabBarItemTitleContainerView)squishedTitleContainer;
- (SFUnifiedTabBarItemView)initWithFrame:(CGRect)a3;
- (SFUnifiedTabBarItemViewDelegate)delegate;
- (SFWebExtensionButtonConfiguration)extensionButtonConfiguration;
- (UIButton)firstExtensionButton;
- (UIButton)multipleExtensionsButton;
- (UIButton)secondExtensionButton;
- (UIImage)icon;
- (UITextField)searchField;
- (UIView)menuPopoverSourceView;
- (double)_closeButtonAlphaForSquishedInset;
- (double)_heightForAccessoryButtonOfType:(int64_t)a3 withWidth:(double)a4 defaultHeight:(double)a5;
- (double)_insetForAccessoryButtonOfType:(int64_t)a3;
- (double)_layOutIndexes:(id)a3 ofAccessoryButtonTypes:(id)a4 alongEdge:(int64_t)a5 usingPresentationSize:(BOOL)a6;
- (double)_scaleForTransitioningAccessoryButtonOfType:(int64_t)a3;
- (double)_spacingBetweenAccessoryButtonOfType:(int64_t)a3 andButtonOfType:(int64_t)a4;
- (double)_squishedInsetToHideCloseButton;
- (double)_squishedInsetToHideTrailingButtons;
- (double)_widthForAccessoryButtonOfType:(int64_t)a3;
- (id)_accessoryButtonConfigurationWithImage:(id)a3 scale:(int64_t)a4;
- (id)_accessoryButtonTintColor;
- (id)_closeButtonConfiguration;
- (id)_controlsTintColor;
- (id)_makeAccessoryButtonWithImage:(id)a3 action:(SEL)a4;
- (id)_makeAccessoryButtonWithImage:(id)a3 scale:(int64_t)a4 action:(SEL)a5;
- (id)_makeMediaStateMuteButton;
- (id)_progressBarTintColor;
- (id)_searchFieldTintColor;
- (id)_secondaryAccessoryButtonTintColor;
- (id)_titleTheme;
- (id)_viewForAccessoryButtonOfType:(int64_t)a3;
- (id)availabilityDisplayController:(id)a3 determineBestLabelsForPresentation:(id)a4;
- (id)makeReaderAvailabilityAction;
- (id)makeTranslationAvailabilityAction;
- (id)pointerRegionIdentifierForInteractionLocation:(CGPoint)a3;
- (id)test_reloadButtonExpirationTimer;
- (int64_t)_iconVisibility;
- (int64_t)accessoryButtonLayout;
- (int64_t)contentAlignment;
- (int64_t)lockIconEdge;
- (int64_t)securityAnnotation;
- (unint64_t)_individualExtensionButtonLimit;
- (unint64_t)mediaStateIcon;
- (unint64_t)menuButtonBadges;
- (unint64_t)startIndexOfTitleInTextWhenExpanded;
- (void)_closeButtonTapped;
- (void)_extensionButtonTapped:(id)a3;
- (void)_hover:(id)a3;
- (void)_layOutAccessoryButtons;
- (void)_layOutTitleContainer;
- (void)_layOutTitleContainerMask;
- (void)_mediaStateMuteButtonTapped;
- (void)_menuButtonClicked;
- (void)_menuButtonReceivedTouchDown;
- (void)_menuButtonTapped;
- (void)_readerButtonTapped;
- (void)_reloadButtonTapped;
- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4;
- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6;
- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
- (void)_setIndexes:(id)a3 ofAccessoryButtonTypes:(id)a4 visible:(BOOL)a5 animated:(BOOL)a6;
- (void)_setNeedsAnimatedAccessoryButtonUpdate;
- (void)_setTitleContainerMasked:(BOOL)a3;
- (void)_setTrailingButtonsHidden:(BOOL)a3;
- (void)_startReloadButtonExpirationTimer;
- (void)_stopAccessoryButtonUpdateTimer;
- (void)_stopButtonTapped;
- (void)_stopReloadButtonExpirationTimer;
- (void)_temporarilyCoalesceAccessoryButtonUpdates;
- (void)_translationButtonTapped;
- (void)_updateAccessoryButtons;
- (void)_updateAccessoryButtonsAnimated:(BOOL)a3 completion:(id)a4;
- (void)_updateBadges;
- (void)_updateCloseButtonForHoverPosition;
- (void)_updateExtensionButtonConfigurationShowingOverflow:(BOOL)a3 activeExtensionCount:(unint64_t)a4;
- (void)_updateFormatMenuButtonAccessories;
- (void)_updateFormatMenuButtonImage;
- (void)_updateFormatMenuButtonStyle;
- (void)_updateMediaStateMuteButton;
- (void)_updateMenuButtonColor;
- (void)_updateProgressViewColor;
- (void)_updateShowsProgressView;
- (void)_voiceSearchAvailabilityDidChange:(id)a3;
- (void)_voiceSearchButtonTapped;
- (void)applyTheme;
- (void)availabilityDisplayController:(id)a3 didUpdateWithState:(int64_t)a4;
- (void)beginTransitioningSearchField;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)endTransitioningSearchField;
- (void)fluidProgressViewDidShowProgress:(id)a3;
- (void)fluidProgressViewWillShowProgress:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessoryButtonLayout:(int64_t)a3;
- (void)setActive:(BOOL)a3;
- (void)setContentAlignment:(int64_t)a3;
- (void)setContentOptions:(unint64_t)a3 resetDisplay:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDownloadProgress:(double)a3 animated:(BOOL)a4;
- (void)setExtensionButtonConfiguration:(id)a3;
- (void)setFluidProgressController:(id)a3 withCurrentState:(id)a4;
- (void)setFormatMenuButtonConfigurator:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHasFocusedSensitiveInputField:(BOOL)a3;
- (void)setHasHiddenElements:(BOOL)a3;
- (void)setHovering:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setLastReloadDate:(id)a3;
- (void)setLockIconEdge:(int64_t)a3;
- (void)setMediaStateIcon:(unint64_t)a3;
- (void)setMenuButtonBadges:(unint64_t)a3;
- (void)setMenuButtonSelected:(BOOL)a3;
- (void)setOverlayConfiguration:(id)a3;
- (void)setOverlayNarrowConfiguration:(id)a3;
- (void)setPlatterStyle:(int64_t)a3;
- (void)setSearchField:(id)a3;
- (void)setSecurityAnnotation:(int64_t)a3;
- (void)setShareParticipants:(id)a3;
- (void)setShowsBadgeOnExtensionsButton:(BOOL)a3;
- (void)setShowsCloseButton:(BOOL)a3;
- (void)setShowsLockIcon:(BOOL)a3;
- (void)setShowsPinnedIndicator:(BOOL)a3;
- (void)setShowsReaderIcon:(BOOL)a3;
- (void)setShowsSearchField:(BOOL)a3;
- (void)setShowsSearchIcon:(BOOL)a3;
- (void)setShowsSiriReaderPlayingIcon:(BOOL)a3;
- (void)setShowsSquishedAccessoryViews:(BOOL)a3;
- (void)setShowsStopReloadButton:(BOOL)a3;
- (void)setShowsTranslationIcon:(BOOL)a3;
- (void)setShowsVoiceSearchButton:(BOOL)a3;
- (void)setSquishedInset:(double)a3;
- (void)setSquishedTitleContainer:(id)a3;
- (void)setStartIndexOfTitleInTextWhenExpanded:(unint64_t)a3;
- (void)setStopReloadButtonShowsStop:(BOOL)a3;
- (void)setTextWhenExpanded:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleTextStyle:(id)a3;
- (void)setTitleWhenActive:(id)a3;
- (void)setUnread:(BOOL)a3;
- (void)tintColorDidChange;
- (void)updateAccessibilityIdentifier;
- (void)updateCornerRadius;
- (void)updateTitleWhenCollapsedWithItemTitles:(id)a3;
@end

@implementation SFUnifiedTabBarItemView

- (SFUnifiedTabBarItemView)initWithFrame:(CGRect)a3
{
  v97.receiver = self;
  v97.super_class = (Class)SFUnifiedTabBarItemView;
  v3 = -[SFUnifiedBarItemView initWithFrame:](&v97, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SFUnifiedTabBarItemView *)v3 setPlatterStyle:1];
    [(SFUnifiedTabBarItemView *)v4 setFocusGroupIdentifier:0];
    v5 = [(SFUnifiedBarItemView *)v4 contentView];
    v94 = [(SFUnifiedTabBarItemView *)v4 _closeButtonConfiguration];
    uint64_t v6 = +[SFUnifiedTabBarItemViewCloseButton buttonWithConfiguration:v94 primaryAction:0];
    closeButton = v4->_closeButton;
    v4->_closeButton = (SFUnifiedTabBarItemViewCloseButton *)v6;

    [(SFUnifiedTabBarItemViewCloseButton *)v4->_closeButton addTarget:v4 action:sel__closeButtonTapped forControlEvents:0x2000];
    [(UIView *)v4->_closeButton sf_applyContentSizeCategoryLimitsForToolbarButton];
    v8 = v4->_closeButton;
    v9 = [v94 image];
    v10 = _WBSLocalizedString();
    [(UIView *)v8 sf_configureLargeContentViewerWithImage:v9 title:v10];

    v11 = v4->_closeButton;
    id v12 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(SFUnifiedTabBarItemViewCloseButton *)v11 addInteraction:v12];

    v13 = [MEMORY[0x1E4FB1818] imageNamed:@"xmark.noshape"];
    v14 = [(SFUnifiedTabBarItemView *)v4 _accessoryButtonConfigurationWithImage:v13 scale:2];
    uint64_t v15 = +[SFUnifiedTabBarItemViewCloseButton buttonWithConfiguration:v14 primaryAction:0];
    closeButtonForHover = v4->_closeButtonForHover;
    v4->_closeButtonForHover = (SFUnifiedTabBarItemViewCloseButton *)v15;

    [(SFUnifiedTabBarItemViewCloseButton *)v4->_closeButtonForHover addTarget:v4 action:sel__closeButtonTapped forControlEvents:0x2000];
    [(UIView *)v4->_closeButtonForHover sf_applyContentSizeCategoryLimitsForToolbarButton];
    [v5 addSubview:v4->_closeButtonForHover];
    [v5 addSubview:v4->_closeButton];
    v17 = [[SFUnifiedTabBarItemTitleContainerView alloc] initWithAlignment:0];
    titleContainer = v4->_titleContainer;
    v4->_titleContainer = v17;

    [(SFUnifiedTabBarItemTitleContainerView *)v4->_titleContainer setShowsIcon:1];
    [(SFUnifiedTabBarItemTitleContainerView *)v4->_titleContainer setTitleTextStyle:*MEMORY[0x1E4FB2950]];
    [v5 addSubview:v4->_titleContainer];
    v19 = objc_alloc_init(SFMoreMenuButton);
    moreMenuButton = v4->_moreMenuButton;
    v4->_moreMenuButton = v19;

    [(SFMoreMenuButton *)v4->_moreMenuButton setIconFilled:1];
    -[SFMoreMenuButton setContentInsets:](v4->_moreMenuButton, "setContentInsets:", 6.0, 6.0, 6.0, 6.0);
    [(UIView *)v4->_moreMenuButton sf_applyContentSizeCategoryLimitsForToolbarButton];
    [(UIView *)v4->_moreMenuButton sf_configureLargeContentViewerForBarItem:5];
    v21 = v4->_moreMenuButton;
    id v22 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(SFMoreMenuButton *)v21 addInteraction:v22];

    [(SFMoreMenuButton *)v4->_moreMenuButton addTarget:v4 action:sel__menuButtonTapped forControlEvents:0x2000];
    [(SFMoreMenuButton *)v4->_moreMenuButton addTarget:v4 action:sel__menuButtonReceivedTouchDown forControlEvents:1];
    [(SFMoreMenuButton *)v4->_moreMenuButton addTarget:v4 action:sel__menuButtonClicked forControlEvents:0x1000000];
    objc_storeStrong((id *)&v4->_menuButton, v4->_moreMenuButton);
    v23 = objc_alloc_init(SFBadgeContainerView);
    moreMenuButtonContainer = v4->_moreMenuButtonContainer;
    v4->_moreMenuButtonContainer = v23;

    [(SFBadgeContainerView *)v4->_moreMenuButtonContainer setPositionsBadgeRelativeToLayoutMargins:1];
    [(SFBadgeContainerView *)v4->_moreMenuButtonContainer setContentView:v4->_moreMenuButton];
    [v5 addSubview:v4->_moreMenuButtonContainer];
    v25 = [SFNavigationBarToggleButton alloc];
    v26 = +[SFNavigationBarToggleButton pageMenuImageWithIntelligence:0];
    uint64_t v27 = [(SFNavigationBarToggleButton *)v25 initWithImage:v26 forInputMode:0];
    formatMenuButton = v4->_formatMenuButton;
    v4->_formatMenuButton = (SFNavigationBarToggleButton *)v27;

    [(SFNavigationBarToggleButton *)v4->_formatMenuButton setMinimumSideMargin:6.0];
    v29 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8]];
    [(SFNavigationBarToggleButton *)v4->_formatMenuButton setPreferredSymbolConfiguration:v29];

    [(SFClickableButton *)v4->_formatMenuButton setClickEnabled:1];
    v30 = [(SFNavigationBarToggleButton *)v4->_formatMenuButton pointerInteraction];
    [v30 setEnabled:0];

    [(SFNavigationBarToggleButton *)v4->_formatMenuButton setPointerPreviewContainer:v4];
    [(UIView *)v4->_formatMenuButton sf_applyContentSizeCategoryLimitsForToolbarButton];
    [(UIView *)v4->_formatMenuButton sf_configureLargeContentViewerForBarItem:13];
    v31 = v4->_formatMenuButton;
    id v32 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(SFNavigationBarToggleButton *)v31 addInteraction:v32];

    [(SFNavigationBarToggleButton *)v4->_formatMenuButton addTarget:v4 action:sel__menuButtonTapped forControlEvents:0x2000];
    [(SFNavigationBarToggleButton *)v4->_formatMenuButton addTarget:v4 action:sel__menuButtonReceivedTouchDown forControlEvents:1];
    [(SFNavigationBarToggleButton *)v4->_formatMenuButton addTarget:v4 action:sel__menuButtonClicked forControlEvents:0x1000000];
    v33 = [(SFUnifiedBarItemView *)v4 contentView];
    [v33 addSubview:v4->_formatMenuButton];

    v34 = [MEMORY[0x1E4FB1818] systemImageNamed:@"mic.fill"];
    uint64_t v35 = [(SFUnifiedTabBarItemView *)v4 _makeAccessoryButtonWithImage:v34 action:sel__voiceSearchButtonTapped];
    voiceSearchButton = v4->_voiceSearchButton;
    v4->_voiceSearchButton = (UIButton *)v35;

    [(UIButton *)v4->_voiceSearchButton _setDisableDictationTouchCancellation:1];
    v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v37 addObserver:v4 selector:sel__voiceSearchAvailabilityDidChange_ name:@"SFVoiceSearchAvailabilityDidChangeNotification" object:0];

    v4->_needsVoiceSearchAvailabilityUpdate = 1;
    v38 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.clockwise"];
    uint64_t v39 = [(SFUnifiedTabBarItemView *)v4 _makeAccessoryButtonWithImage:v38 action:sel__reloadButtonTapped];
    reloadButton = v4->_reloadButton;
    v4->_reloadButton = (UIButton *)v39;

    [(UIButton *)v4->_reloadButton sf_configureLargeContentViewerForBarItem:15];
    v41 = v4->_reloadButton;
    id v42 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(UIButton *)v41 addInteraction:v42];

    double v43 = _SFOnePixel();
    v44 = v4->_reloadButton;
    v45 = [(UIButton *)v44 configuration];
    [v45 contentInsets];
    [v45 setContentInsets:v43 + v46];
    [(UIButton *)v44 setConfiguration:v45];

    v47 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
    uint64_t v48 = [(SFUnifiedTabBarItemView *)v4 _makeAccessoryButtonWithImage:v47 action:sel__stopButtonTapped];
    stopButton = v4->_stopButton;
    v4->_stopButton = (UIButton *)v48;

    v50 = v4->_stopButton;
    id v51 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(UIButton *)v50 addInteraction:v51];

    [(UIButton *)v4->_stopButton sf_configureLargeContentViewerForBarItem:14];
    uint64_t v52 = [(SFUnifiedTabBarItemView *)v4 _makeMediaStateMuteButton];
    mediaStateMuteButton = v4->_mediaStateMuteButton;
    v4->_mediaStateMuteButton = (UIButton *)v52;

    v54 = objc_alloc_init(_SFFluidProgressView);
    progressView = v4->_progressView;
    v4->_progressView = v54;

    [(_SFFluidProgressView *)v4->_progressView setDelegate:v4];
    [(SFUnifiedTabBarItemView *)v4 _updateProgressViewColor];
    [(SFUnifiedTabBarItemView *)v4 _updateShowsProgressView];
    v56 = [(SFUnifiedBarItemView *)v4 contentView];
    [v56 addSubview:v4->_progressView];

    id v57 = objc_alloc_init(MEMORY[0x1E4F38E40]);
    [v57 setDelegate:v4];
    [v57 setElementSource:v4];
    [(SFUnifiedTabBarItemView *)v4 addInteraction:v57];
    v58 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    firstExtensionButton = v4->_firstExtensionButton;
    v4->_firstExtensionButton = v58;

    [(UIButton *)v4->_firstExtensionButton addTarget:v4 action:sel__extensionButtonTapped_ forControlEvents:0x2000];
    UIEdgeInsetsMakeWithEdges();
    [(UIButton *)v4->_firstExtensionButton setLayoutMargins:"setLayoutMargins:"];
    [(UIButton *)v4->_firstExtensionButton sf_configureLargeContentViewerWithImage:0 title:0];
    v60 = v4->_firstExtensionButton;
    id v61 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(UIButton *)v60 addInteraction:v61];

    v62 = objc_alloc_init(SFBadgeContainerView);
    firstExtensionButtonContainer = v4->_firstExtensionButtonContainer;
    v4->_firstExtensionButtonContainer = v62;

    [(SFBadgeContainerView *)v4->_firstExtensionButtonContainer setPositionsBadgeRelativeToLayoutMargins:1];
    [(SFBadgeContainerView *)v4->_firstExtensionButtonContainer setContentView:v4->_firstExtensionButton];
    [v5 addSubview:v4->_firstExtensionButtonContainer];
    v64 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    secondExtensionButton = v4->_secondExtensionButton;
    v4->_secondExtensionButton = v64;

    [(UIButton *)v4->_secondExtensionButton addTarget:v4 action:sel__extensionButtonTapped_ forControlEvents:0x2000];
    UIEdgeInsetsMakeWithEdges();
    [(UIButton *)v4->_secondExtensionButton setLayoutMargins:"setLayoutMargins:"];
    [(UIButton *)v4->_secondExtensionButton sf_configureLargeContentViewerWithImage:0 title:0];
    v66 = v4->_secondExtensionButton;
    id v67 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(UIButton *)v66 addInteraction:v67];

    v68 = objc_alloc_init(SFBadgeContainerView);
    secondExtensionButtonContainer = v4->_secondExtensionButtonContainer;
    v4->_secondExtensionButtonContainer = v68;

    [(SFBadgeContainerView *)v4->_secondExtensionButtonContainer setPositionsBadgeRelativeToLayoutMargins:1];
    [(SFBadgeContainerView *)v4->_secondExtensionButtonContainer setContentView:v4->_secondExtensionButton];
    [v5 addSubview:v4->_secondExtensionButtonContainer];
    v70 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    multipleExtensionsButton = v4->_multipleExtensionsButton;
    v4->_multipleExtensionsButton = v70;

    [(UIButton *)v4->_multipleExtensionsButton sf_applyContentSizeCategoryLimitsForToolbarButton];
    [(UIButton *)v4->_multipleExtensionsButton addTarget:v4 action:sel__extensionButtonTapped_ forControlEvents:0x2000];
    v72 = v4->_multipleExtensionsButton;
    v73 = _WBSLocalizedString();
    [(UIButton *)v72 sf_configureLargeContentViewerWithImage:0 title:v73];

    v74 = v4->_multipleExtensionsButton;
    id v75 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(UIButton *)v74 addInteraction:v75];

    v76 = objc_alloc_init(SFBadgeContainerView);
    multipleExtensionsButtonContainer = v4->_multipleExtensionsButtonContainer;
    v4->_multipleExtensionsButtonContainer = v76;

    [(SFBadgeContainerView *)v4->_multipleExtensionsButtonContainer setPositionsBadgeRelativeToLayoutMargins:1];
    [(SFBadgeContainerView *)v4->_multipleExtensionsButtonContainer setContentView:v4->_multipleExtensionsButton];
    [v5 addSubview:v4->_multipleExtensionsButtonContainer];
    v78 = objc_alloc_init(SFUnreadIndicator);
    unreadIndicator = v4->_unreadIndicator;
    v4->_unreadIndicator = v78;

    [v5 addSubview:v4->_unreadIndicator];
    v80 = objc_alloc_init(SFAvatarStackView);
    participantsView = v4->_participantsView;
    v4->_participantsView = v80;

    [v5 addSubview:v4->_participantsView];
    v82 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pin.fill"];
    uint64_t v83 = [(SFUnifiedTabBarItemView *)v4 _makeAccessoryButtonWithImage:v82 scale:1 action:0];
    pinnedIndicator = v4->_pinnedIndicator;
    v4->_pinnedIndicator = (UIButton *)v83;

    v85 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIButton *)v4->_pinnedIndicator setTintColor:v85];

    [(UIButton *)v4->_pinnedIndicator setUserInteractionEnabled:0];
    v86 = objc_alloc_init(SFUnifiedTabBarItemAccessoryButtonArrangement);
    accessoryButtonArrangement = v4->_accessoryButtonArrangement;
    v4->_accessoryButtonArrangement = v86;

    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __41__SFUnifiedTabBarItemView_initWithFrame___block_invoke;
    v95[3] = &unk_1E54EA9D8;
    v88 = v4;
    v96 = v88;
    SFUnifiedTabBarItemAccessoryButtonTypeEnumerateCases((uint64_t)v95);
    uint64_t v89 = [objc_alloc(MEMORY[0x1E4F98A60]) initWithPresenter:v88];
    id v90 = v88[141];
    v88[141] = (id)v89;

    [v88[141] setLabelDisplayDuration:1.9];
    v91 = (void *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:v88 action:sel__hover_];
    [v88 addGestureRecognizer:v91];
    [v88 applyTheme];
    v92 = v88;
  }
  return v4;
}

void __41__SFUnifiedTabBarItemView_initWithFrame___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _viewForAccessoryButtonOfType:a2];
  [v4 setHidden:1];
  v3 = SFAccessibilityIdentifierForUnifiedTabBarItemAccessoryButtonType(a2);
  [v4 setAccessibilityIdentifier:v3];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SFUnifiedTabBarItemView;
  [(SFUnifiedTabBarItemView *)&v4 dealloc];
}

- (void)tintColorDidChange
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SFUnifiedTabBarItemView;
  [(SFUnifiedTabBarItemView *)&v8 tintColorDidChange];
  if ([(SFUnifiedTabBarItemView *)self tintAdjustmentMode] == 2)
  {
    v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
    [v3 setValue:&unk_1EDA421C8 forKey:@"inputAmount"];
    v9[0] = v3;
    objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

    double v5 = 0.3;
  }
  else
  {
    objc_super v4 = 0;
    double v5 = 1.0;
  }
  uint64_t v6 = [(UIButton *)self->_firstExtensionButton layer];
  [v6 setFilters:v4];

  v7 = [(UIButton *)self->_secondExtensionButton layer];
  [v7 setFilters:v4];

  [(UIButton *)self->_firstExtensionButton setAlpha:v5];
  [(UIButton *)self->_secondExtensionButton setAlpha:v5];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SFUnifiedTabBarItemView;
  [(SFUnifiedBarItemView *)&v11 layoutSubviews];
  v3 = [(SFUnifiedBarItemView *)self barMetrics];
  [v3 itemCornerRadius];
  -[SFURLFieldOverlayView _setContinuousCornerRadius:](self->_overlayView, "_setContinuousCornerRadius:");

  [(SFUnifiedBarItemView *)self squishedInset];
  double v5 = v4;
  [(SFUnifiedTabBarItemView *)self _squishedInsetToHideTrailingButtons];
  [(SFUnifiedTabBarItemView *)self _setTrailingButtonsHidden:v5 > v6];
  [(SFUnifiedTabBarItemView *)self _updateAccessoryButtons];
  double v7 = 0.0;
  if (self->_showsCloseButton && ![(SFUnifiedTabBarItemView *)self showsSearchField])
  {
    [(SFUnifiedTabBarItemView *)self _closeButtonAlphaForSquishedInset];
    double v7 = v8;
  }
  [(SFUnifiedTabBarItemViewCloseButton *)self->_closeButton setAlpha:v7];
  [(SFUnifiedTabBarItemViewCloseButton *)self->_closeButton setUserInteractionEnabled:v7 == 1.0];
  [(SFUnifiedTabBarItemViewCloseButton *)self->_closeButtonForHover setAlpha:(double)[(SFUnifiedTabBarItemView *)self _showsCloseButtonOnHover]];
  [(SFUnifiedTabBarItemView *)self _updateCloseButtonForHoverPosition];
  [(_SFFluidProgressView *)self->_progressView setCornerRadius:0.0];
  v9 = [(_SFFluidProgressView *)self->_progressView superview];
  [v9 bounds];
  -[_SFFluidProgressView setFrame:](self->_progressView, "setFrame:");

  if (self->_needsAnimatedAccessoryButtonUpdate)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__SFUnifiedTabBarItemView_layoutSubviews__block_invoke;
    v10[3] = &unk_1E54E9858;
    v10[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v10 completion:0];
  }
  else
  {
    [(SFUnifiedTabBarItemView *)self _layOutTitleContainer];
  }
  [(SFUnifiedTabBarItemView *)self updateAccessibilityIdentifier];
  self->_needsAnimatedAccessoryButtonUpdate = 0;
}

uint64_t __41__SFUnifiedTabBarItemView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 896) setAnimatingResize:1];
  [*(id *)(a1 + 32) _layOutTitleContainer];
  v2 = *(void **)(*(void *)(a1 + 32) + 896);

  return [v2 setAnimatingResize:0];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SFUnifiedTabBarItemView;
  [(SFUnifiedTabBarItemView *)&v3 didMoveToWindow];
  if (self->_needsVoiceSearchAvailabilityUpdate)
  {
    [(SFUnifiedTabBarItemView *)self _voiceSearchAvailabilityDidChange:0];
    self->_needsVoiceSearchAvailabilityUpdate = 0;
  }
}

- (void)updateTitleWhenCollapsedWithItemTitles:(id)a3
{
  title = self->_title;
  double v5 = (void *)MEMORY[0x1E4FB08E0];
  id v6 = a3;
  double v7 = [(SFUnifiedTabBarItemView *)self titleTextStyle];
  uint64_t v8 = [v5 preferredFontForTextStyle:v7];
  id v10 = [(NSString *)title truncatedTitleWithFont:v8 desiredWidth:v6 tabBarItemTitles:self->_titleContainerWidthAccountingForInset];

  v9 = [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer titleWhenCollapsed];
  LOBYTE(v8) = WBSIsEqual();

  if ((v8 & 1) == 0) {
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setTitleWhenCollapsed:v10];
  }
}

- (void)_layOutTitleContainer
{
  double leadingButtonsWidth = self->_leadingButtonsWidth;
  double trailingButtonsWidth = self->_trailingButtonsWidth;
  int64_t v5 = [(SFUnifiedTabBarItemView *)self _iconVisibility];
  [(SFUnifiedBarItemView *)self squishedInset];
  double v7 = v6;
  [(SFUnifiedTabBarItemView *)self _squishedInsetToHideCloseButton];
  double v9 = leadingButtonsWidth - v8;
  double v10 = fmin(v7, v8);
  double v11 = leadingButtonsWidth - v10;
  double v12 = trailingButtonsWidth + v10;
  if (v5)
  {
    double v12 = trailingButtonsWidth;
    double v11 = leadingButtonsWidth;
  }
  if (v5 == 2) {
    double v12 = trailingButtonsWidth;
  }
  else {
    double v9 = v11;
  }
  if (self->_showsCloseButton) {
    double v13 = v12;
  }
  else {
    double v13 = trailingButtonsWidth;
  }
  if (self->_showsCloseButton) {
    double v14 = v9;
  }
  else {
    double v14 = leadingButtonsWidth;
  }
  BOOL v15 = [(SFUnifiedTabBarItemView *)self _hasRoomForIconAndCloseButton];
  if (v15)
  {
    BOOL active = self->_active;
    int64_t v17 = [(SFUnifiedTabBarItemView *)self contentAlignment];
    if (!active && v17 == 1)
    {
      v19 = [(SFUnifiedBarItemView *)self barMetrics];
      [v19 tabCloseButtonWidth];
      double v21 = v20;

      double v14 = fmax(v14, v21);
      double v13 = fmax(v13, v21 - 9.5);
      char v22 = 1;
      goto LABEL_21;
    }
  }
  else
  {
    [(SFUnifiedTabBarItemView *)self contentAlignment];
  }
  char v22 = 0;
LABEL_21:
  BOOL v23 = [(SFUnifiedTabBarItemView *)self showsSearchField];
  [(SFUnifiedTabBarItemView *)self layoutMargins];
  double v25 = v24;
  if (v23) {
    double v14 = v24;
  }
  [(SFUnifiedTabBarItemView *)self frame];
  double v27 = v26;
  [(SFUnifiedTabBarItemView *)self frame];
  double height = v50.size.height;
  double v29 = 0.0;
  v50.origin.x = 0.0;
  v50.origin.y = 0.0;
  v50.size.width = v27;
  double v46 = v7;
  double v30 = v7 + CGRectGetWidth(v50) - v14 - v13;
  self->_titleContainerWidthAccountingForInset = v30;
  v51.origin.x = 0.0;
  v51.origin.y = 0.0;
  v51.size.width = v27;
  v51.size.double height = height;
  CGFloat v31 = CGRectGetHeight(v51);
  id v48 = [(SFUnifiedBarItemView *)self barMetrics];
  if ((v22 & 1) == 0 && self->_leadingButtonsWidth == 0.0 && !v23)
  {
    [v48 leadingTabIconInset];
    double v33 = v32;
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer leadingIconOffset];
    double v29 = v33 + v34;
  }
  int64_t v35 = [(SFUnifiedTabBarItemView *)self contentAlignment];
  if (v35 == 1)
  {
    p_titleContainer = &self->_titleContainer;
    -[SFUnifiedTabBarItemTitleContainerView setFrame:](self->_titleContainer, "setFrame:", 0.0, 0.0, v27, height);
    double v36 = 0.0;
    v52.origin.y = 0.0;
    v52.origin.x = v14;
    v52.size.width = v30;
    v52.size.double height = v31;
    double v40 = v29 + CGRectGetMinX(v52);
    v53.origin.x = 0.0;
    v53.origin.y = 0.0;
    v53.size.width = v27;
    v53.size.double height = height;
    double Width = CGRectGetWidth(v53);
    v54.origin.y = 0.0;
    v54.origin.x = v14;
    v54.size.width = v30;
    v54.size.double height = v31;
    -[SFUnifiedTabBarItemTitleContainerView setDirectionalLayoutMargins:](self->_titleContainer, "setDirectionalLayoutMargins:", 0.0, v40, 0.0, Width - CGRectGetMaxX(v54) + 3.0);
  }
  else
  {
    if (v35) {
      goto LABEL_36;
    }
    double v36 = 0.0;
    p_titleContainer = &self->_titleContainer;
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setFrame:_SFFlipRectInCoordinateSpace(![(UIView *)self _sf_usesLeftToRightLayout], v14, 0.0, v30, v31, 0.0, 0.0, v27, height)];
    -[SFUnifiedTabBarItemTitleContainerView setDirectionalLayoutMargins:](self->_titleContainer, "setDirectionalLayoutMargins:", 0.0, v29, 0.0, 3.0);
    if (self->_showsCloseButton && v23)
    {
      [v48 tabCloseButtonWidth];
      double v36 = v39 - v25;
    }
  }
  [(SFUnifiedTabBarItemTitleContainerView *)*p_titleContainer setContentOffset:v36];
LABEL_36:
  if (v5)
  {
    double v42 = v47;
    if (v5 == 1)
    {
      [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setShowsIcon:0];
      titleContainer = self->_titleContainer;
      double v44 = 1.0;
    }
    else
    {
      if (v5 != 2) {
        goto LABEL_43;
      }
      [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setShowsIcon:1];
      [(SFUnifiedTabBarItemView *)self _closeButtonAlphaForSquishedInset];
      double v44 = 1.0 - v43;
      titleContainer = self->_titleContainer;
    }
    [(SFUnifiedTabBarItemTitleContainerView *)titleContainer setIconAlpha:v44];
  }
  else
  {
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setShowsIcon:1];
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setIconAlpha:1.0];
    double v42 = v47;
  }
LABEL_43:
  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setLeadingAlignsIcon:!v15];
  [(SFUnifiedTabBarItemView *)self _setTitleContainerMasked:v42 > self->_trailingButtonsWidth];
  [(SFUnifiedTabBarItemView *)self _layOutTitleContainerMask];
  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer layoutIfNeeded];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SFUnifiedTabBarItemView *)self frame];
  if (width != v9 || height != v8) {
    [(SFUnifiedTabBarItemView *)self setNeedsLayout];
  }
  v11.receiver = self;
  v11.super_class = (Class)SFUnifiedTabBarItemView;
  -[SFUnifiedTabBarItemView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)updateCornerRadius
{
  v4.receiver = self;
  v4.super_class = (Class)SFUnifiedTabBarItemView;
  [(SFUnifiedBarItemView *)&v4 updateCornerRadius];
  objc_super v3 = [(SFUnifiedBarItemView *)self barMetrics];
  [v3 itemCornerRadius];
  -[SFNavigationBarToggleButton setResizableBackgroundCornerRadius:](self->_formatMenuButton, "setResizableBackgroundCornerRadius:");
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)SFUnifiedTabBarItemView;
  [(SFUnifiedBarItemView *)&v4 prepareForReuse];
  [(SFUnifiedTabBarItemView *)self setSearchField:0];
  [(SFUnifiedTabBarItemView *)self setShowsSearchField:0];
  [(WBSContentAvailabilityDisplayController *)self->_availabilityDisplayController resetDisplay];
  [(SFUnifiedTabBarItemView *)self _stopAccessoryButtonUpdateTimer];
  [(SFUnifiedTabBarItemView *)self _stopReloadButtonExpirationTimer];
  lastReloadDate = self->_lastReloadDate;
  self->_lastReloadDate = 0;
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, a3);
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setTitleWhenCollapsed:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained tabBarItemViewTitleChanged:self];
    }
  }
}

- (UIImage)icon
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer icon];
}

- (void)setIcon:(id)a3
{
}

- (int64_t)_iconVisibility
{
  if ([(SFUnifiedTabBarItemView *)self accessoryButtonLayout]) {
    return 1;
  }
  int64_t v4 = [(SFUnifiedTabBarItemView *)self contentAlignment];
  if (v4 == 1) {
    return self->_showsCloseButton
  }
        && ![(SFUnifiedTabBarItemView *)self _hasRoomForIconAndCloseButton];
  if (v4) {
    return 1;
  }
  if (self->_active
    && ![(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer showsSearchIcon])
  {
    return 2 * self->_showsCloseButton;
  }
  return 0;
}

- (NSString)titleWhenActive
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer title];
}

- (void)setTitleWhenActive:(id)a3
{
  titleContainer = self->_titleContainer;
  id v5 = a3;
  [(SFUnifiedTabBarItemTitleContainerView *)titleContainer setTitle:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  [WeakRetained setTitle:v5];

  [(SFUnifiedTabBarItemView *)self applyTheme];

  [(SFUnifiedTabBarItemView *)self setNeedsLayout];
}

- (NSString)textWhenExpanded
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer textWhenExpanded];
}

- (void)setTextWhenExpanded:(id)a3
{
}

- (unint64_t)startIndexOfTitleInTextWhenExpanded
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer startIndexOfTitleInTextWhenExpanded];
}

- (void)setStartIndexOfTitleInTextWhenExpanded:(unint64_t)a3
{
}

- (NSString)titleTextStyle
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer titleTextStyle];
}

- (void)setTitleTextStyle:(id)a3
{
}

- (BOOL)showsSearchIcon
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer showsSearchIcon];
}

- (void)setShowsSearchIcon:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer showsSearchIcon] != a3)
  {
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setShowsSearchIcon:v3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
    [WeakRetained setShowsSearchIcon:v3];

    [(SFUnifiedTabBarItemView *)self setNeedsLayout];
    uint64_t v6 = [(SFUnifiedTabBarItemView *)self superview];
    if (v6)
    {
      double v7 = (void *)v6;
      char v8 = [(SFUnifiedTabBarItemView *)self isHidden];

      if ((v8 & 1) == 0)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        void v9[2] = __46__SFUnifiedTabBarItemView_setShowsSearchIcon___block_invoke;
        v9[3] = &unk_1E54E9858;
        v9[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v9];
      }
    }
  }
}

uint64_t __46__SFUnifiedTabBarItemView_setShowsSearchIcon___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)showsLockIcon
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer showsLockIcon];
}

- (void)setShowsLockIcon:(BOOL)a3
{
  BOOL v3 = a3;
  -[SFUnifiedTabBarItemTitleContainerView setShowsLockIcon:](self->_titleContainer, "setShowsLockIcon:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  [WeakRetained setShowsLockIcon:v3];
}

- (int64_t)lockIconEdge
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer lockIconEdge];
}

- (void)setLockIconEdge:(int64_t)a3
{
  -[SFUnifiedTabBarItemTitleContainerView setLockIconEdge:](self->_titleContainer, "setLockIconEdge:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  [WeakRetained setLockIconEdge:a3];
}

- (void)setShowsVoiceSearchButton:(BOOL)a3
{
  if (self->_showsVoiceSearchButton != a3)
  {
    self->_showsVoiceSearchButton = a3;
    [(SFUnifiedTabBarItemView *)self setNeedsLayout];
  }
}

- (BOOL)showsSecurityAnnotation
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer securityAnnotation] != 0;
}

- (void)setSecurityAnnotation:(int64_t)a3
{
  -[SFUnifiedTabBarItemTitleContainerView setSecurityAnnotation:](self->_titleContainer, "setSecurityAnnotation:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  [WeakRetained setSecurityAnnotation:a3];
}

- (int64_t)securityAnnotation
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer securityAnnotation];
}

- (BOOL)hasFocusedSensitiveInputField
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer hasFocusedSensitiveInputField];
}

- (void)setHasFocusedSensitiveInputField:(BOOL)a3
{
  BOOL v3 = a3;
  -[SFUnifiedTabBarItemTitleContainerView setHasFocusedSensitiveInputField:](self->_titleContainer, "setHasFocusedSensitiveInputField:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  [WeakRetained setHasFocusedSensitiveInputField:v3];
}

- (UIView)menuPopoverSourceView
{
  if ([(SFUnifiedTabBarItemAccessoryButtonArrangement *)self->_accessoryButtonArrangement containsButtonType:1])
  {
    BOOL v3 = self->_moreMenuButton;
  }
  else
  {
    BOOL v3 = [(SFNavigationBarToggleButton *)self->_formatMenuButton tiplessPopoverSourceView];
  }

  return (UIView *)v3;
}

- (BOOL)menuButtonSelected
{
  return [(SFMoreMenuButton *)self->_moreMenuButton isSelected];
}

- (void)setMenuButtonSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SFUnifiedTabBarItemView *)self menuButtonSelected] != a3)
  {
    [(SFMoreMenuButton *)self->_moreMenuButton setSelected:v3];
    [(SFNavigationBarToggleButton *)self->_formatMenuButton setSelected:v3];
    id v5 = [(SFNavigationBarToggleButton *)self->_formatMenuButton pointerInteraction];
    [v5 setEnabled:v3];

    [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonAccessories];
    [(SFUnifiedTabBarItemView *)self _updateMenuButtonColor];
  }
}

- (void)setShowsReaderIcon:(BOOL)a3
{
  if (self->_showsReaderIcon != a3)
  {
    self->_showsReaderIcon = a3;
    [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonImage];
  }
}

- (void)setShowsTranslationIcon:(BOOL)a3
{
  if (self->_showsTranslationIcon != a3)
  {
    self->_showsTranslationIcon = a3;
    [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonImage];
  }
}

- (void)setShowsSiriReaderPlayingIcon:(BOOL)a3
{
  if (self->_showsSiriReaderPlayingIcon != a3)
  {
    self->_showsSiriReaderPlayingIcon = a3;
    [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonImage];
  }
}

- (void)setContentOptions:(unint64_t)a3 resetDisplay:(BOOL)a4
{
  if (a4) {
    [(WBSContentAvailabilityDisplayController *)self->_availabilityDisplayController resetDisplay];
  }
  [(WBSContentAvailabilityDisplayController *)self->_availabilityDisplayController updateToContentOptions:a3];

  [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonImage];
}

- (id)makeReaderAvailabilityAction
{
  objc_initWeak(&location, self);
  v2 = _WBSLocalizedString();
  BOOL v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.plaintext"];
  int64_t v4 = [SFUnifiedTabBarAvailabilityItem alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SFUnifiedTabBarItemView_makeReaderAvailabilityAction__block_invoke;
  v7[3] = &unk_1E54EA1B8;
  objc_copyWeak(&v8, &location);
  id v5 = [(SFUnifiedTabBarAvailabilityItem *)v4 initWithTitle:v2 image:v3 buttonType:10 action:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);

  return v5;
}

void __55__SFUnifiedTabBarItemView_makeReaderAvailabilityAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _readerButtonTapped];
}

- (id)makeTranslationAvailabilityAction
{
  objc_initWeak(&location, self);
  v2 = _WBSLocalizedString();
  BOOL v3 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"translate"];
  int64_t v4 = [SFUnifiedTabBarAvailabilityItem alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SFUnifiedTabBarItemView_makeTranslationAvailabilityAction__block_invoke;
  v7[3] = &unk_1E54EA1B8;
  objc_copyWeak(&v8, &location);
  id v5 = [(SFUnifiedTabBarAvailabilityItem *)v4 initWithTitle:v2 image:v3 buttonType:11 action:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);

  return v5;
}

void __60__SFUnifiedTabBarItemView_makeTranslationAvailabilityAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _translationButtonTapped];
}

- (BOOL)showsStopReloadButton
{
  BOOL v3 = [(SFUnifiedTabBarItemView *)self showsPersistentStopReloadButton];
  lastReloadDate = self->_lastReloadDate;
  if (lastReloadDate)
  {
    [(NSDate *)lastReloadDate safari_timeIntervalUntilNow];
    BOOL v6 = v5 < 480.0;
  }
  else
  {
    BOOL v6 = 0;
  }
  BOOL result = self->_showsStopReloadButton;
  char v8 = !self->_showsStopReloadButton || v3;
  if ((v8 & 1) == 0 && !v6)
  {
    return [(SFUnifiedBarItemView *)self isHovering];
  }
  return result;
}

- (void)setShowsStopReloadButton:(BOOL)a3
{
  if (self->_showsStopReloadButton != a3)
  {
    self->_showsStopReloadButton = a3;
    if ([(SFUnifiedBarItemView *)self isHovering])
    {
      [(SFUnifiedTabBarItemView *)self _setNeedsAnimatedAccessoryButtonUpdate];
    }
  }
}

- (BOOL)showsPersistentStopReloadButton
{
  return ![(SFUnifiedTabBarItemAccessoryButtonArrangement *)self->_accessoryButtonArrangement containsButtonType:1];
}

- (void)setStopReloadButtonShowsStop:(BOOL)a3
{
  if (self->_stopReloadButtonShowsStop != a3)
  {
    self->_stopReloadButtonShowsStop = a3;
    if ([(SFUnifiedTabBarItemView *)self showsStopReloadButton])
    {
      [(SFUnifiedTabBarItemView *)self _setNeedsAnimatedAccessoryButtonUpdate];
    }
  }
}

- (void)setLastReloadDate:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    BOOL v5 = [(SFUnifiedTabBarItemView *)self showsStopReloadButton];
    objc_storeStrong((id *)&self->_lastReloadDate, a3);
    if (v5 != [(SFUnifiedTabBarItemView *)self showsStopReloadButton]) {
      [(SFUnifiedTabBarItemView *)self _setNeedsAnimatedAccessoryButtonUpdate];
    }
    if (v6) {
      [(SFUnifiedTabBarItemView *)self _startReloadButtonExpirationTimer];
    }
    else {
      [(SFUnifiedTabBarItemView *)self _stopReloadButtonExpirationTimer];
    }
  }
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    id v7 = [(UIButton *)self->_mediaStateMuteButton configuration];
    BOOL v5 = _SFImageForMediaStateIcon(a3);
    id v6 = [v5 imageWithRenderingMode:2];
    [v7 setImage:v6];

    [(UIButton *)self->_mediaStateMuteButton setConfiguration:v7];
    [(SFUnifiedTabBarItemView *)self _updateMediaStateMuteButton];
    [(SFUnifiedTabBarItemView *)self _setNeedsAnimatedAccessoryButtonUpdate];
    [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonAccessories];
  }
}

- (void)setFluidProgressController:(id)a3 withCurrentState:(id)a4
{
  id obj = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fluidProgressController);
  if (WeakRetained != obj)
  {
    [WeakRetained unregisterObserver:self->_progressView];
    id v8 = objc_storeWeak((id *)&self->_fluidProgressController, obj);

    [obj registerObserver:self->_progressView];
    [(_SFFluidProgressView *)self->_progressView setProgressToCurrentPositionForState:v6];
    [(SFUnifiedTabBarItemView *)self _updateShowsProgressView];
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_BOOL active = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setCollapsed:!a3];
    [(SFUnifiedTabBarItemView *)self _updateShowsProgressView];
    [(SFUnifiedTabBarItemView *)self _updateMediaStateMuteButton];
    [(SFUnifiedTabBarItemView *)self setNeedsLayout];
    if (!self->_active)
    {
      [(SFUnifiedTabBarItemView *)self _stopAccessoryButtonUpdateTimer];
    }
  }
}

- (void)setShowsCloseButton:(BOOL)a3
{
  if (self->_showsCloseButton != a3)
  {
    self->_showsCloseButton = a3;
    [(SFUnifiedTabBarItemView *)self setNeedsLayout];
  }
}

- (BOOL)_hasRoomForIconAndCloseButton
{
  if (self->_active || [(SFUnifiedTabBarItemView *)self contentAlignment] != 1) {
    return 1;
  }
  [(SFUnifiedTabBarItemView *)self bounds];
  double Width = CGRectGetWidth(v8);
  +[SFUnifiedTabBarMetrics minimumInactiveItemWidthForSizeClass:0];
  double v5 = v4;
  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer maximumIconWidth];
  return Width > v5 + v6 * 2.0;
}

- (void)setFormatMenuButtonConfigurator:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_formatMenuButtonConfigurator);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_formatMenuButtonConfigurator, obj);
    [obj configureMenuAndAdoptButton:self->_formatMenuButton];
  }
}

- (UITextField)searchField
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer searchField];
}

- (void)setSearchField:(id)a3
{
  id v6 = a3;
  id v4 = [(SFUnifiedTabBarItemView *)self searchField];
  if (v4 != v6)
  {
    [v4 removeTarget:self action:sel__searchFieldDidChange_ forControlEvents:0x20000];
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setSearchField:v6];
    [(SFUnifiedTabBarItemView *)self setNeedsLayout];
    [v6 addTarget:self action:sel__searchFieldDidChange_ forControlEvents:0x20000];
    double v5 = [(SFUnifiedTabBarItemView *)self _searchFieldTintColor];
    [v6 setTintColor:v5];
  }
}

- (BOOL)showsSearchField
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer showsSearchField];
}

- (void)setShowsSearchField:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer showsSearchField] != a3)
  {
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setShowsSearchField:v3];
    [(SFUnifiedTabBarItemView *)self applyTheme];
    [(SFUnifiedTabBarItemView *)self setNeedsLayout];
  }
}

- (void)setAccessoryButtonLayout:(int64_t)a3
{
  if (self->_accessoryButtonLayout != a3)
  {
    self->_accessoryButtonLayout = a3;
    if ([(SFUnifiedTabBarItemView *)self _showsFormatMenuButtonAccessories])
    {
      id v4 = objc_alloc_init(SFMoreMenuButton);
      downloadProgressView = self->_downloadProgressView;
      self->_downloadProgressView = v4;

      [(SFMoreMenuButton *)self->_downloadProgressView setProgressStyle:1];
      [(SFMoreMenuButton *)self->_moreMenuButton downloadProgress];
      -[SFMoreMenuButton setDownloadProgress:](self->_downloadProgressView, "setDownloadProgress:");
      [(SFMoreMenuButton *)self->_downloadProgressView setUserInteractionEnabled:0];
    }
    else
    {
      id v6 = self->_downloadProgressView;
      self->_downloadProgressView = 0;
    }
    [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonAccessories];
    [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonStyle];
    [(SFUnifiedTabBarItemView *)self setNeedsLayout];
  }
}

- (int64_t)contentAlignment
{
  return [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer alignment];
}

- (void)setContentAlignment:(int64_t)a3
{
  if ([(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer alignment] != a3)
  {
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setAlignment:a3];
    [(SFUnifiedTabBarItemView *)self setNeedsLayout];
  }
}

- (void)setDownloadProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  -[SFMoreMenuButton setDownloadProgress:animated:](self->_moreMenuButton, "setDownloadProgress:animated:");
  [(SFMoreMenuButton *)self->_downloadProgressView setDownloadProgress:v4 animated:a3];

  [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonAccessories];
}

- (void)_updateExtensionButtonConfigurationShowingOverflow:(BOOL)a3 activeExtensionCount:(unint64_t)a4
{
  BOOL v5 = a3;
  id v16 = [MEMORY[0x1E4FB14D8] borderlessButtonConfiguration];
  if (v5) {
    id v7 = @"puzzlepiece.extension.fill";
  }
  else {
    id v7 = @"puzzlepiece.extension";
  }
  CGRect v8 = [MEMORY[0x1E4FB1818] systemImageNamed:v7];
  [v16 setImage:v8];
  if (v5)
  {
    double v9 = (void *)MEMORY[0x1E4F28EE0];
    double v10 = [NSNumber numberWithUnsignedInteger:a4];
    objc_super v11 = [v9 localizedStringFromNumber:v10 numberStyle:1];
    [v16 setTitle:v11];
  }
  else
  {
    [v16 setTitle:0];
  }
  double v12 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:2];
  [v16 setPreferredSymbolConfigurationForImage:v12];

  [v16 setImagePadding:2.0];
  objc_msgSend(v16, "setContentInsets:", 6.0, 6.0, 6.0, 6.0);
  double v13 = [MEMORY[0x1E4FB1618] clearColor];
  double v14 = [v16 background];
  [v14 setBackgroundColor:v13];

  [(UIButton *)self->_multipleExtensionsButton setConfiguration:v16];
  BOOL v15 = _WBSLocalizedString();
  [(UIButton *)self->_multipleExtensionsButton setLargeContentTitle:v15];

  [(UIButton *)self->_multipleExtensionsButton setLargeContentImage:v8];
  [(SFBadgeContainerView *)self->_multipleExtensionsButtonContainer setPositionsBadgeRelativeToLayoutMargins:!v5];
}

- (void)setExtensionButtonConfiguration:(id)a3
{
  id v24 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_extensionButtonConfiguration, a3);
    BOOL v5 = [v24 buttons];
    id v6 = _WBSLocalizedString();
    id v7 = [v5 firstObject];
    firstExtensionButton = self->_firstExtensionButton;
    double v9 = [v7 image];
    [(UIButton *)firstExtensionButton setImage:v9 forState:0];

    double v10 = [v7 extension];
    uint64_t v11 = [v10 displayShortName];
    double v12 = (void *)v11;
    if (v11) {
      double v13 = (void *)v11;
    }
    else {
      double v13 = v6;
    }
    [(UIButton *)self->_firstExtensionButton setLargeContentTitle:v13];

    [(SFBadgeContainerView *)self->_firstExtensionButtonContainer setNeedsLayout];
    double v14 = 0;
    if ((unint64_t)[v5 count] >= 2)
    {
      double v14 = [v5 objectAtIndexedSubscript:1];
    }
    secondExtensionButton = self->_secondExtensionButton;
    id v16 = [v14 image];
    [(UIButton *)secondExtensionButton setImage:v16 forState:0];

    int64_t v17 = [v14 extension];
    uint64_t v18 = [v17 displayShortName];
    v19 = (void *)v18;
    if (v18) {
      double v20 = (void *)v18;
    }
    else {
      double v20 = v6;
    }
    [(UIButton *)self->_secondExtensionButton setLargeContentTitle:v20];

    [(SFBadgeContainerView *)self->_secondExtensionButtonContainer setNeedsLayout];
    -[SFBadgeContainerView setShowsBadge:](self->_firstExtensionButtonContainer, "setShowsBadge:", [v7 badged]);
    -[SFBadgeContainerView setShowsBadge:](self->_secondExtensionButtonContainer, "setShowsBadge:", [v14 badged]);
    char v21 = [v24 alwaysShowMultipleExtensionsButton];
    unint64_t v22 = [v24 activeExtensionCount];
    unint64_t v23 = [(SFUnifiedTabBarItemView *)self _individualExtensionButtonLimit];
    if ((v21 & 1) != 0 || v22 > v23) {
      [(SFUnifiedTabBarItemView *)self _updateExtensionButtonConfigurationShowingOverflow:v22 > v23 activeExtensionCount:v22];
    }
    if ([v5 count])
    {
      [(SFUnifiedTabBarItemView *)self _setNeedsAnimatedAccessoryButtonUpdate];
    }
    else if ([(SFUnifiedTabBarItemView *)self showsStopReloadButton])
    {
      [(SFUnifiedTabBarItemView *)self _temporarilyCoalesceAccessoryButtonUpdates];
    }
    [(SFUnifiedTabBarItemView *)self _updateBadges];
    [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonAccessories];
  }
}

- (void)setMenuButtonBadges:(unint64_t)a3
{
  if (self->_menuButtonBadges != a3)
  {
    self->_menuButtonBadges = a3;
    [(SFUnifiedTabBarItemView *)self _updateBadges];
    [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonAccessories];
  }
}

- (void)setShowsBadgeOnExtensionsButton:(BOOL)a3
{
  if (self->_showsBadgeOnExtensionsButton != a3)
  {
    self->_showsBadgeOnExtensionsButton = a3;
    [(SFUnifiedTabBarItemView *)self _updateBadges];
  }
}

- (void)setUnread:(BOOL)a3
{
  if (self->_unread != a3)
  {
    self->_unread = a3;
    [(SFUnifiedTabBarItemView *)self _setNeedsAnimatedAccessoryButtonUpdate];
  }
}

- (NSArray)shareParticipants
{
  return [(SFAvatarStackView *)self->_participantsView shareParticipants];
}

- (void)setShareParticipants:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(SFUnifiedTabBarItemView *)self shareParticipants];
  char v5 = [v4 isEqualToArray:v6];

  if ((v5 & 1) == 0)
  {
    [(SFAvatarStackView *)self->_participantsView setShareParticipants:v6];
    [(SFUnifiedTabBarItemView *)self _setNeedsAnimatedAccessoryButtonUpdate];
  }
}

- (void)setShowsPinnedIndicator:(BOOL)a3
{
  if (self->_showsPinnedIndicator != a3)
  {
    self->_showsPinnedIndicator = a3;
    [(SFUnifiedTabBarItemView *)self _setNeedsAnimatedAccessoryButtonUpdate];
  }
}

- (void)setHasHiddenElements:(BOOL)a3
{
  if (self->_hasHiddenElements != a3)
  {
    self->_hasHiddenElements = a3;
    [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonAccessories];
  }
}

- (void)setOverlayConfiguration:(id)a3
{
  id v30 = a3;
  char v5 = self->_overlayConfiguration;
  objc_storeStrong((id *)&self->_overlayConfiguration, a3);
  id v6 = [(SFURLFieldOverlayConfiguration *)v5 identifier];
  id v7 = [v30 identifier];
  int v8 = WBSIsEqual();

  overlayView = self->_overlayView;
  if (v8)
  {
    [(SFURLFieldOverlayView *)overlayView setConfiguration:v30];
  }
  else
  {
    [(SFURLFieldOverlayView *)overlayView dismissAndRemove];
    if (v30)
    {
      double v10 = [(SFUnifiedBarItemView *)self contentView];
      uint64_t v11 = [v10 layer];

      uint64_t v12 = [v11 presentationLayer];
      double v13 = (void *)v12;
      if (v12) {
        double v14 = (void *)v12;
      }
      else {
        double v14 = v11;
      }
      id v15 = v14;

      id v16 = [SFURLFieldOverlayView alloc];
      [v15 bounds];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;

      double v25 = -[SFURLFieldOverlayView initWithFrame:configuration:](v16, "initWithFrame:configuration:", v30, v18, v20, v22, v24);
      double v26 = self->_overlayView;
      self->_overlayView = v25;

      [(SFURLFieldOverlayView *)self->_overlayView setAutoresizingMask:18];
      double v27 = [(SFUnifiedBarItemView *)self barMetrics];
      [v27 itemCornerRadius];
      -[SFURLFieldOverlayView _setContinuousCornerRadius:](self->_overlayView, "_setContinuousCornerRadius:");

      v28 = [(SFUnifiedBarItemView *)self contentView];
      [v28 addSubview:self->_overlayView];

      [(SFURLFieldOverlayView *)self->_overlayView present];
    }
    else
    {
      double v29 = self->_overlayView;
      self->_overlayView = 0;
    }
  }
}

- (void)applyTheme
{
  int64_t v3 = [(SFUnifiedBarItemView *)self platterStyle];
  id v11 = [(SFUnifiedTabBarItemView *)self _controlsTintColor];
  BOOL v4 = [(SFUnifiedBarItemView *)self contentView];
  [v4 setTintColor:v11];

  [(SFMoreMenuButton *)self->_moreMenuButton setProgressTintColor:v11];
  char v5 = [(SFUnifiedTabBarItemView *)self _titleTheme];
  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setTheme:v5];

  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setDimsText:v3 == 1];
  id v6 = [(SFUnifiedTabBarItemView *)self _accessoryButtonTintColor];
  id v7 = [(SFUnifiedTabBarItemView *)self _secondaryAccessoryButtonTintColor];
  [(SFUnifiedTabBarItemViewCloseButton *)self->_closeButton setTintColor:v6];
  [(SFUnifiedTabBarItemViewCloseButton *)self->_closeButtonForHover setTintColor:v6];
  if ([(UIButton *)self->_voiceSearchButton isEnabled])
  {
    [(UIButton *)self->_voiceSearchButton setTintColor:v7];
  }
  else
  {
    int v8 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIButton *)self->_voiceSearchButton setTintColor:v8];
  }
  [(UIButton *)self->_reloadButton setTintColor:v6];
  [(UIButton *)self->_stopButton setTintColor:v6];
  [(UIButton *)self->_multipleExtensionsButton setTintColor:v7];
  double v9 = [(SFUnifiedTabBarItemView *)self _searchFieldTintColor];
  double v10 = [(SFUnifiedTabBarItemView *)self searchField];
  [v10 setTintColor:v9];

  [(SFUnifiedTabBarItemView *)self _updateProgressViewColor];
  [(SFUnifiedTabBarItemView *)self _updateMenuButtonColor];
  [(SFUnifiedTabBarItemView *)self _updateMediaStateMuteButton];
  [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonAccessories];
  [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonStyle];
}

- (void)setPlatterStyle:(int64_t)a3
{
  if ([(SFUnifiedBarItemView *)self platterStyle] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SFUnifiedTabBarItemView;
    [(SFUnifiedBarItemView *)&v5 setPlatterStyle:a3];
    [(SFUnifiedTabBarItemView *)self applyTheme];
  }
}

- (id)_titleTheme
{
  BOOL v3 = [(SFUnifiedTabBarItemView *)self _shouldUseActiveTheme];
  BOOL v4 = [(SFUnifiedBarItemView *)self barTheme];
  objc_super v5 = v4;
  if (v3) {
    [v4 activeTabTitleTheme];
  }
  else {
  id v6 = [v4 tabTitleTheme];
  }

  return v6;
}

- (id)_accessoryButtonTintColor
{
  if ([(SFUnifiedBarItemView *)self platterStyle] == 4)
  {
    BOOL v3 = [(SFUnifiedBarItemView *)self barTheme];
    uint64_t v4 = [v3 inputFieldAccessoryButtonTintColor];
  }
  else
  {
    BOOL v5 = [(SFUnifiedTabBarItemView *)self _shouldUseActiveTheme];
    id v6 = [(SFUnifiedBarItemView *)self barTheme];
    BOOL v3 = v6;
    if (v5) {
      [v6 activeTabAccessoryButtonTintColor];
    }
    else {
    uint64_t v4 = [v6 tabAccessoryButtonTintColor];
    }
  }
  id v7 = (void *)v4;

  return v7;
}

- (id)_secondaryAccessoryButtonTintColor
{
  int64_t v4 = [(SFUnifiedBarItemView *)self platterStyle];
  if (v4 != 4
    || !(BOOL v5 = [(SFUnifiedTabBarItemView *)self showsSearchField])
    && ([(SFUnifiedTabBarItemView *)self titleWhenActive],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 length]))
  {
    id v6 = [(SFUnifiedTabBarItemView *)self _accessoryButtonTintColor];
    if (v4 != 4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v8 = [(SFUnifiedBarItemView *)self barTheme];
  id v6 = [v8 inputFieldSecondaryAccessoryButtonTintColor];

  if (!v5) {
LABEL_5:
  }

LABEL_6:

  return v6;
}

- (id)_controlsTintColor
{
  BOOL v3 = [(SFUnifiedTabBarItemView *)self _shouldUseActiveTheme];
  int64_t v4 = [(SFUnifiedBarItemView *)self barTheme];
  BOOL v5 = v4;
  if (v3) {
    [v4 activeTabControlsTintColor];
  }
  else {
  id v6 = [v4 tabControlsTintColor];
  }

  return v6;
}

- (id)_progressBarTintColor
{
  BOOL v3 = [(SFUnifiedTabBarItemView *)self _shouldUseActiveTheme];
  int64_t v4 = [(SFUnifiedBarItemView *)self barTheme];
  BOOL v5 = v4;
  if (v3) {
    [v4 activeTabProgressBarTintColor];
  }
  else {
  id v6 = [v4 tabProgressBarTintColor];
  }

  return v6;
}

- (id)_searchFieldTintColor
{
  if ([(SFUnifiedBarItemView *)self platterStyle] == 2)
  {
    BOOL v3 = [(SFUnifiedBarItemView *)self barTheme];
    int64_t v4 = [v3 activeTabFieldTintColor];
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldUseActiveTheme
{
  unint64_t v3 = [(SFUnifiedBarItemView *)self platterStyle];
  if (v3 > 7) {
    return 1;
  }
  if (((1 << v3) & 0xE3) != 0) {
    return 0;
  }
  BOOL v5 = [(SFUnifiedBarItemView *)self barTheme];
  char v6 = [v5 isPrivate];

  return v6;
}

- (void)setSquishedTitleContainer:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_squishedTitleContainer, obj);
    [WeakRetained dismissAvailabilityLabelAnimated:0 withCompletionHandler:0];
    if (obj)
    {
      objc_msgSend(obj, "setShowsSearchIcon:", -[SFUnifiedTabBarItemTitleContainerView showsSearchIcon](self->_titleContainer, "showsSearchIcon"));
      objc_msgSend(obj, "setShowsLockIcon:", -[SFUnifiedTabBarItemTitleContainerView showsLockIcon](self->_titleContainer, "showsLockIcon"));
      objc_msgSend(obj, "setLockIconEdge:", -[SFUnifiedTabBarItemTitleContainerView lockIconEdge](self->_titleContainer, "lockIconEdge"));
      objc_msgSend(obj, "setSecurityAnnotation:", -[SFUnifiedTabBarItemTitleContainerView securityAnnotation](self->_titleContainer, "securityAnnotation"));
      BOOL v5 = [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer title];
      [obj setTitle:v5];
    }
  }
}

- (void)setShowsSquishedAccessoryViews:(BOOL)a3
{
  if (self->_showsSquishedAccessoryViews != a3)
  {
    self->_showsSquishedAccessoryViews = a3;
    [(SFUnifiedTabBarItemView *)self _updateProgressViewColor];
    [(SFUnifiedTabBarItemView *)self _updateShowsProgressView];
    [(SFUnifiedTabBarItemView *)self setNeedsLayout];
  }
}

- (void)_closeButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained tabBarItemViewCloseButtonTapped:self];
  }
}

- (void)_menuButtonTapped
{
  uint64_t v3 = [(SFUnifiedTabBarAvailabilityItem *)self->_currentAvailabilityItem action];
  if (v3
    && (int64_t v4 = (void *)v3,
        BOOL v5 = [(SFUnifiedTabBarItemView *)self _availabilityButtonsReplaceFormatMenuButton], v4, v5))
  {
    currentAvailabilityItem = self->_currentAvailabilityItem;
    [(SFUnifiedTabBarAvailabilityItem *)currentAvailabilityItem performAction];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained tabBarItemViewMenuButtonTapped:self];
    }
  }
}

- (void)_menuButtonReceivedTouchDown
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained tabBarItemViewMenuButtonReceivedTouchDown:self];
  }
}

- (void)_menuButtonClicked
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained tabBarItemViewMenuButtonClicked:self];
  }
}

- (void)_reloadButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained tabBarItemViewReloadButtonTapped:self];
  }
}

- (void)_stopButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained tabBarItemViewStopButtonTapped:self];
  }
}

- (void)_voiceSearchButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained tabBarItemViewVoiceSearchButtonTapped:self];
  }
}

- (void)_readerButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained tabBarItemViewReaderButtonTapped:self];
  }
}

- (void)_translationButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained tabBarItemViewTranslationButtonTapped:self];
  }
}

- (void)_mediaStateMuteButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained tabBarItemViewMediaStateMuteButtonTapped:self];
  }
}

- (void)_extensionButtonTapped:(id)a3
{
  int v8 = (UIButton *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_multipleExtensionsButton == v8)
  {
    if (objc_opt_respondsToSelector()) {
      [WeakRetained tabBarItemView:self multipleExtensionButtonTapped:v8];
    }
  }
  else
  {
    BOOL v5 = [(SFWebExtensionButtonConfiguration *)self->_extensionButtonConfiguration buttons];
    char v6 = [v5 objectAtIndexedSubscript:self->_firstExtensionButton != v8];
    id v7 = [v6 extension];

    if (objc_opt_respondsToSelector()) {
      [WeakRetained tabBarItemView:self extensionButtonTapped:v8 extension:v7];
    }
  }
}

- (void)_updateShowsProgressView
{
  BOOL v2 = !self->_active || !self->_showingProgress;
  [(_SFFluidProgressView *)self->_progressView setHidden:v2];
}

- (void)_updateProgressViewColor
{
  uint64_t v3 = [(SFUnifiedBarItemView *)self barTheme];
  id v8 = v3;
  if (self->_showsSquishedAccessoryViews) {
    [v3 progressBarTintColor];
  }
  else {
  int64_t v4 = [(SFUnifiedTabBarItemView *)self _progressBarTintColor];
  }
  [(_SFFluidProgressView *)self->_progressView setProgressBarFillColor:v4];

  if (self->_showsSquishedAccessoryViews || !_SFIsPrivateTintStyle([v8 tintStyle]))
  {
    int v6 = 0;
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0C8]];
    int v6 = 1;
  }
  id v7 = [(_SFFluidProgressView *)self->_progressView layer];
  [v7 setCompositingFilter:v5];

  if (v6) {
}
  }

- (void)_updateMenuButtonColor
{
  if ([(SFUnifiedTabBarItemView *)self menuButtonSelected])
  {
    uint64_t v3 = [(SFUnifiedBarItemView *)self barTheme];
    int64_t v4 = [v3 selectedMenuButtonTintColor];
    [(SFMoreMenuButton *)self->_moreMenuButton setTintColor:v4];

    BOOL v5 = [(SFUnifiedTabBarItemView *)self _titleTheme];
    id v9 = [v5 primaryTextColor];

    int64_t v6 = [(SFUnifiedBarItemView *)self platterStyle];
    id v7 = v9;
    if (v6 != 4)
    {
      uint64_t v8 = [v9 colorWithAlphaComponent:0.85];

      id v7 = (id)v8;
    }
  }
  else
  {
    id v10 = [(SFUnifiedTabBarItemView *)self _accessoryButtonTintColor];
    [(SFMoreMenuButton *)self->_moreMenuButton setTintColor:v10];
    id v7 = v10;
  }
  id v11 = v7;
  [(SFNavigationBarToggleButton *)self->_formatMenuButton setGlyphTintColor:v7];
}

- (void)_updateMediaStateMuteButton
{
  if (self->_active)
  {
    uint64_t v3 = [(SFUnifiedTabBarItemView *)self _titleTheme];
    int64_t v4 = [v3 overrideTintColor];
    if (v4)
    {
      [(UIButton *)self->_mediaStateMuteButton setTintColor:v4];
    }
    else
    {
      BOOL v5 = [MEMORY[0x1E4FB1618] systemRedColor];
      [(UIButton *)self->_mediaStateMuteButton setTintColor:v5];
    }
  }
  else
  {
    uint64_t v3 = [(SFUnifiedTabBarItemView *)self _accessoryButtonTintColor];
    [(UIButton *)self->_mediaStateMuteButton setTintColor:v3];
  }

  BOOL v6 = self->_active || self->_mediaStateIcon != 4;
  mediaStateMuteButton = self->_mediaStateMuteButton;

  [(UIButton *)mediaStateMuteButton setUserInteractionEnabled:v6];
}

- (void)_updateFormatMenuButtonImage
{
  uint64_t v3 = [(SFUnifiedTabBarAvailabilityItem *)self->_currentAvailabilityItem image];
  if (v3)
  {
    int64_t v4 = (void *)v3;
    BOOL v5 = [(SFUnifiedTabBarItemView *)self _availabilityButtonsReplaceFormatMenuButton];

    if (v5)
    {
      uint64_t v6 = [(SFUnifiedTabBarAvailabilityItem *)self->_currentAvailabilityItem image];
LABEL_10:
      id v7 = (id)v6;
      goto LABEL_11;
    }
  }
  if (self->_showsSiriReaderPlayingIcon)
  {
    id v9 = +[SFNavigationBarToggleButton siriReaderPlayingImage];
    [(SFNavigationBarToggleButton *)self->_formatMenuButton setAccessibilityIdentifier:@"SiriReaderButton"];
    id v7 = v9;
LABEL_11:
    id v10 = v7;
    [(SFNavigationBarToggleButton *)self->_formatMenuButton setImage:v7];
    [(UIView *)self->_formatMenuButton sf_configureLargeContentViewerForBarItem:13];
    goto LABEL_12;
  }
  if (self->_showsReaderIcon)
  {
    uint64_t v6 = +[SFNavigationBarToggleButton readerImageWithSummary:[(WBSContentAvailabilityDisplayController *)self->_availabilityDisplayController cumulativeOptions] & 1];
    goto LABEL_10;
  }
  if (self->_showsTranslationIcon)
  {
    uint64_t v6 = +[SFNavigationBarToggleButton translationImage];
    goto LABEL_10;
  }
  +[SFNavigationBarToggleButton pageMenuImageWithIntelligence:([(WBSContentAvailabilityDisplayController *)self->_availabilityDisplayController cumulativeOptions] & 0x1F) != 0];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(SFNavigationBarToggleButton *)self->_formatMenuButton setAccessibilityIdentifier:@"PageFormatMenuButton"];
  [(SFNavigationBarToggleButton *)self->_formatMenuButton setImage:v10];
  uint64_t v8 = [(SFNavigationBarToggleButton *)self->_formatMenuButton image];
  [(SFNavigationBarToggleButton *)self->_formatMenuButton setLargeContentImage:v8];

LABEL_12:
}

- (BOOL)_showsFormatMenuButtonAccessories
{
  return self->_accessoryButtonLayout == 2;
}

- (void)_updateFormatMenuButtonAccessories
{
  BOOL v3 = [(SFUnifiedTabBarItemView *)self _showsFormatMenuButtonAccessories];
  char v4 = [(SFNavigationBarToggleButton *)self->_formatMenuButton isSelected];
  unint64_t v5 = [(SFWebExtensionButtonConfiguration *)self->_extensionButtonConfiguration activeExtensionCount];
  id v28 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  if (v5) {
    BOOL v7 = !v3;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = +[SFNavigationBarToggleButton extensionsImage];
    [v28 addObject:v8];

    if ((v4 & 1) != 0
      || ([(SFUnifiedBarItemView *)self barTheme],
          id v9 = objc_claimAutoreleasedReturnValue(),
          [v9 inputFieldSecondaryAccessoryButtonTintColor],
          id v10 = objc_claimAutoreleasedReturnValue(),
          v9,
          !v10))
    {
      id v10 = [MEMORY[0x1E4FB1618] systemGrayColor];
    }
    [v6 addObject:v10];
  }
  unint64_t mediaStateIcon = self->_mediaStateIcon;
  if (mediaStateIcon) {
    BOOL v12 = v3;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    double v13 = _SFImageForMediaStateIcon(mediaStateIcon);
    double v14 = [v13 imageWithRenderingMode:2];
    [v28 addObject:v14];

    if ((v4 & 1) != 0
      || ([(SFUnifiedTabBarItemView *)self _titleTheme],
          id v15 = objc_claimAutoreleasedReturnValue(),
          [v15 overrideTintColor],
          id v16 = objc_claimAutoreleasedReturnValue(),
          v15,
          !v16))
    {
      id v16 = [MEMORY[0x1E4FB1618] systemRedColor];
    }
    [v6 addObject:v16];
  }
  if (self->_hasHiddenElements)
  {
    double v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eye.slash"];
    [v28 addObject:v17];

    double v18 = objc_msgSend(MEMORY[0x1E4FB1618], "safari_scribbleThemeColor");
    [v6 addObject:v18];
  }
  unint64_t v19 = [v28 count];
  if (v19)
  {
    double v20 = [v28 objectAtIndexedSubscript:0];
    [(SFNavigationBarToggleButton *)self->_formatMenuButton setSecondaryImage:v20];

    double v21 = [v6 objectAtIndexedSubscript:0];
    [(SFNavigationBarToggleButton *)self->_formatMenuButton setSecondaryImageColor:v21];

    if (v19 != 1)
    {
      double v22 = [v28 objectAtIndexedSubscript:1];
      [(SFNavigationBarToggleButton *)self->_formatMenuButton setTertiaryImage:v22];

      double v23 = [v6 objectAtIndexedSubscript:1];
      [(SFNavigationBarToggleButton *)self->_formatMenuButton setTertiaryImageColor:v23];

      goto LABEL_24;
    }
  }
  else
  {
    [(SFNavigationBarToggleButton *)self->_formatMenuButton setSecondaryImage:0];
  }
  [(SFNavigationBarToggleButton *)self->_formatMenuButton setTertiaryImage:0];
LABEL_24:
  [(SFMoreMenuButton *)self->_downloadProgressView downloadProgress];
  BOOL v25 = v24 == -2.0 && (self->_menuButtonBadges & 1) == 0;
  if (v19 > 1) {
    BOOL v25 = 1;
  }
  if (v25 || !v3) {
    downloadProgressView = 0;
  }
  else {
    downloadProgressView = self->_downloadProgressView;
  }
  [(SFNavigationBarToggleButton *)self->_formatMenuButton setAccessoryView:downloadProgressView];
  if (v4)
  {
    double v27 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
    [(SFMoreMenuButton *)self->_downloadProgressView setTintColor:v27];
  }
  else
  {
    [(SFMoreMenuButton *)self->_downloadProgressView setTintColor:0];
  }
  [(SFUnifiedTabBarItemView *)self setNeedsLayout];
}

- (void)_updateFormatMenuButtonStyle
{
  unint64_t v3 = self->_accessoryButtonLayout - 1;
  [(SFNavigationBarToggleButton *)self->_formatMenuButton setCornerRoundingMode:v3 < 2];
  double v4 = 2.0;
  if ((unint64_t)(self->_accessoryButtonLayout - 1) <= 1) {
    double v4 = _SFOnePixel();
  }
  [(SFNavigationBarToggleButton *)self->_formatMenuButton setInsetFromBackground:v4];
  unint64_t v5 = [(SFUnifiedBarItemView *)self barTheme];
  unint64_t v6 = [v5 tintStyle];
  BOOL v7 = [v5 themeColor];
  if (_SFIsPrivateTintStyle(v6))
  {
    if (v7) {
      int v8 = objc_msgSend(v7, "safari_meetsThresholdForDarkAppearance");
    }
    else {
      int v8 = _SFIsDarkTintStyle(v6);
    }
    unsigned int v9 = v8 ^ 1;
  }
  else
  {
    unsigned int v9 = 0;
  }
  if (v3 > 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }

  formatMenuButton = self->_formatMenuButton;

  [(SFNavigationBarToggleButton *)formatMenuButton setUsesInsetFromBackground:v10];
}

- (void)_updateBadges
{
  [(SFBadgeContainerView *)self->_moreMenuButtonContainer setShowsBadge:(self->_menuButtonBadges & 3) != 0];
  unint64_t menuButtonBadges = self->_menuButtonBadges;
  if ([(SFUnifiedTabBarItemView *)self _showsFormatMenuButtonAccessories])
  {
    [(SFMoreMenuButton *)self->_downloadProgressView downloadProgress];
    double v5 = v4;
    if ([(SFWebExtensionButtonConfiguration *)self->_extensionButtonConfiguration activeExtensionCount]&& self->_mediaStateIcon)
    {
      menuButtonBadges |= v5 != -2.0;
    }
    else
    {
      menuButtonBadges &= ~1uLL;
    }
  }
  int64_t accessoryButtonLayout = self->_accessoryButtonLayout;
  if (accessoryButtonLayout == 2) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2 * (accessoryButtonLayout != 1);
  }
  [(SFNavigationBarToggleButton *)self->_formatMenuButton setShowsBadge:(v7 & menuButtonBadges) != 0];
  int v8 = [(SFWebExtensionButtonConfiguration *)self->_extensionButtonConfiguration buttons];
  int v9 = objc_msgSend(v8, "safari_containsObjectPassingTest:", &__block_literal_global_12);

  if (v9)
  {
    unint64_t v10 = [(SFWebExtensionButtonConfiguration *)self->_extensionButtonConfiguration activeExtensionCount];
    BOOL v11 = v10 > [(SFUnifiedTabBarItemView *)self _individualExtensionButtonLimit];
  }
  else
  {
    BOOL v11 = 0;
  }
  uint64_t v12 = self->_showsBadgeOnExtensionsButton || v11;
  multipleExtensionsButtonContainer = self->_multipleExtensionsButtonContainer;

  [(SFBadgeContainerView *)multipleExtensionsButtonContainer setShowsBadge:v12];
}

uint64_t __40__SFUnifiedTabBarItemView__updateBadges__block_invoke(uint64_t a1, void *a2)
{
  return [a2 badged];
}

- (void)_voiceSearchAvailabilityDidChange:(id)a3
{
  double v4 = +[SFVoiceSearchManager sharedManager];
  -[UIButton setEnabled:](self->_voiceSearchButton, "setEnabled:", [v4 availability] == 1);

  [(SFUnifiedTabBarItemView *)self applyTheme];
}

- (void)updateAccessibilityIdentifier
{
  v13[3] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SFUnifiedBarItemView *)self item];
  v12[0] = @"UUID";
  double v4 = [v3 UUID];
  uint64_t v5 = [v4 UUIDString];
  unint64_t v6 = (void *)v5;
  uint64_t v7 = &stru_1EDA07C28;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  v13[0] = v7;
  v12[1] = @"isSelected";
  if ([(SFUnifiedTabBarItemView *)self isSelected]) {
    int v8 = @"true";
  }
  else {
    int v8 = @"false";
  }
  v13[1] = v8;
  v12[2] = @"isPinned";
  if ([v3 isPinned]) {
    int v9 = @"true";
  }
  else {
    int v9 = @"false";
  }
  v13[2] = v9;
  unint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  BOOL v11 = WBSMakeAccessibilityIdentifier();
  [(SFUnifiedTabBarItemView *)self setAccessibilityIdentifier:v11];
}

- (void)_setNeedsAnimatedAccessoryButtonUpdate
{
  if (![(SFUnifiedTabBarItemView *)self _coalescingAccessoryButtonUpdates])
  {
    if (self->_needsAnimatedAccessoryButtonUpdate) {
      char v3 = 1;
    }
    else {
      char v3 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
    }
    self->_needsAnimatedAccessoryButtonUpdate = v3;
    [(SFUnifiedTabBarItemView *)self setNeedsLayout];
  }
}

- (void)_updateAccessoryButtons
{
  if (self->_needsAnimatedAccessoryButtonUpdate)
  {
    BOOL v3 = 1;
  }
  else
  {
    [MEMORY[0x1E4FB1EB0] inheritedAnimationDuration];
    BOOL v3 = v4 > 0.0;
  }

  [(SFUnifiedTabBarItemView *)self _updateAccessoryButtonsAnimated:v3 completion:0];
}

- (void)_updateAccessoryButtonsAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  unint64_t v6 = (void (**)(void))a4;
  if (![(SFUnifiedTabBarItemView *)self _coalescingAccessoryButtonUpdates])
  {
    double v46 = v6;
    uint64_t v7 = [SFUnifiedTabBarItemAccessoryButtonArrangement alloc];
    int64_t accessoryButtonLayout = self->_accessoryButtonLayout;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke;
    v64[3] = &unk_1E54EAA20;
    v64[4] = self;
    id v9 = [(SFUnifiedTabBarItemAccessoryButtonArrangement *)v7 initUsingButtonLayout:accessoryButtonLayout filteringButtonsUsingBlock:v64];
    if (self->_trailingButtonsHidden)
    {
      unint64_t v10 = [SFUnifiedTabBarItemAccessoryButtonArrangement alloc];
      BOOL v11 = [v9 leadingButtonTypes];
      uint64_t v12 = [(SFUnifiedTabBarItemAccessoryButtonArrangement *)self->_accessoryButtonArrangement trailingButtonTypes];
      uint64_t v13 = [(SFUnifiedTabBarItemAccessoryButtonArrangement *)v10 initWithLeadingButtonTypes:v11 trailingButtonTypes:v12];

      id v9 = (id)v13;
    }
    p_accessoryButtonArrangement = &self->_accessoryButtonArrangement;
    if ([v9 isEqualToArrangement:self->_accessoryButtonArrangement])
    {
      id v15 = (void *)MEMORY[0x1E4FB1EB0];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_2;
      v63[3] = &unk_1E54E9858;
      v63[4] = self;
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_3;
      v61[3] = &unk_1E54E9D78;
      v62 = v6;
      objc_msgSend(v15, "sf_animate:usingDefaultTimingWithOptions:animations:completion:", v4, 2, v63, v61);
      id v16 = v62;
    }
    else
    {
      [(SFUnifiedTabBarItemView *)self _updateBadges];
      [(SFUnifiedTabBarItemView *)self _updateExtensionButtonConfigurationShowingOverflow:[(SFWebExtensionButtonConfiguration *)self->_extensionButtonConfiguration activeExtensionCount] > [(SFUnifiedTabBarItemView *)self _individualExtensionButtonLimit] activeExtensionCount:[(SFWebExtensionButtonConfiguration *)self->_extensionButtonConfiguration activeExtensionCount]];
      uint64_t v17 = [(SFUnifiedTabBarItemAccessoryButtonArrangement *)*p_accessoryButtonArrangement leadingButtonTypes];
      double v18 = [v9 leadingButtonTypes];
      unint64_t v19 = [(SFUnifiedTabBarItemAccessoryButtonArrangement *)*p_accessoryButtonArrangement trailingButtonTypes];
      double v20 = [v9 trailingButtonTypes];
      objc_storeStrong((id *)p_accessoryButtonArrangement, v9);
      v45 = (void *)v17;
      double v21 = [v18 differenceFromArray:v17 withOptions:4];
      double v22 = objc_msgSend(v21, "safari_insertionIndexes");
      double v44 = objc_msgSend(v21, "safari_removalIndexes");
      double v23 = [v20 differenceFromArray:v19 withOptions:4];
      double v24 = objc_msgSend(v23, "safari_insertionIndexes");
      double v42 = v23;
      uint64_t v25 = objc_msgSend(v23, "safari_removalIndexes");
      double v43 = v24;
      if (v4)
      {
        double v39 = v22;
        double v40 = v21;
        v38 = (void *)MEMORY[0x1E4FB1EB0];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_4;
        v56[3] = &unk_1E54EAA48;
        v56[4] = self;
        id v26 = v22;
        id v57 = v26;
        v41 = v18;
        id v27 = v18;
        id v58 = v27;
        id v28 = v24;
        double v29 = (void *)v25;
        id v30 = v19;
        id v31 = v28;
        id v59 = v28;
        id v32 = v20;
        id v60 = v32;
        [v38 performWithoutAnimation:v56];
        double v33 = (void *)MEMORY[0x1E4FB1EB0];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_5;
        v47[3] = &unk_1E54EAA70;
        v47[4] = self;
        id v48 = v44;
        id v49 = v45;
        id v50 = v29;
        double v34 = v30;
        id v51 = v30;
        id v52 = v26;
        id v53 = v27;
        id v54 = v31;
        id v55 = v32;
        objc_msgSend(v33, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 98, v47, 0);
        unint64_t v6 = v46;
        if (v46)
        {
          dispatch_time_t v35 = dispatch_time(0, 200000000);
          dispatch_after(v35, MEMORY[0x1E4F14428], v46);
        }

        double v18 = v41;
        unint64_t v19 = v34;
        double v22 = v39;
        double v21 = v40;
        double v36 = v44;
        v37 = v42;
      }
      else
      {
        [(SFUnifiedTabBarItemView *)self _setIndexes:v44 ofAccessoryButtonTypes:v45 visible:0 animated:0];
        [(SFUnifiedTabBarItemView *)self _setIndexes:v25 ofAccessoryButtonTypes:v19 visible:0 animated:0];
        [(SFUnifiedTabBarItemView *)self _setIndexes:v22 ofAccessoryButtonTypes:v18 visible:1 animated:0];
        [(SFUnifiedTabBarItemView *)self _setIndexes:v24 ofAccessoryButtonTypes:v20 visible:!self->_trailingButtonsHidden animated:0];
        [(SFUnifiedTabBarItemView *)self _layOutAccessoryButtons];
        double v29 = (void *)v25;
        unint64_t v6 = v46;
        double v36 = v44;
        v37 = v42;
        if (v46) {
          v46[2](v46);
        }
      }

      id v16 = v45;
    }
  }
}

uint64_t __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _showsAccessoryButtonOfType:a2];
}

uint64_t __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layOutAccessoryButtons];
}

uint64_t __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _setIndexes:*(void *)(a1 + 40) ofAccessoryButtonTypes:*(void *)(a1 + 48) visible:0 animated:0];
  [*(id *)(a1 + 32) _layOutIndexes:*(void *)(a1 + 40) ofAccessoryButtonTypes:*(void *)(a1 + 48) alongEdge:0 usingPresentationSize:1];
  [*(id *)(a1 + 32) _setIndexes:*(void *)(a1 + 56) ofAccessoryButtonTypes:*(void *)(a1 + 64) visible:0 animated:0];
  BOOL v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);

  return [v2 _layOutIndexes:v3 ofAccessoryButtonTypes:v4 alongEdge:1 usingPresentationSize:1];
}

uint64_t __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _setIndexes:*(void *)(a1 + 40) ofAccessoryButtonTypes:*(void *)(a1 + 48) visible:0 animated:1];
  [*(id *)(a1 + 32) _layOutIndexes:*(void *)(a1 + 40) ofAccessoryButtonTypes:*(void *)(a1 + 48) alongEdge:0 usingPresentationSize:0];
  [*(id *)(a1 + 32) _setIndexes:*(void *)(a1 + 56) ofAccessoryButtonTypes:*(void *)(a1 + 64) visible:0 animated:1];
  [*(id *)(a1 + 32) _layOutIndexes:*(void *)(a1 + 56) ofAccessoryButtonTypes:*(void *)(a1 + 64) alongEdge:1 usingPresentationSize:0];
  [*(id *)(a1 + 32) _setIndexes:*(void *)(a1 + 72) ofAccessoryButtonTypes:*(void *)(a1 + 80) visible:1 animated:1];
  [*(id *)(a1 + 32) _setIndexes:*(void *)(a1 + 88) ofAccessoryButtonTypes:*(void *)(a1 + 96) visible:*(unsigned char *)(*(void *)(a1 + 32) + 1040) == 0 animated:1];
  BOOL v2 = *(void **)(a1 + 32);

  return [v2 _layOutAccessoryButtons];
}

- (void)_layOutAccessoryButtons
{
  uint64_t v3 = [(SFUnifiedTabBarItemAccessoryButtonArrangement *)self->_accessoryButtonArrangement leadingButtonTypes];
  [(SFUnifiedTabBarItemView *)self _layOutIndexes:0 ofAccessoryButtonTypes:v3 alongEdge:0 usingPresentationSize:0];
  self->_double leadingButtonsWidth = v4;

  id v6 = [(SFUnifiedTabBarItemAccessoryButtonArrangement *)self->_accessoryButtonArrangement trailingButtonTypes];
  [(SFUnifiedTabBarItemView *)self _layOutIndexes:0 ofAccessoryButtonTypes:v6 alongEdge:1 usingPresentationSize:0];
  self->_double trailingButtonsWidth = v5;
}

- (double)_layOutIndexes:(id)a3 ofAccessoryButtonTypes:(id)a4 alongEdge:(int64_t)a5 usingPresentationSize:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  if ([v11 count])
  {
    uint64_t v12 = [(SFUnifiedBarItemView *)self contentView];
    uint64_t v13 = [v12 layer];

    if (v6)
    {
      uint64_t v14 = [v13 presentationLayer];
      id v15 = (void *)v14;
      if (v14) {
        id v16 = (void *)v14;
      }
      else {
        id v16 = v13;
      }
      id v17 = v16;

      uint64_t v13 = v17;
    }
    [v13 bounds];
    CGFloat x = v46.origin.x;
    CGFloat y = v46.origin.y;
    CGFloat width = v46.size.width;
    CGFloat height = v46.size.height;
    CGFloat v22 = CGRectGetHeight(v46);
    BOOL v23 = [(UIView *)self _sf_usesLeftToRightLayout] == a5;
    BOOL v24 = a5 == 1;
    if (a5 == 1) {
      [v11 lastObject];
    }
    else {
    id v26 = [v11 firstObject];
    }
    uint64_t v27 = [v26 integerValue];

    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v45[3] = v27;
    uint64_t v41 = 0;
    double v42 = (double *)&v41;
    uint64_t v43 = 0x2020000000;
    uint64_t v44 = 0;
    [(SFUnifiedTabBarItemView *)self _insetForAccessoryButtonOfType:v27];
    uint64_t v44 = v28;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __97__SFUnifiedTabBarItemView__layOutIndexes_ofAccessoryButtonTypes_alongEdge_usingPresentationSize___block_invoke;
    v30[3] = &unk_1E54EAA98;
    CGFloat v34 = v22;
    uint64_t v35 = v27;
    v30[4] = self;
    id v32 = &v41;
    double v33 = v45;
    CGFloat v36 = x;
    CGFloat v37 = y;
    CGFloat v38 = width;
    CGFloat v39 = height;
    id v31 = v10;
    BOOL v40 = v23;
    [v11 enumerateObjectsWithOptions:2 * v24 usingBlock:v30];
    double v25 = v42[3];

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(v45, 8);
  }
  else
  {
    double v25 = 0.0;
  }

  return v25;
}

void __97__SFUnifiedTabBarItemView__layOutIndexes_ofAccessoryButtonTypes_alongEdge_usingPresentationSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 integerValue];
  id v19 = [*(id *)(a1 + 32) _viewForAccessoryButtonOfType:v5];
  [*(id *)(a1 + 32) _widthForAccessoryButtonOfType:v5];
  double v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "_heightForAccessoryButtonOfType:withWidth:defaultHeight:", v5);
  if (v5 != *(void *)(a1 + 72))
  {
    [*(id *)(a1 + 32) _spacingBetweenAccessoryButtonOfType:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) andButtonOfType:v5];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
  }
  double v9 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  CGRectGetHeight(*(CGRect *)(a1 + 80));
  double v10 = _SFRoundRectToPixels(v9);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;
  id v17 = *(void **)(a1 + 40);
  if (!v17 || [v17 containsIndex:a3])
  {
    double v18 = _SFFlipRectInCoordinateSpace(*(unsigned char *)(a1 + 112), v10, v12, v14, v16, *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104));
    objc_msgSend(v19, "ss_setUntransformedFrame:", _SFRoundRectToPixels(v18));
    [v19 layoutIfNeeded];
  }
}

- (void)_setIndexes:(id)a3 ofAccessoryButtonTypes:(id)a4 visible:(BOOL)a5 animated:(BOOL)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__SFUnifiedTabBarItemView__setIndexes_ofAccessoryButtonTypes_visible_animated___block_invoke;
  v6[3] = &unk_1E54EAAE8;
  v6[4] = self;
  BOOL v7 = a5;
  BOOL v8 = a6;
  [a4 enumerateObjectsAtIndexes:a3 options:0 usingBlock:v6];
}

void __79__SFUnifiedTabBarItemView__setIndexes_ofAccessoryButtonTypes_visible_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = objc_msgSend(*(id *)(a1 + 32), "_viewForAccessoryButtonOfType:", objc_msgSend(v3, "integerValue"));
  unsigned int v5 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40))
  {
    int v6 = *(unsigned __int8 *)(a1 + 41);
    double v7 = 1.0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_scaleForTransitioningAccessoryButtonOfType:", objc_msgSend(v3, "integerValue"));
    double v7 = v8;
    int v6 = *(unsigned __int8 *)(a1 + 41);
    if (!*(unsigned char *)(a1 + 40))
    {
      double v9 = 0.0;
      goto LABEL_7;
    }
  }
  [v4 setHidden:0];
  if (*(unsigned char *)(a1 + 40)) {
    double v9 = 0.1;
  }
  else {
    double v9 = 0.0;
  }
LABEL_7:
  double v10 = (double)v5;
  double v11 = (void *)MEMORY[0x1E4FB1EB0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__SFUnifiedTabBarItemView__setIndexes_ofAccessoryButtonTypes_visible_animated___block_invoke_2;
  v16[3] = &unk_1E54EAAC0;
  id v17 = v4;
  double v18 = v10;
  double v19 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__SFUnifiedTabBarItemView__setIndexes_ofAccessoryButtonTypes_visible_animated___block_invoke_3;
  v13[3] = &unk_1E54EA1E0;
  char v15 = *(unsigned char *)(a1 + 40);
  id v14 = v17;
  id v12 = v17;
  objc_msgSend(v11, "sf_animate:withDuration:delay:options:animations:completion:", v6 != 0, 50331746, v16, v13, 0.2, v9);
}

uint64_t __79__SFUnifiedTabBarItemView__setIndexes_ofAccessoryButtonTypes_visible_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 48));
  BOOL v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __79__SFUnifiedTabBarItemView__setIndexes_ofAccessoryButtonTypes_visible_animated___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t result = [*(id *)(result + 32) alpha];
    if (v2 == 0.0)
    {
      id v3 = *(void **)(v1 + 32);
      return [v3 setHidden:1];
    }
  }
  return result;
}

- (void)_setTrailingButtonsHidden:(BOOL)a3
{
  if (self->_trailingButtonsHidden != a3)
  {
    BOOL v3 = a3;
    self->_trailingButtonsHidden = a3;
    id v6 = [(SFUnifiedTabBarItemAccessoryButtonArrangement *)self->_accessoryButtonArrangement trailingButtonTypes];
    CGAffineTransform v5 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
    [(SFUnifiedTabBarItemView *)self _setIndexes:v5 ofAccessoryButtonTypes:v6 visible:!v3 animated:1];
  }
}

- (BOOL)_showsAccessoryButtonOfType:(int64_t)a3
{
  char v5 = [(SFUnifiedTabBarItemView *)self showsSearchField];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __55__SFUnifiedTabBarItemView__showsAccessoryButtonOfType___block_invoke;
  v45[3] = &unk_1E54EAB10;
  v45[4] = self;
  char v46 = v5;
  id v6 = _Block_copy(v45);
  double v7 = v6;
  switch(a3)
  {
    case 0:
      uint64_t v10 = 1150;
      goto LABEL_5;
    case 1:
      double v11 = [(SFWebExtensionButtonConfiguration *)self->_extensionButtonConfiguration webExtensionsController];
      id v12 = [v11 extensions];
      uint64_t v13 = [v12 count];

      if (self->_active) {
        char v14 = v5;
      }
      else {
        char v14 = 1;
      }
      char showsPinnedIndicator = v14 ^ 1;
      if ((v14 & 1) != 0 || v13) {
        goto LABEL_70;
      }
      goto LABEL_18;
    case 2:
      if (self->_active) {
        char v15 = v5;
      }
      else {
        char v15 = 1;
      }
      if (v15) {
        goto LABEL_69;
      }
LABEL_18:
      CGFloat v16 = [(SFUnifiedTabBarItemView *)self titleWhenActive];
      char showsPinnedIndicator = [v16 length] != 0;

      goto LABEL_70;
    case 3:
      if (self->_mediaStateIcon) {
        char v17 = v5;
      }
      else {
        char v17 = 1;
      }
      if (v17) {
        goto LABEL_69;
      }
      double v18 = [(SFUnifiedBarItemView *)self contentView];
      [v18 bounds];
      double Width = CGRectGetWidth(v47);
      [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer minimumWidthToShowTitle];
      double v21 = v20;
      [(SFUnifiedTabBarItemView *)self _widthForAccessoryButtonOfType:3];
      char showsPinnedIndicator = Width >= v21 + v22;

      goto LABEL_70;
    case 4:
      char showsPinnedIndicator = (*((uint64_t (**)(void *))v6 + 2))(v6);
      goto LABEL_70;
    case 5:
      if (!self->_active
        || ((*((uint64_t (**)(void *))v6 + 2))(v6) & 1) != 0
        || ![(SFUnifiedTabBarItemView *)self showsStopReloadButton])
      {
        goto LABEL_69;
      }
      if (self->_stopReloadButtonShowsStop) {
        char showsPinnedIndicator = 0;
      }
      else {
        char showsPinnedIndicator = v5 ^ 1;
      }
      goto LABEL_70;
    case 6:
      if (!self->_active
        || ((*((uint64_t (**)(void *))v6 + 2))(v6) & 1) != 0
        || ![(SFUnifiedTabBarItemView *)self showsStopReloadButton])
      {
        goto LABEL_69;
      }
      uint64_t v10 = 1148;
LABEL_5:
      if (*((unsigned char *)&self->super.super.super.super.super.super.isa + v10)) {
        char showsPinnedIndicator = v5 ^ 1;
      }
      else {
        char showsPinnedIndicator = 0;
      }
      goto LABEL_70;
    case 7:
      unint64_t v23 = [(SFWebExtensionButtonConfiguration *)self->_extensionButtonConfiguration activeExtensionCount];
      char showsPinnedIndicator = 0;
      if (self->_active) {
        char v24 = v5;
      }
      else {
        char v24 = 1;
      }
      if (v24) {
        goto LABEL_70;
      }
      unint64_t v25 = v23;
      if (!v23) {
        goto LABEL_70;
      }
      goto LABEL_46;
    case 8:
      unint64_t v26 = [(SFWebExtensionButtonConfiguration *)self->_extensionButtonConfiguration activeExtensionCount];
      char showsPinnedIndicator = 0;
      if (self->_active) {
        char v27 = v5;
      }
      else {
        char v27 = 1;
      }
      if ((v27 & 1) == 0)
      {
        unint64_t v25 = v26;
        if (v26 >= 2) {
LABEL_46:
        }
          char showsPinnedIndicator = v25 <= [(SFUnifiedTabBarItemView *)self _individualExtensionButtonLimit];
      }
      goto LABEL_70;
    case 9:
      if (self->_active) {
        char v28 = v5;
      }
      else {
        char v28 = 1;
      }
      if (v28) {
        goto LABEL_69;
      }
      if ([(SFWebExtensionButtonConfiguration *)self->_extensionButtonConfiguration alwaysShowMultipleExtensionsButton])
      {
        char showsPinnedIndicator = 1;
      }
      else
      {
        unint64_t v44 = [(SFWebExtensionButtonConfiguration *)self->_extensionButtonConfiguration activeExtensionCount];
        char showsPinnedIndicator = v44 > [(SFUnifiedTabBarItemView *)self _individualExtensionButtonLimit];
      }
      goto LABEL_70;
    case 10:
    case 11:
      int64_t v8 = [(SFUnifiedTabBarAvailabilityItem *)self->_currentAvailabilityItem buttonType];
      if (!self->_active) {
        goto LABEL_69;
      }
      char showsPinnedIndicator = (v8 == a3) & ~v5;
      goto LABEL_70;
    case 12:
      if (self->_unread) {
        char v29 = v5;
      }
      else {
        char v29 = 1;
      }
      if (v29) {
        goto LABEL_69;
      }
      [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer minimumWidthToShowTitle];
      double v31 = v30;
      [(SFUnifiedTabBarItemView *)self _widthForAccessoryButtonOfType:12];
      double v33 = v31 + v32;
      if (self->_mediaStateIcon)
      {
        [(SFUnifiedTabBarItemView *)self _widthForAccessoryButtonOfType:3];
        double v33 = v33 + v34;
      }
      uint64_t v35 = [(SFUnifiedTabBarItemView *)self shareParticipants];
      uint64_t v36 = [v35 count];

      if (!v36) {
        goto LABEL_67;
      }
      [(SFUnifiedTabBarItemView *)self _widthForAccessoryButtonOfType:13];
      double v33 = v33 + v37;
      [(SFUnifiedTabBarItemView *)self _spacingBetweenAccessoryButtonOfType:13 andButtonOfType:12];
      break;
    case 13:
      CGFloat v39 = [(SFUnifiedTabBarItemView *)self shareParticipants];
      if (![v39 count]) {
        char v5 = 1;
      }

      if (v5) {
        goto LABEL_69;
      }
      [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer minimumWidthToShowTitle];
      double v41 = v40;
      [(SFUnifiedTabBarItemView *)self _widthForAccessoryButtonOfType:13];
      double v33 = v41 + v42;
      if (!self->_mediaStateIcon) {
        goto LABEL_67;
      }
      [(SFUnifiedTabBarItemView *)self _widthForAccessoryButtonOfType:3];
      break;
    case 14:
      if (self->_active) {
        goto LABEL_69;
      }
      char showsPinnedIndicator = self->_showsPinnedIndicator;
      goto LABEL_70;
    default:
LABEL_69:
      char showsPinnedIndicator = 0;
      goto LABEL_70;
  }
  double v33 = v33 + v38;
LABEL_67:
  [(SFUnifiedTabBarItemView *)self bounds];
  char showsPinnedIndicator = CGRectGetWidth(v48) >= v33;
LABEL_70:

  return showsPinnedIndicator;
}

uint64_t __55__SFUnifiedTabBarItemView__showsAccessoryButtonOfType___block_invoke(uint64_t a1)
{
  double v2 = *(unsigned char **)(a1 + 32);
  if (!v2[1144] || !v2[1149]) {
    return 0;
  }
  if ([v2 showsSearchIcon]) {
    return 1;
  }
  CGAffineTransform v4 = [*(id *)(a1 + 32) titleWhenActive];
  if ([v4 length]) {
    BOOL v3 = *(unsigned char *)(a1 + 40) != 0;
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

- (id)_viewForAccessoryButtonOfType:(int64_t)a3
{
  if (unint64_t)a3 <= 0xE && ((0x73FFu >> a3))
  {
    id v4 = *(id *)((char *)&self->super.super.super.super.super.super.isa + *off_1E54EAB30[a3]);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (double)_widthForAccessoryButtonOfType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      double v9 = [(SFUnifiedBarItemView *)self barMetrics];
      [v9 tabCloseButtonWidth];
      goto LABEL_7;
    case 2:
      [(SFNavigationBarToggleButton *)self->_formatMenuButton intrinsicContentSize];
      return v11;
    case 4:
    case 5:
    case 6:
      [(UIButton *)self->_stopButton intrinsicContentSize];
      double v5 = v4;
      [(UIButton *)self->_reloadButton intrinsicContentSize];
      return fmax(v5, v6);
    case 7:
    case 8:
      return 19.0 + 6.0 + 6.0;
    default:
      double v9 = -[SFUnifiedTabBarItemView _viewForAccessoryButtonOfType:](self, "_viewForAccessoryButtonOfType:");
      [v9 intrinsicContentSize];
LABEL_7:
      double v8 = v10;

      return v8;
  }
}

- (double)_heightForAccessoryButtonOfType:(int64_t)a3 withWidth:(double)a4 defaultHeight:(double)a5
{
  return a5;
}

- (double)_insetForAccessoryButtonOfType:(int64_t)a3
{
  double result = 3.5;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    return 0.0;
  }
  return result;
}

- (double)_scaleForTransitioningAccessoryButtonOfType:(int64_t)a3
{
  double result = 1.0;
  if (a3 && a3 != 13)
  {
    if (a3 == 12) {
      return 0.5;
    }
    else {
      +[SFUnifiedBarMetrics transitioningItemScale];
    }
  }
  return result;
}

- (double)_spacingBetweenAccessoryButtonOfType:(int64_t)a3 andButtonOfType:(int64_t)a4
{
  BOOL v4 = a4 == 12 && a3 == 13;
  double result = 0.0;
  if (v4) {
    return 6.0;
  }
  return result;
}

- (id)_makeAccessoryButtonWithImage:(id)a3 scale:(int64_t)a4 action:(SEL)a5
{
  double v7 = [(SFUnifiedTabBarItemView *)self _accessoryButtonConfigurationWithImage:a3 scale:a4];
  double v8 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v7 primaryAction:0];
  objc_msgSend(v8, "sf_applyContentSizeCategoryLimitsForToolbarButton");
  if (a5) {
    [v8 addTarget:self action:a5 forControlEvents:0x2000];
  }
  double v9 = [(SFUnifiedBarItemView *)self contentView];
  [v9 addSubview:v8];

  return v8;
}

- (id)_makeAccessoryButtonWithImage:(id)a3 action:(SEL)a4
{
  return [(SFUnifiedTabBarItemView *)self _makeAccessoryButtonWithImage:a3 scale:2 action:a4];
}

- (id)_accessoryButtonConfigurationWithImage:(id)a3 scale:(int64_t)a4
{
  double v5 = (void *)MEMORY[0x1E4FB14D8];
  id v6 = a3;
  double v7 = [v5 plainButtonConfiguration];
  double v8 = [MEMORY[0x1E4FB1618] clearColor];
  double v9 = [v7 background];
  [v9 setBackgroundColor:v8];

  [v7 setImage:v6];
  double v10 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:a4];
  [v7 setPreferredSymbolConfigurationForImage:v10];

  objc_msgSend(v7, "setContentInsets:", 6.0, 6.0, 6.0, 6.0);

  return v7;
}

- (id)_makeMediaStateMuteButton
{
  double v2 = [(SFUnifiedTabBarItemView *)self _makeAccessoryButtonWithImage:0 action:sel__mediaStateMuteButtonTapped];
  uint64_t v3 = [MEMORY[0x1E4FB1618] systemRedColor];
  [v2 setTintColor:v3];

  return v2;
}

- (id)_closeButtonConfiguration
{
  uint64_t v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.square.fill"];
  BOOL v4 = [(SFUnifiedTabBarItemView *)self _accessoryButtonConfigurationWithImage:v3 scale:1];

  return v4;
}

- (void)_temporarilyCoalesceAccessoryButtonUpdates
{
  if (self->_active && !self->_accessoryButtonUpdateTimer)
  {
    objc_initWeak(&location, self);
    uint64_t v3 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    double v9 = __69__SFUnifiedTabBarItemView__temporarilyCoalesceAccessoryButtonUpdates__block_invoke;
    double v10 = &unk_1E54E9970;
    objc_copyWeak(&v11, &location);
    BOOL v4 = [v3 timerWithTimeInterval:0 repeats:&v7 block:0.2];
    accessoryButtonUpdateTimer = self->_accessoryButtonUpdateTimer;
    self->_accessoryButtonUpdateTimer = v4;

    id v6 = objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop", v7, v8, v9, v10);
    [v6 addTimer:self->_accessoryButtonUpdateTimer forMode:*MEMORY[0x1E4F1C4B0]];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __69__SFUnifiedTabBarItemView__temporarilyCoalesceAccessoryButtonUpdates__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _stopAccessoryButtonUpdateTimer];
    [v2 _setNeedsAnimatedAccessoryButtonUpdate];
    id WeakRetained = v2;
  }
}

- (void)_stopAccessoryButtonUpdateTimer
{
  [(NSTimer *)self->_accessoryButtonUpdateTimer invalidate];
  accessoryButtonUpdateTimer = self->_accessoryButtonUpdateTimer;
  self->_accessoryButtonUpdateTimer = 0;
}

- (BOOL)_coalescingAccessoryButtonUpdates
{
  return self->_accessoryButtonUpdateTimer != 0;
}

- (void)_startReloadButtonExpirationTimer
{
  [(SFUnifiedTabBarItemView *)self _stopReloadButtonExpirationTimer];
  uint64_t v3 = [(NSDate *)self->_lastReloadDate dateByAddingTimeInterval:480.0];
  [v3 timeIntervalSinceNow];
  if (v4 > 0.0)
  {
    double v5 = v4;
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __60__SFUnifiedTabBarItemView__startReloadButtonExpirationTimer__block_invoke;
    uint64_t v13 = &unk_1E54E9970;
    objc_copyWeak(&v14, &location);
    uint64_t v7 = [v6 timerWithTimeInterval:0 repeats:&v10 block:v5];
    reloadButtonExpirationTimer = self->_reloadButtonExpirationTimer;
    self->_reloadButtonExpirationTimer = v7;

    double v9 = objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop", v10, v11, v12, v13);
    [v9 addTimer:self->_reloadButtonExpirationTimer forMode:*MEMORY[0x1E4F1C4B0]];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __60__SFUnifiedTabBarItemView__startReloadButtonExpirationTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _setNeedsAnimatedAccessoryButtonUpdate];
    [v2 _stopReloadButtonExpirationTimer];
    id WeakRetained = v2;
  }
}

- (void)_stopReloadButtonExpirationTimer
{
  [(NSTimer *)self->_reloadButtonExpirationTimer invalidate];
  reloadButtonExpirationTimer = self->_reloadButtonExpirationTimer;
  self->_reloadButtonExpirationTimer = 0;
}

- (id)test_reloadButtonExpirationTimer
{
  return self->_reloadButtonExpirationTimer;
}

- (unint64_t)_individualExtensionButtonLimit
{
  [(SFUnifiedTabBarItemView *)self bounds];
  double Width = CGRectGetWidth(v6);
  [(SFUnifiedBarItemView *)self squishedInset];
  if (Width + v4 < 330.0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (BOOL)_availabilityButtonsReplaceFormatMenuButton
{
  return ![(SFUnifiedTabBarItemAccessoryButtonArrangement *)self->_accessoryButtonArrangement containsButtonType:1];
}

- (void)beginTransitioningSearchField
{
}

- (void)endTransitioningSearchField
{
}

- (void)setSquishedInset:(double)a3
{
  [(SFUnifiedBarItemView *)self squishedInset];
  if (v5 != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SFUnifiedTabBarItemView;
    [(SFUnifiedBarItemView *)&v6 setSquishedInset:a3];
    [(SFUnifiedTabBarItemView *)self setNeedsLayout];
  }
}

- (void)_setTitleContainerMasked:(BOOL)a3
{
  if (self->_titleContainerMasked != a3)
  {
    self->_titleContainerMasked = a3;
    if (a3)
    {
      double v5 = SFFadeOutImage([(UIView *)self _sf_usesLeftToRightLayout], 9.5);
      objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v5];
      [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setMaskView:v6];
      uint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__SFUnifiedTabBarItemView__setTitleContainerMasked___block_invoke;
      void v12[3] = &unk_1E54E9A60;
      id v13 = v6;
      id v14 = self;
      id v8 = v6;
      [v7 performWithoutAnimation:v12];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__SFUnifiedTabBarItemView__setTitleContainerMasked___block_invoke_2;
    v10[3] = &unk_1E54EA208;
    v10[4] = self;
    BOOL v11 = a3;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __52__SFUnifiedTabBarItemView__setTitleContainerMasked___block_invoke_3;
    v9[3] = &unk_1E54E9998;
    v9[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:50331648 animations:v10 completion:v9];
  }
}

uint64_t __52__SFUnifiedTabBarItemView__setTitleContainerMasked___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1618] blackColor];
  [*(id *)(a1 + 32) setBackgroundColor:v2];

  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 _layOutTitleContainerMask];
}

void __52__SFUnifiedTabBarItemView__setTitleContainerMasked___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB1618] blackColor];
  }
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 896) maskView];
  [v3 setBackgroundColor:v4];

  if (!v2)
  {
  }
}

uint64_t __52__SFUnifiedTabBarItemView__setTitleContainerMasked___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 994)) {
    return [*(id *)(v1 + 896) setMaskView:0];
  }
  return result;
}

- (void)_layOutTitleContainerMask
{
  uint64_t v3 = [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer maskView];
  if (v3)
  {
    id v20 = v3;
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    double v9 = v8;
    CGFloat v11 = v10;
    double trailingButtonsWidth = self->_trailingButtonsWidth;
    [(SFUnifiedBarItemView *)self squishedInset];
    double v14 = v9 + trailingButtonsWidth - v13 + -3.0;
    if (![(SFUnifiedTabBarItemView *)self _iconVisibility])
    {
      [(SFUnifiedTabBarItemView *)self _squishedInsetToHideCloseButton];
      double v14 = v14 + v15;
    }
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer bounds];
    objc_msgSend(v20, "setFrame:", _SFFlipRectInCoordinateSpace(!-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"), v5, v7, v14, v11, v16, v17, v18, v19));
    uint64_t v3 = v20;
  }
}

- (double)_squishedInsetToHideCloseButton
{
  int v2 = [(SFUnifiedBarItemView *)self barMetrics];
  [v2 tabCloseButtonWidth];
  double v4 = v3;
  [v2 leadingTabIconInset];
  double v6 = v4 - v5;

  return v6;
}

- (double)_closeButtonAlphaForSquishedInset
{
  [(SFUnifiedBarItemView *)self squishedInset];
  double v4 = v3;
  [(SFUnifiedTabBarItemView *)self _squishedInsetToHideCloseButton];
  return fmax(fmin(_SFUninterpolate(v4, v5 * 0.5, 0.0), 1.0), 0.0);
}

- (double)_squishedInsetToHideTrailingButtons
{
  int64_t v3 = [(SFUnifiedTabBarItemView *)self _iconVisibility];
  double result = 8.0;
  if (!v3)
  {
    [(SFUnifiedTabBarItemView *)self _squishedInsetToHideCloseButton];
    return v5 + 8.0;
  }
  return result;
}

- (void)fluidProgressViewWillShowProgress:(id)a3
{
  self->_showingProgress = 1;
  [(SFUnifiedTabBarItemView *)self _updateShowsProgressView];
}

- (void)fluidProgressViewDidShowProgress:(id)a3
{
  self->_showingProgress = 0;
  [(SFUnifiedTabBarItemView *)self _updateShowsProgressView];
}

- (BOOL)_scribbleInteractionIsEnabled:(id)a3
{
  return self->_active;
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v7 = -[SFUnifiedBarItemView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  double v8 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SFUnifiedTabBarItemView _scribbleInteraction:shouldBeginAtLocation:](v8);
  }
  if ([(SFUnifiedTabBarItemView *)self showsSearchField])
  {
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer frame];
    v11.CGFloat x = x;
    v11.CGFloat y = y;
    char v9 = CGRectContainsPoint(v12, v11);
  }

  return v9 & 1;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  double v5 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SFUnifiedTabBarItemView _scribbleInteraction:willBeginWritingInElement:]();
  }
  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setSuppressesText:1];
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  double v5 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SFUnifiedTabBarItemView _scribbleInteraction:didFinishWritingInElement:]();
  }
  [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer setSuppressesText:0];
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  double v6 = (void (**)(id, void *, uint64_t))a5;
  CGFloat v7 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SFUnifiedTabBarItemView _scribbleInteraction:requestElementsInRect:completion:]();
  }
  double v8 = [(SFUnifiedTabBarItemView *)self searchField];
  if ([v8 isFirstResponder]) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v11[0] = @"pencilTextInputElementIdentifier";
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v6[2](v6, v10, v9);
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  double v10 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SFUnifiedTabBarItemView _scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v8 isEqual:@"pencilTextInputElementIdentifier"] & 1) != 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __108__SFUnifiedTabBarItemView__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
    void v12[3] = &unk_1E54EA478;
    void v12[4] = self;
    id v13 = v9;
    [WeakRetained tabBarItemViewDidRequestFocusForPencilInput:self completionHandler:v12];
  }
  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __108__SFUnifiedTabBarItemView__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  int v2 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __108__SFUnifiedTabBarItemView__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke_cold_1();
  }
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = [*(id *)(a1 + 32) searchField];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)availabilityDisplayController:(id)a3 didUpdateWithState:(int64_t)a4
{
  id v20 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  if (![v20 isDisplaying])
  {
    currentAvailabilityItem = self->_currentAvailabilityItem;
    self->_currentAvailabilityItem = 0;

    [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer dismissAvailabilityLabelAnimated:1 withCompletionHandler:0];
    [WeakRetained dismissAvailabilityLabelAnimated:1 withCompletionHandler:0];
LABEL_11:
    [(SFUnifiedTabBarItemView *)self _updateFormatMenuButtonImage];
    goto LABEL_12;
  }
  char v6 = [v20 currentOptions];
  if ((v6 & 0x20) != 0)
  {
    CGRect v12 = [(SFUnifiedTabBarItemView *)self makeReaderAvailabilityAction];
LABEL_8:
    id v13 = self->_currentAvailabilityItem;
    self->_currentAvailabilityItem = v12;

    id v8 = [v20 currentLabel];
    [(SFUnifiedTabBarAvailabilityItem *)self->_currentAvailabilityItem setTitle:v8];
    goto LABEL_9;
  }
  if ((v6 & 0x40) != 0)
  {
    CGRect v12 = [(SFUnifiedTabBarItemView *)self makeTranslationAvailabilityAction];
    goto LABEL_8;
  }
  CGFloat v7 = [SFUnifiedTabBarAvailabilityItem alloc];
  id v8 = [v20 currentLabel];
  id v9 = [(SFUnifiedTabBarAvailabilityItem *)v7 initWithTitle:v8];
  double v10 = self->_currentAvailabilityItem;
  self->_currentAvailabilityItem = v9;

LABEL_9:
  titleContainer = self->_titleContainer;
  double v15 = [(SFUnifiedTabBarAvailabilityItem *)self->_currentAvailabilityItem title];
  [(SFUnifiedTabBarItemTitleContainerView *)titleContainer presentAvailabilityLabelWithText:v15];

  CGFloat v16 = [(SFUnifiedTabBarAvailabilityItem *)self->_currentAvailabilityItem title];
  [WeakRetained presentAvailabilityLabelWithText:v16];

  uint64_t v17 = [(SFUnifiedTabBarAvailabilityItem *)self->_currentAvailabilityItem image];
  if (v17)
  {
    CGFloat v18 = (void *)v17;
    BOOL v19 = [(SFUnifiedTabBarItemView *)self _availabilityButtonsReplaceFormatMenuButton];

    if (v19) {
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (id)availabilityDisplayController:(id)a3 determineBestLabelsForPresentation:(id)a4
{
  id v5 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__SFUnifiedTabBarItemView_availabilityDisplayController_determineBestLabelsForPresentation___block_invoke;
  v16[3] = &unk_1E54E9858;
  void v16[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v16];
  uint64_t v6 = [v5 count];
  uint64_t v7 = v6 - 1;
  if (v6 == 1)
  {
LABEL_9:
    id v9 = [v5 lastObject];
  }
  else
  {
    uint64_t v8 = 0;
    while (1)
    {
      id v9 = [v5 objectAtIndexedSubscript:v8];
      uint64_t v10 = [v9 count];
      if (!v10) {
        break;
      }
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      while (1)
      {
        id v13 = [v9 textForOptionsAtIndex:v12];
        BOOL v14 = [(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer requiresTruncationToDisplayAvailabilityLabel:v13];

        if (v14) {
          break;
        }
        if (v11 == ++v12) {
          goto LABEL_10;
        }
      }

      if (++v8 == v7) {
        goto LABEL_9;
      }
    }
  }
LABEL_10:

  return v9;
}

uint64_t __92__SFUnifiedTabBarItemView_availabilityDisplayController_determineBestLabelsForPresentation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_hover:(id)a3
{
  id v4 = a3;
  if ((unint64_t)([v4 state] - 1) > 1)
  {
    BOOL v15 = 0;
  }
  else
  {
    [(SFUnifiedTabBarItemView *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v4 locationInView:self];
    v20.CGFloat x = v13;
    v20.CGFloat y = v14;
    v21.origin.CGFloat x = v6;
    v21.origin.CGFloat y = v8;
    v21.size.CGFloat width = v10;
    v21.size.CGFloat height = v12;
    BOOL v15 = CGRectContainsPoint(v21, v20);
  }
  [(SFUnifiedTabBarItemView *)self setHovering:v15];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __34__SFUnifiedTabBarItemView__hover___block_invoke;
  v19[3] = &unk_1E54E9858;
  v19[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v19];
  BOOL v16 = [(SFUnifiedTabBarItemView *)self _showsCloseButtonOnHover];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __34__SFUnifiedTabBarItemView__hover___block_invoke_2;
  v17[3] = &unk_1E54EA208;
  v17[4] = self;
  BOOL v18 = v16;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v17 options:0 animations:0.2 completion:0.0];
}

uint64_t __34__SFUnifiedTabBarItemView__hover___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCloseButtonForHoverPosition];
}

uint64_t __34__SFUnifiedTabBarItemView__hover___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePlatterEffect];
  LOBYTE(v2) = *(unsigned char *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 1104) setAlpha:(double)v2];
  uint64_t v3 = [*(id *)(a1 + 32) contentView];
  [*(id *)(*(void *)(a1 + 32) + 896) iconFrame];
  objc_msgSend(v3, "convertRect:fromView:", *(void *)(*(void *)(a1 + 32) + 896));
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 1104) frame];
    v21.origin.CGFloat x = v12;
    v21.origin.CGFloat y = v13;
    v21.size.CGFloat width = v14;
    v21.size.CGFloat height = v15;
    v20.origin.CGFloat x = v5;
    v20.origin.CGFloat y = v7;
    v20.size.CGFloat width = v9;
    v20.size.CGFloat height = v11;
    BOOL v16 = CGRectIntersectsRect(v20, v21);
  }
  else
  {
    BOOL v16 = 0;
  }
  uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 896);

  return [v17 setHidesIconForHover:v16];
}

- (void)setHovering:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SFUnifiedBarItemView *)self isHovering] != a3)
  {
    BOOL v5 = [(SFUnifiedTabBarItemView *)self showsStopReloadButton];
    v7.receiver = self;
    v7.super_class = (Class)SFUnifiedTabBarItemView;
    [(SFUnifiedBarItemView *)&v7 setHovering:v3];
    if (v5 != [(SFUnifiedTabBarItemView *)self showsStopReloadButton]) {
      [(SFUnifiedTabBarItemView *)self _setNeedsAnimatedAccessoryButtonUpdate];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained tabBarItemView:self didUpdateHovering:v3];
    }
  }
}

- (BOOL)_showsCloseButtonOnHover
{
  int v3 = [(SFUnifiedBarItemView *)self isHovering];
  if (v3)
  {
    if (![(SFUnifiedTabBarItemTitleContainerView *)self->_titleContainer isNarrow]
      || (int v3 = [(SFUnifiedTabBarItemView *)self _commandPressed]) != 0)
    {
      if (self->_active
        && ([(SFUnifiedBarItemView *)self squishedInset],
            double v5 = v4,
            [(SFUnifiedTabBarItemView *)self _squishedInsetToHideCloseButton],
            v5 <= v6)
        || [(SFUnifiedBarItemView *)self isOccluded])
      {
        LOBYTE(v3) = 0;
      }
      else
      {
        LOBYTE(v3) = [(SFUnifiedTabBarItemView *)self isSelected] ^ 1;
      }
    }
  }
  return v3;
}

- (BOOL)_commandPressed
{
  unint64_t v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  unint64_t v3 = ((unint64_t)objc_msgSend(v2, "sf_currentKeyboardModifierFlags") >> 20) & 1;

  return v3;
}

- (void)_updateCloseButtonForHoverPosition
{
  unint64_t v3 = [(SFUnifiedBarItemView *)self barMetrics];
  [v3 tabCloseButtonWidth];
  CGFloat v5 = v4;

  double v6 = [(SFUnifiedBarItemView *)self contentView];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v19.origin.CGFloat x = v8;
  v19.origin.CGFloat y = v10;
  v19.size.CGFloat width = v12;
  v19.size.CGFloat height = v14;
  CGFloat Height = CGRectGetHeight(v19);
  double v16 = _SFFlipRectInCoordinateSpace(![(UIView *)self _sf_usesLeftToRightLayout], 0.0, 0.0, v5, Height, v8, v10, v12, v14);
  closeButtonForHover = self->_closeButtonForHover;

  [(SFUnifiedTabBarItemViewCloseButton *)closeButtonForHover setFrame:v16];
}

- (id)pointerRegionIdentifierForInteractionLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[SFUnifiedBarItemView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  double v6 = (SFUnifiedTabBarItemViewCloseButton *)objc_claimAutoreleasedReturnValue();
  double v7 = v6;
  if (v6 == self->_closeButton
    && (-[SFUnifiedTabBarItemViewCloseButton convertPoint:fromView:](v6, "convertPoint:fromView:", self, x, y),
        !-[SFUnifiedTabBarItemViewCloseButton pointInsideForPointer:](v7, "pointInsideForPointer:"))
    || v7 == self->_closeButtonForHover
    && (-[SFUnifiedTabBarItemViewCloseButton convertPoint:fromView:](v7, "convertPoint:fromView:", self, x, y),
        !-[SFUnifiedTabBarItemViewCloseButton pointInsideForPointer:](v7, "pointInsideForPointer:")))
  {
    double v9 = 0;
    goto LABEL_16;
  }
  if (v7 == self->_closeButton)
  {
    uint64_t v13 = 1;
LABEL_15:
    double v9 = objc_alloc_init(SFUnifiedTabBarPointerRegionIdentifier);
    [(SFUnifiedTabBarPointerRegionIdentifier *)v9 setPointerStyle:v13];
    [(SFUnifiedTabBarPointerRegionIdentifier *)v9 setViewForPreview:v7];
    goto LABEL_16;
  }
  if (v7 == self->_closeButtonForHover)
  {
    uint64_t v13 = 2;
    goto LABEL_15;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v9 = 0;
  if (v7 != (SFUnifiedTabBarItemViewCloseButton *)self && (isKindOfClass & 1) != 0)
  {
    CGFloat v10 = [(SFUnifiedTabBarItemViewCloseButton *)v7 superview];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      uint64_t v12 = [(SFUnifiedTabBarItemViewCloseButton *)v7 superview];

      uint64_t v13 = 0;
      double v7 = (SFUnifiedTabBarItemViewCloseButton *)v12;
    }
    else
    {
      uint64_t v13 = 0;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v9;
}

- (BOOL)canBecomeFocused
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained tabBarItemViewCanBecomeFocused:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (SFUnifiedTabBarItemViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFUnifiedTabBarItemViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)showsVoiceSearchButton
{
  return self->_showsVoiceSearchButton;
}

- (BOOL)showsReaderIcon
{
  return self->_showsReaderIcon;
}

- (BOOL)showsTranslationIcon
{
  return self->_showsTranslationIcon;
}

- (BOOL)showsSiriReaderPlayingIcon
{
  return self->_showsSiriReaderPlayingIcon;
}

- (BOOL)stopReloadButtonShowsStop
{
  return self->_stopReloadButtonShowsStop;
}

- (NSDate)lastReloadDate
{
  return self->_lastReloadDate;
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)showsCloseButton
{
  return self->_showsCloseButton;
}

- (SFMenuConfiguring)formatMenuButtonConfigurator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_formatMenuButtonConfigurator);

  return (SFMenuConfiguring *)WeakRetained;
}

- (int64_t)accessoryButtonLayout
{
  return self->_accessoryButtonLayout;
}

- (SFUnifiedTabBarItemTitleContainerView)squishedTitleContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);

  return (SFUnifiedTabBarItemTitleContainerView *)WeakRetained;
}

- (BOOL)showsSquishedAccessoryViews
{
  return self->_showsSquishedAccessoryViews;
}

- (SFWebExtensionButtonConfiguration)extensionButtonConfiguration
{
  return self->_extensionButtonConfiguration;
}

- (unint64_t)menuButtonBadges
{
  return self->_menuButtonBadges;
}

- (BOOL)showsBadgeOnExtensionsButton
{
  return self->_showsBadgeOnExtensionsButton;
}

- (UIButton)multipleExtensionsButton
{
  return self->_multipleExtensionsButton;
}

- (UIButton)firstExtensionButton
{
  return self->_firstExtensionButton;
}

- (UIButton)secondExtensionButton
{
  return self->_secondExtensionButton;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (BOOL)showsPinnedIndicator
{
  return self->_showsPinnedIndicator;
}

- (BOOL)hasHiddenElements
{
  return self->_hasHiddenElements;
}

- (SFURLFieldOverlayConfiguration)overlayConfiguration
{
  return self->_overlayConfiguration;
}

- (SFURLFieldOverlayConfiguration)overlayNarrowConfiguration
{
  return self->_overlayNarrowConfiguration;
}

- (void)setOverlayNarrowConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayNarrowConfiguration, 0);
  objc_storeStrong((id *)&self->_overlayConfiguration, 0);
  objc_storeStrong((id *)&self->_secondExtensionButton, 0);
  objc_storeStrong((id *)&self->_firstExtensionButton, 0);
  objc_storeStrong((id *)&self->_multipleExtensionsButton, 0);
  objc_storeStrong((id *)&self->_extensionButtonConfiguration, 0);
  objc_destroyWeak((id *)&self->_squishedTitleContainer);
  objc_destroyWeak((id *)&self->_formatMenuButtonConfigurator);
  objc_storeStrong((id *)&self->_lastReloadDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_availabilityDisplayController, 0);
  objc_storeStrong((id *)&self->_currentAvailabilityItem, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_closeButtonForHover, 0);
  objc_destroyWeak((id *)&self->_fluidProgressController);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_participantsView, 0);
  objc_storeStrong((id *)&self->_unreadIndicator, 0);
  objc_storeStrong((id *)&self->_multipleExtensionsButtonContainer, 0);
  objc_storeStrong((id *)&self->_secondExtensionButtonContainer, 0);
  objc_storeStrong((id *)&self->_firstExtensionButtonContainer, 0);
  objc_storeStrong((id *)&self->_accessoryButtonUpdateTimer, 0);
  objc_storeStrong((id *)&self->_accessoryButtonArrangement, 0);
  objc_storeStrong((id *)&self->_pinnedIndicator, 0);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_reloadButtonExpirationTimer, 0);
  objc_storeStrong((id *)&self->_reloadButton, 0);
  objc_storeStrong((id *)&self->_voiceSearchButton, 0);
  objc_storeStrong((id *)&self->_mediaStateMuteButton, 0);
  objc_storeStrong((id *)&self->_downloadProgressView, 0);
  objc_storeStrong((id *)&self->_formatMenuButton, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_moreMenuButton, 0);
  objc_storeStrong((id *)&self->_moreMenuButtonContainer, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);

  objc_storeStrong((id *)&self->_titleContainer, 0);
}

- (void)_scribbleInteraction:(void *)a1 shouldBeginAtLocation:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  unint64_t v2 = (objc_class *)objc_opt_class();
  unint64_t v3 = NSStringFromClass(v2);
  int v4 = 138543362;
  CGFloat v5 = v3;
  _os_log_debug_impl(&dword_18C354000, v1, OS_LOG_TYPE_DEBUG, "Should begin Scribble interaction in <%{public}@>", (uint8_t *)&v4, 0xCu);
}

- (void)_scribbleInteraction:willBeginWritingInElement:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18C354000, v0, v1, "Will begin writing for Scribble interaction", v2, v3, v4, v5, v6);
}

- (void)_scribbleInteraction:didFinishWritingInElement:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18C354000, v0, v1, "Did finish writing for Scribble interaction", v2, v3, v4, v5, v6);
}

- (void)_scribbleInteraction:requestElementsInRect:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18C354000, v0, v1, "Requesting elements for Scribble interaction", v2, v3, v4, v5, v6);
}

- (void)_scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18C354000, v0, v1, "Focusing element for Scribble interaction", v2, v3, v4, v5, v6);
}

void __108__SFUnifiedTabBarItemView__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18C354000, v0, v1, "Calling completionBlock for focusing Scribble element", v2, v3, v4, v5, v6);
}

@end