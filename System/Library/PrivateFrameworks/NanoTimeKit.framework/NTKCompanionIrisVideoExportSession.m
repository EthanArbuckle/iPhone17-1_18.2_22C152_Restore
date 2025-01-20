@interface NTKCompanionIrisVideoExportSession
- (AVAsset)video;
- (CGRect)crop;
- (CGSize)outputSize;
- (NSError)error;
- (NSURL)outputURL;
- (NTKCompanionIrisVideoExportSession)initWithVideo:(id)a3 crop:(CGRect)a4 outputSize:(CGSize)a5 bitrate:(unint64_t)a6 outputURL:(id)a7;
- (id)_makeReader;
- (id)_makeWriter;
- (int64_t)status;
- (unint64_t)bitrate;
- (void)_makeReader;
- (void)_makeWriter;
- (void)exportAsynchronouslyWithCompletion:(id)a3;
- (void)setError:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation NTKCompanionIrisVideoExportSession

- (NTKCompanionIrisVideoExportSession)initWithVideo:(id)a3 crop:(CGRect)a4 outputSize:(CGSize)a5 bitrate:(unint64_t)a6 outputURL:(id)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v11 = a4.size.height;
  CGFloat v12 = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v17 = a3;
  id v18 = a7;
  v39.receiver = self;
  v39.super_class = (Class)NTKCompanionIrisVideoExportSession;
  v19 = [(NTKCompanionIrisVideoExportSession *)&v39 init];
  if (v19)
  {
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.NanoTimeKitCompanion.exportQ", 0);
    exportQueue = v19->_exportQueue;
    v19->_exportQueue = (OS_dispatch_queue *)v20;

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.NanoTimeKitCompanion.encodeQ", 0);
    encodeQueue = v19->_encodeQueue;
    v19->_encodeQueue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v19->_video, a3);
    v19->_crop.origin.CGFloat x = x;
    v19->_crop.origin.CGFloat y = y;
    v19->_crop.size.CGFloat width = v12;
    v19->_crop.size.CGFloat height = v11;
    v19->_outputSize.CGFloat width = width;
    v19->_outputSize.CGFloat height = height;
    v19->_bitrate = a6;
    uint64_t v24 = [v18 copy];
    outputURL = v19->_outputURL;
    v19->_outputURL = (NSURL *)v24;

    if (CGRectEqualToRect(v19->_crop, *MEMORY[0x1E4F1DB20]))
    {
      double v26 = v19->_outputSize.width;
      double v27 = v19->_outputSize.height;
      double v28 = NTKPhotosVideoDimensions(v19->_video);
      double v30 = v27 * v28 / v26;
      double v31 = v26 * v29 / v27;
      if (v28 / v29 > v26 / v27) {
        double v30 = v29;
      }
      else {
        double v31 = v28;
      }
      double v32 = (v28 - v31) * 0.5;
      double v33 = (v29 - v30) * 0.5;
      v19->_crop.origin.CGFloat x = v32;
      v19->_crop.origin.CGFloat y = v33;
      v19->_crop.size.CGFloat width = v31;
      v19->_crop.size.CGFloat height = v30;
    }
    else
    {
      double v32 = v19->_crop.origin.x;
      double v33 = v19->_crop.origin.y;
      double v31 = v19->_crop.size.width;
      double v30 = v19->_crop.size.height;
    }
    v19->_crop.origin.CGFloat x = denormalizeIfNecessary(v17, v32, v33, v31, v30);
    v19->_crop.origin.CGFloat y = v34;
    v19->_crop.size.CGFloat width = v35;
    v19->_crop.size.CGFloat height = v36;
    error = v19->_error;
    v19->_error = 0;

    v19->_status = 1;
  }

  return v19;
}

- (void)exportAsynchronouslyWithCompletion:(id)a3
{
  id v4 = a3;
  exportQueue = self->_exportQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke;
  v7[3] = &unk_1E62C2290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(exportQueue, v7);
}

void __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) _makeReader];
  id v4 = [*v2 _makeWriter];
  [v3 startReading];
  [v4 startWriting];
  long long v34 = *MEMORY[0x1E4F1FA48];
  uint64_t v35 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v4 startSessionAtSourceTime:&v34];
  v5 = [v3 outputs];
  id v6 = [v5 firstObject];

  v7 = [v4 inputs];
  id v8 = [v7 firstObject];

  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v10 = [*v2 error];

  id v11 = *v2;
  if (v10)
  {
    [v11 setStatus:4];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [v11 setStatus:2];
    uint64_t v12 = *((void *)*v2 + 2);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke_2;
    v27[3] = &unk_1E62C6348;
    dispatch_queue_t v22 = v8;
    id v28 = v8;
    v23 = v6;
    id v29 = v6;
    id v13 = v4;
    id v14 = *v2;
    id v30 = v13;
    id v31 = v14;
    id v15 = v3;
    id v32 = v15;
    v16 = v9;
    double v33 = v16;
    [v28 requestMediaDataWhenReadyOnQueue:v12 usingBlock:v27];
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    id v17 = [*v2 error];

    if (v17)
    {
      id v18 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke_cold_1(v2);
      }

      [v15 cancelReading];
      [v13 cancelWriting];
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke_3;
      v24[3] = &unk_1E62C04F0;
      v24[4] = *v2;
      id v25 = v13;
      v19 = v16;
      double v26 = v19;
      [v25 finishWritingWithCompletionHandler:v24];
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    }
    id v8 = v22;
    dispatch_queue_t v20 = [*(id *)(a1 + 32) error];
    if (v20) {
      uint64_t v21 = 4;
    }
    else {
      uint64_t v21 = 3;
    }
    [*(id *)(a1 + 32) setStatus:v21];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = v23;
  }
}

intptr_t __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke_2(uint64_t a1)
{
  intptr_t result = [*(id *)(a1 + 32) isReadyForMoreMediaData];
  if (result)
  {
    char v3 = 0;
    do
    {
      while (1)
      {
        uint64_t v4 = [*(id *)(a1 + 40) copyNextSampleBuffer];
        if (v4) {
          break;
        }
        if ([*(id *)(a1 + 64) status] == 2) {
          [*(id *)(a1 + 32) markAsFinished];
        }
        id v6 = [*(id *)(a1 + 64) error];
        [*(id *)(a1 + 56) setError:v6];

        char v3 = 1;
        if (([*(id *)(a1 + 32) isReadyForMoreMediaData] & 1) == 0) {
          goto LABEL_13;
        }
      }
      v5 = (const void *)v4;
      [*(id *)(a1 + 32) appendSampleBuffer:v4];
      CFRelease(v5);
      if ([*(id *)(a1 + 48) status] != 1)
      {
        v7 = [*(id *)(a1 + 48) error];
        [*(id *)(a1 + 56) setError:v7];

        goto LABEL_13;
      }
      intptr_t result = [*(id *)(a1 + 32) isReadyForMoreMediaData];
    }
    while ((result & 1) != 0);
    if ((v3 & 1) == 0) {
      return result;
    }
LABEL_13:
    id v8 = *(NSObject **)(a1 + 72);
    return dispatch_semaphore_signal(v8);
  }
  return result;
}

intptr_t __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) error];
  [*(id *)(a1 + 32) setError:v2];

  char v3 = *(NSObject **)(a1 + 48);

  return dispatch_semaphore_signal(v3);
}

- (id)_makeReader
{
  v40[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(NTKCompanionIrisVideoExportSession *)self video];
  uint64_t v4 = compositionAssetForVideo(v3);

  if (v4)
  {
    v5 = [v4 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
    if ([v5 count])
    {
      uint64_t v6 = *MEMORY[0x1E4F24D20];
      v35[0] = *MEMORY[0x1E4F24D70];
      v35[1] = v6;
      v36[0] = &unk_1F16E4848;
      v36[1] = MEMORY[0x1E4F1CC08];
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
      id v8 = [MEMORY[0x1E4F163A8] assetReaderVideoCompositionOutputWithVideoTracks:v5 videoSettings:v7];
      [(NTKCompanionIrisVideoExportSession *)self crop];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      [(NTKCompanionIrisVideoExportSession *)self outputSize];
      double v18 = v17;
      double v20 = v19;
      uint64_t v21 = [(NTKCompanionIrisVideoExportSession *)self video];
      dispatch_queue_t v22 = cropCompositionFor(v4, v21, v10, v12, v14, v16, v18, v20);
      [v8 setVideoComposition:v22];

      id v34 = 0;
      v23 = [MEMORY[0x1E4F16378] assetReaderWithAsset:v4 error:&v34];
      id v24 = v34;
      if (v24)
      {
        [(NTKCompanionIrisVideoExportSession *)self setError:v24];
        id v25 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          [(NTKCompanionIrisVideoExportSession *)(uint64_t)v4 _makeReader];
        }

        id v26 = 0;
      }
      else
      {
        [v23 addOutput:v8];
        id v26 = v23;
      }
    }
    else
    {
      id v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      v38 = @"No video tracks.";
      id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      id v32 = [v30 errorWithDomain:@"NTKCompananionIrisVideoExportSession" code:1 userInfo:v31];
      [(NTKCompanionIrisVideoExportSession *)self setError:v32];

      v7 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[NTKCompanionIrisVideoExportSession _makeReader]();
      }
      id v26 = 0;
    }
  }
  else
  {
    double v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    v40[0] = @"Cannot create composition asset";
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    id v29 = [v27 errorWithDomain:@"NTKCompananionIrisVideoExportSession" code:1 userInfo:v28];
    [(NTKCompanionIrisVideoExportSession *)self setError:v29];

    v5 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NTKCompanionIrisVideoExportSession _makeReader](self);
    }
    id v26 = 0;
  }

  return v26;
}

- (id)_makeWriter
{
  v35[1] = *MEMORY[0x1E4F143B8];
  [(NTKCompanionIrisVideoExportSession *)self outputSize];
  if (v3 == 0.0 || ([(NTKCompanionIrisVideoExportSession *)self outputSize], v4 == 0.0))
  {
    v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v35[0] = @"Invalid output size.";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    v7 = [v5 errorWithDomain:@"NTKCompananionIrisVideoExportSession" code:2 userInfo:v6];
    [(NTKCompanionIrisVideoExportSession *)self setError:v7];

    id v8 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NTKCompanionIrisVideoExportSession _makeWriter](self);
    }
    id v9 = 0;
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F16220];
    v33[0] = *MEMORY[0x1E4F16228];
    uint64_t v12 = *MEMORY[0x1E4F16300];
    v32[0] = v11;
    v32[1] = v12;
    double v13 = NSNumber;
    [(NTKCompanionIrisVideoExportSession *)self outputSize];
    CGFloat v14 = objc_msgSend(v13, "numberWithDouble:");
    v33[1] = v14;
    v32[2] = *MEMORY[0x1E4F162A0];
    double v15 = NSNumber;
    [(NTKCompanionIrisVideoExportSession *)self outputSize];
    double v17 = [v15 numberWithDouble:v16];
    v33[2] = v17;
    v32[3] = *MEMORY[0x1E4F16268];
    v30[0] = *MEMORY[0x1E4F161D8];
    double v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NTKCompanionIrisVideoExportSession bitrate](self, "bitrate"));
    v31[0] = v18;
    v31[1] = &unk_1F16E4860;
    uint64_t v19 = *MEMORY[0x1E4F162D0];
    v30[1] = *MEMORY[0x1E4F162A8];
    v30[2] = v19;
    v30[3] = *MEMORY[0x1E4F16298];
    uint64_t v20 = *MEMORY[0x1E4F16290];
    v31[2] = *MEMORY[0x1E4F162C8];
    v31[3] = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];
    v33[3] = v21;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:4];

    dispatch_queue_t v22 = [MEMORY[0x1E4F163C0] assetWriterInputWithMediaType:*MEMORY[0x1E4F15C18] outputSettings:v8];
    v23 = (void *)MEMORY[0x1E4F163B8];
    id v24 = [(NTKCompanionIrisVideoExportSession *)self outputURL];
    uint64_t v25 = *MEMORY[0x1E4F15AB0];
    id v29 = 0;
    id v26 = [v23 assetWriterWithURL:v24 fileType:v25 error:&v29];
    id v27 = v29;

    if (v27)
    {
      [(NTKCompanionIrisVideoExportSession *)self setError:v27];
      id v28 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[NTKCompanionIrisVideoExportSession _makeWriter](self);
      }

      id v9 = 0;
    }
    else
    {
      [v26 addInput:v22];
      [v26 setShouldOptimizeForNetworkUse:1];
      id v9 = v26;
    }
  }

  return v9;
}

- (AVAsset)video
{
  return self->_video;
}

- (CGRect)crop
{
  double x = self->_crop.origin.x;
  double y = self->_crop.origin.y;
  double width = self->_crop.size.width;
  double height = self->_crop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)outputSize
{
  double width = self->_outputSize.width;
  double height = self->_outputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)bitrate
{
  return self->_bitrate;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_encodeQueue, 0);

  objc_storeStrong((id *)&self->_exportQueue, 0);
}

void __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke_cold_1(id *a1)
{
  v1 = [*a1 error];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1(&dword_1BC5A9000, v2, v3, "Error during export: %@", v4, v5, v6, v7, v8);
}

- (void)_makeReader
{
  uint8_t v8 = [a2 error];
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "_makeReader: cannot create AVAssetReader for composition %@, error: %@\n", v4, v5, v6, v7, 2u);
}

- (void)_makeWriter
{
  v1 = [a1 outputURL];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "_makeWriter: cannnot create AVAssetWriter for url %@, error: %@\n", v4, v5, v6, v7, v8);
}

@end