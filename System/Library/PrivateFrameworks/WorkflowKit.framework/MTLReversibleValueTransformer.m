@interface MTLReversibleValueTransformer
+ (BOOL)allowsReverseTransformation;
- (MTLReversibleValueTransformer)initWithForwardBlock:(id)a3 reverseBlock:(id)a4;
- (id)reverseTransformedValue:(id)a3;
- (id)reverseTransformedValue:(id)a3 success:(BOOL *)a4 error:(id *)a5;
@end

@implementation MTLReversibleValueTransformer

- (id)reverseTransformedValue:(id)a3 success:(BOOL *)a4 error:(id *)a5
{
  BOOL v14 = 1;
  id v8 = a3;
  v9 = [(MTLValueTransformer *)self reverseBlock];
  id v13 = 0;
  v10 = ((void (**)(void, id, BOOL *, id *))v9)[2](v9, v8, &v14, &v13);

  id v11 = v13;
  if (a4) {
    *a4 = v14;
  }
  if (a5) {
    *a5 = v11;
  }

  return v10;
}

- (id)reverseTransformedValue:(id)a3
{
  char v9 = 1;
  id v4 = a3;
  v5 = [(MTLValueTransformer *)self reverseBlock];
  uint64_t v8 = 0;
  v6 = ((void (**)(void, id, char *, uint64_t *))v5)[2](v5, v4, &v9, &v8);

  return v6;
}

- (MTLReversibleValueTransformer)initWithForwardBlock:(id)a3 reverseBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MTLValueTransformer.m", 89, @"Invalid parameter not satisfying: %@", @"reverseBlock != nil" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)MTLReversibleValueTransformer;
  char v9 = [(MTLValueTransformer *)&v12 initWithForwardBlock:v7 reverseBlock:v8];

  return v9;
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

@end