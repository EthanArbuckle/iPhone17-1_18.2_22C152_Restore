@interface PKBacklightController
+ (id)sharedInstance;
- (PKBacklightController)init;
- (void)_changeBacklightMinimumEnabledIfNecessary;
- (void)_updateBacklightNits:(float)a3 period:(double)a4 disableWhitePointShift:(BOOL)a5;
- (void)beginAllowingBacklightRamping:(id)a3;
- (void)beginRequestingBacklightRamping:(id)a3;
- (void)endAllowingBacklightRamping:(id)a3;
- (void)endRequestingBacklightRamping:(id)a3;
@end

@implementation PKBacklightController

+ (id)sharedInstance
{
  if (_MergedGlobals_681 != -1) {
    dispatch_once(&_MergedGlobals_681, &__block_literal_global_119);
  }
  v2 = (void *)qword_1EB545C48;

  return v2;
}

void __39__PKBacklightController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKBacklightController);
  v1 = (void *)qword_1EB545C48;
  qword_1EB545C48 = (uint64_t)v0;
}

- (PKBacklightController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PKBacklightController;
  v2 = [(PKBacklightController *)&v10 init];
  if (v2)
  {
    v3 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E4F5B290]);
    brightnessClient = v2->_brightnessClient;
    v2->_brightnessClient = v3;

    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    requesters = v2->_requesters;
    v2->_requesters = (NSHashTable *)v5;

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    allowers = v2->_allowers;
    v2->_allowers = (NSHashTable *)v7;
  }
  return v2;
}

- (void)beginAllowingBacklightRamping:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(NSHashTable *)self->_allowers addObject:a3];
  v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    requesters = self->_requesters;
    allowers = self->_allowers;
    int v7 = 138412546;
    v8 = allowers;
    __int16 v9 = 2112;
    objc_super v10 = requesters;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Backlight ramping allowed: allowers = %@\nrequesters = %@", (uint8_t *)&v7, 0x16u);
  }

  [(PKBacklightController *)self _changeBacklightMinimumEnabledIfNecessary];
}

- (void)_changeBacklightMinimumEnabledIfNecessary
{
  NSUInteger v3 = [(NSHashTable *)self->_allowers count];
  NSUInteger v4 = [(NSHashTable *)self->_requesters count];
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;
  if (!self->_isBacklightRamped == v7)
  {
    LODWORD(v5) = 1127299088;
    if (!v7) {
      *(float *)&double v5 = 0.0;
    }
    [(PKBacklightController *)self _updateBacklightNits:v7 period:v5 disableWhitePointShift:0.4];
    self->_isBacklightRamped = v7;
  }
}

- (void)endAllowingBacklightRamping:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(NSHashTable *)self->_allowers removeObject:a3];
  NSUInteger v4 = [(NSHashTable *)self->_allowers count];
  double v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = @"allowed";
    requesters = self->_requesters;
    allowers = self->_allowers;
    if (!v4) {
      BOOL v6 = @"disallowed";
    }
    int v9 = 138412802;
    objc_super v10 = v6;
    __int16 v11 = 2112;
    v12 = allowers;
    __int16 v13 = 2112;
    v14 = requesters;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Backlight ramping %@: allowers = %@\nrequesters = %@", (uint8_t *)&v9, 0x20u);
  }

  [(PKBacklightController *)self _changeBacklightMinimumEnabledIfNecessary];
}

- (void)beginRequestingBacklightRamping:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(NSHashTable *)self->_requesters addObject:a3];
  [(PKBacklightController *)self _changeBacklightMinimumEnabledIfNecessary];
  NSUInteger v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    requesters = self->_requesters;
    allowers = self->_allowers;
    int v7 = 138412546;
    v8 = allowers;
    __int16 v9 = 2112;
    objc_super v10 = requesters;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Backlight ramping requested: allowers = %@\nrequesters = %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)endRequestingBacklightRamping:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(NSHashTable *)self->_requesters removeObject:a3];
  [(PKBacklightController *)self _changeBacklightMinimumEnabledIfNecessary];
  NSUInteger v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    requesters = self->_requesters;
    allowers = self->_allowers;
    int v7 = 138412546;
    v8 = allowers;
    __int16 v9 = 2112;
    objc_super v10 = requesters;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Backlight ramping unrequested: allowers = %@\nrequesters = %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_updateBacklightNits:(float)a3 period:(double)a4 disableWhitePointShift:(BOOL)a5
{
  BOOL v5 = a5;
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = @"nits";
  v8 = objc_msgSend(NSNumber, "numberWithFloat:");
  v20[1] = @"period";
  v21[0] = v8;
  __int16 v9 = [NSNumber numberWithDouble:a4];
  v21[1] = v9;
  objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  v18 = @"DisableWPShift";
  uint64_t v11 = [NSNumber numberWithBool:v5];
  v19 = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  [(BrightnessSystemClient *)self->_brightnessClient setProperty:v10 forKey:@"MinNits"];
  [(BrightnessSystemClient *)self->_brightnessClient setProperty:v12 forKey:@"CoreBrightnessFeaturesDisabled"];
  __int16 v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Updating backlight settings: %@, disabled: %@", (uint8_t *)&v14, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowers, 0);
  objc_storeStrong((id *)&self->_requesters, 0);

  objc_storeStrong((id *)&self->_brightnessClient, 0);
}

@end