@interface SFNestedCollectionViewCell
- (UICollectionView)collectionView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_setUpCollectionViewIfNeeded;
- (void)setCollectionView:(id)a3;
@end

@implementation SFNestedCollectionViewCell

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SFNestedCollectionViewCell;
  v4 = [(SFNestedCollectionViewCell *)&v17 preferredLayoutAttributesFittingAttributes:a3];
  collectionView = self->_collectionView;
  if (collectionView)
  {
    v6 = [(UICollectionView *)collectionView superview];
    if (!v6
      || ([(SFNestedCollectionViewCell *)self contentView],
          v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6 == v7))
    {
      [(SFNestedCollectionViewCell *)self _setUpCollectionViewIfNeeded];
      [v4 size];
      double v9 = v8;
      double v11 = v10;
      uint64_t v12 = 11;
      do
      {
        double v13 = v11;
        v14 = [(SFNestedCollectionViewCell *)self contentView];
        [v14 bounds];
        -[UICollectionView setFrame:](self->_collectionView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v19), v11);

        [(UICollectionView *)self->_collectionView layoutIfNeeded];
        [(UICollectionView *)self->_collectionView contentSize];
        double v11 = fmax(v15, 60.0);
        if (_SFEqualWithEpsilon(v11, v13, 0.01)) {
          break;
        }
        double v13 = v11;
        --v12;
      }
      while (v12);
      objc_msgSend(v4, "setSize:", v9, v13);
    }
  }

  return v4;
}

- (void)_setUpCollectionViewIfNeeded
{
  v3 = [(SFNestedCollectionViewCell *)self contentView];
  collectionView = self->_collectionView;
  if (collectionView)
  {
    double v9 = v3;
    v5 = [(UICollectionView *)collectionView superview];

    v3 = v9;
    if (v5 != v9)
    {
      v6 = [(UICollectionView *)self->_collectionView superview];

      if (v6) {
        [(UICollectionView *)self->_collectionView removeFromSuperview];
      }
      [(UICollectionView *)self->_collectionView setAutoresizingMask:0];
      v7 = [MEMORY[0x1E4FB1618] clearColor];
      [(UICollectionView *)self->_collectionView setBackgroundColor:v7];

      [v9 bounds];
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
      [(UICollectionView *)self->_collectionView setScrollEnabled:0];
      [(UICollectionView *)self->_collectionView setScrollsToTop:0];
      [v9 addSubview:self->_collectionView];
      double v8 = [MEMORY[0x1E4FB1498] _listInsetGroupedCellConfiguration];
      [(SFNestedCollectionViewCell *)self setBackgroundConfiguration:v8];

      v3 = v9;
    }
  }
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end