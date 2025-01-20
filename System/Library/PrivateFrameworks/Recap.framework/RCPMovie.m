@interface RCPMovie
+ (__CVBuffer)pixelBufferFromUIImage:(id)a3 size:(CGSize)a4 orientation:(int64_t)a5;
- (AVAsset)screenRecording;
- (NSArray)snapshots;
- (RCPEventStream)eventStream;
- (RCPMovie)initWithContentsOfURL:(id)a3;
- (RCPMovie)initWithEventStream:(id)a3 snapshots:(id)a4;
- (RCPMovie)initWithXPC:(id)a3;
- (UIImage)screenshot;
- (id)encodeToXPC;
- (id)trimmedFrom:(unint64_t)a3 to:(unint64_t)a4;
- (int64_t)interfaceOrientation;
- (unint64_t)endTimestamp;
- (unint64_t)startTimestamp;
- (void)setEventStream:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setScreenRecording:(id)a3;
- (void)setScreenshot:(id)a3;
- (void)setSnapshots:(id)a3;
- (void)writeToURL:(id)a3 completion:(id)a4;
@end

@implementation RCPMovie

- (RCPMovie)initWithEventStream:(id)a3 snapshots:(id)a4
{
  v6 = (RCPEventStream *)a3;
  v18.receiver = self;
  v18.super_class = (Class)RCPMovie;
  id v7 = a4;
  v8 = [(RCPMovie *)&v18 init];
  eventStream = v8->_eventStream;
  v8->_eventStream = v6;
  v10 = v6;

  uint64_t v11 = objc_msgSend(v7, "copy", v18.receiver, v18.super_class);
  snapshots = v8->_snapshots;
  v8->_snapshots = (NSArray *)v11;

  v13 = [(NSArray *)v8->_snapshots lastObject];
  v14 = [v13 snapshotImage];
  v8->_interfaceOrientation = [v14 imageOrientation];

  v15 = [(NSArray *)v8->_snapshots objectAtIndexedSubscript:0];
  v8->_startTimestamp = [v15 timestamp];

  v16 = [(NSArray *)v8->_snapshots lastObject];

  v8->_endTimestamp = [v16 timestamp];
  return v8;
}

- (id)trimmedFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = [(RCPMovie *)self eventStream];
  v8 = [v7 trimmedFrom:a3 to:a4];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v10 = [(RCPMovie *)self snapshots];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v15 timestamp] >= a3 && objc_msgSend(v15, "timestamp") <= a4) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  v16 = [[RCPMovie alloc] initWithEventStream:v8 snapshots:v9];
  v17 = [(RCPMovie *)self screenshot];
  [(RCPMovie *)v16 setScreenshot:v17];

  return v16;
}

- (RCPMovie)initWithXPC:(id)a3
{
  xpc_object_t xdict = a3;
  v3 = xpc_dictionary_get_array(xdict, "snapshots");
  int64_t count = xpc_array_get_count(v3);
  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
  if (count >= 1)
  {
    for (size_t i = 0; i != count; ++i)
    {
      id v7 = xpc_array_get_value(v3, i);
      v8 = xpc_dictionary_get_value(v7, "iosurface");
      IOSurfaceRef v9 = IOSurfaceLookupFromXPCObject(v8);

      uint64_t uint64 = xpc_dictionary_get_uint64(v7, "timestamp");
      uint64_t v11 = xpc_dictionary_get_uint64(v7, "orientation");
      uint64_t v12 = objc_alloc_init(RCPScreenSnapshot);
      [(RCPScreenSnapshot *)v12 setTimestamp:uint64];
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) _initWithIOSurface:v9 scale:v11 orientation:1.0];
      [(RCPScreenSnapshot *)v12 setSnapshotImage:v13];

      [v5 addObject:v12];
      CFRelease(v9);
    }
  }
  size_t length = 0;
  data = xpc_dictionary_get_data(xdict, "eventStream", &length);
  v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
  v16 = +[RCPEventStream eventStreamWithData:v15 error:0];

  v17 = [(RCPMovie *)self initWithEventStream:v16 snapshots:v5];
  return v17;
}

- (id)encodeToXPC
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v33 = [(RCPMovie *)self snapshots];
  v32 = &v29;
  uint64_t v30 = [v33 count];
  v36 = (char *)&v29 - ((8 * v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = 8 * v30;
  bzero(v36, 8 * v30);
  v3 = [(RCPMovie *)self snapshots];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    long long v35 = xmmword_1E5D77210;
    v34 = "orientation";
    do
    {
      *(_OWORD *)keys = v35;
      v44 = v34;
      id v39 = [(RCPMovie *)self snapshots];
      id v38 = [v39 objectAtIndexedSubscript:v5];
      id v37 = [v38 snapshotImage];
      xpc_object_t XPCObject = IOSurfaceCreateXPCObject((IOSurfaceRef)[v37 ioSurface]);
      values[0] = XPCObject;
      id v7 = [(RCPMovie *)self snapshots];
      v8 = [v7 objectAtIndexedSubscript:v5];
      xpc_object_t v9 = xpc_uint64_create([v8 timestamp]);
      values[1] = v9;
      v10 = [(RCPMovie *)self snapshots];
      uint64_t v11 = [v10 objectAtIndexedSubscript:v5];
      uint64_t v12 = [v11 snapshotImage];
      xpc_object_t v13 = xpc_uint64_create([v12 imageOrientation]);
      values[2] = v13;
      xpc_object_t v14 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
      v15 = *(void **)&v36[8 * v5];
      *(void *)&v36[8 * v5] = v14;

      ++v5;
      v16 = [(RCPMovie *)self snapshots];
      unint64_t v17 = [v16 count];
    }
    while (v5 < v17);
  }
  objc_super v18 = [(RCPMovie *)self eventStream];
  long long v19 = [v18 dataRepresentation];

  v41[0] = "snapshots";
  v41[1] = "eventStream";
  long long v20 = [(RCPMovie *)self snapshots];
  size_t v21 = [v20 count];
  long long v22 = v36;
  xpc_object_t v23 = xpc_array_create((xpc_object_t *)v36, v21);
  v40[0] = v23;
  id v24 = v19;
  xpc_object_t v25 = xpc_data_create((const void *)[v24 bytes], objc_msgSend(v24, "length"));
  v40[1] = v25;
  xpc_object_t v26 = xpc_dictionary_create((const char *const *)v41, v40, 2uLL);

  uint64_t v27 = v31;
  if (v30)
  {
    do
    {

      v27 -= 8;
    }
    while (v27);
  }

  return v26;
}

- (RCPMovie)initWithContentsOfURL:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)RCPMovie;
  unint64_t v5 = [(RCPMovie *)&v41 init];
  v34 = v4;
  uint64_t v6 = [MEMORY[0x1E4F166C8] URLAssetWithURL:v4 options:&unk_1EFF9AE10];
  screenRecording = v5->_screenRecording;
  v5->_screenRecording = (AVAsset *)v6;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v8 = [(RCPMovie *)v5 screenRecording];
  xpc_object_t v9 = [v8 metadata];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (!v10) {
    goto LABEL_22;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v38;
  uint64_t v13 = *MEMORY[0x1E4F15D60];
  uint64_t v36 = *MEMORY[0x1E4F15D98];
  uint64_t v35 = *MEMORY[0x1E4F15D48];
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v38 != v12) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v37 + 1) + 8 * v14);
      v16 = [v15 identifier];
      int v17 = [v16 isEqualToString:v13];

      if (v17)
      {
        objc_super v18 = [v15 value];
        v5->_startTimestamp = [v18 integerValue];
LABEL_17:

        goto LABEL_18;
      }
      long long v19 = [v15 identifier];
      int v20 = [v19 isEqualToString:@"mdta/com.apple.recap.endTimestamp"];

      if (v20)
      {
        objc_super v18 = [v15 value];
        v5->_endTimestamp = [v18 integerValue];
        goto LABEL_17;
      }
      size_t v21 = [v15 identifier];
      int v22 = [v21 isEqualToString:@"mdta/com.apple.recap.events"];

      if (v22)
      {
        objc_super v18 = [v15 dataValue];
        uint64_t v23 = +[RCPEventStream eventStreamWithData:v18 error:0];
        eventStream = v5->_eventStream;
        v5->_eventStream = (RCPEventStream *)v23;
LABEL_16:

        goto LABEL_17;
      }
      xpc_object_t v25 = [v15 identifier];
      int v26 = [v25 isEqualToString:v36];

      if (v26)
      {
        objc_super v18 = [v15 value];
        v5->_interfaceOrientation = [v18 integerValue];
        goto LABEL_17;
      }
      uint64_t v27 = [v15 identifier];
      int v28 = [v27 isEqualToString:v35];

      if (v28)
      {
        uint64_t v29 = (void *)MEMORY[0x1E4F42A80];
        objc_super v18 = [v15 value];
        uint64_t v30 = [v29 imageWithData:v18];
        eventStream = v5->_screenshot;
        v5->_screenshot = (UIImage *)v30;
        goto LABEL_16;
      }
      NSLog(&cfstr_UnknownMetadat.isa, v15);
LABEL_18:
      ++v14;
    }
    while (v11 != v14);
    uint64_t v31 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
    uint64_t v11 = v31;
  }
  while (v31);
LABEL_22:

  if (v5->_eventStream) {
    v32 = v5;
  }
  else {
    v32 = 0;
  }

  return v32;
}

- (void)writeToURL:(id)a3 completion:(id)a4
{
  v75[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v71 = 0;
  [v8 removeItemAtURL:v6 error:&v71];
  id v9 = v71;

  uint64_t v10 = [(RCPMovie *)self snapshots];
  uint64_t v11 = [v10 lastObject];
  uint64_t v12 = [v11 snapshotImage];
  [v12 size];
  double v14 = v13;
  double v16 = v15;

  id v17 = objc_alloc(MEMORY[0x1E4F163B8]);
  uint64_t v18 = *MEMORY[0x1E4F15AB0];
  id v70 = v9;
  long long v19 = (void *)[v17 initWithURL:v6 fileType:v18 error:&v70];
  id v20 = v70;

  if (v20)
  {
    NSLog(&cfstr_FailedToCreate.isa, v20);
    v7[2](v7);
  }
  else
  {
    id v57 = objc_alloc_init(MEMORY[0x1E4F165A0]);
    [v57 setIdentifier:*MEMORY[0x1E4F15D60]];
    uint64_t v21 = *MEMORY[0x1E4F1F060];
    [v57 setDataType:*MEMORY[0x1E4F1F060]];
    int v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[RCPMovie startTimestamp](self, "startTimestamp"));
    [v57 setValue:v22];

    id v56 = objc_alloc_init(MEMORY[0x1E4F165A0]);
    [v56 setIdentifier:@"mdta/com.apple.recap.endTimestamp"];
    [v56 setDataType:v21];
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[RCPMovie endTimestamp](self, "endTimestamp"));
    [v56 setValue:v23];

    id v55 = objc_alloc_init(MEMORY[0x1E4F165A0]);
    [v55 setIdentifier:*MEMORY[0x1E4F15D98]];
    [v55 setDataType:*MEMORY[0x1E4F1F048]];
    id v24 = objc_msgSend(NSNumber, "numberWithInteger:", -[RCPMovie interfaceOrientation](self, "interfaceOrientation"));
    [v55 setValue:v24];

    id v25 = objc_alloc_init(MEMORY[0x1E4F165A0]);
    [v25 setIdentifier:@"mdta/com.apple.recap.events"];
    [v25 setDataType:*MEMORY[0x1E4F1F020]];
    int v26 = [(RCPMovie *)self eventStream];
    uint64_t v27 = [v26 dataRepresentation];
    [v25 setValue:v27];

    int v28 = [(RCPMovie *)self screenshot];

    if (v28)
    {
      uint64_t v29 = [(RCPMovie *)self screenshot];
      RCPCGImageBackedImageFromImage(v29);
      uint64_t v30 = (UIImage *)objc_claimAutoreleasedReturnValue();

      id v31 = objc_alloc_init(MEMORY[0x1E4F165A0]);
      [v31 setIdentifier:*MEMORY[0x1E4F15D48]];
      [v31 setDataType:*MEMORY[0x1E4F1EFE8]];
      v32 = UIImageJPEGRepresentation(v30, 0.8);
      [v31 setValue:v32];

      v75[0] = v57;
      v75[1] = v56;
      v75[2] = v55;
      v75[3] = v25;
      v75[4] = v31;
      id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:5];
      [v19 setMetadata:v33];
    }
    else
    {
      v74[0] = v57;
      v74[1] = v56;
      v74[2] = v55;
      v74[3] = v25;
      uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
      [v19 setMetadata:v30];
    }

    uint64_t v34 = *MEMORY[0x1E4F16220];
    v73[0] = *MEMORY[0x1E4F16228];
    uint64_t v35 = *MEMORY[0x1E4F16300];
    v72[0] = v34;
    v72[1] = v35;
    uint64_t v36 = [NSNumber numberWithDouble:v14];
    v73[1] = v36;
    v72[2] = *MEMORY[0x1E4F162A0];
    long long v37 = [NSNumber numberWithDouble:v16];
    v73[2] = v37;
    v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:3];

    long long v38 = [MEMORY[0x1E4F163C0] assetWriterInputWithMediaType:*MEMORY[0x1E4F15C18] outputSettings:v54];
    long long v39 = [MEMORY[0x1E4F163D8] assetWriterInputPixelBufferAdaptorWithAssetWriterInput:v38 sourcePixelBufferAttributes:0];
    [v19 addInput:v38];
    long long v40 = [(RCPMovie *)self eventStream];
    objc_super v41 = [v40 environment];
    [v41 timeScale];
    double v43 = v42;

    [v19 startWriting];
    CMTimeMakeWithSeconds(&v69, v43 * (double)[(RCPMovie *)self startTimestamp] / 1000000000.0, 600);
    [v19 startSessionAtSourceTime:&v69];
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    v68[3] = 0;
    if (!self->_serializationQueue)
    {
      v44 = (OS_dispatch_queue *)dispatch_queue_create("movie-output", 0);
      serializationQueue = self->_serializationQueue;
      self->_serializationQueue = v44;

      v46 = self->_serializationQueue;
      v47 = dispatch_get_global_queue(17, 0);
      dispatch_set_target_queue(v46, v47);
    }
    v48 = [(RCPMovie *)self snapshots];
    v49 = (void *)[v48 copy];

    v50 = self->_serializationQueue;
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __34__RCPMovie_writeToURL_completion___block_invoke;
    v58[3] = &unk_1E5D77230;
    id v51 = v38;
    id v59 = v51;
    v64 = v68;
    id v52 = v49;
    id v60 = v52;
    double v65 = v14;
    double v66 = v16;
    double v67 = v43;
    id v53 = v39;
    id v61 = v53;
    id v62 = v19;
    v63 = v7;
    [v51 requestMediaDataWhenReadyOnQueue:v50 usingBlock:v58];

    _Block_object_dispose(v68, 8);
  }
}

void __34__RCPMovie_writeToURL_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isReadyForMoreMediaData])
  {
    do
    {
      unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      if (v2 >= [*(id *)(a1 + 40) count]) {
        break;
      }
      v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
      id v4 = [v3 snapshotImage];
      unint64_t v5 = RCPCGImageBackedImageFromImage(v4);

      id v6 = (void *)MEMORY[0x1E4F42A80];
      id v7 = v5;
      uint64_t v8 = [v7 CGImage];
      [v7 scale];
      double v10 = v9;
      uint64_t v11 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
      uint64_t v12 = [v11 snapshotImage];
      double v13 = objc_msgSend(v6, "imageWithCGImage:scale:orientation:", v8, objc_msgSend(v12, "imageOrientation"), v10);

      if (v13)
      {
        double v14 = [*(id *)(a1 + 40) lastObject];
        double v15 = [v14 snapshotImage];
        double v16 = +[RCPMovie pixelBufferFromUIImage:size:orientation:](RCPMovie, "pixelBufferFromUIImage:size:orientation:", v13, [v15 imageOrientation], *(double *)(a1 + 80), *(double *)(a1 + 88));

        memset(&v27, 0, sizeof(v27));
        id v17 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
        CMTimeMakeWithSeconds(&v27, *(double *)(a1 + 96) * (double)(unint64_t)[v17 timestamp] / 1000000000.0, 600);

        if (![*(id *)(a1 + 32) isReadyForMoreMediaData]) {
          goto LABEL_12;
        }
        uint64_t v18 = *(void **)(a1 + 48);
        CMTime v26 = v27;
        int v19 = [v18 appendPixelBuffer:v16 withPresentationTime:&v26];
        CFRelease(v16);
        if (!v19 || [*(id *)(a1 + 56) status] == 3)
        {
          id v20 = [*(id *)(a1 + 56) error];
          NSLog(&cfstr_FailedToWriteM.isa, v20);

          *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 40) count];
        }
      }
      unint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      if (v21 >= [*(id *)(a1 + 40) count] - 1)
      {
        [*(id *)(a1 + 32) markAsFinished];
        int v22 = *(void **)(a1 + 56);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __34__RCPMovie_writeToURL_completion___block_invoke_2;
        v23[3] = &unk_1E5D770F8;
        id v24 = v22;
        id v25 = *(id *)(a1 + 64);
        [v24 finishWritingWithCompletionHandler:v23];

LABEL_12:
        return;
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    }
    while (([*(id *)(a1 + 32) isReadyForMoreMediaData] & 1) != 0);
  }
}

uint64_t __34__RCPMovie_writeToURL_completion___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) status] != 2)
  {
    unint64_t v2 = [*(id *)(a1 + 32) error];
    NSLog(&cfstr_FailedToWriteM.isa, v2);
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

+ (__CVBuffer)pixelBufferFromUIImage:(id)a3 size:(CGSize)a4 orientation:(int64_t)a5
{
  v35[2] = *MEMORY[0x1E4F143B8];
  int width = (int)a4.width;
  int height = (int)a4.height;
  uint64_t v8 = *MEMORY[0x1E4F24CA0];
  v34[0] = *MEMORY[0x1E4F24CA8];
  v34[1] = v8;
  v35[0] = MEMORY[0x1E4F1CC38];
  v35[1] = MEMORY[0x1E4F1CC38];
  double v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = a3;
  CFDictionaryRef v11 = [v9 dictionaryWithObjects:v35 forKeys:v34 count:2];
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], width, height, 0x20u, v11, &pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  double v15 = CGBitmapContextCreate(BaseAddress, width, height, 8uLL, BytesPerRow, DeviceRGB, 6u);
  double v16 = v15;
  double v17 = (double)-height;
  double v18 = (double)width;
  double v19 = (double)height;
  double v20 = (double)-width;
  double v21 = v20;
  double v22 = v17;
  if (a5 == 1) {
    double v23 = (double)height;
  }
  else {
    double v23 = 0.0;
  }
  if (a5 == 1) {
    double v24 = (double)width;
  }
  else {
    double v24 = 0.0;
  }
  if (a5 != 1)
  {
    double v22 = (double)height;
    double v21 = (double)width;
  }
  if (a5 == 2)
  {
    double v23 = 0.0;
    double v24 = (double)width;
    double v22 = 0.0;
  }
  else
  {
    double v20 = 0.0;
  }
  if (a5 == 2) {
    double v25 = (double)height;
  }
  else {
    double v25 = 0.0;
  }
  if (a5 == 2) {
    double v21 = 0.0;
  }
  if (a5 == 3) {
    double v22 = 0.0;
  }
  else {
    double v19 = v23;
  }
  if (a5 == 3)
  {
    double v26 = 0.0;
  }
  else
  {
    double v18 = v20;
    double v17 = v25;
    double v26 = v21;
  }
  v32.a = v26;
  v32.b = v17;
  v32.c = v18;
  v32.d = v22;
  if (a5 == 3) {
    double v27 = 0.0;
  }
  else {
    double v27 = v24;
  }
  v32.tx = v27;
  v32.ty = v19;
  CGContextConcatCTM(v15, &v32);
  id v28 = v10;
  uint64_t v29 = (CGImage *)objc_msgSend(v28, "CGImage", *(void *)&v32.a, *(void *)&v32.b, *(void *)&v32.c, *(void *)&v32.d);

  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.int width = 1.0;
  v36.size.int height = 1.0;
  CGContextDrawImage(v16, v36, v29);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v16);
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  uint64_t v30 = pixelBufferOut;

  return v30;
}

- (RCPEventStream)eventStream
{
  return self->_eventStream;
}

- (void)setEventStream:(id)a3
{
}

- (AVAsset)screenRecording
{
  return self->_screenRecording;
}

- (void)setScreenRecording:(id)a3
{
}

- (NSArray)snapshots
{
  return self->_snapshots;
}

- (void)setSnapshots:(id)a3
{
}

- (UIImage)screenshot
{
  return self->_screenshot;
}

- (void)setScreenshot:(id)a3
{
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (unint64_t)endTimestamp
{
  return self->_endTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshot, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_screenRecording, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_serializationQueue, 0);
}

@end