@interface PKStoreKitReviewPromptHelper
- (BOOL)_hasBeenPromptedRecently;
- (BOOL)_hasViewedFrontOfCard;
- (BOOL)isEligibleForReviewPrompt;
- (void)requestReviewInScene:(id)a3 trigger:(unint64_t)a4;
- (void)requestReviewInSceneIfEligible:(id)a3 trigger:(unint64_t)a4;
@end

@implementation PKStoreKitReviewPromptHelper

- (void)requestReviewInScene:(id)a3 trigger:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    unint64_t v9 = a4;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Requesting Store Kit review for reason: %lu", (uint8_t *)&v8, 0xCu);
  }

  v7 = [MEMORY[0x1E4F1C9C8] now];
  PKSetLastReviewPromptDate();

  [MEMORY[0x1E4F3C318] requestReviewInScene:v5];
}

- (void)requestReviewInSceneIfEligible:(id)a3 trigger:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    unint64_t v9 = a4;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Requesting Store Kit review if eligible for reason: %lu", (uint8_t *)&v8, 0xCu);
  }

  if ([(PKStoreKitReviewPromptHelper *)self isEligibleForReviewPrompt]) {
    [(PKStoreKitReviewPromptHelper *)self requestReviewInScene:v6 trigger:a4];
  }
}

- (BOOL)isEligibleForReviewPrompt
{
  BOOL v3 = [(PKStoreKitReviewPromptHelper *)self _hasViewedFrontOfCard];
  return v3 & ![(PKStoreKitReviewPromptHelper *)self _hasBeenPromptedRecently];
}

- (BOOL)_hasViewedFrontOfCard
{
  v2 = PKLastViewedFrontOfCardDate();
  BOOL v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    BOOL v5 = v4 >= -2592000.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_hasBeenPromptedRecently
{
  v2 = PKLastReviewPromptDate();
  BOOL v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    BOOL v5 = v4 >= -604800.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end