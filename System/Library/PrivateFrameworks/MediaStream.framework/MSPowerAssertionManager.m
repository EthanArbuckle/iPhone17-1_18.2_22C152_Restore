@interface MSPowerAssertionManager
+ (id)sharedManager;
- (BOOL)isAssertingPowerAssertion;
- (BOOL)isBusy;
- (int)UIBusyCount;
- (int)busyCount;
- (unsigned)assertionID;
- (void)_assertPowerAssertion;
- (void)_deassertPowerAssertion;
- (void)_recomputePowerAssertion;
- (void)releaseBusy;
- (void)releaseUIBusy;
- (void)retainBusy;
- (void)retainUIBusy;
- (void)setAssertionID:(unsigned int)a3;
- (void)setBusyCount:(int)a3;
- (void)setIsAssertingPowerAssertion:(BOOL)a3;
- (void)setIsBusy:(BOOL)a3;
- (void)setUIBusyCount:(int)a3;
- (void)toggleAssertion;
@end

@implementation MSPowerAssertionManager

- (void)setIsBusy:(BOOL)a3
{
  self->_isBusy = a3;
}

- (void)setAssertionID:(unsigned int)a3
{
  self->_assertionID = a3;
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (void)setIsAssertingPowerAssertion:(BOOL)a3
{
  self->_isAssertingPowerAssertion = a3;
}

- (BOOL)isAssertingPowerAssertion
{
  return self->_isAssertingPowerAssertion;
}

- (int)UIBusyCount
{
  return self->_UIBusyCount;
}

- (int)busyCount
{
  return self->_busyCount;
}

- (void)toggleAssertion
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if ([(MSPowerAssertionManager *)self isAssertingPowerAssertion])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v3 = 138543362;
      v4 = self;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Toggling process power assertion off then on.", (uint8_t *)&v3, 0xCu);
    }
    [(MSPowerAssertionManager *)self _deassertPowerAssertion];
    [(MSPowerAssertionManager *)self _assertPowerAssertion];
  }
}

- (BOOL)isBusy
{
  return [(MSPowerAssertionManager *)self busyCount] > 0;
}

- (void)setUIBusyCount:(int)a3
{
  self->_UIBusyCount = self->_busyCount;
  [(MSPowerAssertionManager *)self _recomputePowerAssertion];
}

- (void)setBusyCount:(int)a3
{
  self->_busyCount = a3;
  [(MSPowerAssertionManager *)self _recomputePowerAssertion];
}

- (void)_recomputePowerAssertion
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if ([(MSPowerAssertionManager *)self busyCount] < 1
    || [(MSPowerAssertionManager *)self UIBusyCount])
  {
    if ([(MSPowerAssertionManager *)self isAssertingPowerAssertion])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v3 = 138543362;
        v4 = self;
        _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Releasing process power assertion.", (uint8_t *)&v3, 0xCu);
      }
      [(MSPowerAssertionManager *)self setIsAssertingPowerAssertion:0];
      [(MSPowerAssertionManager *)self _deassertPowerAssertion];
    }
  }
  else if (![(MSPowerAssertionManager *)self isAssertingPowerAssertion])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v3 = 138543362;
      v4 = self;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Retaining process power assertion.", (uint8_t *)&v3, 0xCu);
    }
    [(MSPowerAssertionManager *)self setIsAssertingPowerAssertion:1];
    [(MSPowerAssertionManager *)self _assertPowerAssertion];
  }
}

- (void)_deassertPowerAssertion
{
}

- (void)_assertPowerAssertion
{
}

- (void)releaseUIBusy
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  --self->_UIBusyCount;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v3 = 138543874;
    v4 = self;
    __int16 v5 = 1024;
    int v6 = [(MSPowerAssertionManager *)self busyCount];
    __int16 v7 = 1024;
    int v8 = [(MSPowerAssertionManager *)self UIBusyCount];
    _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Releasing process UI busy. New busy: %d, UI busy: %d", (uint8_t *)&v3, 0x18u);
  }
  [(MSPowerAssertionManager *)self _recomputePowerAssertion];
}

- (void)retainUIBusy
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  ++self->_UIBusyCount;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v3 = 138543874;
    v4 = self;
    __int16 v5 = 1024;
    int v6 = [(MSPowerAssertionManager *)self busyCount];
    __int16 v7 = 1024;
    int v8 = [(MSPowerAssertionManager *)self UIBusyCount];
    _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Retaining process UI busy. New busy: %d, UI busy: %d", (uint8_t *)&v3, 0x18u);
  }
  [(MSPowerAssertionManager *)self _recomputePowerAssertion];
}

- (void)releaseBusy
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  --self->_busyCount;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v3 = 138543874;
    v4 = self;
    __int16 v5 = 1024;
    int v6 = [(MSPowerAssertionManager *)self busyCount];
    __int16 v7 = 1024;
    int v8 = [(MSPowerAssertionManager *)self UIBusyCount];
    _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Releasing process busy. New busy: %d, UI busy: %d", (uint8_t *)&v3, 0x18u);
  }
  [(MSPowerAssertionManager *)self _recomputePowerAssertion];
}

- (void)retainBusy
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  ++self->_busyCount;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v3 = 138543874;
    v4 = self;
    __int16 v5 = 1024;
    int v6 = [(MSPowerAssertionManager *)self busyCount];
    __int16 v7 = 1024;
    int v8 = [(MSPowerAssertionManager *)self UIBusyCount];
    _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Retaining process busy. New busy: %d, UI busy: %d", (uint8_t *)&v3, 0x18u);
  }
  [(MSPowerAssertionManager *)self _recomputePowerAssertion];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager_mgr;

  return v2;
}

uint64_t __40__MSPowerAssertionManager_sharedManager__block_invoke()
{
  sharedManager_mgr = objc_alloc_init(MSPowerAssertionManager);

  return MEMORY[0x1F41817F8]();
}

@end