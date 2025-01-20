@interface SSRRPISampledAudioUploader
+ (id)_convertToMetadataWithRequestId:(id)a3 audioUUId:(id)a4 audioMetadata:(id)a5;
+ (void)cleanUpAudioOnAndBeforeDate:(id)a3 error:(id *)a4;
+ (void)purgeOldAudioData;
+ (void)removeAllAudioDataWithError:(id *)a3;
+ (void)uploadAudioFileWithRequestId:(id)a3 audioId:(id)a4 date:(id)a5 completion:(id)a6;
@end

@implementation SSRRPISampledAudioUploader

+ (id)_convertToMetadataWithRequestId:(id)a3 audioUUId:(id)a4 audioMetadata:(id)a5
{
  id v6 = a5;
  v7 = (objc_class *)MEMORY[0x263F6DBB8];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F38170]];
  uint64_t v11 = [v10 longLongValue];

  v12 = NSNumber;
  v13 = [v6 objectForKeyedSubscript:*MEMORY[0x263F38168]];
  v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "integerValue"));

  v15 = @"MHASRAUDIOCODEC_ALAC_MONO_16000HZ_VALUE";
  if (v14 && [v14 intValue] == 8000) {
    v15 = @"MHASRAUDIOCODEC_ALAC_MONO_8000HZ_VALUE";
  }
  [v9 setCodec:v15];
  v16 = (void *)[objc_alloc(MEMORY[0x263F6EED8]) initWithNSUUID:v8];

  [v9 setInteractionId:v16];
  v17 = [v6 objectForKeyedSubscript:*MEMORY[0x263F38150]];
  [v9 setLanguage:v17];

  [v9 setAudioCreatedTimestampMs:1000 * v11];

  return v9;
}

+ (void)purgeOldAudioData
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  v5 = [v4 dateByAddingUnit:16 value:-7 toDate:v3 options:0];
  id v8 = 0;
  [a1 cleanUpAudioOnAndBeforeDate:v5 error:&v8];
  id v6 = v8;
  +[SSRRequestIdToAudioIdMappingHelper removeMappingOnAndBefore:v5 completion:&__block_literal_global_5100];
  v7 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "+[SSRRPISampledAudioUploader purgeOldAudioData]";
    __int16 v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Purged audio data prior to %@", buf, 0x16u);
  }
}

void __47__SSRRPISampledAudioUploader_purgeOldAudioData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "+[SSRRPISampledAudioUploader purgeOldAudioData]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Purged mapping with err: %@", (uint8_t *)&v4, 0x16u);
  }
}

+ (void)removeAllAudioDataWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = [MEMORY[0x263F38068] sharedPreferences];
  v5 = [v4 getRPIAssistantAudioSamplingDirectory];

  __int16 v6 = [MEMORY[0x263F08850] defaultManager];
  [v6 removeItemAtPath:v5 error:a3];

  id v7 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "+[SSRRPISampledAudioUploader removeAllAudioDataWithError:]";
    __int16 v10 = 2114;
    __int16 v11 = v5;
    _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Deleting all items in path: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

+ (void)cleanUpAudioOnAndBeforeDate:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  __int16 v6 = [MEMORY[0x263F38068] sharedPreferences];
  id v7 = [v6 getRPIAssistantAudioSamplingDirectory];

  int v8 = [MEMORY[0x263F08850] defaultManager];
  v23 = a4;
  id v9 = [v8 contentsOfDirectoryAtPath:v7 error:a4];

  if (v9)
  {
    v22 = v7;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v16 = [MEMORY[0x263F380D0] defaultDateFormatter];
          v17 = [v16 dateFromString:v15];

          v18 = [MEMORY[0x263F38068] sharedPreferences];
          v19 = [v18 getRPIAssistantAudioSamplingDirectory];
          v20 = [v19 stringByAppendingPathComponent:v15];

          if ((unint64_t)([v17 compare:v5] + 1) <= 1)
          {
            v21 = [MEMORY[0x263F08850] defaultManager];
            [v21 removeItemAtPath:v20 error:v23];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }

    id v7 = v22;
  }
}

+ (void)uploadAudioFileWithRequestId:(id)a3 audioId:(id)a4 date:(id)a5 completion:(id)a6
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [MEMORY[0x263F380D0] defaultDateFormatter];
  v14 = [v13 stringFromDate:v11];

  uint64_t v15 = [MEMORY[0x263F38068] sharedPreferences];
  v16 = [v15 getRPIAssistantAudioSamplingDirectory];

  uint64_t v17 = [v16 stringByAppendingPathComponent:v14];

  v18 = [MEMORY[0x263F08850] defaultManager];
  id v80 = 0;
  v71 = (void *)v17;
  v19 = [v18 contentsOfDirectoryAtPath:v17 error:&v80];
  id v69 = v80;

  if (v19)
  {
    v66 = v19;
    v67 = v14;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v76 objects:v95 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v63 = v10;
      v64 = (void (**)(void, void, void, void))v12;
      id v62 = v11;
      v72 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)v77;
      long long v25 = @"pcm";
      id v70 = v20;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v77 != v24) {
            objc_enumerationMutation(v20);
          }
          long long v27 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          if ([v27 hasSuffix:v25]
            && [v27 rangeOfString:v9] != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v28 = v24;
            uint64_t v29 = v25;
            id v30 = v9;
            v31 = [v27 stringByDeletingPathExtension];
            [v31 stringByAppendingPathExtension:@"plist"];
            v33 = v32 = (void *)v23;
            v34 = [v71 stringByAppendingPathComponent:v33];

            uint64_t v23 = [NSDictionary dictionaryWithContentsOfFile:v34];

            long long v25 = v29;
            v35 = [v31 stringByAppendingPathExtension:v29];
            uint64_t v36 = [v71 stringByAppendingPathComponent:v35];

            if (!v23)
            {
              v68 = (void *)v36;
              v54 = [NSString stringWithFormat:@"metadata cannot be loaded with plist: %@", v34];
              v55 = (void *)MEMORY[0x263F087E8];
              v93 = @"reason";
              v94 = v54;
              v56 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
              uint64_t v49 = [v55 errorWithDomain:@"com.apple.speakerrecognition" code:1261 userInfo:v56];

              id v12 = v64;
              if (v64) {
                v64[2](v64, 0, 0, v49);
              }

              id v9 = v30;
              id v11 = v62;
              id v10 = v63;
              v19 = v66;
              id v48 = v70;
              goto LABEL_29;
            }

            v72 = (void *)v36;
            id v9 = v30;
            id v20 = v70;
            uint64_t v24 = v28;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v76 objects:v95 count:16];
        if (v22) {
          continue;
        }
        break;
      }
      v68 = (void *)v23;

      id v10 = v63;
      if (!v72)
      {
        id v11 = v62;
        id v12 = v64;
        goto LABEL_26;
      }
      v37 = [MEMORY[0x263F08850] defaultManager];
      char v38 = [v37 fileExistsAtPath:v72];

      id v12 = v64;
      if (v38)
      {
        v39 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v63];
        v40 = [a1 _convertToMetadataWithRequestId:v9 audioUUId:v39 audioMetadata:v68];
        v41 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];
        v42 = (void *)*MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          v43 = v42;
          v44 = [v41 UUIDString];
          v45 = [v39 UUIDString];
          *(_DWORD *)buf = 136315906;
          v82 = "+[SSRRPISampledAudioUploader uploadAudioFileWithRequestId:audioId:date:completion:]";
          __int16 v83 = 2112;
          v84 = v72;
          __int16 v85 = 2112;
          v86 = v44;
          __int16 v87 = 2112;
          v88 = v45;
          _os_log_impl(&dword_21C8A5000, v43, OS_LOG_TYPE_DEFAULT, "%s Uploading audioFilePath: %@ with requestId: %@ <-> audioId: %@", buf, 0x2Au);

          id v10 = v63;
        }
        v46 = [MEMORY[0x263F6C810] sharedAnalytics];
        v47 = [v46 defaultMessageStream];
        v73[0] = MEMORY[0x263EF8330];
        v73[1] = 3221225472;
        v73[2] = __83__SSRRPISampledAudioUploader_uploadAudioFileWithRequestId_audioId_date_completion___block_invoke;
        v73[3] = &unk_264429830;
        id v74 = v72;
        v75 = v64;
        id v48 = v72;
        [v47 enqueueLargeMessageObjectFromPath:v48 assetIdentifier:v39 requestIdentifier:v41 messageMetadata:v40 completion:v73];

        id v12 = v64;
        uint64_t v49 = (uint64_t)v69;
        id v11 = v62;
        goto LABEL_28;
      }
      v59 = [NSString stringWithFormat:@"file does not exists: %@", v72];
      v60 = (void *)MEMORY[0x263F087E8];
      v89 = @"reason";
      v90 = v59;
      v61 = [NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
      uint64_t v49 = [v60 errorWithDomain:@"com.apple.speakerrecognition" code:1262 userInfo:v61];

      v19 = v66;
      if (v64) {
        v64[2](v64, 0, 0, v49);
      }

      id v48 = v72;
      id v11 = v62;
    }
    else
    {

      v68 = 0;
LABEL_26:
      id v48 = [NSString stringWithFormat:@"no audio file is found for requestId: %@", v9];
      v57 = (void *)MEMORY[0x263F087E8];
      v91 = @"reason";
      id v92 = v48;
      v58 = [NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
      uint64_t v49 = [v57 errorWithDomain:@"com.apple.speakerrecognition" code:1262 userInfo:v58];

      if (v12) {
        (*((void (**)(id, void, void, uint64_t))v12 + 2))(v12, 0, 0, v49);
      }
LABEL_28:
      v19 = v66;
    }
LABEL_29:

    v53 = (void *)v49;
    v14 = v67;
  }
  else if (v12)
  {
    v50 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      v51 = v50;
      v52 = [v69 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v82 = "+[SSRRPISampledAudioUploader uploadAudioFileWithRequestId:audioId:date:completion:]";
      __int16 v83 = 2112;
      v84 = v52;
      _os_log_impl(&dword_21C8A5000, v51, OS_LOG_TYPE_DEFAULT, "%s Failed with error: %@", buf, 0x16u);
    }
    v53 = v69;
    (*((void (**)(id, void, void, id))v12 + 2))(v12, 0, 0, v69);
    v19 = 0;
  }
  else
  {
    v53 = v69;
  }
}

uint64_t __83__SSRRPISampledAudioUploader_uploadAudioFileWithRequestId_audioId_date_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(result + 16))(result, a2, *(void *)(a1 + 32), a3);
  }
  return result;
}

@end