@interface PMLDenseMatrix
+ (id)denseMatrixFromData:(id)a3 numberOfRows:(unint64_t)a4 numberOfColumns:(unint64_t)a5;
+ (id)denseMatrixFromNumbers:(id)a3;
- (PMLDenseMatrix)initWithData:(id)a3 numberOfRows:(unint64_t)a4 numberOfColumns:(unint64_t)a5;
- (const)values;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)enumerateNonZeroValuesWithBlock:(id)a3;
@end

@implementation PMLDenseMatrix

- (void).cxx_destruct
{
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)enumerateNonZeroValuesWithBlock:(id)a3
{
  v11 = (void (**)(id, unint64_t, unint64_t))a3;
  v4 = [(PMLDenseVector *)self->_data ptr];
  unint64_t numberOfRows = self->_numberOfRows;
  if (numberOfRows)
  {
    v6 = v4;
    unint64_t v7 = 0;
    unint64_t numberOfColumns = self->_numberOfColumns;
    unint64_t v9 = numberOfColumns;
    do
    {
      if (v9)
      {
        unint64_t v10 = 0;
        do
        {
          if (v6[v10 + v7 * v9] != 0.0)
          {
            v11[2](v11, v7, v10);
            unint64_t numberOfColumns = self->_numberOfColumns;
          }
          ++v10;
          unint64_t v9 = numberOfColumns;
        }
        while (v10 < numberOfColumns);
        unint64_t numberOfRows = self->_numberOfRows;
        unint64_t v9 = numberOfColumns;
      }
      ++v7;
    }
    while (v7 < numberOfRows);
  }
}

- (const)values
{
  return [(PMLDenseVector *)self->_data ptr];
}

- (PMLDenseMatrix)initWithData:(id)a3 numberOfRows:(unint64_t)a4 numberOfColumns:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PMLDenseMatrix;
  unint64_t v10 = [(PMLDenseMatrix *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_unint64_t numberOfRows = a4;
    v10->_unint64_t numberOfColumns = a5;
    objc_storeStrong((id *)&v10->_data, a3);
  }

  return v11;
}

+ (id)denseMatrixFromNumbers:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectAtIndexedSubscript:0];
  uint64_t v6 = [v5 count];

  unint64_t v7 = (char *)malloc_type_calloc([v4 count] * v6, 4uLL, 0x100004052888210uLL);
  if (!v7)
  {
    id v19 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v19);
  }
  v8 = v7;
  if ([v4 count])
  {
    unint64_t v9 = 0;
    unint64_t v10 = v8;
    do
    {
      v11 = [v4 objectAtIndexedSubscript:v9];
      if ([v11 count] == v6)
      {
        if (v6) {
          goto LABEL_6;
        }
      }
      else
      {
        v15 = [MEMORY[0x263F08690] currentHandler];
        [v15 handleFailureInMethod:a2, a1, @"PMLDenseMatrix.m", 59, @"Invalid shape, all rows must be the same length (row %lu length: %lu, first row length: %lu)", v9, objc_msgSend(v11, "count"), v6 object file lineNumber description];

        if (v6)
        {
LABEL_6:
          for (uint64_t i = 0; i != v6; ++i)
          {
            objc_super v13 = [v11 objectAtIndexedSubscript:i];
            [v13 floatValue];
            *(_DWORD *)&v10[4 * i] = v14;
          }
        }
      }

      ++v9;
      v10 += 4 * v6;
    }
    while (v9 < [v4 count]);
  }
  v16 = -[PMLDenseVector initWithFloatsNoCopy:count:freeWhenDone:]([PMLMutableDenseVector alloc], "initWithFloatsNoCopy:count:freeWhenDone:", v8, [v4 count] * v6, 1);
  v17 = objc_msgSend(a1, "denseMatrixFromData:numberOfRows:numberOfColumns:", v16, objc_msgSend(v4, "count"), v6);

  return v17;
}

+ (id)denseMatrixFromData:(id)a3 numberOfRows:(unint64_t)a4 numberOfColumns:(unint64_t)a5
{
  id v8 = a3;
  unint64_t v9 = (void *)[objc_alloc((Class)a1) initWithData:v8 numberOfRows:a4 numberOfColumns:a5];

  return v9;
}

@end