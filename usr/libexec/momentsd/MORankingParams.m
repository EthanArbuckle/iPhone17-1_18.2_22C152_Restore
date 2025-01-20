@interface MORankingParams
- (BOOL)isEvergreenEngagementScoreParamsUpdateOnHold;
- (BOOL)isParamsUpdateOnHold;
- (NSDate)engagementScoreParamsUpdateDate;
- (NSDate)evergreenEngagementScoreParamsUpdateDate;
- (float)activityInterfaceTypeEngagementWeight;
- (float)clusteringInterfaceTypeEngagementWeight;
- (float)creativityEvergreenTypeEngagementWeight;
- (float)evergreenInterfaceTypeEngagementWeight;
- (float)gratitudeEvergreenTypeEngagementWeight;
- (float)kindnessEvergreenTypeEngagementWeight;
- (float)outingInterfaceTypeEngagementWeight;
- (float)photoMemoryInterfaceTypeEngagementWeight;
- (float)photoMomentInterfaceTypeEngagementWeight;
- (float)purposeEvergreenTypeEngagementWeight;
- (float)resilienceEvergreenTypeEngagementWeight;
- (float)significantContactInterfaceTypeEngagementWeight;
- (float)stateOfMindInterfaceTypeEngagementWeight;
- (float)timeContextInterfaceTypeEngagementWeight;
- (float)topicsOfInterestInterfaceTypeEngagementWeight;
- (float)trendInterfaceTypeEngagementWeight;
- (float)tripInterfaceTypeEngagementWeight;
- (float)wisdomEvergreenTypeEngagementWeight;
- (float)yourMediaInterfaceTypeEngagementWeight;
- (float)yourSharedContentInterfaceTypeEngagementWeight;
- (float)yourTimeAtHomeInterfaceTypeEngagementWeight;
- (void)setActivityInterfaceTypeEngagementWeight:(float)a3;
- (void)setClusteringInterfaceTypeEngagementWeight:(float)a3;
- (void)setCreativityEvergreenTypeEngagementWeight:(float)a3;
- (void)setEngagementScoreParamsUpdateDate:(id)a3;
- (void)setEvergreenEngagementScoreParamsUpdateDate:(id)a3;
- (void)setEvergreenInterfaceTypeEngagementWeight:(float)a3;
- (void)setGratitudeEvergreenTypeEngagementWeight:(float)a3;
- (void)setIsEvergreenEngagementScoreParamsUpdateOnHold:(BOOL)a3;
- (void)setIsParamsUpdateOnHold:(BOOL)a3;
- (void)setKindnessEvergreenTypeEngagementWeight:(float)a3;
- (void)setOutingInterfaceTypeEngagementWeight:(float)a3;
- (void)setPhotoMemoryInterfaceTypeEngagementWeight:(float)a3;
- (void)setPhotoMomentInterfaceTypeEngagementWeight:(float)a3;
- (void)setPurposeEvergreenTypeEngagementWeight:(float)a3;
- (void)setResilienceEvergreenTypeEngagementWeight:(float)a3;
- (void)setSignificantContactInterfaceTypeEngagementWeight:(float)a3;
- (void)setStateOfMindInterfaceTypeEngagementWeight:(float)a3;
- (void)setTimeContextInterfaceTypeEngagementWeight:(float)a3;
- (void)setTopicsOfInterestInterfaceTypeEngagementWeight:(float)a3;
- (void)setTrendInterfaceTypeEngagementWeight:(float)a3;
- (void)setTripInterfaceTypeEngagementWeight:(float)a3;
- (void)setWisdomEvergreenTypeEngagementWeight:(float)a3;
- (void)setYourMediaInterfaceTypeEngagementWeight:(float)a3;
- (void)setYourSharedContentInterfaceTypeEngagementWeight:(float)a3;
- (void)setYourTimeAtHomeInterfaceTypeEngagementWeight:(float)a3;
@end

@implementation MORankingParams

- (NSDate)engagementScoreParamsUpdateDate
{
  return self->_engagementScoreParamsUpdateDate;
}

- (void)setEngagementScoreParamsUpdateDate:(id)a3
{
}

- (float)activityInterfaceTypeEngagementWeight
{
  return self->_activityInterfaceTypeEngagementWeight;
}

- (void)setActivityInterfaceTypeEngagementWeight:(float)a3
{
  self->_activityInterfaceTypeEngagementWeight = a3;
}

- (float)outingInterfaceTypeEngagementWeight
{
  return self->_outingInterfaceTypeEngagementWeight;
}

- (void)setOutingInterfaceTypeEngagementWeight:(float)a3
{
  self->_outingInterfaceTypeEngagementWeight = a3;
}

- (float)photoMomentInterfaceTypeEngagementWeight
{
  return self->_photoMomentInterfaceTypeEngagementWeight;
}

- (void)setPhotoMomentInterfaceTypeEngagementWeight:(float)a3
{
  self->_photoMomentInterfaceTypeEngagementWeight = a3;
}

- (float)significantContactInterfaceTypeEngagementWeight
{
  return self->_significantContactInterfaceTypeEngagementWeight;
}

- (void)setSignificantContactInterfaceTypeEngagementWeight:(float)a3
{
  self->_significantContactInterfaceTypeEngagementWeight = a3;
}

- (float)yourMediaInterfaceTypeEngagementWeight
{
  return self->_yourMediaInterfaceTypeEngagementWeight;
}

- (void)setYourMediaInterfaceTypeEngagementWeight:(float)a3
{
  self->_yourMediaInterfaceTypeEngagementWeight = a3;
}

- (float)yourSharedContentInterfaceTypeEngagementWeight
{
  return self->_yourSharedContentInterfaceTypeEngagementWeight;
}

- (void)setYourSharedContentInterfaceTypeEngagementWeight:(float)a3
{
  self->_yourSharedContentInterfaceTypeEngagementWeight = a3;
}

- (float)yourTimeAtHomeInterfaceTypeEngagementWeight
{
  return self->_yourTimeAtHomeInterfaceTypeEngagementWeight;
}

- (void)setYourTimeAtHomeInterfaceTypeEngagementWeight:(float)a3
{
  self->_yourTimeAtHomeInterfaceTypeEngagementWeight = a3;
}

- (float)topicsOfInterestInterfaceTypeEngagementWeight
{
  return self->_topicsOfInterestInterfaceTypeEngagementWeight;
}

- (void)setTopicsOfInterestInterfaceTypeEngagementWeight:(float)a3
{
  self->_topicsOfInterestInterfaceTypeEngagementWeight = a3;
}

- (float)trendInterfaceTypeEngagementWeight
{
  return self->_trendInterfaceTypeEngagementWeight;
}

- (void)setTrendInterfaceTypeEngagementWeight:(float)a3
{
  self->_trendInterfaceTypeEngagementWeight = a3;
}

- (float)photoMemoryInterfaceTypeEngagementWeight
{
  return self->_photoMemoryInterfaceTypeEngagementWeight;
}

- (void)setPhotoMemoryInterfaceTypeEngagementWeight:(float)a3
{
  self->_photoMemoryInterfaceTypeEngagementWeight = a3;
}

- (float)evergreenInterfaceTypeEngagementWeight
{
  return self->_evergreenInterfaceTypeEngagementWeight;
}

- (void)setEvergreenInterfaceTypeEngagementWeight:(float)a3
{
  self->_evergreenInterfaceTypeEngagementWeight = a3;
}

- (float)timeContextInterfaceTypeEngagementWeight
{
  return self->_timeContextInterfaceTypeEngagementWeight;
}

- (void)setTimeContextInterfaceTypeEngagementWeight:(float)a3
{
  self->_timeContextInterfaceTypeEngagementWeight = a3;
}

- (float)tripInterfaceTypeEngagementWeight
{
  return self->_tripInterfaceTypeEngagementWeight;
}

- (void)setTripInterfaceTypeEngagementWeight:(float)a3
{
  self->_tripInterfaceTypeEngagementWeight = a3;
}

- (float)stateOfMindInterfaceTypeEngagementWeight
{
  return self->_stateOfMindInterfaceTypeEngagementWeight;
}

- (void)setStateOfMindInterfaceTypeEngagementWeight:(float)a3
{
  self->_stateOfMindInterfaceTypeEngagementWeight = a3;
}

- (float)clusteringInterfaceTypeEngagementWeight
{
  return self->_clusteringInterfaceTypeEngagementWeight;
}

- (void)setClusteringInterfaceTypeEngagementWeight:(float)a3
{
  self->_clusteringInterfaceTypeEngagementWeight = a3;
}

- (BOOL)isParamsUpdateOnHold
{
  return self->_isParamsUpdateOnHold;
}

- (void)setIsParamsUpdateOnHold:(BOOL)a3
{
  self->_isParamsUpdateOnHold = a3;
}

- (NSDate)evergreenEngagementScoreParamsUpdateDate
{
  return self->_evergreenEngagementScoreParamsUpdateDate;
}

- (void)setEvergreenEngagementScoreParamsUpdateDate:(id)a3
{
}

- (BOOL)isEvergreenEngagementScoreParamsUpdateOnHold
{
  return self->_isEvergreenEngagementScoreParamsUpdateOnHold;
}

- (void)setIsEvergreenEngagementScoreParamsUpdateOnHold:(BOOL)a3
{
  self->_isEvergreenEngagementScoreParamsUpdateOnHold = a3;
}

- (float)wisdomEvergreenTypeEngagementWeight
{
  return self->_wisdomEvergreenTypeEngagementWeight;
}

- (void)setWisdomEvergreenTypeEngagementWeight:(float)a3
{
  self->_wisdomEvergreenTypeEngagementWeight = a3;
}

- (float)gratitudeEvergreenTypeEngagementWeight
{
  return self->_gratitudeEvergreenTypeEngagementWeight;
}

- (void)setGratitudeEvergreenTypeEngagementWeight:(float)a3
{
  self->_gratitudeEvergreenTypeEngagementWeight = a3;
}

- (float)kindnessEvergreenTypeEngagementWeight
{
  return self->_kindnessEvergreenTypeEngagementWeight;
}

- (void)setKindnessEvergreenTypeEngagementWeight:(float)a3
{
  self->_kindnessEvergreenTypeEngagementWeight = a3;
}

- (float)purposeEvergreenTypeEngagementWeight
{
  return self->_purposeEvergreenTypeEngagementWeight;
}

- (void)setPurposeEvergreenTypeEngagementWeight:(float)a3
{
  self->_purposeEvergreenTypeEngagementWeight = a3;
}

- (float)resilienceEvergreenTypeEngagementWeight
{
  return self->_resilienceEvergreenTypeEngagementWeight;
}

- (void)setResilienceEvergreenTypeEngagementWeight:(float)a3
{
  self->_resilienceEvergreenTypeEngagementWeight = a3;
}

- (float)creativityEvergreenTypeEngagementWeight
{
  return self->_creativityEvergreenTypeEngagementWeight;
}

- (void)setCreativityEvergreenTypeEngagementWeight:(float)a3
{
  self->_creativityEvergreenTypeEngagementWeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evergreenEngagementScoreParamsUpdateDate, 0);

  objc_storeStrong((id *)&self->_engagementScoreParamsUpdateDate, 0);
}

@end