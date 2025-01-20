@interface SBVolumeButtonEventMapper
+ (BOOL)_shouldInvertVolumeButtonsForLTRRightEdgePadInInterfaceOrientation:(int64_t)a3;
+ (BOOL)_shouldInvertVolumeButtonsForLTRTopEdgePadInInterfaceOrientation:(int64_t)a3;
+ (BOOL)_shouldInvertVolumeButtonsForRTLRightEdgePadInInterfaceOrientation:(int64_t)a3;
+ (BOOL)_shouldInvertVolumeButtonsForRTLTopEdgePadInInterfaceOrientation:(int64_t)a3;
+ (BOOL)isVolumeButtonRemappingSupported;
+ (BOOL)shouldInvertVolumeButtonsOnEdge:(unint64_t)a3 forInterfaceOrientation:(int64_t)a4 userInterfaceLayoutDirection:(int64_t)a5;
- (BOOL)isPreventingEffectiveInterfaceOrientationChanges;
- (BOOL)isVolumeButtonEventInvertible:(id)a3 withPressType:(int64_t)a4;
- (BOOL)isVolumeButtonRemappingEnabled;
- (BOOL)shouldInvertVolumeButtonsForEvent:(id)a3 withPressType:(int64_t)a4;
- (SBVolumeButtonEventMapper)init;
- (int64_t)effectiveInterfaceOrientation;
- (int64_t)layoutDirection;
- (unint64_t)buttonsEdge;
- (void)_hardwareDefaultsChanged;
- (void)_resetEffectiveInterfaceOrientation;
- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5;
- (void)dealloc;
- (void)setButtonsEdge:(unint64_t)a3;
- (void)setEffectiveInterfaceOrientation:(int64_t)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setVolumeButtonRemappingEnabled:(BOOL)a3;
@end

@implementation SBVolumeButtonEventMapper

- (SBVolumeButtonEventMapper)init
{
  v18.receiver = self;
  v18.super_class = (Class)SBVolumeButtonEventMapper;
  v2 = [(SBVolumeButtonEventMapper *)&v18 init];
  if (v2)
  {
    uint64_t v3 = SBHScreenTypeForCurrentDevice();
    uint64_t v4 = 8;
    if (v3 == 34) {
      uint64_t v4 = 1;
    }
    v2->_effectiveInterfaceOrientation = 0;
    v2->_buttonsEdge = v4;
    v2->_layoutDirection = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
    v5 = +[SBDefaults localDefaults];
    v6 = [v5 hardwareDefaults];

    objc_initWeak(&location, v2);
    v7 = [NSString stringWithUTF8String:"disableNaturalVolumeButtonOrientation"];
    uint64_t v8 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __33__SBVolumeButtonEventMapper_init__block_invoke;
    v15 = &unk_1E6AF4B10;
    objc_copyWeak(&v16, &location);
    id v10 = (id)[v6 observeDefault:v7 onQueue:v8 withBlock:&v12];

    [(SBVolumeButtonEventMapper *)v2 _hardwareDefaultsChanged];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __33__SBVolumeButtonEventMapper_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hardwareDefaultsChanged];
}

- (void)dealloc
{
  [(SBVolumeButtonEventMapper *)self setVolumeButtonRemappingEnabled:0];
  v3.receiver = self;
  v3.super_class = (Class)SBVolumeButtonEventMapper;
  [(SBVolumeButtonEventMapper *)&v3 dealloc];
}

+ (BOOL)isVolumeButtonRemappingSupported
{
  if (__sb__runningInSpringBoard()) {
    return SBFEffectiveDeviceClass() == 2;
  }
  objc_super v3 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v2 = [v3 userInterfaceIdiom] == 1;

  return v2;
}

+ (BOOL)shouldInvertVolumeButtonsOnEdge:(unint64_t)a3 forInterfaceOrientation:(int64_t)a4 userInterfaceLayoutDirection:(int64_t)a5
{
  if (a3 == 8)
  {
    if (a5 == 1) {
      return [a1 _shouldInvertVolumeButtonsForRTLRightEdgePadInInterfaceOrientation:a4];
    }
    else {
      return [a1 _shouldInvertVolumeButtonsForLTRRightEdgePadInInterfaceOrientation:a4];
    }
  }
  else if (a3 == 1)
  {
    if (a5 == 1) {
      return [a1 _shouldInvertVolumeButtonsForRTLTopEdgePadInInterfaceOrientation:a4];
    }
    else {
      return [a1 _shouldInvertVolumeButtonsForLTRTopEdgePadInInterfaceOrientation:a4];
    }
  }
  else
  {
    return 0;
  }
}

- (BOOL)isVolumeButtonEventInvertible:(id)a3 withPressType:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 0x66 || !self->_volumeButtonRemappingEnabled) {
    return 0;
  }
  uint64_t v5 = [a3 _hidEvent];
  if ((unint64_t)(IOHIDEventGetIntegerValue() - 233) > 1) {
    return 0;
  }
  int Type = IOHIDEventGetType();
  char v7 = 0;
  if (v5 && Type == 3)
  {
    uint64_t v8 = BKSHIDEventGetBaseAttributes();
    if ([v8 source])
    {
      id v9 = SBLogButtonsVolume();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = NSStringFromBKSHIDEventSource();
        int v15 = 138543362;
        uint64_t v16 = (uint64_t)v10;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "will not remap presses from source: %{public}@", (uint8_t *)&v15, 0xCu);
      }
      char v7 = 0;
    }
    else
    {
      uint64_t SenderID = IOHIDEventGetSenderID();
      int v13 = SBHIDIsAccessibilitySenderID(SenderID);
      if (v13)
      {
        v14 = SBLogButtonsVolume();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v15 = 134217984;
          uint64_t v16 = SenderID;
          _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "will not remap presses from accessibility sender: %llX", (uint8_t *)&v15, 0xCu);
        }
      }
      char v7 = v13 ^ 1;
    }
  }
  return v7;
}

- (BOOL)shouldInvertVolumeButtonsForEvent:(id)a3 withPressType:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(SBVolumeButtonEventMapper *)self isVolumeButtonEventInvertible:a3 withPressType:a4])
  {
    int64_t v5 = [(SBVolumeButtonEventMapper *)self effectiveInterfaceOrientation];
    int64_t layoutDirection = self->_layoutDirection;
    int v7 = [(id)objc_opt_class() shouldInvertVolumeButtonsOnEdge:self->_buttonsEdge forInterfaceOrientation:v5 userInterfaceLayoutDirection:layoutDirection];
    uint64_t v8 = SBLogButtonsVolume();
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = BSInterfaceOrientationDescription();
        v11 = (void *)v10;
        unint64_t v12 = self->_buttonsEdge - 1;
        if (v12 > 7) {
          int v13 = @"(unknown)";
        }
        else {
          int v13 = off_1E6B08F88[v12];
        }
        uint64_t v17 = @"LTR";
        int v23 = 138543874;
        uint64_t v24 = v10;
        __int16 v25 = 2114;
        if (layoutDirection == 1) {
          uint64_t v17 = @"RTL";
        }
        v26 = v13;
        __int16 v27 = 2114;
        v28 = v17;
        objc_super v18 = "we will remap presses in %{public}@ on a device with buttons on the %{public}@ in %{public}@";
        v19 = v9;
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
        _os_log_impl(&dword_1D85BA000, v19, v20, v18, (uint8_t *)&v23, 0x20u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = BSInterfaceOrientationDescription();
      v11 = (void *)v14;
      unint64_t v15 = self->_buttonsEdge - 1;
      if (v15 > 7) {
        uint64_t v16 = @"(unknown)";
      }
      else {
        uint64_t v16 = off_1E6B08F88[v15];
      }
      v21 = @"LTR";
      int v23 = 138543874;
      uint64_t v24 = v14;
      __int16 v25 = 2114;
      if (layoutDirection == 1) {
        v21 = @"RTL";
      }
      v26 = v16;
      __int16 v27 = 2114;
      v28 = v21;
      objc_super v18 = "presses in %{public}@ don't need remapping on a device with buttons on the %{public}@ in %{public}@";
      v19 = v9;
      os_log_type_t v20 = OS_LOG_TYPE_INFO;
      goto LABEL_18;
    }

    return v7;
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (void)setVolumeButtonRemappingEnabled:(BOOL)a3
{
  if (self->_volumeButtonRemappingEnabled != a3)
  {
    self->_volumeButtonRemappingEnabled = a3;
    if (a3)
    {
      [(id)SBApp addActiveOrientationObserver:self];
      [(SBVolumeButtonEventMapper *)self _resetEffectiveInterfaceOrientation];
    }
    else
    {
      [(id)SBApp removeActiveOrientationObserver:self];
      self->_effectiveInterfaceOrientation = 0;
    }
  }
}

- (BOOL)isPreventingEffectiveInterfaceOrientationChanges
{
  return 0;
}

- (int64_t)effectiveInterfaceOrientation
{
  objc_super v3 = +[SBBacklightController sharedInstance];
  int v4 = [v3 screenIsOn];

  if (v4) {
    return self->_effectiveInterfaceOrientation;
  }
  return BKHIDServicesGetNonFlatDeviceOrientation();
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  unint64_t v12 = __118__SBVolumeButtonEventMapper_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke;
  int v13 = &unk_1E6B08F68;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a3;
  v14[2] = (id)a5;
  uint64_t v8 = MEMORY[0x1D948C7A0](&v10);
  id v9 = (void *)v8;
  if (a4 <= 0.0) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
  }
  else {
    objc_msgSend(MEMORY[0x1E4F42FF0], "animateWithDuration:animations:completion:", &__block_literal_global_297, v8, a4, v10, v11, v12, v13);
  }

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __118__SBVolumeButtonEventMapper_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained[2];
  if ([WeakRetained isPreventingEffectiveInterfaceOrientationChanges])
  {
    int v4 = SBLogButtonsVolume();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int64_t v5 = BSInterfaceOrientationDescription();
      v6 = BSInterfaceOrientationDescription();
      int v12 = 138543618;
      int v13 = v5;
      __int16 v14 = 2114;
      unint64_t v15 = v6;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "effective interface orientation for volume button remapping NOT changing from: %{public}@ to: %{public}@ (it's disabled!)", (uint8_t *)&v12, 0x16u);
    }
LABEL_9:

    goto LABEL_10;
  }
  WeakRetained[2] = *(void *)(a1 + 40);
  int v7 = SBLogButtonsVolume();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = BSInterfaceOrientationDescription();
    id v9 = BSInterfaceOrientationDescription();
    int v12 = 138543618;
    int v13 = v8;
    __int16 v14 = 2114;
    unint64_t v15 = v9;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "effective interface orientation for volume button remapping changing from: %{public}@ to: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  if (*(void *)(a1 + 48) != v3)
  {
    int v4 = SBLogButtonsVolume();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = BSInterfaceOrientationDescription();
      uint64_t v11 = BSInterfaceOrientationDescription();
      int v12 = 138543618;
      int v13 = v10;
      __int16 v14 = 2114;
      unint64_t v15 = v11;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "effective interface orientation for volume button remapping - update had a fromOrientation mismatch, got: %{public}@, expected: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_9;
  }
LABEL_10:
}

+ (BOOL)_shouldInvertVolumeButtonsForLTRRightEdgePadInInterfaceOrientation:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (BOOL)_shouldInvertVolumeButtonsForRTLRightEdgePadInInterfaceOrientation:(int64_t)a3
{
  return ((a3 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

+ (BOOL)_shouldInvertVolumeButtonsForLTRTopEdgePadInInterfaceOrientation:(int64_t)a3
{
  return ((a3 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

+ (BOOL)_shouldInvertVolumeButtonsForRTLTopEdgePadInInterfaceOrientation:(int64_t)a3
{
  return a3 == 4 || a3 == 1;
}

- (void)_hardwareDefaultsChanged
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBVolumeButtonEventMapper *)self isVolumeButtonRemappingEnabled];
  int v4 = +[SBDefaults localDefaults];
  int64_t v5 = [v4 hardwareDefaults];
  -[SBVolumeButtonEventMapper setVolumeButtonRemappingEnabled:](self, "setVolumeButtonRemappingEnabled:", [v5 isNaturalVolumeButtonOrientationEnabled]);

  if (v3 != [(SBVolumeButtonEventMapper *)self isVolumeButtonRemappingEnabled])
  {
    v6 = SBLogButtonsVolume();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_volumeButtonRemappingEnabled) {
        int v7 = @"enabled";
      }
      else {
        int v7 = @"disabled";
      }
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "volume button remapping is now %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_resetEffectiveInterfaceOrientation
{
  self->_effectiveInterfaceOrientation = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
}

- (BOOL)isVolumeButtonRemappingEnabled
{
  return self->_volumeButtonRemappingEnabled;
}

- (void)setEffectiveInterfaceOrientation:(int64_t)a3
{
  self->_effectiveInterfaceOrientation = a3;
}

- (unint64_t)buttonsEdge
{
  return self->_buttonsEdge;
}

- (void)setButtonsEdge:(unint64_t)a3
{
  self->_buttonsEdge = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_int64_t layoutDirection = a3;
}

@end