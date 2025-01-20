@interface SISceneSegmentationData
- (BOOL)saveToDisk:(id)a3 identifier:(id)a4;
- (CGSize)_resolutionByConfig:(id)a3;
- (CGSize)resolution;
- (SISceneSegmentationData)initWithConfig:(id)a3;
- (SISceneSegmentationData)initWithOutputResolution:(CGSize)a3;
- (SISceneSegmentationData)initWithOutputSemanticBuffer:(__CVBuffer *)a3 confidenceBuffer:(__CVBuffer *)a4 uncertaintyBuffer:(__CVBuffer *)a5;
- (__CVBuffer)confidence;
- (__CVBuffer)semantic;
- (__CVBuffer)uncertainty;
- (void)dealloc;
@end

@implementation SISceneSegmentationData

- (SISceneSegmentationData)initWithConfig:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISceneSegmentationData;
  v5 = [(SISceneSegmentationData *)&v14 init];
  v6 = v5;
  if (v5)
  {
    p_width = &v5->_resolution.width;
    [(SISceneSegmentationData *)v5 _resolutionByConfig:v4];
    double *p_width = v8;
    v6->_resolution.height = v9;
    size_t v10 = (unint64_t)v8;
    size_t v11 = (unint64_t)v9;
    v6->_semantic = SICreateCVPixelBuffer((unint64_t)v8, (unint64_t)v9, 0x4C303038u, 1);
    v6->_confidence = SICreateCVPixelBuffer(v10, v11, 0x4C303066u, 1);
    v6->_uncertainty = SICreateCVPixelBuffer(v10, v11, 0x4C303066u, 1);
    v12 = v6;
  }

  return v6;
}

- (SISceneSegmentationData)initWithOutputResolution:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SISceneSegmentationData;
  v5 = [(SISceneSegmentationData *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_resolution.double width = width;
    v5->_resolution.double height = height;
    v5->_semantic = SICreateCVPixelBuffer((unint64_t)width, (unint64_t)height, 0x4C303038u, 1);
    v6->_confidence = SICreateCVPixelBuffer((unint64_t)width, (unint64_t)height, 0x4C303066u, 1);
    v6->_uncertainty = SICreateCVPixelBuffer((unint64_t)width, (unint64_t)height, 0x4C303066u, 1);
    v7 = v6;
  }

  return v6;
}

- (SISceneSegmentationData)initWithOutputSemanticBuffer:(__CVBuffer *)a3 confidenceBuffer:(__CVBuffer *)a4 uncertaintyBuffer:(__CVBuffer *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SISceneSegmentationData;
  double v8 = [(SISceneSegmentationData *)&v12 init];
  objc_super v9 = v8;
  if (v8)
  {
    v8->_resolution.double width = (double)CVPixelBufferGetWidth(v8->_semantic);
    v9->_resolution.double height = (double)CVPixelBufferGetHeight(v9->_semantic);
    v9->_semantic = CVPixelBufferRetain(a3);
    v9->_confidence = CVPixelBufferRetain(a4);
    v9->_uncertainty = CVPixelBufferRetain(a5);
    size_t v10 = v9;
  }

  return v9;
}

- (CGSize)_resolutionByConfig:(id)a3
{
  uint64_t v3 = [a3 networkModeEnum];
  double SupportedResolution = SISceneSegmentationGetSupportedResolution(v3);
  result.double height = v5;
  result.double width = SupportedResolution;
  return result;
}

- (BOOL)saveToDisk:(id)a3 identifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SISceneSegmentationData;
  if (objc_msgSend(-[SISceneSegmentationData class](&v23, sel_class), "ensureDirectoryExist:", v6))
  {
    double v8 = SICreateSemanticColorizedResult(self->_semantic);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v20 = __49__SISceneSegmentationData_saveToDisk_identifier___block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0l;
    v22 = v8;
    objc_super v9 = (void *)[[NSString alloc] initWithFormat:@"%@/color_semantic_%@.png", v6, v7];
    if (SISavePixelBufferPNG(v8, v9))
    {
      semantic = self->_semantic;
      size_t v11 = (void *)[[NSString alloc] initWithFormat:@"%@/semantic_%@.png", v6, v7];
      if (SISavePixelBufferPNG(semantic, v11))
      {
        confidence = self->_confidence;
        v13 = (void *)[[NSString alloc] initWithFormat:@"%@/semantic_confidence_%@.tiff", v6, v7];
        if (SISavePixelBufferTIFF((uint64_t)confidence, v13))
        {
          uncertainty = self->_uncertainty;
          v15 = (void *)[[NSString alloc] initWithFormat:@"%@/semantic_uncertainty_%@.tiff", v6, v7];
          BOOL v16 = SISavePixelBufferTIFF((uint64_t)uncertainty, v15);
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }

    v20((uint64_t)v19);
  }
  else
  {
    v17 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      v25 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneSegmentation/SISceneSegmentationDataType.m";
      __int16 v26 = 1025;
      int v27 = 85;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_21B697000, v17, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** %@ is not a directory, or failed to create a directory ***", buf, 0x1Cu);
    }

    BOOL v16 = 0;
  }

  return v16;
}

void __49__SISceneSegmentationData_saveToDisk_identifier___block_invoke(uint64_t a1)
{
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_semantic);
  CVPixelBufferRelease(self->_confidence);
  CVPixelBufferRelease(self->_uncertainty);
  v3.receiver = self;
  v3.super_class = (Class)SISceneSegmentationData;
  [(SISceneSegmentationData *)&v3 dealloc];
}

- (__CVBuffer)semantic
{
  return self->_semantic;
}

- (__CVBuffer)confidence
{
  return self->_confidence;
}

- (__CVBuffer)uncertainty
{
  return self->_uncertainty;
}

- (CGSize)resolution
{
  objc_copyStruct(v4, &self->_resolution, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

@end