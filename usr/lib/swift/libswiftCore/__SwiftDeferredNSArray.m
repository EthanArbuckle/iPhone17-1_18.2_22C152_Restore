@interface __SwiftDeferredNSArray
- (int64_t)count;
@end

@implementation __SwiftDeferredNSArray

- (int64_t)count
{
  return *(void *)(*(void *)self->_nativeStorage + 16);
}

@end