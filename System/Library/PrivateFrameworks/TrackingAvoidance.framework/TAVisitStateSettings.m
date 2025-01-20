@interface TAVisitStateSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSet)sensitiveLOITypes;
- (TAVisitStateSettings)initWithCoder:(id)a3;
- (TAVisitStateSettings)initWithDefaults;
- (TAVisitStateSettings)initWithVisitSnapshotCapacity:(unint64_t)a3 visitDisplayBufferCapacity:(unint64_t)a4 interVisitMetricSnapshotCapacity:(unint64_t)a5 interVisitSnapshotUpdateInterval:(double)a6 thresholdOfLocationRelevance:(double)a7 snapshotBufferTimeIntervalOfRetention:(double)a8 loiBufferPerTypeCapacity:(unint64_t)a9 loiBufferTimeIntervalOfRetention:(double)a10 maxNSigmaBetweenLastLocationAndVisit:(unint64_t)a11 qualitySnapshotDwellDuration:(double)a12 qualitySnapshotDisplayOnDuration:(double)a13 uniqueUTObservationCapPerVisit:(unint64_t)a14 sensitiveLOITypes:(id)a15;
- (TAVisitStateSettings)initWithVisitSnapshotCapacityOrDefault:(id)a3 visitDisplayBufferCapacityOrDefault:(id)a4 interVisitMetricSnapshotCapacityOrDefault:(id)a5 interVisitSnapshotUpdateIntervalOrDefault:(id)a6 thresholdOfLocationRelevanceOrDefault:(id)a7 snapshotBufferTimeIntervalOfRetentionOrDefault:(id)a8 loiBufferPerTypeCapacityOrDefault:(id)a9 loiBufferTimeIntervalOfRetentionOrDefault:(id)a10 maxNSigmaBetweenLastLocationAndVisitOrDefault:(id)a11 qualitySnapshotDwellDurationOrDefault:(id)a12 qualitySnapshotDisplayOnDurationOrDefault:(id)a13 uniqueUTObservationCapPerVisitOrDefault:(id)a14 sensitiveLOITypesOrDefault:(id)a15;
- (double)interVisitSnapshotUpdateInterval;
- (double)loiBufferTimeIntervalOfRetention;
- (double)qualitySnapshotDisplayOnDuration;
- (double)qualitySnapshotDwellDuration;
- (double)snapshotBufferTimeIntervalOfRetention;
- (double)thresholdOfLocationRelevance;
- (unint64_t)interVisitMetricSnapshotCapacity;
- (unint64_t)loiBufferPerTypeCapacity;
- (unint64_t)maxNSigmaBetweenLastLocationAndVisit;
- (unint64_t)uniqueUTObservationCapPerVisit;
- (unint64_t)visitDisplayBufferCapacity;
- (unint64_t)visitSnapshotCapacity;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TAVisitStateSettings

- (double)interVisitSnapshotUpdateInterval
{
  return self->_interVisitSnapshotUpdateInterval;
}

- (NSSet)sensitiveLOITypes
{
  return self->_sensitiveLOITypes;
}

- (double)thresholdOfLocationRelevance
{
  return self->_thresholdOfLocationRelevance;
}

- (TAVisitStateSettings)initWithVisitSnapshotCapacity:(unint64_t)a3 visitDisplayBufferCapacity:(unint64_t)a4 interVisitMetricSnapshotCapacity:(unint64_t)a5 interVisitSnapshotUpdateInterval:(double)a6 thresholdOfLocationRelevance:(double)a7 snapshotBufferTimeIntervalOfRetention:(double)a8 loiBufferPerTypeCapacity:(unint64_t)a9 loiBufferTimeIntervalOfRetention:(double)a10 maxNSigmaBetweenLastLocationAndVisit:(unint64_t)a11 qualitySnapshotDwellDuration:(double)a12 qualitySnapshotDisplayOnDuration:(double)a13 uniqueUTObservationCapPerVisit:(unint64_t)a14 sensitiveLOITypes:(id)a15
{
  id v28 = a15;
  v32.receiver = self;
  v32.super_class = (Class)TAVisitStateSettings;
  v29 = [(TAVisitStateSettings *)&v32 init];
  v30 = v29;
  if (v29)
  {
    v29->_visitSnapshotCapacity = a3;
    v29->_visitDisplayBufferCapacity = a4;
    v29->_interVisitMetricSnapshotCapacity = a5;
    v29->_thresholdOfLocationRelevance = a7;
    v29->_interVisitSnapshotUpdateInterval = a6;
    v29->_snapshotBufferTimeIntervalOfRetention = a8;
    v29->_loiBufferPerTypeCapacity = a9;
    v29->_loiBufferTimeIntervalOfRetention = a10;
    v29->_maxNSigmaBetweenLastLocationAndVisit = a11;
    v29->_qualitySnapshotDwellDuration = a12;
    v29->_qualitySnapshotDisplayOnDuration = a13;
    v29->_uniqueUTObservationCapPerVisit = a14;
    objc_storeStrong((id *)&v29->_sensitiveLOITypes, a15);
  }

  return v30;
}

- (TAVisitStateSettings)initWithVisitSnapshotCapacityOrDefault:(id)a3 visitDisplayBufferCapacityOrDefault:(id)a4 interVisitMetricSnapshotCapacityOrDefault:(id)a5 interVisitSnapshotUpdateIntervalOrDefault:(id)a6 thresholdOfLocationRelevanceOrDefault:(id)a7 snapshotBufferTimeIntervalOfRetentionOrDefault:(id)a8 loiBufferPerTypeCapacityOrDefault:(id)a9 loiBufferTimeIntervalOfRetentionOrDefault:(id)a10 maxNSigmaBetweenLastLocationAndVisitOrDefault:(id)a11 qualitySnapshotDwellDurationOrDefault:(id)a12 qualitySnapshotDisplayOnDurationOrDefault:(id)a13 uniqueUTObservationCapPerVisitOrDefault:(id)a14 sensitiveLOITypesOrDefault:(id)a15
{
  id v20 = a3;
  id v58 = a4;
  id v21 = a5;
  id v63 = a6;
  id v22 = a7;
  id v62 = a8;
  id v23 = a9;
  id v61 = a10;
  id v60 = a11;
  id v24 = a12;
  id v25 = a13;
  id v59 = a14;
  id v26 = a15;
  if (v20) {
    uint64_t v55 = [v20 unsignedIntegerValue];
  }
  else {
    uint64_t v55 = 288;
  }
  v27 = v58;
  if (v58)
  {
    uint64_t v54 = [v58 unsignedIntegerValue];
    if (v21)
    {
LABEL_6:
      uint64_t v53 = [v21 unsignedIntegerValue];
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v54 = 200;
    if (v21) {
      goto LABEL_6;
    }
  }
  uint64_t v53 = 288;
LABEL_9:
  if (v63)
  {
    [v63 doubleValue];
    double v29 = v28;
    if (v22)
    {
LABEL_11:
      [v22 doubleValue];
      double v31 = v30;
      goto LABEL_14;
    }
  }
  else
  {
    double v29 = 900.0;
    if (v22) {
      goto LABEL_11;
    }
  }
  v52 = [[TAFilterGeneralSettings alloc] initWithDefaults];
  [(TAFilterGeneralSettings *)v52 thresholdOfLocationRelevance];
  double v31 = v32;
LABEL_14:
  if (v62)
  {
    [v62 doubleValue];
    double v34 = v33;
  }
  else
  {
    double v34 = 86400.0;
  }
  v57 = v21;
  if (v23) {
    uint64_t v35 = [v23 unsignedIntegerValue];
  }
  else {
    uint64_t v35 = 3;
  }
  if (v61)
  {
    [v61 doubleValue];
    double v37 = v36;
  }
  else
  {
    double v37 = 86400.0;
  }
  if (v60)
  {
    uint64_t v38 = [v60 unsignedIntValue];
    if (v24)
    {
LABEL_25:
      [v24 doubleValue];
      double v40 = v39;
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v38 = 2;
    if (v24) {
      goto LABEL_25;
    }
  }
  double v40 = 600.0;
LABEL_28:
  v41 = v25;
  if (v25)
  {
    v42 = v24;
    v43 = v41;
    [v41 doubleValue];
    double v45 = v44;
  }
  else
  {
    v43 = 0;
    v42 = v24;
    double v45 = 120.0;
  }
  v46 = v23;
  if (v59)
  {
    uint64_t v47 = [v59 unsignedIntegerValue];
    if (v26) {
      goto LABEL_33;
    }
LABEL_37:
    +[TAFilterVisitsSettings defaultVisitsSensitiveLOITypes];
    v51 = id v50 = v20;
    v48 = [(TAVisitStateSettings *)self initWithVisitSnapshotCapacity:v55 visitDisplayBufferCapacity:v54 interVisitMetricSnapshotCapacity:v53 interVisitSnapshotUpdateInterval:v35 thresholdOfLocationRelevance:v38 snapshotBufferTimeIntervalOfRetention:v47 loiBufferPerTypeCapacity:v29 loiBufferTimeIntervalOfRetention:v31 maxNSigmaBetweenLastLocationAndVisit:v34 qualitySnapshotDwellDuration:v37 qualitySnapshotDisplayOnDuration:v40 uniqueUTObservationCapPerVisit:v45 sensitiveLOITypes:v51];

    id v20 = v50;
    v27 = v58;
    if (v22) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  uint64_t v47 = 200;
  if (!v26) {
    goto LABEL_37;
  }
LABEL_33:
  v48 = [(TAVisitStateSettings *)self initWithVisitSnapshotCapacity:v55 visitDisplayBufferCapacity:v54 interVisitMetricSnapshotCapacity:v53 interVisitSnapshotUpdateInterval:v35 thresholdOfLocationRelevance:v38 snapshotBufferTimeIntervalOfRetention:v47 loiBufferPerTypeCapacity:v29 loiBufferTimeIntervalOfRetention:v31 maxNSigmaBetweenLastLocationAndVisit:v34 qualitySnapshotDwellDuration:v37 qualitySnapshotDisplayOnDuration:v40 uniqueUTObservationCapPerVisit:v45 sensitiveLOITypes:v26];
  if (!v22) {
LABEL_34:
  }

LABEL_35:
  return v48;
}

- (TAVisitStateSettings)initWithDefaults
{
  v3 = [[TAFilterGeneralSettings alloc] initWithDefaults];
  [(TAFilterGeneralSettings *)v3 thresholdOfLocationRelevance];
  double v5 = v4;
  v6 = +[TAFilterVisitsSettings defaultVisitsSensitiveLOITypes];
  v7 = [(TAVisitStateSettings *)self initWithVisitSnapshotCapacity:288 visitDisplayBufferCapacity:200 interVisitMetricSnapshotCapacity:288 interVisitSnapshotUpdateInterval:3 thresholdOfLocationRelevance:2 snapshotBufferTimeIntervalOfRetention:200 loiBufferPerTypeCapacity:900.0 loiBufferTimeIntervalOfRetention:v5 maxNSigmaBetweenLastLocationAndVisit:86400.0 qualitySnapshotDwellDuration:86400.0 qualitySnapshotDisplayOnDuration:600.0 uniqueUTObservationCapPerVisit:120.0 sensitiveLOITypes:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (TAVisitStateSettings *)a3;
  if (self == v4)
  {
    char v33 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      unint64_t v6 = [(TAVisitStateSettings *)self visitSnapshotCapacity];
      if (v6 != [(TAVisitStateSettings *)v5 visitSnapshotCapacity]) {
        goto LABEL_18;
      }
      unint64_t v7 = [(TAVisitStateSettings *)self visitDisplayBufferCapacity];
      if (v7 != [(TAVisitStateSettings *)v5 visitDisplayBufferCapacity]) {
        goto LABEL_18;
      }
      unint64_t v8 = [(TAVisitStateSettings *)self interVisitMetricSnapshotCapacity];
      if (v8 != [(TAVisitStateSettings *)v5 interVisitMetricSnapshotCapacity]) {
        goto LABEL_18;
      }
      [(TAVisitStateSettings *)self interVisitSnapshotUpdateInterval];
      double v10 = v9;
      [(TAVisitStateSettings *)v5 interVisitSnapshotUpdateInterval];
      if (v10 != v11) {
        goto LABEL_18;
      }
      [(TAVisitStateSettings *)self thresholdOfLocationRelevance];
      double v13 = v12;
      [(TAVisitStateSettings *)v5 thresholdOfLocationRelevance];
      if (v13 != v14) {
        goto LABEL_18;
      }
      [(TAVisitStateSettings *)self snapshotBufferTimeIntervalOfRetention];
      double v16 = v15;
      [(TAVisitStateSettings *)v5 snapshotBufferTimeIntervalOfRetention];
      if (v16 != v17) {
        goto LABEL_18;
      }
      unint64_t v18 = [(TAVisitStateSettings *)self loiBufferPerTypeCapacity];
      if (v18 != [(TAVisitStateSettings *)v5 loiBufferPerTypeCapacity]) {
        goto LABEL_18;
      }
      [(TAVisitStateSettings *)self loiBufferTimeIntervalOfRetention];
      double v20 = v19;
      [(TAVisitStateSettings *)v5 loiBufferTimeIntervalOfRetention];
      if (v20 != v21) {
        goto LABEL_18;
      }
      unint64_t v22 = [(TAVisitStateSettings *)self maxNSigmaBetweenLastLocationAndVisit];
      if (v22 == [(TAVisitStateSettings *)v5 maxNSigmaBetweenLastLocationAndVisit]&& ([(TAVisitStateSettings *)self qualitySnapshotDwellDuration], double v24 = v23, [(TAVisitStateSettings *)v5 qualitySnapshotDwellDuration], v24 == v25)&& ([(TAVisitStateSettings *)self qualitySnapshotDisplayOnDuration], v27 = v26, [(TAVisitStateSettings *)v5 qualitySnapshotDisplayOnDuration], v27 == v28))
      {
        double v29 = [(TAVisitStateSettings *)self sensitiveLOITypes];
        double v30 = [(TAVisitStateSettings *)v5 sensitiveLOITypes];
        if (v29 == v30)
        {
          char v33 = 1;
        }
        else
        {
          double v31 = [(TAVisitStateSettings *)self sensitiveLOITypes];
          double v32 = [(TAVisitStateSettings *)v5 sensitiveLOITypes];
          char v33 = [v31 isEqual:v32];
        }
      }
      else
      {
LABEL_18:
        char v33 = 0;
      }
    }
    else
    {
      char v33 = 0;
    }
  }

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAVisitStateSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"VisitCap"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"VisitDisplayCap"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"InterCap"];
  [v4 decodeDoubleForKey:@"InterUpdateInterval"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"ThresLocRel"];
  double v11 = v10;
  [v4 decodeDoubleForKey:@"SnapshotRetention"];
  double v13 = v12;
  uint64_t v14 = [v4 decodeIntegerForKey:@"LOICap"];
  [v4 decodeDoubleForKey:@"LOIRetention"];
  double v16 = v15;
  uint64_t v17 = [v4 decodeIntegerForKey:@"MaxNSigma"];
  [v4 decodeDoubleForKey:@"MinDwell"];
  double v19 = v18;
  [v4 decodeDoubleForKey:@"MinDisplay"];
  double v21 = v20;
  uint64_t v22 = [v4 decodeIntegerForKey:@"PerVisitCacheCap"];
  double v23 = (void *)MEMORY[0x263EFFA08];
  uint64_t v24 = objc_opt_class();
  double v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  double v26 = [v4 decodeObjectOfClasses:v25 forKey:@"SensitiveLOITypes"];

  double v27 = [(TAVisitStateSettings *)self initWithVisitSnapshotCapacity:v5 visitDisplayBufferCapacity:v6 interVisitMetricSnapshotCapacity:v7 interVisitSnapshotUpdateInterval:v14 thresholdOfLocationRelevance:v17 snapshotBufferTimeIntervalOfRetention:v22 loiBufferPerTypeCapacity:v9 loiBufferTimeIntervalOfRetention:v11 maxNSigmaBetweenLastLocationAndVisit:v13 qualitySnapshotDwellDuration:v16 qualitySnapshotDisplayOnDuration:v19 uniqueUTObservationCapPerVisit:v21 sensitiveLOITypes:v26];
  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t visitSnapshotCapacity = self->_visitSnapshotCapacity;
  id v5 = a3;
  [v5 encodeInteger:visitSnapshotCapacity forKey:@"VisitCap"];
  [v5 encodeInteger:self->_visitDisplayBufferCapacity forKey:@"VisitDisplayCap"];
  [v5 encodeInteger:self->_interVisitMetricSnapshotCapacity forKey:@"InterCap"];
  [v5 encodeDouble:@"InterUpdateInterval" forKey:self->_interVisitSnapshotUpdateInterval];
  [v5 encodeDouble:@"ThresLocRel" forKey:self->_thresholdOfLocationRelevance];
  [v5 encodeDouble:@"SnapshotRetention" forKey:self->_snapshotBufferTimeIntervalOfRetention];
  [v5 encodeInteger:self->_loiBufferPerTypeCapacity forKey:@"LOICap"];
  [v5 encodeDouble:@"LOIRetention" forKey:self->_loiBufferTimeIntervalOfRetention];
  [v5 encodeInteger:self->_maxNSigmaBetweenLastLocationAndVisit forKey:@"MaxNSigma"];
  [v5 encodeDouble:@"MinDwell" forKey:self->_qualitySnapshotDwellDuration];
  [v5 encodeDouble:@"MinDisplay" forKey:self->_qualitySnapshotDisplayOnDuration];
  [v5 encodeInteger:self->_uniqueUTObservationCapPerVisit forKey:@"PerVisitCacheCap"];
  [v5 encodeObject:self->_sensitiveLOITypes forKey:@"SensitiveLOITypes"];
}

- (unint64_t)visitSnapshotCapacity
{
  return self->_visitSnapshotCapacity;
}

- (unint64_t)visitDisplayBufferCapacity
{
  return self->_visitDisplayBufferCapacity;
}

- (unint64_t)interVisitMetricSnapshotCapacity
{
  return self->_interVisitMetricSnapshotCapacity;
}

- (double)snapshotBufferTimeIntervalOfRetention
{
  return self->_snapshotBufferTimeIntervalOfRetention;
}

- (unint64_t)loiBufferPerTypeCapacity
{
  return self->_loiBufferPerTypeCapacity;
}

- (double)loiBufferTimeIntervalOfRetention
{
  return self->_loiBufferTimeIntervalOfRetention;
}

- (unint64_t)maxNSigmaBetweenLastLocationAndVisit
{
  return self->_maxNSigmaBetweenLastLocationAndVisit;
}

- (double)qualitySnapshotDwellDuration
{
  return self->_qualitySnapshotDwellDuration;
}

- (double)qualitySnapshotDisplayOnDuration
{
  return self->_qualitySnapshotDisplayOnDuration;
}

- (unint64_t)uniqueUTObservationCapPerVisit
{
  return self->_uniqueUTObservationCapPerVisit;
}

- (void).cxx_destruct
{
}

@end