@interface SBExternalDefaults
+ (id)chronoDefaults;
- (SBBiometricKitDefaults)biometricKitDefaults;
- (SBExternalChronoDefaults)chronoDefaults;
- (SBExternalDemoDefaults)demoDefaults;
- (SBExternalDuetDefaults)duetDefaults;
- (SBExternalGlobalDefaults)globalDefaults;
- (SBExternalNotesDefaults)notesDefaults;
- (SBExternalPhoneDefaults)phoneDefaults;
- (SBExternalSettingsDefaults)settingsDefaults;
- (SBExternalSetupDefaults)setupDefaults;
- (SBExternalSoundsDefaults)soundDefaults;
- (SBExternalWifiDefaults)networkDefaults;
@end

@implementation SBExternalDefaults

- (SBExternalGlobalDefaults)globalDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SBExternalDefaults_globalDefaults__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  if (globalDefaults___once != -1) {
    dispatch_once(&globalDefaults___once, block);
  }
  return self->_lazy_globalDefaults;
}

void __36__SBExternalDefaults_globalDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBExternalGlobalDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;
}

- (SBExternalDuetDefaults)duetDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SBExternalDefaults_duetDefaults__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  if (duetDefaults___once != -1) {
    dispatch_once(&duetDefaults___once, block);
  }
  return self->_lazy_duetDefaults;
}

void __34__SBExternalDefaults_duetDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBExternalDuetDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

- (SBExternalDemoDefaults)demoDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SBExternalDefaults_demoDefaults__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  if (demoDefaults___once != -1) {
    dispatch_once(&demoDefaults___once, block);
  }
  return self->_lazy_demoDefaults;
}

void __34__SBExternalDefaults_demoDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBExternalDemoDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

- (SBExternalSetupDefaults)setupDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SBExternalDefaults_setupDefaults__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  if (setupDefaults___once != -1) {
    dispatch_once(&setupDefaults___once, block);
  }
  return self->_lazy_setupDefaults;
}

void __35__SBExternalDefaults_setupDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBExternalSetupDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

- (SBExternalSettingsDefaults)settingsDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SBExternalDefaults_settingsDefaults__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  if (settingsDefaults___once != -1) {
    dispatch_once(&settingsDefaults___once, block);
  }
  return self->_lazy_settingsDefaults;
}

void __38__SBExternalDefaults_settingsDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBExternalSettingsDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (SBExternalPhoneDefaults)phoneDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SBExternalDefaults_phoneDefaults__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  if (phoneDefaults___once != -1) {
    dispatch_once(&phoneDefaults___once, block);
  }
  return self->_lazy_phoneDefaults;
}

void __35__SBExternalDefaults_phoneDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBExternalPhoneDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
}

- (SBExternalWifiDefaults)networkDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SBExternalDefaults_networkDefaults__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  if (networkDefaults___once != -1) {
    dispatch_once(&networkDefaults___once, block);
  }
  return self->_lazy_networkDefaults;
}

void __37__SBExternalDefaults_networkDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBExternalWifiDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;
}

- (SBExternalSoundsDefaults)soundDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SBExternalDefaults_soundDefaults__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  if (soundDefaults___once != -1) {
    dispatch_once(&soundDefaults___once, block);
  }
  return self->_lazy_soundDefaults;
}

void __35__SBExternalDefaults_soundDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBExternalSoundsDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;
}

- (SBExternalNotesDefaults)notesDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SBExternalDefaults_notesDefaults__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  if (notesDefaults___once != -1) {
    dispatch_once(&notesDefaults___once, block);
  }
  return self->_lazy_notesDefaults;
}

void __35__SBExternalDefaults_notesDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBExternalNotesDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;
}

- (SBBiometricKitDefaults)biometricKitDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SBExternalDefaults_biometricKitDefaults__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  if (biometricKitDefaults___once != -1) {
    dispatch_once(&biometricKitDefaults___once, block);
  }
  return self->_lazy_biometricKitDefaults;
}

void __42__SBExternalDefaults_biometricKitDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBBiometricKitDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;
}

+ (id)chronoDefaults
{
  return (id)[MEMORY[0x1E4FA5E60] sharedInstance];
}

- (SBExternalChronoDefaults)chronoDefaults
{
  return self->_chronoDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chronoDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_chronoDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_biometricKitDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_notesDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_soundDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_networkDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_phoneDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_settingsDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_setupDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_demoDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_duetDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_globalDefaults, 0);
}

@end