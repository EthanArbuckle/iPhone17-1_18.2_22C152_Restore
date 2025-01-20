@interface PKPassPersonalizationHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPassPersonalizationHeaderView)initWithLogoImage:(id)a3 description:(id)a4;
- (unint64_t)state;
- (void)_configureForCurrentState;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setState:(unint64_t)a3;
@end

@implementation PKPassPersonalizationHeaderView

- (PKPassPersonalizationHeaderView)initWithLogoImage:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PKPassPersonalizationHeaderView;
  v8 = -[PKTableHeaderView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v7];
    v11 = objc_alloc_init(PKTableHeaderView);
    tableHeaderView = v8->_tableHeaderView;
    v8->_tableHeaderView = v11;

    [v9 setLineSpacing:-2.0];
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v9, 0, objc_msgSend(v10, "length"));
    [(PKTableHeaderView *)v8->_tableHeaderView setStyle:2];
    if (v6)
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6];
      [v13 setContentMode:1];
      objc_msgSend(v13, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 150.0, 40.0);
      [(PKTableHeaderView *)v8->_tableHeaderView setImageView:v13];
    }
    v14 = [(PKTableHeaderView *)v8->_tableHeaderView titleLabel];
    [v14 setNumberOfLines:1];

    v15 = [(PKTableHeaderView *)v8->_tableHeaderView titleLabel];
    [v15 setAdjustsFontSizeToFitWidth:1];

    v16 = [(PKTableHeaderView *)v8->_tableHeaderView titleLabel];
    [v16 setMinimumScaleFactor:0.5];

    v17 = [(PKTableHeaderView *)v8->_tableHeaderView subtitleLabel];
    [v17 setNumberOfLines:3];

    v18 = [(PKTableHeaderView *)v8->_tableHeaderView subtitleLabel];
    [v18 setAttributedText:v10];

    v19 = [(PKTableHeaderView *)v8->_tableHeaderView subtitleLabel];
    [v19 setAdjustsFontSizeToFitWidth:1];

    v20 = [(PKTableHeaderView *)v8->_tableHeaderView subtitleLabel];
    [v20 setMinimumScaleFactor:0.2];

    [(PKPassPersonalizationHeaderView *)v8 addSubview:v8->_tableHeaderView];
    [(PKPassPersonalizationHeaderView *)v8 _configureForCurrentState];
  }
  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPassPersonalizationHeaderView;
  [(PKPassPersonalizationHeaderView *)&v2 dealloc];
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(PKPassPersonalizationHeaderView *)self _configureForCurrentState];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKTableHeaderView sizeThatFits:](self->_tableHeaderView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassPersonalizationHeaderView;
  [(PKTableHeaderView *)&v4 layoutSubviews];
  tableHeaderView = self->_tableHeaderView;
  [(PKPassPersonalizationHeaderView *)self bounds];
  -[PKTableHeaderView setFrame:](tableHeaderView, "setFrame:");
}

- (void)_configureForCurrentState
{
  int v3 = 0;
  unint64_t state = self->_state;
  switch(state)
  {
    case 0uLL:
      id v6 = @"PERSONALZIATION_HEADER_READY_TITLE";
      uint64_t v5 = 0;
      goto LABEL_7;
    case 2uLL:
      int v3 = 0;
      uint64_t v5 = 1;
      id v6 = @"PERSONALZIATION_HEADER_SUCCESS_TITLE";
      goto LABEL_7;
    case 1uLL:
      uint64_t v5 = 0;
      int v3 = 1;
      id v6 = @"PERSONALZIATION_HEADER_PERSONALIZING_TITLE";
LABEL_7:
      PKLocalizedString(&v6->isa);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
  }
  id v13 = 0;
  uint64_t v5 = 0;
LABEL_9:
  id v7 = [(PKTableHeaderView *)self->_tableHeaderView titleLabel];
  [v7 setText:v13];

  v8 = [(PKTableHeaderView *)self->_tableHeaderView activityIndicator];
  uint64_t v9 = v3 ^ 1u;
  [v8 setHidden:v9];

  v10 = [(PKTableHeaderView *)self->_tableHeaderView checkmarkLayer];
  [v10 setRevealed:v5 animated:0];

  v11 = [(PKTableHeaderView *)self->_tableHeaderView activityIndicator];
  v12 = v11;
  if (v9) {
    [v11 stopAnimating];
  }
  else {
    [v11 startAnimating];
  }

  [(PKTableHeaderView *)self->_tableHeaderView setNeedsLayout];
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

@end