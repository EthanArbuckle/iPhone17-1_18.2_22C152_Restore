@interface SearchUITrailerView
- (SFPunchout)punchout;
- (SearchUIButton)playButton;
- (SearchUITrailerView)initWithMediaItem:(id)a3 cardSectionView:(id)a4;
- (SearchUITrailersCardSectionView)cardSectionView;
- (TLKLabel)titleLabel;
- (UIView)centeredBoxView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)playTrailer;
- (void)setCardSectionView:(id)a3;
- (void)setCenteredBoxView:(id)a3;
- (void)setPlayButton:(id)a3;
- (void)setPunchout:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation SearchUITrailerView

- (SearchUITrailerView)initWithMediaItem:(id)a3 cardSectionView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SearchUITrailerView;
  v8 = [(SearchUITrailerView *)&v21 init];
  if (v8)
  {
    v9 = [v6 punchout];
    [(SearchUITrailerView *)v8 setPunchout:v9];

    [(SearchUITrailerView *)v8 setCardSectionView:v7];
    [(TLKStackView *)v8 setAxis:1];
    [(TLKStackView *)v8 setAlignment:3];
    [(NUIContainerStackView *)v8 setSpacing:4.0];
    [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:v8];
    v10 = objc_opt_new();
    [v10 setVerticalAlignment:3];
    [v10 setHorizontalAlignment:3];
    [(SearchUITrailerView *)v8 setCenteredBoxView:v10];
    [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:v10];
    [(TLKStackView *)v8 addArrangedSubview:v10];
    v11 = objc_opt_new();
    [v11 setUserInteractionEnabled:0];
    LODWORD(v12) = 1148846080;
    [v11 setContentHuggingPriority:0 forAxis:v12];
    [v10 addArrangedSubview:v11];
    v13 = [v6 thumbnail];
    [v11 updateWithImage:v13 fallbackImage:0 needsOverlayButton:1];

    v14 = [v11 overlayPlayButton];
    [v14 addTarget:v8 forAction:sel_playTrailer];

    v15 = [v11 overlayPlayButton];
    [v15 setContainerView:v10];

    v16 = [v11 overlayPlayButton];
    [(SearchUITrailerView *)v8 setPlayButton:v16];

    v17 = [MEMORY[0x1E4FAE0F8] secondaryLabel];
    v18 = [v6 title];
    [v17 setText:v18];

    v19 = [MEMORY[0x1E4FAE090] footnoteFont];
    [v17 setFont:v19];

    [(TLKStackView *)v8 addArrangedSubview:v17];
    [(SearchUITrailerView *)v8 setTitleLabel:v17];
  }
  return v8;
}

- (void)playTrailer
{
  id v17 = [(SearchUITrailerView *)self cardSectionView];
  v3 = [(SearchUITrailerView *)self punchout];
  id v4 = objc_alloc(MEMORY[0x1E4F99F30]);
  v5 = [v17 rowModel];
  id v6 = [v5 cardSection];
  id v7 = (void *)[v4 initWithCardSection:v6 destination:v3 triggerEvent:2 actionCardType:1];

  v8 = [v17 feedbackDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [v8 shouldHandleCardSectionEngagement:v7])
  {
    v9 = objc_opt_new();
    v10 = [v3 urls];
    v11 = [v10 firstObject];
    [v9 setUrl:v11];

    if (v9)
    {
      double v12 = objc_opt_new();
      [v12 setCommand:v9];
      v13 = [v17 rowModel];
      v14 = [v17 feedbackDelegate];
      v15 = +[SearchUIUtilities environmentForDelegate:v14];
      v16 = +[SearchUICommandHandler handlerForButton:v12 rowModel:v13 environment:v15];
      [v16 executeWithTriggerEvent:2];
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SearchUITrailerView;
  v5 = -[SearchUITrailerView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v6 = [(SearchUITrailerView *)self centeredBoxView];
  if (v5 == v6)
  {
    v8 = [(SearchUITrailerView *)self playButton];
    id v7 = [v8 hitView];
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (SearchUITrailersCardSectionView)cardSectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardSectionView);
  return (SearchUITrailersCardSectionView *)WeakRetained;
}

- (void)setCardSectionView:(id)a3
{
}

- (SearchUIButton)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
}

- (TLKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setPunchout:(id)a3
{
}

- (UIView)centeredBoxView
{
  return self->_centeredBoxView;
}

- (void)setCenteredBoxView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredBoxView, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_destroyWeak((id *)&self->_cardSectionView);
}

@end