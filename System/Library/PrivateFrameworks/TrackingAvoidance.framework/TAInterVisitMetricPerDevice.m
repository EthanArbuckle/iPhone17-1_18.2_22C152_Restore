@interface TAInterVisitMetricPerDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)segmentSpeedExceedsLimit;
- (NSArray)sampledObservedLocations;
- (NSDictionary)durationPerMotionState;
- (TAInterVisitMetricPerDevice)init;
- (TAInterVisitMetricPerDevice)initWithCoder:(id)a3;
- (TAInterVisitMetricPerDevice)initWithSettings:(id)a3;
- (TAInterVisitMetricPerDeviceSettings)settings;
- (TASPAdvertisement)latestAdvertisement;
- (double)distance;
- (double)duration;
- (id)description;
- (id)descriptionDictionary;
- (unint64_t)numOfAssociatedLocs;
- (void)accumulate:(id)a3;
- (void)accumulateDistance:(double)a3;
- (void)accumulateDuration:(double)a3;
- (void)accumulateDurationPerMotionState:(id)a3;
- (void)accumulateLatestAdvertisement:(id)a3;
- (void)accumulateNumOfAssociatedLocs:(unint64_t)a3;
- (void)accumulateSampledObservedLocations:(id)a3;
- (void)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSegmentSpeedExceedsLimit:(BOOL)a3;
- (void)setSettings:(id)a3;
@end

@implementation TAInterVisitMetricPerDevice

- (TAInterVisitMetricPerDevice)init
{
  v3 = objc_alloc_init(TAInterVisitMetricPerDeviceSettings);
  v4 = [(TAInterVisitMetricPerDevice *)self initWithSettings:v3];

  return v4;
}

- (TAInterVisitMetricPerDevice)initWithSettings:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TAInterVisitMetricPerDevice;
  v6 = [(TAInterVisitMetricPerDevice *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->_numOfAssociatedLocs = 0;
    v6->_duration = 0.0;
    v6->_distance = 0.0;
    uint64_t v8 = [MEMORY[0x263EFF8C0] array];
    sampledObservedLocations = v7->_sampledObservedLocations;
    v7->_sampledObservedLocations = (NSArray *)v8;

    latestAdvertisement = v7->_latestAdvertisement;
    v7->_latestAdvertisement = 0;

    objc_storeStrong((id *)&v7->_settings, a3);
    v7->_segmentSpeedExceedsLimit = 0;
    uint64_t v11 = [NSDictionary dictionary];
    durationPerMotionState = v7->_durationPerMotionState;
    v7->_durationPerMotionState = (NSDictionary *)v11;
  }
  return v7;
}

- (void)accumulate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    -[TAInterVisitMetricPerDevice accumulateNumOfAssociatedLocs:](self, "accumulateNumOfAssociatedLocs:", [v4 numOfAssociatedLocs]);
    [v9 duration];
    -[TAInterVisitMetricPerDevice accumulateDuration:](self, "accumulateDuration:");
    [v9 distance];
    -[TAInterVisitMetricPerDevice accumulateDistance:](self, "accumulateDistance:");
    id v5 = [v9 sampledObservedLocations];
    [(TAInterVisitMetricPerDevice *)self accumulateSampledObservedLocations:v5];

    v6 = [v9 latestAdvertisement];
    [(TAInterVisitMetricPerDevice *)self accumulateLatestAdvertisement:v6];

    if ([(TAInterVisitMetricPerDevice *)self segmentSpeedExceedsLimit]) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = [v9 segmentSpeedExceedsLimit];
    }
    [(TAInterVisitMetricPerDevice *)self setSegmentSpeedExceedsLimit:v7];
    uint64_t v8 = [v9 durationPerMotionState];
    [(TAInterVisitMetricPerDevice *)self accumulateDurationPerMotionState:v8];

    id v4 = v9;
  }
}

- (void)accumulateNumOfAssociatedLocs:(unint64_t)a3
{
  self->_numOfAssociatedLocs += a3;
}

- (void)accumulateDuration:(double)a3
{
  self->_duration = self->_duration + a3;
}

- (void)accumulateDistance:(double)a3
{
  self->_distance = self->_distance + a3;
}

- (void)accumulateSampledObservedLocations:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sampledObservedLocations = self->_sampledObservedLocations;
  if (!sampledObservedLocations)
  {
    v6 = [MEMORY[0x263EFF8C0] array];
    uint64_t v7 = self->_sampledObservedLocations;
    self->_sampledObservedLocations = v6;

    sampledObservedLocations = self->_sampledObservedLocations;
  }
  v26 = v4;
  v25 = [(NSArray *)sampledObservedLocations arrayByAddingObjectsFromArray:v4];
  uint64_t v8 = [v25 sortedArrayUsingComparator:&__block_literal_global_0];
  id v9 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
LABEL_5:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v28 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
      unint64_t v16 = [(NSArray *)v9 count];
      if (v16 >= [(TAInterVisitMetricPerDeviceSettings *)self->_settings sampledObservationLocationsBufferSize])break; {
      if ([(NSArray *)v9 count])
      }
      {
        v17 = [(NSArray *)v9 lastObject];
        v18 = [v15 getDate];
        v19 = [v17 getDate];
        [v18 timeIntervalSinceDate:v19];
        double v21 = v20;
        [(TAInterVisitMetricPerDeviceSettings *)self->_settings sampledObservationLocationsInterval];
        double v23 = v22;

        if (v21 >= v23) {
          [(NSArray *)v9 addObject:v15];
        }
      }
      else
      {
        [(NSArray *)v9 addObject:v15];
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v12) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  v24 = self->_sampledObservedLocations;
  self->_sampledObservedLocations = v9;
}

uint64_t __66__TAInterVisitMetricPerDevice_accumulateSampledObservedLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 getDate];
  v6 = [v4 getDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)accumulateLatestAdvertisement:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_latestAdvertisement, a3);
    id v5 = v6;
  }
}

- (void)accumulateDurationPerMotionState:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v21 = self;
  id v5 = (NSDictionary *)[(NSDictionary *)self->_durationPerMotionState mutableCopy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = [(NSDictionary *)v5 objectForKey:v11];

        if (v12)
        {
          uint64_t v13 = NSNumber;
          uint64_t v14 = [v6 objectForKeyedSubscript:v11];
          [v14 doubleValue];
          double v16 = v15;
          v17 = [(NSDictionary *)v5 objectForKeyedSubscript:v11];
          [v17 doubleValue];
          v19 = [v13 numberWithDouble:v16 + v18];
          [(NSDictionary *)v5 setObject:v19 forKeyedSubscript:v11];
        }
        else
        {
          uint64_t v14 = [v6 objectForKeyedSubscript:v11];
          [(NSDictionary *)v5 setObject:v14 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  durationPerMotionState = v21->_durationPerMotionState;
  v21->_durationPerMotionState = v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (TAInterVisitMetricPerDevice *)a3;
  if (self == v5)
  {
    char v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      unint64_t v7 = [(TAInterVisitMetricPerDevice *)self numOfAssociatedLocs];
      if (v7 != [(TAInterVisitMetricPerDevice *)v6 numOfAssociatedLocs]
        || ([(TAInterVisitMetricPerDevice *)self duration],
            double v9 = v8,
            [(TAInterVisitMetricPerDevice *)v6 duration],
            v9 != v10)
        || ([(TAInterVisitMetricPerDevice *)self distance],
            double v12 = v11,
            [(TAInterVisitMetricPerDevice *)v6 distance],
            v12 != v13))
      {
        char v17 = 0;
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v14 = [(TAInterVisitMetricPerDevice *)self sampledObservedLocations];
      double v15 = [(TAInterVisitMetricPerDevice *)v6 sampledObservedLocations];
      if (v14 != v15)
      {
        double v16 = [(TAInterVisitMetricPerDevice *)self sampledObservedLocations];
        v3 = [(TAInterVisitMetricPerDevice *)v6 sampledObservedLocations];
        v39 = v16;
        if (![v16 isEqual:v3])
        {
          char v17 = 0;
          goto LABEL_31;
        }
      }
      v19 = [(TAInterVisitMetricPerDevice *)self latestAdvertisement];
      double v20 = [(TAInterVisitMetricPerDevice *)v6 latestAdvertisement];
      if (v19 != v20)
      {
        double v21 = [(TAInterVisitMetricPerDevice *)self latestAdvertisement];
        v38 = [(TAInterVisitMetricPerDevice *)v6 latestAdvertisement];
        if (!objc_msgSend(v21, "isEqual:"))
        {
          char v17 = 0;
LABEL_29:

LABEL_30:
          if (v14 == v15)
          {
LABEL_32:

            goto LABEL_12;
          }
LABEL_31:

          goto LABEL_32;
        }
        v36 = v21;
      }
      uint64_t v22 = [(TAInterVisitMetricPerDevice *)self settings];
      long long v23 = [(TAInterVisitMetricPerDevice *)v6 settings];
      v37 = (void *)v22;
      if ((void *)v22 == v23)
      {
        uint64_t v32 = v20;
        v33 = v19;
      }
      else
      {
        long long v24 = [(TAInterVisitMetricPerDevice *)self settings];
        v34 = [(TAInterVisitMetricPerDevice *)v6 settings];
        v35 = v24;
        if (!objc_msgSend(v24, "isEqual:"))
        {
          char v17 = 0;
          long long v30 = v37;
          goto LABEL_27;
        }
        uint64_t v32 = v20;
        v33 = v19;
      }
      long long v25 = [(TAInterVisitMetricPerDevice *)self durationPerMotionState];
      uint64_t v26 = [(TAInterVisitMetricPerDevice *)v6 durationPerMotionState];
      if (v25 == (void *)v26)
      {

        char v17 = 1;
      }
      else
      {
        uint64_t v27 = (void *)v26;
        [(TAInterVisitMetricPerDevice *)self durationPerMotionState];
        long long v28 = v31 = v3;
        long long v29 = [(TAInterVisitMetricPerDevice *)v6 durationPerMotionState];
        char v17 = [v28 isEqual:v29];

        v3 = v31;
      }
      long long v30 = v37;
      double v20 = v32;
      v19 = v33;
      if (v37 == v23)
      {
LABEL_28:

        double v21 = v36;
        if (v19 == v20) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
LABEL_27:

      goto LABEL_28;
    }
    char v17 = 0;
  }
LABEL_13:

  return v17;
}

- (id)descriptionDictionary
{
  v16[6] = *MEMORY[0x263EF8340];
  v15[0] = @"NumOfAssociatedLocs";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAInterVisitMetricPerDevice numOfAssociatedLocs](self, "numOfAssociatedLocs"));
  v16[0] = v3;
  v15[1] = @"Duration";
  id v4 = NSNumber;
  [(TAInterVisitMetricPerDevice *)self duration];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  v16[1] = v5;
  v15[2] = @"Distance";
  id v6 = NSNumber;
  [(TAInterVisitMetricPerDevice *)self distance];
  unint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  v16[2] = v7;
  v15[3] = @"NumOfSampledObservationLocations";
  double v8 = NSNumber;
  double v9 = [(TAInterVisitMetricPerDevice *)self sampledObservedLocations];
  double v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v16[3] = v10;
  v15[4] = @"LatestAdvertisement";
  double v11 = [(TASPAdvertisement *)self->_latestAdvertisement descriptionDictionary];
  v16[4] = v11;
  v15[5] = @"DurationPerMotionState";
  double v12 = [(TAInterVisitMetricPerDevice *)self durationPerMotionState];
  v16[5] = v12;
  double v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];

  return v13;
}

- (id)description
{
  v2 = [(TAInterVisitMetricPerDevice *)self descriptionDictionary];
  id v9 = 0;
  v3 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v2 error:&v9];
  id v4 = v9;
  if (v4)
  {
    id v5 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      -[TAInterVisitMetricPerDevice description](v5);
    }
    id v6 = [NSString string];
  }
  else
  {
    id v6 = v3;
  }
  unint64_t v7 = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAInterVisitMetricPerDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TAInterVisitMetricPerDevice;
  id v5 = [(TAInterVisitMetricPerDevice *)&v23 init];
  if (v5)
  {
    v5->_numOfAssociatedLocs = [v4 decodeIntegerForKey:@"NumOfAssociatedLocs"];
    [v4 decodeDoubleForKey:@"Duration"];
    v5->_duration = v6;
    [v4 decodeDoubleForKey:@"Distance"];
    v5->_distance = v7;
    double v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    double v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"SampledObservedLocations"];
    sampledObservedLocations = v5->_sampledObservedLocations;
    v5->_sampledObservedLocations = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LatestAdvertisement"];
    latestAdvertisement = v5->_latestAdvertisement;
    v5->_latestAdvertisement = (TASPAdvertisement *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Settings"];
    settings = v5->_settings;
    v5->_settings = (TAInterVisitMetricPerDeviceSettings *)v15;

    char v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"DurationPerMotionState"];
    durationPerMotionState = v5->_durationPerMotionState;
    v5->_durationPerMotionState = (NSDictionary *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t numOfAssociatedLocs = self->_numOfAssociatedLocs;
  id v5 = a3;
  [v5 encodeInteger:numOfAssociatedLocs forKey:@"NumOfAssociatedLocs"];
  [v5 encodeDouble:@"Duration" forKey:self->_duration];
  [v5 encodeDouble:@"Distance" forKey:self->_distance];
  [v5 encodeObject:self->_sampledObservedLocations forKey:@"SampledObservedLocations"];
  [v5 encodeObject:self->_latestAdvertisement forKey:@"LatestAdvertisement"];
  [v5 encodeObject:self->_settings forKey:@"Settings"];
  [v5 encodeObject:self->_durationPerMotionState forKey:@"DurationPerMotionState"];
}

- (unint64_t)numOfAssociatedLocs
{
  return self->_numOfAssociatedLocs;
}

- (double)duration
{
  return self->_duration;
}

- (double)distance
{
  return self->_distance;
}

- (TASPAdvertisement)latestAdvertisement
{
  return self->_latestAdvertisement;
}

- (BOOL)segmentSpeedExceedsLimit
{
  return self->_segmentSpeedExceedsLimit;
}

- (void)setSegmentSpeedExceedsLimit:(BOOL)a3
{
  self->_segmentSpeedExceedsLimit = a3;
}

- (NSDictionary)durationPerMotionState
{
  return self->_durationPerMotionState;
}

- (TAInterVisitMetricPerDeviceSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (NSArray)sampledObservedLocations
{
  return self->_sampledObservedLocations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampledObservedLocations, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_durationPerMotionState, 0);
  objc_storeStrong((id *)&self->_latestAdvertisement, 0);
}

- (void)description
{
  id v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22345C000, v4, v5, "%@ instance failed to create description:%@", v6, v7, v8, v9, v10);
}

@end