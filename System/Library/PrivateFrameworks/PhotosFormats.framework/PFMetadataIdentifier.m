@interface PFMetadataIdentifier
+ (NSString)quickTimeMetadataCaptureMode;
+ (NSString)quickTimeMetadataCinematicVideoCinematography;
+ (NSString)quickTimeMetadataCinematicVideoRendering;
+ (NSString)quickTimeMetadataContainsSpatialOverCaptureContent;
+ (NSString)quickTimeMetadataContentIdentifier;
+ (NSString)quickTimeMetadataKeyActionVideoStabilizationStrength;
+ (NSString)quickTimeMetadataKeyLocationISO6709;
+ (NSString)quickTimeMetadataLivePhotoMinimumClientVersion;
+ (NSString)quickTimeMetadataLivePhotoVitalityDisabled;
+ (NSString)quickTimeMetadataLivePhotoVitalityLimitingAllowed;
+ (NSString)quickTimeMetadataOriginatingSignature;
+ (NSString)quickTimeMetadataRenderOriginatingSignature;
+ (NSString)quickTimeMetadataSpatialOverCaptureGroupIdentifier;
+ (NSString)quickTimeMetadataStillImageTime;
+ (NSString)quickTimeMetadataVariationIdentifier;
+ (NSString)quickTimeMetadataVitalityTransitionScore;
+ (NSString)quickTimeUserDataVideoLoopingType;
+ (NSString)quicktimeMetadataCameraFocalLength35mmEquivalent;
+ (NSString)quicktimeMetadataCameraLensModel;
+ (NSString)quicktimeMetadataFullFrameRatePlaybackIntent;
+ (NSString)quicktimeMetadataSmartStyleCast;
+ (NSString)quicktimeMetadataSpatialAggressorsSeen;
+ (NSString)quicktimeMetadataSpatialFormatVersion;
+ (NSString)quicktimeMetadataSpatialVideoRecommendedForImmersiveMode;
@end

@implementation PFMetadataIdentifier

+ (NSString)quicktimeMetadataSmartStyleCast
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.quicktime.smartstyle.cast" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quicktimeMetadataSpatialFormatVersion
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.quicktime.spatial.format-version" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quicktimeMetadataSpatialAggressorsSeen
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.quicktime.spatial.aggressors-seen" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quicktimeMetadataFullFrameRatePlaybackIntent
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15E78] keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quicktimeMetadataSpatialVideoRecommendedForImmersiveMode
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.quicktime.spatial.low-motion" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quicktimeMetadataCameraFocalLength35mmEquivalent
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.quicktime.camera.focal_length.35mm_equivalent" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quicktimeMetadataCameraLensModel
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.quicktime.camera.lens_model" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataCinematicVideoCinematography
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.quicktime.cinematic-video.cinematography" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataCinematicVideoRendering
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.quicktime.cinematic-video.rendering" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataLivePhotoVitalityLimitingAllowed
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.quicktime.limit-still-image-transform" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataLivePhotoVitalityDisabled
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15E98] keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataVitalityTransitionScore
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.quicktime.live-photo.transition-vitality-score.v1" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataKeyActionVideoStabilizationStrength
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.quicktime.action-video.stabilization-strength" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataKeyLocationISO6709
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15EA0] keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataStillImageTime
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F218A0] keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeUserDataVideoLoopingType
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"LOOP" keySpace:*MEMORY[0x1E4F15E00]];
}

+ (NSString)quickTimeMetadataCaptureMode
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.photos.captureMode" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataLivePhotoMinimumClientVersion
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.photos.live-photo.minimum-client-version" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataVariationIdentifier
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.photos.variation-identifier" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataContainsSpatialOverCaptureContent
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15E58] keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataSpatialOverCaptureGroupIdentifier
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15EB8] keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataContentIdentifier
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15E60] keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataRenderOriginatingSignature
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.photos.render.originating.signature" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (NSString)quickTimeMetadataOriginatingSignature
{
  return (NSString *)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.photos.originating.signature" keySpace:*MEMORY[0x1E4F15DF8]];
}

@end