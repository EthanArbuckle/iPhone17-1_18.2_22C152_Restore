@interface NUVideoPlaybackFrameRequest
- ($0AC6E346AE4835514AAA8AC86D8F4844)renderScale;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)evaluationTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration;
- (BOOL)isDolbyVision;
- (NSArray)videoSampleSlices;
- (NSDictionary)videoFrames;
- (NSDictionary)videoMetadataSamples;
- (NUColorSpace)colorSpace;
- (NURenderNode)videoRenderPrepareNode;
- (NUVideoPlaybackFrameRequest)initWithComposition:(id)a3;
- (__CVBuffer)destinationBuffer;
- (float)playbackRate;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (int64_t)playbackDirection;
- (void)dealloc;
- (void)setColorSpace:(id)a3;
- (void)setDestinationBuffer:(__CVBuffer *)a3;
- (void)setEvaluationTime:(id *)a3;
- (void)setFrameDuration:(id *)a3;
- (void)setIsDolbyVision:(BOOL)a3;
- (void)setPlaybackDirection:(int64_t)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setRenderScale:(id)a3;
- (void)setVideoFrames:(id)a3;
- (void)setVideoMetadataSamples:(id)a3;
- (void)setVideoRenderPrepareNode:(id)a3;
- (void)setVideoSampleSlices:(id)a3;
- (void)submit:(id)a3;
@end

@implementation NUVideoPlaybackFrameRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSampleSlices, 0);
  objc_storeStrong((id *)&self->_videoMetadataSamples, 0);
  objc_storeStrong((id *)&self->_videoFrames, 0);
  objc_storeStrong((id *)&self->_videoRenderPrepareNode, 0);

  objc_storeStrong((id *)&self->_colorSpace, 0);
}

- (void)setVideoSampleSlices:(id)a3
{
}

- (NSArray)videoSampleSlices
{
  return self->_videoSampleSlices;
}

- (void)setVideoMetadataSamples:(id)a3
{
}

- (NSDictionary)videoMetadataSamples
{
  return self->_videoMetadataSamples;
}

- (void)setVideoFrames:(id)a3
{
}

- (NSDictionary)videoFrames
{
  return self->_videoFrames;
}

- (void)setVideoRenderPrepareNode:(id)a3
{
}

- (NURenderNode)videoRenderPrepareNode
{
  return self->_videoRenderPrepareNode;
}

- (void)setPlaybackDirection:(int64_t)a3
{
  self->_playbackDirection = a3;
}

- (int64_t)playbackDirection
{
  return self->_playbackDirection;
}

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (void)setFrameDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_frameDuration.value = *(_OWORD *)&a3->var0;
  self->_frameDuration.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 256);
  return self;
}

- (void)setIsDolbyVision:(BOOL)a3
{
  self->_isDolbyVision = a3;
}

- (BOOL)isDolbyVision
{
  return self->_isDolbyVision;
}

- (void)setRenderScale:(id)a3
{
  self->_renderScale = ($F9703ADC4DD3124DE91DE417D7636CC9)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)renderScale
{
  p_renderScale = &self->_renderScale;
  int64_t numerator = self->_renderScale.numerator;
  int64_t denominator = p_renderScale->denominator;
  result.var1 = denominator;
  result.var0 = numerator;
  return result;
}

- (void)setEvaluationTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_evaluationTime.value = *(_OWORD *)&a3->var0;
  self->_evaluationTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)evaluationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 232);
  return self;
}

- (void)setDestinationBuffer:(__CVBuffer *)a3
{
}

- (__CVBuffer)destinationBuffer
{
  return self->_destinationBuffer;
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)submit:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NURenderRequest *)self renderContext];
  if ([v5 purpose] == 1)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_27192);
    }
    v6 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = NSString;
      v8 = v6;
      v9 = [v7 stringWithFormat:@"submitting a video render request on a still image purpose context"];
      *(_DWORD *)v26 = 138543362;
      *(void *)&v26[4] = v9;
      _os_log_impl(&dword_1A9892000, v8, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v26, 0xCu);

      uint64_t v10 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v10 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_27192);
        }
LABEL_9:
        v11 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v17 = (void *)MEMORY[0x1E4F29060];
          id v18 = specific;
          v19 = v11;
          v20 = [v17 callStackSymbols];
          v21 = [v20 componentsJoinedByString:@"\n"];
          *(_DWORD *)v26 = 138543618;
          *(void *)&v26[4] = specific;
          __int16 v27 = 2114;
          v28 = v21;
          _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v26, 0x16u);

LABEL_17:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_27192);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_9;
    }
    v22 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)MEMORY[0x1E4F29060];
      v19 = v22;
      v24 = [v23 callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)v26 = 138543362;
      *(void *)&v26[4] = v25;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v26, 0xCu);

      goto LABEL_17;
    }
LABEL_14:
    _NUAssertContinueHandler((uint64_t)"-[NUVideoPlaybackFrameRequest submit:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoPlaybackFrameRequest.m", 65, @"submitting a video render request on a still image purpose context", v12, v13, v14, v15, *(uint64_t *)v26);
  }

  [(NURenderRequest *)self submitGeneric:v4];
}

- (int64_t)mediaComponentType
{
  return 2;
}

- (id)newRenderJob
{
  v3 = [NUVideoPlaybackFrameJob alloc];

  return [(NUVideoPlaybackFrameJob *)v3 initWithVideoFrameRequest:self];
}

- (void)dealloc
{
  destinationBuffer = self->_destinationBuffer;
  if (destinationBuffer) {
    CFRelease(destinationBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)NUVideoPlaybackFrameRequest;
  [(NUVideoPlaybackFrameRequest *)&v4 dealloc];
}

- (NUVideoPlaybackFrameRequest)initWithComposition:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUVideoPlaybackFrameRequest;
  return [(NURenderRequest *)&v4 initWithComposition:a3];
}

@end