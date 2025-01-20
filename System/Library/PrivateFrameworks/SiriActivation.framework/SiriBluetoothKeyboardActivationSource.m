@interface SiriBluetoothKeyboardActivationSource
- (void)_setConnection:(id)a3;
- (void)activateFromSource:(int64_t)a3;
@end

@implementation SiriBluetoothKeyboardActivationSource

- (void)activateFromSource:(int64_t)a3
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock(&self->super.super._lock);
  v6 = [(BSServiceConnection *)self->super.super._connection remoteTarget];
  v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [v6 activationRequestFromBluetoothKeyboardActivation:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)_setConnection:(id)a3
{
}

@end