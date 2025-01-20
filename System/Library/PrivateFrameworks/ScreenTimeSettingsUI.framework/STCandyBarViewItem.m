@interface STCandyBarViewItem
- (NSLayoutConstraint)widthConstraint;
- (STCandyBarViewItem)init;
- (UIImageView)sectionView;
- (void)setSectionView:(id)a3;
- (void)setWidthConstraint:(id)a3;
@end

@implementation STCandyBarViewItem

- (STCandyBarViewItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)STCandyBarViewItem;
  v2 = [(STCandyBarViewItem *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sectionView = v2->_sectionView;
    v2->_sectionView = (UIImageView *)v3;

    [(UIImageView *)v2->_sectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v2;
}

- (UIImageView)sectionView
{
  return self->_sectionView;
}

- (void)setSectionView:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);

  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end