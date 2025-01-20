@interface _UIOldCGImageDecompressor
+ (uint64_t)flushCaches;
- (BOOL)isEqual:(id)a3;
- (CGImage)waitForImageRef;
- (id)initWithData:(void *)a3 immediateLoadWithMaxSize:(int)a4 renderingIntent:(double)a5 cache:(double)a6;
- (unint64_t)hash;
- (void)_decompressEagerly:(uint64_t)a1;
- (void)_waitForMetadata;
- (void)dealloc;
@end

@implementation _UIOldCGImageDecompressor

+ (uint64_t)flushCaches
{
  self;
  uint64_t result = atomic_load_explicit((atomic_ullong *volatile)&jpegDecodeSessionRef, memory_order_acquire);
  if (result)
  {
    return MEMORY[0x1F410DAD8]();
  }
  return result;
}

- (id)initWithData:(void *)a3 immediateLoadWithMaxSize:(int)a4 renderingIntent:(double)a5 cache:(double)a6
{
  id v12 = a2;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)_UIOldCGImageDecompressor;
    v13 = (id *)objc_msgSendSuper2(&v21, sel_init);
    v14 = v13;
    if (v13)
    {
      *((double *)v13 + 2) = a5;
      *((double *)v13 + 3) = a6;
      v13[5] = a3;
      objc_storeStrong(v13 + 1, a2);
      if (a4) {
        char v15 = 32;
      }
      else {
        char v15 = 0;
      }
      *((unsigned char *)v14 + 64) = (_BYTE)v14[8] & 0xDF | v15;
      v14[6] = 0;
      *((_DWORD *)v14 + 14) = 0;
      *((_DWORD *)v14 + 15) = 0;
    }
    if (qword_1EB25CFF8 != -1) {
      dispatch_once(&qword_1EB25CFF8, &__block_literal_global_639);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89___UIOldCGImageDecompressor_initWithData_immediateLoadWithMaxSize_renderingIntent_cache___block_invoke_2;
    block[3] = &unk_1E52D9F70;
    v16 = v14;
    v20 = v16;
    dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async((dispatch_queue_t)_MergedGlobals_3_30, v17);
    a1 = v16;
  }
  return a1;
}

- (void)_decompressEagerly:(uint64_t)a1
{
  valuePtr[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 60);
    if (a2)
    {
      if (!os_unfair_lock_trylock(v3)) {
        return;
      }
    }
    else
    {
      os_unfair_lock_lock(v3);
    }
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      objc_initWeak(&location, (id)a1);
      v4 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48___UIOldCGImageDecompressor__decompressEagerly___block_invoke;
      block[3] = &unk_1E52DC308;
      objc_copyWeak(&v55, &location);
      dispatch_async(v4, block);

      if (_decompressEagerly__oneSessionRefToken != -1) {
        dispatch_once(&_decompressEagerly__oneSessionRefToken, &__block_literal_global_16_8);
      }
      if (atomic_load(&jpegDecodeSessionRef))
      {
        Mutable = CFDictionaryCreateMutable(0, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        double v8 = *MEMORY[0x1E4F1DB30];
        double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        if (*(double *)(a1 + 16) != *MEMORY[0x1E4F1DB30] || *(double *)(a1 + 24) != v7)
        {
          v9 = *(void **)(a1 + 8);
          v57 = @"kCGImageSourceSkipMetadata";
          valuePtr[0] = *MEMORY[0x1E4F1CFD0];
          v10 = (void *)MEMORY[0x1E4F1C9E8];
          CFDataRef v11 = v9;
          CFDictionaryRef v12 = [v10 dictionaryWithObjects:valuePtr forKeys:&v57 count:1];
          v13 = CGImageSourceCreateWithData(v11, 0);

          CFDictionaryRef v14 = CGImageSourceCopyPropertiesAtIndex(v13, 0, v12);
          CFDictionaryRef v15 = v14;
          if (v14)
          {
            Value = (void *)CFDictionaryGetValue(v14, (const void *)*MEMORY[0x1E4F2FD00]);
            dispatch_block_t v17 = (void *)CFDictionaryGetValue(v15, (const void *)*MEMORY[0x1E4F2FCE8]);
            [Value floatValue];
            float v19 = v18;
            [v17 floatValue];
            float v21 = v20;
            CFRelease(v15);
            CFRelease(v13);
            double v22 = v19;
            double v23 = v21;
          }
          else
          {
            CFRelease(v13);
            double v23 = v7;
            double v22 = v8;
          }

          if (v22 != v8 || v23 != v7)
          {
            v24 = (void *)(a1 + 16);
            if (v22 <= v23) {
              v24 = (void *)(a1 + 24);
            }
            valuePtr[0] = *v24;
            CFNumberRef v25 = CFNumberCreate(0, kCFNumberFloatType, valuePtr);
            CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F56318], v25);
            CFRelease(v25);
          }
        }
        if (*(void *)(a1 + 40)) {
          int v26 = 1111970369;
        }
        else {
          int v26 = 875704422;
        }
        LODWORD(valuePtr[0]) = v26;
        CFNumberRef v27 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F56320], v27);
        CFRelease(v27);
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F56310], (const void *)*MEMORY[0x1E4F1CFD0]);
        dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
        atomic_load(&jpegDecodeSessionRef);
        v53 = v28;
        *(void *)(a1 + 48) = CMPhotoJPEGDecodeSessionDecodeDataToCGImageAsynchronously();
        dispatch_semaphore_wait(v53, 0xFFFFFFFFFFFFFFFFLL);
        CFRelease(Mutable);
      }
      if ((*(unsigned char *)(a1 + 64) & 0x10) != 0) {
        goto LABEL_41;
      }
      os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 60));
      v29 = *(void **)(a1 + 8);
      LOBYTE(valuePtr[0]) = 0;
      v30 = (void *)*MEMORY[0x1E4F44410];
      id v31 = v29;
      v32 = [v30 identifier];
      uint64_t TypeWithData = CGImageSourceGetTypeWithData();

      if (LOBYTE(valuePtr[0])
        || ([MEMORY[0x1E4F442D8] typeWithIdentifier:TypeWithData],
            v34 = objc_claimAutoreleasedReturnValue(),
            char v35 = [v34 conformsToType:v30],
            v34,
            (v35 & 1) != 0))
      {
        CGImageRef v36 = _UIImageRefFromData(*(void **)(a1 + 8), 0, 0, 0);
        *(void *)(a1 + 32) = v36;
        if (v36)
        {
LABEL_40:
          *(unsigned char *)(a1 + 64) |= 0x10u;
LABEL_41:
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
          objc_destroyWeak(&v55);
          objc_destroyWeak(&location);
          return;
        }
        v37 = NSString;
        v38 = (id)a1;
        v39 = (objc_class *)objc_opt_class();
        v40 = NSStringFromClass(v39);
        v41 = [v37 stringWithFormat:@"<%@: %p>", v40, v38];

        v42 = (void *)v38[1];
        if (v42)
        {
          v43 = NSString;
          id v44 = v42;
          v45 = (objc_class *)objc_opt_class();
          v46 = NSStringFromClass(v45);
          v47 = [v43 stringWithFormat:@"<%@: %p>", v46, v44];
        }
        else
        {
          v47 = @"(nil)";
        }
        NSLog(&cfstr_UnableToCreate_3.isa, v41, v47);
      }
      else
      {
        v48 = *(void **)(a1 + 8);
        if (v48)
        {
          v49 = NSString;
          id v50 = v48;
          v51 = (objc_class *)objc_opt_class();
          v52 = NSStringFromClass(v51);
          v41 = [v49 stringWithFormat:@"<%@: %p>", v52, v50];
        }
        else
        {
          v41 = @"(nil)";
        }
        NSLog(&cfstr_InvalidJpegDat.isa, v41);
      }

      goto LABEL_40;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (double *)v4;
    BOOL v6 = (NSData *)*((void *)v5 + 1) == self->_imageData
      && *((void *)v5 + 5) == self->_renderingIntent
      && ((*(unsigned char *)&self->_decompressorFlags ^ *((unsigned __int8 *)v5 + 64)) & 0x20) == 0
      && v5[3] == self->_maxSize.height
      && v5[2] == self->_maxSize.width;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSData *)self->_imageData hash];
}

- (void)dealloc
{
  CGImageRelease(self->_imageRef);
  v3.receiver = self;
  v3.super_class = (Class)_UIOldCGImageDecompressor;
  [(_UIOldCGImageDecompressor *)&v3 dealloc];
}

- (void)_waitForMetadata
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if (*(unsigned char *)(a1 + 64))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    }
    else
    {
      if ((*(unsigned char *)(a1 + 64) & 0x20) != 0)
      {
        CFDictionaryRef v3 = 0;
      }
      else
      {
        uint64_t v2 = *MEMORY[0x1E4F2FF48];
        v8[0] = *MEMORY[0x1E4F2FF08];
        v8[1] = v2;
        v9[0] = MEMORY[0x1E4F1CC28];
        v9[1] = MEMORY[0x1E4F1CC38];
        CFDictionaryRef v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
      }
      id v4 = CGImageSourceCreateWithData(*(CFDataRef *)(a1 + 8), v3);
      uint64_t v7 = 0;
      if (v4)
      {
        v5 = v4;
        _UIImageGetOrientationAndScale(v4, 0, v3, (unint64_t)&v7, 0);
        CFRelease(v5);
        char v6 = 2 * (v7 & 7);
      }
      else
      {
        char v6 = 0;
      }
      *(unsigned char *)(a1 + 64) = *(unsigned char *)(a1 + 64) & 0xF1 | v6;
      *(unsigned char *)(a1 + 64) |= 1u;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    }
  }
}

- (CGImage)waitForImageRef
{
  -[_UIOldCGImageDecompressor _decompressEagerly:]((uint64_t)self, 0);
  -[_UIOldCGImageDecompressor _waitForMetadata]((uint64_t)self);
  uint64_t result = self->_imageRef;
  if (result)
  {
    CGImageRef v4 = CGImageRetain(result);
    return (CGImage *)CFAutorelease(v4);
  }
  return result;
}

- (void).cxx_destruct
{
}

@end