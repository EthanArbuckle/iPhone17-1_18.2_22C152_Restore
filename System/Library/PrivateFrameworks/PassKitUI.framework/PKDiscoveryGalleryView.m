@interface PKDiscoveryGalleryView
+ ($7D24B5AD5894795FD85A0EE1D817D743)_welcomeStateForState:(id *)a3;
+ (BOOL)isVisibleForSectionsState:(id *)a3 dataSource:(id)a4;
+ (BOOL)isWelcomeCardVisibleForSectionsState:(id *)a3;
+ (id)passWelcomeCardMessageAttributedString;
- (BOOL)_requestDismissalIfNecessaryAfterLayoutStateUpdate;
- (BOOL)isAnimatingCard;
- (BOOL)needsRemoval;
- (CGSize)_cardSize;
- (CGSize)_contentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)frontmostItemIdentifier;
- (PKDiscoveryDataSource)dataSource;
- (PKDiscoveryGalleryView)init;
- (PKDiscoveryGalleryView)initWithCardTemplateInformation:(id)a3;
- (PKDiscoveryGalleryView)initWithFrame:(CGRect)a3;
- (id)_createPassWelcomeCardView;
- (id)_createPaymentWelcomeCardView;
- (id)cardViewForCardWithItemIdentifier:(id)a3;
- (int64_t)scrollType;
- (unint64_t)_indexForCardViewWithIdentifier:(id)a3;
- (unint64_t)displayIndex;
- (void)_appStorePressed;
- (void)_pageControlChanged:(id)a3;
- (void)_removeCardView:(id)a3 animated:(BOOL)a4;
- (void)_reportCurrentDiscoveryCardToDiscoveryService;
- (void)_scanCodePressed;
- (void)_updateCardSizeIfNecessary;
- (void)_updateCardViews;
- (void)_updateCardViewsAnimated:(BOOL)a3;
- (void)_updateCardViewsAnimated:(BOOL)a3 overrideFrontmostCardToIdentifier:(id)a4;
- (void)_updateDiscoveryCardViewsForUpdatedArticleLayouts:(id)a3 overrideFrontmostCardToIdentifier:(id)a4 animated:(BOOL)a5;
- (void)_updatePageControlVisibilityWithDelay:(double)a3;
- (void)_updatePageControlWithDisplayIndex;
- (void)_updateScrollViewToCardIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)discoveryArticleViewController:(id)a3 tappedCallToAction:(id)a4 item:(id)a5;
- (void)discoveryCardViewCTATapped:(id)a3 callToAction:(id)a4 itemIdentifier:(id)a5;
- (void)discoveryCardViewRemoveTapped:(id)a3;
- (void)discoveryCardViewTapped:(id)a3;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)layoutSubviews;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAnimatingCard:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setSectionsState:(id *)a3;
- (void)setSubheaderDelegate:(id)a3;
- (void)updateArticleLayouts:(id)a3;
- (void)updatePageControlFrame;
@end

@implementation PKDiscoveryGalleryView

+ (BOOL)isVisibleForSectionsState:(id *)a3 dataSource:(id)a4
{
  if (!a4) {
    return 0;
  }
  long long v5 = *((_OWORD *)&a3->var0 + 1);
  long long v10 = *(_OWORD *)&a3->var0.var0;
  long long v11 = v5;
  id v6 = a4;
  LOBYTE(a1) = [a1 _welcomeStateForState:&v10];
  v7 = objc_msgSend(v6, "articleLayouts", v10, v11);

  BOOL v8 = (a1 & 3 | ((unint64_t)([v7 count] != 0) << 8)) != 0;
  return v8;
}

+ ($7D24B5AD5894795FD85A0EE1D817D743)_welcomeStateForState:(id *)a3
{
  unsigned int v3 = *((unsigned __int8 *)&a3->var0 + 16);
  if (*((unsigned char *)a3 + 24))
  {
    BOOL v4 = (v3 & 2) == 0;
    if ((v3 & 4) != 0)
    {
      int v5 = 0;
    }
    else if (PKBarcodePassWelcomeCardDismissed())
    {
      int v5 = 0;
    }
    else
    {
      int v5 = 2;
    }
  }
  else
  {
    BOOL v4 = 0;
    int v5 = ~(v3 >> 1) & 2;
  }
  return ($7D24B5AD5894795FD85A0EE1D817D743)(v5 | v4);
}

+ (BOOL)isWelcomeCardVisibleForSectionsState:(id *)a3
{
  long long v3 = *((_OWORD *)&a3->var0 + 1);
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = v3;
  return ([a1 _welcomeStateForState:v5] & 3) != 0;
}

- (PKDiscoveryGalleryView)init
{
  return 0;
}

- (PKDiscoveryGalleryView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKDiscoveryGalleryView)initWithCardTemplateInformation:(id)a3
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKDiscoveryGalleryView;
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v10 = -[PKDiscoveryGalleryView initWithFrame:](&v46, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12 = (void *)*((void *)v10 + 51);
    *((void *)v10 + 51) = v11;

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14 = (void *)*((void *)v10 + 52);
    *((void *)v10 + 52) = v13;

    id v15 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    v16 = (void *)*((void *)v10 + 53);
    *((void *)v10 + 53) = v15;

    v17 = [[PKDiscoveryCardViewTemplateInformation alloc] initWithCardSize:PKDiscoveryForceIgnoreCEOCards() displayType:0];
    v18 = (void *)*((void *)v10 + 67);
    *((void *)v10 + 67) = v17;

    objc_storeStrong((id *)v10 + 66, a3);
    v19 = [MEMORY[0x1E4FB1618] clearColor];
    [v10 setBackgroundColor:v19];

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1BE0]), "initWithFrame:", v6, v7, v8, v9);
    v21 = (void *)*((void *)v10 + 57);
    *((void *)v10 + 57) = v20;

    [*((id *)v10 + 57) setDelegate:v10];
    [*((id *)v10 + 57) setShowsVerticalScrollIndicator:0];
    [*((id *)v10 + 57) setShowsHorizontalScrollIndicator:0];
    [*((id *)v10 + 57) setPagingEnabled:1];
    [*((id *)v10 + 57) setScrollsToTop:0];
    [*((id *)v10 + 57) setClipsToBounds:0];
    [v10 addSubview:*((void *)v10 + 57)];
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1A40]), "initWithFrame:", v6, v7, v8, v9);
    v23 = (void *)*((void *)v10 + 58);
    *((void *)v10 + 58) = v22;

    [*((id *)v10 + 58) addTarget:v10 action:sel__pageControlChanged_ forControlEvents:4096];
    [*((id *)v10 + 58) setHidden:1];
    v24 = [MEMORY[0x1E4FB1618] labelColor];
    [*((id *)v10 + 58) setCurrentPageIndicatorTintColor:v24];
    v25 = (void *)*((void *)v10 + 58);
    v26 = [v24 colorWithAlphaComponent:0.3];
    [v25 setPageIndicatorTintColor:v26];

    v27 = PKPassKitUIBundle();
    v28 = [v27 URLForResource:@"xmark" withExtension:@"pdf"];
    double v29 = PKUIScreenScale();
    uint64_t v30 = PKUIImageFromPDF(v28, 100.0, 100.0, v29);
    v31 = (void *)*((void *)v10 + 59);
    *((void *)v10 + 59) = v30;

    uint64_t v32 = [*((id *)v10 + 59) imageWithRenderingMode:2];
    v33 = (void *)*((void *)v10 + 59);
    *((void *)v10 + 59) = v32;

    [v10 _updatePageControlVisibilityWithDelay:0.0];
    v34 = +[PKUIForegroundActiveArbiter sharedInstance];
    *((_WORD *)v10 + 252) = [v34 registerObserver:v10];

    objc_initWeak(&location, v10);
    v47[0] = objc_opt_class();
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = __58__PKDiscoveryGalleryView_initWithCardTemplateInformation___block_invoke;
    v43 = &unk_1E59D7120;
    objc_copyWeak(&v44, &location);
    id v36 = (id)[v10 registerForTraitChanges:v35 withHandler:&v40];

    objc_msgSend(v10, "sizeThatFits:", 1.79769313e308, 1.79769313e308, v40, v41, v42, v43);
    objc_msgSend(v10, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v37, v38);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  return (PKDiscoveryGalleryView *)v10;
}

void __58__PKDiscoveryGalleryView_initWithCardTemplateInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  double v6 = [a2 traitCollection];
  id v10 = [v6 preferredContentSizeCategory];

  id v7 = [v5 preferredContentSizeCategory];

  if (v7 != v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    double v9 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained setNeedsLayout];
    }
  }
}

- (void)dealloc
{
  [(UIScrollView *)self->_horizontalScrollView setDelegate:0];
  [(NSMutableArray *)self->_allActiveDiscoveryCards enumerateObjectsUsingBlock:&__block_literal_global_159];
  long long v3 = +[PKUIForegroundActiveArbiter sharedInstance];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKDiscoveryGalleryView;
  [(PKDiscoveryGalleryView *)&v4 dealloc];
}

uint64_t __33__PKDiscoveryGalleryView_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(PKDiscoveryGalleryView *)self _cardSize];
  double v5 = v4;
  double v7 = v6 + 6.0 + 6.0;
  unint64_t v8 = [(NSMutableArray *)self->_allActiveDiscoveryCards count];
  double v9 = 39.0;
  if (v8 <= 1) {
    double v9 = 0.0;
  }
  double v10 = v5 + v9;
  double v11 = v7;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  if (![(PKDiscoveryGalleryView *)self isAnimatingCard])
  {
    v33.receiver = self;
    v33.super_class = (Class)PKDiscoveryGalleryView;
    [(PKDiscoveryGalleryView *)&v33 layoutSubviews];
    [(PKDiscoveryGalleryView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    -[PKDiscoveryGalleryView sizeThatFits:](self, "sizeThatFits:", v7, 1.79769313e308);
    BOOL v13 = v10 == v12 && v8 == v11;
    if (v13)
    {
      double v14 = v10;
    }
    else
    {
      double v15 = v11;
      double v14 = v12;
      -[PKDiscoveryGalleryView setBounds:](self, "setBounds:", v4, v6, v11, v12);
      double v8 = v15;
    }
    [(UIScrollView *)self->_horizontalScrollView contentSize];
    double v17 = v16;
    double v19 = v18;
    [(PKDiscoveryGalleryView *)self _contentSize];
    double v21 = v20;
    double v23 = v22;
    int v24 = [(UIScrollView *)self->_horizontalScrollView _isAnimatingScroll];
    if (v24) {
      double v25 = v17;
    }
    else {
      double v25 = v21;
    }
    if (v24) {
      double v23 = v19;
    }
    double v26 = fmax(v14, v23);
    [(UIScrollView *)self->_horizontalScrollView frame];
    v35.origin.x = v4;
    v35.origin.y = v6;
    v35.size.width = v8;
    v35.size.height = v26;
    if (!CGRectEqualToRect(v34, v35)) {
      -[UIScrollView setFrame:](self->_horizontalScrollView, "setFrame:", v4, v6, v8, v26);
    }
    if (v17 != v31 || v19 != v23) {
      -[UIScrollView setContentSize:](self->_horizontalScrollView, "setContentSize:");
    }
    [(PKDiscoveryGalleryView *)self _cardSize];
    PKFloatRoundToPixel();
    displayedCardViews = self->_displayedCardViews;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __40__PKDiscoveryGalleryView_layoutSubviews__block_invoke;
    v32[3] = &__block_descriptor_72_e36_v32__0__PKDiscoveryCardView_8Q16_B24l;
    *(double *)&v32[4] = v4;
    *(double *)&v32[5] = v6;
    *(double *)&v32[6] = v8;
    *(double *)&v32[7] = v14;
    v32[8] = v29;
    [(NSArray *)displayedCardViews enumerateObjectsUsingBlock:v32];
    [(PKDiscoveryGalleryView *)self _updatePageControlVisibilityWithDelay:0.0];
    if (!v13)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_subheaderDelegate);
      [WeakRetained setNeedsUpdateForGroupStackViewSectionSubheaderView:self];
    }
  }
}

void __40__PKDiscoveryGalleryView_layoutSubviews__block_invoke(double *a1, void *a2, unint64_t a3)
{
  double v3 = a1[7];
  double v4 = a1[6];
  double v5 = a1[8] + (double)a3 * v4;
  id v8 = a2;
  objc_msgSend(v8, "sizeThatFits:", v4, v3);
  objc_msgSend(v8, "setFrame:", v5, 0.0, v6, v7);
}

- (void)updateArticleLayouts:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if (!self->_pendingDeletes)
  {
    int v6 = *((unsigned __int8 *)&self->_layoutState.cards.welcome + 1);
    *((unsigned char *)&self->_layoutState.cards.welcome + 1) = *((unsigned char *)&self->_layoutState.cards.welcome + 1) & 0xFE | ([v4 count] != 0);
    [(PKDiscoveryGalleryView *)self _requestDismissalIfNecessaryAfterLayoutStateUpdate];
    if ((*((unsigned __int8 *)&self->_layoutState.cards.welcome + 1) | v6))
    {
      if (LOBYTE(self->_lastTimeForegroundActive))
      {
        double v7 = 0;
      }
      else
      {
        long long v14 = 0u;
        long long v15 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
        id v8 = v5;
        double v7 = (void *)[v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7)
        {
          uint64_t v9 = *(void *)v13;
          while (2)
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v13 != v9) {
                objc_enumerationMutation(v8);
              }
              double v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
              if (objc_msgSend(v11, "hasRequestedBadge", (void)v12))
              {
                double v7 = [v11 itemIdentifier];
                goto LABEL_15;
              }
            }
            double v7 = (void *)[v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
LABEL_15:
      }
      -[PKDiscoveryGalleryView _updateDiscoveryCardViewsForUpdatedArticleLayouts:overrideFrontmostCardToIdentifier:animated:](self, "_updateDiscoveryCardViewsForUpdatedArticleLayouts:overrideFrontmostCardToIdentifier:animated:", v5, v7, 1, (void)v12);
    }
    LOBYTE(self->_lastTimeForegroundActive) = 1;
  }
}

- (id)cardViewForCardWithItemIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_allActiveDiscoveryCards;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v5)
  {
    id v7 = 0;
    goto LABEL_19;
  }
  uint64_t v6 = v5;
  id v7 = 0;
  uint64_t v8 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(obj);
      }
      double v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      double v11 = [v10 articleLayout];
      id v12 = [v11 itemIdentifier];
      id v13 = v4;
      long long v14 = v13;
      if (v12 == v13)
      {

LABEL_12:
        double v11 = v7;
        id v7 = v10;
LABEL_14:

        continue;
      }
      if (!v4 || !v12)
      {

        goto LABEL_14;
      }
      char v15 = [v12 isEqualToString:v13];

      if (v15) {
        goto LABEL_12;
      }
    }
    uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v6);
LABEL_19:

  return v7;
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  id v6 = a3;
  char v7 = BYTE1(self->_lastReportedDiscoveryItemIdentifier);
  LOWORD(self->_lastReportedDiscoveryItemIdentifier) = a4;
  if (v7)
  {
    if ((*(_WORD *)&a4 & 0xFF00) == 0) {
      LOBYTE(self->_welcomeCardTemplateInformation) = 3;
    }
  }
  else
  {
    id v11 = v6;
    if ((*(_WORD *)&a4 & 0xFF00) != 0)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      double v9 = Current;
      double v10 = (void *)*((void *)&self->_layoutState + 1);
      if (v10 && Current - *(double *)&self->_foregroundState.foreground > 300.0)
      {
        *((void *)&self->_layoutState + 1) = 0;
      }
      *(double *)&self->_foregroundState.foreground = v9;
      LOBYTE(self->_lastTimeForegroundActive) = 0;
      id v6 = v11;
      if (!LOBYTE(self->_welcomeCardTemplateInformation))
      {
        [(PKDiscoveryGalleryView *)self _updateCardSizeIfNecessary];
        id v6 = v11;
      }
      LOBYTE(self->_welcomeCardTemplateInformation) = 2;
    }
    else
    {
      LOBYTE(self->_welcomeCardTemplateInformation) = 0;
      [(PKDiscoveryGalleryView *)self _updateCardSizeIfNecessary];
      id v6 = v11;
    }
  }
}

- (void)_updateCardSizeIfNecessary
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)&self->_layoutState.cards.welcome + 3))
  {
    if (PKDiscoveryForceIgnoreCEOCards())
    {
      *((unsigned char *)&self->_layoutState.cards.welcome + 3) = 0;
      return;
    }
    double v3 = [*(id *)&self->_visibilityState articleLayouts];
    char v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", &__block_literal_global_45_0);

    uint64_t v5 = [*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive cardSize];
    if ((v4 & 1) != 0 || self->_paymentWelcomeView)
    {
      if (!v5)
      {
LABEL_15:
        *((unsigned char *)&self->_layoutState.cards.welcome + 3) = 0;
        [(PKDiscoveryGalleryView *)self setNeedsLayout];
        [(PKDiscoveryGalleryView *)self layoutIfNeeded];
        return;
      }
    }
    else
    {
      passWelcomeView = self->_passWelcomeView;
      if (passWelcomeView) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v5 == 1;
      }
      if (!v12)
      {
        [*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive updateCardSize:1];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v6 = self->_allActiveDiscoveryCards;
        uint64_t v14 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v23 != v16) {
                objc_enumerationMutation(v6);
              }
              [*(id *)(*((void *)&v22 + 1) + 8 * i) setCardSize:1];
            }
            uint64_t v15 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
          }
          while (v15);
        }
        goto LABEL_14;
      }
      if (passWelcomeView) {
        BOOL v13 = v5 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13) {
        goto LABEL_15;
      }
    }
    [*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive updateCardSize:0];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = self->_allActiveDiscoveryCards;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v8; ++j)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * j), "setCardSize:", 0, (void)v18);
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v8);
    }
LABEL_14:

    goto LABEL_15;
  }
}

uint64_t __52__PKDiscoveryGalleryView__updateCardSizeIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 entitledToForceLargeCard];
}

- (void)_updateDiscoveryCardViewsForUpdatedArticleLayouts:(id)a3 overrideFrontmostCardToIdentifier:(id)a4 animated:(BOOL)a5
{
  BOOL v27 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v28 = a4;
  uint64_t v8 = [v7 count];
  char v9 = v8 != [(NSMutableArray *)self->_activeDiscoveryCards count];
  double v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v7 count])
  {
    unint64_t v11 = 0;
    do
    {
      BOOL v12 = [v7 objectAtIndexedSubscript:v11];
      BOOL v13 = [v12 itemIdentifier];
      unint64_t v14 = [(PKDiscoveryGalleryView *)self _indexForCardViewWithIdentifier:v13];

      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v15 = [[PKDiscoveryCardView alloc] initWithArticleLayout:v12 dismissImage:self->_dismissImage cardTemplateInformation:*(void *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive];
        [(PKDiscoveryCardView *)v15 setDelegate:self];
        [(UIScrollView *)self->_horizontalScrollView addSubview:v15];
        char v9 = 1;
      }
      else
      {
        uint64_t v15 = [(NSMutableArray *)self->_allActiveDiscoveryCards objectAtIndex:v14];
        uint64_t v16 = [(PKDiscoveryCardView *)v15 articleLayout];
        [(PKDiscoveryCardView *)v15 setArticleLayout:v12];
        if (v9) {
          char v9 = 1;
        }
        else {
          char v9 = [v16 isEqualForUI:v12] ^ 1;
        }
      }
      uint64_t v17 = [v12 actionOnDismiss];
      [(PKDiscoveryCardView *)v15 setDismissAction:v17];

      [(NSMutableArray *)v10 addObject:v15];
      ++v11;
    }
    while (v11 < [v7 count]);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v18 = self->_activeDiscoveryCards;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([(NSMutableArray *)v10 indexOfObjectIdenticalTo:v23] == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v23 setDelegate:0];
          [v23 removeFromSuperview];
          char v9 = 1;
        }
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v20);
  }

  activeDiscoveryCards = self->_activeDiscoveryCards;
  self->_activeDiscoveryCards = v10;

  if (v9)
  {
    long long v25 = v28;
    [(PKDiscoveryGalleryView *)self _updateCardViewsAnimated:v27 overrideFrontmostCardToIdentifier:v28];
LABEL_24:
    [(PKDiscoveryGalleryView *)self _reportCurrentDiscoveryCardToDiscoveryService];
    goto LABEL_25;
  }
  long long v25 = v28;
  if (v28)
  {
    unint64_t v26 = [(PKDiscoveryGalleryView *)self _indexForCardViewWithIdentifier:v28];
    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(PKDiscoveryGalleryView *)self _updateScrollViewToCardIndex:v26 animated:v27];
      goto LABEL_24;
    }
  }
LABEL_25:
}

- (void)_updateCardViewsAnimated:(BOOL)a3
{
}

- (void)_updateCardViewsAnimated:(BOOL)a3 overrideFrontmostCardToIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unint64_t v7 = [(PKDiscoveryGalleryView *)self displayIndex];
  unint64_t v8 = [(NSMutableArray *)self->_allActiveDiscoveryCards count];
  if (v6)
  {
    id v9 = v6;
  }
  else
  {
    if (v8) {
      BOOL v10 = v7 >= v8;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      id v9 = 0;
    }
    else
    {
      unint64_t v11 = [(NSMutableArray *)self->_allActiveDiscoveryCards objectAtIndexedSubscript:v7];
      BOOL v12 = [v11 articleLayout];
      id v9 = [v12 itemIdentifier];
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke;
  aBlock[3] = &unk_1E59CC648;
  aBlock[4] = self;
  unint64_t v22 = v7;
  id v13 = v9;
  id v21 = v13;
  unint64_t v14 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v15 = v14;
  if (v4)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4FB1EB0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke_2;
    v19[3] = &unk_1E59CA7D0;
    v19[4] = self;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke_3;
    v17[3] = &unk_1E59CA820;
    v17[4] = self;
    long long v18 = v14;
    objc_msgSend(v16, "pkui_animateUsingOptions:delay:velocity:animations:completion:", 4, v19, v17, 0.0, 0.0);
  }
  else
  {
    v14[2](v14);
  }
}

uint64_t __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCardViews];
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= [*(id *)(*(void *)(a1 + 32) + 424) count] - 1) {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 424) count] - 1;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 48);
  }
  uint64_t v4 = [*(id *)(a1 + 32) _indexForCardViewWithIdentifier:*(void *)(a1 + 40)];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v4;
  }
  [*(id *)(a1 + 32) _updateScrollViewToCardIndex:v5 animated:0];
  [*(id *)(a1 + 32) _updatePageControlVisibilityWithDelay:0.32];
  [*(id *)(a1 + 32) _updatePageControlWithDisplayIndex];
  id v6 = *(void **)(a1 + 32);

  return [v6 _reportCurrentDiscoveryCardToDiscoveryService];
}

uint64_t __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:0.0];
}

uint64_t __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke_4;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = *(void *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:delay:velocity:animations:completion:", 4, v3, 0, 0.0, 0.0);
}

uint64_t __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:1.0];
}

- (void)_updateCardViews
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_allActiveDiscoveryCards removeAllObjects];
  char welcome = (char)self->_layoutState.cards.welcome;
  if ((welcome & 1) != 0 && !self->_paymentWelcomeView)
  {
    id v9 = [(PKDiscoveryGalleryView *)self _createPaymentWelcomeCardView];
    paymentWelcomeView = self->_paymentWelcomeView;
    self->_paymentWelcomeView = v9;

    [(UIScrollView *)self->_horizontalScrollView addSubview:self->_paymentWelcomeView];
    $FED95A779F944789D45F91CDF1F04AC3 v5 = self->_layoutState.cards.welcome;
    int v4 = 1;
  }
  else
  {
    int v4 = 0;
    $FED95A779F944789D45F91CDF1F04AC3 v5 = self->_layoutState.cards.welcome;
  }
  int v6 = (*(unsigned int *)&v5 >> 1) & 1;
  if ((*(unsigned char *)&v5 & 2) != 0)
  {
    passWelcomeView = self->_passWelcomeView;
    if (passWelcomeView)
    {
      if (*((unsigned char *)&self->_layoutState.cards.welcome + 2))
      {
        objc_initWeak(&location, self);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __42__PKDiscoveryGalleryView__updateCardViews__block_invoke;
        aBlock[3] = &unk_1E59D9408;
        objc_copyWeak(&v33, &location);
        unint64_t v8 = _Block_copy(aBlock);
        objc_destroyWeak(&v33);
        objc_destroyWeak(&location);
        passWelcomeView = self->_passWelcomeView;
      }
      else
      {
        unint64_t v8 = 0;
      }
      [(PKDiscoveryCardView *)passWelcomeView setDismissAction:v8];
    }
    else
    {
      unint64_t v11 = [(PKDiscoveryGalleryView *)self _createPassWelcomeCardView];
      BOOL v12 = self->_passWelcomeView;
      self->_passWelcomeView = v11;

      [(UIScrollView *)self->_horizontalScrollView addSubview:self->_passWelcomeView];
      int v4 = 1;
    }
  }
  if ((*((unsigned char *)&self->_layoutState.cards.welcome + 1) & 1) == 0)
  {
    if (welcome) {
      goto LABEL_40;
    }
LABEL_14:
    if (v6) {
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  int v27 = v4;
  char v18 = welcome & 1;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v19 = self->_activeDiscoveryCards;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (!v20) {
    goto LABEL_39;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v29;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v29 != v22) {
        objc_enumerationMutation(v19);
      }
      long long v24 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      uint64_t v25 = [v24 priority];
      if ((v18 & 1) == 0) {
        goto LABEL_32;
      }
      if ([(PKDiscoveryCardView *)self->_paymentWelcomeView priority] >= v25)
      {
        [(NSMutableArray *)self->_allActiveDiscoveryCards addObject:self->_paymentWelcomeView];
LABEL_32:
        char v18 = 0;
        if ((v6 & 1) == 0) {
          goto LABEL_36;
        }
        goto LABEL_33;
      }
      char v18 = 1;
      if ((v6 & 1) == 0) {
        goto LABEL_36;
      }
LABEL_33:
      if ([(PKDiscoveryCardView *)self->_passWelcomeView priority] < v25)
      {
        int v6 = 1;
        goto LABEL_37;
      }
      [(NSMutableArray *)self->_allActiveDiscoveryCards addObject:self->_passWelcomeView];
LABEL_36:
      int v6 = 0;
LABEL_37:
      [(NSMutableArray *)self->_allActiveDiscoveryCards addObject:v24];
    }
    uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v28 objects:v35 count:16];
  }
  while (v21);
LABEL_39:

  int v4 = v27;
  if ((v18 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_40:
  [(NSMutableArray *)self->_allActiveDiscoveryCards addObject:self->_paymentWelcomeView];
  if ((v6 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_15:
  [(NSMutableArray *)self->_allActiveDiscoveryCards addObject:self->_passWelcomeView];
LABEL_16:
  if (v4
    && [*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive cardSize] == 1
    && (PKDiscoveryForceIgnoreCEOCards() & 1) == 0)
  {
    *((unsigned char *)&self->_layoutState.cards.welcome + 3) = 1;
    [(PKDiscoveryGalleryView *)self _updateCardSizeIfNecessary];
  }
  int v13 = [(PKDiscoveryGalleryView *)self _shouldReverseLayoutDirection];
  allActiveDiscoveryCards = self->_allActiveDiscoveryCards;
  if (v13)
  {
    uint64_t v15 = [(NSMutableArray *)allActiveDiscoveryCards reverseObjectEnumerator];
    uint64_t v16 = [v15 allObjects];
    displayedCardViews = self->_displayedCardViews;
    self->_displayedCardViews = v16;
  }
  else
  {
    unint64_t v26 = (NSArray *)[(NSMutableArray *)allActiveDiscoveryCards copy];
    uint64_t v15 = self->_displayedCardViews;
    self->_displayedCardViews = v26;
  }

  [(PKDiscoveryGalleryView *)self setNeedsLayout];
  [(PKDiscoveryGalleryView *)self layoutIfNeeded];
}

void __42__PKDiscoveryGalleryView__updateCardViews__block_invoke(uint64_t a1, void *a2)
{
  int v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSetBarcodePassWelcomeCardDismissed();
    v4[2](v4, 1, 0);
  }
}

- (CGSize)_cardSize
{
  uint64_t v2 = [*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive cardSize];
  +[PKDiscoveryCardView compressedWidth];
  double v4 = v3;
  if (v2)
  {
    double v5 = 120.0;
  }
  else
  {
    +[PKDiscoveryCardView compressedHeight];
    double v5 = v6;
  }
  double v7 = v4;
  result.height = v5;
  result.width = v7;
  return result;
}

- (CGSize)_contentSize
{
  [(PKDiscoveryGalleryView *)self bounds];
  double v4 = v3;
  double v6 = v5 * (double)[(NSArray *)self->_displayedCardViews count];
  double v7 = v4;
  result.height = v7;
  result.width = v6;
  return result;
}

- (unint64_t)_indexForCardViewWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  allActiveDiscoveryCards = self->_allActiveDiscoveryCards;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PKDiscoveryGalleryView__indexForCardViewWithIdentifier___block_invoke;
  v9[3] = &unk_1E59D9430;
  id v6 = v4;
  id v10 = v6;
  unint64_t v11 = &v12;
  [(NSMutableArray *)allActiveDiscoveryCards enumerateObjectsUsingBlock:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __58__PKDiscoveryGalleryView__indexForCardViewWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = [a2 articleLayout];
  unint64_t v8 = [v7 itemIdentifier];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)_removeCardView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke;
  aBlock[3] = &unk_1E59CD7B0;
  void aBlock[4] = self;
  id v7 = v6;
  id v13 = v7;
  BOOL v14 = v4;
  unint64_t v8 = (void (**)(void))_Block_copy(aBlock);
  if (v4)
  {
    int v9 = [v7 superview];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_6;
    v10[3] = &unk_1E59CA9F8;
    unint64_t v11 = v8;
    +[PKPassDeleteAnimationController performPassbookDeleteWithView:v7 inSuperview:v9 completion:v10];
  }
  else
  {
    [v7 removeFromSuperview];
    v8[2](v8);
  }
}

void __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 480);
  uint64_t v2 = [*(id *)(a1 + 40) articleLayout];
  double v3 = *(void **)(a1 + 32);
  BOOL v4 = [v2 itemIdentifier];
  unint64_t v5 = [v3 _indexForCardViewWithIdentifier:v4];

  unint64_t v6 = [*(id *)(a1 + 32) displayIndex];
  unint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 408) count];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5 == v6)
    {
      if (v5 >= v7 - 1) {
        unint64_t v6 = v7 - 1;
      }
      else {
        unint64_t v6 = v5;
      }
    }
    else if (v6)
    {
      if (v5 < v6 || v5 >= v7)
      {
        if (v6 - 1 >= v7 - 1) {
          unint64_t v6 = v7 - 1;
        }
        else {
          --v6;
        }
      }
    }
  }
  [*(id *)(a1 + 32) _updateScrollViewToCardIndex:v6 animated:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v10 = *(void *)(a1 + 32);
  int v9 = *(void **)(a1 + 40);
  if (v9 == *(void **)(v10 + 448))
  {
    *(void *)(v10 + 448) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 488) &= ~1u;
    int v11 = 1;
  }
  else if (v9 == *(void **)(v10 + 440))
  {
    *(void *)(v10 + 440) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 488) &= ~2u;
    int v11 = 1;
    PKSetBarcodePassWelcomeCardDismissed();
  }
  else
  {
    objc_msgSend(*(id *)(v10 + 416), "removeObject:");
    int v11 = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 489) = *(unsigned char *)(*(void *)(a1 + 32) + 489) & 0xFE | ([*(id *)(*(void *)(a1 + 32) + 416) count] != 0);
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v12 + 489) & 1) == 0 && (*(unsigned char *)(v12 + 488) & 3) == 0)
  {
    id v13 = [MEMORY[0x1E4F84688] sharedInstance];
    [v13 removedAllDiscoveryItems];

    uint64_t v12 = *(void *)(a1 + 32);
  }
  [*(id *)(v12 + 408) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setDelegate:0];
  BOOL v14 = [*(id *)(*(void *)(a1 + 32) + 552) articleLayouts];
  uint64_t v15 = objc_msgSend(v14, "pk_arrayByRemovingObject:", v2);

  if (![*(id *)(*(void *)(a1 + 32) + 528) cardSize]
    && (v11 | [v2 entitledToForceLargeCard]) == 1)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 552) isMiniCardsAllowed])
    {
      if ((objc_msgSend(v15, "pk_containsObjectPassingTest:", &__block_literal_global_53) & 1) == 0)
      {
        uint64_t v16 = *(void *)(a1 + 32);
        if (!*(void *)(v16 + 448) && !*(void *)(v16 + 440)) {
          *(unsigned char *)(v16 + 491) = 1;
        }
      }
    }
  }
  if (([*(id *)(a1 + 32) _requestDismissalIfNecessaryAfterLayoutStateUpdate] & 1) == 0)
  {
    [*(id *)(a1 + 32) layoutIfNeeded];
    if (*(unsigned char *)(a1 + 48))
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_3;
      v24[3] = &unk_1E59CA7D0;
      v24[4] = *(void *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 4, v24, 0);
    }
    else
    {
      [*(id *)(a1 + 32) _updateCardViews];
      [*(id *)(a1 + 32) layoutIfNeeded];
    }
    [*(id *)(a1 + 32) _updatePageControlVisibilityWithDelay:0.65];
  }
  uint64_t v17 = [*(id *)(a1 + 40) dismissAction];
  char v18 = (void *)v17;
  if (v17)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_4;
    v22[3] = &unk_1E59D9458;
    v22[4] = *(void *)(a1 + 32);
    char v23 = v11;
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v22);
  }
  else
  {
    --*(void *)(*(void *)(a1 + 32) + 480);
    uint64_t v19 = *(void *)(a1 + 32);
    if (*(void *)(v19 + 480)) {
      char v20 = 1;
    }
    else {
      char v20 = v11;
    }
    if ((v20 & 1) == 0)
    {
      uint64_t v21 = [*(id *)(v19 + 552) articleLayouts];
      [(id)v19 updateArticleLayouts:v21];
    }
  }
}

uint64_t __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 entitledToForceLargeCard]) {
    uint64_t v3 = [v2 hasHitMaxLargeViewCount] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCardViews];
  id v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

void __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_4(uint64_t a1, uint64_t a2, char a3)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_5;
  v3[3] = &unk_1E59CD7D8;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  char v5 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_5(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 480);
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 480) && !*(unsigned char *)(a1 + 40))
  {
    if (!*(unsigned char *)(a1 + 41))
    {
      if ([*(id *)(v1 + 408) count]) {
        return;
      }
      uint64_t v1 = *(void *)(a1 + 32);
    }
    id v3 = [*(id *)(v1 + 552) articleLayouts];
    [(id)v1 updateArticleLayouts:v3];
  }
}

uint64_t __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_6(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (BOOL)_requestDismissalIfNecessaryAfterLayoutStateUpdate
{
  BOOL v3 = [(PKDiscoveryGalleryView *)self needsRemoval];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_subheaderDelegate);
    char v5 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained setNeedsUpdateForGroupStackViewSectionSubheaderView:self];
    }
  }
  return v3;
}

- (void)_updateScrollViewToCardIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = [(PKDiscoveryGalleryView *)self _shouldReverseLayoutDirection];
  NSUInteger v8 = [(NSArray *)self->_displayedCardViews count];
  unint64_t v9 = v8 - 1;
  unint64_t v10 = v8 - 1 - a3;
  if (v8 - 1 >= a3) {
    unint64_t v9 = a3;
  }
  if (!v8) {
    unint64_t v10 = 0;
  }
  if (v7) {
    unint64_t v9 = v10;
  }
  double v11 = (double)v9;
  [(UIScrollView *)self->_horizontalScrollView bounds];
  double v12 = CGRectGetWidth(v15) * v11;
  horizontalScrollView = self->_horizontalScrollView;

  -[UIScrollView setContentOffset:animated:](horizontalScrollView, "setContentOffset:animated:", v4, v12, 0.0);
}

- (void)_pageControlChanged:(id)a3
{
  unint64_t v4 = [(PKDiscoveryGalleryView *)self displayIndex];
  NSInteger v5 = [(UIPageControl *)self->_pageControl currentPage];
  if (v4 != v5)
  {
    [(PKDiscoveryGalleryView *)self _updateScrollViewToCardIndex:v5 animated:1];
    [(PKDiscoveryGalleryView *)self _reportCurrentDiscoveryCardToDiscoveryService];
  }
}

- (void)updatePageControlFrame
{
  [(PKDiscoveryGalleryView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PKDiscoveryGalleryView *)self _cardSize];
  CGFloat v12 = v11 + -5.0;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  CGRectDivide(v15, &slice, &v13, v12, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UIPageControl setFrame:](self->_pageControl, "setFrame:");
}

- (void)_updatePageControlWithDisplayIndex
{
  unint64_t v3 = [(PKDiscoveryGalleryView *)self displayIndex];
  if (v3 != [(UIPageControl *)self->_pageControl currentPage])
  {
    [(UIPageControl *)self->_pageControl setCurrentPage:v3];
    [(PKDiscoveryGalleryView *)self _reportCurrentDiscoveryCardToDiscoveryService];
  }
}

- (void)_updatePageControlVisibilityWithDelay:(double)a3
{
  unint64_t v5 = [(NSMutableArray *)self->_allActiveDiscoveryCards count];
  [(UIPageControl *)self->_pageControl setHidden:v5 < 2];
  if (v5 != [(UIPageControl *)self->_pageControl numberOfPages]) {
    [(UIPageControl *)self->_pageControl setNumberOfPages:v5];
  }
  if (v5 >= 2) {
    [(PKDiscoveryGalleryView *)self addSubview:self->_pageControl];
  }
  else {
    [(UIPageControl *)self->_pageControl removeFromSuperview];
  }
  [(PKDiscoveryGalleryView *)self updatePageControlFrame];
  id v13 = [(UIPageControl *)self->_pageControl layer];
  [v13 opacity];
  BOOL v6 = v5 > 1;
  double v7 = *(float *)&v8;
  HIDWORD(v8) = 0;
  if (v5 <= 1) {
    double v9 = 0.0;
  }
  else {
    double v9 = 1.0;
  }
  if (v7 == v9)
  {
    *(float *)&double v8 = (float)v6;
    [v13 setOpacity:v8];
  }
  else
  {
    CGFloat v10 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
    objc_msgSend(v10, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v7, v9);
    [v10 setBeginTime:a3];
    *(float *)&double v11 = (float)v6;
    [v13 setOpacity:v11];
    if (v10)
    {
      id v12 = (id)objc_msgSend(v13, "pkui_addAdditiveAnimation:", v10);
    }
  }
}

- (void)_reportCurrentDiscoveryCardToDiscoveryService
{
  if (!BYTE1(self->_lastReportedDiscoveryItemIdentifier)) {
    return;
  }
  uint64_t v3 = [(NSMutableArray *)self->_allActiveDiscoveryCards count];
  int64_t v4 = [(PKDiscoveryGalleryView *)self displayIndex];
  if (v3 < 1) {
    return;
  }
  int64_t v5 = v4;
  if (v4 < 0 || v4 >= v3) {
    return;
  }
  char v20 = [(NSMutableArray *)self->_allActiveDiscoveryCards objectAtIndex:v4];
  BOOL v6 = [(PKDiscoveryCardView *)v20 articleLayout];
  double v7 = [v6 card];
  double v8 = [v7 callToAction];
  uint64_t v9 = [v8 action];

  CGFloat v10 = [(PKDiscoveryCardView *)v20 articleLayout];
  double v11 = [v10 itemIdentifier];

  if (v20 == self->_paymentWelcomeView || v20 == self->_passWelcomeView)
  {
    uint64_t v17 = *(void **)&self->_visibilityState;
    char v18 = [(PKDiscoveryCardView *)v20 articleLayout];
    uint64_t v19 = [v18 item];
    objc_msgSend(v17, "displayedDiscoveryItem:isWelcomeCard:afterSwipingToCard:multipleStoryCardsAvailable:callToAction:cardSize:", v19, 1, v5 != 0, (unint64_t)v3 > 1, v9, objc_msgSend(*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, "cardSize"));

    uint64_t v16 = (void *)*((void *)&self->_layoutState + 1);
    *((void *)&self->_layoutState + 1) = 0;
    goto LABEL_11;
  }
  if (([v11 isEqualToString:*((void *)&self->_layoutState + 1)] & 1) == 0)
  {
    id v12 = *(void **)&self->_visibilityState;
    id v13 = [(PKDiscoveryCardView *)v20 articleLayout];
    BOOL v14 = [v13 item];
    objc_msgSend(v12, "displayedDiscoveryItem:isWelcomeCard:afterSwipingToCard:multipleStoryCardsAvailable:callToAction:cardSize:", v14, 0, v5 != 0, (unint64_t)v3 > 1, v9, objc_msgSend(*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, "cardSize"));

    id v15 = v11;
    uint64_t v16 = (void *)*((void *)&self->_layoutState + 1);
    *((void *)&self->_layoutState + 1) = v15;
LABEL_11:
  }
}

- (unint64_t)displayIndex
{
  int v3 = [(PKDiscoveryGalleryView *)self _shouldReverseLayoutDirection];
  [(UIScrollView *)self->_horizontalScrollView bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  uint64_t v12 = [(NSMutableArray *)self->_allActiveDiscoveryCards count];
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  unint64_t v13 = (unint64_t)fmax(fmin(CGRectGetMidX(v16) / v9, (double)(unint64_t)(v12 - 1)), 0.0);
  if (v3)
  {
    NSUInteger v14 = [(NSArray *)self->_displayedCardViews count];
    if (v14) {
      return v14 + ~v13;
    }
    else {
      return 0;
    }
  }
  return v13;
}

- (NSString)frontmostItemIdentifier
{
  if ([(NSMutableArray *)self->_allActiveDiscoveryCards count])
  {
    int v3 = [(NSMutableArray *)self->_allActiveDiscoveryCards objectAtIndexedSubscript:[(PKDiscoveryGalleryView *)self displayIndex]];
    double v4 = [v3 articleLayout];
    CGFloat v5 = [v4 itemIdentifier];
  }
  else
  {
    CGFloat v5 = 0;
  }

  return (NSString *)v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_horizontalScrollView == a3)
  {
    if (([a3 _isAnimatingScroll] & 1) == 0) {
      [(PKDiscoveryGalleryView *)self _updatePageControlWithDisplayIndex];
    }
    [(PKDiscoveryGalleryView *)self setNeedsLayout];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (self->_horizontalScrollView == a3 && !a4)
  {
    [(PKDiscoveryGalleryView *)self _updatePageControlWithDisplayIndex];
    [(PKDiscoveryGalleryView *)self setNeedsLayout];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_horizontalScrollView == a3)
  {
    [(PKDiscoveryGalleryView *)self _updatePageControlWithDisplayIndex];
    [(PKDiscoveryGalleryView *)self setNeedsLayout];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  if (self->_horizontalScrollView == a3)
  {
    [(PKDiscoveryGalleryView *)self _contentSize];
    double v5 = v4;
    double v7 = v6;
    [(UIScrollView *)self->_horizontalScrollView contentSize];
    if (v5 != v9 || v7 != v8) {
      -[UIScrollView setContentSize:](self->_horizontalScrollView, "setContentSize:", v5, v7);
    }
    [(PKDiscoveryGalleryView *)self _updatePageControlWithDisplayIndex];
    [(PKDiscoveryGalleryView *)self setNeedsLayout];
  }
}

- (void)discoveryArticleViewController:(id)a3 tappedCallToAction:(id)a4 item:(id)a5
{
  double v6 = *(void **)&self->_visibilityState;
  double v7 = *(void **)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive;
  id v8 = a5;
  id v9 = a4;
  objc_msgSend(v6, "tappedDiscoveryItem:callToAction:cardSize:", v8, v9, objc_msgSend(v7, "cardSize"));
}

- (void)discoveryCardViewTapped:(id)a3
{
  id v17 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subheaderDelegate);
  if (WeakRetained)
  {
    double v5 = [v17 articleLayout];
    double v6 = [[PKDiscoveryArticleViewController alloc] initWithArticleLayout:v5 referrerIdentifier:0 cardTemplateInformation:*(void *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive];
    [(PKDiscoveryArticleViewController *)v6 setModalInPresentation:1];
    [(PKDiscoveryArticleViewController *)v6 setDelegate:self];
    double v7 = [v17 callToActionTappedOverride];
    [(PKDiscoveryArticleViewController *)v6 setCallToActionTappedOverride:v7];

    [WeakRetained groupStackViewSectionSubheaderView:self transitionToViewController:v6];
    BOOL v8 = [(NSMutableArray *)self->_allActiveDiscoveryCards indexOfObject:v17] != 0;
    uint64_t v9 = [(NSMutableArray *)self->_activeDiscoveryCards count];
    if (self->_passWelcomeView) {
      uint64_t v10 = v9 + 1;
    }
    else {
      uint64_t v10 = v9;
    }
    if (self->_paymentWelcomeView) {
      uint64_t v11 = v10 + 1;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t v12 = [v5 card];
    unint64_t v13 = [v12 callToAction];
    uint64_t v14 = [v13 action];

    id v15 = [MEMORY[0x1E4F84688] sharedInstance];
    CGRect v16 = [v5 itemIdentifier];
    objc_msgSend(v15, "expandedDiscoveryItemWithIdentifier:callToAction:afterSwipingToCard:multipleStoryCardsAvailable:cardSize:", v16, v14, v8, v11 > 1, objc_msgSend(*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, "cardSize"));
  }
}

- (void)discoveryCardViewRemoveTapped:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    double v7 = v4;
    char v6 = [v4 isRemoving];
    double v5 = v7;
    if ((v6 & 1) == 0)
    {
      [v7 setRemoving:1];
      [(PKDiscoveryGalleryView *)self _removeCardView:v7 animated:1];
      double v5 = v7;
    }
  }
}

- (void)discoveryCardViewCTATapped:(id)a3 callToAction:(id)a4 itemIdentifier:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 action];
  uint64_t v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v61 = v11;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Gallery view CTA (action=%ld) tapped", buf, 0xCu);
  }

  unint64_t v13 = [(PKDiscoveryGalleryView *)self cardViewForCardWithItemIdentifier:v10];

  uint64_t v14 = [v13 articleLayout];
  id v15 = [v14 item];

  objc_msgSend(*(id *)&self->_visibilityState, "tappedDiscoveryItem:callToAction:cardSize:", v15, v9, objc_msgSend(*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, "cardSize"));
  switch(v11)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 11:
      CGRect v16 = [MEMORY[0x1E4FB1438] sharedApplication];
      id v17 = [v16 delegate];
      char v18 = [v17 window];
      uint64_t v19 = [v18 rootViewController];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = [v9 paymentSetupMode];
        uint64_t v21 = [v9 referrerIdentifier];
        uint64_t v22 = [v9 paymentNetworks];
        [v9 transitNetworkIdentifiers];
        v58 = v15;
        char v23 = v13;
        v25 = id v24 = v8;
        unint64_t v26 = [v9 allowedFeatureIdentifiers];
        int v27 = [v9 productIdentifiers];
        [v19 startPaymentPreflight:v24 withPaymentSetupMode:v20 referrerIdentifier:v21 paymentNetworks:v22 transitNetworkIdentifiers:v25 allowedFeatureIdentifiers:v26 productIdentifiers:v27];

        id v8 = v24;
        unint64_t v13 = v23;
        id v15 = v58;
      }
      goto LABEL_27;
    case 4:
      id v28 = [NSString alloc];
      long long v29 = (void *)MEMORY[0x1E4F87F48];
      goto LABEL_25;
    case 5:
      uint64_t v19 = PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
      long long v30 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v30 openSensitiveURL:v19 withOptions:0];

      id v31 = [MEMORY[0x1E4F84688] sharedInstance];
      [v31 completedDiscoveryItemCTAWithCompletion:0];
      goto LABEL_26;
    case 6:
      long long v32 = [MEMORY[0x1E4FB1438] sharedApplication];
      id v33 = [v32 delegate];
      uint64_t v34 = [v33 window];
      uint64_t v19 = [v34 rootViewController];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_27;
      }
      if (PKPeerPaymentIsSetup())
      {
        [v19 presentPeerPaymentPassAnimated:1 completion:0];
      }
      else
      {
        id v31 = objc_alloc_init(MEMORY[0x1E4F84D60]);
        [v31 setRegistrationFlowState:0];
        [v19 presentPeerPaymentSetupWithConfiguration:v31];
LABEL_26:
      }
LABEL_27:

LABEL_28:
      return;
    case 7:
      CGRect v35 = [MEMORY[0x1E4FB1438] sharedApplication];
      uint64_t v36 = [v35 delegate];
      double v37 = [v36 window];
      uint64_t v19 = [v37 rootViewController];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v19 presentCreateAccountUserInvitationWithCompletion:0];
      }
      goto LABEL_27;
    case 8:
      double v38 = [MEMORY[0x1E4FB1438] sharedApplication];
      v39 = [v38 delegate];
      uint64_t v40 = [v39 window];
      uint64_t v19 = [v40 rootViewController];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v41 = v19;
      }
      else {
        uint64_t v41 = 0;
      }
      id v42 = v41;
      v43 = [v9 appStoreAppIdentifier];
      [v42 presentAppStorePageForItemWithIdentifier:v43];

      goto LABEL_23;
    case 9:
      id v44 = [v9 allowedFeatureIdentifiers];
      v45 = [v44 anyObject];
      uint64_t v46 = PKFeatureIdentifierFromString();

      if (!v46) {
        goto LABEL_28;
      }
      v47 = NSString;
      uint64_t v48 = *MEMORY[0x1E4F87FB0];
      uint64_t v49 = *MEMORY[0x1E4F87F50];
      v50 = PKFeatureIdentifierToString();
      uint64_t v19 = [v47 stringWithFormat:@"//%@/%@/%@", v48, v49, v50];

      v43 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v19];
      [v43 setScheme:*MEMORY[0x1E4F88088]];
      v51 = [v9 referrerIdentifier];
      if (v51)
      {
        id v52 = objc_alloc(MEMORY[0x1E4F290C8]);
        v53 = (void *)[v52 initWithName:*MEMORY[0x1E4F87FC8] value:v51];
        v59 = v53;
        v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
        [v43 setQueryItems:v54];
      }
      v55 = [v43 URL];
      if (v55)
      {
        v56 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        [v56 openURL:v55 withOptions:0];
      }
LABEL_23:

      goto LABEL_27;
    case 10:
      id v28 = [NSString alloc];
      long long v29 = (void *)MEMORY[0x1E4F87F58];
LABEL_25:
      uint64_t v19 = (void *)[v28 initWithFormat:@"prefs:root=PASSBOOK&path=%@", *v29];
      id v31 = [MEMORY[0x1E4F1CB10] URLWithString:v19];
      v57 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v57 openSensitiveURL:v31 withOptions:0];

      goto LABEL_26;
    default:
      goto LABEL_28;
  }
}

- (BOOL)needsRemoval
{
  return !*(void *)&self->_visibilityState || (*(_WORD *)&self->_layoutState.cards.welcome & 0x103) == 0;
}

- (int64_t)scrollType
{
  return 1;
}

- (void)setSectionsState:(id *)a3
{
  double v5 = objc_opt_class();
  long long v6 = *((_OWORD *)&a3->var0 + 1);
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  unsigned __int8 v7 = [v5 _welcomeStateForState:v13];
  $FED95A779F944789D45F91CDF1F04AC3 welcome = self->_layoutState.cards.welcome;
  if (((*(unsigned char *)&welcome ^ v7) & 3) != 0)
  {
    unsigned __int8 v9 = v7;
    int v10 = *((unsigned __int8 *)&self->_layoutState.cards.welcome + 1);
    *(unsigned char *)&self->_layoutState.cards.$FED95A779F944789D45F91CDF1F04AC3 welcome = v7;
    *((unsigned char *)&self->_layoutState.cards.welcome + 2) = *((unsigned char *)&self->_layoutState.cards.welcome + 2) & 0xFE | *((unsigned char *)a3 + 24) & 1;
    if (v7 & 1) == 0 && (*(unsigned char *)&welcome)
    {
      [(PKDiscoveryCardView *)self->_paymentWelcomeView removeFromSuperview];
      paymentWelcomeView = self->_paymentWelcomeView;
      self->_paymentWelcomeView = 0;
    }
    if ((v9 & 2) == 0 && (*(unsigned char *)&welcome & 2) != 0)
    {
      [(PKDiscoveryCardView *)self->_passWelcomeView removeFromSuperview];
      passWelcomeView = self->_passWelcomeView;
      self->_passWelcomeView = 0;
    }
    if (!self->_paymentWelcomeView && !self->_passWelcomeView) {
      *((unsigned char *)&self->_layoutState.cards.welcome + 3) = 1;
    }
    [(PKDiscoveryGalleryView *)self _requestDismissalIfNecessaryAfterLayoutStateUpdate];
    [(PKDiscoveryGalleryView *)self _updateCardViewsAnimated:((*(unsigned int *)&welcome | (v10 << 8)) & 0x103) != 0];
  }
}

- (void)setSubheaderDelegate:(id)a3
{
}

+ (id)passWelcomeCardMessageAttributedString
{
  void v19[5] = *MEMORY[0x1E4F143B8];
  id v2 = PKLocalizedString(&cfstr_PassShelf1Body.isa);
  unint64_t v3 = PKUIGetMinScreenWidthType() - 1;
  if (v3 >= 8) {
    double v4 = 0.0;
  }
  else {
    double v4 = 2.0;
  }
  double v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  long long v6 = [v5 objectForKey:*MEMORY[0x1E4F1C438]];

  if (v6
    && (([v6 isEqualToString:@"zh"] & 1) != 0
     || ([v6 isEqualToString:@"ja"] & 1) != 0
     || [v6 isEqualToString:@"ko"]))
  {
    double v4 = v4 + 2.0;
  }
  if (v3 >= 8) {
    double v7 = 9.5;
  }
  else {
    double v7 = 12.5;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v8 setAlignment:1];
  [v8 setParagraphSpacing:v7];
  [v8 setLineSpacing:v4];
  id v9 = objc_alloc_init(MEMORY[0x1E4FB0858]);
  objc_msgSend(v9, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [v9 setShadowColor:0];
  [v9 setShadowBlurRadius:0.0];
  v18[0] = *MEMORY[0x1E4FB06F8];
  int v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
  v19[0] = v10;
  v18[1] = *MEMORY[0x1E4FB0700];
  uint64_t v11 = [MEMORY[0x1E4FB1618] blackColor];
  v19[1] = v11;
  v18[2] = *MEMORY[0x1E4FB06C0];
  uint64_t v12 = [MEMORY[0x1E4FB1618] clearColor];
  uint64_t v13 = *MEMORY[0x1E4FB0738];
  v19[2] = v12;
  v19[3] = v8;
  uint64_t v14 = *MEMORY[0x1E4FB0758];
  v18[3] = v13;
  v18[4] = v14;
  v19[4] = v9;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];

  CGRect v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v2 attributes:v15];

  return v16;
}

- (id)_createPaymentWelcomeCardView
{
  unint64_t v3 = PKPassKitUIBundle();
  uint64_t v4 = [v3 URLForResource:@"paymentWelcomeCard" withExtension:@"json"];

  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v4];
  uint64_t v25 = (void *)v4;
  if (v5)
  {
    long long v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:4 error:0];
  }
  else
  {
    long long v6 = 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F84680]);
  [v7 setIdentifier:@"paymentWelcomeCard"];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F84670]) initWithDictionary:v6];
  [v8 setItem:v7];
  id v9 = [v7 identifier];
  [v8 setItemIdentifier:v9];

  [v8 setPriority:*MEMORY[0x1E4F87198]];
  int v10 = PKPassKitBundle();
  [v8 localizeWithBundle:v10 table:@"Discovery_Localizable"];

  uint64_t v11 = [MEMORY[0x1E4F84D50] sharedService];
  int v12 = PKDeviceSupportsTransitWithWebService();
  uint64_t v13 = [(PKDiscoveryGalleryView *)self traitCollection];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if (PKDeviceSupportsFelicaDebitWithWebService() || (v14 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    int v17 = PKWebServiceFeaturesCredential();
    if (!v12 || v17)
    {
      if (PKPearlIsAvailable()) {
        char v18 = @"WELCOME_CARD_PAYMENTS_BODY_PEARL";
      }
      else {
        char v18 = @"WELCOME_CARD_PAYMENTS_BODY";
      }
    }
    else
    {
      char v18 = @"WELCOME_CARD_PAYMENTS_BODY_TRANSIT";
    }
    id v15 = PKLocalizedDiscoveryString(&v18->isa);
    CGRect v16 = 0;
    if (!v15) {
      goto LABEL_18;
    }
  }
  else
  {
    id v15 = PKLocalizedDiscoveryString(&cfstr_WelcomeCardPay.isa);
    CGRect v16 = PKLocalizedDiscoveryString(&cfstr_WelcomeCardPay_0.isa);
    if (!v15) {
      goto LABEL_18;
    }
  }
  uint64_t v19 = [v8 shelves];
  uint64_t v20 = [v19 objectAtIndexedSubscript:1];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v20 setLocalizedBody:v15];
  }

LABEL_18:
  if (v16)
  {
    uint64_t v21 = [v8 card];
    uint64_t v22 = [v21 callToAction];

    [v22 setLocalizedSubtitle:v16];
  }
  char v23 = [[PKDiscoveryCardView alloc] initWithArticleLayout:v8 dismissImage:self->_dismissImage cardTemplateInformation:self->_cardTemplateInformation isWelcomeCard:1];
  [(PKDiscoveryCardView *)v23 setDelegate:self];

  return v23;
}

- (id)_createPassWelcomeCardView
{
  unint64_t v3 = PKPassKitUIBundle();
  uint64_t v4 = [v3 URLForResource:@"passWelcomeCard" withExtension:@"json"];

  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v4];
  if (v5)
  {
    long long v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:4 error:0];
  }
  else
  {
    long long v6 = 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F84680]);
  [v7 setIdentifier:@"passWelcomeCard"];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F84670]) initWithDictionary:v6];
  [v8 setItemIdentifier:@"passWelcomeCard"];
  [v8 setItem:v7];
  [v8 setPriority:*MEMORY[0x1E4F87198]];
  id v9 = PKPassKitBundle();
  [v8 localizeWithBundle:v9 table:@"Discovery_Localizable"];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke;
  aBlock[3] = &unk_1E59D9480;
  objc_copyWeak(&v23, &location);
  uint64_t v20 = @"passWelcomeCard";
  id v10 = v8;
  id v21 = v10;
  uint64_t v22 = self;
  uint64_t v11 = _Block_copy(aBlock);
  int v12 = [[PKDiscoveryCardView alloc] initWithArticleLayout:v10 dismissImage:self->_dismissImage cardTemplateInformation:self->_cardTemplateInformation isWelcomeCard:1];
  if (*((unsigned char *)&self->_layoutState.cards.welcome + 2))
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    CGRect v16 = __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke_4;
    int v17 = &unk_1E59D9408;
    objc_copyWeak(&v18, &location);
    [(PKDiscoveryCardView *)v12 setDismissAction:&v14];
    objc_destroyWeak(&v18);
  }
  -[PKDiscoveryCardView setCallToActionTappedOverride:](v12, "setCallToActionTappedOverride:", v11, v14, v15, v16, v17);
  [(PKDiscoveryCardView *)v12 setDelegate:self];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v12;
}

void __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 56));
  id v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    double v5 = [MEMORY[0x1E4F84688] sharedInstance];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) card];
    id v8 = [v7 callToAction];
    objc_msgSend(v5, "tappedDiscoveryItemWithIdentifier:callToAction:cardSize:", v6, objc_msgSend(v8, "action"), objc_msgSend(*(id *)(*(void *)(a1 + 48) + 528), "cardSize"));

    id v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    id v10 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v11 = PKLocalizedDiscoveryString(&cfstr_PassWelcomeCar.isa);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke_2;
    v24[3] = &unk_1E59CCFF0;
    objc_copyWeak(&v25, &to);
    int v12 = [v10 actionWithTitle:v11 style:0 handler:v24];
    [v9 addAction:v12];

    uint64_t v13 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v14 = PKLocalizedDiscoveryString(&cfstr_PassWelcomeCar_0.isa);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke_3;
    v22[3] = &unk_1E59CCFF0;
    objc_copyWeak(&v23, &to);
    uint64_t v15 = [v13 actionWithTitle:v14 style:0 handler:v22];
    [v9 addAction:v15];

    CGRect v16 = (void *)MEMORY[0x1E4FB1410];
    int v17 = PKLocalizedDiscoveryString(&cfstr_PassWelcomeCar_1.isa);
    id v18 = [v16 actionWithTitle:v17 style:1 handler:0];
    [v9 addAction:v18];

    id v19 = objc_loadWeakRetained(&to);
    uint64_t v20 = objc_msgSend(v19, "pkui_viewControllerFromResponderChain");
    id v21 = objc_msgSend(v20, "pkui_frontMostViewController");
    [v21 presentViewController:v9 animated:1 completion:0];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
  }
  objc_destroyWeak(&to);
}

void __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _appStorePressed];
}

void __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scanCodePressed];
}

void __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSetBarcodePassWelcomeCardDismissed();
    v4[2](v4, 1, 0);
  }
}

- (void)_scanCodePressed
{
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C98], 0);
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F875D0]];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (void)_appStorePressed
{
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85CA0], 0);
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F874E8]];
  [v3 openURL:v2 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (BOOL)isAnimatingCard
{
  return BYTE1(self->_welcomeCardTemplateInformation);
}

- (void)setAnimatingCard:(BOOL)a3
{
  BYTE1(self->_welcomeCardTemplateInformation) = a3;
}

- (PKDiscoveryDataSource)dataSource
{
  return *(PKDiscoveryDataSource **)&self->_visibilityState;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityState, 0);
  objc_storeStrong((id *)&self->_cardTemplateInformation, 0);
  objc_storeStrong((id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, 0);
  objc_storeStrong((id *)&self->_layoutState + 1, 0);
  objc_storeStrong((id *)&self->_dismissImage, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_horizontalScrollView, 0);
  objc_storeStrong((id *)&self->_paymentWelcomeView, 0);
  objc_storeStrong((id *)&self->_passWelcomeView, 0);
  objc_destroyWeak((id *)&self->_subheaderDelegate);
  objc_storeStrong((id *)&self->_displayedCardViews, 0);
  objc_storeStrong((id *)&self->_activeDiscoveryCards, 0);

  objc_storeStrong((id *)&self->_allActiveDiscoveryCards, 0);
}

@end