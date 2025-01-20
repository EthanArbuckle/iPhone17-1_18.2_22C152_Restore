@interface IMMultiFrameImage
- (BOOL)finalizeASTCWithError:(id *)a3;
- (BOOL)writeASTCImage:(CGImage *)a3 duration:(double)a4 error:(id *)a5;
- (NSMutableArray)durations;
- (NSOutputStream)outputStream;
- (NSURL)outputURL;
- (float)scale;
- (id)initForWritingWithFileURL:(id)a3 scale:(float)a4;
- (void)deleteStream;
@end

@implementation IMMultiFrameImage

- (id)initForWritingWithFileURL:(id)a3 scale:(float)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IMMultiFrameImage;
  v8 = [(IMMultiFrameImage *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_outputURL, a3);
    float v10 = 1.0;
    if (a4 > 0.0) {
      float v10 = a4;
    }
    v9->_scale = v10;
    uint64_t v11 = [MEMORY[0x1E4F1CAA8] outputStreamWithURL:v7 append:0];
    outputStream = v9->_outputStream;
    v9->_outputStream = (NSOutputStream *)v11;

    [(NSOutputStream *)v9->_outputStream open];
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    durations = v9->_durations;
    v9->_durations = v13;
  }
  return v9;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (float)scale
{
  return self->_scale;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (NSMutableArray)durations
{
  return self->_durations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);

  objc_storeStrong((id *)&self->_outputURL, 0);
}

- (void)deleteStream
{
  v9[1] = *(id *)MEMORY[0x1E4F143B8];
  v3 = [(IMMultiFrameImage *)self outputStream];
  [v3 close];

  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v5 = [(IMMultiFrameImage *)self outputURL];
  v9[0] = 0;
  char v6 = [v4 removeItemAtURL:v5 error:v9];
  id v7 = v9[0];

  if ((v6 & 1) == 0)
  {
    v8 = IMMultiFrameImageLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[IMMultiFrameImage(OptimizedBitmap_Persistence) deleteStream]();
    }
  }
}

- (BOOL)writeASTCImage:(CGImage *)a3 duration:(double)a4 error:(id *)a5
{
  v42[3] = *MEMORY[0x1E4F143B8];
  v9 = [(IMMultiFrameImage *)self outputStream];
  if (!a3 || a4 == 0.0)
  {
    v13 = IMMultiFrameImageLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[IMMultiFrameImage(ASTC_Persistence) writeASTCImage:duration:error:]((uint64_t)a3, v13, a4);
    }
    BOOL v17 = 0;
  }
  else
  {
    float v10 = [(IMMultiFrameImage *)self durations];
    uint64_t v11 = [NSNumber numberWithDouble:a4];
    [v10 addObject:v11];

    uint64_t v12 = *MEMORY[0x1E4F2F4E0];
    v41[0] = *MEMORY[0x1E4F2F6C8];
    v41[1] = v12;
    v42[0] = *MEMORY[0x1E4F2F4F0];
    v42[1] = &unk_1F20B1108;
    v41[2] = *MEMORY[0x1E4F2F500];
    v42[2] = MEMORY[0x1E4F1CC38];
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];
    v14 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    v15 = CGImageDestinationCreateWithData(v14, @"org.khronos.ktx", 1uLL, 0);
    CGImageDestinationAddImage(v15, a3, (CFDictionaryRef)v13);
    BOOL v16 = CGImageDestinationFinalize(v15);
    CFRelease(v15);
    if (v16)
    {
      id v39 = 0;
      uint64_t v40 = [(__CFData *)v14 length];
      uint64_t v37 = 0;
      v38[0] = &v37;
      v38[1] = 0x3032000000;
      v38[2] = __Block_byref_object_copy_;
      v38[3] = __Block_byref_object_dispose_;
      if ([v9 write:&v40 maxLength:8] == 8)
      {
        uint64_t v33 = 0;
        v34 = &v33;
        uint64_t v35 = 0x2020000000;
        char v36 = 0;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __69__IMMultiFrameImage_ASTC_Persistence__writeASTCImage_duration_error___block_invoke;
        v29[3] = &unk_1E650E978;
        id v30 = v9;
        v31 = &v37;
        v32 = &v33;
        [(__CFData *)v14 enumerateByteRangesUsingBlock:v29];
        BOOL v17 = *((unsigned char *)v34 + 24) == 0;
        if (a5 && *((unsigned char *)v34 + 24)) {
          *a5 = *(id *)(v38[0] + 40);
        }

        _Block_object_dispose(&v33, 8);
      }
      else
      {
        uint64_t v19 = [v9 streamError];
        v20 = *(void **)(v38[0] + 40);
        *(void *)(v38[0] + 40) = v19;

        v21 = IMMultiFrameImageLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[IMMultiFrameImage(ASTC_Persistence) writeASTCImage:duration:error:]((uint64_t)v38, v21, v22, v23, v24, v25, v26, v27);
        }

        BOOL v17 = 0;
        if (a5) {
          *a5 = *(id *)(v38[0] + 40);
        }
      }
      _Block_object_dispose(&v37, 8);
    }
    else
    {
      v18 = IMMultiFrameImageLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[IMMultiFrameImage(ASTC_Persistence) writeASTCImage:duration:error:](v18);
      }

      BOOL v17 = 0;
    }
  }
  return v17;
}

void __69__IMMultiFrameImage_ASTC_Persistence__writeASTCImage_duration_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (objc_msgSend(*(id *)(a1 + 32), "write:maxLength:", a2) != a4)
  {
    uint64_t v7 = [*(id *)(a1 + 32) streamError];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    float v10 = IMMultiFrameImageLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __69__IMMultiFrameImage_ASTC_Persistence__writeASTCImage_duration_error___block_invoke_cold_1(a1 + 40, v10, v11, v12, v13, v14, v15, v16);
    }

    *a5 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)finalizeASTCWithError:(id *)a3
{
  v25[1] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v6 = NSNumber;
  [(IMMultiFrameImage *)self scale];
  uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
  [v5 setObject:v7 forKeyedSubscript:@"CKAnimatedImageScale"];

  uint64_t v8 = [(IMMultiFrameImage *)self durations];

  if (v8)
  {
    v9 = [(IMMultiFrameImage *)self durations];
    [v5 setObject:v9 forKeyedSubscript:@"CKAnimatedImageDurations"];
  }
  float v10 = (void *)[v5 copy];
  uint64_t v11 = [(IMMultiFrameImage *)self outputStream];
  v25[0] = 0;
  uint64_t v12 = [MEMORY[0x1E4F28F98] writePropertyList:v10 toStream:v11 format:200 options:0 error:v25];
  id v13 = v25[0];
  if (v12 <= 0)
  {
    v18 = IMMultiFrameImageLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[IMMultiFrameImage(ASTC_Persistence) finalizeASTCWithError:].cold.4();
    }

    id v21 = v13;
    goto LABEL_17;
  }
  uint64_t v24 = v12;
  if ([v11 write:&v24 maxLength:8] != 8)
  {
    id v21 = [v11 streamError];
    uint64_t v19 = IMMultiFrameImageLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[IMMultiFrameImage(ASTC_Persistence) finalizeASTCWithError:]();
    }
    goto LABEL_16;
  }
  uint64_t v14 = [(IMMultiFrameImage *)self durations];
  uint64_t v15 = [v14 count];

  uint64_t v24 = v15;
  if ([v11 write:&v24 maxLength:8] != 8)
  {
    id v21 = [v11 streamError];
    uint64_t v19 = IMMultiFrameImageLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[IMMultiFrameImage(ASTC_Persistence) finalizeASTCWithError:]();
    }
LABEL_16:

LABEL_17:
    BOOL v17 = 0;
    goto LABEL_18;
  }
  LODWORD(v24) = 1129005385;
  uint64_t v16 = [v11 write:&v24 maxLength:4];
  BOOL v17 = v16 == 4;
  if (v16 == 4)
  {
    id v21 = 0;
  }
  else
  {
    id v21 = [v11 streamError];
    uint64_t v22 = IMMultiFrameImageLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[IMMultiFrameImage(ASTC_Persistence) finalizeASTCWithError:]();
    }
  }
LABEL_18:
  [v11 close];
  if (a3) {
    *a3 = v21;
  }

  return v17;
}

void __69__IMMultiFrameImage_ASTC_Persistence__writeASTCImage_duration_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end