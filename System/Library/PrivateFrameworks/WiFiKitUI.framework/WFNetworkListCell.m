@interface WFNetworkListCell
- (BOOL)connectionError;
- (BOOL)personalHotspot;
- (BOOL)secure;
- (NSLayoutConstraint)signalImageViewCenterConstraint;
- (NSLayoutConstraint)stackViewBottomConstraint;
- (NSLayoutConstraint)stackViewTopConstraint;
- (NSString)subtitle;
- (NSString)title;
- (UIImageView)lockImageView;
- (UIImageView)signalImageView;
- (UILabel)nameLabel;
- (UILabel)subtitleLabel;
- (UIStackView)stackView;
- (WFAssociationStateView)associationStateView;
- (double)_verticalPadding;
- (id)imageFromSignalBars:(unint64_t)a3;
- (unint64_t)bars;
- (void)_adjustStackViewPadding;
- (void)_updateSignalImage;
- (void)_updateTextColorForLabel:(id)a3;
- (void)_updateTintColorForImageView:(id)a3;
- (void)awakeFromNib;
- (void)prepareForReuse;
- (void)setAssociationStateView:(id)a3;
- (void)setBars:(unint64_t)a3;
- (void)setConnectionError:(BOOL)a3;
- (void)setLockImageView:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setPersonalHotspot:(BOOL)a3;
- (void)setSecure:(BOOL)a3;
- (void)setSignalImageView:(id)a3;
- (void)setSignalImageViewCenterConstraint:(id)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewBottomConstraint:(id)a3;
- (void)setStackViewTopConstraint:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFNetworkListCell

- (void)awakeFromNib
{
  v20.receiver = self;
  v20.super_class = (Class)WFNetworkListCell;
  [(WFNetworkListCell *)&v20 awakeFromNib];
  v3 = [(WFNetworkListCell *)self nameLabel];
  [v3 setNumberOfLines:0];

  v4 = [(WFNetworkListCell *)self nameLabel];
  [(WFNetworkListCell *)self _updateTextColorForLabel:v4];

  v5 = [(WFNetworkListCell *)self subtitleLabel];
  [v5 setNumberOfLines:0];

  v6 = [MEMORY[0x263F81708] preferredFontForStyle:*MEMORY[0x263F83588] weight:*MEMORY[0x263F81838]];
  v7 = [(WFNetworkListCell *)self subtitleLabel];
  [v7 setFont:v6];

  v8 = [(WFNetworkListCell *)self subtitleLabel];
  [(WFNetworkListCell *)self _updateTextColorForLabel:v8];

  [(WFNetworkListCell *)self setState:0];
  v9 = [(WFNetworkListCell *)self lockImageView];
  [v9 setHidden:1];

  v10 = +[WFImageCache sharedImageCache];
  v11 = [v10 imageNamed:@"Lock"];
  v12 = [v11 imageWithRenderingMode:2];
  v13 = [(WFNetworkListCell *)self lockImageView];
  [v13 setImage:v12];

  v14 = [(WFNetworkListCell *)self lockImageView];
  [(WFNetworkListCell *)self _updateTintColorForImageView:v14];

  v15 = [(WFNetworkListCell *)self signalImageView];
  [v15 setHidden:1];

  v16 = [(WFNetworkListCell *)self imageFromSignalBars:3];
  v17 = [v16 imageWithRenderingMode:2];
  v18 = [(WFNetworkListCell *)self signalImageView];
  [v18 setImage:v17];

  v19 = [(WFNetworkListCell *)self signalImageView];
  [(WFNetworkListCell *)self _updateTintColorForImageView:v19];

  [(WFNetworkListCell *)self _adjustStackViewPadding];
}

- (void)_adjustStackViewPadding
{
  [(WFNetworkListCell *)self _verticalPadding];
  double v4 = v3 + -8.0;
  v5 = [(WFNetworkListCell *)self stackViewTopConstraint];
  [v5 setConstant:v4];

  [(WFNetworkListCell *)self _verticalPadding];
  double v7 = v6 + -8.0;
  id v8 = [(WFNetworkListCell *)self stackViewBottomConstraint];
  [v8 setConstant:v7];
}

- (double)_verticalPadding
{
  double v3 = [(WFNetworkListCell *)self nameLabel];
  uint64_t v4 = [v3 font];
  [(id)v4 _bodyLeading];
  double v6 = v5 * 0.5;

  double v7 = [(WFNetworkListCell *)self subtitleLabel];
  LOBYTE(v4) = [v7 isHidden];

  if ((v4 & 1) == 0)
  {
    id v8 = [(WFNetworkListCell *)self subtitleLabel];
    v9 = [v8 font];
    [v9 _bodyLeading];
    double v6 = v6 + v10 * -0.5;

    if (v6 < 0.0) {
      return 0.0;
    }
  }
  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4 = [a3 preferredContentSizeCategory];
  double v5 = [(WFNetworkListCell *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  char v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    [(WFNetworkListCell *)self _adjustStackViewPadding];
    id v9 = [(WFNetworkListCell *)self subtitleLabel];
    LODWORD(v8) = 1.0;
    [v9 _setHyphenationFactor:v8];
  }
}

- (void)setState:(int64_t)a3
{
  id v4 = [(WFNetworkListCell *)self associationStateView];
  [v4 setState:a3];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)WFNetworkListCell;
  [(WFNetworkListCell *)&v4 prepareForReuse];
  [(WFNetworkListCell *)self setTitle:0];
  [(WFNetworkListCell *)self setSubtitle:0];
  double v3 = [(WFNetworkListCell *)self lockImageView];
  [v3 setHidden:1];

  [(WFNetworkListCell *)self setState:0];
  [(WFNetworkListCell *)self setAccessoryType:0];
  self->_bars = -1;
  [(WFNetworkListCell *)self setConnectionError:0];
  [(WFNetworkListCell *)self setPersonalHotspot:0];
  [(WFNetworkListCell *)self setSecure:0];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nameLabel);
  [WeakRetained setText:v5];
}

- (void)setSubtitle:(id)a3
{
  id v14 = a3;
  objc_storeStrong((id *)&self->_subtitle, a3);
  id v5 = [(WFNetworkListCell *)self subtitleLabel];
  if (v14)
  {
    [v5 setHidden:0];

    double v6 = [(WFNetworkListCell *)self subtitleLabel];
    [v6 setText:v14];

    if ([(WFNetworkListCell *)self connectionError])
    {
      char v7 = [MEMORY[0x263F825C8] systemOrangeColor];
      double v8 = [(WFNetworkListCell *)self subtitleLabel];
      [v8 setTextColor:v7];

      id v9 = (void *)MEMORY[0x263F81708];
      uint64_t v10 = *MEMORY[0x263F83588];
      v11 = (double *)MEMORY[0x263F81828];
    }
    else
    {
      v12 = [(WFNetworkListCell *)self subtitleLabel];
      [(WFNetworkListCell *)self _updateTextColorForLabel:v12];

      id v9 = (void *)MEMORY[0x263F81708];
      uint64_t v10 = *MEMORY[0x263F83588];
      v11 = (double *)MEMORY[0x263F81838];
    }
    id v5 = [v9 preferredFontForStyle:v10 weight:*v11];
    v13 = [(WFNetworkListCell *)self subtitleLabel];
    [v13 setFont:v5];
  }
  else
  {
    [v5 setHidden:1];
  }

  [(WFNetworkListCell *)self _adjustStackViewPadding];
}

- (void)setConnectionError:(BOOL)a3
{
  if (self->_connectionError != a3)
  {
    self->_connectionError = a3;
    [(WFNetworkListCell *)self _updateSignalImage];
  }
}

- (void)setPersonalHotspot:(BOOL)a3
{
  if (self->_personalHotspot != a3)
  {
    self->_personalHotspot = a3;
    [(WFNetworkListCell *)self _updateSignalImage];
  }
}

- (void)setBars:(unint64_t)a3
{
  if (self->_bars != a3)
  {
    self->_bars = a3;
    [(WFNetworkListCell *)self _updateSignalImage];
  }
}

- (void)setSecure:(BOOL)a3
{
  if (self->_secure != a3)
  {
    BOOL v3 = a3;
    self->_secure = a3;
    id v5 = [(WFNetworkListCell *)self lockImageView];
    id v9 = v5;
    if (v3)
    {
      [v5 setHidden:0];

      id v9 = +[WFImageCache sharedImageCache];
      double v6 = [v9 imageNamed:@"Lock"];
      char v7 = [v6 imageWithRenderingMode:2];
      double v8 = [(WFNetworkListCell *)self lockImageView];
      [v8 setImage:v7];
    }
    else
    {
      [v5 setHidden:1];
    }
  }
}

- (void)_updateSignalImage
{
  BOOL v3 = [(WFNetworkListCell *)self signalImageView];
  [v3 setHidden:0];

  if ([(WFNetworkListCell *)self connectionError])
  {
    objc_super v4 = +[WFImageCache sharedImageCache];
    id v5 = [v4 imageNamed:@"WiFiBarsError"];
    double v6 = [v5 imageWithRenderingMode:2];
    char v7 = [(WFNetworkListCell *)self signalImageView];
    [v7 setImage:v6];

    double v8 = [MEMORY[0x263F825C8] systemOrangeColor];
    id v9 = [(WFNetworkListCell *)self subtitleLabel];
    [v9 setTextColor:v8];

    uint64_t v10 = (void *)MEMORY[0x263F81708];
    uint64_t v11 = *MEMORY[0x263F83588];
    v12 = (double *)MEMORY[0x263F81828];
  }
  else
  {
    if ([(WFNetworkListCell *)self personalHotspot])
    {
      v13 = +[WFImageCache sharedImageCache];
      id v14 = [v13 imageNamed:@"Personal_Hotspot"];
      v15 = [v14 imageWithRenderingMode:2];
      v16 = [(WFNetworkListCell *)self signalImageView];
      [v16 setImage:v15];

      v17 = [(WFNetworkListCell *)self signalImageViewCenterConstraint];
      v18 = v17;
      double v19 = 1.0;
    }
    else
    {
      objc_super v20 = [(WFNetworkListCell *)self imageFromSignalBars:self->_bars];
      v21 = [v20 imageWithRenderingMode:2];
      v22 = [(WFNetworkListCell *)self signalImageView];
      [v22 setImage:v21];

      v23 = [(WFNetworkListCell *)self signalImageView];
      [(WFNetworkListCell *)self _updateTintColorForImageView:v23];

      v17 = [(WFNetworkListCell *)self signalImageViewCenterConstraint];
      v18 = v17;
      double v19 = 0.0;
    }
    [v17 setConstant:v19];

    v24 = [(WFNetworkListCell *)self subtitleLabel];
    [(WFNetworkListCell *)self _updateTextColorForLabel:v24];

    uint64_t v10 = (void *)MEMORY[0x263F81708];
    uint64_t v11 = *MEMORY[0x263F83588];
    v12 = (double *)MEMORY[0x263F81838];
  }
  id v26 = [v10 preferredFontForStyle:v11 weight:*v12];
  v25 = [(WFNetworkListCell *)self subtitleLabel];
  [v25 setFont:v26];
}

- (void)_updateTextColorForLabel:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F825C8];
  id v4 = a3;
  id v5 = [v3 defaultTextColor];
  [v4 setTextColor:v5];
}

- (void)_updateTintColorForImageView:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F825C8];
  id v4 = a3;
  id v5 = [v3 defaultTextColor];
  [v4 setTintColor:v5];
}

- (id)imageFromSignalBars:(unint64_t)a3
{
  if ((double)a3 / 3.0 <= 3.0) {
    double v3 = (double)a3 / 3.0;
  }
  else {
    double v3 = 1.0;
  }
  id v4 = +[WFImageCache sharedImageCache];
  id v5 = [v4 imageNamed:@"wifi" variableValue:v3];

  return v5;
}

- (unint64_t)bars
{
  return self->_bars;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)personalHotspot
{
  return self->_personalHotspot;
}

- (BOOL)secure
{
  return self->_secure;
}

- (BOOL)connectionError
{
  return self->_connectionError;
}

- (UIImageView)signalImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_signalImageView);
  return (UIImageView *)WeakRetained;
}

- (void)setSignalImageView:(id)a3
{
}

- (UIImageView)lockImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockImageView);
  return (UIImageView *)WeakRetained;
}

- (void)setLockImageView:(id)a3
{
}

- (UILabel)nameLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nameLabel);
  return (UILabel *)WeakRetained;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subtitleLabel);
  return (UILabel *)WeakRetained;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIStackView)stackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackView);
  return (UIStackView *)WeakRetained;
}

- (void)setStackView:(id)a3
{
}

- (NSLayoutConstraint)stackViewTopConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackViewTopConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setStackViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewBottomConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackViewBottomConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setStackViewBottomConstraint:(id)a3
{
}

- (WFAssociationStateView)associationStateView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associationStateView);
  return (WFAssociationStateView *)WeakRetained;
}

- (void)setAssociationStateView:(id)a3
{
}

- (NSLayoutConstraint)signalImageViewCenterConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_signalImageViewCenterConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setSignalImageViewCenterConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_signalImageViewCenterConstraint);
  objc_destroyWeak((id *)&self->_associationStateView);
  objc_destroyWeak((id *)&self->_stackViewBottomConstraint);
  objc_destroyWeak((id *)&self->_stackViewTopConstraint);
  objc_destroyWeak((id *)&self->_stackView);
  objc_destroyWeak((id *)&self->_subtitleLabel);
  objc_destroyWeak((id *)&self->_nameLabel);
  objc_destroyWeak((id *)&self->_lockImageView);
  objc_destroyWeak((id *)&self->_signalImageView);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end