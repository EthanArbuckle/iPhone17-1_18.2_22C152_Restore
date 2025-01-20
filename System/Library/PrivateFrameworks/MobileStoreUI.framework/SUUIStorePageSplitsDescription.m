@interface SUUIStorePageSplitsDescription
- (SUUIStorePageSplit)bottomSplit;
- (SUUIStorePageSplit)firstSplit;
- (SUUIStorePageSplit)leftSplit;
- (SUUIStorePageSplit)rightSplit;
- (SUUIStorePageSplit)topSplit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)numberOfSplits;
- (void)enumerateSplitsUsingBlock:(id)a3;
- (void)setBottomSplit:(id)a3;
- (void)setLeftSplit:(id)a3;
- (void)setRightSplit:(id)a3;
- (void)setTopSplit:(id)a3;
- (void)sizeSplitsToFitWidth:(double)a3 usingBlock:(id)a4;
@end

@implementation SUUIStorePageSplitsDescription

- (void)enumerateSplitsUsingBlock:(id)a3
{
  v11[4] = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  v11[0] = self->_topSplit;
  v11[1] = self->_leftSplit;
  v11[2] = self->_rightSplit;
  v5 = self->_bottomSplit;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  v11[3] = v5;
  do
  {
    char v10 = 0;
    uint64_t v8 = v11[v6];
    if (v8)
    {
      v4[2](v4, v8, v7, &v10);
      if (v10) {
        break;
      }
      ++v7;
    }
    ++v6;
  }
  while (v6 != 4);
  for (uint64_t i = 3; i != -1; --i)
}

- (SUUIStorePageSplit)firstSplit
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__55;
  v9 = __Block_byref_object_dispose__55;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SUUIStorePageSplitsDescription_firstSplit__block_invoke;
  v4[3] = &unk_265406340;
  v4[4] = &v5;
  [(SUUIStorePageSplitsDescription *)self enumerateSplitsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUIStorePageSplit *)v2;
}

void __44__SUUIStorePageSplitsDescription_firstSplit__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

- (int64_t)numberOfSplits
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__SUUIStorePageSplitsDescription_numberOfSplits__block_invoke;
  v4[3] = &unk_265406340;
  v4[4] = &v5;
  [(SUUIStorePageSplitsDescription *)self enumerateSplitsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __48__SUUIStorePageSplitsDescription_numberOfSplits__block_invoke(uint64_t result)
{
  return result;
}

- (void)sizeSplitsToFitWidth:(double)a3 usingBlock:(id)a4
{
  id v6 = a4;
  rightSplit = self->_rightSplit;
  if (!rightSplit) {
    rightSplit = self->_leftSplit;
  }
  uint64_t v8 = rightSplit;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  *(double *)&v16[3] = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__SUUIStorePageSplitsDescription_sizeSplitsToFitWidth_usingBlock___block_invoke;
  v11[3] = &unk_265406368;
  v11[4] = self;
  id v9 = v6;
  id v13 = v9;
  double v15 = a3;
  id v10 = v8;
  v12 = v10;
  v14 = v16;
  [(SUUIStorePageSplitsDescription *)self enumerateSplitsUsingBlock:v11];

  _Block_object_dispose(v16, 8);
}

void __66__SUUIStorePageSplitsDescription_sizeSplitsToFitWidth_usingBlock___block_invoke(double *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v9 = (id *)*((void *)a1 + 4);
  id v16 = v7;
  if (v9[4] == v7 || v9[1] == v7)
  {
    uint64_t v15 = *((void *)a1 + 6);
    v8.n128_f64[0] = a1[8];
LABEL_9:
    (*(void (**)(uint64_t, id, uint64_t, uint64_t, __n128))(v15 + 16))(v15, v16, a3, a4, v8);
    v14 = v16;
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
  v14 = v16;
  *(double *)(*(void *)(*((void *)a1 + 7) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(double *)(*(void *)(*((void *)a1 + 7) + 8) + 24)
                                                             - v13;
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setBottomSplit:self->_bottomSplit];
  [v4 setLeftSplit:self->_leftSplit];
  [v4 setRightSplit:self->_rightSplit];
  [v4 setTopSplit:self->_topSplit];
  return v4;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SUUIStorePageSplitsDescription;
  v4 = [(SUUIStorePageSplitsDescription *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: Splits: [T: %@, L: %@, R: %@, B: %@]", v4, self->_topSplit, self->_leftSplit, self->_rightSplit, self->_bottomSplit];

  return v5;
}

- (SUUIStorePageSplit)bottomSplit
{
  return self->_bottomSplit;
}

- (void)setBottomSplit:(id)a3
{
}

- (SUUIStorePageSplit)leftSplit
{
  return self->_leftSplit;
}

- (void)setLeftSplit:(id)a3
{
}

- (SUUIStorePageSplit)rightSplit
{
  return self->_rightSplit;
}

- (void)setRightSplit:(id)a3
{
}

- (SUUIStorePageSplit)topSplit
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

@end