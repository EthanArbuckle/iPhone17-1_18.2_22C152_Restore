@interface NTKHeartRateTimelineEntryModel
- (BOOL)hasBPM;
- (BOOL)hasSummary;
- (BOOL)isLocked;
- (BOOL)lessThanMinute;
- (NSArray)chartPoints;
- (NSDate)measurementDate;
- (id)_bpmString;
- (id)_heartrateString;
- (id)_metadataWithCurrentMeasurements;
- (id)_newCircularTemplateUsingMediumSize:(BOOL)a3;
- (id)_newExtraLargeTemplate;
- (id)_newModularLargeTemplate;
- (id)_newModularSmallTemplate;
- (id)_newSignatureBezelTemplate;
- (id)_newSignatureCircularTemplate;
- (id)_newSignatureCornerTemplate;
- (id)_newSignatureExtraLargeCircularTemplate;
- (id)_newSignatureRectangularTemplate;
- (id)_newUtilitarianLargeTemplate;
- (id)_newUtilitarianSmallFlatTemplate;
- (id)_newUtilitarianSmallTemplate;
- (id)_signatureBezelTextProvider;
- (id)templateForComplicationFamily:(int64_t)a3;
- (int64_t)BPM;
- (int64_t)dailyHighBPM;
- (int64_t)dailyLowBPM;
- (void)setBPM:(int64_t)a3;
- (void)setChartPoints:(id)a3;
- (void)setDailyHighBPM:(int64_t)a3;
- (void)setDailyLowBPM:(int64_t)a3;
- (void)setHasBPM:(BOOL)a3;
- (void)setHasSummary:(BOOL)a3;
- (void)setLessThanMinute:(BOOL)a3;
- (void)setLocked:(BOOL)a3;
- (void)setMeasurementDate:(id)a3;
@end

@implementation NTKHeartRateTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = _NTKLoggingObjectForDomain(14, (uint64_t)"NTKLoggingDomainDebug");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2048;
    int64_t v15 = a3;
    id v6 = v13;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting template for %ld family.", (uint8_t *)&v12, 0x16u);
  }
  v7 = 0;
  switch(a3)
  {
    case 0:
      id v8 = [(NTKHeartRateTimelineEntryModel *)self _newModularSmallTemplate];
      goto LABEL_16;
    case 1:
      id v8 = [(NTKHeartRateTimelineEntryModel *)self _newModularLargeTemplate];
      goto LABEL_16;
    case 2:
      id v8 = [(NTKHeartRateTimelineEntryModel *)self _newUtilitarianSmallTemplate];
      goto LABEL_16;
    case 3:
      id v8 = [(NTKHeartRateTimelineEntryModel *)self _newUtilitarianLargeTemplate];
      goto LABEL_16;
    case 4:
      id v8 = [(NTKHeartRateTimelineEntryModel *)self _newCircularTemplateUsingMediumSize:0];
      goto LABEL_16;
    case 6:
      id v8 = [(NTKHeartRateTimelineEntryModel *)self _newUtilitarianSmallFlatTemplate];
      goto LABEL_16;
    case 7:
      id v8 = [(NTKHeartRateTimelineEntryModel *)self _newExtraLargeTemplate];
      goto LABEL_16;
    case 8:
      id v8 = [(NTKHeartRateTimelineEntryModel *)self _newSignatureCornerTemplate];
      goto LABEL_16;
    case 9:
      id v8 = [(NTKHeartRateTimelineEntryModel *)self _newSignatureBezelTemplate];
      goto LABEL_16;
    case 10:
      id v8 = [(NTKHeartRateTimelineEntryModel *)self _newSignatureCircularTemplate];
      goto LABEL_16;
    case 11:
      id v8 = [(NTKHeartRateTimelineEntryModel *)self _newSignatureRectangularTemplate];
      goto LABEL_16;
    case 12:
      id v8 = [(NTKHeartRateTimelineEntryModel *)self _newSignatureExtraLargeCircularTemplate];
LABEL_16:
      v7 = v8;
      break;
    default:
      break;
  }
  if (*MEMORY[0x1E4F19648] == a3)
  {
    id v9 = [(NTKHeartRateTimelineEntryModel *)self _newCircularTemplateUsingMediumSize:1];
  }
  else
  {
    if (a3 != 104) {
      goto LABEL_22;
    }
    id v9 = [(NTKHeartRateTimelineEntryModel *)self _newUtilitarianLargeTemplate];
  }
  id v10 = v9;

  v7 = v10;
LABEL_22:
  return v7;
}

- (id)_newUtilitarianSmallFlatTemplate
{
}

- (id)_newUtilitarianSmallTemplate
{
}

- (id)_newUtilitarianLargeTemplate
{
  if (self->_hasBPM)
  {
    v2 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "hasBPM for family: _newUtilitarianLarge", buf, 2u);
    }

    NTKImageNamed(@"ColorHeartrate");
  }
  v3 = (void *)MEMORY[0x1E4F19AB0];
  v4 = NTKClockFaceLocalizedString(@"HEART_RATE_TITLE", 0);
  v5 = [v3 textProviderWithText:v4];

  id v6 = [MEMORY[0x1E4F199E0] templateWithTextProvider:v5 imageProvider:0];
  v7 = +[NTKHeartRateComplicationUtilties heartrateTintColor];
  [v6 setTintColor:v7];

  return v6;
}

- (id)_newCircularTemplateUsingMediumSize:(BOOL)a3
{
  if (a3) {
    v3 = @"VictoryNTKHeartrate";
  }
  else {
    v3 = @"ColorHeartrate";
  }
  NTKImageNamed(v3);
}

- (id)_newModularSmallTemplate
{
}

- (id)_newModularLargeTemplate
{
  if (self->_hasBPM)
  {
    v3 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "hasBPM for family: _newUtilitarianLarge", v22, 2u);
    }

    v4 = (void *)MEMORY[0x1E4F19AB0];
    v5 = NTKClockFaceLocalizedString(@"HEART_RATE_TITLE", 0);
    id v6 = [v4 textProviderWithText:v5];

    v7 = (void *)MEMORY[0x1E4F19AB0];
    id v8 = [(NTKHeartRateTimelineEntryModel *)self _heartrateString];
    id v9 = [v7 textProviderWithText:v8];

    if (self->_lessThanMinute)
    {
      id v10 = (void *)MEMORY[0x1E4F19AB0];
      v11 = NTKClockFaceLocalizedString(@"HEART_RATE_TIME_NOW", @"Now");
      int v12 = [v10 textProviderWithText:v11];
    }
    else
    {
      int v17 = NTKCanUseShortRelativeDateStyleForHeartRateComplicationStrings();
      v18 = (void *)MEMORY[0x1E4F19678];
      if (!v17) {
        v18 = (void *)MEMORY[0x1E4F19670];
      }
      int v12 = [MEMORY[0x1E4F19A88] textProviderWithDate:self->_measurementDate style:*v18 units:112];
      [v12 setTimeTravelUpdateFrequency:0];
      [v12 setDisableOffsetPrefix:1];
      [v12 setDisableSmallCapUnits:1];
      [v12 setItalicized:1];
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F19AB0];
    __int16 v14 = NTKClockFaceLocalizedString(@"HEART_RATE_TITLE", 0);
    id v6 = [v13 textProviderWithText:v14];

    int64_t v15 = (void *)MEMORY[0x1E4F19AB0];
    uint64_t v16 = NTKClockFaceLocalizedString(@"HEART_RATE_LARGE_MODULAR_NODATA", 0);
    id v9 = [v15 textProviderWithText:v16];

    int v12 = 0;
  }
  v19 = [MEMORY[0x1E4F19978] templateWithHeaderTextProvider:v6 body1TextProvider:v9 body2TextProvider:v12];
  v20 = +[NTKHeartRateComplicationUtilties heartrateTintColor];
  [v19 setTintColor:v20];

  return v19;
}

- (id)_newExtraLargeTemplate
{
}

- (id)_newSignatureCornerTemplate
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  NTKImageNamed(@"rich-corner_heartrate");
}

- (id)_newSignatureCircularTemplate
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  NTKImageNamed(@"VictoryNTKHeartrate");
}

- (id)_newSignatureExtraLargeCircularTemplate
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  NTKImageNamed(@"HeartrateGraphicXLGlyph");
}

- (id)_newSignatureBezelTemplate
{
  uint64_t v3 = (void *)MEMORY[0x1E4F197B8];
  id v4 = [(NTKHeartRateTimelineEntryModel *)self _newSignatureCircularTemplate];
  v5 = [(NTKHeartRateTimelineEntryModel *)self _signatureBezelTextProvider];
  id v6 = [v3 templateWithCircularTemplate:v4 textProvider:v5];

  return v6;
}

- (id)_signatureBezelTextProvider
{
  if ([(NTKHeartRateTimelineEntryModel *)self isLocked])
  {
    uint64_t v3 = NTKClockFaceLocalizedString(@"HEART_RATE_SIGNATURE_LARGE_LOCKED", @"Unlock to View");
    id v4 = [MEMORY[0x1E4F19AB0] textProviderWithText:v3];
  }
  else
  {
    if (![(NTKHeartRateTimelineEntryModel *)self hasBPM])
    {
      v11 = (void *)MEMORY[0x1E4F19AB0];
      int v12 = NTKClockFaceLocalizedString(@"HEART_RATE_LARGE_MODULAR_NODATA", 0);
      id v4 = [v11 textProviderWithText:v12];

      goto LABEL_14;
    }
    v5 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "hasBPM for family: _signaturebezel", buf, 2u);
    }

    id v6 = (void *)MEMORY[0x1E4F19AB0];
    v7 = [(NTKHeartRateTimelineEntryModel *)self _heartrateString];
    uint64_t v3 = [v6 textProviderWithText:v7];

    if (self->_lessThanMinute)
    {
      id v8 = (void *)MEMORY[0x1E4F19AB0];
      id v9 = NTKClockFaceLocalizedString(@"HEART_RATE_TIME_NOW", @"Now");
      id v10 = [v8 textProviderWithText:v9];
    }
    else
    {
      int v13 = NTKCanUseShortRelativeDateStyleForHeartRateComplicationStrings();
      __int16 v14 = (void *)MEMORY[0x1E4F19678];
      if (!v13) {
        __int16 v14 = (void *)MEMORY[0x1E4F19670];
      }
      id v10 = [MEMORY[0x1E4F19A88] textProviderWithDate:self->_measurementDate style:*v14 units:112];
      [v10 setTimeTravelUpdateFrequency:0];
      [v10 setDisableOffsetPrefix:1];
      [v10 setDisableSmallCapUnits:1];
    }
    int64_t v15 = (void *)MEMORY[0x1E4F19AC0];
    uint64_t v16 = NTKClockFaceLocalizedString(@"HEART_RATE_BEZEL_FORMAT", 0);
    id v4 = objc_msgSend(v15, "textProviderWithFormat:", v16, v3, v10);
  }
LABEL_14:
  return v4;
}

- (id)_metadataWithCurrentMeasurements
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NTKHeartRateTimelineEntryModel *)self isLocked])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[NTKHeartRateTimelineEntryModel isLocked](self, "isLocked"));
    v5 = NTKHeartRateRichComplicationMetadataKeyIsLocked;
LABEL_8:
    [v3 setObject:v4 forKeyedSubscript:*v5];

    goto LABEL_9;
  }
  if ([(NTKHeartRateTimelineEntryModel *)self hasBPM])
  {
    id v6 = [NSNumber numberWithInteger:self->_BPM];
    [v3 setObject:v6 forKeyedSubscript:@"NTKHeartRateRichComplicationMetadataKeyBPM"];

    v7 = [NSNumber numberWithBool:self->_lessThanMinute];
    [v3 setObject:v7 forKeyedSubscript:@"NTKHeartRateRichComplicationMetadataKeyIsNow"];

    [v3 setObject:self->_measurementDate forKeyedSubscript:@"NTKHeartRateRichComplicationMetadataKeyDate"];
  }
  if ([(NTKHeartRateTimelineEntryModel *)self hasSummary])
  {
    id v8 = [NSNumber numberWithInteger:self->_dailyHighBPM];
    [v3 setObject:v8 forKeyedSubscript:@"NTKHeartRateRichComplicationMetadataKeyDailyHighBPM"];

    id v9 = [NSNumber numberWithInteger:self->_dailyLowBPM];
    [v3 setObject:v9 forKeyedSubscript:@"NTKHeartRateRichComplicationMetadataKeyDailyLowBPM"];

    id v10 = [(NTKHeartRateTimelineEntryModel *)self chartPoints];

    if (v10)
    {
      id v4 = [(NTKHeartRateTimelineEntryModel *)self chartPoints];
      v5 = NTKHeartRateRichComplicationMetadataKeyChartPoints;
      goto LABEL_8;
    }
  }
LABEL_9:
  v11 = (void *)[v3 copy];

  return v11;
}

- (id)_newSignatureRectangularTemplate
{
  v2 = (void *)MEMORY[0x1E4F19940];
  uint64_t v3 = [(NTKHeartRateTimelineEntryModel *)self _metadataWithCurrentMeasurements];
  id v4 = [v2 templateWithMetadata:v3];

  return v4;
}

- (id)_heartrateString
{
  uint64_t v3 = NSString;
  id v4 = NTKClockFaceLocalizedString(@"HEART_RATE_READING", 0);
  v5 = [(NTKHeartRateTimelineEntryModel *)self _bpmString];
  id v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)_bpmString
{
  v2 = (void *)MEMORY[0x1E4F28EE0];
  uint64_t v3 = [NSNumber numberWithInteger:self->_BPM];
  id v4 = [v2 localizedStringFromNumber:v3 numberStyle:0];

  return v4;
}

- (NSDate)measurementDate
{
  return self->_measurementDate;
}

- (void)setMeasurementDate:(id)a3
{
}

- (int64_t)BPM
{
  return self->_BPM;
}

- (void)setBPM:(int64_t)a3
{
  self->_BPM = a3;
}

- (BOOL)hasBPM
{
  return self->_hasBPM;
}

- (void)setHasBPM:(BOOL)a3
{
  self->_hasBPM = a3;
}

- (BOOL)lessThanMinute
{
  return self->_lessThanMinute;
}

- (void)setLessThanMinute:(BOOL)a3
{
  self->_lessThanMinute = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (BOOL)hasSummary
{
  return self->_hasSummary;
}

- (void)setHasSummary:(BOOL)a3
{
  self->_hasSummary = a3;
}

- (int64_t)dailyLowBPM
{
  return self->_dailyLowBPM;
}

- (void)setDailyLowBPM:(int64_t)a3
{
  self->_dailyLowBPM = a3;
}

- (int64_t)dailyHighBPM
{
  return self->_dailyHighBPM;
}

- (void)setDailyHighBPM:(int64_t)a3
{
  self->_dailyHighBPM = a3;
}

- (NSArray)chartPoints
{
  return self->_chartPoints;
}

- (void)setChartPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartPoints, 0);
  objc_storeStrong((id *)&self->_measurementDate, 0);
}

@end