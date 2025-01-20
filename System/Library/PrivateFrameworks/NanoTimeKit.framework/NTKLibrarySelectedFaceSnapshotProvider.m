@interface NTKLibrarySelectedFaceSnapshotProvider
+ (void)snapshotCurrentFaceForActiveDeviceWithOptions:(id)a3 completion:(id)a4;
+ (void)snapshotCurrentFaceForDevice:(id)a3 withOptions:(id)a4 completion:(id)a5;
+ (void)snapshotCurrentFaceForDeviceUUID:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (NTKLibrarySelectedFaceSnapshotProvider)initWithDeviceUUID:(id)a3;
- (NTKLibrarySelectedFaceSnapshotProvider)initWithDeviceUUID:(id)a3 delegate:(id)a4;
- (NTKLibrarySelectedFaceSnapshotProviderDelegate)delegate;
- (UIImage)snapshotImage;
- (void)_handleFaceChange:(id)a3;
- (void)_handleSnapshotChangedNotification:(id)a3;
- (void)_notifyIfSnapshotAvailable;
- (void)_updateSelectedFaceAndSnapshotKey;
- (void)dealloc;
- (void)faceCollection:(id)a3 didSelectFace:(id)a4 atIndex:(unint64_t)a5;
- (void)faceCollectionDidLoad:(id)a3;
- (void)setDelegate:(id)a3;
- (void)snapshotSelectedFaceWithOptions:(id)a3 completion:(id)a4;
@end

@implementation NTKLibrarySelectedFaceSnapshotProvider

- (NTKLibrarySelectedFaceSnapshotProvider)initWithDeviceUUID:(id)a3
{
  return [(NTKLibrarySelectedFaceSnapshotProvider *)self initWithDeviceUUID:a3 delegate:0];
}

- (NTKLibrarySelectedFaceSnapshotProvider)initWithDeviceUUID:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKLibrarySelectedFaceSnapshotProvider;
  v8 = [(NTKLibrarySelectedFaceSnapshotProvider *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.nanotimekit.selectedFaceSnapshotRequests", 0);
    snapshotRequestsQueue = v9->_snapshotRequestsQueue;
    v9->_snapshotRequestsQueue = (OS_dispatch_queue *)v10;

    dispatch_suspend((dispatch_object_t)v9->_snapshotRequestsQueue);
    v9->_resumedQueue = 0;
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v9 selector:sel__handleSnapshotChangedNotification_ name:@"NTKFaceSnapshotChangedNotification" object:0];

    v13 = [[NTKPersistentFaceCollection alloc] initWithCollectionIdentifier:@"LibraryFaces" deviceUUID:v6];
    libraryCollection = v9->_libraryCollection;
    v9->_libraryCollection = &v13->super;

    [(NTKFaceCollection *)v9->_libraryCollection addObserver:v9];
  }

  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(NTKFaceCollection *)self->_libraryCollection removeObserver:self];
  if (!self->_resumedQueue) {
    dispatch_resume((dispatch_object_t)self->_snapshotRequestsQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)NTKLibrarySelectedFaceSnapshotProvider;
  [(NTKLibrarySelectedFaceSnapshotProvider *)&v4 dealloc];
}

- (UIImage)snapshotImage
{
  v3 = NTKSnapshotMappedImageCache();
  objc_super v4 = [v3 imageForKey:self->_snapshotKey];

  return (UIImage *)v4;
}

- (void)faceCollectionDidLoad:(id)a3
{
  [(NTKLibrarySelectedFaceSnapshotProvider *)self _updateSelectedFaceAndSnapshotKey];
  objc_super v4 = [(NTKLibrarySelectedFaceSnapshotProvider *)self snapshotImage];

  if (v4)
  {
    [(NTKLibrarySelectedFaceSnapshotProvider *)self _notifyIfSnapshotAvailable];
  }
  else
  {
    v5 = +[NTKFaceSnapshotClient sharedInstance];
    [v5 requestSnapshotOfFace:self->_selectedFace];
  }
  dispatch_resume((dispatch_object_t)self->_snapshotRequestsQueue);
  self->_resumedQueue = 1;
}

- (void)faceCollection:(id)a3 didSelectFace:(id)a4 atIndex:(unint64_t)a5
{
  [(NTKLibrarySelectedFaceSnapshotProvider *)self _updateSelectedFaceAndSnapshotKey];
  [(NTKLibrarySelectedFaceSnapshotProvider *)self _notifyIfSnapshotAvailable];
}

- (void)_handleSnapshotChangedNotification:(id)a3
{
  id v4 = [a3 object];
  if (-[NSString isEqualToString:](self->_snapshotKey, "isEqualToString:")) {
    [(NTKLibrarySelectedFaceSnapshotProvider *)self _notifyIfSnapshotAvailable];
  }
}

- (void)_notifyIfSnapshotAvailable
{
  id v4 = [(NTKLibrarySelectedFaceSnapshotProvider *)self snapshotImage];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained snapshotImageUpdated:v4];
  }
}

- (void)_updateSelectedFaceAndSnapshotKey
{
  [(NTKFace *)self->_selectedFace removeObserver:self];
  v3 = [(NTKFaceCollection *)self->_libraryCollection selectedFace];
  selectedFace = self->_selectedFace;
  self->_selectedFace = v3;

  v5 = [(NTKFace *)self->_selectedFace dailySnapshotKey];
  snapshotKey = self->_snapshotKey;
  self->_snapshotKey = v5;

  id v7 = self->_selectedFace;
  [(NTKFace *)v7 addObserver:self];
}

- (void)_handleFaceChange:(id)a3
{
  id v6 = a3;
  if ([v6 isEqual:self->_selectedFace])
  {
    id v4 = [v6 dailySnapshotKey];
    snapshotKey = self->_snapshotKey;
    self->_snapshotKey = v4;

    [(NTKLibrarySelectedFaceSnapshotProvider *)self _notifyIfSnapshotAvailable];
  }
}

- (void)snapshotSelectedFaceWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)objc_opt_class() snapshotCurrentFaceForActiveDeviceWithOptions:v6 completion:v5];
}

+ (void)snapshotCurrentFaceForActiveDeviceWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F19A30];
  id v8 = a4;
  v9 = [v7 currentDevice];
  dispatch_queue_t v10 = [v9 nrDevice];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F19A30] currentDevice];
    [a1 snapshotCurrentFaceForDevice:v11 withOptions:v6 completion:v8];
  }
  else
  {
    v12 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[NTKLibrarySelectedFaceSnapshotProvider snapshotCurrentFaceForActiveDeviceWithOptions:completion:](v12);
    }

    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

+ (void)snapshotCurrentFaceForDevice:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 nrDeviceUUID];
  [a1 snapshotCurrentFaceForDeviceUUID:v10 withOptions:v9 completion:v8];
}

+ (void)snapshotCurrentFaceForDeviceUUID:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    objc_super v16 = @"NTKSnapshotUIOnlyKey";
    v17[0] = MEMORY[0x1E4F1CC38];
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    if (v8)
    {
      v11 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];
      [v11 addEntriesFromDictionary:v8];

      id v10 = v11;
    }
    v12 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "Calling into SnapshotClient snapshotLibrarySelectedFaceForDeviceUUID with options:%@", (uint8_t *)&v14, 0xCu);
    }

    v13 = +[NTKFaceSnapshotClient sharedInstance];
    [v13 snapshotLibrarySelectedFaceForDeviceUUID:v7 options:v10 completion:v9];
  }
  else
  {
    id v10 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[NTKLibrarySelectedFaceSnapshotProvider snapshotCurrentFaceForDeviceUUID:withOptions:completion:](v10);
    }
  }
}

- (NTKLibrarySelectedFaceSnapshotProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKLibrarySelectedFaceSnapshotProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotRequestsQueue, 0);
  objc_storeStrong((id *)&self->_snapshotKey, 0);
  objc_storeStrong((id *)&self->_selectedFace, 0);
  objc_storeStrong((id *)&self->_libraryCollection, 0);
}

+ (void)snapshotCurrentFaceForActiveDeviceWithOptions:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "No paired device. Nothing to snapshot.", v1, 2u);
}

+ (void)snapshotCurrentFaceForDeviceUUID:(os_log_t)log withOptions:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "snapshotCurrentFaceForDeviceUUID called with nil completion handler", v1, 2u);
}

@end