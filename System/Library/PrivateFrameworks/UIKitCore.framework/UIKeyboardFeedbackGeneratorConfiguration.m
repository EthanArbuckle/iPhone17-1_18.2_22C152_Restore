@interface UIKeyboardFeedbackGeneratorConfiguration
@end

@implementation UIKeyboardFeedbackGeneratorConfiguration

void __65___UIKeyboardFeedbackGeneratorConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v24 = a2;
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:0 systemSoundID:1104];
  [v2 setObject:v3 forKeyedSubscript:&unk_1ED3F3DB0];

  v4 = +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:0 systemSoundID:1104];
  [v2 setObject:v4 forKeyedSubscript:&unk_1ED3F3DC8];

  v5 = +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:0 systemSoundID:1156];
  [v2 setObject:v5 forKeyedSubscript:&unk_1ED3F3DE0];

  v6 = +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:0 systemSoundID:1155];
  [v2 setObject:v6 forKeyedSubscript:&unk_1ED3F3DF8];

  v7 = +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:0 systemSoundID:1155];
  [v2 setObject:v7 forKeyedSubscript:&unk_1ED3F3E10];

  v8 = +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:0 systemSoundID:1155];
  [v2 setObject:v8 forKeyedSubscript:&unk_1ED3F3E28];

  v9 = +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:0 systemSoundID:1156];
  [v2 setObject:v9 forKeyedSubscript:&unk_1ED3F3E40];

  v10 = +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:0 systemSoundID:1156];
  [v2 setObject:v10 forKeyedSubscript:&unk_1ED3F3E58];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v23 = v2;
  obuint64_t j = [v2 allValues];
  uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v16 = [v15 _individualFeedbacks];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v31 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              if ([v21 _effectivePlayableFeedbackTypes] == 1) {
                uint64_t v22 = 0x1ED11B020;
              }
              else {
                uint64_t v22 = 0x1ED11D4C0;
              }
              [v21 _setCategory:v22];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
          }
          while (v18);
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v12);
  }

  [v24 setFeedbacks:v23];
  [v24 setScalingForSpeedEnabled:0];
  [v24 setSlowTypingTime:0.5];
  [v24 setFastTypingTime:0.1];
  [v24 setFastTypingVolumeMultiplier:0.35];
}

@end