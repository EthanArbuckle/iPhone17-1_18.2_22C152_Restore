@interface TRIMAProvidingGuardedData
- (id)description;
@end

@implementation TRIMAProvidingGuardedData

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@,didDefer:%d,deferralHandlerInvalid:%d>", objc_opt_class(), self->didDeferDuringMADownload, self->deferralHandlerInvalid];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->currentAsset, 0);
  objc_storeStrong((id *)&self->fetchSemaphores, 0);
}

@end