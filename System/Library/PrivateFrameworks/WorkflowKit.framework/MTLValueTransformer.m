@interface MTLValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
+ (id)reversibleTransformerWithBlock:(id)a3;
+ (id)reversibleTransformerWithForwardBlock:(id)a3 reverseBlock:(id)a4;
+ (id)transformerUsingForwardBlock:(id)a3;
+ (id)transformerUsingForwardBlock:(id)a3 reverseBlock:(id)a4;
+ (id)transformerUsingReversibleBlock:(id)a3;
+ (id)transformerWithBlock:(id)a3;
- (MTLValueTransformer)initWithForwardBlock:(id)a3 reverseBlock:(id)a4;
- (id)forwardBlock;
- (id)reverseBlock;
- (id)transformedValue:(id)a3;
- (id)transformedValue:(id)a3 success:(BOOL *)a4 error:(id *)a5;
@end

@implementation MTLValueTransformer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reverseBlock, 0);
  objc_storeStrong(&self->_forwardBlock, 0);
}

- (id)reverseBlock
{
  return self->_reverseBlock;
}

- (id)forwardBlock
{
  return self->_forwardBlock;
}

- (id)transformedValue:(id)a3 success:(BOOL *)a4 error:(id *)a5
{
  BOOL v14 = 1;
  id v8 = a3;
  v9 = [(MTLValueTransformer *)self forwardBlock];
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

- (id)transformedValue:(id)a3
{
  char v9 = 1;
  id v4 = a3;
  v5 = [(MTLValueTransformer *)self forwardBlock];
  uint64_t v8 = 0;
  v6 = ((void (**)(void, id, char *, uint64_t *))v5)[2](v5, v4, &v9, &v8);

  return v6;
}

- (MTLValueTransformer)initWithForwardBlock:(id)a3 reverseBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MTLValueTransformer.m", 42, @"Invalid parameter not satisfying: %@", @"forwardBlock != nil" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)MTLValueTransformer;
  char v9 = [(MTLValueTransformer *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    id forwardBlock = v9->_forwardBlock;
    v9->_id forwardBlock = (id)v10;

    uint64_t v12 = [v8 copy];
    id reverseBlock = v9->_reverseBlock;
    v9->_id reverseBlock = (id)v12;

    BOOL v14 = v9;
  }

  return v9;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

+ (id)transformerUsingForwardBlock:(id)a3 reverseBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[MTLReversibleValueTransformer alloc] initWithForwardBlock:v6 reverseBlock:v5];

  return v7;
}

+ (id)transformerUsingReversibleBlock:(id)a3
{
  return (id)[a1 transformerUsingForwardBlock:a3 reverseBlock:a3];
}

+ (id)transformerUsingForwardBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithForwardBlock:v4 reverseBlock:0];

  return v5;
}

+ (id)reversibleTransformerWithForwardBlock:(id)a3 reverseBlock:(id)a4
{
  id v6 = a3;
  id v12 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__MTLValueTransformer_Deprecated__reversibleTransformerWithForwardBlock_reverseBlock___block_invoke;
  v13[3] = &unk_1E654C938;
  id v14 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__MTLValueTransformer_Deprecated__reversibleTransformerWithForwardBlock_reverseBlock___block_invoke_2;
  v11[3] = &unk_1E654C938;
  id v7 = v12;
  id v8 = v6;
  char v9 = [a1 transformerUsingForwardBlock:v13 reverseBlock:v11];

  return v9;
}

uint64_t __86__MTLValueTransformer_Deprecated__reversibleTransformerWithForwardBlock_reverseBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __86__MTLValueTransformer_Deprecated__reversibleTransformerWithForwardBlock_reverseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)reversibleTransformerWithBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__MTLValueTransformer_Deprecated__reversibleTransformerWithBlock___block_invoke;
  v8[3] = &unk_1E654C938;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 transformerUsingReversibleBlock:v8];

  return v6;
}

uint64_t __66__MTLValueTransformer_Deprecated__reversibleTransformerWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)transformerWithBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__MTLValueTransformer_Deprecated__transformerWithBlock___block_invoke;
  v8[3] = &unk_1E654C938;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 transformerUsingForwardBlock:v8];

  return v6;
}

uint64_t __56__MTLValueTransformer_Deprecated__transformerWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end