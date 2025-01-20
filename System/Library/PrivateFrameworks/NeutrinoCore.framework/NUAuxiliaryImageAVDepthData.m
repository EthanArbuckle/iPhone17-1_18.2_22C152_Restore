@interface NUAuxiliaryImageAVDepthData
- (AVDepthData)avDepthData;
- (CGImage)cgImageRef;
- (CGImageMetadata)metadata;
- (NUColorSpace)colorSpace;
- (__CVBuffer)cvPixelBufferRef;
- (id)auxiliaryImageByApplyingExifOrientation:(unsigned int)a3;
- (id)auxiliaryImageByReplacingAuxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationForAuxiliaryDataType:(id *)a3;
- (id)initAuxiliaryImageFromAVDepthData:(id)a3;
- (int64_t)auxiliaryImageType;
- (unsigned)pixelFormatType;
@end

@implementation NUAuxiliaryImageAVDepthData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avDepthData, 0);

  objc_storeStrong((id *)&self->colorSpace, 0);
}

- (AVDepthData)avDepthData
{
  return (AVDepthData *)objc_getProperty(self, a2, 24, 1);
}

- (NUColorSpace)colorSpace
{
  return self->colorSpace;
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (CGImageMetadata)metadata
{
  v2 = [(NUAuxiliaryImageAVDepthData *)self dictionaryRepresentation];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F2F380]];

  return (CGImageMetadata *)v3;
}

- (CGImage)cgImageRef
{
  return 0;
}

- (__CVBuffer)cvPixelBufferRef
{
  id v2 = [(NUAuxiliaryImageAVDepthData *)self avDepthData];
  v3 = (__CVBuffer *)[v2 depthDataMap];

  return v3;
}

- (unsigned)pixelFormatType
{
  id v2 = [(NUAuxiliaryImageAVDepthData *)self avDepthData];
  unsigned int v3 = [v2 depthDataType];

  return v3;
}

- (id)dictionaryRepresentationForAuxiliaryDataType:(id *)a3
{
  v4 = [(NUAuxiliaryImageAVDepthData *)self avDepthData];
  v5 = [v4 dictionaryRepresentationForAuxiliaryDataType:a3];

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v4 = 0;
  id v2 = [(NUAuxiliaryImageAVDepthData *)self dictionaryRepresentationForAuxiliaryDataType:&v4];

  return v2;
}

- (id)auxiliaryImageByReplacingAuxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  v6 = [(NUAuxiliaryImageAVDepthData *)self avDepthData];
  v7 = [v6 depthDataByReplacingDepthDataMapWithPixelBuffer:a3 error:a4];

  if (v7) {
    id v8 = [[NUAuxiliaryImageAVDepthData alloc] initAuxiliaryImageFromAVDepthData:v7];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)auxiliaryImageByApplyingExifOrientation:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(NUAuxiliaryImageAVDepthData *)self avDepthData];
  v5 = [v4 depthDataByApplyingExifOrientation:v3];

  id v6 = [[NUAuxiliaryImageAVDepthData alloc] initAuxiliaryImageFromAVDepthData:v5];

  return v6;
}

- (id)initAuxiliaryImageFromAVDepthData:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v10 = NUAssertLogger_14834();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "avDepthData != nil");
      *(_DWORD *)buf = 138543362;
      v28 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_14834();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        v20 = [v18 callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        __int16 v29 = 2114;
        v30 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v28 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageAVDepthData initAuxiliaryImageFromAVDepthData:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUAuxiliaryImage.m", 276, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"avDepthData != nil");
  }
  id v6 = v5;
  v26.receiver = self;
  v26.super_class = (Class)NUAuxiliaryImageAVDepthData;
  v7 = [(NUAuxiliaryImageAVDepthData *)&v26 init];
  id v8 = v7;
  if (v7)
  {
    v7->_auxiliaryImageType = 2;
    objc_storeStrong((id *)&v7->_avDepthData, a3);
  }

  return v8;
}

@end