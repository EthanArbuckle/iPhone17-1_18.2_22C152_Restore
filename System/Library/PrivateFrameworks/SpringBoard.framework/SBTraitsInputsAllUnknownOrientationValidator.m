@interface SBTraitsInputsAllUnknownOrientationValidator
- (id)validateInputs:(id)a3 withContext:(id)a4;
@end

@implementation SBTraitsInputsAllUnknownOrientationValidator

- (id)validateInputs:(id)a3 withContext:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SBTraitsInputsAllUnknownOrientationValidator;
  v4 = [(SBTraitsInputsValidator *)&v14 validateInputs:a3 withContext:a4];
  v5 = [v4 deviceOrientationInputs];
  if (![v5 currentDeviceOrientation] && !objc_msgSend(v5, "nonFlatDeviceOrientation"))
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FAFF88]) initWithCurrentDeviceOrientation:1 nonFlatDeviceOrientation:1];

    v5 = (void *)v6;
  }
  id v7 = objc_alloc(MEMORY[0x1E4FAFF90]);
  v8 = [v4 interfaceIdiomInputs];
  v9 = [v4 userInterfaceStyleInputs];
  v10 = [v4 keyboardInputs];
  v11 = [v4 ambientPresentationInputs];
  v12 = (void *)[v7 initWithInterfaceIdiomInputs:v8 userInterfaceStyleInputs:v9 deviceOrientationInputs:v5 keyboardInputs:v10 ambientPresentationInputs:v11];

  return v12;
}

@end