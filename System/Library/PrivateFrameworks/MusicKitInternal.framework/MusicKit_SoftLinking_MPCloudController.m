@interface MusicKit_SoftLinking_MPCloudController
+ (MusicKit_SoftLinking_MPCloudController)sharedCloudController;
+ (NSString)canShowCloudDownloadButtonsDidChangeNotificationName;
+ (NSString)isUpdateInProgressDidChangeNotificationName;
- (BOOL)canShowCloudDownloadButtons;
- (BOOL)isCloudLibraryEnabled;
- (BOOL)isInitialImport;
- (BOOL)isUpdateInProgress;
- (id)_initWithUnderlyingCloudController:(id)a3;
- (int64_t)cloudAddToPlaylistBehavior;
- (void)_handleCanShowCloudDownloadButtonsDidChangeNotification:(id)a3;
- (void)_handleIsUpdateInProgressDidChangeNotificationName:(id)a3;
- (void)becomeActive;
- (void)dealloc;
- (void)enableCloudLibraryWithCompletionHandler:(id)a3;
- (void)loadCloudMusicLibraryUpdateProgressWithCompletionHandler:(id)a3;
- (void)resetInvitationURLForCollaborationWithPersistentID:(id)a3 completion:(id)a4;
- (void)resignActive;
- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(id)a4 withApproval:(BOOL)a5 completion:(id)a6;
- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 completionHandler:(id)a4;
- (void)updateSharingMode:(int64_t)a3 onCollaborationWithPersistentID:(id)a4 completion:(id)a5;
- (void)updateSubscribedPlaylistWithSagaID:(unint64_t)a3 ignoreMinRefreshInterval:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation MusicKit_SoftLinking_MPCloudController

- (BOOL)isCloudLibraryEnabled
{
  return [(MPCloudController *)self->_underlyingCloudController isCloudLibraryEnabled];
}

- (BOOL)isUpdateInProgress
{
  return [(MPCloudController *)self->_underlyingCloudController isUpdateInProgress];
}

+ (NSString)isUpdateInProgressDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPCloudControllerIsUpdateInProgressDidChangeNotification";
}

- (id)_initWithUnderlyingCloudController:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MusicKit_SoftLinking_MPCloudController;
  v6 = [(MusicKit_SoftLinking_MPCloudController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingCloudController, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = getMPCloudControllerCanShowCloudDownloadButtonsDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handleCanShowCloudDownloadButtonsDidChangeNotification_ name:v9 object:v7->_underlyingCloudController];

    v10 = getMPCloudControllerIsUpdateInProgressDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handleIsUpdateInProgressDidChangeNotificationName_ name:v10 object:v7->_underlyingCloudController];
  }
  return v7;
}

+ (MusicKit_SoftLinking_MPCloudController)sharedCloudController
{
  if (sharedCloudController_sOnceToken != -1) {
    dispatch_once(&sharedCloudController_sOnceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedCloudController_sSharedCloudController;
  return (MusicKit_SoftLinking_MPCloudController *)v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = getMPCloudControllerCanShowCloudDownloadButtonsDidChangeNotification();
  [v3 removeObserver:self name:v4 object:self->_underlyingCloudController];

  id v5 = getMPCloudControllerIsUpdateInProgressDidChangeNotification();
  [v3 removeObserver:self name:v5 object:self->_underlyingCloudController];

  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_MPCloudController;
  [(MusicKit_SoftLinking_MPCloudController *)&v6 dealloc];
}

- (BOOL)canShowCloudDownloadButtons
{
  return [(MPCloudController *)self->_underlyingCloudController canShowCloudDownloadButtons];
}

- (BOOL)isInitialImport
{
  return [(MPCloudController *)self->_underlyingCloudController isInitialImport];
}

- (void)updateSubscribedPlaylistWithSagaID:(unint64_t)a3 ignoreMinRefreshInterval:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 completionHandler:(id)a4
{
  if (a3 != 2) {
    a3 = a3 == 1;
  }
  [(MPCloudController *)self->_underlyingCloudController setCloudAddToPlaylistBehavior:a3 completionHandler:a4];
}

- (int64_t)cloudAddToPlaylistBehavior
{
  int64_t result = [(MPCloudController *)self->_underlyingCloudController cloudAddToPlaylistBehavior];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (void)becomeActive
{
}

- (void)resignActive
{
}

- (void)enableCloudLibraryWithCompletionHandler:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  id v5 = (id *)getMPCloudControllerEnableCloudLibraryOptionStartInitialImportSymbolLoc_ptr;
  uint64_t v17 = getMPCloudControllerEnableCloudLibraryOptionStartInitialImportSymbolLoc_ptr;
  if (!getMPCloudControllerEnableCloudLibraryOptionStartInitialImportSymbolLoc_ptr)
  {
    objc_super v6 = (void *)MediaPlayerLibrary_11();
    v15[3] = (uint64_t)dlsym(v6, "MPCloudControllerEnableCloudLibraryOptionStartInitialImport");
    getMPCloudControllerEnableCloudLibraryOptionStartInitialImportSymbolLoc_ptr = v15[3];
    id v5 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v5) {
    getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
  }
  id v7 = *v5;
  id v18 = v7;
  uint64_t v8 = MEMORY[0x1E4F1CC38];
  v20[0] = MEMORY[0x1E4F1CC38];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  v9 = (id *)getMPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrarySymbolLoc_ptr;
  uint64_t v17 = getMPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrarySymbolLoc_ptr;
  if (!getMPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrarySymbolLoc_ptr)
  {
    v10 = (void *)MediaPlayerLibrary_11();
    v15[3] = (uint64_t)dlsym(v10, "MPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrary");
    getMPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrarySymbolLoc_ptr = v15[3];
    v9 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v9) {
    getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
  }
  id v19 = *v9;
  v20[1] = v8;
  v11 = (void *)MEMORY[0x1E4F1C9E8];
  id v12 = v19;
  v13 = [v11 dictionaryWithObjects:v20 forKeys:&v18 count:2];

  [(MPCloudController *)self->_underlyingCloudController enableCloudLibraryWithOptions:v13 completionHandler:v4];
}

- (void)loadCloudMusicLibraryUpdateProgressWithCompletionHandler:(id)a3
{
}

- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(id)a4 withApproval:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  underlyingCloudController = self->_underlyingCloudController;
  id v10 = a6;
  id v11 = a3;
  -[MPCloudController respondToPendingCollaborator:onCollaborationWithPersistentID:withApproval:completion:](underlyingCloudController, "respondToPendingCollaborator:onCollaborationWithPersistentID:withApproval:completion:", v11, [a4 longLongValue], v6, v10);
}

- (void)updateSharingMode:(int64_t)a3 onCollaborationWithPersistentID:(id)a4 completion:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F38628];
  id v13 = a5;
  id v9 = a4;
  uint64_t v10 = [v8 _underlyingMediaSharingModeForSharingMode:a3];
  underlyingCloudController = self->_underlyingCloudController;
  uint64_t v12 = [v9 longLongValue];

  [(MPCloudController *)underlyingCloudController updateSharingMode:v10 onCollaboratinWithPersistentID:v12 completion:v13];
}

- (void)resetInvitationURLForCollaborationWithPersistentID:(id)a3 completion:(id)a4
{
  underlyingCloudController = self->_underlyingCloudController;
  id v6 = a4;
  -[MPCloudController resetInvitationURLForCollaborationWithPersistentID:completion:](underlyingCloudController, "resetInvitationURLForCollaborationWithPersistentID:completion:", [a3 longLongValue], v6);
}

+ (NSString)canShowCloudDownloadButtonsDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPCloudControllerCanShowCloudDownloadButtonsDidChangeNotification";
}

- (void)_handleCanShowCloudDownloadButtonsDidChangeNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  id v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPCloudControllerCanShowCloudDownloadButtonsDidChangeNotification" object:self userInfo:v6];
}

- (void)_handleIsUpdateInProgressDidChangeNotificationName:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  id v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPCloudControllerIsUpdateInProgressDidChangeNotification" object:self userInfo:v6];
}

- (void).cxx_destruct
{
}

@end