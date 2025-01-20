@interface PLPositionalBC7ImageTable
+ (__CFString)colorSpaceName;
+ (unint64_t)metalPixelFormat;
- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4;
- (id)debugImageDataAtIndex:(unint64_t)a3;
- (void)getImageDataOffset:(int64_t *)a3 size:(CGSize *)a4 bytesPerRow:(unint64_t *)a5 fromEntryFooter:(PLImageTableEntryFooter_s *)a6;
@end

@implementation PLPositionalBC7ImageTable

+ (__CFString)colorSpaceName
{
  return (__CFString *)*MEMORY[0x1E4F1DB90];
}

+ (unint64_t)metalPixelFormat
{
  return 0;
}

- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (self->super.super._readOnly)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
  }
  else if (self->super.super._entryCapacity <= a4)
  {
    return 0;
  }
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v26 = 0;
  v6 = (void **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)[(PLPositionalTable *)self pool], (void *)[(PLPositionalTable *)self entryLength]);
  if (!v6) {
    return 0;
  }
  v7 = v6;
  v8 = 0;
  if ([(PLPositionalImageTable *)self readImageDataAtIndex:a4 intoPoolNode:v6 bytesRead:&v26 imageWidth:(char *)&v30 + 4 imageHeight:&v30 imageDataWidth:(char *)&v29 + 4 imageDataHeight:&v29 startingOffset:&v27 bytesPerRow:&v28 uuidBytes:0])
  {
    unsigned int v9 = HIDWORD(v30) + 6;
    if (SHIDWORD(v30) >= -3) {
      unsigned int v9 = HIDWORD(v30) + 3;
    }
    unsigned int v10 = v9 >> 2;
    unsigned int v11 = v30 + 6;
    if ((int)v30 >= -3) {
      unsigned int v11 = v30 + 3;
    }
    uint64_t v12 = (int)(16 * v10 * (v11 >> 2));
    [(PLPositionalTable *)self entryLength];
    uint64_t v31 = v12;
    v13 = *v7;
    if (*v7)
    {
      int v35 = 169478669;
      unint64_t v34 = 0xBB31312058544BABLL;
      long long v36 = xmmword_19BDC6F30;
      uint64_t v37 = 0x190800008E8DLL;
      int v38 = HIDWORD(v30);
      int v39 = v30;
      long long v40 = xmmword_19BDC6F20;
      int v41 = 0;
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v12 + 68];
      [v14 appendBytes:&v34 length:64];
      [v14 appendBytes:&v31 length:4];
      [v14 appendBytes:v13 length:v31];
      v15 = CGImageSourceCreateWithData((CFDataRef)v14, 0);
      if (v15)
      {
        v16 = v15;
        CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, 0);
        if (ImageAtIndex)
        {
          v8 = ImageAtIndex;
          v18 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
          CGImageRef CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v8, v18);
          if (CopyWithColorSpace)
          {
            v20 = CopyWithColorSpace;
            CGImageRelease(v8);
            v8 = v20;
          }
          CGColorSpaceRelease(v18);
        }
        else
        {
          v23 = PLThumbnailsGetLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = [v14 length];
            *(_DWORD *)buf = 134217984;
            uint64_t v33 = v24;
            _os_log_impl(&dword_19BCFB000, v23, OS_LOG_TYPE_ERROR, "Unable to decode BC7 KTX data of length: %ld to CGImage", buf, 0xCu);
          }

          v8 = 0;
        }
        CFRelease(v16);
      }
      else
      {
        v21 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = [v14 length];
          *(_DWORD *)buf = 134217984;
          uint64_t v33 = v22;
          _os_log_impl(&dword_19BCFB000, v21, OS_LOG_TYPE_ERROR, "Unable to open image source for BC7 KTX data of length: %ld", buf, 0xCu);
        }

        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
  }
  PLPositionalTableMemoryPool_Free(v7);
  return v8;
}

- (id)debugImageDataAtIndex:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->super.super._readOnly)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_13;
    }
  }
  else if (self->super.super._entryCapacity <= a3)
  {
LABEL_13:
    id v8 = 0;
    goto LABEL_14;
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = 0;
  v5 = (void **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)[(PLPositionalTable *)self pool], (void *)[(PLPositionalTable *)self entryLength]);
  if (!v5) {
    goto LABEL_13;
  }
  v6 = v5;
  BOOL v7 = [(PLPositionalImageTable *)self readImageDataAtIndex:a3 intoPoolNode:v5 bytesRead:&v14 imageWidth:(char *)&v18 + 4 imageHeight:&v18 imageDataWidth:(char *)&v17 + 4 imageDataHeight:&v17 startingOffset:&v15 bytesPerRow:&v16 uuidBytes:0];
  id v8 = 0;
  if (v7)
  {
    unsigned int v9 = HIDWORD(v18) + 3;
    if (SHIDWORD(v18) < -3) {
      unsigned int v9 = HIDWORD(v18) + 6;
    }
    unsigned int v10 = v9 >> 2;
    unsigned int v11 = v18 + 3;
    if ((int)v18 < -3) {
      unsigned int v11 = v18 + 6;
    }
    uint64_t v13 = (int)(16 * v10 * (v11 >> 2));
    unint64_t v19 = 0xBB31312058544BABLL;
    int v20 = 169478669;
    long long v21 = xmmword_19BDC6F30;
    uint64_t v22 = 0x190800008E8DLL;
    int v23 = HIDWORD(v18);
    int v24 = v18;
    long long v25 = xmmword_19BDC6F20;
    int v26 = 0;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    [v8 appendBytes:&v19 length:64];
    [v8 appendBytes:&v13 length:4];
    [v8 appendBytes:*v6 length:v13];
  }
  PLPositionalTableMemoryPool_Free(v6);
LABEL_14:
  return v8;
}

- (void)getImageDataOffset:(int64_t *)a3 size:(CGSize *)a4 bytesPerRow:(unint64_t *)a5 fromEntryFooter:(PLImageTableEntryFooter_s *)a6
{
  *a3 = 0;
  int32x2_t v6 = vadd_s32(*(int32x2_t *)&a6->var1, (int32x2_t)0x300000003);
  unint64_t v7 = *(void *)&vsra_n_u32((uint32x2_t)v6, (uint32x2_t)vcltz_s32(v6), 0x1EuLL) & 0xFFFFFFFCFFFFFFFCLL;
  v8.i64[0] = (int)v7;
  v8.i64[1] = SHIDWORD(v7);
  *a5 = 4 * v7;
  *(float64x2_t *)a4 = vcvtq_f64_s64(v8);
}

@end