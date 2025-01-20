@interface _UIScrollViewAsyncScrollDecelerationState
@end

@implementation _UIScrollViewAsyncScrollDecelerationState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enqueuedCompletionResults, 0);
  objc_storeStrong((id *)&self->_scrollEvent, 0);
}

@end