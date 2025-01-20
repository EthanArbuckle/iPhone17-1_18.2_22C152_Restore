@interface RPAudioMixUtility
+ (id)exportPresetForAVAsset:(id)a3;
+ (id)tempFileURL;
+ (id)videoCodecTypeForAVAsset:(id)a3;
+ (void)mixAudioForMovie:(id)a3 finalMovieURL:(id)a4 outputFileType:(id)a5 withCompletionHandler:(id)a6;
+ (void)mixAudioForMovie:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation RPAudioMixUtility

+ (void)mixAudioForMovie:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[RPAudioMixUtility tempFileURL];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001FF60;
  v9[3] = &unk_100085708;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v5;
  id v7 = v10;
  id v8 = v5;
  +[RPAudioMixUtility mixAudioForMovie:v6 finalMovieURL:v7 outputFileType:AVFileTypeMPEG4 withCompletionHandler:v9];
}

+ (void)mixAudioForMovie:(id)a3 finalMovieURL:(id)a4 outputFileType:(id)a5 withCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9)
  {
    if (dword_100099BB8 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
        __int16 v40 = 1024;
        int v41 = 33;
        __int16 v42 = 2112;
        id v43 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d movieURL  %@", buf, 0x1Cu);
      }
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
        __int16 v40 = 1024;
        int v41 = 34;
        __int16 v42 = 2112;
        id v43 = v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d finalMovieURL %@", buf, 0x1Cu);
      }
    }
    id v29 = v9;
    v13 = +[AVAsset assetWithURL:v9];
    v26 = +[RPAudioMixUtility exportPresetForAVAsset:v13];
    id v14 = [objc_alloc((Class)AVAssetExportSession) initWithAsset:v13 presetName:v26];
    id v28 = v10;
    [v14 setOutputURL:v10];
    id v27 = v11;
    [v14 setOutputFileType:v11];
    v15 = [v13 tracksWithMediaType:AVMediaTypeAudio];
    v16 = +[NSMutableArray array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v17 = v15;
    id v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v23 = +[AVMutableAudioMixInputParameters audioMixInputParameters];
          [v23 setTrackID:[v22 trackID]];
          [v16 addObject:v23];
        }
        id v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v19);
    }

    v24 = +[AVMutableAudioMix audioMix];
    [v24 setInputParameters:v16];
    [v14 setAudioMix:v24];
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
      __int16 v40 = 1024;
      int v41 = 63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d starting export session", buf, 0x12u);
    }
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100020434;
    v30[3] = &unk_100084EB8;
    id v31 = v14;
    id v32 = v12;
    id v25 = v14;
    [v25 exportAsynchronouslyWithCompletionHandler:v30];

    id v10 = v28;
    id v9 = v29;
    id v11 = v27;
  }
  else
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051490();
    }
    v13 = +[NSError _rpUserErrorForCode:-5818 userInfo:0];
    (*((void (**)(id, void *))v12 + 2))(v12, v13);
  }
}

+ (id)tempFileURL
{
  v2 = +[NSFileManager defaultManager];
  v3 = [v2 _srTempPath];
  v4 = +[NSString stringWithFormat:@"%@/RPReplay_Final", v3];

  id v5 = +[NSDate date];
  [v5 timeIntervalSince1970];
  id v7 = +[NSString stringWithFormat:@"%ld", (uint64_t)v6];

  id v8 = +[NSString stringWithFormat:@"%@%@%@", v4, v7, @".mp4"];
  id v9 = +[NSURL fileURLWithPath:v8];

  return v9;
}

+ (id)videoCodecTypeForAVAsset:(id)a3
{
  v3 = [a3 tracksWithMediaType:AVMediaTypeVideo];
  if ([v3 count] != (id)1)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051590();
    }
    id v5 = 0;
    v4 = 0;
    goto LABEL_14;
  }
  v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v4 formatDescriptions];
  if ([v5 count] != (id)1)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051510();
    }
LABEL_14:
    id v8 = 0;
    goto LABEL_6;
  }
  double v6 = [v5 objectAtIndexedSubscript:0];
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(v6);

  id v8 = +[NSString stringWithUTF8String:sub_10003BF0C(MediaSubType)];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446722;
    id v12 = "+[RPAudioMixUtility videoCodecTypeForAVAsset:]";
    __int16 v13 = 1024;
    int v14 = 111;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d videoCodecType=%@", (uint8_t *)&v11, 0x1Cu);
  }
LABEL_6:
  id v9 = v8;

  return v9;
}

+ (id)exportPresetForAVAsset:(id)a3
{
  v4 = AVAssetExportPresetHighestQuality;
  id v5 = +[RPAudioMixUtility videoCodecTypeForAVAsset:a3];
  double v6 = v5;
  if (v5)
  {
    if (![v5 isEqualToString:AVVideoCodecTypeHEVC])
    {
      if ([v6 isEqualToString:AVVideoCodecTypeH264])
      {
        if (dword_100099BB8 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_7;
        }
        int v11 = 136446466;
        id v12 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
        __int16 v13 = 1024;
        int v14 = 124;
        id v9 = " [INFO] %{public}s:%d AVAssetExportPresetHighestQuality for H264";
        uint32_t v10 = 18;
      }
      else
      {
        if (dword_100099BB8 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_7;
        }
        int v11 = 136446722;
        id v12 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
        __int16 v13 = 1024;
        int v14 = 127;
        __int16 v15 = 2112;
        v16 = v6;
        id v9 = " [INFO] %{public}s:%d videoCodecType=%@, use default preset";
        uint32_t v10 = 28;
      }
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, v10);
      goto LABEL_7;
    }
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446466;
      id v12 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
      __int16 v13 = 1024;
      int v14 = 121;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AVAssetExportPresetHEVCHighestQuality for HEVC", (uint8_t *)&v11, 0x12u);
    }
    id v7 = AVAssetExportPresetHEVCHighestQuality;

    v4 = v7;
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100051610();
  }
LABEL_7:

  return v4;
}

@end