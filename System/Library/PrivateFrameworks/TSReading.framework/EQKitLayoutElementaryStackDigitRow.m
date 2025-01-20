@interface EQKitLayoutElementaryStackDigitRow
- (BOOL)spansStack;
- (EQKitLayoutElementaryStackDigitRow)initWithChildren:(id)a3 decimalPoint:(unint64_t)a4 position:(int64_t)a5 followingSpace:(double)a6;
- (double)followingSpace;
- (id)newBoxWithStackWidth:(double)a3 columnWidthIter:(__wrap_iter<double *>)a4 iterMax:(__wrap_iter<double *>)a5 previousRow:(id)a6 layoutManager:(const void *)a7;
- (id)p_crossoutDigitBox:(id)a3 crossout:(int)a4 layoutManager:(const void *)a5;
- (int64_t)alignmentShift;
- (unint64_t)columnCount;
- (unint64_t)firstColumnIndex;
- (void)dealloc;
- (void)populateMaxColumnWidths:(__wrap_iter<double *>)a3;
- (void)setFirstColumnIndex:(unint64_t)a3;
@end

@implementation EQKitLayoutElementaryStackDigitRow

- (EQKitLayoutElementaryStackDigitRow)initWithChildren:(id)a3 decimalPoint:(unint64_t)a4 position:(int64_t)a5 followingSpace:(double)a6
{
  v14.receiver = self;
  v14.super_class = (Class)EQKitLayoutElementaryStackDigitRow;
  v10 = [(EQKitLayoutElementaryStackDigitRow *)&v14 init];
  if (v10)
  {
    v11 = (NSArray *)a3;
    v10->mFollowingSpace = a6;
    unint64_t v12 = v10->mAlignmentShift - (a5 + a4);
    v10->mColumnBoxes = v11;
    v10->mAlignmentShift = v12;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitLayoutElementaryStackDigitRow;
  [(EQKitLayoutElementaryStackDigitRow *)&v3 dealloc];
}

- (unint64_t)columnCount
{
  return [(NSArray *)self->mColumnBoxes count];
}

- (void)populateMaxColumnWidths:(__wrap_iter<double *>)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mColumnBoxes = self->mColumnBoxes;
  uint64_t v5 = [(NSArray *)mColumnBoxes countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(mColumnBoxes);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) width];
        if (*a3.var0 >= v9) {
          double v9 = *a3.var0;
        }
        *a3.var0 = v9;
        a3.var0 += 8;
      }
      uint64_t v6 = [(NSArray *)mColumnBoxes countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)spansStack
{
  return 0;
}

- (id)p_crossoutDigitBox:(id)a3 crossout:(int)a4 layoutManager:(const void *)a5
{
  uint64_t v5 = (EQKitOverlayBox *)a3;
  if (a4)
  {
    [a3 width];
    if (v8 != 0.0)
    {
      [(EQKitOverlayBox *)v5 height];
      if (v9 != 0.0)
      {
        if ((a4 - 2) >= 3) {
          int v10 = 1;
        }
        else {
          int v10 = a4;
        }
        PathForNotation = EQKitLayoutManager::createPathForNotation((EQKitLayoutManager *)a5, v5, v10);
        long long v12 = [EQKitPathBox alloc];
        [(EQKitOverlayBox *)v5 height];
        double v14 = v13;
        uint64_t v15 = *(void *)(EQKitLayoutManager::layoutContext((EQKitLayoutManager *)a5) + 96);
        unint64_t v16 = EQKitLayoutManager::layoutContext((EQKitLayoutManager *)a5);
        unint64_t v18 = v16;
        uint64_t v19 = *(void *)(v16 + 80);
        if (*(unsigned char *)(v16 + 104)) {
          v17.n128_u64[0] = *(void *)(v16 + 112);
        }
        else {
          v17.n128_f64[0] = EQKitLayoutContext::pComputeRuleThickness((EQKitLayoutContext *)v16);
        }
        v20 = [(EQKitPathBox *)v12 initWithCGPath:PathForNotation height:v15 cgColor:2 drawingMode:v14 lineWidth:(*(double (**)(uint64_t, uint64_t, unint64_t, __n128))(*(void *)v19 + 40))(v19, 23, v18 + 8, v17)];
        uint64_t v5 = [[EQKitOverlayBox alloc] initWithBox:v5 overlayBox:v20];

        CGPathRelease(PathForNotation);
      }
    }
  }
  return v5;
}

- (id)newBoxWithStackWidth:(double)a3 columnWidthIter:(__wrap_iter<double *>)a4 iterMax:(__wrap_iter<double *>)a5 previousRow:(id)a6 layoutManager:(const void *)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    a6 = 0;
  }
  unint64_t mFirstColumnIndex = self->mFirstColumnIndex;
  uint64_t v12 = [a6 firstColumnIndex];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v27 = self;
  obj = self->mColumnBoxes;
  uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    unint64_t v30 = mFirstColumnIndex - v12;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(id *)(*((void *)&v31 + 1) + 8 * i);
        double v18 = *a4.var0;
        if (a6 && ((v30 + i) & 0x8000000000000000) == 0) {
          id v17 = -[EQKitLayoutElementaryStackDigitRow p_crossoutDigitBox:crossout:layoutManager:](v27, "p_crossoutDigitBox:crossout:layoutManager:", v17, objc_msgSend(a6, "crossoutAtColumnIndex:"), a7);
        }
        uint64_t v19 = [EQKitHSpace alloc];
        [v17 width];
        v21 = [(EQKitHSpace *)v19 initWithWidth:(v18 - v20) * 0.5];
        v22 = [EQKitHSpace alloc];
        [v17 width];
        v24 = [(EQKitHSpace *)v22 initWithWidth:(v18 - v23) * 0.5];
        [v10 addObject:v21];
        [v10 addObject:v17];
        [v10 addObject:v24];

        a4.var0 += 8;
      }
      uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      v30 += i;
    }
    while (v14);
  }
  v25 = [(EQKitCompoundBox *)[EQKitHBox alloc] initWithChildBoxes:v10];

  return v25;
}

- (int64_t)alignmentShift
{
  return self->mAlignmentShift;
}

- (unint64_t)firstColumnIndex
{
  return self->mFirstColumnIndex;
}

- (void)setFirstColumnIndex:(unint64_t)a3
{
  self->unint64_t mFirstColumnIndex = a3;
}

- (double)followingSpace
{
  return self->mFollowingSpace;
}

@end