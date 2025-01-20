@interface _UIDeallocInvalidatable
- (NSString)description;
- (_UIDeallocInvalidatable)init;
- (id)initWithIdentifier:(char)a3 faultForDeallocInvalidation:(void *)a4 invalidationBlock:;
- (void)_invalidate;
- (void)appendDescriptionToStream:(id)a3;
- (void)dealloc;
@end

@implementation _UIDeallocInvalidatable

- (id)initWithIdentifier:(char)a3 faultForDeallocInvalidation:(void *)a4 invalidationBlock:
{
  id v7 = a2;
  id v8 = a4;
  v9 = v8;
  if (!a1) {
    goto LABEL_6;
  }
  if (v7)
  {
    if (v8) {
      goto LABEL_4;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:sel_initWithIdentifier_faultForDeallocInvalidation_invalidationBlock_, a1, @"_UIDeallocInvalidatable.m", 37, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v9) {
      goto LABEL_4;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:sel_initWithIdentifier_faultForDeallocInvalidation_invalidationBlock_, a1, @"_UIDeallocInvalidatable.m", 38, @"Invalid parameter not satisfying: %@", @"invalidationBlock" object file lineNumber description];

LABEL_4:
  v19.receiver = a1;
  v19.super_class = (Class)_UIDeallocInvalidatable;
  a1 = objc_msgSendSuper2(&v19, sel_init);
  if (a1)
  {
    uint64_t v10 = [v7 copy];
    v11 = (void *)*((void *)a1 + 4);
    *((void *)a1 + 4) = v10;

    *((unsigned char *)a1 + 8) = a3;
    uint64_t v12 = objc_opt_new();
    v13 = (void *)*((void *)a1 + 2);
    *((void *)a1 + 2) = v12;

    uint64_t v14 = [v9 copy];
    v15 = (void *)*((void *)a1 + 3);
    *((void *)a1 + 3) = v14;
  }
LABEL_6:

  return a1;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_faultForDeallocInvalidation
    && ([(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled] & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v4 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v7 = self;
        _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "_UIInvalidatable deallocated without being invalidated: %@", buf, 0xCu);
      }
    }
    else
    {
      v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dealloc___s_category_9) + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v7 = self;
        _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "_UIInvalidatable deallocated without being invalidated: %@", buf, 0xCu);
      }
    }
  }
  [(_UIDeallocInvalidatable *)self _invalidate];
  v5.receiver = self;
  v5.super_class = (Class)_UIDeallocInvalidatable;
  [(_UIDeallocInvalidatable *)&v5 dealloc];
}

- (void)_invalidate
{
  if (pthread_main_np() != 1)
  {
    objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"_UIDeallocInvalidatable.m" lineNumber:56 description:@"Call must be made on main thread"];
  }
  if ([(BSAtomicSignal *)self->_invalidationSignal signal])
  {
    (*((void (**)(void))self->_invalidationBlock + 2))();
    id invalidationBlock = self->_invalidationBlock;
    self->_id invalidationBlock = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_invalidationSignal, 0);
}

- (_UIDeallocInvalidatable)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIDeallocInvalidatable.m", 29, @"%s: init is not allowed on %@", "-[_UIDeallocInvalidatable init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53___UIDeallocInvalidatable_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E52D9F98;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

@end