@interface TRIExperimentCovariates
- (TRIExperimentCovariates)initWithExperimentRecord:(id)a3;
- (id)dictionary;
- (id)tri_contextValueWithName:(id)a3;
- (unint64_t)_isExperimentActivated:(id)a3;
@end

@implementation TRIExperimentCovariates

- (TRIExperimentCovariates)initWithExperimentRecord:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIExperimentCovariates;
  v6 = [(TRIExperimentCovariates *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_experimentRecord, a3);
  }

  return v7;
}

- (id)tri_contextValueWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(TRIExperimentCovariates *)self dictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    objc_super v9 = [NSString stringWithFormat:@"The experiment covariates do not contain the key %@", v4];
    id v10 = [v8 exceptionWithName:@"KeyNotFoundException" reason:v9 userInfo:0];

    objc_exception_throw(v10);
  }

  return v6;
}

- (id)dictionary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  dictionary = v2->_dictionary;
  if (!dictionary)
  {
    objc_super v9 = @"IsActivated";
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TRIExperimentCovariates _isExperimentActivated:](v2, "_isExperimentActivated:", v2->_experimentRecord));
    v10[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v6 = v2->_dictionary;
    v2->_dictionary = (NSDictionary *)v5;

    dictionary = v2->_dictionary;
  }
  v7 = dictionary;
  objc_sync_exit(v2);

  return v7;
}

- (unint64_t)_isExperimentActivated:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 status] == 1 || objc_msgSend(v3, "status") == 3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_experimentRecord, 0);
}

@end