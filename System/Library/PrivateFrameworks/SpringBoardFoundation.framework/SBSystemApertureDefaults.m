@interface SBSystemApertureDefaults
- (void)_addStateCaptureHandlers;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBSystemApertureDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"suppressDynamicIslandCompletely"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBSuppressDynamicIslandCompletely" toDefaultValue:MEMORY[0x1E4F1CC28] options:4];

  v5 = [NSString stringWithUTF8String:"alwaysShowSystemApertureOnClonedDisplays"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBAlwaysShowSystemApertureOnClonedDisplays" toDefaultValue:v4 options:4];

  v6 = [NSString stringWithUTF8String:"alwaysShowSystemApertureInSnapshots"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBAlwaysShowSystemApertureInSnapshots" toDefaultValue:v4 options:4];

  v7 = [NSString stringWithUTF8String:"alwaysRenderSystemApertureFillOnGPU"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBAlwaysRenderSystemApertureFillOnGPU" toDefaultValue:v4 options:4];

  v8 = [NSString stringWithUTF8String:"neverRenderSystemApertureFillOnGPU"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBNeverRenderSystemApertureFillOnGPU" toDefaultValue:v4 options:4];

  v9 = [NSString stringWithUTF8String:"enableSystemApertureStateCollection"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBEnableSystemApertureStateCollection" toDefaultValue:MEMORY[0x1E4F1CC38] options:4];

  [(SBSystemApertureDefaults *)self _addStateCaptureHandlers];
}

- (void)_addStateCaptureHandlers
{
  objc_initWeak(&location, self);
  id v2 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v4, &location);
  id v3 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

__CFString *__52__SBSystemApertureDefaults__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained description];
  }
  else
  {
    id v3 = &stru_1ED879EF8;
  }

  return v3;
}

@end