@interface RBSInvalidateUnderConditionAttribute(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
@end

@implementation RBSInvalidateUnderConditionAttribute(RBProcessState)

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v7 = a3;
  id v8 = a5;
  if (_os_feature_enabled_impl())
  {
    if ([v8 isActiveDueToInheritedEndowment])
    {
      v9 = rbs_assertion_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RBSInvalidateUnderConditionAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:](v8, v9);
      }
    }
    else
    {
      v10 = [v7 invalidatesOnConditions];
      if (!v10)
      {
        v10 = [MEMORY[0x263EFF9A0] dictionary];
        [v7 setInvalidatesOnConditions:v10];
      }
      v11 = [a1 condition];
      v12 = [v10 objectForKey:v11];

      if (!v12 || (uint64_t v13 = [a1 minValue], v13 < objc_msgSend(v12, "integerValue")))
      {
        v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "minValue"));
        v15 = [a1 condition];
        [v10 setValue:v14 forKey:v15];
      }
    }
  }
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 ignoreRestrictions])
  {
    uint64_t v7 = 1;
  }
  else
  {
    id v8 = [v6 originatorEntitlements];
    uint64_t v7 = [v8 hasEntitlement:@"com.apple.runningboard.primitiveattribute"];

    if (a4 && (v7 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F64670];
      uint64_t v11 = *MEMORY[0x263F08338];
      v17[0] = @"Required client entitlement is missing";
      uint64_t v12 = *MEMORY[0x263F64668];
      v16[0] = v11;
      v16[1] = v12;
      uint64_t v13 = [a1 description];
      v17[1] = v13;
      v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      *a4 = [v9 errorWithDomain:v10 code:2 userInfo:v14];

      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 assertion];
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Not applying RBSMimicTaskSuspensionAttribute as it is not permitted as the subattribute of a hereditary grant for assertion %{public}@", (uint8_t *)&v4, 0xCu);
}

@end