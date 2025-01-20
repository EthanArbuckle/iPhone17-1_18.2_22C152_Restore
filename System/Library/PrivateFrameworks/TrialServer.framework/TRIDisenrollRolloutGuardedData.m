@interface TRIDisenrollRolloutGuardedData
@end

@implementation TRIDisenrollRolloutGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->trialSystemTelemetry, 0);
  objc_storeStrong((id *)&self->metrics, 0);
}

@end