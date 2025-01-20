@interface TATrackingAvoidanceServiceSettings
- (BOOL)enableTAFilterGeneral;
- (BOOL)enableTAFilterLeavingLOI;
- (BOOL)enableTAFilterSingleVisit;
- (BOOL)enableTAFilterVisits;
- (TATrackingAvoidanceServiceSettings)initWithDefaults;
- (TATrackingAvoidanceServiceSettings)initWithEnableTAFilterGeneral:(BOOL)a3 enableTAFilterVisits:(BOOL)a4 enableTAFilterSingleVisit:(BOOL)a5 enableTAFilterLeavingLOI:(BOOL)a6 classificationTimeInterval:(double)a7;
- (TATrackingAvoidanceServiceSettings)initWithEnableTAFilterGeneralOrDefault:(id)a3 enableTAFilterVisitsOrDefault:(id)a4 enableTAFilterSingleVisitOrDefault:(id)a5 enableTAFilterLeavingLOIOrDefault:(id)a6 classificationTimeIntervalOrDefault:(id)a7;
- (double)classificationTimeInterval;
@end

@implementation TATrackingAvoidanceServiceSettings

- (double)classificationTimeInterval
{
  return self->_classificationTimeInterval;
}

- (BOOL)enableTAFilterVisits
{
  return self->_enableTAFilterVisits;
}

- (BOOL)enableTAFilterSingleVisit
{
  return self->_enableTAFilterSingleVisit;
}

- (TATrackingAvoidanceServiceSettings)initWithDefaults
{
  return [(TATrackingAvoidanceServiceSettings *)self initWithEnableTAFilterGeneral:1 enableTAFilterVisits:1 enableTAFilterSingleVisit:1 enableTAFilterLeavingLOI:1 classificationTimeInterval:120.0];
}

- (TATrackingAvoidanceServiceSettings)initWithEnableTAFilterGeneral:(BOOL)a3 enableTAFilterVisits:(BOOL)a4 enableTAFilterSingleVisit:(BOOL)a5 enableTAFilterLeavingLOI:(BOOL)a6 classificationTimeInterval:(double)a7
{
  v14.receiver = self;
  v14.super_class = (Class)TATrackingAvoidanceServiceSettings;
  result = [(TATrackingAvoidanceServiceSettings *)&v14 init];
  if (result)
  {
    result->_enableTAFilterGeneral = a3;
    result->_enableTAFilterVisits = a4;
    result->_enableTAFilterSingleVisit = a5;
    result->_enableTAFilterLeavingLOI = a6;
    double v13 = 120.0;
    if (a7 > 0.0) {
      double v13 = a7;
    }
    result->_classificationTimeInterval = v13;
  }
  return result;
}

- (TATrackingAvoidanceServiceSettings)initWithEnableTAFilterGeneralOrDefault:(id)a3 enableTAFilterVisitsOrDefault:(id)a4 enableTAFilterSingleVisitOrDefault:(id)a5 enableTAFilterLeavingLOIOrDefault:(id)a6 classificationTimeIntervalOrDefault:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    uint64_t v17 = [v12 BOOLValue];
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = 1;
    if (v13)
    {
LABEL_3:
      uint64_t v18 = [v13 BOOLValue];
      if (v14) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  uint64_t v18 = 1;
  if (v14)
  {
LABEL_4:
    uint64_t v19 = [v14 BOOLValue];
    if (v15) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v20 = 1;
    if (v16) {
      goto LABEL_6;
    }
LABEL_11:
    double v21 = 120.0;
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v19 = 1;
  if (!v15) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v20 = [v15 BOOLValue];
  if (!v16) {
    goto LABEL_11;
  }
LABEL_6:
  [v16 doubleValue];
LABEL_12:
  v22 = [(TATrackingAvoidanceServiceSettings *)self initWithEnableTAFilterGeneral:v17 enableTAFilterVisits:v18 enableTAFilterSingleVisit:v19 enableTAFilterLeavingLOI:v20 classificationTimeInterval:v21];

  return v22;
}

- (BOOL)enableTAFilterGeneral
{
  return self->_enableTAFilterGeneral;
}

- (BOOL)enableTAFilterLeavingLOI
{
  return self->_enableTAFilterLeavingLOI;
}

@end