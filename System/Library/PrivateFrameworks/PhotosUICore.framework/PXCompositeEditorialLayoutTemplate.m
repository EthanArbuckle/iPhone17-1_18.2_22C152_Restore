@interface PXCompositeEditorialLayoutTemplate
- (PXCompositeEditorialLayoutTemplate)init;
- (PXCompositeEditorialLayoutTemplate)initWithDescriptorDictionary:(id)a3;
- (double)costForFittingLayoutItemInputs:(id)a3 inRange:(_NSRange)a4 ofTotalItemCount:(int64_t)a5 normalizedWeights:(double *)a6 useSaliency:(BOOL)a7;
- (double)tileAspectRatio;
- (int64_t)identifier;
- (int64_t)numberOfColumns;
- (int64_t)numberOfRects;
- (void)_enumerateRectsUsingBlock:(id)a3;
- (void)_initRectsStorageWithDescriptors:(id)a3;
- (void)dealloc;
- (void)getComputedRects:(CGRect *)a3 contentSize:(CGSize *)a4 forReferenceSize:(CGSize)a5 interTileSpacing:(double)a6;
@end

@implementation PXCompositeEditorialLayoutTemplate

- (double)tileAspectRatio
{
  return self->_tileAspectRatio;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (int64_t)numberOfRects
{
  return self->_numberOfRects;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (double)costForFittingLayoutItemInputs:(id)a3 inRange:(_NSRange)a4 ofTotalItemCount:(int64_t)a5 normalizedWeights:(double *)a6 useSaliency:(BOOL)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = a3;
  uint64_t v45 = 0;
  v46 = (double *)&v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  uint64_t v41 = 0;
  v42 = (double *)&v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v37 = 0;
  v38 = (double *)&v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  int64_t v14 = [(PXCompositeEditorialLayoutTemplate *)self numberOfRects];
  int64_t v15 = [(PXCompositeEditorialLayoutTemplate *)self numberOfColumns];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __124__PXCompositeEditorialLayoutTemplate_costForFittingLayoutItemInputs_inRange_ofTotalItemCount_normalizedWeights_useSaliency___block_invoke;
  v24 = &unk_1E5DC8F70;
  id v16 = v13;
  id v25 = v16;
  v26 = self;
  NSUInteger v31 = length;
  int64_t v32 = v14;
  int64_t v33 = a5;
  int64_t v34 = v15;
  BOOL v36 = a7;
  v27 = &v37;
  v28 = &v45;
  v35 = a6;
  v29 = &v41;
  NSUInteger v30 = location;
  [(PXCompositeEditorialLayoutTemplate *)self _enumerateRectsUsingBlock:&v21];
  int64_t v17 = [(PXCompositeEditorialLayoutTemplate *)self numberOfRects];
  double v18 = 100.000001;
  if (v17 + location != a5 - 1) {
    double v18 = 0.0;
  }
  double v19 = (v18 + v46[3] + v42[3] + v38[3]) / 0.100000001 / (double)self->_numberOfRects;

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v19;
}

void __124__PXCompositeEditorialLayoutTemplate_costForFittingLayoutItemInputs_inRange_ofTotalItemCount_normalizedWeights_useSaliency___block_invoke(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v45 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  v47.origin.x = a3;
  v47.origin.y = a4;
  v47.size.width = a5;
  v47.size.height = a6;
  double Width = CGRectGetWidth(v47);
  v48.origin.x = a3;
  v48.origin.y = a4;
  v48.size.width = a5;
  v48.size.height = a6;
  double v13 = Width / CGRectGetHeight(v48);
  [*(id *)(a1 + 40) tileAspectRatio];
  double v15 = v13 * v14;
  [v45 size];
  double v17 = v16;
  [v45 size];
  double v19 = v17 / v18;
  if (v15 - v19 >= 0.0) {
    double v20 = v15 - v19;
  }
  else {
    double v20 = -(v15 - v19);
  }
  if (a2) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = *(void *)(a1 + 72) != 0;
  }
  BOOL v22 = *(void *)(a1 + 88) - 1 != a2 || *(void *)(a1 + 80) + *(void *)(a1 + 72) != *(void *)(a1 + 96);
  v49.origin.x = a3;
  v49.origin.y = a4;
  v49.size.width = a5;
  v49.size.height = a6;
  if (*(void *)(a1 + 104) == (int)CGRectGetWidth(v49))
  {
    int v23 = v19 > 2.5 || v22;
    if ((v21 & v23 & 1) == 0) {
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
    }
                                                                              + 24)
                                                                  + 100.000001;
  }
  double v44 = v20;
  if (*(unsigned char *)(a1 + 120))
  {
    [v45 acceptableCropRect];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    [v45 preferredCropRect];
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    v50.origin.x = v25;
    v50.origin.y = v27;
    v50.size.width = v29;
    v50.size.height = v31;
    if (!CGRectIsNull(v50))
    {
      v51.origin.x = v33;
      v51.origin.y = v35;
      v51.size.width = v37;
      v51.size.height = v39;
      if (!CGRectIsNull(v51)) {
        PXSizeGetAspectRatio();
      }
    }
  }
  else
  {
    if (v20 >= 0.400000006)
    {
      double v40 = 0.100000001;
    }
    else
    {
      if (v20 >= 0.100000001) {
        goto LABEL_25;
      }
      double v40 = -0.100000001;
    }
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24)
                                                                + v40;
  }
LABEL_25:
  uint64_t v41 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v41 + 24)) {
    goto LABEL_33;
  }
  if (v44 >= 0.400000006)
  {
    double v43 = 0.100000001;
    goto LABEL_32;
  }
  double v42 = *(double *)(*(void *)(v41 + 16) + 8 * a2) - *(double *)(*(void *)(a1 + 112) + 8 * a2);
  if (v42 < 0.0) {
    double v42 = -v42;
  }
  if (v42 < 0.100000001)
  {
    double v43 = -0.100000001;
LABEL_32:
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24)
                                                                + v43;
  }
LABEL_33:
}

- (void)getComputedRects:(CGRect *)a3 contentSize:(CGSize *)a4 forReferenceSize:(CGSize)a5 interTileSpacing:(double)a6
{
  if (a3)
  {
    double width = a5.width;
    uint64_t v11 = [(PXCompositeEditorialLayoutTemplate *)self numberOfColumns];
    [(PXCompositeEditorialLayoutTemplate *)self tileAspectRatio];
    double v12 = (width - a6 * (double)(v11 - 1)) / (double)v11;
    uint64_t v18 = 0;
    double v19 = (double *)&v18;
    uint64_t v20 = 0x4010000000;
    BOOL v21 = &unk_1AB5D584F;
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v22 = *MEMORY[0x1E4F1DB28];
    long long v23 = v13;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __101__PXCompositeEditorialLayoutTemplate_getComputedRects_contentSize_forReferenceSize_interTileSpacing___block_invoke;
    v17[3] = &unk_1E5DC8F48;
    v17[4] = &v18;
    *(double *)&v17[5] = v12;
    *(double *)&v17[6] = a6;
    double v15 = v12 / v14;
    *(double *)&v17[7] = v12 / v14;
    v17[8] = a3;
    [(PXCompositeEditorialLayoutTemplate *)self _enumerateRectsUsingBlock:v17];
    if (a4)
    {
      CGFloat v16 = v19[7] * (v15 + a6) - a6;
      a4->double width = v19[6] * (v12 + a6) - a6;
      a4->height = v16;
    }
    _Block_object_dispose(&v18, 8);
  }
}

double __101__PXCompositeEditorialLayoutTemplate_getComputedRects_contentSize_forReferenceSize_interTileSpacing___block_invoke(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v18.origin.x = a3;
  v18.origin.y = a4;
  v18.size.double width = a5;
  v18.size.height = a6;
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), v18);
  double v12 = *(double *)(a1 + 48);
  double v13 = *(double *)(a1 + 40) + v12;
  double v14 = a3 * v13;
  double v15 = v12 + *(double *)(a1 + 56);
  double result = -(v12 - a5 * v13);
  double v17 = (double *)(*(void *)(a1 + 64) + 32 * a2);
  *double v17 = v14;
  v17[1] = a4 * v15;
  v17[2] = result;
  v17[3] = -(v12 - a6 * v15);
  return result;
}

- (void)_enumerateRectsUsingBlock:(id)a3
{
  if (self->_numberOfRects >= 1)
  {
    uint64_t v5 = 0;
    int64_t v6 = 0;
    do
    {
      char v7 = 0;
      (*((void (**)(id, int64_t, char *, CGFloat, CGFloat, CGFloat, CGFloat, double))a3 + 2))(a3, v6, &v7, self->_rects[v5].origin.x, self->_rects[v5].origin.y, self->_rects[v5].size.width, self->_rects[v5].size.height, self->_rectWeights[v6]);
      if (v7) {
        break;
      }
      ++v6;
      ++v5;
    }
    while (v6 < self->_numberOfRects);
  }
}

- (void)dealloc
{
  free(self->_rects);
  free(self->_rectWeights);
  v3.receiver = self;
  v3.super_class = (Class)PXCompositeEditorialLayoutTemplate;
  [(PXCompositeEditorialLayoutTemplate *)&v3 dealloc];
}

- (void)_initRectsStorageWithDescriptors:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 count];
  self->_numberOfRects = v5;
  self->_rects = (CGRect *)malloc_type_malloc(32 * v5, 0x1000040E0EAB150uLL);
  self->_rectWeights = (double *)malloc_type_malloc(8 * self->_numberOfRects, 0x100004000313F17uLL);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0x47EFFFFFE0000000;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PXCompositeEditorialLayoutTemplate__initRectsStorageWithDescriptors___block_invoke;
  v6[3] = &unk_1E5DC8F20;
  v6[4] = self;
  v6[5] = v8;
  v6[6] = v7;
  [v4 enumerateObjectsUsingBlock:v6];
  PXFloatApproximatelyEqualToFloat();
}

void __71__PXCompositeEditorialLayoutTemplate__initRectsStorageWithDescriptors___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  int64_t v6 = [v5 objectAtIndexedSubscript:0];
  [v6 floatValue];
  double v8 = v7;
  v9 = [v5 objectAtIndexedSubscript:1];
  [v9 floatValue];
  double v11 = v10;
  double v12 = [v5 objectAtIndexedSubscript:2];
  [v12 floatValue];
  double v14 = v13;
  double v15 = [v5 objectAtIndexedSubscript:3];

  [v15 floatValue];
  double v17 = v16;

  CGRect v18 = (double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32 * a3);
  *CGRect v18 = v8;
  v18[1] = v11;
  v18[2] = v14;
  v18[3] = v17;
  PXRectArea();
}

- (PXCompositeEditorialLayoutTemplate)initWithDescriptorDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXCompositeEditorialLayoutTemplate;
  id v5 = [(PXCompositeEditorialLayoutTemplate *)&v12 init];
  if (v5)
  {
    int64_t v6 = [v4 objectForKeyedSubscript:@"numberOfColumns"];
    v5->_numberOfColumns = [v6 integerValue];

    float v7 = [v4 objectForKeyedSubscript:@"aspectRatio"];
    [v7 floatValue];
    v5->_tileAspectRatio = v8;

    v9 = [v4 objectForKeyedSubscript:@"id"];
    v5->_identifier = [v9 integerValue];

    float v10 = [v4 objectForKeyedSubscript:@"rects"];
    [(PXCompositeEditorialLayoutTemplate *)v5 _initRectsStorageWithDescriptors:v10];
  }
  return v5;
}

- (PXCompositeEditorialLayoutTemplate)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCompositeEditorialLayoutTemplate.m", 36, @"%s is not available as initializer", "-[PXCompositeEditorialLayoutTemplate init]");

  abort();
}

@end