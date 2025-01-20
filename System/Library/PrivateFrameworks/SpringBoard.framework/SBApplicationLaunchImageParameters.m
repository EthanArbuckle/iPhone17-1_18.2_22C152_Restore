@interface SBApplicationLaunchImageParameters
+ (id)_sanitizedImageNameFromName:(void *)a3 withExtension:(void *)a4 actualExtension:;
+ (id)launchImageParametersFromLaunchImagesInfo:(id)a3 withBundleIdentifier:(id)a4 isMonarchLinked:(BOOL)a5;
+ (id)validInfoPlistOrientationKeys;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSString)defaultPNGName;
- (NSString)extension;
- (NSString)minOSVersionString;
- (SBApplicationLaunchImageParameters)init;
- (id)_initWithDefaultPNGName:(void *)a3 extension:(void *)a4 minOSVersionString:(uint64_t)a5 size:(double)a6 interfaceOrientation:(double)a7;
- (id)description;
- (int64_t)interfaceOrientation;
- (unint64_t)hash;
@end

@implementation SBApplicationLaunchImageParameters

- (SBApplicationLaunchImageParameters)init
{
  return (SBApplicationLaunchImageParameters *)[(SBApplicationLaunchImageParameters *)self _initWithDefaultPNGName:0 extension:0 minOSVersionString:0 size:*MEMORY[0x1E4F1DB30] interfaceOrientation:*(double *)(MEMORY[0x1E4F1DB30] + 8)];
}

- (id)_initWithDefaultPNGName:(void *)a3 extension:(void *)a4 minOSVersionString:(uint64_t)a5 size:(double)a6 interfaceOrientation:(double)a7
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  if (a1)
  {
    if ((unint64_t)(a5 - 1) >= 4)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithDefaultPNGName_extension_minOSVersionString_size_interfaceOrientation_, a1, @"SBApplicationLaunchImageParameters.m", 53, @"orientation=%li is not a valid interfaceOrientation", a5);
    }
    v24.receiver = a1;
    v24.super_class = (Class)SBApplicationLaunchImageParameters;
    a1 = objc_msgSendSuper2(&v24, sel_init);
    if (a1)
    {
      uint64_t v17 = [v13 copy];
      v18 = (void *)*((void *)a1 + 1);
      *((void *)a1 + 1) = v17;

      uint64_t v19 = [v14 copy];
      v20 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v19;

      uint64_t v21 = [v15 copy];
      v22 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v21;

      *((double *)a1 + 4) = a6;
      *((double *)a1 + 5) = a7;
      *((void *)a1 + 6) = a5;
    }
  }

  return a1;
}

+ (id)launchImageParametersFromLaunchImagesInfo:(id)a3 withBundleIdentifier:(id)a4 isMonarchLinked:(BOOL)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v43 = a4;
  if (!v43)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, a1, @"SBApplicationLaunchImageParameters.m", 67, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v61 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v38 = v8;
      v39 = 0;
      uint64_t v12 = *(void *)v47;
      double v13 = *MEMORY[0x1E4F1DB30];
      double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      v44 = v9;
      while (1)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(v9);
          }
          v16 = *(__CFString **)(*((void *)&v46 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = (void *)MEMORY[0x1D948C4D0]();
            v18 = v16;
            uint64_t v19 = [(__CFString *)v18 objectForKey:@"UILaunchImageSize"];
            if (!v19)
            {
              v64.width = 320.0;
              v64.height = 480.0;
              NSStringFromSize(v64);
              uint64_t v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v20 = [(__CFString *)v18 objectForKey:@"UILaunchImageOrientation"];
              if (v20) {
                uint64_t v21 = v20;
              }
              else {
                uint64_t v21 = @"Portrait";
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                || (+[SBApplicationLaunchImageParameters validInfoPlistOrientationKeys](SBApplicationLaunchImageParameters, "validInfoPlistOrientationKeys"), v22 = objc_claimAutoreleasedReturnValue(), char v23 = [v22 containsObject:v21], v22, (v23 & 1) == 0))
              {
                objc_super v24 = XBLogCapture();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138544130;
                  *(void *)&buf[4] = v43;
                  __int16 v51 = 2114;
                  v52 = @"UILaunchImageOrientation";
                  __int16 v53 = 2114;
                  v54 = (__CFString *)v21;
                  __int16 v55 = 2114;
                  v56 = v18;
                  _os_log_debug_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] Incorrect %{public}@ type (requires NSString) or invalid value ('%{public}@'), skipping...\n%{public}@", buf, 0x2Au);
                }
                v9 = v44;
                goto LABEL_49;
              }
              objc_super v24 = [(__CFString *)v18 objectForKey:@"UILaunchImageMinimumOSVersion"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v25 = XBLogCapture();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138544130;
                  *(void *)&buf[4] = v43;
                  __int16 v51 = 2114;
                  v52 = @"UILaunchImageMinimumOSVersion";
                  __int16 v53 = 2114;
                  v54 = (__CFString *)v24;
                  __int16 v55 = 2114;
                  v56 = v18;
                  _os_log_debug_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] Incorrect %{public}@ type (requires NSString) in ('%{public}@'), skipping...\n%{public}@", buf, 0x2Au);
                }
                goto LABEL_48;
              }
              v25 = [(__CFString *)v18 objectForKey:@"UILaunchImageName"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                CGSize v26 = CGSizeFromString(v19);
                if (v26.width == v13 && v26.height == v14)
                {
                  v27 = XBLogCapture();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543874;
                    *(void *)&buf[4] = v43;
                    __int16 v51 = 2114;
                    v52 = (__CFString *)v19;
                    __int16 v53 = 2114;
                    v54 = v18;
                    v28 = v27;
                    v29 = "[.plist ingest] [%{public}@] Invalid size string: %{public}@, skipping...\n%{public}@";
                    uint32_t v30 = 32;
                    goto LABEL_36;
                  }
LABEL_47:

LABEL_48:
                  v9 = v44;

LABEL_49:
LABEL_50:

                  continue;
                }
                uint64_t v32 = XBInterfaceOrientationForString();
                if ((unint64_t)(v32 - 5) < 0xFFFFFFFFFFFFFFFELL || a5 || !BSFloatLessThanFloat())
                {
                  id v45 = 0;
                  v42 = +[SBApplicationLaunchImageParameters _sanitizedImageNameFromName:withExtension:actualExtension:]((uint64_t)SBApplicationLaunchImageParameters, v25, @"png", &v45);
                  uint64_t v41 = v32;
                  v27 = v45;
                  id v33 = [[SBApplicationLaunchImageParameters alloc] _initWithDefaultPNGName:v27 extension:v24 minOSVersionString:v41 size:v26.width interfaceOrientation:v26.height];
                  *(void *)buf = v33;
                  if (v33)
                  {
                    if (v39) {
                      [v39 addObject:v33];
                    }
                    else {
                      v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:buf count:1];
                    }
                  }

                  goto LABEL_47;
                }
                v27 = XBLogCapture();
                if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_47;
                }
                *(_DWORD *)buf = 138544642;
                *(void *)&buf[4] = v43;
                __int16 v51 = 2114;
                v52 = @"UILaunchImageOrientation";
                __int16 v53 = 2114;
                v54 = @"UILaunchImageSize";
                __int16 v55 = 2114;
                v56 = v21;
                __int16 v57 = 2114;
                v58 = v19;
                __int16 v59 = 2114;
                v60 = v18;
                v28 = v27;
                v29 = "[.plist ingest] [%{public}@] Incorrect combination of %{public}@ and %{public}@ ('%{public}@' and "
                      "'%{public}@'), skipping...\n"
                      "%{public}@";
                uint32_t v30 = 62;
              }
              else
              {
                v27 = XBLogCapture();
                if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_47;
                }
                *(_DWORD *)buf = 138544130;
                *(void *)&buf[4] = v43;
                __int16 v51 = 2114;
                v52 = @"UILaunchImageName";
                __int16 v53 = 2114;
                v54 = (__CFString *)v19;
                __int16 v55 = 2114;
                v56 = v18;
                v28 = v27;
                v29 = "[.plist ingest] [%{public}@] Incorrect %{public}@ type (requires NSString) in ('%{public}@'), skip"
                      "ping...\n"
                      "%{public}@";
                uint32_t v30 = 42;
              }
LABEL_36:
              _os_log_debug_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEBUG, v29, buf, v30);
              goto LABEL_47;
            }
            uint64_t v21 = XBLogCapture();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138544130;
              *(void *)&buf[4] = v43;
              __int16 v51 = 2114;
              v52 = @"UILaunchImageSize";
              __int16 v53 = 2114;
              v54 = (__CFString *)v19;
              __int16 v55 = 2114;
              v56 = v18;
              _os_log_debug_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] Incorrect %{public}@ type (requires NSString) in ('%{public}@'), skipping...\n%{public}@", buf, 0x2Au);
            }
            goto LABEL_50;
          }
          v31 = XBLogCapture();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v43;
            __int16 v51 = 2114;
            v52 = v16;
            _os_log_debug_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] Incorrect launchImageInfo format (requires NSDictionary) in ('%{public}@'), skipping...", buf, 0x16u);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v61 count:16];
        if (!v11)
        {
          id v8 = v38;
          v34 = v39;
          goto LABEL_58;
        }
      }
    }
  }
  else
  {
    if (!v8)
    {
      v34 = 0;
      goto LABEL_59;
    }
    v9 = XBLogCapture();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[SBApplicationLaunchImageParameters launchImageParametersFromLaunchImagesInfo:withBundleIdentifier:isMonarchLinked:]((uint64_t)v43, (uint64_t)v8, v9);
    }
  }
  v34 = 0;
LABEL_58:

LABEL_59:
  v35 = (void *)[v34 copy];

  return v35;
}

+ (id)_sanitizedImageNameFromName:(void *)a3 withExtension:(void *)a4 actualExtension:
{
  id v6 = a2;
  id v7 = a3;
  self;
  id v8 = [v6 pathExtension];
  v9 = v8;
  if (v8 && [v8 length])
  {
    id v10 = v9;

    uint64_t v11 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") + ~objc_msgSend(v10, "length"));

    id v7 = v10;
    id v6 = (id)v11;
  }
  if (a4) {
    *a4 = v7;
  }

  return v6;
}

+ (id)validInfoPlistOrientationKeys
{
  v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FA5928];
  v6[0] = *MEMORY[0x1E4FA5920];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4FA5910];
  v6[2] = *MEMORY[0x1E4FA5908];
  v6[3] = v3;
  v6[4] = *MEMORY[0x1E4FA5918];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_defaultPNGName];
  id v5 = (id)[v3 appendObject:self->_extension];
  id v6 = (id)[v3 appendObject:self->_minOSVersionString];
  id v7 = (id)objc_msgSend(v3, "appendCGSize:", self->_size.width, self->_size.height);
  id v8 = (id)[v3 appendInteger:self->_interfaceOrientation];
  unint64_t v9 = [v3 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  defaultPNGName = self->_defaultPNGName;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __46__SBApplicationLaunchImageParameters_isEqual___block_invoke;
  v29[3] = &unk_1E6AFD560;
  id v7 = v4;
  id v30 = v7;
  id v8 = (id)[v5 appendString:defaultPNGName counterpart:v29];
  extension = self->_extension;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_2;
  v27[3] = &unk_1E6AFD560;
  id v10 = v7;
  id v28 = v10;
  id v11 = (id)[v5 appendString:extension counterpart:v27];
  minOSVersionString = self->_minOSVersionString;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_3;
  v25[3] = &unk_1E6AFD560;
  id v13 = v10;
  id v26 = v13;
  id v14 = (id)[v5 appendString:minOSVersionString counterpart:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_4;
  v23[3] = &unk_1E6B07480;
  id v15 = v13;
  id v24 = v15;
  id v16 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v23, self->_size.width, self->_size.height);
  int64_t interfaceOrientation = self->_interfaceOrientation;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_5;
  v21[3] = &unk_1E6AF9660;
  id v22 = v15;
  id v18 = v15;
  id v19 = (id)[v5 appendInteger:interfaceOrientation counterpart:v21];
  LOBYTE(interfaceOrientation) = [v5 isEqual];

  return interfaceOrientation;
}

id __46__SBApplicationLaunchImageParameters_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

double __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 32);
}

uint64_t __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_5(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 48);
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __49__SBApplicationLaunchImageParameters_description__block_invoke;
  id v11 = &unk_1E6AF5290;
  id v12 = v3;
  id v13 = self;
  id v4 = v3;
  id v5 = (id)[v4 modifyProem:&v8];
  id v6 = objc_msgSend(v4, "build", v8, v9, v10, v11);

  return v6;
}

void __49__SBApplicationLaunchImageParameters_description__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"name" skipIfNil:1];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"ext" skipIfNil:1];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"minOS" skipIfNil:1];
  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", @"size", *(double *)(*(void *)(a1 + 40) + 32), *(double *)(*(void *)(a1 + 40) + 40));
  id v6 = *(void **)(a1 + 32);
  XBStringForInterfaceOrientation();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = (id)[v6 appendObject:v8 withName:0];
}

- (NSString)defaultPNGName
{
  return self->_defaultPNGName;
}

- (NSString)extension
{
  return self->_extension;
}

- (NSString)minOSVersionString
{
  return self->_minOSVersionString;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minOSVersionString, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_defaultPNGName, 0);
}

+ (void)launchImageParametersFromLaunchImagesInfo:(uint64_t)a1 withBundleIdentifier:(uint64_t)a2 isMonarchLinked:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] Incorrect launchImagesInfo format (requires NSArray) in ('%{public}@'), skipping...", (uint8_t *)&v3, 0x16u);
}

@end