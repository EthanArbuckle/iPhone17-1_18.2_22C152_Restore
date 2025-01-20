@interface NgtMenstrualAlgorithmsHistoricalAnalyzer
+ (unsigned)algorithmVersion;
- (BOOL)shouldSendCoreAnalytics;
- (NSMutableArray)dayInputBuffer;
- (NSMutableArray)watchIdentifiers;
- (NgtMenstrualAlgorithmsHistoricalAnalyzer)initWithMlConfig:(id)a3;
- (id).cxx_construct;
- (id)analyzeWithError:(id *)a3;
- (unsigned)watchNumericIdentifierFromString:(id)a3;
- (void)appendDay:(id)a3;
- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)runDays;
- (void)setDayInputBuffer:(id)a3;
- (void)setWatchIdentifiers:(id)a3;
@end

@implementation NgtMenstrualAlgorithmsHistoricalAnalyzer

+ (unsigned)algorithmVersion
{
  return 2;
}

- (NgtMenstrualAlgorithmsHistoricalAnalyzer)initWithMlConfig:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)NgtMenstrualAlgorithmsHistoricalAnalyzer;
  v5 = [(NgtMenstrualAlgorithmsHistoricalAnalyzer *)&v45 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:100];
    dayInputBuffer = v5->_dayInputBuffer;
    v5->_dayInputBuffer = (NSMutableArray *)v6;

    uint64_t v8 = objc_opt_new();
    watchIdentifiers = v5->_watchIdentifiers;
    v5->_watchIdentifiers = (NSMutableArray *)v8;

    char v18 = 0;
    char v19 = 0;
    char v20 = 0;
    char v21 = 0;
    char v22 = 0;
    char v23 = 0;
    char v24 = 0;
    char v25 = 0;
    char v26 = 0;
    char v27 = 0;
    char v28 = 0;
    char v29 = 0;
    char v30 = 0;
    char v31 = 0;
    char v34 = 0;
    uint64_t v32 = 0;
    char v33 = 0;
    uint64_t v35 = 0x1800000018;
    long long v36 = 0u;
    memset(v37, 0, sizeof(v37));
    long long v38 = 0u;
    memset(v39, 0, sizeof(v39));
    long long __p = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v44 = 0;
    id v10 = [v4 heartRateFwEnd10PctModelPath];
    std::string::basic_string[abi:ne180100]<0>(&v16, (char *)[v10 UTF8String]);
    if (SBYTE7(v41) < 0) {
      operator delete((void *)__p);
    }
    long long __p = v16;
    *(void *)&long long v41 = v17;
    HIBYTE(v17) = 0;
    LOBYTE(v16) = 0;

    id v11 = [v4 heartRatePeriod10PctModelPath];
    std::string::basic_string[abi:ne180100]<0>(&v16, (char *)[v11 UTF8String]);
    if (SHIBYTE(v39[3]) < 0) {
      operator delete((void *)v39[1]);
    }
    *(_OWORD *)&v39[1] = v16;
    v39[3] = v17;
    HIBYTE(v17) = 0;
    LOBYTE(v16) = 0;

    id v12 = [v4 wTmpFwEndLstmModelPath];
    std::string::basic_string[abi:ne180100]<0>(&v16, (char *)[v12 UTF8String]);
    if (SHIBYTE(v37[3]) < 0) {
      operator delete((void *)v37[1]);
    }
    *(_OWORD *)&v37[1] = v16;
    v37[3] = v17;
    HIBYTE(v17) = 0;
    LOBYTE(v16) = 0;

    id v13 = [v4 wTmpFwEndRFModelPath];
    std::string::basic_string[abi:ne180100]<0>(&v16, (char *)[v13 UTF8String]);
    if (SHIBYTE(v39[0]) < 0) {
      operator delete((void *)v38);
    }
    long long v38 = v16;
    v39[0] = v17;
    HIBYTE(v17) = 0;
    LOBYTE(v16) = 0;

    id v14 = [v4 wTmpPeriodLstmModelPath];
    std::string::basic_string[abi:ne180100]<0>(&v16, (char *)[v14 UTF8String]);
    if (SHIBYTE(v37[0]) < 0) {
      operator delete((void *)v36);
    }
    long long v36 = v16;
    v37[0] = v17;
    HIBYTE(v17) = 0;
    LOBYTE(v16) = 0;

    operator new();
  }

  return 0;
}

- (void)appendDay:(id)a3
{
  id v8 = a3;
  id v4 = [(NgtMenstrualAlgorithmsHistoricalAnalyzer *)self dayInputBuffer];
  [v4 addObject:v8];

  v5 = [(NgtMenstrualAlgorithmsHistoricalAnalyzer *)self dayInputBuffer];
  uint64_t v6 = [v5 count];

  if (v6 == 100)
  {
    [(NgtMenstrualAlgorithmsHistoricalAnalyzer *)self runDays];
    v7 = [(NgtMenstrualAlgorithmsHistoricalAnalyzer *)self dayInputBuffer];
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
  v3 = [(NgtMenstrualAlgorithmsHistoricalAnalyzer *)self dayInputBuffer];
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
      v9 = [v8 watchIdentifier];
      int v10 = [(NgtMenstrualAlgorithmsHistoricalAnalyzer *)self watchNumericIdentifierFromString:v9];

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
      Nightingale::ngt_HistoricalAnalyzer::appendDay((void **)self->_historicalAnalyzer.__ptr_.__value_, v12);
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

- (unsigned)watchNumericIdentifierFromString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NgtMenstrualAlgorithmsHistoricalAnalyzer *)self watchIdentifiers];
    uint64_t v6 = (void *)[v5 indexOfObject:v4];

    if (v6 == (void *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = [(NgtMenstrualAlgorithmsHistoricalAnalyzer *)self watchIdentifiers];
      [v6 addObject:v4];

      v7 = [(NgtMenstrualAlgorithmsHistoricalAnalyzer *)self watchIdentifiers];
      LOBYTE(v6) = [v7 count] - 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  value = self->_historicalAnalyzer.__ptr_.__value_;
  if (((a3 - 1) & 0xF8) != 0) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = a3;
  }
  Nightingale::ngt_HistoricalAnalyzer::begin_phase((uint64_t)value, v5, a4);
}

- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  value = self->_historicalAnalyzer.__ptr_.__value_;
  if (((a3 - 1) & 0xF8) != 0) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = a3;
  }
  Nightingale::ngt_HistoricalAnalyzer::end_phase((uint64_t)value, v5, a4);
}

- (id)analyzeWithError:(id *)a3
{
  id v4 = [(NgtMenstrualAlgorithmsHistoricalAnalyzer *)self dayInputBuffer];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [(NgtMenstrualAlgorithmsHistoricalAnalyzer *)self runDays];
    uint64_t v6 = [(NgtMenstrualAlgorithmsHistoricalAnalyzer *)self dayInputBuffer];
    [v6 removeAllObjects];
  }
  Nightingale::ngt_HistoricalAnalyzer::analyze((Nightingale::ngt_HistoricalAnalyzer *)self->_historicalAnalyzer.__ptr_.__value_, 1, (uint64_t)&v22);
  v7 = [MEMORY[0x263EFF980] arrayWithCapacity:0x8E38E38E38E38E39 * (((char *)v23 - (char *)v22) >> 3)];
  id v8 = v22;
  for (i = v23; v8 != i; v8 += 18)
  {
    int v10 = objc_opt_new();
    id v11 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*((void *)v8 + 5) - *((void *)v8 + 4)];
    id v12 = (unsigned __int8 *)*((void *)v8 + 4);
    long long v13 = (unsigned __int8 *)*((void *)v8 + 5);
    while (v12 != v13)
    {
      if (((*v12 - 1) & 0xF8) != 0) {
        unsigned __int8 v14 = 0;
      }
      else {
        unsigned __int8 v14 = *v12;
      }
      long long v15 = [NSNumber numberWithUnsignedChar:v14];
      [v11 addObject:v15];

      ++v12;
    }
    [v10 setPhases:v11];
    if (*((unsigned char *)v8 + 4))
    {
      long long v16 = [NSNumber numberWithInt:*v8];
      [v10 setFertilityStartJulianDay:v16];
    }
    if (*((unsigned char *)v8 + 12))
    {
      uint64_t v17 = [NSNumber numberWithInt:v8[2]];
      [v10 setFertilityEndJulianDay:v17];
    }
    [v10 setJulianDayOfMenstruationStart:v8[4]];
    [v10 setJulianDayOfMenstruationEnd:v8[5]];
    [v10 setIsDeterminant:*((unsigned __int8 *)v8 + 24)];
    unsigned int v18 = v8[15];
    if (v18 >= 5) {
      LOBYTE(v18) = 0;
    }
    [v10 setOvulationConfirmationFailure:v18];
    [v10 setDailyEligibleWristTemperatureCount:(int)v8[16]];
    unsigned int v19 = v8[14];
    if (v19 >= 4) {
      unsigned __int8 v20 = 3;
    }
    else {
      unsigned __int8 v20 = 3 - v19;
    }
    [v10 setPredictionPrimarySource:v20];
    [v7 addObject:v10];
  }
  char v24 = &v22;
  std::vector<Nightingale::ngt_HistoricCycle>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
  return v7;
}

- (NSMutableArray)dayInputBuffer
{
  return self->_dayInputBuffer;
}

- (void)setDayInputBuffer:(id)a3
{
}

- (BOOL)shouldSendCoreAnalytics
{
  return self->_shouldSendCoreAnalytics;
}

- (NSMutableArray)watchIdentifiers
{
  return self->_watchIdentifiers;
}

- (void)setWatchIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchIdentifiers, 0);
  objc_storeStrong((id *)&self->_dayInputBuffer, 0);
  std::unique_ptr<Nightingale::ngt_HistoricalAnalyzer>::reset[abi:ne180100]((Nightingale::ngt_HistoricalAnalyzer **)&self->_historicalAnalyzer, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((unsigned char *)self + 16) = 0;
  *((unsigned char *)self + 20) = 0;
  return self;
}

@end