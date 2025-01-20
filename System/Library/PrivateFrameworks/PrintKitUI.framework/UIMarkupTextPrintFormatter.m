@interface UIMarkupTextPrintFormatter
- (CGRect)rectForPageAtIndex:(int64_t)a3;
- (NSString)markupText;
- (UIMarkupTextPrintFormatter)initWithMarkupText:(NSString *)markupText;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_recalcPageCount;
- (void)_resetPaginationInfo;
- (void)dealloc;
- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4;
- (void)removeFromPrintPageRenderer;
- (void)setMarkupText:(NSString *)markupText;
@end

@implementation UIMarkupTextPrintFormatter

- (UIMarkupTextPrintFormatter)initWithMarkupText:(NSString *)markupText
{
  v4 = markupText;
  v9.receiver = self;
  v9.super_class = (Class)UIMarkupTextPrintFormatter;
  v5 = [(UIPrintFormatter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1F28]), "initWithFrame:", 0.0, 0.0, 612.0, 798.0);
    webDocumentView = v5->_webDocumentView;
    v5->_webDocumentView = (UIWebDocumentView *)v6;

    [(UIMarkupTextPrintFormatter *)v5 setMarkupText:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIMarkupTextPrintFormatter;
  id v4 = [(UIPrintFormatter *)&v9 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1F28]), "initWithFrame:", 0.0, 0.0, 612.0, 798.0);
    uint64_t v6 = (void *)*((void *)v4 + 15);
    *((void *)v4 + 15) = v5;

    objc_storeStrong((id *)v4 + 17, self->_markupText);
    v7 = (void *)*((void *)v4 + 16);
    *((void *)v4 + 16) = 0;
  }
  return v4;
}

- (void)dealloc
{
  if (pthread_main_np() != 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__UIMarkupTextPrintFormatter_dealloc__block_invoke;
    block[3] = &unk_1E6DA1408;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  v3.receiver = self;
  v3.super_class = (Class)UIMarkupTextPrintFormatter;
  [(UIMarkupTextPrintFormatter *)&v3 dealloc];
}

void __37__UIMarkupTextPrintFormatter_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 120);
  *(void *)(v4 + 120) = 0;
}

- (void)setMarkupText:(NSString *)markupText
{
  uint64_t v4 = markupText;
  if (self->_markupText != v4)
  {
    v7 = v4;
    if (!-[NSString isEqualToString:](v4, "isEqualToString:"))
    {
      uint64_t v5 = (NSString *)[(NSString *)v7 copy];
      uint64_t v6 = self->_markupText;
      self->_markupText = v5;

      [(UIWebDocumentView *)self->_webDocumentView setLoadsSynchronously:1];
      [(UIWebDocumentView *)self->_webDocumentView loadHTMLString:self->_markupText baseURL:0];
      [(UIPrintFormatter *)self _setNeedsRecalc];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)removeFromPrintPageRenderer
{
  [(UIMarkupTextPrintFormatter *)self _resetPaginationInfo];
  v3.receiver = self;
  v3.super_class = (Class)UIMarkupTextPrintFormatter;
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
    block[2] = __50__UIMarkupTextPrintFormatter__resetPaginationInfo__block_invoke;
    block[3] = &unk_1E6DA1408;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __50__UIMarkupTextPrintFormatter__resetPaginationInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 128);
  *(void *)(v1 + 128) = 0;
}

- (int64_t)_recalcPageCount
{
  v23.receiver = self;
  v23.super_class = (Class)UIMarkupTextPrintFormatter;
  [(UIPrintFormatter *)&v23 _pageContentRect:1];
  CGFloat v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v22.receiver = self;
  v22.super_class = (Class)UIMarkupTextPrintFormatter;
  [(UIPrintFormatter *)&v22 _pageContentRect:0];
  CGFloat v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  if (CGRectIsEmpty(v24)) {
    return 0;
  }
  v25.origin.x = v12;
  v25.origin.y = v14;
  v25.size.width = v16;
  v25.size.height = v18;
  if (CGRectIsEmpty(v25)) {
    return 0;
  }
  v20 = [(UIWebDocumentView *)self->_webDocumentView beginPrintModeWithWidth:1 height:0 startOffset:v16 shrinkToFit:v18 forFrame:v6 - v14];
  paginationInfo = self->_paginationInfo;
  self->_paginationInfo = v20;

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
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGContextClipToRect(CurrentContext, v12);
  CGContextTranslateCTM(CurrentContext, x, y);
  [(UIWebDocumentView *)self->_webDocumentView drawPage:a4 - [(UIPrintFormatter *)self startPage] withPaginationInfo:self->_paginationInfo];
  CGContextRestoreGState(CurrentContext);
}

- (NSString)markupText
{
  return self->_markupText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markupText, 0);
  objc_storeStrong((id *)&self->_paginationInfo, 0);
  objc_storeStrong((id *)&self->_webDocumentView, 0);
}

@end