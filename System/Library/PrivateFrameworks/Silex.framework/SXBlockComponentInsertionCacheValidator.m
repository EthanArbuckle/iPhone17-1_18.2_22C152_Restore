@interface SXBlockComponentInsertionCacheValidator
+ (id)validatorWithBlock:(id)a3;
- (BOOL)validateCache:(id)a3 DOMObjectProvider:(id)a4;
- (id)block;
@end

@implementation SXBlockComponentInsertionCacheValidator

+ (id)validatorWithBlock:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = MEMORY[0x223CA5030](v4);

  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)validateCache:(id)a3 DOMObjectProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SXBlockComponentInsertionCacheValidator *)self block];
  char v9 = ((uint64_t (**)(void, id, id))v8)[2](v8, v7, v6);

  return v9;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
}

@end