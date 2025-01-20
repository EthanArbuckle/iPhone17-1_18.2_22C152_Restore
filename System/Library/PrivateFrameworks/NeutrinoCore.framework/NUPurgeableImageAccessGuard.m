@interface NUPurgeableImageAccessGuard
- (NUPurgeableImageAccessGuard)initWithRegion:(id)a3 image:(id)a4;
- (void)_beginAccess;
- (void)_endAccess;
- (void)dealloc;
@end

@implementation NUPurgeableImageAccessGuard

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessImage, 0);

  objc_storeStrong((id *)&self->_accessRegion, 0);
}

- (void)_endAccess
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = self->_accessImage;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_348_11847);
  }
  v4 = _NURenderLogger;
  if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_DEBUG))
  {
    accessRegion = self->_accessRegion;
    int v6 = 134218242;
    v7 = v3;
    __int16 v8 = 2114;
    v9 = accessRegion;
    _os_log_debug_impl(&dword_1A9892000, v4, OS_LOG_TYPE_DEBUG, "endAccess %p %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(NUPurgeableImage *)v3 endAccessRegion:self->_accessRegion];
}

- (void)_beginAccess
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = self->_accessImage;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_348_11847);
  }
  v4 = _NURenderLogger;
  if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_DEBUG))
  {
    accessRegion = self->_accessRegion;
    int v6 = 134218242;
    v7 = v3;
    __int16 v8 = 2114;
    v9 = accessRegion;
    _os_log_debug_impl(&dword_1A9892000, v4, OS_LOG_TYPE_DEBUG, "beginAccess %p %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(NUPurgeableImage *)v3 beginAccessRegion:self->_accessRegion];
}

- (void)dealloc
{
  [(NUPurgeableImageAccessGuard *)self _endAccess];
  v3.receiver = self;
  v3.super_class = (Class)NUPurgeableImageAccessGuard;
  [(NUPurgeableImageAccessGuard *)&v3 dealloc];
}

- (NUPurgeableImageAccessGuard)initWithRegion:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUPurgeableImageAccessGuard;
  __int16 v8 = [(NUPurgeableImageAccessGuard *)&v12 init];
  uint64_t v9 = [v6 copy];
  accessRegion = v8->_accessRegion;
  v8->_accessRegion = (NURegion *)v9;

  objc_storeStrong((id *)&v8->_accessImage, a4);
  [(NUPurgeableImageAccessGuard *)v8 _beginAccess];

  return v8;
}

@end