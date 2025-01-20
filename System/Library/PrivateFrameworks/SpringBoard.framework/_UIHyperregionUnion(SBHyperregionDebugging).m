@interface _UIHyperregionUnion(SBHyperregionDebugging)
- (double)sb_debugFrame;
@end

@implementation _UIHyperregionUnion(SBHyperregionDebugging)

- (double)sb_debugFrame
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double x = *MEMORY[0x1E4F1DB28];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = objc_msgSend(a1, "_regions", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          objc_msgSend(v10, "sb_debugFrame");
          v24.origin.double x = v11;
          v24.origin.CGFloat y = v12;
          v24.size.CGFloat width = v13;
          v24.size.CGFloat height = v14;
          v22.origin.double x = x;
          v22.origin.CGFloat y = y;
          v22.size.CGFloat width = width;
          v22.size.CGFloat height = height;
          CGRect v23 = CGRectUnion(v22, v24);
          double x = v23.origin.x;
          CGFloat y = v23.origin.y;
          CGFloat width = v23.size.width;
          CGFloat height = v23.size.height;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return x;
}

@end