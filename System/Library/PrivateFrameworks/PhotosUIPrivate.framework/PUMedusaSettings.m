@interface PUMedusaSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
+ (void)runSizeTest;
- (double)_desiredWidth;
- (double)_testIncrement;
- (double)_testInterval;
- (double)_testStartDelay;
- (double)_widthDelay;
- (id)parentSettings;
- (void)set_desiredWidth:(double)a3;
- (void)set_testIncrement:(double)a3;
- (void)set_testInterval:(double)a3;
- (void)set_testStartDelay:(double)a3;
- (void)set_widthDelay:(double)a3;
@end

@implementation PUMedusaSettings

+ (void)runSizeTest
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:sel_runSizeTest object:0];
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  v4 = [v3 windows];
  id v20 = [v4 firstObject];

  int v5 = _isShrinking;
  v6 = [a1 sharedInstance];
  [v6 _testIncrement];
  if (v5) {
    double v8 = -v7;
  }
  else {
    double v8 = v7;
  }

  [v20 bounds];
  double v10 = v8 + v9;
  [v20 bounds];
  double height = v22.size.height;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v10;
  if (CGRectGetWidth(v22) >= 320.0)
  {
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = v10;
    v23.size.double height = height;
    double Width = CGRectGetWidth(v23);
    v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 bounds];
    double v15 = v14;

    if (Width > v15)
    {
      v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v16 bounds];
      double v18 = v17;

      _isShrinking = 1;
      objc_msgSend(v20, "_adjustSizeClassesAndResizeWindowToFrame:", 0.0, 0.0, v18, height);
      goto LABEL_9;
    }
  }
  else
  {
    _isShrinking = 0;
    double v10 = 320.0;
  }
  objc_msgSend(v20, "_adjustSizeClassesAndResizeWindowToFrame:", 0.0, 0.0, v10, height);
  v19 = [a1 sharedInstance];
  [v19 _testInterval];
  objc_msgSend(a1, "performSelector:withObject:afterDelay:", sel_runSizeTest, 0);

LABEL_9:
}

+ (id)settingsControllerModule
{
  v45[1] = *MEMORY[0x1E4F143B8];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __44__PUMedusaSettings_settingsControllerModule__block_invoke;
  v41[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v41[4] = a1;
  v38 = [MEMORY[0x1E4F94190] actionWithHandler:v41];
  v3 = (void *)MEMORY[0x1E4F94160];
  v4 = [MEMORY[0x1E4F940F8] rowWithTitle:@"Cancel Test" action:v38];
  v45[0] = v4;
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  v37 = [v3 sectionWithRows:v5];

  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Increment/Decrement by" valueKeyPath:@"_testIncrement"];
  double v7 = [v6 between:0.0 and:100.0];

  [v7 setPrecision:1];
  v36 = v7;
  [v7 setValueValidatator:&__block_literal_global_17];
  double v8 = [MEMORY[0x1E4F94148] rowWithTitle:@"Increment Interval" valueKeyPath:@"_testInterval"];
  double v9 = [v8 between:0.0 and:5.0];

  [v9 setPrecision:2];
  double v10 = [MEMORY[0x1E4F94108] rowWithTitle:@"Start Delay" valueKeyPath:@"_testStartDelay"];
  v35 = [v10 possibleValues:&unk_1F078AE50 titles:&unk_1F078AE68];

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __44__PUMedusaSettings_settingsControllerModule__block_invoke_53;
  v40[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v40[4] = a1;
  v34 = [MEMORY[0x1E4F94190] actionWithHandler:v40];
  v11 = (void *)MEMORY[0x1E4F94160];
  v44[0] = v7;
  v44[1] = v9;
  v44[2] = v35;
  v12 = [MEMORY[0x1E4F940F8] rowWithTitle:@"Size Test" action:v34];
  v44[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
  v33 = [v11 sectionWithRows:v13 title:@"Dynamic"];

  double v14 = [MEMORY[0x1E4F94148] rowWithTitle:@"Enter Width" valueKeyPath:@"_desiredWidth"];
  double v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v15 bounds];
  double v17 = [v14 between:320.0 and:v16];

  [v17 setPrecision:1];
  [v17 setValueValidatator:&__block_literal_global_71];
  double v18 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Slide Width" valueKeyPath:@"_desiredWidth"];
  v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v19 bounds];
  v21 = [v18 minValue:320.0 maxValue:v20];

  [v21 setValueValidatator:&__block_literal_global_77];
  CGRect v22 = [MEMORY[0x1E4F94108] rowWithTitle:@"Delay" valueKeyPath:@"_widthDelay"];
  CGRect v23 = [v22 possibleValues:&unk_1F078AE80 titles:&unk_1F078AE98];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __44__PUMedusaSettings_settingsControllerModule__block_invoke_5;
  v39[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v39[4] = a1;
  v24 = [MEMORY[0x1E4F94190] actionWithHandler:v39];
  v25 = (void *)MEMORY[0x1E4F94160];
  v43[0] = v21;
  v43[1] = v17;
  v43[2] = v23;
  v26 = [MEMORY[0x1E4F940F8] rowWithTitle:@"Set Width" action:v24];
  v43[3] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
  v28 = [v25 sectionWithRows:v27 title:@"Specific"];

  v29 = (void *)MEMORY[0x1E4F94160];
  v42[0] = v37;
  v42[1] = v33;
  v42[2] = v28;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
  v31 = [v29 moduleWithTitle:@"Medusa" contents:v30];

  return v31;
}

uint64_t __44__PUMedusaSettings_settingsControllerModule__block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __44__PUMedusaSettings_settingsControllerModule__block_invoke_53(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sharedInstance];
  [v2 _testStartDelay];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PUMedusaSettings_settingsControllerModule__block_invoke_2_54;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x1E4F14428], block);

  return 1;
}

uint64_t __44__PUMedusaSettings_settingsControllerModule__block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sharedInstance];
  [v2 _widthDelay];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PUMedusaSettings_settingsControllerModule__block_invoke_6;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x1E4F14428], block);

  return 1;
}

void __44__PUMedusaSettings_settingsControllerModule__block_invoke_6(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v3 = [v2 windows];
  id v9 = [v3 firstObject];

  dispatch_time_t v4 = [*(id *)(a1 + 32) sharedInstance];
  [v4 _desiredWidth];
  double v6 = v5;
  [v9 bounds];
  double v8 = v7;

  objc_msgSend(v9, "_adjustSizeClassesAndResizeWindowToFrame:", 0.0, 0.0, v6, v8);
}

uint64_t __44__PUMedusaSettings_settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  [a2 floatValue];
  float v3 = v2;
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  double v4 = round(*(double *)&PUMainScreenScale_screenScale * v3) / *(double *)&PUMainScreenScale_screenScale;
  double v5 = NSNumber;
  return [v5 numberWithDouble:v4];
}

uint64_t __44__PUMedusaSettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  [a2 floatValue];
  float v3 = v2;
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  double v4 = round(*(double *)&PUMainScreenScale_screenScale * v3) / *(double *)&PUMainScreenScale_screenScale;
  double v5 = NSNumber;
  return [v5 numberWithDouble:v4];
}

void __44__PUMedusaSettings_settingsControllerModule__block_invoke_2_54(uint64_t a1)
{
  float v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  float v3 = [v2 windows];
  id v9 = [v3 firstObject];

  double v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  double v6 = v5;
  [v9 bounds];
  double v8 = v7;

  objc_msgSend(v9, "_adjustSizeClassesAndResizeWindowToFrame:", 0.0, 0.0, v6, v8);
  _isShrinking = 1;
  [*(id *)(a1 + 32) runSizeTest];
}

uint64_t __44__PUMedusaSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  [a2 floatValue];
  float v3 = v2;
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  double v4 = round(*(double *)&PUMainScreenScale_screenScale * v3) / *(double *)&PUMainScreenScale_screenScale;
  double v5 = NSNumber;
  return [v5 numberWithDouble:v4];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_43654 != -1) {
    dispatch_once(&sharedInstance_onceToken_43654, &__block_literal_global_43655);
  }
  float v2 = (void *)sharedInstance_sharedInstance_43656;
  return v2;
}

void __34__PUMedusaSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 medusaSettings];
  v1 = (void *)sharedInstance_sharedInstance_43656;
  sharedInstance_sharedInstance_43656 = v0;
}

- (void)set_testIncrement:(double)a3
{
  self->__testIncrement = a3;
}

- (double)_testIncrement
{
  return self->__testIncrement;
}

- (void)set_testInterval:(double)a3
{
  self->__testInterval = a3;
}

- (double)_testInterval
{
  return self->__testInterval;
}

- (void)set_testStartDelay:(double)a3
{
  self->__testStartDelay = a3;
}

- (double)_testStartDelay
{
  return self->__testStartDelay;
}

- (void)set_widthDelay:(double)a3
{
  self->__widthDelay = a3;
}

- (double)_widthDelay
{
  return self->__widthDelay;
}

- (void)set_desiredWidth:(double)a3
{
  self->__desireddouble Width = a3;
}

- (double)_desiredWidth
{
  return self->__desiredWidth;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

@end