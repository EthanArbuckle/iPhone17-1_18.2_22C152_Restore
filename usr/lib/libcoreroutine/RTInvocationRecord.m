@interface RTInvocationRecord
- (NSString)invocationDescription;
- (RTInvocationRecord)initWithBlock:(id)a3 failureBlock:(id)a4 description:(id)a5;
- (id)block;
- (id)copyWithZone:(_NSZone *)a3;
- (id)failureBlock;
- (void)invoke;
- (void)invokeFailure;
- (void)setBlock:(id)a3;
- (void)setFailureBlock:(id)a3;
- (void)setInvocationDescription:(id)a3;
@end

@implementation RTInvocationRecord

- (RTInvocationRecord)initWithBlock:(id)a3 failureBlock:(id)a4 description:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RTInvocationRecord;
  v11 = [(RTInvocationRecord *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    id block = v11->_block;
    v11->_id block = (id)v12;

    uint64_t v14 = [v9 copy];
    id failureBlock = v11->_failureBlock;
    v11->_id failureBlock = (id)v14;

    uint64_t v16 = [v10 copy];
    invocationDescription = v11->_invocationDescription;
    v11->_invocationDescription = (NSString *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id block = self->_block;
  id failureBlock = self->_failureBlock;
  invocationDescription = self->_invocationDescription;

  return (id)[v4 initWithBlock:block failureBlock:failureBlock description:invocationDescription];
}

- (void)invoke
{
  id block = (void (**)(void))self->_block;
  if (block) {
    block[2]();
  }
}

- (void)invokeFailure
{
  id failureBlock = (void (**)(void))self->_failureBlock;
  if (failureBlock) {
    failureBlock[2]();
  }
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (id)failureBlock
{
  return self->_failureBlock;
}

- (void)setFailureBlock:(id)a3
{
}

- (NSString)invocationDescription
{
  return self->_invocationDescription;
}

- (void)setInvocationDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationDescription, 0);
  objc_storeStrong(&self->_failureBlock, 0);

  objc_storeStrong(&self->_block, 0);
}

@end