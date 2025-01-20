@interface PKDiscoveryArticleLayoutCell
- (PKDiscoveryShelfView)shelfView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setShelfView:(id)a3;
@end

@implementation PKDiscoveryArticleLayoutCell

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryArticleLayoutCell;
  [(PKDiscoveryArticleLayoutCell *)&v5 layoutSubviews];
  shelfView = self->_shelfView;
  v4 = [(PKDiscoveryArticleLayoutCell *)self contentView];
  [v4 bounds];
  -[PKDiscoveryShelfView setFrame:](shelfView, "setFrame:");
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PKDiscoveryArticleLayoutCell;
  [(PKDiscoveryArticleLayoutCell *)&v4 prepareForReuse];
  [(PKDiscoveryShelfView *)self->_shelfView removeFromSuperview];
  shelfView = self->_shelfView;
  self->_shelfView = 0;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PKDiscoveryArticleLayoutCell;
  objc_super v4 = [(PKDiscoveryArticleLayoutCell *)&v13 preferredLayoutAttributesFittingAttributes:a3];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[PKDiscoveryShelfView sizeThatFits:](self->_shelfView, "sizeThatFits:", v9, 1.79769313e308);
  objc_msgSend(v4, "setBounds:", v6, v8, v10, v11);

  return v4;
}

- (void)setShelfView:(id)a3
{
  objc_storeStrong((id *)&self->_shelfView, a3);
  id v5 = a3;
  double v6 = [(PKDiscoveryArticleLayoutCell *)self contentView];
  [v6 addSubview:v5];

  [(PKDiscoveryArticleLayoutCell *)self setNeedsLayout];
}

- (PKDiscoveryShelfView)shelfView
{
  return self->_shelfView;
}

- (void).cxx_destruct
{
}

@end