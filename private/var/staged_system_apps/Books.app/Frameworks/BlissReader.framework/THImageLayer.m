@interface THImageLayer
- (CGImage)p_createImageFromImageProviderBlock:(id)a3 withMaxSize:(CGSize)a4 outNativeSize:(CGSize *)a5;
- (void)setImageProviderBlock:(id)a3 setLayerBounds:(BOOL)a4 maxSize:(CGSize)a5 outNativeSize:(CGSize *)a6;
@end

@implementation THImageLayer

- (void)setImageProviderBlock:(id)a3 setLayerBounds:(BOOL)a4 maxSize:(CGSize)a5 outNativeSize:(CGSize *)a6
{
  if (a3)
  {
    BOOL v6 = a4;
    v8 = -[THImageLayer p_createImageFromImageProviderBlock:withMaxSize:outNativeSize:](self, "p_createImageFromImageProviderBlock:withMaxSize:outNativeSize:", a3, a6, a5.width, a5.height);
    [(THImageLayer *)self setContents:v8];
    if (v6)
    {
      double Width = (double)CGImageGetWidth(v8);
      -[THImageLayer setBounds:](self, "setBounds:", 0.0, 0.0, Width, (double)CGImageGetHeight(v8));
    }
    CGImageRelease(v8);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0, a4, a6, a5.width, a5.height), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THImageLayer setImageProviderBlock:setLayerBounds:maxSize:outNativeSize:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THImageLayer.m"), 18, @"invalid nil value for '%s'",
      "imageProviderBlock");
  }
}

- (CGImage)p_createImageFromImageProviderBlock:(id)a3 withMaxSize:(CGSize)a4 outNativeSize:(CGSize *)a5
{
  double height = a4.height;
  double width = a4.width;
  v8 = (CGImageSource *)(*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
  v9 = v8;
  if (a5)
  {
    CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(v8, 0, 0);
    [v10 objectForKey:kCGImagePropertyPixelWidth].floatValue;
    CGFloat v12 = v11;
    [v10 objectForKey:kCGImagePropertyPixelHeight].floatValue;
    a5->double width = v12;
    a5->double height = v13;
  }
  id v14 = [objc_alloc((Class)NSMutableDictionary) initWithObjectsAndKeys:kCFBooleanTrue, kCGImageSourceCreateThumbnailFromImageAlways, 0];
  float v15 = width;
  float v16 = height;
  float v17 = ceilf(fmaxf(v15, v16));
  if (v17 < 1.79769313e308) {
    [v14 setObject:[NSNumber numberWithUnsignedInteger:v17] forKey:kCGImageSourceThumbnailMaxPixelSize];
  }
  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v9, 0, (CFDictionaryRef)v14);
  if (!ThumbnailAtIndex) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THImageLayer p_createImageFromImageProviderBlock:withMaxSize:outNativeSize:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THImageLayer.m") lineNumber:62 description:@"failed to generate thumbnail image"];
  }

  return ThumbnailAtIndex;
}

@end