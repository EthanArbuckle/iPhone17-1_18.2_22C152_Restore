@interface NgtMenstrualAlgorithmsAnalysis
+ (BOOL)supportsSecureCoding;
- (BOOL)isUserInactive;
- (NSArray)fertilityPredictions;
- (NSArray)menstruationPredictions;
- (NgtMenstrualAlgorithmsAnalysis)init;
- (NgtMenstrualAlgorithmsAnalysis)initWithCoder:(id)a3;
- (NgtMenstrualAlgorithmsDeviationAnalysis)deviationAnalysis;
- (NgtMenstrualAlgorithmsStats)stats;
- (NgtMenstrualAlgorithmsTelemetry)telemetry;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviationAnalysis:(id)a3;
- (void)setFertilityPredictions:(id)a3;
- (void)setIsUserInactive:(BOOL)a3;
- (void)setMenstruationPredictions:(id)a3;
- (void)setStats:(id)a3;
- (void)setTelemetry:(id)a3;
@end

@implementation NgtMenstrualAlgorithmsAnalysis

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NgtMenstrualAlgorithmsAnalysis)init
{
  v13.receiver = self;
  v13.super_class = (Class)NgtMenstrualAlgorithmsAnalysis;
  v2 = [(NgtMenstrualAlgorithmsAnalysis *)&v13 init];
  v3 = v2;
  if (v2)
  {
    menstruationPredictions = v2->_menstruationPredictions;
    v5 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_menstruationPredictions = (NSArray *)MEMORY[0x263EFFA68];

    fertilityPredictions = v3->_fertilityPredictions;
    v3->_fertilityPredictions = v5;

    uint64_t v7 = objc_opt_new();
    stats = v3->_stats;
    v3->_stats = (NgtMenstrualAlgorithmsStats *)v7;

    uint64_t v9 = objc_opt_new();
    deviationAnalysis = v3->_deviationAnalysis;
    v3->_deviationAnalysis = (NgtMenstrualAlgorithmsDeviationAnalysis *)v9;

    v11 = v3;
  }

  return v3;
}

- (NgtMenstrualAlgorithmsAnalysis)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NgtMenstrualAlgorithmsAnalysis *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = NSStringFromSelector(sel_menstruationPredictions);
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    menstruationPredictions = v5->_menstruationPredictions;
    v5->_menstruationPredictions = (NSArray *)v10;

    v12 = NSStringFromSelector(sel_fertilityPredictions);
    uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:v12];
    fertilityPredictions = v5->_fertilityPredictions;
    v5->_fertilityPredictions = (NSArray *)v13;

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector(sel_stats);
    uint64_t v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    stats = v5->_stats;
    v5->_stats = (NgtMenstrualAlgorithmsStats *)v17;

    uint64_t v19 = objc_opt_class();
    v20 = NSStringFromSelector(sel_deviationAnalysis);
    uint64_t v21 = [v4 decodeObjectOfClass:v19 forKey:v20];
    deviationAnalysis = v5->_deviationAnalysis;
    v5->_deviationAnalysis = (NgtMenstrualAlgorithmsDeviationAnalysis *)v21;

    v23 = NSStringFromSelector(sel_isUserInactive);
    v5->_isUserInactive = [v4 decodeBoolForKey:v23];

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  menstruationPredictions = self->_menstruationPredictions;
  v5 = NSStringFromSelector(sel_menstruationPredictions);
  [v13 encodeObject:menstruationPredictions forKey:v5];

  fertilityPredictions = self->_fertilityPredictions;
  uint64_t v7 = NSStringFromSelector(sel_fertilityPredictions);
  [v13 encodeObject:fertilityPredictions forKey:v7];

  stats = self->_stats;
  uint64_t v9 = NSStringFromSelector(sel_stats);
  [v13 encodeObject:stats forKey:v9];

  deviationAnalysis = self->_deviationAnalysis;
  v11 = NSStringFromSelector(sel_deviationAnalysis);
  [v13 encodeObject:deviationAnalysis forKey:v11];

  LODWORD(v11) = self->_isUserInactive;
  v12 = NSStringFromSelector(sel_isUserInactive);
  [v13 encodeBool:v11 != 0 forKey:v12];
}

- (NSArray)menstruationPredictions
{
  return self->_menstruationPredictions;
}

- (void)setMenstruationPredictions:(id)a3
{
}

- (NSArray)fertilityPredictions
{
  return self->_fertilityPredictions;
}

- (void)setFertilityPredictions:(id)a3
{
}

- (NgtMenstrualAlgorithmsStats)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
}

- (NgtMenstrualAlgorithmsDeviationAnalysis)deviationAnalysis
{
  return self->_deviationAnalysis;
}

- (void)setDeviationAnalysis:(id)a3
{
}

- (NgtMenstrualAlgorithmsTelemetry)telemetry
{
  return self->_telemetry;
}

- (void)setTelemetry:(id)a3
{
}

- (BOOL)isUserInactive
{
  return self->_isUserInactive;
}

- (void)setIsUserInactive:(BOOL)a3
{
  self->_isUserInactive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetry, 0);
  objc_storeStrong((id *)&self->_deviationAnalysis, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_fertilityPredictions, 0);
  objc_storeStrong((id *)&self->_menstruationPredictions, 0);
}

@end