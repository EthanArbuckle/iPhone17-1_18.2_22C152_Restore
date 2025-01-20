@interface TSWReviewWidgetData
- (int64_t)currentPage;
- (void)setCurrentPage:(int64_t)a3;
@end

@implementation TSWReviewWidgetData

- (int64_t)currentPage
{
  id v2 = [(TSWReviewWidgetData *)self currentPageNumber];

  return (int64_t)[v2 integerValue];
}

- (void)setCurrentPage:(int64_t)a3
{
  v4 = +[NSNumber numberWithInteger:a3];

  [(TSWReviewWidgetData *)self setCurrentPageNumber:v4];
}

@end