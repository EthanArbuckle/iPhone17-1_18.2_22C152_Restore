@interface NgtMenstrualAlgorithmsTelemetry
+ (BOOL)supportsSecureCoding;
- (NSNumber)age;
- (NSNumber)baselineMean;
- (NSNumber)baselineStdUncapped;
- (NSNumber)daysSinceLastContraceptionEnd;
- (NSNumber)daysSinceLastLactationEnd;
- (NSNumber)daysSinceLastPeriod;
- (NSNumber)daysSinceLastPregnancyEnd;
- (NSNumber)daysToModel0Drs;
- (NSNumber)daysToModel1Drs;
- (NSNumber)daysToModel2Drs;
- (NSNumber)ensembleSelectedModelIdx;
- (NSNumber)model0Width;
- (NSNumber)model1Width;
- (NSNumber)model2Width;
- (NSNumber)normalizedDaysSinceLastPeriod;
- (NSNumber)numHistoricalCycles;
- (NSNumber)numOutliers;
- (NSNumber)sliceDayHrCount;
- (NSNumber)sliceDayHrMean;
- (NSNumber)sliceDayHrStd;
- (NSNumber)sliceNightHrCount;
- (NSNumber)sliceNightHrMean;
- (NSNumber)sliceNightHrStd;
- (NgtMenstrualAlgorithmsTelemetry)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAge:(id)a3;
- (void)setBaselineMean:(id)a3;
- (void)setBaselineStdUncapped:(id)a3;
- (void)setDaysSinceLastContraceptionEnd:(id)a3;
- (void)setDaysSinceLastLactationEnd:(id)a3;
- (void)setDaysSinceLastPeriod:(id)a3;
- (void)setDaysSinceLastPregnancyEnd:(id)a3;
- (void)setDaysToModel0Drs:(id)a3;
- (void)setDaysToModel1Drs:(id)a3;
- (void)setDaysToModel2Drs:(id)a3;
- (void)setEnsembleSelectedModelIdx:(id)a3;
- (void)setModel0Width:(id)a3;
- (void)setModel1Width:(id)a3;
- (void)setModel2Width:(id)a3;
- (void)setNormalizedDaysSinceLastPeriod:(id)a3;
- (void)setNumHistoricalCycles:(id)a3;
- (void)setNumOutliers:(id)a3;
- (void)setSliceDayHrCount:(id)a3;
- (void)setSliceDayHrMean:(id)a3;
- (void)setSliceDayHrStd:(id)a3;
- (void)setSliceNightHrCount:(id)a3;
- (void)setSliceNightHrMean:(id)a3;
- (void)setSliceNightHrStd:(id)a3;
@end

@implementation NgtMenstrualAlgorithmsTelemetry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v50 = a3;
  numHistoricalCycles = self->_numHistoricalCycles;
  v5 = NSStringFromSelector(sel_numHistoricalCycles);
  [v50 encodeObject:numHistoricalCycles forKey:v5];

  baselineStdUncapped = self->_baselineStdUncapped;
  v7 = NSStringFromSelector(sel_baselineStdUncapped);
  [v50 encodeObject:baselineStdUncapped forKey:v7];

  baselineMean = self->_baselineMean;
  v9 = NSStringFromSelector(sel_baselineMean);
  [v50 encodeObject:baselineMean forKey:v9];

  model0Width = self->_model0Width;
  v11 = NSStringFromSelector(sel_model0Width);
  [v50 encodeObject:model0Width forKey:v11];

  daysToModel0Drs = self->_daysToModel0Drs;
  v13 = NSStringFromSelector(sel_daysToModel0Drs);
  [v50 encodeObject:daysToModel0Drs forKey:v13];

  model1Width = self->_model1Width;
  v15 = NSStringFromSelector(sel_model1Width);
  [v50 encodeObject:model1Width forKey:v15];

  daysToModel1Drs = self->_daysToModel1Drs;
  v17 = NSStringFromSelector(sel_daysToModel1Drs);
  [v50 encodeObject:daysToModel1Drs forKey:v17];

  model2Width = self->_model2Width;
  v19 = NSStringFromSelector(sel_model2Width);
  [v50 encodeObject:model2Width forKey:v19];

  daysToModel2Drs = self->_daysToModel2Drs;
  v21 = NSStringFromSelector(sel_daysToModel2Drs);
  [v50 encodeObject:daysToModel2Drs forKey:v21];

  age = self->_age;
  v23 = NSStringFromSelector("age");
  [v50 encodeObject:age forKey:v23];

  sliceDayHrMean = self->_sliceDayHrMean;
  v25 = NSStringFromSelector(sel_sliceDayHrMean);
  [v50 encodeObject:sliceDayHrMean forKey:v25];

  sliceDayHrStd = self->_sliceDayHrStd;
  v27 = NSStringFromSelector(sel_sliceDayHrStd);
  [v50 encodeObject:sliceDayHrStd forKey:v27];

  sliceDayHrCount = self->_sliceDayHrCount;
  v29 = NSStringFromSelector(sel_sliceDayHrCount);
  [v50 encodeObject:sliceDayHrCount forKey:v29];

  sliceNightHrMean = self->_sliceNightHrMean;
  v31 = NSStringFromSelector(sel_sliceNightHrMean);
  [v50 encodeObject:sliceNightHrMean forKey:v31];

  sliceNightHrStd = self->_sliceNightHrStd;
  v33 = NSStringFromSelector(sel_sliceNightHrStd);
  [v50 encodeObject:sliceNightHrStd forKey:v33];

  sliceNightHrCount = self->_sliceNightHrCount;
  v35 = NSStringFromSelector(sel_sliceNightHrCount);
  [v50 encodeObject:sliceNightHrCount forKey:v35];

  daysSinceLastPeriod = self->_daysSinceLastPeriod;
  v37 = NSStringFromSelector(sel_daysSinceLastPeriod);
  [v50 encodeObject:daysSinceLastPeriod forKey:v37];

  normalizedDaysSinceLastPeriod = self->_normalizedDaysSinceLastPeriod;
  v39 = NSStringFromSelector(sel_normalizedDaysSinceLastPeriod);
  [v50 encodeObject:normalizedDaysSinceLastPeriod forKey:v39];

  daysSinceLastContraceptionEnd = self->_daysSinceLastContraceptionEnd;
  v41 = NSStringFromSelector(sel_daysSinceLastContraceptionEnd);
  [v50 encodeObject:daysSinceLastContraceptionEnd forKey:v41];

  daysSinceLastPregnancyEnd = self->_daysSinceLastPregnancyEnd;
  v43 = NSStringFromSelector(sel_daysSinceLastPregnancyEnd);
  [v50 encodeObject:daysSinceLastPregnancyEnd forKey:v43];

  daysSinceLastLactationEnd = self->_daysSinceLastLactationEnd;
  v45 = NSStringFromSelector(sel_daysSinceLastLactationEnd);
  [v50 encodeObject:daysSinceLastLactationEnd forKey:v45];

  numOutliers = self->_numOutliers;
  v47 = NSStringFromSelector(sel_numOutliers);
  [v50 encodeObject:numOutliers forKey:v47];

  ensembleSelectedModelIdx = self->_ensembleSelectedModelIdx;
  v49 = NSStringFromSelector(sel_ensembleSelectedModelIdx);
  [v50 encodeObject:ensembleSelectedModelIdx forKey:v49];
}

- (NgtMenstrualAlgorithmsTelemetry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NgtMenstrualAlgorithmsTelemetry *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_numHistoricalCycles);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    numHistoricalCycles = v5->_numHistoricalCycles;
    v5->_numHistoricalCycles = (NSNumber *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_baselineStdUncapped);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    baselineStdUncapped = v5->_baselineStdUncapped;
    v5->_baselineStdUncapped = (NSNumber *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_baselineMean);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    baselineMean = v5->_baselineMean;
    v5->_baselineMean = (NSNumber *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_model0Width);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    model0Width = v5->_model0Width;
    v5->_model0Width = (NSNumber *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_daysToModel0Drs);
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    daysToModel0Drs = v5->_daysToModel0Drs;
    v5->_daysToModel0Drs = (NSNumber *)v24;

    uint64_t v26 = objc_opt_class();
    v27 = NSStringFromSelector(sel_model1Width);
    uint64_t v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
    model1Width = v5->_model1Width;
    v5->_model1Width = (NSNumber *)v28;

    uint64_t v30 = objc_opt_class();
    v31 = NSStringFromSelector(sel_daysToModel1Drs);
    uint64_t v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    daysToModel1Drs = v5->_daysToModel1Drs;
    v5->_daysToModel1Drs = (NSNumber *)v32;

    uint64_t v34 = objc_opt_class();
    v35 = NSStringFromSelector(sel_model2Width);
    uint64_t v36 = [v4 decodeObjectOfClass:v34 forKey:v35];
    model2Width = v5->_model2Width;
    v5->_model2Width = (NSNumber *)v36;

    uint64_t v38 = objc_opt_class();
    v39 = NSStringFromSelector(sel_daysToModel2Drs);
    uint64_t v40 = [v4 decodeObjectOfClass:v38 forKey:v39];
    daysToModel2Drs = v5->_daysToModel2Drs;
    v5->_daysToModel2Drs = (NSNumber *)v40;

    uint64_t v42 = objc_opt_class();
    v43 = NSStringFromSelector("age");
    uint64_t v44 = [v4 decodeObjectOfClass:v42 forKey:v43];
    age = v5->_age;
    v5->_age = (NSNumber *)v44;

    uint64_t v46 = objc_opt_class();
    v47 = NSStringFromSelector(sel_sliceDayHrMean);
    uint64_t v48 = [v4 decodeObjectOfClass:v46 forKey:v47];
    sliceDayHrMean = v5->_sliceDayHrMean;
    v5->_sliceDayHrMean = (NSNumber *)v48;

    uint64_t v50 = objc_opt_class();
    v51 = NSStringFromSelector(sel_sliceDayHrStd);
    uint64_t v52 = [v4 decodeObjectOfClass:v50 forKey:v51];
    sliceDayHrStd = v5->_sliceDayHrStd;
    v5->_sliceDayHrStd = (NSNumber *)v52;

    uint64_t v54 = objc_opt_class();
    v55 = NSStringFromSelector(sel_sliceDayHrCount);
    uint64_t v56 = [v4 decodeObjectOfClass:v54 forKey:v55];
    sliceDayHrCount = v5->_sliceDayHrCount;
    v5->_sliceDayHrCount = (NSNumber *)v56;

    uint64_t v58 = objc_opt_class();
    v59 = NSStringFromSelector(sel_sliceNightHrMean);
    uint64_t v60 = [v4 decodeObjectOfClass:v58 forKey:v59];
    sliceNightHrMean = v5->_sliceNightHrMean;
    v5->_sliceNightHrMean = (NSNumber *)v60;

    uint64_t v62 = objc_opt_class();
    v63 = NSStringFromSelector(sel_sliceNightHrStd);
    uint64_t v64 = [v4 decodeObjectOfClass:v62 forKey:v63];
    sliceNightHrStd = v5->_sliceNightHrStd;
    v5->_sliceNightHrStd = (NSNumber *)v64;

    uint64_t v66 = objc_opt_class();
    v67 = NSStringFromSelector(sel_sliceNightHrCount);
    uint64_t v68 = [v4 decodeObjectOfClass:v66 forKey:v67];
    sliceNightHrCount = v5->_sliceNightHrCount;
    v5->_sliceNightHrCount = (NSNumber *)v68;

    uint64_t v70 = objc_opt_class();
    v71 = NSStringFromSelector(sel_daysSinceLastPeriod);
    uint64_t v72 = [v4 decodeObjectOfClass:v70 forKey:v71];
    daysSinceLastPeriod = v5->_daysSinceLastPeriod;
    v5->_daysSinceLastPeriod = (NSNumber *)v72;

    uint64_t v74 = objc_opt_class();
    v75 = NSStringFromSelector(sel_normalizedDaysSinceLastPeriod);
    uint64_t v76 = [v4 decodeObjectOfClass:v74 forKey:v75];
    normalizedDaysSinceLastPeriod = v5->_normalizedDaysSinceLastPeriod;
    v5->_normalizedDaysSinceLastPeriod = (NSNumber *)v76;

    uint64_t v78 = objc_opt_class();
    v79 = NSStringFromSelector(sel_daysSinceLastContraceptionEnd);
    uint64_t v80 = [v4 decodeObjectOfClass:v78 forKey:v79];
    daysSinceLastContraceptionEnd = v5->_daysSinceLastContraceptionEnd;
    v5->_daysSinceLastContraceptionEnd = (NSNumber *)v80;

    uint64_t v82 = objc_opt_class();
    v83 = NSStringFromSelector(sel_daysSinceLastPregnancyEnd);
    uint64_t v84 = [v4 decodeObjectOfClass:v82 forKey:v83];
    daysSinceLastPregnancyEnd = v5->_daysSinceLastPregnancyEnd;
    v5->_daysSinceLastPregnancyEnd = (NSNumber *)v84;

    uint64_t v86 = objc_opt_class();
    v87 = NSStringFromSelector(sel_daysSinceLastLactationEnd);
    uint64_t v88 = [v4 decodeObjectOfClass:v86 forKey:v87];
    daysSinceLastLactationEnd = v5->_daysSinceLastLactationEnd;
    v5->_daysSinceLastLactationEnd = (NSNumber *)v88;

    uint64_t v90 = objc_opt_class();
    v91 = NSStringFromSelector(sel_numOutliers);
    uint64_t v92 = [v4 decodeObjectOfClass:v90 forKey:v91];
    numOutliers = v5->_numOutliers;
    v5->_numOutliers = (NSNumber *)v92;

    uint64_t v94 = objc_opt_class();
    v95 = NSStringFromSelector(sel_ensembleSelectedModelIdx);
    uint64_t v96 = [v4 decodeObjectOfClass:v94 forKey:v95];
    ensembleSelectedModelIdx = v5->_ensembleSelectedModelIdx;
    v5->_ensembleSelectedModelIdx = (NSNumber *)v96;

    v98 = v5;
  }

  return v5;
}

- (NSNumber)numHistoricalCycles
{
  return self->_numHistoricalCycles;
}

- (void)setNumHistoricalCycles:(id)a3
{
}

- (NSNumber)baselineStdUncapped
{
  return self->_baselineStdUncapped;
}

- (void)setBaselineStdUncapped:(id)a3
{
}

- (NSNumber)baselineMean
{
  return self->_baselineMean;
}

- (void)setBaselineMean:(id)a3
{
}

- (NSNumber)model0Width
{
  return self->_model0Width;
}

- (void)setModel0Width:(id)a3
{
}

- (NSNumber)daysToModel0Drs
{
  return self->_daysToModel0Drs;
}

- (void)setDaysToModel0Drs:(id)a3
{
}

- (NSNumber)model1Width
{
  return self->_model1Width;
}

- (void)setModel1Width:(id)a3
{
}

- (NSNumber)daysToModel1Drs
{
  return self->_daysToModel1Drs;
}

- (void)setDaysToModel1Drs:(id)a3
{
}

- (NSNumber)model2Width
{
  return self->_model2Width;
}

- (void)setModel2Width:(id)a3
{
}

- (NSNumber)daysToModel2Drs
{
  return self->_daysToModel2Drs;
}

- (void)setDaysToModel2Drs:(id)a3
{
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
}

- (NSNumber)sliceDayHrMean
{
  return self->_sliceDayHrMean;
}

- (void)setSliceDayHrMean:(id)a3
{
}

- (NSNumber)sliceDayHrStd
{
  return self->_sliceDayHrStd;
}

- (void)setSliceDayHrStd:(id)a3
{
}

- (NSNumber)sliceDayHrCount
{
  return self->_sliceDayHrCount;
}

- (void)setSliceDayHrCount:(id)a3
{
}

- (NSNumber)sliceNightHrMean
{
  return self->_sliceNightHrMean;
}

- (void)setSliceNightHrMean:(id)a3
{
}

- (NSNumber)sliceNightHrStd
{
  return self->_sliceNightHrStd;
}

- (void)setSliceNightHrStd:(id)a3
{
}

- (NSNumber)sliceNightHrCount
{
  return self->_sliceNightHrCount;
}

- (void)setSliceNightHrCount:(id)a3
{
}

- (NSNumber)daysSinceLastPeriod
{
  return self->_daysSinceLastPeriod;
}

- (void)setDaysSinceLastPeriod:(id)a3
{
}

- (NSNumber)normalizedDaysSinceLastPeriod
{
  return self->_normalizedDaysSinceLastPeriod;
}

- (void)setNormalizedDaysSinceLastPeriod:(id)a3
{
}

- (NSNumber)daysSinceLastContraceptionEnd
{
  return self->_daysSinceLastContraceptionEnd;
}

- (void)setDaysSinceLastContraceptionEnd:(id)a3
{
}

- (NSNumber)daysSinceLastPregnancyEnd
{
  return self->_daysSinceLastPregnancyEnd;
}

- (void)setDaysSinceLastPregnancyEnd:(id)a3
{
}

- (NSNumber)daysSinceLastLactationEnd
{
  return self->_daysSinceLastLactationEnd;
}

- (void)setDaysSinceLastLactationEnd:(id)a3
{
}

- (NSNumber)numOutliers
{
  return self->_numOutliers;
}

- (void)setNumOutliers:(id)a3
{
}

- (NSNumber)ensembleSelectedModelIdx
{
  return self->_ensembleSelectedModelIdx;
}

- (void)setEnsembleSelectedModelIdx:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ensembleSelectedModelIdx, 0);
  objc_storeStrong((id *)&self->_numOutliers, 0);
  objc_storeStrong((id *)&self->_daysSinceLastLactationEnd, 0);
  objc_storeStrong((id *)&self->_daysSinceLastPregnancyEnd, 0);
  objc_storeStrong((id *)&self->_daysSinceLastContraceptionEnd, 0);
  objc_storeStrong((id *)&self->_normalizedDaysSinceLastPeriod, 0);
  objc_storeStrong((id *)&self->_daysSinceLastPeriod, 0);
  objc_storeStrong((id *)&self->_sliceNightHrCount, 0);
  objc_storeStrong((id *)&self->_sliceNightHrStd, 0);
  objc_storeStrong((id *)&self->_sliceNightHrMean, 0);
  objc_storeStrong((id *)&self->_sliceDayHrCount, 0);
  objc_storeStrong((id *)&self->_sliceDayHrStd, 0);
  objc_storeStrong((id *)&self->_sliceDayHrMean, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_daysToModel2Drs, 0);
  objc_storeStrong((id *)&self->_model2Width, 0);
  objc_storeStrong((id *)&self->_daysToModel1Drs, 0);
  objc_storeStrong((id *)&self->_model1Width, 0);
  objc_storeStrong((id *)&self->_daysToModel0Drs, 0);
  objc_storeStrong((id *)&self->_model0Width, 0);
  objc_storeStrong((id *)&self->_baselineMean, 0);
  objc_storeStrong((id *)&self->_baselineStdUncapped, 0);
  objc_storeStrong((id *)&self->_numHistoricalCycles, 0);
}

@end