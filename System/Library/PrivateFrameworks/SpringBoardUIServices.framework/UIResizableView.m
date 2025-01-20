@interface UIResizableView
- (CGSize)sizeThatFits:(CGSize)a3;
@end

@implementation UIResizableView

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v3 = [(UIResizableView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    float v7 = 0.0;
    float v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) frame];
        float v12 = v10 + v11;
        float v15 = v13 + v14;
        if (v8 <= v12) {
          float v8 = v12;
        }
        if (v7 <= v15) {
          float v7 = v15;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
    double v16 = v8;
    double v17 = v7;
  }
  else
  {
    double v17 = 0.0;
    double v16 = 0.0;
  }

  double v18 = v16;
  double v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

@end