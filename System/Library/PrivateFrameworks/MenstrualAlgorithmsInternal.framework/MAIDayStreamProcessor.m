@interface MAIDayStreamProcessor
- (MAIDayStreamProcessor)initWithConfig:(id)a3;
- (MAIDayStreamProcessorOutput)analyzeWithMostRecentMenstrualFlowJulianDayUpdated:(SEL)a3;
- (NSMutableArray)watchIdentifiers;
- (NSNumber)userAgeInYears;
- (id).cxx_construct;
- (unsigned)watchNumericIdentifierFromString:(id)a3;
- (void)appendDay:(id)a3;
- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)setUserAgeInYears:(id)a3;
- (void)setWatchIdentifiers:(id)a3;
@end

@implementation MAIDayStreamProcessor

- (MAIDayStreamProcessor)initWithConfig:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)MAIDayStreamProcessor;
  v5 = [(MAIDayStreamProcessor *)&v49 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    watchIdentifiers = v5->_watchIdentifiers;
    v5->_watchIdentifiers = (NSMutableArray *)v6;

    LOBYTE(v29) = 0;
    char v30 = 0;
    LOBYTE(v31) = 0;
    char v32 = 0;
    LOBYTE(v33) = 0;
    char v34 = 0;
    LOBYTE(v35) = 0;
    char v36 = 0;
    LOBYTE(v37) = 0;
    char v38 = 0;
    char v39 = 0;
    char v40 = 0;
    LOBYTE(v41) = 0;
    char v42 = 0;
    char v48 = 0;
    uint64_t v43 = 0;
    LOBYTE(v44) = 0;
    v8 = [v4 userReportedCycleLength];

    if (v8)
    {
      v9 = [v4 userReportedCycleLength];
      char v30 = 1;
      int v29 = [v9 unsignedIntValue];
    }
    v10 = [v4 julianDayOfUserReportedCycleLength];

    if (v10)
    {
      v11 = [v4 julianDayOfUserReportedCycleLength];
      char v34 = 1;
      int v33 = [v11 unsignedIntValue];
    }
    v12 = [v4 userReportedMenstruationLength];

    if (v12)
    {
      v13 = [v4 userReportedMenstruationLength];
      char v32 = 1;
      int v31 = [v13 unsignedIntValue];
    }
    v14 = [v4 julianDayOfUserReportedMenstruationLength];

    if (v14)
    {
      v15 = [v4 julianDayOfUserReportedMenstruationLength];
      char v36 = 1;
      int v35 = [v15 unsignedIntValue];
    }
    v16 = [v4 birthDateComponents];

    if (v16)
    {
      v17 = [v4 birthDateComponents];
      v18 = [v17 date];
      [v18 timeIntervalSinceNow];
      double v20 = v19 / -31557600.0;

      if (v20 >= 1.0 && v20 <= 200.0)
      {
        float v23 = v20;
        float v41 = v23;
        char v42 = 1;
        v22 = [NSNumber numberWithDouble:v20];
        [(MAIDayStreamProcessor *)v5 setUserAgeInYears:v22];
      }
      else
      {
        v22 = ha_get_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          -[MAIDayStreamProcessor initWithConfig:](v22, v20);
        }
      }
    }
    v24 = [v4 deviationInput];

    if (v24)
    {
      v25 = [v4 deviationInput];
      HealthAlgorithms::deviationInput(v25, v28);
      long long v44 = v28[0];
      long long v45 = v28[1];
      long long v46 = v28[2];
      long long v47 = v28[3];
      char v48 = 1;
    }
    int v26 = [v4 todayAsJulianDay];
    char v38 = 1;
    int v37 = v26;
    operator new();
  }

  return 0;
}

- (void)setUserAgeInYears:(id)a3
{
}

- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  value = (uint64_t **)self->_phaseCondenser.__ptr_.__value_;
  if (((a3 - 1) & 0xF8) != 0) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = a3;
  }
  HealthAlgorithms::PhaseCondenser::begin_phase(value, v5, a4);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((unsigned char *)self + 16) = 0;
  *((unsigned char *)self + 20) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void)appendDay:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 wristTemperature];
  uint64_t v6 = [v5 watchIdentifier];
  int v7 = [(MAIDayStreamProcessor *)self watchNumericIdentifierFromString:v6];

  if (self->_julianDayOfLastInput.__engaged_
    && (unsigned int val = self->_julianDayOfLastInput.var0.__val_, val >= [v4 julianDay]))
  {
    v14 = ha_get_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[MAIHistoricalAnalyzer appendDay:](v14);
    }
  }
  else
  {
    self->_julianDayOfLastInput.var0.__val_ = [v4 julianDay];
    self->_julianDayOfLastInput.__engaged_ = 1;
    id v9 = v4;
    LOBYTE(v25) = 0;
    char v26 = 0;
    LOBYTE(v27) = 0;
    char v28 = 0;
    LOBYTE(v29) = 0;
    char v30 = 0;
    LOBYTE(v31) = 0;
    char v32 = 0;
    LOBYTE(v33) = 0;
    char v35 = 0;
    LODWORD(v24) = [v9 julianDay];
    DWORD1(v24) = [v9 flow];
    BYTE8(v24) = [v9 spotting];
    HIDWORD(v24) = [v9 ovulationTestResult];
    v10 = [v9 sedentaryHeartRateStatistics];
    v11 = [v10 lowerPercentile];

    if (v11)
    {
      v12 = [v10 lowerPercentile];
      [v12 floatValue];
      int v25 = v13;
      char v26 = 1;

      char v30 = 1;
      int v29 = [v10 sampleCount];
    }
    else
    {
      int v29 = 0;
      char v30 = 1;
    }

    v15 = [v9 sleepHeartRateStatistics];
    v16 = [v15 lowerPercentile];

    if (v16)
    {
      v17 = [v15 lowerPercentile];
      [v17 floatValue];
      int v27 = v18;
      char v28 = 1;

      char v32 = 1;
      int v31 = [v15 sampleCount];
    }
    else
    {
      int v31 = 0;
      char v32 = 1;
    }

    double v19 = [v9 wristTemperature];

    if (v19)
    {
      double v20 = [v9 wristTemperature];
      [v20 temperatureCelsius];
      double v22 = v21;

      float v23 = v22;
      int v33 = v7;
      float v34 = v23;
      char v35 = 1;
    }

    Nightingale::ngt_DayStreamProcessor::appendDay((void **)self->_dayStreamProcessor.__ptr_.__value_, &v24);
  }
}

- (unsigned)watchNumericIdentifierFromString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = [(MAIDayStreamProcessor *)self watchIdentifiers];
    uint64_t v6 = (void *)[v5 indexOfObject:v4];

    if (v6 == (void *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = [(MAIDayStreamProcessor *)self watchIdentifiers];
      [v6 addObject:v4];

      int v7 = [(MAIDayStreamProcessor *)self watchIdentifiers];
      LOBYTE(v6) = [v7 count] - 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  value = (uint64_t **)self->_phaseCondenser.__ptr_.__value_;
  if (((a3 - 1) & 0xF8) != 0) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = a3;
  }
  HealthAlgorithms::PhaseCondenser::end_phase(value, v5, a4);
}

- (MAIDayStreamProcessorOutput)analyzeWithMostRecentMenstrualFlowJulianDayUpdated:(SEL)a3
{
  v155[33] = *MEMORY[0x263EF8340];
  HealthAlgorithms::PhaseCondenser::phase_updates((HealthAlgorithms::PhaseCondenser *)self->_phaseCondenser.__ptr_.__value_, (uint64_t)&v93);
  uint64_t v6 = (char *)v93;
  int v7 = v94;
  if (v93 != v94)
  {
    do
    {
      Nightingale::ngt_DayStreamProcessor::appendPhaseSet((std::vector<int> *)self->_dayStreamProcessor.__ptr_.__value_, *(void *)v6, *((_DWORD *)v6 + 2));
      v6 += 16;
    }
    while (v6 != v7);
    uint64_t v6 = (char *)v93;
  }
  if (v6)
  {
    v94 = v6;
    operator delete(v6);
  }
  v8 = objc_opt_new();
  retstr->var1 = 0;
  retstr->var2 = 0;
  id v9 = v8;
  retstr->var0 = v9;
  v92 = v9;
  Nightingale::ngt_DayStreamProcessor::analyze((uint64_t)self->_dayStreamProcessor.__ptr_.__value_, a4 & 0xFFFFFF00 | a4 & ~((int)a4 >> 31) | ((unint64_t)((int)a4 > 0) << 32), 1, (uint64_t)&v93);
  [v9 setIsUserInactive:v118];
  if (v116)
  {
    v10 = HealthAlgorithms::deviationAnalysis((uint64_t)v115);
    [v9 setDeviationAnalysis:v10];
  }
  if (v153)
  {
    retrieve_id_for_core_analytics();
    v90 = (id)objc_claimAutoreleasedReturnValue();
    v154[0] = @"awakeSHRMissingRate";
    LODWORD(v11) = v134;
    v89 = [NSNumber numberWithFloat:v11];
    v155[0] = v89;
    v154[1] = @"calFWErr";
    if (v123) {
      uint64_t v12 = v122;
    }
    else {
      uint64_t v12 = 1000;
    }
    v88 = [NSNumber numberWithInt:v12];
    v155[1] = v88;
    v154[2] = @"currentCycleFactor";
    v87 = [NSNumber numberWithInt:v128];
    v155[2] = v87;
    v154[3] = @"daysBetweenConfirmedOvulationAndNotificationDay";
    v86 = [NSNumber numberWithInt:v150];
    v155[3] = v86;
    v154[4] = @"daysPassedEPAvailability";
    v85 = [NSNumber numberWithInt:v129];
    v155[4] = v85;
    v154[5] = @"daysWithWristTempInPast12Days";
    v84 = [NSNumber numberWithInt:v130];
    v155[5] = v84;
    v154[6] = @"daysWithWristTempInPast19Days";
    v83 = [NSNumber numberWithInt:v131];
    v155[6] = v83;
    v154[7] = @"daysWithWristTempInPast45Days";
    v82 = [NSNumber numberWithInt:v132];
    v155[7] = v82;
    v154[8] = @"deltaBetweenTodayAndCalOvulation";
    v81 = [NSNumber numberWithInt:v127];
    v155[8] = v81;
    v154[9] = @"dlFWErr";
    if (v121) {
      uint64_t v13 = v120;
    }
    else {
      uint64_t v13 = 1000;
    }
    v80 = [NSNumber numberWithInt:v13];
    v155[9] = v80;
    v154[10] = @"fertileWindowPeriodUpdateCombination";
    v79 = [NSNumber numberWithUnsignedChar:v133];
    v155[10] = v79;
    v154[11] = @"hasMultipleWatchWithKali";
    v78 = [NSNumber numberWithBool:v125];
    v155[11] = v78;
    v154[12] = @"isOnCycleFactors";
    v77 = [NSNumber numberWithBool:v124];
    v155[12] = v77;
    v154[13] = @"isOngoingMenstruation";
    v76 = [NSNumber numberWithBool:v119];
    v155[13] = v76;
    v154[14] = @"kaliDay2DayNoiseAnchoredByToday";
    v75 = [NSNumber numberWithInt:v149];
    v155[14] = v75;
    v154[15] = @"kaliMeetsDLLSTMAvailability";
    v74 = [NSNumber numberWithBool:v147];
    v155[15] = v74;
    v154[16] = @"kaliMeetsDLRFAvailability";
    v73 = [NSNumber numberWithBool:v146];
    v155[16] = v73;
    v154[17] = @"kaliMeetsExpeditedPathAvailability";
    v72 = [NSNumber numberWithBool:v145];
    v155[17] = v72;
    v154[18] = @"kaliSignalAtOvulationEstimate";
    v71 = [NSNumber numberWithInt:v148];
    v155[18] = v71;
    v154[19] = @"ovulationConfirmationMethod";
    v70 = [NSNumber numberWithInt:v151];
    v155[19] = v70;
    v154[20] = @"ovulationConfirmationNoUpdateReason";
    v69 = [NSNumber numberWithInt:v152];
    v155[20] = v69;
    v154[21] = @"percentile30AwakeSHRCountOver45Days";
    v68 = [NSNumber numberWithInt:v137];
    v155[21] = v68;
    v154[22] = @"percentile50AwakeSHRCountOver45Days";
    v67 = [NSNumber numberWithInt:v135];
    v155[22] = v67;
    v154[23] = @"percentile30NightSHRCountOver45Days";
    v66 = [NSNumber numberWithInt:v138];
    v155[23] = v66;
    v154[24] = @"percentile50NightSHRCountOver45Days";
    v14 = [NSNumber numberWithInt:v136];
    v155[24] = v14;
    v154[25] = @"periodPredictionMethod";
    v15 = [NSNumber numberWithInt:v126];
    v155[25] = v15;
    v155[26] = v90;
    v154[26] = @"pseudoDeviceID";
    v154[27] = @"ratioAwakeSedentaryHeartRateCountMoreThan12";
    LODWORD(v16) = v139;
    v17 = [NSNumber numberWithFloat:v16];
    v155[27] = v17;
    v154[28] = @"ratioAwakeSedentaryHeartRateCountMoreThan18";
    LODWORD(v18) = v140;
    double v19 = [NSNumber numberWithFloat:v18];
    v155[28] = v19;
    v154[29] = @"ratioAwakeSedentaryHeartRateCountMoreThan24";
    LODWORD(v20) = v141;
    double v21 = [NSNumber numberWithFloat:v20];
    v155[29] = v21;
    v154[30] = @"ratioSleepSedentaryHeartRateCountMoreThan12";
    LODWORD(v22) = v142;
    float v23 = [NSNumber numberWithFloat:v22];
    v155[30] = v23;
    v154[31] = @"ratioSleepSedentaryHeartRateCountMoreThan18";
    LODWORD(v24) = v143;
    int v25 = [NSNumber numberWithFloat:v24];
    v155[31] = v25;
    v154[32] = @"ratioSleepSedentaryHeartRateCountMoreThan24";
    LODWORD(v26) = v144;
    int v27 = [NSNumber numberWithFloat:v26];
    v155[32] = v27;
    v65 = [NSDictionary dictionaryWithObjects:v155 forKeys:v154 count:33];

    retstr->var1 = v65;
  }
  else
  {
    char v28 = ha_get_log();
    v90 = v28;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[MAIDayStreamProcessor analyzeWithMostRecentMenstrualFlowJulianDayUpdated:](v28);
    }
  }

  if (v116)
  {
    int v29 = retrieve_id_for_core_analytics();
    int v30 = v117;
    int v31 = [(MAIDayStreamProcessor *)self userAgeInYears];
    HealthAlgorithms::deviationAnalysisHIDCoreAnalytics(v115, v29, v30 != 0, v31);
    retstr->var2 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v32 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", 0x4EC4EC4EC4EC4EC5 * (((char *)v96 - (unsigned char *)__p) >> 3), v65);
  int v33 = (unsigned int *)__p;
  float v34 = v96;
  if (__p != v96)
  {
    do
    {
      if (*((unsigned char *)v33 + 40))
      {
        char v35 = objc_opt_new();
        [v35 setJulianDayOfWindowStart:*v33];
        if (*((unsigned char *)v33 + 40))
        {
          [v35 setStartProbabilityMean:*((double *)v33 + 1)];
          [v35 setStartProbabilityStdDev:*((double *)v33 + 2)];
        }
        if (*((unsigned char *)v33 + 80))
        {
          [v35 setEndProbabilityMean:*((double *)v33 + 6)];
          [v35 setEndProbabilityStdDev:*((double *)v33 + 7)];
        }
        objc_msgSend(v35, "setLowRange:", (int)v33[22], (int)v33[23]);
        [v35 setDaysOffsetFromCalendarMethod:(int)v33[24]];
        unsigned int v36 = v33[25];
        if (v36 >= 4) {
          unsigned __int8 v37 = 3;
        }
        else {
          unsigned __int8 v37 = 3 - v36;
        }
        [v35 setPredictionPrimarySource:v37];
        [v32 addObject:v35];
      }
      v33 += 26;
    }
    while (v33 != v34);
  }
  [v92 setFertilityPredictions:v32];
  char v38 = [MEMORY[0x263EFF980] arrayWithCapacity:0x4EC4EC4EC4EC4EC5 * ((v94 - (unsigned char *)v93) >> 3)];
  char v39 = (unsigned int *)v93;
  char v40 = (unsigned int *)v94;
  if (v93 != v94)
  {
    do
    {
      float v41 = objc_opt_new();
      [v41 setJulianDayOfWindowStart:*v39];
      if (*((unsigned char *)v39 + 40))
      {
        [v41 setStartProbabilityMean:*((double *)v39 + 1)];
        [v41 setStartProbabilityStdDev:*((double *)v39 + 2)];
      }
      if (*((unsigned char *)v39 + 80))
      {
        [v41 setEndProbabilityMean:*((double *)v39 + 6)];
        [v41 setEndProbabilityStdDev:*((double *)v39 + 7)];
      }
      objc_msgSend(v41, "setLowRange:", (int)v39[22], (int)v39[23]);
      [v41 setDaysOffsetFromCalendarMethod:(int)v39[24]];
      unsigned int v42 = v39[25];
      if (v42 >= 4) {
        unsigned __int8 v43 = 3;
      }
      else {
        unsigned __int8 v43 = 3 - v42;
      }
      [v41 setPredictionPrimarySource:v43];
      [v38 addObject:v41];

      v39 += 26;
    }
    while (v39 != v40);
  }
  if (v117 && [v38 count])
  {
    long long v44 = [v38 firstObject];
    [v44 setIsOngoingMenstruation:1];
  }
  [v92 setMenstruationPredictions:v38];
  long long v45 = objc_opt_new();
  [v92 setStats:v45];

  if (v98)
  {
    long long v46 = [NSNumber numberWithInt:v97];
    long long v47 = [v92 stats];
    [v47 setMedianCycleLength:v46];
  }
  if (v100)
  {
    char v48 = [NSNumber numberWithInt:v99];
    objc_super v49 = [v92 stats];
    [v49 setMedianMenstruationLength:v48];
  }
  if (v106)
  {
    v50 = [NSNumber numberWithInt:v105];
    v51 = [v92 stats];
    [v51 setLowerCycleLengthPercentile:v50];
  }
  if (v102)
  {
    v52 = [NSNumber numberWithInt:v101];
    v53 = [v92 stats];
    [v53 setLowerMenstruationLengthPercentile:v52];
  }
  if (v108)
  {
    v54 = [NSNumber numberWithInt:v107];
    v55 = [v92 stats];
    [v55 setUpperCycleLengthPercentile:v54];
  }
  if (v104)
  {
    v56 = [NSNumber numberWithInt:v103];
    v57 = [v92 stats];
    [v57 setUpperMenstruationLengthPercentile:v56];
  }
  if (v110)
  {
    v58 = [NSNumber numberWithInt:v109];
    v59 = [v92 stats];
    [v59 setNumberOfCyclesFound:v58];
  }
  if (v112)
  {
    v60 = [NSNumber numberWithInt:v111];
    v61 = [v92 stats];
    [v61 setJulianDayOfFirstCycleStart:v60];
  }
  if (v114)
  {
    v62 = [NSNumber numberWithInt:v113];
    v63 = [v92 stats];
    [v63 setJulianDayOfLastCycleStart:v62];
  }
  if (__p)
  {
    v96 = (unsigned int *)__p;
    operator delete(__p);
  }
  if (v93)
  {
    v94 = (char *)v93;
    operator delete(v93);
  }

  return result;
}

- (NSMutableArray)watchIdentifiers
{
  return self->_watchIdentifiers;
}

- (void)setWatchIdentifiers:(id)a3
{
}

- (NSNumber)userAgeInYears
{
  return self->_userAgeInYears;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgeInYears, 0);
  objc_storeStrong((id *)&self->_watchIdentifiers, 0);
  std::unique_ptr<HealthAlgorithms::PhaseCondenser>::reset[abi:nn180100]((uint64_t *)&self->_phaseCondenser, 0);
  std::unique_ptr<Nightingale::ngt_DayStreamProcessor>::reset[abi:nn180100]((Nightingale::ngt_DayStreamProcessor **)&self->_dayStreamProcessor, 0);
}

- (void)initWithConfig:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_fault_impl(&dword_22F10E000, log, OS_LOG_TYPE_FAULT, "age of %f years doesn't make sense: ignoring it", (uint8_t *)&v2, 0xCu);
}

- (void)analyzeWithMostRecentMenstrualFlowJulianDayUpdated:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22F10E000, log, OS_LOG_TYPE_ERROR, "coreAnalyticsOut for day stream processor has no value", v1, 2u);
}

@end