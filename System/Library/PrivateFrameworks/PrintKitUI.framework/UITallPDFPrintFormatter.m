@interface UITallPDFPrintFormatter
- (UITallPDFPrintFormatter)initWithPDFData:(id)a3 pdfPassword:(id)a4;
- (UITallPDFPrintFormatter)initWithPDFURL:(id)a3 pdfPassword:(id)a4;
- (int64_t)_recalcPageCount;
- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4;
@end

@implementation UITallPDFPrintFormatter

- (UITallPDFPrintFormatter)initWithPDFURL:(id)a3 pdfPassword:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UITallPDFPrintFormatter;
  v9 = [(UIPrintFormatter *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_rotate90 = 0;
    v9->_pdfScaleFactor = 1.0;
    objc_storeStrong((id *)&v9->_pdfPath, a3);
    v11 = CGPDFDocumentCreateWithURL((CFURLRef)v10->_pdfPath);
    v10->_pdfDocRef = v11;
    if (v8)
    {
      if (v11 && CGPDFDocumentIsEncrypted(v11)) {
        CGPDFDocumentUnlockWithPassword(v10->_pdfDocRef, (const char *)[v8 cStringUsingEncoding:4]);
      }
    }
  }

  return v10;
}

- (UITallPDFPrintFormatter)initWithPDFData:(id)a3 pdfPassword:(id)a4
{
  CFDataRef v6 = (const __CFData *)a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UITallPDFPrintFormatter;
  id v8 = [(UIPrintFormatter *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_rotate90 = 0;
    v8->_pdfScaleFactor = 1.0;
    if (v6)
    {
      v10 = CGDataProviderCreateWithCFData(v6);
      v11 = v10;
      if (v10) {
        v9->_pdfDocRef = CGPDFDocumentCreateWithProvider(v10);
      }
      CGDataProviderRelease(v11);
      if (v7)
      {
        pdfDocRef = v9->_pdfDocRef;
        if (pdfDocRef)
        {
          if (CGPDFDocumentIsEncrypted(pdfDocRef)) {
            CGPDFDocumentUnlockWithPassword(v9->_pdfDocRef, (const char *)[v7 cStringUsingEncoding:4]);
          }
        }
      }
    }
  }

  return v9;
}

- (int64_t)_recalcPageCount
{
  v25.receiver = self;
  v25.super_class = (Class)UITallPDFPrintFormatter;
  [(UIPrintFormatter *)&v25 _pageContentRect:0];
  self->_rotate90 = 0;
  self->_pdfScaleFactor = 1.0;
  self->_shiftUpLength = 0.0;
  pdfDocRef = self->_pdfDocRef;
  if (pdfDocRef)
  {
    CGFloat v8 = v3;
    double v9 = v4;
    double v10 = v5;
    double v11 = v6;
    int NumberOfPages = CGPDFDocumentGetNumberOfPages(pdfDocRef);
    Page = CGPDFDocumentGetPage(self->_pdfDocRef, 1uLL);
    CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    unint64_t v14 = 0;
    if (BoxRect.size.height > 0.0 && BoxRect.size.width > 0.0 && v11 > 0.0 && v10 > 0.0)
    {
      double v15 = BoxRect.size.width / BoxRect.size.height;
      double v16 = v10 / v11;
      if (fabs((BoxRect.size.width / BoxRect.size.height - v10 / v11) / (v10 / v11)) < 0.100000001)
      {
        CGFloat v17 = BoxRect.size.width / v10;
LABEL_20:
        self->_pdfScaleFactor = v17;
        return NumberOfPages;
      }
      BOOL v18 = v15 > 1.0 && v16 < 1.0;
      if (v18 || (v16 > 1.0 ? (BOOL v19 = v15 < 1.0) : (BOOL v19 = 0), v19))
      {
        if (fabs((1.0 / v15 - v16) / v16) < 0.100000001)
        {
          self->_rotate90 = 1;
          CGFloat v17 = BoxRect.size.height / v10;
          goto LABEL_20;
        }
      }
      self->_pdfScaleFactor = v10 / BoxRect.size.width;
      CGFloat v21 = BoxRect.size.height * (v10 / BoxRect.size.width);
      v27.origin.x = v8;
      v27.origin.y = v9;
      v27.size.width = v10;
      v27.size.height = v11;
      double v22 = v21 / CGRectGetHeight(v27);
      unint64_t v14 = vcvtpd_s64_f64(v22);
      double v23 = ceil(v22);
      v24.receiver = self;
      v24.super_class = (Class)UITallPDFPrintFormatter;
      [(UIPrintFormatter *)&v24 _pageContentRect:0];
      self->_shiftUpLength = -(v21 - CGRectGetHeight(v28) * (double)(uint64_t)v23) - v9;
    }
  }
  else
  {
    int NumberOfPages = 0;
    unint64_t v14 = 0;
  }
  return NumberOfPages * v14;
}

- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGContextClipToRect(CurrentContext, v18);
  pdfDocRef = self->_pdfDocRef;
  if (pdfDocRef)
  {
    int NumberOfPages = CGPDFDocumentGetNumberOfPages(pdfDocRef);
    if (NumberOfPages) {
      int v13 = (int)[(UIPrintFormatter *)self pageCount] / NumberOfPages;
    }
    else {
      int v13 = 1;
    }
    Page = CGPDFDocumentGetPage(self->_pdfDocRef, vcvtpd_u64_f64(((double)a4 + 1.0) / (double)v13));
    int64_t v15 = a4 - [(UIPrintFormatter *)self startPage];
    v17.receiver = self;
    v17.super_class = (Class)UITallPDFPrintFormatter;
    [(UIPrintFormatter *)&v17 _pageContentRect:0];
    CGFloat v16 = CGRectGetHeight(v19);
    CGContextTranslateCTM(CurrentContext, x, v16 * (double)v13 - v16 * (double)(v15 % v13) - self->_shiftUpLength);
    CGContextScaleCTM(CurrentContext, self->_pdfScaleFactor, -self->_pdfScaleFactor);
    if (self->_rotate90) {
      CGContextRotateCTM(CurrentContext, 90.0);
    }
    if ([(UIPrintFormatter *)self imagePDFAnnotations]) {
      CGContextDrawPDFPageWithAnnotations();
    }
    else {
      CGContextDrawPDFPage(CurrentContext, Page);
    }
  }
  CGContextRestoreGState(CurrentContext);
}

- (void).cxx_destruct
{
}

@end