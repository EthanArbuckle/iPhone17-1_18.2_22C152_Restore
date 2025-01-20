@interface PXNavigationListActionItem
- (BOOL)isEqualToNavigationListItem:(id)a3;
- (NSString)actionType;
- (PXNavigationListActionItem)initWithActionType:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)glyphImageName;
- (int64_t)style;
- (unint64_t)hash;
@end

@implementation PXNavigationListActionItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_glyphImageName, 0);
}

- (NSString)actionType
{
  return self->_actionType;
}

- (int64_t)style
{
  return self->_style;
}

- (id)glyphImageName
{
  return self->_glyphImageName;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)PXNavigationListActionItem;
  unint64_t v3 = [(PXNavigationListItem *)&v7 hash];
  v4 = [(PXNavigationListActionItem *)self actionType];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqualToNavigationListItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXNavigationListActionItem;
  if ([(PXNavigationListItem *)&v9 isEqualToNavigationListItem:v4])
  {
    unint64_t v5 = [(PXNavigationListActionItem *)self actionType];
    v6 = [v4 actionType];
    if (v5 == v6) {
      char v7 = 1;
    }
    else {
      char v7 = [v5 isEqualToString:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PXNavigationListActionItem;
  unint64_t v5 = -[PXNavigationListItem copyWithZone:](&v13, sel_copyWithZone_);
  v6 = [(PXNavigationListActionItem *)self glyphImageName];
  uint64_t v7 = [v6 copyWithZone:a3];
  v8 = (void *)v5[8];
  v5[8] = v7;

  objc_super v9 = [(PXNavigationListActionItem *)self actionType];
  uint64_t v10 = [v9 copyWithZone:a3];
  v11 = (void *)v5[10];
  v5[10] = v10;

  v5[9] = [(PXNavigationListActionItem *)self style];
  return v5;
}

- (PXNavigationListActionItem)initWithActionType:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PXNavigationListItem *)self collection];
  v6 = +[PXPhotoKitCollectionListCreateCollectionActionPerformer localizedTitleForActionType:v4 collectionList:v5];

  v13.receiver = self;
  v13.super_class = (Class)PXNavigationListActionItem;
  uint64_t v7 = [(PXNavigationListItem *)&v13 initWithIdentifier:v4 title:v6 itemCount:0x7FFFFFFFFFFFFFFFLL containerIdentifier:0];
  v8 = v7;
  if (v7)
  {
    glyphImageName = v7->_glyphImageName;
    v7->_glyphImageName = (NSString *)@"PXNavigationListItemImageNamePlus";

    uint64_t v10 = [v4 copy];
    actionType = v8->_actionType;
    v8->_actionType = (NSString *)v10;

    v8->_style = 1;
  }

  return v8;
}

@end