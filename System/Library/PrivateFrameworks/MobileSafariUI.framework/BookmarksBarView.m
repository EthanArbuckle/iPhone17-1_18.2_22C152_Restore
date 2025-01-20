@interface BookmarksBarView
- (BOOL)showsIcons;
- (BOOL)showsSeparator;
- (BookmarksBarView)initWithFrame:(CGRect)a3;
- (BookmarksBarViewDelegate)delegate;
- (BrowserController)browserController;
- (CGSize)preferredSize;
- (LinkPreviewProvider)linkPreviewProvider;
- (TabGroupProvider)tabGroupProvider;
- (UIColor)themeColor;
- (WebBookmark)currentRootBookmark;
- (_SFNavigationIntentHandling)navigationIntentHandler;
- (double)preferredBottomSpacing;
- (id)_rootBookmark;
- (id)_rootList;
- (int64_t)buttonStyle;
- (void)_buttonTapped:(id)a3;
- (void)_clearBookmarksNavigationController;
- (void)_createAllLabelButtonsIfNeeded;
- (void)_didChangeHorizontalSizeClass;
- (void)_dismissCurrentBookmarksPopover;
- (void)_presentCurrentBookmarksPopoverFromButton:(uint64_t)a3 animated:;
- (void)_receivedBookmarksChangedNotification:(id)a3;
- (void)_repositionBookmarksNavigationController;
- (void)_setButtonUsedToShowNavigationController:(uint64_t)a1;
- (void)bookmarksBarLabelButtonDidSelectEdit:(id)a3;
- (void)bookmarksBarLabelButtonDidSelectOpenInNewTab:(id)a3;
- (void)bookmarksNavigationControllerDidReload:(id)a3;
- (void)bookmarksNavigationControllerReloadDidFail:(id)a3;
- (void)bookmarksNavigationControllerViewDidAppear:(id)a3;
- (void)bookmarksNavigationControllerViewDidDisappear:(id)a3;
- (void)dealloc;
- (void)dispatchNavigationIntent:(id)a3;
- (void)handleNavigationIntent:(id)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setBrowserController:(id)a3;
- (void)setButtonStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLinkPreviewProvider:(id)a3;
- (void)setNavigationIntentHandler:(id)a3;
- (void)setNeedsReloadData;
- (void)setShowsIcons:(BOOL)a3;
- (void)setShowsSeparator:(BOOL)a3;
- (void)setThemeColor:(id)a3;
- (void)updateAccessibilityIdentifier;
@end

@implementation BookmarksBarView

- (void)_setButtonUsedToShowNavigationController:(uint64_t)a1
{
  id v4 = a2;
  if (a1 && *(id *)(a1 + 464) != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(a1 + 464), a2);
    id v4 = v5;
  }
}

- (void)_clearBookmarksNavigationController
{
  if (a1)
  {
    [*(id *)(a1 + 480) setBookmarksNavigationControllerDelegate:0];
    v2 = *(void **)(a1 + 480);
    *(void *)(a1 + 480) = 0;

    *(unsigned char *)(a1 + 472) = 0;
  }
}

- (void)_buttonTapped:(id)a3
{
  v14 = (UIButton *)a3;
  if (self->_isShowingNavigationController)
  {
    buttonUsedToShowNavigationController = self->_buttonUsedToShowNavigationController;
    [(BookmarksNavigationController *)self->_bookmarksNavigationController dismissViewControllerAnimated:1 completion:0];
    -[BookmarksBarView _clearBookmarksNavigationController]((uint64_t)self);
    if (buttonUsedToShowNavigationController == v14)
    {
      -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, 0);
      goto LABEL_14;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
  if (self->_moreBookmarksButton == v14)
  {
    v10 = [[BookmarksNavigationController alloc] initWithBookmarksDelegate:self linkPreviewProvider:WeakRetained topBookmark:self->_moreBookmarksParent skipOffset:self->_moreBookmarksOffset];
    bookmarksNavigationController = self->_bookmarksNavigationController;
    self->_bookmarksNavigationController = v10;

LABEL_12:
    [(BookmarksNavigationController *)self->_bookmarksNavigationController setNavigationIntentHandler:self];
    -[BookmarksBarView _presentCurrentBookmarksPopoverFromButton:animated:]((uint64_t)self, v14, 1);
    -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, v14);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  v6 = [(UIButton *)v14 bookmark];
  if ([v6 isFolder]
    && ![MEMORY[0x1E4F78598] shouldOpenBookmarkFolderAsTabs])
  {
    v12 = [[BookmarksNavigationController alloc] initWithBookmarksDelegate:self linkPreviewProvider:WeakRetained topBookmark:v6 skipOffset:0];
    v13 = self->_bookmarksNavigationController;
    self->_bookmarksNavigationController = v12;

    goto LABEL_12;
  }
  v7 = [MEMORY[0x1E4F78598] builder];
  v8 = [v7 navigationIntentWithBookmark:v6];

  id v9 = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  [v9 dispatchNavigationIntent:v8];

LABEL_13:
LABEL_14:
}

- (void)_presentCurrentBookmarksPopoverFromButton:(uint64_t)a3 animated:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = *(void **)(a1 + 480);
    id v6 = a2;
    v7 = [v5 presentingViewController];

    if (v7)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[BookmarksBarView _presentCurrentBookmarksPopoverFromButton:animated:](a1, v8);
      }
    }
    [*(id *)(a1 + 480) setAllowsEditing:0];
    [*(id *)(a1 + 480) setModalPresentationStyle:7];
    id v9 = [*(id *)(a1 + 480) popoverPresentationController];
    [v6 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    objc_msgSend(v9, "setSourceRect:", v11, v13, v15, v17);
    [v9 setSourceView:a1];
    [v9 setDelegate:a1];
    [v9 setPermittedArrowDirections:1];
    v21[0] = a1;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v9 setPassthroughViews:v18];

    v19 = [(id)a1 window];
    v20 = [v19 rootViewController];
    [v20 presentViewController:*(void *)(a1 + 480) animated:a3 completion:0];

    *(unsigned char *)(a1 + 472) = 1;
  }
}

- (void)_dismissCurrentBookmarksPopover
{
  if (a1)
  {
    [*(id *)(a1 + 480) dismissViewControllerAnimated:0 completion:0];
    -[BookmarksBarView _setButtonUsedToShowNavigationController:](a1, 0);
  }
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!self->_isShowingNavigationController) {
    goto LABEL_21;
  }
  buttonUsedToShowNavigationController = self->_buttonUsedToShowNavigationController;
  if (buttonUsedToShowNavigationController == self->_moreBookmarksButton)
  {
LABEL_5:
    v30 = a4;
    id v31 = v7;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    double v11 = self->_bookmarkBarLabels;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          [v16 alpha];
          if (v17 != 0.0)
          {
            v18 = [v16 bookmark];
            if ([v18 isFolder])
            {
              bookmarksNavigationController = self->_bookmarksNavigationController;
              v20 = [v16 bookmark];
              LODWORD(bookmarksNavigationController) = [(BookmarksNavigationController *)bookmarksNavigationController rebaseOnDescendentBookmark:v20];

              if (bookmarksNavigationController)
              {
                -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, v16);
                [v16 frame];
                v30->origin.x = v26;
                v30->origin.y = v27;
                v30->size.width = v28;
                v30->size.height = v29;

                id v7 = v31;
                goto LABEL_22;
              }
            }
            else
            {
            }
          }
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v13);
    }

    a4 = v30;
    moreBookmarksButton = self->_moreBookmarksButton;
    id v7 = v31;
LABEL_18:
    [(UIButton *)moreBookmarksButton alpha];
    if (v21 != 0.0
      && [(BookmarksNavigationController *)self->_bookmarksNavigationController rebaseOnAncestorBookmark:self->_moreBookmarksParent skipOffset:self->_moreBookmarksOffset])
    {
      [(UIButton *)self->_moreBookmarksButton frame];
      a4->origin.x = v22;
      a4->origin.y = v23;
      a4->size.width = v24;
      a4->size.height = v25;
      -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, self->_moreBookmarksButton);
      goto LABEL_22;
    }
LABEL_21:
    -[BookmarksBarView _dismissCurrentBookmarksPopover]((uint64_t)self);
    goto LABEL_22;
  }
  [(UIButton *)buttonUsedToShowNavigationController alpha];
  if (v9 == 0.0)
  {
    moreBookmarksButton = self->_moreBookmarksButton;
    if (self->_buttonUsedToShowNavigationController != moreBookmarksButton) {
      goto LABEL_18;
    }
    goto LABEL_5;
  }
LABEL_22:
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[BookmarksBarView _clearBookmarksNavigationController]((uint64_t)self);
  -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, 0);
}

- (id)_rootList
{
  if (a1)
  {
    v1 = -[BookmarksBarView _rootBookmark](a1);
    v2 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    v3 = objc_msgSend(v2, "listWithID:", objc_msgSend(v1, "identifier"));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_rootBookmark
{
  v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    id WeakRetained = objc_loadWeakRetained(v1 + 62);
    if ([WeakRetained isPrivateBrowsingEnabled])
    {
    }
    else
    {
      id v4 = [v1 tabGroupProvider];
      id v5 = [v4 activeProfile];
      id v6 = [v5 customFavoritesFolderServerID];

      if (v6)
      {
        id v7 = [v1[68] serverID];
        char v8 = WBSIsEqual();

        if (v8) {
          goto LABEL_13;
        }
        uint64_t v9 = [v2 bookmarkWithServerID:v6 excludeDeletedBookmarks:1];
        id v10 = v1[68];
        v1[68] = (id)v9;
        goto LABEL_10;
      }
    }
    if ([v1[68] identifier] == *((_DWORD *)v1 + 115))
    {
      id v6 = 0;
LABEL_11:
      id v11 = v1[68];
      if (v11)
      {
LABEL_14:
        v1 = (id *)v11;

        goto LABEL_15;
      }
      uint64_t v12 = [v2 bookmarksBarBookmark];
      id v13 = v1[68];
      v1[68] = (id)v12;

      *((_DWORD *)v1 + 115) = [v1[68] identifier];
LABEL_13:
      id v11 = v1[68];
      goto LABEL_14;
    }
    id v6 = 0;
    id v10 = v1[68];
    v1[68] = 0;
LABEL_10:

    goto LABEL_11;
  }
LABEL_15:
  return v1;
}

- (void)_createAllLabelButtonsIfNeeded
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1 && *(unsigned char *)(a1 + 416))
  {
    *(unsigned char *)(a1 + 416) = 0;
    if (*(unsigned char *)(a1 + 472) && *(void *)(a1 + 464) == *(void *)(a1 + 440))
    {
      v2 = [*(id *)(a1 + 480) viewControllers];
      BOOL v18 = [v2 count] == 1;
    }
    else
    {
      BOOL v18 = 0;
    }
    -[BookmarksBarView _setButtonUsedToShowNavigationController:](a1, 0);
    v3 = -[BookmarksBarView _rootList]((id *)a1);
    *(_DWORD *)(a1 + 432) = [v3 folderID];
    id v4 = *(void **)(a1 + 408);
    if (v4)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v20 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v19 + 1) + 8 * i) removeFromSuperview];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v7);
      }
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = *(void **)(a1 + 408);
    *(void *)(a1 + 408) = v10;

    int v12 = [v3 bookmarkCount];
    if (v12)
    {
      int v13 = v12;
      uint64_t v14 = 0;
      do
      {
        double v15 = [v3 bookmarkAtIndex:v14];
        double v16 = +[BookmarksBarLabelButton labelButtonWithButtonStyle:*(void *)(a1 + 536)];
        [v16 setBookmark:v15];
        [v16 addTarget:a1 action:sel__buttonTapped_ forControlEvents:64];
        [v16 setDelegate:a1];
        [v16 setThemeColor:*(void *)(a1 + 528)];
        [*(id *)(a1 + 408) addObject:v16];
        [(id)a1 addSubview:v16];

        uint64_t v14 = (v14 + 1);
      }
      while (v13 != v14);
    }
    if (!*(unsigned char *)(a1 + 473)) {
      [(id)a1 layoutIfNeeded];
    }
    if (*(unsigned char *)(a1 + 472))
    {
      if (v18 && ([*(id *)(a1 + 440) alpha], v17 == 1.0))
      {
        [*(id *)(a1 + 480) setRootBookmark:*(void *)(a1 + 448) skipOffset:*(unsigned int *)(a1 + 456)];
        -[BookmarksBarView _setButtonUsedToShowNavigationController:](a1, *(void **)(a1 + 440));
      }
      else
      {
        [*(id *)(a1 + 480) reloadViewControllers];
      }
    }
  }
}

- (void)_repositionBookmarksNavigationController
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  int v2 = *(unsigned __int8 *)(a1 + 474);
  *(unsigned char *)(a1 + 474) = 0;
  if (!v2) {
    return;
  }
  unint64_t v3 = 0x1EAD74000uLL;
  id v4 = *(void **)(a1 + 480);
  if (!v4) {
    return;
  }
  BOOL v18 = [v4 rootBookmark];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = *(id *)(a1 + 408);
  id v6 = (id)[v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v6) {
    goto LABEL_20;
  }
  uint64_t v7 = *(void *)v22;
  while (2)
  {
    for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v22 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      [v9 alpha];
      if (v10 != 0.0)
      {
        id v11 = [v9 bookmark];
        if ([v11 isFolder])
        {
          int v12 = [v18 identifier];
          int v13 = [v9 bookmark];
          int v14 = [v13 identifier];

          if (v12 == v14)
          {
            unint64_t v3 = 0x1EAD74000uLL;
LABEL_19:
            id v6 = v9;
            goto LABEL_20;
          }
        }
        else
        {
        }
      }
      [v9 alpha];
      if (v15 == 0.0)
      {
        unint64_t v3 = 0x1EAD74000uLL;
        [*(id *)(a1 + 480) rebaseOnAncestorBookmark:*(void *)(a1 + 448) skipOffset:*(unsigned int *)(a1 + 456)];
        uint64_t v9 = *(void **)(a1 + 440);
        goto LABEL_19;
      }
    }
    id v6 = (id)[v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6) {
      continue;
    }
    break;
  }
  unint64_t v3 = 0x1EAD74000;
LABEL_20:

  double v16 = *(void **)(a1 + *(int *)(v3 + 1232));
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__BookmarksBarView__repositionBookmarksNavigationController__block_invoke;
  v19[3] = &unk_1E6D77D90;
  v19[4] = a1;
  id v20 = v6;
  id v17 = v6;
  [v16 dismissViewControllerAnimated:0 completion:v19];
}

void __60__BookmarksBarView__repositionBookmarksNavigationController__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 480))
  {
    -[BookmarksBarView _presentCurrentBookmarksPopoverFromButton:animated:](v2, *(void **)(a1 + 40), 0);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    -[BookmarksBarView _setButtonUsedToShowNavigationController:](v3, v4);
  }
}

- (void)_receivedBookmarksChangedNotification:(id)a3
{
  id v7 = a3;
  id v4 = [v7 name];
  if (([v4 isEqualToString:*MEMORY[0x1E4FB6148]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x1E4FB6180]])
  {
    [(BookmarksBarView *)self setNeedsReloadData];
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4FB6158]])
  {
    id v5 = [v7 userInfo];
    id v6 = [v5 valueForKey:*MEMORY[0x1E4FB6130]];

    if (v6 && [v6 intValue] == self->_bookmarkBarID) {
      [(BookmarksBarView *)self setNeedsReloadData];
    }
  }
}

- (BookmarksBarView)initWithFrame:(CGRect)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)BookmarksBarView;
  uint64_t v3 = -[BookmarksBarView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    moreBookmarksButton = v3->_moreBookmarksButton;
    v3->_moreBookmarksButton = (UIButton *)v4;

    id v6 = v3->_moreBookmarksButton;
    id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis"];
    [(UIButton *)v6 setImage:v7 forState:0];

    uint64_t v8 = v3->_moreBookmarksButton;
    uint64_t v9 = (void *)MEMORY[0x1E4FB1830];
    double v10 = bookmarksBarLabelButtonFont();
    id v11 = [v9 configurationWithFont:v10 scale:3];
    [(UIButton *)v8 setPreferredSymbolConfiguration:v11 forImageInState:0];

    int v12 = v3->_moreBookmarksButton;
    _SFRoundEdgeInsetsToPixels();
    -[UIButton setImageEdgeInsets:](v12, "setImageEdgeInsets:");
    [(UIButton *)v3->_moreBookmarksButton addTarget:v3 action:sel__buttonTapped_ forControlEvents:64];
    [(UIButton *)v3->_moreBookmarksButton setPointerStyleProvider:&__block_literal_global_5];
    [(BookmarksBarView *)v3 addSubview:v3->_moreBookmarksButton];
    int v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v3 selector:sel__receivedBookmarksChangedNotification_ name:*MEMORY[0x1E4FB6158] object:0];
    [v13 addObserver:v3 selector:sel__receivedBookmarksChangedNotification_ name:*MEMORY[0x1E4FB6148] object:0];
    [v13 addObserver:v3 selector:sel__receivedBookmarksChangedNotification_ name:*MEMORY[0x1E4FB6180] object:0];
    v18[0] = objc_opt_class();
    int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v15 = (id)[(BookmarksBarView *)v3 registerForTraitChanges:v14 withTarget:v3 action:sel__didChangeHorizontalSizeClass];
  }
  return v3;
}

id __34__BookmarksBarView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 superview];
  [v5 bounds];
  objc_msgSend(v5, "contentRectForBounds:");
  objc_msgSend(v5, "imageRectForContentRect:");
  objc_msgSend(v6, "convertRect:fromView:", v5);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  CGFloat v15 = fmin((CGRectGetWidth(v21) + -42.0) * 0.5, -3.0);
  v22.origin.x = v8;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v14;
  CGFloat v16 = fmin((CGRectGetHeight(v22) + -24.0) * 0.5, -3.0);
  v23.origin.x = v8;
  v23.origin.y = v10;
  v23.size.width = v12;
  v23.size.height = v14;
  CGRect v24 = CGRectInset(v23, v15, v16);
  objc_super v17 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
  BOOL v18 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v4 shape:v17];

  return v18;
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  self->_isPerformingLayout = 1;
  v80.receiver = self;
  v80.super_class = (Class)BookmarksBarView;
  [(BookmarksBarView *)&v80 layoutSubviews];
  -[BookmarksBarView _createAllLabelButtonsIfNeeded]((uint64_t)v2);
  [(BookmarksBarView *)v2 bounds];
  double v4 = v3;
  double v6 = v5;
  [(BookmarksBarView *)v2 layoutMargins];
  double v8 = v7;
  double v10 = v9;
  double v11 = [(UIButton *)v2->_moreBookmarksButton imageView];
  CGFloat v12 = [v11 image];
  [v12 size];
  double v14 = v13 + 30.0;

  double v15 = fmax(v10 + -15.0, 0.0) + v14;
  double v66 = v4 - v15;
  double v16 = fmax(v8, 18.0);
  unsigned int v17 = [(NSMutableArray *)v2->_bookmarkBarLabels count];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  BOOL v18 = v2->_bookmarkBarLabels;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v76 objects:v82 count:16];
  if (!v19)
  {

    unsigned int v39 = v17;
LABEL_29:
    [(BookmarksBarView *)v2 bounds];
    CGRectGetWidth(v86);
    _SFRoundFloatToPixels();
    double v52 = v51;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v41 = v2->_bookmarkBarLabels;
    uint64_t v53 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v72 objects:v81 count:16];
    double v50 = 0.0;
    if (v53)
    {
      uint64_t v54 = v53;
      unsigned int v55 = v39;
      unsigned int v56 = v17;
      uint64_t v57 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v73 != v57) {
            objc_enumerationMutation(v41);
          }
          v59 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          [v59 frame];
          [v59 setFrame:v52 + v60];
        }
        uint64_t v54 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v72 objects:v81 count:16];
      }
      while (v54);
      unsigned int v17 = v56;
      unsigned int v39 = v55;
    }
    goto LABEL_37;
  }
  uint64_t v20 = v19;
  obuint64_t j = v18;
  double v64 = v15;
  double v65 = v4;
  CGFloat v71 = v6;
  CGRect v21 = v2;
  int v22 = 0;
  LOBYTE(v23) = 0;
  uint64_t v24 = *(void *)v77;
  double v25 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v69 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v70 = *MEMORY[0x1E4FB2848];
  double v68 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  unsigned int v26 = v17;
  do
  {
    for (uint64_t j = 0; j != v20; ++j)
    {
      if (*(void *)v77 != v24) {
        objc_enumerationMutation(obj);
      }
      CGFloat v28 = *(void **)(*((void *)&v76 + 1) + 8 * j);
      objc_msgSend(v28, "sizeToFit", *(void *)&v64, *(void *)&v65);
      [v28 frame];
      double v30 = v29;
      _SFRoundFloatToPixels();
      double v32 = v31;
      double v33 = fmin(v30, 150.0);
      if (v23)
      {
        double v34 = 0.0;
        BOOL v23 = 1;
        double v35 = v71;
      }
      else
      {
        v84.origin.x = v16;
        v84.origin.y = v32;
        v84.size.width = v33;
        double v35 = v71;
        v84.size.height = v71;
        CGFloat MaxX = CGRectGetMaxX(v84);
        BOOL v23 = MaxX > v66;
        if (MaxX <= v66)
        {
          double v34 = 1.0;
        }
        else
        {
          unsigned int v26 = v22 + j;
          double v34 = 0.0;
        }
      }
      objc_msgSend(v28, "setFrame:", v16, v32, v33, v35);
      [v28 setAlpha:v34];
      if (v22 + j) {
        double v37 = -9.0;
      }
      else {
        double v37 = v69;
      }
      if ([(NSMutableArray *)v21->_bookmarkBarLabels count] <= (unint64_t)(v22 + j + 1)) {
        double v38 = v68;
      }
      else {
        double v38 = -9.0;
      }
      objc_msgSend(v28, "setCursorRegionInset:", v70, v37, v25, v38);
      double v16 = v16 + v33 + 18.0;
    }
    uint64_t v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v76 objects:v82 count:16];
    v22 += j;
  }
  while (v20);

  unsigned int v39 = v26;
  if (v26) {
    BOOL v40 = v23;
  }
  else {
    BOOL v40 = 0;
  }
  if (!v40)
  {
    double v50 = 1.0;
    uint64_t v2 = v21;
    double v6 = v71;
    if (v23) {
      goto LABEL_38;
    }
    goto LABEL_29;
  }
  uint64_t v2 = v21;
  v41 = [(NSMutableArray *)v21->_bookmarkBarLabels objectAtIndexedSubscript:v26 - 1];
  [(NSMutableArray *)v41 cursorRegionInset];
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  [(NSMutableArray *)v41 frame];
  double v48 = v64 + CGRectGetMaxX(v85) - v65;
  if (v48 >= -44.0) {
    double v49 = v48;
  }
  else {
    double v49 = 0.0;
  }
  -[NSMutableArray setCursorRegionInset:](v41, "setCursorRegionInset:", v43, v45, v47, v49);
  double v50 = 1.0;
  double v6 = v71;
LABEL_37:

LABEL_38:
  -[UIButton setFrame:](v2->_moreBookmarksButton, "setFrame:", v66, 0.0, v14, v6);
  [(UIButton *)v2->_moreBookmarksButton setAlpha:v50];
  if (v39 < v17)
  {
    uint64_t v61 = -[BookmarksBarView _rootBookmark]((id *)&v2->super.super.super.isa);
    moreBookmarksParent = v2->_moreBookmarksParent;
    v2->_moreBookmarksParent = (WebBookmark *)v61;

    v63 = _WBSLocalizedString();
    [(WebBookmark *)v2->_moreBookmarksParent setTitle:v63];

    v2->_moreBookmarksOffset = v39;
  }
  -[BookmarksBarView _repositionBookmarksNavigationController]((uint64_t)v2);
  -[BookmarksBarView updateAccessibilityIdentifier](v2);
  v2->_isPerformingLayout = 0;
}

- (void)updateAccessibilityIdentifier
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a1[67], @"DisplayMode");
    v6[0] = v2;
    double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    double v4 = WBSMakeAccessibilityIdentifier();
    [a1 setAccessibilityIdentifier:v4];
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  [(BookmarksBarView *)self setNeedsReloadData];
}

- (void)setNeedsReloadData
{
  self->_needsReloadBookmarkLabels = 1;
  [(BookmarksBarView *)self setNeedsLayout];
}

- (void)setShowsIcons:(BOOL)a3
{
  if (self->_showsIcons != a3)
  {
    self->_showsIcons = a3;
    [(BookmarksBarView *)self setNeedsReloadData];
  }
}

- (void)setButtonStyle:(int64_t)a3
{
  if (self->_buttonStyle != a3)
  {
    self->_buttonStyle = a3;
    [(BookmarksBarView *)self setNeedsReloadData];
  }
}

- (void)_didChangeHorizontalSizeClass
{
  double v3 = [(BookmarksBarView *)self traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  if (v4 == 1)
  {
    -[BookmarksBarView _dismissCurrentBookmarksPopover]((uint64_t)self);
  }
}

- (void)dealloc
{
  [(BookmarksNavigationController *)self->_bookmarksNavigationController setBookmarksNavigationControllerDelegate:0];
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BookmarksBarView;
  [(BookmarksBarView *)&v4 dealloc];
}

- (BOOL)showsSeparator
{
  return self->_separator != 0;
}

- (void)setShowsSeparator:(BOOL)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  separator = self->_separator;
  if (a3)
  {
    if (!separator)
    {
      uint64_t v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      double v6 = self->_separator;
      self->_separator = v5;

      double v7 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_tabSeparatorColor");
      [(UIView *)self->_separator setBackgroundColor:v7];

      double v8 = [(UIView *)self->_separator layer];
      [v8 setCornerRadius:0.5];

      [(UIView *)self->_separator setTranslatesAutoresizingMaskIntoConstraints:0];
      [(BookmarksBarView *)self addSubview:self->_separator];
      double v9 = [(BookmarksBarView *)self layoutMarginsGuide];
      uint64_t v20 = (void *)MEMORY[0x1E4F28DC8];
      BOOL v23 = [(UIView *)self->_separator leadingAnchor];
      int v22 = [v9 leadingAnchor];
      CGRect v21 = [v23 constraintEqualToAnchor:v22];
      v24[0] = v21;
      double v10 = [(UIView *)self->_separator bottomAnchor];
      double v11 = [(BookmarksBarView *)self bottomAnchor];
      CGFloat v12 = [v10 constraintEqualToAnchor:v11 constant:4.0];
      v24[1] = v12;
      double v13 = [v9 trailingAnchor];
      double v14 = [(UIView *)self->_separator trailingAnchor];
      double v15 = [v13 constraintEqualToAnchor:v14];
      v24[2] = v15;
      double v16 = [(UIView *)self->_separator heightAnchor];
      unsigned int v17 = [v16 constraintEqualToConstant:1.0];
      v24[3] = v17;
      BOOL v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
      [v20 activateConstraints:v18];
    }
  }
  else if (separator)
  {
    [(UIView *)separator removeFromSuperview];
    uint64_t v19 = self->_separator;
    self->_separator = 0;
  }
}

- (void)handleNavigationIntent:(id)a3 completion:(id)a4
{
  p_navigationIntentHandler = &self->_navigationIntentHandler;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_navigationIntentHandler);
  [WeakRetained handleNavigationIntent:v7 completion:v6];
}

- (void)dispatchNavigationIntent:(id)a3
{
  id v5 = a3;
  if (self->_isShowingNavigationController)
  {
    [(BookmarksNavigationController *)self->_bookmarksNavigationController dismissViewControllerAnimated:1 completion:0];
    -[BookmarksBarView _clearBookmarksNavigationController]((uint64_t)self);
  }
  -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  [WeakRetained dispatchNavigationIntent:v5];
}

- (void)setThemeColor:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_themeColor, a3);
    if (!self->_needsReloadBookmarkLabels)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = self->_bookmarkBarLabels;
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
            objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setThemeColor:", v5, (void)v11);
          }
          while (v8 != v10);
          uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)bookmarksNavigationControllerReloadDidFail:(id)a3
{
  if (self->_isShowingNavigationController)
  {
    -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, 0);
    [(BookmarksNavigationController *)self->_bookmarksNavigationController dismissViewControllerAnimated:1 completion:0];
    -[BookmarksBarView _clearBookmarksNavigationController]((uint64_t)self);
  }
}

- (void)bookmarksNavigationControllerDidReload:(id)a3
{
  -[BookmarksBarView _createAllLabelButtonsIfNeeded]((uint64_t)self);
  self->_needsRepositionNavigationController = 1;
  if (!self->_isPerformingLayout)
  {
    -[BookmarksBarView _repositionBookmarksNavigationController]((uint64_t)self);
  }
}

- (void)bookmarksNavigationControllerViewDidAppear:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarksBarView:self bookmarksNavigationControllerViewDidAppear:v5];
  }
}

- (void)bookmarksNavigationControllerViewDidDisappear:(id)a3
{
  id v5 = a3;
  self->_isShowingNavigationController = 0;
  -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarksBarView:self bookmarksNavigationControllerViewDidDisappear:v5];
  }
}

- (TabGroupProvider)tabGroupProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    double v3 = [WeakRetained tabGroupProvider];
  }
  else
  {
    double v3 = 0;
  }

  return (TabGroupProvider *)v3;
}

- (void)bookmarksBarLabelButtonDidSelectOpenInNewTab:(id)a3
{
  id v7 = [a3 bookmark];
  objc_super v4 = [MEMORY[0x1E4F78598] builder];
  [v4 setPrefersOpenInNewTab:1];
  id v5 = [v4 navigationIntentWithBookmark:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  [WeakRetained dispatchNavigationIntent:v5];
}

- (void)bookmarksBarLabelButtonDidSelectEdit:(id)a3
{
  id v4 = a3;
  id v6 = [(BookmarksBarView *)self browserController];
  id v5 = [v4 bookmark];

  [v6 editBookmark:v5];
}

- (CGSize)preferredSize
{
  double v2 = 23.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (double)preferredBottomSpacing
{
  double v2 = 8.0;
  if (!self->_separator) {
    double v2 = 0.0;
  }
  return v2 + 3.0;
}

- (BookmarksBarViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BookmarksBarViewDelegate *)WeakRetained;
}

- (LinkPreviewProvider)linkPreviewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
  return (LinkPreviewProvider *)WeakRetained;
}

- (void)setLinkPreviewProvider:(id)a3
{
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  return (_SFNavigationIntentHandling *)WeakRetained;
}

- (void)setNavigationIntentHandler:(id)a3
{
}

- (BrowserController)browserController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  return (BrowserController *)WeakRetained;
}

- (void)setBrowserController:(id)a3
{
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (BOOL)showsIcons
{
  return self->_showsIcons;
}

- (int64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (WebBookmark)currentRootBookmark
{
  return self->_currentRootBookmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRootBookmark, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_destroyWeak((id *)&self->_browserController);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bookmarksNavigationController, 0);
  objc_storeStrong((id *)&self->_buttonUsedToShowNavigationController, 0);
  objc_storeStrong((id *)&self->_moreBookmarksParent, 0);
  objc_storeStrong((id *)&self->_moreBookmarksButton, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_bookmarkBarLabels, 0);
}

- (void)_presentCurrentBookmarksPopoverFromButton:(uint64_t)a1 animated:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v2 = *(void **)(a1 + 480);
  double v3 = a2;
  id v4 = [v2 presentingViewController];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1E102C000, v3, OS_LOG_TYPE_ERROR, "Trying to present bookmarks from popover button when it is already presented by: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end