@interface TSClockManagerInterface
- (TSClockManager)clockManager;
- (TSClockManagerInterface)init;
- (void)addToClockManager;
- (void)interruptedConnectionForClockManager:(id)a3;
- (void)removeFromClockManager;
- (void)setClockManager:(id)a3;
- (void)setInterruptionCallback:(void *)a3 andRefcon:(void *)a4;
@end

@implementation TSClockManagerInterface

- (TSClockManagerInterface)init
{
  if (init_onceToken_0 != -1) {
    dispatch_once(&init_onceToken_0, &__block_literal_global_6);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSClockManagerInterface;
  v3 = [(TSClockManagerInterface *)&v5 init];
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_clockManagerInterfacesLock);
    [(id)_clockManagerInterfaces addObject:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)&_clockManagerInterfacesLock);
  }
  return v3;
}

void __31__TSClockManagerInterface_init__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA48] array];
  v1 = (void *)_clockManagerInterfaces;
  _clockManagerInterfaces = v0;

  _clockManagerInterfacesLock = 0;
}

- (void)addToClockManager
{
  id v3 = [(TSClockManagerInterface *)self clockManager];
  [v3 addClient:self];
}

- (void)removeFromClockManager
{
  id v3 = [(TSClockManagerInterface *)self clockManager];
  [v3 removeClient:self];
}

- (void)setInterruptionCallback:(void *)a3 andRefcon:(void *)a4
{
  self->_interruptionCallback = a3;
  self->_interruptionRefcon = a4;
}

- (void)interruptedConnectionForClockManager:(id)a3
{
  interruptionCallback = (void (*)(void *, SEL, id))self->_interruptionCallback;
  if (interruptionCallback) {
    interruptionCallback(self->_interruptionRefcon, a2, a3);
  }
  [(TSClockManagerInterface *)self removeFromClockManager];
  os_unfair_lock_lock((os_unfair_lock_t)&_clockManagerInterfacesLock);
  [(id)_clockManagerInterfaces removeObject:self];
  os_unfair_lock_unlock((os_unfair_lock_t)&_clockManagerInterfacesLock);
}

- (TSClockManager)clockManager
{
  return self->_clockManager;
}

- (void)setClockManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end