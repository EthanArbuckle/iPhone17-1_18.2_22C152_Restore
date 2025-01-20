@interface UIObservationTrackingFeedbackLoopThreshold
@end

@implementation UIObservationTrackingFeedbackLoopThreshold

void ___UIObservationTrackingFeedbackLoopThreshold_block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  qword_1EB261CB8 = [v0 integerForKey:@"UIObservationTrackingFeedbackLoopThreshold"];

  if (qword_1EB261CB8)
  {
    if ((qword_1EB261CB8 & 0x8000000000000000) == 0) {
      return;
    }
LABEL_7:
    qword_1EB261CB8 = 0;
    return;
  }
  int v1 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_ObservationTrackingFeedbackLoopThreshold, @"ObservationTrackingFeedbackLoopThreshold", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
  uint64_t v2 = qword_1E8FD5330;
  if (v1) {
    uint64_t v2 = 40;
  }
  qword_1EB261CB8 = v2;
  if (v2 < 0) {
    goto LABEL_7;
  }
}

@end