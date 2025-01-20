@interface VUIDebugCollectionHeaderView
- (VUIDebugCollectionHeaderView)initWithFrame:(CGRect)a3;
- (VUILabel)titleLabel;
- (VUISeparatorView)separatorView;
- (VUITextLayout)titleLayout;
- (void)configureHeaderViewWithTitle:(id)a3;
- (void)layoutSubviews;
- (void)setSeparatorView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLayout:(id)a3;
@end

@implementation VUIDebugCollectionHeaderView

- (VUIDebugCollectionHeaderView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)VUIDebugCollectionHeaderView;
  v3 = -[VUIDebugCollectionHeaderView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v4 setTextStyle:14];
    [(VUITextLayout *)v4 setTextTransform:2];
    [(VUITextLayout *)v4 setNumberOfLines:1];
    [(VUITextLayout *)v4 setNumberOfLinesAXSmall:1];
    [(VUITextLayout *)v4 setNumberOfLinesAXLarge:1];
    [(VUITextLayout *)v4 setMaximumContentSizeCategory:3];
    v5 = [MEMORY[0x1E4FB1618] blackColor];
    [(VUITextLayout *)v4 setColor:v5];

    titleLayout = v3->_titleLayout;
    v3->_titleLayout = v4;
    v7 = v4;

    uint64_t v8 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v7 existingLabel:0];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (VUILabel *)v8;

    [(VUIDebugCollectionHeaderView *)v3 addSubview:v3->_titleLabel];
    v10 = objc_alloc_init(VUISeparatorView);
    separatorView = v3->_separatorView;
    v3->_separatorView = v10;

    [(VUIDebugCollectionHeaderView *)v3 addSubview:v3->_separatorView];
    v12 = [MEMORY[0x1E4FB1618] clearColor];

    [(VUIDebugCollectionHeaderView *)v3 setBackgroundColor:v12];
  }
  return v3;
}

- (void)configureHeaderViewWithTitle:(id)a3
{
  id v3 = +[VUILabel labelWithString:a3 textLayout:self->_titleLayout existingLabel:self->_titleLabel];
}

- (void)layoutSubviews
{
  [(VUIDebugCollectionHeaderView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding");
  double v12 = v11;
  double v14 = v13;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  CGFloat v15 = CGRectGetWidth(v26) - v12 - v14;
  CGFloat rect = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v15, CGRectGetHeight(v27));
  double v17 = v16;
  double v19 = v18;
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  double Height = CGRectGetHeight(v28);
  v29.origin.x = v12;
  v29.origin.y = rect;
  v29.size.width = v17;
  v29.size.height = v19;
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v12, Height - CGRectGetHeight(v29) + -5.0, v17, v19);
  separatorView = self->_separatorView;
  [(VUIDebugCollectionHeaderView *)self bounds];
  double v22 = CGRectGetHeight(v30) + -1.0;
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  double Width = CGRectGetWidth(v31);
  -[VUISeparatorView setFrame:](separatorView, "setFrame:", 0.0, v22, Width, 1.0);
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
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleLayout, 0);
}

@end