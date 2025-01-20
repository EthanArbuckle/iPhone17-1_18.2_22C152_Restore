@interface TSUImage(TSDAdditions)
- (uint64_t)CGImageForSize:()TSDAdditions inContext:orLayer:;
@end

@implementation TSUImage(TSDAdditions)

- (uint64_t)CGImageForSize:()TSDAdditions inContext:orLayer:
{
  if (a5)
  {
    if (a6)
    {
      v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSUImage(TSDAdditions) CGImageForSize:inContext:orLayer:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSUImage-TSDAdditions.m"), 20, @"using context to determine requested image size. layer should be nil");
    }
    if ((TSDCGContextIsPrintContext((uint64_t)a5) & 1) != 0 || TSDCGContextIsPDFContext((uint64_t)a5))
    {
      return [a1 CGImageForContentsScale:2.0];
    }
    double v16 = TSDCGContextAssociatedScreenScale((uint64_t)a5);
    double v17 = TSDMultiplySizeScalar(a2, a3, v16);
    double v19 = v18;
    CGContextGetCTM(&v25, a5);
    double v20 = TSDTransformScale(&v25.a);
    a2 = TSDMultiplySizeScalar(v17, v19, v20);
    a3 = v21;
  }
  else if (a6)
  {
    [a6 contentsScale];
    a2 = a2 * v14;
    [a6 contentsScale];
    a3 = a3 * v15;
  }
  [a1 size];
  if (a2 <= v22 && ([a1 size], a3 <= v23)) {
    double v24 = 1.0;
  }
  else {
    double v24 = 2.0;
  }
  return [a1 CGImageForContentsScale:v24];
}

@end