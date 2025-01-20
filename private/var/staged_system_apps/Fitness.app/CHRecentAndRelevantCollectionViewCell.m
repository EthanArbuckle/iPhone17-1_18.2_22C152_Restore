@interface CHRecentAndRelevantCollectionViewCell
- (UICollectionView)collectionView;
- (void)setCollectionView:(id)a3;
@end

@implementation CHRecentAndRelevantCollectionViewCell

- (void)setCollectionView:(id)a3
{
  v5 = (UICollectionView *)a3;
  p_collectionView = &self->_collectionView;
  collectionView = self->_collectionView;
  if (collectionView != v5)
  {
    [(UICollectionView *)collectionView removeFromSuperview];
    objc_storeStrong((id *)&self->_collectionView, a3);
    v8 = [(CHRecentAndRelevantCollectionViewCell *)self contentView];
    [v8 addSubview:*p_collectionView];

    v9 = [(UICollectionView *)*p_collectionView leadingAnchor];
    v10 = [(CHRecentAndRelevantCollectionViewCell *)self contentView];
    v11 = [v10 leadingAnchor];
    v12 = [v9 constraintEqualToAnchor:v11];

    v13 = [(UICollectionView *)*p_collectionView trailingAnchor];
    v14 = [(CHRecentAndRelevantCollectionViewCell *)self contentView];
    v15 = [v14 trailingAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];

    v17 = [(UICollectionView *)*p_collectionView topAnchor];
    v18 = [(CHRecentAndRelevantCollectionViewCell *)self contentView];
    v19 = [v18 topAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];

    v21 = [(UICollectionView *)*p_collectionView bottomAnchor];
    v22 = [(CHRecentAndRelevantCollectionViewCell *)self contentView];
    v23 = [v22 bottomAnchor];
    v24 = [v21 constraintEqualToAnchor:v23];

    v26[0] = v12;
    v26[1] = v16;
    v26[2] = v20;
    v26[3] = v24;
    v25 = +[NSArray arrayWithObjects:v26 count:4];
    +[NSLayoutConstraint activateConstraints:v25];
  }
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
}

@end