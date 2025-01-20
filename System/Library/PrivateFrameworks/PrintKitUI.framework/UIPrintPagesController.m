@interface UIPrintPagesController
- (BOOL)usingWebKitFormatter;
- (CGPDFDocument)webKitThumbnailPDFDocumentRef;
- (CGSize)sizeForPageNum:(int64_t)a3;
- (NSCache)cachedBasePageImages;
- (NSCache)cachedPageSizes;
- (NSOperationQueue)webKitPrintingOperationsQueue;
- (NSThread)webKitThumbnailGenerationThread;
- (NSURL)webKitThumbnailPDFURL;
- (UIPrintInfo)printInfo;
- (UIPrintPagesController)initWithPrintInfo:(id)a3 delegate:(id)a4;
- (UIPrintPagesControllerDelegate)delegate;
- (id)baseImageForPageNum:(int64_t)a3;
- (id)imageForPageNum:(int64_t)a3 showingPageView:(BOOL)a4;
- (void)clearPagesCache;
- (void)createPDFForAllPages;
- (void)dealloc;
- (void)drawBorderAtRect:(CGRect)a3 context:(CGContext *)a4;
- (void)generateWebKitThumbnailsWithCompletionBlock:(id)a3;
- (void)recalculateWebKitPageCount;
- (void)removeWebKitThumbnailPDF;
- (void)setCachedBasePageImages:(id)a3;
- (void)setCachedPageSizes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPrintInfo:(id)a3;
- (void)setUsingWebKitFormatter:(BOOL)a3;
- (void)setWebKitPrintingOperationsQueue:(id)a3;
- (void)setWebKitThumbnailGenerationThread:(id)a3;
- (void)setWebKitThumbnailPDFDocumentRef:(CGPDFDocument *)a3;
- (void)setWebKitThumbnailPDFURL:(id)a3;
@end

@implementation UIPrintPagesController

- (UIPrintPagesController)initWithPrintInfo:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UIPrintPagesController;
  v8 = [(UIPrintPagesController *)&v16 init];
  v9 = v8;
  if (v8)
  {
    [(UIPrintPagesController *)v8 setPrintInfo:v6];
    [(UIPrintPagesController *)v9 setDelegate:v7];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    [(UIPrintPagesController *)v9 setCachedPageSizes:v10];

    id v11 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    [(UIPrintPagesController *)v9 setCachedBasePageImages:v11];

    id v12 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(UIPrintPagesController *)v9 setWebKitPrintingOperationsQueue:v12];

    v13 = [(UIPrintPagesController *)v9 webKitPrintingOperationsQueue];
    [v13 setMaxConcurrentOperationCount:1];

    v14 = [(UIPrintPagesController *)v9 webKitPrintingOperationsQueue];
    [v14 setName:@"com.apple.UIKit.UIPrintPreviewViewController.webKitThumbnailGenerationQueue"];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(UIPrintPagesController *)self webKitPrintingOperationsQueue];
  [v3 cancelAllOperations];

  v4 = [(UIPrintPagesController *)self webKitThumbnailGenerationThread];
  [v4 cancel];

  [(UIPrintPagesController *)self removeWebKitThumbnailPDF];
  v5.receiver = self;
  v5.super_class = (Class)UIPrintPagesController;
  [(UIPrintPagesController *)&v5 dealloc];
}

- (CGSize)sizeForPageNum:(int64_t)a3
{
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
  id v6 = [(UIPrintPagesController *)self cachedPageSizes];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    [v7 CGSizeValue];
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    id v12 = [(UIPrintPagesController *)self delegate];
    [v12 paperSizeForPageNum:a3];
    double v14 = v13;
    double v16 = v15;

    if (v16 <= 0.0 || v14 <= 0.0)
    {
      double v9 = *MEMORY[0x1E4F1DB30];
      double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      id v7 = [(UIPrintPagesController *)self cachedPageSizes];
      [v7 removeObjectForKey:v5];
    }
    else
    {
      double v17 = v14 / v16;
      if (v14 / v16 <= 1.0)
      {
        double v11 = 500.0;
        double v9 = v17 * 500.0;
      }
      else
      {
        double v9 = 500.0;
        double v11 = 500.0 / v17;
      }
      id v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v9, v11);
      v18 = [(UIPrintPagesController *)self cachedPageSizes];
      [v18 setObject:v7 forKey:v5];
    }
  }

  double v19 = v9;
  double v20 = v11;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)baseImageForPageNum:(int64_t)a3
{
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
  id v6 = [(UIPrintPagesController *)self cachedBasePageImages];
  id v7 = [v6 objectForKey:v5];

  if (!v7)
  {
    [(UIPrintPagesController *)self sizeForPageNum:a3];
    if (v9 > 0.0)
    {
      double v11 = v10;
      if (v10 > 0.0)
      {
        double v12 = v9;
        double v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v13 scale];
        double v15 = v12 * v14;
        double v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v16 scale];
        double v18 = v11 * v17;

        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        double v20 = CGBitmapContextCreate(0, vcvtpd_u64_f64(v15), vcvtpd_u64_f64(v18), 8uLL, vcvtd_n_u64_f64(ceil(v15), 2uLL), DeviceRGB, 1u);
        CGColorSpaceRelease(DeviceRGB);
        eraseCGBitmapContext(v20);
        if ([(UIPrintPagesController *)self usingWebKitFormatter])
        {
          v21 = [(UIPrintPagesController *)self webKitThumbnailPDFURL];
          objc_sync_enter(v21);
          if ([(UIPrintPagesController *)self webKitThumbnailPDFDocumentRef])
          {
            Page = CGPDFDocumentGetPage([(UIPrintPagesController *)self webKitThumbnailPDFDocumentRef], a3);
            if (Page)
            {
              v23 = [(UIPrintPagesController *)self delegate];
              [v23 paperSizeForPageNum:a3];
              double v25 = v24;
              double v26 = ceil(v18);

              memset(&v31, 0, sizeof(v31));
              CGAffineTransformMakeScale(&v31, v26 / v25, v26 / v25);
              CGAffineTransform v30 = v31;
              CGContextConcatCTM(v20, &v30);
              v27 = [(UIPrintPagesController *)self printInfo];
              LODWORD(v23) = [v27 imagePDFAnnotations];

              if (v23) {
                CGContextDrawPDFPageWithAnnotations();
              }
              else {
                CGContextDrawPDFPage(v20, Page);
              }
            }
          }
          objc_sync_exit(v21);
        }
        else
        {
          v21 = [(UIPrintPagesController *)self delegate];
          objc_msgSend(v21, "drawImageForPageNum:toContext:sheetSize:", a3, v20, v15, v18);
        }

        Image = CGBitmapContextCreateImage(v20);
        id v7 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image];
        CGImageRelease(Image);
        CGContextRelease(v20);
        if (v7)
        {
          v29 = [(UIPrintPagesController *)self cachedBasePageImages];
          [v29 setObject:v7 forKey:v5];
        }
      }
    }
  }

  return v7;
}

- (id)imageForPageNum:(int64_t)a3 showingPageView:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(UIPrintPagesController *)self baseImageForPageNum:a3];
  id v7 = v6;
  if (!v6)
  {
    double v13 = 0;
    goto LABEL_16;
  }
  id v8 = v6;
  double v9 = (CGImage *)[v8 CGImage];
  [v8 size];
  double v11 = v10;
  [v8 size];
  double v13 = 0;
  if (v11 > 0.0)
  {
    double v14 = v12;
    if (v12 > 0.0)
    {
      double v15 = [(UIPrintPagesController *)self printInfo];
      if ([v15 outputType] != 2)
      {
        double v16 = [(UIPrintPagesController *)self printInfo];
        if ([v16 outputType] != 3)
        {
          v28 = [(UIPrintPagesController *)self printInfo];
          uint64_t v29 = [v28 currentPrinter];
          if (v29)
          {
            CGAffineTransform v30 = (void *)v29;
            CGAffineTransform v31 = [(UIPrintPagesController *)self printInfo];
            v32 = [v31 currentPrinter];
            char v33 = [v32 supportsColor];

            if ((v33 & 1) == 0) {
              goto LABEL_8;
            }
          }
          else
          {
          }
          CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
          goto LABEL_9;
        }
      }
LABEL_8:
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceGray();
LABEL_9:
      double v18 = DeviceRGB;
      size_t BitsPerComponent = CGImageGetBitsPerComponent(v9);
      size_t BytesPerRow = CGImageGetBytesPerRow(v9);
      uint32_t BitmapInfo = CGImageGetBitmapInfo(v9);
      v22 = CGBitmapContextCreate(0, (unint64_t)v11, (unint64_t)v14, BitsPerComponent, BytesPerRow, v18, BitmapInfo);
      CGColorSpaceRelease(v18);
      eraseCGBitmapContext(v22);
      CGContextSaveGState(v22);
      v23 = [(UIPrintPagesController *)self printInfo];
      if ([v23 flipHorizontal])
      {
        double v24 = [(UIPrintPagesController *)self printInfo];
        int v25 = [v24 nUpActive];

        if (!v25 || v4)
        {
          CGContextTranslateCTM(v22, v11, 0.0);
          CGContextScaleCTM(v22, -1.0, 1.0);
        }
      }
      else
      {
      }
      v35.origin.x = 0.0;
      v35.origin.y = 0.0;
      v35.size.width = v11;
      v35.size.height = v14;
      CGContextDrawImage(v22, v35, v9);
      CGContextRestoreGState(v22);
      -[UIPrintPagesController drawBorderAtRect:context:](self, "drawBorderAtRect:context:", v22, 0.0, 0.0, v11, v14);
      Image = CGBitmapContextCreateImage(v22);
      double v13 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image];
      CGImageRelease(Image);
      CGContextRelease(v22);
    }
  }
LABEL_16:

  return v13;
}

- (void)drawBorderAtRect:(CGRect)a3 context:(CGContext *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v8 = [(UIPrintPagesController *)self printInfo];
  uint64_t v9 = [v8 borderType];

  if (v9)
  {
    double v10 = [(UIPrintPagesController *)self printInfo];
    double v11 = [v10 printPaper];
    [v11 paperSize];
    double v13 = v12;
    double v15 = v14;

    double v16 = [(UIPrintPagesController *)self printInfo];
    double v17 = [v16 printPaper];
    [v17 printableRect];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    double v26 = v15 - (v21 + v25);
    if ((v13 <= v15 || width >= height) && (v13 >= v15 || width <= height))
    {
      double v27 = v21;
      double v28 = v15 - (v21 + v25);
      double v26 = v13 - (v19 + v23);
      double v21 = v19;
      double v29 = v15;
      double v15 = v13;
    }
    else
    {
      double v27 = v19;
      double v28 = v13 - (v19 + v23);
      double v29 = v13;
    }
    double v30 = height / v29;
    if (width / v15 < v30) {
      double v30 = width / v15;
    }
    double v31 = v21 * v30;
    double v32 = v27 * v30;
    double v33 = width - v26 * v30 - v21 * v30;
    double v34 = height - v27 * v30 - v28 * v30;
    if ((v9 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      double v35 = 0.24;
    }
    else {
      double v35 = 0.5;
    }
    CGContextSaveGState(a4);
    CGContextSetLineWidth(a4, v35);
    id v36 = [MEMORY[0x1E4FB1618] blackColor];
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v36 CGColor]);

    v38.origin.x = v31;
    v38.origin.y = v32;
    v38.size.double width = v33;
    v38.size.double height = v34;
    CGRect v39 = CGRectInset(v38, 2.0, 2.0);
    CGContextStrokeRect(a4, v39);
    if ((unint64_t)(v9 - 3) <= 1)
    {
      v40.origin.x = v31;
      v40.origin.y = v32;
      v40.size.double width = v33;
      v40.size.double height = v34;
      CGRect v41 = CGRectInset(v40, 6.0, 6.0);
      CGContextStrokeRect(a4, v41);
    }
    CGContextRestoreGState(a4);
  }
}

- (void)clearPagesCache
{
  v3 = [(UIPrintPagesController *)self cachedPageSizes];
  [v3 removeAllObjects];

  id v4 = [(UIPrintPagesController *)self cachedBasePageImages];
  [v4 removeAllObjects];
}

- (void)removeWebKitThumbnailPDF
{
  v3 = [(UIPrintPagesController *)self webKitThumbnailPDFURL];
  objc_sync_enter(v3);
  if ([(UIPrintPagesController *)self webKitThumbnailPDFDocumentRef])
  {
    CGPDFDocumentRelease([(UIPrintPagesController *)self webKitThumbnailPDFDocumentRef]);
    [(UIPrintPagesController *)self setWebKitThumbnailPDFDocumentRef:0];
  }
  id v4 = [(UIPrintPagesController *)self webKitThumbnailPDFURL];

  if (v4)
  {
    objc_super v5 = objc_opt_new();
    id v6 = [(UIPrintPagesController *)self webKitThumbnailPDFURL];
    id v7 = [v6 path];
    int v8 = [v5 fileExistsAtPath:v7];

    if (v8)
    {
      uint64_t v9 = [(UIPrintPagesController *)self webKitThumbnailPDFURL];
      id v12 = 0;
      char v10 = [v5 removeItemAtURL:v9 error:&v12];
      id v11 = v12;

      if ((v10 & 1) == 0) {
        NSLog(&cfstr_Uiprintpagesco.isa, v11);
      }
    }
    [(UIPrintPagesController *)self setWebKitThumbnailPDFURL:0];
  }
  objc_sync_exit(v3);
}

- (void)createPDFForAllPages
{
  v3 = [MEMORY[0x1E4F29060] currentThread];
  char v4 = [v3 isCancelled];

  if ((v4 & 1) == 0)
  {
    objc_super v5 = [(UIPrintPagesController *)self delegate];
    CFURLRef url = [v5 createWebKitPDFForAllPages];

    if (url)
    {
      id v6 = [MEMORY[0x1E4F29060] currentThread];
      char v7 = [v6 isCancelled];

      if ((v7 & 1) == 0)
      {
        int v8 = [(UIPrintPagesController *)self webKitThumbnailPDFURL];
        objc_sync_enter(v8);
        [(UIPrintPagesController *)self setWebKitThumbnailPDFURL:url];
        [(UIPrintPagesController *)self setWebKitThumbnailPDFDocumentRef:CGPDFDocumentCreateWithURL(url)];
        objc_sync_exit(v8);

        [(UIPrintPagesController *)self clearPagesCache];
      }
    }
  }
}

- (void)generateWebKitThumbnailsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  [(UIPrintPagesController *)self setUsingWebKitFormatter:1];
  objc_super v5 = [(UIPrintPagesController *)self webKitPrintingOperationsQueue];
  [v5 cancelAllOperations];

  id v6 = [(UIPrintPagesController *)self webKitThumbnailGenerationThread];
  [v6 cancel];

  [(UIPrintPagesController *)self removeWebKitThumbnailPDF];
  [(UIPrintPagesController *)self clearPagesCache];
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__UIPrintPagesController_generateWebKitThumbnailsWithCompletionBlock___block_invoke;
  v16[3] = &unk_1E6DA19F0;
  objc_copyWeak(&v18, &location);
  id v7 = v4;
  id v17 = v7;
  int v8 = (void *)MEMORY[0x1E4E4C3C0](v16);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__UIPrintPagesController_generateWebKitThumbnailsWithCompletionBlock___block_invoke_2;
  v13[3] = &unk_1E6DA19F0;
  objc_copyWeak(&v15, &location);
  id v9 = v8;
  id v14 = v9;
  char v10 = (void *)MEMORY[0x1E4E4C3C0](v13);
  id v11 = [[UIPrintWebKitThumbnailGenerationOperation alloc] initWithPagesController:self];
  [(NSBlockOperation *)v11 addExecutionBlock:v10];
  id v12 = [(UIPrintPagesController *)self webKitPrintingOperationsQueue];
  [v12 addOperation:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __70__UIPrintPagesController_generateWebKitThumbnailsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained createPDFForAllPages];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__UIPrintPagesController_generateWebKitThumbnailsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29060]) initWithBlock:*(void *)(a1 + 32)];
  [WeakRetained setWebKitThumbnailGenerationThread:v2];

  v3 = [WeakRetained webKitThumbnailGenerationThread];
  [v3 setName:@"com.apple.UIKit.UIPrintPreviewViewController.webKitThumbnailGenerationThread"];

  id v4 = [WeakRetained webKitThumbnailGenerationThread];
  [v4 start];
}

- (void)recalculateWebKitPageCount
{
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __52__UIPrintPagesController_recalculateWebKitPageCount__block_invoke;
  char v10 = &unk_1E6DA1788;
  objc_copyWeak(&v11, &location);
  v3 = (void *)MEMORY[0x1E4E4C3C0](&v7);
  id v4 = [UIPrintWebKitThumbnailGenerationOperation alloc];
  objc_super v5 = -[UIPrintWebKitThumbnailGenerationOperation initWithPagesController:](v4, "initWithPagesController:", self, v7, v8, v9, v10);
  [(NSBlockOperation *)v5 addExecutionBlock:v3];
  id v6 = [(UIPrintPagesController *)self webKitPrintingOperationsQueue];
  [v6 addOperation:v5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __52__UIPrintPagesController_recalculateWebKitPageCount__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 recalculateWebKitPageCount];
}

- (UIPrintPagesControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIPrintPagesControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIPrintInfo)printInfo
{
  return (UIPrintInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrintInfo:(id)a3
{
}

- (NSCache)cachedPageSizes
{
  return (NSCache *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedPageSizes:(id)a3
{
}

- (NSCache)cachedBasePageImages
{
  return (NSCache *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedBasePageImages:(id)a3
{
}

- (BOOL)usingWebKitFormatter
{
  return self->_usingWebKitFormatter;
}

- (void)setUsingWebKitFormatter:(BOOL)a3
{
  self->_usingWebKitFormatter = a3;
}

- (NSOperationQueue)webKitPrintingOperationsQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWebKitPrintingOperationsQueue:(id)a3
{
}

- (NSThread)webKitThumbnailGenerationThread
{
  return (NSThread *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWebKitThumbnailGenerationThread:(id)a3
{
}

- (NSURL)webKitThumbnailPDFURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWebKitThumbnailPDFURL:(id)a3
{
}

- (CGPDFDocument)webKitThumbnailPDFDocumentRef
{
  return self->_webKitThumbnailPDFDocumentRef;
}

- (void)setWebKitThumbnailPDFDocumentRef:(CGPDFDocument *)a3
{
  self->_webKitThumbnailPDFDocumentRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webKitThumbnailPDFURL, 0);
  objc_storeStrong((id *)&self->_webKitThumbnailGenerationThread, 0);
  objc_storeStrong((id *)&self->_webKitPrintingOperationsQueue, 0);
  objc_storeStrong((id *)&self->_cachedBasePageImages, 0);
  objc_storeStrong((id *)&self->_cachedPageSizes, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end