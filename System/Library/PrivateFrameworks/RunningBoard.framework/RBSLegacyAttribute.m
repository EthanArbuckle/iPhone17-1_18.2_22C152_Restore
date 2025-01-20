@interface RBSLegacyAttribute
- (BOOL)_isLegacyReasonFinishableTask:(BOOL)result;
- (double)_invalidationDurationExpiringTaskCompletionsQuickly:(void *)a1;
- (uint64_t)_definesRelativeStartTime;
- (uint64_t)_explicitJetsamBand:(void *)a1;
- (uint64_t)_invalidateOnThermalLevel;
- (uint64_t)_isOriginatorValidForContext:(__CFString *)a3 errorReason:;
- (uint64_t)_isTargetValidForContext:(__CFString *)a3 errorReason:;
- (uint64_t)_maxCPUDuration;
- (uint64_t)_role;
- (uint64_t)_startPolicy;
- (uint64_t)_terminationResistance;
- (void)_mutateReasonWithContext:(void *)a1;
@end

@implementation RBSLegacyAttribute

- (uint64_t)_isTargetValidForContext:(__CFString *)a3 errorReason:
{
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    if ([v5 targetIsSystem])
    {
      a1 = 0;
      v7 = @"Attribute may not target the system";
LABEL_4:
      *a3 = v7;
      goto LABEL_20;
    }
    uint64_t v8 = [(id)a1 reason];
    if (v8 > 12)
    {
      if (v8 == 10006)
      {
        if (([v6 ignoreRestrictions] & 1) == 0)
        {
          v16 = [v6 targetProperties];
          char v17 = [v16 supportsBackgroundContentFetching];

          if ((v17 & 1) == 0)
          {
            a1 = 0;
            v7 = @"Target doesn't support background content fetching";
            goto LABEL_4;
          }
        }
      }
      else if (v8 == 13)
      {
        v11 = [v6 targetIdentity];
        char v12 = [v11 isXPCService];

        if ((v12 & 1) == 0)
        {
          a1 = 0;
          v7 = @"Target is not an xpc service";
          goto LABEL_4;
        }
      }
    }
    else if (v8 == 9)
    {
      v13 = [v6 targetProcess];
      v14 = [v6 entitlementManager];
      v15 = [v14 entitlementsForProcess:v13];

      if (([v15 hasEntitlement:@"com.apple.UIKit.vends-view-services"] & 1) == 0)
      {
        *a3 = @"Target lacks view service entitlement";

        a1 = 0;
        goto LABEL_20;
      }
    }
    else if (v8 == 12 && ([v6 ignoreRestrictions] & 1) == 0)
    {
      v9 = [v6 targetProperties];
      char v10 = [v9 usesSocketMonitoring];

      if ((v10 & 1) == 0)
      {
        a1 = 0;
        v7 = @"Target doesn't support socket monitoring";
        goto LABEL_4;
      }
    }
    *a3 = 0;
    a1 = 1;
  }
LABEL_20:

  return a1;
}

- (uint64_t)_startPolicy
{
  if (result)
  {
    unint64_t v1 = [(id)result reason];
    result = 1;
    if (v1 <= 0x17)
    {
      if (((1 << v1) & 0xBC33AE) != 0) {
        return result;
      }
      if (((1 << v1) & 0x10011) != 0) {
        return 102;
      }
      if (v1 == 10) {
        return 103;
      }
    }
    char v2 = v1 - 16;
    if (v1 - 10000 > 8)
    {
LABEL_11:
      unint64_t v3 = v1 - 50000;
      if (v3 > 4 || ((1 << v3) & 0x19) == 0) {
        return 101;
      }
      return 102;
    }
    if (((1 << v2) & 0x135) == 0)
    {
      if (((1 << v2) & 0xC0) != 0) {
        return 103;
      }
      goto LABEL_11;
    }
  }
  return result;
}

- (void)_mutateReasonWithContext:(void *)a1
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 reason];
    if (v4 == 4)
    {
      id v5 = [v3 initialProcessState];
      uint64_t v6 = [v5 legacyFinishTaskReason];
      if (v6 > 49999)
      {
        if (v6 == 50004) {
          uint64_t v7 = 50004;
        }
        else {
          uint64_t v7 = 4;
        }
        if (v6 == 50003) {
          uint64_t v8 = 50003;
        }
        else {
          uint64_t v8 = v7;
        }
        if (v6 == 50000) {
          uint64_t v4 = 50000;
        }
        else {
          uint64_t v4 = v8;
        }
      }
      else
      {
        switch(v6)
        {
          case 16:
            uint64_t v4 = 50004;
            break;
          case 10006:
            uint64_t v4 = 50000;
            break;
          case 10007:
            uint64_t v4 = 50003;
            break;
        }
      }
    }
    if (v4 != [a1 reason])
    {
      v9 = rbs_assertion_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [a1 reason];
        v11 = [v3 assertion];
        int v12 = 134349570;
        uint64_t v13 = v10;
        __int16 v14 = 2050;
        uint64_t v15 = v4;
        __int16 v16 = 2114;
        char v17 = v11;
        _os_log_impl(&dword_226AB3000, v9, OS_LOG_TYPE_DEFAULT, "Mutating assertion reason from %{public}lu to %{public}lu for assertion %{public}@", (uint8_t *)&v12, 0x20u);
      }
      [a1 setReason:v4];
    }
  }
}

- (double)_invalidationDurationExpiringTaskCompletionsQuickly:(void *)a1
{
  double result = 0.0;
  if (!a1) {
    return result;
  }
  uint64_t v4 = objc_msgSend(a1, "reason", 0.0);
  double result = 1.0;
  if (v4 <= 9999)
  {
    switch(v4)
    {
      case 1:
      case 2:
      case 3:
      case 5:
      case 7:
      case 8:
      case 9:
      case 12:
      case 13:
      case 18:
      case 19:
      case 20:
      case 21:
      case 23:
        return 0.0;
      case 4:
        double result = 30.0;
        if (a2) {
          double result = 10.0;
        }
        break;
      case 10:
        double result = 10.0;
        break;
      case 16:
        double result = 15.0;
        break;
      default:
        return result;
    }
    return result;
  }
  if (v4 > 49999)
  {
    if (v4 != 50000)
    {
      double v6 = 40.0;
      if (v4 == 50004) {
        double result = 25.0;
      }
      BOOL v7 = v4 == 50003;
      goto LABEL_18;
    }
    if (_backgroundContentFetchingProcessAssertionDuration_onceToken != -1) {
      dispatch_once(&_backgroundContentFetchingProcessAssertionDuration_onceToken, &__block_literal_global_84);
    }
    double v8 = *(double *)&_backgroundContentFetchingProcessAssertionDuration___backgroundContentFetchingProcessAssertionDuration;
    double v9 = 10.0;
    if ((a2 & 1) == 0)
    {
      if (_backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion_onceToken != -1)
      {
        uint64_t v10 = _backgroundContentFetchingProcessAssertionDuration___backgroundContentFetchingProcessAssertionDuration;
        dispatch_once(&_backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion_onceToken, &__block_literal_global_89);
        double v8 = *(double *)&v10;
      }
      double v9 = *(double *)&_backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion___backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion;
    }
    return v8 + v9;
  }
  else
  {
    uint64_t v5 = v4 - 10000;
    if ((unint64_t)(v4 - 10000) > 8) {
      return result;
    }
    if (((1 << v5) & 0x135) != 0) {
      return 0.0;
    }
    if (v4 != 10006)
    {
      BOOL v7 = v5 == 7;
      double v6 = 30.0;
LABEL_18:
      if (v7) {
        return v6;
      }
      return result;
    }
    if (_backgroundContentFetchingProcessAssertionDuration_onceToken != -1) {
      dispatch_once(&_backgroundContentFetchingProcessAssertionDuration_onceToken, &__block_literal_global_84);
    }
    return *(double *)&_backgroundContentFetchingProcessAssertionDuration___backgroundContentFetchingProcessAssertionDuration;
  }
}

- (uint64_t)_invalidateOnThermalLevel
{
  if (result)
  {
    uint64_t v1 = [(id)result reason];
    double result = 820;
    switch(v1)
    {
      case 1:
      case 2:
      case 3:
      case 12:
      case 16:
      case 19:
      case 23:
LABEL_5:
        double result = 840;
        break;
      case 4:
LABEL_10:
        double result = 860;
        break;
      case 5:
      case 9:
      case 13:
LABEL_6:
        double result = 850;
        break;
      case 6:
      case 10:
      case 11:
      case 14:
      case 15:
      case 17:
      case 22:
        return result;
      case 7:
      case 8:
      case 18:
      case 20:
      case 21:
LABEL_3:
        double result = 830;
        break;
      default:
        switch(v1)
        {
          case 10000:
          case 10007:
            goto LABEL_5;
          case 10001:
          case 10002:
          case 10003:
          case 10006:
            return result;
          case 10004:
            goto LABEL_10;
          case 10005:
            goto LABEL_3;
          case 10008:
            goto LABEL_6;
          default:
            unint64_t v2 = v1 - 50000;
            if (v2 <= 4 && ((1 << v2) & 0x19) != 0) {
              goto LABEL_10;
            }
            break;
        }
        break;
    }
  }
  return result;
}

- (uint64_t)_definesRelativeStartTime
{
  if (result)
  {
    unint64_t v1 = [(id)result reason];
    double result = 1;
    if (v1 > 0x17 || ((1 << v1) & 0xBC33AE) == 0)
    {
      unint64_t v2 = v1 - 10000;
      if (v2 > 8 || ((1 << v2) & 0x135) == 0) {
        return 0;
      }
    }
  }
  return result;
}

- (uint64_t)_isOriginatorValidForContext:(__CFString *)a3 errorReason:
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (!a1) {
    goto LABEL_40;
  }
  if (!a3)
  {
    v34 = [MEMORY[0x263F08690] currentHandler];
    [v34 handleFailureInMethod:sel__isOriginatorValidForContext_errorReason_ object:a1 file:@"RBSLegacyAttribute+RBProcessState.m" lineNumber:383 description:@"outReason is required"];
  }
  unint64_t v6 = [a1 requestedReason];
  if (v6 > 0x17) {
    goto LABEL_25;
  }
  if (((1 << v6) & 0xBD15AE) != 0)
  {
LABEL_27:
    v25 = [v5 originatorEntitlements];
    BOOL v7 = v25;
    goto LABEL_28;
  }
  if (((1 << v6) & 0x2200) != 0)
  {
    BOOL v7 = [v5 originatorProcess];
    double v8 = [v5 targetProcess];

    if (v7 != v8)
    {
      if ([a1 reason] == 9 && objc_msgSend(v7, "isLifecycleManaged"))
      {
        double v9 = [v5 originatorState];
        uint64_t v10 = [v9 inheritances];
        v11 = [v10 allNamespaces];
        int v12 = [v11 containsObject:*MEMORY[0x263F646F0]];

        uint64_t v13 = [v5 originatorEntitlements];
        int v14 = [v13 hasEntitlement:@"com.apple.assertiond.background-view-services"];

        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v15 = objc_msgSend(v9, "legacyAssertions", 0);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v36;
          while (2)
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v36 != v18) {
                objc_enumerationMutation(v15);
              }
              if ([*(id *)(*((void *)&v35 + 1) + 8 * v19) isLegacyAssertionReason:9])
              {

                goto LABEL_46;
              }
              ++v19;
            }
            while (v17 != v19);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        if (((v12 | v14) & 1) == 0)
        {
          *a3 = @"Originator for view service request is not in a valid state";

LABEL_39:
LABEL_40:
          uint64_t v26 = 0;
          goto LABEL_41;
        }
LABEL_46:
      }
      goto LABEL_29;
    }
    v29 = @"Originator and target must be different processes";
LABEL_38:
    *a3 = v29;
    goto LABEL_39;
  }
  if (v6 != 4)
  {
LABEL_25:
    char v24 = v6 - 16;
    if (v6 - 10000 <= 8)
    {
      if (((1 << v24) & 0x194) != 0) {
        goto LABEL_27;
      }
      if (((1 << v24) & 0x21) != 0)
      {
        BOOL v7 = [v5 originatorEntitlements];
        if ([v7 hasEntitlement:@"com.apple.backboard.client"]) {
          goto LABEL_29;
        }
        v25 = v7;
LABEL_28:
        if ([v25 hasEntitlementDomain:32])
        {
LABEL_29:

          goto LABEL_30;
        }
LABEL_37:
        v29 = @"Client is missing required entitlement";
        goto LABEL_38;
      }
      if (v6 == 10006)
      {
        BOOL v7 = [v5 originatorEntitlements];
        if ([v7 hasEntitlementDomain:32]) {
          goto LABEL_29;
        }
        v27 = [v5 originatorProcess];
        char v28 = [v27 isPlatformBinary];

        if (v28) {
          goto LABEL_29;
        }
        goto LABEL_37;
      }
    }
    uint64_t v26 = 0;
    *a3 = @"Invalid assertion reason provided";
    goto LABEL_41;
  }
  BOOL v7 = [v5 originatorProcess];
  uint64_t v20 = [v5 targetProcess];
  if (v7 == (void *)v20)
  {

    goto LABEL_29;
  }
  v21 = (void *)v20;
  v22 = [v5 originatorEntitlements];
  if ([v7 isPlatformBinary] & 1) != 0 || (objc_msgSend(v22, "hasEntitlementDomain:", 63))
  {
    int v23 = 4;
  }
  else
  {
    v31 = [v5 entitlementManager];
    v32 = [v31 entitlementsForProcess:v21];

    if (([v21 isPlatformBinary] & 1) != 0
      || [v32 hasEntitlementDomain:63])
    {
      v33 = rbs_assertion_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v40 = v7;
        __int16 v41 = 2114;
        v42 = v21;
        _os_log_impl(&dword_226AB3000, v33, OS_LOG_TYPE_DEFAULT, "allowing legacy background task: untrusted process %{public}@ is targeting trusted process %{public}@", buf, 0x16u);
      }

      int v23 = 4;
    }
    else
    {
      *a3 = @"Originator and target must be the same process";
      int v23 = 1;
    }
  }
  if (v23 != 4) {
    goto LABEL_40;
  }
LABEL_30:
  *a3 = 0;
  uint64_t v26 = 1;
LABEL_41:

  return v26;
}

- (uint64_t)_role
{
  if (a1)
  {
    if ([a1 requestedReason] == 9)
    {
      return 5;
    }
    else if (([a1 flags] & 2) != 0)
    {
      return 4;
    }
    else if ([a1 flags])
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return 0;
  }
}

- (uint64_t)_terminationResistance
{
  if (result)
  {
    unint64_t v1 = [(id)result reason];
    unint64_t v2 = v1;
    if (v1 <= 0x17 && ((1 << v1) & 0xA9132E) != 0) {
      return 40;
    }
    double result = 20;
    unint64_t v3 = v2 - 10000;
    if (v3 <= 8 && ((1 << v3) & 0x181) != 0) {
      return 40;
    }
  }
  return result;
}

- (uint64_t)_maxCPUDuration
{
  if (result)
  {
    uint64_t v1 = [(id)result reason];
    switch(v1)
    {
      case 19:
      case 21:
      case 22:
        goto LABEL_6;
      case 20:
      case 23:
        double result = 15;
        break;
      default:
        if (v1 == 4) {
          double result = 180;
        }
        else {
LABEL_6:
        }
          double result = 60;
        break;
    }
  }
  return result;
}

- (BOOL)_isLegacyReasonFinishableTask:(BOOL)result
{
  if (result)
  {
    double result = 1;
    if ((unint64_t)(a2 - 50000) > 4 || ((1 << (a2 - 80)) & 0x19) == 0) {
      return (unint64_t)(a2 - 10006) < 2 || a2 == 16;
    }
  }
  return result;
}

- (uint64_t)_explicitJetsamBand:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    char v4 = [a1 flags];
    uint64_t v5 = [a1 reason];
    if (v5 == 3 && (v4 & 8) != 0)
    {
      uint64_t v6 = 120;
    }
    else if ((v4 & 8) != 0)
    {
      if (v5 != 9) {
        goto LABEL_21;
      }
      uint64_t v9 = [v3 targetProcess];
      if (!v9) {
        goto LABEL_21;
      }
      uint64_t v10 = (void *)v9;
      v11 = [v3 assertion];
      int v12 = [v11 explanation];
      int v13 = [v12 isEqualToString:@"com.apple.viewservice.session"];

      if (v13)
      {
        int v14 = [v3 entitlementManager];
        uint64_t v15 = [v3 targetProcess];
        uint64_t v16 = [v14 entitlementsForProcess:v15];

        if ([v16 hasEntitlement:@"com.apple.UIKit.vends-view-services"]) {
          uint64_t v6 = 80;
        }
        else {
          uint64_t v6 = 0;
        }
      }
      else
      {
LABEL_21:
        uint64_t v6 = 100;
      }
    }
    else
    {
      BOOL v7 = v5 == 10006 || v5 == 50000;
      uint64_t v8 = 20;
      if (!v7) {
        uint64_t v8 = 0;
      }
      if (v4) {
        uint64_t v6 = 40;
      }
      else {
        uint64_t v6 = v8;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __93__RBSLegacyAttribute_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"BKExpireTaskCompletionsQuickly", @"com.apple.assertiond", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 1;
  }
  else {
    BOOL v1 = 0;
  }
  char v2 = v1;
  applyToAssertionIntransientState_attributePath_context__expireTaskCompletionsQuickly = v2;
  return result;
}

@end