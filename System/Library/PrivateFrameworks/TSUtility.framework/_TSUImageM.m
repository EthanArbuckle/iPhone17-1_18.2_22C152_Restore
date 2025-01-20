@interface _TSUImageM
+ (id)init;
+ (id)initWithCGImage:(CGImage *)a3;
+ (id)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5;
+ (id)initWithContentsOfFile:(id)a3;
+ (id)initWithData:(id)a3;
+ (id)initWithImageSourceRef:(CGImageSource *)a3;
@end

@implementation _TSUImageM

+ (id)init
{
  return objc_alloc_init(TSUUIImage);
}

+ (id)initWithCGImage:(CGImage *)a3
{
  v4 = [TSUCGImage alloc];
  return [(TSUCGImage *)v4 initWithCGImage:a3 scale:0 orientation:0.0];
}

+ (id)initWithData:(id)a3
{
  v4 = [TSUUIImage alloc];
  return [(TSUUIImage *)v4 initWithData:a3];
}

+ (id)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  v8 = [TSUCGImage alloc];
  return [(TSUCGImage *)v8 initWithCGImage:a3 scale:a5 orientation:a4];
}

+ (id)initWithContentsOfFile:(id)a3
{
  v4 = [TSUUIImage alloc];
  return [(TSUUIImage *)v4 initWithContentsOfFile:a3];
}

+ (id)initWithImageSourceRef:(CGImageSource *)a3
{
  v3 = a3;
  if (a3)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
    v3 = (CGImageSource *)TSUImageSourceOrientation(v3);
  }
  else
  {
    ImageAtIndex = 0;
  }
  v5 = [[TSUCGImage alloc] initWithCGImage:ImageAtIndex scale:v3 orientation:0.0];
  CGImageRelease(ImageAtIndex);
  return v5;
}

@end