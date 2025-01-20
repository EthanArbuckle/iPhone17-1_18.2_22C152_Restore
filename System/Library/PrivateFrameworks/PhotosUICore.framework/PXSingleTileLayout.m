@interface PXSingleTileLayout
- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6;
- (CGRect)contentBounds;
- (CGSize)preferredSize;
- (PXSingleTileLayout)init;
- (PXSingleTileLayout)initWithTileIdentifier:(PXTileIdentifier *)a3;
- (PXTileIdentifier)tileIdentifier;
- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (void)prepareLayout;
- (void)setPreferredSize:(CGSize)a3;
- (void)setReferenceSize:(CGSize)a3;
@end

@implementation PXSingleTileLayout

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXTileIdentifier)tileIdentifier
{
  long long v3 = *(_OWORD *)&self[2].index[4];
  *(_OWORD *)&retstr->index[3] = *(_OWORD *)&self[2].index[2];
  *(_OWORD *)&retstr->index[5] = v3;
  *(_OWORD *)&retstr->index[7] = *(_OWORD *)&self[2].index[6];
  retstr->index[9] = self[2].index[8];
  long long v4 = *(_OWORD *)self[2].index;
  *(_OWORD *)&retstr->length = *(_OWORD *)&self[1].index[9];
  *(_OWORD *)&retstr->index[1] = v4;
  return self;
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  CGFloat v11 = *MEMORY[0x1E4F1DB20];
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  [(PXSingleTileLayout *)self tileIdentifier];
  long long v15 = *(_OWORD *)&a6->index[5];
  v27[2] = *(_OWORD *)&a6->index[3];
  v27[3] = v15;
  v27[4] = *(_OWORD *)&a6->index[7];
  unint64_t v28 = a6->index[9];
  long long v16 = *(_OWORD *)&a6->index[1];
  v27[0] = *(_OWORD *)&a6->length;
  v27[1] = v16;
  BOOL v17 = *(void *)&v27[0] == v29[0];
  if (*(void *)&v27[0] && *(void *)&v27[0] == v29[0])
  {
    unint64_t v18 = 1;
    do
    {
      uint64_t v19 = *((void *)v27 + v18);
      uint64_t v20 = v29[v18];
      BOOL v17 = v19 == v20;
      if (v18 >= *(void *)&v27[0]) {
        break;
      }
      ++v18;
    }
    while (v19 == v20);
  }
  if (v17)
  {
    [(PXSingleTileLayout *)self contentBounds];
    CGFloat v11 = v21;
    CGFloat v12 = v22;
    CGFloat v13 = v23;
    CGFloat v14 = v24;
  }
  v30.origin.x = v11;
  v30.origin.y = v12;
  v30.size.double width = v13;
  v30.size.double height = v14;
  BOOL IsNull = CGRectIsNull(v30);
  if (!IsNull)
  {
    if (a3)
    {
      [(PXTilingLayout *)self coordinateSpaceIdentifier];
      PXRectGetCenter();
    }
    if (a4) {
      *a4 = 0;
    }
    if (a5) {
      *a5 = 0;
    }
  }
  return !IsNull;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PXSingleTileLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  aBlock[3] = &unk_1E5DCCFA8;
  unint64_t v18 = v23;
  aBlock[4] = self;
  CGFloat v19 = x;
  CGFloat v20 = y;
  CGFloat v21 = width;
  CGFloat v22 = height;
  id v13 = v12;
  id v17 = v13;
  CGFloat v14 = (void (**)(void *, void *))_Block_copy(aBlock);
  [(PXSingleTileLayout *)self tileIdentifier];
  v14[2](v14, &v15);

  _Block_object_dispose(v23, 8);
}

void __66__PXSingleTileLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
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
        CGFloat v19 = *(void (**)(uint64_t, _OWORD *, CGRect *, uint64_t, id, uint64_t, uint64_t, uint64_t))(v17 + 16);
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
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)prepareLayout
{
  v9.receiver = self;
  v9.super_class = (Class)PXSingleTileLayout;
  [(PXTilingLayout *)&v9 prepareLayout];
  [(PXTilingLayout *)self referenceSize];
  double v4 = v3;
  double v6 = v5;
  [(PXSingleTileLayout *)self preferredSize];
  self->_contentBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  if (v7 < 0.0) {
    double v7 = v4;
  }
  if (v8 < 0.0) {
    double v8 = v6;
  }
  self->_contentBounds.size.double width = v7;
  self->_contentBounds.size.double height = v8;
}

- (void)setPreferredSize:(CGSize)a3
{
  if (a3.width != self->_preferredSize.width || a3.height != self->_preferredSize.height)
  {
    self->_preferredSize = a3;
    double v5 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    [(PXTilingLayoutInvalidationContext *)v5 invalidateAllTiles];
    [(PXTilingLayoutInvalidationContext *)v5 invalidateContentBounds];
    [(PXTilingLayoutInvalidationContext *)v5 invalidateScrollBounds];
    [(PXTilingLayout *)self invalidateLayoutWithContext:v5];
  }
}

- (void)setReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PXTilingLayout *)self referenceSize];
  double v7 = v6;
  double v9 = v8;
  v12.receiver = self;
  v12.super_class = (Class)PXSingleTileLayout;
  -[PXTilingLayout setReferenceSize:](&v12, sel_setReferenceSize_, width, height);
  if (width != v7 || height != v9)
  {
    long long v11 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    [(PXTilingLayoutInvalidationContext *)v11 invalidateAllTiles];
    [(PXTilingLayoutInvalidationContext *)v11 invalidateContentBounds];
    [(PXTilingLayoutInvalidationContext *)v11 invalidateScrollBounds];
    [(PXTilingLayout *)self invalidateLayoutWithContext:v11];
  }
}

- (PXSingleTileLayout)initWithTileIdentifier:(PXTileIdentifier *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PXSingleTileLayout;
  CGRect result = [(PXTilingLayout *)&v14 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->index[1];
    *(_OWORD *)&result->_tileIdentifier.length = *(_OWORD *)&a3->length;
    *(_OWORD *)&result->_tileIdentifier.index[1] = v5;
    long long v7 = *(_OWORD *)&a3->index[5];
    long long v6 = *(_OWORD *)&a3->index[7];
    long long v8 = *(_OWORD *)&a3->index[3];
    result->_tileIdentifier.index[9] = a3->index[9];
    *(_OWORD *)&result->_tileIdentifier.index[5] = v7;
    *(_OWORD *)&result->_tileIdentifier.index[7] = v6;
    *(_OWORD *)&result->_tileIdentifier.index[3] = v8;
    __asm { FMOV            V0.2D, #-1.0 }
    result->_preferredSize = _Q0;
  }
  return result;
}

- (PXSingleTileLayout)init
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  return [(PXSingleTileLayout *)self initWithTileIdentifier:v3];
}

@end