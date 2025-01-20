@interface _PXMapStoreChange
- (BOOL)hasChanges;
- (NSSet)addedItems;
- (NSSet)removedItems;
- (NSSet)updatedItems;
- (_PXMapStoreChange)initWithAddedItems:(id)a3 removedItems:(id)a4 updatedItems:(id)a5;
- (void)dealloc;
- (void)setAddedItems:(id)a3;
- (void)setRemovedItems:(id)a3;
- (void)setUpdatedItems:(id)a3;
- (void)updateWithChange:(id)a3;
@end

@implementation _PXMapStoreChange

- (void)setUpdatedItems:(id)a3
{
}

- (NSSet)updatedItems
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRemovedItems:(id)a3
{
}

- (NSSet)removedItems
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAddedItems:(id)a3
{
}

- (NSSet)addedItems
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)hasChanges
{
  addedItems = self->_addedItems;
  if (addedItems && [(NSSet *)addedItems count]
    || (removedItems = self->_removedItems) != 0 && [(NSSet *)removedItems count])
  {
    LOBYTE(updatedItems) = 1;
  }
  else
  {
    updatedItems = self->_updatedItems;
    if (updatedItems) {
      LOBYTE(updatedItems) = [(NSSet *)updatedItems count] != 0;
    }
  }
  return (char)updatedItems;
}

- (void)updateWithChange:(id)a3
{
  if ([a3 addedItems])
  {
    if (self->_addedItems)
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:");
      objc_msgSend(v5, "unionSet:", objc_msgSend(a3, "addedItems"));
    }
    else
    {
      v5 = (void *)[a3 addedItems];
    }
    self->_addedItems = (NSSet *)v5;
  }
  if ([a3 removedItems])
  {
    if (self->_removedItems)
    {
      v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:");
      objc_msgSend(v6, "unionSet:", objc_msgSend(a3, "removedItems"));
    }
    else
    {
      v6 = (void *)[a3 removedItems];
    }
    self->_removedItems = (NSSet *)v6;
  }
  if ([a3 updatedItems])
  {
    if (self->_updatedItems)
    {
      v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:");
      objc_msgSend(v7, "unionSet:", objc_msgSend(a3, "updatedItems"));
    }
    else
    {
      v7 = (void *)[a3 updatedItems];
    }
    self->_updatedItems = (NSSet *)v7;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_PXMapStoreChange;
  [(_PXMapStoreChange *)&v3 dealloc];
}

- (_PXMapStoreChange)initWithAddedItems:(id)a3 removedItems:(id)a4 updatedItems:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_PXMapStoreChange;
  v8 = [(_PXMapStoreChange *)&v10 init];
  if (v8)
  {
    v8->_addedItems = (NSSet *)a3;
    v8->_removedItems = (NSSet *)a4;
    v8->_updatedItems = (NSSet *)a5;
  }
  return v8;
}

@end