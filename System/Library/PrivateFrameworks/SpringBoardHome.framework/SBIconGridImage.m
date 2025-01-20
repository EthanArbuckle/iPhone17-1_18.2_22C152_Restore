@interface SBIconGridImage
+ (CGRect)rectAtIndex:(unint64_t)a3 inLayout:(id)a4 maxCount:(unint64_t)a5;
+ (CGSize)sizeForLayout:(id)a3;
+ (id)gridImageForLayout:(id)a3 imageAppearance:(id)a4 cellImageDrawBlock:(id)a5;
+ (id)gridImageForLayout:(id)a3 imageAppearance:(id)a4 pool:(id)a5 cellImageDrawBlock:(id)a6;
+ (id)gridImageForLayout:(id)a3 imageAppearance:(id)a4 previousGridImage:(id)a5 previousGridCellIndexToUpdate:(unint64_t)a6 pool:(id)a7 cellImageDrawBlock:(id)a8;
+ (unint64_t)numberOfRowsForNumberOfCells:(unint64_t)a3 inLayout:(id)a4;
- (BOOL)isIconImageLoadingAtIndex:(unint64_t)a3;
- (BOOL)isIconImageTreatedAtIndex:(unint64_t)a3;
- (CPMemoryPool)pool;
- (SBHIconImageAppearance)imageAppearance;
- (SBIconListLayout)listLayout;
- (id)gridImageByPatchingCellAtIndex:(unint64_t)a3 cellImageProviderBlock:(id)a4;
- (id)iconImageAtIndex:(unint64_t)a3;
- (unint64_t)numberOfCells;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfLoadingCells;
- (unint64_t)numberOfRows;
- (unint64_t)numberOfUsedCells;
- (unsigned)loadingCells;
- (unsigned)treatedCells;
- (unsigned)usedCells;
- (void)setImageAppearance:(id)a3;
- (void)setListLayout:(id)a3;
- (void)setLoadingCells:(unsigned int)a3;
- (void)setPool:(id)a3;
- (void)setTreatedCells:(unsigned int)a3;
- (void)setUsedCells:(unsigned int)a3;
@end

@implementation SBIconGridImage

- (unint64_t)numberOfColumns
{
  v2 = [(SBIconGridImage *)self listLayout];
  unint64_t v3 = [v2 numberOfColumnsForOrientation:1];

  return v3;
}

- (unint64_t)numberOfCells
{
  v2 = [(SBIconGridImage *)self listLayout];
  unint64_t v3 = SBHIconListLayoutMaximumIconCount(v2);

  return v3;
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

+ (CGRect)rectAtIndex:(unint64_t)a3 inLayout:(id)a4 maxCount:(unint64_t)a5
{
  id v8 = a4;
  unint64_t v9 = [v8 numberOfColumnsForOrientation:1];
  double v10 = SBHIconListLayoutFolderIconGridCellSize(v8);
  double v12 = v11;
  double v13 = SBHIconListLayoutFolderIconGridCellSpacing(v8);
  double v15 = v14;
  if (v9)
  {
    unint64_t v16 = a3 / v9;
    unint64_t v17 = a3 % v9;
  }
  else
  {
    unint64_t v16 = 0;
    unint64_t v17 = 0;
  }
  uint64_t v18 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  unint64_t v19 = v9 + ~v17;
  if (v18 != 1) {
    unint64_t v19 = v17;
  }
  double v20 = v10 + v13;
  double v21 = (v10 + v13) * (double)v19;
  if (v16 == [a1 numberOfRowsForNumberOfCells:a5 inLayout:v8] - 1) {
    double v21 = v21 + floor(v20 * (double)(v9 - a5 + v16 * v9) * 0.5);
  }

  double v22 = v21;
  double v23 = (v12 + v15) * (double)v16;
  double v24 = v10;
  double v25 = v12;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (CGSize)sizeForLayout:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 numberOfRowsForOrientation:1];
  unint64_t v5 = [v3 numberOfColumnsForOrientation:1];
  double v6 = SBHIconListLayoutFolderIconGridCellSize(v3);
  double v8 = v7;
  double v9 = SBHIconListLayoutFolderIconGridCellSpacing(v3);
  double v11 = v10;

  double v12 = v9 * (double)(v5 - 1);
  double v13 = 0.0;
  if (!v5) {
    double v12 = 0.0;
  }
  if (v4) {
    double v13 = v11 * (double)(v4 - 1);
  }
  double v14 = v12 + (double)v5 * v6;
  double v15 = v13 + (double)v4 * v8;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (unint64_t)numberOfRowsForNumberOfCells:(unint64_t)a3 inLayout:(id)a4
{
  return (a3 - 1) / [a4 numberOfColumnsForOrientation:1] + 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_imageAppearance, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
}

+ (id)gridImageForLayout:(id)a3 imageAppearance:(id)a4 previousGridImage:(id)a5 previousGridCellIndexToUpdate:(unint64_t)a6 pool:(id)a7 cellImageDrawBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  unint64_t v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v19 scale];
  double v21 = v20;

  uint64_t v22 = SBHIconListLayoutMaximumIconCount(v14);
  [a1 sizeForLayout:v14];
  double v24 = v23;
  double v26 = v25;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  int v63 = 0;
  v38 = v17;
  int v63 = [v16 treatedCells];
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  int v61 = 0;
  v27 = v15;
  int v61 = [v16 loadingCells];
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  int v59 = 0;
  int v59 = [v16 usedCells];
  context = (void *)MEMORY[0x1D9484600]();
  v28 = (void *)MEMORY[0x1E4FB1818];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __126__SBIconGridImage_gridImageForLayout_imageAppearance_previousGridImage_previousGridCellIndexToUpdate_pool_cellImageDrawBlock___block_invoke;
  v47[3] = &unk_1E6AB1578;
  id v29 = v16;
  id v48 = v29;
  uint64_t v55 = v22;
  unint64_t v56 = a6;
  id v57 = a1;
  id v49 = v14;
  v51 = v62;
  v52 = v58;
  id v30 = v18;
  id v50 = v30;
  v53 = &v64;
  v54 = v60;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __126__SBIconGridImage_gridImageForLayout_imageAppearance_previousGridImage_previousGridCellIndexToUpdate_pool_cellImageDrawBlock___block_invoke_2;
  v39[3] = &unk_1E6AB15A0;
  id v46 = a1;
  id v31 = v49;
  id v40 = v31;
  id v32 = v27;
  id v41 = v32;
  id v33 = v38;
  id v42 = v33;
  v43 = v62;
  v44 = v60;
  v45 = v58;
  v34 = objc_msgSend(v28, "sbf_imageFromContextWithSize:scale:type:pool:drawing:encapsulation:", 0, v33, v47, v39, v24, v26, v21);

  if (v29 && !v65[3])
  {
    id v35 = v29;

    v34 = v35;
  }
  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v60, 8);
  _Block_object_dispose(v62, 8);
  _Block_object_dispose(&v64, 8);

  return v34;
}

uint64_t __126__SBIconGridImage_gridImageForLayout_imageAppearance_previousGridImage_previousGridCellIndexToUpdate_pool_cellImageDrawBlock___block_invoke(uint64_t a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
  id v3 = *(void **)(a1 + 32);
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v3 size];
  uint64_t result = objc_msgSend(v3, "drawInRect:", v4, v5, v6, v7);
  unint64_t v9 = *(void *)(a1 + 88);
  if (v9)
  {
    unint64_t v10 = 0;
    while (1)
    {
      if (!*(void *)(a1 + 32)) {
        goto LABEL_8;
      }
      if (v10 == *(void *)(a1 + 96)) {
        break;
      }
LABEL_12:
      if (++v10 >= v9) {
        return result;
      }
    }
    double v11 = UIGraphicsGetCurrentContext();
    [*(id *)(a1 + 104) rectAtIndex:v10 inLayout:*(void *)(a1 + 40) maxCount:*(void *)(a1 + 88)];
    CGContextClearRect(v11, v14);
    int v12 = 1 << v10;
    if (v10 <= 0x1F) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) &= ~v12;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= v12;
    unint64_t v9 = *(void *)(a1 + 88);
LABEL_8:
    [*(id *)(a1 + 104) rectAtIndex:v10 inLayout:*(void *)(a1 + 40) maxCount:v9];
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    if (result)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      int v13 = 1 << v10;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= 1 << v10;
      if (v10 <= 0x1F)
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) &= ~v13;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) &= ~v13;
      }
    }
    unint64_t v9 = *(void *)(a1 + 88);
    goto LABEL_12;
  }
  return result;
}

id __126__SBIconGridImage_gridImageForLayout_imageAppearance_previousGridImage_previousGridCellIndexToUpdate_pool_cellImageDrawBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  double v5 = (void *)[objc_alloc(*(Class *)(a1 + 80)) initWithCGImage:a2 scale:a3 orientation:a4];
  [v5 setListLayout:*(void *)(a1 + 32)];
  [v5 setImageAppearance:*(void *)(a1 + 40)];
  [v5 setPool:*(void *)(a1 + 48)];
  [v5 setTreatedCells:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v5 setLoadingCells:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v5 setUsedCells:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  return v5;
}

+ (id)gridImageForLayout:(id)a3 imageAppearance:(id)a4 cellImageDrawBlock:(id)a5
{
  return (id)[a1 gridImageForLayout:a3 imageAppearance:a4 previousGridImage:0 previousGridCellIndexToUpdate:0x7FFFFFFFFFFFFFFFLL pool:0 cellImageDrawBlock:a5];
}

+ (id)gridImageForLayout:(id)a3 imageAppearance:(id)a4 pool:(id)a5 cellImageDrawBlock:(id)a6
{
  return (id)[a1 gridImageForLayout:a3 imageAppearance:a4 previousGridImage:0 previousGridCellIndexToUpdate:0x7FFFFFFFFFFFFFFFLL pool:a5 cellImageDrawBlock:a6];
}

- (id)gridImageByPatchingCellAtIndex:(unint64_t)a3 cellImageProviderBlock:(id)a4
{
  id v6 = a4;
  double v7 = objc_opt_class();
  double v8 = [(SBIconGridImage *)self listLayout];
  unint64_t v9 = [(SBIconGridImage *)self imageAppearance];
  unint64_t v10 = [(SBIconGridImage *)self pool];
  double v11 = [v7 gridImageForLayout:v8 imageAppearance:v9 previousGridImage:self previousGridCellIndexToUpdate:a3 pool:v10 cellImageDrawBlock:v6];

  return v11;
}

- (unint64_t)numberOfRows
{
  v2 = [(SBIconGridImage *)self listLayout];
  unint64_t v3 = [v2 numberOfRowsForOrientation:1];

  return v3;
}

- (unint64_t)numberOfUsedCells
{
  uint8x8_t v2 = (uint8x8_t)vcnt_s8((int8x8_t)self->_usedCells);
  v2.i16[0] = vaddlv_u8(v2);
  return v2.u32[0];
}

- (id)iconImageAtIndex:(unint64_t)a3
{
  double v5 = objc_opt_class();
  id v6 = [(SBIconGridImage *)self listLayout];
  objc_msgSend(v5, "rectAtIndex:inLayout:maxCount:", a3, v6, -[SBIconGridImage numberOfCells](self, "numberOfCells"));
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  uint64_t v15 = [(SBIconGridImage *)self CGImage];
  if (!v15) {
    goto LABEL_4;
  }
  id v16 = (CGImage *)v15;
  id v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v17 scale];
  CGFloat v19 = v18;

  CGAffineTransformMakeScale(&v24, v19, v19);
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  CGRect v27 = CGRectApplyAffineTransform(v26, &v24);
  CGImageRef v20 = CGImageCreateWithImageInRect(v16, v27);
  if (v20)
  {
    double v21 = v20;
    uint64_t v22 = [MEMORY[0x1E4FB1818] imageWithCGImage:v20 scale:0 orientation:v19];
    CGImageRelease(v21);
  }
  else
  {
LABEL_4:
    uint64_t v22 = 0;
  }
  return v22;
}

- (BOOL)isIconImageTreatedAtIndex:(unint64_t)a3
{
  if (a3 <= 0x20) {
    return (self->_treatedCells >> a3) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isIconImageLoadingAtIndex:(unint64_t)a3
{
  if (a3 <= 0x20) {
    return (self->_loadingCells >> a3) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (unint64_t)numberOfLoadingCells
{
  uint8x8_t v2 = (uint8x8_t)vcnt_s8((int8x8_t)self->_loadingCells);
  v2.i16[0] = vaddlv_u8(v2);
  return v2.u32[0];
}

- (void)setListLayout:(id)a3
{
}

- (SBHIconImageAppearance)imageAppearance
{
  return self->_imageAppearance;
}

- (void)setImageAppearance:(id)a3
{
}

- (CPMemoryPool)pool
{
  return self->_pool;
}

- (void)setPool:(id)a3
{
}

- (unsigned)treatedCells
{
  return self->_treatedCells;
}

- (void)setTreatedCells:(unsigned int)a3
{
  self->_treatedCells = a3;
}

- (unsigned)loadingCells
{
  return self->_loadingCells;
}

- (void)setLoadingCells:(unsigned int)a3
{
  self->_loadingCells = a3;
}

- (unsigned)usedCells
{
  return self->_usedCells;
}

- (void)setUsedCells:(unsigned int)a3
{
  self->_usedCells = a3;
}

@end