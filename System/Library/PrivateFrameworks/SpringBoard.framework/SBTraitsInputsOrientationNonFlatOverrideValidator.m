@interface SBTraitsInputsOrientationNonFlatOverrideValidator
- (id)description;
- (id)validateInputs:(id)a3 withContext:(id)a4;
- (void)setLastNonFlatOrientationOverride:(int64_t)a3;
@end

@implementation SBTraitsInputsOrientationNonFlatOverrideValidator

- (id)validateInputs:(id)a3 withContext:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)SBTraitsInputsOrientationNonFlatOverrideValidator;
  v5 = [(SBTraitsInputsValidator *)&v16 validateInputs:a3 withContext:a4];
  v6 = [v5 deviceOrientationInputs];
  uint64_t v7 = [v6 currentDeviceOrientation];
  if ((unint64_t)(v7 - 1) >= 4 && self->_lastNonFlatOrientationOverride)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FAFF88]) initWithCurrentDeviceOrientation:v7 nonFlatDeviceOrientation:self->_lastNonFlatOrientationOverride];

    v6 = (void *)v8;
  }
  id v9 = objc_alloc(MEMORY[0x1E4FAFF90]);
  v10 = [v5 interfaceIdiomInputs];
  v11 = [v5 userInterfaceStyleInputs];
  v12 = [v5 keyboardInputs];
  v13 = [v5 ambientPresentationInputs];
  v14 = (void *)[v9 initWithInterfaceIdiomInputs:v10 userInterfaceStyleInputs:v11 deviceOrientationInputs:v6 keyboardInputs:v12 ambientPresentationInputs:v13];

  return v14;
}

- (void)setLastNonFlatOrientationOverride:(int64_t)a3
{
  if ((unint64_t)(a3 - 5) <= 1)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBTraitsInputsValidators.m", 147, @"Invalid parameter not satisfying: %@", @"lastNonFlatOrientationOverride != BSDeviceOrientationFaceUp && lastNonFlatOrientationOverride != BSDeviceOrientationFaceDown" object file lineNumber description];
  }
  if (self->_lastNonFlatOrientationOverride != a3) {
    self->_lastNonFlatOrientationOverride = a3;
  }
}

- (id)description
{
  v2 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)SBTraitsInputsOrientationNonFlatOverrideValidator;
  v3 = [(SBTraitsInputsValidator *)&v7 description];
  v4 = [v2 stringWithString:v3];

  v5 = SBFStringForBSDeviceOrientation();
  [v4 appendFormat:@", last non-flat orientation override: %@", v5];

  return v4;
}

@end