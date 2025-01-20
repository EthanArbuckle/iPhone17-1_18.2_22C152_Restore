@interface SFUnifiedTabBarItem
- (BOOL)hasOverlayConfiguration;
- (BOOL)isUnread;
- (BOOL)showsBadgeOnExtensionsButton;
- (BOOL)tabEntityIsPrimaryForView:(id)a3;
- (NSArray)shareParticipants;
- (NSDate)lastReloadDate;
- (NSString)title;
- (NSUUID)UUID;
- (SFMenuConfiguring)menuButtonConfigurator;
- (SFNavigationBarItem)navigationBarItem;
- (SFUnifiedTabBarItem)init;
- (SFUnifiedTabBarItemView)itemView;
- (UIImage)icon;
- (double)downloadProgress;
- (id)bestButtonForExtensionPopoverSource:(id)a3;
- (id)menuElementRepresentationWithSelectionHandler:(id)a3;
- (id)tabEntityUUIDForView:(id)a3;
- (unint64_t)mediaStateIcon;
- (unint64_t)menuButtonBadges;
- (void)_configureItemView:(id)a3 isPreview:(BOOL)a4;
- (void)configureItemView:(id)a3 isPreview:(BOOL)a4;
- (void)navigationBarItemDidUpdateContentOptions:(id)a3 resetDisplay:(BOOL)a4;
- (void)navigationBarItemDidUpdateExtensionButtonConfiguration:(id)a3;
- (void)navigationBarItemDidUpdateFormatButtonSelected:(id)a3;
- (void)navigationBarItemDidUpdateHasHiddenElements:(id)a3;
- (void)navigationBarItemDidUpdateOverlayConfiguration:(id)a3;
- (void)navigationBarItemDidUpdateSecurityAnnotation:(id)a3;
- (void)navigationBarItemDidUpdateShowsLockIcon:(id)a3;
- (void)navigationBarItemDidUpdateShowsSearchIndicator:(id)a3;
- (void)navigationBarItemDidUpdateShowsSiriReaderPlayingIcon:(id)a3;
- (void)navigationBarItemDidUpdateShowsStopReloadButtons:(id)a3;
- (void)navigationBarItemDidUpdateShowsTranslationIcon:(id)a3;
- (void)navigationBarItemDidUpdateShowsVoiceSearchButton:(id)a3;
- (void)navigationBarItemDidUpdateStopReloadButtonShowsStop:(id)a3;
- (void)navigationBarItemDidUpdateText:(id)a3;
- (void)setDownloadProgress:(double)a3;
- (void)setDownloadProgress:(double)a3 animated:(BOOL)a4;
- (void)setIcon:(id)a3;
- (void)setLastReloadDate:(id)a3;
- (void)setMediaStateIcon:(unint64_t)a3;
- (void)setMenuButtonBadges:(unint64_t)a3;
- (void)setMenuButtonConfigurator:(id)a3;
- (void)setNavigationBarItem:(id)a3;
- (void)setReusableView:(id)a3;
- (void)setShareParticipants:(id)a3;
- (void)setShowsBadgeOnExtensionsButton:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUUID:(id)a3;
- (void)setUnread:(BOOL)a3;
- (void)toggleExtensionBadge;
@end

@implementation SFUnifiedTabBarItem

- (void)setUUID:(id)a3
{
}

- (SFUnifiedTabBarItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFUnifiedTabBarItem;
  v2 = [(SFUnifiedTabBarItem *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_downloadProgress = -2.0;
    shareParticipants = v2->_shareParticipants;
    v2->_shareParticipants = (NSArray *)MEMORY[0x1E4F1CBF0];

    [(SFUnifiedBarItem *)v3 setViewReuseIdentifier:@"SFUnifiedTabBarItem"];
    v5 = v3;
  }

  return v3;
}

- (void)setShowsBadgeOnExtensionsButton:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsBadgeOnExtensionsButton = a3;
  id v4 = [(SFUnifiedTabBarItem *)self itemView];
  [v4 setShowsBadgeOnExtensionsButton:v3];
}

- (void)setDownloadProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_downloadProgress = a3;
  id v6 = [(SFUnifiedTabBarItem *)self itemView];
  [v6 setDownloadProgress:v4 animated:a3];
}

- (void)setNavigationBarItem:(id)a3
{
  v5 = (SFNavigationBarItem *)a3;
  navigationBarItem = self->_navigationBarItem;
  if (navigationBarItem != v5)
  {
    v8 = v5;
    [(SFNavigationBarItem *)navigationBarItem removeObserver:self];
    objc_storeStrong((id *)&self->_navigationBarItem, a3);
    [(SFNavigationBarItem *)v8 addObserver:self];
    objc_super v7 = [(SFUnifiedTabBarItem *)self itemView];
    if (v7)
    {
      [(SFUnifiedTabBarItem *)self _configureItemView:v7 isPreview:0];
      objc_msgSend(v7, "setContentOptions:resetDisplay:", -[SFNavigationBarItem contentOptions](v8, "contentOptions"), 1);
    }

    v5 = v8;
  }
}

- (void)setMenuButtonBadges:(unint64_t)a3
{
  self->_menuButtonBadges = a3;
  id v4 = [(SFUnifiedTabBarItem *)self itemView];
  [v4 setMenuButtonBadges:a3];
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
  id v5 = a3;
  id v6 = [(SFUnifiedTabBarItem *)self itemView];
  [v6 setIcon:v5];
}

- (void)navigationBarItemDidUpdateShowsSearchIndicator:(id)a3
{
  uint64_t v4 = [a3 showsSearchIndicator];
  id v5 = [(SFUnifiedTabBarItem *)self itemView];
  [v5 setShowsSearchIcon:v4];
}

- (void)navigationBarItemDidUpdateShowsVoiceSearchButton:(id)a3
{
  uint64_t v4 = [a3 showsVoiceSearchButton];
  id v5 = [(SFUnifiedTabBarItem *)self itemView];
  [v5 setShowsVoiceSearchButton:v4];
}

- (void)navigationBarItemDidUpdateText:(id)a3
{
  id v4 = a3;
  id v8 = [(SFUnifiedTabBarItem *)self itemView];
  id v5 = [v4 text];
  [v8 setTitleWhenActive:v5];

  id v6 = [v4 textWhenExpanded];
  [v8 setTextWhenExpanded:v6];

  uint64_t v7 = [v4 startIndexOfTextInExpandedText];
  [v8 setStartIndexOfTitleInTextWhenExpanded:v7];
}

- (void)navigationBarItemDidUpdateExtensionButtonConfiguration:(id)a3
{
  id v5 = [a3 extensionButtonConfiguration];
  id v4 = [(SFUnifiedTabBarItem *)self itemView];
  [v4 setExtensionButtonConfiguration:v5];
}

- (void)setMenuButtonConfigurator:(id)a3
{
  p_menuButtonConfigurator = &self->_menuButtonConfigurator;
  id v5 = a3;
  objc_storeWeak((id *)p_menuButtonConfigurator, v5);
  id v6 = [(SFUnifiedTabBarItem *)self itemView];
  [v6 setFormatMenuButtonConfigurator:v5];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  title = self->_title;
  self->_title = v5;

  id v7 = [(SFUnifiedTabBarItem *)self itemView];
  [v7 setTitle:v4];
}

- (SFUnifiedTabBarItemView)itemView
{
  v2 = [(SFUnifiedBarItem *)self reusableView];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (SFUnifiedTabBarItemView *)v3;
}

- (void)setDownloadProgress:(double)a3
{
}

- (void)setLastReloadDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastReloadDate, a3);
  id v5 = a3;
  id v6 = [(SFUnifiedTabBarItem *)self itemView];
  [v6 setLastReloadDate:v5];
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  self->_mediaStateIcon = a3;
  id v4 = [(SFUnifiedTabBarItem *)self itemView];
  [v4 setMediaStateIcon:a3];
}

- (void)toggleExtensionBadge
{
  [(SFUnifiedTabBarItem *)self setMenuButtonBadges:2 * (self->_menuButtonBadges == 0)];
}

- (id)bestButtonForExtensionPopoverSource:(id)a3
{
  id v4 = a3;
  id v5 = [(SFUnifiedTabBarItem *)self itemView];
  id v6 = [v5 extensionButtonConfiguration];
  id v7 = [v6 buttons];

  id v8 = [v7 firstObject];
  id v9 = [v8 extension];

  if (v9 == v4)
  {
    v10 = [(SFUnifiedTabBarItem *)self itemView];
    v11 = [v10 firstExtensionButton];
  }
  else
  {
    if ((unint64_t)[v7 count] < 2)
    {
      v10 = 0;
    }
    else
    {
      v10 = [v7 objectAtIndexedSubscript:1];
    }
    id v12 = [v10 extension];

    v13 = [(SFUnifiedTabBarItem *)self itemView];
    v14 = v13;
    if (v12 == v4) {
      [v13 secondExtensionButton];
    }
    else {
    v11 = [v13 multipleExtensionsButton];
    }
  }

  return v11;
}

- (void)setUnread:(BOOL)a3
{
  if (self->_unread != a3)
  {
    BOOL v3 = a3;
    self->_unread = a3;
    id v4 = [(SFUnifiedTabBarItem *)self itemView];
    [v4 setUnread:v3];
  }
}

- (void)setShareParticipants:(id)a3
{
  id v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_shareParticipants, "isEqualToArray:"))
  {
    id v4 = (NSArray *)[v7 copy];
    shareParticipants = self->_shareParticipants;
    self->_shareParticipants = v4;

    id v6 = [(SFUnifiedTabBarItem *)self itemView];
    [v6 setShareParticipants:v7];
  }
}

- (void)setReusableView:(id)a3
{
  id v4 = a3;
  id v5 = [(SFUnifiedBarItem *)self reusableView];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)SFUnifiedTabBarItem;
    [(SFUnifiedBarItem *)&v6 setReusableView:v4];
    objc_msgSend(v4, "safari_setTabEntityProviderWithInfoProvider:", self);
  }
}

- (void)configureItemView:(id)a3 isPreview:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SFUnifiedTabBarItem *)self _configureItemView:v6 isPreview:v4];
  }
}

- (void)_configureItemView:(id)a3 isPreview:(BOOL)a4
{
  id v15 = a3;
  if (self->_icon)
  {
    objc_msgSend(v15, "setIcon:");
  }
  else
  {
    id v6 = +[_SFFaviconProvider fallbackFavicon];
    [v15 setIcon:v6];
  }
  [v15 setTitle:self->_title];
  id v7 = [(SFNavigationBarItem *)self->_navigationBarItem text];
  [v15 setTitleWhenActive:v7];

  id v8 = [(SFNavigationBarItem *)self->_navigationBarItem textWhenExpanded];
  [v15 setTextWhenExpanded:v8];

  objc_msgSend(v15, "setStartIndexOfTitleInTextWhenExpanded:", -[SFNavigationBarItem startIndexOfTextInExpandedText](self->_navigationBarItem, "startIndexOfTextInExpandedText"));
  objc_msgSend(v15, "setShowsSearchIcon:", -[SFNavigationBarItem showsSearchIndicator](self->_navigationBarItem, "showsSearchIndicator"));
  objc_msgSend(v15, "setShowsLockIcon:", -[SFNavigationBarItem showsLockIcon](self->_navigationBarItem, "showsLockIcon"));
  objc_msgSend(v15, "setShowsVoiceSearchButton:", -[SFNavigationBarItem showsVoiceSearchButton](self->_navigationBarItem, "showsVoiceSearchButton"));
  objc_msgSend(v15, "setSecurityAnnotation:", -[SFNavigationBarItem securityAnnotation](self->_navigationBarItem, "securityAnnotation"));
  objc_msgSend(v15, "setMenuButtonSelected:", -[SFNavigationBarItem menuButtonSelected](self->_navigationBarItem, "menuButtonSelected"));
  objc_msgSend(v15, "setShowsTranslationIcon:", -[SFNavigationBarItem showsTranslationIcon](self->_navigationBarItem, "showsTranslationIcon"));
  objc_msgSend(v15, "setShowsStopReloadButton:", -[SFNavigationBarItem showsStopReloadButtons](self->_navigationBarItem, "showsStopReloadButtons"));
  objc_msgSend(v15, "setStopReloadButtonShowsStop:", -[SFNavigationBarItem stopReloadButtonShowsStop](self->_navigationBarItem, "stopReloadButtonShowsStop"));
  [v15 setLastReloadDate:self->_lastReloadDate];
  [v15 setMediaStateIcon:self->_mediaStateIcon];
  id v9 = [(SFNavigationBarItem *)self->_navigationBarItem extensionButtonConfiguration];
  [v15 setExtensionButtonConfiguration:v9];

  [v15 setMenuButtonBadges:self->_menuButtonBadges];
  [v15 setShowsBadgeOnExtensionsButton:self->_showsBadgeOnExtensionsButton];
  [v15 setUnread:self->_unread];
  [v15 setShareParticipants:self->_shareParticipants];
  objc_msgSend(v15, "setShowsSiriReaderPlayingIcon:", -[SFNavigationBarItem showsSiriReaderPlayingIcon](self->_navigationBarItem, "showsSiriReaderPlayingIcon"));
  objc_msgSend(v15, "setHasHiddenElements:", -[SFNavigationBarItem hasHiddenElements](self->_navigationBarItem, "hasHiddenElements"));
  v10 = [(SFNavigationBarItem *)self->_navigationBarItem overlayConfiguration];
  [v15 setOverlayConfiguration:v10];

  double downloadProgress = -2.0;
  if (!a4)
  {
    id v12 = [(SFNavigationBarItem *)self->_navigationBarItem fluidProgressController];
    v13 = [(SFNavigationBarItem *)self->_navigationBarItem fluidProgressStateSource];
    v14 = [v13 progressState];
    [v15 setFluidProgressController:v12 withCurrentState:v14];

    double downloadProgress = self->_downloadProgress;
  }
  [v15 setDownloadProgress:0 animated:downloadProgress];
}

- (id)menuElementRepresentationWithSelectionHandler:(id)a3
{
  id v4 = a3;
  title = self->_title;
  id v6 = (void *)MEMORY[0x1E4FB13F0];
  icon = self->_icon;
  id v8 = icon;
  if (!icon)
  {
    id v8 = +[_SFFaviconProvider fallbackFavicon];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__SFUnifiedTabBarItem_menuElementRepresentationWithSelectionHandler___block_invoke;
  v12[3] = &unk_1E54E9488;
  v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  v10 = [v6 actionWithTitle:title image:v8 identifier:0 handler:v12];

  if (!icon) {

  }
  return v10;
}

uint64_t __69__SFUnifiedTabBarItem_menuElementRepresentationWithSelectionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)hasOverlayConfiguration
{
  BOOL v3 = [(SFNavigationBarItem *)self->_navigationBarItem overlayConfiguration];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(SFNavigationBarItem *)self->_navigationBarItem overlayNarrowConfiguration];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)navigationBarItemDidUpdateShowsLockIcon:(id)a3
{
  uint64_t v4 = [a3 showsLockIcon];
  id v5 = [(SFUnifiedTabBarItem *)self itemView];
  [v5 setShowsLockIcon:v4];
}

- (void)navigationBarItemDidUpdateShowsStopReloadButtons:(id)a3
{
  uint64_t v4 = [a3 showsStopReloadButtons];
  id v5 = [(SFUnifiedTabBarItem *)self itemView];
  [v5 setShowsStopReloadButton:v4];
}

- (void)navigationBarItemDidUpdateStopReloadButtonShowsStop:(id)a3
{
  uint64_t v4 = [a3 stopReloadButtonShowsStop];
  id v5 = [(SFUnifiedTabBarItem *)self itemView];
  [v5 setStopReloadButtonShowsStop:v4];
}

- (void)navigationBarItemDidUpdateFormatButtonSelected:(id)a3
{
  id v4 = a3;
  id v6 = [(SFUnifiedTabBarItem *)self itemView];
  objc_msgSend(v6, "setMenuButtonSelected:", objc_msgSend(v4, "menuButtonSelected"));
  uint64_t v5 = [v4 readerButtonSelected];

  [v6 setShowsReaderIcon:v5];
}

- (void)navigationBarItemDidUpdateSecurityAnnotation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 securityAnnotation];
  id v6 = [(SFUnifiedTabBarItem *)self itemView];
  [v6 setSecurityAnnotation:v5];

  uint64_t v7 = [v4 hasFocusedSensitiveFieldOnCurrentPage];
  id v8 = [(SFUnifiedTabBarItem *)self itemView];
  [v8 setHasFocusedSensitiveInputField:v7];
}

- (void)navigationBarItemDidUpdateShowsTranslationIcon:(id)a3
{
  id v4 = a3;
  id v7 = [(SFUnifiedTabBarItem *)self itemView];
  uint64_t v5 = [v4 showsTranslationIcon];
  uint64_t v6 = [v4 menuButtonSelected];

  [v7 setMenuButtonSelected:v6];
  [v7 setShowsTranslationIcon:v5];
}

- (void)navigationBarItemDidUpdateShowsSiriReaderPlayingIcon:(id)a3
{
  id v4 = a3;
  id v6 = [(SFUnifiedTabBarItem *)self itemView];
  objc_msgSend(v6, "setMenuButtonSelected:", objc_msgSend(v4, "menuButtonSelected"));
  uint64_t v5 = [v4 showsSiriReaderPlayingIcon];

  [v6 setShowsSiriReaderPlayingIcon:v5];
}

- (void)navigationBarItemDidUpdateContentOptions:(id)a3 resetDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(SFUnifiedTabBarItem *)self itemView];
  objc_msgSend(v8, "setMenuButtonSelected:", objc_msgSend(v6, "menuButtonSelected"));
  uint64_t v7 = [v6 contentOptions];

  [v8 setContentOptions:v7 resetDisplay:v4];
}

- (void)navigationBarItemDidUpdateHasHiddenElements:(id)a3
{
  uint64_t v4 = [a3 hasHiddenElements];
  id v5 = [(SFUnifiedTabBarItem *)self itemView];
  [v5 setHasHiddenElements:v4];
}

- (void)navigationBarItemDidUpdateOverlayConfiguration:(id)a3
{
  id v5 = [a3 overlayConfiguration];
  uint64_t v4 = [(SFUnifiedTabBarItem *)self itemView];
  [v4 setOverlayConfiguration:v5];
}

- (id)tabEntityUUIDForView:(id)a3
{
  id v4 = a3;
  id v5 = [(SFUnifiedTabBarItem *)self itemView];

  if (v5 == v4)
  {
    uint64_t v7 = [(SFUnifiedTabBarItem *)self itemView];
    id v8 = [v7 delegate];

    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([(SFUnifiedTabBarItem *)self itemView],
          id v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v8 tabBarItemViewShouldAnnotateWithTabEntity:v9],
          v9,
          v10))
    {
      id v6 = self->_UUID;
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)tabEntityIsPrimaryForView:(id)a3
{
  return 0;
}

- (SFNavigationBarItem)navigationBarItem
{
  return self->_navigationBarItem;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)lastReloadDate
{
  return self->_lastReloadDate;
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (SFMenuConfiguring)menuButtonConfigurator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuButtonConfigurator);

  return (SFMenuConfiguring *)WeakRetained;
}

- (unint64_t)menuButtonBadges
{
  return self->_menuButtonBadges;
}

- (BOOL)showsBadgeOnExtensionsButton
{
  return self->_showsBadgeOnExtensionsButton;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (NSArray)shareParticipants
{
  return self->_shareParticipants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_destroyWeak((id *)&self->_menuButtonConfigurator);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_lastReloadDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_navigationBarItem, 0);
}

@end