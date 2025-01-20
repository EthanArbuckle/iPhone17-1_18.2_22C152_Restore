@interface PSDServiceProgressDelegate
- (PSDActivity)service;
- (void)activityDidCompleteSending;
- (void)activityDidUpdateProgress:(float)a3;
- (void)setService:(id)a3;
@end

@implementation PSDServiceProgressDelegate

- (void)activityDidCompleteSending
{
  id v2 = [(PSDServiceProgressDelegate *)self service];
  [v2 progressDelegateDidCompleteSending];
}

- (void)activityDidUpdateProgress:(float)a3
{
  id v5 = [(PSDServiceProgressDelegate *)self service];
  *(float *)&double v4 = a3;
  [v5 progressDelegateDidUpdateProgress:v4];
}

- (PSDActivity)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (PSDActivity *)WeakRetained;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end