@interface PFMediaCapabilitiesQuery
- (NSMutableDictionary)capabilitiesInformation;
- (PFMediaCapabilitiesQuery)init;
- (PFMediaCapabilitiesQuery)initWithOptions:(id)a3;
- (id)dictionaryRepresentation;
- (void)addAssetBundleInformationToDictionary:(id)a3;
- (void)addCodecInformation;
- (void)addCodecSupportInformationToDictionary:(id)a3;
- (void)addHEIFContainerInformationToDictionary:(id)a3;
- (void)addLivePhotoInformationToDictionary:(id)a3;
- (void)addPlatformInformation;
- (void)addPlatformInformationFromDictionary:(id)a3;
- (void)addSortSourceEnumerationAscendingWithOptions:(id)a3;
- (void)addTranscodeChoiceWithOptions:(id)a3;
- (void)addVendorSpecificInformationWithOptions:(id)a3;
- (void)addVersion;
- (void)addVersion1And2HEVCCodecInformationToDictionary:(id)a3;
- (void)gatherCapabilitiesWithOptions:(id)a3;
- (void)setCapabilitiesInformation:(id)a3;
@end

@implementation PFMediaCapabilitiesQuery

- (void).cxx_destruct
{
}

- (void)setCapabilitiesInformation:(id)a3
{
}

- (NSMutableDictionary)capabilitiesInformation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)addAssetBundleInformationToDictionary:(id)a3
{
  id v4 = a3;
  v3 = +[PFAssetBundle currentFormatVersion];
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:@"AssetBundleFormatVersion"];
  }
}

- (void)addLivePhotoInformationToDictionary:(id)a3
{
  id v4 = a3;
  v3 = +[PFVideoComplement currentFormatVersion];
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:@"LivePhotoFormatVersion"];
  }
}

- (void)addSortSourceEnumerationAscendingWithOptions:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"SortSourceEnumerationAscending"];
  [(NSMutableDictionary *)self->_capabilitiesInformation setObject:v4 forKeyedSubscript:@"SortSourceEnumerationAscending"];
}

- (void)addTranscodeChoiceWithOptions:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"SupportsTranscodeChoice"];
  [(NSMutableDictionary *)self->_capabilitiesInformation setObject:v4 forKeyedSubscript:@"TranscodeChoice"];
}

- (void)addPlatformInformationFromDictionary:(id)a3
{
}

- (void)addPlatformInformation
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v3 = (void *)_CFCopySystemVersionDictionary();
  v9[0] = @"Apple";
  v8[0] = @"PFMediaCapabilitiesPlatformVendorKey";
  v8[1] = @"PFMediaCapabilitiesPlatformNameKey";
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1CD18]];
  v9[1] = v4;
  v8[2] = @"PFMediaCapabilitiesPlatformVersionKey";
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1CD30]];
  v9[2] = v5;
  v8[3] = @"PFMediaCapabilitiesPlatformBuildVersionKey";
  v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
  v8[4] = @"PFMediaCapabilitiesPlatformTransportKey";
  v9[3] = v6;
  v9[4] = @"PTP";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];

  [(NSMutableDictionary *)self->_capabilitiesInformation setObject:v7 forKeyedSubscript:@"PFMediaCapabilitiesPlatformInfoKey"];
}

- (void)addVendorSpecificInformationWithOptions:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  v6 = [v4 dictionary];
  [(PFMediaCapabilitiesQuery *)self addLivePhotoInformationToDictionary:v6];
  [(PFMediaCapabilitiesQuery *)self addAssetBundleInformationToDictionary:v6];
  [(NSMutableDictionary *)self->_capabilitiesInformation setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SupportsAdjustmentBaseResources"];
  v9 = @"com.apple";
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(NSMutableDictionary *)self->_capabilitiesInformation setObject:v7 forKeyedSubscript:@"Vendor"];

  v8 = [v5 objectForKeyedSubscript:@"WantsPlatformInfo"];

  if (v8) {
    [(PFMediaCapabilitiesQuery *)self addPlatformInformation];
  }
}

- (void)addHEIFContainerInformationToDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  CFArrayRef v3 = CGImageSourceCopyTypeIdentifiers();
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  CFArrayRef v5 = v3;
  uint64_t v6 = [(__CFArray *)v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    uint64_t v9 = *MEMORY[0x1E4F44568];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v12 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v11];
        int v13 = [v12 conformsToType:v9];

        if (v13) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [(__CFArray *)v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    v22 = @"HeifSubtypes";
    v23 = v4;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v15 = [(id)*MEMORY[0x1E4F44568] identifier];
    v16 = v17;
    [v17 setObject:v14 forKeyedSubscript:v15];
  }
  else
  {
    v16 = v17;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFArrayRef v25 = v5;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "System has no HEIF support, known identifiers = %@", buf, 0xCu);
    }
  }
}

- (void)addCodecSupportInformationToDictionary:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PFMediaCapabilities videoCodecTypesEligibleForBackwardsCompatibilityTranscoding];
  CFArrayRef v5 = (void *)VTCopyDecoderCapabilitiesDictionaryForCodecTypes();
  if (v5)
  {
    [v3 setObject:v5 forKeyedSubscript:@"CodecSupport"];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get codec support information for codec types %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)addVersion1And2HEVCCodecInformationToDictionary:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int VideoDecoderInstance = VTSelectAndCreateVideoDecoderInstance();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    BOOL v9 = VideoDecoderInstance == 0;
    __int16 v10 = 1024;
    int v11 = VideoDecoderInstance;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Has HEVC codec: %d, status = %x", buf, 0xEu);
  }
  if (!VideoDecoderInstance)
  {
    CFArrayRef v5 = objc_opt_new();
    int v6 = (void *)VTCopyHEVCDecoderCapabilitiesDictionary();
    [v5 setObject:v6 forKeyedSubscript:@"Profiles"];
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", 104, 118, 99, 49);
    [v3 setObject:v5 forKeyedSubscript:v7];
  }
}

- (void)addCodecInformation
{
  id v4 = (id)objc_opt_new();
  [(NSMutableDictionary *)self->_capabilitiesInformation setObject:v4 forKeyedSubscript:@"Codecs"];
  [(PFMediaCapabilitiesQuery *)self addVersion1And2HEVCCodecInformationToDictionary:v4];
  [(PFMediaCapabilitiesQuery *)self addCodecSupportInformationToDictionary:v4];
  id v3 = objc_opt_new();
  [(NSMutableDictionary *)self->_capabilitiesInformation setObject:v3 forKeyedSubscript:@"ContainerFormats"];
  [(PFMediaCapabilitiesQuery *)self addHEIFContainerInformationToDictionary:v3];
}

- (void)addVersion
{
}

- (void)gatherCapabilitiesWithOptions:(id)a3
{
  id v4 = a3;
  [(PFMediaCapabilitiesQuery *)self addVersion];
  [(PFMediaCapabilitiesQuery *)self addCodecInformation];
  [(PFMediaCapabilitiesQuery *)self addVendorSpecificInformationWithOptions:v4];
  [(PFMediaCapabilitiesQuery *)self addTranscodeChoiceWithOptions:v4];
  [(PFMediaCapabilitiesQuery *)self addSortSourceEnumerationAscendingWithOptions:v4];
}

- (id)dictionaryRepresentation
{
  return self->_capabilitiesInformation;
}

- (PFMediaCapabilitiesQuery)initWithOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFMediaCapabilitiesQuery;
  CFArrayRef v5 = [(PFMediaCapabilitiesQuery *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    capabilitiesInformation = v5->_capabilitiesInformation;
    v5->_capabilitiesInformation = (NSMutableDictionary *)v6;

    [(PFMediaCapabilitiesQuery *)v5 gatherCapabilitiesWithOptions:v4];
  }

  return v5;
}

- (PFMediaCapabilitiesQuery)init
{
  return [(PFMediaCapabilitiesQuery *)self initWithOptions:MEMORY[0x1E4F1CC08]];
}

@end