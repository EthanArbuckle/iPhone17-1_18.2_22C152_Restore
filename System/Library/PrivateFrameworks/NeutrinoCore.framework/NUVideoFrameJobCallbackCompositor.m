@interface NUVideoFrameJobCallbackCompositor
- (void)fulfillVideoCompositionRequest:(id)a3;
@end

@implementation NUVideoFrameJobCallbackCompositor

- (void)fulfillVideoCompositionRequest:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 videoCompositionInstruction];
  v6 = [v5 renderJob];
  v7 = [v5 colorSpace];
  v8 = [v4 sourceTrackIDs];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = [(NUVideoCompositor *)self videoFramesFromRequest:v4];
    v11 = [(NUVideoCompositor *)self videoMetadataSamplesFromRequest:v4];
    v12 = [(NUVideoCompositor *)self videoSampleSlicesFromRequest:v4];
    v13 = [v4 renderContext];
    v14 = (__CVBuffer *)[v13 newPixelBuffer];

    if (v14)
    {
      [(NUVideoCompositor *)self setColorSpaceOfDestinationBuffer:v14 fromPrimarySourceBufferOfRequest:v4];
      if (+[NUGlobalSettings videoCompositorDebugMode] == 2) {
        NUDebugWatermarkCVPixelBuffer(v14, 2);
      }
      if (v4) {
        [v4 compositionTime];
      }
      else {
        memset(v23, 0, sizeof(v23));
      }
      v21 = v10;
      id v22 = 0;
      int v17 = objc_msgSend(v6, "renderVideoFrames:videoMetadataSamples:videoSampleSlices:intoPixelBuffer:time:colorSpace:playbackDirection:error:", v10, v11, v12, v14, v23, v7, -[NUVideoCompositor playbackDirection](self, "playbackDirection"), &v22);
      id v18 = v22;
      if ([(NUVideoCompositor *)self testAndSetVideoCompositionRequestFinished:v4])
      {
        if (v17)
        {
          [(NUVideoCompositor *)self finishCompositionRequest:v4 withComposedVideoFrame:v14];
        }
        else
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_1203);
          }
          v20 = _NULogger;
          if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v18;
            _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Failed to export video: %@", buf, 0xCu);
          }
          [v4 finishWithError:v18];
        }
      }
      else
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_1203);
        }
        v19 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "NUVideoFrameJobCallbackCompositor testAndSetVideoCompositionRequestFinished returned false. Skipping frame", buf, 2u);
        }
      }
      CFRelease(v14);

      v10 = v21;
    }
    else
    {
      v16 = +[NUError unknownError:@"Unable to allocate destination buffer" object:0];
      [(NUVideoCompositor *)self failVideoCompositionRequest:v4 error:v16];
    }
  }
  else
  {
    v15 = +[NUError unknownError:@"No sourceTrackIDs" object:0];
    [(NUVideoCompositor *)self failVideoCompositionRequest:v4 error:v15];
  }
}

@end