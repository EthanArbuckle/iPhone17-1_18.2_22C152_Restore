@interface _SBHardwareButtonLaunchZoomUpAnimationToken
- (BOOL)isHardwareButtonZoomUpAnimationToken;
- (CGPoint)preludeAnimationVelocity;
- (_SBHardwareButtonLaunchZoomUpAnimationToken)initWithPreludeAnimating:(id)a3 invalidationBlock:(id)a4;
- (double)requestedDropletWindowLevel;
- (id)animatingDroplet;
- (id)animatingDropletContext;
- (id)associatedBezelEffectsCoordinator;
- (void)appendZoomUpCompletionBlock:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setRequestedDropletWindowLevel:(double)a3;
@end

@implementation _SBHardwareButtonLaunchZoomUpAnimationToken

- (_SBHardwareButtonLaunchZoomUpAnimationToken)initWithPreludeAnimating:(id)a3 invalidationBlock:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBHardwareButtonBezelEffectsCoordinator.m", 666, @"Invalid parameter not satisfying: %@", @"coordinator != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SBHardwareButtonBezelEffectsCoordinator.m", 667, @"Invalid parameter not satisfying: %@", @"invalidationBlock != nil" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)_SBHardwareButtonLaunchZoomUpAnimationToken;
  v11 = [(_SBHardwareButtonLaunchZoomUpAnimationToken *)&v23 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bezelEffectsCoordinator, a3);
    id v13 = objc_alloc(MEMORY[0x1E4F4F838]);
    v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = [v14 UUIDString];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __90___SBHardwareButtonLaunchZoomUpAnimationToken_initWithPreludeAnimating_invalidationBlock___block_invoke;
    v21[3] = &unk_1E6B016D0;
    id v22 = v10;
    uint64_t v16 = [v13 initWithIdentifier:v15 forReason:@"Zoom Up" queue:MEMORY[0x1E4F14428] invalidationBlock:v21];
    underlyingAssertion = v12->_underlyingAssertion;
    v12->_underlyingAssertion = (BSSimpleAssertion *)v16;

    v12->_valid = 1;
  }

  return v12;
}

- (void)dealloc
{
  if (self->_valid)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"SBHardwareButtonBezelEffectsCoordinator.m", 681, @"Failed to invalidate (by way of cancel, or triggering completion handler) before deallocation" object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)_SBHardwareButtonLaunchZoomUpAnimationToken;
  [(_SBHardwareButtonLaunchZoomUpAnimationToken *)&v5 dealloc];
}

- (double)requestedDropletWindowLevel
{
  return self->_requestedWindowLevel;
}

- (CGPoint)preludeAnimationVelocity
{
  if (!self->_valid)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBHardwareButtonBezelEffectsCoordinator.m" lineNumber:690 description:@"Object has been invalidated"];
  }
  bezelEffectsCoordinator = self->_bezelEffectsCoordinator;
  [(SBCaptureButtonPreludeAnimatingPrivate *)bezelEffectsCoordinator preludeAnimationVelocity];
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)animatingDroplet
{
  return (id)[(SBCaptureButtonPreludeAnimatingPrivate *)self->_bezelEffectsCoordinator animatingDroplet];
}

- (id)animatingDropletContext
{
  return (id)[(SBCaptureButtonPreludeAnimatingPrivate *)self->_bezelEffectsCoordinator animatingDropletContext];
}

- (void)setRequestedDropletWindowLevel:(double)a3
{
  if (!self->_valid)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBHardwareButtonBezelEffectsCoordinator.m" lineNumber:703 description:@"Object has been invalidated"];
  }
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_requestedWindowLevel = a3;
    bezelEffectsCoordinator = self->_bezelEffectsCoordinator;
    [(SBCaptureButtonPreludeAnimatingPrivate *)bezelEffectsCoordinator updateLaunchAnimationWindowLevelBasedOnRequests];
  }
}

- (id)associatedBezelEffectsCoordinator
{
  if (!self->_valid)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBHardwareButtonBezelEffectsCoordinator.m" lineNumber:711 description:@"Object has been invalidated"];
  }
  bezelEffectsCoordinator = self->_bezelEffectsCoordinator;
  return bezelEffectsCoordinator;
}

- (BOOL)isHardwareButtonZoomUpAnimationToken
{
  return 1;
}

- (void)appendZoomUpCompletionBlock:(id)a3
{
}

- (void)invalidate
{
  if (!self->_valid)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBHardwareButtonBezelEffectsCoordinator.m" lineNumber:726 description:@"Can't invalidate twice"];
  }
  self->_valid = 0;
  underlyingAssertion = self->_underlyingAssertion;
  [(BSSimpleAssertion *)underlyingAssertion invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAssertion, 0);
  objc_storeStrong((id *)&self->_bezelEffectsCoordinator, 0);
}

@end