@interface PDRemoteAlertActivationTracker
- (PDRemoteAlertActivationTracker)init;
- (void)dealloc;
@end

@implementation PDRemoteAlertActivationTracker

- (PDRemoteAlertActivationTracker)init
{
  return 0;
}

- (void)dealloc
{
  sub_100223BB8((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)PDRemoteAlertActivationTracker;
  [(PDRemoteAlertActivationTracker *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deactivation, 0);
  objc_storeStrong(&self->_activation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end