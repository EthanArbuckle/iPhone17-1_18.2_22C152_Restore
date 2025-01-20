@interface DADiagnosticResponder
- (void)enableVolumeHUD:(BOOL)a3;
- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4;
@end

@implementation DADiagnosticResponder

- (void)enableVolumeHUD:(BOOL)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__DADiagnosticResponder_enableVolumeHUD___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __41__DADiagnosticResponder_enableVolumeHUD___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  v3 = [v2 connectedScenes];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v9, "_setSystemVolumeHUDEnabled:", *(unsigned __int8 *)(a1 + 32), (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  uint64_t v6 = dispatch_queue_create("com.apple.Diagnostics.brightnessQueue", 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke;
  block[3] = &__block_descriptor_37_e5_v8__0l;
  BOOL v9 = a4;
  float v8 = a3;
  dispatch_async(v6, block);
}

void __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 36))
  {
    BKSDisplayBrightnessGetCurrent();
    float v3 = v2;
    float v4 = *(float *)(a1 + 32);
    if (v3 >= v4)
    {
      if (v3 > v4)
      {
        float v8 = 0.0002;
        do
        {
          dispatch_time_t v9 = dispatch_time(0, (uint64_t)(float)(v8 * 1000000000.0));
          long long v10 = dispatch_get_global_queue(-2, 0);
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_4;
          v13[3] = &__block_descriptor_36_e5_v8__0l;
          float v14 = v3;
          dispatch_after(v9, v10, v13);

          float v8 = v8 + 0.0002;
          float v3 = v3 + -0.01;
        }
        while (v3 > *(float *)(a1 + 32));
      }
    }
    else
    {
      float v5 = 0.0002;
      do
      {
        dispatch_time_t v6 = dispatch_time(0, (uint64_t)(float)(v5 * 1000000000.0));
        uint64_t v7 = dispatch_get_global_queue(-2, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_2;
        block[3] = &__block_descriptor_36_e5_v8__0l;
        float v16 = v3;
        dispatch_after(v6, v7, block);

        float v5 = v5 + 0.0002;
        float v3 = v3 + 0.01;
      }
      while (v3 < *(float *)(a1 + 32));
    }
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_6;
    v11[3] = &__block_descriptor_36_e5_v8__0l;
    int v12 = *(_DWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
}

void __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_3;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v2 = *(_DWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_3(uint64_t a1)
{
  return MEMORY[0x270F10448](0, *(float *)(a1 + 32));
}

void __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_5;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v2 = *(_DWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_5(uint64_t a1)
{
  return MEMORY[0x270F10448](0, *(float *)(a1 + 32));
}

uint64_t __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_6(uint64_t a1)
{
  return MEMORY[0x270F10448](0, *(float *)(a1 + 32));
}

@end