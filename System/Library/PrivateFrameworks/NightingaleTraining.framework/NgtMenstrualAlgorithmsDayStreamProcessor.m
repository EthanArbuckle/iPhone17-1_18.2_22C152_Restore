@interface NgtMenstrualAlgorithmsDayStreamProcessor
+ (unsigned)algorithmVersion;
- (NSMutableArray)dayInputBuffer;
- (NSMutableArray)watchIdentifiers;
- (NSNumber)userAgeInYears;
- (NgtMenstrualAlgorithmsDayStreamProcessor)initWithConfig:(id)a3 mlConfig:(id)a4;
- (id).cxx_construct;
- (id)analyzeWithMostRecentMenstrualFlowJulianDayUpdated:(unsigned int)a3 error:(id *)a4;
- (unsigned)watchNumericIdentifierFromString:(id)a3;
- (void)appendDay:(id)a3;
- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)runDays;
- (void)setDayInputBuffer:(id)a3;
- (void)setUserAgeInYears:(id)a3;
- (void)setWatchIdentifiers:(id)a3;
@end

@implementation NgtMenstrualAlgorithmsDayStreamProcessor

+ (unsigned)algorithmVersion
{
  return 2;
}

- (NgtMenstrualAlgorithmsDayStreamProcessor)initWithConfig:(id)a3 mlConfig:(id)a4
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v65 = a3;
  id v63 = a4;
  v101.receiver = self;
  v101.super_class = (Class)NgtMenstrualAlgorithmsDayStreamProcessor;
  v64 = [(NgtMenstrualAlgorithmsDayStreamProcessor *)&v101 init];

  if (v64)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:100];
    dayInputBuffer = v64->_dayInputBuffer;
    v64->_dayInputBuffer = (NSMutableArray *)v6;

    LOBYTE(v74) = 0;
    char v75 = 0;
    LOBYTE(v76) = 0;
    char v77 = 0;
    LOBYTE(v78) = 0;
    char v79 = 0;
    LOBYTE(v80) = 0;
    char v81 = 0;
    LOBYTE(v82) = 0;
    char v83 = 0;
    char v84 = 0;
    char v85 = 0;
    LOBYTE(v86) = 0;
    char v87 = 0;
    char v93 = 0;
    uint64_t v88 = 0;
    LOBYTE(v89) = 0;
    uint64_t v94 = 0x1800000018;
    memset(v95, 0, sizeof(v95));
    memset(v96, 0, sizeof(v96));
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    memset(&v100, 0, sizeof(v100));
    id v8 = [v63 heartRateFwEnd10PctModelPath];
    std::string::__assign_external((std::string *)&v97, (const std::string::value_type *)[v8 UTF8String]);

    id v9 = [v63 heartRatePeriod10PctModelPath];
    std::string::__assign_external(&v96[1], (const std::string::value_type *)[v9 UTF8String]);

    id v10 = [v63 wTmpFwEndLstmModelPath];
    std::string::__assign_external(&v95[1], (const std::string::value_type *)[v10 UTF8String]);

    id v11 = [v63 wTmpFwEndRFModelPath];
    std::string::__assign_external(v96, (const std::string::value_type *)[v11 UTF8String]);

    id v12 = [v63 wTmpPeriodLstmModelPath];
    std::string::__assign_external(v95, (const std::string::value_type *)[v12 UTF8String]);

    long long v73 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v70 = 0u;
    v13 = [v63 heartRatePeriodTFModelPaths];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v70 objects:v102 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v71 != v15) {
            objc_enumerationMutation(v13);
          }
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[*(id *)(*((void *)&v70 + 1) + 8 * i) UTF8String]);
          v17 = (_OWORD *)v99;
          if ((unint64_t)v99 >= *((void *)&v99 + 1))
          {
            unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v99 - *((void *)&v98 + 1)) >> 3);
            unint64_t v20 = v19 + 1;
            if (v19 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * ((uint64_t)(*((void *)&v99 + 1) - *((void *)&v98 + 1)) >> 3) > v20) {
              unint64_t v20 = 0x5555555555555556 * ((uint64_t)(*((void *)&v99 + 1) - *((void *)&v98 + 1)) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v99 + 1) - *((void *)&v98 + 1)) >> 3) >= 0x555555555555555) {
              unint64_t v21 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v21 = v20;
            }
            *(void *)&__v[32] = (char *)&v99 + 8;
            if (v21) {
              v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>((uint64_t)&v99 + 8, v21);
            }
            else {
              v22 = 0;
            }
            v23 = &v22[24 * v19];
            *(void *)__v = v22;
            *(void *)&__v[8] = v23;
            *(void *)&__v[24] = &v22[24 * v21];
            long long v24 = *(_OWORD *)__p;
            *((void *)v23 + 2) = v69;
            *(_OWORD *)v23 = v24;
            __p[1] = 0;
            uint64_t v69 = 0;
            __p[0] = 0;
            *(void *)&__v[16] = v23 + 24;
            std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)((char *)&v98 + 8), (std::__split_buffer<std::string> *)__v);
            uint64_t v25 = v99;
            std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)__v);
            *(void *)&long long v99 = v25;
            if (SHIBYTE(v69) < 0) {
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v18 = *(_OWORD *)__p;
            *(void *)(v99 + 16) = v69;
            _OWORD *v17 = v18;
            *(void *)&long long v99 = (char *)v17 + 24;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v70 objects:v102 count:16];
      }
      while (v14);
    }

    id v26 = [v63 heartRatePeriodEnsembleModelPath];
    std::string::__assign_external(&v100, (const std::string::value_type *)[v26 UTF8String]);

    v27 = [v65 userReportedCycleLength];
    BOOL v28 = v27 == 0;

    if (!v28)
    {
      v29 = [v65 userReportedCycleLength];
      int v30 = [v29 unsignedIntValue];
      if (!v75) {
        char v75 = 1;
      }
      int v74 = v30;
    }
    v31 = [v65 julianDayOfUserReportedCycleLength];
    BOOL v32 = v31 == 0;

    if (!v32)
    {
      v33 = [v65 julianDayOfUserReportedCycleLength];
      int v34 = [v33 unsignedIntValue];
      if (!v79) {
        char v79 = 1;
      }
      int v78 = v34;
    }
    v35 = [v65 userReportedMenstruationLength];
    BOOL v36 = v35 == 0;

    if (!v36)
    {
      v37 = [v65 userReportedMenstruationLength];
      int v38 = [v37 unsignedIntValue];
      if (!v77) {
        char v77 = 1;
      }
      int v76 = v38;
    }
    v39 = [v65 julianDayOfUserReportedMenstruationLength];
    BOOL v40 = v39 == 0;

    if (!v40)
    {
      v41 = [v65 julianDayOfUserReportedMenstruationLength];
      int v42 = [v41 unsignedIntValue];
      if (!v81) {
        char v81 = 1;
      }
      int v80 = v42;
    }
    v43 = [v65 awakeSHRCountThreshold];
    BOOL v44 = v43 == 0;

    if (!v44)
    {
      v45 = [v65 awakeSHRCountThreshold];
      LODWORD(v94) = [v45 unsignedIntValue];
    }
    v46 = [v65 sleepSHRCountThreshold];
    BOOL v47 = v46 == 0;

    if (!v47)
    {
      v48 = [v65 sleepSHRCountThreshold];
      HIDWORD(v94) = [v48 unsignedIntValue];
    }
    v49 = [v65 birthDateComponents];
    BOOL v50 = v49 == 0;

    if (!v50)
    {
      v52 = [v65 birthDateComponents];
      v53 = [v52 date];
      [v53 timeIntervalSinceNow];
      double v55 = v54;

      double v51 = v55 / -31557600.0;
      if (v55 / -31557600.0 >= 1.0 && v51 <= 200.0)
      {
        float v56 = v51;
        float v86 = v56;
        char v87 = 1;
        v57 = objc_msgSend(NSNumber, "numberWithDouble:");
        [(NgtMenstrualAlgorithmsDayStreamProcessor *)v64 setUserAgeInYears:v57];
      }
    }
    v58 = objc_msgSend(v65, "deviationInput", v51);
    BOOL v59 = v58 == 0;

    if (!v59)
    {
      v60 = [v65 deviationInput];
      deviationInput(v60, __v);
      long long v89 = *(_OWORD *)__v;
      long long v90 = *(_OWORD *)&__v[16];
      long long v91 = *(_OWORD *)&__v[32];
      long long v92 = v67;
      if (!v93) {
        char v93 = 1;
      }
    }
    int v61 = [v65 todayAsJulianDay];
    if (!v83) {
      char v83 = 1;
    }
    int v82 = v61;
    operator new();
  }

  return 0;
}

- (void)appendDay:(id)a3
{
  id v8 = a3;
  v4 = [(NgtMenstrualAlgorithmsDayStreamProcessor *)self dayInputBuffer];
  [v4 addObject:v8];

  v5 = [(NgtMenstrualAlgorithmsDayStreamProcessor *)self dayInputBuffer];
  uint64_t v6 = [v5 count];

  if (v6 == 100)
  {
    [(NgtMenstrualAlgorithmsDayStreamProcessor *)self runDays];
    v7 = [(NgtMenstrualAlgorithmsDayStreamProcessor *)self dayInputBuffer];
    [v7 removeAllObjects];
  }
}

- (void)runDays
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(NgtMenstrualAlgorithmsDayStreamProcessor *)self dayInputBuffer];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v14 != v5) {
        objc_enumerationMutation(v3);
      }
      v7 = *(NgtMenstrualAlgorithmsDayInput **)(*((void *)&v13 + 1) + 8 * v6);
      id v8 = [(NgtMenstrualAlgorithmsDayInput *)v7 wristTemperature];
      id v9 = [v8 watchIdentifier];
      int v10 = [(NgtMenstrualAlgorithmsDayStreamProcessor *)self watchNumericIdentifierFromString:v9];

      if (self->_julianDayOfLastInput.__engaged_)
      {
        unsigned int val = self->_julianDayOfLastInput.var0.__val_;
        if (val >= [(NgtMenstrualAlgorithmsDayInput *)v7 julianDay]) {
          break;
        }
      }
      self->_julianDayOfLastInput.var0.__val_ = [(NgtMenstrualAlgorithmsDayInput *)v7 julianDay];
      self->_julianDayOfLastInput.__engaged_ = 1;
      convert_day_input(v7, v10, (uint64_t)v12);
      Nightingale::ngt_DayStreamProcessor::appendDay((void **)self->_dayStreamProcessor.__ptr_.__value_, v12);
      if (v4 == ++v6)
      {
        uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  value = self->_dayStreamProcessor.__ptr_.__value_;
  if (((a3 - 1) & 0xF8) != 0) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = a3;
  }
  Nightingale::ngt_DayStreamProcessor::begin_phase((uint64_t)value, v5, a4);
}

- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  value = self->_dayStreamProcessor.__ptr_.__value_;
  if (((a3 - 1) & 0xF8) != 0) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = a3;
  }
  Nightingale::ngt_DayStreamProcessor::end_phase((uint64_t)value, v5, a4);
}

- (unsigned)watchNumericIdentifierFromString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = [(NgtMenstrualAlgorithmsDayStreamProcessor *)self watchIdentifiers];
    uint64_t v6 = (void *)[v5 indexOfObject:v4];

    if (v6 == (void *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = [(NgtMenstrualAlgorithmsDayStreamProcessor *)self watchIdentifiers];
      [v6 addObject:v4];

      v7 = [(NgtMenstrualAlgorithmsDayStreamProcessor *)self watchIdentifiers];
      LOBYTE(v6) = [v7 count] - 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)analyzeWithMostRecentMenstrualFlowJulianDayUpdated:(unsigned int)a3 error:(id *)a4
{
  uint64_t v6 = [(NgtMenstrualAlgorithmsDayStreamProcessor *)self dayInputBuffer];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    [(NgtMenstrualAlgorithmsDayStreamProcessor *)self runDays];
    id v8 = [(NgtMenstrualAlgorithmsDayStreamProcessor *)self dayInputBuffer];
    [v8 removeAllObjects];
  }
  id v9 = objc_opt_new();
  Nightingale::ngt_DayStreamProcessor::analyze((uint64_t)self->_dayStreamProcessor.__ptr_.__value_, a3 & 0xFFFFFF00 | a3 & ~((int)a3 >> 31) | ((unint64_t)((int)a3 > 0) << 32), 1, (uint64_t)&v114);
  [v9 setIsUserInactive:v136[141]];
  if (v136[136])
  {
    int v10 = deviationAnalysis((uint64_t)v136);
    [v9 setDeviationAnalysis:v10];
  }
  id v11 = [MEMORY[0x263EFF980] arrayWithCapacity:0x4EC4EC4EC4EC4EC5 * (((char *)v117 - (unsigned char *)__p) >> 3)];
  id v12 = (unsigned int *)__p;
  long long v13 = v117;
  if (__p != v117)
  {
    do
    {
      if (*((unsigned char *)v12 + 40))
      {
        long long v14 = objc_opt_new();
        [v14 setJulianDayOfWindowStart:*v12];
        if (*((unsigned char *)v12 + 40))
        {
          [v14 setStartProbabilityMean:*((double *)v12 + 1)];
          [v14 setStartProbabilityStdDev:*((double *)v12 + 2)];
          [v14 setStartProbabilityLowRangeStart:*((double *)v12 + 3)];
          [v14 setStartProbabilityLowRangeEnd:*((double *)v12 + 4)];
        }
        if (*((unsigned char *)v12 + 80))
        {
          [v14 setEndProbabilityMean:*((double *)v12 + 6)];
          [v14 setEndProbabilityStdDev:*((double *)v12 + 7)];
          [v14 setEndProbabilityLowRangeStart:*((double *)v12 + 8)];
          [v14 setEndProbabilityLowRangeEnd:*((double *)v12 + 9)];
        }
        objc_msgSend(v14, "setLowRange:", (int)v12[22], (int)v12[23]);
        [v14 setDaysOffsetFromCalendarMethod:(int)v12[24]];
        unsigned int v15 = v12[25];
        if (v15 >= 4) {
          unsigned __int8 v16 = 3;
        }
        else {
          unsigned __int8 v16 = 3 - v15;
        }
        [v14 setPredictionPrimarySource:v16];
        [v11 addObject:v14];
      }
      v12 += 26;
    }
    while (v12 != v13);
  }
  [v9 setFertilityPredictions:v11];
  v17 = [MEMORY[0x263EFF980] arrayWithCapacity:0x4EC4EC4EC4EC4EC5 * ((v115 - (unsigned char *)v114) >> 3)];
  uint64_t v18 = v115;
  if (v114 != v115)
  {
    unint64_t v19 = (char *)v114 + 48;
    do
    {
      unint64_t v20 = objc_opt_new();
      unint64_t v21 = v19 - 48;
      [v20 setJulianDayOfWindowStart:*((unsigned int *)v19 - 12)];
      if (*(v19 - 8))
      {
        [v20 setStartProbabilityMean:*((double *)v19 - 5)];
        [v20 setStartProbabilityStdDev:*((double *)v19 - 4)];
        [v20 setStartProbabilityLowRangeStart:*((double *)v19 - 3)];
        [v20 setStartProbabilityLowRangeEnd:*((double *)v19 - 2)];
      }
      if (v19[32])
      {
        [v20 setEndProbabilityMean:*(double *)v19];
        [v20 setEndProbabilityStdDev:*((double *)v19 + 1)];
        [v20 setEndProbabilityLowRangeStart:*((double *)v19 + 2)];
        [v20 setEndProbabilityLowRangeEnd:*((double *)v19 + 3)];
      }
      objc_msgSend(v20, "setLowRange:", *((int *)v19 + 10), *((int *)v19 + 11));
      [v20 setDaysOffsetFromCalendarMethod:*((int *)v19 + 12)];
      unsigned int v22 = *((_DWORD *)v19 + 13);
      if (v22 >= 4) {
        unsigned __int8 v23 = 3;
      }
      else {
        unsigned __int8 v23 = 3 - v22;
      }
      [v20 setPredictionPrimarySource:v23];
      [v17 addObject:v20];

      v19 += 104;
    }
    while (v21 + 104 != v18);
  }
  if (v136[140] && [v17 count])
  {
    long long v24 = [v17 firstObject];
    [v24 setIsOngoingMenstruation:1];
  }
  [v9 setMenstruationPredictions:v17];
  uint64_t v25 = objc_opt_new();
  [v9 setStats:v25];

  if (v119)
  {
    id v26 = [NSNumber numberWithInt:v118];
    v27 = [v9 stats];
    [v27 setMedianCycleLength:v26];
  }
  if (v121)
  {
    BOOL v28 = [NSNumber numberWithInt:v120];
    v29 = [v9 stats];
    [v29 setMedianMenstruationLength:v28];
  }
  if (v127)
  {
    int v30 = [NSNumber numberWithInt:v126];
    v31 = [v9 stats];
    [v31 setLowerCycleLengthPercentile:v30];
  }
  if (v123)
  {
    BOOL v32 = [NSNumber numberWithInt:v122];
    v33 = [v9 stats];
    [v33 setLowerMenstruationLengthPercentile:v32];
  }
  if (v129)
  {
    int v34 = [NSNumber numberWithInt:v128];
    v35 = [v9 stats];
    [v35 setUpperCycleLengthPercentile:v34];
  }
  if (v125)
  {
    BOOL v36 = [NSNumber numberWithInt:v124];
    v37 = [v9 stats];
    [v37 setUpperMenstruationLengthPercentile:v36];
  }
  if (v131)
  {
    int v38 = [NSNumber numberWithInt:v130];
    v39 = [v9 stats];
    [v39 setNumberOfCyclesFound:v38];
  }
  if (v133)
  {
    BOOL v40 = [NSNumber numberWithInt:v132];
    v41 = [v9 stats];
    [v41 setJulianDayOfFirstCycleStart:v40];
  }
  if (v135)
  {
    int v42 = [NSNumber numberWithInt:v134];
    v43 = [v9 stats];
    [v43 setJulianDayOfLastCycleStart:v42];
  }
  if (v160)
  {
    BOOL v44 = [NgtMenstrualAlgorithmsTelemetry alloc];
    [v9 setTelemetry:v44];

    LODWORD(v45) = v137;
    v46 = [NSNumber numberWithFloat:v45];
    BOOL v47 = [v9 telemetry];
    [v47 setNumHistoricalCycles:v46];

    LODWORD(v48) = v138;
    v49 = [NSNumber numberWithFloat:v48];
    BOOL v50 = [v9 telemetry];
    [v50 setBaselineStdUncapped:v49];

    LODWORD(v51) = v139;
    v52 = [NSNumber numberWithFloat:v51];
    v53 = [v9 telemetry];
    [v53 setBaselineMean:v52];

    LODWORD(v54) = v140;
    double v55 = [NSNumber numberWithFloat:v54];
    float v56 = [v9 telemetry];
    [v56 setModel0Width:v55];

    LODWORD(v57) = v141;
    v58 = [NSNumber numberWithFloat:v57];
    BOOL v59 = [v9 telemetry];
    [v59 setDaysToModel0Drs:v58];

    LODWORD(v60) = v142;
    int v61 = [NSNumber numberWithFloat:v60];
    v62 = [v9 telemetry];
    [v62 setModel1Width:v61];

    LODWORD(v63) = v143;
    v64 = [NSNumber numberWithFloat:v63];
    id v65 = [v9 telemetry];
    [v65 setDaysToModel1Drs:v64];

    LODWORD(v66) = v144;
    long long v67 = [NSNumber numberWithFloat:v66];
    v68 = [v9 telemetry];
    [v68 setModel2Width:v67];

    LODWORD(v69) = v145;
    long long v70 = [NSNumber numberWithFloat:v69];
    long long v71 = [v9 telemetry];
    [v71 setDaysToModel2Drs:v70];

    LODWORD(v72) = v146;
    long long v73 = [NSNumber numberWithFloat:v72];
    int v74 = [v9 telemetry];
    [v74 setAge:v73];

    LODWORD(v75) = v147;
    int v76 = [NSNumber numberWithFloat:v75];
    char v77 = [v9 telemetry];
    [v77 setSliceDayHrMean:v76];

    LODWORD(v78) = v148;
    char v79 = [NSNumber numberWithFloat:v78];
    int v80 = [v9 telemetry];
    [v80 setSliceDayHrStd:v79];

    LODWORD(v81) = v149;
    int v82 = [NSNumber numberWithFloat:v81];
    char v83 = [v9 telemetry];
    [v83 setSliceDayHrCount:v82];

    LODWORD(v84) = v150;
    char v85 = [NSNumber numberWithFloat:v84];
    float v86 = [v9 telemetry];
    [v86 setSliceNightHrMean:v85];

    LODWORD(v87) = v151;
    uint64_t v88 = [NSNumber numberWithFloat:v87];
    long long v89 = [v9 telemetry];
    [v89 setSliceNightHrStd:v88];

    LODWORD(v90) = v152;
    long long v91 = [NSNumber numberWithFloat:v90];
    long long v92 = [v9 telemetry];
    [v92 setSliceNightHrCount:v91];

    LODWORD(v93) = v153;
    uint64_t v94 = [NSNumber numberWithFloat:v93];
    v95 = [v9 telemetry];
    [v95 setDaysSinceLastPeriod:v94];

    LODWORD(v96) = v154;
    long long v97 = [NSNumber numberWithFloat:v96];
    long long v98 = [v9 telemetry];
    [v98 setNormalizedDaysSinceLastPeriod:v97];

    LODWORD(v99) = v155;
    std::string v100 = [NSNumber numberWithFloat:v99];
    objc_super v101 = [v9 telemetry];
    [v101 setDaysSinceLastContraceptionEnd:v100];

    LODWORD(v102) = v156;
    uint64_t v103 = [NSNumber numberWithFloat:v102];
    v104 = [v9 telemetry];
    [v104 setDaysSinceLastPregnancyEnd:v103];

    LODWORD(v105) = v157;
    v106 = [NSNumber numberWithFloat:v105];
    v107 = [v9 telemetry];
    [v107 setDaysSinceLastLactationEnd:v106];

    LODWORD(v108) = v158;
    v109 = [NSNumber numberWithFloat:v108];
    v110 = [v9 telemetry];
    [v110 setNumOutliers:v109];

    v111 = [NSNumber numberWithInt:v159];
    v112 = [v9 telemetry];
    [v112 setEnsembleSelectedModelIdx:v111];
  }
  if (__p)
  {
    v117 = (unsigned int *)__p;
    operator delete(__p);
  }
  if (v114)
  {
    v115 = (char *)v114;
    operator delete(v114);
  }
  return v9;
}

- (NSMutableArray)dayInputBuffer
{
  return self->_dayInputBuffer;
}

- (void)setDayInputBuffer:(id)a3
{
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

- (void)setUserAgeInYears:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgeInYears, 0);
  objc_storeStrong((id *)&self->_watchIdentifiers, 0);
  objc_storeStrong((id *)&self->_dayInputBuffer, 0);
  std::unique_ptr<Nightingale::ngt_DayStreamProcessor>::reset[abi:ne180100]((Nightingale::ngt_DayStreamProcessor **)&self->_dayStreamProcessor, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((unsigned char *)self + 16) = 0;
  *((unsigned char *)self + 20) = 0;
  return self;
}

@end