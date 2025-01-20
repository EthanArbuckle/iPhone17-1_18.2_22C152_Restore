@interface VKCRemoveBackgroundVideoRequest
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maskTime;
- (NSArray)stickerIDs;
- (NSNumber)maxDimension;
- (NSNumber)maxFileSize;
- (NSNumber)minDimension;
- (NSString)identifier;
- (NSValue)instancePoint;
- (UTType)outputType;
- (VKCImageAnalyzerRequest)photosRequest;
- (VKCRemoveBackgroundVideoRequest)initWithPhotosAnalyzerRequest:(id)a3;
- (__n128)commonInit;
- (id)createMADPreviewRequest;
- (id)createMADRequest;
- (int)madRequestID;
- (os_unfair_lock_s)lock;
- (void)setIdentifier:(id)a3;
- (void)setInstancePoint:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMadRequestID:(int)a3;
- (void)setMaskTime:(id *)a3;
- (void)setMaxDimension:(id)a3;
- (void)setMaxFileSize:(id)a3;
- (void)setMinDimension:(id)a3;
- (void)setOutputType:(id)a3;
- (void)setPhotosRequest:(id)a3;
- (void)setStickerIDs:(id)a3;
@end

@implementation VKCRemoveBackgroundVideoRequest

- (VKCRemoveBackgroundVideoRequest)initWithPhotosAnalyzerRequest:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKCRemoveBackgroundVideoRequest;
  v6 = [(VKCRemoveBackgroundVideoRequest *)&v8 init];
  if (v6)
  {
    if (!v5) {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((request) != nil)", "-[VKCRemoveBackgroundVideoRequest initWithPhotosAnalyzerRequest:]", 0, 0, @"Expected non-nil value for '%s'", "request");
    }
    objc_storeStrong((id *)&v6->_photosRequest, a3);
    -[VKCRemoveBackgroundVideoRequest commonInit]((uint64_t)v6);
  }

  return v6;
}

- (__n128)commonInit
{
  if (a1)
  {
    *(_DWORD *)(a1 + 12) = 0;
    v2 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v3 = [v2 UUIDString];
    v4 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = v3;

    *(_DWORD *)(a1 + 8) = -1;
    uint64_t v5 = MEMORY[0x1E4F1FA48];
    __n128 result = *(__n128 *)MEMORY[0x1E4F1FA48];
    *(_OWORD *)(a1 + 80) = *MEMORY[0x1E4F1FA48];
    *(void *)(a1 + 96) = *(void *)(v5 + 16);
  }
  return result;
}

- (void)setMadRequestID:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_madRequestID = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int)madRequestID
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_madRequestID;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (id)createMADRequest
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F74778]);
  v4 = [(VKCRemoveBackgroundVideoRequest *)self maxDimension];

  if (v4)
  {
    uint64_t v5 = [(VKCRemoveBackgroundVideoRequest *)self maxDimension];
    [v3 setMaxDimension:v5];
  }
  v6 = [(VKCRemoveBackgroundVideoRequest *)self minDimension];

  if (v6)
  {
    v7 = [(VKCRemoveBackgroundVideoRequest *)self minDimension];
    [v3 setMinDimension:v7];
  }
  objc_super v8 = [(VKCRemoveBackgroundVideoRequest *)self maxFileSize];

  if (v8)
  {
    v9 = [(VKCRemoveBackgroundVideoRequest *)self maxFileSize];
    [v3 setMaxFileSize:v9];
  }
  v10 = [(VKCRemoveBackgroundVideoRequest *)self instancePoint];

  if (v10)
  {
    v11 = [(VKCRemoveBackgroundVideoRequest *)self instancePoint];
    [v3 setInstancePoint:v11];
  }
  v12 = [(VKCRemoveBackgroundVideoRequest *)self outputType];

  if (v12)
  {
    v13 = [(VKCRemoveBackgroundVideoRequest *)self outputType];
    [v3 setOutputType:v13];
  }
  v14 = [(VKCRemoveBackgroundVideoRequest *)self stickerIDs];

  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = [(VKCRemoveBackgroundVideoRequest *)self stickerIDs];
    [v3 setStickerIdentifiers:v15];
  }
  [(VKCRemoveBackgroundVideoRequest *)self maskTime];
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2))
  {
    [(VKCRemoveBackgroundVideoRequest *)self maskTime];
    long long v17 = v19;
    uint64_t v18 = v20;
    [v3 setMaskTime:&v17];
  }
  return v3;
}

- (id)createMADPreviewRequest
{
  v2 = NSClassFromString(&cfstr_Madvideoremove.isa);
  if (v2) {
    v2 = (objc_class *)objc_alloc_init(v2);
  }
  return v2;
}

- (NSValue)instancePoint
{
  return self->_instancePoint;
}

- (void)setInstancePoint:(id)a3
{
}

- (NSNumber)maxDimension
{
  return self->_maxDimension;
}

- (void)setMaxDimension:(id)a3
{
}

- (NSNumber)minDimension
{
  return self->_minDimension;
}

- (void)setMinDimension:(id)a3
{
}

- (NSNumber)maxFileSize
{
  return self->_maxFileSize;
}

- (void)setMaxFileSize:(id)a3
{
}

- (NSArray)stickerIDs
{
  return self->_stickerIDs;
}

- (void)setStickerIDs:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maskTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setMaskTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_maskTime.epoch = a3->var3;
  *(_OWORD *)&self->_maskTime.value = v3;
}

- (UTType)outputType
{
  return self->_outputType;
}

- (void)setOutputType:(id)a3
{
}

- (VKCImageAnalyzerRequest)photosRequest
{
  return self->_photosRequest;
}

- (void)setPhotosRequest:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_photosRequest, 0);
  objc_storeStrong((id *)&self->_outputType, 0);
  objc_storeStrong((id *)&self->_stickerIDs, 0);
  objc_storeStrong((id *)&self->_maxFileSize, 0);
  objc_storeStrong((id *)&self->_minDimension, 0);
  objc_storeStrong((id *)&self->_maxDimension, 0);
  objc_storeStrong((id *)&self->_instancePoint, 0);
}

@end