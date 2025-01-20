@interface SKUIStorePageSplitsDescription
- (SKUIStorePageSplit)bottomSplit;
- (SKUIStorePageSplit)firstSplit;
- (SKUIStorePageSplit)leftSplit;
- (SKUIStorePageSplit)rightSplit;
- (SKUIStorePageSplit)topSplit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)numberOfSplits;
- (void)description;
- (void)enumerateSplitsUsingBlock:(id)a3;
- (void)firstSplit;
- (void)numberOfSplits;
- (void)setBottomSplit:(id)a3;
- (void)setLeftSplit:(id)a3;
- (void)setRightSplit:(id)a3;
- (void)setTopSplit:(id)a3;
- (void)sizeSplitsToFitWidth:(double)a3 usingBlock:(id)a4;
@end

@implementation SKUIStorePageSplitsDescription

- (void)enumerateSplitsUsingBlock:(id)a3
{
  v19[4] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIStorePageSplitsDescription enumerateSplitsUsingBlock:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v19[0] = self->_topSplit;
  v19[1] = self->_leftSplit;
  v19[2] = self->_rightSplit;
  v13 = self->_bottomSplit;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  v19[3] = v13;
  do
  {
    char v18 = 0;
    uint64_t v16 = v19[v14];
    if (v16)
    {
      v4[2](v4, v16, v15, &v18);
      if (v18) {
        break;
      }
      ++v15;
    }
    ++v14;
  }
  while (v14 != 4);
  for (uint64_t i = 3; i != -1; --i)
}

- (SKUIStorePageSplit)firstSplit
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        [(SKUIStorePageSplitsDescription *)v3 firstSplit];
      }
    }
  }
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__57;
  char v18 = __Block_byref_object_dispose__57;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__SKUIStorePageSplitsDescription_firstSplit__block_invoke;
  v13[3] = &unk_1E6427EC8;
  v13[4] = &v14;
  [(SKUIStorePageSplitsDescription *)self enumerateSplitsUsingBlock:v13];
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (SKUIStorePageSplit *)v11;
}

void __44__SKUIStorePageSplitsDescription_firstSplit__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

- (int64_t)numberOfSplits
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        [(SKUIStorePageSplitsDescription *)v3 numberOfSplits];
      }
    }
  }
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__SKUIStorePageSplitsDescription_numberOfSplits__block_invoke;
  v13[3] = &unk_1E6427EC8;
  v13[4] = &v14;
  [(SKUIStorePageSplitsDescription *)self enumerateSplitsUsingBlock:v13];
  int64_t v11 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v11;
}

uint64_t __48__SKUIStorePageSplitsDescription_numberOfSplits__block_invoke(uint64_t result)
{
  return result;
}

- (void)sizeSplitsToFitWidth:(double)a3 usingBlock:(id)a4
{
  id v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v7) {
        -[SKUIStorePageSplitsDescription sizeSplitsToFitWidth:usingBlock:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  rightSplit = self->_rightSplit;
  if (!rightSplit) {
    rightSplit = self->_leftSplit;
  }
  uint64_t v16 = rightSplit;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  *(double *)&v24[3] = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__SKUIStorePageSplitsDescription_sizeSplitsToFitWidth_usingBlock___block_invoke;
  v19[3] = &unk_1E6427EF0;
  v19[4] = self;
  id v17 = v6;
  id v21 = v17;
  double v23 = a3;
  char v18 = v16;
  v20 = v18;
  v22 = v24;
  [(SKUIStorePageSplitsDescription *)self enumerateSplitsUsingBlock:v19];

  _Block_object_dispose(v24, 8);
}

void __66__SKUIStorePageSplitsDescription_sizeSplitsToFitWidth_usingBlock___block_invoke(double *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v9 = (id *)*((void *)a1 + 4);
  id v16 = v7;
  if (v9[4] == v7 || v9[1] == v7)
  {
    uint64_t v15 = *((void *)a1 + 6);
    v8.n128_f64[0] = a1[8];
LABEL_9:
    (*(void (**)(uint64_t, id, uint64_t, uint64_t, __n128))(v15 + 16))(v15, v16, a3, a4, v8);
    uint64_t v14 = v16;
    goto LABEL_10;
  }
  if (*((id *)a1 + 5) == v7)
  {
    uint64_t v15 = *((void *)a1 + 6);
    v8.n128_u64[0] = *(void *)(*(void *)(*((void *)a1 + 7) + 8) + 24);
    goto LABEL_9;
  }
  [v9[2] widthFraction];
  if (v10 < 0.00000011920929)
  {
    [*(id *)(*((void *)a1 + 4) + 24) widthFraction];
    double v10 = 1.0 - v11;
  }
  float v12 = v10 * a1[8];
  double v13 = roundf(v12);
  (*(void (**)(double))(*((void *)a1 + 6) + 16))(v13);
  uint64_t v14 = v16;
  *(double *)(*(void *)(*((void *)a1 + 7) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(double *)(*(void *)(*((void *)a1 + 7) + 8) + 24)
                                                             - v13;
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIStorePageSplitsDescription copyWithZone:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v13 setBottomSplit:self->_bottomSplit];
  [v13 setLeftSplit:self->_leftSplit];
  [v13 setRightSplit:self->_rightSplit];
  [v13 setTopSplit:self->_topSplit];
  return v13;
}

- (id)description
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStorePageSplitsDescription description]();
  }
  BOOL v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SKUIStorePageSplitsDescription;
  uint64_t v4 = [(SKUIStorePageSplitsDescription *)&v7 description];
  BOOL v5 = [v3 stringWithFormat:@"%@: Splits: [T: %@, L: %@, R: %@, B: %@]", v4, self->_topSplit, self->_leftSplit, self->_rightSplit, self->_bottomSplit];

  return v5;
}

- (SKUIStorePageSplit)bottomSplit
{
  return self->_bottomSplit;
}

- (void)setBottomSplit:(id)a3
{
}

- (SKUIStorePageSplit)leftSplit
{
  return self->_leftSplit;
}

- (void)setLeftSplit:(id)a3
{
}

- (SKUIStorePageSplit)rightSplit
{
  return self->_rightSplit;
}

- (void)setRightSplit:(id)a3
{
}

- (SKUIStorePageSplit)topSplit
{
  return self->_topSplit;
}

- (void)setTopSplit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSplit, 0);
  objc_storeStrong((id *)&self->_rightSplit, 0);
  objc_storeStrong((id *)&self->_leftSplit, 0);

  objc_storeStrong((id *)&self->_bottomSplit, 0);
}

- (void)enumerateSplitsUsingBlock:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)firstSplit
{
}

- (void)numberOfSplits
{
}

- (void)sizeSplitsToFitWidth:(uint64_t)a3 usingBlock:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)description
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStorePageSplitsDescription description]";
}

@end