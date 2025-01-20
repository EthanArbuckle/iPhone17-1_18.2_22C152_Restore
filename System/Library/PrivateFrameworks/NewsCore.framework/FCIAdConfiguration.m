@interface FCIAdConfiguration
- (BOOL)areSegmentsEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreRequestPolicyValidationEnabled;
- (FCIAdConfiguration)initWithConfigDictionary:(id)a3;
- (FCIAdConfiguration)initWithPBIAdConfig:(id)a3;
- (NSArray)iAdSegmentIDs;
- (NSDictionary)adStatusConditionsByType;
- (double)articleNumberOfViewportsBetweenAds;
- (double)feedNumberOfViewportsBetweenAds;
- (double)segmentsMinRelativeRate;
- (double)segmentsThreshold;
- (int64_t)segmentsHistoryWindowInterval;
- (int64_t)segmentsMinimumArticleCount;
- (int64_t)segmentsMinimumEventCount;
- (int64_t)segmentsSubmissionFrequency;
- (unint64_t)hash;
@end

@implementation FCIAdConfiguration

- (NSDictionary)adStatusConditionsByType
{
  return self->_adStatusConditionsByType;
}

- (FCIAdConfiguration)initWithConfigDictionary:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCIAdConfiguration;
  v6 = [(FCIAdConfiguration *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configDict, a3);
    v7->_segmentsEnabled = FCAppConfigurationBoolValue(v5, @"segmentsEnabled", 1);
    v7->_segmentsThreshold = FCAppConfigurationDoubleValue(v5, @"segmentsThreshold", 0.15);
    v7->_segmentsSubmissionFrequency = FCAppConfigurationIntegerValue(v5, @"segmentsSubmissionFrequency", 1296000);
    v7->_segmentsHistoryWindowInterval = FCAppConfigurationIntegerValue(v5, @"segmentsHistoryWindowInterval", 1296000);
    v7->_segmentsMinimumArticleCount = FCAppConfigurationIntegerValue(v5, @"segmentsMinimumArticleCount", 10);
    v7->_segmentsMinimumEventCount = FCAppConfigurationIntegerValue(v5, @"segmentsMinimumEventCount", 20);
    v7->_segmentsMinRelativeRate = FCAppConfigurationDoubleValue(v5, @"segmentsMinimumEventCount", 0.75);
    v8 = [MEMORY[0x1E4F1C978] array];
    uint64_t v9 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"iAdSegmentIds", v8);
    iAdSegmentIDs = v7->_iAdSegmentIDs;
    v7->_iAdSegmentIDs = (NSArray *)v9;

    v11 = [MEMORY[0x1E4F1C978] array];
    v12 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"adStatusConditions", v11);

    uint64_t v13 = +[FCAdStatusCondition adStatusConditionsFromConditionsArray:v12];
    adStatusConditionsByType = v7->_adStatusConditionsByType;
    v7->_adStatusConditionsByType = (NSDictionary *)v13;

    v7->_feedNumberOfViewportsBetweenAds = FCAppConfigurationDoubleValue(v5, @"feedNumberofViewportsBetweenAds", 1.0);
    v7->_articleNumberOfViewportsBetweenAds = FCAppConfigurationDoubleValue(v5, @"articleNumberofViewportsBetweenAds", 1.0);
    v7->_preRequestPolicyValidationEnabled = FCAppConfigurationBoolValue(v5, @"preRequestPolicyValidationEnabled", 0);
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adStatusConditionsByType, 0);
  objc_storeStrong((id *)&self->_iAdSegmentIDs, 0);
  objc_storeStrong((id *)&self->_configDict, 0);
  objc_storeStrong((id *)&self->_pbConfig, 0);
}

- (FCIAdConfiguration)initWithPBIAdConfig:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCIAdConfiguration;
  v6 = [(FCIAdConfiguration *)&v17 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_pbConfig, a3);
      v7->_segmentsEnabled = [v5 segmentsEnabled];
      [v5 segmentsThreshold];
      v7->_segmentsThreshold = v8;
      v7->_segmentsSubmissionFrequency = [v5 segmentsSubmissionFrequency];
      v7->_segmentsHistoryWindowInterval = [v5 segmentsHistoryWindowInterval];
      v7->_segmentsMinimumArticleCount = [v5 segmentsMinimumArticleCount];
      iAdSegmentIDs = v7->_iAdSegmentIDs;
      v7->_iAdSegmentIDs = 0;

      adStatusConditionsByType = v7->_adStatusConditionsByType;
      v7->_adStatusConditionsByType = 0;

      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)&v7->_feedNumberOfViewportsBetweenAds = _Q0;
      v7->_preRequestPolicyValidationEnabled = 0;
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  v6 = v5;

  if (v6 && objc_msgSend(MEMORY[0x1E4FBA8A8], "nf_object:isEqualToObject:", self->_pbConfig, v6[1])) {
    char v7 = objc_msgSend(MEMORY[0x1E4FBA8A8], "nf_object:isEqualToObject:", self->_configDict, v6[2]);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NTPBIAdConfig *)self->_pbConfig hash];
  return [(NSDictionary *)self->_configDict hash] ^ v3;
}

- (BOOL)areSegmentsEnabled
{
  return self->_segmentsEnabled;
}

- (double)segmentsThreshold
{
  return self->_segmentsThreshold;
}

- (int64_t)segmentsSubmissionFrequency
{
  return self->_segmentsSubmissionFrequency;
}

- (int64_t)segmentsHistoryWindowInterval
{
  return self->_segmentsHistoryWindowInterval;
}

- (int64_t)segmentsMinimumArticleCount
{
  return self->_segmentsMinimumArticleCount;
}

- (int64_t)segmentsMinimumEventCount
{
  return self->_segmentsMinimumEventCount;
}

- (double)segmentsMinRelativeRate
{
  return self->_segmentsMinRelativeRate;
}

- (NSArray)iAdSegmentIDs
{
  return self->_iAdSegmentIDs;
}

- (double)feedNumberOfViewportsBetweenAds
{
  return self->_feedNumberOfViewportsBetweenAds;
}

- (double)articleNumberOfViewportsBetweenAds
{
  return self->_articleNumberOfViewportsBetweenAds;
}

- (BOOL)isPreRequestPolicyValidationEnabled
{
  return self->_preRequestPolicyValidationEnabled;
}

@end