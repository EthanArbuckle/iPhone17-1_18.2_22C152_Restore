@interface UIObservationTrackingLoggingEnabled
@end

@implementation UIObservationTrackingLoggingEnabled

void ___UIObservationTrackingLoggingEnabled_block_invoke()
{
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ObservationTrackingLoggingEnabled, @"ObservationTrackingLoggingEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1E8FD5324)
  {
    id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    byte_1EB261CA1 = [v0 BOOLForKey:@"UIObservationTrackingLoggingEnabled"];
  }
  else
  {
    byte_1EB261CA1 = 1;
  }
}

@end