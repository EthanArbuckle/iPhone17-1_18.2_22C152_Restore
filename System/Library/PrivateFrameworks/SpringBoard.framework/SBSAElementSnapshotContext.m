@interface SBSAElementSnapshotContext
+ (Class)mutatorClass;
+ (id)instanceWithBlock:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)clientIdentifier;
- (NSString)description;
- (NSString)elementIdentifier;
- (NSString)snapshotReason;
- (SBSAElementSnapshotContext)initWithSnapshotIdentity:(id)a3;
- (id)copyWithBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setClientIdentifier:(id)a3;
- (void)_setElementIdentifier:(id)a3;
- (void)_setSnapshotReason:(id)a3;
@end

@implementation SBSAElementSnapshotContext

- (SBSAElementSnapshotContext)initWithSnapshotIdentity:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBSAElementSnapshotContext;
  v5 = [(SBSAElementSnapshotContext *)&v16 init];
  if (v5)
  {
    v6 = [v4 clientIdentifier];
    uint64_t v7 = [v6 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v7;

    v9 = [v4 elementIdentifier];
    uint64_t v10 = [v9 copy];
    elementIdentifier = v5->_elementIdentifier;
    v5->_elementIdentifier = (NSString *)v10;

    v12 = [v4 snapshotReason];
    uint64_t v13 = [v12 copy];
    snapshotReason = v5->_snapshotReason;
    v5->_snapshotReason = (NSString *)v13;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  clientIdentifier = self->_clientIdentifier;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __38__SBSAElementSnapshotContext_isEqual___block_invoke;
  v21[3] = &unk_1E6AF9E90;
  id v7 = v4;
  id v22 = v7;
  v8 = [v5 appendObject:clientIdentifier counterpart:v21];
  elementIdentifier = self->_elementIdentifier;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __38__SBSAElementSnapshotContext_isEqual___block_invoke_2;
  v19[3] = &unk_1E6AF9E90;
  id v10 = v7;
  id v20 = v10;
  v11 = [v8 appendObject:elementIdentifier counterpart:v19];
  snapshotReason = self->_snapshotReason;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __38__SBSAElementSnapshotContext_isEqual___block_invoke_3;
  v17[3] = &unk_1E6AF9E90;
  id v18 = v10;
  id v13 = v10;
  v14 = [v11 appendObject:snapshotReason counterpart:v17];
  char v15 = [v14 isEqual];

  return v15;
}

uint64_t __38__SBSAElementSnapshotContext_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clientIdentifier];
}

uint64_t __38__SBSAElementSnapshotContext_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) elementIdentifier];
}

uint64_t __38__SBSAElementSnapshotContext_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapshotReason];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_clientIdentifier];
  v5 = [v4 appendObject:self->_elementIdentifier];
  v6 = [v5 appendObject:self->_snapshotReason];
  unint64_t v7 = [v6 hash];

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; clientIdentifier: %@; elementIdentifier: %@; snapshotReason: %@>",
                       objc_opt_class(),
                       self,
                       self->_clientIdentifier,
                       self->_elementIdentifier,
                       self->_snapshotReason);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSString *)self->_clientIdentifier copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_elementIdentifier copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_snapshotReason copy];
  id v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

+ (id)instanceWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = (void *)[v4 copyWithBlock:v3];

  return v5;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (void *)[(SBSAElementSnapshotContext *)self copy];
  if (v4)
  {
    v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithElementSnapshotContext:", v5);
    v4[2](v4, v6);
  }
  return v5;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)_setClientIdentifier:(id)a3
{
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)_setElementIdentifier:(id)a3
{
}

- (NSString)snapshotReason
{
  return self->_snapshotReason;
}

- (void)_setSnapshotReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotReason, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end