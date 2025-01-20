@interface _CRLImageM
+ (id)init;
+ (id)initWithCGImage:(CGImage *)a3;
+ (id)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5;
+ (id)initWithContentsOfFile:(id)a3;
+ (id)initWithData:(id)a3;
+ (id)initWithImageSourceRef:(CGImageSource *)a3;
+ (id)initWithUIImage:(id)a3;
@end

@implementation _CRLImageM

+ (id)init
{
  return objc_alloc_init(CRLUIImage);
}

+ (id)initWithCGImage:(CGImage *)a3
{
  v4 = [CRLCGImage alloc];

  return [(CRLCGImage *)v4 initWithCGImage:a3 scale:0 orientation:0.0];
}

+ (id)initWithData:(id)a3
{
  CGImageSourceRef v4 = CGImageSourceCreateWithData((CFDataRef)a3, (CFDictionaryRef)&__NSDictionary0__struct);
  id v5 = [a1 initWithImageSourceRef:v4];
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

+ (id)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  v8 = [CRLCGImage alloc];

  return [(CRLCGImage *)v8 initWithCGImage:a3 scale:a5 orientation:a4];
}

+ (id)initWithContentsOfFile:(id)a3
{
  id v3 = a3;
  CGImageSourceRef v4 = [[CRLUIImage alloc] initWithContentsOfFile:v3];

  return v4;
}

+ (id)initWithImageSourceRef:(CGImageSource *)a3
{
  id v3 = a3;
  if (a3)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
    id v3 = (CGImageSource *)sub_10043A61C(v3);
  }
  else
  {
    ImageAtIndex = 0;
  }
  id v5 = [[CRLCGImage alloc] initWithCGImage:ImageAtIndex scale:v3 orientation:0.0];
  CGImageRelease(ImageAtIndex);
  return v5;
}

+ (id)initWithUIImage:(id)a3
{
  id v3 = a3;
  CGImageSourceRef v4 = [[CRLUIImage alloc] initWithUIImage:v3];

  return v4;
}

@end