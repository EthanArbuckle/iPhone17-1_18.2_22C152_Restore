@interface VUIImageLoadContext
- (VUIImageLoadingOperation)imageLoadOperation;
- (unint64_t)requestCount;
- (void)setImageLoadOperation:(id)a3;
- (void)setRequestCount:(unint64_t)a3;
@end

@implementation VUIImageLoadContext

- (VUIImageLoadingOperation)imageLoadOperation
{
  return self->_imageLoadOperation;
}

- (void)setImageLoadOperation:(id)a3
{
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (void).cxx_destruct
{
}

@end