@interface UIObservationTrackingEnabled
@end

@implementation UIObservationTrackingEnabled

void ___UIObservationTrackingEnabled_block_invoke()
{
  id v1 = +[_UIApplicationInfoParser mainBundleInfoParser];
  if ([v1 observationTrackingEnabled]) {
    char v0 = 1;
  }
  else {
    char v0 = (byte_1EB2576CC != 0) & ~_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ObservationTrackingEnabled, @"ObservationTrackingEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  }
  _MergedGlobals_1149 = v0;
}

@end