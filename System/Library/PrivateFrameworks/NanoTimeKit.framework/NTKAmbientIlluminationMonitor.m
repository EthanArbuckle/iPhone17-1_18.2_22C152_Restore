@interface NTKAmbientIlluminationMonitor
- (NTKAmbientIlluminationMonitor)init;
- (NTKAmbientIlluminationMonitorDelegate)delegate;
- (double)ambientLux;
- (double)displayNits;
- (void)_registerForNotifications;
- (void)_setAmbientLux:(double)a3;
- (void)_setDisplayNits:(double)a3;
- (void)_unregisterForNotifications;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation NTKAmbientIlluminationMonitor

- (NTKAmbientIlluminationMonitor)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NTKAmbientIlluminationMonitor;
  v2 = [(NTKAmbientIlluminationMonitor *)&v7 init];
  if (v2)
  {
    v3 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E4F5B290]);
    brightnessSystemClient = v2->_brightnessSystemClient;
    v2->_brightnessSystemClient = v3;

    v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = v2;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode Illumination monitor init", buf, 0xCu);
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode Illumination monitor dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NTKAmbientIlluminationMonitor;
  [(NTKAmbientIlluminationMonitor *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    if (obj)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);

      if (!v6) {
        [(NTKAmbientIlluminationMonitor *)self _registerForNotifications];
      }
    }
    else
    {
      [(NTKAmbientIlluminationMonitor *)self _unregisterForNotifications];
    }
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
  }
}

- (void)_registerForNotifications
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  brightnessSystemClient = self->_brightnessSystemClient;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __58__NTKAmbientIlluminationMonitor__registerForNotifications__block_invoke;
  v21 = &unk_1E62C1360;
  objc_copyWeak(&v22, &location);
  [(BrightnessSystemClient *)brightnessSystemClient registerNotificationBlock:&v18 forProperties:&unk_1F16E8C38];
  objc_super v4 = (void *)[(BrightnessSystemClient *)self->_brightnessSystemClient copyPropertyForKey:@"TrustedLux", v18, v19, v20, v21];
  v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode Illumination monitor initial lux %@", buf, 0x16u);
  }

  if (v4) {
    [v4 doubleValue];
  }
  else {
    double v6 = -1.0;
  }
  self->_ambientLux = v6;
  uint64_t v7 = (void *)[(BrightnessSystemClient *)self->_brightnessSystemClient copyPropertyForKey:@"DisplayBrightness"];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  v12 = [v11 objectForKey:@"NitsPhysical"];
  uint64_t v13 = objc_opt_class();
  id v14 = v12;
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  id v16 = v15;

  if (v16) {
    [v16 doubleValue];
  }
  else {
    double v17 = -1.0;
  }
  self->_displayNits = v17;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __58__NTKAmbientIlluminationMonitor__registerForNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  id v6 = a3;
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ([v5 isEqualToString:@"TrustedLux"])
    {
      uint64_t v8 = objc_opt_class();
      id v9 = v6;
      if (v8)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
      id v14 = v10;

      if (!v14) {
        goto LABEL_59;
      }
      [v14 doubleValue];
      double v16 = WeakRetained[3];
      double v17 = fabs(v15);
      BOOL v18 = v17 < 0.00000011920929;
      double v19 = fabs(v16);
      if (v19 >= 0.00000011920929) {
        BOOL v18 = 0;
      }
      if (v17 < 0.00000011920929 || v19 < 0.00000011920929) {
        goto LABEL_30;
      }
      BOOL v18 = v15 == -1.0;
      if (v16 != -1.0) {
        BOOL v18 = 0;
      }
      if (v15 == -1.0 || v16 == -1.0)
      {
LABEL_30:
        if (!v18)
        {
LABEL_27:
          v21 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = (void *)*((void *)WeakRetained + 2);
            *(_DWORD *)buf = 134218498;
            v41 = WeakRetained;
            __int16 v42 = 2112;
            v43 = v14;
            __int16 v44 = 2048;
            id v45 = v22;
            _os_log_impl(&dword_1BC5A9000, v21, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode Illumination monitor received lux %@ (skipped %lu)", buf, 0x20u);
          }

          WeakRetained[2] = 0.0;
          [v14 doubleValue];
          *((void *)WeakRetained + 3) = v23;
          goto LABEL_32;
        }
      }
      else
      {
        double v20 = v15 / v16 + -1.0;
        if (v20 < 0.0) {
          double v20 = -v20;
        }
        if (v20 >= 0.05) {
          goto LABEL_27;
        }
      }
      ++*((void *)WeakRetained + 2);
LABEL_32:
      id v14 = v14;
      BSDispatchMain();

      goto LABEL_59;
    }
    if (![v5 isEqualToString:@"DisplayBrightness"])
    {
      id v14 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v41 = WeakRetained;
        __int16 v42 = 2112;
        v43 = v5;
        __int16 v44 = 2112;
        id v45 = v6;
        _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode Illumination monitor received key %@ with value %@", buf, 0x20u);
      }
      goto LABEL_59;
    }
    uint64_t v11 = objc_opt_class();
    id v12 = v6;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    id v14 = v13;

    v24 = [v14 objectForKey:@"NitsPhysical"];

    if (!v24)
    {
LABEL_59:

      goto LABEL_60;
    }
    v25 = [v14 objectForKey:@"NitsPhysical"];
    uint64_t v26 = objc_opt_class();
    id v27 = v25;
    if (v26)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = 0;
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
    v29 = v28;

    if (!v29)
    {
LABEL_58:

      goto LABEL_59;
    }
    [v29 doubleValue];
    double v31 = WeakRetained[5];
    double v32 = fabs(v30);
    BOOL v33 = v32 < 0.00000011920929;
    double v34 = fabs(v31);
    if (v34 >= 0.00000011920929) {
      BOOL v33 = 0;
    }
    if (v32 < 0.00000011920929 || v34 < 0.00000011920929) {
      goto LABEL_55;
    }
    BOOL v33 = v30 == -1.0;
    if (v31 != -1.0) {
      BOOL v33 = 0;
    }
    if (v30 == -1.0 || v31 == -1.0)
    {
LABEL_55:
      if (!v33)
      {
LABEL_52:
        v36 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = (void *)*((void *)WeakRetained + 4);
          *(_DWORD *)buf = 134218498;
          v41 = WeakRetained;
          __int16 v42 = 2112;
          v43 = v29;
          __int16 v44 = 2048;
          id v45 = v37;
          _os_log_impl(&dword_1BC5A9000, v36, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode Illumination monitor received nits %@ (skipped %lu)", buf, 0x20u);
        }

        WeakRetained[4] = 0.0;
        [v29 doubleValue];
        *((void *)WeakRetained + 5) = v38;
        goto LABEL_57;
      }
    }
    else
    {
      double v35 = v30 / v31 + -1.0;
      if (v35 < 0.0) {
        double v35 = -v35;
      }
      if (v35 >= 0.1) {
        goto LABEL_52;
      }
    }
    ++*((void *)WeakRetained + 4);
LABEL_57:
    v39 = v29;
    BSDispatchMain();

    goto LABEL_58;
  }
LABEL_60:
}

uint64_t __58__NTKAmbientIlluminationMonitor__registerForNotifications__block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) doubleValue];
  return objc_msgSend(v1, "_setAmbientLux:");
}

uint64_t __58__NTKAmbientIlluminationMonitor__registerForNotifications__block_invoke_14(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) doubleValue];
  return objc_msgSend(v1, "_setDisplayNits:");
}

- (void)_unregisterForNotifications
{
}

- (void)_setAmbientLux:(double)a3
{
  self->_ambientLux = a3;
  if (a3 < 0.0)
  {
    v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "AutoNightMode negative ambient lux", buf, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained ambientIlluminationMonitor:self receivedAmbientLux:a3];

  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  if (!v7)
  {
    uint64_t v8 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "AutoNightMode delegate is gone", v9, 2u);
    }
  }
}

- (void)_setDisplayNits:(double)a3
{
  self->_displayNits = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained ambientIlluminationMonitor:self receivedDisplayNits:a3];

  id v7 = objc_loadWeakRetained((id *)p_delegate);
  if (!v7)
  {
    uint64_t v8 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "AutoNightMode delegate is gone", v9, 2u);
    }
  }
}

- (double)ambientLux
{
  return self->_ambientLux;
}

- (double)displayNits
{
  return self->_displayNits;
}

- (NTKAmbientIlluminationMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKAmbientIlluminationMonitorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
}

@end