@interface PKPhysicsFieldCustomBlock
+ (id)fieldWithCustomBatchBlock:(id)a3;
+ (id)fieldWithCustomBlock:(id)a3;
- (PKPhysicsFieldCustomBlock)initWithCustomBatchBlock:(id)a3;
- (PKPhysicsFieldCustomBlock)initWithCustomBlock:(id)a3;
@end

@implementation PKPhysicsFieldCustomBlock

- (PKPhysicsFieldCustomBlock)initWithCustomBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPhysicsFieldCustomBlock;
  v5 = [(PKPhysicsField *)&v8 init];
  if (v5)
  {
    v7 = v5;
    std::allocate_shared[abi:ne180100]<PKCFieldUser,std::allocator<PKCFieldUser>,void *,void>((uint64_t)&v9, (void **)&v7);
  }

  return 0;
}

+ (id)fieldWithCustomBlock:(id)a3
{
  id v3 = a3;
  id v4 = [[PKPhysicsFieldCustomBlock alloc] initWithCustomBlock:v3];

  return v4;
}

- (PKPhysicsFieldCustomBlock)initWithCustomBatchBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPhysicsFieldCustomBlock;
  v5 = [(PKPhysicsField *)&v8 init];
  if (v5)
  {
    v7 = v5;
    std::allocate_shared[abi:ne180100]<PKCFieldUser,std::allocator<PKCFieldUser>,void *,void>((uint64_t)&v9, (void **)&v7);
  }

  return 0;
}

+ (id)fieldWithCustomBatchBlock:(id)a3
{
  id v3 = a3;
  id v4 = [[PKPhysicsFieldCustomBlock alloc] initWithCustomBatchBlock:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong(&self->_batchBlock, 0);
}

@end