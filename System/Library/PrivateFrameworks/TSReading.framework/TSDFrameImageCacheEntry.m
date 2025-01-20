@interface TSDFrameImageCacheEntry
- (CGImage)newImageForCALayer:(BOOL)a3 mask:(BOOL)a4;
- (CGSize)size;
- (TSDFrameSpec)frameSpec;
- (double)assetScale;
- (double)viewScale;
- (void)dealloc;
- (void)setAssetScale:(double)a3;
- (void)setFrameSpec:(id)a3;
- (void)setImage:(CGImage *)a3 forCALayer:(BOOL)a4 mask:(BOOL)a5;
- (void)setSize:(CGSize)a3;
- (void)setViewScale:(double)a3;
@end

@implementation TSDFrameImageCacheEntry

- (void)dealloc
{
  for (uint64_t i = 48; i != 80; i += 8)
    CGImageRelease(*(CGImageRef *)((char *)&self->super.isa + i));
  v4.receiver = self;
  v4.super_class = (Class)TSDFrameImageCacheEntry;
  [(TSDFrameImageCacheEntry *)&v4 dealloc];
}

- (CGImage)newImageForCALayer:(BOOL)a3 mask:(BOOL)a4
{
  uint64_t v4 = 2;
  if (!a3) {
    uint64_t v4 = 0;
  }
  v5 = &self->super.isa + (v4 | a4);
  v6 = v5[6];
  if (v6) {
    CFRetain(v5[6]);
  }
  return v6;
}

- (void)setImage:(CGImage *)a3 forCALayer:(BOOL)a4 mask:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (!a3)
  {
    v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDFrameImageCacheEntry setImage:forCALayer:mask:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameImageCache.m"), 73, @"invalid nil value for '%s'", "image");
  }
  uint64_t v11 = 2;
  if (!v6) {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v11 | v5;
  mImages = self->mImages;
  if (!mImages[v12]) {
    mImages[v12] = CGImageRetain(a3);
  }
}

- (TSDFrameSpec)frameSpec
{
  return self->mFrameSpec;
}

- (void)setFrameSpec:(id)a3
{
  self->mFrameSpec = (TSDFrameSpec *)a3;
}

- (double)assetScale
{
  return self->mAssetScale;
}

- (void)setAssetScale:(double)a3
{
  self->mAssetScale = a3;
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

- (double)viewScale
{
  return self->mViewScale;
}

- (void)setViewScale:(double)a3
{
  self->mViewScale = a3;
}

@end