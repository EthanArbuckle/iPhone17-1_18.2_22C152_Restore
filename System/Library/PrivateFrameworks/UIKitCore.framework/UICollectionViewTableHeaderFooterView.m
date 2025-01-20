@interface UICollectionViewTableHeaderFooterView
- (BOOL)floating;
- (UICollectionViewTableHeaderFooterView)initWithCoder:(id)a3;
- (UICollectionViewTableHeaderFooterView)initWithFrame:(CGRect)a3;
- (UICollectionViewTableHeaderFooterView)initWithReuseIdentifier:(id)a3;
- (UICollectionViewTableLayout)_tableLayout;
- (UICollectionViewTableLayoutAttributes)_tableAttributes;
- (UIColor)tintColor;
- (UILabel)detailTextLabel;
- (UILabel)textLabel;
- (UITableViewHeaderFooterView)tableViewHeaderFooterView;
- (UIView)backgroundView;
- (UIView)contentView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_commonInit;
- (void)applyLayoutAttributes:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundView:(id)a3;
- (void)setFloating:(BOOL)a3;
- (void)setTableViewHeaderFooterView:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation UICollectionViewTableHeaderFooterView

- (void)_commonInit
{
  v3 = [UITableViewHeaderFooterView alloc];
  v4 = [(UICollectionReusableView *)self reuseIdentifier];
  v5 = [(UITableViewHeaderFooterView *)v3 initWithReuseIdentifier:v4];

  [(UIView *)self addSubview:v5];
  [(UICollectionViewTableHeaderFooterView *)self setTableViewHeaderFooterView:v5];
}

- (UICollectionViewTableHeaderFooterView)initWithFrame:(CGRect)a3
{
  return -[UICollectionViewTableHeaderFooterView initWithReuseIdentifier:](self, "initWithReuseIdentifier:", &stru_1ED0E84C0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UICollectionViewTableHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UICollectionViewTableHeaderFooterView;
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v7 = a3;
  v8 = -[UICollectionReusableView initWithFrame:](&v10, sel_initWithFrame_, v3, v4, v5, v6);
  -[UICollectionReusableView _setReuseIdentifier:](v8, "_setReuseIdentifier:", v7, v10.receiver, v10.super_class);

  [(UICollectionViewTableHeaderFooterView *)v8 _commonInit];
  return v8;
}

- (UICollectionViewTableHeaderFooterView)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewTableHeaderFooterView;
  id v3 = a3;
  double v4 = [(UICollectionReusableView *)&v8 initWithCoder:v3];
  double v5 = objc_msgSend(v3, "decodeObjectForKey:", @"UITableViewHeaderFooterView", v8.receiver, v8.super_class);

  [(UICollectionViewTableHeaderFooterView *)v4 setTableViewHeaderFooterView:v5];
  double v6 = [(UICollectionViewTableHeaderFooterView *)v4 tableViewHeaderFooterView];
  [(UIView *)v4 addSubview:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewTableHeaderFooterView;
  id v4 = a3;
  [(UICollectionReusableView *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tableViewHeaderFooterView, @"UITableViewHeaderFooterView", v5.receiver, v5.super_class);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTableHeaderFooterView;
  [(UICollectionReusableView *)&v4 prepareForReuse];
  id v3 = [(UICollectionViewTableHeaderFooterView *)self tableViewHeaderFooterView];
  [v3 setNeedsLayout];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewTableHeaderFooterView;
  [(UIView *)&v12 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(UICollectionViewTableHeaderFooterView *)self tableViewHeaderFooterView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)applyLayoutAttributes:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewTableHeaderFooterView;
  [(UICollectionReusableView *)&v11 applyLayoutAttributes:a3];
  double v4 = [(UICollectionViewTableHeaderFooterView *)self _tableAttributes];
  double v5 = [(UICollectionReusableView *)self _collectionView];
  [(UITableViewHeaderFooterView *)self->_tableViewHeaderFooterView _setTableViewStyle:0 updateFrame:0];
  double v6 = [(UICollectionViewTableHeaderFooterView *)self _tableLayout];
  double v7 = [v6 _constants];
  [(UITableViewHeaderFooterView *)self->_tableViewHeaderFooterView _setConstants:v7];

  double v8 = [(UICollectionViewTableHeaderFooterView *)self _tableLayout];
  [(UITableViewHeaderFooterView *)self->_tableViewHeaderFooterView setTable:v8];

  -[UITableViewHeaderFooterView setSectionHeader:](self->_tableViewHeaderFooterView, "setSectionHeader:", [v4 isHeader]);
  [v4 maxTitleWidth];
  -[UITableViewHeaderFooterView setMaxTitleWidth:](self->_tableViewHeaderFooterView, "setMaxTitleWidth:");
  [v4 margins];
  [(UITableViewHeaderFooterView *)self->_tableViewHeaderFooterView _setMarginWidth:v9];
  [v4 margins];
  [(UITableViewHeaderFooterView *)self->_tableViewHeaderFooterView _setRightMarginWidth:v10];
  -[UITableViewHeaderFooterView setTextAlignment:](self->_tableViewHeaderFooterView, "setTextAlignment:", [v4 textAlignment]);
  -[UITableViewHeaderFooterView _setInsetsContentViewsToSafeArea:](self->_tableViewHeaderFooterView, "_setInsetsContentViewsToSafeArea:", [v4 insetsContentViewsToSafeArea]);
  [(UITableViewHeaderFooterView *)self->_tableViewHeaderFooterView _setupLabelAppearance];
  -[UICollectionViewTableHeaderFooterView setFloating:](self, "setFloating:", [v4 floating]);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._collectionView);
  uint64_t v6 = [WeakRetained collectionViewLayout];
  if (v6)
  {
    double v7 = (void *)v6;
    id v8 = objc_loadWeakRetained((id *)&self->super._collectionView);
    double v9 = [v8 collectionViewLayout];
    int v10 = [v9 _estimatesSizes];

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->super._collectionView);
      objc_super v12 = [v11 collectionViewLayout];
      int v13 = [v12 _cellsShouldConferWithAutolayoutEngineForSizingInfo];

      if (v13)
      {
        v14 = [(UICollectionViewTableHeaderFooterView *)self tableViewHeaderFooterView];
        _preferredAttributesFittingAttributesWithInnerView(self, v4, v14);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_7;
      }
    }
  }
  else
  {
  }
  id v15 = v4;
LABEL_7:

  return v15;
}

- (UICollectionViewTableLayout)_tableLayout
{
  v2 = [(UICollectionReusableView *)self _collectionView];
  double v3 = [v2 collectionViewLayout];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (UICollectionViewTableLayout *)v4;
}

- (UICollectionViewTableLayoutAttributes)_tableAttributes
{
  v2 = [(UICollectionReusableView *)self _layoutAttributes];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (UICollectionViewTableLayoutAttributes *)v3;
}

- (UIColor)tintColor
{
  v2 = [(UICollectionViewTableHeaderFooterView *)self tableViewHeaderFooterView];
  id v3 = [v2 tintColor];

  return (UIColor *)v3;
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(UICollectionViewTableHeaderFooterView *)self tableViewHeaderFooterView];
  [v5 setTintColor:v4];
}

- (UILabel)textLabel
{
  v2 = [(UICollectionViewTableHeaderFooterView *)self tableViewHeaderFooterView];
  id v3 = [v2 textLabel];

  return (UILabel *)v3;
}

- (UILabel)detailTextLabel
{
  v2 = [(UICollectionViewTableHeaderFooterView *)self tableViewHeaderFooterView];
  id v3 = [v2 detailTextLabel];

  return (UILabel *)v3;
}

- (UIView)contentView
{
  v2 = [(UICollectionViewTableHeaderFooterView *)self tableViewHeaderFooterView];
  id v3 = [v2 contentView];

  return (UIView *)v3;
}

- (UIView)backgroundView
{
  v2 = [(UICollectionViewTableHeaderFooterView *)self tableViewHeaderFooterView];
  id v3 = [v2 backgroundView];

  return (UIView *)v3;
}

- (void)setBackgroundView:(id)a3
{
  id v4 = a3;
  id v5 = [(UICollectionViewTableHeaderFooterView *)self tableViewHeaderFooterView];
  [v5 setBackgroundView:v4];
}

- (BOOL)floating
{
  return *(&self->_floating + 4);
}

- (void)setFloating:(BOOL)a3
{
  *(&self->_floating + 4) = a3;
}

- (UITableViewHeaderFooterView)tableViewHeaderFooterView
{
  return self->_tableViewHeaderFooterView;
}

- (void)setTableViewHeaderFooterView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end