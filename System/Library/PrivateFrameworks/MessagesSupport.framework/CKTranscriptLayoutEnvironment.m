@interface CKTranscriptLayoutEnvironment
- (CKTranscriptLayoutEnvironment)initWithDatasource:(id)a3 collectionLayoutEnvironment:(id)a4 collectionView:(id)a5 marginInsets:(UIEdgeInsets)a6 layoutContext:(int64_t)a7 messageEditingContext:(id)a8;
- (CKTranscriptLayoutMessageEditingContext)messageEditingContext;
- (NSCollectionLayoutEnvironment)collectionLayoutEnvironment;
- (UICollectionView)collectionView;
- (UIEdgeInsets)marginInsets;
- (id)datasource;
- (int64_t)layoutContext;
- (void)setCollectionLayoutEnvironment:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDatasource:(id)a3;
- (void)setLayoutContext:(int64_t)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setMessageEditingContext:(id)a3;
@end

@implementation CKTranscriptLayoutEnvironment

- (CKTranscriptLayoutEnvironment)initWithDatasource:(id)a3 collectionLayoutEnvironment:(id)a4 collectionView:(id)a5 marginInsets:(UIEdgeInsets)a6 layoutContext:(int64_t)a7 messageEditingContext:(id)a8
{
  CGFloat right = a6.right;
  CGFloat bottom = a6.bottom;
  CGFloat left = a6.left;
  CGFloat top = a6.top;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CKTranscriptLayoutEnvironment;
  v22 = [(CKTranscriptLayoutEnvironment *)&v25 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong(&v22->_datasource, a3);
    objc_storeStrong((id *)&v23->_collectionLayoutEnvironment, a4);
    objc_storeStrong((id *)&v23->_collectionView, a5);
    v23->_marginInsets.CGFloat top = top;
    v23->_marginInsets.CGFloat left = left;
    v23->_marginInsets.CGFloat bottom = bottom;
    v23->_marginInsets.CGFloat right = right;
    v23->_layoutContext = a7;
    objc_storeStrong((id *)&v23->_messageEditingContext, a8);
  }

  return v23;
}

- (id)datasource
{
  return self->_datasource;
}

- (void)setDatasource:(id)a3
{
}

- (NSCollectionLayoutEnvironment)collectionLayoutEnvironment
{
  return self->_collectionLayoutEnvironment;
}

- (void)setCollectionLayoutEnvironment:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UIEdgeInsets)marginInsets
{
  double top = self->_marginInsets.top;
  double left = self->_marginInsets.left;
  double bottom = self->_marginInsets.bottom;
  double right = self->_marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->_marginInsets = a3;
}

- (int64_t)layoutContext
{
  return self->_layoutContext;
}

- (void)setLayoutContext:(int64_t)a3
{
  self->_layoutContext = a3;
}

- (CKTranscriptLayoutMessageEditingContext)messageEditingContext
{
  return self->_messageEditingContext;
}

- (void)setMessageEditingContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageEditingContext, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionLayoutEnvironment, 0);
  objc_storeStrong(&self->_datasource, 0);
}

@end