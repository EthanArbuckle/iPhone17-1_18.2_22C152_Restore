@interface PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView
- (NSString)subtitle;
- (NSString)title;
- (PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
  id v5 = a3;
  [(UILabel *)self->_subtitleLabel setText:v5];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(UILabel *)self->_titleLabel setText:v5];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView;
  [(PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView *)&v7 layoutSubviews];
  [(PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5 * 0.5 + -3.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 4.0, 4.0);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", 4.0, 21.0, v4, v6);
}

- (PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView;
  double v3 = -[PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView *)v3 bounds];
    double v6 = v5;
    [(PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView *)v4 bounds];
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 3.0, v6, v7 + -4.0);
    v9 = [MEMORY[0x1E4FB1618] lightGrayColor];
    [v8 setBackgroundColor:v9];

    [(PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView *)v4 addSubview:v8];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v10;

    v12 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)v4->_titleLabel setTextColor:v12];

    [(PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView *)v4 addSubview:v4->_titleLabel];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v13;

    v15 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)v4->_subtitleLabel setTextColor:v15];

    [(PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView *)v4 addSubview:v4->_subtitleLabel];
  }
  return v4;
}

@end