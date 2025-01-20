@interface UIWebPaginationInfo
- (CGSize)layoutSize;
- (CGSize)sizeForPageAtIndex:(int64_t)a3;
- (UIWebDocumentView)webDocumentView;
- (UIWebPaginationInfo)initWithDocumentView:(id)a3 scaleFactor:(double)a4 layoutSize:(CGSize)a5 pageRects:(id)a6;
- (double)lastPageHeight;
- (double)scaleFactor;
- (id)documentView;
- (id)pageRects;
- (unint64_t)pageCount;
- (void)dealloc;
- (void)setWebDocumentView:(id)a3;
@end

@implementation UIWebPaginationInfo

- (UIWebPaginationInfo)initWithDocumentView:(id)a3 scaleFactor:(double)a4 layoutSize:(CGSize)a5 pageRects:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = a3;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)UIWebPaginationInfo;
  v14 = [(UIWebPaginationInfo *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_documentView, a3);
    v15->_scaleFactor = a4;
    v15->_layoutSize.CGFloat width = width;
    v15->_layoutSize.CGFloat height = height;
    objc_storeStrong((id *)&v15->_pageRects, a6);
  }

  return v15;
}

- (void)dealloc
{
  [(UIWebDocumentView *)self->_webDocumentView releasePrintMode];
  v3.receiver = self;
  v3.super_class = (Class)UIWebPaginationInfo;
  [(UIWebPaginationInfo *)&v3 dealloc];
}

- (unint64_t)pageCount
{
  return [(NSArray *)self->_pageRects count];
}

- (double)lastPageHeight
{
  if (![(NSArray *)self->_pageRects count]) {
    return 0.0;
  }
  objc_super v3 = [(NSArray *)self->_pageRects lastObject];
  [v3 rectValue];
  double v4 = ceil(CGRectGetHeight(v6) * self->_scaleFactor);

  return v4;
}

- (CGSize)sizeForPageAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(NSArray *)self->_pageRects count] < a3)
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    v7 = [(NSArray *)self->_pageRects objectAtIndex:a3];
    [v7 rectValue];
    double v9 = v8;
    double v11 = v10;

    double scaleFactor = self->_scaleFactor;
    double v5 = v9 * scaleFactor;
    double v6 = v11 * scaleFactor;
  }
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (CGSize)layoutSize
{
  double width = self->_layoutSize.width;
  double height = self->_layoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)pageRects
{
  return self->_pageRects;
}

- (id)documentView
{
  return self->_documentView;
}

- (UIWebDocumentView)webDocumentView
{
  return self->_webDocumentView;
}

- (void)setWebDocumentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webDocumentView, 0);
  objc_storeStrong((id *)&self->_pageRects, 0);
  objc_storeStrong((id *)&self->_documentView, 0);
}

@end