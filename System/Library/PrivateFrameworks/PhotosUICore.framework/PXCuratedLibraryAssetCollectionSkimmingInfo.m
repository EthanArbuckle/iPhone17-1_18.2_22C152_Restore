@interface PXCuratedLibraryAssetCollectionSkimmingInfo
- (BOOL)slideshowStarted;
- (BOOL)touchInteractionStarted;
- (PXDisplayCollection)parentAssetCollection;
- (PXIndexPathSet)childCollectionsIndexes;
- (PXSimpleIndexPath)currentChildCollectionIndexPath;
- (int64_t)childCollectionsZoomLevel;
- (void)setChildCollectionsIndexes:(id)a3;
- (void)setChildCollectionsZoomLevel:(int64_t)a3;
- (void)setCurrentChildCollectionIndexPath:(PXSimpleIndexPath *)a3;
- (void)setParentAssetCollection:(id)a3;
- (void)setSlideshowStarted:(BOOL)a3;
- (void)setTouchInteractionStarted:(BOOL)a3;
@end

@implementation PXCuratedLibraryAssetCollectionSkimmingInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childCollectionsIndexes, 0);
  objc_storeStrong((id *)&self->_parentAssetCollection, 0);
}

- (void)setCurrentChildCollectionIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_currentChildCollectionIndexPath.item = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_currentChildCollectionIndexPath.dataSourceIdentifier = v3;
}

- (PXSimpleIndexPath)currentChildCollectionIndexPath
{
  long long v3 = *(_OWORD *)&self[1].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[1].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)setChildCollectionsIndexes:(id)a3
{
}

- (PXIndexPathSet)childCollectionsIndexes
{
  return self->_childCollectionsIndexes;
}

- (void)setChildCollectionsZoomLevel:(int64_t)a3
{
  self->_childCollectionsZoomLevel = a3;
}

- (int64_t)childCollectionsZoomLevel
{
  return self->_childCollectionsZoomLevel;
}

- (void)setParentAssetCollection:(id)a3
{
}

- (PXDisplayCollection)parentAssetCollection
{
  return self->_parentAssetCollection;
}

- (void)setTouchInteractionStarted:(BOOL)a3
{
  self->_touchInteractionStarted = a3;
}

- (BOOL)touchInteractionStarted
{
  return self->_touchInteractionStarted;
}

- (void)setSlideshowStarted:(BOOL)a3
{
  self->_slideshowStarted = a3;
}

- (BOOL)slideshowStarted
{
  return self->_slideshowStarted;
}

@end