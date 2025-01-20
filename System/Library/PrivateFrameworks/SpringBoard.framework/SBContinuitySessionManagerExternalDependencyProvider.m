@interface SBContinuitySessionManagerExternalDependencyProvider
@end

@implementation SBContinuitySessionManagerExternalDependencyProvider

void __61___SBContinuitySessionManagerExternalDependencyProvider_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F92868]) initWithResourceType:7 andState:0];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

void __80___SBContinuitySessionManagerExternalDependencyProvider__setResourceHintActive___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 24) updateState:*(unsigned __int8 *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v2 = SBLogContinuitySession();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 40)) {
        uint64_t v3 = @"started";
      }
      else {
        uint64_t v3 = @"ended";
      }
      int v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Updating resource hint for continuity session %{public}@ returned NO ?!?!?!", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __80___SBContinuitySessionManagerExternalDependencyProvider__setRestrictionsActive___block_invoke(uint64_t a1)
{
  v1 = (unsigned char *)(a1 + 32);
  if (*(unsigned char *)(a1 + 32))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v2 MCSetBoolRestriction:*MEMORY[0x1E4F74100] value:0];
    [v2 MCSetBoolRestriction:*MEMORY[0x1E4F73FC8] value:0];
  }
  else
  {
    id v2 = 0;
  }
  uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
  id v6 = 0;
  [v3 applyRestrictionDictionary:v2 clientType:@"com.apple.springboard" clientUUID:@"com.apple.springboard.continuityRestrictions" localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v6];
  id v4 = v6;

  if (v4)
  {
    v5 = SBLogContinuitySession();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __80___SBContinuitySessionManagerExternalDependencyProvider__setRestrictionsActive___block_invoke_cold_1(v1);
    }
  }
}

void __80___SBContinuitySessionManagerExternalDependencyProvider__setRestrictionsActive___block_invoke_cold_1(unsigned char *a1)
{
  v1 = @"applying";
  if (!*a1) {
    v1 = @"clearing";
  }
  LODWORD(v4) = 138543618;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_1_19();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v2, v3, "Error %{public}@ continuity restrictions: %{public}@", (void)v4, DWORD2(v4));
}

@end