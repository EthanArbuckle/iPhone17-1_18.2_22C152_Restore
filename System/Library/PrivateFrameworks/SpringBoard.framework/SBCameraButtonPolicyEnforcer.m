@interface SBCameraButtonPolicyEnforcer
- (void)enforce:(id)a3;
@end

@implementation SBCameraButtonPolicyEnforcer

- (void)enforce:(id)a3
{
  id v6 = a3;
  uint64_t v3 = [v6 advicePolicy];
  v4 = [(id)SBApp cameraHardwareButton];
  if (v3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [v6 cameraIsHosted] ^ 1;
  }
  [v4 setDisableDeferringToApplications:v5];
}

@end