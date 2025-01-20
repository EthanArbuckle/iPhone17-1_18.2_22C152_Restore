@interface BSSettings
@end

@implementation BSSettings

void __64__BSSettings_SBUISystemAperture__SBUI_systemApertureDescription__block_invoke(uint64_t a1)
{
  for (uint64_t i = 0; i != 44; ++i)
  {
    v3 = *(void **)(a1 + 32);
    v4 = [*(id *)(a1 + 40) objectForSetting:i + 3213009];
    v5 = SBUISystemApertureSettingKeyValueDescription(v4, i + 3213009);
    v6 = SBUISystemApertureSettingKeyDescription(i + 3213009);
    id v7 = (id)[v3 appendObject:v5 withName:v6 skipIfNil:1];
  }
}

void __83__BSSettings_SBUISystemAperture__SBUI_systemApertureDescriptionOfDiffFromSettings___block_invoke(uint64_t a1)
{
  for (uint64_t i = 0; i != 44; ++i)
  {
    v3 = [*(id *)(a1 + 32) objectForSetting:i + 3213009];
    v4 = [*(id *)(a1 + 40) objectForSetting:i + 3213009];
    if ((BSEqualObjects() & 1) == 0)
    {
      v5 = *(void **)(a1 + 48);
      v6 = SBUISystemApertureSettingKeyValueDescription(v3, i + 3213009);
      id v7 = SBUISystemApertureSettingKeyDescription(i + 3213009);
      id v8 = (id)[v5 appendObject:v6 withName:v7 skipIfNil:0];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

@end