@interface GraphRenderOperation
- ($175F2685EF764341F5DD80B75CC65478)volumeBars;
- (BOOL)isCancelled;
- (BOOL)roundLineCaps;
- (CGPoint)points;
- (CGSize)graphSize;
- (CGSize)lineGraphSize;
- (CGSize)volumeGraphSize;
- (GraphRenderOperationDelegate)delegate;
- (NSArray)dottedLinePositions;
- (NSArray)dottedLinePositionsForStyleOnly;
- (NSArray)linePointCounts;
- (StockChartDisplayMode)displayMode;
- (StockGraphImageSet)graphImageSet;
- (UIEdgeInsets)graphInsets;
- (double)volumeBarWidth;
- (unint64_t)maxVolume;
- (unsigned)volumeCount;
- (void)cancel;
- (void)render;
- (void)renderGraphLineInContext:(CGContext *)a3 withColor:(id)a4 offset:(CGPoint)a5;
- (void)renderLineGraph;
- (void)renderVolumeGraph;
- (void)setDelegate:(id)a3;
- (void)setDisplayMode:(id)a3;
- (void)setDottedLinePositions:(id)a3;
- (void)setDottedLinePositionsForStyleOnly:(id)a3;
- (void)setGraphImageSet:(id)a3;
- (void)setGraphInsets:(UIEdgeInsets)a3;
- (void)setGraphSize:(CGSize)a3;
- (void)setLinePointCounts:(id)a3;
- (void)setMaxVolume:(unint64_t)a3;
- (void)setPoints:(CGPoint *)a3;
- (void)setRoundLineCaps:(BOOL)a3;
- (void)setVolumeBarWidth:(double)a3;
- (void)setVolumeBars:(id *)a3;
- (void)setVolumeCount:(unsigned int)a3;
- (void)setVolumeGraphSize:(CGSize)a3;
@end

@implementation GraphRenderOperation

- (void)cancel
{
  self->_cancelled = 1;
}

- (void)render
{
  v3 = objc_alloc_init(StockGraphImageSet);
  graphImageSet = self->_graphImageSet;
  self->_graphImageSet = v3;

  [(GraphRenderOperation *)self renderLineGraph];
  v5 = [(GraphRenderOperation *)self displayMode];
  if ([v5 showsVolume])
  {
    BOOL v6 = [(GraphRenderOperation *)self isCancelled];

    if (!v6) {
      [(GraphRenderOperation *)self renderVolumeGraph];
    }
  }
  else
  {
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__GraphRenderOperation_render__block_invoke;
  block[3] = &unk_26467D130;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __30__GraphRenderOperation_render__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  [WeakRetained graphRenderOperationDidFinish:*(void *)(a1 + 32)];
}

- (CGSize)lineGraphSize
{
  float64x2_t v2 = vsubq_f64(vsubq_f64((float64x2_t)vextq_s8((int8x16_t)self->_graphSize, (int8x16_t)self->_graphSize, 8uLL), *(float64x2_t *)&self->_graphInsets.top), *(float64x2_t *)&self->_graphInsets.bottom);
  double v3 = v2.f64[1];
  result.height = v2.f64[0];
  result.width = v3;
  return result;
}

- (void)renderGraphLineInContext:(CGContext *)a3 withColor:(id)a4 offset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a4;
  [(GraphRenderOperation *)self lineGraphSize];
  double v11 = v10;
  id v12 = v9;
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v12 CGColor]);
  [(StockChartDisplayMode *)self->_displayMode lineWidth];
  CGContextSetLineWidth(a3, v13);
  CGContextSetLineJoin(a3, kCGLineJoinRound);
  CGContextSetLineCap(a3, (CGLineCap)self->_roundLineCaps);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v14 = self->_linePointCounts;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    unsigned int v17 = 0;
    uint64_t v18 = *(void *)v27;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v14);
        }
        int v20 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v19), "intValue", (void)v26);
        CGContextBeginPath(a3);
        v21 = &self->_points[v17];
        CGContextMoveToPoint(a3, x + v21->x, y + self->_graphInsets.bottom + v21->y * v11);
        uint64_t v22 = v20 + v17;
        if (v17 < v22)
        {
          uint64_t v23 = v17;
          uint64_t v24 = v17;
          uint64_t v25 = v22 - v23;
          do
          {
            CGContextAddLineToPoint(a3, x + self->_points[v24].x, y + self->_graphInsets.bottom + self->_points[v24].y * v11);
            ++v24;
            --v25;
          }
          while (v25);
          unsigned int v17 = v22;
        }
        CGContextStrokePath(a3);
        ++v19;
      }
      while (v19 != v16);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v16);
  }
}

- (void)renderLineGraph
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  [(GraphRenderOperation *)self lineGraphSize];
  double v4 = v3;
  double width = self->_graphSize.width;
  double height = self->_graphSize.height;
  double top = self->_graphInsets.top;
  double left = self->_graphInsets.left;
  double bottom = self->_graphInsets.bottom;
  double right = self->_graphInsets.right;
  double v11 = [(GraphRenderOperation *)self displayMode];
  [v11 gutterHeight];
  double v13 = v12;

  if (self->_points && [(NSArray *)self->_linePointCounts count])
  {
    double v14 = *(double *)(MEMORY[0x263F001B0] + 8);
    BOOL v15 = *MEMORY[0x263F001B0] == self->_graphSize.width && v14 == self->_graphSize.height;
    if (!v15 && ![(GraphRenderOperation *)self isCancelled])
    {
      UIGraphicsBeginImageContextWithOptions(self->_graphSize, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      CGContextScaleCTM(CurrentContext, 1.0, -1.0);
      CGContextTranslateCTM(CurrentContext, 0.0, -self->_graphSize.height);
      CGContextBeginPath(CurrentContext);
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      uint64_t v18 = self->_linePointCounts;
      uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v96 objects:v102 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        unsigned int v21 = 0;
        uint64_t v22 = *(void *)v97;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v97 != v22) {
              objc_enumerationMutation(v18);
            }
            int v24 = [*(id *)(*((void *)&v96 + 1) + 8 * i) intValue];
            if (v24)
            {
              int v25 = v24;
              long long v26 = &self->_points[v21];
              CGContextMoveToPoint(CurrentContext, v26->x, self->_graphInsets.bottom + v26->y * v4);
              uint64_t v27 = v25 + v21;
              if (v21 < v27)
              {
                uint64_t v28 = v21;
                uint64_t v29 = v21;
                uint64_t v30 = v27 - v28;
                do
                {
                  CGContextAddLineToPoint(CurrentContext, self->_points[v29].x, self->_graphInsets.bottom + self->_points[v29].y * v4);
                  ++v29;
                  --v30;
                }
                while (v30);
                unsigned int v21 = v27;
              }
              CGContextAddLineToPoint(CurrentContext, self->_points[v21 - 1].x, 0.0);
              CGContextAddLineToPoint(CurrentContext, self->_points[v21 - v25].x, 0.0);
              CGContextClosePath(CurrentContext);
            }
          }
          uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v96 objects:v102 count:16];
        }
        while (v20);
      }

      BOOL v31 = [(StockChartDisplayMode *)self->_displayMode HUDEnabled];
      if (v31) {
        v32 = CGContextCopyPath(CurrentContext);
      }
      else {
        v32 = 0;
      }
      CGContextClip(CurrentContext);
      CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
      v33 = [(StockChartDisplayMode *)self->_displayMode backgroundGradient];
      v34 = (CGPoint *)MEMORY[0x263F00148];
      if (v33)
      {
        v35 = [(StockChartDisplayMode *)self->_displayMode backgroundGradient];
        v112.double y = self->_graphSize.height;
        v112.double x = 0.0;
        CGContextDrawLinearGradient(CurrentContext, v35, *v34, v112, 0);
      }
      double v36 = height - top;
      if (v31)
      {
        double v37 = width - left;
        v38 = [(GraphRenderOperation *)self displayMode];
        [v38 gutterHeight];
        double v91 = v39;

        v110.double width = 2.5;
        v110.double height = 2.5;
        UIGraphicsBeginImageContextWithOptions(v110, 0, 0.0);
        v40 = UIGraphicsGetCurrentContext();
        id v41 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.258823529 blue:0.439215686 alpha:1.0];
        CGContextSetStrokeColorWithColor(v40, (CGColorRef)[v41 CGColor]);

        v42 = [MEMORY[0x263F1C920] mainScreen];
        [v42 scale];
        CGContextSetLineWidth(v40, 1.0 / v43);

        CGContextSetShouldAntialias(v40, 0);
        CGContextMoveToPoint(v40, 0.0, 2.5);
        CGContextAddLineToPoint(v40, 2.5, 0.0);
        CGContextStrokePath(v40);
        v44 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIGraphicsBeginImageContextWithOptions(self->_graphSize, 0, 0.0);
        v45 = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(v45, 1.0, -1.0);
        CGContextTranslateCTM(v45, 0.0, -self->_graphSize.height);
        v46 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.584313725 blue:1.0 alpha:1.0];
        -[GraphRenderOperation renderGraphLineInContext:withColor:offset:](self, "renderGraphLineInContext:withColor:offset:", v45, v46, v34->x, v34->y);

        if (v32)
        {
          CGContextAddPath(v45, v32);
          CGContextClip(v45);
          CFRelease(v32);
        }
        double v47 = v37 - right;
        double v48 = v36 - v13;
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v50 = (void *)MEMORY[0x263EFF8C0];
        id v51 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.258823529 blue:0.447058824 alpha:0.5];
        uint64_t v52 = [v51 CGColor];
        id v53 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.57254902 blue:0.980392157 alpha:0.5];
        CFArrayRef v54 = (const __CFArray *)objc_msgSend(v50, "arrayWithObjects:", v52, objc_msgSend(v53, "CGColor"), 0);

        v55 = CGGradientCreateWithColors(DeviceRGB, v54, 0);
        CGColorSpaceRelease(DeviceRGB);
        if (v55)
        {
          v113.double y = v48 + v91;
          v111.double x = 0.0;
          v113.double x = 0.0;
          v111.double y = v91;
          CGContextDrawLinearGradient(v45, v55, v111, v113, 0);
          CFRelease(v55);
        }
        CGContextSetBlendMode(v45, kCGBlendModePlusLighter);
        id v56 = [MEMORY[0x263F1C550] colorWithPatternImage:v44];
        CGContextSetFillColorWithColor(v45, (CGColorRef)[v56 CGColor]);

        v114.origin.double x = -v48;
        v114.size.double width = v47 + v48;
        v114.origin.double y = v91;
        v114.size.double height = v48;
        CGContextFillRect(v45, v114);
        uint64_t v16 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        v34 = (CGPoint *)MEMORY[0x263F00148];
      }
      else
      {
        uint64_t v16 = 0;
      }
      CGContextRestoreGState(CurrentContext);
      if ([(GraphRenderOperation *)self isCancelled]) {
        goto LABEL_60;
      }
      if (![(NSArray *)self->_dottedLinePositions count]
        && ![(NSArray *)self->_dottedLinePositionsForStyleOnly count])
      {
LABEL_55:
        v85 = CurrentContext;
        if ([(StockChartDisplayMode *)self->_displayMode HUDEnabled])
        {
          UIGraphicsBeginImageContextWithOptions(self->_graphSize, 0, 0.0);
          v85 = UIGraphicsGetCurrentContext();
        }
        CGContextSaveGState(v85);
        CGContextScaleCTM(v85, 1.0, -1.0);
        [(StockChartDisplayMode *)self->_displayMode lineWidth];
        CGContextTranslateCTM(v85, 0.0, v86 * 0.5 - self->_graphSize.height);
        [(StockChartDisplayMode *)self->_displayMode lineWidth];
        self->_graphSize.double height = self->_graphSize.height - v87;
        v88 = [(StockChartDisplayMode *)self->_displayMode lineColor];
        -[GraphRenderOperation renderGraphLineInContext:withColor:offset:](self, "renderGraphLineInContext:withColor:offset:", v85, v88, v34->x, v34->y);

        CGContextRestoreGState(v85);
        if ([(StockChartDisplayMode *)self->_displayMode HUDEnabled])
        {
          v89 = UIGraphicsGetImageFromCurrentImageContext();
          UIGraphicsEndImageContext();
          [(StockGraphImageSet *)self->_graphImageSet setHighlightOverlayImage:v16];
          ClipBoundingBodouble x = CGContextGetClipBoundingBox(CurrentContext);
          objc_msgSend(v89, "drawInRect:", ClipBoundingBox.origin.x, ClipBoundingBox.origin.y, ClipBoundingBox.size.width, ClipBoundingBox.size.height);
        }
        v90 = UIGraphicsGetImageFromCurrentImageContext();
        [(StockGraphImageSet *)self->_graphImageSet setLineGraphImage:v90];

LABEL_60:
        UIGraphicsEndImageContext();
        goto LABEL_11;
      }
      CGContextSaveGState(CurrentContext);
      v57 = [MEMORY[0x263F1C920] mainScreen];
      [v57 scale];
      CGContextSetLineWidth(CurrentContext, 1.0 / v58);

      v59 = [MEMORY[0x263F1C920] mainScreen];
      [v59 scale];
      lengths[0] = 1.0 / v60;
      v61 = [MEMORY[0x263F1C920] mainScreen];
      [v61 scale];
      lengths[1] = 1.0 / v62;
      CGContextSetLineDash(CurrentContext, 0.0, lengths, 2uLL);

      v63 = [(GraphRenderOperation *)self displayMode];
      id v64 = [v63 backgroundLinesColor];
      CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v64 CGColor]);

      dottedLinePositions = self->_dottedLinePositions;
      if (!dottedLinePositions) {
        dottedLinePositions = self->_dottedLinePositionsForStyleOnly;
      }
      v66 = dottedLinePositions;
      if (self->_dottedLinePositions)
      {
        double v67 = v36 - bottom;
      }
      else
      {
        double v71 = self->_graphSize.height;
        v72 = [(GraphRenderOperation *)self displayMode];
        [v72 gutterHeight];
        double v67 = v71 - v73;

        if (!self->_dottedLinePositions)
        {
          double v74 = 0.0;
          goto LABEL_47;
        }
      }
      double v74 = self->_graphInsets.top;
LABEL_47:
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      v75 = v66;
      uint64_t v76 = [(NSArray *)v75 countByEnumeratingWithState:&v92 objects:v100 count:16];
      if (v76)
      {
        uint64_t v77 = v76;
        uint64_t v78 = *(void *)v93;
        do
        {
          for (uint64_t j = 0; j != v77; ++j)
          {
            if (*(void *)v93 != v78) {
              objc_enumerationMutation(v75);
            }
            [*(id *)(*((void *)&v92 + 1) + 8 * j) doubleValue];
            double v81 = RoundToPixel(v74 + v80 * v67);
            v82 = [MEMORY[0x263F1C920] mainScreen];
            [v82 scale];
            CGFloat v84 = v81 + -1.0 / v83 * 0.5;

            CGContextBeginPath(CurrentContext);
            CGContextMoveToPoint(CurrentContext, 0.0, v84);
            CGContextAddLineToPoint(CurrentContext, width, v84);
            CGContextStrokePath(CurrentContext);
          }
          uint64_t v77 = [(NSArray *)v75 countByEnumeratingWithState:&v92 objects:v100 count:16];
        }
        while (v77);
      }

      CGContextRestoreGState(CurrentContext);
      goto LABEL_55;
    }
  }
  if ([(GraphRenderOperation *)self isCancelled]) {
    return;
  }
  uint64_t v16 = StocksLogForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    points = self->_points;
    NSUInteger v69 = [(NSArray *)self->_linePointCounts count];
    v70 = NSStringFromCGSize(self->_graphSize);
    *(_DWORD *)buf = 134218498;
    v104 = points;
    __int16 v105 = 2048;
    NSUInteger v106 = v69;
    __int16 v107 = 2112;
    v108 = v70;
    _os_log_error_impl(&dword_222ED9000, v16, OS_LOG_TYPE_ERROR, "Render early exit: _points = %p, _linePointCounts.count = %llu, _graphSize = %@", buf, 0x20u);
  }
LABEL_11:
}

- (void)renderVolumeGraph
{
  if (self->_volumeGraphSize.width * self->_volumeGraphSize.height != 0.0
    && ![(GraphRenderOperation *)self isCancelled])
  {
    UIGraphicsBeginImageContextWithOptions(self->_volumeGraphSize, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    double volumeBarWidth = self->_volumeBarWidth;
    id v5 = [MEMORY[0x263F1C550] colorWithWhite:0.28627451 alpha:1.0];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v5 CGColor]);

    if (self->_volumeCount)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        v10.origin.double x = RoundRectToPixel(self->_volumeBars[v6].var0 - volumeBarWidth * 0.5);
        CGContextFillRect(CurrentContext, v10);
        ++v7;
        ++v6;
      }
      while (v7 < self->_volumeCount);
    }
    v8 = UIGraphicsGetImageFromCurrentImageContext();
    [(StockGraphImageSet *)self->_graphImageSet setVolumeGraphImage:v8];

    UIGraphicsEndImageContext();
  }
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (CGPoint)points
{
  return self->_points;
}

- (void)setPoints:(CGPoint *)a3
{
  self->_points = a3;
}

- (NSArray)linePointCounts
{
  return self->_linePointCounts;
}

- (void)setLinePointCounts:(id)a3
{
}

- (NSArray)dottedLinePositions
{
  return self->_dottedLinePositions;
}

- (void)setDottedLinePositions:(id)a3
{
}

- (NSArray)dottedLinePositionsForStyleOnly
{
  return self->_dottedLinePositionsForStyleOnly;
}

- (void)setDottedLinePositionsForStyleOnly:(id)a3
{
}

- ($175F2685EF764341F5DD80B75CC65478)volumeBars
{
  return self->_volumeBars;
}

- (void)setVolumeBars:(id *)a3
{
  self->_volumeBars = a3;
}

- (double)volumeBarWidth
{
  return self->_volumeBarWidth;
}

- (void)setVolumeBarWidth:(double)a3
{
  self->_double volumeBarWidth = a3;
}

- (unint64_t)maxVolume
{
  return self->_maxVolume;
}

- (void)setMaxVolume:(unint64_t)a3
{
  self->_maxVolume = a3;
}

- (unsigned)volumeCount
{
  return self->_volumeCount;
}

- (void)setVolumeCount:(unsigned int)a3
{
  self->_volumeCount = a3;
}

- (GraphRenderOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GraphRenderOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)graphSize
{
  double width = self->_graphSize.width;
  double height = self->_graphSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setGraphSize:(CGSize)a3
{
  self->_graphSize = a3;
}

- (CGSize)volumeGraphSize
{
  double width = self->_volumeGraphSize.width;
  double height = self->_volumeGraphSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setVolumeGraphSize:(CGSize)a3
{
  self->_volumeGraphSize = a3;
}

- (UIEdgeInsets)graphInsets
{
  double top = self->_graphInsets.top;
  double left = self->_graphInsets.left;
  double bottom = self->_graphInsets.bottom;
  double right = self->_graphInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGraphInsets:(UIEdgeInsets)a3
{
  self->_graphInsets = a3;
}

- (StockGraphImageSet)graphImageSet
{
  return self->_graphImageSet;
}

- (void)setGraphImageSet:(id)a3
{
}

- (BOOL)roundLineCaps
{
  return self->_roundLineCaps;
}

- (void)setRoundLineCaps:(BOOL)a3
{
  self->_roundLineCaps = a3;
}

- (StockChartDisplayMode)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMode, 0);
  objc_storeStrong((id *)&self->_graphImageSet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dottedLinePositionsForStyleOnly, 0);
  objc_storeStrong((id *)&self->_dottedLinePositions, 0);

  objc_storeStrong((id *)&self->_linePointCounts, 0);
}

@end