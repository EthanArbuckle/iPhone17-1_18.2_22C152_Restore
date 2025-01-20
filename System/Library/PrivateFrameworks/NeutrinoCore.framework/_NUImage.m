@interface _NUImage
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (BOOL)beginAccess;
- (BOOL)beginAccessRegion:(id)a3;
- (BOOL)copyBufferStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5;
- (BOOL)copySurfaceStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5 device:(id)a6;
- (NSString)description;
- (NUColorSpace)colorSpace;
- (NUImageLayout)layout;
- (NUPixelFormat)format;
- (NURegion)validRegion;
- (_NUImage)init;
- (_NUImage)initWithLayout:(id)a3 format:(id)a4 colorSpace:(id)a5 tileFactory:(id)a6;
- (id).cxx_construct;
- (id)_createOrCopyTile:(id)a3 tileInfo:(id)a4 writeRegion:(id)a5;
- (id)_nonPurgeableCopy;
- (id)_purgeableCopy;
- (id)_tileAtIndex:(unint64_t)a3;
- (id)tileAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)endAccess;
- (void)endAccessRegion:(id)a3;
- (void)readRegion:(id)a3 withBlock:(id)a4;
- (void)setValidRegion:(id)a3;
- (void)writeRegion:(id)a3 withBlock:(id)a4;
@end

@implementation _NUImage

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_accessCount.__begin_;
  if (begin)
  {
    self->_accessCount.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_tileFactory, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_validRegion, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setValidRegion:(id)a3
{
}

- (NURegion)validRegion
{
  return (NURegion *)objc_getProperty(self, a2, 48, 1);
}

- (NUColorSpace)colorSpace
{
  return (NUColorSpace *)objc_getProperty(self, a2, 40, 1);
}

- (NUPixelFormat)format
{
  return (NUPixelFormat *)objc_getProperty(self, a2, 32, 1);
}

- (NUImageLayout)layout
{
  return (NUImageLayout *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)copyBufferStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
  }
  v6 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = NSString;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [v7 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v9];
    *(_DWORD *)buf = 138543362;
    v24 = v10;
    _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
    }
    v11 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      __int16 v25 = 2114;
      v26 = v16;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
    }
    v11 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v24 = v13;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  v17 = (objc_class *)objc_opt_class();
  uint64_t v18 = NSStringFromClass(v17);
  _NUAssertFailHandler((uint64_t)"-[_NUImage copyBufferStorage:fromRect:toPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 875, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v19, v20, v21, v22, v18);
}

- (BOOL)copySurfaceStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5 device:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a6;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
  }
  v9 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [v10 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v12];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
    }
    v14 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v17;
      __int16 v28 = 2114;
      v29 = v19;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
    }
    v14 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v16;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  uint64_t v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[_NUImage copySurfaceStorage:fromRect:toPoint:device:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 870, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (id)_nonPurgeableCopy
{
  v2 = [(_NUImage *)self _purgeableCopy];
  [v2 beginAccess];

  return v2;
}

- (id)_purgeableCopy
{
  uint64_t v3 = [objc_alloc((Class)objc_opt_class()) initWithLayout:self->_layout format:self->_format colorSpace:self->_colorSpace tileFactory:self->_tileFactory];
  objc_storeStrong((id *)(v3 + 64), self->_tileFactory);
  size_t v4 = [(NUImageLayout *)self->_layout tileCount];
  char v13 = 0;
  std::vector<unsigned char>::vector(&v14, v4, &v13);
  id v5 = *(void **)(v3 + 72);
  if (v5)
  {
    *(void *)(v3 + 80) = v5;
    operator delete(v5);
    *(void *)(v3 + 72) = 0;
    *(void *)(v3 + 80) = 0;
    *(void *)(v3 + 88) = 0;
  }
  *(_OWORD *)(v3 + 72) = v14;
  *(void *)(v3 + 88) = v15;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26___NUImage__purgeableCopy__block_invoke;
  block[3] = &unk_1E5D95E18;
  id v7 = (id)v3;
  id v11 = v7;
  v12 = self;
  dispatch_sync(queue, block);
  id v8 = v7;

  return v8;
}

- (void)endAccessRegion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v7 = NUAssertLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "region != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v10 = NUAssertLogger();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        long long v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
        v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v14;
        __int16 v25 = 2114;
        v26 = v16;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImage endAccessRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 805, @"Invalid parameter not satisfying: %s", v17, v18, v19, v20, (uint64_t)"region != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28___NUImage_endAccessRegion___block_invoke;
  block[3] = &unk_1E5D95E18;
  void block[4] = self;
  id v22 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)endAccess
{
  uint64_t v3 = [(NUImageLayout *)self->_layout imageSize];
  v6[0] = 0;
  v6[1] = 0;
  v6[2] = v3;
  v6[3] = v4;
  id v5 = +[NURegion regionWithRect:v6];
  [(_NUImage *)self endAccessRegion:v5];
}

- (BOOL)beginAccessRegion:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30___NUImage_beginAccessRegion___block_invoke;
  block[3] = &unk_1E5D959D8;
  void block[4] = self;
  id v9 = v4;
  v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)beginAccess
{
  v2 = self;
  uint64_t v3 = [(NUImageLayout *)self->_layout imageSize];
  v7[0] = 0;
  v7[1] = 0;
  v7[2] = v3;
  v7[3] = v4;
  id v5 = +[NURegion regionWithRect:v7];
  LOBYTE(v2) = [(_NUImage *)v2 beginAccessRegion:v5];

  return (char)v2;
}

- (void)writeRegion:(id)a3 withBlock:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEmpty])
  {
    uint64_t v13 = NUAssertLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      char v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "![region isEmpty]");
      *(_DWORD *)buf = 138543362;
      v35 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v16 = NUAssertLogger();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        uint64_t v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v35 = v20;
        __int16 v36 = 2114;
        v37 = v22;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v35 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImage writeRegion:withBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 696, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"![region isEmpty]");
  }
  layout = self->_layout;
  if (v6) {
    [v6 bounds];
  }
  else {
    memset(v33, 0, sizeof(v33));
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __34___NUImage_writeRegion_withBlock___block_invoke;
  v29[3] = &unk_1E5D95910;
  id v9 = v6;
  id v30 = v9;
  v31 = self;
  id v10 = v7;
  id v32 = v10;
  [(NUImageLayout *)layout enumerateTilesForWritingInRect:v33 withBlock:v29];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34___NUImage_writeRegion_withBlock___block_invoke_5;
  block[3] = &unk_1E5D95E18;
  void block[4] = self;
  id v28 = v9;
  id v12 = v9;
  dispatch_sync(queue, block);
}

- (id)_createOrCopyTile:(id)a3 tileInfo:(id)a4 writeRegion:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v60 = a5;
  uint64_t v10 = [v9 index];
  uint64_t v11 = [_NUImageTile alloc];
  tileFactory = self->_tileFactory;
  uint64_t v13 = [v9 size];
  uint64_t v15 = (void *)-[NUStorageFactory newStorageWithSize:format:](tileFactory, "newStorageWithSize:format:", v13, v14, self->_format);
  v16 = [(_NUImageTile *)v11 initWithStorage:v15];

  if ([(_NUImageTile *)v16 accessCount] != 1)
  {
    v39 = NUAssertLogger();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = [NSString stringWithFormat:@"Tile should have an access count"];
      *(_DWORD *)v75 = 138543362;
      *(void *)&v75[4] = v40;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v75, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v42 = NUAssertLogger();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v43)
      {
        v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v47 = [MEMORY[0x1E4F29060] callStackSymbols];
        v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)v75 = 138543618;
        *(void *)&v75[4] = v46;
        *(_WORD *)&v75[12] = 2114;
        *(void *)&v75[14] = v48;
        _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v75, 0x16u);
      }
    }
    else if (v43)
    {
      v44 = [MEMORY[0x1E4F29060] callStackSymbols];
      v45 = [v44 componentsJoinedByString:@"\n"];
      *(_DWORD *)v75 = 138543362;
      *(void *)&v75[4] = v45;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v75, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImage _createOrCopyTile:tileInfo:writeRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 600, @"Tile should have an access count", v49, v50, v51, v52, v53);
  }
  if (v8)
  {
    memset(v75, 0, sizeof(v75));
    if (v9) {
      [v9 frameRect];
    }
    BOOL v17 = [(_NUImage *)self validRegion];
    v70[0] = *(_OWORD *)v75;
    v70[1] = *(_OWORD *)&v75[16];
    uint64_t v18 = [v17 regionByClippingToRect:v70];

    uint64_t v19 = [v18 regionByRemovingRegion:v60];
    uint64_t v20 = (void *)[v19 mutableCopy];

    objc_msgSend(v20, "translateBy:", -*(void *)v75, -*(void *)&v75[8]);
    if (([v20 isEmpty] & 1) == 0)
    {
      uint64_t v21 = [(_NUImageTile *)v16 copyFromTile:v8 region:v20];
      if (v21 != 1)
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
        }
        id v22 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = [NSString stringWithFormat:@"%@: failed to copy tile %@ -> %@ result=%ld", self, v8, v16, v21];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v23;
          _os_log_impl(&dword_1A9892000, v22, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
          }
          v58 = (id)_NUAssertLogger;
          uint64_t v24 = v58;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v55 = [MEMORY[0x1E4F29060] callStackSymbols];
            uint64_t v37 = [v55 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v56;
            *(_WORD *)&buf[12] = 2114;
            v54 = (void *)v37;
            *(void *)&buf[14] = v37;
            _os_log_error_impl(&dword_1A9892000, v58, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
          }
          uint64_t v24 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v59 = [MEMORY[0x1E4F29060] callStackSymbols];
            uint64_t v38 = [v59 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543362;
            v57 = (void *)v38;
            *(void *)&uint8_t buf[4] = v38;
            _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
          }
        }

        _NUAssertContinueHandler((uint64_t)"-[_NUImage _createOrCopyTile:tileInfo:writeRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 618, @"%@: failed to copy tile %@ -> %@ result=%ld", v25, v26, v27, v28, (uint64_t)self);
        queue = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __51___NUImage__createOrCopyTile_tileInfo_writeRegion___block_invoke;
        block[3] = &unk_1E5D95938;
        void block[4] = self;
        long long v68 = *(_OWORD *)v75;
        long long v69 = *(_OWORD *)&v75[16];
        dispatch_sync(queue, block);
      }
    }
  }
  *(void *)v75 = 0;
  *(void *)&v75[8] = v75;
  *(void *)&v75[16] = 0x3032000000;
  *(void *)&v75[24] = __Block_byref_object_copy__26275;
  v76 = __Block_byref_object_dispose__26276;
  id v77 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v72 = __Block_byref_object_copy__26275;
  v73 = __Block_byref_object_dispose__26276;
  id v30 = v16;
  v74 = v30;
  v31 = self->_queue;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __51___NUImage__createOrCopyTile_tileInfo_writeRegion___block_invoke_2;
  v61[3] = &unk_1E5D95960;
  v61[4] = self;
  uint64_t v66 = v10;
  id v32 = v8;
  id v62 = v32;
  v64 = v75;
  v33 = v30;
  v63 = v33;
  v65 = buf;
  dispatch_sync(v31, v61);
  v34 = *(void **)(*(void *)&v75[8] + 40);
  if (v34) {
    [v34 returnToStorageFactory:self->_tileFactory];
  }
  id v35 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v75, 8);

  return v35;
}

- (void)readRegion:(id)a3 withBlock:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEmpty])
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
    }
    id v8 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "![region isEmpty]");
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v9;
      _os_log_impl(&dword_1A9892000, v8, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);
    }
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
      }
      uint64_t v10 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v12 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v11;
        __int16 v28 = 2114;
        v29 = v13;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
      }
      uint64_t v10 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v27 = v20;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
    }

    _NUAssertContinueHandler((uint64_t)"-[_NUImage readRegion:withBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 568, @"Invalid parameter not satisfying: %s", v14, v15, v16, v17, (uint64_t)"![region isEmpty]");
  }
  if (([v6 isEmpty] & 1) == 0)
  {
    layout = self->_layout;
    if (v6) {
      [v6 bounds];
    }
    else {
      memset(v25, 0, sizeof(v25));
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __33___NUImage_readRegion_withBlock___block_invoke;
    v21[3] = &unk_1E5D95910;
    id v22 = v6;
    uint64_t v23 = self;
    id v24 = v7;
    [(NUImageLayout *)layout enumerateTilesForReadingInRect:v25 withBlock:v21];
  }
}

- (id)tileAtIndex:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__26275;
  uint64_t v11 = __Block_byref_object_dispose__26276;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24___NUImage_tileAtIndex___block_invoke;
  block[3] = &unk_1E5D958C0;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_tileAtIndex:(unint64_t)a3
{
  return [(NSPointerArray *)self->_tiles pointerAtIndex:a3];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2 = [(NUImageLayout *)self->_layout imageSize];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSString)description
{
  int64_t v3 = [(_NUImage *)self layout];
  uint64_t v4 = [v3 tileCount];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23___NUImage_description__block_invoke;
  block[3] = &unk_1E5D95C28;
  uint64_t v21 = v4;
  void block[4] = self;
  id v18 = v5;
  id v20 = v18;
  dispatch_sync(queue, block);
  uint64_t v7 = NSString;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(_NUImage *)self size];
  [(_NUImage *)self size];
  uint64_t v11 = v10;
  id v12 = [(_NUImage *)self format];
  uint64_t v13 = [(_NUImage *)self colorSpace];
  uint64_t v14 = [v13 name];
  uint64_t v15 = [v18 componentsJoinedByString:@"\n"];
  uint64_t v16 = [v7 stringWithFormat:@"<%@:%p> size: %dx%d, format: %@, space: %@, %d tiles:\n%@", v8, self, v9, v11, v12, v14, v4, v15];

  return (NSString *)v16;
}

- (void)dealloc
{
  int64_t v3 = [(NUImageLayout *)self->_layout tileCount];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      id v5 = [(NSPointerArray *)self->_tiles pointerAtIndex:i];
      id v6 = v5;
      if (v5)
      {
        if (self->_accessCount.__begin_[i]) {
          [v5 decrementAccessCountButLeaveAccessedIfLastUse];
        }
        [v6 returnToStorageFactory:self->_tileFactory];
      }
    }
  }
  tiles = self->_tiles;
  self->_tiles = 0;

  v8.receiver = self;
  v8.super_class = (Class)_NUImage;
  [(_NUImage *)&v8 dealloc];
}

- (_NUImage)initWithLayout:(id)a3 format:(id)a4 colorSpace:(id)a5 tileFactory:(id)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  if (!v11)
  {
    v31 = NUAssertLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "layout != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v34 = NUAssertLogger();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        uint64_t v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v51 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v52 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v50;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v52;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      __int16 v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v53 = "layout != nil";
    uint64_t v54 = 482;
LABEL_33:

    _NUAssertFailHandler((uint64_t)"-[_NUImage initWithLayout:format:colorSpace:tileFactory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", v54, @"Invalid parameter not satisfying: %s", v61, v62, v63, v64, (uint64_t)v53);
  }
  if (!v12)
  {
    uint64_t v38 = NUAssertLogger();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "format != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v39;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v34 = NUAssertLogger();
    BOOL v41 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v41)
      {
        v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v56 = [MEMORY[0x1E4F29060] callStackSymbols];
        v57 = [v56 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v55;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v57;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v41)
    {
      v42 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v43 = [v42 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v43;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v53 = "format != nil";
    uint64_t v54 = 483;
    goto LABEL_33;
  }
  if (!v14)
  {
    v44 = NUAssertLogger();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "tileFactory != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v45;
      _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v34 = NUAssertLogger();
    BOOL v47 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v46)
    {
      if (v47)
      {
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v59 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v60 = [v59 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v58;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v60;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v47)
    {
      v48 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v49 = [v48 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v49;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v53 = "tileFactory != nil";
    uint64_t v54 = 484;
    goto LABEL_33;
  }
  v66.receiver = self;
  v66.super_class = (Class)_NUImage;
  uint64_t v16 = [(_NUImage *)&v66 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_layout, a3);
    objc_storeStrong((id *)&v17->_format, a4);
    objc_storeStrong((id *)&v17->_colorSpace, a5);
    uint64_t v18 = +[NURegion region];
    validRegion = v17->_validRegion;
    v17->_validRegion = (NURegion *)v18;

    objc_storeStrong((id *)&v17->_tileFactory, a6);
    size_t v20 = [(NUImageLayout *)v17->_layout tileCount];
    uint64_t v21 = [MEMORY[0x1E4F28F50] strongObjectsPointerArray];
    tiles = v17->_tiles;
    v17->_tiles = (NSPointerArray *)v21;

    [(NSPointerArray *)v17->_tiles setCount:v20];
    uint64_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create("_NUImage", v23);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v24;

    uint64_t v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("_NUImage.write", v26);
    writeQueue = v17->_writeQueue;
    v17->_writeQueue = (OS_dispatch_queue *)v27;

    char v65 = 0;
    std::vector<unsigned char>::vector(buf, v20, &v65);
    begin = v17->_accessCount.__begin_;
    if (begin)
    {
      v17->_accessCount.__end_ = begin;
      operator delete(begin);
      v17->_accessCount.__begin_ = 0;
      v17->_accessCount.__end_ = 0;
      v17->_accessCount.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v17->_accessCount.__begin_ = *(_OWORD *)buf;
    v17->_accessCount.__end_cap_.__value_ = *(char **)&buf[16];
  }

  return v17;
}

- (_NUImage)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
  }
  int64_t v3 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSString;
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(a2);
    objc_super v8 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v6, v7];
    *(_DWORD *)buf = 138543362;
    id v22 = v8;
    _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
    }
    uint64_t v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      id v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v22 = v12;
      __int16 v23 = 2114;
      dispatch_queue_t v24 = v14;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
    }
    uint64_t v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v22 = v11;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[_NUImage init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 478, @"Initializer not available: -[%@ %@], use designated initializer instead.", v17, v18, v19, v20, v16);
}

@end