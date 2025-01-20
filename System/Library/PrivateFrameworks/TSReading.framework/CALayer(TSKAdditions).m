@interface CALayer(TSKAdditions)
- (uint64_t)makeStretchableLayerWithImage:()TSKAdditions leftCap:rightCap:topCap:bottomCap:;
- (uint64_t)makeStretchableLayerWithImage:()TSKAdditions leftCap:topCap:;
- (uint64_t)makeStretchableLayerWithUIImage:()TSKAdditions leftCap:rightCap:topCap:bottomCap:;
- (uint64_t)makeStretchableLayerWithUIImage:()TSKAdditions leftCap:topCap:;
- (uint64_t)makeStretchableLayerWithoutImage:()TSKAdditions leftCap:rightCap:topCap:bottomCap:;
- (uint64_t)makeStretchableLayerWithoutImage:()TSKAdditions leftCap:topCap:;
@end

@implementation CALayer(TSKAdditions)

- (uint64_t)makeStretchableLayerWithImage:()TSKAdditions leftCap:topCap:
{
  return objc_msgSend(a1, "makeStretchableLayerWithImage:leftCap:rightCap:topCap:bottomCap:", a3, a3, a4, a4);
}

- (uint64_t)makeStretchableLayerWithImage:()TSKAdditions leftCap:rightCap:topCap:bottomCap:
{
  objc_msgSend(a1, "makeStretchableLayerWithoutImage:leftCap:rightCap:topCap:bottomCap:");

  return [a1 setContents:a3];
}

- (uint64_t)makeStretchableLayerWithoutImage:()TSKAdditions leftCap:topCap:
{
  return objc_msgSend(a1, "makeStretchableLayerWithoutImage:leftCap:rightCap:topCap:bottomCap:", a3, a3, a4, a4);
}

- (uint64_t)makeStretchableLayerWithoutImage:()TSKAdditions leftCap:rightCap:topCap:bottomCap:
{
  double Width = (double)CGImageGetWidth(image);
  size_t Height = CGImageGetHeight(image);
  double v15 = a7 / (double)Height;
  double v16 = ((double)Height - (a6 + a7)) / (double)Height;
  [a1 setContentsGravity:*MEMORY[0x263F15E10]];

  return objc_msgSend(a1, "setContentsCenter:", a4 / Width, v15, (Width - (a4 + a5)) / Width, v16);
}

- (uint64_t)makeStretchableLayerWithUIImage:()TSKAdditions leftCap:topCap:
{
  return objc_msgSend(a1, "makeStretchableLayerWithUIImage:leftCap:rightCap:topCap:bottomCap:", a3, a3, a4, a4);
}

- (uint64_t)makeStretchableLayerWithUIImage:()TSKAdditions leftCap:rightCap:topCap:bottomCap:
{
  [a7 scale];
  double v14 = v13;
  objc_msgSend(a1, "makeStretchableLayerWithImage:leftCap:rightCap:topCap:bottomCap:", objc_msgSend(a7, "CGImage"), v14 * a2, v14 * a3, v14 * a4, v14 * a5);

  return [a1 setContentsScale:v14];
}

@end