@interface SBDWeakDomainDelegate
- (SBDPushNotificationControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation SBDWeakDomainDelegate

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (SBDPushNotificationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDPushNotificationControllerDelegate *)WeakRetained;
}

@end