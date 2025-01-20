@interface InitObservation
@end

@implementation InitObservation

void ___InitObservation_block_invoke()
{
  v0 = dispatch_queue_create("com.apple.message.MFContentProtectionObserver", 0);
  _observationQueue = (uint64_t)v0;
  dispatch_async(v0, &__block_literal_global_51);
}

uint64_t ___InitObservation_block_invoke_2()
{
  if (MKBDeviceFormattedForContentProtection())
  {
    int out_token = 0;
    notify_register_dispatch((const char *)*MEMORY[0x1E4F78160], &out_token, (dispatch_queue_t)_observationQueue, &__block_literal_global_54);
    _beganObservingTime = CFAbsoluteTimeGetCurrent();
  }
  uint64_t result = _KeyBagLockState();
  _contentProtectionState = result;
  return result;
}

void ___InitObservation_block_invoke_3()
{
  _lastNotificationTime = CFAbsoluteTimeGetCurrent();
  unsigned int v0 = _KeyBagLockState();
  _NotifyObserversWithContentProtectionState(v0);
}

@end