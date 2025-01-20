@interface TAFilterSingleVisitSettings
+ (id)defaultSingleVisitEnabledLoiTypes;
- (NSSet)enabledLoiTypes;
- (TAFilterSingleVisitSettings)initWithDefaults;
- (TAFilterSingleVisitSettings)initWithThresholdOfSignificantDuration:(double)a3 thresholdOfSignificantDistance:(double)a4 filterVisitsSettings:(id)a5 enabledLoiTypes:(id)a6 arrivingWorkImmediacyType:(unint64_t)a7;
- (TAFilterSingleVisitSettings)initWithThresholdOfSignificantDurationOrDefault:(id)a3 thresholdOfSignificantDistanceOrDefault:(id)a4 filterVisitsSettingsOrDefault:(id)a5 enabledLoiTypesOrDefault:(id)a6 arrivingWorkImmediacyTypeOrDefault:(id)a7;
- (TAFilterVisitsSettings)visitsSettings;
- (double)thresholdOfSignificantDistance;
- (double)thresholdOfSignificantDuration;
- (id)enabledLoiTypesToString;
- (unint64_t)arrivingWorkImmediacyType;
@end

@implementation TAFilterSingleVisitSettings

- (NSSet)enabledLoiTypes
{
  return self->_enabledLoiTypes;
}

+ (id)defaultSingleVisitEnabledLoiTypes
{
  id v2 = objc_alloc(MEMORY[0x263EFFA08]);
  v3 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:1];
  v4 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:2];
  v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, 0);

  return v5;
}

- (TAFilterSingleVisitSettings)initWithThresholdOfSignificantDuration:(double)a3 thresholdOfSignificantDistance:(double)a4 filterVisitsSettings:(id)a5 enabledLoiTypes:(id)a6 arrivingWorkImmediacyType:(unint64_t)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TAFilterSingleVisitSettings;
  v15 = [(TAFilterSingleVisitSettings *)&v24 init];
  v16 = v15;
  if (v15)
  {
    if (!v13)
    {
      v22 = 0;
      goto LABEL_7;
    }
    v15->_thresholdOfSignificantDuration = a3;
    v15->_thresholdOfSignificantDistance = a4;
    objc_storeStrong((id *)&v15->_visitsSettings, a5);
    uint64_t v17 = [v14 copy];
    enabledLoiTypes = v16->_enabledLoiTypes;
    v16->_enabledLoiTypes = (NSSet *)v17;

    v16->_arrivingWorkImmediacyType = a7;
    v19 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      v21 = [(TAFilterSingleVisitSettings *)v16 enabledLoiTypesToString];
      *(_DWORD *)buf = 138477827;
      v26 = v21;
      _os_log_impl(&dword_22345C000, v20, OS_LOG_TYPE_DEFAULT, "#TAFilterSingleVisit enabled LOI types: %{private}@", buf, 0xCu);
    }
  }
  v22 = v16;
LABEL_7:

  return v22;
}

- (TAFilterSingleVisitSettings)initWithThresholdOfSignificantDurationOrDefault:(id)a3 thresholdOfSignificantDistanceOrDefault:(id)a4 filterVisitsSettingsOrDefault:(id)a5 enabledLoiTypesOrDefault:(id)a6 arrivingWorkImmediacyTypeOrDefault:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (TAFilterVisitsSettings *)a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    [v12 doubleValue];
    double v18 = v17;
    if (v13)
    {
LABEL_3:
      [v13 doubleValue];
      double v20 = v19;
      goto LABEL_6;
    }
  }
  else
  {
    double v18 = 300.0;
    if (v13) {
      goto LABEL_3;
    }
  }
  double v20 = 420.0;
LABEL_6:
  v21 = v14;
  if (!v14) {
    v21 = [[TAFilterVisitsSettings alloc] initWithDefaults];
  }
  v22 = v15;
  if (v15)
  {
    if (v16)
    {
LABEL_10:
      uint64_t v23 = [v16 unsignedIntValue];
      goto LABEL_13;
    }
  }
  else
  {
    v22 = +[TAFilterSingleVisitSettings defaultSingleVisitEnabledLoiTypes];
    if (v16) {
      goto LABEL_10;
    }
  }
  uint64_t v23 = 3;
LABEL_13:
  objc_super v24 = [(TAFilterSingleVisitSettings *)self initWithThresholdOfSignificantDuration:v21 thresholdOfSignificantDistance:v22 filterVisitsSettings:v23 enabledLoiTypes:v18 arrivingWorkImmediacyType:v20];
  if (!v15)
  {

    if (v14) {
      goto LABEL_15;
    }
LABEL_17:

    goto LABEL_15;
  }
  if (!v14) {
    goto LABEL_17;
  }
LABEL_15:

  return v24;
}

- (TAFilterSingleVisitSettings)initWithDefaults
{
  v3 = [[TAFilterVisitsSettings alloc] initWithDefaults];
  v4 = +[TAFilterSingleVisitSettings defaultSingleVisitEnabledLoiTypes];
  v5 = [(TAFilterSingleVisitSettings *)self initWithThresholdOfSignificantDuration:v3 thresholdOfSignificantDistance:v4 filterVisitsSettings:3 enabledLoiTypes:300.0 arrivingWorkImmediacyType:420.0];

  return v5;
}

- (id)enabledLoiTypesToString
{
  v3 = [MEMORY[0x263EFF980] array];
  enabledLoiTypes = self->_enabledLoiTypes;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__TAFilterSingleVisitSettings_enabledLoiTypesToString__block_invoke;
  v8[3] = &unk_2646AA9C8;
  id v9 = v3;
  id v5 = v3;
  [(NSSet *)enabledLoiTypes enumerateObjectsUsingBlock:v8];
  v6 = [v5 componentsJoinedByString:@","];

  return v6;
}

void __54__TAFilterSingleVisitSettings_enabledLoiTypesToString__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  TALocationOfInterestTypeToString([a2 unsignedIntegerValue]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (double)thresholdOfSignificantDuration
{
  return self->_thresholdOfSignificantDuration;
}

- (double)thresholdOfSignificantDistance
{
  return self->_thresholdOfSignificantDistance;
}

- (TAFilterVisitsSettings)visitsSettings
{
  return self->_visitsSettings;
}

- (unint64_t)arrivingWorkImmediacyType
{
  return self->_arrivingWorkImmediacyType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledLoiTypes, 0);
  objc_storeStrong((id *)&self->_visitsSettings, 0);
}

@end