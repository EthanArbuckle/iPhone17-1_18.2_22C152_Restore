@interface __NSGlobalBlock__
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (unint64_t)retainCount;
@end

@implementation __NSGlobalBlock__

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return 1;
}

@end