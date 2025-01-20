@interface SBInAppStatusBarHiddenAssertion
- (SBInAppStatusBarHiddenAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 invalidationBlock:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithAnimation:(BOOL)a3;
@end

@implementation SBInAppStatusBarHiddenAssertion

- (SBInAppStatusBarHiddenAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 invalidationBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBInAppStatusBarHiddenAssertion.m", 19, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SBInAppStatusBarHiddenAssertion.m", 18, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SBInAppStatusBarHiddenAssertion.m", 20, @"Invalid parameter not satisfying: %@", @"invalidationBlock" object file lineNumber description];

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)SBInAppStatusBarHiddenAssertion;
  v12 = [(SBInAppStatusBarHiddenAssertion *)&v23 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    reason = v12->_reason;
    v12->_reason = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    id invalidationBlock = v12->_invalidationBlock;
    v12->_id invalidationBlock = (id)v17;
  }
  return v12;
}

- (void)dealloc
{
  [(SBInAppStatusBarHiddenAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBInAppStatusBarHiddenAssertion;
  [(SBInAppStatusBarHiddenAssertion *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)invalidateWithAnimation:(BOOL)a3
{
  id invalidationBlock = (void (**)(id, SBInAppStatusBarHiddenAssertion *, BOOL))self->_invalidationBlock;
  if (invalidationBlock)
  {
    invalidationBlock[2](invalidationBlock, self, a3);
    id v5 = self->_invalidationBlock;
    self->_id invalidationBlock = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end