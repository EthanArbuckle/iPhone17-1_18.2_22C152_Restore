@interface ICSEMediaPreviewGenerator
- (ICSEMediaPreviewGenerator)initWithScreenScale:(double)a3;
- (double)screenScale;
- (id)generateImagePreviewUsingAttachment:(id)a3;
- (id)generatePreviewWithAttachments:(id)a3;
- (id)generateVideoPreviewUsingAttachment:(id)a3;
@end

@implementation ICSEMediaPreviewGenerator

- (ICSEMediaPreviewGenerator)initWithScreenScale:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICSEMediaPreviewGenerator;
  result = [(ICSEMediaPreviewGenerator *)&v5 init];
  if (result) {
    result->_screenScale = a3;
  }
  return result;
}

- (id)generatePreviewWithAttachments:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if ((unint64_t)v5 >= 3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = (uint64_t)v5;
  }
  v7 = +[NSMutableArray arrayWithCapacity:v6];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      v9 = [v4 objectAtIndexedSubscript:i];
      v10 = [v9 mediaUTI];
      unsigned int v11 = +[ICAttachment typeUTIIsPlayableMovie:v10];

      if (v11) {
        [(ICSEMediaPreviewGenerator *)self generateVideoPreviewUsingAttachment:v9];
      }
      else {
      v12 = [(ICSEMediaPreviewGenerator *)self generateImagePreviewUsingAttachment:v9];
      }
      [v7 ic_addNonNilObject:v12];
    }
  }
  id v13 = [v7 copy];

  return v13;
}

- (id)generateVideoPreviewUsingAttachment:(id)a3
{
  v3 = [a3 mediaURL];
  id v4 = +[AVURLAsset ic_safeURLAssetWithURL:v3];

  id v5 = [ICSEMediaPreview alloc];
  uint64_t v6 = [v4 ic_previewImage];
  if (v4) {
    [v4 duration];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  v7 = [(ICSEMediaPreview *)v5 initWithWithImage:v6 videoDuration:v9];

  return v7;
}

- (id)generateImagePreviewUsingAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mediaURL];

  if (v5)
  {
    CFURLRef v6 = [v4 mediaURL];
    CGImageSourceRef v7 = CGImageSourceCreateWithURL(v6, 0);
LABEL_5:
    v9 = v7;
    goto LABEL_6;
  }
  v8 = [v4 mediaData];

  if (v8)
  {
    CFURLRef v6 = [v4 mediaData];
    CGImageSourceRef v7 = CGImageSourceCreateWithData(v6, 0);
    goto LABEL_5;
  }
  v30 = [v4 image];

  if (v30)
  {
    CFURLRef v6 = [v4 image];
    CFDataRef v31 = [(__CFURL *)v6 ic_PNGData];
    v9 = CGImageSourceCreateWithData(v31, 0);

LABEL_6:
    CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, 0);
    double Width = (double)CGImageGetWidth(ImageAtIndex);
    double v13 = Width / (double)CGImageGetHeight(ImageAtIndex);
    [(ICSEMediaPreviewGenerator *)self screenScale];
    double v15 = v14;
    double v16 = v14 * 64.0;
    double v17 = v16 / v13;
    double v18 = v16 * v13;
    if (v13 > 1.0) {
      double v19 = v18;
    }
    else {
      double v19 = v17;
    }
    v20 = +[NSMutableData data];
    v21 = [UTTypeJPEG identifier];
    v22 = CGImageDestinationCreateWithData(v20, v21, 1uLL, 0);

    if (v22)
    {
      id v23 = [(__CFDictionary *)v10 mutableCopy];
      v24 = +[NSNumber numberWithInt:(int)v19];
      [v23 setObject:v24 forKeyedSubscript:kCGImageDestinationImageMaxPixelSize];

      CGImageDestinationAddImage(v22, ImageAtIndex, (CFDictionaryRef)v23);
      LODWORD(v24) = CGImageDestinationFinalize(v22);
      CFRelease(v22);

      CFRelease(v9);
      CGImageRelease(ImageAtIndex);
      if (v24)
      {
        id v25 = [objc_alloc((Class)UIImage) initWithData:v20 scale:v15];
        v26 = [[ICSEMediaPreview alloc] initWithImage:v25];

LABEL_14:
        v27 = v26;

        v28 = v27;
        goto LABEL_15;
      }
    }
    else
    {
      CFRelease(v9);
      CGImageRelease(ImageAtIndex);
    }
    v26 = 0;
    goto LABEL_14;
  }
  v27 = os_log_create("com.apple.notes", "SharingExtension");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_1000B567C(v27);
  }
  v28 = 0;
LABEL_15:

  return v28;
}

- (double)screenScale
{
  return self->_screenScale;
}

@end