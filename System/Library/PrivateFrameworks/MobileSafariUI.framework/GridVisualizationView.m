@interface GridVisualizationView
- (GridVisualizationView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation GridVisualizationView

- (GridVisualizationView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GridVisualizationView;
  v3 = -[GridVisualizationView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(GridVisualizationView *)v3 setNeedsDisplayOnBoundsChange:1];
    v5 = v4;
  }

  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v41[3] = *MEMORY[0x1E4F143B8];
  CurrentContext = UIGraphicsGetCurrentContext();
  v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v36 = [MEMORY[0x1E4FB1618] greenColor];
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  CGContextClearRect(CurrentContext, v42);
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  int64_t v9 = vcvtpd_s64_f64(CGRectGetMinX(v43) / 100.0);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  int64_t v10 = vcvtmd_s64_f64(CGRectGetMaxX(v44) / 100.0);
  [v8 setStroke];
  uint64_t v34 = v9;
  int64_t v32 = v10;
  if (v9 <= v10)
  {
    uint64_t v11 = v9;
    do
    {
      v12 = [MEMORY[0x1E4FB14C0] bezierPath];
      v45.origin.CGFloat x = x;
      v45.origin.CGFloat y = y;
      v45.size.CGFloat width = width;
      v45.size.CGFloat height = height;
      objc_msgSend(v12, "moveToPoint:", (double)v11 * 100.0, CGRectGetMinY(v45));
      v46.origin.CGFloat x = x;
      v46.origin.CGFloat y = y;
      v46.size.CGFloat width = width;
      v46.size.CGFloat height = height;
      objc_msgSend(v12, "addLineToPoint:", (double)v11 * 100.0, CGRectGetMaxY(v46));
      [v12 stroke];

      ++v11;
    }
    while (v10 + 1 != v11);
  }
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  int64_t v13 = vcvtpd_s64_f64(CGRectGetMinY(v47) / 100.0);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  int64_t v14 = vcvtmd_s64_f64(CGRectGetMaxY(v48) / 100.0);
  [v36 setStroke];
  int64_t v33 = v13;
  int64_t v31 = v14;
  if (v13 <= v14)
  {
    uint64_t v15 = v13;
    do
    {
      v16 = [MEMORY[0x1E4FB14C0] bezierPath];
      v49.origin.CGFloat x = x;
      v49.origin.CGFloat y = y;
      v49.size.CGFloat width = width;
      v49.size.CGFloat height = height;
      objc_msgSend(v16, "moveToPoint:", CGRectGetMinX(v49), (double)v15 * 100.0);
      v50.origin.CGFloat x = x;
      v50.origin.CGFloat y = y;
      v50.size.CGFloat width = width;
      v50.size.CGFloat height = height;
      objc_msgSend(v16, "addLineToPoint:", CGRectGetMaxX(v50), (double)v15 * 100.0);
      [v16 stroke];

      ++v15;
    }
    while (v14 + 1 != v15);
  }
  v17 = [MEMORY[0x1E4FB08E0] monospacedSystemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09D8]];
  id v18 = objc_alloc_init(MEMORY[0x1E4FB0858]);
  [v18 setShadowBlurRadius:1.0];
  objc_msgSend(v18, "setShadowOffset:", 1.0, 1.0);
  if (v34 <= v32)
  {
    uint64_t v19 = *MEMORY[0x1E4FB0700];
    uint64_t v20 = *MEMORY[0x1E4FB06F8];
    uint64_t v21 = *MEMORY[0x1E4FB0758];
    unint64_t v22 = 0x1E4F29000uLL;
    v35 = v8;
    do
    {
      if (v33 <= v31)
      {
        uint64_t v23 = v33;
        double v24 = (double)v34 * 100.0;
        do
        {
          double v25 = (double)v23 * 100.0;
          v40[0] = v19;
          v40[1] = v20;
          v41[0] = v8;
          v41[1] = v17;
          v40[2] = v21;
          v41[2] = v18;
          v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
          v26 = objc_msgSend(*(id *)(v22 + 24), "stringWithFormat:", @"%.0f", *(void *)&v24);
          objc_msgSend(v26, "drawAtPoint:withAttributes:", v37, v24 + 2.0, v25 + -12.0 + -2.0);

          v38[0] = v19;
          v38[1] = v20;
          v39[0] = v36;
          v39[1] = v17;
          v38[2] = v21;
          v39[2] = v18;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
          v28 = objc_msgSend(NSString, "stringWithFormat:", @"%.0f", *(void *)&v25);
          [v28 sizeWithAttributes:v27];
          objc_msgSend(v28, "drawAtPoint:withAttributes:", v27, v24 - v29 + -2.0, v25 + 2.0);

          unint64_t v22 = 0x1E4F29000;
          v8 = v35;
          ++v23;
        }
        while (v31 + 1 != v23);
      }
    }
    while (v34++ != v32);
  }
}

@end