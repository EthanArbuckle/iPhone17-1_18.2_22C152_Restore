@interface NUCropNode
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)cropRect;
- (BOOL)_canPropagateOriginalAuxiliaryData;
- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3;
- (BOOL)canPropagateOriginalLivePhotoMetadataTrack;
- (BOOL)resetCleanAperture;
- (BOOL)scaledCropOrigin:(CGPoint *)a3 error:(id *)a4;
- (CGPoint)scaleCropOriginForOriginalVideoSize:(CGSize)a3 originalCleanAperture:(CGRect)a4 renderScale:(double)a5 inputExtent:(id *)a6;
- (NUCropNode)initWithRect:(id *)a3 input:(id)a4;
- (NUCropNode)initWithRect:(id *)a3 input:(id)a4 resetCleanAperture:(BOOL)a5 settings:(id)a6;
- (NUCropNode)initWithSettings:(id)a3 inputs:(id)a4;
- (NUImageTransformAffine)transform;
- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_evaluateVideoProperties:(id *)a3;
- (id)_transformWithError:(id *)a3;
- (id)debugQuickLookObject;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)transformAffine;
- (void)setCropRect:(id *)a3;
- (void)setTransform:(id)a3;
@end

@implementation NUCropNode

- (void).cxx_destruct
{
}

- (BOOL)resetCleanAperture
{
  return self->_resetCleanAperture;
}

- (void)setTransform:(id)a3
{
}

- (NUImageTransformAffine)transform
{
  return (NUImageTransformAffine *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCropRect:(id *)a3
{
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)cropRect
{
  objc_copyStruct(retstr, &self->_cropRect, 32, 1, 0);
  return result;
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  if ([(NUCropNode *)self _canPropagateOriginalAuxiliaryData])
  {
    v10.receiver = self;
    v10.super_class = (Class)NUCropNode;
    v7 = [(NURenderNode *)&v10 _evaluateAuxiliaryImageForType:a3 error:a4];
  }
  else
  {
    id v8 = +[NUError failureError:@"NUCropNode cannot propagate original auxiliary data" object:self];
    v7 = 0;
    *a4 = v8;
  }

  return v7;
}

- (BOOL)_canPropagateOriginalAuxiliaryData
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)NUCropNode;
  id v21 = 0;
  v3 = [(NURenderNode *)&v20 _evaluateImageGeometry:&v21];
  id v4 = v21;
  if (v3)
  {
    id v19 = 0;
    v5 = [(NUCropNode *)self _evaluateImageGeometry:&v19];
    id v6 = v19;

    if (v5)
    {
      [v3 extent];
      [v5 extent];
      BOOL v7 = 0;
      if (v11 == v15 && v12 == v16 && v13 == v17) {
        BOOL v7 = v14 == v18;
      }
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_108);
      }
      v9 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v6;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "-[NUCropNode canPropagateOriginalAuxiliaryData] Unable to calculate output geometry: %@", buf, 0xCu);
      }
      BOOL v7 = 0;
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_108);
    }
    id v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v4;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "-[NUCropNode canPropagateOriginalAuxiliaryData] Unable to calculate input geometry: %@", buf, 0xCu);
    }
    BOOL v7 = 0;
    id v6 = v4;
  }

  return v7;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NUCropNode;
  BOOL v4 = [(NURenderNode *)&v6 canPropagateOriginalAuxiliaryData:a3];
  if (v4) {
    LOBYTE(v4) = [(NUCropNode *)self _canPropagateOriginalAuxiliaryData];
  }
  return v4;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    objc_super v20 = NUAssertLogger_20677();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v23 = NUAssertLogger_20677();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCropNode _evaluateVideoProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 358, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"error != NULL");
  }
  v5 = [(NURenderNode *)self inputs];
  objc_super v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  BOOL v7 = [v6 videoProperties:a3];
  if (v7)
  {
    id v8 = [(NURenderNode *)self outputImageGeometry:a3];
    v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 scaledSize];
      uint64_t v12 = v11;
      if ([(NUCropNode *)self resetCleanAperture])
      {
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = v10;
        uint64_t v16 = v12;
      }
      else
      {
        [v7 cleanAperture];
        *(void *)&long long v18 = v10;
        *((void *)&v18 + 1) = v12;
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        *(_OWORD *)&buf[16] = v18;
        v40[0] = v37;
        v40[1] = v38;
        NU::RectT<long>::Intersection((uint64_t)v39, (uint64_t *)buf, (uint64_t *)v40);
        uint64_t v14 = v39[1];
        uint64_t v13 = v39[0];
        uint64_t v16 = v39[3];
        uint64_t v15 = v39[2];
      }
      uint64_t v17 = [[_NUVideoProperties alloc] initWithProperties:v7];
      v36[0] = v13;
      v36[1] = v14;
      v36[2] = v15;
      v36[3] = v16;
      [(_NUVideoProperties *)v17 setCleanAperture:v36];
      -[_NUVideoProperties setSize:](v17, "setSize:", v10, v12);
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  id v20 = 0;
  v19.receiver = self;
  v19.super_class = (Class)NUCropNode;
  v5 = [(NURenderNode *)&v19 _evaluateImageGeometry:&v20];
  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v20;
    [(NUCropNode *)self cropRect];

    long long v17 = 0uLL;
    BOOL v7 = [NUImageGeometry alloc];
    uint64_t v8 = [v5 renderScale];
    uint64_t v10 = v9;
    uint64_t v11 = [v5 orientation];
    v16[0] = v17;
    v16[1] = v18;
    uint64_t v12 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v7, "initWithExtent:renderScale:orientation:", v16, v8, v10, v11);
  }
  else
  {
    id v13 = v20;
    id v14 = +[NUError errorWithCode:1 reason:@"Could not get the input geometry" object:self underlyingError:v13];

    uint64_t v12 = 0;
    *a3 = v14;
  }

  return v12;
}

- (id)debugQuickLookObject
{
  if ([(NURenderNode *)self isCached])
  {
    v5.receiver = self;
    v5.super_class = (Class)NUCropNode;
    v3 = [(NURenderNode *)&v5 debugQuickLookObject];
  }
  else
  {
    uint64_t v6 = 0;
    v3 = [(NUCropNode *)self _evaluateImage:&v6];
  }

  return v3;
}

- (BOOL)canPropagateOriginalLivePhotoMetadataTrack
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)NUCropNode;
  id v22 = 0;
  v3 = [(NURenderNode *)&v21 _evaluateImageGeometry:&v22];
  id v4 = v22;
  if (v3)
  {
    id v20 = 0;
    objc_super v5 = [(NUCropNode *)self _evaluateImageGeometry:&v20];
    id v6 = v20;

    if (v5)
    {
      [v3 extent];
      [v5 extent];
      BOOL v7 = 0;
      if (v12 != v16 || v13 != v17 || v14 != v18) {
        goto LABEL_18;
      }
      if (v15 == v19)
      {
        v11.receiver = self;
        v11.super_class = (Class)NUCropNode;
        BOOL v7 = [(NUTransformNode *)&v11 canPropagateOriginalLivePhotoMetadataTrack];
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_108);
      }
      uint64_t v9 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v6;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "[NUCropNode] could not evaluate output geometry: %@", buf, 0xCu);
      }
    }
    BOOL v7 = 0;
    goto LABEL_18;
  }
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_108);
  }
  uint64_t v8 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v4;
    _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "[NUCropNode] could not evaluate input geometry: %@", buf, 0xCu);
  }
  BOOL v7 = 0;
  id v6 = v4;
LABEL_19:

  return v7;
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v41 = NUAssertLogger_20677();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v42;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v44 = NUAssertLogger_20677();
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v45)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        v51 = [v49 callStackSymbols];
        v52 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v48;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v52;
        _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v45)
    {
      v46 = [MEMORY[0x1E4F29060] callStackSymbols];
      v47 = [v46 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v47;
      _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCropNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 230, @"Invalid parameter not satisfying: %s", v53, v54, v55, v56, (uint64_t)"error != nil");
  }
  objc_super v5 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  id v77 = 0;
  id v6 = [v5 outputImage:&v77];
  id v7 = v77;
  if (v6)
  {
    id v76 = 0;
    uint64_t v8 = [(NURenderNode *)self outputImageGeometry:&v76];
    id v9 = v76;

    if (v8)
    {
      if ([v8 renderScale] < 1 || v10 <= 0)
      {
        v57 = NUAssertLogger_20677();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          v58 = [NSString stringWithFormat:@"Invalid render scale"];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v58;
          _os_log_error_impl(&dword_1A9892000, v57, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = NUAssertLogger_20677();
        BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
        if (v59)
        {
          if (v61)
          {
            v64 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v65 = (void *)MEMORY[0x1E4F29060];
            id v66 = v64;
            v67 = [v65 callStackSymbols];
            v68 = [v67 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v64;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v68;
            _os_log_error_impl(&dword_1A9892000, v60, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v61)
        {
          v62 = [MEMORY[0x1E4F29060] callStackSymbols];
          v63 = [v62 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v63;
          _os_log_error_impl(&dword_1A9892000, v60, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"-[NUCropNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 251, @"Invalid render scale", v69, v70, v71, v72, v73);
      }
      objc_super v11 = [(NUCropNode *)self transformAffine];
      if (v11)
      {
        uint64_t v12 = [v8 renderScale];
        double v74 = NUScaleToDouble(v12, v13);
        float64x2_t v79 = 0u;
        memset(buf, 0, sizeof(buf));
        [v11 transform];
        float64x2_t v79 = vmulq_n_f64(v79, v74);
        uint64_t v14 = [v8 scaledSize];
        uint64_t v16 = v15;
        v75[0] = *(_OWORD *)buf;
        v75[1] = *(_OWORD *)&buf[16];
        v75[2] = v79;
        uint64_t v17 = [v6 imageByApplyingTransform:v75];

        [v17 extent];
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        [v8 scaledExtent];
        v85.origin.CGFloat x = v26;
        v85.origin.CGFloat y = v27;
        v85.size.CGFloat width = v28;
        v85.size.CGFloat height = v29;
        v82.origin.CGFloat x = v19;
        v82.origin.CGFloat y = v21;
        v82.size.CGFloat width = v23;
        v82.size.CGFloat height = v25;
        CGRect v83 = CGRectIntersection(v82, v85);
        CGFloat x = v83.origin.x;
        CGFloat y = v83.origin.y;
        CGFloat width = v83.size.width;
        CGFloat height = v83.size.height;
        [v8 scaledExtent];
        v86.origin.CGFloat x = x;
        v86.origin.CGFloat y = y;
        v86.size.CGFloat width = width;
        v86.size.CGFloat height = height;
        if (!CGRectEqualToRect(v84, v86))
        {
          uint64_t v34 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
          uint64_t v35 = [MEMORY[0x1E4F1E050] imageWithColor:v34];
          uint64_t v36 = [v17 imageByCompositingOverImage:v35];

          uint64_t v17 = (void *)v36;
        }
        long long v37 = [v17 imageByClampingToExtent];

        long long v38 = objc_msgSend(v37, "imageByCroppingToRect:", 0.0, 0.0, (double)v14, (double)v16);

        id v6 = v38;
        v39 = v6;
      }
      else
      {
        +[NUError errorWithCode:1 reason:@"Could not get the input geometry" object:self underlyingError:v9];
        v39 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Could not get the output geometry" object:self underlyingError:v9];
      v39 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Could not get the input image" object:self underlyingError:v7];
    v39 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v7;
  }

  return v39;
}

- (BOOL)scaledCropOrigin:(CGPoint *)a3 error:(id *)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    long long v37 = NUAssertLogger_20677();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      long long v38 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "origin != nil");
      buf[0].i32[0] = 138543362;
      *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v38;
      _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v40 = NUAssertLogger_20677();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        uint64_t v54 = [v52 callStackSymbols];
        uint64_t v55 = [v54 componentsJoinedByString:@"\n"];
        buf[0].i32[0] = 138543618;
        *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v51;
        buf[0].i16[6] = 2114;
        *(uint64_t *)((char *)&buf[0].i64[1] + 6) = (uint64_t)v55;
        _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v41)
    {
      uint64_t v42 = [MEMORY[0x1E4F29060] callStackSymbols];
      v43 = [v42 componentsJoinedByString:@"\n"];
      buf[0].i32[0] = 138543362;
      *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v43;
      _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCropNode scaledCropOrigin:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 172, @"Invalid parameter not satisfying: %s", v56, v57, v58, v59, (uint64_t)"origin != nil");
  }
  if (!a4)
  {
    v44 = NUAssertLogger_20677();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      BOOL v45 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      buf[0].i32[0] = 138543362;
      *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v45;
      _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v47 = NUAssertLogger_20677();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (v46)
    {
      if (v48)
      {
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v61 = (void *)MEMORY[0x1E4F29060];
        id v62 = v60;
        v63 = [v61 callStackSymbols];
        v64 = [v63 componentsJoinedByString:@"\n"];
        buf[0].i32[0] = 138543618;
        *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v60;
        buf[0].i16[6] = 2114;
        *(uint64_t *)((char *)&buf[0].i64[1] + 6) = (uint64_t)v64;
        _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v48)
    {
      v49 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v50 = [v49 componentsJoinedByString:@"\n"];
      buf[0].i32[0] = 138543362;
      *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v50;
      _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCropNode scaledCropOrigin:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 173, @"Invalid parameter not satisfying: %s", v65, v66, v67, v68, (uint64_t)"error != nil");
  }
  memset(buf, 0, sizeof(buf));
  [(NUCropNode *)self cropRect];
  id v7 = [(NURenderNode *)self outputImageGeometry:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 renderScale];
    double v69 = NUScaleToDouble(v9, v10);
    *(float64x2_t *)a3 = vmulq_n_f64(vcvtq_f64_s64(buf[0]), v69);
    objc_super v11 = [(NURenderNode *)self settings];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"projectUsingCleanAperture"];

    uint64_t v13 = [(NURenderNode *)self settings];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"projectUsingOriginalSize"];

    if (!(v12 | v14))
    {
      BOOL v17 = 1;
      goto LABEL_14;
    }
    uint64_t v15 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
    uint64_t v16 = [v15 outputImageGeometry:a4];
    BOOL v17 = v16 != 0;
    if (v16)
    {
      [(id)v14 X];
      double v19 = v18;
      [(id)v14 Y];
      double v21 = v20;
      [(id)v12 CGRectValue];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v29 = v22;
      if (v19 != v27 || v21 != v22) {
        goto LABEL_10;
      }
      v30 = [(NURenderNode *)self settings];
      v31 = [v30 objectForKeyedSubscript:@"projectUsingEstimatedCleanAperture"];
      [v31 doubleValue];
      double v33 = v32;

      if (v33 > 0.0)
      {
        double v19 = v19 * (v33 + 1.0);
        double v21 = v21 * (v33 + 1.0);
LABEL_10:
        [v16 extent];
        -[NUCropNode scaleCropOriginForOriginalVideoSize:originalCleanAperture:renderScale:inputExtent:](self, "scaleCropOriginForOriginalVideoSize:originalCleanAperture:renderScale:inputExtent:", v70, v19, v21, v24, v26, v28, v29, v69);
        a3->CGFloat x = v34;
        a3->CGFloat y = v35;
      }
    }

LABEL_14:
    goto LABEL_15;
  }
  BOOL v17 = 0;
LABEL_15:

  return v17;
}

- (CGPoint)scaleCropOriginForOriginalVideoSize:(CGSize)a3 originalCleanAperture:(CGRect)a4 renderScale:(double)a5 inputExtent:(id *)a6
{
  CGFloat r2 = a4.origin.y;
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat rect = a4.origin.x;
  double v9 = a3.height;
  double v10 = a3.width;
  [(NUCropNode *)self cropRect];
  if (v10 == width && v9 == height)
  {
    double v13 = a5;
    int64x2_t v14 = 0u;
    goto LABEL_8;
  }
  v12.f64[0] = rect;
  double v13 = a5;
  if (width < 1.0)
  {
    int64x2_t v14 = 0u;
LABEL_8:
    float64x2_t v15 = vmulq_n_f64(vcvtq_f64_s64(v14), v13);
    goto LABEL_9;
  }
  float64x2_t v17 = vcvtq_f64_s64((int64x2_t)0);
  __asm { FMOV            V3.2D, #0.5 }
  v12.f64[1] = r2;
  float64x2_t recta = vmulq_n_f64(v17, a5);
  CGPoint r2a = (CGPoint)vsubq_f64(vsubq_f64(vmulq_n_f64(vaddq_f64(vmulq_f64(v17, _Q3), v17), v10 / width * a5), vmulq_n_f64(vdivq_f64(v12, (float64x2_t)vdupq_lane_s64(COERCE__INT64(v10 / width * a5), 0)), a5)), vmulq_f64(recta, _Q3));
  double v22 = (double)a6->var0.var0 * a5;
  double v23 = (double)a6->var0.var1 * a5;
  v17.f64[0] = (double)a6->var1.var0 * a5;
  _Q3.f64[0] = (double)a6->var1.var1 * a5;
  CGRect v51 = CGRectStandardize(*(CGRect *)(&v17 - 1));
  CGFloat x = v51.origin.x;
  CGFloat y = v51.origin.y;
  CGFloat v26 = v51.size.width;
  CGFloat v27 = v51.size.height;
  v68.size.double width = recta.f64[0];
  v68.origin = r2a;
  v68.size.double height = recta.f64[1];
  BOOL v28 = CGRectContainsRect(v51, v68);
  float64x2_t v15 = (float64x2_t)r2a;
  if (!v28)
  {
    v52.size.double width = recta.f64[0];
    v52.origin = r2a;
    v52.size.double height = recta.f64[1];
    double MaxX = CGRectGetMaxX(v52);
    v53.origin.CGFloat x = x;
    v53.origin.CGFloat y = y;
    v53.size.double width = v26;
    v53.size.double height = v27;
    BOOL v30 = MaxX <= CGRectGetMaxX(v53);
    CGFloat v31 = r2a.x;
    double v32 = r2a.x;
    if (!v30)
    {
      v54.size.double width = recta.f64[0];
      v54.origin = r2a;
      v54.size.double height = recta.f64[1];
      double v33 = CGRectGetMaxX(v54);
      v55.origin.CGFloat x = x;
      v55.origin.CGFloat y = y;
      v55.size.double width = v26;
      v55.size.double height = v27;
      double v32 = r2a.x - (v33 - CGRectGetMaxX(v55));
      CGFloat v31 = r2a.x;
    }
    CGFloat v34 = r2a.y;
    float64x2_t v35 = recta;
    double MinX = CGRectGetMinX(*(CGRect *)&v31);
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.double width = v26;
    v56.size.double height = v27;
    if (MinX < CGRectGetMinX(v56))
    {
      v57.origin.CGFloat x = x;
      v57.origin.CGFloat y = y;
      v57.size.double width = v26;
      v57.size.double height = v27;
      double v37 = CGRectGetMaxX(v57);
      v58.size.double width = recta.f64[0];
      v58.origin = r2a;
      v58.size.double height = recta.f64[1];
      double v32 = v32 + v37 - CGRectGetMaxX(v58);
    }
    CGFloat r2_16a = v32;
    v59.size.double width = recta.f64[0];
    v59.origin = r2a;
    v59.size.double height = recta.f64[1];
    double MaxY = CGRectGetMaxY(v59);
    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = y;
    v60.size.double width = v26;
    v60.size.double height = v27;
    BOOL v30 = MaxY <= CGRectGetMaxY(v60);
    double v39 = r2a.y;
    if (!v30)
    {
      v61.size.double width = recta.f64[0];
      v61.origin = r2a;
      v61.size.double height = recta.f64[1];
      double v40 = CGRectGetMaxY(v61);
      v62.origin.CGFloat x = x;
      v62.origin.CGFloat y = y;
      v62.size.double width = v26;
      v62.size.double height = v27;
      double v39 = r2a.y - (v40 - CGRectGetMaxY(v62));
    }
    v63.size.double width = recta.f64[0];
    v63.origin = r2a;
    v63.size.double height = recta.f64[1];
    double MinY = CGRectGetMinY(v63);
    v64.origin.CGFloat x = x;
    v64.origin.CGFloat y = y;
    v64.size.double width = v26;
    v64.size.double height = v27;
    if (MinY < CGRectGetMinY(v64))
    {
      v65.origin.CGFloat x = x;
      v65.origin.CGFloat y = y;
      v65.size.double width = v26;
      v65.size.double height = v27;
      double v42 = CGRectGetMinY(v65);
      v66.size.double width = recta.f64[0];
      v66.origin = r2a;
      v66.size.double height = recta.f64[1];
      double v39 = v39 + v42 - CGRectGetMinY(v66);
    }
    v69.origin.CGFloat x = r2_16a;
    v67.origin.CGFloat x = x;
    v67.origin.CGFloat y = y;
    v67.size.double width = v26;
    v67.size.double height = v27;
    v69.origin.CGFloat y = v39;
    v69.size = (CGSize)recta;
    *(CGRect *)v15.f64 = CGRectIntersection(v67, v69);
    v15.f64[1] = v43;
  }
LABEL_9:
  double v16 = v15.f64[1];
  result.CGFloat x = v15.f64[0];
  result.CGFloat y = v16;
  return result;
}

- (id)_transformWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v4 = NUAssertLogger_20677();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      double v21 = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v7 = NUAssertLogger_20677();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        objc_super v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        float64x2_t v12 = (void *)MEMORY[0x1E4F29060];
        id v13 = v11;
        int64x2_t v14 = [v12 callStackSymbols];
        float64x2_t v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v21 = v11;
        __int16 v22 = 2114;
        double v23 = v15;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v8)
    {
      double v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v21 = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCropNode _transformWithError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 94, @"Invalid parameter not satisfying: %s", v16, v17, v18, v19, (uint64_t)"error != nil");
  }

  return [(NUCropNode *)self transformAffine];
}

- (id)transformAffine
{
  v3 = [(NUCropNode *)self transform];
  if (!v3)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    [(NUCropNode *)self cropRect];
    memset(&v8, 0, sizeof(v8));
    CGAffineTransformMakeTranslation(&v8, (double)-(uint64_t)v9, (double)(uint64_t)-*((void *)&v9 + 1));
    id v4 = [NUImageTransformAffine alloc];
    CGAffineTransform v7 = v8;
    objc_super v5 = [(NUImageTransformAffine *)v4 initWithAffineTransform:&v7];
    [(NUCropNode *)self setTransform:v5];

    v3 = [(NUCropNode *)self transform];
  }

  return v3;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v10.receiver = self;
  v10.super_class = (Class)NUCropNode;
  CGAffineTransform v7 = [(NURenderNode *)&v10 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  if (v7)
  {
    [(NUCropNode *)self cropRect];
    v9[0] = v9[2];
    v9[1] = v9[3];
    [v7 setCropRect:v9];
    v7[168] = self->_resetCleanAperture;
  }

  return v7;
}

- (NUCropNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_20692);
  }
  CGAffineTransform v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    long long v9 = NSString;
    objc_super v10 = v8;
    objc_super v11 = (objc_class *)objc_opt_class();
    float64x2_t v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    int64x2_t v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    CGFloat v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_20692);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_20692);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F29060];
    uint64_t v18 = v16;
    uint64_t v19 = [v17 callStackSymbols];
    double v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    CGFloat v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  double v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  double v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  uint64_t v18 = v21;
  double v25 = [v23 callStackSymbols];
  CGFloat v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  CGFloat v34 = specific;
  __int16 v35 = 2114;
  uint64_t v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  CGFloat v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCropNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 60, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

- (NUCropNode)initWithRect:(id *)a3 input:(id)a4
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v6[0] = a3->var0;
  v6[1] = var1;
  return [(NUCropNode *)self initWithRect:v6 input:a4 resetCleanAperture:0 settings:0];
}

- (NUCropNode)initWithRect:(id *)a3 input:(id)a4 resetCleanAperture:(BOOL)a5 settings:(id)a6
{
  BOOL v7 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  if (!v10)
  {
    double v20 = NUAssertLogger_20677();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      double v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      double v40 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v23 = NUAssertLogger_20677();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        CGFloat v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        uint64_t v30 = [v28 callStackSymbols];
        uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v40 = v27;
        __int16 v41 = 2114;
        double v42 = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      double v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGFloat v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v40 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCropNode initWithRect:input:resetCleanAperture:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 33, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"input != nil");
  }
  float64x2_t v12 = v11;
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  int64x2_t v14 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", (double)a3->var0.var0, (double)a3->var0.var1, (double)a3->var1.var0, (double)a3->var1.var1);
  [v13 setObject:v14 forKeyedSubscript:@"inputRectangle"];

  uint64_t v15 = [NSNumber numberWithBool:v7];
  [v13 setObject:v15 forKeyedSubscript:@"resetCleanAperture"];

  if (v12) {
    [v13 addEntriesFromDictionary:v12];
  }
  uint64_t v37 = *MEMORY[0x1E4F1E480];
  id v38 = v10;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  v36.receiver = self;
  v36.super_class = (Class)NUCropNode;
  uint64_t v17 = [(NURenderNode *)&v36 initWithSettings:v13 inputs:v16];

  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v17 + 184) = a3->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v17 + 200) = var1;
  v17[168] = v7;

  return (NUCropNode *)v17;
}

@end