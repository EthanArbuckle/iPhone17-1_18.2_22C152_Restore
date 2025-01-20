@interface UIImageReaderConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersHighDynamicRange;
- (BOOL)preparesImagesForDisplay;
- (CGFloat)pixelsPerInch;
- (CGSize)preferredThumbnailSize;
- (UIImageReaderConfiguration)init;
- (double)_imageFromURL:(void *)a3 orData:(void *)a4 imageRequestOptions:;
- (double)_imageOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_asyncImageFromURL:(void *)a3 orData:(void *)a4 imageRequestOptions:(void *)a5 completion:;
- (void)_checkIsFileURL:(uint64_t)a1;
- (void)setPixelsPerInch:(CGFloat)pixelsPerInch;
- (void)setPreferredThumbnailSize:(CGSize)preferredThumbnailSize;
- (void)setPrefersHighDynamicRange:(BOOL)prefersHighDynamicRange;
- (void)setPreparesImagesForDisplay:(BOOL)preparesImagesForDisplay;
@end

@implementation UIImageReaderConfiguration

- (UIImageReaderConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIImageReaderConfiguration;
  result = [(UIImageReaderConfiguration *)&v3 init];
  if (result) {
    *(unsigned char *)&result->_flags |= 1u;
  }
  return result;
}

- (BOOL)prefersHighDynamicRange
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)setPrefersHighDynamicRange:(BOOL)prefersHighDynamicRange
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | prefersHighDynamicRange;
}

- (BOOL)preparesImagesForDisplay
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)setPreparesImagesForDisplay:(BOOL)preparesImagesForDisplay
{
  if (preparesImagesForDisplay) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (void)setPreferredThumbnailSize:(CGSize)preferredThumbnailSize
{
  if (preferredThumbnailSize.width <= 0.0 || preferredThumbnailSize.height <= 0.0)
  {
    self->_preferredThumbnailSize = (CGSize)*MEMORY[0x1E4F1DB30];
    char v3 = *(unsigned char *)&self->_flags & 0xFB;
  }
  else
  {
    self->_preferredThumbnailSize = preferredThumbnailSize;
    char v3 = *(unsigned char *)&self->_flags | 4;
  }
  *(unsigned char *)&self->_flags = v3;
}

- (void)setPixelsPerInch:(CGFloat)pixelsPerInch
{
  if (pixelsPerInch < 0.0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIImageReader.m", 69, @"Invalid pixelsPerInch of %f", *(void *)&pixelsPerInch);
  }
  self->_pixelsPerInch = pixelsPerInch;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id result = (id)objc_opt_new();
  *((_DWORD *)result + 2) = self->_flags;
  *(CGSize *)((char *)result + 24) = self->_preferredThumbnailSize;
  *((void *)result + 2) = *(void *)&self->_pixelsPerInch;
  return result;
}

- (unint64_t)hash
{
  BOOL v2 = self->_preferredThumbnailSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8)
    && self->_preferredThumbnailSize.width == *MEMORY[0x1E4F1DB30];
  uint64_t v3 = 8;
  if (v2) {
    uint64_t v3 = 0;
  }
  return *(unsigned char *)&self->_flags & 3 | (4 * (self->_pixelsPerInch > 0.0)) | v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIImageReaderConfiguration *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    BOOL v8 = ((*(unsigned char *)&v6->_flags ^ *(unsigned char *)&self->_flags) & 3) == 0
      && (self->_preferredThumbnailSize.width == v6->_preferredThumbnailSize.width
        ? (BOOL v7 = self->_preferredThumbnailSize.height == v6->_preferredThumbnailSize.height)
        : (BOOL v7 = 0),
          v7)
      && self->_pixelsPerInch == v6->_pixelsPerInch;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (double)_imageOptions
{
  v1 = a1;
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    goto LABEL_13;
  }
  BOOL v2 = objc_opt_new();
  uint64_t v3 = v2;
  if (((_BYTE)v1[1] & 4) != 0)
  {
    uint64_t v6 = MEMORY[0x1E4F1CC38];
    [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2FE38]];
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F2FE28]];
    double v7 = v1[3];
    if (v7 < v1[4]) {
      double v7 = v1[4];
    }
    BOOL v8 = [NSNumber numberWithUnsignedLong:(unint64_t)v7];
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2FF68]];

    uint64_t v4 = MEMORY[0x1E4F1CC28];
    v5 = (void *)MEMORY[0x1E4F2FE48];
  }
  else
  {
    if ((_BYTE)v1[1])
    {
LABEL_9:
      uint64_t v10 = MEMORY[0x1E4F1CC38];
      [v3 setObject:*MEMORY[0x1E4F2FE68] forKeyedSubscript:*MEMORY[0x1E4F2FE58]];
      uint64_t v14 = *MEMORY[0x1E4F2F360];
      v15[0] = v10;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F2FE60]];

      char v9 = *((unsigned char *)v1 + 8);
      goto LABEL_10;
    }
    uint64_t v4 = MEMORY[0x1E4F1CC38];
    v5 = (void *)MEMORY[0x1E4F2FF48];
  }
  [v3 setObject:v4 forKeyedSubscript:*v5];
  char v9 = *((unsigned char *)v1 + 8);
  if (v9) {
    goto LABEL_9;
  }
LABEL_10:
  if ((v9 & 2) != 0)
  {
    uint64_t v12 = MEMORY[0x1E4F1CC38];
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2FF08]];
    [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F2FF18]];
  }
  v1 = (double *)[v3 copy];

LABEL_13:
  return v1;
}

- (void)_checkIsFileURL:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (v3)
    {
      BOOL v8 = v3;
      char v5 = [v3 isFileURL];
      uint64_t v4 = v8;
      if ((v5 & 1) == 0)
      {
        char v6 = [v8 isFileReferenceURL];
        uint64_t v4 = v8;
        if ((v6 & 1) == 0)
        {
          double v7 = [MEMORY[0x1E4F28B00] currentHandler];
          [v7 handleFailureInMethod:sel__checkIsFileURL_, a1, @"UIImageReader.m", 136, @"Client Error: URL '%@' does not refer to a file", v8 object file lineNumber description];

          uint64_t v4 = v8;
        }
      }
    }
  }
}

- (double)_imageFromURL:(void *)a3 orData:(void *)a4 imageRequestOptions:
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  CFDataRef v8 = a3;
  CFDictionaryRef v9 = a4;
  if (!a1) {
    goto LABEL_26;
  }
  id v10 = v7;
  uint64_t v11 = *MEMORY[0x1E4F2FF48];
  v28[0] = @"kCGImageSourceSkipCRC";
  v28[1] = v11;
  v29[0] = MEMORY[0x1E4F1CC28];
  v29[1] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  if (v8)
  {
    v13 = CGImageSourceCreateWithData(v8, v12);
  }
  else
  {
    if (!v10)
    {
LABEL_11:

LABEL_12:
      a1 = 0;
      goto LABEL_26;
    }
    v13 = CGImageSourceCreateWithURL((CFURLRef)v10, v12);
  }
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_11;
  }
  if (!CGImageSourceGetCount(v13))
  {
    CFRelease(v14);
    goto LABEL_11;
  }

  if (a1[3] * a1[4] == 0.0) {
    CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v14, 0, v9);
  }
  else {
    CGImageRef ImageAtIndex = CGImageSourceCreateThumbnailAtIndex(v14, 0, v9);
  }
  CGImageRef v16 = ImageAtIndex;
  if (!ImageAtIndex)
  {
    CFRelease(v14);
    goto LABEL_12;
  }
  CFDictionaryRef v17 = CGImageSourceCopyPropertiesAtIndex(v14, 0, 0);
  v18 = [(__CFDictionary *)v17 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
  v19 = v18;
  if (v18)
  {
    uint64_t v20 = [v18 integerValue];
    if ((unint64_t)(v20 - 1) >= 8) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = (0x27365140u >> (4 * v20 - 4)) & 7;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  double v22 = 1.0;
  if (a1[2] > 0.0)
  {
    v23 = [(__CFDictionary *)v17 objectForKeyedSubscript:*MEMORY[0x1E4F2F6B0]];
    if (v23
      || ([(__CFDictionary *)v17 objectForKeyedSubscript:*MEMORY[0x1E4F2FBF0]],
          v27 = objc_claimAutoreleasedReturnValue(),
          [v27 objectForKeyedSubscript:*MEMORY[0x1E4F2FBF8]],
          v23 = objc_claimAutoreleasedReturnValue(),
          v27,
          v23))
    {
      [v23 doubleValue];
      double v22 = fmax(round(v24 / a1[2]), 1.0);
    }
  }
  v25 = [[_UIImageCGImageContent alloc] initWithCGImageSource:v14 CGImage:v16 scale:v22];
  CFRelease(v14);
  CFRelease(v16);
  a1 = [[UIImage alloc] _initWithContent:v25 orientation:v21];

LABEL_26:
  return a1;
}

- (void)_asyncImageFromURL:(void *)a3 orData:(void *)a4 imageRequestOptions:(void *)a5 completion:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    if (qword_1EB262FF8 != -1) {
      dispatch_once(&qword_1EB262FF8, &__block_literal_global_506);
    }
    v13 = _MergedGlobals_1231;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__UIImageReaderConfiguration__asyncImageFromURL_orData_imageRequestOptions_completion___block_invoke_2;
    block[3] = &unk_1E52E8FE8;
    block[4] = a1;
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    dispatch_async(v13, block);
  }
}

void __87__UIImageReaderConfiguration__asyncImageFromURL_orData_imageRequestOptions_completion___block_invoke()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("com.apple.UIKit.UIImageReader-async-image-loading");
  v1 = (void *)_MergedGlobals_1231;
  _MergedGlobals_1231 = (uint64_t)v0;
}

void __87__UIImageReaderConfiguration__asyncImageFromURL_orData_imageRequestOptions_completion___block_invoke_2(uint64_t a1)
{
  BOOL v2 = -[UIImageReaderConfiguration _imageFromURL:orData:imageRequestOptions:](*(double **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
  id v3 = _UIImageDecompressionCompletionQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__UIImageReaderConfiguration__asyncImageFromURL_orData_imageRequestOptions_completion___block_invoke_3;
  v6[3] = &unk_1E52DB330;
  id v4 = *(id *)(a1 + 64);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __87__UIImageReaderConfiguration__asyncImageFromURL_orData_imageRequestOptions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (CGSize)preferredThumbnailSize
{
  double width = self->_preferredThumbnailSize.width;
  double height = self->_preferredThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGFloat)pixelsPerInch
{
  return self->_pixelsPerInch;
}

@end