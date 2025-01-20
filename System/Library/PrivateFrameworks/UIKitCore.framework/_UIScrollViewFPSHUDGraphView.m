@interface _UIScrollViewFPSHUDGraphView
- (_UIScrollViewFPSHUDGraphView)init;
- (uint64_t)addValue:(uint64_t)result;
- (void)drawRect:(CGRect)a3;
- (void)setColorForFramerate:(unsigned int)a3 context:(CGContext *)a4;
@end

@implementation _UIScrollViewFPSHUDGraphView

- (_UIScrollViewFPSHUDGraphView)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIScrollViewFPSHUDGraphView;
  v2 = [(UIView *)&v5 init];
  if (v2)
  {
    v3 = +[UIColor blackColor];
    [(UIView *)v2 setBackgroundColor:v3];
  }
  return v2;
}

- (uint64_t)addValue:(uint64_t)result
{
  if (result)
  {
    v3 = (void *)result;
    v4 = (_DWORD *)(result + 408);
    memmove((void *)(result + 412), (const void *)(result + 408), 0x254uLL);
    _DWORD *v4 = a2;
    return [v3 setNeedsDisplay];
  }
  return result;
}

- (void)setColorForFramerate:(unsigned int)a3 context:(CGContext *)a4
{
  if (a3 > 0x1E)
  {
    if (a3 > 0x30)
    {
      if (a3 > 0x3C)
      {
        if (a3 > 0x50)
        {
          if (a3 > 0x78)
          {
            if (a3 == 301)
            {
              CGFloat v4 = 1.0;
              CGFloat v5 = 1.0;
              CGFloat v6 = 1.0;
            }
            else
            {
              if (a3 != 300) {
                return;
              }
              CGFloat v4 = 0.9;
              CGFloat v6 = 0.05;
              CGFloat v5 = 0.0;
            }
          }
          else
          {
            CGFloat v5 = 0.78;
            CGFloat v6 = 0.4;
            CGFloat v4 = 0.0;
          }
        }
        else
        {
          CGFloat v4 = 0.48;
          CGFloat v5 = 0.32;
          CGFloat v6 = 0.58;
        }
      }
      else
      {
        CGFloat v5 = 0.65;
        CGFloat v4 = 1.0;
        CGFloat v6 = 0.0;
      }
    }
    else
    {
      CGFloat v4 = 0.94;
      CGFloat v5 = 0.33;
      CGFloat v6 = 0.45;
    }
  }
  else
  {
    CGFloat v4 = 0.23;
    CGFloat v5 = 0.65;
    CGFloat v6 = 0.82;
  }
  CGContextSetRGBFillColor(a4, v4, v5, v6, 1.0);
}

- (void)drawRect:(CGRect)a3
{
  [(UIView *)self bounds];
  CGFloat v5 = v4;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v7 = 0;
  }
  else {
    v7 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextTranslateCTM(v7, 0.0, v5);
  CGContextScaleCTM(v7, 1.0, -1.0);
  [(UIView *)self bounds];
  uint64_t v8 = 0;
  int v9 = 0;
  arr = self->arr;
  double v11 = v5 * 0.25;
  double v13 = v12 / 150.0;
  do
  {
    unsigned int v14 = arr[v8];
    float v15 = (float)v14;
    if (v8 == 149 || (uint64_t v16 = v8 + 1, v15 != (float)arr[v8 + 1]))
    {
      [(_UIScrollViewFPSHUDGraphView *)self setColorForFramerate:arr[v8] context:v7];
      float v17 = v15 / 48.0;
      if (v14 >= 0x31) {
        float v17 = (float)(-240.0 / v15) + 6.0;
      }
      float v18 = v11 * v17;
      v19.origin.x = v13 * (double)v9;
      v19.size.width = v13 * (double)((int)v8 - v9);
      v19.size.height = v18;
      v19.origin.y = 0.0;
      CGContextFillRect(v7, v19);
      uint64_t v16 = v8 + 1;
      int v9 = v8;
    }
    uint64_t v8 = v16;
  }
  while (v16 != 150);
}

@end