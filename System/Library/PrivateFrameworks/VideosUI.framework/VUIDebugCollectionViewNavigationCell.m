@interface VUIDebugCollectionViewNavigationCell
- (UIImageView)accessoryView;
- (VUIDebugCollectionViewNavigationCell)initWithFrame:(CGRect)a3;
- (VUILabel)titleLabel;
- (VUISeparatorView)separatorView;
- (VUITextLayout)titleLayout;
- (void)configureWithTitle:(id)a3;
- (void)layoutSubviews;
- (void)setAccessoryView:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLayout:(id)a3;
@end

@implementation VUIDebugCollectionViewNavigationCell

- (VUIDebugCollectionViewNavigationCell)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)VUIDebugCollectionViewNavigationCell;
  v3 = -[VUIDebugCollectionViewNavigationCell initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v4 setNumberOfLines:1];
    [(VUITextLayout *)v4 setNumberOfLinesAXSmall:1];
    [(VUITextLayout *)v4 setNumberOfLinesAXLarge:1];
    [(VUITextLayout *)v4 setTextStyle:3];
    [(VUITextLayout *)v4 setMaximumContentSizeCategory:3];
    v5 = [MEMORY[0x1E4FB1618] blackColor];
    [(VUITextLayout *)v4 setColor:v5];

    titleLayout = v3->_titleLayout;
    v3->_titleLayout = v4;
    v7 = v4;

    uint64_t v8 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v7 existingLabel:0];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (VUILabel *)v8;

    v10 = [(VUIDebugCollectionViewNavigationCell *)v3 contentView];
    [v10 addSubview:v3->_titleLabel];

    v11 = +[VUIImageResourceMap imageForResourceName:@"list-chevron"];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v11];
    accessoryView = v3->_accessoryView;
    v3->_accessoryView = (UIImageView *)v12;

    [(UIImageView *)v3->_accessoryView sizeToFit];
    v14 = [(VUIDebugCollectionViewNavigationCell *)v3 contentView];
    [v14 addSubview:v3->_accessoryView];

    v15 = [(VUIDebugCollectionViewNavigationCell *)v3 contentView];
    v16 = [MEMORY[0x1E4FB1618] whiteColor];
    [v15 setBackgroundColor:v16];

    v17 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
    [(VUIListCollectionViewCell *)v3 setHighlightedBackgroundColor:v17];

    v18 = objc_alloc_init(VUISeparatorView);
    separatorView = v3->_separatorView;
    v3->_separatorView = v18;

    [(VUIDebugCollectionViewNavigationCell *)v3 addSubview:v3->_separatorView];
  }
  return v3;
}

- (void)configureWithTitle:(id)a3
{
  id v7 = a3;
  v4 = [(VUIDebugCollectionViewNavigationCell *)self titleLayout];
  v5 = [(VUIDebugCollectionViewNavigationCell *)self titleLabel];
  id v6 = +[VUILabel labelWithString:v7 textLayout:v4 existingLabel:v5];
}

- (void)layoutSubviews
{
  [(VUIDebugCollectionViewNavigationCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding");
  double v12 = v11;
  double v14 = v13;
  double v35 = v13;
  v38.origin.x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  CGFloat Width = CGRectGetWidth(v38);
  v16 = (CGFloat *)MEMORY[0x1E4F1DB28];
  CGFloat v17 = Width - v12 - v14;
  CGFloat v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  v39.origin.x = v4;
  CGFloat rect = v4;
  v39.origin.y = v6;
  v39.size.width = v8;
  v39.size.height = v10;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v17, CGRectGetHeight(v39));
  double v20 = v19;
  double v22 = v21;
  v40.origin.x = v4;
  v40.origin.y = v6;
  v40.size.width = v8;
  v40.size.height = v10;
  double Height = CGRectGetHeight(v40);
  v41.origin.x = v12;
  v41.origin.y = v18;
  v41.size.width = v20;
  v41.size.height = v22;
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v12, (Height - CGRectGetHeight(v41)) * 0.5, v20, v22);
  CGFloat v24 = *v16;
  [(UIImageView *)self->_accessoryView bounds];
  double v26 = v25;
  double v28 = v27;
  [(VUIDebugCollectionViewNavigationCell *)self bounds];
  CGFloat v29 = CGRectGetWidth(v42) - v35;
  v43.origin.x = v24;
  v43.origin.y = v18;
  v43.size.width = v26;
  v43.size.height = v28;
  CGFloat v30 = v29 - CGRectGetWidth(v43);
  v44.origin.x = rect;
  v44.origin.y = v6;
  v44.size.width = v8;
  v44.size.height = v10;
  double v31 = CGRectGetHeight(v44);
  v45.origin.x = v30;
  v45.origin.y = v18;
  v45.size.width = v26;
  v45.size.height = v28;
  -[UIImageView setFrame:](self->_accessoryView, "setFrame:", v30, (v31 - CGRectGetHeight(v45)) * 0.5, v26, v28);
  separatorView = self->_separatorView;
  [(VUIDebugCollectionViewNavigationCell *)self bounds];
  double v33 = CGRectGetHeight(v46) + -1.0;
  v47.origin.x = rect;
  v47.origin.y = v6;
  v47.size.width = v8;
  v47.size.height = v10;
  double v34 = CGRectGetWidth(v47);
  -[VUISeparatorView setFrame:](separatorView, "setFrame:", 0.0, v33, v34, 1.0);
}

- (VUITextLayout)titleLayout
{
  return self->_titleLayout;
}

- (void)setTitleLayout:(id)a3
{
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
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
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleLayout, 0);
}

@end