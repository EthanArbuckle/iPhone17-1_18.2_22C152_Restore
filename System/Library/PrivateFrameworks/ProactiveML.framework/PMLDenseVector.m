@interface PMLDenseVector
+ (id)denseVectorFromNumbers:(id)a3;
- (NSData)data;
- (PMLDenseVector)init;
- (PMLDenseVector)initWithCount:(unint64_t)a3;
- (PMLDenseVector)initWithData:(id)a3;
- (PMLDenseVector)initWithFloats:(const float *)a3 count:(unint64_t)a4;
- (PMLDenseVector)initWithFloatsNoCopy:(float *)a3 count:(unint64_t)a4 deallocator:(id)a5;
- (PMLDenseVector)initWithFloatsNoCopy:(float *)a3 count:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (PMLDenseVector)initWithNumbers:(id)a3;
- (const)ptr;
- (float)cosineDistanceFrom:(id)a3;
- (float)density;
- (float)l1norm;
- (float)l2norm;
- (float)maxValue;
- (float)minValue;
- (float)valueAt:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)sliceFrom:(int)a3 to:(int)a4;
- (id)vecByAppendingVec:(id)a3;
- (unint64_t)count;
- (void)enumerateNonZeroValuesWithBlock:(id)a3;
- (void)enumerateValuesWithBlock:(id)a3;
@end

@implementation PMLDenseVector

- (void).cxx_destruct
{
}

- (float)valueAt:(unint64_t)a3
{
  if ([(PMLDenseVector *)self count] <= a3)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PMLDenseVector.m", 202, @"Index %tu out of bounds (vector length: %tu)", a3, -[PMLDenseVector count](self, "count"));
  }
  return [(PMLDenseVector *)self ptr][4 * a3];
}

- (void)enumerateNonZeroValuesWithBlock:(id)a3
{
  v9 = (void (**)(id, void))a3;
  v4 = self;
  uint64_t v5 = [(PMLDenseVector *)v4 ptr];
  uint64_t v6 = [(PMLDenseVector *)v4 count];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(float *)(v5 + 4 * i) != 0.0) {
        v9[2](v9, i);
      }
    }
  }
}

- (void)enumerateValuesWithBlock:(id)a3
{
  v9 = (void (**)(id, void, float))a3;
  v4 = self;
  uint64_t v5 = [(PMLDenseVector *)v4 ptr];
  uint64_t v6 = [(PMLDenseVector *)v4 count];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      v9[2](v9, i, *(float *)(v5 + 4 * i));
  }
}

- (float)density
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __25__PMLDenseVector_density__block_invoke;
  v6[3] = &unk_26459F208;
  v6[4] = &v7;
  [(PMLDenseVector *)self enumerateNonZeroValuesWithBlock:v6];
  unint64_t v3 = v8[3];
  float v4 = (float)v3 / (float)[(PMLDenseVector *)self count];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __25__PMLDenseVector_density__block_invoke(uint64_t result)
{
  return result;
}

- (float)maxValue
{
  v2 = self;
  uint64_t v3 = [(PMLDenseVector *)v2 ptr];
  if (![(PMLDenseVector *)v2 count]) {
    return 1.1755e-38;
  }
  unint64_t v4 = 0;
  float v5 = 1.1755e-38;
  do
  {
    if (v5 < *(float *)(v3 + 4 * v4)) {
      float v5 = *(float *)(v3 + 4 * v4);
    }
    ++v4;
  }
  while (v4 < [(PMLDenseVector *)v2 count]);
  return v5;
}

- (float)minValue
{
  v2 = self;
  uint64_t v3 = [(PMLDenseVector *)v2 ptr];
  if (![(PMLDenseVector *)v2 count]) {
    return 3.4028e38;
  }
  unint64_t v4 = 0;
  float v5 = 3.4028e38;
  do
  {
    if (v5 >= *(float *)(v3 + 4 * v4)) {
      float v5 = *(float *)(v3 + 4 * v4);
    }
    ++v4;
  }
  while (v4 < [(PMLDenseVector *)v2 count]);
  return v5;
}

- (float)l2norm
{
  int v3 = [(PMLDenseVector *)self count];
  unint64_t v4 = [(PMLDenseVector *)self ptr];
  return cblas_snrm2(v3, v4, 1);
}

- (float)l1norm
{
  int v3 = [(PMLDenseVector *)self count];
  unint64_t v4 = [(PMLDenseVector *)self ptr];
  return cblas_sasum(v3, v4, 1);
}

- (float)cosineDistanceFrom:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  if (v6 != [(PMLDenseVector *)self count])
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PMLDenseVector.m", 134, @"Invalid parameter not satisfying: %@", @"other.count == self.count" object file lineNumber description];
  }
  int v7 = [(PMLDenseVector *)self count];
  v8 = self;
  uint64_t v9 = [(PMLDenseVector *)v8 ptr];
  id v10 = v5;
  float v11 = cblas_sdot(v7, v9, 1, (const float *)[v10 ptr], 1);
  [(PMLDenseVector *)v8 l2norm];
  float v13 = v12;
  [v10 l2norm];
  float v15 = v14;

  return 1.0 - (float)(v11 / (float)(v13 * v15));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[PMLMutableDenseVector allocWithZone:a3];
  data = self->_data;
  return [(PMLDenseVector *)v4 initWithData:data];
}

+ (id)denseVectorFromNumbers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithNumbers:v4];

  return v5;
}

- (id)vecByAppendingVec:(id)a3
{
  id v4 = self->_data;
  id v5 = [a3 data];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", objc_msgSend(v5, "length") + -[NSMutableData length](v4, "length"));
  [v6 appendData:v4];

  [v6 appendData:v5];
  int v7 = [[PMLMutableDenseVector alloc] initWithMutableData:v6];

  return v7;
}

- (id)sliceFrom:(int)a3 to:(int)a4
{
  if (a3 < 0 || [(PMLDenseVector *)self count] <= a3)
  {
    float v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PMLDenseVector.m", 104, @"Invalid parameter not satisfying: %@", @"start >= 0 && start < self.count" object file lineNumber description];
  }
  if (a4 < 1 || [(PMLDenseVector *)self count] < a4)
  {
    float v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PMLDenseVector.m", 105, @"Invalid parameter not satisfying: %@", @"end > 0 && end <= self.count" object file lineNumber description];
  }
  int v8 = a4 - a3;
  if (a4 < a3)
  {
    float v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PMLDenseVector.m", 106, @"Invalid parameter not satisfying: %@", @"end >= start" object file lineNumber description];
  }
  uint64_t v9 = [(PMLDenseVector *)[PMLMutableDenseVector alloc] initWithCount:v8];
  memcpy([(PMLMutableDenseVector *)v9 mutablePtr], [(PMLDenseVector *)self ptr] + 4 * a3, 4 * v8);
  return v9;
}

- (PMLDenseVector)initWithNumbers:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PMLDenseVector;
  id v5 = [(PMLDenseVector *)&v13 init];
  if (v5)
  {
    uint64_t v6 = (NSMutableData *) objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithLength:", 4 * objc_msgSend(v4, "count"));
    uint64_t v7 = [(NSMutableData *)v6 mutableBytes];
    if ([v4 count])
    {
      unint64_t v8 = 0;
      do
      {
        uint64_t v9 = [v4 objectAtIndexedSubscript:v8];
        [v9 floatValue];
        *(_DWORD *)(v7 + 4 * v8) = v10;

        ++v8;
      }
      while (v8 < [v4 count]);
    }
    data = v5->_data;
    v5->_data = v6;
  }
  return v5;
}

- (PMLDenseVector)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLDenseVector;
  id v5 = [(PMLDenseVector *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    data = v5->_data;
    v5->_data = (NSMutableData *)v6;
  }
  return v5;
}

- (PMLDenseVector)initWithFloatsNoCopy:(float *)a3 count:(unint64_t)a4 deallocator:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PMLDenseVector;
  objc_super v9 = [(PMLDenseVector *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF990]) initWithBytesNoCopy:a3 length:4 * a4 deallocator:v8];
    data = v9->_data;
    v9->_data = (NSMutableData *)v10;
  }
  return v9;
}

- (PMLDenseVector)initWithFloatsNoCopy:(float *)a3 count:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PMLDenseVector;
  id v8 = [(PMLDenseVector *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF990]) initWithBytesNoCopy:a3 length:4 * a4 freeWhenDone:v5];
    data = v8->_data;
    v8->_data = (NSMutableData *)v9;
  }
  return v8;
}

- (PMLDenseVector)initWithFloats:(const float *)a3 count:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PMLDenseVector;
  uint64_t v6 = [(PMLDenseVector *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF990]) initWithBytes:a3 length:4 * a4];
    data = v6->_data;
    v6->_data = (NSMutableData *)v7;
  }
  return v6;
}

- (PMLDenseVector)initWithCount:(unint64_t)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)PMLDenseVector;
  id v4 = [(PMLDenseVector *)&v12 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF990]) initWithLength:4 * a3];
    data = v4->_data;
    v4->_data = (NSMutableData *)v5;

    if (!v4->_data)
    {
      id v8 = (void *)MEMORY[0x263EFF940];
      objc_super v13 = @"count";
      uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
      v14[0] = v9;
      objc_super v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      id v11 = [v8 exceptionWithName:@"PMLMutableDenseVectorAllocationFailure" reason:@"Failed to allocate NSData." userInfo:v10];

      objc_exception_throw(v11);
    }
  }
  return v4;
}

- (PMLDenseVector)init
{
  v6.receiver = self;
  v6.super_class = (Class)PMLDenseVector;
  v2 = [(PMLDenseVector *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;
  }
  return v2;
}

- (NSData)data
{
  return (NSData *)self->_data;
}

- (unint64_t)count
{
  return [(NSMutableData *)self->_data length] >> 2;
}

- (const)ptr
{
  return (const float *)[(NSMutableData *)self->_data bytes];
}

@end