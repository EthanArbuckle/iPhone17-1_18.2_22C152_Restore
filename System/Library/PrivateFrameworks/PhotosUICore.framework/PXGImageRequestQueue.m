@interface PXGImageRequestQueue
- (PXGImageRequestPerformer)imageRequestPerformer;
- (int64_t)count;
- (void)_discardIndexes:(id)a3;
- (void)_removeAllRequests;
- (void)cancelTextureRequests:(id)a3;
- (void)dealloc;
- (void)enqueueRequestsWithSpriteIndexRange:(_PXGSpriteIndexRange)a3 textureRequestIDs:(_NSRange)a4 displayAssetFetchResult:(id)a5 observer:(id)a6 presentationStyles:(unint64_t)a7 targetSize:(CGSize)a8 screenScale:(double)a9 screenMaxHeadroom:(double)a10 adjustment:(id)a11 intent:(unint64_t)a12 useLowMemoryDecode:(BOOL)a13 applyCleanApertureCrop:(BOOL)a14 mediaProvider:(id)a15;
- (void)performRequestsWithAllowedIDs:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setImageRequestPerformer:(id)a3;
@end

@implementation PXGImageRequestQueue

- (void)performRequestsWithAllowedIDs:(id)a3
{
  id v4 = a3;
  v5 = v4;
  int64_t count = self->_count;
  if (count)
  {
    id v23 = v4;
    if (!v4 || (uint64_t v7 = [v4 count], v5 = v23, v7))
    {
      v8 = [(PXGImageRequestQueue *)self imageRequestPerformer];
      id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      v10 = v23;
      id v11 = v9;
      if (count >= 1)
      {
        uint64_t v12 = 0;
        for (uint64_t i = 0; i != count; ++i)
        {
          requests = self->_requests;
          if (!v10 || (int v15 = [v10 containsIndex:requests[v12].var1], v10 = v23, v15))
          {
            v16 = &requests[v12];
            uint64_t var0 = requests[v12].var0;
            uint64_t var1 = v16->var1;
            var2 = v16->var2;
            if (var2)
            {
              CFTypeRef v20 = CFRetain(var2);
              CFTypeRef v21 = CFAutorelease(v20);
            }
            else
            {
              CFTypeRef v21 = 0;
            }
            [v8 performRequestForSpriteIndex:var0 textureRequestID:var1 sharedState:v21];
            v22 = v16->var2;
            if (v22)
            {

              v16->var2 = 0;
            }
            [v11 addIndex:i];
            v10 = v23;
          }
          ++v12;
        }
      }
      [(PXGImageRequestQueue *)self _discardIndexes:v11];

      v5 = v23;
    }
  }
}

- (PXGImageRequestPerformer)imageRequestPerformer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageRequestPerformer);
  return (PXGImageRequestPerformer *)WeakRetained;
}

- (void)_discardIndexes:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__PXGImageRequestQueue__discardIndexes___block_invoke;
  v3[3] = &unk_1E5DCD248;
  v3[4] = self;
  [a3 enumerateRangesWithOptions:2 usingBlock:v3];
}

void __40__PXGImageRequestQueue__discardIndexes___block_invoke(uint64_t a1)
{
}

- (void)enqueueRequestsWithSpriteIndexRange:(_PXGSpriteIndexRange)a3 textureRequestIDs:(_NSRange)a4 displayAssetFetchResult:(id)a5 observer:(id)a6 presentationStyles:(unint64_t)a7 targetSize:(CGSize)a8 screenScale:(double)a9 screenMaxHeadroom:(double)a10 adjustment:(id)a11 intent:(unint64_t)a12 useLowMemoryDecode:(BOOL)a13 applyCleanApertureCrop:(BOOL)a14 mediaProvider:(id)a15
{
  int location = a4.location;
  double height = a8.height;
  double width = a8.width;
  _PXGSpriteIndexRange v21 = a3;
  unint64_t length = a3.length;
  id v34 = a5;
  id v24 = a6;
  id v25 = a11;
  id v26 = a15;
  LOBYTE(v32) = a14;
  v27 = -[PXGImageRequestSharedState initWithDisplayAssetFetchResult:observer:presentationStyles:targetSize:screenScale:screenMaxHeadroom:adjustment:intent:useLowMemoryDecode:applyCleanApertureCrop:mediaProvider:]([PXGImageRequestSharedState alloc], "initWithDisplayAssetFetchResult:observer:presentationStyles:targetSize:screenScale:screenMaxHeadroom:adjustment:intent:useLowMemoryDecode:applyCleanApertureCrop:mediaProvider:", v34, v24, a7, v25, a12, a13, width, height, a9, a10, v32, v26);
  int64_t v28 = [(PXGImageRequestQueue *)self count];
  [(PXGImageRequestQueue *)self setCount:[(PXGImageRequestQueue *)self count] + HIDWORD(*(unint64_t *)&v21)];
  if (length)
  {
    if (length <= 1) {
      uint64_t v29 = 1;
    }
    else {
      uint64_t v29 = length;
    }
    p_var2 = &self->_requests[v28].var2;
    do
    {
      *((_DWORD *)p_var2 - 2) = v21.location;
      *((_DWORD *)p_var2 - 1) = location;
      *p_var2 = 0;
      v31 = v27;
      if (*p_var2 != v31)
      {

        *p_var2 = v31;
      }

      p_var2 += 2;
      ++location;
      ++v21.location;
      --v29;
    }
    while (v29);
  }
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  if (self->_count != a3)
  {
    self->_int64_t count = a3;
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

- (void)setImageRequestPerformer:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_removeAllRequests
{
  int64_t count = self->_count;
  if (count >= 1)
  {
    uint64_t v4 = 8;
    do
    {
      requests = self->_requests;
      v6 = *(void **)((char *)&requests->var0 + v4);
      if (v6)
      {

        *(void *)((char *)&requests->var0 + v4) = 0;
      }
      v4 += 16;
      --count;
    }
    while (count);
  }
  [(PXGImageRequestQueue *)self setCount:0];
}

- (void)cancelTextureRequests:(id)a3
{
  id v4 = a3;
  v5 = v4;
  int64_t count = self->_count;
  if (count)
  {
    v13 = v4;
    uint64_t v7 = [v4 count];
    v5 = v13;
    if (v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      if (count >= 1)
      {
        uint64_t v9 = 0;
        for (uint64_t i = 0; i != count; ++i)
        {
          id v11 = &self->_requests[v9];
          if ([v13 containsIndex:v11->var1])
          {
            var2 = v11->var2;
            if (var2)
            {

              v11->var2 = 0;
            }
            [v8 addIndex:i];
          }
          ++v9;
        }
      }
      [(PXGImageRequestQueue *)self _discardIndexes:v8];

      v5 = v13;
    }
  }
}

- (void)dealloc
{
  [(PXGImageRequestQueue *)self _removeAllRequests];
  free(self->_requests);
  v3.receiver = self;
  v3.super_class = (Class)PXGImageRequestQueue;
  [(PXGImageRequestQueue *)&v3 dealloc];
}

@end