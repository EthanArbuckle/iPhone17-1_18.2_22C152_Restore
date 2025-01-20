@interface PMLSparseVector
+ (id)sparseVectorEmptyWithLength:(unint64_t)a3;
+ (id)sparseVectorFromDense:(const float *)a3 length:(unint64_t)a4;
+ (id)sparseVectorFromDense:(id)a3;
+ (id)sparseVectorFromNumbers:(id)a3;
+ (id)sparseVectorFromNumbers:(id)a3 indices:(id)a4 length:(unint64_t)a5;
+ (id)sparseVectorWithLength:(unint64_t)a3 numberOfNonZeroValues:(unint64_t)a4 block:(id)a5;
+ (void)sparseVectorWithLength:(unint64_t)a3 numberOfNonZeroValues:(unint64_t)a4 isSparseIndexInt64:(BOOL)a5 sparseIndices:(const void *)a6 sparseValues:(const float *)a7 toDenseValues:(float *)a8 withLength:(unint64_t)a9;
- (PMLSparseVector)initWithLength:(unint64_t)a3 numberOfNonZeroValues:(unint64_t)a4 indices:(int64_t *)a5 values:(float *)a6;
- (PMLSparseVector)initWithLength:(unint64_t)a3 numberOfNonZeroValues:(unint64_t)a4 indicesData:(id)a5 valuesData:(id)a6;
- (PMLSparseVector)vectorWithConstantColumn;
- (float)l1norm;
- (float)l2norm;
- (float)maxAbsValue;
- (float)maxValue;
- (float)minValue;
- (float)sparseValues;
- (float)valueAtIndex:(unint64_t)a3;
- (id)indicesAsUInt16Data;
- (id)indicesData;
- (id)quantizedValuesAsUInt8DataWithMin:(float)a3 max:(float)a4;
- (id)valuesData;
- (int64_t)sparseIndices;
- (unint64_t)length;
- (unint64_t)numberOfNonZeroValues;
- (void)addStartId:(int64_t)a3 endId:(int64_t)a4 paddingId:(int64_t)a5 withMaxVectorLength:(unint64_t)a6;
- (void)applyOneHotNormalization;
- (void)convertToBagOfIds;
- (void)dealloc;
- (void)enumerateNonZeroValuesWithBlock:(id)a3;
- (void)processNonZeroValuesInPlaceWithBlock:(id)a3;
- (void)scaleInPlaceWithInversedFactor:(float)a3;
- (void)scaleWithVectorNormalization:(int64_t)a3;
- (void)setLength:(unint64_t)a3;
- (void)setNumberOfNonZeroValues:(unint64_t)a3;
- (void)setSparseIndices:(int64_t *)a3;
- (void)setSparseValues:(float *)a3;
- (void)sparseVectorToDense:(float *)a3 length:(unint64_t)a4;
@end

@implementation PMLSparseVector

- (float)sparseValues
{
  return self->_sparseValues;
}

- (int64_t)sparseIndices
{
  return self->_sparseIndices;
}

- (unint64_t)numberOfNonZeroValues
{
  return self->_numberOfNonZeroValues;
}

- (unint64_t)length
{
  return self->_length;
}

- (PMLSparseVector)vectorWithConstantColumn
{
  v3 = malloc_type_calloc(self->_numberOfNonZeroValues + 1, 8uLL, 0x100004000313F17uLL);
  v4 = malloc_type_calloc(self->_numberOfNonZeroValues + 1, 4uLL, 0x100004052888210uLL);
  v5 = self;
  memcpy(v3, [(PMLSparseVector *)v5 sparseIndices], 8 * self->_numberOfNonZeroValues);
  v6 = v5;
  memcpy(v4, [(PMLSparseVector *)v6 sparseValues], 4 * self->_numberOfNonZeroValues);
  unint64_t numberOfNonZeroValues = self->_numberOfNonZeroValues;
  *((void *)v3 + numberOfNonZeroValues) = v6->_length;
  *((_DWORD *)v4 + numberOfNonZeroValues) = 1065353216;
  v8 = [[PMLSparseVector alloc] initWithLength:[(PMLSparseVector *)v6 length] + 1 numberOfNonZeroValues:[(PMLSparseVector *)v6 numberOfNonZeroValues] + 1 indices:v3 values:v4];
  return v8;
}

- (float)valueAtIndex:(unint64_t)a3
{
  float v5 = 0.0;
  if ([(PMLSparseVector *)self numberOfNonZeroValues])
  {
    uint64_t v6 = 0;
    while (1)
    {
      v7 = self;
      if ([(PMLSparseVector *)v7 sparseIndices][8 * v6] == a3) {
        break;
      }
      if (++v6 >= [(PMLSparseVector *)v7 numberOfNonZeroValues]) {
        return v5;
      }
    }
    return [(PMLSparseVector *)v7 sparseValues][4 * v6];
  }
  return v5;
}

- (void)addStartId:(int64_t)a3 endId:(int64_t)a4 paddingId:(int64_t)a5 withMaxVectorLength:(unint64_t)a6
{
  if (self->_length == self->_numberOfNonZeroValues)
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PMLSparseVector.m", 348, @"Invalid parameter not satisfying: %@", @"_length == _numberOfNonZeroValues" object file lineNumber description];

    if (a6) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PMLSparseVector.m", 349, @"Invalid parameter not satisfying: %@", @"maxVectorLength" object file lineNumber description];

LABEL_3:
  if (self->_length >= a6) {
    unint64_t length = a6;
  }
  else {
    unint64_t length = self->_length;
  }
  self->_unint64_t length = a6;
  [(PMLSparseVector *)self setNumberOfNonZeroValues:a6];
  if (a3)
  {
    if (length >= a6 - 1) {
      unint64_t v13 = a6 - 1;
    }
    else {
      unint64_t v13 = length;
    }
    memmove(self->_sparseValues + 1, self->_sparseValues, 4 * v13);
    sparseValues = self->_sparseValues;
    self->_sparseIndices[v13] = v13;
    float *sparseValues = (float)a3;
  }
  if (a3) {
    unint64_t v15 = length + 1;
  }
  else {
    unint64_t v15 = length;
  }
  if (v15 < a6)
  {
    unint64_t v16 = v15;
    sparseIndices = self->_sparseIndices;
    v18 = self->_sparseValues;
    do
    {
      sparseIndices[v16] = v16;
      v18[v16++] = (float)a5;
    }
    while (v16 < a6);
  }
  if (a4)
  {
    if (v15 >= a6 - 1) {
      unint64_t v15 = a6 - 1;
    }
    self->_sparseValues[v15] = (float)a4;
  }
}

- (void)convertToBagOfIds
{
  unint64_t numberOfNonZeroValues = self->_numberOfNonZeroValues;
  self->_unint64_t length = numberOfNonZeroValues;
  if (numberOfNonZeroValues)
  {
    int64_t v3 = 0;
    sparseIndices = self->_sparseIndices;
    sparseValues = self->_sparseValues;
    do
    {
      sparseValues[v3] = (float)sparseIndices[v3];
      sparseIndices[v3] = v3;
      ++v3;
    }
    while (numberOfNonZeroValues != v3);
  }
}

- (void)sparseVectorToDense:(float *)a3 length:(unint64_t)a4
{
}

- (void)processNonZeroValuesInPlaceWithBlock:(id)a3
{
  if (self->_numberOfNonZeroValues)
  {
    unint64_t v5 = 0;
    sparseValues = self->_sparseValues;
    do
    {
      float v7 = (*((float (**)(id, int64_t, float))a3 + 2))(a3, self->_sparseIndices[v5], sparseValues[v5]);
      sparseValues = self->_sparseValues;
      sparseValues[v5++] = v7;
    }
    while (v5 < self->_numberOfNonZeroValues);
  }
}

- (void)enumerateNonZeroValuesWithBlock:(id)a3
{
  if (self->_numberOfNonZeroValues)
  {
    unint64_t v5 = 0;
    do
    {
      (*((void (**)(id, int64_t, float))a3 + 2))(a3, self->_sparseIndices[v5], self->_sparseValues[v5]);
      ++v5;
    }
    while (v5 < self->_numberOfNonZeroValues);
  }
}

- (void)setSparseIndices:(int64_t *)a3
{
  sparseIndices = self->_sparseIndices;
  if (sparseIndices) {
    BOOL v6 = sparseIndices == a3;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PMLSparseVector.m", 272, @"Invalid parameter not satisfying: %@", @"_sparseIndices == NULL || _sparseIndices != sparseIndices" object file lineNumber description];

    sparseIndices = self->_sparseIndices;
  }
  free(sparseIndices);
  self->_sparseIndices = a3;
}

- (void)setSparseValues:(float *)a3
{
  sparseValues = self->_sparseValues;
  if (sparseValues) {
    BOOL v6 = sparseValues == a3;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PMLSparseVector.m", 265, @"Invalid parameter not satisfying: %@", @"_sparseValues == NULL || _sparseValues != sparseValues" object file lineNumber description];

    sparseValues = self->_sparseValues;
  }
  free(sparseValues);
  self->_sparseValues = a3;
}

- (void)setNumberOfNonZeroValues:(unint64_t)a3
{
  if (self->_length < a3)
  {
    BOOL v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PMLSparseVector.m", 257, @"Invalid parameter not satisfying: %@", @"_length >= numberOfNonZeroValues" object file lineNumber description];
  }
  self->_unint64_t numberOfNonZeroValues = a3;
  self->_sparseIndices = (int64_t *)reallocf(self->_sparseIndices, 8 * a3);
  self->_sparseValues = (float *)reallocf(self->_sparseValues, 4 * a3);
}

- (void)setLength:(unint64_t)a3
{
  if (self->_numberOfNonZeroValues > a3)
  {
    BOOL v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PMLSparseVector.m", 251, @"Invalid parameter not satisfying: %@", @"length >= _numberOfNonZeroValues" object file lineNumber description];
  }
  self->_unint64_t length = a3;
}

- (void)scaleWithVectorNormalization:(int64_t)a3
{
  switch(a3)
  {
    case -1:
      return;
    case 0:
      goto LABEL_9;
    case 1:
      [(PMLSparseVector *)self l1norm];
      goto LABEL_10;
    case 2:
      [(PMLSparseVector *)self l2norm];
      goto LABEL_10;
    case 3:
      [(PMLSparseVector *)self maxAbsValue];
      goto LABEL_10;
    case 4:
      [(PMLSparseVector *)self applyOneHotNormalization];
LABEL_9:
      *(float *)&double v3 = (float)self->_numberOfNonZeroValues;
LABEL_10:
      [(PMLSparseVector *)self scaleInPlaceWithInversedFactor:v3];
      break;
    default:
      unint64_t v5 = PML_LogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)BOOL v6 = 0;
        _os_log_fault_impl(&dword_2212A0000, v5, OS_LOG_TYPE_FAULT, "PMLSparseVector: unknown vector normalization method", v6, 2u);
      }

      break;
  }
}

- (void)applyOneHotNormalization
{
  unint64_t numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (numberOfNonZeroValues)
  {
    sparseValues = self->_sparseValues;
    do
    {
      if (*sparseValues == 0.0) {
        float v4 = 0.0;
      }
      else {
        float v4 = 1.0;
      }
      *sparseValues++ = v4;
      --numberOfNonZeroValues;
    }
    while (numberOfNonZeroValues);
  }
}

- (void)scaleInPlaceWithInversedFactor:(float)a3
{
  if (a3 > 0.0) {
    cblas_sscal(self->_numberOfNonZeroValues, 1.0 / a3, self->_sparseValues, 1);
  }
}

- (float)maxAbsValue
{
  unint64_t numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (!numberOfNonZeroValues) {
    return 0.0;
  }
  sparseValues = self->_sparseValues;
  float result = sparseValues[cblas_isamax(numberOfNonZeroValues, sparseValues, 1)];
  if (result < 0.0) {
    return -result;
  }
  return result;
}

- (float)l2norm
{
  return cblas_snrm2(self->_numberOfNonZeroValues, self->_sparseValues, 1);
}

- (float)l1norm
{
  return cblas_sasum(self->_numberOfNonZeroValues, self->_sparseValues, 1);
}

- (float)maxValue
{
  unint64_t numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (!numberOfNonZeroValues) {
    return 1.1755e-38;
  }
  sparseValues = self->_sparseValues;
  float result = 1.1755e-38;
  do
  {
    float v5 = *sparseValues++;
    float v6 = v5;
    if (result < v5) {
      float result = v6;
    }
    --numberOfNonZeroValues;
  }
  while (numberOfNonZeroValues);
  return result;
}

- (float)minValue
{
  unint64_t numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (!numberOfNonZeroValues) {
    return 3.4028e38;
  }
  sparseValues = self->_sparseValues;
  float result = 3.4028e38;
  do
  {
    float v5 = *sparseValues++;
    float v6 = v5;
    if (result >= v5) {
      float result = v6;
    }
    --numberOfNonZeroValues;
  }
  while (numberOfNonZeroValues);
  return result;
}

- (id)quantizedValuesAsUInt8DataWithMin:(float)a3 max:(float)a4
{
  size_t numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (numberOfNonZeroValues)
  {
    v8 = malloc_type_calloc(numberOfNonZeroValues, 1uLL, 0x100004077774924uLL);
    if (!v8)
    {
      id v13 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v13);
    }
    if (self->_numberOfNonZeroValues)
    {
      unint64_t v9 = 0;
      do
      {
        v8[v9] = vcvtms_s32_f32((float)(self->_sparseValues[v9] - a3) / (float)((float)(a4 - a3) / 255.0));
        ++v9;
        unint64_t v10 = self->_numberOfNonZeroValues;
      }
      while (v9 < v10);
    }
    else
    {
      unint64_t v10 = 0;
    }
    v11 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v8 length:v10 freeWhenDone:1];
  }
  else
  {
    v11 = objc_opt_new();
  }
  return v11;
}

- (id)indicesAsUInt16Data
{
  if (self->_length >= 0xFFFF)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PMLSparseVector.m" lineNumber:137 description:@"Too big vector."];
  }
  size_t numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (numberOfNonZeroValues)
  {
    float v4 = malloc_type_calloc(numberOfNonZeroValues, 2uLL, 0x1000040BDFB0063uLL);
    if (!v4)
    {
      id v14 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v14);
    }
    unint64_t v5 = self->_numberOfNonZeroValues;
    if (v5)
    {
      sparseIndices = self->_sparseIndices;
      float v7 = v4;
      unint64_t v8 = self->_numberOfNonZeroValues;
      do
      {
        uint64_t v9 = *sparseIndices++;
        *v7++ = v9;
        --v8;
      }
      while (v8);
    }
    unint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v4 length:2 * v5 freeWhenDone:1];
  }
  else
  {
    unint64_t v10 = objc_opt_new();
  }
  return v10;
}

- (id)valuesData
{
  if (self->_numberOfNonZeroValues)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
    sparseValues = self->_sparseValues;
    unint64_t v5 = 4 * self->_numberOfNonZeroValues;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __29__PMLSparseVector_valuesData__block_invoke;
    v8[3] = &unk_26459F798;
    v8[4] = self;
    float v6 = (void *)[v3 initWithBytesNoCopy:sparseValues length:v5 deallocator:v8];
  }
  else
  {
    float v6 = objc_opt_new();
  }
  return v6;
}

id __29__PMLSparseVector_valuesData__block_invoke()
{
  return self;
}

- (id)indicesData
{
  size_t numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (numberOfNonZeroValues)
  {
    float v4 = malloc_type_calloc(numberOfNonZeroValues, 4uLL, 0x100004052888210uLL);
    if (!v4)
    {
      id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v12);
    }
    unint64_t v5 = self->_numberOfNonZeroValues;
    if (v5)
    {
      sparseIndices = self->_sparseIndices;
      float v7 = v4;
      unint64_t v8 = self->_numberOfNonZeroValues;
      do
      {
        uint64_t v9 = *sparseIndices++;
        *v7++ = v9;
        --v8;
      }
      while (v8);
    }
    unint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v4 length:4 * v5 freeWhenDone:1];
  }
  else
  {
    unint64_t v10 = objc_opt_new();
  }
  return v10;
}

- (void)dealloc
{
  free(self->_sparseIndices);
  free(self->_sparseValues);
  v3.receiver = self;
  v3.super_class = (Class)PMLSparseVector;
  [(PMLSparseVector *)&v3 dealloc];
}

- (PMLSparseVector)initWithLength:(unint64_t)a3 numberOfNonZeroValues:(unint64_t)a4 indices:(int64_t *)a5 values:(float *)a6
{
  if (a4 && (!a5 || !a6))
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PMLSparseVector.m", 91, @"Invalid parameter not satisfying: %@", @"numberOfNonZeroValues == 0 || (indices && values)" object file lineNumber description];
  }
  if (a3 < a4)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PMLSparseVector.m", 92, @"Invalid parameter not satisfying: %@", @"length>=numberOfNonZeroValues" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PMLSparseVector;
  float result = [(PMLSparseVector *)&v15 init];
  if (result)
  {
    result->_unint64_t length = a3;
    result->_size_t numberOfNonZeroValues = a4;
    result->_sparseIndices = a5;
    result->_sparseValues = a6;
  }
  return result;
}

- (PMLSparseVector)initWithLength:(unint64_t)a3 numberOfNonZeroValues:(unint64_t)a4 indicesData:(id)a5 valuesData:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v10 bytes];
  id v13 = v11;
  uint64_t v14 = [v13 bytes];

  return [(PMLSparseVector *)self initWithLength:a3 numberOfNonZeroValues:a4 indices:v12 values:v14];
}

+ (id)sparseVectorFromNumbers:(id)a3 indices:(id)a4 length:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    id v10 = malloc_type_calloc([v8 count], 8uLL, 0x100004000313F17uLL);
    id v11 = (float *)malloc_type_calloc([v8 count], 4uLL, 0x100004052888210uLL);
    if ([v8 count])
    {
      unint64_t v12 = 0;
      uint64_t v13 = 0;
      do
      {
        uint64_t v14 = [v8 objectAtIndex:v12];
        [v14 floatValue];
        float v16 = v15;

        v17 = [v9 objectAtIndex:v12];
        uint64_t v18 = [v17 unsignedIntegerValue];

        if (v16 != 0.0)
        {
          v10[v13] = v18;
          v11[v13++] = v16;
        }
        ++v12;
      }
      while (v12 < [v8 count]);
    }
    id v19 = objc_alloc((Class)a1);
    uint64_t v20 = [v8 count];
    id v21 = v19;
    unint64_t v22 = a5;
    v23 = v10;
    v24 = v11;
  }
  else
  {
    id v21 = objc_alloc((Class)a1);
    unint64_t v22 = a5;
    uint64_t v20 = 0;
    v23 = 0;
    v24 = 0;
  }
  v25 = (void *)[v21 initWithLength:v22 numberOfNonZeroValues:v20 indices:v23 values:v24];

  return v25;
}

+ (id)sparseVectorFromNumbers:(id)a3
{
  id v4 = a3;
  unint64_t v5 = malloc_type_calloc([v4 count], 4uLL, 0x100004052888210uLL);
  if (!v5)
  {
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v12);
  }
  float v6 = v5;
  if ([v4 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [v4 objectAtIndexedSubscript:v7];
      [v8 floatValue];
      v6[v7] = v9;

      ++v7;
    }
    while (v7 < [v4 count]);
  }
  id v10 = objc_msgSend(a1, "sparseVectorFromDense:length:", v6, objc_msgSend(v4, "count"));
  free(v6);

  return v10;
}

+ (void)sparseVectorWithLength:(unint64_t)a3 numberOfNonZeroValues:(unint64_t)a4 isSparseIndexInt64:(BOOL)a5 sparseIndices:(const void *)a6 sparseValues:(const float *)a7 toDenseValues:(float *)a8 withLength:(unint64_t)a9
{
  BOOL v12 = a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a9 != a3)
  {
    float v15 = PML_LogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v19 = 134218240;
      unint64_t v20 = a3;
      __int16 v21 = 2048;
      unint64_t v22 = a9;
      _os_log_impl(&dword_2212A0000, v15, OS_LOG_TYPE_INFO, "PMLSparseVector: dimensions do not match between source sparse vector (%llu) and destination dense vector (%llu)", (uint8_t *)&v19, 0x16u);
    }
  }
  if (a3 == a4)
  {
    if (a3 >= a9) {
      unint64_t v16 = a9;
    }
    else {
      unint64_t v16 = a3;
    }
    memcpy(a8, a7, 4 * v16);
    if (a3 < a9) {
      bzero(&a8[v16], 4 * (a9 - v16));
    }
  }
  else
  {
    bzero(a8, 4 * a9);
    if (a4)
    {
      uint64_t v17 = 0;
      do
      {
        if (v12) {
          unint64_t v18 = *((void *)a6 + v17);
        }
        else {
          unint64_t v18 = *((int *)a6 + v17);
        }
        if (v18 < a9) {
          a8[v18] = a7[v17];
        }
        ++v17;
      }
      while (a4 != v17);
    }
  }
}

+ (id)sparseVectorWithLength:(unint64_t)a3 numberOfNonZeroValues:(unint64_t)a4 block:(id)a5
{
  unint64_t v7 = (void (**)(id, void *, void *))a5;
  if (a4)
  {
    id v8 = malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
    int v9 = malloc_type_malloc(4 * a4, 0x100004052888210uLL);
    v7[2](v7, v8, v9);
    id v10 = [[PMLSparseVector alloc] initWithLength:a3 numberOfNonZeroValues:a4 indices:v8 values:v9];
  }
  else
  {
    id v10 = +[PMLSparseVector sparseVectorEmptyWithLength:a3];
  }
  id v11 = v10;

  return v11;
}

+ (id)sparseVectorEmptyWithLength:(unint64_t)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithLength:a3 numberOfNonZeroValues:0 indices:0 values:0];
  return v3;
}

+ (id)sparseVectorFromDense:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 ptr];
  uint64_t v6 = [v4 count];

  return (id)[a1 sparseVectorFromDense:v5 length:v6];
}

+ (id)sparseVectorFromDense:(const float *)a3 length:(unint64_t)a4
{
  if (!a4) {
    goto LABEL_12;
  }
  uint64_t v7 = 0;
  size_t v8 = 0;
  do
  {
    if (a3[v7] != 0.0) {
      ++v8;
    }
    ++v7;
  }
  while (a4 != v7);
  if (v8)
  {
    int v9 = malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
    id v10 = (float *)malloc_type_calloc(v8, 4uLL, 0x100004052888210uLL);
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    do
    {
      float v13 = a3[v11];
      if (v13 != 0.0)
      {
        v9[v12] = v11;
        v10[v12++] = v13;
      }
      ++v11;
    }
    while (a4 != v11);
    uint64_t v14 = (void *)[objc_alloc((Class)a1) initWithLength:a4 numberOfNonZeroValues:v8 indices:v9 values:v10];
  }
  else
  {
LABEL_12:
    uint64_t v14 = [a1 sparseVectorEmptyWithLength:a4];
  }
  return v14;
}

@end