@interface VGCoderUtilities
+ (BOOL)hasPixelBufferForKey:(id)a3 decoder:(id)a4;
+ (__CVBuffer)decodePixelBufferForKey:(id)a3 decoder:(id)a4;
+ (void)encodePixelBuffer:(__CVBuffer *)a3 forKey:(id)a4 encoder:(id)a5;
@end

@implementation VGCoderUtilities

+ (void)encodePixelBuffer:(__CVBuffer *)a3 forKey:(id)a4 encoder:(id)a5
{
  id v19 = a4;
  id v7 = a5;
  v8 = CVPixelBufferGetIOSurface(a3);
  if (!v8) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F08160] format:@"Only supports IOSurface backed pixel buffer"];
  }
  v9 = [v8 allAttachments];
  v10 = [v9 objectForKeyedSubscript:@"CreationProperties"];
  v11 = (void *)[v10 mutableCopy];

  v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "bytesPerRow"));
  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F0ED50]];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "allocationSize"));
  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x263F0ED30]];

  v14 = [v19 stringByAppendingPathExtension:@"properties"];
  [v7 encodeObject:v11 forKey:v14];

  [v8 lockWithOptions:1 seed:0];
  id v15 = v8;
  uint64_t v16 = [v15 baseAddress];
  uint64_t v17 = [v15 allocationSize];
  v18 = [v19 stringByAppendingPathExtension:@"bytes"];
  [v7 encodeBytes:v16 length:v17 forKey:v18];

  [v15 unlockWithOptions:1 seed:0];
}

+ (__CVBuffer)decodePixelBufferForKey:(id)a3 decoder:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  v12 = [v5 stringByAppendingPathExtension:@"properties"];
  v13 = [v6 decodeObjectOfClasses:v11 forKey:v12];

  v14 = (void *)[objc_alloc(MEMORY[0x263F0ED00]) initWithProperties:v13];
  if (!v14)
  {
    v21 = __VGLogSharedInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pixelBufferOut = 138412290;
      *(void *)&pixelBufferOut[4] = v13;
      _os_log_impl(&dword_260C8D000, v21, OS_LOG_TYPE_ERROR, " Failed to create iosurface with properties %@ ", pixelBufferOut, 0xCu);
    }

    goto LABEL_10;
  }
  uint64_t v26 = 0;
  id v15 = v6;
  uint64_t v16 = [v5 stringByAppendingPathExtension:@"bytes"];
  uint64_t v17 = (const void *)[v15 decodeBytesForKey:v16 returnedLength:&v26];

  uint64_t v18 = v26;
  if (v18 != [v14 allocationSize])
  {
    v22 = __VGLogSharedInstance();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = v26;
      uint64_t v24 = [v14 allocationSize];
      *(_DWORD *)pixelBufferOut = 134218240;
      *(void *)&pixelBufferOut[4] = v23;
      __int16 v28 = 2048;
      uint64_t v29 = v24;
      _os_log_impl(&dword_260C8D000, v22, OS_LOG_TYPE_ERROR, " Failed to decode iosurface data [%ld != %ld] ", pixelBufferOut, 0x16u);
    }

LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  [v14 lockWithOptions:0 seed:0];
  id v19 = v14;
  memcpy((void *)[v19 baseAddress], v17, objc_msgSend(v19, "allocationSize"));
  [v19 unlockWithOptions:0 seed:0];
  *(void *)pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], (IOSurfaceRef)v19, 0, (CVPixelBufferRef *)pixelBufferOut);
  v20 = *(__CVBuffer **)pixelBufferOut;
LABEL_11:

  return v20;
}

+ (BOOL)hasPixelBufferForKey:(id)a3 decoder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 stringByAppendingPathExtension:@"properties"];
  if ([v6 containsValueForKey:v7])
  {
    uint64_t v8 = [v5 stringByAppendingPathExtension:@"bytes"];
    char v9 = [v6 containsValueForKey:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

@end