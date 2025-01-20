@interface PVFrameSet
+ (PVFrameSet)frameSetWithARFrame:(id)a3 depthData:(id)a4 depthFreshness:(int)a5 frameDuration:(id *)a6;
+ (PVFrameSet)frameSetWithARFrame:(id)a3 depthData:(id)a4 depthFreshness:(int)a5 frameDuration:(id *)a6 matte:(id)a7 dilatedDepth:(id)a8;
+ (PVFrameSet)frameSetWithARFrame:(id)a3 frameDuration:(id *)a4;
+ (PVFrameSet)frameSetWithARFrame:(id)a3 frameDuration:(id *)a4 matte:(id)a5 dilatedDepth:(id)a6;
+ (PVFrameSet)frameSetWithARMetadata:(id)a3 depthData:(id)a4 depthFreshness:(int)a5 matte:(id)a6 dilatedDepth:(id)a7 timestamp:(id *)a8 frameDuration:(id *)a9 metadata:(id)a10;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp;
- (AVDepthData)depthData;
- (MTLTexture)dilatedDepth;
- (MTLTexture)matte;
- (PVCMSampleBuffer)colorSampleBuffer;
- (PVFrameSet)initWithColorBuffer:(id)a3 depthData:(id)a4 metadata:(id)a5;
- (PVFrameSet)initWithColorBuffer:(id)a3 depthData:(id)a4 metadata:(id)a5 matte:(id)a6 dilatedDepth:(id)a7;
- (PVFrameSet)initWithColorBuffer:(id)a3 metadata:(id)a4;
- (PVImageBuffer)alphaMaskImageBuffer;
- (PVImageBuffer)colorImageBuffer;
- (id).cxx_construct;
- (id)description;
- (id)metadataDict;
- (id)metadataObjectForKey:(id)a3;
- (void)commonInitWithColorBuffer:(id)a3 depthData:(id)a4 metadata:(id)a5 matte:(id)a6 dilatedDepth:(id)a7;
- (void)setAlphaMaskImageBuffer:(id)a3;
- (void)setMetadataDict:(id)a3;
- (void)setMetadataObject:(id)a3 forKey:(id)a4;
@end

@implementation PVFrameSet

+ (PVFrameSet)frameSetWithARMetadata:(id)a3 depthData:(id)a4 depthFreshness:(int)a5 matte:(id)a6 dilatedDepth:(id)a7 timestamp:(id *)a8 frameDuration:(id *)a9 metadata:(id)a10
{
  uint64_t v13 = *(void *)&a5;
  v31[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a10;
  v30[0] = @"kPVARMetadataKey";
  v30[1] = @"kPVARDepthFreshnessKey";
  v31[0] = v15;
  v20 = [NSNumber numberWithUnsignedInt:v13];
  v31[1] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  if (v19)
  {
    v22 = (void *)[v21 mutableCopy];
    [v22 addEntriesFromDictionary:v19];
  }
  else
  {
    v22 = v21;
  }
  v23 = +[PVImageBuffer imageWithCVPixelBuffer:](PVImageBuffer, "imageWithCVPixelBuffer:", [v15 imageBuffer]);
  long long v28 = *(_OWORD *)&a8->var0;
  int64_t var3 = a8->var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v27 = *a9;
  v24 = +[PVCMSampleBuffer sampleBufferWithPVImageBuffer:v23 timestamp:&v28 frameDuration:&v27];
  v25 = [[PVFrameSet alloc] initWithColorBuffer:v24 depthData:v16 metadata:v22 matte:v17 dilatedDepth:v18];

  return v25;
}

+ (PVFrameSet)frameSetWithARFrame:(id)a3 frameDuration:(id *)a4
{
  id v6 = a3;
  v7 = [v6 capturedDepthData];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  v8 = [a1 frameSetWithARFrame:v6 depthData:v7 depthFreshness:0 frameDuration:&v10];

  return (PVFrameSet *)v8;
}

+ (PVFrameSet)frameSetWithARFrame:(id)a3 depthData:(id)a4 depthFreshness:(int)a5 frameDuration:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  v12 = [[PVARMetadata alloc] initWithARFrame:v10 depthData:v11 depthFreshness:v7];
  [v10 timestamp];
  CMTimeMakeWithSeconds(&v17, v13, 1000000000);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a6;
  v14 = [a1 frameSetWithARMetadata:v12 depthData:v11 depthFreshness:v7 matte:0 dilatedDepth:0 timestamp:&v17 frameDuration:&v16 metadata:0];

  return (PVFrameSet *)v14;
}

+ (PVFrameSet)frameSetWithARFrame:(id)a3 depthData:(id)a4 depthFreshness:(int)a5 frameDuration:(id *)a6 matte:(id)a7 dilatedDepth:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = [[PVARMetadata alloc] initWithARFrame:v14 depthData:v15 depthFreshness:v11];
  [v14 timestamp];
  CMTimeMakeWithSeconds(&v23, v19, 1000000000);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = *a6;
  v20 = [a1 frameSetWithARMetadata:v18 depthData:v15 depthFreshness:v11 matte:v16 dilatedDepth:v17 timestamp:&v23 frameDuration:&v22 metadata:0];

  return (PVFrameSet *)v20;
}

+ (PVFrameSet)frameSetWithARFrame:(id)a3 frameDuration:(id *)a4 matte:(id)a5 dilatedDepth:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  Float64 v13 = [v10 capturedDepthData];
  id v14 = [[PVARMetadata alloc] initWithARFrame:v10 depthData:v13 depthFreshness:0];
  [v10 timestamp];
  CMTimeMakeWithSeconds(&v19, v15, 1000000000);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *a4;
  id v16 = [a1 frameSetWithARMetadata:v14 depthData:v13 depthFreshness:0 matte:v11 dilatedDepth:v12 timestamp:&v19 frameDuration:&v18 metadata:0];

  return (PVFrameSet *)v16;
}

- (PVFrameSet)initWithColorBuffer:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PVFrameSet;
  v8 = [(PVFrameSet *)&v11 init];
  v9 = v8;
  if (v8) {
    [(PVFrameSet *)v8 commonInitWithColorBuffer:v6 depthData:0 metadata:v7 matte:0 dilatedDepth:0];
  }

  return v9;
}

- (PVFrameSet)initWithColorBuffer:(id)a3 depthData:(id)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PVFrameSet;
  objc_super v11 = [(PVFrameSet *)&v14 init];
  id v12 = v11;
  if (v11) {
    [(PVFrameSet *)v11 commonInitWithColorBuffer:v8 depthData:v9 metadata:v10 matte:0 dilatedDepth:0];
  }

  return v12;
}

- (PVFrameSet)initWithColorBuffer:(id)a3 depthData:(id)a4 metadata:(id)a5 matte:(id)a6 dilatedDepth:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PVFrameSet;
  id v17 = [(PVFrameSet *)&v20 init];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = v17;
  if (v17) {
    [(PVFrameSet *)v17 commonInitWithColorBuffer:v12 depthData:v13 metadata:v14 matte:v15 dilatedDepth:v16];
  }

  return v18;
}

- (void)commonInitWithColorBuffer:(id)a3 depthData:(id)a4 metadata:(id)a5 matte:(id)a6 dilatedDepth:(id)a7
{
  id v13 = a3;
  id v14 = (AVDepthData *)a4;
  id v15 = a5;
  id v16 = (MTLTexture *)a6;
  id v17 = (MTLTexture *)a7;
  objc_storeStrong((id *)&self->_colorSampleBuffer, a3);
  depthData = self->_depthData;
  self->_depthData = v14;
  CMTime v19 = v14;

  alphaMaskImageBuffer = self->_alphaMaskImageBuffer;
  self->_alphaMaskImageBuffer = 0;

  matte = self->_matte;
  self->_matte = v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = v16;

  dilatedDepth = self->_dilatedDepth;
  self->_dilatedDepth = v17;

  operator new();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  id v9 = [(PVFrameSet *)self colorSampleBuffer];
  if (v9)
  {
    v5 = [(PVFrameSet *)self colorSampleBuffer];
    id v6 = v5;
    if (v5)
    {
      [v5 presentationTimeStamp];
    }
    else
    {
      retstr->var0 = 0;
      *(void *)&retstr->var1 = 0;
      retstr->int64_t var3 = 0;
    }
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->int64_t var3 = *(void *)(v7 + 16);
  }

  return result;
}

- (PVImageBuffer)colorImageBuffer
{
  uint64_t v3 = [(PVFrameSet *)self colorSampleBuffer];
  if (v3
    && (v4 = (void *)v3,
        [(PVFrameSet *)self colorSampleBuffer],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 sampleBufferRef],
        v5,
        v4,
        v6))
  {
    uint64_t v7 = [(PVFrameSet *)self colorSampleBuffer];
    id v8 = [v7 backingPVImageBuffer];

    id v9 = [(PVFrameSet *)self colorSampleBuffer];
    id v10 = v9;
    if (v8)
    {
      objc_super v11 = [v9 backingPVImageBuffer];
    }
    else
    {
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)[v9 sampleBufferRef]);

      objc_super v11 = +[PVImageBuffer imageWithCVPixelBuffer:ImageBuffer];
    }
  }
  else
  {
    objc_super v11 = 0;
  }

  return (PVImageBuffer *)v11;
}

- (id)metadataDict
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__9;
  id v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  value = self->_mdLock.__ptr_.__value_;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __26__PVFrameSet_metadataDict__block_invoke;
  v5[3] = &unk_1E6169380;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(*(dispatch_queue_t *)value, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __26__PVFrameSet_metadataDict__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setMetadataDict:(id)a3
{
  id v4 = a3;
  value = self->_mdLock.__ptr_.__value_;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  v8[2] = __30__PVFrameSet_setMetadataDict___block_invoke;
  v8[3] = &unk_1E61689D8;
  id v9 = v4;
  id v10 = self;
  uint64_t v6 = *(NSObject **)value;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __30__PVFrameSet_setMetadataDict___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v3 = [v2 mutableCopy];
  }
  else {
    uint64_t v3 = objc_opt_new();
  }
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;
}

- (id)metadataObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__9;
  id v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  value = self->_mdLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __35__PVFrameSet_metadataObjectForKey___block_invoke;
  block[3] = &unk_1E616B740;
  id v11 = v4;
  id v12 = &v13;
  block[4] = self;
  uint64_t v6 = *(NSObject **)value;
  id v7 = v4;
  dispatch_sync(v6, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __35__PVFrameSet_metadataObjectForKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setMetadataObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  value = self->_mdLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __39__PVFrameSet_setMetadataObject_forKey___block_invoke;
  block[3] = &unk_1E616B768;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v9 = *(NSObject **)value;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

uint64_t __39__PVFrameSet_setMetadataObject_forKey___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void **)(a1[5] + 16);
  if (v2) {
    return [v3 setObject:v2 forKeyedSubscript:a1[6]];
  }
  else {
    return [v3 removeObjectForKey:a1[6]];
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PVFrameSet;
  id v4 = [(PVFrameSet *)&v8 description];
  v5 = [(PVFrameSet *)self metadataDict];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (PVCMSampleBuffer)colorSampleBuffer
{
  return self->_colorSampleBuffer;
}

- (AVDepthData)depthData
{
  return self->_depthData;
}

- (PVImageBuffer)alphaMaskImageBuffer
{
  return (PVImageBuffer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAlphaMaskImageBuffer:(id)a3
{
}

- (MTLTexture)matte
{
  return self->_matte;
}

- (MTLTexture)dilatedDepth
{
  return self->_dilatedDepth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dilatedDepth, 0);
  objc_storeStrong((id *)&self->_matte, 0);
  objc_storeStrong((id *)&self->_alphaMaskImageBuffer, 0);
  objc_storeStrong((id *)&self->_depthData, 0);
  objc_storeStrong((id *)&self->_colorSampleBuffer, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)&self->_mdLock, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end