@interface BKPaginationRecordJob
+ (id)jobName;
- (BKPaginationRecordJob)init;
- (CGSize)estimatedSize;
- (NSDictionary)cfiLocationRects;
- (unint64_t)pageCount;
- (void)setCfiLocationRects:(id)a3;
- (void)setEstimatedSize:(CGSize)a3;
- (void)setPageCount:(unint64_t)a3;
@end

@implementation BKPaginationRecordJob

+ (id)jobName
{
  return @"Record-One";
}

- (BKPaginationRecordJob)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKPaginationRecordJob;
  v2 = [(BKPaginationLayoutJob *)&v5 init];
  if (v2)
  {
    v3 = +[BKPaginationRecordJob jobName];
    [(BKJob *)v2 setName:v3];
  }
  return v2;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->_pageCount = a3;
}

- (NSDictionary)cfiLocationRects
{
  return self->_cfiLocationRects;
}

- (void)setCfiLocationRects:(id)a3
{
}

- (CGSize)estimatedSize
{
  double width = self->_estimatedSize.width;
  double height = self->_estimatedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEstimatedSize:(CGSize)a3
{
  self->_estimatedSize = a3;
}

- (void).cxx_destruct
{
}

@end