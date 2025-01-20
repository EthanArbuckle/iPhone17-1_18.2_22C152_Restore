@interface PGFeatureSliceTransformer
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)name;
- (PGFeatureSliceTransformer)init;
- (id)applyTransformationToFloatVector:(id)a3 error:(id *)a4;
- (id)floatVectorWithFloatVector:(id)a3 error:(id *)a4;
- (id)initFromIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (int64_t)fromIndex;
- (int64_t)toIndex;
@end

@implementation PGFeatureSliceTransformer

- (int64_t)toIndex
{
  return self->_toIndex;
}

- (int64_t)fromIndex
{
  return self->_fromIndex;
}

- (id)applyTransformationToFloatVector:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  v8 = NSString;
  v9 = NSStringFromSelector(a2);
  v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (id)floatVectorWithFloatVector:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(PGFeatureSliceTransformer *)self fromIndex];
  uint64_t v8 = v7 & ~(v7 >> 63);
  uint64_t v9 = [v6 count];
  if (v8 >= v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v8;
  }
  int64_t v11 = [(PGFeatureSliceTransformer *)self toIndex];
  uint64_t v12 = [v6 count];
  if (v11 >= v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = v11;
  }
  uint64_t v14 = v13 & ~(v13 >> 63);
  v15 = [v6 sliceFromStart:0 toEnd:v10];
  v16 = [v6 sliceFromStart:v10 toEnd:v14];
  v17 = objc_msgSend(v6, "sliceFromStart:toEnd:", v14, objc_msgSend(v6, "count"));

  v18 = [(PGFeatureSliceTransformer *)self applyTransformationToFloatVector:v16 error:a4];
  if (v18)
  {
    v19 = [v15 vectorByAppendingVector:v18];
    v20 = [v19 vectorByAppendingVector:v17];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)initFromIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PGFeatureSliceTransformer;
  id result = [(PGFeatureSliceTransformer *)&v7 init];
  if (result)
  {
    *((void *)result + 1) = a3;
    *((void *)result + 2) = a4;
  }
  return result;
}

- (PGFeatureSliceTransformer)init
{
  return (PGFeatureSliceTransformer *)[(PGFeatureSliceTransformer *)self initFromIndex:0 toIndex:0x7FFFFFFFLL];
}

+ (id)name
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  uint64_t v8 = NSString;
  uint64_t v9 = NSStringFromSelector(a2);
  uint64_t v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

@end