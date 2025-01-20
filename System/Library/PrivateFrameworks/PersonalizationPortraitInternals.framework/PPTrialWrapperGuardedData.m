@interface PPTrialWrapperGuardedData
@end

@implementation PPTrialWrapperGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->concatenatedTreatmentNames, 0);
  objc_storeStrong((id *)&self->mostRecentUpdateDate, 0);
  objc_storeStrong((id *)&self->pathOverrides, 0);
  objc_storeStrong((id *)&self->notificationTokens, 0);
  objc_storeStrong((id *)&self->trackingId, 0);
}

@end