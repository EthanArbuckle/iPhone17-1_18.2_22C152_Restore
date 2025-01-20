@interface MusicKit_SoftLinking_MPCloudServiceStatusController
+ (MusicKit_SoftLinking_MPCloudServiceStatusController)sharedController;
+ (NSString)cloudLibraryEnabledDidChangeNotificationName;
- (id)_initWithUnderlyingServiceStatusController:(id)a3;
- (void)_handleCloudLibraryEnabledDidChangeNotification:(id)a3;
- (void)beginObservingCloudLibraryEnabled;
- (void)dealloc;
- (void)endObservingCloudLibraryEnabled;
@end

@implementation MusicKit_SoftLinking_MPCloudServiceStatusController

- (void)beginObservingCloudLibraryEnabled
{
}

+ (NSString)cloudLibraryEnabledDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPCloudServiceStatusControllerEnabledDidChangeNotification";
}

+ (MusicKit_SoftLinking_MPCloudServiceStatusController)sharedController
{
  if (sharedController_sOnceToken != -1) {
    dispatch_once(&sharedController_sOnceToken, &__block_literal_global_10);
  }
  v2 = (void *)sharedController_sSharedController;
  return (MusicKit_SoftLinking_MPCloudServiceStatusController *)v2;
}

- (id)_initWithUnderlyingServiceStatusController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPCloudServiceStatusController;
  v6 = [(MusicKit_SoftLinking_MPCloudServiceStatusController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingServiceStatusController, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = getMPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handleCloudLibraryEnabledDidChangeNotification_ name:v9 object:v7->_underlyingServiceStatusController];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = getMPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification();
  [v3 removeObserver:self name:v4 object:self->_underlyingServiceStatusController];

  v5.receiver = self;
  v5.super_class = (Class)MusicKit_SoftLinking_MPCloudServiceStatusController;
  [(MusicKit_SoftLinking_MPCloudServiceStatusController *)&v5 dealloc];
}

- (void)endObservingCloudLibraryEnabled
{
}

- (void)_handleCloudLibraryEnabledDidChangeNotification:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPCloudServiceStatusControllerEnabledDidChangeNotification" object:self userInfo:v6];
}

- (void).cxx_destruct
{
}

@end