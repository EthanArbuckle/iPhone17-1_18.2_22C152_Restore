@interface SUPolicyRollback
- (BOOL)cancelActiveUpdate;
- (SUPolicyRollback)initWithRollbackOptions:(id)a3;
- (SURollbackOptions)rollbackOptions;
@end

@implementation SUPolicyRollback

- (SUPolicyRollback)initWithRollbackOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUPolicyRollback;
  v6 = [(SUPolicyRollback *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rollbackOptions, a3);
  }

  return v7;
}

- (BOOL)cancelActiveUpdate
{
  return [(SURollbackOptions *)self->_rollbackOptions cancelActiveUpdate];
}

- (SURollbackOptions)rollbackOptions
{
  return self->_rollbackOptions;
}

- (void).cxx_destruct
{
}

@end