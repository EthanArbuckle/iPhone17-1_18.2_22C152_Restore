@interface UNCBiometricResource
- (BOOL)hasPearlCapability;
- (BOOL)isPearlEnabledAndEnrolled;
- (UNCBiometricResource)init;
- (void)_initializeBiometricKit;
- (void)_registerForBKEnrollmentChange;
- (void)_registerForBiometricUnlockAllowedChange;
- (void)_registerForPasscodeChange;
- (void)_unregisterForBKEnrollmentChange;
- (void)_unregisterForBiometricUnlockAllowedChange;
- (void)_updateHasEnrolledPearlIdentities;
- (void)_updateIsBiometricUnlockAllowed;
- (void)_updateIsPasscodeSet;
- (void)dealloc;
@end

@implementation UNCBiometricResource

- (UNCBiometricResource)init
{
  v7.receiver = self;
  v7.super_class = (Class)UNCBiometricResource;
  v2 = [(UNCBiometricResource *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.usernotifications.UNCBiometricResource", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    [(UNCBiometricResource *)v2 _updateIsPasscodeSet];
    [(UNCBiometricResource *)v2 _updateIsBiometricUnlockAllowed];
    [(UNCBiometricResource *)v2 _initializeBiometricKit];
    [(UNCBiometricResource *)v2 _registerForBiometricUnlockAllowedChange];
    [(UNCBiometricResource *)v2 _registerForPasscodeChange];
  }
  return v2;
}

- (void)_initializeBiometricKit
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  pearlDevice = self->_pearlDevice;
  self->_pearlDevice = 0;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  dispatch_queue_t v4 = [MEMORY[0x263F2AA30] availableDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v18;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v8);
      Class v10 = NSClassFromString(&cfstr_Bkdevice.isa);
      id v16 = 0;
      v11 = [(objc_class *)v10 deviceWithDescriptor:v9 error:&v16];
      id v12 = v16;
      v13 = [v11 descriptor];
      if ([v13 type] == 2)
      {
        NSClassFromString(&cfstr_Bkdevicepearl.isa);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          goto LABEL_10;
        }
        v15 = v11;
        v13 = self->_pearlDevice;
        self->_pearlDevice = v15;
      }

LABEL_10:
      ++v8;
    }
    while (v6 != v8);
    uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v6);
LABEL_12:

  [(UNCBiometricResource *)self _updateHasEnrolledPearlIdentities];
  if (self->_pearlDevice) {
    [(UNCBiometricResource *)self _registerForBKEnrollmentChange];
  }
}

- (void)dealloc
{
  [(UNCBiometricResource *)self _unregisterForBKEnrollmentChange];
  [(UNCBiometricResource *)self _unregisterForBiometricUnlockAllowedChange];
  v3.receiver = self;
  v3.super_class = (Class)UNCBiometricResource;
  [(UNCBiometricResource *)&v3 dealloc];
}

- (void)_registerForBKEnrollmentChange
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleBKEnrollmentChange, @"com.apple.BiometricKit.enrollmentChanged", 0, (CFNotificationSuspensionBehavior)0);
}

- (void)_unregisterForBKEnrollmentChange
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.BiometricKit.enrollmentChanged", 0);
}

- (void)_registerForBiometricUnlockAllowedChange
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__updateIsBiometricUnlockAllowed name:*MEMORY[0x263F536E0] object:0];
}

- (void)_unregisterForBiometricUnlockAllowedChange
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F536E0] object:0];
}

- (void)_registerForPasscodeChange
{
  int out_token = 0;
  id v3 = (const char *)[(id)*MEMORY[0x263F53B08] cStringUsingEncoding:4];
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__UNCBiometricResource__registerForPasscodeChange__block_invoke;
  v5[3] = &unk_265567830;
  v5[4] = self;
  notify_register_dispatch(v3, &out_token, queue, v5);
}

uint64_t __50__UNCBiometricResource__registerForPasscodeChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateIsPasscodeSet];
}

- (void)_updateIsPasscodeSet
{
  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  self->_isPasscodeSet = [v3 isPasscodeSet];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"BBBiometricResourceStateChanged" object:self userInfo:0];
}

- (void)_updateIsBiometricUnlockAllowed
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__UNCBiometricResource__updateIsBiometricUnlockAllowed__block_invoke;
  block[3] = &unk_265567728;
  block[4] = self;
  dispatch_async(queue, block);
}

void __55__UNCBiometricResource__updateIsBiometricUnlockAllowed__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = [v2 isFingerprintUnlockAllowed];

  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"BBBiometricResourceStateChanged" object:*(void *)(a1 + 32) userInfo:0];
}

- (void)_updateHasEnrolledPearlIdentities
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__UNCBiometricResource__updateHasEnrolledPearlIdentities__block_invoke;
  block[3] = &unk_265567728;
  block[4] = self;
  dispatch_async(queue, block);
}

void __57__UNCBiometricResource__updateHasEnrolledPearlIdentities__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    id v6 = 0;
    id v3 = [v2 identitiesWithError:&v6];
    id v4 = v6;
    if ([v3 count]) {
      *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
    }
  }
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"BBBiometricResourceStateChanged" object:*(void *)(a1 + 32) userInfo:0];
}

- (BOOL)isPearlEnabledAndEnrolled
{
  return self->_isPasscodeSet && self->_hasEnrolledPearlIdentities && self->_isBiometricUnlockAllowed;
}

- (BOOL)hasPearlCapability
{
  return self->_pearlDevice != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pearlDevice, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end