@interface NTKFaceSnapshotViewController
- (NSString)snapshotKeyOfSnapshotImage;
- (NTKFace)face;
- (NTKFaceSnapshotCacheRequest)snapshotRequest;
- (NTKFaceSnapshotViewController)initWithFace:(id)a3;
- (UIImage)snapshotImage;
- (UIImageView)imageView;
- (void)_attemptToFetchSnapshot;
- (void)_handleSnapshot:(id)a3 forKey:(id)a4;
- (void)_updateFaceSnapshotIfNecessaryOfFace;
- (void)complicationTemplatesChanged;
- (void)complicationsChanged;
- (void)dealloc;
- (void)faceConfigurationDidChange:(id)a3;
- (void)faceResourceDirectoryDidChange:(id)a3;
- (void)setSnapshotImage:(id)a3;
- (void)setSnapshotKeyOfSnapshotImage:(id)a3;
- (void)setSnapshotRequest:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation NTKFaceSnapshotViewController

- (NTKFaceSnapshotViewController)initWithFace:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKFaceSnapshotViewController;
  v6 = [(NTKFaceSnapshotViewController *)&v13 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_face, a3);
    [(NTKFace *)v7->_face addObserver:v7];
    v8 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(NTKFaceSnapshotViewController *)v7 face];
      *(_DWORD *)buf = 134218242;
      v15 = v7;
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Observing face %@", buf, 0x16u);
    }
    [(NTKFaceSnapshotViewController *)v7 _attemptToFetchSnapshot];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel_complicationsChanged name:@"NTKWidgetComplicationProviderComplicationsDidChange" object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel_complicationTemplatesChanged name:@"NTKCompanionWidgetComplicationManagerComplicationTemplatesDidChange" object:0];
  }
  return v7;
}

- (void)dealloc
{
  [(NTKFace *)self->_face removeObserver:self];
  if (self->_snapshotRequest)
  {
    v3 = +[NTKFaceSnapshotCache snapshotCache];
    [v3 cancelSnapshotRequest:self->_snapshotRequest];
  }
  v4.receiver = self;
  v4.super_class = (Class)NTKFaceSnapshotViewController;
  [(NTKFaceSnapshotViewController *)&v4 dealloc];
}

- (void)_attemptToFetchSnapshot
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->_snapshotRequest)
  {
    v3 = +[NTKFaceSnapshotCache snapshotCache];
    [v3 cancelSnapshotRequest:self->_snapshotRequest];

    snapshotRequest = self->_snapshotRequest;
    self->_snapshotRequest = 0;
  }
  id v5 = +[NTKFaceSnapshotCache snapshotCache];
  v6 = [(NTKFaceSnapshotViewController *)self face];
  v7 = [v5 cachedSnapshotOfFace:v6];

  v8 = [(NTKFaceSnapshotViewController *)self face];
  v9 = [v8 dailySnapshotKey];
  v10 = (void *)[v9 copy];

  v11 = [(NTKFaceSnapshotViewController *)self face];
  v12 = [v11 unsafeDailySnapshotKey];
  objc_super v13 = (void *)[v12 copy];

  v14 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v15)
    {
      __int16 v16 = [(NTKFaceSnapshotViewController *)self face];
      *(_DWORD *)buf = 134218242;
      v33 = self;
      __int16 v34 = 2112;
      v35 = v16;
      _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Fetched cached snapshot of face %@", buf, 0x16u);
    }
    [(NTKFaceSnapshotViewController *)self _handleSnapshot:v7 forKey:v10];
  }
  else
  {
    if (v15)
    {
      v17 = [(NTKFaceSnapshotViewController *)self face];
      *(_DWORD *)buf = 134218242;
      v33 = self;
      __int16 v34 = 2112;
      v35 = v17;
      _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Cached snapshot miss of face %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    uint64_t v18 = [[NTKFaceSnapshotCacheRequestOptions alloc] initWithPriority:3];
    v19 = [NTKFaceSnapshotCacheRequest alloc];
    v20 = [(NTKFaceSnapshotViewController *)self face];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __56__NTKFaceSnapshotViewController__attemptToFetchSnapshot__block_invoke;
    v27 = &unk_1E62C6078;
    objc_copyWeak(&v31, (id *)buf);
    v28 = self;
    id v29 = v10;
    id v30 = v13;
    v21 = [(NTKFaceSnapshotCacheRequest *)v19 initWithFace:v20 options:v18 completion:&v24];

    v22 = +[NTKFaceSnapshotCache snapshotCache];
    [v22 fetchSnapshotWithRequest:v21];

    v23 = self->_snapshotRequest;
    self->_snapshotRequest = v21;

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
}

void __56__NTKFaceSnapshotViewController__attemptToFetchSnapshot__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v7 = [*(id *)(a1 + 32) face];
    v8 = [v7 dailySnapshotKey];

    v9 = [*(id *)(a1 + 32) face];
    v10 = [v9 unsafeDailySnapshotKey];

    if ([v8 isEqualToString:*(void *)(a1 + 40)])
    {
      id v11 = objc_loadWeakRetained((id *)(a1 + 56));
      [v11 _handleSnapshot:v4 forKey:*(void *)(a1 + 40)];
    }
    else
    {
      v12 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v13 = *(void **)(a1 + 32);
        uint64_t v14 = *(void *)(a1 + 40);
        uint64_t v15 = *(void *)(a1 + 48);
        __int16 v16 = [v13 face];
        *(_DWORD *)buf = 134219266;
        v20 = v13;
        __int16 v21 = 2112;
        uint64_t v22 = v14;
        __int16 v23 = 2112;
        uint64_t v24 = v15;
        __int16 v25 = 2112;
        v26 = v8;
        __int16 v27 = 2112;
        v28 = v10;
        __int16 v29 = 2112;
        id v30 = v16;
        _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Snapshot key changed from %@ / %@ to %@ / %@ of face %@. Retrying…", buf, 0x3Eu);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__NTKFaceSnapshotViewController__attemptToFetchSnapshot__block_invoke_10;
      block[3] = &unk_1E62C0068;
      objc_copyWeak(&v18, v5);
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v18);
    }
  }
}

void __56__NTKFaceSnapshotViewController__attemptToFetchSnapshot__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _attemptToFetchSnapshot];
}

- (void)_handleSnapshot:(id)a3 forKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(NTKFaceSnapshotViewController *)self face];
    int v13 = 134218498;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Handling snapshot %@ of face %@", (uint8_t *)&v13, 0x20u);
  }
  [(NTKFaceSnapshotViewController *)self setSnapshotImage:v6];
  v10 = (void *)[v7 copy];

  [(NTKFaceSnapshotViewController *)self setSnapshotKeyOfSnapshotImage:v10];
  id v11 = [(NTKFaceSnapshotViewController *)self imageView];
  [v11 setImage:v6];

  snapshotRequest = self->_snapshotRequest;
  self->_snapshotRequest = 0;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)NTKFaceSnapshotViewController;
  [(NTKFaceSnapshotViewController *)&v10 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
  id v4 = [(NTKFaceSnapshotViewController *)self snapshotImage];
  id v5 = (UIImageView *)[v3 initWithImage:v4];
  imageView = self->_imageView;
  self->_imageView = v5;

  id v7 = [(NTKFaceSnapshotViewController *)self view];
  v8 = [(NTKFaceSnapshotViewController *)self imageView];
  [v7 addSubview:v8];

  v9 = [(NTKFaceSnapshotViewController *)self imageView];
  [v9 setContentMode:2];
}

- (void)viewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)NTKFaceSnapshotViewController;
  [(NTKFaceSnapshotViewController *)&v17 viewWillLayoutSubviews];
  id v3 = [(NTKFaceSnapshotViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  CGFloat v12 = CGRectGetWidth(v18) * 0.5;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  CGFloat v13 = CGRectGetHeight(v19) * 0.5;
  uint64_t v14 = [(NTKFaceSnapshotViewController *)self imageView];
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  double Width = CGRectGetWidth(v20);
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  objc_msgSend(v14, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v21));

  id v16 = [(NTKFaceSnapshotViewController *)self imageView];
  objc_msgSend(v16, "setCenter:", v12, v13);
}

- (void)faceConfigurationDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat v5 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    CGFloat v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Face config changed for face %@", (uint8_t *)&v6, 0x16u);
  }

  [(NTKFaceSnapshotViewController *)self _updateFaceSnapshotIfNecessaryOfFace];
}

- (void)faceResourceDirectoryDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat v5 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    CGFloat v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Resource directory changed for face %@", (uint8_t *)&v6, 0x16u);
  }

  [(NTKFaceSnapshotViewController *)self _updateFaceSnapshotIfNecessaryOfFace];
}

- (void)complicationsChanged
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    CGFloat v5 = self;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Complications changed", (uint8_t *)&v4, 0xCu);
  }

  [(NTKFaceSnapshotViewController *)self _updateFaceSnapshotIfNecessaryOfFace];
}

- (void)complicationTemplatesChanged
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    CGFloat v5 = self;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Complication templates changed", (uint8_t *)&v4, 0xCu);
  }

  [(NTKFaceSnapshotViewController *)self _updateFaceSnapshotIfNecessaryOfFace];
}

- (void)_updateFaceSnapshotIfNecessaryOfFace
{
  id v3 = [(NTKFaceSnapshotViewController *)self snapshotKeyOfSnapshotImage];
  int v4 = [(NTKFaceSnapshotViewController *)self face];
  CGFloat v5 = [v4 dailySnapshotKey];
  char v6 = [v3 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__NTKFaceSnapshotViewController__updateFaceSnapshotIfNecessaryOfFace__block_invoke;
    block[3] = &unk_1E62BFF20;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __69__NTKFaceSnapshotViewController__updateFaceSnapshotIfNecessaryOfFace__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _attemptToFetchSnapshot];
}

- (NTKFace)face
{
  return self->_face;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImage)snapshotImage
{
  return self->_snapshotImage;
}

- (void)setSnapshotImage:(id)a3
{
}

- (NSString)snapshotKeyOfSnapshotImage
{
  return self->_snapshotKeyOfSnapshotImage;
}

- (void)setSnapshotKeyOfSnapshotImage:(id)a3
{
}

- (NTKFaceSnapshotCacheRequest)snapshotRequest
{
  return self->_snapshotRequest;
}

- (void)setSnapshotRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotRequest, 0);
  objc_storeStrong((id *)&self->_snapshotKeyOfSnapshotImage, 0);
  objc_storeStrong((id *)&self->_snapshotImage, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end