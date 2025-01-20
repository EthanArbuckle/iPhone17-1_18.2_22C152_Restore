@interface TRIClientGuardedData
@end

@implementation TRIClientGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->excessiveStaleFactorUsageTimer, 0);
  objc_storeStrong((id *)&self->namespaceCallbacks, 0);
  objc_storeStrong((id *)&self->namespaceUpdateHandlerTokens, 0);
  objc_storeStrong((id *)&self->trackingId, 0);
}

@end