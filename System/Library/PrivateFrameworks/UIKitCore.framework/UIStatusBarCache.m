@interface UIStatusBarCache
+ (id)sharedInstance;
- (BOOL)isWriteable;
- (UIStatusBarCache)init;
- (id)imageNamed:(id)a3 forGroup:(id)a4 withScale:(double)a5;
- (void)cacheImage:(id)a3 named:(id)a4 forGroup:(id)a5;
- (void)removeImagesInGroup:(id)a3;
@end

@implementation UIStatusBarCache

+ (id)sharedInstance
{
  v2 = (void *)sharedInstance___cache;
  if (!sharedInstance___cache)
  {
    v3 = objc_alloc_init(UIStatusBarCache);
    v4 = (void *)sharedInstance___cache;
    sharedInstance___cache = (uint64_t)v3;

    v2 = (void *)sharedInstance___cache;
  }
  return v2;
}

- (UIStatusBarCache)init
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)UIStatusBarCache;
  v2 = [(UIStatusBarCache *)&v14 init];
  if (!v2) {
    return v2;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F4BE48]);
  v4 = _cachePath();
  if (qword_1EB2630A0 != -1) {
    dispatch_once(&qword_1EB2630A0, &__block_literal_global_47_2);
  }
  uint64_t v5 = [v3 initWithPath:v4 version:qword_1EB263098];
  store = v2->_store;
  v2->_store = (CPBitmapStore *)v5;

  if (!v2->_store)
  {
    v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("StatusBar", &qword_1EB263018) + 8);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    v9 = v12;
    v10 = _cachePath();
    *(_DWORD *)buf = 138412290;
    v16 = v10;
    v11 = "Failed to open status bar cache at path %@";
    goto LABEL_10;
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &_MergedGlobals_1232);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v8 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      v10 = _cachePath();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      v11 = "Opened status bar cache at path %@";
LABEL_10:
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
    }
  }
LABEL_11:
  v2->_writeable = [(id)UIApp _isSpringBoard];
  if (qword_1EB2630A8 != -1) {
    dispatch_once(&qword_1EB2630A8, &__block_literal_global_49_2);
  }
  return v2;
}

- (id)imageNamed:(id)a3 forGroup:(id)a4 withScale:(double)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &qword_1EB263020);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v18 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412546;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Looking for image %@ for group %@...", (uint8_t *)&v20, 0x16u);
    }
  }
  uint64_t v11 = [(CPBitmapStore *)self->_store copyImageForKey:v8 inGroup:v9];
  if (v11)
  {
    v12 = (CGImage *)v11;
    v13 = +[UIImage imageWithCGImage:v11 scale:0 orientation:a5];
    CGImageRelease(v12);
    unint64_t v14 = __UILogGetCategoryCachedImpl("StatusBar", &qword_1EB263028);
    if (*(unsigned char *)v14)
    {
      v15 = *(NSObject **)(v14 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412546;
        id v21 = v8;
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "...image %@ for group %@ found in the cache.", (uint8_t *)&v20, 0x16u);
      }
    }
  }
  else
  {
    unint64_t v16 = __UILogGetCategoryCachedImpl("StatusBar", &qword_1EB263030);
    if (*(unsigned char *)v16)
    {
      v19 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412546;
        id v21 = v8;
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "...image %@ for group %@ not found in the cache.", (uint8_t *)&v20, 0x16u);
      }
    }
    v13 = 0;
  }

  return v13;
}

- (void)cacheImage:(id)a3 named:(id)a4 forGroup:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(UIStatusBarCache *)self isWriteable])
  {
    id v11 = v8;
    if ([v11 CGImage])
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &qword_1EB263038);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v15 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v16 = 138412546;
          id v17 = v9;
          __int16 v18 = 2112;
          id v19 = v10;
          _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Caching image %@ for group %@", (uint8_t *)&v16, 0x16u);
        }
      }
      -[CPBitmapStore storeImageForKey:inGroup:opaque:image:](self->_store, "storeImageForKey:inGroup:opaque:image:", v9, v10, 0, [v11 CGImage]);
    }
  }
  else
  {
    unint64_t v13 = __UILogGetCategoryCachedImpl("StatusBar", &qword_1EB263040);
    if (*(unsigned char *)v13)
    {
      unint64_t v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "This process is not allowed to cache images.", (uint8_t *)&v16, 2u);
      }
    }
  }
}

- (void)removeImagesInGroup:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(UIStatusBarCache *)self isWriteable])
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &qword_1EB263058);
    if ((*(unsigned char *)CategoryCachedImpl & 1) == 0) {
      goto LABEL_6;
    }
    unint64_t v13 = *(NSObject **)(CategoryCachedImpl + 8);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    unint64_t v14 = "This process is not allowed to remove images in the cache.";
LABEL_9:
    _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_6;
  }
  if (!v4)
  {
    unint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("StatusBar", &qword_1EB263050) + 8);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    unint64_t v14 = "Status bar cache was asked to remove images in a nil group.";
    goto LABEL_9;
  }
  unint64_t v5 = __UILogGetCategoryCachedImpl("StatusBar", &qword_1EB263048);
  if (*(unsigned char *)v5)
  {
    v15 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Removing images in group %@", buf, 0xCu);
    }
  }
  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  v7 = (void *)UIApp;
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  uint64_t v10 = [v7 _beginBackgroundTaskWithName:v9 expirationHandler:0];

  store = self->_store;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__UIStatusBarCache_removeImagesInGroup___block_invoke;
  v16[3] = &__block_descriptor_40_e5_v8__0l;
  v16[4] = v10;
  [(CPBitmapStore *)store removeImagesInGroups:v6 completion:v16];

LABEL_6:
}

uint64_t __40__UIStatusBarCache_removeImagesInGroup___block_invoke(uint64_t a1)
{
  return [(id)UIApp _endBackgroundTask:*(void *)(a1 + 32)];
}

- (BOOL)isWriteable
{
  return self->_writeable;
}

- (void).cxx_destruct
{
}

@end