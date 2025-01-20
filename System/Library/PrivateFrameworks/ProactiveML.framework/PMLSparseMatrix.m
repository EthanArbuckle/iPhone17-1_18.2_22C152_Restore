@interface PMLSparseMatrix
+ (PMLSparseMatrix)sparseMatrixWithNumberOfRows:(unint64_t)a3 numberOfColumns:(unint64_t)a4;
+ (id)sparseMatrixFromNumbers:(id)a3;
- (BOOL)isSymmetric;
- (PMLSparseMatrix)initWithSparseMatrix:(sparse_m_float *)a3;
- (PMLSparseMatrix)matrixWithConstantColumn;
- (float)maxValue;
- (float)minValue;
- (float)valueAtRow:(unint64_t)a3 column:(unint64_t)a4;
- (sparse_m_float)matrix;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)_enumerateSparseRowsWithBlock:(id)a3;
- (void)dealloc;
- (void)enumerateNonZeroValuesForRow:(unint64_t)a3 withBlock:(id)a4;
- (void)enumerateNonZeroValuesWithBlock:(id)a3;
- (void)setIsSymmetric:(BOOL)a3;
- (void)setMatrix:(sparse_m_float *)a3;
@end

@implementation PMLSparseMatrix

- (sparse_m_float)matrix
{
  return self->_matrix;
}

- (BOOL)isSymmetric
{
  return self->_isSymmetric;
}

- (float)maxValue
{
  uint64_t v5 = 0;
  v6 = (float *)&v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0x800000;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__PMLSparseMatrix_maxValue__block_invoke;
  v4[3] = &unk_26459F310;
  v4[4] = &v5;
  [(PMLSparseMatrix *)self enumerateNonZeroValuesWithBlock:v4];
  float v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __27__PMLSparseMatrix_maxValue__block_invoke(uint64_t result, float a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (*(float *)(v2 + 24) >= a2) {
    a2 = *(float *)(v2 + 24);
  }
  *(float *)(v2 + 24) = a2;
  return result;
}

- (float)minValue
{
  uint64_t v5 = 0;
  v6 = (float *)&v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 2139095039;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__PMLSparseMatrix_minValue__block_invoke;
  v4[3] = &unk_26459F310;
  v4[4] = &v5;
  [(PMLSparseMatrix *)self enumerateNonZeroValuesWithBlock:v4];
  float v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __27__PMLSparseMatrix_minValue__block_invoke(uint64_t result, float a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (*(float *)(v2 + 24) < a2) {
    a2 = *(float *)(v2 + 24);
  }
  *(float *)(v2 + 24) = a2;
  return result;
}

- (PMLSparseMatrix)matrixWithConstantColumn
{
  v3 = sparse_matrix_create_float([(PMLSparseMatrix *)self numberOfRows], [(PMLSparseMatrix *)self numberOfColumns] + 1);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__PMLSparseMatrix_matrixWithConstantColumn__block_invoke;
  v9[3] = &__block_descriptor_40_e21_v40__0Q8Q16r_f24r_q32l;
  v9[4] = v3;
  [(PMLSparseMatrix *)self _enumerateSparseRowsWithBlock:v9];
  unint64_t v4 = [(PMLSparseMatrix *)self numberOfRows];
  if (v4)
  {
    unint64_t v5 = v4;
    for (sparse_index i = 0; i != v5; ++i)
      sparse_insert_entry_float(v3, 1.0, i, [(PMLSparseMatrix *)self numberOfColumns]);
  }
  sparse_commit(v3);
  uint64_t v7 = [[PMLSparseMatrix alloc] initWithSparseMatrix:v3];
  return v7;
}

uint64_t __43__PMLSparseMatrix_matrixWithConstantColumn__block_invoke(uint64_t a1, sparse_index a2, sparse_dimension a3, const float *a4, const sparse_index *a5)
{
  return sparse_insert_row_float(*(sparse_matrix_float *)(a1 + 32), a2, a3, a4, a5);
}

- (void)enumerateNonZeroValuesForRow:(unint64_t)a3 withBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, unint64_t, void, float))a4;
  uint64_t v7 = (float *)malloc_type_malloc(4 * [(PMLSparseMatrix *)self numberOfColumns], 0x100004052888210uLL);
  int v8 = (sparse_index *)malloc_type_malloc(8 * [(PMLSparseMatrix *)self numberOfColumns], 0x100004000313F17uLL);
  sparse_index column_end = 0;
  sparse_status v9 = sparse_extract_sparse_row_float(self->_matrix, a3, 0, &column_end, [(PMLSparseMatrix *)self numberOfColumns], v7, v8);
  sparse_status v10 = v9;
  if (v9 < 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      sparse_status v19 = v10;
      _os_log_error_impl(&dword_2212A0000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error extracting floats from sparse rows, status: %d", buf, 8u);
    }
  }
  else if (v9)
  {
    v11 = v7;
    v12 = v8;
    uint64_t v13 = v9;
    do
    {
      float v14 = *v11++;
      float v15 = v14;
      uint64_t v16 = *v12++;
      v6[2](v6, a3, v16, v15);
      --v13;
    }
    while (v13);
  }
  free(v7);
  free(v8);
}

- (void)enumerateNonZeroValuesWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__PMLSparseMatrix_enumerateNonZeroValuesWithBlock___block_invoke;
  v6[3] = &unk_26459F2C8;
  id v7 = v4;
  id v5 = v4;
  [(PMLSparseMatrix *)self _enumerateSparseRowsWithBlock:v6];
}

uint64_t __51__PMLSparseMatrix_enumerateNonZeroValuesWithBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, float *a4, uint64_t a5)
{
  if (a3)
  {
    uint64_t v7 = a3;
    uint64_t v8 = result;
    do
    {
      float v9 = *a4++;
      a5 += 8;
      result = (*(uint64_t (**)(float))(*(void *)(v8 + 32) + 16))(v9);
      --v7;
    }
    while (v7);
  }
  return result;
}

- (void)_enumerateSparseRowsWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, sparse_index, void, float *, sparse_index *))a3;
  id v5 = (float *)malloc_type_malloc(4 * [(PMLSparseMatrix *)self numberOfColumns], 0x100004052888210uLL);
  v6 = (sparse_index *)malloc_type_malloc(8 * [(PMLSparseMatrix *)self numberOfColumns], 0x100004000313F17uLL);
  unint64_t v7 = [(PMLSparseMatrix *)self numberOfRows];
  if (v7)
  {
    unint64_t v9 = v7;
    sparse_index v10 = 0;
    v11 = &_os_log_internal;
    *(void *)&long long v8 = 67109120;
    long long v15 = v8;
    do
    {
      sparse_index column_end = 0;
      sparse_status v12 = sparse_extract_sparse_row_float(self->_matrix, v10, 0, &column_end, [(PMLSparseMatrix *)self numberOfColumns], v5, v6);
      sparse_status v13 = v12;
      if (v12 < 0)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v15;
          sparse_status v18 = v13;
          _os_log_error_impl(&dword_2212A0000, v11, OS_LOG_TYPE_ERROR, "Error extracting floats from sparse rows, status: %d", buf, 8u);
        }
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v14 = v12;
      }
      v4[2](v4, v10++, v14, v5, v6);
    }
    while (v9 != v10);
  }
  free(v5);
  free(v6);
}

- (float)valueAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  unint64_t v7 = (sparse_index *)malloc_type_malloc(8 * [(PMLSparseMatrix *)self numberOfColumns], 0x100004000313F17uLL);
  if (!v7
    || (long long v8 = v7,
        (unint64_t v9 = (float *)malloc_type_malloc(4 * [(PMLSparseMatrix *)self numberOfColumns], 0x100004052888210uLL)) == 0))
  {
    id v15 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v15);
  }
  sparse_index v10 = v9;
  sparse_index column_end = 0;
  sparse_status v11 = sparse_extract_sparse_row_float(self->_matrix, a3, 0, &column_end, [(PMLSparseMatrix *)self numberOfColumns], v9, v8);
  float v12 = 0.0;
  if (v11 >= 1)
  {
    uint64_t v13 = 0;
    while (v8[v13] != a4)
    {
      if (v11 == ++v13) {
        goto LABEL_9;
      }
    }
    float v12 = v10[v13];
  }
LABEL_9:
  free(v10);
  free(v8);
  return v12;
}

- (void)dealloc
{
  sparse_matrix_destroy(self->_matrix);
  v3.receiver = self;
  v3.super_class = (Class)PMLSparseMatrix;
  [(PMLSparseMatrix *)&v3 dealloc];
}

- (void)setIsSymmetric:(BOOL)a3
{
  unint64_t v6 = [(PMLSparseMatrix *)self numberOfRows];
  if (v6 != [(PMLSparseMatrix *)self numberOfColumns])
  {
    unint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PMLSparseMatrix.m", 50, @"Can not mark %lu x %lu matrix as symmetric", -[PMLSparseMatrix numberOfRows](self, "numberOfRows"), -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns"));
  }
  self->_isSymmetric = a3;
}

- (void)setMatrix:(sparse_m_float *)a3
{
  if (!a3)
  {
    unint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PMLSparseMatrix.m", 43, @"Invalid parameter not satisfying: %@", @"matrix" object file lineNumber description];
  }
  sparse_matrix_destroy(self->_matrix);
  self->_matrix = a3;
}

- (unint64_t)numberOfColumns
{
  return sparse_get_matrix_number_of_columns(self->_matrix);
}

- (unint64_t)numberOfRows
{
  return sparse_get_matrix_number_of_rows(self->_matrix);
}

- (PMLSparseMatrix)initWithSparseMatrix:(sparse_m_float *)a3
{
  if (!a3)
  {
    unint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PMLSparseMatrix.m", 24, @"Invalid parameter not satisfying: %@", @"matrix" object file lineNumber description];
  }
  v8.receiver = self;
  v8.super_class = (Class)PMLSparseMatrix;
  result = [(PMLSparseMatrix *)&v8 init];
  if (result) {
    result->_matrix = a3;
  }
  return result;
}

+ (id)sparseMatrixFromNumbers:(id)a3
{
  id v3 = a3;
  sparse_dimension v4 = [v3 count];
  uint64_t v20 = v3;
  id v5 = [v3 objectAtIndexedSubscript:0];
  sparse_dimension v6 = [v5 count];

  unint64_t v7 = sparse_matrix_create_float(v4, v6);
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      unint64_t v9 = [v20 objectAtIndexedSubscript:i];
      if ([v9 count] == v6)
      {
        if (v6) {
          goto LABEL_5;
        }
      }
      else
      {
        id v15 = [MEMORY[0x263F08690] currentHandler];
        [v15 handleFailureInMethod:a2, a1, @"PMLSparseMatrix.m", 69, @"Invalid shape, all rows must be the same length (row %lu length: %lu, first row length: %lu)", i, objc_msgSend(v9, "count"), v6 object file lineNumber description];

        if (v6)
        {
LABEL_5:
          uint64_t v10 = 0;
          for (uint64_t j = 0; j != v6; ++j)
          {
            float v12 = [v9 objectAtIndexedSubscript:j];
            [v12 floatValue];
            float v14 = v13;

            if (v14 != 0.0) {
              sparse_insert_entry_float(v7, v14, (int)i, v10 >> 32);
            }
            v10 += 0x100000000;
          }
        }
      }
    }
  }
  sparse_commit(v7);
  uint64_t v16 = (void *)[objc_alloc((Class)a1) initWithSparseMatrix:v7];

  return v16;
}

+ (PMLSparseMatrix)sparseMatrixWithNumberOfRows:(unint64_t)a3 numberOfColumns:(unint64_t)a4
{
  sparse_dimension v4 = objc_msgSend(objc_alloc((Class)a1), "initWithSparseMatrix:", sparse_matrix_create_float(a3, a4));
  return (PMLSparseMatrix *)v4;
}

@end