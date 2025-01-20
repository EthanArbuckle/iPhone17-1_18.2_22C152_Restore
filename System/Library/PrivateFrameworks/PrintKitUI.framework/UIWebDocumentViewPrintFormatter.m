@interface UIWebDocumentViewPrintFormatter
- (CGRect)rectForPageAtIndex:(int64_t)a3;
- (WebFrame)frameToPrint;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_recalcPageCount;
- (void)_resetPaginationInfo;
- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4;
- (void)removeFromPrintPageRenderer;
- (void)setFrameToPrint:(id)a3;
@end

@implementation UIWebDocumentViewPrintFormatter

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIWebDocumentViewPrintFormatter;
  v4 = [(UIViewPrintFormatter *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 16, self->_paginationInfo);
  }
  return v5;
}

- (void)removeFromPrintPageRenderer
{
  [(UIWebDocumentViewPrintFormatter *)self _resetPaginationInfo];
  v3.receiver = self;
  v3.super_class = (Class)UIWebDocumentViewPrintFormatter;
  [(UIPrintFormatter *)&v3 removeFromPrintPageRenderer];
}

- (void)_resetPaginationInfo
{
  if (pthread_main_np() == 1)
  {
    paginationInfo = self->_paginationInfo;
    self->_paginationInfo = 0;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__UIWebDocumentViewPrintFormatter__resetPaginationInfo__block_invoke;
    block[3] = &unk_1E6DA1408;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __55__UIWebDocumentViewPrintFormatter__resetPaginationInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 128);
  *(void *)(v1 + 128) = 0;
}

- (int64_t)_recalcPageCount
{
  v24.receiver = self;
  v24.super_class = (Class)UIWebDocumentViewPrintFormatter;
  [(UIPrintFormatter *)&v24 _pageContentRect:1];
  CGFloat v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v23.receiver = self;
  v23.super_class = (Class)UIWebDocumentViewPrintFormatter;
  [(UIPrintFormatter *)&v23 _pageContentRect:0];
  CGFloat v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  if (CGRectIsEmpty(v25)) {
    return 0;
  }
  v26.origin.x = v12;
  v26.origin.y = v14;
  v26.size.width = v16;
  v26.size.height = v18;
  if (CGRectIsEmpty(v26)) {
    return 0;
  }
  v20 = [(UIWebDocumentViewPrintFormatter *)self _webDocumentView];
  v21 = [v20 beginPrintModeWithWidth:1 height:self->_frameToPrint startOffset:v16 shrinkToFit:v18 forFrame:v6 - v14];
  paginationInfo = self->_paginationInfo;
  self->_paginationInfo = v21;

  return [(UIWebPaginationInfo *)self->_paginationInfo pageCount];
}

- (CGRect)rectForPageAtIndex:(int64_t)a3
{
  [(UIPrintFormatter *)self _pageContentRect:[(UIPrintFormatter *)self startPage] == a3];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(UIPrintFormatter *)self _recalcIfNecessary];
  paginationInfo = self->_paginationInfo;
  if (paginationInfo)
  {
    [(UIWebPaginationInfo *)paginationInfo sizeForPageAtIndex:a3 - [(UIPrintFormatter *)self startPage]];
    double v10 = v14;
    double v12 = v15;
  }
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  double v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGContextClipToRect(CurrentContext, v13);
  CGContextTranslateCTM(CurrentContext, x, y);
  double v11 = [(UIWebDocumentViewPrintFormatter *)self _webDocumentView];
  objc_msgSend(v11, "drawPage:withPaginationInfo:", a4 - -[UIPrintFormatter startPage](self, "startPage"), self->_paginationInfo);

  CGContextRestoreGState(CurrentContext);
}

- (WebFrame)frameToPrint
{
  return self->_frameToPrint;
}

- (void)setFrameToPrint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameToPrint, 0);
  objc_storeStrong((id *)&self->_paginationInfo, 0);
}

@end