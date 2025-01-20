@interface PXDemoTilingControllerWidgetLayout
+ (PXTileIdentifier)backgroundTileIdentifier;
- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6;
- (CGRect)contentBounds;
- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setReferenceSize:(CGSize)a3;
@end

@implementation PXDemoTilingControllerWidgetLayout

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PXDemoTilingControllerWidgetLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  aBlock[3] = &unk_1E5DCCFA8;
  v29 = v34;
  aBlock[4] = self;
  CGFloat v30 = x;
  CGFloat v31 = y;
  CGFloat v32 = width;
  CGFloat v33 = height;
  id v13 = v12;
  id v28 = v13;
  v14 = (void (**)(void *, _OWORD *))_Block_copy(aBlock);
  v15 = objc_opt_class();
  if (v15)
  {
    [v15 backgroundTileIdentifier];
  }
  else
  {
    uint64_t v26 = 0;
    memset(v25, 0, sizeof(v25));
  }
  v14[2](v14, v25);
  v16 = [(PXAssetsTilingLayout *)self dataSource];
  if ([v16 numberOfSections] >= 1 && objc_msgSend(v16, "numberOfItemsInSection:", 0) >= 1)
  {
    uint64_t v24 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v17 = xmmword_1AB359AB0;
    uint64_t v18 = [v16 identifier];
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    v14[2](v14, &v17);
  }

  _Block_object_dispose(v34, 8);
}

void __82__PXDemoTilingControllerWidgetLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    long long v4 = *((_OWORD *)off_1E5DAB048 + 9);
    long long v44 = *((_OWORD *)off_1E5DAB048 + 8);
    long long v45 = v4;
    long long v5 = *((_OWORD *)off_1E5DAB048 + 11);
    long long v46 = *((_OWORD *)off_1E5DAB048 + 10);
    long long v47 = v5;
    long long v6 = *((_OWORD *)off_1E5DAB048 + 5);
    long long v40 = *((_OWORD *)off_1E5DAB048 + 4);
    long long v41 = v6;
    long long v7 = *((_OWORD *)off_1E5DAB048 + 7);
    long long v42 = *((_OWORD *)off_1E5DAB048 + 6);
    long long v43 = v7;
    CGSize v8 = (CGSize)*((_OWORD *)off_1E5DAB048 + 1);
    v37.origin = *(CGPoint *)off_1E5DAB048;
    v37.size = v8;
    long long v9 = *((_OWORD *)off_1E5DAB048 + 3);
    long long v38 = *((_OWORD *)off_1E5DAB048 + 2);
    long long v39 = v9;
    id v35 = 0;
    uint64_t v36 = 0;
    v10 = *(void **)(a1 + 32);
    long long v11 = *(_OWORD *)(a2 + 48);
    long long v23 = *(_OWORD *)(a2 + 32);
    long long v24 = v11;
    long long v25 = *(_OWORD *)(a2 + 64);
    *(void *)&long long v26 = *(void *)(a2 + 80);
    CGSize v12 = *(CGSize *)(a2 + 16);
    v22.origin = *(CGPoint *)a2;
    v22.size = v12;
    int v13 = [v10 getGeometry:&v37 group:&v36 userData:&v35 forTileWithIdentifier:&v22];
    id v14 = v35;
    if (v13)
    {
      if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v37))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8) + 24;
        uint64_t v19 = *(void (**)(uint64_t, _OWORD *, CGRect *, uint64_t, id, uint64_t, uint64_t, uint64_t))(v17 + 16);
        long long v20 = *(_OWORD *)(a2 + 48);
        v33[2] = *(_OWORD *)(a2 + 32);
        v33[3] = v20;
        v33[4] = *(_OWORD *)(a2 + 64);
        uint64_t v34 = *(void *)(a2 + 80);
        long long v21 = *(_OWORD *)(a2 + 16);
        v33[0] = *(_OWORD *)a2;
        v33[1] = v21;
        long long v29 = v44;
        long long v30 = v45;
        long long v31 = v46;
        long long v32 = v47;
        long long v25 = v40;
        long long v26 = v41;
        long long v27 = v42;
        long long v28 = v43;
        CGRect v22 = v37;
        long long v23 = v38;
        long long v24 = v39;
        v19(v17, v33, &v22, v36, v14, v18, v15, v16);
      }
    }
  }
}

- (CGRect)contentBounds
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PXTilingLayout *)self referenceSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = v2;
  double v9 = v3;
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
}

- (void)setReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PXTilingLayout *)self referenceSize];
  if (width != v7 || height != v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)PXDemoTilingControllerWidgetLayout;
    -[PXTilingLayout setReferenceSize:](&v9, sel_setReferenceSize_, width, height);
    [(PXTilingLayout *)self invalidateLayout];
  }
}

+ (PXTileIdentifier)backgroundTileIdentifier
{
  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  *(_OWORD *)&retstr->index[1] = 0u;
  *(_OWORD *)&retstr->index[3] = 0u;
  *(_OWORD *)&retstr->length = xmmword_1AB359C50;
  return result;
}

@end