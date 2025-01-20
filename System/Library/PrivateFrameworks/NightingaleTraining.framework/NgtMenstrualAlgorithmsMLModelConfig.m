@interface NgtMenstrualAlgorithmsMLModelConfig
+ (BOOL)supportsSecureCoding;
- (NSArray)heartRatePeriodTFModelPaths;
- (NSString)heartRateFwEnd10PctModelPath;
- (NSString)heartRatePeriod10PctModelPath;
- (NSString)heartRatePeriodEnsembleModelPath;
- (NSString)wTmpFwEndLstmModelPath;
- (NSString)wTmpFwEndRFModelPath;
- (NSString)wTmpPeriodLstmModelPath;
- (NgtMenstrualAlgorithmsMLModelConfig)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHeartRateFwEnd10PctModelPath:(id)a3;
- (void)setHeartRatePeriod10PctModelPath:(id)a3;
- (void)setHeartRatePeriodEnsembleModelPath:(id)a3;
- (void)setHeartRatePeriodTFModelPaths:(id)a3;
- (void)setWTmpFwEndLstmModelPath:(id)a3;
- (void)setWTmpFwEndRFModelPath:(id)a3;
- (void)setWTmpPeriodLstmModelPath:(id)a3;
@end

@implementation NgtMenstrualAlgorithmsMLModelConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NgtMenstrualAlgorithmsMLModelConfig)initWithCoder:(id)a3
{
  v40[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)NgtMenstrualAlgorithmsMLModelConfig;
  v5 = [(NgtMenstrualAlgorithmsMLModelConfig *)&v39 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_heartRateFwEnd10PctModelPath);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    heartRateFwEnd10PctModelPath = v5->_heartRateFwEnd10PctModelPath;
    v5->_heartRateFwEnd10PctModelPath = (NSString *)v11;

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector(sel_heartRatePeriod10PctModelPath);
    uint64_t v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    heartRatePeriod10PctModelPath = v5->_heartRatePeriod10PctModelPath;
    v5->_heartRatePeriod10PctModelPath = (NSString *)v15;

    uint64_t v17 = objc_opt_class();
    v18 = NSStringFromSelector(sel_wTmpFwEndLstmModelPath);
    uint64_t v19 = [v4 decodeObjectOfClass:v17 forKey:v18];
    wTmpFwEndLstmModelPath = v5->_wTmpFwEndLstmModelPath;
    v5->_wTmpFwEndLstmModelPath = (NSString *)v19;

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector(sel_wTmpFwEndRFModelPath);
    uint64_t v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    wTmpFwEndRFModelPath = v5->_wTmpFwEndRFModelPath;
    v5->_wTmpFwEndRFModelPath = (NSString *)v23;

    uint64_t v25 = objc_opt_class();
    v26 = NSStringFromSelector(sel_wTmpPeriodLstmModelPath);
    uint64_t v27 = [v4 decodeObjectOfClass:v25 forKey:v26];
    wTmpPeriodLstmModelPath = v5->_wTmpPeriodLstmModelPath;
    v5->_wTmpPeriodLstmModelPath = (NSString *)v27;

    uint64_t v29 = objc_opt_class();
    v30 = NSStringFromSelector(sel_heartRatePeriodTFModelPaths);
    uint64_t v31 = [v4 decodeObjectOfClass:v29 forKey:v30];
    heartRatePeriodTFModelPaths = v5->_heartRatePeriodTFModelPaths;
    v5->_heartRatePeriodTFModelPaths = (NSArray *)v31;

    uint64_t v33 = objc_opt_class();
    v34 = NSStringFromSelector(sel_heartRatePeriodEnsembleModelPath);
    uint64_t v35 = [v4 decodeObjectOfClass:v33 forKey:v34];
    heartRatePeriodEnsembleModelPath = v5->_heartRatePeriodEnsembleModelPath;
    v5->_heartRatePeriodEnsembleModelPath = (NSString *)v35;

    v37 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  heartRateFwEnd10PctModelPath = self->_heartRateFwEnd10PctModelPath;
  v5 = NSStringFromSelector(sel_heartRateFwEnd10PctModelPath);
  [v18 encodeObject:heartRateFwEnd10PctModelPath forKey:v5];

  heartRatePeriod10PctModelPath = self->_heartRatePeriod10PctModelPath;
  v7 = NSStringFromSelector(sel_heartRatePeriod10PctModelPath);
  [v18 encodeObject:heartRatePeriod10PctModelPath forKey:v7];

  wTmpFwEndLstmModelPath = self->_wTmpFwEndLstmModelPath;
  uint64_t v9 = NSStringFromSelector(sel_wTmpFwEndLstmModelPath);
  [v18 encodeObject:wTmpFwEndLstmModelPath forKey:v9];

  wTmpFwEndRFModelPath = self->_wTmpFwEndRFModelPath;
  uint64_t v11 = NSStringFromSelector(sel_wTmpFwEndRFModelPath);
  [v18 encodeObject:wTmpFwEndRFModelPath forKey:v11];

  wTmpPeriodLstmModelPath = self->_wTmpPeriodLstmModelPath;
  uint64_t v13 = NSStringFromSelector(sel_wTmpPeriodLstmModelPath);
  [v18 encodeObject:wTmpPeriodLstmModelPath forKey:v13];

  heartRatePeriodTFModelPaths = self->_heartRatePeriodTFModelPaths;
  uint64_t v15 = NSStringFromSelector(sel_heartRatePeriodTFModelPaths);
  [v18 encodeObject:heartRatePeriodTFModelPaths forKey:v15];

  heartRatePeriodEnsembleModelPath = self->_heartRatePeriodEnsembleModelPath;
  uint64_t v17 = NSStringFromSelector(sel_heartRatePeriodEnsembleModelPath);
  [v18 encodeObject:heartRatePeriodEnsembleModelPath forKey:v17];
}

- (NSString)heartRateFwEnd10PctModelPath
{
  return self->_heartRateFwEnd10PctModelPath;
}

- (void)setHeartRateFwEnd10PctModelPath:(id)a3
{
}

- (NSString)heartRatePeriod10PctModelPath
{
  return self->_heartRatePeriod10PctModelPath;
}

- (void)setHeartRatePeriod10PctModelPath:(id)a3
{
}

- (NSString)wTmpFwEndLstmModelPath
{
  return self->_wTmpFwEndLstmModelPath;
}

- (void)setWTmpFwEndLstmModelPath:(id)a3
{
}

- (NSString)wTmpFwEndRFModelPath
{
  return self->_wTmpFwEndRFModelPath;
}

- (void)setWTmpFwEndRFModelPath:(id)a3
{
}

- (NSString)wTmpPeriodLstmModelPath
{
  return self->_wTmpPeriodLstmModelPath;
}

- (void)setWTmpPeriodLstmModelPath:(id)a3
{
}

- (NSArray)heartRatePeriodTFModelPaths
{
  return self->_heartRatePeriodTFModelPaths;
}

- (void)setHeartRatePeriodTFModelPaths:(id)a3
{
}

- (NSString)heartRatePeriodEnsembleModelPath
{
  return self->_heartRatePeriodEnsembleModelPath;
}

- (void)setHeartRatePeriodEnsembleModelPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRatePeriodEnsembleModelPath, 0);
  objc_storeStrong((id *)&self->_heartRatePeriodTFModelPaths, 0);
  objc_storeStrong((id *)&self->_wTmpPeriodLstmModelPath, 0);
  objc_storeStrong((id *)&self->_wTmpFwEndRFModelPath, 0);
  objc_storeStrong((id *)&self->_wTmpFwEndLstmModelPath, 0);
  objc_storeStrong((id *)&self->_heartRatePeriod10PctModelPath, 0);
  objc_storeStrong((id *)&self->_heartRateFwEnd10PctModelPath, 0);
}

@end