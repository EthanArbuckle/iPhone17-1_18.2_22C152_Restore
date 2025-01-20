@interface PPConfigurationGuardedData
@end

@implementation PPConfigurationGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->contactsLabelScoringMap, 0);
  objc_storeStrong((id *)&self->linearModelHyperparameters, 0);
  objc_storeStrong((id *)&self->engagementKValues, 0);
  objc_storeStrong((id *)&self->feedbackSessionLogsSamplingRateOverrides, 0);
  objc_storeStrong((id *)&self->topicCalibration, 0);
  objc_storeStrong((id *)&self->locationAlgorithmConfiguration, 0);
  objc_storeStrong((id *)&self->topicAlgorithmConfiguration, 0);
  objc_storeStrong((id *)&self->namedEntityAlgorithmConfiguration, 0);
  objc_storeStrong((id *)&self->topicsAlgorithmMultiplier, 0);
  objc_storeStrong((id *)&self->topicsSourceMultiplier, 0);
  objc_storeStrong((id *)&self->differentiallyPrivateEntityLogLevels, 0);
  objc_storeStrong((id *)&self->availableVariantNames, 0);
  objc_storeStrong((id *)&self->naturalVariantName, 0);
  objc_storeStrong((id *)&self->variantName, 0);
  objc_storeStrong((id *)&self->sportsMetricsEventName, 0);
  objc_storeStrong((id *)&self->musicDataCollectionAMPBundleIds, 0);
}

@end