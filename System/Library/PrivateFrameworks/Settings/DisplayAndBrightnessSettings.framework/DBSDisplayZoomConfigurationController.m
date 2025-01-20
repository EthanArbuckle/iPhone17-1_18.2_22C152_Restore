@interface DBSDisplayZoomConfigurationController
+ (DBSDisplayZoomConfigurationController)defaultController;
- (id)currentDisplayZoomMode;
- (id)displayZoomModes;
- (void)setDisplayZoomMode:(id)a3 withRelaunchURL:(id)a4;
- (void)setDisplayZoomMode:(id)a3 withRelaunchURL:(id)a4 transitionWithScreenshot:(BOOL)a5;
@end

@implementation DBSDisplayZoomConfigurationController

+ (DBSDisplayZoomConfigurationController)defaultController
{
  if (defaultController_onceToken != -1) {
    dispatch_once(&defaultController_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)defaultController__defaultController;
  return (DBSDisplayZoomConfigurationController *)v2;
}

uint64_t __58__DBSDisplayZoomConfigurationController_defaultController__block_invoke()
{
  defaultController__defaultController = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)currentDisplayZoomMode
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__DBSDisplayZoomConfigurationController_currentDisplayZoomMode__block_invoke;
  block[3] = &unk_264C7A6B0;
  block[4] = self;
  if (currentDisplayZoomMode_onceToken != -1) {
    dispatch_once(&currentDisplayZoomMode_onceToken, block);
  }
  return (id)currentDisplayZoomMode__currentDisplayZoomMode;
}

void __63__DBSDisplayZoomConfigurationController_currentDisplayZoomMode__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (DBSGetMobileFrameBuffer())
  {
    uint64_t v2 = 0;
    int v1 = 0;
    IOMobileFramebufferGetCanvasSizes();
    v0 = DBSLogForCategory(1uLL);
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __63__DBSDisplayZoomConfigurationController_currentDisplayZoomMode__block_invoke_cold_1(v0);
    }
  }
}

- (id)displayZoomModes
{
  if (displayZoomModes_onceToken != -1) {
    dispatch_once(&displayZoomModes_onceToken, &__block_literal_global_15);
  }
  uint64_t v2 = (void *)displayZoomModes__displayZoomModes;
  return v2;
}

void __57__DBSDisplayZoomConfigurationController_displayZoomModes__block_invoke()
{
  id v81 = (id)MGCopyAnswer();
  v0 = [v81 objectForKeyedSubscript:@"default"];
  int v1 = [v81 objectForKeyedSubscript:@"zoomed"];
  uint64_t v2 = [v81 objectForKeyedSubscript:@"dense"];
  uint64_t v3 = [v81 objectForKeyedSubscript:@"denser"];
  v4 = objc_opt_new();
  if ([v0 count] == 4)
  {
    v5 = [v0 objectAtIndexedSubscript:0];
    [v5 floatValue];
    double v7 = v6;

    v8 = [v0 objectAtIndexedSubscript:1];
    [v8 floatValue];
    double v10 = v9;

    v11 = [v0 objectAtIndexedSubscript:2];
    [v11 floatValue];
    double v13 = v12;

    v14 = [v0 objectAtIndexedSubscript:3];
    [v14 floatValue];
    double v16 = v15;

    v17 = [DBSDisplayZoomMode alloc];
    v18 = DBS_LocalizedStringForMagnify(@"STANDARD");
    v19 = -[DBSDisplayZoomMode initWithDisplayZoomOption:localizedName:size:](v17, "initWithDisplayZoomOption:localizedName:size:", 0, v18, v7 * v10, v13 * v16);

    v20 = DBSStringForDisplayZoomOption(0);
    [v4 setObject:v19 forKeyedSubscript:v20];
  }
  if ([v1 count] == 4)
  {
    v21 = [v1 objectAtIndexedSubscript:0];
    [v21 floatValue];
    double v23 = v22;

    v24 = [v1 objectAtIndexedSubscript:1];
    [v24 floatValue];
    double v26 = v25;

    v27 = [v1 objectAtIndexedSubscript:2];
    [v27 floatValue];
    double v29 = v28;

    v30 = [v1 objectAtIndexedSubscript:3];
    [v30 floatValue];
    double v32 = v31;

    v33 = [DBSDisplayZoomMode alloc];
    v34 = DBS_LocalizedStringForMagnify(@"ZOOMED");
    v35 = -[DBSDisplayZoomMode initWithDisplayZoomOption:localizedName:size:](v33, "initWithDisplayZoomOption:localizedName:size:", 1, v34, v23 * v26, v29 * v32);

    v36 = DBSStringForDisplayZoomOption(1);
    [v4 setObject:v35 forKeyedSubscript:v36];
  }
  if (DBSReverseZoomEnabled())
  {
    if ([v2 count] == 4)
    {
      v37 = [v2 objectAtIndexedSubscript:0];
      [v37 floatValue];
      double v39 = v38;

      v40 = [v2 objectAtIndexedSubscript:1];
      [v40 floatValue];
      double v42 = v41;

      v43 = [v2 objectAtIndexedSubscript:2];
      [v43 floatValue];
      double v45 = v44;

      v46 = [v2 objectAtIndexedSubscript:3];
      [v46 floatValue];
      double v48 = v47;

      v49 = [DBSDisplayZoomMode alloc];
      v50 = DBS_LocalizedStringForMagnify(@"DENSE");
      v51 = -[DBSDisplayZoomMode initWithDisplayZoomOption:localizedName:size:](v49, "initWithDisplayZoomOption:localizedName:size:", 2, v50, v39 * v42, v45 * v48);

      v52 = DBSStringForDisplayZoomOption(2);
      [v4 setObject:v51 forKeyedSubscript:v52];
    }
    if (DBSMostDisplaySpaceEnabled() && [v3 count] == 4)
    {
      v53 = [v3 objectAtIndexedSubscript:0];
      [v53 floatValue];
      double v55 = v54;

      v56 = [v3 objectAtIndexedSubscript:1];
      [v56 floatValue];
      double v58 = v57;

      v59 = [v3 objectAtIndexedSubscript:2];
      [v59 floatValue];
      double v61 = v60;

      v62 = [v3 objectAtIndexedSubscript:3];
      [v62 floatValue];
      double v64 = v63;

      v65 = [DBSDisplayZoomMode alloc];
      v66 = DBS_LocalizedStringForMagnify(@"DENSER");
      v67 = -[DBSDisplayZoomMode initWithDisplayZoomOption:localizedName:size:](v65, "initWithDisplayZoomOption:localizedName:size:", 3, v66, v55 * v58, v61 * v64);

      v68 = DBSStringForDisplayZoomOption(3);
      [v4 setObject:v67 forKeyedSubscript:v68];
    }
  }
  v69 = DBSStringForDisplayZoomOption(1);
  v70 = [v4 objectForKeyedSubscript:v69];

  v71 = DBSStringForDisplayZoomOption(2);
  v72 = [v4 objectForKeyedSubscript:v71];

  [v70 size];
  double v74 = v73;
  double v76 = v75;
  [v72 size];
  if (v74 == v78 && v76 == v77)
  {
    v79 = DBSStringForDisplayZoomOption(1);
    [v4 removeObjectForKey:v79];
  }
  v80 = (void *)displayZoomModes__displayZoomModes;
  displayZoomModes__displayZoomModes = (uint64_t)v4;
}

- (void)setDisplayZoomMode:(id)a3 withRelaunchURL:(id)a4
{
}

- (void)setDisplayZoomMode:(id)a3 withRelaunchURL:(id)a4 transitionWithScreenshot:(BOOL)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  float v9 = DBSLogForCategory(1uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = DBSStringForDisplayZoomOption([v7 displayZoomOption]);
    [v7 size];
    v11 = NSStringFromCGSize(v24);
    *(_DWORD *)buf = 136315650;
    v18 = "-[DBSDisplayZoomConfigurationController setDisplayZoomMode:withRelaunchURL:transitionWithScreenshot:]";
    __int16 v19 = 2114;
    v20 = v10;
    __int16 v21 = 2114;
    float v22 = v11;
    _os_log_impl(&dword_235D7B000, v9, OS_LOG_TYPE_DEFAULT, "%s: Setting new canvas size (option: '%{public}@', size: '%{public}@').", buf, 0x20u);
  }
  DBSGetMobileFrameBuffer();
  [v7 size];
  IOMobileFramebufferSetCanvasSize();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"DBSMagnifyModeDidChangeNotification", 0, 0, 1u);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __101__DBSDisplayZoomConfigurationController_setDisplayZoomMode_withRelaunchURL_transitionWithScreenshot___block_invoke;
  v14[3] = &unk_264C7A870;
  BOOL v16 = a5;
  id v15 = v8;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __101__DBSDisplayZoomConfigurationController_setDisplayZoomMode_withRelaunchURL_transitionWithScreenshot___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = 3;
  }
  else {
    uint64_t v1 = 1;
  }
  id v4 = [MEMORY[0x263F793E8] actionWithReason:@"magnify mode" options:v1 targetURL:*(void *)(a1 + 32)];
  uint64_t v2 = [MEMORY[0x263F3F808] sharedService];
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithObject:v4];
  [v2 sendActions:v3 withResult:0];
}

void __63__DBSDisplayZoomConfigurationController_currentDisplayZoomMode__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[DBSDisplayZoomConfigurationController currentDisplayZoomMode]_block_invoke";
  _os_log_error_impl(&dword_235D7B000, log, OS_LOG_TYPE_ERROR, "%s: Failed to establish connection to framebuffer (device, no error).", (uint8_t *)&v1, 0xCu);
}

@end