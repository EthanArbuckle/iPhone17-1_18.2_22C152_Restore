@interface PXGThumbnailRequestQueue
- (PXGThumbnailRequest)requests;
- (PXGThumbnailRequestQueue)init;
- (id)description;
- (int64_t)count;
- (void)dealloc;
- (void)enqueueRequestsWithItemRange:(_NSRange)a3 textureRequestIDs:(_NSRange)a4 displayAssetFetchResult:(id)a5 targetSize:(CGSize)a6 applyCleanApertureCrop:(BOOL)a7 mediaProvider:(id)a8;
- (void)removeAllRequests;
- (void)setCount:(int64_t)a3;
- (void)sortRequests;
@end

@implementation PXGThumbnailRequestQueue

uint64_t __40__PXGThumbnailRequestQueue_sortRequests__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(_DWORD *)(a2 + 16) - *(_DWORD *)(a3 + 16));
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  if (self->_count != a3)
  {
    self->_count = a3;
    int64_t capacity = self->_capacity;
    if (capacity < a3)
    {
      if (!capacity)
      {
        int64_t capacity = 32;
        self->_int64_t capacity = 32;
      }
      if (capacity < a3)
      {
        do
          capacity *= 2;
        while (capacity < a3);
        self->_int64_t capacity = capacity;
      }
      _PXGArrayResize();
    }
  }
}

- (void)sortRequests
{
}

- (PXGThumbnailRequest)requests
{
  return self->_requests;
}

- (void)removeAllRequests
{
  uint64_t v3 = [(PXGThumbnailRequestQueue *)self count];
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    requests = self->_requests;
    do
    {
      CFRelease(requests->var0);
      requests->var0 = 0;
      CFRelease(requests->var1);
      requests->var1 = 0;
      ++requests;
      --v4;
    }
    while (v4);
  }
  [(PXGThumbnailRequestQueue *)self setCount:0];
}

- (void)enqueueRequestsWithItemRange:(_NSRange)a3 textureRequestIDs:(_NSRange)a4 displayAssetFetchResult:(id)a5 targetSize:(CGSize)a6 applyCleanApertureCrop:(BOOL)a7 mediaProvider:(id)a8
{
  BOOL v8 = a7;
  double height = a6.height;
  double width = a6.width;
  unsigned int location = a4.location;
  NSUInteger length = a3.length;
  NSUInteger v13 = a3.location;
  id v25 = a5;
  id v15 = a8;
  int64_t v16 = [(PXGThumbnailRequestQueue *)self count];
  [(PXGThumbnailRequestQueue *)self setCount:[(PXGThumbnailRequestQueue *)self count] + length];
  if (length)
  {
    unsigned __int16 v17 = llround(width);
    unsigned __int16 v18 = llround(height);
    v19 = &self->_requests[v16];
    do
    {
      float v20 = 0.0;
      if (v8)
      {
        v21 = [v25 objectAtIndexedSubscript:v13];
        if ([v21 playbackStyle] == 3) {
          float v20 = 0.9;
        }
        else {
          float v20 = 1.0;
        }
      }
      id v22 = [v25 thumbnailAssetAtIndex:v13];
      id v23 = v15;
      uint64_t v24 = [v22 thumbnailIndex];
      v19->var0 = v22;
      v19->var1 = v23;
      v19->var2 = v24;
      v19->var3 = location;
      v19->var4 = v17;
      v19->var5 = v18;
      v19->var6 = v20;

      ++location;
      ++v13;
      ++v19;
      --length;
    }
    while (length);
  }
}

- (PXGThumbnailRequestQueue)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXGThumbnailRequestQueue;
  return [(PXGThumbnailRequestQueue *)&v3 init];
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p; count:%ld requests:[", v5, self, self->_count];

  if (self->_count >= 1)
  {
    int64_t v7 = 0;
    uint64_t v8 = 16;
    do
    {
      objc_msgSend(v6, "appendFormat:", @"%lu", *(void **)((char *)&self->_requests->var0 + v8));
      ++v7;
      int64_t count = self->_count;
      if (v7 < count)
      {
        [v6 appendString:@", "];
        int64_t count = self->_count;
      }
      v8 += 40;
    }
    while (v7 < count);
  }
  [v6 appendString:@"]>"];
  return v6;
}

- (void)dealloc
{
  [(PXGThumbnailRequestQueue *)self removeAllRequests];
  free(self->_requests);
  v3.receiver = self;
  v3.super_class = (Class)PXGThumbnailRequestQueue;
  [(PXGThumbnailRequestQueue *)&v3 dealloc];
}

@end