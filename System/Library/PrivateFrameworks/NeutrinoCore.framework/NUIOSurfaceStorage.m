@interface NUIOSurfaceStorage
- (BOOL)decrementUseCount;
- (BOOL)isInUse;
- (BOOL)isPurgeable;
- (BOOL)isPurged;
- (BOOL)isShared;
- (BOOL)makeNonPurgeable;
- (NSString)description;
- (NUIOSurfaceStorage)initWithSize:(id)a3 format:(id)a4;
- (NUIOSurfaceStorage)initWithSurface:(id)a3;
- (int)useCount;
- (int64_t)_copyFromIOSurfaceStorage:(id)a3 region:(id)a4 device:(id)a5;
- (int64_t)copyFromStorage:(id)a3 region:(id)a4;
- (int64_t)purgeLevel;
- (int64_t)readBufferInRegion:(id)a3 block:(id)a4;
- (int64_t)readSurfaceInRegion:(id)a3 block:(id)a4;
- (int64_t)readTextureInRegion:(id)a3 device:(id)a4 block:(id)a5;
- (int64_t)rowBytes;
- (int64_t)sizeInBytes;
- (int64_t)useAsCIImageWithOptions:(id)a3 renderer:(id)a4 block:(id)a5;
- (int64_t)useAsCIRenderDestinationWithRenderer:(id)a3 block:(id)a4;
- (int64_t)useAsCVPixelBufferWithBlock:(id)a3;
- (int64_t)writeBufferInRegion:(id)a3 block:(id)a4;
- (int64_t)writeSurfaceInRegion:(id)a3 block:(id)a4;
- (int64_t)writeTextureInRegion:(id)a3 device:(id)a4 block:(id)a5;
- (void)_allocateSurface;
- (void)adjustPurgeLevel:(int64_t)a3;
- (void)incrementUseCount;
- (void)makePurgeable;
- (void)setColorSpace:(id)a3;
@end

@implementation NUIOSurfaceStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_surface, 0);
}

- (NSString)description
{
  v3 = [(NUIOSurface *)self->_surface IOSurfaceRef];
  uint64_t UseCount = IOSurfaceGetUseCount(v3);
  return (NSString *)[NSString stringWithFormat:@"<%@:%p> IOSurface=%p useCount=%d purgeable=%d sizeInBytes=%ld surface=%@", objc_opt_class(), self, v3, UseCount, self->_purgeable, -[NUIOSurface sizeInBytes](self->_surface, "sizeInBytes"), self->_surface];
}

- (int64_t)_copyFromIOSurfaceStorage:(id)a3 region:(id)a4 device:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v16 = NUAssertLogger_19657();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "other != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_19657();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v27;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage _copyFromIOSurfaceStorage:region:device:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 407, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"other != nil");
  }
  v11 = v10;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v37 = 1;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __62__NUIOSurfaceStorage__copyFromIOSurfaceStorage_region_device___block_invoke;
  v32[3] = &unk_1E5D95390;
  v35 = buf;
  v32[4] = self;
  id v12 = v9;
  id v33 = v12;
  id v13 = v11;
  id v34 = v13;
  int64_t v14 = [v8 readTextureInRegion:v12 device:v13 block:v32];
  if (v14 == 1) {
    int64_t v14 = *(void *)(*(void *)&buf[8] + 24);
  }

  _Block_object_dispose(buf, 8);
  return v14;
}

uint64_t __62__NUIOSurfaceStorage__copyFromIOSurfaceStorage_region_device___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  v6 = (void *)a1[6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__NUIOSurfaceStorage__copyFromIOSurfaceStorage_region_device___block_invoke_2;
  v9[3] = &unk_1E5D95368;
  id v10 = v6;
  id v11 = (id)a1[5];
  id v12 = v3;
  id v7 = v3;
  *(void *)(*(void *)(a1[7] + 8) + 24) = [v4 writeTextureInRegion:v5 device:v10 block:v9];

  return 1;
}

uint64_t __62__NUIOSurfaceStorage__copyFromIOSurfaceStorage_region_device___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__NUIOSurfaceStorage__copyFromIOSurfaceStorage_region_device___block_invoke_3;
  v7[3] = &unk_1E5D95340;
  v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v5 = v3;
  [v4 executeMetal:v7];

  return 1;
}

void __62__NUIOSurfaceStorage__copyFromIOSurfaceStorage_region_device___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)a1[4];
  if (v4)
  {
    [v4 bounds];
    uint64_t v6 = *((void *)&v14 + 1);
    uint64_t v5 = v14;
    long long v7 = v15;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    long long v7 = 0uLL;
    long long v14 = 0u;
    long long v15 = 0u;
  }
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  v11[0] = v5;
  v11[1] = v6;
  v11[2] = 0;
  long long v12 = v7;
  uint64_t v13 = 1;
  v10[0] = v5;
  v10[1] = v6;
  v10[2] = 0;
  +[NUCopyKernel copyFromTexture:v8 region:v11 toTexture:v9 atPoint:v10 withCommandBuffer:v3];
}

- (int64_t)copyFromStorage:(id)a3 region:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v22 = NUAssertLogger_19657();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "other != nil");
      *(_DWORD *)buf = 138543362;
      v72 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v25 = NUAssertLogger_19657();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        v46 = [v44 callStackSymbols];
        v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v72 = v43;
        __int16 v73 = 2114;
        v74 = v47;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v72 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage copyFromStorage:region:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 383, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"other != nil");
  }
  uint64_t v8 = v7;
  uint64_t v9 = [v6 size];
  uint64_t v11 = v10;
  if (v9 != [(_NUAbstractStorage *)self size] || v11 != v12)
  {
    uint64_t v29 = NUAssertLogger_19657();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUPixelSizeEqualToSize(other.size, self.size)");
      *(_DWORD *)buf = 138543362;
      v72 = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v32 = NUAssertLogger_19657();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v33)
      {
        v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v53 = (void *)MEMORY[0x1E4F29060];
        id v54 = v52;
        v55 = [v53 callStackSymbols];
        v56 = [v55 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v72 = v52;
        __int16 v73 = 2114;
        v74 = v56;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      id v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v72 = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage copyFromStorage:region:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 384, @"Invalid parameter not satisfying: %s", v57, v58, v59, v60, (uint64_t)"NUPixelSizeEqualToSize(other.size, self.size)");
  }
  uint64_t v13 = [(_NUAbstractStorage *)self format];
  long long v14 = [v6 format];
  char v15 = [v13 isEqualToPixelFormat:v14];

  if ((v15 & 1) == 0)
  {
    v36 = NUAssertLogger_19657();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "[self.format isEqualToPixelFormat:other.format]");
      *(_DWORD *)buf = 138543362;
      v72 = v37;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v39 = NUAssertLogger_19657();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v61 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v62 = (void *)MEMORY[0x1E4F29060];
        id v63 = v61;
        v64 = [v62 callStackSymbols];
        v65 = [v64 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v72 = v61;
        __int16 v73 = 2114;
        v74 = v65;
        _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v40)
    {
      v41 = [MEMORY[0x1E4F29060] callStackSymbols];
      v42 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v72 = v42;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage copyFromStorage:region:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 385, @"Invalid parameter not satisfying: %s", v66, v67, v68, v69, (uint64_t)"[self.format isEqualToPixelFormat:other.format]");
  }
  unint64_t v16 = v6[10];
  if ((unint64_t)self->_device | v16)
  {
    if (v16) {
      device = (NUDevice *)v6[10];
    }
    else {
      device = self->_device;
    }
    id v18 = (id)v16;
    id v19 = [(NUIOSurfaceStorage *)self _copyFromIOSurfaceStorage:v6 region:v8 device:device];
  }
  else
  {
    v70.receiver = self;
    v70.super_class = (Class)NUIOSurfaceStorage;
    id v19 = [(_NUAbstractBufferStorage *)&v70 copyFromStorage:v6 region:v8];
  }
  int64_t v20 = (int64_t)v19;

  return v20;
}

- (int64_t)useAsCVPixelBufferWithBlock:(id)a3
{
  id v4 = a3;
  v12[0] = 0;
  v12[1] = 0;
  v12[2] = [(_NUAbstractStorage *)self size];
  v12[3] = v5;
  uint64_t v6 = +[NURegion regionWithRect:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__NUIOSurfaceStorage_useAsCVPixelBufferWithBlock___block_invoke;
  void v10[3] = &unk_1E5D952A0;
  id v11 = v4;
  id v7 = v4;
  int64_t v8 = [(NUIOSurfaceStorage *)self readSurfaceInRegion:v6 block:v10];

  return v8;
}

uint64_t __50__NUIOSurfaceStorage_useAsCVPixelBufferWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [NUCVPixelBuffer alloc];
  uint64_t v5 = [v3 pixelBuffer];

  uint64_t v6 = [(NUCVPixelBuffer *)v4 initWithCVPixelBuffer:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return 1;
}

- (int64_t)useAsCIRenderDestinationWithRenderer:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0;
  v18[1] = 0;
  v18[2] = [(_NUAbstractStorage *)self size];
  v18[3] = v8;
  uint64_t v9 = +[NURegion regionWithRect:v18];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__NUIOSurfaceStorage_useAsCIRenderDestinationWithRenderer_block___block_invoke;
  v14[3] = &unk_1E5D95318;
  unint64_t v16 = self;
  id v17 = v7;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  int64_t v12 = [(NUIOSurfaceStorage *)self writeSurfaceInRegion:v9 block:v14];

  return v12;
}

uint64_t __65__NUIOSurfaceStorage_useAsCIRenderDestinationWithRenderer_block___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) renderDestinationForSurface:a2];
  uint64_t v5 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if (v5) {
    [*(id *)(a1 + 40) setIsDirty:0];
  }
  return v5;
}

- (int64_t)useAsCIImageWithOptions:(id)a3 renderer:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22[0] = 0;
  v22[1] = 0;
  v22[2] = [(_NUAbstractStorage *)self size];
  v22[3] = v11;
  int64_t v12 = +[NURegion regionWithRect:v22];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__NUIOSurfaceStorage_useAsCIImageWithOptions_renderer_block___block_invoke;
  v18[3] = &unk_1E5D95318;
  id v20 = v8;
  id v21 = v10;
  id v19 = v9;
  id v13 = v8;
  id v14 = v9;
  id v15 = v10;
  int64_t v16 = [(NUIOSurfaceStorage *)self readSurfaceInRegion:v12 block:v18];

  return v16;
}

uint64_t __61__NUIOSurfaceStorage_useAsCIImageWithOptions_renderer_block___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) imageForSurface:a2 options:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return 1;
}

- (int64_t)writeTextureInRegion:(id)a3 device:(id)a4 block:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (NUDevice *)a4;
  id v10 = (unsigned int (**)(id, void *))a5;
  if (![(NUDevice *)v9 hasMetalSupport])
  {
    id v20 = NUAssertLogger_19657();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "device.hasMetalSupport");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v23 = NUAssertLogger_19657();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        uint64_t v30 = [v28 callStackSymbols];
        uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      id v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage writeTextureInRegion:device:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 313, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"device.hasMetalSupport");
  }
  surface = self->_surface;
  int64_t v12 = [(NUDevice *)v9 metalDevice];
  id v13 = [(NUIOSurface *)surface textureForDevice:v12];

  if ([(_NUAbstractStorage *)self isDirty])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    *(void *)&buf[16] = [(_NUAbstractStorage *)self size];
    uint64_t v39 = v14;
    id v15 = +[NURegion regionWithRect:buf];
    char v16 = [v8 isEqualToRegion:v15];

    if ((v16 & 1) == 0)
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __56__NUIOSurfaceStorage_writeTextureInRegion_device_block___block_invoke;
      v36[3] = &unk_1E5D952F0;
      id v37 = v13;
      [(NUDevice *)v9 executeMetal:v36];
    }
    [(_NUAbstractStorage *)self setIsDirty:0];
  }
  if (v10[2](v10, v13))
  {
    [(_NUAbstractStorage *)self validateRegion:v8];
    int64_t v17 = 1;
  }
  else
  {
    int64_t v17 = 0;
  }
  device = self->_device;
  self->_device = v9;

  return v17;
}

uint64_t __56__NUIOSurfaceStorage_writeTextureInRegion_device_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NUFillKernel fillTexture:color:withCommandBuffer:](NUFillKernel, "fillTexture:color:withCommandBuffer:", *(void *)(a1 + 32), a2, 0.0, 0.0, 0.0, 0.0);
}

- (int64_t)readTextureInRegion:(id)a3 device:(id)a4 block:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (NUDevice *)a4;
  id v10 = (uint64_t (**)(id, void *))a5;
  if (![(NUDevice *)v9 hasMetalSupport])
  {
    char v16 = NUAssertLogger_19657();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "device.hasMetalSupport");
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v19 = NUAssertLogger_19657();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        BOOL v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = v23;
        __int16 v34 = 2114;
        uint64_t v35 = v27;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      id v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage readTextureInRegion:device:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 293, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"device.hasMetalSupport");
  }
  [(_NUAbstractStorage *)self assertIsValidInRegion:v8];
  surface = self->_surface;
  int64_t v12 = [(NUDevice *)v9 metalDevice];
  id v13 = [(NUIOSurface *)surface textureForDevice:v12];

  LODWORD(surface) = v10[2](v10, v13);
  device = self->_device;
  self->_device = v9;

  return surface;
}

- (int64_t)writeSurfaceInRegion:(id)a3 block:(id)a4
{
  id v6 = a3;
  if ((*((unsigned int (**)(id, NUIOSurface *))a4 + 2))(a4, self->_surface))
  {
    [(_NUAbstractStorage *)self validateRegion:v6];
    int64_t v7 = 1;
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (int64_t)readSurfaceInRegion:(id)a3 block:(id)a4
{
  id v6 = (uint64_t (**)(id, NUIOSurface *))a4;
  [(_NUAbstractStorage *)self assertIsValidInRegion:a3];
  LODWORD(a3) = v6[2](v6, self->_surface);

  return a3;
}

- (int64_t)writeBufferInRegion:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__NUIOSurfaceStorage_writeBufferInRegion_block___block_invoke;
  v13[3] = &unk_1E5D95318;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  int64_t v10 = [(NUIOSurfaceStorage *)self writeSurfaceInRegion:v9 block:v13];
  device = self->_device;
  self->_device = 0;

  return v10;
}

uint64_t __48__NUIOSurfaceStorage_writeBufferInRegion_block___block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__NUIOSurfaceStorage_writeBufferInRegion_block___block_invoke_2;
  v7[3] = &unk_1E5D952C8;
  id v4 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  id v9 = *(id *)(a1 + 48);
  uint64_t v5 = [a2 write:v7];

  return v5;
}

void __48__NUIOSurfaceStorage_writeBufferInRegion_block___block_invoke_2(uint64_t a1, void *a2)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isDirty])
  {
    uint64_t v4 = [*(id *)(a1 + 32) size];
    uint64_t v6 = v5;
    id v7 = *(void **)(a1 + 40);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = v4;
    uint64_t v12 = v5;
    id v8 = +[NURegion regionWithRect:&v9];
    LOBYTE(v7) = [v7 isEqualToRegion:v8];

    if ((v7 & 1) == 0)
    {
      v13[0] = 0;
      v13[1] = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = v4;
      uint64_t v12 = v6;
      +[NUImageUtilities fillPixelsInBuffer:v3 rect:&v9 srcPixel:v13];
    }
    [*(id *)(a1 + 32) setIsDirty:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (int64_t)readBufferInRegion:(id)a3 block:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__NUIOSurfaceStorage_readBufferInRegion_block___block_invoke;
  void v11[3] = &unk_1E5D952A0;
  id v12 = v6;
  id v7 = v6;
  int64_t v8 = [(NUIOSurfaceStorage *)self readSurfaceInRegion:a3 block:v11];
  device = self->_device;
  self->_device = 0;

  return v8;
}

uint64_t __47__NUIOSurfaceStorage_readBufferInRegion_block___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__NUIOSurfaceStorage_readBufferInRegion_block___block_invoke_2;
  v5[3] = &unk_1E5D95278;
  id v6 = *(id *)(a1 + 32);
  uint64_t v3 = [a2 read:v5];

  return v3;
}

uint64_t __47__NUIOSurfaceStorage_readBufferInRegion_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setColorSpace:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUIOSurfaceStorage;
  id v4 = a3;
  [(_NUAbstractStorage *)&v7 setColorSpace:v4];
  surface = self->_surface;
  uint64_t v6 = objc_msgSend(v4, "CGColorSpace", v7.receiver, v7.super_class);

  [(NUIOSurface *)surface setColorSpace:v6];
}

- (int)useCount
{
  uint64_t v2 = [(NUIOSurface *)self->_surface IOSurface];
  int v3 = [v2 localUseCount];

  return v3;
}

- (BOOL)decrementUseCount
{
  [(NUIOSurface *)self->_surface invalidatePixelBuffer];
  int v3 = [(NUIOSurface *)self->_surface IOSurface];
  [v3 decrementUseCount];

  id v4 = [(NUIOSurface *)self->_surface IOSurface];
  LOBYTE(v3) = [v4 isInUse] ^ 1;

  return (char)v3;
}

- (void)incrementUseCount
{
  id v2 = [(NUIOSurface *)self->_surface IOSurface];
  [v2 incrementUseCount];
}

- (BOOL)isInUse
{
  id v2 = [(NUIOSurface *)self->_surface IOSurface];
  char v3 = [v2 isInUse];

  return v3;
}

- (BOOL)isShared
{
  id v2 = [(NUIOSurface *)self->_surface IOSurface];
  int v3 = [v2 localUseCount];
  if (v3 <= 1)
  {
    if (v3) {
      char v4 = 0;
    }
    else {
      char v4 = [v2 isInUse];
    }
  }
  else
  {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isPurged
{
  return [(NUIOSurface *)self->_surface isPurged];
}

- (BOOL)makeNonPurgeable
{
  BOOL v3 = [(NUIOSurface *)self->_surface makeNonPurgeable];
  if (v3) {
    self->_purgeable = 0;
  }
  return v3;
}

- (void)makePurgeable
{
  self->_purgeable = 1;
}

- (void)adjustPurgeLevel:(int64_t)a3
{
  if (self->_purgeLevel != a3)
  {
    self->_purgeLevel = a3;
    if (self->_purgeable) {
      -[NUIOSurface makePurgeable:](self->_surface, "makePurgeable:");
    }
  }
}

- (int64_t)purgeLevel
{
  return self->_purgeLevel;
}

- (BOOL)isPurgeable
{
  return self->_purgeable;
}

- (void)_allocateSurface
{
  BOOL v3 = [NUIOSurface alloc];
  uint64_t v4 = [(_NUAbstractStorage *)self size];
  uint64_t v6 = v5;
  objc_super v7 = [(_NUAbstractStorage *)self format];
  int64_t v8 = -[NUIOSurface initWithSize:format:](v3, "initWithSize:format:", v4, v6, v7);
  surface = self->_surface;
  self->_surface = v8;

  uint64_t v10 = self->_surface;

  [(NUIOSurface *)v10 setName:@"NUIOSurfaceStorage"];
}

- (int64_t)sizeInBytes
{
  return [(NUIOSurface *)self->_surface sizeInBytes];
}

- (int64_t)rowBytes
{
  return [(NUIOSurface *)self->_surface rowBytes];
}

- (NUIOSurfaceStorage)initWithSurface:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NUIOSurface *)a3;
  if (!v4)
  {
    id v13 = NUAssertLogger_19657();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "surface != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v16 = NUAssertLogger_19657();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        BOOL v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        BOOL v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v20;
        __int16 v32 = 2114;
        uint64_t v33 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage initWithSurface:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 67, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"surface != nil");
  }
  uint64_t v5 = v4;
  v29.receiver = self;
  v29.super_class = (Class)NUIOSurfaceStorage;
  uint64_t v6 = [(_NUAbstractStorage *)&v29 init];
  uint64_t v7 = [(NUIOSurface *)v5 size];
  uint64_t v9 = v8;
  uint64_t v10 = [(NUIOSurface *)v5 format];
  -[_NUAbstractStorage _resetSize:format:](v6, "_resetSize:format:", v7, v9, v10);

  surface = v6->_surface;
  v6->_surface = v5;

  v6->_purgeLevel = 1;
  return v6;
}

- (NUIOSurfaceStorage)initWithSize:(id)a3 format:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    uint64_t v11 = NUAssertLogger_19657();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pixelFormat != nil");
      *(_DWORD *)buf = 138543362;
      objc_super v29 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v14 = NUAssertLogger_19657();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        id v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        id v21 = [v19 callStackSymbols];
        id v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        objc_super v29 = v18;
        __int16 v30 = 2114;
        uint64_t v31 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      char v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      objc_super v29 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage initWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 50, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"pixelFormat != nil");
  }
  uint64_t v8 = v7;
  v27.receiver = self;
  v27.super_class = (Class)NUIOSurfaceStorage;
  uint64_t v9 = [(_NUAbstractStorage *)&v27 init];
  -[_NUAbstractStorage _resetSize:format:](v9, "_resetSize:format:", var0, var1, v8);
  [(NUIOSurfaceStorage *)v9 _allocateSurface];
  v9->_purgeLevel = 1;

  return v9;
}

@end