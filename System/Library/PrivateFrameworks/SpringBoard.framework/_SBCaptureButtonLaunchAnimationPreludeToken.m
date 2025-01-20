@interface _SBCaptureButtonLaunchAnimationPreludeToken
- (BOOL)isPreludeAnimationToken;
- (CGRect)preludeAnimationRectPresentationValue;
- (_SBCaptureButtonLaunchAnimationPreludeToken)initWithPreludeAnimating:(id)a3 invalidationBlock:(id)a4;
- (id)associatedBezelEffectsCoordinator;
- (void)cancel;
- (void)dealloc;
- (void)expandHintingDropletByAddingComponents:(unint64_t)a3 shockwave:(BOOL)a4;
- (void)invalidate;
- (void)updateShockwaveLightType:(int64_t)a3;
@end

@implementation _SBCaptureButtonLaunchAnimationPreludeToken

- (_SBCaptureButtonLaunchAnimationPreludeToken)initWithPreludeAnimating:(id)a3 invalidationBlock:(id)a4
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
    [v19 handleFailureInMethod:a2, self, @"SBHardwareButtonBezelEffectsCoordinator.m", 580, @"Invalid parameter not satisfying: %@", @"coordinator != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SBHardwareButtonBezelEffectsCoordinator.m", 581, @"Invalid parameter not satisfying: %@", @"invalidationBlock != nil" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)_SBCaptureButtonLaunchAnimationPreludeToken;
  v11 = [(_SBCaptureButtonLaunchAnimationPreludeToken *)&v23 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bezelEffectsCoordinator, a3);
    id v13 = objc_alloc(MEMORY[0x1E4F4F838]);
    v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = [v14 UUIDString];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __90___SBCaptureButtonLaunchAnimationPreludeToken_initWithPreludeAnimating_invalidationBlock___block_invoke;
    v21[3] = &unk_1E6B016D0;
    id v22 = v10;
    uint64_t v16 = [v13 initWithIdentifier:v15 forReason:@"Prelude" queue:MEMORY[0x1E4F14428] invalidationBlock:v21];
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
    [v4 handleFailureInMethod:a2, self, @"SBHardwareButtonBezelEffectsCoordinator.m", 594, @"Failed to invalidate (by way of cancel, or triggering completion handler) before deallocation" object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)_SBCaptureButtonLaunchAnimationPreludeToken;
  [(_SBCaptureButtonLaunchAnimationPreludeToken *)&v5 dealloc];
}

- (void)expandHintingDropletByAddingComponents:(unint64_t)a3 shockwave:(BOOL)a4
{
}

- (void)updateShockwaveLightType:(int64_t)a3
{
}

- (void)cancel
{
  if (!self->_valid)
  {
    objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBHardwareButtonBezelEffectsCoordinator.m" lineNumber:606 description:@"Object has been invalidated"];
  }
  bezelEffectsCoordinator = self->_bezelEffectsCoordinator;
  [(SBCaptureButtonPreludeAnimatingPrivate *)bezelEffectsCoordinator cancelPrelude];
}

- (CGRect)preludeAnimationRectPresentationValue
{
  if (!self->_valid)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBHardwareButtonBezelEffectsCoordinator.m" lineNumber:611 description:@"Object has been invalidated"];
  }
  bezelEffectsCoordinator = self->_bezelEffectsCoordinator;
  [(SBCaptureButtonPreludeAnimatingPrivate *)bezelEffectsCoordinator preludeAnimationRectPresentationValue];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)associatedBezelEffectsCoordinator
{
  if (!self->_valid)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBHardwareButtonBezelEffectsCoordinator.m" lineNumber:616 description:@"Object has been invalidated"];
  }
  bezelEffectsCoordinator = self->_bezelEffectsCoordinator;
  return bezelEffectsCoordinator;
}

- (BOOL)isPreludeAnimationToken
{
  return 1;
}

- (void)invalidate
{
  if (!self->_valid)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBHardwareButtonBezelEffectsCoordinator.m" lineNumber:627 description:@"Can't invalidate twice"];
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