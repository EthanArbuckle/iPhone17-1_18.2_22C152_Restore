@interface NSXPCConnection
- (BOOL)_sr_hasEntitlement:(id)a3 sensor:(id)a4 valueProvider:(id)a5;
- (BOOL)sr_hasHoldingPeriodBypassEntitlement:(id)a3;
@end

@implementation NSXPCConnection

- (BOOL)_sr_hasEntitlement:(id)a3 sensor:(id)a4 valueProvider:(id)a5
{
  if (!a3) {
    return 0;
  }
  if ([a3 isEqualToString:@"com.apple.sensorkit.reader.allow"]
    && [a5 valueForEntitlement:@"com.apple.private.sensorkit.reader.wildcard.allow" connection:self]|| objc_msgSend(a3, "isEqualToString:", @"com.apple.sensorkit.pruner.allow")&& objc_msgSend(a5, "valueForEntitlement:connection:", @"com.apple.private.sensorkit.pruner.power", self))
  {
    return 1;
  }
  CFStringRef v10 = @"com.apple.private.sensorkit.debugging.allow";
  if (![a3 isEqualToString:@"com.apple.private.sensorkit.debugging.allow"])
  {
    CFStringRef v10 = @"com.apple.private.sensorkit.export.allow-all";
    if (![a3 isEqualToString:@"com.apple.private.sensorkit.export.allow-all"])
    {
      CFStringRef v10 = @"com.apple.private.sensorkit.auth.request.arbitrary_bundle";
      if (![a3 isEqualToString:@"com.apple.private.sensorkit.auth.request.arbitrary_bundle"])
      {
        if (!a4) {
          return 1;
        }
        id v12 = [a5 valueForEntitlement:a3 connection:self];
        id v13 = +[SRSensorDescription sensorDescriptionForSensor:a4];
        if (!v13)
        {
          if (qword_10006EC20 == -1)
          {
            v14 = qword_10006EC28;
            if (!os_log_type_enabled((os_log_t)qword_10006EC28, OS_LOG_TYPE_ERROR)) {
              goto LABEL_18;
            }
          }
          else
          {
            dispatch_once(&qword_10006EC20, &stru_10005D420);
            v14 = qword_10006EC28;
            if (!os_log_type_enabled((os_log_t)qword_10006EC28, OS_LOG_TYPE_ERROR)) {
              goto LABEL_18;
            }
          }
          int v17 = 138543362;
          id v18 = a4;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to find sensor description for %{public}@", (uint8_t *)&v17, 0xCu);
        }
LABEL_18:
        id v15 = [v13 publicEntitlementValue];
        id v16 = [v13 legacyName];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return 0;
        }
        if (([v12 containsObject:a4] & 1) == 0
          && ([v12 containsObject:v16] & 1) == 0)
        {
          return [v12 containsObject:v15];
        }
        return 1;
      }
    }
  }
  id v11 = [a5 valueForEntitlement:v10 connection:self];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [v11 BOOLValue];
}

- (BOOL)sr_hasHoldingPeriodBypassEntitlement:(id)a3
{
  id v3 = [a3 valueForEntitlement:@"com.apple.private.sensorkit.reader.holdingperiod.bypass" connection:self];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [v3 BOOLValue];
}

@end