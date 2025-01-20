@interface NewsCompletionHeaderView
- (NewsCompletionHeaderView)initWithReuseIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)setHeaderText:(id)a3;
@end

@implementation NewsCompletionHeaderView

- (NewsCompletionHeaderView)initWithReuseIdentifier:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)NewsCompletionHeaderView;
  v3 = [(NewsCompletionHeaderView *)&v17 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    v5 = [MEMORY[0x1E4FB1818] imageNamed:@"NewsSearchIcon"];
    uint64_t v6 = [v4 initWithImage:v5];
    newsImage = v3->_newsImage;
    v3->_newsImage = (UIImageView *)v6;

    v8 = [(NewsCompletionHeaderView *)v3 contentView];
    [v8 addSubview:v3->_newsImage];

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    newsLabel = v3->_newsLabel;
    v3->_newsLabel = v9;

    [(UILabel *)v3->_newsLabel setAdjustsFontForContentSizeCategory:1];
    v11 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v3->_newsLabel setBackgroundColor:v11];

    v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    [(UILabel *)v3->_newsLabel setFont:v12];

    v13 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_newsLabel setTextColor:v13];

    v14 = [(NewsCompletionHeaderView *)v3 contentView];
    [v14 addSubview:v3->_newsLabel];

    v15 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NewsCompletionHeaderView;
  [(NewsCompletionHeaderView *)&v13 layoutSubviews];
  [(NewsCompletionHeaderView *)self frame];
  double v4 = v3 * 0.5;
  double v5 = 19.0;
  double v6 = v3 * 0.5 * 1.6 + 19.0;
  int v7 = [(NewsCompletionHeaderView *)self _shouldReverseLayoutDirection];
  [(NewsCompletionHeaderView *)self frame];
  double v8 = CGRectGetWidth(v14) - v6;
  [(NewsCompletionHeaderView *)self frame];
  double Height = CGRectGetHeight(v15);
  newsLabel = self->_newsLabel;
  if (v7)
  {
    -[UILabel setFrame:](newsLabel, "setFrame:", 0.0, 0.0, v8, Height);
    [(NewsCompletionHeaderView *)self frame];
    CGFloat v11 = CGRectGetWidth(v16) + -19.0;
    p_newsImage = &self->_newsImage;
    [(UIImageView *)*p_newsImage frame];
    double v5 = v11 - CGRectGetWidth(v17);
  }
  else
  {
    -[UILabel setFrame:](newsLabel, "setFrame:", v6, 0.0, v8, Height);
    p_newsImage = &self->_newsImage;
  }
  -[UIImageView setFrame:](*p_newsImage, "setFrame:", v5, v4 * 0.5, v4, v4);
}

- (void)setHeaderText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsLabel, 0);
  objc_storeStrong((id *)&self->_newsImage, 0);
}

@end