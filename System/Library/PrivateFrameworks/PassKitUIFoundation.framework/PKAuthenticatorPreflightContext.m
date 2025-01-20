@interface PKAuthenticatorPreflightContext
- (BOOL)isInvalidated;
- (BOOL)useLocationBasedAuthorization;
- (PKAuthenticatorPreflightContext)init;
- (id)context;
- (id)initForLocationBasedAuthorization:(BOOL)a3;
- (void)_clearIfPossibleUnsafe;
- (void)dealloc;
- (void)decrementValidReferenceCount;
- (void)incrementValidReferenceCount;
- (void)invalidate;
@end

@implementation PKAuthenticatorPreflightContext

- (PKAuthenticatorPreflightContext)init
{
  return (PKAuthenticatorPreflightContext *)[(PKAuthenticatorPreflightContext *)self initForLocationBasedAuthorization:0];
}

- (id)initForLocationBasedAuthorization:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAuthenticatorPreflightContext;
  v4 = [(PKAuthenticatorPreflightContext *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (LAContext *)objc_alloc_init(MEMORY[0x263F10468]);
    context = v5->_context;
    v5->_context = v6;

    if (v3) {
      [(LAContext *)v5->_context setOptionDTO:MEMORY[0x263EFFA88]];
    }
    v5->_validReferenceCount = 0;
    v5->_useLocationBasedAuthorization = v3;
  }
  return v5;
}

- (void)dealloc
{
  [(LAContext *)self->_context invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKAuthenticatorPreflightContext;
  [(PKAuthenticatorPreflightContext *)&v3 dealloc];
}

- (id)context
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_context;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)incrementValidReferenceCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    __break(1u);
  }
  else
  {
    ++self->_validReferenceCount;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)decrementValidReferenceCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t validReferenceCount = self->_validReferenceCount;
  if (validReferenceCount)
  {
    self->_int64_t validReferenceCount = validReferenceCount - 1;
    [(PKAuthenticatorPreflightContext *)self _clearIfPossibleUnsafe];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    __break(1u);
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  [(PKAuthenticatorPreflightContext *)self _clearIfPossibleUnsafe];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInvalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_clearIfPossibleUnsafe
{
  if (self->_invalidated && !self->_validReferenceCount)
  {
    [(LAContext *)self->_context invalidate];
    context = self->_context;
    self->_context = 0;
  }
}

- (BOOL)useLocationBasedAuthorization
{
  return self->_useLocationBasedAuthorization;
}

- (void).cxx_destruct
{
}

@end