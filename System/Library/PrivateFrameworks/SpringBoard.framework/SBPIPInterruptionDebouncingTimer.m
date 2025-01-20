@interface SBPIPInterruptionDebouncingTimer
- (SBPIPInterruptionAssertion)debouncedAssertion;
- (void)setDebouncedAssertion:(id)a3;
@end

@implementation SBPIPInterruptionDebouncingTimer

- (SBPIPInterruptionAssertion)debouncedAssertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debouncedAssertion);
  return (SBPIPInterruptionAssertion *)WeakRetained;
}

- (void)setDebouncedAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end