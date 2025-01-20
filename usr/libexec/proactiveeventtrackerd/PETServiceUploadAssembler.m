@interface PETServiceUploadAssembler
+ (id)loadPET1Config;
+ (id)loadPETConfig;
- (BOOL)_canLog:(id)a3 messageGroup:(id)a4 isInternal:(BOOL)a5;
- (BOOL)_canLogPET1Key:(id)a3;
- (BOOL)_checkMessageSampling:(id)a3;
- (BOOL)_checkSampling:(id)a3;
- (BOOL)isConfigEnabled;
- (NSDictionary)pet1Config;
- (NSUUID)deviceId;
- (PETConfig)petConfig;
- (PETServiceUploadAssembler)initWithRootDir:(id)a3;
- (id)assembleAggregatedUploadWithTracker:(id)a3;
- (id)assembleUnaggregatedUploadWithTracker:(id)a3 messageGroup:(id)a4;
- (void)setDeviceId:(id)a3;
- (void)setIsConfigEnabled:(BOOL)a3;
- (void)setPet1Config:(id)a3;
- (void)setPetConfig:(id)a3;
@end

@implementation PETServiceUploadAssembler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_pet1Config, 0);

  objc_storeStrong((id *)&self->_petConfig, 0);
}

- (void)setDeviceId:(id)a3
{
}

- (NSUUID)deviceId
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIsConfigEnabled:(BOOL)a3
{
  self->_isConfigEnabled = a3;
}

- (BOOL)isConfigEnabled
{
  return self->_isConfigEnabled;
}

- (void)setPet1Config:(id)a3
{
}

- (NSDictionary)pet1Config
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPetConfig:(id)a3
{
}

- (PETConfig)petConfig
{
  return (PETConfig *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)_checkMessageSampling:(id)a3
{
  id v4 = a3;
  v5 = [(PETServiceUploadAssembler *)self petConfig];
  [v5 messageSamplingForMessageName:v4 isSeed:0];
  double v7 = v6;

  BOOL result = 0;
  if (v7 > 0.0) {
    return v7 >= 1.0 || v7 * 4294967300.0 > (double)arc4random();
  }
  return result;
}

- (BOOL)_checkSampling:(id)a3
{
  id v4 = a3;
  v5 = [(PETServiceUploadAssembler *)self petConfig];
  [v5 deviceSamplingForMessageName:v4 isSeed:0];
  double v7 = v6;

  BOOL v8 = 0;
  if (v7 > 0.0)
  {
    if (v7 >= 1.0)
    {
      BOOL v8 = 1;
    }
    else
    {
      v9 = [(PETServiceUploadAssembler *)self petConfig];
      v10 = [v9 groupForMessageName:v4];

      v11 = [(PETServiceUploadAssembler *)self deviceId];
      v12 = [(PETServiceUploadAssembler *)self petConfig];
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%@%lu", v11, v10, [v12 version]);

      id v14 = v13;
      v15 = (const char *)[v14 UTF8String];
      CC_LONG v16 = strlen(v15);
      CC_MD5(v15, v16, md);
      LODWORD(v17) = *(_DWORD *)md;
      BOOL v8 = v7 * 4294967300.0 > (double)v17;
    }
  }

  return v8;
}

- (BOOL)_canLog:(id)a3 messageGroup:(id)a4 isInternal:(BOOL)a5
{
  id v8 = a4;
  v9 = [a3 name];
  v10 = [(PETServiceUploadAssembler *)self petConfig];
  v11 = [v10 whitelistForMessageName:v9];

  if (v11 && (a5 || [(PETServiceUploadAssembler *)self _checkSampling:v9]))
  {
    v12 = +[PETMetadata getCountryCode];
    BOOL v15 = 1;
    if ([v12 isEqualToString:@"CN"])
    {
      v13 = [(PETServiceUploadAssembler *)self petConfig];
      unsigned int v14 = [v13 isChinaEnabledForMessageName:v9 messageGroup:v8];

      if (!v14) {
        BOOL v15 = 0;
      }
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_canLogPET1Key:(id)a3
{
  return 0;
}

- (id)assembleUnaggregatedUploadWithTracker:(id)a3 messageGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  v9 = objc_opt_new();
  [v8 setMetadata:v9];

  v10 = [v8 metadata];
  v11 = [(PETServiceUploadAssembler *)self petConfig];
  [v10 setMetadataWithConfigVersion:[v11 version]];

  BOOL v12 = [(PETServiceUploadAssembler *)self isConfigEnabled];
  v13 = [v8 metadata];
  [v13 setIsConfigEnabled:v12];

  unsigned int v14 = [v8 metadata];
  [v14 setMessageGroup:v7];

  [v8 setIsCompressed:1];
  if ([v6 isTesting]) {
    unsigned __int8 v15 = 0;
  }
  else {
    unsigned __int8 v15 = +[_PASDeviceInfo isInternalBuild];
  }
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  v33 = _NSConcreteStackBlock;
  uint64_t v34 = 3221225472;
  v35 = sub_100006F6C;
  v36 = &unk_10000C590;
  id v16 = (id)objc_opt_new();
  id v37 = v16;
  v38 = self;
  id v17 = v7;
  id v39 = v17;
  unsigned __int8 v42 = v15;
  id v18 = v8;
  id v40 = v18;
  v41 = &v43;
  [v6 enumerateMessagesWithBlock:&v33 messageGroup:v17 clearStore:1];
  [v16 close:v33, v34, v35, v36];
  if (!*((unsigned char *)v44 + 24)) {
    goto LABEL_11;
  }
  v19 = [v16 compressedMessages];
  BOOL v20 = v19 == 0;

  if (v20)
  {
    CFStringRef v53 = @"group";
    id v54 = v17;
    v29 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    AnalyticsSendEvent();

LABEL_11:
    id v30 = 0;
    goto LABEL_12;
  }
  v21 = [v16 compressedMessages];
  BOOL v22 = (unint64_t)[v21 length] > 0x1F8000;

  if (v22)
  {
    id v23 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [v16 compressedMessages];
      id v25 = [v24 length];
      *(_DWORD *)buf = 134218240;
      id v50 = v25;
      __int16 v51 = 2048;
      uint64_t v52 = 2064384;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Dropping aggregated messages (size %lu) due to exceeding MAX_UPLOAD_BYTES (%lu)", buf, 0x16u);
    }
    v47[0] = @"size";
    v26 = [v16 compressedMessages];
    v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v26 length]);
    v47[1] = @"group";
    v48[0] = v27;
    v48[1] = v17;
    v28 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
    AnalyticsSendEvent();

    goto LABEL_11;
  }
  v32 = [v16 compressedMessages];
  [v18 setCompressedMessages:v32];

  id v30 = v18;
LABEL_12:

  _Block_object_dispose(&v43, 8);

  return v30;
}

- (id)assembleAggregatedUploadWithTracker:(id)a3
{
  id v4 = a3;
  v5 = [v4 aggregateState];
  unsigned __int8 v6 = [v5 checkIntegrity];

  if (v6)
  {
    id v7 = objc_opt_new();
    id v8 = objc_opt_new();
    [v7 setMetadata:v8];

    v9 = [v7 metadata];
    v10 = [(PETServiceUploadAssembler *)self petConfig];
    [v9 setMetadataWithConfigVersion:[v10 version]];

    BOOL v11 = [(PETServiceUploadAssembler *)self isConfigEnabled];
    BOOL v12 = [v7 metadata];
    [v12 setIsConfigEnabled:v11];

    v13 = [v7 metadata];
    [v13 setMessageGroup:@"_aggregated"];

    [v7 setIsCompressed:1];
    if ([v4 isTesting]) {
      unsigned __int8 v14 = 0;
    }
    else {
      unsigned __int8 v14 = +[_PASDeviceInfo isInternalBuild];
    }
    *(void *)id v37 = 0;
    v38 = v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    v31 = sub_100007668;
    v32 = &unk_10000C568;
    id v16 = (id)objc_opt_new();
    id v33 = v16;
    uint64_t v34 = self;
    unsigned __int8 v36 = v14;
    v35 = v37;
    [v4 enumerateAggregatedMessagesWithBlock:&v29 clearStore:1];
    [v16 close:v29, v30, v31, v32];
    if (v38[24])
    {
      id v17 = [v16 compressedMessages];
      BOOL v18 = v17 == 0;

      if (v18)
      {
        AnalyticsSendEvent();
      }
      else
      {
        v19 = [v16 compressedMessages];
        BOOL v20 = (unint64_t)[v19 length] > 0x1F8000;

        if (!v20)
        {
          v28 = [v16 compressedMessages];
          [v7 setCompressedMessages:v28];

          id v15 = v7;
          goto LABEL_16;
        }
        id v21 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v22 = [v16 compressedMessages];
          id v23 = [v22 length];
          *(_DWORD *)buf = 134218240;
          id v44 = v23;
          __int16 v45 = 2048;
          uint64_t v46 = 2064384;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Dropping aggregated messages (size %lu) due to exceeding MAX_UPLOAD_BYTES (%lu)", buf, 0x16u);
        }
        v41[0] = @"size";
        v24 = [v16 compressedMessages];
        id v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v24 length]);
        v41[1] = @"group";
        v42[0] = v25;
        v42[1] = @"_aggregated";
        v26 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
        AnalyticsSendEvent();
      }
    }
    id v15 = 0;
LABEL_16:

    _Block_object_dispose(v37, 8);
    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v37 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "The aggregate state is corrupt. Resetting the state store", v37, 2u);
  }
  AnalyticsSendEvent();
  id v7 = [v4 aggregateState];
  [v7 reset];
  id v15 = 0;
LABEL_17:

  return v15;
}

- (PETServiceUploadAssembler)initWithRootDir:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PETServiceUploadAssembler;
  v5 = [(PETServiceUploadAssembler *)&v18 init];
  if (!v5) {
    goto LABEL_16;
  }
  unsigned __int8 v6 = +[PETServiceUploadAssembler loadPETConfig];
  [(PETServiceUploadAssembler *)v5 setPetConfig:v6];

  id v7 = [(PETServiceUploadAssembler *)v5 petConfig];

  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to load PET configuration", v17, 2u);
    }
    goto LABEL_11;
  }
  id v8 = +[PETServiceUploadAssembler loadPET1Config];
  [(PETServiceUploadAssembler *)v5 setPet1Config:v8];

  v9 = [(PETServiceUploadAssembler *)v5 pet1Config];

  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to load PET 1.0 configuration", v17, 2u);
    }
LABEL_11:
    AnalyticsSendEvent();
    goto LABEL_12;
  }
  if (+[_PASDeviceInfo isInternalBuild]) {
    BOOL v10 = arc4random() < 0x28F5C29;
  }
  else {
    BOOL v10 = 1;
  }
  [(PETServiceUploadAssembler *)v5 setIsConfigEnabled:v10];
  BOOL v12 = [v4 stringByAppendingPathComponent:@"device_id"];
  id v13 = [objc_alloc((Class)_PASDeviceIdentifier) initWithBasePath:v12];
  unsigned __int8 v14 = [v13 UUID];
  [(PETServiceUploadAssembler *)v5 setDeviceId:v14];

  id v15 = [(PETServiceUploadAssembler *)v5 deviceId];

  if (v15)
  {

LABEL_16:
    BOOL v11 = v5;
    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v17 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to generate device identifer for sampling", v17, 2u);
  }
  AnalyticsSendEvent();

LABEL_12:
  BOOL v11 = 0;
LABEL_17:

  return v11;
}

+ (id)loadPET1Config
{
  dispatch_queue_t v2 = dispatch_queue_create("PETAsset-notifications", 0);
  id v3 = [objc_alloc((Class)_PASAsset2) initWithAssetTypeDescriptorPath:@"/System/Library/AssetTypeDescriptors/com.apple.MobileAsset.AssetTypeDescriptor.ProactiveEventTrackerAssets.plist" defaultBundlePath:0 matchingKeysAndValues:0 notificationQueue:v2 logHandle:&_os_log_default];
  id v4 = [v3 filesystemPathForAssetDataRelativePath:@"pet1_config.plist"];
  if (v4
    || (+[NSBundle bundleForClass:objc_opt_class()],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 pathForResource:@"pet1_config" ofType:@"plist"],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    unsigned __int8 v6 = +[NSDictionary dictionaryWithContentsOfFile:v4];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to load PET1 config from the bundle", v8, 2u);
    }
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (id)loadPETConfig
{
  dispatch_queue_t v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 pathForResource:@"pet_config" ofType:@"plist"];

  if (v3)
  {
    id v4 = [objc_alloc((Class)PETConfig) initWithFile:v3];
    dispatch_queue_t v5 = dispatch_queue_create("PETAsset-notifications", 0);
    id v6 = [objc_alloc((Class)_PASAsset2) initWithAssetTypeDescriptorPath:@"/System/Library/AssetTypeDescriptors/com.apple.MobileAsset.AssetTypeDescriptor.ProactiveEventTrackerAssets.plist" defaultBundlePath:0 matchingKeysAndValues:0 notificationQueue:v5 logHandle:&_os_log_default];
    id v7 = [v6 filesystemPathForAssetDataRelativePath:@"pet_config.plist"];
    if (v7)
    {
      id v8 = [objc_alloc((Class)PETConfig) initWithFile:v7];
      id v9 = [v4 version];
      if (v9 <= [v8 version]) {
        BOOL v10 = v8;
      }
      else {
        BOOL v10 = v4;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = v4;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to load PET config from the bundle", v13, 2u);
    }
    id v11 = 0;
  }

  return v11;
}

@end