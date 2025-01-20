@interface _NAUIAmbigousLayoutView
+ (void)installOnView:(id)a3 forVariable:(id)a4;
- (void)drawRect:(CGRect)a3;
@end

@implementation _NAUIAmbigousLayoutView

+ (void)installOnView:(id)a3 forVariable:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = [v7 valueForKey:@"_boundsWidthVariable"];

  if (v8 == v6)
  {
    v14 = @".Width";
  }
  else
  {
    id v9 = [v7 valueForKey:@"_boundsHeightVariable"];

    if (v9 == v6)
    {
      v14 = @".Height";
    }
    else
    {
      id v10 = [v7 valueForKey:@"_minXVariable"];

      if (v10 == v6)
      {
        v14 = @".minX";
      }
      else
      {
        id v11 = [v7 valueForKey:@"_minYVariable"];

        if (v11 == v6)
        {
          v14 = @".minY";
        }
        else
        {
          id v12 = [v7 valueForKey:@"_contentWidthVariable"];

          if (v12 == v6)
          {
            v14 = @".contentWidth";
          }
          else
          {
            id v13 = [v7 valueForKey:@"_contentHeightVariable"];

            if (v13 == v6) {
              v14 = @".contentHeight";
            }
            else {
              v14 = 0;
            }
          }
        }
      }
    }
  }

  v15 = v14;
  if (([(__CFString *)v15 isEqualToString:@".Width"] & 1) != 0
    || [(__CFString *)v15 isEqualToString:@".contentWidth"])
  {
    [v7 frame];
    double v17 = v16;
    double v18 = 0.0;
    double v19 = -11.0;
    double v20 = 10.0;
  }
  else
  {
    double v18 = *MEMORY[0x263F001A8];
    double v19 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v20 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  if (([(__CFString *)v15 isEqualToString:@".Height"] & 1) != 0
    || [(__CFString *)v15 isEqualToString:@".contentHeight"])
  {
    [v7 frame];
    if (v21 == 0.0)
    {
      [v7 bounds];
      double v18 = v22 + 1.0;
    }
    else
    {
      double v18 = -11.0;
    }
    [v7 bounds];
    double v20 = v23;
    double v19 = 0.0;
    double v17 = 10.0;
  }
  if ([(__CFString *)v15 isEqualToString:@".minX"])
  {
    [v7 bounds];
    double v20 = v24;
    double v19 = 0.0;
    double v17 = 1.0;
    double v18 = 0.0;
  }
  if ([(__CFString *)v15 isEqualToString:@".minY"])
  {
    [v7 bounds];
    double v17 = v25;
    double v19 = 0.0;
    double v20 = 1.0;
    double v18 = 0.0;
  }
  if (_showAutolayoutIssues) {
    [v7 exerciseAmbiguityInLayout];
  }
  v26 = objc_getAssociatedObject(v7, v15);
  if (!v26)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[_NAUIAmbigousLayoutView installOnView:forVariable:]((uint64_t)v7, (uint64_t)v6);
    }
    v27 = -[_NAUIAmbigousLayoutView initWithFrame:]([_NAUIAmbigousLayoutView alloc], "initWithFrame:", v18, v19, v17, v20);
    v28 = v27;
    if (_showAutolayoutIssues)
    {
      [(_NAUIAmbigousLayoutView *)v27 setOpaque:0];
      v29 = [MEMORY[0x263F1C550] orangeColor];
      [(_NAUIAmbigousLayoutView *)v28 setTintColor:v29];

      [v7 addSubview:v28];
      [v7 setClipsToBounds:0];
    }
    objc_setAssociatedObject(v7, v15, v28, (void *)1);
  }
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  id v5 = [(_NAUIAmbigousLayoutView *)self tintColor];
  [v5 setFill];

  [(_NAUIAmbigousLayoutView *)self bounds];
  double Width = CGRectGetWidth(v23);
  [(_NAUIAmbigousLayoutView *)self bounds];
  double Height = CGRectGetHeight(v24);
  [(_NAUIAmbigousLayoutView *)self bounds];
  if (Width <= Height)
  {
    v31.size.width = CGRectGetWidth(*(CGRect *)&v8);
    CGFloat MidY = 0.0;
    CGFloat v16 = 1.0;
    v31.origin.x = 0.0;
    v31.origin.y = 0.0;
    v31.size.height = 1.0;
    CGContextFillRect(CurrentContext, v31);
    [(_NAUIAmbigousLayoutView *)self bounds];
    CGFloat v17 = CGRectGetMaxY(v32) + -1.0;
    [(_NAUIAmbigousLayoutView *)self bounds];
    v34.size.width = CGRectGetWidth(v33);
    v34.origin.x = 0.0;
    v34.size.height = 1.0;
    v34.origin.y = v17;
    CGContextFillRect(CurrentContext, v34);
    [(_NAUIAmbigousLayoutView *)self bounds];
    CGFloat MidX = CGRectGetMidX(v35);
    [(_NAUIAmbigousLayoutView *)self bounds];
    CGFloat v13 = CGRectGetHeight(v36);
  }
  else
  {
    v25.size.height = CGRectGetHeight(*(CGRect *)&v8);
    CGFloat MidX = 0.0;
    CGFloat v13 = 1.0;
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.width = 1.0;
    CGContextFillRect(CurrentContext, v25);
    [(_NAUIAmbigousLayoutView *)self bounds];
    CGFloat v14 = CGRectGetMaxX(v26) + -1.0;
    [(_NAUIAmbigousLayoutView *)self bounds];
    v28.size.height = CGRectGetHeight(v27);
    v28.origin.y = 0.0;
    v28.size.width = 1.0;
    v28.origin.x = v14;
    CGContextFillRect(CurrentContext, v28);
    [(_NAUIAmbigousLayoutView *)self bounds];
    CGFloat MidY = CGRectGetMidY(v29);
    [(_NAUIAmbigousLayoutView *)self bounds];
    CGFloat v16 = CGRectGetWidth(v30);
  }
  CGFloat v18 = MidX;
  CGFloat v19 = MidY;
  CGFloat v20 = v16;
  CGFloat v21 = v13;
  CGContextFillRect(CurrentContext, *(CGRect *)&v18);
}

+ (void)installOnView:(uint64_t)a1 forVariable:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_2227B2000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AMBIGUOUS LAYOUT: %@ - %@", (uint8_t *)&v2, 0x16u);
}

@end