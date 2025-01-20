@interface CapsuleNavigationBarRegistration
- (BOOL)_isBarItemHidden:(int64_t)a3;
- (BOOL)containsBarItem:(int64_t)a3;
- (CapsuleNavigationBarRegistration)initWithBar:(id)a3 barManager:(id)a4;
- (NSString)description;
- (SFCapsuleNavigationBar)bar;
- (UIButton)microphoneButton;
- (id)_actionForBarItem:(int64_t)a3;
- (id)_longPressActionForBarItem:(int64_t)a3;
- (id)_progressView;
- (id)_touchDownActionForBarItem:(int64_t)a3;
- (id)popoverSourceInfoForItem:(int64_t)a3;
- (id)viewForBarItem:(int64_t)a3;
- (unint64_t)pageFormatItemState;
- (void)_updateDownloadState;
- (void)_updateFormatMenuButton;
- (void)_voiceSearchAvailabilityDidChange:(id)a3;
- (void)dealloc;
- (void)setBarItem:(int64_t)a3 enabled:(BOOL)a4;
- (void)setBarItem:(int64_t)a3 hidden:(BOOL)a4;
- (void)setBarItem:(int64_t)a3 menu:(id)a4;
- (void)setBarItem:(int64_t)a3 selected:(BOOL)a4;
- (void)setPageFormatItemState:(unint64_t)a3;
- (void)setProgress:(double)a3 forBarItem:(int64_t)a4;
- (void)updateBarAnimated:(BOOL)a3;
@end

@implementation CapsuleNavigationBarRegistration

- (void)setBarItem:(int64_t)a3 enabled:(BOOL)a4
{
  self->_disabledBarItems[a3] = !a4;
}

- (void)setBarItem:(int64_t)a3 hidden:(BOOL)a4
{
  self->_hiddenBarItems[a3] = a4;
  if (a3 == 11) {
    [(CapsuleNavigationBarRegistration *)self _updateDownloadState];
  }
}

- (void)setBarItem:(int64_t)a3 selected:(BOOL)a4
{
  if (a3 != 6 && a3 != 13)
  {
    BOOL v4 = a4;
    buttonsByBarItem = self->_buttonsByBarItem;
    v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    id v12 = [(NSMutableDictionary *)buttonsByBarItem objectForKeyedSubscript:v6];

    v7 = SFSystemImageNameForBarItem();
    v8 = v7;
    if (!v4
      || (v9 = (void *)MEMORY[0x1E4FB1818],
          [v7 stringByAppendingString:@".fill"],
          v10 = objc_claimAutoreleasedReturnValue(),
          [v9 systemImageNamed:v10],
          v11 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v11))
    {
      v11 = [MEMORY[0x1E4FB1818] systemImageNamed:v8];
    }
    [v12 setImage:v11 forState:0];
  }
}

- (void)setBarItem:(int64_t)a3 menu:(id)a4
{
  menuByBarItem = self->_menuByBarItem;
  v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(NSMutableDictionary *)menuByBarItem setObject:v7 forKeyedSubscript:v8];
}

- (void)_voiceSearchAvailabilityDidChange:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F78500], "sharedManager", a3);
  uint64_t v5 = [v4 availability];

  id v7 = [(NSMutableDictionary *)self->_buttonsByBarItem objectForKeyedSubscript:&unk_1F3C73B48];
  [v7 setEnabled:v5 == 1];
  if (v5 == 1) {
    [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  else {
  v6 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
  }
  [v7 setTintColor:v6];
}

id __54__CapsuleNavigationBarRegistration_updateBarAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 integerValue];
  if ([*(id *)(a1 + 32) _isBarItemHidden:v4])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v3];
    if (!v5)
    {
      v6 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
      id v7 = [MEMORY[0x1E4FB1618] clearColor];
      id v8 = [v6 background];
      [v8 setBackgroundColor:v7];

      objc_msgSend(v6, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
      v9 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:2];
      [v6 setPreferredSymbolConfigurationForImage:v9];

      v10 = (void *)MEMORY[0x1E4F78570];
      v11 = [*(id *)(a1 + 32) _actionForBarItem:v4];
      uint64_t v5 = [v10 buttonWithConfiguration:v6 primaryAction:v11];

      long long v19 = xmmword_1E123E220;
      id v12 = [MEMORY[0x1E4F29238] valueWithBytes:&v19 objCType:"{CGPoint=dd}"];
      [v5 setTapTargetSideMargins:v12];

      objc_msgSend(v5, "sf_applyContentSizeCategoryLimitsForToolbarButton");
      objc_msgSend(v5, "sf_configureLargeContentViewerForBarItem:", v4);
      id v13 = objc_alloc_init(MEMORY[0x1E4FB1938]);
      [v5 addInteraction:v13];

      if (v4 == 8) {
        [v5 setAlwaysUsesUIMenuOrdering:1];
      }
      v14 = [MEMORY[0x1E4FB1618] labelColor];
      [v5 setTintColor:v14];

      [*(id *)(*(void *)(a1 + 32) + 32) setObject:v5 forKeyedSubscript:v3];
    }
    v15 = _SFAccessibilityIdentifierForBarItem();
    [v5 setAccessibilityIdentifier:v15];

    [v5 setEnabled:*(unsigned char *)(*(void *)(a1 + 32) + v4 + 65) == 0];
    v16 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:v3];
    [v5 setMenu:v16];

    if (objc_opt_respondsToSelector())
    {
      v17 = [*(id *)(a1 + 40) buttonPointerStyleProvider];
      [v5 setPointerStyleProvider:v17];
    }
  }

  return v5;
}

- (BOOL)_isBarItemHidden:(int64_t)a3
{
  if (self->_hiddenBarItems[a3])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
    id v7 = [WeakRetained item];
    int v8 = [v7 showsStopReloadButtons];

    v9 = [WeakRetained item];
    char v10 = [v9 stopReloadButtonShowsStop];

    if (self->_disabledBarItems[4])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v11 = [MEMORY[0x1E4F78500] sharedManager];
      LOBYTE(v3) = [v11 availability] == 0;
    }
    disabledBarItems = self->_disabledBarItems;
    switch(a3)
    {
      case 4:
        break;
      case 5:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
        goto LABEL_11;
      case 6:
        BOOL v13 = self->_disabledBarItems[6];
        goto LABEL_12;
      case 13:
        v14 = [WeakRetained item];
        int v3 = [v14 showsPageFormatButton] ^ 1;

        break;
      case 14:
        char v15 = v10 & v3 ^ 1;
        goto LABEL_16;
      case 15:
        char v15 = v10 | v3 ^ 1;
LABEL_16:
        if (v8) {
          LOBYTE(v3) = v15;
        }
        else {
          LOBYTE(v3) = 1;
        }
        break;
      default:
        if (a3)
        {
LABEL_11:
          BOOL v13 = disabledBarItems[a3];
LABEL_12:
          LOBYTE(v3) = v13;
        }
        else
        {
          LOBYTE(v3) = *disabledBarItems
                    && [(CapsuleNavigationBarRegistration *)self _isBarItemHidden:1];
        }
        break;
    }
  }
  return v3;
}

- (void)updateBarAnimated:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __54__CapsuleNavigationBarRegistration_updateBarAnimated___block_invoke;
  id v12 = &unk_1E6D7E4B8;
  BOOL v13 = self;
  id v14 = WeakRetained;
  id v5 = WeakRetained;
  v6 = (void *)MEMORY[0x1E4E42950](&v9);
  id v7 = -[NSArray safari_mapAndFilterObjectsUsingBlock:](self->_leadingBarItems, "safari_mapAndFilterObjectsUsingBlock:", v6, v9, v10, v11, v12, v13);
  [v5 setLeadingButtons:v7];

  int v8 = [(NSArray *)self->_trailingBarItems safari_mapAndFilterObjectsUsingBlock:v6];
  [v5 setTrailingButtons:v8];

  [(CapsuleNavigationBarRegistration *)self _voiceSearchAvailabilityDidChange:0];
  [(CapsuleNavigationBarRegistration *)self _updateFormatMenuButton];
}

- (void)_updateFormatMenuButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
  uint64_t v3 = [WeakRetained layoutStyle];
  double v4 = 10.0;
  if (v3 == 2)
  {
    double v4 = 5.0;
    id v5 = (double *)MEMORY[0x1E4F78808];
  }
  else
  {
    id v5 = (double *)MEMORY[0x1E4F786A0];
  }
  [(SFNavigationBarToggleButton *)self->_formatMenuButton setMinimumSideMargin:v4];
  [(SFNavigationBarToggleButton *)self->_formatMenuButton setResizableBackgroundCornerRadius:*v5];
  if (objc_opt_respondsToSelector())
  {
    v6 = [WeakRetained unclippedContainer];
    [(SFNavigationBarToggleButton *)self->_formatMenuButton setPointerPreviewContainer:v6];
  }
}

- (void)_updateDownloadState
{
  if (self->_hiddenBarItems[11]) {
    goto LABEL_2;
  }
  double v4 = [MEMORY[0x1E4F3AF68] sharedManager];
  if ([v4 hasUnviewedDownloads])
  {
  }
  else
  {
    id v5 = [MEMORY[0x1E4F3AF68] sharedManager];
    [v5 totalProgress];
    double v7 = v6;

    if (v7 == -2.0)
    {
LABEL_2:
      unint64_t v3 = [(CapsuleNavigationBarRegistration *)self pageFormatItemState] & 0xFFFFFFFFFFFFFF7FLL;
      goto LABEL_7;
    }
  }
  unint64_t v3 = [(CapsuleNavigationBarRegistration *)self pageFormatItemState] | 0x80;
LABEL_7:
  [(CapsuleNavigationBarRegistration *)self setPageFormatItemState:v3];
}

- (unint64_t)pageFormatItemState
{
  return self->_pageFormatItemState;
}

- (id)viewForBarItem:(int64_t)a3
{
  buttonsByBarItem = self->_buttonsByBarItem;
  double v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)buttonsByBarItem objectForKeyedSubscript:v4];

  return v5;
}

- (CapsuleNavigationBarRegistration)initWithBar:(id)a3 barManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CapsuleNavigationBarRegistration;
  int v8 = [(CapsuleNavigationBarRegistration *)&v33 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_bar, v6);
    objc_storeWeak((id *)&v9->_manager, v7);
    v9->_pageFormatItemState = 0;
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    buttonsByBarItem = v9->_buttonsByBarItem;
    v9->_buttonsByBarItem = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    menuByBarItem = v9->_menuByBarItem;
    v9->_menuByBarItem = (NSMutableDictionary *)v12;

    leadingBarItems = v9->_leadingBarItems;
    v9->_leadingBarItems = (NSArray *)&unk_1F3C73EF0;

    trailingBarItems = v9->_trailingBarItems;
    v9->_trailingBarItems = (NSArray *)&unk_1F3C73F08;

    id v16 = objc_alloc(MEMORY[0x1E4F782F0]);
    v17 = [MEMORY[0x1E4F782F0] pageMenuImageWithIntelligence:0];
    uint64_t v18 = [v16 initWithImage:v17 forInputMode:0];
    formatMenuButton = v9->_formatMenuButton;
    v9->_formatMenuButton = (SFNavigationBarToggleButton *)v18;

    [(CapsuleNavigationBarRegistration *)v9 _updateFormatMenuButton];
    [(SFNavigationBarToggleButton *)v9->_formatMenuButton setClipsToBounds:1];
    v20 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8]];
    [(SFNavigationBarToggleButton *)v9->_formatMenuButton setPreferredSymbolConfiguration:v20];

    [(SFNavigationBarToggleButton *)v9->_formatMenuButton setClickEnabled:1];
    v21 = [(SFNavigationBarToggleButton *)v9->_formatMenuButton pointerInteraction];
    [v21 setEnabled:0];

    [(SFNavigationBarToggleButton *)v9->_formatMenuButton sf_applyContentSizeCategoryLimitsForToolbarButton];
    [(SFNavigationBarToggleButton *)v9->_formatMenuButton sf_configureLargeContentViewerForBarItem:13];
    v22 = v9->_formatMenuButton;
    id v23 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(SFNavigationBarToggleButton *)v22 addInteraction:v23];

    v24 = v9->_formatMenuButton;
    v25 = [(CapsuleNavigationBarRegistration *)v9 _touchDownActionForBarItem:13];
    [(SFNavigationBarToggleButton *)v24 addAction:v25 forControlEvents:1];

    v26 = v9->_formatMenuButton;
    v27 = [(CapsuleNavigationBarRegistration *)v9 _actionForBarItem:13];
    [(SFNavigationBarToggleButton *)v26 addAction:v27 forControlEvents:0x2000];

    v28 = v9->_formatMenuButton;
    v29 = [(CapsuleNavigationBarRegistration *)v9 _longPressActionForBarItem:13];
    [(SFNavigationBarToggleButton *)v28 addAction:v29 forControlEvents:*MEMORY[0x1E4F786A8]];

    [(NSMutableDictionary *)v9->_buttonsByBarItem setObject:v9->_formatMenuButton forKeyedSubscript:&unk_1F3C73B00];
    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v9 selector:sel__voiceSearchAvailabilityDidChange_ name:*MEMORY[0x1E4F78868] object:0];

    v31 = v9;
  }

  return v9;
}

- (id)_actionForBarItem:(int64_t)a3
{
  if (a3 == 5)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4FB1818];
    id v7 = SFSystemImageNameForBarItem();
    id v5 = [v6 systemImageNamed:v7];

    if (a3 == 11)
    {
      uint64_t v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.down.circle.fill"];

      id v5 = (void *)v8;
    }
  }
  objc_initWeak(&location, self);
  uint64_t v9 = (void *)MEMORY[0x1E4FB13F0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__CapsuleNavigationBarRegistration__actionForBarItem___block_invoke;
  v12[3] = &unk_1E6D7E4E0;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  uint64_t v10 = [v9 actionWithTitle:&stru_1F3C268E8 image:v5 identifier:0 handler:v12];
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v10;
}

- (id)_touchDownActionForBarItem:(int64_t)a3
{
  objc_initWeak(&location, self);
  double v4 = (void *)MEMORY[0x1E4FB13F0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CapsuleNavigationBarRegistration__touchDownActionForBarItem___block_invoke;
  v7[3] = &unk_1E6D7E4E0;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  id v5 = [v4 actionWithTitle:&stru_1F3C268E8 image:0 identifier:0 handler:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

- (id)_longPressActionForBarItem:(int64_t)a3
{
  objc_initWeak(&location, self);
  double v4 = (void *)MEMORY[0x1E4FB13F0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CapsuleNavigationBarRegistration__longPressActionForBarItem___block_invoke;
  v7[3] = &unk_1E6D7E4E0;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  id v5 = [v4 actionWithTitle:&stru_1F3C268E8 image:0 identifier:0 handler:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

- (void)setPageFormatItemState:(unint64_t)a3
{
  if ((a3 & 0x40) == 0 && self->_pageFormatItemState == a3) {
    return;
  }
  self->_pageFormatItemState = a3;
  __int16 v5 = ~(_WORD)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
  id v6 = [WeakRetained item];
  uint64_t v7 = [v6 mediaStateIcon];
  BOOL v8 = v7 != 0;

  if ((v5 & 0x810) != 0)
  {
    if ((a3 & 0x11) == 1 || (a3 & 2) != 0)
    {
      uint64_t v9 = [MEMORY[0x1E4F782F0] readerImageWithSummary:(a3 >> 12) & 1];
      uint64_t v10 = @"ReaderButton";
    }
    else
    {
      if ((a3 & 0x14) != 4 && (a3 & 8) == 0)
      {
        v11 = [MEMORY[0x1E4F782F0] pageMenuImageWithIntelligence:(a3 >> 13) & 1];
        [(SFNavigationBarToggleButton *)self->_formatMenuButton setImage:v11];

        uint64_t v12 = [MEMORY[0x1E4FB1618] labelColor];
        [(SFNavigationBarToggleButton *)self->_formatMenuButton setGlyphTintColor:v12];

        BOOL v13 = _SFAccessibilityIdentifierForBarItem();
        [(SFNavigationBarToggleButton *)self->_formatMenuButton setAccessibilityIdentifier:v13];

        id v14 = [(SFNavigationBarToggleButton *)self->_formatMenuButton image];
        [(SFNavigationBarToggleButton *)self->_formatMenuButton setLargeContentImage:v14];

        int v15 = 1;
        goto LABEL_13;
      }
      uint64_t v9 = [MEMORY[0x1E4F782F0] translationImage];
      uint64_t v10 = @"TranslationButton";
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F782F0] siriReaderPlayingImage];
    uint64_t v10 = @"SiriReaderButton";
  }
  [(SFNavigationBarToggleButton *)self->_formatMenuButton setImage:v9];

  [(SFNavigationBarToggleButton *)self->_formatMenuButton setAccessibilityIdentifier:v10];
  [(SFNavigationBarToggleButton *)self->_formatMenuButton sf_configureLargeContentViewerForBarItem:13];
  int v15 = 0;
LABEL_13:
  if ((a3 & 0x3000) != 0)
  {
    previousWebpageIdentifier = self->_previousWebpageIdentifier;
    v17 = [WeakRetained item];
    uint64_t v18 = [v17 webpageIdentifier];
    LOBYTE(previousWebpageIdentifier) = [(NSString *)previousWebpageIdentifier isEqualToString:v18];

    if ((previousWebpageIdentifier & 1) == 0)
    {
      long long v19 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v19 didShowSparkleSBA];

      v20 = [MEMORY[0x1E4F989B0] sharedManager];
      v21 = [WeakRetained item];
      v22 = [v21 webpageIdentifier];
      [v20 donateBrowsingAssistantVisualComponentPresentationStartedWithWebPageID:v22 componentType:0 componentIdentifier:&unk_1F3C73B60 tableOfContentsArrayLength:0];

      id v23 = [WeakRetained item];
      v24 = [v23 webpageIdentifier];
      v25 = self->_previousWebpageIdentifier;
      self->_previousWebpageIdentifier = v24;
    }
  }
  v26 = [MEMORY[0x1E4F1CA48] array];
  v27 = [MEMORY[0x1E4F1CA48] array];
  if ((a3 & 0x100) != 0)
  {
    v28 = [MEMORY[0x1E4F782F0] extensionsImage];
    [v26 addObject:v28];

    v29 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v27 addObject:v29];
  }
  if (v7)
  {
    v30 = [WeakRetained item];
    [v30 mediaStateIcon];
    v31 = _SFImageForMediaStateIcon();
    v32 = [v31 imageWithRenderingMode:2];
    objc_msgSend(v26, "safari_addObjectUnlessNil:", v32);

    objc_super v33 = [MEMORY[0x1E4FB1618] systemRedColor];
    [v27 addObject:v33];
  }
  if ((a3 & 0x4000) != 0)
  {
    v34 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eye.slash"];
    [v26 addObject:v34];

    v35 = objc_msgSend(MEMORY[0x1E4FB1618], "safari_scribbleThemeColor");
    [v27 addObject:v35];
  }
  unint64_t v36 = [v26 count];
  if ((a3 & 0x80) != 0) {
    unsigned int v37 = v8 & (a3 >> 8);
  }
  else {
    unsigned int v37 = 1;
  }
  if (v37 == 1)
  {
    formatMenuButton = self->_formatMenuButton;
    p_formatMenuButton = &self->_formatMenuButton;
    [(SFNavigationBarToggleButton *)formatMenuButton setAccessoryView:0];
  }
  else
  {
    v40 = [(CapsuleNavigationBarRegistration *)self _progressView];
    v41 = self->_formatMenuButton;
    p_formatMenuButton = &self->_formatMenuButton;
    [(SFNavigationBarToggleButton *)v41 setAccessoryView:v40];
  }
  [(SFNavigationBarToggleButton *)*p_formatMenuButton setShowsBadge:(v8 & (a3 >> 8) & (a3 >> 7) | (a3 >> 9)) & v15];
  if (v36)
  {
    v42 = [v26 objectAtIndexedSubscript:0];
    [(SFNavigationBarToggleButton *)*p_formatMenuButton setSecondaryImage:v42];
  }
  else
  {
    [(SFNavigationBarToggleButton *)*p_formatMenuButton setSecondaryImage:0];
  }
  if ([v27 count])
  {
    v43 = [v27 objectAtIndexedSubscript:0];
    [(SFNavigationBarToggleButton *)*p_formatMenuButton setSecondaryImageColor:v43];
  }
  else
  {
    [(SFNavigationBarToggleButton *)*p_formatMenuButton setSecondaryImageColor:0];
  }
  if (v36 <= 1)
  {
    [(SFNavigationBarToggleButton *)*p_formatMenuButton setTertiaryImage:0];
  }
  else
  {
    v44 = [v26 objectAtIndexedSubscript:1];
    [(SFNavigationBarToggleButton *)*p_formatMenuButton setTertiaryImage:v44];
  }
  if ((unint64_t)[v27 count] <= 1)
  {
    [(SFNavigationBarToggleButton *)*p_formatMenuButton setTertiaryImageColor:0];
  }
  else
  {
    v45 = [v27 objectAtIndexedSubscript:1];
    [(SFNavigationBarToggleButton *)*p_formatMenuButton setTertiaryImageColor:v45];
  }
  [(SFNavigationBarToggleButton *)*p_formatMenuButton setSelected:(a3 >> 5) & 1];
  [(SFNavigationBarToggleButton *)*p_formatMenuButton setUsesInsetFromBackground:(a3 >> 10) & 1];
  [(SFNavigationBarToggleButton *)*p_formatMenuButton invalidateIntrinsicContentSize];
}

- (void)dealloc
{
  unint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CapsuleNavigationBarRegistration;
  [(CapsuleNavigationBarRegistration *)&v4 dealloc];
}

- (id)_progressView
{
  progressView = self->_progressView;
  if (!progressView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F782E0]);
    __int16 v5 = [(CapsuleNavigationBarRegistration *)self _actionForBarItem:11];
    id v6 = (SFMoreMenuButton *)objc_msgSend(v4, "initWithFrame:primaryAction:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v7 = self->_progressView;
    self->_progressView = v6;

    [(SFMoreMenuButton *)self->_progressView setUserInteractionEnabled:0];
    [(SFMoreMenuButton *)self->_progressView setProgressStyle:1];
    [(SFMoreMenuButton *)self->_progressView setSymbolScale:2];
    progressView = self->_progressView;
  }
  return progressView;
}

- (UIButton)microphoneButton
{
  return (UIButton *)[(NSMutableDictionary *)self->_buttonsByBarItem objectForKeyedSubscript:&unk_1F3C73B48];
}

- (BOOL)containsBarItem:(int64_t)a3
{
  if (-[CapsuleNavigationBarRegistration _isBarItemHidden:](self, "_isBarItemHidden:")) {
    return 0;
  }
  leadingBarItems = self->_leadingBarItems;
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  if ([(NSArray *)leadingBarItems containsObject:v7])
  {
    char v5 = 1;
  }
  else
  {
    trailingBarItems = self->_trailingBarItems;
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    char v5 = [(NSArray *)trailingBarItems containsObject:v9];
  }
  return v5;
}

- (id)popoverSourceInfoForItem:(int64_t)a3
{
  if (a3 == 13 || a3 == 11)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
    uint64_t v5 = [WeakRetained layoutStyle];
    id v6 = objc_alloc(MEMORY[0x1E4F785C8]);
    uint64_t v7 = v6;
    if (v5 == 1)
    {
      BOOL v8 = [(SFNavigationBarToggleButton *)self->_formatMenuButton tiplessPopoverSourceView];
      uint64_t v9 = (void *)[v7 initWithView:v8];

      [v9 setShouldPassthroughSuperview:1];
      [v9 setPermittedArrowDirections:2];
    }
    else
    {
      uint64_t v9 = (void *)[v6 initWithView:self->_formatMenuButton];
    }
    [v9 setShouldHideArrow:1];
    if ([WeakRetained layoutStyle] == 2) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2;
    }
    [v9 setProvenance:v12];
  }
  else
  {
    buttonsByBarItem = self->_buttonsByBarItem;
    v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    id WeakRetained = [(NSMutableDictionary *)buttonsByBarItem objectForKeyedSubscript:v11];

    if (WeakRetained) {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F785C8]) initWithView:WeakRetained];
    }
    else {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

- (void)setProgress:(double)a3 forBarItem:(int64_t)a4
{
  if (a4 == 11)
  {
    uint64_t v7 = [(CapsuleNavigationBarRegistration *)self _progressView];
    [v7 setDownloadProgress:1 animated:a3];

    [(CapsuleNavigationBarRegistration *)self _updateDownloadState];
  }
}

void __54__CapsuleNavigationBarRegistration__actionForBarItem___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained;
    char v3 = [WeakRetained pageFormatItemState];
    if (*(void *)(a1 + 40) != 13 || (v3 & 0x10) != 0) {
      goto LABEL_10;
    }
    char v5 = v3;
    id v6 = [v9 bar];
    uint64_t v7 = [v6 delegate];
    BOOL v8 = v7;
    if (v5)
    {
      [v7 navigationBarReaderButtonWasTapped:v6];
    }
    else
    {
      if ((v5 & 4) == 0)
      {

LABEL_10:
        id v6 = objc_loadWeakRetained(v9 + 1);
        [v6 barRegistration:v9 didReceiveTapForBarItem:*(void *)(a1 + 40)];
LABEL_14:

        id WeakRetained = v9;
        goto LABEL_15;
      }
      [v7 navigationBarTranslateButtonWasTapped:v6];
    }

    goto LABEL_14;
  }
LABEL_15:
}

void __63__CapsuleNavigationBarRegistration__touchDownActionForBarItem___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    [v3 barRegistration:v4 didReceiveTouchDownForBarItem:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

void __63__CapsuleNavigationBarRegistration__longPressActionForBarItem___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    if ([v3 barRegistration:v4 canHandleLongPressForBarItem:*(void *)(a1 + 40)]) {
      [v3 barRegistration:v4 didReceiveLongPressForBarItem:*(void *)(a1 + 40)];
    }

    id WeakRetained = v4;
  }
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  id v6 = stringForBarItems((uint64_t)self->_disabledBarItems);
  uint64_t v7 = stringForBarItems((uint64_t)self->_hiddenBarItems);
  BOOL v8 = [v3 stringWithFormat:@"<%@ %p: disabled = %@ hidden = %@>", v5, self, v6, v7];;

  return (NSString *)v8;
}

- (SFCapsuleNavigationBar)bar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
  return (SFCapsuleNavigationBar *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bar);
  objc_storeStrong((id *)&self->_previousWebpageIdentifier, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_formatMenuButton, 0);
  objc_storeStrong((id *)&self->_menuByBarItem, 0);
  objc_storeStrong((id *)&self->_buttonsByBarItem, 0);
  objc_storeStrong((id *)&self->_trailingBarItems, 0);
  objc_storeStrong((id *)&self->_leadingBarItems, 0);
  objc_destroyWeak((id *)&self->_manager);
}

@end