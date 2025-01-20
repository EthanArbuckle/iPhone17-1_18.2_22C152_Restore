@interface PXFeedDummyItemLayoutFactory
- (id)createLayoutForFeedItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4 viewModel:(id)a5 initialReferenceSize:(CGSize)a6 thumbnailAsset:(id *)a7;
@end

@implementation PXFeedDummyItemLayoutFactory

- (id)createLayoutForFeedItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4 viewModel:(id)a5 initialReferenceSize:(CGSize)a6 thumbnailAsset:(id *)a7
{
  id v8 = a4;
  v9 = objc_alloc_init(PXFeedDummyItemLayout);
  long long v10 = *(_OWORD *)&a3->item;
  v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v13[1] = v10;
  v11 = [v8 objectAtIndexPath:v13];

  [(PXFeedDummyItemLayout *)v9 setRepresentedObject:v11];
  return v9;
}

@end