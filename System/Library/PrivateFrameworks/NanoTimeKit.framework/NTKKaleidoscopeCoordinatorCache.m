@interface NTKKaleidoscopeCoordinatorCache
+ (id)sharedCache;
- (id)provideAtlasBacking:(id)a3 uuid:(id)a4 uuidLuma:(id)a5 uuidChroma:(id)a6;
- (void)_computeKaleidoscopeFaceCount;
- (void)faceCollection:(id)a3 didAddFace:(id)a4 atIndex:(unint64_t)a5;
- (void)faceCollection:(id)a3 didRemoveFace:(id)a4 atIndex:(unint64_t)a5;
- (void)setLibraryCollection:(id)a3;
@end

@implementation NTKKaleidoscopeCoordinatorCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_4[0] != -1) {
    dispatch_once(sharedCache_onceToken_4, &__block_literal_global_175);
  }
  v2 = (void *)sharedCache_cache_1;
  return v2;
}

void __46__NTKKaleidoscopeCoordinatorCache_sharedCache__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedCache_cache_1;
  sharedCache_cache_1 = v0;
}

- (void)setLibraryCollection:(id)a3
{
  v5 = (NTKFaceCollection *)a3;
  if (self->_libraryCollection != v5)
  {
    v11 = v5;
    [(NTKFaceCollection *)v5 addObserver:self];
    [(NTKFaceCollection *)self->_libraryCollection removeObserver:self];
    objc_storeStrong((id *)&self->_libraryCollection, a3);
    [(NTKKaleidoscopeCoordinatorCache *)self _computeKaleidoscopeFaceCount];
    if (self->_libraryCollection)
    {
      v6 = (NSMutableArray *)objc_opt_new();
      pathsToTouch = self->_pathsToTouch;
      self->_pathsToTouch = v6;

      v8 = (NSMutableDictionary *)objc_opt_new();
      pathsToWrite = self->_pathsToWrite;
      self->_pathsToWrite = v8;
    }
    else
    {
      v10 = self->_pathsToTouch;
      self->_pathsToTouch = 0;

      pathsToWrite = self->_pathsToWrite;
      self->_pathsToWrite = 0;
    }

    v5 = v11;
  }
}

- (id)provideAtlasBacking:(id)a3 uuid:(id)a4 uuidLuma:(id)a5 uuidChroma:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = MEMORY[0x1C1875BE0]();
  id v14 = [off_1E62BDB48 atlasBackingWithImage:v9 uuid:v10 mipmap:1];
  id v15 = v11;
  id v16 = v12;
  v26 = v9;
  if (v14)
  {
    uint64_t v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    [v14 structure];
    v17 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_DEFAULT, "[kaleidoscope] input backing format is not srgba8888", buf, 2u);
    }

    if (!HIBYTE(v30))
    {
      v18 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_DEFAULT, "[kaleidoscope] input backing mipmaps expected", buf, 2u);
      }
    }
    if (HIDWORD(v28) == v29)
    {
      if ((HIDWORD(v28) & (HIDWORD(v28) - 1)) == 0)
      {
LABEL_16:
        v19 = (void *)v13;
        goto LABEL_21;
      }
    }
    else
    {
      v23 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v23, OS_LOG_TYPE_DEFAULT, "[kaleidoscope] input backing is not square", buf, 2u);
      }

      if ((HIDWORD(v28) & (HIDWORD(v28) - 1)) == 0) {
        goto LABEL_16;
      }
    }
    v19 = (void *)v13;
    v20 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v21 = "[kaleidoscope] input backing is not POT";
      v22 = buf;
      goto LABEL_19;
    }
  }
  else
  {
    v19 = (void *)v13;
    v20 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      v21 = "[kaleidoscope] input backing is nil";
      v22 = (uint8_t *)&v28;
LABEL_19:
      _os_log_impl(&dword_1BC5A9000, v20, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
    }
  }

LABEL_21:
  id v24 = 0;

  return 0;
}

- (void)faceCollection:(id)a3 didAddFace:(id)a4 atIndex:(unint64_t)a5
{
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(NTKKaleidoscopeCoordinatorCache *)self _computeKaleidoscopeFaceCount];
  }
}

- (void)faceCollection:(id)a3 didRemoveFace:(id)a4 atIndex:(unint64_t)a5
{
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(NTKKaleidoscopeCoordinatorCache *)self _computeKaleidoscopeFaceCount];
  }
}

- (void)_computeKaleidoscopeFaceCount
{
  unint64_t v3 = [(NTKFaceCollection *)self->_libraryCollection numberOfFaces];
  if (v3)
  {
    unint64_t v4 = v3;
    unint64_t v5 = 0;
    for (uint64_t i = 0; i != v4; ++i)
    {
      v7 = [(NTKFaceCollection *)self->_libraryCollection faceAtIndex:i];
      objc_opt_class();
      v5 += objc_opt_isKindOfClass() & 1;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  self->_kaleidoscopeFaceCount = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathsToWrite, 0);
  objc_storeStrong((id *)&self->_pathsToTouch, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_libraryCollection, 0);
}

@end