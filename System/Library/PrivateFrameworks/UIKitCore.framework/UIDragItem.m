@interface UIDragItem
- (BOOL)_deferPreviewUpdates;
- (BOOL)_isDirty;
- (CGAffineTransform)_suggestedTransform;
- (CGPoint)_visibleDropItemCenter;
- (CGSize)_visibleDropItemSize;
- (NSItemProvider)itemProvider;
- (UIDragItem)initWithItemProvider:(NSItemProvider *)itemProvider;
- (UITargetedDragPreview)_targetedLiftPreview;
- (UITextRange)_draggedTextRange;
- (_UIDragDropSessionInternal)_dragDropSession;
- (_UIDragPreviewBlockProvider)dragPreviewBlockProvider;
- (_UIDragSetDownAnimationTarget)_destinationVisualTarget;
- (_UIDragSetDownAnimationTarget)_sourceVisualTarget;
- (id)_currentPreviewProvider;
- (id)_previewProviderForType:(unint64_t)a3;
- (id)_privateLocalContext;
- (id)_uicmi_getAssociatedMenuIdentifier;
- (id)localObject;
- (unint64_t)_managementState;
- (unint64_t)preferredPreviewType;
- (unint64_t)updatedPreviewType;
- (void)_loadOriginalImageComponentProvider;
- (void)_previewNeedsUpdateForType:(unint64_t)a3;
- (void)_setDeferPreviewUpdates:(BOOL)a3;
- (void)_setDestinationVisualTarget:(id)a3;
- (void)_setDirty:(BOOL)a3;
- (void)_setDragDropSession:(id)a3;
- (void)_setDraggedTextRange:(id)a3;
- (void)_setPrivateLocalContext:(id)a3;
- (void)_setSourceVisualTarget:(id)a3;
- (void)_setVisibleDropItemCenter:(CGPoint)a3;
- (void)_setVisibleDropItemSize:(CGSize)a3;
- (void)_uicmi_setAssociatedMenuIdentifier:(id)a3;
- (void)_updatePreferredPreview;
- (void)previewProvider;
- (void)setDragPreviewBlockProvider:(id)a3;
- (void)setItemProvider:(id)a3;
- (void)setLocalObject:(id)localObject;
- (void)setPreferredPreviewType:(unint64_t)a3;
- (void)setPreviewProvider:(void *)previewProvider;
- (void)setTargetedLiftPreview:(id)a3;
- (void)setUpdatedPreviewType:(unint64_t)a3;
- (void)set_managementState:(unint64_t)a3;
- (void)set_suggestedTransform:(CGAffineTransform *)a3;
@end

@implementation UIDragItem

- (UIDragItem)initWithItemProvider:(NSItemProvider *)itemProvider
{
  v5 = itemProvider;
  v10.receiver = self;
  v10.super_class = (Class)UIDragItem;
  v6 = [(UIDragItem *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemProvider, itemProvider);
    v7->_preferredPreviewType = 1;
    v8 = v7;
  }

  return v7;
}

- (void)_updatePreferredPreview
{
  unint64_t updatedPreviewType = self->_updatedPreviewType;
  if (updatedPreviewType)
  {
    self->_dirty = 1;
    self->_preferredPreviewType = updatedPreviewType;
    self->_unint64_t updatedPreviewType = 0;
  }
}

- (void)_setDeferPreviewUpdates:(BOOL)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (self->_deferPreviewUpdates != a3)
  {
    self->_deferPreviewUpdates = a3;
    if (!a3)
    {
      if (self->_updatedPreviewType)
      {
        v4 = [(UIDragItem *)self _dragDropSession];
        v6[0] = self;
        v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
        [v4 _itemsNeedUpdate:v5];
      }
    }
  }
}

- (void)_loadOriginalImageComponentProvider
{
  id v2 = [(UIDragItem *)self _previewProviderForType:1];
  [v2 imageComponent];
}

- (void)setPreviewProvider:(void *)previewProvider
{
  id v4 = previewProvider;
  if (self->_previewProvider != v4)
  {
    id v9 = v4;
    v5 = _Block_copy(v4);
    id v6 = self->_previewProvider;
    self->_previewProvider = v5;

    if (v9)
    {
      +[_UIDragPreviewBlockProvider previewProviderWithBlock:](_UIDragPreviewBlockProvider, "previewProviderWithBlock:");
      v7 = (_UIDragPreviewBlockProvider *)objc_claimAutoreleasedReturnValue();
      dragPreviewBlockProvider = self->_dragPreviewBlockProvider;
      self->_dragPreviewBlockProvider = v7;
    }
    else
    {
      dragPreviewBlockProvider = self->_dragPreviewBlockProvider;
      self->_dragPreviewBlockProvider = 0;
    }

    [(UIDragItem *)self _previewNeedsUpdateForType:2];
    id v4 = v9;
  }
}

- (void)_setDragDropSession:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragDropSession);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_dragDropSession);

    objc_storeWeak((id *)&self->_dragDropSession, obj);
    if (!v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_dragDropSession);
      if (v6)
      {
        id previewProvider = self->_previewProvider;

        if (previewProvider) {
          [(UIDragItem *)self _previewNeedsUpdateForType:2];
        }
      }
    }
  }
}

- (void)_previewNeedsUpdateForType:(unint64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  self->_unint64_t updatedPreviewType = a3;
  if (!self->_deferPreviewUpdates)
  {
    id v4 = [(UIDragItem *)self _dragDropSession];
    v6[0] = self;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [v4 _itemsNeedUpdate:v5];
  }
}

- (id)_previewProviderForType:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v5 = 96;
LABEL_5:
    id v6 = objc_msgSend(*(id *)((char *)&self->super.isa + v5), "_dragPreviewProvider", v3);
    return v6;
  }
  if (a3 == 2)
  {
    uint64_t v5 = 40;
    goto LABEL_5;
  }
  id v6 = 0;
  return v6;
}

- (id)_currentPreviewProvider
{
  unint64_t v3 = [(UIDragItem *)self preferredPreviewType];
  return [(UIDragItem *)self _previewProviderForType:v3];
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (id)localObject
{
  return self->_localObject;
}

- (void)setLocalObject:(id)localObject
{
}

- (void)previewProvider
{
  return self->_previewProvider;
}

- (_UIDragPreviewBlockProvider)dragPreviewBlockProvider
{
  return self->_dragPreviewBlockProvider;
}

- (void)setDragPreviewBlockProvider:(id)a3
{
}

- (unint64_t)preferredPreviewType
{
  return self->_preferredPreviewType;
}

- (void)setPreferredPreviewType:(unint64_t)a3
{
  self->_preferredPreviewType = a3;
}

- (unint64_t)updatedPreviewType
{
  return self->_updatedPreviewType;
}

- (void)setUpdatedPreviewType:(unint64_t)a3
{
  self->_unint64_t updatedPreviewType = a3;
}

- (_UIDragDropSessionInternal)_dragDropSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragDropSession);
  return (_UIDragDropSessionInternal *)WeakRetained;
}

- (CGSize)_visibleDropItemSize
{
  double width = self->_visibleDropItemSize.width;
  double height = self->_visibleDropItemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setVisibleDropItemSize:(CGSize)a3
{
  self->_visibleDropItemSize = a3;
}

- (CGPoint)_visibleDropItemCenter
{
  double x = self->_visibleDropItemCenter.x;
  double y = self->_visibleDropItemCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setVisibleDropItemCenter:(CGPoint)a3
{
  self->_visibleDropItemCenter = a3;
}

- (_UIDragSetDownAnimationTarget)_sourceVisualTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceVisualTarget);
  return (_UIDragSetDownAnimationTarget *)WeakRetained;
}

- (void)_setSourceVisualTarget:(id)a3
{
}

- (_UIDragSetDownAnimationTarget)_destinationVisualTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_destinationVisualTarget);
  return (_UIDragSetDownAnimationTarget *)WeakRetained;
}

- (void)_setDestinationVisualTarget:(id)a3
{
}

- (BOOL)_isDirty
{
  return self->_dirty;
}

- (void)_setDirty:(BOOL)a3
{
  self->_dirtdouble y = a3;
}

- (BOOL)_deferPreviewUpdates
{
  return self->_deferPreviewUpdates;
}

- (UITargetedDragPreview)_targetedLiftPreview
{
  return self->_targetedLiftPreview;
}

- (void)setTargetedLiftPreview:(id)a3
{
}

- (id)_privateLocalContext
{
  return self->_privateLocalContext;
}

- (void)_setPrivateLocalContext:(id)a3
{
}

- (unint64_t)_managementState
{
  return self->__managementState;
}

- (void)set_managementState:(unint64_t)a3
{
  self->__managementState = a3;
}

- (CGAffineTransform)_suggestedTransform
{
  long long v3 = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].ty;
  return self;
}

- (void)set_suggestedTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->__suggestedTransform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->__suggestedTransform.c = v4;
  *(_OWORD *)&self->__suggestedTransform.a = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_privateLocalContext, 0);
  objc_storeStrong((id *)&self->_targetedLiftPreview, 0);
  objc_destroyWeak((id *)&self->__currentSetDownAnimation);
  objc_destroyWeak((id *)&self->_destinationVisualTarget);
  objc_destroyWeak((id *)&self->_sourceVisualTarget);
  objc_destroyWeak((id *)&self->_dragDropSession);
  objc_storeStrong((id *)&self->_dragPreviewBlockProvider, 0);
  objc_storeStrong(&self->_previewProvider, 0);
  objc_storeStrong(&self->_localObject, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

- (UITextRange)_draggedTextRange
{
  return (UITextRange *)objc_getAssociatedObject(self, sel__draggedTextRange);
}

- (void)_setDraggedTextRange:(id)a3
{
}

- (void)_uicmi_setAssociatedMenuIdentifier:(id)a3
{
}

- (id)_uicmi_getAssociatedMenuIdentifier
{
  return objc_getAssociatedObject(self, &_UIDragItemAssociatedMenuIdentifierKey);
}

@end