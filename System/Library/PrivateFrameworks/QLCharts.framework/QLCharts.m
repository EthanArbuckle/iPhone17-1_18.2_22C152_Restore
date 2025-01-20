void *_OILabelRetain(uint64_t a1, void *a2)
{
  void *result;

  result = a2;
  ++*a2;
  return result;
}

void _OILabelRelease(uint64_t a1, void *a2)
{
}

double *OILabelCreate(const void *a1, double a2, double a3, double a4, double a5)
{
  if (!a1) {
    return 0;
  }
  CFAllocatorRef Default = CFAllocatorGetDefault();
  v11 = (double *)CFAllocatorAllocate(Default, 96, 0);
  *(void *)v11 = 1;
  *((void *)v11 + 1) = CFRetain(a1);
  v11[2] = a2;
  v11[3] = a3;
  v11[4] = a4;
  v11[5] = a5;
  v11[6] = 10.0;
  v11[7] = 0.0;
  v11[8] = 0.0;
  v11[9] = 1.0;
  *((void *)v11 + 10) = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
  *((unsigned char *)v11 + 88) = 0;
  return v11;
}

void *OILabelRetain(void *result)
{
  return result;
}

void OILabelRelease(void *a1)
{
  if (a1)
  {
    if ((*a1)-- == 1)
    {
      v3 = (const void *)a1[1];
      if (v3) {
        CFRelease(v3);
      }
      v4 = (CGColor *)a1[7];
      if (v4) {
        CGColorRelease(v4);
      }
      v5 = (CGColor *)a1[8];
      if (v5) {
        CGColorRelease(v5);
      }
      v6 = (CGColor *)a1[10];
      if (v6) {
        CGColorRelease(v6);
      }
      CFAllocatorRef Default = CFAllocatorGetDefault();
      CFAllocatorDeallocate(Default, a1);
    }
  }
}

double *OILabelCreateFromDictionary(const __CFDictionary *a1)
{
  if (!a1) {
    return 0;
  }
  Value = CFDictionaryGetValue(a1, @"kOIChartLabelKey");
  long long v17 = 0u;
  long long v18 = 0u;
  CFDictionaryRef v3 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"kOIChartTitleAreaKey");
  if (v3)
  {
    OIRectMakeWithDictionaryRepresentation(v3, (uint64_t)&v17);
    double v5 = *((double *)&v17 + 1);
    double v4 = *(double *)&v17;
    double v7 = *((double *)&v18 + 1);
    double v6 = *(double *)&v18;
  }
  else
  {
    double v7 = 0.0;
    double v6 = 0.0;
    double v5 = 0.0;
    double v4 = 0.0;
  }
  v8 = OILabelCreate(Value, v4, v5, v6, v7);
  if (v8)
  {
    uint64_t valuePtr = 0;
    CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue(a1, @"kOIChartHasShadowKey");
    if (v9)
    {
      CFNumberGetValue(v9, kCFNumberNSIntegerType, &valuePtr);
      *((unsigned char *)v8 + 88) = valuePtr != 0;
    }
    v10 = (CGColor *)CFDictionaryGetValue(a1, @"kOIChartStrokeColorKey");
    if (v10) {
      OILabelSetStrokeColor((uint64_t)v8, v10);
    }
    uint64_t v15 = 0;
    CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(a1, @"kOIChartStrokeWidthKey");
    if (v11)
    {
      CFNumberGetValue(v11, kCFNumberCGFloatType, &v15);
      *((void *)v8 + 9) = v15;
    }
    v12 = (CGColor *)CFDictionaryGetValue(a1, @"kOIChartFillColorKey");
    if (v12) {
      OILabelSetFillColor((uint64_t)v8, v12);
    }
    v13 = (CGColor *)CFDictionaryGetValue(a1, @"kOIChartTextColorKey");
    if (v13) {
      OILabelSetTextColor((uint64_t)v8, v13);
    }
  }
  return v8;
}

uint64_t OILabelSetHasShadow(uint64_t result, char a2)
{
  *(unsigned char *)(result + 88) = a2;
  return result;
}

CGColor *OILabelSetStrokeColor(uint64_t a1, CGColorRef color)
{
  result = *(CGColor **)(a1 + 64);
  if (result != color)
  {
    if (result) {
      CGColorRelease(result);
    }
    result = CGColorRetain(color);
    *(void *)(a1 + 64) = result;
  }
  return result;
}

uint64_t OILabelSetStrokeWidth(uint64_t result, double a2)
{
  *(double *)(result + 72) = a2;
  return result;
}

CGColor *OILabelSetFillColor(uint64_t a1, CGColorRef color)
{
  result = *(CGColor **)(a1 + 56);
  if (result != color)
  {
    if (result) {
      CGColorRelease(result);
    }
    result = CGColorRetain(color);
    *(void *)(a1 + 56) = result;
  }
  return result;
}

CGColor *OILabelSetTextColor(uint64_t a1, CGColorRef color)
{
  result = *(CGColor **)(a1 + 80);
  if (result != color)
  {
    if (result) {
      CGColorRelease(result);
    }
    result = CGColorRetain(color);
    *(void *)(a1 + 80) = result;
  }
  return result;
}

CFTypeRef OILabelSetString(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 8);
  if (result != cf)
  {
    if (result) {
      CFRelease(result);
    }
    CFTypeRef result = CFRetain(cf);
    *(void *)(a1 + 8) = result;
  }
  return result;
}

uint64_t OILabelGetString(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

double *OILabelSetFrame(double *result, double a2, double a3, double a4, double a5)
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

double OILabelGetFrame(uint64_t a1)
{
  return *(double *)(a1 + 16);
}

uint64_t OILabelSetFontSize(uint64_t result, double a2)
{
  *(double *)(result + 48) = a2;
  return result;
}

double OILabelGetFontSize(uint64_t a1)
{
  return *(double *)(a1 + 48);
}

uint64_t OILabelGetFillColor(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t OILabelGetStrokeColor(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

double OILabelGetStrokeWidth(uint64_t a1)
{
  return *(double *)(a1 + 72);
}

uint64_t OILabelGetTextColor(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

uint64_t OILabelHasShadow(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 88);
}

uint64_t OILabelSetAlignment(uint64_t result, int a2)
{
  *(_DWORD *)(result + 92) = a2;
  return result;
}

uint64_t OILabelGetAlignment(uint64_t a1)
{
  return *(unsigned int *)(a1 + 92);
}

void OIChartSetupRendererMapping(uint64_t a1)
{
  CFAllocatorRef String = (const __CFAllocator *)OILabelGetString(a1);
  CFDictionaryRef v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  Mutable = CFDictionaryCreateMutable(String, 0, MEMORY[0x263EFFF88], &DummyValueCallbacks);
  double v5 = CFDictionaryCreateMutable(String, 0, v3, &DummyValueCallbacks);
  double v6 = CFDictionaryCreateMutable(String, 0, v3, &DummyValueCallbacks);
  double v7 = CFDictionaryCreateMutable(String, 0, v3, &DummyValueCallbacks);
  CFDictionarySetValue(Mutable, @"kOIChartColumnType", OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChartColumnType", OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChartColumnType", OIRenderColumnsInChart);
  CFDictionarySetValue(v7, @"kOIChartColumnType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChartStackedColumnType", OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChartStackedColumnType", OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChartStackedColumnType", OIRenderStackedColumnsInChart);
  CFDictionarySetValue(v7, @"kOIChartStackedColumnType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChartPercentStackedColumnType", OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChartPercentStackedColumnType", OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChartPercentStackedColumnType", OIRenderPercentStackedColumnsInChart);
  CFDictionarySetValue(v7, @"kOIChartPercentStackedColumnType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChartBarType", OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChartBarType", OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChartBarType", OIRenderBarsInChart);
  CFDictionarySetValue(v7, @"kOIChartBarType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChartStackedBarType", OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChartStackedBarType", OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChartStackedBarType", OIRenderStackedBarsInChart);
  CFDictionarySetValue(v7, @"kOIChartStackedBarType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChartPercentStackedBarType", OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChartPercentStackedBarType", OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChartPercentStackedBarType", OIRenderPercentStackedBarsInChart);
  CFDictionarySetValue(v7, @"kOIChartStackedBarType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChartLineType", OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChartLineType", OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChartLineType", OIRenderLinesInChart);
  CFDictionarySetValue(v7, @"kOIChartLineType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChartStackedLineType", OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChartStackedLineType", OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChartStackedLineType", OIRenderStackedLinesInChart);
  CFDictionarySetValue(v7, @"kOIChartStackedLineType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChartPercentStackedLineType", OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChartPercentStackedLineType", OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChartPercentStackedLineType", OIRenderPercentStackedLinesInChart);
  CFDictionarySetValue(v7, @"kOIChartPercentStackedLineType", OIRenderLegendInChart);
  CFDictionarySetValue(v6, @"kOIChartPieType", OIRenderPieInChart);
  CFDictionarySetValue(v7, @"kOIChartPieType", OIRenderLegendInChart);
  CFDictionarySetValue(v6, @"kOIChart3DPieType", OIRender3DPieInChart);
  CFDictionarySetValue(v7, @"kOIChart3DPieType", OIRenderLegendInChart);
  CFDictionarySetValue(v6, @"kOIChartDoughnutType", OIRenderDoughnutInChart);
  CFDictionarySetValue(v7, @"kOIChartDoughnutType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChartXYType", OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChartXYType", OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChartXYType", OIRenderXYInChart);
  CFDictionarySetValue(v7, @"kOIChartXYType", OIRenderXYLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChartRadarType", OIRenderRadarAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChartRadarType", OIRenderRadarAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChartRadarType", OIRenderRadarInChart);
  CFDictionarySetValue(v7, @"kOIChartRadarType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChartBubbleType", OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChartBubbleType", OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChartBubbleType", OIRenderBubblesInChart);
  CFDictionarySetValue(v7, @"kOIChartBubbleType", OIRenderBubbleLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChartStockType", OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChartStockType", OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChartStockType", OIRenderStocksInChart);
  CFDictionarySetValue(Mutable, @"kOIChart3DColumnType", OIRender3DOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChart3DColumnType", OIRender3DOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChart3DColumnType", OIRender3DColumnsInChart);
  CFDictionarySetValue(v7, @"kOIChart3DColumnType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChart3DLayeredColumnType", OIRender3DLayeredOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChart3DLayeredColumnType", OIRender3DLayeredOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChart3DLayeredColumnType", OIRender3DLayeredColumnsInChart);
  CFDictionarySetValue(v7, @"kOIChart3DLayeredColumnType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChart3DStackedColumnType", OIRender3DOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChart3DStackedColumnType", OIRender3DOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChart3DStackedColumnType", OIRender3DStackedColumnsInChart);
  CFDictionarySetValue(v7, @"kOIChart3DStackedColumnType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChart3DPercentStackedColumnType", OIRender3DOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChart3DPercentStackedColumnType", OIRender3DOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChart3DPercentStackedColumnType", OIRender3DPercentStackedColumnsInChart);
  CFDictionarySetValue(v7, @"kOIChart3DPercentStackedColumnType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChart3DBarType", OIRender3DFlippedOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChart3DBarType", OIRender3DFlippedOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChart3DBarType", OIRender3DBarsInChart);
  CFDictionarySetValue(v7, @"kOIChart3DBarType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChart3DStackedBarType", OIRender3DFlippedOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChart3DStackedBarType", OIRender3DFlippedOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChart3DStackedBarType", OIRender3DStackedBarsInChart);
  CFDictionarySetValue(v7, @"kOIChart3DStackedBarType", OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, @"kOIChart3DPercentStackedBarType", OIRender3DFlippedOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, @"kOIChart3DPercentStackedBarType", OIRender3DFlippedOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, @"kOIChart3DPercentStackedBarType", OIRender3DPercentStackedBarsInChart);
  CFDictionarySetValue(v7, @"kOIChart3DPercentStackedBarType", OIRenderLegendInChart);
  OIChartSetBackgroundAxisRendererMapping(a1, Mutable);
  OIChartSetForegroundAxisRendererMapping(a1, v5);
  OIChartSetChartRendererMapping(a1, v6);
  OIChartSetLegendRendererMapping(a1, v7);
  CFRelease(Mutable);
  CFRelease(v5);
  CFRelease(v6);

  CFRelease(v7);
}

void _OIRenderLinesInChart(uint64_t a1, CFArrayRef theArray)
{
  if (theArray)
  {
    CFArrayRef v2 = theArray;
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count)
    {
      Type = (CGContext *)OIAxisGetType(a1);
      double PlotArea = OIChartGetPlotArea(a1);
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      int v12 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      double v65 = v7;
      v68.origin.x = PlotArea;
      v68.origin.y = v7;
      v68.size.width = v9;
      v68.size.height = v11;
      CGContextClipToRect(Type, v68);
      if (v12)
      {
        v67.width = 2.0;
        v67.height = -2.0;
        CGContextSetShadow(Type, v67, 3.0);
      }
      v61 = OILabelCollectionCreate();
      v63 = OIErrorBarRendererCreate(1);
      if (Count >= 1)
      {
        CFIndex v13 = 0;
        CGContextRef c = Type;
        CFArrayRef v56 = v2;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v2, v13);
          uint64_t TextColor = OILabelGetTextColor((uint64_t)ValueAtIndex);
          StrokeColor = (CGColor *)OILabelGetStrokeColor((uint64_t)ValueAtIndex);
          CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
          uint64_t Labels = OIAxisGetLabels((uint64_t)ValueAtIndex);
          uint64_t String = OILabelGetString((uint64_t)ValueAtIndex);
          uint64_t v19 = OIAxisGetType((uint64_t)ValueAtIndex);
          int v20 = OIAxisAreLabelsCentered(String);
          double Scale = OIAxisGetScale(String);
          double v64 = OIAxisGetScale(v19);
          double v22 = Scale * 0.5;
          double v23 = floor(Scale * 0.5);
          double v24 = v20 ? v23 : 0.0;
          Mutable = CGPathCreateMutable();
          CFIndex v59 = v13;
          if (Labels)
          {
            v26 = CGPathCreateMutable();
            double MarkerWidth = OISeriesGetMarkerWidth((uint64_t)ValueAtIndex);
          }
          else
          {
            v26 = 0;
            double MarkerWidth = 0.0;
          }
          CFIndex v28 = CFArrayGetCount(Values);
          if (v28 >= 1) {
            break;
          }
          CFIndex v47 = -1;
LABEL_29:
          OISeriesSetupStrokeAndFillForContext((uint64_t)ValueAtIndex, Type);
          if (TextColor)
          {
            MutableCopy = CGPathCreateMutableCopy(Mutable);
            double BaseValueAtIndex = OISeriesGetBaseValueAtIndex((uint64_t)ValueAtIndex, v47);
            double v50 = PlotArea + OIAxisConvertValueToLocal(String, BaseValueAtIndex);
            double v51 = OIAxisConvertValueToLocal(v19, 0.0);
            CGPathAddLineToPoint(MutableCopy, 0, floor(v24 + v50) + 0.5, floor(v65 + v51) + 0.5);
            double v52 = PlotArea + OIAxisConvertValueToLocal(String, 0.0);
            double v53 = OIAxisConvertValueToLocal(v19, 0.0);
            CGPathAddLineToPoint(MutableCopy, 0, floor(v24 + v52) + 0.5, floor(v65 + v53) + 0.5);
            CGContextAddPath(Type, MutableCopy);
            CGContextFillPath(Type);
            CGPathRelease(MutableCopy);
          }
          if (StrokeColor)
          {
            CGContextAddPath(Type, Mutable);
            CGContextSetStrokeColorWithColor(Type, StrokeColor);
            CGContextStrokePath(Type);
          }
          CFArrayRef v2 = v56;
          if (Labels)
          {
            MarkerColor = (CGColor *)OISeriesGetMarkerColor((uint64_t)ValueAtIndex);
            CGContextSetFillColorWithColor(Type, MarkerColor);
            CGContextAddPath(Type, v26);
            CGContextFillPath(Type);
          }
          if (v26) {
            CGPathRelease(v26);
          }
          if (Mutable) {
            CGPathRelease(Mutable);
          }
          CFIndex v13 = v59 + 1;
          if (v59 + 1 == Count) {
            goto LABEL_40;
          }
        }
        CFIndex v29 = v28;
        CFIndex v30 = 0;
        double v31 = MarkerWidth * 0.5;
        double v32 = ceil(MarkerWidth);
        double v33 = Scale / 3.0;
        double v60 = v22 * 0.5;
        double v62 = Scale / 3.0 * 0.5;
        double v34 = ceil(v22);
        double v35 = ceil(v33);
        while (1)
        {
          double v36 = OISeriesGetBaseValueAtIndex((uint64_t)ValueAtIndex, v30);
          valuePtr[0] = 0.0;
          CFNumberRef v37 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, v30);
          CFNumberGetValue(v37, kCFNumberCGFloatType, valuePtr);
          double v38 = PlotArea + OIAxisConvertValueToLocal(String, v36);
          double v39 = v65 + OIAxisConvertValueToLocal(v19, valuePtr[0]);
          double v40 = v24 + v38;
          double v41 = floor(v40) + 0.5;
          double v42 = floor(v39) + 0.5;
          if (!v30) {
            break;
          }
          CGPathAddLineToPoint(Mutable, 0, v41, v42);
          if (Labels) {
            goto LABEL_17;
          }
LABEL_18:
          if (OISeriesGetShowValues((uint64_t)ValueAtIndex))
          {
            double v43 = v39;
            double v44 = v40;
            if (TextColor)
            {
              double v45 = v65 + OIAxisConvertValueToLocal(v19, 0.0);
              double v44 = v40 - v60;
              double v43 = (v39 + v45) * 0.5;
            }
            OILabelCollectionAddNumber((uint64_t)v61, 0, valuePtr[0], floor(v44) + 0.5, floor(v43 - v62) + 0.5, v34, v35);
          }
          uint64_t PlotFillColor = OIChartGetPlotFillColor((uint64_t)ValueAtIndex);
          if (PlotFillColor) {
            OIErrorBarRendererAddPoint((uint64_t)v63, PlotFillColor, v40, v39, valuePtr[0], v64);
          }
          if (v29 == ++v30)
          {
            CFIndex v47 = v30 - 1;
            Type = c;
            goto LABEL_29;
          }
        }
        CGPathMoveToPoint(Mutable, 0, v41, v42);
        if (!Labels) {
          goto LABEL_18;
        }
LABEL_17:
        v69.origin.x = floor(v40 - v31) + 0.5;
        v69.origin.y = floor(v39 - v31) + 0.5;
        v69.size.width = v32;
        v69.size.height = v32;
        CGPathAddRect(v26, 0, v69);
        goto LABEL_18;
      }
LABEL_40:
      OIErrorBarRendererRenderInContext((uint64_t)v63, Type);
      OIErrorBarRendererRelease(v63);
      OILabelCollectionRenderInContext((uint64_t)v61, Type);
      OILabelCollectionRelease(v61);
      CGContextRestoreGState(Type);
    }
  }
}

void OIRenderStackedLinesInChart(uint64_t a1, const __CFArray *a2)
{
}

void _OIRenderStackedLinesInChart(uint64_t a1, CFArrayRef theArray, uint64_t a3)
{
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    CFIndex idx = Count - 1;
    if (Count >= 1)
    {
      size_t v6 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      double PlotArea = OIChartGetPlotArea(a1);
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      int v80 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      double v87 = PlotArea;
      v95.origin.x = PlotArea;
      double v91 = v10;
      v95.origin.y = v10;
      v95.size.width = v12;
      v95.size.height = v14;
      CGContextClipToRect(Type, v95);
      CGContextBeginPath(Type);
      v85 = OILabelCollectionCreate();
      v84 = OIErrorBarRendererCreate(1);
      uint64_t v15 = malloc_type_calloc(v6, 8uLL, 0x6004044C4A2DFuLL);
      v92 = malloc_type_calloc(v6, 8uLL, 0x6004044C4A2DFuLL);
      CFIndex v16 = 0;
      uint64_t v17 = 0;
      do
      {
        v15[v16] = CGPathCreateMutable();
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v16);
        uint64_t Labels = OIAxisGetLabels((uint64_t)ValueAtIndex);
        CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
        CFIndex v21 = CFArrayGetCount(Values);
        if (v21 > v17) {
          uint64_t v17 = v21;
        }
        if (Labels) {
          CGMutablePathRef Mutable = CGPathCreateMutable();
        }
        else {
          CGMutablePathRef Mutable = 0;
        }
        v92[v16++] = Mutable;
      }
      while (v6 != v16);
      CGContextRef c = Type;
      uint64_t v82 = v17;
      v88 = v15;
      if (v17 >= 1)
      {
        CFIndex v23 = 0;
        do
        {
          double v24 = 1.0;
          if (a3 == 1)
          {
            CFIndex v25 = 0;
            double v24 = 0.0;
            do
            {
              v26 = CFArrayGetValueAtIndex(theArray, v25);
              CFArrayRef v27 = (const __CFArray *)OISeriesGetValues((uint64_t)v26);
              if (CFArrayGetCount(v27) > v23)
              {
                valuePtr[0] = 0.0;
                CFNumberRef v28 = (const __CFNumber *)CFArrayGetValueAtIndex(v27, v23);
                CFNumberGetValue(v28, kCFNumberCGFloatType, valuePtr);
                double v24 = v24 + fabs(valuePtr[0]);
              }
              ++v25;
            }
            while (v6 != v25);
          }
          CFIndex v29 = 0;
          double v86 = v24;
          double v30 = 0.0;
          do
          {
            double v31 = CFArrayGetValueAtIndex(theArray, v29);
            uint64_t TextColor = OILabelGetTextColor((uint64_t)v31);
            CFArrayRef v33 = (const __CFArray *)OISeriesGetValues((uint64_t)v31);
            uint64_t String = OILabelGetString((uint64_t)v31);
            uint64_t v35 = OIAxisGetType((uint64_t)v31);
            int v36 = OIAxisAreLabelsCentered(String);
            double Scale = OIAxisGetScale(String);
            double v38 = OIAxisGetScale(v35);
            if (CFArrayGetCount(v33) > v23)
            {
              double v39 = Scale * 0.5;
              double v40 = floor(Scale * 0.5);
              if (v36) {
                double v41 = v40;
              }
              else {
                double v41 = 0.0;
              }
              valuePtr[0] = 0.0;
              CFNumberRef v42 = (const __CFNumber *)CFArrayGetValueAtIndex(v33, v23);
              CFNumberGetValue(v42, kCFNumberCGFloatType, valuePtr);
              double v43 = valuePtr[0] / v24;
              double v90 = OIAxisConvertValueToLocal(v35, v30);
              double v30 = v30 + v43;
              double v44 = v87 + OIAxisConvertValueToLocal(String, (double)v23);
              double v45 = OIAxisConvertValueToLocal(v35, v30);
              v46 = (CGPath *)v88[v29];
              double v47 = v91 + v45;
              double v48 = v41 + v44;
              double v49 = floor(v48) + 0.5;
              double v50 = floor(v47) + 0.5;
              if (v23) {
                CGPathAddLineToPoint(v46, 0, v49, v50);
              }
              else {
                CGPathMoveToPoint(v46, 0, v49, v50);
              }
              if (v92[v29])
              {
                double MarkerWidth = OISeriesGetMarkerWidth((uint64_t)v31);
                if (OIAxisGetLabels((uint64_t)v31) == 1)
                {
                  v96.origin.x = floor(v48 - MarkerWidth * 0.5) + 0.5;
                  v96.origin.y = floor(v47 - MarkerWidth * 0.5) + 0.5;
                  v96.size.width = ceil(MarkerWidth);
                  v96.size.height = v96.size.width;
                  CGPathAddRect((CGMutablePathRef)v92[v29], 0, v96);
                }
              }
              if (OISeriesGetShowValues((uint64_t)v31))
              {
                double v52 = Scale / 3.0;
                if (TextColor)
                {
                  double v53 = 0.5;
                  double v54 = v48 - v39 * 0.5;
                  double v55 = (v91 + v90 + v47) * 0.5 - v52 * 0.5;
                }
                else
                {
                  if (a3 == 1 && idx == v29) {
                    double v55 = v47 - v52;
                  }
                  else {
                    double v55 = v47 + v52 * -0.5;
                  }
                  double v54 = v48;
                  double v53 = 0.5;
                }
                OILabelCollectionAddNumber((uint64_t)v85, 0, valuePtr[0], floor(v54) + v53, floor(v55) + v53, ceil(v39), ceil(v52));
              }
              if (!a3)
              {
                uint64_t PlotFillColor = OIChartGetPlotFillColor((uint64_t)v31);
                if (PlotFillColor) {
                  OIErrorBarRendererAddPoint((uint64_t)v84, PlotFillColor, v48, v47, v43, v38);
                }
              }
              double v24 = v86;
            }
            ++v29;
          }
          while (v6 != v29);
          ++v23;
        }
        while (v23 != v82);
      }
      if (v80)
      {
        v94.width = 2.0;
        v94.height = -2.0;
        CGContextSetShadow(c, v94, 3.0);
      }
      CFIndex v57 = idx;
      do
      {
        v58 = CFArrayGetValueAtIndex(theArray, v57);
        CFArrayRef v59 = (const __CFArray *)OISeriesGetValues((uint64_t)v58);
        uint64_t v60 = OILabelGetTextColor((uint64_t)v58);
        uint64_t StrokeColor = OILabelGetStrokeColor((uint64_t)v58);
        uint64_t v62 = OILabelGetString((uint64_t)v58);
        uint64_t v63 = OIAxisGetType((uint64_t)v58);
        int v64 = OIAxisAreLabelsCentered(v62);
        double v65 = OIAxisGetScale(v62);
        OISeriesSetupStrokeAndFillForContext((uint64_t)v58, c);
        if (v60)
        {
          double v66 = floor(v65 * 0.5);
          if (v64) {
            double v67 = v66;
          }
          else {
            double v67 = 0.0;
          }
          CFIndex v68 = v57;
          MutableCopy = CGPathCreateMutableCopy((CGPathRef)v88[v57]);
          CFIndex v70 = CFArrayGetCount(v59);
          double v71 = v87 + OIAxisConvertValueToLocal(v62, (double)(v70 - 1));
          double v72 = OIAxisConvertValueToLocal(v63, 0.0);
          CGPathAddLineToPoint(MutableCopy, 0, floor(v67 + v71) + 0.5, floor(v91 + v72) + 0.5);
          double v73 = v87 + OIAxisConvertValueToLocal(v62, 0.0);
          double v74 = OIAxisConvertValueToLocal(v63, 0.0);
          CGPathAddLineToPoint(MutableCopy, 0, floor(v67 + v73) + 0.5, floor(v91 + v74) + 0.5);
          CGContextAddPath(c, MutableCopy);
          CGContextFillPath(c);
          v75 = MutableCopy;
          CFIndex v57 = v68;
          CGPathRelease(v75);
        }
        if (StrokeColor)
        {
          CGContextAddPath(c, (CGPathRef)v88[v57]);
          CGContextStrokePath(c);
        }
        v76 = (const CGPath *)v88[v57];
        if (v76) {
          CGPathRelease(v76);
        }
        if (v92[v57])
        {
          MarkerColor = (CGColor *)OISeriesGetMarkerColor((uint64_t)v58);
          CGContextSetFillColorWithColor(c, MarkerColor);
          CGContextAddPath(c, (CGPathRef)v92[v57]);
          CGContextFillPath(c);
          v78 = (const CGPath *)v92[v57];
          if (v78) {
            CGPathRelease(v78);
          }
        }
        uint64_t v79 = v57-- + 1;
      }
      while (v79 > 1);
      OIErrorBarRendererRenderInContext((uint64_t)v84, c);
      OIErrorBarRendererRelease(v84);
      OILabelCollectionRenderInContext((uint64_t)v85, c);
      OILabelCollectionRelease(v85);
      free(v88);
      free(v92);
      CGContextRestoreGState(c);
    }
  }
}

void OIRenderPercentStackedLinesInChart(uint64_t a1, const __CFArray *a2)
{
}

void OIRenderOrthoAxisBackgroundInChart(uint64_t a1)
{
  Type = (CGContext *)OIAxisGetType(a1);
  int v3 = OIAxisAreLabelsCentered(a1);
  CGContextSaveGState(Type);
  _OIChartOrthoBackgroundBackground(a1);
  CGContextBeginPath(Type);
  if (v3)
  {
    v9.width = 0.0;
    v9.height = 0.0;
    CGContextSetShadow(Type, v9, 0.0);
  }
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  if (Axis)
  {
    uint64_t v5 = (uint64_t)Axis;
    if (OIAxisGetDrawMajorGridlines((uint64_t)Axis)) {
      _OIAxisRenderVerticallUnitLines(a1, v5, 0.0, 0.0);
    }
  }
  size_t v6 = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    if (OIAxisGetDrawMajorGridlines((uint64_t)v6)) {
      _OIAxisRenderHorizontalUnitLines(a1, v7, 0.0, 0.0);
    }
  }

  CGContextRestoreGState(Type);
}

void _OIChartOrthoBackgroundBackground(uint64_t a1)
{
  Type = (CGContext *)OIAxisGetType(a1);
  double PlotArea = OIChartGetPlotArea(a1);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  uint64_t PlotFillColor = (CGColor *)OIChartGetPlotFillColor(a1);
  uint64_t StrokeColor = (CGColor *)OIAxisGetStrokeColor(a1);
  double PlotStrokeWidth = OIChartGetPlotStrokeWidth(a1);
  if (PlotFillColor)
  {
    CGContextSetFillColorWithColor(Type, PlotFillColor);
    v18.origin.x = floor(PlotArea) + 0.5;
    v18.origin.y = floor(v5) + 0.5;
    v18.size.width = ceil(v7);
    v18.size.height = ceil(v9);
    CGContextFillRect(Type, v18);
  }
  if (StrokeColor && PlotStrokeWidth > 0.0)
  {
    CGContextSetLineWidth(Type, PlotStrokeWidth);
    CGContextSetStrokeColorWithColor(Type, StrokeColor);
    double v13 = floor(PlotArea) + 0.5;
    double v14 = floor(v5) + 0.5;
    double v15 = ceil(v7);
    double v16 = ceil(v9);
    CGContextStrokeRect(Type, *(CGRect *)&v13);
  }
}

void _OIAxisRenderVerticallUnitLines(uint64_t a1, uint64_t a2, double a3, double a4)
{
  Type = (CGContext *)OIAxisGetType(a1);
  double PlotArea = OIChartGetPlotArea(a1);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if (OIAxisAreLabelsCentered(a1))
  {
    v37.width = 0.0;
    v37.height = 0.0;
    CGContextSetShadow(Type, v37, 0.0);
  }
  uint64_t StrokeColor = (CGColor *)OIAxisGetStrokeColor(a2);
  if (StrokeColor)
  {
    double v15 = StrokeColor;
    CGFloat Alpha = CGColorGetAlpha(StrokeColor);
    CopyWithCGFloat Alpha = CGColorCreateCopyWithAlpha(v15, Alpha * 0.25);
    CGContextSetStrokeColorWithColor(Type, CopyWithAlpha);
    CGColorRelease(CopyWithAlpha);
  }
  else
  {
    CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 0.5);
  }
  double StrokeWidth = OIAxisGetStrokeWidth(a2);
  CGContextSetLineWidth(Type, StrokeWidth);
  double MinValue = OIAxisGetMinValue(a2);
  double FontSize = OILabelGetFontSize(a2);
  double Unit = OIAxisGetUnit(a2);
  double v22 = MinValue / Unit;
  double v23 = FontSize / Unit + 1.0;
  double v24 = (double)(uint64_t)v22;
  if (v23 > v24)
  {
    double v25 = v13;
    double v26 = PlotArea + v11;
    BOOL v27 = a4 == 0.0 && a3 == 0.0;
    double v28 = floor(v9) + 0.5;
    double v33 = floor(a4 + v9) + 0.5;
    double v29 = floor(v9 + v25) + 0.5;
    uint64_t v30 = (uint64_t)v22 + 1;
    do
    {
      double v31 = PlotArea + OIAxisConvertValueToLocal(a2, Unit * v24);
      if (v31 > v26) {
        break;
      }
      double v32 = floor(v31) + 0.5;
      CGContextMoveToPoint(Type, v32, v28);
      if (!v27)
      {
        double v32 = floor(a3 + v31) + 0.5;
        CGContextAddLineToPoint(Type, v32, v33);
      }
      CGContextAddLineToPoint(Type, v32, v29);
      double v24 = (double)v30++;
    }
    while (v23 > v24);
  }

  CGContextStrokePath(Type);
}

void _OIAxisRenderHorizontalUnitLines(uint64_t a1, uint64_t a2, double a3, double a4)
{
  Type = (CGContext *)OIAxisGetType(a1);
  double PlotArea = OIChartGetPlotArea(a1);
  double v35 = v9;
  double v11 = v10;
  double v13 = v12;
  if (OIAxisAreLabelsCentered(a1))
  {
    v37.width = 0.0;
    v37.height = 0.0;
    CGContextSetShadow(Type, v37, 0.0);
  }
  uint64_t StrokeColor = (CGColor *)OIAxisGetStrokeColor(a2);
  if (StrokeColor)
  {
    double v15 = StrokeColor;
    CGFloat Alpha = CGColorGetAlpha(StrokeColor);
    CopyWithCGFloat Alpha = CGColorCreateCopyWithAlpha(v15, Alpha * 0.25);
    CGContextSetStrokeColorWithColor(Type, CopyWithAlpha);
    CGColorRelease(CopyWithAlpha);
  }
  else
  {
    CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 0.5);
  }
  double StrokeWidth = OIAxisGetStrokeWidth(a2);
  CGContextSetLineWidth(Type, StrokeWidth);
  double MinValue = OIAxisGetMinValue(a2);
  double FontSize = OILabelGetFontSize(a2);
  double Unit = OIAxisGetUnit(a2);
  double v22 = MinValue / Unit;
  double v23 = FontSize / Unit + 1.0;
  double v24 = (double)(uint64_t)v22;
  if (v23 > v24)
  {
    double v25 = v11;
    double v26 = v35 + v13;
    BOOL v27 = a4 == 0.0 && a3 == 0.0;
    double v28 = floor(PlotArea) + 0.5;
    double x = floor(a3 + PlotArea) + 0.5;
    double v29 = floor(PlotArea + v25) + 0.5;
    uint64_t v30 = (uint64_t)v22 + 1;
    do
    {
      double v31 = v35 + OIAxisConvertValueToLocal(a2, Unit * v24);
      if (v31 > v26) {
        break;
      }
      double v32 = floor(v31) + 0.5;
      CGContextMoveToPoint(Type, v28, v32);
      if (!v27)
      {
        double v32 = floor(a4 + v31) + 0.5;
        CGContextAddLineToPoint(Type, x, v32);
      }
      CGContextAddLineToPoint(Type, v29, v32);
      double v24 = (double)v30++;
    }
    while (v23 > v24);
  }

  CGContextStrokePath(Type);
}

void OIRenderOrthoAxisForegroundInChart(uint64_t a1)
{
  Type = (CGContext *)OIAxisGetType(a1);
  CGContextSaveGState(Type);
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  if (Axis)
  {
    double v4 = Axis;
    if (OIAxisGetType((uint64_t)Axis))
    {
      uint64_t v5 = OIAxisGetType((uint64_t)v4);
      double v6 = OIChartGetAxis(a1, @"kOIChartAxisYKey");
      if (v5 == 2) {
        _OIAxisRenderHorizontalDates(a1, v4, (uint64_t)v6, 0, 0.0);
      }
      else {
        _OIAxisRenderHorizontalUnits(a1, (uint64_t)v4, 0.0, v7, 0);
      }
    }
    else
    {
      double v8 = OIChartGetAxis(a1, @"kOIChartAxisYKey");
      _OIAxisRenderHorizontalLabels(a1, v4, (uint64_t)v8, 0, 0.0);
    }
  }
  double v9 = OIChartGetAxis(a1, @"kOIChartAxisSecondaryXKey");
  if (v9)
  {
    double v10 = v9;
    if (OIAxisGetType((uint64_t)v9))
    {
      uint64_t v11 = OIAxisGetType((uint64_t)v10);
      double v12 = OIChartGetAxis(a1, @"kOIChartAxisSecondaryYKey");
      if (v11 == 2) {
        _OIAxisRenderHorizontalDates(a1, v10, (uint64_t)v12, 1, 0.0);
      }
      else {
        _OIAxisRenderHorizontalUnits(a1, (uint64_t)v10, 0.0, v13, 1);
      }
    }
    else
    {
      double v14 = OIChartGetAxis(a1, @"kOIChartAxisSecondaryYKey");
      _OIAxisRenderHorizontalLabels(a1, v10, (uint64_t)v14, 1, 0.0);
    }
  }
  double v15 = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  if (v15)
  {
    double v16 = v15;
    if (OIAxisGetType((uint64_t)v15))
    {
      uint64_t v17 = OIAxisGetType((uint64_t)v16);
      CGRect v18 = OIChartGetAxis(a1, @"kOIChartAxisXKey");
      if (v17 == 2) {
        _OIAxisRenderVerticalDates(a1, v16, (uint64_t)v18, 0, 0.0, 0.0);
      }
      else {
        _OIAxisRenderVerticalUnits(a1, (uint64_t)v16, 0.0, 0.0, v19, 0);
      }
    }
    else
    {
      int v20 = OIChartGetAxis(a1, @"kOIChartAxisXKey");
      _OIAxisRenderVerticalLabels(a1, (uint64_t)v16, (uint64_t)v20, 0, 0.0, 0.0);
    }
  }
  CFIndex v21 = OIChartGetAxis(a1, @"kOIChartAxisSecondaryYKey");
  if (v21)
  {
    double v22 = v21;
    if (OIAxisGetType((uint64_t)v21))
    {
      uint64_t v23 = OIAxisGetType((uint64_t)v22);
      double v24 = OIChartGetAxis(a1, @"kOIChartAxisSecondaryXKey");
      if (v23 == 2) {
        _OIAxisRenderVerticalDates(a1, v22, (uint64_t)v24, 1, 0.0, 0.0);
      }
      else {
        _OIAxisRenderVerticalUnits(a1, (uint64_t)v22, 0.0, 0.0, v25, 1);
      }
    }
    else
    {
      double v26 = OIChartGetAxis(a1, @"kOIChartAxisSecondaryXKey");
      _OIAxisRenderVerticalLabels(a1, (uint64_t)v22, (uint64_t)v26, 1, 0.0, 0.0);
    }
  }

  CGContextRestoreGState(Type);
}

void _OIAxisRenderHorizontalLabels(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  if ((OIAxisIsHidden((uint64_t)a2) & 1) == 0)
  {
    Type = (CGContext *)OIAxisGetType(a1);
    double PlotArea = OIChartGetPlotArea(a1);
    double v13 = v12;
    double v59 = v14;
    double v16 = v15;
    if (OIAxisAreLabelsCentered(a1))
    {
      v63.width = 0.0;
      v63.height = 0.0;
      CGContextSetShadow(Type, v63, 0.0);
    }
    if (a3 && OIAxisGetMinValue(a3) < 0.0 && OILabelGetFontSize(a3) > 0.0)
    {
      double v58 = v13 + OIAxisConvertValueToLocal(a3, 0.0);
      int v17 = 1;
    }
    else
    {
      int v17 = 0;
      double v58 = v13;
    }
    uint64_t StrokeColor = (CGColor *)OIAxisGetStrokeColor((uint64_t)a2);
    if (StrokeColor) {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
    }
    else {
      CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
    }
    double StrokeWidth = OIAxisGetStrokeWidth((uint64_t)a2);
    CGContextSetLineWidth(Type, StrokeWidth);
    double v20 = floor(v16 / 100.0);
    double v57 = v16;
    if (OIAxisGetStrokeWidth((uint64_t)a2) > 1.0) {
      double v20 = v20 + floor(OIAxisGetStrokeWidth((uint64_t)a2));
    }
    int v21 = OIAxisAreLabelsCentered((uint64_t)a2);
    uint64_t v22 = (uint64_t)OIAxisGetValueCount(a2) - (v21 ^ 1u);
    double v23 = (double)v22;
    if (v22 >= 1)
    {
      double v24 = v13 + v57;
      if (!a4) {
        double v24 = v58;
      }
      double v25 = floor(v24) + 0.5;
      double v26 = floor(v24 - v20) + 0.5;
      double v27 = 0.0;
      uint64_t v28 = 1;
      do
      {
        CGFloat v29 = floor(PlotArea + v27 * (v59 / v23)) + 0.5;
        CGContextMoveToPoint(Type, v29, v25);
        CGContextAddLineToPoint(Type, v29, v26);
        double v27 = (double)v28++;
      }
      while (v27 < v23);
    }
    double v30 = 0.5;
    double v31 = floor(PlotArea) + 0.5;
    double v32 = floor(PlotArea + v59 - a5) + 0.5;
    if (v17) {
      double v33 = v58;
    }
    else {
      double v33 = v13;
    }
    CGFloat v34 = floor(v33) + 0.5;
    CGContextMoveToPoint(Type, v31, v34);
    CGContextAddLineToPoint(Type, v32, v34);
    CGContextStrokePath(Type);
    uint64_t Labels = OIAxisGetLabels((uint64_t)a2);
    if (Labels)
    {
      CFArrayRef v36 = (const __CFArray *)Labels;
      if (!OIAxisAreLabelsCentered((uint64_t)a2)) {
        double v30 = 0.0;
      }
      OIChartGetSize(a1);
      double v38 = fmin(v37 * 0.08, 10.0);
      v62[0] = 0.0;
      CFIndex Count = CFArrayGetCount(v36);
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = ___OIAxisRenderHorizontalLabels_block_invoke;
      v61[3] = &__block_descriptor_64_e25_____CFString__24__0q8_B16l;
      v61[4] = Count;
      *(double *)&v61[5] = (double)v22;
      v61[6] = a2;
      v61[7] = v36;
      double v40 = _OIAxisRenderBuildStringArrayAndComputeWidth(v61, 0, v38, (uint64_t)Type, v62);
      double Scale = OIAxisGetScale((uint64_t)a2);
      CFNumberRef v42 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v43 = a4;
      if (v62[0] <= Scale)
      {
        uint64_t v45 = 1;
      }
      else
      {
        double v44 = v38 * Scale / v62[0];
        if (v44 >= 8.0)
        {
          uint64_t v45 = 1;
        }
        else
        {
          uint64_t v45 = (uint64_t)(1.5 / (Scale / v62[0]));
          double v44 = 8.0;
        }
        CTFontRef v46 = OICreateDefaultFontWithSize(v44);
        [v42 setObject:v46 forKeyedSubscript:*MEMORY[0x263F039A0]];
      }
      uint64_t v47 = (uint64_t)a2;
      [v42 setObject:OIAxisGetTextColor((uint64_t)a2) forKeyedSubscript:*MEMORY[0x263F03C60]];
      CFIndex v48 = CFArrayGetCount(v36);
      if (v48 >= 1 && v22 >= 1)
      {
        CFIndex v49 = v48;
        CFIndex v50 = 0;
        CFStringRef v51 = (const __CFString *)*MEMORY[0x263EFFD08];
        if (v43) {
          double v52 = v13 + v57;
        }
        else {
          double v52 = v33;
        }
        double v53 = 0.0;
        do
        {
          ValueAtIndedouble x = (const __CFString *)CFArrayGetValueAtIndex(v40, v50);
          if (ValueAtIndex != v51)
          {
            CFStringRef v55 = ValueAtIndex;
            double v56 = OIAxisConvertValueToLocal(v47, v30 + v53);
            v60[0] = MEMORY[0x263EF8330];
            v60[1] = 3221225472;
            v60[2] = ___OIAxisRenderHorizontalLabels_block_invoke_2;
            v60[3] = &__block_descriptor_48_e29__CGPoint_dd_24__0_CGSize_dd_8l;
            *(double *)&v60[4] = PlotArea + v56;
            *(double *)&v60[5] = v52;
            OIDrawStringWithAttributes(v55, v42, Type, v60);
          }
          v50 += v45;
          if (v50 >= v49) {
            break;
          }
          double v53 = (double)v50;
        }
        while ((double)v50 < v23);
      }
      CFRelease(v40);
    }
  }
}

void _OIAxisRenderHorizontalDates(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  if ((OIAxisIsHidden((uint64_t)a2) & 1) == 0)
  {
    Type = (CGContext *)OIAxisGetType(a1);
    double PlotArea = OIChartGetPlotArea(a1);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    if (OIAxisAreLabelsCentered(a1))
    {
      v57.width = 0.0;
      v57.height = 0.0;
      CGContextSetShadow(Type, v57, 0.0);
    }
    if (a3 && OIAxisGetMinValue(a3) < 0.0 && OILabelGetFontSize(a3) > 0.0)
    {
      double v53 = v13 + OIAxisConvertValueToLocal(a3, 0.0);
      int v18 = 1;
    }
    else
    {
      int v18 = 0;
      double v53 = v13;
    }
    uint64_t StrokeColor = (CGColor *)OIAxisGetStrokeColor((uint64_t)a2);
    if (StrokeColor) {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
    }
    else {
      CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
    }
    double StrokeWidth = OIAxisGetStrokeWidth((uint64_t)a2);
    CGContextSetLineWidth(Type, StrokeWidth);
    double v21 = floor(v17 / 100.0);
    if (OIAxisGetStrokeWidth((uint64_t)a2) > 1.0) {
      double v21 = v21 + floor(OIAxisGetStrokeWidth((uint64_t)a2));
    }
    int v22 = OIAxisAreLabelsCentered((uint64_t)a2);
    uint64_t v23 = (uint64_t)OIAxisGetValueCount(a2) - (v22 ^ 1u);
    double v24 = (double)v23;
    double v51 = v13;
    double v52 = v13 + v17;
    if (v23 >= 1)
    {
      double v25 = v13 + v17;
      if (!a4) {
        double v25 = v53;
      }
      double v26 = floor(v25) + 0.5;
      double v27 = floor(v25 - v21) + 0.5;
      double v28 = 0.0;
      uint64_t v29 = 1;
      do
      {
        CGFloat v30 = floor(PlotArea + v28 * (v15 / v24)) + 0.5;
        CGContextMoveToPoint(Type, v30, v26);
        CGContextAddLineToPoint(Type, v30, v27);
        double v28 = (double)v29++;
      }
      while (v28 < v24);
    }
    double v31 = floor(PlotArea) + 0.5;
    double v32 = v15;
    double v33 = floor(PlotArea + v15 - a5) + 0.5;
    if (v18) {
      double v34 = v53;
    }
    else {
      double v34 = v51;
    }
    CGFloat v35 = floor(v34) + 0.5;
    CGContextMoveToPoint(Type, v31, v35);
    CGContextAddLineToPoint(Type, v33, v35);
    CGContextStrokePath(Type);
    if (OIAxisAreLabelsCentered((uint64_t)a2)) {
      double v36 = 0.5;
    }
    else {
      double v36 = 0.0;
    }
    OIChartGetSize(a1);
    double v38 = fmin(v37 * 0.08, 10.0);
    v55[6] = a1;
    v56[0] = 0.0;
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = ___OIAxisRenderHorizontalDates_block_invoke;
    v55[3] = &__block_descriptor_56_e25_____CFString__24__0q8_B16l;
    *(double *)&v55[4] = v24;
    v55[5] = a2;
    double v39 = _OIAxisRenderBuildStringArrayAndComputeWidth(v55, 0, v38, (uint64_t)Type, v56);
    double Scale = OIAxisGetScale((uint64_t)a2);
    if (v56[0] <= Scale || (double v38 = v38 * Scale / v56[0], v38 >= 8.0))
    {
      uint64_t v41 = 1;
    }
    else
    {
      uint64_t v41 = (uint64_t)(1.5 / (Scale / v56[0]));
      double v38 = 8.0;
    }
    CFNumberRef v42 = [MEMORY[0x263EFF9A0] dictionary];
    CTFontRef v43 = OICreateDefaultFontWithSize(v38);
    [v42 setObject:v43 forKeyedSubscript:*MEMORY[0x263F039A0]];

    [v42 setObject:OIAxisGetTextColor((uint64_t)a2) forKeyedSubscript:*MEMORY[0x263F03C60]];
    CFIndex Count = CFArrayGetCount(v39);
    if (Count >= 1)
    {
      CFIndex v45 = Count;
      CFIndex v46 = 0;
      CFStringRef v47 = (const __CFString *)*MEMORY[0x263EFFD08];
      double v48 = v32 / (double)Count;
      if (a4) {
        double v49 = v52;
      }
      else {
        double v49 = v34;
      }
      do
      {
        ValueAtIndedouble x = (const __CFString *)CFArrayGetValueAtIndex(v39, v46);
        if (ValueAtIndex != v47)
        {
          v54[0] = MEMORY[0x263EF8330];
          v54[1] = 3221225472;
          v54[2] = ___OIAxisRenderHorizontalDates_block_invoke_2;
          v54[3] = &__block_descriptor_48_e29__CGPoint_dd_24__0_CGSize_dd_8l;
          *(double *)&v54[4] = PlotArea + v48 * (v36 + (double)v46);
          *(double *)&v54[5] = v49;
          OIDrawStringWithAttributes(ValueAtIndex, v42, Type, v54);
        }
        v46 += v41;
      }
      while (v46 < v45);
    }
    CFRelease(v39);
  }
}

void _OIAxisRenderHorizontalUnits(uint64_t a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5)
{
  Type = (CGContext *)OIAxisGetType(a1);
  double PlotArea = OIChartGetPlotArea(a1);
  double v58 = v9;
  double v11 = v10;
  double v13 = v12;
  int v14 = OIAxisAreLabelsCentered(a1);
  double MinValue = OIAxisGetMinValue(a2);
  double FontSize = OILabelGetFontSize(a2);
  double Unit = OIAxisGetUnit(a2);
  if (MinValue == 0.0)
  {
    double v17 = floor(v11 / 120.0);
    if (v17 < 3.0) {
      double v17 = 3.0;
    }
  }
  else
  {
    double v17 = 0.0;
  }
  double v56 = v17;
  if (v14)
  {
    v65.width = 0.0;
    v65.height = 0.0;
    CGContextSetShadow(Type, v65, 0.0);
  }
  uint64_t StrokeColor = (CGColor *)OIAxisGetStrokeColor(a2);
  if (StrokeColor) {
    CGContextSetStrokeColorWithColor(Type, StrokeColor);
  }
  else {
    CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
  }
  double StrokeWidth = OIAxisGetStrokeWidth(a2);
  CGContextSetLineWidth(Type, StrokeWidth);
  BOOL v20 = OIAxisGetStrokeWidth(a2) <= 1.0;
  double v59 = floor(v13 / 150.0);
  double v21 = v59;
  if (!v20) {
    double v21 = v59 + floor(OIAxisGetStrokeWidth(a2));
  }
  uint64_t v22 = (uint64_t)(MinValue / Unit);
  double v54 = FontSize;
  double v23 = FontSize / Unit + 1.0;
  double v24 = (double)v22;
  double v25 = PlotArea + v11;
  double v26 = PlotArea;
  if (v23 > (double)v22)
  {
    if (a5) {
      double v27 = v58 + v13;
    }
    else {
      double v27 = v58;
    }
    double v28 = floor(v27) + 0.5;
    double v29 = floor(v58 + v13 + v21);
    double v30 = floor(v58 - v21);
    if (a5) {
      double v30 = v29;
    }
    double v31 = v30 + 0.5;
    uint64_t v32 = v22 + 1;
    double v33 = (double)v22;
    do
    {
      double v34 = floor(PlotArea + OIAxisConvertValueToLocal(a2, Unit * v33));
      if (v34 > v25) {
        break;
      }
      CGFloat v35 = v34 + 0.5;
      CGContextMoveToPoint(Type, v34 + 0.5, v28);
      CGFloat v36 = v35;
      double PlotArea = v26;
      CGContextAddLineToPoint(Type, v36, v31);
      double v33 = (double)v32++;
    }
    while (v23 > v33);
  }
  CGFloat v37 = floor(PlotArea) + 0.5;
  double v38 = PlotArea;
  CGFloat v39 = floor(v58) + 0.5;
  CGContextMoveToPoint(Type, v37, v39);
  CGContextAddLineToPoint(Type, floor(v25 - a3) + 0.5, v39);
  CGContextStrokePath(Type);
  if ((OIAxisIsHidden(a2) & 1) == 0)
  {
    double v40 = Unit * OIAxisGetScale(a2);
    if (v40 >= 20.0) {
      double v41 = 10.0;
    }
    else {
      double v41 = v40 * 0.5;
    }
    CFNumberRef v42 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", *(void *)&v54);
    [v42 setObject:OIAxisGetTextColor(a2) forKeyedSubscript:*MEMORY[0x263F03C60]];
    v64[0] = 0.0;
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = ___OIAxisRenderHorizontalUnits_block_invoke;
    v63[3] = &__block_descriptor_64_e25_____CFString__24__0q8_B16l;
    v63[4] = v55;
    *(double *)&v63[5] = Unit;
    v63[6] = a2;
    v63[7] = a1;
    CTFontRef v43 = _OIAxisRenderBuildStringArrayAndComputeWidth(v63, v22, v41, (uint64_t)Type, v64);
    double v44 = v38 - v56 + -10.0;
    if (v64[0] > v44) {
      double v41 = v41 * (v44 / v64[0]);
    }
    CTFontRef v45 = OICreateDefaultFontWithSize(v41);
    [v42 setObject:v45 forKeyedSubscript:*MEMORY[0x263F039A0]];

    if (v23 > v24)
    {
      uint64_t v46 = 0;
      double v47 = -0.0;
      if (a5) {
        double v47 = v13;
      }
      double v48 = v58 + v47;
      CFStringRef v49 = (const __CFString *)*MEMORY[0x263EFFD08];
      uint64_t v50 = v22 + 1;
      do
      {
        if ((OIAxisIsLogarithmic(a2) & (Unit * v24 <= 0.0)) != 0) {
          double v51 = 1.0;
        }
        else {
          double v51 = Unit * v24;
        }
        double v52 = v26 + OIAxisConvertValueToLocal(a2, v51);
        if (floor(v52) > v25) {
          break;
        }
        ValueAtIndedouble x = (const __CFString *)CFArrayGetValueAtIndex(v43, v46);
        if (ValueAtIndex != v49)
        {
          v62[0] = MEMORY[0x263EF8330];
          v62[1] = 3221225472;
          double v62[2] = ___OIAxisRenderHorizontalUnits_block_invoke_2;
          v62[3] = &__block_descriptor_64_e29__CGPoint_dd_24__0_CGSize_dd_8l;
          *(double *)&v62[4] = v52;
          *(double *)&v62[5] = v48;
          v62[6] = a5;
          *(double *)&v62[7] = v59;
          OIDrawStringWithAttributes(ValueAtIndex, v42, Type, v62);
        }
        double v24 = (double)(v50 + v46++);
      }
      while (v23 > v24);
    }
    CFRelease(v43);
  }
}

void _OIAxisRenderVerticalLabels(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  if ((OIAxisIsHidden(a2) & 1) == 0)
  {
    Type = (CGContext *)OIAxisGetType(a1);
    double PlotArea = OIChartGetPlotArea(a1);
    double v14 = v13;
    double v56 = v15;
    double v17 = v16;
    if (OIAxisAreLabelsCentered(a1))
    {
      v61.width = 0.0;
      v61.height = 0.0;
      CGContextSetShadow(Type, v61, 0.0);
    }
    if (a3 && OIAxisGetMinValue(a3) < 0.0 && OILabelGetFontSize(a3) > 0.0)
    {
      double v54 = PlotArea + OIAxisConvertValueToLocal(a3, 0.0);
      int v55 = 1;
    }
    else
    {
      int v55 = 0;
      double v54 = PlotArea;
    }
    uint64_t StrokeColor = (CGColor *)OIAxisGetStrokeColor(a2);
    double v53 = a6;
    if (StrokeColor) {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
    }
    else {
      CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
    }
    double StrokeWidth = OIAxisGetStrokeWidth(a2);
    CGContextSetLineWidth(Type, StrokeWidth);
    double v20 = floor(v17 / 100.0);
    if (OIAxisGetStrokeWidth(a2) > 1.0) {
      double v20 = v20 + floor(OIAxisGetStrokeWidth(a2));
    }
    int v21 = OIAxisAreLabelsCentered(a2);
    double FontSize = OILabelGetFontSize(a2);
    if (v21) {
      double v23 = FontSize + 1.0;
    }
    else {
      double v23 = FontSize;
    }
    if (v23 > 0.0)
    {
      double v24 = 3.0;
      if (v20 >= 3.0) {
        double v24 = v20;
      }
      double v25 = PlotArea + v56;
      if (!a4) {
        double v25 = v54;
      }
      double v26 = floor(v25) + 0.5;
      double v27 = floor(v25 - v24) + 0.5;
      double v28 = 0.0;
      uint64_t v29 = 1;
      do
      {
        CGFloat v30 = floor(v14 + OIAxisConvertValueToLocal(a2, v28)) + 0.5;
        CGContextMoveToPoint(Type, v26, v30);
        CGContextAddLineToPoint(Type, v27, v30);
        double v28 = (double)v29++;
      }
      while (v23 > v28);
    }
    double v31 = floor(v14) + 0.5;
    double v32 = floor(v14 + v17 - v53) + 0.5;
    if (v55) {
      double v33 = v54;
    }
    else {
      double v33 = PlotArea;
    }
    CGFloat v34 = floor(v33) + 0.5;
    CGContextMoveToPoint(Type, v34, v31);
    CGContextAddLineToPoint(Type, v34, v32);
    CGContextStrokePath(Type);
    uint64_t Labels = OIAxisGetLabels(a2);
    if (Labels)
    {
      CFArrayRef v36 = (const __CFArray *)Labels;
      if (OIAxisAreLabelsCentered(a2)) {
        double v37 = 0.5;
      }
      else {
        double v37 = 0.0;
      }
      v60[0] = 0.0;
      CFIndex Count = CFArrayGetCount(v36);
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = ___OIAxisRenderVerticalLabels_block_invoke;
      v59[3] = &__block_descriptor_64_e25_____CFString__24__0q8_B16l;
      v59[4] = Count;
      *(double *)&v59[5] = v23;
      v59[6] = a2;
      v59[7] = v36;
      double v39 = 10.0;
      double v40 = _OIAxisRenderBuildStringArrayAndComputeWidth(v59, 0, 10.0, (uint64_t)Type, v60);
      if (v60[0] > PlotArea + -5.0) {
        double v39 = (PlotArea + -5.0) * 10.0 / v60[0];
      }
      double v41 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v60[0], *(void *)&v53);
      CTFontRef v42 = OICreateDefaultFontWithSize(v39);
      [v41 setObject:v42 forKeyedSubscript:*MEMORY[0x263F039A0]];

      [v41 setObject:OIAxisGetTextColor(a2) forKeyedSubscript:*MEMORY[0x263F03C60]];
      double v43 = floor(v56 / 100.0);
      if (v43 >= 3.0) {
        double v44 = v43;
      }
      else {
        double v44 = 3.0;
      }
      CFIndex v45 = CFArrayGetCount(v40);
      if (v45 >= 1)
      {
        CFIndex v46 = v45;
        CFIndex v47 = 0;
        CFStringRef v48 = (const __CFString *)*MEMORY[0x263EFFD08];
        if (a4) {
          double v49 = PlotArea + v56;
        }
        else {
          double v49 = v33;
        }
        do
        {
          ValueAtIndedouble x = (const __CFString *)CFArrayGetValueAtIndex(v40, v47);
          if (ValueAtIndex != v48)
          {
            CFStringRef v51 = ValueAtIndex;
            double v52 = OIAxisConvertValueToLocal(a2, v37 + (double)v47);
            v57[0] = MEMORY[0x263EF8330];
            v57[1] = 3221225472;
            v57[2] = ___OIAxisRenderVerticalLabels_block_invoke_2;
            v57[3] = &__block_descriptor_89_e29__CGPoint_dd_24__0_CGSize_dd_8l;
            *(double *)&v57[4] = v49;
            *(double *)&v57[5] = v14 + v52;
            char v58 = v55;
            *(double *)&v57[6] = PlotArea;
            *(double *)&v57[7] = v14;
            *(double *)&v57[8] = v56;
            *(double *)&v57[9] = v17;
            *(double *)&v57[10] = v44;
            OIDrawStringWithAttributes(v51, v41, Type, v57);
          }
          ++v47;
        }
        while (v46 != v47);
      }
      CFRelease(v40);
    }
  }
}

void _OIAxisRenderVerticalDates(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  if ((OIAxisIsHidden((uint64_t)a2) & 1) == 0)
  {
    Type = (CGContext *)OIAxisGetType(a1);
    double PlotArea = OIChartGetPlotArea(a1);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    if (OIAxisAreLabelsCentered(a1))
    {
      v59.width = 0.0;
      v59.height = 0.0;
      CGContextSetShadow(Type, v59, 0.0);
    }
    if (a3 && OIAxisGetMinValue(a3) < 0.0 && OILabelGetFontSize(a3) > 0.0)
    {
      double v53 = PlotArea + OIAxisConvertValueToLocal(a3, 0.0);
      int v19 = 1;
    }
    else
    {
      int v19 = 0;
      double v53 = PlotArea;
    }
    uint64_t StrokeColor = (CGColor *)OIAxisGetStrokeColor((uint64_t)a2);
    if (StrokeColor) {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
    }
    else {
      CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
    }
    double StrokeWidth = OIAxisGetStrokeWidth((uint64_t)a2);
    CGContextSetLineWidth(Type, StrokeWidth);
    double v22 = floor(v18 / 100.0);
    double v50 = a6;
    if (OIAxisGetStrokeWidth((uint64_t)a2) > 1.0) {
      double v22 = v22 + floor(OIAxisGetStrokeWidth((uint64_t)a2));
    }
    int v23 = OIAxisAreLabelsCentered((uint64_t)a2);
    uint64_t v24 = (uint64_t)OIAxisGetValueCount(a2) - (v23 ^ 1u);
    double v25 = (double)v24;
    double v52 = v16;
    if (v24 >= 1)
    {
      double v26 = PlotArea + v16;
      double v27 = 3.0;
      if (v22 >= 3.0) {
        double v27 = v22;
      }
      if (!a4) {
        double v26 = v53;
      }
      double v28 = floor(v26) + 0.5;
      double v29 = floor(v26 - v27) + 0.5;
      double v30 = 0.0;
      uint64_t v31 = 1;
      do
      {
        CGFloat v32 = floor(v14 + v30 * (v18 / v25)) + 0.5;
        CGContextMoveToPoint(Type, v28, v32);
        CGContextAddLineToPoint(Type, v29, v32);
        double v30 = (double)v31++;
      }
      while (v30 < v25);
    }
    double v33 = floor(v14) + 0.5;
    double v34 = floor(v14 + v18 - v50) + 0.5;
    double v35 = v53;
    if (!v19) {
      double v35 = PlotArea;
    }
    double v51 = v35;
    CGFloat v36 = floor(v35) + 0.5;
    CGContextMoveToPoint(Type, v36, v33);
    CGContextAddLineToPoint(Type, v36, v34);
    CGContextStrokePath(Type);
    if (OIAxisAreLabelsCentered((uint64_t)a2)) {
      double v37 = 0.5;
    }
    else {
      double v37 = 0.0;
    }
    double v58 = 0.0;
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = ___OIAxisRenderVerticalDates_block_invoke;
    v57[3] = &__block_descriptor_56_e25_____CFString__24__0q8_B16l;
    *(double *)&v57[4] = v25;
    v57[5] = a2;
    v57[6] = a1;
    double v38 = 10.0;
    double v39 = _OIAxisRenderBuildStringArrayAndComputeWidth(v57, 0, 10.0, (uint64_t)Type, &v58);
    if (v58 > PlotArea + -5.0) {
      double v38 = (PlotArea + -5.0) * 10.0 / v58;
    }
    double v40 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v58, *(void *)&v14);
    CTFontRef v41 = OICreateDefaultFontWithSize(v38);
    [v40 setObject:v41 forKeyedSubscript:*MEMORY[0x263F039A0]];

    [v40 setObject:OIAxisGetTextColor((uint64_t)a2) forKeyedSubscript:*MEMORY[0x263F03C60]];
    double v42 = floor(v16 / 100.0);
    if (v42 < 3.0) {
      double v42 = 3.0;
    }
    double v54 = v42;
    CFIndex Count = CFArrayGetCount(v39);
    if (Count >= 1)
    {
      CFIndex v44 = Count;
      CFIndex v45 = 0;
      double v46 = v18 / (double)Count;
      if (a4) {
        double v47 = PlotArea + v16;
      }
      else {
        double v47 = v51;
      }
      do
      {
        ValueAtIndedouble x = (const __CFString *)CFArrayGetValueAtIndex(v39, v45);
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = ___OIAxisRenderVerticalDates_block_invoke_2;
        v55[3] = &__block_descriptor_89_e29__CGPoint_dd_24__0_CGSize_dd_8l;
        *(double *)&v55[4] = v47;
        *(double *)&v55[5] = v49 + v46 * (v37 + (double)v45);
        char v56 = v19;
        *(double *)&v55[6] = PlotArea;
        *(double *)&void v55[7] = v49;
        *(double *)&v55[8] = v52;
        *(double *)&v55[9] = v18;
        *(double *)&v55[10] = v54;
        OIDrawStringWithAttributes(ValueAtIndex, v40, Type, v55);
        ++v45;
      }
      while (v44 != v45);
    }
    CFRelease(v39);
  }
}

void _OIAxisRenderVerticalUnits(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  Type = (CGContext *)OIAxisGetType(a1);
  double PlotArea = OIChartGetPlotArea(a1);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  int v15 = OIAxisAreLabelsCentered(a1);
  double MinValue = OIAxisGetMinValue(a2);
  double FontSize = OILabelGetFontSize(a2);
  double Unit = OIAxisGetUnit(a2);
  if (v15)
  {
    v63.width = 0.0;
    v63.height = 0.0;
    CGContextSetShadow(Type, v63, 0.0);
  }
  uint64_t StrokeColor = (CGColor *)OIAxisGetStrokeColor(a2);
  if (StrokeColor) {
    CGContextSetStrokeColorWithColor(Type, StrokeColor);
  }
  else {
    CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
  }
  double StrokeWidth = OIAxisGetStrokeWidth(a2);
  CGContextSetLineWidth(Type, StrokeWidth);
  double v20 = floor(v12 / 150.0);
  BOOL v21 = OIAxisGetStrokeWidth(a2) <= 1.0;
  double v22 = v20;
  if (!v21) {
    double v22 = v20 + floor(OIAxisGetStrokeWidth(a2));
  }
  double v54 = v20;
  double v55 = FontSize;
  uint64_t v23 = (uint64_t)(MinValue / Unit);
  double v24 = FontSize / Unit + 1.0;
  double v25 = (double)v23;
  double v26 = v10;
  if (v24 <= (double)v23)
  {
    double v27 = v10 + v14;
  }
  else
  {
    if (v22 < 3.0) {
      double v22 = 3.0;
    }
    double v27 = v10 + v14;
    if (a6) {
      double v28 = PlotArea + v12;
    }
    else {
      double v28 = PlotArea;
    }
    double v29 = floor(v28) + 0.5;
    double v30 = floor(PlotArea + v12 + v22);
    double v31 = floor(PlotArea - v22);
    if (a6) {
      double v31 = v30;
    }
    double v32 = v31 + 0.5;
    uint64_t v33 = v23 + 1;
    double v34 = (double)v23;
    do
    {
      double v35 = floor(v10 + OIAxisConvertValueToLocal(a2, Unit * v34));
      if (v35 > v27) {
        break;
      }
      CGFloat v36 = v35 + 0.5;
      CGContextMoveToPoint(Type, v29, v35 + 0.5);
      CGFloat v37 = v36;
      double v10 = v26;
      CGContextAddLineToPoint(Type, v32, v37);
      double v34 = (double)v33++;
    }
    while (v24 > v34);
  }
  double v38 = v10;
  CGFloat v39 = floor(PlotArea) + 0.5;
  CGContextMoveToPoint(Type, v39, floor(v38) + 0.5);
  CGContextAddLineToPoint(Type, v39, floor(v27 - a4) + 0.5);
  CGContextStrokePath(Type);
  if ((OIAxisIsHidden(a2) & 1) == 0)
  {
    double v40 = fmin(Unit * OIAxisGetScale(a2), 10.0);
    CTFontRef v41 = [MEMORY[0x263EFF9A0] dictionary];
    [v41 setObject:OIAxisGetTextColor(a2) forKeyedSubscript:*MEMORY[0x263F03C60]];
    if (v54 >= 3.0) {
      double v42 = v54;
    }
    else {
      double v42 = 3.0;
    }
    v62[0] = 0.0;
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = ___OIAxisRenderVerticalUnits_block_invoke;
    v61[3] = &__block_descriptor_64_e25_____CFString__24__0q8_B16l;
    *(double *)&v61[4] = v55;
    *(double *)&v61[5] = Unit;
    v61[6] = a2;
    v61[7] = a1;
    double v43 = _OIAxisRenderBuildStringArrayAndComputeWidth(v61, v23, v40, (uint64_t)Type, v62);
    double v44 = PlotArea - v42 + -10.0;
    if (v62[0] > v44) {
      double v40 = v40 * (v44 / v62[0]);
    }
    CTFontRef v45 = OICreateDefaultFontWithSize(v40);
    [v41 setObject:v45 forKeyedSubscript:*MEMORY[0x263F039A0]];

    if (v24 > v25)
    {
      uint64_t v46 = 0;
      double v47 = -0.0;
      if (a6) {
        double v47 = v12;
      }
      double v48 = PlotArea + v47;
      CFStringRef v49 = (const __CFString *)*MEMORY[0x263EFFD08];
      uint64_t v50 = v23 + 1;
      do
      {
        if ((OIAxisIsLogarithmic(a2) & (Unit * v25 <= 0.0)) != 0) {
          double v51 = 1.0;
        }
        else {
          double v51 = Unit * v25;
        }
        double v52 = v26 + OIAxisConvertValueToLocal(a2, v51);
        if (floor(v52) > v27) {
          break;
        }
        ValueAtIndedouble x = (const __CFString *)CFArrayGetValueAtIndex(v43, v46);
        if (ValueAtIndex != v49)
        {
          v60[0] = MEMORY[0x263EF8330];
          v60[1] = 3221225472;
          double v60[2] = ___OIAxisRenderVerticalUnits_block_invoke_2;
          v60[3] = &__block_descriptor_64_e29__CGPoint_dd_24__0_CGSize_dd_8l;
          *(double *)&v60[4] = v48;
          *(double *)&v60[5] = v52;
          void v60[6] = a6;
          *(double *)&v60[7] = v42;
          OIDrawStringWithAttributes(ValueAtIndex, v41, Type, v60);
        }
        double v25 = (double)(v50 + v46++);
      }
      while (v24 > v25);
    }
    CFRelease(v43);
  }
}

void _OIRender3DOrthoAxisBackgroundInChart(uint64_t a1, double a2, double a3)
{
  Type = (CGContext *)OIAxisGetType(a1);
  GenericRGB = OIColorCreateGenericRGB(0.8, 0.8, 0.8, 1.0);
  double v8 = OIColorCreateGenericRGB(0.5, 0.5, 0.5, 1.0);
  double PlotStrokeWidth = OIChartGetPlotStrokeWidth(a1);
  double PlotArea = OIChartGetPlotArea(a1);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  Axis = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  double v17 = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  double v18 = v13 - a2;
  OIAxisUpdateScaleForLength((uint64_t)v17, v13 - a2);
  double v29 = v15 - a3;
  OIAxisUpdateScaleForLength((uint64_t)Axis, v15 - a3);
  int v19 = OICreateDimmedColorFromColor(GenericRGB, 0.5);
  CGMutablePathRef Mutable = CGPathCreateMutable();
  CGFloat v21 = floor(v11) + 0.5;
  double v31 = floor(PlotArea) + 0.5;
  CGPathMoveToPoint(Mutable, 0, v31, v21);
  double v22 = floor(a2 + PlotArea) + 0.5;
  double v33 = a3;
  double v23 = floor(a3 + v11) + 0.5;
  CGPathAddLineToPoint(Mutable, 0, v22, v23);
  double v24 = PlotArea + v18;
  double v25 = floor(a2 + v24) + 0.5;
  CGPathAddLineToPoint(Mutable, 0, v25, v23);
  CGFloat v30 = v21;
  CGPathAddLineToPoint(Mutable, 0, floor(v24) + 0.5, v21);
  CGPathCloseSubpath(Mutable);
  if (v19)
  {
    CGContextSetFillColorWithColor(Type, v19);
    CGContextAddPath(Type, Mutable);
    CGContextFillPath(Type);
  }
  if (v8)
  {
    CGContextSetStrokeColorWithColor(Type, v8);
    CGContextAddPath(Type, Mutable);
    CGContextSetLineWidth(Type, PlotStrokeWidth);
    CGContextStrokePath(Type);
  }
  CGPathRelease(Mutable);
  CGColorRelease(v19);
  double v26 = CGPathCreateMutable();
  CGPathMoveToPoint(v26, 0, v22, v23);
  double v27 = floor(v33 + v11 + v29) + 0.5;
  CGPathAddLineToPoint(v26, 0, v22, v27);
  CGPathAddLineToPoint(v26, 0, v25, v27);
  CGPathAddLineToPoint(v26, 0, v25, v23);
  CGPathCloseSubpath(v26);
  if (GenericRGB)
  {
    CGContextSetFillColorWithColor(Type, GenericRGB);
    CGContextAddPath(Type, v26);
    CGContextFillPath(Type);
  }
  if (v8)
  {
    CGContextSetStrokeColorWithColor(Type, v8);
    CGContextAddPath(Type, v26);
    CGContextSetLineWidth(Type, PlotStrokeWidth);
    CGContextStrokePath(Type);
  }
  CGPathRelease(v26);
  double v28 = CGPathCreateMutable();
  CGPathMoveToPoint(v28, 0, v31, v30);
  CGPathAddLineToPoint(v28, 0, v31, floor(v11 + v29) + 0.5);
  CGPathAddLineToPoint(v28, 0, v22, v27);
  CGPathAddLineToPoint(v28, 0, v22, v23);
  CGPathCloseSubpath(v28);
  if (GenericRGB)
  {
    CGContextSetFillColorWithColor(Type, GenericRGB);
    CGContextAddPath(Type, v28);
    CGContextFillPath(Type);
  }
  if (v8)
  {
    CGContextSetStrokeColorWithColor(Type, v8);
    CGContextAddPath(Type, v28);
    CGContextSetLineWidth(Type, PlotStrokeWidth);
    CGContextStrokePath(Type);
  }
  CGPathRelease(v28);
  if (v17 && OIAxisGetDrawMajorGridlines((uint64_t)v17)) {
    _OIAxisRenderVerticallUnitLines(a1, (uint64_t)v17, a2, v33);
  }
  if (Axis && OIAxisGetDrawMajorGridlines((uint64_t)Axis)) {
    _OIAxisRenderHorizontalUnitLines(a1, (uint64_t)Axis, a2, v33);
  }
  CGColorRelease(GenericRGB);

  CGColorRelease(v8);
}

void OIRender3DOrthoAxisBackgroundInChart(uint64_t a1)
{
  OIChartGetPlotArea(a1);
  double v3 = v2;
  double v5 = v4;
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  double v7 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  double v8 = OIChartGetRotation(a1) / 45.0 * (v3 / v7);
  double v9 = OIChartGetElevation(a1) / 90.0 * (v5 / v7);

  _OIRender3DOrthoAxisBackgroundInChart(a1, v8, v9);
}

void OIRender3DLayeredOrthoAxisBackgroundInChart(uint64_t a1)
{
  OIChartGetPlotArea(a1);
  double v3 = v2;
  double v5 = v4;
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  SeriesCFIndex Count = OIChartGetSeriesCount(a1);
  double FontSize = (double)(uint64_t)OILabelGetFontSize((uint64_t)Axis);
  double v9 = OIChartGetRotation(a1) / 45.0 * (v3 * (double)(uint64_t)SeriesCount / FontSize);
  double v10 = v5 * (double)(uint64_t)SeriesCount / FontSize * (OIChartGetElevation(a1) / 90.0);

  _OIRender3DOrthoAxisBackgroundInChart(a1, v9, v10);
}

void _OIRender3DOrthoAxisForegroundInChart(uint64_t a1, double a2, double a3)
{
  Type = (CGContext *)OIAxisGetType(a1);
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  double v8 = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  CGContextSaveGState(Type);
  if (!Axis)
  {
LABEL_7:
    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_8;
  }
  if (!OIAxisGetType((uint64_t)Axis))
  {
    _OIAxisRenderHorizontalLabels(a1, Axis, (uint64_t)v8, 0, a2);
    goto LABEL_7;
  }
  if (OIAxisGetType((uint64_t)Axis) == 2)
  {
    _OIAxisRenderHorizontalDates(a1, Axis, (uint64_t)v8, 0, a2);
    if (!v8) {
      goto LABEL_15;
    }
  }
  else
  {
    _OIAxisRenderHorizontalUnits(a1, (uint64_t)Axis, a2, v9, 0);
    if (!v8) {
      goto LABEL_15;
    }
  }
LABEL_8:
  if (OIAxisGetType((uint64_t)v8))
  {
    if (OIAxisGetType((uint64_t)v8) == 2) {
      _OIAxisRenderVerticalDates(a1, v8, (uint64_t)Axis, 0, a2, a3);
    }
    else {
      _OIAxisRenderVerticalUnits(a1, (uint64_t)v8, a2, a3, v10, 0);
    }
  }
  else
  {
    _OIAxisRenderVerticalLabels(a1, (uint64_t)v8, (uint64_t)Axis, 0, a2, a3);
  }
LABEL_15:

  CGContextRestoreGState(Type);
}

void OIRender3DOrthoAxisForegroundInChart(uint64_t a1)
{
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  OIChartGetPlotArea(a1);
  double v4 = v3;
  double v6 = v5;
  double v7 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  double v8 = OIChartGetRotation(a1) / 45.0 * (v4 / v7);
  double v9 = OIChartGetElevation(a1) / 90.0 * (v6 / v7);

  _OIRender3DOrthoAxisForegroundInChart(a1, v8, v9);
}

void OIRender3DLayeredOrthoAxisForegroundInChart(uint64_t a1)
{
  OIChartGetPlotArea(a1);
  double v3 = v2;
  double v5 = v4;
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  SeriesCFIndex Count = OIChartGetSeriesCount(a1);
  double FontSize = (double)(uint64_t)OILabelGetFontSize((uint64_t)Axis);
  double v9 = OIChartGetRotation(a1) / 45.0 * (v3 * (double)(uint64_t)SeriesCount / FontSize);
  double v10 = v5 * (double)(uint64_t)SeriesCount / FontSize * (OIChartGetElevation(a1) / 90.0);

  _OIRender3DOrthoAxisForegroundInChart(a1, v9, v10);
}

void OIRender3DFlippedOrthoAxisBackgroundInChart(uint64_t a1)
{
  Type = (CGContext *)OIAxisGetType(a1);
  double PlotArea = OIChartGetPlotArea(a1);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  GenericRGB = OIColorCreateGenericRGB(0.8, 0.8, 0.8, 1.0);
  double v11 = OIColorCreateGenericRGB(0.5, 0.5, 0.5, 1.0);
  double PlotStrokeWidth = OIChartGetPlotStrokeWidth(a1);
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  double v13 = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  double v14 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)v13));
  double v15 = OIChartGetRotation(a1) / 45.0 * (v7 / v14);
  double v16 = OIChartGetElevation(a1) / 90.0 * (v9 / v14);
  double v17 = v7 - v15;
  OIAxisUpdateScaleForLength((uint64_t)Axis, v17);
  double v28 = v9 - v16;
  OIAxisUpdateScaleForLength((uint64_t)v13, v9 - v16);
  CGMutablePathRef Mutable = CGPathCreateMutable();
  double v19 = floor(v5) + 0.5;
  double v29 = floor(PlotArea) + 0.5;
  CGPathMoveToPoint(Mutable, 0, v29, v19);
  double v20 = floor(PlotArea + v15) + 0.5;
  double v31 = v16;
  double v21 = floor(v5 + v16) + 0.5;
  CGPathAddLineToPoint(Mutable, 0, v20, v21);
  double v22 = PlotArea + v17;
  double v23 = floor(v15 + v22) + 0.5;
  CGPathAddLineToPoint(Mutable, 0, v23, v21);
  CGPathAddLineToPoint(Mutable, 0, floor(v22) + 0.5, v19);
  CGPathCloseSubpath(Mutable);
  if (GenericRGB)
  {
    CGContextSetFillColorWithColor(Type, GenericRGB);
    CGContextAddPath(Type, Mutable);
    CGContextFillPath(Type);
  }
  if (v11)
  {
    CGContextSetStrokeColorWithColor(Type, v11);
    CGContextAddPath(Type, Mutable);
    CGContextSetLineWidth(Type, PlotStrokeWidth);
    CGContextStrokePath(Type);
  }
  CGPathRelease(Mutable);
  double v24 = CGPathCreateMutable();
  CGPathMoveToPoint(v24, 0, v20, v21);
  double v25 = floor(v31 + v5 + v28) + 0.5;
  CGPathAddLineToPoint(v24, 0, v20, v25);
  CGPathAddLineToPoint(v24, 0, v23, v25);
  CGPathAddLineToPoint(v24, 0, v23, v21);
  CGPathCloseSubpath(v24);
  if (GenericRGB)
  {
    CGContextSetFillColorWithColor(Type, GenericRGB);
    CGContextAddPath(Type, v24);
    CGContextFillPath(Type);
  }
  if (v11)
  {
    CGContextSetStrokeColorWithColor(Type, v11);
    CGContextAddPath(Type, v24);
    CGContextSetLineWidth(Type, PlotStrokeWidth);
    CGContextStrokePath(Type);
  }
  CGPathRelease(v24);
  double v26 = OICreateDimmedColorFromColor(GenericRGB, 0.5);
  double v27 = CGPathCreateMutable();
  CGPathMoveToPoint(v27, 0, v29, v19);
  CGPathAddLineToPoint(v27, 0, v29, floor(v5 + v28) + 0.5);
  CGPathAddLineToPoint(v27, 0, v20, v25);
  CGPathAddLineToPoint(v27, 0, v20, v21);
  CGPathCloseSubpath(v27);
  if (v26)
  {
    CGContextSetFillColorWithColor(Type, v26);
    CGContextAddPath(Type, v27);
    CGContextFillPath(Type);
  }
  if (v11)
  {
    CGContextSetStrokeColorWithColor(Type, v11);
    CGContextAddPath(Type, v27);
    CGContextSetLineWidth(Type, PlotStrokeWidth);
    CGContextStrokePath(Type);
  }
  CGPathRelease(v27);
  CGColorRelease(v26);
  if (Axis && OIAxisGetDrawMajorGridlines((uint64_t)Axis)) {
    _OIAxisRenderVerticallUnitLines(a1, (uint64_t)Axis, v15, v31);
  }
  if (v13 && OIAxisGetDrawMajorGridlines((uint64_t)v13)) {
    _OIAxisRenderHorizontalUnitLines(a1, (uint64_t)v13, v15, v31);
  }
  CGColorRelease(GenericRGB);

  CGColorRelease(v11);
}

void OIRender3DFlippedOrthoAxisForegroundInChart(uint64_t a1)
{
  Type = (CGContext *)OIAxisGetType(a1);
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  double v4 = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  uint64_t FontSize = (uint64_t)OILabelGetFontSize((uint64_t)v4);
  OIChartGetPlotArea(a1);
  double v7 = v6;
  double v8 = (double)(2 * FontSize);
  double v10 = OIChartGetRotation(a1) / 45.0 * (v9 / v8);
  double v11 = v7 / v8 * (OIChartGetElevation(a1) / 90.0);
  CGContextSaveGState(Type);
  if (Axis)
  {
    if (!OIAxisGetType((uint64_t)Axis))
    {
      _OIAxisRenderHorizontalLabels(a1, Axis, (uint64_t)v4, 0, v10);
      if (!v4) {
        goto LABEL_10;
      }
      goto LABEL_5;
    }
    _OIAxisRenderHorizontalUnits(a1, (uint64_t)Axis, v10, v12, 0);
  }
  if (!v4) {
    goto LABEL_10;
  }
LABEL_5:
  if (OIAxisGetType((uint64_t)v4)) {
    _OIAxisRenderVerticalUnits(a1, (uint64_t)v4, v10, v11, v13, 0);
  }
  else {
    _OIAxisRenderVerticalLabels(a1, (uint64_t)v4, (uint64_t)Axis, 0, v10, v11);
  }
LABEL_10:

  CGContextRestoreGState(Type);
}

void OIRenderRadarAxisBackgroundInChart(uint64_t a1)
{
  Type = (CGContext *)OIAxisGetType(a1);
  double PlotArea = OIChartGetPlotArea(a1);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  int v10 = OIAxisAreLabelsCentered(a1);
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  uint64_t v12 = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  CGContextSaveGState(Type);
  CGContextBeginPath(Type);
  if (v10)
  {
    v35.width = 0.0;
    v35.height = 0.0;
    CGContextSetShadow(Type, v35, 0.0);
  }
  CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
  CGContextSetLineWidth(Type, 0.3);
  double FontSize = OILabelGetFontSize((uint64_t)Axis);
  double MinValue = OIAxisGetMinValue((uint64_t)v12);
  double v14 = OILabelGetFontSize((uint64_t)v12);
  double Unit = OIAxisGetUnit((uint64_t)v12);
  double v16 = MinValue / Unit;
  double v31 = Unit;
  double v17 = v14 / Unit + 1.0;
  double v18 = (double)(uint64_t)(MinValue / Unit);
  double v32 = v17;
  if (v17 > v18)
  {
    double v19 = PlotArea + v7 * 0.5;
    uint64_t v20 = (uint64_t)v16;
    double v21 = v5 + v9 * 0.5;
    double v22 = FontSize + 1.0;
    do
    {
      if (v22 > 0.0)
      {
        uint64_t v23 = 0;
        double v24 = v31 * v18;
        uint64_t v25 = 1;
        do
        {
          double v26 = OIAxisConvertValueToLocal((uint64_t)v12, v24) * 0.5;
          __double2 v27 = __sincos_stret((double)v23 * -3.14159265 / FontSize + 1.57079633);
          double v28 = floor(v19 + v26 * v27.__cosval) + 0.5;
          double v29 = floor(v21 + v26 * v27.__sinval) + 0.5;
          if (v25 == 1) {
            CGContextMoveToPoint(Type, v28, v29);
          }
          else {
            CGContextAddLineToPoint(Type, v28, v29);
          }
          double v30 = (double)v25++;
          v23 += 2;
        }
        while (v22 > v30);
      }
      CGContextStrokePath(Type);
      double v18 = (double)++v20;
    }
    while (v32 > (double)v20);
  }

  CGContextRestoreGState(Type);
}

void OIRenderRadarAxisForegroundInChart(uint64_t a1)
{
  v43[2] = *MEMORY[0x263EF8340];
  Type = (CGContext *)OIAxisGetType(a1);
  double PlotArea = OIChartGetPlotArea(a1);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  int v10 = OIAxisAreLabelsCentered(a1);
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  double v11 = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  CGContextSaveGState(Type);
  CGContextBeginPath(Type);
  if (v10)
  {
    v44.width = 0.0;
    v44.height = 0.0;
    CGContextSetShadow(Type, v44, 0.0);
  }
  double v40 = v5 + v9 * 0.5;
  double v12 = PlotArea + v7 * 0.5;
  CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
  CGContextSetLineWidth(Type, 0.3);
  double FontSize = OILabelGetFontSize((uint64_t)Axis);
  double MinValue = OIAxisGetMinValue((uint64_t)v11);
  double v14 = OILabelGetFontSize((uint64_t)v11);
  if (FontSize > 0.0)
  {
    uint64_t v15 = 0;
    double v37 = floor(v40) + 0.5;
    double v38 = floor(v12) + 0.5;
    uint64_t v16 = 1;
    do
    {
      double v17 = v14;
      double v18 = OIAxisConvertValueToLocal((uint64_t)v11, v14) * 0.5;
      __double2 v19 = __sincos_stret((double)v15 * -3.14159265 / FontSize + 1.57079633);
      double v20 = v12 + v18 * v19.__cosval;
      CGContextMoveToPoint(Type, v38, v37);
      double v21 = floor(v40 + v18 * v19.__sinval);
      double v14 = v17;
      CGContextAddLineToPoint(Type, floor(v20) + 0.5, v21 + 0.5);
      double v22 = (double)v16++;
      v15 += 2;
    }
    while (FontSize > v22);
  }
  CGContextStrokePath(Type);
  double Scale = OIAxisGetScale((uint64_t)v11);
  double Unit = OIAxisGetUnit((uint64_t)v11);
  double v25 = v14 / Unit + 1.0;
  double v26 = (double)(uint64_t)(MinValue / Unit);
  if (v25 > v26)
  {
    double v27 = fmin(Scale * Unit, 10.0);
    uint64_t v28 = *MEMORY[0x263F039A0];
    uint64_t v29 = *MEMORY[0x263F03C60];
    uint64_t v30 = (uint64_t)(MinValue / Unit) + 1;
    do
    {
      double v31 = Unit * v26;
      unint64_t v32 = 0x263F08000uLL;
      if (v14 >= 1.0)
      {
        LODWORD(v32) = llround(v31);
        objc_msgSend(NSString, "stringWithFormat:", @"%d", v32);
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%f,1", *(void *)&v31);
      }
      double v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v42[0] = v28;
      CTFontRef v34 = OICreateDefaultFontWithSize(v27);
      v42[1] = v29;
      v43[0] = v34;
      v43[1] = OIAxisGetTextColor((uint64_t)Axis);
      CGSize v35 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __OIRenderRadarAxisForegroundInChart_block_invoke;
      v41[3] = &__block_descriptor_64_e29__CGPoint_dd_24__0_CGSize_dd_8l;
      v41[4] = v11;
      *(double *)&v41[5] = v31;
      *(double *)&v41[6] = v12;
      *(double *)&v41[7] = v40;
      OIDrawStringWithAttributes(v33, v35, Type, v41);

      double v26 = (double)v30++;
    }
    while (v25 > v26);
  }
  CGContextRestoreGState(Type);
}

double __OIRenderRadarAxisForegroundInChart_block_invoke(uint64_t a1, double a2)
{
  return *(double *)(a1 + 48) - a2 + -4.0;
}

__CFArray *_OIAxisRenderBuildStringArrayAndComputeWidth(void *a1, uint64_t a2, CGFloat a3, uint64_t a4, double *a5)
{
  double v8 = a1;
  char v16 = 0;
  CGMutablePathRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  int v10 = (const void *)*MEMORY[0x263EFFD08];
  double v11 = 0.0;
  do
  {
    CFStringRef v12 = (const __CFString *)v8[2](v8, a2, &v16);
    if (v16) {
      break;
    }
    CFStringRef v13 = v12;
    if (v12)
    {
      CFArrayAppendValue(Mutable, v12);
      CFRelease(v13);
    }
    else
    {
      CFArrayAppendValue(Mutable, v10);
    }
    double v14 = OISizeForStringInContext(v13, a3) + 2.0;
    if (v14 > v11) {
      double v11 = v14;
    }
    ++a2;
  }
  while (!v16);
  if (a5) {
    *a5 = v11;
  }

  return Mutable;
}

CFStringRef OIFormatterCreateStringFromDouble(const __CFString *a1, double a2)
{
  double valuePtr = a2;
  CFLocaleRef v3 = CFLocaleCopyCurrent();
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  double v5 = CFNumberFormatterCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v3, kCFNumberFormatterDecimalStyle);
  double v6 = v5;
  if (a1) {
    CFNumberFormatterSetFormat(v5, a1);
  }
  CFRelease(v3);
  CFStringRef v7 = CFNumberFormatterCreateStringWithValue(v4, v6, kCFNumberDoubleType, &valuePtr);
  CFRelease(v6);
  return v7;
}

CFStringRef OIFormatterCreateDateStringFromDouble(const __CFString *a1, CFAbsoluteTime a2)
{
  CFLocaleRef v4 = CFLocaleCopyCurrent();
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  double v6 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, kCFDateFormatterShortStyle, kCFDateFormatterNoStyle);
  CFStringRef v7 = v6;
  if (a1) {
    CFDateFormatterSetFormat(v6, a1);
  }
  CFRelease(v4);
  CFDateRef v8 = CFDateCreate(v5, a2);
  CFStringRef StringWithDate = CFDateFormatterCreateStringWithDate(v5, v7, v8);
  CFRelease(v7);
  CFRelease(v8);
  return StringWithDate;
}

CFStringRef OIFormatterCreatePercentStringFromDouble(const __CFString *a1, double a2)
{
  double valuePtr = a2;
  CFLocaleRef v3 = CFLocaleCopyCurrent();
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFAllocatorRef v5 = CFNumberFormatterCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v3, kCFNumberFormatterPercentStyle);
  double v6 = v5;
  if (a1) {
    CFNumberFormatterSetFormat(v5, a1);
  }
  uint64_t v10 = 0x3FF0000000000000;
  CFNumberRef v7 = CFNumberCreate(v4, kCFNumberFloatType, &v10);
  CFNumberFormatterSetProperty(v6, (CFNumberFormatterKey)*MEMORY[0x263EFFDC0], v7);
  CFRelease(v7);
  CFRelease(v3);
  CFStringRef v8 = CFNumberFormatterCreateStringWithValue(v4, v6, kCFNumberDoubleType, &valuePtr);
  CFRelease(v6);
  return v8;
}

uint64_t OIFormatterCreateStringUsingCustomFormatter(uint64_t a1, uint64_t (*a2)(void))
{
  if (a2)
  {
    return a2();
  }
  else
  {
    CFShow(@"formatterCallback not defined");
    return 0;
  }
}

void *_OIErrorBarRetain(uint64_t a1, void *a2)
{
  CFTypeRef result = a2;
  ++*a2;
  return result;
}

void _OIErrorBarRelease(uint64_t a1, void *a2)
{
}

double OIErrorBarCreate()
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  v1 = CFAllocatorAllocate(Default, 24, 0);
  void *v1 = 1;
  *(void *)&double result = 0x200000000;
  v1[1] = 0x200000000;
  v1[2] = 0x3FF0000000000000;
  return result;
}

void OIErrorBarRelease(void *a1)
{
  if (a1)
  {
    if ((*a1)-- == 1)
    {
      CFAllocatorRef Default = CFAllocatorGetDefault();
      CFAllocatorDeallocate(Default, a1);
    }
  }
}

void *OIErrorBarCreateFromDictionary(const __CFDictionary *a1)
{
  if (!a1) {
    return 0;
  }
  CFAllocatorRef Default = CFAllocatorGetDefault();
  CFLocaleRef v3 = CFAllocatorAllocate(Default, 24, 0);
  void *v3 = 1;
  v3[1] = 0x200000000;
  v3[2] = 0x3FF0000000000000;
  uint64_t valuePtr = 0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"kOIChartSeriesErrorBarTypeKey");
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberNSIntegerType, &valuePtr);
    int v5 = valuePtr;
  }
  else
  {
    int v5 = 0;
  }
  *((_DWORD *)v3 + 2) = v5;
  int v6 = 2;
  uint64_t v12 = 2;
  CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(a1, @"kOIChartSeriesErrorBarValueTypeKey");
  if (v7)
  {
    CFNumberGetValue(v7, kCFNumberNSIntegerType, &v12);
    int v6 = v12;
  }
  *((_DWORD *)v3 + 3) = v6;
  uint64_t v11 = 0x3FF0000000000000;
  CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(a1, @"kOIChartSeriesErrorBarValueKey");
  if (v8)
  {
    CFNumberGetValue(v8, kCFNumberCGFloatType, &v11);
    double v9 = *(double *)&v11;
  }
  else
  {
    double v9 = 1.0;
  }
  *((double *)v3 + 2) = v9;
  return v3;
}

uint64_t OIErrorBarSetType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 8) = a2;
  return result;
}

uint64_t OIErrorBarSetValueType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 12) = a2;
  return result;
}

uint64_t OIErrorBarSetValue(uint64_t result, double a2)
{
  *(double *)(result + 16) = a2;
  return result;
}

uint64_t OIErrorBarGetType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t OIErrorBarGetValueType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

double OIErrorBarGetValue(uint64_t a1)
{
  return *(double *)(a1 + 16);
}

void *_OIAxisRetain(uint64_t a1, void *a2)
{
  double result = a2;
  ++*a2;
  return result;
}

void _OIAxisRelease(uint64_t a1, void *a2)
{
}

char *_OIAxisCreate()
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  v1 = (char *)CFAllocatorAllocate(Default, 176, 0);
  *(void *)v1 = 1;
  *((void *)v1 + 12) = 0;
  v1[72] = 0;
  *(_OWORD *)(v1 + 8) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *((void *)v1 + 15) = 0;
  *((void *)v1 + 16) = 0;
  *((void *)v1 + 14) = 0;
  v1[104] = 1;
  v1[136] = 0;
  *((void *)v1 + 19) = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
  *((void *)v1 + 18) = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
  *((void *)v1 + 20) = 0x3FF0000000000000;
  v1[168] = 0;
  return v1;
}

double OIAxisCreateWithLabelCount(uint64_t a1)
{
  uint64_t v2 = _OIAxisCreate();
  *((void *)v2 + 2) = 0;
  *((void *)v2 + 5) = 0;
  double result = (double)a1;
  *((double *)v2 + 6) = (double)a1;
  *((void *)v2 + 7) = 0x3FF0000000000000;
  return result;
}

double OIAxisCreateWithRange(double a1, double a2)
{
  CFAllocatorRef v4 = _OIAxisCreate();
  *((void *)v4 + 2) = 1;
  *((double *)v4 + 5) = a1;
  *((double *)v4 + 6) = a2;
  double result = fabs((a2 - a1) / 5.0);
  *((double *)v4 + 7) = result;
  return result;
}

void OIAxisRelease(void *a1)
{
  if (a1)
  {
    if ((*a1)-- == 1)
    {
      CFLocaleRef v3 = (const void *)a1[1];
      if (v3) {
        CFRelease(v3);
      }
      CFAllocatorRef v4 = (const void *)a1[4];
      if (v4) {
        CFRelease(v4);
      }
      int v5 = (const void *)a1[12];
      if (v5) {
        CFRelease(v5);
      }
      int v6 = (const void *)a1[14];
      if (v6) {
        CFRelease(v6);
      }
      CFNumberRef v7 = (CGColor *)a1[18];
      if (v7) {
        CGColorRelease(v7);
      }
      CFNumberRef v8 = (CGColor *)a1[19];
      if (v8) {
        CGColorRelease(v8);
      }
      double v9 = (const void *)a1[15];
      if (v9) {
        CFRelease(v9);
      }
      uint64_t v10 = (const void *)a1[16];
      if (v10) {
        CFRelease(v10);
      }
      CFAllocatorRef Default = CFAllocatorGetDefault();
      CFAllocatorDeallocate(Default, a1);
    }
  }
}

uint64_t _OIAxisGetMinMaxFromArray(uint64_t result, double *a2, double *a3)
{
  if (result)
  {
    CFArrayRef v5 = (const __CFArray *)result;
    double result = CFArrayGetCount((CFArrayRef)result);
    if (result < 1)
    {
      double v9 = 2.22507386e-308;
      double v8 = 1.79769313e308;
    }
    else
    {
      uint64_t v6 = result;
      CFIndex v7 = 0;
      double v8 = 1.79769313e308;
      double v9 = 2.22507386e-308;
      do
      {
        double valuePtr = 0.0;
        ValueAtIndedouble x = (const __CFNumber *)CFArrayGetValueAtIndex(v5, v7);
        double result = CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
        if (valuePtr > v9) {
          double v9 = valuePtr;
        }
        if (valuePtr < v8) {
          double v8 = valuePtr;
        }
        ++v7;
      }
      while (v6 != v7);
    }
    double v11 = 0.0;
    if (v8 != 1.79769313e308) {
      double v11 = v8;
    }
    double v12 = 1.0;
    if (v9 != 2.22507386e-308) {
      double v12 = v9;
    }
  }
  else
  {
    double v11 = 0.0;
    double v12 = 0.0;
  }
  *a2 = v11;
  *a3 = v12;
  return result;
}

CFNumberRef OIAxisUpdateWithDictionaryDescription(const __CFNumber *result, CFDictionaryRef theDict)
{
  if (!result || !theDict) {
    return result;
  }
  uint64_t v3 = (uint64_t)result;
  double v61 = 0.0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"kOIChartAxisValueTypeKey");
  if (Value)
  {
    LODWORD(valuePtr) = 0;
    if (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
    {
      uint64_t v5 = 3;
      if (LODWORD(valuePtr) != 3) {
        uint64_t v5 = 1;
      }
      uint64_t v6 = 2;
      if (LODWORD(valuePtr) != 2) {
        uint64_t v6 = v5;
      }
      *(void *)(v3 + 16) = v6;
    }
  }
  CFArrayRef v7 = (const __CFArray *)CFDictionaryGetValue(theDict, @"kOIChartAxisValuesKey");
  if (v7)
  {
    CFArrayRef v8 = v7;
    CFIndex Count = CFArrayGetCount(v7);
    CGMutablePathRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        ValueAtIndedouble x = CFArrayGetValueAtIndex(v8, i);
        CFTypeID v13 = CFGetTypeID(ValueAtIndex);
        if (v13 == CFNumberGetTypeID())
        {
          CFArrayInsertValueAtIndex(Mutable, i, ValueAtIndex);
        }
        else
        {
          LODWORD(valuePtr) = 0;
          CFNumberRef v14 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
          CFArrayInsertValueAtIndex(Mutable, i, v14);
          CFRelease(v14);
        }
      }
    }
  }
  else
  {
    CGMutablePathRef Mutable = 0;
  }
  *(void *)(v3 + 112) = Mutable;
  uint64_t v15 = CFDictionaryGetValue(theDict, @"kOIChartAxisLabelsKey");
  *(void *)(v3 + 96) = v15;
  if (v15) {
    CFRetain(v15);
  }
  if (*(void *)(v3 + 24) != 3)
  {
    uint64_t v16 = *(void *)(v3 + 16);
    switch(v16)
    {
      case 3:
        goto LABEL_25;
      case 2:
        CFArrayRef v24 = *(const __CFArray **)(v3 + 96);
        if (v24)
        {
          CFIndex v25 = CFArrayGetCount(v24);
          *(_OWORD *)(v3 + 40) = xmmword_23EF9FD00;
          if (v25 < 1)
          {
            *(void *)(v3 + 56) = 0x7FEFFFFFFFFFFFFFLL;
            double v31 = 2.22507386e-308;
            double v37 = 1.79769313e308;
            double v30 = 1.79769313e308;
          }
          else
          {
            uint64_t v26 = v25;
            for (CFIndex j = 0; j != v26; ++j)
            {
              double valuePtr = 0.0;
              CFNumberRef v28 = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 96), j);
              CFNumberGetValue(v28, kCFNumberCGFloatType, &valuePtr);
              double v29 = valuePtr;
              double v30 = *(double *)(v3 + 40);
              if (valuePtr < v30)
              {
                *(double *)(v3 + 40) = valuePtr;
                double v30 = v29;
              }
              double v31 = *(double *)(v3 + 48);
              if (v29 > v31)
              {
                *(double *)(v3 + 48) = v29;
                double v31 = v29;
              }
            }
            *(void *)(v3 + 56) = 0x7FEFFFFFFFFFFFFFLL;
            uint64_t v32 = v26 - 2;
            if (v26 < 2)
            {
              double v37 = 1.79769313e308;
            }
            else
            {
              CFIndex v33 = 0;
              do
              {
                double v59 = 0.0;
                double valuePtr = 0.0;
                CFNumberRef v34 = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 96), v33);
                CFNumberGetValue(v34, kCFNumberCGFloatType, &valuePtr);
                CFNumberRef v35 = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 96), ++v33);
                CFNumberGetValue(v35, kCFNumberCGFloatType, &v59);
                if (v59 - valuePtr != 0.0)
                {
                  double v36 = vabdd_f64(v59, valuePtr);
                  if (v36 < *(double *)(v3 + 56)) {
                    *(double *)(v3 + 56) = v36;
                  }
                }
              }
              while (v33 - 1 != v32);
              double v30 = *(double *)(v3 + 40);
              double v31 = *(double *)(v3 + 48);
              double v37 = *(double *)(v3 + 56);
            }
          }
          *(void *)(v3 + 88) = (uint64_t)(ceil((v31 - v30) / v37) + 1.0);
          *(unsigned char *)(v3 + 104) = 1;
        }
        else
        {
          double v39 = *(double *)(v3 + 40);
          double v38 = *(double *)(v3 + 48);
          double v40 = (v38 - v39) / 6.0;
          double v41 = v39 - v40;
          double v42 = v38 + v40;
          *(double *)(v3 + 40) = v41;
          *(double *)(v3 + 48) = v42;
          *(double *)(v3 + 56) = v40;
          *(void *)(v3 + 88) = (uint64_t)(ceil((v42 - v41) / v40) + 1.0);
        }
        break;
      case 1:
LABEL_25:
        OIAxisImproveAxisRange(v3);
        double v59 = 0.0;
        double valuePtr = 0.0;
        _OIAxisGetMinMaxFromArray(*(void *)(v3 + 112), &valuePtr, &v59);
        if (valuePtr != 0.0 || v59 != 0.0) {
          _OIAxisImproveAxisRange(&valuePtr, &v59, 0);
        }
        CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"kOIChartAxisMinKey");
        double v61 = 0.0;
        if (!v17 || (CFNumberGetValue(v17, kCFNumberCGFloatType, &v61), double v18 = v61, v61 == 0.0))
        {
          if (!*(void *)(v3 + 112))
          {
LABEL_33:
            CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"kOIChartAxisMaxKey");
            double v61 = 0.0;
            if (!v19 || (CFNumberGetValue(v19, kCFNumberCGFloatType, &v61), double v20 = v61, v61 == 0.0))
            {
              if (!*(void *)(v3 + 112)) {
                goto LABEL_38;
              }
              double v20 = v59;
            }
            *(double *)(v3 + 48) = v20;
LABEL_38:
            CFNumberRef v21 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"kOIChartAxisUnitKey");
            if (v21)
            {
              double v61 = 0.0;
              CFNumberGetValue(v21, kCFNumberCGFloatType, &v61);
              if (v61 > 0.0) {
                *(double *)(v3 + 56) = v61;
              }
            }
            CFNumberRef v22 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"kOIChartAxisHasLogarithmicScaleKey");
            if (v22) {
              CFNumberGetValue(v22, kCFNumberSInt8Type, (void *)(v3 + 72));
            }
            CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"kOIChartAxisCenterLabelsKey");
            if (v23) {
              CFNumberGetValue(v23, kCFNumberSInt8Type, (void *)(v3 + 104));
            }
            break;
          }
          double v18 = valuePtr;
        }
        *(double *)(v3 + 40) = v18;
        goto LABEL_33;
    }
  }
  CFNumberRef v43 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"kOIChartAxisHideTextKey");
  if (v43) {
    CFNumberGetValue(v43, kCFNumberSInt8Type, (void *)(v3 + 136));
  }
  CGSize v44 = (CGColor *)CFDictionaryGetValue(theDict, @"kOIChartStrokeColorKey");
  if (v44)
  {
    CTFontRef v45 = v44;
    uint64_t v46 = *(CGColor **)(v3 + 144);
    if (v46) {
      CGColorRelease(v46);
    }
    *(void *)(v3 + 144) = CGColorRetain(v45);
  }
  CFNumberRef v47 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"kOIChartStrokeWidthKey");
  if (v47) {
    CFNumberGetValue(v47, kCFNumberCGFloatType, (void *)(v3 + 160));
  }
  double v48 = CFDictionaryGetValue(theDict, @"kOIChartLabelKey");
  *(void *)(v3 + 32) = v48;
  if (v48) {
    CFRetain(v48);
  }
  CFStringRef v49 = CFDictionaryGetValue(theDict, @"kOIChartAxisValueFormatKey");
  *(void *)(v3 + 120) = v49;
  if (v49) {
    CFRetain(v49);
  }
  uint64_t v50 = CFDictionaryGetValue(theDict, @"kOIChartAxisCustomFormatterKey");
  *(void *)(v3 + 128) = v50;
  if (v50) {
    CFRetain(v50);
  }
  double v51 = (CGColor *)CFDictionaryGetValue(theDict, @"kOIChartTextColorKey");
  if (v51)
  {
    double v52 = v51;
    double v53 = *(CGColor **)(v3 + 152);
    if (v53) {
      CGColorRelease(v53);
    }
    *(void *)(v3 + 152) = CGColorRetain(v52);
  }
  double result = (const __CFNumber *)CFDictionaryGetValue(theDict, @"kOIChartAxisDrawMajorGridlines");
  if (result) {
    double result = (const __CFNumber *)CFNumberGetValue(result, kCFNumberSInt8Type, (void *)(v3 + 168));
  }
  double v54 = *(double *)(v3 + 40);
  double v55 = *(double *)(v3 + 48);
  if (v54 <= v55)
  {
    double v56 = *(double *)(v3 + 48);
    if (v54 == v55)
    {
      *(_OWORD *)(v3 + 40) = xmmword_23EF9FD10;
      double v54 = 0.0;
      double v56 = 100.0;
    }
  }
  else
  {
    *(double *)(v3 + 40) = v55;
    *(double *)(v3 + 48) = v54;
    double v56 = v54;
    double v54 = v55;
  }
  double v57 = *(double *)(v3 + 56);
  double v58 = vabdd_f64(v56, v54) / 100.0;
  if (v57 < v58)
  {
    *(double *)(v3 + 56) = v58;
    double v57 = v58;
  }
  if (v57 == 0.0)
  {
    double v57 = (fabs(v56) - fabs(v54)) / 5.0;
    *(double *)(v3 + 56) = v57;
  }
  if (v57 < 0.0) {
    *(double *)(v3 + 56) = fabs(v57);
  }
  if (*(unsigned char *)(v3 + 72) && v54 <= 0.0 && v56 > 1.0) {
    *(void *)(v3 + 40) = 0x3FF0000000000000;
  }
  return result;
}

void OIAxisImproveAxisRange(uint64_t a1)
{
  if (a1 && (*(void *)(a1 + 16) | 2) == 3 && *(void *)(a1 + 24) != 3) {
    _OIAxisImproveAxisRange((double *)(a1 + 40), (double *)(a1 + 48), (double *)(a1 + 56));
  }
}

void _OIAxisImproveAxisRange(double *a1, double *a2, double *a3)
{
  double v10 = 0.0;
  double v11 = 0.0;
  _OIAxisRoundUpValue(&v10, *a2);
  *(void *)a2 = v6;
  _OIAxisRoundDownValue(&v11, *a1);
  *a1 = v7;
  double v8 = *a2;
  if (v7 > 0.0 && v8 > 0.0 && v7 < v8 * 9.0 / 10.0)
  {
    *a1 = 0.0;
    double v8 = *a2;
    double v7 = 0.0;
LABEL_10:
    if (v8 != v7) {
      goto LABEL_16;
    }
    if (v8 > 0.0)
    {
      *a1 = 0.0;
      if (!a3) {
        return;
      }
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  if (v7 >= 0.0 || v8 >= 0.0 || v8 <= v7 * 9.0 / 10.0) {
    goto LABEL_10;
  }
  *a2 = 0.0;
  double v7 = *a1;
  if (*a1 != 0.0)
  {
LABEL_16:
    if (!a3) {
      return;
    }
    goto LABEL_17;
  }
LABEL_14:
  if (v7 < 0.0)
  {
    *a2 = 0.0;
    goto LABEL_16;
  }
  *a2 = 1.0;
  if (!a3) {
    return;
  }
LABEL_17:
  double v9 = v11;
  if (v10 > v11) {
    double v9 = v10;
  }
  *a3 = v9;
}

void _OIAxisRoundUpValue(double *a1, double a2)
{
  double v4 = 0.0;
  if (a2 == 0.0) {
    goto LABEL_24;
  }
  long double v5 = fabs(a2);
  double v6 = log10(v5);
  double v7 = __exp10(trunc(v6));
  double v8 = v5 / v7;
  double v9 = 2.0;
  if (a2 >= 0.0)
  {
    if (v8 < 2.0)
    {
      double v10 = v7 * 0.4;
      goto LABEL_21;
    }
    double v9 = 4.0;
    if (v8 >= 4.0)
    {
      double v9 = 5.0;
      double v10 = v7;
      if (v8 >= 5.0)
      {
        double v9 = 6.0;
        double v10 = v7 + v7;
        if (v8 >= 6.0)
        {
          double v9 = 8.0;
          if (v8 >= 8.0) {
            double v9 = 10.0;
          }
        }
      }
      goto LABEL_21;
    }
LABEL_10:
    double v10 = v7;
    goto LABEL_21;
  }
  if (v8 >= 2.0)
  {
    double v9 = 4.0;
    if (v8 >= 4.0)
    {
      double v10 = v7;
      if (v8 >= 5.0)
      {
        double v9 = 6.0;
        double v10 = v7 + v7;
        if (v8 >= 6.0)
        {
          if (v8 >= 8.0) {
            double v9 = 8.0;
          }
        }
        else
        {
          double v9 = 5.0;
        }
      }
      goto LABEL_21;
    }
    double v9 = 2.0;
    goto LABEL_10;
  }
  double v10 = v7 * 0.4;
  double v9 = 0.0;
LABEL_21:
  double v11 = fabs(v7 * v9);
  if (!a1) {
    return;
  }
  BOOL v12 = v11 == INFINITY;
  double v4 = 2.0e307;
  if (!v12) {
    double v4 = v10;
  }
LABEL_24:
  *a1 = v4;
}

void _OIAxisRoundDownValue(double *a1, double a2)
{
  double v4 = 0.0;
  if (a2 == 0.0) {
    goto LABEL_24;
  }
  long double v5 = fabs(a2);
  double v6 = log10(v5);
  double v7 = __exp10(trunc(v6));
  double v8 = v5 / v7;
  double v9 = 2.0;
  if (a2 < 0.0)
  {
    if (v8 < 2.0)
    {
      double v10 = v7 * 0.4;
      goto LABEL_21;
    }
    double v9 = 4.0;
    if (v8 >= 4.0)
    {
      double v9 = 5.0;
      double v10 = v7;
      if (v8 >= 5.0)
      {
        double v9 = 6.0;
        double v10 = v7 + v7;
        if (v8 >= 6.0)
        {
          double v9 = 8.0;
          if (v8 >= 8.0) {
            double v9 = 10.0;
          }
        }
      }
      goto LABEL_21;
    }
LABEL_10:
    double v10 = v7;
    goto LABEL_21;
  }
  if (v8 >= 2.0)
  {
    double v9 = 4.0;
    if (v8 >= 4.0)
    {
      double v10 = v7;
      if (v8 >= 5.0)
      {
        double v9 = 6.0;
        double v10 = v7 + v7;
        if (v8 >= 6.0)
        {
          if (v8 >= 8.0) {
            double v9 = 8.0;
          }
        }
        else
        {
          double v9 = 5.0;
        }
      }
      goto LABEL_21;
    }
    double v9 = 2.0;
    goto LABEL_10;
  }
  double v10 = v7 * 0.4;
  double v9 = 0.0;
LABEL_21:
  double v11 = fabs(v7 * v9);
  if (!a1) {
    return;
  }
  BOOL v12 = v11 == INFINITY;
  double v4 = 2.0e307;
  if (!v12) {
    double v4 = v10;
  }
LABEL_24:
  *a1 = v4;
}

double _OIAxisBestUnit(double a1, double a2, double a3, double a4)
{
  if (a4 <= a3) {
    return a3;
  }
  else {
    return a4;
  }
}

void OIAxisUpdateScaleForLength(uint64_t a1, double a2)
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      double v4 = *(double *)(a1 + 48) - *(double *)(a1 + 40);
      if (v4 != 1.0)
      {
        float v5 = v4;
        double v6 = log10f(v5);
LABEL_12:
        a2 = a2 / v6;
      }
    }
    else
    {
      if (*(void *)(a1 + 16) == 2)
      {
        double v6 = (double)*(uint64_t *)(a1 + 88);
        goto LABEL_12;
      }
      if (!*(unsigned char *)(a1 + 104) && *(void *)(a1 + 96))
      {
        double v6 = *(double *)(a1 + 48) + -1.0 - *(double *)(a1 + 40);
        goto LABEL_12;
      }
      double v8 = *(double *)(a1 + 40);
      double v7 = *(double *)(a1 + 48);
      if (v7 != v8)
      {
        double v6 = v7 - v8;
        goto LABEL_12;
      }
    }
    *(double *)(a1 + 64) = a2;
  }
}

double OIAxisConvertValueToLocal(uint64_t a1, double result)
{
  double v2 = result;
  if (a1)
  {
    if (*(void *)(a1 + 16) == 2)
    {
      double v4 = *(double *)(a1 + 64);
      double v5 = (v2 - *(double *)(a1 + 40)) / *(double *)(a1 + 56);
    }
    else
    {
      double result = *(double *)(a1 + 40);
      double v5 = v2 - result;
      if (*(unsigned char *)(a1 + 72) && v5 > 0.0)
      {
        if (v5 == 1.0) {
          return result;
        }
        float v6 = v5;
        double v4 = log10f(v6);
        double v5 = *(double *)(a1 + 64);
      }
      else
      {
        double v4 = *(double *)(a1 + 64);
      }
    }
    return round(v5 * v4);
  }
  return result;
}

uint64_t OIAxisSetType(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  return result;
}

uint64_t OIAxisGetType(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t OIAxisSetSubType(uint64_t result, uint64_t a2)
{
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t OIAxisGetSubType(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t OIAxisSetMinValue(uint64_t result, double a2)
{
  *(double *)(result + 40) = a2;
  return result;
}

double OIAxisGetMinValue(uint64_t a1)
{
  return *(double *)(a1 + 40);
}

uint64_t OIAxisSetUnit(uint64_t result, double a2)
{
  *(double *)(result + 56) = a2;
  return result;
}

double OIAxisGetUnit(uint64_t a1)
{
  return *(double *)(a1 + 56);
}

double OIAxisGetScale(uint64_t a1)
{
  return *(double *)(a1 + 64);
}

CFArrayRef OIAxisGetValueCount(void *a1)
{
  uint64_t v1 = a1[2];
  if (v1 == 2) {
    return (const __CFArray *)a1[11];
  }
  if (v1) {
    return 0;
  }
  CFArrayRef result = (const __CFArray *)a1[12];
  if (result) {
    return (const __CFArray *)CFArrayGetCount(result);
  }
  return result;
}

uint64_t OIAxisAreLabelsCentered(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 104);
}

uint64_t OIAxisIsLogarithmic(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 72);
}

uint64_t OIAxisIsHidden(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 136);
}

uint64_t OIAxisGetLabel(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t OIAxisGetLabels(uint64_t a1)
{
  return *(void *)(a1 + 96);
}

uint64_t OIAxisGetValues(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

uint64_t OIAxisGetTextColor(uint64_t a1)
{
  return *(void *)(a1 + 152);
}

CGColor *OIAxisSetStrokeColor(uint64_t a1, CGColorRef color)
{
  CFArrayRef result = *(CGColor **)(a1 + 144);
  if (result != color)
  {
    if (result) {
      CGColorRelease(result);
    }
    CFArrayRef result = CGColorRetain(color);
    *(void *)(a1 + 144) = result;
  }
  return result;
}

uint64_t OIAxisGetStrokeColor(uint64_t a1)
{
  return *(void *)(a1 + 144);
}

double OIAxisGetStrokeWidth(uint64_t a1)
{
  return *(double *)(a1 + 160);
}

uint64_t OIAxisGetICUFormating(uint64_t a1)
{
  return *(void *)(a1 + 120);
}

uint64_t OIAxisGetCustomNumberFormatter(uint64_t a1)
{
  return *(void *)(a1 + 128);
}

uint64_t OIAxisSetDrawMajorGridlines(uint64_t result, char a2)
{
  *(unsigned char *)(result + 168) = a2;
  return result;
}

uint64_t OIAxisGetDrawMajorGridlines(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 168);
}

void OIRenderDoughnutInChart(uint64_t a1, CFArrayRef theArray)
{
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count)
    {
      uint64_t v5 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      double PlotArea = OIChartGetPlotArea(a1);
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      int v14 = OIAxisAreLabelsCentered(a1);
      if (v5 >= 1)
      {
        int v15 = v14;
        CFIndex v16 = 0;
        uint64_t v17 = 0;
        do
        {
          ValueAtIndedouble x = CFArrayGetValueAtIndex(theArray, v16);
          CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
          if (Values)
          {
            CFIndex v20 = CFArrayGetCount(Values);
            uint64_t v21 = v20 <= v17 ? v17 : v20;
            if (v20) {
              uint64_t v17 = v21;
            }
          }
          ++v16;
        }
        while (v5 != v16);
        if (v17)
        {
          CGContextSaveGState(Type);
          if (v11 >= v13) {
            double v22 = v13;
          }
          else {
            double v22 = v11;
          }
          if (v15)
          {
            v57.width = 0.0;
            v57.height = -4.0;
            CGContextSetShadow(Type, v57, 6.0);
          }
          if (v17 >= 1)
          {
            CFIndex v23 = 0;
            double v54 = v9 + v13 * 0.5;
            double v55 = PlotArea + v11 * 0.5;
            double v53 = v22 * 0.9 * 0.5 / (double)(v17 + 1);
            do
            {
              CFIndex v24 = 0;
              double v25 = 0.0;
              do
              {
                uint64_t v26 = CFArrayGetValueAtIndex(theArray, v24);
                CFArrayRef v27 = (const __CFArray *)OISeriesGetValues((uint64_t)v26);
                if (v27)
                {
                  CFArrayRef v28 = v27;
                  if (v23 < CFArrayGetCount(v27))
                  {
                    CFNumberRef v29 = (const __CFNumber *)CFArrayGetValueAtIndex(v28, v23);
                    double valuePtr = 0.0;
                    CFNumberGetValue(v29, kCFNumberCGFloatType, &valuePtr);
                    double v25 = v25 + fabs(valuePtr);
                  }
                }
                ++v24;
              }
              while (v5 != v24);
              if (v25 == 0.0)
              {
                CFIndex v30 = v23 + 1;
              }
              else
              {
                CFIndex v31 = 0;
                double v32 = 1.57079633;
                double v33 = v53 * (double)(v23 + 1);
                double v34 = v53 * (double)(v23 + 2);
                do
                {
                  CFNumberRef v35 = CFArrayGetValueAtIndex(theArray, v31);
                  CFArrayRef v36 = (const __CFArray *)OISeriesGetValues((uint64_t)v35);
                  uint64_t TextColor = OILabelGetTextColor((uint64_t)v35);
                  uint64_t StrokeColor = OILabelGetStrokeColor((uint64_t)v35);
                  double Offset = OISeriesGetOffset((uint64_t)v35);
                  if (v36 && (double v40 = Offset, v23 < CFArrayGetCount(v36)))
                  {
                    CFNumberRef v41 = (const __CFNumber *)CFArrayGetValueAtIndex(v36, v23);
                    double valuePtr = 0.0;
                    CFNumberGetValue(v41, kCFNumberCGFloatType, &valuePtr);
                    double v42 = fabs(valuePtr);
                    double valuePtr = v42;
                    double v43 = 0.0;
                    double v44 = 0.0;
                    if (v23 >= v17 - 1)
                    {
                      __double2 v45 = __sincos_stret(v32 + v42 * -3.14159265 / v25);
                      double v43 = v40 * v45.__cosval;
                      double v44 = v40 * v45.__sinval;
                    }
                    CGFloat v46 = v55 + v43;
                    __double2 v47 = __sincos_stret(v32);
                    CGFloat v48 = v54 + v44;
                    CGContextMoveToPoint(Type, v46 + v33 * v47.__cosval, v48 + v33 * v47.__sinval);
                    CGContextAddLineToPoint(Type, v46 + v34 * v47.__cosval, v48 + v34 * v47.__sinval);
                    double v49 = v32 + valuePtr / v25 * -6.28318531;
                    CGContextAddArc(Type, v46, v48, v34, v32, v49, 1);
                    __double2 v50 = __sincos_stret(v49);
                    CGContextAddLineToPoint(Type, v46 + v33 * v50.__cosval, v48 + v33 * v50.__sinval);
                    CGContextAddArc(Type, v46, v48, v33, v49, v32, 0);
                    OISeriesSetupStrokeAndFillForContext((uint64_t)v35, Type);
                    if (StrokeColor | TextColor)
                    {
                      if (StrokeColor && TextColor)
                      {
                        CGPathDrawingMode v51 = kCGPathFillStroke;
                      }
                      else if (TextColor || !StrokeColor)
                      {
                        if (StrokeColor) {
                          BOOL v52 = 1;
                        }
                        else {
                          BOOL v52 = TextColor == 0;
                        }
                        if (v52) {
                          CGPathDrawingMode v51 = kCGPathFillStroke;
                        }
                        else {
                          CGPathDrawingMode v51 = kCGPathFill;
                        }
                      }
                      else
                      {
                        CGPathDrawingMode v51 = kCGPathStroke;
                      }
                      CGContextDrawPath(Type, v51);
                    }
                  }
                  else
                  {
                    double v49 = v32;
                  }
                  ++v31;
                  double v32 = v49;
                }
                while (v5 != v31);
                CFIndex v30 = v23 + 1;
              }
              CFIndex v23 = v30;
            }
            while (v30 != v17);
          }
          CGContextRestoreGState(Type);
        }
      }
    }
  }
}

char *OIChartCreate(const __CFAllocator *Default, CGContext *a2, double a3, double a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v5 = 0;
  if (a3 > 0.0 && a4 > 0.0)
  {
    CFAllocatorRef v8 = Default;
    if (!Default) {
      CFAllocatorRef Default = CFAllocatorGetDefault();
    }
    uint64_t v5 = (char *)CFAllocatorAllocate(Default, 312, 0);
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 88) = 0u;
    *(_OWORD *)(v5 + 216) = 0u;
    *(_OWORD *)(v5 + 232) = 0u;
    v5[104] = 1;
    *(void *)uint64_t v5 = 1;
    *((void *)v5 + 1) = v8;
    *((_DWORD *)v5 + 68) = 0;
    *((double *)v5 + 3) = a3;
    *((double *)v5 + 4) = a4;
    *((void *)v5 + 2) = CGContextRetain(a2);
    *((void *)v5 + 32) = 0;
    *((void *)v5 + 33) = 0;
    *((void *)v5 + 35) = 15;
    *((void *)v5 + 36) = 20;
    *((void *)v5 + 14) = OIColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);
    *((void *)v5 + 15) = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
    *((void *)v5 + 16) = 0x4000000000000000;
    *((void *)v5 + 17) = 0;
    *((void *)v5 + 18) = 0;
    *((void *)v5 + 19) = 0x3FF0000000000000;
    *((void *)v5 + 20) = 0;
    *((void *)v5 + 21) = 0;
    *((void *)v5 + 22) = 0x3FF0000000000000;
    *((void *)v5 + 23) = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
    v5[192] = 0;
    *((void *)v5 + 25) = -1;
    *((_WORD *)v5 + 148) = 0;
    double v9 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
    *((void *)v5 + 26) = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], &OIAxisDictionaryValueCallbacks);
    *((void *)v5 + 31) = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    double v10 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, v9, MEMORY[0x263EFFF90]);
    CFArrayAppendValue(*((CFMutableArrayRef *)v5 + 31), Mutable);
    CFRelease(Mutable);
    CFMutableDictionaryRef v12 = CFDictionaryCreateMutable(0, 0, v9, v10);
    CFArrayAppendValue(*((CFMutableArrayRef *)v5 + 31), v12);
    CFRelease(v12);
    *((void *)v5 + 38) = 0;
    OIChartSetupRendererMapping((uint64_t)v5);
  }
  return v5;
}

void OIChartRelease(void *ptr)
{
  if (ptr)
  {
    if ((*ptr)-- == 1)
    {
      uint64_t v3 = (CGContext *)ptr[2];
      if (v3) {
        CGContextRelease(v3);
      }
      double v4 = (CGColor *)ptr[14];
      if (v4) {
        CGColorRelease(v4);
      }
      uint64_t v5 = (CGColor *)ptr[15];
      if (v5) {
        CGColorRelease(v5);
      }
      float v6 = (CGColor *)ptr[17];
      if (v6) {
        CGColorRelease(v6);
      }
      double v7 = (CGColor *)ptr[18];
      if (v7) {
        CGColorRelease(v7);
      }
      CFAllocatorRef v8 = (CGColor *)ptr[20];
      if (v8) {
        CGColorRelease(v8);
      }
      double v9 = (CGColor *)ptr[21];
      if (v9) {
        CGColorRelease(v9);
      }
      double v10 = (CGColor *)ptr[23];
      if (v10) {
        CGColorRelease(v10);
      }
      double v11 = (const void *)ptr[26];
      if (v11) {
        CFRelease(v11);
      }
      CFMutableDictionaryRef v12 = (const void *)ptr[27];
      if (v12) {
        CFRelease(v12);
      }
      double v13 = (const void *)ptr[28];
      if (v13) {
        CFRelease(v13);
      }
      int v14 = (const void *)ptr[29];
      if (v14) {
        CFRelease(v14);
      }
      int v15 = (const void *)ptr[30];
      if (v15) {
        CFRelease(v15);
      }
      CFIndex v16 = (const void *)ptr[31];
      if (v16) {
        CFRelease(v16);
      }
      uint64_t v17 = (const void *)ptr[32];
      if (v17) {
        CFRelease(v17);
      }
      double v18 = (const void *)ptr[33];
      if (v18) {
        CFRelease(v18);
      }
      CFAllocatorRef Default = (const __CFAllocator *)ptr[1];
      if (!Default) {
        CFAllocatorRef Default = CFAllocatorGetDefault();
      }
      CFAllocatorDeallocate(Default, ptr);
    }
  }
}

CFArrayRef OIChartGetSeriesCount(uint64_t a1)
{
  CFArrayRef result = *(const __CFArray **)(a1 + 264);
  if (result) {
    return (const __CFArray *)CFArrayGetCount(result);
  }
  return result;
}

void OIChartAddLabel(uint64_t a1, void *value)
{
  if (value)
  {
    CFMutableDictionaryRef Mutable = *(__CFArray **)(a1 + 256);
    if (!Mutable)
    {
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &OILabelArrayCallbacks);
      *(void *)(a1 + 256) = Mutable;
    }
    CFArrayAppendValue(Mutable, value);
  }
}

void _OIChartAddSerieToRenderTree(uint64_t a1, const void *a2)
{
  CFArrayRef v3 = *(const __CFArray **)(a1 + 248);
  unsigned int v4 = OISeriesIsOnSecondaryAxis((uint64_t)a2);
  ValueAtIndedouble x = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v4);
  SubType = (const void *)OIAxisGetSubType((uint64_t)a2);
  CFNumberRef Value = (void *)CFDictionaryGetValue(ValueAtIndex, SubType);
  if (!Value)
  {
    CFNumberRef Value = CFArrayCreateMutable(0, 0, &OISeriesArrayCallbacks);
    CFDictionarySetValue(ValueAtIndex, SubType, Value);
    CFRelease(Value);
  }

  CFArrayAppendValue((CFMutableArrayRef)Value, a2);
}

void OIChartAddSeries(uint64_t a1, void *value)
{
  if (value)
  {
    CFMutableDictionaryRef Mutable = *(__CFArray **)(a1 + 264);
    if (!Mutable)
    {
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &OISeriesArrayCallbacks);
      *(void *)(a1 + 264) = Mutable;
    }
    CFArrayAppendValue(Mutable, value);
    _OIChartAddSerieToRenderTree(a1, value);
  }
}

CFIndex OIChartGetValueCountForAxis(uint64_t a1, uint64_t a2)
{
  CFArrayRef v2 = *(const __CFArray **)(a1 + 264);
  if (!v2) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 264));
  if (Count < 1) {
    return 0;
  }
  CFIndex v5 = Count;
  CFIndex v6 = 0;
  CFIndex v7 = 0;
  do
  {
    ValueAtIndedouble x = CFArrayGetValueAtIndex(v2, v6);
    if (OIAxisGetType((uint64_t)ValueAtIndex) == a2)
    {
      CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
      CFIndex v10 = CFArrayGetCount(Values);
      if (v10 > v7) {
        CFIndex v7 = v10;
      }
    }
    ++v6;
  }
  while (v5 != v6);
  return v7;
}

uint64_t OIChartGetSeries(uint64_t a1)
{
  return *(void *)(a1 + 264);
}

void OIChartDraw(uint64_t a1)
{
  _OIChartDrawCanvas(a1);
  CFStringRef Copy = 0;
  CFIndex v3 = 0;
  char v4 = 1;
  while (1)
  {
    char v5 = v4;
    ValueAtIndedouble x = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 248), v3);
    int64_t Count = CFDictionaryGetCount(ValueAtIndex);
    if (Count >= 1)
    {
      int64_t v8 = Count;
      if (Copy)
      {
        char v9 = 1;
        if (Count != 1) {
          goto LABEL_10;
        }
        CFIndex v10 = (const void **)malloc_type_calloc(1uLL, 8uLL, 0x6004044C4A2DFuLL);
        CFDictionaryGetKeysAndValues(ValueAtIndex, v10, 0);
        CFComparisonResult v11 = CFStringCompare(Copy, (CFStringRef)*v10, 1uLL);
        free(v10);
        if (v11) {
          goto LABEL_10;
        }
        goto LABEL_8;
      }
      CFMutableDictionaryRef v12 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(ValueAtIndex, v12, 0);
      CFStringRef Copy = CFStringCreateCopy(0, (CFStringRef)*v12);
      free(v12);
      if (v8 != 1) {
        break;
      }
    }
LABEL_8:
    char v4 = 0;
    char v9 = 0;
    CFIndex v3 = 1;
    if ((v5 & 1) == 0)
    {
      if (!Copy) {
        return;
      }
      goto LABEL_10;
    }
  }
  char v9 = 1;
  if (!Copy) {
    return;
  }
LABEL_10:
  if (!*(unsigned char *)(a1 + 296))
  {
    CFNumberRef Value = (void (*)(uint64_t))CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 216), Copy);
    if (Value) {
      Value(a1);
    }
    if (v9)
    {
      CFArrayRef v14 = *(const __CFArray **)(a1 + 264);
      CFIndex v15 = CFArrayGetCount(v14);
      CFIndex v16 = v15 - 1;
      if (v15 >= 1)
      {
        CFIndex v17 = v15;
        CFMutableDictionaryRef Mutable = 0;
        CFIndex v19 = 0;
        do
        {
          CFIndex v20 = CFArrayGetValueAtIndex(v14, v19);
          if (!Mutable) {
            CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &OISeriesArrayCallbacks);
          }
          SubType = (const void *)OIAxisGetSubType((uint64_t)v20);
          CFArrayAppendValue(Mutable, v20);
          if (v19 < v16
            && (double v22 = CFArrayGetValueAtIndex(v14, v19 + 1), (const void *)OIAxisGetSubType((uint64_t)v22) == SubType))
          {
            ++v19;
          }
          else
          {
            CFIndex v23 = (void (*)(uint64_t, __CFArray *, void))CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 232), SubType);
            if (v23)
            {
              CFIndex v24 = v23;
              unsigned int v25 = OISeriesIsOnSecondaryAxis((uint64_t)v20);
              v24(a1, Mutable, v25);
            }
            CFRelease(Mutable);
            CFMutableDictionaryRef Mutable = 0;
            ++v19;
          }
        }
        while (v19 != v17);
        if (Mutable) {
          CFRelease(Mutable);
        }
      }
    }
    else
    {
      CFIndex v26 = 0;
      char v27 = 1;
      do
      {
        char v28 = v27;
        CFDictionaryRef v29 = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 248), v26);
        int64_t v30 = CFDictionaryGetCount(v29);
        CFIndex v31 = (const void **)malloc_type_calloc(v30, 8uLL, 0x6004044C4A2DFuLL);
        double v32 = (const void **)malloc_type_calloc(v30, 8uLL, 0x6004044C4A2DFuLL);
        CFDictionaryGetKeysAndValues(v29, v31, v32);
        if (v30 >= 1)
        {
          double v33 = v31;
          double v34 = v32;
          do
          {
            CFNumberRef v35 = *v34;
            CFArrayRef v36 = (void (*)(uint64_t, const void *, CFIndex))CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 232), *v33);
            if (v36) {
              v36(a1, v35, v26);
            }
            ++v34;
            ++v33;
            --v30;
          }
          while (v30);
        }
        free(v31);
        free(v32);
        char v27 = 0;
        CFIndex v26 = 1;
      }
      while ((v28 & 1) != 0);
    }
    double v37 = (void (*)(uint64_t))CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 224), Copy);
    if (v37) {
      v37(a1);
    }
  }
  if (!*(unsigned char *)(a1 + 297))
  {
    double v38 = (void (*)(uint64_t))CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 240), Copy);
    if (v38) {
      v38(a1);
    }
  }
  if (!*(unsigned char *)(a1 + 296)) {
    _OIChartDrawLabels(a1);
  }

  CFRelease(Copy);
}

void _OIChartDrawCanvas(uint64_t a1)
{
  CGFloat v2 = *(double *)(a1 + 24);
  CGFloat v3 = *(double *)(a1 + 32);
  char v4 = *(CGColor **)(a1 + 112);
  if (v4)
  {
    CGContextSetFillColorWithColor(*(CGContextRef *)(a1 + 16), v4);
    v12.origin.double x = 0.0;
    v12.origin.y = 0.0;
    v12.size.width = v2;
    v12.size.height = v3;
    CGContextFillRect(*(CGContextRef *)(a1 + 16), v12);
  }
  char v5 = *(CGColor **)(a1 + 120);
  if (v5)
  {
    CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 16), v5);
    CGContextSetLineWidth(*(CGContextRef *)(a1 + 16), *(CGFloat *)(a1 + 128));
    CFIndex v6 = *(CGContext **)(a1 + 16);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    CGFloat v9 = v2;
    CGFloat v10 = v3;
    CGContextStrokeRect(v6, *(CGRect *)&v7);
  }
}

void _OIChartDrawLabels(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(a1 + 256);
  if (v2)
  {
    CFIndex Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      for (CFIndex i = 0; i != v4; ++i)
      {
        ValueAtIndedouble x = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 256), i);
        OILabelRenderInContext((uint64_t)ValueAtIndex, *(CGContextRef *)(a1 + 16));
      }
    }
  }
}

CGImageRef OIChartCreateImage(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 272)) {
    return 0;
  }
  else {
    return CGBitmapContextCreateImage(*(CGContextRef *)(a1 + 16));
  }
}

CFTypeRef OIChartSetBackgroundAxisRendererMapping(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 216);
  if (result != cf)
  {
    if (result) {
      CFRelease(result);
    }
    CFTypeRef result = CFRetain(cf);
    *(void *)(a1 + 216) = result;
  }
  return result;
}

CFTypeRef OIChartSetForegroundAxisRendererMapping(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 224);
  if (result != cf)
  {
    if (result) {
      CFRelease(result);
    }
    CFTypeRef result = CFRetain(cf);
    *(void *)(a1 + 224) = result;
  }
  return result;
}

CFTypeRef OIChartSetChartRendererMapping(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 232);
  if (result != cf)
  {
    if (result) {
      CFRelease(result);
    }
    CFTypeRef result = CFRetain(cf);
    *(void *)(a1 + 232) = result;
  }
  return result;
}

CFTypeRef OIChartSetLegendRendererMapping(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 240);
  if (result != cf)
  {
    if (result) {
      CFRelease(result);
    }
    CFTypeRef result = CFRetain(cf);
    *(void *)(a1 + 240) = result;
  }
  return result;
}

double OIChartGetSize(uint64_t a1)
{
  return *(double *)(a1 + 24);
}

uint64_t OIChartSetStatus(uint64_t result, int a2)
{
  *(_DWORD *)(result + 272) = a2;
  return result;
}

uint64_t OIChartGetStatus(uint64_t a1)
{
  return *(unsigned int *)(a1 + 272);
}

double *OIChartSetPlotArea(double *result, double a2, double a3, double a4, double a5)
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  return result;
}

double OIChartGetPlotArea(uint64_t a1)
{
  return *(double *)(a1 + 40);
}

double *OIChartSetLegendArea(double *result, double a2, double a3, double a4, double a5)
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

double OIChartGetLegendArea(uint64_t a1)
{
  return *(double *)(a1 + 72);
}

void OIChartSetAxis(uint64_t a1, const void *a2, const void *a3)
{
}

const void *OIChartGetAxis(uint64_t a1, const void *a2)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 208), a2);
}

uint64_t OIChartSetUseShadows(uint64_t result, char a2)
{
  *(unsigned char *)(result + 104) = a2;
  return result;
}

CGColor *OIChartSetCanvasFillColor(uint64_t a1, CGColorRef color)
{
  CFTypeRef result = *(CGColor **)(a1 + 112);
  if (result != color)
  {
    if (result) {
      CGColorRelease(result);
    }
    CFTypeRef result = CGColorRetain(color);
    *(void *)(a1 + 112) = result;
  }
  return result;
}

CGColor *OIChartSetCanvasStrokeColor(uint64_t a1, CGColorRef color)
{
  CFTypeRef result = *(CGColor **)(a1 + 120);
  if (result != color)
  {
    if (result) {
      CGColorRelease(result);
    }
    CFTypeRef result = CGColorRetain(color);
    *(void *)(a1 + 120) = result;
  }
  return result;
}

uint64_t OIChartSetCanvasStrokeWidth(uint64_t result, double a2)
{
  *(double *)(result + 128) = a2;
  return result;
}

double OIChartGetCanvasStrokeWidth(uint64_t a1)
{
  return *(double *)(a1 + 128);
}

CGColor *OIChartSetPlotFillColor(uint64_t a1, CGColorRef color)
{
  CFTypeRef result = *(CGColor **)(a1 + 136);
  if (result != color)
  {
    if (result) {
      CGColorRelease(result);
    }
    CFTypeRef result = CGColorRetain(color);
    *(void *)(a1 + 136) = result;
  }
  return result;
}

uint64_t OIChartGetPlotFillColor(uint64_t a1)
{
  return *(void *)(a1 + 136);
}

uint64_t OIChartSetPlotStrokeWidth(uint64_t result, double a2)
{
  *(double *)(result + 152) = a2;
  return result;
}

double OIChartGetPlotStrokeWidth(uint64_t a1)
{
  return *(double *)(a1 + 152);
}

CGColor *OIChartSetLegendFillColor(uint64_t a1, CGColorRef color)
{
  CFTypeRef result = *(CGColor **)(a1 + 160);
  if (result != color)
  {
    if (result) {
      CGColorRelease(result);
    }
    CFTypeRef result = CGColorRetain(color);
    *(void *)(a1 + 160) = result;
  }
  return result;
}

uint64_t OIChartGetLegendFillColor(uint64_t a1)
{
  return *(void *)(a1 + 160);
}

CGColor *OIChartSetLegendStrokeColor(uint64_t a1, CGColorRef color)
{
  CFTypeRef result = *(CGColor **)(a1 + 168);
  if (result != color)
  {
    if (result) {
      CGColorRelease(result);
    }
    CFTypeRef result = CGColorRetain(color);
    *(void *)(a1 + 168) = result;
  }
  return result;
}

uint64_t OIChartGetLegendStrokeColor(uint64_t a1)
{
  return *(void *)(a1 + 168);
}

CGColor *OIChartSetLegendTextColor(uint64_t a1, CGColorRef color)
{
  CFTypeRef result = *(CGColor **)(a1 + 184);
  if (result != color)
  {
    if (result) {
      CGColorRelease(result);
    }
    CFTypeRef result = CGColorRetain(color);
    *(void *)(a1 + 184) = result;
  }
  return result;
}

uint64_t OIChartGetLegendTextColor(uint64_t a1)
{
  return *(void *)(a1 + 184);
}

uint64_t OIChartSetLegendStrokeWidth(uint64_t result, double a2)
{
  *(double *)(result + 176) = a2;
  return result;
}

double OIChartGetLegendStrokeWidth(uint64_t a1)
{
  return *(double *)(a1 + 176);
}

uint64_t OIChartSetLegendHasShadow(uint64_t result, char a2)
{
  *(unsigned char *)(result + 192) = a2;
  return result;
}

uint64_t OIChartGetLegendHasShadow(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 192);
}

uint64_t OIChartSetLegendPlacement(uint64_t result, uint64_t a2)
{
  *(void *)(result + 200) = a2;
  return result;
}

uint64_t OIChartGetLegendPlacement(uint64_t a1)
{
  return *(void *)(a1 + 200);
}

uint64_t OIChartSetRotation(uint64_t result, uint64_t a2)
{
  *(void *)(result + 288) = a2 % 45;
  return result;
}

double OIChartGetRotation(uint64_t a1)
{
  return (double)*(uint64_t *)(a1 + 288);
}

uint64_t OIChartSetElevation(uint64_t result, uint64_t a2)
{
  *(void *)(result + 280) = a2 % 90;
  return result;
}

double OIChartGetElevation(uint64_t a1)
{
  return (double)*(uint64_t *)(a1 + 280);
}

uint64_t OIChartSetHidePlotArea(uint64_t result, char a2)
{
  *(unsigned char *)(result + 296) = a2;
  return result;
}

uint64_t OIChartGetHidePlotArea(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 296);
}

uint64_t OIChartSetHideLegend(uint64_t result, char a2)
{
  *(unsigned char *)(result + 297) = a2;
  return result;
}

uint64_t OIChartGetHideLegend(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 297);
}

uint64_t OIChartSetCustomFormatterCallback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 304) = a2;
  return result;
}

uint64_t OIChartGetCustomFormatterCallback(uint64_t a1)
{
  return *(void *)(a1 + 304);
}

void *_OILabelCollectionRetain(uint64_t a1, void *a2)
{
  CFTypeRef result = a2;
  if (a2) {
    ++*a2;
  }
  return result;
}

void _OILabelCollectionRelease(uint64_t a1, void *a2)
{
}

void *OILabelCollectionCreate()
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  uint64_t v1 = CFAllocatorAllocate(Default, 16, 0);
  void *v1 = 1;
  CFAllocatorRef v2 = CFAllocatorGetDefault();
  v1[1] = CFArrayCreateMutable(v2, 0, &OILabelArrayCallbacks);
  return v1;
}

void *OILabelCollectionRetain(void *result)
{
  if (result) {
    ++*result;
  }
  return result;
}

void OILabelCollectionRelease(void *a1)
{
  if (a1)
  {
    if ((*a1)-- == 1)
    {
      CGFloat v3 = (const void *)a1[1];
      if (v3) {
        CFRelease(v3);
      }
      CFAllocatorRef Default = CFAllocatorGetDefault();
      CFAllocatorDeallocate(Default, a1);
    }
  }
}

void OILabelCollectionAddString(uint64_t a1, const void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v7 = OILabelCreate(a2, a3, a4, a5, a6);
  if (v7)
  {
    uint64_t v8 = v7;
    OILabelSetAlignment((uint64_t)v7, 2);
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 8), v8);
    OILabelRelease(v8);
  }
}

void OILabelCollectionAddNumber(uint64_t a1, const __CFString *a2, double a3, double a4, double a5, double a6, double a7)
{
  CFStringRef StringFromDouble = OIFormatterCreateStringFromDouble(a2, a3);
  if (StringFromDouble)
  {
    CFStringRef v13 = StringFromDouble;
    OILabelCollectionAddString(a1, StringFromDouble, a4, a5, a6, a7);
    CFRelease(v13);
  }
}

void OILabelCollectionAddNumberWithFormatter(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), double a4, double a5, double a6, double a7, double a8)
{
  StringUsingCustomFormatter = (const void *)OIFormatterCreateStringUsingCustomFormatter(a2, a3);
  if (StringUsingCustomFormatter)
  {
    CFArrayRef v14 = StringUsingCustomFormatter;
    OILabelCollectionAddString(a1, StringUsingCustomFormatter, a5, a6, a7, a8);
    CFRelease(v14);
  }
}

void OIRenderPieInChart(uint64_t a1, uint64_t a2)
{
  CGFloat v3 = [[OIPieChartRenderer alloc] initWithChart:a1];
  [(OIPieChartRenderer *)v3 renderThreeDimensional:0 pieFromSeriesArray:a2];
}

void _OIRenderPieInChart(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CFIndex v6 = [[OIPieChartRenderer alloc] initWithChart:a1];
  [(OIPieChartRenderer *)v6 renderThreeDimensional:a4 pieFromSeriesArray:a2];
}

void OIRender3DPieInChart(uint64_t a1, uint64_t a2)
{
  CGFloat v3 = [[OIPieChartRenderer alloc] initWithChart:a1];
  [(OIPieChartRenderer *)v3 renderThreeDimensional:1 pieFromSeriesArray:a2];
}

void OIRenderStocksInChart(uint64_t a1, CFArrayRef theArray)
{
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count > 2)
    {
      CFIndex v5 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      ValueAtIndedouble x = CFArrayGetValueAtIndex(theArray, 0);
      uint64_t v8 = CFArrayGetValueAtIndex(theArray, 1);
      CGFloat v9 = CFArrayGetValueAtIndex(theArray, 2);
      CGFloat v10 = 0;
      if (v5 == 4) {
        CGFloat v10 = CFArrayGetValueAtIndex(theArray, 3);
      }
      CGContextSaveGState(Type);
      v12.origin.double x = OIChartGetPlotArea(a1);
      CGContextClipToRect(Type, v12);
      _OIRenderStockDayRangesInChart(a1, (uint64_t)ValueAtIndex, (uint64_t)v8);
      _OIRenderStockOpeningRangesInChart(a1, (uint64_t)v10, (uint64_t)v9);
      CGContextRestoreGState(Type);
    }
    else
    {
      OIChartSetStatus(a1, 5);
    }
  }
}

void _OIRenderStockDayRangesInChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Type = (CGContext *)OIAxisGetType(a1);
  double PlotArea = OIChartGetPlotArea(a1);
  double v9 = v8;
  int v10 = OIAxisAreLabelsCentered(a1);
  uint64_t String = OILabelGetString(a2);
  uint64_t v12 = OIAxisGetType(a2);
  if (String)
  {
    uint64_t v13 = v12;
    if (v12)
    {
      CFArrayRef Values = (const __CFArray *)OISeriesGetValues(a2);
      CFArrayRef v15 = (const __CFArray *)OISeriesGetValues(a3);
      CFIndex Count = CFArrayGetCount(Values);
      if (Count)
      {
        uint64_t v17 = Count;
        if (Count == CFArrayGetCount(v15))
        {
          uint64_t StrokeColor = (CGColor *)OILabelGetStrokeColor(a2);
          CGContextSetStrokeColorWithColor(Type, StrokeColor);
          if (OILabelGetStrokeColor(a2)) {
            double StrokeWidth = OILabelGetStrokeWidth(a2);
          }
          else {
            double StrokeWidth = 1.0;
          }
          CGContextSetLineWidth(Type, StrokeWidth);
          double Scale = OIAxisGetScale(String);
          int v21 = OIAxisAreLabelsCentered(String);
          double v22 = floor(Scale * 0.5);
          uint64_t v23 = 0;
          if (v21) {
            double v24 = v22;
          }
          else {
            double v24 = 0.0;
          }
          if (v10)
          {
            uint64_t v25 = 0;
            CGContextSetShadow(Type, *(CGSize *)(&v23 - 1), 0.0);
          }
          if (v17 >= 1)
          {
            for (CFIndex i = 0; i != v17; ++i)
            {
              double valuePtr = 0.0;
              ValueAtIndedouble x = (const __CFNumber *)CFArrayGetValueAtIndex(Values, i);
              CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
              double v33 = 0.0;
              CFNumberRef v28 = (const __CFNumber *)CFArrayGetValueAtIndex(v15, i);
              CFNumberGetValue(v28, kCFNumberCGFloatType, &v33);
              double v29 = PlotArea + OIAxisConvertValueToLocal(String, (double)i);
              double v30 = v9 + OIAxisConvertValueToLocal(v13, valuePtr);
              double v31 = PlotArea + OIAxisConvertValueToLocal(String, (double)i);
              double v32 = v9 + OIAxisConvertValueToLocal(v13, v33);
              CGContextMoveToPoint(Type, floor(v24 + v29) + 0.5, floor(v30) + 0.5);
              CGContextAddLineToPoint(Type, floor(v24 + v31) + 0.5, floor(v32) + 0.5);
            }
          }
          CGContextStrokePath(Type);
        }
      }
    }
  }
}

void _OIRenderStockOpeningRangesInChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Type = (CGContext *)OIAxisGetType(a1);
  double PlotArea = OIChartGetPlotArea(a1);
  double v9 = v8;
  int v10 = OIAxisAreLabelsCentered(a1);
  uint64_t String = OILabelGetString(a3);
  uint64_t v12 = OIAxisGetType(a3);
  if (String)
  {
    uint64_t v13 = v12;
    if (v12)
    {
      CFArrayRef Values = (const __CFArray *)OISeriesGetValues(a2);
      CFArrayRef v15 = (const __CFArray *)OISeriesGetValues(a3);
      CFIndex Count = 0;
      if (a2 && Values) {
        CFIndex Count = CFArrayGetCount(Values);
      }
      if (v15 && Count == CFArrayGetCount(v15))
      {
        uint64_t StrokeColor = (CGColor *)OILabelGetStrokeColor(a3);
        CGContextSetStrokeColorWithColor(Type, StrokeColor);
        if (OILabelGetStrokeColor(a3)) {
          double StrokeWidth = OILabelGetStrokeWidth(a3);
        }
        else {
          double StrokeWidth = 1.0;
        }
        CGContextSetLineWidth(Type, StrokeWidth);
        double Scale = OIAxisGetScale(String);
        OIAxisAreLabelsCentered(String);
        if (v10)
        {
          v36.width = 0.0;
          v36.height = 0.0;
          CGContextSetShadow(Type, v36, 0.0);
        }
        if (Count >= 1)
        {
          CFIndex v20 = 0;
          double v21 = Scale * 0.25;
          double v22 = Scale * 0.5;
          do
          {
            double valuePtr = 0.0;
            ValueAtIndedouble x = (const __CFNumber *)CFArrayGetValueAtIndex(Values, v20);
            CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
            double v34 = 0.0;
            CFNumberRef v24 = (const __CFNumber *)CFArrayGetValueAtIndex(v15, v20);
            CFNumberGetValue(v24, kCFNumberCGFloatType, &v34);
            double v25 = OIAxisConvertValueToLocal(String, (double)v20);
            double v26 = OIAxisConvertValueToLocal(v13, valuePtr);
            OIAxisConvertValueToLocal(String, (double)v20);
            double v27 = OIAxisConvertValueToLocal(v13, v34);
            if (valuePtr >= v34)
            {
              CGFloat v28 = 0.0;
              CGFloat v29 = 0.0;
              CGFloat v30 = 0.0;
            }
            else
            {
              CGFloat v28 = 1.0;
              CGFloat v29 = 1.0;
              CGFloat v30 = 1.0;
            }
            CGContextSetRGBFillColor(Type, v28, v29, v30, 1.0);
            CGFloat v31 = v9 + v26;
            CGFloat v32 = v21 + PlotArea + v25;
            CGFloat v33 = v9 + v27 - v31;
            v37.origin.double x = v32;
            v37.origin.y = v31;
            v37.size.width = v22;
            v37.size.height = v33;
            CGContextFillRect(Type, v37);
            v38.origin.double x = v32;
            v38.origin.y = v31;
            v38.size.width = v22;
            v38.size.height = v33;
            CGContextStrokeRect(Type, v38);
            ++v20;
          }
          while (Count != v20);
        }
        CGContextStrokePath(Type);
      }
    }
  }
}

void OIRenderLegendInChart(uint64_t a1)
{
  CFArrayRef Series = (const __CFArray *)OIChartGetSeries(a1);

  _OIRenderLegendForSeriesInChart(a1, Series);
}

void _OIRenderLegendForSeriesInChart(uint64_t a1, const __CFArray *a2)
{
  Type = (CGContext *)OIAxisGetType(a1);
  int v5 = OIAxisAreLabelsCentered(a1);
  LegendFillColor = (CGColor *)OIChartGetLegendFillColor(a1);
  Legenduint64_t TextColor = OIChartGetLegendTextColor(a1);
  Legenduint64_t StrokeColor = (CGColor *)OIChartGetLegendStrokeColor(a1);
  Legenddouble StrokeWidth = OIChartGetLegendStrokeWidth(a1);
  double LegendArea = OIChartGetLegendArea(a1);
  if (v13 == 0.0) {
    return;
  }
  double v14 = LegendArea;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  CGContextSaveGState(Type);
  if ((OIChartGetLegendHasShadow(a1) & v5) == 1)
  {
    v82.width = 0.0;
    v82.height = -4.0;
    CGContextSetShadow(Type, v82, 6.0);
  }
  if (LegendFillColor)
  {
    CGContextSetFillColorWithColor(Type, LegendFillColor);
    v84.origin.double x = floor(v14) + 0.5;
    v84.origin.y = floor(v15) + 0.5;
    v84.size.width = ceil(v16);
    v84.size.height = ceil(v17);
    CGContextFillRect(Type, v84);
  }
  if (v5)
  {
    v83.width = 0.0;
    v83.height = 0.0;
    CGContextSetShadow(Type, v83, 0.0);
  }
  if (a2)
  {
    double v61 = LegendStrokeWidth;
    CGContextSaveGState(Type);
    unint64_t v18 = OIChartGetLegendPlacement(a1) & 0xFFFFFFFFFFFFFFFDLL;
    double v69 = v14;
    v85.origin.double x = v14;
    v85.origin.y = v15;
    v85.size.width = v16;
    v85.size.height = v17;
    CGContextClipToRect(Type, v85);
    CFIndex Count = CFArrayGetCount(a2);
    CFIndex v20 = Count;
    uint64_t v21 = Count + 1;
    double v22 = v17 / (double)(Count + 1);
    BOOL v23 = v22 > 11.0 || v18 == 0;
    double v24 = v22 + -1.0;
    if (v23) {
      double v25 = 10.0;
    }
    else {
      double v25 = v24;
    }
    BOOL v64 = v18 == 0;
    if (v24 >= 10.0 || v18 == 0) {
      double v27 = 10.0;
    }
    else {
      double v27 = v24;
    }
    unint64_t v76 = v18;
    double v66 = v15;
    if (v18)
    {
      if (Count >= 11)
      {
        uint64_t v21 = (uint64_t)(floor((double)Count / 10.0) + 1.0);
        uint64_t v28 = Count / v21 + 1;
        goto LABEL_29;
      }
      uint64_t v21 = 1;
      uint64_t v28 = Count;
    }
    else
    {
      if (Count >= 7)
      {
        uint64_t v28 = (uint64_t)(floor((double)Count / 6.0) + 1.0);
        uint64_t v21 = Count / v28 + 1;
        goto LABEL_29;
      }
      uint64_t v28 = 1;
    }
    if (Count < 1)
    {
      CFIndex v34 = 0;
      double v30 = 0.0;
LABEL_35:
      double v35 = ceil(v25);
      double v36 = v16 / (double)v21;
      double v67 = v17;
      if (v17 / (double)v28 <= 25.0) {
        double v37 = v17 / (double)v28;
      }
      else {
        double v37 = 25.0;
      }
      uint64_t v62 = LegendStrokeColor;
      uint64_t v77 = LegendTextColor;
      if (v30 <= v36)
      {
        double v65 = v35;
      }
      else
      {
        double v65 = v35 * (v36 / v30);
        double v27 = v27 * (v36 / v30);
      }
      uint64_t v68 = v21;
      if (v21 >= 1)
      {
        uint64_t v70 = 0;
        if (v28 >= 0) {
          uint64_t v38 = v28;
        }
        else {
          uint64_t v38 = v28 + 1;
        }
        uint64_t v60 = v38 >> 1;
        double v39 = ceil(v65);
        double v59 = v69 + v16 * 0.5;
        unint64_t v58 = (unint64_t)v21 >> 1;
        double v57 = -v36;
        uint64_t v75 = *MEMORY[0x263F039A0];
        uint64_t v74 = *MEMORY[0x263F03C60];
        CFArrayRef v72 = a2;
        CGContextRef c = Type;
        uint64_t v71 = v28;
        while (v28 < 1)
        {
          if (v34 < 0) {
            goto LABEL_65;
          }
LABEL_64:
          v20 -= v28;
          if (++v70 == v68) {
            goto LABEL_65;
          }
        }
        uint64_t v40 = 0;
        double v41 = floor(v69 + v36 * (double)v70);
        double v63 = floor(v59 + v57 * ((double)(uint64_t)(v58 - v70) + -0.5));
        uint64_t v42 = -1;
        uint64_t v43 = v60;
        CFIndex v78 = v20;
        while (v20 + v42 >= 0)
        {
          ValueAtIndedouble x = CFArrayGetValueAtIndex(a2, v20 + v42);
          uint64_t Label = OIAxisGetLabel((uint64_t)ValueAtIndex);
          uint64_t Labels = OIAxisGetLabels((uint64_t)ValueAtIndex);
          uint64_t TextColor = (CGColor *)OILabelGetTextColor((uint64_t)ValueAtIndex);
          uint64_t StrokeColor = (CGColor *)OILabelGetStrokeColor((uint64_t)ValueAtIndex);
          MarkerColor = (CGColor *)OISeriesGetMarkerColor((uint64_t)ValueAtIndex);
          if (v76)
          {
            double v49 = v66 + v67 * 0.5 + v37 * (double)v43;
            double v50 = v41;
          }
          else
          {
            double v49 = v66 + v67 + -v37 * (double)(v40 + 1);
            double v50 = v63;
          }
          double v51 = floor(v49) + 0.5;
          double v52 = v50 + 0.5;
          double v53 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", *(void *)&v57, v58, *(void *)&v59, v60);
          CTFontRef v54 = OICreateDefaultFontWithSize(v27);
          [v53 setObject:v54 forKeyedSubscript:v75];

          [v53 setObject:v77 forKeyedSubscript:v74];
          if (Labels && MarkerColor)
          {
            Type = c;
            CGContextSetFillColorWithColor(c, MarkerColor);
            v86.origin.double x = v52;
            v86.origin.y = v51;
            v86.size.width = v39;
            v86.size.height = v39;
            CGContextFillRect(c, v86);
            uint64_t v28 = v71;
            a2 = v72;
            CFStringRef v55 = (const __CFString *)Label;
          }
          else
          {
            Type = c;
            if (TextColor)
            {
              CGContextSetFillColorWithColor(c, TextColor);
              v87.origin.double x = v52;
              v87.origin.y = v51;
              v87.size.width = v39;
              v87.size.height = v39;
              CGContextFillRect(c, v87);
            }
            uint64_t v28 = v71;
            a2 = v72;
            CFStringRef v55 = (const __CFString *)Label;
            if (StrokeColor)
            {
              CGContextSetStrokeColorWithColor(c, StrokeColor);
              double StrokeWidth = OILabelGetStrokeWidth((uint64_t)ValueAtIndex);
              CGContextSetLineWidth(c, StrokeWidth);
              CGContextSetLineJoin(c, kCGLineJoinRound);
              CGContextSetLineCap(c, kCGLineCapRound);
              v88.origin.double x = v52;
              v88.origin.y = v51;
              v88.size.width = v39;
              v88.size.height = v39;
              CGContextStrokeRect(c, v88);
            }
          }
          if (v55)
          {
            v80[0] = MEMORY[0x263EF8330];
            v80[1] = 3221225472;
            v80[2] = ___OIRenderLegendForSeriesInChart_block_invoke;
            v80[3] = &__block_descriptor_121_e29__CGPoint_dd_24__0_CGSize_dd_8l;
            BOOL v81 = v64;
            *(double *)&v80[4] = v69;
            *(double *)&v80[5] = v66;
            *(double *)&v80[6] = v16;
            *(double *)&v80[7] = v67;
            *(double *)&v80[8] = v36;
            *(double *)&v80[9] = v37;
            v80[10] = v68;
            v80[11] = v70;
            *(double *)&v80[12] = v65;
            v80[13] = v40;
            v80[14] = v28;
            OIDrawStringWithAttributes(v55, v53, Type, v80);
          }

          ++v40;
          --v43;
          --v42;
          CFIndex v20 = v78;
          if (v28 == v40)
          {
            CFIndex v34 = v78 - v40;
            goto LABEL_64;
          }
        }
      }
LABEL_65:
      CGContextRestoreGState(Type);
      Legenduint64_t StrokeColor = v62;
      double v17 = v67;
      double v15 = v66;
      double v14 = v69;
      Legenddouble StrokeWidth = v61;
      goto LABEL_66;
    }
LABEL_29:
    CFIndex v29 = 0;
    double v30 = 0.0;
    do
    {
      CGFloat v31 = CFArrayGetValueAtIndex(a2, v29);
      CFStringRef v32 = (const __CFString *)OIAxisGetLabel((uint64_t)v31);
      if (v32)
      {
        double v33 = OISizeForStringInContext(v32, v27);
        if (v33 > v30) {
          double v30 = v33;
        }
      }
      ++v29;
    }
    while (v20 != v29);
    CFIndex v34 = v20;
    goto LABEL_35;
  }
LABEL_66:
  if (LegendStrokeColor)
  {
    CGContextSetLineWidth(Type, LegendStrokeWidth);
    CGContextSetStrokeColorWithColor(Type, LegendStrokeColor);
    v89.origin.double x = floor(v14) + 0.5;
    v89.origin.y = floor(v15) + 0.5;
    v89.size.width = ceil(v16);
    v89.size.height = ceil(v17);
    CGContextStrokeRect(Type, v89);
  }
  CGContextRestoreGState(Type);
}

void OIRenderXYLegendInChart(uint64_t a1)
{
  CFArrayRef Series = (const __CFArray *)OIChartGetSeries(a1);

  _OIRenderLegendForSeriesInChart(a1, Series);
}

void OIRenderBubbleLegendInChart(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &OISeriesArrayCallbacks);
  CFArrayRef Series = (const __CFArray *)OIChartGetSeries(a1);
  if (Series)
  {
    CFArrayRef v4 = Series;
    CFIndex Count = CFArrayGetCount(Series);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0; i < v6; i += 2)
      {
        ValueAtIndedouble x = CFArrayGetValueAtIndex(v4, i);
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
    }
  }
  _OIRenderLegendForSeriesInChart(a1, Mutable);

  CFRelease(Mutable);
}

void *_OISeriesRetain(uint64_t a1, void *a2)
{
  CFTypeRef result = a2;
  ++*a2;
  return result;
}

void _OISeriesRelease(uint64_t a1, void *a2)
{
}

void *OISeriesCreate(const __CFArray *a1, const void *a2)
{
  if (!a1) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(a1);
  int v5 = 0;
  if (a2 && Count)
  {
    CFAllocatorRef Default = CFAllocatorGetDefault();
    int v5 = CFAllocatorAllocate(Default, 144, 0);
    void *v5 = 1;
    CFIndex v7 = CFArrayGetCount(a1);
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    if (v7 >= 1)
    {
      for (CFIndex i = 0; i != v7; ++i)
      {
        ValueAtIndedouble x = CFArrayGetValueAtIndex(a1, i);
        CFTypeID v11 = CFGetTypeID(ValueAtIndex);
        if (v11 == CFNumberGetTypeID())
        {
          CFArrayInsertValueAtIndex(Mutable, i, ValueAtIndex);
        }
        else
        {
          int valuePtr = 0;
          CFNumberRef v12 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
          CFArrayInsertValueAtIndex(Mutable, i, v12);
          CFRelease(v12);
        }
      }
    }
    v5[6] = Mutable;
    v5[3] = CFRetain(a2);
    v5[4] = 0;
    *((unsigned char *)v5 + 40) = 0;
    v5[1] = 0;
    v5[2] = 0;
    v5[7] = 0;
    v5[8] = 0;
    v5[9] = 0x4000000000000000;
    *((_OWORD *)v5 + 5) = 0u;
    *((_OWORD *)v5 + 6) = 0u;
    *((_OWORD *)v5 + 7) = xmmword_23EF9FD80;
    *((unsigned char *)v5 + 128) = 0;
    v5[17] = 0;
  }
  return v5;
}

void OISeriesRelease(void *a1)
{
  if (a1)
  {
    if ((*a1)-- == 1)
    {
      CGFloat v3 = (const void *)a1[7];
      if (v3) {
        CFRelease(v3);
      }
      CFArrayRef v4 = (void *)a1[1];
      if (v4) {
        OIAxisRelease(v4);
      }
      int v5 = (void *)a1[2];
      if (v5) {
        OIAxisRelease(v5);
      }
      CFIndex v6 = (const void *)a1[3];
      if (v6) {
        CFRelease(v6);
      }
      CFIndex v7 = (const void *)a1[4];
      if (v7) {
        CFRelease(v7);
      }
      double v8 = (const void *)a1[6];
      if (v8) {
        CFRelease(v8);
      }
      double v9 = (CGColor *)a1[8];
      if (v9) {
        CGColorRelease(v9);
      }
      int v10 = (CGColor *)a1[10];
      if (v10) {
        CGColorRelease(v10);
      }
      CFTypeID v11 = (CGImage *)a1[11];
      if (v11) {
        CGImageRelease(v11);
      }
      CFNumberRef v12 = (CGColor *)a1[13];
      if (v12) {
        CGColorRelease(v12);
      }
      double v13 = (void *)a1[17];
      if (v13) {
        OIErrorBarRelease(v13);
      }
      CFAllocatorRef Default = CFAllocatorGetDefault();
      CFAllocatorDeallocate(Default, a1);
    }
  }
}

void *OISeriesCreateFromDictionary(const __CFDictionary *a1)
{
  if (!a1) {
    return 0;
  }
  CFNumberRef Value = (__CFString *)CFDictionaryGetValue(a1, @"kOIChartSeriesTypeKey");
  if (Value) {
    CGFloat v3 = Value;
  }
  else {
    CGFloat v3 = @"kOIChartColumnType";
  }
  CFArrayRef v4 = (const __CFArray *)CFDictionaryGetValue(a1, @"kOIChartSeriesValuesKey");
  int v5 = OISeriesCreate(v4, v3);
  if (v5)
  {
    CFIndex v6 = CFDictionaryGetValue(a1, @"kOIChartSeriesBaseValuesKey");
    if (v6) {
      OISeriesSetBaseValues((uint64_t)v5, v6);
    }
    char valuePtr = 0;
    CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(a1, @"kOIChartSeriesOnSecondaryAxisKey");
    if (v7)
    {
      CFNumberGetValue(v7, kCFNumberSInt8Type, &valuePtr);
      char v8 = valuePtr;
    }
    else
    {
      char v8 = 0;
    }
    *((unsigned char *)v5 + 40) = v8;
    double v9 = CFDictionaryGetValue(a1, @"kOIChartLabelKey");
    OISeriesSetLabel((uint64_t)v5, v9);
    int v10 = (CGColor *)CFDictionaryGetValue(a1, @"kOIChartStrokeColorKey");
    OILabelSetStrokeColor((uint64_t)v5, v10);
    uint64_t v30 = 0;
    CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(a1, @"kOIChartStrokeWidthKey");
    if (v11)
    {
      CFNumberGetValue(v11, kCFNumberCGFloatType, &v30);
      uint64_t v12 = v30;
    }
    else
    {
      uint64_t v12 = 0;
    }
    v5[9] = v12;
    double v13 = (CGColor *)CFDictionaryGetValue(a1, @"kOIChartFillColorKey");
    OILabelSetTextColor((uint64_t)v5, v13);
    double v14 = (CGImage *)CFDictionaryGetValue(a1, @"kOIChartFillImageKey");
    OISeriesSetFillImage((uint64_t)v5, v14);
    uint64_t v29 = 0;
    CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(a1, @"kOIChartSeriesMarkerTypeKey");
    if (v15)
    {
      CFNumberGetValue(v15, kCFNumberNSIntegerType, &v29);
      uint64_t v16 = v29;
      v5[12] = v29;
      if (v16)
      {
        double v17 = (CGColor *)CFDictionaryGetValue(a1, @"kOIChartSeriesMarkerColorKey");
        if (!v17) {
          double v17 = (CGColor *)v5[8];
        }
        OISeriesSetMarkerColor((uint64_t)v5, v17);
        uint64_t v28 = 0;
        CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(a1, @"kOIChartSeriesMarkerWidthKey");
        if (v18)
        {
          CFNumberGetValue(v18, kCFNumberCGFloatType, &v28);
          uint64_t v19 = v28;
        }
        else
        {
          uint64_t v19 = 0;
        }
        v5[14] = v19;
      }
    }
    else
    {
      v5[12] = 0;
    }
    uint64_t v28 = 0;
    CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(a1, @"kOIChartSeriesOffsetKey");
    if (v20)
    {
      CFNumberGetValue(v20, kCFNumberCGFloatType, &v28);
      uint64_t v21 = v28;
    }
    else
    {
      uint64_t v21 = 0;
    }
    v5[15] = v21;
    uint64_t v27 = 0;
    CFNumberRef v22 = (const __CFNumber *)CFDictionaryGetValue(a1, @"kOIChartSeriesShowValuesKey");
    if (v22)
    {
      CFNumberGetValue(v22, kCFNumberNSIntegerType, &v27);
      BOOL v23 = v27 != 0;
    }
    else
    {
      BOOL v23 = 0;
    }
    *((unsigned char *)v5 + 128) = v23;
    CFDictionaryRef v24 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"kOIChartSeriesErrorBarKey");
    if (v24)
    {
      double v25 = OIErrorBarCreateFromDictionary(v24);
      OISeriesSetErrorBar((uint64_t)v5, v25);
      OIErrorBarRelease(v25);
    }
  }
  return v5;
}

CFTypeRef OISeriesSetBaseValues(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 56);
  if (result != cf)
  {
    if (result) {
      CFRelease(result);
    }
    CFTypeRef result = CFRetain(cf);
    *(void *)(a1 + 56) = result;
  }
  return result;
}

uint64_t OISeriesSetSecondary(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2;
  return result;
}

CFTypeRef OISeriesSetLabel(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 32);
  if (result != cf)
  {
    if (result) {
      CFRelease(result);
    }
    CFTypeRef result = CFRetain(cf);
    *(void *)(a1 + 32) = result;
  }
  return result;
}

CGImage *OISeriesSetFillImage(uint64_t a1, CGImageRef image)
{
  CFTypeRef result = *(CGImage **)(a1 + 88);
  if (result != image)
  {
    if (result) {
      CGImageRelease(result);
    }
    CFTypeRef result = CGImageRetain(image);
    *(void *)(a1 + 88) = result;
  }
  return result;
}

uint64_t OISeriesSetMarkerType(uint64_t result, uint64_t a2)
{
  *(void *)(result + 96) = a2;
  return result;
}

CGColor *OISeriesSetMarkerColor(uint64_t a1, CGColorRef color)
{
  CFTypeRef result = *(CGColor **)(a1 + 104);
  if (result != color)
  {
    if (result) {
      CGColorRelease(result);
    }
    CFTypeRef result = CGColorRetain(color);
    *(void *)(a1 + 104) = result;
  }
  return result;
}

uint64_t OISeriesSetMarkerWidth(uint64_t result, double a2)
{
  *(double *)(result + 112) = a2;
  return result;
}

uint64_t OISeriesSetOffset(uint64_t result, double a2)
{
  *(double *)(result + 120) = a2;
  return result;
}

uint64_t OISeriesSetShowValues(uint64_t result, char a2)
{
  *(unsigned char *)(result + 128) = a2;
  return result;
}

void *OISeriesSetErrorBar(uint64_t a1, void *a2)
{
  CFTypeRef result = *(void **)(a1 + 136);
  if (result != a2)
  {
    if (result) {
      OIErrorBarRelease(result);
    }
    CFTypeRef result = OILabelRetain(a2);
    *(void *)(a1 + 136) = result;
  }
  return result;
}

uint64_t OISeriesGetValues(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

void *OISeriesSetBaseAxis(uint64_t a1, void *a2)
{
  CFTypeRef result = *(void **)(a1 + 8);
  if (result != a2)
  {
    if (result) {
      OIAxisRelease(result);
    }
    CFTypeRef result = OILabelRetain(a2);
    *(void *)(a1 + 8) = result;
  }
  return result;
}

void *OISeriesSetValueAxis(uint64_t a1, void *a2)
{
  CFTypeRef result = *(void **)(a1 + 16);
  if (result != a2)
  {
    if (result) {
      OIAxisRelease(result);
    }
    CFTypeRef result = OILabelRetain(a2);
    *(void *)(a1 + 16) = result;
  }
  return result;
}

uint64_t OISeriesGetFillImage(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

uint64_t OISeriesGetMarkerColor(uint64_t a1)
{
  return *(void *)(a1 + 104);
}

double OISeriesGetMarkerWidth(uint64_t a1)
{
  return *(double *)(a1 + 112);
}

double OISeriesGetOffset(uint64_t a1)
{
  return *(double *)(a1 + 120);
}

uint64_t OISeriesGetShowValues(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 128);
}

uint64_t OISeriesIsOnSecondaryAxis(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

double OISeriesGetBaseValueAtIndex(uint64_t a1, CFIndex a2)
{
  CFArrayRef v4 = *(const __CFArray **)(a1 + 56);
  if (v4
    && CFArrayGetCount(v4) > a2
    && (double valuePtr = 0.0,
        ValueAtIndedouble x = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), a2),
        CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr)))
  {
    return valuePtr;
  }
  else
  {
    return (double)a2;
  }
}

void OISeriesSetupFillImageForContext(uint64_t a1, CGContext *a2)
{
  CFAllocatorRef v2 = *(void **)(a1 + 88);
  if (v2)
  {
    CGPatternCallbacks callbacks = *(CGPatternCallbacks *)byte_26F2AB880;
    Pattern = CGColorSpaceCreatePattern(0);
    CGContextSetFillColorSpace(a2, Pattern);
    CGColorSpaceRelease(Pattern);
    CFRetain(v2);
    double Width = (double)CGImageGetWidth((CGImageRef)v2);
    double Height = (double)CGImageGetHeight((CGImageRef)v2);
    CGFloat v7 = (double)CGImageGetWidth((CGImageRef)v2);
    size_t v8 = CGImageGetHeight((CGImageRef)v2);
    long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v14.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v14.CGContextRef c = v9;
    *(_OWORD *)&v14.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    uint64_t v10 = 0;
    *(void *)&long long v9 = 0;
    double v11 = Width;
    double v12 = Height;
    double v13 = CGPatternCreate(v2, *(CGRect *)((char *)&v9 - 8), &v14, v7, (double)v8, kCGPatternTilingNoDistortion, 1, &callbacks);
    v14.a = 1.0;
    CGContextSetFillPattern(a2, v13, &v14.a);
    CGPatternRelease(v13);
  }
}

void drawImagePattern(CGImage *a1, CGContext *a2)
{
  double Width = (double)CGImageGetWidth(a1);
  double Height = (double)CGImageGetHeight(a1);
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  double v8 = Width;

  CGContextDrawImage(a2, *(CGRect *)&v6, a1);
}

void OISeriesSetupStrokeAndFillForContext(uint64_t a1, CGContextRef c)
{
  CFArrayRef v4 = *(CGColor **)(a1 + 80);
  if (v4) {
    CGContextSetFillColorWithColor(c, v4);
  }
  OISeriesSetupFillImageForContext(a1, c);
  int v5 = *(CGColor **)(a1 + 64);
  if (v5)
  {
    CGContextSetStrokeColorWithColor(c, v5);
    CGContextSetLineWidth(c, *(CGFloat *)(a1 + 72));
    CGContextSetLineJoin(c, kCGLineJoinRound);
    CGContextSetLineCap(c, kCGLineCapRound);
  }
}

void OIRenderColumnsInChart(uint64_t a1, const __CFArray *a2)
{
}

void _OIRenderColumnsInChart(uint64_t a1, CFArrayRef theArray, double a3, double a4)
{
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count)
    {
      uint64_t v7 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      double PlotArea = OIChartGetPlotArea(a1);
      double v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      int v16 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      double v52 = PlotArea;
      v57.origin.double x = PlotArea;
      v57.origin.y = v11;
      v57.size.width = v13;
      v57.size.height = v15;
      CGContextClipToRect(Type, v57);
      ValueAtIndedouble x = CFArrayGetValueAtIndex(theArray, 0);
      uint64_t String = OILabelGetString((uint64_t)ValueAtIndex);
      uint64_t v19 = OIAxisGetType((uint64_t)ValueAtIndex);
      double MinValue = OIAxisGetMinValue(v19);
      double FontSize = OILabelGetFontSize(v19);
      double Scale = OIAxisGetScale(String);
      double v48 = OIAxisGetScale(v19);
      int v23 = OIAxisAreLabelsCentered(String);
      double v24 = Scale * -0.5;
      if (v23) {
        double v24 = 0.0;
      }
      double v51 = v24;
      if (v16)
      {
        v56.width = 4.0;
        v56.height = -4.0;
        CGContextSetShadow(Type, v56, 3.0);
      }
      double v44 = Type;
      uint64_t v25 = 0;
      if (v7 >= 1)
      {
        for (CFIndex i = 0; i != v7; ++i)
        {
          uint64_t v27 = CFArrayGetValueAtIndex(theArray, i);
          CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)v27);
          CFIndex v29 = CFArrayGetCount(Values);
          if (v29 > v25) {
            uint64_t v25 = v29;
          }
        }
      }
      double v49 = OIErrorBarRendererCreate(1);
      __double2 v47 = OILabelCollectionCreate();
      if (v25 >= 1)
      {
        CFIndex v30 = 0;
        double v31 = floor(Scale / (double)(v7 + 1));
        double v50 = floor(v31 * 0.5);
        double v45 = ceil(v31 * 0.5);
        double v46 = ceil(v31 + 4.0);
        do
        {
          if (v7 >= 1)
          {
            for (CFIndex j = 0; j != v7; ++j)
            {
              double v33 = CFArrayGetValueAtIndex(theArray, j);
              double BaseValueAtIndex = OISeriesGetBaseValueAtIndex((uint64_t)v33, v30);
              CFArrayRef v35 = (const __CFArray *)OISeriesGetValues((uint64_t)v33);
              if (v30 < CFArrayGetCount(v35))
              {
                valuePtr[0] = 0.0;
                CFNumberRef v36 = (const __CFNumber *)CFArrayGetValueAtIndex(v35, v30);
                CFNumberGetValue(v36, kCFNumberCGFloatType, valuePtr);
                double v37 = valuePtr[0];
                if (valuePtr[0] <= FontSize)
                {
                  BOOL v38 = valuePtr[0] < MinValue;
                }
                else
                {
                  double v37 = FontSize;
                  BOOL v38 = 1;
                }
                if (v38)
                {
                  if (v37 < MinValue) {
                    double v37 = MinValue;
                  }
                  valuePtr[0] = v37;
                }
                OIAxisConvertValueToLocal(String, BaseValueAtIndex);
                double v39 = v11 + OIAxisConvertValueToLocal(v19, 0.0);
                double v40 = v50 + v51 + v52 + OIAxisConvertValueToLocal(String, BaseValueAtIndex) + v31 * (double)j;
                double v41 = v11 + OIAxisConvertValueToLocal(v19, valuePtr[0]) - v39;
                _OIRenderColumnFloor(a1, v40, v39, v31, v41, a3, a4);
                _OIRenderColumn(a1, (uint64_t)v33, v40, v39, v31, v41, a3, a4);
                double v42 = v39 + v41;
                if (OISeriesGetShowValues((uint64_t)v33)) {
                  OILabelCollectionAddNumber((uint64_t)v47, 0, valuePtr[0], floor(v40 + -2.0) + 0.5, floor(v42) + 0.5, v46, v45);
                }
                uint64_t PlotFillColor = OIChartGetPlotFillColor((uint64_t)v33);
                if (PlotFillColor) {
                  OIErrorBarRendererAddPoint((uint64_t)v49, PlotFillColor, v31 * 0.5 + v40, v42, valuePtr[0], v48);
                }
              }
            }
          }
          ++v30;
        }
        while (v30 != v25);
      }
      OIErrorBarRendererRenderInContext((uint64_t)v49, v44);
      OIErrorBarRendererRelease(v49);
      OILabelCollectionRenderInContext((uint64_t)v47, v44);
      OILabelCollectionRelease(v47);
      CGContextRestoreGState(v44);
    }
  }
}

void OIRenderStackedColumnsInChart(uint64_t a1, const __CFArray *a2)
{
}

void _OIRenderStackedColumnsInChart(uint64_t a1, CFArrayRef theArray, int a3, double a4, double a5)
{
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count)
    {
      uint64_t v9 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      double PlotArea = OIChartGetPlotArea(a1);
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      int v18 = OIAxisAreLabelsCentered(a1);
      ValueAtIndedouble x = CFArrayGetValueAtIndex(theArray, 0);
      uint64_t String = OILabelGetString((uint64_t)ValueAtIndex);
      uint64_t v21 = OIAxisGetType((uint64_t)ValueAtIndex);
      double FontSize = OILabelGetFontSize(String);
      double MinValue = OIAxisGetMinValue(v21);
      double v68 = OILabelGetFontSize(v21);
      double Scale = OIAxisGetScale(v21);
      double v23 = OIAxisGetScale(String);
      if ((uint64_t)FontSize > 0x2000)
      {
        NSLog(&cfstr_SkippingRender.isa, v23, (uint64_t)FontSize);
        return;
      }
      double v24 = v23;
      CGContextSaveGState(Type);
      v79.origin.double x = PlotArea;
      CGFloat v70 = v13;
      v79.origin.y = v13;
      v79.size.width = v15;
      v79.size.height = v17;
      CGContextClipToRect(Type, v79);
      int v25 = OIAxisAreLabelsCentered(String);
      double v26 = v24 * -0.5;
      if (v25) {
        double v26 = 0.0;
      }
      double v72 = v26;
      if (v18)
      {
        v78.width = 4.0;
        v78.height = -4.0;
        CGContextSetShadow(Type, v78, 3.0);
      }
      uint64_t v60 = Type;
      double v63 = OIErrorBarRendererCreate(1);
      double v65 = OILabelCollectionCreate();
      uint64_t v62 = (uint64_t)FontSize;
      double v27 = v13;
      if ((uint64_t)FontSize < 1) {
        goto LABEL_50;
      }
      CFIndex v28 = 0;
      double v71 = floor(v24 * 0.25);
      double v76 = floor(v24 * 0.5);
      if (v9 > 0) {
        int v29 = a3;
      }
      else {
        int v29 = 0;
      }
      int v61 = v29;
      while (1)
      {
        double v75 = (double)v28;
        OIAxisConvertValueToLocal(String, (double)v28);
        double v30 = OIAxisConvertValueToLocal(v21, 0.0);
        double v31 = 0.0;
        if (v61)
        {
          for (CFIndex i = 0; i != v9; ++i)
          {
            double v33 = CFArrayGetValueAtIndex(theArray, i);
            CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)v33);
            if (CFArrayGetCount(Values) > v28)
            {
              valuePtr[0] = 0.0;
              CFNumberRef v35 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, v28);
              CFNumberGetValue(v35, kCFNumberCGFloatType, valuePtr);
              double v31 = v31 + fabs(valuePtr[0]);
            }
          }
        }
        if (v9 < 1)
        {
LABEL_48:
          double v58 = v72 + PlotArea + OIAxisConvertValueToLocal(String, v75);
          double v59 = OIAxisConvertValueToLocal(v21, 0.0);
          _OIRenderColumnFloor(a1, floor(v71 + v58) + 0.5, floor(v27 + v59) + 0.5, v76, 0.0, a4, a5);
          goto LABEL_49;
        }
        CFIndex v36 = 0;
        double v37 = v27 + v30;
        double v38 = 0.0;
        double v66 = v37;
        double v67 = 0.0;
        do
        {
          double v39 = CFArrayGetValueAtIndex(theArray, v36);
          CFArrayRef v40 = (const __CFArray *)OISeriesGetValues((uint64_t)v39);
          if (CFArrayGetCount(v40) <= v28) {
            goto LABEL_46;
          }
          valuePtr[0] = 0.0;
          CFNumberRef v41 = (const __CFNumber *)CFArrayGetValueAtIndex(v40, v28);
          CFNumberGetValue(v41, kCFNumberCGFloatType, valuePtr);
          double v42 = valuePtr[0];
          if (a3)
          {
            if (valuePtr[0] == 0.0)
            {
              double v43 = 0.0;
              if (v31 == 0.0) {
                goto LABEL_34;
              }
            }
            double v42 = valuePtr[0] / v31;
          }
          if (v42 >= 0.0)
          {
            double v43 = v42;
LABEL_34:
            double v50 = v38 + v43;
            if (v38 + v43 > v68) {
              double v50 = v68;
            }
            if (v50 >= MinValue) {
              double v38 = v50;
            }
            else {
              double v38 = MinValue;
            }
            double v46 = OIAxisConvertValueToLocal(String, v75);
            double v51 = v27 + OIAxisConvertValueToLocal(v21, v38);
            double v49 = v51 - v37;
            double v48 = v37;
            double v42 = v43;
            double v37 = v51;
            goto LABEL_40;
          }
          double v44 = v67 + v42;
          if (v67 + v42 < MinValue) {
            double v44 = MinValue;
          }
          if (v44 <= v68) {
            double v45 = v44;
          }
          else {
            double v45 = v68;
          }
          double v46 = OIAxisConvertValueToLocal(String, v75);
          double v67 = v45;
          double v47 = v27 + OIAxisConvertValueToLocal(v21, v45);
          double v48 = v66;
          double v49 = v47 - v66;
          double v66 = v47;
LABEL_40:
          double v52 = PlotArea;
          double v53 = floor(v71 + v72 + PlotArea + v46);
          double v54 = ceil(v49);
          double v55 = floor(v48) + 0.5;
          double v56 = v53 + 0.5;
          _OIRenderColumn(a1, (uint64_t)v39, v53 + 0.5, v55, v76, v54, a4, a5);
          if (OISeriesGetShowValues((uint64_t)v39)) {
            OILabelCollectionAddNumber((uint64_t)v65, 0, valuePtr[0], floor(v56) + 0.5, floor(v55) + 0.5, v76, v54);
          }
          if ((a3 & 1) == 0)
          {
            uint64_t PlotFillColor = OIChartGetPlotFillColor((uint64_t)v39);
            if (PlotFillColor) {
              OIErrorBarRendererAddPoint((uint64_t)v63, PlotFillColor, v76 * 0.5 + v56, v55 + v54, v42, Scale);
            }
          }
          double PlotArea = v52;
          double v27 = v70;
LABEL_46:
          ++v36;
        }
        while (v9 != v36);
        if (v38 == 0.0) {
          goto LABEL_48;
        }
LABEL_49:
        if (++v28 == v62)
        {
LABEL_50:
          OIErrorBarRendererRenderInContext((uint64_t)v63, v60);
          OIErrorBarRendererRelease(v63);
          OILabelCollectionRenderInContext((uint64_t)v65, v60);
          OILabelCollectionRelease(v65);
          CGContextRestoreGState(v60);
          return;
        }
      }
    }
  }
}

void OIRenderPercentStackedColumnsInChart(uint64_t a1, const __CFArray *a2)
{
}

void OIRender3DColumnsInChart(uint64_t a1, const __CFArray *a2)
{
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  OIChartGetPlotArea(a1);
  double v6 = v5;
  double v8 = v7;
  double v9 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  double v10 = OIChartGetRotation(a1) / 45.0 * (v6 / v9);
  double v11 = OIChartGetElevation(a1) / 90.0 * (v8 / v9);

  _OIRenderColumnsInChart(a1, a2, v10, v11);
}

void OIRender3DLayeredColumnsInChart(uint64_t a1, const __CFArray *a2)
{
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  OIChartGetPlotArea(a1);
  double v6 = v5;
  double v8 = v7;
  SeriesCFIndex Count = OIChartGetSeriesCount(a1);
  double FontSize = (double)(uint64_t)OILabelGetFontSize((uint64_t)Axis);
  double v11 = OIChartGetRotation(a1) / 45.0 * (v6 * (double)(uint64_t)SeriesCount / FontSize);
  double v12 = v8 * (double)(uint64_t)SeriesCount / FontSize * (OIChartGetElevation(a1) / 90.0);

  _OIRenderMultiLevelColumnsInChart(a1, a2, v11, v12);
}

void _OIRenderMultiLevelColumnsInChart(uint64_t a1, CFArrayRef theArray, double a3, double a4)
{
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count)
    {
      Type = (CGContext *)OIAxisGetType(a1);
      double PlotArea = OIChartGetPlotArea(a1);
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      int v14 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      double v44 = v9;
      double v45 = PlotArea;
      v51.origin.double x = PlotArea;
      v51.origin.y = v9;
      v51.size.width = v11;
      v51.size.height = v13;
      CGContextClipToRect(Type, v51);
      ValueAtIndedouble x = CFArrayGetValueAtIndex(theArray, 0);
      uint64_t String = OILabelGetString((uint64_t)ValueAtIndex);
      uint64_t v17 = OIAxisGetType((uint64_t)ValueAtIndex);
      double FontSize = OILabelGetFontSize(String);
      double MinValue = OIAxisGetMinValue(v17);
      double v43 = OILabelGetFontSize(v17);
      double Scale = OIAxisGetScale(String);
      int v20 = OIAxisAreLabelsCentered(String);
      double v21 = Scale * -0.5;
      if (v20) {
        double v21 = 0.0;
      }
      double v42 = v21;
      if (v14)
      {
        v50.width = 4.0;
        v50.height = -4.0;
        CGContextSetShadow(Type, v50, 3.0);
      }
      CGContextRef c = Type;
      uint64_t v22 = (uint64_t)FontSize;
      if ((uint64_t)FontSize >= 1)
      {
        uint64_t v23 = 0;
        double v24 = floor(Scale * 0.5);
        double v41 = floor(Scale * 0.25);
        double v25 = (double)Count;
        double v26 = a4 / (double)Count;
        double v27 = a3 / (double)Count;
        do
        {
          if (Count >= 1)
          {
            unint64_t v28 = Count + 1;
            do
            {
              uint64_t v29 = v28 - 2;
              double v30 = CFArrayGetValueAtIndex(theArray, v28 - 2);
              CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)v30);
              if (v23 < CFArrayGetCount(Values))
              {
                valuePtr[0] = 0.0;
                CFNumberRef v32 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, v23);
                CFNumberGetValue(v32, kCFNumberCGFloatType, valuePtr);
                double v33 = valuePtr[0];
                if (valuePtr[0] <= v43)
                {
                  BOOL v34 = valuePtr[0] < MinValue;
                }
                else
                {
                  double v33 = v43;
                  BOOL v34 = 1;
                }
                if (v34)
                {
                  if (v33 < MinValue) {
                    double v33 = MinValue;
                  }
                  valuePtr[0] = v33;
                }
                OIAxisConvertValueToLocal(String, (double)v23);
                double v35 = v44 + OIAxisConvertValueToLocal(v17, 0.0);
                double v36 = a3 * (double)v29 / v25 + v41 + v42 + v45 + OIAxisConvertValueToLocal(String, (double)v23);
                double v37 = a4 * (double)v29 / v25 + v35;
                double v38 = v44 + OIAxisConvertValueToLocal(v17, valuePtr[0]) - v35;
                _OIRenderColumnFloor(a1, v36, v37, v24, v38, v27, v26);
                _OIRenderColumn(a1, (uint64_t)v30, v36, v37, v24, v38, v27, v26);
              }
              --v28;
            }
            while (v28 > 1);
          }
          ++v23;
        }
        while (v23 != v22);
      }
      CGContextRestoreGState(c);
    }
  }
}

void OIRender3DStackedColumnsInChart(uint64_t a1, const __CFArray *a2)
{
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  OIChartGetPlotArea(a1);
  double v6 = v5;
  double v8 = v7;
  double v9 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  double v10 = OIChartGetRotation(a1) / 45.0 * (v6 / v9);
  double v11 = OIChartGetElevation(a1) / 90.0 * (v8 / v9);

  _OIRenderStackedColumnsInChart(a1, a2, 0, v10, v11);
}

void OIRender3DPercentStackedColumnsInChart(uint64_t a1, const __CFArray *a2)
{
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  OIChartGetPlotArea(a1);
  double v6 = v5;
  double v8 = v7;
  double v9 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  double v10 = OIChartGetRotation(a1) / 45.0 * (v6 / v9);
  double v11 = OIChartGetElevation(a1) / 90.0 * (v8 / v9);

  _OIRenderStackedColumnsInChart(a1, a2, 1, v10, v11);
}

void _OIRenderColumnFloor(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  Type = (CGContext *)OIAxisGetType(a1);
  double v13 = a2 + a6 * 0.25;
  double v14 = a3 + a7 * 0.25;
  double v15 = a6 * 0.5;
  double v16 = a7 * 0.5;
  CFMutableDictionaryRef Mutable = CGPathCreateMutable();
  GenericRGB = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
  CGFloat v19 = floor(v14) + 0.5;
  CGPathMoveToPoint(Mutable, 0, floor(v13) + 0.5, v19);
  CGFloat v20 = floor(v16 + v14) + 0.5;
  CGPathAddLineToPoint(Mutable, 0, floor(v15 + v13) + 0.5, v20);
  double v21 = a4 + v13;
  CGPathAddLineToPoint(Mutable, 0, floor(v15 + v21) + 0.5, v20);
  CGPathAddLineToPoint(Mutable, 0, floor(v21) + 0.5, v19);
  CGPathCloseSubpath(Mutable);
  CGContextSetFillColorWithColor(Type, GenericRGB);
  CGContextAddPath(Type, Mutable);
  CGContextFillPath(Type);
  CGPathRelease(Mutable);

  CGColorRelease(GenericRGB);
}

void _OIRenderColumn(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8)
{
  Type = (CGContext *)OIAxisGetType(a1);
  uint64_t TextColor = (CGColor *)OILabelGetTextColor(a2);
  uint64_t StrokeColor = (CGColor *)OILabelGetStrokeColor(a2);
  uint64_t FillImage = OISeriesGetFillImage(a2);
  double StrokeWidth = OILabelGetStrokeWidth(a2);
  CGFloat v20 = StrokeWidth;
  if (a7 == 0.0 && a8 == 0.0)
  {
    if (FillImage)
    {
      OISeriesSetupFillImageForContext(a2, Type);
    }
    else
    {
      if (!TextColor) {
        goto LABEL_10;
      }
      CGContextSetFillColorWithColor(Type, TextColor);
    }
    v53.origin.CGFloat x = a3;
    v53.origin.y = a4;
    v53.size.CGFloat width = a5;
    v53.size.height = a6;
    CGContextFillRect(Type, v53);
LABEL_10:
    if (StrokeColor)
    {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      CGContextSetLineWidth(Type, v20);
      CGFloat v33 = a3;
      CGFloat v34 = a4;
      CGFloat v35 = a5;
      CGFloat v36 = a6;
      CGContextStrokeRect(Type, *(CGRect *)&v33);
    }
    return;
  }
  CGFloat width = StrokeWidth;
  double v21 = a3 + a7 * 0.25;
  double v22 = a4 + a8 * 0.25;
  CFMutableDictionaryRef Mutable = CGPathCreateMutable();
  CGFloat v24 = floor(v21) + 0.5;
  double v25 = a5;
  CGFloat v26 = floor(v22) + 0.5;
  CGPathMoveToPoint(Mutable, 0, v24, v26);
  double v50 = a6;
  double v48 = v22;
  double v27 = a6 + v22;
  CGFloat v28 = v26;
  double v47 = v27;
  CGFloat v29 = floor(v27) + 0.5;
  CGFloat x = v24;
  CGPathAddLineToPoint(Mutable, 0, v24, v29);
  double v46 = v21;
  double v30 = v25 + v21;
  double v31 = floor(v25 + v21) + 0.5;
  CGFloat v49 = v29;
  CGPathAddLineToPoint(Mutable, 0, v31, v29);
  CGPathAddLineToPoint(Mutable, 0, v31, v28);
  CGPathCloseSubpath(Mutable);
  if (FillImage)
  {
    OISeriesSetupFillImageForContext(a2, Type);
    double v32 = a8;
LABEL_16:
    CGContextAddPath(Type, Mutable);
    CGContextFillPath(Type);
    goto LABEL_17;
  }
  double v32 = a8;
  if (TextColor)
  {
    CGContextSetFillColorWithColor(Type, TextColor);
    goto LABEL_16;
  }
LABEL_17:
  double v38 = v32 * 0.5;
  if (StrokeColor)
  {
    CGContextSetStrokeColorWithColor(Type, StrokeColor);
    CGContextAddPath(Type, Mutable);
    CGContextSetLineWidth(Type, width);
    CGContextStrokePath(Type);
  }
  CGPathRelease(Mutable);
  double v39 = OICreateDimmedColorFromColor(TextColor, 0.5);
  CFArrayRef v40 = CGPathCreateMutable();
  CGPathMoveToPoint(v40, 0, v31, v28);
  CGPathAddLineToPoint(v40, 0, v31, v49);
  double v37 = a7 * 0.5;
  double v41 = floor(a7 * 0.5 + v30) + 0.5;
  double v42 = floor(v38 + v47) + 0.5;
  CGPathAddLineToPoint(v40, 0, v41, v42);
  CGPathAddLineToPoint(v40, 0, v41, floor(v38 + v48) + 0.5);
  CGPathCloseSubpath(v40);
  if (v39)
  {
    CGContextSetFillColorWithColor(Type, v39);
    CGContextAddPath(Type, v40);
    CGContextFillPath(Type);
  }
  if (StrokeColor)
  {
    CGContextSetStrokeColorWithColor(Type, StrokeColor);
    CGContextAddPath(Type, v40);
    CGContextSetLineWidth(Type, width);
    CGContextStrokePath(Type);
  }
  CGPathRelease(v40);
  CGColorRelease(v39);
  if (v50 >= 0.0)
  {
    double v43 = CGPathCreateMutable();
    double v44 = OICreateDimmedColorFromColor(TextColor, 0.8);
    CGPathMoveToPoint(v43, 0, x, v49);
    CGPathAddLineToPoint(v43, 0, floor(v37 + v46) + 0.5, v42);
    CGPathAddLineToPoint(v43, 0, v41, v42);
    CGPathAddLineToPoint(v43, 0, v31, v49);
    CGPathCloseSubpath(v43);
    if (v44)
    {
      CGContextSetFillColorWithColor(Type, v44);
      CGContextAddPath(Type, v43);
      CGContextFillPath(Type);
    }
    if (StrokeColor)
    {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      CGContextAddPath(Type, v43);
      CGContextSetLineWidth(Type, width);
      CGContextStrokePath(Type);
    }
    CGPathRelease(v43);
    CGColorRelease(v44);
  }
}

void OIRenderRadarInChart(uint64_t a1, CFArrayRef theArray)
{
  if (theArray)
  {
    CFArrayRef v2 = theArray;
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count)
    {
      uint64_t v5 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      double PlotArea = OIChartGetPlotArea(a1);
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      int v42 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      v47.origin.double x = PlotArea;
      v47.origin.y = v9;
      v47.size.CGFloat width = v11;
      v47.size.height = v13;
      CGContextClipToRect(Type, v47);
      ValueAtIndedouble x = CFArrayGetValueAtIndex(v2, 0);
      uint64_t String = OILabelGetString((uint64_t)ValueAtIndex);
      uint64_t v16 = OIAxisGetType((uint64_t)ValueAtIndex);
      double FontSize = OILabelGetFontSize(String);
      if (v5 >= 1)
      {
        CFIndex v18 = 0;
        double v19 = PlotArea + v11 * 0.5;
        double v20 = v9 + v13 * 0.5;
        uint64_t v21 = (uint64_t)FontSize;
        double v22 = (double)(uint64_t)FontSize;
        double x = floor(v19) + 0.5;
        double v23 = floor(v20) + 0.5;
        uint64_t v40 = v5;
        CFArrayRef v41 = v2;
        do
        {
          CGFloat v24 = CFArrayGetValueAtIndex(v2, v18);
          CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)v24);
          uint64_t TextColor = OILabelGetTextColor((uint64_t)v24);
          uint64_t StrokeColor = OILabelGetStrokeColor((uint64_t)v24);
          if (v42)
          {
            v46.CGFloat width = 0.0;
            v46.height = -2.0;
            CGContextSetShadow(Type, v46, 3.0);
          }
          double valuePtr = 0.0;
          CFIndex v27 = CFArrayGetCount(Values);
          if (!v27) {
            goto LABEL_24;
          }
          CFIndex v28 = v27;
          uint64_t v43 = StrokeColor;
          uint64_t v29 = v21;
          if (v27 >= v21) {
            uint64_t v30 = v21;
          }
          else {
            uint64_t v30 = v27;
          }
          if (v30 >= 1)
          {
            uint64_t v31 = 0;
            for (CFIndex i = 0; i != v30; ++i)
            {
              CFNumberRef v33 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, i);
              CFNumberGetValue(v33, kCFNumberCGFloatType, &valuePtr);
              double v34 = OIAxisConvertValueToLocal(v16, valuePtr) * 0.5;
              __double2 v35 = __sincos_stret((double)v31 * -3.14159265 / v22 + 1.57079633);
              double v36 = floor(v19 + v34 * v35.__cosval) + 0.5;
              double v37 = floor(v20 + v34 * v35.__sinval) + 0.5;
              if (i) {
                CGContextAddLineToPoint(Type, v36, v37);
              }
              else {
                CGContextMoveToPoint(Type, v36, v37);
              }
              v31 += 2;
            }
          }
          OISeriesSetupStrokeAndFillForContext((uint64_t)v24, Type);
          uint64_t v21 = v29;
          if (v28 >= v29)
          {
            CGContextClosePath(Type);
            uint64_t v5 = v40;
            CFArrayRef v2 = v41;
            uint64_t v38 = v43;
            if (!TextColor) {
              goto LABEL_22;
            }
          }
          else
          {
            uint64_t v5 = v40;
            CFArrayRef v2 = v41;
            uint64_t v38 = v43;
            if (!TextColor) {
              goto LABEL_22;
            }
            CGContextAddLineToPoint(Type, x, v23);
            CGContextClosePath(Type);
          }
          CGContextFillPath(Type);
LABEL_22:
          if (v38) {
            CGContextStrokePath(Type);
          }
LABEL_24:
          ++v18;
        }
        while (v18 != v5);
      }
      CGContextRestoreGState(Type);
    }
  }
}

void OILabelRenderInContext(uint64_t a1, CGContextRef c)
{
  v31[2] = *MEMORY[0x263EF8340];
  CGContextSaveGState(c);
  int HasShadow = OILabelHasShadow(a1);
  if (HasShadow)
  {
    v32.CGFloat width = 0.0;
    v32.height = -4.0;
    CGContextSetShadow(c, v32, 6.0);
  }
  CFStringRef String = (const __CFString *)OILabelGetString(a1);
  double Frame = OILabelGetFrame(a1);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  FillColor = (CGColor *)OILabelGetFillColor(a1);
  double v14 = (CGColor *)OILabelGetFillColor(a1);
  uint64_t TextColor = OILabelGetTextColor(a1);
  double StrokeWidth = OILabelGetStrokeWidth(a1);
  if (FillColor)
  {
    CGContextSetFillColorWithColor(c, FillColor);
    v34.origin.double x = floor(Frame) + 0.5;
    v34.origin.y = floor(v8) + 0.5;
    v34.size.CGFloat width = ceil(v10);
    v34.size.height = ceil(v12);
    CGContextFillRect(c, v34);
  }
  if (HasShadow)
  {
    v33.CGFloat width = 0.0;
    v33.height = 0.0;
    CGContextSetShadow(c, v33, 0.0);
  }
  v35.origin.double x = Frame;
  v35.origin.y = v8;
  v35.size.CGFloat width = v10;
  v35.size.height = v12;
  CGContextClipToRect(c, v35);
  double FontSize = OILabelGetFontSize(a1);
  if (FontSize <= v12) {
    double v17 = FontSize;
  }
  else {
    double v17 = v12 + -1.0;
  }
  CGContextSetTextDrawingMode(c, kCGTextFill);
  double v19 = OISizeForStringInContext(String, v17);
  if (v19 > v10 + -4.0)
  {
    double v17 = v17 * ((v10 + -4.0) / v19);
    double v19 = OISizeForStringInContext(String, v17);
  }
  double v20 = v18;
  int Alignment = OILabelGetAlignment(a1);
  double v22 = Frame + v10 - v19;
  if (Alignment != 1) {
    double v22 = Frame;
  }
  if (Alignment == 2) {
    double v23 = Frame + v10 * 0.5 - v19 * 0.5;
  }
  else {
    double v23 = v22;
  }
  CGFloat v24 = (void *)MEMORY[0x263EFF9A0];
  v30[0] = *MEMORY[0x263F039A0];
  CTFontRef v25 = OICreateDefaultFontWithSize(v17);
  v30[1] = *MEMORY[0x263F03C60];
  v31[0] = v25;
  v31[1] = TextColor;
  CGFloat v26 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  CFIndex v27 = [v24 dictionaryWithDictionary:v26];

  if (v14 && StrokeWidth != 0.0)
  {
    CGContextSetLineWidth(c, StrokeWidth);
    CGContextSetStrokeColorWithColor(c, v14);
    v36.origin.double x = floor(Frame) + 0.5;
    v36.origin.y = floor(v8) + 0.5;
    v36.size.CGFloat width = ceil(v10);
    v36.size.height = ceil(v12);
    CGContextStrokeRect(c, v36);
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __OILabelRenderInContext_block_invoke;
  v29[3] = &__block_descriptor_48_e29__CGPoint_dd_24__0_CGSize_dd_8l;
  *(double *)&v29[4] = v23;
  *(double *)&v29[5] = v8 + (v12 + -4.0 - v20) * 0.5 + 2.0;
  OIDrawStringWithAttributes(String, v27, c, v29);
  CGContextRestoreGState(c);
}

double __OILabelRenderInContext_block_invoke(uint64_t a1)
{
  return floor(*(double *)(a1 + 32)) + 0.5;
}

void OILabelCollectionRenderInContext(uint64_t a1, CGContext *a2)
{
  CFArrayRef String = (const __CFArray *)OILabelGetString(a1);
  CFIndex Count = CFArrayGetCount(String);
  if (Count < 1)
  {
    double v7 = 100.0;
  }
  else
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    double v7 = 100.0;
    do
    {
      ValueAtIndedouble x = CFArrayGetValueAtIndex(String, v6);
      Mindouble FontSize = _OILabelGetMinFontSize((uint64_t)ValueAtIndex);
      if (MinFontSize < v7) {
        double v7 = MinFontSize;
      }
      ++v6;
    }
    while (v5 != v6);
  }
  CFIndex v10 = CFArrayGetCount(String);
  if (v10 >= 1)
  {
    CFIndex v11 = v10;
    for (CFIndex i = 0; i != v11; ++i)
    {
      double v13 = CFArrayGetValueAtIndex(String, i);
      OILabelSetFontSize((uint64_t)v13, v7);
    }
  }
  CGContextSaveGState(a2);
  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v19.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v19.CGContextRef c = v14;
  *(_OWORD *)&v19.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGContextSetTextMatrix(a2, &v19);
  CFIndex v15 = CFArrayGetCount(String);
  if (v15 >= 1)
  {
    CFIndex v16 = v15;
    for (CFIndex j = 0; j != v16; ++j)
    {
      double v18 = CFArrayGetValueAtIndex(String, j);
      OILabelRenderInContext((uint64_t)v18, a2);
    }
  }
  CGContextRestoreGState(a2);
}

double _OILabelGetMinFontSize(uint64_t a1)
{
  CFStringRef String = (const __CFString *)OILabelGetString(a1);
  OILabelGetFrame(a1);
  double v4 = v3;
  double FontSize = OILabelGetFontSize(a1);
  double v6 = OISizeForStringInContext(String, FontSize);
  if (v6 > v4 + -4.0) {
    return FontSize * ((v4 + -4.0) / v6);
  }
  return FontSize;
}

CGImageRef OIChartingCreateImageRef(const __CFDictionary *a1, _DWORD *a2, double a3, double a4)
{
  return OIChartingCreateImageRefWithFormatterCallback(a1, 0, a2, a3, a4);
}

CGImageRef OIChartingCreateImageRefWithFormatterCallback(const __CFDictionary *a1, uint64_t a2, _DWORD *a3, double a4, double a5)
{
  if (!a1) {
    return 0;
  }
  CGImageRef Image = 0;
  if (a4 > 0.0 && a5 > 0.0)
  {
    size_t v11 = vcvtd_n_u64_f64(a4, 2uLL);
    double v12 = malloc_type_calloc((unint64_t)a5, v11, 0x70311256uLL);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    long long v14 = CGBitmapContextCreate(v12, (unint64_t)a4, (unint64_t)a5, 8uLL, v11, DeviceRGB, 0x2002u);
    if (v14)
    {
      CFIndex v15 = v14;
      CGContextSetShouldAntialias(v14, 1);
      ChartFromData = _OIChartingCreateChartFromData(a1, v15, a2, a4, a5);
      if (ChartFromData)
      {
        double v17 = ChartFromData;
        if (OIChartGetStatus((uint64_t)ChartFromData))
        {
          CGImageRef Image = 0;
        }
        else
        {
          OIChartDraw((uint64_t)v17);
          CGImageRef Image = OIChartCreateImage((uint64_t)v17);
        }
        *a3 = OIChartGetStatus((uint64_t)v17);
        OIChartRelease(v17);
      }
      else
      {
        CFShow(@"Cannot create chart object");
        CGImageRef Image = 0;
        *a3 = 1;
      }
      CGContextRelease(v15);
      if (!DeviceRGB) {
        goto LABEL_16;
      }
    }
    else
    {
      CFShow(@"Cannot create context");
      CGImageRef Image = 0;
      *a3 = 0;
      if (!DeviceRGB)
      {
LABEL_16:
        if (v12) {
          free(v12);
        }
        return Image;
      }
    }
    CGColorSpaceRelease(DeviceRGB);
    goto LABEL_16;
  }
  return Image;
}

double *_OIChartingCreateChartFromData(const __CFDictionary *a1, CGContext *a2, uint64_t a3, double a4, double a5)
{
  double v7 = OIChartCreate(0, a2, a4, a5);
  double v8 = (double *)v7;
  if (v7)
  {
    OIChartSetCustomFormatterCallback((uint64_t)v7, a3);
    _OIChartingSetupColors((uint64_t)v8, a1);
    _OIChartingGetSeriesFromData((uint64_t)v8, a1);
    _OIChartingSetupAxisRanges((uint64_t)v8);
    _OIChartingSetupArea(v8, a1);
    _OIChartingUpdateAxisWithData((uint64_t)v8, a1);
    _OIChartingGetLabelsFromData((uint64_t)v8, a1);
  }
  return v8;
}

__CFData *OIChartingCreatePDFData(const __CFDictionary *a1, _DWORD *a2, CGFloat a3, CGFloat a4)
{
  return OIChartingCreatePDFDataWithFormatterCallback(a1, 0, a2, a3, a4);
}

__CFData *OIChartingCreatePDFDataWithFormatterCallback(const __CFDictionary *a1, uint64_t a2, _DWORD *a3, CGFloat a4, CGFloat a5)
{
  if (!a1) {
    return 0;
  }
  CFMutableDictionaryRef Mutable = 0;
  if (a4 > 0.0 && a5 > 0.0)
  {
    CFMutableDictionaryRef Mutable = CFDataCreateMutable(0, 0);
    size_t v11 = CGDataConsumerCreateWithCFData(Mutable);
    if (v11)
    {
      double v12 = v11;
      v18.origin.double x = 0.0;
      v18.origin.y = 0.0;
      v18.size.CGFloat width = a4;
      v18.size.height = a5;
      double v13 = CGPDFContextCreate(v11, &v18, 0);
      if (v13)
      {
        long long v14 = v13;
        ChartFromData = _OIChartingCreateChartFromData(a1, v13, a2, a4, a5);
        if (ChartFromData)
        {
          CFIndex v16 = ChartFromData;
          if (!OIChartGetStatus((uint64_t)ChartFromData))
          {
            CGContextBeginPage(v14, &v18);
            CGContextSetShouldAntialias(v14, 1);
            OIChartDraw((uint64_t)v16);
            CGContextEndPage(v14);
          }
          *a3 = OIChartGetStatus((uint64_t)v16);
          OIChartRelease(v16);
        }
        CGContextRelease(v14);
      }
      else
      {
        CFShow(@"Cannot create PDF context");
        *a3 = 0;
      }
      CGDataConsumerRelease(v12);
    }
    else
    {
      CFShow(@"Cannot create DataConsumer");
      *a3 = 0;
    }
  }
  return Mutable;
}

uint64_t _OIChartingSetupColors(uint64_t a1, CFDictionaryRef theDict)
{
  double v31 = 0.0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"kOIChartUseShadowsKey");
  if (Value)
  {
    uint64_t valuePtr = 0;
    if (CFNumberGetValue(Value, kCFNumberNSIntegerType, &valuePtr)) {
      OIChartSetUseShadows(a1, valuePtr != 0);
    }
  }
  CFDictionaryRef v5 = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"kOIChartCanvasKey");
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    double v7 = (CGColor *)CFDictionaryGetValue(v5, @"kOIChartStrokeColorKey");
    double v8 = (CGColor *)CFDictionaryGetValue(v6, @"kOIChartFillColorKey");
    CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue(v6, @"kOIChartStrokeWidthKey");
    if (v9 && CFNumberGetValue(v9, kCFNumberCGFloatType, &v31)) {
      OIChartSetCanvasStrokeWidth(a1, v31);
    }
    if (v8) {
      OIChartSetCanvasFillColor(a1, v8);
    }
    if (v7) {
      OIChartSetCanvasStrokeColor(a1, v7);
    }
  }
  CFDictionaryRef v10 = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"kOIChartPlotKey");
  if (v10)
  {
    CFDictionaryRef v11 = v10;
    double v12 = (CGColor *)CFDictionaryGetValue(v10, @"kOIChartStrokeColorKey");
    double v13 = (CGColor *)CFDictionaryGetValue(v11, @"kOIChartFillColorKey");
    CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(v11, @"kOIChartStrokeWidthKey");
    if (v13)
    {
      OIChartSetPlotFillColor(a1, v13);
      if (v12) {
        goto LABEL_15;
      }
    }
    else
    {
      GenericRGB = OIColorCreateGenericRGB(0.8, 0.8, 0.8, 1.0);
      OIChartSetPlotFillColor(a1, GenericRGB);
      CGColorRelease(GenericRGB);
      if (v12)
      {
LABEL_15:
        OIAxisSetStrokeColor(a1, v12);
        if (v14) {
          goto LABEL_16;
        }
        goto LABEL_21;
      }
    }
    CGRect v18 = OIColorCreateGenericRGB(0.5, 0.5, 0.5, 1.0);
    OIAxisSetStrokeColor(a1, v18);
    CGColorRelease(v18);
    if (v14)
    {
LABEL_16:
      int v15 = CFNumberGetValue(v14, kCFNumberCGFloatType, &v31);
      double v16 = v31;
      if (!v15) {
        double v16 = 1.0;
      }
      goto LABEL_22;
    }
LABEL_21:
    double v16 = 1.0;
LABEL_22:
    OIChartSetPlotStrokeWidth(a1, v16);
    CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(v11, @"kOIChartHidePlotAreaKey");
    if (v19)
    {
      uint64_t valuePtr = 0;
      if (CFNumberGetValue(v19, kCFNumberNSIntegerType, &valuePtr)) {
        OIChartSetHidePlotArea(a1, valuePtr != 0);
      }
    }
  }
  uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"kOIChartLegendKey");
  if (result)
  {
    CFDictionaryRef v21 = (const __CFDictionary *)result;
    uint64_t v29 = 0;
    uint64_t valuePtr = 0;
    double v22 = (CGColor *)CFDictionaryGetValue((CFDictionaryRef)result, @"kOIChartStrokeColorKey");
    double v23 = (CGColor *)CFDictionaryGetValue(v21, @"kOIChartFillColorKey");
    CGFloat v24 = (CGColor *)CFDictionaryGetValue(v21, @"kOIChartTextColorKey");
    CFNumberRef v25 = (const __CFNumber *)CFDictionaryGetValue(v21, @"kOIChartStrokeWidthKey");
    if (v25 && CFNumberGetValue(v25, kCFNumberCGFloatType, &v31)) {
      OIChartSetLegendStrokeWidth(a1, v31);
    }
    CFNumberRef v26 = (const __CFNumber *)CFDictionaryGetValue(v21, @"kOIChartHasShadowKey");
    if (v26 && CFNumberGetValue(v26, kCFNumberCGFloatType, &valuePtr)) {
      OIChartSetLegendHasShadow(a1, valuePtr != 0);
    }
    CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue(v21, @"kOIChartLegendPlacementKey");
    if (v27 && CFNumberGetValue(v27, kCFNumberNSIntegerType, &v29)) {
      OIChartSetLegendPlacement(a1, v29);
    }
    if (v24) {
      OIChartSetLegendTextColor(a1, v24);
    }
    if (v23) {
      OIChartSetLegendFillColor(a1, v23);
    }
    if (v22) {
      OIChartSetLegendStrokeColor(a1, v22);
    }
    uint64_t result = (uint64_t)CFDictionaryGetValue(v21, @"kOIChartHideLegendKey");
    if (result)
    {
      uint64_t v28 = 0;
      uint64_t result = CFNumberGetValue((CFNumberRef)result, kCFNumberNSIntegerType, &v28);
      if (result) {
        return OIChartSetHideLegend(a1, v28 != 0);
      }
    }
  }
  return result;
}

void _OIChartingGetSeriesFromData(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, @"kOIChartSeriesKey");
  if (!Value) {
    return;
  }
  CFArrayRef v4 = Value;
  memset(v23, 0, sizeof(v23));
  CFIndex Count = CFArrayGetCount(Value);
  if (Count < 1) {
    return;
  }
  CFIndex v6 = Count;
  CFIndex v7 = 0;
  char v8 = 0;
  do
  {
    ValueAtIndedouble x = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v7);
    CFDictionaryRef v10 = OISeriesCreateFromDictionary(ValueAtIndex);
    if (!v10) {
      goto LABEL_52;
    }
    CFDictionaryRef v11 = v10;
    CFStringRef SubType = (const __CFString *)OIAxisGetSubType((uint64_t)v10);
    if (CFStringCompare(SubType, @"kOIChartStackedColumnType", 0)
      && CFStringCompare(SubType, @"kOIChart3DStackedColumnType", 0))
    {
      if (CFEqual(SubType, @"kOIChartPercentStackedColumnType")
        || CFEqual(SubType, @"kOIChart3DPercentStackedColumnType"))
      {
        goto LABEL_28;
      }
      if (CFEqual(SubType, @"kOIChartBarType")
        || CFEqual(SubType, @"kOIChart3DBarType"))
      {
        uint64_t v19 = 0;
LABEL_57:
        _OIChartingSetupBarTypeAxis(a1, (uint64_t)v11, v19);
        goto LABEL_30;
      }
      if (CFEqual(SubType, @"kOIChartStackedBarType")
        || CFEqual(SubType, @"kOIChart3DStackedBarType"))
      {
        uint64_t v19 = 2;
        goto LABEL_57;
      }
      if (CFEqual(SubType, @"kOIChartPercentStackedBarType")
        || CFEqual(SubType, @"kOIChart3DPercentStackedBarType"))
      {
        uint64_t v19 = 3;
        goto LABEL_57;
      }
      if (CFStringCompare(SubType, @"kOIChartStackedLineType", 0)
        && CFStringCompare(SubType, @"kOIChartStackedLineType", 0))
      {
        if (CFStringCompare(SubType, @"kOIChartPercentStackedLineType", 0)
          && CFStringCompare(SubType, @"kOIChartPercentStackedLineType", 0))
        {
          if (CFEqual(SubType, @"kOIChartXYType")
            || CFEqual(SubType, @"kOIChartBubbleType"))
          {
            _OIChartingSetupXYTypeAxis(a1, (uint64_t)v11);
            goto LABEL_30;
          }
          if (CFEqual(SubType, @"kOIChartPieType")
            || CFEqual(SubType, @"kOIChart3DPieType")
            || (CFComparisonResult v13 = CFStringCompare(SubType, @"kOIChartDoughnutType", 0), v14 = 0, v13 == kCFCompareEqualTo))
          {
            if ((OIChartGetHidePlotArea(a1) & 1) == 0) {
              OIChartSetLegendPlacement(a1, 3);
            }
            int v15 = 1;
            goto LABEL_31;
          }
          goto LABEL_29;
        }
LABEL_28:
        uint64_t v14 = 3;
        goto LABEL_29;
      }
    }
    uint64_t v14 = 2;
LABEL_29:
    _OIChartingSetupColumnTypeAxis(a1, (uint64_t)v11, v14);
LABEL_30:
    int v15 = v16;
LABEL_31:
    if (!OILabelGetTextColor((uint64_t)v11)
      && (!OILabelGetStrokeColor((uint64_t)v11) || OILabelGetStrokeWidth((uint64_t)v11) == 0.0))
    {
      if ((v8 & 1) == 0)
      {
        uint64_t valuePtr = 0;
        CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"kOIChartColorThemeKey");
        if (v17 && !CFNumberGetValue(v17, kCFNumberNSIntegerType, &valuePtr)) {
          uint64_t valuePtr = 0;
        }
        _OIChartingInitColors((CGColorRef *)v23, valuePtr);
      }
      if (CFStringCompare(SubType, @"kOIChartXYType", 0)
        && CFStringCompare(SubType, @"kOIChartLineType", 0)
        && CFStringCompare(SubType, @"kOIChartStackedLineType", 0)
        && CFStringCompare(SubType, @"kOIChartPercentStackedLineType", 0))
      {
        OILabelSetTextColor((uint64_t)v11, *((CGColorRef *)v23 + (v7 & 7)));
      }
      else
      {
        CGRect v18 = (CGColor *)*((void *)v23 + (v7 & 7));
        OILabelSetStrokeColor((uint64_t)v11, v18);
        if (OILabelGetStrokeWidth((uint64_t)v11) == 0.0) {
          OILabelSetStrokeWidth((uint64_t)v11, 1.0);
        }
        if (OIAxisGetLabels((uint64_t)v11)) {
          OISeriesSetMarkerColor((uint64_t)v11, v18);
        }
      }
      char v8 = 1;
    }
    if (v15) {
      OIChartAddSeries(a1, v11);
    }
    OISeriesRelease(v11);
LABEL_52:
    ++v7;
  }
  while (v6 != v7);
  if (v8)
  {
    for (uint64_t i = 0; i != 64; i += 8)
      CGColorRelease(*(CGColorRef *)((char *)v23 + i));
  }
}

void _OIChartingSetupAxisRanges(uint64_t a1)
{
  Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  if (Axis)
  {
    uint64_t v3 = (uint64_t)Axis;
    if (OIAxisGetType((uint64_t)Axis) == 1)
    {
      if (OIAxisGetSubType(v3) == 1) {
        _OIChartingUpdateAxisRangeWithBaseValuesFromSeries(a1, v3);
      }
      else {
        _OIChartingUpdateAxisRangeWithValuesFromSeries(a1, v3);
      }
    }
  }
  CFArrayRef v4 = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    if (OIAxisGetType((uint64_t)v4) == 1 && OIAxisGetSubType(v5) != 1) {
      _OIChartingUpdateAxisRangeWithValuesFromSeries(a1, v5);
    }
  }
  CFIndex v6 = OIChartGetAxis(a1, @"kOIChartAxisSecondaryXKey");
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    if (OIAxisGetType((uint64_t)v6) == 1)
    {
      if (OIAxisGetSubType(v7) == 1) {
        _OIChartingUpdateAxisRangeWithBaseValuesFromSeries(a1, v7);
      }
      else {
        _OIChartingUpdateAxisRangeWithValuesFromSeries(a1, v7);
      }
    }
  }
  char v8 = OIChartGetAxis(a1, @"kOIChartAxisSecondaryYKey");
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    if (OIAxisGetType((uint64_t)v8) == 1 && OIAxisGetSubType(v9) != 1)
    {
      _OIChartingUpdateAxisRangeWithValuesFromSeries(a1, v9);
    }
  }
}

double *_OIChartingSetupArea(double *a1, const __CFDictionary *a2)
{
  double Size = OIChartGetSize((uint64_t)a1);
  double v6 = v5;
  double v7 = v5 * 0.98;
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a2, @"kOIChartTitleKey");
  if (Value)
  {
    CFDictionaryRef v9 = (const __CFDictionary *)CFDictionaryGetValue(Value, @"kOIChartTitleAreaKey");
    if (v9) {
      double v10 = v7;
    }
    else {
      double v10 = v7 + -28.0;
    }
  }
  else
  {
    CFDictionaryRef v9 = 0;
    double v10 = v7;
  }
  double v11 = Size * 0.01;
  double v12 = v6 * 0.01;
  double v13 = Size * 0.98;
  CFDictionaryRef v14 = (const __CFDictionary *)CFDictionaryGetValue(a2, @"kOIChartLegendKey");
  if (!v14)
  {
    if (OIChartGetLegendPlacement((uint64_t)a1) == -1)
    {
      double v15 = v11;
      double v16 = v12;
      double v17 = v13;
      goto LABEL_38;
    }
    memset(&v37, 0, sizeof(v37));
    if (v9) {
      goto LABEL_8;
    }
LABEL_13:
    SeriesCFIndex Count = OIChartGetSeriesCount((uint64_t)a1);
    uint64_t LegendPlacement = OIChartGetLegendPlacement((uint64_t)a1);
    uint64_t v20 = (uint64_t)(floor((double)(uint64_t)SeriesCount / 10.0) + 1.0);
    double v15 = v11;
    double v16 = v12;
    double v17 = v13;
    switch(LegendPlacement)
    {
      case 0:
        v37.origin.double x = v11;
        v37.origin.double y = v12;
        double v22 = (double)(20 * v20);
        if (v10 * 0.5 < v22) {
          double v22 = v10 * 0.5;
        }
        v37.size.double width = v13;
        v37.size.double height = v22;
        double v10 = v10 - v22;
        double v16 = v12 + v22;
        double v15 = v11;
        goto LABEL_10;
      case 1:
        double v25 = (double)v20 * 0.15 * v13;
        if (v25 > v13 * 0.5) {
          double v25 = v13 * 0.5;
        }
        v37.size.double width = v25;
        double v17 = v13 - v25;
        v37.origin.double x = v13 - v25;
        CFArrayRef v26 = OIChartGetSeriesCount((uint64_t)a1);
        double v10 = v10 - (double)(10 * (uint64_t)v26);
        v37.size.double height = (double)(10 * (uint64_t)v26);
        v37.origin.double y = v10;
        goto LABEL_30;
      case 2:
        double v23 = (double)(20 * v20);
        if (v10 * 0.5 < v23) {
          double v23 = v10 * 0.5;
        }
        v37.size.double width = v13;
        v37.size.double height = v23;
        double v10 = v10 - v23;
        v37.origin.double x = v11;
        v37.origin.double y = v10;
        goto LABEL_9;
      case 3:
      case 7:
        double v21 = (double)v20 * 0.15 * v13;
        if (v21 > v13 * 0.5) {
          double v21 = v13 * 0.5;
        }
        v37.size.double width = v21;
        v37.size.double height = v10;
        double v17 = v13 - v21;
        v37.origin.double x = v13 - v21;
        v37.origin.double y = v12;
LABEL_30:
        double v15 = v11;
        goto LABEL_31;
      case 4:
        v37.origin.double x = v11;
        v37.origin.double y = v12;
        double v24 = (double)v20 * 0.15 * v13;
        if (v24 > v13 * 0.5) {
          double v24 = v13 * 0.5;
        }
        v37.size.double width = v24;
        v37.size.double height = v10;
        double v17 = v13 - v24;
        double v15 = v11 + v24;
LABEL_31:
        double v16 = v12;
        break;
      case 5:
      case 6:
        goto LABEL_32;
      default:
        goto LABEL_9;
    }
    goto LABEL_32;
  }
  memset(&v37, 0, sizeof(v37));
  CFDictionaryRef v9 = (const __CFDictionary *)CFDictionaryGetValue(v14, @"kOIChartLegendAreaKey");
  if (!v9) {
    goto LABEL_13;
  }
LABEL_8:
  CGRectMakeWithDictionaryRepresentation(v9, &v37);
LABEL_9:
  double v15 = v11;
  double v16 = v12;
LABEL_10:
  double v17 = v13;
LABEL_32:
  if (v37.size.width > 0.0 && v37.size.height > 0.0)
  {
    if (OIChartGetHidePlotArea((uint64_t)a1))
    {
      v37.origin.double x = v11;
      v37.origin.double y = v12;
      double height = v7;
      double width = v13;
      double y = v12;
      double x = v11;
      v37.size.double width = v13;
      v37.size.double height = v7;
    }
    else
    {
      double y = v37.origin.y;
      double x = v37.origin.x;
      double height = v37.size.height;
      double width = v37.size.width;
    }
    OIChartSetLegendArea(a1, x, y, width, height);
  }
LABEL_38:
  int HideLegend = OIChartGetHideLegend((uint64_t)a1);
  if (HideLegend) {
    double v32 = v11;
  }
  else {
    double v32 = v15;
  }
  if (HideLegend) {
    double v33 = v12;
  }
  else {
    double v33 = v16;
  }
  if (HideLegend) {
    double v34 = v13;
  }
  else {
    double v34 = v17;
  }
  if (HideLegend) {
    double v35 = v7;
  }
  else {
    double v35 = v10;
  }
  return OIChartSetPlotArea(a1, v32 + v34 * 0.12, v33 + v35 * 0.12, v34 - (v34 * 0.12 + v34 * 0.12 * 0.5), v35 + v35 * 0.12 * -2.0);
}

CFDictionaryRef _OIChartingUpdateAxisWithData(uint64_t a1, CFDictionaryRef theDict)
{
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"kOIChartAxisKey");
  if (Value)
  {
    CFDictionaryRef v5 = Value;
    CFDictionaryRef v6 = (const __CFDictionary *)CFDictionaryGetValue(Value, @"kOIChartAxisXKey");
    if (v6)
    {
      CFDictionaryRef v7 = v6;
      CFNumberRef Axis = (const __CFNumber *)OIChartGetAxis(a1, @"kOIChartAxisXKey");
      OIAxisUpdateWithDictionaryDescription(Axis, v7);
    }
    CFDictionaryRef v9 = (const __CFDictionary *)CFDictionaryGetValue(v5, @"kOIChartAxisYKey");
    if (v9)
    {
      CFDictionaryRef v10 = v9;
      CFNumberRef v11 = (const __CFNumber *)OIChartGetAxis(a1, @"kOIChartAxisYKey");
      OIAxisUpdateWithDictionaryDescription(v11, v10);
    }
    CFDictionaryRef v12 = (const __CFDictionary *)CFDictionaryGetValue(v5, @"kOIChartAxisSecondaryXKey");
    if (v12)
    {
      CFDictionaryRef v13 = v12;
      CFNumberRef v14 = (const __CFNumber *)OIChartGetAxis(a1, @"kOIChartAxisSecondaryXKey");
      OIAxisUpdateWithDictionaryDescription(v14, v13);
    }
    CFDictionaryRef v15 = (const __CFDictionary *)CFDictionaryGetValue(v5, @"kOIChartAxisSecondaryYKey");
    if (v15)
    {
      CFDictionaryRef v16 = v15;
      CFNumberRef v17 = (const __CFNumber *)OIChartGetAxis(a1, @"kOIChartAxisSecondaryYKey");
      OIAxisUpdateWithDictionaryDescription(v17, v16);
    }
  }
  OIChartGetPlotArea(a1);
  double v19 = v18;
  double v21 = v20;
  double v22 = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  OIAxisUpdateScaleForLength((uint64_t)v22, v19);
  double v23 = OIChartGetAxis(a1, @"kOIChartAxisSecondaryXKey");
  OIAxisUpdateScaleForLength((uint64_t)v23, v19);
  double v24 = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  OIAxisUpdateScaleForLength((uint64_t)v24, v21);
  double v25 = OIChartGetAxis(a1, @"kOIChartAxisSecondaryYKey");
  OIAxisUpdateScaleForLength((uint64_t)v25, v21);
  CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"kOIChart3DSettingsKey");
  if (result)
  {
    CFDictionaryRef v27 = result;
    CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(result, @"kOIChart3DRotationKey");
    if (v28)
    {
      uint64_t valuePtr = 0;
      CFNumberGetValue(v28, kCFNumberNSIntegerType, &valuePtr);
      OIChartSetRotation(a1, valuePtr);
    }
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(v27, @"kOIChart3DElevationKey");
    if (result)
    {
      uint64_t valuePtr = 0;
      CFNumberGetValue(result, kCFNumberNSIntegerType, &valuePtr);
      return (const __CFDictionary *)OIChartSetElevation(a1, valuePtr);
    }
  }
  return result;
}

void _OIChartingGetLabelsFromData(uint64_t a1, const __CFDictionary *a2)
{
  OIAxisGetType(a1);
  double PlotArea = OIChartGetPlotArea(a1);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double Size = OIChartGetSize(a1);
  double v13 = v12;
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a2, @"kOIChartTitleKey");
  if (Value)
  {
    CFDictionaryRef v15 = Value;
    CFDictionaryRef v16 = OILabelCreateFromDictionary(Value);
    if (v16)
    {
      CFNumberRef v17 = v16;
      OILabelSetAlignment((uint64_t)v16, 2);
      OILabelSetFontSize((uint64_t)v17, 14.0);
      double v18 = (CGColor *)CFDictionaryGetValue(v15, @"kOIChartTextColorKey");
      if (v18) {
        OILabelSetTextColor((uint64_t)v17, v18);
      }
      OILabelGetFrame((uint64_t)v17);
      if (v20 == 0.0 || v19 == 0.0)
      {
        CFStringRef String = (const __CFString *)OILabelGetString((uint64_t)v17);
        double v22 = OISizeForStringInContext(String, 14.0);
        OILabelSetFrame(v17, (Size - v22) * 0.5, v13 - v23, v22, v23);
      }
      OIChartAddLabel(a1, v17);
      OILabelRelease(v17);
    }
  }
  CFDictionaryRef v24 = (const __CFDictionary *)CFDictionaryGetValue(a2, @"kOIChartAxisKey");
  if (v24)
  {
    CFDictionaryRef v25 = v24;
    if (OIChartGetAxis(a1, @"kOIChartAxisXKey"))
    {
      CFDictionaryRef v26 = (const __CFDictionary *)CFDictionaryGetValue(v25, @"kOIChartAxisXKey");
      if (v26)
      {
        CFDictionaryRef v27 = (const __CFDictionary *)CFDictionaryGetValue(v26, @"kOIChartAxisTitleKey");
        if (v27)
        {
          CFNumberRef v28 = OILabelCreateFromDictionary(v27);
          if (v28)
          {
            uint64_t v29 = v28;
            OILabelSetFontSize((uint64_t)v28, 10.0);
            OILabelGetFrame((uint64_t)v29);
            if (v31 == 0.0 || v30 == 0.0)
            {
              CFStringRef v32 = (const __CFString *)OILabelGetString((uint64_t)v29);
              double v33 = OISizeForStringInContext(v32, 10.0);
              double v34 = v6 + -30.0;
              double v35 = v6 * 0.8;
              if (v6 + -30.0 < 0.0) {
                double v34 = 0.0;
              }
              if (v35 > v13 * 0.8) {
                double v35 = v13 * 0.8;
              }
              OILabelSetFrame(v29, PlotArea + v8 * 0.5 - v33, v34, v33 + v33, v35);
            }
            OIChartAddLabel(a1, v29);
            OILabelRelease(v29);
          }
        }
      }
    }
    if (OIChartGetAxis(a1, @"kOIChartAxisYKey"))
    {
      CFDictionaryRef v36 = (const __CFDictionary *)CFDictionaryGetValue(v25, @"kOIChartAxisYKey");
      if (v36)
      {
        CFDictionaryRef v37 = (const __CFDictionary *)CFDictionaryGetValue(v36, @"kOIChartAxisTitleKey");
        if (v37)
        {
          uint64_t v38 = OILabelCreateFromDictionary(v37);
          if (v38)
          {
            double v39 = v38;
            OILabelSetFontSize((uint64_t)v38, 10.0);
            OILabelGetFrame((uint64_t)v39);
            if (v41 == 0.0 || v40 == 0.0)
            {
              CFStringRef v42 = (const __CFString *)OILabelGetString((uint64_t)v39);
              double v43 = OISizeForStringInContext(v42, 10.0);
              OILabelSetFrame(v39, PlotArea - v43, v6 + v10 + 5.0, v43 + v43, (v13 - (v6 + v10)) * 0.7);
            }
            OIChartAddLabel(a1, v39);
            OILabelRelease(v39);
          }
        }
      }
    }
    if (OIChartGetAxis(a1, @"kOIChartAxisSecondaryXKey"))
    {
      CFDictionaryRef v44 = (const __CFDictionary *)CFDictionaryGetValue(v25, @"kOIChartAxisSecondaryXKey");
      if (v44)
      {
        CFDictionaryRef v45 = (const __CFDictionary *)CFDictionaryGetValue(v44, @"kOIChartAxisTitleKey");
        if (v45)
        {
          CGSize v46 = OILabelCreateFromDictionary(v45);
          if (v46)
          {
            CGRect v47 = v46;
            OILabelSetFontSize((uint64_t)v46, 10.0);
            OILabelGetFrame((uint64_t)v47);
            if (v49 == 0.0 || v48 == 0.0)
            {
              CFStringRef v50 = (const __CFString *)OILabelGetString((uint64_t)v47);
              double v51 = OISizeForStringInContext(v50, 10.0);
              OILabelSetFrame(v47, PlotArea + v8 * 0.5 - v51, v6 + v10 + 5.0, v51 + v51, v6 * 0.8);
            }
            OIChartAddLabel(a1, v47);
            OILabelRelease(v47);
          }
        }
      }
    }
    if (OIChartGetAxis(a1, @"kOIChartAxisSecondaryYKey"))
    {
      CFDictionaryRef v52 = (const __CFDictionary *)CFDictionaryGetValue(v25, @"kOIChartAxisSecondaryYKey");
      if (v52)
      {
        CFDictionaryRef v53 = (const __CFDictionary *)CFDictionaryGetValue(v52, @"kOIChartAxisTitleKey");
        if (v53)
        {
          double v54 = OILabelCreateFromDictionary(v53);
          if (v54)
          {
            double v55 = v54;
            OILabelSetFontSize((uint64_t)v54, 10.0);
            OILabelGetFrame((uint64_t)v55);
            if (v57 == 0.0 || v56 == 0.0)
            {
              CFStringRef v58 = (const __CFString *)OILabelGetString((uint64_t)v55);
              double v59 = OISizeForStringInContext(v58, 10.0);
              OILabelSetFrame(v55, PlotArea + v8 - v59, v6 + v10 + 5.0, v59 + v59, (v13 - (v6 + v10)) * 0.7);
            }
            OIChartAddLabel(a1, v55);
            OILabelRelease(v55);
          }
        }
      }
    }
  }
}

void _OIChartingSetupBarTypeAxis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFNumberRef Axis = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  if (!Axis)
  {
    CFArrayRef Values = (const __CFArray *)OISeriesGetValues(a2);
    CFIndex Count = CFArrayGetCount(Values);
    OIAxisCreateWithLabelCount(Count);
    if (!v11) {
      return;
    }
    double v7 = v11;
    double v12 = @"kOIChartAxisYKey";
LABEL_10:
    OILabelSetString((uint64_t)v7, v12);
    OIChartSetAxis(a1, v12, v7);
    OIAxisRelease(v7);
    goto LABEL_11;
  }
  double v7 = Axis;
  if (!OIAxisGetType((uint64_t)Axis)) {
    goto LABEL_11;
  }
  double v8 = OIChartGetAxis(a1, @"kOIChartAxisSecondaryYKey");
  if (!v8)
  {
    CFArrayRef v13 = (const __CFArray *)OISeriesGetValues(a2);
    CFIndex v14 = CFArrayGetCount(v13);
    OIAxisCreateWithLabelCount(v14);
    if (!v15) {
      return;
    }
    double v7 = v15;
    double v12 = @"kOIChartAxisSecondaryYKey";
    goto LABEL_10;
  }
  double v7 = v8;
  if (OIAxisGetType((uint64_t)v8)) {
    return;
  }
LABEL_11:
  OISeriesSetBaseAxis(a2, v7);
  if (OISeriesIsOnSecondaryAxis(a2)) {
    CFDictionaryRef v16 = @"kOIChartAxisSecondaryXKey";
  }
  else {
    CFDictionaryRef v16 = @"kOIChartAxisXKey";
  }
  CFNumberRef v17 = OIChartGetAxis(a1, v16);
  if (!v17)
  {
    OIAxisCreateWithRange(0.0, 100.0);
    if (!v19) {
      return;
    }
    double v18 = (void *)v19;
    OILabelSetString(v19, v16);
    OIChartSetAxis(a1, v16, v18);
    OIAxisRelease(v18);
    goto LABEL_19;
  }
  double v18 = v17;
  if (OIAxisGetType((uint64_t)v17) == 1)
  {
LABEL_19:
    OIAxisSetSubType((uint64_t)v18, a3);
    OISeriesSetValueAxis(a2, v18);
  }
}

void _OIChartingSetupColumnTypeAxis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFNumberRef Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  if (!Axis)
  {
    CFArrayRef Values = (const __CFArray *)OISeriesGetValues(a2);
    CFIndex Count = CFArrayGetCount(Values);
    OIAxisCreateWithLabelCount(Count);
    if (!v11) {
      return;
    }
    double v7 = v11;
    double v12 = @"kOIChartAxisXKey";
LABEL_10:
    OILabelSetString((uint64_t)v7, v12);
    OIChartSetAxis(a1, v12, v7);
    OIAxisRelease(v7);
    goto LABEL_11;
  }
  double v7 = Axis;
  if (!OIAxisGetType((uint64_t)Axis)) {
    goto LABEL_11;
  }
  double v8 = OIChartGetAxis(a1, @"kOIChartAxisSecondaryXKey");
  if (!v8)
  {
    CFArrayRef v13 = (const __CFArray *)OISeriesGetValues(a2);
    CFIndex v14 = CFArrayGetCount(v13);
    OIAxisCreateWithLabelCount(v14);
    if (!v15) {
      return;
    }
    double v7 = v15;
    double v12 = @"kOIChartAxisSecondaryXKey";
    goto LABEL_10;
  }
  double v7 = v8;
  if (OIAxisGetType((uint64_t)v8)) {
    return;
  }
LABEL_11:
  OISeriesSetBaseAxis(a2, v7);
  if (OISeriesIsOnSecondaryAxis(a2)) {
    CFDictionaryRef v16 = @"kOIChartAxisSecondaryYKey";
  }
  else {
    CFDictionaryRef v16 = @"kOIChartAxisYKey";
  }
  CFNumberRef v17 = OIChartGetAxis(a1, v16);
  if (!v17)
  {
    OIAxisCreateWithRange(0.0, 100.0);
    if (!v19) {
      return;
    }
    double v18 = (void *)v19;
    OILabelSetString(v19, v16);
    OIChartSetAxis(a1, v16, v18);
    OIAxisRelease(v18);
    goto LABEL_19;
  }
  double v18 = v17;
  if (OIAxisGetType((uint64_t)v17) == 1)
  {
LABEL_19:
    OIAxisSetSubType((uint64_t)v18, a3);
    OISeriesSetValueAxis(a2, v18);
  }
}

void _OIChartingSetupXYTypeAxis(uint64_t a1, uint64_t a2)
{
  CFNumberRef Axis = OIChartGetAxis(a1, @"kOIChartAxisXKey");
  if (!Axis)
  {
    OIAxisCreateWithRange(0.0, 100.0);
    if (!v7) {
      return;
    }
    double v5 = v7;
    double v8 = @"kOIChartAxisXKey";
LABEL_10:
    OILabelSetString((uint64_t)v5, v8);
    OIChartSetAxis(a1, v8, v5);
    OIAxisRelease(v5);
    goto LABEL_11;
  }
  double v5 = Axis;
  if (OIAxisGetType((uint64_t)Axis) == 1) {
    goto LABEL_11;
  }
  double v6 = OIChartGetAxis(a1, @"kOIChartAxisSecondaryXKey");
  if (!v6)
  {
    OIAxisCreateWithRange(0.0, 100.0);
    if (!v9) {
      return;
    }
    double v5 = v9;
    double v8 = @"kOIChartAxisSecondaryXKey";
    goto LABEL_10;
  }
  double v5 = v6;
  if (OIAxisGetType((uint64_t)v6) != 1) {
    return;
  }
LABEL_11:
  OIAxisSetSubType((uint64_t)v5, 1);
  OISeriesSetBaseAxis(a2, v5);
  if (OISeriesIsOnSecondaryAxis(a2)) {
    double v10 = @"kOIChartAxisSecondaryYKey";
  }
  else {
    double v10 = @"kOIChartAxisYKey";
  }
  CFNumberRef v11 = OIChartGetAxis(a1, v10);
  if (!v11)
  {
    OIAxisCreateWithRange(0.0, 1.0);
    if (!v13) {
      return;
    }
    double v12 = (void *)v13;
    OILabelSetString(v13, v10);
    OIChartSetAxis(a1, v10, v12);
    OIAxisRelease(v12);
    goto LABEL_19;
  }
  double v12 = v11;
  if (OIAxisGetType((uint64_t)v11) == 1) {
LABEL_19:
  }
    OISeriesSetValueAxis(a2, v12);
}

void _OIChartingUpdateAxisRangeWithValuesFromSeries(uint64_t a1, uint64_t a2)
{
  CFArrayRef Series = (const __CFArray *)OIChartGetSeries(a1);
  if (Series)
  {
    CFArrayRef v5 = Series;
    CFIndex Count = CFArrayGetCount(Series);
    if (Count)
    {
      uint64_t v7 = Count;
      uint64_t SubType = OIAxisGetSubType(a2);
      ValueCountForCFNumberRef Axis = OIChartGetValueCountForAxis(a1, a2);
      if (ValueCountForAxis < 1)
      {
        double v13 = 2.22507386e-308;
        double v16 = 1.79769313e308;
      }
      else
      {
        CFIndex v10 = ValueCountForAxis;
        CFIndex v11 = 0;
        double v12 = 1.79769313e308;
        double v13 = 2.22507386e-308;
        do
        {
          if (v7 < 1)
          {
            double v16 = 0.0;
            double v15 = 0.0;
          }
          else
          {
            CFIndex v14 = 0;
            double v15 = 0.0;
            double v16 = 0.0;
            do
            {
              ValueAtIndedouble x = CFArrayGetValueAtIndex(v5, v14);
              if (OIAxisGetType((uint64_t)ValueAtIndex) == a2)
              {
                CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
                if (Values)
                {
                  CFArrayRef v19 = Values;
                  if (v11 < CFArrayGetCount(Values))
                  {
                    double valuePtr = 0.0;
                    CFNumberRef v20 = (const __CFNumber *)CFArrayGetValueAtIndex(v19, v11);
                    CFNumberGetValue(v20, kCFNumberCGFloatType, &valuePtr);
                    double v21 = valuePtr <= v13 ? v13 : valuePtr;
                    double v22 = valuePtr < v12 ? valuePtr : v12;
                    double v23 = v16 + valuePtr;
                    double v24 = v15 + valuePtr;
                    if (valuePtr <= 0.0) {
                      double v24 = v15;
                    }
                    else {
                      double v23 = v16;
                    }
                    if (SubType == 2)
                    {
                      double v16 = v23;
                    }
                    else
                    {
                      double v12 = v22;
                      double v13 = v21;
                    }
                    if (SubType == 2) {
                      double v15 = v24;
                    }
                  }
                }
              }
              ++v14;
            }
            while (v7 != v14);
          }
          if (SubType == 2)
          {
            if (v15 <= v13) {
              double v25 = v13;
            }
            else {
              double v25 = v15;
            }
            if (v15 >= v12) {
              double v26 = v12;
            }
            else {
              double v26 = v15;
            }
            if (v16 <= v25) {
              double v13 = v25;
            }
            else {
              double v13 = v16;
            }
            if (v16 >= v26) {
              double v16 = v26;
            }
          }
          else
          {
            double v16 = v12;
          }
          ++v11;
          double v12 = v16;
        }
        while (v11 != v10);
      }
      if (v16 == 1.79769313e308) {
        double v16 = 0.0;
      }
      double v27 = 1.0;
      if (v13 == 2.22507386e-308) {
        double v28 = 1.0;
      }
      else {
        double v28 = v13;
      }
      if (SubType == 3)
      {
        double v29 = -0.4;
        if (v16 <= -0.4) {
          double v29 = -1.0;
        }
        if (v16 >= 0.0) {
          double v16 = 0.0;
        }
        else {
          double v16 = v29;
        }
        OIAxisSetUnit(a2, 0.2);
      }
      else
      {
        double v27 = v28;
      }
      OIAxisSetMinValue(a2, v16);
      OILabelSetFontSize(a2, v27);
      OIAxisImproveAxisRange(a2);
    }
  }
}

void _OIChartingUpdateAxisRangeWithBaseValuesFromSeries(uint64_t a1, uint64_t a2)
{
  CFArrayRef Series = (const __CFArray *)OIChartGetSeries(a1);
  if (Series)
  {
    CFArrayRef v4 = Series;
    CFIndex Count = CFArrayGetCount(Series);
    if (Count)
    {
      CFIndex v6 = Count;
      if (Count < 1)
      {
        double v9 = 2.22507386e-308;
        double v8 = 1.79769313e308;
      }
      else
      {
        CFIndex v7 = 0;
        double v8 = 1.79769313e308;
        double v9 = 2.22507386e-308;
        do
        {
          ValueAtIndedouble x = CFArrayGetValueAtIndex(v4, v7);
          if (OILabelGetString((uint64_t)ValueAtIndex) == a2)
          {
            CFArrayRef FillColor = (const __CFArray *)OILabelGetFillColor((uint64_t)ValueAtIndex);
            if (FillColor)
            {
              CFArrayRef v12 = FillColor;
              CFIndex v13 = CFArrayGetCount(FillColor);
              if (v13 >= 1)
              {
                CFIndex v14 = v13;
                for (CFIndex i = 0; i != v14; ++i)
                {
                  double valuePtr = 0.0;
                  CFNumberRef v16 = (const __CFNumber *)CFArrayGetValueAtIndex(v12, i);
                  CFNumberGetValue(v16, kCFNumberCGFloatType, &valuePtr);
                  if (valuePtr > v9) {
                    double v9 = valuePtr;
                  }
                  if (valuePtr < v8) {
                    double v8 = valuePtr;
                  }
                }
              }
            }
          }
          ++v7;
        }
        while (v7 != v6);
      }
      double v17 = 0.0;
      if (v8 != 1.79769313e308) {
        double v17 = v8;
      }
      if (v9 == 2.22507386e-308) {
        double v9 = 1.0;
      }
      OIAxisSetMinValue(a2, v17);
      OILabelSetFontSize(a2, v9);
      OIAxisImproveAxisRange(a2);
    }
  }
}

CGColorRef _OIChartingInitColors(CGColorRef *a1, uint64_t a2)
{
  if (a2 == 1)
  {
    *a1 = OIColorCreateGenericRGB(0.949019608, 0.874509804, 0.607843137, 1.0);
    a1[1] = OIColorCreateGenericRGB(0.77254902, 0.866666667, 0.71372549, 1.0);
    a1[2] = OIColorCreateGenericRGB(0.349019608, 0.768627451, 0.870588235, 1.0);
    a1[3] = OIColorCreateGenericRGB(0.4, 0.560784314, 0.894117647, 1.0);
    a1[4] = OIColorCreateGenericRGB(0.552941176, 0.447058824, 0.866666667, 1.0);
    a1[5] = OIColorCreateGenericRGB(0.741176471, 0.509803922, 0.807843137, 1.0);
    a1[6] = OIColorCreateGenericRGB(0.949019608, 0.874509804, 0.607843137, 1.0);
    CGFloat v6 = 1.0;
    CGFloat v5 = 0.77254902;
    CGFloat v3 = 0.866666667;
    CGFloat v4 = 0.71372549;
  }
  else
  {
    if (a2 == 2)
    {
      *a1 = OIColorCreateGenericRGB(0.337254902, 0.584313725, 0.847058824, 1.0);
      a1[1] = OIColorCreateGenericRGB(0.956862745, 0.376470588, 0.392156863, 1.0);
      a1[2] = OIColorCreateGenericRGB(0.619607843, 0.823529412, 0.396078431, 1.0);
      a1[3] = OIColorCreateGenericRGB(0.643137255, 0.501960784, 0.756862745, 1.0);
      a1[4] = OIColorCreateGenericRGB(0.141176471, 0.756862745, 0.870588235, 1.0);
      a1[5] = OIColorCreateGenericRGB(1.0, 0.580392157, 0.278431373, 1.0);
      a1[6] = OIColorCreateGenericRGB(0.588235294, 0.741176471, 0.933333333, 1.0);
      CGFloat v3 = 0.603921569;
      CGFloat v4 = 0.611764706;
      CGFloat v5 = 1.0;
    }
    else
    {
      *a1 = OIColorCreateGenericRGB(0.4, 0.7, 0.99, 1.0);
      a1[1] = OIColorCreateGenericRGB(1.0, 0.0, 0.0, 1.0);
      a1[2] = OIColorCreateGenericRGB(1.0, 0.95, 0.55, 1.0);
      a1[3] = OIColorCreateGenericRGB(0.305882353, 0.88627451, 0.341176471, 1.0);
      a1[4] = OIColorCreateGenericRGB(0.403921569, 0.0666666667, 1.0, 1.0);
      a1[5] = OIColorCreateGenericRGB(0.996078431, 0.654901961, 0.274509804, 1.0);
      a1[6] = OIColorCreateGenericRGB(0.525490196, 0.325490196, 0.341176471, 1.0);
      CGFloat v5 = 0.635294118;
      CGFloat v3 = 0.741176471;
      CGFloat v4 = 0.564705882;
    }
    CGFloat v6 = 1.0;
  }
  CGColorRef result = OIColorCreateGenericRGB(v5, v3, v4, v6);
  a1[7] = result;
  return result;
}

void _OIChartingReleaseColors(uint64_t a1)
{
  for (uint64_t i = 0; i != 64; i += 8)
    CGColorRelease(*(CGColorRef *)(a1 + i));
}

void OIRenderXYInChart(uint64_t a1, CFArrayRef theArray)
{
  if (theArray)
  {
    CFArrayRef v2 = theArray;
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count)
    {
      uint64_t v5 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      double PlotArea = OIChartGetPlotArea(a1);
      double v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      int v39 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      CGContextRef c = Type;
      v46.origin.double x = PlotArea;
      v46.origin.double y = v9;
      v46.size.double width = v11;
      v46.size.double height = v13;
      CGContextClipToRect(Type, v46);
      if (v5 >= 1)
      {
        CFIndex v14 = 0;
        uint64_t v37 = v5;
        CFArrayRef v38 = v2;
        do
        {
          ValueAtIndedouble x = CFArrayGetValueAtIndex(v2, v14);
          uint64_t Labels = OIAxisGetLabels((uint64_t)ValueAtIndex);
          CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
          uint64_t StrokeColor = (CGColor *)OILabelGetStrokeColor((uint64_t)ValueAtIndex);
          double StrokeWidth = OILabelGetStrokeWidth((uint64_t)ValueAtIndex);
          uint64_t String = OILabelGetString((uint64_t)ValueAtIndex);
          uint64_t v20 = OIAxisGetType((uint64_t)ValueAtIndex);
          uint64_t FillColor = OILabelGetFillColor((uint64_t)ValueAtIndex);
          if (FillColor)
          {
            CFArrayRef v22 = (const __CFArray *)FillColor;
            CFMutableDictionaryRef Mutable = CGPathCreateMutable();
            if (Labels)
            {
              path = CGPathCreateMutable();
              double MarkerWidth = OISeriesGetMarkerWidth((uint64_t)ValueAtIndex);
            }
            else
            {
              path = 0;
              double MarkerWidth = 0.0;
            }
            CGContextSetLineWidth(c, StrokeWidth);
            CGContextSetLineJoin(c, kCGLineJoinRound);
            CGContextSetLineCap(c, kCGLineCapRound);
            if (v39)
            {
              v45.double width = 0.0;
              v45.double height = -2.0;
              CGContextSetShadow(c, v45, 3.0);
            }
            CFIndex v25 = CFArrayGetCount(v22);
            if (v25 >= 1)
            {
              CFIndex v26 = v25;
              CFIndex v27 = 0;
              double v28 = MarkerWidth * 0.5;
              double v29 = ceil(MarkerWidth);
              do
              {
                if (v27 < CFArrayGetCount(Values))
                {
                  double valuePtr = 0.0;
                  CFNumberRef v30 = (const __CFNumber *)CFArrayGetValueAtIndex(v22, v27);
                  CFNumberGetValue(v30, kCFNumberCGFloatType, &valuePtr);
                  double v43 = 0.0;
                  CFNumberRef v31 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, v27);
                  CFNumberGetValue(v31, kCFNumberCGFloatType, &v43);
                  double v32 = PlotArea + OIAxisConvertValueToLocal(String, valuePtr);
                  double v33 = v9 + OIAxisConvertValueToLocal(v20, v43);
                  double v34 = floor(v32) + 0.5;
                  double v35 = floor(v33) + 0.5;
                  if (!v27)
                  {
                    CGPathMoveToPoint(Mutable, 0, v34, v35);
                    if (!Labels) {
                      goto LABEL_17;
                    }
LABEL_16:
                    v47.origin.double x = floor(v32 - v28) + 0.5;
                    v47.origin.double y = floor(v33 - v28) + 0.5;
                    v47.size.double width = v29;
                    v47.size.double height = v29;
                    CGPathAddRect(path, 0, v47);
                    goto LABEL_17;
                  }
                  CGPathAddLineToPoint(Mutable, 0, v34, v35);
                  if (Labels) {
                    goto LABEL_16;
                  }
                }
LABEL_17:
                ++v27;
              }
              while (v26 != v27);
            }
            CFArrayRef v2 = v38;
            if (StrokeColor)
            {
              CGContextSetLineJoin(c, kCGLineJoinRound);
              CGContextSetLineCap(c, kCGLineCapRound);
              CGContextAddPath(c, Mutable);
              CGContextSetStrokeColorWithColor(c, StrokeColor);
              CGContextSetLineWidth(c, StrokeWidth);
              CGContextStrokePath(c);
            }
            uint64_t v5 = v37;
            if (Labels)
            {
              MarkerColor = (CGColor *)OISeriesGetMarkerColor((uint64_t)ValueAtIndex);
              CGContextSetFillColorWithColor(c, MarkerColor);
              CGContextAddPath(c, path);
              CGContextFillPath(c);
            }
            if (path) {
              CGPathRelease(path);
            }
            if (Mutable) {
              CGPathRelease(Mutable);
            }
          }
          ++v14;
        }
        while (v14 != v5);
      }
      CGContextRestoreGState(c);
    }
  }
}

CGColor *OICreateDimmedColorFromColor(CGColor *result, double a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (result)
  {
    CFArrayRef v2 = result;
    CGFloat v3 = CGColorGetComponents(result);
    float64x2_t v4 = vmulq_n_f64(*(float64x2_t *)v3, a2);
    __asm { FMOV            V1.2D, #1.0 }
    *(int8x16_t *)components = vbslq_s8((int8x16_t)vcgtq_f64(v4, _Q1), (int8x16_t)_Q1, (int8x16_t)v4);
    uint64_t v10 = *((void *)v3 + 3);
    double v11 = v3[2] * a2;
    if (v11 > 1.0) {
      double v11 = 1.0;
    }
    double v15 = v11;
    uint64_t v16 = v10;
    ColorSpace = CGColorGetColorSpace(v2);
    return CGColorCreate(ColorSpace, components);
  }
  return result;
}

CGColorRef OIColorCreateGenericRGB(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  components[0] = a1;
  components[1] = a2;
  CGFloat components[2] = a3;
  components[3] = a4;
  float64x2_t v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00260]);
  CGColorRef v5 = CGColorCreate(v4, components);
  CGColorSpaceRelease(v4);
  return v5;
}

CFNumberRef OIRectMakeWithDictionaryRepresentation(const __CFDictionary *a1, uint64_t a2)
{
  CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(a1, @"X");
  if (result)
  {
    CFNumberGetValue(result, kCFNumberFloatType, (void *)a2);
    CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(a1, @"Y");
    if (result)
    {
      CFNumberGetValue(result, kCFNumberFloatType, (void *)(a2 + 8));
      CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(a1, @"Width");
      if (result)
      {
        CFNumberGetValue(result, kCFNumberFloatType, (void *)(a2 + 16));
        CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(a1, @"Height");
        if (result)
        {
          CFNumberGetValue(result, kCFNumberFloatType, (void *)(a2 + 24));
          return (const __CFNumber *)1;
        }
      }
    }
  }
  return result;
}

CTFontRef OICreateDefaultFontWithSize(CGFloat a1)
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  CFArrayRef v2 = (void *)*MEMORY[0x263F03A80];
  values = @"Arial";
  keys[0] = v2;
  CFDictionaryRef v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  float64x2_t v4 = CTFontDescriptorCreateWithAttributes(v3);
  CFRelease(v3);
  CTFontRef v5 = CTFontCreateWithFontDescriptor(v4, a1, 0);
  CFRelease(v4);
  if (!v5) {
    return CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, a1, 0);
  }
  return v5;
}

double OISizeForStringInContext(const __CFString *a1, CGFloat a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v13 = *MEMORY[0x263F039A0];
  CTFontRef v3 = OICreateDefaultFontWithSize(a2);
  v14[0] = v3;
  float64x2_t v4 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

  CFAttributedStringRef v5 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:a1 attributes:v4];
  CFIndex Length = CFStringGetLength(a1);
  result.location = 0;
  result.length = 0;
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  v16.location = 0;
  v16.length = Length;
  if (CFStringFindCharacterFromSet(a1, Predefined, v16, 0, &result))
  {
    double v8 = CTFramesetterCreateWithAttributedString(v5);
    v17.double width = 3.40282347e38;
    v15.location = 0;
    v15.length = Length;
    v17.double height = 3.40282347e38;
    *(void *)&double TypographicBounds = *(_OWORD *)&CTFramesetterSuggestFrameSizeWithConstraints(v8, v15, 0, v17, &result);
  }
  else
  {
    double v8 = CTLineCreateWithAttributedString(v5);
    uint64_t v11 = 0;
    double TypographicBounds = CTLineGetTypographicBounds(v8, (CGFloat *)&v11, 0, 0);
  }
  CFRelease(v8);

  return TypographicBounds;
}

void OIDrawStringWithAttributes(const __CFString *a1, void *a2, CGContext *a3, void *a4)
{
  CFIndex v7 = (objc_class *)MEMORY[0x263F086A0];
  double v8 = a4;
  id v9 = a2;
  CFAttributedStringRef v10 = (const __CFAttributedString *)[[v7 alloc] initWithString:a1 attributes:v9];

  CFIndex Length = CFStringGetLength(a1);
  result.location = 0;
  result.length = 0;
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  v27.location = 0;
  v27.length = Length;
  if (CFStringFindCharacterFromSet(a1, Predefined, v27, 0, &result))
  {
    uint64_t v13 = CTFramesetterCreateWithAttributedString(v10);
    v28.double width = 1.79769313e308;
    v25.location = 0;
    v25.length = Length;
    v28.double height = 1.79769313e308;
    CGSize v14 = CTFramesetterSuggestFrameSizeWithConstraints(v13, v25, 0, v28, &result);
    double width = v14.width;
    double height = v14.height;
    CGSize v17 = 0;
  }
  else
  {
    CGSize v17 = CTLineCreateWithAttributedString(v10);
    CGFloat ascent = 0.0;
    double width = CTLineGetTypographicBounds(v17, &ascent, 0, 0);
    uint64_t v13 = 0;
    double height = ascent;
  }
  double v18 = v8[2](v8, width, height);
  CGFloat v20 = v19;

  if (v13)
  {
    v29.origin.double x = v18;
    v29.origin.double y = v20;
    v29.size.double width = width;
    v29.size.double height = height;
    double v21 = CGPathCreateWithRect(v29, 0);
    v26.location = 0;
    v26.length = Length;
    double Frame = CTFramesetterCreateFrame(v13, v26, v21, 0);
    CTFrameDraw(Frame, a3);
    CFRelease(Frame);
    CFRelease(v21);
LABEL_8:
    CFRelease(v13);
    goto LABEL_9;
  }
  if (v17)
  {
    CGContextSetTextPosition(a3, v18, v20);
    CTLineDraw(v17, a3);
    uint64_t v13 = v17;
    goto LABEL_8;
  }
LABEL_9:
}

void *_OIErrorBarRendererRetain(uint64_t a1, void *a2)
{
  CFRange result = a2;
  if (a2) {
    ++*a2;
  }
  return result;
}

void _OIErrorBarRendererRelease(uint64_t a1, void *a2)
{
}

unsigned char *OIErrorBarRendererCreate(char a1)
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  CTFontRef v3 = CFAllocatorAllocate(Default, 32, 0);
  *(void *)CTFontRef v3 = 1;
  v3[16] = a1;
  *((void *)v3 + 3) = CGPathCreateMutable();
  return v3;
}

void OIErrorBarRendererRelease(void *a1)
{
  if (a1)
  {
    if ((*a1)-- == 1)
    {
      CTFontRef v3 = (const void *)a1[3];
      if (v3) {
        CFRelease(v3);
      }
      CFAllocatorRef Default = CFAllocatorGetDefault();
      CFAllocatorDeallocate(Default, a1);
    }
  }
}

void OIErrorBarRendererAddPoint(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, double a5, double a6)
{
  int Type = OIErrorBarGetType(a2);
  Valueint Type = OIErrorBarGetValueType(a2);
  double Value = OIErrorBarGetValue(a2);
  if (ValueType == 2)
  {
    double v15 = Value * a6;
  }
  else
  {
    if (ValueType != 1) {
      return;
    }
    double v15 = a5 * a6 * Value / 100.0;
  }
  if (v15 != 0.0)
  {
    if (!*(unsigned char *)(a1 + 16))
    {
      if (Type == 2)
      {
        CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3, a4);
        double v18 = *(CGPath **)(a1 + 24);
        double v19 = a3 + v15;
      }
      else
      {
        if (Type != 1)
        {
          CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 - v15, a4 + -2.0);
          CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 - v15, a4 + 2.0);
          CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 - v15, a4);
          CGFloat v23 = a3 + v15;
          CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 24), 0, v23, a4);
          CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, v23, a4 + -2.0);
          CGFloat v20 = *(CGPath **)(a1 + 24);
          double v21 = v23;
          double v22 = a4 + 2.0;
          goto LABEL_21;
        }
        CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3, a4);
        double v18 = *(CGPath **)(a1 + 24);
        double v19 = a3 - v15;
      }
      CGPathAddLineToPoint(v18, 0, v19, a4);
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, v19, a4 + -2.0);
      CGFloat v20 = *(CGPath **)(a1 + 24);
      double v22 = a4 + 2.0;
      double v21 = v19;
LABEL_21:
      CGPathAddLineToPoint(v20, 0, v21, v22);
      return;
    }
    if (Type == 2)
    {
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3, a4);
      CFRange v16 = *(CGPath **)(a1 + 24);
      double v17 = a4 + v15;
    }
    else
    {
      if (Type != 1)
      {
        CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 + -2.0, a4 - v15);
        CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 + 2.0, a4 - v15);
        CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3, a4 - v15);
        double v17 = a4 + v15;
        CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3, v17);
        CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 + -2.0, v17);
        CGFloat v20 = *(CGPath **)(a1 + 24);
        double v21 = a3 + 2.0;
        goto LABEL_17;
      }
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3, a4);
      CFRange v16 = *(CGPath **)(a1 + 24);
      double v17 = a4 - v15;
    }
    CGPathAddLineToPoint(v16, 0, a3, v17);
    CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 + -2.0, v17);
    CGFloat v20 = *(CGPath **)(a1 + 24);
    double v21 = a3 + 2.0;
LABEL_17:
    double v22 = v17;
    goto LABEL_21;
  }
}

void OIErrorBarRendererRenderInContext(uint64_t a1, CGContext *a2)
{
  GenericRGB = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
  CGContextSetStrokeColorWithColor(a2, GenericRGB);
  CGContextAddPath(a2, *(CGPathRef *)(a1 + 24));
  CGContextStrokePath(a2);

  CGColorRelease(GenericRGB);
}

void OIRenderBubblesInChart(uint64_t a1, CFArrayRef theArray)
{
  if (theArray)
  {
    CFArrayRef v2 = theArray;
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 2)
    {
      CFIndex v5 = Count;
      int Type = (CGContext *)OIAxisGetType(a1);
      double PlotArea = OIChartGetPlotArea(a1);
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      int v14 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      CGContextRef c = Type;
      v50.origin.double x = PlotArea;
      v50.origin.double y = v9;
      v50.size.double width = v11;
      v50.size.double height = v13;
      CGContextClipToRect(Type, v50);
      if (v11 > v13) {
        double v11 = v13;
      }
      if (v14)
      {
        v49.double width = 4.0;
        v49.double height = -4.0;
        CGContextSetShadow(Type, v49, 3.0);
      }
      CFIndex v15 = 0;
      CFIndex v43 = v5 - 1;
      double v16 = v11 / 5.0;
      do
      {
        CFArrayRef v17 = v2;
        ValueAtIndedouble x = CFArrayGetValueAtIndex(v2, v15);
        CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
        uint64_t TextColor = OILabelGetTextColor((uint64_t)ValueAtIndex);
        uint64_t StrokeColor = OILabelGetStrokeColor((uint64_t)ValueAtIndex);
        uint64_t String = OILabelGetString((uint64_t)ValueAtIndex);
        uint64_t v22 = OIAxisGetType((uint64_t)ValueAtIndex);
        uint64_t FillColor = OILabelGetFillColor((uint64_t)ValueAtIndex);
        if (FillColor)
        {
          CFArrayRef v24 = (const __CFArray *)FillColor;
          OISeriesSetupStrokeAndFillForContext((uint64_t)ValueAtIndex, c);
          CFRange v25 = CFArrayGetValueAtIndex(v17, v15 | 1);
          CFArrayRef v26 = (const __CFArray *)OISeriesGetValues((uint64_t)v25);
          CFIndex v27 = CFArrayGetCount(v26);
          if (v27 >= 1)
          {
            CFIndex v28 = v27;
            CFIndex v29 = 0;
            double v30 = 0.0;
            do
            {
              CFNumberRef v31 = (const __CFNumber *)CFArrayGetValueAtIndex(v26, v29);
              if (v31)
              {
                double valuePtr = 0.0;
                CFNumberGetValue(v31, kCFNumberCGFloatType, &valuePtr);
                double v30 = v30 + fabs(valuePtr);
              }
              ++v29;
            }
            while (v28 != v29);
            if (v30 != 0.0)
            {
              CFIndex v32 = CFArrayGetCount(v24);
              if (v32 >= 1)
              {
                CFIndex v33 = v32;
                for (CFIndex i = 0; i != v33; ++i)
                {
                  if (i < CFArrayGetCount(Values) && i < CFArrayGetCount(v26))
                  {
                    double valuePtr = 0.0;
                    CFNumberRef v35 = (const __CFNumber *)CFArrayGetValueAtIndex(v24, i);
                    CFNumberGetValue(v35, kCFNumberCGFloatType, &valuePtr);
                    double v47 = 0.0;
                    CFNumberRef v36 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, i);
                    CFNumberGetValue(v36, kCFNumberCGFloatType, &v47);
                    double v46 = 0.0;
                    CFNumberRef v37 = (const __CFNumber *)CFArrayGetValueAtIndex(v26, i);
                    CFNumberGetValue(v37, kCFNumberCGFloatType, &v46);
                    double v46 = v16 * v46 / v30;
                    double v38 = PlotArea + OIAxisConvertValueToLocal(String, valuePtr);
                    double v39 = OIAxisConvertValueToLocal(v22, v47);
                    double v40 = v38 - v46;
                    double v41 = v9 + v39 - v46;
                    double v42 = v46 + v46;
                    if (TextColor)
                    {
                      v51.origin.double x = v40;
                      v51.origin.double y = v41;
                      v51.size.double width = v46 + v46;
                      v51.size.double height = v46 + v46;
                      CGContextFillEllipseInRect(c, v51);
                    }
                    if (StrokeColor)
                    {
                      v52.origin.double x = v40;
                      v52.origin.double y = v41;
                      v52.size.double width = v42;
                      v52.size.double height = v42;
                      CGContextStrokeEllipseInRect(c, v52);
                    }
                  }
                }
              }
            }
          }
        }
        v15 += 2;
        CFArrayRef v2 = v17;
      }
      while (v15 < v43);
      CGContextRestoreGState(c);
    }
  }
}

void OIRenderBarsInChart(uint64_t a1, const __CFArray *a2)
{
}

void _OIRenderBarsInChart(uint64_t a1, CFArrayRef theArray, double a3, double a4)
{
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count)
    {
      uint64_t v7 = Count;
      int Type = (CGContext *)OIAxisGetType(a1);
      double PlotArea = OIChartGetPlotArea(a1);
      double v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      int v16 = OIAxisAreLabelsCentered(a1);
      ValueAtIndedouble x = CFArrayGetValueAtIndex(theArray, 0);
      uint64_t v18 = OIAxisGetType((uint64_t)ValueAtIndex);
      uint64_t String = OILabelGetString((uint64_t)ValueAtIndex);
      double FontSize = OILabelGetFontSize(v18);
      double MinValue = OIAxisGetMinValue(v18);
      double Scale = OIAxisGetScale(v18);
      CGContextSaveGState(Type);
      double v52 = PlotArea;
      v57.origin.double x = PlotArea;
      v57.origin.double y = v11;
      v57.size.double width = v13;
      v57.size.double height = v15;
      CGContextClipToRect(Type, v57);
      double v22 = OIAxisGetScale(String);
      int v23 = OIAxisAreLabelsCentered(String);
      double v24 = v22 * -0.5;
      if (v23) {
        double v24 = 0.0;
      }
      double v51 = v24;
      if (v16)
      {
        v56.double width = 4.0;
        v56.double height = -4.0;
        CGContextSetShadow(Type, v56, 3.0);
      }
      CGSize v45 = Type;
      uint64_t v25 = 0;
      if (v7 >= 1)
      {
        for (CFIndex i = 0; i != v7; ++i)
        {
          CFIndex v27 = CFArrayGetValueAtIndex(theArray, i);
          CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)v27);
          CFIndex v29 = CFArrayGetCount(Values);
          if (v29 > v25) {
            uint64_t v25 = v29;
          }
        }
      }
      double v47 = OILabelCollectionCreate();
      CGSize v49 = OIErrorBarRendererCreate(0);
      if (v25 >= 1)
      {
        CFIndex v30 = 0;
        double v31 = floor(v22 / (double)(v7 + 1));
        double v50 = floor(v31 * 0.5);
        double v46 = ceil(v31 * 3.0);
        do
        {
          if (v7 >= 1)
          {
            for (CFIndex j = 0; j != v7; ++j)
            {
              CFIndex v33 = CFArrayGetValueAtIndex(theArray, j);
              double BaseValueAtIndex = OISeriesGetBaseValueAtIndex((uint64_t)v33, v30);
              CFArrayRef v35 = (const __CFArray *)OISeriesGetValues((uint64_t)v33);
              if (v30 < CFArrayGetCount(v35))
              {
                valuePtr[0] = 0.0;
                CFNumberRef v36 = (const __CFNumber *)CFArrayGetValueAtIndex(v35, v30);
                CFNumberGetValue(v36, kCFNumberCGFloatType, valuePtr);
                double v37 = valuePtr[0];
                if (valuePtr[0] <= FontSize)
                {
                  BOOL v38 = valuePtr[0] < MinValue;
                }
                else
                {
                  double v37 = FontSize;
                  BOOL v38 = 1;
                }
                if (v38)
                {
                  if (v37 < MinValue) {
                    double v37 = MinValue;
                  }
                  valuePtr[0] = v37;
                }
                double v39 = v52 + OIAxisConvertValueToLocal(v18, 0.0);
                OIAxisConvertValueToLocal(String, BaseValueAtIndex);
                double v40 = v52 + OIAxisConvertValueToLocal(v18, valuePtr[0]);
                double v41 = v50 + v51 + v11 + OIAxisConvertValueToLocal(String, BaseValueAtIndex) + v31 * (double)j;
                double v42 = v40 - v39;
                _OIRenderBarFloor(a1, v39, v41, v42, v31, a3, a4);
                _OIRenderBar(a1, (uint64_t)v33, v39, v41, v42, v31, a3, a4);
                double v43 = v39 + v42;
                if (OISeriesGetShowValues((uint64_t)v33)) {
                  OILabelCollectionAddNumber((uint64_t)v47, 0, valuePtr[0], floor(v43) + 0.5, floor(v41) + 0.5, v46, v31);
                }
                uint64_t PlotFillColor = OIChartGetPlotFillColor((uint64_t)v33);
                if (PlotFillColor) {
                  OIErrorBarRendererAddPoint((uint64_t)v49, PlotFillColor, v43, v31 * 0.5 + v41, valuePtr[0], Scale);
                }
              }
            }
          }
          ++v30;
        }
        while (v30 != v25);
      }
      OIErrorBarRendererRenderInContext((uint64_t)v49, v45);
      OIErrorBarRendererRelease(v49);
      OILabelCollectionRenderInContext((uint64_t)v47, v45);
      OILabelCollectionRelease(v47);
      CGContextRestoreGState(v45);
    }
  }
}

void OIRenderStackedBarsInChart(uint64_t a1, const __CFArray *a2)
{
}

void _OIRenderStackedBarsInChart(uint64_t a1, const __CFArray *a2, uint64_t a3, double a4, double a5)
{
  int Type = (CGContext *)OIAxisGetType(a1);
  double PlotArea = OIChartGetPlotArea(a1);
  double v71 = v10;
  double v72 = PlotArea;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  int v15 = OIAxisAreLabelsCentered(a1);
  if (a2)
  {
    int v16 = v15;
    CFIndex Count = CFArrayGetCount(a2);
    if (Count)
    {
      uint64_t v18 = Count;
      ValueAtIndedouble x = CFArrayGetValueAtIndex(a2, 0);
      uint64_t v20 = OIAxisGetType((uint64_t)ValueAtIndex);
      uint64_t String = OILabelGetString((uint64_t)ValueAtIndex);
      double FontSize = OILabelGetFontSize(v20);
      double MinValue = OIAxisGetMinValue(v20);
      double v22 = OILabelGetFontSize(String);
      double Scale = OIAxisGetScale(v20);
      CGContextSaveGState(Type);
      v77.origin.double y = v71;
      v77.origin.double x = v72;
      v77.size.double width = v12;
      v77.size.double height = v14;
      CGContextClipToRect(Type, v77);
      double v23 = OIAxisGetScale(String);
      uint64_t v60 = (uint64_t)v22;
      int v24 = OIAxisAreLabelsCentered(String);
      double v25 = v23 * -0.5;
      if (v24) {
        double v25 = 0.0;
      }
      double v68 = v25;
      if (v16)
      {
        v76.double width = 4.0;
        v76.double height = -4.0;
        CGContextSetShadow(Type, v76, 3.0);
      }
      CFStringRef v58 = Type;
      double v63 = OILabelCollectionCreate();
      uint64_t v62 = OIErrorBarRendererCreate(0);
      if (v60 >= 1)
      {
        CFIndex v26 = 0;
        double v67 = floor(v23 * 0.25);
        double v74 = floor(v23 * 0.5);
        BOOL v28 = a3 != 1 || v18 < 1;
        BOOL v59 = v28;
        do
        {
          double v29 = OIAxisConvertValueToLocal(v20, 0.0);
          double v73 = (double)v26;
          OIAxisConvertValueToLocal(String, (double)v26);
          double v30 = 0.0;
          if (!v59)
          {
            for (CFIndex i = 0; i != v18; ++i)
            {
              CFIndex v32 = CFArrayGetValueAtIndex(a2, i);
              CFArrayRef Values = (const __CFArray *)OISeriesGetValues((uint64_t)v32);
              if (CFArrayGetCount(Values) > v26)
              {
                valuePtr[0] = 0.0;
                CFNumberRef v34 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, v26);
                CFNumberGetValue(v34, kCFNumberCGFloatType, valuePtr);
                double v30 = v30 + fabs(valuePtr[0]);
              }
            }
          }
          if (v18 < 1) {
            goto LABEL_45;
          }
          CFIndex v35 = 0;
          double v36 = v72 + v29;
          double v37 = 1.0;
          if (a3 == 1) {
            double v37 = v30;
          }
          double v66 = v37;
          double v38 = 0.0;
          double v39 = 0.0;
          double v40 = v36;
          do
          {
            double v41 = CFArrayGetValueAtIndex(a2, v35);
            CFArrayRef v42 = (const __CFArray *)OISeriesGetValues((uint64_t)v41);
            if (CFArrayGetCount(v42) > v26)
            {
              valuePtr[0] = 0.0;
              CFNumberRef v43 = (const __CFNumber *)CFArrayGetValueAtIndex(v42, v26);
              CFNumberGetValue(v43, kCFNumberCGFloatType, valuePtr);
              double v44 = valuePtr[0] / v66;
              if (valuePtr[0] / v66 >= 0.0)
              {
                double v50 = v38 + v44;
                if (v38 + v44 > FontSize) {
                  double v50 = FontSize;
                }
                if (v50 >= MinValue) {
                  double v38 = v50;
                }
                else {
                  double v38 = MinValue;
                }
                double v51 = v72 + OIAxisConvertValueToLocal(v20, v38);
                double v47 = OIAxisConvertValueToLocal(String, v73);
                double v48 = v51 - v36;
                double v49 = v36;
                double v36 = v51;
              }
              else
              {
                double v45 = v39 + v44;
                if (v39 + v44 < MinValue) {
                  double v45 = MinValue;
                }
                if (v45 <= FontSize) {
                  double v39 = v45;
                }
                else {
                  double v39 = FontSize;
                }
                double v46 = v72 + OIAxisConvertValueToLocal(v20, v39);
                double v47 = OIAxisConvertValueToLocal(String, v73);
                double v48 = v46 - v40;
                double v49 = v40;
                double v40 = v46;
              }
              double v52 = ceil(v48);
              double v53 = floor(v67 + v68 + v71 + v47) + 0.5;
              double v54 = floor(v49) + 0.5;
              _OIRenderBar(a1, (uint64_t)v41, v54, v53, v52, v74, a4, a5);
              if (OISeriesGetShowValues((uint64_t)v41)) {
                OILabelCollectionAddNumber((uint64_t)v63, 0, valuePtr[0], floor(v54) + 0.5, floor(v53) + 0.5, v52, v74);
              }
              if (!a3)
              {
                uint64_t PlotFillColor = OIChartGetPlotFillColor((uint64_t)v41);
                if (PlotFillColor) {
                  OIErrorBarRendererAddPoint((uint64_t)v62, PlotFillColor, v54 + v52, v74 * 0.5 + v53, v44, Scale);
                }
              }
            }
            ++v35;
          }
          while (v18 != v35);
          if (v38 == 0.0)
          {
LABEL_45:
            double v56 = v72 + OIAxisConvertValueToLocal(v20, 0.0);
            double v57 = OIAxisConvertValueToLocal(String, v73);
            _OIRenderBarFloor(a1, floor(v67 + v56) + 0.5, floor(v68 + v71 + v57) + 0.5, v74, 0.0, a4, a5);
          }
          ++v26;
        }
        while (v26 != v60);
      }
      OIErrorBarRendererRenderInContext((uint64_t)v62, v58);
      OIErrorBarRendererRelease(v62);
      OILabelCollectionRenderInContext((uint64_t)v63, v58);
      OILabelCollectionRelease(v63);
      CGContextRestoreGState(v58);
    }
  }
}

void OIRenderPercentStackedBarsInChart(uint64_t a1, const __CFArray *a2)
{
}

void OIRender3DBarsInChart(uint64_t a1, const __CFArray *a2)
{
  CFNumberRef Axis = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  OIChartGetPlotArea(a1);
  double v6 = v5;
  double v8 = v7;
  double v9 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  double v10 = OIChartGetRotation(a1) / 45.0 * (v6 / v9);
  double v11 = OIChartGetElevation(a1) / 90.0 * (v8 / v9);

  _OIRenderBarsInChart(a1, a2, v10, v11);
}

void OIRender3DStackedBarsInChart(uint64_t a1, const __CFArray *a2)
{
  CFNumberRef Axis = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  OIChartGetPlotArea(a1);
  double v6 = v5;
  double v8 = v7;
  double v9 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  double v10 = OIChartGetRotation(a1) / 45.0 * (v6 / v9);
  double v11 = OIChartGetElevation(a1) / 90.0 * (v8 / v9);

  _OIRenderStackedBarsInChart(a1, a2, 0, v10, v11);
}

void OIRender3DPercentStackedBarsInChart(uint64_t a1, const __CFArray *a2)
{
  CFNumberRef Axis = OIChartGetAxis(a1, @"kOIChartAxisYKey");
  OIChartGetPlotArea(a1);
  double v6 = v5;
  double v8 = v7;
  double v9 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  double v10 = OIChartGetRotation(a1) / 45.0 * (v6 / v9);
  double v11 = OIChartGetElevation(a1) / 90.0 * (v8 / v9);

  _OIRenderStackedBarsInChart(a1, a2, 1, v10, v11);
}

void _OIRenderBarFloor(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  int Type = (CGContext *)OIAxisGetType(a1);
  double v14 = a2 + a6 * 0.25;
  double v15 = a3 + a7 * 0.25;
  double v16 = a7 * 0.5;
  CFMutableDictionaryRef Mutable = CGPathCreateMutable();
  GenericRGB = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
  CGPathMoveToPoint(Mutable, 0, floor(a4 + v14) + 0.5, floor(v15) + 0.5);
  double v19 = a5 + v15;
  CGPathAddLineToPoint(Mutable, 0, floor(v14) + 0.5, floor(v19) + 0.5);
  CGFloat v20 = floor(a6 * 0.5 + v14) + 0.5;
  CGPathAddLineToPoint(Mutable, 0, v20, floor(v16 + v19) + 0.5);
  CGPathAddLineToPoint(Mutable, 0, v20, floor(v16 + v15) + 0.5);
  CGPathCloseSubpath(Mutable);
  CGContextSetFillColorWithColor(Type, GenericRGB);
  CGContextAddPath(Type, Mutable);
  CGContextFillPath(Type);
  CGPathRelease(Mutable);

  CGColorRelease(GenericRGB);
}

void _OIRenderBar(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8)
{
  int Type = (CGContext *)OIAxisGetType(a1);
  uint64_t TextColor = (CGColor *)OILabelGetTextColor(a2);
  uint64_t StrokeColor = (CGColor *)OILabelGetStrokeColor(a2);
  double StrokeWidth = OILabelGetStrokeWidth(a2);
  CGFloat v19 = StrokeWidth;
  if (a7 == 0.0 && a8 == 0.0)
  {
    if (TextColor)
    {
      CGContextSetFillColorWithColor(Type, TextColor);
      v55.origin.double x = a3;
      v55.origin.CGFloat y = a4;
      v55.size.CGFloat width = a5;
      v55.size.double height = a6;
      CGContextFillRect(Type, v55);
    }
    if (StrokeColor)
    {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      CGContextSetLineWidth(Type, v19);
      CGFloat v20 = a3;
      CGFloat v21 = a4;
      CGFloat v22 = a5;
      CGFloat v23 = a6;
      CGContextStrokeRect(Type, *(CGRect *)&v20);
    }
  }
  else
  {
    CGFloat width = StrokeWidth;
    double v24 = a3 + a7 * 0.25;
    double v25 = a4 + a8 * 0.25;
    CFMutableDictionaryRef Mutable = CGPathCreateMutable();
    CGFloat v27 = floor(v24) + 0.5;
    double v28 = a5;
    CGFloat v29 = floor(v25) + 0.5;
    CGPathMoveToPoint(Mutable, 0, v27, v29);
    double v48 = v25;
    double v49 = a6 + v25;
    CGFloat v30 = floor(a6 + v25) + 0.5;
    CGFloat v50 = v27;
    CGFloat v31 = v27;
    CGFloat v32 = v29;
    double v33 = v28;
    CGPathAddLineToPoint(Mutable, 0, v31, v30);
    double v51 = v24;
    double v34 = v28 + v24;
    CGFloat v35 = v30;
    double v36 = floor(v34) + 0.5;
    CGFloat y = v35;
    CGPathAddLineToPoint(Mutable, 0, v36, v35);
    CGPathAddLineToPoint(Mutable, 0, v36, v32);
    CGPathCloseSubpath(Mutable);
    if (TextColor)
    {
      CGContextSetFillColorWithColor(Type, TextColor);
      CGContextAddPath(Type, Mutable);
      CGContextFillPath(Type);
    }
    if (StrokeColor)
    {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      CGContextAddPath(Type, Mutable);
      CGContextSetLineWidth(Type, width);
      CGContextStrokePath(Type);
    }
    double v37 = a7 * 0.5;
    double v38 = a8 * 0.5;
    CGPathRelease(Mutable);
    if (v33 >= 0.0)
    {
      double v44 = OICreateDimmedColorFromColor(TextColor, 0.5);
      double v45 = CGPathCreateMutable();
      CGPathMoveToPoint(v45, 0, v36, v32);
      CGPathAddLineToPoint(v45, 0, v36, y);
      double v41 = floor(v37 + v34) + 0.5;
      double v40 = floor(v38 + v49) + 0.5;
      CGPathAddLineToPoint(v45, 0, v41, v40);
      CGPathAddLineToPoint(v45, 0, v41, floor(v38 + v48) + 0.5);
      CGPathCloseSubpath(v45);
      if (v44)
      {
        CGContextSetFillColorWithColor(Type, v44);
        CGContextAddPath(Type, v45);
        CGContextFillPath(Type);
      }
      CGFloat v42 = width;
      CGFloat v39 = v50;
      double v43 = v51;
      if (StrokeColor)
      {
        CGContextSetStrokeColorWithColor(Type, StrokeColor);
        CGContextAddPath(Type, v45);
        CGContextSetLineWidth(Type, width);
        CGContextStrokePath(Type);
      }
      CGPathRelease(v45);
      CGColorRelease(v44);
    }
    else
    {
      CGFloat v39 = v50;
      double v40 = floor(v38 + v49) + 0.5;
      double v41 = floor(v37 + v34) + 0.5;
      CGFloat v42 = width;
      double v43 = v51;
    }
    double v46 = CGPathCreateMutable();
    double v47 = OICreateDimmedColorFromColor(TextColor, 0.8);
    CGPathMoveToPoint(v46, 0, v39, y);
    CGPathAddLineToPoint(v46, 0, floor(v37 + v43) + 0.5, v40);
    CGPathAddLineToPoint(v46, 0, v41, v40);
    CGPathAddLineToPoint(v46, 0, v36, y);
    CGPathCloseSubpath(v46);
    if (v47)
    {
      CGContextSetFillColorWithColor(Type, v47);
      CGContextAddPath(Type, v46);
      CGContextFillPath(Type);
    }
    if (StrokeColor)
    {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      CGContextAddPath(Type, v46);
      CGContextSetLineWidth(Type, v42);
      CGContextStrokePath(Type);
    }
    CGPathRelease(v46);
    CGColorRelease(v47);
  }
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4870](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x270EE4898](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x270EE4BF8](allocator, locale, style);
}

CFStringRef CFNumberFormatterCreateStringWithValue(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberType numberType, const void *valuePtr)
{
  return (CFStringRef)MEMORY[0x270EE4C10](allocator, formatter, numberType, valuePtr);
}

void CFNumberFormatterSetFormat(CFNumberFormatterRef formatter, CFStringRef formatString)
{
}

void CFNumberFormatterSetProperty(CFNumberFormatterRef formatter, CFNumberFormatterKey key, CFTypeRef value)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFShow(CFTypeRef obj)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5158](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B68](color, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x270EE5C20](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C90](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPage(CGContextRef c, const CGRect *mediaBox)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextEndPage(CGContextRef c)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

CGContextRef CGContextRetain(CGContextRef c)
{
  return (CGContextRef)MEMORY[0x270EE6088](c);
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetFillPattern(CGContextRef c, CGPatternRef pattern, const CGFloat *components)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShadow(CGContextRef c, CGSize offset, CGFloat blur)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x270EE6298](data);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x270EE6A80](consumer, mediaBox, auxiliaryInfo);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return (CGMutablePathRef)MEMORY[0x270EE7038](path);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7058](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x270EE7110](info, matrix, *(void *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

void CGPatternRelease(CGPatternRef pattern)
{
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x270EE9AD8](*(void *)&uiType, language, size);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x270EE9AE0](descriptor, matrix, size);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x270EE9B60](attributes);
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x270EE9D38](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x270EE9D40](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x270EE9D48](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.double height = v6;
  result.CGFloat width = v5;
  return result;
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x270EE9D70](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x270EE9E00](line, ascent, descent, leading);
  return result;
}

void NSLog(NSString *format, ...)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void free(void *a1)
{
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x270EDA0B8](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}