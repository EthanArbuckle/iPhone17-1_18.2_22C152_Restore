@interface NTKSampleComplicationDataSource
+ (BOOL)_isComplicationFamilyAvaialbleBeforeGlory:(int64_t)a3;
+ (BOOL)_shouldUseFallbackImagesForDevice:(id)a3;
+ (BOOL)acceptsClassicComplicationType:(unint64_t)a3 withFamily:(int64_t)a4;
+ (BOOL)acceptsComplicationType:(unint64_t)NSSComplicationDataSourceClass withFamily:(int64_t)a4 forDevice:(id)a5;
- (BOOL)supportsFlowerImages;
- (Class)richComplicationDisplayViewClassForDevice:(id)a3;
- (NTKSampleComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_alarmTemplate;
- (id)_astronomyTemplateFromVista:(unint64_t)a3;
- (id)_batteryTemplate;
- (id)_breathingTemplate;
- (id)_city;
- (id)_currentEntryModel;
- (id)_fullColorImageProviderWithSystemImageName:(id)a3 tintColor:(id)a4 fallbackImageName:(id)a5;
- (id)_heartrateTemplate;
- (id)_imageProviderWithSystemImageName:(id)a3 overridePointSize:(id)a4 tintColor:(id)a5 fallbackImageName:(id)a6;
- (id)_moonPhaseTemplate;
- (id)_musicTemplate;
- (id)_newsTemplate;
- (id)_nowPlayingTemplate;
- (id)_podcastsTemplate;
- (id)_radioTemplate;
- (id)_reminderTemplate;
- (id)_siriTemplate;
- (id)_solarTemplate;
- (id)_stopwatchTemplate;
- (id)_worldClockTemplate;
- (id)currentSwitcherTemplate;
- (void)_localeDidChange:(id)a3;
- (void)dealloc;
@end

@implementation NTKSampleComplicationDataSource

+ (BOOL)acceptsComplicationType:(unint64_t)NSSComplicationDataSourceClass withFamily:(int64_t)a4 forDevice:(id)a5
{
  id v8 = a5;
  if (+[NTKWidgetComplicationMigrationDefines hasMigratedComplicationType:NSSComplicationDataSourceClass family:a4 forDevice:v8])
  {
    goto LABEL_13;
  }
  BOOL v9 = a4 == 100 || a4 == 101;
  BOOL v10 = v9 || a4 == 102;
  if (v10 || a4 == 103) {
    goto LABEL_13;
  }
  if (a4 == 6)
  {
    if (acceptsComplicationType_withFamily_forDevice__onceToken != -1) {
      dispatch_once(&acceptsComplicationType_withFamily_forDevice__onceToken, &__block_literal_global_18);
    }
    v13 = (void *)acceptsComplicationType_withFamily_forDevice__smallFlatComplications;
    v14 = [NSNumber numberWithUnsignedInteger:NSSComplicationDataSourceClass];
    LOBYTE(NSSComplicationDataSourceClass) = [v13 containsObject:v14];

    goto LABEL_14;
  }
  if (a4 == 104)
  {
    if (acceptsComplicationType_withFamily_forDevice__onceToken_365 != -1) {
      dispatch_once(&acceptsComplicationType_withFamily_forDevice__onceToken_365, &__block_literal_global_368);
    }
    v15 = (void *)acceptsComplicationType_withFamily_forDevice__specialCasedComplicationTypes;
    v16 = [NSNumber numberWithUnsignedInteger:NSSComplicationDataSourceClass];
    LODWORD(v15) = [v15 containsObject:v16];

    if (!v15)
    {
LABEL_13:
      LOBYTE(NSSComplicationDataSourceClass) = 0;
      goto LABEL_14;
    }
  }
  switch(NSSComplicationDataSourceClass)
  {
    case 2uLL:
    case 0xFuLL:
    case 0x11uLL:
    case 0x2AuLL:
      LOBYTE(NSSComplicationDataSourceClass) = 1;
      if (a4 != 12 && (a4 & 0xFFFFFFFFFFFFFFFCLL) != 8) {
        goto LABEL_26;
      }
      break;
    case 4uLL:
      LOBYTE(NSSComplicationDataSourceClass) = 1;
      if ((unint64_t)(a4 - 8) >= 5 && *MEMORY[0x1E4F19650] != a4) {
        goto LABEL_26;
      }
      break;
    case 5uLL:
      if ((unint64_t)(a4 - 8) >= 5 || ((0x17u >> (a4 - 8)) & 1) == 0)
      {
        int v19 = _os_feature_enabled_impl();
        if (a4 != 11) {
          goto LABEL_26;
        }
        if (!v19) {
          goto LABEL_26;
        }
        v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2C1C2266-9A61-4756-8AFD-9DFE14C54864"];
        char v21 = [v8 supportsCapability:v20];

        if ((v21 & 1) == 0) {
          goto LABEL_26;
        }
      }
      goto LABEL_71;
    case 0xDuLL:
      if (unint64_t)(a4 - 8) < 5 && ((0x17u >> (a4 - 8))) {
        goto LABEL_71;
      }
      goto LABEL_26;
    case 0x13uLL:
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2A51E7B3-1B80-4981-9F09-F725BC3A8065"];
      char v23 = [v8 supportsCapability:v22];

      if (v23) {
        goto LABEL_13;
      }
      LOBYTE(NSSComplicationDataSourceClass) = 1;
      if ((a4 & 0xFFFFFFFFFFFFFFFBLL) == 0 || *MEMORY[0x1E4F19648] == a4) {
        break;
      }
      if ((unint64_t)a4 >= 0xD) {
        goto LABEL_13;
      }
      LODWORD(NSSComplicationDataSourceClass) = (0x1784u >> a4) & 1;
      break;
    case 0x14uLL:
      if (a4 == 8) {
        goto LABEL_71;
      }
      goto LABEL_26;
    case 0x1AuLL:
      NSSComplicationDataSourceClass = (unint64_t)getNSSComplicationDataSourceClass();
      if (objc_opt_respondsToSelector())
      {
        v24 = objc_msgSend((id)NSSComplicationDataSourceClass, "nss_newsComplicationTemplateForFamily:compact:", a4, objc_msgSend(v8, "sizeClass") == 0);
        LOBYTE(NSSComplicationDataSourceClass) = v24 != 0;
      }
      else
      {
LABEL_26:
        char v17 = [a1 _isComplicationFamilyAvaialbleBeforeGlory:a4];
LABEL_27:
        LOBYTE(NSSComplicationDataSourceClass) = v17;
      }
      break;
    case 0x1DuLL:
      if (a4) {
        BOOL v25 = a4 == 10;
      }
      else {
        BOOL v25 = 1;
      }
      LOBYTE(NSSComplicationDataSourceClass) = v25;
      break;
    case 0x20uLL:
      if (a4 != 3) {
        goto LABEL_13;
      }
      char v17 = NTKIsConnectivityPhoneComplicationEnabled();
      goto LABEL_27;
    case 0x22uLL:
      if ((unint64_t)a4 >= 0xC) {
        LOBYTE(NSSComplicationDataSourceClass) = 0;
      }
      else {
        LODWORD(NSSComplicationDataSourceClass) = (0x80Au >> a4) & 1;
      }
      break;
    case 0x23uLL:
      char v17 = [v8 isRadioPhoneComplicationEnabled];
      goto LABEL_27;
    case 0x26uLL:
    case 0x27uLL:
    case 0x29uLL:
      BOOL v18 = a4 != 12 && (unint64_t)(a4 - 9) >= 2;
      goto LABEL_31;
    case 0x28uLL:
      int v26 = _os_feature_enabled_impl();
      if (a4 == 11
        && v26
        && (v27 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2C1C2266-9A61-4756-8AFD-9DFE14C54864"], char v28 = objc_msgSend(v8, "supportsCapability:", v27), v27, (v28 & 1) != 0))
      {
LABEL_71:
        LOBYTE(NSSComplicationDataSourceClass) = 1;
      }
      else
      {
        BOOL v18 = a4 != 12 && (unint64_t)(a4 - 8) >= 3;
LABEL_31:
        LOBYTE(NSSComplicationDataSourceClass) = !v18;
      }
      break;
    default:
      char v17 = [a1 acceptsClassicComplicationType:NSSComplicationDataSourceClass withFamily:a4];
      goto LABEL_27;
  }
LABEL_14:

  return NSSComplicationDataSourceClass;
}

void __80__NTKSampleComplicationDataSource_acceptsComplicationType_withFamily_forDevice___block_invoke()
{
  v0 = (void *)acceptsComplicationType_withFamily_forDevice__smallFlatComplications;
  acceptsComplicationType_withFamily_forDevice__smallFlatComplications = (uint64_t)&unk_1F16E8CB0;
}

void __80__NTKSampleComplicationDataSource_acceptsComplicationType_withFamily_forDevice___block_invoke_366()
{
  v0 = (void *)acceptsComplicationType_withFamily_forDevice__specialCasedComplicationTypes;
  acceptsComplicationType_withFamily_forDevice__specialCasedComplicationTypes = (uint64_t)&unk_1F16E8CC8;
}

+ (BOOL)acceptsClassicComplicationType:(unint64_t)a3 withFamily:(int64_t)a4
{
  int v5 = [a1 _isComplicationFamilyAvaialbleBeforeGlory:a4];
  BOOL v7 = a3 == 26 || a3 == 11;
  return v5 && v7;
}

+ (BOOL)_isComplicationFamilyAvaialbleBeforeGlory:(int64_t)a3
{
  if (unint64_t)a3 < 7 && ((0x5Fu >> a3)) {
    return 1;
  }
  return a3 == 7 || *MEMORY[0x1E4F19648] == a3;
}

- (Class)richComplicationDisplayViewClassForDevice:(id)a3
{
  v28[7] = *MEMORY[0x1E4F143B8];
  int64_t v18 = [(CLKCComplicationDataSource *)self family];
  v27[0] = &unk_1F16E0840;
  v28[0] = objc_opt_class();
  v27[1] = &unk_1F16E0858;
  v28[1] = objc_opt_class();
  v27[2] = &unk_1F16E0870;
  v28[2] = objc_opt_class();
  v27[3] = &unk_1F16E0888;
  v28[3] = objc_opt_class();
  v27[4] = &unk_1F16E0798;
  v28[4] = objc_opt_class();
  v27[5] = &unk_1F16E07C8;
  v28[5] = objc_opt_class();
  v27[6] = &unk_1F16E07E0;
  v28[6] = objc_opt_class();
  char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:7];
  v25[0] = &unk_1F16E0840;
  v26[0] = objc_opt_class();
  v25[1] = &unk_1F16E0858;
  v26[1] = objc_opt_class();
  v25[2] = &unk_1F16E0870;
  v26[2] = objc_opt_class();
  v25[3] = &unk_1F16E0888;
  v26[3] = objc_opt_class();
  v25[4] = &unk_1F16E0798;
  v26[4] = objc_opt_class();
  v25[5] = &unk_1F16E07E0;
  v26[5] = objc_opt_class();
  v25[6] = &unk_1F16E07C8;
  v26[6] = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:7];
  char v23 = &unk_1F16E0858;
  uint64_t v24 = objc_opt_class();
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  char v21 = &unk_1F16E0810;
  uint64_t v22 = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v19[0] = &unk_1F16E0840;
  v20[0] = objc_opt_class();
  v19[1] = &unk_1F16E0858;
  v20[1] = objc_opt_class();
  v19[2] = &unk_1F16E0870;
  v20[2] = objc_opt_class();
  v19[3] = &unk_1F16E0888;
  v20[3] = objc_opt_class();
  v19[4] = &unk_1F16E0798;
  v20[4] = objc_opt_class();
  v19[5] = &unk_1F16E07C8;
  v20[5] = objc_opt_class();
  v19[6] = &unk_1F16E07E0;
  v20[6] = objc_opt_class();
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:7];
  v6 = [(CLKCComplicationDataSource *)self complication];
  uint64_t v7 = [v6 complicationType];

  switch(v18)
  {
    case 8:
      id v8 = [NSNumber numberWithUnsignedInteger:v7];
      BOOL v9 = v15;
      BOOL v10 = [v15 objectForKeyedSubscript:v8];
      v12 = v16;
      v11 = v17;
      goto LABEL_11;
    case 9:
      id v8 = [NSNumber numberWithUnsignedInteger:v7];
      v12 = v16;
      BOOL v10 = [v16 objectForKeyedSubscript:v8];
      v11 = v17;
      goto LABEL_10;
    case 10:
      id v8 = [NSNumber numberWithUnsignedInteger:v7];
      v11 = v17;
      BOOL v10 = [v17 objectForKeyedSubscript:v8];
      goto LABEL_9;
    case 11:
      id v8 = [NSNumber numberWithUnsignedInteger:v7];
      v13 = v4;
      goto LABEL_8;
    case 12:
      id v8 = [NSNumber numberWithUnsignedInteger:v7];
      v13 = v5;
LABEL_8:
      BOOL v10 = objc_msgSend(v13, "objectForKeyedSubscript:", v8, v15);
      v11 = v17;
LABEL_9:
      v12 = v16;
LABEL_10:
      BOOL v9 = v15;
LABEL_11:

      break;
    default:
      BOOL v10 = 0;
      v12 = v16;
      v11 = v17;
      BOOL v9 = v15;
      break;
  }

  return (Class)v10;
}

- (NTKSampleComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKSampleComplicationDataSource;
  int v5 = [(CLKCComplicationDataSource *)&v8 initWithComplication:a3 family:a4 forDevice:a5];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel__localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKSampleComplicationDataSource;
  [(NTKSampleComplicationDataSource *)&v4 dealloc];
}

- (id)currentSwitcherTemplate
{
  if (!self->_complicationTemplate)
  {
    v3 = [(CLKCComplicationDataSource *)self complication];
    uint64_t v4 = [v3 complicationType];

    switch(v4)
    {
      case 2:
        int v5 = [(NTKSampleComplicationDataSource *)self _alarmTemplate];
        goto LABEL_22;
      case 4:
        int v5 = [(NTKSampleComplicationDataSource *)self _stopwatchTemplate];
        goto LABEL_22;
      case 5:
        int v5 = [(NTKSampleComplicationDataSource *)self _worldClockTemplate];
        goto LABEL_22;
      case 11:
        int v5 = [(NTKSampleComplicationDataSource *)self _moonPhaseTemplate];
        goto LABEL_22;
      case 13:
        int v5 = [(NTKSampleComplicationDataSource *)self _batteryTemplate];
        goto LABEL_22;
      case 15:
        int v5 = [(NTKSampleComplicationDataSource *)self _heartrateTemplate];
        goto LABEL_22;
      case 17:
        int v5 = [(NTKSampleComplicationDataSource *)self _musicTemplate];
        goto LABEL_22;
      case 19:
        int v5 = [(NTKSampleComplicationDataSource *)self _breathingTemplate];
        goto LABEL_22;
      case 20:
        int v5 = [(NTKSampleComplicationDataSource *)self _reminderTemplate];
        goto LABEL_22;
      case 26:
        int v5 = [(NTKSampleComplicationDataSource *)self _newsTemplate];
        goto LABEL_22;
      case 29:
        int v5 = [(NTKSampleComplicationDataSource *)self _siriTemplate];
        goto LABEL_22;
      case 34:
        int v5 = [(NTKSampleComplicationDataSource *)self _nowPlayingTemplate];
        goto LABEL_22;
      case 35:
        int v5 = [(NTKSampleComplicationDataSource *)self _radioTemplate];
        goto LABEL_22;
      case 38:
        int v5 = [(NTKSampleComplicationDataSource *)self _solarTemplate];
        goto LABEL_22;
      case 39:
        v6 = self;
        uint64_t v7 = 0;
        goto LABEL_20;
      case 40:
        v6 = self;
        uint64_t v7 = 1;
        goto LABEL_20;
      case 41:
        v6 = self;
        uint64_t v7 = 2;
LABEL_20:
        int v5 = [(NTKSampleComplicationDataSource *)v6 _astronomyTemplateFromVista:v7];
        goto LABEL_22;
      case 42:
        int v5 = [(NTKSampleComplicationDataSource *)self _podcastsTemplate];
LABEL_22:
        complicationTemplate = self->_complicationTemplate;
        self->_complicationTemplate = v5;

        break;
      default:
        break;
    }
  }
  BOOL v9 = self->_complicationTemplate;
  return (id)[(CLKComplicationTemplate *)v9 finalizedCopy];
}

- (id)_batteryTemplate
{
  v3 = objc_opt_new();
  uint64_t v4 = [MEMORY[0x1E4F19A20] complicationDate];
  [v3 setEntryDate:v4];

  LODWORD(v5) = 1.0;
  [v3 setLevel:v5];
  [v3 setState:1];
  v6 = objc_msgSend(v3, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  uint64_t v7 = [v6 complicationTemplate];

  return v7;
}

- (id)_heartrateTemplate
{
  v39[8] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F19A20] complicationDate];
  uint64_t v4 = objc_opt_new();
  [v4 setEntryDate:v3];
  double v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [v5 dateByAddingUnit:64 value:-3 toDate:v3 options:0];
  [v4 setMeasurementDate:v6];

  [v4 setHasBPM:1];
  [v4 setBPM:64];
  if ([(CLKCComplicationDataSource *)self family] == 11)
  {
    v32 = v5;
    v31 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 54, 11);
    v39[0] = v31;
    v33 = self;
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 66, 40);
    objc_msgSend(v7, "addIndexesInRange:", 125, 25);
    objc_super v8 = (void *)[v7 copy];

    v39[1] = v8;
    BOOL v9 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 63, 82);
    objc_msgSend(v9, "addIndexesInRange:", 155, 18);
    BOOL v10 = (void *)[v9 copy];

    v39[2] = v10;
    v11 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 65, 10);
    v39[3] = v11;
    v12 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 55, 21);
    v39[4] = v12;
    v13 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 60, 35);
    v39[5] = v13;
    v14 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 62, 18);
    objc_msgSend(v14, "addIndexesInRange:", 90, 18);
    v15 = (void *)[v14 copy];

    v39[6] = v15;
    v16 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 65, 30);
    v39[7] = v16;
    char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:8];

    int64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v17, "count"));
    int v19 = NTKStartOfDayForDate(v3);
    v20 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    char v21 = [v20 components:124 fromDate:v3];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __53__NTKSampleComplicationDataSource__heartrateTemplate__block_invoke;
    v34[3] = &unk_1E62C1620;
    id v35 = v21;
    id v36 = v20;
    id v37 = v19;
    id v38 = v18;
    id v22 = v18;
    id v23 = v19;
    self = v33;
    id v24 = v23;
    id v25 = v20;
    id v26 = v21;
    [v17 enumerateObjectsUsingBlock:v34];
    [v4 setHasSummary:1];
    [v4 setDailyHighBPM:173];
    [v4 setDailyLowBPM:54];
    v27 = (void *)[v22 copy];
    [v4 setChartPoints:v27];

    double v5 = v32;
  }
  char v28 = objc_msgSend(v4, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v29 = [v28 complicationTemplate];

  return v29;
}

void __53__NTKSampleComplicationDataSource__heartrateTemplate__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHour:", objc_msgSend(v5, "hour") + ((a3 & 1) == 0));
    uint64_t v7 = (a3 << 63 >> 63) & 0x1E;
  }
  else
  {
    [v5 setHour:6];
    uint64_t v7 = 0;
  }
  [*(id *)(a1 + 32) setMinute:v7];
  id v10 = [*(id *)(a1 + 40) nextDateAfterDate:*(void *)(a1 + 48) matchingComponents:*(void *)(a1 + 32) options:2];
  objc_super v8 = *(void **)(a1 + 56);
  BOOL v9 = [MEMORY[0x1E4F62158] chartPointWithDate:v10 valueIndexSet:v6];

  [v8 addObject:v9];
}

- (id)_moonPhaseTemplate
{
  v3 = objc_opt_new();
  [v3 setPhaseNumber:88];
  [v3 setHemisphere:0];
  [v3 setEvent:0];
  uint64_t v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v5 = [MEMORY[0x1E4F19A20] complicationDate];
  id v6 = [v4 dateBySettingHour:21 minute:58 second:0 ofDate:v5 options:0];
  [v3 setEventDate:v6];

  uint64_t v7 = NUNILocalizedString();
  [v3 setPhaseName:v7];

  objc_super v8 = objc_msgSend(v3, "templateForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  if ([(CLKCComplicationDataSource *)self family] == 1)
  {
    id v9 = v8;
    id v10 = [v9 body2TextProvider];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v12 = [MEMORY[0x1E4F19A20] complicationDate];
      v13 = [v9 body2TextProvider];
      [v13 setRelativeToDate:v12];
    }
  }

  return v8;
}

- (id)_stopwatchTemplate
{
  v37[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F19AB0];
  uint64_t v4 = CLKFormatTimeIntervalSeconds();
  double v5 = [v3 textProviderWithText:v4];

  id v6 = (void *)MEMORY[0x1E4F19AB0];
  uint64_t v7 = CLKFormatTimeIntervalSeconds();
  objc_super v8 = [v6 textProviderWithText:v7];

  int64_t v9 = [(CLKCComplicationDataSource *)self family];
  id v10 = 0;
  switch(v9)
  {
    case 0:
      v14 = [(CLKCComplicationDataSource *)self device];
      v15 = +[NTKComplicationModuleView _modularSmallStopwatchImageProviderForDevice:v14];

      v16 = (void *)MEMORY[0x1E4F199C8];
      goto LABEL_8;
    case 1:
      char v17 = (void *)MEMORY[0x1E4F19AB0];
      int64_t v18 = NTKClockFaceLocalizedString(@"STOPWATCH_TITLE", 0);
      v15 = [v17 textProviderWithText:v18];

      uint64_t v19 = [MEMORY[0x1E4F19988] templateWithHeaderTextProvider:v15 bodyTextProvider:v8];
      goto LABEL_9;
    case 2:
    case 6:
      v11 = +[NTKUtilityComplicationView _stopwatchImageProvider];
      v12 = (void *)MEMORY[0x1E4F199E8];
      v13 = v5;
      goto LABEL_12;
    case 3:
      v11 = +[NTKUtilityComplicationView _stopwatchImageProvider];
      v12 = (void *)MEMORY[0x1E4F199E0];
      goto LABEL_11;
    case 4:
      v11 = +[NTKCircularComplicationView _stopwatchImageProviderMedium:0];
      uint64_t v20 = [MEMORY[0x1E4F19740] templateWithImageProvider:v11];
      goto LABEL_13;
    case 7:
      char v21 = [(CLKCComplicationDataSource *)self device];
      v15 = +[NTKComplicationModuleView _extraLargeStopwatchImageProviderForDevice:v21];

      v16 = (void *)MEMORY[0x1E4F197A8];
LABEL_8:
      uint64_t v19 = [v16 templateWithLine1ImageProvider:v15 line2TextProvider:v5];
LABEL_9:
      id v10 = (void *)v19;

      goto LABEL_15;
    case 8:
      v11 = [MEMORY[0x1E4F19A60] symbolImageProviderWithSystemName:@"stopwatch"];
      [v11 setMonochromeFilterType:1];
      id v22 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v11 setTintColor:v22];

      id v23 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v8 setTintColor:v23];

      v12 = (void *)MEMORY[0x1E4F19888];
LABEL_11:
      v13 = v8;
LABEL_12:
      uint64_t v20 = [v12 templateWithTextProvider:v13 imageProvider:v11];
      goto LABEL_13;
    case 9:
      id v36 = @"NTKStopwatchBezelComplicationMetadataTimeTextProviderKey";
      v37[0] = v8;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      uint64_t v20 = [MEMORY[0x1E4F197C0] templateWithMetadata:v11];
LABEL_13:
      id v10 = (void *)v20;
      goto LABEL_14;
    case 10:
      id v26 = [MEMORY[0x1E4F1CA60] dictionary];
      [v26 setObject:@"NTKStopwatchComplicationMetadataStateValue_Stopped" forKeyedSubscript:@"NTKStopwatchComplicationMetadataStateKey"];
      char v28 = (void *)MEMORY[0x1E4F197E8];
      goto LABEL_28;
    case 11:
      v11 = [MEMORY[0x1E4F19A60] symbolImageProviderWithSystemName:@"stopwatch"];
      [v11 setMonochromeFilterType:1];
      v29 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v11 setTintColor:v29];

      v30 = (void *)MEMORY[0x1E4F19AB0];
      v31 = NTKClockFaceLocalizedString(@"STOPWATCH_TITLE", @"Stopwatch");
      v32 = [v30 textProviderWithText:v31];

      v33 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v32 setTintColor:v33];

      id v10 = [MEMORY[0x1E4F19930] templateWithHeaderImageProvider:v11 headerTextProvider:v32 bodyTextProvider:v8];

LABEL_14:
      goto LABEL_15;
    case 12:
      id v26 = [MEMORY[0x1E4F1CA60] dictionary];
      [v26 setObject:@"NTKStopwatchComplicationMetadataStateValue_Stopped" forKeyedSubscript:@"NTKStopwatchComplicationMetadataStateKey"];
      char v28 = (void *)MEMORY[0x1E4F198B8];
LABEL_28:
      id v10 = [v28 templateWithMetadata:v26];
      goto LABEL_21;
    default:
LABEL_15:
      if (v9 == *MEMORY[0x1E4F19648])
      {
        id v24 = +[NTKCircularComplicationView _stopwatchImageProviderMedium:1];
        id v25 = [MEMORY[0x1E4F19700] templateWithImageProvider:v24];
      }
      else
      {
        if (v9 != *MEMORY[0x1E4F19650]) {
          goto LABEL_20;
        }
        id v25 = [MEMORY[0x1E4F199D8] templateWithTextProvider:v8];

        v34 = @"NTKSimpleTextComplicationTypeMetadataKey";
        id v35 = &unk_1F16E07C8;
        id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        [v25 setMetadata:v24];
      }
      id v10 = v25;

LABEL_20:
      id v26 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v10 setTintColor:v26];
LABEL_21:

      return v10;
  }
}

- (id)_alarmTemplate
{
  v3 = [(CLKCComplicationDataSource *)self device];
  uint64_t v4 = +[NTKAlarmTimelineEntry companionModelWithDevice:v3];

  double v5 = objc_msgSend(v4, "templateForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));

  return v5;
}

- (id)_worldClockTemplate
{
  v3 = [(NTKSampleComplicationDataSource *)self _city];
  uint64_t v4 = v3;
  if (v3)
  {
    double v5 = (void *)MEMORY[0x1E4F1CAF0];
    id v6 = [v3 timeZone];
    uint64_t v7 = [v5 timeZoneWithName:v6];

    objc_super v8 = (void *)MEMORY[0x1E4F19AB0];
    int64_t v9 = NTKWorldClockCityAbbreviation(v4);
    id v10 = [v8 textProviderWithText:v9];

    v11 = (void *)MEMORY[0x1E4F19AB0];
    v12 = [v4 name];
    v13 = [v11 textProviderWithText:v12];

    v14 = (void *)MEMORY[0x1E4F19AE0];
    v15 = NTKIdealizedDate();
    v16 = [v14 textProviderWithDate:v15 timeZone:v7];
  }
  else
  {
    v16 = 0;
    v13 = 0;
    id v10 = 0;
    uint64_t v7 = 0;
  }
  int64_t v17 = [(CLKCComplicationDataSource *)self family];
  int64_t v18 = 0;
  if (v17 == 104) {
    uint64_t v19 = 6;
  }
  else {
    uint64_t v19 = v17;
  }
  switch(v19)
  {
    case 0:
      if (v10 && v16)
      {
        id v20 = v10;
        id v25 = v16;
      }
      else
      {
        id v20 = [MEMORY[0x1E4F19AB0] textProviderWithText:&stru_1F1635E90];
        id v25 = [MEMORY[0x1E4F19AB0] textProviderWithText:&stru_1F1635E90];
      }
      char v21 = v25;
      v29 = (void *)MEMORY[0x1E4F199D0];
      goto LABEL_32;
    case 1:
      v53 = v13;
      if (v13)
      {
        id v26 = v13;
      }
      else
      {
        id v26 = [MEMORY[0x1E4F19AB0] textProviderWithText:&stru_1F1635E90];
      }
      id v20 = v26;
      uint64_t v36 = [v7 secondsFromGMT];
      id v37 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
      double v38 = (double)(v36 - [v37 secondsFromGMT]);

      v39 = [MEMORY[0x1E4F19B00] dayForOffset:v38];
      v54 = [MEMORY[0x1E4F19B00] differenceForOffset:0 caps:0 suppressZero:v38];
      v40 = (void *)MEMORY[0x1E4F19AB0];
      v41 = [v54 string];
      v52 = [v40 textProviderWithText:v41];

      v42 = NTKClockFaceLocalizedString(@"WORLDCLOCK_DAY_BEFORE_TIME", @"string used by localizers as a BOOL");
      LODWORD(v41) = [v42 BOOLValue];

      v43 = NTKClockFaceLocalizedString(@"WORLDCLOCK_NO_SPACE_BETWEEN_DAY_TIME", @"string used by localizers as a BOOL");
      int v44 = [v43 BOOLValue];

      id v45 = v16;
      v46 = v39;
      if (v41)
      {
        v47 = v45;
      }
      else
      {
        v39 = v45;
        v47 = v46;
      }
      v48 = (void *)MEMORY[0x1E4F19AC0];
      if (v44) {
        v49 = @"%@%@";
      }
      else {
        v49 = @"%@ %@";
      }
      id v51 = v46;
      v50 = objc_msgSend(v48, "textProviderWithFormat:", v49, v39, v47);
      int64_t v18 = [MEMORY[0x1E4F19978] templateWithHeaderTextProvider:v20 body1TextProvider:v50 body2TextProvider:v52];

      v13 = v53;
      goto LABEL_34;
    case 2:
    case 6:
      [v16 setDisallowBothMinutesAndDesignator:1];
      if (CLKIsCurrentLocaleCJK()) {
        id v23 = @"%@ %@";
      }
      else {
        id v23 = @"%@ %@";
      }
      objc_msgSend(MEMORY[0x1E4F19AC0], "textProviderWithFormat:", v23, v10, v16);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v24 = (void *)MEMORY[0x1E4F199E8];
      goto LABEL_19;
    case 3:
      id v20 = [MEMORY[0x1E4F19AC0] textProviderWithFormat:@"%@ %@", v16, v13];
      id v24 = (void *)MEMORY[0x1E4F199E0];
LABEL_19:
      int64_t v18 = [v24 templateWithTextProvider:v20];
      goto LABEL_34;
    case 4:
      if (v10 && v16)
      {
        id v20 = v10;
        id v27 = v16;
      }
      else
      {
        id v20 = [MEMORY[0x1E4F19AB0] textProviderWithText:&stru_1F1635E90];
        id v27 = [MEMORY[0x1E4F19AB0] textProviderWithText:&stru_1F1635E90];
      }
      char v21 = v27;
      v29 = (void *)MEMORY[0x1E4F19758];
      goto LABEL_32;
    case 7:
      if (v10 && v16)
      {
        id v20 = v10;
        id v28 = v16;
      }
      else
      {
        id v20 = [MEMORY[0x1E4F19AB0] textProviderWithText:&stru_1F1635E90];
        id v28 = [MEMORY[0x1E4F19AB0] textProviderWithText:&stru_1F1635E90];
      }
      char v21 = v28;
      v29 = (void *)MEMORY[0x1E4F197B0];
LABEL_32:
      uint64_t v22 = [v29 templateWithLine1TextProvider:v20 line2TextProvider:v21];
      goto LABEL_33;
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      id v20 = [(NTKSampleComplicationDataSource *)self _currentEntryModel];
      char v21 = [v20 entryForComplicationFamily:v19];
      uint64_t v22 = [v21 complicationTemplate];
LABEL_33:
      int64_t v18 = (void *)v22;

LABEL_34:
      break;
    default:
      break;
  }
  if (v19 == *MEMORY[0x1E4F19648])
  {
    if (v10 && v16)
    {
      id v30 = v10;
      id v31 = v16;
    }
    else
    {
      id v30 = [MEMORY[0x1E4F19AB0] textProviderWithText:&stru_1F1635E90];
      id v31 = [MEMORY[0x1E4F19AB0] textProviderWithText:&stru_1F1635E90];
    }
    v32 = v31;
    uint64_t v33 = [MEMORY[0x1E4F19718] templateWithLine1TextProvider:v30 line2TextProvider:v31];

    int64_t v18 = (void *)v33;
  }
  v34 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v18 setTintColor:v34];

  return v18;
}

- (id)_currentEntryModel
{
  v3 = objc_opt_new();
  uint64_t v4 = [MEMORY[0x1E4F19A20] complicationDate];
  [v3 setEntryDate:v4];

  [v3 setShowIdealizedTime:1];
  double v5 = [(NTKSampleComplicationDataSource *)self _city];
  [v3 setCity:v5];

  return v3;
}

- (id)_city
{
  v2 = [(CLKCComplicationDataSource *)self complication];
  v3 = [v2 city];

  return v3;
}

- (id)_musicTemplate
{
  int64_t v3 = [(CLKCComplicationDataSource *)self family];
  uint64_t v4 = @"music";
  double v5 = NTKMusicTintColor();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__NTKSampleComplicationDataSource__musicTemplate__block_invoke;
  aBlock[3] = &unk_1E62C1648;
  aBlock[4] = self;
  id v6 = v4;
  id v45 = v6;
  id v7 = v5;
  id v46 = v7;
  uint64_t v47 = 0x3FEB333333333333;
  objc_super v8 = (void (**)(void))_Block_copy(aBlock);
  int64_t v9 = NTKClockFaceLocalizedString(@"MUSIC_COMPLICATION_SIGNATURE_NOW_PLAYING_TITLE", @"%1$@ - %2$@");
  id v10 = objc_msgSend(NSString, "stringWithFormat:", v9, @"Try Me", @"Jorja Smith");
  v11 = 0;
  switch(v3)
  {
    case 0:
      v12 = [MEMORY[0x1E4FB1618] whiteColor];
      v13 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:&unk_1F16E08D0 tintColor:v12 fallbackImageName:@"modularSmallMusicProgress"];

      v15 = (void *)MEMORY[0x1E4F199A8];
      goto LABEL_8;
    case 1:
      [MEMORY[0x1E4F19AB0] textProviderWithText:@"Try Me"];
      objc_claimAutoreleasedReturnValue();
      NTKImageNamed(@"modularLargeMusicEqualizer");
    case 2:
      v16 = [MEMORY[0x1E4FB1618] whiteColor];
      [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:&unk_1F16E08A0 tintColor:v16 fallbackImageName:@"utilityCornerMusicProgress"];
      v18 = int64_t v17 = v10;

      [MEMORY[0x1E4F19AA8] simpleProgressProviderWithProgress:0.85];
      v20 = uint64_t v19 = v8;
      [v20 setTintColor:v7];
      v11 = [MEMORY[0x1E4F199F0] templateWithImageProvider:v18 progressProvider:v20 ringStyle:0];

      objc_super v8 = v19;
      id v10 = v17;
      break;
    case 3:
      NTKImageNamed(@"utilityLongMusicEqualizer");
    case 4:
      char v21 = [MEMORY[0x1E4FB1618] whiteColor];
      v13 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:&unk_1F16E08B8 tintColor:v21 fallbackImageName:@"colorAnalogMusicProgress"];

      v15 = (void *)MEMORY[0x1E4F19730];
      goto LABEL_8;
    case 7:
      uint64_t v22 = [MEMORY[0x1E4FB1618] whiteColor];
      v13 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v22 fallbackImageName:@"modularXLMusicProgress"];

      v15 = (void *)MEMORY[0x1E4F19788];
LABEL_8:
      LODWORD(v14) = 1062836634;
      v11 = [v15 templateWithImageProvider:v13 fillFraction:0 ringStyle:v14];
      goto LABEL_13;
    case 8:
      id v23 = [MEMORY[0x1E4FB1618] whiteColor];
      v13 = [(NTKSampleComplicationDataSource *)self _fullColorImageProviderWithSystemImageName:v6 tintColor:v23 fallbackImageName:@"music_signature_corner"];

      id v24 = [MEMORY[0x1E4F19AB0] textProviderWithText:v10];
      [v24 setTintColor:v7];
      uint64_t v25 = [MEMORY[0x1E4F19888] templateWithTextProvider:v24 imageProvider:v13];
      goto LABEL_12;
    case 9:
      id v26 = [MEMORY[0x1E4F19AB0] textProviderWithText:v10];
      id v27 = (void *)MEMORY[0x1E4F197B8];
      v8[2](v8);
      v43 = v6;
      id v28 = v9;
      id v30 = v29 = v10;
      v11 = [v27 templateWithCircularTemplate:v30 textProvider:v26];

      id v10 = v29;
      int64_t v9 = v28;
      id v6 = v43;

      break;
    case 10:
      v11 = v8[2](v8);
      break;
    case 11:
      NTKImageNamed(@"modularLargeMusicEqualizer");
    case 12:
      id v31 = [MEMORY[0x1E4FB1618] whiteColor];
      v13 = [(NTKSampleComplicationDataSource *)self _fullColorImageProviderWithSystemImageName:v6 tintColor:v31 fallbackImageName:@"graphicXLMusicProgress"];

      LODWORD(v32) = 1062836634;
      id v24 = [MEMORY[0x1E4F19AA0] gaugeProviderWithStyle:1 gaugeColor:v7 fillFraction:v32];
      uint64_t v25 = [MEMORY[0x1E4F19898] templateWithGaugeProvider:v24 imageProvider:v13];
LABEL_12:
      v11 = (void *)v25;

LABEL_13:
      break;
    default:
      break;
  }
  if (v3 == *MEMORY[0x1E4F19648])
  {
    uint64_t v33 = [MEMORY[0x1E4FB1618] whiteColor];
    v34 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v33 fallbackImageName:@"victoryMusicProgress"];

    LODWORD(v35) = 1062836634;
    uint64_t v36 = [MEMORY[0x1E4F196F8] templateWithImageProvider:v34 fillFraction:0 ringStyle:v35];

    v11 = (void *)v36;
  }
  if (v3 == 11
    && ([(CLKCComplicationDataSource *)self context],
        id v37 = objc_claimAutoreleasedReturnValue(),
        int v38 = [v37 showsBackground],
        v37,
        v38))
  {
    id v39 = objc_alloc(MEMORY[0x1E4F196C0]);
    v40 = NTKMusicPlatterBackgroundColor();
    v41 = (void *)[v39 initWithBackgroundColor:v40];
    [v11 setBackgroundDescriptor:v41];
  }
  else
  {
    [v11 setTintColor:v7];
  }

  return v11;
}

id __49__NTKSampleComplicationDataSource__musicTemplate__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x1E4FB1618] whiteColor];
  double v5 = [v2 _fullColorImageProviderWithSystemImageName:v3 tintColor:v4 fallbackImageName:@"victoryMusicProgress"];

  double v6 = *(double *)(a1 + 56);
  *(float *)&double v6 = v6;
  id v7 = [MEMORY[0x1E4F19AA0] gaugeProviderWithStyle:1 gaugeColor:*(void *)(a1 + 48) fillFraction:v6];
  objc_super v8 = [MEMORY[0x1E4F197C8] templateWithGaugeProvider:v7 imageProvider:v5];

  return v8;
}

- (id)_radioTemplate
{
  v33[1] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(CLKCComplicationDataSource *)self family];
  uint64_t v4 = @"dot.radiowaves.left.and.right";
  double v5 = NTKRadioTintColor();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__NTKSampleComplicationDataSource__radioTemplate__block_invoke;
  aBlock[3] = &unk_1E62C1670;
  aBlock[4] = self;
  double v6 = v4;
  id v30 = v6;
  id v7 = v5;
  id v31 = v7;
  objc_super v8 = (void (**)(void))_Block_copy(aBlock);
  int64_t v9 = v8;
  id v10 = 0;
  switch(v3)
  {
    case 0:
      v11 = [MEMORY[0x1E4FB1618] whiteColor];
      v12 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v11 fallbackImageName:@"ModularSmallRadio"];

      v13 = (void *)MEMORY[0x1E4F199B8];
      goto LABEL_8;
    case 1:
      v12 = [MEMORY[0x1E4F19AB0] textProviderWithText:@"Try Me"];
      double v14 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v7 fallbackImageName:@"ModularLargeRadio"];
      v15 = [MEMORY[0x1E4F19AB0] textProviderWithText:@"Jorja Smith"];
      v16 = [MEMORY[0x1E4F19A80] textProviderWithText:@"falling or flying" overrideBlock:&__block_literal_global_745];
      id v10 = [MEMORY[0x1E4F19978] templateWithHeaderImageProvider:v14 headerTextProvider:v12 body1TextProvider:v15 body2TextProvider:v16];

      goto LABEL_16;
    case 2:
      int64_t v17 = [MEMORY[0x1E4FB1618] whiteColor];
      v12 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v17 fallbackImageName:@"UtilityCornerRadio"];

      v13 = (void *)MEMORY[0x1E4F19A08];
      goto LABEL_8;
    case 3:
      int64_t v18 = [MEMORY[0x1E4FB1618] whiteColor];
      v12 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v18 fallbackImageName:@"UtilityTextStringRadio"];

      double v14 = [MEMORY[0x1E4F19AB0] textProviderWithText:@"Try Me"];
      uint64_t v19 = (void *)MEMORY[0x1E4F199E0];
      goto LABEL_10;
    case 4:
      id v20 = [MEMORY[0x1E4FB1618] whiteColor];
      v12 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v20 fallbackImageName:@"ColorRadio"];

      v13 = (void *)MEMORY[0x1E4F19740];
      goto LABEL_8;
    case 7:
      char v21 = [MEMORY[0x1E4FB1618] whiteColor];
      v12 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v21 fallbackImageName:@"XLRadio"];

      v13 = (void *)MEMORY[0x1E4F19798];
LABEL_8:
      id v10 = [v13 templateWithImageProvider:v12];
      goto LABEL_17;
    case 8:
      uint64_t v22 = [MEMORY[0x1E4FB1618] whiteColor];
      v12 = [(NTKSampleComplicationDataSource *)self _fullColorImageProviderWithSystemImageName:v6 tintColor:v22 fallbackImageName:@"GraphicCornerRadio"];

      double v14 = [MEMORY[0x1E4F19AB0] textProviderWithText:@"Try Me"];
      [v14 setTintColor:v7];
      uint64_t v19 = (void *)MEMORY[0x1E4F19888];
LABEL_10:
      uint64_t v23 = [v19 templateWithTextProvider:v14 imageProvider:v12];
      goto LABEL_12;
    case 9:
      v12 = [MEMORY[0x1E4F19AB0] textProviderWithText:@"Try Me"];
      id v24 = (void *)MEMORY[0x1E4F197B8];
      double v14 = v9[2](v9);
      uint64_t v23 = [v24 templateWithCircularTemplate:v14 textProvider:v12];
LABEL_12:
      id v10 = (void *)v23;
      goto LABEL_16;
    case 10:
      id v10 = v8[2](v8);
      break;
    case 11:
      NTKImageNamed(@"modularLargeMusicEqualizer");
    case 12:
      v12 = [(NTKSampleComplicationDataSource *)self _fullColorImageProviderWithSystemImageName:v6 tintColor:v7 fallbackImageName:@"GraphicXLRadio"];
      id v10 = [MEMORY[0x1E4F198B0] templateWithImageProvider:v12];
      uint64_t v32 = *MEMORY[0x1E4F19698];
      v33[0] = MEMORY[0x1E4F1CC38];
      double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
      [v10 setMetadata:v14];
LABEL_16:

LABEL_17:
      break;
    default:
      break;
  }
  if (v3 == *MEMORY[0x1E4F19648])
  {
    uint64_t v25 = [MEMORY[0x1E4FB1618] whiteColor];
    id v26 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v25 fallbackImageName:@"VictoryDigitalRadio"];

    uint64_t v27 = [MEMORY[0x1E4F19700] templateWithImageProvider:v26];

    id v10 = (void *)v27;
  }
  [v10 setTintColor:v7];

  return v10;
}

id __49__NTKSampleComplicationDataSource__radioTemplate__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) _fullColorImageProviderWithSystemImageName:*(void *)(a1 + 40) tintColor:*(void *)(a1 + 48) fallbackImageName:@"VictoryDigitalRadio"];
  v2 = [MEMORY[0x1E4F197E0] templateWithImageProvider:v1];
  uint64_t v5 = *MEMORY[0x1E4F19698];
  v6[0] = MEMORY[0x1E4F1CC38];
  int64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 setMetadata:v3];

  return v2;
}

- (id)_podcastsTemplate
{
  int64_t v3 = [(CLKCComplicationDataSource *)self family];
  uint64_t v4 = @"podcasts";
  uint64_t v5 = NTKPodcastsTintColor();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__NTKSampleComplicationDataSource__podcastsTemplate__block_invoke;
  aBlock[3] = &unk_1E62C1670;
  aBlock[4] = self;
  double v6 = v4;
  uint64_t v32 = v6;
  id v7 = v5;
  id v33 = v7;
  objc_super v8 = (void (**)(void))_Block_copy(aBlock);
  int64_t v9 = v8;
  id v10 = 0;
  switch(v3)
  {
    case 0:
      v11 = [MEMORY[0x1E4FB1618] whiteColor];
      v12 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v11 fallbackImageName:@"ModularSmallPodcast"];

      v13 = [MEMORY[0x1E4FB1618] whiteColor];
      [v12 setTintColor:v13];

      double v14 = (void *)MEMORY[0x1E4F199B8];
      goto LABEL_12;
    case 1:
      [MEMORY[0x1E4F19AB0] textProviderWithText:@"Bigfoot"];
      objc_claimAutoreleasedReturnValue();
      NTKImageNamed(@"modularLargeMusicEqualizer");
    case 2:
      v15 = [MEMORY[0x1E4FB1618] whiteColor];
      v12 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v15 fallbackImageName:@"UtilityCornerPodcast"];

      double v14 = (void *)MEMORY[0x1E4F19A08];
      goto LABEL_12;
    case 3:
      NTKImageNamed(@"utilityLongMusicEqualizer");
    case 4:
      v16 = [MEMORY[0x1E4FB1618] whiteColor];
      v12 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v16 fallbackImageName:@"ColorPodcast"];

      double v14 = (void *)MEMORY[0x1E4F19740];
      goto LABEL_12;
    case 7:
      int64_t v17 = [MEMORY[0x1E4FB1618] whiteColor];
      v12 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v17 fallbackImageName:@"XLPodcast"];

      double v14 = (void *)MEMORY[0x1E4F19798];
      goto LABEL_12;
    case 8:
      int64_t v18 = [MEMORY[0x1E4FB1618] whiteColor];
      v12 = [(NTKSampleComplicationDataSource *)self _fullColorImageProviderWithSystemImageName:v6 tintColor:v18 fallbackImageName:@"GraphicCornerPodcast"];

      uint64_t v19 = [MEMORY[0x1E4F19AB0] textProviderWithText:@"Bigfoot"];
      [v19 setTintColor:v7];
      uint64_t v20 = [MEMORY[0x1E4F19888] templateWithTextProvider:v19 imageProvider:v12];
      goto LABEL_10;
    case 9:
      v12 = [MEMORY[0x1E4F19AB0] textProviderWithText:@"Bigfoot"];
      char v21 = (void *)MEMORY[0x1E4F197B8];
      uint64_t v19 = v9[2](v9);
      uint64_t v20 = [v21 templateWithCircularTemplate:v19 textProvider:v12];
LABEL_10:
      id v10 = (void *)v20;

      goto LABEL_13;
    case 10:
      id v10 = v8[2](v8);
      break;
    case 11:
      NTKImageNamed(@"modularLargeMusicEqualizer");
    case 12:
      v12 = [(NTKSampleComplicationDataSource *)self _fullColorImageProviderWithSystemImageName:v6 tintColor:v7 fallbackImageName:@"GraphicXLPodcast"];
      double v14 = (void *)MEMORY[0x1E4F198B0];
LABEL_12:
      id v10 = [v14 templateWithImageProvider:v12];
LABEL_13:

      break;
    default:
      break;
  }
  if (v3 == *MEMORY[0x1E4F19648])
  {
    uint64_t v22 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v23 = [(NTKSampleComplicationDataSource *)self _imageProviderWithSystemImageName:v6 overridePointSize:0 tintColor:v22 fallbackImageName:@"VictoryDigitalPodcast"];

    uint64_t v24 = [MEMORY[0x1E4F19700] templateWithImageProvider:v23];

    id v10 = (void *)v24;
  }
  if (v3 == 11
    && ([(CLKCComplicationDataSource *)self context],
        uint64_t v25 = objc_claimAutoreleasedReturnValue(),
        int v26 = [v25 showsBackground],
        v25,
        v26))
  {
    id v27 = objc_alloc(MEMORY[0x1E4F196C0]);
    id v28 = NTKPodcastsPlatterBackgroundColor();
    v29 = (void *)[v27 initWithBackgroundColor:v28];
    [v10 setBackgroundDescriptor:v29];
  }
  else
  {
    [v10 setTintColor:v7];
  }

  return v10;
}

id __52__NTKSampleComplicationDataSource__podcastsTemplate__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) _fullColorImageProviderWithSystemImageName:*(void *)(a1 + 40) tintColor:*(void *)(a1 + 48) fallbackImageName:@"VictoryDigitalPodcast"];
  v2 = [MEMORY[0x1E4F197E0] templateWithImageProvider:v1];
  uint64_t v5 = *MEMORY[0x1E4F19698];
  v6[0] = MEMORY[0x1E4F1CC38];
  int64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 setMetadata:v3];

  return v2;
}

- (id)_nowPlayingTemplate
{
  int64_t v2 = [(CLKCComplicationDataSource *)self family];
  int64_t v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  switch(v2)
  {
    case 1:
      [MEMORY[0x1E4F19AB0] textProviderWithText:@"Try Me"];
      objc_claimAutoreleasedReturnValue();
      NTKImageNamed(@"modularLargeMusicEqualizer");
    case 11:
      NTKImageNamed(@"modularLargeMusicEqualizer");
    case 3:
      NTKImageNamed(@"utilityLongMusicEqualizer");
  }
  [0 setTintColor:v3];

  return 0;
}

- (id)_reminderTemplate
{
  int64_t v3 = objc_opt_new();
  uint64_t v4 = NTKClockFaceLocalizedString(@"COMPLICATION_SAMPLE_REMINDER", 0);
  [v3 setPrimaryReminderTitle:v4];

  uint64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v6 = +[CLKDate unmodifiedDate];
  id v7 = [v5 dateBySettingHour:15 minute:0 second:0 ofDate:v6 options:0];
  [v3 setDueDate:v7];

  [v3 setOverlappingReminderCount:1];
  objc_super v8 = objc_msgSend(v3, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  int64_t v9 = [v8 complicationTemplate];

  return v9;
}

- (id)_breathingTemplate
{
  int64_t v3 = [(CLKCComplicationDataSource *)self family];
  switch(v3)
  {
    case 0:
      if ([(NTKSampleComplicationDataSource *)self supportsFlowerImages]) {
        NTKImageNamed(@"modularSmallBreathe");
      }
      NTKImageNamed(@"modularBreatheBee");
    case 2:
    case 6:
      if ([(NTKSampleComplicationDataSource *)self supportsFlowerImages]) {
        NTKImageNamed(@"utilityCornerBreathe");
      }
      NTKImageNamed(@"analogCornerBreatheBee");
    case 4:
      if ([(NTKSampleComplicationDataSource *)self supportsFlowerImages]) {
        uint64_t v4 = @"circularSmallBreathe";
      }
      else {
        uint64_t v4 = @"colorAnalogBreatheBee";
      }
      NTKImageNamed(v4);
    case 7:
      if ([(NTKSampleComplicationDataSource *)self supportsFlowerImages]) {
        NTKImageNamed(@"XLBreathe");
      }
      NTKImageNamed(@"XLModularBreatheBee");
    case 8:
      NTKClockFaceLocalizedFormat(@"BREATHE_MINUTES_FORMAT", @"%i MINUTES");
      objc_msgSend(NSString, "localizedStringWithFormat:", objc_claimAutoreleasedReturnValue(), 2);
      uint64_t v5 = [MEMORY[0x1E4F19AB0] textProviderWithText:objc_claimAutoreleasedReturnValue()];
      double v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.22 green:0.64 blue:0.68 alpha:1.0];
      [v5 setTintColor:v6];

      NTKImageNamed(@"signatureCornerBreatheSmall");
    case 9:
      NTKImageNamed(@"signatureCircularBreathe");
    case 10:
      NTKImageNamed(@"signatureCircularBreathe");
    case 12:
      NTKImageNamed(@"graphicXLCircularBreathe");
    default:
      if (v3 == *MEMORY[0x1E4F19648])
      {
        if ([(NTKSampleComplicationDataSource *)self supportsFlowerImages]) {
          id v7 = @"circularMediumBreathe";
        }
        else {
          id v7 = @"victoryNTKBreatheBee";
        }
        NTKImageNamed(v7);
      }
      return 0;
  }
}

- (BOOL)supportsFlowerImages
{
  int64_t v2 = [(CLKCComplicationDataSource *)self device];
  BOOL v3 = [v2 nrDeviceVersion] >> 16 > 4;

  return v3;
}

- (id)_newsTemplate
{
  BOOL v3 = (void *)NewsServicesLibraryCore();
  if (v3)
  {
    id NSSComplicationDataSourceClass = getNSSComplicationDataSourceClass();
    if (objc_opt_respondsToSelector())
    {
      int64_t v5 = [(CLKCComplicationDataSource *)self family];
      double v6 = [(CLKCComplicationDataSource *)self device];
      BOOL v7 = [v6 sizeClass] == 0;

      BOOL v3 = objc_msgSend(NSSComplicationDataSourceClass, "nss_newsComplicationTemplateForFamily:compact:", v5, v7);
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  return v3;
}

- (id)_siriTemplate
{
  if ([(CLKCComplicationDataSource *)self family] == 10)
  {
    BOOL v3 = [MEMORY[0x1E4F19A58] fullColorImageProviderWithImageViewClass:objc_opt_class()];
    uint64_t v4 = (void *)MEMORY[0x1E4F197E0];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__NTKSampleComplicationDataSource__siriTemplate__block_invoke;
    v7[3] = &unk_1E62C1698;
    v7[4] = self;
    BOOL v3 = [MEMORY[0x1E4F19A68] imageProviderWithImageViewCreationHandler:v7];
    uint64_t v4 = (void *)MEMORY[0x1E4F199B8];
  }
  int64_t v5 = [v4 templateWithImageProvider:v3];

  return v5;
}

NTKStaticSiriAnimationView *__48__NTKSampleComplicationDataSource__siriTemplate__block_invoke(uint64_t a1, double a2, double a3)
{
  double v6 = [NTKStaticSiriAnimationView alloc];
  BOOL v7 = [*(id *)(a1 + 32) device];
  objc_super v8 = -[NTKStaticSiriAnimationView initWithFrame:forDevice:](v6, "initWithFrame:forDevice:", v7, 0.0, 0.0, a2, a3);

  return v8;
}

- (id)_solarTemplate
{
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = +[NTKLocationManager sharedLocationManager];
  int64_t v5 = [v4 anyLocation];

  [v3 setObject:v5 forKeyedSubscript:@"NTKSolarComplicationEntryLocationKey"];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"NTKSolarComplicationUseIdealizedTimeKey"];
  int64_t v6 = [(CLKCComplicationDataSource *)self family];
  switch(v6)
  {
    case 12:
      BOOL v7 = (id *)0x1E4F198B8;
      goto LABEL_7;
    case 10:
      BOOL v7 = (id *)0x1E4F197E8;
      goto LABEL_7;
    case 9:
      BOOL v7 = (id *)0x1E4F197C0;
LABEL_7:
      objc_super v8 = [*v7 templateWithMetadata:v3];
      goto LABEL_9;
  }
  objc_super v8 = 0;
LABEL_9:

  return v8;
}

- (id)_astronomyTemplateFromVista:(unint64_t)a3
{
  int64_t v5 = +[NTKLocationManager sharedLocationManager];
  int64_t v6 = [v5 anyLocation];

  BOOL v7 = [NTKAstronomyTimelineEntryModel alloc];
  objc_super v8 = [MEMORY[0x1E4F1C9C8] date];
  int64_t v9 = NTKIdealizedDate();
  id v10 = [(NTKAstronomyTimelineEntryModel *)v7 initWithVista:a3 entryDate:v8 currentDate:v9 currentLocation:v6 anyLocation:v6];

  v11 = [(NTKAstronomyTimelineEntryModel *)v10 templateForComplicationFamily:[(CLKCComplicationDataSource *)self family]];

  return v11;
}

- (void)_localeDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NTKSampleComplicationDataSource__localeDidChange___block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __52__NTKSampleComplicationDataSource__localeDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 invalidateSwitcherTemplate];
}

- (id)_imageProviderWithSystemImageName:(id)a3 overridePointSize:(id)a4 tintColor:(id)a5 fallbackImageName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  double v14 = objc_opt_class();
  v15 = [(CLKCComplicationDataSource *)self device];
  LODWORD(v14) = [v14 _shouldUseFallbackImagesForDevice:v15];

  if (v14) {
    NTKImageNamed(v12);
  }
  v16 = [MEMORY[0x1E4F19AB8] _symbolImageProviderWithSystemName:v10];
  [v16 setTintColor:v13];

  [v16 setOverridePointSize:v11];
  return v16;
}

- (id)_fullColorImageProviderWithSystemImageName:(id)a3 tintColor:(id)a4 fallbackImageName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_opt_class();
  id v12 = [(CLKCComplicationDataSource *)self device];
  if ([v11 _shouldUseFallbackImagesForDevice:v12]) {
    NTKImageNamed(v9);
  }
  id v13 = [MEMORY[0x1E4F19A60] _symbolImageProviderWithSystemName:v8];

  [v13 setTintColor:v10];
  return v13;
}

+ (BOOL)_shouldUseFallbackImagesForDevice:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  int64_t v5 = (void *)[[v3 alloc] initWithUUIDString:@"436C3C42-1855-4417-BD50-BD3D1B870E0F"];
  char v6 = [v4 supportsCapability:v5];

  return v6 ^ 1;
}

- (void).cxx_destruct
{
}

@end