@interface PXCollectionsDataSource
- (id)collectionAtIndexPath:(id)a3;
- (id)collectionListForSection:(int64_t)a3;
- (id)content;
- (id)existingAssetsFetchResultAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)indexPathForCollection:(id)a3;
- (int64_t)countForCollection:(id)a3;
@end

@implementation PXCollectionsDataSource

- (void).cxx_destruct
{
}

- (id)content
{
  return self->_content;
}

- (id)existingAssetsFetchResultAtIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (int64_t)countForCollection:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)collectionListForSection:(int64_t)a3
{
  return 0;
}

- (id)collectionAtIndexPath:(id)a3
{
  return 0;
}

- (id)indexPathForCollection:(id)a3
{
  return 0;
}

@end