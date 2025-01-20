@interface PXTilingControllerDefaultComposition
- (NSSet)tilingControllers;
- (void)setTilingControllers:(id)a3;
- (void)updateComposition;
@end

@implementation PXTilingControllerDefaultComposition

- (void).cxx_destruct
{
}

- (void)setTilingControllers:(id)a3
{
}

- (NSSet)tilingControllers
{
  return self->_tilingControllers;
}

- (void)updateComposition
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(PXTilingControllerComposition *)self input];
  v4 = [(PXTilingControllerComposition *)self output];
  v5 = [(PXTilingControllerDefaultComposition *)self tilingControllers];
  [v3 referenceSize];
  double v22 = v7;
  double v23 = v6;
  [v3 contentInset];
  double v20 = v9;
  double v21 = v8;
  double v18 = v11;
  double v19 = v10;
  double v13 = *MEMORY[0x1E4F1DB20];
  double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  memset(v24, 0, sizeof(v24));
  id v16 = v5;
  if ([v16 countByEnumeratingWithState:v24 objects:v25 count:16])
  {
    uint64_t v17 = **((void **)&v24[0] + 1);
    objc_msgSend(v4, "setReferenceSize:contentInset:forTilingController:", **((void **)&v24[0] + 1), v23, v22, v21, v20, v19, v18);
    [v3 contentBoundsForTilingController:v17];
    [v3 scrollBoundsForTilingController:v17];
    [v3 preferredOriginForTilingController:v17];
    PXPointIsNull();
  }

  objc_msgSend(v4, "setContentBounds:scrollBounds:scrollInfo:", 0, v13, v12, v15, v14, v13, v12, v15, v14);
}

@end