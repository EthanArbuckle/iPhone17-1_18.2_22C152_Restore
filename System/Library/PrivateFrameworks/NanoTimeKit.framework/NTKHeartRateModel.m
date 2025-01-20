@interface NTKHeartRateModel
- (HKQuantitySample)mostRecentHeartRate;
- (NTKHeartRateModel)initWithDelegate:(id)a3;
- (NTKHeartRateModelDelegate)delegate;
- (void)manager:(id)a3 receivedLatestHeartRateSample:(id)a4;
- (void)setMostRecentHeartRate:(id)a3;
@end

@implementation NTKHeartRateModel

- (NTKHeartRateModel)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKHeartRateModel;
  v5 = [(NTKHeartRateModel *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)manager:(id)a3 receivedLatestHeartRateSample:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = (HKQuantitySample *)a4;
  if (self->_mostRecentHeartRate != v6)
  {
    objc_storeStrong((id *)&self->_mostRecentHeartRate, a4);
    v7 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = (id)objc_opt_class();
      __int16 v12 = 2112;
      v13 = v6;
      id v8 = v11;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: updated heart rate %@", (uint8_t *)&v10, 0x16u);
    }
    v9 = [(NTKHeartRateModel *)self delegate];
    [v9 model:self updatedSample:v6];
  }
}

- (NTKHeartRateModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKHeartRateModelDelegate *)WeakRetained;
}

- (HKQuantitySample)mostRecentHeartRate
{
  return self->_mostRecentHeartRate;
}

- (void)setMostRecentHeartRate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentHeartRate, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end