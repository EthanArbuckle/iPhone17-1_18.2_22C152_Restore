@interface PISegmentationContextInfo
+ (id)currentContextInfo;
- (BOOL)segmentationDisabled;
- (NSString)systemBuildVersion;
- (NSString)systemName;
- (NSString)systemVersion;
- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration;
- (int64_t)infillAlgorithm;
- (int64_t)sourceMode;
- (unint64_t)role;
- (unint64_t)version;
- (void)setInfillAlgorithm:(int64_t)a3;
- (void)setLayoutConfiguration:(id)a3;
- (void)setRole:(unint64_t)a3;
- (void)setSegmentationDisabled:(BOOL)a3;
- (void)setSourceMode:(int64_t)a3;
- (void)setSystemBuildVersion:(id)a3;
- (void)setSystemName:(id)a3;
- (void)setSystemVersion:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation PISegmentationContextInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setLayoutConfiguration:(id)a3
{
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setInfillAlgorithm:(int64_t)a3
{
  self->_infillAlgorithm = a3;
}

- (int64_t)infillAlgorithm
{
  return self->_infillAlgorithm;
}

- (void)setSegmentationDisabled:(BOOL)a3
{
  self->_segmentationDisabled = a3;
}

- (BOOL)segmentationDisabled
{
  return self->_segmentationDisabled;
}

- (void)setSourceMode:(int64_t)a3
{
  self->_sourceMode = a3;
}

- (int64_t)sourceMode
{
  return self->_sourceMode;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setSystemBuildVersion:(id)a3
{
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemName:(id)a3
{
}

- (NSString)systemName
{
  return self->_systemName;
}

+ (id)currentContextInfo
{
  if (currentContextInfo_onceToken != -1) {
    dispatch_once(&currentContextInfo_onceToken, &__block_literal_global_758);
  }
  id v3 = objc_alloc_init((Class)a1);
  [v3 setVersion:50];
  [v3 setSystemName:currentContextInfo_systemName];
  [v3 setSystemVersion:currentContextInfo_systemVersion];
  [v3 setSystemBuildVersion:currentContextInfo_systemBuildVersion];
  [v3 setSourceMode:0];
  [v3 setSegmentationDisabled:0];
  v4 = +[PIGlobalSettings globalSettings];
  objc_msgSend(v3, "setInfillAlgorithm:", objc_msgSend(v4, "segmentationInfillAlgorithm"));

  v5 = [MEMORY[0x1E4F8CE48] deviceConfiguration];
  [v3 setLayoutConfiguration:v5];

  return v3;
}

uint64_t __47__PISegmentationContextInfo_currentContextInfo__block_invoke()
{
  uint64_t v0 = _CFCopySystemVersionDictionaryValue();
  v1 = (void *)currentContextInfo_systemName;
  currentContextInfo_systemName = v0;

  uint64_t v2 = _CFCopySystemVersionDictionaryValue();
  id v3 = (void *)currentContextInfo_systemVersion;
  currentContextInfo_systemVersion = v2;

  currentContextInfo_systemBuildVersion = _CFCopySystemVersionDictionaryValue();
  return MEMORY[0x1F41817F8]();
}

@end