@interface SBActivityProvidedContentElement
- (BOOL)hasActivityBehavior;
- (SAActivityHosting)activityHost;
- (void)setActivityHost:(id)a3;
@end

@implementation SBActivityProvidedContentElement

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (SAActivityHosting)activityHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
  return (SAActivityHosting *)WeakRetained;
}

- (void)setActivityHost:(id)a3
{
}

- (void).cxx_destruct
{
}

@end