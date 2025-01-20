@interface PMLMutableDenseVector
- (NSMutableData)mutableData;
- (PMLMutableDenseVector)initWithMutableData:(id)a3;
- (float)mutablePtr;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)append:(const float *)a3 count:(unint64_t)a4;
- (void)append:(float)a3;
- (void)processValuesInPlaceWithBlock:(id)a3;
- (void)scaleInPlaceWithFactor:(float)a3;
- (void)scaleInPlaceWithInversedFactor:(float)a3;
- (void)sumInPlaceWithVector:(id)a3;
@end

@implementation PMLMutableDenseVector

- (void).cxx_destruct
{
}

- (NSMutableData)mutableData
{
  return self->_mutableData;
}

- (void)sumInPlaceWithVector:(id)a3
{
  id v4 = a3;
  int v5 = [(PMLDenseVector *)self count];
  id v6 = v4;
  v7 = (const float *)[v6 ptr];

  v8 = [(PMLMutableDenseVector *)self mutablePtr];
  cblas_saxpy(v5, 1.0, v7, 1, v8, 1);
}

- (void)scaleInPlaceWithFactor:(float)a3
{
  int v5 = [(PMLDenseVector *)self count];
  id v6 = [(PMLMutableDenseVector *)self mutablePtr];
  cblas_sscal(v5, a3, v6, 1);
}

- (void)scaleInPlaceWithInversedFactor:(float)a3
{
  if (a3 > 0.0)
  {
    int v6 = [(PMLDenseVector *)self count];
    v7 = [(PMLMutableDenseVector *)self mutablePtr];
    cblas_sscal(v6, 1.0 / a3, v7, 1);
  }
}

- (void)processValuesInPlaceWithBlock:(id)a3
{
  v9 = (float (**)(id, void, float))a3;
  id v4 = self;
  uint64_t v5 = [(PMLMutableDenseVector *)v4 mutablePtr];
  uint64_t v6 = [(PMLDenseVector *)v4 count];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      *(float *)(v5 + 4 * i) = v9[2](v9, i, *(float *)(v5 + 4 * i));
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[PMLMutableDenseVector allocWithZone:a3];
  data = self->super._data;
  return [(PMLDenseVector *)v4 initWithData:data];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[PMLDenseVector allocWithZone:a3];
  data = self->super._data;
  return [(PMLDenseVector *)v4 initWithData:data];
}

- (void)append:(const float *)a3 count:(unint64_t)a4
{
}

- (void)append:(float)a3
{
  float v3 = a3;
  [(NSMutableData *)self->super._data appendBytes:&v3 length:4];
}

- (PMLMutableDenseVector)initWithMutableData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLMutableDenseVector;
  uint64_t v6 = [(PMLDenseVector *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->super._data, a3);
  }

  return v7;
}

- (float)mutablePtr
{
  return (float *)[(NSMutableData *)self->super._data bytes];
}

@end