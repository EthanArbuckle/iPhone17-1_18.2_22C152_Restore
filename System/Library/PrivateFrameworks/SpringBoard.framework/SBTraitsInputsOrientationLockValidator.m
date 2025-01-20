@interface SBTraitsInputsOrientationLockValidator
- (SBTraitsInputsOrientationLockValidator)initWithValidatorOrder:(id)a3;
- (id)description;
- (id)validateInputs:(id)a3 withContext:(id)a4;
- (void)setLockOrientation:(int64_t)a3;
- (void)setPrefersDeferringOrientationUpdates:(BOOL)a3;
@end

@implementation SBTraitsInputsOrientationLockValidator

- (id)validateInputs:(id)a3 withContext:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)SBTraitsInputsOrientationLockValidator;
  v5 = [(SBTraitsInputsValidator *)&v16 validateInputs:a3 withContext:a4];
  lastForwardedOrientationInputs = [v5 deviceOrientationInputs];
  if (self->_lockOrientation
    && (uint64_t v7 = [objc_alloc(MEMORY[0x1E4FAFF88]) initWithCurrentDeviceOrientation:self->_lockOrientation nonFlatDeviceOrientation:self->_lockOrientation], lastForwardedOrientationInputs, lastForwardedOrientationInputs = (void *)v7, self->_lockOrientation)|| !self->_prefersDeferringOrientationUpdates)
  {
    v8 = lastForwardedOrientationInputs;
    lastForwardedOrientationInputs = self->_lastForwardedOrientationInputs;
    self->_lastForwardedOrientationInputs = v8;
  }
  else
  {
    v8 = self->_lastForwardedOrientationInputs;
  }

  id v9 = objc_alloc(MEMORY[0x1E4FAFF90]);
  v10 = [v5 interfaceIdiomInputs];
  v11 = [v5 userInterfaceStyleInputs];
  v12 = [v5 keyboardInputs];
  v13 = [v5 ambientPresentationInputs];
  v14 = (void *)[v9 initWithInterfaceIdiomInputs:v10 userInterfaceStyleInputs:v11 deviceOrientationInputs:v8 keyboardInputs:v12 ambientPresentationInputs:v13];

  return v14;
}

- (void)setPrefersDeferringOrientationUpdates:(BOOL)a3
{
  if (self->_prefersDeferringOrientationUpdates != a3) {
    self->_prefersDeferringOrientationUpdates = a3;
  }
}

- (SBTraitsInputsOrientationLockValidator)initWithValidatorOrder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBTraitsInputsOrientationLockValidator;
  v3 = [(SBTraitsInputsValidator *)&v7 initWithValidatorOrder:a3];
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FAFF88]) initWithCurrentDeviceOrientation:0 nonFlatDeviceOrientation:0];
    lastForwardedOrientationInputs = v3->_lastForwardedOrientationInputs;
    v3->_lastForwardedOrientationInputs = (TRAArbitrationDeviceOrientationInputs *)v4;
  }
  return v3;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v10.receiver = self;
  v10.super_class = (Class)SBTraitsInputsOrientationLockValidator;
  uint64_t v4 = [(SBTraitsInputsValidator *)&v10 description];
  v5 = [v3 stringWithString:v4];

  uint64_t v6 = SBFStringForBSDeviceOrientation();
  objc_super v7 = (void *)v6;
  if (self->_prefersDeferringOrientationUpdates) {
    v8 = @"yes";
  }
  else {
    v8 = @"no";
  }
  [v5 appendFormat:@", lock orientation: %@, defersUpdates: %@, lastForwardedInputs: %@", v6, v8, self->_lastForwardedOrientationInputs];

  return v5;
}

- (void)setLockOrientation:(int64_t)a3
{
  if (self->_lockOrientation != a3) {
    self->_lockOrientation = a3;
  }
}

- (void).cxx_destruct
{
}

@end