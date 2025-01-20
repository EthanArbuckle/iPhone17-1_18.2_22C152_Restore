@interface TLAlertActivationAssertion
- (TLAlertActivationAssertion)initWithAlert:(id)a3;
- (id)description;
- (void)_acquire;
- (void)_relinquish;
- (void)acquire;
- (void)dealloc;
- (void)relinquish;
@end

@implementation TLAlertActivationAssertion

- (TLAlertActivationAssertion)initWithAlert:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLAlertActivationAssertion;
  v6 = [(TLAlertActivationAssertion *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_alert, a3);
    atomic_store(0, (unint64_t *)&v7->_activeAcquisitionCount);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v3 = atomic_load((unint64_t *)&self->_activeAcquisitionCount);
  if (v3 >= 1) {
    [(TLAlertActivationAssertion *)self _relinquish];
  }
  v4.receiver = self;
  v4.super_class = (Class)TLAlertActivationAssertion;
  [(TLAlertActivationAssertion *)&v4 dealloc];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  objc_super v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@"; alert = %@", self->_alert];
  uint64_t v7 = atomic_load((unint64_t *)&self->_activeAcquisitionCount);
  if (v7 >= 1) {
    [v6 appendString:@"; isAquired = YES"];
  }
  [v6 appendString:@">"];

  return v6;
}

- (void)acquire
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = TLLogPlayback();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_impl(&dword_1DB936000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: -acquire.", (uint8_t *)&v4, 0xCu);
  }

  if (!atomic_fetch_add(&self->_activeAcquisitionCount, 1uLL)) {
    [(TLAlertActivationAssertion *)self _acquire];
  }
}

- (void)relinquish
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = TLLogPlayback();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_impl(&dword_1DB936000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: -relinquish.", (uint8_t *)&v4, 0xCu);
  }

  if (atomic_fetch_add(&self->_activeAcquisitionCount, 0xFFFFFFFFFFFFFFFFLL) == 1) {
    [(TLAlertActivationAssertion *)self _relinquish];
  }
}

- (void)_acquire
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = TLLogPlayback();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = self;
    _os_log_impl(&dword_1DB936000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: was acquired.", (uint8_t *)&v5, 0xCu);
  }

  int v4 = +[TLAlertController sharedAlertController];
  [v4 handleActivationAssertionStatusChangeForAlert:self->_alert updatedStatus:1];
}

- (void)_relinquish
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = TLLogPlayback();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = self;
    _os_log_impl(&dword_1DB936000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: was relinquished.", (uint8_t *)&v5, 0xCu);
  }

  int v4 = +[TLAlertController sharedAlertController];
  [v4 handleActivationAssertionStatusChangeForAlert:self->_alert updatedStatus:0];
}

- (void).cxx_destruct
{
}

@end