@interface SXJSONObjectTransformer
+ (id)concatenatingTransformerWithKey:(id)a3;
+ (id)mergingTransformerWithKey:(id)a3;
+ (id)transformerWithKey:(id)a3 block:(id)a4;
- (NSString)key;
- (id)block;
- (id)transformKey:(id)a3;
- (id)transformObject:(id)a3 otherObject:(id)a4;
@end

@implementation SXJSONObjectTransformer

+ (id)transformerWithKey:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SXJSONObjectTransformer);
  uint64_t v8 = [v6 copy];

  key = v7->_key;
  v7->_key = (NSString *)v8;

  uint64_t v10 = [v5 copy];
  id block = v7->_block;
  v7->_id block = (id)v10;

  return v7;
}

+ (id)concatenatingTransformerWithKey:(id)a3
{
  return (id)[a1 transformerWithKey:a3 block:&__block_literal_global_49];
}

id __59__SXJSONObjectTransformer_concatenatingTransformerWithKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = a2;
  unint64_t v5 = a3;
  if (v4 | v5)
  {
    v7 = [MEMORY[0x263EFF980] array];
    id v6 = v7;
    if (v5) {
      [v7 addObject:v5];
    }
    if (v4) {
      [v6 addObject:v4];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)mergingTransformerWithKey:(id)a3
{
  return (id)[a1 transformerWithKey:a3 block:&__block_literal_global_3];
}

id __53__SXJSONObjectTransformer_mergingTransformerWithKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = a2;
  unint64_t v5 = a3;
  if (v4 | v5)
  {
    id v6 = [MEMORY[0x263EFF980] array];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 addObjectsFromArray:v5];
    }
    else if (v5)
    {
      [v6 addObject:v5];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 addObjectsFromArray:v4];
    }
    else if (v4)
    {
      [v6 addObject:v4];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)transformObject:(id)a3 otherObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SXJSONObjectTransformer *)self block];
  v9 = ((void (**)(void, id, id))v8)[2](v8, v7, v6);

  return v9;
}

- (id)transformKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SXJSONObjectTransformer *)self key];
  id v6 = v5;
  if (!v5) {
    unint64_t v5 = v4;
  }
  id v7 = v5;

  return v7;
}

- (NSString)key
{
  return self->_key;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end