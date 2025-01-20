@interface AVAsset(TSUAdditions)
+ (uint64_t)keyPathsForValuesAffectingNaturalSizeWithPreferredTransforms;
- (double)naturalSizeWithPreferredTransforms;
@end

@implementation AVAsset(TSUAdditions)

- (double)naturalSizeWithPreferredTransforms
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v1 = (CGFloat *)MEMORY[0x263F001A8];
  double width = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = (void *)[a1 tracksWithMediaType:*MEMORY[0x263EF9D48]];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    CGFloat x = *v1;
    CGFloat y = v1[1];
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEnabled", *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx))
        {
          [v11 naturalSize];
          CGFloat v13 = v12;
          CGFloat v15 = v14;
          if (v11) {
            [v11 preferredTransform];
          }
          else {
            memset(&v17, 0, sizeof(v17));
          }
          v24.origin.CGFloat x = 0.0;
          v24.origin.CGFloat y = 0.0;
          v24.size.double width = v13;
          v24.size.CGFloat height = v15;
          CGRect v27 = CGRectApplyAffineTransform(v24, &v17);
          v25.origin.CGFloat x = x;
          v25.origin.CGFloat y = y;
          v25.size.double width = width;
          v25.size.CGFloat height = height;
          CGRect v26 = CGRectUnion(v25, v27);
          CGFloat x = v26.origin.x;
          CGFloat y = v26.origin.y;
          double width = v26.size.width;
          CGFloat height = v26.size.height;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  return width;
}

+ (uint64_t)keyPathsForValuesAffectingNaturalSizeWithPreferredTransforms
{
  return [MEMORY[0x263EFFA08] setWithObject:@"tracks"];
}

@end