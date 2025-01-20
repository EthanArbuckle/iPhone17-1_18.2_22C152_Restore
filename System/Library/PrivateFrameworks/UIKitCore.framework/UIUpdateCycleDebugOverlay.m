@interface UIUpdateCycleDebugOverlay
@end

@implementation UIUpdateCycleDebugOverlay

void __38___UIUpdateCycleDebugOverlay_instance__block_invoke()
{
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    int v1 = _UIInternalPreference_UpdateCycleDebugOverlay;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_UpdateCycleDebugOverlay)
    {
      while (v0 >= v1)
      {
        _UIInternalPreferenceSync(v0, &_UIInternalPreference_UpdateCycleDebugOverlay, @"UpdateCycleDebugOverlay", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v1 = _UIInternalPreference_UpdateCycleDebugOverlay;
        if (v0 == _UIInternalPreference_UpdateCycleDebugOverlay) {
          return;
        }
      }
      if (byte_1EB256E54)
      {
        uint64_t v2 = objc_opt_new();
        v3 = (void *)qword_1EB25F098;
        qword_1EB25F098 = v2;

        unint64_t v4 = qword_1EB25F098;
        _UIUpdateCompletionObservationAddObserver((float **)&mainCompletionObservation, v4, 0);
      }
    }
  }
}

@end