@interface _UIFeedbackCoreHapticsIgnoreCaptureEngine
+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3;
+ (id)sharedEngine;
- (id)_internal_createCoreHapticsEngine;
@end

@implementation _UIFeedbackCoreHapticsIgnoreCaptureEngine

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  return [a1 _supportsPlayingIndividualFeedback:a3 allowsIgnoreCapture:1];
}

+ (id)sharedEngine
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___UIFeedbackCoreHapticsIgnoreCaptureEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25CCA0 != -1) {
    dispatch_once(&qword_1EB25CCA0, block);
  }
  v2 = (void *)qword_1EB25CCA8;
  return v2;
}

- (id)_internal_createCoreHapticsEngine
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFeedbackCoreHapticsIgnoreCaptureEngine;
  v3 = [(_UIFeedbackCoreHapticsEngine *)&v6 _internal_createCoreHapticsEngine];
  if (!v3)
  {
    v4 = [(_UIFeedbackCoreHapticsEngine *)self coreHapticsEngine];
    [v4 setMuteHapticsWhileRecordingAudio:0];
  }
  return v3;
}

@end