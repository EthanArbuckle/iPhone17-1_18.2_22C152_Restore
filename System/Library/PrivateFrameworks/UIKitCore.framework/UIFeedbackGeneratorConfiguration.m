@interface UIFeedbackGeneratorConfiguration
@end

@implementation UIFeedbackGeneratorConfiguration

uint64_t __66___UIFeedbackGeneratorConfiguration__updateFeedbackForOutputMode___block_invoke(void *a1, uint64_t a2)
{
  v4 = *(void **)(*(void *)(a1[4] + 8) + 40);
  if (a2 == 1)
  {
    uint64_t result = [v4 audioOutputMode];
    if (result) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  uint64_t result = [v4 hapticOutputMode];
  if (!result) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v6 = a1[6];
  if (v6) {
    uint64_t v7 = v6 | result;
  }
  else {
    uint64_t v7 = 0;
  }
LABEL_8:
  if (v7 != result)
  {
    if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
    {
      uint64_t v8 = [*(id *)(*(void *)(a1[4] + 8) + 40) copy];
      uint64_t v9 = *(void *)(a1[4] + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    }
    v11 = *(void **)(*(void *)(a1[4] + 8) + 40);
    if (a2 == 1)
    {
      return [v11 setAudioOutputMode:v7];
    }
    else
    {
      return [v11 setHapticOutputMode:v7];
    }
  }
  return result;
}

@end