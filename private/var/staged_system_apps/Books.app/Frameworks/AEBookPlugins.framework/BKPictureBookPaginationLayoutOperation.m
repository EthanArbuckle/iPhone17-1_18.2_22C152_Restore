@interface BKPictureBookPaginationLayoutOperation
- (unint64_t)pageOffsetForHref:(id)a3;
- (void)_notifyLayoutComplete;
- (void)execute;
@end

@implementation BKPictureBookPaginationLayoutOperation

- (unint64_t)pageOffsetForHref:(id)a3
{
  return 0;
}

- (void)_notifyLayoutComplete
{
  id v2 = [(BKPaginationLayoutOperation *)self layoutComplete:1];
}

- (void)execute
{
  if ([(BKPaginationOperation *)self isJobGenerationValid])
  {
    [(BKPictureBookPaginationLayoutOperation *)self performSelectorOnMainThread:"_notifyLayoutComplete" withObject:0 waitUntilDone:1];
  }
}

@end