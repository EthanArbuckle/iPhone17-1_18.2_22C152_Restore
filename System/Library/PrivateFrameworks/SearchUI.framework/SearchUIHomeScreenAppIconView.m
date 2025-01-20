@interface SearchUIHomeScreenAppIconView
+ (id)cacheForVariant:(unint64_t)a3;
+ (id)neverSuggestAppShortcutItemWithLocalizedName:(id)a3;
- (BOOL)addRoundedKeyboardHighlight;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)currentIconIsPlaceholder;
- (BOOL)iconView:(id)a3 shouldActivateApplicationShortcutItem:(id)a4 atIndex:(unint64_t)a5;
- (BOOL)iconViewCanBeginDrags:(id)a3;
- (BOOL)iconViewShouldBeginShortcutsPresentation:(id)a3;
- (BOOL)iconViewShouldIncludeUninstallShortcutItem:(id)a3;
- (BOOL)isInSuggestionContext;
- (BOOL)isTimedOutForIcon:(id)a3;
- (BOOL)labelNeedsUpdateOnMovingToWindow;
- (BOOL)shouldActivateApplicationShortcutItem:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)shouldHideShortcutsForAppIcon:(id)a3;
- (BOOL)shouldUseSecureWindowForShortcutsPresentationWithIconView:(id)a3;
- (CGRect)highlightFrame;
- (SearchUIFeedbackDelegate)feedbackDelegate;
- (SearchUIHomeScreenAppIconView)init;
- (SearchUIHomeScreenEngagementDelegate)engagementDelegate;
- (SearchUIRowModel)rowModel;
- (TLKProminenceView)focusHighlightView;
- (TLKProminenceView)placeholderView;
- (double)focusHighlightCornerRadius;
- (id)createNewIconLabelViewFactory;
- (id)focusEffect;
- (id)focusGroupIdentifier;
- (id)iconView:(id)a3 applicationShortcutItemsWithProposedItems:(id)a4;
- (id)keyCommands;
- (id)parallaxSettingsForShortcutsPresentationWithIconView:(id)a3;
- (int64_t)focusItemDeferralMode;
- (int64_t)iconView:(id)a3 draggingStartLocationWithProposedStartLocation:(int64_t)a4;
- (unint64_t)imageLoadingBehavior;
- (unint64_t)variant;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_launchWithModifierFlags:(int64_t)a3;
- (void)_updateLabel;
- (void)didEngageWithTriggerEvent:(unint64_t)a3 destination:(unint64_t)a4;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)hidePlaceholder:(BOOL)a3;
- (void)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5;
- (void)iconImageViewDidChangeContents:(id)a3 forIcon:(id)a4;
- (void)iconTapped:(id)a3;
- (void)iconTapped:(id)a3 modifierFlags:(int64_t)a4;
- (void)iconViewWillBeginDrag:(id)a3 session:(id)a4;
- (void)launchIcon;
- (void)launchWithShift;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)removePlaceholderAndSetShadowAnimated:(BOOL)a3;
- (void)setAddRoundedKeyboardHighlight:(BOOL)a3;
- (void)setEngagementDelegate:(id)a3;
- (void)setFeedbackDelegate:(id)a3;
- (void)setFocusHighlightFrame;
- (void)setFocusHighlightView:(id)a3;
- (void)setIsInSuggestionContext:(BOOL)a3;
- (void)setLabelNeedsUpdateOnMovingToWindow:(BOOL)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setRowModel:(id)a3;
- (void)setVariant:(unint64_t)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIHomeScreenAppIconView

- (unint64_t)imageLoadingBehavior
{
  return 2;
}

- (void)removePlaceholderAndSetShadowAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SearchUIHomeScreenAppIconView *)self _iconImageView];
  [MEMORY[0x1E4FAE1A0] enableShadow:1 forView:v5];
  v6 = [(SearchUIHomeScreenAppIconView *)self placeholderView];
  [v6 _continuousCornerRadius];
  objc_msgSend(v5, "_setContinuousCornerRadius:");

  [(SearchUIHomeScreenAppIconView *)self effectiveScreenScale];
  double v8 = v7;
  v9 = [v5 layer];
  [v9 setContentsScale:v8];

  v10 = [v5 layer];
  [v10 setShadowPathIsBounds:1];

  v11 = [v5 layer];
  [v11 setAllowsGroupOpacity:0];

  v12 = NSString;
  v13 = [(SearchUIHomeScreenAppIconView *)self rowModel];
  v14 = [v13 identifyingResult];
  v15 = [v14 title];
  v16 = [v15 text];
  v17 = [v12 stringWithFormat:@"Identifier:AppIconButton,AppName:%@", v16];

  [(SearchUIHomeScreenAppIconView *)self setAccessibilityIdentifier:v17];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__SearchUIHomeScreenAppIconView_removePlaceholderAndSetShadowAnimated___block_invoke;
  v18[3] = &unk_1E6E72730;
  v18[4] = self;
  [MEMORY[0x1E4FAE198] performAnimatableChanges:v18 animated:v3];
}

- (void)hidePlaceholder:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SearchUIHomeScreenAppIconView *)self placeholderView];
  v6 = v5;
  if (v3) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  if (v3) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.0;
  }
  [v5 setAlpha:v7];

  id v9 = [(SearchUIHomeScreenAppIconView *)self _iconImageView];
  [v9 setAlpha:v8];
}

- (TLKProminenceView)placeholderView
{
  return (TLKProminenceView *)objc_getProperty(self, a2, 1280, 1);
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  [(SearchUIHomeScreenAppIconView *)self setRowModel:v4];
  v5 = [v4 identifyingResult];
  v6 = [v4 cardSection];
  double v7 = [v6 command];

  double v8 = [v4 cardSection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v10 = [v4 cardSection];
  }
  else
  {
    v10 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    double v7 = 0;
  }
  v11 = [v5 sectionBundleIdentifier];
  -[SearchUIHomeScreenAppIconView setIsInSuggestionContext:](self, "setIsInSuggestionContext:", [v11 isEqualToString:@"com.apple.searchd.zkw.apps"]);

  v12 = [v10 applicationBundleIdentifier];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    v15 = [v5 identifier];
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [v7 applicationBundleIdentifier];
    }
    id v14 = v17;
  }
  v18 = [v5 applicationBundleIdentifier];
  v19 = +[SearchUIUtilities bundleIdentifierForApp:0];
  int v20 = [v18 isEqualToString:v19];

  v21 = +[SearchUIHomeScreenModel sharedInstance];
  v22 = v21;
  if (v20) {
    [v21 clipIconForIdentifier:v14];
  }
  else {
  v23 = [v21 appIconForApplicationBundleIdentifier:v14];
  }

  if (!v23)
  {
    v23 = [[SearchUITemporaryInternalAppsIcon alloc] initWithResult:v5 variant:[(SearchUIHomeScreenAppIconView *)self variant]];
    v24 = SearchUIGeneralLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      [(SearchUIHomeScreenAppIconView *)v5 updateWithRowModel:v24];
    }
  }
  [(SBIcon *)v23 setDelegate:self];
  [(SearchUIHomeScreenAppIconView *)self setIcon:v23];
  if (v23)
  {
    v25 = [(SearchUIHomeScreenAppIconView *)self _iconImageView];
    v26 = [v25 displayedImage];
    if (v26)
    {
    }
    else
    {
      v27 = [(SearchUIHomeScreenAppIconView *)self icon];
      objc_opt_class();
      char v28 = objc_opt_isKindOfClass();

      if ((v28 & 1) == 0)
      {
        [(SearchUIHomeScreenAppIconView *)self hidePlaceholder:0];
        goto LABEL_24;
      }
    }
    [(SearchUIHomeScreenAppIconView *)self removePlaceholderAndSetShadowAnimated:0];
  }
LABEL_24:
}

- (void)setRowModel:(id)a3
{
}

- (SearchUIHomeScreenAppIconView)init
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIHomeScreenAppIconView;
  v2 = [(SearchUIHomeScreenAppIconView *)&v7 init];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4FAE120] viewWithProminence:3];
    [(SearchUIHomeScreenAppIconView *)v2 setPlaceholderView:v3];

    if (+[SearchUIUtilities isIpad]) {
      uint64_t v4 = 4;
    }
    else {
      uint64_t v4 = 5;
    }
    [(SearchUIHomeScreenAppIconView *)v2 setVariant:v4];
    v5 = [(SearchUIHomeScreenAppIconView *)v2 placeholderView];
    [(SearchUIHomeScreenAppIconView *)v2 insertSubview:v5 atIndex:0];

    [(SearchUIHomeScreenAppIconView *)v2 setSharesIconTintColorWithSpringBoard:1];
    [(SearchUIHomeScreenAppIconView *)v2 setUsesSceneUserInterfaceStyleForImage:1];
  }
  return v2;
}

- (void)setVariant:(unint64_t)a3
{
  if (self->_variant != a3)
  {
    self->_variant = a3;
    uint64_t v4 = [(id)objc_opt_class() cacheForVariant:a3];
    [(SearchUIHomeScreenAppIconView *)self setIconImageCache:v4];

    v5 = [(SearchUIHomeScreenAppIconView *)self rowModel];

    if (v5)
    {
      v6 = [(SearchUIHomeScreenAppIconView *)self rowModel];
      [(SearchUIHomeScreenAppIconView *)self updateWithRowModel:v6];
    }
    id v10 = [(SearchUIHomeScreenAppIconView *)self iconImageCache];
    [v10 iconImageInfo];
    double v8 = v7;
    id v9 = [(SearchUIHomeScreenAppIconView *)self placeholderView];
    [v9 _setContinuousCornerRadius:v8];
  }
}

- (SearchUIRowModel)rowModel
{
  return (SearchUIRowModel *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setPlaceholderView:(id)a3
{
}

+ (id)cacheForVariant:(unint64_t)a3
{
  if (cacheForVariant__onceToken != -1) {
    dispatch_once(&cacheForVariant__onceToken, &__block_literal_global_25);
  }
  uint64_t v4 = (void *)cacheForVariant__iconCache;
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    +[SearchUIAppIconImage sizeForVariant:a3];
    double v8 = v7;
    double v10 = v9;
    [MEMORY[0x1E4FAE198] appIconCornerRadiusRatio];
    double v12 = v8 * v11;
    v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 scale];
    double v15 = v14;

    v16 = [NSNumber numberWithInteger:a3];
    id v17 = [@"SearchUIIconImageCache" stringByAppendingFormat:@"-%@", v16];

    v6 = -[SBHIconImageCache initWithName:iconImageInfo:]([SearchUIIconImageCache alloc], "initWithName:iconImageInfo:", v17, v8, v10, v15, v12);
    v18 = (void *)cacheForVariant__iconCache;
    v19 = [NSNumber numberWithUnsignedInteger:a3];
    [v18 setObject:v6 forKey:v19];
  }
  return v6;
}

- (BOOL)iconViewShouldIncludeUninstallShortcutItem:(id)a3
{
  return 1;
}

uint64_t __71__SearchUIHomeScreenAppIconView_removePlaceholderAndSetShadowAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hidePlaceholder:1];
}

- (BOOL)currentIconIsPlaceholder
{
  v2 = [(SearchUIHomeScreenAppIconView *)self icon];
  BOOL v3 = [v2 leafIdentifier];
  char v4 = [v3 isEqualToString:SearchUIPlaceholderIconIdentifier];

  return v4;
}

- (CGRect)highlightFrame
{
  +[SearchUIAutoLayout selectionBorderWidth];
  double v4 = v3;
  [(SearchUIHomeScreenAppIconView *)self iconImageFrame];
  double v6 = v5 - v4;
  double v8 = v7 - v4;
  double v10 = v9 + v4 * 2.0;
  double v12 = v11 + v4 * 2.0;
  result.size.height = v10;
  result.size.width = v12;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SearchUIHomeScreenAppIconView;
  [(SearchUIHomeScreenAppIconView *)&v12 layoutSubviews];
  [(SearchUIHomeScreenAppIconView *)self iconImageFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(SearchUIHomeScreenAppIconView *)self placeholderView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(SearchUIHomeScreenAppIconView *)self setFocusHighlightFrame];
}

- (void)setFocusHighlightFrame
{
  double v3 = [(SearchUIHomeScreenAppIconView *)self layer];
  [v3 setAllowsGroupBlending:0];

  [(SearchUIHomeScreenAppIconView *)self highlightFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(SearchUIHomeScreenAppIconView *)self focusHighlightView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  id v15 = [(SearchUIHomeScreenAppIconView *)self focusHighlightView];
  v13 = [v15 superview];
  double v14 = [v13 layer];
  [v14 setAllowsGroupBlending:0];
}

- (TLKProminenceView)focusHighlightView
{
  return (TLKProminenceView *)objc_getProperty(self, a2, 1288, 1);
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIHomeScreenAppIconView;
  [(SearchUIHomeScreenAppIconView *)&v6 didMoveToWindow];
  [(SearchUIHomeScreenAppIconView *)self tlk_updateWithCurrentAppearance];
  uint64_t v3 = [(SearchUIHomeScreenAppIconView *)self window];
  if (v3)
  {
    double v4 = (void *)v3;
    BOOL v5 = [(SearchUIHomeScreenAppIconView *)self labelNeedsUpdateOnMovingToWindow];

    if (v5) {
      [(SearchUIHomeScreenAppIconView *)self _updateLabel];
    }
  }
}

- (void)_updateLabel
{
  uint64_t v3 = [(SearchUIHomeScreenAppIconView *)self window];

  if (v3)
  {
    [(SearchUIHomeScreenAppIconView *)self setLabelNeedsUpdateOnMovingToWindow:0];
    v4.receiver = self;
    v4.super_class = (Class)SearchUIHomeScreenAppIconView;
    [(SearchUIHomeScreenAppIconView *)&v4 _updateLabel];
  }
  else
  {
    [(SearchUIHomeScreenAppIconView *)self setLabelNeedsUpdateOnMovingToWindow:1];
  }
}

- (void)setLabelNeedsUpdateOnMovingToWindow:(BOOL)a3
{
  self->_labelNeedsUpdateOnMovingToWindow = a3;
}

- (BOOL)labelNeedsUpdateOnMovingToWindow
{
  return self->_labelNeedsUpdateOnMovingToWindow;
}

- (void)setAddRoundedKeyboardHighlight:(BOOL)a3
{
  if (self->_addRoundedKeyboardHighlight != a3)
  {
    BOOL v3 = a3;
    self->_addRoundedKeyboardHighlight = a3;
    BOOL v5 = [(SearchUIHomeScreenAppIconView *)self focusHighlightView];

    if (!v5 && v3)
    {
      objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FAE120]), "initWithProminence:", +[SearchUIFocusStyleUtilities secondaryHaloProminence](SearchUIFocusStyleUtilities, "secondaryHaloProminence"));
      [(SearchUIHomeScreenAppIconView *)self setFocusHighlightView:v6];

      double v7 = [(SearchUIHomeScreenAppIconView *)self focusHighlightView];
      [(SearchUIHomeScreenAppIconView *)self insertSubview:v7 atIndex:0];
    }
    [(SearchUIHomeScreenAppIconView *)self focusHighlightCornerRadius];
    double v9 = v8;
    double v10 = [(SearchUIHomeScreenAppIconView *)self focusHighlightView];
    [v10 _setContinuousCornerRadius:v9];

    [(SearchUIHomeScreenAppIconView *)self setFocusHighlightFrame];
    id v11 = [(SearchUIHomeScreenAppIconView *)self focusHighlightView];
    [v11 setHidden:!v3];
  }
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (void)setEngagementDelegate:(id)a3
{
}

- (void)tlk_updateForAppearance:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SearchUIHomeScreenAppIconView;
  id v4 = a3;
  [(SearchUIHomeScreenAppIconView *)&v15 tlk_updateForAppearance:v4];
  BOOL v5 = (void *)MEMORY[0x1E4FB21E0];
  int v6 = objc_msgSend(v4, "isDark", v15.receiver, v15.super_class);

  if (v6) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  double v8 = [v5 sharedInstanceForStyle:v7];
  id v9 = objc_alloc(MEMORY[0x1E4FB21E0]);
  uint64_t v10 = [v8 style];
  id v11 = [v8 primaryColor];
  objc_super v12 = [v8 secondaryColor];
  v13 = [MEMORY[0x1E4FB1618] clearColor];
  double v14 = (void *)[v9 initWithStyle:v10 primaryColor:v11 secondaryColor:v12 shadowColor:v13];

  [(SearchUIHomeScreenAppIconView *)self setLegibilitySettings:v14];
}

uint64_t __49__SearchUIHomeScreenAppIconView_cacheForVariant___block_invoke()
{
  cacheForVariant__iconCache = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusHighlightView, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
  objc_destroyWeak((id *)&self->_engagementDelegate);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
}

- (double)focusHighlightCornerRadius
{
  [MEMORY[0x1E4FAE198] appIconCornerRadiusRatio];
  double v4 = v3;
  [(SearchUIHomeScreenAppIconView *)self iconImageFrame];
  double Width = CGRectGetWidth(v8);
  +[SearchUIAutoLayout selectionBorderWidth];
  return v6 + v4 * Width;
}

- (id)keyCommands
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIHomeScreenAppIconView;
  v2 = [(SearchUIHomeScreenAppIconView *)&v6 keyCommands];
  if (!v2) {
    v2 = objc_opt_new();
  }
  double v3 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0x20000 action:sel_launchWithShift];
  [v3 setWantsPriorityOverSystemBehavior:1];
  double v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (void)launchWithShift
{
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)focusEffect
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SearchUIHomeScreenAppIconView;
  [(SearchUIHomeScreenAppIconView *)&v15 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  uint64_t v7 = [v6 nextFocusedView];
  if (v7 != self) {
    goto LABEL_4;
  }
  CGRect v8 = [(SearchUIHomeScreenAppIconView *)self engagementDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v7 = [(SearchUIHomeScreenAppIconView *)self rowModel];
    uint64_t v10 = [(SearchUIHomeScreenAppIconView *)self engagementDelegate];
    id v11 = [(SearchUIHomeScreenAppIconView *)v7 identifyingResult];
    objc_super v12 = [(SearchUIHomeScreenAppIconView *)v7 cardSection];
    [v10 didUpdateKeyboardFocusToResult:v11 cardSection:v12];

LABEL_4:
  }
  v13 = [MEMORY[0x1E4FB1998] mainSystem];
  [v13 setNeedsRebuild];

  double v14 = [v6 nextFocusedView];
  [(SearchUIHomeScreenAppIconView *)self setAddRoundedKeyboardHighlight:v14 == self];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIHomeScreenAppIconView;
  [(SearchUIHomeScreenAppIconView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(SearchUIHomeScreenAppIconView *)self tlk_updateWithCurrentAppearance];
}

- (id)createNewIconLabelViewFactory
{
  return (id)[MEMORY[0x1E4FA63E8] sharedInstance];
}

- (void)iconImageViewDidChangeContents:(id)a3 forIcon:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SearchUIHomeScreenAppIconView;
  id v6 = a4;
  [(SearchUIHomeScreenAppIconView *)&v12 iconImageViewDidChangeContents:a3 forIcon:v6];
  id v7 = [(SearchUIHomeScreenAppIconView *)self icon];

  if (v7 == v6)
  {
    BOOL v8 = [(SearchUIHomeScreenAppIconView *)self currentIconIsPlaceholder];
    if (a3)
    {
      if (!v8)
      {
        char v9 = [(SearchUIHomeScreenAppIconView *)self placeholderView];
        [v9 alpha];
        double v11 = v10;

        if (v11 == 1.0) {
          [(SearchUIHomeScreenAppIconView *)self removePlaceholderAndSetShadowAnimated:1];
        }
      }
    }
  }
}

- (void)iconViewWillBeginDrag:(id)a3 session:(id)a4
{
  [(SearchUIHomeScreenAppIconView *)self didEngageWithTriggerEvent:18 destination:0];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"SearchUIWillInitiateDragHomeScreenIconNotification" object:0];
}

- (BOOL)shouldHideShortcutsForAppIcon:(id)a3
{
  return !+[SearchUIUtilities deviceIsAuthenticatedForView:self];
}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  return objc_msgSend(MEMORY[0x1E4FB1708], "isEnabledByDefault", a3);
}

- (BOOL)isTimedOutForIcon:(id)a3
{
  id v3 = a3;
  id v4 = +[SearchUIScreenTimeManager sharedInstance];
  BOOL v5 = [v3 applicationBundleID];

  id v6 = [v4 getCachedObjectIfAvailableForKey:v5];

  LOBYTE(v4) = [v6 BOOLValue];
  return (char)v4;
}

- (void)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
}

- (void)_launchWithModifierFlags:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SearchUIHomeScreenAppIconView *)self engagementDelegate];

  if (v5)
  {
    id v6 = SearchUIGeneralLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(SearchUIHomeScreenAppIconView *)self icon];
      BOOL v8 = [(SearchUIHomeScreenAppIconView *)self rowModel];
      char v9 = [v8 identifyingResult];
      double v10 = [v9 applicationBundleIdentifier];
      int v15 = 138412546;
      v16 = v7;
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1E45B5000, v6, OS_LOG_TYPE_DEFAULT, "icon %@, rowModel:%@", (uint8_t *)&v15, 0x16u);
    }
    double v11 = [(SearchUIHomeScreenAppIconView *)self feedbackDelegate];
    objc_super v12 = +[SearchUIUtilities environmentForDelegate:v11];

    [v12 setModifierFlags:a3];
    v13 = [(SearchUIHomeScreenAppIconView *)self rowModel];
    double v14 = +[SearchUICommandHandler handlerForRowModel:v13 environment:v12];
    [v14 executeWithTriggerEvent:2];
  }
}

- (void)didEngageWithTriggerEvent:(unint64_t)a3 destination:(unint64_t)a4
{
  id v14 = [(SearchUIHomeScreenAppIconView *)self rowModel];
  id v7 = [v14 identifyingResult];
  BOOL v8 = [(SearchUIHomeScreenAppIconView *)self feedbackDelegate];
  uint64_t v9 = [v14 queryId];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v10 = (void *)[objc_alloc(MEMORY[0x1E4F9A340]) initWithResult:v7 triggerEvent:a3 destination:a4 actionTarget:0];
    [v10 setQueryId:v9];
    [v8 didEngageResult:v10];
  }
  double v11 = [(SearchUIHomeScreenAppIconView *)self rowModel];
  objc_super v12 = [v11 cardSection];

  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F99F30]) initWithCardSection:v12 destination:0 triggerEvent:a3 actionCardType:0];
    [v13 setQueryId:v9];
    [v8 didEngageCardSection:v13];
  }
}

- (void)iconTapped:(id)a3 modifierFlags:(int64_t)a4
{
}

- (void)iconTapped:(id)a3
{
  id v3 = [a3 icon];
  [v3 launchFromLocation:*MEMORY[0x1E4FA66C8] context:0];
}

- (void)launchIcon
{
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (forwardEvent(v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUIHomeScreenAppIconView;
    [(SearchUIHomeScreenAppIconView *)&v8 pressesBegan:v6 withEvent:v7];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (forwardEvent(v6))
  {
    v11.receiver = self;
    v11.super_class = (Class)SearchUIHomeScreenAppIconView;
    [(SearchUIHomeScreenAppIconView *)&v11 pressesEnded:v6 withEvent:v7];
  }
  else
  {
    objc_super v8 = [(SearchUIHomeScreenAppIconView *)self feedbackDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      double v10 = [(SearchUIHomeScreenAppIconView *)self feedbackDelegate];
      [v10 performSelector:sel_skipDown];
    }
  }
}

- (int64_t)focusItemDeferralMode
{
  return 2;
}

- (id)focusGroupIdentifier
{
  return +[SearchUIUtilities focusGroupIdentifier];
}

- (BOOL)iconViewShouldBeginShortcutsPresentation:(id)a3
{
  BOOL v4 = +[SearchUIUtilities deviceIsAuthenticatedForView:self];
  if (v4) {
    [(SearchUIHomeScreenAppIconView *)self didEngageWithTriggerEvent:5 destination:1];
  }
  return v4;
}

- (BOOL)iconView:(id)a3 shouldActivateApplicationShortcutItem:(id)a4 atIndex:(unint64_t)a5
{
  id v6 = [a3 icon];
  LOBYTE(self) = ![(SearchUIHomeScreenAppIconView *)self isTimedOutForIcon:v6];

  return (char)self;
}

- (BOOL)shouldUseSecureWindowForShortcutsPresentationWithIconView:(id)a3
{
  return 1;
}

- (id)parallaxSettingsForShortcutsPresentationWithIconView:(id)a3
{
  return 0;
}

- (int64_t)iconView:(id)a3 draggingStartLocationWithProposedStartLocation:(int64_t)a4
{
  return 5;
}

- (id)iconView:(id)a3 applicationShortcutItemsWithProposedItems:(id)a4
{
  BOOL v5 = objc_msgSend(a4, "mutableCopy", a3);
  id v6 = [(SearchUIHomeScreenAppIconView *)self rowModel];
  id v7 = [v6 identifyingResult];

  if ([v7 type] == 22)
  {
    [(SearchUIHomeScreenAppIconView *)self isInSuggestionContext];
  }
  else
  {
    int v8 = [v7 type];
    if ([(SearchUIHomeScreenAppIconView *)self isInSuggestionContext] && v8 != 24)
    {
      char v9 = objc_opt_class();
      double v10 = [v7 title];
      objc_super v11 = [v10 text];
      objc_super v12 = [v9 neverSuggestAppShortcutItemWithLocalizedName:v11];
      [v5 addObject:v12];
    }
  }

  return v5;
}

- (BOOL)shouldActivateApplicationShortcutItem:(id)a3 atIndex:(unint64_t)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 type];
  int v8 = [v7 isEqualToString:SearchUINeverShowSuggestionShortcutItemType];

  if (v8)
  {
    char v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v24 = @"SearchUIHomeScreenAppIconViewBundleIdUserInfoKey";
    double v10 = [(SearchUIHomeScreenAppIconView *)self rowModel];
    objc_super v11 = [v10 applicationBundleIdentifier];
    v25[0] = v11;
    objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [v9 postNotificationName:@"SearchUIHomeScreenAppIconViewDidHideIconNotification" object:0 userInfo:v12];

    v13 = objc_opt_new();
    [v13 setCategory:6];
    id v14 = [(SearchUIHomeScreenAppIconView *)self rowModel];
    int v15 = [v14 identifyingResult];
    v16 = [v15 identifier];
    [v13 setProactiveIdentifier:v16];

    __int16 v17 = [(SearchUIHomeScreenAppIconView *)self feedbackDelegate];
    v18 = +[SearchUIUtilities environmentForDelegate:v17];

    uint64_t v19 = [(SearchUIHomeScreenAppIconView *)self rowModel];
    int v20 = +[SearchUICommandHandler handlerForCommand:v13 rowModel:v19 button:0 sectionModel:0 environment:v18];

    [v20 executeWithTriggerEvent:17];
    BOOL v21 = 0;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)SearchUIHomeScreenAppIconView;
    BOOL v21 = [(SearchUIHomeScreenAppIconView *)&v23 shouldActivateApplicationShortcutItem:v6 atIndex:a4];
  }

  return v21;
}

+ (id)neverSuggestAppShortcutItemWithLocalizedName:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  BOOL v5 = NSString;
  id v6 = +[SearchUIUtilities localizedStringForKey:@"HIDE_APP_SUGGESTION"];
  id v7 = [v5 stringWithValidatedFormat:v6, @"%@", 0, v3 validFormatSpecifiers error];

  int v8 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"hand.raised"];
  [v4 setIcon:v8];

  [v4 setLocalizedTitle:v7];
  [v4 setType:SearchUINeverShowSuggestionShortcutItemType];

  return v4;
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return (SearchUIFeedbackDelegate *)WeakRetained;
}

- (SearchUIHomeScreenEngagementDelegate)engagementDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engagementDelegate);
  return (SearchUIHomeScreenEngagementDelegate *)WeakRetained;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (BOOL)addRoundedKeyboardHighlight
{
  return self->_addRoundedKeyboardHighlight;
}

- (void)setFocusHighlightView:(id)a3
{
}

- (BOOL)isInSuggestionContext
{
  return self->_isInSuggestionContext;
}

- (void)setIsInSuggestionContext:(BOOL)a3
{
  self->_isInSuggestionContext = a3;
}

- (void)updateWithRowModel:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [a1 applicationBundleIdentifier];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_fault_impl(&dword_1E45B5000, a3, OS_LOG_TYPE_FAULT, "No Springboard icon for app %@, identifier %@", (uint8_t *)&v6, 0x16u);
}

@end