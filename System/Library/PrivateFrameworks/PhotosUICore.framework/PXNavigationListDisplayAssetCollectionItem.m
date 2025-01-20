@interface PXNavigationListDisplayAssetCollectionItem
- (BOOL)isDeletable;
- (BOOL)isDraggable;
- (BOOL)isRenamable;
- (BOOL)isReorderable;
- (PXDisplayAssetCollection)collection;
- (PXNavigationListDisplayAssetCollectionItem)initWithIdentifier:(id)a3 title:(id)a4 displayAssetCollection:(id)a5 itemCount:(int64_t)a6 containerIdentifier:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)glyphImageName;
- (int64_t)indentationLevel;
- (void)setIndentationLevel:(int64_t)a3;
- (void)setReorderable:(BOOL)a3;
@end

@implementation PXNavigationListDisplayAssetCollectionItem

- (void).cxx_destruct
{
}

- (void)setIndentationLevel:(int64_t)a3
{
  self->_indentationLevel = a3;
}

- (int64_t)indentationLevel
{
  return self->_indentationLevel;
}

- (PXDisplayAssetCollection)collection
{
  return self->_collection;
}

- (BOOL)isDeletable
{
  return self->_deletable;
}

- (BOOL)isRenamable
{
  return self->_renamable;
}

- (void)setReorderable:(BOOL)a3
{
  self->_reorderable = a3;
}

- (BOOL)isReorderable
{
  return self->_reorderable;
}

- (id)glyphImageName
{
  v2 = [(PXNavigationListDisplayAssetCollectionItem *)self collection];
  if ((objc_msgSend(v2, "px_isRegularAlbum") & 1) != 0
    || (objc_msgSend(v2, "px_isUserSmartAlbum") & 1) != 0
    || (objc_msgSend(v2, "px_isSharedAlbum") & 1) != 0
    || (objc_msgSend(v2, "px_isMacSyncedRegularAlbum") & 1) != 0
    || (objc_msgSend(v2, "px_isMacSyncedFacesAlbum") & 1) != 0
    || (objc_msgSend(v2, "px_isMomentShare") & 1) != 0)
  {
    v3 = @"PXNavigationListItemImageNameEmptyAlbum";
  }
  else
  {
    objc_msgSend(v2, "px_symbolImageName");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (BOOL)isDraggable
{
  v2 = [(PXNavigationListDisplayAssetCollectionItem *)self collection];
  if (objc_msgSend(v2, "px_isPlacesSmartAlbum")) {
    LOBYTE(v3) = 0;
  }
  else {
    int v3 = objc_msgSend(v2, "px_isMyPhotoStreamAlbum") ^ 1;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PXNavigationListDisplayAssetCollectionItem;
  v5 = -[PXNavigationListItem copyWithZone:](&v10, sel_copyWithZone_);
  v5[64] = [(PXNavigationListDisplayAssetCollectionItem *)self isReorderable];
  v5[65] = [(PXNavigationListDisplayAssetCollectionItem *)self isRenamable];
  v5[66] = [(PXNavigationListDisplayAssetCollectionItem *)self isDeletable];
  v6 = [(PXNavigationListDisplayAssetCollectionItem *)self collection];
  uint64_t v7 = [v6 copyWithZone:a3];
  v8 = (void *)*((void *)v5 + 9);
  *((void *)v5 + 9) = v7;

  *((void *)v5 + 10) = [(PXNavigationListDisplayAssetCollectionItem *)self indentationLevel];
  return v5;
}

- (PXNavigationListDisplayAssetCollectionItem)initWithIdentifier:(id)a3 title:(id)a4 displayAssetCollection:(id)a5 itemCount:(int64_t)a6 containerIdentifier:(id)a7
{
  id v13 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PXNavigationListDisplayAssetCollectionItem;
  v14 = [(PXNavigationListItem *)&v16 initWithIdentifier:a3 title:a4 itemCount:a6 containerIdentifier:a7];
  if (v14)
  {
    v14->_reorderable = objc_msgSend(v13, "px_isMacSyncedAlbum") ^ 1;
    v14->_renamable = objc_msgSend(v13, "px_isRenamable");
    v14->_deletable = objc_msgSend(v13, "px_isDeletable");
    objc_storeStrong((id *)&v14->_collection, a5);
  }

  return v14;
}

@end