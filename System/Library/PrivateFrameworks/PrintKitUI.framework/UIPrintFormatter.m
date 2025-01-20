@interface UIPrintFormatter
- (BOOL)imagePDFAnnotations;
- (BOOL)requiresMainThread;
- (CGFloat)maximumContentHeight;
- (CGFloat)maximumContentWidth;
- (CGRect)_pageContentRect:(BOOL)a3;
- (CGRect)rectForPageAtIndex:(NSInteger)pageIndex;
- (NSInteger)pageCount;
- (NSInteger)startPage;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)perPageContentInsets;
- (UIPrintFormatter)init;
- (UIPrintPageRenderer)printPageRenderer;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_recalcPageCount;
- (void)_recalcIfNecessary;
- (void)_setNeedsRecalc;
- (void)removeFromPrintPageRenderer;
- (void)setContentInsets:(UIEdgeInsets)contentInsets;
- (void)setImagePDFAnnotations:(BOOL)a3;
- (void)setMaximumContentHeight:(CGFloat)maximumContentHeight;
- (void)setMaximumContentWidth:(CGFloat)maximumContentWidth;
- (void)setPerPageContentInsets:(UIEdgeInsets)perPageContentInsets;
- (void)setPrintPageRenderer:(id)a3;
- (void)setStartPage:(NSInteger)startPage;
@end

@implementation UIPrintFormatter

- (UIPrintFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIPrintFormatter;
  v2 = [(UIPrintFormatter *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_startPage = 0x7FFFFFFFFFFFFFFFLL;
    [(UIPrintFormatter *)v2 _setNeedsRecalc];
    *(int64x2_t *)&v3->_maximumContentHeight = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(_OWORD *)&v3->_perPageContentInsets.top = 0u;
    *(_OWORD *)&v3->_perPageContentInsets.bottom = 0u;
    *(_WORD *)&v3->_requiresMainThread = 257;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  *((void *)result + 3) = *(void *)&self->_maximumContentHeight;
  *((void *)result + 4) = *(void *)&self->_maximumContentWidth;
  long long v5 = *(_OWORD *)&self->_contentInsets.top;
  *(_OWORD *)((char *)result + 72) = *(_OWORD *)&self->_contentInsets.bottom;
  *(_OWORD *)((char *)result + 56) = v5;
  long long v6 = *(_OWORD *)&self->_perPageContentInsets.bottom;
  *(_OWORD *)((char *)result + 88) = *(_OWORD *)&self->_perPageContentInsets.top;
  *(_OWORD *)((char *)result + 104) = v6;
  return result;
}

- (void)removeFromPrintPageRenderer
{
  p_printPageRenderer = &self->_printPageRenderer;
  v4 = self;
  id WeakRetained = objc_loadWeakRetained((id *)p_printPageRenderer);
  [WeakRetained _removePrintFormatter:v4];
}

- (void)setMaximumContentWidth:(CGFloat)maximumContentWidth
{
  if (self->_maximumContentWidth != maximumContentWidth)
  {
    self->_maximumContentWidth = maximumContentWidth;
    [(UIPrintFormatter *)self _setNeedsRecalc];
  }
}

- (void)setMaximumContentHeight:(CGFloat)maximumContentHeight
{
  if (self->_maximumContentHeight != maximumContentHeight)
  {
    self->_maximumContentHeight = maximumContentHeight;
    [(UIPrintFormatter *)self _setNeedsRecalc];
  }
}

- (void)setContentInsets:(UIEdgeInsets)contentInsets
{
  if (contentInsets.left != self->_contentInsets.left
    || contentInsets.top != self->_contentInsets.top
    || contentInsets.right != self->_contentInsets.right
    || contentInsets.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = contentInsets;
    [(UIPrintFormatter *)self _setNeedsRecalc];
  }
}

- (void)setPerPageContentInsets:(UIEdgeInsets)perPageContentInsets
{
  if (perPageContentInsets.left != self->_perPageContentInsets.left
    || perPageContentInsets.top != self->_perPageContentInsets.top
    || perPageContentInsets.right != self->_perPageContentInsets.right
    || perPageContentInsets.bottom != self->_perPageContentInsets.bottom)
  {
    self->_perPageContentInsets = perPageContentInsets;
    [(UIPrintFormatter *)self _setNeedsRecalc];
  }
}

- (void)setPrintPageRenderer:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printPageRenderer);

  long long v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_printPageRenderer, obj);
    [(UIPrintFormatter *)self _setNeedsRecalc];
    long long v5 = obj;
  }
}

- (void)_setNeedsRecalc
{
  self->_needsRecalc = 1;
}

- (void)_recalcIfNecessary
{
  if (self->_needsRecalc)
  {
    self->_needsRecalc = 0;
    self->_pageCount = [(UIPrintFormatter *)self _recalcPageCount];
  }
}

- (NSInteger)pageCount
{
  return self->_pageCount;
}

- (int64_t)_recalcPageCount
{
  return 0;
}

- (CGRect)_pageContentRect:(BOOL)a3
{
  BOOL v3 = a3;
  CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  remainder.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  remainder.size = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printPageRenderer);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "printableRect", 0, 0, 0, 0);
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    remainder.origin.double x = v8;
    remainder.origin.double y = v10;
    remainder.size.double width = v12;
    remainder.size.double height = v14;
    [v7 headerHeight];
    CGFloat v17 = v16;
    v42.origin.double x = v9;
    v42.origin.double y = v11;
    v42.size.double width = v13;
    v42.size.double height = v15;
    CGRectDivide(v42, &v40, &remainder, v17, CGRectMinYEdge);
    [v7 footerHeight];
    CGRectDivide(remainder, &v40, &remainder, v18, CGRectMaxYEdge);
    v19.f64[0] = 0.0;
    if (v3) {
      v19.f64[0] = self->_contentInsets.top;
    }
    v20.f64[0] = self->_contentInsets.left;
    double v21 = v20.f64[0] + remainder.origin.x;
    remainder.origin.double x = v21;
    remainder.origin.double y = v19.f64[0] + remainder.origin.y;
    v20.f64[1] = v19.f64[0];
    v19.f64[0] = self->_contentInsets.right;
    CGSize v22 = (CGSize)vsubq_f64((float64x2_t)remainder.size, vaddq_f64(v20, v19));
    remainder.size = v22;
    double left = self->_perPageContentInsets.left;
    if (left > v21)
    {
      remainder.size.double width = v22.width - (left - v21);
      remainder.origin.double x = left;
    }
    double right = self->_perPageContentInsets.right;
    [v7 paperRect];
    if (right > v25 - remainder.size.width - remainder.origin.x)
    {
      double v26 = self->_perPageContentInsets.right;
      [v7 paperRect];
      remainder.size.double width = remainder.size.width - (v26 - (v27 - remainder.size.width - remainder.origin.x));
    }
    double top = self->_perPageContentInsets.top;
    if (top > remainder.origin.y)
    {
      remainder.size.double height = remainder.size.height - (top - remainder.origin.y);
      remainder.origin.double y = top;
    }
    double bottom = self->_perPageContentInsets.bottom;
    [v7 paperRect];
    double height = remainder.size.height;
    if (bottom > v31 - remainder.size.height - remainder.origin.y)
    {
      double v32 = self->_perPageContentInsets.bottom;
      [v7 paperRect];
      double height = remainder.size.height - (v32 - (v33 - remainder.size.height - remainder.origin.y));
    }
    v34.f64[0] = remainder.size.width;
    v34.f64[1] = height;
    float64x2_t v35 = (float64x2_t)vextq_s8(*(int8x16_t *)&self->_maximumContentHeight, *(int8x16_t *)&self->_maximumContentHeight, 8uLL);
    remainder.size = (CGSize)vmaxnmq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v35, v34), (int8x16_t)v34, (int8x16_t)v35), (float64x2_t)0);
  }

  double x = remainder.origin.x;
  double y = remainder.origin.y;
  double width = remainder.size.width;
  double v39 = remainder.size.height;
  result.size.double height = v39;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)rectForPageAtIndex:(NSInteger)pageIndex
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v7 = *MEMORY[0x1E4F1DB28];
  NSInteger startPage = self->_startPage;
  double v9 = v4;
  double v10 = v5;
  double v11 = v6;
  if (startPage <= pageIndex)
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    if (self->_pageCount + startPage > pageIndex)
    {
      [(UIPrintFormatter *)self _pageContentRect:startPage == pageIndex];
      double v7 = v12;
      double v9 = v13;
      double v10 = v14;
      double v11 = v15;
    }
  }
  v21.origin.double x = v7;
  v21.origin.double y = v9;
  v21.size.double width = v10;
  v21.size.double height = v11;
  IsEmptdouble y = CGRectIsEmpty(v21);
  if (IsEmpty) {
    double v17 = v3;
  }
  else {
    double v17 = v7;
  }
  if (IsEmpty) {
    double v18 = v4;
  }
  else {
    double v18 = v9;
  }
  if (IsEmpty) {
    double v19 = v5;
  }
  else {
    double v19 = v10;
  }
  if (IsEmpty) {
    double v20 = v6;
  }
  else {
    double v20 = v11;
  }
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (UIPrintPageRenderer)printPageRenderer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printPageRenderer);
  return (UIPrintPageRenderer *)WeakRetained;
}

- (CGFloat)maximumContentHeight
{
  return self->_maximumContentHeight;
}

- (CGFloat)maximumContentWidth
{
  return self->_maximumContentWidth;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)perPageContentInsets
{
  double top = self->_perPageContentInsets.top;
  double left = self->_perPageContentInsets.left;
  double bottom = self->_perPageContentInsets.bottom;
  double right = self->_perPageContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSInteger)startPage
{
  return self->_startPage;
}

- (void)setStartPage:(NSInteger)startPage
{
  self->_NSInteger startPage = startPage;
}

- (BOOL)requiresMainThread
{
  return self->_requiresMainThread;
}

- (BOOL)imagePDFAnnotations
{
  return self->_imagePDFAnnotations;
}

- (void)setImagePDFAnnotations:(BOOL)a3
{
  self->_imagePDFAnnotations = a3;
}

- (void).cxx_destruct
{
}

@end