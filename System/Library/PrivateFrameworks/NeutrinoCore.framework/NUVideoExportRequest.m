@interface NUVideoExportRequest
- (BOOL)applyOrientationAsMetadata;
- (BOOL)bypassOutputSettingsIfNoComposition;
- (BOOL)computeDigest;
- (BOOL)includeCinematicVideoTracks;
- (BOOL)includeSemanticStyleTracks;
- (BOOL)requireHardwareEncoder;
- (NSArray)metadata;
- (NSDictionary)outputSettings;
- (NSProgress)progress;
- (NUColorSpace)colorSpace;
- (NUVideoExportRequest)initWithComposition:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (void)setApplyOrientationAsMetadata:(BOOL)a3;
- (void)setBypassOutputSettingsIfNoComposition:(BOOL)a3;
- (void)setColorSpace:(id)a3;
- (void)setComputeDigest:(BOOL)a3;
- (void)setIncludeCinematicVideoTracks:(BOOL)a3;
- (void)setIncludeSemanticStyleTracks:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setOutputSettings:(id)a3;
- (void)setProgress:(id)a3;
- (void)setRequireHardwareEncoder:(BOOL)a3;
- (void)submitWithProgress:(id)a3 completion:(id)a4;
@end

@implementation NUVideoExportRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);

  objc_storeStrong((id *)&self->_outputSettings, 0);
}

- (void)setComputeDigest:(BOOL)a3
{
  self->_computeDigest = a3;
}

- (BOOL)computeDigest
{
  return self->_computeDigest;
}

- (void)setIncludeSemanticStyleTracks:(BOOL)a3
{
  self->_includeSemanticStyleTracks = a3;
}

- (BOOL)includeSemanticStyleTracks
{
  return self->_includeSemanticStyleTracks;
}

- (void)setIncludeCinematicVideoTracks:(BOOL)a3
{
  self->_includeCinematicVideoTracks = a3;
}

- (BOOL)includeCinematicVideoTracks
{
  return self->_includeCinematicVideoTracks;
}

- (void)setApplyOrientationAsMetadata:(BOOL)a3
{
  self->_applyOrientationAsMetadata = a3;
}

- (BOOL)applyOrientationAsMetadata
{
  return self->_applyOrientationAsMetadata;
}

- (void)setRequireHardwareEncoder:(BOOL)a3
{
  self->_requireHardwareEncoder = a3;
}

- (BOOL)requireHardwareEncoder
{
  return self->_requireHardwareEncoder;
}

- (void)setBypassOutputSettingsIfNoComposition:(BOOL)a3
{
  self->_bypassOutputSettingsIfNoComposition = a3;
}

- (BOOL)bypassOutputSettingsIfNoComposition
{
  return self->_bypassOutputSettingsIfNoComposition;
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 200, 1);
}

- (void)setMetadata:(id)a3
{
}

- (NSArray)metadata
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setOutputSettings:(id)a3
{
}

- (NSDictionary)outputSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)submitWithProgress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__NUVideoExportRequest_submitWithProgress_completion___block_invoke;
  v8[3] = &unk_1E5D94570;
  id v9 = v6;
  id v7 = v6;
  [(NURenderRequest *)self submitGenericConfiguringRequest:v8 completion:a4];
}

uint64_t __54__NUVideoExportRequest_submitWithProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setProgress:*(void *)(a1 + 32)];
}

- (int64_t)mediaComponentType
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUVideoExportRequest;
  v4 = [(NUExportRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 22, self->_outputSettings);
    objc_storeStrong(v5 + 23, self->_colorSpace);
    objc_storeStrong(v5 + 24, self->_metadata);
    *((unsigned char *)v5 + 168) = self->_bypassOutputSettingsIfNoComposition;
    *((unsigned char *)v5 + 170) = self->_applyOrientationAsMetadata;
    *((unsigned char *)v5 + 171) = self->_includeCinematicVideoTracks;
    *((unsigned char *)v5 + 172) = self->_includeSemanticStyleTracks;
    *((unsigned char *)v5 + 173) = self->_computeDigest;
  }
  return v5;
}

- (id)newRenderJob
{
  v3 = [NUVideoExportJob alloc];

  return [(NUVideoExportJob *)v3 initWithVideoExportRequest:self];
}

- (NUVideoExportRequest)initWithComposition:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NUVideoExportRequest;
  id v3 = a3;
  v4 = [(NUExportRequest *)&v9 initWithComposition:v3];
  outputSettings = v4->_outputSettings;
  v4->_outputSettings = (NSDictionary *)MEMORY[0x1E4F1CC08];

  uint64_t v6 = +[NUVideoUtilities defaultOutputColorSpaceForComposition:](NUVideoUtilities, "defaultOutputColorSpaceForComposition:", v3, v9.receiver, v9.super_class);

  colorSpace = v4->_colorSpace;
  v4->_colorSpace = (NUColorSpace *)v6;

  v4->_applyOrientationAsMetadata = 1;
  return v4;
}

@end