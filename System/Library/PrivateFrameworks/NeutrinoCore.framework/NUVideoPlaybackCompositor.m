@interface NUVideoPlaybackCompositor
- (NSString)label;
- (void)fulfillVideoCompositionRequest:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation NUVideoPlaybackCompositor

- (void).cxx_destruct
{
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)fulfillVideoCompositionRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 videoCompositionInstruction];
  v6 = [NUVideoPlaybackFrameRequest alloc];
  v7 = [(NUVideoPlaybackFrameRequest *)v5 adjustmentComposition];
  v8 = [(NUVideoPlaybackFrameRequest *)v6 initWithComposition:v7];

  v9 = [[NUPriority alloc] initWithLevel:0];
  [(NURenderRequest *)v8 setPriority:v9];

  v10 = [(NURenderRequest *)v5 renderContext];

  if (v10)
  {
    v11 = [(NURenderRequest *)v5 renderContext];
    v12 = v8;
  }
  else
  {
    v11 = [(NURenderRequest *)v8 renderContext];
    v12 = v5;
  }
  [(NURenderRequest *)v12 setRenderContext:v11];

  v13 = [v4 sourceTrackIDs];
  uint64_t v14 = [v13 count];

  if (!v14)
  {
    v18 = @"No sourceTrackIDs";
LABEL_12:
    v19 = +[NUError unknownError:v18 object:0];
    [(NUVideoCompositor *)self failVideoCompositionRequest:v4 error:v19];

    goto LABEL_25;
  }
  v15 = [v4 renderContext];
  v16 = (__CVBuffer *)[v15 newPixelBuffer];

  if (!v16)
  {
    v18 = @"Unable to allocate destination buffer";
    goto LABEL_12;
  }
  [(NUVideoCompositor *)self setColorSpaceOfDestinationBuffer:v16 fromPrimarySourceBufferOfRequest:v4];
  if (+[NUGlobalSettings videoCompositorDebugMode] == 2) {
    NUDebugWatermarkCVPixelBuffer(v16, 2);
  }
  v17 = [(NUVideoPlaybackFrameRequest *)v5 videoRenderPrepareNode];
  [(NUVideoPlaybackFrameRequest *)v8 setVideoRenderPrepareNode:v17];

  [(NUVideoPlaybackFrameRequest *)v8 setDestinationBuffer:v16];
  cf = v16;
  if (v4)
  {
    [v4 compositionTime];
  }
  else
  {
    long long v59 = 0uLL;
    uint64_t v60 = 0;
  }
  long long v57 = v59;
  uint64_t v58 = v60;
  [(NUVideoPlaybackFrameRequest *)v8 setEvaluationTime:&v57];
  v20 = [(NURenderRequest *)v5 pipelineFilters];
  [(NURenderRequest *)v8 setPipelineFilters:v20];

  v21 = [(NUVideoCompositor *)self videoFramesFromRequest:v4];
  [(NUVideoPlaybackFrameRequest *)v8 setVideoFrames:v21];

  v22 = [(NUVideoCompositor *)self videoSampleSlicesFromRequest:v4];
  [(NUVideoPlaybackFrameRequest *)v8 setVideoSampleSlices:v22];

  v23 = [(NUVideoCompositor *)self videoMetadataSamplesFromRequest:v4];
  [(NUVideoPlaybackFrameRequest *)v8 setVideoMetadataSamples:v23];

  uint64_t v24 = [(NUVideoPlaybackFrameRequest *)v5 renderScale];
  -[NUVideoPlaybackFrameRequest setRenderScale:](v8, "setRenderScale:", v24, v25);
  v26 = [(NUVideoPlaybackFrameRequest *)v5 colorSpace];
  [(NUVideoPlaybackFrameRequest *)v8 setColorSpace:v26];

  [(NUVideoPlaybackFrameRequest *)v8 setIsDolbyVision:[(NUVideoPlaybackFrameRequest *)v5 isDolbyVision]];
  [(NUVideoPlaybackFrameRequest *)v5 playbackRate];
  -[NUVideoPlaybackFrameRequest setPlaybackRate:](v8, "setPlaybackRate:");
  v27 = [v4 renderContext];
  v28 = [v27 videoComposition];
  v29 = v28;
  if (v28)
  {
    [v28 frameDuration];
  }
  else
  {
    long long v55 = 0uLL;
    uint64_t v56 = 0;
  }
  long long v53 = v55;
  uint64_t v54 = v56;
  [(NUVideoPlaybackFrameRequest *)v8 setFrameDuration:&v53];

  [(NURenderRequest *)v8 setSampleMode:[(NURenderRequest *)v5 sampleMode]];
  [(NUVideoPlaybackFrameRequest *)v8 setPlaybackDirection:[(NUVideoCompositor *)self playbackDirection]];
  v42 = NSString;
  uint64_t v30 = [(NUVideoPlaybackCompositor *)self label];
  v31 = (void *)v30;
  if (!v30)
  {
    uint64_t v30 = [(NURenderRequest *)v5 name];
  }
  v43 = (void *)v30;
  v32 = [v4 renderContext];
  v33 = [v4 renderContext];
  [v33 size];
  uint64_t v35 = v34;
  v36 = [v4 renderContext];
  [v36 size];
  uint64_t v38 = v37;
  if (v4)
  {
    [v4 compositionTime];
    uint64_t v39 = v50;
    [v4 compositionTime];
    uint64_t v40 = v48;
  }
  else
  {
    uint64_t v40 = 0;
    uint64_t v39 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v47 = 0;
  }
  v41 = [v42 stringWithFormat:@"%@-avcontext(%x)-%.0fx%.0f-playback-t=%lld-%d", v43, (unsigned __int16)v32, v35, v38, v39, v40];
  [(NURenderRequest *)v8 setName:v41];

  if (!v31) {
  v45[0] = MEMORY[0x1E4F143A8];
  }
  v45[1] = 3221225472;
  v45[2] = __60__NUVideoPlaybackCompositor_fulfillVideoCompositionRequest___block_invoke;
  v45[3] = &unk_1E5D949A8;
  v45[4] = self;
  id v46 = v4;
  [(NUVideoPlaybackFrameRequest *)v8 submit:v45];
  CFRelease(cf);

LABEL_25:
}

void __60__NUVideoPlaybackCompositor_fulfillVideoCompositionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v10 = 0;
  v3 = [a2 result:&v10];
  id v4 = v10;
  uint64_t v5 = [v3 frame];
  if ([*(id *)(a1 + 32) testAndSetVideoCompositionRequestFinished:*(void *)(a1 + 40)])
  {
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5) {
      [v6 finishCompositionRequest:v7 withComposedVideoFrame:v5];
    }
    else {
      [v6 failVideoCompositionRequest:v7 error:v4];
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7134);
    }
    v8 = _NURenderLogger;
    if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "NUVideoPlaybackCompositor testAndSetVideoCompositionRequestFinished returned false. Skipping frame", v9, 2u);
    }
  }
}

@end