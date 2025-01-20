@interface SXFullscreenCaptionDarkModePolicyException
- (int64_t)shouldApplyAutoDarkModeForComponentClassification:(id)a3;
- (int64_t)shouldApplyDarkModeToTextStyleBackgroundColorsForComponent:(id)a3 DOM:(id)a4;
- (int64_t)shouldApplyDarkModeToTextStyleForegroundColorsForComponent:(id)a3 DOM:(id)a4;
@end

@implementation SXFullscreenCaptionDarkModePolicyException

- (int64_t)shouldApplyDarkModeToTextStyleBackgroundColorsForComponent:(id)a3 DOM:(id)a4
{
  v5 = [a3 classification];
  int64_t v6 = [(SXFullscreenCaptionDarkModePolicyException *)self shouldApplyAutoDarkModeForComponentClassification:v5];

  return v6;
}

- (int64_t)shouldApplyDarkModeToTextStyleForegroundColorsForComponent:(id)a3 DOM:(id)a4
{
  v5 = [a3 classification];
  int64_t v6 = [(SXFullscreenCaptionDarkModePolicyException *)self shouldApplyAutoDarkModeForComponentClassification:v5];

  return v6;
}

- (int64_t)shouldApplyAutoDarkModeForComponentClassification:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    int64_t v4 = 0;
  }
  else
  {
    objc_opt_class();
    int64_t v4 = (objc_opt_isKindOfClass() & 1) - 1;
  }

  return v4;
}

@end