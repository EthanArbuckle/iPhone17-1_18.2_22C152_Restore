@interface PICompositionExporterVideoOptions
- (BOOL)applyVideoOrientationAsMetadata;
- (BOOL)bypassOutputSettingsIfNoComposition;
- (BOOL)computeDigest;
- (BOOL)includeCinematicVideoTracks;
- (BOOL)preserveSourceColorSpace;
- (BOOL)requireHardwareEncoder;
- (NSString)videoCodecType;
- (PICompositionExporterVideoOptions)init;
- (id)description;
- (id)metadataProcessor;
- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3;
- (void)setBypassOutputSettingsIfNoComposition:(BOOL)a3;
- (void)setComputeDigest:(BOOL)a3;
- (void)setIncludeCinematicVideoTracks:(BOOL)a3;
- (void)setMetadataProcessor:(id)a3;
- (void)setPreserveSourceColorSpace:(BOOL)a3;
- (void)setRequireHardwareEncoder:(BOOL)a3;
- (void)setVideoCodecType:(id)a3;
@end

@implementation PICompositionExporterVideoOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoCodecType, 0);
  objc_storeStrong(&self->_metadataProcessor, 0);
}

- (void)setComputeDigest:(BOOL)a3
{
  self->_computeDigest = a3;
}

- (BOOL)computeDigest
{
  return self->_computeDigest;
}

- (void)setIncludeCinematicVideoTracks:(BOOL)a3
{
  self->_includeCinematicVideoTracks = a3;
}

- (BOOL)includeCinematicVideoTracks
{
  return self->_includeCinematicVideoTracks;
}

- (void)setRequireHardwareEncoder:(BOOL)a3
{
  self->_requireHardwareEncoder = a3;
}

- (BOOL)requireHardwareEncoder
{
  return self->_requireHardwareEncoder;
}

- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3
{
  self->_applyVideoOrientationAsMetadata = a3;
}

- (BOOL)applyVideoOrientationAsMetadata
{
  return self->_applyVideoOrientationAsMetadata;
}

- (void)setBypassOutputSettingsIfNoComposition:(BOOL)a3
{
  self->_bypassOutputSettingsIfNoComposition = a3;
}

- (BOOL)bypassOutputSettingsIfNoComposition
{
  return self->_bypassOutputSettingsIfNoComposition;
}

- (void)setPreserveSourceColorSpace:(BOOL)a3
{
  self->_preserveSourceColorSpace = a3;
}

- (BOOL)preserveSourceColorSpace
{
  return self->_preserveSourceColorSpace;
}

- (void)setVideoCodecType:(id)a3
{
}

- (NSString)videoCodecType
{
  return self->_videoCodecType;
}

- (void)setMetadataProcessor:(id)a3
{
}

- (id)metadataProcessor
{
  return objc_getProperty(self, a2, 64, 1);
}

- (id)description
{
  v13 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = [(PICompositionExporterOptions *)self priority];
  v5 = [(PICompositionExporterOptions *)self colorSpace];
  v6 = [(PICompositionExporterOptions *)self scalePolicy];
  v7 = [(PICompositionExporterVideoOptions *)self videoCodecType];
  if ([(PICompositionExporterVideoOptions *)self bypassOutputSettingsIfNoComposition])
  {
    v8 = @"YES";
  }
  else
  {
    v8 = @"NO";
  }
  if ([(PICompositionExporterVideoOptions *)self applyVideoOrientationAsMetadata]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if ([(PICompositionExporterVideoOptions *)self requireHardwareEncoder]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v11 = [v13 stringWithFormat:@"<%@:%p - priority: %@, color space: %@, scale policy: %@, video codec type: %@, bypass settings: %@, orientation as metadata: %@, hardware encoder: %@>", v3, self, v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (PICompositionExporterVideoOptions)init
{
  v4.receiver = self;
  v4.super_class = (Class)PICompositionExporterVideoOptions;
  v2 = [(PICompositionExporterOptions *)&v4 init];
  [(PICompositionExporterOptions *)v2 setColorSpace:0];
  return v2;
}

@end