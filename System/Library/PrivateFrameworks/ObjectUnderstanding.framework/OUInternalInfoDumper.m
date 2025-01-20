@interface OUInternalInfoDumper
+ (id)serailizeARFrameMeta:(id)a3;
- (BOOL)enableARFrameDepth;
- (BOOL)enableARFrameDump;
- (BOOL)enableARFrameRGB;
- (BOOL)enableLiveDump;
- (OUInternalInfoDumper)init;
- (id)encodeDepthPng:(__CVBuffer *)a3;
- (id)encodePng:(__CVBuffer *)a3;
- (id)encodeRGBPng:(__CVBuffer *)a3 withWidth:(unint64_t)a4 Height:(unint64_t)a5;
- (id)getDebugInfoWithConfig:(id)a3 OnlineDebug:(id)a4;
- (void)createDirectory:(id)a3;
- (void)dumpARFrame:(__n128)a3 withKeyFrames:(__n128)a4 withCameraPose:(__n128)a5;
- (void)dumpLastARFrameImage;
- (void)dumpObjects:(id)a3;
- (void)logKeyFrame:(id)a3 WithSkip:(BOOL)a4;
- (void)logMemory:(unint64_t)a3;
- (void)reset;
- (void)setEnableARFrameDepth:(BOOL)a3;
- (void)setEnableARFrameDump:(BOOL)a3;
- (void)setEnableARFrameRGB:(BOOL)a3;
- (void)setEnableLiveDump:(BOOL)a3;
- (void)setFirstARFrame:(id)a3;
- (void)setLastARFrame:(__n128)a3 withCameraPose:(__n128)a4;
- (void)setUpInternalDumpWithLogDir:(id)a3 enable:(BOOL)a4;
@end

@implementation OUInternalInfoDumper

- (OUInternalInfoDumper)init
{
  v9.receiver = self;
  v9.super_class = (Class)OUInternalInfoDumper;
  v2 = [(OUInternalInfoDumper *)&v9 init];
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->_enableARFrameDump = 16843009;
    v2->_maxKeyframeFPS = 3.0;
    dispatch_queue_t v4 = dispatch_queue_create("ObjectUnderstanding.InternalInfoDumper", 0);
    save_queue = v3->_save_queue;
    v3->_save_queue = (OS_dispatch_queue *)v4;

    dispatch_group_t v6 = dispatch_group_create();
    save_group = v3->_save_group;
    v3->_save_group = (OS_dispatch_group *)v6;
  }
  return v3;
}

- (void)createDirectory:(id)a3
{
  id v3 = a3;
  char v8 = 0;
  dispatch_queue_t v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3 isDirectory:&v8];

  if (v8) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  if ((v6 & 1) == 0)
  {
    v7 = [MEMORY[0x263F08850] defaultManager];
    [v7 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];
  }
}

- (void)setUpInternalDumpWithLogDir:(id)a3 enable:(BOOL)a4
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_loggingDirectory, a3);
  char v6 = v8;
  self->_enableLiveDump = 1;
  if (v8)
  {
    v7 = [v8 stringByAppendingPathComponent:@"Live"];
    [(OUInternalInfoDumper *)self createDirectory:v7];

    char v6 = v8;
  }
}

- (void)logKeyFrame:(id)a3 WithSkip:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  NSLog(&cfstr_LogKeyFrame.isa);
  if (self->_enableLiveDump)
  {
    if (!v4
      || self->_maxKeyframeFPS != 0.0
      && (!self->_lastKeyframeTime
       || ([MEMORY[0x263EFF910] date],
           v7 = objc_claimAutoreleasedReturnValue(),
           [v7 timeIntervalSinceDate:self->_lastKeyframeTime],
           double v9 = v8,
           double v10 = 1.0 / self->_maxKeyframeFPS,
           v7,
           v9 >= v10)))
    {
      v11 = [MEMORY[0x263EFF910] date];
      lastKeyframeTime = self->_lastKeyframeTime;
      self->_lastKeyframeTime = v11;

      v13 = [(NSString *)self->_loggingDirectory stringByAppendingPathComponent:@"Live"];
      v14 = self->_save_group;
      v15 = objc_msgSend(v6, "copy", v13);
      v16 = self->_keyframeMeta;
      dispatch_group_enter((dispatch_group_t)v14);
      save_queue = self->_save_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __45__OUInternalInfoDumper_logKeyFrame_WithSkip___block_invoke;
      block[3] = &unk_264CFAE28;
      id v18 = v15;
      id v31 = v18;
      v19 = v16;
      v32 = v19;
      id v20 = v13;
      id v33 = v20;
      v34 = self;
      v21 = v14;
      v35 = v21;
      dispatch_async(save_queue, block);
      v22 = [MEMORY[0x263EFF9A0] dictionary];
      v23 = [NSNumber numberWithBool:v4];
      [v22 setObject:v23 forKeyedSubscript:@"skipped"];

      lastARFrame = self->_lastARFrame;
      if (lastARFrame)
      {
        v25 = NSNumber;
        [(OUFrame *)lastARFrame timestamp];
        v26 = objc_msgSend(v25, "numberWithDouble:");
        [v22 setObject:v26 forKeyedSubscript:@"timestamp"];

        v27 = NSNumber;
        [(OUFrame *)self->_lastARFrame timestamp];
        v29 = [v27 numberWithDouble:v28 - self->_firstARFrameTime];
        [v22 setObject:v29 forKeyedSubscript:@"video_timestamp"];
      }
      else
      {
        [v22 setObject:&unk_26EADCA28 forKeyedSubscript:@"timestamp"];
        [v22 setObject:&unk_26EADCA28 forKeyedSubscript:@"video_timestamp"];
      }
      [(NSMutableArray *)self->_keyframesDebug addObject:v22];
      [(OUInternalInfoDumper *)self dumpLastARFrameImage];
    }
  }
}

void __45__OUInternalInfoDumper_logKeyFrame_WithSkip___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v33 = [MEMORY[0x263EFF980] array];
  long long v44 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v42 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        double v8 = [v6 identifier];
        double v9 = [v7 objectForKeyedSubscript:v8];

        if (v9) {
          [v9 samplePoints];
        }
        else {
          memset(v39, 0, sizeof(v39));
        }
        char v10 = is_sample_points_equal((uint64_t)v39, v6, (uint64_t)__src);
        if (!v9
          || ((char v11 = v10, v12 = [v9 size], v12 == objc_msgSend(v6, "count")) ? (v13 = v11) : (v13 = 0),
              (v13 & 1) == 0))
        {
          v14 = objc_alloc_init(OUKeyframeMetaExtend);
          -[OUKeyframeMeta setSize:](v14, "setSize:", [v6 count]);
          v15 = [v6 identifier];
          [(OUKeyframeMeta *)v14 setIdentifier:v15];

          [v6 cameraPose];
          -[OUKeyframeMeta setCameraPose:](v14, "setCameraPose:");
          [v6 timestamp];
          -[OUKeyframeMeta setTimestamp:](v14, "setTimestamp:");
          memcpy(__dst, __src, sizeof(__dst));
          [(OUKeyframeMetaExtend *)v14 setSamplePoints:__dst];
          v16 = *(void **)(a1 + 40);
          v17 = [v6 identifier];
          [v16 setObject:v14 forKeyedSubscript:v17];

          [v33 addObject:v6];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v3);
  }

  id v18 = objc_alloc_init(MEMORY[0x263F08790]);
  [v18 setDateFormat:@"MM_dd_yyyy_HH_mm_ss_SSS"];
  v19 = NSString;
  uint64_t v20 = *(void *)(a1 + 48);
  v21 = [MEMORY[0x263EFF910] date];
  v22 = [v18 stringFromDate:v21];
  v23 = [v19 stringWithFormat:@"%@/%@_fp_input.plist", v20, v22];

  v24 = [MEMORY[0x263EFF9A0] dictionary];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v25 = v33;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v25);
        }
        v29 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        v30 = [v29 identifier];
        [v24 setObject:v29 forKeyedSubscript:v30];
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v26);
  }

  v45 = @"keyframes";
  id v31 = OUKeyframeSequenceToDictionary(v24);
  v46 = v31;
  v32 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];

  [*(id *)(a1 + 56) createDirectory:*(void *)(a1 + 48)];
  [v32 writeToFile:v23 atomically:0];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (void)setFirstARFrame:(id)a3
{
  id v4 = a3;
  if (self->_enableLiveDump && self->_firstARFrameTime == 0.0)
  {
    id v6 = v4;
    [v4 timestamp];
    self->_firstARFrameTime = v5;
    id v4 = v6;
  }
}

+ (id)serailizeARFrameMeta:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  double v5 = NSNumber;
  [v3 timestamp];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setObject:v6 forKeyedSubscript:@"timestamp"];

  v7 = [v3 sceneCamera];
  [v7 transform];
  long long v25 = v8;
  long long v26 = v9;
  long long v27 = v10;
  long long v28 = v11;

  uint64_t v12 = [MEMORY[0x263EFF8F8] dataWithBytes:&v25 length:64];
  [v4 setObject:v12 forKeyedSubscript:@"cameraTransform"];

  char v13 = objc_msgSend(v3, "sceneCamera", 0, 0, 0, 0, 0, 0, v25, v26, v27, v28);
  [v13 intrinsics];
  DWORD2(v22) = v14;
  DWORD2(v23) = v15;
  *(void *)&long long v22 = v16;
  *(void *)&long long v23 = v17;
  DWORD2(v24) = v18;
  *(void *)&long long v24 = v19;

  uint64_t v20 = [MEMORY[0x263EFF8F8] dataWithBytes:&v22 length:48];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, @"intrinsics", v22, v23, v24);

  return v4;
}

- (void)setLastARFrame:(__n128)a3 withCameraPose:(__n128)a4
{
  id v9 = a7;
  if (*(unsigned char *)(a1 + 177))
  {
    id v10 = v9;
    objc_storeStrong((id *)(a1 + 104), a7);
    id v9 = v10;
    *(__n128 *)(a1 + 112) = a2;
    *(__n128 *)(a1 + 128) = a3;
    *(__n128 *)(a1 + 144) = a4;
    *(__n128 *)(a1 + 160) = a5;
  }
}

- (id)encodePng:(__CVBuffer *)a3
{
  id v4 = [MEMORY[0x263EFF990] data];
  double v5 = CGImageDestinationCreateWithData(v4, @"public.png", 1uLL, 0);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 1647392359)
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    uint64_t v12 = CGBitmapContextCreate(BaseAddress, Width, Height, 0x10uLL, BytesPerRow, DeviceGray, 0x1000u);
    CGColorSpaceRelease(DeviceGray);
  }
  else if (PixelFormatType == 32)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    size_t v11 = CVPixelBufferGetBytesPerRow(a3);
    uint64_t v12 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, v11, DeviceRGB, 6u);
    CGColorSpaceRelease(DeviceRGB);
  }
  else
  {
    uint64_t v12 = 0;
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (v12) {
    Image = CGBitmapContextCreateImage(v12);
  }
  else {
    Image = 0;
  }
  CGContextRelease(v12);
  if (v5 && Image)
  {
    CGImageDestinationAddImage(v5, Image, 0);
    CGImageDestinationFinalize(v5);
  }
  else if (!v5)
  {
    goto LABEL_14;
  }
  CFRelease(v5);
LABEL_14:
  CGImageRelease(Image);
  return v4;
}

- (id)encodeRGBPng:(__CVBuffer *)a3 withWidth:(unint64_t)a4 Height:(unint64_t)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBufferOut = 0;
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  if (VTPixelTransferSessionCreate(0, &pixelTransferSessionOut)
    || (uint64_t v13 = *MEMORY[0x263F04130],
        v14[0] = MEMORY[0x263EFFA78],
        CVPixelBufferCreate(0, a4, a5, 0x20u, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1], &pixelBufferOut))|| !pixelBufferOut)
  {
    id v9 = 0;
  }
  else
  {
    VTPixelTransferSessionTransferImage(pixelTransferSessionOut, a3, pixelBufferOut);
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
    CFRelease(pixelTransferSessionOut);
    id v9 = [(OUInternalInfoDumper *)self encodePng:pixelBufferOut];
    CVPixelBufferRelease(pixelBufferOut);
  }
  return v9;
}

- (id)encodeDepthPng:(__CVBuffer *)a3
{
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  vImagePixelCount Width = CVPixelBufferGetWidth(a3);
  vImagePixelCount Height = CVPixelBufferGetHeight(a3);
  src.width = CVPixelBufferGetWidth(a3);
  src.height = CVPixelBufferGetHeight(a3);
  src.rowBytes = CVPixelBufferGetBytesPerRow(a3);
  dest.height = Height;
  dest.width = Width;
  dest.rowBytes = 32 * Width;
  src.data = CVPixelBufferGetBaseAddress(a3);
  dest.data = malloc_type_malloc(32 * Width * Height, 0x1000040E0EAB150uLL);
  vImageConvert_FTo16U(&src, &dest, 0.0, 0.001, 0);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  CVPixelBufferRef texture = 0;
  if (CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], Width, Height, 0x62313667u, dest.data, dest.rowBytes, 0, 0, 0, &texture))
  {
    free(dest.data);
    v7 = 0;
  }
  else
  {
    v7 = [(OUInternalInfoDumper *)self encodePng:texture];
    free(dest.data);
    CVPixelBufferRelease(texture);
  }
  return v7;
}

- (void)dumpLastARFrameImage
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = [(NSString *)self->_loggingDirectory stringByAppendingPathComponent:@"Live"];
  double firstARFrameTime = self->_firstARFrameTime;
  double v5 = self->_lastARFrame;
  long long v6 = *(_OWORD *)&self->_anon_70[16];
  long long v27 = *(_OWORD *)self->_anon_70;
  long long v28 = v6;
  long long v7 = *(_OWORD *)&self->_anon_70[48];
  long long v29 = *(_OWORD *)&self->_anon_70[32];
  long long v30 = v7;
  uint64_t v8 = [(NSMutableArray *)self->_keyframesDebug count];
  __int16 v9 = *(_WORD *)&self->_enableARFrameRGB;
  id v10 = self->_save_group;
  dispatch_group_enter((dispatch_group_t)v10);
  save_queue = self->_save_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__OUInternalInfoDumper_dumpLastARFrameImage__block_invoke;
  v15[3] = &unk_264CFAE50;
  id v20 = v3;
  v21 = v5;
  long long v23 = v10;
  uint64_t v24 = v8;
  double v25 = firstARFrameTime;
  long long v16 = v27;
  long long v17 = v28;
  long long v18 = v29;
  long long v19 = v30;
  __int16 v26 = v9;
  long long v22 = self;
  uint64_t v12 = v10;
  uint64_t v13 = v5;
  id v14 = v3;
  dispatch_async(save_queue, v15);
}

void __44__OUInternalInfoDumper_dumpLastARFrameImage__block_invoke(uint64_t a1)
{
  id v38 = objc_alloc_init(MEMORY[0x263F08790]);
  [v38 setDateFormat:@"MM_dd_yyyy_HH_mm_ss_SSS"];
  id v2 = NSString;
  uint64_t v3 = *(void *)(a1 + 96);
  id v4 = [MEMORY[0x263EFF910] date];
  double v5 = [v38 stringFromDate:v4];
  uint64_t v6 = [v2 stringWithFormat:@"%@/%@_Image.plist", v3, v5];

  long long v37 = (void *)v6;
  long long v7 = +[OUInternalInfoDumper serailizeARFrameMeta:*(void *)(a1 + 104)];
  uint64_t v8 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 128)];
  [v7 setObject:v8 forKeyedSubscript:@"keyframe_index"];

  __int16 v9 = NSNumber;
  [*(id *)(a1 + 104) timestamp];
  size_t v11 = [v9 numberWithDouble:v10 - *(double *)(a1 + 136)];
  [v7 setObject:v11 forKeyedSubscript:@"video_timestamp"];

  uint64_t v12 = [MEMORY[0x263EFF8F8] dataWithBytes:a1 + 32 length:64];
  [v7 setObject:v12 forKeyedSubscript:@"cameraPose"];

  uint64_t v13 = (__CVBuffer *)[*(id *)(a1 + 104) sceneDepthBuffer];
  uint64_t v36 = [*(id *)(a1 + 104) sceneDepthConfidenceBuffer];
  size_t Width = CVPixelBufferGetWidth(v13);
  size_t Height = CVPixelBufferGetHeight(v13);
  if (Height * Width) {
    BOOL v16 = v13 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  int v17 = !v16;
  if (*(unsigned char *)(a1 + 144))
  {
    long long v18 = [MEMORY[0x263EFF9A0] dictionary];
    long long v19 = v18;
    if (v17)
    {
      id v20 = (__CVBuffer *)[*(id *)(a1 + 104) sceneColorBuffer];
      size_t v21 = CVPixelBufferGetWidth(v20);
      size_t v22 = CVPixelBufferGetHeight(v20);
      long long v23 = [NSNumber numberWithUnsignedLong:v21];
      [v19 setObject:v23 forKeyedSubscript:@"width"];

      uint64_t v24 = [NSNumber numberWithUnsignedLong:v22];
      [v19 setObject:v24 forKeyedSubscript:@"height"];

      id v25 = [*(id *)(a1 + 112) encodeRGBPng:v20 withWidth:v21 Height:v22];
    }
    else
    {
      [v18 setObject:&unk_26EADC920 forKeyedSubscript:@"width"];
      [v19 setObject:&unk_26EADC920 forKeyedSubscript:@"height"];
      id v25 = objc_alloc_init(MEMORY[0x263EFF8F8]);
    }
    [v19 setObject:v25 forKeyedSubscript:@"data"];

    [v19 setObject:@"PNG" forKeyedSubscript:@"type"];
    [v7 setObject:v19 forKeyedSubscript:@"image"];
  }
  if (*(unsigned char *)(a1 + 145))
  {
    __int16 v26 = [MEMORY[0x263EFF9A0] dictionary];
    long long v27 = v26;
    if (v17)
    {
      long long v28 = [NSNumber numberWithUnsignedLong:Width];
      [v27 setObject:v28 forKeyedSubscript:@"width"];

      long long v29 = [NSNumber numberWithUnsignedLong:Height];
      [v27 setObject:v29 forKeyedSubscript:@"height"];

      objc_msgSend(*(id *)(a1 + 112), "encodeDepthPng:", objc_msgSend(*(id *)(a1 + 104), "sceneDepthBuffer"));
      id v30 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      [v26 setObject:&unk_26EADC920 forKeyedSubscript:@"width"];
      [v27 setObject:&unk_26EADC920 forKeyedSubscript:@"height"];
      id v30 = objc_alloc_init(MEMORY[0x263EFF8F8]);
    }
    [v27 setObject:v30 forKeyedSubscript:@"data"];

    [v27 setObject:@"PNG" forKeyedSubscript:@"type"];
    [v7 setObject:v27 forKeyedSubscript:@"depth"];
    uint64_t v31 = [MEMORY[0x263EFF9A0] dictionary];
    v32 = v31;
    if (v36)
    {
      id v33 = [NSNumber numberWithUnsignedLong:Width];
      [v32 setObject:v33 forKeyedSubscript:@"width"];

      long long v34 = [NSNumber numberWithUnsignedLong:Height];
      [v32 setObject:v34 forKeyedSubscript:@"height"];

      objc_msgSend(*(id *)(a1 + 112), "encodeDepthPng:", objc_msgSend(*(id *)(a1 + 104), "sceneDepthConfidenceBuffer"));
      id v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      [v31 setObject:&unk_26EADC920 forKeyedSubscript:@"width"];
      [v32 setObject:&unk_26EADC920 forKeyedSubscript:@"height"];
      id v35 = objc_alloc_init(MEMORY[0x263EFF8F8]);
    }
    [v32 setObject:v35 forKeyedSubscript:@"data"];

    [v32 setObject:@"PNG" forKeyedSubscript:@"type"];
    [v7 setObject:v32 forKeyedSubscript:@"depth_confidence"];
  }
  [*(id *)(a1 + 112) createDirectory:*(void *)(a1 + 96)];
  [v7 writeToFile:v37 atomically:0];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 120));
}

- (void)dumpObjects:(id)a3
{
  id v4 = a3;
  if (self->_enableLiveDump && self->_enableARFrameDump)
  {
    loggingDirectory = self->_loggingDirectory;
    if (loggingDirectory)
    {
      uint64_t v6 = [(NSString *)loggingDirectory stringByAppendingPathComponent:@"Live"];
      long long v7 = self->_save_group;
      dispatch_group_enter((dispatch_group_t)v7);
      save_queue = self->_save_queue;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __36__OUInternalInfoDumper_dumpObjects___block_invoke;
      v11[3] = &unk_264CFAE78;
      id v12 = v6;
      id v13 = v4;
      id v14 = self;
      int v15 = v7;
      __int16 v9 = v7;
      id v10 = v6;
      dispatch_async(save_queue, v11);
    }
  }
}

void __36__OUInternalInfoDumper_dumpObjects___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  [v2 setDateFormat:@"MM_dd_yyyy_HH_mm_ss_SSS"];
  uint64_t v3 = NSString;
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = [v2 stringFromDate:v5];
  long long v7 = [v3 stringWithFormat:@"%@/%@_Objects.plist", v4, v6];

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) dictionaryRepresentation];
        id v14 = (void *)[v13 copy];
        [v8 addObject:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [*(id *)(a1 + 48) createDirectory:*(void *)(a1 + 32)];
  [v8 writeToFile:v7 atomically:0];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)dumpARFrame:(__n128)a3 withKeyFrames:(__n128)a4 withCameraPose:(__n128)a5
{
  id v10 = a7;
  id v11 = a8;
  if ([v10 sceneDepthBuffer]) {
    objc_msgSend((id)a1, "setLastARFrame:withCameraPose:", v10, a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0]);
  }
  NSLog(&cfstr_Enablelivedump.isa, *(unsigned __int8 *)(a1 + 177));
  NSLog(&cfstr_Enablearframed.isa, *(unsigned __int8 *)(a1 + 176));
  NSLog(&cfstr_Loggingdirecto.isa, *(void *)(a1 + 24));
  if (*(unsigned char *)(a1 + 177))
  {
    if (*(unsigned char *)(a1 + 176))
    {
      uint64_t v12 = *(void **)(a1 + 24);
      if (v12)
      {
        id v13 = [v12 stringByAppendingPathComponent:@"Live"];
        uint64_t v14 = *(void *)(a1 + 72);
        long long v15 = *(id *)(a1 + 16);
        uint64_t v16 = [v11 count];
        dispatch_group_enter(v15);
        long long v17 = *(NSObject **)(a1 + 8);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __65__OUInternalInfoDumper_dumpARFrame_withKeyFrames_withCameraPose___block_invoke;
        block[3] = &unk_264CFAEA0;
        id v29 = v13;
        uint64_t v34 = v14;
        __n128 v25 = a2;
        __n128 v26 = a3;
        __n128 v27 = a4;
        __n128 v28 = a5;
        id v30 = v10;
        uint64_t v31 = a1;
        v32 = v15;
        uint64_t v33 = v16;
        long long v18 = v15;
        id v19 = v13;
        dispatch_async(v17, block);
      }
    }
  }
}

void __65__OUInternalInfoDumper_dumpARFrame_withKeyFrames_withCameraPose___block_invoke(uint64_t a1)
{
  id v13 = objc_alloc_init(MEMORY[0x263F08790]);
  [v13 setDateFormat:@"MM_dd_yyyy_HH_mm_ss_SSS"];
  id v2 = NSString;
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  double v5 = [v13 stringFromDate:v4];
  uint64_t v6 = [v2 stringWithFormat:@"%@/%@_ARFrame.plist", v3, v5];

  NSLog(&cfstr_FilePath.isa, v6);
  long long v7 = +[OUInternalInfoDumper serailizeARFrameMeta:*(void *)(a1 + 104)];
  id v8 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 128)];
  [v7 setObject:v8 forKeyedSubscript:@"keyframesCount"];

  id v9 = NSNumber;
  [*(id *)(a1 + 104) timestamp];
  id v11 = [v9 numberWithDouble:v10 - *(double *)(a1 + 136)];
  [v7 setObject:v11 forKeyedSubscript:@"video_timestamp"];

  uint64_t v12 = [MEMORY[0x263EFF8F8] dataWithBytes:a1 + 32 length:64];
  [v7 setObject:v12 forKeyedSubscript:@"cameraPose"];

  [*(id *)(a1 + 112) createDirectory:*(void *)(a1 + 96)];
  [v7 writeToFile:v6 atomically:0];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 120));
}

- (void)logMemory:(unint64_t)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  if (self->_enableLiveDump)
  {
    if (self->_lastARFrame)
    {
      sysDebug = self->_sysDebug;
      v9[0] = @"avail_mem";
      double v5 = [NSNumber numberWithUnsignedLong:a3];
      v9[1] = @"time_stamp";
      v10[0] = v5;
      uint64_t v6 = NSNumber;
      [(OUFrame *)self->_lastARFrame timestamp];
      long long v7 = objc_msgSend(v6, "numberWithDouble:");
      v10[1] = v7;
      id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
      [(NSMutableArray *)sysDebug addObject:v8];
    }
  }
}

- (id)getDebugInfoWithConfig:(id)a3 OnlineDebug:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_enableLiveDump)
  {
    id v9 = [v7 objectForKeyedSubscript:@"floorPlanDebug"];
    uint64_t v10 = [(NSMutableArray *)self->_floorPlanDebug count];
    if (v10 != [v9 count] - 1)
    {
      uint64_t v11 = [(NSMutableArray *)self->_floorPlanDebug count];
      if (v11 != [v9 count]) {
        __assert_rtn("-[OUInternalInfoDumper getDebugInfoWithConfig:OnlineDebug:]", "OUDebugInfo.mm", 426, "_floorPlanDebug.count == internalWall.count - 1 || _floorPlanDebug.count == internalWall.count");
      }
    }
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    for (unint64_t i = 0; i < [(NSMutableArray *)self->_floorPlanDebug count]; ++i)
    {
      uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
      long long v15 = [(NSMutableArray *)self->_floorPlanDebug objectAtIndexedSubscript:i];
      [v14 addEntriesFromDictionary:v15];

      uint64_t v16 = [v9 objectAtIndexedSubscript:i];
      [v14 addEntriesFromDictionary:v16];

      [v12 addObject:v14];
    }
    save_group = self->_save_group;
    dispatch_time_t v18 = dispatch_time(0, 30000000000);
    dispatch_group_wait(save_group, v18);
    v23[0] = @"config";
    v23[1] = @"keyframeDebug";
    keyframesDebug = self->_keyframesDebug;
    v24[0] = v6;
    v24[1] = keyframesDebug;
    v24[2] = v12;
    v23[2] = @"floorPlanDebug";
    v23[3] = @"coachingDebug";
    long long v25 = *(_OWORD *)&self->_coachingDebug;
    v23[4] = @"driftDebug";
    v23[5] = @"sysDebug";
    sysDebug = self->_sysDebug;
    v23[6] = @"firstARFrameTime";
    uint64_t v20 = [NSNumber numberWithDouble:self->_firstARFrameTime];
    __n128 v27 = v20;
    size_t v21 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:7];
  }
  else
  {
    size_t v21 = (void *)MEMORY[0x263EFFA78];
  }

  return v21;
}

- (void)reset
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  keyframesDebug = self->_keyframesDebug;
  self->_keyframesDebug = v3;

  double v5 = [MEMORY[0x263EFF980] array];
  floorPlanDebug = self->_floorPlanDebug;
  self->_floorPlanDebug = v5;

  id v7 = [MEMORY[0x263EFF980] array];
  coachingDebug = self->_coachingDebug;
  self->_coachingDebug = v7;

  id v9 = [MEMORY[0x263EFF980] array];
  driftDebug = self->_driftDebug;
  self->_driftDebug = v9;

  uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
  keyframeMeta = self->_keyframeMeta;
  self->_keyframeMeta = v11;

  id v13 = [MEMORY[0x263EFF980] array];
  sysDebug = self->_sysDebug;
  self->_sysDebug = v13;

  *(_WORD *)&self->_enableARFrameRGB = 257;
  self->_enableARFrameDump = 1;
  long long v15 = (_OWORD *)MEMORY[0x263EF89A8];
  self->_double firstARFrameTime = 0.0;
  long long v16 = v15[1];
  *(_OWORD *)self->_anon_70 = *v15;
  *(_OWORD *)&self->_anon_70[16] = v16;
  long long v17 = v15[3];
  *(_OWORD *)&self->_anon_70[32] = v15[2];
  *(_OWORD *)&self->_anon_70[48] = v17;
  lastARFrame = self->_lastARFrame;
  self->_maxKeyframeFPS = 3.0;
  self->_lastARFrame = 0;

  lastKeyframeTime = self->_lastKeyframeTime;
  self->_lastKeyframeTime = 0;
}

- (BOOL)enableARFrameDump
{
  return self->_enableARFrameDump;
}

- (void)setEnableARFrameDump:(BOOL)a3
{
  self->_enableARFrameDump = a3;
}

- (BOOL)enableLiveDump
{
  return self->_enableLiveDump;
}

- (void)setEnableLiveDump:(BOOL)a3
{
  self->_enableLiveDump = a3;
}

- (BOOL)enableARFrameRGB
{
  return self->_enableARFrameRGB;
}

- (void)setEnableARFrameRGB:(BOOL)a3
{
  self->_enableARFrameRGB = a3;
}

- (BOOL)enableARFrameDepth
{
  return self->_enableARFrameDepth;
}

- (void)setEnableARFrameDepth:(BOOL)a3
{
  self->_enableARFrameDepth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastARFrame, 0);
  objc_storeStrong((id *)&self->_keyframeMeta, 0);
  objc_storeStrong((id *)&self->_lastKeyframeTime, 0);
  objc_storeStrong((id *)&self->_sysDebug, 0);
  objc_storeStrong((id *)&self->_driftDebug, 0);
  objc_storeStrong((id *)&self->_coachingDebug, 0);
  objc_storeStrong((id *)&self->_floorPlanDebug, 0);
  objc_storeStrong((id *)&self->_keyframesDebug, 0);
  objc_storeStrong((id *)&self->_loggingDirectory, 0);
  objc_storeStrong((id *)&self->_save_group, 0);
  objc_storeStrong((id *)&self->_save_queue, 0);
}

@end