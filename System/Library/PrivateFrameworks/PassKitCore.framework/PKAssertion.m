@interface PKAssertion
+ (void)acquireAssertionOfType:(unint64_t)a3 withReason:(id)a4 completion:(id)a5;
+ (void)hasValidAssertionOfType:(unint64_t)a3 completion:(id)a4;
+ (void)isAssertionValid:(id)a3 completion:(id)a4;
+ (void)preheatConnection;
- (BOOL)invalidateWhenBackgrounded;
- (NSString)identifier;
- (NSString)reason;
- (PKAssertion)initWithType:(unint64_t)a3 identifier:(id)a4 reason:(id)a5;
- (id)description;
- (id)invalidationHandler;
- (unint64_t)type;
- (void)dealloc;
- (void)invalidate;
- (void)markAsInvalidatedAndNotify;
- (void)setIdentifier:(id)a3;
- (void)setInvalidateWhenBackgrounded:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation PKAssertion

+ (void)preheatConnection
{
  id v2 = +[PKAssertionCoordinator sharedInstance];
}

+ (void)acquireAssertionOfType:(unint64_t)a3 withReason:(id)a4 completion:(id)a5
{
  id v7 = a5;
  if (v7)
  {
    id v8 = a4;
    v9 = +[PKAssertionCoordinator sharedInstance];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PKAssertion_acquireAssertionOfType_withReason_completion___block_invoke;
    v10[3] = &unk_1E56F15F8;
    id v11 = v7;
    [v9 acquireAssertionOfType:a3 withReason:v8 completion:v10];
  }
}

uint64_t __60__PKAssertion_acquireAssertionOfType_withReason_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)isAssertionValid:(id)a3 completion:(id)a4
{
  id v8 = a3;
  v5 = (void (**)(id, void))a4;
  if (v5)
  {
    if (v8 && ([v8 identifier], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
    {
      id v7 = +[PKAssertionCoordinator sharedInstance];
      [v7 isAssertionValid:v8 completion:v5];
    }
    else
    {
      v5[2](v5, 0);
    }
  }
}

+ (void)hasValidAssertionOfType:(unint64_t)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = +[PKAssertionCoordinator sharedInstance];
    [v6 hasValidAssertionOfType:a3 completion:v5];
  }
}

- (PKAssertion)initWithType:(unint64_t)a3 identifier:(id)a4 reason:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKAssertion;
  v10 = [(PKAssertion *)&v17 init];
  id v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    reason = v11->_reason;
    v11->_reason = (NSString *)v14;

    v11->_invalidateWhenBackgrounded = 1;
    v11->_invalidationLock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (void)dealloc
{
  [(PKAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKAssertion;
  [(PKAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_lock(&self->_invalidationLock);
  id v6 = _Block_copy(self->_invalidationHandler);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id v5 = +[PKAssertionCoordinator sharedInstance];
  [v5 invalidateAssertion:self completion:v6];

  os_unfair_lock_unlock(p_invalidationLock);
}

- (void)markAsInvalidatedAndNotify
{
  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_lock(&self->_invalidationLock);
  v4 = _Block_copy(self->_invalidationHandler);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  os_unfair_lock_unlock(p_invalidationLock);
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__PKAssertion_markAsInvalidatedAndNotify__block_invoke;
    v7[3] = &unk_1E56D8360;
    id v8 = v4;
    id v6 = v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_17;
    block[3] = &unk_1E56D8360;
    id v10 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __41__PKAssertion_markAsInvalidatedAndNotify__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setInvalidateWhenBackgrounded:(BOOL)a3
{
  BOOL v3 = a3;
  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_lock(&self->_invalidationLock);
  if (self->_invalidateWhenBackgrounded != v3)
  {
    self->_invalidateWhenBackgrounded = v3;
    id v6 = +[PKAssertionCoordinator sharedInstance];
    [v6 assertion:self shouldInvalidateWhenBackgrounded:v3];
  }
  os_unfair_lock_unlock(p_invalidationLock);
}

- (id)description
{
  unint64_t type = self->_type;
  if (type > 8) {
    BOOL v3 = @"unknown";
  }
  else {
    BOOL v3 = off_1E56F1618[type];
  }
  return (id)[NSString stringWithFormat:@"Assertion Type: %@, Identifier: %@, Reason: %@", v3, self->_identifier, self->_reason];
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)invalidateWhenBackgrounded
{
  return self->_invalidateWhenBackgrounded;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end