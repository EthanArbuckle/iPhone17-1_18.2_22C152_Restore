@interface UIFeedbackCoreHapticsPlayer
@end

@implementation UIFeedbackCoreHapticsPlayer

void __76___UIFeedbackCoreHapticsPlayer__internal_createEventsForLegacyFeedbackData___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = [*(id *)(a1 + 40) audioParameters];
  v5 = objc_msgSend(v3, "_internal_createFixedParameterForParameters:withKey:forEventType:", v4, v9, *(void *)(a1 + 48));

  if (v5) {
    [*(id *)(a1 + 56) addObject:v5];
  }
  v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(a1 + 40) hapticParameters];
  v8 = objc_msgSend(v6, "_internal_createFixedParameterForParameters:withKey:forEventType:", v7, v9, *(void *)(a1 + 48));

  if (v8) {
    [*(id *)(a1 + 56) addObject:v8];
  }
}

void __108___UIFeedbackCoreHapticsPlayer__internal_createEventsForFileFeedbackData_engine_parameters_parameterCurves___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)qword_1EB25CCE0;
  qword_1EB25CCE0 = (uint64_t)v0;
}

void __108___UIFeedbackCoreHapticsPlayer__internal_createEventsForFileFeedbackData_engine_parameters_parameterCurves___block_invoke_111(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  v6 = [v4 audioParameters];
  v7 = getCHHapticEventTypeAudioCustom();
  objc_msgSend(v3, "_internal_createFixedParameterForParameters:withKey:forEventType:", v6, v5, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    [*(id *)(a1 + 48) addObject:v9];
    v8 = v9;
  }
}

uint64_t __66___UIFeedbackCoreHapticsPlayer__updateValueForParameters_withKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_updateValueForParameters:withKey:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __53___UIFeedbackCoreHapticsPlayer__playFeedback_atTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_playFeedbackData:forFeedback:atTime:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __46___UIFeedbackCoreHapticsPlayer__stopFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_stopFeedbackData:forFeedback:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

@end