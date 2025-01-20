@interface UAFExperimentalAssetsConfiguration
+ (BOOL)isValid:(id)a3 error:(id *)a4;
- (NSString)trialFactor;
- (NSString)trialNamespace;
- (NSString)trialProject;
- (UAFExperimentalAssetsConfiguration)initWithDictionary:(id)a3;
- (void)setTrialFactor:(id)a3;
- (void)setTrialNamespace:(id)a3;
- (void)setTrialProject:(id)a3;
@end

@implementation UAFExperimentalAssetsConfiguration

- (UAFExperimentalAssetsConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UAFExperimentalAssetsConfiguration;
  v5 = [(UAFExperimentalAssetsConfiguration *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"TrialProject"];
    trialProject = v5->_trialProject;
    v5->_trialProject = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"TrialNamespace"];
    trialNamespace = v5->_trialNamespace;
    v5->_trialNamespace = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"TrialFactor"];
    trialFactor = v5->_trialFactor;
    v5->_trialFactor = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

+ (BOOL)isValid:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = +[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5, @"TrialProject", objc_opt_class(), 1, a4)&& +[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5, @"TrialNamespace", objc_opt_class(), 1, a4)&& +[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5,
         @"TrialFactor",
         objc_opt_class(),
         1,
         a4);

  return v6;
}

- (NSString)trialProject
{
  return self->_trialProject;
}

- (NSString)trialNamespace
{
  return self->_trialNamespace;
}

- (NSString)trialFactor
{
  return self->_trialFactor;
}

- (void)setTrialProject:(id)a3
{
}

- (void)setTrialNamespace:(id)a3
{
}

- (void)setTrialFactor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialFactor, 0);
  objc_storeStrong((id *)&self->_trialNamespace, 0);

  objc_storeStrong((id *)&self->_trialProject, 0);
}

@end