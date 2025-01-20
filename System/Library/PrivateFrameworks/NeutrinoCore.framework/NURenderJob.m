@interface NURenderJob
+ (void)flushCache;
- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize;
- ($0AC6E346AE4835514AAA8AC86D8F4844)renderScale;
- ($EB925890EBEBD6850280D1FB85A9BD43)_atomicCancel;
- (AVAudioMix)outputAudioMix;
- (AVComposition)outputVideo;
- (AVVideoComposition)outputVideoComposition;
- (BOOL)_cancelCoalescedJob;
- (BOOL)_checkForMemoizedResult;
- (BOOL)_shouldCancelCoalescedJob;
- (BOOL)_shouldWaitForDependentJobs;
- (BOOL)cancelCoalescedJob;
- (BOOL)complete:(id *)a3;
- (BOOL)failed;
- (BOOL)isAborted;
- (BOOL)isCanceled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)prepare:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)renderVideoFrames:(id)a3 videoMetadataSamples:(id)a4 videoSampleSlices:(id)a5 intoPixelBuffer:(__CVBuffer *)a6 time:(id *)a7 colorSpace:(id)a8 playbackDirection:(int64_t)a9 error:(id *)a10;
- (BOOL)requiresVideoComposition;
- (BOOL)runStage:(int64_t)a3 error:(id *)a4;
- (BOOL)shouldWriteCanceledJob;
- (BOOL)shouldWriteJobDebugFile;
- (BOOL)shouldWriteTombstone;
- (BOOL)succeeded;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (BOOL)wantsOutputVideo;
- (BOOL)wantsOutputVideoFrame;
- (BOOL)wantsPrepareNodeCached;
- (BOOL)wantsRenderNodeCached;
- (BOOL)wantsRenderStage;
- (CIImage)outputImage;
- (NSArray)dependentJobs;
- (NSDate)jobCreationDate;
- (NSError)error;
- (NSMutableString)additionalDebugInfo;
- (NSString)nodeCacheAtStartOfJob;
- (NUComposition)composition;
- (NUDevice)device;
- (NUExtentPolicy)extentPolicy;
- (NUGeometrySpaceMap)resolvedSpaceMap;
- (NUImageGeometry)fullSizeGeometry;
- (NUImageGeometry)outputGeometry;
- (NUPriority)priority;
- (NURenderJob)init;
- (NURenderJob)initWithRequest:(id)a3;
- (NURenderNode)prepareNode;
- (NURenderNode)renderNode;
- (NURenderPipeline)renderPipeline;
- (NURenderRequest)request;
- (NURenderStatistics)statistics;
- (NUScalePolicy)scalePolicy;
- (OS_dispatch_group)replyGroup;
- (id)cacheKey;
- (id)debugFilePath;
- (id)description;
- (id)evaluateComposition:(id)a3 pipeline:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)evaluateOutputGeometry:(id *)a3;
- (id)evaluateRenderDependencies:(id *)a3;
- (id)generateVideoComposition:(id *)a3;
- (id)memoizationCacheKey;
- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3;
- (id)pipelineForComposition:(id)a3 error:(id *)a4;
- (id)prepareNodeWithPipelineState:(id)a3 error:(id *)a4;
- (id)renderImage:(id)a3 into:(id)a4 colorSpace:(id)a5 roi:(id)a6 imageSize:(id)a7 alpha:(const unint64_t *)a8 error:(id *)a9;
- (id)renderImage:(id)a3 into:(id)a4 colorSpace:(id)a5 roi:(id)a6 imageSize:(id)a7 error:(id *)a8;
- (id)renderNodeWithPipelineState:(id)a3 error:(id *)a4;
- (id)renderer:(id *)a3;
- (id)result;
- (id)validateComposition:(id *)a3;
- (int)rendererType;
- (int64_t)_nextStageForStage:(int64_t)a3;
- (int64_t)currentStage;
- (int64_t)resolvedSampleMode:(int64_t)a3;
- (int64_t)willRun;
- (unint64_t)jobNumber;
- (void)_cancel;
- (void)_didPrepare;
- (void)_emitSignpostEventType:(unsigned __int8)a3 forStage:(int64_t)a4 duration:(double)a5;
- (void)_finish;
- (void)_memoizeResult:(id)a3;
- (void)_notifyCanceled:(int64_t)a3;
- (void)_notifyStageTransition:(int64_t)a3;
- (void)_pause;
- (void)_reply:(id)a3;
- (void)_resume;
- (void)_run:(int64_t)a3;
- (void)_setCurrentStage:(int64_t)a3;
- (void)abortStage:(int64_t)a3;
- (void)addCancelObserver:(id)a3 queue:(id)a4 block:(id)a5;
- (void)addStageObserver:(id)a3 queue:(id)a4 block:(id)a5;
- (void)cancel;
- (void)didRun;
- (void)fail:(id)a3;
- (void)finalize:(BOOL)a3;
- (void)finish;
- (void)pause;
- (void)removeObserver:(id)a3;
- (void)renderJobDebugCanceled;
- (void)renderJobDebugInit;
- (void)renderJobDebugResponded;
- (void)reply:(id)a3;
- (void)respond;
- (void)resume;
- (void)run:(int64_t)a3;
- (void)runSynchronous;
- (void)runToPrepareSynchronous;
- (void)setComposition:(id)a3;
- (void)setDependentJobs:(id)a3;
- (void)setFullSizeGeometry:(id)a3;
- (void)setNodeCacheAtStartOfJob:(id)a3;
- (void)setOutputAudioMix:(id)a3;
- (void)setOutputGeometry:(id)a3;
- (void)setOutputImage:(id)a3;
- (void)setOutputVideo:(id)a3;
- (void)setOutputVideoComposition:(id)a3;
- (void)setPrepareNode:(id)a3;
- (void)setRenderNode:(id)a3;
- (void)setRenderPipeline:(id)a3;
- (void)setRenderScale:(id)a3;
- (void)setReplyGroup:(id)a3;
- (void)setResolvedSpaceMap:(id)a3;
- (void)setShouldWriteJobDebugFile:(BOOL)a3;
- (void)writeRenderDebugFileToDisk;
- (void)writeRenderJobDebugTombstone;
@end

@implementation NURenderJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputAudioMix, 0);
  objc_storeStrong((id *)&self->_outputVideoComposition, 0);
  objc_storeStrong((id *)&self->_outputVideo, 0);
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong((id *)&self->_fullSizeGeometry, 0);
  objc_storeStrong((id *)&self->_resolvedSpaceMap, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_nodeCacheAtStartOfJob, 0);
  objc_storeStrong((id *)&self->_replyGroup, 0);
  objc_storeStrong((id *)&self->_outputGeometry, 0);
  objc_storeStrong((id *)&self->_renderNode, 0);
  objc_storeStrong((id *)&self->_prepareNode, 0);
  objc_storeStrong((id *)&self->_dependentJobs, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_memoizationCacheKey, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_jobCreationDate, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_observatory, 0);

  objc_storeStrong((id *)&self->_stateQueue, 0);
}

- (void)setOutputAudioMix:(id)a3
{
}

- (AVAudioMix)outputAudioMix
{
  return self->_outputAudioMix;
}

- (void)setOutputVideoComposition:(id)a3
{
}

- (AVVideoComposition)outputVideoComposition
{
  return self->_outputVideoComposition;
}

- (void)setOutputVideo:(id)a3
{
}

- (AVComposition)outputVideo
{
  return self->_outputVideo;
}

- (void)setOutputImage:(id)a3
{
}

- (CIImage)outputImage
{
  return self->_outputImage;
}

- (void)setFullSizeGeometry:(id)a3
{
}

- (NUImageGeometry)fullSizeGeometry
{
  return self->_fullSizeGeometry;
}

- (void)setResolvedSpaceMap:(id)a3
{
}

- (NUGeometrySpaceMap)resolvedSpaceMap
{
  return self->_resolvedSpaceMap;
}

- (void)setRenderScale:(id)a3
{
  self->_renderScale = ($F9703ADC4DD3124DE91DE417D7636CC9)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)renderScale
{
  int64_t denominator = self->_renderScale.denominator;
  int64_t numerator = self->_renderScale.numerator;
  result.var1 = denominator;
  result.var0 = numerator;
  return result;
}

- (void)setRenderPipeline:(id)a3
{
}

- (NURenderPipeline)renderPipeline
{
  return self->_renderPipeline;
}

- (void)setComposition:(id)a3
{
}

- (NUComposition)composition
{
  return self->_composition;
}

- (int)rendererType
{
  return self->_rendererType;
}

- (NUDevice)device
{
  return self->_device;
}

- (void)setNodeCacheAtStartOfJob:(id)a3
{
}

- (NSString)nodeCacheAtStartOfJob
{
  return self->_nodeCacheAtStartOfJob;
}

- (void)setShouldWriteJobDebugFile:(BOOL)a3
{
  self->_shouldWriteJobDebugFile = a3;
}

- (BOOL)shouldWriteJobDebugFile
{
  return self->_shouldWriteJobDebugFile;
}

- (void)setReplyGroup:(id)a3
{
}

- (OS_dispatch_group)replyGroup
{
  return self->_replyGroup;
}

- (void)setOutputGeometry:(id)a3
{
}

- (NUImageGeometry)outputGeometry
{
  return self->_outputGeometry;
}

- (void)setRenderNode:(id)a3
{
}

- (NURenderNode)renderNode
{
  return self->_renderNode;
}

- (void)setPrepareNode:(id)a3
{
}

- (NURenderNode)prepareNode
{
  return self->_prepareNode;
}

- (BOOL)isAborted
{
  return self->_isAborted;
}

- (void)setDependentJobs:(id)a3
{
}

- (NSArray)dependentJobs
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (unint64_t)jobNumber
{
  return self->_jobNumber;
}

- (NURenderRequest)request
{
  return (NURenderRequest *)objc_getProperty(self, a2, 80, 1);
}

- (NSDate)jobCreationDate
{
  return self->_jobCreationDate;
}

- (NURenderStatistics)statistics
{
  return (NURenderStatistics *)self->_stats;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)_notifyCanceled:(int64_t)a3
{
  observatory = self->_observatory;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__NURenderJob__notifyCanceled___block_invoke;
  v4[3] = &unk_1E5D955B0;
  v4[4] = self;
  v4[5] = a3;
  [(NUObservatory *)observatory notifyAllObserversForKey:-2 withBlock:v4];
}

uint64_t __31__NURenderJob__notifyCanceled___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_notifyStageTransition:(int64_t)a3
{
  observatory = self->_observatory;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__NURenderJob__notifyStageTransition___block_invoke;
  v4[3] = &unk_1E5D955B0;
  v4[4] = self;
  v4[5] = a3;
  [(NUObservatory *)observatory notifyAllObserversForKey:-1 withBlock:v4];
}

uint64_t __38__NURenderJob__notifyStageTransition___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
}

- (void)addCancelObserver:(id)a3 queue:(id)a4 block:(id)a5
{
}

- (void)addStageObserver:(id)a3 queue:(id)a4 block:(id)a5
{
}

- (NSError)error
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__21939;
  v10 = __Block_byref_object_dispose__21940;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __20__NURenderJob_error__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __20__NURenderJob_error__block_invoke(uint64_t a1)
{
}

- (BOOL)failed
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__NURenderJob_failed__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__NURenderJob_failed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 49);
  return result;
}

- (void)fail:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v5 = [(NURenderJob *)self request];
    uint64_t v6 = (void *)[v5 copy];
    id v4 = +[NUError unknownError:@"unknown error" object:v6];
  }
  v7 = [v4 domain];
  if ([v7 isEqualToString:@"NUError"])
  {
    uint64_t v8 = [v4 code];

    if (v8 == 10)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
      }
      char v9 = _NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v4;
        _os_log_debug_impl(&dword_1A9892000, v9, OS_LOG_TYPE_DEBUG, "Rendering was canceled: %@", buf, 0xCu);
      }
      goto LABEL_14;
    }
  }
  else
  {
  }
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
  }
  v10 = _NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Rendering failure: %@", buf, 0xCu);
  }
LABEL_14:
  stateQueue = self->_stateQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __20__NURenderJob_fail___block_invoke;
  v13[3] = &unk_1E5D95E18;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  dispatch_sync(stateQueue, v13);
}

void __20__NURenderJob_fail___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (BOOL)complete:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
  }
  char v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    uint64_t v8 = [v4 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v7];
    *(_DWORD *)buf = 138543362;
    v28 = v8;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v9 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v9 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
      }
      goto LABEL_8;
    }
    if (v9 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v10 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v11 = (void *)MEMORY[0x1E4F29060];
    id v12 = v10;
    v13 = [v11 callStackSymbols];
    id v14 = [v13 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v28 = v14;
    _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v15 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v17 = (void *)MEMORY[0x1E4F29060];
  id v18 = specific;
  id v12 = v15;
  v19 = [v17 callStackSymbols];
  v20 = [v19 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v28 = specific;
  __int16 v29 = 2114;
  v30 = v20;
  _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v21 = (objc_class *)objc_opt_class();
  uint64_t v22 = NSStringFromClass(v21);
  _NUAssertFailHandler((uint64_t)"-[NURenderJob complete:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1327, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v23, v24, v25, v26, v22);
}

- (BOOL)render:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
  }
  char v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    uint64_t v8 = [v4 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v7];
    *(_DWORD *)buf = 138543362;
    v28 = v8;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v9 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v9 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
      }
      goto LABEL_8;
    }
    if (v9 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v10 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v11 = (void *)MEMORY[0x1E4F29060];
    id v12 = v10;
    v13 = [v11 callStackSymbols];
    id v14 = [v13 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v28 = v14;
    _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v15 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v17 = (void *)MEMORY[0x1E4F29060];
  id v18 = specific;
  id v12 = v15;
  v19 = [v17 callStackSymbols];
  v20 = [v19 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v28 = specific;
  __int16 v29 = 2114;
  v30 = v20;
  _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v21 = (objc_class *)objc_opt_class();
  uint64_t v22 = NSStringFromClass(v21);
  _NUAssertFailHandler((uint64_t)"-[NURenderJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1322, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v23, v24, v25, v26, v22);
}

- (id)generateVideoComposition:(id *)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  v5 = [(NURenderJob *)self renderNode];

  if (!v5)
  {
    v39 = NUAssertLogger_21966();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = [NSString stringWithFormat:@"Missing render node"];
      *(_DWORD *)buf = 138543362;
      v74 = v40;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v42 = NUAssertLogger_21966();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v43)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v54 = (void *)MEMORY[0x1E4F29060];
        id v55 = v53;
        v56 = [v54 callStackSymbols];
        v57 = [v56 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v74 = v53;
        __int16 v75 = 2114;
        v76 = v57;
        _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v43)
    {
      v44 = [MEMORY[0x1E4F29060] callStackSymbols];
      v45 = [v44 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v74 = v45;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob generateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1298, @"Missing render node", v58, v59, v60, v61, v71);
  }
  uint64_t v6 = [(NURenderJob *)self renderNode];
  v7 = [v6 outputVideoComposition:a3];

  uint64_t v8 = [(NURenderJob *)self outputGeometry];

  if (!v8)
  {
    v46 = NUAssertLogger_21966();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = [NSString stringWithFormat:@"Missing output geometry"];
      *(_DWORD *)buf = 138543362;
      v74 = v47;
      _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v49 = NUAssertLogger_21966();
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (v48)
    {
      if (v50)
      {
        v62 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v63 = (void *)MEMORY[0x1E4F29060];
        id v64 = v62;
        v65 = [v63 callStackSymbols];
        v66 = [v65 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v74 = v62;
        __int16 v75 = 2114;
        v76 = v66;
        _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v50)
    {
      v51 = [MEMORY[0x1E4F29060] callStackSymbols];
      v52 = [v51 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v74 = v52;
      _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob generateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1304, @"Missing output geometry", v67, v68, v69, v70, v71);
  }
  uint64_t v9 = (void *)[v7 mutableCopy];
  v10 = [(NURenderJob *)self outputGeometry];
  uint64_t v11 = [v10 scaledSize];
  uint64_t v13 = v12;

  if ((v11 | v13))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
    }
    id v14 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v15 = NSString;
      id v16 = v14;
      uint64_t v17 = [(NURenderJob *)self outputGeometry];
      id v18 = [(NURenderJob *)self prepareNode];
      v19 = [v15 stringWithFormat:@"Expected even dimensions for the video composition. Geometry: %@ PrepareNode: %@", v17, v18];
      *(_DWORD *)buf = 138543362;
      v74 = v19;
      _os_log_impl(&dword_1A9892000, v16, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v20 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v20 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
        }
LABEL_11:
        v21 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v23 = (void *)MEMORY[0x1E4F29060];
          id v24 = v22;
          uint64_t v25 = v21;
          uint64_t v26 = [v23 callStackSymbols];
          v27 = [v26 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v74 = v22;
          __int16 v75 = 2114;
          v76 = v27;
          _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_21:
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (v20 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_11;
    }
    v28 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v36 = (void *)MEMORY[0x1E4F29060];
      uint64_t v25 = v28;
      v37 = [v36 callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v74 = v38;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_21;
    }
LABEL_16:
    __int16 v29 = [(NURenderJob *)self outputGeometry];
    v72 = [(NURenderJob *)self prepareNode];
    _NUAssertContinueHandler((uint64_t)"-[NURenderJob generateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1311, @"Expected even dimensions for the video composition. Geometry: %@ PrepareNode: %@", v30, v31, v32, v33, (uint64_t)v29);

    uint64_t v11 = NUEvenPixelSize(v11, v13);
    uint64_t v13 = v34;
  }
  objc_msgSend(v9, "setRenderSize:", (double)v11, (double)v13);

  return v9;
}

- (BOOL)requiresVideoComposition
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v3 = [(NURenderJob *)self prepareNode];

  if (!v3)
  {
    v7 = NUAssertLogger_21966();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [NSString stringWithFormat:@"Missing prepare node"];
      *(_DWORD *)uint64_t v23 = 138543362;
      *(void *)&v23[4] = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v23, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v10 = NUAssertLogger_21966();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        id v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        uint64_t v17 = [v15 callStackSymbols];
        id v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v23 = 138543618;
        *(void *)&v23[4] = v14;
        __int16 v24 = 2114;
        uint64_t v25 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v23, 0x16u);
      }
    }
    else if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v23 = 138543362;
      *(void *)&v23[4] = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v23, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob requiresVideoComposition]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1288, @"Missing prepare node", v19, v20, v21, v22, *(uint64_t *)v23);
  }
  id v4 = [(NURenderJob *)self prepareNode];
  char v5 = [v4 requiresVideoComposition];

  return v5;
}

- (id)renderNodeWithPipelineState:(id)a3 error:(id *)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v12 = NUAssertLogger_21966();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipelineState != nil");
      *(_DWORD *)buf = 138543362;
      v62 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_21966();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        v36 = [v34 callStackSymbols];
        v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v33;
        __int16 v63 = 2114;
        id v64 = v37;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob renderNodeWithPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1275, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"pipelineState != nil");
  }
  if (!a4)
  {
    uint64_t v19 = NUAssertLogger_21966();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v62 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger_21966();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        v45 = [v43 callStackSymbols];
        v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v42;
        __int16 v63 = 2114;
        id v64 = v46;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      __int16 v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob renderNodeWithPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1276, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)"error != NULL");
  }
  v7 = v6;
  uint64_t v8 = [(NURenderJob *)self prepareNode];

  if (!v8)
  {
    uint64_t v26 = NUAssertLogger_21966();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = [NSString stringWithFormat:@"Missing prepare node"];
      *(_DWORD *)buf = 138543362;
      v62 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v29 = NUAssertLogger_21966();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        v54 = [v52 callStackSymbols];
        id v55 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v51;
        __int16 v63 = 2114;
        id v64 = v55;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob renderNodeWithPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1279, @"Missing prepare node", v56, v57, v58, v59, v60);
  }
  uint64_t v9 = [(NURenderJob *)self prepareNode];
  v10 = [v9 nodeByReplayingAgainstCache:v7 error:a4];

  return v10;
}

- (id)evaluateOutputGeometry:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  char v5 = [(NURenderJob *)self prepareNode];

  if (!v5)
  {
    uint64_t v9 = NUAssertLogger_21966();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [NSString stringWithFormat:@"Missing prepare node"];
      *(_DWORD *)uint64_t v25 = 138543362;
      *(void *)&v25[4] = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v25, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_21966();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        uint64_t v19 = [v17 callStackSymbols];
        uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v25 = 138543618;
        *(void *)&v25[4] = v16;
        __int16 v26 = 2114;
        v27 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v25, 0x16u);
      }
    }
    else if (v13)
    {
      id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v25 = 138543362;
      *(void *)&v25[4] = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v25, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob evaluateOutputGeometry:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1266, @"Missing prepare node", v21, v22, v23, v24, *(uint64_t *)v25);
  }
  id v6 = [(NURenderJob *)self prepareNode];
  v7 = [v6 outputImageGeometry:a3];

  return v7;
}

- (id)evaluateComposition:(id)a3 pipeline:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  BOOL v13 = [(NURenderJob *)self extentPolicy];
  id v14 = [v11 processedRenderNodeForComposition:v12 pipelineState:v10 extentPolicy:v13 error:a6];

  return v14;
}

- (id)prepareNodeWithPipelineState:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v14 = NUAssertLogger_21966();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipelineState != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v17 = NUAssertLogger_21966();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        uint64_t v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        uint64_t v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v21;
        __int16 v32 = 2114;
        uint64_t v33 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob prepareNodeWithPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1229, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"pipelineState != nil");
  }
  v7 = v6;
  uint64_t v8 = [(NURenderJob *)self composition];
  if (v8)
  {
LABEL_5:
    id v10 = [(NURenderJob *)self renderPipeline];
    if (!v10)
    {
      uint64_t v11 = [(NURenderJob *)self pipelineForComposition:v8 error:a4];
      if (!v11)
      {
        id v12 = 0;
        goto LABEL_9;
      }
      id v10 = (void *)v11;
      [(NURenderJob *)self setRenderPipeline:v11];
    }
    id v12 = [(NURenderJob *)self evaluateComposition:v8 pipeline:v10 pipelineState:v7 error:a4];

LABEL_9:
    goto LABEL_10;
  }
  uint64_t v9 = [(NURenderJob *)self validateComposition:a4];
  if (v9)
  {
    uint64_t v8 = (void *)v9;
    [(NURenderJob *)self setComposition:v9];
    goto LABEL_5;
  }
  id v12 = 0;
LABEL_10:

  return v12;
}

- (id)pipelineForComposition:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a4)
  {
    uint64_t v11 = NUAssertLogger_21966();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v14 = NUAssertLogger_21966();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        BOOL v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        uint64_t v21 = [v19 callStackSymbols];
        uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v18;
        __int16 v29 = 2114;
        BOOL v30 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      BOOL v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob pipelineForComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1215, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"error != nil");
  }
  id v6 = v5;
  v7 = [v5 identifier];
  uint64_t v8 = +[NURenderPipelineRegistry sharedRegistry];
  uint64_t v9 = [v8 renderPipelineForIdentifier:v7];

  if (!v9)
  {
    *a4 = +[NUError missingError:@"No NURenderPipeline registered" object:v7];
  }

  return v9;
}

- (id)validateComposition:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v9 = NUAssertLogger_21966();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v12 = NUAssertLogger_21966();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        uint64_t v19 = [v17 callStackSymbols];
        id v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2114;
        uint64_t v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob validateComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1199, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"error != nil");
  }
  char v3 = a3;
  id v4 = [(NURenderJob *)self request];
  id v5 = [v4 internalComposition];

  id v6 = [v5 schema];
  LODWORD(v3) = [v6 validateComposition:v5 error:v3];

  if (v3) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)evaluateRenderDependencies:(id *)a3
{
  id v5 = [(NURenderJob *)self renderNode];
  id v6 = [(NURenderJob *)self request];
  id v7 = [v5 evaluateRenderDependenciesWithRequest:v6 error:a3];

  uint64_t v8 = [v7 allValues];

  return v8;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v115 = NUAssertLogger_21966();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
    {
      v116 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v152 = (uint64_t)v116;
      _os_log_error_impl(&dword_1A9892000, v115, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v118 = NUAssertLogger_21966();
    BOOL v119 = os_log_type_enabled(v118, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v119)
      {
        v122 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v123 = (void *)MEMORY[0x1E4F29060];
        id v124 = v122;
        v125 = [v123 callStackSymbols];
        v126 = [v125 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v152 = (uint64_t)v122;
        __int16 v153 = 2114;
        v154 = v126;
        _os_log_error_impl(&dword_1A9892000, v118, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v119)
    {
      v120 = [MEMORY[0x1E4F29060] callStackSymbols];
      v121 = [v120 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v152 = (uint64_t)v121;
      _os_log_error_impl(&dword_1A9892000, v118, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1011, @"Invalid parameter not satisfying: %s", v127, v128, v129, v130, (uint64_t)"error != nil");
  }
  char v3 = a3;
  if ([(NURenderJob *)self wantsOutputImage]
    || [(NURenderJob *)self wantsOutputVideoFrame])
  {
    id v5 = [(NURenderJob *)self outputImage];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  if ([(NURenderJob *)self wantsOutputVideo])
  {
    id v7 = [(NURenderJob *)self outputVideo];
    BOOL v8 = v7 == 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  if ([(NURenderJob *)self wantsOutputGeometry] || v8)
  {
    id v10 = [(NURenderJob *)self outputGeometry];
    BOOL v9 = v10 == 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  if (v6 || v8)
  {
    uint64_t v11 = [(NURenderJob *)self renderNode];
    BOOL v12 = v11 == 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  if (v9 || v6 || v8)
  {
    BOOL v14 = [(NURenderJob *)self renderScale] < 1 || v13 < 1;
    int v15 = v14;
  }
  else
  {
    int v15 = 0;
  }
  BOOL v16 = [(NURenderJob *)self prepareNode];

  if (v16)
  {
    if (!v15) {
      goto LABEL_54;
    }
  }
  else
  {
    id v37 = [(NURenderJob *)self newRenderPipelineStateForEvaluationMode:0];
    uint64_t v38 = [(NURenderJob *)self prepareNodeWithPipelineState:v37 error:v3];
    [(NURenderJob *)self setPrepareNode:v38];

    uint64_t v39 = [(NURenderJob *)self prepareNode];

    if (!v39) {
      goto LABEL_44;
    }
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
    }
    uint64_t v40 = (void *)_NUScheduleLogger;
    if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
    {
      v96 = v40;
      v97 = [(NURenderJob *)self prepareNode];
      *(_DWORD *)buf = 138412290;
      uint64_t v152 = (uint64_t)v97;
      _os_log_debug_impl(&dword_1A9892000, v96, OS_LOG_TYPE_DEBUG, "Prepare node:\n%@", buf, 0xCu);
    }
    uint64_t v41 = [(NURenderJob *)self prepareNode];
    v42 = [v41 outputGeometrySpaceMap:v3];

    if (!v42)
    {
LABEL_44:

      return 0;
    }
    BOOL v43 = [v37 rootGroup];
    [v43 finalizeMap:v42];
    v148 = v37;
    BOOL v44 = v9;
    BOOL v45 = v8;
    BOOL v46 = v6;
    uint64_t v47 = v3;
    v49 = BOOL v48 = v12;
    [(NURenderJob *)self setResolvedSpaceMap:v49];

    BOOL v12 = v48;
    char v3 = v47;
    BOOL v6 = v46;
    BOOL v8 = v45;
    BOOL v9 = v44;

    if (!v15) {
      goto LABEL_54;
    }
  }
  uint64_t v17 = [(NURenderJob *)self evaluateOutputGeometry:v3];
  [(NURenderJob *)self setFullSizeGeometry:v17];

  id v18 = [(NURenderJob *)self fullSizeGeometry];

  if (!v18)
  {
    uint64_t v50 = [(NURenderJob *)self request];
    v51 = (void *)[v50 copy];
    *char v3 = +[NUError failureError:@"Failure evaluating output geometry" object:v51];

LABEL_49:
    return 0;
  }
  uint64_t v19 = [(NURenderJob *)self fullSizeGeometry];
  uint64_t v20 = [v19 size];
  uint64_t v22 = v21;

  if (!v20 || !v22)
  {
    uint64_t v50 = [(NURenderJob *)self fullSizeGeometry];
    v52 = @"Output geometry contains an empty size";
LABEL_48:
    *char v3 = +[NUError invalidError:v52 object:v50];
    goto LABEL_49;
  }
  BOOL v23 = v12;
  uint64_t v24 = [(NURenderJob *)self scalePolicy];
  uint64_t v25 = [(NURenderJob *)self fullSizeGeometry];
  uint64_t v26 = [v25 size];
  uint64_t v28 = objc_msgSend(v24, "scaleForImageSize:", v26, v27);
  uint64_t v30 = v29;

  if (v28 < 1 || v30 < 1)
  {
    uint64_t v50 = [(NURenderJob *)self scalePolicy];
    v52 = @"Scale policy produced invalid scale";
    goto LABEL_48;
  }
  if (NUScaleCompare(v28, v30, NUScaleOne, *((uint64_t *)&NUScaleOne + 1)) > 0)
  {
    uint64_t v30 = *((void *)&NUScaleOne + 1);
    uint64_t v28 = NUScaleOne;
  }
  if ([(NURenderJob *)self wantsRenderScaleClampedToNativeScale])
  {
    uint64_t v31 = [(NURenderJob *)self fullSizeGeometry];
    uint64_t v32 = [v31 renderScale];
    uint64_t v34 = NUScaleCompare(v28, v30, v32, v33);

    BOOL v14 = v34 < 1;
    BOOL v12 = v23;
    if (!v14)
    {
      id v35 = [(NURenderJob *)self fullSizeGeometry];
      uint64_t v28 = [v35 renderScale];
      uint64_t v30 = v36;
    }
  }
  else
  {
    BOOL v12 = v23;
  }
  -[NURenderJob setRenderScale:](self, "setRenderScale:", v28, v30);
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
  }
  id v53 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    v104 = v53;
    uint64_t v105 = [(NURenderJob *)self renderScale];
    [(NURenderJob *)self renderScale];
    *(_DWORD *)buf = 134218240;
    uint64_t v152 = v105;
    __int16 v153 = 2048;
    v154 = v106;
    _os_log_debug_impl(&dword_1A9892000, v104, OS_LOG_TYPE_DEBUG, "Render scale: %ld:%ld", buf, 0x16u);

    if (!v9) {
      goto LABEL_61;
    }
    goto LABEL_55;
  }
LABEL_54:
  if (!v9) {
    goto LABEL_61;
  }
LABEL_55:
  uint64_t v54 = [(NURenderJob *)self evaluateOutputGeometry:v3];
  if (!v54) {
    return 0;
  }
  id v55 = (void *)v54;
  BOOL v149 = v12;
  uint64_t v56 = [(NURenderJob *)self renderScale];
  uint64_t v58 = v57;
  uint64_t v59 = [NUImageGeometry alloc];
  [v55 extent];
  uint64_t v60 = [v55 orientation];
  uint64_t v61 = [(NURenderJob *)self resolvedSpaceMap];
  v62 = -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](v59, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", v150, v56, v58, v60, v61, [v55 roundingPolicy]);
  [(NURenderJob *)self setOutputGeometry:v62];

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
  }
  __int16 v63 = (void *)_NUScheduleLogger;
  BOOL v12 = v149;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    v98 = v63;
    v99 = [(NURenderJob *)self outputGeometry];
    *(_DWORD *)buf = 138412290;
    uint64_t v152 = (uint64_t)v99;
    _os_log_debug_impl(&dword_1A9892000, v98, OS_LOG_TYPE_DEBUG, "Output geometry: %@", buf, 0xCu);
  }
LABEL_61:
  if (!v12)
  {
LABEL_84:
    v74 = [(NURenderJob *)self dependentJobs];

    if (v74) {
      [(NURenderJob *)self setDependentJobs:0];
    }
    if (!v6) {
      goto LABEL_91;
    }
    __int16 v75 = [(NURenderJob *)self renderNode];
    v76 = [v75 outputImage:v3];
    [(NURenderJob *)self setOutputImage:v76];

    uint64_t v77 = [(NURenderJob *)self outputImage];

    if (!v77) {
      return 0;
    }
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
    }
    v78 = (void *)_NUScheduleLogger;
    if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
    {
      v102 = v78;
      v103 = [(NURenderJob *)self outputImage];
      *(_DWORD *)buf = 138412290;
      uint64_t v152 = (uint64_t)v103;
      _os_log_debug_impl(&dword_1A9892000, v102, OS_LOG_TYPE_DEBUG, "Output image: %@", buf, 0xCu);

      if (v8) {
        goto LABEL_92;
      }
    }
    else
    {
LABEL_91:
      if (v8)
      {
LABEL_92:
        v79 = [(NURenderJob *)self renderNode];
        v80 = [v79 outputVideo:v3];
        [(NURenderJob *)self setOutputVideo:v80];

        v81 = [(NURenderJob *)self outputVideo];

        if (v81)
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
          }
          v82 = (void *)_NUScheduleLogger;
          if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
          {
            v107 = v82;
            v108 = [(NURenderJob *)self outputVideo];
            *(_DWORD *)buf = 138412290;
            uint64_t v152 = (uint64_t)v108;
            _os_log_debug_impl(&dword_1A9892000, v107, OS_LOG_TYPE_DEBUG, "Output video: %@", buf, 0xCu);
          }
          if (![(NURenderJob *)self requiresVideoComposition]
            || ([(NURenderJob *)self generateVideoComposition:v3],
                v83 = objc_claimAutoreleasedReturnValue(),
                [(NURenderJob *)self setOutputVideoComposition:v83],
                v83,
                [(NURenderJob *)self outputVideoComposition],
                v84 = objc_claimAutoreleasedReturnValue(),
                v84,
                v84))
          {
            if (_NULogOnceToken != -1) {
              dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
            }
            v85 = (void *)_NUScheduleLogger;
            if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
            {
              v111 = v85;
              v112 = [(NURenderJob *)self outputVideoComposition];
              *(_DWORD *)buf = 138412290;
              uint64_t v152 = (uint64_t)v112;
              _os_log_debug_impl(&dword_1A9892000, v111, OS_LOG_TYPE_DEBUG, "Output video composition: %@", buf, 0xCu);
            }
            v86 = [(NURenderJob *)self prepareNode];
            int v87 = [v86 requiresAudioMix];

            if (!v87) {
              goto LABEL_107;
            }
            v88 = [(NURenderJob *)self renderNode];
            int v89 = [v88 shouldInvalidateCachedAudioMix];

            if (v89)
            {
              v90 = [(NURenderJob *)self renderNode];
              [v90 invalidateCachedAudioMix];
            }
            v91 = [(NURenderJob *)self renderNode];
            v92 = [v91 outputAudioMix:v3];
            [(NURenderJob *)self setOutputAudioMix:v92];

            v93 = [(NURenderJob *)self outputAudioMix];

            if (v93)
            {
LABEL_107:
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
              }
              v94 = (void *)_NUScheduleLogger;
              if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
              {
                v113 = v94;
                v114 = [(NURenderJob *)self outputAudioMix];
                *(_DWORD *)buf = 138412290;
                uint64_t v152 = (uint64_t)v114;
                _os_log_debug_impl(&dword_1A9892000, v113, OS_LOG_TYPE_DEBUG, "Output audio mix: %@", buf, 0xCu);
              }
              goto LABEL_111;
            }
          }
        }
        return 0;
      }
    }
LABEL_111:
    [(NURenderJob *)self _checkForMemoizedResult];
    return 1;
  }
  if (v8)
  {
    uint64_t v64 = 2;
  }
  else if ([(NURenderJob *)self wantsOutputImage])
  {
    uint64_t v64 = 1;
  }
  else
  {
    if (![(NURenderJob *)self wantsOutputVideoFrame])
    {
      v131 = NUAssertLogger_21966();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      {
        v132 = [NSString stringWithFormat:@"needsRenderNode but unable to compute renderMode"];
        *(_DWORD *)buf = 138543362;
        uint64_t v152 = (uint64_t)v132;
        _os_log_error_impl(&dword_1A9892000, v131, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v133 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v134 = NUAssertLogger_21966();
      BOOL v135 = os_log_type_enabled(v134, OS_LOG_TYPE_ERROR);
      if (v133)
      {
        if (v135)
        {
          v138 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v139 = (void *)MEMORY[0x1E4F29060];
          id v140 = v138;
          v141 = [v139 callStackSymbols];
          v142 = [v141 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          uint64_t v152 = (uint64_t)v138;
          __int16 v153 = 2114;
          v154 = v142;
          _os_log_error_impl(&dword_1A9892000, v134, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v135)
      {
        v136 = [MEMORY[0x1E4F29060] callStackSymbols];
        v137 = [v136 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v152 = (uint64_t)v137;
        _os_log_error_impl(&dword_1A9892000, v134, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NURenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1105, @"needsRenderNode but unable to compute renderMode", v143, v144, v145, v146, v147);
    }
    uint64_t v64 = 3;
  }
  id v65 = [(NURenderJob *)self newRenderPipelineStateForEvaluationMode:v64];
  v66 = [(NURenderJob *)self renderNodeWithPipelineState:v65 error:v3];
  [(NURenderJob *)self setRenderNode:v66];

  uint64_t v67 = [(NURenderJob *)self renderNode];

  if (v67)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
    }
    uint64_t v68 = (void *)_NUScheduleLogger;
    if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
    {
      v100 = v68;
      v101 = [(NURenderJob *)self renderNode];
      *(_DWORD *)buf = 138412290;
      uint64_t v152 = (uint64_t)v101;
      _os_log_debug_impl(&dword_1A9892000, v100, OS_LOG_TYPE_DEBUG, "Render node:\n%@", buf, 0xCu);
    }
    uint64_t v69 = [(NURenderJob *)self dependentJobs];

    if (v69
      || ([(NURenderJob *)self evaluateRenderDependencies:v3],
          uint64_t v70 = objc_claimAutoreleasedReturnValue(),
          [(NURenderJob *)self setDependentJobs:v70],
          v70,
          [(NURenderJob *)self dependentJobs],
          uint64_t v71 = objc_claimAutoreleasedReturnValue(),
          v71,
          v71))
    {
      if ([(NURenderJob *)self _shouldWaitForDependentJobs])
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
        }
        v72 = (void *)_NUScheduleLogger;
        if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
        {
          v109 = v72;
          v110 = [(NURenderJob *)self dependentJobs];
          *(_DWORD *)buf = 138412290;
          uint64_t v152 = (uint64_t)v110;
          _os_log_debug_impl(&dword_1A9892000, v109, OS_LOG_TYPE_DEBUG, "Render dependent jobs: %@", buf, 0xCu);
        }
        BOOL v73 = 1;
        goto LABEL_82;
      }

      goto LABEL_84;
    }
  }
  BOOL v73 = 0;
LABEL_82:

  return v73;
}

- (void)_memoizeResult:(id)a3
{
  id v5 = a3;
  if (!+[NUGlobalSettings renderJobDisableResultCache])
  {
    id v4 = +[NURenderResultCache shared];
    [v4 setResult:v5 forJob:self];
  }
}

- (BOOL)_checkForMemoizedResult
{
  if (+[NUGlobalSettings renderJobDisableResultCache]) {
    return 0;
  }
  id v4 = +[NURenderResultCache shared];
  id v5 = [v4 resultForJob:self];

  BOOL v3 = v5 != 0;
  if (v5)
  {
    BOOL v6 = [[NUResponse alloc] initWithResult:v5];
    [(NURenderJob *)self reply:v6];
    [(NURenderJob *)self finalize:0];
  }
  return v3;
}

- (id)memoizationCacheKey
{
  p_memoizationCacheKey = &self->_memoizationCacheKey;
  id v4 = self->_memoizationCacheKey;
  if (!v4)
  {
    id v4 = [(NURenderJob *)self cacheKey];
    objc_storeStrong((id *)p_memoizationCacheKey, v4);
  }

  return v4;
}

- (id)cacheKey
{
  return 0;
}

- (void)_reply:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NURenderJobStatistics *)self->_stats setResponseTime:NUAbsoluteTime()];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
  }
  id v5 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    request = self->_request;
    BOOL v8 = v5;
    BOOL v9 = [(NURenderRequest *)request name];
    [(NURenderJobStatistics *)self->_stats totalDuration];
    int v11 = 134218498;
    BOOL v12 = self;
    __int16 v13 = 2114;
    BOOL v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    _os_log_debug_impl(&dword_1A9892000, v8, OS_LOG_TYPE_DEBUG, "job %p %{public}@ totalDuration %0.4f s", (uint8_t *)&v11, 0x20u);
  }
  BOOL v6 = [(NURenderRequest *)self->_request completionBlock];
  ((void (**)(void, id))v6)[2](v6, v4);
}

- (void)reply:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__NURenderJob_reply___block_invoke;
  block[3] = &unk_1E5D95E68;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  if (self->_replySynchronous)
  {
    BOOL v6 = (void *)MEMORY[0x1AD0FAA90]();
    [(NURenderJob *)self _reply:v4];
  }
  else
  {
    replyGroup = self->_replyGroup;
    BOOL v8 = [(NURenderRequest *)self->_request responseQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __21__NURenderJob_reply___block_invoke_2;
    v9[3] = &unk_1E5D95E18;
    v9[4] = self;
    id v10 = v4;
    dispatch_group_async(replyGroup, v8, v9);
  }
}

uint64_t __21__NURenderJob_reply___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 51) = 1;
  return result;
}

void __21__NURenderJob_reply___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1AD0FAA90]();
  [*(id *)(a1 + 32) _reply:*(void *)(a1 + 40)];
}

- (BOOL)succeeded
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__NURenderJob_succeeded__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __24__NURenderJob_succeeded__block_invoke(uint64_t result)
{
  v1 = *(unsigned char **)(result + 32);
  BOOL v2 = v1[66] && !v1[65] && v1[49] == 0;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (void)_setCurrentStage:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    char v3 = NUAssertLogger_21966();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "stage != NURenderJobStageNone");
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v6 = NUAssertLogger_21966();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        id v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        int v11 = (void *)MEMORY[0x1E4F29060];
        id v12 = v10;
        __int16 v13 = [v11 callStackSymbols];
        BOOL v14 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = v10;
        __int16 v21 = 2114;
        uint64_t v22 = v14;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob _setCurrentStage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 908, @"Invalid parameter not satisfying: %s", v15, v16, v17, v18, (uint64_t)"stage != NURenderJobStageNone");
  }
  self->_currentStage = a3;
  if (a3 != 6)
  {
    -[NURenderJob _notifyStageTransition:](self, "_notifyStageTransition:");
  }
}

- (void)_finish
{
  if (!self->_isFinished)
  {
    self->_isFinished = 1;
    self->_currentStage = 6;
    [(NURenderJob *)self _notifyStageTransition:6];
  }
}

- (void)finish
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__NURenderJob_finish__block_invoke;
  block[3] = &unk_1E5D95E68;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __21__NURenderJob_finish__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finish];
}

- (void)finalize:(BOOL)a3
{
  if (a3)
  {
    if ([(NURenderJob *)self isCanceled])
    {
      id v4 = [(NURenderJob *)self request];
      id v5 = (void *)[v4 copy];
      uint64_t v6 = +[NUError canceledError:@"Request was canceled" object:v5];

      [(NURenderJob *)self fail:v6];
    }
    [(NURenderJob *)self respond];
  }
  [(NURenderJob *)self cleanUp];

  [(NURenderJob *)self finish];
}

- (id)result
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
  }
  BOOL v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    char v3 = NSString;
    id v4 = v2;
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    BOOL v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    char v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v10 = (void *)MEMORY[0x1E4F29060];
    int v11 = v9;
    id v12 = [v10 callStackSymbols];
    __int16 v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  int v11 = v14;
  uint64_t v18 = [v16 callStackSymbols];
  uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v27 = specific;
  __int16 v28 = 2114;
  uint64_t v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NURenderJob result]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 857, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (void)respond
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(NURenderJob *)self failed])
  {
    if ([(NURenderJob *)self isCanceled])
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
      }
      char v3 = (void *)_NUScheduleLogger;
      if (!os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_15;
      }
      id v4 = v3;
      id v5 = [(NURenderJob *)self request];
      uint64_t v6 = [v5 name];
      int v17 = 134218242;
      uint64_t v18 = self;
      __int16 v19 = 2114;
      uint64_t v20 = v6;
      _os_log_debug_impl(&dword_1A9892000, v4, OS_LOG_TYPE_DEBUG, "respond job %p %{public}@: canceled", (uint8_t *)&v17, 0x16u);
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
      }
      id v10 = (void *)_NUScheduleLogger;
      if (!os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      id v4 = v10;
      id v5 = [(NURenderJob *)self request];
      uint64_t v6 = [v5 name];
      uint64_t v16 = [(NURenderJob *)self error];
      int v17 = 134218498;
      uint64_t v18 = self;
      __int16 v19 = 2114;
      uint64_t v20 = v6;
      __int16 v21 = 2114;
      uint64_t v22 = v16;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "respond job %p %{public}@: error %{public}@", (uint8_t *)&v17, 0x20u);
    }
LABEL_15:
    int v11 = [NUResponse alloc];
    uint64_t v8 = [(NURenderJob *)self error];
    char v9 = [(NUResponse *)v11 initWithError:v8];
    goto LABEL_16;
  }
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
  }
  BOOL v7 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = v7;
    BOOL v14 = [(NURenderJob *)self request];
    uint64_t v15 = [v14 name];
    int v17 = 134218242;
    uint64_t v18 = self;
    __int16 v19 = 2114;
    uint64_t v20 = v15;
    _os_log_debug_impl(&dword_1A9892000, v13, OS_LOG_TYPE_DEBUG, "respond job %p %{public}@: success", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v8 = [(NURenderJob *)self result];
  [v8 setStatistics:self->_stats];
  [(NURenderJob *)self _memoizeResult:v8];
  char v9 = [[NUResponse alloc] initWithResult:v8];
LABEL_16:
  id v12 = v9;

  [(NURenderJob *)self reply:v12];
  if (+[NUGlobalSettings renderJobDebug])
  {
    [(NURenderJob *)self renderJobDebugResponded];
    +[NURenderJobStatistics addStatisticsToHistory:self->_stats forJob:self wasCanceled:0];
  }
}

- (void)abortStage:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 5:
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
      }
      id v5 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        id v10 = v5;
        int v11 = [(NURenderJob *)self request];
        id v12 = [v11 name];
        int v16 = 134218242;
        int v17 = self;
        __int16 v18 = 2114;
        __int16 v19 = v12;
        _os_log_debug_impl(&dword_1A9892000, v10, OS_LOG_TYPE_DEBUG, "job %p %{public}@ abort complete", (uint8_t *)&v16, 0x16u);
      }
      [(NURenderJob *)self abortComplete];
      break;
    case 4:
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
      }
      uint64_t v6 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        __int16 v13 = v6;
        BOOL v14 = [(NURenderJob *)self request];
        uint64_t v15 = [v14 name];
        int v16 = 134218242;
        int v17 = self;
        __int16 v18 = 2114;
        __int16 v19 = v15;
        _os_log_debug_impl(&dword_1A9892000, v13, OS_LOG_TYPE_DEBUG, "job %p %{public}@ abort render", (uint8_t *)&v16, 0x16u);
      }
      [(NURenderJob *)self abortRender];
      break;
    case 1:
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
      }
      id v4 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        BOOL v7 = v4;
        uint64_t v8 = [(NURenderJob *)self request];
        char v9 = [v8 name];
        int v16 = 134218242;
        int v17 = self;
        __int16 v18 = 2114;
        __int16 v19 = v9;
        _os_log_debug_impl(&dword_1A9892000, v7, OS_LOG_TYPE_DEBUG, "job %p %{public}@ abort prepare", (uint8_t *)&v16, 0x16u);
      }
      [(NURenderJob *)self abortPrepare];
      break;
  }
}

- ($EB925890EBEBD6850280D1FB85A9BD43)_atomicCancel
{
  if (self->_isCanceled || self->_isFinished || self->_failed)
  {
    int v3 = 0;
    int v4 = 0;
  }
  else
  {
    int v5 = 1;
    if (self->_currentStage == 6)
    {
      int v3 = 0;
      int v4 = 0;
      return ($EB925890EBEBD6850280D1FB85A9BD43)((v3 << 16) | (v4 << 8) | v5);
    }
    self->_isCanceled = 1;
    -[NURenderJob _notifyCanceled:](self, "_notifyCanceled:");
    if (!self->_isExecuting)
    {
      int v5 = ![(NURenderRequest *)self->_request shouldCoalesceUpdates];
      int v3 = 1;
      int v4 = 1;
      return ($EB925890EBEBD6850280D1FB85A9BD43)((v3 << 16) | (v4 << 8) | v5);
    }
    [(NURenderJob *)self abortStage:self->_currentStage];
    int v4 = 0;
    int v3 = 1;
    self->_isAborted = 1;
  }
  int v5 = 1;
  return ($EB925890EBEBD6850280D1FB85A9BD43)((v3 << 16) | (v4 << 8) | v5);
}

- (void)_resume
{
}

- (void)resume
{
  int v3 = [(NURenderJob *)self request];
  int v4 = [v3 voucher];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__NURenderJob_resume__block_invoke;
  v5[3] = &unk_1E5D95E68;
  v5[4] = self;
  NULogAdoptVoucher(v4, v5);
}

void __21__NURenderJob_resume__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__NURenderJob_resume__block_invoke_2;
  block[3] = &unk_1E5D95E68;
  block[4] = v1;
  dispatch_sync(v2, block);
}

uint64_t __21__NURenderJob_resume__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resume];
}

- (void)_pause
{
}

- (void)pause
{
  int v3 = [(NURenderJob *)self request];
  int v4 = [v3 voucher];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __20__NURenderJob_pause__block_invoke;
  v5[3] = &unk_1E5D95E68;
  v5[4] = self;
  NULogAdoptVoucher(v4, v5);
}

void __20__NURenderJob_pause__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__NURenderJob_pause__block_invoke_2;
  block[3] = &unk_1E5D95E68;
  block[4] = v1;
  dispatch_sync(v2, block);
}

uint64_t __20__NURenderJob_pause__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pause];
}

- (BOOL)_cancelCoalescedJob
{
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2810000000;
  uint64_t v15 = &unk_1A9AA79AF;
  __int16 v16 = 1;
  char v17 = 0;
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__NURenderJob__cancelCoalescedJob__block_invoke;
  v7[3] = &unk_1E5D95580;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = &v12;
  dispatch_sync(stateQueue, v7);
  if (+[NUGlobalSettings renderJobDebug] && !*((unsigned char *)v9 + 24))
  {
    [(NURenderJob *)self renderJobDebugCanceled];
    +[NURenderJobStatistics addStatisticsToHistory:self->_stats forJob:self wasCanceled:1];
  }
  int v4 = v13;
  if (*((unsigned char *)v13 + 33))
  {
    [(NURenderJob *)self finalize:*((unsigned __int8 *)v13 + 32)];
    int v4 = v13;
  }
  char v5 = *((unsigned char *)v4 + 34);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __34__NURenderJob__cancelCoalescedJob__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 65);
  __dmb(0xBu);
  uint64_t result = [*(id *)(a1 + 32) _shouldCancelCoalescedJob];
  if (result)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
    }
    int v3 = (void *)_NUScheduleLogger;
    if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
    {
      char v5 = *(void **)(a1 + 32);
      uint64_t v6 = v3;
      BOOL v7 = [v5 request];
      uint64_t v8 = [v7 name];
      int v9 = 134218242;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_debug_impl(&dword_1A9892000, v6, OS_LOG_TYPE_DEBUG, "job %p %{public}@ cancel (coalesced)", (uint8_t *)&v9, 0x16u);
    }
    uint64_t result = [*(id *)(a1 + 32) _atomicCancel];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    *(unsigned char *)(v4 + 34) = BYTE2(result);
    *(_WORD *)(v4 + 32) = result;
  }
  return result;
}

- (BOOL)cancelCoalescedJob
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  int v3 = [(NURenderJob *)self request];
  uint64_t v4 = [v3 voucher];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__NURenderJob_cancelCoalescedJob__block_invoke;
  v6[3] = &unk_1E5D95E40;
  v6[4] = self;
  v6[5] = &v7;
  NULogAdoptVoucher(v4, v6);

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

uint64_t __33__NURenderJob_cancelCoalescedJob__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _cancelCoalescedJob];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_shouldCancelCoalescedJob
{
  if (self->_isCanceled) {
    return 0;
  }
  unint64_t currentStage = self->_currentStage;
  if (currentStage < 4) {
    return 1;
  }
  if (currentStage != 4) {
    return 0;
  }
  return !self->_isExecuting;
}

- (void)_cancel
{
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x2810000000;
  uint64_t v12 = &unk_1A9AA79AF;
  __int16 v13 = 0;
  char v14 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __22__NURenderJob__cancel__block_invoke;
  v4[3] = &unk_1E5D95580;
  v4[4] = self;
  v4[5] = &v5;
  void v4[6] = &v9;
  dispatch_sync(stateQueue, v4);
  if (+[NUGlobalSettings renderJobDebug] && !*((unsigned char *)v6 + 24))
  {
    [(NURenderJob *)self renderJobDebugCanceled];
    +[NURenderJobStatistics addStatisticsToHistory:self->_stats forJob:self wasCanceled:1];
  }
  if (*((unsigned char *)v10 + 33)) {
    [(NURenderJob *)self finalize:*((unsigned __int8 *)v10 + 32)];
  }
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
}

uint64_t __22__NURenderJob__cancel__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
  }
  BOOL v2 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v2;
    uint64_t v7 = [v5 request];
    char v8 = [v7 name];
    int v9 = 134218242;
    char v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_debug_impl(&dword_1A9892000, v6, OS_LOG_TYPE_DEBUG, "job %p %{public}@ cancel", (uint8_t *)&v9, 0x16u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 65);
  __dmb(0xBu);
  uint64_t result = [*(id *)(a1 + 32) _atomicCancel];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  *(unsigned char *)(v4 + 34) = BYTE2(result);
  *(_WORD *)(v4 + 32) = result;
  return result;
}

- (void)cancel
{
  int v3 = [(NURenderJob *)self request];
  uint64_t v4 = [v3 voucher];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__NURenderJob_cancel__block_invoke;
  v5[3] = &unk_1E5D95E68;
  v5[4] = self;
  NULogAdoptVoucher(v4, v5);
}

uint64_t __21__NURenderJob_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (BOOL)isFinished
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__NURenderJob_isFinished__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__NURenderJob_isFinished__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 66);
  return result;
}

- (BOOL)isCanceled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__NURenderJob_isCanceled__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__NURenderJob_isCanceled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 65);
  return result;
}

- (int64_t)currentStage
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__NURenderJob_currentStage__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__NURenderJob_currentStage__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 72);
  return result;
}

- (BOOL)_shouldWaitForDependentJobs
{
  BOOL v2 = [(NURenderJob *)self dependentJobs];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (int64_t)_nextStageForStage:(int64_t)a3
{
  uint64_t v9 = v3;
  switch(a3)
  {
    case 0:
    case 2:
    case 3:
      int64_t result = 1;
      break;
    case 1:
      if ([(NURenderJob *)self _shouldWaitForDependentJobs])
      {
        int64_t result = 3;
      }
      else
      {
        if (![(NURenderJob *)self wantsRenderStage]) {
          goto LABEL_8;
        }
        int64_t result = 4;
      }
      break;
    case 4:
LABEL_8:
      if (![(NURenderJob *)self wantsCompleteStage]) {
        goto LABEL_10;
      }
      int64_t result = 5;
      break;
    case 5:
    case 6:
LABEL_10:
      int64_t result = 6;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (BOOL)runStage:(int64_t)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self;
  switch(a3)
  {
    case 0:
    case 2:
    case 3:
    case 6:
      __int16 v19 = NUAssertLogger_21966();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        if ((unint64_t)(a3 - 1) > 5) {
          uint64_t v20 = @"None";
        }
        else {
          uint64_t v20 = off_1E5D95620[a3 - 1];
        }
        __int16 v21 = [NSString stringWithFormat:@"Cannot run stage: %@", v20];
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = v21;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v23 = NUAssertLogger_21966();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v24)
        {
          uint64_t v27 = (NURenderJob *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          __int16 v28 = (void *)MEMORY[0x1E4F29060];
          uint64_t v29 = v27;
          uint64_t v30 = [v28 callStackSymbols];
          uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = v27;
          __int16 v41 = 2114;
          v42 = v31;
          _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v24)
      {
        uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = v26;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      if ((unint64_t)(a3 - 1) > 5) {
        uint64_t v32 = @"None";
      }
      else {
        uint64_t v32 = off_1E5D95620[a3 - 1];
      }
      uint64_t v33 = v32;
      _NUAssertFailHandler((uint64_t)"-[NURenderJob runStage:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 494, @"Cannot run stage: %@", v34, v35, v36, v37, (uint64_t)v33);
    case 1:
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
      }
      uint64_t v6 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        char v10 = v6;
        __int16 v11 = [(NURenderJob *)v5 request];
        uint64_t v12 = [v11 name];
        *(_DWORD *)buf = 134218242;
        uint64_t v40 = v5;
        __int16 v41 = 2114;
        v42 = v12;
        _os_log_debug_impl(&dword_1A9892000, v10, OS_LOG_TYPE_DEBUG, "job %p %{public}@ prepare", buf, 0x16u);
      }
      LOBYTE(self) = [(NURenderJob *)v5 prepare:a4];
      break;
    case 4:
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
      }
      uint64_t v7 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = v7;
        char v14 = [(NURenderJob *)v5 request];
        uint64_t v15 = [v14 name];
        *(_DWORD *)buf = 134218242;
        uint64_t v40 = v5;
        __int16 v41 = 2114;
        v42 = v15;
        _os_log_debug_impl(&dword_1A9892000, v13, OS_LOG_TYPE_DEBUG, "job %p %{public}@ render", buf, 0x16u);
      }
      LOBYTE(self) = [(NURenderJob *)v5 _checkForMemoizedResult]
                  || [(NURenderJob *)v5 render:a4];
      break;
    case 5:
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
      }
      uint64_t v8 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        __int16 v16 = v8;
        char v17 = [(NURenderJob *)v5 request];
        __int16 v18 = [v17 name];
        *(_DWORD *)buf = 134218242;
        uint64_t v40 = v5;
        __int16 v41 = 2114;
        v42 = v18;
        _os_log_debug_impl(&dword_1A9892000, v16, OS_LOG_TYPE_DEBUG, "job %p %{public}@ complete", buf, 0x16u);
      }
      LOBYTE(self) = [(NURenderJob *)v5 complete:a4];
      break;
    default:
      return self & 1;
  }
  return self & 1;
}

- (void)didRun
{
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__NURenderJob_didRun__block_invoke;
  block[3] = &unk_1E5D95580;
  block[4] = self;
  void block[5] = &v9;
  block[6] = &v5;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v6 + 24)) {
    [(NURenderJob *)self finalize:*((unsigned __int8 *)v10 + 24)];
  }
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
}

uint64_t __21__NURenderJob_didRun__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  if (([*(id *)(a1 + 32) _shouldWaitForDependentJobs] & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 24) renderJob:*(void *)(a1 + 32) didRunStage:*(void *)(*(void *)(a1 + 32) + 72)];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 72) == 1)
  {
    [(id)result _didPrepare];
    uint64_t result = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(result + 48))
  {
    uint64_t result = [*(id *)(result + 80) shouldCoalesceUpdates];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result ^ 1;
LABEL_9:
    uint64_t v3 = a1 + 48;
LABEL_10:
    *(unsigned char *)(*(void *)(*(void *)v3 + 8) + 24) = 1;
    goto LABEL_11;
  }
  if (*(unsigned char *)(result + 49))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_9;
  }
  uint64_t v4 = [(id)result _nextStageForStage:*(void *)(result + 72)];
  uint64_t result = [*(id *)(a1 + 32) _setCurrentStage:v4];
  if (v4 == 6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v3 = a1 + 40;
    goto LABEL_10;
  }
LABEL_11:
  if (*(unsigned char *)(*(void *)(a1 + 32) + 51)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (void)_didPrepare
{
  uint64_t v3 = [(NURenderJob *)self prepareNode];
  if (v3 && [(NURenderJob *)self wantsPrepareNodeCached])
  {
    uint64_t v4 = [(NURenderJob *)self request];
    uint64_t v5 = [v4 renderContext];
    [v5 setLastPrepareNode:v3];
  }
  uint64_t v8 = [(NURenderJob *)self renderNode];

  if (v8 && [(NURenderJob *)self wantsRenderNodeCached])
  {
    uint64_t v6 = [(NURenderJob *)self request];
    uint64_t v7 = [v6 renderContext];
    [v7 setLastRenderNode:v8];
  }

  MEMORY[0x1F41817F8]();
}

- (int64_t)willRun
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__NURenderJob_willRun__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __22__NURenderJob_willRun__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 66) || *(unsigned char *)(v2 + 65))
  {
    uint64_t v3 = 0;
  }
  else
  {
    if (*(void *)(v2 + 72) == 3)
    {
      *(void *)(v2 + 72) = 1;
      id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v5 = [*(id *)(a1 + 32) dependentJobs];
      uint64_t v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "dependentJobs", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            char v12 = [*(id *)(*((void *)&v13 + 1) + 8 * i) statistics];
            [v6 addObject:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }

      [*(id *)(*(void *)(a1 + 32) + 24) setDependencies:v6];
    }
    else
    {
      objc_msgSend(*(id *)(v2 + 24), "renderJob:willRunStage:");
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 72);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (BOOL)wantsRenderNodeCached
{
  return 1;
}

- (BOOL)wantsPrepareNodeCached
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 1;
}

- (BOOL)wantsRenderStage
{
  return 1;
}

- (BOOL)wantsOutputVideo
{
  return 0;
}

- (BOOL)wantsOutputVideoFrame
{
  return 0;
}

- (BOOL)wantsOutputImage
{
  return 0;
}

- (BOOL)wantsOutputGeometry
{
  return 0;
}

- (id)renderer:(id *)a3
{
  uint64_t v5 = [(NURenderJob *)self priority];
  char v6 = [v5 isLow];

  if (v6)
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [(NURenderJob *)self priority];
    int v9 = [v8 isHigh];

    if (v9) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  uint64_t v10 = [(NURenderJob *)self request];
  int v11 = [v10 shouldUseLowMemoryMode];

  if (v11)
  {
    v7 |= 8uLL;
  }
  else
  {
    char v12 = [(NURenderJob *)self request];
    int v13 = [v12 isOneShot];

    if (!v13) {
      v7 |= 4uLL;
    }
  }
  long long v14 = [(NURenderJob *)self request];
  int v15 = [v14 isOneShot];

  if (v15) {
    uint64_t v16 = v7 | 0x10;
  }
  else {
    uint64_t v16 = v7;
  }
  char v17 = [(NURenderJob *)self device];
  uint64_t v18 = [v17 rendererWithOptions:v16 error:a3];

  return v18;
}

- (NUExtentPolicy)extentPolicy
{
  return 0;
}

- (NUScalePolicy)scalePolicy
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
  }
  uint64_t v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = NSString;
    id v4 = v2;
    uint64_t v5 = (objc_class *)objc_opt_class();
    char v6 = NSStringFromClass(v5);
    uint64_t v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    int v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F29060];
    int v11 = v9;
    char v12 = [v10 callStackSymbols];
    int v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  long long v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  int v11 = v14;
  uint64_t v18 = [v16 callStackSymbols];
  __int16 v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v27 = specific;
  __int16 v28 = 2114;
  uint64_t v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NURenderJob scalePolicy]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 294, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (NUPriority)priority
{
  return [(NURenderRequest *)self->_request priority];
}

- (void)_emitSignpostEventType:(unsigned __int8)a3 forStage:(int64_t)a4 duration:(double)a5
{
  int v7 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
  }
  int v9 = (id)_NUScheduleLogger;
  if (v7 == 2)
  {
    if (NUIsAppleInternal_onceToken != -1) {
      dispatch_once(&NUIsAppleInternal_onceToken, &__block_literal_global_18);
    }
    if (NUIsAppleInternal_isAppleInternal)
    {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0x2000];
      objc_msgSend(v10, "appendFormat:", @"Duration = %.3f\n", *(void *)&a5);
      if ((unint64_t)(a4 - 1) > 5) {
        int v11 = @"None";
      }
      else {
        int v11 = off_1E5D95620[a4 - 1];
      }
      [v10 appendFormat:@"Stage = %@\n", v11];
      char v12 = [(NURenderJob *)self request];
      int v13 = [v12 name];
      [v10 appendFormat:@"Name=%@, Job=%llu\n\n", v13, -[NURenderJob jobNumber](self, "jobNumber")];

      [v10 appendString:@"----\n"];
      long long v14 = [(NURenderJob *)self additionalDebugInfo];
      [v10 appendFormat:@"jobDebugInfo = \n%@\n", v14];

      [v10 appendString:@"----\n"];
      int v15 = [(NURenderJob *)self request];
      uint64_t v16 = [v15 additionalDebugInfo];

      [v10 appendFormat:@"\nrequestDebugInfo = \n%@\n", v16];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = v10;
        _os_log_debug_impl(&dword_1A9892000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v9, self);
  switch(a4)
  {
    case 0:
      uint64_t v18 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_36;
      }
      __int16 v19 = v18;
      if (!os_signpost_enabled(v18)) {
        goto LABEL_36;
      }
      uint64_t v20 = [(NURenderJob *)self request];
      uint64_t v21 = [v20 name];
      unint64_t v22 = [(NURenderJob *)self jobNumber];
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v21;
      __int16 v38 = 2048;
      unint64_t v39 = v22;
      uint64_t v23 = "None";
      break;
    case 1:
      uint64_t v30 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_36;
      }
      __int16 v19 = v30;
      if (!os_signpost_enabled(v30)) {
        goto LABEL_36;
      }
      uint64_t v20 = [(NURenderJob *)self request];
      uint64_t v21 = [v20 name];
      unint64_t v31 = [(NURenderJob *)self jobNumber];
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v21;
      __int16 v38 = 2048;
      unint64_t v39 = v31;
      uint64_t v23 = "Prepare";
      break;
    case 2:
      uint64_t v24 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_36;
      }
      __int16 v19 = v24;
      if (!os_signpost_enabled(v24)) {
        goto LABEL_36;
      }
      uint64_t v20 = [(NURenderJob *)self request];
      uint64_t v21 = [v20 name];
      unint64_t v25 = [(NURenderJob *)self jobNumber];
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v21;
      __int16 v38 = 2048;
      unint64_t v39 = v25;
      uint64_t v23 = "WaitPause";
      break;
    case 3:
      uint64_t v26 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_36;
      }
      __int16 v19 = v26;
      if (!os_signpost_enabled(v26)) {
        goto LABEL_36;
      }
      uint64_t v20 = [(NURenderJob *)self request];
      uint64_t v21 = [v20 name];
      unint64_t v27 = [(NURenderJob *)self jobNumber];
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v21;
      __int16 v38 = 2048;
      unint64_t v39 = v27;
      uint64_t v23 = "WaitDependencies";
      break;
    case 4:
      __int16 v28 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_36;
      }
      __int16 v19 = v28;
      if (!os_signpost_enabled(v28)) {
        goto LABEL_36;
      }
      uint64_t v20 = [(NURenderJob *)self request];
      uint64_t v21 = [v20 name];
      unint64_t v29 = [(NURenderJob *)self jobNumber];
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v21;
      __int16 v38 = 2048;
      unint64_t v39 = v29;
      uint64_t v23 = "Render";
      break;
    case 5:
      uint64_t v32 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_36;
      }
      __int16 v19 = v32;
      if (!os_signpost_enabled(v32)) {
        goto LABEL_36;
      }
      uint64_t v20 = [(NURenderJob *)self request];
      uint64_t v21 = [v20 name];
      unint64_t v33 = [(NURenderJob *)self jobNumber];
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v21;
      __int16 v38 = 2048;
      unint64_t v39 = v33;
      uint64_t v23 = "Complete";
      break;
    case 6:
      uint64_t v34 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_36;
      }
      __int16 v19 = v34;
      if (!os_signpost_enabled(v34)) {
        goto LABEL_36;
      }
      uint64_t v20 = [(NURenderJob *)self request];
      uint64_t v21 = [v20 name];
      unint64_t v35 = [(NURenderJob *)self jobNumber];
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v21;
      __int16 v38 = 2048;
      unint64_t v39 = v35;
      uint64_t v23 = "Done";
      break;
    default:
      goto LABEL_37;
  }
  _os_signpost_emit_with_name_impl(&dword_1A9892000, v19, (os_signpost_type_t)v7, v17, v23, "Name=%@, Job=%llu", buf, 0x16u);

LABEL_36:
LABEL_37:
}

- (void)_run:(int64_t)a3
{
  int64_t v4 = [(NURenderJob *)self willRun];
  if (v4)
  {
    int64_t v5 = v4;
    [(NURenderJob *)self _emitSignpostEventType:1 forStage:v4 duration:0.0];
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = 0;
    if (![(NURenderJob *)self runStage:v5 error:&v7]) {
      [(NURenderJob *)self fail:v7];
    }
    [(NURenderJob *)self _emitSignpostEventType:2 forStage:v5 duration:CFAbsoluteTimeGetCurrent() - Current];
    [(NURenderJob *)self didRun];
  }
}

- (void)run:(int64_t)a3
{
  int64_t v5 = [(NURenderJob *)self request];
  char v6 = [v5 voucher];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __19__NURenderJob_run___block_invoke;
  v7[3] = &unk_1E5D95558;
  v7[4] = self;
  v7[5] = a3;
  NULogAdoptVoucher(v6, v7);
}

uint64_t __19__NURenderJob_run___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _run:*(void *)(a1 + 40)];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(NURenderJob *)self currentStage] - 1;
  if (v5 > 5) {
    char v6 = @"None";
  }
  else {
    char v6 = off_1E5D95620[v5];
  }
  uint64_t v7 = [(NURenderJob *)self request];
  uint64_t v8 = [v3 stringWithFormat:@"<%@:%p - state: %@ request: %@>", v4, self, v6, v7];

  return v8;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NURenderJob *)self outputGeometry];

  if (!v3)
  {
    uint64_t v10 = NUAssertLogger_21966();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = [NSString stringWithFormat:@"Output geometry is missing. Either the job's prepare stage has not been performed, or the job did not request output geometry."];
      *(_DWORD *)uint64_t v26 = 138543362;
      *(void *)&v26[4] = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v26, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int v13 = NUAssertLogger_21966();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        os_signpost_id_t v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        uint64_t v20 = [v18 callStackSymbols];
        uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v26 = 138543618;
        *(void *)&v26[4] = v17;
        __int16 v27 = 2114;
        __int16 v28 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v26, 0x16u);
      }
    }
    else if (v14)
    {
      int v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v26 = 138543362;
      *(void *)&v26[4] = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v26, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob imageSize]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 213, @"Output geometry is missing. Either the job's prepare stage has not been performed, or the job did not request output geometry.", v22, v23, v24, v25, *(uint64_t *)v26);
  }
  uint64_t v4 = [(NURenderJob *)self outputGeometry];
  uint64_t v5 = [v4 scaledSize];
  int64_t v7 = v6;

  int64_t v8 = v5;
  int64_t v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (int64_t)resolvedSampleMode:(int64_t)a3
{
  if (a3) {
    return a3;
  }
  uint64_t v4 = [(NURenderJob *)self device];
  int64_t v5 = [v4 defaultSampleMode];

  return v5;
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(NURenderJob *)self request];
  int64_t v6 = objc_alloc_init(NURenderPipelineState);
  [(NURenderPipelineState *)v6 setEvaluationMode:a3];
  int64_t v7 = [v5 pipelineFilters];
  [(NURenderPipelineState *)v6 setPipelineFilters:v7];

  -[NURenderPipelineState setSampleMode:](v6, "setSampleMode:", -[NURenderJob resolvedSampleMode:](self, "resolvedSampleMode:", [v5 sampleMode]));
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a3) {
      goto LABEL_8;
    }
    uint64_t v11 = *((void *)&NUScaleUnknown + 1);
    uint64_t v9 = NUScaleUnknown;
  }
  else
  {
    if ([(NURenderJob *)self renderScale] < 1 || v8 <= 0)
    {
      uint64_t v21 = NUAssertLogger_21966();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = [NSString stringWithFormat:@"Invalid render scale"];
        *(_DWORD *)buf = 138543362;
        BOOL v45 = v22;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v24 = NUAssertLogger_21966();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v25)
        {
          __int16 v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v29 = (void *)MEMORY[0x1E4F29060];
          id v30 = v28;
          unint64_t v31 = [v29 callStackSymbols];
          uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          BOOL v45 = v28;
          __int16 v46 = 2114;
          uint64_t v47 = v32;
          _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v25)
      {
        uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        __int16 v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        BOOL v45 = v27;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NURenderJob newRenderPipelineStateForEvaluationMode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 173, @"Invalid render scale", v33, v34, v35, v36, v37);
    }
    uint64_t v9 = [(NURenderJob *)self renderScale];
    uint64_t v11 = v10;
  }
  -[NURenderPipelineState setScale:](v6, "setScale:", v9, v11);
LABEL_8:
  -[NURenderPipelineState setMediaComponentType:](v6, "setMediaComponentType:", [v5 mediaComponentType]);
  char v12 = [(NURenderJob *)self device];
  [(NURenderPipelineState *)v6 setDevice:v12];

  if (v5)
  {
    [v5 time];
    if ((v42 & 0x100000000) != 0)
    {
      [v5 time];
      long long v37 = v39;
      uint64_t v38 = v40;
      [(NURenderPipelineState *)v6 setTime:&v37];
    }
  }
  else
  {
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
  }
  int v13 = [(NURenderJob *)self request];
  BOOL v14 = [v13 composition];
  if ([v14 mediaType] == 2)
  {
  }
  else
  {
    uint64_t v15 = [v5 mediaComponentType];

    if (v15 != 2) {
      goto LABEL_16;
    }
  }
  [(NURenderPipelineState *)v6 setEnforceEvenDimensions:1];
LABEL_16:
  uint64_t v16 = [(NURenderJob *)self request];
  int v17 = [v16 isOneShot];

  if (v17) {
    [(NURenderPipelineState *)v6 setDisableIntermediateCaching:1];
  }
  uint64_t v18 = [(NURenderJob *)self request];
  int v19 = [v18 shouldUseLowMemoryMode];

  if (v19) {
    [(NURenderPipelineState *)v6 setLowMemoryMode:1];
  }

  return v6;
}

- (void)runToPrepareSynchronous
{
  self->_replySynchronous = 1;
  int64_t v3 = [(NURenderJob *)self currentStage];
  if (![(NURenderJob *)self isFinished])
  {
    do
    {
      [(NURenderJob *)self run:v3];
      if (v3 == 1) {
        break;
      }
      int64_t v3 = [(NURenderJob *)self currentStage];
    }
    while (![(NURenderJob *)self isFinished]);
  }
  self->_replySynchronous = 0;
}

- (void)runSynchronous
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_replySynchronous = 1;
  int64_t v3 = [(NURenderJob *)self currentStage];
  if (![(NURenderJob *)self isFinished])
  {
    do
    {
      [(NURenderJob *)self run:v3];
      int64_t v3 = [(NURenderJob *)self currentStage];
      if (v3 == 3)
      {
        long long v11 = 0u;
        long long v12 = 0u;
        long long v9 = 0u;
        long long v10 = 0u;
        uint64_t v4 = [(NURenderJob *)self dependentJobs];
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v10;
          do
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v10 != v7) {
                objc_enumerationMutation(v4);
              }
              [*(id *)(*((void *)&v9 + 1) + 8 * v8++) runSynchronous];
            }
            while (v6 != v8);
            uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
          }
          while (v6);
        }

        int64_t v3 = 1;
      }
    }
    while (![(NURenderJob *)self isFinished]);
  }
  self->_replySynchronous = 0;
}

- (NURenderJob)initWithRequest:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v28 = NUAssertLogger_21966();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "request != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v46 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    unint64_t v31 = NUAssertLogger_21966();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        uint64_t v38 = [v36 callStackSymbols];
        long long v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v46 = v35;
        __int16 v47 = 2114;
        uint64_t v48 = v39;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v46 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 77, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"request != nil");
  }
  uint64_t v6 = v5;
  v44.receiver = self;
  v44.super_class = (Class)NURenderJob;
  uint64_t v7 = [(NURenderJob *)&v44 init];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
  jobCreationDate = v7->_jobCreationDate;
  v7->_jobCreationDate = (NSDate *)v8;

  v7->_jobNumber = atomic_fetch_add_explicit(&s_nextJobNumber, 1uLL, memory_order_relaxed);
  v7->_unint64_t currentStage = 1;
  long long v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create("NURenderJob_State", v10);
  stateQueue = v7->_stateQueue;
  v7->_stateQueue = (OS_dispatch_queue *)v11;

  objc_storeStrong((id *)&v7->_request, a3);
  int v13 = objc_alloc_init(NUObservatory);
  observatory = v7->_observatory;
  v7->_observatory = v13;

  uint64_t v15 = objc_alloc_init(NURenderJobStatistics);
  stats = v7->_stats;
  v7->_stats = v15;

  [v6 submitTime];
  -[NURenderJobStatistics setRequestTime:](v7->_stats, "setRequestTime:");
  if (+[NUGlobalSettings renderJobDebug])
  {
    [(NURenderJob *)v7 renderJobDebugInit];
    int v17 = [v6 name];
    +[NURenderJobStatistics recordJobCreatedToHistory:v17];
  }
  if (+[NUGlobalSettings imageRenderJobUseSurfaceRenderer])
  {
    int v18 = 1;
LABEL_8:
    v7->_rendererType = v18;
    goto LABEL_10;
  }
  if (+[NUGlobalSettings imageRenderJobUseTextureRenderer])
  {
    int v18 = 2;
    goto LABEL_8;
  }
  v7->_rendererType = 0;
LABEL_10:
  int v19 = [v6 device];
  uint64_t v20 = v19;
  if (v19)
  {
    uint64_t v21 = v19;
    device = v7->_device;
    v7->_device = v21;
  }
  else
  {
    device = +[NUPlatform currentPlatform];
    uint64_t v23 = [device mainDevice];
    uint64_t v24 = v7->_device;
    v7->_device = (NUDevice *)v23;
  }
  dispatch_group_t v25 = dispatch_group_create();
  replyGroup = v7->_replyGroup;
  v7->_replyGroup = (OS_dispatch_group *)v25;

  return v7;
}

- (NURenderJob)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
  }
  int64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSString;
    id v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    long long v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    dispatch_queue_t v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    long long v12 = (void *)MEMORY[0x1E4F29060];
    int v13 = v11;
    uint64_t v14 = [v12 callStackSymbols];
    uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  int v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  int v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  unint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderJob init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 72, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (void)flushCache
{
  id v2 = +[NURenderResultCache shared];
  [v2 flush];
}

- (BOOL)renderVideoFrames:(id)a3 videoMetadataSamples:(id)a4 videoSampleSlices:(id)a5 intoPixelBuffer:(__CVBuffer *)a6 time:(id *)a7 colorSpace:(id)a8 playbackDirection:(int64_t)a9 error:(id *)a10
{
  uint64_t v193 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  if (!a6)
  {
    v101 = NUAssertLogger_21966();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      v102 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "destination != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v102;
      _os_log_error_impl(&dword_1A9892000, v101, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v104 = NUAssertLogger_21966();
    BOOL v105 = os_log_type_enabled(v104, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v105)
      {
        uint64_t v129 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v130 = (void *)MEMORY[0x1E4F29060];
        id v131 = v129;
        v132 = [v130 callStackSymbols];
        v133 = [v132 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v129;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v133;
        _os_log_error_impl(&dword_1A9892000, v104, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v105)
    {
      v106 = [MEMORY[0x1E4F29060] callStackSymbols];
      v107 = [v106 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v107;
      _os_log_error_impl(&dword_1A9892000, v104, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob(VideoSupport) renderVideoFrames:videoMetadataSamples:videoSampleSlices:intoPixelBuffer:time:colorSpace:playbackDirection:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1481, @"Invalid parameter not satisfying: %s", v134, v135, v136, v137, (uint64_t)"destination != NULL");
  }
  if (!a10)
  {
    v108 = NUAssertLogger_21966();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      v109 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v109;
      _os_log_error_impl(&dword_1A9892000, v108, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v110 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v111 = NUAssertLogger_21966();
    BOOL v112 = os_log_type_enabled(v111, OS_LOG_TYPE_ERROR);
    if (v110)
    {
      if (v112)
      {
        v138 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v139 = (void *)MEMORY[0x1E4F29060];
        id v140 = v138;
        v141 = [v139 callStackSymbols];
        v142 = [v141 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v138;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v142;
        _os_log_error_impl(&dword_1A9892000, v111, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v112)
    {
      v113 = [MEMORY[0x1E4F29060] callStackSymbols];
      v114 = [v113 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v114;
      _os_log_error_impl(&dword_1A9892000, v111, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob(VideoSupport) renderVideoFrames:videoMetadataSamples:videoSampleSlices:intoPixelBuffer:time:colorSpace:playbackDirection:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1482, @"Invalid parameter not satisfying: %s", v143, v144, v145, v146, (uint64_t)"error != NULL");
  }
  if (!v16)
  {
    v115 = NUAssertLogger_21966();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
    {
      v116 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "videoFrames != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v116;
      _os_log_error_impl(&dword_1A9892000, v115, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v117 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v118 = NUAssertLogger_21966();
    BOOL v119 = os_log_type_enabled(v118, OS_LOG_TYPE_ERROR);
    if (v117)
    {
      if (v119)
      {
        uint64_t v147 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v148 = (void *)MEMORY[0x1E4F29060];
        id v149 = v147;
        v150 = [v148 callStackSymbols];
        v151 = [v150 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v147;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v151;
        _os_log_error_impl(&dword_1A9892000, v118, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v119)
    {
      v120 = [MEMORY[0x1E4F29060] callStackSymbols];
      v121 = [v120 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v121;
      _os_log_error_impl(&dword_1A9892000, v118, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob(VideoSupport) renderVideoFrames:videoMetadataSamples:videoSampleSlices:intoPixelBuffer:time:colorSpace:playbackDirection:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1483, @"Invalid parameter not satisfying: %s", v152, v153, v154, v155, (uint64_t)"videoFrames != nil");
  }
  if ((a7->var2 & 1) == 0)
  {
    v122 = NUAssertLogger_21966();
    if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
    {
      v123 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "CMTIME_IS_VALID(time)");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v123;
      _os_log_error_impl(&dword_1A9892000, v122, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v124 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v125 = NUAssertLogger_21966();
    BOOL v126 = os_log_type_enabled(v125, OS_LOG_TYPE_ERROR);
    if (v124)
    {
      if (v126)
      {
        v156 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v157 = (void *)MEMORY[0x1E4F29060];
        id v158 = v156;
        v159 = [v157 callStackSymbols];
        v160 = [v159 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v156;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v160;
        _os_log_error_impl(&dword_1A9892000, v125, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v126)
    {
      uint64_t v127 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v128 = [v127 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v128;
      _os_log_error_impl(&dword_1A9892000, v125, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob(VideoSupport) renderVideoFrames:videoMetadataSamples:videoSampleSlices:intoPixelBuffer:time:colorSpace:playbackDirection:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1484, @"Invalid parameter not satisfying: %s", v161, v162, v163, v164, (uint64_t)"CMTIME_IS_VALID(time)");
  }
  uint64_t v20 = v19;
  v177 = a7;
  uint64_t v21 = [(NURenderJob *)self renderer:a10];
  if (v21)
  {
    CFAllocatorRef allocator = a6;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
    }
    uint64_t v22 = (id)_NUScheduleLogger;
    os_signpost_id_t v23 = os_signpost_id_generate(v22);
    uint64_t v24 = v22;
    uint64_t v25 = v24;
    os_signpost_id_t spid = v23;
    unint64_t v182 = v23 - 1;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9892000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "RenderVideoFrames", (const char *)&unk_1A9A9F00F, buf, 2u);
    }

    id v26 = [(NURenderJob *)self newRenderPipelineStateForEvaluationMode:3];
    uint64_t v27 = [(NURenderJob *)self renderScale];
    objc_msgSend(v26, "setScale:", v27, v28);
    [v26 setVideoFrames:v16];
    [v26 setVideoMetadataSamples:v17];
    if (v18) {
      [v26 setVideoSampleSlices:v18];
    }
    long long v187 = *(_OWORD *)&v177->var0;
    int64_t var3 = v177->var3;
    [v26 setTime:&v187];
    [v26 setPlaybackDirection:a9];
    uint64_t v29 = [(NURenderJob *)self renderNodeWithPipelineState:v26 error:a10];
    __int16 v30 = v29;
    if (!v29)
    {
      BOOL v54 = 0;
LABEL_61:

      goto LABEL_62;
    }
    unint64_t v31 = [v29 outputImage:a10];
    if (!v31)
    {
      BOOL v54 = 0;
LABEL_60:

      goto LABEL_61;
    }
    v174 = v30;
    id v166 = v26;
    [v20 applyAttachmentsToCVPixelBuffer:allocator];
    [v31 extent];
    *(void *)buf = v32;
    *(void *)&buf[8] = v33;
    *(void *)&buf[16] = v34;
    *(void *)&buf[24] = v35;
    NU::RectT<long>::RectT(&v190, (CGRect *)buf, 0);
    int64x2_t v180 = v191;
    int8x16_t v181 = v190;
    size_t Width = CVPixelBufferGetWidth(allocator);
    size_t Height = CVPixelBufferGetHeight(allocator);
    size_t v172 = Width;
    v38.i64[0] = Width;
    v38.i64[1] = Height;
    id v170 = v17;
    id v171 = v16;
    id v169 = v18;
    v173 = self;
    v179 = v25;
    if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vextq_s8(v181, v181, 8uLL)), (int32x4_t)vceqq_s64(v38, v180))), 0xFuLL))))
    {
LABEL_32:
      v74 = (void *)[objc_alloc(MEMORY[0x1E4F1E070]) initWithPixelBuffer:allocator];
      if (+[NUColorSpace shouldTagAsDisplayP3:allocator])
      {
        __int16 v75 = +[NUColorSpace displayP3ColorSpace];
        objc_msgSend(v74, "setColorSpace:", objc_msgSend(v75, "CGColorSpace"));
      }
      v76 = NSString;
      uint64_t v77 = [(NURenderJob *)v173 request];
      v78 = [v77 name];
      v79 = [v76 stringWithFormat:@"%@-j%lld", v78, -[NURenderJob jobNumber](v173, "jobNumber")];
      [v74 setLabel:v79];

      if (v20)
      {
        objc_msgSend(v74, "setColorSpace:", objc_msgSend(v20, "CGColorSpace"));
        uint64_t v80 = [v20 isHDR] ^ 1;
        v81 = v179;
      }
      else
      {
        v81 = v179;
        if (!CGColorSpaceUsesITUR_2100TF((CGColorSpaceRef)[v74 colorSpace])) {
          goto LABEL_39;
        }
        uint64_t v80 = 0;
      }
      [v74 setClamped:v80];
LABEL_39:
      v168 = v20;
      unsigned int v82 = 0;
      id v83 = 0;
      CFAllocatorRef allocatora = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      do
      {
        if (v82)
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
          }
          v84 = (void *)_NUScheduleLogger;
          if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_ERROR))
          {
            *(_OWORD *)buf = *(_OWORD *)&v177->var0;
            *(void *)&buf[16] = v177->var3;
            v91 = v84;
            v92 = (__CFString *)CMTimeCopyDescription(allocatora, (CMTime *)buf);
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v92;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v82 + 1;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = 5;
            *(_WORD *)&buf[24] = 2112;
            *(void *)&buf[26] = v83;
            _os_log_error_impl(&dword_1A9892000, v91, OS_LOG_TYPE_ERROR, "Retrying video frame render at time %@: attempt %d of %d; previous error %@",
              buf,
              0x22u);
          }
          v85 = [v21 context];
          [v85 clearCaches];
        }
        v86 = v81;
        int v87 = v86;
        if (v182 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A9892000, v87, OS_SIGNPOST_EVENT, spid, "RenderVideoFrames", "StartingRender", buf, 2u);
        }

        id v184 = 0;
        *(int8x16_t *)buf = v181;
        *(int64x2_t *)&buf[16] = v180;
        v88 = objc_msgSend(v21, "renderImage:rect:toDestination:atPoint:error:", v31, buf, v74, 0, 0, &v184);
        id v89 = v184;

        if (v88)
        {
          id v183 = v89;
          v90 = [v88 waitUntilCompletedAndReturnError:&v183];
          id v83 = v183;

          BOOL v54 = v90 != 0;
          v81 = v179;
        }
        else
        {
          BOOL v54 = 0;
          id v83 = v89;
        }

        if (v82 > 3) {
          break;
        }
        ++v82;
      }
      while (!v54);
      v93 = v87;
      v94 = v93;
      if (v182 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v93))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9892000, v94, OS_SIGNPOST_INTERVAL_END, spid, "RenderVideoFrames", (const char *)&unk_1A9A9F00F, buf, 2u);
      }

      if (!v54)
      {
        v95 = [(NURenderJob *)v173 request];
        v96 = (void *)[v95 copy];
        *a10 = +[NUError errorWithCode:1 reason:@"Failed to render frame. Task creation or completion failed" object:v96 underlyingError:v83];
      }
      id v17 = v170;
      id v16 = v171;
      uint64_t v20 = v168;
      id v18 = v169;
      uint64_t v25 = v179;
      id v26 = v166;
      __int16 v30 = v174;
      goto LABEL_60;
    }
    size_t v39 = Height;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
    }
    uint64_t v40 = (void *)_NUAssertLogger;
    unint64_t v41 = 0x1E4F29000uLL;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = self;
      uint64_t v43 = NSString;
      objc_super v44 = (void *)MEMORY[0x1E4F29238];
      BOOL v45 = v40;
      [v31 extent];
      v186[0] = v46;
      v186[1] = v47;
      v186[2] = v48;
      v186[3] = v49;
      uint64_t v50 = [v44 valueWithBytes:v186 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      v51 = [(NURenderJob *)v42 outputGeometry];
      v52 = [v43 stringWithFormat:@"Frame size != buffer size, b=%@, s=%ldx%ld, g=%@, r=%@, i=%@", v50, v172, v39, v51, v174, v31];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v52;
      _os_log_impl(&dword_1A9892000, v45, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v53 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        self = v173;
        unint64_t v41 = 0x1E4F29000;
        if (v53 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
        }
LABEL_26:
        id v55 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          uint64_t v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          unint64_t v57 = v41;
          uint64_t v58 = (void *)MEMORY[0x1E4F29060];
          id v167 = v56;
          uint64_t v59 = v55;
          uint64_t v60 = [v58 callStackSymbols];
          uint64_t v61 = [v60 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v56;
          self = v173;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v61;
          _os_log_error_impl(&dword_1A9892000, v59, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          unint64_t v41 = v57;
LABEL_64:

          goto LABEL_31;
        }
        goto LABEL_31;
      }
      self = v173;
      unint64_t v41 = 0x1E4F29000uLL;
      if (v53 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_26;
    }
    v62 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v98 = (void *)MEMORY[0x1E4F29060];
      uint64_t v59 = v62;
      v99 = [v98 callStackSymbols];
      v100 = [v99 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v100;
      _os_log_error_impl(&dword_1A9892000, v59, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      self = v173;
      unint64_t v41 = 0x1E4F29000uLL;
      goto LABEL_64;
    }
LABEL_31:
    __int16 v63 = *(void **)(v41 + 568);
    [v31 extent];
    v185[0] = v64;
    v185[1] = v65;
    v185[2] = v66;
    v185[3] = v67;
    uint64_t v68 = [v63 valueWithBytes:v185 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    v165 = [(NURenderJob *)self outputGeometry];
    _NUAssertContinueHandler((uint64_t)"-[NURenderJob(VideoSupport) renderVideoFrames:videoMetadataSamples:videoSampleSlices:intoPixelBuffer:time:colorSpace:playbackDirection:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1526, @"Frame size != buffer size, b=%@, s=%ldx%ld, g=%@, r=%@, i=%@", v69, v70, v71, v72, (uint64_t)v68);

    v73.i64[0] = v172;
    v73.i64[1] = v39;
    *(int8x16_t *)buf = v181;
    *(int64x2_t *)&buf[16] = v180;
    int8x16_t v190 = 0uLL;
    int64x2_t v191 = v73;
    NU::RectT<long>::Intersection((uint64_t)v189, (uint64_t *)buf, v190.i64);
    int64x2_t v180 = (int64x2_t)v189[1];
    int8x16_t v181 = (int8x16_t)v189[0];
    goto LABEL_32;
  }
  BOOL v54 = 0;
LABEL_62:

  return v54;
}

- (id)renderImage:(id)a3 into:(id)a4 colorSpace:(id)a5 roi:(id)a6 imageSize:(id)a7 alpha:(const unint64_t *)a8 error:(id *)a9
{
  int64_t var1 = a7.var1;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v50 = a5;
  id v16 = a6;
  if (!a9)
  {
    uint64_t v32 = NUAssertLogger_21966();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)v81 = 138543362;
      *(void *)&v81[4] = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v81, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v35 = NUAssertLogger_21966();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        size_t v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        uint64_t v42 = [v40 callStackSymbols];
        uint64_t v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)v81 = 138543618;
        *(void *)&v81[4] = v39;
        *(_WORD *)&v81[12] = 2114;
        *(void *)&v81[14] = v43;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v81, 0x16u);
      }
    }
    else if (v36)
    {
      id v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64x2_t v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)v81 = 138543362;
      *(void *)&v81[4] = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v81, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob(RendererSupport) renderImage:into:colorSpace:roi:imageSize:alpha:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1415, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"error != NULL");
  }
  id v17 = v16;
  uint64_t v49 = self;
  v51 = [(NURenderJob *)self renderer:a9];
  if (v51)
  {
    long long v75 = 0u;
    long long v76 = 0u;
    if (v17)
    {
      [v17 bounds];
      uint64_t v18 = *((void *)&v75 + 1);
      uint64_t v48 = v75;
      uint64_t v19 = *((void *)&v76 + 1);
      uint64_t v20 = v76;
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v18 = 0;
      uint64_t v48 = 0;
    }
    [v15 size];
    int64_t v22 = var1 - (v18 + v19);
    uint64_t v24 = v23 - v19;
    *(void *)v81 = 0;
    *(void *)&v81[8] = v81;
    *(void *)&v81[16] = 0x3032000000;
    unsigned int v82 = __Block_byref_object_copy__21939;
    id v83 = __Block_byref_object_dispose__21940;
    id v84 = 0;
    uint64_t v69 = 0;
    uint64_t v70 = &v69;
    uint64_t v71 = 0x3032000000;
    uint64_t v72 = __Block_byref_object_copy__21939;
    int64x2_t v73 = __Block_byref_object_dispose__21940;
    id v74 = 0;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __86__NURenderJob_RendererSupport__renderImage_into_colorSpace_roi_imageSize_alpha_error___block_invoke;
    v52[3] = &unk_1E5D955D8;
    id v25 = v50;
    id v53 = v25;
    BOOL v54 = v49;
    id v26 = v15;
    uint64_t v60 = a8;
    uint64_t v61 = v48;
    int64_t v62 = v22;
    uint64_t v63 = v20;
    uint64_t v64 = v19;
    id v55 = v26;
    uint64_t v58 = v81;
    id v56 = v51;
    uint64_t v65 = 0;
    uint64_t v66 = v24;
    uint64_t v67 = v20;
    uint64_t v68 = v19;
    id v57 = v14;
    uint64_t v59 = &v69;
    [v26 useAsCIRenderDestinationWithRenderer:v56 block:v52];
    if (*(void *)(*(void *)&v81[8] + 40))
    {
      [v26 setColorSpace:v25];
      id v21 = *(id *)(*(void *)&v81[8] + 40);
    }
    else
    {
      uint64_t v27 = [(NURenderJob *)v49 request];
      uint64_t v28 = (void *)[v27 copy];
      *a9 = +[NUError errorWithCode:1 reason:@"failed to prepare render" object:v28 underlyingError:v70[5]];

      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
      }
      uint64_t v29 = _NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_ERROR))
      {
        id v31 = *a9;
        *(_DWORD *)buf = 134218242;
        v78 = v49;
        __int16 v79 = 2114;
        id v80 = v31;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job %p render failed: %{public}@", buf, 0x16u);
      }
      id v21 = 0;
    }

    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(v81, 8);
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

BOOL __86__NURenderJob_RendererSupport__renderImage_into_colorSpace_roi_imageSize_alpha_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(v3, "setColorSpace:", objc_msgSend(*(id *)(a1 + 32), "CGColorSpace"));
  uint64_t v4 = NSString;
  id v5 = [*(id *)(a1 + 40) request];
  uint64_t v6 = [v5 name];
  uint64_t v7 = [v4 stringWithFormat:@"%@-j%lld", v6, objc_msgSend(*(id *)(a1 + 40), "jobNumber")];
  [v3 setLabel:v7];

  int v8 = [*(id *)(a1 + 32) isExtended];
  if (v8)
  {
    long long v9 = [*(id *)(a1 + 48) format];
    char v10 = [v9 supportsExtendedRange];

    if ((v10 & 1) == 0)
    {
      uint64_t v29 = NUAssertLogger_21966();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        __int16 v30 = NSString;
        uint64_t v31 = *(void *)(a1 + 32);
        uint64_t v32 = [*(id *)(a1 + 48) format];
        uint64_t v33 = [v30 stringWithFormat:@"XDR colorspace (%@) is incompatible with format (%@)", v31, v32];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v33;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v35 = NUAssertLogger_21966();
      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v36)
        {
          uint64_t v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          id v50 = (void *)MEMORY[0x1E4F29060];
          id v51 = v49;
          v52 = [v50 callStackSymbols];
          id v53 = [v52 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v49;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v53;
          _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v36)
      {
        id v37 = [MEMORY[0x1E4F29060] callStackSymbols];
        int64x2_t v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v38;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      uint64_t v54 = *(void *)(a1 + 32);
      [*(id *)(a1 + 48) format];
      objc_claimAutoreleasedReturnValue();
      _NUAssertFailHandler((uint64_t)"-[NURenderJob(RendererSupport) renderImage:into:colorSpace:roi:imageSize:alpha:error:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1445, @"XDR colorspace (%@) is incompatible with format (%@)", v55, v56, v57, v58, v54);
    }
  }
  if ([*(id *)(a1 + 32) isHDR])
  {
    dispatch_queue_t v11 = [*(id *)(a1 + 48) format];
    uint64_t v12 = [v11 bitsPerComponent];

    if (v12 <= 9)
    {
      size_t v39 = NUAssertLogger_21966();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = NSString;
        uint64_t v41 = *(void *)(a1 + 32);
        uint64_t v42 = [*(id *)(a1 + 48) format];
        uint64_t v43 = [v40 stringWithFormat:@"HDR colorspace (%@) is incompatible with format (%@)", v41, v42];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v43;
        _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      uint64_t v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v45 = NUAssertLogger_21966();
      BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
      if (v44)
      {
        if (v46)
        {
          uint64_t v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v60 = (void *)MEMORY[0x1E4F29060];
          id v61 = v59;
          int64_t v62 = [v60 callStackSymbols];
          uint64_t v63 = [v62 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v59;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v63;
          _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v46)
      {
        uint64_t v47 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v48;
        _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      uint64_t v64 = *(void *)(a1 + 32);
      [*(id *)(a1 + 48) format];
      objc_claimAutoreleasedReturnValue();
      _NUAssertFailHandler((uint64_t)"-[NURenderJob(RendererSupport) renderImage:into:colorSpace:roi:imageSize:alpha:error:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1446, @"HDR colorspace (%@) is incompatible with format (%@)", v65, v66, v67, v68, v64);
    }
  }
  [v3 setClamped:v8 ^ 1u];
  int v13 = *(void **)(a1 + 88);
  if (v13) {
    [v3 setAlphaMode:*v13];
  }
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
  }
  id v14 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = *(void *)(a1 + 40);
    long long v69 = *(_OWORD *)(a1 + 96);
    uint64_t v25 = *(void *)(a1 + 112);
    uint64_t v26 = *(void *)(a1 + 120);
    uint64_t v27 = v14;
    uint64_t v28 = [NSString stringWithFormat:@"{origin={%ld, %ld} size={%ld, %ld}}]", v69, v25, v26];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v24;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v3;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v28;
    _os_log_debug_impl(&dword_1A9892000, v27, OS_LOG_TYPE_DEBUG, "job %p %{public}@ render ROI %{public}@", buf, 0x20u);
  }
  id v15 = *(void **)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 64);
  id v17 = (id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  id obj = 0;
  long long v18 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 96);
  *(_OWORD *)&buf[16] = v18;
  uint64_t v19 = objc_msgSend(v15, "renderImage:rect:toDestination:atPoint:error:", v16, buf, v3, *(void *)(a1 + 128), *(void *)(a1 + 136), &obj);
  objc_storeStrong(v17, obj);
  uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  BOOL v22 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0;
  return v22;
}

- (id)renderImage:(id)a3 into:(id)a4 colorSpace:(id)a5 roi:(id)a6 imageSize:(id)a7 error:(id *)a8
{
  return -[NURenderJob renderImage:into:colorSpace:roi:imageSize:alpha:error:](self, "renderImage:into:colorSpace:roi:imageSize:alpha:error:", a3, a4, a5, a6, a7.var0, a7.var1, 0, a8);
}

- (void)writeRenderDebugFileToDisk
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NURenderJob *)self debugFilePath];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:512000];
  v86 = (void *)v3;
  [v4 appendString:v3];
  id v5 = [(NURenderJob *)self request];
  uint64_t v6 = [v5 name];
  int v87 = v4;
  [v4 appendFormat:@"%@name: %@\n", @"\n\n", v6];

  if (+[NUGlobalSettings renderJobDebugCaptureOnlyPerfStats])
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    [v4 appendFormat:@"%@\n", v8];
  }
  else
  {
    long long v9 = [(NURenderJob *)self request];
    char v10 = [v9 additionalDebugInfo];
    [v4 appendFormat:@"%@%@", v10, @"\n\n"];

    int v8 = [(NURenderJob *)self additionalDebugInfo];
    [v4 appendString:v8];
  }

  dispatch_queue_t v11 = [(NURenderJob *)self error];

  if (v11)
  {
    uint64_t v12 = [(NURenderJob *)self error];
    int v13 = [v12 description];
    [v4 appendFormat:@"\n\nError:\n%@", v13];
  }
  if ([(NURenderJob *)self isCanceled]) {
    [v4 appendString:@"\n\nTHIS JOB WAS CANCELED / COALESCED"];
  }
  if ([(NURenderJob *)self isAborted]) {
    [v4 appendString:@"\nTHIS JOB WAS ABORTED IN THE MIDDLE OF EXECUTION"];
  }
  id v14 = [(NURenderJob *)self statistics];
  if (v14) {
    id v15 = @"\n\n";
  }
  else {
    id v15 = &stru_1F0017700;
  }
  uint64_t v16 = [(NURenderJob *)self statistics];
  id v17 = [v16 description];
  [v4 appendFormat:@"%@Stats: %@%@", @"\n\n", v15, v17];

  if (+[NUGlobalSettings renderJobDebugCapturePerfStatHistory])
  {
    id v84 = +[NURenderJobStatistics history];
    uint64_t v85 = [(NURenderJob *)self request];
    long long v18 = [v85 name];
    uint64_t v19 = [v84 objectForKeyedSubscript:v18];
    if (v19) {
      uint64_t v20 = @"\n\n";
    }
    else {
      uint64_t v20 = &stru_1F0017700;
    }
    id v21 = +[NURenderJobStatistics history];
    BOOL v22 = [(NURenderJob *)self request];
    uint64_t v23 = [v22 name];
    uint64_t v24 = [v21 objectForKeyedSubscript:v23];
    uint64_t v25 = [v24 description];
    [v87 appendFormat:@"%@Historical Stats: %@%@", @"\n\n", v20, v25];
  }
  if (!+[NUGlobalSettings renderJobDebugCaptureOnlyPerfStats])
  {
    uint64_t v26 = [(NURenderJob *)self nodeCacheAtStartOfJob];
    [v87 appendFormat:@"%@Render Node Cache (at job start): %@", @"\n\n", v26];

    LOBYTE(v26) = +[NUGlobalSettings renderJobDebugCaptureNodeCache];
    uint64_t v27 = +[NURenderNodeCache sharedInstance];
    uint64_t v28 = v27;
    if (v26)
    {
      uint64_t v29 = [v27 debugDescription];
      [v87 appendFormat:@"\n%@Render Node Cache (at job end): %@", @"\n\n", v29];
    }
    else
    {
      [v87 appendFormat:@"\n%@Render Node Cache (at job end): %@", @"\n\n", v27];
    }

    __int16 v30 = [(NURenderJob *)self request];
    uint64_t v31 = [v30 composition];
    if (v31) {
      uint64_t v32 = @"\n\n";
    }
    else {
      uint64_t v32 = &stru_1F0017700;
    }
    uint64_t v33 = [(NURenderJob *)self request];
    if (v33)
    {
      uint64_t v34 = [(NURenderJob *)self request];
      uint64_t v35 = [v34 composition];
      BOOL v36 = [v35 debugDescription];
      [v87 appendFormat:@"%@Composition: %@%@", @"\n\n", v32, v36];
    }
    else
    {
      [v87 appendFormat:@"%@Composition: %@%@", @"\n\n", v32, &stru_1F0017700];
    }

    id v37 = [(NURenderJob *)self outputVideo];
    if (v37) {
      int64x2_t v38 = @"\n\n";
    }
    else {
      int64x2_t v38 = &stru_1F0017700;
    }
    size_t v39 = [(NURenderJob *)self outputVideo];
    if (v39)
    {
      uint64_t v40 = [(NURenderJob *)self outputVideo];
      uint64_t v41 = [v40 debugDescription];
      [v87 appendFormat:@"%@OutputVideo: %@%@", @"\n\n", v38, v41];
    }
    else
    {
      [v87 appendFormat:@"%@OutputVideo: %@%@", @"\n\n", v38, &stru_1F0017700];
    }

    uint64_t v42 = [(NURenderJob *)self outputVideoComposition];
    if (v42) {
      uint64_t v43 = @"\n\n";
    }
    else {
      uint64_t v43 = &stru_1F0017700;
    }
    uint64_t v44 = [(NURenderJob *)self outputVideoComposition];
    if (v44)
    {
      uint64_t v45 = [(NURenderJob *)self outputVideoComposition];
      BOOL v46 = [v45 debugDescription];
      [v87 appendFormat:@"%@OutputVideoComposition: %@%@", @"\n\n", v43, v46];
    }
    else
    {
      [v87 appendFormat:@"%@OutputVideoComposition: %@%@", @"\n\n", v43, &stru_1F0017700];
    }

    uint64_t v47 = [(NURenderJob *)self outputVideo];
    if (v47) {
      uint64_t v48 = @"\n\n";
    }
    else {
      uint64_t v48 = &stru_1F0017700;
    }
    uint64_t v49 = [(NURenderJob *)self outputVideo];
    if (v49)
    {
      id v50 = [(NURenderJob *)self outputVideo];
      id v51 = [v50 debugDescription];
      [v87 appendFormat:@"%@OutputVideo: %@%@", @"\n\n", v48, v51];
    }
    else
    {
      [v87 appendFormat:@"%@OutputVideo: %@%@", @"\n\n", v48, &stru_1F0017700];
    }

    v52 = [(NURenderJob *)self outputAudioMix];
    if (v52) {
      id v53 = @"\n\n";
    }
    else {
      id v53 = &stru_1F0017700;
    }
    uint64_t v54 = [(NURenderJob *)self outputAudioMix];
    uint64_t v55 = [v54 debugDescription];
    [v87 appendFormat:@"%@OutputAudioMix: %@%@", @"\n\n", v53, v55];
  }
  if (+[NUGlobalSettings renderJobDebugCaptureNodeGraphs])
  {
    uint64_t v56 = [(NURenderJob *)self prepareNode];
    if (v56) {
      uint64_t v57 = @"\n\n";
    }
    else {
      uint64_t v57 = &stru_1F0017700;
    }
    uint64_t v58 = [(NURenderJob *)self prepareNode];
    uint64_t v59 = [v58 debugDescription];
    [v87 appendFormat:@"%@PreparedNode: %@%@", @"\n\n", v57, v59];

    uint64_t v60 = [(NURenderJob *)self renderNode];
    if (v60) {
      id v61 = @"\n\n";
    }
    else {
      id v61 = &stru_1F0017700;
    }
    int64_t v62 = [(NURenderJob *)self renderNode];
    uint64_t v63 = [v62 debugDescription];
    [v87 appendFormat:@"%@RenderNode: %@%@", @"\n\n", v61, v63];

    uint64_t v64 = [(NURenderJob *)self outputImage];
    if (v64) {
      uint64_t v65 = @"\n\n";
    }
    else {
      uint64_t v65 = &stru_1F0017700;
    }
    uint64_t v66 = [(NURenderJob *)self outputImage];
    uint64_t v67 = [v66 debugDescription];
    [v87 appendFormat:@"%@OutputImage: %@%@", @"\n\n", v65, v67];
    goto LABEL_70;
  }
  if (!+[NUGlobalSettings renderJobDebugCaptureOnlyPerfStats])
  {
    uint64_t v68 = [(NURenderJob *)self prepareNode];
    if (v68)
    {
      long long v69 = [(NURenderJob *)self prepareNode];
      uint64_t v70 = [v69 description];
      [v87 appendFormat:@"%@PreparedNode: %@", @"\n\n", v70];
    }
    else
    {
      [v87 appendFormat:@"%@PreparedNode: %@", @"\n\n", &stru_1F0017700];
    }

    uint64_t v71 = [(NURenderJob *)self renderNode];
    if (v71)
    {
      uint64_t v72 = [(NURenderJob *)self renderNode];
      int64x2_t v73 = [v72 description];
      [v87 appendFormat:@"%@RenderNode: %@", @"\n\n", v73];
    }
    else
    {
      [v87 appendFormat:@"%@RenderNode: %@", @"\n\n", &stru_1F0017700];
    }

    uint64_t v64 = [(NURenderJob *)self outputImage];
    if (!v64)
    {
      [v87 appendFormat:@"%@OutputImage: %@", @"\n\n", &stru_1F0017700];
      goto LABEL_71;
    }
    uint64_t v66 = [(NURenderJob *)self outputImage];
    uint64_t v67 = [v66 description];
    [v87 appendFormat:@"%@OutputImage: %@", @"\n\n", v67, v83];
LABEL_70:

LABEL_71:
  }
  id v89 = 0;
  [v87 writeToFile:v86 atomically:0 encoding:4 error:&v89];
  id v74 = v89;
  long long v75 = v74;
  if (v87 && !v74 && v86)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_109);
    }
    long long v76 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v93 = v86;
      _os_log_impl(&dword_1A9892000, v76, OS_LOG_TYPE_DEFAULT, "NU_RENDER_JOB_DEBUG wrote to %@", buf, 0xCu);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_109);
    }
    uint64_t v77 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v93 = v86;
      __int16 v94 = 2112;
      id v95 = v75;
      _os_log_error_impl(&dword_1A9892000, v77, OS_LOG_TYPE_ERROR, "NU_RENDER_JOB_DEBUG failed to write to disk. path: %@ error: %@", buf, 0x16u);
    }
  }
  v78 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v90 = *MEMORY[0x1E4F28310];
  __int16 v79 = [(NURenderJob *)self jobCreationDate];
  v91 = v79;
  id v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
  id v88 = 0;
  [v78 setAttributes:v80 ofItemAtPath:v86 error:&v88];
  id v81 = v88;

  if (v81)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_109);
    }
    unsigned int v82 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v93 = v86;
      __int16 v94 = 2112;
      id v95 = v81;
      _os_log_error_impl(&dword_1A9892000, v82, OS_LOG_TYPE_ERROR, "NU_RENDER_JOB_DEBUG failed to update file modification time. path: %@ error: %@", buf, 0x16u);
    }
  }
}

- (void)writeRenderJobDebugTombstone
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(NURenderJob *)self debugFilePath];
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@\n\n%@\n\nTombstone\n\n%@", v2, v5, @"We write a simple debug file to disk when a job is created - a 'tombstone'.Then fill in that file with more execution details when it completes. If thejob never completes forwhatever reason then the tombstone is all that is left around."];

  id v9 = 0;
  LOBYTE(v5) = [v6 writeToFile:v2 atomically:0 encoding:4 error:&v9];
  id v7 = v9;
  if ((v5 & 1) == 0)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_109);
    }
    int v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      dispatch_queue_t v11 = v2;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "NU_RENDER_JOB_DEBUG failed to write to disk. path: %@ error: %@", buf, 0x16u);
    }
  }
}

- (void)renderJobDebugResponded
{
  if ([(NURenderJob *)self shouldWriteJobDebugFile])
  {
    [(NURenderJob *)self writeRenderDebugFileToDisk];
  }
}

- (void)renderJobDebugCanceled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(NURenderJob *)self shouldWriteCanceledJob])
  {
    [(NURenderJob *)self writeRenderDebugFileToDisk];
  }
  else if ([(NURenderJob *)self shouldWriteTombstone])
  {
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v4 = [(NURenderJob *)self debugFilePath];
    id v8 = 0;
    char v5 = [v3 removeItemAtPath:v4 error:&v8];
    id v6 = v8;

    if ((v5 & 1) == 0)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_109);
      }
      id v7 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v6;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "NU_RENDER_JOB_DEBUG could not remove tombstone. error: %@", buf, 0xCu);
      }
    }
  }
}

- (void)renderJobDebugInit
{
  if (renderJobDebugInit_once != -1) {
    dispatch_once(&renderJobDebugInit_once, &__block_literal_global_23532);
  }
  uint64_t v3 = objc_opt_class();
  objc_sync_enter(v3);
  uint64_t v4 = [(NURenderJob *)self request];
  char v5 = [v4 name];

  id v6 = [(id)jobCounts objectForKeyedSubscript:v5];
  if (v6)
  {
    id v7 = [(id)jobCounts objectForKeyedSubscript:v5];
    uint64_t v8 = [v7 unsignedLongValue] + 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  id v9 = [NSNumber numberWithUnsignedLongLong:v8];
  id v10 = (void *)jobCounts;
  uint64_t v11 = [(NURenderJob *)self request];
  __int16 v12 = [v11 name];
  [v10 setObject:v9 forKeyedSubscript:v12];

  objc_sync_exit(v3);
  if (+[NUGlobalSettings renderJobDebugCapture5PercentOfJobs])
  {
    BOOL v13 = __ROR8__(0xCCCCCCCCCCCCCCCDLL * v8, 2) < 0xCCCCCCCCCCCCCCDuLL;
  }
  else
  {
    BOOL v13 = 1;
  }
  [(NURenderJob *)self setShouldWriteJobDebugFile:v13];
  if ([(NURenderJob *)self shouldWriteTombstone]) {
    [(NURenderJob *)self writeRenderJobDebugTombstone];
  }
  if (!+[NUGlobalSettings renderJobDebugCaptureOnlyPerfStats])
  {
    BOOL v14 = +[NUGlobalSettings renderJobDebugCaptureNodeCache];
    id v15 = +[NURenderNodeCache sharedInstance];
    id v17 = v15;
    if (v14) {
      [v15 debugDescription];
    }
    else {
    uint64_t v16 = [v15 description];
    }
    [(NURenderJob *)self setNodeCacheAtStartOfJob:v16];
  }
}

uint64_t __49__NURenderJob_DebugAdditions__renderJobDebugInit__block_invoke()
{
  jobCounts = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

- (BOOL)shouldWriteCanceledJob
{
  BOOL v2 = [(NURenderJob *)self shouldWriteJobDebugFile];
  if (v2)
  {
    LOBYTE(v2) = +[NUGlobalSettings renderJobDebugCaptureCanceledJobs];
  }
  return v2;
}

- (BOOL)shouldWriteTombstone
{
  BOOL v2 = [(NURenderJob *)self shouldWriteJobDebugFile];
  if (v2) {
    LOBYTE(v2) = !+[NUGlobalSettings renderJobDebugCaptureOnlyPerfStats];
  }
  return v2;
}

- (id)debugFilePath
{
  uint64_t v3 = +[NUGlobalSettings tempDir];
  uint64_t v4 = +[NUGlobalSettings tempDir];
  char v5 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v4, "length") - 1);

  if ([v5 isEqual:@"/"]) {
    id v6 = &stru_1F0017700;
  }
  else {
    id v6 = @"/";
  }
  id v7 = NSString;
  uint64_t v8 = +[NUGlobalSettings tempDir];
  uint64_t v9 = getpid();
  id v10 = [(NURenderJob *)self request];
  uint64_t v11 = [v10 name];
  __int16 v12 = [v7 stringWithFormat:@"%@%@%i_%@-j%lld.txt", v8, v6, v9, v11, -[NURenderJob jobNumber](self, "jobNumber")];

  return v12;
}

- (NSMutableString)additionalDebugInfo
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"Render Job Class = %@\n", v5];

  uint64_t v6 = [(NURenderJob *)self outputGeometry];
  id v7 = (void *)v6;
  if (v6) {
    [v3 appendFormat:@"outputGeometry = %@\n", v6];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = self;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [(NURenderJob *)v8 renderedRegion];
      id v10 = (void *)v9;
      if (v9) {
        [v3 appendFormat:@"renderedRegion = %@\n", v9];
      }
    }
  }

  return (NSMutableString *)v3;
}

@end