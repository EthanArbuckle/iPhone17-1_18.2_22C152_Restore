@interface HKSPAnalyticsOnboardingInfo
- (HKSPAnalyticsOnboardingInfo)initWithStep:(unint64_t)a3 action:(unint64_t)a4 entryPoint:(unint64_t)a5;
- (id)actionPayloadValue;
- (id)entryPointPayloadValue;
- (id)stepPayloadValue;
- (unint64_t)action;
- (unint64_t)entryPoint;
- (unint64_t)step;
@end

@implementation HKSPAnalyticsOnboardingInfo

- (HKSPAnalyticsOnboardingInfo)initWithStep:(unint64_t)a3 action:(unint64_t)a4 entryPoint:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)HKSPAnalyticsOnboardingInfo;
  v8 = [(HKSPAnalyticsOnboardingInfo *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_step = a3;
    v8->_action = a4;
    v8->_entryPoint = a5;
    v10 = v8;
  }

  return v9;
}

- (id)stepPayloadValue
{
  unint64_t v2 = [(HKSPAnalyticsOnboardingInfo *)self step];
  if (v2 > 6) {
    return &stru_1EFE54160;
  }
  else {
    return off_1E5D33D18[v2];
  }
}

- (id)actionPayloadValue
{
  unint64_t v3 = [(HKSPAnalyticsOnboardingInfo *)self step];
  if (v3 - 3 < 2)
  {
    unint64_t v4 = [(HKSPAnalyticsOnboardingInfo *)self action] - 2;
    if (v4 < 3)
    {
      v5 = off_1E5D33D50;
      return v5[v4];
    }
  }
  else if (v3 == 1 || v3 == 5)
  {
    unint64_t v4 = [(HKSPAnalyticsOnboardingInfo *)self action] - 2;
    if (v4 < 4)
    {
      v5 = off_1E5D33D68;
      return v5[v4];
    }
  }
  return 0;
}

- (id)entryPointPayloadValue
{
  unint64_t v2 = [(HKSPAnalyticsOnboardingInfo *)self entryPoint];
  unint64_t v3 = &stru_1EFE54160;
  if (v2 == 1) {
    unint64_t v3 = @"TrackSleep";
  }
  if (v2) {
    return v3;
  }
  else {
    return @"CompleteFlow";
  }
}

- (unint64_t)step
{
  return self->_step;
}

- (unint64_t)action
{
  return self->_action;
}

- (unint64_t)entryPoint
{
  return self->_entryPoint;
}

@end