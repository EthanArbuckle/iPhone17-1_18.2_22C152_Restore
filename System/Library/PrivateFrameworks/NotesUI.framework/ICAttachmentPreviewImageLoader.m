@interface ICAttachmentPreviewImageLoader
+ (id)orientedImage:(id)a3 withBackground:(int)a4;
+ (id)orientedImage:(id)a3 withTransform:(CGAffineTransform *)a4 background:(int)a5 backgroundTransform:(CGAffineTransform *)a6;
- (BOOL)canLoadImage;
- (BOOL)delayLoadingURLs;
- (ICAttachmentPreviewImageLoader)initWithOriginalImage:(id)a3 orientedImage:(id)a4 data:(id)a5 scale:(double)a6 previewImageURLs:(id)a7 delayLoadingURLs:(BOOL)a8;
- (NSArray)previewImageURLs;
- (NSData)data;
- (UIImage)image;
- (UIImage)orientedImage;
- (UIImage)originalImage;
- (double)scale;
- (id)imageDidLoadBlock;
- (id)loadImage;
- (id)loadOrientedImage;
- (int64_t)imageOrientation;
- (void)loadData;
- (void)loadImage;
- (void)setData:(id)a3;
- (void)setDelayLoadingURLs:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageDidLoadBlock:(id)a3;
- (void)setImageOrientation:(int64_t)a3;
- (void)setOrientedImage:(id)a3;
- (void)setOriginalImage:(id)a3;
- (void)setPreviewImageURLs:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation ICAttachmentPreviewImageLoader

+ (id)orientedImage:(id)a3 withBackground:(int)a4
{
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v4;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  v7[0] = v8[0];
  v7[1] = v4;
  v7[2] = v9;
  v5 = [a1 orientedImage:a3 withTransform:v8 background:*(void *)&a4 backgroundTransform:v7];
  return v5;
}

+ (id)orientedImage:(id)a3 withTransform:(CGAffineTransform *)a4 background:(int)a5 backgroundTransform:(CGAffineTransform *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    long long v9 = *(_OWORD *)&a4->c;
    *(_OWORD *)&transform.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&transform.c = v9;
    *(_OWORD *)&transform.tdouble x = *(_OWORD *)&a4->tx;
    BOOL IsIdentity = CGAffineTransformIsIdentity(&transform);
    if (a5 || !IsIdentity)
    {
      uint64_t v11 = objc_msgSend(v8, "ic_CGImage");
      if (v11)
      {
        v12 = (CGImage *)v11;
        long long v13 = *(_OWORD *)&a4->c;
        *(_OWORD *)&v37.a = *(_OWORD *)&a4->a;
        *(_OWORD *)&v37.c = v13;
        *(_OWORD *)&v37.tdouble x = *(_OWORD *)&a4->tx;
        CGAffineTransformInvert(&transform, &v37);
        long long v14 = *(_OWORD *)&transform.c;
        *(_OWORD *)&a4->a = *(_OWORD *)&transform.a;
        *(_OWORD *)&a4->c = v14;
        *(_OWORD *)&a4->tdouble x = *(_OWORD *)&transform.tx;
        CGFloat v15 = *MEMORY[0x1E4F1DAD8];
        CGFloat v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        double Width = (double)CGImageGetWidth(v12);
        double Height = (double)CGImageGetHeight(v12);
        long long v19 = *(_OWORD *)&a4->c;
        *(_OWORD *)&transform.a = *(_OWORD *)&a4->a;
        *(_OWORD *)&transform.c = v19;
        *(_OWORD *)&transform.tdouble x = *(_OWORD *)&a4->tx;
        CGFloat v20 = v15;
        *(CGFloat *)&long long v19 = v16;
        double v21 = Width;
        double v22 = Height;
        CGRect v41 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v19 - 8), &transform);
        double x = v41.origin.x;
        double y = v41.origin.y;
        CGFloat v25 = v41.size.width;
        CGFloat v26 = v41.size.height;
        v27 = (CGContext *)TSUCreateRGBABitmapContext();
        if (v27)
        {
          v28 = v27;
          if (a5 == 2)
          {
            objc_msgSend(MEMORY[0x1E4FB1618], "ic_attachmentBackgroundColor");
            id v31 = objc_claimAutoreleasedReturnValue();
            CGContextSetFillColorWithColor(v28, (CGColorRef)[v31 CGColor]);
            v43.origin.double x = 0.0;
            v43.origin.double y = 0.0;
            v43.size.width = v25;
            v43.size.height = v26;
            CGContextFillRect(v28, v43);
          }
          else if (a5 == 1)
          {
            *(_OWORD *)&transform.a = xmmword_1B0B98F98;
            *(_OWORD *)&transform.c = unk_1B0B98FA8;
            ColorSpace = CGBitmapContextGetColorSpace(v27);
            v30 = CGColorCreate(ColorSpace, &transform.a);
            CGContextSetFillColorWithColor(v28, v30);
            v42.origin.double x = 0.0;
            v42.origin.double y = 0.0;
            v42.size.width = v25;
            v42.size.height = v26;
            CGContextFillRect(v28, v42);
            CGColorRelease(v30);
          }
          CGContextTranslateCTM(v28, -x, -y);
          long long v32 = *(_OWORD *)&a4->c;
          *(_OWORD *)&transform.a = *(_OWORD *)&a4->a;
          *(_OWORD *)&transform.c = v32;
          *(_OWORD *)&transform.tdouble x = *(_OWORD *)&a4->tx;
          CGContextConcatCTM(v28, &transform);
          v33 = (CGImage *)objc_msgSend(v8, "ic_CGImage");
          v44.origin.double x = v15;
          v44.origin.double y = v16;
          v44.size.width = Width;
          v44.size.height = Height;
          CGContextDrawImage(v28, v44, v33);
          Image = CGBitmapContextCreateImage(v28);
          CGContextRelease(v28);
          if (Image)
          {
            uint64_t v35 = [objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:Image];
            CGImageRelease(Image);

            id v8 = (id)v35;
          }
        }
      }
    }
  }
  return v8;
}

- (ICAttachmentPreviewImageLoader)initWithOriginalImage:(id)a3 orientedImage:(id)a4 data:(id)a5 scale:(double)a6 previewImageURLs:(id)a7 delayLoadingURLs:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ICAttachmentPreviewImageLoader;
  long long v19 = [(ICAttachmentPreviewImageLoader *)&v23 init];
  CGFloat v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_image, a3);
    objc_storeStrong((id *)&v20->_originalImage, a3);
    objc_storeStrong((id *)&v20->_orientedImage, a4);
    objc_storeStrong((id *)&v20->_data, a5);
    v20->_scale = a6;
    objc_storeStrong((id *)&v20->_previewImageURLs, a7);
    v20->_delayLoadingURLs = a8;
    if (!a8)
    {
      double v21 = [(ICAttachmentPreviewImageLoader *)v20 data];

      if (!v21) {
        [(ICAttachmentPreviewImageLoader *)v20 loadData];
      }
    }
  }

  return v20;
}

- (void)loadData
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(ICAttachmentPreviewImageLoader *)self previewImageURLs];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
      [(ICAttachmentPreviewImageLoader *)self setData:v8];

      long long v9 = [(ICAttachmentPreviewImageLoader *)self data];

      if (v9) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)canLoadImage
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(ICAttachmentPreviewImageLoader *)self originalImage];
  if (v3)
  {

    return 1;
  }
  uint64_t v4 = [(ICAttachmentPreviewImageLoader *)self data];

  if (v4) {
    return 1;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(ICAttachmentPreviewImageLoader *)self previewImageURLs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        long long v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        long long v12 = [v10 path];
        char v13 = [v11 fileExistsAtPath:v12];

        if (v13)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  return 0;
}

- (id)loadImage
{
  v3 = [(ICAttachmentPreviewImageLoader *)self image];

  if (!v3)
  {
    if ([(ICAttachmentPreviewImageLoader *)self delayLoadingURLs])
    {
      uint64_t v6 = [(ICAttachmentPreviewImageLoader *)self data];

      if (!v6) {
        [(ICAttachmentPreviewImageLoader *)self loadData];
      }
    }
    uint64_t v7 = [(ICAttachmentPreviewImageLoader *)self data];

    if (!v7) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.data" functionName:"-[ICAttachmentPreviewImageLoader loadImage]" simulateCrash:1 showAlert:0 format:@"No preview image data to load"];
    }
    uint64_t v8 = [(ICAttachmentPreviewImageLoader *)self data];

    if (v8)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4FB1818];
      long long v10 = [(ICAttachmentPreviewImageLoader *)self data];
      [(ICAttachmentPreviewImageLoader *)self scale];
      long long v11 = objc_msgSend(v9, "imageWithData:scale:", v10);
      [(ICAttachmentPreviewImageLoader *)self setImage:v11];
    }
    else
    {
      long long v12 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(ICAttachmentPreviewImageLoader *)self loadImage];
      }

      id v13 = objc_alloc_init(MEMORY[0x1E4FB1818]);
      [(ICAttachmentPreviewImageLoader *)self setImage:v13];
    }
    long long v14 = [(ICAttachmentPreviewImageLoader *)self image];

    if (v14)
    {
      long long v15 = [(ICAttachmentPreviewImageLoader *)self imageDidLoadBlock];

      if (v15)
      {
        long long v16 = [(ICAttachmentPreviewImageLoader *)self imageDidLoadBlock];
        long long v17 = [(ICAttachmentPreviewImageLoader *)self image];
        ((void (**)(void, void *, void))v16)[2](v16, v17, 0);
      }
    }
  }
  uint64_t v4 = [(ICAttachmentPreviewImageLoader *)self image];
  return v4;
}

- (id)loadOrientedImage
{
  v3 = [(ICAttachmentPreviewImageLoader *)self orientedImage];

  if (!v3)
  {
    uint64_t v4 = [(ICAttachmentPreviewImageLoader *)self loadImage];
    if (v4)
    {
      int64_t v5 = [(ICAttachmentPreviewImageLoader *)self imageOrientation];
      if (v5)
      {
        int64_t v6 = v5;
        id v7 = objc_alloc(MEMORY[0x1E4FB1818]);
        uint64_t v8 = objc_msgSend(v4, "ic_CGImage");
        [v4 scale];
        uint64_t v9 = objc_msgSend(v7, "initWithCGImage:scale:orientation:", v8, v6);

        uint64_t v4 = (void *)v9;
      }
    }
    [(ICAttachmentPreviewImageLoader *)self setOrientedImage:v4];
    long long v10 = [(ICAttachmentPreviewImageLoader *)self orientedImage];

    if (v10)
    {
      long long v11 = [(ICAttachmentPreviewImageLoader *)self imageDidLoadBlock];

      if (v11)
      {
        long long v12 = [(ICAttachmentPreviewImageLoader *)self imageDidLoadBlock];
        id v13 = [(ICAttachmentPreviewImageLoader *)self orientedImage];
        ((void (**)(void, void *, uint64_t))v12)[2](v12, v13, 1);
      }
    }
  }
  return [(ICAttachmentPreviewImageLoader *)self orientedImage];
}

- (id)imageDidLoadBlock
{
  return self->_imageDidLoadBlock;
}

- (void)setImageDidLoadBlock:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIImage)originalImage
{
  return self->_originalImage;
}

- (void)setOriginalImage:(id)a3
{
}

- (UIImage)orientedImage
{
  return self->_orientedImage;
}

- (void)setOrientedImage:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (NSArray)previewImageURLs
{
  return self->_previewImageURLs;
}

- (void)setPreviewImageURLs:(id)a3
{
}

- (BOOL)delayLoadingURLs
{
  return self->_delayLoadingURLs;
}

- (void)setDelayLoadingURLs:(BOOL)a3
{
  self->_delayLoadingURLs = a3;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(int64_t)a3
{
  self->_imageOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewImageURLs, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_orientedImage, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_imageDidLoadBlock, 0);
}

- (void)loadImage
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 previewImageURLs];
  int v4 = 138412290;
  int64_t v5 = v3;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "unable to retrieve preview image %@", (uint8_t *)&v4, 0xCu);
}

@end