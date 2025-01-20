@interface SUUITracklistLockupCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForOrdinal:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUITracklistLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)_addFlipContainerViewWithFrontView:(id)a3 backView:(id)a4;
- (id)_previewColumnView;
- (id)_previewControlViewElement;
- (id)_previewMediaURL;
- (id)viewForElementIdentifier:(id)a3;
- (void)_audioPlayerStatusChangeNotification:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_cancelConfirmationAction:(id)a3;
- (void)_enumerateViewElementViewsUsingBlock:(id)a3;
- (void)_layoutConfirmationGradientRelativeToView:(id)a3 alpha:(double)a4;
- (void)_resolvePreviewStateAfterTransitionForFlipView:(id)a3;
- (void)_showConfirmationAction:(id)a3;
- (void)dealloc;
- (void)hidePreviewProgressAnimated:(BOOL)a3;
- (void)itemOfferButtonDidAnimateTransition:(id)a3;
- (void)itemOfferButtonWillAnimateTransition:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)showPreviewProgressWithStatus:(id)a3 animated:(BOOL)a4;
- (void)togglePreviewPlaybackAnimated:(BOOL)a3;
@end

@implementation SUUITracklistLockupCollectionViewCell

- (SUUITracklistLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SUUITracklistLockupCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    columnViewsByIndex = v3->_columnViewsByIndex;
    v3->_columnViewsByIndex = v4;

    v6 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    separatorView = v3->_separatorView;
    v3->_separatorView = v6;

    v8 = v3->_separatorView;
    v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v8 setBackgroundColor:v9];

    v10 = [(SUUITracklistLockupCollectionViewCell *)v3 contentView];
    [v10 addSubview:v3->_separatorView];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F89738] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUITracklistLockupCollectionViewCell;
  [(SUUIViewReuseCollectionViewCell *)&v4 dealloc];
}

- (void)hidePreviewProgressAnimated:(BOOL)a3
{
  int64_t previewState = self->_previewState;
  if (previewState)
  {
    self->_int64_t previewState = 3;
    v6 = self->_previewProgressIndicator;
    lastPlayerStatus = self->_lastPlayerStatus;
    self->_lastPlayerStatus = 0;

    previewProgressIndicator = self->_previewProgressIndicator;
    self->_previewProgressIndicator = 0;

    if (previewState == 2)
    {
      v9 = [(SUUITracklistLockupCollectionViewCell *)self _previewColumnView];
      if (a3)
      {
        v10 = [(SUUITracklistLockupCollectionViewCell *)self _addFlipContainerViewWithFrontView:v6 backView:v9];
        [v9 setHidden:0];
        objc_initWeak(&location, self);
        v11 = [MEMORY[0x263F82438] sharedApplication];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __69__SUUITracklistLockupCollectionViewCell_hidePreviewProgressAnimated___block_invoke;
        v14[3] = &unk_265402A38;
        id v12 = v10;
        id v15 = v12;
        objc_copyWeak(&v16, &location);
        [v11 _performBlockAfterCATransactionCommits:v14];

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
      else
      {
        self->_int64_t previewState = 0;
        [(SUUIPreviewProgressIndicator *)v6 removeFromSuperview];
        v13 = [(SUUITracklistLockupCollectionViewCell *)self contentView];
        [v13 addSubview:v9];

        [(SUUITracklistLockupCollectionViewCell *)self setNeedsLayout];
      }
    }
  }
}

void __69__SUUITracklistLockupCollectionViewCell_hidePreviewProgressAnimated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__SUUITracklistLockupCollectionViewCell_hidePreviewProgressAnimated___block_invoke_2;
  v3[3] = &unk_2654022F8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  [v2 flipToBackViewWithDuration:0x100000 options:v3 completionBlock:0.5];

  objc_destroyWeak(&v5);
}

void __69__SUUITracklistLockupCollectionViewCell_hidePreviewProgressAnimated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _resolvePreviewStateAfterTransitionForFlipView:*(void *)(a1 + 32)];
}

- (void)showPreviewProgressWithStatus:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_storeStrong((id *)&self->_lastPlayerStatus, a3);
  int64_t previewState = self->_previewState;
  if (previewState)
  {
    if (previewState == 2) {
      [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator reloadWithPlayerStatus:v7 animated:v4];
    }
  }
  else
  {
    v9 = [(SUUITracklistLockupCollectionViewCell *)self _previewColumnView];
    if (v9)
    {
      v10 = -[SUUIPreviewProgressIndicator initWithFrame:]([SUUIPreviewProgressIndicator alloc], "initWithFrame:", 0.0, 0.0, 29.0, 29.0);
      previewProgressIndicator = self->_previewProgressIndicator;
      self->_previewProgressIndicator = v10;

      id v12 = self->_previewProgressIndicator;
      v13 = [MEMORY[0x263F825C8] clearColor];
      [(SUUIPreviewProgressIndicator *)v12 setBackgroundColor:v13];

      [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator setEnabled:0];
      v14 = [(SUUITracklistLockupCollectionViewCell *)self _previewControlViewElement];
      id v15 = [v14 style];
      id v16 = SUUIViewElementPlainColorWithStyle(v15, 0);

      [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator setTintColor:v16];
      if (v4)
      {
        v17 = [(SUUITracklistLockupCollectionViewCell *)self _addFlipContainerViewWithFrontView:v9 backView:self->_previewProgressIndicator];
        self->_int64_t previewState = 1;
        [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator reloadWithPlayerStatus:v7 animated:1];
        objc_initWeak(&location, self);
        v18 = [MEMORY[0x263F82438] sharedApplication];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __80__SUUITracklistLockupCollectionViewCell_showPreviewProgressWithStatus_animated___block_invoke_2;
        v22[3] = &unk_265402A38;
        id v19 = v17;
        id v23 = v19;
        objc_copyWeak(&v24, &location);
        [v18 _performBlockAfterCATransactionCommits:v22];

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
      else
      {
        self->_int64_t previewState = 2;
        v20 = [(SUUITracklistLockupCollectionViewCell *)self contentView];
        [v20 addSubview:self->_previewProgressIndicator];

        [(SUUITracklistLockupCollectionViewCell *)self setNeedsLayout];
        v21 = [MEMORY[0x263F82438] sharedApplication];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __80__SUUITracklistLockupCollectionViewCell_showPreviewProgressWithStatus_animated___block_invoke;
        v26[3] = &unk_265404138;
        v26[4] = self;
        BOOL v27 = v4;
        [v21 _performBlockAfterCATransactionCommits:v26];
      }
    }
  }
}

uint64_t __80__SUUITracklistLockupCollectionViewCell_showPreviewProgressWithStatus_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 864) reloadWithPlayerStatus:*(void *)(*(void *)(a1 + 32) + 848) animated:*(unsigned __int8 *)(a1 + 40)];
}

void __80__SUUITracklistLockupCollectionViewCell_showPreviewProgressWithStatus_animated___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __80__SUUITracklistLockupCollectionViewCell_showPreviewProgressWithStatus_animated___block_invoke_3;
  v3[3] = &unk_2654022F8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  [v2 flipToBackViewWithDuration:0x200000 options:v3 completionBlock:0.5];

  objc_destroyWeak(&v5);
}

void __80__SUUITracklistLockupCollectionViewCell_showPreviewProgressWithStatus_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _resolvePreviewStateAfterTransitionForFlipView:*(void *)(a1 + 32)];
}

- (void)togglePreviewPlaybackAnimated:(BOOL)a3
{
  id v4 = [(SUUITracklistLockupCollectionViewCell *)self _previewMediaURL];
  if (v4)
  {
    id v12 = v4;
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    v6 = [MEMORY[0x263F895C8] sessionManager];
    id v7 = [v6 endSessionForURL:v12];
    if (v7)
    {
      [v5 removeObserver:self name:*MEMORY[0x263F89738] object:v7];
      [v7 stop];
      [(SUUITracklistLockupCollectionViewCell *)self hidePreviewProgressAnimated:1];
    }
    else
    {
      id v8 = (id)[v6 stopAllAudioPlayerSessions];
      v9 = [v6 startSessionWithURL:v12];
      [v5 addObserver:self selector:sel__audioPlayerStatusChangeNotification_ name:*MEMORY[0x263F89738] object:v9];
      v10 = [(SUUITracklistLockupCollectionViewCell *)self _previewControlViewElement];
      objc_msgSend(v9, "setStoreItemIdentifier:", objc_msgSend(v10, "itemIdentifier"));
      v11 = [v9 playerStatus];
      [(SUUITracklistLockupCollectionViewCell *)self showPreviewProgressWithStatus:v11 animated:1];

      [v9 play];
    }

    id v4 = v12;
  }
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__SUUITracklistLockupCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_265400BE8;
  id v9 = v8;
  v13 = &v15;
  int64_t v14 = a4;
  id v12 = v9;
  [v7 enumerateChildrenUsingBlock:v11];
  LOBYTE(a4) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

void __88__SUUITracklistLockupCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 elementType] == 8)
  {
    char v3 = [*(id *)(a1 + 32) loadImageForBadgeElement:v6 reason:*(void *)(a1 + 48)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v4 + 24)) {
      char v5 = 1;
    }
    else {
      char v5 = v3;
    }
    *(unsigned char *)(v4 + 24) = v5;
  }
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v9 aggregateValueForKey:0x2704FCC90];
  v11 = [v9 labelLayoutCache];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__SUUITracklistLockupCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v15[3] = &unk_265407458;
  double v19 = a4;
  id v16 = v11;
  id v17 = v8;
  id v18 = v9;
  id v20 = a1;
  id v12 = v9;
  id v13 = v8;
  id v14 = v11;
  [v10 enumerateColumnsForTrack:v13 usingBlock:v15];
}

void __83__SUUITracklistLockupCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [a2 width];
  double v7 = v6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(v13, "elementType", (void)v17);
        if (v14 <= 79)
        {
          if (v14 != 8)
          {
            if (v14 != 12) {
              goto LABEL_17;
            }
LABEL_13:
            uint64_t v15 = SUUITracklistAttributedStringForButton(v14, v13, *(void **)(a1 + 48));
            [*(id *)(a1 + 32) requestLayoutForButton:v13 attributedString:v15 width:(uint64_t)v7];
LABEL_16:

            goto LABEL_17;
          }
          [*(id *)(a1 + 32) requestLayoutForBadge:v13 width:(uint64_t)*(double *)(a1 + 56)];
        }
        else
        {
          switch(v14)
          {
            case 80:
              uint64_t v15 = [*(id *)(a1 + 64) _attributedStringForOrdinal:v13 context:*(void *)(a1 + 48)];
              [*(id *)(a1 + 32) requestLayoutForOrdinal:v13 attributedString:v15 width:(uint64_t)v7];
              goto LABEL_16;
            case 138:
              uint64_t v15 = SUUITracklistAttributedStringForLabel(*(void **)(a1 + 40), v13, *(void **)(a1 + 48));
              [*(id *)(a1 + 32) requestLayoutForLabel:v13 attributedString:v15 width:(uint64_t)v7];
              goto LABEL_16;
            case 141:
              goto LABEL_13;
          }
        }
LABEL_17:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v16 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v10 = v16;
    }
    while (v16);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v20 = 0;
  v21 = (double *)&v20;
  id v23 = "";
  uint64_t v22 = 0x3010000000;
  uint64_t v25 = *(void *)(MEMORY[0x263F001B0] + 8);
  double v24 = a3;
  uint64_t v9 = [v8 aggregateValueForKey:0x2704FCC90];
  uint64_t v10 = [v8 labelLayoutCache];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __79__SUUITracklistLockupCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v17[3] = &unk_265407480;
  id v11 = v10;
  id v18 = v11;
  long long v19 = &v20;
  [v9 enumerateColumnsForTrack:v7 usingBlock:v17];
  double v13 = v21[4];
  double v12 = v21[5];
  if (v12 <= 32.0) {
    double v14 = 44.0;
  }
  else {
    double v14 = v12 + 20.0;
  }
  v21[5] = v14;

  _Block_object_dispose(&v20, 8);
  double v15 = v13;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

void __79__SUUITracklistLockupCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  if ([v8 columnIdentifier] == 4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v15, "elementType", (void)v18) == 138)
          {
            double v16 = *(void **)(a1 + 32);
            [v8 width];
            objc_msgSend(v16, "estimatedSizeForLabel:width:", v15);
            *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v17
                                                                        + *(double *)(*(void *)(*(void *)(a1 + 40)
                                                                                                + 8)
                                                                                    + 40);
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    *a5 = 1;
  }
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(NSMapTable *)self->_buyButtonDescriptorToButton removeAllObjects];
  id v10 = [v9 aggregateValueForKey:0x2704FCC90];
  columnData = self->_columnData;
  self->_columnData = v10;

  objc_storeStrong((id *)&self->_track, a3);
  [(NSMutableDictionary *)self->_columnViewsByIndex removeAllObjects];
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  [(SUUIGradientView *)self->_offerConfirmationGradientView removeFromSuperview];
  offerConfirmationGradientView = self->_offerConfirmationGradientView;
  self->_offerConfirmationGradientView = 0;

  uint64_t v13 = [v8 style];
  double v14 = [v13 ikBorderColor];
  double v15 = [v14 color];

  double v16 = [v13 dividerType];
  uint64_t v17 = [v16 isEqualToString:@"none"];

  if (!v17)
  {
    separatorView = self->_separatorView;
    if (v15)
    {
      [(UIView *)self->_separatorView setBackgroundColor:v15];
    }
    else
    {
      long long v19 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(UIView *)separatorView setBackgroundColor:v19];
    }
  }
  [(UIView *)self->_separatorView setHidden:v17];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __77__SUUITracklistLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v28[3] = &unk_2654026E8;
  v28[4] = self;
  id v20 = v8;
  id v29 = v20;
  id v21 = v9;
  id v30 = v21;
  [(SUUIViewReuseCollectionViewCell *)self modifyUsingBlock:v28];
  uint64_t v22 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v23 = *MEMORY[0x263F89738];
  [v22 removeObserver:self name:*MEMORY[0x263F89738] object:0];
  double v24 = [(SUUITracklistLockupCollectionViewCell *)self _previewMediaURL];
  if (v24
    && ([MEMORY[0x263F895C8] sessionManager],
        uint64_t v25 = objc_claimAutoreleasedReturnValue(),
        [v25 audioPlayerForURL:v24],
        v26 = objc_claimAutoreleasedReturnValue(),
        v25,
        v26))
  {
    [v22 addObserver:self selector:sel__audioPlayerStatusChangeNotification_ name:v23 object:v26];
    BOOL v27 = [v26 playerStatus];
    [(SUUITracklistLockupCollectionViewCell *)self showPreviewProgressWithStatus:v27 animated:0];
  }
  else
  {
    [(SUUITracklistLockupCollectionViewCell *)self hidePreviewProgressAnimated:0];
  }
}

void __77__SUUITracklistLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 824);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__SUUITracklistLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_2654074A8;
  id v10 = v3;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = v3;
  [v5 enumerateColumnsForTrack:v4 usingBlock:v9];
}

void __77__SUUITracklistLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v37 = v6;
  [v6 width];
  double v10 = v9;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v40;
    double v15 = (double)(uint64_t)v10;
    id v38 = v11;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(id *)(*((void *)&v39 + 1) + 8 * i);
        if ([v17 elementType] == 90)
        {
          long long v18 = [v17 flattenedChildren];
          uint64_t v19 = [v18 firstObject];

          id v17 = (id)v19;
        }
        uint64_t v20 = [v17 elementType];
        if (v20 > 49)
        {
          if (v20 > 137)
          {
            if (v20 == 138)
            {
              uint64_t v22 = [*(id *)(a1 + 32) addLabelViewWithElement:v17 width:*(void *)(a1 + 40) context:v15];
              goto LABEL_35;
            }
            if (v20 != 141) {
              goto LABEL_38;
            }
LABEL_18:
            id v21 = [*(id *)(a1 + 32) addButtonWithElement:v17 width:*(void *)(a1 + 40) context:v15];
            [v21 addTarget:*(void *)(a1 + 48) action:sel__cancelConfirmationAction_ forControlEvents:0x10000];
            [v21 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:0x20000];
            [v21 addTarget:*(void *)(a1 + 48) action:sel__showConfirmationAction_ forControlEvents:0x40000];
            LODWORD(v23) = -0.5;
            [v21 setCharge:v23];
            [v21 setItemOfferDelegate:*(void *)(a1 + 48)];
            if (v21)
            {
              double v24 = [v17 buyButtonDescriptor];
              if (v24)
              {
                uint64_t v25 = *(void **)(*(void *)(a1 + 48) + 816);
                if (!v25)
                {
                  uint64_t v26 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:517 capacity:1];
                  uint64_t v27 = *(void *)(a1 + 48);
                  v28 = *(void **)(v27 + 816);
                  *(void *)(v27 + 816) = v26;

                  uint64_t v25 = *(void **)(*(void *)(a1 + 48) + 816);
                }
                [v25 setObject:v21 forKey:v24];
                id v11 = v38;
              }
            }
LABEL_36:
            [v8 addObject:v21];
LABEL_37:

            goto LABEL_38;
          }
          if (v20 != 50)
          {
            if (v20 != 80) {
              goto LABEL_38;
            }
            uint64_t v22 = [*(id *)(a1 + 32) addLabelViewWithOrdinalElement:v17 width:*(void *)(a1 + 40) context:v15];
LABEL_35:
            id v21 = (id)v22;
            goto LABEL_36;
          }
LABEL_24:
          id v29 = [*(id *)(a1 + 32) addButtonWithElement:v17 width:*(void *)(a1 + 40) context:v15];
          [v29 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:64];
          [v8 addObject:v29];
          if ([v17 elementType] == 50) {
            id v21 = v29;
          }
          else {
            id v21 = 0;
          }

          if (v21)
          {
LABEL_29:
            id v30 = [*(id *)(a1 + 40) imageResourceCacheKeyForViewElement:v17];
            if (v30)
            {
              v31 = *(void **)(*(void *)(a1 + 48) + 840);
              if (!v31)
              {
                uint64_t v32 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:1];
                uint64_t v33 = *(void *)(a1 + 48);
                v34 = *(void **)(v33 + 840);
                *(void *)(v33 + 840) = v32;

                v31 = *(void **)(*(void *)(a1 + 48) + 840);
              }
              [v31 setObject:v30 forKey:v21];
              id v11 = v38;
            }

            goto LABEL_37;
          }
        }
        else
        {
          switch(v20)
          {
            case 8:
              id v21 = [*(id *)(a1 + 32) addBadgeViewWithElement:v17 width:*(void *)(a1 + 40) context:v15];
              [v8 addObject:v21];
              if (v21) {
                goto LABEL_29;
              }
              break;
            case 9:
              uint64_t v22 = [*(id *)(a1 + 32) addBarRatingWithElement:v17 width:*(void *)(a1 + 40) context:v15];
              goto LABEL_35;
            case 12:
              goto LABEL_24;
            case 13:
              goto LABEL_18;
            default:
              break;
          }
        }
LABEL_38:
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v13);
  }

  v35 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:a4];
  [*(id *)(*(void *)(a1 + 48) + 832) setObject:v8 forKey:v35];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [a4 requestIdentifier];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  uint64_t v11 = [(NSMapTable *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v22 = v8;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v16 = -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15, v22);
        id v17 = [v9 requestIdentifierForResourceCacheKey:v16];
        long long v18 = v17;
        if (v17 && [v17 unsignedIntegerValue] == v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = [v15 imageView];
            id v8 = v22;
            [v20 setImage:v22];
          }
          else
          {
            id v8 = v22;
            [v15 setImage:v22];
          }

          BOOL v19 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v12 = [(NSMapTable *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    BOOL v19 = 0;
    id v8 = v22;
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_16:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = self->_buyButtonDescriptorToButton;
  uint64_t v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (SUUIIKViewElementTypeIsButton(objc_msgSend(v15, "elementType", (void)v20))
          && ([v15 canPersonalizeUsingItemState:v8] & 1) != 0)
        {
          id v17 = [(NSMapTable *)self->_buyButtonDescriptorToButton objectForKey:v15];
          long long v18 = [v9 clientContext];
          [v17 setValuesUsingBuyButtonDescriptor:v15 itemState:v8 clientContext:v18 animated:v5];

          [(SUUITracklistLockupCollectionViewCell *)self setNeedsLayout];
          BOOL v16 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v12 = [(NSMapTable *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__77;
  double v15 = __Block_byref_object_dispose__77;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__SUUITracklistLockupCollectionViewCell_viewForElementIdentifier___block_invoke;
  v8[3] = &unk_2654074D0;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(SUUITracklistLockupCollectionViewCell *)self _enumerateViewElementViewsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __66__SUUITracklistLockupCollectionViewCell_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  id v8 = [a2 itmlID];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)SUUITracklistLockupCollectionViewCell;
  [(SUUICollectionViewCell *)&v23 layoutSubviews];
  uint64_t v3 = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[SUUITracklistLockupCollectionViewCell semanticContentAttribute](self, "semanticContentAttribute"));
  id v4 = [(SUUITracklistLockupCollectionViewCell *)self contentView];
  [v4 bounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  uint64_t v22 = 0;
  [(SUUITracklistColumnData *)self->_columnData leftEdgeInset];
  uint64_t v22 = v13;
  uint64_t v14 = [(SUUITracklistColumnData *)self->_columnData columns];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __55__SUUITracklistLockupCollectionViewCell_layoutSubviews__block_invoke;
  v19[3] = &unk_265407548;
  v19[6] = v6;
  v19[7] = v8;
  *(double *)&v19[8] = v10;
  *(double *)&v19[9] = v12;
  v19[4] = self;
  v19[5] = v21;
  BOOL v20 = v3 == 0;
  [v14 enumerateObjectsUsingBlock:v19];
  double v15 = [MEMORY[0x263F82B60] mainScreen];
  [v15 scale];
  double v17 = v16;

  [(SUUITracklistColumnData *)self->_columnData leftEdgeInset];
  -[UIView setFrame:](self->_separatorView, "setFrame:", v18, v12 - 1.0 / v17, v10 - v18);

  _Block_object_dispose(v21, 8);
}

void __55__SUUITracklistLockupCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 832) objectForKey:v6];
  [v5 width];
  double v9 = v8;
  if ([v7 count])
  {
    double v10 = malloc_type_malloc(32 * [v7 count], 0x1000040E0EAB150uLL);
    if (v10)
    {
      double v11 = v10;
      uint64_t v44 = 0;
      v45 = (double *)&v44;
      uint64_t v46 = 0x2020000000;
      uint64_t v47 = 0;
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __55__SUUITracklistLockupCollectionViewCell_layoutSubviews__block_invoke_2;
      v43[3] = &unk_2654074F8;
      *(double *)&v43[6] = v9;
      v43[7] = 0x7FEFFFFFFFFFFFFFLL;
      v43[4] = &v44;
      v43[5] = v10;
      [v7 enumerateObjectsUsingBlock:v43];
      v41[0] = 0;
      v41[1] = v41;
      double v42 = 0.0;
      float v12 = (*(double *)(a1 + 72) - v45[3]) * 0.5;
      v41[2] = 0x2020000000;
      double v42 = floorf(v12);
      uint64_t v29 = MEMORY[0x263EF8330];
      uint64_t v30 = 3221225472;
      v31 = __55__SUUITracklistLockupCollectionViewCell_layoutSubviews__block_invoke_3;
      uint64_t v32 = &unk_265407520;
      v36 = v11;
      v34 = v41;
      id v13 = v5;
      uint64_t v14 = *(void *)(a1 + 40);
      id v33 = v13;
      uint64_t v35 = v14;
      double v37 = v9;
      char v40 = *(unsigned char *)(a1 + 80);
      long long v15 = *(_OWORD *)(a1 + 64);
      long long v38 = *(_OWORD *)(a1 + 48);
      long long v39 = v15;
      [v7 enumerateObjectsUsingBlock:&v29];
      if (objc_msgSend(v13, "showsPreviewControl", v29, v30, v31, v32))
      {
        double v16 = [v7 firstObject];
        double v17 = v16;
        if (*(void *)(*(void *)(a1 + 32) + 864))
        {
          [v16 frame];
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          double v25 = v24;
          [*(id *)(*(void *)(a1 + 32) + 864) frame];
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 864), "setFrame:", v19 + (v23 - v26) * 0.5, v21 + (v25 - v27) * 0.5);
          [v17 setHidden:1];
        }
        else
        {
          [v16 setHidden:0];
        }
      }
      free(v11);

      _Block_object_dispose(v41, 8);
      _Block_object_dispose(&v44, 8);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 824) interColumnSpacing];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9
                                                              + v28
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
}

double __55__SUUITracklistLockupCollectionViewCell_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)(*(void *)(a1 + 40) + 32 * a3);
  id v6 = a2;
  [v6 frame];
  *id v5 = v7;
  v5[1] = v8;
  v5[2] = v9;
  v5[3] = v10;
  uint64_t v11 = *(void *)(a1 + 40) + 32 * a3;
  objc_msgSend(v6, "sizeThatFits:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v13 = v12;
  uint64_t v15 = v14;

  *(void *)(v11 + 16) = v13;
  *(void *)(v11 + 24) = v15;
  double v16 = *(double *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 40) + 32 * a3;
  double v18 = *(double *)(v17 + 24);
  float v19 = *(double *)(v17 + 16);
  double v20 = ceilf(v19);
  if (v16 >= v20) {
    double v16 = v20;
  }
  *(double *)(v17 + 16) = v16;
  uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v18 + *(double *)(v21 + 24);
  *(double *)(v21 + 24) = result;
  return result;
}

void __55__SUUITracklistLockupCollectionViewCell_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  *(void *)(*(void *)(a1 + 56) + 32 * a3 + 8) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  switch([*(id *)(a1 + 32) contentAlignment])
  {
    case 0:
    case 3:
    case 4:
      uint64_t v5 = *(void *)(a1 + 56);
      double v6 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(double *)(v5 + 32 * a3) = v6;
      break;
    case 1:
      uint64_t v5 = *(void *)(a1 + 56);
      uint64_t v7 = (double *)(v5 + 32 * a3);
      float v8 = (*(double *)(a1 + 64) - v7[2]) * 0.5;
      double v6 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + floorf(v8);
      goto LABEL_6;
    case 2:
      uint64_t v5 = *(void *)(a1 + 56);
      uint64_t v7 = (double *)(v5 + 32 * a3);
      double v6 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + *(double *)(a1 + 64) - v7[2];
LABEL_6:
      *uint64_t v7 = v6;
      break;
    default:
      uint64_t v5 = *(void *)(a1 + 56);
      double v6 = *(double *)(v5 + 32 * a3);
      break;
  }
  uint64_t v9 = (double *)(v5 + 32 * a3);
  double v10 = v9[1];
  double v11 = v9[2];
  double v12 = v9[3];
  if (!*(unsigned char *)(a1 + 104))
  {
    double Width = CGRectGetWidth(*(CGRect *)(a1 + 72));
    v17.origin.x = v6;
    v17.origin.y = v10;
    v17.size.width = v11;
    v17.size.height = v12;
    double v14 = Width - CGRectGetWidth(v17);
    v18.origin.x = v6;
    v18.origin.y = v10;
    v18.size.width = v11;
    v18.size.height = v12;
    double v6 = v14 - CGRectGetMinX(v18);
  }
  objc_msgSend(v15, "setFrame:", v6, v10, v11, v12);
  *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(*(CGRect *)(*(void *)(a1 + 56) + 32 * a3));
}

- (void)itemOfferButtonDidAnimateTransition:(id)a3
{
  if (([a3 isShowingConfirmation] & 1) == 0)
  {
    [(SUUIGradientView *)self->_offerConfirmationGradientView removeFromSuperview];
    offerConfirmationGradientView = self->_offerConfirmationGradientView;
    self->_offerConfirmationGradientView = 0;
  }
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  id v4 = a3;
  [v4 frame];
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  uint64_t v20 = 0;
  uint64_t v21 = (double *)&v20;
  uint64_t v22 = 0x3010000000;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  double v23 = "";
  objc_msgSend(v4, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  uint64_t v24 = v13;
  uint64_t v25 = v14;
  unsigned int v15 = [v4 isShowingConfirmation];
  if ((v15 & 1) == 0)
  {
    double v16 = [(SUUITracklistColumnData *)self->_columnData columns];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __78__SUUITracklistLockupCollectionViewCell_itemOfferButtonWillAnimateTransition___block_invoke;
    v17[3] = &unk_265407570;
    void v17[4] = self;
    id v18 = v4;
    float v19 = &v20;
    [v16 enumerateObjectsUsingBlock:v17];
  }
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  objc_msgSend(v4, "setFrame:", CGRectGetMaxX(v26) - v21[4], v8, v21[4], v21[5]);
  [(SUUITracklistLockupCollectionViewCell *)self _layoutConfirmationGradientRelativeToView:v4 alpha:(double)v15];
  _Block_object_dispose(&v20, 8);
}

void __78__SUUITracklistLockupCollectionViewCell_itemOfferButtonWillAnimateTransition___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  double v7 = *(void **)(a1[4] + 832);
  double v8 = [NSNumber numberWithUnsignedInteger:a3];
  double v9 = [v7 objectForKey:v8];

  if ([v9 containsObject:a1[5]])
  {
    double v10 = *(double *)(*(void *)(a1[6] + 8) + 32);
    [v12 width];
    if (v10 < v11) {
      double v11 = v10;
    }
    *(double *)(*(void *)(a1[6] + 8) + 32) = v11;
    *a4 = 1;
  }
}

- (void)_buttonAction:(id)a3
{
  id v4 = a3;
  columnViewsByIndex = self->_columnViewsByIndex;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SUUITracklistLockupCollectionViewCell__buttonAction___block_invoke;
  v7[3] = &unk_265407598;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  [(NSMutableDictionary *)columnViewsByIndex enumerateKeysAndObjectsUsingBlock:v7];
}

void __55__SUUITracklistLockupCollectionViewCell__buttonAction___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  uint64_t v7 = [a3 indexOfObjectIdenticalTo:*(void *)(a1 + 32)];
  id v8 = v14;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 824), "viewElementsForTrack:columnIndex:", *(void *)(*(void *)(a1 + 40) + 888), objc_msgSend(v14, "integerValue"));
    double v10 = [v9 objectAtIndex:v7];
    double v11 = SUUICollectionViewForView(*(void **)(a1 + 40));
    id v12 = [v11 delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [v11 indexPathForCell:*(void *)(a1 + 40)];
      [v12 collectionView:v11 didConfirmButtonElement:v10 withClickInfo:0 forItemAtIndexPath:v13];
    }
    else
    {
      [v10 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
    }
    *a4 = 1;

    id v8 = v14;
  }
}

- (void)_cancelConfirmationAction:(id)a3
{
}

- (void)_showConfirmationAction:(id)a3
{
  v16[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 superview];
  [v5 bringSubviewToFront:v4];
  offerConfirmationGradientView = self->_offerConfirmationGradientView;
  if (!offerConfirmationGradientView)
  {
    uint64_t v7 = [SUUIGradientView alloc];
    id v8 = -[SUUIGradientView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v9 = self->_offerConfirmationGradientView;
    self->_offerConfirmationGradientView = v8;

    double v10 = [(SUUITracklistLockupCollectionViewCell *)self backgroundColor];
    double v11 = [(SUUIGradientView *)self->_offerConfirmationGradientView layer];
    id v12 = [v10 colorWithAlphaComponent:0.0];
    v16[0] = [v12 CGColor];
    id v13 = v10;
    v16[1] = objc_msgSend(v13, "CGColor", v16[0]);
    id v14 = v13;
    v16[2] = [v14 CGColor];
    unsigned int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
    [v11 setColors:v15];

    objc_msgSend(v11, "setEndPoint:", 1.0, 0.5);
    objc_msgSend(v11, "setStartPoint:", 0.0, 0.5);

    offerConfirmationGradientView = self->_offerConfirmationGradientView;
  }
  [v5 insertSubview:offerConfirmationGradientView belowSubview:v4];
  [(SUUITracklistLockupCollectionViewCell *)self _layoutConfirmationGradientRelativeToView:v4 alpha:0.0];
  [v4 setShowingConfirmation:1 animated:1];
}

- (void)_audioPlayerStatusChangeNotification:(id)a3
{
  id v13 = a3;
  id v4 = [(SUUITracklistLockupCollectionViewCell *)self _previewMediaURL];
  double v5 = [v13 object];
  id v6 = [v5 URL];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    id v8 = [v5 playerStatus];
    uint64_t v9 = [v8 playerState];

    if ((unint64_t)(v9 - 6) > 0xFFFFFFFFFFFFFFFDLL)
    {
      double v10 = [MEMORY[0x263F08A00] defaultCenter];
      double v11 = [v13 name];
      id v12 = [v13 object];
      [v10 removeObserver:self name:v11 object:v12];

      [(SUUITracklistLockupCollectionViewCell *)self hidePreviewProgressAnimated:1];
    }
    else
    {
      double v10 = [v5 playerStatus];
      [(SUUITracklistLockupCollectionViewCell *)self showPreviewProgressWithStatus:v10 animated:1];
    }
  }
}

+ (id)_attributedStringForOrdinal:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 style];
  id v8 = SUUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    id v8 = SUUIFontLimitedPreferredFontForTextStyle(20, 5);
  }
  uint64_t v9 = [v6 tintColor];
  double v10 = SUUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    double v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
  }
  double v11 = [v5 text];
  id v12 = [v11 attributedStringWithDefaultFont:v8 foregroundColor:v10];

  return v12;
}

- (id)_addFlipContainerViewWithFrontView:(id)a3 backView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  id v12 = [[SUUIInlineFlipContainerView alloc] initWithFrontView:v7 backView:v6];

  id v13 = [MEMORY[0x263F825C8] clearColor];
  [(SUUIInlineFlipContainerView *)v12 setBackgroundColor:v13];

  [v7 frame];
  double v15 = v14;
  double v17 = v16;

  [(SUUIInlineFlipContainerView *)v12 frame];
  -[SUUIInlineFlipContainerView setFrame:](v12, "setFrame:", v9 - v15, v11 - v17);
  id v18 = [(SUUITracklistLockupCollectionViewCell *)self contentView];
  [v18 addSubview:v12];

  return v12;
}

- (void)_enumerateViewElementViewsUsingBlock:(id)a3
{
  id v4 = a3;
  columnData = self->_columnData;
  track = self->_track;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__SUUITracklistLockupCollectionViewCell__enumerateViewElementViewsUsingBlock___block_invoke;
  v8[3] = &unk_2654075E8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SUUITracklistColumnData *)columnData enumerateColumnsForTrack:track usingBlock:v8];
}

void __78__SUUITracklistLockupCollectionViewCell__enumerateViewElementViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  double v8 = (objc_class *)NSNumber;
  id v9 = a3;
  double v10 = (void *)[[v8 alloc] initWithUnsignedInteger:a4];
  double v11 = [*(id *)(*(void *)(a1 + 32) + 832) objectForKey:v10];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__SUUITracklistLockupCollectionViewCell__enumerateViewElementViewsUsingBlock___block_invoke_2;
  v14[3] = &unk_2654075C0;
  id v12 = *(id *)(a1 + 40);
  id v15 = v11;
  id v16 = v12;
  uint64_t v17 = a5;
  id v13 = v11;
  [v9 enumerateObjectsUsingBlock:v14];
}

void __78__SUUITracklistLockupCollectionViewCell__enumerateViewElementViewsUsingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  char v12 = 0;
  double v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = a2;
  double v10 = [v8 objectAtIndex:a3];
  (*(void (**)(uint64_t, id, void *, char *))(v7 + 16))(v7, v9, v10, &v12);

  char v11 = v12;
  **(unsigned char **)(a1 + 48) = v12;
  *a4 = v11;
}

- (void)_layoutConfirmationGradientRelativeToView:(id)a3 alpha:(double)a4
{
  v22[3] = *MEMORY[0x263EF8340];
  if (self->_offerConfirmationGradientView)
  {
    [a3 frame];
    double v7 = v6;
    double v9 = v8;
    [(SUUIGradientView *)self->_offerConfirmationGradientView frame];
    double v11 = v10;
    double v12 = v7 + -30.0;
    double v13 = v9 + 30.0;
    separatorView = self->_separatorView;
    if (separatorView)
    {
      [(UIView *)separatorView frame];
      double v16 = v15;
    }
    else
    {
      uint64_t v17 = [(SUUIGradientView *)self->_offerConfirmationGradientView superview];
      [v17 bounds];
      double v16 = v18;
    }
    [(SUUIGradientView *)self->_offerConfirmationGradientView setAlpha:a4];
    -[SUUIGradientView setFrame:](self->_offerConfirmationGradientView, "setFrame:", v12, v11, v13, v16);
    float v19 = [(SUUIGradientView *)self->_offerConfirmationGradientView layer];
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithDouble:", 30.0 / v13, &unk_2705D0D00);
    v22[1] = v20;
    v22[2] = &unk_2705D0D18;
    uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
    [v19 setLocations:v21];
  }
}

- (id)_previewColumnView
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__77;
  double v11 = __Block_byref_object_dispose__77;
  id v12 = 0;
  uint64_t v3 = [(SUUITracklistColumnData *)self->_columnData columns];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__SUUITracklistLockupCollectionViewCell__previewColumnView__block_invoke;
  v6[3] = &unk_265407610;
  v6[4] = self;
  v6[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __59__SUUITracklistLockupCollectionViewCell__previewColumnView__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 showsPreviewControl])
  {
    id v11 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 832) objectForKey:v11];
    uint64_t v8 = [v7 firstObject];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    double v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (id)_previewControlViewElement
{
  return [(SUUIViewElement *)self->_track firstChildForElementType:90];
}

- (id)_previewMediaURL
{
  v2 = [(SUUITracklistLockupCollectionViewCell *)self _previewControlViewElement];
  uint64_t v3 = [v2 mediaURLString];

  if (v3)
  {
    id v4 = [NSURL URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_resolvePreviewStateAfterTransitionForFlipView:(id)a3
{
  id v25 = a3;
  id v4 = [(SUUITracklistLockupCollectionViewCell *)self contentView];
  int64_t previewState = self->_previewState;
  if (previewState == 3)
  {
    [v25 removeFromSuperview];
    double v23 = [(SUUITracklistLockupCollectionViewCell *)self _previewColumnView];
    uint64_t v24 = [(SUUITracklistLockupCollectionViewCell *)self contentView];
    [v24 addSubview:v23];

    [(SUUITracklistLockupCollectionViewCell *)self setNeedsLayout];
    self->_int64_t previewState = 0;
  }
  else if (previewState == 1)
  {
    [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator superview];
    objc_msgSend(v4, "convertRect:fromView:", v14, v7, v9, v11, v13);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    -[SUUIPreviewProgressIndicator setFrame:](self->_previewProgressIndicator, "setFrame:", v16, v18, v20, v22);
    [v4 addSubview:self->_previewProgressIndicator];
    [v25 removeFromSuperview];
    [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator reloadWithPlayerStatus:self->_lastPlayerStatus animated:0];
    self->_int64_t previewState = 2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_track, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_previewProgressIndicator, 0);
  objc_storeStrong((id *)&self->_offerConfirmationGradientView, 0);
  objc_storeStrong((id *)&self->_lastPlayerStatus, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_columnViewsByIndex, 0);
  objc_storeStrong((id *)&self->_columnData, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptorToButton, 0);
}

@end