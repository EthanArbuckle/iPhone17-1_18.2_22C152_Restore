@interface PETService
+ (void)clearAllLogs;
+ (void)updateMobileAssetMetadataWithXPCActivity:(id)a3;
- (BOOL)_writeUploadForTransparency:(id)a3;
- (PETService)init;
- (id)_createMetadataFrom:(id)a3 submissionId:(id)a4 messageName:(id)a5 typeId:(unsigned int)a6;
- (void)_uploadBatchedDataToPFA:(id)a3 schema:(id)a4 messageGroup:(id)a5;
- (void)_uploadGMSDataToPFA:(id)a3;
- (void)_uploadToFBFv2WithUpload:(id)a3;
- (void)_uploadToParsecWithUpload:(id)a3;
- (void)_uploadWithUploadPackage:(id)a3;
- (void)upload;
@end

@implementation PETService

- (void).cxx_destruct
{
}

- (void)_uploadWithUploadPackage:(id)a3
{
  id v4 = a3;
  if (+[_PASDeviceInfo isDNUEnabled])
  {
    v5 = [v4 metadata];
    v6 = [v5 messageGroup];

    if (!v6)
    {
      v7 = [v4 metadata];
      [v7 setMessageGroup:@"null"];
    }
    if ([(PETService *)self _writeUploadForTransparency:v4])
    {
      v8 = +[PETMetadata getCountryCode];
      v9 = [v4 metadata];
      if ([v9 isInternal])
      {
        v10 = [v4 metadata];
        v11 = [v10 messageGroup];
        unsigned int v12 = [v11 isEqualToString:@"com.apple.generativefunctions.instrumentation.UberEvent"];

        if (v12)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v13 = [v4 metadata];
            v14 = [v13 messageGroup];
            int v22 = 138412290;
            v23 = v14;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found GMS Event Message Group: %@", (uint8_t *)&v22, 0xCu);
          }
          [(PETService *)self _uploadGMSDataToPFA:v4];
        }
      }
      else
      {
      }
      if ([v8 isEqualToString:@"CN"])
      {
        [(PETService *)self _uploadToFBFv2WithUpload:v4];
LABEL_26:

        goto LABEL_27;
      }
      v18 = +[PETServiceUploadAssembler loadPETConfig];
      if ([v18 shouldUploadToFBFv2]) {
        goto LABEL_22;
      }
      if ([v18 shouldUploadToFBFv2ForCarryAndSeed])
      {
        v19 = [v4 metadata];
        if ([v19 isInternal])
        {

LABEL_22:
          [(PETService *)self _uploadToFBFv2WithUpload:v4];
          goto LABEL_23;
        }
        v20 = [v4 metadata];
        unsigned int v21 = [v20 isSeed];

        if (v21) {
          goto LABEL_22;
        }
      }
LABEL_23:
      if ([v18 shouldUploadToParsec]) {
        [(PETService *)self _uploadToParsecWithUpload:v4];
      }

      goto LABEL_26;
    }
    v24[0] = @"reason";
    v24[1] = @"group";
    v25[0] = @"write_osa";
    v15 = [v4 metadata];
    v16 = [v15 messageGroup];
    v25[1] = v16;
    v17 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    AnalyticsSendEvent();

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v22) = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to write upload data to OSAnalytics for transparency", (uint8_t *)&v22, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "DNU is disabled. Skip uploading", (uint8_t *)&v22, 2u);
  }
LABEL_27:
}

- (void)_uploadBatchedDataToPFA:(id)a3 schema:(id)a4 messageGroup:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[FLLogger sharedLoggerWithPersistenceConfiguration:1];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v24;
    *(void *)&long long v13 = 138412290;
    long long v19 = v13;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v16);
        if (objc_opt_respondsToSelector())
        {
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100004724;
          v20[3] = &unk_10000C4A0;
          id v21 = v9;
          uint64_t v22 = v17;
          [v10 reportDataPlatformBatchedEvent:v17 forBundleID:@"com.apple.proactive" ofSchema:v8 completion:v20];
          v18 = v21;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            id v30 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%@ is failed to upload to PFA backend", buf, 0xCu);
          }
          v27[0] = @"reason";
          v27[1] = @"group";
          v28[0] = @"PFA-backend is not available ";
          v28[1] = v9;
          v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2, v19);
          AnalyticsSendEvent();
        }

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v14);
  }
}

- (void)_uploadGMSDataToPFA:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUUID UUID];
  v5 = [v4 UUIDString];

  v6 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v3;
  id obj = [v3 unaggregatedMessages];
  id v8 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v11);
        long long v13 = objc_opt_new();
        id v14 = [v12 name];
        uint64_t v15 = -[PETService _createMetadataFrom:submissionId:messageName:typeId:](self, "_createMetadataFrom:submissionId:messageName:typeId:", v7, v5, v14, [v12 typeId]);
        [v13 setMetadata:v15];

        id v16 = objc_alloc((Class)PBDataReader);
        uint64_t v17 = [v12 rawBytes];
        id v18 = [v16 initWithData:v17];

        long long v19 = objc_opt_new();
        COMAPPLEPROACTIVEGMSGMSUberEventReadFrom();
        [v13 setUberEvent:v19];
        v20 = [v13 data];
        [v6 addObject:v20];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v9);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [v6 count];
    *(_DWORD *)buf = 134218242;
    id v31 = v21;
    __int16 v32 = 2112;
    CFStringRef v33 = @"com.apple.proactive.gms.PetUploadEvent";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Repackaged %lu GMS messages, ready for uploading to PFA with schema: %@", buf, 0x16u);
  }
  uint64_t v22 = [v7 metadata];
  long long v23 = [v22 messageGroup];
  [(PETService *)self _uploadBatchedDataToPFA:v6 schema:@"com.apple.proactive.gms.PetUploadEvent" messageGroup:v23];
}

- (id)_createMetadataFrom:(id)a3 submissionId:(id)a4 messageName:(id)a5 typeId:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_opt_new();
  long long v13 = [v11 metadata];
  id v14 = [v13 device];
  [v12 setDevice:v14];

  uint64_t v15 = [v11 metadata];
  [v12 setIsInternal:[v15 isInternal]];

  id v16 = [v11 metadata];
  [v12 setIsSeed:[v16 isSeed]];

  uint64_t v17 = [v11 metadata];
  [v12 setIsGm:[v17 isGm]];

  id v18 = [v11 metadata];
  [v12 setIsInternalCarry:[v18 isInternalCarry]];

  long long v19 = [v11 metadata];
  [v12 setUploadTime:[v19 uploadTime]];

  v20 = [v11 metadata];
  id v21 = [v20 build];
  [v12 setBuild:v21];

  uint64_t v22 = [v11 metadata];
  [v12 setConfigVersion:[v22 configVersion]];

  long long v23 = [v11 metadata];
  long long v24 = [v23 country];
  [v12 setCountry:v24];

  long long v25 = [v11 metadata];
  long long v26 = [v25 language];
  [v12 setLanguage:v26];

  long long v27 = [v11 metadata];
  long long v28 = [v27 messageGroup];
  [v12 setMessageGroup:v28];

  long long v29 = [v11 metadata];

  id v30 = [v29 platform];
  [v12 setPlatform:v30];

  [v12 setUploadService:3];
  [v12 setPseudoDeviceId:v10];

  [v12 setMessageName:v9];
  [v12 setTypeId:v6];

  return v12;
}

- (void)_uploadToParsecWithUpload:(id)a3
{
  id v3 = a3;
  id v4 = [v3 metadata];
  [v4 setUploadService:1];

  v5 = [v3 data];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sending upload data to Parsec.", buf, 2u);
  }
  uint64_t v6 = [v3 metadata];
  id v7 = [v6 messageGroup];
  unsigned int v8 = [v7 isEqualToString:@"_aggregated"];

  if (v8) {
    uint64_t v9 = 14;
  }
  else {
    uint64_t v9 = 7;
  }
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x2050000000;
  id v10 = (void *)qword_100010A08;
  uint64_t v28 = qword_100010A08;
  if (!qword_100010A08)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100005314;
    __int16 v32 = &unk_10000C4F0;
    CFStringRef v33 = &v25;
    sub_100005314((uint64_t)buf);
    id v10 = (void *)v26[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v25, 8);
  id v12 = [v11 alloc];
  id v13 = [v12 initWithType:v9 data:v5, v25];
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x2050000000;
  id v14 = (void *)qword_100010A18;
  uint64_t v28 = qword_100010A18;
  if (!qword_100010A18)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100005500;
    __int16 v32 = &unk_10000C4F0;
    CFStringRef v33 = &v25;
    sub_100005500((uint64_t)buf);
    id v14 = (void *)v26[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v25, 8);
  id v16 = [v15 sharedSession:v25];
  uint64_t v17 = v16;
  if (v13 && v16)
  {
    [v16 sendCustomFeedback:v13];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v3 metadata];
      long long v19 = [v18 messageGroup];
      id v20 = [v5 length];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Upload data has been sent to Parsec. messageGroup: %@; size: %lu",
        buf,
        0x16u);
    }
    v29[0] = @"message_group";
    id v21 = [v3 metadata];
    uint64_t v22 = [v21 messageGroup];
    v30[0] = v22;
    v29[1] = @"compressed_size";
    long long v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 length]);
    v30[1] = v23;
    v29[2] = @"upload_service";
    v30[2] = @"parsec";
    long long v24 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
    AnalyticsSendEvent();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to initialize Parsec feedback or session objects", buf, 2u);
  }
}

- (void)_uploadToFBFv2WithUpload:(id)a3
{
  id v3 = a3;
  id v4 = [v3 metadata];
  [v4 setUploadService:2];

  [v3 clearUnaggregatedMessages];
  [v3 clearAggregatedMessages];
  v5 = [v3 data];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sending upload data to FBFv2.", buf, 2u);
  }
  id v6 = [objc_alloc((Class)PETSchemaPETUpload) initWithData:v5];
  id v7 = [v6 wrapAsAnyEvent];
  if (v7)
  {
    unsigned int v8 = +[FLLogger sharedLogger];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100005954;
    v9[3] = &unk_10000C4A0;
    id v10 = v3;
    id v11 = v5;
    [v8 reportSiriInstrumentationEvent:v7 forBundleID:@"com.apple.proactive.eventtracker" completion:v9];
  }
}

- (BOOL)_writeUploadForTransparency:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v6 = [v4 aggregatedMessages];
  id v7 = [v6 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = +[PETEventTracker2 formattedTextForAggregatedMessage:*(void *)(*((void *)&v45 + 1) + 8 * i)];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v8);
  }

  if (![v5 count]) {
    goto LABEL_10;
  }
  id v12 = [@"proactive_event_tracker-" stringByAppendingString:@"aggregated"];
  v40 = _NSConcreteStackBlock;
  uint64_t v41 = 3221225472;
  v42 = sub_100006058;
  v43 = &unk_10000C478;
  id v44 = v5;
  int v13 = OSAWriteLogForSubmission();

  if (!v13)
  {
    char v29 = 0;
  }
  else
  {
LABEL_10:
    id v14 = [PETServiceUploadAssembler alloc];
    id v15 = [(PETEventTracker2 *)self->_tracker rootDir];
    id v16 = [(PETServiceUploadAssembler *)v14 initWithRootDir:v15];

    CFStringRef v33 = v16;
    if (v16)
    {
      uint64_t v17 = objc_opt_new();
      id v18 = [v4 metadata];
      long long v19 = [v18 messageGroup];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v31 = v4;
      id obj = [v4 unaggregatedMessages];
      id v20 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v36;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v36 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * (void)j);
            uint64_t v25 = [(PETServiceUploadAssembler *)v33 petConfig];
            long long v26 = +[PETEventTracker2 formattedTextForUnaggregatedMessage:v24 messageGroup:v19 config:v25];

            [v17 addObject:v26];
          }
          id v21 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
        }
        while (v21);
      }

      if ([v17 count])
      {
        uint64_t v27 = [v19 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
        uint64_t v28 = [@"proactive_event_tracker-" stringByAppendingString:v27];
        id v34 = v17;
        char v29 = OSAWriteLogForSubmission();
      }
      else
      {
        char v29 = 1;
      }
      id v4 = v31;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to initialize the upload assembler", buf, 2u);
      }
      char v29 = 0;
    }
  }
  return v29;
}

- (void)upload
{
  id v3 = [PETServiceUploadAssembler alloc];
  id v4 = [(PETEventTracker2 *)self->_tracker rootDir];
  v5 = [(PETServiceUploadAssembler *)v3 initWithRootDir:v4];

  if (v5)
  {
    id v6 = [(PETServiceUploadAssembler *)v5 assembleAggregatedUploadWithTracker:self->_tracker];
    if (v6) {
      [(PETService *)self _uploadWithUploadPackage:v6];
    }
    tracker = self->_tracker;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000062B8;
    v8[3] = &unk_10000C450;
    uint64_t v9 = v5;
    id v10 = self;
    [(PETEventTracker2 *)tracker enumerateMessageGroups:v8];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to initialize the upload assembler", buf, 2u);
  }
}

- (PETService)init
{
  v8.receiver = self;
  v8.super_class = (Class)PETService;
  v2 = [(PETService *)&v8 init];
  if (!v2)
  {
LABEL_6:
    v5 = v2;
    goto LABEL_10;
  }
  v2->_isInternalDevice = +[_PASDeviceInfo isInternalBuild];
  id v3 = (PETEventTracker2 *)[objc_alloc((Class)PETEventTracker2) initWithAsyncEnabled:0];
  tracker = v2->_tracker;
  v2->_tracker = v3;

  if (v2->_tracker)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PETService has been initialized", v7, 2u);
    }
    AnalyticsSendEvent();
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to initialize the tracker", v7, 2u);
  }
  AnalyticsSendEvent();
  v5 = 0;
LABEL_10:

  return v5;
}

+ (void)clearAllLogs
{
  id v3 = [objc_alloc((Class)PETEventTracker2) initWithAsyncEnabled:0];
  v2 = [v3 aggregateState];
  [v2 reset];

  [v3 clearLogStores];
}

+ (void)updateMobileAssetMetadataWithXPCActivity:(id)a3
{
  id v3 = (_xpc_activity_s *)a3;
  dispatch_queue_t v4 = dispatch_queue_create("PETAsset-notifications", 0);
  id v5 = [objc_alloc((Class)_PASAsset2) initWithAssetTypeDescriptorPath:@"/System/Library/AssetTypeDescriptors/com.apple.MobileAsset.AssetTypeDescriptor.ProactiveEventTrackerAssets.plist" defaultBundlePath:0 matchingKeysAndValues:0 notificationQueue:v4 logHandle:&_os_log_default];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Kicking off mobile asset metadata download.", buf, 2u);
  }
  if (!xpc_activity_set_state(v3, 4) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error setting XPC activity state to CONTINUE", buf, 2u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006650;
  v7[3] = &unk_10000C4C8;
  objc_super v8 = v3;
  id v6 = v3;
  [v5 downloadMetadataWithCompletion:v7];
}

@end