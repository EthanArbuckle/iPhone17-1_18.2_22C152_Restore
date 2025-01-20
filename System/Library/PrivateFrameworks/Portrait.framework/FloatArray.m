@interface FloatArray
- (BOOL)isEqualToFloatArray:(id)a3;
- (BOOL)isEqualToFloatArray:(id)a3 tolerance:(float)a4;
- (FloatArray)init;
- (FloatArray)initWithArray:(id)a3;
- (FloatArray)initWithCount:(unint64_t)a3;
- (FloatArray)initWithData:(id)a3;
- (FloatArray)initWithFloat:(float)a3 repeatCount:(unint64_t)a4;
- (FloatArray)initWithFloatArray:(id)a3;
- (FloatArray)initWithFloats:(const float *)a3 count:(unint64_t)a4;
- (FloatArray)initWithZeros:(unint64_t)a3;
- (const)floats;
- (float)floatAtIndex:(unint64_t)a3;
- (float)maximumDifferenceWithFloatArray:(id)a3;
- (float)mean;
- (id)addingConstant:(float)a3;
- (id)asArray;
- (id)asData;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)subtracting:(id)a3;
- (unint64_t)argMinimum;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation FloatArray

- (FloatArray)init
{
  return [(FloatArray *)self initWithCount:0];
}

- (FloatArray)initWithCount:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FloatArray;
  v4 = [(FloatArray *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_count = a3;
    v4->_buffer = (float *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    v6 = v5;
  }

  return v5;
}

- (FloatArray)initWithZeros:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FloatArray;
  v4 = [(FloatArray *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_count = a3;
    v4->_buffer = (float *)malloc_type_calloc(a3, 4uLL, 0x100004052888210uLL);
    v6 = v5;
  }

  return v5;
}

- (FloatArray)initWithFloat:(float)a3 repeatCount:(unint64_t)a4
{
  float __A = a3;
  v5 = -[FloatArray initWithCount:](self, "initWithCount:");
  v6 = v5;
  if (v5) {
    vDSP_vfill(&__A, v5->_buffer, 1, a4);
  }
  return v6;
}

- (FloatArray)initWithFloatArray:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 floats];
  uint64_t v6 = [v4 count];

  return [(FloatArray *)self initWithFloats:v5 count:v6];
}

- (FloatArray)initWithFloats:(const float *)a3 count:(unint64_t)a4
{
  uint64_t v6 = [(FloatArray *)self initWithCount:a4];
  v7 = v6;
  if (v6) {
    memcpy(v6->_buffer, a3, 4 * a4);
  }
  return v7;
}

- (void)dealloc
{
  free(self->_buffer);
  v3.receiver = self;
  v3.super_class = (Class)FloatArray;
  [(FloatArray *)&v3 dealloc];
}

- (float)floatAtIndex:(unint64_t)a3
{
  if (self->_count <= a3) {
    -[FloatArray floatAtIndex:]();
  }
  return self->_buffer[a3];
}

- (const)floats
{
  return self->_buffer;
}

- (BOOL)isEqualToFloatArray:(id)a3
{
  return [(FloatArray *)self isEqualToFloatArray:a3 tolerance:0.0];
}

- (BOOL)isEqualToFloatArray:(id)a3 tolerance:(float)a4
{
  id v6 = a3;
  unint64_t v7 = [(FloatArray *)self count];
  if (v7 == [v6 count])
  {
    [(FloatArray *)self maximumDifferenceWithFloatArray:v6];
    BOOL v9 = v8 <= a4;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (float)maximumDifferenceWithFloatArray:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(FloatArray *)self count];
  unint64_t v6 = [v4 count];
  if (v5 >= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v5;
  }
  float v8 = [(FloatArray *)self floats];
  id v9 = v4;
  v10 = (float *)[v9 floats];
  if (v7 < 1)
  {
    float v12 = 0.0;
  }
  else
  {
    v11 = &v8[v7];
    float v12 = 0.0;
    do
    {
      float v13 = *v8++;
      float v14 = v13;
      float v15 = *v10++;
      float v16 = v14 - v15;
      if (v16 < 0.0) {
        float v16 = -v16;
      }
      if (v12 < v16) {
        float v12 = v16;
      }
    }
    while (v8 < v11);
  }

  return v12;
}

- (float)mean
{
  float __C = 0.0;
  v2 = self;
  vDSP_meanv([(FloatArray *)v2 floats], 1, &__C, [(FloatArray *)v2 count]);
  return __C;
}

- (unint64_t)argMinimum
{
  float __C = 0.0;
  vDSP_Length v4 = 0;
  v2 = self;
  vDSP_minvi([(FloatArray *)v2 floats], 1, &__C, &v4, [(FloatArray *)v2 count]);
  return v4;
}

- (id)addingConstant:(float)a3
{
  float __B = a3;
  vDSP_Length v4 = [[MutableFloatArray alloc] initWithCount:[(FloatArray *)self count]];
  unint64_t v5 = self;
  unint64_t v6 = [(FloatArray *)v5 floats];
  uint64_t v7 = v4;
  vDSP_vsadd(v6, 1, &__B, [(MutableFloatArray *)v7 mutableFloats], 1, [(FloatArray *)v5 count]);

  return v7;
}

- (id)subtracting:(id)a3
{
  vDSP_Length v4 = a3;
  if (self->_count != v4[2]) {
    -[FloatArray subtracting:]();
  }
  unint64_t v5 = v4;
  unint64_t v6 = [[MutableFloatArray alloc] initWithCount:self->_count];
  id v7 = v5;
  float v8 = (const float *)[v7 floats];
  id v9 = self;
  v10 = [(FloatArray *)v9 floats];
  v11 = v6;
  vDSP_vsub(v8, 1, v10, 1, [(MutableFloatArray *)v11 mutableFloats], 1, [(FloatArray *)v9 count]);

  return v11;
}

- (FloatArray)initWithArray:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[FloatArray initWithCount:](self, "initWithCount:", [v4 count]);
  if (v5 && [v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v4 objectAtIndexedSubscript:v6];
      [v7 floatValue];
      v5->_buffer[v6] = v8;

      ++v6;
    }
    while (v6 < [v4 count]);
  }

  return v5;
}

- (id)asArray
{
  objc_super v3 = objc_opt_new();
  id v4 = self;
  uint64_t v5 = [(FloatArray *)v4 floats];
  if (v4->_count)
  {
    uint64_t v7 = v5;
    unint64_t v8 = 0;
    do
    {
      LODWORD(v6) = *(_DWORD *)(v7 + 4 * v8);
      id v9 = [NSNumber numberWithFloat:v6];
      [v3 addObject:v9];

      ++v8;
    }
    while (v8 < v4->_count);
  }
  v10 = (void *)[v3 copy];

  return v10;
}

- (FloatArray)initWithData:(id)a3
{
  id v4 = a3;
  if (([v4 length] & 3) != 0)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = v4;
    self = -[FloatArray initWithFloats:count:](self, "initWithFloats:count:", [v6 bytes], (unint64_t)objc_msgSend(v6, "length") >> 2);
    uint64_t v5 = self;
  }

  return v5;
}

- (id)asData
{
  v2 = (void *)MEMORY[0x1E4F1C9B8];
  objc_super v3 = self;
  uint64_t v4 = [(FloatArray *)v3 floats];
  uint64_t v5 = 4 * [(FloatArray *)v3 count];

  return (id)[v2 dataWithBytes:v4 length:v5];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [MutableFloatArray alloc];

  return [(FloatArray *)v4 initWithFloatArray:self];
}

- (unint64_t)count
{
  return self->_count;
}

- (void)floatAtIndex:.cold.1()
{
}

- (void)subtracting:.cold.1()
{
  __assert_rtn("-[FloatArray subtracting:]", "FloatArray.m", 130, "_count == array->_count");
}

@end