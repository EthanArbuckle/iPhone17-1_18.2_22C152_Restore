@interface CTDisplayPlan(SimSetup)
- (BOOL)isNotEligibleActivationPolicyMismatchPlan;
- (BOOL)isOnDeviceTransferredPlan;
- (BOOL)isOneClickTransferablePlan;
- (BOOL)isWebsheetTransferablePlan;
- (id)remotePlan;
- (uint64_t)isAccountMemberTransferablePlan;
- (uint64_t)isTransferIneligiblePlan;
- (uint64_t)isTransferablePlan;
- (void)transferCapability;
@end

@implementation CTDisplayPlan(SimSetup)

- (id)remotePlan
{
  v2 = [a1 plan];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v4 = [a1 plan];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)isTransferIneligiblePlan
{
  unint64_t v1 = [a1 transferCapability];
  return (v1 < 0xF) & (0x7A22u >> v1);
}

- (BOOL)isOnDeviceTransferredPlan
{
  return [a1 transferCapability] == 7;
}

- (uint64_t)isTransferablePlan
{
  uint64_t v1 = [a1 transferCapability];
  uint64_t result = 1;
  if (v1 != 2 && v1 != 4)
  {
    if (v1 == 8) {
      return +[TSUtilities inBuddy] ^ 1;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (BOOL)isNotEligibleActivationPolicyMismatchPlan
{
  return [a1 transferCapability] == 11;
}

- (BOOL)isOneClickTransferablePlan
{
  return [a1 transferCapability] == 2;
}

- (BOOL)isWebsheetTransferablePlan
{
  return [a1 transferCapability] == 4;
}

- (uint64_t)isAccountMemberTransferablePlan
{
  uint64_t v1 = [a1 remotePlan];
  uint64_t v2 = [v1 primaryAccount];

  if (v2)
  {
    v3 = [v1 primaryAccount];
    uint64_t v2 = [v3 BOOLValue] ^ 1;
  }
  return v2;
}

- (void)transferCapability
{
  uint64_t v1 = [a1 remotePlan];
  uint64_t v2 = v1;
  if (v1)
  {
    v3 = [v1 transferAttributes];

    if (v3)
    {
      v4 = [v2 transferAttributes];
      v3 = (void *)[v4 transferCapability];
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end