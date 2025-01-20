@interface PFCameraAdjustments
+ (BOOL)supportsSecureCoding;
- (AVApplePortraitMetadata)portraitMetadata;
- (BOOL)canBeRenderedByCapturePipelineWithVideoComplement:(BOOL)a3 deferredIdentifier:(id)a4;
- (BOOL)hasCrop;
- (BOOL)isDepthEnabled;
- (BOOL)isEligibleForCinematicAudioEffectProcessing;
- (BOOL)isSloMoEnabled;
- (CGRect)cropRect;
- (NSString)effectFilterName;
- (NSString)portraitEffectFilterName;
- (PFCameraAdjustments)initWithAdjustments:(id)a3;
- (PFCameraAdjustments)initWithCoder:(id)a3;
- (PFCameraAdjustments)initWithEffectFilter:(id)a3 cropRect:(CGRect)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)cinematicVideoRenderingVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PFCameraAdjustments

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portraitMetadata, 0);
  objc_storeStrong((id *)&self->_portraitEffectFilterName, 0);

  objc_storeStrong((id *)&self->_effectFilterName, 0);
}

- (BOOL)isSloMoEnabled
{
  return self->_sloMoEnabled;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)cinematicVideoRenderingVersion
{
  return self->_cinematicVideoRenderingVersion;
}

- (BOOL)isEligibleForCinematicAudioEffectProcessing
{
  return self->_isEligibleForCinematicAudioEffectProcessing;
}

- (BOOL)isDepthEnabled
{
  return self->_depthEnabled;
}

- (AVApplePortraitMetadata)portraitMetadata
{
  return self->_portraitMetadata;
}

- (NSString)portraitEffectFilterName
{
  return self->_portraitEffectFilterName;
}

- (NSString)effectFilterName
{
  return self->_effectFilterName;
}

- (BOOL)canBeRenderedByCapturePipelineWithVideoComplement:(BOOL)a3 deferredIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    if (!v4)
    {
      BOOL depthEnabled = self->_depthEnabled;
      goto LABEL_8;
    }
    if (self->_depthEnabled && ![(PFCameraAdjustments *)self hasCrop])
    {
      v8 = [(PFCameraAdjustments *)self effectFilterName];
      BOOL depthEnabled = v8 == 0;

      goto LABEL_8;
    }
  }
  BOOL depthEnabled = 0;
LABEL_8:

  return depthEnabled;
}

- (BOOL)hasCrop
{
  [(PFCameraAdjustments *)self cropRect];

  return PFCameraAdjustmentsCropIsValid(v2, v3, v4, v5);
}

- (PFCameraAdjustments)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PFCameraAdjustments;
  CGFloat v5 = [(PFCameraAdjustments *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"effectFilterName"];
    effectFilterName = v5->_effectFilterName;
    v5->_effectFilterName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"portraitEffectFilterName"];
    portraitEffectFilterName = v5->_portraitEffectFilterName;
    v5->_portraitEffectFilterName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"portraitMetadata"];
    portraitMetadata = v5->_portraitMetadata;
    v5->_portraitMetadata = (AVApplePortraitMetadata *)v10;

    v5->_BOOL depthEnabled = [v4 decodeBoolForKey:@"depthEnabled"];
    v5->_isEligibleForCinematicAudioEffectProcessing = [v4 decodeBoolForKey:@"isEligibleForCinematicAudioEffectProcessing"];
    v5->_cinematicVideoRenderingVersion = [v4 decodeIntegerForKey:@"cinematicVideoRenderingVersion"];
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cropRect"];
    [v12 getValue:&v5->_cropRect size:32];
    if (!PFCameraAdjustmentsCropIsValid(v5->_cropRect.origin.x, v5->_cropRect.origin.y, v5->_cropRect.size.width, v5->_cropRect.size.height))
    {
      v5->_cropRect.origin = 0u;
      v5->_cropRect.size = 0u;
    }
    v5->_sloMoEnabled = [v4 decodeBoolForKey:@"sloMoEnabled"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(PFCameraAdjustments *)self effectFilterName];
  [v4 encodeObject:v5 forKey:@"effectFilterName"];

  uint64_t v6 = [(PFCameraAdjustments *)self portraitEffectFilterName];
  [v4 encodeObject:v6 forKey:@"portraitEffectFilterName"];

  v7 = [(PFCameraAdjustments *)self portraitMetadata];
  [v4 encodeObject:v7 forKey:@"portraitMetadata"];

  objc_msgSend(v4, "encodeBool:forKey:", -[PFCameraAdjustments isDepthEnabled](self, "isDepthEnabled"), @"depthEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[PFCameraAdjustments isEligibleForCinematicAudioEffectProcessing](self, "isEligibleForCinematicAudioEffectProcessing"), @"isEligibleForCinematicAudioEffectProcessing");
  objc_msgSend(v4, "encodeInteger:forKey:", -[PFCameraAdjustments cinematicVideoRenderingVersion](self, "cinematicVideoRenderingVersion"), @"cinematicVideoRenderingVersion");
  [MEMORY[0x1E4F29238] valueWithBytes:&self->_cropRect objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"cropRect"];
  objc_msgSend(v4, "encodeBool:forKey:", -[PFCameraAdjustments isSloMoEnabled](self, "isSloMoEnabled"), @"sloMoEnabled");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [PFMutableCameraAdjustments alloc];

  return [(PFCameraAdjustments *)v4 initWithAdjustments:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PFCameraAdjustments)initWithEffectFilter:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PFCameraAdjustments;
  v11 = [(PFCameraAdjustments *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_effectFilterName, a3);
    v12->_cropRect.origin.CGFloat x = x;
    v12->_cropRect.origin.CGFloat y = y;
    v12->_cropRect.size.CGFloat width = width;
    v12->_cropRect.size.CGFloat height = height;
  }

  return v12;
}

- (PFCameraAdjustments)initWithAdjustments:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PFCameraAdjustments;
  CGFloat v5 = [(PFCameraAdjustments *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 effectFilterName];
    effectFilterName = v5->_effectFilterName;
    v5->_effectFilterName = (NSString *)v6;

    uint64_t v8 = [v4 portraitEffectFilterName];
    portraitEffectFilterName = v5->_portraitEffectFilterName;
    v5->_portraitEffectFilterName = (NSString *)v8;

    uint64_t v10 = [v4 portraitMetadata];
    portraitMetadata = v5->_portraitMetadata;
    v5->_portraitMetadata = (AVApplePortraitMetadata *)v10;

    v5->_BOOL depthEnabled = [v4 isDepthEnabled];
    v5->_isEligibleForCinematicAudioEffectProcessing = [v4 isEligibleForCinematicAudioEffectProcessing];
    v5->_cinematicVideoRenderingVersion = [v4 cinematicVideoRenderingVersion];
    [v4 cropRect];
    v5->_cropRect.origin.CGFloat x = v12;
    v5->_cropRect.origin.CGFloat y = v13;
    v5->_cropRect.size.CGFloat width = v14;
    v5->_cropRect.size.CGFloat height = v15;
    v5->_sloMoEnabled = [v4 isSloMoEnabled];
  }

  return v5;
}

@end