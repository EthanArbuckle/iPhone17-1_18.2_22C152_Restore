@interface NUPlatform
+ (id)currentPlatform;
- (BOOL)defaultSupportsLiveVideoRendering;
- (BOOL)hasDiscreteGPU;
- (BOOL)hasExtendedColorDisplay;
- (BOOL)hasHeadlessGPU;
- (BOOL)supportsANE;
- (BOOL)supportsAutomaticGraphicsSwitching;
- (BOOL)supportsLiveVideoRendering;
- (NSArray)devices;
- (NSArray)displays;
- (NSString)name;
- (NUDevice)cpuDevice;
- (NUDevice)discreteDevice;
- (NUDevice)headlessDevice;
- (NUDevice)integratedDevice;
- (NUDevice)mainDevice;
- (NUDisplay)mainDisplay;
- (id)currentDevice;
- (id)debugDescription;
- (id)deviceForDisplay:(id)a3;
- (id)deviceForMetalDevice:(id)a3;
- (id)displayWithIdentifier:(id)a3;
- (void)clearCaches;
- (void)setCpuDevice:(id)a3;
- (void)setDevices:(id)a3;
- (void)setDiscreteDevice:(id)a3;
- (void)setHasExtendedColorDisplay:(BOOL)a3;
- (void)setHasHeadlessGPU:(BOOL)a3;
- (void)setHeadlessDevice:(id)a3;
- (void)setIntegratedDevice:(id)a3;
- (void)setName:(id)a3;
- (void)setSupportsAutomaticGraphicsSwitching:(BOOL)a3;
@end

@implementation NUPlatform

+ (id)currentPlatform
{
  v2 = +[NUFactory sharedFactory];
  v3 = [v2 platform];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpuDevice, 0);
  objc_storeStrong((id *)&self->_headlessDevice, 0);
  objc_storeStrong((id *)&self->_discreteDevice, 0);
  objc_storeStrong((id *)&self->_integratedDevice, 0);
  objc_storeStrong((id *)&self->_devices, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)supportsANE
{
  return self->_supportsANE;
}

- (void)setHasExtendedColorDisplay:(BOOL)a3
{
  self->_hasExtendedColorDisplay = a3;
}

- (BOOL)hasExtendedColorDisplay
{
  return self->_hasExtendedColorDisplay;
}

- (void)setCpuDevice:(id)a3
{
}

- (NUDevice)cpuDevice
{
  return self->_cpuDevice;
}

- (void)setHeadlessDevice:(id)a3
{
}

- (NUDevice)headlessDevice
{
  return self->_headlessDevice;
}

- (void)setHasHeadlessGPU:(BOOL)a3
{
  self->_hasHeadlessGPU = a3;
}

- (BOOL)hasHeadlessGPU
{
  return self->_hasHeadlessGPU;
}

- (BOOL)hasDiscreteGPU
{
  return self->_hasDiscreteGPU;
}

- (void)setDiscreteDevice:(id)a3
{
}

- (NUDevice)discreteDevice
{
  return self->_discreteDevice;
}

- (void)setIntegratedDevice:(id)a3
{
}

- (NUDevice)integratedDevice
{
  return self->_integratedDevice;
}

- (void)setSupportsAutomaticGraphicsSwitching:(BOOL)a3
{
  self->_supportsAutomaticGraphicsSwitching = a3;
}

- (BOOL)supportsAutomaticGraphicsSwitching
{
  return self->_supportsAutomaticGraphicsSwitching;
}

- (void)setDevices:(id)a3
{
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (id)deviceForMetalDevice:(id)a3
{
  id v4 = a3;
  v5 = [(NUPlatform *)self devices];
  v9 = v4;
  id v6 = v4;
  v7 = PFFind();

  return v7;
}

BOOL __35__NUPlatform_deviceForMetalDevice___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 metalDevice];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (BOOL)supportsLiveVideoRendering
{
  return +[NUGlobalSettings renderVideoLive];
}

- (BOOL)defaultSupportsLiveVideoRendering
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = NSString;
    BOOL v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v10 = (void *)MEMORY[0x1E4F29060];
    v11 = v9;
    v12 = [v10 callStackSymbols];
    v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  v11 = v14;
  v18 = [v16 callStackSymbols];
  v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  __int16 v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUPlatform defaultSupportsLiveVideoRendering]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUPlatform.m", 84, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (id)displayWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = [(NUPlatform *)self displays];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v11 = [v10 identifier];
          char v12 = [v11 isEqual:v4];

          if (v12)
          {
            id v13 = v10;

            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v13 = 0;
  }
  else
  {
    id v13 = [(NUPlatform *)self mainDisplay];
  }
LABEL_13:

  return v13;
}

- (NUDisplay)mainDisplay
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = NSString;
    id v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v10 = (void *)MEMORY[0x1E4F29060];
    v11 = v9;
    char v12 = [v10 callStackSymbols];
    id v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  long long v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  v11 = v14;
  long long v18 = [v16 callStackSymbols];
  v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  __int16 v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUPlatform mainDisplay]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUPlatform.m", 64, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (NSArray)displays
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = NSString;
    id v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v10 = (void *)MEMORY[0x1E4F29060];
    v11 = v9;
    char v12 = [v10 callStackSymbols];
    id v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  long long v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  v11 = v14;
  long long v18 = [v16 callStackSymbols];
  v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  __int16 v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUPlatform displays]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUPlatform.m", 59, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (void)clearCaches
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  +[NUCacheNode clearCacheDirectory];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(NUPlatform *)self devices];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) clearCaches];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)deviceForDisplay:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
  }
  uint64_t v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSString;
    uint64_t v6 = v4;
    uint64_t v7 = (objc_class *)objc_opt_class();
    long long v8 = NSStringFromClass(v7);
    long long v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    long long v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    char v12 = (void *)MEMORY[0x1E4F29060];
    uint64_t v13 = v11;
    v14 = [v12 callStackSymbols];
    long long v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  long long v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  long long v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  uint64_t v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  _NUAssertFailHandler((uint64_t)"-[NUPlatform deviceForDisplay:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUPlatform.m", 46, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v24, v25, v26, v27, v23);
}

- (id)currentDevice
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  id v3 = [v2 threadDictionary];

  uint64_t v4 = [v3 objectForKeyedSubscript:@"NUPlatform.currentDevice"];

  return v4;
}

- (NUDevice)mainDevice
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v3 = NSString;
    uint64_t v4 = v2;
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15520);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    long long v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F29060];
    long long v11 = v9;
    char v12 = [v10 callStackSymbols];
    uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  long long v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  long long v11 = v14;
  long long v18 = [v16 callStackSymbols];
  id v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v27 = specific;
  __int16 v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUPlatform mainDevice]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUPlatform.m", 34, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (id)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(NUPlatform *)self name];
  uint64_t v6 = [(NUPlatform *)self devices];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p name:%@ devices: %@>", v4, self, v5, v6];

  return v7;
}

void __51__NUPlatform_iOS_defaultSupportsLiveVideoRendering__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) mainDevice];
  defaultSupportsLiveVideoRendering_canRenderLiveVideo = (unint64_t)[v1 family] > 2;
}

@end