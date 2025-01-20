@interface SUUIHorizontalLockupView
+ (BOOL)_usesEditorialLayoutForLabelViewElement:(id)a3;
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
+ (id)_attributedStringForButton:(id)a3 context:(id)a4;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (id)_attributedStringForOrdinal:(id)a3 context:(id)a4;
+ (void)_requestLayoutForViewElements:(id)a3 width:(double)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)_usesBackgroundWithAlpha;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)offerViewAnimateTransition:(id)a3;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateLayoutOnButtonConfirmation;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)_sizeViewsForColumn:(id)a3 toFitWidth:(double)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIHorizontalLockupView)initWithFrame:(CGRect)a3;
- (UIColor)gradientColor;
- (UIView)metadataBackgroundView;
- (double)_dividerHeight:(id)a3;
- (id)_addFlipContainerViewWithFrontView:(id)a3 backView:(id)a4;
- (id)_columnForView:(id)a3;
- (id)_previewFrontView;
- (id)_previewMediaURL;
- (id)_previewProgressIndicator;
- (id)_viewElementForView:(id)a3;
- (id)preferredBackgroundColor;
- (id)viewForElementIdentifier:(id)a3;
- (void)_addConfirmationGradientForView:(id)a3;
- (void)_animateButton:(id)a3;
- (void)_audioPlayerStatusChangeNotification:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_cancelConfirmationAction:(id)a3;
- (void)_expandEditorialForLabel:(id)a3;
- (void)_handlePlayButtonTap:(id)a3 element:(id)a4;
- (void)_layoutConfirmationGradientRelativeToItemOfferView:(id)a3 alpha:(double)a4;
- (void)_performDefaultActionForImage:(id)a3;
- (void)_previewIndicatorAction:(id)a3;
- (void)_resizeMetadataRelativeToItemOfferView:(id)a3;
- (void)_resolvePreviewStateAfterTransitionForFlipView:(id)a3;
- (void)_showConfirmationAction:(id)a3;
- (void)_tapGestureAction:(id)a3;
- (void)dealloc;
- (void)hidePreviewProgressAnimated:(BOOL)a3;
- (void)itemOfferButtonDidAnimateTransition:(id)a3;
- (void)itemOfferButtonWillAnimateTransition:(id)a3;
- (void)layoutSubviews;
- (void)mediaPlayer:(id)a3 itemStateChanged:(id)a4;
- (void)offerViewDidAnimateTransition:(id)a3;
- (void)offerViewWillAnimateTransition:(id)a3;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setContainerBackgroundImageForPlayButton:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setGradientColor:(id)a3;
- (void)setMetadataBackgroundView:(id)a3;
- (void)setPerspectiveTargetView:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setUpdateLayoutOnButtonConfirmation:(BOOL)a3;
- (void)setVanishingPoint:(CGPoint)a3;
- (void)showPreviewProgressWithStatus:(id)a3 animated:(BOOL)a4;
- (void)togglePreviewPlaybackAnimated:(BOOL)a3;
- (void)updateForChangedDistanceFromVanishingPoint;
@end

@implementation SUUIHorizontalLockupView

- (SUUIHorizontalLockupView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIHorizontalLockupView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    viewElementViews = v3->_viewElementViews;
    v3->_viewElementViews = (NSMapTable *)v4;
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F89738] object:0];
  [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer removeTarget:self action:0];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUIHorizontalLockupView;
  [(SUUIViewReuseView *)&v4 dealloc];
}

- (id)preferredBackgroundColor
{
  v3 = [(SUUILockupViewElement *)self->_lockupElement style];
  objc_super v4 = [v3 ikBackgroundColor];
  v5 = [v4 color];

  if (!v5)
  {
    if ([(SUUILockupViewElement *)self->_lockupElement lockupViewType] == 7)
    {
      v5 = [MEMORY[0x263F825C8] colorWithWhite:0.109803922 alpha:0.72];
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  +[SUUIStackedImageView maximumPerspectiveHeightForSize:](SUUIStackedImageView, "maximumPerspectiveHeightForSize:", a3.width, a3.height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  objc_initWeak(&location, a3);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__SUUIHorizontalLockupView_setPerspectiveTargetView___block_invoke;
  v4[3] = &unk_265405AE0;
  objc_copyWeak(&v5, &location);
  [(SUUIViewReuseView *)self enumerateExistingViewsForReuseIdentifier:0x270504D70 usingBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__SUUIHorizontalLockupView_setPerspectiveTargetView___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 setPerspectiveTargetView:WeakRetained];
}

- (void)setVanishingPoint:(CGPoint)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__SUUIHorizontalLockupView_setVanishingPoint___block_invoke;
  v3[3] = &__block_descriptor_48_e23_v32__0__UIView_8Q16_B24l;
  CGPoint v4 = a3;
  [(SUUIViewReuseView *)self enumerateExistingViewsForReuseIdentifier:0x270504D70 usingBlock:v3];
}

uint64_t __46__SUUIHorizontalLockupView_setVanishingPoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVanishingPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)updateForChangedDistanceFromVanishingPoint
{
}

uint64_t __70__SUUIHorizontalLockupView_updateForChangedDistanceFromVanishingPoint__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateForChangedDistanceFromVanishingPoint];
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
      v9 = [(SUUIHorizontalLockupView *)self _previewFrontView];
      if (a3)
      {
        v10 = [(SUUIHorizontalLockupView *)self _addFlipContainerViewWithFrontView:v6 backView:v9];
        [v9 setHidden:0];
        objc_initWeak(&location, self);
        v11 = [MEMORY[0x263F82438] sharedApplication];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __56__SUUIHorizontalLockupView_hidePreviewProgressAnimated___block_invoke;
        v13[3] = &unk_265402A38;
        id v12 = v10;
        id v14 = v12;
        objc_copyWeak(&v15, &location);
        [v11 _performBlockAfterCATransactionCommits:v13];

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
      else
      {
        self->_int64_t previewState = 0;
        [(SUUIPreviewProgressIndicator *)v6 removeFromSuperview];
        [(SUUIHorizontalLockupView *)self addSubview:v9];
        [(SUUIHorizontalLockupView *)self setNeedsLayout];
      }
    }
  }
}

void __56__SUUIHorizontalLockupView_hidePreviewProgressAnimated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__SUUIHorizontalLockupView_hidePreviewProgressAnimated___block_invoke_2;
  v3[3] = &unk_2654022F8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  [v2 flipToBackViewWithDuration:0x100000 options:v3 completionBlock:0.5];

  objc_destroyWeak(&v5);
}

void __56__SUUIHorizontalLockupView_hidePreviewProgressAnimated___block_invoke_2(uint64_t a1)
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
    if (previewState == 2)
    {
      [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator setHidden:0];
      [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator reloadWithPlayerStatus:v7 animated:v4];
    }
  }
  else
  {
    v9 = [(SUUIHorizontalLockupView *)self _previewFrontView];
    if (v9)
    {
      v10 = [(SUUIHorizontalLockupView *)self _previewProgressIndicator];
      v11 = v10;
      if (v4)
      {
        id v12 = [(SUUIHorizontalLockupView *)self _addFlipContainerViewWithFrontView:v9 backView:v10];
        self->_int64_t previewState = 1;
        [v11 reloadWithPlayerStatus:v7 animated:1];
        objc_initWeak(&location, self);
        v13 = [MEMORY[0x263F82438] sharedApplication];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __67__SUUIHorizontalLockupView_showPreviewProgressWithStatus_animated___block_invoke_2;
        v16[3] = &unk_265402A38;
        id v14 = v12;
        id v17 = v14;
        objc_copyWeak(&v18, &location);
        [v13 _performBlockAfterCATransactionCommits:v16];

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      else
      {
        self->_int64_t previewState = 2;
        [v10 setEnabled:1];
        [(SUUIHorizontalLockupView *)self addSubview:v11];
        [(SUUIHorizontalLockupView *)self setNeedsLayout];
        id v15 = [MEMORY[0x263F82438] sharedApplication];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __67__SUUIHorizontalLockupView_showPreviewProgressWithStatus_animated___block_invoke;
        v20[3] = &unk_265405B48;
        id v21 = v11;
        v22 = self;
        BOOL v23 = v4;
        [v15 _performBlockAfterCATransactionCommits:v20];

        id v14 = v21;
      }
    }
  }
}

uint64_t __67__SUUIHorizontalLockupView_showPreviewProgressWithStatus_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadWithPlayerStatus:*(void *)(*(void *)(a1 + 40) + 488) animated:*(unsigned __int8 *)(a1 + 48)];
}

void __67__SUUIHorizontalLockupView_showPreviewProgressWithStatus_animated___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__SUUIHorizontalLockupView_showPreviewProgressWithStatus_animated___block_invoke_3;
  v3[3] = &unk_2654022F8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  [v2 flipToBackViewWithDuration:0x200000 options:v3 completionBlock:0.5];

  objc_destroyWeak(&v5);
}

void __67__SUUIHorizontalLockupView_showPreviewProgressWithStatus_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _resolvePreviewStateAfterTransitionForFlipView:*(void *)(a1 + 32)];
}

- (void)togglePreviewPlaybackAnimated:(BOOL)a3
{
  id v4 = [(SUUIHorizontalLockupView *)self _previewMediaURL];
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
      [(SUUIHorizontalLockupView *)self hidePreviewProgressAnimated:1];
    }
    else
    {
      id v8 = (id)[v6 stopAllAudioPlayerSessions];
      v9 = [v6 startSessionWithURL:v12];
      [v5 addObserver:self selector:sel__audioPlayerStatusChangeNotification_ name:*MEMORY[0x263F89738] object:v9];
      v10 = [(SUUIViewElement *)self->_lockupElement firstChildForElementType:90];
      objc_msgSend(v9, "setStoreItemIdentifier:", objc_msgSend(v10, "itemIdentifier"));
      v11 = [v9 playerStatus];
      [(SUUIHorizontalLockupView *)self showPreviewProgressWithStatus:v11 animated:1];

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
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__SUUIHorizontalLockupView_prefetchResourcesForViewElement_reason_context___block_invoke;
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

uint64_t __75__SUUIHorizontalLockupView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) prefetchResourcesForViewElement:a2 reason:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24)) {
    char v5 = 1;
  }
  else {
    char v5 = result;
  }
  *(unsigned char *)(v4 + 24) = v5;
  return result;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [[SUUIHorizontalLockupLayout alloc] initWithLockup:v8 context:v9];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__48;
  v27 = __Block_byref_object_dispose__48;
  id v28 = 0;
  double v11 = [(SUUIHorizontalLockupLayout *)v10 columns];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __70__SUUIHorizontalLockupView_requestLayoutForViewElement_width_context___block_invoke;
  char v18 = &unk_265405B70;
  id v21 = a1;
  double v22 = a4;
  id v12 = v9;
  id v19 = v12;
  v20 = &v23;
  [v11 enumerateObjectsUsingBlock:&v15];

  -[SUUIHorizontalLockupLayout sizeColumnsToFitWidth:context:](v10, "sizeColumnsToFitWidth:context:", v12, a4, v15, v16, v17, v18);
  double v13 = (void *)v24[5];
  if (v13)
  {
    int64_t v14 = [v13 childViewElements];
    [(id)v24[5] size];
    objc_msgSend(a1, "_requestLayoutForViewElements:width:context:", v14, v12);
  }
  _Block_object_dispose(&v23, 8);
}

void __70__SUUIHorizontalLockupView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  unint64_t v3 = [v8 identifier];
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x57) != 0)
    {
      uint64_t v4 = *(void **)(a1 + 48);
      char v5 = [v8 childViewElements];
      [v4 _requestLayoutForViewElements:v5 width:*(void *)(a1 + 32) context:*(double *)(a1 + 56)];
LABEL_4:

      goto LABEL_5;
    }
    if (v3 == 3)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      id v7 = v8;
      char v5 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v7;
      goto LABEL_4;
    }
  }
LABEL_5:
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v20 = 0;
  id v21 = (double *)&v20;
  uint64_t v22 = 0x3010000000;
  uint64_t v23 = "";
  double v24 = a3;
  uint64_t v25 = 0;
  id v9 = [[SUUIHorizontalLockupLayout alloc] initWithLockup:v7 context:v8];
  [(SUUIHorizontalLockupLayout *)v9 sizeColumnsToFitWidth:v8 context:a3];
  uint64_t v16 = 0;
  uint64_t v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  double v10 = [(SUUIHorizontalLockupLayout *)v9 columns];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__SUUIHorizontalLockupView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v15[3] = &unk_265405B98;
  v15[4] = &v16;
  v15[5] = &v20;
  [v10 enumerateObjectsUsingBlock:v15];

  double v11 = v21[4];
  double v12 = v17[3] + v21[5];
  v21[5] = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v20, 8);
  double v13 = v11;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

void __66__SUUIHorizontalLockupView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 identifier] == 6)
  {
    [v3 size];
    uint64_t v5 = v4;

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  }
  else
  {
    double v6 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v3 size];
    double v8 = v7;

    if (v6 >= v8) {
      double v9 = v6;
    }
    else {
      double v9 = v8;
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v9;
  }
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  [(NSHashTable *)self->_artworkRelatedChildViewElementViews removeAllObjects];
  [(NSMapTable *)self->_cacheKeyToImageView removeAllObjects];
  [(NSMapTable *)self->_buyButtonDescriptorToButton removeAllObjects];
  [(NSHashTable *)self->_offerViews removeAllObjects];
  badge = self->_badge;
  self->_badge = 0;

  objc_storeStrong((id *)&self->_lockupElement, a3);
  double v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  tappableViews = self->_tappableViews;
  self->_tappableViews = v12;

  [(NSMapTable *)self->_viewElementViews removeAllObjects];
  [(SUUIGradientView *)self->_offerConfirmationGradientView removeFromSuperview];
  offerConfirmationGradientView = self->_offerConfirmationGradientView;
  self->_offerConfirmationGradientView = 0;

  playButton = self->_playButton;
  self->_playButton = 0;

  uint64_t v16 = [[SUUIHorizontalLockupLayout alloc] initWithLockup:v9 context:v10];
  layout = self->_layout;
  self->_layout = v16;

  [(SUUIHorizontalLockupLayout *)self->_layout sizeColumnsToFitWidth:v10 context:a4];
  self->_useClearBackground = [(SUUIHorizontalLockupView *)self _usesBackgroundWithAlpha];
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__48;
  v56 = __Block_byref_object_dispose__48;
  id v57 = 0;
  v47 = v9;
  if ([v9 lockupViewType] == 7 || objc_msgSend(v9, "lockupViewType") == 6)
  {
    if (!self->_metadataBackgroundView)
    {
      uint64_t v18 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      metadataBackgroundView = self->_metadataBackgroundView;
      self->_metadataBackgroundView = v18;

      [(SUUIHorizontalLockupView *)self addSubview:self->_metadataBackgroundView];
    }
    uint64_t v20 = [v9 style];
    id v21 = [v20 ikBackgroundColor];
    uint64_t v22 = [v21 color];

    if (!v22)
    {
      if ([v47 lockupViewType] == 7)
      {
        uint64_t v22 = [MEMORY[0x263F825C8] colorWithWhite:0.109803922 alpha:0.72];
      }
      else
      {
        uint64_t v22 = 0;
      }
    }
    [(UIView *)self->_metadataBackgroundView setBackgroundColor:v22];
    self->_useClearBackground = 1;
  }
  else
  {
    [(UIView *)self->_metadataBackgroundView removeFromSuperview];
    uint64_t v22 = self->_metadataBackgroundView;
    self->_metadataBackgroundView = 0;
  }

  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __64__SUUIHorizontalLockupView_reloadWithViewElement_width_context___block_invoke;
  v48[3] = &unk_265405BE8;
  v48[4] = self;
  double v51 = a4;
  id v23 = v10;
  id v49 = v23;
  v50 = &v52;
  [(SUUIViewReuseView *)self modifyUsingBlock:v48];
  if ([(NSMutableArray *)self->_tappableViews count]
    || [(SUUILockupViewElement *)self->_lockupElement isSelectable])
  {
    tapGestureRecognizer = self->_tapGestureRecognizer;
    if (!tapGestureRecognizer)
    {
      uint64_t v25 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__tapGestureAction_];
      v26 = self->_tapGestureRecognizer;
      self->_tapGestureRecognizer = v25;

      [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
      [(SUUIHorizontalLockupView *)self addGestureRecognizer:self->_tapGestureRecognizer];
      tapGestureRecognizer = self->_tapGestureRecognizer;
    }
    [(UITapGestureRecognizer *)tapGestureRecognizer setEnabled:1];
  }
  else
  {
    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setEnabled:1];
    v43 = self->_tappableViews;
    self->_tappableViews = 0;
  }
  [(SUUIHorizontalLockupView *)self sendSubviewToBack:v53[5]];
  v27 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v28 = *MEMORY[0x263F89738];
  [v27 removeObserver:self name:*MEMORY[0x263F89738] object:0];
  v29 = [(SUUIHorizontalLockupView *)self _previewMediaURL];
  if (v29
    && ([MEMORY[0x263F895C8] sessionManager],
        v30 = objc_claimAutoreleasedReturnValue(),
        [v30 audioPlayerForURL:v29],
        v31 = objc_claimAutoreleasedReturnValue(),
        v30,
        v31))
  {
    [v27 addObserver:self selector:sel__audioPlayerStatusChangeNotification_ name:v28 object:v31];
    v32 = [v31 playerStatus];
    [(SUUIHorizontalLockupView *)self showPreviewProgressWithStatus:v32 animated:0];
  }
  else
  {
    [(SUUIHorizontalLockupView *)self hidePreviewProgressAnimated:0];
    v31 = 0;
  }
  v33 = +[SUUIMediaPlayerInterface sharedInstance];
  [v33 removeObserver:self];

  v34 = self->_playButton;
  if (v34)
  {
    v35 = [(SUUIPlayButton *)v34 playItemIdentifier];

    if (v35)
    {
      v36 = +[SUUIMediaPlayerInterface sharedInstance];
      v37 = [(SUUIPlayButton *)self->_playButton playItemIdentifier];
      v38 = [v36 playerForItemWithIdentifier:v37];

      v39 = [(SUUIPlayButton *)self->_playButton playItemIdentifier];
      if ([v36 identifierIsOnDeck:v39])
      {
        BOOL v40 = [(SUUIPlayButtonControl *)self->_playButton isIndeterminate];

        if (!v40)
        {
          [(SUUIPlayButtonControl *)self->_playButton beginIndeterminateAnimation];
          [(SUUIPlayButtonControl *)self->_playButton showPlayIndicator:0];
LABEL_36:
          v45 = +[SUUIMediaPlayerInterface sharedInstance];
          [v45 addObserver:self];

          goto LABEL_37;
        }
      }
      else
      {
      }
      if (v38)
      {
        v41 = [v38 playerItem];
        unint64_t v42 = [v41 playState];

        if ([(SUUIPlayButton *)self->_playButton showOnDemand]) {
          [(SUUIPlayButton *)self->_playButton setHidden:0];
        }
        if (v42 <= 5 && ((1 << v42) & 0x31) != 0)
        {
          [(SUUIPlayButtonControl *)self->_playButton hideProgressAnimated:1];
        }
        else
        {
          v44 = objc_msgSend(v38, "playerItem", self->_playButton);
          [v46 reloadWithItemStatus:v44 animated:0];

          [(SUUIPlayButtonControl *)self->_playButton showPlayIndicator:v42 == 3];
        }
      }
      else
      {
        [(SUUIPlayButtonControl *)self->_playButton hideProgressAnimated:1];
        if ([(SUUIPlayButton *)self->_playButton showOnDemand]) {
          [(SUUIPlayButton *)self->_playButton setHidden:1];
        }
      }
      goto LABEL_36;
    }
  }
LABEL_37:

  _Block_object_dispose(&v52, 8);
}

void __64__SUUIHorizontalLockupView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 496) columns];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__SUUIHorizontalLockupView_reloadWithViewElement_width_context___block_invoke_2;
  v11[3] = &unk_265405BC0;
  uint64_t v16 = *(void *)(a1 + 56);
  id v5 = v3;
  id v12 = v5;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v13 = v6;
  uint64_t v14 = v7;
  uint64_t v15 = *(void *)(a1 + 48);
  [v4 enumerateObjectsUsingBlock:v11];

  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 504) lockupViewType];
  id v9 = *(unsigned char **)(a1 + 32);
  if (v8 == 5 || v9[576])
  {
    id v10 = [MEMORY[0x263F825C8] clearColor];
    [v9 setBackgroundColor:v10];
  }
}

void __64__SUUIHorizontalLockupView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = [v3 identifier];
  id v5 = [v3 childViewElements];
  [v3 size];
  double v7 = v6;
  unint64_t v69 = v4;
  v66 = v3;
  if (v4 <= 6 && ((1 << v4) & 0x76) != 0) {
    double v7 = *(double *)(a1 + 64);
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v71 = *(void *)v73;
    unint64_t v67 = v4 - 1;
    uint64_t v68 = (uint64_t)v7;
    double v10 = (double)(uint64_t)v7;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v73 != v71) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        id v13 = v12;
        uint64_t v14 = [v13 elementType];
        uint64_t v15 = v14;
        id v16 = 0;
        if (v14 <= 61)
        {
          if (v14 > 28)
          {
            switch(v14)
            {
              case '0':
                uint64_t v19 = [*(id *)(a1 + 32) addHeaderViewWithElement:v13 width:*(void *)(a1 + 40) context:v10];
                goto LABEL_75;
              case '1':
                goto LABEL_63;
              case '2':
                goto LABEL_32;
              case '3':
                v32 = [*(id *)(a1 + 32) addImageDeckViewWithElement:v13 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
                goto LABEL_78;
              default:
                if (v14 != 29)
                {
                  id v17 = 0;
                  uint64_t v18 = 0;
                  if (v14 != 32) {
                    goto LABEL_115;
                  }
                  id v36 = v13;
                  id v17 = [*(id *)(a1 + 32) addDividerWithElement:v36 context:*(void *)(a1 + 40)];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    if ([v36 dividerType] == 3)
                    {
                      [*(id *)(a1 + 48) _dividerHeight:v36];
                      objc_msgSend(v17, "setDividerSize:");
                      uint64_t v37 = 1;
                    }
                    else
                    {
                      uint64_t v37 = 0;
                    }
                    [v17 setDividerOrientation:v37];
                  }
LABEL_96:

                  goto LABEL_97;
                }
LABEL_63:
                id v16 = [*(id *)(a1 + 32) addImageViewWithElement:v13 context:*(void *)(a1 + 40)];
                v35 = [v13 ancestorElementMatchingPredicate:&__block_literal_global_39_0];
                unint64_t v38 = v69;
                if (!v35)
                {
                  if ([v16 isUserInteractionEnabled])
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0 && v69 != 5)
                    {
                      [*(id *)(*(void *)(a1 + 48) + 568) addObject:v16];
                      id v46 = v16;
                      break;
                    }
                  }
                  if ([*(id *)(*(void *)(a1 + 48) + 504) isSelectable])
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v47 = v16;
                      v48 = [v13 firstChildForElementType:12];
                      if ([v48 buttonViewType] && objc_msgSend(v48, "buttonViewType") == 12)
                      {
                        id v49 = [v48 itmlID];
                        id v65 = v47;
                        v50 = [v47 viewForElementIdentifier:v49];

                        if (v50)
                        {
                          [*(id *)(*(void *)(a1 + 48) + 568) addObject:v50];
                          [*(id *)(*(void *)(a1 + 48) + 584) setObject:v50 forKey:v48];
                        }

                        unint64_t v38 = v69;
                        id v47 = v65;
                      }
                    }
                  }
                }
                id v39 = v16;
                if (v38 == 5) {
                  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v16);
                }
                break;
            }
LABEL_66:
          }
          else
          {
            if (v14 != 8)
            {
              if (v14 == 12)
              {
LABEL_32:
                id v28 = v13;
                v29 = [*(id *)(a1 + 32) addButtonWithElement:v28 width:*(void *)(a1 + 40) context:v10];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  objc_storeStrong((id *)(*(void *)(a1 + 48) + 536), v29);
                }
                [v29 addTarget:0 action:sel_suuiadvertising_advertSelectionEventShouldBeForwarded_ forControlEvents:64];
                [v29 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:64];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [v29 setDelegate:*(void *)(a1 + 48)];
                }
                LODWORD(v30) = -0.5;
                [v29 setCharge:v30];
                id v31 = v29;
                id v17 = v31;
                if (v15 == 50) {
                  id v16 = v31;
                }
                else {
                  id v16 = 0;
                }
                if (v15 == 50) {
                  uint64_t v18 = 0;
                }
                else {
                  uint64_t v18 = v31;
                }
                if ([v28 isBigHitButton])
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    objc_msgSend(v17, "setBigHitInsets:", -10.0, 5.0, -10.0, -5.0);
                  }
                }
                if ([*(id *)(*(void *)(a1 + 48) + 504) isSelectable]) {
                  [*(id *)(*(void *)(a1 + 48) + 568) addObject:v17];
                }

                id v22 = 0;
                if (!v17) {
                  goto LABEL_99;
                }
              }
              else
              {
                id v17 = 0;
                uint64_t v18 = 0;
                if (v14 != 13) {
                  goto LABEL_115;
                }
LABEL_17:
                uint64_t v20 = [*(id *)(a1 + 32) addButtonWithElement:v13 width:*(void *)(a1 + 40) context:v10];
                [v20 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:0x20000];
                [v20 addTarget:*(void *)(a1 + 48) action:sel__cancelConfirmationAction_ forControlEvents:0x10000];
                [v20 addTarget:*(void *)(a1 + 48) action:sel__showConfirmationAction_ forControlEvents:0x40000];
                [v20 addTarget:0 action:sel_suuiadvertising_advertSelectionEventShouldBeForwarded_ forControlEvents:64];
                LODWORD(v21) = -1.0;
                [v20 setCharge:v21];
                [v20 setItemOfferDelegate:*(void *)(a1 + 48)];
                id v17 = v20;
                id v22 = 0;
                id v16 = 0;
                uint64_t v18 = v17;
                if (!v17) {
                  goto LABEL_99;
                }
              }
              goto LABEL_98;
            }
            id v16 = [*(id *)(a1 + 32) addBadgeViewWithElement:v13 width:*(void *)(a1 + 40) context:v10];
            v33 = [v13 style];
            uint64_t v34 = [v33 elementPosition];

            if (v34 == 7)
            {
              objc_storeStrong((id *)(*(void *)(a1 + 48) + 432), v12);
              v35 = [MEMORY[0x263F825C8] clearColor];
              [v16 setBackgroundColor:v35];
              goto LABEL_66;
            }
          }
          id v22 = 0;
          uint64_t v18 = 0;
          id v17 = v16;
          if (!v16) {
            goto LABEL_99;
          }
          goto LABEL_98;
        }
        if (v14 > 134)
        {
          id v17 = 0;
          uint64_t v18 = 0;
          switch(v14)
          {
            case 135:
              uint64_t v19 = [*(id *)(a1 + 32) addStarRatingViewWithViewElement:v13 width:*(void *)(a1 + 40) context:v10];
              goto LABEL_75;
            case 136:
            case 137:
            case 139:
            case 140:
            case 142:
            case 143:
              goto LABEL_115;
            case 138:
              id v36 = v13;
              uint64_t v40 = [*(id *)(a1 + 40) maxWidthForElement:v36 withDefaultWidth:v68];
              char v41 = [(id)objc_opt_class() _usesEditorialLayoutForLabelViewElement:v36];
              double v42 = (double)v40;
              v43 = *(void **)(a1 + 32);
              uint64_t v44 = *(void *)(a1 + 40);
              if (v41)
              {
                id v17 = [v43 addTextViewWithElement:v36 width:v44 context:v42];
                if ([v17 isUserInteractionEnabled]) {
                  [*(id *)(*(void *)(a1 + 48) + 568) addObject:v17];
                }
              }
              else
              {
                id v17 = [v43 addLabelViewWithElement:v36 width:v44 context:v42];
              }
              goto LABEL_96;
            case 141:
              goto LABEL_17;
            case 144:
              uint64_t v19 = [*(id *)(a1 + 32) addTomatoRatingViewWithViewElement:v13 width:*(void *)(a1 + 40) context:v10];
              goto LABEL_75;
            default:
              if (v14 == 152)
              {
                id v45 = [*(id *)(a1 + 32) addImageViewWithVideoElement:v13 context:*(void *)(a1 + 40)];
                id v16 = v45;
                id v22 = 0;
                goto LABEL_79;
              }
              id v17 = 0;
              uint64_t v18 = 0;
              if (v14 != 154) {
                goto LABEL_115;
              }
              v32 = [*(id *)(a1 + 32) addImageGridViewWithElement:v13 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
              break;
          }
LABEL_78:
          id v45 = v32;
          id v22 = v45;
          id v16 = 0;
LABEL_79:
          uint64_t v18 = 0;
          id v17 = v45;
          if (!v45) {
            goto LABEL_99;
          }
          goto LABEL_98;
        }
        if (v14 <= 79)
        {
          if (v14 == 62)
          {
            v32 = [*(id *)(a1 + 32) addHorizontalListWithElement:v13 width:*(void *)(a1 + 40) context:v10];
            goto LABEL_78;
          }
          id v17 = 0;
          uint64_t v18 = 0;
          if (v14 != 77) {
            goto LABEL_115;
          }
          id v23 = [*(id *)(a1 + 32) addOfferViewWithViewElement:v13 width:*(void *)(a1 + 40) context:v10];
          [v23 setDelegate:*(void *)(a1 + 48)];
          if (v67 <= 1) {
            [v23 setMetadataPosition:0];
          }
          id v22 = v23;
          if (v22)
          {
            double v24 = *(void **)(*(void *)(a1 + 48) + 528);
            if (!v24)
            {
              uint64_t v25 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:1];
              uint64_t v26 = *(void *)(a1 + 48);
              v27 = *(void **)(v26 + 528);
              *(void *)(v26 + 528) = v25;

              double v24 = *(void **)(*(void *)(a1 + 48) + 528);
            }
            [v24 addObject:v22];
          }

          id v16 = 0;
          uint64_t v18 = 0;
          id v17 = v22;
          if (!v22) {
            goto LABEL_99;
          }
LABEL_98:
          [*(id *)(*(void *)(a1 + 48) + 584) setObject:v17 forKey:v13];
          goto LABEL_99;
        }
        if (v14 == 80)
        {
          uint64_t v19 = [*(id *)(a1 + 32) addLabelViewWithOrdinalElement:v13 width:*(void *)(a1 + 40) context:v10];
LABEL_75:
          id v17 = (id)v19;
LABEL_97:
          id v22 = 0;
          id v16 = 0;
          uint64_t v18 = 0;
          if (!v17) {
            goto LABEL_99;
          }
          goto LABEL_98;
        }
        id v17 = 0;
        uint64_t v18 = 0;
        if (v14 != 90) {
          goto LABEL_115;
        }
        id v17 = [*(id *)(a1 + 48) _previewProgressIndicator];
        [v17 setEnabled:0];
        [*(id *)(a1 + 32) addView:v17];
        id v22 = 0;
        id v16 = 0;
        uint64_t v18 = 0;
        *(void *)(*(void *)(a1 + 48) + 552) = 2;
        if (v17) {
          goto LABEL_98;
        }
LABEL_99:
        if (v18)
        {
          double v51 = [v13 buyButtonDescriptor];
          if (v51)
          {
            uint64_t v52 = *(void **)(*(void *)(a1 + 48) + 440);
            if (!v52)
            {
              uint64_t v53 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:517 capacity:1];
              uint64_t v54 = *(void *)(a1 + 48);
              v55 = *(void **)(v54 + 440);
              *(void *)(v54 + 440) = v53;

              uint64_t v52 = *(void **)(*(void *)(a1 + 48) + 440);
            }
            [v52 setObject:v18 forKey:v51];
          }
        }
        if (v16)
        {
          v56 = [*(id *)(a1 + 40) imageResourceCacheKeyForViewElement:v13];
          if (v56)
          {
            id v57 = *(void **)(*(void *)(a1 + 48) + 480);
            if (!v57)
            {
              uint64_t v58 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:5 valueOptions:0 capacity:1];
              uint64_t v59 = *(void *)(a1 + 48);
              v60 = *(void **)(v59 + 480);
              *(void *)(v59 + 480) = v58;

              id v57 = *(void **)(*(void *)(a1 + 48) + 480);
            }
            [v57 setObject:v16 forKey:v56];
          }
        }
        if (v22)
        {
          v61 = *(void **)(*(void *)(a1 + 48) + 424);
          if (!v61)
          {
            uint64_t v62 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:1];
            uint64_t v63 = *(void *)(a1 + 48);
            v64 = *(void **)(v63 + 424);
            *(void *)(v63 + 424) = v62;

            v61 = *(void **)(*(void *)(a1 + 48) + 424);
          }
          [v61 addObject:v22];
        }
LABEL_115:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
    }
    while (v9);
  }
}

uint64_t __64__SUUIHorizontalLockupView_reloadWithViewElement_width_context___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isDynamicContainer];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    [(SUUIHorizontalLockupView *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  cacheKeyToImageView = self->_cacheKeyToImageView;
  id v12 = [v9 cacheKey];
  id v13 = [(NSMapTable *)cacheKeyToImageView objectForKey:v12];

  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v13 imageView];
      [(NSHashTable *)v14 setImage:v8];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [v13 setImage:v8];
        goto LABEL_16;
      }
      uint64_t v14 = [v9 cacheKey];
      [v13 setImage:v8 cacheKey:v14 context:v10];
    }
LABEL_15:

LABEL_16:
    BOOL v19 = 1;
    goto LABEL_17;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_artworkRelatedChildViewElementViews;
  uint64_t v15 = [(NSHashTable *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
LABEL_6:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v22 != v17) {
        objc_enumerationMutation(v14);
      }
      if (objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "setImage:forArtworkRequest:context:", v8, v9, v10, (void)v21))goto LABEL_15; {
      if (v16 == ++v18)
      }
      {
        uint64_t v16 = [(NSHashTable *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v16) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (void)setContainerBackgroundImageForPlayButton:(id)a3
{
  playButton = self->_playButton;
  if (playButton)
  {
    LODWORD(v3) = 15.0;
    LODWORD(v4) = 15.0;
    [(SUUIPlayButtonControl *)playButton setBackgroundImageForBlurring:a3 withOffsetRight:v3 withOffsetBottom:v4];
  }
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v24 = [v9 clientContext];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = self->_buyButtonDescriptorToButton;
  uint64_t v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v15 canPersonalizeUsingItemState:v8])
        {
          long long v22 = [(NSMapTable *)self->_buyButtonDescriptorToButton objectForKey:v15];
          long long v21 = (void *)v24;
          [v22 setValuesUsingBuyButtonDescriptor:v15 itemState:v8 clientContext:v24 animated:v5];

LABEL_20:
          [(SUUIHorizontalLockupView *)self setNeedsLayout];
          BOOL v20 = 1;
          goto LABEL_21;
        }
      }
      uint64_t v12 = [(NSMapTable *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = self->_offerViews;
  uint64_t v16 = [(NSMapTable *)v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v25 + 1) + 8 * j) updateWithItemState:v8 context:v9 animated:v5])
        {
          long long v21 = (void *)v24;
          goto LABEL_20;
        }
      }
      uint64_t v17 = [(NSMapTable *)v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  BOOL v20 = 0;
  long long v21 = (void *)v24;
LABEL_21:

  return v20;
}

- (id)viewForElementIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = self->_viewElementViews;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "itmlID", (void)v15);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          uint64_t v13 = [(NSMapTable *)self->_viewElementViews objectForKey:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_11:

  return v13;
}

- (void)layoutSubviews
{
  v62.receiver = self;
  v62.super_class = (Class)SUUIHorizontalLockupView;
  [(SUUIHorizontalLockupView *)&v62 layoutSubviews];
  if (([(SUUIGradientView *)self->_offerConfirmationGradientView isDescendantOfView:self] & 1) == 0)
  {
    [(SUUIHorizontalLockupView *)self bounds];
    uint64_t v4 = v3;
    uint64_t v6 = v5;
    double v8 = v7;
    uint64_t v10 = v9;
    uint64_t v11 = [(SUUILockupViewElement *)self->_lockupElement style];
    uint64_t v12 = [v11 elementPosition];

    if (!v12) {
      uint64_t v12 = 2 * ([(SUUILockupViewElement *)self->_lockupElement lockupViewType] == 6);
    }
    uint64_t v34 = v12;
    v33 = [(SUUIHorizontalLockupView *)self _previewFrontView];
    uint64_t v13 = [(SUUIHorizontalLockupLayout *)self->_layout columns];
    uint64_t v14 = [v13 count];
    long long v15 = (char *)malloc_type_malloc(16 * v14, 0x1000040451B5BE8uLL);
    v61[0] = 0;
    v61[1] = v61;
    double left = self->_contentInset.left;
    double v17 = v8 - left - self->_contentInset.right;
    v61[2] = 0x2020000000;
    *(double *)&v61[3] = v17;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    char v60 = 0;
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x2020000000;
    uint64_t v58 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v51 = 0;
    uint64_t v52 = (double *)&v51;
    uint64_t v53 = 0x2020000000;
    double v54 = v17;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x4010000000;
    v48[3] = "";
    long long v18 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    long long v49 = *MEMORY[0x263F001A8];
    long long v50 = v18;
    BOOL v19 = [(SUUIHorizontalLockupLayout *)self->_layout columns];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __42__SUUIHorizontalLockupView_layoutSubviews__block_invoke;
    v47[3] = &unk_265405C10;
    v47[9] = v4;
    v47[10] = v6;
    *(double *)&v47[11] = v8;
    v47[12] = v10;
    v47[4] = self;
    v47[5] = &v55;
    v47[6] = v61;
    v47[7] = &v51;
    v47[13] = v15;
    v47[14] = v14;
    v47[8] = v48;
    [v19 enumerateObjectsUsingBlock:v47];

    uint64_t v20 = v13;
    if (v56[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v21 = objc_msgSend(v13, "objectAtIndex:");
      [(SUUIHorizontalLockupView *)self _sizeViewsForColumn:v21 toFitWidth:v52[3]];
      uint64_t v23 = v22;

      uint64_t v24 = &v15[16 * v56[3]];
      *(double *)uint64_t v24 = v52[3];
      *((void *)v24 + 1) = v23;
    }
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    *(double *)&v46[3] = left;
    long long v25 = [(SUUIHorizontalLockupLayout *)self->_layout columns];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __42__SUUIHorizontalLockupView_layoutSubviews__block_invoke_2;
    v35[3] = &unk_265405C60;
    uint64_t v40 = v15;
    uint64_t v41 = v34;
    v35[4] = self;
    uint64_t v37 = v48;
    unint64_t v38 = v46;
    uint64_t v42 = v4;
    uint64_t v43 = v6;
    double v44 = v8;
    uint64_t v45 = v10;
    id v39 = v59;
    id v26 = v33;
    id v36 = v26;
    [v25 enumerateObjectsUsingBlock:v35];

    free(v15);
    if (self->_metadataBackgroundView)
    {
      [(SUUIHorizontalLockupView *)self bounds];
      -[UIView setFrame:](self->_metadataBackgroundView, "setFrame:", v27 + self->_contentInset.left, v28 + self->_contentInset.top, v29 - (self->_contentInset.left + self->_contentInset.right), v30 - (self->_contentInset.top + self->_contentInset.bottom));
      long long v31 = [(UIView *)self->_metadataBackgroundView subviews];
      long long v32 = [v31 firstObject];
      [(UIView *)self->_metadataBackgroundView bounds];
      objc_msgSend(v32, "setFrame:");

      [(SUUIHorizontalLockupView *)self sendSubviewToBack:self->_metadataBackgroundView];
    }

    _Block_object_dispose(v46, 8);
    _Block_object_dispose(v48, 8);
    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(v59, 8);
    _Block_object_dispose(v61, 8);
  }
}

void __42__SUUIHorizontalLockupView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v17 = a2;
  uint64_t v5 = [v17 identifier];
  uint64_t v6 = v5;
  if (v5 == 3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    double v7 = v17;
    goto LABEL_11;
  }
  double v8 = (double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if ((unint64_t)(v5 - 5) < 2) {
    double v8 = (double *)(a1 + 88);
  }
  [*(id *)(a1 + 32) _sizeViewsForColumn:v17 toFitWidth:*v8];
  double v11 = v9;
  uint64_t v12 = v10;
  if (v6 == 4)
  {
    [v17 size];
    if (v11 < v13) {
      double v11 = v13;
    }
    uint64_t v14 = *(void *)(a1 + 104) + 16 * a3;
    *(double *)uint64_t v14 = v11;
    *(void *)(v14 + 8) = v12;
    double v7 = v17;
  }
  else
  {
    long long v15 = (double *)(*(void *)(a1 + 104) + 16 * a3);
    *long long v15 = v9;
    *((void *)v15 + 1) = v10;
    double v7 = v17;
    if ((unint64_t)(v6 - 7) > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_11;
    }
  }
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24)
                                                              - v11;
LABEL_11:
  if (*(void *)(a1 + 112) - 1 > a3)
  {
    [*(id *)(*(void *)(a1 + 32) + 496) columnSpacingForColumnIdentifier:v6];
    double v7 = v17;
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24)
                                                                - v16;
  }
  if (v6 == 6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = *(void *)(*(void *)(a1 + 32) + 456);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = *(void *)(*(void *)(a1 + 32) + 448);
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 48) = *(double *)(a1 + 88)
                                                                - (*(double *)(*(void *)(a1 + 32) + 456)
                                                                 + *(double *)(*(void *)(a1 + 32) + 472));
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 56) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 48);
  }
}

void __42__SUUIHorizontalLockupView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = (double *)(*(void *)(a1 + 72) + 16 * a3);
  double v7 = *v6;
  double v8 = v6[1];
  uint64_t v9 = [v5 identifier];
  uint64_t v10 = v9;
  uint64_t v46 = 0;
  id v47 = (double *)&v46;
  uint64_t v48 = 0x2020000000;
  double v49 = 0.0;
  uint64_t v11 = *(void *)(a1 + 80);
  if (v11 == 3)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    double v49 = *(double *)(a1 + 112) - *(double *)(v16 + 464) - v8;
    if (v9 != 3) {
      goto LABEL_11;
    }
    [*(id *)(v16 + 496) metadataColumnEdgeInsets];
    id v17 = v47;
    double v19 = v47[3] - v18;
LABEL_8:
    v17[3] = v19;
    goto LABEL_11;
  }
  if (v11 != 2)
  {
    double v20 = *(double *)(*(void *)(a1 + 32) + 448);
    UIRoundToViewScale();
    double v22 = v20 + v21;
    id v17 = v47;
    v47[3] = v22;
    double v19 = v22 + *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56);
    goto LABEL_8;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  double v13 = *(double *)(v12 + 448);
  double v49 = v13;
  if (v9 == 3)
  {
    [*(id *)(v12 + 496) metadataColumnEdgeInsets];
    uint64_t v14 = v47 + 3;
    double v13 = v15 + v47[3];
    v47[3] = v13;
  }
  else
  {
    uint64_t v14 = &v49;
  }
  *uint64_t v14 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56) + v13;
LABEL_11:
  uint64_t v23 = [v5 childViewElements];
  uint64_t v24 = [v23 count];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __42__SUUIHorizontalLockupView_layoutSubviews__block_invoke_3;
  v33[3] = &unk_265405C38;
  uint64_t v25 = *(void *)(a1 + 32);
  uint64_t v40 = v10;
  uint64_t v26 = *(void *)(a1 + 56);
  v33[4] = v25;
  uint64_t v36 = v26;
  double v41 = v7;
  double v42 = v8;
  id v27 = v23;
  uint64_t v28 = *(void *)(a1 + 64);
  id v34 = v27;
  long long v29 = *(_OWORD *)(a1 + 104);
  long long v43 = *(_OWORD *)(a1 + 88);
  long long v44 = v29;
  long long v31 = *(void **)(a1 + 40);
  uint64_t v30 = *(void *)(a1 + 48);
  uint64_t v37 = v28;
  uint64_t v38 = v30;
  id v39 = &v46;
  uint64_t v45 = v24;
  id v35 = v31;
  [v27 enumerateObjectsUsingBlock:v33];
  [*(id *)(*(void *)(a1 + 32) + 496) columnSpacingForColumnIdentifier:v10];
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7
                                                              + v32
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);

  _Block_object_dispose(&v46, 8);
}

void __42__SUUIHorizontalLockupView_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  id v77 = a2;
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 584), "objectForKey:");
  [v5 frame];
  double v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  CGFloat v13 = v12;
  switch(*(void *)(a1 + 88))
  {
    case 0:
      double v19 = [*(id *)(*(void *)(a1 + 32) + 496) columns];
      unint64_t v20 = [v19 count];

      double v7 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v20 > 1) {
        goto LABEL_19;
      }
      [*(id *)(a1 + 32) bounds];
      CGRectGetWidth(v79);
      goto LABEL_13;
    case 1:
    case 2:
      uint64_t v14 = [v77 style];
      uint64_t v15 = [v14 elementPosition];

      if (v15 == 7 || v15 == 1)
      {
        uint64_t v16 = [v77 style];
        [v16 elementPadding];
        double v18 = v17;
      }
      else
      {
        double v18 = *(double *)(MEMORY[0x263F834E8] + 24);
      }
      double v7 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + *(double *)(a1 + 96) - v11 - v18;
      goto LABEL_19;
    case 3:
      double v21 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      [*(id *)(*(void *)(a1 + 32) + 496) metadataColumnEdgeInsets];
      double v7 = v21 + v22;
      if (!a3) {
        goto LABEL_21;
      }
      uint64_t v23 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3 - 1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 584) objectForKey:v23];
        [v24 frame];
        double v7 = v7 + CGRectGetWidth(v80) + 5.0;
        [v24 frame];
        CGFloat v25 = CGRectGetWidth(v81) + 5.0;
        v82.origin.x = v7;
        v82.origin.y = v9;
        v82.size.width = v11;
        v82.size.height = v13;
        double v26 = v25 + CGRectGetWidth(v82);
        double v27 = *(double *)(a1 + 96);
        double v28 = v26 - v27;
        BOOL v29 = v26 <= v27;
        double v30 = 0.0;
        if (!v29) {
          double v30 = v28;
        }
        double v11 = v11 - v30;
      }
      goto LABEL_20;
    case 4:
LABEL_13:
      UIRoundToViewScale();
      double v7 = v31;
      goto LABEL_19;
    case 5:
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        goto LABEL_57;
      }
      double v7 = *(double *)(*(void *)(a1 + 32) + 456);
LABEL_19:
      if (a3)
      {
LABEL_20:
        [*(id *)(*(void *)(a1 + 32) + 496) topPaddingForViewElement:v77];
        int v33 = 0;
        *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v34
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                                + 24);
      }
      else
      {
LABEL_21:
        int v33 = 1;
      }
      if (*(void *)(a1 + 88) != 3 || *(void *)(a1 + 144) - 1 != a3) {
        goto LABEL_33;
      }
      id v35 = [v77 style];
      uint64_t v36 = [v35 elementPosition];

      if ([*(id *)(*(void *)(a1 + 32) + 504) lockupViewType] != 6 || v36 != 0)
      {
        if (v36 != 3) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      uint64_t v38 = [v77 elementName];
      char v39 = [v38 isEqualToString:@"description"];

      if (a3 > 2 || (v39 & 1) != 0)
      {
LABEL_32:
        uint64_t v40 = *(void *)(a1 + 32);
        double v41 = *(double *)(a1 + 136) - *(double *)(v40 + 464);
        [*(id *)(v40 + 496) metadataColumnEdgeInsets];
        double v43 = v41 - v42;
        v83.origin.x = v7;
        v83.origin.y = v9;
        v83.size.width = v11;
        v83.size.height = v13;
        *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v43 - CGRectGetHeight(v83);
      }
LABEL_33:
      long long v44 = [v77 style];
      unint64_t v45 = [v44 elementPosition];

      uint64_t v46 = *(void *)(a1 + 88);
      if (v46 == 1 && v45)
      {
        if (*(void *)(a1 + 144) == 1)
        {
          UIRoundToViewScale();
          double v48 = v47;
          goto LABEL_47;
        }
      }
      else if (v46 != 1)
      {
        goto LABEL_46;
      }
      if (v45 > 9) {
        goto LABEL_46;
      }
      if (((1 << v45) & 0xC4) != 0)
      {
        if (!v33) {
          goto LABEL_46;
        }
        double v54 = [v77 style];
        [v54 elementPadding];
        double v56 = v55;

        double v53 = v56 + CGRectGetMinY(*(CGRect *)(a1 + 112)) + *(double *)(*(void *)(a1 + 32) + 448);
        goto LABEL_45;
      }
      if (((1 << v45) & 0x308) != 0 && a3 + 1 == *(void *)(a1 + 144))
      {
        double v49 = [v77 style];
        [v49 elementPadding];
        double v51 = v50;

        CGFloat v52 = CGRectGetMaxY(*(CGRect *)(a1 + 112)) - *(double *)(*(void *)(a1 + 32) + 464);
        v84.origin.x = v7;
        v84.origin.y = v9;
        v84.size.width = v11;
        v84.size.height = v13;
        double v53 = v52 - CGRectGetHeight(v84) - v51;
LABEL_45:
        *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v53;
      }
LABEL_46:
      double v48 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
LABEL_47:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v45 == 7)
      {
        v85.origin.x = v7;
        v85.origin.y = v48;
        v85.size.width = v11;
        v85.size.height = v13;
        float v57 = CGRectGetHeight(v85) * 0.5;
        double v48 = (float)-floorf(v57);
        uint64_t v58 = [v77 style];
        [v58 elementPadding];
        double v60 = v59;

        double v61 = *(double *)(a1 + 128);
        v86.origin.x = v7;
        v86.origin.y = v48;
        v86.size.width = v11;
        v86.size.height = v13;
        float v62 = v60 + CGRectGetWidth(v86);
        double v7 = v61 - floorf(v62);
      }
      objc_msgSend(v5, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v7, v48, v11, v13, *(CGFloat *)(a1 + 112), *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136)));
      if (*(void *)(a1 + 88) != 3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v87.origin.x = v7;
        v87.origin.y = v48;
        v87.size.width = v11;
        v87.size.height = v13;
        double MaxY = CGRectGetMaxY(v87);
        [*(id *)(*(void *)(a1 + 32) + 496) bottomPaddingForViewElement:v77];
        *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = MaxY + v64;
      }
      if (objc_opt_respondsToSelector())
      {
        v88.origin.x = v7;
        v88.origin.y = v48;
        v88.size.width = v11;
        v88.size.height = v13;
        double v65 = -CGRectGetMinY(v88);
        v89.origin.x = v7;
        v89.origin.y = v48;
        v89.size.width = v11;
        v89.size.height = v13;
        CGFloat Width = CGRectGetWidth(v89);
        double v67 = 0.0;
        if (Width < 44.0)
        {
          v90.origin.x = v7;
          v90.origin.y = v48;
          v90.size.width = v11;
          v90.size.height = v13;
          double v67 = (CGRectGetWidth(v90) + -44.0) * 0.5;
        }
        objc_msgSend(v5, "setHitRectInsets:", v65, v67, v65, v67);
      }
LABEL_57:
      if (v5 == *(void **)(a1 + 48))
      {
        uint64_t v68 = *(void *)(a1 + 32);
        uint64_t v69 = *(void *)(v68 + 544);
        if (v69)
        {
          [*(id *)(v68 + 544) frame];
          CGFloat v71 = v70;
          CGFloat v73 = v72;
          UIRoundToViewScale();
          CGFloat v75 = v74;
          UIRoundToViewScale();
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 544), "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v75, v76, v71, v73, *(CGFloat *)(a1 + 112), *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136)));
        }
        [v5 setHidden:v69 != 0];
      }

      return;
    case 6:
      double v32 = *(CGFloat **)(*(void *)(a1 + 72) + 8);
      objc_msgSend(v5, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v32[4], v32[5], v32[6], v32[7], *(CGFloat *)(a1 + 112), *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136)));
      goto LABEL_57;
    default:
      goto LABEL_19;
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)SUUIHorizontalLockupView;
  -[SUUIHorizontalLockupView setSemanticContentAttribute:](&v14, sel_setSemanticContentAttribute_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(SUUIHorizontalLockupView *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setSemanticContentAttribute:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if ([(SUUILockupViewElement *)self->_lockupElement lockupViewType] == 5 || self->_useClearBackground)
  {
    id v5 = [MEMORY[0x263F825C8] clearColor];
    v10.receiver = self;
    v10.super_class = (Class)SUUIHorizontalLockupView;
    [(SUUIViewReuseView *)&v10 setBackgroundColor:v5];
LABEL_4:

    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUIHorizontalLockupView;
  [(SUUIViewReuseView *)&v9 setBackgroundColor:v4];
  playButton = self->_playButton;
  if (playButton && [(SUUIPlayButtonControl *)playButton backgroundType] == 2)
  {
    id v5 = +[SUUIPlayButtonControl blurColorForColor:v4];
    if (v5) {
      [(SUUIPlayButtonControl *)self->_playButton setControlColor:v5];
    }
    goto LABEL_4;
  }
LABEL_5:
  if (self->_badge)
  {
    uint64_t v6 = -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:");
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x263F825C8] clearColor];
      [v6 setBackgroundColor:v7];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v9 = 0;
  objc_super v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  long long v12 = "";
  CGFloat width = a3.width;
  uint64_t v14 = 0;
  uint64_t v3 = [(SUUIHorizontalLockupLayout *)self->_layout columns];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__SUUIHorizontalLockupView_sizeThatFits___block_invoke;
  v8[3] = &unk_265405C88;
  v8[4] = &v9;
  [v3 enumerateObjectsUsingBlock:v8];

  double v4 = v10[4];
  double v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  double v7 = v5;
  result.height = v7;
  result.CGFloat width = v6;
  return result;
}

uint64_t __41__SUUIHorizontalLockupView_sizeThatFits___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t result = [a2 size];
  if (v3 >= v5) {
    double v6 = v3;
  }
  else {
    double v6 = v5;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v6;
  return result;
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
  -[SUUIHorizontalLockupView _animateButton:](self, "_animateButton:");
  if ([(SUUIHorizontalLockupView *)self updateLayoutOnButtonConfirmation]) {
    [(SUUIHorizontalLockupView *)self _resizeMetadataRelativeToItemOfferView:v4];
  }
  else {
    -[SUUIHorizontalLockupView _layoutConfirmationGradientRelativeToItemOfferView:alpha:](self, "_layoutConfirmationGradientRelativeToItemOfferView:alpha:", v4, (double)[v4 isShowingConfirmation]);
  }
}

- (void)offerViewDidAnimateTransition:(id)a3
{
  if (([a3 isShowingConfirmation] & 1) == 0)
  {
    [(SUUIGradientView *)self->_offerConfirmationGradientView removeFromSuperview];
    offerConfirmationGradientView = self->_offerConfirmationGradientView;
    self->_offerConfirmationGradientView = 0;
  }
}

- (BOOL)offerViewAnimateTransition:(id)a3
{
  if (self->_offerConfirmationGradientView)
  {
    id v4 = a3;
    [v4 frame];
    double x = v15.origin.x;
    double y = v15.origin.y;
    double MaxX = CGRectGetMaxX(v15);
    objc_msgSend(v4, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    double v9 = v8;
    double v11 = v10;
    int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
    double v13 = MaxX - v9;
    if (ShouldReverseLayoutDirection) {
      double v13 = x;
    }
    objc_msgSend(v4, "setFrame:", v13, y, v9, v11);
    [(SUUIHorizontalLockupView *)self _layoutConfirmationGradientRelativeToItemOfferView:v4 alpha:1.0];
  }
  return 0;
}

- (void)offerViewWillAnimateTransition:(id)a3
{
  id v4 = a3;
  if (![(SUUIHorizontalLockupView *)self updateLayoutOnButtonConfirmation]
    && ![v4 metadataPosition])
  {
    [(SUUIHorizontalLockupView *)self _addConfirmationGradientForView:v4];
  }
}

- (void)mediaPlayer:(id)a3 itemStateChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  playButton = self->_playButton;
  if (playButton)
  {
    double v9 = [(SUUIPlayButton *)playButton playItemIdentifier];
    BOOL v10 = +[SUUIMediaPlayerInterface identifierMatches:v9 item:v7];

    if (v10)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__SUUIHorizontalLockupView_mediaPlayer_itemStateChanged___block_invoke;
      block[3] = &unk_265400890;
      block[4] = self;
      id v17 = v7;
      dispatch_async(MEMORY[0x263EF83A0], block);
      double v11 = v17;
LABEL_7:

      goto LABEL_8;
    }
    if ([(SUUIPlayButtonControl *)self->_playButton isIndeterminate]
      || [(SUUIPlayButtonControl *)self->_playButton showingProgress])
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __57__SUUIHorizontalLockupView_mediaPlayer_itemStateChanged___block_invoke_2;
      v13[3] = &unk_265400890;
      id v14 = v7;
      CGRect v15 = self;
      dispatch_async(MEMORY[0x263EF83A0], v13);
      double v11 = v14;
      goto LABEL_7;
    }
    if ([(SUUIPlayButton *)self->_playButton showOnDemand])
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __57__SUUIHorizontalLockupView_mediaPlayer_itemStateChanged___block_invoke_3;
      v12[3] = &unk_265400980;
      v12[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], v12);
    }
  }
LABEL_8:
}

uint64_t __57__SUUIHorizontalLockupView_mediaPlayer_itemStateChanged___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 536) showOnDemand]) {
    [*(id *)(*(void *)(a1 + 32) + 536) setHidden:0];
  }
  uint64_t v2 = [*(id *)(a1 + 40) playState];
  double v3 = *(void **)(*(void *)(a1 + 32) + 536);
  if ((unint64_t)(v2 - 6) > 0xFFFFFFFFFFFFFFFDLL)
  {
    return [v3 hideProgressAnimated:1];
  }
  else
  {
    [v3 reloadWithItemStatus:*(void *)(a1 + 40) animated:0];
    id v4 = *(void **)(*(void *)(a1 + 32) + 536);
    return [v4 showPlayIndicator:v2 == 3];
  }
}

uint64_t __57__SUUIHorizontalLockupView_mediaPlayer_itemStateChanged___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) playState];
  if (result != 5)
  {
    [*(id *)(*(void *)(a1 + 40) + 536) hideProgressAnimated:0];
    uint64_t result = [*(id *)(*(void *)(a1 + 40) + 536) showOnDemand];
    if (result)
    {
      double v3 = *(void **)(*(void *)(a1 + 40) + 536);
      return [v3 setHidden:1];
    }
  }
  return result;
}

uint64_t __57__SUUIHorizontalLockupView_mediaPlayer_itemStateChanged___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 536) setHidden:1];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  CGRect v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  [v7 locationInView:self];
  tappableViews = self->_tappableViews;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__SUUIHorizontalLockupView_gestureRecognizer_shouldReceiveTouch___block_invoke;
  v13[3] = &unk_265405CB0;
  void v13[4] = &v14;
  v13[5] = v9;
  v13[6] = v10;
  [(NSMutableArray *)tappableViews enumerateObjectsUsingBlock:v13];
  if ([(SUUILockupViewElement *)self->_lockupElement isSelectable])
  {
    BOOL v11 = 1;
    *((unsigned char *)v15 + 24) = 1;
  }
  else
  {
    BOOL v11 = *((unsigned char *)v15 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);

  return v11;
}

BOOL __65__SUUIHorizontalLockupView_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 frame];
  BOOL result = CGRectContainsPoint(v7, *(CGPoint *)(a1 + 40));
  *a4 = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_buttonAction:(id)a3
{
  v20[3] = *MEMORY[0x263EF8340];
  id v4 = (SUUIPlayButton *)a3;
  uint64_t v5 = [(SUUIHorizontalLockupView *)self _viewElementForView:v4];
  id v6 = (void *)v5;
  if (self->_playButton == v4)
  {
    [(SUUIHorizontalLockupView *)self _handlePlayButtonTap:v4 element:v5];
  }
  else if (v5)
  {
    CGRect v7 = SUUICollectionViewCellForView(self);
    double v8 = SUUICollectionViewForView(v7);
    uint64_t v9 = [v8 delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      double v18 = [v8 indexPathForCell:v7];
      [v9 collectionView:v8 didConfirmButtonElement:v6 withClickInfo:0 forItemAtIndexPath:v18];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = v4;
        BOOL v11 = (void *)MEMORY[0x263EFF9A0];
        v19[0] = @"toggled";
        long long v12 = objc_msgSend(NSNumber, "numberWithBool:", -[SUUIPlayButton isToggled](v10, "isToggled"));
        v20[0] = v12;
        v20[1] = v6;
        v19[1] = @"target";
        v19[2] = @"count";
        double v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[SUUIPlayButton count](v10, "count"));
        v20[2] = v13;
        uint64_t v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
        CGRect v15 = [v11 dictionaryWithDictionary:v14];

        uint64_t v16 = [(SUUIPlayButton *)v10 toggleItemIdentifier];

        if (v16)
        {
          char v17 = [(SUUIPlayButton *)v10 toggleItemIdentifier];
          [v15 setObject:v17 forKey:@"toggleId"];
        }
      }
      else
      {
        CGRect v15 = 0;
      }
      [v6 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:v15 completionBlock:0];
    }
  }
}

- (void)_cancelConfirmationAction:(id)a3
{
  id v4 = a3;
  [(SUUIHorizontalLockupView *)self bringSubviewToFront:v4];
  [v4 setShowingConfirmation:0 animated:1];
}

- (void)_previewIndicatorAction:(id)a3
{
}

- (void)_showConfirmationAction:(id)a3
{
  id v4 = a3;
  [(SUUIHorizontalLockupView *)self _addConfirmationGradientForView:v4];
  [v4 setShowingConfirmation:1 animated:1];
}

- (void)_tapGestureAction:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__48;
  tappableViews = self->_tappableViews;
  CGRect v15 = __Block_byref_object_dispose__48;
  id v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__SUUIHorizontalLockupView__tapGestureAction___block_invoke;
  v10[3] = &unk_265405CB0;
  v10[5] = v6;
  v10[6] = v7;
  v10[4] = &v11;
  [(NSMutableArray *)tappableViews enumerateObjectsUsingBlock:v10];
  if (v12[5])
  {
    double v8 = -[SUUIHorizontalLockupView _viewElementForView:](self, "_viewElementForView:");
    uint64_t v9 = [v8 elementType];
    if (v9 > 49)
    {
      if (v9 != 50)
      {
        if (v9 == 138) {
          [(SUUIHorizontalLockupView *)self _expandEditorialForLabel:v8];
        }
        goto LABEL_14;
      }
    }
    else if (v9 != 12)
    {
      if (v9 == 49) {
        [(SUUIHorizontalLockupView *)self _performDefaultActionForImage:v8];
      }
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUUIHorizontalLockupView *)self _handlePlayButtonTap:v12[5] element:v8];
    }
    else {
      [v8 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
    }
LABEL_14:

    goto LABEL_15;
  }
  if ([(SUUILockupViewElement *)self->_lockupElement isSelectable]) {
    [(SUUILockupViewElement *)self->_lockupElement dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
LABEL_15:
  _Block_object_dispose(&v11, 8);
}

void __46__SUUIHorizontalLockupView__tapGestureAction___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v19 = a2;
  [v19 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (objc_opt_respondsToSelector())
  {
    [v19 bigHitInsets];
    double v8 = v8 + v15;
    double v10 = v10 + v16;
    double v12 = v12 - (v15 + v17);
    double v14 = v14 - (v16 + v18);
  }
  v21.origin.double x = v8;
  v21.origin.double y = v10;
  v21.size.CGFloat width = v12;
  v21.size.height = v14;
  if (CGRectContainsPoint(v21, *(CGPoint *)(a1 + 40)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_audioPlayerStatusChangeNotification:(id)a3
{
  id v13 = a3;
  id v4 = [(SUUIHorizontalLockupView *)self _previewMediaURL];
  uint64_t v5 = [v13 object];
  uint64_t v6 = [v5 URL];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    double v8 = [v5 playerStatus];
    uint64_t v9 = [v8 playerState];

    if ((unint64_t)(v9 - 6) > 0xFFFFFFFFFFFFFFFDLL)
    {
      double v10 = [MEMORY[0x263F08A00] defaultCenter];
      double v11 = [v13 name];
      double v12 = [v13 object];
      [v10 removeObserver:self name:v11 object:v12];

      [(SUUIHorizontalLockupView *)self hidePreviewProgressAnimated:1];
    }
    else
    {
      double v10 = [v5 playerStatus];
      [(SUUIHorizontalLockupView *)self showPreviewProgressWithStatus:v10 animated:1];
    }
  }
}

- (void)_animateButton:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  CGRect v21 = (CGRect *)&v20;
  uint64_t v22 = 0x4010000000;
  uint64_t v23 = "";
  long long v24 = 0u;
  long long v25 = 0u;
  [v4 frame];
  *(void *)&long long v24 = v5;
  *((void *)&v24 + 1) = v6;
  *(void *)&long long v25 = v7;
  *((void *)&v25 + 1) = v8;
  CGFloat MaxX = CGRectGetMaxX(v21[1]);
  objc_msgSend(v4, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  double v10 = v21;
  v21[1].size.CGFloat width = v11;
  v10[1].size.height = v12;
  id v13 = [(SUUIHorizontalLockupView *)self _viewElementForView:v4];
  double v14 = [(SUUIHorizontalLockupLayout *)self->_layout columns];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __43__SUUIHorizontalLockupView__animateButton___block_invoke;
  v16[3] = &unk_265405CD8;
  id v15 = v13;
  id v17 = v15;
  double v18 = &v20;
  CGFloat v19 = MaxX;
  [v14 enumerateObjectsUsingBlock:v16];

  objc_msgSend(v4, "setFrame:", v21[1].origin.x, v21[1].origin.y, v21[1].size.width, v21[1].size.height);
  _Block_object_dispose(&v20, 8);
}

void __43__SUUIHorizontalLockupView__animateButton___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v6 = [v9 childViewElements];
  int v7 = [v6 containsObject:*(void *)(a1 + 32)];

  uint64_t v8 = v9;
  if (v7)
  {
    if ([v9 identifier] == 1) {
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *(double *)(a1 + 48)
    }
                                                                  - *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 48);
    *a4 = 1;
    uint64_t v8 = v9;
  }
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = +[SUUIHorizontalLockupLayout fontForButtonViewElement:v5 context:v6];
  uint64_t v8 = [v5 buttonTitleStyle];
  id v9 = v8;
  if (!v8)
  {
    id v9 = [v5 style];
  }
  double v10 = [v6 tintColor];
  CGFloat v11 = SUUIViewElementPlainColorWithStyle(v9, v10);

  if (!v8) {
  if (!v11)
  }
  {
    BOOL v12 = [v6 containerViewElementType] == 118;
    CGFloat v11 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:dbl_2568A12C0[v12]];
  }
  id v13 = [v5 buttonText];
  double v14 = [v5 style];
  id v15 = [v13 attributedStringWithDefaultFont:v7 foregroundColor:v11 style:v14];

  return v15;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = +[SUUIHorizontalLockupLayout fontForLabelViewElement:v5 context:v6];
  uint64_t v8 = [v5 style];
  id v9 = [v6 tintColor];
  double v10 = SUUIViewElementPlainColorWithStyle(v8, v9);

  if (!v10)
  {
    CGFloat v11 = [v6 aggregateValueForKey:@"SUUIPreviewOverlayBackgroundStyleKey"];
    BOOL v12 = v11;
    if (v11) {
      BOOL v13 = [v11 integerValue] == 0;
    }
    else {
      BOOL v13 = 1;
    }
    unint64_t v14 = [v5 labelViewStyle];
    if (v14 > 5)
    {
      double v10 = 0;
LABEL_19:

      goto LABEL_20;
    }
    if (((1 << v14) & 0x1B) == 0)
    {
      if (v13) {
        [MEMORY[0x263F825C8] blackColor];
      }
      else {
      uint64_t v17 = [MEMORY[0x263F825C8] whiteColor];
      }
      goto LABEL_18;
    }
    if ([v6 containerViewElementType] == 118)
    {
      double v15 = 0.8;
      if (v13)
      {
LABEL_9:
        double v16 = 0.0;
LABEL_15:
        uint64_t v17 = [MEMORY[0x263F825C8] colorWithWhite:v16 alpha:v15];
LABEL_18:
        double v10 = (void *)v17;
        goto LABEL_19;
      }
    }
    else
    {
      double v15 = 0.6;
      if (v13) {
        goto LABEL_9;
      }
    }
    double v16 = 1.0;
    goto LABEL_15;
  }
LABEL_20:
  double v18 = [v5 text];
  CGFloat v19 = [v5 style];
  uint64_t v20 = [v18 attributedStringWithDefaultFont:v7 foregroundColor:v10 style:v19];

  return v20;
}

+ (id)_attributedStringForOrdinal:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = +[SUUIHorizontalLockupLayout fontForOrdinalViewElement:v5 context:v6];
  uint64_t v8 = [v5 style];
  id v9 = [v6 tintColor];

  double v10 = SUUIViewElementPlainColorWithStyle(v8, v9);

  if (!v10)
  {
    double v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
  }
  CGFloat v11 = [v5 text];
  BOOL v12 = [v11 attributedStringWithDefaultFont:v7 foregroundColor:v10];

  return v12;
}

- (void)_handlePlayButtonTap:(id)a3 element:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  id v6 = +[SUUIMediaPlayerInterface sharedInstance];
  int v7 = [v11 playItemIdentifier];
  int v8 = [v6 isItemWithIdentifierActive:v7];

  if (v8)
  {
    id v9 = [v11 playItemIdentifier];
    [v6 togglePlayStateForItemWithIdentifier:v9];
  }
  else if (v5)
  {
    double v10 = [v11 playItemIdentifier];
    [v6 notifyWillChangeToItemWithItemIdentifer:v10];

    if (([v11 isIndeterminate] & 1) == 0) {
      [v11 beginIndeterminateAnimation];
    }
    [v5 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
}

+ (void)_requestLayoutForViewElements:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  double v10 = [v9 labelLayoutCache];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    id v23 = a1;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v17 = [v16 elementType];
        if (v17 > 79)
        {
          switch(v17)
          {
            case 135:
              double v18 = SUUIStarRatingViewElementView;
              goto LABEL_32;
            case 136:
            case 137:
            case 139:
            case 140:
            case 142:
            case 143:
              continue;
            case 138:
              id v20 = v16;
              uint64_t v21 = [v9 maxWidthForElement:v20 withDefaultWidth:(uint64_t)a4];
              if ([a1 _usesEditorialLayoutForLabelViewElement:v20])
              {
                uint64_t v22 = [v9 editorialLayoutForLabelElement:v20 width:(double)v21];
                [v22 enqueueLayoutRequests];
              }
              else
              {
                uint64_t v22 = [a1 _attributedStringForLabel:v20 context:v9];
                [v10 requestLayoutForLabel:v20 attributedString:v22 width:v21];
              }

              a1 = v23;
              continue;
            case 141:
              goto LABEL_24;
            case 144:
              double v18 = SUUITomatoRatingView;
              goto LABEL_32;
            default:
              if (v17 == 80)
              {
                CGFloat v19 = [a1 _attributedStringForOrdinal:v16 context:v9];
                [v10 requestLayoutForOrdinal:v16 attributedString:v19 width:(uint64_t)a4];
                goto LABEL_34;
              }
              if (v17 != 154) {
                continue;
              }
              double v18 = SUUIImageGridView;
              break;
          }
          goto LABEL_32;
        }
        if (v17 <= 48)
        {
          if (v17 == 8)
          {
            [v10 requestLayoutForBadge:v16 width:(uint64_t)a4];
            continue;
          }
          if (v17 != 12)
          {
            if (v17 != 48) {
              continue;
            }
            double v18 = SUUISectionHeaderView;
            goto LABEL_32;
          }
LABEL_24:
          CGFloat v19 = [a1 _attributedStringForButton:v16 context:v9];
          [v10 requestLayoutForButton:v16 attributedString:v19 width:(uint64_t)a4];
LABEL_34:
        }
        else
        {
          if (v17 > 61)
          {
            if (v17 == 62)
            {
              double v18 = SUUIHorizontalListView;
            }
            else
            {
              if (v17 != 77) {
                continue;
              }
              double v18 = SUUIOfferView;
            }
            goto LABEL_32;
          }
          if (v17 == 49)
          {
            +[SUUIAdornedImageView requestLayoutForViewElement:v16 width:v9 context:a4];
LABEL_29:
            double v18 = SUUIImageDeckView;
LABEL_32:
            [(__objc2_class *)v18 requestLayoutForViewElement:v16 width:v9 context:a4];
            continue;
          }
          if (v17 == 51) {
            goto LABEL_29;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }
}

+ (BOOL)_usesEditorialLayoutForLabelViewElement:(id)a3
{
  id v3 = a3;
  if ([v3 numberOfLines] == 1)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v3 moreButtonTitle];
    BOOL v4 = [v5 length] != 0;
  }
  return v4;
}

- (void)_addConfirmationGradientForView:(id)a3
{
  v27[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 superview];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__48;
  long long v25 = __Block_byref_object_dispose__48;
  id v26 = 0;
  id v6 = [(SUUIHorizontalLockupView *)self _columnForView:v4];
  int v7 = [v6 childViewElements];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__SUUIHorizontalLockupView__addConfirmationGradientForView___block_invoke;
  v18[3] = &unk_265405D00;
  v18[4] = self;
  id v20 = &v21;
  id v8 = v5;
  id v19 = v8;
  [v7 enumerateObjectsUsingBlock:v18];

  id v9 = [(SUUIHorizontalLockupView *)self gradientColor];
  if (!v9)
  {
    id v9 = [(UIView *)self suui_apparentBackgroundColor];
    if (!v9)
    {
      id v9 = [MEMORY[0x263F825C8] whiteColor];
    }
  }
  offerConfirmationGradientView = self->_offerConfirmationGradientView;
  if (!offerConfirmationGradientView)
  {
    id v11 = [SUUIGradientView alloc];
    uint64_t v12 = -[SUUIGradientView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    uint64_t v13 = self->_offerConfirmationGradientView;
    self->_offerConfirmationGradientView = v12;

    uint64_t v14 = [(SUUIGradientView *)self->_offerConfirmationGradientView layer];
    id v15 = [v9 colorWithAlphaComponent:0.0];
    v27[0] = [v15 CGColor];
    id v16 = v9;
    v27[1] = [v16 CGColor];
    v27[2] = [v16 CGColor];
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
    [v14 setColors:v17];

    objc_msgSend(v14, "setEndPoint:", 1.0, 0.5);
    objc_msgSend(v14, "setStartPoint:", 0.0, 0.5);

    offerConfirmationGradientView = self->_offerConfirmationGradientView;
  }
  [v8 insertSubview:offerConfirmationGradientView belowSubview:v22[5]];
  [(SUUIHorizontalLockupView *)self _layoutConfirmationGradientRelativeToItemOfferView:v4 alpha:0.0];

  _Block_object_dispose(&v21, 8);
}

void __60__SUUIHorizontalLockupView__addConfirmationGradientForView___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 584) objectForKey:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  id v7 = v3;
  if (!v6)
  {
    objc_storeStrong(v5, v3);
    id v3 = v7;
  }
  [*(id *)(a1 + 40) bringSubviewToFront:v3];
}

- (id)_addFlipContainerViewWithFrontView:(id)a3 backView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [[SUUIInlineFlipContainerView alloc] initWithFrontView:v7 backView:v6];

  uint64_t v13 = [MEMORY[0x263F825C8] clearColor];
  [(SUUIInlineFlipContainerView *)v12 setBackgroundColor:v13];

  [v7 frame];
  double v15 = v14;
  double v17 = v16;

  [(SUUIInlineFlipContainerView *)v12 frame];
  -[SUUIInlineFlipContainerView setFrame:](v12, "setFrame:", v9 - v15, v11 - v17);
  [(SUUIHorizontalLockupView *)self addSubview:v12];
  return v12;
}

- (id)_columnForView:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = __Block_byref_object_copy__48;
  double v17 = __Block_byref_object_dispose__48;
  id v18 = 0;
  id v5 = [(SUUIHorizontalLockupView *)self _viewElementForView:v4];
  id v6 = [(SUUIHorizontalLockupLayout *)self->_layout columns];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__SUUIHorizontalLockupView__columnForView___block_invoke;
  v10[3] = &unk_265405D28;
  id v7 = v5;
  id v11 = v7;
  uint64_t v12 = &v13;
  [v6 enumerateObjectsUsingBlock:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __43__SUUIHorizontalLockupView__columnForView___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 childViewElements];
  int v8 = [v7 containsObject:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (double)_dividerHeight:(id)a3
{
  id v3 = [a3 style];
  id v4 = [v3 itemHeight];

  if (v4)
  {
    [v4 floatValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 10.0;
  }

  return v6;
}

- (void)_expandEditorialForLabel:(id)a3
{
  id v8 = a3;
  id v4 = SUUICollectionViewCellForView(self);
  float v5 = SUUICollectionViewForView(v4);
  double v6 = [v5 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v5 indexPathForCell:v4];
    [v6 collectionView:v5 expandEditorialForLabelElement:v8 indexPath:v7];
  }
}

- (void)_layoutConfirmationGradientRelativeToItemOfferView:(id)a3 alpha:(double)a4
{
  void v19[3] = *MEMORY[0x263EF8340];
  if (self->_offerConfirmationGradientView)
  {
    [a3 frame];
    double v7 = v6;
    double v9 = v8;
    [(SUUIGradientView *)self->_offerConfirmationGradientView frame];
    double v11 = v10;
    uint64_t v12 = [(SUUIGradientView *)self->_offerConfirmationGradientView superview];
    [v12 bounds];
    double v14 = v13;

    double v15 = v9 + 30.0;
    [(SUUIGradientView *)self->_offerConfirmationGradientView setAlpha:a4];
    -[SUUIGradientView setFrame:](self->_offerConfirmationGradientView, "setFrame:", v7 + -30.0, v11, v15, v14);
    double v16 = [(SUUIGradientView *)self->_offerConfirmationGradientView layer];
    double v17 = objc_msgSend(NSNumber, "numberWithDouble:", 30.0 / v15, &unk_2705D0B80);
    v19[1] = v17;
    v19[2] = &unk_2705D0B98;
    id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];
    [v16 setLocations:v18];
  }
}

- (void)_performDefaultActionForImage:(id)a3
{
  id v4 = a3;
  float v5 = self->_lockupElement;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__SUUIHorizontalLockupView__performDefaultActionForImage___block_invoke;
  v8[3] = &unk_265405D50;
  double v9 = v5;
  double v10 = self;
  id v11 = v4;
  id v6 = v4;
  double v7 = v5;
  [v6 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:v8];
}

void __58__SUUIHorizontalLockupView__performDefaultActionForImage___block_invoke(uint64_t a1, int a2, char a3)
{
  if (!a2 || (a3 & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__SUUIHorizontalLockupView__performDefaultActionForImage___block_invoke_2;
    block[3] = &unk_265400958;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v8 = v4;
    uint64_t v9 = v5;
    id v10 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void *__58__SUUIHorizontalLockupView__performDefaultActionForImage___block_invoke_2(uint64_t a1)
{
  BOOL result = *(void **)(a1 + 32);
  if (result == *(void **)(*(void *)(a1 + 40) + 504))
  {
    id v3 = [result firstChildForElementType:90];
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = v3;
      id v3 = (void *)[v3 isEnabled];
      id v4 = v5;
      if (v3)
      {
        id v3 = (void *)[*(id *)(a1 + 48) isDescendentFromViewElement:v5];
        id v4 = v5;
        if (v3)
        {
          id v3 = (void *)[*(id *)(a1 + 40) togglePreviewPlaybackAnimated:1];
          id v4 = v5;
        }
      }
    }
    return (void *)MEMORY[0x270F9A758](v3, v4);
  }
  return result;
}

- (id)_previewFrontView
{
  id v3 = [(SUUIViewElement *)self->_lockupElement firstChildForElementType:90];
  id v4 = [v3 flattenedChildren];
  uint64_t v5 = [v4 firstObject];

  if (v5)
  {
    id v6 = [(NSMapTable *)self->_viewElementViews objectForKey:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_previewMediaURL
{
  uint64_t v2 = [(SUUIViewElement *)self->_lockupElement firstChildForElementType:90];
  id v3 = [v2 mediaURLString];

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

- (id)_previewProgressIndicator
{
  if (!self->_previewProgressIndicator)
  {
    id v3 = -[SUUIPreviewProgressIndicator initWithFrame:]([SUUIPreviewProgressIndicator alloc], "initWithFrame:", 0.0, 0.0, 29.0, 29.0);
    previewProgressIndicator = self->_previewProgressIndicator;
    self->_previewProgressIndicator = v3;

    [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator addTarget:self action:sel__previewIndicatorAction_ forControlEvents:64];
    uint64_t v5 = self->_previewProgressIndicator;
    id v6 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIPreviewProgressIndicator *)v5 setBackgroundColor:v6];
  }
  double v7 = [(SUUIViewElement *)self->_lockupElement firstChildForElementType:90];
  id v8 = self->_previewProgressIndicator;
  uint64_t v9 = [v7 style];
  id v10 = SUUIViewElementPlainColorWithStyle(v9, 0);
  [(SUUIPreviewProgressIndicator *)v8 setTintColor:v10];

  id v11 = self->_previewProgressIndicator;
  return v11;
}

- (void)_resolvePreviewStateAfterTransitionForFlipView:(id)a3
{
  id v4 = a3;
  int64_t previewState = self->_previewState;
  if (previewState == 3)
  {
    id v25 = v4;
    [v4 removeFromSuperview];
    uint64_t v23 = [(SUUIHorizontalLockupView *)self _previewFrontView];
    [(SUUIHorizontalLockupView *)self addSubview:v23];
    [(SUUIHorizontalLockupView *)self setNeedsLayout];
    self->_int64_t previewState = 0;

    id v4 = v25;
  }
  else if (previewState == 1)
  {
    id v24 = v4;
    [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator superview];
    -[SUUIHorizontalLockupView convertRect:fromView:](self, "convertRect:fromView:", v14, v7, v9, v11, v13);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    -[SUUIPreviewProgressIndicator setFrame:](self->_previewProgressIndicator, "setFrame:", v16, v18, v20, v22);
    [(SUUIHorizontalLockupView *)self addSubview:self->_previewProgressIndicator];
    [v24 removeFromSuperview];
    [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator reloadWithPlayerStatus:self->_lastPlayerStatus animated:0];
    [(SUUIPreviewProgressIndicator *)self->_previewProgressIndicator setEnabled:1];
    id v4 = v24;
    self->_int64_t previewState = 2;
  }
}

- (void)_resizeMetadataRelativeToItemOfferView:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SUUIHorizontalLockupView *)self _columnForView:v4];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = [(SUUIHorizontalLockupLayout *)self->_layout columns];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (!v7)
  {
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v8 = v7;
  double v9 = 0;
  uint64_t v10 = *(void *)v36;
  while (2)
  {
    uint64_t v11 = 0;
    double v12 = v9;
    do
    {
      if (*(void *)v36 != v10) {
        objc_enumerationMutation(v6);
      }
      double v13 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
      if ([v13 isEqual:v5])
      {
        double v9 = v12;
        goto LABEL_11;
      }
      double v9 = [v13 childViewElements];

      ++v11;
      double v12 = v9;
    }
    while (v8 != v11);
    uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_11:

  if (v9)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v6 = v9;
    uint64_t v14 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v6);
          }
          double v18 = -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", *(void *)(*((void *)&v31 + 1) + 8 * i), (void)v31);
          [v18 frame];
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          [v4 frame];
          v44.origin.double x = v27;
          v44.origin.double y = v28;
          v44.size.CGFloat width = v29;
          v44.size.height = v30;
          v42.origin.double x = v20;
          v42.origin.double y = v22;
          v42.size.CGFloat width = v24;
          v42.size.height = v26;
          CGRect v43 = CGRectIntersection(v42, v44);
          if (!CGRectIsNull(v43))
          {
            [v18 frame];
            objc_msgSend(v18, "setFrame:");
          }
        }
        uint64_t v15 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v15);
    }

    goto LABEL_22;
  }
LABEL_23:
}

- (CGSize)_sizeViewsForColumn:(id)a3 toFitWidth:(double)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  CGFloat v20 = (double *)&v19;
  uint64_t v21 = 0x3010000000;
  CGFloat v22 = "";
  long long v23 = *MEMORY[0x263F001B0];
  uint64_t v7 = [v6 childViewElements];
  uint64_t v8 = [v7 count];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__SUUIHorizontalLockupView__sizeViewsForColumn_toFitWidth___block_invoke;
  v14[3] = &unk_265405D78;
  v14[4] = self;
  double v17 = a4;
  id v9 = v6;
  id v15 = v9;
  uint64_t v16 = &v19;
  uint64_t v18 = v8;
  [v7 enumerateObjectsUsingBlock:v14];
  double v10 = v20[4];
  double v11 = v20[5];

  _Block_object_dispose(&v19, 8);
  double v12 = v10;
  double v13 = v11;
  result.height = v13;
  result.CGFloat width = v12;
  return result;
}

void __59__SUUIHorizontalLockupView__sizeViewsForColumn_toFitWidth___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v20 = a2;
  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 584), "objectForKey:");
  uint64_t v6 = *MEMORY[0x263F001A8];
  uint64_t v7 = *(void *)(MEMORY[0x263F001A8] + 8);
  objc_msgSend(v5, "sizeThatFits:", *(double *)(a1 + 56), 1.79769313e308);
  uint64_t v10 = v9;
  if (v8 >= *(double *)(a1 + 56)) {
    double v11 = *(double *)(a1 + 56);
  }
  else {
    double v11 = v8;
  }
  uint64_t v12 = v6;
  uint64_t v13 = v7;
  CGRect v22 = CGRectIntegral(*(CGRect *)(&v10 - 3));
  double width = v22.size.width;
  double height = v22.size.height;
  objc_msgSend(v5, "setFrame:", v22.origin.x, v22.origin.y);
  if ([*(id *)(a1 + 40) identifier] != 3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = height
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 40);
    if (*(void *)(a1 + 64) - 1 > a3)
    {
      [*(id *)(*(void *)(a1 + 32) + 496) bottomPaddingForViewElement:v20];
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v16
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 40);
    }
    if (a3)
    {
      [*(id *)(*(void *)(a1 + 32) + 496) topPaddingForViewElement:v20];
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v17
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 40);
    }
  }
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  double v19 = *(double *)(v18 + 32);
  if (v19 < width) {
    double v19 = width;
  }
  *(double *)(v18 + 32) = v19;
}

- (BOOL)_usesBackgroundWithAlpha
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  double v5 = 0.0;
  uint64_t v6 = 0;
  uint64_t v2 = [(SUUIHorizontalLockupView *)self backgroundColor];
  int v3 = [v2 getHue:&v8 saturation:&v7 brightness:&v6 alpha:&v5];

  return v3 && v5 < 1.0 && v5 != 0.0;
}

- (id)_viewElementForView:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = self->_viewElementViews;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", v10, (void)v14);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          id v12 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (UIView)metadataBackgroundView
{
  return self->_metadataBackgroundView;
}

- (void)setMetadataBackgroundView:(id)a3
{
}

- (UIColor)gradientColor
{
  return self->_gradientColor;
}

- (void)setGradientColor:(id)a3
{
}

- (BOOL)updateLayoutOnButtonConfirmation
{
  return self->_updateLayoutOnButtonConfirmation;
}

- (void)setUpdateLayoutOnButtonConfirmation:(BOOL)a3
{
  self->_updateLayoutOnButtonConfirmation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientColor, 0);
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_tappableViews, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_previewProgressIndicator, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_offerViews, 0);
  objc_storeStrong((id *)&self->_offerConfirmationGradientView, 0);
  objc_storeStrong((id *)&self->_metadataBackgroundView, 0);
  objc_storeStrong((id *)&self->_lockupElement, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_lastPlayerStatus, 0);
  objc_storeStrong((id *)&self->_cacheKeyToImageView, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptorToButton, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_artworkRelatedChildViewElementViews, 0);
}

@end