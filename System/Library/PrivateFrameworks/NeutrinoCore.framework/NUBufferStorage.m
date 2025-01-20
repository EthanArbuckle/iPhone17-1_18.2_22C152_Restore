@interface NUBufferStorage
- (BOOL)decrementUseCount;
- (BOOL)isInUse;
- (BOOL)isPurgeable;
- (BOOL)isPurged;
- (BOOL)isShared;
- (BOOL)makeNonPurgeable;
- (NSString)description;
- (NUBufferStorage)initWithSize:(id)a3 format:(id)a4;
- (const)bytes;
- (id)_purgeStateDescription;
- (id)newRenderDestination;
- (int)_fetchPurgeState:(int *)a3;
- (int)_purgeLevelToOSValue:(int64_t)a3;
- (int)useCount;
- (int64_t)purgeLevel;
- (int64_t)readBufferInRegion:(id)a3 block:(id)a4;
- (int64_t)rowBytes;
- (int64_t)sizeInBytes;
- (int64_t)useAsCIImageWithOptions:(id)a3 renderer:(id)a4 block:(id)a5;
- (int64_t)useAsCIRenderDestinationWithRenderer:(id)a3 block:(id)a4;
- (int64_t)writeBufferInRegion:(id)a3 block:(id)a4;
- (void)_allocateMemory:(int64_t)a3;
- (void)_deallocateMemory;
- (void)adjustPurgeLevel:(int64_t)a3;
- (void)dealloc;
- (void)incrementUseCount;
- (void)makePurgeable;
- (void)mutableBytes;
@end

@implementation NUBufferStorage

- (int64_t)rowBytes
{
  return self->_rowBytes;
}

- (const)bytes
{
  return self->_bytes;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  bytes = self->_bytes;
  int64_t length = self->_length;
  int64_t purgeLevel = self->_purgeLevel;
  v8 = [(NUBufferStorage *)self _purgeStateDescription];
  v9 = [v3 stringWithFormat:@"<%@:%p> bytes=%p length=%ld priority=%ld %@", v4, self, bytes, length, purgeLevel, v8];

  return (NSString *)v9;
}

- (id)newRenderDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F1E070]);
  uint64_t v4 = [(NUBufferStorage *)self mutableBytes];
  uint64_t v5 = [(_NUAbstractStorage *)self size];
  [(_NUAbstractStorage *)self size];
  uint64_t v7 = v6;
  int64_t v8 = [(NUBufferStorage *)self rowBytes];
  v9 = [(_NUAbstractStorage *)self format];
  v10 = objc_msgSend(v3, "initWithBitmapData:width:height:bytesPerRow:format:", v4, v5, v7, v8, objc_msgSend(v9, "CIFormat"));

  [v10 setLabel:@"NUBufferStorage-new"];
  return v10;
}

- (void)mutableBytes
{
  return self->_bytes;
}

- (int64_t)useAsCIRenderDestinationWithRenderer:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = 0;
  v21[1] = 0;
  v21[2] = [(_NUAbstractStorage *)self size];
  v21[3] = v8;
  v9 = +[NURegion regionWithRect:v21];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__NUBufferStorage_useAsCIRenderDestinationWithRenderer_block___block_invoke;
  v14[3] = &unk_1E5D945C0;
  v16 = &v17;
  id v10 = v7;
  id v15 = v10;
  int64_t v11 = [(NUBufferStorage *)self writeBufferInRegion:v9 block:v14];
  if (*((unsigned char *)v18 + 24)) {
    int64_t v12 = v11;
  }
  else {
    int64_t v12 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __62__NUBufferStorage_useAsCIRenderDestinationWithRenderer_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = (id)[a2 newRenderDestination];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

- (int64_t)useAsCIImageWithOptions:(id)a3 renderer:(id)a4 block:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
  }
  id v10 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    int64_t v11 = NSString;
    int64_t v12 = v10;
    v13 = [v11 stringWithFormat:@"Not implemented"];
    *(_DWORD *)v30 = 138543362;
    *(void *)&v30[4] = v13;
    _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v30, 0xCu);

    uint64_t v14 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v14 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
      }
      goto LABEL_8;
    }
    if (v14 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v15 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    char v20 = (void *)MEMORY[0x1E4F29060];
    v21 = v15;
    v22 = [v20 callStackSymbols];
    v23 = [v22 componentsJoinedByString:@"\n"];
    *(_DWORD *)v30 = 138543362;
    *(void *)&v30[4] = v23;
    _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v30, 0xCu);

    goto LABEL_14;
  }
  v24 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v26 = (void *)MEMORY[0x1E4F29060];
  id v27 = specific;
  v21 = v24;
  v28 = [v26 callStackSymbols];
  v29 = [v28 componentsJoinedByString:@"\n"];
  *(_DWORD *)v30 = 138543618;
  *(void *)&v30[4] = specific;
  __int16 v31 = 2114;
  v32 = v29;
  _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v30, 0x16u);

LABEL_14:
LABEL_15:
  _NUAssertFailHandler((uint64_t)"-[NUBufferStorage useAsCIImageWithOptions:renderer:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 299, @"Not implemented", v16, v17, v18, v19, *(uint64_t *)v30);
}

- (int64_t)writeBufferInRegion:(id)a3 block:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, NUMutableBufferAdapter *))a4;
  if ([(_NUAbstractStorage *)self isDirty])
  {
    uint64_t v8 = [(_NUAbstractStorage *)self size];
    uint64_t v10 = v9;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = v8;
    uint64_t v18 = v9;
    int64_t v11 = +[NURegion regionWithRect:&v15];
    char v12 = [v6 isEqualToRegion:v11];

    if ((v12 & 1) == 0)
    {
      v19[0] = 0;
      v19[1] = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = v8;
      uint64_t v18 = v10;
      +[NUImageUtilities fillPixelsInBuffer:self rect:&v15 srcPixel:v19];
    }
    [(_NUAbstractStorage *)self setIsDirty:0];
  }
  v13 = [[NUMutableBufferAdapter alloc] initWithMutableBuffer:self];
  v7[2](v7, v13);

  [(NUBufferAdapter *)v13 invalidate];
  [(_NUAbstractStorage *)self validateRegion:v6];

  return 1;
}

- (int64_t)readBufferInRegion:(id)a3 block:(id)a4
{
  id v6 = (void (**)(id, NUBufferAdapter *))a4;
  [(_NUAbstractStorage *)self assertIsValidInRegion:a3];
  id v7 = [[NUBufferAdapter alloc] initWithBuffer:self];
  v6[2](v6, v7);

  [(NUBufferAdapter *)v7 invalidate];
  return 1;
}

- (BOOL)makeNonPurgeable
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!self->_purgeable) {
    return 1;
  }
  int v28 = 0;
  uint64_t v3 = MEMORY[0x1AD0FB0D0](*MEMORY[0x1E4F14960], self->_bytes, 0, &v28);
  if (v28 == 2 && v3 == 0)
  {
    BOOL result = 0;
    self->_purgeable = 0;
    return result;
  }
  uint64_t v5 = v3;
  if (!v3)
  {
    self->_purgeable = 0;
    return 1;
  }
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
  }
  id v6 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSString;
    uint64_t v8 = v6;
    uint64_t v9 = [v7 stringWithFormat:@"%@ failed to make non purgeable: %d", self, v5];
    *(_DWORD *)buf = 138543362;
    v30 = v9;
    _os_log_impl(&dword_1A9892000, v8, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
      }
LABEL_17:
      char v12 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = specific;
        char v20 = v12;
        v21 = [v18 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v30 = specific;
        __int16 v31 = 2114;
        v32 = v22;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_24:
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
    }
  }
  else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    goto LABEL_17;
  }
  v23 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)MEMORY[0x1E4F29060];
    char v20 = v23;
    v26 = [v25 callStackSymbols];
    id v27 = [v26 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v30 = v27;
    _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_24;
  }
LABEL_22:
  _NUAssertContinueHandler((uint64_t)"-[NUBufferStorage makeNonPurgeable]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 257, @"%@ failed to make non purgeable: %d", v13, v14, v15, v16, (uint64_t)self);
  [(NUBufferStorage *)self _deallocateMemory];
  v24 = [(NUBufferStorage *)self _allocateMemory:self->_length];
  BOOL result = 0;
  self->_bytes = v24;
  return result;
}

- (void)makePurgeable
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!self->_purgeable)
  {
    self->_purgeable = 1;
    int v25 = [(NUBufferStorage *)self _purgeLevelToOSValue:self->_purgeLevel];
    uint64_t v3 = MEMORY[0x1AD0FB0D0](*MEMORY[0x1E4F14960], self->_bytes, 0, &v25);
    if (v3)
    {
      uint64_t v4 = v3;
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
      }
      uint64_t v5 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = NSString;
        id v7 = v5;
        uint64_t v8 = [v6 stringWithFormat:@"%@ failed to set purgeable: %d", self, v4];
        *(_DWORD *)buf = 138543362;
        id v27 = v8;
        _os_log_impl(&dword_1A9892000, v7, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

        uint64_t v9 = _NULogOnceToken;
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v9 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
          }
LABEL_10:
          uint64_t v10 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            uint64_t v16 = (void *)MEMORY[0x1E4F29060];
            id v17 = specific;
            uint64_t v18 = v10;
            id v19 = [v16 callStackSymbols];
            char v20 = [v19 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            id v27 = specific;
            __int16 v28 = 2114;
            v29 = v20;
            _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_18:
            goto LABEL_15;
          }
          goto LABEL_15;
        }
        if (v9 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
        }
      }
      else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        goto LABEL_10;
      }
      v21 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)MEMORY[0x1E4F29060];
        uint64_t v18 = v21;
        v23 = [v22 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v27 = v24;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        goto LABEL_18;
      }
LABEL_15:
      _NUAssertContinueHandler((uint64_t)"-[NUBufferStorage makePurgeable]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 233, @"%@ failed to set purgeable: %d", v11, v12, v13, v14, (uint64_t)self);
    }
  }
}

- (void)adjustPurgeLevel:(int64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_purgeLevel != a3)
  {
    self->_int64_t purgeLevel = a3;
    if (self->_purgeable)
    {
      int v26 = -[NUBufferStorage _purgeLevelToOSValue:](self, "_purgeLevelToOSValue:");
      uint64_t v4 = MEMORY[0x1AD0FB0D0](*MEMORY[0x1E4F14960], self->_bytes, 0, &v26);
      if (v4)
      {
        uint64_t v5 = v4;
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
        }
        id v6 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = NSString;
          uint64_t v8 = v6;
          uint64_t v9 = [v7 stringWithFormat:@"%@ failed to reset vm_purgable_control: %d", self, v5];
          *(_DWORD *)buf = 138543362;
          __int16 v28 = v9;
          _os_log_impl(&dword_1A9892000, v8, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          uint64_t v10 = _NULogOnceToken;
          if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
          {
            if (v10 != -1) {
              dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
            }
LABEL_11:
            uint64_t v11 = (void *)_NUAssertLogger;
            if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
            {
              specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              id v17 = (void *)MEMORY[0x1E4F29060];
              id v18 = specific;
              id v19 = v11;
              char v20 = [v17 callStackSymbols];
              v21 = [v20 componentsJoinedByString:@"\n"];
              *(_DWORD *)buf = 138543618;
              __int16 v28 = specific;
              __int16 v29 = 2114;
              uint64_t v30 = v21;
              _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_19:
              goto LABEL_16;
            }
            goto LABEL_16;
          }
          if (v10 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
          }
        }
        else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          goto LABEL_11;
        }
        v22 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          v23 = (void *)MEMORY[0x1E4F29060];
          id v19 = v22;
          v24 = [v23 callStackSymbols];
          int v25 = [v24 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          __int16 v28 = v25;
          _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          goto LABEL_19;
        }
LABEL_16:
        _NUAssertContinueHandler((uint64_t)"-[NUBufferStorage adjustPurgeLevel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 216, @"%@ failed to reset vm_purgable_control: %d", v12, v13, v14, v15, (uint64_t)self);
      }
    }
  }
}

- (int64_t)purgeLevel
{
  return self->_purgeLevel;
}

- (int)_purgeLevelToOSValue:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 33;
  }
  else {
    return dword_1A9A72EE0[a3 - 1];
  }
}

- (id)_purgeStateDescription
{
  if (!self->_purgeable) {
    return @"Not Purgeable";
  }
  unsigned int v3 = 0;
  if ([(NUBufferStorage *)self _fetchPurgeState:&v3]) {
    return 0;
  }
  if (v3 > 3) {
    return @"Purgeable (Unknown)";
  }
  return off_1E5D945E0[v3];
}

- (int)_fetchPurgeState:(int *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MEMORY[0x1AD0FB0D0](*MEMORY[0x1E4F14960], self->_bytes, 1, a3);
  if (v4)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
    }
    uint64_t v5 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSString;
      id v7 = v5;
      uint64_t v8 = [v6 stringWithFormat:@"%@ failed to read vm_purgable_control: %d", self, v4];
      *(_DWORD *)buf = 138543362;
      id v27 = v8;
      _os_log_impl(&dword_1A9892000, v7, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v9 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v9 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
        }
LABEL_9:
        uint64_t v10 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v16 = (void *)MEMORY[0x1E4F29060];
          id v17 = specific;
          id v18 = v10;
          id v19 = [v16 callStackSymbols];
          char v20 = [v19 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          id v27 = specific;
          __int16 v28 = 2114;
          __int16 v29 = v20;
          _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_17:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v9 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_9;
    }
    v21 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)MEMORY[0x1E4F29060];
      id v18 = v21;
      v24 = [v23 callStackSymbols];
      int v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v27 = v25;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_17;
    }
LABEL_14:
    _NUAssertContinueHandler((uint64_t)"-[NUBufferStorage _fetchPurgeState:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 138, @"%@ failed to read vm_purgable_control: %d", v11, v12, v13, v14, (uint64_t)self);
  }
  return v4;
}

- (int)useCount
{
  return atomic_load((unsigned int *)&self->_useCount);
}

- (BOOL)decrementUseCount
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int add = atomic_fetch_add(&self->_useCount, 0xFFFFFFFF);
  if (add <= 0)
  {
    uint64_t v4 = NUAssertLogger_8992();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [NSString stringWithFormat:@"over released use count on buffer storage"];
      *(_DWORD *)char v20 = 138543362;
      *(void *)&v20[4] = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v20, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v7 = NUAssertLogger_8992();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        uint64_t v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v12 = (void *)MEMORY[0x1E4F29060];
        id v13 = v11;
        uint64_t v14 = [v12 callStackSymbols];
        uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)char v20 = 138543618;
        *(void *)&v20[4] = v11;
        __int16 v21 = 2114;
        v22 = v15;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v20, 0x16u);
      }
    }
    else if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)char v20 = 138543362;
      *(void *)&v20[4] = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v20, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUBufferStorage decrementUseCount]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 126, @"over released use count on buffer storage", v16, v17, v18, v19, *(uint64_t *)v20);
  }
  return add == 1;
}

- (void)incrementUseCount
{
}

- (BOOL)isInUse
{
  signed int v2 = atomic_load((unsigned int *)&self->_useCount);
  return v2 > 0;
}

- (BOOL)isShared
{
  signed int v2 = atomic_load((unsigned int *)&self->_useCount);
  return v2 > 1;
}

- (BOOL)isPurgeable
{
  return self->_purgeable;
}

- (BOOL)isPurged
{
  int v4 = 0;
  return ![(NUBufferStorage *)self _fetchPurgeState:&v4] && v4 == 2;
}

- (void)_deallocateMemory
{
  self->_bytes = 0;
}

- (void)_allocateMemory:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  vm_address_t address = 0;
  uint64_t v4 = vm_allocate(*MEMORY[0x1E4F14960], &address, (a3 + *MEMORY[0x1E4F14B00] - 1) & -*MEMORY[0x1E4F14B00], -117440509);
  if (v4)
  {
    uint64_t v6 = v4;
    id v7 = NUAssertLogger_8992();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = [NSString stringWithFormat:@"%@ failed to vm_allocate: %d", self, v6];
      *(_DWORD *)buf = 138543362;
      int v25 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v10 = NUAssertLogger_8992();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        uint64_t v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        uint64_t v17 = [v15 callStackSymbols];
        uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        int v25 = v14;
        __int16 v26 = 2114;
        id v27 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      int v25 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUBufferStorage _allocateMemory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 88, @"%@ failed to vm_allocate: %d", v19, v20, v21, v22, (uint64_t)self);
  }
  return (void *)address;
}

- (int64_t)sizeInBytes
{
  return (self->_length + *MEMORY[0x1E4F14B00] - 1) & -*MEMORY[0x1E4F14B00];
}

- (void)dealloc
{
  [(NUBufferStorage *)self _deallocateMemory];
  v3.receiver = self;
  v3.super_class = (Class)NUBufferStorage;
  [(NUBufferStorage *)&v3 dealloc];
}

- (NUBufferStorage)initWithSize:(id)a3 format:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    uint64_t v12 = NUAssertLogger_8992();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pixelFormat != nil");
      *(_DWORD *)buf = 138543362;
      v47 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v15 = NUAssertLogger_8992();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        uint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        uint64_t v22 = [v20 callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = v19;
        __int16 v48 = 2114;
        v49 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUBufferStorage initWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 51, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"pixelFormat != nil");
  }
  BOOL v8 = v7;
  v45.receiver = self;
  v45.super_class = (Class)NUBufferStorage;
  uint64_t v9 = [(_NUAbstractStorage *)&v45 init];
  uint64_t v10 = [v8 alignedRowBytesForWidth:var0];
  v9->_rowBytes = v10;
  v9->_int64_t length = var1 * v10;
  if ((unsigned __int128)(var1 * (__int128)v10) >> 64 != (var1 * v10) >> 63)
  {
    uint64_t v28 = NUAssertLogger_8992();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = [NSString stringWithFormat:@"integer overflow detected"];
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v31 = NUAssertLogger_8992();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = v35;
        __int16 v48 = 2114;
        v49 = v39;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUBufferStorage initWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 59, @"integer overflow detected", v40, v41, v42, v43, v44);
  }
  v9->_bytes = -[NUBufferStorage _allocateMemory:](v9, "_allocateMemory:");
  v9->_int64_t purgeLevel = 1;
  atomic_store(0, (unsigned int *)&v9->_useCount);
  -[_NUAbstractStorage _resetSize:format:](v9, "_resetSize:format:", var0, var1, v8);

  return v9;
}

@end