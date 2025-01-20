@interface TSDBitmapRenderingQualityInfo
- (CGImage)degradedImageRefForProvider:(id)a3 ofSize:(CGSize)a4;
- (TSDBitmapRenderingQualityInfo)initWithQuality:(int)a3 canvasScale:(float)a4;
- (int)quality;
- (void)cacheProvider:(id)a3 ofSize:(CGSize)a4;
- (void)dealloc;
@end

@implementation TSDBitmapRenderingQualityInfo

- (TSDBitmapRenderingQualityInfo)initWithQuality:(int)a3 canvasScale:(float)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSDBitmapRenderingQualityInfo;
  v6 = [(TSDBitmapRenderingQualityInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->mQuality = a3;
    v6->mCanvasScale = a4;
    v6->mImageMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDBitmapRenderingQualityInfo;
  [(TSDBitmapRenderingQualityInfo *)&v3 dealloc];
}

- (void)cacheProvider:(id)a3 ofSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v8 = (TSDBitmapRenderingQualityImageMapValue *)-[NSMutableDictionary objectForKey:](self->mImageMap, "objectForKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithNonretainedObject:"));
  if (!v8)
  {
    v8 = objc_alloc_init(TSDBitmapRenderingQualityImageMapValue);
    -[NSMutableDictionary setObject:forKey:](self->mImageMap, "setObject:forKey:", v8, [MEMORY[0x263F08D40] valueWithNonretainedObject:a3]);
  }

  -[TSDBitmapRenderingQualityImageMapValue addSize:](v8, "addSize:", width, height);
}

- (CGImage)degradedImageRefForProvider:(id)a3 ofSize:(CGSize)a4
{
  [(TSDBitmapRenderingQualityInfo *)self cacheProvider:a4.width ofSize:a4.height];
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->mImageMap, "objectForKey:", [MEMORY[0x263F08D40] valueWithNonretainedObject:a3]);
  if (!v6)
  {
    v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSDBitmapRenderingQualityInfo degradedImageRefForProvider:ofSize:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBitmapRenderingQualityInfo.m"), 80, @"Bitmap rendering quality info encountered an unprocessed image ref");
  }
  uint64_t mQuality = self->mQuality;
  *(float *)&double v7 = self->mCanvasScale;

  return (CGImage *)[v6 degradedImageRefForForProvider:a3 quality:mQuality canvasScale:v7];
}

- (int)quality
{
  return self->mQuality;
}

@end