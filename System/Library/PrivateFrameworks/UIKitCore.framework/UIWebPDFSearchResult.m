@interface UIWebPDFSearchResult
- (CGRect)boundingBox;
- (NSArray)rects;
- (NSArray)rotationAngles;
- (NSArray)strings;
- (NSString)string;
- (unint64_t)pageIndex;
- (void)dealloc;
- (void)setBoundingBox:(CGRect)a3;
- (void)setPageIndex:(unint64_t)a3;
- (void)setRects:(id)a3;
- (void)setRotationAngles:(id)a3;
- (void)setString:(id)a3;
- (void)setStrings:(id)a3;
@end

@implementation UIWebPDFSearchResult

- (void)dealloc
{
  [(UIWebPDFSearchResult *)self setString:0];
  [(UIWebPDFSearchResult *)self setStrings:0];
  [(UIWebPDFSearchResult *)self setRects:0];
  [(UIWebPDFSearchResult *)self setRotationAngles:0];
  v3.receiver = self;
  v3.super_class = (Class)UIWebPDFSearchResult;
  [(UIWebPDFSearchResult *)&v3 dealloc];
}

- (NSArray)rotationAngles
{
  return self->rotationAngles;
}

- (void)setRotationAngles:(id)a3
{
}

- (unint64_t)pageIndex
{
  return self->pageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->pageIndex = a3;
}

- (NSArray)strings
{
  return self->strings;
}

- (void)setStrings:(id)a3
{
}

- (NSString)string
{
  return self->string;
}

- (void)setString:(id)a3
{
}

- (CGRect)boundingBox
{
  double x = self->boundingBox.origin.x;
  double y = self->boundingBox.origin.y;
  double width = self->boundingBox.size.width;
  double height = self->boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->boundingBodouble x = a3;
}

- (NSArray)rects
{
  return self->rects;
}

- (void)setRects:(id)a3
{
}

@end