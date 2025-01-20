@interface AVURLAsset
+ (BOOL)rc_updateFile:(id)a3 withTranscriptionData:(id)a4 error:(id *)a5;
+ (id)rc_preciseTimingAssetWithURL:(id)a3;
+ (id)rc_transcriptionDataForURL:(id)a3;
- (BOOL)rc_transcriptionDataExists;
- (id)rc_transcriptionData;
@end

@implementation AVURLAsset

+ (BOOL)rc_updateFile:(id)a3 withTranscriptionData:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[RCMutableMovie movieWithURL:v7 error:a5];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 tracksWithMediaType:AVMediaTypeAudio];
    v12 = [v11 na_filter:&stru_1000083D0];

    v13 = [v12 firstObject];
    if (v13)
    {
      v36 = v12;
      v37 = (uint64_t *)a5;
      v38 = v8;
      v39 = v7;
      v14 = objc_opt_new();
      v47[0] = +[AVMetadataItem identifierForKey:@"tsrp" keySpace:AVMetadataKeySpaceISOUserData];
      v47[1] = +[AVMetadataItem identifierForKey:@"com.apple.VoiceMemos.tsrp" keySpace:AVMetadataKeySpaceQuickTimeMetadata];
      v15 = +[NSSet setWithObjects:v47 count:2];
      for (uint64_t i = 1; i != -1; --i)

      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v35 = v13;
      v17 = [v13 metadata];
      id v18 = [v17 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v41;
        do
        {
          for (j = 0; j != v19; j = (char *)j + 1)
          {
            if (*(void *)v41 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
            v23 = [v22 identifier];
            unsigned __int8 v24 = [v15 containsObject:v23];

            if ((v24 & 1) == 0) {
              [v14 addObject:v22];
            }
          }
          id v19 = [v17 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v19);
      }

      id v8 = v38;
      id v7 = v39;
      if (v38)
      {
        v25 = sub_100005D30((int)[v39 isQuickTime]);
        id v26 = v38;
        id v27 = objc_alloc_init((Class)AVMutableMetadataItem);
        v28 = +[AVMetadataItem keyForIdentifier:v25];
        [v27 setKey:v28];

        v29 = +[AVMetadataItem keySpaceForIdentifier:v25];
        [v27 setKeySpace:v29];

        [v27 setIdentifier:v25];
        [v27 setValue:v26];

        [v27 setDataType:kCMMetadataBaseDataType_RawData];
        [v14 addObject:v27];
      }
      v13 = v35;
      [v35 setMetadata:v14];
      unsigned __int8 v30 = [v10 rc_writeMovieHeaderWithOptions:0 error:v37];
      BOOL v31 = v30;
      if (v37 && (v30 & 1) == 0)
      {
        v32 = OSLogForCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_1000062E0(v37, v32);
        }
      }
      v12 = v36;
    }
    else
    {
      if (!a5)
      {
        BOOL v31 = 0;
        goto LABEL_26;
      }
      uint64_t v33 = RCVoiceMemosErrorDomain;
      NSErrorUserInfoKey v45 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v46 = @"No audio tracks exist";
      v14 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      +[NSError errorWithDomain:v33 code:-1 userInfo:v14];
      BOOL v31 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_26:
    goto LABEL_27;
  }
  BOOL v31 = 0;
LABEL_27:

  return v31;
}

+ (id)rc_preciseTimingAssetWithURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  id v8 = AVURLAssetPreferPreciseDurationAndTimingKey;
  v9 = &__kCFBooleanTrue;
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v6 = [v4 initWithURL:v3 options:v5];

  return v6;
}

+ (id)rc_transcriptionDataForURL:(id)a3
{
  id v3 = a3;
  id v4 = +[AVMovie movieWithURL:v3 options:0];
  v5 = [v4 tracksWithMediaType:AVMediaTypeAudio];
  id v6 = [v5 na_filter:&stru_100008410];

  id v7 = [v6 firstObject];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 metadata];
    v10 = sub_100005D30((int)[v3 isQuickTime]);
    v11 = sub_100005F88((uint64_t)v9, (uint64_t)v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)rc_transcriptionData
{
  id v3 = [(AVURLAsset *)self rc_audioTracks];
  id v4 = [v3 firstObject];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 metadata];
    id v7 = [(AVURLAsset *)self URL];
    id v8 = sub_100005D30((int)[v7 isQuickTime]);
    v9 = sub_100005F88((uint64_t)v6, (uint64_t)v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)rc_transcriptionDataExists
{
  id v3 = [(AVURLAsset *)self rc_audioTracks];
  id v4 = [v3 firstObject];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 metadata];
    id v7 = [(AVURLAsset *)self URL];
    id v8 = sub_100005D30((int)[v7 isQuickTime]);
    v9 = +[AVMetadataItem metadataItemsFromArray:v6 filteredByIdentifier:v8];
    BOOL v10 = [v9 count] != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

@end