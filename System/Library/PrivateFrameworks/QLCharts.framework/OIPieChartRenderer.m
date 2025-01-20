@interface OIPieChartRenderer
- (OIPieChartRenderer)initWithChart:(__OIChart *)a3;
- (OIPieChartRenderer)initWithChart:(__OIChart *)a3 sliceRenderer:(id)a4;
- (OIPieSliceRenderer)sliceRenderer;
- (__OIChart)chart;
- (void)dealloc;
- (void)renderThreeDimensional:(BOOL)a3 pieFromSeriesArray:(__CFArray *)a4;
- (void)setChart:(__OIChart *)a3;
- (void)setSliceRenderer:(id)a3;
@end

@implementation OIPieChartRenderer

- (OIPieChartRenderer)initWithChart:(__OIChart *)a3 sliceRenderer:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)OIPieChartRenderer;
  v7 = [(OIPieChartRenderer *)&v9 init];
  if (v7)
  {
    [(OIPieChartRenderer *)v7 setChart:OILabelRetain(a3)];
    [(OIPieChartRenderer *)v7 setSliceRenderer:v6];
  }

  return v7;
}

- (OIPieChartRenderer)initWithChart:(__OIChart *)a3
{
  v5 = [[OIPieSliceCGRenderer alloc] initWithChart:a3];
  id v6 = [(OIPieChartRenderer *)self initWithChart:a3 sliceRenderer:v5];

  return v6;
}

- (void)dealloc
{
  OIChartRelease(self->_chart);
  [(OIPieChartRenderer *)self setSliceRenderer:0];
  v3.receiver = self;
  v3.super_class = (Class)OIPieChartRenderer;
  [(OIPieChartRenderer *)&v3 dealloc];
}

- (void)renderThreeDimensional:(BOOL)a3 pieFromSeriesArray:(__CFArray *)a4
{
  BOOL v5 = a3;
  Type = (CGContext *)OIAxisGetType((uint64_t)self->_chart);
  double PlotArea = OIChartGetPlotArea((uint64_t)self->_chart);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  int v15 = OIAxisAreLabelsCentered((uint64_t)self->_chart);
  if (a4)
  {
    int v16 = v15;
    CFIndex Count = CFArrayGetCount(a4);
    if (Count >= 1)
    {
      CFIndex v18 = Count;
      CFIndex v19 = 0;
      double v20 = 0.0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a4, v19);
        CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
        if (Values)
        {
          CFNumberRef v23 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, 0);
          double valuePtr = 0.0;
          CFNumberGetValue(v23, kCFNumberCGFloatType, &valuePtr);
          double v20 = v20 + fabs(valuePtr);
        }
        ++v19;
      }
      while (v18 != v19);
      if (v20 != 0.0)
      {
        CGContextSaveGState(Type);
        double v24 = v10 + v14 * 0.5;
        if (v12 >= v14) {
          double v25 = v14;
        }
        else {
          double v25 = v12;
        }
        CGContextTranslateCTM(Type, PlotArea + v12 * 0.5, v24);
        double v51 = 0.0;
        if (v5)
        {
          CGFloat v26 = (90.0 - OIChartGetElevation((uint64_t)self->_chart)) / 90.0 * -0.8 + 1.0;
          CGContextScaleCTM(Type, 1.0, v26);
          double v51 = v14 * ((1.0 - v26) * 0.2) / v26;
        }
        if (v16)
        {
          v53.width = 0.0;
          v53.height = -4.0;
          CGContextSetShadow(Type, v53, 6.0);
        }
        double v27 = v25 * 0.9 * 0.5;
        CFIndex v28 = 0;
        CFIndex v29 = CFArrayGetCount(a4) - 1;
        double v30 = 1.57079633;
        double v49 = 1.57079633;
        double v50 = 1.57079633;
        do
        {
          if (v28 >= v18) {
            break;
          }
          v31 = CFArrayGetValueAtIndex(a4, v28);
          double Offset = OISeriesGetOffset((uint64_t)v31);
          CFArrayRef v33 = (const __CFArray *)OISeriesGetValues((uint64_t)v31);
          if (v33)
          {
            CFNumberRef v34 = (const __CFNumber *)CFArrayGetValueAtIndex(v33, 0);
            double valuePtr = 0.0;
            CFNumberGetValue(v34, kCFNumberCGFloatType, &valuePtr);
            double v35 = fabs(valuePtr);
            double valuePtr = v35;
            if (cos(v30 + v35 / v20 * -6.28318531) >= 0.0)
            {
              __double2 v37 = __sincos_stret(v30 + v35 * -3.14159265 / v20);
              [(OIPieSliceRenderer *)self->_sliceRenderer renderPieSliceFromSeries:v31 radius:v27 angle:v30 newAngle:v30 + v35 / v20 * -6.28318531 xOffset:Offset * v37.__cosval yOffset:Offset * v37.__sinval thickness:v51];
              int v36 = 0;
              ++v28;
              double v30 = v30 + v35 / v20 * -6.28318531;
            }
            else
            {
              int v36 = 8;
              double v49 = v30 + v35 / v20 * -6.28318531;
              double v50 = v30;
            }
          }
          else
          {
            int v36 = 7;
          }
        }
        while (v36 != 8);
        double v38 = -4.71238898;
        do
        {
          if (v29 < 1) {
            break;
          }
          v39 = CFArrayGetValueAtIndex(a4, v29);
          double v40 = OISeriesGetOffset((uint64_t)v39);
          CFArrayRef v41 = (const __CFArray *)OISeriesGetValues((uint64_t)v39);
          if (v41)
          {
            CFNumberRef v42 = (const __CFNumber *)CFArrayGetValueAtIndex(v41, 0);
            double valuePtr = 0.0;
            CFNumberGetValue(v42, kCFNumberCGFloatType, &valuePtr);
            double v43 = fabs(valuePtr);
            double valuePtr = v43;
            if (cos(v38 + v43 / v20 * 6.28318531) >= 0.0)
            {
              int v45 = 10;
            }
            else
            {
              __double2 v44 = __sincos_stret(v38 + v43 * 3.14159265 / v20);
              [(OIPieSliceRenderer *)self->_sliceRenderer renderPieSliceFromSeries:v39 radius:v27 angle:v38 + v43 / v20 * 6.28318531 newAngle:v38 xOffset:v40 * v44.__cosval yOffset:v40 * v44.__sinval thickness:v51];
              int v45 = 0;
              --v29;
              double v38 = v38 + v43 / v20 * 6.28318531;
            }
          }
          else
          {
            int v45 = 9;
          }
        }
        while (v45 != 10);
        if (v28 == v29 && v50 != v49)
        {
          v46 = CFArrayGetValueAtIndex(a4, v28);
          double v47 = OISeriesGetOffset((uint64_t)v46);
          __double2 v48 = __sincos_stret((v50 + v49) * 0.5);
          [(OIPieSliceRenderer *)self->_sliceRenderer renderPieSliceFromSeries:v46 radius:v27 angle:v50 newAngle:v49 xOffset:v48.__cosval * v47 yOffset:v48.__sinval * v47 thickness:v51];
        }
        CGContextRestoreGState(Type);
      }
    }
  }
}

- (OIPieSliceRenderer)sliceRenderer
{
  return (OIPieSliceRenderer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSliceRenderer:(id)a3
{
}

- (__OIChart)chart
{
  return self->_chart;
}

- (void)setChart:(__OIChart *)a3
{
  self->_chart = a3;
}

- (void).cxx_destruct
{
}

@end