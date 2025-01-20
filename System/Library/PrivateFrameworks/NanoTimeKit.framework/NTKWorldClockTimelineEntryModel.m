@interface NTKWorldClockTimelineEntryModel
+ (id)_analogImageProvider;
+ (id)_appPrimaryColor;
+ (id)_fullColorGlobeImageProviderWithTintColor:(id)a3;
+ (id)_genericPrivacyRedactionTextProvider;
+ (id)_globeImageProvider;
+ (id)_uppercaseAppNameTextProvider;
- (BOOL)isPrivacy;
- (BOOL)showIdealizedTime;
- (WorldClockCity)city;
- (double)_timeZoneOffset;
- (id)_abbreviationTextProvider;
- (id)_circularMediumTemplate;
- (id)_circularSmallTemplate;
- (id)_cityNameTextProvider;
- (id)_dayOffsetTextProvider;
- (id)_differenceTextProvider;
- (id)_differenceTextProviderWithSize:(int64_t)a3 andCaps:(BOOL)a4;
- (id)_extraLargeTemplate;
- (id)_getSolarColorsForLocation:(id)a3 atDate:(id)a4;
- (id)_graphicBezelTemplate;
- (id)_graphicCircularMetadata;
- (id)_graphicCircularTemplate;
- (id)_graphicCornerTemplate;
- (id)_graphicExtraLargeCircularTemplate;
- (id)_graphicRectangularTemplate;
- (id)_largeInlineTemplate;
- (id)_largeModularTemplate;
- (id)_smallInlineTemplate;
- (id)_smallModularTemplate;
- (id)_solarGradientColors;
- (id)_timeAndAbbreviationTextProvider;
- (id)_timeAndCityNameOffsetTextProvider;
- (id)_timeAndDayOffsetTextProvider;
- (id)_timeAndDifferenceOffsetTextProvider;
- (id)_timeCityNameTimeZoneOffsetTextProvider;
- (id)_timeTextProvider;
- (id)_timeZone;
- (id)templateForComplicationFamily:(int64_t)a3;
- (void)_graphicRectangularTemplate;
- (void)setCity:(id)a3;
- (void)setIsPrivacy:(BOOL)a3;
- (void)setShowIdealizedTime:(BOOL)a3;
@end

@implementation NTKWorldClockTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  v5 = 0;
  int v6 = 1;
  switch(a3)
  {
    case 0:
      uint64_t v7 = [(NTKWorldClockTimelineEntryModel *)self _smallModularTemplate];
      goto LABEL_13;
    case 1:
      uint64_t v7 = [(NTKWorldClockTimelineEntryModel *)self _largeModularTemplate];
      goto LABEL_13;
    case 2:
    case 6:
      uint64_t v7 = [(NTKWorldClockTimelineEntryModel *)self _smallInlineTemplate];
      goto LABEL_13;
    case 3:
      uint64_t v7 = [(NTKWorldClockTimelineEntryModel *)self _largeInlineTemplate];
      goto LABEL_13;
    case 4:
      uint64_t v7 = [(NTKWorldClockTimelineEntryModel *)self _circularSmallTemplate];
      goto LABEL_13;
    case 7:
      uint64_t v7 = [(NTKWorldClockTimelineEntryModel *)self _extraLargeTemplate];
      goto LABEL_13;
    case 8:
      uint64_t v7 = [(NTKWorldClockTimelineEntryModel *)self _graphicCornerTemplate];
      goto LABEL_13;
    case 9:
      uint64_t v7 = [(NTKWorldClockTimelineEntryModel *)self _graphicBezelTemplate];
      goto LABEL_13;
    case 10:
      uint64_t v7 = [(NTKWorldClockTimelineEntryModel *)self _graphicCircularTemplate];
      goto LABEL_13;
    case 11:
      v5 = [(NTKWorldClockTimelineEntryModel *)self _graphicRectangularTemplate];
      int v6 = 0;
      break;
    case 12:
      uint64_t v7 = [(NTKWorldClockTimelineEntryModel *)self _graphicExtraLargeCircularTemplate];
LABEL_13:
      v5 = (void *)v7;
      break;
    default:
      break;
  }
  if (*MEMORY[0x1E4F19648] == a3)
  {
    uint64_t v8 = [(NTKWorldClockTimelineEntryModel *)self _circularMediumTemplate];

    v5 = (void *)v8;
  }
  if (v6)
  {
    v9 = +[NTKWorldClockTimelineEntryModel _appPrimaryColor];
    [v5 setTintColor:v9];
  }
  return v5;
}

- (id)_graphicRectangularTemplate
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(NTKWorldClockTimelineEntryModel *)(uint64_t)self _graphicRectangularTemplate];
  }

  if (self->_isPrivacy)
  {
    v4 = +[NTKWorldClockTimelineEntryModel _uppercaseAppNameTextProvider];
    v5 = +[NTKWorldClockTimelineEntryModel _appPrimaryColor];
    [v4 setTintColor:v5];
  }
  else
  {
    v5 = [(NTKWorldClockTimelineEntryModel *)self _abbreviationTextProvider];
    int v6 = objc_msgSend(MEMORY[0x1E4FB1618], "ntk_wc_sunYellowColor");
    [v5 setTintColor:v6];

    uint64_t v7 = [(NTKWorldClockTimelineEntryModel *)self _timeAndDifferenceOffsetTextProvider];
    uint64_t v8 = [MEMORY[0x1E4FB1618] whiteColor];
    [v7 setTintColor:v8];

    v9 = (void *)MEMORY[0x1E4F19AC0];
    v10 = NTKClockFaceLocalizedString(@"WORLD_CLOCK_ABBREVIATION_TIME_OFFSET_FORMAT", @"%1$@ %2$@");
    v4 = objc_msgSend(v9, "textProviderWithFormat:", v10, v5, v7);
  }
  v11 = [MEMORY[0x1E4F19A58] fullColorImageProviderWithImageViewClass:objc_opt_class()];
  if (self->_isPrivacy)
  {
    v31 = @"IsPrivacy";
    v32[0] = MEMORY[0x1E4F1CC38];
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    [v11 setMetadata:v12];
  }
  else
  {
    v29[0] = @"Latitude";
    v13 = NSNumber;
    v12 = [(NTKWorldClockTimelineEntryModel *)self city];
    v26 = [v12 alCity];
    [v26 latitude];
    v14 = objc_msgSend(v13, "numberWithFloat:");
    v30[0] = v14;
    v29[1] = @"Longitude";
    v15 = NSNumber;
    v16 = [(NTKWorldClockTimelineEntryModel *)self city];
    v17 = [v16 alCity];
    [v17 longitude];
    v18 = objc_msgSend(v15, "numberWithFloat:");
    v30[1] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    [v11 setMetadata:v19];
  }
  id v20 = objc_alloc(MEMORY[0x1E4F196C0]);
  v21 = [(NTKWorldClockTimelineEntryModel *)self _solarGradientColors];
  v22 = (void *)[v20 initWithGradientBackgroundColors:v21];

  v23 = [MEMORY[0x1E4F19928] templateWithTextProvider:v4 imageProvider:v11];
  uint64_t v27 = *MEMORY[0x1E4F19690];
  v28 = &unk_1F16E3F00;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  [v23 setMetadata:v24];

  [v23 setUISensitivity:0];
  [v23 setBackgroundDescriptor:v22];

  return v23;
}

- (id)_smallInlineTemplate
{
  if (self->_isPrivacy)
  {
    v2 = +[NTKWorldClockTimelineEntryModel _uppercaseAppNameTextProvider];
    uint64_t v3 = +[NTKWorldClockTimelineEntryModel _globeImageProvider];
LABEL_5:
    v4 = (void *)v3;
    goto LABEL_6;
  }
  if (self->_showIdealizedTime)
  {
    v2 = [(NTKWorldClockTimelineEntryModel *)self _abbreviationTextProvider];
    uint64_t v3 = +[NTKWorldClockTimelineEntryModel _analogImageProvider];
    goto LABEL_5;
  }
  v2 = [(NTKWorldClockTimelineEntryModel *)self _timeAndAbbreviationTextProvider];
  v4 = 0;
LABEL_6:
  v5 = [MEMORY[0x1E4F199E8] templateWithTextProvider:v2 imageProvider:v4];

  return v5;
}

- (id)_smallModularTemplate
{
  uint64_t v3 = (void *)MEMORY[0x1E4F199D0];
  v4 = [(NTKWorldClockTimelineEntryModel *)self _abbreviationTextProvider];
  v5 = [(NTKWorldClockTimelineEntryModel *)self _timeTextProvider];
  int v6 = [v3 templateWithLine1TextProvider:v4 line2TextProvider:v5];

  return v6;
}

- (id)_largeModularTemplate
{
  if (self->_isPrivacy)
  {
    v2 = +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider];
    uint64_t v3 = +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider];
    +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider];
  }
  else
  {
    v2 = [(NTKWorldClockTimelineEntryModel *)self _cityNameTextProvider];
    uint64_t v3 = [(NTKWorldClockTimelineEntryModel *)self _timeAndDayOffsetTextProvider];
    [(NTKWorldClockTimelineEntryModel *)self _differenceTextProvider];
  v5 = };
  int v6 = [MEMORY[0x1E4F19978] templateWithHeaderTextProvider:v2 body1TextProvider:v3 body2TextProvider:v5];

  return v6;
}

- (id)_circularSmallTemplate
{
  if (self->_isPrivacy)
  {
    v2 = +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider];
    +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider];
  }
  else
  {
    v2 = [(NTKWorldClockTimelineEntryModel *)self _abbreviationTextProvider];
    [(NTKWorldClockTimelineEntryModel *)self _timeTextProvider];
  v4 = };
  v5 = [MEMORY[0x1E4F19758] templateWithLine1TextProvider:v2 line2TextProvider:v4];

  return v5;
}

- (id)_circularMediumTemplate
{
  if (self->_isPrivacy)
  {
    v2 = +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider];
    +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider];
  }
  else
  {
    v2 = [(NTKWorldClockTimelineEntryModel *)self _abbreviationTextProvider];
    [(NTKWorldClockTimelineEntryModel *)self _timeTextProvider];
  v4 = };
  v5 = [MEMORY[0x1E4F19718] templateWithLine1TextProvider:v2 line2TextProvider:v4];

  return v5;
}

- (id)_extraLargeTemplate
{
  if (self->_isPrivacy)
  {
    v2 = +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider];
    +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider];
  }
  else
  {
    v2 = [(NTKWorldClockTimelineEntryModel *)self _abbreviationTextProvider];
    [(NTKWorldClockTimelineEntryModel *)self _timeTextProvider];
  v4 = };
  v5 = [MEMORY[0x1E4F197B0] templateWithLine1TextProvider:v2 line2TextProvider:v4];

  return v5;
}

- (id)_largeInlineTemplate
{
  if (self->_isPrivacy)
  {
    v2 = +[NTKWorldClockTimelineEntryModel _uppercaseAppNameTextProvider];
    uint64_t v3 = +[NTKWorldClockTimelineEntryModel _globeImageProvider];
  }
  else
  {
    v2 = [(NTKWorldClockTimelineEntryModel *)self _timeAndCityNameOffsetTextProvider];
    uint64_t v3 = 0;
  }
  v4 = [MEMORY[0x1E4F199E0] templateWithTextProvider:v2 imageProvider:v3];

  return v4;
}

- (id)_graphicCornerTemplate
{
  if (self->_isPrivacy)
  {
    v2 = +[NTKWorldClockTimelineEntryModel _uppercaseAppNameTextProvider];
    uint64_t v3 = +[NTKWorldClockTimelineEntryModel _appPrimaryColor];
    [v2 setTintColor:v3];

    v4 = [MEMORY[0x1E4FB1618] whiteColor];
    v5 = +[NTKWorldClockTimelineEntryModel _fullColorGlobeImageProviderWithTintColor:v4];

    [MEMORY[0x1E4F19888] templateWithTextProvider:v2 imageProvider:v5];
  }
  else
  {
    v2 = [(NTKWorldClockTimelineEntryModel *)self _timeAndDifferenceOffsetTextProvider];
    uint64_t v7 = +[NTKWorldClockTimelineEntryModel _appPrimaryColor];
    [v2 setTintColor:v7];

    v5 = [(NTKWorldClockTimelineEntryModel *)self _abbreviationTextProvider];
    [MEMORY[0x1E4F19880] templateWithInnerTextProvider:v2 outerTextProvider:v5];
  uint64_t v8 = };

  return v8;
}

- (id)_graphicCircularMetadata
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_city forKeyedSubscript:@"NTKWorldClockComplicationCityKey"];
  v4 = [(NTKWorldClockTimelineEntryModel *)self _timeZone];
  [v3 setObject:v4 forKeyedSubscript:@"NTKWorldClockComplicationTimeZoneKey"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[NTKWorldClockTimelineEntryModel showIdealizedTime](self, "showIdealizedTime"));
  [v3 setObject:v5 forKeyedSubscript:@"NTKWorldClockComplicationShowIdealizedTimeKey"];

  int v6 = objc_msgSend(NSNumber, "numberWithBool:", -[NTKWorldClockTimelineEntryModel isPrivacy](self, "isPrivacy"));
  [v3 setObject:v6 forKeyedSubscript:@"NTKWorldClockComplicationIsPrivacyKey"];

  return v3;
}

- (id)_graphicCircularTemplate
{
  v2 = (void *)MEMORY[0x1E4F197E8];
  uint64_t v3 = [(NTKWorldClockTimelineEntryModel *)self _graphicCircularMetadata];
  v4 = [v2 templateWithMetadata:v3];

  return v4;
}

- (id)_graphicExtraLargeCircularTemplate
{
  v2 = (void *)MEMORY[0x1E4F198B8];
  uint64_t v3 = [(NTKWorldClockTimelineEntryModel *)self _graphicCircularMetadata];
  v4 = [v2 templateWithMetadata:v3];

  return v4;
}

- (id)_graphicBezelTemplate
{
  if (self->_isPrivacy) {
    +[NTKWorldClockTimelineEntryModel _uppercaseAppNameTextProvider];
  }
  else {
  uint64_t v3 = [(NTKWorldClockTimelineEntryModel *)self _timeCityNameTimeZoneOffsetTextProvider];
  }
  v4 = (void *)MEMORY[0x1E4F197B8];
  v5 = [(NTKWorldClockTimelineEntryModel *)self _graphicCircularTemplate];
  int v6 = [v4 templateWithCircularTemplate:v5 textProvider:v3];

  return v6;
}

+ (id)_appPrimaryColor
{
  return (id)[MEMORY[0x1E4FB1618] systemOrangeColor];
}

+ (id)_genericPrivacyRedactionTextProvider
{
  v2 = NTKClockFaceLocalizedString(@"WORLDCLOCK_PRIVACY_REDACTION_TEXT", @"--");
  uint64_t v3 = [MEMORY[0x1E4F19AB0] textProviderWithText:v2];

  return v3;
}

+ (id)_uppercaseAppNameTextProvider
{
  v2 = NTKClockFaceLocalizedString(@"WORLDCLOCK_TITLE", @"World Clock");
  uint64_t v3 = [v2 localizedUppercaseString];

  v4 = [MEMORY[0x1E4F19AB0] textProviderWithText:v3];

  return v4;
}

- (id)_timeTextProvider
{
  uint64_t v3 = (void *)MEMORY[0x1E4F19A18];
  v4 = [(NTKWorldClockTimelineEntryModel *)self _timeZone];
  v5 = [v3 textProviderWithTimeZone:v4];

  [v5 setDisallowBothMinutesAndDesignator:1];
  if (self->_showIdealizedTime)
  {
    int v6 = NTKIdealizedDate();
    [v5 setOverrideDate:v6];
  }
  else
  {
    [v5 setOverrideDate:0];
  }
  return v5;
}

- (id)_dayOffsetTextProvider
{
  v2 = (void *)MEMORY[0x1E4F19B00];
  [(NTKWorldClockTimelineEntryModel *)self _timeZoneOffset];
  uint64_t v3 = objc_msgSend(v2, "dayForOffset:");
  v4 = [MEMORY[0x1E4F19AB0] textProviderWithText:v3];

  return v4;
}

- (id)_differenceTextProvider
{
  return [(NTKWorldClockTimelineEntryModel *)self _differenceTextProviderWithSize:0 andCaps:0];
}

- (id)_differenceTextProviderWithSize:(int64_t)a3 andCaps:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = (void *)MEMORY[0x1E4F19B00];
  [(NTKWorldClockTimelineEntryModel *)self _timeZoneOffset];
  uint64_t v7 = objc_msgSend(v6, "differenceForOffset:caps:suppressZero:size:", v4, 0, a3);
  uint64_t v8 = [v7 string];

  v9 = [MEMORY[0x1E4F19AB0] textProviderWithText:v8];

  return v9;
}

- (id)_abbreviationTextProvider
{
  v2 = (void *)MEMORY[0x1E4F19AB0];
  uint64_t v3 = NTKWorldClockCityAbbreviation(self->_city);
  BOOL v4 = [v2 textProviderWithText:v3];

  return v4;
}

- (id)_cityNameTextProvider
{
  v2 = (void *)MEMORY[0x1E4F19AB0];
  uint64_t v3 = [(WorldClockCity *)self->_city name];
  BOOL v4 = [v2 textProviderWithText:v3];

  return v4;
}

- (id)_timeAndDayOffsetTextProvider
{
  uint64_t v3 = [(NTKWorldClockTimelineEntryModel *)self _timeTextProvider];
  [v3 setDisallowBothMinutesAndDesignator:0];
  BOOL v4 = [(NTKWorldClockTimelineEntryModel *)self _dayOffsetTextProvider];
  v5 = [MEMORY[0x1E4F19AC0] textProviderWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)_timeAndAbbreviationTextProvider
{
  uint64_t v3 = [(NTKWorldClockTimelineEntryModel *)self _abbreviationTextProvider];
  BOOL v4 = [(NTKWorldClockTimelineEntryModel *)self _timeTextProvider];
  v5 = [MEMORY[0x1E4F19AC0] textProviderWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)_timeAndCityNameOffsetTextProvider
{
  uint64_t v3 = [(NTKWorldClockTimelineEntryModel *)self _timeTextProvider];
  [v3 setDisallowBothMinutesAndDesignator:0];
  BOOL v4 = (void *)MEMORY[0x1E4F19AB0];
  v5 = [(WorldClockCity *)self->_city name];
  int v6 = [v4 textProviderWithText:v5];

  uint64_t v7 = [MEMORY[0x1E4F19AC0] textProviderWithFormat:@"%@ %@", v3, v6];

  return v7;
}

- (id)_timeCityNameTimeZoneOffsetTextProvider
{
  uint64_t v3 = [(NTKWorldClockTimelineEntryModel *)self _timeTextProvider];
  [v3 setDisallowBothMinutesAndDesignator:0];
  BOOL v4 = [(NTKWorldClockTimelineEntryModel *)self _dayOffsetTextProvider];
  v5 = [(NTKWorldClockTimelineEntryModel *)self _differenceTextProvider];
  int v6 = NTKClockFaceLocalizedString(@"WORLD_CLOCK_BEZEL_TEXT_FORMAT", @"%1$@ %2$@ • %3$@");
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F19AC0], "textProviderWithFormat:", v6, v3, v4, v5);

  return v7;
}

- (id)_timeAndDifferenceOffsetTextProvider
{
  uint64_t v3 = [(NTKWorldClockTimelineEntryModel *)self _timeTextProvider];
  [v3 setDisallowBothMinutesAndDesignator:0];
  BOOL v4 = [(NTKWorldClockTimelineEntryModel *)self _differenceTextProviderWithSize:0 andCaps:1];
  v5 = [v4 text];
  int v6 = [v5 lowercaseString];

  uint64_t v7 = [MEMORY[0x1E4F19AB0] textProviderWithText:v6];
  [v7 setUseLowercaseSmallCaps:1];

  uint64_t v8 = [MEMORY[0x1E4F19AC0] textProviderWithFormat:@"%@, %@", v3, v7];

  return v8;
}

- (id)_timeZone
{
  v2 = (void *)MEMORY[0x1E4F1CAF0];
  uint64_t v3 = [(WorldClockCity *)self->_city timeZone];
  BOOL v4 = [v2 timeZoneWithName:v3];

  return v4;
}

- (double)_timeZoneOffset
{
  v2 = [(NTKWorldClockTimelineEntryModel *)self _timeZone];
  uint64_t v3 = [v2 secondsFromGMT];
  BOOL v4 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  double v5 = (double)(v3 - [v4 secondsFromGMT]);

  return v5;
}

+ (id)_analogImageProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&_analogImageProvider___lock);
  id WeakRetained = objc_loadWeakRetained(&_analogImageProvider___cachedDevice);
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    BOOL v4 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    id v5 = [v4 device];
    id v6 = objc_loadWeakRetained(&_analogImageProvider___cachedDevice);
    if (v5 == v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      uint64_t v8 = [v7 device];
      uint64_t v9 = [v8 version];
      uint64_t v10 = _analogImageProvider___previousCLKDeviceVersion;

      if (v9 == v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v11 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  v12 = [v11 device];
  objc_storeWeak(&_analogImageProvider___cachedDevice, v12);

  id v13 = objc_loadWeakRetained(&_analogImageProvider___cachedDevice);
  _analogImageProvider___previousCLKDeviceVersion = [v13 version];

  v14 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  v15 = [v14 device];
  __55__NTKWorldClockTimelineEntryModel__analogImageProvider__block_invoke();

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_analogImageProvider___lock);
  v16 = (void *)_analogImageProvider_imageProvider;
  return v16;
}

void __55__NTKWorldClockTimelineEntryModel__analogImageProvider__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"globe"];
  v1 = (void *)_analogImageProvider_imageProvider;
  _analogImageProvider_imageProvider = v0;

  v2 = (void *)_analogImageProvider_imageProvider;
  id v3 = +[NTKWorldClockTimelineEntryModel _appPrimaryColor];
  [v2 setTintColor:v3];
}

+ (id)_globeImageProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&_globeImageProvider___lock);
  id WeakRetained = objc_loadWeakRetained(&_globeImageProvider___cachedDevice);
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    BOOL v4 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    id v5 = [v4 device];
    id v6 = objc_loadWeakRetained(&_globeImageProvider___cachedDevice);
    if (v5 == v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      uint64_t v8 = [v7 device];
      uint64_t v9 = [v8 version];
      uint64_t v10 = _globeImageProvider___previousCLKDeviceVersion;

      if (v9 == v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v11 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  v12 = [v11 device];
  objc_storeWeak(&_globeImageProvider___cachedDevice, v12);

  id v13 = objc_loadWeakRetained(&_globeImageProvider___cachedDevice);
  _globeImageProvider___previousCLKDeviceVersion = [v13 version];

  v14 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  v15 = [v14 device];
  __54__NTKWorldClockTimelineEntryModel__globeImageProvider__block_invoke();

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_globeImageProvider___lock);
  v16 = (void *)_globeImageProvider_imageProvider;
  return v16;
}

void __54__NTKWorldClockTimelineEntryModel__globeImageProvider__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"globe"];
  v1 = (void *)_globeImageProvider_imageProvider;
  _globeImageProvider_imageProvider = v0;

  v2 = (void *)_globeImageProvider_imageProvider;
  id v3 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [v2 setTintColor:v3];
}

+ (id)_fullColorGlobeImageProviderWithTintColor:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = a3;
  id v5 = [v3 systemImageNamed:@"globe"];
  id v6 = [v5 imageWithRenderingMode:2];

  uint64_t v7 = [MEMORY[0x1E4F19A58] providerWithFullColorImage:v6 monochromeFilterType:1 applyScalingAndCircularMasking:0];
  [v7 setTintColor:v4];

  return v7;
}

- (void)setShowIdealizedTime:(BOOL)a3
{
  self->_showIdealizedTime = a3;
}

- (id)_solarGradientColors
{
  id v3 = [(NTKWorldClockTimelineEntryModel *)self city];
  uint64_t v4 = [v3 alCity];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(NTKTimelineEntryModel *)self entryDate];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      uint64_t v8 = [(NTKWorldClockTimelineEntryModel *)self city];
      uint64_t v9 = [v8 alCity];
      [v9 latitude];
      double v11 = v10;
      v12 = [(NTKWorldClockTimelineEntryModel *)self city];
      id v13 = [v12 alCity];
      [v13 longitude];
      v15 = (void *)[v7 initWithLatitude:v11 longitude:v14];

      v16 = [(NTKTimelineEntryModel *)self entryDate];
      v17 = [(NTKWorldClockTimelineEntryModel *)self _getSolarColorsForLocation:v15 atDate:v16];

      goto LABEL_6;
    }
  }
  else
  {
  }
  v17 = objc_msgSend(MEMORY[0x1E4FB1618], "ntk_wc_defaultSolarGradientColors");
LABEL_6:
  return v17;
}

- (id)_getSolarColorsForLocation:(id)a3 atDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:v5];
  double v8 = v7;
  uint64_t v9 = +[NTKSiderealDataSource siderealDataForLocation:v6 atDate:v5 useXR:1];

  *(float *)&double v10 = v8;
  double v11 = [v9 gradientWithSunsetFilterForDayProgress:v10];

  return v11;
}

- (WorldClockCity)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (BOOL)showIdealizedTime
{
  return self->_showIdealizedTime;
}

- (BOOL)isPrivacy
{
  return self->_isPrivacy;
}

- (void)setIsPrivacy:(BOOL)a3
{
  self->_isPrivacy = a3;
}

- (void).cxx_destruct
{
}

- (void)_graphicRectangularTemplate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NTKWorldClockCityAbbreviation(*(void **)(a1 + 24));
  id v5 = [*(id *)(a1 + 24) unlocalizedCityName];
  id v6 = [*(id *)(a1 + 24) alCity];
  [v6 latitude];
  double v8 = v7;
  uint64_t v9 = [*(id *)(a1 + 24) alCity];
  [v9 longitude];
  int v11 = 138544130;
  v12 = v4;
  __int16 v13 = 2114;
  float v14 = v5;
  __int16 v15 = 2048;
  double v16 = v8;
  __int16 v17 = 2048;
  double v18 = v10;
  _os_log_debug_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_DEBUG, "[World Clock] Building graphic rectangular template for %{public}@: %{public}@ <%f, %f>.", (uint8_t *)&v11, 0x2Au);
}

@end