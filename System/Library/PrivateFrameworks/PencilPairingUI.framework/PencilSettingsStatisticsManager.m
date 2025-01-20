@interface PencilSettingsStatisticsManager
+ (id)sharedInstance;
- (id)stringForElementType:(int64_t)a3;
- (id)stringForHandwritingElementType:(int64_t)a3;
- (void)recordDrawPencilForTextInputToggle:(BOOL)a3;
- (void)recordEducationPanelChanged:(int64_t)a3;
- (void)recordEducationPencilDidShow:(double)a3;
- (void)recordEducationPencilInputInteraction:(int64_t)a3;
- (void)recordHandwritingEducationPanelChanged:(int64_t)a3;
- (void)recordHandwritingEducationPencilInputInteraction:(int64_t)a3;
- (void)recordHoverDoubleTap:(BOOL)a3;
- (void)recordHoverPreview:(BOOL)a3;
- (void)recordHoverShadow:(BOOL)a3;
- (void)recordOnlyUsePencilToggle:(BOOL)a3;
- (void)recordPaperFromCornerToggle:(BOOL)a3;
- (void)recordScreenshotFromCornerToggle:(BOOL)a3;
- (void)recordSetPencilPerferredAction:(int64_t)a3;
@end

@implementation PencilSettingsStatisticsManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_sSharedStats;
  return v2;
}

uint64_t __49__PencilSettingsStatisticsManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PencilSettingsStatisticsManager);
  uint64_t v1 = sharedInstance_sSharedStats;
  sharedInstance_sSharedStats = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)recordSetPencilPerferredAction:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    v3 = 0;
  }
  else {
    v3 = off_264DA5D50[a3];
  }
  v4 = [NSString stringWithFormat:@"com.apple.PencilPairingAndSettings.%@", @"action"];
  AnalyticsSendEventLazy();
}

id __66__PencilSettingsStatisticsManager_recordSetPencilPerferredAction___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v4 = @"DoubleTap";
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)recordOnlyUsePencilToggle:(BOOL)a3
{
  v3 = [NSString stringWithFormat:@"com.apple.PencilPairingAndSettings.%@", @"OnlyUsePencilToggle"];
  AnalyticsSendEventLazy();
}

id __61__PencilSettingsStatisticsManager_recordOnlyUsePencilToggle___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"OnlyUsePencilValue";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordDrawPencilForTextInputToggle:(BOOL)a3
{
  v3 = [NSString stringWithFormat:@"com.apple.PencilPairingAndSettings.%@", @"PencilForTextInputToggle"];
  AnalyticsSendEventLazy();
}

id __70__PencilSettingsStatisticsManager_recordDrawPencilForTextInputToggle___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"PencilForTextInputValue";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordEducationPanelChanged:(int64_t)a3
{
  v3 = [(PencilSettingsStatisticsManager *)self stringForElementType:a3];
  if (v3)
  {
    v4 = [NSString stringWithFormat:@"com.apple.PencilPairingAndSettings.%@", @"PencilEducationInteraction.panelChange"];
    id v5 = v3;
    AnalyticsSendEventLazy();
  }
}

id __63__PencilSettingsStatisticsManager_recordEducationPanelChanged___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v4 = @"ElementType";
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)recordEducationPencilInputInteraction:(int64_t)a3
{
  v3 = [(PencilSettingsStatisticsManager *)self stringForElementType:a3];
  if (v3)
  {
    v4 = [NSString stringWithFormat:@"com.apple.PencilPairingAndSettings.%@", @"PencilEducationInteraction.pencilInput"];
    id v5 = v3;
    AnalyticsSendEventLazy();
  }
}

id __73__PencilSettingsStatisticsManager_recordEducationPencilInputInteraction___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v4 = @"ElementType";
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)recordHandwritingEducationPanelChanged:(int64_t)a3
{
  v3 = [(PencilSettingsStatisticsManager *)self stringForHandwritingElementType:a3];
  if (v3)
  {
    v4 = [NSString stringWithFormat:@"com.apple.PencilPairingAndSettings.%@", @"PencilHandwritingEducationInteraction.panelChange"];
    id v5 = v3;
    AnalyticsSendEventLazy();
  }
}

id __74__PencilSettingsStatisticsManager_recordHandwritingEducationPanelChanged___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v4 = @"HandwritingElementType";
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)recordHandwritingEducationPencilInputInteraction:(int64_t)a3
{
  v3 = [(PencilSettingsStatisticsManager *)self stringForHandwritingElementType:a3];
  if (v3)
  {
    v4 = [NSString stringWithFormat:@"com.apple.PencilPairingAndSettings.%@", @"PencilHandwritingEducationInteraction.pencilInput"];
    id v5 = v3;
    AnalyticsSendEventLazy();
  }
}

id __84__PencilSettingsStatisticsManager_recordHandwritingEducationPencilInputInteraction___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v4 = @"HandwritingElementType";
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)recordEducationPencilDidShow:(double)a3
{
  v3 = [NSString stringWithFormat:@"com.apple.PencilPairingAndSettings.%@", @"PencilEducation.didShow"];
  AnalyticsSendEventLazy();
}

id __64__PencilSettingsStatisticsManager_recordEducationPencilDidShow___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v5[1] = @"duration";
  v6[0] = v1;
  v5[0] = @"type";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v6[1] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (void)recordScreenshotFromCornerToggle:(BOOL)a3
{
  v3 = [NSString stringWithFormat:@"com.apple.PencilPairingAndSettings.%@", @"ScreenshotFromCornerToggle"];
  AnalyticsSendEventLazy();
}

id __68__PencilSettingsStatisticsManager_recordScreenshotFromCornerToggle___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"ScreenshotFromCornerValue";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordPaperFromCornerToggle:(BOOL)a3
{
  v3 = [NSString stringWithFormat:@"com.apple.PencilPairingAndSettings.%@", @"PaperFromCornerToggle"];
  AnalyticsSendEventLazy();
}

id __63__PencilSettingsStatisticsManager_recordPaperFromCornerToggle___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"PaperFromCornerValue";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordHoverPreview:(BOOL)a3
{
  v3 = [NSString stringWithFormat:@"com.apple.PencilPairingAndSettings.%@", @"HoverPreviewToggle"];
  AnalyticsSendEventLazy();
}

id __54__PencilSettingsStatisticsManager_recordHoverPreview___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"HoverPreviewValue";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordHoverShadow:(BOOL)a3
{
  v3 = [NSString stringWithFormat:@"com.apple.PencilPairingAndSettings.%@", @"HoverShadowToggle"];
  AnalyticsSendEventLazy();
}

id __53__PencilSettingsStatisticsManager_recordHoverShadow___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"HoverShadowValue";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordHoverDoubleTap:(BOOL)a3
{
  v3 = [NSString stringWithFormat:@"com.apple.PencilPairingAndSettings.%@", @"HoverDoubleTapToggle"];
  AnalyticsSendEventLazy();
}

id __56__PencilSettingsStatisticsManager_recordHoverDoubleTap___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"HoverDoubleTapValue";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)stringForElementType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return off_264DA5D78[a3];
  }
}

- (id)stringForHandwritingElementType:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return @"AutoRefine";
  }
}

@end