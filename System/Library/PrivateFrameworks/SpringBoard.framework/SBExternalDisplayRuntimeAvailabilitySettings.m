@interface SBExternalDisplayRuntimeAvailabilitySettings
+ (BOOL)ignoresKey:(id)a3;
+ (id)_moduleWithSectionTitle:(id)a3;
+ (id)settingsControllerModule;
- (BOOL)requireHardwareKeyboard;
- (BOOL)requirePointer;
- (int64_t)extendedDisplayRequirements;
- (void)setDefaultValues;
- (void)setRequireHardwareKeyboard:(BOOL)a3;
- (void)setRequirePointer:(BOOL)a3;
@end

@implementation SBExternalDisplayRuntimeAvailabilitySettings

+ (BOOL)ignoresKey:(id)a3
{
  return [a3 isEqualToString:@"extendedDisplayRequirements"];
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBExternalDisplayRuntimeAvailabilitySettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBExternalDisplayRuntimeAvailabilitySettings *)self setRequirePointer:1];
  [(SBExternalDisplayRuntimeAvailabilitySettings *)self setRequireHardwareKeyboard:1];
}

- (int64_t)extendedDisplayRequirements
{
  return SBBitmaskUnionIf();
}

uint64_t __75__SBExternalDisplayRuntimeAvailabilitySettings_extendedDisplayRequirements__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) requirePointer];
}

uint64_t __75__SBExternalDisplayRuntimeAvailabilitySettings_extendedDisplayRequirements__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) requireHardwareKeyboard];
}

+ (id)settingsControllerModule
{
  return (id)[a1 _moduleWithSectionTitle:@"Extended Display Requirements"];
}

+ (id)_moduleWithSectionTitle:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  v5 = [v3 predicateWithValue:SBFIsChamoisExternalDisplayControllerAvailable()];
  v6 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Pointer" valueKeyPath:@"requirePointer"];
  v7 = [v6 condition:v5];

  v8 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Hardware Keyboard" valueKeyPath:@"requireHardwareKeyboard"];
  v9 = [v8 condition:v5];

  v10 = (void *)MEMORY[0x1E4F94168];
  v16[0] = v7;
  v16[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v12 = [v10 sectionWithRows:v11 title:v4];

  v17[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v14 = [v10 moduleWithTitle:0 contents:v13];

  return v14;
}

- (BOOL)requirePointer
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setRequirePointer:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (BOOL)requireHardwareKeyboard
{
  return *(&self->super.__isObservingChildren + 2);
}

- (void)setRequireHardwareKeyboard:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

@end