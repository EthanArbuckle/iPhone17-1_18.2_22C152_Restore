@interface PFVideoMetadataVideoTrackFormatInfo
+ (BOOL)videoTrackFormatDescriptionHasDolby8_4Metadata:(opaqueCMFormatDescription *)a3;
+ (id)infoForFirstVideoTrackOfAsset:(id)a3;
+ (signed)_getProfile:(char *)a3 tier:(char *)a4 level:(char *)a5 fromFormatDescriptionExtensions:(id)a6;
- (BOOL)hasDolby8_4Metadata;
- (BOOL)hasHEVCProfileTierLevelInfo;
- (BOOL)isHDR10;
- (BOOL)isHighDynamicRange;
- (BOOL)isProResLOG;
- (BOOL)isSpatial;
- (CGSize)displaySize;
- (NSString)colorPrimaries;
- (NSString)formatDebugDescription;
- (NSString)transferFunction;
- (PFVideoMetadataVideoTrackFormatInfo)initWithFirstVideoTrackOfAsset:(id)a3;
- (id)hevcProfileTierLevelDescription;
- (int64_t)bitsPerComponent;
- (unsigned)codec;
- (unsigned)hevcLevel;
- (unsigned)hevcProfile;
- (unsigned)hevcTier;
- (void)_checkFormat;
@end

@implementation PFVideoMetadataVideoTrackFormatInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferFunction, 0);
  objc_storeStrong((id *)&self->_colorPrimaries, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

- (CGSize)displaySize
{
  objc_copyStruct(v4, &self->_displaySize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)transferFunction
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)colorPrimaries
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (unsigned)hevcLevel
{
  return self->_hevcLevel;
}

- (unsigned)hevcTier
{
  return self->_hevcTier;
}

- (unsigned)hevcProfile
{
  return self->_hevcProfile;
}

- (BOOL)hasHEVCProfileTierLevelInfo
{
  return self->_hasHEVCProfileTierLevelInfo;
}

- (BOOL)isSpatial
{
  return self->_isSpatial;
}

- (BOOL)hasDolby8_4Metadata
{
  return self->_hasDolby8_4Metadata;
}

- (BOOL)isProResLOG
{
  return self->_isProResLOG;
}

- (BOOL)isHDR10
{
  return self->_isHDR10;
}

- (BOOL)isHighDynamicRange
{
  return self->_isHighDynamicRange;
}

- (unsigned)codec
{
  return self->_codec;
}

- (id)hevcProfileTierLevelDescription
{
  if (self->_hasHEVCProfileTierLevelInfo)
  {
    LOBYTE(v2) = self->_hevcLevel;
    objc_msgSend(NSString, "stringWithFormat:", @" %d/%d/%1.1f", self->_hevcProfile, self->_hevcTier, (double)v2 / 30.0);
    double v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v3 = @" (profile/tier/level unavailable)";
  }

  return v3;
}

- (NSString)formatDebugDescription
{
  int64_t v3 = [(PFVideoMetadataVideoTrackFormatInfo *)self bitsPerComponent];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%tdbit ", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1EF7AE1F8;
  }
  BOOL v5 = +[PFMediaCapabilities currentDeviceIsEligibleForHDRPlayback];
  if (self->_isHighDynamicRange) {
    v6 = @"HDR";
  }
  else {
    v6 = @"SDR";
  }
  v7 = NSString;
  uint64_t codec = self->_codec;
  v9 = v6;
  v10 = +[PFMediaUtilities stringFromFourCharCode:codec];
  uint64_t v11 = [(PFVideoMetadataVideoTrackFormatInfo *)self hevcProfileTierLevelDescription];
  v12 = (void *)v11;
  v13 = @"yes";
  if (self->_hasDolby8_4Metadata) {
    v14 = @"yes";
  }
  else {
    v14 = @"no";
  }
  if (!v5) {
    v13 = @"no";
  }
  v15 = [v7 stringWithFormat:@"%@ %@%@%@ size=%dx%d transfer=%@ color=%@ dv84=%@ (current device eligible for HDR: %@)", v10, v4, v9, v11, (int)self->_displaySize.width, (int)self->_displaySize.height, self->_transferFunction, self->_colorPrimaries, v14, v13];

  return (NSString *)v15;
}

- (void)_checkFormat
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int64_t v3 = +[PFMediaUtilities tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:self->_asset];
  v4 = [v3 firstObject];

  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    asset = self->_asset;
    *(_DWORD *)buf = 138412290;
    v27 = asset;
    v22 = MEMORY[0x1E4F14500];
    v23 = "Unable to query video format information for asset without video tracks: %@";
LABEL_12:
    _os_log_error_impl(&dword_1A41FE000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);
    goto LABEL_15;
  }
  BOOL v5 = [v4 formatDescriptions];
  v6 = [v5 firstObject];

  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v24 = self->_asset;
    *(_DWORD *)buf = 138412290;
    v27 = v24;
    v22 = MEMORY[0x1E4F14500];
    v23 = "Unable to query video format information for asset without first video track format description: %@";
    goto LABEL_12;
  }
  self->_uint64_t codec = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v6);
  self->_isHighDynamicRange = +[PFVideoMetadata videoTrackFormatDescriptionIsHighDynamicRange:v6];
  self->_isHDR10 = +[PFVideoMetadata videoTrackFormatDescriptionIsHDR10:v6];
  self->_isProResLOG = +[PFVideoMetadata videoTrackFormatDescriptionIsProResLOG:v6];
  self->_hasDolby8_4Metadata = objc_msgSend((id)objc_opt_class(), "videoTrackFormatDescriptionHasDolby8_4Metadata:", v6);
  self->_isSpatial = +[PFVideoMetadata videoTrackIsSpatial:v4];
  [v4 naturalSize];
  CGFloat v8 = v7;
  [v4 naturalSize];
  CGFloat v10 = v9;
  [v4 preferredTransform];
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = v8;
  v31.size.height = v10;
  CGRect v32 = CGRectApplyAffineTransform(v31, &v25);
  self->_displaySize.width = v32.size.width;
  self->_displaySize.height = v32.size.height;
  uint64_t v11 = CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v6);
  v12 = v11;
  if (v11)
  {
    v13 = [v11 objectForKeyedSubscript:@"BitsPerComponent"];
    self->_bitsPerComponent = [v13 integerValue];

    v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F24A90]];
    colorPrimaries = self->_colorPrimaries;
    self->_colorPrimaries = v14;

    v16 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F24BC8]];
    transferFunction = self->_transferFunction;
    self->_transferFunction = v16;

    if (self->_codec == 1752589105)
    {
      int v18 = [(id)objc_opt_class() _getProfile:&self->_hevcProfile tier:&self->_hevcTier level:&self->_hevcLevel fromFormatDescriptionExtensions:v12];
      if (v18)
      {
        int v19 = v18;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          v20 = self->_asset;
          *(_DWORD *)buf = 138412546;
          v27 = v20;
          __int16 v28 = 1024;
          int v29 = v19;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to get profile/tier/level for %@: %d", buf, 0x12u);
        }
      }
      else
      {
        self->_hasHEVCProfileTierLevelInfo = 1;
      }
    }
  }

LABEL_15:
}

- (PFVideoMetadataVideoTrackFormatInfo)initWithFirstVideoTrackOfAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFVideoMetadataVideoTrackFormatInfo;
  v6 = [(PFVideoMetadataVideoTrackFormatInfo *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    [(PFVideoMetadataVideoTrackFormatInfo *)v7 _checkFormat];
  }

  return v7;
}

+ (BOOL)videoTrackFormatDescriptionHasDolby8_4Metadata:(opaqueCMFormatDescription *)a3
{
  int64_t v3 = CMFormatDescriptionGetExtensions(a3);
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F24BC8]];
    if ([v5 isEqualToString:*MEMORY[0x1E4F1EEF8]]
      && ([v4 objectForKeyedSubscript:*MEMORY[0x1E4F1EE20]],
          (v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      double v7 = v6;
      CGFloat v8 = [v6 objectForKeyedSubscript:@"dvvC"];
      BOOL v9 = v8 != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (signed)_getProfile:(char *)a3 tier:(char *)a4 level:(char *)a5 fromFormatDescriptionExtensions:(id)a6
{
  v6 = [a6 objectForKeyedSubscript:*MEMORY[0x1E4F1EE20]];
  double v7 = [v6 objectForKeyedSubscript:@"hvcC"];

  if (v7)
  {
    int HEVCParameterSetAtIndex = FigHEVCBridge_GetHEVCParameterSetAtIndex();
    signed __int16 SPSProfileTierLevel = HEVCParameterSetAtIndex;
    if (!HEVCParameterSetAtIndex) {
      signed __int16 SPSProfileTierLevel = FigHEVCBridge_GetSPSProfileTierLevel();
    }
  }
  else
  {
    signed __int16 SPSProfileTierLevel = 0;
  }

  return SPSProfileTierLevel;
}

+ (id)infoForFirstVideoTrackOfAsset:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithFirstVideoTrackOfAsset:v4];

  return v5;
}

@end