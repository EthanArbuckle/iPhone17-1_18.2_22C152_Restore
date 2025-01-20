@interface SBFAlwaysOnLiveRenderingAssertion
- (BOOL)isValid;
- (NSString)description;
- (SBFAlwaysOnLiveRenderingAssertion)initWithReason:(id)a3 invalidationHandler:(id)a4;
- (SBFAlwaysOnLiveRenderingAssertion)initWithReason:(id)a3 timeout:(double)a4 invalidationHandler:(id)a5;
- (id)createdAt;
- (id)reason;
- (void)_startAutoInvalidationTimer;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBFAlwaysOnLiveRenderingAssertion

- (SBFAlwaysOnLiveRenderingAssertion)initWithReason:(id)a3 invalidationHandler:(id)a4
{
  return [(SBFAlwaysOnLiveRenderingAssertion *)self initWithReason:a3 timeout:a4 invalidationHandler:0.0];
}

- (SBFAlwaysOnLiveRenderingAssertion)initWithReason:(id)a3 timeout:(double)a4 invalidationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBFAlwaysOnLiveRenderingAssertion;
  v10 = [(SBFAlwaysOnLiveRenderingAssertion *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    id invalidationHandler = v10->_invalidationHandler;
    v10->_id invalidationHandler = (id)v13;

    uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
    createdAt = v10->_createdAt;
    v10->_createdAt = (NSDate *)v15;

    v10->_timeout = a4;
    v10->_valid = 1;
    if (a4 > 0.0) {
      [(SBFAlwaysOnLiveRenderingAssertion *)v10 _startAutoInvalidationTimer];
    }
  }

  return v10;
}

- (void)dealloc
{
  [(SBFAlwaysOnLiveRenderingAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBFAlwaysOnLiveRenderingAssertion;
  [(SBFAlwaysOnLiveRenderingAssertion *)&v3 dealloc];
}

- (id)reason
{
  return self->_reason;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (id)createdAt
{
  return self->_createdAt;
}

- (void)invalidate
{
  if (self->_valid)
  {
    self->_valid = 0;
    id invalidationHandler = (void (**)(id, SBFAlwaysOnLiveRenderingAssertion *))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, self);
      id v4 = self->_invalidationHandler;
      self->_id invalidationHandler = 0;
    }
  }
}

- (void)_startAutoInvalidationTimer
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__SBFAlwaysOnLiveRenderingAssertion__startAutoInvalidationTimer__block_invoke;
  v4[3] = &unk_1E548E0C0;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __64__SBFAlwaysOnLiveRenderingAssertion__startAutoInvalidationTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained invalidate];
    id WeakRetained = v2;
  }
}

- (NSString)description
{
  dispatch_time_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SBFAlwaysOnLiveRenderingAssertion *)self reason];
  v6 = [(SBFAlwaysOnLiveRenderingAssertion *)self createdAt];
  [v6 timeIntervalSince1970];
  id v8 = [v3 stringWithFormat:@"<%@: %p; reason: %@; createdAt: %f>", v4, self, v5, v7];

  return (NSString *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end