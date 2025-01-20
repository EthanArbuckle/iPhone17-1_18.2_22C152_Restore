@interface FCSupportedCountryNetworkReachabilityRequirement
- (BOOL)isSatisfied;
- (FCNetworkReachabilityRequirementObserving)observer;
- (FCSupportedCountryNetworkReachabilityRequirement)init;
- (int64_t)offlineReason;
- (void)_update;
- (void)setObserver:(id)a3;
- (void)setSatisfied:(BOOL)a3;
@end

@implementation FCSupportedCountryNetworkReachabilityRequirement

- (BOOL)isSatisfied
{
  return self->_satisfied;
}

- (void)setObserver:(id)a3
{
}

- (FCSupportedCountryNetworkReachabilityRequirement)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCSupportedCountryNetworkReachabilityRequirement;
  v2 = [(FCSupportedCountryNetworkReachabilityRequirement *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(FCSupportedCountryNetworkReachabilityRequirement *)v2 _update];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__update name:*MEMORY[0x1E4F63EA0] object:0];
  }
  return v3;
}

- (void)_update
{
  int v3 = +[FCGeoUtilities isRunningInSupportedRegion];
  int satisfied = self->_satisfied;
  self->_int satisfied = v3;
  if (satisfied != v3)
  {
    id v5 = [(FCSupportedCountryNetworkReachabilityRequirement *)self observer];
    [v5 networkReachabilityRequirementDidBecomeDirty:self];
  }
}

- (FCNetworkReachabilityRequirementObserving)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->observer);
  return (FCNetworkReachabilityRequirementObserving *)WeakRetained;
}

- (int64_t)offlineReason
{
  return 3;
}

- (void)setSatisfied:(BOOL)a3
{
  self->_int satisfied = a3;
}

- (void).cxx_destruct
{
}

@end