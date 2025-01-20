@interface NUImageAccumulationNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize;
- (NUColorSpace)colorSpace;
- (NUImageAccumulationNode)initWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5 pixelFormat:(id)a6 colorSpace:(id)a7 input:(id)a8;
- (NUImageAccumulationNode)initWithSettings:(id)a3 inputs:(id)a4;
- (NUImageLayout)layout;
- (NUMutablePurgeableImage)image;
- (NUPixelFormat)pixelFormat;
- (id)_image;
- (id)_newImage;
- (id)debugQuickLookObject;
@end

@implementation NUImageAccumulationNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

- (NUImageLayout)layout
{
  return self->_layout;
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize
{
  p_imageSize = &self->_imageSize;
  int64_t width = self->_imageSize.width;
  int64_t height = p_imageSize->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (id)debugQuickLookObject
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [(NUMutablePurgeableImage *)self->_image performSelector:sel_debugQuickLookObject];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NUImageAccumulationNode;
    v3 = [(NURenderNode *)&v5 debugQuickLookObject];
  }

  return v3;
}

- (id)_newImage
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_28429);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = NSString;
    v4 = v2;
    objc_super v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_28429);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_28429);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v10 = (void *)MEMORY[0x1E4F29060];
    v11 = v9;
    v12 = [v10 callStackSymbols];
    v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  v11 = v14;
  v18 = [v16 callStackSymbols];
  v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  __int16 v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode _newImage]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 89, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (id)_image
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  image = self->_image;
  if (!image)
  {
    id v4 = [(NUImageAccumulationNode *)self _newImage];
    objc_super v5 = [v4 mutablePurgeableImageCopy];
    v6 = self->_image;
    self->_image = v5;

    if (!self->_image)
    {
      uint64_t v8 = NUAssertLogger_28445();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = [NSString stringWithFormat:@"Failed to allocate tiled image"];
        *(_DWORD *)uint64_t v24 = 138543362;
        *(void *)&v24[4] = v9;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v24, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v11 = NUAssertLogger_28445();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v12)
        {
          v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v16 = (void *)MEMORY[0x1E4F29060];
          id v17 = v15;
          v18 = [v16 callStackSymbols];
          v19 = [v18 componentsJoinedByString:@"\n"];
          *(_DWORD *)uint64_t v24 = 138543618;
          *(void *)&v24[4] = v15;
          __int16 v25 = 2114;
          v26 = v19;
          _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v24, 0x16u);
        }
      }
      else if (v12)
      {
        v13 = [MEMORY[0x1E4F29060] callStackSymbols];
        v14 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v24 = 138543362;
        *(void *)&v24[4] = v14;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v24, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode _image]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 81, @"Failed to allocate tiled image", v20, v21, v22, v23, *(uint64_t *)v24);
    }

    image = self->_image;
  }

  return image;
}

- (NUMutablePurgeableImage)image
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28452;
  v10 = __Block_byref_object_dispose__28453;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__NUImageAccumulationNode_image__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NUMutablePurgeableImage *)v3;
}

uint64_t __32__NUImageAccumulationNode_image__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _image];

  return MEMORY[0x1F41817F8]();
}

- (NUImageAccumulationNode)initWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5 pixelFormat:(id)a6 colorSpace:(id)a7 input:(id)a8
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  int64_t v9 = a4.var1;
  int64_t v10 = a4.var0;
  int64_t v11 = a3.var1;
  int64_t v12 = a3.var0;
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  v14 = (NUPixelFormat *)a6;
  v15 = (NUColorSpace *)a7;
  id v16 = a8;
  if (v12 < 1 || v11 <= 0)
  {
    v37 = NUAssertLogger_28445();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "imageSize.width > 0 && imageSize.height > 0");
      *(_DWORD *)buf = 138543362;
      v114 = v38;
      _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v40 = NUAssertLogger_28445();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v65 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v66 = (void *)MEMORY[0x1E4F29060];
        id v67 = v65;
        v68 = [v66 callStackSymbols];
        v69 = [v68 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v114 = v65;
        __int16 v115 = 2114;
        v116 = v69;
        _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v41)
    {
      v42 = [MEMORY[0x1E4F29060] callStackSymbols];
      v43 = [v42 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v114 = v43;
      _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode initWithImageSize:tileSize:borderSize:pixelFormat:colorSpace:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 36, @"Invalid parameter not satisfying: %s", v70, v71, v72, v73, (uint64_t)"imageSize.width > 0 && imageSize.height > 0");
  }
  if (!v14)
  {
    v44 = NUAssertLogger_28445();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "format != nil");
      *(_DWORD *)buf = 138543362;
      v114 = v45;
      _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v47 = NUAssertLogger_28445();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (v46)
    {
      if (v48)
      {
        v74 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v75 = (void *)MEMORY[0x1E4F29060];
        id v76 = v74;
        v77 = [v75 callStackSymbols];
        v78 = [v77 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v114 = v74;
        __int16 v115 = 2114;
        v116 = v78;
        _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v48)
    {
      v49 = [MEMORY[0x1E4F29060] callStackSymbols];
      v50 = [v49 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v114 = v50;
      _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode initWithImageSize:tileSize:borderSize:pixelFormat:colorSpace:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 37, @"Invalid parameter not satisfying: %s", v79, v80, v81, v82, (uint64_t)"format != nil");
  }
  if (!v15)
  {
    v51 = NUAssertLogger_28445();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "space != nil");
      *(_DWORD *)buf = 138543362;
      v114 = v52;
      _os_log_error_impl(&dword_1A9892000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v54 = NUAssertLogger_28445();
    BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
    if (v53)
    {
      if (v55)
      {
        v83 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v84 = (void *)MEMORY[0x1E4F29060];
        id v85 = v83;
        v86 = [v84 callStackSymbols];
        v87 = [v86 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v114 = v83;
        __int16 v115 = 2114;
        v116 = v87;
        _os_log_error_impl(&dword_1A9892000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v55)
    {
      v56 = [MEMORY[0x1E4F29060] callStackSymbols];
      v57 = [v56 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v114 = v57;
      _os_log_error_impl(&dword_1A9892000, v54, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode initWithImageSize:tileSize:borderSize:pixelFormat:colorSpace:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 38, @"Invalid parameter not satisfying: %s", v88, v89, v90, v91, (uint64_t)"space != nil");
  }
  if (!v16)
  {
    v58 = NUAssertLogger_28445();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v59 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v114 = v59;
      _os_log_error_impl(&dword_1A9892000, v58, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v61 = NUAssertLogger_28445();
    BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
    if (v60)
    {
      if (v62)
      {
        v92 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v93 = (void *)MEMORY[0x1E4F29060];
        id v94 = v92;
        v95 = [v93 callStackSymbols];
        v96 = [v95 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v114 = v92;
        __int16 v115 = 2114;
        v116 = v96;
        _os_log_error_impl(&dword_1A9892000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v62)
    {
      v63 = [MEMORY[0x1E4F29060] callStackSymbols];
      v64 = [v63 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v114 = v64;
      _os_log_error_impl(&dword_1A9892000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode initWithImageSize:tileSize:borderSize:pixelFormat:colorSpace:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 39, @"Invalid parameter not satisfying: %s", v97, v98, v99, v100, (uint64_t)"input != nil");
  }
  v111[0] = @"space";
  v111[1] = @"format";
  v112[0] = v15;
  v112[1] = v14;
  v111[2] = @"width";
  v101 = self;
  v102 = v16;
  int64_t v103 = v12;
  id v17 = [NSNumber numberWithInteger:v12];
  v112[2] = v17;
  v111[3] = @"height";
  int64_t v104 = v11;
  v18 = [NSNumber numberWithInteger:v11];
  v112[3] = v18;
  v111[4] = @"tile_width";
  int64_t v105 = v10;
  v19 = [NSNumber numberWithInteger:v10];
  v112[4] = v19;
  v111[5] = @"tile_height";
  int64_t v106 = v9;
  uint64_t v20 = [NSNumber numberWithInteger:v9];
  v112[5] = v20;
  v111[6] = @"border_width";
  uint64_t v21 = [NSNumber numberWithInteger:var0];
  v112[6] = v21;
  v111[7] = @"border_height";
  uint64_t v22 = [NSNumber numberWithInteger:var1];
  v112[7] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:8];

  uint64_t v109 = *MEMORY[0x1E4F1E480];
  v110 = v102;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
  v108.receiver = v101;
  v108.super_class = (Class)NUImageAccumulationNode;
  __int16 v25 = [(NURenderNode *)&v108 initWithSettings:v23 inputs:v24];
  image = v25->_image;
  v25->_image = 0;

  if (var0 && var1)
  {
    uint64_t v27 = +[NUImageLayout overlappingTiledLayoutForImageSize:tileSize:borderSize:](NUImageLayout, "overlappingTiledLayoutForImageSize:tileSize:borderSize:", v103, v104, v105, v106, var0, var1);
  }
  else
  {
    uint64_t v27 = +[NUImageLayout tiledLayoutForImageSize:tileSize:](NUImageLayout, "tiledLayoutForImageSize:tileSize:", v103, v104, v105, v106);
  }
  layout = v25->_layout;
  v25->_layout = (NUImageLayout *)v27;

  pixelFormat = v25->_pixelFormat;
  v25->_pixelFormat = v14;
  uint64_t v30 = v14;

  colorSpace = v25->_colorSpace;
  v25->_colorSpace = v15;
  v32 = v15;

  v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v34 = dispatch_queue_create("NUImageNode", v33);
  queue = v25->_queue;
  v25->_queue = (OS_dispatch_queue *)v34;

  return v25;
}

- (NUImageAccumulationNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_28429);
  }
  uint64_t v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    int64_t v9 = NSString;
    int64_t v10 = v8;
    int64_t v11 = (objc_class *)objc_opt_class();
    int64_t v12 = NSStringFromClass(v11);
    v13 = NSStringFromSelector(a2);
    v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    dispatch_queue_t v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_28429);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_28429);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v17 = (void *)MEMORY[0x1E4F29060];
    v18 = v16;
    v19 = [v17 callStackSymbols];
    uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    dispatch_queue_t v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  v18 = v21;
  __int16 v25 = [v23 callStackSymbols];
  v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  dispatch_queue_t v34 = specific;
  __int16 v35 = 2114;
  v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 30, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

@end