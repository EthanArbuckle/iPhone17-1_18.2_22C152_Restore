@interface SBCaptureButtonDefaults
- (void)_addStateCaptureHandlers;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBCaptureButtonDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"simulateCaptureButtonUsingActionButton"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBSimulateCaptureButtonUsingActionButton" toDefaultValue:MEMORY[0x1E4F1CC28] options:4];

  v5 = [NSString stringWithUTF8String:"disablePreLaunchCaptureButtonSuppression"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBDisablePreLaunchCaptureButtonSuppression" toDefaultValue:v4 options:4];

  v6 = [NSString stringWithUTF8String:"captureButtonAssociatedAppBundleIdentifier"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBCaptureButtonAssociatedAppBundleIdentifier" toDefaultValue:@"com.apple.camera" options:1];

  v7 = [NSString stringWithUTF8String:"disableCaptureButton"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBDisableCaptureButton" toDefaultValue:v4 options:4];

  v8 = [NSString stringWithUTF8String:"captureButtonClickCount"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBCaptureButtonClickCount" toDefaultValue:&unk_1ED89E560 options:4];

  v9 = [NSString stringWithUTF8String:"disableWakeWhenDim"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBCaptureButtonDisableWakeWhenDim" toDefaultValue:v4 options:4];

  v10 = [NSString stringWithUTF8String:"disableStationaryDetection"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"SBCaptureButtonDisableStationaryDetection" toDefaultValue:v4 options:4];

  v11 = [NSString stringWithUTF8String:"disableDirectLaunchAfterUnsuppress"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"SBCaptureButtonDisableDirectLaunchAfterUnsuppress" toDefaultValue:v4 options:4];

  v12 = [NSString stringWithUTF8String:"allowLaunchIfUnobstructionOccursWhileButtonDown"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"SBCaptureButtonAllowLaunchIfUnobstructionOccursWhileButtonDown" toDefaultValue:v4 options:4];

  v13 = [NSString stringWithUTF8String:"allowLaunchIfUnobstructionOccursPromptlyAfterButtonUp"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v13 withDefaultKey:@"SBCaptureButtonAllowLaunchIfUnobstructionOccursPromptlyAfterButtonUp" toDefaultValue:v4 options:4];

  v14 = [NSString stringWithUTF8String:"enableCameraPose"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v14 withDefaultKey:@"SBCaptureButtonEnableCameraPose" toDefaultValue:v4 options:4];

  v15 = [NSString stringWithUTF8String:"cameraLaunchCounter"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v15 withDefaultKey:@"SBCaptureButtonCameraLaunchCounter" toDefaultValue:&unk_1ED89E578 options:4];

  [(SBCaptureButtonDefaults *)self _addStateCaptureHandlers];
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

__CFString *__51__SBCaptureButtonDefaults__addStateCaptureHandlers__block_invoke(uint64_t a1)
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