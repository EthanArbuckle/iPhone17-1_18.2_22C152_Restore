@interface SLGActivatableLogger
- (BOOL)isActive;
- (BOOL)isEnabled;
- (SLGActivatableLogger)initWithLogger:(id)a3;
- (id)activationHandler;
- (id)deactivationHandler;
- (void)invalidate;
- (void)logBlock:(id)a3 domain:(id)a4;
- (void)logBlock:(id)a3 domain:(id)a4 completion:(id)a5;
- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5;
- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6;
- (void)setActivationHandler:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDeactivationHandler:(id)a3;
@end

@implementation SLGActivatableLogger

- (SLGActivatableLogger)initWithLogger:(id)a3
{
  id v5 = a3;
  if ([v5 isEnabled])
  {
    objc_storeStrong((id *)&self->_logger, a3);
    self->_lock._os_unfair_lock_opaque = 0;
  }
  else
  {

    self = 0;
  }

  return self;
}

- (id)activationHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1D25DFB90](self->_activationHandler);
  os_unfair_lock_unlock(p_lock);
  id v5 = (void *)MEMORY[0x1D25DFB90](v4);

  return v5;
}

- (void)setActivationHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)[v5 copy];

  id activationHandler = self->_activationHandler;
  self->_id activationHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)deactivationHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1D25DFB90](self->_deactivationHandler);
  os_unfair_lock_unlock(p_lock);
  id v5 = (void *)MEMORY[0x1D25DFB90](v4);

  return v5;
}

- (void)setDeactivationHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)[v5 copy];

  deid activationHandler = self->_deactivationHandler;
  self->_deid activationHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isActive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_active;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_active == v3)
  {
    os_unfair_lock_unlock(p_lock);
    os_unfair_lock_lock(p_lock);
LABEL_3:
    v7 = 0;
    goto LABEL_12;
  }
  if (v3)
  {
    self->_active = 1;
    uint64_t v6 = 24;
  }
  else
  {
    uint64_t v6 = 32;
  }
  v7 = (void (**)(void))MEMORY[0x1D25DFB90](*(Class *)((char *)&self->super.isa + v6));
  os_unfair_lock_unlock(p_lock);
  if (!v7)
  {
    os_unfair_lock_lock(p_lock);
    if (v3) {
      goto LABEL_3;
    }
    goto LABEL_11;
  }
  v7[2]();
  os_unfair_lock_lock(p_lock);
  if (!v3) {
LABEL_11:
  }
    self->_active = 0;
LABEL_12:
  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)logBlock:(id)a3 domain:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(SLGActivatableLogger *)self isActive]) {
    [(SLGLogging *)self->_logger logBlock:v7 domain:v6];
  }
}

- (void)logBlock:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(SLGActivatableLogger *)self isActive]) {
    [(SLGLogging *)self->_logger logBlock:v10 domain:v8 completion:v9];
  }
}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(SLGActivatableLogger *)self isActive]) {
    [(SLGLogging *)self->_logger logBlock:v10 domain:v8 tags:v9];
  }
}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(SLGActivatableLogger *)self isActive]) {
    [(SLGLogging *)self->_logger logBlock:v13 domain:v10 tags:v11 completion:v12];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deactivationHandler, 0);
  objc_storeStrong(&self->_activationHandler, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

@end