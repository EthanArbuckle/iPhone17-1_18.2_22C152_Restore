@interface NTKLauncherComplicationDataSource
+ (BOOL)acceptsComplicationType:(unint64_t)a3 withFamily:(int64_t)a4 forDevice:(id)a5;
- (id)_appBackgroundColor;
- (id)_appTintColor;
- (id)_appTitle;
- (id)_circularTemplateMedium:(BOOL)a3;
- (id)_complicationApplicationIdentifier;
- (id)_complicationLaunchURL;
- (id)_currentTimelineEntry;
- (id)_extraLarge;
- (id)_fullColorImageProvider;
- (id)_graphicExtraLargeTemplate;
- (id)_modularLargeTemplate;
- (id)_modularSmallTemplate;
- (id)_signatureBezelTemplate;
- (id)_signatureCircularTemplate;
- (id)_signatureCornerTemplate;
- (id)_symbolAppFullColorImageProviderIfSupported;
- (id)_symbolAppImageProviderIfSupported;
- (id)_symbolName;
- (id)_symbolSize;
- (id)_symbolSizeforMailApp;
- (id)_symbolSizeforMapsApp;
- (id)_symbolSizeforTinCanApp;
- (id)_tinCanAppTintColor;
- (id)_tintableAppImageProvider;
- (id)_utilitarianLargeTemplate;
- (id)_utilitarianSmallTemplate;
- (id)currentSwitcherTemplate;
- (unint64_t)timelineAnimationBehavior;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
@end

@implementation NTKLauncherComplicationDataSource

+ (BOOL)acceptsComplicationType:(unint64_t)a3 withFamily:(int64_t)a4 forDevice:(id)a5
{
  id v7 = a5;
  if (+[NTKWidgetComplicationMigrationDefines hasMigratedComplicationType:a3 forDevice:v7])
  {
    goto LABEL_2;
  }
  if (a3 > 0x2E) {
    goto LABEL_12;
  }
  if (((1 << a3) & 0x1B200000) != 0)
  {
    if ((unint64_t)(a4 - 8) <= 2)
    {
      char v8 = [v7 nrDeviceVersion] > 0x50100;
      goto LABEL_30;
    }
    goto LABEL_13;
  }
  if (a3 != 33)
  {
    if (a3 == 46)
    {
      if ((unint64_t)a4 <= 0xA && ((1 << a4) & 0x715) != 0
        || (*MEMORY[0x1E4F19648] != a4 ? (BOOL v12 = a4 == 12) : (BOOL v12 = 1), !v12 ? (v13 = a4 == 7) : (v13 = 1), v13))
      {
        char v8 = [v7 isEcgPhoneComplicationEnabled];
        goto LABEL_30;
      }
      goto LABEL_2;
    }
LABEL_12:
    if (a3 != 20)
    {
LABEL_2:
      char v8 = 0;
      goto LABEL_30;
    }
LABEL_13:
    if ((unint64_t)a4 > 4 || ((1 << a4) & 0x15) == 0)
    {
      BOOL v9 = a4 == 7 || *MEMORY[0x1E4F19648] == a4;
      goto LABEL_24;
    }
LABEL_20:
    char v8 = 1;
    goto LABEL_30;
  }
  if ((unint64_t)a4 <= 4 && ((1 << a4) & 0x15) != 0) {
    goto LABEL_20;
  }
  BOOL v9 = (unint64_t)(a4 - 7) < 4 || *MEMORY[0x1E4F19648] == a4;
LABEL_24:
  char v8 = v9 || a4 == 12;
LABEL_30:

  return v8;
}

- (unint64_t)timelineAnimationBehavior
{
  return 0;
}

- (id)currentSwitcherTemplate
{
  v2 = [(NTKLauncherComplicationDataSource *)self _currentTimelineEntry];
  v3 = [v2 complicationTemplate];

  return v3;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(NTKLauncherComplicationDataSource *)self _currentTimelineEntry];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (id)_currentTimelineEntry
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F19A10]);
  int64_t v4 = [(CLKCComplicationDataSource *)self family];
  if (v4 == 104)
  {
LABEL_2:
    uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _utilitarianLargeTemplate];
LABEL_6:
    char v8 = (void *)v5;
    goto LABEL_7;
  }
  if (v4 == *MEMORY[0x1E4F19648])
  {
    id v6 = self;
    uint64_t v7 = 1;
LABEL_5:
    uint64_t v5 = [(NTKLauncherComplicationDataSource *)v6 _circularTemplateMedium:v7];
    goto LABEL_6;
  }
  char v8 = 0;
  switch(v4)
  {
    case 0:
      uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _modularSmallTemplate];
      goto LABEL_6;
    case 1:
      uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _modularLargeTemplate];
      goto LABEL_6;
    case 2:
    case 6:
      uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _utilitarianSmallTemplate];
      goto LABEL_6;
    case 3:
      goto LABEL_2;
    case 4:
      id v6 = self;
      uint64_t v7 = 0;
      goto LABEL_5;
    case 7:
      uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _extraLarge];
      goto LABEL_6;
    case 8:
      uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _signatureCornerTemplate];
      goto LABEL_6;
    case 9:
      uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _signatureBezelTemplate];
      goto LABEL_6;
    case 10:
      uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _signatureCircularTemplate];
      goto LABEL_6;
    case 12:
      uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _graphicExtraLargeTemplate];
      goto LABEL_6;
    default:
      break;
  }
LABEL_7:
  BOOL v9 = [(NTKLauncherComplicationDataSource *)self _appTintColor];
  [v8 setTintColor:v9];

  if (v8) {
    [v3 setComplicationTemplate:v8];
  }
  v10 = [MEMORY[0x1E4F1C9C8] date];
  [v3 setDate:v10];

  [v3 finalize];
  return v3;
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  id v7 = a5;
  id v8 = [(NTKLauncherComplicationDataSource *)self _complicationLaunchURL];
  (*((void (**)(id, id))a5 + 2))(v7, v8);
}

- (id)_modularSmallTemplate
{
  id v3 = [(NTKLauncherComplicationDataSource *)self _tintableAppImageProvider];
  if (v3)
  {
    int64_t v4 = [MEMORY[0x1E4F199B8] templateWithImageProvider:v3];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F199C0];
    id v6 = (void *)MEMORY[0x1E4F19AB0];
    id v7 = [(NTKLauncherComplicationDataSource *)self _appTitle];
    id v8 = [v6 textProviderWithText:v7];
    int64_t v4 = [v5 templateWithTextProvider:v8];
  }
  return v4;
}

- (id)_modularLargeTemplate
{
  id v3 = (void *)MEMORY[0x1E4F19978];
  int64_t v4 = [(NTKLauncherComplicationDataSource *)self _tintableAppImageProvider];
  uint64_t v5 = (void *)MEMORY[0x1E4F19AB0];
  id v6 = [(NTKLauncherComplicationDataSource *)self _appTitle];
  id v7 = [v5 textProviderWithText:v6];
  id v8 = [MEMORY[0x1E4F19AB0] textProviderWithText:&stru_1F1635E90];
  BOOL v9 = [v3 templateWithHeaderImageProvider:v4 headerTextProvider:v7 body1TextProvider:v8];

  return v9;
}

- (id)_utilitarianSmallTemplate
{
  id v3 = [(NTKLauncherComplicationDataSource *)self _tintableAppImageProvider];
  if (v3)
  {
    int64_t v4 = [MEMORY[0x1E4F19A08] templateWithImageProvider:v3];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F199E8];
    id v6 = (void *)MEMORY[0x1E4F19AB0];
    id v7 = [(NTKLauncherComplicationDataSource *)self _appTitle];
    id v8 = [v6 textProviderWithText:v7];
    int64_t v4 = [v5 templateWithTextProvider:v8];
  }
  return v4;
}

- (id)_utilitarianLargeTemplate
{
  id v3 = (void *)MEMORY[0x1E4F199E0];
  int64_t v4 = (void *)MEMORY[0x1E4F19AB0];
  uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _appTitle];
  id v6 = [v4 textProviderWithText:v5];
  id v7 = [(NTKLauncherComplicationDataSource *)self _tintableAppImageProvider];
  id v8 = [v3 templateWithTextProvider:v6 imageProvider:v7];

  return v8;
}

- (id)_circularTemplateMedium:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _tintableAppImageProvider];
  if (v5)
  {
    if (v3) {
      id v6 = (void *)MEMORY[0x1E4F19700];
    }
    else {
      id v6 = (void *)MEMORY[0x1E4F19740];
    }
    v11 = [v6 templateWithImageProvider:v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F19AB0];
    id v8 = [(NTKLauncherComplicationDataSource *)self _appTitle];
    BOOL v9 = [v7 textProviderWithText:v8];

    v10 = (id *)0x1E4F19708;
    if (!v3) {
      v10 = (id *)0x1E4F19748;
    }
    v11 = [*v10 templateWithTextProvider:v9];
  }
  return v11;
}

- (id)_extraLarge
{
  BOOL v3 = [(NTKLauncherComplicationDataSource *)self _tintableAppImageProvider];
  if (v3)
  {
    int64_t v4 = [MEMORY[0x1E4F19798] templateWithImageProvider:v3];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F19AB0];
    id v6 = [(NTKLauncherComplicationDataSource *)self _appTitle];
    id v7 = [v5 textProviderWithText:v6];

    int64_t v4 = [MEMORY[0x1E4F197A0] templateWithTextProvider:v7];
  }
  return v4;
}

- (id)_signatureCornerTemplate
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F19840];
  BOOL v3 = [(NTKLauncherComplicationDataSource *)self _fullColorImageProvider];
  int64_t v4 = [v2 templateWithImageProvider:v3];

  uint64_t v7 = *MEMORY[0x1E4F19698];
  v8[0] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 setMetadata:v5];

  return v4;
}

- (id)_signatureBezelTemplate
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F197B8];
  BOOL v3 = [(NTKLauncherComplicationDataSource *)self _signatureCircularTemplate];
  int64_t v4 = [v2 templateWithCircularTemplate:v3];

  uint64_t v7 = *MEMORY[0x1E4F19698];
  v8[0] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 setMetadata:v5];

  return v4;
}

- (id)_signatureCircularTemplate
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F197E0];
  BOOL v3 = [(NTKLauncherComplicationDataSource *)self _fullColorImageProvider];
  int64_t v4 = [v2 templateWithImageProvider:v3];

  uint64_t v7 = *MEMORY[0x1E4F19698];
  v8[0] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 setMetadata:v5];

  return v4;
}

- (id)_graphicExtraLargeTemplate
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F198B0];
  BOOL v3 = [(NTKLauncherComplicationDataSource *)self _fullColorImageProvider];
  int64_t v4 = [v2 templateWithImageProvider:v3];

  uint64_t v7 = *MEMORY[0x1E4F19698];
  v8[0] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 setMetadata:v5];

  return v4;
}

- (id)_appTitle
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  int64_t v4 = [(NTKLauncherComplicationDataSource *)self _complicationApplicationIdentifier];
  uint64_t v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  id v6 = [v5 localizedName];

  return v6;
}

- (id)_symbolSizeforMapsApp
{
  os_unfair_lock_lock((os_unfair_lock_t)&_symbolSizeforMapsApp___lock);
  id WeakRetained = objc_loadWeakRetained(&_symbolSizeforMapsApp___cachedDevice);
  if (WeakRetained)
  {
    int64_t v4 = WeakRetained;
    id v5 = [MEMORY[0x1E4F19A30] currentDevice];
    id v6 = objc_loadWeakRetained(&_symbolSizeforMapsApp___cachedDevice);
    if (v5 == v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F19A30] currentDevice];
      uint64_t v8 = [v7 version];
      uint64_t v9 = _symbolSizeforMapsApp___previousCLKDeviceVersion;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v10 = [MEMORY[0x1E4F19A30] currentDevice];
  objc_storeWeak(&_symbolSizeforMapsApp___cachedDevice, v10);

  id v11 = objc_loadWeakRetained(&_symbolSizeforMapsApp___cachedDevice);
  _symbolSizeforMapsApp___previousCLKDeviceVersion = [v11 version];

  BOOL v12 = [MEMORY[0x1E4F19A30] currentDevice];
  __58__NTKLauncherComplicationDataSource__symbolSizeforMapsApp__block_invoke();

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_symbolSizeforMapsApp___lock);
  BOOL v13 = (void *)_symbolSizeforMapsApp_allMapsSymbolSizes;
  v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[CLKCComplicationDataSource family](self, "family"));
  v15 = [v13 objectForKey:v14];

  return v15;
}

void __58__NTKLauncherComplicationDataSource__symbolSizeforMapsApp__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = &unk_1F16E4068;
  v3[0] = &unk_1F16E8290;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)_symbolSizeforMapsApp_allMapsSymbolSizes;
  _symbolSizeforMapsApp_allMapsSymbolSizes = v0;
}

- (id)_symbolSizeforMailApp
{
  os_unfair_lock_lock((os_unfair_lock_t)&_symbolSizeforMailApp___lock);
  id WeakRetained = objc_loadWeakRetained(&_symbolSizeforMailApp___cachedDevice);
  if (WeakRetained)
  {
    int64_t v4 = WeakRetained;
    id v5 = [MEMORY[0x1E4F19A30] currentDevice];
    id v6 = objc_loadWeakRetained(&_symbolSizeforMailApp___cachedDevice);
    if (v5 == v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F19A30] currentDevice];
      uint64_t v8 = [v7 version];
      uint64_t v9 = _symbolSizeforMailApp___previousCLKDeviceVersion;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v10 = [MEMORY[0x1E4F19A30] currentDevice];
  objc_storeWeak(&_symbolSizeforMailApp___cachedDevice, v10);

  id v11 = objc_loadWeakRetained(&_symbolSizeforMailApp___cachedDevice);
  _symbolSizeforMailApp___previousCLKDeviceVersion = [v11 version];

  BOOL v12 = [MEMORY[0x1E4F19A30] currentDevice];
  __58__NTKLauncherComplicationDataSource__symbolSizeforMailApp__block_invoke();

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_symbolSizeforMailApp___lock);
  BOOL v13 = (void *)_symbolSizeforMailApp_allMailSymbolSizes;
  v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[CLKCComplicationDataSource family](self, "family"));
  v15 = [v13 objectForKey:v14];

  return v15;
}

void __58__NTKLauncherComplicationDataSource__symbolSizeforMailApp__block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v5[0] = &unk_1F16E4080;
  v5[1] = &unk_1F16E4098;
  v6[0] = &unk_1F16E82A0;
  v6[1] = &unk_1F16E82A0;
  v6[2] = &unk_1F16E82B0;
  v5[2] = &unk_1F16E4068;
  v5[3] = &unk_1F16E40B0;
  uint64_t v0 = NSNumber;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v2 = [v0 numberWithDouble:v1 * 22.0];
  v6[3] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  int64_t v4 = (void *)_symbolSizeforMailApp_allMailSymbolSizes;
  _symbolSizeforMailApp_allMailSymbolSizes = v3;
}

- (id)_symbolSizeforTinCanApp
{
  os_unfair_lock_lock((os_unfair_lock_t)&_symbolSizeforTinCanApp___lock);
  id WeakRetained = objc_loadWeakRetained(&_symbolSizeforTinCanApp___cachedDevice);
  if (WeakRetained)
  {
    int64_t v4 = WeakRetained;
    id v5 = [MEMORY[0x1E4F19A30] currentDevice];
    id v6 = objc_loadWeakRetained(&_symbolSizeforTinCanApp___cachedDevice);
    if (v5 == v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F19A30] currentDevice];
      uint64_t v8 = [v7 version];
      uint64_t v9 = _symbolSizeforTinCanApp___previousCLKDeviceVersion;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v10 = [MEMORY[0x1E4F19A30] currentDevice];
  objc_storeWeak(&_symbolSizeforTinCanApp___cachedDevice, v10);

  id v11 = objc_loadWeakRetained(&_symbolSizeforTinCanApp___cachedDevice);
  _symbolSizeforTinCanApp___previousCLKDeviceVersion = [v11 version];

  BOOL v12 = [MEMORY[0x1E4F19A30] currentDevice];
  __60__NTKLauncherComplicationDataSource__symbolSizeforTinCanApp__block_invoke();

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_symbolSizeforTinCanApp___lock);
  BOOL v13 = (void *)_symbolSizeforTinCanApp_allTinCanSymbolSizes;
  v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[CLKCComplicationDataSource family](self, "family"));
  v15 = [v13 objectForKey:v14];

  return v15;
}

void __60__NTKLauncherComplicationDataSource__symbolSizeforTinCanApp__block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v5[0] = &unk_1F16E4080;
  v5[1] = &unk_1F16E4098;
  v6[0] = &unk_1F16E82C0;
  v6[1] = &unk_1F16E82C0;
  v6[2] = &unk_1F16E82D0;
  v5[2] = &unk_1F16E4068;
  v5[3] = &unk_1F16E40B0;
  uint64_t v0 = NSNumber;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v2 = [v0 numberWithDouble:v1 * 26.5];
  v6[3] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  int64_t v4 = (void *)_symbolSizeforTinCanApp_allTinCanSymbolSizes;
  _symbolSizeforTinCanApp_allTinCanSymbolSizes = v3;
}

- (id)_symbolSize
{
  uint64_t v3 = [(CLKCComplicationDataSource *)self complication];
  uint64_t v4 = [v3 complicationType];

  switch(v4)
  {
    case 33:
      id v5 = [(NTKLauncherComplicationDataSource *)self _symbolSizeforTinCanApp];
      break;
    case 27:
      id v5 = [(NTKLauncherComplicationDataSource *)self _symbolSizeforMailApp];
      break;
    case 25:
      id v5 = [(NTKLauncherComplicationDataSource *)self _symbolSizeforMapsApp];
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

- (id)_symbolName
{
  if (_symbolName_onceToken != -1) {
    dispatch_once(&_symbolName_onceToken, &__block_literal_global_46);
  }
  uint64_t v3 = (void *)_symbolName_typeToSymbolNameComponentMapping;
  uint64_t v4 = NSNumber;
  id v5 = [(CLKCComplicationDataSource *)self complication];
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "complicationType"));
  uint64_t v7 = [v3 objectForKeyedSubscript:v6];

  return v7;
}

void __48__NTKLauncherComplicationDataSource__symbolName__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E40C8;
  v2[1] = &unk_1F16E40E0;
  v3[0] = @"envelope.fill";
  v3[1] = @"walkietalkie.applewatch.case.fill";
  v2[2] = &unk_1F16E40F8;
  v2[3] = &unk_1F16E4110;
  void v3[2] = @"play.circle";
  v3[3] = @"phone.fill";
  v2[4] = &unk_1F16E4128;
  v3[4] = @"location.fill";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  double v1 = (void *)_symbolName_typeToSymbolNameComponentMapping;
  _symbolName_typeToSymbolNameComponentMapping = v0;
}

- (id)_symbolAppImageProviderIfSupported
{
  uint64_t v3 = [(NTKLauncherComplicationDataSource *)self _symbolName];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F19AB8] _symbolImageProviderWithSystemName:v3];
    id v5 = [(NTKLauncherComplicationDataSource *)self _symbolSize];
    if (v5) {
      [v4 setOverridePointSize:v5];
    }
    [v4 setIgnoreHierarchicalLayers:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_symbolAppFullColorImageProviderIfSupported
{
  uint64_t v3 = [(NTKLauncherComplicationDataSource *)self _symbolName];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F19A60] _symbolImageProviderWithSystemName:v3];
    id v5 = [(NTKLauncherComplicationDataSource *)self _symbolSize];
    if (v5) {
      [v4 setOverridePointSize:v5];
    }
    [v4 setIgnoreHierarchicalLayers:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_tintableAppImageProvider
{
  if (_tintableAppImageProvider_onceToken != -1) {
    dispatch_once(&_tintableAppImageProvider_onceToken, &__block_literal_global_76);
  }
  id v3 = [(NTKLauncherComplicationDataSource *)self _symbolAppImageProviderIfSupported];
  uint64_t v4 = [MEMORY[0x1E4F19A30] currentDevice];
  [v4 nrDeviceVersion];
  char IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();

  if (v3 && (IsGreaterThanOrEqual & 1) != 0)
  {
    id v3 = v3;
    v15 = v3;
  }
  else
  {
    id v6 = [(CLKCComplicationDataSource *)self complication];
    uint64_t v7 = [v6 complicationType];

    uint64_t v8 = (void *)_tintableAppImageProvider_familyToImageNameComponentMapping;
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[CLKCComplicationDataSource family](self, "family"));
    v10 = [v8 objectForKeyedSubscript:v9];

    id v11 = (void *)_tintableAppImageProvider_typeToImageNameComponentMapping;
    BOOL v12 = [NSNumber numberWithUnsignedInteger:v7];
    BOOL v13 = [v11 objectForKeyedSubscript:v12];

    if (v10 && v13)
    {
      v14 = [NSString stringWithFormat:@"%@%@", v10, v13];
      NTKImageNamed(v14);
    }

    v15 = 0;
  }

  return v15;
}

void __62__NTKLauncherComplicationDataSource__tintableAppImageProvider__block_invoke()
{
  v12[7] = *MEMORY[0x1E4F143B8];
  v11[0] = &unk_1F16E4140;
  v11[1] = &unk_1F16E4158;
  v12[0] = @"Color";
  v12[1] = @"ModularSmall";
  v11[2] = &unk_1F16E4170;
  v11[3] = &unk_1F16E4188;
  v12[2] = @"Utility";
  v12[3] = @"Utility";
  v11[4] = &unk_1F16E41A0;
  v11[5] = &unk_1F16E41B8;
  v12[4] = @"Utility";
  v12[5] = @"ExtraLarge";
  uint64_t v0 = [NSNumber numberWithInteger:*MEMORY[0x1E4F19648]];
  v11[6] = v0;
  v12[6] = @"VictoryNTK";
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:7];
  v2 = (void *)_tintableAppImageProvider_familyToImageNameComponentMapping;
  _tintableAppImageProvider_familyToImageNameComponentMapping = v1;

  v9[0] = &unk_1F16E40F8;
  v9[1] = &unk_1F16E4110;
  v10[0] = @"Remote";
  v10[1] = @"Phone";
  v9[2] = &unk_1F16E4128;
  v9[3] = &unk_1F16E40C8;
  v10[2] = @"Maps";
  v10[3] = @"Mail";
  v9[4] = &unk_1F16E41D0;
  v9[5] = &unk_1F16E41E8;
  v10[4] = @"Home";
  v10[5] = @"Reminders";
  v9[6] = &unk_1F16E40E0;
  v9[7] = &unk_1F16E4200;
  v10[6] = @"TinCan";
  v10[7] = @"ECG";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:8];
  uint64_t v4 = (void *)_tintableAppImageProvider_typeToImageNameComponentMapping;
  _tintableAppImageProvider_typeToImageNameComponentMapping = v3;

  uint64_t v7 = &unk_1F16E41E8;
  uint64_t v8 = @"Color";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v6 = (void *)_tintableAppImageProvider_typeToAccentSuffixNameComponentMapping;
  _tintableAppImageProvider_typeToAccentSuffixNameComponentMapping = v5;
}

- (id)_fullColorImageProvider
{
  if (_fullColorImageProvider_onceToken != -1) {
    dispatch_once(&_fullColorImageProvider_onceToken, &__block_literal_global_140);
  }
  id v3 = [(NTKLauncherComplicationDataSource *)self _symbolAppFullColorImageProviderIfSupported];
  uint64_t v4 = [(CLKCComplicationDataSource *)self complication];
  uint64_t v5 = [v4 complicationType];

  id v6 = [MEMORY[0x1E4F19A30] currentDevice];
  [v6 nrDeviceVersion];
  char IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();

  if (v3 && (IsGreaterThanOrEqual & 1) != 0)
  {
    v16 = (void *)_fullColorImageProvider_useAppTintColorList;
    v17 = [NSNumber numberWithUnsignedInteger:v5];
    LODWORD(v16) = [v16 containsObject:v17];

    if (v16)
    {
      v18 = [(NTKLauncherComplicationDataSource *)self _appTintColor];
      [v3 setTintColor:v18];
    }
    id v3 = v3;
    v15 = v3;
  }
  else
  {
    uint64_t v8 = (void *)_fullColorImageProvider_familyToImageNameComponentMapping;
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[CLKCComplicationDataSource family](self, "family"));
    v10 = [v8 objectForKeyedSubscript:v9];

    id v11 = (void *)_fullColorImageProvider_typeToImageNameComponentMapping;
    BOOL v12 = [NSNumber numberWithUnsignedInteger:v5];
    BOOL v13 = [v11 objectForKeyedSubscript:v12];

    if (v10 && v13)
    {
      v14 = [NSString stringWithFormat:@"%@%@", v10, v13];
      NTKImageNamed(v14);
    }

    v15 = 0;
  }

  return v15;
}

void __60__NTKLauncherComplicationDataSource__fullColorImageProvider__block_invoke()
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v7[0] = &unk_1F16E4098;
  v7[1] = &unk_1F16E4080;
  v8[0] = @"SignatureCircular";
  v8[1] = @"SignatureCircular";
  v7[2] = &unk_1F16E4068;
  v7[3] = &unk_1F16E40B0;
  void v8[2] = @"SignatureCorner";
  v8[3] = @"SignatureXL";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  uint64_t v1 = (void *)_fullColorImageProvider_familyToImageNameComponentMapping;
  _fullColorImageProvider_familyToImageNameComponentMapping = v0;

  v5[0] = &unk_1F16E40F8;
  v5[1] = &unk_1F16E4110;
  v6[0] = @"Remote";
  v6[1] = @"Phone";
  v5[2] = &unk_1F16E4128;
  v5[3] = &unk_1F16E40C8;
  v6[2] = @"Maps";
  v6[3] = @"Mail";
  void v5[4] = &unk_1F16E41D0;
  v5[5] = &unk_1F16E40E0;
  v6[4] = @"Home";
  void v6[5] = @"TinCan";
  v5[6] = &unk_1F16E4200;
  v6[6] = @"ECG";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  id v3 = (void *)_fullColorImageProvider_typeToImageNameComponentMapping;
  _fullColorImageProvider_typeToImageNameComponentMapping = v2;

  uint64_t v4 = (void *)_fullColorImageProvider_useAppTintColorList;
  _fullColorImageProvider_useAppTintColorList = (uint64_t)&unk_1F16EA558;
}

- (id)_appTintColor
{
  id v3 = [(CLKCComplicationDataSource *)self complication];
  uint64_t v4 = [v3 complicationType];

  uint64_t v5 = 0;
  switch(v4)
  {
    case 21:
    case 25:
    case 27:
      uint64_t v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
      break;
    case 22:
    case 23:
    case 26:
    case 29:
    case 30:
    case 31:
    case 32:
      break;
    case 24:
      uint64_t v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
      break;
    case 28:
      uint64_t v5 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      break;
    case 33:
      uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _tinCanAppTintColor];
      break;
    default:
      if (v4 == 46)
      {
        uint64_t v5 = [MEMORY[0x1E4FB1618] systemPinkColor];
      }
      break;
  }
  return v5;
}

- (id)_appBackgroundColor
{
  id v3 = [(CLKCComplicationDataSource *)self complication];
  uint64_t v4 = [v3 complicationType];

  switch(v4)
  {
    case 21:
    case 25:
    case 27:
      goto LABEL_2;
    case 22:
    case 23:
    case 26:
    case 29:
    case 30:
    case 31:
    case 32:
      goto LABEL_4;
    case 24:
      uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithRed:0.025 green:0.65 blue:0.35 alpha:0.2];
      goto LABEL_9;
    case 28:
      uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _appTintColor];
      id v6 = v5;
      double v7 = 0.18;
      goto LABEL_8;
    case 33:
      uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _appTintColor];
      id v6 = v5;
      double v7 = 0.14;
      goto LABEL_8;
    default:
      if (v4 != 46) {
LABEL_4:
      }
        CLKUIDefaultComplicationBackgroundColor();
LABEL_2:
      uint64_t v5 = [(NTKLauncherComplicationDataSource *)self _appTintColor];
      id v6 = v5;
      double v7 = 0.2;
LABEL_8:
      uint64_t v8 = [v5 colorWithAlphaComponent:v7];

LABEL_9:
      return v8;
  }
}

- (id)_complicationApplicationIdentifier
{
  uint64_t v2 = [(CLKCComplicationDataSource *)self complication];
  uint64_t v3 = [v2 complicationType];

  id result = 0;
  switch(v3)
  {
    case 20:
      id result = @"com.apple.NanoReminders";
      break;
    case 21:
      id result = @"com.apple.NanoRemote";
      break;
    case 22:
    case 23:
    case 26:
    case 29:
    case 30:
    case 31:
    case 32:
      return result;
    case 24:
      id result = @"com.apple.NanoPhone";
      break;
    case 25:
      id result = @"com.apple.NanoMaps";
      break;
    case 27:
      id result = @"com.apple.NanoMail";
      break;
    case 28:
      id result = @"com.apple.NanoHome";
      break;
    case 33:
      id result = @"com.apple.tincan";
      break;
    default:
      if (v3 == 46) {
        id result = @"com.apple.NanoHeartRhythm";
      }
      else {
        id result = 0;
      }
      break;
  }
  return result;
}

- (id)_complicationLaunchURL
{
  uint64_t v3 = [(CLKCComplicationDataSource *)self complication];
  uint64_t v4 = [v3 complicationType];

  if (v4 == 46)
  {
    uint64_t v5 = @"NanoHeartRhythm://start?source=complication";
  }
  else
  {
    id v6 = NSString;
    double v7 = [(NTKLauncherComplicationDataSource *)self complicationApplicationIdentifier];
    uint64_t v5 = [v6 stringWithFormat:@"%@://", v7];
  }
  uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v5];

  return v8;
}

- (id)_tinCanAppTintColor
{
  if (_tinCanAppTintColor_onceToken != -1) {
    dispatch_once(&_tinCanAppTintColor_onceToken, &__block_literal_global_187);
  }
  uint64_t v2 = (void *)_tinCanAppTintColor_tinCanAppTintColor;
  return v2;
}

void __56__NTKLauncherComplicationDataSource__tinCanAppTintColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.968627451 green:0.988235294 blue:0.368627451 alpha:1.0];
  uint64_t v1 = (void *)_tinCanAppTintColor_tinCanAppTintColor;
  _tinCanAppTintColor_tinCanAppTintColor = v0;
}

@end