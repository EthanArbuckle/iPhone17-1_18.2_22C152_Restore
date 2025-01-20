@interface TabContextMenuIdentifier
- (BOOL)isEqual:(id)a3;
- (NSUUID)tabUUID;
- (TabCollectionItem)sourceItem;
- (TabContextMenuIdentifier)initWithTabUUID:(id)a3 sourceItem:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation TabContextMenuIdentifier

- (TabContextMenuIdentifier)initWithTabUUID:(id)a3 sourceItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TabContextMenuIdentifier;
  v9 = [(TabContextMenuIdentifier *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tabUUID, a3);
    objc_storeWeak((id *)&v10->_sourceItem, v8);
    v11 = v10;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  tabUUID = self->_tabUUID;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceItem);
  id v7 = (void *)[v4 initWithTabUUID:tabUUID sourceItem:WeakRetained];

  return v7;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_tabUUID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TabContextMenuIdentifier *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSUUID *)self->_tabUUID isEqual:v4->_tabUUID];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (NSUUID)tabUUID
{
  return self->_tabUUID;
}

- (TabCollectionItem)sourceItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceItem);
  return (TabCollectionItem *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceItem);
  objc_storeStrong((id *)&self->_tabUUID, 0);
}

@end