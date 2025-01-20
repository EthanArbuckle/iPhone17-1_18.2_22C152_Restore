@interface NSUndoManager(IC)
+ (id)shared;
- (uint64_t)ic_isUndoingOrRedoing;
@end

@implementation NSUndoManager(IC)

+ (id)shared
{
  if (shared_token != -1) {
    dispatch_once(&shared_token, &__block_literal_global_26);
  }
  v0 = (void *)shared_sharedUndoManager;
  return v0;
}

- (uint64_t)ic_isUndoingOrRedoing
{
  if ([a1 isUndoing]) {
    return 1;
  }
  return [a1 isRedoing];
}

@end