@interface PTAssetReaderFrame
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)colorBufferTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)disparityBufferTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)metadataTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (CGAffineTransform)colorBufferPreferredTransform;
- (CGAffineTransform)disparityBufferPreferredTransform;
- (NSDictionary)jsonFriendlyMetadata;
- (NSDictionary)metadata;
- (PTAssetReaderFrame)initWithAssetReaderFrame:(id)a3;
- (__CVBuffer)colorBuffer;
- (__CVBuffer)disparityBuffer;
- (id)_jsonFriendlyObject:(id)a3;
- (unint64_t)index;
- (void)dealloc;
- (void)setColorBuffer:(__CVBuffer *)a3;
- (void)setColorBufferPreferredTransform:(CGAffineTransform *)a3;
- (void)setColorBufferTime:(id *)a3;
- (void)setDisparityBuffer:(__CVBuffer *)a3;
- (void)setDisparityBufferPreferredTransform:(CGAffineTransform *)a3;
- (void)setDisparityBufferTime:(id *)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setJsonFriendlyMetadata:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataTime:(id *)a3;
- (void)setTime:(id *)a3;
@end

@implementation PTAssetReaderFrame

- (void)dealloc
{
  if ([(PTAssetReaderFrame *)self disparityBuffer]) {
    CVPixelBufferRelease([(PTAssetReaderFrame *)self disparityBuffer]);
  }
  if ([(PTAssetReaderFrame *)self colorBuffer]) {
    CVPixelBufferRelease([(PTAssetReaderFrame *)self colorBuffer]);
  }
  v3.receiver = self;
  v3.super_class = (Class)PTAssetReaderFrame;
  [(PTAssetReaderFrame *)&v3 dealloc];
}

- (id)_jsonFriendlyObject:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F28D90];
  v25[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  LODWORD(v5) = [v5 isValidJSONObject:v6];

  if (v5)
  {
    id v7 = v4;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = objc_opt_new();
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __42__PTAssetReaderFrame__jsonFriendlyObject___block_invoke;
      v22[3] = &unk_1E6884228;
      v22[4] = self;
      id v9 = v8;
      id v23 = v9;
      [v4 enumerateKeysAndObjectsUsingBlock:v22];
      v10 = v23;
      id v7 = v9;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (id)objc_opt_new();
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = v4;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = -[PTAssetReaderFrame _jsonFriendlyObject:](self, "_jsonFriendlyObject:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
              if (v16) {
                [v7 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
          }
          while (v13);
        }
      }
      else
      {
        id v7 = 0;
      }
    }
  }

  return v7;
}

void __42__PTAssetReaderFrame__jsonFriendlyObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [*(id *)(a1 + 32) _jsonFriendlyObject:v5];
    if (v6) {
      [*(id *)(a1 + 40) setObject:v6 forKey:v7];
    }
  }
}

- (NSDictionary)jsonFriendlyMetadata
{
  objc_super v3 = [(PTAssetReaderFrame *)self metadata];

  if (v3)
  {
    id v4 = [(PTAssetReaderFrame *)self metadata];
    id v5 = [(PTAssetReaderFrame *)self _jsonFriendlyObject:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (PTAssetReaderFrame)initWithAssetReaderFrame:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PTAssetReaderFrame;
  id v5 = [(PTAssetReaderFrame *)&v21 init];
  v6 = v5;
  if (v5)
  {
    p_time = &v5->_time;
    if (v4)
    {
      [v4 time];
    }
    else
    {
      long long v14 = 0uLL;
      *(void *)&long long v18 = 0;
    }
    *(_OWORD *)&p_time->value = v14;
    v6->_time.epoch = v18;
    v6->_index = objc_msgSend(v4, "index", v14, (void)v18);
    v8 = [v4 metadata];
    uint64_t v9 = [v8 copy];
    metadata = v6->_metadata;
    v6->_metadata = (NSDictionary *)v9;

    if (v4)
    {
      [v4 metadataTime];
    }
    else
    {
      long long v15 = 0uLL;
      int64_t v19 = 0;
    }
    *(_OWORD *)&v6->_metadataTime.value = v15;
    v6->_metadataTime.epoch = v19;
    v6->_colorBuffer = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v4, "colorBuffer", v15, v19));
    p_colorBufferTime = &v6->_colorBufferTime;
    if (v4)
    {
      [v4 colorBufferTime];
      *(_OWORD *)&p_colorBufferTime->value = v16;
      v6->_colorBufferTime.epoch = v18;
      [v4 colorBufferPreferredTransform];
    }
    else
    {
      p_colorBufferTime->value = 0;
      *(void *)&v6->_colorBufferTime.timescale = 0;
      v6->_colorBufferTime.epoch = 0;
      long long v18 = 0u;
      long long v20 = 0u;
      long long v16 = 0u;
    }
    *(_OWORD *)&v6->_colorBufferPreferredTransform.a = v16;
    *(_OWORD *)&v6->_colorBufferPreferredTransform.c = v18;
    *(_OWORD *)&v6->_colorBufferPreferredTransform.tx = v20;
    v6->_disparityBuffer = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v4, "disparityBuffer", v16, (void)v18));
    p_disparityBufferTime = &v6->_disparityBufferTime;
    if (v4)
    {
      [v4 disparityBufferTime];
      *(_OWORD *)&p_disparityBufferTime->value = v17;
      v6->_disparityBufferTime.epoch = v18;
      [v4 disparityBufferPreferredTransform];
    }
    else
    {
      p_disparityBufferTime->value = 0;
      *(void *)&v6->_disparityBufferTime.timescale = 0;
      v6->_disparityBufferTime.epoch = 0;
      long long v18 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
    }
    *(_OWORD *)&v6->_disparityBufferPreferredTransform.a = v17;
    *(_OWORD *)&v6->_disparityBufferPreferredTransform.c = v18;
    *(_OWORD *)&v6->_disparityBufferPreferredTransform.tx = v20;
  }

  return v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void)setJsonFriendlyMetadata:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)metadataTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (void)setMetadataTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_metadataTime.epoch = a3->var3;
  *(_OWORD *)&self->_metadataTime.value = v3;
}

- (__CVBuffer)colorBuffer
{
  return self->_colorBuffer;
}

- (void)setColorBuffer:(__CVBuffer *)a3
{
  self->_colorBuffer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)colorBufferTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setColorBufferTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_colorBufferTime.epoch = a3->var3;
  *(_OWORD *)&self->_colorBufferTime.value = v3;
}

- (CGAffineTransform)colorBufferPreferredTransform
{
  long long v3 = *(_OWORD *)&self[3].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].tx;
  return self;
}

- (void)setColorBufferPreferredTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_colorBufferPreferredTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_colorBufferPreferredTransform.tx = v4;
  *(_OWORD *)&self->_colorBufferPreferredTransform.a = v3;
}

- (__CVBuffer)disparityBuffer
{
  return self->_disparityBuffer;
}

- (void)setDisparityBuffer:(__CVBuffer *)a3
{
  self->_disparityBuffer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)disparityBufferTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setDisparityBufferTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_disparityBufferTime.epoch = a3->var3;
  *(_OWORD *)&self->_disparityBufferTime.value = v3;
}

- (CGAffineTransform)disparityBufferPreferredTransform
{
  long long v3 = *(_OWORD *)&self[4].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].tx;
  return self;
}

- (void)setDisparityBufferPreferredTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_disparityBufferPreferredTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_disparityBufferPreferredTransform.tx = v4;
  *(_OWORD *)&self->_disparityBufferPreferredTransform.a = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonFriendlyMetadata, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end