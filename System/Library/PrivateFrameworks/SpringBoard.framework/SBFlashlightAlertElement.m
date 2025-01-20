@interface SBFlashlightAlertElement
+ (id)flashlightUnavailableAlert;
- (BOOL)hasAlertBehavior;
- (SAAlertHosting)alertHost;
- (void)setAlertHost:(id)a3;
@end

@implementation SBFlashlightAlertElement

+ (id)flashlightUnavailableAlert
{
  v2 = (void *)[objc_alloc((Class)a1) initWithStyle:1 state:2];
  return v2;
}

- (BOOL)hasAlertBehavior
{
  return 1;
}

- (SAAlertHosting)alertHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHost);
  return (SAAlertHosting *)WeakRetained;
}

- (void)setAlertHost:(id)a3
{
}

- (void).cxx_destruct
{
}

@end