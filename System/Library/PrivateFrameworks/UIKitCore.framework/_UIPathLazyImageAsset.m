@interface _UIPathLazyImageAsset
- (BOOL)_containsImagesInPath:(id)a3;
- (BOOL)haveCGCacheImages;
- (NSArray)imagePaths;
- (_UIPathLazyImageAsset)init;
- (_UIPathLazyImageAsset)initWithCoder:(id)a3;
- (id)_initWithAssetName:(id)a3 forFilesInBundle:(id)a4;
- (id)_initWithAssetName:(id)a3 forFilesInBundle:(id)a4 imagePaths:(id)a5 haveCGCacheImages:(BOOL)a6;
- (id)_initWithAssetName:(id)a3 forManager:(id)a4;
- (id)imageWithConfiguration:(id)a3;
- (void)_clearResolvedImageResources;
@end

@implementation _UIPathLazyImageAsset

- (id)_initWithAssetName:(id)a3 forFilesInBundle:(id)a4 imagePaths:(id)a5 haveCGCacheImages:(BOOL)a6
{
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIPathLazyImageAsset;
  v11 = [(UIImageAsset *)&v16 _initWithAssetName:a3 forFilesInBundle:a4];
  v12 = v11;
  if (v11)
  {
    v11[88] &= ~2u;
    uint64_t v13 = [v10 copy];
    v14 = (void *)*((void *)v12 + 12);
    *((void *)v12 + 12) = v13;

    v12[88] = v12[88] & 0xFE | a6;
  }

  return v12;
}

- (id)imageWithConfiguration:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if ((*(unsigned char *)&self->_plaFlags & 2) == 0)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v6 = self->_imagePaths;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
          v12 = _UserInterfaceTraitFromPath(v11);
          ImageAtPath = (void *)GetImageAtPath(v11, self->_haveCGCacheImages, 0.0);
          if (ImageAtPath)
          {
            if (v12) {
              v14 = (void *)[v12 imageConfiguration];
            }
            else {
              v14 = 0;
            }
            id v15 = v14;
            [(UIImageAsset *)self _withLock_registerImage:ImageAtPath withConfiguration:v15];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v16 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        uint64_t v8 = v16;
      }
      while (v16);
    }

    *(unsigned char *)&self->_plaFlags |= 2u;
    p_lock = &self->super._lock;
  }
  os_unfair_lock_unlock(p_lock);
  v19.receiver = self;
  v19.super_class = (Class)_UIPathLazyImageAsset;
  v17 = [(UIImageAsset *)&v19 imageWithConfiguration:v4];

  return v17;
}

- (_UIPathLazyImageAsset)init
{
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v8 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Must use designated initializer", buf, 2u);
    }
  }
  else
  {
    v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &init___s_category_1) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Must use designated initializer", v9, 2u);
    }
  }
  id v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [v4 UUIDString];
  v6 = [(_UIPathLazyImageAsset *)self _initWithAssetName:v5 forManager:0];

  return v6;
}

- (_UIPathLazyImageAsset)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPathLazyImageAsset;
  return [(UIImageAsset *)&v4 initWithCoder:a3];
}

- (id)_initWithAssetName:(id)a3 forManager:(id)a4
{
  id v5 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v9 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Must use designated initializer", buf, 2u);
    }
  }
  else
  {
    v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_initWithAssetName_forManager____s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Must use designated initializer", v10, 2u);
    }
  }
  id v7 = [(_UIPathLazyImageAsset *)self _initWithAssetName:v5 forFilesInBundle:0 imagePaths:0 haveCGCacheImages:0];

  return v7;
}

- (id)_initWithAssetName:(id)a3 forFilesInBundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    v11 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Must use designated initializer", buf, 2u);
    }
  }
  else
  {
    uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_initWithAssetName_forFilesInBundle____s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Must use designated initializer", v12, 2u);
    }
  }
  id v9 = [(_UIPathLazyImageAsset *)self _initWithAssetName:v7 forFilesInBundle:v6 imagePaths:0 haveCGCacheImages:0];

  return v9;
}

- (void)_clearResolvedImageResources
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if ((*(unsigned char *)&self->_plaFlags & 2) != 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    objc_super v4 = self->_imagePaths;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = _UserInterfaceTraitFromPath(*(void **)(*((void *)&v11 + 1) + 8 * v8));
          uint64_t v10 = objc_msgSend(v9, "_namedImageDescription", (void)v11);
          [(UIImageAsset *)self _withLock_unregisterImageWithDescription:v10];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    *(unsigned char *)&self->_plaFlags &= ~2u;
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_containsImagesInPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  imagePaths = self->_imagePaths;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47___UIPathLazyImageAsset__containsImagesInPath___block_invoke;
  v8[3] = &unk_1E52F1AC0;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [(NSArray *)imagePaths enumerateObjectsUsingBlock:v8];
  LOBYTE(imagePaths) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)imagePaths;
}

- (NSArray)imagePaths
{
  return self->_imagePaths;
}

- (BOOL)haveCGCacheImages
{
  return self->_haveCGCacheImages;
}

- (void).cxx_destruct
{
}

@end