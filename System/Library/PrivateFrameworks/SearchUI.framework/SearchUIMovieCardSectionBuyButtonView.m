@interface SearchUIMovieCardSectionBuyButtonView
- (SFPunchout)punchout;
- (SearchUILabel)subtitleLabel;
- (SearchUIMovieCardSectionBuyButtonView)initWithTitle:(id)a3 subtitle:(id)a4 punchout:(id)a5 cardSectionView:(id)a6;
- (SearchUIMovieCardSectionView)cardSectionView;
- (SearchUIOfferButtonView)button;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)buttonPressed;
- (void)setButton:(id)a3;
- (void)setCardSectionView:(id)a3;
- (void)setPunchout:(id)a3;
- (void)setSubtitleLabel:(id)a3;
@end

@implementation SearchUIMovieCardSectionBuyButtonView

- (SearchUIMovieCardSectionBuyButtonView)initWithTitle:(id)a3 subtitle:(id)a4 punchout:(id)a5 cardSectionView:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)SearchUIMovieCardSectionBuyButtonView;
  v14 = [(SearchUIMovieCardSectionBuyButtonView *)&v30 init];
  v15 = v14;
  if (v14)
  {
    [(SearchUIMovieCardSectionBuyButtonView *)v14 setPunchout:v12];
    [(SearchUIMovieCardSectionBuyButtonView *)v15 setCardSectionView:v13];
    [(TLKStackView *)v15 setAxis:1];
    v16 = objc_opt_new();
    v17 = [v16 layer];
    [v17 setAllowsGroupOpacity:0];

    [v16 setAdjustsFontSizeToFitWidth:1];
    [v16 addTarget:v15 action:sel_buttonPressed forControlEvents:64];
    LODWORD(v18) = 1148846080;
    [v16 setContentHuggingPriority:1 forAxis:v18];
    LODWORD(v19) = 1148846080;
    [v16 setContentCompressionResistancePriority:1 forAxis:v19];
    if (v10) {
      [v16 setTitle:v10];
    }
    else {
      [v16 setSymbolImageName:@"play.fill"];
    }
    [(TLKStackView *)v15 addArrangedSubview:v16];
    [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:v15 forView:4.5];
    -[NUIContainerStackView setCustomSpacing:afterView:](v15, "setCustomSpacing:afterView:", v16);
    [(SearchUIMovieCardSectionBuyButtonView *)v15 setButton:v16];
    v20 = +[TLKLabel secondaryLabel];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __89__SearchUIMovieCardSectionBuyButtonView_initWithTitle_subtitle_punchout_cardSectionView___block_invoke;
    v27 = &unk_1E6E72620;
    id v21 = v20;
    id v28 = v21;
    id v29 = v11;
    [v21 performBatchUpdates:&v24];
    if (objc_msgSend(MEMORY[0x1E4FAE100], "isSuperLargeAccessibilitySize", v24, v25, v26, v27))
    {
      [(TLKStackView *)v15 setAlignment:3];
      [(TLKStackView *)v15 setAxis:0];
      [v21 setTextAlignment:4];
      [(NUIContainerStackView *)v15 setCustomSpacing:v16 afterView:12.0];
      objc_msgSend(v16, "setMinimumLayoutSize:", 100.0, 1.79769313e308);
      LODWORD(v22) = 1148846080;
      [v16 setContentCompressionResistancePriority:0 forAxis:v22];
    }
    [(TLKStackView *)v15 addArrangedSubview:v21];
    [(SearchUIMovieCardSectionBuyButtonView *)v15 setSubtitleLabel:v21];
  }
  return v15;
}

void __89__SearchUIMovieCardSectionBuyButtonView_initWithTitle_subtitle_punchout_cardSectionView___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4FAE090] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0] maximumContentSizeCategory:*MEMORY[0x1E4FB2788]];
  [*(id *)(a1 + 32) setFont:v3];
  [*(id *)(a1 + 32) setTextAlignment:1];
  [*(id *)(a1 + 32) setSfText:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setNumberOfLines:2];
  [*(id *)(a1 + 32) setAdjustsFontSizeToFitWidth:1];
  LODWORD(v2) = 1144750080;
  [*(id *)(a1 + 32) setContentHuggingPriority:1 forAxis:v2];
}

- (void)buttonPressed
{
  id v4 = [(SearchUIMovieCardSectionBuyButtonView *)self cardSectionView];
  id v3 = [(SearchUIMovieCardSectionBuyButtonView *)self punchout];
  [v4 openPunchout:v3 triggerEvent:2];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SearchUIMovieCardSectionBuyButtonView;
  -[SearchUIMovieCardSectionBuyButtonView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SearchUIMovieCardSectionBuyButtonView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
  {
    v7 = [(SearchUIMovieCardSectionBuyButtonView *)self button];
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (SearchUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (SearchUIOfferButtonView)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setPunchout:(id)a3
{
}

- (SearchUIMovieCardSectionView)cardSectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardSectionView);
  return (SearchUIMovieCardSectionView *)WeakRetained;
}

- (void)setCardSectionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cardSectionView);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
}

@end