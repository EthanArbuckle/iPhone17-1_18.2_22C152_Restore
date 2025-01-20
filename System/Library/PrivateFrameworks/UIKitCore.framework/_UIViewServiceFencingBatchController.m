@interface _UIViewServiceFencingBatchController
- (_UIViewServiceFencingBatchController)init;
@end

@implementation _UIViewServiceFencingBatchController

- (_UIViewServiceFencingBatchController)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIViewServiceFencingBatchController;
  v2 = [(_UIViewServiceFencingBatchController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    suspendedProxies = v2->_suspendedProxies;
    v2->_suspendedProxies = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    pendingProxies = v2->_pendingProxies;
    v2->_pendingProxies = (NSMutableSet *)v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingProxies, 0);
  objc_storeStrong((id *)&self->_suspendedProxies, 0);
}

@end