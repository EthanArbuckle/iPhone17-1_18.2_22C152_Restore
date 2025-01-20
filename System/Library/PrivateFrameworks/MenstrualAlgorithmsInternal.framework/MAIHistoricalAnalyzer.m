@interface MAIHistoricalAnalyzer
- (MAIHistoricalAnalyzer)init;
- (MAIHistoricalAnalyzerOutput)analyze;
- (NSMutableArray)watchIdentifiers;
- (id).cxx_construct;
- (id)phaseStringFromNumber:(id)a3;
- (unsigned)watchNumericIdentifierFromString:(id)a3;
- (void)analyze;
- (void)appendDay:(id)a3;
- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)setWatchIdentifiers:(id)a3;
@end

@implementation MAIHistoricalAnalyzer

- (MAIHistoricalAnalyzer)init
{
  v6.receiver = self;
  v6.super_class = (Class)MAIHistoricalAnalyzer;
  v2 = [(MAIHistoricalAnalyzer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    watchIdentifiers = v2->_watchIdentifiers;
    v2->_watchIdentifiers = (NSMutableArray *)v3;

    operator new();
  }

  return 0;
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
  v5 = [v4 wristTemperature];
  objc_super v6 = [v5 watchIdentifier];
  int v7 = [(MAIHistoricalAnalyzer *)self watchNumericIdentifierFromString:v6];

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

    v19 = [v9 wristTemperature];

    if (v19)
    {
      v20 = [v9 wristTemperature];
      [v20 temperatureCelsius];
      double v22 = v21;

      float v23 = v22;
      int v33 = v7;
      float v34 = v23;
      char v35 = 1;
    }

    Nightingale::ngt_HistoricalAnalyzer::appendDay((void **)self->_historicalAnalyzer.__ptr_.__value_, &v24);
  }
}

- (unsigned)watchNumericIdentifierFromString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(MAIHistoricalAnalyzer *)self watchIdentifiers];
    objc_super v6 = (void *)[v5 indexOfObject:v4];

    if (v6 == (void *)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_super v6 = [(MAIHistoricalAnalyzer *)self watchIdentifiers];
      [v6 addObject:v4];

      int v7 = [(MAIHistoricalAnalyzer *)self watchIdentifiers];
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
  value = (uint64_t **)self->_phaseCondenser.__ptr_.__value_;
  if (((a3 - 1) & 0xF8) != 0) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = a3;
  }
  HealthAlgorithms::PhaseCondenser::begin_phase(value, v5, a4);
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

- (id)phaseStringFromNumber:(id)a3
{
  v8[9] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v7[0] = &unk_26E28F6F8;
    v7[1] = &unk_26E28F710;
    v8[0] = @"Pregnancy";
    v8[1] = @"Lactation";
    v7[2] = &unk_26E28F728;
    v7[3] = &unk_26E28F740;
    v8[2] = @"ContraceptiveImplant";
    v8[3] = @"ContraceptiveInjection";
    v7[4] = &unk_26E28F758;
    v7[5] = &unk_26E28F770;
    v8[4] = @"ContraceptiveIntrauterineDevice";
    v8[5] = @"ContraceptiveIntravaginalRing";
    v7[6] = &unk_26E28F788;
    v7[7] = &unk_26E28F7A0;
    v8[6] = @"ContraceptiveOral";
    v8[7] = @"ContraceptivePatch";
    v7[8] = &unk_26E28F7B8;
    v8[8] = @"ContraceptiveUnspecified";
    id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:9];
    unsigned int v5 = [v4 objectForKeyedSubscript:v3];
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (MAIHistoricalAnalyzerOutput)analyze
{
  uint64_t v174 = *MEMORY[0x263EF8340];
  HealthAlgorithms::PhaseCondenser::phase_updates((HealthAlgorithms::PhaseCondenser *)self->_phaseCondenser.__ptr_.__value_, (uint64_t)&__p);
  id v3 = (char *)__p;
  id v4 = v127;
  if (__p != v127)
  {
    do
    {
      Nightingale::ngt_HistoricalAnalyzer::appendPhaseSet((std::vector<int> *)self->_historicalAnalyzer.__ptr_.__value_, *(void *)v3, *((_DWORD *)v3 + 2));
      v3 += 16;
    }
    while (v3 != v4);
    id v3 = (char *)__p;
  }
  if (v3)
  {
    v127 = v3;
    operator delete(v3);
  }
  Nightingale::ngt_HistoricalAnalyzer::analyze((Nightingale::ngt_HistoricalAnalyzer *)self->_historicalAnalyzer.__ptr_.__value_, 1, (uint64_t)&v74);
  if (v124)
  {
    v125[0] = @"countEligibleCycles";
    v72 = [NSNumber numberWithInt:v114];
    __p = v72;
    v125[1] = @"daysHormonalContraceptionEndLoggedBeforeCycleStartMax";
    v71 = [NSNumber numberWithInt:v113];
    v127 = v71;
    v125[2] = @"daysHormonalContraceptionEndLoggedBeforeCycleStartMedian";
    v70 = [NSNumber numberWithInt:v111];
    v128 = v70;
    v125[3] = @"daysHormonalContraceptionEndLoggedBeforeCycleStartMin";
    v69 = [NSNumber numberWithInt:v112];
    v129 = v69;
    v125[4] = @"daysHormonalContraceptionStartLoggedAfterCycleStartMax";
    v68 = [NSNumber numberWithInt:v110];
    v130 = v68;
    v125[5] = @"daysHormonalContraceptionStartLoggedAfterCycleStartMedian";
    v67 = [NSNumber numberWithInt:v108];
    v131 = v67;
    v125[6] = @"daysHormonalContraceptionStartLoggedAfterCycleStartMin";
    v66 = [NSNumber numberWithInt:v109];
    v132 = v66;
    v125[7] = @"daysPregnancyEndLoggedBeforeCycleStartMax";
    v65 = [NSNumber numberWithInt:v107];
    v133 = v65;
    v125[8] = @"daysPregnancyEndLoggedBeforeCycleStartMedian";
    v64 = [NSNumber numberWithInt:v105];
    v134 = v64;
    v125[9] = @"daysPregnancyEndLoggedBeforeCycleStartMin";
    v63 = [NSNumber numberWithInt:v106];
    v135 = v63;
    v125[10] = @"daysPregnancyStartLoggedAfterCycleStartMax";
    v62 = [NSNumber numberWithInt:v104];
    v136 = v62;
    v125[11] = @"daysPregnancyStartLoggedAfterCycleStartMedian";
    v61 = [NSNumber numberWithInt:v102];
    v137 = v61;
    v125[12] = @"daysPregnancyStartLoggedAfterCycleStartMin";
    v60 = [NSNumber numberWithInt:v103];
    v138 = v60;
    v125[13] = @"estimatedLutealPhaseLength25Pct";
    v59 = [NSNumber numberWithInt:v98];
    v139 = v59;
    v125[14] = @"estimatedLutealPhaseLength75Pct";
    v58 = [NSNumber numberWithInt:v100];
    v140 = v58;
    v125[15] = @"estimatedLutealPhaseLengthMax";
    v57 = [NSNumber numberWithInt:v101];
    v141 = v57;
    v125[16] = @"estimatedLutealPhaseLengthMedian";
    v56 = [NSNumber numberWithInt:v99];
    v142 = v56;
    v125[17] = @"estimatedLutealPhaseLengthMin";
    v55 = [NSNumber numberWithInt:v97];
    v143 = v55;
    v125[18] = @"hasMultipleWatch";
    v54 = [NSNumber numberWithBool:v78];
    v144 = v54;
    v125[19] = @"kaliDay2DayNoise";
    v53 = [NSNumber numberWithInt:v90];
    v145 = v53;
    v125[20] = @"kaliFromPrimaryWatchRatio";
    v52 = [NSNumber numberWithInt:v91];
    v146 = v52;
    v125[21] = @"kaliMeetsHistoricalAlgAvailability";
    v51 = [NSNumber numberWithInt:v79];
    v147 = v51;
    v125[22] = @"kaliSignal25PctAtOvulationEstimate";
    v50 = [NSNumber numberWithInt:v80];
    v148 = v50;
    v125[23] = @"kaliSignal25PctDueToOPK";
    v49 = [NSNumber numberWithInt:v85];
    v149 = v49;
    v125[24] = @"kaliSignal75PctAtOvulationEstimate";
    v48 = [NSNumber numberWithInt:v82];
    v150 = v48;
    v125[25] = @"kaliSignal75PctDueToOPK";
    v47 = [NSNumber numberWithInt:v87];
    v151 = v47;
    v125[26] = @"kaliSignalMaxAtOvulationEstimate";
    v46 = [NSNumber numberWithInt:v84];
    v152 = v46;
    v125[27] = @"kaliSignalMaxDueToOPK";
    v45 = [NSNumber numberWithInt:v89];
    v153 = v45;
    v125[28] = @"kaliSignalMedianAtOvulationEstimate";
    v44 = [NSNumber numberWithInt:v81];
    v154 = v44;
    v125[29] = @"kaliSignalMedianDueToOPK";
    v43 = [NSNumber numberWithInt:v86];
    v155 = v43;
    v125[30] = @"kaliSignalMinAtOvulationEstimate";
    v42 = [NSNumber numberWithInt:v83];
    v156 = v42;
    v125[31] = @"kaliSignalMinDueToOPK";
    v41 = [NSNumber numberWithInt:v88];
    v157 = v41;
    v125[32] = @"ovulationConfirmationError25Pct";
    v40 = [NSNumber numberWithInt:v93];
    v158 = v40;
    v125[33] = @"ovulationConfirmationError75Pct";
    v39 = [NSNumber numberWithInt:v95];
    v159 = v39;
    v125[34] = @"ovulationConfirmationErrorMax";
    v38 = [NSNumber numberWithInt:v96];
    v160 = v38;
    v125[35] = @"ovulationConfirmationErrorMedian";
    v37 = [NSNumber numberWithInt:v94];
    v161 = v37;
    v125[36] = @"ovulationConfirmationErrorMin";
    v36 = [NSNumber numberWithInt:v92];
    v162 = v36;
    v125[37] = @"ovulationConfirmationFailureFactors";
    char v35 = [NSNumber numberWithInt:v120];
    v163 = v35;
    v125[38] = @"ovulationConfirmationFailureKaliAvailability";
    unsigned int v5 = [NSNumber numberWithInt:v115];
    v164 = v5;
    v125[39] = @"ovulationConfirmationFailureKaliNoise";
    objc_super v6 = [NSNumber numberWithInt:v116];
    v165 = v6;
    v125[40] = @"ovulationConfirmationFailureKaliSignal";
    int v7 = [NSNumber numberWithInt:v117];
    v166 = v7;
    v125[41] = @"ovulationConfirmationFailureKaliSNR";
    v8 = [NSNumber numberWithInt:v118];
    v167 = v8;
    v125[42] = @"ovulationConfirmationFailureOPK";
    id v9 = [NSNumber numberWithInt:v121];
    v168 = v9;
    v125[43] = @"ovulationConfirmationFailureShortCycles";
    v10 = [NSNumber numberWithInt:v119];
    v169 = v10;
    v125[44] = @"ovulationConfirmationNoFailure";
    v11 = [NSNumber numberWithInt:v122];
    v170 = v11;
    v125[45] = @"ovulationConfirmationNoFailureMT";
    v12 = [NSNumber numberWithInt:v123];
    v171 = v12;
    v125[46] = @"ratioCycleHasOPK";
    LODWORD(v13) = v77;
    v14 = [NSNumber numberWithFloat:v13];
    v172 = v14;
    v125[47] = @"ratioCycleWith1DayPeriod";
    LODWORD(v15) = v76;
    v16 = [NSNumber numberWithFloat:v15];
    v173 = v16;
    uint64_t v73 = [NSDictionary dictionaryWithObjects:&__p forKeys:v125 count:48];
  }
  else
  {
    v17 = ha_get_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MAIHistoricalAnalyzer analyze](v17);
    }

    uint64_t v73 = 0;
  }
  int v18 = [MEMORY[0x263EFF980] arrayWithCapacity:0x8E38E38E38E38E39 * (((char *)v75 - (char *)v74) >> 3)];
  v19 = v74;
  for (i = v75; v19 != i; v19 += 18)
  {
    double v21 = objc_opt_new();
    double v22 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*((void *)v19 + 5) - *((void *)v19 + 4)];
    float v23 = (unsigned __int8 *)*((void *)v19 + 4);
    long long v24 = (unsigned __int8 *)*((void *)v19 + 5);
    while (v23 != v24)
    {
      unsigned __int8 v25 = *v23;
      if (((*v23 - 1) & 0xF8) != 0) {
        unsigned __int8 v25 = 0;
      }
      char v26 = [NSNumber numberWithUnsignedChar:v25];
      [v22 addObject:v26];

      ++v23;
    }
    [v21 setPhases:v22];
    if (*((unsigned char *)v19 + 4))
    {
      int v27 = [NSNumber numberWithInt:*v19];
      [v21 setFertilityStartJulianDay:v27];
    }
    if (*((unsigned char *)v19 + 12))
    {
      char v28 = [NSNumber numberWithInt:v19[2]];
      [v21 setFertilityEndJulianDay:v28];
    }
    [v21 setJulianDayOfMenstruationStart:v19[4]];
    [v21 setJulianDayOfMenstruationEnd:v19[5]];
    [v21 setIsDeterminant:*((unsigned __int8 *)v19 + 24)];
    unsigned int v29 = v19[15];
    if (v29 >= 5)
    {
      char v30 = ha_get_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        LODWORD(__p) = 67109120;
        HIDWORD(__p) = v29;
        _os_log_fault_impl(&dword_22F10E000, v30, OS_LOG_TYPE_FAULT, "Unrecognized failureSrc %d: ", (uint8_t *)&__p, 8u);
      }

      LOBYTE(v29) = 0;
    }
    [v21 setOvulationConfirmationFailure:v29];
    [v21 setDailyEligibleWristTemperatureCount:(int)v19[16]];
    unsigned int v31 = v19[14];
    if (v31 >= 4) {
      unsigned __int8 v32 = 3;
    }
    else {
      unsigned __int8 v32 = 3 - v31;
    }
    [v21 setPredictionPrimarySource:v32];
    [v18 addObject:v21];
  }
  __p = &v74;
  std::vector<Nightingale::ngt_HistoricCycle>::__destroy_vector::operator()[abi:nn180100]((void ***)&__p);
  int v33 = v18;
  float v34 = (void *)v73;
  result.var1 = v34;
  result.var0 = v33;
  return result;
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
  std::unique_ptr<HealthAlgorithms::PhaseCondenser>::reset[abi:nn180100]((uint64_t *)&self->_phaseCondenser, 0);
  std::unique_ptr<Nightingale::ngt_HistoricalAnalyzer>::reset[abi:nn180100]((Nightingale::ngt_HistoricalAnalyzer **)&self->_historicalAnalyzer, 0);
}

- (void)appendDay:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22F10E000, log, OS_LOG_TYPE_FAULT, "days must be appended in order", v1, 2u);
}

- (void)analyze
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22F10E000, log, OS_LOG_TYPE_ERROR, "coreAnalyticsOut for historical analyzer has no value", v1, 2u);
}

@end