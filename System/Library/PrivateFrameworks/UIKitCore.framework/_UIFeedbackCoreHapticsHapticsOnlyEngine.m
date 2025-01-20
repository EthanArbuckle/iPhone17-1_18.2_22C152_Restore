@interface _UIFeedbackCoreHapticsHapticsOnlyEngine
+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3;
+ (id)sharedEngine;
- (id)_internal_createCoreHapticsEngine;
@end

@implementation _UIFeedbackCoreHapticsHapticsOnlyEngine

+ (id)sharedEngine
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___UIFeedbackCoreHapticsHapticsOnlyEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25CC90 != -1) {
    dispatch_once(&qword_1EB25CC90, block);
  }
  v2 = (void *)qword_1EB25CC98;
  return v2;
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  id v4 = a3;
  int v5 = [a1 _supportsPlayingIndividualFeedback:v4 allowsIgnoreCapture:0];
  BOOL v6 = 0;
  if (v5) {
    BOOL v6 = [v4 _effectiveFeedbackTypes] == 2;
  }

  return v6;
}

- (id)_internal_createCoreHapticsEngine
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFeedbackCoreHapticsHapticsOnlyEngine;
  v3 = [(_UIFeedbackCoreHapticsEngine *)&v6 _internal_createCoreHapticsEngine];
  if (!v3)
  {
    id v4 = [(_UIFeedbackCoreHapticsEngine *)self coreHapticsEngine];
    [v4 setPlaysHapticsOnly:1];
  }
  return v3;
}

@end