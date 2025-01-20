@interface SBCaptureApplicationDefaults
- (void)_addStateCaptureHandlers;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBCaptureApplicationDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"ignoreCaptureApplicationLaunchMonitor"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBIgnoreCaptureApplicationLaunchMonitor" toDefaultValue:MEMORY[0x1E4F1CC28] options:4];

  [(SBCaptureApplicationDefaults *)self _addStateCaptureHandlers];
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

__CFString *__56__SBCaptureApplicationDefaults__addStateCaptureHandlers__block_invoke(uint64_t a1)
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