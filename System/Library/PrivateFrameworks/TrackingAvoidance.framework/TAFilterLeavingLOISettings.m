@interface TAFilterLeavingLOISettings
+ (id)defaultLeavingLOIEnabledLoiTypes;
- (NSSet)enabledLoiTypes;
- (TAFilterLeavingLOISettings)initWithDefaults;
- (TAFilterLeavingLOISettings)initWithThresholdOfSignificantDuration:(double)a3 thresholdOfSignificantDistance:(double)a4 filterVisitsSettings:(id)a5 enabledLoiTypes:(id)a6 leavingHomeImmediacyType:(unint64_t)a7 leavingWorkImmediacyType:(unint64_t)a8;
- (TAFilterLeavingLOISettings)initWithThresholdOfSignificantDurationOrDefault:(id)a3 thresholdOfSignificantDistanceOrDefault:(id)a4 filterVisitsSettingsOrDefault:(id)a5 enabledLoiTypesOrDefault:(id)a6 leavingHomeImmediacyTypeOrDefault:(id)a7 leavingWorkImmediacyTypeOrDefault:(id)a8;
- (TAFilterVisitsSettings)visitsSettings;
- (double)thresholdOfSignificantDistance;
- (double)thresholdOfSignificantDuration;
- (id)enabledLoiTypesToString;
- (unint64_t)leavingHomeImmediacyType;
- (unint64_t)leavingWorkImmediacyType;
@end

@implementation TAFilterLeavingLOISettings

+ (id)defaultLeavingLOIEnabledLoiTypes
{
  id v2 = objc_alloc(MEMORY[0x263EFFA08]);
  v3 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:1];
  v4 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:2];
  v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, 0);

  return v5;
}

- (TAFilterLeavingLOISettings)initWithThresholdOfSignificantDuration:(double)a3 thresholdOfSignificantDistance:(double)a4 filterVisitsSettings:(id)a5 enabledLoiTypes:(id)a6 leavingHomeImmediacyType:(unint64_t)a7 leavingWorkImmediacyType:(unint64_t)a8
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v15 = a5;
  id v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)TAFilterLeavingLOISettings;
  v17 = [(TAFilterLeavingLOISettings *)&v26 init];
  v18 = v17;
  if (v17)
  {
    if (!v15)
    {
      v24 = 0;
      goto LABEL_7;
    }
    v17->_thresholdOfSignificantDuration = a3;
    v17->_thresholdOfSignificantDistance = a4;
    objc_storeStrong((id *)&v17->_visitsSettings, a5);
    uint64_t v19 = [v16 copy];
    enabledLoiTypes = v18->_enabledLoiTypes;
    v18->_enabledLoiTypes = (NSSet *)v19;

    v18->_leavingHomeImmediacyType = a7;
    v18->_leavingWorkImmediacyType = a8;
    v21 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = [(TAFilterLeavingLOISettings *)v18 enabledLoiTypesToString];
      *(_DWORD *)buf = 138477827;
      v28 = v23;
      _os_log_impl(&dword_22345C000, v22, OS_LOG_TYPE_DEFAULT, "#TAFilterLeavingLOI enabled LOI types: %{private}@", buf, 0xCu);
    }
  }
  v24 = v18;
LABEL_7:

  return v24;
}

- (TAFilterLeavingLOISettings)initWithThresholdOfSignificantDurationOrDefault:(id)a3 thresholdOfSignificantDistanceOrDefault:(id)a4 filterVisitsSettingsOrDefault:(id)a5 enabledLoiTypesOrDefault:(id)a6 leavingHomeImmediacyTypeOrDefault:(id)a7 leavingWorkImmediacyTypeOrDefault:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = (TAFilterVisitsSettings *)a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v14)
  {
    [v14 doubleValue];
    double v21 = v20;
    if (v15)
    {
LABEL_3:
      [v15 doubleValue];
      double v23 = v22;
      goto LABEL_6;
    }
  }
  else
  {
    double v21 = 300.0;
    if (v15) {
      goto LABEL_3;
    }
  }
  double v23 = 420.0;
LABEL_6:
  v24 = v16;
  if (!v16) {
    v24 = [[TAFilterVisitsSettings alloc] initWithDefaults];
  }
  v25 = v17;
  if (v17)
  {
    if (v18) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v26 = 3;
    if (v19) {
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  v25 = +[TAFilterLeavingLOISettings defaultLeavingLOIEnabledLoiTypes];
  if (!v18) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v26 = [v18 unsignedIntValue];
  if (v19)
  {
LABEL_11:
    uint64_t v27 = [v19 unsignedIntValue];
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v27 = 3;
LABEL_15:
  v28 = [(TAFilterLeavingLOISettings *)self initWithThresholdOfSignificantDuration:v24 thresholdOfSignificantDistance:v25 filterVisitsSettings:v26 enabledLoiTypes:v27 leavingHomeImmediacyType:v21 leavingWorkImmediacyType:v23];
  if (!v17)
  {

    if (v16) {
      goto LABEL_17;
    }
LABEL_19:

    goto LABEL_17;
  }
  if (!v16) {
    goto LABEL_19;
  }
LABEL_17:

  return v28;
}

- (TAFilterLeavingLOISettings)initWithDefaults
{
  v3 = [[TAFilterVisitsSettings alloc] initWithDefaults];
  v4 = +[TAFilterLeavingLOISettings defaultLeavingLOIEnabledLoiTypes];
  v5 = [(TAFilterLeavingLOISettings *)self initWithThresholdOfSignificantDuration:v3 thresholdOfSignificantDistance:v4 filterVisitsSettings:3 enabledLoiTypes:3 leavingHomeImmediacyType:300.0 leavingWorkImmediacyType:420.0];

  return v5;
}

- (id)enabledLoiTypesToString
{
  v3 = [MEMORY[0x263EFF980] array];
  enabledLoiTypes = self->_enabledLoiTypes;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__TAFilterLeavingLOISettings_enabledLoiTypesToString__block_invoke;
  v8[3] = &unk_2646AA9C8;
  id v9 = v3;
  id v5 = v3;
  [(NSSet *)enabledLoiTypes enumerateObjectsUsingBlock:v8];
  v6 = [v5 componentsJoinedByString:@","];

  return v6;
}

void __53__TAFilterLeavingLOISettings_enabledLoiTypesToString__block_invoke(uint64_t a1, void *a2)
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

- (NSSet)enabledLoiTypes
{
  return self->_enabledLoiTypes;
}

- (unint64_t)leavingHomeImmediacyType
{
  return self->_leavingHomeImmediacyType;
}

- (unint64_t)leavingWorkImmediacyType
{
  return self->_leavingWorkImmediacyType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledLoiTypes, 0);
  objc_storeStrong((id *)&self->_visitsSettings, 0);
}

@end