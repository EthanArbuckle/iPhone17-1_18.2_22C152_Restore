@interface NTKHeartRateRichComplicationRectangularView
- (NSArray)chartPoints;
- (NSDate)measurementDate;
- (NSDateInterval)measurementDateDayInterval;
- (NSNumber)highBPM;
- (NSNumber)lowBPM;
- (NTKHeartRateRichComplicationRectangularView)init;
- (double)_xValueForPointFromChartPoint:(id)a3 inRect:(CGRect)a4;
- (double)_yValueForPointFromChartPointValue:(id)a3 betweenHigh:(id)a4 andLow:(id)a5 inRect:(CGRect)a6;
- (double)cornerRadius;
- (void)_loadLockedState;
- (void)_loadNoDataState;
- (void)_loadWithMetadata:(id)a3;
- (void)_updateDailyLabel:(id)a3 withBPM:(id)a4;
- (void)drawGraph:(CGContext *)a3 rect:(CGRect)a4;
- (void)loadWithMetadata:(id)a3;
- (void)setChartPoints:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHighBPM:(id)a3;
- (void)setLowBPM:(id)a3;
- (void)setMeasurementDate:(id)a3;
- (void)setMeasurementDateDayInterval:(id)a3;
@end

@implementation NTKHeartRateRichComplicationRectangularView

- (NTKHeartRateRichComplicationRectangularView)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKHeartRateRichComplicationRectangularView;
  v2 = [(NTKRichComplicationRectangularDailyGraphView *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_cornerRadius = 1.0;
    [(NTKHeartRateRichComplicationRectangularView *)v2 setOpaque:0];
  }
  return v3;
}

- (void)drawGraph:(CGContext *)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v10 = [(NTKHeartRateRichComplicationRectangularView *)self chartPoints];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    [(NTKHeartRateRichComplicationRectangularView *)self cornerRadius];
    double v13 = y + v12;
    [(NTKHeartRateRichComplicationRectangularView *)self cornerRadius];
    double v15 = height + v14 * -2.0;
    v16 = [(NTKHeartRateRichComplicationRectangularView *)self highBPM];
    [v16 doubleValue];
    double v18 = v17;
    v19 = [(NTKHeartRateRichComplicationRectangularView *)self lowBPM];
    [v19 doubleValue];
    double v21 = v20;

    v28.origin.CGFloat x = x;
    v28.origin.double y = v13;
    v28.size.CGFloat width = width;
    v28.size.double height = v15;
    double v22 = CGRectGetHeight(v28);
    double v23 = 0.0;
    if (v22 > 2.22044605e-16)
    {
      [(NTKHeartRateRichComplicationRectangularView *)self cornerRadius];
      double v23 = (v18 - v21) * (v24 * 3.0 / v22);
    }
    v25 = [(NTKHeartRateRichComplicationRectangularView *)self chartPoints];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __62__NTKHeartRateRichComplicationRectangularView_drawGraph_rect___block_invoke;
    v27[3] = &unk_1E62C49B0;
    v27[4] = self;
    *(CGFloat *)&v27[5] = x;
    *(double *)&v27[6] = v13;
    *(CGFloat *)&v27[7] = width;
    *(double *)&v27[8] = v15;
    *(double *)&v27[9] = v23;
    v27[10] = a3;
    [v25 enumerateObjectsUsingBlock:v27];

    id v26 = [(NTKRichComplicationRectangularDailyGraphView *)self accentColor];
    CGContextSetFillColorWithColor(a3, (CGColorRef)[v26 CGColor]);

    CGContextDrawPath(a3, kCGPathFill);
  }
}

void __62__NTKHeartRateRichComplicationRectangularView_drawGraph_rect___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_xValueForPointFromChartPoint:inRect:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v5 = v4;
  if (v4 >= CGRectGetMinX(*(CGRect *)(a1 + 40)) && v5 <= CGRectGetMaxX(*(CGRect *)(a1 + 40)))
  {
    id v39 = v3;
    v6 = [v3 yValue];
    v7 = [MEMORY[0x1E4F1CA48] array];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __62__NTKHeartRateRichComplicationRectangularView_drawGraph_rect___block_invoke_2;
    v45[3] = &unk_1E62C4988;
    id v8 = v7;
    id v46 = v8;
    uint64_t v47 = *(void *)(a1 + 72);
    [v6 enumerateRangesUsingBlock:v45];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v42;
      double v12 = v5 + -0.5;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = [*(id *)(*((void *)&v41 + 1) + 8 * i) rangeValue];
          double v15 = *(void **)(a1 + 32);
          double v17 = [NSNumber numberWithUnsignedInteger:v16 + v14 - 1];
          double v18 = [*(id *)(a1 + 32) highBPM];
          v19 = [*(id *)(a1 + 32) lowBPM];
          objc_msgSend(v15, "_yValueForPointFromChartPointValue:betweenHigh:andLow:inRect:", v17, v18, v19, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
          double v21 = v20;

          double v22 = *(void **)(a1 + 32);
          double v23 = [NSNumber numberWithUnsignedInteger:v14];
          double v24 = [*(id *)(a1 + 32) highBPM];
          v25 = [*(id *)(a1 + 32) lowBPM];
          objc_msgSend(v22, "_yValueForPointFromChartPointValue:betweenHigh:andLow:inRect:", v23, v24, v25, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
          double v27 = v26 - v21;

          [*(id *)(a1 + 32) cornerRadius];
          CGFloat v29 = v21 - v28;
          [*(id *)(a1 + 32) cornerRadius];
          CGFloat v31 = v30 + v30;
          [*(id *)(a1 + 32) cornerRadius];
          CGFloat v33 = v27 + v32 * 2.0;
          [*(id *)(a1 + 32) cornerRadius];
          CGFloat v35 = v34;
          [*(id *)(a1 + 32) cornerRadius];
          CGFloat v37 = v36;
          v50.origin.CGFloat x = v12;
          v50.origin.double y = v29;
          v50.size.CGFloat width = v31;
          v50.size.double height = v33;
          v38 = CGPathCreateWithRoundedRect(v50, v35, v37, 0);
          CGContextAddPath(*(CGContextRef *)(a1 + 80), v38);
          CGPathRelease(v38);
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v10);
    }

    id v3 = v39;
  }
}

void __62__NTKHeartRateRichComplicationRectangularView_drawGraph_rect___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = [*(id *)(a1 + 32) lastObject];

  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    id v8 = [*(id *)(a1 + 32) lastObject];
    uint64_t v9 = [v8 rangeValue];
    uint64_t v11 = v10;

    if (*(double *)(a1 + 40) > (double)(unint64_t)(a2 - (v11 + v9) + 1))
    {
      uint64_t v12 = a2 + a3 - v9;
      double v13 = *(void **)(a1 + 32);
      uint64_t v14 = [v13 count] - 1;
      objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v9, v12);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v14);
      goto LABEL_7;
    }
    double v17 = *(void **)(a1 + 32);
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a2, a3);
    uint64_t v16 = v17;
  }
  else
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a2, a3);
    uint64_t v16 = v7;
  }
  id v18 = (id)v15;
  objc_msgSend(v16, "addObject:");
LABEL_7:
}

- (void)loadWithMetadata:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    double v4 = [v6 objectForKeyedSubscript:@"NTKHeartRateRichComplicationMetadataKeyIsLocked"];
    int v5 = [v4 BOOLValue];

    if (v5) {
      [(NTKHeartRateRichComplicationRectangularView *)self _loadLockedState];
    }
    else {
      [(NTKHeartRateRichComplicationRectangularView *)self _loadWithMetadata:v6];
    }
  }
  else
  {
    [(NTKHeartRateRichComplicationRectangularView *)self _loadNoDataState];
  }
  [(NTKHeartRateRichComplicationRectangularView *)self setNeedsDisplay];
}

- (void)_loadLockedState
{
  id v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateRichComplicationRectangularView: Load locked state.", v8, 2u);
  }

  double v4 = NTKClockFaceLocalizedString(@"HEART_RATE_SIGNATURE_LARGE_LOCKED", @"Unlock to View");
  int v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 preferredLocale];
  v7 = [v4 uppercaseStringWithLocale:v6];
  [(NTKRichComplicationRectangularDailyGraphView *)self resetToNoDataState:v7];

  [(NTKHeartRateRichComplicationRectangularView *)self setHighBPM:&unk_1F16E1938];
  [(NTKHeartRateRichComplicationRectangularView *)self setLowBPM:&unk_1F16E1938];
  [(NTKHeartRateRichComplicationRectangularView *)self setChartPoints:0];
}

- (void)_loadNoDataState
{
  id v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateRichComplicationRectangularView: Load no data state.", v8, 2u);
  }

  double v4 = NTKClockFaceLocalizedString(@"HEART_RATE_SIGNATURE_LARGE_NO_DATA", @"No Heart Rate Data");
  int v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 preferredLocale];
  v7 = [v4 uppercaseStringWithLocale:v6];
  [(NTKRichComplicationRectangularDailyGraphView *)self resetToNoDataState:v7];

  [(NTKHeartRateRichComplicationRectangularView *)self setHighBPM:&unk_1F16E1938];
  [(NTKHeartRateRichComplicationRectangularView *)self setLowBPM:&unk_1F16E1938];
  [(NTKHeartRateRichComplicationRectangularView *)self setChartPoints:0];
}

- (void)_loadWithMetadata:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"NTKHeartRateRichComplicationMetadataKeyDate"];
  if (v5)
  {
    [(NTKHeartRateRichComplicationRectangularView *)self setMeasurementDate:v5];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F19A20] complicationDate];
    [(NTKHeartRateRichComplicationRectangularView *)self setMeasurementDate:v6];
  }
  v7 = [v4 objectForKeyedSubscript:@"NTKHeartRateRichComplicationMetadataKeyBPM"];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:v7 numberStyle:0];
    uint64_t v9 = NSString;
    uint64_t v10 = NTKClockFaceLocalizedString(@"HEART_RATE_READING", 0);
    uint64_t v11 = objc_msgSend(v9, "stringWithFormat:", v10, v8);

    uint64_t v12 = [MEMORY[0x1E4F19AB0] textProviderWithText:v11];
    double v13 = [MEMORY[0x1E4FB1618] whiteColor];
    [v12 setTintColor:v13];

    uint64_t v14 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v64 = v7;
      __int16 v65 = 2112;
      uint64_t v66 = (uint64_t)v12;
      _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_DEFAULT, "NTKHeartRateRichComplicationRectangularView: loadWithMetadata with bpm:%{public}@ bpmTextProvider:%@", buf, 0x16u);
    }

    uint64_t v15 = [v4 objectForKeyedSubscript:@"NTKHeartRateRichComplicationMetadataKeyIsNow"];
    int v16 = [v15 BOOLValue];

    if (v16)
    {
      v62 = v11;
      double v17 = v8;
      id v18 = (void *)MEMORY[0x1E4F19AB0];
      v19 = NTKClockFaceLocalizedString(@"HEART_RATE_TIME_NOW", @"Now");
      double v20 = [MEMORY[0x1E4F28B50] mainBundle];
      double v21 = [v20 preferredLocale];
      double v22 = [v19 uppercaseStringWithLocale:v21];
      double v23 = [v18 textProviderWithText:v22];

      double v24 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v23;
        _os_log_impl(&dword_1BC5A9000, v24, OS_LOG_TYPE_DEFAULT, "NTKHeartRateRichComplicationRectangularView: isNowReading with dateTextProvider:%@", buf, 0xCu);
      }

      id v8 = v17;
      uint64_t v11 = v62;
    }
    else
    {
      double v30 = [v4 objectForKeyedSubscript:@"NTKHeartRateRichComplicationMetadataKeyFutureEntry"];
      int v31 = [v30 BOOLValue];

      if (v31) {
        uint64_t v32 = 48;
      }
      else {
        uint64_t v32 = 112;
      }
      int v33 = NTKCanUseShortRelativeDateStyleForHeartRateComplicationStrings();
      double v34 = (uint64_t *)MEMORY[0x1E4F19678];
      if (!v33) {
        double v34 = (uint64_t *)MEMORY[0x1E4F19670];
      }
      uint64_t v35 = *v34;
      double v36 = (void *)MEMORY[0x1E4F19A88];
      CGFloat v37 = [(NTKHeartRateRichComplicationRectangularView *)self measurementDate];
      double v23 = [v36 textProviderWithDate:v37 style:v35 units:v32];

      v38 = [MEMORY[0x1E4F19A20] complicationDate];
      [v23 setRelativeToDate:v38];

      [v23 setTimeTravelUpdateFrequency:0];
      [v23 setDisableOffsetPrefix:1];
    }
    id v39 = +[NTKHeartRateComplicationUtilties heartrateTintColor];
    [v23 setTintColor:v39];

    v40 = (void *)MEMORY[0x1E4F19AC0];
    long long v41 = NTKClockFaceLocalizedString(@"HEART_RATE_SIGNATURE_LARGE_CURRENT_READING_FORMAT", @"%1$@ %2$@");
    long long v42 = objc_msgSend(v40, "textProviderWithFormat:", v41, v12, v23);

    long long v43 = [MEMORY[0x1E4FB1618] whiteColor];
    [v42 setTintColor:v43];

    long long v44 = [(NTKRichComplicationRectangularDailyGraphView *)self titleLabel];
    [v44 setTextProvider:v42];
  }
  else
  {
    v25 = (void *)MEMORY[0x1E4F19AB0];
    double v26 = NTKClockFaceLocalizedString(@"HEART_RATE_TITLE", @"Heart Rate");
    double v27 = [v25 textProviderWithText:v26];

    double v28 = [MEMORY[0x1E4FB1618] whiteColor];
    [v27 setTintColor:v28];

    CGFloat v29 = [(NTKRichComplicationRectangularDailyGraphView *)self titleLabel];
    [v29 setTextProvider:v27];
  }
  v45 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v46 = [(NTKHeartRateRichComplicationRectangularView *)self measurementDate];
  uint64_t v47 = [v45 startOfDayForDate:v46];

  v48 = [(NTKHeartRateRichComplicationRectangularView *)self measurementDate];
  uint64_t v49 = objc_msgSend(v45, "hk_startOfDateByAddingDays:toDate:", 1, v48);

  CGRect v50 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v47 endDate:v49];
  [(NTKHeartRateRichComplicationRectangularView *)self setMeasurementDateDayInterval:v50];

  v51 = [v4 objectForKeyedSubscript:@"NTKHeartRateRichComplicationMetadataKeyDailyHighBPM"];
  [(NTKHeartRateRichComplicationRectangularView *)self setHighBPM:v51];

  v52 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyHighLabel];
  v53 = [(NTKHeartRateRichComplicationRectangularView *)self highBPM];
  [(NTKHeartRateRichComplicationRectangularView *)self _updateDailyLabel:v52 withBPM:v53];

  v54 = [v4 objectForKeyedSubscript:@"NTKHeartRateRichComplicationMetadataKeyDailyLowBPM"];
  [(NTKHeartRateRichComplicationRectangularView *)self setLowBPM:v54];

  v55 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyLowLabel];
  v56 = [(NTKHeartRateRichComplicationRectangularView *)self lowBPM];
  [(NTKHeartRateRichComplicationRectangularView *)self _updateDailyLabel:v55 withBPM:v56];

  v57 = [v4 objectForKeyedSubscript:@"NTKHeartRateRichComplicationMetadataKeyChartPoints"];
  [(NTKHeartRateRichComplicationRectangularView *)self setChartPoints:v57];

  v58 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v59 = [(NTKHeartRateRichComplicationRectangularView *)self measurementDate];
    v60 = [(NTKHeartRateRichComplicationRectangularView *)self chartPoints];
    uint64_t v61 = [v60 count];
    *(_DWORD *)buf = 138543618;
    v64 = v59;
    __int16 v65 = 2048;
    uint64_t v66 = v61;
    _os_log_impl(&dword_1BC5A9000, v58, OS_LOG_TYPE_DEFAULT, "NTKHeartRateRichComplicationRectangularView: Load with metadata. measurementDate? %{public}@, chartPointCount? %lu", buf, 0x16u);
  }
}

- (double)_xValueForPointFromChartPoint:(id)a3 inRect:(CGRect)a4
{
  int v5 = [a3 xValue];
  MEMORY[0x1C1874E90]();

  id v6 = [(NTKHeartRateRichComplicationRectangularView *)self measurementDateDayInterval];
  v7 = [v6 startDate];
  MEMORY[0x1C1874E90]();

  id v8 = [(NTKHeartRateRichComplicationRectangularView *)self measurementDateDayInterval];
  uint64_t v9 = [v8 endDate];
  MEMORY[0x1C1874E90]();

  FIUIChartRelativePositionForXPlaneValue();

  MEMORY[0x1F4119AA8](self);
  return result;
}

- (double)_yValueForPointFromChartPointValue:(id)a3 betweenHigh:(id)a4 andLow:(id)a5 inRect:(CGRect)a6
{
  id v9 = a5;
  id v10 = a4;
  [a3 doubleValue];
  [v9 doubleValue];

  [v10 doubleValue];
  FIUIChartRelativePositionForYPlaneValue();

  MEMORY[0x1F4119AB0](self);
  return result;
}

- (void)_updateDailyLabel:(id)a3 withBPM:(id)a4
{
  id v8 = a3;
  if (a4) {
    [MEMORY[0x1E4F28EE0] localizedStringFromNumber:a4 numberStyle:0];
  }
  else {
  id v6 = +[NTKRichComplicationRectangularDailyGraphView dailyFormattedNoData];
  }
  [v8 setText:v6];

  v7 = [(NTKRichComplicationRectangularDailyGraphView *)self accentColor];
  [v8 setTextColor:v7];
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (NSArray)chartPoints
{
  return self->_chartPoints;
}

- (void)setChartPoints:(id)a3
{
}

- (NSNumber)highBPM
{
  return self->_highBPM;
}

- (void)setHighBPM:(id)a3
{
  self->_highBPM = (NSNumber *)a3;
}

- (NSNumber)lowBPM
{
  return self->_lowBPM;
}

- (void)setLowBPM:(id)a3
{
  self->_lowBPM = (NSNumber *)a3;
}

- (NSDate)measurementDate
{
  return self->_measurementDate;
}

- (void)setMeasurementDate:(id)a3
{
}

- (NSDateInterval)measurementDateDayInterval
{
  return self->_measurementDateDayInterval;
}

- (void)setMeasurementDateDayInterval:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementDateDayInterval, 0);
  objc_storeStrong((id *)&self->_measurementDate, 0);

  objc_storeStrong((id *)&self->_chartPoints, 0);
}

@end