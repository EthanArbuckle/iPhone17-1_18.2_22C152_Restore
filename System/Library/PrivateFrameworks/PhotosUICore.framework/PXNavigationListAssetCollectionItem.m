@interface PXNavigationListAssetCollectionItem
- (BOOL)isDraggable;
- (PXNavigationListAssetCollectionItem)initWithAssetCollection:(id)a3 itemCount:(int64_t)a4 containerIdentifier:(id)a5;
- (id)accessoryGlyphImageName;
- (id)accessoryTitle;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation PXNavigationListAssetCollectionItem

- (id)accessoryGlyphImageName
{
  v7.receiver = self;
  v7.super_class = (Class)PXNavigationListAssetCollectionItem;
  v3 = [(PXNavigationListItem *)&v7 accessoryGlyphImageName];
  unint64_t v4 = [(PXNavigationListItem *)self lockState];
  if (v4 == 1)
  {
    v5 = @"lock.fill";
  }
  else
  {
    if (v4 != 2) {
      goto LABEL_6;
    }
    v5 = @"lock.open.fill";
  }

  v3 = v5;
LABEL_6:
  return v3;
}

- (id)accessoryTitle
{
  v3 = [(PXNavigationListDisplayAssetCollectionItem *)self collection];
  char v4 = objc_msgSend(v3, "px_containsPrivateContent");

  if (v4)
  {
    v5 = @" ";
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXNavigationListAssetCollectionItem;
    v5 = [(PXNavigationListItem *)&v7 accessoryTitle];
  }
  return v5;
}

- (BOOL)isDraggable
{
  v13.receiver = self;
  v13.super_class = (Class)PXNavigationListAssetCollectionItem;
  unsigned int v4 = [(PXNavigationListDisplayAssetCollectionItem *)&v13 isDraggable];
  v5 = [(PXNavigationListDisplayAssetCollectionItem *)self collection];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v4) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v11);
    v12 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXNavigationListItem.m", 436, @"%@ should be an instance inheriting from %@, but it is %@", @"self.collection", v10, v12 object file lineNumber description];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXNavigationListItem.m", 436, @"%@ should be an instance inheriting from %@, but it is nil", @"self.collection", v10 object file lineNumber description];
  }

  if (!v4) {
    goto LABEL_5;
  }
LABEL_4:
  if (([v5 isTransient] & 1) == 0)
  {
    BOOL v6 = [(PXNavigationListItem *)self lockState] != 1;
    goto LABEL_7;
  }
LABEL_5:
  BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXNavigationListAssetCollectionItem;
  return [(PXNavigationListDisplayAssetCollectionItem *)&v4 copyWithZone:a3];
}

- (PXNavigationListAssetCollectionItem)initWithAssetCollection:(id)a3 itemCount:(int64_t)a4 containerIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 transientIdentifier];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v8 localIdentifier];
  }
  objc_super v13 = v12;

  v14 = [v8 localizedTitle];
  v18.receiver = self;
  v18.super_class = (Class)PXNavigationListAssetCollectionItem;
  v15 = [(PXNavigationListDisplayAssetCollectionItem *)&v18 initWithIdentifier:v13 title:v14 displayAssetCollection:v8 itemCount:a4 containerIdentifier:v9];

  if (v15)
  {
    uint64_t v16 = ([v8 isTransient] & 1) == 0
       && ([v8 collectionHasFixedOrder] & 1) == 0
       && [(PXNavigationListDisplayAssetCollectionItem *)v15 isReorderable];
    [(PXNavigationListDisplayAssetCollectionItem *)v15 setReorderable:v16];
  }

  return v15;
}

@end