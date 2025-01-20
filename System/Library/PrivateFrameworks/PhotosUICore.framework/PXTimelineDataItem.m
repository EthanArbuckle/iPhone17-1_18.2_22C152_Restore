@interface PXTimelineDataItem
- (PHAssetCollection)assetCollection;
- (PXTimelineCrop)suggestedCrop;
- (PXTimelineDataItem)initWithAssetCollection:(id)a3 suggestedCrop:(id)a4;
- (void)setAssetCollection:(id)a3;
- (void)setSuggestedCrop:(id)a3;
@end

@implementation PXTimelineDataItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_suggestedCrop, 0);
}

- (void)setAssetCollection:(id)a3
{
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setSuggestedCrop:(id)a3
{
}

- (PXTimelineCrop)suggestedCrop
{
  return self->_suggestedCrop;
}

- (PXTimelineDataItem)initWithAssetCollection:(id)a3 suggestedCrop:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXTimelineDataItem;
  v9 = [(PXTimelineDataItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetCollection, a3);
    objc_storeStrong((id *)&v10->_suggestedCrop, a4);
  }

  return v10;
}

@end