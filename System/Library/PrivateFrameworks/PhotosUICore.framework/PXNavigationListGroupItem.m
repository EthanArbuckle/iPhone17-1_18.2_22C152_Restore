@interface PXNavigationListGroupItem
+ (id)titleForIdentifier:(id)a3;
- (BOOL)isDraggable;
- (BOOL)isExpandable;
- (BOOL)isGroup;
- (PXNavigationListGroupItem)initWithIdentifier:(id)a3;
- (PXNavigationListGroupItem)initWithIdentifier:(id)a3 collection:(id)a4;
- (id)collection;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation PXNavigationListGroupItem

- (void).cxx_destruct
{
}

- (id)collection
{
  return self->_collection;
}

- (BOOL)isExpandable
{
  return self->_expandable;
}

- (BOOL)isDraggable
{
  return self->_draggable;
}

- (BOOL)isGroup
{
  return self->_group;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXNavigationListGroupItem;
  v4 = [(PXNavigationListItem *)&v8 copyWithZone:a3];
  v4[64] = [(PXNavigationListGroupItem *)self isGroup];
  v4[65] = [(PXNavigationListGroupItem *)self isDraggable];
  v4[66] = [(PXNavigationListGroupItem *)self isExpandable];
  uint64_t v5 = [(PXNavigationListGroupItem *)self collection];
  v6 = (void *)*((void *)v4 + 9);
  *((void *)v4 + 9) = v5;

  return v4;
}

- (PXNavigationListGroupItem)initWithIdentifier:(id)a3 collection:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(id)objc_opt_class() titleForIdentifier:v8];
  v12.receiver = self;
  v12.super_class = (Class)PXNavigationListGroupItem;
  v10 = [(PXNavigationListItem *)&v12 initWithIdentifier:v8 title:v9 itemCount:0x7FFFFFFFFFFFFFFFLL containerIdentifier:0];

  if (v10)
  {
    v10->_expandable = 1;
    v10->_draggable = 1;
    v10->_group = 1;
    objc_storeStrong((id *)&v10->_collection, a4);
  }

  return v10;
}

- (PXNavigationListGroupItem)initWithIdentifier:(id)a3
{
  return [(PXNavigationListGroupItem *)self initWithIdentifier:a3 collection:0];
}

+ (id)titleForIdentifier:(id)a3
{
  uint64_t v3 = titleForIdentifier__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&titleForIdentifier__onceToken, &__block_literal_global_105571);
  }
  uint64_t v5 = [(id)titleForIdentifier__titles objectForKeyedSubscript:v4];

  return v5;
}

void __48__PXNavigationListGroupItem_titleForIdentifier___block_invoke()
{
  v17[14] = *MEMORY[0x1E4F143B8];
  v16[0] = @"PXNavigationListGroupItemTypePhotos";
  v15 = PXLocalizedStringFromTable(@"PXPhotosOutlineTitle", @"PhotosUICore");
  v17[0] = v15;
  v16[1] = @"PXNavigationListGroupItemTypeSharing";
  v14 = PXLocalizedStringFromTable(@"PXSharingOutlineTitle", @"PhotosUICore");
  v17[1] = v14;
  v16[2] = @"PXNavigationListGroupItemTypeCollections";
  v13 = PXLocalizedStringFromTable(@"PXCollectionsOutlineTitle", @"PhotosUICore");
  v17[2] = v13;
  v16[3] = @"PXNavigationListGroupItemTypeDevices";
  objc_super v12 = PXLocalizedStringFromTable(@"PXDevicesOutlineTitle", @"PhotosUICore");
  v17[3] = v12;
  v16[4] = @"PXNavigationListGroupItemTypeMyAlbums";
  v11 = PXLocalizedStringFromTable(@"PXMyAlbumsOutlineTitle", @"PhotosUICore");
  v17[4] = v11;
  v16[5] = @"PXNavigationListGroupItemTypeSharedAlbums";
  v0 = PXLocalizedStringFromTable(@"PXSharedAlbumsOutlineTitle", @"PhotosUICore");
  v17[5] = v0;
  v16[6] = @"PXNavigationListGroupItemTypeOtherAlbums";
  v1 = PXLocalizedStringFromTable(@"PXOtherAlbumsOutlineTitle", @"PhotosUICore");
  v17[6] = v1;
  v16[7] = @"PXNavigationListGroupItemTypeSyncedFromMacAlbums";
  v2 = PXLocalizedStringFromTable(@"PXSyncedFromMacOutlineTitle", @"PhotosUICore");
  v17[7] = v2;
  v16[8] = @"PXSharedAlbumsVirtualCollection";
  uint64_t v3 = PXLocalizedStringFromTable(@"PXSharedAlbumsOutlineTitle", @"PhotosUICore");
  v17[8] = v3;
  v16[9] = @"PXTransientCollectionIdentifierBookmarks";
  id v4 = PXLocalizedStringFromTable(@"LemonadeBookmarksSectionHeaderTitle", @"LemonadeLocalizable");
  v17[9] = v4;
  v16[10] = @"PXMediaTypesVirtualCollection";
  uint64_t v5 = PXLocalizedStringFromTable(@"PXMediaTypesOutlineTitle", @"PhotosUICore");
  v17[10] = v5;
  v16[11] = @"PXMyAlbumsVirtualCollection";
  v6 = PXLocalizedStringFromTable(@"PXAlbumsOutlineTitle", @"PhotosUICore");
  v17[11] = v6;
  v16[12] = @"PXTransientCollectionIdentifierUtilities";
  id v7 = PXLocalizedStringFromTable(@"PXOtherAlbumsOutlineTitle", @"PhotosUICore");
  v17[12] = v7;
  v16[13] = @"PXMacSyncedAlbumsVirtualCollection";
  id v8 = PXLocalizedStringFromTable(@"PXSyncedFromMacOutlineTitle", @"PhotosUICore");
  v17[13] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:14];
  v10 = (void *)titleForIdentifier__titles;
  titleForIdentifier__titles = v9;
}

@end