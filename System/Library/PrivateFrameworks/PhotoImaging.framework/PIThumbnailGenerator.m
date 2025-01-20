@interface PIThumbnailGenerator
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceTimeForTimes:(SEL)a3;
+ (id)_sourceFromResult:(id)a3;
+ (id)pipelineFiltersForAdjustedThumbnailRenderWithSource:(id)a3;
+ (id)pipelineFiltersForUnadjustedThumbnail;
+ (id)referenceSourceForTime:(id *)a3 thumbnailTimes:(id)a4 unadjustedSources:(id)a5;
+ (void)_generateAdjustedThumbnailsWithSnapshot:(id)a3;
+ (void)_generateUnadjustedThumbnailsWithSnapshot:(id)a3 completion:(id)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceTime;
- (NSArray)thumbnailTimes;
- (NUComposition)composition;
- (NUScalePolicy)thumbnailScalePolicy;
- (OS_dispatch_queue)resultQueue;
- (PIThumbnailGenerator)init;
- (id)partialResultHandler;
- (void)_generateThumbnailsWithPendingSnapshot:(id)a3;
- (void)_generateThumbnailsWithSnapshot:(id)a3;
- (void)cancelThumbnailGeneration;
- (void)generateThumbnailsWithCompletion:(id)a3;
- (void)generateThumbnailsWithPendingSnapshot:(id)a3;
- (void)setComposition:(id)a3;
- (void)setPartialResultHandler:(id)a3;
- (void)setReferenceTime:(id *)a3;
- (void)setResultQueue:(id)a3;
- (void)setThumbnailScalePolicy:(id)a3;
- (void)setThumbnailTimes:(id)a3;
@end

@implementation PIThumbnailGenerator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_partialResultHandler, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_thumbnailScalePolicy, 0);
  objc_storeStrong((id *)&self->_thumbnailTimes, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_renderRequest, 0);
  objc_storeStrong((id *)&self->_unadjustedThumbnails, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

- (void)setPartialResultHandler:(id)a3
{
}

- (id)partialResultHandler
{
  return self->_partialResultHandler;
}

- (void)setResultQueue:(id)a3
{
}

- (OS_dispatch_queue)resultQueue
{
  return self->_resultQueue;
}

- (void)setReferenceTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_referenceTime.epoch = a3->var3;
  *(_OWORD *)&self->_referenceTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (NUScalePolicy)thumbnailScalePolicy
{
  return self->_thumbnailScalePolicy;
}

- (NSArray)thumbnailTimes
{
  return self->_thumbnailTimes;
}

- (void)setComposition:(id)a3
{
}

- (NUComposition)composition
{
  return self->_composition;
}

- (void)_generateThumbnailsWithSnapshot:(id)a3
{
  id v5 = a3;
  if (self->_currentSnapshot)
  {
    [(_PIThumbnailGeneratorSnapshot *)self->_currentSnapshot setPendingSnapshot:v5];
  }
  else
  {
    objc_storeStrong((id *)&self->_currentSnapshot, a3);
    unadjustedThumbnails = self->_unadjustedThumbnails;
    if (unadjustedThumbnails
      && (uint64_t v7 = [(NSArray *)unadjustedThumbnails count], v7 == [(NSArray *)self->_thumbnailTimes count]))
    {
      [v5 setUnadjustedThumbnails:self->_unadjustedThumbnails];
      [(id)objc_opt_class() _generateAdjustedThumbnailsWithSnapshot:v5];
    }
    else
    {
      v8 = objc_opt_class();
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __56__PIThumbnailGenerator__generateThumbnailsWithSnapshot___block_invoke;
      v9[3] = &unk_1E5D80698;
      id v10 = v5;
      v11 = self;
      [v8 _generateUnadjustedThumbnailsWithSnapshot:v10 completion:v9];
    }
  }
}

void __56__PIThumbnailGenerator__generateThumbnailsWithSnapshot___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [*(id *)(a1 + 32) unadjustedThumbnails];
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v6;

    [(id)objc_opt_class() _generateAdjustedThumbnailsWithSnapshot:*(void *)(a1 + 32)];
  }
  else
  {
    v9 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Unable to generate unadjusted thumbnail" object:*(void *)(a1 + 32) underlyingError:v5];

    id v10 = *(NSObject **)(*(void *)(a1 + 40) + 64);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__PIThumbnailGenerator__generateThumbnailsWithSnapshot___block_invoke_2;
    v11[3] = &unk_1E5D80DD8;
    id v12 = *(id *)(a1 + 32);
    id v5 = v9;
    id v13 = v5;
    dispatch_async(v10, v11);
  }
}

void __56__PIThumbnailGenerator__generateThumbnailsWithSnapshot___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, 0, *(void *)(a1 + 40));
}

- (void)_generateThumbnailsWithPendingSnapshot:(id)a3
{
  id v6 = a3;
  currentSnapshot = self->_currentSnapshot;
  self->_currentSnapshot = 0;

  id v5 = v6;
  if (v6)
  {
    [(PIThumbnailGenerator *)self _generateThumbnailsWithSnapshot:v6];
    id v5 = v6;
  }
}

- (void)generateThumbnailsWithPendingSnapshot:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PIThumbnailGenerator_generateThumbnailsWithPendingSnapshot___block_invoke;
  v7[3] = &unk_1E5D80DD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __62__PIThumbnailGenerator_generateThumbnailsWithPendingSnapshot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _generateThumbnailsWithPendingSnapshot:*(void *)(a1 + 40)];
}

- (void)generateThumbnailsWithCompletion:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_composition)
  {
    v21 = NUAssertLogger_18043();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = [NSString stringWithFormat:@"Missing composition"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v23 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v25 = NUAssertLogger_18043();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v34 = dispatch_get_specific(*v23);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v23 = [v35 callStackSymbols];
        v37 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v37;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v31 = _NUAssertFailHandler();
    goto LABEL_27;
  }
  id v5 = (void (**)(void, void, void))v4;
  thumbnailTimes = self->_thumbnailTimes;
  if (!thumbnailTimes)
  {
    v28 = NUAssertLogger_18043();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = [NSString stringWithFormat:@"Missing thumbnail times"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v29;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v23 = (const void **)MEMORY[0x1E4F7A308];
    v30 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v25 = NUAssertLogger_18043();
    int v31 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (!v30)
    {
      if (v31)
      {
        v32 = [MEMORY[0x1E4F29060] callStackSymbols];
        v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v33;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_29;
    }
LABEL_27:
    if (v31)
    {
      v38 = dispatch_get_specific(*v23);
      v39 = (void *)MEMORY[0x1E4F29060];
      id v40 = v38;
      v41 = [v39 callStackSymbols];
      v42 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v42;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_29:

    _NUAssertFailHandler();
  }
  if ([(NSArray *)thumbnailTimes count])
  {
    uint64_t v7 = [[_PIThumbnailGeneratorSnapshot alloc] initWithGenerator:self];
    [(_PIThumbnailGeneratorSnapshot *)v7 setCompletionHandler:v5];
    memset(buf, 0, sizeof(buf));
    id v8 = objc_opt_class();
    v9 = [(_PIThumbnailGeneratorSnapshot *)v7 thumbnailTimes];
    if (v8) {
      [v8 referenceTimeForTimes:v9];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }

    long long v45 = *(_OWORD *)buf;
    uint64_t v46 = *(void *)&buf[16];
    [(_PIThumbnailGeneratorSnapshot *)v7 setReferenceTime:&v45];
    renderRequest = self->_renderRequest;
    if (!renderRequest)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F7A4C8]);
      id v12 = [(_PIThumbnailGeneratorSnapshot *)v7 composition];
      id v13 = (NUImageBufferRenderRequest *)[v11 initWithComposition:v12];
      v14 = self->_renderRequest;
      self->_renderRequest = v13;

      v15 = [MEMORY[0x1E4F7A400] displayP3ColorSpace];
      [(NUImageBufferRenderRequest *)self->_renderRequest setColorSpace:v15];

      [(NUImageBufferRenderRequest *)self->_renderRequest setResponseQueue:self->_queue];
      renderRequest = self->_renderRequest;
    }
    if (self->_thumbnailScalePolicy)
    {
      -[NUImageBufferRenderRequest setScalePolicy:](renderRequest, "setScalePolicy:");
      renderRequest = self->_renderRequest;
    }
    v16 = (void *)[(NUImageBufferRenderRequest *)renderRequest copy];
    [(_PIThumbnailGeneratorSnapshot *)v7 setRequest:v16];

    v17 = [(_PIThumbnailGeneratorSnapshot *)v7 composition];
    v18 = [(_PIThumbnailGeneratorSnapshot *)v7 request];
    [v18 setComposition:v17];

    queue = self->_queue;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __57__PIThumbnailGenerator_generateThumbnailsWithCompletion___block_invoke;
    v43[3] = &unk_1E5D80DD8;
    v43[4] = self;
    v44 = v7;
    v20 = v7;
    dispatch_async(queue, v43);
  }
  else
  {
    v5[2](v5, MEMORY[0x1E4F1CBF0], 0);
  }
}

uint64_t __57__PIThumbnailGenerator_generateThumbnailsWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _generateThumbnailsWithSnapshot:*(void *)(a1 + 40)];
}

- (void)cancelThumbnailGeneration
{
  long long v3 = [(NUImageBufferRenderRequest *)self->_renderRequest renderContext];
  [v3 cancelAllRequests];

  currentSnapshot = self->_currentSnapshot;
  self->_currentSnapshot = 0;
}

- (void)setThumbnailScalePolicy:(id)a3
{
  id v6 = a3;
  if ((-[NUScalePolicy isEqual:](self->_thumbnailScalePolicy, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_thumbnailScalePolicy, a3);
    unadjustedThumbnails = self->_unadjustedThumbnails;
    self->_unadjustedThumbnails = 0;
  }
}

- (void)setThumbnailTimes:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v8 = NUAssertLogger_18043();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "times != nil");
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v10 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v12 = NUAssertLogger_18043();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific(*v10);
        v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v23 = v16;
        __int16 v24 = 2114;
        v25 = v20;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v21 = v4;
  if (![(NSArray *)self->_thumbnailTimes isEqualToArray:v4])
  {
    id v5 = (NSArray *)[v21 copy];
    thumbnailTimes = self->_thumbnailTimes;
    self->_thumbnailTimes = v5;

    unadjustedThumbnails = self->_unadjustedThumbnails;
    self->_unadjustedThumbnails = 0;
  }
}

- (PIThumbnailGenerator)init
{
  v8.receiver = self;
  v8.super_class = (Class)PIThumbnailGenerator;
  id v2 = [(PIThumbnailGenerator *)&v8 init];
  thumbnailTimes = v2->_thumbnailTimes;
  v2->_thumbnailTimes = (NSArray *)MEMORY[0x1E4F1CBF0];

  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create("PIThumbnailGenerator", v4);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v5;

  objc_storeStrong((id *)&v2->_resultQueue, MEMORY[0x1E4F14428]);
  return v2;
}

+ (id)pipelineFiltersForAdjustedThumbnailRenderWithSource:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F7A618]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PIThumbnailGenerator_pipelineFiltersForAdjustedThumbnailRenderWithSource___block_invoke;
  v9[3] = &unk_1E5D816B8;
  id v10 = v3;
  id v5 = v3;
  id v6 = (void *)[v4 initWithBlock:v9];
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v7;
}

id __76__PIThumbnailGenerator_pipelineFiltersForAdjustedThumbnailRenderWithSource___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = [*(id *)(a1 + 32) definition];
  BOOL v13 = [v12 source];
  v14 = [v13 image];
  if (v14)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_193_18088);
    }
    v15 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      int v26 = 138412290;
      v27 = v14;
      _os_log_impl(&dword_1A9680000, v15, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v26, 0xCu);
    }
  }
  uint64_t v16 = [v9 renderNodeFromSource:*(void *)(a1 + 32) settings:MEMORY[0x1E4F1CC08] error:a5];
  if (!v16)
  {
    id v24 = 0;
    goto LABEL_17;
  }
  v17 = (void *)v16;
  id v18 = [v10 objectForKeyedSubscript:@"semanticStyle"];

  if (!v18) {
    goto LABEL_10;
  }
  uint64_t v19 = [v9 inputForPath:@"semanticStyleLearn" error:a5];
  if (v19)
  {
    v20 = (void *)v19;
    uint64_t v21 = [MEMORY[0x1E4F7A628] styleTransferApplyNodeWithInput:v17 thumbnail:0 target:v19 settings:MEMORY[0x1E4F1CC08]];

    v17 = (void *)v21;
LABEL_10:
    [v9 resetTag:@"pre-WB" input:v17];
    v22 = [v9 getTagWithPath:@"pre-Mute" error:a5];
    if (v22)
    {
      [v9 resetTag:@"pre-Trim" input:v22];
      v23 = [v9 getTagWithPath:@"pre-Trim" error:a5];
      [v9 resetTag:@"pre-SmartTone" input:v23];
      id v24 = v11;
    }
    else
    {
      id v24 = 0;
    }

    goto LABEL_16;
  }
  id v24 = 0;
LABEL_16:

LABEL_17:
  return v24;
}

+ (id)pipelineFiltersForUnadjustedThumbnail
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_18112];
  id v3 = [MEMORY[0x1E4F7A618] stopAtTagFilter:@"/ShowOriginalSource"];
  v8[0] = v3;
  v8[1] = v2;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_141];
  id v6 = [v4 arrayByAddingObject:v5];

  return v6;
}

id __61__PIThumbnailGenerator_pipelineFiltersForUnadjustedThumbnail__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = [a3 objectForKeyedSubscript:@"semanticStyle"];

  if (v10)
  {
    id v11 = [v8 getTagWithPath:@"pre-Adjustments" error:a5];
    if (v11)
    {
      [v8 resetTag:@"/ShowOriginalSource" input:v11];
      id v12 = v9;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = v9;
  }

  return v12;
}

id __61__PIThumbnailGenerator_pipelineFiltersForUnadjustedThumbnail__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7 = a4;
  id v8 = a2;
  [v8 resetTag:@"/pre-Trim" input:v7];
  id v9 = [v8 getTagWithPath:@"/Trim" error:a5];

  return v9;
}

+ (id)referenceSourceForTime:(id *)a3 thumbnailTimes:(id)a4 unadjustedSources:(id)a5
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PIThumbnailGenerator_referenceSourceForTime_thumbnailTimes_unadjustedSources___block_invoke;
  v9[3] = &__block_descriptor_56_e24_B32__0__NSValue_8Q16_B24l;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  id v6 = a5;
  id v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(a4, "indexOfObjectPassingTest:", v9));

  return v7;
}

BOOL __80__PIThumbnailGenerator_referenceSourceForTime_thumbnailTimes_unadjustedSources___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 CMTimeValue];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime v4 = *(CMTime *)(a1 + 32);
  return CMTimeCompare(&v4, &time2) == 0;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceTimeForTimes:(SEL)a3
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  id v5 = [a4 firstObject];
  if (v5)
  {
    id v7 = v5;
    [v5 CMTimeValue];
    id v5 = v7;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

+ (void)_generateAdjustedThumbnailsWithSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [v4 request];
  id v6 = [v4 thumbnailTimes];
  id v7 = [v4 unadjustedThumbnails];
  long long v50 = 0uLL;
  uint64_t v51 = 0;
  if (v4) {
    [v4 referenceTime];
  }
  id v8 = [v4 partialResultHandler];
  id v9 = [v5 composition];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [v9 objectForKeyedSubscript:@"semanticStyle"];

  id v11 = (long long *)MEMORY[0x1E4F1F9F8];
  if (v10)
  {
    long long v48 = v50;
    uint64_t v49 = v51;
    id v12 = &v48;
  }
  else
  {
    long long v46 = *MEMORY[0x1E4F1F9F8];
    uint64_t v47 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    id v12 = &v46;
  }
  [v5 setTime:v12];
  BOOL v13 = [v5 composition];
  v14 = [v13 objectForKeyedSubscript:@"livePhotoKeyFrame"];

  if (v14)
  {
    long long v44 = *v11;
    uint64_t v45 = *((void *)v11 + 2);
    [v5 setTime:&v44];
  }
  [v5 setName:@"PIThumbnailGenerator-AdjustedThumbnail"];
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 1;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__18130;
  v40[4] = __Block_byref_object_dispose__18131;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__18130;
  v38[4] = __Block_byref_object_dispose__18131;
  id v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  [MEMORY[0x1E4F7A648] begin];
  uint64_t v15 = [v7 count];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke;
  v28[3] = &unk_1E5D80788;
  id v16 = v6;
  id v29 = v16;
  id v17 = v5;
  id v36 = a1;
  id v30 = v17;
  v33 = v38;
  id v18 = v8;
  id v32 = v18;
  id v19 = v4;
  id v31 = v19;
  v34 = v40;
  v35 = v42;
  uint64_t v37 = v15;
  [v7 enumerateObjectsUsingBlock:v28];
  v20 = (void *)MEMORY[0x1E4F7A648];
  uint64_t v21 = [v19 resultQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke_4;
  v23[3] = &unk_1E5D807B0;
  id v22 = v19;
  id v24 = v22;
  v25 = v42;
  int v26 = v38;
  v27 = v40;
  [v20 commitAndNotifyOnQueue:v21 withBlock:v23];

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(v42, 8);
}

void __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  long long v32 = 0uLL;
  uint64_t v33 = 0;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a3];
  id v8 = v7;
  if (v7)
  {
    [v7 CMTimeValue];
  }
  else
  {
    long long v32 = 0uLL;
    uint64_t v33 = 0;
  }

  id v9 = objc_alloc(MEMORY[0x1E4F7A478]);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [v6 definition];
  uint64_t v11 = [v10 scale];
  BOOL v13 = objc_msgSend(v9, "initWithScale:", v11, v12);
  [*(id *)(a1 + 40) setScalePolicy:v13];

  v14 = [(id)objc_opt_class() pipelineFiltersForAdjustedThumbnailRenderWithSource:v6];

  [*(id *)(a1 + 40) setPipelineFilters:v14];
  uint64_t v15 = *(void **)(a1 + 40);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke_2;
  v22[3] = &unk_1E5D80760;
  long long v21 = *(_OWORD *)(a1 + 56);
  id v16 = (id)v21;
  long long v25 = v21;
  id v17 = *(id *)(a1 + 48);
  uint64_t v28 = a3;
  long long v30 = v32;
  uint64_t v31 = v33;
  uint64_t v18 = *(void *)(a1 + 72);
  id v23 = v17;
  uint64_t v26 = v18;
  id v19 = *(id *)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 80);
  id v24 = v19;
  uint64_t v27 = v20;
  uint64_t v29 = *(void *)(a1 + 96);
  [v15 submit:v22];
}

void __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completionHandler];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v2;
  (*(void (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v3, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
}

void __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke_2(uint64_t a1, void *a2)
{
  id v20 = 0;
  uint64_t v3 = [a2 result:&v20];
  id v4 = v20;
  if (v3)
  {
    id v5 = [v3 buffer];
    id v6 = (__CVBuffer *)[v5 CVPixelBuffer];

    CVPixelBufferGetIOSurface(v6);
    id v7 = (void *)CGImageCreateFromIOSurface();
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v7];

    if (*(void *)(a1 + 48))
    {
      id v8 = [*(id *)(a1 + 32) resultQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke_3;
      block[3] = &unk_1E5D80738;
      id v15 = *(id *)(a1 + 48);
      id v16 = v7;
      uint64_t v17 = *(void *)(a1 + 80);
      long long v18 = *(_OWORD *)(a1 + 96);
      uint64_t v19 = *(void *)(a1 + 112);
      dispatch_async(v8, block);
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to render adjusted thumbnail" object:*(void *)(a1 + 40) underlyingError:v4];
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
  if (*(void *)(a1 + 88) == 1 || *(void *)(a1 + 80) == *(void *)(a1 + 88) - 1)
  {
    uint64_t v12 = [*(id *)(a1 + 32) generator];
    BOOL v13 = [*(id *)(a1 + 32) pendingSnapshot];
    [v12 generateThumbnailsWithPendingSnapshot:v13];
  }
}

uint64_t __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, long long *))(v2 + 16);
  long long v6 = *(_OWORD *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 72);
  return v4(v2, v1, v3, &v6);
}

+ (id)_sourceFromResult:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1E4F1E050];
  if (v3)
  {
    long long v6 = [v3 buffer];
    uint64_t v7 = objc_msgSend(v5, "imageWithCVPixelBuffer:", objc_msgSend(v6, "CVPixelBuffer"));

    id v8 = [v4 geometry];
    uint64_t v9 = [v8 size];
    uint64_t v11 = v10;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1E008] blackColor];
    uint64_t v12 = [v5 imageWithColor:v8];
    uint64_t v7 = objc_msgSend(v12, "imageByCroppingToRect:", 0.0, 0.0, 100.0, 100.0);

    uint64_t v9 = 100;
    uint64_t v11 = 100;
  }

  [v7 extent];
  uint64_t v13 = NUPixelSizeFromCGSize();
  uint64_t v15 = v14;
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F7A3C8]) initWithCIImage:v7 orientation:1];
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F7A680]), "initWithSourceDefinition:sourceSize:fullSize:", v16, v13, v15, v9, v11);
  id v18 = objc_alloc_init(MEMORY[0x1E4F7A6A0]);
  uint64_t v19 = [MEMORY[0x1E4F29128] UUID];
  id v20 = [v19 UUIDString];
  [v18 setAssetIdentifier:v20];

  [v18 setDefinition:v17];
  return v18;
}

+ (void)_generateUnadjustedThumbnailsWithSnapshot:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 request];
  uint64_t v9 = [v6 thumbnailTimes];
  uint64_t v10 = [(id)objc_opt_class() pipelineFiltersForUnadjustedThumbnail];
  [v8 setPipelineFilters:v10];

  [v8 setName:@"PIThumbnailGenerator-UnadjustedThumbnail"];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__18130;
  v30[4] = __Block_byref_object_dispose__18131;
  id v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__18130;
  void v28[4] = __Block_byref_object_dispose__18131;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [MEMORY[0x1E4F7A648] begin];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __77__PIThumbnailGenerator__generateUnadjustedThumbnailsWithSnapshot_completion___block_invoke;
  v23[3] = &unk_1E5D806E8;
  id v11 = v8;
  id v24 = v11;
  long long v25 = v28;
  uint64_t v26 = v30;
  id v27 = a1;
  [v9 enumerateObjectsUsingBlock:v23];
  uint64_t v12 = (void *)MEMORY[0x1E4F7A648];
  uint64_t v13 = [v11 responseQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__PIThumbnailGenerator__generateUnadjustedThumbnailsWithSnapshot_completion___block_invoke_3;
  v17[3] = &unk_1E5D80710;
  long long v21 = v28;
  id v14 = v9;
  id v18 = v14;
  id v15 = v7;
  id v20 = v15;
  id v16 = v6;
  id v19 = v16;
  id v22 = v30;
  [v12 commitAndNotifyOnQueue:v13 withBlock:v17];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
}

void __77__PIThumbnailGenerator__generateUnadjustedThumbnailsWithSnapshot_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  long long v13 = 0uLL;
  uint64_t v14 = 0;
  if (v3) {
    [v3 CMTimeValue];
  }
  long long v11 = v13;
  uint64_t v12 = v14;
  [*(id *)(a1 + 32) setTime:&v11];
  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PIThumbnailGenerator__generateUnadjustedThumbnailsWithSnapshot_completion___block_invoke_2;
  v7[3] = &unk_1E5D806C0;
  id v8 = v4;
  uint64_t v10 = *(void *)(a1 + 56);
  long long v9 = *(_OWORD *)(a1 + 40);
  id v6 = v4;
  [v5 submit:v7];
}

void __77__PIThumbnailGenerator__generateUnadjustedThumbnailsWithSnapshot_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
  if (v2 == [*(id *)(a1 + 32) count])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) firstObject];
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  else
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_193_18088);
      }
      id v4 = (void *)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        id v6 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        id v7 = v4;
        uint64_t v8 = [v6 count];
        long long v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) componentsJoinedByString:@"\n\t"];
        *(_DWORD *)buf = 134218242;
        uint64_t v12 = v8;
        __int16 v13 = 2114;
        uint64_t v14 = v9;
        _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Failed to generate %ld thumbnails, errors: \n\t%{public}@", buf, 0x16u);
      }
    }
    id v5 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) copy];
    [*(id *)(a1 + 40) setUnadjustedThumbnails:v5];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __77__PIThumbnailGenerator__generateUnadjustedThumbnailsWithSnapshot_completion___block_invoke_2(void *a1, void *a2)
{
  id v7 = 0;
  uint64_t v3 = [a2 result:&v7];
  id v4 = v7;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to render unadjusted image at time" object:a1[4] underlyingError:v4];
    [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v5];
  }
  id v6 = [(id)objc_opt_class() _sourceFromResult:v3];
  [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v6];
}

@end