@interface PSTorchSettingsDetail
+ (BOOL)isEnabled;
+ (id)iconImage;
+ (id)preferencesURL;
+ (int64_t)torchState;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation PSTorchSettingsDetail

+ (id)preferencesURL
{
  return 0;
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithTypeIdentifier:", @"com.apple.graphic-icon.gear");
}

+ (int64_t)torchState
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F16440] defaultDeviceWithMediaType:*MEMORY[0x1E4F15C18]];
  if ([v2 hasTorch]) {
    int64_t v3 = [v2 isTorchAvailable];
  }
  else {
    int64_t v3 = -1;
  }
  v4 = _PSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, "########### Torch state (%d)", (uint8_t *)v6, 8u);
  }

  return v3;
}

+ (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F16440] defaultDeviceWithMediaType:*MEMORY[0x1E4F15C18]];
  if ([v4 isTorchModeSupported:v3])
  {
    id v13 = 0;
    int v5 = [v4 lockForConfiguration:&v13];
    id v6 = v13;
    v8 = v6;
    if (v5)
    {
      if (v3)
      {
        LODWORD(v7) = *MEMORY[0x1E4F15870];
        id v12 = v6;
        [v4 setTorchModeOnWithLevel:&v12 error:v7];
        id v9 = v12;

        v8 = v9;
      }
      else
      {
        [v4 setTorchMode:0];
      }
      [v4 unlockForConfiguration];
    }
    v10 = _PSLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = @"OFF";
      if (v3) {
        v11 = @"ON";
      }
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      __int16 v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1A6597000, v10, OS_LOG_TYPE_DEFAULT, "########### Tried to set torch (%@) Error: %@", buf, 0x16u);
    }
  }
}

+ (BOOL)isEnabled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F16440] defaultDeviceWithMediaType:*MEMORY[0x1E4F15C18]];
  if ([v2 isTorchAvailable]) {
    BOOL v3 = [v2 torchMode] == 1;
  }
  else {
    BOOL v3 = 0;
  }
  v4 = _PSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = @"OFF";
    if (v3) {
      int v5 = @"ON";
    }
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, "########### Torch enabled (%@)", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

@end