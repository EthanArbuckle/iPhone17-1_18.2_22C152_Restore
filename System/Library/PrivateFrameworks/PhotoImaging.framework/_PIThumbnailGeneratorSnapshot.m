@interface _PIThumbnailGeneratorSnapshot
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceTime;
- (NSArray)thumbnailTimes;
- (NSArray)unadjustedThumbnails;
- (NUComposition)composition;
- (NUImageBufferRenderRequest)request;
- (OS_dispatch_queue)resultQueue;
- (PIThumbnailGenerator)generator;
- (_PIThumbnailGeneratorSnapshot)initWithGenerator:(id)a3;
- (_PIThumbnailGeneratorSnapshot)pendingSnapshot;
- (id)completionHandler;
- (id)partialResultHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setComposition:(id)a3;
- (void)setGenerator:(id)a3;
- (void)setPartialResultHandler:(id)a3;
- (void)setPendingSnapshot:(id)a3;
- (void)setReferenceTime:(id *)a3;
- (void)setRequest:(id)a3;
- (void)setResultQueue:(id)a3;
- (void)setThumbnailTimes:(id)a3;
- (void)setUnadjustedThumbnails:(id)a3;
@end

@implementation _PIThumbnailGeneratorSnapshot

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_generator);
  objc_storeStrong((id *)&self->_pendingSnapshot, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_partialResultHandler, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_unadjustedThumbnails, 0);
  objc_storeStrong((id *)&self->_thumbnailTimes, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

- (void)setGenerator:(id)a3
{
}

- (PIThumbnailGenerator)generator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  return (PIThumbnailGenerator *)WeakRetained;
}

- (void)setPendingSnapshot:(id)a3
{
}

- (_PIThumbnailGeneratorSnapshot)pendingSnapshot
{
  return self->_pendingSnapshot;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
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

- (void)setUnadjustedThumbnails:(id)a3
{
}

- (NSArray)unadjustedThumbnails
{
  return self->_unadjustedThumbnails;
}

- (void)setThumbnailTimes:(id)a3
{
}

- (NSArray)thumbnailTimes
{
  return self->_thumbnailTimes;
}

- (void)setRequest:(id)a3
{
}

- (NUImageBufferRenderRequest)request
{
  return self->_request;
}

- (void)setComposition:(id)a3
{
}

- (NUComposition)composition
{
  return self->_composition;
}

- (_PIThumbnailGeneratorSnapshot)initWithGenerator:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_PIThumbnailGeneratorSnapshot;
  id v3 = a3;
  v4 = [(_PIThumbnailGeneratorSnapshot *)&v16 init];
  objc_storeWeak((id *)&v4->_generator, v3);
  v5 = objc_msgSend(v3, "composition", v16.receiver, v16.super_class);
  uint64_t v6 = [v5 copy];
  composition = v4->_composition;
  v4->_composition = (NUComposition *)v6;

  v8 = [v3 thumbnailTimes];
  uint64_t v9 = [v8 copy];
  thumbnailTimes = v4->_thumbnailTimes;
  v4->_thumbnailTimes = (NSArray *)v9;

  uint64_t v11 = [v3 resultQueue];
  resultQueue = v4->_resultQueue;
  v4->_resultQueue = (OS_dispatch_queue *)v11;

  uint64_t v13 = [v3 partialResultHandler];

  id partialResultHandler = v4->_partialResultHandler;
  v4->_id partialResultHandler = (id)v13;

  return v4;
}

@end