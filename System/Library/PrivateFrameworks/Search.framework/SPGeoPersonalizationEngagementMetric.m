@interface SPGeoPersonalizationEngagementMetric
- (BOOL)geoResultWasTopHit;
- (BOOL)geoResultsViewed;
- (NSNumber)engagedGeoResultEntityRelevanceScore;
- (NSNumber)engagedGeoResultNumberOfVisits;
- (NSNumber)engagedGeoResultNumberOfVisitsGivenLocation;
- (NSNumber)engagedGeoResultPersonalizationType;
- (NSNumber)engagedGeoResultPosition;
- (NSNumber)engagedGeoResultTimeSinceLastVisit;
- (NSNumber)engagedGeoResultTimeUntilUpcomingEvent;
- (NSNumber)engagedResultWasTopHit;
- (NSNumber)firstGeoResultEntityRelevanceScore;
- (NSNumber)firstGeoResultIsCandidateForPromotion;
- (NSNumber)firstGeoResultNumberOfVisits;
- (NSNumber)firstGeoResultNumberOfVisitsGivenLocation;
- (NSNumber)firstGeoResultPersonalizationType;
- (NSNumber)firstGeoResultTimeSinceLastVisit;
- (NSNumber)firstGeoResultTimeUntilUpcomingEvent;
- (NSNumber)firstGeoResultWasReranked;
- (NSString)trialDeploymentId;
- (NSString)trialExperimentId;
- (NSString)trialTreatmentId;
- (SPGeoPersonalizationEngagementMetric)init;
- (id)serializedMetric;
- (unint64_t)interaction;
- (unint64_t)numberOfPersonalGeoResults;
- (void)setEngagedGeoResultEntityRelevanceScore:(id)a3;
- (void)setEngagedGeoResultNumberOfVisits:(id)a3;
- (void)setEngagedGeoResultNumberOfVisitsGivenLocation:(id)a3;
- (void)setEngagedGeoResultPersonalizationType:(id)a3;
- (void)setEngagedGeoResultPosition:(id)a3;
- (void)setEngagedGeoResultTimeSinceLastVisit:(id)a3;
- (void)setEngagedGeoResultTimeUntilUpcomingEvent:(id)a3;
- (void)setEngagedResultWasTopHit:(id)a3;
- (void)setFirstGeoResultEntityRelevanceScore:(id)a3;
- (void)setFirstGeoResultIsCandidateForPromotion:(id)a3;
- (void)setFirstGeoResultNumberOfVisits:(id)a3;
- (void)setFirstGeoResultNumberOfVisitsGivenLocation:(id)a3;
- (void)setFirstGeoResultPersonalizationType:(id)a3;
- (void)setFirstGeoResultTimeSinceLastVisit:(id)a3;
- (void)setFirstGeoResultTimeUntilUpcomingEvent:(id)a3;
- (void)setFirstGeoResultWasReranked:(id)a3;
- (void)setGeoResultWasTopHit:(BOOL)a3;
- (void)setGeoResultsViewed:(BOOL)a3;
- (void)setInteraction:(unint64_t)a3;
- (void)setNumberOfPersonalGeoResults:(unint64_t)a3;
- (void)setTrialDeploymentId:(id)a3;
- (void)setTrialExperimentId:(id)a3;
- (void)setTrialTreatmentId:(id)a3;
@end

@implementation SPGeoPersonalizationEngagementMetric

- (SPGeoPersonalizationEngagementMetric)init
{
  v3.receiver = self;
  v3.super_class = (Class)SPGeoPersonalizationEngagementMetric;
  return [(SPGeoPersonalizationEngagementMetric *)&v3 init];
}

- (id)serializedMetric
{
  objc_super v3 = objc_opt_new();
  v4 = v3;
  engagedGeoResultEntityRelevanceScore = self->_engagedGeoResultEntityRelevanceScore;
  if (engagedGeoResultEntityRelevanceScore) {
    [v3 setObject:engagedGeoResultEntityRelevanceScore forKeyedSubscript:@"engagedGeoResultEntityRelevanceScore"];
  }
  engagedGeoResultNumberOfVisits = self->_engagedGeoResultNumberOfVisits;
  if (engagedGeoResultNumberOfVisits) {
    [v4 setObject:engagedGeoResultNumberOfVisits forKeyedSubscript:@"engagedGeoResultNumberOfVisits"];
  }
  engagedGeoResultNumberOfVisitsGivenLocation = self->_engagedGeoResultNumberOfVisitsGivenLocation;
  if (engagedGeoResultNumberOfVisitsGivenLocation) {
    [v4 setObject:engagedGeoResultNumberOfVisitsGivenLocation forKeyedSubscript:@"engagedGeoResultNumberOfVisitsGivenLocation"];
  }
  engagedGeoResultPersonalizationType = self->_engagedGeoResultPersonalizationType;
  if (engagedGeoResultPersonalizationType) {
    [v4 setObject:engagedGeoResultPersonalizationType forKeyedSubscript:@"engagedGeoResultPersonalizationType"];
  }
  engagedGeoResultPosition = self->_engagedGeoResultPosition;
  if (engagedGeoResultPosition) {
    [v4 setObject:engagedGeoResultPosition forKeyedSubscript:@"engagedGeoResultPosition"];
  }
  engagedGeoResultTimeSinceLastVisit = self->_engagedGeoResultTimeSinceLastVisit;
  if (engagedGeoResultTimeSinceLastVisit) {
    [v4 setObject:engagedGeoResultTimeSinceLastVisit forKeyedSubscript:@"engagedGeoResultTimeSinceLastVisit"];
  }
  engagedGeoResultTimeUntilUpcomingEvent = self->_engagedGeoResultTimeUntilUpcomingEvent;
  if (engagedGeoResultTimeUntilUpcomingEvent) {
    [v4 setObject:engagedGeoResultTimeUntilUpcomingEvent forKeyedSubscript:@"engagedGeoResultTimeUntilUpcomingEvent"];
  }
  engagedResultWasTopHit = self->_engagedResultWasTopHit;
  if (engagedResultWasTopHit) {
    [v4 setObject:engagedResultWasTopHit forKeyedSubscript:@"engagedResultWasTopHit"];
  }
  firstGeoResultEntityRelevanceScore = self->_firstGeoResultEntityRelevanceScore;
  if (firstGeoResultEntityRelevanceScore) {
    [v4 setObject:firstGeoResultEntityRelevanceScore forKeyedSubscript:@"firstGeoResultEntityRelevanceScore"];
  }
  firstGeoResultIsCandidateForPromotion = self->_firstGeoResultIsCandidateForPromotion;
  if (firstGeoResultIsCandidateForPromotion) {
    [v4 setObject:firstGeoResultIsCandidateForPromotion forKeyedSubscript:@"firstGeoResultIsCandidateForPromotion"];
  }
  firstGeoResultNumberOfVisits = self->_firstGeoResultNumberOfVisits;
  if (firstGeoResultNumberOfVisits) {
    [v4 setObject:firstGeoResultNumberOfVisits forKeyedSubscript:@"firstGeoResultNumberOfVisits"];
  }
  firstGeoResultNumberOfVisitsGivenLocation = self->_firstGeoResultNumberOfVisitsGivenLocation;
  if (firstGeoResultNumberOfVisitsGivenLocation) {
    [v4 setObject:firstGeoResultNumberOfVisitsGivenLocation forKeyedSubscript:@"firstGeoResultNumberOfVisitsGivenLocation"];
  }
  firstGeoResultPersonalizationType = self->_firstGeoResultPersonalizationType;
  if (firstGeoResultPersonalizationType) {
    [v4 setObject:firstGeoResultPersonalizationType forKeyedSubscript:@"firstGeoResultPersonalizationType"];
  }
  firstGeoResultTimeSinceLastVisit = self->_firstGeoResultTimeSinceLastVisit;
  if (firstGeoResultTimeSinceLastVisit) {
    [v4 setObject:firstGeoResultTimeSinceLastVisit forKeyedSubscript:@"firstGeoResultTimeSinceLastVisit"];
  }
  firstGeoResultTimeUntilUpcomingEvent = self->_firstGeoResultTimeUntilUpcomingEvent;
  if (firstGeoResultTimeUntilUpcomingEvent) {
    [v4 setObject:firstGeoResultTimeUntilUpcomingEvent forKeyedSubscript:@"firstGeoResultTimeUntilUpcomingEvent"];
  }
  firstGeoResultWasReranked = self->_firstGeoResultWasReranked;
  if (firstGeoResultWasReranked) {
    [v4 setObject:firstGeoResultWasReranked forKeyedSubscript:@"firstGeoResultWasReranked"];
  }
  v21 = [NSNumber numberWithBool:self->_geoResultsViewed];
  [v4 setObject:v21 forKeyedSubscript:@"geoResultsViewed"];

  v22 = [NSNumber numberWithBool:self->_geoResultWasTopHit];
  [v4 setObject:v22 forKeyedSubscript:@"geoResultWasTopHit"];

  v23 = [NSNumber numberWithUnsignedInteger:self->_interaction];
  [v4 setObject:v23 forKeyedSubscript:@"interaction"];

  v24 = [NSNumber numberWithUnsignedInteger:self->_numberOfPersonalGeoResults];
  [v4 setObject:v24 forKeyedSubscript:@"numberOfPersonalGeoResults"];

  trialDeploymentId = self->_trialDeploymentId;
  if (trialDeploymentId) {
    [v4 setObject:trialDeploymentId forKeyedSubscript:@"trialDeploymentId"];
  }
  trialExperimentId = self->_trialExperimentId;
  if (trialExperimentId) {
    [v4 setObject:trialExperimentId forKeyedSubscript:@"trialExperimentId"];
  }
  trialTreatmentId = self->_trialTreatmentId;
  if (trialTreatmentId) {
    [v4 setObject:trialTreatmentId forKeyedSubscript:@"trialTreatmentId"];
  }
  v28 = (void *)[v4 copy];

  return v28;
}

- (NSNumber)engagedGeoResultEntityRelevanceScore
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEngagedGeoResultEntityRelevanceScore:(id)a3
{
}

- (NSNumber)engagedGeoResultNumberOfVisits
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEngagedGeoResultNumberOfVisits:(id)a3
{
}

- (NSNumber)engagedGeoResultNumberOfVisitsGivenLocation
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEngagedGeoResultNumberOfVisitsGivenLocation:(id)a3
{
}

- (NSNumber)engagedGeoResultPersonalizationType
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEngagedGeoResultPersonalizationType:(id)a3
{
}

- (NSNumber)engagedGeoResultPosition
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEngagedGeoResultPosition:(id)a3
{
}

- (NSNumber)engagedGeoResultTimeSinceLastVisit
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEngagedGeoResultTimeSinceLastVisit:(id)a3
{
}

- (NSNumber)engagedGeoResultTimeUntilUpcomingEvent
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEngagedGeoResultTimeUntilUpcomingEvent:(id)a3
{
}

- (NSNumber)engagedResultWasTopHit
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEngagedResultWasTopHit:(id)a3
{
}

- (NSNumber)firstGeoResultEntityRelevanceScore
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFirstGeoResultEntityRelevanceScore:(id)a3
{
}

- (NSNumber)firstGeoResultIsCandidateForPromotion
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFirstGeoResultIsCandidateForPromotion:(id)a3
{
}

- (NSNumber)firstGeoResultNumberOfVisits
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFirstGeoResultNumberOfVisits:(id)a3
{
}

- (NSNumber)firstGeoResultNumberOfVisitsGivenLocation
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFirstGeoResultNumberOfVisitsGivenLocation:(id)a3
{
}

- (NSNumber)firstGeoResultPersonalizationType
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFirstGeoResultPersonalizationType:(id)a3
{
}

- (NSNumber)firstGeoResultTimeSinceLastVisit
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFirstGeoResultTimeSinceLastVisit:(id)a3
{
}

- (NSNumber)firstGeoResultTimeUntilUpcomingEvent
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFirstGeoResultTimeUntilUpcomingEvent:(id)a3
{
}

- (NSNumber)firstGeoResultWasReranked
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFirstGeoResultWasReranked:(id)a3
{
}

- (BOOL)geoResultsViewed
{
  return self->_geoResultsViewed;
}

- (void)setGeoResultsViewed:(BOOL)a3
{
  self->_geoResultsViewed = a3;
}

- (BOOL)geoResultWasTopHit
{
  return self->_geoResultWasTopHit;
}

- (void)setGeoResultWasTopHit:(BOOL)a3
{
  self->_geoResultWasTopHit = a3;
}

- (unint64_t)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(unint64_t)a3
{
  self->_interaction = a3;
}

- (unint64_t)numberOfPersonalGeoResults
{
  return self->_numberOfPersonalGeoResults;
}

- (void)setNumberOfPersonalGeoResults:(unint64_t)a3
{
  self->_numberOfPersonalGeoResults = a3;
}

- (NSString)trialDeploymentId
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTrialDeploymentId:(id)a3
{
}

- (NSString)trialExperimentId
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTrialExperimentId:(id)a3
{
}

- (NSString)trialTreatmentId
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTrialTreatmentId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_firstGeoResultWasReranked, 0);
  objc_storeStrong((id *)&self->_firstGeoResultTimeUntilUpcomingEvent, 0);
  objc_storeStrong((id *)&self->_firstGeoResultTimeSinceLastVisit, 0);
  objc_storeStrong((id *)&self->_firstGeoResultPersonalizationType, 0);
  objc_storeStrong((id *)&self->_firstGeoResultNumberOfVisitsGivenLocation, 0);
  objc_storeStrong((id *)&self->_firstGeoResultNumberOfVisits, 0);
  objc_storeStrong((id *)&self->_firstGeoResultIsCandidateForPromotion, 0);
  objc_storeStrong((id *)&self->_firstGeoResultEntityRelevanceScore, 0);
  objc_storeStrong((id *)&self->_engagedResultWasTopHit, 0);
  objc_storeStrong((id *)&self->_engagedGeoResultTimeUntilUpcomingEvent, 0);
  objc_storeStrong((id *)&self->_engagedGeoResultTimeSinceLastVisit, 0);
  objc_storeStrong((id *)&self->_engagedGeoResultPosition, 0);
  objc_storeStrong((id *)&self->_engagedGeoResultPersonalizationType, 0);
  objc_storeStrong((id *)&self->_engagedGeoResultNumberOfVisitsGivenLocation, 0);
  objc_storeStrong((id *)&self->_engagedGeoResultNumberOfVisits, 0);

  objc_storeStrong((id *)&self->_engagedGeoResultEntityRelevanceScore, 0);
}

@end