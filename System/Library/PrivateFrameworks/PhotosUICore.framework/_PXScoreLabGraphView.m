@interface _PXScoreLabGraphView
- (NSPredicate)assetPredicate;
- (_PXScoreLabGraphView)initWithFrame:(CGRect)a3;
- (_PXScoreLabGraphViewDelegate)delegate;
- (id)xScoreValueGetter;
- (id)yScoreValueGetter;
- (unint64_t)graphType;
- (void)cancelGesture;
- (void)drawAxisInContext:(CGContext *)a3 minXValue:(double)a4 maxXValue:(double)a5 minYValue:(double)a6 maxYValue:(double)a7;
- (void)drawCorrelationInContext:(CGContext *)a3;
- (void)drawDistributionInContext:(CGContext *)a3;
- (void)drawRect:(CGRect)a3;
- (void)drawTextPanelWithNumberOfAssets:(int64_t)a3 numberOfIgnoredAssets:(unint64_t)a4 rho:(double)a5 inContext:(CGContext *)a6;
- (void)drawXMean:(double)a3 andStddev:(double)a4 inContext:(CGContext *)a5;
- (void)drawYMean:(double)a3 andStddev:(double)a4 inContext:(CGContext *)a5;
- (void)enumerateAssetsUsingBlock:(id)a3;
- (void)loadCorrelationData;
- (void)loadDistributionData;
- (void)panned:(id)a3;
- (void)pinched:(id)a3;
- (void)reloadData;
- (void)setAssetPredicate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGraphType:(unint64_t)a3;
- (void)setXScoreValueGetter:(id)a3;
- (void)setYScoreValueGetter:(id)a3;
- (void)startGestureAtLocation:(CGPoint)a3;
- (void)updateGestureWithLocation:(CGPoint)a3 scale:(double)a4;
@end

@implementation _PXScoreLabGraphView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetPredicate, 0);
  objc_storeStrong(&self->_yScoreValueGetter, 0);
  objc_storeStrong(&self->_xScoreValueGetter, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_allYValues, 0);
  objc_storeStrong((id *)&self->_allXValues, 0);
}

- (void)setDelegate:(id)a3
{
}

- (_PXScoreLabGraphViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_PXScoreLabGraphViewDelegate *)WeakRetained;
}

- (void)setAssetPredicate:(id)a3
{
}

- (NSPredicate)assetPredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 664, 1);
}

- (void)setGraphType:(unint64_t)a3
{
  self->_graphType = a3;
}

- (unint64_t)graphType
{
  return self->_graphType;
}

- (void)setYScoreValueGetter:(id)a3
{
}

- (id)yScoreValueGetter
{
  return objc_getProperty(self, a2, 648, 1);
}

- (void)setXScoreValueGetter:(id)a3
{
}

- (id)xScoreValueGetter
{
  return objc_getProperty(self, a2, 640, 1);
}

- (void)drawCorrelationInContext:(CGContext *)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = vcvtmd_u64_f64(self->_graphWidth);
  unint64_t v5 = vcvtmd_u64_f64(self->_graphHeight);
  v73 = (double *)malloc_type_calloc(v5 * v4, 8uLL, 0x100004000313F17uLL);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v6 = self->_allXValues;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v79 objects:v83 count:16];
  size_t v70 = v4;
  size_t v71 = v5;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    double v10 = (double)(v4 - 1);
    double v11 = (double)(v5 - 1);
    uint64_t v12 = *(void *)v80;
    double v13 = (double)v4;
    double v14 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v80 != v12) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v79 + 1) + 8 * i) doubleValue];
        double minXValue = self->_minXValue;
        if (v16 >= minXValue)
        {
          double v18 = v16;
          double maxXValue = self->_maxXValue;
          if (v16 <= maxXValue)
          {
            v20 = [(NSArray *)self->_allYValues objectAtIndexedSubscript:v9 + i];
            [v20 doubleValue];
            double minYValue = self->_minYValue;
            if (v21 >= minYValue)
            {
              double maxYValue = self->_maxYValue;
              if (v21 <= maxYValue)
              {
                double v24 = (v18 - minXValue) / (maxXValue - minXValue) * v10;
                double v25 = floor(v24);
                double v26 = v24 - v25;
                double v27 = (v21 - minYValue) / (maxYValue - minYValue) * v11;
                double v28 = floor(v27);
                double v29 = v27 - v28;
                unint64_t v30 = (unint64_t)(v25 + v28 * v13);
                double v31 = v73[v30] + (1.0 - v26) * (1.0 - v29);
                v73[v30] = v31;
                if (v31 > v14) {
                  double v14 = v31;
                }
                if (v26 > 0.0)
                {
                  unint64_t v32 = (unint64_t)(v25 + 1.0 + v28 * v13);
                  double v33 = v73[v32] + v26 * (1.0 - v29);
                  v73[v32] = v33;
                  if (v33 > v14) {
                    double v14 = v33;
                  }
                }
                if (v29 > 0.0)
                {
                  double v34 = v28 + 1.0;
                  unint64_t v35 = (unint64_t)(v25 + v34 * v13);
                  double v36 = v73[v35] + (1.0 - v26) * v29;
                  v73[v35] = v36;
                  if (v36 > v14) {
                    double v14 = v36;
                  }
                  if (v26 > 0.0)
                  {
                    unint64_t v37 = (unint64_t)(v25 + 1.0 + v34 * v13);
                    double v38 = v73[v37] + v26 * v29;
                    v73[v37] = v38;
                    if (v38 > v14) {
                      double v14 = v38;
                    }
                  }
                }
              }
            }
          }
        }
      }
      v9 += i;
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v79 objects:v83 count:16];
    }
    while (v8);
  }
  else
  {
    double v14 = 0.0;
  }

  [(_PXScoreLabGraphView *)self drawAxisInContext:a3 minXValue:self->_minXValue maxXValue:self->_maxXValue minYValue:self->_minYValue maxYValue:self->_maxYValue];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  unint64_t v40 = v70;
  v41 = CGBitmapContextCreate(0, v70, v71, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  Data = CGBitmapContextGetData(v41);
  context = v41;
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v41);
  if (v70)
  {
    uint64_t v44 = 0;
    uint64_t v45 = 4 * (BytesPerRow >> 2);
    v46 = v73;
    do
    {
      v47 = v46;
      v72 = Data;
      for (size_t j = v71; j; --j)
      {
        double v49 = *v47 / v14;
        double v77 = 0.0;
        double v78 = 0.0;
        *(double *)&uint64_t v75 = 1.0;
        double v76 = 0.0;
        if (v49 <= 0.0)
        {
          double v52 = 1.0;
          double v53 = 0.0;
          double v51 = 0.0;
          double v54 = 0.0;
        }
        else
        {
          v50 = [MEMORY[0x1E4FB1618] colorWithHue:(1.0 - v49) * 0.5 saturation:1.0 brightness:(v49 + 1.0) * 0.5 alpha:1.0];
          [v50 getRed:&v78 green:&v76 blue:&v77 alpha:&v75];

          double v52 = *(double *)&v75;
          double v51 = v76;
          double v54 = v77;
          double v53 = v78;
        }
        _DWORD *Data = ((v54 * 255.0) << 16) | ((v52 * 255.0) << 24) | ((v51 * 255.0) << 8) | (v53 * 255.0);
        Data = (_DWORD *)((char *)Data + v45);
        v47 += v70;
      }
      ++v44;
      Data = v72 + 1;
      ++v46;
      unint64_t v40 = v70;
    }
    while (v44 != v70);
  }
  Image = CGBitmapContextCreateImage(context);
  v85.origin.x = self->_leftMargin;
  v85.origin.y = self->_topMargin;
  v85.size.width = (double)v40;
  v85.size.height = (double)v71;
  CGContextDrawImage(a3, v85, Image);
  CGImageRelease(Image);
  CGContextRelease(context);
  free(v73);
  [(_PXScoreLabGraphView *)self drawXMean:a3 andStddev:self->_Ex inContext:sqrt(self->_Ex2 - self->_Ex * self->_Ex)];
  [(_PXScoreLabGraphView *)self drawYMean:a3 andStddev:self->_Ey inContext:sqrt(self->_Ey2 - self->_Ey * self->_Ey)];
  id v74 = [MEMORY[0x1E4FB1618] colorWithHue:0.6 saturation:1.0 brightness:1.0 alpha:1.0];
  Components = CGColorGetComponents((CGColorRef)[v74 CGColor]);
  CGContextSetStrokeColor(a3, Components);
  double Ex = self->_Ex;
  double Ey = self->_Ey;
  double v59 = sqrt(self->_Ex2 - Ex * Ex);
  double v60 = sqrt(self->_Ey2 - Ey * Ey);
  double v61 = (self->_Exy - Ex * Ey) / (v59 * v60);
  [(_PXScoreLabGraphView *)self drawTextPanelWithNumberOfAssets:[(NSArray *)self->_allXValues count] numberOfIgnoredAssets:self->_numberOfIgnoredAssets rho:a3 inContext:v61];
  CGContextBeginPath(a3);
  double v62 = v60 * v61 / v59;
  double v63 = self->_minXValue;
  CGContextMoveToPoint(a3, self->_leftMargin + (v63 - v63) * self->_graphWidth / (self->_maxXValue - v63), self->_topMargin+ self->_graphHeight* (1.0 - (self->_Ey + v62 * (v63 - self->_Ex) - self->_minYValue) / (self->_maxYValue - self->_minYValue)));
  double v64 = self->_maxXValue;
  CGContextAddLineToPoint(a3, self->_leftMargin + self->_graphWidth * (v64 - self->_minXValue) / (v64 - self->_minXValue), self->_topMargin+ self->_graphHeight* (1.0 - (self->_Ey + v62 * (v64 - self->_Ex) - self->_minYValue) / (self->_maxYValue - self->_minYValue)));
  CGContextClosePath(a3);
  CGContextDrawPath(a3, kCGPathStroke);
  CGContextBeginPath(a3);
  double v65 = v59 * v61 / v60;
  double v66 = self->_minYValue;
  CGContextMoveToPoint(a3, self->_leftMargin+ self->_graphWidth * (self->_Ex + v65 * (v66 - self->_Ey) - self->_minXValue) / (self->_maxXValue - self->_minXValue), self->_topMargin + self->_graphHeight * (1.0 - (v66 - v66) / (self->_maxYValue - v66)));
  double v67 = self->_maxYValue;
  CGContextAddLineToPoint(a3, self->_leftMargin+ self->_graphWidth * (self->_Ex + v65 * (v67 - self->_Ey) - self->_minXValue) / (self->_maxXValue - self->_minXValue), self->_topMargin + self->_graphHeight * (1.0 - (v67 - self->_minYValue) / (v67 - self->_minYValue)));
  CGContextClosePath(a3);
  CGContextDrawPath(a3, kCGPathStroke);
}

- (void)drawDistributionInContext:(CGContext *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  size_t v5 = vcvtmd_u64_f64(self->_graphWidth);
  v6 = (double *)malloc_type_calloc(v5, 8uLL, 0x100004000313F17uLL);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = self->_allXValues;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * i) doubleValue];
        double minXValue = self->_minXValue;
        if (v13 >= minXValue)
        {
          double maxXValue = self->_maxXValue;
          if (v13 <= maxXValue)
          {
            double v16 = (v13 - minXValue) / (maxXValue - minXValue) * (double)(v5 - 1);
            double v17 = v16 - floor(v16);
            unint64_t v18 = (unint64_t)v16;
            double v19 = 1.0 - v17 + v6[(unint64_t)v16];
            v6[v18] = v19;
            if (v19 > v11) {
              double v11 = v19;
            }
            if (v17 > 0.0)
            {
              v20 = &v6[v18];
              double v21 = v17 + v20[1];
              v20[1] = v21;
              if (v21 > v11) {
                double v11 = v21;
              }
            }
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  self->_double minYValue = 0.0;
  self->_double maxYValue = v11;
  [(_PXScoreLabGraphView *)self drawAxisInContext:a3 minXValue:self->_minXValue maxXValue:self->_maxXValue minYValue:0.0 maxYValue:0.0];
  if (v5)
  {
    for (unint64_t j = 0; j != v5; ++j)
    {
      CGContextBeginPath(a3);
      CGFloat v23 = self->_leftMargin + (double)j;
      CGContextMoveToPoint(a3, v23, self->_topMargin + self->_graphHeight);
      CGContextAddLineToPoint(a3, v23, self->_topMargin+ self->_graphHeight * (1.0 - (v6[j] - self->_minYValue) / (self->_maxYValue - self->_minYValue)));
      CGContextClosePath(a3);
      id v24 = [MEMORY[0x1E4FB1618] colorWithHue:(1.0 - v6[j] / v11) * 0.5 saturation:1.0 brightness:(v6[j] / v11 + 1.0) * 0.5 alpha:1.0];
      Components = CGColorGetComponents((CGColorRef)[v24 CGColor]);
      CGContextSetStrokeColor(a3, Components);
      CGContextDrawPath(a3, kCGPathStroke);
    }
  }
  free(v6);
  [(_PXScoreLabGraphView *)self drawXMean:a3 andStddev:self->_Ex inContext:sqrt(self->_Ex2 - self->_Ex * self->_Ex)];
  [(_PXScoreLabGraphView *)self drawTextPanelWithNumberOfAssets:[(NSArray *)self->_allXValues count] numberOfIgnoredAssets:self->_numberOfIgnoredAssets rho:a3 inContext:-1.79769313e308];
}

- (void)drawTextPanelWithNumberOfAssets:(int64_t)a3 numberOfIgnoredAssets:(unint64_t)a4 rho:(double)a5 inContext:(CGContext *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)components = xmmword_1AB35B130;
  long long v31 = unk_1AB35B140;
  CGContextSetStrokeColor(a6, components);
  CGContextSetLineWidth(a6, 1.0);
  CGContextSetTextDrawingMode(a6, kCGTextStroke);
  CGAffineTransformMakeScale(&v27, 1.0, -1.0);
  CGContextSetTextMatrix(a6, &v27);
  double v11 = self->_leftMargin + 20.0;
  double v12 = self->_topMargin + 20.0;
  uint64_t v28 = *MEMORY[0x1E4FB06F8];
  double v13 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09E8]];
  long long v29 = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];

  if ((a3 & 0x8000000000000000) == 0)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v16 = objc_msgSend(NSString, "stringWithFormat:", @"N=%lu", a3);
    CFAttributedStringRef v17 = (const __CFAttributedString *)[v15 initWithString:v16 attributes:v14];
    unint64_t v18 = CTLineCreateWithAttributedString(v17);

    CGContextSetTextPosition(a6, v11, v12);
    CTLineDraw(v18, a6);
    CFRelease(v18);
    double v12 = v12 + 12.0;
  }
  id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"Ñ=%lu", a4);
  CFAttributedStringRef v21 = (const __CFAttributedString *)[v19 initWithString:v20 attributes:v14];
  v22 = CTLineCreateWithAttributedString(v21);

  CGContextSetTextPosition(a6, v11, v12);
  CTLineDraw(v22, a6);
  CFRelease(v22);
  if (a5 > -1.79769313e308)
  {
    id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v24 = objc_msgSend(NSString, "stringWithFormat:", @"R²=%.3f", a5 * a5);
    CFAttributedStringRef v25 = (const __CFAttributedString *)[v23 initWithString:v24 attributes:v14];
    long long v26 = CTLineCreateWithAttributedString(v25);

    CGContextSetTextPosition(a6, v11, v12 + 12.0);
    CTLineDraw(v26, a6);
    CFRelease(v26);
  }
}

- (void)drawYMean:(double)a3 andStddev:(double)a4 inContext:(CGContext *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = [MEMORY[0x1E4FB1618] colorWithHue:0.6 saturation:1.0 brightness:1.0 alpha:1.0];
  uint64_t v10 = CGColorGetComponents((CGColorRef)[v9 CGColor]);
  CGContextSetStrokeColor(a5, v10);
  CGContextBeginPath(a5);
  CGFloat v11 = self->_leftMargin + self->_graphWidth + 6.0;
  CGFloat v12 = self->_topMargin + self->_graphHeight * (1.0 - (a3 - self->_minYValue) / (self->_maxYValue - self->_minYValue));
  CGContextMoveToPoint(a5, v11 + -6.0, v12);
  CGContextAddLineToPoint(a5, v11 + 6.0, v12);
  CGFloat v13 = self->_topMargin
      + self->_graphHeight * (1.0 - (a3 - a4 - self->_minYValue) / (self->_maxYValue - self->_minYValue));
  CGContextMoveToPoint(a5, v11 + 3.0, v13);
  CGContextAddLineToPoint(a5, v11 + -3.0, v13);
  CGFloat v14 = self->_topMargin
      + self->_graphHeight * (1.0 - (a3 + a4 - self->_minYValue) / (self->_maxYValue - self->_minYValue));
  CGContextMoveToPoint(a5, v11 + 3.0, v14);
  CGContextAddLineToPoint(a5, v11 + -3.0, v14);
  CGContextMoveToPoint(a5, v11, v13);
  CGContextAddLineToPoint(a5, v11, v14);
  CGContextClosePath(a5);
  CGContextDrawPath(a5, kCGPathStroke);
  *(_OWORD *)components = xmmword_1AB35B130;
  long long v32 = unk_1AB35B140;
  CGContextSetStrokeColor(a5, components);
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetTextDrawingMode(a5, kCGTextStroke);
  CGAffineTransformMakeScale(&v28, 1.0, -1.0);
  CGContextSetTextMatrix(a5, &v28);
  memset(&v27, 0, sizeof(v27));
  CGContextGetCTM(&v27, a5);
  CGAffineTransform v25 = v27;
  CGAffineTransformRotate(&v26, &v25, 1.57079633);
  CGContextSetCTM();
  uint64_t v29 = *MEMORY[0x1E4FB06F8];
  id v15 = [MEMORY[0x1E4FB08E0] systemFontOfSize:8.0 weight:*MEMORY[0x1E4FB09F8]];
  unint64_t v30 = v15;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];

  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  unint64_t v18 = [NSString stringWithFormat:@"%.2f", *(void *)&a3];
  CFAttributedStringRef v19 = (const __CFAttributedString *)[v17 initWithString:v18 attributes:v16];
  v20 = CTLineCreateWithAttributedString(v19);

  CGRect ImageBounds = CTLineGetImageBounds(v20, a5);
  CGContextSetTextPosition(a5, v12 + ImageBounds.size.width * -0.5, -(v11 - ImageBounds.size.height + -6.0));
  CTLineDraw(v20, a5);
  CFRelease(v20);
  id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
  v22 = [NSString stringWithFormat:@"%.2f", *(void *)&a4];
  CFAttributedStringRef v23 = (const __CFAttributedString *)[v21 initWithString:v22 attributes:v16];
  id v24 = CTLineCreateWithAttributedString(v23);

  CGRect v35 = CTLineGetImageBounds(v24, a5);
  CGContextSetTextPosition(a5, v35.size.width * -0.5 + (v12 + v13) * 0.5, -(v11 - v35.size.height + -6.0));
  CTLineDraw(v24, a5);
  CFRelease(v24);
  CGAffineTransform v25 = v27;
  CGContextSetCTM();
}

- (void)drawXMean:(double)a3 andStddev:(double)a4 inContext:(CGContext *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = [MEMORY[0x1E4FB1618] colorWithHue:0.6 saturation:1.0 brightness:1.0 alpha:1.0];
  uint64_t v10 = CGColorGetComponents((CGColorRef)[v9 CGColor]);
  CGContextSetStrokeColor(a5, v10);
  CGContextBeginPath(a5);
  CGFloat v11 = self->_leftMargin + self->_graphWidth * (a3 - self->_minXValue) / (self->_maxXValue - self->_minXValue);
  CGFloat v12 = self->_topMargin + -6.0;
  CGContextMoveToPoint(a5, v11, v12 + -6.0);
  CGContextAddLineToPoint(a5, v11, v12 + 6.0);
  CGFloat v13 = self->_leftMargin + self->_graphWidth * (a3 - a4 - self->_minXValue) / (self->_maxXValue - self->_minXValue);
  CGContextMoveToPoint(a5, v13, v12 + -3.0);
  CGContextAddLineToPoint(a5, v13, v12 + 3.0);
  CGFloat v14 = self->_leftMargin + self->_graphWidth * (a3 + a4 - self->_minXValue) / (self->_maxXValue - self->_minXValue);
  CGContextMoveToPoint(a5, v14, v12 + -3.0);
  CGContextAddLineToPoint(a5, v14, v12 + 3.0);
  CGContextMoveToPoint(a5, v13, v12);
  CGContextAddLineToPoint(a5, v14, v12);
  CGContextClosePath(a5);
  CGContextDrawPath(a5, kCGPathStroke);
  *(_OWORD *)components = xmmword_1AB35B130;
  long long v29 = unk_1AB35B140;
  CGContextSetStrokeColor(a5, components);
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetTextDrawingMode(a5, kCGTextStroke);
  CGAffineTransformMakeScale(&v25, 1.0, -1.0);
  CGContextSetTextMatrix(a5, &v25);
  uint64_t v26 = *MEMORY[0x1E4FB06F8];
  id v15 = [MEMORY[0x1E4FB08E0] systemFontOfSize:8.0 weight:*MEMORY[0x1E4FB09F8]];
  CGAffineTransform v27 = v15;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];

  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  unint64_t v18 = [NSString stringWithFormat:@"%.2f", *(void *)&a3];
  CFAttributedStringRef v19 = (const __CFAttributedString *)[v17 initWithString:v18 attributes:v16];
  v20 = CTLineCreateWithAttributedString(v19);

  CGRect ImageBounds = CTLineGetImageBounds(v20, a5);
  CGContextSetTextPosition(a5, v11 + ImageBounds.size.width * -0.5, v12 + ImageBounds.size.height + 6.0);
  CTLineDraw(v20, a5);
  CFRelease(v20);
  id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
  v22 = [NSString stringWithFormat:@"%.2f", *(void *)&a4];
  CFAttributedStringRef v23 = (const __CFAttributedString *)[v21 initWithString:v22 attributes:v16];
  id v24 = CTLineCreateWithAttributedString(v23);

  CGRect v32 = CTLineGetImageBounds(v24, a5);
  CGContextSetTextPosition(a5, v14, v12 + v32.size.height + 6.0);
  CTLineDraw(v24, a5);
  CFRelease(v24);
}

- (void)drawAxisInContext:(CGContext *)a3 minXValue:(double)a4 maxXValue:(double)a5 minYValue:(double)a6 maxYValue:(double)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)components = xmmword_1AB35B130;
  long long v31 = unk_1AB35B140;
  CGContextSetStrokeColor(a3, components);
  CGContextSetLineWidth(a3, 1.0);
  CGContextSetTextDrawingMode(a3, kCGTextStroke);
  CGAffineTransformMakeScale(&v27, 1.0, -1.0);
  CGContextSetTextMatrix(a3, &v27);
  uint64_t v28 = *MEMORY[0x1E4FB06F8];
  CGFloat v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:5.0 weight:*MEMORY[0x1E4FB09F8]];
  long long v29 = v12;
  CGFloat v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];

  if (a4 < a5)
  {
    do
    {
      CGContextBeginPath(a3);
      CGFloat v14 = self->_leftMargin + self->_graphWidth * (a4 - self->_minXValue) / (self->_maxXValue - self->_minXValue);
      CGFloat v15 = self->_topMargin + self->_graphHeight;
      CGContextMoveToPoint(a3, v14, v15);
      CGContextAddLineToPoint(a3, v14, v15 + 4.0);
      CGContextClosePath(a3);
      CGContextDrawPath(a3, kCGPathStroke);
      id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
      id v17 = [NSString stringWithFormat:@"%.2f", *(void *)&a4];
      CFAttributedStringRef v18 = (const __CFAttributedString *)[v16 initWithString:v17 attributes:v13];
      CFAttributedStringRef v19 = CTLineCreateWithAttributedString(v18);

      CGRect ImageBounds = CTLineGetImageBounds(v19, a3);
      CGContextSetTextPosition(a3, v14 + ImageBounds.size.width * -0.5, v15 + ImageBounds.size.height + 6.0);
      CTLineDraw(v19, a3);
      CFRelease(v19);
      a4 = a4 + 0.25;
    }
    while (a4 <= a5);
  }
  if (a6 < a7)
  {
    do
    {
      CGContextBeginPath(a3);
      double leftMargin = self->_leftMargin;
      CGFloat v21 = self->_topMargin
          + self->_graphHeight * (1.0 - (a6 - self->_minYValue) / (self->_maxYValue - self->_minYValue));
      CGContextMoveToPoint(a3, leftMargin + -4.0, v21);
      CGContextAddLineToPoint(a3, leftMargin, v21);
      CGContextClosePath(a3);
      CGContextDrawPath(a3, kCGPathStroke);
      id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
      CFAttributedStringRef v23 = [NSString stringWithFormat:@"%.2f", *(void *)&a6];
      CFAttributedStringRef v24 = (const __CFAttributedString *)[v22 initWithString:v23 attributes:v13];
      CGAffineTransform v25 = CTLineCreateWithAttributedString(v24);

      CGRect v34 = CTLineGetImageBounds(v25, a3);
      CGContextSetTextPosition(a3, leftMargin + -6.0 - v34.size.width, v21 + v34.size.height * 0.5);
      CTLineDraw(v25, a3);
      CFRelease(v25);
      a6 = a6 + 0.25;
    }
    while (a6 <= a7);
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CurrentContext = UIGraphicsGetCurrentContext();
  v12[0] = xmmword_1AB35B110;
  v12[1] = unk_1AB35B120;
  CGContextSetFillColor(CurrentContext, (const CGFloat *)v12);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v14);
  [(_PXScoreLabGraphView *)self bounds];
  self->_graphWidth = v9 - self->_leftMargin - self->_rightMargin;
  [(_PXScoreLabGraphView *)self bounds];
  self->_graphHeight = v10 - self->_topMargin - self->_bottomMargin;
  unint64_t graphType = self->_graphType;
  if (graphType >= 2)
  {
    if (graphType == 2) {
      [(_PXScoreLabGraphView *)self drawCorrelationInContext:CurrentContext];
    }
  }
  else
  {
    [(_PXScoreLabGraphView *)self drawDistributionInContext:CurrentContext];
  }
}

- (void)loadCorrelationData
{
  self->_double minXValue = 1.79769313e308;
  self->_double maxXValue = -1.79769313e308;
  self->_double minYValue = 1.79769313e308;
  self->_double maxYValue = -1.79769313e308;
  self->_double Ex = 0.0;
  self->_Ex2 = 0.0;
  self->_double Ey = 0.0;
  self->_Ey2 = 0.0;
  self->_ExCGFloat y = 0.0;
  self->_numberOfIgnoredAssets = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43___PXScoreLabGraphView_loadCorrelationData__block_invoke;
  v14[3] = &unk_1E5DBFC30;
  v14[4] = self;
  id v5 = v3;
  id v15 = v5;
  v6 = (NSArray *)v4;
  id v16 = v6;
  [(_PXScoreLabGraphView *)self enumerateAssetsUsingBlock:v14];
  objc_storeStrong((id *)&self->_allXValues, v3);
  allYValues = self->_allYValues;
  self->_allYValues = v6;
  uint64_t v8 = v6;

  self->_double minXValue = floor(self->_minXValue * 4.0) * 0.25;
  double v9 = ceil(self->_maxXValue * 4.0) * 0.25;
  self->_double maxXValue = v9;
  double minXValue = self->_minXValue;
  if (minXValue == v9)
  {
    self->_double minXValue = minXValue + -0.1;
    self->_double maxXValue = self->_maxXValue + 0.1;
  }
  self->_double minYValue = floor(self->_minYValue * 4.0) * 0.25;
  double v11 = ceil(self->_maxYValue * 4.0) * 0.25;
  self->_double maxYValue = v11;
  double minYValue = self->_minYValue;
  if (minYValue == v11)
  {
    self->_double minYValue = minYValue + -0.1;
    self->_double maxYValue = self->_maxYValue + 0.1;
  }
  self->_baseMinXValue = self->_minXValue;
  self->_baseMaxXValue = self->_maxXValue;
  self->_baseMinYValue = self->_minYValue;
  self->_baseMaxYValue = self->_maxYValue;
  self->_double Ex = self->_Ex / (double)(unint64_t)objc_msgSend(v5, "count", 600);
  self->_Ex2 = self->_Ex2 / (double)(unint64_t)[v5 count];
  *(double *)((char *)&self->super.super.super.isa + v13) = *(double *)((char *)&self->super.super.super.isa + v13)
                                                          / (double)(unint64_t)[v5 count];
  self->_Ey2 = self->_Ey2 / (double)(unint64_t)[v5 count];
  self->_ExCGFloat y = self->_Exy / (double)(unint64_t)[v5 count];
}

- (void)loadDistributionData
{
  self->_double minXValue = 1.79769313e308;
  self->_double maxXValue = -1.79769313e308;
  self->_double Ex = 0.0;
  self->_Ex2 = 0.0;
  if (self->_graphType) {
    id v3 = &OBJC_IVAR____PXScoreLabGraphView__yScoreValueGetter;
  }
  else {
    id v3 = &OBJC_IVAR____PXScoreLabGraphView__xScoreValueGetter;
  }
  id v4 = _Block_copy(*(const void **)((char *)&self->super.super.super.isa + *v3));
  self->_numberOfIgnoredAssets = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _OWORD v12[2] = __44___PXScoreLabGraphView_loadDistributionData__block_invoke;
  v12[3] = &unk_1E5DBFC08;
  id v6 = v4;
  id v14 = v6;
  v12[4] = self;
  uint64_t v7 = (NSArray *)v5;
  uint64_t v13 = v7;
  [(_PXScoreLabGraphView *)self enumerateAssetsUsingBlock:v12];
  allXValues = self->_allXValues;
  self->_allXValues = v7;
  double v9 = v7;

  self->_double minXValue = floor(self->_minXValue * 4.0) * 0.25;
  double v10 = ceil(self->_maxXValue * 4.0) * 0.25;
  self->_double maxXValue = v10;
  double minXValue = self->_minXValue;
  if (minXValue == v10)
  {
    self->_double minXValue = minXValue + -0.1;
    self->_double maxXValue = self->_maxXValue + 0.1;
    double minXValue = self->_minXValue;
  }
  self->_baseMinXValue = minXValue;
  self->_baseMaxXValue = self->_maxXValue;
  self->_double Ex = self->_Ex / (double)[(NSArray *)v9 count];
  self->_Ex2 = self->_Ex2 / (double)[(NSArray *)v9 count];
}

- (void)reloadData
{
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34___PXScoreLabGraphView_reloadData__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)enumerateAssetsUsingBlock:(id)a3
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v6 = [v5 librarySpecificFetchOptions];

  [v6 setChunkSizeForFetch:1000];
  uint64_t v7 = *MEMORY[0x1E4F394E0];
  v34[0] = *MEMORY[0x1E4F39420];
  v34[1] = v7;
  v34[2] = *MEMORY[0x1E4F39538];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  [v6 setFetchPropertySets:v8];

  CGAffineTransform v27 = self;
  double v9 = [(_PXScoreLabGraphView *)self assetPredicate];
  [v6 setPredicate:v9];

  uint64_t v26 = v6;
  double v10 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v6];
  unint64_t v11 = [v10 count];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obunint64_t j = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v30;
    double v17 = (double)v11;
    double v18 = 0.0;
    double v19 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v22 = (void *)MEMORY[0x1AD10CB00]();
        v4[2](v4, v21);
        uint64_t v23 = v14 + i + 1;
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v18 > 1.0
          || (double)(unint64_t)v23 / v17 - v19 >= 1.0
          || (unint64_t)(v23 - v15) >= 0x64)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&v27->_delegate);
          [WeakRetained scoreLabGraphView:v27 reloadProgressed:(double)(unint64_t)v23 / v17];

          double v18 = Current;
          double v19 = (double)(unint64_t)v23 / v17;
          uint64_t v15 = v14 + i + 1;
        }
      }
      v14 += i;
      uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v13);
  }
}

- (void)pinched:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 state];
  if (v4 == 4)
  {
    [(_PXScoreLabGraphView *)self cancelGesture];
    goto LABEL_8;
  }
  if (v4 == 2)
  {
    [v12 locationInView:self];
    double v8 = v7;
    double v10 = v9;
    [v12 scale];
    -[_PXScoreLabGraphView updateGestureWithLocation:scale:](self, "updateGestureWithLocation:scale:", v8, v10, v11);
    goto LABEL_8;
  }
  BOOL v5 = v4 == 1;
  id v6 = v12;
  if (v5)
  {
    [v12 locationInView:self];
    -[_PXScoreLabGraphView startGestureAtLocation:](self, "startGestureAtLocation:");
LABEL_8:
    id v6 = v12;
  }
}

- (void)panned:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 state];
  if (v4 == 4)
  {
    [(_PXScoreLabGraphView *)self cancelGesture];
    goto LABEL_8;
  }
  if (v4 == 2)
  {
    [v7 locationInView:self];
    -[_PXScoreLabGraphView updateGestureWithLocation:scale:](self, "updateGestureWithLocation:scale:");
    goto LABEL_8;
  }
  BOOL v5 = v4 == 1;
  id v6 = v7;
  if (v5)
  {
    [v7 locationInView:self];
    -[_PXScoreLabGraphView startGestureAtLocation:](self, "startGestureAtLocation:");
LABEL_8:
    id v6 = v7;
  }
}

- (void)updateGestureWithLocation:(CGPoint)a3 scale:(double)a4
{
  double minXValueAtBeginningOfGesture = self->_minXValueAtBeginningOfGesture;
  double v5 = self->_maxXValueAtBeginningOfGesture - minXValueAtBeginningOfGesture;
  double leftMargin = self->_leftMargin;
  double graphWidth = self->_graphWidth;
  double v8 = minXValueAtBeginningOfGesture + v5 * (self->_locationAtBeginningOfGesture.x - leftMargin) / graphWidth;
  double minYValueAtBeginningOfGesture = self->_minYValueAtBeginningOfGesture;
  double v10 = self->_maxYValueAtBeginningOfGesture - minYValueAtBeginningOfGesture;
  double v11 = 1.0 - (self->_locationAtBeginningOfGesture.y - self->_topMargin) / self->_graphHeight;
  double v12 = v5 / a4;
  double v13 = self->_baseMaxXValue - self->_baseMinXValue;
  double v14 = v5 / v13;
  if (v12 > v13)
  {
    double v15 = self->_baseMaxXValue - self->_baseMinXValue;
  }
  else
  {
    double v14 = a4;
    double v15 = v12;
  }
  double v16 = v8 - (a3.x - leftMargin) * v15 / graphWidth;
  self->_double minXValue = v16;
  double baseMinXValue = self->_baseMinXValue;
  if (v16 < baseMinXValue)
  {
    self->_double minXValue = baseMinXValue;
    double v16 = baseMinXValue;
  }
  double v18 = minYValueAtBeginningOfGesture + v10 * v11;
  double v19 = v10 / v14;
  self->_double maxXValue = v15 + v16;
  double baseMaxXValue = self->_baseMaxXValue;
  if (v15 + v16 > baseMaxXValue)
  {
    self->_double maxXValue = baseMaxXValue;
    self->_double minXValue = baseMaxXValue - v15;
  }
  double v21 = v18 - v19 * (1.0 - (a3.y - self->_topMargin) / self->_graphHeight);
  self->_double minYValue = v21;
  double baseMinYValue = self->_baseMinYValue;
  if (v21 < baseMinYValue)
  {
    self->_double minYValue = baseMinYValue;
    double v21 = baseMinYValue;
  }
  double v23 = v19 + v21;
  self->_double maxYValue = v19 + v21;
  double baseMaxYValue = self->_baseMaxYValue;
  if (v23 > baseMaxYValue)
  {
    self->_double maxYValue = baseMaxYValue;
    self->_double minYValue = baseMaxYValue - v19;
  }
  [(_PXScoreLabGraphView *)self setNeedsDisplay];
}

- (void)cancelGesture
{
  self->_double minXValue = self->_minXValueAtBeginningOfGesture;
  self->_double maxXValue = self->_maxXValueAtBeginningOfGesture;
  self->_double minYValue = self->_minYValueAtBeginningOfGesture;
  self->_double maxYValue = self->_maxYValueAtBeginningOfGesture;
}

- (void)startGestureAtLocation:(CGPoint)a3
{
  self->_locationAtBeginningOfGesture = a3;
  self->_double minXValueAtBeginningOfGesture = self->_minXValue;
  self->_maxXValueAtBeginningOfGesture = self->_maxXValue;
  self->_double minYValueAtBeginningOfGesture = self->_minYValue;
  self->_maxYValueAtBeginningOfGesture = self->_maxYValue;
}

- (_PXScoreLabGraphView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_PXScoreLabGraphView;
  id v3 = -[_PXScoreLabGraphView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_double leftMargin = 20.0;
    v3->_rightMargin = 20.0;
    v3->_topMargin = 20.0;
    v3->_bottomMargin = 20.0;
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v3 action:sel_panned_];
    [(_PXScoreLabGraphView *)v4 addGestureRecognizer:v5];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:v4 action:sel_pinched_];
    [(_PXScoreLabGraphView *)v4 addGestureRecognizer:v6];
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    double v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.scoreLabGraphViewReloadQueue", v8);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v9;
  }
  return v4;
}

@end