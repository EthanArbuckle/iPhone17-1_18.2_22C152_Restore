@interface nccp_wra_qmaxp_seq_modelOutput
- (MLMultiArray)nccp_wra_qmaxp_q10_forecast;
- (MLMultiArray)nccp_wra_qmaxp_q25_forecast;
- (MLMultiArray)nccp_wra_qmaxp_q50_forecast;
- (MLMultiArray)nccp_wra_qmaxp_q75_forecast;
- (MLMultiArray)nccp_wra_qmaxp_q90_forecast;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (nccp_wra_qmaxp_seq_modelOutput)initWithNccp_wra_qmaxp_q10_forecast:(id)a3 nccp_wra_qmaxp_q25_forecast:(id)a4 nccp_wra_qmaxp_q50_forecast:(id)a5 nccp_wra_qmaxp_q75_forecast:(id)a6 nccp_wra_qmaxp_q90_forecast:(id)a7;
- (void)setNccp_wra_qmaxp_q10_forecast:(id)a3;
- (void)setNccp_wra_qmaxp_q25_forecast:(id)a3;
- (void)setNccp_wra_qmaxp_q50_forecast:(id)a3;
- (void)setNccp_wra_qmaxp_q75_forecast:(id)a3;
- (void)setNccp_wra_qmaxp_q90_forecast:(id)a3;
@end

@implementation nccp_wra_qmaxp_seq_modelOutput

- (nccp_wra_qmaxp_seq_modelOutput)initWithNccp_wra_qmaxp_q10_forecast:(id)a3 nccp_wra_qmaxp_q25_forecast:(id)a4 nccp_wra_qmaxp_q50_forecast:(id)a5 nccp_wra_qmaxp_q75_forecast:(id)a6 nccp_wra_qmaxp_q90_forecast:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)nccp_wra_qmaxp_seq_modelOutput;
  v17 = [(nccp_wra_qmaxp_seq_modelOutput *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_nccp_wra_qmaxp_q10_forecast, a3);
    objc_storeStrong((id *)&v18->_nccp_wra_qmaxp_q25_forecast, a4);
    objc_storeStrong((id *)&v18->_nccp_wra_qmaxp_q50_forecast, a5);
    objc_storeStrong((id *)&v18->_nccp_wra_qmaxp_q75_forecast, a6);
    objc_storeStrong((id *)&v18->_nccp_wra_qmaxp_q90_forecast, a7);
  }

  return v18;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_100033520];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"nccp_wra_qmaxp_q10_forecast"])
  {
    uint64_t v5 = [(nccp_wra_qmaxp_seq_modelOutput *)self nccp_wra_qmaxp_q10_forecast];
LABEL_11:
    v6 = (void *)v5;
    v7 = +[MLFeatureValue featureValueWithMultiArray:v5];

    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"nccp_wra_qmaxp_q25_forecast"])
  {
    uint64_t v5 = [(nccp_wra_qmaxp_seq_modelOutput *)self nccp_wra_qmaxp_q25_forecast];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"nccp_wra_qmaxp_q50_forecast"])
  {
    uint64_t v5 = [(nccp_wra_qmaxp_seq_modelOutput *)self nccp_wra_qmaxp_q50_forecast];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"nccp_wra_qmaxp_q75_forecast"])
  {
    uint64_t v5 = [(nccp_wra_qmaxp_seq_modelOutput *)self nccp_wra_qmaxp_q75_forecast];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"nccp_wra_qmaxp_q90_forecast"])
  {
    uint64_t v5 = [(nccp_wra_qmaxp_seq_modelOutput *)self nccp_wra_qmaxp_q90_forecast];
    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (MLMultiArray)nccp_wra_qmaxp_q10_forecast
{
  return self->_nccp_wra_qmaxp_q10_forecast;
}

- (void)setNccp_wra_qmaxp_q10_forecast:(id)a3
{
}

- (MLMultiArray)nccp_wra_qmaxp_q25_forecast
{
  return self->_nccp_wra_qmaxp_q25_forecast;
}

- (void)setNccp_wra_qmaxp_q25_forecast:(id)a3
{
}

- (MLMultiArray)nccp_wra_qmaxp_q50_forecast
{
  return self->_nccp_wra_qmaxp_q50_forecast;
}

- (void)setNccp_wra_qmaxp_q50_forecast:(id)a3
{
}

- (MLMultiArray)nccp_wra_qmaxp_q75_forecast
{
  return self->_nccp_wra_qmaxp_q75_forecast;
}

- (void)setNccp_wra_qmaxp_q75_forecast:(id)a3
{
}

- (MLMultiArray)nccp_wra_qmaxp_q90_forecast
{
  return self->_nccp_wra_qmaxp_q90_forecast;
}

- (void)setNccp_wra_qmaxp_q90_forecast:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q90_forecast, 0);
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q75_forecast, 0);
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q50_forecast, 0);
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q25_forecast, 0);

  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q10_forecast, 0);
}

@end