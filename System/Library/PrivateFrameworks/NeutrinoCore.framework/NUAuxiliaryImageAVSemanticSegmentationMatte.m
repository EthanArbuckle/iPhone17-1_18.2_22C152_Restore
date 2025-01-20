@interface NUAuxiliaryImageAVSemanticSegmentationMatte
- (AVSemanticSegmentationMatte)avSemanticSegmentationMatte;
- (CGImage)cgImageRef;
- (CGImageMetadata)metadata;
- (NUColorSpace)colorSpace;
- (__CVBuffer)cvPixelBufferRef;
- (id)auxiliaryImageByApplyingExifOrientation:(unsigned int)a3;
- (id)auxiliaryImageByReplacingAuxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationForAuxiliaryDataType:(id *)a3;
- (id)initAuxiliaryImageFromAVSemanticSegmentationMatte:(id)a3;
- (int64_t)auxiliaryImageType;
- (unsigned)pixelFormatType;
@end

@implementation NUAuxiliaryImageAVSemanticSegmentationMatte

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avSemanticSegmentationMatte, 0);

  objc_storeStrong((id *)&self->colorSpace, 0);
}

- (AVSemanticSegmentationMatte)avSemanticSegmentationMatte
{
  return (AVSemanticSegmentationMatte *)objc_getProperty(self, a2, 32, 1);
}

- (NUColorSpace)colorSpace
{
  return self->colorSpace;
}

- (CGImageMetadata)metadata
{
  return self->metadata;
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (CGImage)cgImageRef
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CGImageRef imageOut = 0;
  OSStatus v2 = VTCreateCGImageFromCVPixelBuffer([(NUAuxiliaryImageAVSemanticSegmentationMatte *)self cvPixelBufferRef], 0, &imageOut);
  if (v2)
  {
    OSStatus v3 = v2;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_211);
    }
    v4 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v8 = v3;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "VTCreateCGImageFromCVPixelBuffer() failed: %d", buf, 8u);
    }
  }
  return imageOut;
}

- (__CVBuffer)cvPixelBufferRef
{
  id v2 = [(NUAuxiliaryImageAVSemanticSegmentationMatte *)self avSemanticSegmentationMatte];
  OSStatus v3 = (__CVBuffer *)[v2 mattingImage];

  return v3;
}

- (unsigned)pixelFormatType
{
  id v2 = [(NUAuxiliaryImageAVSemanticSegmentationMatte *)self avSemanticSegmentationMatte];
  unsigned int v3 = [v2 pixelFormatType];

  return v3;
}

- (id)dictionaryRepresentationForAuxiliaryDataType:(id *)a3
{
  v4 = [(NUAuxiliaryImageAVSemanticSegmentationMatte *)self avSemanticSegmentationMatte];
  v5 = [v4 dictionaryRepresentationForAuxiliaryDataType:a3];

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v4 = 0;
  id v2 = [(NUAuxiliaryImageAVSemanticSegmentationMatte *)self dictionaryRepresentationForAuxiliaryDataType:&v4];

  return v2;
}

- (id)auxiliaryImageByReplacingAuxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  v6 = [(NUAuxiliaryImageAVSemanticSegmentationMatte *)self avSemanticSegmentationMatte];
  v7 = [v6 semanticSegmentationMatteByReplacingSemanticSegmentationMatteWithPixelBuffer:a3 error:a4];

  if (v7) {
    id v8 = [[NUAuxiliaryImageAVSemanticSegmentationMatte alloc] initAuxiliaryImageFromAVSemanticSegmentationMatte:v7];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)auxiliaryImageByApplyingExifOrientation:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(NUAuxiliaryImageAVSemanticSegmentationMatte *)self avSemanticSegmentationMatte];
  v5 = [v4 semanticSegmentationMatteByApplyingExifOrientation:v3];

  id v6 = [[NUAuxiliaryImageAVSemanticSegmentationMatte alloc] initAuxiliaryImageFromAVSemanticSegmentationMatte:v5];

  return v6;
}

- (id)initAuxiliaryImageFromAVSemanticSegmentationMatte:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v11 = NUAssertLogger_14834();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "avSemanticSegmentationMatte != nil");
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_14834();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        __int16 v30 = 2114;
        v31 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageAVSemanticSegmentationMatte initAuxiliaryImageFromAVSemanticSegmentationMatte:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUAuxiliaryImage.m", 431, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"avSemanticSegmentationMatte != nil");
  }
  id v6 = v5;
  v27.receiver = self;
  v27.super_class = (Class)NUAuxiliaryImageAVSemanticSegmentationMatte;
  v7 = [(NUAuxiliaryImageAVSemanticSegmentationMatte *)&v27 init];
  if (v7)
  {
    id v8 = [v6 matteType];
    if ([v8 isEqualToString:*MEMORY[0x1E4F160C8]])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:*MEMORY[0x1E4F160C0]])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:*MEMORY[0x1E4F160D0]])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:*MEMORY[0x1E4F160B8]])
    {
      uint64_t v9 = 8;
    }
    else
    {
      if (![v8 isEqualToString:@"AVSemanticSegmentationMatteTypeSky"])
      {
        v7->_auxiliaryImageType = 0;
        goto LABEL_14;
      }
      uint64_t v9 = 9;
    }
    v7->_auxiliaryImageType = v9;
LABEL_14:
    objc_storeStrong((id *)&v7->_avSemanticSegmentationMatte, a3);
  }
  return v7;
}

@end