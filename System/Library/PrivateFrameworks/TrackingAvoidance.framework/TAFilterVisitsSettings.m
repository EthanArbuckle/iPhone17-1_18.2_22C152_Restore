@interface TAFilterVisitsSettings
+ (BOOL)_isLegacyHardware;
+ (double)_determinDefaultEntryDisplayOnBudget;
+ (double)_determinDefaultExitDisplayOnBudget;
+ (id)defaultVisitsSensitiveLOITypes;
- (NSSet)sensitiveLOITypes;
- (TAFilterVisitsSettings)initWithDefaults;
- (TAFilterVisitsSettings)initWithMaxSuspiciousDuration:(double)a3 minInterVisitDistance:(double)a4 minNSigmaBetweenVisits:(unint64_t)a5 entryDisplayOnBudget:(double)a6 exitDisplayOnBudget:(double)a7 sensitiveLOITypes:(id)a8 minObservationInterval:(double)a9 threeVisitImmediacyType:(unint64_t)a10;
- (TAFilterVisitsSettings)initWithMaxSuspiciousDurationOrDefault:(id)a3 minInterVisitDistanceOrDefault:(id)a4 minNSigmaBetweenVisitsOrDefault:(id)a5 entryDisplayOnBudgetOrDefault:(id)a6 exitDisplayOnBudgetOrDefault:(id)a7 sensitiveLOITypesOrDefault:(id)a8 minObservationIntervalOrDefault:(id)a9 threeVisitImmediacyTypeOrDefault:(id)a10;
- (double)entryDisplayOnBudget;
- (double)exitDisplayOnBudget;
- (double)maxSuspiciousDuration;
- (double)minInterVisitDistance;
- (double)minObservationInterval;
- (id)sensitiveLOITypesToString;
- (unint64_t)minNSigmaBetweenVisits;
- (unint64_t)threeVisitImmediacyType;
@end

@implementation TAFilterVisitsSettings

+ (id)defaultVisitsSensitiveLOITypes
{
  id v2 = objc_alloc(MEMORY[0x263EFFA08]);
  v3 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:1];
  v4 = objc_msgSend(v2, "initWithObjects:", v3, 0);

  return v4;
}

- (TAFilterVisitsSettings)initWithMaxSuspiciousDuration:(double)a3 minInterVisitDistance:(double)a4 minNSigmaBetweenVisits:(unint64_t)a5 entryDisplayOnBudget:(double)a6 exitDisplayOnBudget:(double)a7 sensitiveLOITypes:(id)a8 minObservationInterval:(double)a9 threeVisitImmediacyType:(unint64_t)a10
{
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)TAFilterVisitsSettings;
  v19 = [(TAFilterVisitsSettings *)&v24 init];
  v20 = v19;
  if (v19)
  {
    v19->_maxSuspiciousDuration = a3;
    v19->_minInterVisitDistance = a4;
    v19->_minNSigmaBetweenVisits = a5;
    v19->_entryDisplayOnBudget = a6;
    v19->_exitDisplayOnBudget = a7;
    uint64_t v21 = [v18 copy];
    sensitiveLOITypes = v20->_sensitiveLOITypes;
    v20->_sensitiveLOITypes = (NSSet *)v21;

    v20->_minObservationInterval = a9;
    v20->_threeVisitImmediacyType = a10;
  }

  return v20;
}

- (TAFilterVisitsSettings)initWithDefaults
{
  +[TAFilterVisitsSettings _determinDefaultEntryDisplayOnBudget];
  double v4 = v3;
  +[TAFilterVisitsSettings _determinDefaultExitDisplayOnBudget];
  double v6 = v5;
  v7 = +[TAFilterVisitsSettings defaultVisitsSensitiveLOITypes];
  v8 = [(TAFilterVisitsSettings *)self initWithMaxSuspiciousDuration:2 minInterVisitDistance:v7 minNSigmaBetweenVisits:3 entryDisplayOnBudget:300.0 exitDisplayOnBudget:100.0 sensitiveLOITypes:v4 minObservationInterval:v6 threeVisitImmediacyType:300.0];

  return v8;
}

- (TAFilterVisitsSettings)initWithMaxSuspiciousDurationOrDefault:(id)a3 minInterVisitDistanceOrDefault:(id)a4 minNSigmaBetweenVisitsOrDefault:(id)a5 entryDisplayOnBudgetOrDefault:(id)a6 exitDisplayOnBudgetOrDefault:(id)a7 sensitiveLOITypesOrDefault:(id)a8 minObservationIntervalOrDefault:(id)a9 threeVisitImmediacyTypeOrDefault:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (v15)
  {
    [v15 doubleValue];
    double v24 = v23;
    if (v16) {
      goto LABEL_3;
    }
LABEL_6:
    double v26 = 100.0;
    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  double v24 = 300.0;
  if (!v16) {
    goto LABEL_6;
  }
LABEL_3:
  [v16 doubleValue];
  double v26 = v25;
  if (v17)
  {
LABEL_4:
    uint64_t v27 = [v17 unsignedIntValue];
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v27 = 2;
LABEL_8:
  uint64_t v38 = v27;
  if (v18) {
    [v18 doubleValue];
  }
  else {
    +[TAFilterVisitsSettings _determinDefaultEntryDisplayOnBudget];
  }
  double v29 = v28;
  if (v19) {
    [v19 doubleValue];
  }
  else {
    +[TAFilterVisitsSettings _determinDefaultExitDisplayOnBudget];
  }
  double v31 = v30;
  v32 = v20;
  if (v20)
  {
    if (v21) {
      goto LABEL_16;
    }
LABEL_19:
    double v34 = 300.0;
    if (v22) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  v32 = +[TAFilterVisitsSettings defaultVisitsSensitiveLOITypes];
  if (!v21) {
    goto LABEL_19;
  }
LABEL_16:
  objc_msgSend(v21, "doubleValue", v38);
  double v34 = v33;
  if (v22)
  {
LABEL_17:
    uint64_t v35 = objc_msgSend(v22, "unsignedIntValue", v38);
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v35 = 3;
LABEL_21:
  v36 = -[TAFilterVisitsSettings initWithMaxSuspiciousDuration:minInterVisitDistance:minNSigmaBetweenVisits:entryDisplayOnBudget:exitDisplayOnBudget:sensitiveLOITypes:minObservationInterval:threeVisitImmediacyType:](self, "initWithMaxSuspiciousDuration:minInterVisitDistance:minNSigmaBetweenVisits:entryDisplayOnBudget:exitDisplayOnBudget:sensitiveLOITypes:minObservationInterval:threeVisitImmediacyType:", v38, v32, v35, v24, v26, v29, v31, v34, v38);
  if (!v20) {

  }
  return v36;
}

+ (BOOL)_isLegacyHardware
{
  if ((MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0)
  {
    return 1;
  }
  else
  {
    return MGIsDeviceOfType();
  }
}

+ (double)_determinDefaultEntryDisplayOnBudget
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!+[TAFilterVisitsSettings _isLegacyHardware]) {
    return 120.0;
  }
  id v2 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    v7 = "";
    _os_log_impl(&dword_22345C000, v2, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAFilterVisits using special parameters for entry display-on budget for legacy hardware\"}", (uint8_t *)v5, 0x12u);
  }
  return 240.0;
}

+ (double)_determinDefaultExitDisplayOnBudget
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!+[TAFilterVisitsSettings _isLegacyHardware]) {
    return 120.0;
  }
  id v2 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    v7 = "";
    _os_log_impl(&dword_22345C000, v2, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAFilterVisits using special parameters for exit display-on budget for legacy hardware\"}", (uint8_t *)v5, 0x12u);
  }
  return 240.0;
}

- (id)sensitiveLOITypesToString
{
  double v3 = [MEMORY[0x263EFF980] array];
  sensitiveLOITypes = self->_sensitiveLOITypes;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__TAFilterVisitsSettings_sensitiveLOITypesToString__block_invoke;
  v8[3] = &unk_2646AA9C8;
  id v9 = v3;
  id v5 = v3;
  [(NSSet *)sensitiveLOITypes enumerateObjectsUsingBlock:v8];
  __int16 v6 = [v5 componentsJoinedByString:@","];

  return v6;
}

void __51__TAFilterVisitsSettings_sensitiveLOITypesToString__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  TALocationOfInterestTypeToString([a2 unsignedIntegerValue]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (double)maxSuspiciousDuration
{
  return self->_maxSuspiciousDuration;
}

- (double)minInterVisitDistance
{
  return self->_minInterVisitDistance;
}

- (unint64_t)minNSigmaBetweenVisits
{
  return self->_minNSigmaBetweenVisits;
}

- (double)entryDisplayOnBudget
{
  return self->_entryDisplayOnBudget;
}

- (double)exitDisplayOnBudget
{
  return self->_exitDisplayOnBudget;
}

- (NSSet)sensitiveLOITypes
{
  return self->_sensitiveLOITypes;
}

- (double)minObservationInterval
{
  return self->_minObservationInterval;
}

- (unint64_t)threeVisitImmediacyType
{
  return self->_threeVisitImmediacyType;
}

- (void).cxx_destruct
{
}

@end