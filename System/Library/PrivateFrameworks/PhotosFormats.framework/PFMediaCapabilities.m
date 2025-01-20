@interface PFMediaCapabilities
+ (BOOL)currentDeviceIsEligibleForHDRPlayback;
+ (BOOL)setNewFormatsConfiguration:(int64_t)a3 fromSource:(int64_t)a4;
+ (BOOL)videoCodecIsEligibleForBackwardsCompatibilityTranscoding:(unsigned int)a3;
+ (BOOL)videoCodecIsProResEligibleForBackwardsCompatibilityTranscoding:(unsigned int)a3;
+ (id)capabilitiesForCurrentDevice;
+ (id)capabilitiesForCurrentDeviceWithOptions:(id)a3;
+ (id)capabilitiesInformationForCurrentDeviceWithOptions:(id)a3;
+ (id)legacyCapabilities;
+ (id)proResVideoCodecTypesEligibleForBackwardsCompatibilityTranscoding;
+ (id)recordSlomoConfigurationWithValidValues:(id)a3;
+ (id)recordVideoConfigurationWithValidValues:(id)a3;
+ (id)stringForSupport:(int64_t)a3;
+ (id)testCapabilitiesNotSupportingHEIF;
+ (id)testCapabilitiesNotSupportingHEVC;
+ (id)videoCodecTypesEligibleForBackwardsCompatibilityTranscoding;
+ (int64_t)newFormatsConfiguration;
+ (unsigned)currentDeviceHEVCCapabilities;
+ (void)setRecordSlomoConfiguration:(id)a3;
+ (void)setRecordVideoConfiguration:(id)a3;
- (BOOL)sortSourceEnumerationAscending;
- (BOOL)supportsHDR;
- (BOOL)supportsTranscodeChoice;
- (NSDictionary)capabilitiesInformation;
- (NSDictionary)outOfBandHints;
- (PFMediaCapabilities)initWithOpaqueRepresentation:(id)a3;
- (PFMediaCapabilities)initWithPlatformInformation:(id)a3;
- (id)description;
- (id)opaqueRepresentation;
- (id)platformInformation;
- (int64_t)decodingSupportForAVAsset:(id)a3;
- (int64_t)decodingSupportForFormatDescription:(opaqueCMFormatDescription *)a3;
- (int64_t)supportForAdjustmentBaseResources;
- (int64_t)supportForAssetBundleVersion:(id)a3;
- (int64_t)supportForCodec:(unsigned int)a3;
- (int64_t)supportForContainerTypeIdentifier:(id)a3;
- (int64_t)supportForLivePhotoVersion:(id)a3;
- (int64_t)supportValueByApplyingUserDefaultsPeerAssetBundleSupportOverrideToValue:(int64_t)a3 selector:(SEL)a4;
- (int64_t)supportValueByApplyingUserDefaultsPeerOverrideToValue:(int64_t)a3 selector:(SEL)a4;
- (int64_t)userDefaultsPeerAssetBundleSupportOverrideValue;
- (int64_t)userDefaultsPeerOverrideValue;
- (void)setCapabilitiesInformation:(id)a3;
- (void)setOutOfBandHints:(id)a3;
- (void)setSupportForAdjustmentBaseResources:(BOOL)a3;
- (void)setSupportsTranscodeChoice:(BOOL)a3;
@end

@implementation PFMediaCapabilities

+ (int64_t)newFormatsConfiguration
{
  Boolean keyExistsAndHasValidFormat = 0;
  int64_t result = CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceCaptureEncodingBehavior", @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilitiesInformation, 0);

  objc_storeStrong((id *)&self->_outOfBandHints, 0);
}

- (void)setCapabilitiesInformation:(id)a3
{
}

- (NSDictionary)capabilitiesInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOutOfBandHints:(id)a3
{
}

- (NSDictionary)outOfBandHints
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"<%p: %@ capabilities info: %@>", self, objc_opt_class(), self->_capabilitiesInformation];

  return v3;
}

- (int64_t)userDefaultsPeerAssetBundleSupportOverrideValue
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"PFMediaCapabilitiesPeerAssetBundleSupportOverride"];

  if (!v3) {
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      v9 = @"PFMediaCapabilitiesPeerAssetBundleSupportOverride";
      __int16 v10 = 2112;
      v11 = v3;
      v5 = MEMORY[0x1E4F14500];
      v6 = "Ignoring value for user default %@ that is not an integer: %@";
      goto LABEL_10;
    }
LABEL_7:
    int64_t v4 = 0;
    goto LABEL_8;
  }
  int64_t v4 = [v3 integerValue];
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFBLL)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      v9 = @"PFMediaCapabilitiesPeerAssetBundleSupportOverride";
      __int16 v10 = 2112;
      v11 = v3;
      v5 = MEMORY[0x1E4F14500];
      v6 = "Ignoring value for user default %@ that is out of range: %@";
LABEL_10:
      _os_log_error_impl(&dword_1A41FE000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v8, 0x16u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

- (int64_t)supportValueByApplyingUserDefaultsPeerAssetBundleSupportOverrideToValue:(int64_t)a3 selector:(SEL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int64_t v6 = [(PFMediaCapabilities *)self userDefaultsPeerAssetBundleSupportOverrideValue];
  if (!v6) {
    return a3;
  }
  int64_t v7 = v6;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a4);
    v9 = [(id)objc_opt_class() stringForSupport:a3];
    __int16 v10 = [(id)objc_opt_class() stringForSupport:v7];
    int v12 = 138413058;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = v9;
    __int16 v16 = 2112;
    v17 = v10;
    __int16 v18 = 2112;
    v19 = @"PFMediaCapabilitiesPeerAssetBundleSupportOverride";
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Overriding peer asset bundle capabilities result of %@ from %@ to %@ because %@ user default is set", (uint8_t *)&v12, 0x2Au);
  }
  return v7;
}

- (int64_t)userDefaultsPeerOverrideValue
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"PFMediaCapabilitiesPeerSupportOverride"];

  if (!v3) {
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      v9 = @"PFMediaCapabilitiesPeerSupportOverride";
      __int16 v10 = 2112;
      v11 = v3;
      v5 = MEMORY[0x1E4F14500];
      int64_t v6 = "Ignoring value for user default %@ that is not an integer: %@";
      goto LABEL_10;
    }
LABEL_7:
    int64_t v4 = 0;
    goto LABEL_8;
  }
  int64_t v4 = [v3 integerValue];
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFBLL)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      v9 = @"PFMediaCapabilitiesPeerSupportOverride";
      __int16 v10 = 2112;
      v11 = v3;
      v5 = MEMORY[0x1E4F14500];
      int64_t v6 = "Ignoring value for user default %@ that is out of range: %@";
LABEL_10:
      _os_log_error_impl(&dword_1A41FE000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v8, 0x16u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

- (int64_t)supportValueByApplyingUserDefaultsPeerOverrideToValue:(int64_t)a3 selector:(SEL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int64_t v6 = [(PFMediaCapabilities *)self userDefaultsPeerOverrideValue];
  if (!v6) {
    return a3;
  }
  int64_t v7 = v6;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a4);
    v9 = [(id)objc_opt_class() stringForSupport:a3];
    __int16 v10 = [(id)objc_opt_class() stringForSupport:v7];
    int v12 = 138413058;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = v9;
    __int16 v16 = 2112;
    v17 = v10;
    __int16 v18 = 2112;
    v19 = @"PFMediaCapabilitiesPeerSupportOverride";
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Overriding peer capabilities result of %@ from %@ to %@ because %@ user default is set", (uint8_t *)&v12, 0x2Au);
  }
  return v7;
}

- (id)opaqueRepresentation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  capabilitiesInformation = self->_capabilitiesInformation;
  id v8 = 0;
  int64_t v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:capabilitiesInformation options:0 error:&v8];
  id v5 = v8;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int64_t v7 = self->_capabilitiesInformation;
    *(_DWORD *)buf = 138412546;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to serialize capabilities information %@: %@", buf, 0x16u);
  }

  return v4;
}

- (BOOL)supportsHDR
{
  v2 = [(NSDictionary *)self->_capabilitiesInformation objectForKeyedSubscript:@"Codecs"];
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", 104, 118, 99, 49);
  int64_t v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = [v4 objectForKeyedSubscript:@"Profiles"];
  int64_t v6 = [v5 objectForKeyedSubscript:@"VTIsHDRAllowedOnDevice"];

  LOBYTE(v2) = [v6 BOOLValue];
  return (char)v2;
}

- (BOOL)supportsTranscodeChoice
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)self->_capabilitiesInformation objectForKeyedSubscript:@"TranscodeChoice"];
  int v3 = [v2 BOOLValue];

  int64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = [v4 objectForKey:@"PFMediaCapabilitiesPeerTranscodeChoiceOverride"];

  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int64_t v6 = @"NO";
      *(_DWORD *)id v8 = 138412802;
      if (v3) {
        int64_t v6 = @"YES";
      }
      *(void *)&v8[4] = v6;
      __int16 v9 = 2112;
      __int16 v10 = v5;
      __int16 v11 = 2112;
      id v12 = @"PFMediaCapabilitiesPeerTranscodeChoiceOverride";
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Overriding peer capabilities result of supportsTranscodeChoice from %@ to %@ because %@ user default is set", v8, 0x20u);
    }
    LOBYTE(v3) = objc_msgSend(v5, "BOOLValue", *(void *)v8);
  }

  return v3;
}

- (int64_t)decodingSupportForAVAsset:(id)a3
{
  id v5 = a3;
  int64_t v6 = [[PFMetadata alloc] initWithAVAsset:v5 timeZoneLookup:0];

  uint64_t v7 = [(PFMetadata *)v6 firstVideoTrackCodec];
  if ([(id)objc_opt_class() videoCodecIsEligibleForBackwardsCompatibilityTranscoding:v7])
  {
    int64_t v8 = [(PFMediaCapabilities *)self decodingSupportForFormatDescription:[(PFMetadata *)v6 videoTrackFormatDescription]];
  }
  else if (v7 == 1635148593)
  {
    int64_t v8 = 2;
  }
  else
  {
    int64_t v8 = 1;
  }
  int64_t v9 = [(PFMediaCapabilities *)self supportValueByApplyingUserDefaultsPeerOverrideToValue:v8 selector:a2];

  return v9;
}

- (int64_t)decodingSupportForFormatDescription:(opaqueCMFormatDescription *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  if (self->_capabilitiesInformation
    && +[PFMediaCapabilities videoCodecIsEligibleForBackwardsCompatibilityTranscoding:MediaSubType])
  {
    int64_t v6 = [(NSDictionary *)self->_capabilitiesInformation objectForKeyedSubscript:@"Version"];
    uint64_t v7 = [v6 integerValue];

    if (v7 < 3)
    {
      if (MediaSubType != 1752589105)
      {
LABEL_21:
        uint64_t v14 = 1;
        return [(PFMediaCapabilities *)self supportValueByApplyingUserDefaultsPeerOverrideToValue:v14 selector:a2];
      }
      v15 = [(NSDictionary *)self->_capabilitiesInformation objectForKeyedSubscript:@"Codecs"];
      __int16 v16 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", 104, 118, 99, 49);
      v17 = [v15 objectForKeyedSubscript:v16];
      int64_t v9 = [v17 objectForKeyedSubscript:@"Profiles"];

      int v18 = VTGetHEVCCapabilitesForFormatDescription();
      if (v18)
      {
        int v19 = v18;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v22) = v19;
          id v12 = MEMORY[0x1E4F14500];
          uint64_t v13 = "VTGetHEVCCapabilitesForFormatDescription returned non-success status %d, defaulting to compatible";
          goto LABEL_15;
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      int64_t v8 = [(NSDictionary *)self->_capabilitiesInformation objectForKeyedSubscript:@"Codecs"];
      int64_t v9 = [v8 objectForKeyedSubscript:@"CodecSupport"];

      if (!v9)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v22 = @"CodecSupport";
          __int16 v23 = 1024;
          int v24 = 3;
          _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unexpected nil value for %@ key in capabilities dictionary for version >= %d", buf, 0x12u);
        }
        int64_t v9 = 0;
        goto LABEL_20;
      }
      int v10 = VTGetDecoderCapabilitesForFormatDescription();
      if (v10)
      {
        int v11 = v10;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v22) = v11;
          id v12 = MEMORY[0x1E4F14500];
          uint64_t v13 = "VTGetDecoderCapabilitesForFormatDescription returned non-success status %d, defaulting to compatible";
LABEL_15:
          _os_log_error_impl(&dword_1A41FE000, v12, OS_LOG_TYPE_ERROR, v13, buf, 8u);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }

    uint64_t v14 = -1;
  }
  else if (MediaSubType == 1635148593)
  {
    uint64_t v14 = 2;
  }
  else
  {
    uint64_t v14 = 1;
  }
  return [(PFMediaCapabilities *)self supportValueByApplyingUserDefaultsPeerOverrideToValue:v14 selector:a2];
}

- (int64_t)supportForCodec:(unsigned int)a3
{
  int64_t v6 = [(NSDictionary *)self->_capabilitiesInformation objectForKeyedSubscript:@"Codecs"];
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", HIBYTE(a3), BYTE2(a3), BYTE1(a3), a3);
  int64_t v8 = [v6 objectForKey:v7];

  if (v8) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = -1;
  }

  return [(PFMediaCapabilities *)self supportValueByApplyingUserDefaultsPeerOverrideToValue:v9 selector:a2];
}

- (int64_t)supportForAdjustmentBaseResources
{
  v2 = [(NSDictionary *)self->_capabilitiesInformation objectForKeyedSubscript:@"SupportsAdjustmentBaseResources"];
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v2 BOOLValue]) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = -1;
  }

  return v3;
}

- (int64_t)supportForAssetBundleVersion:(id)a3
{
  uint64_t v5 = [a3 integerValue];
  int64_t v6 = [(NSDictionary *)self->_capabilitiesInformation objectForKeyedSubscript:@"Vendor"];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"com.apple"];
  int64_t v8 = [v7 objectForKeyedSubscript:@"AssetBundleFormatVersion"];

  if (v8)
  {
    uint64_t v9 = [v8 integerValue];
    uint64_t v10 = -1;
    if (v9 >= v5) {
      uint64_t v10 = 1;
    }
    if (v9) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  int64_t v12 = [(PFMediaCapabilities *)self supportValueByApplyingUserDefaultsPeerAssetBundleSupportOverrideToValue:v11 selector:a2];

  return v12;
}

- (int64_t)supportForLivePhotoVersion:(id)a3
{
  uint64_t v5 = [a3 integerValue];
  int64_t v6 = [(NSDictionary *)self->_capabilitiesInformation objectForKeyedSubscript:@"Vendor"];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"com.apple"];
  int64_t v8 = [v7 objectForKeyedSubscript:@"LivePhotoFormatVersion"];

  if (v8)
  {
    uint64_t v9 = [v8 integerValue];
    uint64_t v10 = -1;
    if (v9 >= v5) {
      uint64_t v10 = 1;
    }
    if (v9) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  int64_t v12 = [(PFMediaCapabilities *)self supportValueByApplyingUserDefaultsPeerOverrideToValue:v11 selector:a2];

  return v12;
}

- (int64_t)supportForContainerTypeIdentifier:(id)a3
{
  capabilitiesInformation = self->_capabilitiesInformation;
  id v6 = a3;
  uint64_t v7 = [(NSDictionary *)capabilitiesInformation objectForKeyedSubscript:@"ContainerFormats"];
  int64_t v8 = [v7 objectForKey:v6];

  if (v8) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = -1;
  }

  return [(PFMediaCapabilities *)self supportValueByApplyingUserDefaultsPeerOverrideToValue:v9 selector:a2];
}

- (PFMediaCapabilities)initWithPlatformInformation:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFMediaCapabilities;
  uint64_t v5 = [(PFMediaCapabilities *)&v9 init];
  if (v5)
  {
    uint64_t v10 = @"PFMediaCapabilitiesPlatformInfoKey";
    v11[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    capabilitiesInformation = v5->_capabilitiesInformation;
    v5->_capabilitiesInformation = (NSDictionary *)v6;
  }
  return v5;
}

- (PFMediaCapabilities)initWithOpaqueRepresentation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFMediaCapabilities;
  uint64_t v5 = [(PFMediaCapabilities *)&v12 init];
  if (!v5) {
    goto LABEL_4;
  }
  id v11 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v11];
  id v7 = v11;
  if (v6)
  {
    capabilitiesInformation = v5->_capabilitiesInformation;
    v5->_capabilitiesInformation = (NSDictionary *)v6;

LABEL_4:
    objc_super v9 = v5;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to deserialize capabilities information %@: %@", buf, 0x16u);
  }

  objc_super v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)sortSourceEnumerationAscending
{
  v2 = [(NSDictionary *)self->_capabilitiesInformation objectForKeyedSubscript:@"SortSourceEnumerationAscending"];
  int64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)platformInformation
{
  return [(NSDictionary *)self->_capabilitiesInformation objectForKeyedSubscript:@"PFMediaCapabilitiesPlatformInfoKey"];
}

+ (BOOL)currentDeviceIsEligibleForHDRPlayback
{
  return [MEMORY[0x1E4F16608] eligibleForHDRPlayback];
}

+ (id)proResVideoCodecTypesEligibleForBackwardsCompatibilityTranscoding
{
  return &unk_1EF7CAD30;
}

+ (id)videoCodecTypesEligibleForBackwardsCompatibilityTranscoding
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PFMediaCapabilities_videoCodecTypesEligibleForBackwardsCompatibilityTranscoding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (videoCodecTypesEligibleForBackwardsCompatibilityTranscoding_onceToken != -1) {
    dispatch_once(&videoCodecTypesEligibleForBackwardsCompatibilityTranscoding_onceToken, block);
  }
  v2 = (void *)videoCodecTypesEligibleForBackwardsCompatibilityTranscoding_codecTypeNumbers;

  return v2;
}

void __82__PFMediaCapabilities_videoCodecTypesEligibleForBackwardsCompatibilityTranscoding__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1EF7CAD18];
  int64_t v3 = (void *)videoCodecTypesEligibleForBackwardsCompatibilityTranscoding_codecTypeNumbers;
  videoCodecTypesEligibleForBackwardsCompatibilityTranscoding_codecTypeNumbers = v2;

  char v4 = (void *)videoCodecTypesEligibleForBackwardsCompatibilityTranscoding_codecTypeNumbers;
  id v5 = [*(id *)(a1 + 32) proResVideoCodecTypesEligibleForBackwardsCompatibilityTranscoding];
  [v4 addObjectsFromArray:v5];
}

+ (BOOL)videoCodecIsProResEligibleForBackwardsCompatibilityTranscoding:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  char v4 = [a1 proResVideoCodecTypesEligibleForBackwardsCompatibilityTranscoding];
  id v5 = [NSNumber numberWithUnsignedInt:v3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

+ (BOOL)videoCodecIsEligibleForBackwardsCompatibilityTranscoding:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  char v4 = [a1 videoCodecTypesEligibleForBackwardsCompatibilityTranscoding];
  id v5 = [NSNumber numberWithUnsignedInt:v3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

+ (unsigned)currentDeviceHEVCCapabilities
{
  if (currentDeviceHEVCCapabilities_onceToken != -1) {
    dispatch_once(&currentDeviceHEVCCapabilities_onceToken, &__block_literal_global_2326);
  }
  if (currentDeviceHEVCCapabilities_sCapabilities) {
    return 15;
  }
  else {
    return 0;
  }
}

void __52__PFMediaCapabilities_currentDeviceHEVCCapabilities__block_invoke()
{
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F45660], (const void *)*MEMORY[0x1E4F1CFD0]);
  int VideoEncoderInstance = VTSelectAndCreateVideoEncoderInstance();
  CFRelease(Mutable);
  if (!VideoEncoderInstance) {
    currentDeviceHEVCCapabilities_sCapabilities = 1;
  }
}

+ (id)stringForSupport:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 3) {
    return @"PFMediaCapabilitiesSupportUnknown";
  }
  else {
    return off_1E5B2D460[a3 + 1];
  }
}

+ (id)capabilitiesInformationForCurrentDeviceWithOptions:(id)a3
{
  id v3 = a3;
  char v4 = [[PFMediaCapabilitiesQuery alloc] initWithOptions:v3];

  id v5 = [(PFMediaCapabilitiesQuery *)v4 dictionaryRepresentation];

  return v5;
}

+ (id)legacyCapabilities
{
  uint64_t v2 = objc_opt_new();

  return v2;
}

+ (id)capabilitiesForCurrentDeviceWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  char v6 = [a1 capabilitiesInformationForCurrentDeviceWithOptions:v4];

  [v5 setCapabilitiesInformation:v6];

  return v5;
}

+ (id)capabilitiesForCurrentDevice
{
  return (id)[a1 capabilitiesForCurrentDeviceWithOptions:MEMORY[0x1E4F1CC08]];
}

- (void)setSupportsTranscodeChoice:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NSDictionary *)self->_capabilitiesInformation mutableCopy];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v9 = (id)v5;
  char v6 = [NSNumber numberWithBool:v3];
  [v9 setObject:v6 forKeyedSubscript:@"TranscodeChoice"];

  id v7 = (NSDictionary *)[v9 copy];
  capabilitiesInformation = self->_capabilitiesInformation;
  self->_capabilitiesInformation = v7;
}

- (void)setSupportForAdjustmentBaseResources:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NSDictionary *)self->_capabilitiesInformation mutableCopy];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v9 = (id)v5;
  char v6 = [NSNumber numberWithBool:v3];
  [v9 setObject:v6 forKeyedSubscript:@"SupportsAdjustmentBaseResources"];

  id v7 = (NSDictionary *)[v9 copy];
  capabilitiesInformation = self->_capabilitiesInformation;
  self->_capabilitiesInformation = v7;
}

+ (void)setRecordSlomoConfiguration:(id)a3
{
}

+ (id)recordSlomoConfigurationWithValidValues:(id)a3
{
  id v3 = a3;
  id v4 = [NSNumber numberWithInteger:CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceSlomoConfiguration", @"com.apple.camera", 0)];
  char v5 = [v3 containsObject:v4];

  if ((v5 & 1) == 0)
  {

    id v4 = &unk_1EF7CA7F0;
  }

  return v4;
}

+ (void)setRecordVideoConfiguration:(id)a3
{
}

+ (id)recordVideoConfigurationWithValidValues:(id)a3
{
  id v3 = a3;
  id v4 = [NSNumber numberWithInteger:CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceVideoConfiguration", @"com.apple.camera", 0)];
  char v5 = [v3 containsObject:v4];

  if ((v5 & 1) == 0)
  {

    id v4 = &unk_1EF7CA7F0;
  }

  return v4;
}

+ (BOOL)setNewFormatsConfiguration:(int64_t)a3 fromSource:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceCaptureEncodingBehaviorSource", @"com.apple.camera", 0);
  int64_t v8 = AppIntegerValue;
  if (a4 == 2 || AppIntegerValue < a4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v14 = v8;
      __int16 v15 = 2048;
      int64_t v16 = a4;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "overwriting encoding behavior from source %ld to source %ld", buf, 0x16u);
    }
    CFPreferencesSetAppValue(@"CAMUserPreferenceCaptureEncodingBehaviorSource", (CFPropertyListRef)[NSNumber numberWithInteger:a4], @"com.apple.camera");
  }
  if (a4 != 2 && v8 > a4) {
    return 0;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex v10 = CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceCaptureEncodingBehavior", @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    CFPreferencesSetAppValue(@"CAMUserPreferenceCaptureEncodingBehavior", (CFPropertyListRef)[NSNumber numberWithInteger:a3], @"com.apple.camera");
  }
  BOOL v9 = v10 != a3;
  if (v10 != a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      int64_t v16 = a3;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "changing encoding behavior from %ld to %ld", buf, 0x16u);
    }
    CFPreferencesSetAppValue(@"CAMUserPreferenceCaptureEncodingBehavior", (CFPropertyListRef)[NSNumber numberWithInteger:a3], @"com.apple.camera");
    if (a3 == 1)
    {
      if (CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceSlomoConfiguration", @"com.apple.camera", 0) == 8)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v14 = 8;
          __int16 v15 = 2048;
          int64_t v16 = 0;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "changing slow-mo configuration from %ld to %ld", buf, 0x16u);
        }
        [a1 setRecordSlomoConfiguration:&unk_1EF7CA7F0];
      }
      if (CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceVideoConfiguration", @"com.apple.camera", 0) == 9)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v14 = 9;
          __int16 v15 = 2048;
          int64_t v16 = 1;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "changing video configuration from %ld to %ld", buf, 0x16u);
        }
        [a1 setRecordVideoConfiguration:&unk_1EF7CA808];
      }
    }
    else if (!a3 {
           && v10 == 1
    }
           && CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceSlomoConfiguration", @"com.apple.camera", 0) == 8)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v14 = 8;
        __int16 v15 = 2048;
        int64_t v16 = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "changing slow-mo configuration from %ld to %ld for change from MostCompatible back to Automatic", buf, 0x16u);
      }
      [a1 setRecordSlomoConfiguration:&unk_1EF7CA7F0];
    }
    CFPreferencesAppSynchronize(@"com.apple.camera");
  }
  return v9;
}

+ (id)testCapabilitiesNotSupportingHEIF
{
  uint64_t v2 = objc_opt_new();

  return v2;
}

+ (id)testCapabilitiesNotSupportingHEVC
{
  uint64_t v2 = objc_opt_new();

  return v2;
}

@end