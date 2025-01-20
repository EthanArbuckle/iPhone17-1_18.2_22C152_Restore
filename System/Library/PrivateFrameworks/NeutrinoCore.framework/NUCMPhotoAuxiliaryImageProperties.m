@interface NUCMPhotoAuxiliaryImageProperties
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (CGImageMetadata)auxiliaryDataInfoMetadata;
- (CGImageMetadata)compatibilityMetadata;
- (NSString)auxiliaryImageTypeCGIdentifier;
- (NUCMPhotoAuxiliaryImageProperties)init;
- (NUCMPhotoAuxiliaryImageProperties)initWithProperties:(id)a3 decompressionContainer:(CMPhotoDecompressionContainer *)a4;
- (NUColorSpace)colorSpace;
- (NUPixelFormat)pixelFormat;
- (id)auxiliaryCoreGraphicsInfoDictionary:(id *)a3;
- (id)auxiliaryImage:(id *)a3;
- (id)auxiliaryImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)depthCameraCalibrationData;
@end

@implementation NUCMPhotoAuxiliaryImageProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImageTypeCGIdentifier, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_auxiliaryImageURN, 0);
  objc_storeStrong((id *)&self->_auxImage, 0);

  objc_destroyWeak(&self->_container);
}

- (NSString)auxiliaryImageTypeCGIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height = self->_size.height;
  int64_t width = self->_size.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (id)depthCameraCalibrationData
{
  return 0;
}

- (id)auxiliaryImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a4)
  {
    v18 = NUAssertLogger_2215();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleFactor != NULL");
      buf[0] = 138543362;
      *(void *)&buf[1] = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_2215();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        buf[0] = 138543618;
        *(void *)&buf[1] = v39;
        __int16 v68 = 2114;
        v69 = v43;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      buf[0] = 138543362;
      *(void *)&buf[1] = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties auxiliaryImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1123, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"subsampleFactor != NULL");
  }
  if (!a5)
  {
    v25 = NUAssertLogger_2215();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      buf[0] = 138543362;
      *(void *)&buf[1] = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_2215();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        v51 = [v49 callStackSymbols];
        v52 = [v51 componentsJoinedByString:@"\n"];
        buf[0] = 138543618;
        *(void *)&buf[1] = v48;
        __int16 v68 = 2114;
        v69 = v52;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      buf[0] = 138543362;
      *(void *)&buf[1] = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties auxiliaryImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1124, @"Invalid parameter not satisfying: %s", v53, v54, v55, v56, (uint64_t)"error != NULL");
  }
  v9 = v8;
  id WeakRetained = objc_loadWeakRetained(&self->_container);
  if (!WeakRetained)
  {
    v32 = NUAssertLogger_2215();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = [NSString stringWithFormat:@"Decompression container is dead!"];
      buf[0] = 138543362;
      *(void *)&buf[1] = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v35 = NUAssertLogger_2215();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E4F29060];
        id v59 = v57;
        v60 = [v58 callStackSymbols];
        v61 = [v60 componentsJoinedByString:@"\n"];
        buf[0] = 138543618;
        *(void *)&buf[1] = v57;
        __int16 v68 = 2114;
        v69 = v61;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v36)
    {
      v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      buf[0] = 138543362;
      *(void *)&buf[1] = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties auxiliaryImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1127, @"Decompression container is dead!", v62, v63, v64, v65, v66);
  }
  v11 = WeakRetained;
  uint64_t AuxiliaryImageCountForIndexWithOptions = CMPhotoDecompressionContainerGetAuxiliaryImageCountForIndexWithOptions();
  if (AuxiliaryImageCountForIndexWithOptions)
  {
    v13 = [NSNumber numberWithInt:AuxiliaryImageCountForIndexWithOptions];
    *a5 = +[NUError failureError:@"Failed to get number of auxiliary images" object:v13];
  }
  else
  {
    unint64_t type = self->_type;
    if (type > 0xB) {
      v16 = @"Invalid";
    }
    else {
      v16 = off_1E5D94190[type];
    }
    v17 = v16;
    *a5 = +[NUError failureError:@"Missing auxiliary image" object:v17];
  }

  return 0;
}

- (id)auxiliaryImage:(id *)a3
{
  uint64_t v5 = 1;
  v3 = [(NUCMPhotoAuxiliaryImageProperties *)self auxiliaryImageWithSourceOptions:MEMORY[0x1E4F1CC08] subsampleFactor:&v5 error:a3];

  return v3;
}

- (CGImageMetadata)compatibilityMetadata
{
  return 0;
}

- (NUColorSpace)colorSpace
{
  return 0;
}

- (CGImageMetadata)auxiliaryDataInfoMetadata
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
  }
  v2 = _NURenderLogger;
  if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1A9892000, v2, OS_LOG_TYPE_ERROR, "auxiliaryDataInfoMetadata is unavailable", v4, 2u);
  }
  return 0;
}

- (id)auxiliaryCoreGraphicsInfoDictionary:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v5 = NUAssertLogger_2215();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      BOOL v22 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v8 = NUAssertLogger_2215();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v13 = (void *)MEMORY[0x1E4F29060];
        id v14 = v12;
        v15 = [v13 callStackSymbols];
        v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v22 = v12;
        __int16 v23 = 2114;
        v24 = v16;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v22 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties auxiliaryCoreGraphicsInfoDictionary:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1098, @"Invalid parameter not satisfying: %s", v17, v18, v19, v20, (uint64_t)"error != NULL");
  }
  *a3 = +[NUError unsupportedError:@"Dictionary representation for this auxiliary image is not supported" object:self];
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NUCMPhotoAuxiliaryImageProperties allocWithZone:a3];
  v4->_unint64_t type = self->_type;
  v4->_size = self->_size;
  objc_storeStrong((id *)&v4->_pixelFormat, self->_pixelFormat);
  objc_storeStrong((id *)&v4->_auxImage, self->_auxImage);
  id WeakRetained = objc_loadWeakRetained(&self->_container);
  objc_storeWeak(&v4->_container, WeakRetained);

  objc_storeStrong((id *)&v4->_auxiliaryImageTypeCGIdentifier, self->_auxiliaryImageTypeCGIdentifier);
  return v4;
}

- (NUCMPhotoAuxiliaryImageProperties)initWithProperties:(id)a3 decompressionContainer:(CMPhotoDecompressionContainer *)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    __int16 v23 = NUAssertLogger_2215();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "properties");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v26 = NUAssertLogger_2215();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v39;
        __int16 v77 = 2114;
        v78 = v43;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties initWithProperties:decompressionContainer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1042, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"properties");
  }
  if (!a4)
  {
    v30 = NUAssertLogger_2215();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "decompressionContainer");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v31;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v33 = NUAssertLogger_2215();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v34)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        v51 = [v49 callStackSymbols];
        v52 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v48;
        __int16 v77 = 2114;
        v78 = v52;
        _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v36;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties initWithProperties:decompressionContainer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1043, @"Invalid parameter not satisfying: %s", v53, v54, v55, v56, (uint64_t)"decompressionContainer");
  }
  v7 = v6;
  v75.receiver = self;
  v75.super_class = (Class)NUCMPhotoAuxiliaryImageProperties;
  id v8 = [(NUCMPhotoAuxiliaryImageProperties *)&v75 init];
  uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2F518]];
  auxiliaryImageTypeCGIdentifier = v8->_auxiliaryImageTypeCGIdentifier;
  v8->_auxiliaryImageTypeCGIdentifier = (NSString *)v9;

  v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FDD8]];
  uint64_t v12 = [v11 integerValue];

  v13 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FB48]];
  uint64_t v14 = [v13 integerValue];

  if ((v14 | v12) < 0)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    v38 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    [v37 handleFailureInFunction:v38, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
  }
  v8->_size.int64_t width = v12;
  v8->_size.int64_t height = v14;
  v15 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE0]];
  uint64_t v16 = [v15 unsignedIntValue];

  uint64_t v17 = +[NUPixelFormat pixelFormatForCVPixelFormat:v16];
  pixelFormat = v8->_pixelFormat;
  v8->_pixelFormat = (NUPixelFormat *)v17;

  objc_storeWeak(&v8->_container, a4);
  if ([(NSString *)v8->_auxiliaryImageTypeCGIdentifier isEqualToString:@"tag:apple.com,2023:photo:aux:linearthumbnail"])
  {
    v8->_unint64_t type = 10;
    objc_storeStrong((id *)&v8->_auxiliaryImageURN, v8->_auxiliaryImageTypeCGIdentifier);
  }
  else if ([(NSString *)v8->_auxiliaryImageTypeCGIdentifier isEqualToString:@"tag:apple.com,2023:photo:aux:styledeltamap"])
  {
    v8->_unint64_t type = 11;
    objc_storeStrong((id *)&v8->_auxiliaryImageURN, v8->_auxiliaryImageTypeCGIdentifier);
    *(void *)buf = 0;
    if (!CMPhotoDecompressionContainerGetImageGeometryForIndexWithOptions())
    {
      int64_t v19 = *(void *)buf;
      if ((*(void *)buf & 0x8000000000000000) != 0)
      {
        v57 = [MEMORY[0x1E4F28B00] currentHandler];
        v58 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
        [v57 handleFailureInFunction:v58, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
      }
      v8->_size.int64_t width = v19;
      v8->_size.int64_t height = 0;
    }
  }
  else
  {
    if ([(NSString *)v8->_auxiliaryImageTypeCGIdentifier isEqualToString:*MEMORY[0x1E4F2F3D0]])
    {
      v8->_unint64_t type = 3;
      auxiliaryImageURN = v8->_auxiliaryImageURN;
      v21 = @"urn:com:apple:photo:2018:aux:portraiteffectsmatte";
    }
    else if ([(NSString *)v8->_auxiliaryImageTypeCGIdentifier isEqualToString:*MEMORY[0x1E4F2F3E8]])
    {
      v8->_unint64_t type = 4;
      auxiliaryImageURN = v8->_auxiliaryImageURN;
      v21 = @"urn:com:apple:photo:2019:aux:semanticskinmatte";
    }
    else
    {
      if (![(NSString *)v8->_auxiliaryImageTypeCGIdentifier isEqualToString:*MEMORY[0x1E4F2F3F0]])
      {
        id v59 = NUAssertLogger_2215();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v60 = [NSString stringWithFormat:@"Invalid aux image type: %@", v8->_auxiliaryImageTypeCGIdentifier];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v60;
          _os_log_error_impl(&dword_1A9892000, v59, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        v61 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v62 = NUAssertLogger_2215();
        BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
        if (v61)
        {
          if (v63)
          {
            uint64_t v66 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v67 = (void *)MEMORY[0x1E4F29060];
            id v68 = v66;
            v69 = [v67 callStackSymbols];
            uint64_t v70 = [v69 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v66;
            __int16 v77 = 2114;
            v78 = v70;
            _os_log_error_impl(&dword_1A9892000, v62, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v63)
        {
          uint64_t v64 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v65 = [v64 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v65;
          _os_log_error_impl(&dword_1A9892000, v62, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties initWithProperties:decompressionContainer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1078, @"Invalid aux image type: %@", v71, v72, v73, v74, (uint64_t)v8->_auxiliaryImageTypeCGIdentifier);
      }
      v8->_unint64_t type = 9;
      auxiliaryImageURN = v8->_auxiliaryImageURN;
      v21 = @"urn:com:apple:photo:2020:aux:semanticskymatte";
    }
    v8->_auxiliaryImageURN = &v21->isa;
  }
  return v8;
}

- (NUCMPhotoAuxiliaryImageProperties)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_2239);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = NSString;
    uint64_t v5 = v3;
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    uint64_t v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    BOOL v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_2239);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_2239);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    uint64_t v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    BOOL v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  BOOL v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  BOOL v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1038, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end