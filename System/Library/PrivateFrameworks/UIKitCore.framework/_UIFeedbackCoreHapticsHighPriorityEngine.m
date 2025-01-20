@interface _UIFeedbackCoreHapticsHighPriorityEngine
+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3;
+ (id)_additionalEngineOptions;
+ (id)sharedEngine;
- (id)_internal_createCoreHapticsEngine;
@end

@implementation _UIFeedbackCoreHapticsHighPriorityEngine

+ (id)sharedEngine
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56___UIFeedbackCoreHapticsHighPriorityEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25CCC0 != -1) {
    dispatch_once(&qword_1EB25CCC0, block);
  }
  v2 = (void *)qword_1EB25CCC8;
  return v2;
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  id v3 = a3;
  v4 = +[UIDevice currentDevice];
  if ([v4 _feedbackSupportLevel] < 2)
  {

LABEL_10:
    char v13 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = [v3 _effectiveFeedbackTypes];

  if (v5 != 2) {
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_10;
  }
  v6 = [v3 pattern];
  if (!v6) {
    goto LABEL_10;
  }
  v7 = v6;
  v8 = [v6 configurationDictionary];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v9 = (void *)getCHHapticPatternKeyPrioritySymbolLoc_ptr;
  uint64_t v20 = getCHHapticPatternKeyPrioritySymbolLoc_ptr;
  if (!getCHHapticPatternKeyPrioritySymbolLoc_ptr)
  {
    v10 = CoreHapticsLibrary_1();
    v18[3] = (uint64_t)dlsym(v10, "CHHapticPatternKeyPriority");
    getCHHapticPatternKeyPrioritySymbolLoc_ptr = v18[3];
    v9 = (void *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (v9)
  {
    v11 = [v8 valueForKey:*v9];
    v12 = getCHHapticPriorityHigh();
    char v13 = [v11 isEqualToString:v12];

LABEL_11:
    return v13;
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  v16 = [NSString stringWithUTF8String:"CHHapticPatternKey getCHHapticPatternKeyPriority(void)"];
  objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"_UIFeedbackCoreHapticsEngineUtilities.h", 98, @"%s", dlerror());

  __break(1u);
  return result;
}

- (id)_internal_createCoreHapticsEngine
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFeedbackCoreHapticsHighPriorityEngine;
  id v3 = [(_UIFeedbackCoreHapticsEngine *)&v7 _internal_createCoreHapticsEngine];
  if (!v3)
  {
    v4 = [(_UIFeedbackCoreHapticsEngine *)self coreHapticsEngine];
    [v4 setMuteHapticsWhileRecordingAudio:0];

    uint64_t v5 = [(_UIFeedbackCoreHapticsEngine *)self coreHapticsEngine];
    [v5 setPlaysHapticsOnly:1];
  }
  return v3;
}

+ (id)_additionalEngineOptions
{
  v32[3] = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v2 = (id *)qword_1EB25CD50;
  uint64_t v29 = qword_1EB25CD50;
  if (!qword_1EB25CD50)
  {
    id v3 = CoreHapticsLibrary_1();
    v27[3] = (uint64_t)dlsym(v3, "CHHapticEngineOptionKeyHapticPowerUsage");
    qword_1EB25CD50 = v27[3];
    v2 = (id *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v2)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"CHHapticEngineOptionKey getCHHapticEngineOptionKeyHapticPowerUsage(void)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"_UIFeedbackCoreHapticsEngineUtilities.h", 35, @"%s", dlerror());

    goto LABEL_20;
  }
  id v4 = *v2;
  v30[0] = v4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v5 = (id *)qword_1EB25CD58;
  uint64_t v29 = qword_1EB25CD58;
  if (!qword_1EB25CD58)
  {
    v6 = CoreHapticsLibrary_1();
    v27[3] = (uint64_t)dlsym(v6, "CHHapticPowerUsageLow");
    qword_1EB25CD58 = v27[3];
    uint64_t v5 = (id *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v5)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = [NSString stringWithUTF8String:"CHHapticPowerUsage getCHHapticPowerUsageLow(void)"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"_UIFeedbackCoreHapticsEngineUtilities.h", 36, @"%s", dlerror());

    goto LABEL_20;
  }
  id v7 = *v5;
  v32[0] = v7;
  v8 = getCHHapticEngineOptionKeyLocality();
  v30[1] = v8;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v9 = (id *)qword_1EB25CD60;
  uint64_t v29 = qword_1EB25CD60;
  if (!qword_1EB25CD60)
  {
    v10 = CoreHapticsLibrary_1();
    v27[3] = (uint64_t)dlsym(v10, "CHHapticLocalityDefaultWithFullStrength");
    qword_1EB25CD60 = v27[3];
    v9 = (id *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v9)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = [NSString stringWithUTF8String:"CHHapticLocality getCHHapticLocalityDefaultWithFullStrength(void)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"_UIFeedbackCoreHapticsEngineUtilities.h", 30, @"%s", dlerror());

    goto LABEL_20;
  }
  id v11 = *v9;
  v32[1] = v11;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v12 = (id *)qword_1EB25CD68;
  uint64_t v29 = qword_1EB25CD68;
  if (!qword_1EB25CD68)
  {
    char v13 = CoreHapticsLibrary_1();
    v27[3] = (uint64_t)dlsym(v13, "CHHapticEngineOptionKeyPriority");
    qword_1EB25CD68 = v27[3];
    v12 = (id *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v12)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    v25 = [NSString stringWithUTF8String:"CHHapticEngineOptionKey getCHHapticEngineOptionKeyPriority(void)"];
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"_UIFeedbackCoreHapticsEngineUtilities.h", 33, @"%s", dlerror());

LABEL_20:
    __break(1u);
  }
  id v31 = *v12;
  id v14 = v31;
  v15 = getCHHapticPriorityHigh();
  v32[2] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v30 count:3];

  return v16;
}

@end