@interface _UIDropItem
- (NSItemProvider)_dropItemProvider;
- (UIDragItem)_localDragItem;
- (id)_privateLocalContext;
- (id)itemProvider;
- (id)localObject;
- (void)_setDropItemProvider:(id)a3;
- (void)_setLocalDragItem:(id)a3;
- (void)_setPrivateLocalContext:(id)a3;
- (void)setLocalObject:(id)a3;
- (void)setNeedsDropPreviewUpdate;
@end

@implementation _UIDropItem

- (id)itemProvider
{
  dropItemProvider = self->_dropItemProvider;
  if (dropItemProvider)
  {
    v3 = dropItemProvider;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIDropItem;
    v3 = [(UIDragItem *)&v5 itemProvider];
  }
  return v3;
}

- (id)localObject
{
  v2 = [(_UIDropItem *)self _localDragItem];
  v3 = [v2 localObject];

  return v3;
}

- (void)setLocalObject:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDropItem *)self _localDragItem];
  [v5 setLocalObject:v4];
}

- (id)_privateLocalContext
{
  v2 = [(_UIDropItem *)self _localDragItem];
  v3 = [v2 _privateLocalContext];

  return v3;
}

- (void)_setPrivateLocalContext:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDropItem *)self _localDragItem];
  [v5 _setPrivateLocalContext:v4];
}

- (void)setNeedsDropPreviewUpdate
{
  v2 = self;
  if (self) {
    self = (_UIDropItem *)objc_loadWeakRetained((id *)&self->super.__currentSetDownAnimation);
  }
  v3 = self;
  [(_UIDropItem *)self dirtyTargetedDragPreviewForDragItem:v2];
}

- (UIDragItem)_localDragItem
{
  return self->_localDragItem;
}

- (void)_setLocalDragItem:(id)a3
{
}

- (NSItemProvider)_dropItemProvider
{
  return self->_dropItemProvider;
}

- (void)_setDropItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropItemProvider, 0);
  objc_storeStrong((id *)&self->_localDragItem, 0);
}

@end