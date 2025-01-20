@interface NTKHeartRateSignatureRectangularModel
- (HKHeartRateSummary)mostRecentHeartRateSummary;
- (void)manager:(id)a3 receivedLatestHeartRateSummary:(id)a4;
- (void)setMostRecentHeartRateSummary:(id)a3;
@end

@implementation NTKHeartRateSignatureRectangularModel

- (void)manager:(id)a3 receivedLatestHeartRateSummary:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v6 = (HKHeartRateSummary *)a4;
  if (self->_mostRecentHeartRateSummary != v6)
  {
    objc_storeStrong((id *)&self->_mostRecentHeartRateSummary, a4);
    v7 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      id v9 = v8;
      v10 = [(HKHeartRateSummary *)v6 heartRateDateInterval];
      int v12 = 138543618;
      v13 = v8;
      __int16 v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: updated heart rate summary %{public}@", (uint8_t *)&v12, 0x16u);
    }
    v11 = [(NTKHeartRateModel *)self delegate];
    [v11 model:self updatedSummary:v6];
  }
}

- (HKHeartRateSummary)mostRecentHeartRateSummary
{
  return self->_mostRecentHeartRateSummary;
}

- (void)setMostRecentHeartRateSummary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end