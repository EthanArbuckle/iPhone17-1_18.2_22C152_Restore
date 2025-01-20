@interface CRLiOSCanvasDragItem
- (BOOL)allowsMoveOperation;
- (BOOL)prefersFullSizePreviews;
- (CRLiOSCanvasDragItem)initWithItemProvider:(id)a3 previewGeneratingBlock:(id)a4;
- (NSItemProvider)itemProvider;
- (id)previewGeneratingBlock;
- (id)sourceObject;
- (void)setAllowsMoveOperation:(BOOL)a3;
- (void)setPrefersFullSizePreviews:(BOOL)a3;
- (void)setSourceObject:(id)a3;
@end

@implementation CRLiOSCanvasDragItem

- (CRLiOSCanvasDragItem)initWithItemProvider:(id)a3 previewGeneratingBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRLiOSCanvasDragItem;
  v9 = [(CRLiOSCanvasDragItem *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemProvider, a3);
    id v11 = [v8 copy];
    id previewGeneratingBlock = v10->_previewGeneratingBlock;
    v10->_id previewGeneratingBlock = v11;
  }
  return v10;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (id)previewGeneratingBlock
{
  return self->_previewGeneratingBlock;
}

- (id)sourceObject
{
  id WeakRetained = objc_loadWeakRetained(&self->sourceObject);

  return WeakRetained;
}

- (void)setSourceObject:(id)a3
{
}

- (BOOL)allowsMoveOperation
{
  return self->allowsMoveOperation;
}

- (void)setAllowsMoveOperation:(BOOL)a3
{
  self->allowsMoveOperation = a3;
}

- (BOOL)prefersFullSizePreviews
{
  return self->prefersFullSizePreviews;
}

- (void)setPrefersFullSizePreviews:(BOOL)a3
{
  self->prefersFullSizePreviews = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->sourceObject);
  objc_storeStrong(&self->_previewGeneratingBlock, 0);

  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end