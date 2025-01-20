@interface EDReferenceCollection
+ (id)coalesceCollection;
+ (id)noCoalesceCollection;
- (BOOL)coalesceReferenceAtIndex1:(unint64_t)a3 index2:(unint64_t)a4;
- (EDReferenceCollection)init;
- (id)initWihNoCoalesce;
- (id)referenceToCellWithIndex:(unint64_t)a3 byRow:(BOOL)a4;
- (id)reverseReferencesByRow:(BOOL)a3;
- (unint64_t)addObject:(id)a3;
- (unint64_t)countOfCellsBeingReferenced;
- (void)coalesce;
- (void)coalesceProgressiveCellReferencesCollection;
@end

@implementation EDReferenceCollection

- (EDReferenceCollection)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDReferenceCollection;
  result = [(EDCollection *)&v3 init];
  if (result) {
    result->mCoalesce = 1;
  }
  return result;
}

- (unint64_t)addObject:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EDReferenceCollection;
  [(EDCollection *)&v6 addObject:v4];
  if (self->mCoalesce) {
    [(EDReferenceCollection *)self coalesce];
  }

  return -1;
}

- (void)coalesce
{
  unint64_t v3 = [(EDCollection *)self count];
  unint64_t v4 = v3 - 2;
  if (v3 >= 2)
  {
    unint64_t v5 = v3 - 1;
    uint64_t v6 = 2;
    if (v4 < 2) {
      uint64_t v6 = v3 - 2;
    }
    uint64_t v7 = v6 + 1;
    while (![(EDReferenceCollection *)self coalesceReferenceAtIndex1:v4 index2:v5])
    {
      --v4;
      if (!--v7) {
        return;
      }
    }
    [(EDReferenceCollection *)self coalesce];
  }
}

- (BOOL)coalesceReferenceAtIndex1:(unint64_t)a3 index2:(unint64_t)a4
{
  uint64_t v6 = [(EDCollection *)self objectAtIndex:a3];
  uint64_t v7 = [(EDCollection *)self objectAtIndex:a4];
  v8 = (void *)v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    if (([v6 fullyAdjacentToReference:v7] & 1) != 0
      || ([v6 isEqualToReference:v8] & 1) != 0)
    {
      [v6 unionWithReference:v8];
      [(EDCollection *)self removeObjectAtIndex:a4];
      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)countOfCellsBeingReferenced
{
  unint64_t v3 = [(EDCollection *)self count];
  if (!v3) {
    return 0;
  }
  unint64_t v4 = v3;
  unint64_t v5 = 0;
  for (uint64_t i = 0; i != v4; ++i)
  {
    uint64_t v7 = [(EDCollection *)self objectAtIndex:i];
    v8 = v7;
    if (v7) {
      v5 += [v7 countOfCellsBeingReferenced];
    }
  }
  return v5;
}

+ (id)noCoalesceCollection
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWihNoCoalesce];
  return v2;
}

- (id)initWihNoCoalesce
{
  v3.receiver = self;
  v3.super_class = (Class)EDReferenceCollection;
  id result = [(EDCollection *)&v3 init];
  if (result) {
    *((unsigned char *)result + 16) = 0;
  }
  return result;
}

- (id)reverseReferencesByRow:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(EDCollection *)self count])
  {
    uint64_t v5 = [(id)objc_opt_class() collection];
    uint64_t v6 = (void *)v5;
    if (v5)
    {
      *(unsigned char *)(v5 + 16) = 0;
      unint64_t v7 = [(EDReferenceCollection *)self countOfCellsBeingReferenced];
      if (v7)
      {
        unint64_t v8 = v7 - 1;
        do
        {
          BOOL v9 = [(EDReferenceCollection *)self referenceToCellWithIndex:v8 byRow:v3];
          if (v9) {
            [v6 addObject:v9];
          }

          --v8;
        }
        while (v8 != -1);
      }
      id v10 = v6;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)referenceToCellWithIndex:(unint64_t)a3 byRow:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(EDCollection *)self count];
  if (v7)
  {
    unint64_t v8 = v7;
    for (uint64_t i = 0; v8 != i; ++i)
    {
      id v10 = [(EDCollection *)self objectAtIndex:i];
      v11 = v10;
      if (v10)
      {
        unint64_t v12 = [v10 countOfCellsBeingReferenced];
        if (a3 < v12)
        {
          if (v4)
          {
            int v14 = [v11 lastColumn];
            int v15 = [v11 firstColumn];
            int v16 = [v11 firstRow];
            int v17 = [v11 firstColumn];
            unint64_t v18 = v14 - v15 + 1;
            uint64_t v19 = v16 + (a3 / v18);
            unint64_t v20 = a3 % v18;
          }
          else
          {
            int v21 = [v11 lastRow];
            int v22 = [v11 firstRow];
            int v23 = [v11 firstRow];
            int v17 = [v11 firstColumn];
            unint64_t v24 = v21 - v22 + 1;
            unint64_t v20 = a3 / v24;
            uint64_t v19 = v23 + (a3 % v24);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            +[EDSheetReference referenceWithSheetIndex:firstRow:lastRow:firstColumn:lastColumn:](EDSheetReference, "referenceWithSheetIndex:firstRow:lastRow:firstColumn:lastColumn:", [v11 sheetIndex], v19, v19, (v17 + v20), (v17 + v20));
          }
          else {
          v13 = +[EDReference referenceWithFirstRow:v19 lastRow:v19 firstColumn:(v17 + v20) lastColumn:(v17 + v20)];
          }

          goto LABEL_15;
        }
        a3 -= v12;
      }
    }
  }
  v13 = 0;
LABEL_15:
  return v13;
}

+ (id)coalesceCollection
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (void)coalesceProgressiveCellReferencesCollection
{
  unint64_t v3 = [(EDCollection *)self count];
  if (v3 >= 2)
  {
    unint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0xFFFFFFFFLL;
    uint64_t v8 = 0xFFFFFFFFLL;
    uint64_t v9 = 0xFFFFFFFFLL;
    uint64_t v10 = 0xFFFFFFFFLL;
    while (1)
    {
      v11 = [(EDCollection *)self objectAtIndex:v6];
      if (!v11) {
        break;
      }
      id v17 = v11;
      if (![v11 isCellReference]) {
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_19;
      }
      if (v6)
      {
        if (v5 != [v17 sheetIndex]) {
          goto LABEL_19;
        }
        uint64_t v12 = [v17 areaReference];
        unint64_t v13 = (unint64_t)[v17 areaReference] >> 32;
        if (v7 == v12)
        {
          v11 = v17;
          if ((int)v7 < (int)v8) {
            break;
          }
          int v14 = v10 + 1;
          uint64_t v10 = v13;
          if (v14 != v13) {
            break;
          }
        }
        else
        {
          v11 = v17;
        }
        if (v9 == v13)
        {
          if ((int)v9 < (int)v10) {
            break;
          }
          int v16 = v8 + 1;
          uint64_t v8 = v12;
          if (v16 != v12) {
            break;
          }
        }
      }
      else
      {
        uint64_t v8 = [v17 areaReference];
        unint64_t v15 = [v17 areaReference];
        uint64_t v5 = [v17 sheetIndex];
        uint64_t v10 = HIDWORD(v15);
        uint64_t v9 = v10;
        uint64_t v7 = v8;
        v11 = v17;
      }

      if (v4 == ++v6)
      {
        id v17 = +[EDSheetReference referenceWithSheetIndex:v5 firstRow:v7 lastRow:v8 firstColumn:v9 lastColumn:v10];
        [(EDCollection *)self removeAllObjects];
        [(EDReferenceCollection *)self addObject:v17];
LABEL_19:
        v11 = v17;
        break;
      }
    }
  }
}

@end