@interface ICPreviewDeviceContext
+ (id)sharedContext;
- (ICPreviewDeviceContext)init;
- (NSArray)deviceScales;
- (NSArray)nonScalableDeviceInfo;
- (NSArray)scalableDeviceInfo;
- (double)maxDeviceScale;
- (double)maxSizeOfPreviewDeviceInfoImage;
- (id)deviceInfoScalable:(BOOL)a3;
- (void)dealloc;
- (void)screensChangedNotification:(id)a3;
- (void)setNonScalableDeviceInfo:(id)a3;
- (void)setScalableDeviceInfo:(id)a3;
@end

@implementation ICPreviewDeviceContext

+ (id)sharedContext
{
  if (sharedContext_once != -1) {
    dispatch_once(&sharedContext_once, &__block_literal_global_45);
  }
  v2 = (void *)sharedContext;
  return v2;
}

uint64_t __39__ICPreviewDeviceContext_sharedContext__block_invoke()
{
  v0 = objc_alloc_init(ICPreviewDeviceContext);
  sharedContext = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

- (ICPreviewDeviceContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICPreviewDeviceContext;
  v2 = [(ICPreviewDeviceContext *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_screensChangedNotification_ name:*MEMORY[0x1E4FB2EC0] object:0];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_screensChangedNotification_ name:*MEMORY[0x1E4FB2EC8] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_screensChangedNotification_ name:*MEMORY[0x1E4FB2ED0] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICPreviewDeviceContext;
  [(ICPreviewDeviceContext *)&v4 dealloc];
}

- (NSArray)deviceScales
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  deviceScales = v2->_deviceScales;
  if (!deviceScales)
  {
    objc_super v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [MEMORY[0x1E4FB1BA8] screens];
    v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"scale" ascending:1];
    v23[0] = v6;
    objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    v8 = [v5 sortedArrayUsingDescriptors:v7];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = NSNumber;
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "scale", (void)v18);
          v14 = objc_msgSend(v13, "numberWithDouble:");
          [(NSArray *)v4 addObject:v14];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    v15 = v2->_deviceScales;
    v2->_deviceScales = v4;

    deviceScales = v2->_deviceScales;
  }
  v16 = deviceScales;
  objc_sync_exit(v2);

  return v16;
}

- (double)maxDeviceScale
{
  v2 = [(ICPreviewDeviceContext *)self deviceScales];
  v3 = [v2 lastObject];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)maxSizeOfPreviewDeviceInfoImage
{
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v3 = [(ICPreviewDeviceContext *)self deviceInfoScalable:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__ICPreviewDeviceContext_maxSizeOfPreviewDeviceInfoImage__block_invoke;
  v8[3] = &unk_1E5FDBC50;
  v8[4] = &v9;
  [v3 enumerateObjectsUsingBlock:v8];
  double v4 = [(ICPreviewDeviceContext *)self deviceInfoScalable:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ICPreviewDeviceContext_maxSizeOfPreviewDeviceInfoImage__block_invoke_2;
  v7[3] = &unk_1E5FDBC50;
  v7[4] = &v9;
  [v4 enumerateObjectsUsingBlock:v7];
  double v5 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __57__ICPreviewDeviceContext_maxSizeOfPreviewDeviceInfoImage__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  [v4 imageSize];
  double v6 = v5;
  [v4 scale];
  double v8 = v7;

  double v9 = v6 * v8;
  if (v3 >= v6 * v8) {
    double v9 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9;
}

void __57__ICPreviewDeviceContext_maxSizeOfPreviewDeviceInfoImage__block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  [v4 imageSize];
  double v6 = v5;
  [v4 scale];
  double v8 = v7;

  double v9 = v6 * v8;
  if (v3 >= v6 * v8) {
    double v9 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9;
}

- (id)deviceInfoScalable:(BOOL)a3
{
  BOOL v3 = a3;
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  if (v3)
  {
    double v5 = [(ICPreviewDeviceContext *)v4 scalableDeviceInfo];

    if (!v5)
    {
      double v6 = (void *)[objc_alloc(MEMORY[0x1E4F83480]) initWithImageSize:384.0 scale:1.0];
      v21[0] = v6;
      double v7 = (void *)[objc_alloc(MEMORY[0x1E4F83480]) initWithImageSize:192.0 scale:1.0];
      v21[1] = v7;
      double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
      [(ICPreviewDeviceContext *)v4 setScalableDeviceInfo:v8];
    }
    uint64_t v9 = [(ICPreviewDeviceContext *)v4 scalableDeviceInfo];
  }
  else
  {
    uint64_t v10 = [(ICPreviewDeviceContext *)v4 nonScalableDeviceInfo];

    if (!v10)
    {
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F83480]) initWithImageSize:88.0 scale:1.0];
      v20[0] = v11;
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F83480]) initWithImageSize:88.0 scale:2.0];
      v20[1] = v12;
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F83480]) initWithImageSize:88.0 scale:3.0];
      v20[2] = v13;
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F83480]) initWithImageSize:384.0 scale:1.0];
      v20[3] = v14;
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F83480]) initWithImageSize:384.0 scale:2.0];
      v20[4] = v15;
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F83480]) initWithImageSize:384.0 scale:3.0];
      v20[5] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:6];
      [(ICPreviewDeviceContext *)v4 setNonScalableDeviceInfo:v17];
    }
    uint64_t v9 = [(ICPreviewDeviceContext *)v4 nonScalableDeviceInfo];
  }
  long long v18 = (void *)v9;
  objc_sync_exit(v4);

  return v18;
}

- (void)screensChangedNotification:(id)a3
{
  obj = self;
  objc_sync_enter(obj);
  deviceScales = obj->_deviceScales;
  obj->_deviceScales = 0;

  objc_sync_exit(obj);
}

- (NSArray)scalableDeviceInfo
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setScalableDeviceInfo:(id)a3
{
}

- (NSArray)nonScalableDeviceInfo
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNonScalableDeviceInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonScalableDeviceInfo, 0);
  objc_storeStrong((id *)&self->_scalableDeviceInfo, 0);
  objc_storeStrong((id *)&self->_deviceScales, 0);
}

@end