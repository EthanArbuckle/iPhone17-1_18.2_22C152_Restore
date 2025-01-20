@interface PICompositionExporterAuxiliaryOptions
- (BOOL)applyImageOrientationAsMetadata;
- (BOOL)applyVideoOrientationAsMetadata;
- (BOOL)optimizeForBackgroundProcessing;
- (NSArray)auxiliaryImageTypes;
- (NSString)videoCodecType;
- (NSURL)primaryURL;
- (NSURL)videoComplementURL;
- (NSURL)videoPosterFrameURL;
- (NUImageExportFormat)imageExportFormat;
- (PICompositionExporterAuxiliaryOptions)init;
- (void)setApplyImageOrientationAsMetadata:(BOOL)a3;
- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3;
- (void)setAuxiliaryImageTypes:(id)a3;
- (void)setImageExportFormat:(id)a3;
- (void)setOptimizeForBackgroundProcessing:(BOOL)a3;
- (void)setPrimaryURL:(id)a3;
- (void)setVideoCodecType:(id)a3;
- (void)setVideoComplementURL:(id)a3;
- (void)setVideoPosterFrameURL:(id)a3;
@end

@implementation PICompositionExporterAuxiliaryOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImageTypes, 0);
  objc_storeStrong((id *)&self->_imageExportFormat, 0);
  objc_storeStrong((id *)&self->_videoCodecType, 0);
  objc_storeStrong((id *)&self->_videoPosterFrameURL, 0);
  objc_storeStrong((id *)&self->_videoComplementURL, 0);
  objc_storeStrong((id *)&self->_primaryURL, 0);
}

- (void)setAuxiliaryImageTypes:(id)a3
{
}

- (NSArray)auxiliaryImageTypes
{
  return self->_auxiliaryImageTypes;
}

- (void)setOptimizeForBackgroundProcessing:(BOOL)a3
{
  self->_optimizeForBackgroundProcessing = a3;
}

- (BOOL)optimizeForBackgroundProcessing
{
  return self->_optimizeForBackgroundProcessing;
}

- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3
{
  self->_applyVideoOrientationAsMetadata = a3;
}

- (BOOL)applyVideoOrientationAsMetadata
{
  return self->_applyVideoOrientationAsMetadata;
}

- (void)setApplyImageOrientationAsMetadata:(BOOL)a3
{
  self->_applyImageOrientationAsMetadata = a3;
}

- (BOOL)applyImageOrientationAsMetadata
{
  return self->_applyImageOrientationAsMetadata;
}

- (void)setImageExportFormat:(id)a3
{
}

- (NUImageExportFormat)imageExportFormat
{
  return (NUImageExportFormat *)objc_getProperty(self, a2, 96, 1);
}

- (void)setVideoCodecType:(id)a3
{
}

- (NSString)videoCodecType
{
  return self->_videoCodecType;
}

- (void)setVideoPosterFrameURL:(id)a3
{
}

- (NSURL)videoPosterFrameURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (void)setVideoComplementURL:(id)a3
{
}

- (NSURL)videoComplementURL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPrimaryURL:(id)a3
{
}

- (NSURL)primaryURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (PICompositionExporterAuxiliaryOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)PICompositionExporterAuxiliaryOptions;
  v2 = [(PICompositionExporterOptions *)&v6 init];
  uint64_t v3 = [MEMORY[0x1E4F7A4F8] defaultAuxiliaryImageTypes];
  auxiliaryImageTypes = v2->_auxiliaryImageTypes;
  v2->_auxiliaryImageTypes = (NSArray *)v3;

  return v2;
}

@end