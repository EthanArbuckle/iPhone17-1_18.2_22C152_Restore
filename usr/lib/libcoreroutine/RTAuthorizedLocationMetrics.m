@interface RTAuthorizedLocationMetrics
- (BOOL)locationServicesEnabled;
- (BOOL)routineEnabled;
- (NSDate)daemonStartDate;
- (NSDate)lastQueryMetricSubmissionDate;
- (RTAuthorizedLocationCurationMetrics)curationMetrics;
- (RTAuthorizedLocationDatabaseInitializationMetrics)initializationMetrics;
- (RTAuthorizedLocationMetrics)initWithDaemonStartDate:(id)a3;
- (RTAuthorizedLocationQueryMetrics)queryMetrics;
- (double)timeSinceDaemonStart;
- (double)timeSinceLastQueryMetricsSubmission;
- (id)convertToDictionary;
- (void)setCurationMetrics:(id)a3;
- (void)setInitializationMetrics:(id)a3;
- (void)setLastQueryMetricSubmissionDate:(id)a3;
- (void)setLocationServicesEnabled:(BOOL)a3;
- (void)setQueryMetrics:(id)a3;
- (void)setRoutineEnabled:(BOOL)a3;
- (void)submitToCoreAnalytics;
@end

@implementation RTAuthorizedLocationMetrics

- (RTAuthorizedLocationMetrics)initWithDaemonStartDate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[RTAuthorizedLocationMetrics initWithDaemonStartDate:]";
      __int16 v18 = 1024;
      int v19 = 130;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: daemonStartDate (in %s:%d)", buf, 0x12u);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)RTAuthorizedLocationMetrics;
  v7 = [(RTAuthorizedLocationMetrics *)&v15 init];
  v8 = v7;
  if (v7)
  {
    curationMetrics = v7->_curationMetrics;
    v7->_curationMetrics = 0;

    queryMetrics = v8->_queryMetrics;
    v8->_queryMetrics = 0;

    initializationMetrics = v8->_initializationMetrics;
    v8->_initializationMetrics = 0;

    *(_WORD *)&v8->_locationServicesEnabled = 0;
    objc_storeStrong((id *)&v8->_daemonStartDate, a3);
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
    lastQueryMetricSubmissionDate = v8->_lastQueryMetricSubmissionDate;
    v8->_lastQueryMetricSubmissionDate = (NSDate *)v12;
  }
  return v8;
}

- (double)timeSinceLastQueryMetricsSubmission
{
  v3 = [MEMORY[0x1E4F1C9C8] now];
  [v3 timeIntervalSinceDate:self->_lastQueryMetricSubmissionDate];
  double v5 = v4;

  return v5;
}

- (double)timeSinceDaemonStart
{
  v3 = [MEMORY[0x1E4F1C9C8] now];
  [v3 timeIntervalSinceDate:self->_daemonStartDate];
  double v5 = v4;

  return v5;
}

- (id)convertToDictionary
{
  v61[32] = *MEMORY[0x1E4F143B8];
  v3 = self->_curationMetrics;
  double v4 = self->_queryMetrics;
  double v5 = self->_initializationMetrics;
  v6 = v5;
  if (v3)
  {
    if (v5) {
      goto LABEL_3;
    }
LABEL_10:
    v6 = objc_alloc_init(RTAuthorizedLocationDatabaseInitializationMetrics);
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  v3 = objc_alloc_init(RTAuthorizedLocationCurationMetrics);
  if (!v6) {
    goto LABEL_10;
  }
LABEL_3:
  if (v4) {
    goto LABEL_4;
  }
LABEL_11:
  double v4 = objc_alloc_init(RTAuthorizedLocationQueryMetrics);
LABEL_4:
  [(RTAuthorizedLocationQueryMetrics *)v4 userTimeOffsetHours];
  float v8 = v7;
  [(RTAuthorizedLocationQueryMetrics *)v4 userTimeOffsetHours];
  BOOL v10 = v9 <= 0.0;
  float v11 = -0.5;
  if (!v10) {
    float v11 = 0.5;
  }
  float v12 = (float)(int)(float)(v11 + (float)(v8 * 10.0)) * 0.1;
  [(RTAuthorizedLocationMetrics *)self timeSinceDaemonStart];
  unsigned int v51 = (int)fmin(floor(v13 / 3600.0), 100.0);
  v60[0] = @"MaxCumulativeDwellTimeForNotFamiliarLois";
  v14 = NSNumber;
  [(RTAuthorizedLocationCurationMetrics *)v3 maxCumulativeDwellTimeForNotFamiliarLoiHours];
  v59 = [v14 numberWithFloat:x0];
  v61[0] = v59;
  v60[1] = @"MaxUniqueVisitDaysForNotFamiliarLois";
  v58 = [NSNumber numberWithInt:-[RTAuthorizedLocationCurationMetrics maxUniqueVisitDaysForNotFamiliarLois](v3, "maxUniqueVisitDaysForNotFamiliarLois")];
  v61[1] = v58;
  v60[2] = @"AgeDaysRegistry";
  v57 = [NSNumber numberWithInt:-[RTAuthorizedLocationCurationMetrics ageDaysRegistry](v3, "ageDaysRegistry")];
  v61[2] = v57;
  v60[3] = @"AgeDaysFirstAnyLoiVisit";
  v56 = [NSNumber numberWithInt:-[RTAuthorizedLocationCurationMetrics ageDaysFirstAnyLoiVisit](v3, "ageDaysFirstAnyLoiVisit")];
  v61[3] = v56;
  v60[4] = @"AgeDaysFirstTopLoiVisit";
  v55 = [NSNumber numberWithInt:-[RTAuthorizedLocationCurationMetrics ageDaysFirstTopLoiVisit](v3, "ageDaysFirstTopLoiVisit")];
  v61[4] = v55;
  v60[5] = @"AgeDaysFirstTopLoiRegisteredVisit";
  v54 = [NSNumber numberWithInt:-[RTAuthorizedLocationCurationMetrics ageDaysFirstTopLoiRegisteredVisit](v3, "ageDaysFirstTopLoiRegisteredVisit")];
  v61[5] = v54;
  v60[6] = @"AgeDaysFirstTopLoiGeoVisit";
  v53 = [NSNumber numberWithInt:-[RTAuthorizedLocationCurationMetrics ageDaysFirstTopLoiGeoVisit](v3, "ageDaysFirstTopLoiGeoVisit")];
  v61[6] = v53;
  v60[7] = @"VisitRegistrationFraction";
  objc_super v15 = NSNumber;
  [(RTAuthorizedLocationCurationMetrics *)v3 visitRegistrationFraction];
  v50 = [v15 numberWithFloat:x0];
  v61[7] = v50;
  v60[8] = @"RegistrationUsesBestTimeFraction";
  v16 = NSNumber;
  [(RTAuthorizedLocationCurationMetrics *)v3 registrationUsesBestTimeFraction];
  v49 = [v16 numberWithFloat:x0];
  v61[8] = v49;
  v60[9] = @"TotalNumberOfVisitsToTopLOIWithKnownTechnology";
  v48 = [NSNumber numberWithInt:-[RTAuthorizedLocationCurationMetrics visitsToTopLOIWithTechAvailabilityKnown](v3, "visitsToTopLOIWithTechAvailabilityKnown")];
  v61[9] = v48;
  v60[10] = @"FractionOfVisitsToTopLOIWithGPS";
  v17 = NSNumber;
  [(RTAuthorizedLocationCurationMetrics *)v3 fractionOfVisitsToTopLOIWithGPS];
  v47 = [v17 numberWithFloat:x0];
  v61[10] = v47;
  v60[11] = @"FractionOfVisitsToTopLOIWithWiFiHI";
  __int16 v18 = NSNumber;
  [(RTAuthorizedLocationCurationMetrics *)v3 fractionOfVisitsToTopLOIWithWiFiHI];
  v46 = [v18 numberWithFloat:x0];
  v61[11] = v46;
  v60[12] = @"EraseInstallInitializationAttemptCount";
  v45 = [NSNumber numberWithInt:-[RTAuthorizedLocationDatabaseInitializationMetrics eraseInstallInitializationAttemptCount](v6, "eraseInstallInitializationAttemptCount")];
  v61[12] = v45;
  v60[13] = @"EraseInstallInitializationCompletionTimeHours";
  v44 = [NSNumber numberWithInt:-[RTAuthorizedLocationDatabaseInitializationMetrics eraseInstallInitializationCompletionTimeHours](v6, "eraseInstallInitializationCompletionTimeHours")];
  v61[13] = v44;
  v60[14] = @"VisitsRegisteredDuringEraseInstallInitialization";
  v43 = [NSNumber numberWithInt:-[RTAuthorizedLocationDatabaseInitializationMetrics numberOfVisitsRegisteredDuringEraseInstallInitialization](v6, "numberOfVisitsRegisteredDuringEraseInstallInitialization")];
  v61[14] = v43;
  v60[15] = @"FamiliarLoisGeneratedDuringEraseInstallInitialization";
  v42 = [NSNumber numberWithInt:-[RTAuthorizedLocationDatabaseInitializationMetrics numberOfALOIsGeneratedDuringEraseInstallInitialization](v6, "numberOfALOIsGeneratedDuringEraseInstallInitialization")];
  v61[15] = v42;
  v60[16] = @"DaemonResponseLatencyMs";
  int v19 = NSNumber;
  [(RTAuthorizedLocationQueryMetrics *)v4 daemonResponseLatencyMs];
  v41 = [v19 numberWithFloat:x0];
  v61[16] = v41;
  v60[17] = @"LoiFamiliarityRank";
  v40 = [NSNumber numberWithInt:-[RTAuthorizedLocationQueryMetrics loiFamiliarityRank](v4, "loiFamiliarityRank")];
  v61[17] = v40;
  v60[18] = @"NormalizedDistanceToCentroid";
  uint64_t v20 = NSNumber;
  [(RTAuthorizedLocationQueryMetrics *)v4 normalizedDistanceToCentroid];
  v39 = [v20 numberWithFloat:x0];
  v61[18] = v39;
  v60[19] = @"NumFamiliarLoi";
  v37 = [NSNumber numberWithInt:-[RTAuthorizedLocationQueryMetrics numFamiliarLois](v4, "numFamiliarLois")];
  v61[19] = v37;
  v60[20] = @"RejectionReasonCode";
  v36 = [NSNumber numberWithInt:-[RTAuthorizedLocationQueryMetrics rejectionReasonCode](v4, "rejectionReasonCode")];
  v61[20] = v36;
  v60[21] = @"IsLoiHistoricallyLocationStarved";
  v35 = [NSNumber numberWithBool:-[RTAuthorizedLocationQueryMetrics isHistoricallyALowDiversityLocation](v4, "isHistoricallyALowDiversityLocation")];
  v61[21] = v35;
  v60[22] = @"ResponseValue";
  v34 = [NSNumber numberWithBool:-[RTAuthorizedLocationQueryMetrics responseValue](v4, "responseValue")];
  v61[22] = v34;
  v60[23] = @"TechnologyAvailability";
  v33 = [NSNumber numberWithInt:-[RTAuthorizedLocationQueryMetrics technologyAvailability](v4, "technologyAvailability")];
  v61[23] = v33;
  v60[24] = @"UserTimeOffset";
  *(float *)&double v21 = v12;
  v22 = [NSNumber numberWithFloat:v21];
  v61[24] = v22;
  v60[25] = @"VisitDwell";
  v38 = v6;
  v23 = NSNumber;
  [(RTAuthorizedLocationQueryMetrics *)v4 visitDwellMinutes];
  v24 = [v23 numberWithFloat:x0];
  v61[25] = v24;
  v60[26] = @"LocationAgeMinutes";
  v25 = [NSNumber numberWithInt:-[RTAuthorizedLocationQueryMetrics locationAgeMinutes](v4, "locationAgeMinutes")];
  v61[26] = v25;
  v60[27] = @"HistoricalRejectionReasonCode";
  v26 = [NSNumber numberWithInt:-[RTAuthorizedLocationQueryMetrics historicalRejectionReasonCode](v4, "historicalRejectionReasonCode")];
  v61[27] = v26;
  v60[28] = @"HistoricalRejectionSpeedMps";
  v27 = NSNumber;
  [(RTAuthorizedLocationQueryMetrics *)v4 historicalRejectionSpeedMps];
  v28 = [v27 numberWithFloat:x0];
  v61[28] = v28;
  v60[29] = @"LocationServicesEnabled";
  v29 = [NSNumber numberWithBool:self->_locationServicesEnabled];
  v61[29] = v29;
  v60[30] = @"RoutineEnabled";
  v30 = [NSNumber numberWithBool:self->_routineEnabled];
  v61[30] = v30;
  v60[31] = @"TimeSinceDaemonStartHours";
  v31 = [NSNumber numberWithInt:v51];
  v61[31] = v31;
  id v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:32];

  return v52;
}

- (void)submitToCoreAnalytics
{
  if (self->_queryMetrics)
  {
    v3 = [MEMORY[0x1E4F1C9C8] now];
    lastQueryMetricSubmissionDate = self->_lastQueryMetricSubmissionDate;
    self->_lastQueryMetricSubmissionDate = v3;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__RTAuthorizedLocationMetrics_submitToCoreAnalytics__block_invoke;
  v18[3] = &unk_1E6B94DE8;
  v18[4] = self;
  double v5 = (void *)MEMORY[0x1E016DB00](v18, a2);
  id v6 = [NSString alloc];
  float v7 = (void *)[v6 initWithCString:RTAnalyticsEventDiscreteLoiFamiliarity encoding:1];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __52__RTAuthorizedLocationMetrics_submitToCoreAnalytics__block_invoke_2;
  objc_super v15 = &unk_1E6B943B0;
  id v16 = v7;
  id v17 = v5;
  id v8 = v7;
  id v9 = v5;
  BOOL v10 = (void *)MEMORY[0x1E016DB00](&v12);
  float v11 = [NSString stringWithFormat:@"com.apple.%@", v8, v12, v13, v14, v15];
  AnalyticsSendEventLazy();
}

uint64_t __52__RTAuthorizedLocationMetrics_submitToCoreAnalytics__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) convertToDictionary];
}

id __52__RTAuthorizedLocationMetrics_submitToCoreAnalytics__block_invoke_2(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  log_analytics_submission(*(void **)(a1 + 32), v2);

  return v2;
}

- (RTAuthorizedLocationCurationMetrics)curationMetrics
{
  return self->_curationMetrics;
}

- (void)setCurationMetrics:(id)a3
{
}

- (RTAuthorizedLocationDatabaseInitializationMetrics)initializationMetrics
{
  return self->_initializationMetrics;
}

- (void)setInitializationMetrics:(id)a3
{
}

- (RTAuthorizedLocationQueryMetrics)queryMetrics
{
  return self->_queryMetrics;
}

- (void)setQueryMetrics:(id)a3
{
}

- (NSDate)daemonStartDate
{
  return self->_daemonStartDate;
}

- (BOOL)locationServicesEnabled
{
  return self->_locationServicesEnabled;
}

- (void)setLocationServicesEnabled:(BOOL)a3
{
  self->_locationServicesEnabled = a3;
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (void)setRoutineEnabled:(BOOL)a3
{
  self->_routineEnabled = a3;
}

- (NSDate)lastQueryMetricSubmissionDate
{
  return self->_lastQueryMetricSubmissionDate;
}

- (void)setLastQueryMetricSubmissionDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQueryMetricSubmissionDate, 0);
  objc_storeStrong((id *)&self->_daemonStartDate, 0);
  objc_storeStrong((id *)&self->_queryMetrics, 0);
  objc_storeStrong((id *)&self->_initializationMetrics, 0);

  objc_storeStrong((id *)&self->_curationMetrics, 0);
}

@end