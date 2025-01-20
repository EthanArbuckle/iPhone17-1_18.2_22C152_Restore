@interface PEEditAction
- (BOOL)forceRunAsUnadjustedAsset;
- (PEEditActionAnalyticsEventBuilderDelegate)analyticsEventBuilderDelegate;
- (id)analyticsPayload;
- (int64_t)actionType;
- (void)setAnalyticsEventBuilderDelegate:(id)a3;
@end

@implementation PEEditAction

- (void).cxx_destruct
{
}

- (void)setAnalyticsEventBuilderDelegate:(id)a3
{
}

- (PEEditActionAnalyticsEventBuilderDelegate)analyticsEventBuilderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsEventBuilderDelegate);
  return (PEEditActionAnalyticsEventBuilderDelegate *)WeakRetained;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (BOOL)forceRunAsUnadjustedAsset
{
  return 0;
}

- (id)analyticsPayload
{
  return (id)MEMORY[0x263EFFA78];
}

@end