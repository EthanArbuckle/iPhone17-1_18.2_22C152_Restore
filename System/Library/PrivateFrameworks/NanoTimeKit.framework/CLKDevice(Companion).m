@interface CLKDevice(Companion)
+ (void)setBridgeActiveNRDevice:()Companion;
- (uint64_t)canCustomize;
- (uint64_t)isEcgPhoneComplicationEnabled;
- (uint64_t)isRadioPhoneComplicationEnabled;
@end

@implementation CLKDevice(Companion)

+ (void)setBridgeActiveNRDevice:()Companion
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 currentDevice];
  v6 = [v5 nrDevice];
  uint64_t v7 = *MEMORY[0x1E4F79E10];
  uint64_t v8 = [v6 valueForProperty:*MEMORY[0x1E4F79E10]];

  uint64_t v9 = [v4 valueForProperty:v7];
  v10 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412546;
    uint64_t v24 = v8;
    __int16 v25 = 2112;
    uint64_t v26 = v9;
    _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "+[CLKDevice setActiveDevice:] - current %@ new %@", (uint8_t *)&v23, 0x16u);
  }

  if (v8 | v9 || ([v5 isBridgeActive] & 1) != 0)
  {
    if ([v5 isBridgeActive])
    {
      uint64_t v11 = [v5 nrDevice];
      v12 = (void *)v11;
      if (!v4 || v11)
      {
        uint64_t v13 = [v5 nrDevice];
        v14 = (void *)v13;
        if (!v4 && v13 || v4 && ([(id)v9 isEqual:v8] & 1) == 0)
        {
        }
        else
        {
          int HasCapabilityForString = BPSDeviceHasCapabilityForString();
          v16 = [v5 nrDevice];
          int v17 = BPSDeviceHasCapabilityForString();

          if (HasCapabilityForString == v17) {
            goto LABEL_21;
          }
        }
      }
    }
    v19 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      uint64_t v24 = (uint64_t)v4;
      _os_log_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_DEFAULT, "updating to new device %@", (uint8_t *)&v23, 0xCu);
    }

    v20 = [a1 deviceForNRDevice:v4 forced:1];
    [v20 setIsBridgeActive:1];
    [a1 setCurrentDevice:v20];
    v21 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    [v21 setDevice:v20];

    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 postNotificationName:*MEMORY[0x1E4F19620] object:0];
  }
  else
  {
    v18 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_DEFAULT, "no device is currently paired", (uint8_t *)&v23, 2u);
    }

    [v5 setIsBridgeActive:1];
  }
LABEL_21:
}

- (uint64_t)canCustomize
{
  v1 = [a1 nrDevice];
  uint64_t HasCapabilityForString = BPSDeviceHasCapabilityForString();

  return HasCapabilityForString;
}

- (uint64_t)isRadioPhoneComplicationEnabled
{
  id v4 = [a1 nrDevice];

  if (!v4) {
    return 1;
  }
  v5 = objc_getAssociatedObject(a1, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 BOOLValue];
  }
  else
  {
    uint64_t v7 = [a1 nrDevice];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"FC61CF95-E168-468C-ABD5-9311FF689760"];
    uint64_t v6 = [v7 supportsCapability:v8];

    uint64_t v9 = [NSNumber numberWithBool:v6];
    objc_setAssociatedObject(a1, a2, v9, (void *)0x303);
  }
  return v6;
}

- (uint64_t)isEcgPhoneComplicationEnabled
{
  id v4 = [a1 nrDevice];

  if (!v4) {
    return 0;
  }
  v5 = objc_getAssociatedObject(a1, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 BOOLValue];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F2B0F8];
    uint64_t v8 = [a1 nrDevice];
    uint64_t v6 = [v7 isElectrocardiogramSupportedOnWatch:v8];

    uint64_t v9 = [NSNumber numberWithBool:v6];
    objc_setAssociatedObject(a1, a2, v9, (void *)0x303);
  }
  return v6;
}

@end