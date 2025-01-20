@interface NSArray(Accessibility)
- (double)accessibilityFrame;
@end

@implementation NSArray(Accessibility)

- (double)accessibilityFrame
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9), "accessibilityFrame", (void)v15);
        v24.origin.double x = v10;
        v24.origin.CGFloat y = v11;
        v24.size.CGFloat width = v12;
        v24.size.CGFloat height = v13;
        v21.origin.double x = x;
        v21.origin.CGFloat y = y;
        v21.size.CGFloat width = width;
        v21.size.CGFloat height = height;
        CGRect v22 = CGRectUnion(v21, v24);
        double x = v22.origin.x;
        CGFloat y = v22.origin.y;
        CGFloat width = v22.size.width;
        CGFloat height = v22.size.height;
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v23.origin.double x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  if (CGRectIsNull(v23)) {
    return *MEMORY[0x1E4F1DB28];
  }
  return x;
}

@end