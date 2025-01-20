@interface PXPhotosDetailsHeaderTileLayout
- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6;
- (CGRect)_contentsRectForAspectRatio:(double)a3;
- (CGRect)_rectForTileWithIdentifier:(PXTileIdentifier *)a3;
- (CGRect)contentBounds;
- (CGRect)previewRect;
- (CGSize)_playButtonSize;
- (PXPhotosDetailsHeaderSpec)spec;
- (PXPhotosDetailsHeaderTileLayout)init;
- (PXPhotosDetailsHeaderTileLayout)initWithSpec:(id)a3;
- (PXPhotosDetailsHeaderTileLayoutDelegate)delegate;
- (PXTileIdentifier)contentTileIdentifier;
- (PXTileIdentifier)tileIdentifierForTileKind:(SEL)a3;
- (double)_zPositionForTileWithIdentifier:(PXTileIdentifier *)a3;
- (id)_userDataForTileWithIdentifier:(PXTileIdentifier *)a3 inContainingRect:(CGRect)a4;
- (id)_viewSpecForTileWithIdentifier:(PXTileIdentifier *)a3 boundingSize:(CGSize)a4;
- (int64_t)style;
- (int64_t)tileKindForTileIdentifier:(PXTileIdentifier *)a3;
- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setReferenceSize:(CGSize)a3;
- (void)setSpec:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation PXPhotosDetailsHeaderTileLayout

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (PXPhotosDetailsHeaderTileLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosDetailsHeaderTileLayoutDelegate *)WeakRetained;
}

- (int64_t)style
{
  return self->_style;
}

- (PXPhotosDetailsHeaderSpec)spec
{
  return self->_spec;
}

- (CGRect)_contentsRectForAspectRatio:(double)a3
{
  if (self->_delegateRespondsTo.contentsRectForAspectRatio)
  {
    v5 = [(PXPhotosDetailsHeaderTileLayout *)self delegate];
    [v5 photosDetailsHeaderTileLayout:self contentsRectForAspectRatio:a3];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *(double *)off_1E5DAB010;
    double v9 = *((double *)off_1E5DAB010 + 1);
    double v11 = *((double *)off_1E5DAB010 + 2);
    double v13 = *((double *)off_1E5DAB010 + 3);
  }
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (PXTileIdentifier)contentTileIdentifier
{
  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  *(_OWORD *)&retstr->index[1] = 0u;
  *(_OWORD *)&retstr->index[3] = 0u;
  *(_OWORD *)&retstr->length = 0u;
  CGRect result = [(PXPhotosDetailsHeaderTileLayout *)self tileIdentifierForTileKind:[(PXPhotosDetailsHeaderTileLayout *)self style] == 1];
  long long v5 = v10;
  *(_OWORD *)&retstr->index[3] = v9;
  *(_OWORD *)&retstr->index[5] = v5;
  *(_OWORD *)&retstr->index[7] = v11;
  retstr->index[9] = v12;
  long long v6 = v8;
  *(_OWORD *)&retstr->length = v7;
  *(_OWORD *)&retstr->index[1] = v6;
  return result;
}

- (PXTileIdentifier)tileIdentifierForTileKind:(SEL)a3
{
  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  *(_OWORD *)&retstr->index[1] = 0u;
  *(_OWORD *)&retstr->index[3] = 0u;
  retstr->length = 1;
  retstr->index[0] = a4;
  return self;
}

- (int64_t)tileKindForTileIdentifier:(PXTileIdentifier *)a3
{
  long long v3 = *(_OWORD *)&a3->index[5];
  v6[2] = *(_OWORD *)&a3->index[3];
  v6[3] = v3;
  v6[4] = *(_OWORD *)&a3->index[7];
  unint64_t v7 = a3->index[9];
  long long v4 = *(_OWORD *)&a3->index[1];
  v6[0] = *(_OWORD *)&a3->length;
  v6[1] = v4;
  return *((void *)v6 + *(void *)&v6[0]);
}

- (id)_userDataForTileWithIdentifier:(PXTileIdentifier *)a3 inContainingRect:(CGRect)a4
{
  if (a3->index[0] == 2)
  {
    CGFloat height = a4.size.height;
    CGFloat width = a4.size.width;
    long long v6 = [(PXPhotosDetailsHeaderTileLayout *)self spec];
    long long v10 = xmmword_1AB35A100;
    CGFloat v11 = width;
    CGFloat v12 = height;
    unint64_t v7 = [v6 viewSpecWithDescriptor:&v10];
  }
  else
  {
    unint64_t v7 = 0;
  }
  long long v8 = +[PXBasicTileUserData userDataWithViewSpec:v7];

  return v8;
}

- (double)_zPositionForTileWithIdentifier:(PXTileIdentifier *)a3
{
  long long v3 = *(_OWORD *)&a3->index[5];
  v7[2] = *(_OWORD *)&a3->index[3];
  v7[3] = v3;
  v7[4] = *(_OWORD *)&a3->index[7];
  unint64_t v8 = a3->index[9];
  long long v4 = *(_OWORD *)&a3->index[1];
  v7[0] = *(_OWORD *)&a3->length;
  v7[1] = v4;
  unint64_t v5 = [(PXPhotosDetailsHeaderTileLayout *)self tileKindForTileIdentifier:v7];
  double result = 0.0;
  if (v5 <= 3) {
    return dbl_1AB35C9E0[v5];
  }
  return result;
}

- (id)_viewSpecForTileWithIdentifier:(PXTileIdentifier *)a3 boundingSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  long long v7 = *(_OWORD *)&a3->index[5];
  long long v18 = *(_OWORD *)&a3->index[3];
  long long v19 = v7;
  long long v20 = *(_OWORD *)&a3->index[7];
  unint64_t v21 = a3->index[9];
  long long v8 = *(_OWORD *)&a3->index[1];
  long long v16 = *(_OWORD *)&a3->length;
  long long v17 = v8;
  switch([(PXPhotosDetailsHeaderTileLayout *)self tileKindForTileIdentifier:&v16])
  {
    case 0:
      unint64_t v9 = 0;
      uint64_t v10 = 4002;
      break;
    case 1:
      unint64_t v9 = 0;
      uint64_t v10 = 4001;
      break;
    case 2:
      if (self->_delegateRespondsTo.titleFontName)
      {
        CGFloat v11 = [(PXPhotosDetailsHeaderTileLayout *)self delegate];
        CGFloat v12 = [v11 photosDetailsHeaderTileLayoutFontName:self];
      }
      else
      {
        CGFloat v12 = 0;
      }
      unint64_t v9 = PXViewSpecOptionsWithTitleFontName(0, v12);

      uint64_t v10 = 4000;
      break;
    case 3:
      unint64_t v9 = 0;
      uint64_t v10 = 4003;
      break;
    default:
      uint64_t v10 = 0;
      unint64_t v9 = 0;
      break;
  }
  double v13 = [(PXPhotosDetailsHeaderTileLayout *)self spec];
  *(void *)&long long v16 = v10;
  *((void *)&v16 + 1) = v9;
  *(CGFloat *)&long long v17 = width;
  *((CGFloat *)&v17 + 1) = height;
  double v14 = [v13 viewSpecWithDescriptor:&v16];

  return v14;
}

- (CGSize)_playButtonSize
{
  if (self->_delegateRespondsTo.playButtonSize)
  {
    long long v3 = [(PXPhotosDetailsHeaderTileLayout *)self delegate];
    [v3 photosDetailsHeaderTileLayoutPlayButtonSize:self];
    double v5 = v4;
    double v7 = v6;

    double v8 = v5;
    double v9 = v7;
  }
  else
  {
    spec = self->_spec;
    [(PXPhotosDetailsHeaderSpec *)spec playButtonSize];
  }
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGRect)_rectForTileWithIdentifier:(PXTileIdentifier *)a3
{
  long long v4 = *(_OWORD *)&a3->index[5];
  v6[2] = *(_OWORD *)&a3->index[3];
  v6[3] = v4;
  v6[4] = *(_OWORD *)&a3->index[7];
  unint64_t v7 = a3->index[9];
  long long v5 = *(_OWORD *)&a3->index[1];
  v6[0] = *(_OWORD *)&a3->length;
  v6[1] = v5;
  [(PXPhotosDetailsHeaderTileLayout *)self tileKindForTileIdentifier:v6];
  [(PXTilingLayout *)self contentInset];
  [(PXPhotosDetailsHeaderTileLayout *)self spec];
  [(id)objc_claimAutoreleasedReturnValue() contentInsetEdges];
  PXEdgeInsetsForEdges();
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  long long v11 = *(_OWORD *)&a6->index[5];
  long long v28 = *(_OWORD *)&a6->index[3];
  long long v29 = v11;
  long long v30 = *(_OWORD *)&a6->index[7];
  unint64_t v31 = a6->index[9];
  long long v12 = *(_OWORD *)&a6->index[1];
  long long v26 = *(_OWORD *)&a6->length;
  long long v27 = v12;
  int64_t v13 = [(PXPhotosDetailsHeaderTileLayout *)self tileKindForTileIdentifier:&v26];
  int64_t v14 = [(PXPhotosDetailsHeaderTileLayout *)self style];
  int64_t v15 = [(PXPhotosDetailsHeaderTileLayout *)self style];
  if (!v13 && v14) {
    return 0;
  }
  BOOL v16 = v13 == 3 || v13 == 1;
  if (v16 && v15 != 1) {
    return 0;
  }
  long long v17 = *(_OWORD *)&a6->index[5];
  long long v28 = *(_OWORD *)&a6->index[3];
  long long v29 = v17;
  long long v30 = *(_OWORD *)&a6->index[7];
  unint64_t v31 = a6->index[9];
  long long v18 = *(_OWORD *)&a6->index[1];
  long long v26 = *(_OWORD *)&a6->length;
  long long v27 = v18;
  [(PXPhotosDetailsHeaderTileLayout *)self _rectForTileWithIdentifier:&v26];
  double width = v32.size.width;
  double height = v32.size.height;
  if (CGRectIsNull(v32)) {
    return 0;
  }
  if (a3)
  {
    [(PXTilingLayout *)self coordinateSpaceIdentifier];
    PXRectGetCenter();
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5)
  {
    long long v22 = *(_OWORD *)&a6->index[5];
    long long v28 = *(_OWORD *)&a6->index[3];
    long long v29 = v22;
    long long v30 = *(_OWORD *)&a6->index[7];
    unint64_t v31 = a6->index[9];
    long long v23 = *(_OWORD *)&a6->index[1];
    long long v26 = *(_OWORD *)&a6->length;
    long long v27 = v23;
    v24 = -[PXPhotosDetailsHeaderTileLayout _viewSpecForTileWithIdentifier:boundingSize:](self, "_viewSpecForTileWithIdentifier:boundingSize:", &v26, width, height);
    id v25 = +[PXBasicTileUserData userDataWithViewSpec:v24];
    *a5 = v25;
  }
  return 1;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PXPhotosDetailsHeaderTileLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  aBlock[3] = &unk_1E5DCCFA8;
  id v25 = v30;
  aBlock[4] = self;
  CGFloat v26 = x;
  CGFloat v27 = y;
  CGFloat v28 = width;
  CGFloat v29 = height;
  id v13 = v12;
  id v24 = v13;
  int64_t v14 = (void (**)(void *, _OWORD *))_Block_copy(aBlock);
  uint64_t v22 = 0;
  v21[0] = xmmword_1AB2FC540;
  memset(&v21[1], 0, 64);
  v14[2](v14, v21);
  uint64_t v20 = 0;
  memset(&v19[1], 0, 64);
  v19[0] = vdupq_n_s64(1uLL);
  v14[2](v14, v19);
  uint64_t v18 = 0;
  memset(&v17[1], 0, 64);
  v17[0] = xmmword_1AB2ED380;
  v14[2](v14, v17);
  uint64_t v16 = 0;
  memset(&v15[1], 0, 64);
  v15[0] = xmmword_1AB2ED390;
  v14[2](v14, v15);

  _Block_object_dispose(v30, 8);
}

void __79__PXPhotosDetailsHeaderTileLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
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
    uint64_t v10 = *(void **)(a1 + 32);
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
        long long v19 = *(void (**)(uint64_t, _OWORD *, CGRect *, uint64_t, id, uint64_t, uint64_t, uint64_t))(v17 + 16);
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

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    long long v4 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    [(PXTilingLayoutInvalidationContext *)v4 invalidateAllTiles];
    [(PXTilingLayoutInvalidationContext *)v4 invalidateContentBounds];
    [(PXTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)setSpec:(id)a3
{
  long long v5 = (PXPhotosDetailsHeaderSpec *)a3;
  if (self->_spec != v5)
  {
    long long v7 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    long long v6 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    [(PXTilingLayoutInvalidationContext *)v6 invalidateAllTiles];
    [(PXTilingLayout *)self invalidateLayoutWithContext:v6];

    long long v5 = v7;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->contentsRectForAspectRatio = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->titleFontName = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->playButtonSize = objc_opt_respondsToSelector() & 1;
  }
}

- (CGRect)previewRect
{
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  [(PXPhotosDetailsHeaderTileLayout *)self tileIdentifierForTileKind:1];
  v7[2] = v11;
  v7[3] = v12;
  v7[4] = v13;
  uint64_t v8 = v14;
  v7[0] = v9;
  v7[1] = v10;
  [(PXPhotosDetailsHeaderTileLayout *)self _rectForTileWithIdentifier:v7];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
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

- (void)setReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PXTilingLayout *)self referenceSize];
  double v7 = v6;
  double v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosDetailsHeaderTileLayout;
  -[PXTilingLayout setReferenceSize:](&v11, sel_setReferenceSize_, width, height);
  if (width != v7 || height != v9) {
    [(PXTilingLayout *)self invalidateLayout];
  }
}

- (PXPhotosDetailsHeaderTileLayout)init
{
  return [(PXPhotosDetailsHeaderTileLayout *)self initWithSpec:0];
}

- (PXPhotosDetailsHeaderTileLayout)initWithSpec:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosDetailsHeaderTileLayout;
  double v6 = [(PXTilingLayout *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_spec, a3);
    v7->_useTitledPlayButton = 0;
    if ([v5 userInterfaceIdiom] == 5) {
      v7->_useTitledPlayButton = 1;
    }
  }

  return v7;
}

@end