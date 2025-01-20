@interface NUCGAuxiliaryImageProperties
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (AVCameraCalibrationData)depthCamCalibrationData;
- (CGImageMetadata)auxiliaryDataInfoMetadata;
- (CGImageMetadata)compatibilityMetadata;
- (NSDictionary)auxCGInfoDictionary;
- (NSString)auxiliaryImageTypeCGIdentifier;
- (NSString)description;
- (NUAuxiliaryImage)auxImage;
- (NUCGAuxiliaryImageProperties)initWithCGProperties:(id)a3 imageSource:(CGImageSource *)a4;
- (NUColorSpace)auxInfoColorSpace;
- (NUColorSpace)colorSpace;
- (NUPixelFormat)pixelFormat;
- (id)auxDataInfoMetadata;
- (id)auxiliaryCoreGraphicsInfoDictionary:(id *)a3;
- (id)auxiliaryImage:(id *)a3;
- (id)auxiliaryImagePropertiesByUpdatingMetadata:(CGImageMetadata *)a3;
- (id)auxiliaryImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)depthCameraCalibrationData;
- (void)setAuxCGInfoDictionary:(id)a3;
- (void)setAuxDataInfoMetadata:(id)a3;
- (void)setAuxImage:(id)a3;
- (void)setAuxInfoColorSpace:(id)a3;
- (void)setCompatibilityMetadata:(CGImageMetadata *)a3;
- (void)setDepthCamCalibrationData:(id)a3;
@end

@implementation NUCGAuxiliaryImageProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxInfoColorSpace, 0);
  objc_storeStrong(&self->_auxDataInfoMetadata, 0);
  objc_storeStrong((id *)&self->_depthCamCalibrationData, 0);
  objc_storeStrong((id *)&self->_auxImage, 0);
  objc_storeStrong((id *)&self->_auxCGInfoDictionary, 0);
  objc_storeStrong((id *)&self->_auxiliaryImageTypeCGIdentifier, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);

  objc_destroyWeak(&self->_imageSource);
}

- (void)setAuxInfoColorSpace:(id)a3
{
}

- (NUColorSpace)auxInfoColorSpace
{
  return (NUColorSpace *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAuxDataInfoMetadata:(id)a3
{
}

- (id)auxDataInfoMetadata
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setDepthCamCalibrationData:(id)a3
{
}

- (AVCameraCalibrationData)depthCamCalibrationData
{
  return (AVCameraCalibrationData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAuxImage:(id)a3
{
}

- (NUAuxiliaryImage)auxImage
{
  return (NUAuxiliaryImage *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAuxCGInfoDictionary:(id)a3
{
}

- (NSDictionary)auxCGInfoDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCompatibilityMetadata:(CGImageMetadata *)a3
{
}

- (CGImageMetadata)compatibilityMetadata
{
  return self->_compatibilityMetadata;
}

- (NSString)auxiliaryImageTypeCGIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
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

- (id)auxiliaryImagePropertiesByUpdatingMetadata:(CGImageMetadata *)a3
{
  v4 = (void *)[(NUCGAuxiliaryImageProperties *)self copy];
  [v4 setAuxDataInfoMetadata:a3];
  uint64_t v10 = 0;
  id v5 = (id)[v4 auxiliaryCoreGraphicsInfoDictionary:&v10];
  v6 = [v4 auxCGInfoDictionary];
  v7 = (void *)[v6 mutableCopy];

  [v7 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F2F380]];
  v8 = (void *)[v7 copy];
  [v4 setAuxCGInfoDictionary:v8];

  return v4;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(NUCGAuxiliaryImageProperties *)self auxiliaryImageTypeCGIdentifier];
  uint64_t v5 = [(NUCGAuxiliaryImageProperties *)self size];
  v7 = [NSString stringWithFormat:@"{%ld, %ld}", v5, v6];
  v8 = [v3 stringWithFormat:@"<NUCGAuxiliaryImageProperties:%p> type=%@ size=%@", self, v4, v7];

  return (NSString *)v8;
}

- (id)depthCameraCalibrationData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  depthCamCalibrationData = self->_depthCamCalibrationData;
  if (depthCamCalibrationData)
  {
    v3 = depthCamCalibrationData;
  }
  else
  {
    id v9 = 0;
    uint64_t v5 = [(NUCGAuxiliaryImageProperties *)self auxiliaryImage:&v9];
    id v6 = v9;
    if (v5)
    {
      v3 = self->_depthCamCalibrationData;
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
      }
      v7 = _NURenderLogger;
      if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "failed to get cameraCalibrationData. error: %@", buf, 0xCu);
      }
      v3 = 0;
    }
  }

  return v3;
}

- (id)auxiliaryImage:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v16 = NUAssertLogger_2215();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v33 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_2215();
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
        v33 = v23;
        __int16 v34 = 2114;
        v35 = v27;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageProperties auxiliaryImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1408, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"error != NULL");
  }
  uint64_t v5 = [(NUCGAuxiliaryImageProperties *)self auxImage];
  if (v5)
  {
    id v6 = v5;
    goto LABEL_13;
  }
  v7 = [(NUCGAuxiliaryImageProperties *)self auxiliaryCoreGraphicsInfoDictionary:a3];
  if (v7)
  {
    v8 = [(NUCGAuxiliaryImageProperties *)self auxiliaryImageTypeCGIdentifier];
    id v9 = +[NUAuxiliaryImageFactory auxiliaryImageFromCoreGraphicsInfoDictionary:v7 forCGAuxiliaryImageTypeString:v8 error:a3];

    if (v9)
    {
      [(NUCGAuxiliaryImageProperties *)self setAuxCGInfoDictionary:0];
      [(NUCGAuxiliaryImageProperties *)self setAuxImage:v9];
      if ([v9 auxiliaryImageType] == 2)
      {
        uint64_t v10 = [(NUCGAuxiliaryImageProperties *)self auxImage];
        id v11 = [v10 underlyingAVDepthData];
        uint64_t v12 = [v11 cameraCalibrationData];
        [(NUCGAuxiliaryImageProperties *)self setDepthCamCalibrationData:v12];
      }
      id v6 = v9;
      goto LABEL_12;
    }
    id v13 = *a3;
    v14 = @"Cannot create auxiliaryImage. NUAuxiliaryImageFactory failed.";
  }
  else
  {
    id v13 = *a3;
    v14 = @"Cannot create auxiliaryImage. Missing dictionary.";
  }
  +[NUError errorWithCode:7 reason:v14 object:self underlyingError:v13];
  id v6 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

LABEL_13:

  return v6;
}

- (id)auxiliaryImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a4)
  {
    uint64_t v12 = NUAssertLogger_2215();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleFactor != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_2215();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v19;
        __int16 v30 = 2114;
        uint64_t v31 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageProperties auxiliaryImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1400, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"subsampleFactor != NULL");
  }
  id v9 = v8;
  *a4 = 1;
  uint64_t v10 = [(NUCGAuxiliaryImageProperties *)self auxiliaryImage:a5];

  return v10;
}

- (id)auxiliaryCoreGraphicsInfoDictionary:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v26 = NUAssertLogger_2215();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v45 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v29 = NUAssertLogger_2215();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        uint64_t v36 = [v34 callStackSymbols];
        v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v33;
        __int16 v46 = 2114;
        v47 = v37;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageProperties auxiliaryCoreGraphicsInfoDictionary:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1342, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  id WeakRetained = objc_loadWeakRetained(&self->_imageSource);

  id v6 = [(NUCGAuxiliaryImageProperties *)self auxCGInfoDictionary];
  if (!v6)
  {
    v7 = [(NUCGAuxiliaryImageProperties *)self auxImage];

    if (v7)
    {
      id v8 = [(NUCGAuxiliaryImageProperties *)self auxImage];
      uint64_t v9 = [(__CFString *)v8 dictionaryRepresentation];
LABEL_15:
      id v6 = (void *)v9;

      if (v6)
      {
        v15 = [(NUCGAuxiliaryImageProperties *)self auxiliaryImageTypeCGIdentifier];
        if ([v15 isEqualToString:*MEMORY[0x1E4F2F3C8]])
        {
          BOOL v16 = [(NUCGAuxiliaryImageProperties *)self compatibilityMetadata];

          if (!v16)
          {
LABEL_20:
            [(NUCGAuxiliaryImageProperties *)self setAuxImage:0];
            [(NUCGAuxiliaryImageProperties *)self setAuxCGInfoDictionary:v6];
            if (!self->_auxDataInfoMetadata)
            {
              v19 = [(NUCGAuxiliaryImageProperties *)self auxCGInfoDictionary];
              BOOL v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F2F380]];
              id auxDataInfoMetadata = self->_auxDataInfoMetadata;
              self->_id auxDataInfoMetadata = v20;
            }
            v22 = [(NUCGAuxiliaryImageProperties *)self auxInfoColorSpace];

            if (!v22)
            {
              v23 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2F368]];

              if (v23)
              {
                uint64_t v24 = [[NUColorSpace alloc] initWithCGColorSpace:v23];
                [(NUCGAuxiliaryImageProperties *)self setAuxInfoColorSpace:v24];
              }
            }
            goto LABEL_27;
          }
          v15 = (void *)[v6 mutableCopy];
          v17 = [(NUCGAuxiliaryImageProperties *)self compatibilityMetadata];
          [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F2F388]];
          uint64_t v18 = [v15 copy];

          id v6 = (void *)v18;
        }

        goto LABEL_20;
      }
      id v11 = *a3;
LABEL_26:
      +[NUError errorWithCode:1 reason:@"Unable to obtain auxiliary data" object:self underlyingError:v11];
      id v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    if (!WeakRetained)
    {
      id v11 = +[NUError missingError:@"imageSource is nil" object:0];
      *a3 = v11;
      goto LABEL_26;
    }
    uint64_t v10 = [(NUCGAuxiliaryImageProperties *)self auxiliaryImageTypeCGIdentifier];
    if ([v10 isEqualToString:*MEMORY[0x1E4F2F3C8]])
    {
    }
    else
    {
      uint64_t v12 = [(NUCGAuxiliaryImageProperties *)self auxiliaryImageTypeCGIdentifier];
      int v13 = [v12 isEqualToString:*MEMORY[0x1E4F2F3C0]];

      if (!v13)
      {
LABEL_14:
        id v8 = [(NUCGAuxiliaryImageProperties *)self auxiliaryImageTypeCGIdentifier];
        uint64_t v9 = (uint64_t)CGImageSourceCopyAuxiliaryDataInfoAtIndex((CGImageSourceRef)WeakRetained, 0, v8);
        goto LABEL_15;
      }
    }
    if (ImageIOLibraryCore() && getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc())
    {
      id v8 = [(NUCGAuxiliaryImageProperties *)self auxiliaryImageTypeCGIdentifier];
      CGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc = (uint64_t (*)(id, void, __CFString *, void *))getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc();
      if (!CGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc)
      {
        v42 = [MEMORY[0x1E4F28B00] currentHandler];
        v43 = objc_msgSend(NSString, "stringWithUTF8String:", "CFDictionaryRef soft_CGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptions(CGImageSourceRef, size_t, CFStringRef, CFDictionaryRef _Nullable)");
        objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, @"NURenderSourceNode+CGImage.m", 42, @"%s", dlerror());

        __break(1u);
      }
      uint64_t v9 = CGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc(WeakRetained, 0, v8, &unk_1F004A2A8);
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_27:

  return v6;
}

- (NUColorSpace)colorSpace
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(NUCGAuxiliaryImageProperties *)self auxInfoColorSpace];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v10 = 0;
    id v6 = [(NUCGAuxiliaryImageProperties *)self auxiliaryCoreGraphicsInfoDictionary:&v10];
    id v7 = v10;
    if (v6)
    {
      id v5 = [(NUCGAuxiliaryImageProperties *)self auxInfoColorSpace];
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
      }
      id v8 = _NURenderLogger;
      if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "failed to get auxiliaryDataInfoMetadata. error: %@", buf, 0xCu);
      }
      id v5 = 0;
    }
  }

  return (NUColorSpace *)v5;
}

- (CGImageMetadata)auxiliaryDataInfoMetadata
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id auxDataInfoMetadata = (CGImageMetadata *)self->_auxDataInfoMetadata;
  if (!auxDataInfoMetadata)
  {
    id v8 = 0;
    v4 = [(NUCGAuxiliaryImageProperties *)self auxiliaryCoreGraphicsInfoDictionary:&v8];
    id v5 = v8;
    if (v4)
    {
      id auxDataInfoMetadata = (CGImageMetadata *)self->_auxDataInfoMetadata;
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
      }
      id v6 = _NURenderLogger;
      if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "failed to get auxiliaryDataInfoMetadata. error: %@", buf, 0xCu);
      }
      id auxDataInfoMetadata = 0;
    }
  }
  return auxDataInfoMetadata;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [NUCGAuxiliaryImageProperties alloc];
  objc_storeStrong((id *)&v4->_auxCGInfoDictionary, self->_auxCGInfoDictionary);
  objc_storeStrong(&v4->_auxDataInfoMetadata, self->_auxDataInfoMetadata);
  v4->_compatibilityMetadata = self->_compatibilityMetadata;
  objc_storeStrong((id *)&v4->_auxImage, self->_auxImage);
  objc_storeStrong((id *)&v4->_auxiliaryImageTypeCGIdentifier, self->_auxiliaryImageTypeCGIdentifier);
  objc_storeStrong((id *)&v4->_depthCamCalibrationData, self->_depthCamCalibrationData);
  id WeakRetained = objc_loadWeakRetained(&self->_imageSource);
  objc_storeWeak(&v4->_imageSource, WeakRetained);

  v4->_size = self->_size;
  objc_storeStrong((id *)&v4->_pixelFormat, self->_pixelFormat);
  return v4;
}

- (NUCGAuxiliaryImageProperties)initWithCGProperties:(id)a3 imageSource:(CGImageSource *)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NUCGAuxiliaryImageProperties;
  id v7 = [(NUCGAuxiliaryImageProperties *)&v21 init];
  uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2F518]];
  auxiliaryImageTypeCGIdentifier = v7->_auxiliaryImageTypeCGIdentifier;
  v7->_auxiliaryImageTypeCGIdentifier = (NSString *)v8;

  id v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2FDD8]];
  uint64_t v11 = [v10 integerValue];

  id v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2FB48]];
  uint64_t v13 = [v12 integerValue];

  if ((v13 | v11) < 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v20 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    [v19 handleFailureInFunction:v20, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
  }
  v7->_size.int64_t width = v11;
  v7->_size.int64_t height = v13;
  v14 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE0]];
  uint64_t v15 = [v14 unsignedIntValue];

  uint64_t v16 = +[NUPixelFormat pixelFormatForCVPixelFormat:v15];
  pixelFormat = v7->_pixelFormat;
  v7->_pixelFormat = (NUPixelFormat *)v16;

  objc_storeWeak(&v7->_imageSource, a4);
  return v7;
}

@end