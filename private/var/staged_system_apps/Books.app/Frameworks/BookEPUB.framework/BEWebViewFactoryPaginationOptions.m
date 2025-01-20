@interface BEWebViewFactoryPaginationOptions
- (BEWebViewFactoryPaginationOptions)init;
- (BEWebViewFactoryPaginationOptions)initWithFixedSize:(CGSize)a3;
- (BEWebViewFactoryPaginationOptions)initWithMode:(unint64_t)a3 usePaginationLineGrid:(BOOL)a4 respectPageBreaks:(BOOL)a5 isHorizontalScroll:(BOOL)a6 contentLayoutSize:(CGSize)a7 gapBetweenPages:(double)a8 viewportWidth:(double)a9 fixedLayoutSize:(CGSize)a10 pageLength:(double)a11 fontSize:(double)a12 developerExtrasEnabled:(BOOL)a13;
- (BOOL)developerExtrasEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHorizontalScroll;
- (BOOL)isPaginated;
- (BOOL)respectPageBreaks;
- (BOOL)usePaginationLineGrid;
- (CGSize)contentLayoutSize;
- (CGSize)fixedLayoutSize;
- (double)fontSize;
- (double)gapBetweenPages;
- (double)pageLength;
- (double)scrollPageLength;
- (double)viewportWidth;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int64_t)wkPaginationMode;
- (unint64_t)mode;
- (void)applyToWebView:(id)a3;
@end

@implementation BEWebViewFactoryPaginationOptions

- (BEWebViewFactoryPaginationOptions)init
{
  return -[BEWebViewFactoryPaginationOptions initWithMode:usePaginationLineGrid:respectPageBreaks:isHorizontalScroll:contentLayoutSize:gapBetweenPages:viewportWidth:fixedLayoutSize:pageLength:fontSize:developerExtrasEnabled:](self, "initWithMode:usePaginationLineGrid:respectPageBreaks:isHorizontalScroll:contentLayoutSize:gapBetweenPages:viewportWidth:fixedLayoutSize:pageLength:fontSize:developerExtrasEnabled:", 0, 0, 0, 0, 0, CGSizeZero.width, CGSizeZero.height, 0.0, 0.0, CGSizeZero.width, CGSizeZero.height, 0.0, 0.0);
}

- (BEWebViewFactoryPaginationOptions)initWithMode:(unint64_t)a3 usePaginationLineGrid:(BOOL)a4 respectPageBreaks:(BOOL)a5 isHorizontalScroll:(BOOL)a6 contentLayoutSize:(CGSize)a7 gapBetweenPages:(double)a8 viewportWidth:(double)a9 fixedLayoutSize:(CGSize)a10 pageLength:(double)a11 fontSize:(double)a12 developerExtrasEnabled:(BOOL)a13
{
  CGFloat height = a10.height;
  CGFloat width = a10.width;
  CGFloat v23 = a7.height;
  CGFloat v24 = a7.width;
  v27.receiver = self;
  v27.super_class = (Class)BEWebViewFactoryPaginationOptions;
  result = [(BEWebViewFactoryPaginationOptions *)&v27 init];
  if (result)
  {
    result->_mode = a3;
    result->_usePaginationLineGrid = a4;
    result->_respectPageBreaks = a5;
    result->_isHorizontalScroll = a6;
    result->_contentLayoutSize.CGFloat width = v24;
    result->_contentLayoutSize.CGFloat height = v23;
    result->_gapBetweenPages = a8;
    result->_viewportWidth = a9;
    result->_fixedLayoutSize.CGFloat width = width;
    result->_fixedLayoutSize.CGFloat height = height;
    result->_pageLength = a11;
    result->_fontSize = a12;
    result->_developerExtrasEnabled = a13;
  }
  return result;
}

- (int64_t)wkPaginationMode
{
  unint64_t mode = self->_mode;
  unint64_t v3 = mode - 2;
  int64_t v4 = mode - 1;
  if (v3 >= 3) {
    return 0;
  }
  else {
    return v4;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BUDynamicCast();
  v5 = (BEWebViewFactoryPaginationOptions *)objc_claimAutoreleasedReturnValue();

  if (!v5) {
    goto LABEL_7;
  }
  if (v5 == self)
  {
    char v10 = 1;
    goto LABEL_9;
  }
  id v6 = [(BEWebViewFactoryPaginationOptions *)v5 mode];
  if (v6 != (id)[(BEWebViewFactoryPaginationOptions *)self mode]) {
    goto LABEL_7;
  }
  unsigned int v7 = [(BEWebViewFactoryPaginationOptions *)v5 usePaginationLineGrid];
  if (v7 != [(BEWebViewFactoryPaginationOptions *)self usePaginationLineGrid]) {
    goto LABEL_7;
  }
  unsigned int v8 = [(BEWebViewFactoryPaginationOptions *)v5 respectPageBreaks];
  if (v8 != [(BEWebViewFactoryPaginationOptions *)self respectPageBreaks]) {
    goto LABEL_7;
  }
  unsigned int v9 = [(BEWebViewFactoryPaginationOptions *)v5 isHorizontalScroll];
  if (v9 != [(BEWebViewFactoryPaginationOptions *)self isHorizontalScroll]) {
    goto LABEL_7;
  }
  [(BEWebViewFactoryPaginationOptions *)v5 contentLayoutSize];
  double v13 = v12;
  double v15 = v14;
  [(BEWebViewFactoryPaginationOptions *)self contentLayoutSize];
  char v10 = 0;
  if (v13 == v17 && v15 == v16)
  {
    [(BEWebViewFactoryPaginationOptions *)v5 gapBetweenPages];
    double v19 = v18;
    [(BEWebViewFactoryPaginationOptions *)self gapBetweenPages];
    if (v19 != v20
      || ([(BEWebViewFactoryPaginationOptions *)v5 viewportWidth],
          double v22 = v21,
          [(BEWebViewFactoryPaginationOptions *)self viewportWidth],
          v22 != v23))
    {
LABEL_7:
      char v10 = 0;
      goto LABEL_9;
    }
    [(BEWebViewFactoryPaginationOptions *)v5 fixedLayoutSize];
    double v25 = v24;
    double v27 = v26;
    [(BEWebViewFactoryPaginationOptions *)self fixedLayoutSize];
    char v10 = 0;
    if (v25 == v29 && v27 == v28)
    {
      [(BEWebViewFactoryPaginationOptions *)v5 pageLength];
      double v31 = v30;
      [(BEWebViewFactoryPaginationOptions *)self pageLength];
      char v10 = v31 == v32;
    }
  }
LABEL_9:

  return v10;
}

- (BOOL)isPaginated
{
  return (char *)[(BEWebViewFactoryPaginationOptions *)self mode] == (char *)&def_7BFC0 + 2
      || (char *)[(BEWebViewFactoryPaginationOptions *)self mode] == (char *)&def_7BFC0 + 3
      || (int *)[(BEWebViewFactoryPaginationOptions *)self mode] == &dword_4;
}

- (double)scrollPageLength
{
  unint64_t v3 = [(BEWebViewFactoryPaginationOptions *)self mode];
  double result = 0.0;
  if (!v3)
  {
    unsigned int v5 = [(BEWebViewFactoryPaginationOptions *)self isHorizontalScroll];
    [(BEWebViewFactoryPaginationOptions *)self contentLayoutSize];
    if (!v5) {
      return v6;
    }
  }
  return result;
}

- (BEWebViewFactoryPaginationOptions)initWithFixedSize:(CGSize)a3
{
  return -[BEWebViewFactoryPaginationOptions initWithMode:usePaginationLineGrid:respectPageBreaks:isHorizontalScroll:contentLayoutSize:gapBetweenPages:viewportWidth:fixedLayoutSize:pageLength:fontSize:developerExtrasEnabled:](self, "initWithMode:usePaginationLineGrid:respectPageBreaks:isHorizontalScroll:contentLayoutSize:gapBetweenPages:viewportWidth:fixedLayoutSize:pageLength:fontSize:developerExtrasEnabled:", 1, 0, 0, 0, 0, CGSizeZero.width, CGSizeZero.height, 0.0);
}

- (void)applyToWebView:(id)a3
{
  id v4 = a3;
  [v4 _setPaginationMode:[self wkPaginationMode]];
  [v4 _setPageLength:self->_pageLength];
  [v4 _setGapBetweenPages:self->_gapBetweenPages];
  [v4 _setPaginationBehavesLikeColumns:!self->_respectPageBreaks];
  [v4 _setPaginationLineGridEnabled:self->_usePaginationLineGrid];
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)usePaginationLineGrid
{
  return self->_usePaginationLineGrid;
}

- (BOOL)respectPageBreaks
{
  return self->_respectPageBreaks;
}

- (BOOL)isHorizontalScroll
{
  return self->_isHorizontalScroll;
}

- (CGSize)contentLayoutSize
{
  double width = self->_contentLayoutSize.width;
  double height = self->_contentLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)gapBetweenPages
{
  return self->_gapBetweenPages;
}

- (double)viewportWidth
{
  return self->_viewportWidth;
}

- (CGSize)fixedLayoutSize
{
  double width = self->_fixedLayoutSize.width;
  double height = self->_fixedLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)pageLength
{
  return self->_pageLength;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (BOOL)developerExtrasEnabled
{
  return self->_developerExtrasEnabled;
}

- (id)dictionaryRepresentation
{
  v8[0] = @"pageLength";
  [(BEWebViewFactoryPaginationOptions *)self pageLength];
  unint64_t v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v9[0] = v3;
  v8[1] = @"gapBetweenPages";
  [(BEWebViewFactoryPaginationOptions *)self gapBetweenPages];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v9[1] = v4;
  v8[2] = @"mode";
  unsigned int v5 = +[NSNumber numberWithUnsignedInteger:[(BEWebViewFactoryPaginationOptions *)self mode]];
  v9[2] = v5;
  double v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(BEWebViewFactoryPaginationOptions *)self dictionaryRepresentation];
  uint64_t v6 = 0;
  unint64_t v3 = +[NSJSONSerialization dataWithJSONObject:v2 options:0 error:&v6];

  if ([v3 length]) {
    id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end