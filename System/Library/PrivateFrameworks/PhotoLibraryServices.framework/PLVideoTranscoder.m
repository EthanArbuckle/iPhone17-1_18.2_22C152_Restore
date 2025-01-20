@interface PLVideoTranscoder
+ (id)generatePosterFrameForAVAsset:(id)a3 maxSize:(CGSize)a4 error:(id *)a5;
+ (id)generatePosterFrameForVideoAtURL:(id)a3 maxSize:(CGSize)a4 error:(id *)a5;
+ (void)transcodeVideo:(id)a3 outputURL:(id)a4 presetName:(id)a5 outputFileType:(id)a6 metadata:(id)a7 completionHandler:(id)a8;
+ (void)transcodeVideoWithObjectBuilder:(id)a3 outputURL:(id)a4 startTime:(id *)a5 endTime:(id *)a6 presetName:(id)a7 outputFileType:(id)a8 metadata:(id)a9 completionHandler:(id)a10;
@end

@implementation PLVideoTranscoder

+ (id)generatePosterFrameForAVAsset:(id)a3 maxSize:(CGSize)a4 error:(id *)a5
{
  id v5 = a3;
  v6 = v5;
  if (v5) {
    [v5 duration];
  }

  return 0;
}

+ (id)generatePosterFrameForVideoAtURL:(id)a3 maxSize:(CGSize)a4 error:(id *)a5
{
  if (a3)
  {
    double height = a4.height;
    double width = a4.width;
    v9 = objc_msgSend(MEMORY[0x1E4F16330], "assetWithURL:");
    v10 = objc_msgSend(a1, "generatePosterFrameForAVAsset:maxSize:error:", v9, a5, width, height);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (void)transcodeVideoWithObjectBuilder:(id)a3 outputURL:(id)a4 startTime:(id *)a5 endTime:(id *)a6 presetName:(id)a7 outputFileType:(id)a8 metadata:(id)a9 completionHandler:(id)a10
{
  id v15 = a3;
  id v31 = a4;
  id v16 = a7;
  id v30 = a8;
  id v29 = a9;
  id v17 = a10;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__112933;
  v50 = __Block_byref_object_dispose__112934;
  id v51 = 0;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __134__PLVideoTranscoder_transcodeVideoWithObjectBuilder_outputURL_startTime_endTime_presetName_outputFileType_metadata_completionHandler___block_invoke;
  v45[3] = &unk_1E5875398;
  v45[4] = &v46;
  [v15 requestExportSessionWithExportPreset:v16 resultHandler:v45];
  v18 = (void *)v47[5];
  if (v18)
  {
    if (v17)
    {
      v19 = (void *)[v17 copy];

      v18 = (void *)v47[5];
    }
    else
    {
      v19 = 0;
    }
    v25 = [v18 presetName];
    v26 = [(id)v47[5] asset];
    v27 = (void *)MEMORY[0x1E4F16360];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __134__PLVideoTranscoder_transcodeVideoWithObjectBuilder_outputURL_startTime_endTime_presetName_outputFileType_metadata_completionHandler___block_invoke_2;
    v32[3] = &unk_1E58753E8;
    v40 = &v46;
    id v33 = v30;
    id v34 = v31;
    id v35 = v29;
    id v36 = v16;
    long long v41 = *(_OWORD *)&a6->var0;
    int64_t var3 = a6->var3;
    long long v43 = *(_OWORD *)&a5->var0;
    int64_t v44 = a5->var3;
    id v17 = v19;
    id v39 = v17;
    id v24 = v25;
    id v37 = v24;
    id v28 = v26;
    id v38 = v28;
    [v27 determineCompatibilityOfExportPreset:v24 withAsset:v28 outputFileType:v33 completionHandler:v32];
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    v21 = (void *)MEMORY[0x1E4F1C9E8];
    v22 = [NSString stringWithFormat:@" export session could not be created"];
    v23 = [v21 dictionaryWithObject:v22 forKey:*MEMORY[0x1E4F28568]];
    id v24 = [v20 errorWithDomain:@"PLVideoTranscoderErrorDomain" code:0 userInfo:v23];

    if (v17) {
      (*((void (**)(id, void, id))v17 + 2))(v17, 0, v24);
    }
  }

  _Block_object_dispose(&v46, 8);
}

void __134__PLVideoTranscoder_transcodeVideoWithObjectBuilder_outputURL_startTime_endTime_presetName_outputFileType_metadata_completionHandler___block_invoke(uint64_t a1, void *a2)
{
}

void __134__PLVideoTranscoder_transcodeVideoWithObjectBuilder_outputURL_startTime_endTime_presetName_outputFileType_metadata_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) supportedFileTypes];
    if ([v3 containsObject:*(void *)(a1 + 32)])
    {
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setOutputFileType:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setOutputURL:*(void *)(a1 + 40)];
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setShouldOptimizeForNetworkUse:1];
      if (*(void *)(a1 + 48)) {
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "setMetadata:");
      }
      if (([*(id *)(a1 + 56) isEqualToString:*MEMORY[0x1E4F15760]] & 1) != 0
        || [*(id *)(a1 + 56) isEqualToString:*MEMORY[0x1E4F15768]])
      {
        v4 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        id v5 = [MEMORY[0x1E4F16560] metadataItemFilterForSharing];
        [v4 setMetadataItemFilter:v5];
      }
      CMTime start = *(CMTime *)(a1 + 96);
      *(_OWORD *)&time1.start.value = *(_OWORD *)(a1 + 96);
      time1.start.epoch = *(void *)(a1 + 112);
      *(_OWORD *)&time2.start.value = *MEMORY[0x1E4F1FA48];
      time2.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      if (!CMTimeCompare(&time1.start, &time2.start))
      {
        v6 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) asset];
        v7 = v6;
        if (v6) {
          [v6 duration];
        }
        else {
          memset(&time1, 0, 24);
        }
        CMTime start = time1.start;
      }
      memset(&time1, 0, sizeof(time1));
      *(_OWORD *)&time2.start.value = *(_OWORD *)(a1 + 120);
      time2.start.epoch = *(void *)(a1 + 136);
      CMTime end = start;
      CMTimeRangeFromTimeToTime(&time1, &time2.start, &end);
      id v16 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      CMTimeRange time2 = time1;
      [v16 setTimeRange:&time2];
      uint64_t v17 = *(void *)(a1 + 88);
      v18 = *(void **)(*(void *)(v17 + 8) + 40);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __134__PLVideoTranscoder_transcodeVideoWithObjectBuilder_outputURL_startTime_endTime_presetName_outputFileType_metadata_completionHandler___block_invoke_3;
      v19[3] = &unk_1E58753C0;
      uint64_t v22 = v17;
      id v21 = *(id *)(a1 + 80);
      id v20 = *(id *)(a1 + 40);
      [v18 exportAsynchronouslyWithCompletionHandler:v19];

      v10 = 0;
      goto LABEL_18;
    }
    v11 = (void *)MEMORY[0x1E4F28C58];
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = [NSString stringWithFormat:@" outputFileType %@ not in supported file types %@", *(void *)(a1 + 32), v3];
    v14 = [v12 dictionaryWithObject:v13 forKey:*MEMORY[0x1E4F28568]];
    v10 = [v11 errorWithDomain:@"PLVideoTranscoderErrorDomain" code:0 userInfo:v14];
  }
  else
  {
    v3 = [NSString stringWithFormat:@" presentName %@ is not compatible with asset %@ and outputFileType %@", *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 32)];
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = v3;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v10 = [v8 errorWithDomain:@"PLVideoTranscoderErrorDomain" code:0 userInfo:v9];
  }
  uint64_t v15 = *(void *)(a1 + 80);
  if (v15) {
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v10);
  }
LABEL_18:
}

uint64_t __134__PLVideoTranscoder_transcodeVideoWithObjectBuilder_outputURL_startTime_endTime_presetName_outputFileType_metadata_completionHandler___block_invoke_3(void *a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1[6] + 8) + 40) status];
  if (v2 == 5)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = (void *)MEMORY[0x1E4F1C9E8];
    v6 = [NSString stringWithFormat:@"Error: Video Transcode Cancelled"];
    v7 = [v11 dictionaryWithObject:v6 forKey:*MEMORY[0x1E4F28568]];
    [v10 errorWithDomain:@"PLVideoTranscoderErrorDomain" code:1 userInfo:v7];
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2 != 4) {
      goto LABEL_6;
    }
    v3 = (void *)MEMORY[0x1E4F28C58];
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = NSString;
    v6 = [*(id *)(*(void *)(a1[6] + 8) + 40) error];
    v7 = [v6 localizedDescription];
    v8 = [v5 stringWithFormat:@"Error: Video Transcode failed : %@", v7];
    v9 = [v4 dictionaryWithObject:v8 forKey:*MEMORY[0x1E4F28568]];
    [v3 errorWithDomain:@"PLVideoTranscoderErrorDomain" code:0 userInfo:v9];
    objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  uint64_t v12 = a1[5];
  if (v12) {
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, a1[4]);
  }
  return MEMORY[0x1F4181820]();
}

+ (void)transcodeVideo:(id)a3 outputURL:(id)a4 presetName:(id)a5 outputFileType:(id)a6 metadata:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v14 videoAdjustments:0];
  if (v14) {
    [v14 duration];
  }
  else {
    memset(v23, 0, sizeof(v23));
  }
  long long v21 = *MEMORY[0x1E4F1FA48];
  uint64_t v22 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [a1 transcodeVideoWithObjectBuilder:v20 outputURL:v15 startTime:&v21 endTime:v23 presetName:v16 outputFileType:v17 metadata:v18 completionHandler:v19];
}

@end