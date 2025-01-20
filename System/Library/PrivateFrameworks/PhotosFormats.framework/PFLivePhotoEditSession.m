@interface PFLivePhotoEditSession
+ (id)_createTemporaryDirectory;
+ (id)temporaryDirectory;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_inputVideoDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_loadInputVideoDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime;
- (BOOL)_canRenderAtPlaybackTime;
- (CGAffineTransform)_inputVideoTransform;
- (CGSize)_inputImageSize;
- (CGSize)_inputVideoSize;
- (CGSize)_outputImageSize;
- (CGSize)_outputVideoSize;
- (CGSize)_outputVideoSizeForScale:(double)a3;
- (CGSize)outputImageSize;
- (CGSize)outputVideoSize;
- (CIImage)inputImage;
- (PFLivePhotoEditSession)init;
- (PFLivePhotoEditSession)initWithPhotoURL:(id)a3 videoURL:(id)a4 photoTime:(id *)a5 photoOrientation:(unsigned int)a6;
- (double)_inputVideoScale;
- (double)_targetScaleForTargetSize:(CGSize)a3;
- (float)audioVolume;
- (id)_inputImage;
- (id)_inputImageProperties;
- (id)_inputVideoTrack;
- (id)_loadInputImage;
- (id)_loadInputImageProperties;
- (id)_loadInputImageWithSubsampleFactor:(int64_t)a3;
- (id)_outputImage;
- (id)_outputImageProperties;
- (id)_outputVideoMetadata;
- (id)_processImage:(id)a3 scale:(double)a4 error:(id *)a5;
- (id)_scaledInputImageForTargetScale:(double)a3;
- (id)_temporaryURLOfType:(id)a3;
- (id)_videoCompositionForTargetSize:(CGSize)a3;
- (id)frameProcessor;
- (id)imageProperties;
- (id)inputImageForRenderScale:(double)a3;
- (id)outputImage;
- (unsigned)_inputOrientation;
- (unsigned)_loadInputImageOrientation;
- (unsigned)orientation;
- (void)_cancelCurrentExportIfNeeded;
- (void)_exportToDestination:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)_prepareForPlaybackWithTargetSize:(CGSize)a3 options:(id)a4 completionHandler:(id)a5;
- (void)_renderImageToURL:(id)a3 fileType:(id)a4 targetSize:(CGSize)a5 completionHandler:(id)a6;
- (void)_renderImageWithTargetSize:(CGSize)a3 completionHandler:(id)a4;
- (void)_renderVideoToURL:(id)a3 fileType:(id)a4 targetSize:(CGSize)a5 volume:(float)a6 completionHandler:(id)a7;
- (void)cancel;
- (void)dealloc;
- (void)exportToDestination:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)prepareForPlaybackWithTargetSize:(CGSize)a3 options:(id)a4 completionHandler:(id)a5;
- (void)setAudioVolume:(float)a3;
- (void)setFrameProcessor:(id)a3;
@end

@implementation PFLivePhotoEditSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_lastTemporaryVideoURL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectory, 0);
  objc_storeStrong(&self->_frameProcessor, 0);
  objc_storeStrong((id *)&self->_scaledOutputImage, 0);
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong((id *)&self->_subsampledInputImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_exportSession, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
  objc_storeStrong((id *)&self->_inputImageProperties, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);

  objc_storeStrong((id *)&self->_stateQueue, 0);
}

- (void)setAudioVolume:(float)a3
{
  self->_audioVolume = a3;
}

- (float)audioVolume
{
  return self->_audioVolume;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime
{
  objc_copyStruct(retstr, &self->_photoTime, 24, 1, 0);
  return result;
}

- (void)cancel
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PFLivePhotoEditSession_cancel__block_invoke;
  block[3] = &unk_1E5B2F5F0;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

uint64_t __32__PFLivePhotoEditSession_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelCurrentExportIfNeeded];
}

- (void)_exportToDestination:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = dispatch_group_create();
  self->_isExporting = 1;
  v12 = [MEMORY[0x1E4F29128] UUID];
  v13 = [v12 UUIDString];
  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = v13;

  dispatch_group_enter(v11);
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  char v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__80;
  v44[4] = __Block_byref_object_dispose__81;
  id v45 = 0;
  v15 = [v8 photoURL];
  v16 = [(id)*MEMORY[0x1E4F44410] identifier];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke;
  v40[3] = &unk_1E5B2DA58;
  v42 = v46;
  v43 = v44;
  v17 = v11;
  v41 = v17;
  double v18 = *MEMORY[0x1E4F1DB30];
  double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  -[PFLivePhotoEditSession _renderImageToURL:fileType:targetSize:completionHandler:](self, "_renderImageToURL:fileType:targetSize:completionHandler:", v15, v16, v40, *MEMORY[0x1E4F1DB30], v19);

  dispatch_group_enter(v17);
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__80;
  v36[4] = __Block_byref_object_dispose__81;
  id v37 = 0;
  v20 = [v8 videoURL];
  uint64_t v21 = *MEMORY[0x1E4F15AB0];
  float audioVolume = self->_audioVolume;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke_2;
  v32[3] = &unk_1E5B2DA58;
  v34 = v38;
  v35 = v36;
  v23 = v17;
  v33 = v23;
  *(float *)&double v24 = audioVolume;
  -[PFLivePhotoEditSession _renderVideoToURL:fileType:targetSize:volume:completionHandler:](self, "_renderVideoToURL:fileType:targetSize:volume:completionHandler:", v20, v21, v32, v18, v19, v24);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke_3;
  block[3] = &unk_1E5B2DA80;
  v28 = v46;
  v29 = v38;
  v30 = v44;
  v31 = v36;
  block[4] = self;
  id v27 = v10;
  id v25 = v10;
  dispatch_group_notify(v23, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);
}

void __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke_3(void *a1)
{
  v2 = *(void **)(*(void *)(a1[8] + 8) + 40);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = *(id *)(*(void *)(a1[9] + 8) + 40);
    if (!v3) {
      goto LABEL_8;
    }
  }
  v4 = [v3 domain];
  if ([v4 isEqualToString:@"com.apple.PhotosFormats"])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 3) {
      goto LABEL_9;
    }
  }
  else
  {
  }
LABEL_8:
  uint64_t v6 = a1[4];
  v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke_4;
  block[3] = &unk_1E5B2F5F0;
  block[4] = v6;
  dispatch_sync(v7, block);
LABEL_9:
  (*(void (**)(void))(a1[5] + 16))();
}

void __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 216) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 112);
  *(void *)(v1 + 112) = 0;
}

- (void)exportToDestination:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  stateQueue = self->_stateQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__PFLivePhotoEditSession_exportToDestination_options_completionHandler___block_invoke;
  v15[3] = &unk_1E5B2DA30;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(stateQueue, v15);
}

uint64_t __72__PFLivePhotoEditSession_exportToDestination_options_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelCurrentExportIfNeeded];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);

  return [v2 _exportToDestination:v3 options:v4 completionHandler:v5];
}

- (id)_temporaryURLOfType:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a3];
  uint64_t v4 = [v3 preferredFilenameExtension];

  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v6 = [v5 UUIDString];
  v7 = [v6 stringByAppendingPathExtension:v4];

  id v8 = [(id)objc_opt_class() temporaryDirectory];
  id v9 = [v8 stringByAppendingPathComponent:v7];
  id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];

  return v10;
}

- (id)_outputVideoMetadata
{
  uint64_t v3 = [(AVAsset *)self->_videoAsset metadata];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [v4 indexOfObjectPassingTest:&__block_literal_global_3882];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    [v4 removeObjectAtIndex:v5];
  }
  uint64_t v6 = [MEMORY[0x1E4F165A0] metadataItem];
  [v6 setIdentifier:*MEMORY[0x1E4F15D58]];
  [v6 setValue:self->_uniqueIdentifier];
  [v4 addObject:v6];

  return v4;
}

uint64_t __46__PFLivePhotoEditSession__outputVideoMetadata__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqual:*MEMORY[0x1E4F15D58]];

  return v3;
}

- (void)_renderVideoToURL:(id)a3 fileType:(id)a4 targetSize:(CGSize)a5 volume:(float)a6 completionHandler:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = self->_videoAsset;
  if (a6 > 0.0)
  {
LABEL_14:
    id v27 = objc_alloc(MEMORY[0x1E4F16360]);
    v28 = (void *)[v27 initWithAsset:v16 presetName:*MEMORY[0x1E4F156E8]];
    [v28 setOutputURL:v13];
    [v28 setOutputFileType:v14];
    uint64_t v21 = -[PFLivePhotoEditSession _videoCompositionForTargetSize:](self, "_videoCompositionForTargetSize:", width, height);
    [v28 setVideoComposition:v21];
    v29 = [(PFLivePhotoEditSession *)self _outputVideoMetadata];
    [v28 setMetadata:v29];

    if (a6 > 0.0 && a6 < 1.0)
    {
      id v44 = v13;
      v46 = v21;
      id v43 = v15;
      v41 = [MEMORY[0x1E4F16580] audioMix];
      v30 = [MEMORY[0x1E4F1CA48] array];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v42 = v16;
      v31 = +[PFMediaUtilities tracksWithMediaType:*MEMORY[0x1E4F15BA8] forAsset:v16];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v52 objects:v63 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v53;
        long long v48 = *MEMORY[0x1E4F1FA48];
        CMTimeEpoch v35 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v53 != v34) {
              objc_enumerationMutation(v31);
            }
            id v37 = [MEMORY[0x1E4F16588] audioMixInputParametersWithTrack:*(void *)(*((void *)&v52 + 1) + 8 * i)];
            *(float *)&double v38 = self->_audioVolume;
            *(_OWORD *)&start.value = v48;
            start.CMTimeEpoch epoch = v35;
            [v37 setVolume:&start atTime:v38];
            [v30 addObject:v37];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v52 objects:v63 count:16];
        }
        while (v33);
      }

      [v41 setInputParameters:v30];
      [v28 setAudioMix:v41];

      id v13 = v44;
      id v16 = v42;
      id v15 = v43;
      uint64_t v21 = v46;
    }
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __89__PFLivePhotoEditSession__renderVideoToURL_fileType_targetSize_volume_completionHandler___block_invoke;
    v49[3] = &unk_1E5B2F1D0;
    char v39 = v28;
    v50 = v39;
    id v51 = v15;
    [(AVAssetExportSession *)v39 exportAsynchronouslyWithCompletionHandler:v49];
    exportSession = self->_exportSession;
    self->_exportSession = v39;
    id v17 = v39;

    goto LABEL_28;
  }
  id v17 = [MEMORY[0x1E4F16590] composition];
  if (v16) {
    [(AVAsset *)v16 duration];
  }
  else {
    memset(&duration, 0, sizeof(duration));
  }
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  long long v47 = *(_OWORD *)&start.value;
  CMTimeEpoch epoch = start.epoch;
  CMTimeRangeMake(&v62, &start, &duration);
  id v60 = 0;
  *(_OWORD *)&start.value = v47;
  start.CMTimeEpoch epoch = epoch;
  BOOL v19 = +[PFMediaUtilities insertTimeRange:&v62 ofAsset:v16 atTime:&start intoMutableComposition:v17 error:&v60];
  id v20 = v60;
  uint64_t v21 = v20;
  if (v19)
  {
    id v45 = v20;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v22 = [(AVAssetExportSession *)v17 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v57 != v25) {
            objc_enumerationMutation(v22);
          }
          [(AVAssetExportSession *)v17 removeTrack:*(void *)(*((void *)&v56 + 1) + 8 * j)];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v24);
    }

    id v16 = (AVAsset *)v17;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LODWORD(start.value) = 138412546;
    *(CMTimeValue *)((char *)&start.value + 4) = (CMTimeValue)v16;
    LOWORD(start.flags) = 2112;
    *(void *)((char *)&start.flags + 2) = v21;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to insert tracks of asset: %@, error: %@", (uint8_t *)&start, 0x16u);
  }
  (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v21);
LABEL_28:
}

void __89__PFLivePhotoEditSession__renderVideoToURL_fileType_targetSize_volume_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) status] != 3)
  {
    uint64_t v2 = [*(id *)(a1 + 32) status];
    uint64_t v3 = *(void **)(a1 + 32);
    if (v2 == 4)
    {
      uint64_t v4 = [v3 error];
LABEL_6:
      uint64_t v5 = (void *)v4;
      goto LABEL_8;
    }
    if ([v3 status] == 5)
    {
      uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotosFormats" code:3 userInfo:0];
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_8:
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_outputImageProperties
{
  uint64_t v3 = [(PFLivePhotoEditSession *)self _inputImageProperties];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = *MEMORY[0x1E4F2FC20];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
  v7 = (void *)[v6 mutableCopy];

  [v7 setObject:self->_uniqueIdentifier forKeyedSubscript:*MEMORY[0x1E4F15530]];
  [v4 setObject:v7 forKeyedSubscript:v5];
  [v4 setObject:&unk_1EF7CA838 forKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
  uint64_t v8 = *MEMORY[0x1E4F2FD40];
  id v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
  id v10 = (void *)[v9 mutableCopy];

  [v10 setObject:&unk_1EF7CA838 forKeyedSubscript:*MEMORY[0x1E4F2FD70]];
  [v4 setObject:v10 forKeyedSubscript:v8];

  return v4;
}

- (double)_targetScaleForTargetSize:(CGSize)a3
{
  if (a3.width <= 0.0) {
    return 1.0;
  }
  double height = a3.height;
  if (a3.height <= 0.0) {
    return 1.0;
  }
  double width = a3.width;
  [(PFLivePhotoEditSession *)self _outputImageSize];
  if (v5 <= 0.0 || v6 <= 0.0) {
    return 1.0;
  }
  else {
    return fmin(width / v5, height / v6);
  }
}

- (void)_renderImageWithTargetSize:(CGSize)a3 completionHandler:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  -[PFLivePhotoEditSession _targetScaleForTargetSize:](self, "_targetScaleForTargetSize:", width, height);
  double v9 = v8;
  id v10 = -[PFLivePhotoEditSession _scaledInputImageForTargetScale:](self, "_scaledInputImageForTargetScale:");
  id v18 = 0;
  v11 = [(PFLivePhotoEditSession *)self _processImage:v10 scale:&v18 error:v9];
  id v12 = v18;
  id v13 = v12;
  if (v11)
  {
    renderQueue = self->_renderQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PFLivePhotoEditSession__renderImageWithTargetSize_completionHandler___block_invoke;
    block[3] = &unk_1E5B2EB18;
    block[4] = self;
    id v16 = v11;
    id v17 = v7;
    dispatch_async(renderQueue, block);
  }
  else
  {
    NSLog(&cfstr_FailedToProces_0.isa, v10, v12);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

void __71__PFLivePhotoEditSession__renderImageWithTargetSize_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = *(void **)(a1[4] + 104);
  [v3 extent];
  double v5 = (CGImage *)objc_msgSend(v4, "createCGImage:fromRect:format:colorSpace:", v3, *MEMORY[0x1E4F1E278], v2);
  CGColorSpaceRelease(v2);
  if (!v5)
  {
    NSLog(&cfstr_FailedToRender.isa, a1[5]);
    uint64_t v6 = a1[6];
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotosFormats" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
  (*(void (**)(void))(a1[6] + 16))();

  CGImageRelease(v5);
}

- (void)_renderImageToURL:(id)a3 fileType:(id)a4 targetSize:(CGSize)a5 completionHandler:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = [(PFLivePhotoEditSession *)self _outputImageProperties];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __82__PFLivePhotoEditSession__renderImageToURL_fileType_targetSize_completionHandler___block_invoke;
  v19[3] = &unk_1E5B2D9E8;
  id v20 = v11;
  id v21 = v12;
  id v22 = v14;
  id v23 = v13;
  id v15 = v13;
  id v16 = v14;
  id v17 = v12;
  id v18 = v11;
  -[PFLivePhotoEditSession _renderImageWithTargetSize:completionHandler:](self, "_renderImageWithTargetSize:completionHandler:", v19, width, height);
}

void __82__PFLivePhotoEditSession__renderImageToURL_fileType_targetSize_completionHandler___block_invoke(uint64_t a1, CGImage *a2, void *a3)
{
  id v9 = a3;
  if (a2)
  {
    double v5 = CGImageDestinationCreateWithURL(*(CFURLRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), 1uLL, 0);
    if (v5)
    {
      uint64_t v6 = v5;
      CGImageDestinationAddImage(v5, a2, *(CFDictionaryRef *)(a1 + 48));
      if (CGImageDestinationFinalize(v6))
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      else
      {
        double v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotosFormats" code:5 userInfo:0];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      CFRelease(v6);
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotosFormats" code:4 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (BOOL)_canRenderAtPlaybackTime
{
  return 0;
}

- (void)_prepareForPlaybackWithTargetSize:(CGSize)a3 options:(id)a4 completionHandler:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_group_create();
  id v12 = [v9 objectForKeyedSubscript:@"LivePhotoShouldRenderAtPlaybackTime"];
  int v13 = [v12 BOOLValue];

  if (v13) {
    BOOL v14 = [(PFLivePhotoEditSession *)self _canRenderAtPlaybackTime];
  }
  else {
    BOOL v14 = 0;
  }
  self->_isExporting = 1;
  id v15 = [MEMORY[0x1E4F29128] UUID];
  id v16 = [v15 UUIDString];
  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = v16;

  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__80;
  v56[4] = __Block_byref_object_dispose__81;
  id v57 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v55[3] = 0;
  uint64_t v49 = 0;
  v50 = (id *)&v49;
  uint64_t v51 = 0x3032000000;
  long long v52 = __Block_byref_object_copy__80;
  long long v53 = __Block_byref_object_dispose__81;
  id v54 = 0;
  float audioVolume = self->_audioVolume;
  long long v47 = *(_OWORD *)&self->_photoTime.value;
  int64_t epoch = self->_photoTime.epoch;
  dispatch_group_enter(v11);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke;
  v43[3] = &unk_1E5B2D920;
  id v45 = v55;
  v46 = v56;
  BOOL v19 = v11;
  id v44 = v19;
  -[PFLivePhotoEditSession _renderImageWithTargetSize:completionHandler:](self, "_renderImageWithTargetSize:completionHandler:", v43, width, height);
  if (v14)
  {
    objc_storeStrong(v50 + 5, self->_videoAsset);
    id v20 = -[PFLivePhotoEditSession _videoCompositionForTargetSize:](self, "_videoCompositionForTargetSize:", width, height);
  }
  else
  {
    dispatch_group_enter(v19);
    uint64_t v21 = *MEMORY[0x1E4F15AB0];
    id v22 = [(PFLivePhotoEditSession *)self _temporaryURLOfType:*MEMORY[0x1E4F15AB0]];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_2;
    v37[3] = &unk_1E5B2D998;
    v41 = &v49;
    id v23 = v22;
    id v38 = v23;
    v42 = v56;
    char v39 = v19;
    v40 = self;
    LODWORD(v24) = 1.0;
    -[PFLivePhotoEditSession _renderVideoToURL:fileType:targetSize:volume:completionHandler:](self, "_renderVideoToURL:fileType:targetSize:volume:completionHandler:", v23, v21, v37, width, height, v24);

    id v20 = 0;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_107;
  v27[3] = &unk_1E5B2D9C0;
  uint64_t v32 = v55;
  uint64_t v33 = &v49;
  long long v34 = v47;
  int64_t v35 = epoch;
  float v36 = audioVolume;
  id v28 = v20;
  v29 = self;
  id v30 = v10;
  v31 = v56;
  id v25 = v10;
  id v26 = v20;
  dispatch_group_notify(v19, MEMORY[0x1E4F14428], v27);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v56, 8);
}

void __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke(uint64_t a1, CGImage *a2, void *a3)
{
  id v6 = a3;
  if (a2) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGImageRetain(a2);
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = [MEMORY[0x1E4F16330] assetWithURL:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    id v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_3;
    v30[3] = &unk_1E5B2D948;
    id v31 = &unk_1EF7CAD60;
    long long v33 = *(_OWORD *)(a1 + 56);
    id v32 = *(id *)(a1 + 40);
    [v10 loadValuesAsynchronouslyForKeys:&unk_1EF7CAD60 completionHandler:v30];
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__80;
    id v28 = __Block_byref_object_dispose__81;
    id v29 = 0;
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = *(NSObject **)(v11 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_4;
    block[3] = &unk_1E5B2D970;
    id v23 = &v24;
    block[4] = v11;
    id v22 = *(id *)(a1 + 32);
    dispatch_sync(v12, block);
    if (v25[5])
    {
      int v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v14 = v25[5];
      id v20 = 0;
      char v15 = [v13 removeItemAtURL:v14 error:&v20];
      id v16 = v20;

      if ((v15 & 1) == 0)
      {
        id v17 = MEMORY[0x1E4F14500];
        id v18 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          BOOL v19 = [(id)v25[5] path];
          *(_DWORD *)buf = 138412290;
          int64_t v35 = v19;
          _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to delete temporary file: %@", buf, 0xCu);
        }
      }
    }
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_107(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v2)
  {
    uint64_t v3 = [v2 domain];
    if ([v3 isEqualToString:@"com.apple.PhotosFormats"]) {
      BOOL v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) code] == 3;
    }
    else {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  double v5 = *(CGImage **)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v5 && (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) ? (char v6 = 1) : (char v6 = v4), (v6 & 1) == 0))
  {
    uint64_t v7 = objc_alloc_init(PFLivePhotoPlaybackResult);
    [(PFLivePhotoPlaybackResult *)v7 setVideoAsset:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    [(PFLivePhotoPlaybackResult *)v7 setPhoto:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
    long long v13 = *(_OWORD *)(a1 + 80);
    uint64_t v14 = *(void *)(a1 + 96);
    [(PFLivePhotoPlaybackResult *)v7 setPhotoTime:&v13];
    [(PFLivePhotoPlaybackResult *)v7 setPhotoExifOrientation:1];
    uint64_t v8 = objc_alloc_init(PFLivePhotoPlaybackSettings);
    [(PFLivePhotoPlaybackSettings *)v8 setVideoComposition:*(void *)(a1 + 32)];
    LODWORD(v9) = *(_DWORD *)(a1 + 104);
    [(PFLivePhotoPlaybackSettings *)v8 setAudioVolume:v9];
    double v5 = *(CGImage **)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  CGImageRelease(v5);
  if (!v4)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(NSObject **)(v10 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_2_110;
    block[3] = &unk_1E5B2F5F0;
    block[4] = v10;
    dispatch_sync(v11, block);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_2_110(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 216) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 112);
  *(void *)(v1 + 112) = 0;
}

void __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        id v16 = 0;
        uint64_t v9 = [v8 statusOfValueForKey:v7 error:&v16];
        id v10 = v16;
        id v11 = v10;
        if (v9 == 3)
        {
          uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
          long long v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = 0;

          uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
          char v15 = *(void **)(v14 + 40);
          *(void *)(v14 + 40) = v11;

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_4(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 200));
  id v2 = (void *)a1[5];
  uint64_t v3 = (id *)(a1[4] + 200);

  objc_storeStrong(v3, v2);
}

- (void)_cancelCurrentExportIfNeeded
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_isExporting)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = [(AVAssetExportSession *)self->_exportSession outputURL];
      uint64_t v4 = [v3 path];
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "aborting export session at path %@", (uint8_t *)&v6, 0xCu);
    }
    [(CIContext *)self->_renderContext abort];
    [(AVAssetExportSession *)self->_exportSession cancelExport];
    exportSession = self->_exportSession;
    self->_exportSession = 0;

    self->_isExporting = 0;
  }
}

- (void)prepareForPlaybackWithTargetSize:(CGSize)a3 options:(id)a4 completionHandler:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v9 = a4;
  id v10 = a5;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PFLivePhotoEditSession_prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke;
  block[3] = &unk_1E5B2D8F8;
  CGFloat v17 = width;
  CGFloat v18 = height;
  block[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(stateQueue, block);
}

uint64_t __85__PFLivePhotoEditSession_prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelCurrentExportIfNeeded];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);

  return objc_msgSend(v2, "_prepareForPlaybackWithTargetSize:options:completionHandler:", v3, v4, v5, v6);
}

- (id)_processImage:(id)a3 scale:(double)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(PFLivePhotoFrameProcessingRequest);
  id v10 = objc_msgSend(v8, "imageByApplyingOrientation:", -[PFLivePhotoEditSession _inputOrientation](self, "_inputOrientation"));

  [(PFLivePhotoFrameProcessingRequest *)v9 setImage:v10];
  $95D729B680665BEAEFA1D6FCA8238556 photoTime = self->_photoTime;
  [(PFLivePhotoFrameProcessingRequest *)v9 setTime:&photoTime];
  [(PFLivePhotoFrameProcessingRequest *)v9 setRenderScale:a4];
  [(PFLivePhotoFrameProcessingRequest *)v9 setType:0];
  frameProcessor = (void (**)(id, PFLivePhotoFrameProcessingRequest *, id *))self->_frameProcessor;
  if (frameProcessor) {
    frameProcessor[2](frameProcessor, v9, a5);
  }
  else {
  id v12 = [(PFLivePhotoFrameProcessingRequest *)v9 image];
  }

  return v12;
}

- (CGSize)_outputVideoSizeForScale:(double)a3
{
  [(PFLivePhotoEditSession *)self _inputVideoScale];
  double v6 = v5;
  [(PFLivePhotoEditSession *)self _outputVideoSize];
  if (v6 > a3)
  {
    double v7 = round(a3 / v6 * v7);
    double v8 = round(a3 / v6 * v8);
  }
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (id)_videoCompositionForTargetSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PFLivePhotoEditSession *)self _inputVideoScale];
  double v7 = v6;
  -[PFLivePhotoEditSession _targetScaleForTargetSize:](self, "_targetScaleForTargetSize:", width, height);
  double v9 = fmin(v7, v8);
  id v10 = objc_alloc_init(PFLivePhotoFrameProcessingRequest);
  id v11 = (void *)MEMORY[0x1A6259AE0](self->_frameProcessor);
  id v12 = (void *)MEMORY[0x1E4F165B0];
  videoAsset = self->_videoAsset;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__PFLivePhotoEditSession__videoCompositionForTargetSize___block_invoke;
  v25[3] = &unk_1E5B2D8D0;
  double v29 = v9;
  double v30 = v7;
  id v27 = self;
  id v28 = v11;
  uint64_t v26 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = [v12 videoCompositionWithAsset:videoAsset applyingCIFiltersWithHandler:v25];
  [(PFLivePhotoEditSession *)self _outputVideoSizeForScale:v9];
  if (v18 > 0.0 && v17 > 0.0) {
    objc_msgSend(v16, "setRenderSize:");
  }
  long long v19 = [(PFLivePhotoEditSession *)self _inputVideoTrack];
  objc_msgSend(v16, "setSourceTrackIDForFrameTiming:", objc_msgSend(v19, "trackID"));
  if (v19)
  {
    [v19 minFrameDuration];
  }
  else
  {
    long long v23 = 0uLL;
    uint64_t v24 = 0;
  }
  long long v21 = v23;
  uint64_t v22 = v24;
  [v16 setFrameDuration:&v21];
  [v16 setColorPrimaries:*MEMORY[0x1E4F16250]];
  [v16 setColorTransferFunction:*MEMORY[0x1E4F162F0]];
  [v16 setColorYCbCrMatrix:*MEMORY[0x1E4F16310]];

  return v16;
}

void __57__PFLivePhotoEditSession__videoCompositionForTargetSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  if (v5 >= v6)
  {
    double v8 = [v3 sourceImage];
    [*(id *)(a1 + 32) setImage:v8];
  }
  else
  {
    CGFloat v7 = v5 / v6;
    double v8 = [v3 sourceImage];
    CGAffineTransformMakeScale(&v34, v7, v7);
    double v9 = [v8 imageByApplyingTransform:&v34];
    [*(id *)(a1 + 32) setImage:v9];
  }
  if (v4)
  {
    [v4 compositionTime];
  }
  else
  {
    long long v32 = 0uLL;
    uint64_t v33 = 0;
  }
  id v10 = *(void **)(a1 + 32);
  long long v30 = v32;
  uint64_t v31 = v33;
  [v10 setTime:&v30];
  [*(id *)(a1 + 32) setRenderScale:*(double *)(a1 + 56)];
  [*(id *)(a1 + 32) setType:1];
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v29 = 0;
  id v12 = (*(void (**)(void))(v11 + 16))();
  id v13 = 0;
  if (v12)
  {
    [v12 extent];
    if (v14 != *MEMORY[0x1E4F1DAD8] || v15 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
    {
      CGAffineTransformMakeTranslation(&v28, -v14, -v15);
      uint64_t v17 = [v12 imageByApplyingTransform:&v28];

      id v12 = (void *)v17;
    }
    double v18 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
    long long v19 = [v12 imageByColorMatchingWorkingSpaceToColorSpace:v18];

    long long v20 = [v19 imageByApplyingFilter:@"CIColorClamp" withInputParameters:0];

    long long v21 = [v20 imageByColorMatchingColorSpaceToWorkingSpace:v18];

    CGColorSpaceRelease(v18);
    uint64_t v22 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __57__PFLivePhotoEditSession__videoCompositionForTargetSize___block_invoke_2;
    v24[3] = &unk_1E5B2D8A8;
    id v25 = v4;
    id v26 = v21;
    uint64_t v27 = *(void *)(a1 + 40);
    id v23 = v21;
    dispatch_sync(v22, v24);
  }
  else
  {
    [v4 finishWithError:v13];
  }
}

uint64_t __57__PFLivePhotoEditSession__videoCompositionForTargetSize___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithImage:*(void *)(a1 + 40) context:*(void *)(*(void *)(a1 + 48) + 104)];
}

- (CGSize)_outputVideoSize
{
  [(PFLivePhotoEditSession *)self _outputImageSize];
  double v4 = v3;
  double v6 = v5;
  [(PFLivePhotoEditSession *)self _inputVideoScale];
  double v8 = v7 * v4;
  double v9 = v7 * v6;
  memset(&v14, 0, sizeof(v14));
  [(PFLivePhotoEditSession *)self _inputVideoTransform];
  CGAffineTransform v12 = v14;
  CGAffineTransformInvert(&v13, &v12);
  double v10 = round((v9 * v13.d + v13.b * v8 + self->_inputVideoScaleRoundingError.height) * v14.c+ v14.a * (v9 * v13.c + v13.a * v8 + self->_inputVideoScaleRoundingError.width));
  double v11 = round(v9);
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)outputVideoSize
{
  uint64_t v8 = 0;
  double v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  double v11 = &unk_1A42EF38E;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__PFLivePhotoEditSession_outputVideoSize__block_invoke;
  v7[3] = &unk_1E5B2F690;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(stateQueue, v7);
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.double height = v6;
  result.double width = v5;
  return result;
}

uint64_t __41__PFLivePhotoEditSession_outputVideoSize__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _outputVideoSize];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (CGSize)_outputImageSize
{
  uint64_t v3 = [(PFLivePhotoEditSession *)self _outputImage];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 extent];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    [(PFLivePhotoEditSession *)self _inputImageSize];
    double v6 = v9;
    double v8 = v10;
  }

  double v11 = v6;
  double v12 = v8;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)outputImageSize
{
  uint64_t v8 = 0;
  double v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  double v11 = &unk_1A42EF38E;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__PFLivePhotoEditSession_outputImageSize__block_invoke;
  v7[3] = &unk_1E5B2F690;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(stateQueue, v7);
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.double height = v6;
  result.double width = v5;
  return result;
}

uint64_t __41__PFLivePhotoEditSession_outputImageSize__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _outputImageSize];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (id)_outputImage
{
  outputImage = self->_outputImage;
  if (!outputImage)
  {
    uint64_t v4 = [(PFLivePhotoEditSession *)self _inputImage];
    if (v4)
    {
      id v9 = 0;
      uint64_t v5 = [(PFLivePhotoEditSession *)self _processImage:v4 scale:&v9 error:1.0];
      id v6 = v9;
      double v7 = self->_outputImage;
      self->_outputImage = v5;

      if (!self->_outputImage) {
        NSLog(&cfstr_FailedToProces.isa, v6);
      }
    }
    outputImage = self->_outputImage;
  }

  return outputImage;
}

- (id)outputImage
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__80;
  uint64_t v10 = __Block_byref_object_dispose__81;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__PFLivePhotoEditSession_outputImage__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __37__PFLivePhotoEditSession_outputImage__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _outputImage];

  return MEMORY[0x1F41817F8]();
}

- (double)_inputVideoScale
{
  double result = self->_inputVideoScale;
  if (result <= 0.0)
  {
    [(PFLivePhotoEditSession *)self _inputImageSize];
    double v5 = v4;
    double v7 = v6;
    [(PFLivePhotoEditSession *)self _inputVideoSize];
    double v9 = v8 / v5;
    double v11 = v10 / v7;
    double v12 = -(v10 - v8 / v5 * v7);
    double v13 = -(v8 - v11 * v5);
    double v14 = fabs(v12);
    double v15 = fabs(v13);
    BOOL v16 = v14 < v15;
    if (v14 >= v15) {
      double result = v11;
    }
    else {
      double result = v9;
    }
    uint64_t v17 = 168;
    if (v16) {
      uint64_t v17 = 176;
    }
    else {
      double v12 = v13;
    }
    self->_inputVideoScale = result;
    *(double *)((char *)&self->super.isa + v17) = v12;
  }
  return result;
}

- (CGAffineTransform)_inputVideoTransform
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  double v4 = [(PFLivePhotoEditSession *)self _inputVideoTrack];
  if (v4)
  {
    double v6 = v4;
    [v4 preferredTransform];
    double v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (CGSize)_inputVideoSize
{
  id v2 = [(PFLivePhotoEditSession *)self _inputVideoTrack];
  [v2 dimensions];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)_inputVideoTrack
{
  id v2 = +[PFMediaUtilities tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:self->_videoAsset];
  double v3 = [v2 firstObject];

  return v3;
}

- (CGSize)_inputImageSize
{
  id v2 = [(PFLivePhotoEditSession *)self _inputImage];
  [v2 extent];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)inputImageForRenderScale:(double)a3
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__80;
  double v11 = __Block_byref_object_dispose__81;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PFLivePhotoEditSession_inputImageForRenderScale___block_invoke;
  block[3] = &unk_1E5B2D880;
  block[4] = self;
  void block[5] = &v7;
  *(double *)&block[6] = a3;
  dispatch_sync(stateQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __51__PFLivePhotoEditSession_inputImageForRenderScale___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _scaledInputImageForTargetScale:*(double *)(a1 + 48)];

  return MEMORY[0x1F41817F8]();
}

- (id)_scaledInputImageForTargetScale:(double)a3
{
  int64_t v5 = 1;
  if (a3 < 1.0)
  {
    uint64_t v6 = vcvtmd_s64_f64(log2(1.0 / a3));
    if (v6 >= 3) {
      LOBYTE(v6) = 3;
    }
    int64_t v5 = 1 << v6;
  }
  subsampledInputImage = self->_subsampledInputImage;
  if (!subsampledInputImage || v5 != self->_subsampleFactor)
  {
    self->_subsampleFactor = v5;
    if (v5 == 1) {
      [(PFLivePhotoEditSession *)self _inputImage];
    }
    else {
    double v8 = [(PFLivePhotoEditSession *)self _loadInputImageWithSubsampleFactor:v5];
    }
    uint64_t v9 = self->_subsampledInputImage;
    self->_subsampledInputImage = v8;

    subsampledInputImage = self->_subsampledInputImage;
  }
  CGAffineTransformMakeScale(&v12, a3 / (1.0 / (double)v5), a3 / (1.0 / (double)v5));
  double v10 = [(CIImage *)subsampledInputImage imageByApplyingTransform:&v12];

  return v10;
}

- (id)_loadInputImageWithSubsampleFactor:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a3 >= 2)
  {
    uint64_t v6 = [NSNumber numberWithInteger:a3];
    [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F2FF58]];
  }
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(self->_inputImageSource, 0, (CFDictionaryRef)v5);
  if (ImageAtIndex)
  {
    CGImageRef v8 = ImageAtIndex;
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCGImage:ImageAtIndex];
    CFRelease(v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_loadInputImage
{
  return [(PFLivePhotoEditSession *)self _loadInputImageWithSubsampleFactor:1];
}

- (id)_inputImage
{
  inputImage = self->_inputImage;
  if (!inputImage)
  {
    id v4 = [(PFLivePhotoEditSession *)self _loadInputImage];
    id v5 = self->_inputImage;
    self->_inputImage = v4;

    inputImage = self->_inputImage;
  }

  return inputImage;
}

- (CIImage)inputImage
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__80;
  double v10 = __Block_byref_object_dispose__81;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PFLivePhotoEditSession_inputImage__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CIImage *)v3;
}

uint64_t __36__PFLivePhotoEditSession_inputImage__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _inputImage];

  return MEMORY[0x1F41817F8]();
}

- (id)_loadInputImageProperties
{
  CFDictionaryRef v2 = CGImageSourceCopyPropertiesAtIndex(self->_inputImageSource, 0, 0);

  return v2;
}

- (id)_inputImageProperties
{
  inputImageProperties = self->_inputImageProperties;
  if (!inputImageProperties)
  {
    id v4 = [(PFLivePhotoEditSession *)self _loadInputImageProperties];
    id v5 = self->_inputImageProperties;
    self->_inputImageProperties = v4;

    inputImageProperties = self->_inputImageProperties;
  }

  return inputImageProperties;
}

- (id)imageProperties
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__80;
  double v10 = __Block_byref_object_dispose__81;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PFLivePhotoEditSession_imageProperties__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __41__PFLivePhotoEditSession_imageProperties__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _inputImageProperties];

  return MEMORY[0x1F41817F8]();
}

- (void)setFrameProcessor:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PFLivePhotoEditSession_setFrameProcessor___block_invoke;
  v7[3] = &unk_1E5B2F1D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __44__PFLivePhotoEditSession_setFrameProcessor___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 184);
  *(void *)(v3 + 184) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 152);
  *(void *)(v7 + 152) = 0;
}

- (id)frameProcessor
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  double v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PFLivePhotoEditSession_frameProcessor__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  uint64_t v3 = (void *)MEMORY[0x1A6259AE0](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __40__PFLivePhotoEditSession_frameProcessor__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x1A6259AE0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 184));

  return MEMORY[0x1F41817F8]();
}

- (unsigned)_loadInputImageOrientation
{
  uint64_t v2 = [(PFLivePhotoEditSession *)self _inputImageProperties];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
  id v4 = v3;
  if (v3) {
    unsigned int v5 = [v3 intValue];
  }
  else {
    unsigned int v5 = 1;
  }

  return v5;
}

- (unsigned)_inputOrientation
{
  unsigned int result = self->_inputOrientation;
  if (!result)
  {
    unsigned int result = [(PFLivePhotoEditSession *)self _loadInputImageOrientation];
    self->_inputOrientation = result;
  }
  return result;
}

- (unsigned)orientation
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__PFLivePhotoEditSession_orientation__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__PFLivePhotoEditSession_orientation__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _inputOrientation];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_loadInputVideoDuration
{
  uint64_t result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_videoAsset;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result duration];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_inputVideoDuration
{
  p_var1 = &self[1].var1;
  if ((self[1].var3 & 0x100000000) == 0)
  {
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self _loadInputVideoDuration];
    *(_OWORD *)p_var1 = v5;
    *((void *)p_var1 + 2) = v6;
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)p_var1;
  retstr->var3 = *((void *)p_var1 + 2);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  double v10 = &unk_1A42EF38E;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PFLivePhotoEditSession_duration__block_invoke;
  block[3] = &unk_1E5B2F690;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(stateQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

double __34__PFLivePhotoEditSession_duration__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _inputVideoDuration];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(void *)(v2 + 48) = v5;
  return result;
}

- (void)dealloc
{
  inputImageSource = self->_inputImageSource;
  if (inputImageSource) {
    CFRelease(inputImageSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)PFLivePhotoEditSession;
  [(PFLivePhotoEditSession *)&v4 dealloc];
}

- (PFLivePhotoEditSession)initWithPhotoURL:(id)a3 videoURL:(id)a4 photoTime:(id *)a5 photoOrientation:(unsigned int)a6
{
  v25.receiver = self;
  v25.super_class = (Class)PFLivePhotoEditSession;
  id v9 = a4;
  CFURLRef v10 = (const __CFURL *)a3;
  uint64_t v11 = [(PFLivePhotoEditSession *)&v25 init];
  CGImageSourceRef v12 = CGImageSourceCreateWithURL(v10, 0);

  *((void *)v11 + 10) = v12;
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F16330], "assetWithURL:", v9, v25.receiver, v25.super_class);

  double v14 = (void *)*((void *)v11 + 3);
  *((void *)v11 + 3) = v13;

  long long v15 = *(_OWORD *)&a5->var0;
  *((void *)v11 + 9) = a5->var3;
  *(_OWORD *)(v11 + 56) = v15;
  *((_DWORD *)v11 + 22) = a6;
  dispatch_queue_t v16 = dispatch_queue_create("PFLivePhotoEditSession.state", 0);
  uint64_t v17 = (void *)*((void *)v11 + 1);
  *((void *)v11 + 1) = v16;

  dispatch_queue_t v18 = dispatch_queue_create("PFLivePhotoEditSession.render", 0);
  long long v19 = (void *)*((void *)v11 + 2);
  *((void *)v11 + 2) = v18;

  id v20 = objc_alloc(MEMORY[0x1E4F1E018]);
  uint64_t v21 = [v20 initWithOptions:MEMORY[0x1E4F1CC08]];
  uint64_t v22 = (void *)*((void *)v11 + 13);
  *((void *)v11 + 13) = v21;

  *((_DWORD *)v11 + 55) = 1065353216;
  if (*((void *)v11 + 10) && *((void *)v11 + 3)) {
    id v23 = v11;
  }
  else {
    id v23 = 0;
  }

  return v23;
}

- (PFLivePhotoEditSession)init
{
  return 0;
}

+ (id)_createTemporaryDirectory
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  unsigned int v3 = NSTemporaryDirectory();
  objc_super v4 = [v3 stringByAppendingPathComponent:@"live-photo-renders"];

  char v23 = 0;
  if ([v2 fileExistsAtPath:v4 isDirectory:&v23])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = [v2 enumeratorAtPath:v4];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          CFURLRef v10 = [v4 stringByAppendingPathComponent:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          id v18 = 0;
          char v11 = [v2 removeItemAtPath:v10 error:&v18];
          id v12 = v18;
          uint64_t v13 = v12;
          if ((v11 & 1) == 0) {
            NSLog(&cfstr_CouldnTRemoveT.isa, v10, v12);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v17 = 0;
    char v14 = [v2 createDirectoryAtPath:v4 withIntermediateDirectories:0 attributes:0 error:&v17];
    id v15 = v17;
    uint64_t v5 = v15;
    if ((v14 & 1) == 0) {
      NSLog(&cfstr_CouldnTCreateT.isa, v4, v15);
    }
  }

  return v4;
}

+ (id)temporaryDirectory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PFLivePhotoEditSession_temporaryDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (temporaryDirectory_onceToken != -1) {
    dispatch_once(&temporaryDirectory_onceToken, block);
  }
  id v2 = (void *)temporaryDirectory_s_temporaryDirectory;

  return v2;
}

uint64_t __44__PFLivePhotoEditSession_temporaryDirectory__block_invoke(uint64_t a1)
{
  temporaryDirectory_s_temporaryDirectory = [*(id *)(a1 + 32) _createTemporaryDirectory];

  return MEMORY[0x1F41817F8]();
}

@end