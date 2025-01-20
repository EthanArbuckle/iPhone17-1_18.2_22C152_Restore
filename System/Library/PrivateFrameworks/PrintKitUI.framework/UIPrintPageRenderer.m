@interface UIPrintPageRenderer
- (BOOL)_numberOfPagesIsCached;
- (BOOL)_startPrintJobContext:(id)a3 printInfo:(id)a4 printSettings:(id)a5;
- (CGFloat)footerHeight;
- (CGFloat)headerHeight;
- (CGRect)paperRect;
- (CGRect)printableRect;
- (NSArray)printFormatters;
- (NSArray)printFormattersForPageAtIndex:(NSInteger)pageIndex;
- (UIPrintRenderingQuality)currentRenderingQualityForRequestedRenderingQuality:(UIPrintRenderingQuality)requestedRenderingQuality;
- (int64_t)_maxFormatterPage;
- (int64_t)_numberOfPages;
- (int64_t)currentRenderingQuality;
- (int64_t)requestedRenderingQuality;
- (void)_drawPage:(int64_t)a3 withScale:(double)a4 drawingToPDF:(BOOL)a5;
- (void)_endPrintJobContext;
- (void)_endSaveContext;
- (void)_removePrintFormatter:(id)a3;
- (void)_startPrintJobContext:(CGContext *)a3;
- (void)_startSaveContext:(CGContext *)a3;
- (void)addPrintFormatter:(UIPrintFormatter *)formatter startingAtPageAtIndex:(NSInteger)pageIndex;
- (void)dealloc;
- (void)drawPageAtIndex:(NSInteger)pageIndex inRect:(CGRect)printableRect;
- (void)drawPrintFormatter:(UIPrintFormatter *)printFormatter forPageAtIndex:(NSInteger)pageIndex;
- (void)setCurrentRenderingQuality:(int64_t)a3;
- (void)setFooterHeight:(CGFloat)footerHeight;
- (void)setHeaderHeight:(CGFloat)headerHeight;
- (void)setPaperRect:(CGRect)a3;
- (void)setPrintFormatters:(NSArray *)printFormatters;
- (void)setPrintableRect:(CGRect)a3;
- (void)setRequestedRenderingQuality:(int64_t)a3;
@end

@implementation UIPrintPageRenderer

- (void)dealloc
{
  printContext = self->_printContext;
  if (printContext)
  {
    CGContextRelease(printContext);
    self->_printContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIPrintPageRenderer;
  [(UIPrintPageRenderer *)&v4 dealloc];
}

- (NSArray)printFormatters
{
  v2 = self;
  objc_sync_enter(v2);
  printFormatters = v2->_printFormatters;
  if (printFormatters) {
    objc_super v4 = (void *)[(NSMutableArray *)printFormatters copy];
  }
  else {
    objc_super v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)setPrintFormatters:(NSArray *)printFormatters
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v4 = printFormatters;
  v5 = self;
  objc_sync_enter(v5);
  if ((NSArray *)v5->_printFormatters != v4)
  {
    uint64_t v6 = [(NSArray *)v4 mutableCopy];
    v7 = v5->_printFormatters;
    v5->_printFormatters = (NSMutableArray *)v6;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v8 = v5->_printFormatters;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setPrintPageRenderer:", v5, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  objc_sync_exit(v5);
}

- (void)addPrintFormatter:(UIPrintFormatter *)formatter startingAtPageAtIndex:(NSInteger)pageIndex
{
  uint64_t v6 = formatter;
  if (v6)
  {
    uint64_t v11 = v6;
    v7 = self;
    objc_sync_enter(v7);
    printFormatters = v7->_printFormatters;
    if (printFormatters)
    {
      [(NSMutableArray *)printFormatters addObject:v11];
    }
    else
    {
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v11, 0);
      uint64_t v10 = v7->_printFormatters;
      v7->_printFormatters = (NSMutableArray *)v9;
    }
    [(UIPrintFormatter *)v11 setPrintPageRenderer:v7];
    [(UIPrintFormatter *)v11 setStartPage:pageIndex];
    objc_sync_exit(v7);

    uint64_t v6 = v11;
  }
}

- (NSArray)printFormattersForPageAtIndex:(NSInteger)pageIndex
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v4 = [(UIPrintPageRenderer *)self printFormatters];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        NSInteger StartPageFromFormatter = GetStartPageFromFormatter(v10);
        if (StartPageFromFormatter <= pageIndex && GetPageCountFromFormatter(v10) + StartPageFromFormatter > pageIndex)
        {
          if (v7)
          {
            [v7 addObject:v10];
          }
          else
          {
            v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:v10];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
}

- (void)_removePrintFormatter:(id)a3
{
  id v5 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  [v5 setPrintPageRenderer:0];
  [(NSMutableArray *)v4->_printFormatters removeObject:v5];
  objc_sync_exit(v4);
}

- (int64_t)_maxFormatterPage
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(UIPrintPageRenderer *)self printFormatters];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t StartPageFromFormatter = GetStartPageFromFormatter(v8);
        if (StartPageFromFormatter != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v10 = StartPageFromFormatter;
          uint64_t PageCountFromFormatter = GetPageCountFromFormatter(v8);
          if (v5 <= PageCountFromFormatter + v10) {
            int64_t v5 = PageCountFromFormatter + v10;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_numberOfPagesIsCached
{
  return self->_cachedPageCount > 0;
}

- (int64_t)_numberOfPages
{
  int64_t result = self->_cachedPageCount;
  if (result <= 0)
  {
    int64_t result = [(UIPrintPageRenderer *)self numberOfPages];
    self->_cachedPageCount = result;
  }
  return result;
}

- (UIPrintRenderingQuality)currentRenderingQualityForRequestedRenderingQuality:(UIPrintRenderingQuality)requestedRenderingQuality
{
  return 0;
}

- (void)setHeaderHeight:(CGFloat)headerHeight
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_headerHeight != headerHeight)
  {
    self->_headerHeight = headerHeight;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(UIPrintPageRenderer *)self printFormatters];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) _setNeedsRecalc];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    self->_cachedPageCount = -1;
  }
}

- (void)setFooterHeight:(CGFloat)footerHeight
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_footerHeight != footerHeight)
  {
    self->_footerHeight = footerHeight;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(UIPrintPageRenderer *)self printFormatters];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) _setNeedsRecalc];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    self->_cachedPageCount = -1;
  }
}

- (void)setPaperRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!CGRectEqualToRect(self->_paperRect, a3))
  {
    self->_paperRect.origin.CGFloat x = x;
    self->_paperRect.origin.CGFloat y = y;
    self->_paperRect.size.CGFloat width = width;
    self->_paperRect.size.CGFloat height = height;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [(UIPrintPageRenderer *)self printFormatters];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * v12++) _setNeedsRecalc];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    self->_cachedPageCount = -1;
  }
}

- (void)setPrintableRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!CGRectEqualToRect(self->_printableRect, a3))
  {
    self->_printableRect.origin.CGFloat x = x;
    self->_printableRect.origin.CGFloat y = y;
    self->_printableRect.size.CGFloat width = width;
    self->_printableRect.size.CGFloat height = height;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [(UIPrintPageRenderer *)self printFormatters];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * v12++) _setNeedsRecalc];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    self->_cachedPageCount = -1;
  }
}

- (void)drawPageAtIndex:(NSInteger)pageIndex inRect:(CGRect)printableRect
{
  CGFloat height = printableRect.size.height;
  CGFloat width = printableRect.size.width;
  CGFloat y = printableRect.origin.y;
  CGFloat x = printableRect.origin.x;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  memset(&v25, 0, sizeof(v25));
  [(UIPrintPageRenderer *)self headerHeight];
  CGFloat v11 = v10;
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGRectDivide(v30, &slice, &remainder, v11, CGRectMinYEdge);
  [(UIPrintPageRenderer *)self footerHeight];
  CGRectDivide(remainder, &v25, &remainder, v12, CGRectMaxYEdge);
  CurrentContext = UIGraphicsGetCurrentContext();
  if (!CGRectIsEmpty(slice))
  {
    CGContextSaveGState(CurrentContext);
    -[UIPrintPageRenderer drawHeaderForPageAtIndex:inRect:](self, "drawHeaderForPageAtIndex:inRect:", pageIndex, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGContextRestoreGState(CurrentContext);
  }
  if (!CGRectIsEmpty(remainder))
  {
    CGContextSaveGState(CurrentContext);
    -[UIPrintPageRenderer drawContentForPageAtIndex:inRect:](self, "drawContentForPageAtIndex:inRect:", pageIndex, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    CGContextRestoreGState(CurrentContext);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v14 = [(UIPrintPageRenderer *)self printFormatters];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        NSInteger StartPageFromFormatter = GetStartPageFromFormatter(v19);
        if (StartPageFromFormatter <= pageIndex && GetPageCountFromFormatter(v19) + StartPageFromFormatter > pageIndex)
        {
          CGContextSaveGState(CurrentContext);
          [(UIPrintPageRenderer *)self drawPrintFormatter:v19 forPageAtIndex:pageIndex];
          CGContextRestoreGState(CurrentContext);
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v16);
  }

  if (!CGRectIsEmpty(v25))
  {
    CGContextSaveGState(CurrentContext);
    -[UIPrintPageRenderer drawFooterForPageAtIndex:inRect:](self, "drawFooterForPageAtIndex:inRect:", pageIndex, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
    CGContextRestoreGState(CurrentContext);
  }
}

- (void)drawPrintFormatter:(UIPrintFormatter *)printFormatter forPageAtIndex:(NSInteger)pageIndex
{
  uint64_t v6 = printFormatter;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__UIPrintPageRenderer_drawPrintFormatter_forPageAtIndex___block_invoke;
  v11[3] = &unk_1E6DA20E0;
  uint64_t v7 = v6;
  CGFloat v12 = v7;
  NSInteger v13 = pageIndex;
  uint64_t v8 = (void (**)(void))MEMORY[0x1E4E4C3C0](v11);
  if (pthread_main_np() == 1 || ![(UIPrintFormatter *)v7 requiresMainThread])
  {
    v8[2](v8);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__UIPrintPageRenderer_drawPrintFormatter_forPageAtIndex___block_invoke_2;
    v9[3] = &unk_1E6DA1BE8;
    v9[4] = self;
    double v10 = v8;
    dispatch_sync(MEMORY[0x1E4F14428], v9);
  }
}

uint64_t __57__UIPrintPageRenderer_drawPrintFormatter_forPageAtIndex___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) rectForPageAtIndex:*(void *)(a1 + 40)];
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  uint64_t result = CGRectIsEmpty(v10);
  if ((result & 1) == 0)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    return objc_msgSend(v7, "drawInRect:forPageAtIndex:", v8, x, y, width, height);
  }
  return result;
}

void __57__UIPrintPageRenderer_drawPrintFormatter_forPageAtIndex___block_invoke_2(uint64_t a1)
{
  v2 = *(CGContext **)(*(void *)(a1 + 32) + 96);
  if (v2)
  {
    UIGraphicsPushContext(v2);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    UIGraphicsPopContext();
  }
}

- (BOOL)_startPrintJobContext:(id)a3 printInfo:(id)a4 printSettings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 startJob:a5 ofType:*MEMORY[0x1E4F93350]])
  {
    id v10 = v8;
    CGDataConsumerRef v11 = CGDataConsumerCreate(v10, (const CGDataConsumerCallbacks *)_startPrintJobContext_printInfo_printSettings____consumerCallbacks);
    if (v11)
    {
      CGFloat v12 = v11;
      printContext = self->_printContext;
      if (printContext)
      {
        CGContextRelease(printContext);
        self->_printContext = 0;
      }
      [(UIPrintPageRenderer *)self paperRect];
      double v15 = v14;
      double v17 = v16;
      objc_msgSend(v9, "scalingFactor", v18, v19);
      v25.size.double width = v20 * v15;
      [v9 scalingFactor];
      v25.size.double height = v21 * v17;
      self->_printContext = CGPDFContextCreate(v12, &v25, 0);
      long long v22 = v12;
    }
    else
    {
      long long v22 = (CGDataConsumer *)v10;
    }
    CFRelease(v22);
    self->_usingPrintJobContext = 1;
  }
  BOOL v23 = self->_printContext != 0;

  return v23;
}

- (void)_startPrintJobContext:(CGContext *)a3
{
  printContext = self->_printContext;
  if (printContext)
  {
    CGContextRelease(printContext);
    self->_printContext = 0;
  }
  self->_usingPrintJobContext = 1;
  self->_printContext = CGContextRetain(a3);
}

- (void)_endPrintJobContext
{
  if (self->_usingPrintJobContext)
  {
    printContext = self->_printContext;
    if (printContext)
    {
      CGPDFContextClose(printContext);
      CGContextRelease(self->_printContext);
      self->_printContext = 0;
      self->_usingPrintJobContext = 0;
    }
  }
}

- (void)_startSaveContext:(CGContext *)a3
{
  printContext = self->_printContext;
  if (printContext)
  {
    CGContextRelease(printContext);
    self->_printContext = 0;
  }
  self->_usingPrintJobContext = 0;
  self->_printContext = CGContextRetain(a3);
}

- (void)_endSaveContext
{
  printContext = self->_printContext;
  if (printContext)
  {
    CGContextRelease(printContext);
    self->_printContext = 0;
  }
}

- (void)_drawPage:(int64_t)a3 withScale:(double)a4 drawingToPDF:(BOOL)a5
{
  printContext = self->_printContext;
  if (printContext)
  {
    BOOL v7 = a5;
    if (a5)
    {
      CGPDFContextBeginPage(printContext, 0);
      printContext = self->_printContext;
    }
    CGContextSaveGState(printContext);
    id v10 = self->_printContext;
    [(UIPrintPageRenderer *)self paperRect];
    CGContextTranslateCTM(v10, 0.0, v11 * a4);
    CGContextScaleCTM(self->_printContext, a4, -a4);
    CGAffineTransformMakeScale(&v12, a4, -a4);
    CGContextSetBaseCTM();
    UIGraphicsPushContext(self->_printContext);
    [(UIPrintPageRenderer *)self printableRect];
    -[UIPrintPageRenderer drawPageAtIndex:inRect:](self, "drawPageAtIndex:inRect:", a3);
    if (self->_printContext)
    {
      UIGraphicsPopContext();
      CGContextRestoreGState(self->_printContext);
      if (v7) {
        CGPDFContextEndPage(self->_printContext);
      }
    }
  }
}

- (CGFloat)headerHeight
{
  return self->_headerHeight;
}

- (CGFloat)footerHeight
{
  return self->_footerHeight;
}

- (CGRect)paperRect
{
  double x = self->_paperRect.origin.x;
  double y = self->_paperRect.origin.y;
  double width = self->_paperRect.size.width;
  double height = self->_paperRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)printableRect
{
  double x = self->_printableRect.origin.x;
  double y = self->_printableRect.origin.y;
  double width = self->_printableRect.size.width;
  double height = self->_printableRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)requestedRenderingQuality
{
  return self->_requestedRenderingQuality;
}

- (void)setRequestedRenderingQuality:(int64_t)a3
{
  self->_requestedRenderingQualitdouble y = a3;
}

- (int64_t)currentRenderingQuality
{
  return self->_currentRenderingQuality;
}

- (void)setCurrentRenderingQuality:(int64_t)a3
{
  self->_currentRenderingQualitdouble y = a3;
}

- (void).cxx_destruct
{
}

@end