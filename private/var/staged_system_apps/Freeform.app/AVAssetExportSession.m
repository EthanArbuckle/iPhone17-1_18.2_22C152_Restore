@interface AVAssetExportSession
+ (id)crl_exportSessionWithAsset:(id)a3 presetName:(id)a4 preserveFrameDuration:(BOOL)a5;
@end

@implementation AVAssetExportSession

+ (id)crl_exportSessionWithAsset:(id)a3 presetName:(id)a4 preserveFrameDuration:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = sub_10026ABC8(v8);
  if (sub_10026AE64(v9))
  {
    v10 = +[CRLCapabilities currentCapabilities];
    unsigned int v11 = [v10 hasHEVCHardwareEncoding];

    if (!v11)
    {
      int v14 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E7128);
      }
      v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101093E30(v14, v15);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E7148);
      }
      v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v16, v14);
      }
      v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[AVAssetExportSession(CRLAdditions) crl_exportSessionWithAsset:presetName:preserveFrameDuration:]");
      v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/AVAssetExportSession_CRLAdditions.m"];
      +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:32 isFatal:0 description:"Should not have been able to request conversion to HEVC on hardware without encoding support!"];

      if (sub_10026AE74(v9)) {
        uint64_t v12 = 3;
      }
      else {
        uint64_t v12 = 2;
      }
      int v13 = 0;
      goto LABEL_17;
    }
    if (+[CRLMovieCompatibilityChecker assetContainsVideoTracksWithAlpha:v7])
    {
      uint64_t v12 = v9;
      int v13 = 1;
LABEL_17:
      uint64_t v19 = sub_10026ACE0((id)v12, v13);

      id v8 = (id)v19;
    }
  }
  v20 = +[AVAssetExportSession exportSessionWithAsset:v7 presetName:v8];
  [v20 setShouldOptimizeForNetworkUse:1];
  if (!a5 && (sub_10026ADBC(v8) & 1) == 0)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v21 = [v7 tracksWithMediaType:AVMediaTypeVideo];
    id v22 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v32;
      while (2)
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * i) nominalFrameRate];
          if (v26 > 30.0)
          {
            v27 = +[AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:v7];
            CMTimeMake(&v30, 1, 30);
            CMTime v29 = v30;
            [v27 setFrameDuration:&v29];
            [v27 setSourceTrackIDForFrameTiming:0];
            [v20 setVideoComposition:v27];

            goto LABEL_30;
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
LABEL_30:
  }

  return v20;
}

@end