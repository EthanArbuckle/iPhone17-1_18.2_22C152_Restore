@interface PGMeaningLocationMobilityCriteria
+ (id)criteriaKey;
+ (id)criteriaWithDictionary:(id)a3;
- (BOOL)isValid;
- (BOOL)passesForAssets:(id)a3;
- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4;
- (NSString)description;
- (NSString)locationMobilityLabel;
- (unint64_t)locationMobilityType;
- (void)setLocationMobilityLabel:(id)a3;
- (void)setLocationMobilityType:(unint64_t)a3;
@end

@implementation PGMeaningLocationMobilityCriteria

+ (id)criteriaWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 objectForKeyedSubscript:@"locationMobility"];

  objc_msgSend(v5, "setLocationMobilityType:", +[PGGraphMobilityNode mobilityTypeForMobilityLabel:](PGGraphMobilityNode, "mobilityTypeForMobilityLabel:", v6));
  [v5 setLocationMobilityLabel:v6];

  return v5;
}

+ (id)criteriaKey
{
  return @"LocationMobility";
}

- (void).cxx_destruct
{
}

- (void)setLocationMobilityLabel:(id)a3
{
}

- (NSString)locationMobilityLabel
{
  return self->_locationMobilityLabel;
}

- (void)setLocationMobilityType:(unint64_t)a3
{
  self->_locationMobilityType = a3;
}

- (unint64_t)locationMobilityType
{
  return self->_locationMobilityType;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(PGMeaningLocationMobilityCriteria *)self locationMobilityLabel];
  id v4 = [v2 stringWithFormat:@"locationMobilityLabel: %@\n", v3];

  return (NSString *)v4;
}

- (BOOL)isValid
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PGMeaningLocationMobilityCriteria *)self locationMobilityType];
  if (!v3)
  {
    id v4 = +[PGLogging sharedLogging];
    id v5 = [v4 loggingConnection];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [(PGMeaningLocationMobilityCriteria *)self locationMobilityLabel];
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1D1805000, v5, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid mobility type \"%@\"", (uint8_t *)&v8, 0xCu);
    }
  }
  return v3 != 0;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v5 = a3;
  if ([(PGMeaningLocationMobilityCriteria *)self locationMobilityType])
  {
    uint64_t v6 = [v5 locationMobilityType];
    BOOL v7 = v6 == [(PGMeaningLocationMobilityCriteria *)self locationMobilityType];
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

@end