@interface NTKTimeOffsetManager
+ (id)sharedManager;
- (NTKTimeOffsetManager)init;
- (double)timeOffset;
- (id)displayTimeForRealTime:(id)a3;
- (id)faceDisplayTime;
- (void)_handleFaceDefaultsChanged;
- (void)_handleFaceLibraryReloaded;
- (void)_loadTimeOffset;
- (void)dealloc;
- (void)forceUpdateTimeOffset;
- (void)setTimeOffset:(double)a3;
@end

@implementation NTKTimeOffsetManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_3 != -1) {
    dispatch_once(&sharedManager_onceToken_3, &__block_literal_global_172);
  }
  v2 = (void *)sharedManager_manager_2;
  return v2;
}

void __37__NTKTimeOffsetManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(NTKTimeOffsetManager);
  v1 = (void *)sharedManager_manager_2;
  sharedManager_manager_2 = (uint64_t)v0;
}

- (NTKTimeOffsetManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKTimeOffsetManager;
  v2 = [(NTKTimeOffsetManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(NTKTimeOffsetManager *)v2 _loadTimeOffset];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__handleFaceDefaultsChanged name:@"NTKFaceDefaultsChangedNotification" object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v3 selector:sel__handleFaceLibraryReloaded name:@"NTKFaceLibraryReloadedNotification" object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKTimeOffsetManager;
  [(NTKTimeOffsetManager *)&v4 dealloc];
}

- (id)faceDisplayTime
{
  v3 = [MEMORY[0x1E4F196B0] now];
  objc_super v4 = [(NTKTimeOffsetManager *)self displayTimeForRealTime:v3];

  return v4;
}

- (id)displayTimeForRealTime:(id)a3
{
  return (id)[a3 dateByAddingTimeInterval:self->_timeOffset];
}

- (void)_handleFaceDefaultsChanged
{
}

- (void)_handleFaceLibraryReloaded
{
}

- (void)forceUpdateTimeOffset
{
}

- (void)_loadTimeOffset
{
  self->_timeOffset = 0.0;
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(double)a3
{
  self->_timeOffset = a3;
}

@end