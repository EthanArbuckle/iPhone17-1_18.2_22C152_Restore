@interface __NSMallocBlock__
- (__NSMallocBlock__)retain;
- (unint64_t)retainCount;
@end

@implementation __NSMallocBlock__

- (__NSMallocBlock__)retain
{
  return self;
}

- (unint64_t)retainCount
{
  return 1;
}

@end