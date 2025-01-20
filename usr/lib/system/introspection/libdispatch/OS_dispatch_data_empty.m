@interface OS_dispatch_data_empty
+ (id)allocWithZone:(_NSZone *)a3;
- (unint64_t)retainCount;
- (void)_getContext;
@end

@implementation OS_dispatch_data_empty

- (unint64_t)retainCount
{
  return -1;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &_dispatch_data_empty;
}

- (void)_getContext
{
  return 0;
}

@end