@interface PDServerUnprotectedManagers
- (PDServerUnprotectedManagers)init;
@end

@implementation PDServerUnprotectedManagers

- (PDServerUnprotectedManagers)init
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetManager, 0);
  objc_storeStrong((id *)&self->_remoteInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_notificationStreamManager, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_fieldDetectorManager, 0);
}

@end