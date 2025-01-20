@interface UICollectionViewDropPlaceholder
- (id)copyWithZone:(_NSZone *)a3;
- (void)previewParametersProvider;
- (void)setPreviewParametersProvider:(void *)previewParametersProvider;
@end

@implementation UICollectionViewDropPlaceholder

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UICollectionViewDropPlaceholder alloc];
  v5 = [(UICollectionViewPlaceholder *)self insertionIndexPath];
  v6 = [(UICollectionViewPlaceholder *)self cellReuseIdentifier];
  v7 = [(UICollectionViewPlaceholder *)v4 initWithInsertionIndexPath:v5 reuseIdentifier:v6];

  v8 = [(UICollectionViewPlaceholder *)self cellUpdateHandler];
  [(UICollectionViewPlaceholder *)v7 setCellUpdateHandler:v8];

  v9 = [(UICollectionViewDropPlaceholder *)self previewParametersProvider];
  [(UICollectionViewDropPlaceholder *)v7 setPreviewParametersProvider:v9];

  return v7;
}

- (void)previewParametersProvider
{
  return self->_previewParametersProvider;
}

- (void)setPreviewParametersProvider:(void *)previewParametersProvider
{
}

- (void).cxx_destruct
{
}

@end