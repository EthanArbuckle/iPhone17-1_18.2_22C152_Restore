@interface PICompositionExporterImageOptions
- (BOOL)applyImageOrientationAsMetadata;
- (BOOL)enableHDR;
- (BOOL)optimizeForBackgroundProcessing;
- (BOOL)optimizeForSharing;
- (NSArray)auxiliaryImageTypes;
- (NUImageExportFormat)imageExportFormat;
- (PICompositionExporterImageOptions)init;
- (double)JPEGCompressionQuality;
- (id)imageExportFormatForURL:(id)a3 isHDR:(BOOL)a4;
- (id)metadataProcessor;
- (void)setApplyImageOrientationAsMetadata:(BOOL)a3;
- (void)setAuxiliaryImageTypes:(id)a3;
- (void)setEnableHDR:(BOOL)a3;
- (void)setImageExportFormat:(id)a3;
- (void)setJPEGCompressionQuality:(double)a3;
- (void)setMetadataProcessor:(id)a3;
- (void)setOptimizeForBackgroundProcessing:(BOOL)a3;
- (void)setOptimizeForSharing:(BOOL)a3;
@end

@implementation PICompositionExporterImageOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImageTypes, 0);
  objc_storeStrong(&self->_metadataProcessor, 0);
  objc_storeStrong((id *)&self->_imageExportFormat, 0);
}

- (void)setAuxiliaryImageTypes:(id)a3
{
}

- (NSArray)auxiliaryImageTypes
{
  return self->_auxiliaryImageTypes;
}

- (void)setEnableHDR:(BOOL)a3
{
  self->_enableHDR = a3;
}

- (BOOL)enableHDR
{
  return self->_enableHDR;
}

- (void)setOptimizeForBackgroundProcessing:(BOOL)a3
{
  self->_optimizeForBackgroundProcessing = a3;
}

- (BOOL)optimizeForBackgroundProcessing
{
  return self->_optimizeForBackgroundProcessing;
}

- (void)setApplyImageOrientationAsMetadata:(BOOL)a3
{
  self->_applyImageOrientationAsMetadata = a3;
}

- (BOOL)applyImageOrientationAsMetadata
{
  return self->_applyImageOrientationAsMetadata;
}

- (void)setOptimizeForSharing:(BOOL)a3
{
  self->_optimizeForSharing = a3;
}

- (BOOL)optimizeForSharing
{
  return self->_optimizeForSharing;
}

- (void)setMetadataProcessor:(id)a3
{
}

- (id)metadataProcessor
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setJPEGCompressionQuality:(double)a3
{
  self->_JPEGCompressionQuality = a3;
}

- (double)JPEGCompressionQuality
{
  return self->_JPEGCompressionQuality;
}

- (void)setImageExportFormat:(id)a3
{
}

- (NUImageExportFormat)imageExportFormat
{
  return (NUImageExportFormat *)objc_getProperty(self, a2, 64, 1);
}

- (id)imageExportFormatForURL:(id)a3 isHDR:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  imageExportFormat = self->_imageExportFormat;
  if (imageExportFormat)
  {
    if (!v6)
    {
LABEL_24:
      v24 = imageExportFormat;
      goto LABEL_25;
    }
    v9 = (void *)MEMORY[0x1E4F442D8];
    v10 = [v6 pathExtension];
    v11 = [v9 typeWithFilenameExtension:v10];
    v12 = [v11 identifier];

    v13 = [(NUImageExportFormat *)self->_imageExportFormat fileType];
    if ([v12 isEqualToString:v13])
    {
LABEL_23:

      imageExportFormat = self->_imageExportFormat;
      goto LABEL_24;
    }
    v14 = (uint64_t *)MEMORY[0x1E4F7A750];
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_524);
    }
    v15 = (os_log_t *)MEMORY[0x1E4F7A748];
    v16 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_DEFAULT))
    {
      v17 = NSString;
      v18 = self->_imageExportFormat;
      v19 = v16;
      v20 = [v17 stringWithFormat:@"Export URL UTI (%@) does not match expected export format (%@)", v12, v18];
      *(_DWORD *)buf = 138543362;
      v41 = v20;
      _os_log_impl(&dword_1A9680000, v19, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v21 = *v14;
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v15 = (os_log_t *)MEMORY[0x1E4F7A748];
      if (specific)
      {
        if (v21 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_524);
        }
LABEL_17:
        os_log_t v26 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
        {
          v27 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
          v28 = (void *)MEMORY[0x1E4F29060];
          id v39 = v27;
          v29 = v26;
          v30 = [v28 callStackSymbols];
          v31 = [v30 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v41 = v27;
          __int16 v42 = 2114;
          v43 = v31;
          _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_33:
          goto LABEL_22;
        }
        goto LABEL_22;
      }
      if (v21 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_524);
      }
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_17;
    }
    os_log_t v32 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      v34 = (void *)MEMORY[0x1E4F29060];
      v29 = v32;
      v35 = [v34 callStackSymbols];
      v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v41 = v36;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_33;
    }
LABEL_22:
    v37 = v12;
    v38 = self->_imageExportFormat;
    _NUAssertContinueHandler();
    goto LABEL_23;
  }
  if (v6)
  {
    v23 = [MEMORY[0x1E4F7A4E0] defaultFormatForURL:v6];
  }
  else
  {
    v23 = (NUImageExportFormat *)objc_alloc_init(MEMORY[0x1E4F7A4F0]);
  }
  v24 = v23;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PICompositionExporterImageOptions *)self JPEGCompressionQuality];
    if (v25 != 0.0)
    {
      [(PICompositionExporterImageOptions *)self JPEGCompressionQuality];
      -[NUImageExportFormat setCompressionQuality:](v24, "setCompressionQuality:");
    }
  }
LABEL_25:
  if ([(PICompositionExporterImageOptions *)self enableHDR])
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(NUImageExportFormat *)v24 setBitDepth:10];
      }
    }
  }

  return v24;
}

- (PICompositionExporterImageOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)PICompositionExporterImageOptions;
  v2 = [(PICompositionExporterOptions *)&v6 init];
  v2->_JPEGCompressionQuality = 0.0;
  uint64_t v3 = [MEMORY[0x1E4F7A4F8] defaultAuxiliaryImageTypes];
  auxiliaryImageTypes = v2->_auxiliaryImageTypes;
  v2->_auxiliaryImageTypes = (NSArray *)v3;

  return v2;
}

@end