@interface NUOrientationNode
+ (id)applyOrientation:(int64_t)a3 to:(id)a4;
- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3;
- (BOOL)isGeometryNode;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUImageTransform)transform;
- (NUOrientationNode)initWithOrientation:(int64_t)a3 input:(id)a4;
- (NUOrientationNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoProperties:(id *)a3;
- (id)_transformWithError:(id *)a3;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int64_t)orientation;
- (int64_t)outputImageOrientation:(int64_t)a3;
- (void)setTransform:(id)a3;
@end

@implementation NUOrientationNode

- (void).cxx_destruct
{
}

- (void)setTransform:(id)a3
{
}

- (NUImageTransform)transform
{
  return (NUImageTransform *)objc_getProperty(self, a2, 176, 1);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (id)_evaluateVideo:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v21 = NUAssertLogger_13023();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v24 = NUAssertLogger_13023();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v32;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUOrientationNode _evaluateVideo:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Orientation.m", 262, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"error != nil");
  }
  v45.receiver = self;
  v45.super_class = (Class)NUOrientationNode;
  v5 = -[NURenderNode _evaluateVideo:](&v45, sel__evaluateVideo_);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)[v5 mutableCopy];
    v8 = v7;
    if (v7)
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v9 = [v7 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v42 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            [v13 naturalSize];
            double v15 = v14;
            double v17 = v16;
            long long v47 = 0u;
            memset(buf, 0, sizeof(buf));
            if (v13) {
              [v13 preferredTransform];
            }
            long long v38 = *(_OWORD *)buf;
            long long v39 = *(_OWORD *)&buf[16];
            long long v40 = v47;
            uint64_t v18 = NUOrientationConcat(+[NUVideoUtilities videoOrientationForAssetPreferredTransform:&v38], [(NUOrientationNode *)self orientation]);
            long long v39 = 0u;
            long long v40 = 0u;
            long long v38 = 0u;
            +[NUVideoUtilities preferredTransformFromOrientation:size:](NUVideoUtilities, "preferredTransformFromOrientation:size:", v18, (uint64_t)v15, (uint64_t)v17);
            v37[0] = v38;
            v37[1] = v39;
            v37[2] = v40;
            [v13 setPreferredTransform:v37];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
        }
        while (v10);
      }

      id v19 = v8;
    }
    else
    {
      *a3 = +[NUError errorWithCode:1 reason:@"[NUOrientationNode _evaluateVideo] failed to get mutableCopy" object:v6];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)requiresVideoComposition
{
  v2 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  char v3 = [v2 requiresVideoComposition];

  return v3;
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NUOrientationNode;
  v5 = [(NURenderNode *)&v8 _evaluateAuxiliaryImageForType:a3 error:a4];
  if ([(NUOrientationNode *)self orientation] != 1)
  {
    uint64_t v6 = objc_msgSend(v5, "auxiliaryImageByApplyingExifOrientation:", -[NUOrientationNode orientation](self, "orientation"));

    v5 = (void *)v6;
  }

  return v5;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUOrientationNode;
  return [(NURenderNode *)&v4 canPropagateOriginalAuxiliaryData:a3];
}

- (id)_evaluateVideoProperties:(id *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v33 = NUAssertLogger_13023();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v36 = NUAssertLogger_13023();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v37)
      {
        long long v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        long long v43 = [v41 callStackSymbols];
        long long v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v44;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      long long v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUOrientationNode _evaluateVideoProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Orientation.m", 198, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"error != NULL");
  }
  v5 = [(NURenderNode *)self inputs];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  v7 = [v6 videoProperties:a3];
  if (v7)
  {
    objc_super v8 = [(NURenderNode *)self outputImageGeometry:a3];
    if (v8)
    {
      long long v55 = 0u;
      long long v56 = 0u;
      [v7 cleanAperture];
      uint64_t v9 = [(NUOrientationNode *)self orientation];
      uint64_t v10 = [v7 size];
      *(_OWORD *)buf = v55;
      *(_OWORD *)&buf[16] = v56;
      NU::RectT<long>::applyOrientation((uint64_t *)buf, v9, v10, v11);
      long long v55 = *(_OWORD *)buf;
      long long v56 = *(_OWORD *)&buf[16];
      long long v53 = 0u;
      long long v54 = 0u;
      [v7 originalCleanAperture];
      uint64_t v12 = [(NUOrientationNode *)self orientation];
      uint64_t v13 = [v7 originalSize];
      *(_OWORD *)buf = v53;
      *(_OWORD *)&buf[16] = v54;
      NU::RectT<long>::applyOrientation((uint64_t *)buf, v12, v13, v14);
      long long v53 = *(_OWORD *)buf;
      long long v54 = *(_OWORD *)&buf[16];
      uint64_t v15 = [(NUOrientationNode *)self orientation];
      uint64_t v16 = [v7 originalSize];
      uint64_t v18 = NUOrientationTransformImageSize(v15, v16, v17);
      uint64_t v20 = v19;
      v21 = [[_NUVideoProperties alloc] initWithProperties:v7];
      v52[0] = v55;
      v52[1] = v56;
      [(_NUVideoProperties *)v21 setCleanAperture:v52];
      v51[0] = v53;
      v51[1] = v54;
      [(_NUVideoProperties *)v21 setOriginalCleanAperture:v51];
      uint64_t v22 = [v8 scaledSize];
      -[_NUVideoProperties setSize:](v21, "setSize:", v22, v23);
      uint64_t v24 = [(NUOrientationNode *)self orientation];
      uint64_t v25 = [v7 size];
      uint64_t v27 = NUOrientationTransformImageSize(v24, v25, v26);
      uint64_t v29 = v28;
      uint64_t v30 = [(_NUVideoProperties *)v21 size];
      if (v30 < v27) {
        uint64_t v27 = v30;
      }
      [(_NUVideoProperties *)v21 size];
      if (v31 < v29) {
        uint64_t v29 = v31;
      }
      if ((v29 | v27) < 0)
      {
        uint64_t v49 = [MEMORY[0x1E4F28B00] currentHandler];
        v50 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
        [v49 handleFailureInFunction:v50, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
      }
      -[_NUVideoProperties setSize:](v21, "setSize:", v27, v29);
      -[_NUVideoProperties setOriginalSize:](v21, "setOriginalSize:", v18, v20);
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_transformWithError:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v17 = NUAssertLogger_13023();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v37 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v20 = NUAssertLogger_13023();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        uint64_t v27 = [v25 callStackSymbols];
        uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v37 = v24;
        __int16 v38 = 2114;
        long long v39 = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v37 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUOrientationNode _transformWithError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Orientation.m", 173, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"error != nil");
  }
  v5 = [(NUOrientationNode *)self transform];
  if (!v5)
  {
    uint64_t v6 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
    id v35 = 0;
    uint64_t v7 = [v6 outputImageGeometry:&v35];
    if (v7)
    {
      objc_super v8 = (void *)v7;
      uint64_t v9 = [NUImageTransformOrientation alloc];
      int64_t v10 = [(NUOrientationNode *)self orientation];
      uint64_t v11 = [v8 size];
      uint64_t v13 = v12;
      [v8 extent];
      v5 = -[NUImageTransformOrientation initWithOrientation:imageSize:imageOrigin:](v9, "initWithOrientation:imageSize:imageOrigin:", v10, v11, v13, v33, v34);
      [(NUOrientationNode *)self setTransform:v5];
    }
    else
    {
      id v14 = v35;
      id v15 = +[NUError errorWithCode:1 reason:@"Cannot obtain input image geometry" object:v6 underlyingError:v14];

      v5 = 0;
      *a3 = v15;
    }
  }

  return v5;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)NUOrientationNode;
  objc_super v4 = [(NURenderNode *)&v17 _evaluateImageGeometry:a3];
  v5 = v4;
  if (v4)
  {
    int8x16_t v15 = 0u;
    int8x16_t v16 = 0u;
    [v4 extent];
    if ((unint64_t)([(NUOrientationNode *)self orientation] - 5) <= 3)
    {
      int8x16_t v15 = vextq_s8(v15, v15, 8uLL);
      int8x16_t v16 = vextq_s8(v16, v16, 8uLL);
    }
    int64_t v6 = -[NUOrientationNode outputImageOrientation:](self, "outputImageOrientation:", [v5 orientation]);
    uint64_t v7 = [NUImageGeometry alloc];
    uint64_t v8 = [v5 renderScale];
    uint64_t v10 = v9;
    uint64_t v11 = [v5 roundingPolicy];
    v14[0] = v15;
    v14[1] = v16;
    uint64_t v12 = -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](v7, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", v14, v8, v10, v6, 0, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (int64_t)outputImageOrientation:(int64_t)a3
{
  int64_t v4 = [(NUOrientationNode *)self orientation];
  uint64_t v5 = 6;
  if (v4 != 8) {
    uint64_t v5 = v4;
  }
  if (v4 == 6) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = v5;
  }

  return NUOrientationConcat(a3, v6);
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v5 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  uint64_t v6 = [v5 outputImage:a3];
  if (v6 && [(NUOrientationNode *)self orientation] != 1)
  {
    uint64_t v7 = [v5 outputImageGeometry:a3];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = [v7 scaledSize];
      uint64_t v11 = v10;
      [v8 physicalScaledExtent];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v15 = 0u;
      NUOrientationMakeTransformWithSizeAndOrigin([(NUOrientationNode *)self orientation], v9, v11, v18, v19, (uint64_t)&v15);
      v14[0] = v15;
      v14[1] = v16;
      _OWORD v14[2] = v17;
      uint64_t v12 = [v6 imageByApplyingTransform:v14];

      uint64_t v6 = v8;
    }
    else
    {
      uint64_t v12 = 0;
    }

    uint64_t v6 = (void *)v12;
  }

  return v6;
}

- (BOOL)isGeometryNode
{
  return 1;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v9.receiver = self;
  v9.super_class = (Class)NUOrientationNode;
  uint64_t v7 = [(NURenderNode *)&v9 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  if (v7) {
    v7[21] = self->_orientation;
  }

  return v7;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (NUOrientationNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13043);
  }
  uint64_t v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    objc_super v9 = NSString;
    uint64_t v10 = v8;
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    uint64_t v13 = NSStringFromSelector(a2);
    id v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_13043);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_13043);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    long long v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    long long v17 = (void *)MEMORY[0x1E4F29060];
    uint64_t v18 = v16;
    uint64_t v19 = [v17 callStackSymbols];
    uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  uint64_t v18 = v21;
  uint64_t v25 = [v23 callStackSymbols];
  id v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v34 = specific;
  __int16 v35 = 2114;
  uint64_t v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUOrientationNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Orientation.m", 55, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

- (NUOrientationNode)initWithOrientation:(int64_t)a3 input:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((unint64_t)(a3 - 1) >= 8)
  {
    uint64_t v13 = NUAssertLogger_13023();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUOrientationIsValid(orientation)");
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v16 = NUAssertLogger_13023();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        uint64_t v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        uint64_t v23 = [v21 callStackSymbols];
        id v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v35 = v20;
        __int16 v36 = 2114;
        uint64_t v37 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUOrientationNode initWithOrientation:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Orientation.m", 44, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"NUOrientationIsValid(orientation)");
  }
  id v7 = v6;
  uint64_t v32 = @"orientation";
  uint64_t v8 = [NSNumber numberWithInteger:a3];
  uint64_t v33 = v8;
  objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  uint64_t v30 = *MEMORY[0x1E4F1E480];
  uint64_t v31 = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  v29.receiver = self;
  v29.super_class = (Class)NUOrientationNode;
  uint64_t v11 = [(NURenderNode *)&v29 initWithSettings:v9 inputs:v10];

  v11->_orientation = a3;
  return v11;
}

+ (id)applyOrientation:(int64_t)a3 to:(id)a4
{
  id v6 = a4;
  if (a3 != 1)
  {
    uint64_t v7 = [objc_alloc((Class)a1) initWithOrientation:a3 input:v6];

    id v6 = (id)v7;
  }

  return v6;
}

@end