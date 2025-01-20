@interface TRIRolloutTaskSupportGuardedData
@end

@implementation TRIRolloutTaskSupportGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->trialSystemTelemetry, 0);
  objc_storeStrong((id *)&self->dimensions, 0);
  objc_storeStrong((id *)&self->metrics, 0);
}

@end