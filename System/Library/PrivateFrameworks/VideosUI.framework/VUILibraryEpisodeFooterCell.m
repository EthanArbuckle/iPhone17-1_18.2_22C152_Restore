@interface VUILibraryEpisodeFooterCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSNumber)storeID;
- (NSString)title;
- (VUIButton)titleButton;
- (VUILibraryEpisodeFooterCell)initWithFrame:(CGRect)a3;
- (VUILibraryEpisodeFooterCellDelegate)delegate;
- (VUISeparatorView)bottomSeparatorView;
- (VUISeparatorView)topSeparatorView;
- (void)layoutSubviews;
- (void)setBottomSeparatorView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleButton:(id)a3;
- (void)setTopSeparatorView:(id)a3;
@end

@implementation VUILibraryEpisodeFooterCell

- (VUILibraryEpisodeFooterCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VUILibraryEpisodeFooterCell;
  v3 = -[VUILibraryEpisodeFooterCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUISeparatorView);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v4;

    [(VUILibraryEpisodeFooterCell *)v3 addSubview:v3->_bottomSeparatorView];
    v6 = objc_alloc_init(VUISeparatorView);
    topSeparatorView = v3->_topSeparatorView;
    v3->_topSeparatorView = v6;

    [(VUILibraryEpisodeFooterCell *)v3 addSubview:v3->_topSeparatorView];
    v8 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [(VUILibraryEpisodeFooterCell *)v3 setBackgroundColor:v8];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3 = (void *)MEMORY[0x1E4FB1F48];
  [(VUILibraryEpisodeFooterCell *)self bounds];
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v28));
  double v5 = v4;
  double v7 = v6;
  topSeparatorView = self->_topSeparatorView;
  [(VUILibraryEpisodeFooterCell *)self bounds];
  -[VUIBaseView sizeThatFits:](topSeparatorView, "sizeThatFits:", CGRectGetWidth(v29) - (v5 + v7), 1.79769313e308);
  double v10 = v9;
  double v12 = v11;
  bottomSeparatorView = self->_bottomSeparatorView;
  [(VUILibraryEpisodeFooterCell *)self bounds];
  -[VUIBaseView sizeThatFits:](bottomSeparatorView, "sizeThatFits:", CGRectGetWidth(v30) - (v5 + v7), 1.79769313e308);
  double v15 = v14;
  double v17 = v16;
  v18 = [(VUIButton *)self->_titleButton textContentView];
  [(VUILibraryEpisodeFooterCell *)self bounds];
  objc_msgSend(v18, "sizeThatFits:", CGRectGetWidth(v31), 1.79769313e308);
  double v20 = v19;
  double v22 = v21;

  -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v5, 0.0, v10, v12);
  v23 = self->_bottomSeparatorView;
  [(VUILibraryEpisodeFooterCell *)self bounds];
  -[VUISeparatorView setFrame:](v23, "setFrame:", v5, CGRectGetMaxY(v32), v15, v17);
  titleButton = self->_titleButton;
  [(VUILibraryEpisodeFooterCell *)self bounds];
  double v25 = CGRectGetMidX(v33) - v20 * 0.5;
  [(VUILibraryEpisodeFooterCell *)self bounds];
  double v26 = CGRectGetMidY(v34) - v22 * 0.5;
  -[VUIButton setFrame:](titleButton, "setFrame:", v25, v26, v20, v22);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v4 = [(VUILibraryEpisodeFooterCell *)self traitCollection];
  +[VUIUtilities scaleContentSizeValue:v4 forTraitCollection:54.0];
  double v6 = v5;

  double v7 = v6 + 0.0;
  double v8 = width;
  result.height = v7;
  result.CGFloat width = v8;
  return result;
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  p_title = &self->_title;
  if (![(NSString *)self->_title isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_title, a3);
    if (*p_title)
    {
      double v7 = objc_alloc_init(VUITextLayout);
      double v8 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
      [(VUITextLayout *)v7 setColor:v8];

      [(VUITextLayout *)v7 setTextStyle:13];
      [(VUITextLayout *)v7 setMaximumContentSizeCategory:12];
      double v9 = [VUIButton alloc];
      double v10 = [(VUILibraryEpisodeFooterCell *)self traitCollection];
      double v11 = -[VUIButton initWithType:interfaceStyle:](v9, "initWithType:interfaceStyle:", 7, [v10 userInterfaceStyle]);
      titleButton = self->_titleButton;
      self->_titleButton = v11;

      v13 = +[VUILabel labelWithString:*p_title textLayout:v7 existingLabel:0];
      [(VUIButton *)self->_titleButton setTextContentView:v13];
      double v14 = self->_titleButton;
      double v15 = [(VUITextLayout *)v7 color];
      [(VUIButton *)v14 setTintColor:v15];

      objc_initWeak(&location, self);
      double v16 = self->_titleButton;
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      double v19 = __40__VUILibraryEpisodeFooterCell_setTitle___block_invoke;
      double v20 = &unk_1E6DF4400;
      objc_copyWeak(&v21, &location);
      [(VUIButton *)v16 setSelectActionHandler:&v17];
      -[VUILibraryEpisodeFooterCell addSubview:](self, "addSubview:", self->_titleButton, v17, v18, v19, v20);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

void __40__VUILibraryEpisodeFooterCell_setTitle___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 titleButtonPressedForStoreId:WeakRetained[81]];
}

- (NSString)title
{
  return self->_title;
}

- (NSNumber)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (VUILibraryEpisodeFooterCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUILibraryEpisodeFooterCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VUISeparatorView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (void)setTopSeparatorView:(id)a3
{
}

- (VUISeparatorView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (void)setBottomSeparatorView:(id)a3
{
}

- (VUIButton)titleButton
{
  return self->_titleButton;
}

- (void)setTitleButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end