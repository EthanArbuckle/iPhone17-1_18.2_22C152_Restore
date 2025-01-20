@interface VGVehicleState
+ (BOOL)supportsSecureCoding;
+ (id)_vehicleStateFromStorage:(id)a3;
- (BOOL)isCharging;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSignificantlyDifferentFromVehicleState:(id)a3;
- (NSDate)dateOfUpdate;
- (NSMeasurement)currentBatteryCapacity;
- (NSMeasurement)currentEVRange;
- (NSMeasurement)maxBatteryCapacity;
- (NSMeasurement)maxEVRange;
- (NSMeasurement)minBatteryCapacity;
- (NSNumber)batteryPercentage;
- (NSString)chargingArguments;
- (NSString)consumptionArguments;
- (NSString)identifier;
- (VGVehicleState)initWithCoder:(id)a3;
- (VGVehicleState)initWithIdentifier:(id)a3 dateOfUpdate:(id)a4 origin:(int64_t)a5 batteryPercentage:(id)a6 currentEVRange:(id)a7 maxEVRange:(id)a8 minBatteryCapacity:(id)a9 currentBatteryCapacity:(id)a10 maxBatteryCapacity:(id)a11 consumptionArguments:(id)a12 chargingArguments:(id)a13 isCharging:(BOOL)a14 activeConnector:(unint64_t)a15;
- (id)_storage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)origin;
- (unint64_t)activeConnector;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VGVehicleState

- (VGVehicleState)initWithIdentifier:(id)a3 dateOfUpdate:(id)a4 origin:(int64_t)a5 batteryPercentage:(id)a6 currentEVRange:(id)a7 maxEVRange:(id)a8 minBatteryCapacity:(id)a9 currentBatteryCapacity:(id)a10 maxBatteryCapacity:(id)a11 consumptionArguments:(id)a12 chargingArguments:(id)a13 isCharging:(BOOL)a14 activeConnector:(unint64_t)a15
{
  id v38 = a3;
  id v37 = a4;
  id v36 = a6;
  id v35 = a7;
  id v34 = a8;
  id v33 = a9;
  id v32 = a10;
  id v31 = a11;
  id v20 = a12;
  id v21 = a13;
  v39.receiver = self;
  v39.super_class = (Class)VGVehicleState;
  v22 = [(VGVehicleState *)&v39 init];
  if (v22)
  {
    uint64_t v23 = [v38 copy];
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v23;

    objc_storeStrong((id *)&v22->_dateOfUpdate, a4);
    v22->_origin = a5;
    objc_storeStrong((id *)&v22->_batteryPercentage, a6);
    objc_storeStrong((id *)&v22->_currentEVRange, a7);
    objc_storeStrong((id *)&v22->_maxEVRange, a8);
    objc_storeStrong((id *)&v22->_minBatteryCapacity, a9);
    objc_storeStrong((id *)&v22->_currentBatteryCapacity, a10);
    objc_storeStrong((id *)&v22->_maxBatteryCapacity, a11);
    uint64_t v25 = [v20 copy];
    consumptionArguments = v22->_consumptionArguments;
    v22->_consumptionArguments = (NSString *)v25;

    uint64_t v27 = [v21 copy];
    chargingArguments = v22->_chargingArguments;
    v22->_chargingArguments = (NSString *)v27;

    v22->_isCharging = a14;
    v22->_activeConnector = a15;
  }

  return v22;
}

- (BOOL)isSignificantlyDifferentFromVehicleState:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v4 = a3;
  GEOConfigGetDouble();
  double v6 = v5;
  dateOfUpdate = self->_dateOfUpdate;
  v8 = [v4 dateOfUpdate];
  [(NSDate *)dateOfUpdate timeIntervalSinceDate:v8];
  double v10 = fabs(v9);

  if (v10 <= v6)
  {
    GEOConfigGetDouble();
    double v15 = v14;
    [(NSMeasurement *)self->_minBatteryCapacity doubleValue];
    double v17 = v16;
    v18 = [v4 minBatteryCapacity];
    [v18 doubleValue];
    if (vabdd_f64(v17, v19) > v15)
    {
LABEL_7:

      goto LABEL_8;
    }
    [(NSMeasurement *)self->_currentBatteryCapacity doubleValue];
    double v21 = v20;
    v22 = [v4 currentBatteryCapacity];
    [v22 doubleValue];
    if (vabdd_f64(v21, v23) > v15)
    {

      goto LABEL_7;
    }
    [(NSMeasurement *)self->_maxBatteryCapacity doubleValue];
    double v30 = v29;
    id v31 = [v4 maxBatteryCapacity];
    [v31 doubleValue];
    double v33 = vabdd_f64(v30, v32);

    if (v33 > v15)
    {
LABEL_8:
      v11 = VGGetPersistingLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        currentBatteryCapacity = self->_currentBatteryCapacity;
        maxBatteryCapacity = self->_maxBatteryCapacity;
        minBatteryCapacity = self->_minBatteryCapacity;
        int v58 = 138413058;
        v59 = minBatteryCapacity;
        __int16 v60 = 2112;
        v61 = maxBatteryCapacity;
        __int16 v62 = 2112;
        v63 = currentBatteryCapacity;
        __int16 v64 = 2112;
        id v65 = v4;
        _os_log_impl(&dword_214A2C000, v11, OS_LOG_TYPE_INFO, "isSignificantlyDifferentFromVehicleState: -> YES. Battery state has changed. _min: %@, _max: %@, _current: %@. new: %@", (uint8_t *)&v58, 0x2Au);
      }
      goto LABEL_10;
    }
    consumptionArguments = self->_consumptionArguments;
    id v35 = [v4 consumptionArguments];
    id v36 = consumptionArguments;
    unint64_t v37 = v35;
    if ((unint64_t)v36 | v37
      && (char v38 = [v36 isEqual:v37], (id)v37, v36, (v38 & 1) == 0))
    {
    }
    else
    {
      chargingArguments = self->_chargingArguments;
      v40 = [v4 chargingArguments];
      id v41 = chargingArguments;
      unint64_t v42 = v40;
      if (!((unint64_t)v41 | v42))
      {

        goto LABEL_36;
      }
      v43 = (void *)v42;
      char v44 = [v41 isEqual:v42];

      if (v44) {
        goto LABEL_36;
      }
    }
    uint64_t v45 = VGDictionaryFromVGVehicleArguments(self->_chargingArguments);
    v46 = [v4 chargingArguments];
    uint64_t v47 = VGDictionaryFromVGVehicleArguments(v46);
    if (v45 | v47) {
      int v48 = [(id)v45 isEqual:v47] ^ 1;
    }
    else {
      int v48 = 0;
    }

    uint64_t v49 = VGDictionaryFromVGVehicleArguments(self->_consumptionArguments);
    v50 = [v4 consumptionArguments];
    uint64_t v51 = VGDictionaryFromVGVehicleArguments(v50);
    if (v49 | v51) {
      int v52 = [(id)v49 isEqual:v51] ^ 1;
    }
    else {
      int v52 = 0;
    }

    if ((v52 | v48) == 1)
    {
      v53 = VGGetPersistingLog();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        v54 = @"NO";
        if (v48) {
          v55 = @"YES";
        }
        else {
          v55 = @"NO";
        }
        if (v52) {
          v54 = @"YES";
        }
        int v58 = 138412546;
        v59 = v55;
        __int16 v60 = 2112;
        v61 = v54;
        v56 = v54;
        v57 = v55;
        _os_log_impl(&dword_214A2C000, v53, OS_LOG_TYPE_INFO, "isSignificantlyDifferentFromVehicleState: -> YES. chargingArgumentsAreDifferent: %@, consumptionArgumentsAreDifferent: %@", (uint8_t *)&v58, 0x16u);
      }
      goto LABEL_11;
    }
LABEL_36:
    BOOL v27 = 0;
    goto LABEL_12;
  }
  v11 = VGGetPersistingLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = self->_dateOfUpdate;
    v13 = [v4 dateOfUpdate];
    int v58 = 138412546;
    v59 = v12;
    __int16 v60 = 2112;
    v61 = v13;
    _os_log_impl(&dword_214A2C000, v11, OS_LOG_TYPE_INFO, "isSignificantlyDifferentFromVehicleState: -> YES. Date of last update: %@, date of new update: %@", (uint8_t *)&v58, 0x16u);
  }
LABEL_10:

LABEL_11:
  BOOL v27 = 1;
LABEL_12:

  return v27;
}

+ (id)_vehicleStateFromStorage:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v54 = [VGVehicleState alloc];
    id v4 = [v3 identifier];
    uint64_t v5 = [v4 copy];
    double v6 = (void *)MEMORY[0x263EFF910];
    [v3 dateOfUpdate];
    v61 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v7 = [v3 origin];
    uint64_t v8 = v7;
    if (v7 >= 3)
    {
      double v10 = VGGetPersistingLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
        *(_DWORD *)buf = 138412290;
        v63 = v11;
        _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_ERROR, "Failed to load origin from protoOrigin: %@", buf, 0xCu);
      }
      uint64_t v51 = 0;
    }
    else
    {
      uint64_t v51 = v7;
    }
    int v53 = [v3 hasBatteryPercentage];
    v55 = (void *)v5;
    if (v53)
    {
      v12 = NSNumber;
      [v3 batteryPercentage];
      __int16 v60 = objc_msgSend(v12, "numberWithDouble:");
    }
    else
    {
      __int16 v60 = 0;
    }
    int v52 = [v3 hasCurrentEVRange];
    if (v52)
    {
      id v13 = objc_alloc(MEMORY[0x263F08980]);
      [v3 currentEVRange];
      double v15 = v14;
      v46 = [MEMORY[0x263F08CE8] kilometers];
      v59 = objc_msgSend(v13, "initWithDoubleValue:unit:", v15);
    }
    else
    {
      v59 = 0;
    }
    int v50 = [v3 hasMaxEVRange];
    if (v50)
    {
      id v16 = objc_alloc(MEMORY[0x263F08980]);
      [v3 maxEVRange];
      double v18 = v17;
      uint64_t v45 = [MEMORY[0x263F08CE8] kilometers];
      int v58 = objc_msgSend(v16, "initWithDoubleValue:unit:", v18);
    }
    else
    {
      int v58 = 0;
    }
    int v49 = [v3 hasMinBatteryCapacity];
    if (v49)
    {
      id v19 = objc_alloc(MEMORY[0x263F08980]);
      [v3 minBatteryCapacity];
      double v21 = v20;
      char v44 = [MEMORY[0x263F08CC0] kilowattHours];
      v57 = objc_msgSend(v19, "initWithDoubleValue:unit:", v21);
    }
    else
    {
      v57 = 0;
    }
    int v48 = [v3 hasCurrentBatteryCapacity];
    if (v48)
    {
      id v22 = objc_alloc(MEMORY[0x263F08980]);
      [v3 currentBatteryCapacity];
      double v24 = v23;
      v43 = [MEMORY[0x263F08CC0] kilowattHours];
      v56 = objc_msgSend(v22, "initWithDoubleValue:unit:", v24);
    }
    else
    {
      v56 = 0;
    }
    int v25 = [v3 hasMaxBatteryCapacity];
    if (v25)
    {
      id v26 = objc_alloc(MEMORY[0x263F08980]);
      [v3 maxBatteryCapacity];
      double v28 = v27;
      unint64_t v42 = [MEMORY[0x263F08CC0] kilowattHours];
      double v29 = objc_msgSend(v26, "initWithDoubleValue:unit:", v28);
    }
    else
    {
      double v29 = 0;
    }
    double v30 = [v3 consumptionArguments];
    id v31 = (void *)[v30 copy];
    double v32 = [v3 chargingArguments];
    double v33 = (void *)[v32 copy];
    char v34 = [v3 isCharging];
    uint64_t v35 = [v3 activeConnector];
    uint64_t v36 = v35;
    if (v35 >= 0xA)
    {
      uint64_t v47 = v4;
      char v38 = VGGetPersistingLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        objc_super v39 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v36);
        *(_DWORD *)buf = 138412290;
        v63 = v39;
        _os_log_impl(&dword_214A2C000, v38, OS_LOG_TYPE_ERROR, "Failed to load a single connector type from protoConnectorType: %@", buf, 0xCu);
      }
      uint64_t v37 = 0;
      id v4 = v47;
    }
    else
    {
      uint64_t v37 = qword_214A594D0[(int)v35];
    }
    LOBYTE(v41) = v34;
    double v9 = [(VGVehicleState *)v54 initWithIdentifier:v55 dateOfUpdate:v61 origin:v51 batteryPercentage:v60 currentEVRange:v59 maxEVRange:v58 minBatteryCapacity:v57 currentBatteryCapacity:v56 maxBatteryCapacity:v29 consumptionArguments:v31 chargingArguments:v33 isCharging:v41 activeConnector:v37];

    if (v25)
    {
    }
    if (v48)
    {
    }
    if (v49)
    {
    }
    if (v50)
    {
    }
    if (v52)
    {
    }
    if (v53) {
  }
    }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)_storage
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(VGVehicleStateStorage);
  id v4 = (void *)[(NSString *)self->_identifier copy];
  [(VGVehicleStateStorage *)v3 setIdentifier:v4];

  [(NSDate *)self->_dateOfUpdate timeIntervalSinceReferenceDate];
  -[VGVehicleStateStorage setDateOfUpdate:](v3, "setDateOfUpdate:");
  unint64_t origin = self->_origin;
  if (origin >= 3)
  {
    double v6 = VGGetPersistingLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v30 = 138412290;
      id v31 = @"Unknown";
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_ERROR, "Failed to persist origin from vgOrigin: %@", (uint8_t *)&v30, 0xCu);
    }

    unint64_t origin = 0;
  }
  [(VGVehicleStateStorage *)v3 setOrigin:origin];
  batteryPercentage = self->_batteryPercentage;
  if (batteryPercentage)
  {
    [(NSNumber *)batteryPercentage doubleValue];
    -[VGVehicleStateStorage setBatteryPercentage:](v3, "setBatteryPercentage:");
  }
  currentEVRange = self->_currentEVRange;
  if (currentEVRange)
  {
    double v9 = [MEMORY[0x263F08CE8] kilometers];
    double v10 = [(NSMeasurement *)currentEVRange measurementByConvertingToUnit:v9];
    [v10 doubleValue];
    -[VGVehicleStateStorage setCurrentEVRange:](v3, "setCurrentEVRange:");
  }
  maxEVRange = self->_maxEVRange;
  if (maxEVRange)
  {
    v12 = [MEMORY[0x263F08CE8] kilometers];
    id v13 = [(NSMeasurement *)maxEVRange measurementByConvertingToUnit:v12];
    [v13 doubleValue];
    -[VGVehicleStateStorage setMaxEVRange:](v3, "setMaxEVRange:");
  }
  minBatteryCapacity = self->_minBatteryCapacity;
  if (minBatteryCapacity)
  {
    double v15 = [MEMORY[0x263F08CC0] kilowattHours];
    id v16 = [(NSMeasurement *)minBatteryCapacity measurementByConvertingToUnit:v15];
    [v16 doubleValue];
    -[VGVehicleStateStorage setMinBatteryCapacity:](v3, "setMinBatteryCapacity:");
  }
  currentBatteryCapacity = self->_currentBatteryCapacity;
  if (currentBatteryCapacity)
  {
    double v18 = [MEMORY[0x263F08CC0] kilowattHours];
    id v19 = [(NSMeasurement *)currentBatteryCapacity measurementByConvertingToUnit:v18];
    [v19 doubleValue];
    -[VGVehicleStateStorage setCurrentBatteryCapacity:](v3, "setCurrentBatteryCapacity:");
  }
  maxBatteryCapacity = self->_maxBatteryCapacity;
  if (maxBatteryCapacity)
  {
    double v21 = [MEMORY[0x263F08CC0] kilowattHours];
    id v22 = [(NSMeasurement *)maxBatteryCapacity measurementByConvertingToUnit:v21];
    [v22 doubleValue];
    -[VGVehicleStateStorage setMaxBatteryCapacity:](v3, "setMaxBatteryCapacity:");
  }
  double v23 = (void *)[(NSString *)self->_consumptionArguments copy];
  [(VGVehicleStateStorage *)v3 setConsumptionArguments:v23];

  double v24 = (void *)[(NSString *)self->_chargingArguments copy];
  [(VGVehicleStateStorage *)v3 setChargingArguments:v24];

  [(VGVehicleStateStorage *)v3 setIsCharging:self->_isCharging];
  int64_t activeConnector = self->_activeConnector;
  if (activeConnector > 15)
  {
    if (activeConnector <= 63)
    {
      if (activeConnector == 16)
      {
        uint64_t v26 = 5;
        goto LABEL_37;
      }
      if (activeConnector == 32)
      {
        uint64_t v26 = 6;
        goto LABEL_37;
      }
    }
    else
    {
      switch(activeConnector)
      {
        case 64:
          uint64_t v26 = 7;
          goto LABEL_37;
        case 128:
          uint64_t v26 = 8;
          goto LABEL_37;
        case 256:
          uint64_t v26 = 9;
          goto LABEL_37;
      }
    }
LABEL_33:
    double v27 = VGGetPersistingLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      NSStringFromVGChargingConnectorTypeOptions(activeConnector);
      double v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v30 = 138412290;
      id v31 = v28;
      _os_log_impl(&dword_214A2C000, v27, OS_LOG_TYPE_ERROR, "Failed to persist a single connector type from vgConnectorType: %@", (uint8_t *)&v30, 0xCu);
    }
LABEL_36:
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = 1;
    switch(activeConnector)
    {
      case 0:
        goto LABEL_36;
      case 1:
        break;
      case 2:
        uint64_t v26 = 2;
        break;
      case 4:
        uint64_t v26 = 3;
        break;
      case 8:
        uint64_t v26 = 4;
        break;
      default:
        goto LABEL_33;
    }
  }
LABEL_37:
  [(VGVehicleStateStorage *)v3 setActiveConnector:v26];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGVehicleState)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)VGVehicleState;
  uint64_t v5 = [(VGVehicleState *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dateOfUpdate"];
    dateOfUpdate = v5->_dateOfUpdate;
    v5->_dateOfUpdate = (NSDate *)v8;

    v5->_unint64_t origin = [v4 decodeIntegerForKey:@"_origin"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_batteryPercentage"];
    batteryPercentage = v5->_batteryPercentage;
    v5->_batteryPercentage = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_currentEVRange"];
    currentEVRange = v5->_currentEVRange;
    v5->_currentEVRange = (NSMeasurement *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maxEVRange"];
    maxEVRange = v5->_maxEVRange;
    v5->_maxEVRange = (NSMeasurement *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_minBatteryCapacity"];
    minBatteryCapacity = v5->_minBatteryCapacity;
    v5->_minBatteryCapacity = (NSMeasurement *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_currentBatteryCapacity"];
    currentBatteryCapacity = v5->_currentBatteryCapacity;
    v5->_currentBatteryCapacity = (NSMeasurement *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maxBatteryCapacity"];
    maxBatteryCapacity = v5->_maxBatteryCapacity;
    v5->_maxBatteryCapacity = (NSMeasurement *)v20;

    id v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_msgSend(v22, "setWithObjects:", v23, v24, v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"_consumptionArguments"];
    consumptionArguments = v5->_consumptionArguments;
    v5->_consumptionArguments = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClasses:v26 forKey:@"_chargingArguments"];
    chargingArguments = v5->_chargingArguments;
    v5->_chargingArguments = (NSString *)v29;

    v5->_isCharging = [v4 decodeBoolForKey:@"_isCharging"];
    id v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_activeConnector"];
    v5->_int64_t activeConnector = [v31 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"_identifier"];
  [v5 encodeObject:self->_dateOfUpdate forKey:@"_dateOfUpdate"];
  [v5 encodeInteger:self->_origin forKey:@"_origin"];
  [v5 encodeObject:self->_batteryPercentage forKey:@"_batteryPercentage"];
  [v5 encodeObject:self->_currentEVRange forKey:@"_currentEVRange"];
  [v5 encodeObject:self->_maxEVRange forKey:@"_maxEVRange"];
  [v5 encodeObject:self->_minBatteryCapacity forKey:@"_minBatteryCapacity"];
  [v5 encodeObject:self->_currentBatteryCapacity forKey:@"_currentBatteryCapacity"];
  [v5 encodeObject:self->_maxBatteryCapacity forKey:@"_maxBatteryCapacity"];
  [v5 encodeObject:self->_consumptionArguments forKey:@"_consumptionArguments"];
  [v5 encodeObject:self->_chargingArguments forKey:@"_chargingArguments"];
  [v5 encodeBool:self->_isCharging forKey:@"_isCharging"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_activeConnector];
  [v5 encodeObject:v6 forKey:@"_activeConnector"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[VGVehicleState allocWithZone:a3];
  LOBYTE(v6) = self->_isCharging;
  return [(VGVehicleState *)v4 initWithIdentifier:self->_identifier dateOfUpdate:self->_dateOfUpdate origin:self->_origin batteryPercentage:self->_batteryPercentage currentEVRange:self->_currentEVRange maxEVRange:self->_maxEVRange minBatteryCapacity:self->_minBatteryCapacity currentBatteryCapacity:self->_currentBatteryCapacity maxBatteryCapacity:self->_maxBatteryCapacity consumptionArguments:self->_consumptionArguments chargingArguments:self->_chargingArguments isCharging:v6 activeConnector:self->_activeConnector];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VGVehicleState *)a3;
  if (v4 == self)
  {
    BOOL v56 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      identifier = v5->_identifier;
      unint64_t v7 = self->_identifier;
      unint64_t v8 = identifier;
      if (v7 | v8)
      {
        double v9 = (void *)v8;
        int v10 = [(id)v7 isEqual:v8];

        if (!v10) {
          goto LABEL_28;
        }
      }
      dateOfUpdate = v5->_dateOfUpdate;
      unint64_t v12 = self->_dateOfUpdate;
      unint64_t v13 = dateOfUpdate;
      if (v12 | v13)
      {
        uint64_t v14 = (void *)v13;
        int v15 = [(id)v12 isEqual:v13];

        if (!v15) {
          goto LABEL_28;
        }
      }
      if (self->_origin != v5->_origin) {
        goto LABEL_28;
      }
      batteryPercentage = v5->_batteryPercentage;
      unint64_t v17 = self->_batteryPercentage;
      unint64_t v18 = batteryPercentage;
      if (v17 | v18)
      {
        id v19 = (void *)v18;
        int v20 = [(id)v17 isEqual:v18];

        if (!v20) {
          goto LABEL_28;
        }
      }
      currentEVRange = v5->_currentEVRange;
      unint64_t v22 = self->_currentEVRange;
      unint64_t v23 = currentEVRange;
      if (v22 | v23)
      {
        uint64_t v24 = (void *)v23;
        int v25 = [(id)v22 isEqual:v23];

        if (!v25) {
          goto LABEL_28;
        }
      }
      maxEVRange = v5->_maxEVRange;
      unint64_t v27 = self->_maxEVRange;
      unint64_t v28 = maxEVRange;
      if (v27 | v28)
      {
        uint64_t v29 = (void *)v28;
        int v30 = [(id)v27 isEqual:v28];

        if (!v30) {
          goto LABEL_28;
        }
      }
      minBatteryCapacity = v5->_minBatteryCapacity;
      unint64_t v32 = self->_minBatteryCapacity;
      unint64_t v33 = minBatteryCapacity;
      if (v32 | v33)
      {
        char v34 = (void *)v33;
        int v35 = [(id)v32 isEqual:v33];

        if (!v35) {
          goto LABEL_28;
        }
      }
      currentBatteryCapacity = v5->_currentBatteryCapacity;
      unint64_t v37 = self->_currentBatteryCapacity;
      unint64_t v38 = currentBatteryCapacity;
      if (v37 | v38)
      {
        objc_super v39 = (void *)v38;
        int v40 = [(id)v37 isEqual:v38];

        if (!v40) {
          goto LABEL_28;
        }
      }
      maxBatteryCapacity = v5->_maxBatteryCapacity;
      unint64_t v42 = self->_maxBatteryCapacity;
      unint64_t v43 = maxBatteryCapacity;
      if (v42 | v43)
      {
        char v44 = (void *)v43;
        int v45 = [(id)v42 isEqual:v43];

        if (!v45) {
          goto LABEL_28;
        }
      }
      consumptionArguments = v5->_consumptionArguments;
      unint64_t v47 = self->_consumptionArguments;
      unint64_t v48 = consumptionArguments;
      if (v47 | v48)
      {
        int v49 = (void *)v48;
        int v50 = [(id)v47 isEqual:v48];

        if (!v50) {
          goto LABEL_28;
        }
      }
      if (((chargingArguments = v5->_chargingArguments,
             unint64_t v52 = self->_chargingArguments,
             unint64_t v53 = chargingArguments,
             !(v52 | v53))
         || (v54 = (void *)v53,
             int v55 = [(id)v52 isEqual:v53],
             v54,
             (id)v52,
             v55))
        && self->_isCharging == v5->_isCharging)
      {
        BOOL v56 = self->_activeConnector == v5->_activeConnector;
      }
      else
      {
LABEL_28:
        BOOL v56 = 0;
      }
    }
    else
    {
      BOOL v56 = 0;
    }
  }

  return v56;
}

- (id)description
{
  uint64_t v24 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = @"Unknown";
  identifier = self->_identifier;
  uint64_t v23 = v3;
  dateOfUpdate = self->_dateOfUpdate;
  int64_t origin = self->_origin;
  currentEVRange = self->_currentEVRange;
  if (origin == 1) {
    id v4 = @"iAP2";
  }
  if (origin == 2) {
    id v4 = @"SiriIntents";
  }
  id v19 = v4;
  maxEVRange = self->_maxEVRange;
  minBatteryCapacity = self->_minBatteryCapacity;
  currentBatteryCapacity = self->_currentBatteryCapacity;
  maxBatteryCapacity = self->_maxBatteryCapacity;
  consumptionArguments = self->_consumptionArguments;
  chargingArguments = self->_chargingArguments;
  if (self->_isCharging) {
    unint64_t v12 = @"YES";
  }
  else {
    unint64_t v12 = @"NO";
  }
  unint64_t activeConnector = self->_activeConnector;
  batteryPercentage = self->_batteryPercentage;
  int v15 = v12;
  uint64_t v16 = NSStringFromVGChargingConnectorTypeOptions(activeConnector);
  unint64_t v17 = [v24 stringWithFormat:@"<%@:%p, identifier: %@, dateOfUpdate: %@, origin: %@, batteryCharge: %@, currentEVRange: %@, maxEVRange: %@, minBatteryCapacity: %@, currentBatteryCapacity: %@, maxBatteryCapacity: %@, consumptionArguments: %@, chargingArguments: %@, isCharging: %@, activeConnector: %@>", v23, self, identifier, dateOfUpdate, v19, batteryPercentage, currentEVRange, maxEVRange, minBatteryCapacity, currentBatteryCapacity, maxBatteryCapacity, consumptionArguments, chargingArguments, v15, v16];

  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)dateOfUpdate
{
  return self->_dateOfUpdate;
}

- (int64_t)origin
{
  return self->_origin;
}

- (NSMeasurement)currentEVRange
{
  return self->_currentEVRange;
}

- (NSMeasurement)maxEVRange
{
  return self->_maxEVRange;
}

- (NSMeasurement)minBatteryCapacity
{
  return self->_minBatteryCapacity;
}

- (NSMeasurement)currentBatteryCapacity
{
  return self->_currentBatteryCapacity;
}

- (NSMeasurement)maxBatteryCapacity
{
  return self->_maxBatteryCapacity;
}

- (NSString)consumptionArguments
{
  return self->_consumptionArguments;
}

- (NSString)chargingArguments
{
  return self->_chargingArguments;
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (unint64_t)activeConnector
{
  return self->_activeConnector;
}

- (NSNumber)batteryPercentage
{
  return self->_batteryPercentage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryPercentage, 0);
  objc_storeStrong((id *)&self->_chargingArguments, 0);
  objc_storeStrong((id *)&self->_consumptionArguments, 0);
  objc_storeStrong((id *)&self->_maxBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_currentBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_minBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_maxEVRange, 0);
  objc_storeStrong((id *)&self->_currentEVRange, 0);
  objc_storeStrong((id *)&self->_dateOfUpdate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end