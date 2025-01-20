@interface VUIDownloadShowTableHeaderView
- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)buttonTitle;
- (NSString)headerTitle;
- (UIButton)headerButton;
- (VUIDownloadShowTableHeaderView)initWithReuseIdentifier:(id)a3;
- (VUILabel)titleLabel;
- (VUISeparatorView)separatorView;
- (id)_buttonWithString:(id)a3 existingButton:(id)a4;
- (id)selectionHandler;
- (void)_selectButtonAction:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setButtonTitle:(id)a3;
- (void)setHeaderButton:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation VUIDownloadShowTableHeaderView

- (VUIDownloadShowTableHeaderView)initWithReuseIdentifier:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VUIDownloadShowTableHeaderView;
  v3 = [(VUIDownloadShowTableHeaderView *)&v11 initWithReuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(VUIDownloadShowTableHeaderView *)v3 contentView];
    v6 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [v5 setBackgroundColor:v6];

    v7 = objc_alloc_init(VUISeparatorView);
    separatorView = v4->_separatorView;
    v4->_separatorView = v7;

    v9 = [(VUIDownloadShowTableHeaderView *)v4 contentView];
    [v9 addSubview:v4->_separatorView];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)VUIDownloadShowTableHeaderView;
  [(VUIDownloadShowTableHeaderView *)&v3 prepareForReuse];
  [(VUIDownloadShowTableHeaderView *)self setHeaderTitle:0];
  [(VUIDownloadShowTableHeaderView *)self setButtonTitle:0];
  [(VUIDownloadShowTableHeaderView *)self setTitleLabel:0];
  [(VUIDownloadShowTableHeaderView *)self setHeaderButton:0];
}

- (void)setHeaderTitle:(id)a3
{
  v5 = (NSString *)a3;
  p_headerTitle = &self->_headerTitle;
  if (self->_headerTitle != v5)
  {
    v13 = v5;
    [(VUILabel *)self->_titleLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_headerTitle, a3);
    if (*p_headerTitle)
    {
      v7 = objc_alloc_init(VUITextLayout);
      [(VUITextLayout *)v7 setTextStyle:21];
      [(VUITextLayout *)v7 setFontWeight:0];
      [(VUITextLayout *)v7 setNumberOfLines:1];
      v8 = [MEMORY[0x1E4FB1618] systemGrayColor];
      [(VUITextLayout *)v7 setColor:v8];

      if (*p_headerTitle) {
        v9 = (__CFString *)*p_headerTitle;
      }
      else {
        v9 = &stru_1F3E921E0;
      }
      v10 = +[VUILabel labelWithString:v9 textLayout:v7 existingLabel:self->_titleLabel];
      titleLabel = self->_titleLabel;
      self->_titleLabel = v10;

      v12 = [(VUIDownloadShowTableHeaderView *)self contentView];
      [v12 addSubview:self->_titleLabel];
    }
    [(VUIDownloadShowTableHeaderView *)self setNeedsLayout];
    v5 = v13;
  }
}

- (void)setButtonTitle:(id)a3
{
  v5 = (NSString *)a3;
  p_buttonTitle = &self->_buttonTitle;
  if (self->_buttonTitle != v5)
  {
    v13 = v5;
    [(UIButton *)self->_headerButton removeFromSuperview];
    objc_storeStrong((id *)&self->_buttonTitle, a3);
    v7 = *p_buttonTitle;
    if (*p_buttonTitle)
    {
      v8 = [(VUIDownloadShowTableHeaderView *)self headerButton];
      v9 = [(VUIDownloadShowTableHeaderView *)self _buttonWithString:v7 existingButton:v8];

      [(UIButton *)v9 addTarget:self action:sel__selectButtonAction_ forControlEvents:64];
      headerButton = self->_headerButton;
      self->_headerButton = v9;
      objc_super v11 = v9;

      v12 = [(VUIDownloadShowTableHeaderView *)self contentView];
      [v12 addSubview:self->_headerButton];
    }
    [(VUIDownloadShowTableHeaderView *)self setNeedsLayout];
    v5 = v13;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUIDownloadShowTableHeaderView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadShowTableHeaderView;
  [(VUIDownloadShowTableHeaderView *)&v4 layoutSubviews];
  [(VUIDownloadShowTableHeaderView *)self bounds];
  double Width = CGRectGetWidth(v5);
  [(VUIDownloadShowTableHeaderView *)self bounds];
  -[VUIDownloadShowTableHeaderView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, CGRectGetHeight(v6));
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  [(VUILabel *)self->_titleLabel topMarginWithBaselineMargin:25.0];
  double v33 = v8;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
  double v10 = v9;
  double v12 = v11;
  -[UIButton sizeThatFits:](self->_headerButton, "sizeThatFits:", width, height);
  double v14 = v13;
  double v16 = v15;
  [(VUILabel *)self->_titleLabel bottomMarginWithBaselineMargin:10.0];
  double v32 = v17;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:", width);
  if (!v4)
  {
    double v20 = v18;
    double v21 = v19;
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v18, v33, v10, v12);
    [(VUIDownloadShowTableHeaderView *)self bounds];
    -[UIButton setFrame:](self->_headerButton, "setFrame:", width - (v14 + v21), CGRectGetMidY(v35) + height * -0.5, v14, v16);
    separatorView = self->_separatorView;
    v23 = [(VUIDownloadShowTableHeaderView *)self contentView];
    [v23 bounds];
    -[VUIBaseView sizeThatFits:](separatorView, "sizeThatFits:", CGRectGetWidth(v36) - v20, 1.79769313e308);
    double v25 = v24;
    double v27 = v26;

    v28 = self->_separatorView;
    v29 = [(VUIDownloadShowTableHeaderView *)self contentView];
    [v29 bounds];
    -[VUISeparatorView setFrame:](v28, "setFrame:", v20, CGRectGetHeight(v37) - v27, v25, v27);
  }
  double v30 = v33 + 0.0 + v12 + v32;
  double v31 = width;
  result.double height = v30;
  result.double width = v31;
  return result;
}

- (id)_buttonWithString:(id)a3 existingButton:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
    }
    else
    {
      id v7 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    }
    double v8 = v7;
    double v9 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
    [v8 setTitleColor:v9 forState:0];

    double v10 = [v8 titleLabel];
    double v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "vui_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", 13, 0, 0, 0.0);
    [v10 setFont:v11];

    double v12 = [v8 titleLabel];
    [v12 setNumberOfLines:1];

    double v13 = [v8 titleLabel];
    [v13 setAdjustsFontForContentSizeCategory:1];

    [v8 setTitle:v5 forState:0];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)_selectButtonAction:(id)a3
{
  selectionHandler = (void (**)(id, id))self->_selectionHandler;
  if (selectionHandler) {
    selectionHandler[2](selectionHandler, a3);
  }
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIButton)headerButton
{
  return self->_headerButton;
}

- (void)setHeaderButton:(id)a3
{
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_headerButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end