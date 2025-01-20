@interface MusicKit_SoftLinking_MPModelLibraryTransientStateController
+ (MusicKit_SoftLinking_MPModelLibraryTransientStateController)sharedLibraryTransientStateController;
+ (NSString)didChangeNotificationName;
- (id)_initWithUnderlyingLibraryTransientStateController:(id)a3;
- (int64_t)_libraryTransientFavoriteState:(int64_t)a3;
- (int64_t)_underlyingLibraryTransientFavoriteState:(int64_t)a3;
- (int64_t)transientFavoriteStateForModelObject:(id)a3;
- (void)_handleLibraryTransientStateControllerDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)performAddToPlaylistWithRequest:(id)a3 completionHandler:(id)a4;
- (void)performDeleteEntityWithRequest:(id)a3 completionHandler:(id)a4;
- (void)performFavoriteStateChangeRequest:(id)a3 completionHandler:(id)a4;
- (void)performLibraryImportChangeWithRequest:(id)a3 completionHandler:(id)a4;
- (void)performLibraryKeepLocalChangeWithRequest:(id)a3 completionHandler:(id)a4;
- (void)performOperation:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryTransientStateController

+ (MusicKit_SoftLinking_MPModelLibraryTransientStateController)sharedLibraryTransientStateController
{
  if (sharedLibraryTransientStateController_sOnceToken != -1) {
    dispatch_once(&sharedLibraryTransientStateController_sOnceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedLibraryTransientStateController_sSharedDeviceLibraryController;
  return (MusicKit_SoftLinking_MPModelLibraryTransientStateController *)v2;
}

- (id)_initWithUnderlyingLibraryTransientStateController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryTransientStateController;
  v6 = [(MusicKit_SoftLinking_MPModelLibraryTransientStateController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingLibraryTransientStateController, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = getMPModelLibraryTransientStateControllerDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handleLibraryTransientStateControllerDidChangeNotification_ name:v9 object:v7->_underlyingLibraryTransientStateController];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = getMPModelLibraryTransientStateControllerDidChangeNotification();
  [v3 removeObserver:self name:v4 object:self->_underlyingLibraryTransientStateController];

  v5.receiver = self;
  v5.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryTransientStateController;
  [(MusicKit_SoftLinking_MPModelLibraryTransientStateController *)&v5 dealloc];
}

- (int64_t)transientFavoriteStateForModelObject:(id)a3
{
  v4 = [a3 _underlyingModelObject];
  int64_t v5 = [(MusicKit_SoftLinking_MPModelLibraryTransientStateController *)self _libraryTransientFavoriteState:[(MPModelLibraryTransientStateController *)self->_underlyingLibraryTransientStateController transientFavoriteStateForModelObject:v4]];

  return v5;
}

- (void)performAddToPlaylistWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 _underlyingLibraryAddToPlaylistChangeRequest];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __113__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performAddToPlaylistWithRequest_completionHandler___block_invoke;
  v15 = &unk_1E6D456B0;
  id v16 = v6;
  id v17 = v7;
  id v9 = v6;
  id v10 = v7;
  objc_super v11 = (void *)[v8 newOperationWithResponseHandler:&v12];

  -[MPModelLibraryTransientStateController addOperation:](self->_underlyingLibraryTransientStateController, "addOperation:", v11, v12, v13, v14, v15);
}

- (void)performDeleteEntityWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [v7 _underlyingLibraryDeleteEntityChangeRequest];
  v8 = [v7 relatedModelObjects];

  id v9 = objc_msgSend(v8, "msv_map:", &__block_literal_global_20);

  id v10 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass());
  [v10 appendSection:&stru_1F3B7D290];
  [v10 appendItems:v9];
  [(MPModelLibraryTransientStateController *)self->_underlyingLibraryTransientStateController performDeleteEntityChangeRequest:v11 withRelatedModelObjects:v10 completion:v6];
}

- (void)performLibraryImportChangeWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 _underlyingLibraryImportChangeRequest];
  id v9 = [v7 relatedModelObjects];

  id v10 = objc_msgSend(v9, "msv_map:", &__block_literal_global_25);

  id v11 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass());
  [v11 appendSection:&stru_1F3B7D290];
  [v11 appendItems:v10];
  underlyingLibraryTransientStateController = self->_underlyingLibraryTransientStateController;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __119__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performLibraryImportChangeWithRequest_completionHandler___block_invoke_2;
  v14[3] = &unk_1E6D456D8;
  id v15 = v6;
  id v13 = v6;
  [(MPModelLibraryTransientStateController *)underlyingLibraryTransientStateController performLibraryImportChangeRequest:v8 withRelatedModelObjects:v11 completion:v14];
}

- (void)performLibraryKeepLocalChangeWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [v7 _underlyingLibraryKeepLocalChangeRequest];
  v8 = [v7 relatedModelObjects];

  id v9 = objc_msgSend(v8, "msv_map:", &__block_literal_global_28);

  id v10 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass());
  [v10 appendSection:&stru_1F3B7D290];
  [v10 appendItems:v9];
  [(MPModelLibraryTransientStateController *)self->_underlyingLibraryTransientStateController performKeepLocalChangeRequest:v11 withRelatedModelObjects:v10 completion:v6];
}

- (void)performFavoriteStateChangeRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 _underlyingFavoriteEntityChangeRequest];
  [(MPModelLibraryTransientStateController *)self->_underlyingLibraryTransientStateController performFavoriteStateChangeRequest:v7 withRelatedModelObjects:0 completion:v6];
}

- (void)performOperation:(id)a3
{
}

- (int64_t)_libraryTransientFavoriteState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (int64_t)_underlyingLibraryTransientFavoriteState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (NSString)didChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPLibraryTransientStateControllerDidChangeNotification";
}

- (void)_handleLibraryTransientStateControllerDidChangeNotification:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  id v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPLibraryTransientStateControllerDidChangeNotification" object:self userInfo:v6];
}

- (void).cxx_destruct
{
}

@end