@interface PGProcessAssertion
+ (id)assertionWithDomainAttribute:(id)a3 forProcessWithIdentifier:(int)a4 explanation:(id)a5;
+ (id)pipVisibleAssertionForProcessWithIdentifier:(int)a3 explanation:(id)a4 legacy:(BOOL)a5;
+ (id)pipVisibleDomainAttribute;
+ (id)pipVisibleLegacyDomainAttribute;
+ (id)transientTaskAssertionForProcessWithIdentifier:(int)a3 explanation:(id)a4;
+ (id)transientTaskDomainAttribute;
- (BOOL)_isInvalidated;
- (PGProcessAssertion)initWithExplanation:(id)a3;
- (id)description;
- (void)_setInvalidated:(BOOL)a3;
- (void)acquireWithTarget:(id)a3 domainAttribute:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation PGProcessAssertion

+ (id)pipVisibleDomainAttribute
{
  return (id)[MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.pictureinpicture" name:@"PIPVisible"];
}

+ (id)pipVisibleLegacyDomainAttribute
{
  return (id)[MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.pictureinpicture" name:@"PIPVisibleLegacy"];
}

+ (id)transientTaskDomainAttribute
{
  return (id)[MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.pictureinpicture" name:@"TransientTask"];
}

+ (id)transientTaskAssertionForProcessWithIdentifier:(int)a3 explanation:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = [a1 transientTaskDomainAttribute];
  v8 = [a1 assertionWithDomainAttribute:v7 forProcessWithIdentifier:v4 explanation:v6];

  return v8;
}

+ (id)pipVisibleAssertionForProcessWithIdentifier:(int)a3 explanation:(id)a4 legacy:(BOOL)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (a5) {
    [a1 pipVisibleLegacyDomainAttribute];
  }
  else {
  v9 = [a1 pipVisibleDomainAttribute];
  }
  v10 = [a1 assertionWithDomainAttribute:v9 forProcessWithIdentifier:v6 explanation:v8];

  return v10;
}

+ (id)assertionWithDomainAttribute:(id)a3 forProcessWithIdentifier:(int)a4 explanation:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = [[PGProcessAssertion alloc] initWithExplanation:v8];

  if ((int)v6 < 1)
  {
    v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      v13 = "+[PGProcessAssertion assertionWithDomainAttribute:forProcessWithIdentifier:explanation:]";
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1B5645000, v10, OS_LOG_TYPE_DEFAULT, "%s Will ignore %{public}@ because there wasn't a valid pid", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F96478] targetWithPid:v6];
    [(PGProcessAssertion *)v9 acquireWithTarget:v10 domainAttribute:v7];
  }

  return v9;
}

- (PGProcessAssertion)initWithExplanation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGProcessAssertion;
  v5 = [(PGProcessAssertion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGProcessAssertion;
  id v4 = [(PGProcessAssertion *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ - %@", v4, self->_explanation];

  return v5;
}

- (void)acquireWithTarget:(id)a3 domainAttribute:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  BSDispatchQueueAssertMain();
  if (self->_assertion)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PGProcessAssertion.m" lineNumber:72 description:@"Trying to acquire assertion when we already have one"];
  }
  if ([(PGProcessAssertion *)self _isInvalidated])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PGProcessAssertion.m", 73, @"Initially invalidated, which should not be possible" object file lineNumber description];
  }
  objc_super v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.pegasus.assertions", v9);
  queue = self->_queue;
  self->_queue = v10;

  int v12 = PGLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "-[PGProcessAssertion acquireWithTarget:domainAttribute:]";
    __int16 v24 = 2114;
    v25 = self;
    __int16 v26 = 2114;
    id v27 = v7;
    __int16 v28 = 2114;
    id v29 = v8;
    _os_log_impl(&dword_1B5645000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@ target: %{public}@ domain: %{public}@", buf, 0x2Au);
  }

  objc_initWeak((id *)buf, self);
  v13 = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__PGProcessAssertion_acquireWithTarget_domainAttribute___block_invoke;
  v18[3] = &unk_1E610C108;
  v18[4] = self;
  id v19 = v7;
  id v20 = v8;
  id v14 = v8;
  id v15 = v7;
  objc_copyWeak(&v21, (id *)buf);
  dispatch_async(v13, v18);
  objc_destroyWeak(&v21);

  objc_destroyWeak((id *)buf);
}

void __56__PGProcessAssertion_acquireWithTarget_domainAttribute___block_invoke(uint64_t a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) _isInvalidated] & 1) == 0)
  {
    v2 = [MEMORY[0x1E4F96308] attributeWithCompletionPolicy:0];
    id v3 = objc_alloc(MEMORY[0x1E4F96318]);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
    v18[0] = *(void *)(a1 + 48);
    v18[1] = v2;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v7 = [v3 initWithExplanation:v5 target:v4 attributes:v6];
    id v8 = *(void **)(*(void *)(a1 + 32) + 24);
    *(void *)(*(void *)(a1 + 32) + 24) = v7;

    objc_super v9 = PGLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v15 = "-[PGProcessAssertion acquireWithTarget:domainAttribute:]_block_invoke";
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1B5645000, v9, OS_LOG_TYPE_DEFAULT, "%s Acquiring %{public}@", buf, 0x16u);
    }

    v11 = *(void **)(*(void *)(a1 + 32) + 24);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__PGProcessAssertion_acquireWithTarget_domainAttribute___block_invoke_32;
    v12[3] = &unk_1E610C0E0;
    objc_copyWeak(&v13, (id *)(a1 + 56));
    [v11 acquireWithInvalidationHandler:v12];
    if ([*(id *)(a1 + 32) _isInvalidated]) {
      [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
    }
    objc_destroyWeak(&v13);
  }
}

void __56__PGProcessAssertion_acquireWithTarget_domainAttribute___block_invoke_32(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = PGLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      int v9 = 136315394;
      uint64_t v10 = "-[PGProcessAssertion acquireWithTarget:domainAttribute:]_block_invoke";
      __int16 v11 = 2114;
      id v12 = WeakRetained;
      id v8 = "%s Failed to acquire %{public}@";
LABEL_6:
      _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0x16u);
    }
  }
  else if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v9 = 136315394;
    uint64_t v10 = "-[PGProcessAssertion acquireWithTarget:domainAttribute:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = WeakRetained;
    id v8 = "%s %{public}@ invalidated";
    goto LABEL_6;
  }
}

- (BOOL)_isInvalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_setInvalidated:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  if (![(PGProcessAssertion *)self _isInvalidated])
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PGProcessAssertion.m", 111, @"Released %@ without invalidating first.", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)PGProcessAssertion;
  [(PGProcessAssertion *)&v5 dealloc];
}

- (void)invalidate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(PGProcessAssertion *)self _setInvalidated:1];
  id v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(RBSAssertion *)self->_assertion isValid];
    int v5 = 136315650;
    BOOL v6 = "-[PGProcessAssertion invalidate]";
    __int16 v7 = 2114;
    id v8 = self;
    __int16 v9 = 1024;
    int v10 = v4;
    _os_log_impl(&dword_1B5645000, v3, OS_LOG_TYPE_DEFAULT, "%s Invalidating %{public}@. was valid: %{BOOL}u", (uint8_t *)&v5, 0x1Cu);
  }

  [(RBSAssertion *)self->_assertion invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assertion, 0);

  objc_storeStrong((id *)&self->_explanation, 0);
}

@end