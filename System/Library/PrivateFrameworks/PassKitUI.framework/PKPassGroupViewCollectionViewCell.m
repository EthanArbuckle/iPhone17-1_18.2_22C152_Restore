@interface PKPassGroupViewCollectionViewCell
- (PKPassGroupView)groupView;
- (void)layoutSubviews;
- (void)setGroupView:(id)a3;
@end

@implementation PKPassGroupViewCollectionViewCell

- (void)setGroupView:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_groupView, a3);
  if (self->_groupView)
  {
    v5 = [(PKPassGroupView *)self->_groupView superview];

    if (!v5)
    {
      v6 = [(PKPassGroupViewCollectionViewCell *)self contentView];
      [v6 addSubview:self->_groupView];

      [(PKPassGroupViewCollectionViewCell *)self setNeedsLayout];
    }
  }
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)PKPassGroupViewCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v20 layoutSubviews];
  if (self->_groupView)
  {
    v3 = [(PKPassGroupViewCollectionViewCell *)self contentView];
    v4 = [(PKPassGroupView *)self->_groupView superview];
    if (v4 == v3)
    {
      [(PKPassGroupView *)self->_groupView center];
      double v6 = v5;
      double v8 = v7;
      double v9 = *MEMORY[0x1E4F1DAD8];
      double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);

      if (v6 == v9 && v8 == v10)
      {
        [(PKPassGroupView *)self->_groupView bounds];
        [(PKPassGroupView *)self->_groupView anchorPoint];
        double v13 = v12;
        double v15 = v14;
        [v3 bounds];
        PKSizeAlignedInRect();
        -[PKPassGroupView setCenter:](self->_groupView, "setCenter:", v16 + v13 * v17, v18 + v15 * v19);
      }
    }
    else
    {
    }
  }
}

- (PKPassGroupView)groupView
{
  return self->_groupView;
}

- (void).cxx_destruct
{
}

@end