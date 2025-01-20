@interface HKSHSleepChartFormatter
- (HKHealthStore)healthStore;
- (HKSHSleepChartFormatter)initWithHealthStore:(id)a3;
- (id)_attributedValueString:(id)a3 valueFont:(id)a4;
- (id)_firstCalendarForSummaries:(id)a3;
- (id)_firstDateForSummaries:(id)a3;
- (id)_lastSleepGoalForSummaries:(id)a3;
- (id)_localizedSchedulesFromSummaries:(id)a3 timeFont:(id)a4 amPmFont:(id)a5;
- (id)_longTitleForSelectedRangeDataType:(int64_t)a3 statisticsType:(int64_t)a4;
- (id)_prefixColorForSleepValue:(int64_t)a3 isPrefixColorActive:(id)a4;
- (id)_rangeDataForAverageInBedStartTime:(id)a3 averageInBedEndTime:(id)a4 averageSleepStartTime:(id)a5 averageSleepEndTime:(id)a6 inBedDuration:(id)a7 sleepDuration:(id)a8 calendar:(id)a9 firstDayStart:(id)a10 timeFont:(id)a11 amPmFont:(id)a12 formatterOptions:(unint64_t)a13;
- (id)_rangeDataForDurationGoalWithSleepDaySummaries:(id)a3 valueFont:(id)a4 unitFont:(id)a5;
- (id)_rangeDataForDurationValue:(id)a3 dataType:(int64_t)a4 sleepValue:(int64_t)a5 isPrefixColorActive:(id)a6 valueFont:(id)a7 unitFont:(id)a8 statisticsType:(int64_t)a9 formatterOptions:(unint64_t)a10;
- (id)_rangeDataForInBedDuration:(id)a3 sleepDuration:(id)a4 awakeDuration:(id)a5 asleepCoreDuration:(id)a6 asleepDeepDuration:(id)a7 asleepREMDuration:(id)a8 overrideDuration:(id)a9 arePrefixColorsActive:(id)a10 statisticsType:(int64_t)a11 valueFont:(id)a12 unitFont:(id)a13 formatterOptions:(unint64_t)a14;
- (id)_rangeDataForSleepScheduleWithSleepDaySummaries:(id)a3 timeFont:(id)a4 amPmFont:(id)a5;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (int64_t)_statisticsTypeForSummaries:(id)a3 calendar:(id)a4;
- (void)setHealthStore:(id)a3;
@end

@implementation HKSHSleepChartFormatter

- (HKSHSleepChartFormatter)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSHSleepChartFormatter;
  v6 = [(HKSHSleepChartFormatter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_healthStore, a3);
  }

  return v7;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v118 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v138 objects:v142 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned __int8 v132 = 0;
    v7 = 0;
    v8 = 0;
    uint64_t v123 = 0;
    v130 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v139;
    uint64_t v115 = 131;
    uint64_t v119 = 3;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v139 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v138 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = v8;
          v14 = v7;
          id v15 = v12;
          v16 = [v15 sleepDaySummary];

          if (v16)
          {
            v17 = [v15 sleepDaySummary];
            [v118 addObject:v17];

            v18 = [v15 sleepDaySummary];
            char v19 = [v18 isWeeklyAggregatedSummary];

            v132 |= v19;
          }
          uint64_t v123 = [v15 seriesType];
          uint64_t v119 = [v15 annotationOptions];
          v8 = [v15 annotationOverrideDuration];

          uint64_t v20 = [v15 annotationOverridePrefixColorsActive];

          if ([v15 currentValueViewOptionsPriority] >= v9)
          {
            uint64_t v115 = [v15 currentValueViewOptions];
            uint64_t v9 = [v15 currentValueViewOptionsPriority];
            uint64_t v21 = [v15 currentValueViewOverridePrefixColorsActive];

            v130 = (void *)v21;
          }

          v7 = (void *)v20;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v138 objects:v142 count:16];
    }
    while (v6);
  }
  else
  {
    unsigned __int8 v132 = 0;
    v7 = 0;
    v8 = 0;
    uint64_t v123 = 0;
    v130 = 0;
    uint64_t v115 = 131;
    uint64_t v119 = 3;
  }

  v22 = v118;
  if ([v118 count])
  {
    v23 = [MEMORY[0x1E4FA5588] sleepMetricsForDaySummaries:v118];
    v24 = [v23 averageInBedDuration];
    v25 = [MEMORY[0x1E4F2B618] secondUnit];
    [v24 doubleValueForUnit:v25];
    double v27 = v26;

    v28 = [v23 averageAwakeDuration];
    v29 = [MEMORY[0x1E4F2B618] secondUnit];
    [v28 doubleValueForUnit:v29];
    double v31 = v30;

    v32 = [v23 averageCoreSleepDuration];
    v33 = [MEMORY[0x1E4F2B618] secondUnit];
    [v32 doubleValueForUnit:v33];
    double v35 = v34;

    v36 = [v23 averageREMSleepDuration];
    v37 = [MEMORY[0x1E4F2B618] secondUnit];
    [v36 doubleValueForUnit:v37];
    double v39 = v38;

    v40 = [v23 averageDeepSleepDuration];
    v41 = [MEMORY[0x1E4F2B618] secondUnit];
    [v40 doubleValueForUnit:v41];
    double v43 = v42;

    v44 = [v23 averageSleepDuration];
    v45 = [MEMORY[0x1E4F2B618] secondUnit];
    [v44 doubleValueForUnit:v45];
    double v47 = v46;

    v48 = v118;
    v107 = [v23 averageInBedStartTime];
    v49 = [v23 averageInBedEndTime];
    v50 = [v23 averageSleepStartTime];
    v51 = [v23 averageSleepEndTime];
    uint64_t v52 = [(HKSHSleepChartFormatter *)self _firstCalendarForSummaries:v118];
    v105 = [(HKSHSleepChartFormatter *)self _firstDateForSummaries:v118];
    v106 = (void *)v52;
    v22 = v118;
    int64_t v102 = [(HKSHSleepChartFormatter *)self _statisticsTypeForSummaries:v118 calendar:v52];
    v103 = v51;
    v104 = v8;
    switch(v123)
    {
      case 0:
      case 5:
        if (a4 == 1)
        {
          v127 = v49;
          v59 = [NSNumber numberWithDouble:v27];
          uint64_t v134 = [NSNumber numberWithDouble:v47];
          v110 = [NSNumber numberWithDouble:v31];
          v94 = [NSNumber numberWithDouble:v35];
          v98 = [NSNumber numberWithDouble:v43];
          [NSNumber numberWithDouble:v39];
          v76 = v120 = v7;
          v77 = [(HKInteractiveChartDataFormatter *)self majorFont];
          v78 = [(HKInteractiveChartDataFormatter *)self minorFont];
          v62 = v130;
          v48 = [(HKSHSleepChartFormatter *)self _rangeDataForInBedDuration:v59 sleepDuration:v134 awakeDuration:v110 asleepCoreDuration:v94 asleepDeepDuration:v98 asleepREMDuration:v76 overrideDuration:0 arePrefixColorsActive:v130 statisticsType:v102 valueFont:v77 unitFont:v78 formatterOptions:v115];

          v49 = v127;
          v22 = v118;

          v7 = v120;
          v61 = (void *)v134;
          goto LABEL_37;
        }
        if (a4) {
          goto LABEL_34;
        }
        v124 = v49;
        [NSNumber numberWithDouble:v27];
        uint64_t v54 = v53 = v8;
        uint64_t v133 = [NSNumber numberWithDouble:v47];
        v109 = [NSNumber numberWithDouble:v31];
        v97 = [NSNumber numberWithDouble:v35];
        v93 = [NSNumber numberWithDouble:v43];
        [NSNumber numberWithDouble:v39];
        v55 = v116 = v50;
        [(HKInteractiveChartDataFormatter *)self majorFont];
        v57 = v56 = v7;
        v58 = [(HKInteractiveChartDataFormatter *)self minorFont];
        v92 = v53;
        v59 = (void *)v54;
        uint64_t v60 = v54;
        v61 = (void *)v133;
        v48 = [(HKSHSleepChartFormatter *)self _rangeDataForInBedDuration:v60 sleepDuration:v133 awakeDuration:v109 asleepCoreDuration:v97 asleepDeepDuration:v93 asleepREMDuration:v55 overrideDuration:v92 arePrefixColorsActive:v56 statisticsType:v102 valueFont:v57 unitFont:v58 formatterOptions:v119];

        v49 = v124;
        v22 = v118;

        v7 = v56;
        v50 = v116;

        goto LABEL_36;
      case 1:
      case 6:
        if (a4 == 1)
        {
          v128 = v49;
          uint64_t v99 = [NSNumber numberWithDouble:v27];
          uint64_t v135 = [NSNumber numberWithDouble:v47];
          v111 = [NSNumber numberWithDouble:v31];
          v95 = [NSNumber numberWithDouble:v35];
          v79 = [NSNumber numberWithDouble:v43];
          [NSNumber numberWithDouble:v39];
          v80 = v121 = v7;
          v81 = [(HKInteractiveChartDataFormatter *)self majorFont];
          v82 = [(HKInteractiveChartDataFormatter *)self minorFont];
          v62 = v130;
          v48 = [(HKSHSleepChartFormatter *)self _rangeDataForInBedDuration:v99 sleepDuration:v135 awakeDuration:v111 asleepCoreDuration:v95 asleepDeepDuration:v79 asleepREMDuration:v80 overrideDuration:0 arePrefixColorsActive:v130 statisticsType:v102 valueFont:v81 unitFont:v82 formatterOptions:v115];

          v49 = v128;
          v22 = v118;

          v7 = v121;
          v61 = (void *)v135;
          v59 = (void *)v99;
          goto LABEL_37;
        }
        if (a4) {
          goto LABEL_34;
        }
        v125 = v49;
        uint64_t v63 = [NSNumber numberWithDouble:v27];
        uint64_t v64 = [NSNumber numberWithDouble:v47];
        v65 = [(HKInteractiveChartDataFormatter *)self majorFont];
        [(HKInteractiveChartDataFormatter *)self minorFont];
        v67 = v66 = v50;
        v68 = v51;
        v59 = (void *)v63;
        uint64_t v69 = v63;
        v61 = (void *)v64;
        v48 = [(HKSHSleepChartFormatter *)self _rangeDataForAverageInBedStartTime:v107 averageInBedEndTime:v125 averageSleepStartTime:v66 averageSleepEndTime:v68 inBedDuration:v69 sleepDuration:v64 calendar:v106 firstDayStart:v105 timeFont:v65 amPmFont:v67 formatterOptions:v119];

        v50 = v66;
        v49 = v125;
        goto LABEL_25;
      case 2:
        goto LABEL_34;
      case 3:
        if (a4 == 1) {
          goto LABEL_44;
        }
        if (a4) {
          goto LABEL_34;
        }
        uint64_t v70 = [(HKInteractiveChartDataFormatter *)self majorFont];
        v61 = [(HKInteractiveChartDataFormatter *)self minorFont];
        v59 = (void *)v70;
        uint64_t v71 = [(HKSHSleepChartFormatter *)self _rangeDataForSleepScheduleWithSleepDaySummaries:v118 timeFont:v70 amPmFont:v61];
        goto LABEL_35;
      case 4:
        if (a4 == 1)
        {
LABEL_44:
          v129 = v49;
          uint64_t v83 = [NSNumber numberWithDouble:v27];
          uint64_t v136 = [NSNumber numberWithDouble:v47];
          v112 = [NSNumber numberWithDouble:v31];
          v100 = [NSNumber numberWithDouble:v35];
          v96 = [NSNumber numberWithDouble:v43];
          [NSNumber numberWithDouble:v39];
          v84 = v122 = v7;
          v85 = [(HKInteractiveChartDataFormatter *)self majorFont];
          v86 = [(HKInteractiveChartDataFormatter *)self minorFont];
          v62 = v130;
          v59 = (void *)v83;
          uint64_t v87 = v83;
          v61 = (void *)v136;
          v48 = [(HKSHSleepChartFormatter *)self _rangeDataForInBedDuration:v87 sleepDuration:v136 awakeDuration:v112 asleepCoreDuration:v100 asleepDeepDuration:v96 asleepREMDuration:v84 overrideDuration:0 arePrefixColorsActive:v130 statisticsType:v102 valueFont:v85 unitFont:v86 formatterOptions:v115];

          v49 = v129;
          v22 = v118;

          v7 = v122;
        }
        else
        {
          if (a4)
          {
LABEL_34:
            uint64_t v74 = [(HKInteractiveChartDataFormatter *)self majorFont];
            v61 = [(HKInteractiveChartDataFormatter *)self minorFont];
            v59 = (void *)v74;
            uint64_t v71 = [(HKSHSleepChartFormatter *)self _rangeDataForDurationGoalWithSleepDaySummaries:v118 valueFont:v74 unitFont:v61];
LABEL_35:
            v48 = (void *)v71;
LABEL_36:
            v62 = v130;
            goto LABEL_37;
          }
          v117 = v50;
          v126 = v49;
          v59 = [NSNumber numberWithDouble:v27];
          v61 = [NSNumber numberWithDouble:v47];
          if ((v132 & ((v119 & 0x3C) == 0)) == 1)
          {
            v72 = [(HKInteractiveChartDataFormatter *)self majorFont];
            v73 = [(HKInteractiveChartDataFormatter *)self minorFont];
            v48 = [(HKSHSleepChartFormatter *)self _rangeDataForAverageInBedStartTime:v107 averageInBedEndTime:v126 averageSleepStartTime:v117 averageSleepEndTime:v103 inBedDuration:v59 sleepDuration:v61 calendar:v52 firstDayStart:v105 timeFont:v72 amPmFont:v73 formatterOptions:v119];

            v50 = v117;
            v49 = v126;
LABEL_25:
            v22 = v118;
            goto LABEL_36;
          }
          v137 = [NSNumber numberWithDouble:v31];
          v113 = [NSNumber numberWithDouble:v35];
          v101 = [NSNumber numberWithDouble:v43];
          [NSNumber numberWithDouble:v39];
          v89 = v88 = v7;
          v90 = [(HKInteractiveChartDataFormatter *)self majorFont];
          v91 = [(HKInteractiveChartDataFormatter *)self minorFont];
          v48 = [(HKSHSleepChartFormatter *)self _rangeDataForInBedDuration:v59 sleepDuration:v61 awakeDuration:v137 asleepCoreDuration:v113 asleepDeepDuration:v101 asleepREMDuration:v89 overrideDuration:v104 arePrefixColorsActive:v88 statisticsType:v102 valueFont:v90 unitFont:v91 formatterOptions:v119];

          v7 = v88;
          v50 = v117;
          v22 = v118;
          v49 = v126;
          v62 = v130;
        }
LABEL_37:

        v51 = v103;
        v8 = v104;
LABEL_38:

        break;
      default:
        v62 = v130;
        goto LABEL_38;
    }
  }
  else
  {
    v48 = (void *)MEMORY[0x1E4F1CBF0];
    v62 = v130;
  }

  return v48;
}

- (int64_t)_statisticsTypeForSummaries:(id)a3 calendar:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  uint64_t v7 = [v6 count];
  if (v7 == 1)
  {
    v8 = [v6 allObjects];
    uint64_t v9 = [v8 firstObject];

    uint64_t v10 = [v9 dateInterval];
    v11 = [v10 startDate];
    uint64_t v12 = objc_msgSend(v11, "hk_morningIndexWithCalendar:", v5);

    v13 = [v9 dateInterval];
    v14 = [v13 endDate];
    uint64_t v15 = objc_msgSend(v14, "hk_morningIndexWithCalendar:", v5);

    uint64_t v7 = v15 - v12;
  }
  if (v7 <= 1) {
    int64_t v16 = 0;
  }
  else {
    int64_t v16 = 3;
  }

  return v16;
}

- (id)_rangeDataForInBedDuration:(id)a3 sleepDuration:(id)a4 awakeDuration:(id)a5 asleepCoreDuration:(id)a6 asleepDeepDuration:(id)a7 asleepREMDuration:(id)a8 overrideDuration:(id)a9 arePrefixColorsActive:(id)a10 statisticsType:(int64_t)a11 valueFont:(id)a12 unitFont:(id)a13 formatterOptions:(unint64_t)a14
{
  id v19 = a3;
  id v48 = a4;
  id v47 = a5;
  id v46 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a12;
  id v25 = a13;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v19 doubleValue];
  if ((a14 & 1) != 0 && v27 > 0.0)
  {
    if (v22) {
      id v28 = v22;
    }
    else {
      id v28 = v19;
    }
    v29 = [(HKSHSleepChartFormatter *)self _rangeDataForDurationValue:v28 dataType:9 sleepValue:0 isPrefixColorActive:v23 valueFont:v24 unitFont:v25 statisticsType:a11 formatterOptions:a14];
    [v26 addObject:v29];
  }
  [v48 doubleValue];
  if ((a14 & 2) != 0 && v30 > 0.0)
  {
    if (v22) {
      id v31 = v22;
    }
    else {
      id v31 = v48;
    }
    v32 = [(HKSHSleepChartFormatter *)self _rangeDataForDurationValue:v31 dataType:10 sleepValue:_HKCategoryValueSleepAnalysisDefaultAsleepValue() isPrefixColorActive:v23 valueFont:v24 unitFont:v25 statisticsType:a11 formatterOptions:a14];
    [v26 addObject:v32];
  }
  [v47 doubleValue];
  if ((a14 & 4) != 0 && v33 > 0.0)
  {
    if (v22) {
      id v34 = v22;
    }
    else {
      id v34 = v47;
    }
    double v35 = [(HKSHSleepChartFormatter *)self _rangeDataForDurationValue:v34 dataType:24 sleepValue:2 isPrefixColorActive:v23 valueFont:v24 unitFont:v25 statisticsType:a11 formatterOptions:a14];
    [v26 addObject:v35];
  }
  [v46 doubleValue];
  if ((a14 & 0x10) != 0 && v36 > 0.0)
  {
    if (v22) {
      id v37 = v22;
    }
    else {
      id v37 = v46;
    }
    double v38 = [(HKSHSleepChartFormatter *)self _rangeDataForDurationValue:v37 dataType:25 sleepValue:3 isPrefixColorActive:v23 valueFont:v24 unitFont:v25 statisticsType:a11 formatterOptions:a14];
    [v26 addObject:v38];
  }
  [v20 doubleValue];
  if ((a14 & 0x20) != 0 && v39 > 0.0)
  {
    if (v22) {
      id v40 = v22;
    }
    else {
      id v40 = v20;
    }
    v41 = [(HKSHSleepChartFormatter *)self _rangeDataForDurationValue:v40 dataType:26 sleepValue:4 isPrefixColorActive:v23 valueFont:v24 unitFont:v25 statisticsType:a11 formatterOptions:a14];
    [v26 addObject:v41];
  }
  [v21 doubleValue];
  if ((a14 & 8) != 0 && v42 > 0.0)
  {
    if (v22) {
      id v43 = v22;
    }
    else {
      id v43 = v21;
    }
    v44 = [(HKSHSleepChartFormatter *)self _rangeDataForDurationValue:v43 dataType:27 sleepValue:5 isPrefixColorActive:v23 valueFont:v24 unitFont:v25 statisticsType:a11 formatterOptions:a14];
    [v26 addObject:v44];
  }
  return v26;
}

- (id)_rangeDataForDurationValue:(id)a3 dataType:(int64_t)a4 sleepValue:(int64_t)a5 isPrefixColorActive:(id)a6 valueFont:(id)a7 unitFont:(id)a8 statisticsType:(int64_t)a9 formatterOptions:(unint64_t)a10
{
  id v14 = a6;
  id v15 = a3;
  int64_t v16 = HKTimePeriodStringWithFonts();
  v17 = (void *)[v16 mutableCopy];

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F67C00]) initWithStatisticsType:a9];
  [v18 setDataType:a4];
  [v18 setAttributedString:v17];
  [v18 setValueAsNumber:v15];

  [v18 setPrefersImageAffixes:(a10 & 0x40) == 0];
  id v19 = [(HKSHSleepChartFormatter *)self _prefixColorForSleepValue:a5 isPrefixColorActive:v14];

  [v18 setPrefixColor:v19];
  if ((a10 & 0x80) != 0)
  {
    id v20 = [(HKSHSleepChartFormatter *)self _longTitleForSelectedRangeDataType:a4 statisticsType:a9];
    [v18 setTitleOverride:v20];
  }
  return v18;
}

- (id)_rangeDataForDurationGoalWithSleepDaySummaries:(id)a3 valueFont:(id)a4 unitFont:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(HKSHSleepChartFormatter *)self _lastSleepGoalForSummaries:a3];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F67C00]) initWithStatisticsType:0];
  [v11 setDataType:13];
  if (v10)
  {
    uint64_t v12 = HKTimePeriodStringWithFonts();
    [v11 setAttributedString:v12];

    [v11 setValueAsNumber:v10];
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v14 = [v13 localizedStringForKey:@"SLEEP_NO_GOAL_CONTEXT" value:&stru_1F0473C40 table:@"HealthUI-Localizable-Eucalyptus"];
    id v15 = [(HKSHSleepChartFormatter *)self _attributedValueString:v14 valueFont:v8];
    [v11 setAttributedString:v15];
  }
  v18[0] = v11;
  int64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

  return v16;
}

- (id)_rangeDataForSleepScheduleWithSleepDaySummaries:(id)a3 timeFont:(id)a4 amPmFont:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [(HKSHSleepChartFormatter *)self _localizedSchedulesFromSummaries:a3 timeFont:v8 amPmFont:a5];
  if (![v9 count])
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F67C00]) initWithStatisticsType:0];
    [v10 setDataType:0];
    int64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v17 = [v16 localizedStringForKey:@"SLEEP_NO_SCHEDULE" value:&stru_1F0473C40 table:@"HealthUI-Localizable-Eucalyptus"];
    v18 = [(HKSHSleepChartFormatter *)self _attributedValueString:v17 valueFont:v8];
    [v10 setAttributedString:v18];

    v27[0] = v10;
    id v14 = (void *)MEMORY[0x1E4F1C978];
    id v15 = (void **)v27;
    goto LABEL_5;
  }
  if ((unint64_t)[v9 count] >= 2)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F67C00]) initWithStatisticsType:0];
    [v10 setDataType:0];
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v12 = [v11 localizedStringForKey:@"SLEEP_MULTIPLE_SCHEDULES" value:&stru_1F0473C40 table:@"HealthUI-Localizable-Eucalyptus"];
    v13 = [(HKSHSleepChartFormatter *)self _attributedValueString:v12 valueFont:v8];
    [v10 setAttributedString:v13];

    id v26 = v10;
    id v14 = (void *)MEMORY[0x1E4F1C978];
    id v15 = &v26;
LABEL_5:
    id v19 = [v14 arrayWithObjects:v15 count:1];
    goto LABEL_7;
  }
  uint64_t v10 = [v9 anyObject];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F67C00]) initWithStatisticsType:0];
  [v20 setDataType:14];
  id v21 = [v10 localizedBedTime];
  [v20 setAttributedString:v21];

  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F67C00]) initWithStatisticsType:0];
  [v22 setDataType:15];
  id v23 = [v10 localizedWakeTime];
  [v22 setAttributedString:v23];

  v25[0] = v20;
  v25[1] = v22;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

LABEL_7:
  return v19;
}

- (id)_rangeDataForAverageInBedStartTime:(id)a3 averageInBedEndTime:(id)a4 averageSleepStartTime:(id)a5 averageSleepEndTime:(id)a6 inBedDuration:(id)a7 sleepDuration:(id)a8 calendar:(id)a9 firstDayStart:(id)a10 timeFont:(id)a11 amPmFont:(id)a12 formatterOptions:(unint64_t)a13
{
  v60[1] = *MEMORY[0x1E4F143B8];
  uint64_t v18 = (uint64_t)a3;
  unint64_t v19 = (unint64_t)a4;
  uint64_t v20 = (uint64_t)a5;
  unint64_t v21 = (unint64_t)a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v59 = a12;
  id v56 = v22;
  uint64_t v57 = v18;
  id v27 = (id)v19;
  if (v18 | v19 && ([v22 doubleValue], v28 > 0.0)) {
    char v29 = a13 & 1;
  }
  else {
    char v29 = 0;
  }
  double v30 = (void *)v21;
  unint64_t v31 = v20 | v21;
  v32 = v27;
  uint64_t v58 = v20;
  if (v31 && ([v23 doubleValue], v33 > 0.0))
  {
    unint64_t v34 = (a13 >> 1) & 1;
    if ((v29 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    LODWORD(v34) = 0;
    if ((v29 & 1) == 0)
    {
LABEL_8:
      if (v24) {
        BOOL v35 = v25 == 0;
      }
      else {
        BOOL v35 = 1;
      }
      if (v35) {
        char v36 = 0;
      }
      else {
        char v36 = v34;
      }
      if ((v36 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  if (!v24 || !v25)
  {
LABEL_21:
    id v42 = v23;
    id v43 = (void *)[objc_alloc(MEMORY[0x1E4F67C00]) initWithStatisticsType:0];
    [v43 setDataType:0];
    v44 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v45 = [v44 localizedStringForKey:@"SLEEP_NO_TIMES" value:&stru_1F0473C40 table:@"HealthUI-Localizable-Eucalyptus"];
    id v46 = [(HKSHSleepChartFormatter *)self _attributedValueString:v45 valueFont:v26];
    [v43 setAttributedString:v46];

    v60[0] = v43;
    id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];

    id v23 = v42;
    uint64_t v18 = v57;
LABEL_22:
    id v47 = (void *)v58;
    id v48 = v56;
    goto LABEL_28;
  }
LABEL_19:
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v34)
  {
    id v55 = v23;
    double v38 = (void *)[objc_alloc(MEMORY[0x1E4F67C00]) initWithStatisticsType:0];
    [v38 setDataType:16];
    double v39 = HKSHLocalizedTimeForComponents(v58, v24, (uint64_t)v25, v26, v59);
    [v38 setAttributedString:v39];

    [v37 addObject:v38];
    id v40 = (void *)[objc_alloc(MEMORY[0x1E4F67C00]) initWithStatisticsType:0];
    [v40 setDataType:17];
    v41 = HKSHLocalizedTimeForComponents((uint64_t)v30, v24, (uint64_t)v25, v26, v59);
    [v40 setAttributedString:v41];

    [v37 addObject:v40];
    uint64_t v18 = v57;
  }
  else
  {
    if (v18)
    {
      v49 = (void *)[objc_alloc(MEMORY[0x1E4F67C00]) initWithStatisticsType:0];
      [v49 setDataType:18];
      HKSHLocalizedTimeForComponents(v18, v24, (uint64_t)v25, v26, v59);
      v51 = id v50 = v23;
      [v49 setAttributedString:v51];

      id v23 = v50;
      [v37 addObject:v49];
    }
    if (!v32) {
      goto LABEL_22;
    }
    id v55 = v23;
    double v38 = (void *)[objc_alloc(MEMORY[0x1E4F67C00]) initWithStatisticsType:0];
    [v38 setDataType:19];
    uint64_t v52 = HKSHLocalizedTimeForComponents((uint64_t)v32, v24, (uint64_t)v25, v26, v59);
    [v38 setAttributedString:v52];

    [v37 addObject:v38];
  }

  id v47 = (void *)v58;
  id v23 = v55;
  id v48 = v56;
LABEL_28:

  return v37;
}

- (id)_lastSleepGoalForSummaries:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 sleepDurationGoal];

        if (v10)
        {
          v11 = NSNumber;
          uint64_t v12 = [v9 sleepDurationGoal];
          v13 = [MEMORY[0x1E4F2B618] secondUnit];
          [v12 doubleValueForUnit:v13];
          uint64_t v14 = objc_msgSend(v11, "numberWithDouble:");

          uint64_t v6 = (void *)v14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_firstCalendarForSummaries:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = (void *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "calendar", (void)v10);

        if (v8)
        {
          uint64_t v4 = [v7 calendar];
          goto LABEL_11;
        }
      }
      uint64_t v4 = (void *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_firstDateForSummaries:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = (void *)[v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "dateInterval", (void)v12);
        id v9 = [v8 startDate];

        if (v9)
        {
          long long v10 = [v7 dateInterval];
          uint64_t v4 = [v10 startDate];

          goto LABEL_11;
        }
      }
      uint64_t v4 = (void *)[v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_localizedSchedulesFromSummaries:(id)a3 timeFont:(id)a4 amPmFont:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v31 = a4;
  id v8 = a5;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v7;
  uint64_t v28 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v37;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v9;
        long long v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        long long v11 = [v10 dateInterval];
        long long v12 = [v11 startDate];

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v13 = [v10 schedules];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v33 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              uint64_t v19 = [v18 bedTimeComponents];
              if (v19)
              {
                uint64_t v20 = (void *)v19;
                uint64_t v21 = [v18 wakeTimeComponents];

                if (v21)
                {
                  id v22 = [_HKSHLocalizedSleepSchedule alloc];
                  id v23 = [v10 calendar];
                  id v24 = [(_HKSHLocalizedSleepSchedule *)v22 initWithSleepSchedule:v18 calendar:v23 dayStart:v12 timeFont:v31 amPmFont:v8];

                  [v30 addObject:v24];
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v15);
        }

        uint64_t v9 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v28);
  }

  return v30;
}

- (id)_attributedValueString:(id)a3 valueFont:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *MEMORY[0x1E4FB06F8];
  v13[0] = a4;
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v9 = objc_alloc(MEMORY[0x1E4F28B18]);

  long long v10 = (void *)[v9 initWithString:v7 attributes:v8];
  return v10;
}

- (id)_longTitleForSelectedRangeDataType:(int64_t)a3 statisticsType:(int64_t)a4
{
  if (a4) {
    goto LABEL_2;
  }
  if (a3 == 10)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v6 = v5;
    id v7 = @"TIME_ASLEEP";
  }
  else
  {
    if (a3 != 9)
    {
LABEL_2:
      uint64_t v4 = 0;
      goto LABEL_8;
    }
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v6 = v5;
    id v7 = @"TIME_IN_BED";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_1F0473C40 table:@"HealthUI-Localizable"];
  uint64_t v4 = [v8 localizedUppercaseString];

LABEL_8:
  return v4;
}

- (id)_prefixColorForSleepValue:(int64_t)a3 isPrefixColorActive:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    if ([v5 BOOLValue]) {
      objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepColorForSleepAnalysis:", a3);
    }
    else {
    id v7 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveColorForSleepAnalysis:", a3);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end