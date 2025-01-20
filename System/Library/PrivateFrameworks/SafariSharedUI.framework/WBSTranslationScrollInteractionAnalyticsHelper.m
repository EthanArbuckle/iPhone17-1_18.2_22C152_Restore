@interface WBSTranslationScrollInteractionAnalyticsHelper
- (WBSTranslationScrollInteractionAnalyticsHelper)init;
- (id)submissionHandler;
- (void)_calculateFirstInteractionDelayAndMaxPercentageWithCompletion:(id)a3;
- (void)dealloc;
- (void)recordFirstInteractionIfNeeded;
- (void)setSubmissionHandler:(id)a3;
- (void)updateMaxVisibleHeightPercentage:(double)a3;
@end

@implementation WBSTranslationScrollInteractionAnalyticsHelper

- (WBSTranslationScrollInteractionAnalyticsHelper)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSTranslationScrollInteractionAnalyticsHelper;
  v2 = [(WBSTranslationScrollInteractionAnalyticsHelper *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_synchronousIvarLock._os_unfair_lock_opaque = 0;
    id submissionHandler = v2->_submissionHandler;
    v2->_id submissionHandler = &__block_literal_global_55;

    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    translationStartTime = v3->_translationStartTime;
    v3->_translationStartTime = (NSDate *)v5;

    v7 = v3;
  }

  return v3;
}

void __54__WBSTranslationScrollInteractionAnalyticsHelper_init__block_invoke(float a1, uint64_t a2, uint64_t a3)
{
  id v6 = [MEMORY[0x1E4F98290] sharedLogger];
  *(float *)&double v5 = a1;
  [v6 reportFirstInteractionAfterTranslation:a3 maxVisibleHeightPercentage:v5];
}

- (void)recordFirstInteractionIfNeeded
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __80__WBSTranslationScrollInteractionAnalyticsHelper_recordFirstInteractionIfNeeded__block_invoke;
  v2[3] = &unk_1E5E40968;
  v2[4] = self;
  performWithLock(&self->_synchronousIvarLock, v2);
}

double __80__WBSTranslationScrollInteractionAnalyticsHelper_recordFirstInteractionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 32))
  {
    [*(id *)(v1 + 16) timeIntervalSinceNow];
    double result = -v3;
    *(double *)(*(void *)(a1 + 32) + 24) = result;
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  }
  return result;
}

- (void)updateMaxVisibleHeightPercentage:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__WBSTranslationScrollInteractionAnalyticsHelper_updateMaxVisibleHeightPercentage___block_invoke;
  v3[3] = &unk_1E5E420F0;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  performWithLock(&self->_synchronousIvarLock, v3);
}

uint64_t __83__WBSTranslationScrollInteractionAnalyticsHelper_updateMaxVisibleHeightPercentage___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  double v2 = *(double *)(result + 40);
  if (*(unsigned char *)(v1 + 32)) {
    double v2 = fmax(v2, *(double *)(v1 + 40));
  }
  *(double *)(v1 + 40) = v2;
  return result;
}

- (void)_calculateFirstInteractionDelayAndMaxPercentageWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, float))a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __112__WBSTranslationScrollInteractionAnalyticsHelper__calculateFirstInteractionDelayAndMaxPercentageWithCompletion___block_invoke;
  v5[3] = &unk_1E5E45540;
  v5[4] = self;
  v5[5] = &v10;
  v5[6] = &v6;
  performWithLock(&self->_synchronousIvarLock, v5);
  v4[2](v4, v11[3], v7[6]);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

float __112__WBSTranslationScrollInteractionAnalyticsHelper__calculateFirstInteractionDelayAndMaxPercentageWithCompletion___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  if (*(unsigned char *)(v1 + 32)) {
    unint64_t v2 = llround(*(double *)(v1 + 24) * 1000.0);
  }
  else {
    unint64_t v2 = -1;
  }
  *(void *)(*(void *)(a1[5] + 8) + 24) = v2;
  double v3 = *(double *)(a1[4] + 40);
  if (v3 >= 1.0) {
    double v3 = 1.0;
  }
  float result = v3;
  *(float *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  [(WBSTranslationScrollInteractionAnalyticsHelper *)self _calculateFirstInteractionDelayAndMaxPercentageWithCompletion:self->_submissionHandler];
  v3.receiver = self;
  v3.super_class = (Class)WBSTranslationScrollInteractionAnalyticsHelper;
  [(WBSTranslationScrollInteractionAnalyticsHelper *)&v3 dealloc];
}

- (id)submissionHandler
{
  return self->_submissionHandler;
}

- (void)setSubmissionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_submissionHandler, 0);
  objc_storeStrong((id *)&self->_translationStartTime, 0);
}

@end