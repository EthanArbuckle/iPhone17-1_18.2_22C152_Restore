@interface SBSABounceRequest
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SBSABounceRequest)initWithStyle:(int64_t)a3 triggeredBlock:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)triggeredBlock;
- (int64_t)style;
- (unint64_t)hash;
@end

@implementation SBSABounceRequest

- (SBSABounceRequest)initWithStyle:(int64_t)a3 triggeredBlock:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSABounceRequest;
  v7 = [(SBSABounceRequest *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_style = a3;
    uint64_t v9 = [v6 copy];
    id triggeredBlock = v8->_triggeredBlock;
    v8->_id triggeredBlock = (id)v9;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t style = self->_style;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __29__SBSABounceRequest_isEqual___block_invoke;
  v19[3] = &unk_1E6AF9660;
  id v7 = v4;
  id v20 = v7;
  v8 = [v5 appendInteger:style counterpart:v19];
  uint64_t v9 = (void *)MEMORY[0x1D948C7A0](self->_triggeredBlock);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __29__SBSABounceRequest_isEqual___block_invoke_2;
  v17 = &unk_1E6AF9E90;
  id v18 = v7;
  id v10 = v7;
  v11 = [v8 appendObject:v9 counterpart:&v14];
  char v12 = objc_msgSend(v11, "isEqual", v14, v15, v16, v17);

  return v12;
}

uint64_t __29__SBSABounceRequest_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) style];
}

uint64_t __29__SBSABounceRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggeredBlock];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendInteger:self->_style];
  v5 = (void *)MEMORY[0x1D948C7A0](self->_triggeredBlock);
  id v6 = [v4 appendObject:v5];
  unint64_t v7 = [v6 hash];

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = @"up";
  int64_t style = self->_style;
  id triggeredBlock = self->_triggeredBlock;
  if (style == 1) {
    v5 = @"left";
  }
  if (style == 2) {
    v5 = @"right";
  }
  v8 = v5;
  uint64_t v9 = (void *)MEMORY[0x1D948C7A0](triggeredBlock);
  id v10 = [v3 stringWithFormat:@"<%@: %p; style: %@, triggeredBlock: %@>", v4, self, v8, v9];

  return (NSString *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t style = self->_style;
  id triggeredBlock = self->_triggeredBlock;
  return (id)[v4 initWithStyle:style triggeredBlock:triggeredBlock];
}

- (int64_t)style
{
  return self->_style;
}

- (id)triggeredBlock
{
  return self->_triggeredBlock;
}

- (void).cxx_destruct
{
}

@end