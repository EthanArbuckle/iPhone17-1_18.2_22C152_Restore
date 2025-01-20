@interface BCProgressKitProgressInfo
- (BCProgressKitProgressInfo)initWithIdentifier:(id)a3 pageRange:(_NSRange)a4;
- (BOOL)isProgressValid;
- (NSString)identifier;
- (_NSRange)pageRange;
- (double)progress;
- (int64_t)currentPage;
- (void)setCurrentPage:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPageRange:(_NSRange)a3;
@end

@implementation BCProgressKitProgressInfo

- (BCProgressKitProgressInfo)initWithIdentifier:(id)a3 pageRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCProgressKitProgressInfo;
  v9 = [(BCProgressKitProgressInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_pageRange.NSUInteger location = location;
    v10->_pageRange.NSUInteger length = length;
    v10->_currentPage = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (BOOL)isProgressValid
{
  if ([(BCProgressKitProgressInfo *)self pageRange] == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v4 = [(BCProgressKitProgressInfo *)self currentPage];
  id v5 = [(BCProgressKitProgressInfo *)self pageRange];
  return v4 >= (unint64_t)v5 && v4 - (unint64_t)v5 < v6;
}

- (double)progress
{
  unsigned int v3 = [(BCProgressKitProgressInfo *)self isProgressValid];
  double result = -1.0;
  if (v3)
  {
    [(BCProgressKitProgressInfo *)self pageRange];
    if (v5)
    {
      int64_t v6 = [(BCProgressKitProgressInfo *)self currentPage];
      double v7 = (double)(unint64_t)(v6 - (void)[(BCProgressKitProgressInfo *)self pageRange] + 1);
      [(BCProgressKitProgressInfo *)self pageRange];
      return v7 / (double)v8;
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)currentPage
{
  return self->_currentPage;
}

- (void)setCurrentPage:(int64_t)a3
{
  self->_currentPage = a3;
}

- (_NSRange)pageRange
{
  NSUInteger length = self->_pageRange.length;
  NSUInteger location = self->_pageRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setPageRange:(_NSRange)a3
{
  self->_pageRange = a3;
}

- (void).cxx_destruct
{
}

@end