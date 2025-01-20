@interface BYCapabilities
- (BOOL)_paymentScreenRequirementsIncludePasscode:(id)a3;
- (BOOL)_paymentScreenRequirementsIncludeiCloud:(id)a3;
- (BOOL)canShowAppleIDScreen;
- (BOOL)canShowFaceIDScreen;
- (BOOL)canShowPasscodeScreen;
- (BOOL)canShowPaymentScreen;
- (BOOL)canShowSiriScreen;
- (BOOL)canShowTouchIDScreen;
- (BOOL)eligibleForChlorine;
- (BOOL)hasEligibleEnrolledIdentityForPeriocularFaceIDEnrollment;
- (BOOL)isAppAnalyticsRestricted;
- (BOOL)isCloudAnalyticsRestricted;
- (BOOL)isDeviceAnalyticsRestricted;
- (BOOL)isPearlEnrolled;
- (BOOL)isScreenTimeRestricted;
- (BOOL)isSiriRestricted;
- (BOOL)isTouchIDEnrolled;
- (BOOL)mgHasCellularData;
- (BOOL)mgHasCellularTelephony;
- (BOOL)mgHasGreenTea;
- (BOOL)mgHasMesa;
- (BOOL)mgHasSecureElement;
- (BOOL)mgHasSiriCapability;
- (BOOL)mgIsHactivated;
- (BOOL)mgSupportsSingleDisplayEnhancedMultitasking;
- (BOOL)supportsAppleWatch;
- (BOOL)supportsKappaDetection;
- (BOOL)supportsPearl;
- (BOOL)supportsPeriocularFaceID;
- (BOOL)supportsTouchID;
- (id)_paymentScreenRequirements;
- (void)eligibilitySetDeviceLocale:(id)a3;
- (void)eligibleForChlorine;
@end

@implementation BYCapabilities

- (BOOL)supportsTouchID
{
  return MGGetBoolAnswer();
}

- (BOOL)isTouchIDEnrolled
{
  if (![(BYCapabilities *)self supportsTouchID]) {
    return 0;
  }
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v2 = (void *)getBiometricKitClass_softClass;
  uint64_t v12 = getBiometricKitClass_softClass;
  if (!getBiometricKitClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getBiometricKitClass_block_invoke;
    v8[3] = &unk_1E5D2B9E8;
    v8[4] = &v9;
    __getBiometricKitClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  v4 = [v3 manager];
  v5 = [v4 identities:0];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (BOOL)supportsPearl
{
  return MGGetBoolAnswer();
}

- (BOOL)isPearlEnrolled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (![(BYCapabilities *)self supportsPearl]) {
    return 0;
  }
  id BKDeviceClass = getBKDeviceClass();
  id v3 = [getBKDeviceDescriptorClass() deviceDescriptorForType:2];
  id v11 = 0;
  v4 = [BKDeviceClass deviceWithDescriptor:v3 error:&v11];
  id v5 = v11;

  if (!v4 || v5)
  {
    v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "BYCapabilities: Failed to fetch BKDevice: %@", buf, 0xCu);
    }

    BOOL v7 = 0;
    BOOL v6 = v4;
  }
  else
  {
    uint64_t v10 = 0;
    BOOL v6 = [v4 identitiesForUser:getuid() error:&v10];
    BOOL v7 = [v6 count] != 0;
    id v5 = v4;
  }

  return v7;
}

- (BOOL)supportsAppleWatch
{
  return MGGetBoolAnswer();
}

- (BOOL)supportsKappaDetection
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getSOSUtilitiesClass_softClass;
  uint64_t v9 = getSOSUtilitiesClass_softClass;
  if (!getSOSUtilitiesClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getSOSUtilitiesClass_block_invoke;
    v5[3] = &unk_1E5D2B9E8;
    v5[4] = &v6;
    __getSOSUtilitiesClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return [v3 isKappaDetectionSupportedOnPhone];
}

- (BOOL)canShowSiriScreen
{
  if (+[BYManagedAppleIDBootstrap isMultiUser])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    BOOL v3 = [(BYCapabilities *)self mgHasSiriCapability];
    if (v3) {
      LOBYTE(v3) = ![(BYCapabilities *)self isSiriRestricted];
    }
  }
  return v3;
}

- (BOOL)canShowPaymentScreen
{
  BOOL v3 = [(BYCapabilities *)self _paymentScreenRequirements];
  BOOL v4 = (![(BYCapabilities *)self _paymentScreenRequirementsIncludePasscode:v3]|| [(BYCapabilities *)self canShowPasscodeScreen])&& (![(BYCapabilities *)self _paymentScreenRequirementsIncludeiCloud:v3]|| [(BYCapabilities *)self canShowAppleIDScreen])&& [(BYCapabilities *)self mgHasSecureElement];

  return v4;
}

- (id)_paymentScreenRequirements
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v2 = (void *)getPKSetupAssistantContextClass_softClass;
  uint64_t v18 = getPKSetupAssistantContextClass_softClass;
  if (!getPKSetupAssistantContextClass_softClass)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __getPKSetupAssistantContextClass_block_invoke;
    id v13 = &unk_1E5D2B9E8;
    uint64_t v14 = &v15;
    __getPKSetupAssistantContextClass_block_invoke((uint64_t)&v10);
    v2 = (void *)v16[3];
  }
  BOOL v3 = v2;
  _Block_object_dispose(&v15, 8);
  BOOL v4 = (void *)[[v3 alloc] initWithSetupAssistantAsFollowupAction:1];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v5 = (void *)getPKPaymentSetupAssistantControllerClass_softClass;
  uint64_t v18 = getPKPaymentSetupAssistantControllerClass_softClass;
  if (!getPKPaymentSetupAssistantControllerClass_softClass)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __getPKPaymentSetupAssistantControllerClass_block_invoke;
    id v13 = &unk_1E5D2B9E8;
    uint64_t v14 = &v15;
    __getPKPaymentSetupAssistantControllerClass_block_invoke((uint64_t)&v10);
    id v5 = (void *)v16[3];
  }
  uint64_t v6 = v5;
  _Block_object_dispose(&v15, 8);
  BOOL v7 = (void *)[[v6 alloc] initWithSetupAssistantContext:v4];
  uint64_t v10 = 0;
  [v7 setupAssistantNeedsToRunReturningRequirements:&v10];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v10];

  return v8;
}

- (BOOL)_paymentScreenRequirementsIncludePasscode:(id)a3
{
  return ((unint64_t)[a3 unsignedIntegerValue] >> 1) & 1;
}

- (BOOL)_paymentScreenRequirementsIncludeiCloud:(id)a3
{
  return [a3 unsignedIntegerValue] & 1;
}

- (BOOL)canShowTouchIDScreen
{
  BOOL v3 = [MEMORY[0x1E4F74230] sharedConnection];
  if ([v3 effectiveBoolValueForSetting:*MEMORY[0x1E4F74020]] == 2)
  {

    return 0;
  }
  BOOL v4 = +[BYManagedAppleIDBootstrap isMultiUser];

  if (v4) {
    return 0;
  }
  return [(BYCapabilities *)self mgHasMesa];
}

- (BOOL)canShowFaceIDScreen
{
  BOOL v3 = [MEMORY[0x1E4F74230] sharedConnection];
  if ([v3 effectiveBoolValueForSetting:*MEMORY[0x1E4F74020]] == 2)
  {

    return 0;
  }
  BOOL v4 = +[BYManagedAppleIDBootstrap isMultiUser];

  if (v4) {
    return 0;
  }
  return [(BYCapabilities *)self supportsPearl];
}

- (BOOL)canShowPasscodeScreen
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  if ([v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F74100]] == 2)
  {
    LOBYTE(v3) = 0;
LABEL_6:

    return v3;
  }
  BOOL v4 = +[BYManagedAppleIDBootstrap isMultiUser];

  if (!v4)
  {
    v2 = [MEMORY[0x1E4F74230] sharedConnection];
    int v3 = [v2 isPasscodeSet] ^ 1;
    goto LABEL_6;
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)canShowAppleIDScreen
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73ED0]] != 2;

  return v3;
}

- (BOOL)isSiriRestricted
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F18]] == 2;

  return v3;
}

- (BOOL)isDeviceAnalyticsRestricted
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x1E4F73FB8]];

  BOOL v4 = [MEMORY[0x1E4F74230] sharedConnection];
  int v5 = [v4 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FC0]];

  if (v5 == 2) {
    return 1;
  }
  else {
    return v3;
  }
}

- (BOOL)isAppAnalyticsRestricted
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x1E4F73EE8]];

  return v3;
}

- (BOOL)isCloudAnalyticsRestricted
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73ED0]] == 2;

  return v3;
}

- (BOOL)isScreenTimeRestricted
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FD0]] == 2;

  return v3;
}

- (BOOL)mgHasSiriCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)mgHasSecureElement
{
  return MGGetBoolAnswer();
}

- (BOOL)mgHasMesa
{
  return MGGetBoolAnswer();
}

- (BOOL)mgHasCellularData
{
  return MGGetBoolAnswer();
}

- (BOOL)mgHasCellularTelephony
{
  return MGGetBoolAnswer();
}

- (BOOL)mgHasGreenTea
{
  return MGGetBoolAnswer();
}

- (BOOL)mgSupportsSingleDisplayEnhancedMultitasking
{
  return MGGetBoolAnswer();
}

- (BOOL)mgIsHactivated
{
  return MGGetBoolAnswer();
}

- (BOOL)eligibleForChlorine
{
  int domain_answer = os_eligibility_get_domain_answer();
  BOOL v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(BYCapabilities *)domain_answer eligibleForChlorine];
  }

  return 0;
}

- (void)eligibilitySetDeviceLocale:(id)a3
{
  if (a3)
  {
    xpc_object_t v3 = xpc_string_create((const char *)[a3 UTF8String]);
    int v4 = os_eligibility_set_input();
    if (v4)
    {
      int v5 = v4;
      uint64_t v6 = _BYLoggingFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[BYCapabilities eligibilitySetDeviceLocale:](v5, v6);
      }
    }
  }
}

- (BOOL)hasEligibleEnrolledIdentityForPeriocularFaceIDEnrollment
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id BKDeviceClass = getBKDeviceClass();
  xpc_object_t v3 = [getBKDeviceDescriptorClass() deviceDescriptorForType:2];
  id v13 = 0;
  int v4 = [BKDeviceClass deviceWithDescriptor:v3 error:&v13];
  int v5 = v13;

  if (!v4 || v5)
  {
    uint64_t v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v5;
      _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "Failed to fetch BKDevice: %@", buf, 0xCu);
    }
    BOOL v10 = 0;
  }
  else
  {
    id v12 = 0;
    uint64_t v6 = [v4 identitiesForUser:getuid() error:&v12];
    int v5 = v12;
    BOOL v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Periocular check identities: %@", buf, 0xCu);
    }

    uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_3];
    uint64_t v9 = [v6 filteredArrayUsingPredicate:v8];
    BOOL v10 = [v9 count] != 0;
  }
  return v10;
}

uint64_t __74__BYCapabilities_hasEligibleEnrolledIdentityForPeriocularFaceIDEnrollment__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPeriocularEnrollment] ^ 1;
}

- (BOOL)supportsPeriocularFaceID
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id BKDeviceClass = getBKDeviceClass();
  xpc_object_t v3 = [getBKDeviceDescriptorClass() deviceDescriptorForType:2];
  id v12 = 0;
  int v4 = [BKDeviceClass deviceWithDescriptor:v3 error:&v12];
  int v5 = v12;

  if (!v4 || v5)
  {
    uint64_t v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v5;
      _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "Failed to fetch BKDevice: %@", buf, 0xCu);
    }
    char v9 = 0;
  }
  else
  {
    id v11 = 0;
    uint64_t v6 = [v4 supportsPeriocularEnrollmentWithError:&v11];
    int v5 = v11;
    if (v5)
    {
      BOOL v7 = _BYLoggingFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v5;
        _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Failed to fetch device support for Periocular error:%@", buf, 0xCu);
      }
    }
    uint64_t v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "periocularSupported: %@", buf, 0xCu);
    }

    char v9 = [v6 BOOLValue];
  }

  return v9;
}

- (void)eligibleForChlorine
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Failed to get eligibility for chlorine with error %d", (uint8_t *)v2, 8u);
}

- (void)eligibilitySetDeviceLocale:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Failed to set eligibility device locale with error %d", (uint8_t *)v2, 8u);
}

@end