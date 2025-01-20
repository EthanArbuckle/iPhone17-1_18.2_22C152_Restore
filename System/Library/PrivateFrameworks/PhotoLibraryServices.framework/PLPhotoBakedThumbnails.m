@interface PLPhotoBakedThumbnails
+ (BOOL)_transformForImage:(CGImage *)a3 isCropped:(BOOL)a4 captureOrientation:(int)a5 sizeInOut:(CGSize *)a6 contextSizeOut:(CGSize *)a7 transformOut:(CGAffineTransform *)a8;
+ (id)thumbnailsWithContentsOfFile:(id)a3 format:(unsigned __int16)a4;
- (BOOL)saveToFile:(id)a3;
- (BOOL)writeBorderedThumbnailOfImage:(CGImage *)a3 toBuffer:(void *)a4 orientation:(int *)a5 format:(unsigned __int16)a6 formatInfo:(id *)a7 delegate:(id)a8;
- (CGImage)thumbnailImageAtIndex:(int64_t)a3;
- (CGRect)imageRect;
- (CGSize)size;
- (NSData)optionsData;
- (NSMutableDictionary)options;
- (PLPhotoBakedThumbnails)initWithContentsOfFile:(id)a3 format:(unsigned __int16)a4 readOnly:(BOOL)a5;
- (PLPhotoBakedThumbnails)initWithData:(id)a3 format:(unsigned __int16)a4 readOnly:(BOOL)a5;
- (PLPhotoBakedThumbnails)initWithImages:(id)a3 format:(unsigned __int16)a4 options:(id)a5 delegate:(id)a6;
- (char)thumbnailBytesAtIndex:(int64_t)a3;
- (id)_thumbnailData;
- (id)description;
- (id)serializedData;
- (id)thumbnailDataAtIndex:(int64_t)a3;
- (int)bitsPerComponent;
- (int)bytesPerPixel;
- (unint64_t)count;
- (unsigned)bitmapInfo;
- (unsigned)format;
@end

@implementation PLPhotoBakedThumbnails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsData, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_thumbnailImages, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
}

- (id)_thumbnailData
{
  if (!self->_dataIsMutable)
  {
    v3 = (NSData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithData:self->_thumbnailData];
    thumbnailData = self->_thumbnailData;
    self->_thumbnailData = v3;

    self->_dataIsMutable = 1;
  }
  v5 = self->_thumbnailData;
  return v5;
}

- (BOOL)writeBorderedThumbnailOfImage:(CGImage *)a3 toBuffer:(void *)a4 orientation:(int *)a5 format:(unsigned __int16)a6 formatInfo:(id *)a7 delegate:(id)a8
{
  uint64_t v9 = a6;
  id v14 = a8;
  if (a3) {
    BOOL v15 = a4 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  BOOL v16 = v15 || a7 == 0;
  BOOL v17 = !v16;
  if (!v16)
  {
    if (PLPhotoBakedFormatIsDynamicallySized())
    {
      CGSize size = self->_size;
      CGSize v39 = size;
      CGFloat v18 = 0.0;
      CGFloat height = size.height;
      CGFloat width = size.width;
      CGFloat v21 = 0.0;
      CGFloat v22 = size.height;
      CGFloat v23 = size.width;
      CGFloat y = 0.0;
      CGFloat x = 0.0;
    }
    else
    {
      CGSize size = a7->var1;
      CGSize v39 = size;
      CGFloat x = a7->var2.origin.x;
      CGFloat y = a7->var2.origin.y;
      CGFloat v23 = a7->var2.size.width;
      CGFloat v22 = a7->var2.size.height;
      CGFloat v21 = a7->var3.origin.x;
      CGFloat v18 = a7->var3.origin.y;
      CGFloat width = a7->var3.size.width;
      CGFloat height = a7->var3.size.height;
    }
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = v23;
    v40.size.CGFloat height = v22;
    v47.origin.CGFloat x = v21;
    v47.origin.CGFloat y = v18;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    BOOL v26 = CGRectEqualToRect(v40, v47);
    long long v27 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v37.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v37.c = v27;
    *(_OWORD *)&v37.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v28 = [MEMORY[0x1E4F8B938] formatWithID:v9];
    if (a5
      && objc_msgSend((id)objc_opt_class(), "_transformForImage:isCropped:captureOrientation:sizeInOut:contextSizeOut:transformOut:", a3, objc_msgSend(v28, "isCropped"), *a5, &v39, &size, &v37))
    {
      CGAffineTransform v35 = v37;
      memset(&transform, 0, sizeof(transform));
      CGAffineTransformInvert(&transform, &v35);
      CGAffineTransform v35 = transform;
      v41.origin.CGFloat x = x;
      v41.origin.CGFloat y = y;
      v41.size.CGFloat width = v23;
      v41.size.CGFloat height = v22;
      CGRect v42 = CGRectApplyAffineTransform(v41, &v35);
      CGFloat x = v42.origin.x;
      CGFloat y = v42.origin.y;
      CGFloat v23 = v42.size.width;
      CGFloat v22 = v42.size.height;
      CGAffineTransform v35 = transform;
      v42.origin.CGFloat x = v21;
      v42.origin.CGFloat y = v18;
      v42.size.CGFloat width = width;
      v42.size.CGFloat height = height;
      CGRect v43 = CGRectApplyAffineTransform(v42, &v35);
      CGFloat v21 = v43.origin.x;
      CGFloat v18 = v43.origin.y;
      CGFloat width = v43.size.width;
      CGFloat height = v43.size.height;
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v30 = CGBitmapContextCreate(a4, (unint64_t)size.width, (unint64_t)size.height, a7->var5, (unint64_t)(size.width * (double)a7->var6), DeviceRGB, a7->var4);
    v31 = v30;
    if (a5)
    {
      CGAffineTransform transform = v37;
      CGContextConcatCTM(v30, &transform);
    }
    v32 = CGColorCreate(DeviceRGB, a7->var7);
    v33 = CGColorCreate(DeviceRGB, a7->var8);
    CGContextSetFillColorWithColor(v31, v32);
    if (!v26) {
      CGContextSetStrokeColorWithColor(v31, v33);
    }
    v44.CGSize size = v39;
    v44.origin.CGFloat x = 0.0;
    v44.origin.CGFloat y = 0.0;
    CGContextFillRect(v31, v44);
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = v23;
    v45.size.CGFloat height = v22;
    CGContextDrawImage(v31, v45, a3);
    if (!v26)
    {
      v46.origin.CGFloat x = v21;
      v46.origin.CGFloat y = v18;
      v46.size.CGFloat width = width;
      v46.size.CGFloat height = height;
      CGContextStrokeRect(v31, v46);
    }
    CGColorRelease(v33);
    CGColorRelease(v32);
    if (v14) {
      [v14 decorateThumbnail:self inContext:v31];
    }
    CGContextRelease(v31);
    CGColorSpaceRelease(DeviceRGB);
  }
  return v17;
}

- (CGRect)imageRect
{
  v2 = (double *)PLPhotoBakedFormatInfoForFormat();
  double v3 = v2[3];
  double v4 = v2[4];
  double v5 = v2[5];
  double v6 = v2[6];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (unsigned)bitmapInfo
{
  return *(_DWORD *)(PLPhotoBakedFormatInfoForFormat() + 88);
}

- (CGSize)size
{
  if (PLPhotoBakedFormatIsDynamicallySized())
  {
    p_CGSize size = &self->_size;
    p_CGFloat height = &self->_size.height;
  }
  else
  {
    uint64_t v5 = PLPhotoBakedFormatInfoForFormat();
    p_CGSize size = (CGSize *)(v5 + 8);
    p_CGFloat height = (CGFloat *)(v5 + 16);
  }
  double v6 = *p_height;
  double width = p_size->width;
  result.CGFloat height = v6;
  result.double width = width;
  return result;
}

- (int)bytesPerPixel
{
  return *(_DWORD *)(PLPhotoBakedFormatInfoForFormat() + 96);
}

- (int)bitsPerComponent
{
  return *(_DWORD *)(PLPhotoBakedFormatInfoForFormat() + 92);
}

- (NSData)optionsData
{
  return self->_optionsData;
}

- (NSMutableDictionary)options
{
  options = self->_options;
  if (!options)
  {
    double v4 = (void *)MEMORY[0x1E4F28DC0];
    optionsData = self->_optionsData;
    double v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v10 = objc_msgSend(v4, "pl_safeUnarchiveObjectFromData:classes:", optionsData, v9);
    v11 = (NSMutableDictionary *)[v10 mutableCopy];
    v12 = self->_options;
    self->_options = v11;

    options = self->_options;
  }
  self->_optionsAccessed = 1;
  return options;
}

- (unsigned)format
{
  return self->_format;
}

- (CGImage)thumbnailImageAtIndex:(int64_t)a3
{
  if (self->_thumbnailImages)
  {
    unint64_t count = self->_count;
  }
  else
  {
    double v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_count];
    thumbnailImages = self->_thumbnailImages;
    self->_thumbnailImages = v6;

    if (!self->_count) {
      return 0;
    }
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = self->_thumbnailImages;
      v10 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableArray *)v9 addObject:v10];

      ++v8;
      unint64_t count = self->_count;
    }
    while (count > v8);
  }
  if (count <= a3) {
    return 0;
  }
  v11 = [(NSMutableArray *)self->_thumbnailImages objectAtIndex:a3];
  v12 = [MEMORY[0x1E4F1CA98] null];

  if (v11 == v12)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CFDataRef v14 = [(PLPhotoBakedThumbnails *)self thumbnailDataAtIndex:a3];
    CFDataRef v15 = v14;
    if (v14)
    {
      BOOL v16 = CGDataProviderCreateWithCFData(v14);
      [(PLPhotoBakedThumbnails *)self size];
      unint64_t width = (unint64_t)v17;
      [(PLPhotoBakedThumbnails *)self size];
      size_t v19 = (unint64_t)v18;
      size_t v20 = [(PLPhotoBakedThumbnails *)self bitsPerComponent];
      size_t v21 = 8 * [(PLPhotoBakedThumbnails *)self bytesPerPixel];
      double v22 = (double)[(PLPhotoBakedThumbnails *)self bytesPerPixel];
      [(PLPhotoBakedThumbnails *)self size];
      CGImageRef v24 = CGImageCreate(width, v19, v20, v21, (unint64_t)(v23 * v22), DeviceRGB, [(PLPhotoBakedThumbnails *)self bitmapInfo], v16, 0, 0, kCGRenderingIntentDefault);

      CGDataProviderRelease(v16);
      if (v24)
      {
        [(NSMutableArray *)self->_thumbnailImages replaceObjectAtIndex:a3 withObject:v24];
        v11 = v24;
      }
      else
      {
        v11 = 0;
      }
    }
    CGColorSpaceRelease(DeviceRGB);
  }
  return (CGImage *)v11;
}

- (char)thumbnailBytesAtIndex:(int64_t)a3
{
  if (self->_singleThumbnailImageLength < 1 || self->_count <= a3) {
    return 0;
  }
  BOOL v5 = !self->_missingHeader;
  if (PLPhotoBakedFormatIsDynamicallySized()) {
    uint64_t v6 = (16 * v5) | 8u;
  }
  else {
    uint64_t v6 = (16 * v5);
  }
  return (char *)([(NSData *)self->_thumbnailData bytes] + v6 + self->_singleThumbnailImageLength * a3);
}

- (id)thumbnailDataAtIndex:(int64_t)a3
{
  double v4 = [(PLPhotoBakedThumbnails *)self thumbnailBytesAtIndex:a3];
  if (v4)
  {
    BOOL v5 = (const UInt8 *)v4;
    uint64_t v6 = self->_thumbnailData;
    v10.version = 0;
    memset(&v10.retain, 0, 40);
    v10.info = v6;
    v10.deallocate = (CFAllocatorDeallocateCallBack)releaseThumbnailData;
    v10.preferredSize = 0;
    CFAllocatorRef v7 = CFAllocatorCreate(0, &v10);
    CFDataRef v8 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, self->_singleThumbnailImageLength, v7);
    CFRelease(v7);
  }
  else
  {
    CFDataRef v8 = 0;
  }
  return v8;
}

- (unint64_t)count
{
  return self->_count;
}

- (BOOL)saveToFile:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PLPhotoBakedThumbnails *)self serializedData];
  uint64_t v6 = v5;
  if (v5) {
    char v7 = [v5 writeToFile:v4 options:1073741825 error:0];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)serializedData
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_count)
  {
    if (self->_optionsAccessed)
    {
      options = self->_options;
      id v17 = 0;
      id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:options requiringSecureCoding:1 error:&v17];
      id v5 = v17;
      if (!v4)
      {
        uint64_t v6 = PLBackendGetLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v5;
          _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Failed to archive options, error: %@", buf, 0xCu);
        }
      }
      unint64_t count = self->_count;
      uint64_t singleThumbnailImageLength = self->_singleThumbnailImageLength;
      int IsDynamicallySized = PLPhotoBakedFormatIsDynamicallySized();
      uint64_t v10 = 16;
      if (IsDynamicallySized) {
        uint64_t v10 = 24;
      }
      unint64_t v11 = v10 + count * singleThumbnailImageLength;
      v12 = [(PLPhotoBakedThumbnails *)self _thumbnailData];
      unint64_t v13 = [v12 length] - v11;
      id v14 = v4;
      objc_msgSend(v12, "replaceBytesInRange:withBytes:length:", v11, v13, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
      self->_optionsAccessed = 0;
    }
    CFDataRef v15 = self->_thumbnailData;
  }
  else
  {
    CFDataRef v15 = 0;
  }
  return v15;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p>(format: %d count: %lu options: %@)", objc_opt_class(), self, self->_format, self->_count, self->_options];
}

- (PLPhotoBakedThumbnails)initWithImages:(id)a3 format:(unsigned __int16)a4 options:(id)a5 delegate:(id)a6
{
  uint64_t v8 = a4;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v64.receiver = self;
  v64.super_class = (Class)PLPhotoBakedThumbnails;
  id v14 = [(PLPhotoBakedThumbnails *)&v64 init];
  CFDataRef v15 = v14;
  if (!v14)
  {
LABEL_38:
    id v19 = v15;
    goto LABEL_39;
  }
  v14->_format = v8;
  v14->_unint64_t count = [v11 count];
  uint64_t v16 = PLPhotoBakedFormatInfoForFormat();
  unint64_t count = v15->_count;
  if (count) {
    BOOL v18 = v16 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    uint64_t v20 = v16;
    int v21 = *(_DWORD *)(v16 + 168);
    if (v21)
    {
      uint64_t v56 = 16;
      int singleThumbnailImageLength = *(_DWORD *)(v16 + 168);
    }
    else
    {
      if (count != 1)
      {
        v53 = [MEMORY[0x1E4F28B00] currentHandler];
        [v53 handleFailureInMethod:a2 object:v15 file:@"PLPhotoBakedThumbnails.m" lineNumber:196 description:@"Tried to serialize multiple images into baked thumbnail with dynamic size"];
      }
      double v23 = (CGImage *)[v11 objectAtIndex:0];
      double Width = (double)CGImageGetWidth(v23);
      size_t Height = CGImageGetHeight(v23);
      double v26 = Width / (double)Height;
      if (v26 <= 1.0)
      {
        double v29 = *(double *)(v20 + 16);
        float v30 = v26 * v29;
        double v27 = roundf(v30);
      }
      else
      {
        double v27 = *(double *)(v20 + 8);
        float v28 = (double)Height / Width * v27;
        double v29 = roundf(v28);
      }
      v15->_size.unint64_t width = v27;
      v15->_size.CGFloat height = v29;
      int singleThumbnailImageLength = (int)(v29 * (double)*(int *)(v20 + 96) * v27);
      uint64_t v56 = 24;
    }
    v15->_int singleThumbnailImageLength = singleThumbnailImageLength;
    if (v12)
    {
      uint64_t v31 = [v12 mutableCopy];
      options = v15->_options;
      v15->_options = (NSMutableDictionary *)v31;

      v33 = v15->_options;
      id v63 = 0;
      v34 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v33 requiringSecureCoding:1 error:&v63];
      id v35 = v63;
      if (!v34)
      {
        v36 = PLBackendGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v67 = v35;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "Failed to archive options, error: %@", buf, 0xCu);
        }
      }
      uint64_t v37 = [v34 length];

      int singleThumbnailImageLength = v15->_singleThumbnailImageLength;
    }
    else
    {
      v34 = 0;
      uint64_t v37 = 0;
    }
    v57 = v34;
    id v58 = v12;
    uint64_t v38 = v56 + v15->_count * singleThumbnailImageLength;
    v15->_dataIsMutable = 1;
    uint64_t v55 = v37;
    uint64_t v39 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v38 + v37];
    thumbnailData = v15->_thumbnailData;
    v15->_thumbnailData = (NSData *)v39;

    uint64_t v41 = [(NSData *)v15->_thumbnailData bytes];
    uint64_t v42 = v41;
    *(_DWORD *)uint64_t v41 = -1160913749;
    *(_DWORD *)(v41 + 4) = bswap32(v8);
    *(unsigned char *)(v41 + 10) = 0;
    *(unsigned char *)(v41 + 11) = v21 == 0;
    *(_WORD *)(v41 + 8) = bswap32(LOWORD(v15->_count)) >> 16;
    uint64_t v54 = v38;
    unsigned int v43 = bswap32(v38);
    if (v15->_options) {
      unsigned int v44 = v43;
    }
    else {
      unsigned int v44 = 0;
    }
    *(_DWORD *)(v41 + 12) = v44;
    if (!v21) {
      *(int8x8_t *)([(NSData *)v15->_thumbnailData bytes] + 16) = vrev32_s8((int8x8_t)vmovn_s64((int64x2_t)vcvtq_u64_f64((float64x2_t)v15->_size)));
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v45 = v11;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v59 objects:v65 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = v42 + v56;
      uint64_t v49 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v60 != v49) {
            objc_enumerationMutation(v45);
          }
          [(PLPhotoBakedThumbnails *)v15 writeBorderedThumbnailOfImage:*(void *)(*((void *)&v59 + 1) + 8 * i) toBuffer:v48 orientation:0 format:v8 formatInfo:v20 delegate:v13];
          v48 += v15->_singleThumbnailImageLength;
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v59 objects:v65 count:16];
      }
      while (v47);
    }

    if (v55)
    {
      v51 = [(PLPhotoBakedThumbnails *)v15 _thumbnailData];
      objc_msgSend(v51, "replaceBytesInRange:withBytes:length:", v54, v55, objc_msgSend(v57, "bytes"), v55);
    }
    id v12 = v58;
    goto LABEL_38;
  }
  id v19 = 0;
LABEL_39:

  return v19;
}

- (PLPhotoBakedThumbnails)initWithContentsOfFile:(id)a3 format:(unsigned __int16)a4 readOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  if (v8)
  {
    if (v5) {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v8 options:8 error:0];
    }
    else {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithContentsOfFile:v8];
    }
    uint64_t v10 = (void *)v9;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = [(PLPhotoBakedThumbnails *)self initWithData:v10 format:v6 readOnly:v5];

  return v11;
}

- (PLPhotoBakedThumbnails)initWithData:(id)a3 format:(unsigned __int16)a4 readOnly:(BOOL)a5
{
  int v6 = a4;
  id v9 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PLPhotoBakedThumbnails;
  uint64_t v10 = [(PLPhotoBakedThumbnails *)&v32 init];
  if (!v10) {
    goto LABEL_17;
  }
  uint64_t v11 = PLPhotoBakedFormatInfoForFormat();
  if (!v11) {
    goto LABEL_17;
  }
  uint64_t v12 = v11;
  v10->_format = v6;
  v10->_dataIsMutable = !a5;
  objc_storeStrong((id *)&v10->_thumbnailData, a3);
  uint64_t v13 = [(NSData *)v10->_thumbnailData length];
  thumbnailData = v10->_thumbnailData;
  if (!thumbnailData || (unint64_t)v13 < 0x10) {
    goto LABEL_17;
  }
  uint64_t v16 = [(NSData *)thumbnailData bytes];
  if (!v16) {
    goto LABEL_17;
  }
  unsigned int v17 = *(_DWORD *)(v16 + 4);
  unsigned int v18 = *(unsigned __int16 *)(v16 + 8);
  unsigned int v19 = *(_DWORD *)(v16 + 12);
  if (*(_DWORD *)v16 != -1160913749)
  {
    if (*(_DWORD *)v16 != -1411592774)
    {
LABEL_17:
      v25 = 0;
      goto LABEL_18;
    }
    unsigned int v17 = bswap32(v17);
    unsigned int v18 = __rev16(v18);
    unsigned int v19 = bswap32(v19);
  }
  if (bswap32(v17) != v6) {
    goto LABEL_17;
  }
  if (*(unsigned char *)(v16 + 11))
  {
    int v23 = bswap32(*(_DWORD *)(v16 + 16));
    int v24 = bswap32(*(_DWORD *)(v16 + 20));
    v10->_size.unint64_t width = (double)v23;
    v10->_size.CGFloat height = (double)v24;
    int v21 = v24 * v23 * *(_DWORD *)(v12 + 96);
    uint64_t v22 = 24;
    uint64_t v20 = 1;
  }
  else
  {
    uint64_t v20 = __rev16(v18);
    int v21 = *(_DWORD *)(v12 + 168);
    uint64_t v22 = 16;
  }
  v10->_unint64_t count = v20;
  v10->_int singleThumbnailImageLength = v21;
  if (v13 < v22 + (int)v20 * (uint64_t)v21) {
    goto LABEL_17;
  }
  BOOL v27 = v19 == 0;
  uint64_t v28 = bswap32(v19);
  if (!v27 && v13 > v28)
  {
    uint64_t v30 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v16 + v28 length:v13 - v28];
    optionsData = v10->_optionsData;
    v10->_optionsData = (NSData *)v30;
  }
  v25 = v10;
LABEL_18:

  return v25;
}

+ (BOOL)_transformForImage:(CGImage *)a3 isCropped:(BOOL)a4 captureOrientation:(int)a5 sizeInOut:(CGSize *)a6 contextSizeOut:(CGSize *)a7 transformOut:(CGAffineTransform *)a8
{
  if (!a8)
  {
    v34 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, *(void *)&a5, a6, a7);
    [v34 handleFailureInMethod:a2, a1, @"PLPhotoBakedThumbnails.m", 481, @"Invalid parameter not satisfying: %@", @"transform" object file lineNumber description];

    return 0;
  }
  BOOL result = 0;
  if (a6 && a7)
  {
    size_t Width = CGImageGetWidth(a3);
    size_t Height = CGImageGetHeight(a3);
    if (!a4)
    {
      if (Width <= Height) {
        a6->unint64_t width = floor(a6->height * (float)((float)Width / (float)Height));
      }
      else {
        a6->CGFloat height = floor(a6->width * (float)((float)Height / (float)Width));
      }
      *a7 = *a6;
    }
    uint64_t v17 = MEMORY[0x1E4F1DAB8];
    long long v19 = *MEMORY[0x1E4F1DAB8];
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&a8->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&a8->c = v18;
    long long v20 = *(_OWORD *)(v17 + 32);
    *(_OWORD *)&a8->tCGFloat x = v20;
    switch(a5)
    {
      case 2:
        *(_OWORD *)&v35.a = v19;
        *(_OWORD *)&v35.c = v18;
        *(_OWORD *)&v35.tCGFloat x = v20;
        CGAffineTransformRotate(&v36, &v35, 1.57079633);
        long long v25 = *(_OWORD *)&v36.c;
        *(_OWORD *)&a8->a = *(_OWORD *)&v36.a;
        *(_OWORD *)&a8->c = v25;
        *(_OWORD *)&a8->tCGFloat x = *(_OWORD *)&v36.tx;
        double v26 = -a6->height;
        long long v27 = *(_OWORD *)&a8->c;
        *(_OWORD *)&v35.a = *(_OWORD *)&a8->a;
        *(_OWORD *)&v35.c = v27;
        *(_OWORD *)&v35.tCGFloat x = *(_OWORD *)&a8->tx;
        double v28 = 0.0;
        break;
      case 3:
        return 1;
      case 4:
        *(_OWORD *)&v35.a = v19;
        *(_OWORD *)&v35.c = v18;
        *(_OWORD *)&v35.tCGFloat x = v20;
        CGAffineTransformRotate(&v36, &v35, 3.14159265);
        long long v21 = *(_OWORD *)&v36.c;
        *(_OWORD *)&a8->a = *(_OWORD *)&v36.a;
        *(_OWORD *)&a8->c = v21;
        *(_OWORD *)&a8->tCGFloat x = *(_OWORD *)&v36.tx;
        CGFloat v22 = -a6->width;
        *(double *)&long long v21 = -a6->height;
        long long v23 = *(_OWORD *)&a8->c;
        *(_OWORD *)&v35.a = *(_OWORD *)&a8->a;
        *(_OWORD *)&v35.c = v23;
        *(_OWORD *)&v35.tCGFloat x = *(_OWORD *)&a8->tx;
        CGAffineTransformTranslate(&v36, &v35, v22, *(CGFloat *)&v21);
        long long v24 = *(_OWORD *)&v36.c;
        *(_OWORD *)&a8->a = *(_OWORD *)&v36.a;
        *(_OWORD *)&a8->c = v24;
        *(_OWORD *)&a8->tCGFloat x = *(_OWORD *)&v36.tx;
        return 1;
      default:
        *(_OWORD *)&v35.a = v19;
        *(_OWORD *)&v35.c = v18;
        *(_OWORD *)&v35.tCGFloat x = v20;
        CGAffineTransformRotate(&v36, &v35, -1.57079633);
        long long v29 = *(_OWORD *)&v36.c;
        *(_OWORD *)&a8->a = *(_OWORD *)&v36.a;
        *(_OWORD *)&a8->c = v29;
        *(_OWORD *)&a8->tCGFloat x = *(_OWORD *)&v36.tx;
        double v28 = -a6->width;
        long long v30 = *(_OWORD *)&a8->c;
        *(_OWORD *)&v35.a = *(_OWORD *)&a8->a;
        *(_OWORD *)&v35.c = v30;
        *(_OWORD *)&v35.tCGFloat x = *(_OWORD *)&a8->tx;
        double v26 = 0.0;
        break;
    }
    CGAffineTransformTranslate(&v36, &v35, v28, v26);
    long long v31 = *(_OWORD *)&v36.c;
    *(_OWORD *)&a8->a = *(_OWORD *)&v36.a;
    *(_OWORD *)&a8->c = v31;
    *(_OWORD *)&a8->tCGFloat x = *(_OWORD *)&v36.tx;
    *(int8x16_t *)a7 = vextq_s8(*(int8x16_t *)a6, *(int8x16_t *)a6, 8uLL);
    return 1;
  }
  return result;
}

+ (id)thumbnailsWithContentsOfFile:(id)a3 format:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  int v6 = [[PLPhotoBakedThumbnails alloc] initWithContentsOfFile:v5 format:v4 readOnly:0];

  return v6;
}

@end