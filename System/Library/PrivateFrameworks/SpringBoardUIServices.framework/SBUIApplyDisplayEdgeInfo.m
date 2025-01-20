@interface SBUIApplyDisplayEdgeInfo
@end

@implementation SBUIApplyDisplayEdgeInfo

void ___SBUIApplyDisplayEdgeInfo_block_invoke()
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v0 = (uint64_t (*)(void))getSBHScreenTypeForCurrentDeviceSymbolLoc_ptr;
  v13 = getSBHScreenTypeForCurrentDeviceSymbolLoc_ptr;
  if (!getSBHScreenTypeForCurrentDeviceSymbolLoc_ptr)
  {
    v1 = (void *)SpringBoardHomeLibrary();
    v11[3] = (uint64_t)dlsym(v1, "SBHScreenTypeForCurrentDevice");
    getSBHScreenTypeForCurrentDeviceSymbolLoc_ptr = (_UNKNOWN *)v11[3];
    v0 = (uint64_t (*)(void))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v0) {
    ___SBUIApplyDisplayEdgeInfo_block_invoke_cold_1();
  }
  uint64_t v2 = v0();
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v3 = (double (*)(uint64_t))getSBHDisplayCornerRadiusForScreenTypeSymbolLoc_ptr;
  v13 = getSBHDisplayCornerRadiusForScreenTypeSymbolLoc_ptr;
  if (!getSBHDisplayCornerRadiusForScreenTypeSymbolLoc_ptr)
  {
    v4 = (void *)SpringBoardHomeLibrary();
    v11[3] = (uint64_t)dlsym(v4, "SBHDisplayCornerRadiusForScreenType");
    getSBHDisplayCornerRadiusForScreenTypeSymbolLoc_ptr = (_UNKNOWN *)v11[3];
    v3 = (double (*)(uint64_t))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v3) {
    ___SBUIApplyDisplayEdgeInfo_block_invoke_cold_2();
  }
  double v5 = v3(v2);
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB33B0], "sbh_displayEdgeInfoForScreenType:", v2);
  v7 = (void *)_SBUIApplyDisplayEdgeInfo_displayEdgeInfo;
  _SBUIApplyDisplayEdgeInfo_displayEdgeInfo = v6;

  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F4F700]) initWithCornerRadius:v5];
  v9 = (void *)_SBUIApplyDisplayEdgeInfo_cornerRadiusConfiguration;
  _SBUIApplyDisplayEdgeInfo_cornerRadiusConfiguration = v8;
}

void ___SBUIApplyDisplayEdgeInfo_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"SBHScreenType getSBHScreenTypeForCurrentDevice(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUIContinuityAccessorySceneManager.m", 29, @"%s", dlerror());

  __break(1u);
}

void ___SBUIApplyDisplayEdgeInfo_block_invoke_cold_2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"CGFloat getSBHDisplayCornerRadiusForScreenType(SBHScreenType)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUIContinuityAccessorySceneManager.m", 30, @"%s", dlerror());

  __break(1u);
}

@end