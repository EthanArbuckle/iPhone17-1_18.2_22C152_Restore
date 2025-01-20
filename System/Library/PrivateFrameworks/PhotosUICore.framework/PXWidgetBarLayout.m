@interface PXWidgetBarLayout
+ (PXTileIdentifier)tileIdentifier;
- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6;
- (CGRect)contentBounds;
- (double)height;
- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (void)prepareLayout;
- (void)setHeight:(double)a3;
- (void)setReferenceSize:(CGSize)a3;
@end

@implementation PXWidgetBarLayout

- (double)height
{
  return self->_height;
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  long long v10 = *((_OWORD *)off_1E5DAB048 + 5);
  long long v44 = *((_OWORD *)off_1E5DAB048 + 4);
  long long v45 = v10;
  long long v46 = *((_OWORD *)off_1E5DAB048 + 6);
  v43[0] = *(_DWORD *)((char *)off_1E5DAB048 + 129);
  *(_DWORD *)((char *)v43 + 3) = *((_DWORD *)off_1E5DAB048 + 33);
  CGSize v11 = *(CGSize *)((char *)off_1E5DAB048 + 168);
  CGPoint v41 = *(CGPoint *)((char *)off_1E5DAB048 + 152);
  CGSize v42 = v11;
  v12 = objc_opt_class();
  if (v12)
  {
    [v12 tileIdentifier];
    unint64_t v13 = *(void *)&v39[0];
  }
  else
  {
    unint64_t v13 = 0;
    uint64_t v40 = 0;
    memset(v39, 0, sizeof(v39));
  }
  long long v14 = *(_OWORD *)&a6->index[5];
  v37[2] = *(_OWORD *)&a6->index[3];
  v37[3] = v14;
  v37[4] = *(_OWORD *)&a6->index[7];
  unint64_t v38 = a6->index[9];
  long long v15 = *(_OWORD *)&a6->index[1];
  v37[0] = *(_OWORD *)&a6->length;
  v37[1] = v15;
  BOOL v16 = *(void *)&v37[0] == v13;
  if (*(void *)&v37[0] && *(void *)&v37[0] == v13)
  {
    unint64_t v17 = 1;
    do
    {
      uint64_t v18 = *((void *)v37 + v17);
      uint64_t v19 = *((void *)v39 + v17);
      BOOL v16 = v18 == v19;
      if (v17 >= v13) {
        break;
      }
      ++v17;
    }
    while (v18 == v19);
  }
  if (v16)
  {
    [(PXWidgetBarLayout *)self contentBounds];
    [(PXTilingLayout *)self coordinateSpaceIdentifier];
    v43[0] = 0;
    *(_DWORD *)((char *)v43 + 3) = 0;
    PXRectGetCenter();
  }
  char v20 = *((unsigned char *)off_1E5DAB048 + 128);
  v21 = (void *)*((void *)off_1E5DAB048 + 23);
  CGFloat v22 = *((double *)off_1E5DAB048 + 1);
  CGFloat v23 = *((double *)off_1E5DAB048 + 2);
  CGFloat v24 = *((double *)off_1E5DAB048 + 3);
  CGFloat v25 = *((double *)off_1E5DAB048 + 4);
  CGFloat v26 = *((double *)off_1E5DAB048 + 5);
  CGFloat v27 = *((double *)off_1E5DAB048 + 6);
  CGFloat v28 = *((double *)off_1E5DAB048 + 7);
  double v30 = *((double *)off_1E5DAB048 + 14);
  double v29 = *((double *)off_1E5DAB048 + 15);
  CGFloat v31 = *((double *)off_1E5DAB048 + 17);
  CGFloat v32 = *((double *)off_1E5DAB048 + 18);
  if (a3)
  {
    a3->frame.origin.x = *(CGFloat *)off_1E5DAB048;
    a3->frame.origin.y = v22;
    a3->frame.size.width = v23;
    a3->frame.size.height = v24;
    a3->center.x = v25;
    a3->center.y = v26;
    a3->size.width = v27;
    a3->size.height = v28;
    long long v33 = v45;
    *(_OWORD *)&a3->transform.a = v44;
    *(_OWORD *)&a3->transform.c = v33;
    *(_OWORD *)&a3->transform.tx = v46;
    a3->alpha = v30;
    a3->zPosition = v29;
    a3->hidden = v20;
    int v34 = v43[0];
    *((_DWORD *)&a3->hidden + 1) = *(_DWORD *)((char *)v43 + 3);
    *(_DWORD *)(&a3->hidden + 1) = v34;
    a3->contentSize.width = v31;
    a3->contentSize.height = v32;
    CGPoint v35 = v41;
    a3->contentsRect.size = v42;
    a3->contentsRect.origin = v35;
    a3->coordinateSpaceIdentifier = v21;
  }
  if (a5) {
    *a5 = 0;
  }
  return 0;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PXWidgetBarLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  aBlock[3] = &unk_1E5DCCFA8;
  char v20 = v25;
  aBlock[4] = self;
  CGFloat v21 = x;
  CGFloat v22 = y;
  CGFloat v23 = width;
  CGFloat v24 = height;
  id v13 = v12;
  id v19 = v13;
  long long v14 = (void (**)(void *, _OWORD *))_Block_copy(aBlock);
  long long v15 = objc_opt_class();
  if (v15)
  {
    [v15 tileIdentifier];
  }
  else
  {
    uint64_t v17 = 0;
    memset(v16, 0, sizeof(v16));
  }
  v14[2](v14, v16);

  _Block_object_dispose(v25, 8);
}

void __65__PXWidgetBarLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
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
    long long v10 = *(void **)(a1 + 32);
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
        id v19 = *(void (**)(uint64_t, _OWORD *, CGRect *, uint64_t, id, uint64_t, uint64_t, uint64_t))(v17 + 16);
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
  v6.receiver = self;
  v6.super_class = (Class)PXWidgetBarLayout;
  [(PXTilingLayout *)&v6 prepareLayout];
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_contentBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_contentBounds.size = v3;
  [(PXTilingLayout *)self referenceSize];
  self->_contentBounds.size.double width = v4;
  [(PXWidgetBarLayout *)self height];
  self->_contentBounds.size.double height = v5;
}

- (void)setReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PXTilingLayout *)self referenceSize];
  double v7 = v6;
  double v9 = v8;
  v12.receiver = self;
  v12.super_class = (Class)PXWidgetBarLayout;
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

- (void)setHeight:(double)a3
{
  if (self->_height != a3)
  {
    self->_double height = a3;
    CGFloat v4 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    [(PXTilingLayoutInvalidationContext *)v4 invalidateAllTiles];
    [(PXTilingLayoutInvalidationContext *)v4 invalidateContentBounds];
    [(PXTilingLayoutInvalidationContext *)v4 invalidateScrollBounds];
    [(PXTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

+ (PXTileIdentifier)tileIdentifier
{
  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  *(_OWORD *)&retstr->index[1] = 0u;
  *(_OWORD *)&retstr->index[3] = 0u;
  *(_OWORD *)&retstr->length = xmmword_1AB359ED0;
  return result;
}

@end