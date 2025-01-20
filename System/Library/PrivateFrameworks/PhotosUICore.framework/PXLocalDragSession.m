@interface PXLocalDragSession
- (BOOL)isDragSessionActive;
- (BOOL)isDropActiveInsideView;
- (CGPoint)scrollViewLocation;
- (CGPoint)velocity;
- (NSSet)draggedAssetReferences;
- (NSSet)excludedAssets;
- (PXAssetCollectionActionPerformer)dropActionPerformer;
- (PXAssetReference)dropTargetAssetReference;
- (PXAssetReference)hitAssetReference;
- (PXLocalDragSession)init;
- (PXLocalDragSessionDelegate)delegate;
- (UIDragSession)dragSession;
- (UIDropSession)dropSession;
- (id)horizontalVelocity;
- (id)verticalVelocity;
- (int64_t)identifier;
- (unint64_t)dropOperation;
- (void)_noteChanged:(SEL)a3;
- (void)setDelegate:(id)a3;
- (void)setDragSession:(id)a3;
- (void)setDraggedAssetReferences:(id)a3;
- (void)setDropActionPerformer:(id)a3;
- (void)setDropOperation:(unint64_t)a3;
- (void)setDropSession:(id)a3;
- (void)setDropTargetAssetReference:(id)a3;
- (void)setExcludedAssets:(id)a3;
- (void)setHitAssetReference:(id)a3;
- (void)setIsDragSessionActive:(BOOL)a3;
- (void)setIsDropActiveInsideView:(BOOL)a3;
- (void)setScrollViewLocation:(CGPoint)a3;
- (void)updateWithDataSource:(id)a3;
@end

@implementation PXLocalDragSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedAssets, 0);
  objc_storeStrong((id *)&self->_dropActionPerformer, 0);
  objc_storeStrong((id *)&self->_hitAssetReference, 0);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_destroyWeak((id *)&self->_dropSession);
  objc_storeStrong((id *)&self->_draggedAssetReferences, 0);
  objc_destroyWeak((id *)&self->_dragSession);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_verticalVelocity, 0);
  objc_storeStrong((id *)&self->_horizontalVelocity, 0);
}

- (void)setExcludedAssets:(id)a3
{
}

- (NSSet)excludedAssets
{
  return self->_excludedAssets;
}

- (unint64_t)dropOperation
{
  return self->_dropOperation;
}

- (PXAssetCollectionActionPerformer)dropActionPerformer
{
  return self->_dropActionPerformer;
}

- (PXAssetReference)hitAssetReference
{
  return self->_hitAssetReference;
}

- (PXAssetReference)dropTargetAssetReference
{
  return self->_dropTargetAssetReference;
}

- (BOOL)isDropActiveInsideView
{
  return self->_isDropActiveInsideView;
}

- (UIDropSession)dropSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dropSession);
  return (UIDropSession *)WeakRetained;
}

- (NSSet)draggedAssetReferences
{
  return self->_draggedAssetReferences;
}

- (BOOL)isDragSessionActive
{
  return self->_isDragSessionActive;
}

- (UIDragSession)dragSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragSession);
  return (UIDragSession *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PXLocalDragSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXLocalDragSessionDelegate *)WeakRetained;
}

- (CGPoint)scrollViewLocation
{
  double x = self->_scrollViewLocation.x;
  double y = self->_scrollViewLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setDropActionPerformer:(id)a3
{
  v5 = (PXAssetCollectionActionPerformer *)a3;
  if (self->_dropActionPerformer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dropActionPerformer, a3);
    [(PXLocalDragSession *)self _noteChanged:sel_dropActionPerformer];
    v5 = v6;
  }
}

- (void)setDropOperation:(unint64_t)a3
{
  if (self->_dropOperation != a3)
  {
    self->_dropOperation = a3;
    [(PXLocalDragSession *)self _noteChanged:sel_dropOperation];
  }
}

- (void)setHitAssetReference:(id)a3
{
  v8 = (PXAssetReference *)a3;
  v5 = self->_hitAssetReference;
  if (v5 == v8)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(PXAssetReference *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_hitAssetReference, a3);
      [(PXLocalDragSession *)self _noteChanged:sel_hitAssetReference];
    }
  }
}

- (void)setDropTargetAssetReference:(id)a3
{
  v8 = (PXAssetReference *)a3;
  v5 = self->_dropTargetAssetReference;
  if (v5 == v8)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(PXAssetReference *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dropTargetAssetReference, a3);
      [(PXLocalDragSession *)self _noteChanged:sel_dropTargetAssetReference];
    }
  }
}

- (void)setDraggedAssetReferences:(id)a3
{
  v8 = (NSSet *)a3;
  v5 = self->_draggedAssetReferences;
  if (v5 == v8)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(NSSet *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_draggedAssetReferences, a3);
      [(PXLocalDragSession *)self _noteChanged:sel_draggedAssetReferences];
    }
  }
}

- (void)setIsDropActiveInsideView:(BOOL)a3
{
  if (self->_isDropActiveInsideView != a3)
  {
    self->_isDropActiveInsideView = a3;
    [(PXLocalDragSession *)self _noteChanged:sel_isDropActiveInsideView];
  }
}

- (void)setIsDragSessionActive:(BOOL)a3
{
  if (self->_isDragSessionActive != a3)
  {
    self->_isDragSessionActive = a3;
    [(PXLocalDragSession *)self _noteChanged:sel_isDragSessionActive];
  }
}

- (void)setDropSession:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dropSession);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dropSession, obj);
    [(PXLocalDragSession *)self _noteChanged:sel_dropSession];
    v5 = obj;
  }
}

- (void)setDragSession:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragSession);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dragSession, obj);
    [(PXLocalDragSession *)self _noteChanged:sel_dragSession];
    v5 = obj;
  }
}

- (void)_noteChanged:(SEL)a3
{
  id v5 = [(PXLocalDragSession *)self delegate];
  [v5 localDragSession:self didChangeProperty:a3];
}

- (void)updateWithDataSource:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXLocalDragSession *)self dropTargetAssetReference];

  if (v5)
  {
    v6 = [(PXLocalDragSession *)self dropTargetAssetReference];
    id v5 = [v4 assetReferenceForAssetReference:v6];
  }
  char v7 = [(PXLocalDragSession *)self hitAssetReference];

  if (v7)
  {
    v8 = [(PXLocalDragSession *)self hitAssetReference];
    char v7 = [v4 assetReferenceForAssetReference:v8];
  }
  id v9 = [(PXLocalDragSession *)self draggedAssetReferences];

  if (v9)
  {
    v21 = v5;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v10 = [(PXLocalDragSession *)self draggedAssetReferences];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v16 = [v4 assetReferenceForAssetReference:v15];
          v17 = (void *)v16;
          if (v16) {
            v18 = (void *)v16;
          }
          else {
            v18 = v15;
          }
          id v19 = v18;

          [v9 addObject:v19];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    id v5 = v21;
  }
  [(PXLocalDragSession *)self setHitAssetReference:v7];
  [(PXLocalDragSession *)self setDropTargetAssetReference:v5];
  v20 = (void *)[v9 copy];
  [(PXLocalDragSession *)self setDraggedAssetReferences:v20];
}

- (CGPoint)velocity
{
  v3 = [(PXLocalDragSession *)self horizontalVelocity];
  [v3 output];
  double v5 = v4;
  v6 = [(PXLocalDragSession *)self verticalVelocity];
  [v6 output];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)setScrollViewLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  self->_scrollViewLocation = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v7 = v6;
  double v8 = [(PXLocalDragSession *)self horizontalVelocity];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__PXLocalDragSession_setScrollViewLocation___block_invoke;
  v11[3] = &__block_descriptor_56_e33_v16__0___PXMutableNumberFilter__8l;
  *(CGFloat *)&v11[4] = x;
  *(CGFloat *)&v11[5] = y;
  v11[6] = v7;
  [v8 performChanges:v11];

  double v9 = [(PXLocalDragSession *)self verticalVelocity];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__PXLocalDragSession_setScrollViewLocation___block_invoke_2;
  v10[3] = &__block_descriptor_56_e33_v16__0___PXMutableNumberFilter__8l;
  *(CGFloat *)&v10[4] = x;
  *(CGFloat *)&v10[5] = y;
  v10[6] = v7;
  [v9 performChanges:v10];
}

void __44__PXLocalDragSession_setScrollViewLocation___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 setInput:v3];
  [v4 setTime:*(double *)(a1 + 48)];
}

void __44__PXLocalDragSession_setScrollViewLocation___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  id v4 = a2;
  [v4 setInput:v3];
  [v4 setTime:*(double *)(a1 + 48)];
}

- (id)verticalVelocity
{
  verticalVelocitCGFloat y = self->_verticalVelocity;
  if (!verticalVelocity)
  {
    id v4 = +[PXVelocityNumberFilter gestureVelocityFilter];
    double v5 = self->_verticalVelocity;
    self->_verticalVelocitCGFloat y = v4;

    verticalVelocitCGFloat y = self->_verticalVelocity;
  }
  return verticalVelocity;
}

- (id)horizontalVelocity
{
  horizontalVelocitCGFloat y = self->_horizontalVelocity;
  if (!horizontalVelocity)
  {
    id v4 = +[PXVelocityNumberFilter gestureVelocityFilter];
    double v5 = self->_horizontalVelocity;
    self->_horizontalVelocitCGFloat y = v4;

    horizontalVelocitCGFloat y = self->_horizontalVelocity;
  }
  return horizontalVelocity;
}

- (PXLocalDragSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXLocalDragSession;
  CGPoint result = [(PXLocalDragSession *)&v3 init];
  if (result) {
    result->_identifier = (int)atomic_fetch_add(init_lastIdentifier, 1u);
  }
  return result;
}

@end