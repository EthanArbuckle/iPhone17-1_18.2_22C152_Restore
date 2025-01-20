@interface WAAQIScaleView
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (WAAQIScale)scale;
- (WAAQIScaleView)initWithFrame:(CGRect)a3;
- (double)aqiPercentageInRange;
- (unint64_t)AQI;
- (unint64_t)sanitizedAQI:(unint64_t)a3;
- (void)drawRect:(CGRect)a3;
- (void)setAQI:(unint64_t)a3;
- (void)setAqiPercentageInRange:(double)a3;
- (void)setScale:(id)a3;
@end

@implementation WAAQIScaleView

- (WAAQIScaleView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WAAQIScaleView;
  v3 = -[WAAQIScaleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(WAAQIScaleView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (void)setScale:(id)a3
{
  v5 = (WAAQIScale *)a3;
  if (self->_scale != v5)
  {
    objc_storeStrong((id *)&self->_scale, a3);
    [(WAAQIScaleView *)self setAQI:[(WAAQIScale *)v5 range]];
    [(WAAQIScaleView *)self setNeedsDisplay];
  }
}

- (void)setAQI:(unint64_t)a3
{
  if (self->_AQI != a3)
  {
    self->_AQI = -[WAAQIScaleView sanitizedAQI:](self, "sanitizedAQI:");
    [(WAAQIScaleView *)self setNeedsDisplay];
  }
}

- (unint64_t)sanitizedAQI:(unint64_t)a3
{
  v5 = [(WAAQIScaleView *)self scale];
  unint64_t v6 = [v5 range];
  unint64_t v8 = v7;

  if (a3 < v6 || a3 - v6 >= v8)
  {
    v9 = [(WAAQIScaleView *)self scale];
    uint64_t v10 = [v9 range];
    unint64_t v12 = v10 + v11;

    v13 = [(WAAQIScaleView *)self scale];
    unint64_t v14 = [v13 range];

    if (v12 <= a3) {
      return v12;
    }
    else {
      return v14;
    }
  }
  return a3;
}

- (double)aqiPercentageInRange
{
  unint64_t v3 = [(WAAQIScaleView *)self AQI];
  v4 = [(WAAQIScaleView *)self scale];
  v5 = [v4 gradient];
  uint64_t v6 = [v5 range];
  double v8 = (double)(unint64_t)(v6 + v7);

  v9 = [(WAAQIScaleView *)self scale];
  uint64_t v10 = [v9 gradient];
  double v11 = (double)(unint64_t)[v10 range];

  double result = 0.0;
  if (v8 - v11 > 0.0) {
    return 1.0 - (v8 - (double)v3) / (v8 - v11);
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(WAAQIScaleView *)self bounds];
  double v3 = v2;
  double v4 = 9.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v62.receiver = self;
  v62.super_class = (Class)WAAQIScaleView;
  -[WAAQIScaleView drawRect:](&v62, sel_drawRect_);
  if (self->_scale)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    if (IsUIRTL())
    {
      v65.origin.double x = x;
      v65.origin.double y = y;
      v65.size.double width = width;
      v65.size.double height = height;
      transform.a = -1.0;
      transform.b = 0.0;
      transform.c = 0.0;
      transform.d = 1.0;
      transform.tdouble x = CGRectGetWidth(v65);
      transform.tdouble y = 0.0;
      CGContextConcatCTM(CurrentContext, &transform);
    }
    CGContextSaveGState(CurrentContext);
    v52.origin.double x = x;
    v52.origin.double y = y;
    v52.size.double width = width;
    v52.size.double height = height;
    -[WAAQIScaleView trackRectForBounds:](self, "trackRectForBounds:", x, y, width, height);
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(WAAQIScaleView *)self bounds];
    CGFloat rect = v10;
    -[WAAQIScaleView thumbRectForBounds:trackRect:](self, "thumbRectForBounds:trackRect:");
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    v25 = [MEMORY[0x263F1C478] bezierPath];
    v66.origin.double x = v10;
    v66.origin.double y = v12;
    v66.size.double width = v14;
    v66.size.double height = v16;
    objc_msgSend(v25, "moveToPoint:", 4.5, CGRectGetMinY(v66));
    v67.origin.double x = v18;
    CGFloat v26 = v18;
    CGFloat v55 = v18;
    CGFloat v56 = v24;
    v67.origin.double y = v20;
    v67.size.double width = v22;
    CGFloat v27 = v22;
    CGFloat rect_8 = v22;
    v67.size.double height = v24;
    CGFloat v28 = CGRectGetMinX(v67) + -1.5;
    v68.origin.double x = rect;
    v68.origin.double y = v12;
    v68.size.double width = v14;
    v68.size.double height = v16;
    objc_msgSend(v25, "addLineToPoint:", v28, CGRectGetMinY(v68));
    v69.origin.double x = v26;
    v69.origin.double y = v20;
    v69.size.double width = v27;
    v69.size.double height = v24;
    CGFloat v29 = CGRectGetMinX(v69) + 3.0;
    v70.origin.double x = rect;
    v70.origin.double y = v12;
    v70.size.double width = v14;
    v70.size.double height = v16;
    objc_msgSend(v25, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v29, CGRectGetMidY(v70), 6.0);
    v71.origin.double x = rect;
    v71.origin.double y = v12;
    v71.size.double width = v14;
    v71.size.double height = v16;
    objc_msgSend(v25, "addLineToPoint:", 4.5, CGRectGetMaxY(v71));
    v72.origin.double x = rect;
    v72.origin.double y = v12;
    v72.size.double width = v14;
    v72.size.double height = v16;
    objc_msgSend(v25, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 4.5, CGRectGetMidY(v72), 4.5, 1.57079633, 4.71238898);
    [v25 closePath];
    v73.size.double height = v56;
    v73.origin.double x = v55;
    v73.origin.double y = v20;
    v73.size.double width = rect_8;
    CGFloat v30 = CGRectGetMaxX(v73) + 1.5;
    v74.origin.double x = rect;
    v74.origin.double y = v12;
    v74.size.double width = v14;
    v74.size.double height = v16;
    objc_msgSend(v25, "moveToPoint:", v30, CGRectGetMinY(v74));
    v75.origin.double x = rect;
    v75.origin.double y = v12;
    v75.size.double width = v14;
    v75.size.double height = v16;
    CGFloat v31 = CGRectGetMaxX(v75) + -4.5;
    v76.origin.double x = rect;
    v76.origin.double y = v12;
    v76.size.double width = v14;
    v76.size.double height = v16;
    objc_msgSend(v25, "addLineToPoint:", v31, CGRectGetMinY(v76));
    v77.origin.double x = rect;
    v77.origin.double y = v12;
    v77.size.double width = v14;
    v77.size.double height = v16;
    CGFloat v32 = CGRectGetMaxX(v77) + -4.5;
    v78.origin.double x = rect;
    v78.origin.double y = v12;
    v78.size.double width = v14;
    v78.size.double height = v16;
    objc_msgSend(v25, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v32, CGRectGetMidY(v78), 4.5, 4.71238898, 1.57079633);
    v79.origin.double x = v55;
    v79.origin.double y = v20;
    v79.size.double width = rect_8;
    v79.size.double height = v56;
    CGFloat v33 = CGRectGetMaxX(v79) + 1.5;
    v80.origin.double x = rect;
    v80.origin.double y = v12;
    v80.size.double width = v14;
    v80.size.double height = v16;
    objc_msgSend(v25, "addLineToPoint:", v33, CGRectGetMaxY(v80));
    v81.origin.double x = v55;
    v81.origin.double y = v20;
    v81.size.double width = rect_8;
    v81.size.double height = v56;
    CGFloat v34 = CGRectGetMaxX(v81) + -3.0;
    v82.origin.double x = rect;
    v82.origin.double y = v12;
    v82.size.double width = v14;
    v82.size.double height = v16;
    objc_msgSend(v25, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v34, CGRectGetMidY(v82), 6.0, 1.57079633, 4.71238898);
    [v25 closePath];
    id v35 = v25;
    CGContextAddPath(CurrentContext, (CGPathRef)[v35 CGPath]);
    CGContextClip(CurrentContext);
    v36 = [(WAAQIScale *)self->_scale gradient];
    v37 = [v36 stops];
    v38 = (CGFloat *)malloc_type_malloc(8 * [v37 count], 0x100004000313F17uLL);

    v39 = [MEMORY[0x263EFF980] array];
    v40 = [(WAAQIScale *)self->_scale gradient];
    uint64_t v41 = [v40 range];
    unint64_t v43 = v41 + v42;

    if (v43)
    {
      v44 = [(WAAQIScale *)self->_scale gradient];
      v45 = [v44 stops];
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __27__WAAQIScaleView_drawRect___block_invoke;
      v57[3] = &unk_2647E0398;
      id v58 = v39;
      v59 = v38;
      double v60 = (double)v43;
      [v45 enumerateObjectsUsingBlock:v57];
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v47 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v39, v38);
    v64.double x = CGRectGetWidth(v52);
    v64.double y = 0.0;
    CGContextDrawLinearGradient(CurrentContext, v47, *MEMORY[0x263F00148], v64, 0);
    CGGradientRelease(v47);
    CGColorSpaceRelease(DeviceRGB);
    free(v38);
    CGContextRestoreGState(CurrentContext);
    v83.origin.double x = v55;
    v83.size.double height = v56;
    v83.origin.double y = v20;
    v83.size.double width = rect_8;
    v48 = CGPathCreateWithEllipseInRect(v83, 0);
    id v49 = [MEMORY[0x263F1C550] whiteColor];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v49 CGColor]);

    CGContextAddPath(CurrentContext, v48);
    id v50 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.2];
    v51 = (CGColor *)[v50 CGColor];
    v63.double height = 0.33;
    v63.double width = 0.0;
    CGContextSetShadowWithColor(CurrentContext, v63, 0.5, v51);

    CGContextFillPath(CurrentContext);
    CGPathRelease(v48);
  }
}

double __27__WAAQIScaleView_drawRect___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v6 color];
  objc_msgSend(v5, "addObject:", objc_msgSend(v7, "CGColor"));

  [v6 location];
  float v9 = v8;

  double result = v9 / *(double *)(a1 + 48);
  *(double *)(*(void *)(a1 + 40) + 8 * a3) = result;
  return result;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  CGFloat width = a3.size.width;
  CGFloat x = a3.origin.x;
  double v5 = (CGRectGetHeight(a3) + -9.0) * 0.5;
  double v6 = 9.0;
  double v7 = x;
  double v8 = width;
  result.size.double height = v6;
  result.size.CGFloat width = v8;
  result.origin.double y = v5;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4
{
  if (self->_scale)
  {
    CGFloat height = a4.size.height;
    CGFloat width = a4.size.width;
    CGFloat y = a4.origin.y;
    CGFloat x = a4.origin.x;
    CGFloat v9 = CGRectGetMaxX(a4) + -12.0 + 3.0 + -6.0 + -6.0;
    [(WAAQIScaleView *)self aqiPercentageInRange];
    double v11 = v9 * v10 + 6.0;
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    double v12 = CGRectGetMidY(v16) + -4.5;
    double v13 = 9.0;
    double v14 = 9.0;
  }
  else
  {
    double v11 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v15 = v11;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v15;
  return result;
}

- (WAAQIScale)scale
{
  return self->_scale;
}

- (unint64_t)AQI
{
  return self->_AQI;
}

- (void)setAqiPercentageInRange:(double)a3
{
  self->_aqiPercentageInRange = a3;
}

- (void).cxx_destruct
{
}

@end