@interface CollectionHandlerCollectionViewCell
- (BOOL)disabled;
- (BOOL)showsCheckmark;
- (CollectionHandlerCollectionViewCell)initWithFrame:(CGRect)a3;
- (CollectionHandlerInfo)collectionInfo;
- (unint64_t)collectionViewSize;
- (void)setCollectionInfo:(id)a3;
- (void)setCollectionViewSize:(unint64_t)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setShowCheckmark:(BOOL)a3;
@end

@implementation CollectionHandlerCollectionViewCell

- (CollectionHandlerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CollectionHandlerCollectionViewCell;
  v3 = -[CollectionHandlerCollectionViewCell initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [[CollectionView alloc] initWithCollectionViewSize:0];
    collectionView = v3->_collectionView;
    v3->_collectionView = v4;

    v6 = [(CollectionHandlerCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_collectionView];

    id v7 = objc_alloc((Class)MUEdgeLayout);
    v8 = v3->_collectionView;
    v9 = [(CollectionHandlerCollectionViewCell *)v3 contentView];
    id v10 = [v7 initWithItem:v8 container:v9];

    [v10 activate];
  }
  return v3;
}

- (CollectionHandlerInfo)collectionInfo
{
  return [(CollectionView *)self->_collectionView collectionInfo];
}

- (void)setCollectionInfo:(id)a3
{
}

- (unint64_t)collectionViewSize
{
  return [(CollectionView *)self->_collectionView collectionViewSize];
}

- (void)setCollectionViewSize:(unint64_t)a3
{
}

- (BOOL)disabled
{
  return [(CollectionView *)self->_collectionView disabled];
}

- (void)setDisabled:(BOOL)a3
{
}

- (BOOL)showsCheckmark
{
  return [(CollectionView *)self->_collectionView showsCheckmark];
}

- (void)setShowCheckmark:(BOOL)a3
{
}

- (void).cxx_destruct
{
}

@end