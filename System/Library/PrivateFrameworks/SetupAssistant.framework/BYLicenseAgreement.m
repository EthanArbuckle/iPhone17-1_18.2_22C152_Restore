@interface BYLicenseAgreement
+ (BOOL)needsToAcceptNewAgreement;
+ (unint64_t)versionOfAcceptedAgreement;
+ (unint64_t)versionOfOnDiskAgreement;
+ (void)_clearAcceptedLicenseVersion;
+ (void)recordUserAcceptedAgreementVersion:(unint64_t)a3;
@end

@implementation BYLicenseAgreement

+ (void)_clearAcceptedLicenseVersion
{
  CFPreferencesSetAppValue(@"acceptedSLAVersion", 0, @"com.apple.purplebuddy.notbackedup");
  CFPreferencesAppSynchronize(@"com.apple.purplebuddy.notbackedup");
}

+ (unint64_t)versionOfOnDiskAgreement
{
  if (versionOfOnDiskAgreement_onceToken != -1) {
    dispatch_once(&versionOfOnDiskAgreement_onceToken, &__block_literal_global_23);
  }
  return versionOfOnDiskAgreement_version;
}

void __46__BYLicenseAgreement_versionOfOnDiskAgreement__block_invoke()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void (*)(void))getSFLicenseVersionNumberSymbolLoc_ptr;
  v8 = getSFLicenseVersionNumberSymbolLoc_ptr;
  if (!getSFLicenseVersionNumberSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getSFLicenseVersionNumberSymbolLoc_block_invoke;
    v4[3] = &unk_1E5D2B9E8;
    v4[4] = &v5;
    __getSFLicenseVersionNumberSymbolLoc_block_invoke((uint64_t)v4);
    v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)+[BYSiriUtilities deviceSupportsSystemAssistantExperience]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  v1 = v0();
  if ([v1 hasPrefix:@"EA"])
  {
    uint64_t v2 = [v1 substringFromIndex:2];

    v1 = (void *)v2;
  }
  versionOfOnDiskAgreement_version = [v1 integerValue];
}

+ (unint64_t)versionOfAcceptedAgreement
{
  Boolean keyExistsAndHasValidFormat = 0;
  unint64_t result = CFPreferencesGetAppIntegerValue(@"acceptedSLAVersion", @"com.apple.purplebuddy.notbackedup", &keyExistsAndHasValidFormat);
  if ((uint64_t)result <= 0 || keyExistsAndHasValidFormat == 0) {
    return 0;
  }
  return result;
}

+ (BOOL)needsToAcceptNewAgreement
{
  uint64_t v3 = [a1 versionOfAcceptedAgreement];
  return v3 != [a1 versionOfOnDiskAgreement];
}

+ (void)recordUserAcceptedAgreementVersion:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 versionOfAcceptedAgreement];
  uint64_t v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218240;
    unint64_t v7 = a3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "SLA: Accepted software license version %llu! Previous version was %llu.", (uint8_t *)&v6, 0x16u);
  }

  CFPreferencesSetAppValue(@"acceptedSLAVersion", (CFPropertyListRef)[NSNumber numberWithUnsignedInteger:a3], @"com.apple.purplebuddy.notbackedup");
  CFPreferencesAppSynchronize(@"com.apple.purplebuddy.notbackedup");
}

@end