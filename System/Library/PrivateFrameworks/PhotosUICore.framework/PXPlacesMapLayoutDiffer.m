@interface PXPlacesMapLayoutDiffer
- (PXPlacesMapLayoutDiffer)initWithSourceLayoutResult:(id)a3 targetLayoutResult:(id)a4;
- (PXPlacesMapLayoutResult)sourceLayoutResult;
- (PXPlacesMapLayoutResult)targetLayoutResult;
- (id)computeChanges;
- (void)_addTargetLayoutItem:(id)a3;
- (void)_computeChanges;
- (void)_relateSourceLayoutItem:(id)a3 withTargetLayoutItem:(id)a4;
- (void)_removeSourceLayoutItem:(id)a3;
@end

@implementation PXPlacesMapLayoutDiffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLayoutResult, 0);
  objc_storeStrong((id *)&self->_sourceLayoutResult, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

- (PXPlacesMapLayoutResult)targetLayoutResult
{
  return self->_targetLayoutResult;
}

- (PXPlacesMapLayoutResult)sourceLayoutResult
{
  return self->_sourceLayoutResult;
}

- (void)_relateSourceLayoutItem:(id)a3 withTargetLayoutItem:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v12)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXPlacesMapLayoutDiffer.m" lineNumber:92 description:@"source layout item cannot be nil"];

    if (v7) {
      goto LABEL_3;
    }
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2 object:self file:@"PXPlacesMapLayoutDiffer.m" lineNumber:93 description:@"target layout item cannot be nil"];

LABEL_3:
  changes = self->_changes;
  v9 = [[PXPlacesMapLayoutChange alloc] initWithSourceLayoutItem:v12 targetLayoutItem:v7 type:2];
  [(NSMutableArray *)changes addObject:v9];
}

- (void)_removeSourceLayoutItem:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXPlacesMapLayoutDiffer.m" lineNumber:86 description:@"source layout item cannot be nil"];
  }
  changes = self->_changes;
  v6 = [[PXPlacesMapLayoutChange alloc] initWithSourceLayoutItem:v8 targetLayoutItem:0 type:1];
  [(NSMutableArray *)changes addObject:v6];
}

- (void)_addTargetLayoutItem:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXPlacesMapLayoutDiffer.m" lineNumber:80 description:@"target layout item cannot be nil"];
  }
  changes = self->_changes;
  v6 = [[PXPlacesMapLayoutChange alloc] initWithSourceLayoutItem:0 targetLayoutItem:v8 type:0];
  [(NSMutableArray *)changes addObject:v6];
}

- (void)_computeChanges
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXPlacesMapLayoutDiffer.m" lineNumber:75 description:@"Cannot use PXPlacesMapLayoutDiffer directly. Need to use subclass!"];
}

- (id)computeChanges
{
  changes = self->_changes;
  if (!changes)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = self->_changes;
    self->_changes = v4;

    [(PXPlacesMapLayoutDiffer *)self _computeChanges];
    changes = self->_changes;
  }
  return changes;
}

- (PXPlacesMapLayoutDiffer)initWithSourceLayoutResult:(id)a3 targetLayoutResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPlacesMapLayoutDiffer;
  v9 = [(PXPlacesMapLayoutDiffer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceLayoutResult, a3);
    objc_storeStrong((id *)&v10->_targetLayoutResult, a4);
  }

  return v10;
}

@end